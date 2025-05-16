rabid_wookiee = Creature:new {
	customName = "Mad Claw",
	randomNameType = NAME_GENERIC,
	randomNameTag = true,
	socialGroup = "self",
	faction = "",
	scale = 1.25,
	level = 300,
	chanceHit = 300,
	damageMin = 1500,
	damageMax = 3000,
	baseXp = 45,
	baseHAM = 5000000,
	baseHAMmax = 5000000,
	armor = 3,
	resists = {90,90,90,90,90,90,90,90,75},
	meatType = "",
	meatAmount = 0,
	hideType = "",
	hideAmount = 0,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0,
	ferocity = 0,
	pvpBitmask = ATTACKABLE + ENEMY,
	creatureBitmask = PACK + HERD + KILLER,
	optionsBitmask = AIENABLED,
	diet = HERBIVORE,

	templates = {"object/mobile/wookiee_male.iff"},

	lootGroups = {
		{
			groups = {
				{group = "weapons_all", chance = 4500000},
				{group = "sithsword", chance = 3000000},
				{group = "yoda_pack", chance = 750000},
				{group = "named_color_crystals", chance = 800000},
				{group = "neutral_pack", chance = 950000}
			},
			lootChance = 10000000
		},
         {
			groups = {
				{group = "weapons_all", chance = 4500000},
				{group = "sithsword", chance = 3000000},
				{group = "yoda_pack", chance = 750000},
				{group = "named_color_crystals", chance = 800000},
				{group = "neutral_pack", chance = 950000}
			},
			lootChance = 10000000
            },
			{
				groups = {
					{group = "weapons_all", chance = 4500000},
					{group = "sithsword", chance = 3000000},
					{group = "yoda_pack", chance = 750000},
					{group = "named_color_crystals", chance = 800000},
					{group = "neutral_pack", chance = 950000}
				},
				lootChance = 10000000
			},
				{
					groups = {
						{group = "weapons_all", chance = 4500000},
						{group = "sithsword", chance = 3000000},
						{group = "yoda_pack", chance = 750000},
						{group = "named_color_crystals", chance = 800000},
						{group = "neutral_pack", chance = 950000}
					},
					lootChance = 10000000
				},
	},
	weapons = {"pirate_weapons_heavy"},
	conversationTemplate = "",
	attacks = merge(bountyhuntermaster,marksmanmaster,brawlermaster,swordsmanmaster,pistoleermaster,fencermaster,pikemanmaster,riflemanmaster,carbineermaster)
}

CreatureTemplates:addCreatureTemplate(rabid_wookiee, "rabid_wookiee")