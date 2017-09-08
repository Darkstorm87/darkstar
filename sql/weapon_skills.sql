-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 192.168.1.10    Database: dspdb
-- ------------------------------------------------------
-- Server version	5.7.17-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `weapon_skills`
--

DROP TABLE IF EXISTS `weapon_skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `weapon_skills` (
  `weaponskillid` tinyint(3) unsigned NOT NULL,
  `name` text NOT NULL,
  `jobs` binary(22) NOT NULL,
  `type` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `skilllevel` smallint(3) unsigned NOT NULL DEFAULT '0',
  `element` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `animation` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `animationTime` smallint(4) unsigned NOT NULL DEFAULT '0',
  `range` tinyint(2) unsigned NOT NULL DEFAULT '5',
  `aoe` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `primary_sc` tinyint(4) NOT NULL DEFAULT '0',
  `secondary_sc` tinyint(4) NOT NULL DEFAULT '0',
  `tertiary_sc` tinyint(4) NOT NULL DEFAULT '0',
  `main_only` tinyint(1) NOT NULL DEFAULT '0',
  `unlock_id` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`weaponskillid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weapon_skills`
--

LOCK TABLES `weapon_skills` WRITE;
/*!40000 ALTER TABLE `weapon_skills` DISABLE KEYS */;
INSERT INTO `weapon_skills` VALUES (1,'combo','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1,5,0,16,2000,5,1,8,0,0,0,0);
INSERT INTO `weapon_skills` VALUES (2,'shoulder_tackle','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1,40,0,17,2000,5,1,5,8,0,0,0);
INSERT INTO `weapon_skills` VALUES (3,'one_inch_punch','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1,75,0,18,2000,5,1,2,0,0,0,0);
INSERT INTO `weapon_skills` VALUES (4,'backhand_blow','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1,100,0,19,2000,5,1,6,0,0,0,0);
INSERT INTO `weapon_skills` VALUES (5,'raging_fists','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1,125,0,20,2000,5,1,8,0,0,0,0);
INSERT INTO `weapon_skills` VALUES (6,'spinning_attack','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1,150,0,21,2000,5,2,3,8,0,0,0);
INSERT INTO `weapon_skills` VALUES (7,'howling_fist','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1,200,0,22,2000,5,1,1,8,0,1,0);
INSERT INTO `weapon_skills` VALUES (8,'dragon_kick','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1,225,0,23,2000,5,1,12,0,0,1,0);
INSERT INTO `weapon_skills` VALUES (9,'asuran_fists','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1,250,0,24,2000,5,1,9,3,0,1,0);
INSERT INTO `weapon_skills` VALUES (10,'final_heaven','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1,0,0,25,2000,5,1,13,11,0,1,0);
INSERT INTO `weapon_skills` VALUES (11,'ascetics_fury','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1,0,0,26,2000,5,1,11,1,0,1,15);
INSERT INTO `weapon_skills` VALUES (12,'stringing_pummel','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1,0,0,27,2000,5,1,9,3,0,1,16);
INSERT INTO `weapon_skills` VALUES (13,'tornado_kick','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1,300,0,28,2000,5,1,7,8,6,0,0);
INSERT INTO `weapon_skills` VALUES (14,'victory_smite','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1,0,0,29,2000,5,1,13,12,0,1,35);
INSERT INTO `weapon_skills` VALUES (15,'shijin_spiral','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1,300,0,30,2000,5,1,11,5,0,1,0);
INSERT INTO `weapon_skills` VALUES (16,'wasp_sting','\0\0\0\0\0',2,5,0,31,2000,5,1,4,0,0,0,0);
INSERT INTO `weapon_skills` VALUES (19,'gust_slash','\0\0\0\0\0',2,40,16,34,2000,5,1,6,0,0,0,0);
INSERT INTO `weapon_skills` VALUES (18,'shadowstitch','\0\0\0\0\0',2,70,0,33,2000,5,1,5,0,0,0,0);
INSERT INTO `weapon_skills` VALUES (17,'viper_bite','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',2,100,0,32,2000,5,1,4,0,0,0,0);
INSERT INTO `weapon_skills` VALUES (20,'cyclone','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',2,125,16,35,2000,5,2,6,8,0,0,0);
INSERT INTO `weapon_skills` VALUES (21,'energy_steal','\0\0\0\0\0',2,150,0,36,2000,5,1,0,0,0,0,0);
INSERT INTO `weapon_skills` VALUES (22,'energy_drain','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',2,175,0,37,2000,5,1,0,0,0,0,0);
INSERT INTO `weapon_skills` VALUES (23,'dancing_edge','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',2,200,0,38,2000,5,1,4,6,0,1,0);
INSERT INTO `weapon_skills` VALUES (24,'shark_bite','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',2,225,0,39,2000,5,1,12,0,0,1,0);
INSERT INTO `weapon_skills` VALUES (25,'evisceration','\0\0\0\0\0\0\0\0\0\0\0\0\0',2,230,0,40,2000,5,1,9,1,0,1,0);
INSERT INTO `weapon_skills` VALUES (30,'aeolian_edge','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',2,290,16,45,2000,5,2,8,4,6,0,0);
INSERT INTO `weapon_skills` VALUES (26,'mercy_stroke','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',2,0,0,41,2000,5,1,14,9,0,1,0);
INSERT INTO `weapon_skills` VALUES (27,'mandalic_stab','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',2,0,0,42,2000,5,1,11,2,0,1,17);
INSERT INTO `weapon_skills` VALUES (28,'mordant_rime','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',2,0,0,43,2000,5,1,12,10,0,1,18);
INSERT INTO `weapon_skills` VALUES (29,'pyrrhic_kleos','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',2,0,0,44,2000,5,1,10,4,0,1,19);
INSERT INTO `weapon_skills` VALUES (31,'rudras_storm','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',2,0,0,236,2000,5,1,14,10,0,1,36);
INSERT INTO `weapon_skills` VALUES (224,'exenterator','\0\0\0\0\0\0\0\0\0\0\0\0\0',2,300,0,238,2000,5,1,12,4,0,1,0);
INSERT INTO `weapon_skills` VALUES (32,'fast_blade','\0\0\0\0\0\0\0',3,5,0,1,2000,5,1,4,0,0,0,0);
INSERT INTO `weapon_skills` VALUES (33,'burning_blade','\0\0\0\0\0\0\0',3,30,2,2,2000,5,1,3,0,0,0,0);
INSERT INTO `weapon_skills` VALUES (34,'red_lotus_blade','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',3,50,2,3,2000,5,1,3,6,0,0,0);
INSERT INTO `weapon_skills` VALUES (35,'flat_blade','\0\0\0\0\0\0\0',3,75,0,6,2000,5,1,8,0,0,0,0);
INSERT INTO `weapon_skills` VALUES (36,'shining_blade','\0\0\0\0\0\0\0',3,100,128,4,2000,5,1,4,0,0,0,0);
INSERT INTO `weapon_skills` VALUES (37,'seraph_blade','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',3,125,128,5,2000,5,1,4,0,0,0,0);
INSERT INTO `weapon_skills` VALUES (38,'circle_blade','\0\0\0\0\0\0\0',3,150,0,7,2000,5,2,5,8,0,0,0);
INSERT INTO `weapon_skills` VALUES (39,'spirits_within','\0\0\0\0\0\0\0',3,175,0,8,2000,5,1,0,0,0,0,0);
INSERT INTO `weapon_skills` VALUES (40,'vorpal_blade','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',3,200,0,9,2000,5,1,4,8,0,0,0);
INSERT INTO `weapon_skills` VALUES (41,'swift_blade','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',3,225,0,10,2000,5,1,9,0,0,1,0);
INSERT INTO `weapon_skills` VALUES (238,'uriel_blade','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',3,240,128,243,2000,6,2,13,12,0,0,0);
INSERT INTO `weapon_skills` VALUES (239,'glory_slash','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',3,240,0,242,2000,6,2,13,11,0,0,0);
INSERT INTO `weapon_skills` VALUES (42,'savage_blade','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',3,240,0,11,2000,5,1,12,4,0,1,0);
INSERT INTO `weapon_skills` VALUES (225,'chant_du_cygne','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',3,0,0,233,2000,5,1,13,10,0,1,37);
INSERT INTO `weapon_skills` VALUES (43,'knights_of_round','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',3,0,0,12,2000,5,1,13,11,0,1,0);
INSERT INTO `weapon_skills` VALUES (44,'death_blossom','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',3,0,0,13,2000,5,1,12,10,0,1,20);
INSERT INTO `weapon_skills` VALUES (45,'atonement','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',3,0,0,14,2000,5,1,11,5,0,1,21);
INSERT INTO `weapon_skills` VALUES (46,'expiacion','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',3,0,0,15,2000,5,1,10,4,0,1,22);
INSERT INTO `weapon_skills` VALUES (47,'sanguine_blade','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',3,300,0,230,2000,5,1,0,0,0,0,0);
INSERT INTO `weapon_skills` VALUES (226,'requiescat','\0\0\0\0\0\0\0\0\0\0\0\0\0\0',3,300,1,237,2000,5,1,9,4,0,1,0);
INSERT INTO `weapon_skills` VALUES (48,'hard_slash','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',4,5,0,106,2000,5,1,4,0,0,0,0);
INSERT INTO `weapon_skills` VALUES (49,'power_slash','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',4,30,0,107,2000,5,1,1,0,0,0,0);
INSERT INTO `weapon_skills` VALUES (50,'frostbite','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',4,70,32,108,2000,5,1,7,0,0,0,0);
INSERT INTO `weapon_skills` VALUES (51,'freezebite','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',4,100,32,109,2000,5,1,7,6,0,0,0);
INSERT INTO `weapon_skills` VALUES (52,'shockwave','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',4,150,0,110,2000,5,2,5,0,0,0,0);
INSERT INTO `weapon_skills` VALUES (53,'crescent_moon','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',4,175,0,111,2000,5,1,4,0,0,0,0);
INSERT INTO `weapon_skills` VALUES (54,'sickle_moon','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',4,200,0,112,2000,5,1,4,8,0,1,0);
INSERT INTO `weapon_skills` VALUES (55,'spinning_slash','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',4,225,0,113,2000,5,1,12,0,0,1,0);
INSERT INTO `weapon_skills` VALUES (56,'ground_strike','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',4,250,0,114,2000,5,1,12,10,0,0,0);
INSERT INTO `weapon_skills` VALUES (58,'herculean_slash','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',4,290,0,116,2000,5,1,7,8,6,0,0);
INSERT INTO `weapon_skills` VALUES (57,'scourge','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',4,0,0,115,2000,5,1,13,11,0,1,0);
INSERT INTO `weapon_skills` VALUES (59,'torcleaver','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',4,0,0,117,2000,5,1,13,10,0,1,38);
INSERT INTO `weapon_skills` VALUES (60,'resolution','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',4,300,0,118,2000,5,1,12,4,0,1,0);
INSERT INTO `weapon_skills` VALUES (64,'raging_axe','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',5,5,0,46,2000,5,1,6,8,0,0,0);
INSERT INTO `weapon_skills` VALUES (65,'smash_axe','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',5,40,0,47,2000,5,1,7,5,0,0,0);
INSERT INTO `weapon_skills` VALUES (66,'gale_axe','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',5,70,0,48,2000,5,1,6,0,0,0,0);
INSERT INTO `weapon_skills` VALUES (67,'avalanche_axe','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',5,100,0,49,2000,5,1,4,8,0,0,0);
INSERT INTO `weapon_skills` VALUES (68,'spinning_axe','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',5,150,0,50,2000,5,1,3,4,0,0,0);
INSERT INTO `weapon_skills` VALUES (69,'rampage','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',5,175,0,51,2000,5,1,4,0,0,0,0);
INSERT INTO `weapon_skills` VALUES (70,'calamity','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',5,200,0,52,2000,5,1,4,8,0,1,0);
INSERT INTO `weapon_skills` VALUES (71,'mistral_axe','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',5,225,0,53,2000,15,1,11,0,0,1,0);
INSERT INTO `weapon_skills` VALUES (72,'decimation','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',5,240,0,54,2000,5,1,11,5,0,1,0);
INSERT INTO `weapon_skills` VALUES (75,'bora_axe','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',5,290,0,57,2000,5,1,4,6,0,0,0);
INSERT INTO `weapon_skills` VALUES (73,'onslaught','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',5,0,0,55,2000,5,1,14,9,0,1,0);
INSERT INTO `weapon_skills` VALUES (74,'primal_rend','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',5,0,128,56,2000,5,1,9,5,0,1,23);
INSERT INTO `weapon_skills` VALUES (76,'cloudsplitter','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',5,300,64,58,2000,5,1,14,12,0,1,0);
INSERT INTO `weapon_skills` VALUES (77,'ruinator','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',5,300,0,59,2000,5,1,10,6,0,1,39);
INSERT INTO `weapon_skills` VALUES (80,'shield_break','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',6,5,0,91,2000,5,1,8,0,0,0,0);
INSERT INTO `weapon_skills` VALUES (81,'iron_tempest','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',6,40,0,92,2000,5,1,4,0,0,0,0);
INSERT INTO `weapon_skills` VALUES (82,'sturmwind','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',6,70,0,93,2000,5,1,5,4,0,0,0);
INSERT INTO `weapon_skills` VALUES (83,'armor_break','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',6,100,0,94,2000,5,1,8,0,0,0,0);
INSERT INTO `weapon_skills` VALUES (84,'keen_edge','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',6,150,0,95,2000,5,1,2,0,0,0,0);
INSERT INTO `weapon_skills` VALUES (85,'weapon_break','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',6,175,0,96,2000,5,1,8,0,0,0,0);
INSERT INTO `weapon_skills` VALUES (86,'raging_rush','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',6,200,0,97,2000,5,1,7,5,0,1,0);
INSERT INTO `weapon_skills` VALUES (87,'full_break','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',6,225,0,98,2000,5,1,10,0,0,1,0);
INSERT INTO `weapon_skills` VALUES (88,'steel_cyclone','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',6,240,0,99,2000,5,1,10,6,0,1,0);
INSERT INTO `weapon_skills` VALUES (89,'metatron_torment','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',6,0,0,100,2000,5,1,13,11,0,1,0);
INSERT INTO `weapon_skills` VALUES (90,'kings_justice','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',6,0,0,101,2000,5,1,12,4,0,1,24);
INSERT INTO `weapon_skills` VALUES (91,'fell_cleave','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',6,300,0,102,2000,5,2,8,6,4,0,0);
INSERT INTO `weapon_skills` VALUES (92,'ukkos_fury','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',6,0,0,103,2000,5,1,13,12,0,1,40);
INSERT INTO `weapon_skills` VALUES (93,'upheaval','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',6,300,0,104,2000,5,1,11,2,0,1,0);
INSERT INTO `weapon_skills` VALUES (96,'slice','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',7,5,0,61,2000,5,1,4,0,0,0,0);
INSERT INTO `weapon_skills` VALUES (97,'dark_harvest','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',7,30,255,62,2000,5,1,5,0,0,0,0);
INSERT INTO `weapon_skills` VALUES (98,'shadow_of_death','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',7,70,255,63,2000,5,1,7,5,0,0,0);
INSERT INTO `weapon_skills` VALUES (99,'nightmare_scythe','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',7,100,0,64,2000,5,1,2,4,0,0,0);
INSERT INTO `weapon_skills` VALUES (100,'spinning_scythe','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',7,125,0,65,2000,5,2,5,4,0,0,0);
INSERT INTO `weapon_skills` VALUES (101,'vorpal_scythe','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',7,150,0,66,2000,5,1,1,4,0,0,0);
INSERT INTO `weapon_skills` VALUES (102,'guillotine','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',7,200,0,67,2000,5,1,7,0,0,1,0);
INSERT INTO `weapon_skills` VALUES (103,'cross_reaper','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',7,225,0,68,2000,5,1,10,0,0,1,0);
INSERT INTO `weapon_skills` VALUES (104,'spiral_hell','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',7,240,0,69,2000,5,1,10,4,0,1,0);
INSERT INTO `weapon_skills` VALUES (105,'catastrophe','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',7,0,0,70,2000,5,1,14,9,0,1,0);
INSERT INTO `weapon_skills` VALUES (106,'insurgency','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',7,0,0,71,2000,5,1,11,2,0,1,25);
INSERT INTO `weapon_skills` VALUES (107,'infernal_scythe','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',7,300,255,72,2000,5,1,2,5,0,0,0);
INSERT INTO `weapon_skills` VALUES (108,'quietus','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',7,0,0,73,2000,5,1,14,10,0,1,41);
INSERT INTO `weapon_skills` VALUES (109,'entropy','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',7,300,0,74,2000,5,1,9,5,0,1,0);
INSERT INTO `weapon_skills` VALUES (112,'double_thrust','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',8,5,0,121,2000,5,1,1,0,0,0,0);
INSERT INTO `weapon_skills` VALUES (113,'thunder_thrust','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',8,30,64,122,2000,5,1,1,8,0,0,0);
INSERT INTO `weapon_skills` VALUES (114,'raiden_thrust','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',8,70,64,123,2000,5,1,1,8,0,0,0);
INSERT INTO `weapon_skills` VALUES (115,'leg_sweep','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',8,100,0,124,2000,5,1,8,0,0,0,0);
INSERT INTO `weapon_skills` VALUES (116,'penta_thrust','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',8,150,0,125,2000,5,1,2,0,0,0,0);
INSERT INTO `weapon_skills` VALUES (117,'vorpal_thrust','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',8,175,0,126,2000,5,1,5,1,0,0,0);
INSERT INTO `weapon_skills` VALUES (118,'skewer','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',8,200,0,127,2000,5,1,1,8,0,1,0);
INSERT INTO `weapon_skills` VALUES (119,'wheeling_thrust','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',8,225,0,128,2000,5,1,11,0,0,1,0);
INSERT INTO `weapon_skills` VALUES (120,'impulse_drive','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',8,240,0,129,2000,5,1,9,7,0,1,0);
INSERT INTO `weapon_skills` VALUES (121,'geirskogul','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',8,0,0,130,2000,5,1,13,10,0,1,0);
INSERT INTO `weapon_skills` VALUES (122,'drakesbane','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',8,0,0,131,2000,5,1,11,1,0,1,26);
INSERT INTO `weapon_skills` VALUES (123,'sonic_thrust','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',8,300,0,132,2000,5,2,1,4,0,0,0);
INSERT INTO `weapon_skills` VALUES (124,'camlanns_torment','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',8,0,0,133,2000,5,1,13,12,0,1,42);
INSERT INTO `weapon_skills` VALUES (125,'stardiver','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',8,300,255,134,2000,5,1,9,1,0,1,0);
INSERT INTO `weapon_skills` VALUES (128,'blade_rin','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',9,5,0,151,2000,5,1,1,0,0,0,0);
INSERT INTO `weapon_skills` VALUES (129,'blade_retsu','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',9,30,0,152,2000,5,1,4,0,0,0,0);
INSERT INTO `weapon_skills` VALUES (130,'blade_teki','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',9,70,8,153,2000,5,1,5,0,0,0,0);
INSERT INTO `weapon_skills` VALUES (131,'blade_to','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',9,100,32,154,2000,5,1,7,6,0,0,0);
INSERT INTO `weapon_skills` VALUES (132,'blade_chi','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',9,150,4,155,2000,5,1,1,8,0,0,0);
INSERT INTO `weapon_skills` VALUES (133,'blade_ei','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',9,175,255,156,2000,5,1,2,0,0,0,0);
INSERT INTO `weapon_skills` VALUES (134,'blade_jin','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',9,200,0,157,2000,5,1,6,8,0,1,0);
INSERT INTO `weapon_skills` VALUES (135,'blade_ten','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',9,225,0,158,2000,5,1,9,0,0,1,0);
INSERT INTO `weapon_skills` VALUES (136,'blade_ku','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',9,250,0,159,2000,5,1,9,1,0,1,0);
INSERT INTO `weapon_skills` VALUES (139,'blade_yu','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',9,290,8,162,2000,5,1,5,4,0,1,0);
INSERT INTO `weapon_skills` VALUES (137,'blade_metsu','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',9,0,0,160,2000,5,1,14,12,0,1,0);
INSERT INTO `weapon_skills` VALUES (138,'blade_kamu','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',9,0,0,161,2000,5,1,12,2,0,1,27);
INSERT INTO `weapon_skills` VALUES (140,'blade_hi','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',9,0,0,163,2000,5,1,14,9,0,1,43);
INSERT INTO `weapon_skills` VALUES (141,'blade_shun','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',9,300,0,164,2000,5,1,11,8,0,1,0);
INSERT INTO `weapon_skills` VALUES (144,'tachi_enpi','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',10,5,0,166,2000,5,1,1,4,0,0,0);
INSERT INTO `weapon_skills` VALUES (145,'tachi_hobaku','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',10,30,0,167,2000,5,1,7,0,0,0,0);
INSERT INTO `weapon_skills` VALUES (146,'tachi_goten','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',10,70,64,168,2000,5,1,1,8,0,0,0);
INSERT INTO `weapon_skills` VALUES (147,'tachi_kagero','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',10,100,2,169,2000,5,1,3,0,0,0,0);
INSERT INTO `weapon_skills` VALUES (148,'tachi_jinpu','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',10,150,16,170,2000,5,1,4,6,0,0,0);
INSERT INTO `weapon_skills` VALUES (149,'tachi_koki','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',10,175,128,171,2000,5,1,5,8,0,0,0);
INSERT INTO `weapon_skills` VALUES (150,'tachi_yukikaze','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',10,200,0,172,2000,5,1,7,6,0,1,0);
INSERT INTO `weapon_skills` VALUES (151,'tachi_gekko','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',10,225,0,173,2000,5,1,10,5,0,1,0);
INSERT INTO `weapon_skills` VALUES (152,'tachi_kasha','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',10,250,0,174,2000,5,1,11,2,0,1,0);
INSERT INTO `weapon_skills` VALUES (153,'tachi_kaiten','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',10,0,0,175,2000,5,1,13,12,0,1,0);
INSERT INTO `weapon_skills` VALUES (154,'tachi_rana','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',10,0,0,176,2000,5,1,9,7,0,1,28);
INSERT INTO `weapon_skills` VALUES (155,'tachi_ageha','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',10,300,0,177,2000,5,1,2,4,0,0,0);
INSERT INTO `weapon_skills` VALUES (156,'tachi_fudo','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',10,0,0,178,2000,5,1,13,10,0,1,44);
INSERT INTO `weapon_skills` VALUES (157,'tachi_shoha','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',10,300,0,179,2000,5,1,12,2,0,1,0);
INSERT INTO `weapon_skills` VALUES (160,'shining_strike','\0\0',11,5,128,76,2000,5,1,8,0,0,0,0);
INSERT INTO `weapon_skills` VALUES (161,'seraph_strike','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',11,40,128,77,2000,5,1,8,0,0,0,0);
INSERT INTO `weapon_skills` VALUES (162,'brainshaker','\0\0',11,70,0,78,2000,5,1,5,0,0,0,0);
INSERT INTO `weapon_skills` VALUES (163,'starlight','\0\0',11,100,0,79,2000,5,1,0,0,0,0,0);
INSERT INTO `weapon_skills` VALUES (164,'moonlight','\0\0\0\0\0\0\0\0\0\0\0\0\0\0',11,125,0,80,2000,5,2,0,0,0,0,0);
INSERT INTO `weapon_skills` VALUES (165,'skullbreaker','\0\0',11,150,0,81,2000,5,1,7,5,0,0,0);
INSERT INTO `weapon_skills` VALUES (166,'true_strike','\0\0',11,175,0,82,2000,5,1,6,8,0,0,0);
INSERT INTO `weapon_skills` VALUES (167,'judgment','\0\0\0\0\0\0\0\0\0\0\0\0\0',11,200,0,83,2000,5,1,8,0,0,0,0);
INSERT INTO `weapon_skills` VALUES (168,'hexa_strike','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',11,220,0,84,2000,5,1,11,0,0,1,0);
INSERT INTO `weapon_skills` VALUES (169,'black_halo','\0\0\0\0\0\0\0\0\0\0\0\0',11,230,0,85,2000,5,1,12,2,0,1,0);
INSERT INTO `weapon_skills` VALUES (172,'flash_nova','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',11,290,128,88,2000,5,1,7,5,0,0,0);
INSERT INTO `weapon_skills` VALUES (170,'randgrith','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',11,0,0,86,2000,5,1,13,12,0,1,0);
INSERT INTO `weapon_skills` VALUES (171,'mystic_boon','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',11,0,0,87,2000,5,1,0,0,0,1,29);
INSERT INTO `weapon_skills` VALUES (173,'dagan','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',11,0,0,89,2000,5,1,0,0,0,1,45);
INSERT INTO `weapon_skills` VALUES (174,'realmrazer','\0\0\0\0\0\0\0\0\0\0\0\0',11,300,0,90,2000,5,1,11,8,0,1,0);
INSERT INTO `weapon_skills` VALUES (176,'heavy_swing','\0\0\0\0\0\0\0\0\0\0\0\0',12,5,0,136,2000,5,1,8,0,0,0,0);
INSERT INTO `weapon_skills` VALUES (177,'rock_crusher','\0\0\0\0\0\0\0\0\0\0\0\0',12,40,4,137,2000,5,1,8,0,0,0,0);
INSERT INTO `weapon_skills` VALUES (178,'earth_crusher','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',12,70,4,138,2000,5,2,6,8,0,0,0);
INSERT INTO `weapon_skills` VALUES (179,'starburst','\0\0\0\0\0\0\0\0\0\0\0\0',12,100,255,139,2000,5,1,2,5,0,0,0);
INSERT INTO `weapon_skills` VALUES (180,'sunburst','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',12,150,0,140,2000,5,1,2,5,0,0,0);
INSERT INTO `weapon_skills` VALUES (181,'shell_crusher','\0\0\0\0\0\0\0\0\0\0\0\0',12,175,0,141,2000,5,1,6,0,0,0,0);
INSERT INTO `weapon_skills` VALUES (182,'full_swing','\0\0\0\0\0\0\0\0\0\0\0\0',12,200,0,142,2000,5,1,3,8,0,0,0);
INSERT INTO `weapon_skills` VALUES (183,'spirit_taker','\0\0\0\0\0\0\0\0\0\0\0\0',12,215,0,143,2000,5,1,0,0,0,0,0);
INSERT INTO `weapon_skills` VALUES (184,'retribution','\0\0\0\0\0\0\0\0\0\0\0\0',12,230,0,144,2000,5,1,9,5,0,1,0);
INSERT INTO `weapon_skills` VALUES (240,'tartarus_torpor','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',12,240,0,149,2000,10,2,0,0,0,0,0);
INSERT INTO `weapon_skills` VALUES (189,'cataclysm','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',12,290,255,231,2000,5,2,2,5,0,0,0);
INSERT INTO `weapon_skills` VALUES (185,'gate_of_tartarus','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',12,0,0,145,2000,5,1,14,10,0,1,0);
INSERT INTO `weapon_skills` VALUES (186,'vidohunir','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',12,0,0,146,2000,5,1,12,10,0,1,30);
INSERT INTO `weapon_skills` VALUES (187,'garland_of_bliss','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',12,0,0,147,2000,5,1,11,5,0,1,31);
INSERT INTO `weapon_skills` VALUES (188,'omniscience','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',12,0,0,148,2000,5,1,9,1,0,1,32);
INSERT INTO `weapon_skills` VALUES (190,'myrkr','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',12,0,0,150,2000,5,1,0,0,0,1,46);
INSERT INTO `weapon_skills` VALUES (191,'shattersoul','\0\0\0\0\0\0\0\0\0\0\0\0',12,300,0,239,2000,5,1,9,7,0,1,0);
INSERT INTO `weapon_skills` VALUES (192,'flaming_arrow','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',25,5,2,191,2000,16,1,3,1,0,0,0);
INSERT INTO `weapon_skills` VALUES (193,'piercing_arrow','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',25,40,0,192,2000,16,1,5,1,0,0,0);
INSERT INTO `weapon_skills` VALUES (194,'dulling_arrow','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',25,80,0,193,2000,16,1,3,1,0,0,0);
INSERT INTO `weapon_skills` VALUES (196,'sidewinder','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',25,175,0,195,2000,16,1,5,1,6,0,0);
INSERT INTO `weapon_skills` VALUES (197,'blast_arrow','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',25,200,0,219,2000,18,1,7,1,0,1,0);
INSERT INTO `weapon_skills` VALUES (198,'arching_arrow','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',25,225,0,220,2000,16,1,11,0,0,1,0);
INSERT INTO `weapon_skills` VALUES (199,'empyreal_arrow','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',25,250,0,221,2000,18,1,11,1,0,1,0);
INSERT INTO `weapon_skills` VALUES (201,'refulgent_arrow','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',25,290,0,232,2000,16,1,5,1,0,0,0);
INSERT INTO `weapon_skills` VALUES (200,'namas_arrow','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',25,0,0,225,2000,16,1,13,10,0,1,0);
INSERT INTO `weapon_skills` VALUES (202,'jishnus_radiance','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',25,0,0,234,2000,16,1,13,11,0,1,47);
INSERT INTO `weapon_skills` VALUES (203,'apex_arrow','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',25,300,0,240,2000,16,1,12,1,0,1,0);
INSERT INTO `weapon_skills` VALUES (208,'hot_shot','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',26,5,2,196,2000,16,1,3,1,0,0,0);
INSERT INTO `weapon_skills` VALUES (209,'split_shot','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',26,40,0,197,2000,16,1,5,1,0,0,0);
INSERT INTO `weapon_skills` VALUES (210,'sniper_shot','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',26,80,0,198,2000,16,1,3,1,0,0,0);
INSERT INTO `weapon_skills` VALUES (212,'slug_shot','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',26,175,0,200,2000,16,1,5,1,6,0,0);
INSERT INTO `weapon_skills` VALUES (213,'blast_shot','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',26,200,0,222,2000,18,1,7,1,0,1,0);
INSERT INTO `weapon_skills` VALUES (214,'heavy_shot','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',26,225,0,223,2000,16,1,11,0,0,1,0);
INSERT INTO `weapon_skills` VALUES (215,'detonator','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',26,250,0,224,2000,18,1,11,1,0,1,0);
INSERT INTO `weapon_skills` VALUES (219,'numbing_shot','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',26,290,0,229,2000,7,1,8,6,0,0,0);
INSERT INTO `weapon_skills` VALUES (216,'coronach','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',26,0,0,226,2000,16,1,14,12,0,1,0);
INSERT INTO `weapon_skills` VALUES (217,'trueflight','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',26,0,128,227,2000,16,1,12,4,0,1,33);
INSERT INTO `weapon_skills` VALUES (218,'leaden_salute','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',26,0,255,228,2000,16,1,9,1,0,1,34);
INSERT INTO `weapon_skills` VALUES (220,'wildfire','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',26,0,2,235,2000,16,1,14,9,0,1,48);
INSERT INTO `weapon_skills` VALUES (221,'last_stand','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',26,300,0,241,2000,16,1,11,5,0,1,0);
/*!40000 ALTER TABLE `weapon_skills` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-08-17 20:07:23
