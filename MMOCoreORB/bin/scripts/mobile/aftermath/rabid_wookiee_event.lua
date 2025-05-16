rabid_wookiee_event = Creature:new {
	customName = "Mad Claw",
	randomNameType = NAME_GENERIC,
	randomNameTag = true,
	socialGroup = "self",
	faction = "",
	scale = 1.25,
	level = 333,
	chanceHit = 130,
	damageMin = 1000,
	damageMax = 2500,
	baseXp = 45,
	baseHAM = 5000000,
	baseHAMmax = 5000000,
	armor = 3,
	resists = {90,90,90,90,90,90,90,90,50},
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

	weapons = {"chewbacca_weapons"},
	conversationTemplate = "",
	attacks = merge(riflemanmaster)
}

CreatureTemplates:addCreatureTemplate(rabid_wookiee_event, "rabid_wookiee_event")