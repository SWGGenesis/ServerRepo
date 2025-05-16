mutated_rancor = Creature:new {
	customName = "Fang",
	socialGroup = "self",
	faction = "",
	level = 300,
	scale = 3,
	chanceHit = 300,
	damageMin = 1750,
	damageMax = 3500,
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

	templates = {"object/mobile/mutant_rancor.iff"},

	lootGroups = {
		{
			groups = {
				{group = "rancor_boss", chance = 10000000},
			},
			lootChance = 10000000
		},
		{
			groups = {
				{group = "rancor_boss", chance = 10000000},
			},
			lootChance = 10000000
		},
		{
			groups = {
				{group = "rancor_boss", chance = 10000000},
			},
			lootChance = 10000000
		},
		{
			groups = {
				{group = "rancor_boss", chance = 10000000},
			},
			lootChance = 10000000
		}
	},
	

    weapons = {},
	conversationTemplate = "",
	attacks = {
		{"creatureareableeding","stateAccuracyBonus=100"},
		{"creatureareapoison","stateAccuracyBonus=100"},
        {"creatureareaknockdown","stateAccuracyBonus=100"},
        {"dizzyattack","stateAccuracyBonus=100"}
	}
}


CreatureTemplates:addCreatureTemplate(mutated_rancor, "mutated_rancor")