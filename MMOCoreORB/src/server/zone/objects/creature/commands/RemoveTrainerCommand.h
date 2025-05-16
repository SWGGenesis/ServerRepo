/*
				Copyright <SWGEmu>
		See file COPYING for copying conditions.*/

        #ifndef REMOVETRAINERCOMMAND_H_
        #define REMOVETRAINERCOMMAND_H_
        
        #include "server/zone/objects/scene/SceneObject.h"
        #include "server/zone/objects/creature/CreatureObject.h"
        #include "server/zone/objects/player/PlayerObject.h"
        #include "server/zone/objects/region/CityRegion.h"
        #include "server/zone/managers/city/CityManager.h"
        
        class RemoveTrainerCommand : public QueueCommand {
        public:
        
            RemoveTrainerCommand(const String& name, ZoneProcessServer* server)
                : QueueCommand(name, server) {
            }
        
            int doQueueCommand(CreatureObject* creature, const uint64& target, const UnicodeString& arguments) const {
                if (!checkStateMask(creature))
                    return INVALIDSTATE;
        
                if (!checkInvalidLocomotions(creature))
                    return INVALIDLOCOMOTION;
        
                ManagedReference<SceneObject*> targetObject = creature->getZoneServer()->getObject(creature->getTargetID());
                
                if (targetObject == nullptr) {
                    creature->sendSystemMessage("@city/city:mt_remove_not_yours"); // "Please target a valid trainer first"
                    return INVALIDTARGET;
                }
        
                CreatureObject* trainer = targetObject->asCreatureObject();
                if (trainer == nullptr) {
                    creature->sendSystemMessage("@city/city:mt_remove_not_yours"); // "You can only remove creature trainers"
                    return INVALIDTARGET;
                }
        
                ManagedReference<CityRegion*> city = creature->getCityRegion().get();
                if (city == nullptr) {
                    creature->sendSystemMessage("@city/city:mt_remove_not_mayor");
                    return GENERALERROR;
                }
        
                if (!city->isMayor(creature->getObjectID())) {
                    creature->sendSystemMessage("@city/city:mt_remove_not_mayor");
                    return GENERALERROR;
                }
        
                if (!creature->isInRange(trainer, 32.0f)) {
                    creature->sendSystemMessage("@city/city:mt_remove_not_yours"); // "You must be closer to the trainer"
                    return GENERALERROR;
                }
        
                Locker clocker(city, creature);
                Locker trainerLock(trainer, creature);
        
                city->removeSkillTrainers(trainer);
        
                bool stillExists = false;
                for (int i = 0; i < city->getSkillTrainerCount(); ++i) {
                    if (city->getCitySkillTrainer(i) == trainer) {
                        stillExists = true;
                        break;
                    }
                }
        
                if (stillExists) {
                    creature->sendSystemMessage("@city/city:mt_remove_failed");
                    return GENERALERROR;
                }
        
                if (trainer->getZone() != nullptr) {
                    trainer->destroyObjectFromWorld(true);
                }
                trainer->destroyObjectFromDatabase(true);
        
                creature->sendSystemMessage("@city/city:mt_remove_success");
                return SUCCESS;
            }
        };
        
        #endif /* REMOVETRAINERCOMMAND_H_ */