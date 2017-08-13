-- Uses a mixture of mob and player WS formulas
require("scripts/globals/status");
require("scripts/globals/utils");
require("scripts/globals/magic");
require("scripts/globals/magicburst");

MSG_RESIST = 85
MSG_USES = 101 -- simple uses message
MSG_DISAPPEAR = 159 -- <target>'s stun effect disappears!
MSG_MISS = 188
MSG_BUFF = 186
MSG_DRAIN_HP = 187
MSG_NO_EFFECT = 189
MSG_RECOVER_MP = 224
MSG_ENFEEB = 243 --XXX receives the effect of petrification.
MSG_ATTR_DRAINED = 369
MSG_TP_INCREASE = 409

-- params contains: ftp100, ftp200, ftp300, str_wsc, dex_wsc, vit_wsc, int_wsc, mnd_wsc, canCrit, crit100, crit200, crit300, acc100, acc200, acc300, ignoresDef, ignore100, ignore200, ignore300, atkmulti, kick, accBonus, weaponType, weaponDamage
function doAutoPhysicalWeaponskill(attacker, target, wsID, tp, primary, action, taChar, params, skill)

    local criticalHit = false;
    local bonusTP = params.bonusTP or 0
    local multiHitfTP = params.multiHitfTP or false
    local bonusacc = attacker:getMod(MOD_WSACC) + (params.accBonus or 0);

    local dstr = utils.clamp(attacker:getStat(MOD_STR) - target:getStat(MOD_VIT), -10, 10)

    -- apply WSC
    local weaponDamage = params.weaponDamage or attacker:getWeaponDmg();
    local weaponType = params.weaponType or attacker:getWeaponSkillType(0);

    if (weaponType == SKILL_H2H or weaponType == SKILL_NON) then
        local h2hSkill = ((attacker:getSkillLevel(1) * 0.11) + 3);

        if (params.kick and attacker:hasStatusEffect(EFFECT_FOOTWORK)) then
            weaponDamage = attacker:getMod(MOD_KICK_DMG) + 18; -- footwork formerly added 18 base dmg to all kicks, its effect on weaponskills was unchanged by update
        else
            weaponDamage = utils.clamp(weaponDamage-3, 0);
        end

        weaponDamage = weaponDamage + h2hSkill;
    end

    local base = math.max(weaponDamage + dstr +
        (attacker:getStat(MOD_STR) * params.str_wsc + attacker:getStat(MOD_DEX) * params.dex_wsc +
         attacker:getStat(MOD_VIT) * params.vit_wsc + attacker:getStat(MOD_AGI) * params.agi_wsc +
         attacker:getStat(MOD_INT) * params.int_wsc + attacker:getStat(MOD_MND) * params.mnd_wsc +
         attacker:getStat(MOD_CHR) * params.chr_wsc) + math.max(attacker:getMainLvl() - target:getMainLvl(), 0), 1)

    -- Applying fTP multiplier
    local ftpdmgbonus = attacker:getMod(MOD_WEAPONSKILL_DAMAGE_BASE)/100;
    local ftp = autoFTP(tp,params.ftp100,params.ftp200,params.ftp300) + ftpdmgbonus;

    local ignoredDef = 0;
    if (params.ignoresDef == not nil and params.ignoresDef == true) then
        ignoredDef = calculatedAutoIgnoredDef(tp, target:getStat(MOD_DEF), params.ignored100, params.ignored200, params.ignored300);
    end

    -- get cratio min and max
    local cratio, ccritratio = getAutocRatio(attacker, target, params, ignoredDef, true);
    local ccmin = 0;
    local ccmax = 0;
    local hasMightyStrikes = attacker:hasStatusEffect(EFFECT_MIGHTY_STRIKES);
    local isSneakValid = attacker:hasStatusEffect(EFFECT_SNEAK_ATTACK);
    if (isSneakValid and not (attacker:isBehind(target) or attacker:hasStatusEffect(EFFECT_HIDE))) then
        isSneakValid = false;
    end
    attacker:delStatusEffectsByFlag(EFFECTFLAG_DETECTABLE);
    attacker:delStatusEffect(EFFECT_SNEAK_ATTACK);
    local isTrickValid = taChar ~= nil

    local isAssassinValid = isTrickValid;
    if (isAssassinValid and not attacker:hasTrait(68)) then
        isAssassinValid = false;
    end

    local critrate = 0;
    local nativecrit = 0;

    if (params.canCrit) then -- work out critical hit ratios, by +1ing
        critrate = autoFTP(tp,params.crit100,params.crit200,params.crit300);
        -- add on native crit hit rate (guesstimated, it actually follows an exponential curve)
        local flourisheffect = attacker:getStatusEffect(EFFECT_BUILDING_FLOURISH);
        if flourisheffect ~= nil and flourisheffect:getPower() > 1 then
            critrate = critrate + (10 + flourisheffect:getSubPower()/2)/100;
        end
        nativecrit = (attacker:getStat(MOD_DEX) - target:getStat(MOD_AGI))*0.005; -- assumes +0.5% crit rate per 1 dDEX
        nativecrit = nativecrit + (attacker:getMod(MOD_CRITHITRATE)/100) + attacker:getMerit(MERIT_CRIT_HIT_RATE)/100 - target:getMerit(MERIT_ENEMY_CRIT_RATE)/100;
        if (attacker:hasStatusEffect(EFFECT_INNIN) and attacker:isBehind(target, 23)) then -- Innin acc boost attacker is behind target
            nativecrit = nativecrit + attacker:getStatusEffect(EFFECT_INNIN):getPower();
        end

        if (nativecrit > 0.2) then -- caps!
            nativecrit = 0.2;
        elseif (nativecrit < 0.05) then
            nativecrit = 0.05;
        end
        critrate = critrate + nativecrit;
    end

    -- Applying pDIF
    local pdif = generateAutoPdif(cratio[1], cratio[2], true);

    local missChance = math.random();
    local finaldmg = 0;
    local hitrate = getAutoHitRate(attacker,target,true,bonusacc,true);
    if (params.acc100~=0) then
        -- ACCURACY VARIES WITH TP, APPLIED TO ALL HITS.
        -- print("Accuracy varies with TP.");
        hr = autoAccVariesWithTP(getAutoHitRate(attacker,target,false,bonusacc,true),attacker:getACC(),tp,params.acc100,params.acc200,params.acc300);
        hitrate = hr;
    end

    local dmg = base * ftp;
    local tpHitsLanded = 0;
    if ((missChance <= hitrate or isSneakValid or isAssassinValid or math.random() < attacker:getMod(MOD_ZANSHIN)/100) and
            not target:hasStatusEffect(EFFECT_PERFECT_DODGE) and not target:hasStatusEffect(EFFECT_ALL_MISS) ) then
        if (params.canCrit or isSneakValid or isAssassinValid) then
            local critchance = math.random();
            if (critchance <= critrate or hasMightyStrikes or isSneakValid or isAssassinValid) then -- crit hit!
                local cpdif = generateAutoPdif(ccritratio[1], ccritratio[2], true);
                finaldmg = dmg * cpdif;
                if (isSneakValid and attacker:getMainJob() == JOBS.THF) then -- have to add on DEX bonus if on THF main
                    finaldmg = finaldmg + (attacker:getStat(MOD_DEX) * ftp * cpdif) * ((100+(attacker:getMod(MOD_AUGMENTS_SA)))/100);
                end
                if (isTrickValid and attacker:getMainJob() == JOBS.THF) then
                    finaldmg = finaldmg + (attacker:getStat(MOD_AGI) * (1 + attacker:getMod(MOD_TRICK_ATK_AGI)/100) * ftp * cpdif) * ((100+(attacker:getMod(MOD_AUGMENTS_TA)))/100);
                end
            else
                finaldmg = dmg * pdif;
                if (isTrickValid and attacker:getMainJob() == JOBS.THF) then
                    finaldmg = finaldmg + (attacker:getStat(MOD_AGI) * (1 + attacker:getMod(MOD_TRICK_ATK_AGI)/100) * ftp * pdif) * ((100+(attacker:getMod(MOD_AUGMENTS_TA)))/100);
                end
            end
        else
            finaldmg = dmg * pdif;
            if (isTrickValid and attacker:getMainJob() == JOBS.THF) then
                finaldmg = finaldmg + (attacker:getStat(MOD_AGI) * (1 + attacker:getMod(MOD_TRICK_ATK_AGI)/100) * ftp * pdif) * ((100+(attacker:getMod(MOD_AUGMENTS_TA)))/100);
            end
        end
        tpHitsLanded = 1;
    end

    if not multiHitfTP then dmg = base end

    if ((attacker:getOffhandDmg() ~= 0) and (attacker:getOffhandDmg() > 0 or weaponType==SKILL_H2H)) then

        local chance = math.random();
        if ((chance<=hitrate or math.random() < attacker:getMod(MOD_ZANSHIN)/100 or isSneakValid)
                and not target:hasStatusEffect(EFFECT_PERFECT_DODGE) and not target:hasStatusEffect(EFFECT_ALL_MISS) ) then -- it hit
            pdif = generateAutoPdif(cratio[1], cratio[2], true);
            if (params.canCrit) then
                critchance = math.random();
                if (critchance <= nativecrit or hasMightyStrikes) then -- crit hit!
                    criticalHit = true;
                    cpdif = generateAutoPdif(ccritratio[1], ccritratio[2], true);
                    finaldmg = finaldmg + dmg * cpdif;
                else
                    finaldmg = finaldmg + dmg * pdif;
                end
            else
                finaldmg = finaldmg + dmg * pdif;
            end
            tpHitsLanded = tpHitsLanded + 1;
        end
    end

    -- Store first hit bonus for use after other calcs are done..
    local firstHitBonus = ((finaldmg * attacker:getMod(MOD_ALL_WSDMG_FIRST_HIT))/100);

    local numHits = getAutoMultiAttacks(attacker, params.numHits);
    local extraHitsLanded = 0;

    if (numHits > 1) then

        local hitsdone = 1;
        while (hitsdone < numHits) do
            local chance = math.random();
            local targetHP = target:getHP();
            if ((chance<=hitrate or math.random() < attacker:getMod(MOD_ZANSHIN)/100) and
                    not target:hasStatusEffect(EFFECT_PERFECT_DODGE) and not target:hasStatusEffect(EFFECT_ALL_MISS) ) then  -- it hit
                pdif = generateAutoPdif(cratio[1], cratio[2], true);
                if (params.canCrit) then
                    critchance = math.random();
                    if (critchance <= nativecrit or hasMightyStrikes) then -- crit hit!
                        criticalHit = true;
                        cpdif = generateAutoPdif(ccritratio[1], ccritratio[2], true);
                        finaldmg = finaldmg + dmg * cpdif;
                    else
                        finaldmg = finaldmg + dmg * pdif;
                    end
                else
                    finaldmg = finaldmg + dmg * pdif;
                end
                extraHitsLanded = extraHitsLanded + 1;
            end
            hitsdone = hitsdone + 1;
            if (finaldmg > targetHP) then
                break;
            end
        end
    end
    -- print("Landed " .. hitslanded .. "/" .. numHits .. " hits with hitrate " .. hitrate .. "!");


    -- DMG Bonus for any WS
    local bonusdmg = attacker:getMod(MOD_ALL_WSDMG_ALL_HITS);

    -- Add in bonusdmg
    finaldmg = finaldmg * ((100 + bonusdmg)/100);
    finaldmg = finaldmg + firstHitBonus;

    -- Check for reductions from PDT
    finaldmg = target:physicalDmgTaken(finaldmg);

    -- Check for reductions from phys resistances
    if (weaponType == SKILL_H2H) then
        finaldmg = finaldmg * target:getMod(MOD_HTHRES) / 1000;
    elseif (weaponType == SKILL_DAG or weaponType == SKILL_POL) then
        finaldmg = finaldmg * target:getMod(MOD_PIERCERES) / 1000;
    elseif (weaponType == SKILL_CLB or weaponType == SKILL_STF) then
        finaldmg = finaldmg * target:getMod(MOD_IMPACTRES) / 1000;
    else
        finaldmg = finaldmg * target:getMod(MOD_SLASHRES) / 1000;
    end

    attacker:delStatusEffectSilent(EFFECT_BUILDING_FLOURISH);
    finaldmg = finaldmg * WEAPON_SKILL_POWER
    if tpHitsLanded + extraHitsLanded > 0 then
        finaldmg = takeAutoWeaponskillDamage(target, attacker, params, primary, finaldmg, SLOT_MAIN, tpHitsLanded, (extraHitsLanded * 10) + bonusTP, taChar)
    else
        skill:setMsg(MSG_MISS)
    end

    return finaldmg, criticalHit, tpHitsLanded, extraHitsLanded;
end;

-- params: ftp100, ftp200, ftp300, wsc_str, wsc_dex, wsc_vit, wsc_agi, wsc_int, wsc_mnd, wsc_chr, accBonus, weaponDamage
--         ele (ELE_FIRE), skill (SKILL_STF), includemab = true
function doAutoMagicWeaponskill(attacker, target, wsID, tp, primary, action, params, skill)
    local bonusTP = params.bonusTP or 0
    local bonusacc = attacker:getMod(MOD_WSACC) + (params.accBonus or 0);

    local fint = utils.clamp(8 + (attacker:getStat(MOD_INT) - target:getStat(MOD_INT)), -32, 32);
    local dmg = math.max((params.weaponDamage or (attacker:getMainLvl() + 2)) + fint +
        (attacker:getStat(MOD_STR) * params.str_wsc + attacker:getStat(MOD_DEX) * params.dex_wsc +
         attacker:getStat(MOD_VIT) * params.vit_wsc + attacker:getStat(MOD_AGI) * params.agi_wsc +
         attacker:getStat(MOD_INT) * params.int_wsc + attacker:getStat(MOD_MND) * params.mnd_wsc +
         attacker:getStat(MOD_CHR) * params.chr_wsc) + math.max(attacker:getMainLvl() - target:getMainLvl(), 0), 1);

    -- Applying fTP multiplier
    local ftpdmgbonus = attacker:getMod(MOD_WEAPONSKILL_DAMAGE_BASE)/100;
    local ftp = autoFTP(tp,params.ftp100,params.ftp200,params.ftp300) + ftpdmgbonus;

    dmg = dmg * ftp;

    dmg = addBonusesAbility(attacker, params.ele, target, dmg, params);
    dmg = dmg * applyResistanceAbility(attacker,target,params.ele,params.skill, bonusacc);
    dmg = target:magicDmgTaken(dmg);
    dmg = adjustForTarget(target,dmg,params.ele);

    -- Add first hit bonus..No such thing as multihit magic ws is there?
    local firstHitBonus = ((dmg * attacker:getMod(MOD_ALL_WSDMG_FIRST_HIT))/100);

    -- DMG Bonus for any WS
    local bonusdmg = attacker:getMod(MOD_ALL_WSDMG_ALL_HITS);

    -- Add in bonusdmg
    dmg = dmg * ((100 + bonusdmg)/100);
    dmg = dmg + firstHitBonus;

    dmg = dmg * WEAPON_SKILL_POWER
    dmg = takeAutoWeaponskillDamage(target, attacker, params, primary, dmg, SLOT_MAIN, 1, bonusTP, nil)

    return dmg, false, 1, 0;
end

function autoAccVariesWithTP(hitrate,acc,tp,a1,a2,a3)
    -- sadly acc varies with tp ALL apply an acc PENALTY, the acc at various %s are given as a1 a2 a3
    accpct = autoFTP(tp,a1,a2,a3);
    acclost = acc - (acc*accpct);
    hrate = utils.hitrate - (0.005*acclost);
    -- cap it
    hitrate = utils.clamp(hitrate, 0.2, 0.95);
    return hrate;
end;

function getAutoHitRate(attacker,defender,capHitRate,bonus,melee)
    local acc = (melee and attacker:getACC() or attacker:getRACC()) + (bonus or 0);
    local eva = defender:getEVA();

    local levelbonus = 0;
    if (attacker:getMainLvl() > defender:getMainLvl()) then
        levelbonus = 2 * (attacker:getMainLvl() - defender:getMainLvl());
    end

    local hitrate = acc - eva + levelbonus + 75;
    hitrate = hitrate/100;

    -- Applying hitrate caps
    if (capHitRate) then -- this isn't capped for when acc varies with tp, as more penalties are due
        hitrate = utils.clamp(hitrate, 0.2, 0.95);
    end
    return hitrate;
end;

function autoFTP(tp,ftp1,ftp2,ftp3)
    if (tp < 1000) then
        tp = 1000;
    end
    if (tp >= 1000 and tp < 2000) then
        return ftp1 + ( ((ftp2-ftp1)/1000) * (tp-1000));
    elseif (tp >= 2000 and tp <= 3000) then
        -- generate a straight line between ftp2 and ftp3 and find point @ tp
        return ftp2 + ( ((ftp3-ftp2)/1000) * (tp-2000));
    else
        print("fTP error: TP value is not between 1000-3000!");
    end
    return 1; -- no ftp mod
end;

function calculatedAutoIgnoredDef(tp, def, ignore1, ignore2, ignore3)
    if (tp>=1000 and tp <2000) then
        return (ignore1 + ( ((ignore2-ignore1)/1000) * (tp-1000)))*def;
    elseif (tp>=2000 and tp<=3000) then
        return (ignore2 + ( ((ignore3-ignore2)/1000) * (tp-2000)))*def;
    end
    return 1; -- no def ignore mod
end

-- Given the raw ratio value (atk/def) and levels, returns the cRatio (min then max)
function getAutocRatio(attacker, defender, params, ignoredDef, melee)
    local cratio = ((melee and attacker:getStat(MOD_ATT) or attacker:getRATT()) * params.atkmulti) / (defender:getStat(MOD_DEF) - ignoredDef);

    local levelbonus = 0;
    if (attacker:getMainLvl() > defender:getMainLvl()) then
        levelbonus = 0.05 * (attacker:getMainLvl() - defender:getMainLvl());
    end

    cratio = cratio + levelbonus;
    cratio = utils.clamp(cratio, 0, (melee and 4.0 or 3.0));

    local pdif = {};
    local pdifcrit = {};

    if melee then
        local pdifmin = 0;
        local pdifmax = 1;

        if (cratio < 0.5) then
            pdifmax = cratio + 0.5;
        elseif ((0.5 <= cratio) and (cratio <= 0.7)) then
            pdifmax = 1;
        elseif ((0.7 < cratio) and (cratio <= 1.2)) then
            pdifmax = cratio + 0.3;
        elseif ((1.2 < cratio) and (cratio <= 1.5)) then
            pdifmax = (cratio * 0.25) + cratio;
        elseif ((1.5 < cratio) and (cratio <= 2.625)) then
            pdifmax = cratio + 0.375;
        elseif ((2.625 < cratio) and (cratio <= 3.25)) then
            pdifmax = 3;
        else 
            pdifmax = cratio;
        end

        if (cratio < 0.38) then
            pdifmin =  0;
        elseif ((0.38 <= cratio) and (cratio <= 1.25)) then
            pdifmin = cratio * (1176 / 1024) - (448 / 1024);
        elseif ((1.25 < cratio) and (cratio <= 1.51)) then
            pdifmin = 1;
        elseif ((1.51 < cratio) and (cratio <= 2.44)) then
            pdifmin = cratio * (1176 / 1024) - (775 / 1024);
        else
            pdifmin = cratio - 0.375;
        end

        pdif[1] = pdifmin;
        pdif[2] = pdifmax;

        cratio = cratio + 1;
        cratio = utils.clamp(cratio, 0, 4.0);

        -- printf("ratio: %f min: %f max %f\n", cratio, pdifmin, pdifmax);

        if (cratio < 0.5) then
            pdifmax = cratio + 0.5;
        elseif ((0.5 <= cratio) and (cratio <= 0.7)) then
            pdifmax = 1;
        elseif ((0.7 < cratio) and (cratio <= 1.2)) then
            pdifmax = cratio + 0.3;
        elseif ((1.2 < cratio) and (cratio <= 1.5)) then
            pdifmax = (cratio * 0.25) + cratio;
        elseif ((1.5 < cratio) and (cratio <= 2.625)) then
            pdifmax = cratio + 0.375;
        elseif ((2.625 < cratio) and (cratio <= 3.25)) then
            pdifmax = 3;
        else 
            pdifmax = cratio;
        end

        if (cratio < 0.38) then
            pdifmin =  0;
        elseif ((0.38 <= cratio) and (cratio <= 1.25)) then
            pdifmin = cratio * (1176 / 1024) - (448 / 1024);
        elseif ((1.25 < cratio) and (cratio <= 1.51)) then
            pdifmin = 1;
        elseif ((1.51 < cratio) and (cratio <= 2.44)) then
            pdifmin = cratio * (1176 / 1024) - (775 / 1024);
        else
            pdifmin = cratio - 0.375;
        end

        local critbonus = attacker:getMod(MOD_CRIT_DMG_INCREASE)
        critbonus = utils.clamp(critbonus, 0, 100);
        pdifcrit[1] = pdifmin * ((100 + critbonus)/100);
        pdifcrit[2] = pdifmax * ((100 + critbonus)/100);
    else
        -- max
        local pdifmax = 0;
        if (cratio < 0.9) then
            pdifmax = cratio * (10/9);
        elseif (cratio < 1.1) then
            pdifmax = 1;
        else
            pdifmax = cratio;
        end

        -- min
        local pdifmin = 0;
        if (cratio < 0.9) then
            pdifmin = cratio;
        elseif (cratio < 1.1) then
            pdifmin = 1;
        else
            pdifmin = (cratio * (20/19))-(3/19);
        end

        pdif[1] = pdifmin;
        pdif[2] = pdifmax;
        -- printf("ratio: %f min: %f max %f\n", cratio, pdifmin, pdifmax);

        pdifmin = pdifmin * 1.25;
        pdifmax = pdifmax * 1.25;

        local critbonus = attacker:getMod(MOD_CRIT_DMG_INCREASE)
        critbonus = utils.clamp(critbonus, 0, 100);
        pdifcrit[1] = pdifmin * ((100 + critbonus)/100);
        pdifcrit[2] = pdifmax * ((100 + critbonus)/100);
    end

    return pdif, pdifcrit;
end;

 -- params contains: ftp100, ftp200, ftp300, str_wsc, dex_wsc, vit_wsc, int_wsc, mnd_wsc, canCrit, crit100, crit200, crit300, acc100, acc200, acc300, ignoresDef, ignore100, ignore200, ignore300, atkmulti, accBonus, weaponDamage
 function doAutoRangedWeaponskill(attacker, target, wsID, params, tp, primary, skill)

    local bonusTP = params.bonusTP or 0
    local multiHitfTP = params.multiHitfTP or false
    local bonusacc = attacker:getMod(MOD_WSACC) + (params.accBonus or 0);

    local dstr = utils.clamp(attacker:getStat(MOD_STR) - target:getStat(MOD_VIT), -10, 10)

    -- apply WSC
    local base = math.max((params.weaponDamage or attacker:getRangedDmg()) + dstr +
        (attacker:getStat(MOD_STR) * params.str_wsc + attacker:getStat(MOD_DEX) * params.dex_wsc +
         attacker:getStat(MOD_VIT) * params.vit_wsc + attacker:getStat(MOD_AGI) * params.agi_wsc +
         attacker:getStat(MOD_INT) * params.int_wsc + attacker:getStat(MOD_MND) * params.mnd_wsc +
         attacker:getStat(MOD_CHR) * params.chr_wsc) + math.max(attacker:getMainLvl() - target:getMainLvl(), 0), 1)

    -- Applying fTP multiplier
    local ftpdmgbonus = attacker:getMod(MOD_WEAPONSKILL_DAMAGE_BASE)/100;
    local ftp = autoFTP(tp,params.ftp100,params.ftp200,params.ftp300) + ftpdmgbonus;
    local crit = false

    local ignoredDef = 0;
    if (params.ignoresDef == not nil and params.ignoresDef == true) then
        ignoredDef = calculatedAutoIgnoredDef(tp, target:getStat(MOD_DEF), params.ignored100, params.ignored200, params.ignored300);
    end

    -- get cratio min and max
    local cratio, ccritratio = getAutocRatio(attacker, target, params, ignoredDef, false);
    local ccmin = 0;
    local ccmax = 0;
    local hasMightyStrikes = attacker:hasStatusEffect(EFFECT_MIGHTY_STRIKES);
    local critrate = 0;
    if (params.canCrit) then -- work out critical hit ratios, by +1ing
        critrate = autoFTP(tp,params.crit100,params.crit200,params.crit300);
        -- add on native crit hit rate (guesstimated, it actually follows an exponential curve)
        local nativecrit = (attacker:getStat(MOD_DEX) - target:getStat(MOD_AGI))*0.005; -- assumes +0.5% crit rate per 1 dDEX
        nativecrit = nativecrit + (attacker:getMod(MOD_CRITHITRATE)/100) + attacker:getMerit(MERIT_CRIT_HIT_RATE)/100 - target:getMerit(MERIT_ENEMY_CRIT_RATE)/100;
        if (attacker:hasStatusEffect(EFFECT_INNIN) and attacker:isBehind(target, 23)) then -- Innin crit boost if attacker is behind target
            nativecrit = nativecrit + attacker:getStatusEffect(EFFECT_INNIN):getPower();
        end

        if (nativecrit > 0.2) then -- caps!
            nativecrit = 0.2;
        elseif (nativecrit < 0.05) then
            nativecrit = 0.05;
        end
        critrate = critrate + nativecrit;
    end

    local dmg = base * ftp;

    -- Applying pDIF
    local pdif = generateAutoPdif(cratio[1],cratio[2], false);

    -- First hit has 95% acc always. Second hit + affected by hit rate.
    local missChance = math.random();
    local finaldmg = 0;
    local hitrate = getAutoHitRate(attacker,target,true,bonusacc,false);
    if (params.acc100~=0) then
        -- ACCURACY VARIES WITH TP, APPLIED TO ALL HITS.
        -- print("Accuracy varies with TP.");
        hr = autoAccVariesWithTP(getAutoHitRate(attacker,target,false,bonusacc,false),attacker:getRACC(),tp,params.acc100,params.acc200,params.acc300);
        hitrate = hr;
    end

    local tpHitsLanded = 0;
    if (missChance <= hitrate) then
        if (params.canCrit) then
            local critchance = math.random();
            if (critchance <= critrate or hasMightyStrikes) then -- crit hit!
                crit = true
                local cpdif = generateAutoPdif(ccritratio[1], ccritratio[2], false);
                finaldmg = dmg * cpdif;
            else
                finaldmg = dmg * pdif;
            end
        else
            finaldmg = dmg * pdif;
        end
        tpHitsLanded = 1;
    end

    -- Store first hit bonus for use after other calcs are done..
    local firstHitBonus = ((finaldmg * attacker:getMod(MOD_ALL_WSDMG_FIRST_HIT))/100);

    local numHits = params.numHits;

    if not multiHitfTP then dmg = base end
    local extraHitsLanded = 0;
    if (numHits>1) then
        if (params.acc100==0) then
            -- work out acc since we actually need it now
            hitrate = getAutoHitRate(attacker,target,true,bonusacc,false);
        end

        hitsdone = 1;
        while (hitsdone < numHits) do
            chance = math.random();
            if (chance<=hitrate) then -- it hit
                pdif = generateAutoPdif(cratio[1],cratio[2], false);
                if (canCrit) then
                    critchance = math.random();
                    if (critchance <= critrate or hasMightyStrikes) then -- crit hit!
                        cpdif = generateAutoPdif(ccritratio[1], ccritratio[2], false);
                        finaldmg = finaldmg + dmg * cpdif;
                    else
                        finaldmg = finaldmg + dmg * pdif;
                    end
                else
                    finaldmg = finaldmg + dmg * pdif; -- NOTE: not using 'dmg' since fTP is 1.0 for subsequent hits!!
                end
                extraHitsLanded = extraHitsLanded + 1;
            end
            hitsdone = hitsdone + 1;
        end
    end
    -- print("Landed " .. hitslanded .. "/" .. numHits .. " hits with hitrate " .. hitrate .. "!");

    -- DMG Bonus for any WS
    local bonusdmg = attacker:getMod(MOD_ALL_WSDMG_ALL_HITS);

    -- Add in bonusdmg
    finaldmg = finaldmg * ((100 + bonusdmg)/100);
    finaldmg = finaldmg + firstHitBonus;

    -- Check for reductions
    finaldmg = target:rangedDmgTaken(finaldmg);
    finaldmg = finaldmg * target:getMod(MOD_PIERCERES) / 1000;

    finaldmg = finaldmg * WEAPON_SKILL_POWER
    if tpHitsLanded + extraHitsLanded > 0 then
        finaldmg = takeAutoWeaponskillDamage(target, attacker, params, primary, finaldmg, SLOT_RANGED, tpHitsLanded, (extraHitsLanded * 10) + bonusTP, nil)
    else
        skill:setMsg(MSG_MISS)
    end

    return finaldmg, crit, tpHitsLanded, extraHitsLanded;
end;

function getAutoMultiAttacks(attacker, numHits)
    local bonusHits = 0;
    local multiChances = 1;
    local doubleRate = (attacker:getMod(MOD_DOUBLE_ATTACK) + attacker:getMerit(MERIT_DOUBLE_ATTACK_RATE))/100;
    local tripleRate = (attacker:getMod(MOD_TRIPLE_ATTACK) + attacker:getMerit(MERIT_TRIPLE_ATTACK_RATE))/100;
    local quadRate = attacker:getMod(MOD_QUAD_ATTACK)/100;

    -- QA/TA/DA can only proc on the first hit of each weapon or each fist
    if (attacker:getOffhandDmg() > 0 or attacker:getWeaponSkillType(SLOT_MAIN) == SKILL_H2H) then
        multiChances = 2;
    end

    for i = 1, multiChances, 1 do
        local chance = math.random()
        if (chance < quadRate) then
            bonusHits = bonusHits + 3;
        elseif (chance < tripleRate + quadRate) then
            bonusHits = bonusHits + 2;
        elseif(chance < doubleRate + tripleRate + quadRate) then
            bonusHits = bonusHits + 1;
        end
        if (i == 1) then
            attacker:delStatusEffect(EFFECT_ASSASSIN_S_CHARGE);
            attacker:delStatusEffect(EFFECT_WARRIOR_S_CHARGE);

            -- recalculate DA/TA/QA rate
            doubleRate = (attacker:getMod(MOD_DOUBLE_ATTACK) + attacker:getMerit(MERIT_DOUBLE_ATTACK_RATE))/100;
            tripleRate = (attacker:getMod(MOD_TRIPLE_ATTACK) + attacker:getMerit(MERIT_TRIPLE_ATTACK_RATE))/100;
            quadRate = attacker:getMod(MOD_QUAD_ATTACK)/100;
        end
    end

    if ((numHits + bonusHits ) > 8) then
        return 8;
    end
    return numHits + bonusHits;
end;

function generateAutoPdif(cratiomin, cratiomax, melee)
    local pdif = math.random(cratiomin*1000, cratiomax*1000) / 1000;
    if (melee) then
        pdif = pdif * (math.random(100,105)/100);
    end
    return pdif;
end

function takeAutoWeaponskillDamage(defender, attacker, params, primary, finaldmg, slot, tpHitsLanded, bonusTP, taChar)
    local targetTPMult = params.targetTPMult or 1
    finaldmg = defender:takeWeaponskillDamage(attacker, finaldmg, slot, primary, tpHitsLanded, bonusTP, targetTPMult)
    local enmityEntity = taChar or attacker;
    if (params.overrideCE and params.overrideVE) then
        defender:addEnmity(enmityEntity, params.overrideCE, params.overrideVE)
    else
        local enmityMult = params.enmityMult or 1
        defender:updateEnmityFromDamage(enmityEntity, finaldmg * enmityMult)
    end

    return finaldmg;
end
