/*
 * GuildstatusCommand.h
 *
 * Provides guild member listing, galaxy‑wide sponsorship, and galaxy‑wide acceptance of sponsored players.
 */

 #ifndef GUILDSTATUSCOMMAND_H_
 #define GUILDSTATUSCOMMAND_H_
 
 #include "server/zone/objects/scene/SceneObject.h"
 #include "server/zone/ZoneServer.h"
 #include "server/zone/objects/guild/GuildObject.h"
 #include "server/zone/managers/player/PlayerManager.h"
 #include "server/zone/managers/guild/GuildManager.h"
 #include "server/zone/objects/creature/commands/QueueCommand.h"
 
 class GuildstatusCommand : public QueueCommand {
 public:
     GuildstatusCommand(const String& name, ZoneProcessServer* server)
       : QueueCommand(name, server) {}
 
     int doQueueCommand(CreatureObject* creature, const uint64& target, const UnicodeString& arguments) const override {
         if (!checkStateMask(creature)) return INVALIDSTATE;
         if (!checkInvalidLocomotions(creature)) return INVALIDLOCOMOTION;
         if (!creature->isPlayerCreature()) return INVALIDPARAMETERS;
 
         ManagedReference<CreatureObject*> player = cast<CreatureObject*>(creature);
         ZoneServer* zs = server->getZoneServer();
         ManagedReference<PlayerManager*> pm = server->getPlayerManager();
         ManagedReference<GuildManager*> gm = zs->getGuildManager();
 
         UnicodeTokenizer tok(arguments);
         tok.setDelimeter(" ");
         if (!tok.hasMoreTokens()) {
             showHelp(player);
             return SUCCESS;
         }
         UnicodeString cmd;
         tok.getUnicodeToken(cmd);
         std::string c = cmd.toString();
 
         if (c == "list") {
             // /guildStatus list [-online]
             if (!player->isInGuild()) {
                 player->sendSystemMessage("You are not in a guild.");
                 return GENERALERROR;
             }
             bool onlineOnly = false;
             if (tok.hasMoreTokens()) {
                 UnicodeString opt;
                 tok.getUnicodeToken(opt);
                 if (opt.toString() == "-online") onlineOnly = true;
                 else {
                     showHelp(player);
                     return INVALIDPARAMETERS;
                 }
             }
             listMembers(player, zs, onlineOnly);
             return SUCCESS;
         }
 
         else if (c == "sponsor") {
             // /guildStatus sponsor <playerName>
             if (!player->isInGuild()) {
                 player->sendSystemMessage("You are not in a guild.");
                 return GENERALERROR;
             }
             ManagedReference<GuildObject*> guild = player->getGuildObject().get();
             if (!guild->hasSponsorPermission(player->getObjectID())) {
                 player->sendSystemMessage("You do not have permission to sponsor.");
                 return GENERALERROR;
             }
             if (!tok.hasMoreTokens()) {
                 player->sendSystemMessage("SYNTAX: /guildStatus sponsor <playerName>");
                 return INVALIDPARAMETERS;
             }
             UnicodeString uName;
             tok.getUnicodeToken(uName);
             String targetName = uName.toString();
             gm->sponsorPlayer(player.get(), targetName);
             return SUCCESS;
         }
 
         else if (c == "accept") {
             // /guildStatus accept <playerName>
             if (!player->isInGuild()) {
                 player->sendSystemMessage("You are not in a guild.");
                 return GENERALERROR;
             }
             ManagedReference<GuildObject*> guild = player->getGuildObject().get();
             if (!guild->hasAcceptPermission(player->getObjectID())) {
                 player->sendSystemMessage("You do not have permission to accept sponsorships.");
                 return GENERALERROR;
             }
             if (!tok.hasMoreTokens()) {
                 player->sendSystemMessage("SYNTAX: /guildStatus accept <playerName>");
                 return INVALIDPARAMETERS;
             }
             UnicodeString uName;
             tok.getUnicodeToken(uName);
             String targetName = uName.toString();
             uint64 pid = pm->getObjectID(targetName);
             gm->acceptSponsoredPlayer(player.get(), pid);
             return SUCCESS;
         }
 
         else if (c == "help") {
             showHelp(player);
             return SUCCESS;
         }
 
         else {
             // /guildStatus <playerName>
             return showPlayerStatus(player, zs, target, c);
         }
     }
 
 private:
     void showHelp(CreatureObject* player) const {
         player->sendSystemMessage("SYNTAX: /guildStatus list [-online]");
         player->sendSystemMessage("SYNTAX: /guildStatus sponsor <playerName>");
         player->sendSystemMessage("SYNTAX: /guildStatus accept <playerName>");
         player->sendSystemMessage("SYNTAX: /guildStatus <playerName>");
     }
 
     void listMembers(CreatureObject* player, ZoneServer* zs, bool onlineOnly) const {
         ManagedReference<GuildObject*> guild = player->getGuildObject().get();
         StringBuffer sb;
         sb << "Guild Members" << (onlineOnly ? " (online)" : "") << "\n";
         for (int i = 0; i < guild->getTotalMembers(); ++i) {
             uint64 pid = guild->getMember(i);
             ManagedReference<SceneObject*> sobj = zs->getObject(pid);
             bool online = sobj && sobj->isCreatureObject() && cast<CreatureObject*>(sobj.get())->isOnline();
             sb << zs->getPlayerManager()->getPlayerName(pid);
             if (online) sb << " - online";
             sb << "\n";
         }
         player->sendSystemMessage(sb.toString());
     }
 
     int showPlayerStatus(CreatureObject* player, ZoneServer* zs, const uint64& target, const std::string& name) const {
         uint64 pid = zs->getPlayerManager()->getObjectID(name);
         ManagedReference<SceneObject*> obj = zs->getObject(pid);
         if (!obj || !obj->isCreatureObject()) obj = zs->getObject(target);
         if (!obj || !obj->isCreatureObject()) {
             player->sendSystemMessage("You may only check guild status of players.");
             return GENERALERROR;
         }
         CreatureObject* tgt = cast<CreatureObject*>(obj.get());
         if (!tgt->isInGuild()) {
             StringIdChatParameter p("@base_player:guildstatus_not_in_guild");
             p.setTU(tgt->getDisplayedName());
             player->sendSystemMessage(p);
             return GENERALERROR;
         }
         ManagedReference<GuildObject*> guild = tgt->getGuildObject().get();
         bool leader = (guild->getGuildLeaderID() == tgt->getObjectID());
         String title = guild->getGuildMemberTitle(tgt->getObjectID());
         String sid = String("@base_player:guildstatus_") + (leader ? "leader" : "member");
         if (!title.isEmpty()) sid += "_title";
         StringIdChatParameter p;
         p.setStringId(sid);
         p.setTU(tgt->getDisplayedName());
         p.setTT(guild->getGuildName());
         if (!title.isEmpty()) p.setTO(title);
         player->sendSystemMessage(p);
         return SUCCESS;
     }
 };
 
 #endif // GUILDSTATUSCOMMAND_H_
 