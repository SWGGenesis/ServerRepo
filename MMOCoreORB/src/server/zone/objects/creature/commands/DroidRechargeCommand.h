#ifndef DROIDRECHARGECOMMAND_H_
#define DROIDRECHARGECOMMAND_H_

#include "server/zone/objects/creature/commands/QueueCommand.h"
#include "server/zone/objects/creature/ai/DroidObject.h"
#include "server/zone/objects/player/PlayerObject.h"

class DroidRechargeCommand : public QueueCommand {
public:
    DroidRechargeCommand(const String& name, ZoneProcessServer* server)
        : QueueCommand(name, server) {
    }

    int doQueueCommand(CreatureObject* player, const uint64& target, const UnicodeString& arguments) const {
        if (!checkStateMask(player))
            return INVALIDSTATE;

        if (!checkInvalidLocomotions(player))
            return INVALIDLOCOMOTION;

        if (!player->isPlayerCreature())
            return GENERALERROR;

        // Get the player's current target
        ManagedReference<SceneObject*> targetObject = player->getZoneServer()->getObject(player->getTargetID());
        if (targetObject == nullptr || !targetObject->isDroidObject()) {
            player->sendSystemMessage("You must target a droid to recharge it.");
            return GENERALERROR;
        }

        // Cast to DroidObject
        DroidObject* droidPet = cast<DroidObject*>(targetObject.get());
        if (droidPet == nullptr || droidPet->getLinkedCreature().get() != player) {
            player->sendSystemMessage("This droid is not linked to you.");
            return GENERALERROR;
        }

        // Check for battery in the player's top-level inventory
        ManagedReference<SceneObject*> inventory = player->getSlottedObject("inventory");
        if (inventory == nullptr) {
            player->sendSystemMessage("Error: Inventory not found.");
            return GENERALERROR;
        }

        bool hasBattery = false;
        for (int i = 0; i < inventory->getContainerObjectsSize(); ++i) {
            ManagedReference<SceneObject*> item = inventory->getContainerObject(i);
            if (item == nullptr) continue;

            // Check for battery template
            if (item->getObjectTemplate()->getFullTemplateString().contains("droid_battery")) {
                hasBattery = true;
                break;
            }
        }

        if (!hasBattery) {
            player->sendSystemMessage("Recharge failed. You need a droid battery in your inventory.");
            return GENERALERROR;
        }

        // Lock and recharge
        Locker plocker(player, droidPet);
        droidPet->rechargeFromBattery(player); // Battery consumption handled here

        // Always send success if the battery is found
        player->sendSystemMessage("Your droid has been successfully recharged.");
        return SUCCESS;
    }
};

#endif // DROIDRECHARGECOMMAND_H_
