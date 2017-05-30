-- ---------------------------------------- 
-- --        CLEAR DOWN THE TABLE        -- 
-- ---------------------------------------- 
TRUNCATE TABLE `conditions`; 
-- ---------------------------------------- 
-- MySQL dump 10.13  Distrib 5.5.37, for Win32 (x86)
--
-- Host: localhost    Database: mangos0
-- ------------------------------------------------------
-- Server version	5.6.25-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@SESSION.TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `conditions`
--

LOCK TABLES `conditions` WRITE;
/*!40000 ALTER TABLE `conditions` DISABLE KEYS */;
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES 
(1,2,9279,1),
(2,2,9281,1),
(3,6,67,0),
(4,6,469,0),
(5,8,4101,0),
(6,8,4102,0),
(7,8,4321,0),
(10,9,30,0),
(11,9,272,0),
(12,9,6627,0),
(13,14,0,1),
(14,14,0,2),
(15,14,0,4),
(16,14,0,8),
(17,14,0,64),
(18,14,0,128),
(19,14,0,256),
(20,14,0,511),
(21,14,0,1024),
(22,14,0,1279),
(23,14,0,1407),
(24,14,0,1471),
(25,14,0,1527),
(26,14,0,1531),
(27,14,0,1533),
(28,14,0,1534),
(29,16,9279,1),
(30,16,9281,1),
(31,22,4321,0),
(32,26,141,0),
(33,-1,3,21),
(34,-1,4,21),
(35,2,9280,1),
(36,2,9282,1),
(37,2,21211,1),
(43,8,2662,0),
(44,8,7848,0),
(50,9,2278,0),
(51,9,3441,1),
(52,9,3566,0),
(53,9,4285,0),
(54,9,4287,0),
(55,9,4288,0),
(56,9,5727,1),
(57,9,5929,0),
(58,9,5930,0),
(88,13,1048576,0),
(90,24,12846,1),
(92,8,3454,0),
(93,8,5216,0),
(95,9,558,0),
(96,9,4261,0),
(97,9,8620,0),
(107,15,10,1),
(108,26,324,0),
(109,8,5405,0),
(110,8,5503,0),
(111,11,24755,0),
(112,14,0,16),
(113,16,18642,1),
(118,24,10515,1),
(119,24,11445,1),
(120,24,11511,1),
(121,24,13370,1),
(122,24,21106,1),
(123,24,21107,1),
(124,24,21109,1),
(131,-1,5,120),
(132,-1,6,120),
(133,-1,13,107),
(134,-1,14,107),
(135,-1,15,107),
(136,-1,16,107),
(137,-1,17,107),
(138,-1,18,107),
(139,-1,19,107),
(140,-1,21,107),
(142,-2,110,141),
(143,-1,90,142),
(144,-1,92,118),
(145,-1,93,121),
(147,-1,95,113),
(148,-1,96,119),
(149,-1,97,122),
(150,-1,97,123),
(151,-1,97,124),
(163,-1,107,112),
(164,-1,108,111),
(165,7,129,240),
(166,7,129,260),
(167,7,129,290),
(168,15,24,1),
(169,17,20219,0),
(170,17,20222,0),
(171,17,10841,1),
(172,17,18629,1),
(173,17,18630,1),
(174,17,23486,1),
(175,17,23489,1),
(178,7,202,260),
(179,15,40,1),
(180,22,6681,0),
(181,-1,16,168),
(182,-1,165,171),
(183,-1,166,172),
(184,-1,167,173),
(185,-1,169,175),
(187,-1,170,174),
(191,-1,178,185),
(192,-1,178,187),
(193,-1,179,182),
(194,-1,179,183),
(195,-1,179,184),
(196,-1,180,181),
(197,2,11511,1),
(198,7,164,1),
(199,7,165,1),
(200,7,186,1),
(201,7,197,1),
(202,7,202,1),
(203,7,333,1),
(207,2,12384,1),
(208,2,13370,1),
(209,7,171,1),
(210,8,4242,0),
(211,9,5121,0),
(212,8,5251,0),
(213,8,5384,0),
(214,8,6383,0),
(215,8,7786,0),
(216,8,8460,0),
(217,8,8464,0),
(223,9,1846,0),
(224,9,5056,0),
(237,10,0,0),
(238,12,2,0),
(239,2,12765,1),
(240,2,12766,1),
(241,2,19727,1),
(243,7,202,300),
(244,17,22704,0),
(245,17,22704,1),
(246,29,202,1),
(247,29,202,300),
(248,-1,243,245),
(249,8,7761,0),
(250,9,6001,1),
(251,9,6002,1),
(252,9,3377,1),
(253,9,4296,0),
(254,24,11470,1),
(255,-1,253,254),
(256,8,975,0),
(257,24,12384,1),
(258,-1,256,257),
(259,8,8227,0),
(260,7,171,300),
(261,17,24266,1),
(262,-1,260,261),
(263,9,3628,1),
(264,2,10757,1),
(265,-1,263,264),
(266,8,6164,0),
(267,7,171,180),
(268,7,185,175),
(269,17,3451,1),
(270,17,13028,1),
(271,-1,268,270),
(272,-1,267,269),
(273,5,589,7),
(274,9,6628,0),
(275,11,6767,0),
(276,-1,274,275),
(277,8,5237,0),
(278,8,5238,0),
(279,-1,121,277),
(280,-1,121,278),
(281,9,5742,0),
(282,9,3702,0),
(283,9,3909,0),
(284,22,770,0),
(285,9,925,0),
(286,24,18643,1),
(287,-1,285,286),
(288,9,5126,0),
(289,5,59,4),
(290,8,5862,0),
(291,8,5944,0),
(292,9,5862,0),
(293,11,17961,0),
(294,-3,291,0),
(295,-1,290,294),
(296,-2,292,295),
(297,-1,293,296),
(298,-2,57,58),
(299,7,186,230),
(300,8,4083,0),
(301,17,14891,1),
(302,-1,299,301),
(303,-1,300,302),
(304,-3,300,0),
(305,-1,302,304),
(306,2,18563,1),
(307,2,18564,1),
(308,8,7785,0),
(309,24,19016,1),
(310,-3,308,0),
(311,-2,306,307),
(312,-1,309,310),
(313,-1,311,312),
(314,9,8304,0),
(315,8,1094,0),
(316,9,6981,0),
(319,24,7231,1),
(320,9,1886,0),
(321,-1,320,319),
(322,12,35,0),
(323,12,36,0),
(965,8,3785,0),
(325,8,5529,0),
(326,15,19,2),
(356,2,17203,1),
(1001,14,0,1519),
(1028,-1,107,19),
(1343,17,28242,1),
(1342,17,28221,1),
(1341,17,28220,1),
(1340,17,28219,1),
(1339,17,28224,1),
(1338,17,28223,1),
(1337,17,28222,1),
(383,33,2,1),
(384,33,8,0),
(385,33,8,2),
(386,33,10,2),
(387,-1,383,386),
(388,-1,383,385),
(389,33,1,0),
(357,-2,10,11),
(1679,24,18628,1),
(1680,-1,356,1679),
(1681,8,7604,0),
(1682,-3,1681,0),
(1683,-1,1680,1682),
(601,2,15044,1),
(602,9,5902,0),
(603,9,5904,0),
(605,-1,601,604),
(604,-2,602,603),
(1717,12,8,0),
(9,9,4941,0),
(8,2,10455,1),
(390,33,19,0),
(722,33,32,0),
(720,33,9,0),
(358,9,8738,0),
(359,24,21160,1),
(360,-1,358,359),
(59,8,8555,0),
(361,7,171,50),
(362,7,171,125),
(363,7,171,200),
(364,-1,362,3),
(365,-1,362,4),
(366,7,164,50),
(367,7,164,125),
(368,7,164,200),
(380,7,333,50),
(381,7,333,125),
(382,7,333,200),
(372,7,197,50),
(373,7,197,125),
(374,7,197,200),
(375,-1,373,3),
(376,-1,373,4),
(377,7,165,50),
(378,7,165,125),
(379,7,165,200),
(391,7,202,50),
(392,7,202,125),
(393,7,202,200),
(394,-1,391,3),
(395,-1,391,4),
(723,33,38,0),
(733,18,0,0),
(734,18,1,0),
(735,18,2,0),
(736,18,3,0),
(737,18,4,0),
(738,-2,735,736),
(739,-2,738,734),
(855,1,23768,0),
(856,1,23769,0),
(857,1,23767,0),
(858,1,23738,0),
(859,1,23766,0),
(860,1,23737,0),
(861,1,23736,0),
(862,1,23735,0),
(863,-2,855,856),
(864,-2,857,858),
(865,-2,859,860),
(866,-2,861,862),
(867,-2,863,864),
(868,-2,865,866),
(869,-2,867,868),
(870,-3,869,0),
(396,7,129,1),
(397,7,129,50),
(398,7,129,125),
(399,7,129,200),
(400,7,185,1),
(401,7,185,50),
(402,7,185,125),
(403,7,185,200),
(404,7,356,1),
(405,7,356,50),
(406,7,356,125),
(407,7,356,200),
(38,7,182,1),
(39,9,5721,0),
(851,-2,831,839),
(831,-1,812,821),
(812,5,68,7),
(821,14,674,0),
(839,14,16,0),
(845,-2,825,836),
(825,-1,806,815),
(806,5,76,7),
(815,14,688,0),
(836,14,2,0),
(849,-2,829,842),
(829,-1,810,819),
(810,5,530,7),
(819,14,562,0),
(842,14,128,0),
(846,-2,826,835),
(826,-1,807,816),
(807,5,72,7),
(816,14,1100,0),
(835,14,1,0),
(847,-2,827,840),
(827,-1,808,817),
(808,5,81,7),
(817,14,658,0),
(840,14,32,0),
(939,5,909,5),
(934,-2,808,840),
(933,-2,807,835),
(932,-2,810,842),
(931,-2,806,836),
(461,24,14639,1),
(462,7,202,140),
(671,-1,462,35),
(672,-1,461,671),
(887,11,24746,0),
(888,1,24746,0),
(889,11,24748,0),
(890,-1,888,889),
(891,1,24748,0),
(892,-1,888,891),
(893,1,24782,0),
(894,-1,892,893),
(895,2,20416,1),
(896,2,20419,1),
(897,2,20418,1),
(898,2,20420,1),
(899,-1,888,895),
(900,-1,888,896),
(901,-1,888,897),
(902,-1,888,898),
(903,2,20432,1),
(904,2,20435,1),
(905,2,20433,1),
(906,2,20436,1),
(907,-1,892,903),
(908,-1,892,904),
(909,-1,892,905),
(910,-1,892,906),
(911,2,20447,1),
(912,2,20449,1),
(913,2,20448,1),
(914,2,20450,1),
(915,-1,894,911),
(916,-1,894,912),
(917,-1,894,913),
(918,-1,894,914),
(242,4,490,0),
(61,24,20949,1),
(62,-1,61,59),
(60,2,20949,1),
(63,2,12219,1),
(1002,30,349,3),
(1003,5,349,3),
(1004,-1,1002,1003),
(1005,30,349,4),
(1006,5,349,4),
(1007,-1,1005,1006),
(1008,5,349,5),
(1009,8,1029,0),
(1010,15,51,1),
(1011,15,20,1),
(1020,9,8283,0),
(1021,8,7721,0),
(1022,8,7003,0),
(1023,-1,1021,1022),
(1024,8,2458,0),
(1025,5,47,7),
(1026,14,1097,0),
(1027,-1,1025,1026),
(1029,22,8718,0),
(1030,22,8720,0),
(1031,22,8654,0),
(1032,22,8681,0),
(1033,22,8686,0),
(1034,22,8717,0),
(1035,22,8678,0),
(1036,22,8680,0),
(1037,22,8723,0),
(1038,22,8672,0),
(1039,22,8677,0),
(1040,22,8652,0),
(1041,22,8651,0),
(1042,22,8714,0),
(1043,22,8648,0),
(1044,22,8670,0),
(1045,22,8636,0),
(1046,22,8650,0),
(1047,22,8688,0),
(1048,22,8722,0),
(1049,22,8645,0),
(1050,22,8685,0),
(1051,22,8724,0),
(1052,22,8635,0),
(1053,22,8866,0),
(1054,22,8649,0),
(1055,22,8673,0),
(1056,22,8653,0),
(1057,22,8619,0),
(1058,22,8642,0),
(1059,22,8644,0),
(1060,22,8679,0),
(1061,22,8643,0),
(1062,22,8682,0),
(1063,22,8726,0),
(1064,22,8725,0),
(1065,22,8721,0),
(1066,22,8719,0),
(1067,22,8684,0),
(1068,22,8676,0),
(1069,22,8683,0),
(1070,22,8646,0),
(1071,22,8674,0),
(1072,22,8715,0),
(1073,22,8671,0),
(1074,22,8727,0),
(1075,22,8713,0),
(1076,22,8647,0),
(1077,22,8716,0),
(1078,22,8675,0),
(1079,-1,107,18),
(1080,-1,107,17),
(1081,-1,107,16),
(1082,-1,107,14),
(1083,-1,107,13),
(1085,-1,107,15),
(1086,8,862,0),
(1087,-1,107,21),
(1088,8,3129,0),
(1089,8,1269,0),
(1091,9,2381,0),
(1092,9,2118,0),
(1093,24,7586,1),
(1094,-1,1092,1093),
(1095,9,4021,0),
(1096,24,11227,1),
(1097,-1,1095,1096),
(1099,9,4342,0),
(1098,9,4001,0),
(1101,9,8534,0),
(1102,24,21158,1),
(1103,-1,1101,1102),
(1104,2,9327,1),
(1105,7,202,160),
(1106,-1,35,461),
(1107,-1,1106,1104),
(1108,-1,1107,1105),
(1109,9,8739,0),
(1110,24,21161,1),
(1111,-1,1109,1110),
(1112,8,8698,0),
(1113,24,21399,1),
(1114,-1,1112,1113),
(1115,8,8702,0),
(1116,24,21417,1),
(1117,-1,1115,1116),
(1118,8,8704,0),
(1119,24,21402,1),
(1120,-1,1118,1119),
(1121,8,8556,0),
(1122,24,21393,1),
(1123,-1,1121,1122),
(1124,24,12563,1),
(1125,15,55,1),
(1126,-1,1125,1124),
(1344,17,28243,1),
(1345,17,28244,1),
(1346,17,28209,1),
(1347,17,28205,1),
(1348,17,28208,1),
(1350,17,28207,1),
(1357,-1,1349,1356),
(1356,7,197,300),
(1355,-1,1349,1354),
(1354,7,164,300),
(1353,-1,1349,1352),
(1352,7,165,300),
(1351,5,529,7),
(1349,5,529,6),
(1358,-1,1351,1337),
(1359,-1,1351,1340),
(1360,-1,1351,1343),
(1361,-1,1351,1348),
(1362,-1,1351,1350),
(1363,24,22719,1),
(1364,22,9233,0),
(1365,-1,1363,1364),
(1366,-1,1365,1349),
(40,14,4,0),
(1100,-2,40,1027),
(41,8,1324,0),
(106,8,5401,0),
(141,-2,106,109),
(45,8,8867,0),
(46,24,21711,1),
(47,-1,45,46),
(98,8,7734,0),
(99,8,7733,0),
(100,9,7734,0),
(101,9,7733,0),
(102,-2,98,100),
(103,-2,99,101),
(1367,2,20453,1),
(1718,8,8700,0),
(1719,24,21408,1),
(1720,-1,1718,1719),
(1721,8,8699,0),
(1722,24,21414,1),
(1723,-1,1721,1722),
(1724,8,8701,0),
(1725,24,21405,1),
(1726,-1,1724,1725),
(1727,8,8703,0),
(1728,24,21396,1),
(1729,-1,1727,1728),
(1730,8,8697,0),
(1731,24,21411,1),
(1732,-1,1730,1731),
(1090,9,1999,0),
(673,4,17,0),
(974,8,3786,0),
(89,37,7172,80),
(943,-1,942,941),
(942,8,4921,0),
(941,8,899,0),
(1733,38,181054,13),
(218,5,69,7),
(219,14,69,0),
(220,-1,218,219),
(221,14,8,0),
(222,-2,220,221),
(327,5,54,7),
(328,14,13,0),
(329,-1,327,328),
(330,14,64,0),
(331,-2,329,330),
(48,9,7482,0),
(49,9,7481,0),
(408,9,2768,0),
(409,-1,408,384),
(204,37,412,100000),
(1142,17,3959,1),
(1143,-1,1142,1104),
(1144,-1,1143,1105),
(67,8,6805,0),
(68,8,6824,0),
(69,30,749,5),
(70,-1,68,69),
(71,5,749,6),
(72,24,17333,1),
(73,-1,70,72),
(74,-1,68,71),
(75,24,22754,1),
(76,-1,74,75),
(152,8,5513,0),
(153,8,5507,0),
(154,8,5504,0),
(155,-2,152,153),
(156,-2,154,155),
(157,8,5524,0),
(158,8,5521,0),
(159,8,5517,0),
(160,-2,157,158),
(161,-2,159,160),
(966,9,3382,0),
(976,1,22799,0),
(977,-3,976,0),
(978,33,7,0),
(979,-1,976,978),
(114,2,18250,1),
(324,8,5052,0),
(317,36,0,60),
(318,36,3,0),
(340,8,5202,0),
(341,8,5203,0),
(205,9,3801,0),
(844,9,4136,0),
(1336,8,5058,0),
(803,8,4985,0),
(804,9,5247,0),
(805,8,5245,0),
(1200,8,826,0),
(2000,15,13,1),
(2001,15,15,1),
(2002,15,18,1),
(2003,15,22,1),
(2004,15,29,1),
(2005,15,31,1),
(2006,15,33,1),
(2007,15,35,1),
(2008,15,38,1),
(2009,15,43,1),
(2010,15,44,1),
(2011,15,48,1),
(2012,15,52,1),
(2013,15,56,1),
(2014,15,60,0),
(2015,2,16309,1),
(2016,-1,2014,2015),
(2017,-1,2014,44),
(2018,-1,2014,249),
(2019,8,9378,0),
(2020,-1,2014,2019),
(2030,39,10,1),
(2031,-1,3,2030),
(2032,-1,4,2030),
(1145,8,4289,0),
(1146,8,4290,0),
(125,8,4201,0),
(77,7,197,280),
(78,17,26086,1),
(79,17,26086,0),
(80,-1,77,78),
(81,-1,77,79),
(2033,9,658,0),
(832,9,2936,0),
(871,9,4224,0),
(1368,8,8311,0),
(1369,8,8312,0),
(1370,11,24705,0),
(1371,1,24705,0),
(162,12,12,0),
(2034,2,9173,1),
(2035,8,2843,0);
/*!40000 ALTER TABLE `conditions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-05-30 21:12:48
