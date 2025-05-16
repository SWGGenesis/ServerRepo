geonosian_death_dealer = Creature:new {
	randomNameType = NAME_GENERIC,
	randomNameTag = true,
    customName = "Geonosian Death Dealer",
	socialGroup = "geonosian",
	faction = "",
	level = 300,
	chanceHit = 1.75,
	damageMin = 200,
	damageMax = 1000,
	baseXp = 6288,
	baseHAM = 180000,
	baseHAMmax = 184000,
	armor = 3,
	resists = {90,90,90,90,90,90,90,90,30},
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
	creatureBitmask = PACK + KILLER,
	optionsBitmask = AIENABLED,
	diet = HERBIVORE,

	templates = {
		"object/mobile/dressed_geonosian_warrior_01.iff",
		"object/mobile/dressed_geonosian_warrior_02.iff",
		"object/mobile/dressed_geonosian_warrior_03.iff"},
	lootGroups = {
		{
			groups = {
				{group = "event_geo_cubes", chance = 5000000},
				{group = "geonosian_relic", chance = 5000000},
			},
			lootChance = 10000000
		},
		{
			groups = {
				{group = "event_geo_cubes", chance = 5000000},
				{group = "geonosian_relic", chance = 5000000},
			},
			lootChance = 10000000
		}
	},
	weapons = {"geonosian_weapons"},
	conversationTemplate = "",
	attacks = merge(marksmanmaster,pistoleermaster,riflemanmaster,tkamaster,forcepowermaster)
}

CreatureTemplates:addCreatureTemplate(geonosian_death_dealer, "geonosian_death_dealer")
