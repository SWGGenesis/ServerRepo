gar_saxon = Creature:new {
	customName = "Gar Saxon - Leader of the Saxon Clan",
	socialGroup = "imperial",
	faction = "imperial",
	level = 300,
	chanceHit = 12.25,
	damageMin = 1020,
	damageMax = 1750,
	baseXp = 16794,
	baseHAM = 175000,
	baseHAMmax = 175000,
	armor = 2,
	resists = {75,75,90,80,45,45,100,70,-1},
	meatType = "",
	meatAmount = 0,
	hideType = "",
	hideAmount = 0,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0,
	ferocity = 0,
	pvpBitmask = ATTACKABLE,
	creatureBitmask = PACK + KILLER + STALKER,
	optionsBitmask = AIENABLED,
	diet = HERBIVORE,
	scale = 1.15,

	templates = {"object/mobile/dressed_death_watch_silver.iff"},
	lootGroups = {
		{
			groups = {
				{group = "forged_in_conflict",   chance = 3500000},
				{group = "new_schematics", chance = 5000000},
				{group = "rebel_pack",  chance = 500000},
				{group = "rebel_crusade",  chance = 1000000}
			},
			lootChance = 10000000,
		},
		groups = {
			{group = "new_schematics", chance = 8500000},
			{group = "rebel_pack",  chance = 500000},
			{group = "rebel_crusade",  chance = 1000000}
		},
		lootChance = 100000,
		},
	weapons = {"pirate_weapons_heavy"},
	conversationTemplate = "",
	attacks = merge(bountyhuntermaster,marksmanmaster,brawlermaster,swordsmanmaster,pistoleermaster,fencermaster,pikemanmaster,riflemanmaster)
}

CreatureTemplates:addCreatureTemplate(gar_saxon, "gar_saxon")
