-----------------------------------
-- Area: Eastern Altepa Desert
--   NM:  Cactrot Rapido
-----------------------------------
require("scripts/globals/pathfind");
require("scripts/globals/titles");

local path =
{
    -45.214237, 0.059482, -204.244873,
    -46.114422, 0.104212, -203.765884,
    -47.013275, 0.149004, -203.285812,
    -47.911877, 0.193759, -202.805313,
    -58.443733, 0.767810, -197.319977,
    -61.495697, 0.477824, -195.851227,
    -64.869675, 0.109868, -194.287720,
    -75.073441, 0.254733, -189.665695,
    -81.320366, 0.495319, -186.993607,
    -91.067123, 0.288822, -183.020676,
    -97.377228, -0.392546, -180.579071,
    -99.247047, -0.895448, -179.936798,
    -100.800270, -1.393698, -179.434647,
    -102.352448, -1.900111, -178.961166,
    -103.899933, -2.504567, -178.528854,
    -105.126732, -3.031813, -178.190872,
    -106.367256, -3.527977, -177.907257,
    -107.613914, -4.023795, -177.639709,
    -108.867058, -4.500517, -177.388947,
    -110.153046, -4.924853, -177.183960,
    -111.440956, -5.322861, -177.007553,
    -112.735832, -5.956526, -176.851334,
    -114.710777, -5.139105, -176.495575,
    -116.667969, -4.440962, -176.081223,
    -117.885887, -3.910276, -175.532532,
    -119.009041, -3.591512, -174.816345,
    -120.015816, -3.243386, -173.936310,
    -120.987274, -2.875988, -173.018311,
    -121.980667, -2.569070, -172.122421,
    -122.732048, -2.157357, -171.448853,
    -125.173172, -0.957143, -169.194305,
    -125.936897, -0.534065, -168.118042,
    -126.509903, -0.232718, -167.291153,
    -127.278130, 0.155391, -166.201279,
    -128.056259, 0.507568, -165.116730,
    -128.636505, 0.869508, -164.300949,
    -136.568512, 3.083321, -153.014694,
    -136.977478, 3.211246, -152.089355,
    -137.378784, 3.349919, -151.163742,
    -137.792618, 3.493883, -150.238480,
    -138.222778, 3.588699, -149.317413,
    -139.789780, 4.143739, -145.951996,
    -140.113312, 4.375872, -144.993851,
    -140.287079, 4.543484, -143.998215,
    -140.466980, 4.650395, -142.999802,
    -140.650879, 4.757523, -142.002258,
    -140.834824, 4.864695, -141.004730,
    -141.029587, 4.938367, -140.006378,
    -141.407669, 5.135919, -138.010376,
    -141.643478, 5.328803, -136.341202,
    -141.718018, 5.393569, -135.328995,
    -141.813690, 5.423491, -134.313965,
    -141.928970, 5.490732, -132.961258,
    -142.095245, 5.603091, -130.931778,
    -142.253555, 5.573742, -129.240341,
    -142.852249, 5.496122, -123.503990,
    -143.283661, 5.484383, -119.451439,
    -143.331360, 5.500263, -118.093521,
    -143.367279, 5.357600, -117.080986,
    -143.595398, 4.682551, -114.444756,
    -143.761444, 4.288168, -113.153831,
    -143.944153, 3.851855, -111.863541,
    -144.114670, 3.081480, -110.600967,
    -144.374863, 2.389771, -109.383690,
    -144.561234, 1.352810, -107.876305,
    -144.406784, 0.635471, -106.733185,
    -144.221008, -0.194526, -105.556168,
    -143.877808, -0.956815, -104.450096,
    -143.333038, -1.686279, -103.367638,
    -142.964157, -2.185963, -102.417923,
    -142.580856, -1.692963, -101.476410,
    -142.176361, -1.494776, -100.551079,
    -141.584686, -1.078624, -99.351585,
    -141.150131, -0.753439, -98.444046,
    -140.304092, -0.076350, -96.605209,
    -138.948074, 0.686977, -93.901413,
    -138.008743, 1.152010, -92.116440,
    -136.429688, 1.963583, -89.143188,
    -134.031357, 2.365622, -84.672249,
    -133.287766, 2.253940, -83.149849,
    -131.816559, 1.901823, -80.109253,
    -129.684540, 1.223290, -75.525696,
    -126.872261, 0.516513, -69.392265,
    -124.933060, 0.570506, -65.425987,
    -122.093231, 0.971921, -59.642326,
    -121.642838, 0.935626, -58.728325,
    -109.254097, -0.174285, -33.826805,
    -107.579643, -0.704243, -30.530849,
    -104.290489, -2.292845, -24.004328,
    -103.340012, -2.798456, -22.273823,
    -101.417862, -3.851769, -18.828547,
    -97.400208, -5.963912, -11.658532,
    -96.157463, -6.415525, -9.279702,
    -94.492889, -7.087772, -6.000663,
    -87.445793, -8.721937, 8.182076,
    -82.627701, -10.710227, 17.341963,
    -78.738350, -12.969520, 24.556398,
    -77.843742, -12.820852, 24.081251,
    -76.622406, -12.841505, 24.162075,
    -75.760681, -13.003385, 24.680101,
    -74.814415, -13.116152, 25.040958,
    -73.821739, -13.185088, 25.261553,
    -72.808220, -13.145959, 25.357367,
    -71.794624, -13.038998, 25.335396,
    -70.787224, -12.916903, 25.232685,
    -69.777863, -12.797923, 25.146303,
    -68.767639, -12.701465, 25.068045,
    -67.753258, -12.639880, 24.988928,
    -66.398720, -12.608677, 24.871193,
    -63.693352, -12.663887, 24.614614,
    -61.332371, -12.802485, 24.348162,
    -50.877781, -13.008631, 23.174417,
    -49.525688, -12.897259, 23.080366,
    -44.121357, -12.405771, 22.702574,
    -41.750877, -12.331022, 22.526335,
    -31.591017, -12.228968, 21.767466,
    -30.574598, -12.240875, 21.682938,
    -28.892553, -12.373736, 21.497755,
    -26.193161, -12.326892, 21.279018,
    -25.180489, -12.211316, 21.241808,
    -23.829905, -12.058004, 21.196482,
    -18.073771, -11.557770, 20.988880,
    -15.020272, -11.416804, 20.876867,
    -10.272671, -11.514080, 20.625463,
    -5.530938, -11.567481, 20.363932,
    -2.144115, -11.611256, 20.183678,
    1.250314, -11.545613, 20.013973,
    4.980156, -11.624237, 19.813007,
    6.658255, -11.886693, 19.655684,
    7.651558, -12.083179, 19.533247,
    8.947555, -12.524771, 19.332045,
    10.214692, -12.953741, 19.087330,
    11.502657, -13.320731, 18.860584,
    12.780280, -13.754982, 18.569122,
    14.030073, -14.196076, 18.227663,
    15.295671, -14.636890, 17.897783,
    16.523689, -15.021481, 17.490923,
    18.113350, -15.462179, 17.026085,
    19.330448, -16.081728, 16.884964,
    20.436007, -16.775909, 16.924559,
    21.711395, -17.273441, 16.566978,
    23.008286, -17.863113, 16.240875,
    25.600761, -16.349407, 15.708939,
    27.885015, -14.547360, 15.286979,
    29.175026, -13.795184, 15.093222,
    31.474035, -12.003471, 14.741585,
    32.733868, -11.282872, 14.418842,
    34.007584, -10.686451, 14.024928,
    35.271973, -10.187914, 13.686438,
    36.557934, -9.658462, 13.328313,
    38.519291, -9.480738, 12.813184,
    42.436985, -9.212695, 11.718233,
    43.381554, -9.141721, 11.339855,
    44.327057, -9.046030, 10.973053,
    45.586422, -8.833047, 10.505932,
    53.230701, -8.530454, 7.711083,
    55.138641, -8.453061, 6.993709,
    59.573353, -7.617370, 5.394830,
    69.459343, -7.685488, 1.939287,
    72.022415, -7.802935, 1.038878,
    72.933075, -7.848290, 0.582272,
    73.840149, -7.893467, 0.117998,
    74.749786, -7.938770, -0.341271,
    75.661224, -7.972084, -0.797652,
    76.574295, -7.968478, -1.252196,
    83.864113, -7.963341, -4.913532,
    85.353340, -7.848778, -5.726798,
    92.465195, -7.863905, -9.688751,
    93.283051, -7.853431, -10.298190,
    94.106422, -7.894407, -10.898237,
    94.932503, -7.953709, -11.493578,
    95.759720, -8.025735, -12.087400,
    102.684669, -8.555371, -16.980604,
    103.452599, -8.716061, -17.633831,
    104.192497, -8.917103, -18.314260,
    105.165489, -9.238935, -19.207094,
    106.146698, -9.576337, -20.094185,
    107.875641, -10.310707, -21.564810,
    110.510101, -11.774194, -23.772697,
    112.850891, -11.348615, -25.616978,
    113.918427, -10.971118, -26.418327,
    114.921410, -10.609308, -27.303473,
    115.544731, -10.389357, -28.099230,
    116.108887, -10.155023, -28.928883,
    116.677101, -9.907154, -29.764107,
    117.259628, -9.660060, -30.577936,
    117.841934, -9.415455, -31.403658,
    118.628448, -9.101988, -32.489857,
    119.226006, -8.906536, -33.291828,
    121.370842, -8.177029, -36.269379,
    121.892303, -8.089925, -37.141682,
    122.419975, -8.003403, -38.010284,
    123.126312, -8.000000, -39.172443,
    124.321335, -7.985068, -41.228336,
    124.715233, -7.965429, -42.168995,
    125.117836, -7.945378, -43.105942,
    125.524841, -7.925108, -44.041027,
    125.932388, -7.857445, -44.973671,
    126.477409, -7.837416, -46.216499,
    128.163406, -7.896171, -50.290894,
    128.435196, -7.838074, -51.272820,
    128.713623, -7.837389, -52.253597,
    129.000900, -7.732649, -53.228714,
    129.289841, -7.648998, -54.203396,
    129.763367, -7.580074, -56.180931,
    129.849594, -7.588713, -57.197235,
    129.947464, -7.598557, -58.212494,
    130.050140, -7.608885, -59.227268,
    130.154587, -7.632762, -60.241852,
    130.148819, -7.683857, -61.259670,
    129.995834, -7.740675, -62.266739,
    129.800461, -7.810890, -63.265373,
    129.614334, -7.882718, -64.265656,
    129.431046, -7.955023, -65.266464,
    129.248032, -8.027370, -66.267303,
    128.941101, -8.148669, -67.934982,
    128.592590, -8.226739, -69.244926,
    128.169174, -8.255370, -70.171631,
    127.624290, -8.259485, -71.033081,
    127.052391, -8.258126, -71.877647,
    126.489380, -8.258752, -72.728165,
    125.929886, -8.260109, -73.581032,
    125.371674, -8.261738, -74.434708,
    124.246277, -8.290220, -76.135551,
    123.706482, -8.174309, -76.993515,
    122.960106, -8.099961, -78.127975,
    121.970772, -8.000000, -79.504745,
    121.232613, -8.000000, -80.207413,
    120.399490, -8.000000, -80.794556,
    119.492821, -8.000000, -81.260330,
    118.549973, -8.000000, -81.649460,
    117.614258, -8.000000, -82.055428,
    116.680702, -8.000000, -82.466354,
    115.746910, -8.000000, -82.876801,
    114.813171, -7.956547, -83.285782,
    113.566681, -7.910290, -83.827690,
    111.362625, -7.895653, -84.719353,
    110.370857, -7.837558, -84.951813,
    109.379196, -7.779317, -85.183273,
    108.389091, -7.722087, -85.421638,
    107.398117, -7.713781, -85.657982,
    106.404572, -7.742430, -85.887161,
    100.443123, -7.914205, -87.261345,
    78.931618, -9.066314, -92.160812,
    78.006859, -9.174266, -92.574493,
    77.191170, -9.243567, -93.175354,
    76.518112, -9.365136, -93.929840,
    75.956619, -9.517926, -94.767433,
    75.396698, -9.684797, -95.603516,
    74.836777, -9.851719, -96.439613,
    74.276855, -10.018639, -97.275703,
    73.716927, -10.185554, -98.111778,
    73.157005, -10.352473, -98.947868,
    72.037186, -10.691887, -100.619995,
    65.185234, -12.325055, -110.974182,
    64.502304, -12.210523, -112.137856,
    63.758068, -12.309777, -113.272629,
    60.121979, -12.452700, -119.008751,
    57.324074, -12.271764, -123.665543,
    54.016415, -11.951966, -129.203384,
    51.480064, -12.026159, -133.225754,
    50.535629, -12.216867, -134.627289,
    49.575897, -12.556334, -136.002838,
    48.761570, -12.911916, -137.027985,
    47.980934, -13.217538, -138.086014,
    45.906788, -14.359197, -140.978027,
    45.197201, -13.630539, -142.093567,
    44.498314, -12.896272, -143.199234,
    43.958618, -12.095625, -144.064774,
    42.670326, -11.275743, -146.004883,
    36.821983, -8.478559, -154.982544,
    33.769165, -7.889951, -159.845291,
    28.914276, -7.639688, -167.631866,
    22.451923, -4.734315, -177.783630,
    20.719790, -3.657952, -180.643219,
    20.171061, -3.421347, -181.483154,
    19.586971, -3.203986, -182.310669,
    18.478239, -2.926458, -182.771957,
    17.234682, -2.637700, -182.976196,
    16.290546, -2.427790, -183.316666,
    15.309304, -2.271078, -183.548950,
    14.327208, -2.134478, -183.788116,
    13.344822, -1.998021, -184.026215,
    12.361718, -1.863053, -184.263077,
    8.079593, -1.926340, -185.327988,
    2.468133, -1.674941, -186.621872,
    0.478332, -1.519862, -187.029205,
    -5.183570, -1.168827, -188.135437,
    -10.524970, -0.787942, -189.075882,
    -11.111217, -0.629007, -189.894958,
    -12.298127, -0.580679, -190.385666,
    -13.245046, -0.599274, -190.750412,
    -14.188004, -0.496885, -191.123428,
    -15.131532, -0.387342, -191.495163,
    -16.076939, -0.359143, -191.862503,
    -18.904144, 0.286367, -192.923462,
    -19.298399, 0.512927, -193.844086,
    -20.236032, 0.637131, -194.226257,
    -21.165127, 0.763740, -194.627731,
    -22.089966, 0.795228, -195.051437,
    -23.013824, 0.792700, -195.483749,
    -23.938154, 0.790050, -195.915085,
    -25.589787, 0.636639, -196.951553,
    -26.508005, 0.544279, -197.385910,
    -27.422697, 0.452274, -197.827805,
    -28.337297, 0.380589, -198.272293,
    -29.254520, 0.334919, -198.716125,
    -31.397188, 0.228204, -199.746597,
    -36.625172, 0.000000, -202.187897,
    -37.873020, 0.000000, -202.493210,
    -39.119324, 0.000000, -203.037552,
    -40.370975, 0.000000, -203.569611
};
-----------------------------------

function onMobSpawn(mob)
    onMobRoam(mob);
end;

function onPath(mob)
    tpz.path.patrol(mob, path, tpz.path.flag.RUN);
end;

function onMobRoam(mob)
    -- move to start position if not moving
    if (mob:isFollowingPath() == false) then
        mob:pathThrough(tpz.path.first(path), tpz.path.flag.RUN);
    end
end;

function onMobDeath(mob, player, isKiller)
    player:addTitle(tpz.title.CACTROT_DESACELERADOR);
end;

function onMobDespawn(mob)
    UpdateNMSpawnPoint(mob:getID());
    mob:setRespawnTime(900) -- 2 to 3 days
end;
