---------------------------------------------------
-- Armor Piercer
---------------------------------------------------

require("scripts/globals/status")
require("scripts/globals/settings")
require("scripts/globals/weaponskills")

---------------------------------------------------

function onMobSkillCheck(target, automaton, skill)
    local master = automaton:getMaster()
    local effects = master:countEffect(EFFECT_DARK_MANEUVER)
    if effects > 0 then
        return effects
    else
        return -1
    end
end

function onAutomatonAbility(automaton, target, skill, tp, master, action)
    local params = {
        numHits = 1,
        atkmulti = 1,
        accBonus = 100,
        ftp100 = 2.0,
        ftp200 = 2.0,
        ftp300 = 2.0,
        acc100 = 0.0,
        acc200 = 0.0,
        acc300 = 0.0,
        ignoresDef = true,
        ignored100 = 0.4,
        ignored200 = 0.5,
        ignored300 = 0.7,
        str_wsc = 0.0,
        dex_wsc = 0.6,
        vit_wsc = 0.0,
        agi_wsc = 0.0,
        int_wsc = 0.0,
        mnd_wsc = 0.0,
        chr_wsc = 0.0
    }
    skill:setSkillchain(135)

    if USE_ADOULIN_WEAPON_SKILL_CHANGES then
        params.ftp100 = 4.0
        params.ftp200 = 5.5
        params.ftp300 = 7.0
        params.ignored100 = 0.5
        params.ignored200 = 0.5
        params.ignored300 = 0.5
    end

    local damage = doRangedWeaponskill(automaton, target, 0, params, tp, true)

    return damage
end
