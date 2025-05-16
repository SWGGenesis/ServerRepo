janta_marauder = Creature:new {
    customName = "Janta Marauder",
    randomNameType = NAME_GENERIC,
    randomNameTag = true,
    socialGroup = "janta_tribe",
    faction = "janta_tribe",
    level = 103,
    chanceHit = 1.1,
    damageMin = 610,
    damageMax = 990,
    baseXp = 9373,
    baseHAM = 22000,
    baseHAMmax = 29000,
    armor = 1,
    resists = {65,65,65,60,70,70,25,20,-1},
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
                {group = "junk", chance = 3500000},
                {group = "janta_common", chance = 3000000},
                {group = "loot_kit_parts", chance = 3500000}
            },
            lootChance = 4500000
        }
    },
    weapons = {"primitive_weapons"},
    conversationTemplate = "",
    attacks = merge(pikemanmaster,fencermaster,brawlermaster)
}

CreatureTemplates:addCreatureTemplate(janta_marauder, "janta_marauder")
