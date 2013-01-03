/*
Navicat MySQL Data Transfer

Source Server         : DarkStar
Source Server Version : 50515
Source Host           : localhost:3306
Source Database       : dspdb

Target Server Type    : MYSQL
Target Server Version : 50515
File Encoding         : 65001

Date: 2011-10-28 20:17:52
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `bcnm_instance`
-- ----------------------------
DROP TABLE IF EXISTS `bcnm_instance`;
CREATE TABLE `bcnm_instance` (
  `bcnmId` smallint(5) unsigned NOT NULL,
  `instanceNumber` tinyint(3),
  `monsterId` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=56;

-- ----------------------------
-- Records of instance
-- ----------------------------
-- Horlais Peak
INSERT INTO `bcnm_instance` VALUES ('0', '1', '17346561');
INSERT INTO `bcnm_instance` VALUES ('0', '1', '17346562');
INSERT INTO `bcnm_instance` VALUES ('0', '2', '17346563');
INSERT INTO `bcnm_instance` VALUES ('0', '2', '17346564');
INSERT INTO `bcnm_instance` VALUES ('0', '3', '17346565');
INSERT INTO `bcnm_instance` VALUES ('0', '3', '17346566');
INSERT INTO `bcnm_instance` VALUES ('5', '1', '17346585');
INSERT INTO `bcnm_instance` VALUES ('5', '2', '17346586');
INSERT INTO `bcnm_instance` VALUES ('5', '3', '17346587');
INSERT INTO `bcnm_instance` VALUES ('6', '1', '17346588');
INSERT INTO `bcnm_instance` VALUES ('6', '2', '17346589');
INSERT INTO `bcnm_instance` VALUES ('6', '3', '17346590');
INSERT INTO `bcnm_instance` VALUES ('7', '1', '17346591');
INSERT INTO `bcnm_instance` VALUES ('7', '2', '17346592');
INSERT INTO `bcnm_instance` VALUES ('7', '3', '17346593');
INSERT INTO `bcnm_instance` VALUES ('11', '1', '17346717');
INSERT INTO `bcnm_instance` VALUES ('11', '2', '17346719');
INSERT INTO `bcnm_instance` VALUES ('11', '3', '17346721');
INSERT INTO `bcnm_instance` VALUES ('15', '1', '17346735');
INSERT INTO `bcnm_instance` VALUES ('15', '1', '17346736');
INSERT INTO `bcnm_instance` VALUES ('15', '2', '17346738');
INSERT INTO `bcnm_instance` VALUES ('15', '2', '17346739');
INSERT INTO `bcnm_instance` VALUES ('15', '3', '17346741');
INSERT INTO `bcnm_instance` VALUES ('15', '3', '17346742');
INSERT INTO `bcnm_instance` VALUES ('17', '1', '17346750');
INSERT INTO `bcnm_instance` VALUES ('17', '2', '17346752');
INSERT INTO `bcnm_instance` VALUES ('17', '3', '17346754');

-- Ghelsba Outpost
INSERT INTO `bcnm_instance` VALUES ('32', '1', '17350662');
INSERT INTO `bcnm_instance` VALUES ('32', '1', '17350663');
INSERT INTO `bcnm_instance` VALUES ('32', '1', '17350664');
INSERT INTO `bcnm_instance` VALUES ('33', '1', '17350928');
INSERT INTO `bcnm_instance` VALUES ('34', '1', '17350929');
INSERT INTO `bcnm_instance` VALUES ('34', '1', '17350930');
INSERT INTO `bcnm_instance` VALUES ('34', '1', '17350931');
INSERT INTO `bcnm_instance` VALUES ('35', '1', '17350934');
INSERT INTO `bcnm_instance` VALUES ('35', '1', '17350933');
INSERT INTO `bcnm_instance` VALUES ('36', '1', '17350936');
INSERT INTO `bcnm_instance` VALUES ('36', '1', '17350937');
INSERT INTO `bcnm_instance` VALUES ('36', '1', '17350938');
INSERT INTO `bcnm_instance` VALUES ('36', '1', '17350939');

-- Waughroon Shrine
INSERT INTO `bcnm_instance` VALUES ('64', '1', '17367041');
INSERT INTO `bcnm_instance` VALUES ('64', '1', '17367042');
INSERT INTO `bcnm_instance` VALUES ('64', '2', '17367043');
INSERT INTO `bcnm_instance` VALUES ('64', '2', '17367044');
INSERT INTO `bcnm_instance` VALUES ('64', '3', '17367045');
INSERT INTO `bcnm_instance` VALUES ('64', '3', '17367046');
INSERT INTO `bcnm_instance` VALUES ('68', '1', '17367059');
INSERT INTO `bcnm_instance` VALUES ('68', '1', '17367060');
INSERT INTO `bcnm_instance` VALUES ('68', '1', '17367061');
INSERT INTO `bcnm_instance` VALUES ('68', '1', '17367062');
INSERT INTO `bcnm_instance` VALUES ('68', '2', '17367064');
INSERT INTO `bcnm_instance` VALUES ('68', '2', '17367065');
INSERT INTO `bcnm_instance` VALUES ('68', '2', '17367066');
INSERT INTO `bcnm_instance` VALUES ('68', '2', '17367067');
INSERT INTO `bcnm_instance` VALUES ('68', '3', '17367069');
INSERT INTO `bcnm_instance` VALUES ('68', '3', '17367070');
INSERT INTO `bcnm_instance` VALUES ('68', '3', '17367071');
INSERT INTO `bcnm_instance` VALUES ('68', '3', '17367072');
INSERT INTO `bcnm_instance` VALUES ('70', '1', '17367074');
INSERT INTO `bcnm_instance` VALUES ('70', '2', '17367075');
INSERT INTO `bcnm_instance` VALUES ('70', '3', '17367076');
INSERT INTO `bcnm_instance` VALUES ('71', '1', '17367077');
INSERT INTO `bcnm_instance` VALUES ('71', '2', '17367078');
INSERT INTO `bcnm_instance` VALUES ('71', '3', '17367079');
INSERT INTO `bcnm_instance` VALUES ('72', '1', '17367080');
INSERT INTO `bcnm_instance` VALUES ('72', '1', '17367081');
INSERT INTO `bcnm_instance` VALUES ('72', '2', '17367082');
INSERT INTO `bcnm_instance` VALUES ('72', '2', '17367083');
INSERT INTO `bcnm_instance` VALUES ('72', '3', '17367084');
INSERT INTO `bcnm_instance` VALUES ('72', '3', '17367085');
INSERT INTO `bcnm_instance` VALUES ('81', '1', '17367266');
INSERT INTO `bcnm_instance` VALUES ('81', '1', '17367267');
INSERT INTO `bcnm_instance` VALUES ('81', '1', '17367268');
INSERT INTO `bcnm_instance` VALUES ('81', '1', '17367269');
INSERT INTO `bcnm_instance` VALUES ('81', '1', '17367270');
INSERT INTO `bcnm_instance` VALUES ('81', '1', '17367271');
INSERT INTO `bcnm_instance` VALUES ('81', '2', '17367272');
INSERT INTO `bcnm_instance` VALUES ('81', '2', '17367273');
INSERT INTO `bcnm_instance` VALUES ('81', '2', '17367274');
INSERT INTO `bcnm_instance` VALUES ('81', '2', '17367275');
INSERT INTO `bcnm_instance` VALUES ('81', '2', '17367276');
INSERT INTO `bcnm_instance` VALUES ('81', '2', '17367277');
INSERT INTO `bcnm_instance` VALUES ('81', '3', '17367278');
INSERT INTO `bcnm_instance` VALUES ('81', '3', '17367279');
INSERT INTO `bcnm_instance` VALUES ('81', '3', '17367280');
INSERT INTO `bcnm_instance` VALUES ('81', '3', '17367281');
INSERT INTO `bcnm_instance` VALUES ('81', '3', '17367282');
INSERT INTO `bcnm_instance` VALUES ('81', '3', '17367283');
INSERT INTO `bcnm_instance` VALUES ('76', '1', '17367230');
INSERT INTO `bcnm_instance` VALUES ('76', '2', '17367232');
INSERT INTO `bcnm_instance` VALUES ('76', '3', '17367234');
INSERT INTO `bcnm_instance` VALUES ('79', '1', '17367242');
INSERT INTO `bcnm_instance` VALUES ('79', '2', '17367244');
INSERT INTO `bcnm_instance` VALUES ('79', '3', '17367246');
INSERT INTO `bcnm_instance` VALUES ('82', '1', '17367287');
INSERT INTO `bcnm_instance` VALUES ('82', '1', '17367288');
INSERT INTO `bcnm_instance` VALUES ('82', '1', '17367289');
INSERT INTO `bcnm_instance` VALUES ('82', '1', '17367290');
INSERT INTO `bcnm_instance` VALUES ('82', '2', '17367292');
INSERT INTO `bcnm_instance` VALUES ('82', '2', '17367293');
INSERT INTO `bcnm_instance` VALUES ('82', '2', '17367294');
INSERT INTO `bcnm_instance` VALUES ('82', '2', '17367295');
INSERT INTO `bcnm_instance` VALUES ('82', '3', '17367297');
INSERT INTO `bcnm_instance` VALUES ('82', '3', '17367298');
INSERT INTO `bcnm_instance` VALUES ('82', '3', '17367299');
INSERT INTO `bcnm_instance` VALUES ('82', '3', '17367300');

-- Balga's Dais
INSERT INTO `bcnm_instance` VALUES ('96', '1', '17375233');
INSERT INTO `bcnm_instance` VALUES ('96', '1', '17375234');
INSERT INTO `bcnm_instance` VALUES ('96', '2', '17375235');
INSERT INTO `bcnm_instance` VALUES ('96', '2', '17375236');
INSERT INTO `bcnm_instance` VALUES ('96', '3', '17375237');
INSERT INTO `bcnm_instance` VALUES ('96', '3', '17375238');
INSERT INTO `bcnm_instance` VALUES ('101', '1', '17375257');
INSERT INTO `bcnm_instance` VALUES ('101', '2', '17375258');
INSERT INTO `bcnm_instance` VALUES ('101', '3', '17375259');
INSERT INTO `bcnm_instance` VALUES ('102', '1', '17375260');
INSERT INTO `bcnm_instance` VALUES ('102', '2', '17375261');
INSERT INTO `bcnm_instance` VALUES ('102', '3', '17375262');
INSERT INTO `bcnm_instance` VALUES ('103', '1', '17375263');
INSERT INTO `bcnm_instance` VALUES ('103', '1', '17375264');
INSERT INTO `bcnm_instance` VALUES ('103', '2', '17375265');
INSERT INTO `bcnm_instance` VALUES ('103', '2', '17375266');
INSERT INTO `bcnm_instance` VALUES ('103', '3', '17375267');
INSERT INTO `bcnm_instance` VALUES ('103', '3', '17375268');
INSERT INTO `bcnm_instance` VALUES ('105', '1', '17375270');
INSERT INTO `bcnm_instance` VALUES ('105', '2', '17375274');
INSERT INTO `bcnm_instance` VALUES ('105', '3', '17375278');
INSERT INTO `bcnm_instance` VALUES ('105', '1', '17375271');
INSERT INTO `bcnm_instance` VALUES ('105', '2', '17375275');
INSERT INTO `bcnm_instance` VALUES ('105', '3', '17375279');
INSERT INTO `bcnm_instance` VALUES ('105', '1', '17375269'); 
INSERT INTO `bcnm_instance` VALUES ('105', '2', '17375273'); 
INSERT INTO `bcnm_instance` VALUES ('105', '3', '17375277'); 
INSERT INTO `bcnm_instance` VALUES ('107', '1', '17375386');
INSERT INTO `bcnm_instance` VALUES ('107', '2', '17375388');
INSERT INTO `bcnm_instance` VALUES ('107', '3', '17375390');

-- Sacrificial Chamber
INSERT INTO `bcnm_instance` VALUES ('128', '1', '17444865');
INSERT INTO `bcnm_instance` VALUES ('128', '1', '17444866');
INSERT INTO `bcnm_instance` VALUES ('128', '1', '17444867');
INSERT INTO `bcnm_instance` VALUES ('128', '2', '17444870');
INSERT INTO `bcnm_instance` VALUES ('128', '2', '17444871');
INSERT INTO `bcnm_instance` VALUES ('128', '2', '17444872');
INSERT INTO `bcnm_instance` VALUES ('128', '3', '17444875');
INSERT INTO `bcnm_instance` VALUES ('128', '3', '17444876');
INSERT INTO `bcnm_instance` VALUES ('128', '3', '17444877');

-- Throne Room
INSERT INTO `bcnm_instance` VALUES ('160', '1', '17453057');
INSERT INTO `bcnm_instance` VALUES ('160', '1', '17453060');
INSERT INTO `bcnm_instance` VALUES ('160', '2', '17453058');
INSERT INTO `bcnm_instance` VALUES ('160', '2', '17453061');
INSERT INTO `bcnm_instance` VALUES ('160', '3', '17453059');
INSERT INTO `bcnm_instance` VALUES ('160', '3', '17453062');

-- Chamber of Oracles
INSERT INTO `bcnm_instance` VALUES ('192', '1', '17465345');
INSERT INTO `bcnm_instance` VALUES ('192', '1', '17465346');
INSERT INTO `bcnm_instance` VALUES ('192', '1', '17465347');
INSERT INTO `bcnm_instance` VALUES ('192', '2', '17465348');
INSERT INTO `bcnm_instance` VALUES ('192', '2', '17465349');
INSERT INTO `bcnm_instance` VALUES ('192', '2', '17465350');
INSERT INTO `bcnm_instance` VALUES ('192', '3', '17465351');
INSERT INTO `bcnm_instance` VALUES ('192', '3', '17465352');
INSERT INTO `bcnm_instance` VALUES ('192', '3', '17465353');
INSERT INTO `bcnm_instance` VALUES ('194', '1', '17465354');
INSERT INTO `bcnm_instance` VALUES ('194', '2', '17465355');
INSERT INTO `bcnm_instance` VALUES ('194', '3', '17465356');
INSERT INTO `bcnm_instance` VALUES ('195', '1', '17465357');
INSERT INTO `bcnm_instance` VALUES ('195', '2', '17465358');
INSERT INTO `bcnm_instance` VALUES ('195', '3', '17465359');
INSERT INTO `bcnm_instance` VALUES ('196', '1', '17465360');
INSERT INTO `bcnm_instance` VALUES ('196', '1', '17465361');
INSERT INTO `bcnm_instance` VALUES ('196', '2', '17465362');
INSERT INTO `bcnm_instance` VALUES ('196', '2', '17465363');
INSERT INTO `bcnm_instance` VALUES ('196', '3', '17465364');
INSERT INTO `bcnm_instance` VALUES ('196', '3', '17465365');

-- Full Moon Fountain
INSERT INTO `bcnm_instance` VALUES ('224', '1', '17473537');
INSERT INTO `bcnm_instance` VALUES ('224', '2', '17473538');
INSERT INTO `bcnm_instance` VALUES ('224', '3', '17473539');

-- Stellar Fulcrum
INSERT INTO `bcnm_instance` VALUES ('256', '1', '17510401');
INSERT INTO `bcnm_instance` VALUES ('256', '2', '17510402');
INSERT INTO `bcnm_instance` VALUES ('256', '3', '17510403');

-- Cloister of Gales
INSERT INTO `bcnm_instance` VALUES ('416', '1', '17600513');
INSERT INTO `bcnm_instance` VALUES ('416', '2', '17600514');
INSERT INTO `bcnm_instance` VALUES ('416', '3', '17600515');
INSERT INTO `bcnm_instance` VALUES ('418', '1', '17600519');
INSERT INTO `bcnm_instance` VALUES ('418', '2', '17600520');
INSERT INTO `bcnm_instance` VALUES ('418', '3', '17600521');

-- Cloister of Storms
INSERT INTO `bcnm_instance` VALUES ('448', '1', '17604609');
INSERT INTO `bcnm_instance` VALUES ('448', '2', '17604610');
INSERT INTO `bcnm_instance` VALUES ('448', '3', '17604611');
INSERT INTO `bcnm_instance` VALUES ('450', '1', '17604618');
INSERT INTO `bcnm_instance` VALUES ('450', '2', '17604619');
INSERT INTO `bcnm_instance` VALUES ('450', '3', '17604620');

-- Cloister of Frost
INSERT INTO `bcnm_instance` VALUES ('480', '1', '17608705');
INSERT INTO `bcnm_instance` VALUES ('480', '2', '17608706');
INSERT INTO `bcnm_instance` VALUES ('480', '3', '17608707');
INSERT INTO `bcnm_instance` VALUES ('482', '1', '17608726');
INSERT INTO `bcnm_instance` VALUES ('482', '2', '17608727');
INSERT INTO `bcnm_instance` VALUES ('482', '3', '17608728');

-- Qu'Bia Arena
INSERT INTO `bcnm_instance` VALUES ('512', '1', '17621007');
INSERT INTO `bcnm_instance` VALUES ('512', '1', '17621008');
INSERT INTO `bcnm_instance` VALUES ('512', '1', '17621009');
INSERT INTO `bcnm_instance` VALUES ('512', '2', '17621000');
INSERT INTO `bcnm_instance` VALUES ('512', '2', '17621001');
INSERT INTO `bcnm_instance` VALUES ('512', '2', '17621002');
INSERT INTO `bcnm_instance` VALUES ('512', '3', '17621007');
INSERT INTO `bcnm_instance` VALUES ('512', '3', '17621008');
INSERT INTO `bcnm_instance` VALUES ('512', '3', '17621009');
INSERT INTO `bcnm_instance` VALUES ('517', '1', '17621056');
INSERT INTO `bcnm_instance` VALUES ('517', '2', '17621057');
INSERT INTO `bcnm_instance` VALUES ('517', '2', '17621058');
INSERT INTO `bcnm_instance` VALUES ('518', '1', '17621059');
INSERT INTO `bcnm_instance` VALUES ('518', '2', '17621060');
INSERT INTO `bcnm_instance` VALUES ('518', '3', '17621061');
INSERT INTO `bcnm_instance` VALUES ('519', '1', '17621062');
INSERT INTO `bcnm_instance` VALUES ('519', '2', '17621063');
INSERT INTO `bcnm_instance` VALUES ('519', '3', '17621064');

-- Cloister of Flames
INSERT INTO `bcnm_instance` VALUES ('544', '1', '17625089');
INSERT INTO `bcnm_instance` VALUES ('544', '2', '17625090');
INSERT INTO `bcnm_instance` VALUES ('544', '3', '17625091');
INSERT INTO `bcnm_instance` VALUES ('545', '1', '17625092');
INSERT INTO `bcnm_instance` VALUES ('545', '2', '17625093');
INSERT INTO `bcnm_instance` VALUES ('545', '3', '17625094');

-- Cloister of Tremors
INSERT INTO `bcnm_instance` VALUES ('576', '1', '17633281');
INSERT INTO `bcnm_instance` VALUES ('576', '2', '17633282');
INSERT INTO `bcnm_instance` VALUES ('576', '3', '17633283');
INSERT INTO `bcnm_instance` VALUES ('578', '1', '17633287');
INSERT INTO `bcnm_instance` VALUES ('578', '2', '17633288');
INSERT INTO `bcnm_instance` VALUES ('578', '3', '17633289');

-- Cloister of Tides
INSERT INTO `bcnm_instance` VALUES ('608', '1', '17641473');
INSERT INTO `bcnm_instance` VALUES ('608', '2', '17641474');
INSERT INTO `bcnm_instance` VALUES ('608', '3', '17641475');
INSERT INTO `bcnm_instance` VALUES ('609', '1', '17641476');
INSERT INTO `bcnm_instance` VALUES ('609', '2', '17641477');
INSERT INTO `bcnm_instance` VALUES ('609', '3', '17641478');

-- LaLoff Amphitheater
INSERT INTO `bcnm_instance` VALUES ('293', '1', '17514497'); -- hume 		-- DM 1
INSERT INTO `bcnm_instance` VALUES ('293', '1', '17514500'); -- mithra
INSERT INTO `bcnm_instance` VALUES ('293', '1', '17514509'); -- elvaan
INSERT INTO `bcnm_instance` VALUES ('293', '1', '17514512'); -- taru
INSERT INTO `bcnm_instance` VALUES ('293', '1', '17514515'); -- galka
INSERT INTO `bcnm_instance` VALUES ('293', '1', '17514518');
INSERT INTO `bcnm_instance` VALUES ('293', '1', '17514503');
INSERT INTO `bcnm_instance` VALUES ('293', '2', '17514498'); -- hume 		-- DM 2
INSERT INTO `bcnm_instance` VALUES ('293', '2', '17514501'); -- mithra
INSERT INTO `bcnm_instance` VALUES ('293', '2', '17514504'); -- elvaan
INSERT INTO `bcnm_instance` VALUES ('293', '2', '17514510'); -- taru
INSERT INTO `bcnm_instance` VALUES ('293', '2', '17514513'); -- galka
INSERT INTO `bcnm_instance` VALUES ('293', '2', '17514516');
INSERT INTO `bcnm_instance` VALUES ('293', '2', '17514519');
INSERT INTO `bcnm_instance` VALUES ('293', '3', '17514499'); -- hume 		-- DM 3
INSERT INTO `bcnm_instance` VALUES ('293', '3', '17514502'); -- mithra
INSERT INTO `bcnm_instance` VALUES ('293', '3', '17514505'); -- elvaan
INSERT INTO `bcnm_instance` VALUES ('293', '3', '17514511'); -- taru
INSERT INTO `bcnm_instance` VALUES ('293', '3', '17514514'); -- galka
INSERT INTO `bcnm_instance` VALUES ('293', '3', '17514517');
INSERT INTO `bcnm_instance` VALUES ('293', '3', '17514520');

-- Dynamis 
-- instanceNumber 1: spawn statue when player register the dynamis
-- instanceNumber 2: spawn statue when the mega boss is defeated
INSERT INTO `bcnm_instance` VALUES ('1280', '1', '17539350');
INSERT INTO `bcnm_instance` VALUES ('1280', '1', '17539351');
INSERT INTO `bcnm_instance` VALUES ('1280', '1', '17539352');
INSERT INTO `bcnm_instance` VALUES ('1280', '1', '17539353');
INSERT INTO `bcnm_instance` VALUES ('1280', '1', '17539354');
INSERT INTO `bcnm_instance` VALUES ('1280', '1', '17539355');
INSERT INTO `bcnm_instance` VALUES ('1280', '1', '17539356');
INSERT INTO `bcnm_instance` VALUES ('1280', '1', '17539357');
INSERT INTO `bcnm_instance` VALUES ('1280', '1', '17539358');
INSERT INTO `bcnm_instance` VALUES ('1280', '1', '17539359');
INSERT INTO `bcnm_instance` VALUES ('1280', '1', '17539360');
INSERT INTO `bcnm_instance` VALUES ('1280', '1', '17539361');
INSERT INTO `bcnm_instance` VALUES ('1280', '1', '17539362');
INSERT INTO `bcnm_instance` VALUES ('1280', '1', '17539363');
INSERT INTO `bcnm_instance` VALUES ('1280', '1', '17539364');
INSERT INTO `bcnm_instance` VALUES ('1280', '1', '17539365');
INSERT INTO `bcnm_instance` VALUES ('1280', '1', '17539366');
INSERT INTO `bcnm_instance` VALUES ('1280', '1', '17539367');
INSERT INTO `bcnm_instance` VALUES ('1280', '1', '17539368');
INSERT INTO `bcnm_instance` VALUES ('1280', '1', '17539369');
INSERT INTO `bcnm_instance` VALUES ('1280', '1', '17539370');
INSERT INTO `bcnm_instance` VALUES ('1280', '1', '17539371');
INSERT INTO `bcnm_instance` VALUES ('1280', '1', '17539372');
INSERT INTO `bcnm_instance` VALUES ('1280', '1', '17539373');
INSERT INTO `bcnm_instance` VALUES ('1280', '1', '17539374');
INSERT INTO `bcnm_instance` VALUES ('1280', '1', '17539375');
INSERT INTO `bcnm_instance` VALUES ('1280', '1', '17539376');
INSERT INTO `bcnm_instance` VALUES ('1280', '1', '17539377');
INSERT INTO `bcnm_instance` VALUES ('1280', '1', '17539378');
INSERT INTO `bcnm_instance` VALUES ('1280', '1', '17539379');
INSERT INTO `bcnm_instance` VALUES ('1280', '1', '17539380');
INSERT INTO `bcnm_instance` VALUES ('1280', '1', '17539381');
INSERT INTO `bcnm_instance` VALUES ('1280', '1', '17539382');
INSERT INTO `bcnm_instance` VALUES ('1280', '1', '17539383');
INSERT INTO `bcnm_instance` VALUES ('1280', '1', '17539384');
INSERT INTO `bcnm_instance` VALUES ('1280', '1', '17539385');
INSERT INTO `bcnm_instance` VALUES ('1280', '1', '17539386');
INSERT INTO `bcnm_instance` VALUES ('1280', '1', '17539387');
INSERT INTO `bcnm_instance` VALUES ('1280', '1', '17539388');
INSERT INTO `bcnm_instance` VALUES ('1280', '1', '17539389');
INSERT INTO `bcnm_instance` VALUES ('1280', '1', '17539390');
INSERT INTO `bcnm_instance` VALUES ('1280', '1', '17539391');
INSERT INTO `bcnm_instance` VALUES ('1280', '1', '17539392');
INSERT INTO `bcnm_instance` VALUES ('1280', '1', '17539393');
INSERT INTO `bcnm_instance` VALUES ('1280', '1', '17539394');
INSERT INTO `bcnm_instance` VALUES ('1280', '1', '17539395');
INSERT INTO `bcnm_instance` VALUES ('1280', '1', '17539396');
INSERT INTO `bcnm_instance` VALUES ('1280', '1', '17539397');
INSERT INTO `bcnm_instance` VALUES ('1280', '1', '17539398');
INSERT INTO `bcnm_instance` VALUES ('1280', '1', '17539399');
INSERT INTO `bcnm_instance` VALUES ('1280', '1', '17539400');
INSERT INTO `bcnm_instance` VALUES ('1280', '1', '17539401');
INSERT INTO `bcnm_instance` VALUES ('1280', '1', '17539402');
INSERT INTO `bcnm_instance` VALUES ('1280', '1', '17539403');
INSERT INTO `bcnm_instance` VALUES ('1280', '1', '17539404');
INSERT INTO `bcnm_instance` VALUES ('1280', '1', '17539405');
INSERT INTO `bcnm_instance` VALUES ('1280', '1', '17539406');
INSERT INTO `bcnm_instance` VALUES ('1280', '1', '17539407');
INSERT INTO `bcnm_instance` VALUES ('1280', '1', '17539408');
INSERT INTO `bcnm_instance` VALUES ('1280', '1', '17539409');
INSERT INTO `bcnm_instance` VALUES ('1280', '1', '17539410');
INSERT INTO `bcnm_instance` VALUES ('1280', '1', '17539411');
INSERT INTO `bcnm_instance` VALUES ('1280', '1', '17539412');
INSERT INTO `bcnm_instance` VALUES ('1280', '1', '17539413');
INSERT INTO `bcnm_instance` VALUES ('1280', '1', '17539414');
INSERT INTO `bcnm_instance` VALUES ('1280', '1', '17539415');
INSERT INTO `bcnm_instance` VALUES ('1280', '1', '17539416');
INSERT INTO `bcnm_instance` VALUES ('1280', '1', '17539417');
INSERT INTO `bcnm_instance` VALUES ('1280', '1', '17539418');
INSERT INTO `bcnm_instance` VALUES ('1280', '1', '17539419');
INSERT INTO `bcnm_instance` VALUES ('1280', '1', '17539420');
INSERT INTO `bcnm_instance` VALUES ('1280', '1', '17539421');
INSERT INTO `bcnm_instance` VALUES ('1280', '1', '17539422');
INSERT INTO `bcnm_instance` VALUES ('1280', '1', '17539423');
INSERT INTO `bcnm_instance` VALUES ('1280', '1', '17539424');
INSERT INTO `bcnm_instance` VALUES ('1280', '1', '17539425');
INSERT INTO `bcnm_instance` VALUES ('1280', '1', '17539426');
INSERT INTO `bcnm_instance` VALUES ('1280', '1', '17539427');
INSERT INTO `bcnm_instance` VALUES ('1280', '1', '17539428');
INSERT INTO `bcnm_instance` VALUES ('1280', '1', '17539429');
INSERT INTO `bcnm_instance` VALUES ('1280', '1', '17539430');
INSERT INTO `bcnm_instance` VALUES ('1280', '1', '17539431');
INSERT INTO `bcnm_instance` VALUES ('1280', '1', '17539432');
INSERT INTO `bcnm_instance` VALUES ('1280', '1', '17539433');
INSERT INTO `bcnm_instance` VALUES ('1280', '1', '17539434');
INSERT INTO `bcnm_instance` VALUES ('1280', '1', '17539435');
INSERT INTO `bcnm_instance` VALUES ('1280', '1', '17539436');
INSERT INTO `bcnm_instance` VALUES ('1280', '1', '17539437');
INSERT INTO `bcnm_instance` VALUES ('1280', '1', '17539438');
INSERT INTO `bcnm_instance` VALUES ('1280', '1', '17539439');
INSERT INTO `bcnm_instance` VALUES ('1280', '1', '17539440');
INSERT INTO `bcnm_instance` VALUES ('1280', '1', '17539441');
INSERT INTO `bcnm_instance` VALUES ('1280', '1', '17539442');
INSERT INTO `bcnm_instance` VALUES ('1280', '1', '17539443');
INSERT INTO `bcnm_instance` VALUES ('1280', '1', '17539444');
INSERT INTO `bcnm_instance` VALUES ('1280', '1', '17539445');
INSERT INTO `bcnm_instance` VALUES ('1280', '1', '17539446');
INSERT INTO `bcnm_instance` VALUES ('1280', '1', '17539447');
INSERT INTO `bcnm_instance` VALUES ('1280', '1', '17539448');
INSERT INTO `bcnm_instance` VALUES ('1280', '1', '17539449');
INSERT INTO `bcnm_instance` VALUES ('1280', '1', '17539450');
INSERT INTO `bcnm_instance` VALUES ('1280', '1', '17539451');
INSERT INTO `bcnm_instance` VALUES ('1280', '2', '17539452');
INSERT INTO `bcnm_instance` VALUES ('1280', '2', '17539453');
INSERT INTO `bcnm_instance` VALUES ('1280', '2', '17539454');
INSERT INTO `bcnm_instance` VALUES ('1280', '2', '17539455');
INSERT INTO `bcnm_instance` VALUES ('1280', '2', '17539456');
INSERT INTO `bcnm_instance` VALUES ('1280', '2', '17539457');
INSERT INTO `bcnm_instance` VALUES ('1280', '2', '17539458');
INSERT INTO `bcnm_instance` VALUES ('1280', '2', '17539459');
INSERT INTO `bcnm_instance` VALUES ('1280', '2', '17539460');
INSERT INTO `bcnm_instance` VALUES ('1280', '2', '17539461');
INSERT INTO `bcnm_instance` VALUES ('1280', '2', '17539462');
INSERT INTO `bcnm_instance` VALUES ('1280', '2', '17539463');
INSERT INTO `bcnm_instance` VALUES ('1280', '2', '17539464');
INSERT INTO `bcnm_instance` VALUES ('1280', '2', '17539465');
INSERT INTO `bcnm_instance` VALUES ('1280', '2', '17539466');
INSERT INTO `bcnm_instance` VALUES ('1280', '2', '17539467');
INSERT INTO `bcnm_instance` VALUES ('1280', '2', '17539468');
INSERT INTO `bcnm_instance` VALUES ('1280', '2', '17539469');
INSERT INTO `bcnm_instance` VALUES ('1280', '2', '17539470');
INSERT INTO `bcnm_instance` VALUES ('1280', '2', '17539471');
INSERT INTO `bcnm_instance` VALUES ('1280', '2', '17539472');
INSERT INTO `bcnm_instance` VALUES ('1280', '2', '17539473');
INSERT INTO `bcnm_instance` VALUES ('1280', '2', '17539474');
INSERT INTO `bcnm_instance` VALUES ('1280', '2', '17539475');
INSERT INTO `bcnm_instance` VALUES ('1280', '2', '17539476');
INSERT INTO `bcnm_instance` VALUES ('1280', '2', '17539477');
INSERT INTO `bcnm_instance` VALUES ('1280', '2', '17539478');
INSERT INTO `bcnm_instance` VALUES ('1280', '2', '17539479');
INSERT INTO `bcnm_instance` VALUES ('1280', '2', '17539480');
INSERT INTO `bcnm_instance` VALUES ('1280', '2', '17539481');
INSERT INTO `bcnm_instance` VALUES ('1280', '2', '17539482');
INSERT INTO `bcnm_instance` VALUES ('1280', '2', '17539483');
INSERT INTO `bcnm_instance` VALUES ('1281', '1', '17535250');
INSERT INTO `bcnm_instance` VALUES ('1281', '1', '17535251');
INSERT INTO `bcnm_instance` VALUES ('1281', '1', '17535252');
INSERT INTO `bcnm_instance` VALUES ('1281', '1', '17535253');
INSERT INTO `bcnm_instance` VALUES ('1281', '1', '17535254');
INSERT INTO `bcnm_instance` VALUES ('1281', '1', '17535255');
INSERT INTO `bcnm_instance` VALUES ('1281', '1', '17535256');
INSERT INTO `bcnm_instance` VALUES ('1281', '1', '17535257');
INSERT INTO `bcnm_instance` VALUES ('1281', '1', '17535258');
INSERT INTO `bcnm_instance` VALUES ('1281', '1', '17535259');
INSERT INTO `bcnm_instance` VALUES ('1281', '1', '17535260');
INSERT INTO `bcnm_instance` VALUES ('1281', '1', '17535261');
INSERT INTO `bcnm_instance` VALUES ('1281', '1', '17535262');
INSERT INTO `bcnm_instance` VALUES ('1281', '1', '17535263');
INSERT INTO `bcnm_instance` VALUES ('1281', '1', '17535264');
INSERT INTO `bcnm_instance` VALUES ('1281', '1', '17535265');
INSERT INTO `bcnm_instance` VALUES ('1281', '1', '17535266');
INSERT INTO `bcnm_instance` VALUES ('1281', '1', '17535267');
INSERT INTO `bcnm_instance` VALUES ('1281', '1', '17535268');
INSERT INTO `bcnm_instance` VALUES ('1281', '1', '17535269');
INSERT INTO `bcnm_instance` VALUES ('1281', '1', '17535270');
INSERT INTO `bcnm_instance` VALUES ('1281', '1', '17535271');
INSERT INTO `bcnm_instance` VALUES ('1281', '1', '17535272');
INSERT INTO `bcnm_instance` VALUES ('1281', '1', '17535273');
INSERT INTO `bcnm_instance` VALUES ('1281', '1', '17535274');
INSERT INTO `bcnm_instance` VALUES ('1281', '1', '17535275');
INSERT INTO `bcnm_instance` VALUES ('1281', '1', '17535276');
INSERT INTO `bcnm_instance` VALUES ('1281', '1', '17535277');
INSERT INTO `bcnm_instance` VALUES ('1281', '1', '17535278');
INSERT INTO `bcnm_instance` VALUES ('1281', '1', '17535279');
INSERT INTO `bcnm_instance` VALUES ('1281', '1', '17535280');
INSERT INTO `bcnm_instance` VALUES ('1281', '1', '17535281');
INSERT INTO `bcnm_instance` VALUES ('1281', '1', '17535282');
INSERT INTO `bcnm_instance` VALUES ('1281', '1', '17535283');
INSERT INTO `bcnm_instance` VALUES ('1281', '1', '17535284');
INSERT INTO `bcnm_instance` VALUES ('1281', '1', '17535285');
INSERT INTO `bcnm_instance` VALUES ('1281', '1', '17535286');
INSERT INTO `bcnm_instance` VALUES ('1281', '1', '17535287');
INSERT INTO `bcnm_instance` VALUES ('1281', '1', '17535288');
INSERT INTO `bcnm_instance` VALUES ('1281', '1', '17535289');
INSERT INTO `bcnm_instance` VALUES ('1281', '1', '17535290');
INSERT INTO `bcnm_instance` VALUES ('1281', '1', '17535291');
INSERT INTO `bcnm_instance` VALUES ('1281', '1', '17535292');
INSERT INTO `bcnm_instance` VALUES ('1281', '1', '17535293');
INSERT INTO `bcnm_instance` VALUES ('1281', '1', '17535294');
INSERT INTO `bcnm_instance` VALUES ('1281', '1', '17535295');
INSERT INTO `bcnm_instance` VALUES ('1281', '1', '17535296');
INSERT INTO `bcnm_instance` VALUES ('1281', '1', '17535297');
INSERT INTO `bcnm_instance` VALUES ('1281', '1', '17535298');
INSERT INTO `bcnm_instance` VALUES ('1281', '1', '17535299');
INSERT INTO `bcnm_instance` VALUES ('1281', '1', '17535300');
INSERT INTO `bcnm_instance` VALUES ('1281', '1', '17535301');
INSERT INTO `bcnm_instance` VALUES ('1281', '1', '17535302');
INSERT INTO `bcnm_instance` VALUES ('1281', '1', '17535303');
INSERT INTO `bcnm_instance` VALUES ('1281', '1', '17535304');
INSERT INTO `bcnm_instance` VALUES ('1281', '1', '17535305');
INSERT INTO `bcnm_instance` VALUES ('1281', '1', '17535306');
INSERT INTO `bcnm_instance` VALUES ('1281', '1', '17535307');
INSERT INTO `bcnm_instance` VALUES ('1281', '1', '17535308');
INSERT INTO `bcnm_instance` VALUES ('1281', '1', '17535309');
INSERT INTO `bcnm_instance` VALUES ('1281', '1', '17535310');
INSERT INTO `bcnm_instance` VALUES ('1281', '1', '17535311');
INSERT INTO `bcnm_instance` VALUES ('1281', '1', '17535312');
INSERT INTO `bcnm_instance` VALUES ('1281', '1', '17535313');
INSERT INTO `bcnm_instance` VALUES ('1281', '1', '17535314');
INSERT INTO `bcnm_instance` VALUES ('1281', '1', '17535315');
INSERT INTO `bcnm_instance` VALUES ('1281', '1', '17535316');
INSERT INTO `bcnm_instance` VALUES ('1281', '1', '17535317');
INSERT INTO `bcnm_instance` VALUES ('1281', '1', '17535318');
INSERT INTO `bcnm_instance` VALUES ('1281', '1', '17535319');
INSERT INTO `bcnm_instance` VALUES ('1281', '1', '17535320');
INSERT INTO `bcnm_instance` VALUES ('1281', '1', '17535321');
INSERT INTO `bcnm_instance` VALUES ('1281', '1', '17535322');
INSERT INTO `bcnm_instance` VALUES ('1281', '1', '17535323');
INSERT INTO `bcnm_instance` VALUES ('1281', '1', '17535324');
INSERT INTO `bcnm_instance` VALUES ('1281', '1', '17535325');
INSERT INTO `bcnm_instance` VALUES ('1281', '1', '17535326');
INSERT INTO `bcnm_instance` VALUES ('1281', '1', '17535327');
INSERT INTO `bcnm_instance` VALUES ('1281', '1', '17535328');
INSERT INTO `bcnm_instance` VALUES ('1281', '1', '17535329');
INSERT INTO `bcnm_instance` VALUES ('1281', '1', '17535330');
INSERT INTO `bcnm_instance` VALUES ('1281', '1', '17535331');
INSERT INTO `bcnm_instance` VALUES ('1281', '1', '17535332');
INSERT INTO `bcnm_instance` VALUES ('1281', '1', '17535333');
INSERT INTO `bcnm_instance` VALUES ('1281', '1', '17535334');
INSERT INTO `bcnm_instance` VALUES ('1281', '1', '17535335');
INSERT INTO `bcnm_instance` VALUES ('1281', '1', '17535336');
INSERT INTO `bcnm_instance` VALUES ('1281', '1', '17535337');
INSERT INTO `bcnm_instance` VALUES ('1281', '1', '17535338');
INSERT INTO `bcnm_instance` VALUES ('1281', '1', '17535339');
INSERT INTO `bcnm_instance` VALUES ('1281', '1', '17535340');
INSERT INTO `bcnm_instance` VALUES ('1281', '1', '17535341');
INSERT INTO `bcnm_instance` VALUES ('1281', '1', '17535342');
INSERT INTO `bcnm_instance` VALUES ('1281', '1', '17535343');
INSERT INTO `bcnm_instance` VALUES ('1281', '1', '17535344');
INSERT INTO `bcnm_instance` VALUES ('1281', '1', '17535345');
INSERT INTO `bcnm_instance` VALUES ('1281', '1', '17535346');
INSERT INTO `bcnm_instance` VALUES ('1281', '1', '17535347');
INSERT INTO `bcnm_instance` VALUES ('1281', '1', '17535348');
INSERT INTO `bcnm_instance` VALUES ('1281', '1', '17535349');
INSERT INTO `bcnm_instance` VALUES ('1281', '2', '17535356');
INSERT INTO `bcnm_instance` VALUES ('1281', '2', '17535357');
INSERT INTO `bcnm_instance` VALUES ('1281', '2', '17535358');
INSERT INTO `bcnm_instance` VALUES ('1281', '2', '17535359');
INSERT INTO `bcnm_instance` VALUES ('1281', '2', '17535360');
INSERT INTO `bcnm_instance` VALUES ('1281', '2', '17535361');
INSERT INTO `bcnm_instance` VALUES ('1281', '2', '17535362');
INSERT INTO `bcnm_instance` VALUES ('1281', '2', '17535363');
INSERT INTO `bcnm_instance` VALUES ('1281', '2', '17535364');
INSERT INTO `bcnm_instance` VALUES ('1281', '2', '17535365');
INSERT INTO `bcnm_instance` VALUES ('1281', '2', '17535366');
INSERT INTO `bcnm_instance` VALUES ('1281', '2', '17535367');
INSERT INTO `bcnm_instance` VALUES ('1281', '2', '17535368');
INSERT INTO `bcnm_instance` VALUES ('1281', '2', '17535369');
INSERT INTO `bcnm_instance` VALUES ('1281', '2', '17535370');
INSERT INTO `bcnm_instance` VALUES ('1281', '2', '17535371');
INSERT INTO `bcnm_instance` VALUES ('1281', '2', '17535372');
INSERT INTO `bcnm_instance` VALUES ('1281', '2', '17535373');
INSERT INTO `bcnm_instance` VALUES ('1281', '2', '17535374');
INSERT INTO `bcnm_instance` VALUES ('1281', '2', '17535375');
INSERT INTO `bcnm_instance` VALUES ('1281', '2', '17535376');
INSERT INTO `bcnm_instance` VALUES ('1281', '2', '17535377');
INSERT INTO `bcnm_instance` VALUES ('1281', '2', '17535378');
INSERT INTO `bcnm_instance` VALUES ('1281', '2', '17535379');
INSERT INTO `bcnm_instance` VALUES ('1281', '2', '17535380');
INSERT INTO `bcnm_instance` VALUES ('1282', '1', '17543461');
INSERT INTO `bcnm_instance` VALUES ('1282', '1', '17543462');
INSERT INTO `bcnm_instance` VALUES ('1282', '1', '17543463');
INSERT INTO `bcnm_instance` VALUES ('1282', '1', '17543490');
INSERT INTO `bcnm_instance` VALUES ('1282', '1', '17543491');
INSERT INTO `bcnm_instance` VALUES ('1282', '1', '17543492');
INSERT INTO `bcnm_instance` VALUES ('1282', '1', '17543493');
INSERT INTO `bcnm_instance` VALUES ('1282', '1', '17543494');
INSERT INTO `bcnm_instance` VALUES ('1282', '1', '17543495');
INSERT INTO `bcnm_instance` VALUES ('1282', '1', '17543496');
INSERT INTO `bcnm_instance` VALUES ('1282', '1', '17543497');
INSERT INTO `bcnm_instance` VALUES ('1282', '1', '17543498');
INSERT INTO `bcnm_instance` VALUES ('1282', '1', '17543499');
INSERT INTO `bcnm_instance` VALUES ('1282', '1', '17543500');
INSERT INTO `bcnm_instance` VALUES ('1282', '1', '17543501');
INSERT INTO `bcnm_instance` VALUES ('1282', '1', '17543502');
INSERT INTO `bcnm_instance` VALUES ('1282', '1', '17543503');
INSERT INTO `bcnm_instance` VALUES ('1282', '1', '17543504');
INSERT INTO `bcnm_instance` VALUES ('1282', '1', '17543505');
INSERT INTO `bcnm_instance` VALUES ('1282', '1', '17543506');
INSERT INTO `bcnm_instance` VALUES ('1282', '1', '17543507');
INSERT INTO `bcnm_instance` VALUES ('1282', '1', '17543508');
INSERT INTO `bcnm_instance` VALUES ('1282', '1', '17543509');
INSERT INTO `bcnm_instance` VALUES ('1282', '1', '17543510');
INSERT INTO `bcnm_instance` VALUES ('1282', '1', '17543511');
INSERT INTO `bcnm_instance` VALUES ('1282', '1', '17543512');
INSERT INTO `bcnm_instance` VALUES ('1282', '1', '17543513');
INSERT INTO `bcnm_instance` VALUES ('1282', '1', '17543514');
INSERT INTO `bcnm_instance` VALUES ('1282', '1', '17543515');
INSERT INTO `bcnm_instance` VALUES ('1282', '1', '17543516');
INSERT INTO `bcnm_instance` VALUES ('1282', '1', '17543517');
INSERT INTO `bcnm_instance` VALUES ('1282', '1', '17543518');
INSERT INTO `bcnm_instance` VALUES ('1282', '1', '17543519');
INSERT INTO `bcnm_instance` VALUES ('1282', '1', '17543520');
INSERT INTO `bcnm_instance` VALUES ('1282', '1', '17543521');
INSERT INTO `bcnm_instance` VALUES ('1282', '1', '17543522');
INSERT INTO `bcnm_instance` VALUES ('1282', '1', '17543527');
INSERT INTO `bcnm_instance` VALUES ('1282', '1', '17543528');
INSERT INTO `bcnm_instance` VALUES ('1282', '1', '17543529');
INSERT INTO `bcnm_instance` VALUES ('1282', '1', '17543532');
INSERT INTO `bcnm_instance` VALUES ('1282', '1', '17543533');
INSERT INTO `bcnm_instance` VALUES ('1282', '1', '17543534');
INSERT INTO `bcnm_instance` VALUES ('1282', '1', '17543538');
INSERT INTO `bcnm_instance` VALUES ('1282', '1', '17543539');
INSERT INTO `bcnm_instance` VALUES ('1282', '1', '17543540');
INSERT INTO `bcnm_instance` VALUES ('1282', '1', '17543541');
INSERT INTO `bcnm_instance` VALUES ('1282', '1', '17543542');
INSERT INTO `bcnm_instance` VALUES ('1282', '1', '17543545');
INSERT INTO `bcnm_instance` VALUES ('1282', '1', '17543548');
INSERT INTO `bcnm_instance` VALUES ('1282', '1', '17543550');
INSERT INTO `bcnm_instance` VALUES ('1282', '1', '17543553');
INSERT INTO `bcnm_instance` VALUES ('1282', '1', '17543556');
INSERT INTO `bcnm_instance` VALUES ('1282', '1', '17543560');
INSERT INTO `bcnm_instance` VALUES ('1282', '1', '17543564');
INSERT INTO `bcnm_instance` VALUES ('1282', '1', '17543565');
INSERT INTO `bcnm_instance` VALUES ('1282', '1', '17543567');
INSERT INTO `bcnm_instance` VALUES ('1282', '1', '17543569');
INSERT INTO `bcnm_instance` VALUES ('1282', '1', '17543570');
INSERT INTO `bcnm_instance` VALUES ('1282', '1', '17543571');
INSERT INTO `bcnm_instance` VALUES ('1282', '1', '17543572');
INSERT INTO `bcnm_instance` VALUES ('1282', '1', '17543573');
INSERT INTO `bcnm_instance` VALUES ('1282', '1', '17543577');
INSERT INTO `bcnm_instance` VALUES ('1282', '1', '17543580');
INSERT INTO `bcnm_instance` VALUES ('1282', '1', '17543581');
INSERT INTO `bcnm_instance` VALUES ('1282', '1', '17543582');
INSERT INTO `bcnm_instance` VALUES ('1282', '1', '17543583');
INSERT INTO `bcnm_instance` VALUES ('1282', '2', '17543601');
INSERT INTO `bcnm_instance` VALUES ('1282', '2', '17543602');
INSERT INTO `bcnm_instance` VALUES ('1282', '2', '17543603');
INSERT INTO `bcnm_instance` VALUES ('1282', '2', '17543604');
INSERT INTO `bcnm_instance` VALUES ('1282', '2', '17543605');
INSERT INTO `bcnm_instance` VALUES ('1282', '2', '17543606');
INSERT INTO `bcnm_instance` VALUES ('1282', '2', '17543607');
INSERT INTO `bcnm_instance` VALUES ('1282', '2', '17543608');
INSERT INTO `bcnm_instance` VALUES ('1282', '2', '17543609');
INSERT INTO `bcnm_instance` VALUES ('1282', '2', '17543610');
INSERT INTO `bcnm_instance` VALUES ('1282', '2', '17543611');
INSERT INTO `bcnm_instance` VALUES ('1282', '2', '17543612');
INSERT INTO `bcnm_instance` VALUES ('1282', '2', '17543613');
INSERT INTO `bcnm_instance` VALUES ('1282', '2', '17543614');
INSERT INTO `bcnm_instance` VALUES ('1282', '2', '17543615');
INSERT INTO `bcnm_instance` VALUES ('1282', '2', '17543616');
INSERT INTO `bcnm_instance` VALUES ('1282', '2', '17543617');
INSERT INTO `bcnm_instance` VALUES ('1282', '2', '17543618');
INSERT INTO `bcnm_instance` VALUES ('1282', '2', '17543619');
INSERT INTO `bcnm_instance` VALUES ('1282', '2', '17543620');
INSERT INTO `bcnm_instance` VALUES ('1282', '2', '17543621');
INSERT INTO `bcnm_instance` VALUES ('1282', '2', '17543622');
INSERT INTO `bcnm_instance` VALUES ('1282', '2', '17543623');
INSERT INTO `bcnm_instance` VALUES ('1282', '2', '17543624');
INSERT INTO `bcnm_instance` VALUES ('1282', '2', '17543625');
INSERT INTO `bcnm_instance` VALUES ('1283', '1', '17547530');
INSERT INTO `bcnm_instance` VALUES ('1283', '1', '17547531');
INSERT INTO `bcnm_instance` VALUES ('1283', '1', '17547532');
INSERT INTO `bcnm_instance` VALUES ('1283', '1', '17547533');
INSERT INTO `bcnm_instance` VALUES ('1283', '1', '17547534');
INSERT INTO `bcnm_instance` VALUES ('1283', '1', '17547535');
INSERT INTO `bcnm_instance` VALUES ('1283', '1', '17547536');
INSERT INTO `bcnm_instance` VALUES ('1283', '1', '17547537');
INSERT INTO `bcnm_instance` VALUES ('1283', '1', '17547538');
INSERT INTO `bcnm_instance` VALUES ('1283', '1', '17547539');
INSERT INTO `bcnm_instance` VALUES ('1283', '1', '17547540');
INSERT INTO `bcnm_instance` VALUES ('1283', '1', '17547541');
INSERT INTO `bcnm_instance` VALUES ('1283', '1', '17547542');
INSERT INTO `bcnm_instance` VALUES ('1283', '1', '17547543');
INSERT INTO `bcnm_instance` VALUES ('1283', '1', '17547544');
INSERT INTO `bcnm_instance` VALUES ('1283', '1', '17547545');
INSERT INTO `bcnm_instance` VALUES ('1283', '1', '17547546');
INSERT INTO `bcnm_instance` VALUES ('1283', '1', '17547547');
INSERT INTO `bcnm_instance` VALUES ('1283', '1', '17547548');
INSERT INTO `bcnm_instance` VALUES ('1283', '1', '17547549');
INSERT INTO `bcnm_instance` VALUES ('1283', '1', '17547550');
INSERT INTO `bcnm_instance` VALUES ('1283', '1', '17547551');
INSERT INTO `bcnm_instance` VALUES ('1283', '1', '17547552');
INSERT INTO `bcnm_instance` VALUES ('1283', '1', '17547553');
INSERT INTO `bcnm_instance` VALUES ('1283', '1', '17547554');
INSERT INTO `bcnm_instance` VALUES ('1283', '1', '17547555');
INSERT INTO `bcnm_instance` VALUES ('1283', '1', '17547556');
INSERT INTO `bcnm_instance` VALUES ('1283', '1', '17547557');
INSERT INTO `bcnm_instance` VALUES ('1283', '1', '17547558');
INSERT INTO `bcnm_instance` VALUES ('1283', '1', '17547559');
INSERT INTO `bcnm_instance` VALUES ('1283', '1', '17547560');
INSERT INTO `bcnm_instance` VALUES ('1283', '1', '17547561');
INSERT INTO `bcnm_instance` VALUES ('1283', '1', '17547562');
INSERT INTO `bcnm_instance` VALUES ('1283', '1', '17547563');
INSERT INTO `bcnm_instance` VALUES ('1283', '1', '17547564');
INSERT INTO `bcnm_instance` VALUES ('1283', '1', '17547565');
INSERT INTO `bcnm_instance` VALUES ('1283', '1', '17547566');
INSERT INTO `bcnm_instance` VALUES ('1283', '1', '17547567');
INSERT INTO `bcnm_instance` VALUES ('1283', '1', '17547568');
INSERT INTO `bcnm_instance` VALUES ('1283', '1', '17547569');
INSERT INTO `bcnm_instance` VALUES ('1283', '1', '17547570');
INSERT INTO `bcnm_instance` VALUES ('1283', '1', '17547571');
INSERT INTO `bcnm_instance` VALUES ('1283', '1', '17547572');
INSERT INTO `bcnm_instance` VALUES ('1283', '1', '17547573');
INSERT INTO `bcnm_instance` VALUES ('1283', '1', '17547574');
INSERT INTO `bcnm_instance` VALUES ('1283', '1', '17547575');
INSERT INTO `bcnm_instance` VALUES ('1283', '1', '17547576');
INSERT INTO `bcnm_instance` VALUES ('1283', '1', '17547577');
INSERT INTO `bcnm_instance` VALUES ('1283', '1', '17547578');
INSERT INTO `bcnm_instance` VALUES ('1283', '1', '17547579');
INSERT INTO `bcnm_instance` VALUES ('1283', '1', '17547580');
INSERT INTO `bcnm_instance` VALUES ('1283', '1', '17547581');
INSERT INTO `bcnm_instance` VALUES ('1283', '1', '17547582');
INSERT INTO `bcnm_instance` VALUES ('1283', '1', '17547583');
INSERT INTO `bcnm_instance` VALUES ('1283', '1', '17547584');
INSERT INTO `bcnm_instance` VALUES ('1283', '1', '17547585');
INSERT INTO `bcnm_instance` VALUES ('1283', '1', '17547586');
INSERT INTO `bcnm_instance` VALUES ('1283', '1', '17547587');
INSERT INTO `bcnm_instance` VALUES ('1283', '1', '17547588');
INSERT INTO `bcnm_instance` VALUES ('1283', '1', '17547589');
INSERT INTO `bcnm_instance` VALUES ('1283', '1', '17547590');
INSERT INTO `bcnm_instance` VALUES ('1283', '1', '17547591');
INSERT INTO `bcnm_instance` VALUES ('1283', '1', '17547592');
INSERT INTO `bcnm_instance` VALUES ('1283', '1', '17547593');
INSERT INTO `bcnm_instance` VALUES ('1283', '1', '17547594');
INSERT INTO `bcnm_instance` VALUES ('1283', '1', '17547595');
INSERT INTO `bcnm_instance` VALUES ('1283', '1', '17547596');
INSERT INTO `bcnm_instance` VALUES ('1283', '1', '17547597');
INSERT INTO `bcnm_instance` VALUES ('1283', '1', '17547598');
INSERT INTO `bcnm_instance` VALUES ('1283', '1', '17547599');
INSERT INTO `bcnm_instance` VALUES ('1283', '1', '17547600');
INSERT INTO `bcnm_instance` VALUES ('1283', '1', '17547601');
INSERT INTO `bcnm_instance` VALUES ('1283', '1', '17547602');
INSERT INTO `bcnm_instance` VALUES ('1283', '1', '17547603');
INSERT INTO `bcnm_instance` VALUES ('1283', '1', '17547604');
INSERT INTO `bcnm_instance` VALUES ('1283', '1', '17547605');
INSERT INTO `bcnm_instance` VALUES ('1283', '1', '17547606');
INSERT INTO `bcnm_instance` VALUES ('1283', '2', '17547649');
INSERT INTO `bcnm_instance` VALUES ('1283', '2', '17547650');
INSERT INTO `bcnm_instance` VALUES ('1283', '2', '17547651');
INSERT INTO `bcnm_instance` VALUES ('1283', '2', '17547652');
INSERT INTO `bcnm_instance` VALUES ('1283', '2', '17547653');
INSERT INTO `bcnm_instance` VALUES ('1283', '2', '17547654');
INSERT INTO `bcnm_instance` VALUES ('1283', '2', '17547655');
INSERT INTO `bcnm_instance` VALUES ('1283', '2', '17547656');
INSERT INTO `bcnm_instance` VALUES ('1283', '2', '17547657');
INSERT INTO `bcnm_instance` VALUES ('1283', '2', '17547658');
INSERT INTO `bcnm_instance` VALUES ('1283', '2', '17547659');
INSERT INTO `bcnm_instance` VALUES ('1283', '2', '17547660');
INSERT INTO `bcnm_instance` VALUES ('1283', '2', '17547661');
INSERT INTO `bcnm_instance` VALUES ('1283', '2', '17547662');
INSERT INTO `bcnm_instance` VALUES ('1283', '2', '17547663');
INSERT INTO `bcnm_instance` VALUES ('1283', '2', '17547664');
INSERT INTO `bcnm_instance` VALUES ('1283', '2', '17547665');
INSERT INTO `bcnm_instance` VALUES ('1283', '2', '17547666');
INSERT INTO `bcnm_instance` VALUES ('1283', '2', '17547667');
INSERT INTO `bcnm_instance` VALUES ('1283', '2', '17547668');
INSERT INTO `bcnm_instance` VALUES ('1283', '2', '17547669');
INSERT INTO `bcnm_instance` VALUES ('1283', '2', '17547670');
INSERT INTO `bcnm_instance` VALUES ('1283', '2', '17547671');
INSERT INTO `bcnm_instance` VALUES ('1283', '2', '17547672');
INSERT INTO `bcnm_instance` VALUES ('1283', '2', '17547673');
INSERT INTO `bcnm_instance` VALUES ('1283', '2', '17547674');
INSERT INTO `bcnm_instance` VALUES ('1283', '2', '17547675');
INSERT INTO `bcnm_instance` VALUES ('1283', '2', '17547676');
INSERT INTO `bcnm_instance` VALUES ('1283', '2', '17547677');
INSERT INTO `bcnm_instance` VALUES ('1283', '2', '17547678');
