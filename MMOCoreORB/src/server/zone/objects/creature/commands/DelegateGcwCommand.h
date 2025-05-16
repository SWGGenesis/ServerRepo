#ifndef DELEGATEGCWCOMMAND_H_
#define DELEGATEGCWCOMMAND_H_

#include "server/zone/objects/scene/SceneObject.h"
#include "server/zone/managers/faction/FactionManager.h"
#include "server/zone/managers/gcw/GCWManager.h" 
#include "server/zone/objects/player/sui/transferbox/SuiTransferBox.h"
#include "server/zone/objects/player/sui/callbacks/DelegateSuiCallback.h"
#include "server/zone/objects/player/PlayerObject.h"
#include "server/zone/managers/player/PlayerManager.h"
#include "server/zone/objects/player/FactionStatus.h"
#include "QueueCommand.h"

class DelegateGcwCommand : public QueueCommand {
public:
    static constexpr const char* IMPERIAL_GCW_CURRENCY = "gcw_currency_imperial";
    static constexpr const char* REBEL_GCW_CURRENCY = "gcw_currency_rebel";
    
    DelegateGcwCommand(const String& name, ZoneProcessServer* server)
        : QueueCommand(name, server) {
    }
    
    static String getGcwXpType(CreatureObject* creature) {
        uint32 faction = creature->getFaction();
        
        if (faction == Factions::FACTIONIMPERIAL) {
            return IMPERIAL_GCW_CURRENCY;
        } else if (faction == Factions::FACTIONREBEL) {
            return REBEL_GCW_CURRENCY;
        }
        return "";
    }
    
    static bool isValidFaction(CreatureObject* creature) {
        uint32 faction = creature->getFaction();
        return faction == Factions::FACTIONIMPERIAL || faction == Factions::FACTIONREBEL;
    }

    int doQueueCommand(CreatureObject* creature, const uint64& target, const UnicodeString& arguments) const {
        if (!checkStateMask(creature))
            return INVALIDSTATE;
    
        if (!checkInvalidLocomotions(creature))
            return INVALIDLOCOMOTION;
        
        ManagedReference<CreatureObject*> targetCreature = nullptr;
        int amount = 0;
        
        // Parse arguments
        StringTokenizer args(arguments.toString());
        
        if (args.hasMoreTokens()) {
            String firstArg;
            args.getStringToken(firstArg);
            
            // Check if first argument is a number (amount)
            try {
                amount = Integer::valueOf(firstArg);
                
                // If we got amount from first arg, use current target
                targetCreature = creature->getZoneServer()->getObject(creature->getTargetID()).castTo<CreatureObject*>();
                
                if (targetCreature == nullptr) {
                    creature->sendSystemMessage("You must either target a player or specify a player name to delegate GCW experience to.");
                    return INVALIDTARGET;
                }
            } catch (Exception& e) {
                // First argument is player name, next should be amount
                String playerName = firstArg;
                
                if (args.hasMoreTokens()) {
                    try {
                        String amountStr;
                        args.getStringToken(amountStr);
                        amount = Integer::valueOf(amountStr);
                    } catch (Exception& e) {
                        creature->sendSystemMessage("Invalid amount specified. Usage: /delegategcw [player] amount");
                        return INVALIDPARAMETERS;
                    }
                    
                    // Find player by name
                    PlayerManager* playerManager = server->getPlayerManager();
                    targetCreature = playerManager->getPlayer(playerName);
                    
                    if (targetCreature == nullptr) {
                        creature->sendSystemMessage("Player '" + playerName + "' not found or is offline.");
                        return INVALIDTARGET;
                    }
                } else {
                    creature->sendSystemMessage("You must specify an amount to delegate. Usage: /delegategcw [player] amount");
                    return INVALIDPARAMETERS;
                }
            }
        } else {
            creature->sendSystemMessage("Usage: /delegategcw [player] amount");
            return INVALIDPARAMETERS;
        }
        
        if (amount <= 0) {
            creature->sendSystemMessage("You must specify a positive amount to delegate.");
            return INVALIDPARAMETERS;
        }
        
        Locker clocker(targetCreature, creature);
        
        ManagedReference<PlayerObject*> delegatorPO = creature->getPlayerObject();
        PlayerObject* targetPlayerObject = targetCreature->getPlayerObject();
        
        if (targetPlayerObject == nullptr || delegatorPO == nullptr) {
            creature->sendSystemMessage("The target must be a valid player character.");
            return INVALIDTARGET;
        }
        
        if (targetCreature->getObjectID() == creature->getObjectID()) {
            creature->sendSystemMessage("You cannot delegate experience to yourself.");
            return INVALIDTARGET;
        }
        
        // Check if both characters are on the same account
        if (delegatorPO->getAccountID() != targetPlayerObject->getAccountID()) {
            creature->sendSystemMessage("You can only delegate experience to characters on your own account.");
            return GENERALERROR;
        }
        
        if (!isValidFaction(creature)) {
            creature->sendSystemMessage("You must be aligned with either the Rebel Alliance or Imperial forces to use this command.");
            return GENERALERROR;
        }
        
        if (creature->getFaction() != targetCreature->getFaction()) {
            creature->sendSystemMessage("You can only delegate experience to members of your own faction.");
            return GENERALERROR;
        }
        
        // Check if delegator is a Jedi (should NOT be)
        if (creature->hasSkill("jedi_padawan_novice")) {
            creature->sendSystemMessage("Jedi characters cannot delegate GCW experience.");
            return GENERALERROR;
        }
        
        // Check if target is a Jedi (must be)
        if (!targetPlayerObject->isJedi()) {
            creature->sendSystemMessage("You can only delegate experience to Jedi characters.");
            return GENERALERROR;
        }
        
        String factionCurrency = getGcwXpType(creature);
        if (factionCurrency.isEmpty()) {
            creature->sendSystemMessage("Error determining faction currency type.");
            return GENERALERROR;
        }
        
        // Get player manager for experience modification
        PlayerManager* playerManager = server->getPlayerManager();
        if (playerManager == nullptr) {
            creature->sendSystemMessage("Error accessing player manager.");
            return GENERALERROR;
        }
        
        // Check current balance
        int currentPoints = delegatorPO->getExperience(factionCurrency);
        if (currentPoints < amount) {
            creature->sendSystemMessage("You don't have enough GCW points to delegate that amount. You have " + String::valueOf(currentPoints) + " points.");
            return GENERALERROR;
        }
        
        // Remove points from delegator
        playerManager->awardExperience(creature, factionCurrency, -amount, true);
        
        // Add points to target
        playerManager->awardExperience(targetCreature, factionCurrency, amount, true);
        
        // Send success messages to both players
        StringIdChatParameter messageToDelegator("GCW", "You have successfully delegated %DI GCW points to %TT.");
        messageToDelegator.setDI(amount);
        messageToDelegator.setTT(targetCreature->getDisplayedName());
        creature->sendSystemMessage(messageToDelegator);
        
        StringIdChatParameter messageToTarget("GCW", "You have received %DI GCW points from %TT.");
        messageToTarget.setDI(amount);
        messageToTarget.setTT(creature->getDisplayedName());
        targetCreature->sendSystemMessage(messageToTarget);
        
        return SUCCESS;
    }
};
    
#endif //DELEGATEGCWCOMMAND_H_