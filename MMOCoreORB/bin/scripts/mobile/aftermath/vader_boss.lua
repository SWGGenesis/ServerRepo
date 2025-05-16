vader_boss = Creature:new {
	objectName = "@mob/creature_names:darth_vader",
	socialGroup = "self",
	faction = "",
	level = 336,
	chanceHit = 300,
	damageMin = 1800,
	damageMax = 3000,
	baseXp = 9336,
	baseHAM = 7000000,
	baseHAMmax = 7000000,
	armor = 3,
	resists = {95,95,95,95,95,95,95,95,95},
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
    scale = 1.25,

	templates = {"object/mobile/darth_vader.iff"},
	lootGroups = {
	},
	weapons = {"darth_vader_weapons"},
	conversationTemplate = "",
	attacks = merge(lightsabermaster,forcepowermaster)
}

CreatureTemplates:addCreatureTemplate(vader_boss, "vader_boss")
