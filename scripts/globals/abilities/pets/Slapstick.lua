---------------------------------------------------
-- Slapstick
---------------------------------------------------

require("scripts/globals/status");
require("scripts/globals/settings");
require("scripts/globals/weaponskills");

---------------------------------------------------

function onMobSkillCheck(target, automaton, skill)
    local master = automaton:getMaster()
    local effects = master:countEffect(EFFECT_THUNDER_MANEUVER)
    if effects > 0 then
        return effects
    else
        return -1
    end
end

function onAutomatonAbility(automaton, target, skill, tp, master, action)
    local params = {
        numHits = 3,
        atkmulti = 1,
        weaponType = SKILL_CLB,
        ftp100 = 1.5,
        ftp200 = 2.0,
        ftp300 = 3.0,
        acc100 = 0.0,
        acc200 = 0.0,
        acc300 = 0.0,
        str_wsc = 0.3,
        dex_wsc = 0.3,
        vit_wsc = 0.0,
        agi_wsc = 0.0,
        int_wsc = 0.0,
        mnd_wsc = 0.0,
        chr_wsc = 0.0
    }
    skill:setSkillchain(38)

    if USE_ADOULIN_WEAPON_SKILL_CHANGES then
        params.ftp100 = 2.66
        params.ftp200 = 2.66
        params.ftp300 = 2.66
        params.accBonus = 0.04 * tp
    end

    local damage = doPhysicalWeaponskill(automaton, target, 0, tp, true, action, false, params)

    return damage
end
