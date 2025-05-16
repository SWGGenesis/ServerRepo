        toxic_durni_event = Creature:new {
	customName = "Toxic Easter Durni",
	socialGroup = "self",
	faction = "",
	level = 350,
	scale = 6,
	chanceHit = 92.5,
	damageMin = 800,
	damageMax = 1700,
	baseXp = 45,
	baseHAM = 500000,
	baseHAMmax = 500000,
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

	templates = {"object/mobile/durni_hue.iff"},
        weapons = {"creature_spit_heavy_flame"},
	conversationTemplate = "",
	attacks = {
	{"creatureareableeding","stateAccuracyBonus=100"},
	{"creatureareapoison","stateAccuracyBonus=100"},
        {"creatureareaknockdown","stateAccuracyBonus=100"},
        {"creatureareacombo","stateAccuracyBonus=100"}

	}
}


CreatureTemplates:addCreatureTemplate(toxic_durni_event, "toxic_durni_event")
