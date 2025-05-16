failed_force_clone = Creature:new {
	objectName = "@mob/creature_names:dark_jedi_knight",
    customName = "a Failed Force Clone",
	socialGroup = "geonosian_creature",
	faction = "",
	level = 300,
	chanceHit = 30,
	damageMin = 1645,
	damageMax = 3000,
	baseXp = 25266,
	baseHAM = 261000,
	baseHAMmax = 320000,
	armor = 3,
	resists = {90,90,90,90,90,90,90,90,20},
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
	creatureBitmask = KILLER + STALKER,
	optionsBitmask = AIENABLED,
	diet = HERBIVORE,

	templates = { "dark_jedi" },
	lootGroups = {
		{
			groups = {
				{group = "power_crystals", chance = 2500000},
				{group = "armor_attachments", chance = 1500000},
				{group = "clothing_attachments", chance = 3800000},
				{group = "named_color_crystals", chance = 200000},
				{group = "event_geo_cubes", chance = 2000000}
			},
			lootChance = 10000000
		}
	},
	weapons = {"mixed_force_weapons"},
	conversationTemplate = "",
	attacks = merge(tkamid,fencermaster,swordsmaster,brawlermaster,pikemanmaster,forcewielder,forcepowermaster)
}

CreatureTemplates:addCreatureTemplate(failed_force_clone, "failed_force_clone")
