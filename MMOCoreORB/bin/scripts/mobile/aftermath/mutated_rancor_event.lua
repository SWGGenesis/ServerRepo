mutated_rancor_event = Creature:new {
	customName = "Fang",
	socialGroup = "self",
	faction = "",
	level = 333,
	scale = 3,
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

	templates = {"object/mobile/mutant_rancor.iff"},
    weapons = {},
	conversationTemplate = "",
	attacks = {
		{"creatureareableeding","stateAccuracyBonus=50"},
		{"creatureareapoison","stateAccuracyBonus=70"},
        {"creatureareaknockdown","stateAccuracyBonus=70"},
        {"dizzyattack","stateAccuracyBonus=70"}
	}
}


CreatureTemplates:addCreatureTemplate(mutated_rancor_event, "mutated_rancor_event")