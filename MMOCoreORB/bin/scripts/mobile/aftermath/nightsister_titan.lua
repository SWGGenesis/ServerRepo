    nightsister_titan = Creature:new {
    customName = "Nightsister Titan",
	socialGroup = "nightsister",
	faction = "nightsister",
	level = 500,
	scale = 2.25,
	chanceHit = 50.25,
	damageMin = 1820,
	damageMax = 3150,
	baseXp = 26654,
	baseHAM = 1500000,
	baseHAMmax = 2000000,
	armor = 3,
	resists = {75,55,55,160,160,180,180,180,30},
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
	creatureBitmask = PACK + KILLER + HEALER,
	optionsBitmask = AIENABLED,
	diet = HERBIVORE,

	templates = {"object/mobile/dressed_dathomir_nightsister_elder.iff"},
	lootGroups = {
		{
			groups = {
				{group = "power_crystals", chance = 2000000},
				{group = "nightsister_titan_loot", chance = 1500000},
				{group = "nightsister_titan_loot", chance = 1500000},
				{group = "event_geo_cubes", chance = 3000000},
				{group = "named_color_crystals", chance = 2000000}
			},
			lootChance = 10000000
		}
	},
	weapons = {"mixed_force_weapons"},
	conversationTemplate = "",
	attacks = merge(tkamaster,swordsmanmaster,fencermaster,pikemanmaster,brawlermaster,forcepowermaster)
}

CreatureTemplates:addCreatureTemplate(nightsister_titan, "nightsister_titan")
