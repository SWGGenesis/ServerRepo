skirata_clan_soldier = Creature:new {
	customName = "Skirata Soldier",
	randomNameType = NAME_GENERIC,
	randomNameTag = true,
	socialGroup = "rebel",
	faction = "rebel",
	level = 178,
	chanceHit = 12.25,
	damageMin = 1020,
	damageMax = 1750,
	baseXp = 16794,
	baseHAM = 120000,
	baseHAMmax = 120000,
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
					{group = "clothing_attachments",   chance = 2000000},
					{group = "armor_attachments",   chance = 2000000},
					{group = "junk",   chance = 4000000},
					{group = "forged_in_conflict",   chance = 1250000},
					{group = "new_schematics", chance = 250000},
					{group = "imperial_pack",  chance = 250000},
					{group = "imperial_crusade",  chance = 250000}
				},
				lootChance = 7000000
			}
		},
	weapons = {"pirate_weapons_heavy"},
	conversationTemplate = "",
	attacks = merge(bountyhuntermaster,marksmanmaster,brawlermaster,swordsmanmaster,pistoleermaster,fencermaster,pikemanmaster,riflemanmaster)
}

CreatureTemplates:addCreatureTemplate(skirata_clan_soldier, "skirata_clan_soldier")
