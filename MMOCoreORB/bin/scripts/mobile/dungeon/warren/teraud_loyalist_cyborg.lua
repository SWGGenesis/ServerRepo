teraud_loyalist_cyborg = Creature:new {
	objectName = "@mob/creature_names:warren_teraud_loyalist_cyborg",
	socialGroup = "warren_cyborg",
	faction = "",
	level = 121,
	chanceHit = 4,
	damageMin = 745,
	damageMax = 1200,
	baseXp = 11390,
	baseHAM = 50000,
	baseHAMmax = 50000,
	armor = 2,
	resists = {55,55,70,60,30,30,100,40,-1},
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
		"object/mobile/warren_teraud_loyalist_cyborg_s01.iff",
		"object/mobile/warren_teraud_loyalist_cyborg_s02.iff",
		"object/mobile/warren_teraud_loyalist_cyborg_s03.iff",
		"object/mobile/warren_teraud_loyalist_cyborg_s04.iff"},
	lootGroups = {
	    {
			groups = {
				{group = "junk", chance = 4500000},
				{group = "loot_kit_parts", chance = 3000000},
				{group = "armor_attachments", chance = 500000},
				{group = "clothing_attachments", chance = 500000},
				{group = "wearables_common", chance = 1500000}
				
			}
		}	
	},
	weapons = {"pirate_weapons_medium"},
	conversationTemplate = "",
	attacks = merge(brawlermaster,marksmanmaster,carbineermaster)
}

CreatureTemplates:addCreatureTemplate(teraud_loyalist_cyborg, "teraud_loyalist_cyborg")
