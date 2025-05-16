boba_fett_boss = Creature:new {
	customName = "Boba Fett",
	socialGroup = "self",
	faction = "",
	scale = 1.25,
	level = 300,
	chanceHit = 300,
	damageMin = 1200,
	damageMax = 3000,
	baseXp = 9336,
	baseHAM = 6000000,
	baseHAMmax = 6000000,
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
	creatureBitmask = PACK + KILLER + HEALER,
	optionsBitmask = AIENABLED,
	diet = HERBIVORE,

	templates = {"object/mobile/boba_fett.iff"},
	lootGroups = {
		{
			groups = {
				{group = "boba_loot", chance = 10000000},
			},
			lootChance = 10000000
		},
		{
			groups = {
				{group = "boba_loot", chance = 10000000},
			},
			lootChance = 10000000
		},
		{
			groups = {
				{group = "boba_loot", chance = 10000000},
			},
			lootChance = 10000000
		},
		{
			groups = {
				{group = "boba_loot", chance = 10000000},
			},
			lootChance = 10000000
		},
		{
			groups = {
				{group = "boba_loot2", chance = 10000000},
			},
			lootChance = 20000
		}
	},
	weapons = {"pirate_weapons_heavy"},
	conversationTemplate = "",
	attacks = merge(bountyhuntermaster,marksmanmaster,brawlermaster,swordsmanmaster,pistoleermaster,fencermaster,pikemanmaster,riflemanmaster,carbineermaster)
}

CreatureTemplates:addCreatureTemplate(boba_fett_boss, "boba_fett_boss")