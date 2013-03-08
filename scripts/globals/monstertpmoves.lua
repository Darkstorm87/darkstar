require("scripts/globals/magic");
require("scripts/globals/magicburst")
require("scripts/globals/status")

-- Foreword: A lot of this is good estimating since the FFXI playerbase has not found all of info for individual moves.
--			What is known is that they roughly follow player Weaponskill calculations (pDIF, dMOD, ratio, etc) so this is what
--			this set of functions emulates.

-- mob types
-- used in mob:isMobType()
MOBTYPE_NORMAL			= 0x00;
MOBTYPE_PCSPAWNED		= 0x01;
MOBTYPE_NOTORIOUS		= 0x02;
MOBTYPE_FISHED			= 0x04;
MOBTYPE_CALLED			= 0x08;
MOBTYPE_BATTLEFIELD		= 0x10;
MOBTYPE_EVENT			= 0x20;

--skilltype
MOBSKILL_PHYSICAL = 0;
MOBSKILL_MAGICAL = 1;
MOBSKILL_RANGED = 2;
MOBSKILL_SPECIAL = 3;

--skillparam (PHYSICAL)
MOBPARAM_NONE = 0;
MOBPARAM_BLUNT = 1;
MOBPARAM_SLASH = 2;
MOBPARAM_PIERCE = 3;
MOBPARAM_H2H = 4;

--skillparam (MAGICAL)
-- this is totally useless and should be removed
-- add resistence using ELE_FIRE, see bomb_toss.lua
MOBPARAM_FIRE = 6;
MOBPARAM_EARTH = 7;
MOBPARAM_WATER = 8;
MOBPARAM_WIND = 9;
MOBPARAM_ICE = 10;
MOBPARAM_THUNDER = 11;
MOBPARAM_LIGHT = 12;
MOBPARAM_DARK = 13;

--shadowbehav (number of shadows to take off)
MOBPARAM_IGNORE_SHADOWS = 0;
MOBPARAM_1_SHADOW = 1;
MOBPARAM_2_SHADOW = 2;
MOBPARAM_3_SHADOW = 3;
MOBPARAM_4_SHADOW = 4;
MOBPARAM_WIPE_SHADOWS = 999;

TP_ACC_VARIES = 0;
TP_ATK_VARIES = 1;
TP_DMG_VARIES = 2;
TP_CRIT_VARIES = 3;
TP_NO_EFFECT = 0;
TP_MACC_BONUS = 1;
TP_MAB_BONUS = 2;
TP_DMG_BONUS = 3;

MSG_NONE = 0; -- display nothing
MSG_SELF_HEAL = 238;
MSG_ENFEEB_IS = 242; --XXX is petrified.
MSG_ENFEEB = 243; --XXX receives the effect of petrification.
MSG_BUFF = 186;
MSG_DRAIN_HP = 187;
MSG_DRAIN_MP = 225;
MSG_DRAIN_TP = 226;
MSG_NO_EFFECT = 189;
MSG_SHADOW = 31;
MSG_ANTICIPATE = 30;
MSG_DAMAGE = 185; -- player uses, target takes 10 damage. DEFAULT
MSG_MISS = 188;
MSG_RESIST = 85;
MSG_EFFECT_DRAINED = 370; -- <num> status effects are drained from <target>.
MSG_TP_REDUCED = 362; -- tp reduced to
MSG_DISAPPEAR = 378; -- <target>'s stun effect disappears!
MSG_DISAPPEAR_NUM = 401; -- <num> of <target>'s effects disappear!

BOMB_TOSS_HPP = 1;

function MobRangedMove(mob,target,skill,numberofhits,accmod,dmgmod, tpeffect)
	-- this will eventually contian ranged attack code
	return MobPhysicalMove(mob,target,skill,numberofhits,accmod,dmgmod, tpeffect)
end;

-- PHYSICAL MOVE FUNCTION
-- Call this on every physical move!
-- accmod is a linear multiplier for accuracy (1 default)
-- dmgmod is a linear mulitplier for damage (1 default)
-- tpeffect is an enum which can be one of:
-- 0 TP_ACC_VARIES
-- 1 TP_ATK_VARIES
-- 2 TP_DMG_VARIES
-- 3 TP_CRIT_VARIES
-- mtp100/200/300 are the three values for 100% TP, 200% TP, 300% TP just like weaponskills.lua
-- if TP_ACC_VARIES -> three values are acc %s (1.0 is 100% acc, 0.8 is 80% acc, 1.2 is 120% acc)
-- if TP_ATK_VARIES -> three values are attack multiplier (1.5x 0.5x etc)
-- if TP_DMG_VARIES -> three values are

function MobPhysicalMove(mob,target,skill,numberofhits,accmod,dmgmod,tpeffect,mtp100,mtp200,mtp300)
	returninfo = {};

	--get dstr (bias to monsters, so no fSTR)
	dstr = mob:getStat(MOD_STR) - target:getStat(MOD_VIT);
	if(dstr < -10) then
		dstr = -10;
	end

	if(dstr > 10) then
		dstr = 10;
	end

	lvluser = mob:getMainLvl();
	lvltarget = target:getMainLvl();
	acc = mob:getACC();
	eva = target:getEVA();
	--apply WSC
	local base = mob:getWeaponDmg() + dstr; --todo: change to include WSC
	if(base < 1) then
		base = 1;
	end

	--work out and cap ratio
	ratio = mob:getStat(MOD_ATT)/target:getStat(MOD_DEF);
	if (ratio > 1.5) then
		ratio = 1.5;
	end
	if (ratio < 0.5) then
		ratio = 0.5;
	end


	lvldiff = lvluser - lvltarget;

	--work out hit rate for mobs (bias towards them)
	hitrate = (acc*accmod) - eva + (lvldiff*4) + 75;

	-- printf("acc: %f, eva: %f, hitrate: %f", acc, eva, hitrate);
	if (hitrate > 95) then
		hitrate = 95;
	elseif (hitrate < 20) then
		hitrate = 20;
	end

	-- increase damage based on tp
	if(mob:getTP() >= 200) then
		dmgmod = dmgmod + 1.5;
	elseif(mob:getTP() == 300) then
		dmgmod = dmgmod + 2;
	end

	--work out the base damage for a single hit
	hitdamage = (base + lvldiff);
	if(hitdamage < 1) then
		hitdamage = 1;
	end
	hitdamage = hitdamage * dmgmod;

	--work out min and max cRatio
	maxRatio = ratio * 1.2;
	minRatio = ratio * 0.8;

	--apply ftp (assumes 1~3 scalar linear mod)
	if(tpeffect==TP_DMG_BONUS) then
		hitdamage = hitdamage * fTP(skill:getTP(), mtp100, mtp200, mtp300);
	end

	--Applying pDIF
	local double pdif = 0;

	-- start the hits
	local double hitchance = math.random();
	finaldmg = 0;
	hitsdone = 1;
	hitslanded = 0;

	local double chance = math.random();
	--first hit is 95%
	-- if ((chance*100)<=95) then
	-- 	pdif = math.random((minRatio*1000),(maxRatio*1000)) --generate random PDIF
	-- 	pdif = pdif/1000; --multiplier set.
	-- 	finaldmg = finaldmg + hitdamage * pdif;
	-- 	hitslanded = hitslanded + 1;
	-- end
	while (hitsdone <= numberofhits) do
		chance = math.random();
		if ((chance*100)<=hitrate) then --it hit
			pdif = math.random((minRatio*1000),(maxRatio*1000)) --generate random PDIF
			pdif = pdif/1000; --multiplier set.
			finaldmg = finaldmg + hitdamage * pdif;
			hitslanded = hitslanded + 1;
		end
		hitsdone = hitsdone + 1;
	end

	-- printf("final: %f, hits: %f, acc: %f", finaldmg, hitslanded, hitrate);

	-- if an attack landed it must do at least 1 damage
	if(hitslanded >= 1 and finaldmg < 1) then
		finaldmg = 1;
	end

	-- Applies "Damge Taken" and "Physical Damage Taken" mods
	local dmgTaken = target:getMod(MOD_DMG);
	local physDmgTaken = target:getMod(MOD_DMGPHYS);
	local dmgMod = 1;
	local physMod = 1;
	if (dmgTaken > 0) then
		dmgMod = dmgMod+(math.floor((dmgTaken/100)*256)/256);
	else
		dmgMod = dmgMod+(math.ceil((dmgTaken/100)*256)/256);
	end
	if (physDmgTaken > 0) then
		physMod = physMod+(math.floor((physDmgTaken/100)*256)/256);
	else
		physMod = physMod+(math.ceil((physDmgTaken/100)*256)/256);
	end

	finaldmg = math.floor(finaldmg * dmgMod);
	finaldmg = math.floor(finaldmg * physMod);

	-- all hits missed
	if(hitslanded == 0 or finaldmg == 0) then
		finaldmg = 0;
		hitslanded = 0;
		skill:setMsg(MSG_MISS);
	end

	returninfo.dmg = finaldmg;
	returninfo.hitslanded = hitslanded;

	return returninfo;

end

-- MAGICAL MOVE
-- Call this on every magical move!
-- mob/target/skill should be passed from OnMobWeaponSkill.
-- dmg is the base damage (V value), accmod is a multiplier for accuracy (1 default, more than 1 = higher macc for mob),
-- ditto for dmg mod but more damage >1 (equivalent of M value)
-- tpeffect is an enum from one of:
-- 0 = TP_NO_EFFECT
-- 1 = TP_MACC_BONUS
-- 2 = TP_MAB_BONUS
-- 3 = TP_DMG_BONUS
-- tpvalue affects the strength of having more TP along the following lines:
-- TP_NO_EFFECT -> tpvalue has no effect.
-- TP_MACC_BONUS -> direct multiplier to macc (1 for default)
-- TP_MAB_BONUS -> direct multiplier to mab (1 for default)
-- TP_DMG_BONUS -> direct multiplier to damage (V+dINT) (1 for default)
--Examples:
-- TP_DMG_BONUS and TP=100, tpvalue = 1, assume V=150  --> damage is now 150*(TP*1)/100 = 150
-- TP_DMG_BONUS and TP=200, tpvalue = 1, assume V=150  --> damage is now 150*(TP*1)/100 = 300
-- TP_DMG_BONUS and TP=100, tpvalue = 2, assume V=150  --> damage is now 150*(TP*2)/100 = 300
-- TP_DMG_BONUS and TP=200, tpvalue = 2, assume V=150  --> damage is now 150*(TP*2)/100 = 600

function MobMagicalMove(mob,target,skill,dmg,element,dmgmod,tpeffect,tpvalue)
	returninfo = {};
	--get all the stuff we need
	local resist = 1;

	-- plus 100 forces it to be a number
	mab = (100+mob:getMod(MOD_MATT)) / (100+target:getMod(MOD_MDEF));

	if (mab > 1.5) then
		mab = 1.5;
	end

	if (mab < 0.5) then
		mab = 0.5;
	end

	lvluser = mob:getMainLvl();
	lvltarget = target:getMainLvl();

	lvldiff = lvltarget - lvluser;

	damage = dmg + lvldiff;
	if(damage<1) then
		damage = 1;
	end

	if(tpeffect==TP_DMG_BONUS) then
		damage = damage * ((skill:getTP()*tpvalue)/100);
	end

	-- printf("power: %f, bonus: %f", damage, mab);
	-- resistence is added last
	finaldmg = damage * mab * dmgmod;

	-- get resistence
	resist = applyPlayerResistance(mob,-1,target,mob:getStat(MOD_INT)-target:getStat(MOD_INT),0,element);

	-- get elemental damage reduction
	local defense = 1;
	if(element > 0) then
		defense = 1 + (target:getMod(defenseMod[element]) * -1000);

		-- max defense is 50%
		if(defense < 0.5) then
			defense = 0.5;
		end
	end

	finaldmg = finaldmg * resist * defense;

	-- Applies "Damage Taken" and "Magic Damage Taken" gear
	-- MDT is stored in amount/256
	local dmgTaken = target:getMod(MOD_DMG);
	local dmgMod = 1;
	if (dmgTaken > 0) then
		dmgMod = dmgMod+(math.floor((dmgTaken/100)*256)/256);
	else
		dmgMod = dmgMod+(math.ceil((dmgTaken/100)*256)/256);
	end
	local magicDmgMod = (256 + target:getMod(MOD_DMGMAGIC)) / 256;

	finaldmg = finaldmg * dmgMod * magicDmgMod;

	-- printf("dmgmod: %f, magicdmgmod: %f, resist: %f, def: %f", dmgMod, magicDmgMod, resist, defense);
	if(finaldmg < 1) then
		finaldmg = 1;
	end

	returninfo.dmg = finaldmg;
	return returninfo;

end

--mob version
--effect = EFFECT_WHATEVER if enfeeble
--statmod = the stat to account for resist (INT,MND,etc) e.g. MOD_INT
--This determines how much the monsters ability resists on the player.
--TODO: update all mob moves to use the new function
function applyPlayerResistance(mob,effect,target,diff,skill,element)
    resist = 1.0;
    magicaccbonus = 0;

	--get the base acc (just skill plus magic acc mod)
	magicacc = getSkillLvl(1, mob:getMainLvl());

	--difference in int/mnd
	if diff > 10 then
		magicacc = magicacc + 10 + (diff - 10)/2;
	else
		magicacc = magicacc + diff;
	end

	--base magic evasion (base magic evasion plus resistances(players), plus elemental defense(mobs)
	local magiceva = target:getMod(MOD_MEVA);

	-- add elemental resistence
	if(element > 0) then
		if(target:isPC()) then
			magiceva = magiceva + target:getMod(resistMod[element]);
		else
			magicacc = magicacc * (1 + (target:getMod(resistMod[element]*-100)));
		end
	end

	p = magicacc - (magiceva * 0.85);

	--printf("acc: %f, eva: %f, bonus: %f", magicacc, magiceva, magicaccbonus);
	--double any acc over 50 if it's over 50
	if(p > 5) then
		p = 5 + (p - 5) * 2;
	end

	--add a flat bonus that won't get doubled in the previous step
	p = p + 45;

	--add a scaling bonus or penalty based on difference of targets level from caster
	leveldiff = mob:getMainLvl() - target:getMainLvl();
	if leveldiff > 0 then
		p = p - (25 * ( (mob:getMainLvl()) / 75 )) + leveldiff;
	else
		p = p + (25 * ( (mob:getMainLvl()) / 75 )) + leveldiff;
	end

	-- printf("final power: %f", p);
	--cap accuracy
    if(p > 95) then
        p = 95;
    elseif(p < 5) then
        p = 5;
    end

	p = p / 100;

    -- Resistance thresholds based on p.  A higher p leads to lower resist rates, and a lower p leads to higher resist rates.
    half = (1 - p);
    quart = ((1 - p)^2);
    eighth = ((1 - p)^3);
    sixteenth = ((1 - p)^4);
    -- printf("HALF: %f", half);
    -- printf("QUART: %f", quart);
    -- printf("EIGHTH: %f", eighth);
    -- printf("SIXTEENTH: %f", sixteenth);


	-- add effect resistence
	-- this only increases chances for half / quarter resist
	-- this eventually needs to be fixed
	-- traits should be able to fully resist
	if(effect ~= nil and effect > 0) then
		local effectres = 0;
		if(effect == EFFECT_SLEEP_I or effect == EFFECT_SLEEP_II or effect == EFFECT_LULLABY) then
			effectres = MOD_SLEEPRES;
		elseif(effect == EFFECT_POISON) then
			effectres = MOD_POISONRES;
		elseif(effect == EFFECT_PARALYZE) then
			effectres = MOD_PARALYZERES;
		elseif(effect == EFFECT_BLIND) then
			effectres = MOD_BLINDRES
		elseif(effect == EFFECT_SILENCE) then
			effectres = MOD_SILENCERES;
		elseif(effect == EFFECT_PLAGUE or effect == EFECT_DISEASE) then
			effectres = MOD_VIRUSRES;
		elseif(effect == EFFECT_PETRIFICATION) then
			effectres = MOD_PETRIFYRES;
		elseif(effect == EFFECT_BIND) then
			effectres = MOD_BINDRES;
		elseif(effect == EFFECT_CURSE_I or effect == EFFECT_CURSE_II or effect == EFFECT_BANE) then
			effectres = MOD_CURSERES;
		elseif(effect == EFFECT_WEIGHT) then
			effectres = MOD_GRAVITYRES;
		elseif(effect == EFFECT_SLOW) then
			effectres = MOD_SLOWRES;
		elseif(effect == EFFECT_STUN) then
			effectres = MOD_STUNRES;
		elseif(effect == EFFECT_CHARM) then
			effectres = MOD_CHARMRES;
		end

		if(effectres > 0) then
			local resrate = 1+(target:getMod(effectres)/20);
			if(resrate > 1.5) then
				resrate = 1.5;
			end

			-- printf("Resist percentage: %f", resrate);
			-- increase resistance based on effect
			quart = quart * resrate;
			half = half * resrate;
		end
	end

    resvar = math.random();

    -- Determine final resist based on which thresholds have been crossed.
    if(resvar <= sixteenth) then
        resist = 0.0625;
        --printf("Spell resisted to 1/16!!!  Threshold = %u",sixteenth);
    elseif(resvar <= eighth) then
        resist = 0.125;
        --printf("Spell resisted to 1/8!  Threshold = %u",eighth);
    elseif(resvar <= quart) then
        resist = 0.25;
        --printf("Spell resisted to 1/4.  Threshold = %u",quart);
    elseif(resvar <= half) then
        resist = 0.5;
        --printf("Spell resisted to 1/2.  Threshold = %u",half);
    else
        resist = 1.0;
        --printf("Not resisted: 1.0");
    end
    return resist;

end;

function mobAddBonuses(caster, spell, target, dmg, ele)

	speciesReduction = target:getMod(defenseMod[ele]);
	speciesReduction = 1.00 - (speciesReduction/1000);
	dmg = math.floor(dmg * speciesReduction);

	dayWeatherBonus = 1.00;

	if caster:getWeather() == singleWeatherStrong[ele] then
		if math.random() < 0.33 or caster:getEquipID(SLOT_WAIST) == elementalObi[ele] then
			dayWeatherBonus = dayWeatherBonus + 0.10;
		end
	elseif caster:getWeather() == singleWeatherWeak[ele] then
		if math.random() < 0.33 or caster:getEquipID(SLOT_WAIST) == elementalObiWeak[ele] then
			dayWeatherBonus = dayWeatherBonus - 0.10;
		end
	elseif caster:getWeather() == doubleWeatherStrong[ele] then
		if math.random() < 0.33 or caster:getEquipID(SLOT_WAIST) == elementalObi[ele] then
			dayWeatherBonus = dayWeatherBonus + 0.25;
		end
	elseif caster:getWeather() == doubleWeatherWeak[ele] then
		if math.random() < 0.33 or caster:getEquipID(SLOT_WAIST) == elementalObiWeak[ele] then
			dayWeatherBonus = dayWeatherBonus - 0.25;
		end
	end

	if VanadielDayElement() == dayStrong[ele] then
		if math.random() < 0.33 or caster:getEquipID(SLOT_WAIST) == elementalObi[ele] then
			dayWeatherBonus = dayWeatherBonus + 0.10;
		end
	elseif VanadielDayElement() == dayWeak[ele] then
		if math.random() < 0.33 or caster:getEquipID(SLOT_WAIST) == elementalObiWeak[ele] then
			dayWeatherBonus = dayWeatherBonus + 0.10;
		end
	end

	if dayWeatherBonus > 1.35 then
		dayWeatherBonus = 1.35;
	end

	dmg = math.floor(dmg * dayWeatherBonus);

    burst, burstBonus = calculateMobMagicBurstAndBonus(caster, ele, target);

	-- not sure what to do for this yet
    -- if(burst > 1.0) then
		-- spell:setMsg(spell:getMagicBurstMessage()); -- "Magic Burst!"
	-- end

	dmg = math.floor(dmg * burst);

    mab = (100 + caster:getMod(MOD_MATT)) / (100 + target:getMod(MOD_MDEF)) ;

	dmg = math.floor(dmg * mab);

	magicDmgMod = (256 + target:getMod(MOD_DMGMAGIC)) / 256;

	dmg = math.floor(dmg * magicDmgMod);

	-- print(affinityBonus);
	-- print(speciesReduction);
	-- print(dayWeatherBonus);
	-- print(burst);
	-- print(mab);
	-- print(magicDmgMod);

    return dmg;
end

function calculateMobMagicBurstAndBonus(caster, ele, target)

    local burst = 1.0;

    local skillchainTier, skillchainCount = MobFormMagicBurst(ele, target);

    if(skillchainTier > 0) then
		if(skillchainCount == 1) then
			burst = 1.3;
		elseif(skillchainCount == 2) then
			burst = 1.35;
		elseif(skillchainCount == 3) then
			 burst = 1.40;
		elseif(skillchainCount == 4) then
			burst = 1.45;
		elseif(skillchainCount == 5) then
			burst = 1.50;
		else
			-- Something strange is going on if this occurs.
			burst = 1.0;
		end
    end

    return burst, burstBonus;
end;

-- Calculates breath damage
-- mob is a mob reference to get hp and lvl
-- percent is the percentage to take from HP
-- base is calculated from main level to create a minimum
-- Equation: (HP * percent) + (LVL / base)
-- cap is optional, defines a maxiumum damage
function MobBreathMove(mob, target, percent, base, element, cap)
	local damage = (mob:getHP() * percent) + (mob:getMainLvl() / base);

	if(cap == nil) then
		-- super cap for high health mobs
		if(damage > 700) then
			damage = 700 + math.random(200);
		end

		-- cap max damage
		if(damage > mob:getHP()/5) then
			damage = math.floor(mob:getHP()/5);
		end
	else
		if(damage > cap) then
			damage = cap;
		end
	end

	-- elemental resistence
	if(element ~= nil and element > 0) then
		-- no skill available, pass nil
		local resist = applyPlayerResistance(mob,nil,target,mob:getStat(MOD_INT)-target:getStat(MOD_INT),0,element);

		-- get elemental damage reduction
		local defense = 1 - (target:getMod(resistMod[element]) + target:getMod(defenseMod[element])) / 256;

		-- max defense is 50%
		if(defense < 0.5) then
			defense = 0.5;
		end

		damage = damage * resist * defense;
	end

	-- add breath resistence and magic resistence
	local dmgTaken = target:getMod(MOD_DMG);
	local dmgMod = 1;
	if (dmgTaken > 0) then
		dmgMod = dmgMod+(math.floor((dmgTaken/100)*256)/256);
	else
		dmgMod = dmgMod+(math.ceil((dmgTaken/100)*256)/256);
	end

	local dmgBreath = 1+((target:getMod(MOD_DMGBREATH) / 100)*256)/256;
	local dmgMagic = ((256 + target:getMod(MOD_DMGMAGIC))/256);

	-- cap breath reduction at 50%
	if(dmgBreath < 0.5) then
		dmgBreath = 0.5;
	end

	if(dmgMod < 0.5) then
		dmgMod = 0.5;
	end

	if(dmgMagic < 0.5) then
		dmgMagic = 0.5;
	end

	damage = damage * dmgMod * dmgBreath * dmgMagic;

	if(damage <= 0) then
		damage = 1;
	end

	return damage;
end;

function MobFinalAdjustments(dmg,mob,skill,target,skilltype,skillparam,shadowbehav)

	-- physical attack missed, skip rest
	if(skill:hasMissMsg()) then
		return 0;
	end

	-- set message to damage
	-- this is for AoE because its only set once
	skill:setMsg(MSG_DAMAGE);

	--Handle shadows depending on shadow behaviour / skilltype
	if(shadowbehav ~= MOBPARAM_WIPE_SHADOWS and shadowbehav ~= MOBPARAM_IGNORE_SHADOWS) then --remove 'shadowbehav' shadows.
		targShadows = target:getMod(MOD_UTSUSEMI);
		shadowType = MOD_UTSUSEMI;

		if(targShadows==0) then --try blink, as utsusemi always overwrites blink this is okay
			targShadows = target:getMod(MOD_BLINK);
			shadowType = MOD_BLINK;
		end

		if(targShadows>0) then
		--Blink has a VERY high chance of blocking tp moves, so im assuming its 100% because its easier!

			if(shadowType == MOD_UTSUSEMI and skill:isAoE()) then
				shadowbehav = MobTakeAoEShadow(mob, target, shadowbehav);
			end

			if(targShadows >= shadowbehav) then --no damage, just suck the shadows
				skill:setMsg(MSG_SHADOW);

				local shadowsLeft = targShadows-shadowbehav;
				target:setMod(shadowType, shadowsLeft);
				if(shadowsLeft > 0 and shadowType == MOD_UTSUSEMI) then --update icon
					effect = target:getStatusEffect(EFFECT_COPY_IMAGE);
					if(effect ~= nil) then
						if(shadowsLeft == 1) then
							effect:setIcon(EFFECT_COPY_IMAGE);
						elseif(shadowsLeft == 2) then
							effect:setIcon(EFFECT_COPY_IMAGE_2);
						elseif(shadowsLeft == 3) then
							effect:setIcon(EFFECT_COPY_IMAGE_3);
						end
					end
				end
				-- remove icon
				if(shadowsLeft <= 0) then
					target:delStatusEffect(EFFECT_COPY_IMAGE);
					target:delStatusEffect(EFFECT_BLINK);
				end
				return shadowbehav;
			else --less shadows than this move will take, remove all and factor damage down
				dmg = dmg * ((shadowbehav-targShadows)/shadowbehav);
				target:setMod(MOD_UTSUSEMI,0);
				target:setMod(MOD_BLINK,0);
				target:delStatusEffect(EFFECT_COPY_IMAGE);
				target:delStatusEffect(EFFECT_BLINK);
			end
		end
	elseif(shadowbehav == MOBPARAM_WIPE_SHADOWS) then --take em all!
		target:setMod(MOD_UTSUSEMI,0);
		target:setMod(MOD_BLINK,0);
		target:delStatusEffect(EFFECT_COPY_IMAGE);
		target:delStatusEffect(EFFECT_BLINK);
	end

	--handle Third Eye using shadowbehav as a guide
	teye = target:getStatusEffect(EFFECT_THIRD_EYE);
	if(teye ~= nil and skilltype==MOBSKILL_PHYSICAL) then --T.Eye only procs when active with PHYSICAL stuff
		if(shadowbehav == MOBPARAM_WIPE_SHADOWS) then --e.g. aoe moves
			target:delStatusEffect(EFFECT_THIRD_EYE);
		elseif(shadowbehav ~= MOBPARAM_IGNORE_SHADOWS) then --it can be absorbed by shadows
			--third eye doesnt care how many shadows, so attempt to anticipate, but reduce
			--chance of anticipate based on previous successful anticipates.
			prevAnt = teye:getPower();
			skill:setMsg(MSG_ANTICIPATE)
			if(prevAnt == 0) then
				--100% proc
				teye:setPower(1);
				return 0;
			end
			if( (math.random()*100) < (80-(prevAnt*10)) ) then
				--anticipated!
				teye:setPower(prevAnt+1);
				return 0;
			end
			target:delStatusEffect(EFFECT_THIRD_EYE);
		end
	end


	if(skilltype == MOBSKILL_PHYSICAL and target:hasStatusEffect(EFFECT_PHYSICAL_SHIELD)) then
		return 0;
	end

	if(skilltype == MOBSKILL_RANGED and target:hasStatusEffect(EFFECT_ARROW_SHIELD)) then
		return 0;
	end

	-- handle elemental resistence
	if(skilltype == MOBSKILL_MAGICAL and target:hasStatusEffect(EFFECT_MAGIC_SHIELD)) then
		return 0;
	end

	--handling phalanx
	dmg = dmg - target:getMod(MOD_PHALANX);
	if(dmg<0) then
		return 0;
	end

	--handle invincible
	if(target:hasStatusEffect(EFFECT_INVINCIBLE) and skilltype==MOBSKILL_PHYSICAL)then
		return 0;
	end
	--handle pd
	if(target:hasStatusEffect(EFFECT_PERFECT_DODGE) and skilltype==MOBSKILL_PHYSICAL)then
		return 0;
	end

	--handling stoneskin
	skin = target:getMod(MOD_STONESKIN);
	if(skin>0) then
		if(skin >= dmg) then --absorb all damage
			target:delMod(MOD_STONESKIN,dmg);
			if(target:getMod(MOD_STONESKIN)==0) then
				target:delStatusEffect(EFFECT_STONESKIN);
			end
			return 0;
		else --absorbs some damage then wear
			target:delMod(MOD_STONESKIN,skin);
			target:delStatusEffect(EFFECT_STONESKIN);
			return dmg - skin;
		end
	end

	return dmg;
end;

-- returns true if mob attack hit
-- used to stop tp move status effects
function MobPhysicalHit(skill, dmg, target, hits)
	-- if message is not the default. Then there was a miss, shadow taken etc
	return skill:getMsg() == MSG_DAMAGE or skill:getMsg() == MSG_DRAIN_HP;
end;

-- function MobHit()
-- end;

-- function MobAoEHit()
-- end;

-- function MobMagicHit()
-- end;

-- function MobMagicAoEHit()
-- end;

-- Adds a status effect to a target
function MobStatusEffectMove(mob, target, typeEffect, power, tick, duration)
	if(target:canGainStatusEffect(typeEffect, power)) then
		local statmod = MOD_INT;
		local element = mob:getStatusEffectElement(typeEffect);

		local resist = applyPlayerResistance(mob,typeEffect,target,mob:getStat(statmod)-target:getStat(statmod),0,element);

		if(resist >= 0.5) then
			target:addStatusEffect(typeEffect,power,tick,duration*resist);
			return MSG_ENFEEB_IS;
		end

		return MSG_MISS; -- resist !
	end
	return MSG_NO_EFFECT; -- no effect
end;

-- similar to status effect move except, this will not land if the attack missed
function MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, power, tick, duration)

    if(MobPhysicalHit(skill, 0, 0, 0)) then
        MobStatusEffectMove(mob, target, typeEffect, power, tick, duration);
    end
end;

-- similar to statuseffect move except it will only take effect if facing
function MobGazeMove(mob, target, typeEffect, power, tick, duration)
	if(target:isFacing(mob)) then
		return MobStatusEffectMove(mob, target, typeEffect, power, tick, duration);
	end
	return MSG_NO_EFFECT;
end;

function MobBuffMove(mob, typeEffect, power, tick, duration)
    if(mob:addStatusEffect(typeEffect,power,tick,duration)) then
	    return MSG_BUFF;
    end
	return MSG_NO_EFFECT;
end;

function MobTakeAoEShadow(mob, target, max)

	-- local chance = 75;

	-- local targetSkill = target:getSkillLevel(NINJUTSU_SKILL);
	-- local mobSkill = getSkillLvl(3, mob:getMainLvl());

	-- this is completely crap and should be using actual nin skill
	-- TODO fix this
	if(target:getMainJob() == JOB_NIN and math.random() < 0.6) then
		max = max - 1;
		if(max < 1) then
			max = 1;
		end
	end

	return math.random(1, max);
end;

function fTP(tp,ftp1,ftp2,ftp3)
	if(tp<100) then
		tp=100;
	end
	if(tp>=100 and tp<200) then
		return ftp1 + ( ((ftp2-ftp1)/100) * (tp-100));
	elseif(tp>=200 and tp<=300) then
		--generate a straight line between ftp2 and ftp3 and find point @ tp
		return ftp2 + ( ((ftp3-ftp2)/100) * (tp-200));
	end
	return 1; --no ftp mod
end;
