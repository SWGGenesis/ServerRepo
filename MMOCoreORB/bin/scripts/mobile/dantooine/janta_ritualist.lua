janta_ritualist = Creature:new {
    customName = "Janta Ritualist",
    randomNameType = NAME_GENERIC,
    randomNameTag = true,
    socialGroup = "janta_tribe",
    faction = "janta_tribe",
    level = 98,
    chanceHit = 0.7,
    damageMin = 685,
    damageMax = 925,
    baseXp = 9081,
    baseHAM = 38000,
    baseHAMmax = 41000,
    armor = 1,
    resists = {100,40,40,40,40,100,25,40,-1},
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
                {group = "junk", chance = 4000000},
                {group = "janta_common", chance = 2500000},
                {group = "loot_kit_parts", chance = 3000000},
                {group = "wearables_all", chance = 500000}
            },
            lootChance = 3500000
        }
    },
    weapons = {"primitive_weapons"},
    conversationTemplate = "",
    attacks = merge(pikemanmaster,fencermaster,brawlermaster)
}

CreatureTemplates:addCreatureTemplate(janta_ritualist, "janta_ritualist")