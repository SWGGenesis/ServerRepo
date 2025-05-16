janta_witch_doctor = Creature:new {
    customName = "Janta Witch Doctor",
    randomNameType = NAME_GENERIC,
    randomNameTag = true,
    socialGroup = "janta_tribe",
    faction = "janta_tribe",
    level = 150,
    chanceHit = 4.75,
    damageMin = 770,
    damageMax = 1250,
    baseXp = 11081,
    baseHAM = 50000,
    baseHAMmax = 61000,
    armor = 2,
    resists = {45,45,65,45,45,100,45,60,-1},
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
    creatureBitmask = PACK + HERD,
    optionsBitmask = AIENABLED,
    diet = HERBIVORE,

    templates = {
        "object/mobile/dantari_male.iff",
        "object/mobile/dantari_female.iff"},
    lootGroups = {
        {
            groups = {
                {group = "junk", chance = 3500000},
                {group = "janta_common", chance = 3000000},
                {group = "loot_kit_parts", chance = 3500000}
            },
            lootChance = 4000000
        }
    },
    weapons = {"primitive_weapons"},
    conversationTemplate = "",
    attacks = merge(pikemanmaster,fencermaster,brawlermaster)
}

CreatureTemplates:addCreatureTemplate(janta_witch_doctor, "janta_witch_doctor")
