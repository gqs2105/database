-- --------------------------------------------------------------------------------
-- This is an attempt to create a full transactional update
-- --------------------------------------------------------------------------------
DROP PROCEDURE IF EXISTS `update_mangos`; 

DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_mangos`()
BEGIN
    DECLARE bRollback BOOL  DEFAULT FALSE ;
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET `bRollback` = TRUE;

  SET @cOldRev = 'required_21000_05_Script_refactoring'; 

  -- Set the new revision string
  SET @cNewRev = 'required_21000_07_Corrections_to_RegenerateStats';

  -- Set thisRevision to the column name of db_version in the currently selected database
  SET @cThisRev := ((SELECT column_name FROM information_schema.`COLUMNS` WHERE table_name='db_version' AND table_schema=(SELECT DATABASE() AS thisDB FROM DUAL) AND column_name LIKE 'required%'));

  -- Set friendly Version Text
  SET @cThisVersion = 'MaNGOSZero Database Rev 21000_07';

 
  -- Only Proceed if the old values match
  IF @cThisRev = @cOldRev THEN
    -- Make this all a single transaction
    START TRANSACTION;

    -- Apply the Version Change from Old Version to New Version
    -- SET @query = CONCAT('ALTER TABLE db_version CHANGE COLUMN ',@cOldRev, ' ' ,@cNewRev,' bit;');
    -- PREPARE stmt1 FROM @query;
    -- EXECUTE stmt1;
    -- DEALLOCATE PREPARE stmt1;
    -- The Above block is required for making table changes
    -- version
    INSERT IGNORE INTO `db_version` SET `Version` = @cThisVersion;

    -- If this is purely an incremental update, include this line
    SET @cNewRev = @cThisVersion;

    -- -- -- -- Normal Update / Insert / Delete statements will go here  -- -- -- -- --
	
    -- this fixes the voidwalker mana and other issues that came about due to the RegenerateStats fix applied on Rel20
     
	-- Creatures that should have RegerateStats set to 1 (regen health)
	UPDATE creature_template SET RegenerateStats=1 WHERE entry IN (308, 541, 928, 1063, 1494, 2224, 2540, 2757, 2759, 2763, 3574, 3837, 4392, 4411, 5470, 6866, 10258, 10429, 10439, 10683, 12739, 15082, 15084, 15203, 15204, 15205, 15208, 15286, 15288, 15290, 16036, 16448);

	-- Creatures that should have RegerateStats set to 3 (regen health and mana)
	UPDATE creature_template SET RegenerateStats=3 WHERE entry IN (60, 89, 127, 128, 203, 284, 304, 305, 306, 307, 314, 331, 335, 353, 358, 376, 397, 416, 417, 429, 430, 436, 441, 450, 453, 456, 461, 474, 476, 486, 503, 507, 510, 517, 533, 545, 548, 572, 589, 596, 599, 619, 621, 660, 670, 672, 676, 677, 679, 697, 701, 710, 711, 740, 741, 743, 752, 761, 762, 764, 765, 766, 780, 785, 787, 798, 808, 814, 815, 818, 819, 868, 873, 875, 881, 882, 891, 910, 920, 940, 941, 942, 943, 946, 978, 1009, 1013, 1028, 1029, 1036, 1038, 1043, 1044, 1046, 1049, 1055, 1057, 1060, 1062, 1065, 1066, 1069, 1096, 1106, 1121, 1124, 1144, 1165, 1166, 1174, 1179, 1181, 1183, 1197, 1200, 1233, 1251, 1260, 1284, 1364, 1397, 1399, 1410, 1425, 1490, 1503, 1507, 1522, 1523, 1533, 1538, 1539, 1544, 1562, 1564, 1574, 1575, 1653, 1679, 1717, 1726, 1729, 1732, 1748, 1749, 1768, 1769, 1773, 1784, 1789, 1794, 1795, 1798, 1800, 1811, 1826, 1832, 1834, 1835, 1837, 1839, 1840, 1842, 1845, 1846, 1848, 1852, 1853, 1854, 1855, 1860, 1863, 1867, 1868, 1888, 1889, 1895, 1896, 1908, 1909, 1910, 1911, 1914, 1915, 1920, 1940, 1947, 1954, 1958, 1964, 1993, 2002, 2003, 2009, 2011, 2012, 2014, 2018, 2021, 2030, 2038, 2044, 2054, 2055, 2056, 2108, 2120, 2160, 2167, 2169, 2170, 2171, 2180, 2182, 2191, 2192, 2203, 2207, 2208, 2244, 2255, 2272, 2276, 2283, 2305, 2306, 2318, 2319, 2335, 2337, 2338, 2344, 2346, 2358, 2370, 2371, 2373, 2376, 2377, 2387, 2415, 2417, 2423, 2425, 2433, 2447, 2453, 2523, 2534, 2543, 2550, 2553, 2555, 2557, 2567, 2570, 2573, 2575, 2577, 2583, 2590, 2591, 2596, 2598, 2600, 2601, 2602, 2605, 2607, 2609, 2612, 2624, 2630, 2638, 2640, 2642, 2645, 2647, 2654, 2671, 2694, 2713, 2718, 2720, 2725, 2740, 2742, 2745, 2755, 2761, 2762, 2764, 2793, 2879, 2880, 2881, 2887, 2892, 2894, 2907, 2942, 2946, 2949, 2950, 2953, 2963, 2964, 2965, 2990, 3101, 3113, 3118, 3120, 3183, 3196, 3197, 3198, 3199, 3203, 3204, 3205, 3206, 3207, 3247, 3249, 3260, 3261, 3262, 3263, 3268, 3269, 3270, 3271, 3273, 3280, 3380, 3386, 3392, 3397, 3424, 3434, 3436, 3458, 3510, 3516, 3527, 3560, 3569, 3573, 3579, 3582, 3662, 3664, 3669, 3670, 3671, 3672, 3673, 3678, 3712, 3715, 3717, 3725, 3728, 3732, 3735, 3742, 3748, 3750, 3755, 3757, 3762, 3771, 3772, 3773, 3781, 3783, 3794, 3795, 3797, 3799, 3801, 3802, 3803, 3833, 3840, 3843, 3850, 3851, 3853, 3855, 3860, 3899, 3900, 3902, 3903, 3904, 3906, 3907, 3908, 3909, 3911, 3912, 3913, 3917, 3922, 3924, 3940, 3941, 3942, 3944, 3968, 3974, 3976, 3977, 3983, 3986, 3991, 4003, 4016, 4017, 4024, 4025, 4026, 4027, 4028, 4032, 4036, 4038, 4050, 4051, 4052, 4053, 4063, 4066, 4069, 4090, 4091, 4092, 4096, 4097, 4098, 4116, 4117, 4119, 4138, 4146, 4151, 4165, 4198, 4205, 4207, 4217, 4218, 4219, 4268, 4269, 4270, 4271, 4272, 4273, 4275, 4278, 4280, 4282, 4284, 4285, 4287, 4289, 4291, 4292, 4293, 4294, 4296, 4297, 4299, 4300, 4302, 4303, 4324, 4328, 4331, 4334, 4344, 4363, 4370, 4371, 4377, 4404, 4418, 4421, 4424, 4427, 4428, 4440, 4459, 4460, 4463, 4467, 4469, 4472, 4485, 4489, 4494, 4515, 4516, 4517, 4518, 4519, 4520, 4522, 4523, 4525, 4542, 4543, 4635, 4637, 4641, 4642, 4649, 4651, 4657, 4658, 4663, 4665, 4667, 4668, 4675, 4678, 4679, 4681, 4682, 4683, 4684, 4685, 4705, 4710, 4712, 4716, 4717, 4718, 4719, 4723, 4777, 4798, 4799, 4802, 4803, 4805, 4809, 4811, 4812, 4813, 4814, 4820, 4831, 4832, 4842, 4844, 4847, 4848, 4852, 4853, 4854, 4949, 4968, 4971, 4978, 4980, 4996, 5194, 5196, 5197, 5236, 5237, 5239, 5240, 5254, 5259, 5269, 5271, 5273, 5276, 5278, 5280, 5291, 5305, 5317, 5328, 5333, 5335, 5336, 5337, 5343, 5360, 5362, 5363, 5364, 5366, 5401, 5429, 5473, 5475, 5484, 5485, 5489, 5495, 5496, 5497, 5498, 5504, 5505, 5506, 5515, 5516, 5517, 5520, 5617, 5643, 5647, 5648, 5650, 5677, 5679, 5682, 5683, 5694, 5710, 5711, 5712, 5715, 5717, 5726, 5744, 5747, 5749, 5750, 5753, 5761, 5769, 5771, 5785, 5815, 5822, 5826, 5830, 5834, 5839, 5860, 5862, 5863, 5873, 5874, 5879, 5893, 5894, 5899, 5902, 5913, 5915, 5916, 5919, 5920, 5921, 5922, 5923, 5924, 5925, 5926, 5927, 5929, 5930, 5950, 5975, 5978, 5979, 5980, 5981, 6000, 6002, 6006, 6008, 6009, 6012, 6016, 6017, 6027, 6047, 6066, 6070, 6072, 6074, 6075, 6110, 6111, 6112, 6117, 6119, 6120, 6121, 6122, 6127, 6129, 6131, 6138, 6168, 6170, 6171, 6172, 6177, 6178, 6179, 6186, 6188, 6194, 6195, 6197, 6198, 6199, 6200, 6202, 6210, 6213, 6214, 6220, 6221, 6227, 6228, 6244, 6247, 6251, 6252, 6253, 6254, 6267, 6293, 6294, 6328, 6329, 6351, 6366, 6370, 6373, 6374, 6376, 6378, 6380, 6382, 6392, 6486, 6487, 6490, 6519, 6520, 6527, 6546, 6550, 6575, 6649, 6826, 6868, 6887, 6910, 6912, 7007, 7010, 7012, 7016, 7026, 7028, 7030, 7034, 7041, 7043, 7047, 7048, 7049, 7068, 7070, 7071, 7074, 7075, 7077, 7104, 7107, 7109, 7111, 7112, 7115, 7118, 7120, 7154, 7158, 7167, 7235, 7246, 7247, 7266, 7271, 7275, 7291, 7313, 7316, 7317, 7318, 7319, 7321, 7322, 7335, 7337, 7340, 7341, 7342, 7352, 7353, 7354, 7357, 7358, 7366, 7367, 7368, 7370, 7372, 7379, 7397, 7398, 7399, 7400, 7402, 7403, 7411, 7412, 7413, 7414, 7415, 7416, 7423, 7424, 7425, 7429, 7437, 7439, 7441, 7453, 7461, 7464, 7465, 7466, 7467, 7468, 7469, 7483, 7486, 7487, 7505, 7523, 7524, 7525, 7543, 7583, 7584, 7606, 7608, 7666, 7667, 7684, 7686, 7687, 7690, 7707, 7708, 7726, 7727, 7734, 7735, 7739, 7740, 7749, 7767, 7772, 7773, 7774, 7779, 7780, 7789, 7795, 7843, 7844, 7845, 7872, 7874, 7878, 7879, 7886, 7895, 7957, 7995, 7996, 7997, 7999, 8075, 8115, 8127, 8136, 8138, 8200, 8202, 8217, 8282, 8296, 8298, 8336, 8378, 8379, 8381, 8382, 8390, 8394, 8405, 8409, 8419, 8438, 8439, 8440, 8442, 8443, 8444, 8480, 8497, 8503, 8504, 8506, 8507, 8516, 8524, 8525, 8526, 8528, 8547, 8548, 8550, 8551, 8553, 8562, 8578, 8579, 8588, 8636, 8656, 8657, 8658, 8716, 8763, 8764, 8776, 8876, 8879, 8894, 8895, 8896, 8898, 8900, 8902, 8904, 8908, 8909, 8910, 8912, 8913, 8914, 8915, 8916, 8917, 8929, 8976, 8977, 8980, 8983, 9018, 9024, 9026, 9030, 9031, 9034, 9036, 9038, 9039, 9041, 9045, 9056, 9078, 9079, 9081, 9084, 9085, 9098, 9158, 9197, 9198, 9201,
	9217, 9236, 9238, 9239, 9240, 9257, 9261, 9262, 9263, 9264, 9265, 9266, 9269, 9397, 9437, 9438, 9439, 9441, 9442, 9443, 9447, 9448, 9449, 9450, 9451, 9452, 9476, 9499, 9516, 9517, 9518, 9523, 9528, 9529, 9547, 9561, 9562, 9565, 9604, 9616, 9619, 9656, 9678, 9681, 9687, 9688, 9689, 9693, 9717, 9778, 9817, 9818, 9861, 9877, 9997, 10000, 10076, 10078, 10083, 10119, 10136, 10157, 10162, 10179, 10180, 10181, 10183, 10199, 10201, 10217, 10296, 10307, 10322, 10336, 10337, 10338, 10340, 10358, 10373, 10389, 10390, 10393, 10394, 10398, 10400, 10419, 10420, 10421, 10422, 10423, 10424, 10425, 10426, 10432, 10433, 10436, 10438, 10440, 10442, 10467, 10469, 10470, 10471, 10472, 10476, 10477, 10487, 10491, 10493, 10498, 10499, 10500, 10502, 10503, 10505, 10506, 10508, 10538, 10540, 10557, 10559, 10584, 10602, 10605, 10608, 10618, 10640, 10642, 10647, 10648, 10660, 10680, 10684, 10698, 10699, 10717, 10719, 10738, 10739, 10740, 10759, 10760, 10802, 10811, 10812, 10813, 10819, 10823, 10827, 10828, 10838, 10917, 10920, 10921, 10922, 10923, 10928, 10929, 10939, 10944, 10945, 10949, 11019, 11020, 11021, 11032, 11040, 11053, 11055, 11056, 11057, 11076, 11077, 11100, 11101, 11141, 11143, 11147, 11150, 11153, 11154, 11155, 11256, 11257, 11283, 11319, 11322, 11324, 11327, 11338, 11339, 11340, 11346, 11347, 11380, 11383, 11388, 11397, 11401, 11406, 11407, 11443, 11444, 11445, 11448, 11453, 11455, 11457, 11461, 11464, 11466, 11470, 11471, 11473, 11480, 11483, 11484, 11487, 11488, 11492, 11497, 11518, 11548, 11559, 11562, 11577, 11582, 11598, 11600, 11604, 11608, 11609, 11611, 11615, 11616, 11622, 11657, 11661, 11662, 11663, 11664, 11675, 11677, 11680, 11683, 11685, 11689, 11697, 11713, 11714, 11754, 11756, 11779, 11793, 11795, 11796, 11797, 11798, 11799, 11800, 11801, 11802, 11804, 11805, 11807, 11808, 11811, 11822, 11830, 11831, 11832, 11837, 11838, 11859, 11863, 11873, 11878, 11882, 11883, 11884, 11898, 11913, 11915, 11917, 11949, 12118, 12119, 12121, 12122, 12126, 12128, 12138, 12140, 12141, 12148, 12149, 12151, 12178, 12204, 12205, 12224, 12225, 12238, 12259, 12264, 12319, 12321, 12322, 12337, 12339, 12344, 12352, 12356, 12357, 12361, 12362, 12378, 12387, 12396, 12397, 12420, 12433, 12457, 12458, 12459, 12465, 12468, 12476, 12478, 12557, 12722, 12736, 12756, 12759, 12779, 12856, 12862, 12863, 12864, 12865, 12866, 12876, 12900, 12902, 12922, 12976, 12996, 13019, 13096, 13097, 13098, 13099, 13116, 13117, 13157, 13158, 13197, 13220, 13236, 13256, 13280, 13284, 13419, 13442, 13443, 13537, 13538, 13539, 13540, 13541, 13542, 13546, 13547, 13548, 13555, 13556, 13557, 13697, 13698, 13716, 13718, 13737, 13916, 13976, 14022, 14025, 14026, 14027, 14028, 14029, 14030, 14031, 14182, 14183, 14230, 14242, 14272, 14275, 14277, 14324, 14327, 14329, 14330, 14331, 14332, 14333, 14334, 14335, 14336, 14349, 14354, 14364, 14368, 14369, 14371, 14381, 14382, 14383, 14385, 14387, 14393, 14394, 14397, 14398, 14399, 14400, 14432, 14435, 14436, 14445, 14452, 14465, 14466, 14470, 14478, 14479, 14487, 14497, 14505, 14506, 14507, 14509, 14510, 14511, 14515, 14516, 14517, 14518, 14521, 14522, 14523, 14527, 14530, 14533, 14536, 14557, 14565, 14603, 14604, 14621, 14638, 14639, 14640, 14662, 14666, 14667, 14684, 14686, 14688, 14690, 14693, 14694, 14702, 14703, 14705, 14744, 14745, 14751, 14752, 14822, 14823, 14825, 14834, 14861, 14862, 14876, 14883, 14888, 14911, 14981, 14987, 14989, 15083, 15085, 15105, 15111, 15112, 15121, 15169, 15183, 15187, 15188, 15191, 15192, 15193, 15200, 15202, 15206, 15213, 15215, 15250, 15260, 15262, 15263, 15273, 15274, 15276, 15278, 15279, 15280, 15281, 15283, 15284, 15291, 15292, 15293, 15294, 15295, 15296, 15297, 15298, 15301, 15302, 15304, 15305, 15308, 15312, 15328, 15333, 15334, 15338, 15340, 15362, 15363, 15367, 15370, 15371, 15378, 15379, 15380, 15381, 15382, 15398, 15399, 15400, 15401, 15402, 15403, 15404, 15405, 15406, 15407, 15408, 15416, 15417, 15418, 15433, 15438, 15443, 15444, 15449, 15462, 15464, 15471, 15475, 15494, 15495, 15498, 15501, 15502, 15503, 15504, 15511, 15513, 15527, 15549, 15551, 15552, 15556, 15557, 15558, 15559, 15560, 15561, 15562, 15563, 15564, 15565, 15566, 15567, 15568, 15569, 15570, 15572, 15573, 15574, 15575, 15576, 15577, 15578, 15579, 15580, 15581, 15582, 15583, 15584, 15585, 15586, 15587, 15588, 15589, 15592, 15593, 15594, 15595, 15596, 15597, 15598, 15599, 15600, 15601, 15602, 15603, 15604, 15605, 15606, 15607, 15613, 15614, 15615, 15620, 15622, 15623, 15631, 15634, 15638, 15639, 15640, 15642, 15644, 15645, 15647, 15648, 15649, 15650, 15656, 15657, 15666, 15667, 15669, 15689, 15691, 15693, 15711, 15713, 15714, 15715, 15716, 15720, 15726, 15744, 15818, 15847, 15855, 15856, 15859, 15860, 15863, 15868, 15869, 15871, 15895, 15898, 15901, 15909, 15928, 15937, 15938, 15939, 15940, 15941, 15942, 15945, 15946, 15949, 15950, 15951, 15958, 15962, 15965, 15966, 15967, 15970, 15971, 15977, 15980, 15981, 15990, 16013, 16033, 16042, 16051, 16052, 16053, 16055, 16058, 16060, 16064, 16065, 16073, 16080, 16093, 16097, 16101, 16102, 16103, 16104, 16109, 16111, 16113, 16114, 16115, 16116, 16118, 16120, 16121, 16126, 16127, 16132, 16133, 16134, 16135, 16143, 16144, 16149, 16156, 16158, 16160, 16161, 16162, 16163, 16164, 16165, 16168, 16183, 16185, 16186, 16197, 16204, 16205, 16236, 16237, 16240, 16248, 16249, 16253, 16254, 16257, 16258, 16259, 16260, 16261, 16262, 16264, 16266, 16267, 16269, 16270, 16271, 16272, 16275, 16276, 16277, 16280, 16284, 16287, 16288, 16291, 16292, 16293, 16294, 16297, 16304, 16307, 16308, 16310, 16311, 16313, 16315, 16317, 16318, 16320, 16323, 16329, 16331, 16337, 16341, 16343, 16345, 16346, 16357, 16358, 16362, 16365, 16366, 16367, 16368, 16381, 16383, 16390, 16397, 16406, 16409, 16419, 16427, 16429, 16438, 16446, 16451, 16452, 16457, 16460, 16464, 16469, 16470, 16471, 16478, 16480, 16482, 16488, 16492, 16494, 16499, 16500, 16501, 16502, 16505, 16506, 16521, 16522, 16524, 16526, 16529, 16539, 16540, 16542, 16543, 16545, 16547, 16574, 16575, 16577, 16578, 16579, 16586, 16587, 16588, 16594, 16601, 16602, 16610, 16611, 16612, 16613, 16615, 16616, 16617, 16618, 16619, 16620, 16621, 16623, 16624, 16625, 16626, 16627, 16628, 16629, 16631, 16632, 16633, 16634, 16635, 16636, 16637, 16638, 16639, 16640, 16641, 16642, 16643, 16644, 16646, 16647, 16648, 16649, 16650, 16651, 16652, 16653, 16654, 16655, 16656, 16657, 16658, 16659, 16660, 16662, 16663, 16666, 16667, 16668, 16669, 16671, 16672, 16673, 16674, 16675, 16676, 16677, 16679, 16680, 16681, 16683, 16684, 16685, 16686, 16687, 16688, 16689, 16690, 16691, 16692, 16693, 16698, 16702, 16703, 16705, 16706, 16707, 16709, 16710, 16712, 16714, 16716, 16718, 16719, 16721, 16722, 16723, 16724, 16725, 16726, 16727, 16728, 16729, 16731, 16732, 16735, 16736, 16738, 16739, 16740, 16741, 16742, 16743, 16744, 16745, 16746, 16747, 16748, 16749, 16750, 16751, 16752, 16753, 16755, 16756, 16757, 16761, 16762, 16763, 16765, 16766, 16767, 16768, 16769, 16774, 16780, 16782, 
	16791, 16792, 16793, 16795, 16796, 16797, 16798, 16799, 16800, 16801, 16802, 16807, 16810, 16819, 16821, 16824, 16825, 16829, 16830, 16833, 16834, 16836, 16839, 16840, 16841, 16850, 16851, 16852, 16854, 16856, 16858, 16859, 16860, 16861, 16862, 16873, 16874, 16885, 16888, 16896, 16905, 16906, 16911, 16916, 16918, 16920, 16923, 16924, 16937, 16950, 16951, 16959, 16960, 16966, 16969, 16974, 16975, 16977, 16981, 16991, 16993, 16994, 16996, 16998, 17000, 17002, 17005, 17007, 17015, 17052, 17056, 17071, 17076, 17084, 17086, 17088, 17089, 17092, 17093, 17094, 17095, 17097, 17098, 17099, 17100, 17103, 17104, 17105, 17106, 17109, 17110, 17115, 17119, 17121, 17122, 17127, 17135, 17137, 17141, 17143, 17146, 17147, 17149, 17150, 17151, 17153, 17155, 17158, 17159, 17160, 17184, 17187, 17191, 17192, 17195, 17204, 17205, 17206, 17207, 17212, 17214, 17218, 17219, 17220, 17223, 17226, 17228, 17229, 17232, 17233, 17235, 17238, 17241, 17243, 17252, 17256, 17263, 17266, 17267, 17269, 17270, 17275, 17277, 17279, 17282, 17291, 17300, 17303, 17308, 17309, 17312, 17314, 17320, 17327, 17328, 17330, 17333, 17336, 17339, 17342, 17355, 17358, 17359, 17371, 17377, 17380, 17389, 17395, 17397, 17399, 17401, 17402, 17403, 17404, 17406, 17409, 17412, 17414, 17418, 17423, 17424, 17425, 17431, 17433, 17434, 17435, 17440, 17441, 17443, 17444, 17445, 17446, 17468, 17477, 17478, 17481, 17482, 17483, 17487, 17494, 17500, 17505, 17508, 17509, 17510, 17511, 17512, 17513, 17514, 17519, 17520, 17524, 17534, 17535, 17538, 17540, 17542, 17553, 17554, 17555, 17589, 17599, 17600, 17601, 17606, 17608, 17609, 17610, 17612, 17613, 17614, 17627, 17628, 17629, 17630, 17631, 17632, 17633, 17635, 17636, 17638, 17640, 17642, 17647, 17651, 17652, 17653, 17664, 17678, 17682, 17684, 17694, 17713, 17716, 17717, 17718, 17722, 17729, 17730, 17739, 17767, 17768, 17769, 17771, 17772, 17773, 17797, 17801, 17803, 17807, 17808, 17809, 17810, 17811, 17812, 17815, 17825, 17826, 17831, 17833, 17834, 17841, 17842, 17843, 17844, 17845, 17849, 17852, 17853, 17855, 17856, 17862, 17864, 17865, 17866, 17870, 17871, 17873, 17874, 17875, 17877, 17879, 17882, 17884, 17885, 17886, 17887, 17888, 17890, 17892, 17893, 17899, 17903, 17905, 17909, 17910, 17911, 17912, 17913, 17914, 17917, 17922, 17926, 17927, 17928, 17935, 17936, 17938, 17940, 17941, 17944, 17948, 17951, 17956, 17960, 17961, 17963, 17968, 17969, 17975, 17978, 17981, 17982, 17986, 17993, 17995, 17996, 18003, 18004, 18005, 18006, 18007, 18008, 18009, 18010, 18011, 18012, 18013, 18014, 18015, 18016, 18017, 18018, 18020, 18021, 18022, 18023, 18024, 18025, 18026, 18027, 18028, 18029, 18030, 18031, 18032, 18034, 18037, 18040, 18041, 18042, 18044, 18048, 18049, 18050, 18056, 18058, 18064, 18066, 18067, 18068, 18069, 18070, 18071, 18072, 18073, 18074, 18077, 18079, 18080, 18087, 18088, 18093, 18094, 18095, 18097, 18113, 18114, 18118, 18121, 18130, 18131, 18136, 18137, 18139, 18141, 18146, 18147, 18154, 18159, 18160, 18165, 18166, 18168, 18171, 18172, 18174, 18175, 18197, 18202, 18204, 18207, 18209, 18210, 18221, 18230, 18231, 18232, 18233, 18234, 18237, 18240, 18250, 18251, 18253, 18254, 18255, 18271, 18272, 18274, 18276, 18282, 18285, 18298, 18301, 18302, 18312, 18313, 18315, 18317, 18319, 18320, 18321, 18325, 18326, 18327, 18328, 18331, 18333, 18336, 18337, 18344, 18346, 18349, 18353, 18371, 18373, 18381, 18382, 18391, 18394, 18401, 18403, 18405, 18413, 18414, 18415, 18416, 18419, 18420, 18421, 18422, 18424, 18426, 18429, 18430, 18431, 18433, 18446, 18450, 18453, 18455, 18457, 18464, 18472, 18473, 18482, 18490, 18493, 18495, 18496, 18499, 18500, 18501, 18503, 18506, 18527, 18528, 18531, 18532, 18533, 18537, 18538, 18539, 18547, 18549, 18554, 18557, 18558, 18559, 18568, 18583, 18586, 18588, 18593, 18594, 18595, 18600, 18601, 18605, 18606, 18607, 18614, 18615, 18617, 18618, 18619, 18620, 18622, 18633, 18634, 18637, 18638, 18639, 18640, 18641, 18642, 18658, 18661, 18663, 18664, 18666, 18668, 18669, 18671, 18674, 18675, 18676, 18679, 18681, 18682, 18683, 18684, 18685, 18686, 18687, 18693, 18697, 18698, 18701, 18702, 18715, 18716, 18719, 18724, 18730, 18732, 18743, 18744, 18749, 18751, 18753, 18756, 18760, 18761, 18763, 18772, 18773, 18774, 18781, 18790, 18792, 18794, 18799, 18802, 18805, 18806, 18807, 18808, 18810, 18812, 18813, 18815, 18821, 18829, 18832, 18834, 18835, 18836, 18838, 18846, 18848, 18852, 18855, 18856, 18857, 18858, 18859, 18860, 18865, 18866, 18867, 18870, 18873, 18880, 18892, 18893, 18902, 18903, 18905, 18913, 18914, 18917, 18918, 18919, 18928, 18933, 18934, 18942, 18945, 18947, 18949, 18951, 18953, 18954, 18966, 18969, 18971, 18972, 18974, 18975, 18978, 18981, 18985, 18986, 18994, 18995, 18997, 18998, 19000, 19004, 19006, 19007, 19014, 19015, 19016, 19017, 19018, 19019, 19020, 19021, 19052, 19064, 19136, 19141, 19151, 19157, 19168, 19191, 19192, 19202, 19203, 19204, 19205, 19206, 19208, 19216, 19217, 19220, 19221, 19226, 19227, 19232, 19233, 19234, 19235, 19236, 19238, 19239, 19242, 19243, 19244, 19245, 19246, 19248, 19249, 19250, 19251, 19252, 19257, 19258, 19268, 19282, 19287, 19288, 19290, 19293, 19294, 19296, 19298, 19306, 19314, 19315, 19317, 19330, 19331, 19335, 19338, 19340, 19354, 19361, 19378, 19384, 19389, 19405, 19407, 19408, 19410, 19411, 19412, 19413, 19415, 19422, 19424, 19428, 19434, 19435, 19457, 19464, 19467, 19477, 19486, 19493, 19494, 19502, 19504, 19505, 19507, 19509, 19516, 19517, 19518, 19520, 19521, 19526, 19527, 19528, 19530, 19532, 19543, 19544, 19545, 19546, 19556, 19558, 19566, 19567, 19593, 19599, 19604, 19605, 19610, 19613, 19621, 19633, 19643, 19644, 19657, 19663, 19666, 19667, 19668, 19671, 19676, 19678, 19682, 19683, 19694, 19701, 19719, 19722, 19732, 19736, 19740, 19744, 19747, 19756, 19757, 19767, 19768, 19774, 19775, 19777, 19778, 19789, 19792, 19795, 19796, 19797, 19799, 19800, 19801, 19825, 19826, 19830, 19847, 19852, 19872, 19874, 19875, 19878, 19881, 19882, 19887, 19888, 19890, 19891, 19893, 19902, 19914, 19922, 19926, 19935, 19936, 19945, 19947, 19952, 19959, 19963, 19972, 19983, 19984, 19985, 19989, 19992, 19994, 19996, 19998, 20002, 20021, 20032, 20033, 20034, 20036, 20037, 20043, 20044, 20045, 20046, 20047, 20049, 20050, 20059, 20062, 20083, 20087, 20089, 20113, 20115, 20122, 20132, 20134, 20135, 20138, 20139, 20145, 20154, 20157, 20159, 20161, 20163, 20177, 20179, 20180, 20183, 20184, 20190, 20196, 20211, 20215, 20231, 20242, 20248, 20252, 20253, 20254, 20256, 20257, 20259, 20260, 20261, 20262, 20263, 20266, 20270, 20292, 20297, 20300, 20301, 20302, 20306, 20309, 20310, 20312, 20313, 20316, 20318, 20319, 20320, 20322, 20323, 20329, 20339, 20346, 20347, 20348, 20349, 20350, 20351, 20352, 20353, 20354, 20355, 20357, 20358, 20359, 20360, 20361, 20370, 20372, 20373, 20376, 20377, 20378, 20380, 20394, 20397, 20400, 20401, 20407, 20422, 20424, 20426, 20444, 20445, 20454, 20456, 20478, 20483, 20496, 20516, 20521, 20525, 20530, 20532, 20533, 20537, 20546, 20547, 20554, 20568, 20576, 20577, 20609, 20614, 20618, 20622, 20623, 20625, 20627, 
	20629, 20632, 20638, 20643, 20645, 20646, 20647, 20648, 20649, 20650, 20651, 20653, 20655, 20656, 20660, 20664, 20669, 20677, 20678, 20679, 20680, 20683, 20684, 20685, 20688, 20689, 20690, 20691, 20694, 20695, 20697, 20698, 20699, 20701, 20702, 20703, 20704, 20705, 20706, 20713, 20726, 20731, 20732, 20735, 20738, 20741, 20742, 20743, 20753, 20757, 20766, 20790, 20791, 20794, 20795, 20810, 20859, 20868, 20870, 20871, 20872, 20875, 20879, 20880, 20883, 20887, 20888, 20893, 20897, 20901, 20902, 20905, 20907, 20908, 20909, 20912, 20913, 20921, 20929, 20930, 20977, 20985, 20988, 20990, 21001, 21019, 21021, 21024, 21026, 21027, 21029, 21047, 21049, 21058, 21059, 21060, 21062, 21065, 21066, 21076, 21089, 21104, 21117, 21126, 21135, 21136, 21138, 21139, 21148, 21155, 21164, 21165, 21166, 21168, 21171, 21172, 21178, 21180, 21183, 21200, 21207, 21212, 21214, 21216, 21220, 21224, 21226, 21228, 21229, 21230, 21242, 21255, 21267, 21276, 21277, 21285, 21287, 21299, 21300, 21302, 21309, 21311, 21325, 21338, 21339, 21341, 21342, 21343, 21344, 21345, 21349, 21350, 21354, 21357, 21370, 21383, 21384, 21385, 21387, 21402, 21403, 21405, 21409, 21410, 21416, 21417, 21420, 21428, 21453, 21465, 21466, 21467, 21492, 21500, 21503, 21505, 21506, 21512, 21516, 21517, 21520, 21521, 21523, 21535, 21536, 21537, 21539, 21540, 21541, 21546, 21547, 21548, 21558, 21568, 21570, 21571, 21572, 21573, 21574, 21575, 21577, 21578, 21581, 21587, 21589, 21593, 21594, 21595, 21597, 21599, 21600, 21601, 21602, 21604, 21610, 21611, 21615, 21616, 21617, 21626, 21628, 21646, 21647, 21649, 21652, 21660, 21663, 21695, 21696, 21697, 21699, 21700, 21701, 21702, 21703, 21704, 21705, 21706, 21707, 21708, 21709, 21710, 21711, 21712, 21718, 21719, 21720, 21721, 21727, 21728, 21730, 21732, 21733, 21734, 21735, 21742, 21744, 21746, 21763, 21770, 21771, 21772, 21773, 21774, 21777, 21783, 21787, 21790, 21795, 21797, 21805, 21806, 21807, 21809, 21811, 21821, 21826, 21827, 21842, 21858, 21860, 21865, 21867, 21877, 21894, 21901, 21902, 21905, 21906, 21907, 21908, 21911, 21915, 21916, 21917, 21919, 21923, 21925, 21928, 21937, 21938, 21963, 21964, 21965, 21966, 21976, 21981, 21986, 22005, 22006, 22012, 22016, 22017, 22022, 22024, 22025, 22039, 22061, 22064, 22067, 22074, 22075, 22076, 22081, 22083, 22085, 22093, 22108, 22113, 22114, 22122, 22127, 22130, 22138, 22144, 22149, 22151, 22165, 22166, 22168, 22170, 22171, 22189, 22195, 22201, 22205, 22206, 22208, 22212, 22216, 22217, 22218, 22221, 22232, 22238, 22242, 22243, 22251, 22254, 22262, 22273, 22274, 22281, 22283, 22285, 22289, 22297, 22298, 22299, 22300, 22301, 22302, 22305, 22308, 22309, 22310, 22327, 22331, 22341, 22342, 22346, 22357, 22362, 22363, 22370, 22377, 22378, 22381, 22384, 22385, 22387, 22393, 22408, 22410, 22423, 22433, 22452, 22453, 22454, 22456, 22462, 22463, 22477, 22479, 22491, 22510, 22511, 22512, 22513, 22514, 22540, 22546, 22810, 22815, 22820, 22823, 22825, 22827, 22836, 22840, 22842, 22843, 22845, 22846, 22847, 22853, 22859, 22860, 22861, 22862, 22863, 22864, 22871, 22874, 22875, 22876, 22877, 22882, 22889, 22902, 22910, 22911, 22912, 22916, 22917, 22924, 22929, 22932, 22938, 22940, 22945, 22947, 22949, 22950, 22951, 22955, 22956, 22957, 22959, 22960, 22963, 22964, 22966, 22972, 22979, 22981, 22986, 22988, 22990, 22993, 22994, 23002, 23007, 23018, 23022, 23028, 23030, 23035, 23036, 23046, 23053, 23054, 23057, 23058, 23066, 23067, 23068, 23078, 23089, 23101, 23113, 23127, 23131, 23151, 23153, 23154, 23161, 23164, 23170, 23171, 23179, 23185, 23188, 23191, 23197, 23215, 23220, 23228, 23230, 23231, 23237, 23247, 23266, 23268, 23270, 23271, 23272, 23273, 23278, 23319, 23320, 23330, 23333, 23338, 23340, 23342, 23343, 23344, 23353, 23354, 23355, 23365, 23368, 23380, 23385, 23390, 23391, 23393, 23397, 23398, 23399, 23400, 23402, 23404, 23406, 23408, 23410, 23411, 23414, 23421, 23427, 23434, 23436, 23440, 23441, 23467, 23474, 23475, 23476, 23489, 23501, 23506, 23523, 23524, 23534, 23535, 23536, 23537, 23565, 23569, 23574, 23581, 23583, 23590, 23593, 23595, 23596, 23600, 23601, 23602, 23619, 23623, 23624, 23626, 23694, 23704, 23714, 23727, 23751, 23752, 23753, 23789, 23832, 23841, 23843, 23861, 23864, 23868, 23869, 23881, 23892, 23900, 23941, 23948, 23995, 24003, 24004, 24025, 24039, 24179, 24222, 24239, 24240, 24244, 24369, 24413, 24420, 24422, 24423, 24424, 24426, 24433, 24435, 24462, 24463, 24529, 24552, 24553, 24555, 24556, 24558, 24560, 24561, 24656, 24664, 24683, 24684, 24686, 24687, 24690, 24696, 24697, 24723, 24727, 24736, 24744, 24761, 24762, 24782, 24815, 24822, 24850, 24854, 24855, 24857, 24891, 24892, 24895, 24918, 24919, 24933, 24955, 24960, 24966, 24972, 24976, 24977, 24978, 24979, 24981, 24998, 24999, 25002, 25003, 25007, 25022, 25023, 25030, 25031, 25037, 25038, 25039, 25040, 25043, 25045, 25053, 25056, 25061, 25073, 25087, 25108, 25115, 25132, 25144, 25153, 25155, 25160, 25163, 25164, 25165, 25166, 25167, 25169, 25170, 25172, 25175, 25196, 25200, 25202, 25223, 25236, 25315, 25363, 25367, 25370, 25371, 25373, 25483, 25506, 25508, 25509, 25541, 25545, 25547, 25548, 25549, 25553, 25555, 25560, 25562, 25563, 25564, 25565, 25566, 25567, 25568, 25570, 25572, 25573, 25576, 25578, 25579, 25597, 25754, 25799, 25851, 25863, 25885, 25924, 25951, 25955, 25958, 25976, 25977, 26046, 26075, 26090, 26091, 26092, 26101, 26221, 26222, 26307, 26324, 26325, 26326, 26327, 26328, 26330, 26331, 27703, 27705, 28343);
	 
	UPDATE creature_template SET RegenerateStats=3 WHERE entry IN (5491, 5492, 5720, 5721, 5912, 7484, 7689, 7846, 8680, 9461, 9637, 10161, 10218, 10516, 11583, 12265, 14832, 14865, 14868, 14871, 15463, 15803, 16054);

	-- Creatures that should have RegerateStats set to 0 (no regen)
	UPDATE creature_template SET RegenerateStats=0 WHERE entry IN (12423, 12427, 12428, 12429, 12430, 13020, 13148, 14484, 14485);

   
    -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
    
    -- If we get here ok, commit the changes
    IF bRollback = TRUE THEN
      ROLLBACK;
      SELECT '* UPDATE FAILED *' AS 'Status',@cThisRev AS 'DB is on Version';
    ELSE
      COMMIT;
      SELECT '* UPDATE COMPLETE *' AS 'Status',@cNewRev AS 'DB is now on Version';
    END IF;
  ELSE
    SELECT '* UPDATE SKIPPED *' AS 'Status',@cOldRev AS 'Required Version',@cThisRev AS 'Found Version';
  END IF;

END $$

DELIMITER ;

-- Execute the procedure
CALL update_mangos();

-- Drop the procedure
DROP PROCEDURE IF EXISTS `update_mangos`;

