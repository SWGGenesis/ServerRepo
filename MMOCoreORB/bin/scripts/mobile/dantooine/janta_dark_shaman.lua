janta_dark_shaman = Creature:new {
    customName = "Janta Dark Shaman",
    randomNameType = NAME_GENERIC,
    randomNameTag = true,
    socialGroup = "janta_tribe",
    faction = "janta_tribe",
    level = 105,
    chanceHit = 1,
    damageMin = 645,
    damageMax = 1000,
    baseXp = 10174,
    baseHAM = 24000,
    baseHAMmax = 30000,
    armor = 2,
    resists = {45,40,40,40,100,100,40,60,-1},
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
    creatureBitmask = PACK + HERD + KILLER + HEALER,
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

CreatureTemplates:addCreatureTemplate(janta_dark_shaman, "janta_dark_shaman")
