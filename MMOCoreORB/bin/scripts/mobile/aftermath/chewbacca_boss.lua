chewbacca_boss = Creature:new {
	objectName = "@mob/creature_names:chewbacca",
	socialGroup = "self",
	faction = "",
	level = 333,
	chanceHit = 130,
	damageMin = 1000,
	damageMax = 2500,
	baseXp = 9336,
	baseHAM = 7000000,
	baseHAMmax = 7000000,
	armor = 3,
	resists = {90,90,90,90,90,90,90,90,50},
	meatType = "",
	meatAmount = 0,
	hideType = "",
	hideAmount = 0,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0,
	ferocity = 0,
	pvpBitmask = AGGRESSIVE + ATTACKABLE + ENEMY,
	creatureBitmask = KILLER,
	optionsBitmask = AIENABLED,
	diet = HERBIVORE,
	scale = 1.15,

	templates = {"object/mobile/chewbacca.iff"},
	lootGroups = {
	},
	weapons = {"chewbacca_weapons"},
	conversationTemplate = "",
	attacks = merge(riflemanmaster)
}

CreatureTemplates:addCreatureTemplate(chewbacca_boss, "chewbacca_boss")