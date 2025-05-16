janta_veteran = Creature:new {
    customName = "Janta Veteran",
    randomNameType = NAME_GENERIC,
    randomNameTag = true,
    socialGroup = "janta_tribe",
    faction = "janta_tribe",
    level = 97,
    chanceHit = 1,
    damageMin = 610,
    damageMax = 990,
    baseXp = 8775,
    baseHAM = 20000,
    baseHAMmax = 25000,
    armor = 1,
    resists = {45,45,45,50,60,60,35,30,-1},
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

CreatureTemplates:addCreatureTemplate(janta_veteran, "janta_veteran")