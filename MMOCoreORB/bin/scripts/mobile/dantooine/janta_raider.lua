janta_raider = Creature:new {
    customName = "Janta Raider",
    randomNameType = NAME_GENERIC,
    randomNameTag = true,
    socialGroup = "janta_tribe",
    faction = "janta_tribe",
    level = 83,
    chanceHit = 1,
    damageMin = 510,
    damageMax = 790,
    baseXp = 8373,
    baseHAM = 15000,
    baseHAMmax = 21000,
    armor = 1,
    resists = {25,25,65,60,70,70,25,20,-1},
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

CreatureTemplates:addCreatureTemplate(janta_raider, "janta_raider")