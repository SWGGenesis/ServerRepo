janta_overlord = Creature:new {
    customName = "Janta Overlord",
    randomNameType = NAME_GENERIC,
    randomNameTag = true,
    socialGroup = "janta_tribe",
    faction = "janta_tribe",
    level = 300,
    chanceHit = 20.75,
    damageMin = 520,
    damageMax = 1750,
    baseXp = 26000,
    baseHAM = 280000,
    baseHAMmax = 280000,
    armor = 3,
    resists = {200,200,70,70,155,100,70,70,-1},
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

    templates = {"object/mobile/dantari_male.iff"},
    lootGroups = {
        {
            groups = {
                {group = "junk", chance = 3000000},
                {group = "janta_common", chance = 3500000},
                {group = "loot_kit_parts", chance = 3000000},
                {group = "wearables_all", chance = 500000}
            },
            lootChance = 10000000
        }
    },
    weapons = {"sif_weapons"},
    conversationTemplate = "",
    attacks = merge(pikemanmaster,fencermaster,brawlermaster,swordsmanmaster)
}

CreatureTemplates:addCreatureTemplate(janta_overlord, "janta_overlord")
