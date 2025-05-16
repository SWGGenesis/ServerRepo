janta_battlelord = Creature:new {
    customName = "Janta Battlelord",
    randomNameType = NAME_GENERIC,
    randomNameTag = true,
    socialGroup = "janta_tribe",
    faction = "janta_tribe",
    level = 109,
    chanceHit = 1,
    damageMin = 650,
    damageMax = 900,
    baseXp = 10373,
    baseHAM = 18000,
    baseHAMmax = 26000,
    armor = 1,
    resists = {65,65,45,40,70,20,25,40,-1},
    meatType = "",
    meatAmount = 0,
    hideType = "",
    hideAmount = 0,
    boneType = "",
    boneAmount = 0,
    milk = 0,
    tamingChance = 0,
    ferocity = 0,
    pvpBitmask = ATTACKABLE,
    creatureBitmask = PACK + HERD + KILLER,
    optionsBitmask = AIENABLED,
    diet = HERBIVORE,

    templates = {
        "object/mobile/dantari_male.iff",
        "object/mobile/dantari_female.iff"},
    lootGroups = {
        {
            groups = {
                {group = "junk", chance = 4500000},
                {group = "janta_common", chance = 2500000},
                {group = "loot_kit_parts", chance = 3000000}
            },
            lootChance = 3500000
        }
    },
    weapons = {"primitive_weapons"},
    conversationTemplate = "",
    attacks = merge(pikemanmaster,fencermaster,brawlermaster)
}

CreatureTemplates:addCreatureTemplate(janta_battlelord, "janta_battlelord")