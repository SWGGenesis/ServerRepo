gonk_boss = Creature:new {
	customName = "Gonkulous Prime",
	socialGroup = "self",
	faction = "",
    scale = 6.0,
	level = 336,
	chanceHit = 300,
	damageMin = 1800,
	damageMax = 3000,
	baseXp = 9336,
	baseHAM = 9000000,
	baseHAMmax = 9000000,
	armor = 3,
	resists = {98,98,98,98,98,98,98,98,98},
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

	templates = {"object/mobile/eg6_power_droid.iff"},
	lootGroups = {		
		{
			groups = {
				{group = "event_loot", chance = 10000000},
			},
			lootChance = 10000000
		},
		{
			groups = {
				{group = "event_loot", chance = 10000000},
			},
			lootChance = 10000000
		},
		{
			groups = {
				{group = "event_loot", chance = 10000000},
			},
			lootChance = 10000000
		},
		{
			groups = {
				{group = "event_loot", chance = 10000000},
			},
			lootChance = 10000000
		}, 
    },
	conversationTemplate = "",
	defaultWeapon = "object/weapon/ranged/droid/droid_astromech_ranged.iff",
	defaultAttack = "attack",
}

CreatureTemplates:addCreatureTemplate(gonk_boss, "gonk_boss")
