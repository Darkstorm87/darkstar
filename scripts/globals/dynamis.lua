----------------------------------- 		
-- Dynamis-Bastok
----------------------------------- 

--  1: BST Vanguard Beasttender + Vanguard's Scorpion
--  2: WHM Vanguard Constable
--  3: PLD Vanguard Defender
--  4: DRG Vanguard Drakekeeper + Vanguard's Wyvern
--  5: SAM Vanguard Hatamoto
--  6: NIN Vanguard Kusa
--  7: RNG Vanguard Mason
--  8: MNK Vanguard Militant
--  9: BRD Vanguard Minstrel
-- 10: RDM Vanguard Protector
-- 11: THF Vanguard Purloiner
-- 12: BLM Vanguard Thaumaturge
-- 13: SMN Vanguard Undertaker + Vanguard's Avatar
-- 14: DRK Vanguard Vigilante
-- 15: WAR Vanguard Vindicator

-- [Position on the map] Adamantking mobid, {spawnlist: mob1, mob2,...}
bastyList = {--[[001]] 17539350,{6,12},		--[[002]] 17539351,{5,9},		--[[003]] 17539352,{10,15},		--[[004]] 17539353,{11,15},		--[[005]] 17539354,{4,9},
			 --[[006]] 17539355,{1,1},		--[[007]] 17539356,{1,1},		--[[008]] 17539357,{1,1},		--[[009]] 17539358,{5,9},		--[[010]] 17539359,{5,9},
			 --[[011]] 17539360,{6,12,15},	--[[012]] 17539361,{4,5,9},		--[[013]] 17539362,{2,6},		--[[014]] 17539363,{12,14},		--[[016]] 17539364,{10},
			 --[[018]] 17539367,{11},		--[[020]] 17539369,{14,6,12},	--[[021]] 17539370,{4,10},		--[[022]] 17539371,{12,5},		--[[023]] 17539372,{14,9},
			 --[[024]] 17539373,{7,8},		--[[025]] 17539374,{2,15,17539118},--[[027]] 17539375,{10,11},	--[[028]] 17539376,{6,3,5,15,12,9,17539119,17539120,17539161},
			 --[[032]] 17539377,{6,14,2},	--[[033]] 17539378,{11,15},		--[[034]] 17539379,{2,5},		--[[035]] 17539380,{3,8,9},		--[[036]] 17539381,{3,8,10},
			 --[[037]] 17539382,{3,6,10},	--[[039]] 17539383,{1,1,1},		--[[040]] 17539384,{13},		--[[042]] 17539387,{1,1,1},		--[[043]] 17539388,{5,12},
			 --[[044]] 17539389,{11,15,14},	--[[045]] 17539390,{15,8,10},	--[[046]] 17539391,{15,5,10},	--[[047]] 17539392,{14,8,10},	--[[048]] 17539393,{3,11,10},
			 --[[049]] 17539394,{6},		--[[050]] 17539395,{15,9},		--[[051]] 17539396,{4,6,10},	--[[052]] 17539397,{14,5,9},	--[[053]] 17539398,{2,17539162,17539188},
			 --[[055]] 17539399,{2,17539143},--[[056]] 17539400,{13},		--[[057]] 17539401,{13},		--[[058]] 17539402,{15,8,2},	--[[059]] 17539403,{15,11},
			 --[[060]] 17539404,{14,8,2},	--[[061]] 17539405,{3,8,2},		--[[062]] 17539406,{2},			--[[063]] 17539407,{14,8,2},	--[[064]] 17539408,{3,14,1},
			 --[[065]] 17539409,{14,8,9},	--[[066]] 17539410,{15,11,10},	--[[068]] 17539412,{3,5,12},	--[[069]] 17539413,{2,17539190},--[[070]] 17539414,{7,7},
			 --[[071]] 17539415,{7},		--[[072]] 17539416,{4,11},		--[[073]] 17539417,{14,5},		--[[075]] 17539419,{3,6},		--[[076]] 17539420,{15,9},
			 --[[077]] 17539421,{4,12},		--[[078]] 17539422,{3,8,12},	--[[079]] 17539423,{14,8,12},	--[[082]] 17539426,{6},			--[[083]] 17539427,{3,6},
			 --[[086]] 17539430,{15,6},		--[[087]] 17539431,{14,5,9},	--[[088]] 17539432,{8,8,14,17539163,12,7,7},--[[089]] 17539163,{17539300,17539301,17539304}, --[[090]] 17539433,{3,2},
			 --[[091]] 17539434,{2,17539147},--[[093]] 17539435,{4,11,2},	--[[095]] 17539437,{3,11},		--[[096]] 17539438,{6,10},		--[[097]] 17539439,{11,12},
			 --[[098]] 17539440,{6,9},		--[[099]] 17539441,{14,9},		--[[100]] 17539442,{3,10},		--[[101]] 17539443,{4,5},		--[[102]] 17539444,{11},
			 --[[105]] 17539447,{5,10},		--[[106]] 17539448,{6,12},		--[[107]] 17539449,{4,8},		--[[108]] 17539450,{4,10},		--[[109]] 17539451,{3,12}
			 };
----[[011]] 00000000,{},--[[012]] 00000000,{},--[[013]] 00000000,{},--[[014]] 00000000,{},--[[015]] 00000000,{},
-- Need to add :
-- 39/42 random nm spawn with 3 BST

----------------------------------- 		
-- Dynamis-San d'Oria
----------------------------------- 

--  1: WAR Vanguard Footsoldier
--  2: MNK Vanguard Grappler
--  3: WHM Vanguard Amputator
--  4: BLM Vanguard Mesmerizer
--  5: RDM Vanguard Vexer
--  6: THF Vanguard Pillager
--  7: PLD Vanguard Trooper
--  8: DRK Vanguard Neckchopper
--  9: BST Vanguard Hawker + Vanguard's Hecteyes
-- 10: BRD Vanguard Bugler
-- 11: RNG Vanguard Predator
-- 12: SAM Vanguard Gutslasher
-- 13: NIN Vanguard Backstabber
-- 14: DRG Vanguard Impaler + Vanguard's Wyvern
-- 15: SMN Vanguard Dollmaster + Vanguard's Avatar

-- [Position on the map] Adamantking mobid, {spawnlist: mob1, mob2,...}
sandyList = {--[[001]] 17535250,{1,1},			--[[002]] 17535251,{2},				--[[003]] 17535252,{2},			--[[004]] 17535253,{5},
			 --[[005]] 17535254,{5},			--[[006]] 17535255,{2,2,2},			--[[008]] 17535257,{7,8},		--[[009]] 17535258,{1,1},
			 --[[010]] 17535259,{5,5},			--[[011]] 17535260,{14,14},			--[[012]] 17535261,{3,3},		--[[013]] 17535262,{6,6},
			 --[[014]] 17535263,{13,13},		--[[015]] 17535264,{12,12},			--[[017]] 17535266,{2,4,4},		--[[018]] 17535267,{17535026},
			 --[[019]] 17535026,{9,4,4},		--[[020]] 17535268,{17535057},		--[[021]] 17535057,{7,11,11},	--[[022]] 17535269,{6},
			 --[[023]] 17535270,{3,4},			--[[024]] 17535271,{6},				--[[025]] 17535272,{6,10},		--[[026]] 17535273,{6,10},
			 --[[027]] 17535274,{6,10},			--[[029]] 17535276,{11,11},			--[[030]] 17535277,{3,3},		--[[032]] 17535279,{8,8,17535032},
			 --[[036]] 17535003,{6,6,10},		--[[037]] 17535283,{12,12},			--[[038]] 17535284,{9,9},		--[[039]] 17535285,{11,11},
			 --[[040]] 17535286,{13,13},		--[[041]] 17535287,{15,15},			--[[042]] 17535288,{15,15},		--[[043]] 17535289,{15,15},
			 --[[044]] 17535290,{15,15},		--[[045]] 17535291,{11,11},			--[[046]] 17535292,{13,13},		--[[047]] 17535293,{9,9},
			 --[[048]] 17535294,{12,12},		--[[049]] 17535295,{2,1},			--[[050]] 17535296,{3},			--[[051]] 17535297,{7,1,1},
			 --[[052]] 17535298,{11,11},		--[[053]] 17535299,{2,1},			--[[054]] 17535300,{3},			--[[055]] 17535301,{3},
			 --[[056]] 17535302,{6,6},			--[[057]] 17535303,{3},				--[[058]] 17535304,{7,7},		--[[061]] 17535004,{2,2,10},
			 --[[063]] 17535308,{8,8},			--[[064]] 17535309,{14,14},			--[[065]] 17535310,{9,9},		--[[069]] 17535314,{5,5},
			 --[[070]] 17535315,{2,2,17535006},	--[[071]] 17535316,{4,4},			--[[073]] 17535318,{12,12},		--[[074]] 17535319,{12,13},
			 --[[075]] 17535320,{13,13},		--[[076]] 17535321,{3,3,11,11,11},	--[[077]] 17535322,{8,8},		--[[078]] 17535323,{4,4},
			 --[[079]] 17535324,{3,3},			--[[080]] 17535325,{5,5},			--[[081]] 17535326,{9,9},		--[[082]] 17535327,{9},
			 --[[083]] 17535328,{9,9},			--[[085]] 17535331,{9,9},			--[[087]] 17535332,{5,5,4,4},	--[[088]] 17535333,{7,7},
			 --[[089]] 17535334,{11,11,11},		--[[090]] 17535335,{8,8},			--[[091]] 17535336,{5,1,1},		--[[092]] 17535337,{10,10},
			 --[[093]] 17535338,{17535044,17535005,17535113},						--[[094]] 17535005,{13,13},		--[[095]] 17535113,{13,13},--[[096]] 17535339,{14,14},
			 --[[097]] 17535340,{11,11},		--[[098]] 17535341,{14,14},			--[[099]] 17535342,{17535114,17535115},--[[100]] 17535114,{10},
			 --[[101]] 17535115,{10},			--[[102]] 17535343,{14,14,1,1},		--[[104]] 17535345,{7,7},		--[[105]] 17535346,{8,8,5,5},
			 --[[106]] 17535347,{1,1,7,7},		--[[107]] 17535348,{13,13},			--[[108]] 17535349,{12,12},		--[[110]] 17535350,{15,15,15},
			 --[[111]] 17535355,{14,14,14},		--[[116]] 17535356,{8,8,8,4,4},		--[[117]] 17535357,{9,9,9},		--[[118]] 17535358,{12,12,5,5,10,10},
			 --[[119]] 17535359,{7,7,7,6,6},	--[[120]] 17535360,{14,14,14},		--[[121]] 17535361,{1,1,3,3},	--[[122]] 17535362,{2,2,2,3,3},
			 --[[123]] 17535363,{15,15,10,10},	--[[124]] 17535364,{14,14,14},		--[[125]] 17535365,{15,15},		--[[126]] 17535366,{13,13,13,13},
			 --[[127]] 17535367,{12,12,12},		--[[128]] 17535368,{11,11,11},		--[[129]] 17535369,{10,10,10},	--[[130]] 17535370,{6,6,6,10,10},
			 --[[131]] 17535371,{12,12,5,5,4,4},--[[132]] 17535372,{6,6,6},			--[[133]] 17535373,{9,9,9},		--[[134]] 17535374,{8,8,8},
			 --[[135]] 17535375,{7,7,7},		--[[136]] 17535376,{5,5,5},			--[[137]] 17535377,{3,3,3},		--[[138]] 17535378,{2,2,2},
			 --[[139]] 17535379,{1,1,1},		--[[140]] 17535380,{4,4,4},			--[[141]] 17535381,{12},		--[[142]] 17535382,{12},
			 --[[143]] 17535383,{2},			--[[144]] 17535384,{2},				--[[145]] 17535385,{8,8,8},		--[[146]] 17535386,{7,7,7},
			 --[[147]] 17535387,{15,15,17535390},--[[149]] 17535389,{15,15,17535388}};

----------------------------------- 		
-- Dynamis-Windurst
----------------------------------- 

--  1: WAR Vanguard Skirmisher
--  2: MNK Vanguard Sentinel
--  3: WHM Vanguard Priest
--  4: BLM Vanguard Prelate
--  5: RDM Vanguard Visionary
--  6: THF Vanguard Liberator
--  7: PLD Vanguard Exemplar 
--  8: DRK Vanguard Inciter
--  9: BST Vanguard Ogresoother + Vanguard's Crow
-- 10: BRD Vanguard Chanter
-- 11: RNG Vanguard Salvager
-- 12: SAM Vanguard Persecutor
-- 13: NIN Vanguard Assassin
-- 14: DRG Vanguard Partisan + Vanguard's Wyvern 
-- 15: SMN Vanguard Oracle + Vanguard's Avatar 

-- [Position on the map] Avatar Icon mobid, {spawnlist: mob1, mob2,...}
windyList = {--[[001]] 17543461,{0,0}, --[[002]] 17543462,{0,0}, --[[003]] 17543463,{0,0}, --[[004]] 17543490,{0,0}, 
			 --[[005]] 17543491,{0,0}, --[[006]] 17543492,{0,0}, --[[007]] 17543493,{0,0}, --[[008]] 17543494,{0,0}, 
			 --[[009]] 17543495,{0,0}, --[[010]] 17543496,{0,0}, --[[011]] 17543497,{0,0}, --[[012]] 17543498,{0,0}, 
			 --[[013]] 17543499,{0,0}, --[[014]] 17543500,{0,0}, --[[015]] 17543501,{0,0}, --[[016]] 17543502,{0,0}, 
			 --[[017]] 17543503,{0,0}, --[[018]] 17543504,{0,0}, --[[019]] 17543505,{0,0}, --[[020]] 17543506,{0,0}, 
			 --[[021]] 17543507,{0,0,17543268,17543269}, --[[022]] 17543268,{0,0}, --[[023]] 17543269,{0,0}, --[[024]] 17543508,{0,0,17543305}, 
			 --[[025]] 17543305,{0,0}, --[[026]] 17543509,{0,0}, --[[027]] 17543510,{0,0}, --[[028]] 17543511,{0,0}, 
			 --[[029]] 17543512,{0,0}, --[[030]] 17543513,{0,0}, --[[031]] 17543514,{0,0}, --[[032]] 17543515,{0,0,17543306}, 
			 --[[033]] 17543306,{0,0}, --[[034]] 17543516,{0,0}, --[[035]] 17543517,{0,0,17543353,17543354,17543362,17543363,17543392}, --[[036]] 17543353,{0,0}, 
			 --[[037]] 17543354,{0,0}, --[[038]] 17543362,{0,0}, --[[039]] 17543363,{0,0}, --[[040]] 17543392,{0,0}, 
			 --[[041]] 17543518,{0,0,17543393}, --[[042]] 17543393,{0,0}, --[[043]] 17543519,{0,0}, --[[044]] 17543520,{0,0}, 
			 --[[045]] 17543521,{0,0}, --[[046]] 17543522,{0,0,17543523,17543524,17543525,17543526,17543357}, --[[047]] 17543523,{0,0}, --[[048]] 17543524,{0,0}, 
			 --[[049]] 17543525,{0,0}, --[[050]] 17543526,{0,0}, --[[051]] 17543527,{0,0}, --[[052]] 17543528,{0,0}, 
			 --[[053]] 17543529,{0,0}, --[[054]] 17543530,{0,0}, --[[055]] 17543531,{0,0}, --[[056]] 17543532,{0,0}, 
			 --[[057]] 17543533,{0,0,17543530,17543531}, --[[058]] 17543534,{0,0,17543535,17543536,17543537}, --[[059]] 17543535,{0,0}, --[[060]] 17543536,{0,0}, 
			 --[[061]] 17543537,{0,0}, --[[062]] 17543538,{0,0}, --[[063]] 17543539,{0,0}, --[[064]] 17543540,{0,0}, 
			 --[[065]] 17543541,{0,0}, --[[066]] 17543542,{0,0,17543543,17543544}, --[[067]] 17543543,{0,0}, --[[068]] 17543544,{0,0}, 
			 --[[069]] 17543545,{0,0,17543546}, --[[070]] 17543546,{0,0}, --[[071]] 17543547,{0,0}, --[[072]] 17543548,{0,0,17543549}, 
			 --[[073]] 17543549,{0,0}, --[[074]] 17543550,{0,0,17543551,17543552}, --[[075]] 17543551,{0,0}, --[[076]] 17543552,{0,0}, 
			 --[[077]] 17543553,{0,0,17543554,17543555}, --[[078]] 17543554,{0,0}, --[[079]] 17543555,{0,0}, --[[080]] 17543556,{0,0,17543557,17543558,17543559}, 
			 --[[081]] 17543557,{0,0}, --[[082]] 17543558,{0,0}, --[[083]] 17543559,{0,0}, --[[084]] 17543560,{0,0,17543561,17543562,17543563,17543375}, 
			 --[[085]] 17543561,{0,0}, --[[086]] 17543562,{0,0}, --[[087]] 17543563,{0,0}, --[[088]] 17543564,{0,0}, 
			 --[[089]] 17543565,{0,0,17543566}, --[[090]] 17543566,{0,0}, --[[091]] 17543567,{0,0,17543568}, --[[092]] 17543568,{0,0}, 
			 --[[093]] 17543569,{0,0,17543294}, --[[094]] 17543570,{0,0}, --[[095]] 17543571,{0,0}, --[[096]] 17543572,{0,0}, 
			 --[[097]] 17543573,{0,0,17543574}, --[[098]] 17543574,{0,0,17543575}, --[[099]] 17543575,{0,0,17543576}, --[[100]] 17543576,{0,0}, 
			 --[[101]] 17543577,{0,0,17543578,17543579}, --[[102]] 17543578,{0,0}, --[[103]] 17543579,{0,0}, --[[104]] 17543580,{0,0}, 
			 --[[105]] 17543581,{0,0}, --[[106]] 17543582,{0,0}, --[[107]] 17543583,{0,0}, --[[108]] 17543584,{0,0}, --[[109]] 17543585,{0,0}, 
			 --[[110]] 17543586,{0,0}, --[[111]] 17543587,{0,0}, --[[112]] 17543588,{0,0}, --[[113]] 17543589,{0,0}, --[[114]] 17543590,{0,0}, 
			 --[[115]] 17543591,{0,0}, --[[116]] 17543592,{0,0,17543593,17543594,17543595,17543596,17543345}, --[[117]] 17543593,{0,0}, --[[118]] 17543594,{0,0}, --[[119]] 17543595,{0,0}, 
			 --[[120]] 17543596,{0,0}, --[[122]] 17543597,{0,0}, --[[123]] 17543598,{0,0}, --[[124]] 17543599,{0,0}, --[[125]] 17543600,{0,0} 
			 };

----------------------------------- 		
-- Dynamis-Jeuno
----------------------------------- 

--  1: WAR Vanguard Smithy
--  2: MNK Vanguard Pitfighter
--  3: WHM Vanguard Alchemist
--  4: BLM Vanguard Shaman
--  5: RDM Vanguard Enchanter
--  6: THF Vanguard Welldigger
--  7: PLD Vanguard Armorer
--  8: DRK Vanguard Tinkerer
--  9: BST Vanguard Pathfinder + Vanguard's Slime 
-- 10: BRD Vanguard Maestro
-- 11: RNG Vanguard Ambusher
-- 12: SAM Vanguard Ronin
-- 13: NIN Vanguard Hitman
-- 14: DRG Vanguard Dragontamer + Vanguard's Wyvern 
-- 15: SMN Vanguard Necromancer + Vanguard's Avatar 

-- [Position on the map] Avatar Icon mobid, {spawnlist: mob1, mob2,...}
jeunoList = {--[[001]] 17547530,{0,0}, --[[002]] 17547531,{0,0}, --[[003]] 17547532,{0,0,17547312}, --[[004]] 17547533,{0,0}, 
			 --[[005]] 17547534,{0,0}, --[[006]] 17547535,{0,0}, --[[007]] 17547536,{0,0}, --[[008]] 17547537,{0,0}, 
			 --[[009]] 17547538,{0,0}, --[[010]] 17547539,{0,0,17547311}, --[[011]] 17547540,{0,0}, --[[012]] 17547541,{0,0}, 
			 --[[013]] 17547542,{0,0}, --[[014]] 17547543,{0,0}, --[[015]] 17547544,{0,0}, --[[016]] 17547545,{0,0}, 
			 --[[017]] 17547546,{0,0}, --[[018]] 17547547,{0,0,17547322}, --[[019]] 17547548,{0,0}, --[[020]] 17547549,{0,0}, 
			 --[[021]] 17547550,{0,0}, --[[022]] 17547551,{0,0}, --[[023]] 17547552,{0,0,17547378}, --[[024]] 17547553,{0,0}, 
			 --[[025]] 17547554,{0,0}, --[[026]] 17547555,{0,0,17547377}, --[[027]] 17547556,{0,0}, --[[028]] 17547557,{0,0}, 
			 --[[029]] 17547558,{0,0,17547324}, --[[030]] 17547559,{0,0}, --[[031]] 17547560,{0,0}, --[[032]] 17547561,{0,0}, 
			 --[[033]] 17547562,{0,0}, --[[034]] 17547563,{0,0}, --[[035]] 17547564,{0,0}, --[[036]] 17547565,{0,0}, 
			 --[[037]] 17547566,{0,0}, --[[038]] 17547567,{0,0}, --[[039]] 17547568,{0,0}, --[[040]] 17547569,{0,0,17547355}, 
			 --[[041]] 17547570,{0,0}, --[[042]] 17547571,{0,0}, --[[043]] 17547572,{0,0,17547396}, --[[044]] 17547573,{0,0}, 
			 --[[045]] 17547574,{0,0,17547356}, --[[046]] 17547575,{0,0}, --[[047]] 17547576,{0,0}, --[[048]] 17547577,{0,0}, 
			 --[[049]] 17547578,{0,0,17547395}, --[[050]] 17547579,{0,0}, --[[051]] 17547580,{0,0}, --[[052]] 17547581,{0,0}, 
			 --[[053]] 17547582,{0,0}, --[[054]] 17547583,{0,0}, --[[055]] 17547584,{0,0}, --[[056]] 17547585,{0,0}, 
			 --[[057]] 17547586,{0,0}, --[[058]] 17547587,{0,0}, --[[059]] 17547588,{0,0}, --[[060]] 17547589,{0,0}, 
			 --[[061]] 17547590,{0,0}, --[[062]] 17547591,{0,0,17547394}, --[[063]] 17547592,{0,0}, 
			 --[[064]] 17547593,{0,0,17547608,17547609,17547610,17547611,17547612,17547613,17547614,17547615,17547616,17547617}, 
			 --[[065]] 17547594,{0,0}, --[[066]] 17547595,{0,0}, --[[067]] 17547596,{0,0}, --[[068]] 17547597,{0,0}, 
			 --[[069]] 17547598,{0,0}, --[[070]] 17547599,{0,0}, --[[071]] 17547600,{0,0}, --[[072]] 17547601,{0,0}, 
			 --[[073]] 17547602,{0,0,17547277}, --[[074]] 17547603,{0,0,17547291}, --[[075]] 17547604,{0,0,17547294}, --[[076]] 17547605,{0,0}, 
			 --[[077]] 17547606,{0,0}, --[[078]] 17547607,{0,0}, --[[079]] 17547608,{0,0}, --[[080]] 17547609,{0,0}, 
			 --[[081]] 17547610,{0,0}, --[[082]] 17547611,{0,0}, --[[083]] 17547612,{0,0}, --[[084]] 17547613,{0,0}, 
			 --[[085]] 17547614,{0,0}, --[[086]] 17547615,{0,0,17547440}, --[[087]] 17547616,{0,0,17547454}, --[[088]] 17547617,{0,0,17547468}, 
			 --[[089]] 17547618,{0,0}, --[[090]] 17547619,{0,0}, --[[091]] 17547620,{0,0}, --[[092]] 17547621,{0,0}, 
			 --[[093]] 17547622,{0,0}, --[[094]] 17547623,{0,0}, --[[095]] 17547624,{0,0,17547438}, --[[096]] 17547625,{0,0}, 
			 --[[097]] 17547626,{0,0}, --[[098]] 17547627,{0,0}, --[[099]] 17547628,{0,0}, --[[100]] 17547629,{0,0}, 
			 --[[101]] 17547630,{0,0}, --[[102]] 17547631,{0,0}, --[[103]] 17547632,{0,0}, --[[104]] 17547633,{0,0}, 
			 --[[105]] 17547634,{0,0,17547299}, --[[106]] 17547635,{0,0,17547300}, --[[107]] 17547636,{0,0,17547298}, --[[108]] 17547637,{0,0}, 
			 --[[109]] 17547638,{0,0}, --[[110]] 17547639,{0,0}, --[[111]] 17547640,{0,0}, --[[112]] 17547641,{0,0}, 
			 --[[114]] 17547642,{0,0}, --[[115]] 17547643,{0,0}, --[[116]] 17547644,{0,0}, --[[117]] 17547645,{0,0}, 
			 --[[118]] 17547646,{0,0}, --[[119]] 17547647,{0,0}, --[[120]] 17547648,{0,0,17547402}
			 };

--------------------------------------------------		
-- getListDynaMob
-- List of mobid by zone and job
--------------------------------------------------

function getListDynaMob(player,thismob)
	
	local mobList = 0;
	local pZone = player:getZone();
	
	if(pZone == 185) then
		switch (thismob) : caseof {
		 [1] = function (x) mobList = {17534980,17535000,17535012,17535016,17535034,17535058,17535085,17535098}; end, 
		 [2] = function (x) mobList = {17534986,17535001,17535017,17535035,17535059,17535079,17535091}; end, 
		 [3] = function (x) mobList = {17534982,17535009,17535018,17535045,17535060,17535086,17535099}; end, 
		 [4] = function (x) mobList = {17534985,17534988,17535046,17535051,17535061,17535080}; end, 
		 [5] = function (x) mobList = {17534983,17534998,17535024,17535047,17535055,17535062}; end, 
		 [6] = function (x) mobList = {17534984,17535021,17535036,17535054,17535063,17535081}; end, 
		 [7] = function (x) mobList = {17534981,17535008,17535019,17535025,17535037,17535056,17535064,17535084}; end, 
		 [8] = function (x) mobList = {17534987,17535020,17535038,17535053,17535065,17535087}; end, 
		 [9] = function (x) mobList = {17534994,17535028,17535066,17535076,17535094}; end, 
		[10] = function (x) mobList = {17534989,17535022,17535027,17535048,17535052,17535068,17535078,17535088,17535100}; end, 
		[11] = function (x) mobList = {17534999,17535002,17535023,17535039,17535069,17535089,17535093,17535101}; end, 
		[12] = function (x) mobList = {17534990,17535030,17535040,17535070,17535082,17535092}; end, 
		[13] = function (x) mobList = {17534993,17535013,17535031,17535041,17535071,17535083,17535090,17535102}; end, 
		[14] = function (x) mobList = {17534991,17535014,17535042,17535072,17535096}; end, 
		[15] = function (x) mobList = {17534996,17535010,17535049,17535074}; end, 
		}
	elseif(pZone == 186) then
		switch (thismob) : caseof {
		 [1] = function (x) mobList = {17539076,17539110,17539177,17539197,17539213,17539237,17539247,17539284}; end, 
		 [2] = function (x) mobList = {17539084,17539101,17539125,17539182,17539187,17539193,17539243,17539245,17539268,17539269,17539304}; end, 
		 [3] = function (x) mobList = {17539082,17539103,17539104,17539103,17539127,17539176,17539184,17539189,17539196,17539226,17539233,17539256,17539278}; end, 
		 [4] = function (x) mobList = {17539088,17539105,17539112,17539164,17539199,17539239,17539249,17539291}; end, 
		 [5] = function (x) mobList = {17539086,17539096,17539150,17539152,17539204,17539207,17539218,17539219,17539230,17539281,17539288,17539295}; end, 
		 [6] = function (x) mobList = {17539087,17539097,17539151,17539156,17539208,17539220,17539221,17539231,17539282,17539289}; end, 
		 [7] = function (x) mobList = {17539095,17539117,17539132,17539155,17539160,17539170}; end, 
		 [8] = function (x) mobList = {17539075,17539091,17539108,17539115,17539130,17539135}; end, 
		 [9] = function (x) mobList = {17539094,17539109,17539122,17539128,17539203,17539205}; end, 
		[10] = function (x) mobList = {17539079,17539100,17539124,17539180,17539181,17539186}; end, 
		[11] = function (x) mobList = {17539080,17539107,17539131,17539134,17539145,17539146}; end, 
		[12] = function (x) mobList = {17539078,17539085,17539102,17539123,17539137,17539139,17539141,17539168,17539179,17539185,17539194,17539246,17539251,17539270,17539271,17539280,17539298}; end, 
		[13] = function (x) mobList = {17539098,17539166,17539209,17539211,17539222,17539272}; end, 
		[14] = function (x) mobList = {17539081,17539092,17539093,17539116,17539126,17539136}; end, 
		[15] = function (x) mobList = {17539074,17539083,17539090,17539114,17539129,17539133}; end, 
		}
	elseif(pZone == 187) then
		switch (thismob) : caseof {
		 [1] = function (x) mobList = {17543172,17543198,17543210,17543212,17543218,17543251,17543260,17543276}; end, 
		 [2] = function (x) mobList = {17543176,17543181,17543206,17543228,17543252,17543261}; end, 
		 [3] = function (x) mobList = {17543173,17543177,17543199,17543219,17543253,17543262}; end, 
		 [4] = function (x) mobList = {17543174,17543200,17543215,17543222,17543244,17543248,17543254,17543263,17543280,17543285}; end, 
		 [5] = function (x) mobList = {17543178,17543201,17543223,17543264}; end, 
		 [6] = function (x) mobList = {17543180,17543202,17543224,17543226,17543227,17543265,17543278}; end, 
		 [7] = function (x) mobList = {17543183,17543211,17543231,17543233,17543281,17543282,17543289}; end, 
		 [8] = function (x) mobList = {17543182,17543185,17543232,17543234,17543283,17543284,17543288}; end, 
		 [9] = function (x) mobList = {17543186,17543203,17543235,17543239,17543274}; end, 
		[10] = function (x) mobList = {17543175,17543179,17543194,17543205,17543255,17543277}; end, 
		[11] = function (x) mobList = {17543184,17543195,17543209,17543213,17543214,17543220,17543225,17543243,17543247,17543270}; end, 
		[12] = function (x) mobList = {17543188,17543190,17543207,17543246,17543250,17543271}; end, 
		[13] = function (x) mobList = {17543189,17543191,17543208,17543221,17543245,17543249,17543279}; end, 
		[14] = function (x) mobList = {17543192,17543229,17543237,17543241,17543256,17543266}; end, 
		[15] = function (x) mobList = {17543196,17543216,17543272,17543286}; end, 
		}-- Stop @ 17543290
	elseif(pZone == 188) then
		switch (thismob) : caseof {
		 [1] = function (x) mobList = {17547266,17547304,17547314,17547357,17547363,17547379,17547398,17547403,17547408,17547414}; end, 
		 [2] = function (x) mobList = {17547278,17547315,17547343,17547350,17547375,17547399,17547404,17547409,17547415}; end, 
		 [3] = function (x) mobList = {17547279,17547308,17547319,17547334,17547351,17547380,17547385,17547401,17547412,17547416}; end, 
		 [4] = function (x) mobList = {17547270,17547320,17547335,17547358,17547372,17547406,17547413,17547417}; end, 
		 [5] = function (x) mobList = {17547271,17547284,17547310,17547321,17547336,17547344,17547411,17547418}; end, 
		 [6] = function (x) mobList = {17547267,17547305,17547309,17547325,17547339,17547360,17547405,17547410,17547419}; end, 
		 [7] = function (x) mobList = {17547275,17547289,17547292,17547307,17547353,17547364,17547371,17547432,17547447}; end, 
		 [8] = function (x) mobList = {17547274,17547281,17547352,17547361,17547376,17547425,17547434,17547441,17547449}; end, 
		 [9] = function (x) mobList = {17547268,17547272,17547341,17547365,17547369,17547450}; end, 
		[10] = function (x) mobList = {17547280,17547326,17547331,17547345,17547359,17547386,17547430,17547433,17547445,17547448}; end, 
		[11] = function (x) mobList = {17547285,17547306,17547340,17547346,17547347,17547362}; end, 
		[12] = function (x) mobList = {17547288,17547316,17547367,17547383,17547435,17547442,17547446}; end, 
		[13] = function (x) mobList = {17547276,17547290,17547293,17547354,17547368,17547384,17547431}; end, 
		[14] = function (x) mobList = {17547282,17547332,17547348,17547426,17547452}; end, 
		[15] = function (x) mobList = {17547317,17547327,17547373,17547436,17547443}; end, 
		}-- Stop @ 17547453
	end
	
	return mobList;

end;

--------------------------------------------------		
-- alreadyReceived
-- I use this function for TE and Boss Trigger 		
--------------------------------------------------
 
function alreadyReceived(player,number)
	
	local dynaVar = 0;
	local bit = {}; 
	local pZone = player:getZone();
	
	if(pZone == 185) then
		dynaVar = GetServerVariable("[DynaSandoria]Already_Received");
	elseif(pZone == 186) then
		dynaVar = GetServerVariable("[DynaBastok]Already_Received");
	elseif(pZone == 187) then
		dynaVar = GetServerVariable("[DynaWindurst]Already_Received");
	elseif(pZone == 188) then
		dynaVar = GetServerVariable("[DynaJeuno]Already_Received");
	end

	for i = 10,0,-1 do 		
		twop = 2^i; 		
		if(dynaVar >= twop) then 		
			bit[i+1] = 1; 		
			dynaVar = dynaVar - twop; 		
		else 		
			bit[i+1] = 0; 		
		end; 		
	end; 		
	-- printf("received %u",bit[number]); 		
	if(bit[number] == 0) then 		
		return false; 		
	else 		
		return true; 		
	end 		
end;

--------------------------------------------------
-- addDynamisList
-- Add this mob to already received list
--------------------------------------------------

function addDynamisList(player,number)
	
	local pZone = player:getZone();
	
	if(pZone == 185) then
		SetServerVariable("[DynaSandoria]Already_Received",GetServerVariable("[DynaSandoria]Already_Received") + number);
	elseif(pZone == 186) then
		SetServerVariable("[DynaBastok]Already_Received",GetServerVariable("[DynaBastok]Already_Received") + number);
	elseif(pZone == 187) then
		SetServerVariable("[DynaWindurst]Already_Received",GetServerVariable("[DynaWindurst]Already_Received") + number);
	elseif(pZone == 188) then
		SetServerVariable("[DynaJeuno]Already_Received",GetServerVariable("[DynaJeuno]Already_Received") + number);
	end
	
end;