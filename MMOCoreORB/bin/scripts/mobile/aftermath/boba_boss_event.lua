boba_boss_event = Creature:new {
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
	weapons = {"boba_fett_weapons"},
	attacks = merge(marksmanmaster,bountyhuntermaster,carbineermaster)
	
}

CreatureTemplates:addCreatureTemplate(boba_boss_event, "boba_boss_event")