/*
MySQL Data Transfer
Source Host: localhost
Source Database: dspdb
Target Host: localhost
Target Database: dspdb
Date: 31/08/2012 18:09:30
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for bcnm_loot
-- ----------------------------
DROP TABLE IF EXISTS `bcnm_loot`;
CREATE TABLE `bcnm_loot` (
  `LootDropId` smallint(5) unsigned NOT NULL default '0',
  `itemId` smallint(5) unsigned NOT NULL default '0',
  `rolls` smallint(5) unsigned NOT NULL default '0',
  `lootGroupId` tinyint(3) unsigned NOT NULL default '0',
  KEY `LootDropId` (`LootDropId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=9;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `bcnm_loot` VALUES ('76', '18047', '188', '0');
INSERT INTO `bcnm_loot` VALUES ('76', '17939', '27', '0');
INSERT INTO `bcnm_loot` VALUES ('76', '17937', '170', '0');
INSERT INTO `bcnm_loot` VALUES ('76', '1441', '295', '0');
INSERT INTO `bcnm_loot` VALUES ('76', '18351', '27', '0');
INSERT INTO `bcnm_loot` VALUES ('76', '17464', '71', '0');
INSERT INTO `bcnm_loot` VALUES ('76', '17575', '196', '0');
INSERT INTO `bcnm_loot` VALUES ('76', '18211', '45', '1');
INSERT INTO `bcnm_loot` VALUES ('76', '17576', '259', '1');
INSERT INTO `bcnm_loot` VALUES ('76', '17245', '241', '1');
INSERT INTO `bcnm_loot` VALUES ('76', '17838', '143', '1');
INSERT INTO `bcnm_loot` VALUES ('76', '1442', '161', '1');
INSERT INTO `bcnm_loot` VALUES ('76', '17996', '143', '1');
INSERT INTO `bcnm_loot` VALUES ('76', '17578', '36', '1');
INSERT INTO `bcnm_loot` VALUES ('76', '683', '446', '2');
INSERT INTO `bcnm_loot` VALUES ('76', '908', '420', '2');
INSERT INTO `bcnm_loot` VALUES ('76', '1312', '71', '2');
INSERT INTO `bcnm_loot` VALUES ('76', '14080', '26', '2');
INSERT INTO `bcnm_loot` VALUES ('76', '887', '116', '3');
INSERT INTO `bcnm_loot` VALUES ('76', '645', '89', '3');
INSERT INTO `bcnm_loot` VALUES ('76', '902', '71', '3');
INSERT INTO `bcnm_loot` VALUES ('76', '702', '152', '3');
INSERT INTO `bcnm_loot` VALUES ('76', '737', '107', '3');
INSERT INTO `bcnm_loot` VALUES ('76', '823', '89', '3');
INSERT INTO `bcnm_loot` VALUES ('76', '1465', '45', '3');
INSERT INTO `bcnm_loot` VALUES ('76', '4173', '71', '3');
INSERT INTO `bcnm_loot` VALUES ('76', '700', '107', '3');
INSERT INTO `bcnm_loot` VALUES ('76', '703', '223', '3');
INSERT INTO `bcnm_loot` VALUES ('76', '738', '116', '3');
INSERT INTO `bcnm_loot` VALUES ('76', '830', '54', '3');
INSERT INTO `bcnm_loot` VALUES ('76', '895', '54', '3');
INSERT INTO `bcnm_loot` VALUES ('76', '1132', '71', '3');
INSERT INTO `bcnm_loot` VALUES ('76', '4172', '45', '3');
INSERT INTO `bcnm_loot` VALUES ('76', '866', '54', '3');
INSERT INTO `bcnm_loot` VALUES ('76', '4174', '63', '3');
INSERT INTO `bcnm_loot` VALUES ('76', '4175', '45', '3');
INSERT INTO `bcnm_loot` VALUES ('76', '683', '268', '4');
INSERT INTO `bcnm_loot` VALUES ('76', '1525', '143', '4');
INSERT INTO `bcnm_loot` VALUES ('76', '4205', '80', '4');
INSERT INTO `bcnm_loot` VALUES ('76', '4201', '143', '4');
INSERT INTO `bcnm_loot` VALUES ('76', '4199', '214', '4');
INSERT INTO `bcnm_loot` VALUES ('76', '4203', '196', '4');
INSERT INTO `bcnm_loot` VALUES ('76', '646', '107', '5');
INSERT INTO `bcnm_loot` VALUES ('76', '4211', '89', '5');
INSERT INTO `bcnm_loot` VALUES ('76', '645', '179', '5');
INSERT INTO `bcnm_loot` VALUES ('76', '4213', '134', '5');
INSERT INTO `bcnm_loot` VALUES ('76', '4207', '152', '5');
INSERT INTO `bcnm_loot` VALUES ('76', '4209', '80', '5');
INSERT INTO `bcnm_loot` VALUES ('76', '739', '80', '5');
INSERT INTO `bcnm_loot` VALUES ('76', '738', '107', '5');
INSERT INTO `bcnm_loot` VALUES ('76', '17698', '152', '5');
INSERT INTO `bcnm_loot` VALUES ('76', '4135', '295', '6');
INSERT INTO `bcnm_loot` VALUES ('76', '4119', '250', '6');
INSERT INTO `bcnm_loot` VALUES ('76', '4173', '196', '6');
INSERT INTO `bcnm_loot` VALUES ('76', '4175', '214', '6');
INSERT INTO `bcnm_loot` VALUES ('76', '887', '139', '7');
INSERT INTO `bcnm_loot` VALUES ('76', '645', '59', '7');
INSERT INTO `bcnm_loot` VALUES ('76', '902', '50', '7');
INSERT INTO `bcnm_loot` VALUES ('76', '702', '109', '7');
INSERT INTO `bcnm_loot` VALUES ('76', '737', '69', '7');
INSERT INTO `bcnm_loot` VALUES ('76', '1465', '99', '7');
INSERT INTO `bcnm_loot` VALUES ('76', '4173', '79', '7');
INSERT INTO `bcnm_loot` VALUES ('76', '700', '129', '7');
INSERT INTO `bcnm_loot` VALUES ('76', '644', '119', '7');
INSERT INTO `bcnm_loot` VALUES ('76', '844', '69', '7');
INSERT INTO `bcnm_loot` VALUES ('76', '703', '168', '7');
INSERT INTO `bcnm_loot` VALUES ('76', '738', '129', '7');
INSERT INTO `bcnm_loot` VALUES ('76', '895', '109', '7');
INSERT INTO `bcnm_loot` VALUES ('76', '1132', '79', '7');
INSERT INTO `bcnm_loot` VALUES ('76', '4174', '69', '7');
INSERT INTO `bcnm_loot` VALUES ('76', '866', '79', '7');
INSERT INTO `bcnm_loot` VALUES ('76', '4172', '50', '7');
INSERT INTO `bcnm_loot` VALUES ('76', '823', '89', '7');
INSERT INTO `bcnm_loot` VALUES ('76', '1110', '109', '8');
INSERT INTO `bcnm_loot` VALUES ('76', '836', '89', '8');
INSERT INTO `bcnm_loot` VALUES ('76', '658', '78', '8');
INSERT INTO `bcnm_loot` VALUES ('76', '837', '99', '8');
INSERT INTO `bcnm_loot` VALUES ('76', '942', '188', '8');
INSERT INTO `bcnm_loot` VALUES ('76', '844', '238', '8');
INSERT INTO `bcnm_loot` VALUES ('76', '1132', '109', '8');
INSERT INTO `bcnm_loot` VALUES ('76', '722', '79', '9');
INSERT INTO `bcnm_loot` VALUES ('76', '1446', '257', '9');
INSERT INTO `bcnm_loot` VALUES ('76', '703', '337', '9');
INSERT INTO `bcnm_loot` VALUES ('76', '831', '149', '9');
INSERT INTO `bcnm_loot` VALUES ('76', '3343', '1', '10');
INSERT INTO `bcnm_loot` VALUES ('105', '1603', '100', '0');
INSERT INTO `bcnm_loot` VALUES ('105', '915', '250', '1');
INSERT INTO `bcnm_loot` VALUES ('105', '4112', '300', '1');
INSERT INTO `bcnm_loot` VALUES ('105', '4113', '180', '1');
INSERT INTO `bcnm_loot` VALUES ('105', '4898', '130', '1');
INSERT INTO `bcnm_loot` VALUES ('105', '825', '280', '1');
INSERT INTO `bcnm_loot` VALUES ('105', '749', '250', '2');
INSERT INTO `bcnm_loot` VALUES ('105', '17786', '190', '2');
INSERT INTO `bcnm_loot` VALUES ('105', '827', '270', '2');
INSERT INTO `bcnm_loot` VALUES ('105', '18171', '145', '2');
INSERT INTO `bcnm_loot` VALUES ('105', '824', '295', '2');
INSERT INTO `bcnm_loot` VALUES ('105', '826', '260', '2');
INSERT INTO `bcnm_loot` VALUES ('105', '18209', '100', '3');
INSERT INTO `bcnm_loot` VALUES ('105', '0', '100', '3');
INSERT INTO `bcnm_loot` VALUES ('105', '924', '100', '4');
INSERT INTO `bcnm_loot` VALUES ('105', '924', '100', '5');
INSERT INTO `bcnm_loot` VALUES ('105', '18170', '235', '6');
INSERT INTO `bcnm_loot` VALUES ('105', '17271', '235', '6');
INSERT INTO `bcnm_loot` VALUES ('105', '17692', '235', '6');
INSERT INTO `bcnm_loot` VALUES ('105', '17571', '235', '6');
INSERT INTO `bcnm_loot` VALUES ('105', '17820', '255', '6');
INSERT INTO `bcnm_loot` VALUES ('105', '1601', '260', '6');
INSERT INTO `bcnm_loot` VALUES ('105', '4853', '250', '6');
INSERT INTO `bcnm_loot` VALUES ('105', '930', '190', '6');
INSERT INTO `bcnm_loot` VALUES ('81', '1473', '813', '0');
INSERT INTO `bcnm_loot` VALUES ('81', '13552', '55', '0');
INSERT INTO `bcnm_loot` VALUES ('81', '901', '123', '0');
INSERT INTO `bcnm_loot` VALUES ('81', '17207', '216', '1');
INSERT INTO `bcnm_loot` VALUES ('81', '18005', '295', '1');
INSERT INTO `bcnm_loot` VALUES ('81', '18217', '239', '1');
INSERT INTO `bcnm_loot` VALUES ('81', '17793', '231', '1');
INSERT INTO `bcnm_loot` VALUES ('81', '17624', '504', '2');
INSERT INTO `bcnm_loot` VALUES ('81', '655', '4', '2');
INSERT INTO `bcnm_loot` VALUES ('81', '19027', '86', '2');
INSERT INTO `bcnm_loot` VALUES ('81', '747', '22', '2');
INSERT INTO `bcnm_loot` VALUES ('81', '19025', '146', '2');
INSERT INTO `bcnm_loot` VALUES ('81', '19024', '22', '2');
INSERT INTO `bcnm_loot` VALUES ('81', '15295', '287', '3');
INSERT INTO `bcnm_loot` VALUES ('81', '12407', '216', '3');
INSERT INTO `bcnm_loot` VALUES ('81', '14871', '198', '3');
INSERT INTO `bcnm_loot` VALUES ('81', '15294', '287', '3');
INSERT INTO `bcnm_loot` VALUES ('81', '887', '52', '4');
INSERT INTO `bcnm_loot` VALUES ('81', '645', '56', '4');
INSERT INTO `bcnm_loot` VALUES ('81', '902', '41', '4');
INSERT INTO `bcnm_loot` VALUES ('81', '702', '63', '4');
INSERT INTO `bcnm_loot` VALUES ('81', '737', '52', '4');
INSERT INTO `bcnm_loot` VALUES ('81', '823', '26', '4');
INSERT INTO `bcnm_loot` VALUES ('81', '1465', '11', '4');
INSERT INTO `bcnm_loot` VALUES ('81', '4173', '37', '4');
INSERT INTO `bcnm_loot` VALUES ('81', '700', '101', '4');
INSERT INTO `bcnm_loot` VALUES ('81', '653', '0', '4'); -- this is "zero" on ffxiclopedia???
INSERT INTO `bcnm_loot` VALUES ('81', '644', '52', '4');
INSERT INTO `bcnm_loot` VALUES ('81', '703', '116', '4');
INSERT INTO `bcnm_loot` VALUES ('81', '844', '15', '4');
INSERT INTO `bcnm_loot` VALUES ('81', '942', '56', '4');
INSERT INTO `bcnm_loot` VALUES ('81', '738', '45', '4');
INSERT INTO `bcnm_loot` VALUES ('81', '830', '22', '4');
INSERT INTO `bcnm_loot` VALUES ('81', '895', '67', '4');
INSERT INTO `bcnm_loot` VALUES ('81', '1132', '119', '4');
INSERT INTO `bcnm_loot` VALUES ('81', '4172', '45', '4');
INSERT INTO `bcnm_loot` VALUES ('81', '4174', '19', '4');
INSERT INTO `bcnm_loot` VALUES ('81', '4175', '41', '4');
INSERT INTO `bcnm_loot` VALUES ('81', '866', '34', '4');
INSERT INTO `bcnm_loot` VALUES ('81', '1110', '78', '5');
INSERT INTO `bcnm_loot` VALUES ('81', '836', '56', '5');
INSERT INTO `bcnm_loot` VALUES ('81', '658', '93', '5');
INSERT INTO `bcnm_loot` VALUES ('81', '837', '56', '5');
INSERT INTO `bcnm_loot` VALUES ('81', '942', '157', '5');
INSERT INTO `bcnm_loot` VALUES ('81', '844', '276', '5');
INSERT INTO `bcnm_loot` VALUES ('81', '1132', '209', '5');
INSERT INTO `bcnm_loot` VALUES ('34', '891', '1000', '0');
INSERT INTO `bcnm_loot` VALUES ('34', '4900', '306', '1');
INSERT INTO `bcnm_loot` VALUES ('34', '4744', '319', '1');
INSERT INTO `bcnm_loot` VALUES ('34', '4745', '125', '1');
INSERT INTO `bcnm_loot` VALUES ('34', '4746', '222', '1');
INSERT INTO `bcnm_loot` VALUES ('34', '17786', '153', '2');
INSERT INTO `bcnm_loot` VALUES ('34', '18170', '139', '2');
INSERT INTO `bcnm_loot` VALUES ('34', '16687', '83', '2');
INSERT INTO `bcnm_loot` VALUES ('34', '17571', '97', '2');
INSERT INTO `bcnm_loot` VALUES ('34', '17993', '125', '2');
INSERT INTO `bcnm_loot` VALUES ('34', '749', '444', '2');
INSERT INTO `bcnm_loot` VALUES ('34', '773', '56', '2');
INSERT INTO `bcnm_loot` VALUES ('34', '17820', '111', '3');
INSERT INTO `bcnm_loot` VALUES ('34', '17993', '139', '3');
INSERT INTO `bcnm_loot` VALUES ('34', '18170', '139', '3');
INSERT INTO `bcnm_loot` VALUES ('34', '18085', '42', '3');
INSERT INTO `bcnm_loot` VALUES ('34', '16959', '181', '3');
INSERT INTO `bcnm_loot` VALUES ('34', '774', '97', '3');
INSERT INTO `bcnm_loot` VALUES ('34', '769', '69', '3');
INSERT INTO `bcnm_loot` VALUES ('34', '776', '14', '3');
INSERT INTO `bcnm_loot` VALUES ('34', '775', '28', '3');
INSERT INTO `bcnm_loot` VALUES ('34', '772', '28', '3');
INSERT INTO `bcnm_loot` VALUES ('34', '771', '14', '3');
INSERT INTO `bcnm_loot` VALUES ('34', '770', '69', '3');
INSERT INTO `bcnm_loot` VALUES ('34', '13548', '167', '4');
INSERT INTO `bcnm_loot` VALUES ('34', '922', '444', '4');
INSERT INTO `bcnm_loot` VALUES ('34', '0', '600', '4');
INSERT INTO `bcnm_loot` VALUES ('107', '3339', '1000', '0');
INSERT INTO `bcnm_loot` VALUES ('107', '1441', '312', '1');
INSERT INTO `bcnm_loot` VALUES ('107', '17694', '182', '1');
INSERT INTO `bcnm_loot` VALUES ('107', '18047', '65', '1');
INSERT INTO `bcnm_loot` VALUES ('107', '17937', '43', '1');
INSERT INTO `bcnm_loot` VALUES ('107', '18173', '181', '1');
INSERT INTO `bcnm_loot` VALUES ('107', '17823', '217', '1');
INSERT INTO `bcnm_loot` VALUES ('107', '17575', '43', '1');
INSERT INTO `bcnm_loot` VALUES ('107', '1442', '159', '2');
INSERT INTO `bcnm_loot` VALUES ('107', '17695', '151', '2');
INSERT INTO `bcnm_loot` VALUES ('107', '18088', '167', '2');
INSERT INTO `bcnm_loot` VALUES ('107', '17576', '95', '2');
INSERT INTO `bcnm_loot` VALUES ('107', '17245', '95', '2');
INSERT INTO `bcnm_loot` VALUES ('107', '17996', '56', '2');
INSERT INTO `bcnm_loot` VALUES ('107', '17789', '341', '2');
INSERT INTO `bcnm_loot` VALUES ('107', '4486', '522', '3');
INSERT INTO `bcnm_loot` VALUES ('107', '4272', '346', '3');
INSERT INTO `bcnm_loot` VALUES ('107', '17928', '82', '3');
INSERT INTO `bcnm_loot` VALUES ('107', '13189', '59', '3');
INSERT INTO `bcnm_loot` VALUES ('107', '887', '32', '4');
INSERT INTO `bcnm_loot` VALUES ('107', '645', '71', '4');
INSERT INTO `bcnm_loot` VALUES ('107', '902', '79', '4');
INSERT INTO `bcnm_loot` VALUES ('107', '702', '56', '4');
INSERT INTO `bcnm_loot` VALUES ('107', '737', '71', '4');
INSERT INTO `bcnm_loot` VALUES ('107', '823', '32', '4');
INSERT INTO `bcnm_loot` VALUES ('107', '4173', '48', '4');
INSERT INTO `bcnm_loot` VALUES ('107', '700', '127', '4');
INSERT INTO `bcnm_loot` VALUES ('107', '644', '111', '4');
INSERT INTO `bcnm_loot` VALUES ('107', '703', '183', '4');
INSERT INTO `bcnm_loot` VALUES ('107', '942', '40', '4');
INSERT INTO `bcnm_loot` VALUES ('107', '738', '56', '4');
INSERT INTO `bcnm_loot` VALUES ('107', '895', '24', '4');
INSERT INTO `bcnm_loot` VALUES ('107', '1132', '119', '4');
INSERT INTO `bcnm_loot` VALUES ('107', '4172', '56', '4');
INSERT INTO `bcnm_loot` VALUES ('107', '4175', '40', '4');
INSERT INTO `bcnm_loot` VALUES ('107', '866', '24', '4');
INSERT INTO `bcnm_loot` VALUES ('107', '1526', '210', '5');
INSERT INTO `bcnm_loot` VALUES ('107', '1313', '775', '5');
INSERT INTO `bcnm_loot` VALUES ('107', '4209', '94', '6');
INSERT INTO `bcnm_loot` VALUES ('107', '4207', '130', '6');
INSERT INTO `bcnm_loot` VALUES ('107', '4211', '116', '6');
INSERT INTO `bcnm_loot` VALUES ('107', '4213', '51', '6');
INSERT INTO `bcnm_loot` VALUES ('107', '1132', '246', '6');
INSERT INTO `bcnm_loot` VALUES ('107', '17582', '246', '6');
INSERT INTO `bcnm_loot` VALUES ('107', '4135', '290', '7');
INSERT INTO `bcnm_loot` VALUES ('107', '4119', '225', '7');
INSERT INTO `bcnm_loot` VALUES ('107', '4173', '210', '7');
INSERT INTO `bcnm_loot` VALUES ('107', '4175', '217', '7');
INSERT INTO `bcnm_loot` VALUES ('107', '887', '87', '8');
INSERT INTO `bcnm_loot` VALUES ('107', '645', '80', '8');
INSERT INTO `bcnm_loot` VALUES ('107', '902', '58', '8');
INSERT INTO `bcnm_loot` VALUES ('107', '702', '72', '8');
INSERT INTO `bcnm_loot` VALUES ('107', '737', '87', '8');
INSERT INTO `bcnm_loot` VALUES ('107', '823', '14', '8');
INSERT INTO `bcnm_loot` VALUES ('107', '4173', '22', '8');
INSERT INTO `bcnm_loot` VALUES ('107', '700', '80', '8');
INSERT INTO `bcnm_loot` VALUES ('107', '644', '36', '8');
INSERT INTO `bcnm_loot` VALUES ('107', '703', '145', '8');
INSERT INTO `bcnm_loot` VALUES ('107', '844', '7', '8');
INSERT INTO `bcnm_loot` VALUES ('107', '738', '51', '8');
INSERT INTO `bcnm_loot` VALUES ('107', '830', '29', '8');
INSERT INTO `bcnm_loot` VALUES ('107', '895', '36', '8');
INSERT INTO `bcnm_loot` VALUES ('107', '1132', '72', '8');
INSERT INTO `bcnm_loot` VALUES ('107', '4172', '29', '8');
INSERT INTO `bcnm_loot` VALUES ('107', '4174', '29', '8');
INSERT INTO `bcnm_loot` VALUES ('107', '4175', '7', '8');
INSERT INTO `bcnm_loot` VALUES ('107', '866', '22', '8');
INSERT INTO `bcnm_loot` VALUES ('107', '1110', '58', '9');
INSERT INTO `bcnm_loot` VALUES ('107', '836', '36', '9');
INSERT INTO `bcnm_loot` VALUES ('107', '658', '72', '9');
INSERT INTO `bcnm_loot` VALUES ('107', '837', '22', '9');
INSERT INTO `bcnm_loot` VALUES ('107', '942', '275', '9');
INSERT INTO `bcnm_loot` VALUES ('107', '844', '196', '9');
INSERT INTO `bcnm_loot` VALUES ('107', '1132', '225', '9');
INSERT INTO `bcnm_loot` VALUES ('107', '722', '94', '10');
INSERT INTO `bcnm_loot` VALUES ('107', '1446', '196', '10');
INSERT INTO `bcnm_loot` VALUES ('107', '703', '572', '10');
INSERT INTO `bcnm_loot` VALUES ('107', '831', '43', '10');
INSERT INTO `bcnm_loot` VALUES ('11', '1441', '169', '0');
INSERT INTO `bcnm_loot` VALUES ('11', '17939', '268', '0');
INSERT INTO `bcnm_loot` VALUES ('11', '17823', '99', '0');
INSERT INTO `bcnm_loot` VALUES ('11', '18173', '85', '0');
INSERT INTO `bcnm_loot` VALUES ('11', '17694', '70', '0');
INSERT INTO `bcnm_loot` VALUES ('11', '17464', '85', '0');
INSERT INTO `bcnm_loot` VALUES ('11', '18351', '225', '0');
INSERT INTO `bcnm_loot` VALUES ('11', '1442', '169', '1');
INSERT INTO `bcnm_loot` VALUES ('11', '17789', '14', '1');
INSERT INTO `bcnm_loot` VALUES ('11', '17838', '239', '1');
INSERT INTO `bcnm_loot` VALUES ('11', '18088', '85', '1');
INSERT INTO `bcnm_loot` VALUES ('11', '18211', '254', '1');
INSERT INTO `bcnm_loot` VALUES ('11', '17578', '183', '1');
INSERT INTO `bcnm_loot` VALUES ('11', '17695', '70', '1');
INSERT INTO `bcnm_loot` VALUES ('11', '860', '535', '2');
INSERT INTO `bcnm_loot` VALUES ('11', '883', '366', '2');
INSERT INTO `bcnm_loot` VALUES ('11', '17108', '48', '2');
INSERT INTO `bcnm_loot` VALUES ('11', '902', '99', '3');
INSERT INTO `bcnm_loot` VALUES ('11', '703', '70', '3');
INSERT INTO `bcnm_loot` VALUES ('11', '1132', '70', '3');
INSERT INTO `bcnm_loot` VALUES ('11', '830', '28', '3');
INSERT INTO `bcnm_loot` VALUES ('11', '4173', '113', '3');
INSERT INTO `bcnm_loot` VALUES ('11', '703', '211', '3');
INSERT INTO `bcnm_loot` VALUES ('11', '942', '141', '3');
INSERT INTO `bcnm_loot` VALUES ('11', '737', '56', '3');
INSERT INTO `bcnm_loot` VALUES ('11', '644', '85', '3');
INSERT INTO `bcnm_loot` VALUES ('11', '887', '70', '3');
INSERT INTO `bcnm_loot` VALUES ('11', '700', '85', '3');
INSERT INTO `bcnm_loot` VALUES ('11', '866', '42', '3');
INSERT INTO `bcnm_loot` VALUES ('11', '645', '42', '3');
INSERT INTO `bcnm_loot` VALUES ('11', '895', '70', '3');
INSERT INTO `bcnm_loot` VALUES ('11', '702', '85', '3');
INSERT INTO `bcnm_loot` VALUES ('11', '4172', '28', '3');
INSERT INTO `bcnm_loot` VALUES ('11', '738', '42', '3');
INSERT INTO `bcnm_loot` VALUES ('11', '4174', '42', '3');
INSERT INTO `bcnm_loot` VALUES ('11', '4175', '7', '3');
INSERT INTO `bcnm_loot` VALUES ('11', '1527', '208', '4');
INSERT INTO `bcnm_loot` VALUES ('11', '883', '296', '4');
INSERT INTO `bcnm_loot` VALUES ('11', '4199', '155', '4');
INSERT INTO `bcnm_loot` VALUES ('11', '4201', '70', '4');
INSERT INTO `bcnm_loot` VALUES ('11', '4205', '141', '4');
INSERT INTO `bcnm_loot` VALUES ('11', '4203', '113', '4');
INSERT INTO `bcnm_loot` VALUES ('11', '3341', '1000', '5');
INSERT INTO `bcnm_loot` VALUES ('11', '4209', '169', '6');
INSERT INTO `bcnm_loot` VALUES ('11', '4207', '70', '6');
INSERT INTO `bcnm_loot` VALUES ('11', '4211', '113', '6');
INSERT INTO `bcnm_loot` VALUES ('11', '4213', '155', '6');
INSERT INTO `bcnm_loot` VALUES ('11', '17840', '254', '6');
INSERT INTO `bcnm_loot` VALUES ('11', '785', '99', '6');
INSERT INTO `bcnm_loot` VALUES ('11', '804', '42', '6');
INSERT INTO `bcnm_loot` VALUES ('11', '786', '56', '6');
INSERT INTO `bcnm_loot` VALUES ('11', '787', '28', '6');
INSERT INTO `bcnm_loot` VALUES ('11', '4135', '296', '7');
INSERT INTO `bcnm_loot` VALUES ('11', '4119', '225', '7');
INSERT INTO `bcnm_loot` VALUES ('11', '4173', '197', '7');
INSERT INTO `bcnm_loot` VALUES ('11', '4175', '282', '7');
INSERT INTO `bcnm_loot` VALUES ('11', '887', '141', '8');
INSERT INTO `bcnm_loot` VALUES ('11', '1132', '14', '8');
INSERT INTO `bcnm_loot` VALUES ('11', '902', '113', '8');
INSERT INTO `bcnm_loot` VALUES ('11', '737', '28', '8');
INSERT INTO `bcnm_loot` VALUES ('11', '644', '85', '8');
INSERT INTO `bcnm_loot` VALUES ('11', '4174', '56', '8');
INSERT INTO `bcnm_loot` VALUES ('11', '895', '28', '8');
INSERT INTO `bcnm_loot` VALUES ('11', '703', '296', '8');
INSERT INTO `bcnm_loot` VALUES ('11', '738', '14', '8');
INSERT INTO `bcnm_loot` VALUES ('11', '700', '56', '8');
INSERT INTO `bcnm_loot` VALUES ('11', '866', '70', '8');
INSERT INTO `bcnm_loot` VALUES ('11', '1465', '42', '8');
INSERT INTO `bcnm_loot` VALUES ('11', '645', '42', '8');
INSERT INTO `bcnm_loot` VALUES ('11', '702', '42', '8');
INSERT INTO `bcnm_loot` VALUES ('11', '4173', '42', '8');
INSERT INTO `bcnm_loot` VALUES ('11', '823', '113', '8');
INSERT INTO `bcnm_loot` VALUES ('11', '830', '28', '8');
INSERT INTO `bcnm_loot` VALUES ('11', '1132', '127', '9');
INSERT INTO `bcnm_loot` VALUES ('11', '837', '56', '9');
INSERT INTO `bcnm_loot` VALUES ('11', '942', '225', '9');
INSERT INTO `bcnm_loot` VALUES ('11', '844', '423', '9');
INSERT INTO `bcnm_loot` VALUES ('11', '836', '70', '9');
INSERT INTO `bcnm_loot` VALUES ('11', '658', '42', '9');
INSERT INTO `bcnm_loot` VALUES ('11', '1110', '85', '9');
INSERT INTO `bcnm_loot` VALUES ('11', '703', '563', '10');
INSERT INTO `bcnm_loot` VALUES ('11', '1446', '296', '10');
INSERT INTO `bcnm_loot` VALUES ('11', '831', '14', '10');
INSERT INTO `bcnm_loot` VALUES ('11', '722', '141', '10');
INSERT INTO `bcnm_loot` VALUES ('15', '18378', '222', '0');
INSERT INTO `bcnm_loot` VALUES ('15', '17699', '302', '0');
INSERT INTO `bcnm_loot` VALUES ('15', '17509', '245', '0');
INSERT INTO `bcnm_loot` VALUES ('15', '18005', '208', '0');
INSERT INTO `bcnm_loot` VALUES ('15', '1133', '0', '1'); -- Yes "0" on ffxiclopedia
INSERT INTO `bcnm_loot` VALUES ('15', '4486', '176', '1');
INSERT INTO `bcnm_loot` VALUES ('15', '4272', '176', '1');
INSERT INTO `bcnm_loot` VALUES ('15', '19026', '354', '2');
INSERT INTO `bcnm_loot` VALUES ('15', '19024', '165', '2');
INSERT INTO `bcnm_loot` VALUES ('15', '19025', '89', '2');
INSERT INTO `bcnm_loot` VALUES ('15', '14764', '586', '3');
INSERT INTO `bcnm_loot` VALUES ('15', '655', '184', '3');
INSERT INTO `bcnm_loot` VALUES ('15', '747', '207', '3');
INSERT INTO `bcnm_loot` VALUES ('15', '17842', '238', '4');
INSERT INTO `bcnm_loot` VALUES ('15', '14762', '250', '4');
INSERT INTO `bcnm_loot` VALUES ('15', '17700', '225', '4');
INSERT INTO `bcnm_loot` VALUES ('15', '18006', '275', '4');
INSERT INTO `bcnm_loot` VALUES ('15', '737', '122', '5');
INSERT INTO `bcnm_loot` VALUES ('15', '4172', '54', '5');
INSERT INTO `bcnm_loot` VALUES ('15', '644', '41', '5');
INSERT INTO `bcnm_loot` VALUES ('15', '902', '81', '5');
INSERT INTO `bcnm_loot` VALUES ('15', '702', '149', '5');
INSERT INTO `bcnm_loot` VALUES ('15', '866', '54', '5');
INSERT INTO `bcnm_loot` VALUES ('15', '4175', '27', '5');
INSERT INTO `bcnm_loot` VALUES ('15', '700', '41', '5');
INSERT INTO `bcnm_loot` VALUES ('15', '887', '95', '5');
INSERT INTO `bcnm_loot` VALUES ('15', '703', '108', '5');
INSERT INTO `bcnm_loot` VALUES ('15', '844', '135', '5');
INSERT INTO `bcnm_loot` VALUES ('15', '738', '54', '5');
INSERT INTO `bcnm_loot` VALUES ('15', '895', '14', '5');
INSERT INTO `bcnm_loot` VALUES ('15', '830', '14', '5');
INSERT INTO `bcnm_loot` VALUES ('15', '645', '68', '5');
INSERT INTO `bcnm_loot` VALUES ('15', '4173', '14', '5');
INSERT INTO `bcnm_loot` VALUES ('15', '1132', '135', '5');
INSERT INTO `bcnm_loot` VALUES ('15', '836', '96', '6');
INSERT INTO `bcnm_loot` VALUES ('15', '658', '27', '6');
INSERT INTO `bcnm_loot` VALUES ('15', '942', '164', '6');
INSERT INTO `bcnm_loot` VALUES ('15', '844', '260', '6');
INSERT INTO `bcnm_loot` VALUES ('15', '837', '96', '6');
INSERT INTO `bcnm_loot` VALUES ('15', '1132', '288', '6');
INSERT INTO `bcnm_loot` VALUES ('15', '1110', '41', '6');
INSERT INTO `bcnm_loot` VALUES ('17', '837', '1000', '0');
INSERT INTO `bcnm_loot` VALUES ('17', '17827', '217', '1');
INSERT INTO `bcnm_loot` VALUES ('17', '17451', '174', '1');
INSERT INTO `bcnm_loot` VALUES ('17', '17793', '333', '1');
INSERT INTO `bcnm_loot` VALUES ('17', '17589', '174', '1');
INSERT INTO `bcnm_loot` VALUES ('17', '13402', '101', '2');
INSERT INTO `bcnm_loot` VALUES ('17', '19027', '43', '2');
INSERT INTO `bcnm_loot` VALUES ('17', '920', '275', '2');
INSERT INTO `bcnm_loot` VALUES ('17', '1013', '275', '2');
INSERT INTO `bcnm_loot` VALUES ('17', '19025', '203', '2');
INSERT INTO `bcnm_loot` VALUES ('17', '19026', '116', '2');
INSERT INTO `bcnm_loot` VALUES ('17', '655', '159', '3');
INSERT INTO `bcnm_loot` VALUES ('17', '747', '290', '3');
INSERT INTO `bcnm_loot` VALUES ('17', '13182', '406', '3');
INSERT INTO `bcnm_loot` VALUES ('17', '15325', '159', '4');
INSERT INTO `bcnm_loot` VALUES ('17', '14872', '217', '4');
INSERT INTO `bcnm_loot` VALUES ('17', '15181', '145', '4');
INSERT INTO `bcnm_loot` VALUES ('17', '15387', '159', '4');
INSERT INTO `bcnm_loot` VALUES ('17', '887', '101', '5');
INSERT INTO `bcnm_loot` VALUES ('17', '645', '29', '5');
INSERT INTO `bcnm_loot` VALUES ('17', '902', '29', '5');
INSERT INTO `bcnm_loot` VALUES ('17', '702', '29', '5');
INSERT INTO `bcnm_loot` VALUES ('17', '737', '101', '5');
INSERT INTO `bcnm_loot` VALUES ('17', '823', '29', '5');
INSERT INTO `bcnm_loot` VALUES ('17', '1465', '29', '5');
INSERT INTO `bcnm_loot` VALUES ('17', '700', '43', '5');
INSERT INTO `bcnm_loot` VALUES ('17', '644', '29', '5');
INSERT INTO `bcnm_loot` VALUES ('17', '703', '58', '5');
INSERT INTO `bcnm_loot` VALUES ('17', '738', '14', '5');
INSERT INTO `bcnm_loot` VALUES ('17', '830', '58', '5');
INSERT INTO `bcnm_loot` VALUES ('17', '895', '14', '5');
INSERT INTO `bcnm_loot` VALUES ('17', '4174', '58', '5');
INSERT INTO `bcnm_loot` VALUES ('17', '4175', '29', '5');
INSERT INTO `bcnm_loot` VALUES ('17', '866', '72', '5');
INSERT INTO `bcnm_loot` VALUES ('17', '1110', '87', '6');
INSERT INTO `bcnm_loot` VALUES ('17', '658', '14', '6');
INSERT INTO `bcnm_loot` VALUES ('17', '836', '29', '6');
INSERT INTO `bcnm_loot` VALUES ('17', '837', '43', '6');
INSERT INTO `bcnm_loot` VALUES ('17', '942', '174', '6');
INSERT INTO `bcnm_loot` VALUES ('17', '844', '246', '6');
INSERT INTO `bcnm_loot` VALUES ('17', '1132', '159', '6');
INSERT INTO `bcnm_loot` VALUES ('79', '793', '1000', '0');
INSERT INTO `bcnm_loot` VALUES ('79', '792', '1000', '1');
INSERT INTO `bcnm_loot` VALUES ('79', '1311', '1000', '2');
INSERT INTO `bcnm_loot` VALUES ('79', '14666', '447', '3');
INSERT INTO `bcnm_loot` VALUES ('79', '14662', '487', '3');
INSERT INTO `bcnm_loot` VALUES ('79', '13175', '494', '4');
INSERT INTO `bcnm_loot` VALUES ('79', '13176', '449', '4');
INSERT INTO `bcnm_loot` VALUES ('79', '791', '51', '5');
INSERT INTO `bcnm_loot` VALUES ('79', '801', '32', '5');
INSERT INTO `bcnm_loot` VALUES ('79', '654', '39', '5');
INSERT INTO `bcnm_loot` VALUES ('79', '702', '21', '5');
INSERT INTO `bcnm_loot` VALUES ('79', '4173', '32', '5');
INSERT INTO `bcnm_loot` VALUES ('79', '745', '55', '5');
INSERT INTO `bcnm_loot` VALUES ('79', '784', '62', '5');
INSERT INTO `bcnm_loot` VALUES ('79', '653', '81', '5');
INSERT INTO `bcnm_loot` VALUES ('79', '802', '56', '5');
INSERT INTO `bcnm_loot` VALUES ('79', '797', '195', '5');
INSERT INTO `bcnm_loot` VALUES ('79', '652', '58', '5');
INSERT INTO `bcnm_loot` VALUES ('79', '803', '38', '5');
INSERT INTO `bcnm_loot` VALUES ('79', '773', '11', '5');
INSERT INTO `bcnm_loot` VALUES ('79', '4175', '21', '5');
INSERT INTO `bcnm_loot` VALUES ('79', '771', '15', '5');
INSERT INTO `bcnm_loot` VALUES ('79', '805', '26', '5');
INSERT INTO `bcnm_loot` VALUES ('79', '769', '21', '5');
INSERT INTO `bcnm_loot` VALUES ('79', '700', '17', '5');
INSERT INTO `bcnm_loot` VALUES ('79', '770', '9', '5');
INSERT INTO `bcnm_loot` VALUES ('79', '810', '62', '5');
INSERT INTO `bcnm_loot` VALUES ('79', '774', '11', '5');
INSERT INTO `bcnm_loot` VALUES ('79', '775', '11', '5');
INSERT INTO `bcnm_loot` VALUES ('79', '772', '11', '5');
INSERT INTO `bcnm_loot` VALUES ('79', '776', '9', '5');
INSERT INTO `bcnm_loot` VALUES ('79', '15185', '55', '6');
INSERT INTO `bcnm_loot` VALUES ('79', '17440', '13', '5');
INSERT INTO `bcnm_loot` VALUES ('35', '852', '1000', '0');
INSERT INTO `bcnm_loot` VALUES ('35', '13014', '79', '1');
INSERT INTO `bcnm_loot` VALUES ('35', '0', '950', '1');
INSERT INTO `bcnm_loot` VALUES ('35', '15282', '53', '2');
INSERT INTO `bcnm_loot` VALUES ('35', '15275', '79', '2');
INSERT INTO `bcnm_loot` VALUES ('35', '15278', '157', '2');
INSERT INTO `bcnm_loot` VALUES ('35', '694', '184', '2');
INSERT INTO `bcnm_loot` VALUES ('35', '690', '368', '2');
INSERT INTO `bcnm_loot` VALUES ('35', '652', '79', '2');
INSERT INTO `bcnm_loot` VALUES ('35', '0', '600', '3');
INSERT INTO `bcnm_loot` VALUES ('35', '15282', '53', '3');
INSERT INTO `bcnm_loot` VALUES ('35', '15275', '79', '3');
INSERT INTO `bcnm_loot` VALUES ('35', '15278', '157', '3');
INSERT INTO `bcnm_loot` VALUES ('35', '694', '184', '3');
INSERT INTO `bcnm_loot` VALUES ('35', '690', '368', '3');
INSERT INTO `bcnm_loot` VALUES ('35', '652', '79', '3');
INSERT INTO `bcnm_loot` VALUES ('35', '15285', '105', '4');
INSERT INTO `bcnm_loot` VALUES ('35', '15279', '105', '4');
INSERT INTO `bcnm_loot` VALUES ('35', '651', '131', '4');
INSERT INTO `bcnm_loot` VALUES ('35', '643', '131', '4');
INSERT INTO `bcnm_loot` VALUES ('35', '644', '79', '4');
INSERT INTO `bcnm_loot` VALUES ('35', '736', '79', '4');
INSERT INTO `bcnm_loot` VALUES ('35', '795', '131', '4');
INSERT INTO `bcnm_loot` VALUES ('35', '17867', '552', '5');
INSERT INTO `bcnm_loot` VALUES ('35', '4877', '263', '5');
INSERT INTO `bcnm_loot` VALUES ('35', '4878', '210', '5');
INSERT INTO `bcnm_loot` VALUES ('35', '4876', '289', '5');
INSERT INTO `bcnm_loot` VALUES ('35', '4868', '105', '5');
INSERT INTO `bcnm_loot` VALUES ('35', '4751', '79', '5');
INSERT INTO `bcnm_loot` VALUES ('35', '5070', '421', '5');
INSERT INTO `bcnm_loot` VALUES ('35', '4947', '79', '5');
INSERT INTO `bcnm_loot` VALUES ('35', '15271', '552', '6');
INSERT INTO `bcnm_loot` VALUES ('35', '15272', '131', '6');
INSERT INTO `bcnm_loot` VALUES ('35', '809', '0', '6'); -- yes 0%
INSERT INTO `bcnm_loot` VALUES ('35', '15276', '79', '6');
INSERT INTO `bcnm_loot` VALUES ('35', '645', '105', '6');
INSERT INTO `bcnm_loot` VALUES ('35', '15281', '26', '6');
INSERT INTO `bcnm_loot` VALUES ('35', '4132', '184', '6');
INSERT INTO `bcnm_loot` VALUES ('35', '796', '79', '6');
INSERT INTO `bcnm_loot` VALUES ('35', '15273', '157', '6');
INSERT INTO `bcnm_loot` VALUES ('35', '653', '210', '6');
INSERT INTO `bcnm_loot` VALUES ('35', '799', '26', '6');
INSERT INTO `bcnm_loot` VALUES ('35', '15283', '263', '6');
INSERT INTO `bcnm_loot` VALUES ('35', '15277', '105', '6');
INSERT INTO `bcnm_loot` VALUES ('35', '15280', '105', '6');
INSERT INTO `bcnm_loot` VALUES ('35', '15274', '131', '6');
INSERT INTO `bcnm_loot` VALUES ('35', '744', '79', '6');
INSERT INTO `bcnm_loot` VALUES ('35', '806', '131', '6');
INSERT INTO `bcnm_loot` VALUES ('35', '0', '600', '6');
INSERT INTO `bcnm_loot` VALUES ('35', '15271', '552', '7');
INSERT INTO `bcnm_loot` VALUES ('35', '15272', '131', '7');
INSERT INTO `bcnm_loot` VALUES ('35', '809', '0', '7'); -- yes 0%
INSERT INTO `bcnm_loot` VALUES ('35', '15276', '79', '7');
INSERT INTO `bcnm_loot` VALUES ('35', '645', '105', '7');
INSERT INTO `bcnm_loot` VALUES ('35', '15281', '26', '7');
INSERT INTO `bcnm_loot` VALUES ('35', '4132', '184', '7');
INSERT INTO `bcnm_loot` VALUES ('35', '796', '79', '7');
INSERT INTO `bcnm_loot` VALUES ('35', '15273', '157', '7');
INSERT INTO `bcnm_loot` VALUES ('35', '653', '210', '7');
INSERT INTO `bcnm_loot` VALUES ('35', '799', '26', '7');
INSERT INTO `bcnm_loot` VALUES ('35', '15283', '263', '7');
INSERT INTO `bcnm_loot` VALUES ('35', '15277', '105', '7');
INSERT INTO `bcnm_loot` VALUES ('35', '15280', '105', '7');
INSERT INTO `bcnm_loot` VALUES ('35', '15274', '131', '7');
INSERT INTO `bcnm_loot` VALUES ('35', '744', '79', '7');
INSERT INTO `bcnm_loot` VALUES ('35', '806', '131', '7');
INSERT INTO `bcnm_loot` VALUES ('35', '0', '600', '7');
-- limbus                      lootID,ItemID,Roll,lootgroup
-- SE Appollyon first floor
INSERT INTO `bcnm_loot` VALUES ('110', '1875', '1000', '0'); -- ancient beastcoin*4
INSERT INTO `bcnm_loot` VALUES ('110', '1875', '1000', '1'); 
INSERT INTO `bcnm_loot` VALUES ('110', '1875', '1000', '2'); 
INSERT INTO `bcnm_loot` VALUES ('110', '1875', '1000', '3'); 
INSERT INTO `bcnm_loot` VALUES ('110', '1939', '350', '4'); --  RDM,
INSERT INTO `bcnm_loot` VALUES ('110', '1941', '278', '4'); --  THF,
INSERT INTO `bcnm_loot` VALUES ('110', '1959', '174', '4'); --   SMN,
INSERT INTO `bcnm_loot` VALUES ('110', '1949', '200', '4');  --  BRD
INSERT INTO `bcnm_loot` VALUES ('110', '1945', '47', '5');  --  DRK,
INSERT INTO `bcnm_loot` VALUES ('110', '1951', '49', '5');  --  RNG,
INSERT INTO `bcnm_loot` VALUES ('110', '1955', '200', '5');  --  NIN,
INSERT INTO `bcnm_loot` VALUES ('110', '2659', '62', '5');  --  COR,
INSERT INTO `bcnm_loot` VALUES ('110', '2715', '407', '5');  --  DNC
-- -------------------------------------
-- SE Appollyon Second floor
-- -------------------------------------
INSERT INTO `bcnm_loot` VALUES ('111', '1875', '1000', '0'); -- ancient beastcoin*4
INSERT INTO `bcnm_loot` VALUES ('111', '1875', '1000', '1'); 
INSERT INTO `bcnm_loot` VALUES ('111', '1875', '1000', '2'); 
INSERT INTO `bcnm_loot` VALUES ('111', '1875', '1000', '3'); 
INSERT INTO `bcnm_loot` VALUES ('111', '1959', '47', '4'); --   SMN,
INSERT INTO `bcnm_loot` VALUES ('111', '1949', '30', '4');  --  BRD
INSERT INTO `bcnm_loot` VALUES ('111', '1943', '200', '4'); -- PLD,
INSERT INTO `bcnm_loot` VALUES ('111', '1947', '460', '4'); --  BST,
INSERT INTO `bcnm_loot` VALUES ('111', '2661', '400', '4'); --  PUP
INSERT INTO `bcnm_loot` VALUES ('111', '1951', '20', '5');  --  RNG,
INSERT INTO `bcnm_loot` VALUES ('111', '1955', '80', '5');  --  NIN,
INSERT INTO `bcnm_loot` VALUES ('111', '1945', '90', '5');  --  DRK,
INSERT INTO `bcnm_loot` VALUES ('111', '2659', '100', '5');  --  COR,
INSERT INTO `bcnm_loot` VALUES ('111', '2715', '120', '5');  --  DNC
-- SE Appollyon Third floor
-- -------------------------------------
INSERT INTO `bcnm_loot` VALUES ('112', '1875', '1000', '0'); -- ancient beastcoin*4
INSERT INTO `bcnm_loot` VALUES ('112', '1875', '1000', '1'); 
INSERT INTO `bcnm_loot` VALUES ('112', '1875', '1000', '2'); 
INSERT INTO `bcnm_loot` VALUES ('112', '1875', '1000', '3'); 
INSERT INTO `bcnm_loot` VALUES ('112', '1955', '59', '4');  --  NIN,
INSERT INTO `bcnm_loot` VALUES ('112', '1959', '139', '4'); --   SMN,
INSERT INTO `bcnm_loot` VALUES ('112', '1949', '39', '4');  --  BRD
INSERT INTO `bcnm_loot` VALUES ('112', '1681', '39', '4'); --   Light Steel 
INSERT INTO `bcnm_loot` VALUES ('112', '645', '39', '4');  --  Darksteel Ore
INSERT INTO `bcnm_loot` VALUES ('112', '1933', '627', '4'); --  MNK,
INSERT INTO `bcnm_loot` VALUES ('112', '1954', '159', '5');  --  DRK,
INSERT INTO `bcnm_loot` VALUES ('112', '1951', '139', '5');  --  RNG,
INSERT INTO `bcnm_loot` VALUES ('112', '2659', '39', '5');  --  COR,
INSERT INTO `bcnm_loot` VALUES ('112', '664', '20', '5');  --  Darksteel Sheet
INSERT INTO `bcnm_loot` VALUES ('112', '646', '20', '5');  --   Adaman Ore
INSERT INTO `bcnm_loot` VALUES ('112', '1931', '200', '5'); --  WAR,
-- ---SE Appollyon fourth floor-------------------------
INSERT INTO `bcnm_loot` VALUES ('113', '1875', '1000', '0'); -- ancient beastcoin*5
INSERT INTO `bcnm_loot` VALUES ('113', '1875', '1000', '1'); 
INSERT INTO `bcnm_loot` VALUES ('113', '1875', '1000', '2'); 
INSERT INTO `bcnm_loot` VALUES ('113', '1875', '1000', '3'); 
INSERT INTO `bcnm_loot` VALUES ('113', '1875', '1000', '4'); 
INSERT INTO `bcnm_loot` VALUES ('113', '1935', '220', '5'); --  WHM,
INSERT INTO `bcnm_loot` VALUES ('113', '1937', '300', '5'); -- BLM, 
INSERT INTO `bcnm_loot` VALUES ('113', '1957', '260', '5'); --  DRG, 
INSERT INTO `bcnm_loot` VALUES ('113', '1953', '340', '5');  --  SAM,
INSERT INTO `bcnm_loot` VALUES ('113', '2657', '220', '6');  --  BLU,
INSERT INTO `bcnm_loot` VALUES ('113', '2717', '180', '6');  --  SCH
INSERT INTO `bcnm_loot` VALUES ('113', '1931', '300', '6');  -- WAR,
INSERT INTO `bcnm_loot` VALUES ('113', '1909', '1000', '7'); --  Smalt Chip,
INSERT INTO `bcnm_loot` VALUES ('113', '2127', '59', '8');  --  metal chip
INSERT INTO `bcnm_loot` VALUES ('113', '1875', '100', '8'); 
--  ----NE APOLLYON FIRST FLOOR ----------------------------
INSERT INTO `bcnm_loot` VALUES ('114', '1875', '1000', '0');
INSERT INTO `bcnm_loot` VALUES ('114', '1875', '1000', '1');
INSERT INTO `bcnm_loot` VALUES ('114', '1875', '1000', '2');
INSERT INTO `bcnm_loot` VALUES ('114', '1875', '1000', '3');

INSERT INTO `bcnm_loot` VALUES ('114', '1953', '304', '4'); -- SAM,
INSERT INTO `bcnm_loot` VALUES ('114', '1943', '18', '4'); --  PLD,
INSERT INTO `bcnm_loot` VALUES ('114', '1941', '200', '4'); -- THF,
INSERT INTO `bcnm_loot` VALUES ('114', '2715', '200', '4'); -- DNC
INSERT INTO `bcnm_loot` VALUES ('114', '2661', '36', '4'); -- PUP

INSERT INTO `bcnm_loot` VALUES ('114', '1933', '18', '5'); -- MNK, 
INSERT INTO `bcnm_loot` VALUES ('114', '1939', '36', '5'); -- RDM,
INSERT INTO `bcnm_loot` VALUES ('114', '1935', '411', '5'); -- WHM,
INSERT INTO `bcnm_loot` VALUES ('114', '2717', '482', '5'); --  SCH,
INSERT INTO `bcnm_loot` VALUES ('114', '1947', '18', '5'); -- BST,

--  ----NE APOLLYON SECOND FLOOR ----------------------------
INSERT INTO `bcnm_loot` VALUES ('115', '1875', '1000', '0');
INSERT INTO `bcnm_loot` VALUES ('115', '1875', '1000', '1');
INSERT INTO `bcnm_loot` VALUES ('115', '1875', '1000', '2');
INSERT INTO `bcnm_loot` VALUES ('115', '1875', '1000', '3');

INSERT INTO `bcnm_loot` VALUES ('115', '1947', '26', '4'); -- BST,
INSERT INTO `bcnm_loot` VALUES ('115', '1933', '53', '4'); -- MNK, 
INSERT INTO `bcnm_loot` VALUES ('115', '1943', '26', '4'); -- PLD,
INSERT INTO `bcnm_loot` VALUES ('115', '2661', '26', '4'); -- PUP
INSERT INTO `bcnm_loot` VALUES ('115', '1937', '395', '4'); -- BLM

INSERT INTO `bcnm_loot` VALUES ('115', '1957', '289', '5'); -- DRG,
INSERT INTO `bcnm_loot` VALUES ('115', '1941', '53', '5'); -- THF,
INSERT INTO `bcnm_loot` VALUES ('115', '1939', '112', '5'); -- RDM
INSERT INTO `bcnm_loot` VALUES ('115', '2657', '477', '5'); -- BLU,

--  ----NE APOLLYON thIRd FLOOR ----------------------------
INSERT INTO `bcnm_loot` VALUES ('116', '1875', '1000', '0');
INSERT INTO `bcnm_loot` VALUES ('116', '1875', '1000', '1');
INSERT INTO `bcnm_loot` VALUES ('116', '1875', '1000', '2');
INSERT INTO `bcnm_loot` VALUES ('116', '1875', '1000', '3');

INSERT INTO `bcnm_loot` VALUES ('116', '1931', '788', '4'); -- WAR,
INSERT INTO `bcnm_loot` VALUES ('116', '1939', '30', '4'); -- RDM,
INSERT INTO `bcnm_loot` VALUES ('116', '1953', '130', '4'); -- SAM,
INSERT INTO `bcnm_loot` VALUES ('116', '1957', '100', '4'); --  DRG
INSERT INTO `bcnm_loot` VALUES ('116', '1947', '90', '4'); -- BST,

INSERT INTO `bcnm_loot` VALUES ('116', '1933', '30', '5'); -- MNK,
INSERT INTO `bcnm_loot` VALUES ('116', '1941', '99', '5'); -- THF
INSERT INTO `bcnm_loot` VALUES ('116', '2661', '61', '5'); -- PUP
INSERT INTO `bcnm_loot` VALUES ('116', '2715', '30', '5'); -- DNC
INSERT INTO `bcnm_loot` VALUES ('116', '1943', '160', '5'); -- PLD

INSERT INTO `bcnm_loot` VALUES ('116', '1633', '30', '6'); -- Clot Plasma
INSERT INTO `bcnm_loot` VALUES ('116', '821', '40', '6'); -- Rainbow Thread

INSERT INTO `bcnm_loot` VALUES ('116', '1311', '50', '7'); -- Oxblood
INSERT INTO `bcnm_loot` VALUES ('116', '1883', '40', '7'); -- Shell Powder
INSERT INTO `bcnm_loot` VALUES ('116', '2004', '20', '7'); -- Carapace Powder

--  ----NE APOLLYON FOURTH FLOOR ----------------------------
INSERT INTO `bcnm_loot` VALUES ('117', '1875', '1000', '0');
INSERT INTO `bcnm_loot` VALUES ('117', '1875', '1000', '1');
INSERT INTO `bcnm_loot` VALUES ('117', '1875', '1000', '2');
INSERT INTO `bcnm_loot` VALUES ('117', '1875', '1000', '3');
INSERT INTO `bcnm_loot` VALUES ('117', '1875', '1000', '4');
INSERT INTO `bcnm_loot` VALUES ('117', '1875', '1000', '5');

INSERT INTO `bcnm_loot` VALUES ('117', '1949', '326', '6'); -- BRD
INSERT INTO `bcnm_loot` VALUES ('117', '1954', '256', '6'); -- DRK
INSERT INTO `bcnm_loot` VALUES ('117', '1951', '395', '6'); -- RNG

INSERT INTO `bcnm_loot` VALUES ('117', '1959', '279', '7'); -- SMN
INSERT INTO `bcnm_loot` VALUES ('117', '1955', '256', '7'); -- NIN
INSERT INTO `bcnm_loot` VALUES ('117', '2659', '326', '7'); -- COR

--  ----NE APOLLYON FIVE FLOOR ----------------------------
INSERT INTO `bcnm_loot` VALUES ('118', '1875', '1000', '0');
INSERT INTO `bcnm_loot` VALUES ('118', '1875', '1000', '1');
INSERT INTO `bcnm_loot` VALUES ('118', '1875', '1000', '2');
INSERT INTO `bcnm_loot` VALUES ('118', '1875', '1000', '3');
INSERT INTO `bcnm_loot` VALUES ('118', '1875', '1000', '4');
INSERT INTO `bcnm_loot` VALUES ('118', '1875', '1000', '5');
INSERT INTO `bcnm_loot` VALUES ('118', '1875', '1000', '6');
INSERT INTO `bcnm_loot` VALUES ('118', '1875', '100', '7');
INSERT INTO `bcnm_loot` VALUES ('118', '2127', '59', '7'); -- Metal Chip. 
INSERT INTO `bcnm_loot` VALUES ('118', '1910', '1000', '8'); -- Smoky Chip.

--  ----SW APOLLYON FIRST FLOOR ----------------------------
INSERT INTO `bcnm_loot` VALUES ('119', '1875', '1000', '0');
INSERT INTO `bcnm_loot` VALUES ('119', '1875', '1000', '1');
INSERT INTO `bcnm_loot` VALUES ('119', '1875', '1000', '2');
INSERT INTO `bcnm_loot` VALUES ('119', '1875', '1000', '3');

INSERT INTO `bcnm_loot` VALUES ('119', '1949', '464', '4');-- BRD
INSERT INTO `bcnm_loot` VALUES ('119', '1954', '250', '4');-- DRK 
INSERT INTO `bcnm_loot` VALUES ('119', '1953', '110', '4');-- SAM 
INSERT INTO `bcnm_loot` VALUES ('119', '1937', '71', '4');-- BLM 

INSERT INTO `bcnm_loot` VALUES ('119', '1931', '180', '5');-- WAR
INSERT INTO `bcnm_loot` VALUES ('119', '2657', '210', '5');-- BLU
INSERT INTO `bcnm_loot` VALUES ('119', '2717', '111', '5');-- SCH
INSERT INTO `bcnm_loot` VALUES ('119', '1935', '107', '5');-- WHM

--  ----SW APOLLYON SECOND FLOOR ----------------------------
INSERT INTO `bcnm_loot` VALUES ('120', '1875', '1000', '0');
INSERT INTO `bcnm_loot` VALUES ('120', '1875', '1000', '1');
INSERT INTO `bcnm_loot` VALUES ('120', '1875', '1000', '2');
INSERT INTO `bcnm_loot` VALUES ('120', '1875', '1000', '3');

INSERT INTO `bcnm_loot` VALUES ('120', '1951', '154', '4');-- RNG
INSERT INTO `bcnm_loot` VALUES ('120', '1935', '95', '4');-- WHM
INSERT INTO `bcnm_loot` VALUES ('120', '1959', '269', '4');-- SMN

INSERT INTO `bcnm_loot` VALUES ('120', '1937', '106', '5');-- BLM
INSERT INTO `bcnm_loot` VALUES ('120', '1931', '77', '5');-- WAR
INSERT INTO `bcnm_loot` VALUES ('120', '2659', '423', '5');-- COR
INSERT INTO `bcnm_loot` VALUES ('120', '1957', '110', '5');-- DRG

--  ----SW APOLLYON THIRD FLOOR ----------------------------
INSERT INTO `bcnm_loot` VALUES ('121', '1875', '1000', '0');
INSERT INTO `bcnm_loot` VALUES ('121', '1875', '1000', '1');
INSERT INTO `bcnm_loot` VALUES ('121', '1875', '1000', '2');
INSERT INTO `bcnm_loot` VALUES ('121', '1875', '1000', '3');


INSERT INTO `bcnm_loot` VALUES ('121', '1955', '595', '4');-- NIN
INSERT INTO `bcnm_loot` VALUES ('121', '1957', '100', '4');-- DRG
INSERT INTO `bcnm_loot` VALUES ('121', '1937', '24', '4');-- BLM
INSERT INTO `bcnm_loot` VALUES ('121', '1953', '48', '4');-- SAM

INSERT INTO `bcnm_loot` VALUES ('121', '1931', '120', '5');-- WAR
INSERT INTO `bcnm_loot` VALUES ('121', '1953', '48', '5');-- SAM
INSERT INTO `bcnm_loot` VALUES ('121', '1935', '24', '5');-- WHM
INSERT INTO `bcnm_loot` VALUES ('121', '2657', '24', '5');-- BLU
INSERT INTO `bcnm_loot` VALUES ('121', '2717', '71', '5');-- SCH

INSERT INTO `bcnm_loot` VALUES ('121', '1311', '32', '6');-- Oxblood
INSERT INTO `bcnm_loot` VALUES ('121', '1883', '40', '6');-- Shell Powder
INSERT INTO `bcnm_loot` VALUES ('121', '1681', '31', '6');-- Light Steel
INSERT INTO `bcnm_loot` VALUES ('121', '1633', '71', '6');-- Clot Plasma
INSERT INTO `bcnm_loot` VALUES ('121', '645', '31', '6');-- Darksteel Ore
INSERT INTO `bcnm_loot` VALUES ('121', '664', '63', '6');-- Darksteel Sheet
INSERT INTO `bcnm_loot` VALUES ('121', '646', '31', '6');-- Adaman Ore
INSERT INTO `bcnm_loot` VALUES ('121', '821', '63', '6');-- Rainbow Thread

--  ----SW APOLLYON Fourth FLOOR ----------------------------
INSERT INTO `bcnm_loot` VALUES ('122', '1875', '1000', '0');
INSERT INTO `bcnm_loot` VALUES ('122', '1875', '1000', '1');
INSERT INTO `bcnm_loot` VALUES ('122', '1875', '1000', '2');
INSERT INTO `bcnm_loot` VALUES ('122', '1875', '1000', '3');
INSERT INTO `bcnm_loot` VALUES ('122', '1875', '1000', '4');

INSERT INTO `bcnm_loot` VALUES ('122', '1941', '468', '5');-- THF
INSERT INTO `bcnm_loot` VALUES ('122', '1947', '340', '5');-- BST 
INSERT INTO `bcnm_loot` VALUES ('122', '1933', '255', '5');-- MNK
INSERT INTO `bcnm_loot` VALUES ('122', '1939', '191', '5');-- RDM

INSERT INTO `bcnm_loot` VALUES ('122', '1943', '170', '6');-- PLD 
INSERT INTO `bcnm_loot` VALUES ('122', '2661', '340', '6');-- PUP
INSERT INTO `bcnm_loot` VALUES ('122', '2715', '170', '6');-- DNC

INSERT INTO `bcnm_loot` VALUES ('122', '1987', '1000', '7');-- Charcoal Chip
INSERT INTO `bcnm_loot` VALUES ('122', '2127', '59', '8');-- Metal Chip
INSERT INTO `bcnm_loot` VALUES ('122', '1875', '100', '8');
--  ----NW APOLLYON FIRST FLOOR ----------------------------
INSERT INTO `bcnm_loot` VALUES ('123', '1875', '1000', '0');
INSERT INTO `bcnm_loot` VALUES ('123', '1875', '1000', '1');
INSERT INTO `bcnm_loot` VALUES ('123', '1937', '25', '2');--  BLM,
INSERT INTO `bcnm_loot` VALUES ('123', '2657', '175', '2');--  BLU,
INSERT INTO `bcnm_loot` VALUES ('123', '1957', '100', '2');--  DRG,
INSERT INTO `bcnm_loot` VALUES ('123', '1943', '25', '2');--  PLD,
INSERT INTO `bcnm_loot` VALUES ('123', '1953', '250', '2');--  SAM,
INSERT INTO `bcnm_loot` VALUES ('123', '2717', '75', '2');--  SCH,
INSERT INTO `bcnm_loot` VALUES ('123', '1931', '225', '2');--  WAR,
INSERT INTO `bcnm_loot` VALUES ('123', '1935', '50', '2');--  WHM
--  ----NW APOLLYON SECOND FLOOR ----------------------------
INSERT INTO `bcnm_loot` VALUES ('124', '1875', '1000', '0');
INSERT INTO `bcnm_loot` VALUES ('124', '1875', '1000', '1');
INSERT INTO `bcnm_loot` VALUES ('124', '1943', '235', '2');--  BRD,
INSERT INTO `bcnm_loot` VALUES ('124', '2659', '59', '2');--  COR,
INSERT INTO `bcnm_loot` VALUES ('124', '1954', '235', '2');--  DRK,
INSERT INTO `bcnm_loot` VALUES ('124', '1955', '147', '2');--  NIN,
INSERT INTO `bcnm_loot` VALUES ('124', '1951', '118', '2');--  RNG,
INSERT INTO `bcnm_loot` VALUES ('124', '1959', '176', '2');--  SMN,
INSERT INTO `bcnm_loot` VALUES ('124', '1935', '110', '2');--  WHM 
--  ----NW APOLLYON THIRD FLOOR ----------------------------
INSERT INTO `bcnm_loot` VALUES ('125', '1875', '1000', '0');
INSERT INTO `bcnm_loot` VALUES ('125', '1875', '1000', '1');
INSERT INTO `bcnm_loot` VALUES ('125', '1875', '1000', '2');
INSERT INTO `bcnm_loot` VALUES ('125', '1875', '1000', '3');
INSERT INTO `bcnm_loot` VALUES ('125', '1875', '1000', '4');
INSERT INTO `bcnm_loot` VALUES ('125', '1947', '133', '5');--  BST,
INSERT INTO `bcnm_loot` VALUES ('125', '1933', '133', '5');--  MNK,
INSERT INTO `bcnm_loot` VALUES ('125', '1943', '133', '5');--  PLD,
INSERT INTO `bcnm_loot` VALUES ('125', '2661', '133', '5');--  PUP,
INSERT INTO `bcnm_loot` VALUES ('125', '1939', '110', '5');--  RDM,
INSERT INTO `bcnm_loot` VALUES ('125', '1941', '400', '5');--  THF,
INSERT INTO `bcnm_loot` VALUES ('125', '646', '50', '6');--  Adaman Ore,
INSERT INTO `bcnm_loot` VALUES ('125', '1633', '50', '6');--  Clot Plasma,
INSERT INTO `bcnm_loot` VALUES ('125', '664', '50', '6');--  Darksteel Sheet,
INSERT INTO `bcnm_loot` VALUES ('125', '645', '50', '6');--  Darksteel Ore,
INSERT INTO `bcnm_loot` VALUES ('125', '1311', '50', '6');--  Oxblood,
INSERT INTO `bcnm_loot` VALUES ('125', '1681', '50', '6');--  Light Steel,
INSERT INTO `bcnm_loot` VALUES ('125', '821', '50', '6');--  Rainbow Thread,
INSERT INTO `bcnm_loot` VALUES ('125', '1883', '50', '6');--  Shell Powder
--  ----NW APOLLYON FOURTH FLOOR ----------------------------
INSERT INTO `bcnm_loot` VALUES ('126', '1875', '1000', '0');
INSERT INTO `bcnm_loot` VALUES ('126', '1875', '1000', '1');
INSERT INTO `bcnm_loot` VALUES ('126', '1875', '1000', '2');
INSERT INTO `bcnm_loot` VALUES ('126', '1875', '1000', '3');
INSERT INTO `bcnm_loot` VALUES ('126', '1875', '1000', '4');
INSERT INTO `bcnm_loot` VALUES ('126', '1875', '1000', '5');
INSERT INTO `bcnm_loot` VALUES ('126', '1875', '1000', '6');
INSERT INTO `bcnm_loot` VALUES ('126', '1875', '1000', '7');
INSERT INTO `bcnm_loot` VALUES ('126', '1937', '80', '8');--  BLM,
INSERT INTO `bcnm_loot` VALUES ('126', '2657', '70', '8');--  BLU,
INSERT INTO `bcnm_loot` VALUES ('126', '1949', '48', '8');--  BRD
INSERT INTO `bcnm_loot` VALUES ('126', '1947', '30', '8');--  BST,
INSERT INTO `bcnm_loot` VALUES ('126', '2659', '25', '8');--  COR,
INSERT INTO `bcnm_loot` VALUES ('126', '1957', '19', '8');--  DRG,
INSERT INTO `bcnm_loot` VALUES ('126', '1954', '48', '8');--  DRK,
INSERT INTO `bcnm_loot` VALUES ('126', '1933', '90', '8');--  MNK,
INSERT INTO `bcnm_loot` VALUES ('126', '1955', '00', '8');--  NIN,
INSERT INTO `bcnm_loot` VALUES ('126', '2661', '48', '8');--  PUP,
INSERT INTO `bcnm_loot` VALUES ('126', '1939', '136', '8');--  RDM,
INSERT INTO `bcnm_loot` VALUES ('126', '1951', '80', '8');--  RNG,
INSERT INTO `bcnm_loot` VALUES ('126', '1953', '110', '8');--  SAM,
INSERT INTO `bcnm_loot` VALUES ('126', '1959', '95', '8');--  SMN,
INSERT INTO `bcnm_loot` VALUES ('126', '2715', '123', '8');--  DNC,
INSERT INTO `bcnm_loot` VALUES ('126', '1935', '48', '8');--  WHM
--  ----NW APOLLYON FIfth FLOOR ----------------------------
INSERT INTO `bcnm_loot` VALUES ('127', '1875', '1000', '0');
INSERT INTO `bcnm_loot` VALUES ('127', '1875', '1000', '1');
INSERT INTO `bcnm_loot` VALUES ('127', '1875', '1000', '2');
INSERT INTO `bcnm_loot` VALUES ('127', '1875', '1000', '3');
INSERT INTO `bcnm_loot` VALUES ('127', '1875', '1000', '4');
INSERT INTO `bcnm_loot` VALUES ('127', '1937', '109', '5');--  BLM,
INSERT INTO `bcnm_loot` VALUES ('127', '2657', '152', '5');--  BLU,
INSERT INTO `bcnm_loot` VALUES ('127', '1949', '283', '5');--  BRD,
INSERT INTO `bcnm_loot` VALUES ('127', '1947', '109', '5');--  BST,
INSERT INTO `bcnm_loot` VALUES ('127', '2659', '65', '5');--  COR,
INSERT INTO `bcnm_loot` VALUES ('127', '2715', '130', '5');--  DNC,
INSERT INTO `bcnm_loot` VALUES ('127', '1957', '65', '6');--  DRG,
INSERT INTO `bcnm_loot` VALUES ('127', '1954', '174', '6');--  DRK,
INSERT INTO `bcnm_loot` VALUES ('127', '1933', '130', '6');--  MNK,
INSERT INTO `bcnm_loot` VALUES ('127', '1955', '196', '6');--  NIN,
INSERT INTO `bcnm_loot` VALUES ('127', '1943', '174', '6');--  PLD,
INSERT INTO `bcnm_loot` VALUES ('127', '2661', '174', '6');--  PUP,
INSERT INTO `bcnm_loot` VALUES ('127', '1939', '109', '6');--  RDM
INSERT INTO `bcnm_loot` VALUES ('127', '1951', '130', '7');--  RNG,
INSERT INTO `bcnm_loot` VALUES ('127', '1953', '304', '7');--  SAM,
INSERT INTO `bcnm_loot` VALUES ('127', '2717', '87', '7');--  SCH,
INSERT INTO `bcnm_loot` VALUES ('127', '1959', '217', '7');--  SMN,
INSERT INTO `bcnm_loot` VALUES ('127', '1941', '174', '7');--  THF,
INSERT INTO `bcnm_loot` VALUES ('127', '1931', '130', '7');--  WAR,
INSERT INTO `bcnm_loot` VALUES ('127', '1935', '109', '7');--  WHM
INSERT INTO `bcnm_loot` VALUES ('127', '1988', '1000', '8');-- magenta-chip
INSERT INTO `bcnm_loot` VALUES ('127', '2127', '59', '9');-- Metal Chip
INSERT INTO `bcnm_loot` VALUES ('127', '1875', '100', '9');
-- ----------  CENTRAL APOLLYON --------------------------------

INSERT INTO `bcnm_loot` VALUES ('128', '1875', '1000', '0');
INSERT INTO `bcnm_loot` VALUES ('128', '1875', '1000', '1');
INSERT INTO `bcnm_loot` VALUES ('128', '1875', '1000', '2');
INSERT INTO `bcnm_loot` VALUES ('128', '1875', '1000', '3');
INSERT INTO `bcnm_loot` VALUES ('128', '1875', '1000', '4');
INSERT INTO `bcnm_loot` VALUES ('128', '1925', '659', '5'); -- Omega's Eye
INSERT INTO `bcnm_loot` VALUES ('128', '1927', '394', '5'); -- Omega's Foreleg
INSERT INTO `bcnm_loot` VALUES ('128', '1928', '388', '5'); -- Omega's Hind Leg
INSERT INTO `bcnm_loot` VALUES ('128', '1929', '404', '5'); -- Omega's Tail

INSERT INTO `bcnm_loot` VALUES ('128', '1928', '394', '6'); -- Omega's Hind Leg
INSERT INTO `bcnm_loot` VALUES ('128', '1929', '402', '6'); -- Omega's Tail
INSERT INTO `bcnm_loot` VALUES ('128', '1925', '659', '6'); -- Omega's Eye
INSERT INTO `bcnm_loot` VALUES ('128', '1927', '383', '6'); -- Omega's Foreleg

INSERT INTO `bcnm_loot` VALUES ('128', '1926', '26.5', '7'); -- Omega's Heart
INSERT INTO `bcnm_loot` VALUES ('128', '1875', '100', '7');
-- -----------------------------------------------------------------

INSERT INTO `bcnm_loot` VALUES ('129', '1933', '9', '0'); -- Ancient Brass (MNK)(0%)
INSERT INTO `bcnm_loot` VALUES ('129', '1931', '53', '0'); -- Argyro Rivet (WAR)(5.3%)
INSERT INTO `bcnm_loot` VALUES ('129', '1959', '6', '0'); -- Astral Leather (SMN)(0.6%)
INSERT INTO `bcnm_loot` VALUES ('129', '1935', '12', '0'); -- Benedict Yarn (WHM)(1.2%)
INSERT INTO `bcnm_loot` VALUES ('129', '1954', '29', '0'); -- Black Rivet (DRK)(2.9%)
INSERT INTO `bcnm_loot` VALUES ('129', '1957', '12', '0'); -- Blue Rivet (DRG)(1.2%)
INSERT INTO `bcnm_loot` VALUES ('129', '1949', '35', '0'); -- Brown Doeskin (BRD)(3.5%)
INSERT INTO `bcnm_loot` VALUES ('129', '2659', '35', '0'); -- Canvas Toile (COR)(3.5%)
INSERT INTO `bcnm_loot` VALUES ('129', '1939', '12', '0'); -- Cardinal Cloth (RDM) (1.2%)
INSERT INTO `bcnm_loot` VALUES ('129', '1951', '12', '0'); -- Charcoal Cotton (RNG) (1.2%)
INSERT INTO `bcnm_loot` VALUES ('129', '2661', '12', '0'); -- Corduroy Cloth (PUP) (1.2%)
INSERT INTO `bcnm_loot` VALUES ('129', '1937', '18', '0'); -- Diabolic Yarn (BLM)(1.8%)
INSERT INTO `bcnm_loot` VALUES ('129', '1955', '29', '0'); -- Ebony Lacquer (NIN) (2.9%)
INSERT INTO `bcnm_loot` VALUES ('129', '2717', '12', '0'); -- Electrum Stud (SCH)(1.2%)
INSERT INTO `bcnm_loot` VALUES ('129', '1947', '12', '0'); -- Fetid Lanolin (BST)(1.2%)
INSERT INTO `bcnm_loot` VALUES ('129', '2657', '18', '0'); -- Flameshun Cloth (BLU)(1.8%)
INSERT INTO `bcnm_loot` VALUES ('129', '2715', '5', '0'); -- Gold Stud (DNC) (0%)
INSERT INTO `bcnm_loot` VALUES ('129', '1953', '35', '0'); -- Kurogane (SAM)(3.5%)
INSERT INTO `bcnm_loot` VALUES ('129', '1941', '41', '0'); -- Light Filament (THF)(4.1%)
INSERT INTO `bcnm_loot` VALUES ('129', '1943', '18', '0'); -- White Rivet (PLD)(1.8%)
INSERT INTO `bcnm_loot` VALUES ('129', '1987', '53', '0'); -- Charcoal Chip (5.3%)
INSERT INTO `bcnm_loot` VALUES ('129', '1988', '76', '0'); -- Magenta Chip (7.6%)
INSERT INTO `bcnm_loot` VALUES ('129', '1909', '64', '0'); -- Smalt Chip (6.4%)
INSERT INTO `bcnm_loot` VALUES ('129', '1910', '41', '0'); -- Smoky Chip (4.1%)
INSERT INTO `bcnm_loot` VALUES ('129', '646', '50', '1');--  Adaman Ore,
INSERT INTO `bcnm_loot` VALUES ('129', '1633', '50', '1');--  Clot Plasma,
INSERT INTO `bcnm_loot` VALUES ('129', '664', '50', '1');--  Darksteel Sheet,
INSERT INTO `bcnm_loot` VALUES ('129', '645', '50', '1');--  Darksteel Ore,
INSERT INTO `bcnm_loot` VALUES ('129', '1311', '50', '1');--  Oxblood,
INSERT INTO `bcnm_loot` VALUES ('129', '1681', '50', '1');--  Light Steel,
INSERT INTO `bcnm_loot` VALUES ('129', '821', '50', '1');--  Rainbow Thread,
INSERT INTO `bcnm_loot` VALUES ('129', '1883', '50', '1');--  Shell Powder

-- ------------------------------------------------------------------------------------



-- Temenos_Northern_Tower --------------------------------------------------------------
-- F1
INSERT INTO `bcnm_loot` VALUES ('130', '1875', '1000', '0');
INSERT INTO `bcnm_loot` VALUES ('130', '1875', '1000', '1');
INSERT INTO `bcnm_loot` VALUES ('130', '1875', '1000', '2');
INSERT INTO `bcnm_loot` VALUES ('130', '1954', '159', '3'); -- NIN 
INSERT INTO `bcnm_loot` VALUES ('130', '1940', '146', '3'); -- THF
INSERT INTO `bcnm_loot` VALUES ('130', '1932', '85', '3'); -- MNK
INSERT INTO `bcnm_loot` VALUES ('130', '1956', '171', '3'); -- DRG
INSERT INTO `bcnm_loot` VALUES ('130', '1934', '110', '3'); -- WHM
INSERT INTO `bcnm_loot` VALUES ('130', '2658', '220', '3'); -- COR 
INSERT INTO `bcnm_loot` VALUES ('130', '2716', '98', '3'); -- SCH

-- F2
INSERT INTO `bcnm_loot` VALUES ('131', '1875', '1000', '0');
INSERT INTO `bcnm_loot` VALUES ('131', '1875', '1000', '1');
INSERT INTO `bcnm_loot` VALUES ('131', '1875', '1000', '2');
INSERT INTO `bcnm_loot` VALUES ('131', '1932', '333', '3'); -- MNK
INSERT INTO `bcnm_loot` VALUES ('131', '1954', '200', '3'); -- NIN
INSERT INTO `bcnm_loot` VALUES ('131', '1950', '100', '3'); -- RNG
INSERT INTO `bcnm_loot` VALUES ('131', '1940', '90', '3'); -- THF
INSERT INTO `bcnm_loot` VALUES ('131', '1942', '70', '3'); -- PLD
INSERT INTO `bcnm_loot` VALUES ('131', '1934', '90', '3'); -- WHM
INSERT INTO `bcnm_loot` VALUES ('131', '1936', '100', '3'); -- BLM
INSERT INTO `bcnm_loot` VALUES ('131', '1958', '90', '3'); -- SMN
INSERT INTO `bcnm_loot` VALUES ('131', '2656', '67', '3'); -- BLU
INSERT INTO `bcnm_loot` VALUES ('131', '1956', '167', '3'); -- DRG

-- F3
INSERT INTO `bcnm_loot` VALUES ('132', '1875', '1000', '0');
INSERT INTO `bcnm_loot` VALUES ('132', '1875', '1000', '1');
INSERT INTO `bcnm_loot` VALUES ('132', '1875', '1000', '2');
INSERT INTO `bcnm_loot` VALUES ('132', '1956', '27', '3'); -- DRG
INSERT INTO `bcnm_loot` VALUES ('132', '1932', '324', '3'); -- MNK
INSERT INTO `bcnm_loot` VALUES ('132', '1950', '80', '3'); -- RNG
INSERT INTO `bcnm_loot` VALUES ('132', '1934', '189', '3'); -- WHM
INSERT INTO `bcnm_loot` VALUES ('132', '1930', '50', '3'); -- WAR
INSERT INTO `bcnm_loot` VALUES ('132', '1940', '27', '4'); -- THF
INSERT INTO `bcnm_loot` VALUES ('132', '1936', '81', '4'); -- BLM
INSERT INTO `bcnm_loot` VALUES ('132', '1944', '80', '4'); -- DRK
INSERT INTO `bcnm_loot` VALUES ('132', '1958', '81', '4'); -- SMN
INSERT INTO `bcnm_loot` VALUES ('132', '2658', '270', '4'); -- COR
INSERT INTO `bcnm_loot` VALUES ('132', '2714', '108', '4'); -- DNC

-- F4
INSERT INTO `bcnm_loot` VALUES ('133', '1875', '1000', '0');
INSERT INTO `bcnm_loot` VALUES ('133', '1875', '1000', '1');
INSERT INTO `bcnm_loot` VALUES ('133', '1875', '1000', '2');
INSERT INTO `bcnm_loot` VALUES ('133', '1942', '90', '3'); -- PLD
INSERT INTO `bcnm_loot` VALUES ('133', '1934', '435', '3'); -- WHM
INSERT INTO `bcnm_loot` VALUES ('133', '1956', '80', '3'); -- DRG
INSERT INTO `bcnm_loot` VALUES ('133', '1940', '174', '3'); -- THF
INSERT INTO `bcnm_loot` VALUES ('133', '1958', '87', '3'); -- SMN
INSERT INTO `bcnm_loot` VALUES ('133', '1954', '90', '3'); -- NIN
INSERT INTO `bcnm_loot` VALUES ('133', '1936', '87', '3'); -- BLM 
INSERT INTO `bcnm_loot` VALUES ('133', '1930', '43', '3'); -- WAR
INSERT INTO `bcnm_loot` VALUES ('133', '2656', '27', '3'); -- BLU
INSERT INTO `bcnm_loot` VALUES ('133', '2658', '261', '3'); -- COR

-- F5
INSERT INTO `bcnm_loot` VALUES ('134', '1875', '1000', '0');
INSERT INTO `bcnm_loot` VALUES ('134', '1875', '1000', '1');
INSERT INTO `bcnm_loot` VALUES ('134', '1875', '1000', '2');
INSERT INTO `bcnm_loot` VALUES ('134', '1875', '1000', '3');
INSERT INTO `bcnm_loot` VALUES ('134', '1954', '67', '4'); -- NIN
INSERT INTO `bcnm_loot` VALUES ('134', '1940', '353', '4'); -- THF
INSERT INTO `bcnm_loot` VALUES ('134', '1936', '87', '4'); -- BLM
INSERT INTO `bcnm_loot` VALUES ('134', '1956', '110', '4'); -- DRG 
INSERT INTO `bcnm_loot` VALUES ('134', '1958', '87', '4'); -- SMN
INSERT INTO `bcnm_loot` VALUES ('134', '1942', '50', '4'); -- PLD
INSERT INTO `bcnm_loot` VALUES ('134', '1950', '60', '4'); -- RNG
INSERT INTO `bcnm_loot` VALUES ('134', '1932', '59', '4'); -- MNK
INSERT INTO `bcnm_loot` VALUES ('134', '2716', '100', '4'); -- SCH
INSERT INTO `bcnm_loot` VALUES ('134', '2714', '110', '4'); -- DNC

-- F6
INSERT INTO `bcnm_loot` VALUES ('135', '1875', '1000', '0');
INSERT INTO `bcnm_loot` VALUES ('135', '1875', '1000', '1');
INSERT INTO `bcnm_loot` VALUES ('135', '1875', '1000', '2');
INSERT INTO `bcnm_loot` VALUES ('135', '1875', '1000', '3');
INSERT INTO `bcnm_loot` VALUES ('135', '1954', '263', '4'); -- NIN
INSERT INTO `bcnm_loot` VALUES ('135', '1932', '59', '4'); -- MNK
INSERT INTO `bcnm_loot` VALUES ('135', '1942', '53', '4'); -- PLD
INSERT INTO `bcnm_loot` VALUES ('135', '1934', '60', '4'); -- WHM
INSERT INTO `bcnm_loot` VALUES ('135', '1956', '526', '4'); -- DRG
INSERT INTO `bcnm_loot` VALUES ('135', '1930', '60', '5'); -- WAR
INSERT INTO `bcnm_loot` VALUES ('135', '1936', '53', '5'); -- BLM
INSERT INTO `bcnm_loot` VALUES ('135', '1950', '158', '5'); -- RNG
INSERT INTO `bcnm_loot` VALUES ('135', '2716', '105', '5'); -- SCH

-- F7
INSERT INTO `bcnm_loot` VALUES ('136', '1875', '1000', '0');
INSERT INTO `bcnm_loot` VALUES ('136', '1875', '1000', '1');
INSERT INTO `bcnm_loot` VALUES ('136', '1875', '1000', '2');
INSERT INTO `bcnm_loot` VALUES ('136', '1875', '1000', '3');
INSERT INTO `bcnm_loot` VALUES ('136', '1875', '1000', '4');
INSERT INTO `bcnm_loot` VALUES ('136', '1875', '1000', '5');
INSERT INTO `bcnm_loot` VALUES ('136', '1956', '240', '6'); -- DRG
INSERT INTO `bcnm_loot` VALUES ('136', '1932', '120', '6'); -- MNK
INSERT INTO `bcnm_loot` VALUES ('136', '1940', '200', '6'); -- THF
INSERT INTO `bcnm_loot` VALUES ('136', '1934', '40', '7'); -- WHM
INSERT INTO `bcnm_loot` VALUES ('136', '1954', '120', '7'); -- NIN
INSERT INTO `bcnm_loot` VALUES ('136', '2658', '200', '7'); -- COR
INSERT INTO `bcnm_loot` VALUES ('136', '2716', '80', '7'); -- SCH 
INSERT INTO `bcnm_loot` VALUES ('136', '1875', '100', '8');
INSERT INTO `bcnm_loot` VALUES ('136', '2127', '55', '8'); -- Metal Chip
INSERT INTO `bcnm_loot` VALUES ('136', '1904', '1000', '9'); -- Ivory Chip

-- Temenos_Western_Tower --------------------------------------------------------------

-- Temenos_Eastern_Tower --------------------------------------------------------------

-- Central_Temenos_Basement --------------------------------------------------------------

-- Central_Temenos_1st_Floor --------------------------------------------------------------

-- Central_Temenos_2nd_Floor --------------------------------------------------------------

-- Central_Temenos_3rd_Floor --------------------------------------------------------------

-- Central_Temenos_4th_Floor --------------------------------------------------------------
