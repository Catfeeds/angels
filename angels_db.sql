/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1_3306
Source Server Version : 50553
Source Host           : 127.0.0.1:3306
Source Database       : angels_db

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2018-11-19 13:13:16
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for fw_adinfo
-- ----------------------------
DROP TABLE IF EXISTS `fw_adinfo`;
CREATE TABLE `fw_adinfo` (
  `ad_id` int(11) NOT NULL AUTO_INCREMENT,
  `ad_unitcode` varchar(32) DEFAULT NULL,
  `ad_group` int(11) DEFAULT '0' COMMENT '海报分组',
  `ad_name` varchar(64) DEFAULT NULL,
  `ad_des` varchar(256) DEFAULT NULL,
  `ad_pic` varchar(32) DEFAULT NULL,
  `ad_url` varchar(128) DEFAULT NULL,
  `ad_addtime` int(11) DEFAULT '0',
  PRIMARY KEY (`ad_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='海报设置';

-- ----------------------------
-- Records of fw_adinfo
-- ----------------------------
INSERT INTO `fw_adinfo` VALUES ('15', '3321', '1', '海报6', '', '3321/15420920726.jpg', '', '1542092072');
INSERT INTO `fw_adinfo` VALUES ('16', '3321', '1', '海报7', '', '3321/15420920821.jpg', '', '1542092082');
INSERT INTO `fw_adinfo` VALUES ('17', '3321', '1', '海报5', '', '3321/15420921406.jpg', '', '1542092140');
INSERT INTO `fw_adinfo` VALUES ('18', '3321', '1', '海报4', '', '3321/15420921461.jpg', '', '1542092146');

-- ----------------------------
-- Table structure for fw_applogin
-- ----------------------------
DROP TABLE IF EXISTS `fw_applogin`;
CREATE TABLE `fw_applogin` (
  `lg_id` int(11) NOT NULL AUTO_INCREMENT,
  `lg_unitcode` varchar(32) DEFAULT NULL,
  `lg_userid` int(11) DEFAULT NULL,
  `lg_username` varchar(64) DEFAULT NULL,
  `lg_token` varchar(64) DEFAULT NULL,
  `lg_imei` varchar(32) DEFAULT NULL,
  `lg_time` int(11) DEFAULT NULL,
  `lg_ip` varchar(32) DEFAULT NULL,
  `lg_useragent` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`lg_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='app出货登录状态';

-- ----------------------------
-- Records of fw_applogin
-- ----------------------------
INSERT INTO `fw_applogin` VALUES ('2', '3321', '7', 'baiman:ruku', '090bf1a30e891e50b7d371e393392157', '865959022717715', '1531300290', '58.63.147.9', null);
INSERT INTO `fw_applogin` VALUES ('3', '3321', '8', 'baiman:chuku', 'f2f70b573e6c1e875ea0adafafb514b3', '865959022717715', '1531308997', '58.63.147.9', null);
INSERT INTO `fw_applogin` VALUES ('4', '3321', '8', 'yunmei:chuku', '1aa540f36773ddfb261f191c55baa8c9', '99000750278764', '1541321857', '180.123.223.171', null);

-- ----------------------------
-- Table structure for fw_applydltype
-- ----------------------------
DROP TABLE IF EXISTS `fw_applydltype`;
CREATE TABLE `fw_applydltype` (
  `apply_id` int(11) NOT NULL AUTO_INCREMENT,
  `apply_unitcode` varchar(32) DEFAULT NULL,
  `apply_dlid` int(11) DEFAULT '0' COMMENT '申请代理id',
  `apply_agobelong` int(11) DEFAULT '0' COMMENT '申请前上家',
  `apply_agodltype` int(11) DEFAULT '0' COMMENT '申请前级别',
  `apply_afterbelong` int(11) DEFAULT '0' COMMENT '申请后的上家',
  `apply_afterdltype` int(11) DEFAULT '0' COMMENT '申请的级别',
  `apply_pic` varchar(32) DEFAULT NULL COMMENT '凭证',
  `apply_addtime` int(11) DEFAULT '0' COMMENT '申请时间',
  `apply_dealtime` int(11) DEFAULT '0' COMMENT '处理时间',
  `apply_remark` varchar(256) DEFAULT NULL COMMENT '处理备注',
  `apply_state` int(11) DEFAULT '0' COMMENT '处理状态',
  PRIMARY KEY (`apply_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='代理申请调整级别';

-- ----------------------------
-- Records of fw_applydltype
-- ----------------------------

-- ----------------------------
-- Table structure for fw_balance
-- ----------------------------
DROP TABLE IF EXISTS `fw_balance`;
CREATE TABLE `fw_balance` (
  `bl_id` int(11) NOT NULL AUTO_INCREMENT,
  `bl_unitcode` varchar(32) DEFAULT NULL,
  `bl_type` int(11) DEFAULT '0' COMMENT '余额类型',
  `bl_sendid` int(11) DEFAULT '0' COMMENT '发款方id',
  `bl_receiveid` int(11) DEFAULT '0' COMMENT '收款方id',
  `bl_money` decimal(10,2) DEFAULT '0.00' COMMENT '金额',
  `bl_odid` int(11) DEFAULT '0' COMMENT '订单id',
  `bl_orderid` varchar(32) DEFAULT NULL COMMENT '订单号',
  `bl_odblid` int(11) DEFAULT '0' COMMENT '订单关系id',
  `bl_addtime` int(11) DEFAULT '0',
  `bl_remark` varchar(256) DEFAULT NULL COMMENT '简单说明',
  `bl_state` int(11) DEFAULT '0' COMMENT '状态',
  `bl_piid` int(4) NOT NULL DEFAULT '0' COMMENT '对应充值ID',
  `bl_rcid` int(11) DEFAULT '0' COMMENT '对应提现id',
  `bl_isyfk` int(11) DEFAULT '0' COMMENT '预付款支付订单款项',
  PRIMARY KEY (`bl_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='代理商余额明细表';

-- ----------------------------
-- Records of fw_balance
-- ----------------------------
INSERT INTO `fw_balance` VALUES ('4', '3321', '1', '0', '60', '300.00', '0', '', '0', '1531276974', '充值', '1', '0', '0', '0');
INSERT INTO `fw_balance` VALUES ('5', '3321', '1', '0', '60', '200.00', '0', '', '0', '1531277759', '充值', '1', '0', '0', '0');
INSERT INTO `fw_balance` VALUES ('7', '3321', '2', '62', '61', '3040.00', '46', '201807111610461765', '0', '1531296975', '45级鸡鸡', '0', '0', '0', '0');
INSERT INTO `fw_balance` VALUES ('8', '3321', '1', '0', '62', '99000090.00', '0', '', '0', '1531297825', 'baiman', '1', '0', '0', '0');
INSERT INTO `fw_balance` VALUES ('9', '3321', '1', '62', '0', '9999999.00', '0', '', '0', '1531298079', 'baiman', '1', '0', '0', '0');
INSERT INTO `fw_balance` VALUES ('10', '3321', '1', '62', '0', '89000000.00', '0', '', '0', '1531298104', 'baiman', '1', '0', '0', '0');
INSERT INTO `fw_balance` VALUES ('11', '3321', '2', '62', '61', '3040.00', '47', '201807111636007408', '0', '1531302302', '', '1', '0', '0', '0');
INSERT INTO `fw_balance` VALUES ('12', '3321', '1', '0', '61', '10000.00', '0', '', '0', '1531299149', 'baiman', '1', '0', '0', '0');

-- ----------------------------
-- Table structure for fw_batch
-- ----------------------------
DROP TABLE IF EXISTS `fw_batch`;
CREATE TABLE `fw_batch` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `unitcode` varchar(32) DEFAULT NULL,
  `codebegin` int(11) DEFAULT NULL,
  `codeend` int(11) DEFAULT NULL,
  `voice` varchar(256) DEFAULT NULL,
  `smsnote` varchar(500) DEFAULT NULL,
  `resmsnote` varchar(500) DEFAULT NULL,
  `errsmsnote` varchar(500) DEFAULT NULL,
  `oversmsnote` varchar(500) DEFAULT NULL,
  `datetime` int(11) DEFAULT NULL,
  `remark` text,
  PRIMARY KEY (`id`),
  KEY `unitcode` (`unitcode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='码分批处理';

-- ----------------------------
-- Records of fw_batch
-- ----------------------------

-- ----------------------------
-- Table structure for fw_brand
-- ----------------------------
DROP TABLE IF EXISTS `fw_brand`;
CREATE TABLE `fw_brand` (
  `br_id` int(11) NOT NULL AUTO_INCREMENT,
  `br_unitcode` varchar(32) DEFAULT NULL,
  `br_name` varchar(64) DEFAULT NULL,
  `br_pic` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`br_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='授权品牌';

-- ----------------------------
-- Records of fw_brand
-- ----------------------------

-- ----------------------------
-- Table structure for fw_brandattorney
-- ----------------------------
DROP TABLE IF EXISTS `fw_brandattorney`;
CREATE TABLE `fw_brandattorney` (
  `ba_id` int(11) NOT NULL AUTO_INCREMENT,
  `ba_unitcode` varchar(32) DEFAULT NULL,
  `ba_brandid` int(11) DEFAULT NULL,
  `ba_dealerid` int(11) DEFAULT NULL,
  `ba_pic` varchar(64) DEFAULT NULL,
  `ba_level` int(11) DEFAULT '0' COMMENT '代理级别',
  PRIMARY KEY (`ba_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='品牌授权图片';

-- ----------------------------
-- Records of fw_brandattorney
-- ----------------------------

-- ----------------------------
-- Table structure for fw_chaibox
-- ----------------------------
DROP TABLE IF EXISTS `fw_chaibox`;
CREATE TABLE `fw_chaibox` (
  `chai_id` int(11) NOT NULL AUTO_INCREMENT,
  `chai_unitcode` varchar(32) DEFAULT NULL,
  `chai_deliver` int(11) DEFAULT '0',
  `chai_addtime` int(11) DEFAULT NULL,
  `chai_barcode` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`chai_id`),
  KEY `chai_unitcode` (`chai_unitcode`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='拆箱记录';

-- ----------------------------
-- Records of fw_chaibox
-- ----------------------------
INSERT INTO `fw_chaibox` VALUES ('1', '3321', '0', '1541580387', '10002421');
INSERT INTO `fw_chaibox` VALUES ('2', '3321', '73', '1541585418', '10002533');
INSERT INTO `fw_chaibox` VALUES ('3', '3321', '73', '1541585816', '10002535');
INSERT INTO `fw_chaibox` VALUES ('4', '3321', '0', '1541586975', '10002537');
INSERT INTO `fw_chaibox` VALUES ('5', '3321', '66', '1541642400', '10002537');
INSERT INTO `fw_chaibox` VALUES ('6', '3321', '0', '1541643499', '10002541');

-- ----------------------------
-- Table structure for fw_code
-- ----------------------------
DROP TABLE IF EXISTS `fw_code`;
CREATE TABLE `fw_code` (
  `fid` int(11) NOT NULL AUTO_INCREMENT,
  `unitcode` varchar(4) DEFAULT NULL,
  `address` int(11) DEFAULT NULL,
  `codea` varchar(32) DEFAULT NULL,
  `codeb` varchar(32) DEFAULT NULL,
  `codec` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`fid`)
) ENGINE=InnoDB AUTO_INCREMENT=4124060 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of fw_code
-- ----------------------------
INSERT INTO `fw_code` VALUES ('4121744', '3321', '1', '6786', '5700', '4501');
INSERT INTO `fw_code` VALUES ('4121745', '3321', '2', '1476', '0744', '2657');
INSERT INTO `fw_code` VALUES ('4121746', '3321', '3', '0514', '2137', '6076');
INSERT INTO `fw_code` VALUES ('4121747', '3321', '4', '9126', '8593', '5460');
INSERT INTO `fw_code` VALUES ('4121748', '3321', '5', '9273', '8335', '3808');
INSERT INTO `fw_code` VALUES ('4121749', '3321', '6', '8739', '4665', '1264');
INSERT INTO `fw_code` VALUES ('4121750', '3321', '7', '5814', '7836', '1683');
INSERT INTO `fw_code` VALUES ('4121751', '3321', '8', '9299', '5054', '2639');
INSERT INTO `fw_code` VALUES ('4121752', '3321', '9', '1155', '4542', '7130');
INSERT INTO `fw_code` VALUES ('4121753', '3321', '10', '9166', '9601', '5299');
INSERT INTO `fw_code` VALUES ('4121754', '3321', '11', '4279', '4550', '2719');
INSERT INTO `fw_code` VALUES ('4121755', '3321', '12', '9980', '8466', '3532');
INSERT INTO `fw_code` VALUES ('4121756', '3321', '13', '6201', '1764', '5880');
INSERT INTO `fw_code` VALUES ('4121757', '3321', '14', '2757', '5554', '4764');
INSERT INTO `fw_code` VALUES ('4121758', '3321', '15', '3251', '8217', '7469');
INSERT INTO `fw_code` VALUES ('4121759', '3321', '16', '3825', '2895', '9853');
INSERT INTO `fw_code` VALUES ('4121760', '3321', '17', '1756', '5939', '8344');
INSERT INTO `fw_code` VALUES ('4121761', '3321', '18', '9512', '2522', '9657');
INSERT INTO `fw_code` VALUES ('4121762', '3321', '19', '5387', '2899', '7648');
INSERT INTO `fw_code` VALUES ('4121763', '3321', '20', '0835', '8339', '1603');
INSERT INTO `fw_code` VALUES ('4121764', '3321', '21', '0474', '1129', '6237');
INSERT INTO `fw_code` VALUES ('4121765', '3321', '22', '6776', '6443', '8264');
INSERT INTO `fw_code` VALUES ('4121766', '3321', '23', '0687', '8598', '3255');
INSERT INTO `fw_code` VALUES ('4121767', '3321', '24', '1008', '4800', '8782');
INSERT INTO `fw_code` VALUES ('4121768', '3321', '25', '9700', '3272', '7844');
INSERT INTO `fw_code` VALUES ('4121769', '3321', '26', '7203', '1379', '2299');
INSERT INTO `fw_code` VALUES ('4121770', '3321', '27', '6496', '1248', '2576');
INSERT INTO `fw_code` VALUES ('4121771', '3321', '28', '1689', '8212', '9674');
INSERT INTO `fw_code` VALUES ('4121772', '3321', '29', '4746', '0494', '6594');
INSERT INTO `fw_code` VALUES ('4121773', '3321', '30', '0794', '7332', '1764');
INSERT INTO `fw_code` VALUES ('4121774', '3321', '31', '8124', '8979', '9041');
INSERT INTO `fw_code` VALUES ('4121775', '3321', '32', '5534', '2641', '5996');
INSERT INTO `fw_code` VALUES ('4121776', '3321', '33', '0301', '4669', '9058');
INSERT INTO `fw_code` VALUES ('4121777', '3321', '34', '4894', '0236', '4942');
INSERT INTO `fw_code` VALUES ('4121778', '3321', '35', '0260', '3661', '9219');
INSERT INTO `fw_code` VALUES ('4121779', '3321', '36', '2544', '8085', '7746');
INSERT INTO `fw_code` VALUES ('4121780', '3321', '37', '9019', '9859', '6951');
INSERT INTO `fw_code` VALUES ('4121781', '3321', '38', '4813', '8221', '5264');
INSERT INTO `fw_code` VALUES ('4121782', '3321', '39', '5560', '9359', '4826');
INSERT INTO `fw_code` VALUES ('4121783', '3321', '40', '2717', '4546', '4924');
INSERT INTO `fw_code` VALUES ('4121784', '3321', '41', '0901', '6066', '0273');
INSERT INTO `fw_code` VALUES ('4121785', '3321', '42', '5240', '3157', '9300');
INSERT INTO `fw_code` VALUES ('4121786', '3321', '43', '1369', '2010', '4148');
INSERT INTO `fw_code` VALUES ('4121787', '3321', '44', '3398', '7958', '5817');
INSERT INTO `fw_code` VALUES ('4121788', '3321', '45', '3291', '9224', '7308');
INSERT INTO `fw_code` VALUES ('4121789', '3321', '46', '6175', '5046', '7049');
INSERT INTO `fw_code` VALUES ('4121790', '3321', '47', '0341', '5677', '8897');
INSERT INTO `fw_code` VALUES ('4121791', '3321', '48', '7243', '2387', '2139');
INSERT INTO `fw_code` VALUES ('4121792', '3321', '49', '8846', '3399', '9773');
INSERT INTO `fw_code` VALUES ('4121793', '3321', '50', '2930', '2014', '1942');
INSERT INTO `fw_code` VALUES ('4121794', '3321', '51', '5133', '4423', '0791');
INSERT INTO `fw_code` VALUES ('4121795', '3321', '52', '4253', '7831', '3889');
INSERT INTO `fw_code` VALUES ('4121796', '3321', '53', '7564', '8589', '7665');
INSERT INTO `fw_code` VALUES ('4121797', '3321', '54', '0194', '5935', '0549');
INSERT INTO `fw_code` VALUES ('4121798', '3321', '55', '7778', '6058', '4683');
INSERT INTO `fw_code` VALUES ('4121799', '3321', '56', '4426', '4292', '1067');
INSERT INTO `fw_code` VALUES ('4121800', '3321', '57', '9446', '4796', '0987');
INSERT INTO `fw_code` VALUES ('4121801', '3321', '58', '0621', '0871', '4585');
INSERT INTO `fw_code` VALUES ('4121802', '3321', '59', '6242', '2772', '5719');
INSERT INTO `fw_code` VALUES ('4121803', '3321', '60', '5107', '7704', '1960');
INSERT INTO `fw_code` VALUES ('4121804', '3321', '61', '4492', '2018', '9737');
INSERT INTO `fw_code` VALUES ('4121805', '3321', '62', '4212', '6824', '4049');
INSERT INTO `fw_code` VALUES ('4121806', '3321', '63', '5214', '6439', '0469');
INSERT INTO `fw_code` VALUES ('4121807', '3321', '64', '8952', '2133', '8281');
INSERT INTO `fw_code` VALUES ('4121808', '3321', '65', '0047', '6193', '2201');
INSERT INTO `fw_code` VALUES ('4121809', '3321', '66', '8312', '9728', '7228');
INSERT INTO `fw_code` VALUES ('4121810', '3321', '67', '7350', '1121', '0648');
INSERT INTO `fw_code` VALUES ('4121811', '3321', '68', '5962', '7577', '0031');
INSERT INTO `fw_code` VALUES ('4121812', '3321', '69', '8765', '1383', '0094');
INSERT INTO `fw_code` VALUES ('4121813', '3321', '70', '8231', '7713', '7550');
INSERT INTO `fw_code` VALUES ('4121814', '3321', '71', '2651', '6820', '6255');
INSERT INTO `fw_code` VALUES ('4121815', '3321', '72', '6135', '4038', '7210');
INSERT INTO `fw_code` VALUES ('4121816', '3321', '73', '7991', '3526', '1701');
INSERT INTO `fw_code` VALUES ('4121817', '3321', '74', '8658', '2649', '1585');
INSERT INTO `fw_code` VALUES ('4121818', '3321', '75', '1115', '3534', '7291');
INSERT INTO `fw_code` VALUES ('4121819', '3321', '76', '6816', '7450', '8103');
INSERT INTO `fw_code` VALUES ('4121820', '3321', '77', '3037', '0748', '0451');
INSERT INTO `fw_code` VALUES ('4121821', '3321', '78', '9593', '4538', '9335');
INSERT INTO `fw_code` VALUES ('4121822', '3321', '79', '0087', '7201', '2040');
INSERT INTO `fw_code` VALUES ('4121823', '3321', '80', '3317', '5943', '6139');
INSERT INTO `fw_code` VALUES ('4121824', '3321', '81', '8592', '4923', '2915');
INSERT INTO `fw_code` VALUES ('4121825', '3321', '82', '6349', '1506', '4228');
INSERT INTO `fw_code` VALUES ('4121826', '3321', '83', '2223', '1883', '2219');
INSERT INTO `fw_code` VALUES ('4121827', '3321', '84', '7671', '7323', '6174');
INSERT INTO `fw_code` VALUES ('4121828', '3321', '85', '7310', '0113', '0808');
INSERT INTO `fw_code` VALUES ('4121829', '3321', '86', '3612', '5427', '2835');
INSERT INTO `fw_code` VALUES ('4121830', '3321', '87', '7523', '7582', '7826');
INSERT INTO `fw_code` VALUES ('4121831', '3321', '88', '7844', '3784', '3353');
INSERT INTO `fw_code` VALUES ('4121832', '3321', '89', '9192', '6320', '4130');
INSERT INTO `fw_code` VALUES ('4121833', '3321', '90', '4039', '0363', '6871');
INSERT INTO `fw_code` VALUES ('4121834', '3321', '91', '5988', '4296', '8862');
INSERT INTO `fw_code` VALUES ('4121835', '3321', '92', '8525', '7196', '4246');
INSERT INTO `fw_code` VALUES ('4121836', '3321', '93', '7354', '4820', '7173');
INSERT INTO `fw_code` VALUES ('4121837', '3321', '94', '3402', '1657', '2342');
INSERT INTO `fw_code` VALUES ('4121838', '3321', '95', '0732', '3304', '9619');
INSERT INTO `fw_code` VALUES ('4121839', '3321', '96', '0798', '1030', '8289');
INSERT INTO `fw_code` VALUES ('4121840', '3321', '97', '2908', '8994', '9637');
INSERT INTO `fw_code` VALUES ('4121841', '3321', '98', '0157', '8625', '7235');
INSERT INTO `fw_code` VALUES ('4121842', '3321', '99', '2868', '7986', '9798');
INSERT INTO `fw_code` VALUES ('4121843', '3321', '100', '5151', '2411', '8324');
INSERT INTO `fw_code` VALUES ('4121844', '3321', '101', '1627', '4185', '7530');
INSERT INTO `fw_code` VALUES ('4121845', '3321', '102', '7420', '2546', '5842');
INSERT INTO `fw_code` VALUES ('4121846', '3321', '103', '8168', '3685', '5405');
INSERT INTO `fw_code` VALUES ('4121847', '3321', '104', '5325', '8871', '5503');
INSERT INTO `fw_code` VALUES ('4121848', '3321', '105', '3509', '0391', '0851');
INSERT INTO `fw_code` VALUES ('4121849', '3321', '106', '7848', '7482', '9878');
INSERT INTO `fw_code` VALUES ('4121850', '3321', '107', '3976', '6335', '4726');
INSERT INTO `fw_code` VALUES ('4121851', '3321', '108', '6006', '2284', '6396');
INSERT INTO `fw_code` VALUES ('4121852', '3321', '109', '5899', '3550', '7887');
INSERT INTO `fw_code` VALUES ('4121853', '3321', '110', '1439', '3435', '9343');
INSERT INTO `fw_code` VALUES ('4121854', '3321', '111', '5605', '4066', '1191');
INSERT INTO `fw_code` VALUES ('4121855', '3321', '112', '2507', '0776', '4432');
INSERT INTO `fw_code` VALUES ('4121856', '3321', '113', '4109', '1788', '2066');
INSERT INTO `fw_code` VALUES ('4121857', '3321', '114', '5538', '6340', '2521');
INSERT INTO `fw_code` VALUES ('4121858', '3321', '115', '7741', '8748', '1369');
INSERT INTO `fw_code` VALUES ('4121859', '3321', '116', '9516', '6221', '6182');
INSERT INTO `fw_code` VALUES ('4121860', '3321', '117', '2827', '6979', '9959');
INSERT INTO `fw_code` VALUES ('4121861', '3321', '118', '2801', '0260', '1128');
INSERT INTO `fw_code` VALUES ('4121862', '3321', '119', '3041', '4447', '6976');
INSERT INTO `fw_code` VALUES ('4121863', '3321', '120', '7034', '8617', '1646');
INSERT INTO `fw_code` VALUES ('4121864', '3321', '121', '2054', '9121', '1565');
INSERT INTO `fw_code` VALUES ('4121865', '3321', '122', '3229', '5197', '5164');
INSERT INTO `fw_code` VALUES ('4121866', '3321', '123', '8849', '7097', '6298');
INSERT INTO `fw_code` VALUES ('4121867', '3321', '124', '0371', '6094', '4253');
INSERT INTO `fw_code` VALUES ('4121868', '3321', '125', '7100', '6344', '0316');
INSERT INTO `fw_code` VALUES ('4121869', '3321', '126', '6820', '1149', '4628');
INSERT INTO `fw_code` VALUES ('4121870', '3321', '127', '0478', '4828', '2762');
INSERT INTO `fw_code` VALUES ('4121871', '3321', '128', '4216', '0522', '0575');
INSERT INTO `fw_code` VALUES ('4121872', '3321', '129', '2654', '0518', '2780');
INSERT INTO `fw_code` VALUES ('4121873', '3321', '130', '3575', '8117', '9521');
INSERT INTO `fw_code` VALUES ('4121874', '3321', '131', '2614', '9510', '2941');
INSERT INTO `fw_code` VALUES ('4121875', '3321', '132', '1225', '5967', '2325');
INSERT INTO `fw_code` VALUES ('4121876', '3321', '133', '1372', '5709', '0673');
INSERT INTO `fw_code` VALUES ('4121877', '3321', '134', '0838', '2038', '8128');
INSERT INTO `fw_code` VALUES ('4121878', '3321', '135', '5258', '1145', '6833');
INSERT INTO `fw_code` VALUES ('4121879', '3321', '136', '8743', '8363', '7789');
INSERT INTO `fw_code` VALUES ('4121880', '3321', '137', '3255', '1915', '3994');
INSERT INTO `fw_code` VALUES ('4121881', '3321', '138', '1266', '6975', '2164');
INSERT INTO `fw_code` VALUES ('4121882', '3321', '139', '3722', '7859', '7869');
INSERT INTO `fw_code` VALUES ('4121883', '3321', '140', '2080', '5840', '0396');
INSERT INTO `fw_code` VALUES ('4121884', '3321', '141', '5645', '5074', '1030');
INSERT INTO `fw_code` VALUES ('4121885', '3321', '142', '4857', '2927', '1628');
INSERT INTO `fw_code` VALUES ('4121886', '3321', '143', '2695', '1526', '2619');
INSERT INTO `fw_code` VALUES ('4121887', '3321', '144', '5925', '0268', '6717');
INSERT INTO `fw_code` VALUES ('4121888', '3321', '145', '1199', '9248', '3494');
INSERT INTO `fw_code` VALUES ('4121889', '3321', '146', '8956', '5832', '4807');
INSERT INTO `fw_code` VALUES ('4121890', '3321', '147', '4831', '6208', '2798');
INSERT INTO `fw_code` VALUES ('4121891', '3321', '148', '2934', '5713', '8468');
INSERT INTO `fw_code` VALUES ('4121892', '3321', '149', '9918', '4439', '1387');
INSERT INTO `fw_code` VALUES ('4121893', '3321', '150', '6220', '9752', '3414');
INSERT INTO `fw_code` VALUES ('4121894', '3321', '151', '0131', '1907', '8405');
INSERT INTO `fw_code` VALUES ('4121895', '3321', '152', '0452', '8109', '3932');
INSERT INTO `fw_code` VALUES ('4121896', '3321', '153', '1800', '0645', '4708');
INSERT INTO `fw_code` VALUES ('4121897', '3321', '154', '9303', '8752', '9164');
INSERT INTO `fw_code` VALUES ('4121898', '3321', '155', '8595', '8621', '9441');
INSERT INTO `fw_code` VALUES ('4121899', '3321', '156', '3789', '5586', '6539');
INSERT INTO `fw_code` VALUES ('4121900', '3321', '157', '4190', '3804', '1744');
INSERT INTO `fw_code` VALUES ('4121901', '3321', '158', '0238', '0641', '6914');
INSERT INTO `fw_code` VALUES ('4121902', '3321', '159', '7568', '2288', '4191');
INSERT INTO `fw_code` VALUES ('4121903', '3321', '160', '7634', '0014', '2860');
INSERT INTO `fw_code` VALUES ('4121904', '3321', '161', '2400', '2042', '5923');
INSERT INTO `fw_code` VALUES ('4121905', '3321', '162', '6993', '7609', '1807');
INSERT INTO `fw_code` VALUES ('4121906', '3321', '163', '9704', '6970', '4369');
INSERT INTO `fw_code` VALUES ('4121907', '3321', '164', '4643', '5459', '4610');
INSERT INTO `fw_code` VALUES ('4121908', '3321', '165', '1118', '7233', '3816');
INSERT INTO `fw_code` VALUES ('4121909', '3321', '166', '4256', '1530', '0414');
INSERT INTO `fw_code` VALUES ('4121910', '3321', '167', '5004', '2669', '9976');
INSERT INTO `fw_code` VALUES ('4121911', '3321', '168', '2161', '7855', '0074');
INSERT INTO `fw_code` VALUES ('4121912', '3321', '169', '0345', '9375', '5423');
INSERT INTO `fw_code` VALUES ('4121913', '3321', '170', '4684', '6467', '4450');
INSERT INTO `fw_code` VALUES ('4121914', '3321', '171', '3468', '9383', '1012');
INSERT INTO `fw_code` VALUES ('4121915', '3321', '172', '5498', '5332', '2682');
INSERT INTO `fw_code` VALUES ('4121916', '3321', '173', '5391', '6598', '4173');
INSERT INTO `fw_code` VALUES ('4121917', '3321', '174', '8275', '2419', '3914');
INSERT INTO `fw_code` VALUES ('4121918', '3321', '175', '2441', '3050', '5762');
INSERT INTO `fw_code` VALUES ('4121919', '3321', '176', '9343', '9760', '9003');
INSERT INTO `fw_code` VALUES ('4121920', '3321', '177', '0945', '0772', '6637');
INSERT INTO `fw_code` VALUES ('4121921', '3321', '178', '2374', '5324', '7092');
INSERT INTO `fw_code` VALUES ('4121922', '3321', '179', '4577', '7732', '5941');
INSERT INTO `fw_code` VALUES ('4121923', '3321', '180', '6352', '5205', '0753');
INSERT INTO `fw_code` VALUES ('4121924', '3321', '181', '9663', '5963', '4530');
INSERT INTO `fw_code` VALUES ('4121925', '3321', '182', '2293', '3308', '7414');
INSERT INTO `fw_code` VALUES ('4121926', '3321', '183', '9877', '3431', '1548');
INSERT INTO `fw_code` VALUES ('4121927', '3321', '184', '3870', '7601', '6217');
INSERT INTO `fw_code` VALUES ('4121928', '3321', '185', '1546', '2169', '7851');
INSERT INTO `fw_code` VALUES ('4121929', '3321', '186', '2721', '8244', '1450');
INSERT INTO `fw_code` VALUES ('4121930', '3321', '187', '5685', '6081', '0869');
INSERT INTO `fw_code` VALUES ('4121931', '3321', '188', '7207', '5078', '8825');
INSERT INTO `fw_code` VALUES ('4121932', '3321', '189', '3936', '5328', '4887');
INSERT INTO `fw_code` VALUES ('4121933', '3321', '190', '3656', '0133', '9199');
INSERT INTO `fw_code` VALUES ('4121934', '3321', '191', '7314', '3812', '7334');
INSERT INTO `fw_code` VALUES ('4121935', '3321', '192', '1052', '9506', '5146');
INSERT INTO `fw_code` VALUES ('4121936', '3321', '193', '9490', '9502', '7351');
INSERT INTO `fw_code` VALUES ('4121937', '3321', '194', '0411', '7101', '4092');
INSERT INTO `fw_code` VALUES ('4121938', '3321', '195', '9450', '8494', '7512');
INSERT INTO `fw_code` VALUES ('4121939', '3321', '196', '8061', '4951', '6896');
INSERT INTO `fw_code` VALUES ('4121940', '3321', '197', '8209', '4693', '5244');
INSERT INTO `fw_code` VALUES ('4121941', '3321', '198', '7674', '1022', '2699');
INSERT INTO `fw_code` VALUES ('4121942', '3321', '199', '4750', '4193', '3119');
INSERT INTO `fw_code` VALUES ('4121943', '3321', '200', '5579', '7347', '2360');
INSERT INTO `fw_code` VALUES ('4121944', '3321', '201', '0091', '0899', '8566');
INSERT INTO `fw_code` VALUES ('4121945', '3321', '202', '8102', '5959', '6735');
INSERT INTO `fw_code` VALUES ('4121946', '3321', '203', '0558', '6843', '2441');
INSERT INTO `fw_code` VALUES ('4121947', '3321', '204', '8916', '4824', '4967');
INSERT INTO `fw_code` VALUES ('4121948', '3321', '205', '2481', '4058', '5601');
INSERT INTO `fw_code` VALUES ('4121949', '3321', '206', '1693', '1911', '6200');
INSERT INTO `fw_code` VALUES ('4121950', '3321', '207', '2187', '4574', '8905');
INSERT INTO `fw_code` VALUES ('4121951', '3321', '208', '2761', '9252', '1289');
INSERT INTO `fw_code` VALUES ('4121952', '3321', '209', '0691', '2296', '9780');
INSERT INTO `fw_code` VALUES ('4121953', '3321', '210', '5792', '4816', '9378');
INSERT INTO `fw_code` VALUES ('4121954', '3321', '211', '4323', '9256', '9084');
INSERT INTO `fw_code` VALUES ('4121955', '3321', '212', '9770', '4697', '3039');
INSERT INTO `fw_code` VALUES ('4121956', '3321', '213', '9409', '7487', '7673');
INSERT INTO `fw_code` VALUES ('4121957', '3321', '214', '5711', '2800', '9700');
INSERT INTO `fw_code` VALUES ('4121958', '3321', '215', '9623', '4955', '4691');
INSERT INTO `fw_code` VALUES ('4121959', '3321', '216', '3712', '8602', '1632');
INSERT INTO `fw_code` VALUES ('4121960', '3321', '217', '2404', '7074', '0695');
INSERT INTO `fw_code` VALUES ('4121961', '3321', '218', '9907', '5182', '5150');
INSERT INTO `fw_code` VALUES ('4121962', '3321', '219', '9200', '5050', '5427');
INSERT INTO `fw_code` VALUES ('4121963', '3321', '220', '4393', '2015', '2525');
INSERT INTO `fw_code` VALUES ('4121964', '3321', '221', '7450', '4297', '9445');
INSERT INTO `fw_code` VALUES ('4121965', '3321', '222', '3498', '1134', '4614');
INSERT INTO `fw_code` VALUES ('4121966', '3321', '223', '8172', '8717', '0177');
INSERT INTO `fw_code` VALUES ('4121967', '3321', '224', '3005', '8471', '1909');
INSERT INTO `fw_code` VALUES ('4121968', '3321', '225', '7597', '4039', '7793');
INSERT INTO `fw_code` VALUES ('4121969', '3321', '226', '2964', '7463', '2070');
INSERT INTO `fw_code` VALUES ('4121970', '3321', '227', '5248', '1888', '0596');
INSERT INTO `fw_code` VALUES ('4121971', '3321', '228', '1723', '3662', '9802');
INSERT INTO `fw_code` VALUES ('4121972', '3321', '229', '4861', '7959', '6400');
INSERT INTO `fw_code` VALUES ('4121973', '3321', '230', '5608', '9098', '5962');
INSERT INTO `fw_code` VALUES ('4121974', '3321', '231', '5421', '8348', '7775');
INSERT INTO `fw_code` VALUES ('4121975', '3321', '232', '3605', '9868', '3123');
INSERT INTO `fw_code` VALUES ('4121976', '3321', '233', '5288', '2896', '0436');
INSERT INTO `fw_code` VALUES ('4121977', '3321', '234', '4073', '5812', '6998');
INSERT INTO `fw_code` VALUES ('4121978', '3321', '235', '6102', '1761', '8668');
INSERT INTO `fw_code` VALUES ('4121979', '3321', '236', '5995', '3027', '0159');
INSERT INTO `fw_code` VALUES ('4121980', '3321', '237', '8879', '8848', '9900');
INSERT INTO `fw_code` VALUES ('4121981', '3321', '238', '3045', '9479', '1748');
INSERT INTO `fw_code` VALUES ('4121982', '3321', '239', '9947', '6189', '4989');
INSERT INTO `fw_code` VALUES ('4121983', '3321', '240', '5634', '5817', '4793');
INSERT INTO `fw_code` VALUES ('4121984', '3321', '241', '5181', '4161', '1927');
INSERT INTO `fw_code` VALUES ('4121985', '3321', '242', '6957', '1634', '6739');
INSERT INTO `fw_code` VALUES ('4121986', '3321', '243', '0268', '2392', '0516');
INSERT INTO `fw_code` VALUES ('4121987', '3321', '244', '2898', '9737', '3400');
INSERT INTO `fw_code` VALUES ('4121988', '3321', '245', '0481', '9860', '7534');
INSERT INTO `fw_code` VALUES ('4121989', '3321', '246', '7130', '8094', '3918');
INSERT INTO `fw_code` VALUES ('4121990', '3321', '247', '3325', '4674', '7436');
INSERT INTO `fw_code` VALUES ('4121991', '3321', '248', '8946', '6574', '8570');
INSERT INTO `fw_code` VALUES ('4121992', '3321', '249', '7811', '1507', '4811');
INSERT INTO `fw_code` VALUES ('4121993', '3321', '250', '4540', '1757', '0873');
INSERT INTO `fw_code` VALUES ('4121994', '3321', '251', '6916', '0626', '6900');
INSERT INTO `fw_code` VALUES ('4121995', '3321', '252', '7918', '0241', '3320');
INSERT INTO `fw_code` VALUES ('4121996', '3321', '253', '0095', '5931', '3337');
INSERT INTO `fw_code` VALUES ('4121997', '3321', '254', '1016', '3531', '0079');
INSERT INTO `fw_code` VALUES ('4121998', '3321', '255', '8666', '1380', '2882');
INSERT INTO `fw_code` VALUES ('4121999', '3321', '256', '8813', '1122', '1230');
INSERT INTO `fw_code` VALUES ('4122000', '3321', '257', '8279', '7451', '8686');
INSERT INTO `fw_code` VALUES ('4122001', '3321', '258', '5354', '0622', '9105');
INSERT INTO `fw_code` VALUES ('4122002', '3321', '259', '8839', '7840', '0061');
INSERT INTO `fw_code` VALUES ('4122003', '3321', '260', '0695', '7328', '4552');
INSERT INTO `fw_code` VALUES ('4122004', '3321', '261', '8706', '2388', '2721');
INSERT INTO `fw_code` VALUES ('4122005', '3321', '262', '3819', '7336', '0141');
INSERT INTO `fw_code` VALUES ('4122006', '3321', '263', '9520', '1253', '0954');
INSERT INTO `fw_code` VALUES ('4122007', '3321', '264', '5741', '4551', '3302');
INSERT INTO `fw_code` VALUES ('4122008', '3321', '265', '2297', '8340', '2186');
INSERT INTO `fw_code` VALUES ('4122009', '3321', '266', '2791', '1003', '4891');
INSERT INTO `fw_code` VALUES ('4122010', '3321', '267', '3365', '5681', '7275');
INSERT INTO `fw_code` VALUES ('4122011', '3321', '268', '1295', '8725', '5766');
INSERT INTO `fw_code` VALUES ('4122012', '3321', '269', '9052', '5309', '7079');
INSERT INTO `fw_code` VALUES ('4122013', '3321', '270', '4927', '5685', '5070');
INSERT INTO `fw_code` VALUES ('4122014', '3321', '271', '0375', '1126', '9025');
INSERT INTO `fw_code` VALUES ('4122015', '3321', '272', '0014', '3916', '3659');
INSERT INTO `fw_code` VALUES ('4122016', '3321', '273', '6316', '9229', '5686');
INSERT INTO `fw_code` VALUES ('4122017', '3321', '274', '0227', '1384', '0677');
INSERT INTO `fw_code` VALUES ('4122018', '3321', '275', '0548', '7586', '6204');
INSERT INTO `fw_code` VALUES ('4122019', '3321', '276', '6743', '4166', '9721');
INSERT INTO `fw_code` VALUES ('4122020', '3321', '277', '6036', '4034', '9998');
INSERT INTO `fw_code` VALUES ('4122021', '3321', '278', '1229', '0999', '7096');
INSERT INTO `fw_code` VALUES ('4122022', '3321', '279', '4286', '3281', '4016');
INSERT INTO `fw_code` VALUES ('4122023', '3321', '280', '0334', '0118', '9186');
INSERT INTO `fw_code` VALUES ('4122024', '3321', '281', '7664', '1765', '6463');
INSERT INTO `fw_code` VALUES ('4122025', '3321', '282', '9841', '7455', '6480');
INSERT INTO `fw_code` VALUES ('4122026', '3321', '283', '4434', '3023', '2364');
INSERT INTO `fw_code` VALUES ('4122027', '3321', '284', '9800', '6447', '6641');
INSERT INTO `fw_code` VALUES ('4122028', '3321', '285', '2084', '0872', '5168');
INSERT INTO `fw_code` VALUES ('4122029', '3321', '286', '8559', '2646', '4373');
INSERT INTO `fw_code` VALUES ('4122030', '3321', '287', '4353', '1007', '2686');
INSERT INTO `fw_code` VALUES ('4122031', '3321', '288', '5100', '2146', '2248');
INSERT INTO `fw_code` VALUES ('4122032', '3321', '289', '6025', '4777', '3761');
INSERT INTO `fw_code` VALUES ('4122033', '3321', '290', '4209', '6297', '9110');
INSERT INTO `fw_code` VALUES ('4122034', '3321', '291', '8548', '3389', '8136');
INSERT INTO `fw_code` VALUES ('4122035', '3321', '292', '4677', '2242', '2984');
INSERT INTO `fw_code` VALUES ('4122036', '3321', '293', '6706', '8190', '4654');
INSERT INTO `fw_code` VALUES ('4122037', '3321', '294', '6600', '9456', '6145');
INSERT INTO `fw_code` VALUES ('4122038', '3321', '295', '9484', '5277', '5886');
INSERT INTO `fw_code` VALUES ('4122039', '3321', '296', '3649', '5908', '7734');
INSERT INTO `fw_code` VALUES ('4122040', '3321', '297', '0552', '2618', '0975');
INSERT INTO `fw_code` VALUES ('4122041', '3321', '298', '2154', '3630', '8609');
INSERT INTO `fw_code` VALUES ('4122042', '3321', '299', '6239', '2246', '0779');
INSERT INTO `fw_code` VALUES ('4122043', '3321', '300', '8441', '4654', '9627');
INSERT INTO `fw_code` VALUES ('4122044', '3321', '301', '7561', '8063', '2725');
INSERT INTO `fw_code` VALUES ('4122045', '3321', '302', '0872', '8821', '6502');
INSERT INTO `fw_code` VALUES ('4122046', '3321', '303', '3502', '6166', '9386');
INSERT INTO `fw_code` VALUES ('4122047', '3321', '304', '1086', '6289', '3520');
INSERT INTO `fw_code` VALUES ('4122048', '3321', '305', '7734', '4523', '9904');
INSERT INTO `fw_code` VALUES ('4122049', '3321', '306', '2754', '5027', '9824');
INSERT INTO `fw_code` VALUES ('4122050', '3321', '307', '3929', '1103', '3422');
INSERT INTO `fw_code` VALUES ('4122051', '3321', '308', '9550', '3004', '4556');
INSERT INTO `fw_code` VALUES ('4122052', '3321', '309', '8415', '7936', '0797');
INSERT INTO `fw_code` VALUES ('4122053', '3321', '310', '7801', '2250', '8574');
INSERT INTO `fw_code` VALUES ('4122054', '3321', '311', '7521', '7055', '2886');
INSERT INTO `fw_code` VALUES ('4122055', '3321', '312', '8522', '6670', '9306');
INSERT INTO `fw_code` VALUES ('4122056', '3321', '313', '2261', '2364', '7118');
INSERT INTO `fw_code` VALUES ('4122057', '3321', '314', '3355', '6424', '1038');
INSERT INTO `fw_code` VALUES ('4122058', '3321', '315', '1620', '9960', '6065');
INSERT INTO `fw_code` VALUES ('4122059', '3321', '316', '0659', '1353', '9484');
INSERT INTO `fw_code` VALUES ('4122060', '3321', '317', '9270', '7809', '8868');
INSERT INTO `fw_code` VALUES ('4122061', '3321', '318', '2073', '1615', '8931');
INSERT INTO `fw_code` VALUES ('4122062', '3321', '319', '1539', '7944', '6386');
INSERT INTO `fw_code` VALUES ('4122063', '3321', '320', '5959', '7051', '5092');
INSERT INTO `fw_code` VALUES ('4122064', '3321', '321', '9443', '4269', '6047');
INSERT INTO `fw_code` VALUES ('4122065', '3321', '322', '1299', '3757', '0538');
INSERT INTO `fw_code` VALUES ('4122066', '3321', '323', '1966', '2881', '0422');
INSERT INTO `fw_code` VALUES ('4122067', '3321', '324', '4423', '3765', '6127');
INSERT INTO `fw_code` VALUES ('4122068', '3321', '325', '0124', '7682', '6940');
INSERT INTO `fw_code` VALUES ('4122069', '3321', '326', '6346', '0980', '9288');
INSERT INTO `fw_code` VALUES ('4122070', '3321', '327', '2902', '4769', '8172');
INSERT INTO `fw_code` VALUES ('4122071', '3321', '328', '3395', '7432', '0877');
INSERT INTO `fw_code` VALUES ('4122072', '3321', '329', '6626', '6174', '4976');
INSERT INTO `fw_code` VALUES ('4122073', '3321', '330', '1900', '5154', '1752');
INSERT INTO `fw_code` VALUES ('4122074', '3321', '331', '9657', '1738', '3065');
INSERT INTO `fw_code` VALUES ('4122075', '3321', '332', '5532', '2115', '1056');
INSERT INTO `fw_code` VALUES ('4122076', '3321', '333', '0979', '7555', '5011');
INSERT INTO `fw_code` VALUES ('4122077', '3321', '334', '0618', '0345', '9645');
INSERT INTO `fw_code` VALUES ('4122078', '3321', '335', '6920', '5658', '1672');
INSERT INTO `fw_code` VALUES ('4122079', '3321', '336', '0832', '7813', '6663');
INSERT INTO `fw_code` VALUES ('4122080', '3321', '337', '1152', '4015', '2190');
INSERT INTO `fw_code` VALUES ('4122081', '3321', '338', '2500', '6551', '2967');
INSERT INTO `fw_code` VALUES ('4122082', '3321', '339', '7347', '0595', '5708');
INSERT INTO `fw_code` VALUES ('4122083', '3321', '340', '9296', '4527', '7699');
INSERT INTO `fw_code` VALUES ('4122084', '3321', '341', '1833', '7428', '3083');
INSERT INTO `fw_code` VALUES ('4122085', '3321', '342', '4891', '9710', '0002');
INSERT INTO `fw_code` VALUES ('4122086', '3321', '343', '0939', '6547', '5172');
INSERT INTO `fw_code` VALUES ('4122087', '3321', '344', '8268', '8194', '2449');
INSERT INTO `fw_code` VALUES ('4122088', '3321', '345', '8335', '5920', '1119');
INSERT INTO `fw_code` VALUES ('4122089', '3321', '346', '0445', '3884', '2466');
INSERT INTO `fw_code` VALUES ('4122090', '3321', '347', '7694', '3516', '0065');
INSERT INTO `fw_code` VALUES ('4122091', '3321', '348', '0404', '2877', '2627');
INSERT INTO `fw_code` VALUES ('4122092', '3321', '349', '2688', '7301', '1154');
INSERT INTO `fw_code` VALUES ('4122093', '3321', '350', '9163', '9075', '0359');
INSERT INTO `fw_code` VALUES ('4122094', '3321', '351', '4957', '7436', '8672');
INSERT INTO `fw_code` VALUES ('4122095', '3321', '352', '5705', '8575', '8235');
INSERT INTO `fw_code` VALUES ('4122096', '3321', '353', '2861', '3761', '8333');
INSERT INTO `fw_code` VALUES ('4122097', '3321', '354', '1045', '5281', '3681');
INSERT INTO `fw_code` VALUES ('4122098', '3321', '355', '5384', '2373', '2708');
INSERT INTO `fw_code` VALUES ('4122099', '3321', '356', '1513', '1226', '7556');
INSERT INTO `fw_code` VALUES ('4122100', '3321', '357', '3543', '7174', '9225');
INSERT INTO `fw_code` VALUES ('4122101', '3321', '358', '3436', '8440', '0716');
INSERT INTO `fw_code` VALUES ('4122102', '3321', '359', '8975', '8325', '2172');
INSERT INTO `fw_code` VALUES ('4122103', '3321', '360', '3141', '8956', '4020');
INSERT INTO `fw_code` VALUES ('4122104', '3321', '361', '0044', '5666', '7261');
INSERT INTO `fw_code` VALUES ('4122105', '3321', '362', '1646', '6678', '4895');
INSERT INTO `fw_code` VALUES ('4122106', '3321', '363', '3075', '1230', '5351');
INSERT INTO `fw_code` VALUES ('4122107', '3321', '364', '5277', '3638', '4199');
INSERT INTO `fw_code` VALUES ('4122108', '3321', '365', '7053', '1111', '9011');
INSERT INTO `fw_code` VALUES ('4122109', '3321', '366', '0364', '1869', '2788');
INSERT INTO `fw_code` VALUES ('4122110', '3321', '367', '0338', '5150', '3958');
INSERT INTO `fw_code` VALUES ('4122111', '3321', '368', '0578', '9337', '9806');
INSERT INTO `fw_code` VALUES ('4122112', '3321', '369', '4570', '3507', '4475');
INSERT INTO `fw_code` VALUES ('4122113', '3321', '370', '9590', '4011', '4395');
INSERT INTO `fw_code` VALUES ('4122114', '3321', '371', '0765', '0087', '7993');
INSERT INTO `fw_code` VALUES ('4122115', '3321', '372', '6386', '1988', '9127');
INSERT INTO `fw_code` VALUES ('4122116', '3321', '373', '7907', '0984', '7083');
INSERT INTO `fw_code` VALUES ('4122117', '3321', '374', '4637', '1234', '3145');
INSERT INTO `fw_code` VALUES ('4122118', '3321', '375', '4357', '6039', '7458');
INSERT INTO `fw_code` VALUES ('4122119', '3321', '376', '8014', '9718', '5592');
INSERT INTO `fw_code` VALUES ('4122120', '3321', '377', '1753', '5412', '3404');
INSERT INTO `fw_code` VALUES ('4122121', '3321', '378', '0191', '5408', '5609');
INSERT INTO `fw_code` VALUES ('4122122', '3321', '379', '1112', '3008', '2351');
INSERT INTO `fw_code` VALUES ('4122123', '3321', '380', '0150', '4400', '5770');
INSERT INTO `fw_code` VALUES ('4122124', '3321', '381', '8762', '0857', '5154');
INSERT INTO `fw_code` VALUES ('4122125', '3321', '382', '8909', '0599', '3502');
INSERT INTO `fw_code` VALUES ('4122126', '3321', '383', '8375', '6928', '0958');
INSERT INTO `fw_code` VALUES ('4122127', '3321', '384', '2795', '6035', '9663');
INSERT INTO `fw_code` VALUES ('4122128', '3321', '385', '6279', '3253', '0618');
INSERT INTO `fw_code` VALUES ('4122129', '3321', '386', '0791', '6805', '6824');
INSERT INTO `fw_code` VALUES ('4122130', '3321', '387', '8802', '1865', '4993');
INSERT INTO `fw_code` VALUES ('4122131', '3321', '388', '1259', '2750', '0699');
INSERT INTO `fw_code` VALUES ('4122132', '3321', '389', '9616', '0730', '3226');
INSERT INTO `fw_code` VALUES ('4122133', '3321', '390', '3182', '9964', '3859');
INSERT INTO `fw_code` VALUES ('4122134', '3321', '391', '6162', '5262', '5873');
INSERT INTO `fw_code` VALUES ('4122135', '3321', '392', '4000', '3861', '6863');
INSERT INTO `fw_code` VALUES ('4122136', '3321', '393', '7230', '2603', '0962');
INSERT INTO `fw_code` VALUES ('4122137', '3321', '394', '2504', '1583', '7738');
INSERT INTO `fw_code` VALUES ('4122138', '3321', '395', '0261', '8167', '9051');
INSERT INTO `fw_code` VALUES ('4122139', '3321', '396', '6136', '8544', '7042');
INSERT INTO `fw_code` VALUES ('4122140', '3321', '397', '4239', '8048', '2712');
INSERT INTO `fw_code` VALUES ('4122141', '3321', '398', '1222', '6774', '5631');
INSERT INTO `fw_code` VALUES ('4122142', '3321', '399', '7524', '2087', '7658');
INSERT INTO `fw_code` VALUES ('4122143', '3321', '400', '1436', '4242', '2649');
INSERT INTO `fw_code` VALUES ('4122144', '3321', '401', '1757', '0445', '8176');
INSERT INTO `fw_code` VALUES ('4122145', '3321', '402', '3105', '2980', '8953');
INSERT INTO `fw_code` VALUES ('4122146', '3321', '403', '0607', '1088', '3408');
INSERT INTO `fw_code` VALUES ('4122147', '3321', '404', '9900', '0957', '3685');
INSERT INTO `fw_code` VALUES ('4122148', '3321', '405', '5094', '7921', '0783');
INSERT INTO `fw_code` VALUES ('4122149', '3321', '406', '5495', '6139', '5988');
INSERT INTO `fw_code` VALUES ('4122150', '3321', '407', '1543', '2976', '1158');
INSERT INTO `fw_code` VALUES ('4122151', '3321', '408', '8873', '4623', '8435');
INSERT INTO `fw_code` VALUES ('4122152', '3321', '409', '8939', '2349', '7105');
INSERT INTO `fw_code` VALUES ('4122153', '3321', '410', '3705', '4377', '0167');
INSERT INTO `fw_code` VALUES ('4122154', '3321', '411', '8298', '9945', '6051');
INSERT INTO `fw_code` VALUES ('4122155', '3321', '412', '1009', '9306', '8613');
INSERT INTO `fw_code` VALUES ('4122156', '3321', '413', '5948', '7794', '8855');
INSERT INTO `fw_code` VALUES ('4122157', '3321', '414', '2423', '9568', '8060');
INSERT INTO `fw_code` VALUES ('4122158', '3321', '415', '5561', '3865', '4658');
INSERT INTO `fw_code` VALUES ('4122159', '3321', '416', '6309', '5004', '4221');
INSERT INTO `fw_code` VALUES ('4122160', '3321', '417', '3466', '0191', '4319');
INSERT INTO `fw_code` VALUES ('4122161', '3321', '418', '1650', '1710', '9667');
INSERT INTO `fw_code` VALUES ('4122162', '3321', '419', '5989', '8802', '8694');
INSERT INTO `fw_code` VALUES ('4122163', '3321', '420', '4773', '1719', '5257');
INSERT INTO `fw_code` VALUES ('4122164', '3321', '421', '6803', '7667', '6926');
INSERT INTO `fw_code` VALUES ('4122165', '3321', '422', '6696', '8933', '8417');
INSERT INTO `fw_code` VALUES ('4122166', '3321', '423', '9580', '4754', '8158');
INSERT INTO `fw_code` VALUES ('4122167', '3321', '424', '3746', '5385', '0006');
INSERT INTO `fw_code` VALUES ('4122168', '3321', '425', '0648', '2095', '3248');
INSERT INTO `fw_code` VALUES ('4122169', '3321', '426', '2250', '3107', '0881');
INSERT INTO `fw_code` VALUES ('4122170', '3321', '427', '3679', '7659', '1337');
INSERT INTO `fw_code` VALUES ('4122171', '3321', '428', '5882', '0068', '0185');
INSERT INTO `fw_code` VALUES ('4122172', '3321', '429', '7657', '7540', '4998');
INSERT INTO `fw_code` VALUES ('4122173', '3321', '430', '0968', '8298', '8774');
INSERT INTO `fw_code` VALUES ('4122174', '3321', '431', '3598', '5643', '1658');
INSERT INTO `fw_code` VALUES ('4122175', '3321', '432', '1182', '5766', '5792');
INSERT INTO `fw_code` VALUES ('4122176', '3321', '433', '5175', '9937', '0462');
INSERT INTO `fw_code` VALUES ('4122177', '3321', '434', '2851', '4504', '2096');
INSERT INTO `fw_code` VALUES ('4122178', '3321', '435', '4026', '0580', '5694');
INSERT INTO `fw_code` VALUES ('4122179', '3321', '436', '6990', '8417', '5113');
INSERT INTO `fw_code` VALUES ('4122180', '3321', '437', '8512', '7413', '3069');
INSERT INTO `fw_code` VALUES ('4122181', '3321', '438', '5241', '7663', '9131');
INSERT INTO `fw_code` VALUES ('4122182', '3321', '439', '4961', '2468', '3444');
INSERT INTO `fw_code` VALUES ('4122183', '3321', '440', '8618', '6147', '1578');
INSERT INTO `fw_code` VALUES ('4122184', '3321', '441', '2357', '1841', '9390');
INSERT INTO `fw_code` VALUES ('4122185', '3321', '442', '0795', '1837', '1596');
INSERT INTO `fw_code` VALUES ('4122186', '3321', '443', '1716', '9437', '8337');
INSERT INTO `fw_code` VALUES ('4122187', '3321', '444', '0755', '0830', '1756');
INSERT INTO `fw_code` VALUES ('4122188', '3321', '445', '9366', '7286', '1140');
INSERT INTO `fw_code` VALUES ('4122189', '3321', '446', '9513', '7028', '9488');
INSERT INTO `fw_code` VALUES ('4122190', '3321', '447', '8979', '3357', '6944');
INSERT INTO `fw_code` VALUES ('4122191', '3321', '448', '6055', '6528', '7364');
INSERT INTO `fw_code` VALUES ('4122192', '3321', '449', '6884', '9683', '6604');
INSERT INTO `fw_code` VALUES ('4122193', '3321', '450', '1396', '3234', '2810');
INSERT INTO `fw_code` VALUES ('4122194', '3321', '451', '9407', '8294', '0980');
INSERT INTO `fw_code` VALUES ('4122195', '3321', '452', '1863', '9179', '6685');
INSERT INTO `fw_code` VALUES ('4122196', '3321', '453', '0221', '7159', '9212');
INSERT INTO `fw_code` VALUES ('4122197', '3321', '454', '3786', '6393', '9846');
INSERT INTO `fw_code` VALUES ('4122198', '3321', '455', '2998', '4246', '0444');
INSERT INTO `fw_code` VALUES ('4122199', '3321', '456', '3491', '6909', '3149');
INSERT INTO `fw_code` VALUES ('4122200', '3321', '457', '4066', '1587', '5533');
INSERT INTO `fw_code` VALUES ('4122201', '3321', '458', '1996', '4631', '4024');
INSERT INTO `fw_code` VALUES ('4122202', '3321', '459', '7097', '7151', '3622');
INSERT INTO `fw_code` VALUES ('4122203', '3321', '460', '5628', '1592', '3328');
INSERT INTO `fw_code` VALUES ('4122204', '3321', '461', '1075', '7032', '7283');
INSERT INTO `fw_code` VALUES ('4122205', '3321', '462', '0714', '9822', '1917');
INSERT INTO `fw_code` VALUES ('4122206', '3321', '463', '7016', '5135', '3944');
INSERT INTO `fw_code` VALUES ('4122207', '3321', '464', '0928', '7290', '8935');
INSERT INTO `fw_code` VALUES ('4122208', '3321', '465', '1248', '3492', '4462');
INSERT INTO `fw_code` VALUES ('4122209', '3321', '466', '9941', '1964', '3524');
INSERT INTO `fw_code` VALUES ('4122210', '3321', '467', '7444', '0072', '7980');
INSERT INTO `fw_code` VALUES ('4122211', '3321', '468', '6736', '9941', '8256');
INSERT INTO `fw_code` VALUES ('4122212', '3321', '469', '1930', '6905', '5355');
INSERT INTO `fw_code` VALUES ('4122213', '3321', '470', '4987', '9187', '2274');
INSERT INTO `fw_code` VALUES ('4122214', '3321', '471', '1035', '6024', '7444');
INSERT INTO `fw_code` VALUES ('4122215', '3321', '472', '5709', '3607', '3006');
INSERT INTO `fw_code` VALUES ('4122216', '3321', '473', '5775', '1333', '1676');
INSERT INTO `fw_code` VALUES ('4122217', '3321', '474', '0541', '3361', '4739');
INSERT INTO `fw_code` VALUES ('4122218', '3321', '475', '5134', '8929', '0622');
INSERT INTO `fw_code` VALUES ('4122219', '3321', '476', '0501', '2354', '4899');
INSERT INTO `fw_code` VALUES ('4122220', '3321', '477', '2784', '6778', '3426');
INSERT INTO `fw_code` VALUES ('4122221', '3321', '478', '9259', '8552', '2631');
INSERT INTO `fw_code` VALUES ('4122222', '3321', '479', '2397', '2849', '9230');
INSERT INTO `fw_code` VALUES ('4122223', '3321', '480', '3145', '3988', '8792');
INSERT INTO `fw_code` VALUES ('4122224', '3321', '481', '2957', '3238', '0605');
INSERT INTO `fw_code` VALUES ('4122225', '3321', '482', '1142', '4758', '5953');
INSERT INTO `fw_code` VALUES ('4122226', '3321', '483', '2825', '7786', '3265');
INSERT INTO `fw_code` VALUES ('4122227', '3321', '484', '1609', '0703', '9828');
INSERT INTO `fw_code` VALUES ('4122228', '3321', '485', '3639', '6651', '1497');
INSERT INTO `fw_code` VALUES ('4122229', '3321', '486', '3532', '7917', '2989');
INSERT INTO `fw_code` VALUES ('4122230', '3321', '487', '6416', '3738', '2730');
INSERT INTO `fw_code` VALUES ('4122231', '3321', '488', '0582', '4369', '4578');
INSERT INTO `fw_code` VALUES ('4122232', '3321', '489', '7484', '1079', '7819');
INSERT INTO `fw_code` VALUES ('4122233', '3321', '490', '9086', '2091', '5453');
INSERT INTO `fw_code` VALUES ('4122234', '3321', '491', '3171', '0707', '7623');
INSERT INTO `fw_code` VALUES ('4122235', '3321', '492', '2718', '9052', '4756');
INSERT INTO `fw_code` VALUES ('4122236', '3321', '493', '4493', '6524', '9569');
INSERT INTO `fw_code` VALUES ('4122237', '3321', '494', '4199', '8879', '6211');
INSERT INTO `fw_code` VALUES ('4122238', '3321', '495', '6829', '6224', '9095');
INSERT INTO `fw_code` VALUES ('4122239', '3321', '496', '4413', '6347', '3229');
INSERT INTO `fw_code` VALUES ('4122240', '3321', '497', '1061', '4581', '9613');
INSERT INTO `fw_code` VALUES ('4122241', '3321', '498', '6081', '5085', '9533');
INSERT INTO `fw_code` VALUES ('4122242', '3321', '499', '7256', '1161', '3131');
INSERT INTO `fw_code` VALUES ('4122243', '3321', '500', '2877', '3061', '4265');
INSERT INTO `fw_code` VALUES ('4122244', '3321', '501', '1743', '7994', '0506');
INSERT INTO `fw_code` VALUES ('4122245', '3321', '502', '0848', '7113', '2596');
INSERT INTO `fw_code` VALUES ('4122246', '3321', '503', '1849', '6728', '9015');
INSERT INTO `fw_code` VALUES ('4122247', '3321', '504', '5588', '2422', '6827');
INSERT INTO `fw_code` VALUES ('4122248', '3321', '505', '4947', '0018', '5774');
INSERT INTO `fw_code` VALUES ('4122249', '3321', '506', '3986', '1410', '9194');
INSERT INTO `fw_code` VALUES ('4122250', '3321', '507', '2597', '7867', '8578');
INSERT INTO `fw_code` VALUES ('4122251', '3321', '508', '2210', '3938', '4381');
INSERT INTO `fw_code` VALUES ('4122252', '3321', '509', '9286', '7109', '4801');
INSERT INTO `fw_code` VALUES ('4122253', '3321', '510', '2770', '4327', '5756');
INSERT INTO `fw_code` VALUES ('4122254', '3321', '511', '4626', '3815', '0247');
INSERT INTO `fw_code` VALUES ('4122255', '3321', '512', '7750', '3823', '5837');
INSERT INTO `fw_code` VALUES ('4122256', '3321', '513', '3452', '7740', '6649');
INSERT INTO `fw_code` VALUES ('4122257', '3321', '514', '9673', '1038', '8997');
INSERT INTO `fw_code` VALUES ('4122258', '3321', '515', '6229', '4827', '7881');
INSERT INTO `fw_code` VALUES ('4122259', '3321', '516', '6722', '7490', '0587');
INSERT INTO `fw_code` VALUES ('4122260', '3321', '517', '7297', '2168', '2970');
INSERT INTO `fw_code` VALUES ('4122261', '3321', '518', '5227', '5212', '1462');
INSERT INTO `fw_code` VALUES ('4122262', '3321', '519', '2984', '1796', '2774');
INSERT INTO `fw_code` VALUES ('4122263', '3321', '520', '8859', '2172', '0765');
INSERT INTO `fw_code` VALUES ('4122264', '3321', '521', '4306', '7613', '4720');
INSERT INTO `fw_code` VALUES ('4122265', '3321', '522', '3945', '0403', '9354');
INSERT INTO `fw_code` VALUES ('4122266', '3321', '523', '0247', '5716', '1381');
INSERT INTO `fw_code` VALUES ('4122267', '3321', '524', '4159', '7871', '6372');
INSERT INTO `fw_code` VALUES ('4122268', '3321', '525', '4479', '4073', '1899');
INSERT INTO `fw_code` VALUES ('4122269', '3321', '526', '3172', '2545', '0961');
INSERT INTO `fw_code` VALUES ('4122270', '3321', '527', '0674', '0653', '5417');
INSERT INTO `fw_code` VALUES ('4122271', '3321', '528', '9967', '0521', '5693');
INSERT INTO `fw_code` VALUES ('4122272', '3321', '529', '5161', '7486', '2792');
INSERT INTO `fw_code` VALUES ('4122273', '3321', '530', '8218', '9768', '9711');
INSERT INTO `fw_code` VALUES ('4122274', '3321', '531', '4266', '6605', '4881');
INSERT INTO `fw_code` VALUES ('4122275', '3321', '532', '1595', '8252', '2158');
INSERT INTO `fw_code` VALUES ('4122276', '3321', '533', '9006', '1914', '9113');
INSERT INTO `fw_code` VALUES ('4122277', '3321', '534', '3772', '3942', '2176');
INSERT INTO `fw_code` VALUES ('4122278', '3321', '535', '3732', '2934', '2337');
INSERT INTO `fw_code` VALUES ('4122279', '3321', '536', '6015', '7359', '0863');
INSERT INTO `fw_code` VALUES ('4122280', '3321', '537', '2490', '9133', '0069');
INSERT INTO `fw_code` VALUES ('4122281', '3321', '538', '8284', '7494', '8381');
INSERT INTO `fw_code` VALUES ('4122282', '3321', '539', '9032', '8633', '7944');
INSERT INTO `fw_code` VALUES ('4122283', '3321', '540', '6188', '3819', '8042');
INSERT INTO `fw_code` VALUES ('4122284', '3321', '541', '4372', '5339', '3390');
INSERT INTO `fw_code` VALUES ('4122285', '3321', '542', '8711', '2430', '2417');
INSERT INTO `fw_code` VALUES ('4122286', '3321', '543', '4840', '1283', '7265');
INSERT INTO `fw_code` VALUES ('4122287', '3321', '544', '6763', '8498', '0426');
INSERT INTO `fw_code` VALUES ('4122288', '3321', '545', '3812', '4950', '2015');
INSERT INTO `fw_code` VALUES ('4122289', '3321', '546', '0715', '1660', '5256');
INSERT INTO `fw_code` VALUES ('4122290', '3321', '547', '2317', '2672', '2890');
INSERT INTO `fw_code` VALUES ('4122291', '3321', '548', '6402', '1288', '5060');
INSERT INTO `fw_code` VALUES ('4122292', '3321', '549', '8604', '3696', '3908');
INSERT INTO `fw_code` VALUES ('4122293', '3321', '550', '7724', '7105', '7006');
INSERT INTO `fw_code` VALUES ('4122294', '3321', '551', '3665', '5208', '3667');
INSERT INTO `fw_code` VALUES ('4122295', '3321', '552', '1249', '5331', '7801');
INSERT INTO `fw_code` VALUES ('4122296', '3321', '553', '7897', '3565', '4185');
INSERT INTO `fw_code` VALUES ('4122297', '3321', '554', '2917', '4069', '4104');
INSERT INTO `fw_code` VALUES ('4122298', '3321', '555', '4092', '0145', '7702');
INSERT INTO `fw_code` VALUES ('4122299', '3321', '556', '9713', '2045', '8836');
INSERT INTO `fw_code` VALUES ('4122300', '3321', '557', '8579', '6978', '5077');
INSERT INTO `fw_code` VALUES ('4122301', '3321', '558', '7964', '1292', '2854');
INSERT INTO `fw_code` VALUES ('4122302', '3321', '559', '7684', '6097', '7167');
INSERT INTO `fw_code` VALUES ('4122303', '3321', '560', '8685', '5712', '3586');
INSERT INTO `fw_code` VALUES ('4122304', '3321', '561', '2424', '1406', '1399');
INSERT INTO `fw_code` VALUES ('4122305', '3321', '562', '3518', '5466', '5319');
INSERT INTO `fw_code` VALUES ('4122306', '3321', '563', '1783', '9002', '0345');
INSERT INTO `fw_code` VALUES ('4122307', '3321', '564', '0822', '0394', '3765');
INSERT INTO `fw_code` VALUES ('4122308', '3321', '565', '2236', '0657', '3212');
INSERT INTO `fw_code` VALUES ('4122309', '3321', '566', '1702', '6986', '0667');
INSERT INTO `fw_code` VALUES ('4122310', '3321', '567', '6122', '6093', '9372');
INSERT INTO `fw_code` VALUES ('4122311', '3321', '568', '9606', '3311', '0328');
INSERT INTO `fw_code` VALUES ('4122312', '3321', '569', '1463', '2799', '4818');
INSERT INTO `fw_code` VALUES ('4122313', '3321', '570', '2129', '1923', '4703');
INSERT INTO `fw_code` VALUES ('4122314', '3321', '571', '4586', '2807', '0408');
INSERT INTO `fw_code` VALUES ('4122315', '3321', '572', '0288', '6724', '1220');
INSERT INTO `fw_code` VALUES ('4122316', '3321', '573', '6509', '0022', '3569');
INSERT INTO `fw_code` VALUES ('4122317', '3321', '574', '3065', '3811', '2452');
INSERT INTO `fw_code` VALUES ('4122318', '3321', '575', '3558', '6474', '5158');
INSERT INTO `fw_code` VALUES ('4122319', '3321', '576', '6789', '5216', '9256');
INSERT INTO `fw_code` VALUES ('4122320', '3321', '577', '2063', '4196', '6033');
INSERT INTO `fw_code` VALUES ('4122321', '3321', '578', '9820', '0780', '7345');
INSERT INTO `fw_code` VALUES ('4122322', '3321', '579', '5695', '1156', '5336');
INSERT INTO `fw_code` VALUES ('4122323', '3321', '580', '0781', '9387', '3926');
INSERT INTO `fw_code` VALUES ('4122324', '3321', '581', '7083', '4700', '5952');
INSERT INTO `fw_code` VALUES ('4122325', '3321', '582', '0995', '6855', '0944');
INSERT INTO `fw_code` VALUES ('4122326', '3321', '583', '1315', '3057', '6470');
INSERT INTO `fw_code` VALUES ('4122327', '3321', '584', '2663', '5593', '7247');
INSERT INTO `fw_code` VALUES ('4122328', '3321', '585', '7510', '9637', '9988');
INSERT INTO `fw_code` VALUES ('4122329', '3321', '586', '3227', '1014', '3394');
INSERT INTO `fw_code` VALUES ('4122330', '3321', '587', '5765', '3915', '8778');
INSERT INTO `fw_code` VALUES ('4122331', '3321', '588', '8822', '6197', '5698');
INSERT INTO `fw_code` VALUES ('4122332', '3321', '589', '4870', '3034', '0867');
INSERT INTO `fw_code` VALUES ('4122333', '3321', '590', '2200', '4681', '8144');
INSERT INTO `fw_code` VALUES ('4122334', '3321', '591', '2266', '2407', '6814');
INSERT INTO `fw_code` VALUES ('4122335', '3321', '592', '4376', '0371', '8162');
INSERT INTO `fw_code` VALUES ('4122336', '3321', '593', '1625', '0003', '5760');
INSERT INTO `fw_code` VALUES ('4122337', '3321', '594', '4336', '9363', '8323');
INSERT INTO `fw_code` VALUES ('4122338', '3321', '595', '6619', '3788', '6849');
INSERT INTO `fw_code` VALUES ('4122339', '3321', '596', '3095', '5562', '6055');
INSERT INTO `fw_code` VALUES ('4122340', '3321', '597', '8888', '3923', '4367');
INSERT INTO `fw_code` VALUES ('4122341', '3321', '598', '9636', '5062', '3930');
INSERT INTO `fw_code` VALUES ('4122342', '3321', '599', '6793', '0248', '4028');
INSERT INTO `fw_code` VALUES ('4122343', '3321', '600', '4977', '1768', '9376');
INSERT INTO `fw_code` VALUES ('4122344', '3321', '601', '9316', '8860', '8403');
INSERT INTO `fw_code` VALUES ('4122345', '3321', '602', '7367', '4927', '6412');
INSERT INTO `fw_code` VALUES ('4122346', '3321', '603', '2907', '4812', '7867');
INSERT INTO `fw_code` VALUES ('4122347', '3321', '604', '7073', '5443', '9716');
INSERT INTO `fw_code` VALUES ('4122348', '3321', '605', '3975', '2153', '2957');
INSERT INTO `fw_code` VALUES ('4122349', '3321', '606', '5577', '3165', '0591');
INSERT INTO `fw_code` VALUES ('4122350', '3321', '607', '7006', '7717', '1046');
INSERT INTO `fw_code` VALUES ('4122351', '3321', '608', '9209', '0125', '9894');
INSERT INTO `fw_code` VALUES ('4122352', '3321', '609', '0984', '7598', '4707');
INSERT INTO `fw_code` VALUES ('4122353', '3321', '610', '4295', '8356', '8484');
INSERT INTO `fw_code` VALUES ('4122354', '3321', '611', '4270', '1637', '9653');
INSERT INTO `fw_code` VALUES ('4122355', '3321', '612', '4509', '5824', '5501');
INSERT INTO `fw_code` VALUES ('4122356', '3321', '613', '8502', '9994', '0171');
INSERT INTO `fw_code` VALUES ('4122357', '3321', '614', '3522', '0498', '0090');
INSERT INTO `fw_code` VALUES ('4122358', '3321', '615', '0317', '8475', '4823');
INSERT INTO `fw_code` VALUES ('4122359', '3321', '616', '1839', '7471', '2778');
INSERT INTO `fw_code` VALUES ('4122360', '3321', '617', '8568', '7721', '8841');
INSERT INTO `fw_code` VALUES ('4122361', '3321', '618', '8288', '2526', '3153');
INSERT INTO `fw_code` VALUES ('4122362', '3321', '619', '1946', '6205', '1287');
INSERT INTO `fw_code` VALUES ('4122363', '3321', '620', '5684', '1899', '9100');
INSERT INTO `fw_code` VALUES ('4122364', '3321', '621', '4122', '1895', '1305');
INSERT INTO `fw_code` VALUES ('4122365', '3321', '622', '5043', '9495', '8046');
INSERT INTO `fw_code` VALUES ('4122366', '3321', '623', '4082', '0887', '1466');
INSERT INTO `fw_code` VALUES ('4122367', '3321', '624', '2693', '7344', '0850');
INSERT INTO `fw_code` VALUES ('4122368', '3321', '625', '2841', '7086', '9198');
INSERT INTO `fw_code` VALUES ('4122369', '3321', '626', '2306', '3415', '6653');
INSERT INTO `fw_code` VALUES ('4122370', '3321', '627', '0211', '9740', '6314');
INSERT INTO `fw_code` VALUES ('4122371', '3321', '628', '4723', '3292', '2519');
INSERT INTO `fw_code` VALUES ('4122372', '3321', '629', '2734', '8352', '0689');
INSERT INTO `fw_code` VALUES ('4122373', '3321', '630', '5190', '9236', '6394');
INSERT INTO `fw_code` VALUES ('4122374', '3321', '631', '3548', '7217', '8921');
INSERT INTO `fw_code` VALUES ('4122375', '3321', '632', '7113', '6451', '9555');
INSERT INTO `fw_code` VALUES ('4122376', '3321', '633', '6325', '4304', '0153');
INSERT INTO `fw_code` VALUES ('4122377', '3321', '634', '4163', '2903', '1144');
INSERT INTO `fw_code` VALUES ('4122378', '3321', '635', '7393', '1645', '5242');
INSERT INTO `fw_code` VALUES ('4122379', '3321', '636', '2667', '0625', '2019');
INSERT INTO `fw_code` VALUES ('4122380', '3321', '637', '0424', '7209', '3332');
INSERT INTO `fw_code` VALUES ('4122381', '3321', '638', '4402', '7090', '6992');
INSERT INTO `fw_code` VALUES ('4122382', '3321', '639', '1386', '5816', '9912');
INSERT INTO `fw_code` VALUES ('4122383', '3321', '640', '1599', '3284', '6930');
INSERT INTO `fw_code` VALUES ('4122384', '3321', '641', '1920', '9486', '2457');
INSERT INTO `fw_code` VALUES ('4122385', '3321', '642', '3268', '2022', '3233');
INSERT INTO `fw_code` VALUES ('4122386', '3321', '643', '0771', '0130', '7689');
INSERT INTO `fw_code` VALUES ('4122387', '3321', '644', '0063', '9998', '7966');
INSERT INTO `fw_code` VALUES ('4122388', '3321', '645', '5257', '6963', '5064');
INSERT INTO `fw_code` VALUES ('4122389', '3321', '646', '5658', '5181', '0269');
INSERT INTO `fw_code` VALUES ('4122390', '3321', '647', '9036', '3665', '2715');
INSERT INTO `fw_code` VALUES ('4122391', '3321', '648', '9102', '1391', '1385');
INSERT INTO `fw_code` VALUES ('4122392', '3321', '649', '3868', '3419', '4448');
INSERT INTO `fw_code` VALUES ('4122393', '3321', '650', '8461', '8987', '0332');
INSERT INTO `fw_code` VALUES ('4122394', '3321', '651', '6111', '6836', '3135');
INSERT INTO `fw_code` VALUES ('4122395', '3321', '652', '2586', '8610', '2341');
INSERT INTO `fw_code` VALUES ('4122396', '3321', '653', '5724', '2907', '8939');
INSERT INTO `fw_code` VALUES ('4122397', '3321', '654', '6472', '4046', '8501');
INSERT INTO `fw_code` VALUES ('4122398', '3321', '655', '7397', '6677', '0014');
INSERT INTO `fw_code` VALUES ('4122399', '3321', '656', '5581', '8197', '5362');
INSERT INTO `fw_code` VALUES ('4122400', '3321', '657', '9920', '5289', '4389');
INSERT INTO `fw_code` VALUES ('4122401', '3321', '658', '8705', '8206', '0952');
INSERT INTO `fw_code` VALUES ('4122402', '3321', '659', '0734', '4154', '2621');
INSERT INTO `fw_code` VALUES ('4122403', '3321', '660', '0627', '5420', '4113');
INSERT INTO `fw_code` VALUES ('4122404', '3321', '661', '3511', '1241', '3854');
INSERT INTO `fw_code` VALUES ('4122405', '3321', '662', '7677', '1872', '5702');
INSERT INTO `fw_code` VALUES ('4122406', '3321', '663', '4579', '8582', '8943');
INSERT INTO `fw_code` VALUES ('4122407', '3321', '664', '6182', '9594', '6577');
INSERT INTO `fw_code` VALUES ('4122408', '3321', '665', '7611', '4146', '7032');
INSERT INTO `fw_code` VALUES ('4122409', '3321', '666', '1589', '4027', '0693');
INSERT INTO `fw_code` VALUES ('4122410', '3321', '667', '4900', '4785', '4470');
INSERT INTO `fw_code` VALUES ('4122411', '3321', '668', '7530', '2130', '7354');
INSERT INTO `fw_code` VALUES ('4122412', '3321', '669', '5113', '2253', '1488');
INSERT INTO `fw_code` VALUES ('4122413', '3321', '670', '9106', '6423', '6157');
INSERT INTO `fw_code` VALUES ('4122414', '3321', '671', '6782', '0991', '7791');
INSERT INTO `fw_code` VALUES ('4122415', '3321', '672', '7957', '7067', '1389');
INSERT INTO `fw_code` VALUES ('4122416', '3321', '673', '0922', '4904', '0809');
INSERT INTO `fw_code` VALUES ('4122417', '3321', '674', '2443', '3900', '8764');
INSERT INTO `fw_code` VALUES ('4122418', '3321', '675', '9172', '4150', '4827');
INSERT INTO `fw_code` VALUES ('4122419', '3321', '676', '8892', '8955', '9139');
INSERT INTO `fw_code` VALUES ('4122420', '3321', '677', '2550', '2634', '7273');
INSERT INTO `fw_code` VALUES ('4122421', '3321', '678', '6288', '8328', '5086');
INSERT INTO `fw_code` VALUES ('4122422', '3321', '679', '5648', '5924', '4032');
INSERT INTO `fw_code` VALUES ('4122423', '3321', '680', '4686', '7317', '7452');
INSERT INTO `fw_code` VALUES ('4122424', '3321', '681', '3298', '3773', '6836');
INSERT INTO `fw_code` VALUES ('4122425', '3321', '682', '3445', '3515', '5184');
INSERT INTO `fw_code` VALUES ('4122426', '3321', '683', '9986', '3015', '3059');
INSERT INTO `fw_code` VALUES ('4122427', '3321', '684', '0815', '6169', '2300');
INSERT INTO `fw_code` VALUES ('4122428', '3321', '685', '5327', '9721', '8505');
INSERT INTO `fw_code` VALUES ('4122429', '3321', '686', '3338', '4781', '6675');
INSERT INTO `fw_code` VALUES ('4122430', '3321', '687', '4152', '3646', '4907');
INSERT INTO `fw_code` VALUES ('4122431', '3321', '688', '7717', '2880', '5541');
INSERT INTO `fw_code` VALUES ('4122432', '3321', '689', '7423', '3396', '8845');
INSERT INTO `fw_code` VALUES ('4122433', '3321', '690', '7997', '8074', '1229');
INSERT INTO `fw_code` VALUES ('4122434', '3321', '691', '5927', '1118', '9720');
INSERT INTO `fw_code` VALUES ('4122435', '3321', '692', '9559', '8079', '9023');
INSERT INTO `fw_code` VALUES ('4122436', '3321', '693', '5007', '3519', '2979');
INSERT INTO `fw_code` VALUES ('4122437', '3321', '694', '4646', '6309', '7613');
INSERT INTO `fw_code` VALUES ('4122438', '3321', '695', '0948', '1622', '9639');
INSERT INTO `fw_code` VALUES ('4122439', '3321', '696', '4859', '3777', '4630');
INSERT INTO `fw_code` VALUES ('4122440', '3321', '697', '5180', '9979', '0157');
INSERT INTO `fw_code` VALUES ('4122441', '3321', '698', '3872', '8451', '9220');
INSERT INTO `fw_code` VALUES ('4122442', '3321', '699', '1375', '6559', '3675');
INSERT INTO `fw_code` VALUES ('4122443', '3321', '700', '0668', '6428', '3952');
INSERT INTO `fw_code` VALUES ('4122444', '3321', '701', '5861', '3392', '1050');
INSERT INTO `fw_code` VALUES ('4122445', '3321', '702', '8918', '5674', '7970');
INSERT INTO `fw_code` VALUES ('4122446', '3321', '703', '4966', '2511', '3139');
INSERT INTO `fw_code` VALUES ('4122447', '3321', '704', '9640', '0094', '8702');
INSERT INTO `fw_code` VALUES ('4122448', '3321', '705', '9706', '7820', '7371');
INSERT INTO `fw_code` VALUES ('4122449', '3321', '706', '4473', '9848', '0434');
INSERT INTO `fw_code` VALUES ('4122450', '3321', '707', '9066', '5416', '6318');
INSERT INTO `fw_code` VALUES ('4122451', '3321', '708', '4432', '8840', '0595');
INSERT INTO `fw_code` VALUES ('4122452', '3321', '709', '6716', '3265', '9121');
INSERT INTO `fw_code` VALUES ('4122453', '3321', '710', '3191', '5039', '8327');
INSERT INTO `fw_code` VALUES ('4122454', '3321', '711', '6329', '9336', '4925');
INSERT INTO `fw_code` VALUES ('4122455', '3321', '712', '7077', '0475', '4487');
INSERT INTO `fw_code` VALUES ('4122456', '3321', '713', '6889', '9725', '6300');
INSERT INTO `fw_code` VALUES ('4122457', '3321', '714', '5073', '1245', '1648');
INSERT INTO `fw_code` VALUES ('4122458', '3321', '715', '6756', '4273', '8961');
INSERT INTO `fw_code` VALUES ('4122459', '3321', '716', '5541', '7190', '5523');
INSERT INTO `fw_code` VALUES ('4122460', '3321', '717', '7570', '3138', '7193');
INSERT INTO `fw_code` VALUES ('4122461', '3321', '718', '7463', '4404', '8684');
INSERT INTO `fw_code` VALUES ('4122462', '3321', '719', '0347', '0225', '8425');
INSERT INTO `fw_code` VALUES ('4122463', '3321', '720', '1415', '7566', '3514');
INSERT INTO `fw_code` VALUES ('4122464', '3321', '721', '3018', '8578', '1148');
INSERT INTO `fw_code` VALUES ('4122465', '3321', '722', '7102', '7194', '3318');
INSERT INTO `fw_code` VALUES ('4122466', '3321', '723', '6649', '5539', '0452');
INSERT INTO `fw_code` VALUES ('4122467', '3321', '724', '4366', '1114', '1925');
INSERT INTO `fw_code` VALUES ('4122468', '3321', '725', '1949', '1237', '6059');
INSERT INTO `fw_code` VALUES ('4122469', '3321', '726', '8598', '9471', '2443');
INSERT INTO `fw_code` VALUES ('4122470', '3321', '727', '3618', '9975', '2363');
INSERT INTO `fw_code` VALUES ('4122471', '3321', '728', '4793', '6051', '5961');
INSERT INTO `fw_code` VALUES ('4122472', '3321', '729', '0414', '7952', '7095');
INSERT INTO `fw_code` VALUES ('4122473', '3321', '730', '9279', '2884', '3336');
INSERT INTO `fw_code` VALUES ('4122474', '3321', '731', '6008', '3134', '9398');
INSERT INTO `fw_code` VALUES ('4122475', '3321', '732', '8384', '2003', '5425');
INSERT INTO `fw_code` VALUES ('4122476', '3321', '733', '9386', '1618', '1845');
INSERT INTO `fw_code` VALUES ('4122477', '3321', '734', '1563', '7308', '1862');
INSERT INTO `fw_code` VALUES ('4122478', '3321', '735', '2484', '4908', '8603');
INSERT INTO `fw_code` VALUES ('4122479', '3321', '736', '1522', '6301', '2023');
INSERT INTO `fw_code` VALUES ('4122480', '3321', '737', '0134', '2757', '1407');
INSERT INTO `fw_code` VALUES ('4122481', '3321', '738', '0281', '2499', '9755');
INSERT INTO `fw_code` VALUES ('4122482', '3321', '739', '9747', '8828', '7211');
INSERT INTO `fw_code` VALUES ('4122483', '3321', '740', '6822', '1999', '7630');
INSERT INTO `fw_code` VALUES ('4122484', '3321', '741', '0307', '9217', '8586');
INSERT INTO `fw_code` VALUES ('4122485', '3321', '742', '2163', '8705', '3077');
INSERT INTO `fw_code` VALUES ('4122486', '3321', '743', '3942', '1210', '2661');
INSERT INTO `fw_code` VALUES ('4122487', '3321', '744', '9055', '6159', '0081');
INSERT INTO `fw_code` VALUES ('4122488', '3321', '745', '4756', '0075', '0893');
INSERT INTO `fw_code` VALUES ('4122489', '3321', '746', '0978', '3373', '3242');
INSERT INTO `fw_code` VALUES ('4122490', '3321', '747', '7534', '7162', '2125');
INSERT INTO `fw_code` VALUES ('4122491', '3321', '748', '8027', '9825', '4831');
INSERT INTO `fw_code` VALUES ('4122492', '3321', '749', '6532', '7547', '5706');
INSERT INTO `fw_code` VALUES ('4122493', '3321', '750', '4289', '4131', '7018');
INSERT INTO `fw_code` VALUES ('4122494', '3321', '751', '0164', '4508', '5009');
INSERT INTO `fw_code` VALUES ('4122495', '3321', '752', '5611', '9948', '8965');
INSERT INTO `fw_code` VALUES ('4122496', '3321', '753', '5250', '2738', '3599');
INSERT INTO `fw_code` VALUES ('4122497', '3321', '754', '1552', '8051', '5625');
INSERT INTO `fw_code` VALUES ('4122498', '3321', '755', '5464', '0206', '0617');
INSERT INTO `fw_code` VALUES ('4122499', '3321', '756', '5784', '6408', '6143');
INSERT INTO `fw_code` VALUES ('4122500', '3321', '757', '4476', '4880', '5206');
INSERT INTO `fw_code` VALUES ('4122501', '3321', '758', '1979', '2988', '9661');
INSERT INTO `fw_code` VALUES ('4122502', '3321', '759', '1272', '2857', '9938');
INSERT INTO `fw_code` VALUES ('4122503', '3321', '760', '6465', '9821', '7036');
INSERT INTO `fw_code` VALUES ('4122504', '3321', '761', '9523', '2103', '3956');
INSERT INTO `fw_code` VALUES ('4122505', '3321', '762', '5571', '8940', '9126');
INSERT INTO `fw_code` VALUES ('4122506', '3321', '763', '2900', '0587', '6402');
INSERT INTO `fw_code` VALUES ('4122507', '3321', '764', '0311', '4250', '3358');
INSERT INTO `fw_code` VALUES ('4122508', '3321', '765', '5077', '6277', '6420');
INSERT INTO `fw_code` VALUES ('4122509', '3321', '766', '9670', '1845', '2304');
INSERT INTO `fw_code` VALUES ('4122510', '3321', '767', '5036', '5270', '6581');
INSERT INTO `fw_code` VALUES ('4122511', '3321', '768', '7320', '9694', '5108');
INSERT INTO `fw_code` VALUES ('4122512', '3321', '769', '3795', '1468', '4313');
INSERT INTO `fw_code` VALUES ('4122513', '3321', '770', '9589', '9829', '2626');
INSERT INTO `fw_code` VALUES ('4122514', '3321', '771', '0337', '0968', '2188');
INSERT INTO `fw_code` VALUES ('4122515', '3321', '772', '7493', '6154', '2286');
INSERT INTO `fw_code` VALUES ('4122516', '3321', '773', '5677', '7674', '7634');
INSERT INTO `fw_code` VALUES ('4122517', '3321', '774', '0016', '4766', '6661');
INSERT INTO `fw_code` VALUES ('4122518', '3321', '775', '6145', '3619', '1509');
INSERT INTO `fw_code` VALUES ('4122519', '3321', '776', '8175', '9567', '3179');
INSERT INTO `fw_code` VALUES ('4122520', '3321', '777', '8068', '0833', '4670');
INSERT INTO `fw_code` VALUES ('4122521', '3321', '778', '0952', '6654', '4411');
INSERT INTO `fw_code` VALUES ('4122522', '3321', '779', '5117', '7285', '6259');
INSERT INTO `fw_code` VALUES ('4122523', '3321', '780', '2020', '3996', '9500');
INSERT INTO `fw_code` VALUES ('4122524', '3321', '781', '3622', '5007', '7134');
INSERT INTO `fw_code` VALUES ('4122525', '3321', '782', '7707', '3623', '9304');
INSERT INTO `fw_code` VALUES ('4122526', '3321', '783', '9909', '6032', '8152');
INSERT INTO `fw_code` VALUES ('4122527', '3321', '784', '9029', '9440', '1250');
INSERT INTO `fw_code` VALUES ('4122528', '3321', '785', '2340', '0198', '5027');
INSERT INTO `fw_code` VALUES ('4122529', '3321', '786', '4970', '7543', '7911');
INSERT INTO `fw_code` VALUES ('4122530', '3321', '787', '2554', '7666', '2045');
INSERT INTO `fw_code` VALUES ('4122531', '3321', '788', '9202', '5900', '8429');
INSERT INTO `fw_code` VALUES ('4122532', '3321', '789', '4222', '6404', '8349');
INSERT INTO `fw_code` VALUES ('4122533', '3321', '790', '5397', '2480', '1947');
INSERT INTO `fw_code` VALUES ('4122534', '3321', '791', '1018', '4381', '3081');
INSERT INTO `fw_code` VALUES ('4122535', '3321', '792', '9884', '9313', '9322');
INSERT INTO `fw_code` VALUES ('4122536', '3321', '793', '9269', '3627', '7099');
INSERT INTO `fw_code` VALUES ('4122537', '3321', '794', '8989', '8432', '1411');
INSERT INTO `fw_code` VALUES ('4122538', '3321', '795', '9990', '8047', '7831');
INSERT INTO `fw_code` VALUES ('4122539', '3321', '796', '3729', '3742', '5643');
INSERT INTO `fw_code` VALUES ('4122540', '3321', '797', '4823', '7801', '9563');
INSERT INTO `fw_code` VALUES ('4122541', '3321', '798', '3088', '1337', '4590');
INSERT INTO `fw_code` VALUES ('4122542', '3321', '799', '2127', '2730', '8009');
INSERT INTO `fw_code` VALUES ('4122543', '3321', '800', '0738', '9186', '7393');
INSERT INTO `fw_code` VALUES ('4122544', '3321', '801', '3541', '2992', '7456');
INSERT INTO `fw_code` VALUES ('4122545', '3321', '802', '3007', '9321', '4911');
INSERT INTO `fw_code` VALUES ('4122546', '3321', '803', '7427', '8428', '3616');
INSERT INTO `fw_code` VALUES ('4122547', '3321', '804', '0911', '5646', '4572');
INSERT INTO `fw_code` VALUES ('4122548', '3321', '805', '2767', '5134', '9063');
INSERT INTO `fw_code` VALUES ('4122549', '3321', '806', '3434', '4258', '8947');
INSERT INTO `fw_code` VALUES ('4122550', '3321', '807', '5891', '5143', '4652');
INSERT INTO `fw_code` VALUES ('4122551', '3321', '808', '1593', '9059', '5465');
INSERT INTO `fw_code` VALUES ('4122552', '3321', '809', '7814', '2357', '7813');
INSERT INTO `fw_code` VALUES ('4122553', '3321', '810', '4370', '6146', '6697');
INSERT INTO `fw_code` VALUES ('4122554', '3321', '811', '4863', '8809', '9402');
INSERT INTO `fw_code` VALUES ('4122555', '3321', '812', '8094', '7551', '3501');
INSERT INTO `fw_code` VALUES ('4122556', '3321', '813', '3368', '6531', '0277');
INSERT INTO `fw_code` VALUES ('4122557', '3321', '814', '1125', '3115', '1590');
INSERT INTO `fw_code` VALUES ('4122558', '3321', '815', '2447', '8932', '3536');
INSERT INTO `fw_code` VALUES ('4122559', '3321', '816', '2086', '1722', '8170');
INSERT INTO `fw_code` VALUES ('4122560', '3321', '817', '8388', '7035', '0197');
INSERT INTO `fw_code` VALUES ('4122561', '3321', '818', '2300', '9190', '5188');
INSERT INTO `fw_code` VALUES ('4122562', '3321', '819', '2620', '5393', '0715');
INSERT INTO `fw_code` VALUES ('4122563', '3321', '820', '3968', '7928', '1492');
INSERT INTO `fw_code` VALUES ('4122564', '3321', '821', '8815', '1972', '4233');
INSERT INTO `fw_code` VALUES ('4122565', '3321', '822', '0764', '5905', '6224');
INSERT INTO `fw_code` VALUES ('4122566', '3321', '823', '3302', '8805', '1607');
INSERT INTO `fw_code` VALUES ('4122567', '3321', '824', '6359', '1087', '8527');
INSERT INTO `fw_code` VALUES ('4122568', '3321', '825', '2407', '7924', '3697');
INSERT INTO `fw_code` VALUES ('4122569', '3321', '826', '9736', '9571', '0974');
INSERT INTO `fw_code` VALUES ('4122570', '3321', '827', '9803', '7297', '9643');
INSERT INTO `fw_code` VALUES ('4122571', '3321', '828', '1913', '5261', '0991');
INSERT INTO `fw_code` VALUES ('4122572', '3321', '829', '9162', '4893', '8590');
INSERT INTO `fw_code` VALUES ('4122573', '3321', '830', '1873', '4254', '1152');
INSERT INTO `fw_code` VALUES ('4122574', '3321', '831', '4156', '8678', '9679');
INSERT INTO `fw_code` VALUES ('4122575', '3321', '832', '0631', '0452', '8884');
INSERT INTO `fw_code` VALUES ('4122576', '3321', '833', '6425', '8813', '7197');
INSERT INTO `fw_code` VALUES ('4122577', '3321', '834', '7173', '9952', '6759');
INSERT INTO `fw_code` VALUES ('4122578', '3321', '835', '4329', '5139', '6858');
INSERT INTO `fw_code` VALUES ('4122579', '3321', '836', '8285', '2000', '8213');
INSERT INTO `fw_code` VALUES ('4122580', '3321', '837', '2624', '9091', '7240');
INSERT INTO `fw_code` VALUES ('4122581', '3321', '838', '0782', '3892', '3758');
INSERT INTO `fw_code` VALUES ('4122582', '3321', '839', '0675', '5158', '5249');
INSERT INTO `fw_code` VALUES ('4122583', '3321', '840', '6215', '5044', '6704');
INSERT INTO `fw_code` VALUES ('4122584', '3321', '841', '7283', '2385', '1794');
INSERT INTO `fw_code` VALUES ('4122585', '3321', '842', '8885', '3397', '9427');
INSERT INTO `fw_code` VALUES ('4122586', '3321', '843', '0314', '7948', '9883');
INSERT INTO `fw_code` VALUES ('4122587', '3321', '844', '2517', '0357', '8731');
INSERT INTO `fw_code` VALUES ('4122588', '3321', '845', '4292', '7829', '3544');
INSERT INTO `fw_code` VALUES ('4122589', '3321', '846', '7604', '8587', '7320');
INSERT INTO `fw_code` VALUES ('4122590', '3321', '847', '7817', '6055', '4338');
INSERT INTO `fw_code` VALUES ('4122591', '3321', '848', '1810', '0226', '9008');
INSERT INTO `fw_code` VALUES ('4122592', '3321', '849', '5147', '7702', '1615');
INSERT INTO `fw_code` VALUES ('4122593', '3321', '850', '1596', '2758', '1990');
INSERT INTO `fw_code` VALUES ('4122594', '3321', '851', '5254', '6436', '0124');
INSERT INTO `fw_code` VALUES ('4122595', '3321', '852', '8992', '2131', '7936');
INSERT INTO `fw_code` VALUES ('4122596', '3321', '853', '7431', '2127', '0142');
INSERT INTO `fw_code` VALUES ('4122597', '3321', '854', '8351', '9726', '6883');
INSERT INTO `fw_code` VALUES ('4122598', '3321', '855', '7390', '1119', '0302');
INSERT INTO `fw_code` VALUES ('4122599', '3321', '856', '6002', '7575', '9686');
INSERT INTO `fw_code` VALUES ('4122600', '3321', '857', '5615', '3647', '5490');
INSERT INTO `fw_code` VALUES ('4122601', '3321', '858', '0035', '2754', '4195');
INSERT INTO `fw_code` VALUES ('4122602', '3321', '859', '3519', '9972', '5151');
INSERT INTO `fw_code` VALUES ('4122603', '3321', '860', '8031', '3524', '1356');
INSERT INTO `fw_code` VALUES ('4122604', '3321', '861', '6042', '8583', '9526');
INSERT INTO `fw_code` VALUES ('4122605', '3321', '862', '8499', '9468', '5231');
INSERT INTO `fw_code` VALUES ('4122606', '3321', '863', '6856', '7448', '7758');
INSERT INTO `fw_code` VALUES ('4122607', '3321', '864', '0421', '6682', '8392');
INSERT INTO `fw_code` VALUES ('4122608', '3321', '865', '9633', '4536', '8990');
INSERT INTO `fw_code` VALUES ('4122609', '3321', '866', '7471', '3135', '9981');
INSERT INTO `fw_code` VALUES ('4122610', '3321', '867', '0701', '1877', '4079');
INSERT INTO `fw_code` VALUES ('4122611', '3321', '868', '3733', '7440', '2168');
INSERT INTO `fw_code` VALUES ('4122612', '3321', '869', '7711', '7321', '5829');
INSERT INTO `fw_code` VALUES ('4122613', '3321', '870', '4694', '6047', '8749');
INSERT INTO `fw_code` VALUES ('4122614', '3321', '871', '0996', '1361', '0775');
INSERT INTO `fw_code` VALUES ('4122615', '3321', '872', '4079', '0361', '6526');
INSERT INTO `fw_code` VALUES ('4122616', '3321', '873', '3372', '0230', '6802');
INSERT INTO `fw_code` VALUES ('4122617', '3321', '874', '2344', '3896', '1552');
INSERT INTO `fw_code` VALUES ('4122618', '3321', '875', '2410', '1623', '0222');
INSERT INTO `fw_code` VALUES ('4122619', '3321', '876', '7176', '3651', '3285');
INSERT INTO `fw_code` VALUES ('4122620', '3321', '877', '1769', '9218', '9169');
INSERT INTO `fw_code` VALUES ('4122621', '3321', '878', '4480', '8579', '1731');
INSERT INTO `fw_code` VALUES ('4122622', '3321', '879', '5895', '8841', '1178');
INSERT INTO `fw_code` VALUES ('4122623', '3321', '880', '9033', '3139', '7776');
INSERT INTO `fw_code` VALUES ('4122624', '3321', '881', '9780', '4277', '7338');
INSERT INTO `fw_code` VALUES ('4122625', '3321', '882', '9460', '8075', '1811');
INSERT INTO `fw_code` VALUES ('4122626', '3321', '883', '8245', '0992', '8374');
INSERT INTO `fw_code` VALUES ('4122627', '3321', '884', '0274', '6940', '0044');
INSERT INTO `fw_code` VALUES ('4122628', '3321', '885', '3051', '4028', '1276');
INSERT INTO `fw_code` VALUES ('4122629', '3321', '886', '7217', '4658', '3124');
INSERT INTO `fw_code` VALUES ('4122630', '3321', '887', '4119', '1369', '6365');
INSERT INTO `fw_code` VALUES ('4122631', '3321', '888', '5722', '2381', '3999');
INSERT INTO `fw_code` VALUES ('4122632', '3321', '889', '7151', '6932', '4454');
INSERT INTO `fw_code` VALUES ('4122633', '3321', '890', '1129', '6813', '8115');
INSERT INTO `fw_code` VALUES ('4122634', '3321', '891', '4440', '7571', '1892');
INSERT INTO `fw_code` VALUES ('4122635', '3321', '892', '7070', '4917', '4776');
INSERT INTO `fw_code` VALUES ('4122636', '3321', '893', '8646', '9210', '3579');
INSERT INTO `fw_code` VALUES ('4122637', '3321', '894', '6322', '3778', '5213');
INSERT INTO `fw_code` VALUES ('4122638', '3321', '895', '7497', '9853', '8811');
INSERT INTO `fw_code` VALUES ('4122639', '3321', '896', '0462', '7690', '8231');
INSERT INTO `fw_code` VALUES ('4122640', '3321', '897', '1983', '6686', '6186');
INSERT INTO `fw_code` VALUES ('4122641', '3321', '898', '8712', '6936', '2249');
INSERT INTO `fw_code` VALUES ('4122642', '3321', '899', '8432', '1742', '6561');
INSERT INTO `fw_code` VALUES ('4122643', '3321', '900', '9597', '8560', '3923');
INSERT INTO `fw_code` VALUES ('4122644', '3321', '901', '8035', '8556', '6128');
INSERT INTO `fw_code` VALUES ('4122645', '3321', '902', '7994', '7548', '6289');
INSERT INTO `fw_code` VALUES ('4122646', '3321', '903', '6606', '4004', '5673');
INSERT INTO `fw_code` VALUES ('4122647', '3321', '904', '6753', '3746', '4021');
INSERT INTO `fw_code` VALUES ('4122648', '3321', '905', '6219', '0076', '1476');
INSERT INTO `fw_code` VALUES ('4122649', '3321', '906', '3295', '3246', '1896');
INSERT INTO `fw_code` VALUES ('4122650', '3321', '907', '4123', '6401', '1137');
INSERT INTO `fw_code` VALUES ('4122651', '3321', '908', '8635', '9953', '7342');
INSERT INTO `fw_code` VALUES ('4122652', '3321', '909', '6646', '5012', '5512');
INSERT INTO `fw_code` VALUES ('4122653', '3321', '910', '9103', '5897', '1217');
INSERT INTO `fw_code` VALUES ('4122654', '3321', '911', '7460', '3877', '3744');
INSERT INTO `fw_code` VALUES ('4122655', '3321', '912', '1026', '3111', '4378');
INSERT INTO `fw_code` VALUES ('4122656', '3321', '913', '9236', '1350', '8557');
INSERT INTO `fw_code` VALUES ('4122657', '3321', '914', '4337', '3869', '8154');
INSERT INTO `fw_code` VALUES ('4122658', '3321', '915', '2867', '8310', '7860');
INSERT INTO `fw_code` VALUES ('4122659', '3321', '916', '8315', '3750', '1815');
INSERT INTO `fw_code` VALUES ('4122660', '3321', '917', '7954', '6540', '6449');
INSERT INTO `fw_code` VALUES ('4122661', '3321', '918', '8488', '0211', '8994');
INSERT INTO `fw_code` VALUES ('4122662', '3321', '919', '7180', '8683', '8056');
INSERT INTO `fw_code` VALUES ('4122663', '3321', '920', '4683', '6790', '2512');
INSERT INTO `fw_code` VALUES ('4122664', '3321', '921', '8274', '2743', '1976');
INSERT INTO `fw_code` VALUES ('4122665', '3321', '922', '2948', '0326', '7538');
INSERT INTO `fw_code` VALUES ('4122666', '3321', '923', '3015', '8052', '6208');
INSERT INTO `fw_code` VALUES ('4122667', '3321', '924', '7781', '0080', '9271');
INSERT INTO `fw_code` VALUES ('4122668', '3321', '925', '7740', '9072', '9432');
INSERT INTO `fw_code` VALUES ('4122669', '3321', '926', '0024', '3496', '7958');
INSERT INTO `fw_code` VALUES ('4122670', '3321', '927', '0197', '9957', '5137');
INSERT INTO `fw_code` VALUES ('4122671', '3321', '928', '8381', '1477', '0485');
INSERT INTO `fw_code` VALUES ('4122672', '3321', '929', '0878', '3369', '6030');
INSERT INTO `fw_code` VALUES ('4122673', '3321', '930', '0772', '4635', '7521');
INSERT INTO `fw_code` VALUES ('4122674', '3321', '931', '6326', '8810', '9985');
INSERT INTO `fw_code` VALUES ('4122675', '3321', '932', '1733', '3242', '4101');
INSERT INTO `fw_code` VALUES ('4122676', '3321', '933', '5044', '4000', '7878');
INSERT INTO `fw_code` VALUES ('4122677', '3321', '934', '1906', '9703', '1280');
INSERT INTO `fw_code` VALUES ('4122678', '3321', '935', '6926', '0207', '1199');
INSERT INTO `fw_code` VALUES ('4122679', '3321', '936', '8101', '6282', '4798');
INSERT INTO `fw_code` VALUES ('4122680', '3321', '937', '1692', '2235', '4262');
INSERT INTO `fw_code` VALUES ('4122681', '3321', '938', '2694', '1850', '0681');
INSERT INTO `fw_code` VALUES ('4122682', '3321', '939', '6433', '7544', '8494');
INSERT INTO `fw_code` VALUES ('4122683', '3321', '940', '4830', '6532', '0860');
INSERT INTO `fw_code` VALUES ('4122684', '3321', '941', '3615', '9449', '7423');
INSERT INTO `fw_code` VALUES ('4122685', '3321', '942', '7251', '1441', '1498');
INSERT INTO `fw_code` VALUES ('4122686', '3321', '943', '2363', '6390', '8918');
INSERT INTO `fw_code` VALUES ('4122687', '3321', '944', '8065', '0306', '9730');
INSERT INTO `fw_code` VALUES ('4122688', '3321', '945', '1336', '0057', '3668');
INSERT INTO `fw_code` VALUES ('4122689', '3321', '946', '1910', '4735', '6052');
INSERT INTO `fw_code` VALUES ('4122690', '3321', '947', '9840', '7779', '4543');
INSERT INTO `fw_code` VALUES ('4122691', '3321', '948', '3472', '4739', '3846');
INSERT INTO `fw_code` VALUES ('4122692', '3321', '949', '8919', '0179', '7802');
INSERT INTO `fw_code` VALUES ('4122693', '3321', '950', '8558', '2969', '2436');
INSERT INTO `fw_code` VALUES ('4122694', '3321', '951', '8772', '0438', '9453');
INSERT INTO `fw_code` VALUES ('4122695', '3321', '952', '9092', '6640', '4980');
INSERT INTO `fw_code` VALUES ('4122696', '3321', '953', '7785', '5112', '4043');
INSERT INTO `fw_code` VALUES ('4122697', '3321', '954', '4580', '3088', '8775');
INSERT INTO `fw_code` VALUES ('4122698', '3321', '955', '2831', '2334', '2793');
INSERT INTO `fw_code` VALUES ('4122699', '3321', '956', '6208', '0819', '5239');
INSERT INTO `fw_code` VALUES ('4122700', '3321', '957', '3619', '4481', '2194');
INSERT INTO `fw_code` VALUES ('4122701', '3321', '958', '2978', '2076', '1141');
INSERT INTO `fw_code` VALUES ('4122702', '3321', '959', '8345', '5501', '5418');
INSERT INTO `fw_code` VALUES ('4122703', '3321', '960', '7103', '1699', '3150');
INSERT INTO `fw_code` VALUES ('4122704', '3321', '961', '3645', '1200', '1025');
INSERT INTO `fw_code` VALUES ('4122705', '3321', '962', '0801', '6386', '1123');
INSERT INTO `fw_code` VALUES ('4122706', '3321', '963', '8986', '7906', '6471');
INSERT INTO `fw_code` VALUES ('4122707', '3321', '964', '9453', '3850', '0346');
INSERT INTO `fw_code` VALUES ('4122708', '3321', '965', '1483', '9799', '2016');
INSERT INTO `fw_code` VALUES ('4122709', '3321', '966', '1376', '1064', '3507');
INSERT INTO `fw_code` VALUES ('4122710', '3321', '967', '8426', '7517', '5096');
INSERT INTO `fw_code` VALUES ('4122711', '3321', '968', '6930', '5239', '5971');
INSERT INTO `fw_code` VALUES ('4122712', '3321', '969', '1015', '3854', '8141');
INSERT INTO `fw_code` VALUES ('4122713', '3321', '970', '3218', '6263', '6989');
INSERT INTO `fw_code` VALUES ('4122714', '3321', '971', '2337', '9672', '0087');
INSERT INTO `fw_code` VALUES ('4122715', '3321', '972', '8278', '7775', '6748');
INSERT INTO `fw_code` VALUES ('4122716', '3321', '973', '5862', '7898', '0882');
INSERT INTO `fw_code` VALUES ('4122717', '3321', '974', '2510', '6132', '7266');
INSERT INTO `fw_code` VALUES ('4122718', '3321', '975', '7531', '6636', '7185');
INSERT INTO `fw_code` VALUES ('4122719', '3321', '976', '4326', '4612', '1918');
INSERT INTO `fw_code` VALUES ('4122720', '3321', '977', '3192', '9545', '8159');
INSERT INTO `fw_code` VALUES ('4122721', '3321', '978', '2577', '3858', '5936');
INSERT INTO `fw_code` VALUES ('4122722', '3321', '979', '3299', '8279', '6668');
INSERT INTO `fw_code` VALUES ('4122723', '3321', '980', '7037', '3973', '4480');
INSERT INTO `fw_code` VALUES ('4122724', '3321', '981', '8131', '8033', '8400');
INSERT INTO `fw_code` VALUES ('4122725', '3321', '982', '5435', '2961', '6846');
INSERT INTO `fw_code` VALUES ('4122726', '3321', '983', '4046', '9418', '6230');
INSERT INTO `fw_code` VALUES ('4122727', '3321', '984', '6849', '3223', '6293');
INSERT INTO `fw_code` VALUES ('4122728', '3321', '985', '6315', '9553', '3748');
INSERT INTO `fw_code` VALUES ('4122729', '3321', '986', '0735', '8660', '2453');
INSERT INTO `fw_code` VALUES ('4122730', '3321', '987', '4219', '5878', '3409');
INSERT INTO `fw_code` VALUES ('4122731', '3321', '988', '6076', '5366', '7900');
INSERT INTO `fw_code` VALUES ('4122732', '3321', '989', '9199', '5374', '3489');
INSERT INTO `fw_code` VALUES ('4122733', '3321', '990', '4901', '9291', '4301');
INSERT INTO `fw_code` VALUES ('4122734', '3321', '991', '1122', '2588', '6650');
INSERT INTO `fw_code` VALUES ('4122735', '3321', '992', '7678', '6378', '5534');
INSERT INTO `fw_code` VALUES ('4122736', '3321', '993', '6676', '6763', '9114');
INSERT INTO `fw_code` VALUES ('4122737', '3321', '994', '4433', '3346', '0427');
INSERT INTO `fw_code` VALUES ('4122738', '3321', '995', '0308', '3723', '8418');
INSERT INTO `fw_code` VALUES ('4122739', '3321', '996', '5755', '9164', '2373');
INSERT INTO `fw_code` VALUES ('4122740', '3321', '997', '5394', '1953', '7007');
INSERT INTO `fw_code` VALUES ('4122741', '3321', '998', '1696', '7267', '9034');
INSERT INTO `fw_code` VALUES ('4122742', '3321', '999', '5928', '5624', '9552');
INSERT INTO `fw_code` VALUES ('4122743', '3321', '1000', '4072', '6136', '5061');
INSERT INTO `fw_code` VALUES ('4122744', '3321', '1001', '5715', '8156', '2534');
INSERT INTO `fw_code` VALUES ('4122745', '3321', '1002', '3111', '7529', '8480');
INSERT INTO `fw_code` VALUES ('4122746', '3321', '1003', '2470', '5124', '7427');
INSERT INTO `fw_code` VALUES ('4122747', '3321', '1004', '3888', '0418', '1645');
INSERT INTO `fw_code` VALUES ('4122748', '3321', '1005', '6157', '0554', '9163');
INSERT INTO `fw_code` VALUES ('4122749', '3321', '1006', '6905', '1693', '8726');
INSERT INTO `fw_code` VALUES ('4122750', '3321', '1007', '4062', '6879', '8824');
INSERT INTO `fw_code` VALUES ('4122751', '3321', '1008', '2246', '8399', '4172');
INSERT INTO `fw_code` VALUES ('4122752', '3321', '1009', '6585', '5490', '3199');
INSERT INTO `fw_code` VALUES ('4122753', '3321', '1010', '2713', '4343', '8047');
INSERT INTO `fw_code` VALUES ('4122754', '3321', '1011', '4743', '0291', '9717');
INSERT INTO `fw_code` VALUES ('4122755', '3321', '1012', '4636', '1557', '1208');
INSERT INTO `fw_code` VALUES ('4122756', '3321', '1013', '0176', '1443', '2663');
INSERT INTO `fw_code` VALUES ('4122757', '3321', '1014', '4342', '2074', '4511');
INSERT INTO `fw_code` VALUES ('4122758', '3321', '1015', '1244', '8784', '7753');
INSERT INTO `fw_code` VALUES ('4122759', '3321', '1016', '2846', '9796', '5386');
INSERT INTO `fw_code` VALUES ('4122760', '3321', '1017', '6478', '6756', '4690');
INSERT INTO `fw_code` VALUES ('4122761', '3321', '1018', '8253', '4228', '9503');
INSERT INTO `fw_code` VALUES ('4122762', '3321', '1019', '1564', '4986', '3279');
INSERT INTO `fw_code` VALUES ('4122763', '3321', '1020', '1778', '2454', '0297');
INSERT INTO `fw_code` VALUES ('4122764', '3321', '1021', '7586', '5105', '9618');
INSERT INTO `fw_code` VALUES ('4122765', '3321', '1022', '9108', '4101', '7574');
INSERT INTO `fw_code` VALUES ('4122766', '3321', '1023', '5837', '4351', '3636');
INSERT INTO `fw_code` VALUES ('4122767', '3321', '1024', '5557', '9157', '7949');
INSERT INTO `fw_code` VALUES ('4122768', '3321', '1025', '9215', '2835', '6083');
INSERT INTO `fw_code` VALUES ('4122769', '3321', '1026', '2953', '8530', '3895');
INSERT INTO `fw_code` VALUES ('4122770', '3321', '1027', '1391', '8526', '6101');
INSERT INTO `fw_code` VALUES ('4122771', '3321', '1028', '2312', '6125', '2842');
INSERT INTO `fw_code` VALUES ('4122772', '3321', '1029', '1351', '7518', '6262');
INSERT INTO `fw_code` VALUES ('4122773', '3321', '1030', '9962', '3974', '5645');
INSERT INTO `fw_code` VALUES ('4122774', '3321', '1031', '9575', '0046', '1449');
INSERT INTO `fw_code` VALUES ('4122775', '3321', '1032', '3995', '9153', '0154');
INSERT INTO `fw_code` VALUES ('4122776', '3321', '1033', '7480', '6371', '1110');
INSERT INTO `fw_code` VALUES ('4122777', '3321', '1034', '1992', '9923', '7315');
INSERT INTO `fw_code` VALUES ('4122778', '3321', '1035', '0003', '4982', '5485');
INSERT INTO `fw_code` VALUES ('4122779', '3321', '1036', '2459', '5867', '1190');
INSERT INTO `fw_code` VALUES ('4122780', '3321', '1037', '0817', '3847', '3717');
INSERT INTO `fw_code` VALUES ('4122781', '3321', '1038', '4382', '3081', '4351');
INSERT INTO `fw_code` VALUES ('4122782', '3321', '1039', '3594', '0935', '4949');
INSERT INTO `fw_code` VALUES ('4122783', '3321', '1040', '1432', '9534', '5940');
INSERT INTO `fw_code` VALUES ('4122784', '3321', '1041', '4662', '8276', '0038');
INSERT INTO `fw_code` VALUES ('4122785', '3321', '1042', '9936', '7256', '6815');
INSERT INTO `fw_code` VALUES ('4122786', '3321', '1043', '7693', '3839', '8127');
INSERT INTO `fw_code` VALUES ('4122787', '3321', '1044', '3568', '4216', '6118');
INSERT INTO `fw_code` VALUES ('4122788', '3321', '1045', '1671', '3720', '1788');
INSERT INTO `fw_code` VALUES ('4122789', '3321', '1046', '8868', '9915', '1726');
INSERT INTO `fw_code` VALUES ('4122790', '3321', '1047', '9189', '6117', '7252');
INSERT INTO `fw_code` VALUES ('4122791', '3321', '1048', '0537', '8653', '8029');
INSERT INTO `fw_code` VALUES ('4122792', '3321', '1049', '8040', '6760', '2485');
INSERT INTO `fw_code` VALUES ('4122793', '3321', '1050', '7332', '6629', '2761');
INSERT INTO `fw_code` VALUES ('4122794', '3321', '1051', '2526', '3593', '9860');
INSERT INTO `fw_code` VALUES ('4122795', '3321', '1052', '2927', '1811', '5065');
INSERT INTO `fw_code` VALUES ('4122796', '3321', '1053', '6305', '0296', '7511');
INSERT INTO `fw_code` VALUES ('4122797', '3321', '1054', '6371', '8022', '6181');
INSERT INTO `fw_code` VALUES ('4122798', '3321', '1055', '1137', '0050', '9244');
INSERT INTO `fw_code` VALUES ('4122799', '3321', '1056', '5730', '5617', '5128');
INSERT INTO `fw_code` VALUES ('4122800', '3321', '1057', '3380', '3466', '7931');
INSERT INTO `fw_code` VALUES ('4122801', '3321', '1058', '9855', '5240', '7137');
INSERT INTO `fw_code` VALUES ('4122802', '3321', '1059', '2993', '9538', '3735');
INSERT INTO `fw_code` VALUES ('4122803', '3321', '1060', '3741', '0677', '3297');
INSERT INTO `fw_code` VALUES ('4122804', '3321', '1061', '0898', '5863', '3395');
INSERT INTO `fw_code` VALUES ('4122805', '3321', '1062', '9082', '7383', '8743');
INSERT INTO `fw_code` VALUES ('4122806', '3321', '1063', '3421', '4474', '7770');
INSERT INTO `fw_code` VALUES ('4122807', '3321', '1064', '2205', '7391', '4333');
INSERT INTO `fw_code` VALUES ('4122808', '3321', '1065', '4235', '3339', '6003');
INSERT INTO `fw_code` VALUES ('4122809', '3321', '1066', '4128', '4605', '7494');
INSERT INTO `fw_code` VALUES ('4122810', '3321', '1067', '1178', '1058', '9083');
INSERT INTO `fw_code` VALUES ('4122811', '3321', '1068', '8080', '7768', '2324');
INSERT INTO `fw_code` VALUES ('4122812', '3321', '1069', '9682', '8780', '9958');
INSERT INTO `fw_code` VALUES ('4122813', '3321', '1070', '1111', '3331', '0413');
INSERT INTO `fw_code` VALUES ('4122814', '3321', '1071', '3314', '5740', '9261');
INSERT INTO `fw_code` VALUES ('4122815', '3321', '1072', '5089', '3212', '4074');
INSERT INTO `fw_code` VALUES ('4122816', '3321', '1073', '1030', '1316', '0735');
INSERT INTO `fw_code` VALUES ('4122817', '3321', '1074', '8614', '1439', '4869');
INSERT INTO `fw_code` VALUES ('4122818', '3321', '1075', '2607', '5609', '9538');
INSERT INTO `fw_code` VALUES ('4122819', '3321', '1076', '0283', '0177', '1172');
INSERT INTO `fw_code` VALUES ('4122820', '3321', '1077', '1458', '6252', '4770');
INSERT INTO `fw_code` VALUES ('4122821', '3321', '1078', '4422', '4089', '4190');
INSERT INTO `fw_code` VALUES ('4122822', '3321', '1079', '9683', '0618', '3296');
INSERT INTO `fw_code` VALUES ('4122823', '3321', '1080', '6412', '0868', '9359');
INSERT INTO `fw_code` VALUES ('4122824', '3321', '1081', '9790', '9352', '1805');
INSERT INTO `fw_code` VALUES ('4122825', '3321', '1082', '2887', '2642', '8564');
INSERT INTO `fw_code` VALUES ('4122826', '3321', '1083', '1926', '4035', '1984');
INSERT INTO `fw_code` VALUES ('4122827', '3321', '1084', '7226', '9733', '7591');
INSERT INTO `fw_code` VALUES ('4122828', '3321', '1085', '8055', '2888', '6832');
INSERT INTO `fw_code` VALUES ('4122829', '3321', '1086', '2567', '6440', '3038');
INSERT INTO `fw_code` VALUES ('4122830', '3321', '1087', '3034', '2384', '6912');
INSERT INTO `fw_code` VALUES ('4122831', '3321', '1088', '1392', '0364', '9439');
INSERT INTO `fw_code` VALUES ('4122832', '3321', '1089', '4169', '7452', '0671');
INSERT INTO `fw_code` VALUES ('4122833', '3321', '1090', '4663', '0114', '3377');
INSERT INTO `fw_code` VALUES ('4122834', '3321', '1091', '5237', '4793', '5761');
INSERT INTO `fw_code` VALUES ('4122835', '3321', '1092', '3167', '7837', '4252');
INSERT INTO `fw_code` VALUES ('4122836', '3321', '1093', '6799', '4797', '3555');
INSERT INTO `fw_code` VALUES ('4122837', '3321', '1094', '2419', '6698', '4689');
INSERT INTO `fw_code` VALUES ('4122838', '3321', '1095', '8615', '3277', '8207');
INSERT INTO `fw_code` VALUES ('4122839', '3321', '1096', '3101', '0110', '5582');
INSERT INTO `fw_code` VALUES ('4122840', '3321', '1097', '2206', '9230', '7672');
INSERT INTO `fw_code` VALUES ('4122841', '3321', '1098', '6946', '4539', '1904');
INSERT INTO `fw_code` VALUES ('4122842', '3321', '1099', '1712', '6567', '4966');
INSERT INTO `fw_code` VALUES ('4122843', '3321', '1100', '1672', '5559', '5127');
INSERT INTO `fw_code` VALUES ('4122844', '3321', '1101', '3955', '9983', '3654');
INSERT INTO `fw_code` VALUES ('4122845', '3321', '1102', '2780', '3908', '0055');
INSERT INTO `fw_code` VALUES ('4122846', '3321', '1103', '4810', '9856', '1725');
INSERT INTO `fw_code` VALUES ('4122847', '3321', '1104', '0257', '5297', '5680');
INSERT INTO `fw_code` VALUES ('4122848', '3321', '1105', '3889', '2257', '4984');
INSERT INTO `fw_code` VALUES ('4122849', '3321', '1106', '5664', '9729', '9796');
INSERT INTO `fw_code` VALUES ('4122850', '3321', '1107', '8976', '0487', '3573');
INSERT INTO `fw_code` VALUES ('4122851', '3321', '1108', '1605', '7833', '6457');
INSERT INTO `fw_code` VALUES ('4122852', '3321', '1109', '5838', '6190', '6975');
INSERT INTO `fw_code` VALUES ('4122853', '3321', '1110', '0858', '6694', '6895');
INSERT INTO `fw_code` VALUES ('4122854', '3321', '1111', '2033', '2769', '0493');
INSERT INTO `fw_code` VALUES ('4122855', '3321', '1112', '7653', '4670', '1627');
INSERT INTO `fw_code` VALUES ('4122856', '3321', '1113', '6519', '9602', '7868');
INSERT INTO `fw_code` VALUES ('4122857', '3321', '1114', '5624', '8722', '9957');
INSERT INTO `fw_code` VALUES ('4122858', '3321', '1115', '9723', '1626', '3136');
INSERT INTO `fw_code` VALUES ('4122859', '3321', '1116', '7373', '9475', '5939');
INSERT INTO `fw_code` VALUES ('4122860', '3321', '1117', '6987', '5547', '1743');
INSERT INTO `fw_code` VALUES ('4122861', '3321', '1118', '7547', '5936', '3118');
INSERT INTO `fw_code` VALUES ('4122862', '3321', '1119', '9403', '5424', '7609');
INSERT INTO `fw_code` VALUES ('4122863', '3321', '1120', '7414', '0483', '5778');
INSERT INTO `fw_code` VALUES ('4122864', '3321', '1121', '8228', '9348', '4011');
INSERT INTO `fw_code` VALUES ('4122865', '3321', '1122', '1528', '0849', '1551');
INSERT INTO `fw_code` VALUES ('4122866', '3321', '1123', '8792', '4770', '0158');
INSERT INTO `fw_code` VALUES ('4122867', '3321', '1124', '2703', '6925', '5149');
INSERT INTO `fw_code` VALUES ('4122868', '3321', '1125', '3024', '3127', '0676');
INSERT INTO `fw_code` VALUES ('4122869', '3321', '1126', '9219', '9706', '4193');
INSERT INTO `fw_code` VALUES ('4122870', '3321', '1127', '2810', '5659', '3658');
INSERT INTO `fw_code` VALUES ('4122871', '3321', '1128', '0140', '7306', '0935');
INSERT INTO `fw_code` VALUES ('4122872', '3321', '1129', '4560', '6412', '9640');
INSERT INTO `fw_code` VALUES ('4122873', '3321', '1130', '7576', '7687', '6720');
INSERT INTO `fw_code` VALUES ('4122874', '3321', '1131', '4733', '2873', '6818');
INSERT INTO `fw_code` VALUES ('4122875', '3321', '1132', '3385', '0337', '6042');
INSERT INTO `fw_code` VALUES ('4122876', '3321', '1133', '5414', '6285', '7711');
INSERT INTO `fw_code` VALUES ('4122877', '3321', '1134', '0862', '1726', '1666');
INSERT INTO `fw_code` VALUES ('4122878', '3321', '1135', '4946', '0341', '3836');
INSERT INTO `fw_code` VALUES ('4122879', '3321', '1136', '6269', '6158', '5783');
INSERT INTO `fw_code` VALUES ('4122880', '3321', '1137', '6442', '2619', '2961');
INSERT INTO `fw_code` VALUES ('4122881', '3321', '1138', '1462', '3123', '2881');
INSERT INTO `fw_code` VALUES ('4122882', '3321', '1139', '2637', '9198', '6479');
INSERT INTO `fw_code` VALUES ('4122883', '3321', '1140', '6228', '5151', '5943');
INSERT INTO `fw_code` VALUES ('4122884', '3321', '1141', '0328', '8055', '9122');
INSERT INTO `fw_code` VALUES ('4122885', '3321', '1142', '4666', '5147', '8149');
INSERT INTO `fw_code` VALUES ('4122886', '3321', '1143', '8151', '2365', '9104');
INSERT INTO `fw_code` VALUES ('4122887', '3321', '1144', '0007', '1853', '3595');
INSERT INTO `fw_code` VALUES ('4122888', '3321', '1145', '3131', '1861', '9185');
INSERT INTO `fw_code` VALUES ('4122889', '3321', '1146', '8832', '5777', '9997');
INSERT INTO `fw_code` VALUES ('4122890', '3321', '1147', '2103', '5528', '3934');
INSERT INTO `fw_code` VALUES ('4122891', '3321', '1148', '5333', '4270', '8033');
INSERT INTO `fw_code` VALUES ('4122892', '3321', '1149', '0608', '3250', '4809');
INSERT INTO `fw_code` VALUES ('4122893', '3321', '1150', '8365', '9833', '6122');
INSERT INTO `fw_code` VALUES ('4122894', '3321', '1151', '9687', '5650', '8068');
INSERT INTO `fw_code` VALUES ('4122895', '3321', '1152', '9860', '2111', '5247');
INSERT INTO `fw_code` VALUES ('4122896', '3321', '1153', '1208', '4647', '6024');
INSERT INTO `fw_code` VALUES ('4122897', '3321', '1154', '8004', '2623', '0756');
INSERT INTO `fw_code` VALUES ('4122898', '3321', '1155', '3415', '2088', '9644');
INSERT INTO `fw_code` VALUES ('4122899', '3321', '1156', '0744', '3735', '6921');
INSERT INTO `fw_code` VALUES ('4122900', '3321', '1157', '0811', '1461', '5590');
INSERT INTO `fw_code` VALUES ('4122901', '3321', '1158', '2921', '9425', '6938');
INSERT INTO `fw_code` VALUES ('4122902', '3321', '1159', '0170', '9056', '4537');
INSERT INTO `fw_code` VALUES ('4122903', '3321', '1160', '5164', '2842', '5626');
INSERT INTO `fw_code` VALUES ('4122904', '3321', '1161', '7433', '2977', '3144');
INSERT INTO `fw_code` VALUES ('4122905', '3321', '1162', '8181', '4116', '2706');
INSERT INTO `fw_code` VALUES ('4122906', '3321', '1163', '5337', '9302', '2805');
INSERT INTO `fw_code` VALUES ('4122907', '3321', '1164', '3521', '0822', '8153');
INSERT INTO `fw_code` VALUES ('4122908', '3321', '1165', '7860', '7913', '7180');
INSERT INTO `fw_code` VALUES ('4122909', '3321', '1166', '3989', '6766', '2028');
INSERT INTO `fw_code` VALUES ('4122910', '3321', '1167', '1451', '3866', '6644');
INSERT INTO `fw_code` VALUES ('4122911', '3321', '1168', '5617', '4497', '8492');
INSERT INTO `fw_code` VALUES ('4122912', '3321', '1169', '2520', '1207', '1733');
INSERT INTO `fw_code` VALUES ('4122913', '3321', '1170', '5551', '6770', '9822');
INSERT INTO `fw_code` VALUES ('4122914', '3321', '1171', '2840', '7409', '7260');
INSERT INTO `fw_code` VALUES ('4122915', '3321', '1172', '3054', '4878', '4278');
INSERT INTO `fw_code` VALUES ('4122916', '3321', '1173', '2066', '9552', '8867');
INSERT INTO `fw_code` VALUES ('4122917', '3321', '1174', '3241', '5627', '2465');
INSERT INTO `fw_code` VALUES ('4122918', '3321', '1175', '6833', '1580', '1930');
INSERT INTO `fw_code` VALUES ('4122919', '3321', '1176', '0490', '5259', '0064');
INSERT INTO `fw_code` VALUES ('4122920', '3321', '1177', '4229', '0953', '7876');
INSERT INTO `fw_code` VALUES ('4122921', '3321', '1178', '3588', '8548', '6823');
INSERT INTO `fw_code` VALUES ('4122922', '3321', '1179', '1238', '6397', '9626');
INSERT INTO `fw_code` VALUES ('4122923', '3321', '1180', '0851', '2469', '5430');
INSERT INTO `fw_code` VALUES ('4122924', '3321', '1181', '5271', '1576', '4135');
INSERT INTO `fw_code` VALUES ('4122925', '3321', '1182', '8755', '8794', '5090');
INSERT INTO `fw_code` VALUES ('4122926', '3321', '1183', '3267', '2346', '1296');
INSERT INTO `fw_code` VALUES ('4122927', '3321', '1184', '1278', '7405', '9465');
INSERT INTO `fw_code` VALUES ('4122928', '3321', '1185', '3735', '8290', '5171');
INSERT INTO `fw_code` VALUES ('4122929', '3321', '1186', '2092', '6270', '7698');
INSERT INTO `fw_code` VALUES ('4122930', '3321', '1187', '2707', '1957', '9921');
INSERT INTO `fw_code` VALUES ('4122931', '3321', '1188', '5938', '0699', '4019');
INSERT INTO `fw_code` VALUES ('4122932', '3321', '1189', '1212', '9679', '0796');
INSERT INTO `fw_code` VALUES ('4122933', '3321', '1190', '8969', '6262', '2108');
INSERT INTO `fw_code` VALUES ('4122934', '3321', '1191', '4844', '6639', '0099');
INSERT INTO `fw_code` VALUES ('4122935', '3321', '1192', '2947', '6143', '5769');
INSERT INTO `fw_code` VALUES ('4122936', '3321', '1193', '9930', '4869', '8688');
INSERT INTO `fw_code` VALUES ('4122937', '3321', '1194', '0464', '8540', '1233');
INSERT INTO `fw_code` VALUES ('4122938', '3321', '1195', '1812', '1076', '2010');
INSERT INTO `fw_code` VALUES ('4122939', '3321', '1196', '9315', '9183', '6465');
INSERT INTO `fw_code` VALUES ('4122940', '3321', '1197', '3801', '6016', '3840');
INSERT INTO `fw_code` VALUES ('4122941', '3321', '1198', '4203', '4234', '9046');
INSERT INTO `fw_code` VALUES ('4122942', '3321', '1199', '0251', '1072', '4215');
INSERT INTO `fw_code` VALUES ('4122943', '3321', '1200', '2413', '2473', '3224');
INSERT INTO `fw_code` VALUES ('4122944', '3321', '1201', '9717', '7401', '1671');
INSERT INTO `fw_code` VALUES ('4122945', '3321', '1202', '4656', '5889', '1912');
INSERT INTO `fw_code` VALUES ('4122946', '3321', '1203', '4269', '1961', '7715');
INSERT INTO `fw_code` VALUES ('4122947', '3321', '1204', '5017', '3100', '7278');
INSERT INTO `fw_code` VALUES ('4122948', '3321', '1205', '2173', '8286', '7376');
INSERT INTO `fw_code` VALUES ('4122949', '3321', '1206', '0357', '9806', '2724');
INSERT INTO `fw_code` VALUES ('4122950', '3321', '1207', '4696', '6897', '1751');
INSERT INTO `fw_code` VALUES ('4122951', '3321', '1208', '3481', '9814', '8314');
INSERT INTO `fw_code` VALUES ('4122952', '3321', '1209', '5510', '5762', '9983');
INSERT INTO `fw_code` VALUES ('4122953', '3321', '1210', '2453', '3481', '3064');
INSERT INTO `fw_code` VALUES ('4122954', '3321', '1211', '0958', '1203', '3939');
INSERT INTO `fw_code` VALUES ('4122955', '3321', '1212', '2387', '5754', '4394');
INSERT INTO `fw_code` VALUES ('4122956', '3321', '1213', '6365', '5635', '8055');
INSERT INTO `fw_code` VALUES ('4122957', '3321', '1214', '5691', '9115', '5120');
INSERT INTO `fw_code` VALUES ('4122958', '3321', '1215', '7359', '7853', '1424');
INSERT INTO `fw_code` VALUES ('4122959', '3321', '1216', '8534', '3929', '5022');
INSERT INTO `fw_code` VALUES ('4122960', '3321', '1217', '1499', '1766', '4441');
INSERT INTO `fw_code` VALUES ('4122961', '3321', '1218', '3020', '0762', '2397');
INSERT INTO `fw_code` VALUES ('4122962', '3321', '1219', '9750', '1012', '8459');
INSERT INTO `fw_code` VALUES ('4122963', '3321', '1220', '3127', '9496', '0906');
INSERT INTO `fw_code` VALUES ('4122964', '3321', '1221', '6866', '5190', '8718');
INSERT INTO `fw_code` VALUES ('4122965', '3321', '1222', '5304', '5186', '0924');
INSERT INTO `fw_code` VALUES ('4122966', '3321', '1223', '5263', '4179', '1084');
INSERT INTO `fw_code` VALUES ('4122967', '3321', '1224', '3875', '0635', '0468');
INSERT INTO `fw_code` VALUES ('4122968', '3321', '1225', '4022', '0377', '8816');
INSERT INTO `fw_code` VALUES ('4122969', '3321', '1226', '3488', '6706', '6272');
INSERT INTO `fw_code` VALUES ('4122970', '3321', '1227', '0564', '9877', '6692');
INSERT INTO `fw_code` VALUES ('4122971', '3321', '1228', '5904', '6583', '2138');
INSERT INTO `fw_code` VALUES ('4122972', '3321', '1229', '3915', '1643', '0308');
INSERT INTO `fw_code` VALUES ('4122973', '3321', '1230', '6372', '2528', '6013');
INSERT INTO `fw_code` VALUES ('4122974', '3321', '1231', '4729', '0508', '8540');
INSERT INTO `fw_code` VALUES ('4122975', '3321', '1232', '8295', '9742', '9174');
INSERT INTO `fw_code` VALUES ('4122976', '3321', '1233', '7507', '7595', '9772');
INSERT INTO `fw_code` VALUES ('4122977', '3321', '1234', '8000', '0258', '2477');
INSERT INTO `fw_code` VALUES ('4122978', '3321', '1235', '8575', '4936', '4861');
INSERT INTO `fw_code` VALUES ('4122979', '3321', '1236', '6505', '7980', '3352');
INSERT INTO `fw_code` VALUES ('4122980', '3321', '1237', '1606', '0500', '2950');
INSERT INTO `fw_code` VALUES ('4122981', '3321', '1238', '0136', '4941', '2656');
INSERT INTO `fw_code` VALUES ('4122982', '3321', '1239', '5584', '0381', '6611');
INSERT INTO `fw_code` VALUES ('4122983', '3321', '1240', '5223', '3171', '1245');
INSERT INTO `fw_code` VALUES ('4122984', '3321', '1241', '1525', '8484', '3272');
INSERT INTO `fw_code` VALUES ('4122985', '3321', '1242', '5437', '0639', '8263');
INSERT INTO `fw_code` VALUES ('4122986', '3321', '1243', '5757', '6841', '3790');
INSERT INTO `fw_code` VALUES ('4122987', '3321', '1244', '4449', '5313', '2852');
INSERT INTO `fw_code` VALUES ('4122988', '3321', '1245', '1245', '3290', '7584');
INSERT INTO `fw_code` VALUES ('4122989', '3321', '1246', '9496', '2536', '1602');
INSERT INTO `fw_code` VALUES ('4122990', '3321', '1247', '5543', '9373', '6772');
INSERT INTO `fw_code` VALUES ('4122991', '3321', '1248', '0217', '6956', '2334');
INSERT INTO `fw_code` VALUES ('4122992', '3321', '1249', '0284', '4682', '1004');
INSERT INTO `fw_code` VALUES ('4122993', '3321', '1250', '5050', '6710', '4067');
INSERT INTO `fw_code` VALUES ('4122994', '3321', '1251', '9643', '2278', '9950');
INSERT INTO `fw_code` VALUES ('4122995', '3321', '1252', '5009', '5703', '4227');
INSERT INTO `fw_code` VALUES ('4122996', '3321', '1253', '7293', '0127', '2754');
INSERT INTO `fw_code` VALUES ('4122997', '3321', '1254', '3768', '1901', '1959');
INSERT INTO `fw_code` VALUES ('4122998', '3321', '1255', '6906', '6198', '8558');
INSERT INTO `fw_code` VALUES ('4122999', '3321', '1256', '7654', '7337', '8120');
INSERT INTO `fw_code` VALUES ('4123000', '3321', '1257', '7466', '6587', '9933');
INSERT INTO `fw_code` VALUES ('4123001', '3321', '1258', '5650', '8107', '5281');
INSERT INTO `fw_code` VALUES ('4123002', '3321', '1259', '7333', '1135', '2593');
INSERT INTO `fw_code` VALUES ('4123003', '3321', '1260', '6118', '4052', '9156');
INSERT INTO `fw_code` VALUES ('4123004', '3321', '1261', '8147', '0000', '0825');
INSERT INTO `fw_code` VALUES ('4123005', '3321', '1262', '8041', '1266', '2317');
INSERT INTO `fw_code` VALUES ('4123006', '3321', '1263', '0925', '7087', '2058');
INSERT INTO `fw_code` VALUES ('4123007', '3321', '1264', '5090', '7718', '3906');
INSERT INTO `fw_code` VALUES ('4123008', '3321', '1265', '1993', '4428', '7147');
INSERT INTO `fw_code` VALUES ('4123009', '3321', '1266', '3595', '5440', '4781');
INSERT INTO `fw_code` VALUES ('4123010', '3321', '1267', '7227', '2401', '4084');
INSERT INTO `fw_code` VALUES ('4123011', '3321', '1268', '2313', '0631', '2674');
INSERT INTO `fw_code` VALUES ('4123012', '3321', '1269', '4943', '7976', '5558');
INSERT INTO `fw_code` VALUES ('4123013', '3321', '1270', '2527', '8099', '9692');
INSERT INTO `fw_code` VALUES ('4123014', '3321', '1271', '4195', '6837', '5995');
INSERT INTO `fw_code` VALUES ('4123015', '3321', '1272', '5370', '2913', '9593');
INSERT INTO `fw_code` VALUES ('4123016', '3321', '1273', '0991', '4814', '0727');
INSERT INTO `fw_code` VALUES ('4123017', '3321', '1274', '9856', '9746', '6968');
INSERT INTO `fw_code` VALUES ('4123018', '3321', '1275', '6586', '9996', '3031');
INSERT INTO `fw_code` VALUES ('4123019', '3321', '1276', '9963', '8480', '5477');
INSERT INTO `fw_code` VALUES ('4123020', '3321', '1277', '3702', '4174', '3290');
INSERT INTO `fw_code` VALUES ('4123021', '3321', '1278', '2140', '4170', '5495');
INSERT INTO `fw_code` VALUES ('4123022', '3321', '1279', '3061', '1770', '2236');
INSERT INTO `fw_code` VALUES ('4123023', '3321', '1280', '2099', '3163', '5656');
INSERT INTO `fw_code` VALUES ('4123024', '3321', '1281', '0711', '9619', '5040');
INSERT INTO `fw_code` VALUES ('4123025', '3321', '1282', '0324', '5690', '0843');
INSERT INTO `fw_code` VALUES ('4123026', '3321', '1283', '7400', '8861', '1263');
INSERT INTO `fw_code` VALUES ('4123027', '3321', '1284', '0884', '6079', '2218');
INSERT INTO `fw_code` VALUES ('4123028', '3321', '1285', '2740', '5567', '6709');
INSERT INTO `fw_code` VALUES ('4123029', '3321', '1286', '0751', '0627', '4879');
INSERT INTO `fw_code` VALUES ('4123030', '3321', '1287', '8082', '4112', '5494');
INSERT INTO `fw_code` VALUES ('4123031', '3321', '1288', '9150', '1453', '0584');
INSERT INTO `fw_code` VALUES ('4123032', '3321', '1289', '4837', '1081', '0387');
INSERT INTO `fw_code` VALUES ('4123033', '3321', '1290', '6012', '7156', '3986');
INSERT INTO `fw_code` VALUES ('4123034', '3321', '1291', '6332', '3358', '9512');
INSERT INTO `fw_code` VALUES ('4123035', '3321', '1292', '5024', '1830', '8575');
INSERT INTO `fw_code` VALUES ('4123036', '3321', '1293', '1820', '9807', '3307');
INSERT INTO `fw_code` VALUES ('4123037', '3321', '1294', '7013', '6771', '0405');
INSERT INTO `fw_code` VALUES ('4123038', '3321', '1295', '0071', '9053', '7325');
INSERT INTO `fw_code` VALUES ('4123039', '3321', '1296', '3448', '7537', '9771');
INSERT INTO `fw_code` VALUES ('4123040', '3321', '1297', '0859', '1199', '6727');
INSERT INTO `fw_code` VALUES ('4123041', '3321', '1298', '5625', '3227', '9789');
INSERT INTO `fw_code` VALUES ('4123042', '3321', '1299', '7868', '6644', '8477');
INSERT INTO `fw_code` VALUES ('4123043', '3321', '1300', '4343', '8418', '7682');
INSERT INTO `fw_code` VALUES ('4123044', '3321', '1301', '0885', '7918', '5557');
INSERT INTO `fw_code` VALUES ('4123045', '3321', '1302', '6225', '4624', '1003');
INSERT INTO `fw_code` VALUES ('4123046', '3321', '1303', '6693', '0569', '4878');
INSERT INTO `fw_code` VALUES ('4123047', '3321', '1304', '8722', '6517', '6548');
INSERT INTO `fw_code` VALUES ('4123048', '3321', '1305', '8616', '7783', '8039');
INSERT INTO `fw_code` VALUES ('4123049', '3321', '1306', '1500', '3604', '7780');
INSERT INTO `fw_code` VALUES ('4123050', '3321', '1307', '5665', '4235', '9628');
INSERT INTO `fw_code` VALUES ('4123051', '3321', '1308', '2568', '0945', '2869');
INSERT INTO `fw_code` VALUES ('4123052', '3321', '1309', '8255', '0573', '2673');
INSERT INTO `fw_code` VALUES ('4123053', '3321', '1310', '0457', '2981', '1521');
INSERT INTO `fw_code` VALUES ('4123054', '3321', '1311', '2888', '7148', '8396');
INSERT INTO `fw_code` VALUES ('4123055', '3321', '1312', '3102', '4616', '5414');
INSERT INTO `fw_code` VALUES ('4123056', '3321', '1313', '4770', '3354', '1718');
INSERT INTO `fw_code` VALUES ('4123057', '3321', '1314', '5945', '9430', '5316');
INSERT INTO `fw_code` VALUES ('4123058', '3321', '1315', '1566', '1331', '6450');
INSERT INTO `fw_code` VALUES ('4123059', '3321', '1316', '9537', '5382', '4780');
INSERT INTO `fw_code` VALUES ('4123060', '3321', '1317', '0538', '4997', '1200');
INSERT INTO `fw_code` VALUES ('4123061', '3321', '1318', '4277', '0691', '9012');
INSERT INTO `fw_code` VALUES ('4123062', '3321', '1319', '5371', '4751', '2932');
INSERT INTO `fw_code` VALUES ('4123063', '3321', '1320', '3636', '8287', '7959');
INSERT INTO `fw_code` VALUES ('4123064', '3321', '1321', '2675', '9680', '1378');
INSERT INTO `fw_code` VALUES ('4123065', '3321', '1322', '3555', '6271', '8280');
INSERT INTO `fw_code` VALUES ('4123066', '3321', '1323', '7975', '5378', '6985');
INSERT INTO `fw_code` VALUES ('4123067', '3321', '1324', '1459', '2596', '7941');
INSERT INTO `fw_code` VALUES ('4123068', '3321', '1325', '3315', '2084', '2432');
INSERT INTO `fw_code` VALUES ('4123069', '3321', '1326', '3982', '1208', '2316');
INSERT INTO `fw_code` VALUES ('4123070', '3321', '1327', '6439', '2093', '8021');
INSERT INTO `fw_code` VALUES ('4123071', '3321', '1328', '8362', '9307', '1182');
INSERT INTO `fw_code` VALUES ('4123072', '3321', '1329', '4918', '3096', '0066');
INSERT INTO `fw_code` VALUES ('4123073', '3321', '1330', '5411', '5759', '2771');
INSERT INTO `fw_code` VALUES ('4123074', '3321', '1331', '8642', '4501', '6870');
INSERT INTO `fw_code` VALUES ('4123075', '3321', '1332', '1673', '0065', '4959');
INSERT INTO `fw_code` VALUES ('4123076', '3321', '1333', '2995', '5882', '6905');
INSERT INTO `fw_code` VALUES ('4123077', '3321', '1334', '2634', '8672', '1539');
INSERT INTO `fw_code` VALUES ('4123078', '3321', '1335', '8936', '3985', '3566');
INSERT INTO `fw_code` VALUES ('4123079', '3321', '1336', '9363', '8922', '7602');
INSERT INTO `fw_code` VALUES ('4123080', '3321', '1337', '5080', '0300', '1008');
INSERT INTO `fw_code` VALUES ('4123081', '3321', '1338', '7618', '3200', '6391');
INSERT INTO `fw_code` VALUES ('4123082', '3321', '1339', '6723', '2319', '8481');
INSERT INTO `fw_code` VALUES ('4123083', '3321', '1340', '4053', '3966', '5758');
INSERT INTO `fw_code` VALUES ('4123084', '3321', '1341', '3478', '9288', '3374');
INSERT INTO `fw_code` VALUES ('4123085', '3321', '1342', '8472', '3073', '4463');
INSERT INTO `fw_code` VALUES ('4123086', '3321', '1343', '0741', '3208', '1981');
INSERT INTO `fw_code` VALUES ('4123087', '3321', '1344', '1489', '4347', '1543');
INSERT INTO `fw_code` VALUES ('4123088', '3321', '1345', '6830', '1053', '6990');
INSERT INTO `fw_code` VALUES ('4123089', '3321', '1346', '1169', '8145', '6016');
INSERT INTO `fw_code` VALUES ('4123090', '3321', '1347', '9220', '4212', '4025');
INSERT INTO `fw_code` VALUES ('4123091', '3321', '1348', '4760', '4097', '5481');
INSERT INTO `fw_code` VALUES ('4123092', '3321', '1349', '8925', '4728', '7329');
INSERT INTO `fw_code` VALUES ('4123093', '3321', '1350', '5828', '1438', '0570');
INSERT INTO `fw_code` VALUES ('4123094', '3321', '1351', '7430', '2450', '8204');
INSERT INTO `fw_code` VALUES ('4123095', '3321', '1352', '1062', '9411', '7508');
INSERT INTO `fw_code` VALUES ('4123096', '3321', '1353', '2837', '6883', '2320');
INSERT INTO `fw_code` VALUES ('4123097', '3321', '1354', '6148', '7641', '6097');
INSERT INTO `fw_code` VALUES ('4123098', '3321', '1355', '6362', '5109', '3115');
INSERT INTO `fw_code` VALUES ('4123099', '3321', '1356', '0354', '9280', '7784');
INSERT INTO `fw_code` VALUES ('4123100', '3321', '1357', '5375', '9783', '7704');
INSERT INTO `fw_code` VALUES ('4123101', '3321', '1358', '6550', '5859', '1302');
INSERT INTO `fw_code` VALUES ('4123102', '3321', '1359', '7537', '1184', '6713');
INSERT INTO `fw_code` VALUES ('4123103', '3321', '1360', '5935', '0173', '9079');
INSERT INTO `fw_code` VALUES ('4123104', '3321', '1361', '2064', '9026', '3927');
INSERT INTO `fw_code` VALUES ('4123105', '3321', '1362', '6576', '2577', '0133');
INSERT INTO `fw_code` VALUES ('4123106', '3321', '1363', '4587', '7637', '8302');
INSERT INTO `fw_code` VALUES ('4123107', '3321', '1364', '7043', '8522', '4007');
INSERT INTO `fw_code` VALUES ('4123108', '3321', '1365', '5401', '6502', '6534');
INSERT INTO `fw_code` VALUES ('4123109', '3321', '1366', '8966', '5736', '7168');
INSERT INTO `fw_code` VALUES ('4123110', '3321', '1367', '8178', '3589', '7767');
INSERT INTO `fw_code` VALUES ('4123111', '3321', '1368', '6016', '2188', '8757');
INSERT INTO `fw_code` VALUES ('4123112', '3321', '1369', '9246', '0930', '2856');
INSERT INTO `fw_code` VALUES ('4123113', '3321', '1370', '4520', '9910', '9632');
INSERT INTO `fw_code` VALUES ('4123114', '3321', '1371', '2277', '6494', '0945');
INSERT INTO `fw_code` VALUES ('4123115', '3321', '1372', '8152', '6871', '8936');
INSERT INTO `fw_code` VALUES ('4123116', '3321', '1373', '6255', '6375', '4606');
INSERT INTO `fw_code` VALUES ('4123117', '3321', '1374', '3238', '5101', '7525');
INSERT INTO `fw_code` VALUES ('4123118', '3321', '1375', '3773', '8772', '0070');
INSERT INTO `fw_code` VALUES ('4123119', '3321', '1376', '5121', '1307', '0847');
INSERT INTO `fw_code` VALUES ('4123120', '3321', '1377', '2623', '9415', '5302');
INSERT INTO `fw_code` VALUES ('4123121', '3321', '1378', '1916', '9284', '5579');
INSERT INTO `fw_code` VALUES ('4123122', '3321', '1379', '7110', '6248', '2677');
INSERT INTO `fw_code` VALUES ('4123123', '3321', '1380', '7511', '4466', '7882');
INSERT INTO `fw_code` VALUES ('4123124', '3321', '1381', '3559', '1303', '3052');
INSERT INTO `fw_code` VALUES ('4123125', '3321', '1382', '0889', '2950', '0329');
INSERT INTO `fw_code` VALUES ('4123126', '3321', '1383', '0955', '0676', '8999');
INSERT INTO `fw_code` VALUES ('4123127', '3321', '1384', '9489', '0149', '3476');
INSERT INTO `fw_code` VALUES ('4123128', '3321', '1385', '1732', '3566', '2163');
INSERT INTO `fw_code` VALUES ('4123129', '3321', '1386', '2587', '3439', '0235');
INSERT INTO `fw_code` VALUES ('4123130', '3321', '1387', '5364', '0526', '1467');
INSERT INTO `fw_code` VALUES ('4123131', '3321', '1388', '9530', '1157', '3315');
INSERT INTO `fw_code` VALUES ('4123132', '3321', '1389', '6432', '7868', '6556');
INSERT INTO `fw_code` VALUES ('4123133', '3321', '1390', '3441', '3312', '8306');
INSERT INTO `fw_code` VALUES ('4123134', '3321', '1391', '6966', '1538', '9101');
INSERT INTO `fw_code` VALUES ('4123135', '3321', '1392', '2775', '4189', '8422');
INSERT INTO `fw_code` VALUES ('4123136', '3321', '1393', '4296', '3185', '6378');
INSERT INTO `fw_code` VALUES ('4123137', '3321', '1394', '0745', '8240', '6752');
INSERT INTO `fw_code` VALUES ('4123138', '3321', '1395', '5150', '3058', '4449');
INSERT INTO `fw_code` VALUES ('4123139', '3321', '1396', '4764', '9129', '0253');
INSERT INTO `fw_code` VALUES ('4123140', '3321', '1397', '2668', '5455', '9913');
INSERT INTO `fw_code` VALUES ('4123141', '3321', '1398', '9570', '2165', '3154');
INSERT INTO `fw_code` VALUES ('4123142', '3321', '1399', '9276', '2681', '6458');
INSERT INTO `fw_code` VALUES ('4123143', '3321', '1400', '9850', '7360', '8842');
INSERT INTO `fw_code` VALUES ('4123144', '3321', '1401', '2881', '2923', '6931');
INSERT INTO `fw_code` VALUES ('4123145', '3321', '1402', '6860', '2804', '0592');
INSERT INTO `fw_code` VALUES ('4123146', '3321', '1403', '6499', '5594', '5226');
INSERT INTO `fw_code` VALUES ('4123147', '3321', '1404', '6712', '3062', '2244');
INSERT INTO `fw_code` VALUES ('4123148', '3321', '1405', '7033', '9264', '7771');
INSERT INTO `fw_code` VALUES ('4123149', '3321', '1406', '3228', '5844', '1288');
INSERT INTO `fw_code` VALUES ('4123150', '3321', '1407', '7714', '2677', '8663');
INSERT INTO `fw_code` VALUES ('4123151', '3321', '1408', '1493', '9379', '6315');
INSERT INTO `fw_code` VALUES ('4123152', '3321', '1409', '1559', '7106', '4985');
INSERT INTO `fw_code` VALUES ('4123153', '3321', '1410', '0918', '4701', '3931');
INSERT INTO `fw_code` VALUES ('4123154', '3321', '1411', '6285', '8126', '8208');
INSERT INTO `fw_code` VALUES ('4123155', '3321', '1412', '8742', '9011', '3913');
INSERT INTO `fw_code` VALUES ('4123156', '3321', '1413', '8609', '3558', '6574');
INSERT INTO `fw_code` VALUES ('4123157', '3321', '1414', '7394', '6475', '3137');
INSERT INTO `fw_code` VALUES ('4123158', '3321', '1415', '9423', '2423', '4806');
INSERT INTO `fw_code` VALUES ('4123159', '3321', '1416', '6366', '0141', '7886');
INSERT INTO `fw_code` VALUES ('4123160', '3321', '1417', '8955', '6479', '0931');
INSERT INTO `fw_code` VALUES ('4123161', '3321', '1418', '3589', '3054', '6654');
INSERT INTO `fw_code` VALUES ('4123162', '3321', '1419', '0451', '8757', '0056');
INSERT INTO `fw_code` VALUES ('4123163', '3321', '1420', '8691', '8746', '7838');
INSERT INTO `fw_code` VALUES ('4123164', '3321', '1421', '7556', '3678', '4078');
INSERT INTO `fw_code` VALUES ('4123165', '3321', '1422', '6661', '2797', '6168');
INSERT INTO `fw_code` VALUES ('4123166', '3321', '1423', '7663', '2412', '2587');
INSERT INTO `fw_code` VALUES ('4123167', '3321', '1424', '0761', '5702', '9346');
INSERT INTO `fw_code` VALUES ('4123168', '3321', '1425', '9799', '7095', '2766');
INSERT INTO `fw_code` VALUES ('4123169', '3321', '1426', '8411', '3551', '2150');
INSERT INTO `fw_code` VALUES ('4123170', '3321', '1427', '8024', '9622', '7953');
INSERT INTO `fw_code` VALUES ('4123171', '3321', '1428', '5099', '2793', '8373');
INSERT INTO `fw_code` VALUES ('4123172', '3321', '1429', '8584', '0011', '9329');
INSERT INTO `fw_code` VALUES ('4123173', '3321', '1430', '0440', '9499', '3820');
INSERT INTO `fw_code` VALUES ('4123174', '3321', '1431', '8451', '4559', '1989');
INSERT INTO `fw_code` VALUES ('4123175', '3321', '1432', '3564', '9508', '9409');
INSERT INTO `fw_code` VALUES ('4123176', '3321', '1433', '9265', '3424', '0221');
INSERT INTO `fw_code` VALUES ('4123177', '3321', '1434', '5486', '6722', '2570');
INSERT INTO `fw_code` VALUES ('4123178', '3321', '1435', '2042', '0511', '1453');
INSERT INTO `fw_code` VALUES ('4123179', '3321', '1436', '2536', '3174', '4159');
INSERT INTO `fw_code` VALUES ('4123180', '3321', '1437', '1041', '0896', '5034');
INSERT INTO `fw_code` VALUES ('4123181', '3321', '1438', '8797', '7480', '6346');
INSERT INTO `fw_code` VALUES ('4123182', '3321', '1439', '4672', '7857', '4337');
INSERT INTO `fw_code` VALUES ('4123183', '3321', '1440', '0120', '3297', '8293');
INSERT INTO `fw_code` VALUES ('4123184', '3321', '1441', '9759', '6087', '2927');
INSERT INTO `fw_code` VALUES ('4123185', '3321', '1442', '6061', '1400', '4953');
INSERT INTO `fw_code` VALUES ('4123186', '3321', '1443', '9972', '3555', '9945');
INSERT INTO `fw_code` VALUES ('4123187', '3321', '1444', '0293', '9757', '5471');
INSERT INTO `fw_code` VALUES ('4123188', '3321', '1445', '8985', '8229', '4534');
INSERT INTO `fw_code` VALUES ('4123189', '3321', '1446', '6488', '6337', '8989');
INSERT INTO `fw_code` VALUES ('4123190', '3321', '1447', '5781', '6206', '9266');
INSERT INTO `fw_code` VALUES ('4123191', '3321', '1448', '0974', '3170', '6364');
INSERT INTO `fw_code` VALUES ('4123192', '3321', '1449', '4031', '5452', '3284');
INSERT INTO `fw_code` VALUES ('4123193', '3321', '1450', '0079', '2289', '8454');
INSERT INTO `fw_code` VALUES ('4123194', '3321', '1451', '7409', '3936', '5730');
INSERT INTO `fw_code` VALUES ('4123195', '3321', '1452', '9586', '9626', '5748');
INSERT INTO `fw_code` VALUES ('4123196', '3321', '1453', '9545', '8619', '5909');
INSERT INTO `fw_code` VALUES ('4123197', '3321', '1454', '1829', '3043', '4436');
INSERT INTO `fw_code` VALUES ('4123198', '3321', '1455', '8304', '4817', '3641');
INSERT INTO `fw_code` VALUES ('4123199', '3321', '1456', '4098', '3178', '1954');
INSERT INTO `fw_code` VALUES ('4123200', '3321', '1457', '4845', '4317', '1516');
INSERT INTO `fw_code` VALUES ('4123201', '3321', '1458', '2002', '9503', '1614');
INSERT INTO `fw_code` VALUES ('4123202', '3321', '1459', '0186', '1023', '6962');
INSERT INTO `fw_code` VALUES ('4123203', '3321', '1460', '4525', '8115', '5989');
INSERT INTO `fw_code` VALUES ('4123204', '3321', '1461', '0654', '6968', '0837');
INSERT INTO `fw_code` VALUES ('4123205', '3321', '1462', '2683', '2916', '2507');
INSERT INTO `fw_code` VALUES ('4123206', '3321', '1463', '2576', '4182', '3998');
INSERT INTO `fw_code` VALUES ('4123207', '3321', '1464', '9626', '0634', '5587');
INSERT INTO `fw_code` VALUES ('4123208', '3321', '1465', '6528', '7345', '8828');
INSERT INTO `fw_code` VALUES ('4123209', '3321', '1466', '2215', '6972', '8632');
INSERT INTO `fw_code` VALUES ('4123210', '3321', '1467', '4418', '9381', '7480');
INSERT INTO `fw_code` VALUES ('4123211', '3321', '1468', '3538', '2789', '0578');
INSERT INTO `fw_code` VALUES ('4123212', '3321', '1469', '9479', '0892', '7239');
INSERT INTO `fw_code` VALUES ('4123213', '3321', '1470', '7063', '1015', '1373');
INSERT INTO `fw_code` VALUES ('4123214', '3321', '1471', '3711', '9249', '7757');
INSERT INTO `fw_code` VALUES ('4123215', '3321', '1472', '8731', '9753', '7677');
INSERT INTO `fw_code` VALUES ('4123216', '3321', '1473', '9906', '5829', '1275');
INSERT INTO `fw_code` VALUES ('4123217', '3321', '1474', '5527', '7730', '2409');
INSERT INTO `fw_code` VALUES ('4123218', '3321', '1475', '4392', '2662', '8650');
INSERT INTO `fw_code` VALUES ('4123219', '3321', '1476', '3777', '6976', '6427');
INSERT INTO `fw_code` VALUES ('4123220', '3321', '1477', '3497', '1781', '0739');
INSERT INTO `fw_code` VALUES ('4123221', '3321', '1478', '4499', '1396', '7159');
INSERT INTO `fw_code` VALUES ('4123222', '3321', '1479', '8237', '7091', '4971');
INSERT INTO `fw_code` VALUES ('4123223', '3321', '1480', '9332', '1150', '8891');
INSERT INTO `fw_code` VALUES ('4123224', '3321', '1481', '5247', '2535', '6721');
INSERT INTO `fw_code` VALUES ('4123225', '3321', '1482', '8050', '6341', '6784');
INSERT INTO `fw_code` VALUES ('4123226', '3321', '1483', '7516', '2670', '4239');
INSERT INTO `fw_code` VALUES ('4123227', '3321', '1484', '1935', '1777', '2944');
INSERT INTO `fw_code` VALUES ('4123228', '3321', '1485', '5420', '8995', '3900');
INSERT INTO `fw_code` VALUES ('4123229', '3321', '1486', '7276', '8483', '8391');
INSERT INTO `fw_code` VALUES ('4123230', '3321', '1487', '7943', '7607', '8275');
INSERT INTO `fw_code` VALUES ('4123231', '3321', '1488', '0400', '8492', '3980');
INSERT INTO `fw_code` VALUES ('4123232', '3321', '1489', '2322', '5706', '7141');
INSERT INTO `fw_code` VALUES ('4123233', '3321', '1490', '9373', '3997', '2069');
INSERT INTO `fw_code` VALUES ('4123234', '3321', '1491', '0868', '6274', '1194');
INSERT INTO `fw_code` VALUES ('4123235', '3321', '1492', '9012', '6787', '6703');
INSERT INTO `fw_code` VALUES ('4123236', '3321', '1493', '1549', '9687', '2087');
INSERT INTO `fw_code` VALUES ('4123237', '3321', '1494', '4606', '1969', '9006');
INSERT INTO `fw_code` VALUES ('4123238', '3321', '1495', '4673', '9695', '7676');
INSERT INTO `fw_code` VALUES ('4123239', '3321', '1496', '3258', '9433', '8229');
INSERT INTO `fw_code` VALUES ('4123240', '3321', '1497', '2857', '1215', '3024');
INSERT INTO `fw_code` VALUES ('4123241', '3321', '1498', '1362', '8937', '3899');
INSERT INTO `fw_code` VALUES ('4123242', '3321', '1499', '4993', '5898', '3203');
INSERT INTO `fw_code` VALUES ('4123243', '3321', '1500', '6769', '3370', '8015');
INSERT INTO `fw_code` VALUES ('4123244', '3321', '1501', '0080', '4128', '1792');
INSERT INTO `fw_code` VALUES ('4123245', '3321', '1502', '7623', '3243', '6087');
INSERT INTO `fw_code` VALUES ('4123246', '3321', '1503', '4352', '3493', '2149');
INSERT INTO `fw_code` VALUES ('4123247', '3321', '1504', '7730', '1977', '4596');
INSERT INTO `fw_code` VALUES ('4123248', '3321', '1505', '1468', '7671', '2408');
INSERT INTO `fw_code` VALUES ('4123249', '3321', '1506', '0827', '5267', '1355');
INSERT INTO `fw_code` VALUES ('4123250', '3321', '1507', '9866', '6660', '4774');
INSERT INTO `fw_code` VALUES ('4123251', '3321', '1508', '8478', '3116', '4158');
INSERT INTO `fw_code` VALUES ('4123252', '3321', '1509', '8625', '2858', '2506');
INSERT INTO `fw_code` VALUES ('4123253', '3321', '1510', '0507', '9064', '5828');
INSERT INTO `fw_code` VALUES ('4123254', '3321', '1511', '8518', '4124', '3997');
INSERT INTO `fw_code` VALUES ('4123255', '3321', '1512', '0975', '5009', '9703');
INSERT INTO `fw_code` VALUES ('4123256', '3321', '1513', '2897', '2223', '2864');
INSERT INTO `fw_code` VALUES ('4123257', '3321', '1514', '3177', '7417', '8551');
INSERT INTO `fw_code` VALUES ('4123258', '3321', '1515', '0187', '2862', '0301');
INSERT INTO `fw_code` VALUES ('4123259', '3321', '1516', '7170', '1588', '3221');
INSERT INTO `fw_code` VALUES ('4123260', '3321', '1517', '7704', '5258', '5765');
INSERT INTO `fw_code` VALUES ('4123261', '3321', '1518', '6555', '5902', '0998');
INSERT INTO `fw_code` VALUES ('4123262', '3321', '1519', '5848', '5771', '1274');
INSERT INTO `fw_code` VALUES ('4123263', '3321', '1520', '4809', '0180', '9787');
INSERT INTO `fw_code` VALUES ('4123264', '3321', '1521', '5211', '8398', '4992');
INSERT INTO `fw_code` VALUES ('4123265', '3321', '1522', '8588', '6882', '7439');
INSERT INTO `fw_code` VALUES ('4123266', '3321', '1523', '8655', '4609', '6109');
INSERT INTO `fw_code` VALUES ('4123267', '3321', '1524', '0725', '1565', '7618');
INSERT INTO `fw_code` VALUES ('4123268', '3321', '1525', '2139', '1827', '7064');
INSERT INTO `fw_code` VALUES ('4123269', '3321', '1526', '1365', '3969', '8671');
INSERT INTO `fw_code` VALUES ('4123270', '3321', '1527', '4489', '3978', '4261');
INSERT INTO `fw_code` VALUES ('4123271', '3321', '1528', '6518', '9926', '5930');
INSERT INTO `fw_code` VALUES ('4123272', '3321', '1529', '3461', '7644', '9010');
INSERT INTO `fw_code` VALUES ('4123273', '3321', '1530', '5598', '2327', '9189');
INSERT INTO `fw_code` VALUES ('4123274', '3321', '1531', '0684', '0557', '7778');
INSERT INTO `fw_code` VALUES ('4123275', '3321', '1532', '4890', '2196', '9466');
INSERT INTO `fw_code` VALUES ('4123276', '3321', '1533', '8334', '8406', '0582');
INSERT INTO `fw_code` VALUES ('4123277', '3321', '1534', '0511', '4096', '0600');
INSERT INTO `fw_code` VALUES ('4123278', '3321', '1535', '0470', '3089', '0761');
INSERT INTO `fw_code` VALUES ('4123279', '3321', '1536', '9229', '9287', '8493');
INSERT INTO `fw_code` VALUES ('4123280', '3321', '1537', '8695', '5616', '5948');
INSERT INTO `fw_code` VALUES ('4123281', '3321', '1538', '5771', '8787', '6368');
INSERT INTO `fw_code` VALUES ('4123282', '3321', '1539', '9122', '0553', '9984');
INSERT INTO `fw_code` VALUES ('4123283', '3321', '1540', '2714', '6505', '9448');
INSERT INTO `fw_code` VALUES ('4123284', '3321', '1541', '3207', '9168', '2153');
INSERT INTO `fw_code` VALUES ('4123285', '3321', '1542', '5343', '3851', '2332');
INSERT INTO `fw_code` VALUES ('4123286', '3321', '1543', '0430', '2081', '0921');
INSERT INTO `fw_code` VALUES ('4123287', '3321', '1544', '6732', '7394', '2948');
INSERT INTO `fw_code` VALUES ('4123288', '3321', '1545', '0644', '9549', '7939');
INSERT INTO `fw_code` VALUES ('4123289', '3321', '1546', '0964', '5751', '3466');
INSERT INTO `fw_code` VALUES ('4123290', '3321', '1547', '9656', '4223', '2528');
INSERT INTO `fw_code` VALUES ('4123291', '3321', '1548', '7159', '2331', '6984');
INSERT INTO `fw_code` VALUES ('4123292', '3321', '1549', '4703', '1446', '1278');
INSERT INTO `fw_code` VALUES ('4123293', '3321', '1550', '0750', '8283', '6448');
INSERT INTO `fw_code` VALUES ('4123294', '3321', '1551', '0216', '4613', '3904');
INSERT INTO `fw_code` VALUES ('4123295', '3321', '1552', '7269', '1086', '5341');
INSERT INTO `fw_code` VALUES ('4123296', '3321', '1553', '0407', '5384', '1939');
INSERT INTO `fw_code` VALUES ('4123297', '3321', '1554', '1154', '6523', '1501');
INSERT INTO `fw_code` VALUES ('4123298', '3321', '1555', '0967', '5773', '3314');
INSERT INTO `fw_code` VALUES ('4123299', '3321', '1556', '9151', '7293', '8662');
INSERT INTO `fw_code` VALUES ('4123300', '3321', '1557', '0834', '0320', '5974');
INSERT INTO `fw_code` VALUES ('4123301', '3321', '1558', '9619', '3237', '2537');
INSERT INTO `fw_code` VALUES ('4123302', '3321', '1559', '1648', '9185', '4207');
INSERT INTO `fw_code` VALUES ('4123303', '3321', '1560', '4425', '6273', '5439');
INSERT INTO `fw_code` VALUES ('4123304', '3321', '1561', '8591', '6904', '7287');
INSERT INTO `fw_code` VALUES ('4123305', '3321', '1562', '5493', '3614', '0528');
INSERT INTO `fw_code` VALUES ('4123306', '3321', '1563', '0727', '1586', '7465');
INSERT INTO `fw_code` VALUES ('4123307', '3321', '1564', '2503', '9058', '2278');
INSERT INTO `fw_code` VALUES ('4123308', '3321', '1565', '2676', '5519', '9457');
INSERT INTO `fw_code` VALUES ('4123309', '3321', '1566', '8871', '2098', '2974');
INSERT INTO `fw_code` VALUES ('4123310', '3321', '1567', '3357', '8931', '0349');
INSERT INTO `fw_code` VALUES ('4123311', '3321', '1568', '7202', '3360', '6671');
INSERT INTO `fw_code` VALUES ('4123312', '3321', '1569', '5641', '3356', '8876');
INSERT INTO `fw_code` VALUES ('4123313', '3321', '1570', '6561', '0955', '5617');
INSERT INTO `fw_code` VALUES ('4123314', '3321', '1571', '5600', '2348', '9037');
INSERT INTO `fw_code` VALUES ('4123315', '3321', '1572', '4359', '8546', '6769');
INSERT INTO `fw_code` VALUES ('4123316', '3321', '1573', '4385', '5265', '5599');
INSERT INTO `fw_code` VALUES ('4123317', '3321', '1574', '4252', '9812', '8260');
INSERT INTO `fw_code` VALUES ('4123318', '3321', '1575', '5066', '8677', '6492');
INSERT INTO `fw_code` VALUES ('4123319', '3321', '1576', '7843', '5765', '7724');
INSERT INTO `fw_code` VALUES ('4123320', '3321', '1577', '8911', '3106', '2814');
INSERT INTO `fw_code` VALUES ('4123321', '3321', '1578', '4598', '2733', '2617');
INSERT INTO `fw_code` VALUES ('4123322', '3321', '1579', '0473', '3110', '0608');
INSERT INTO `fw_code` VALUES ('4123323', '3321', '1580', '5921', '8550', '4564');
INSERT INTO `fw_code` VALUES ('4123324', '3321', '1581', '6094', '5011', '1742');
INSERT INTO `fw_code` VALUES ('4123325', '3321', '1582', '4786', '3483', '0805');
INSERT INTO `fw_code` VALUES ('4123326', '3321', '1583', '2289', '1590', '5260');
INSERT INTO `fw_code` VALUES ('4123327', '3321', '1584', '1582', '1459', '5537');
INSERT INTO `fw_code` VALUES ('4123328', '3321', '1585', '6775', '8423', '2635');
INSERT INTO `fw_code` VALUES ('4123329', '3321', '1586', '0620', '2852', '8956');
INSERT INTO `fw_code` VALUES ('4123330', '3321', '1587', '9979', '0447', '7903');
INSERT INTO `fw_code` VALUES ('4123331', '3321', '1588', '5346', '3872', '2180');
INSERT INTO `fw_code` VALUES ('4123332', '3321', '1589', '7630', '8296', '0706');
INSERT INTO `fw_code` VALUES ('4123333', '3321', '1590', '7803', '4757', '7885');
INSERT INTO `fw_code` VALUES ('4123334', '3321', '1591', '0326', '3368', '2260');
INSERT INTO `fw_code` VALUES ('4123335', '3321', '1592', '6455', '2221', '7108');
INSERT INTO `fw_code` VALUES ('4123336', '3321', '1593', '1261', '5257', '0010');
INSERT INTO `fw_code` VALUES ('4123337', '3321', '1594', '5427', '5888', '1858');
INSERT INTO `fw_code` VALUES ('4123338', '3321', '1595', '2329', '2598', '5099');
INSERT INTO `fw_code` VALUES ('4123339', '3321', '1596', '3932', '3610', '2733');
INSERT INTO `fw_code` VALUES ('4123340', '3321', '1597', '8016', '2225', '4903');
INSERT INTO `fw_code` VALUES ('4123341', '3321', '1598', '0219', '4634', '3751');
INSERT INTO `fw_code` VALUES ('4123342', '3321', '1599', '2650', '8800', '0626');
INSERT INTO `fw_code` VALUES ('4123343', '3321', '1600', '6632', '3714', '9059');
INSERT INTO `fw_code` VALUES ('4123344', '3321', '1601', '3280', '1948', '5443');
INSERT INTO `fw_code` VALUES ('4123345', '3321', '1602', '5096', '0428', '0095');
INSERT INTO `fw_code` VALUES ('4123346', '3321', '1603', '3961', '5361', '6336');
INSERT INTO `fw_code` VALUES ('4123347', '3321', '1604', '4068', '4095', '4844');
INSERT INTO `fw_code` VALUES ('4123348', '3321', '1605', '6205', '8777', '5023');
INSERT INTO `fw_code` VALUES ('4123349', '3321', '1606', '4816', '5234', '4407');
INSERT INTO `fw_code` VALUES ('4123350', '3321', '1607', '1505', '4476', '0630');
INSERT INTO `fw_code` VALUES ('4123351', '3321', '1608', '4989', '1694', '1586');
INSERT INTO `fw_code` VALUES ('4123352', '3321', '1609', '6845', '1182', '6077');
INSERT INTO `fw_code` VALUES ('4123353', '3321', '1610', '5670', '5107', '2478');
INSERT INTO `fw_code` VALUES ('4123354', '3321', '1611', '8448', '2194', '3710');
INSERT INTO `fw_code` VALUES ('4123355', '3321', '1612', '8941', '4857', '6416');
INSERT INTO `fw_code` VALUES ('4123356', '3321', '1613', '2172', '3599', '0514');
INSERT INTO `fw_code` VALUES ('4123357', '3321', '1614', '6525', '4980', '0550');
INSERT INTO `fw_code` VALUES ('4123358', '3321', '1615', '6378', '5238', '2202');
INSERT INTO `fw_code` VALUES ('4123359', '3321', '1616', '6698', '1440', '7728');
INSERT INTO `fw_code` VALUES ('4123360', '3321', '1617', '2893', '8019', '1246');
INSERT INTO `fw_code` VALUES ('4123361', '3321', '1618', '4842', '1952', '3238');
INSERT INTO `fw_code` VALUES ('4123362', '3321', '1619', '7379', '4853', '8621');
INSERT INTO `fw_code` VALUES ('4123363', '3321', '1620', '6484', '3972', '0711');
INSERT INTO `fw_code` VALUES ('4123364', '3321', '1621', '3814', '5619', '7987');
INSERT INTO `fw_code` VALUES ('4123365', '3321', '1622', '3881', '3345', '6657');
INSERT INTO `fw_code` VALUES ('4123366', '3321', '1623', '5991', '1309', '8005');
INSERT INTO `fw_code` VALUES ('4123367', '3321', '1624', '3240', '0940', '5604');
INSERT INTO `fw_code` VALUES ('4123368', '3321', '1625', '5950', '0301', '8166');
INSERT INTO `fw_code` VALUES ('4123369', '3321', '1626', '8234', '4726', '6693');
INSERT INTO `fw_code` VALUES ('4123370', '3321', '1627', '4709', '6499', '5898');
INSERT INTO `fw_code` VALUES ('4123371', '3321', '1628', '0503', '4861', '4211');
INSERT INTO `fw_code` VALUES ('4123372', '3321', '1629', '1251', '6000', '3773');
INSERT INTO `fw_code` VALUES ('4123373', '3321', '1630', '8407', '1186', '3871');
INSERT INTO `fw_code` VALUES ('4123374', '3321', '1631', '0930', '9797', '8246');
INSERT INTO `fw_code` VALUES ('4123375', '3321', '1632', '7059', '8650', '3094');
INSERT INTO `fw_code` VALUES ('4123376', '3321', '1633', '8687', '6381', '9559');
INSERT INTO `fw_code` VALUES ('4123377', '3321', '1634', '5590', '3091', '2800');
INSERT INTO `fw_code` VALUES ('4123378', '3321', '1635', '8621', '8654', '0889');
INSERT INTO `fw_code` VALUES ('4123379', '3321', '1636', '2599', '8535', '4550');
INSERT INTO `fw_code` VALUES ('4123380', '3321', '1637', '5884', '2575', '9496');
INSERT INTO `fw_code` VALUES ('4123381', '3321', '1638', '6124', '6762', '5345');
INSERT INTO `fw_code` VALUES ('4123382', '3321', '1639', '5136', '1436', '9934');
INSERT INTO `fw_code` VALUES ('4123383', '3321', '1640', '1932', '9412', '4666');
INSERT INTO `fw_code` VALUES ('4123384', '3321', '1641', '9903', '3464', '2996');
INSERT INTO `fw_code` VALUES ('4123385', '3321', '1642', '3560', '7143', '1130');
INSERT INTO `fw_code` VALUES ('4123386', '3321', '1643', '6658', '0432', '7889');
INSERT INTO `fw_code` VALUES ('4123387', '3321', '1644', '5696', '1825', '1309');
INSERT INTO `fw_code` VALUES ('4123388', '3321', '1645', '3921', '4353', '6496');
INSERT INTO `fw_code` VALUES ('4123389', '3321', '1646', '8341', '3460', '5202');
INSERT INTO `fw_code` VALUES ('4123390', '3321', '1647', '0106', '1675', '3777');
INSERT INTO `fw_code` VALUES ('4123391', '3321', '1648', '0573', '7619', '7652');
INSERT INTO `fw_code` VALUES ('4123392', '3321', '1649', '8931', '5600', '0179');
INSERT INTO `fw_code` VALUES ('4123393', '3321', '1650', '2496', '4833', '0813');
INSERT INTO `fw_code` VALUES ('4123394', '3321', '1651', '9546', '1286', '2402');
INSERT INTO `fw_code` VALUES ('4123395', '3321', '1652', '2776', '0028', '6500');
INSERT INTO `fw_code` VALUES ('4123396', '3321', '1653', '1682', '5968', '2581');
INSERT INTO `fw_code` VALUES ('4123397', '3321', '1654', '9785', '5473', '8251');
INSERT INTO `fw_code` VALUES ('4123398', '3321', '1655', '6768', '4198', '1170');
INSERT INTO `fw_code` VALUES ('4123399', '3321', '1656', '3070', '9512', '3197');
INSERT INTO `fw_code` VALUES ('4123400', '3321', '1657', '6982', '1667', '8188');
INSERT INTO `fw_code` VALUES ('4123401', '3321', '1658', '7302', '7869', '3715');
INSERT INTO `fw_code` VALUES ('4123402', '3321', '1659', '8651', '0405', '4491');
INSERT INTO `fw_code` VALUES ('4123403', '3321', '1660', '5446', '8381', '9224');
INSERT INTO `fw_code` VALUES ('4123404', '3321', '1661', '0640', '5346', '6322');
INSERT INTO `fw_code` VALUES ('4123405', '3321', '1662', '4419', '2048', '3974');
INSERT INTO `fw_code` VALUES ('4123406', '3321', '1663', '4485', '9774', '2643');
INSERT INTO `fw_code` VALUES ('4123407', '3321', '1664', '1494', '5219', '4393');
INSERT INTO `fw_code` VALUES ('4123408', '3321', '1665', '1855', '2429', '9759');
INSERT INTO `fw_code` VALUES ('4123409', '3321', '1666', '0319', '9143', '0795');
INSERT INTO `fw_code` VALUES ('4123410', '3321', '1667', '9291', '2810', '5545');
INSERT INTO `fw_code` VALUES ('4123411', '3321', '1668', '6194', '9520', '8786');
INSERT INTO `fw_code` VALUES ('4123412', '3321', '1669', '9225', '5083', '6875');
INSERT INTO `fw_code` VALUES ('4123413', '3321', '1670', '1428', '7492', '5724');
INSERT INTO `fw_code` VALUES ('4123414', '3321', '1671', '3203', '4965', '0536');
INSERT INTO `fw_code` VALUES ('4123415', '3321', '1672', '6728', '3191', '1331');
INSERT INTO `fw_code` VALUES ('4123416', '3321', '1673', '0721', '7361', '6000');
INSERT INTO `fw_code` VALUES ('4123417', '3321', '1674', '4058', '4838', '8608');
INSERT INTO `fw_code` VALUES ('4123418', '3321', '1675', '4164', '3572', '7117');
INSERT INTO `fw_code` VALUES ('4123419', '3321', '1676', '7903', '9266', '4929');
INSERT INTO `fw_code` VALUES ('4123420', '3321', '1677', '7262', '6861', '3875');
INSERT INTO `fw_code` VALUES ('4123421', '3321', '1678', '6301', '8254', '7295');
INSERT INTO `fw_code` VALUES ('4123422', '3321', '1679', '4912', '4711', '6679');
INSERT INTO `fw_code` VALUES ('4123423', '3321', '1680', '1601', '3953', '2902');
INSERT INTO `fw_code` VALUES ('4123424', '3321', '1681', '2430', '7107', '2143');
INSERT INTO `fw_code` VALUES ('4123425', '3321', '1682', '4953', '5718', '6518');
INSERT INTO `fw_code` VALUES ('4123426', '3321', '1683', '5767', '4584', '4750');
INSERT INTO `fw_code` VALUES ('4123427', '3321', '1684', '3351', '6545', '2223');
INSERT INTO `fw_code` VALUES ('4123428', '3321', '1685', '1281', '9589', '0714');
INSERT INTO `fw_code` VALUES ('4123429', '3321', '1686', '6382', '2108', '0312');
INSERT INTO `fw_code` VALUES ('4123430', '3321', '1687', '4913', '6549', '0018');
INSERT INTO `fw_code` VALUES ('4123431', '3321', '1688', '0360', '1990', '3973');
INSERT INTO `fw_code` VALUES ('4123432', '3321', '1689', '9999', '4779', '8607');
INSERT INTO `fw_code` VALUES ('4123433', '3321', '1690', '9226', '6922', '0214');
INSERT INTO `fw_code` VALUES ('4123434', '3321', '1691', '6729', '5029', '4669');
INSERT INTO `fw_code` VALUES ('4123435', '3321', '1692', '6021', '4898', '4946');
INSERT INTO `fw_code` VALUES ('4123436', '3321', '1693', '1215', '1863', '2044');
INSERT INTO `fw_code` VALUES ('4123437', '3321', '1694', '4272', '4144', '8964');
INSERT INTO `fw_code` VALUES ('4123438', '3321', '1695', '0320', '0982', '4134');
INSERT INTO `fw_code` VALUES ('4123439', '3321', '1696', '4994', '8565', '9696');
INSERT INTO `fw_code` VALUES ('4123440', '3321', '1697', '5060', '6291', '8366');
INSERT INTO `fw_code` VALUES ('4123441', '3321', '1698', '9826', '8319', '1428');
INSERT INTO `fw_code` VALUES ('4123442', '3321', '1699', '9786', '7311', '1589');
INSERT INTO `fw_code` VALUES ('4123443', '3321', '1700', '2069', '1736', '0116');
INSERT INTO `fw_code` VALUES ('4123444', '3321', '1701', '8544', '3509', '9321');
INSERT INTO `fw_code` VALUES ('4123445', '3321', '1702', '2924', '1609', '8187');
INSERT INTO `fw_code` VALUES ('4123446', '3321', '1703', '2817', '2874', '9678');
INSERT INTO `fw_code` VALUES ('4123447', '3321', '1704', '5701', '8696', '9419');
INSERT INTO `fw_code` VALUES ('4123448', '3321', '1705', '9867', '9327', '1268');
INSERT INTO `fw_code` VALUES ('4123449', '3321', '1706', '2456', '5664', '4312');
INSERT INTO `fw_code` VALUES ('4123450', '3321', '1707', '2003', '4009', '1446');
INSERT INTO `fw_code` VALUES ('4123451', '3321', '1708', '7089', '2239', '0035');
INSERT INTO `fw_code` VALUES ('4123452', '3321', '1709', '9719', '9585', '2919');
INSERT INTO `fw_code` VALUES ('4123453', '3321', '1710', '7303', '9708', '7053');
INSERT INTO `fw_code` VALUES ('4123454', '3321', '1711', '3951', '7942', '3437');
INSERT INTO `fw_code` VALUES ('4123455', '3321', '1712', '8972', '8446', '3357');
INSERT INTO `fw_code` VALUES ('4123456', '3321', '1713', '0147', '4521', '6955');
INSERT INTO `fw_code` VALUES ('4123457', '3321', '1714', '4633', '1355', '4330');
INSERT INTO `fw_code` VALUES ('4123458', '3321', '1715', '4740', '0089', '2839');
INSERT INTO `fw_code` VALUES ('4123459', '3321', '1716', '7837', '3378', '9598');
INSERT INTO `fw_code` VALUES ('4123460', '3321', '1717', '6876', '4771', '3018');
INSERT INTO `fw_code` VALUES ('4123461', '3321', '1718', '2176', '0470', '8625');
INSERT INTO `fw_code` VALUES ('4123462', '3321', '1719', '5660', '7688', '9580');
INSERT INTO `fw_code` VALUES ('4123463', '3321', '1720', '7517', '7176', '4071');
INSERT INTO `fw_code` VALUES ('4123464', '3321', '1721', '6342', '1101', '0473');
INSERT INTO `fw_code` VALUES ('4123465', '3321', '1722', '2563', '4398', '2821');
INSERT INTO `fw_code` VALUES ('4123466', '3321', '1723', '9119', '8188', '1705');
INSERT INTO `fw_code` VALUES ('4123467', '3321', '1724', '6037', '2360', '7540');
INSERT INTO `fw_code` VALUES ('4123468', '3321', '1725', '6611', '7038', '9924');
INSERT INTO `fw_code` VALUES ('4123469', '3321', '1726', '4541', '0082', '8415');
INSERT INTO `fw_code` VALUES ('4123470', '3321', '1727', '2298', '6665', '9727');
INSERT INTO `fw_code` VALUES ('4123471', '3321', '1728', '8173', '7042', '7718');
INSERT INTO `fw_code` VALUES ('4123472', '3321', '1729', '3620', '2483', '1674');
INSERT INTO `fw_code` VALUES ('4123473', '3321', '1730', '3259', '5272', '6308');
INSERT INTO `fw_code` VALUES ('4123474', '3321', '1731', '9561', '0586', '8335');
INSERT INTO `fw_code` VALUES ('4123475', '3321', '1732', '3473', '2741', '3326');
INSERT INTO `fw_code` VALUES ('4123476', '3321', '1733', '3794', '8943', '8852');
INSERT INTO `fw_code` VALUES ('4123477', '3321', '1734', '2486', '7415', '7915');
INSERT INTO `fw_code` VALUES ('4123478', '3321', '1735', '9989', '5522', '2370');
INSERT INTO `fw_code` VALUES ('4123479', '3321', '1736', '9281', '5391', '2647');
INSERT INTO `fw_code` VALUES ('4123480', '3321', '1737', '4475', '2356', '9745');
INSERT INTO `fw_code` VALUES ('4123481', '3321', '1738', '7532', '4637', '6665');
INSERT INTO `fw_code` VALUES ('4123482', '3321', '1739', '3580', '1475', '1835');
INSERT INTO `fw_code` VALUES ('4123483', '3321', '1740', '0910', '3122', '9111');
INSERT INTO `fw_code` VALUES ('4123484', '3321', '1741', '8320', '6784', '6067');
INSERT INTO `fw_code` VALUES ('4123485', '3321', '1742', '3086', '8812', '9129');
INSERT INTO `fw_code` VALUES ('4123486', '3321', '1743', '7679', '4379', '5013');
INSERT INTO `fw_code` VALUES ('4123487', '3321', '1744', '3046', '7804', '9290');
INSERT INTO `fw_code` VALUES ('4123488', '3321', '1745', '5329', '2229', '7817');
INSERT INTO `fw_code` VALUES ('4123489', '3321', '1746', '1805', '4002', '7022');
INSERT INTO `fw_code` VALUES ('4123490', '3321', '1747', '8346', '3503', '4897');
INSERT INTO `fw_code` VALUES ('4123491', '3321', '1748', '5503', '8689', '4995');
INSERT INTO `fw_code` VALUES ('4123492', '3321', '1749', '3687', '0209', '0344');
INSERT INTO `fw_code` VALUES ('4123493', '3321', '1750', '8026', '7300', '9370');
INSERT INTO `fw_code` VALUES ('4123494', '3321', '1751', '4154', '6153', '4218');
INSERT INTO `fw_code` VALUES ('4123495', '3321', '1752', '6184', '2102', '5888');
INSERT INTO `fw_code` VALUES ('4123496', '3321', '1753', '6077', '3367', '7379');
INSERT INTO `fw_code` VALUES ('4123497', '3321', '1754', '8961', '9189', '7120');
INSERT INTO `fw_code` VALUES ('4123498', '3321', '1755', '0029', '6530', '2209');
INSERT INTO `fw_code` VALUES ('4123499', '3321', '1756', '1631', '7542', '9843');
INSERT INTO `fw_code` VALUES ('4123500', '3321', '1757', '5716', '6157', '2013');
INSERT INTO `fw_code` VALUES ('4123501', '3321', '1758', '7919', '8566', '0861');
INSERT INTO `fw_code` VALUES ('4123502', '3321', '1759', '7038', '1975', '3959');
INSERT INTO `fw_code` VALUES ('4123503', '3321', '1760', '0350', '2732', '7736');
INSERT INTO `fw_code` VALUES ('4123504', '3321', '1761', '2979', '0078', '0620');
INSERT INTO `fw_code` VALUES ('4123505', '3321', '1762', '0563', '0201', '4754');
INSERT INTO `fw_code` VALUES ('4123506', '3321', '1763', '7212', '8435', '1138');
INSERT INTO `fw_code` VALUES ('4123507', '3321', '1764', '2232', '8939', '1058');
INSERT INTO `fw_code` VALUES ('4123508', '3321', '1765', '3407', '5014', '4656');
INSERT INTO `fw_code` VALUES ('4123509', '3321', '1766', '9027', '6915', '5790');
INSERT INTO `fw_code` VALUES ('4123510', '3321', '1767', '7893', '1848', '2031');
INSERT INTO `fw_code` VALUES ('4123511', '3321', '1768', '7278', '6161', '9808');
INSERT INTO `fw_code` VALUES ('4123512', '3321', '1769', '6998', '0967', '4120');
INSERT INTO `fw_code` VALUES ('4123513', '3321', '1770', '1738', '6276', '8352');
INSERT INTO `fw_code` VALUES ('4123514', '3321', '1771', '2832', '0336', '2272');
INSERT INTO `fw_code` VALUES ('4123515', '3321', '1772', '1097', '3871', '7299');
INSERT INTO `fw_code` VALUES ('4123516', '3321', '1773', '8747', '1721', '0102');
INSERT INTO `fw_code` VALUES ('4123517', '3321', '1774', '1550', '5526', '0165');
INSERT INTO `fw_code` VALUES ('4123518', '3321', '1775', '5436', '0963', '6326');
INSERT INTO `fw_code` VALUES ('4123519', '3321', '1776', '8921', '8181', '7281');
INSERT INTO `fw_code` VALUES ('4123520', '3321', '1777', '0777', '7669', '1772');
INSERT INTO `fw_code` VALUES ('4123521', '3321', '1778', '1444', '6792', '1656');
INSERT INTO `fw_code` VALUES ('4123522', '3321', '1779', '3900', '7677', '7361');
INSERT INTO `fw_code` VALUES ('4123523', '3321', '1780', '9602', '1594', '8174');
INSERT INTO `fw_code` VALUES ('4123524', '3321', '1781', '5823', '4891', '0522');
INSERT INTO `fw_code` VALUES ('4123525', '3321', '1782', '2379', '8681', '9406');
INSERT INTO `fw_code` VALUES ('4123526', '3321', '1783', '2873', '1344', '2111');
INSERT INTO `fw_code` VALUES ('4123527', '3321', '1784', '6103', '0086', '6210');
INSERT INTO `fw_code` VALUES ('4123528', '3321', '1785', '1377', '9066', '2986');
INSERT INTO `fw_code` VALUES ('4123529', '3321', '1786', '9134', '5649', '4299');
INSERT INTO `fw_code` VALUES ('4123530', '3321', '1787', '0456', '1467', '6245');
INSERT INTO `fw_code` VALUES ('4123531', '3321', '1788', '6397', '9570', '2906');
INSERT INTO `fw_code` VALUES ('4123532', '3321', '1789', '4077', '9170', '9312');
INSERT INTO `fw_code` VALUES ('4123533', '3321', '1790', '4398', '5372', '4839');
INSERT INTO `fw_code` VALUES ('4123534', '3321', '1791', '5746', '7908', '5615');
INSERT INTO `fw_code` VALUES ('4123535', '3321', '1792', '0593', '1951', '8356');
INSERT INTO `fw_code` VALUES ('4123536', '3321', '1793', '2542', '5884', '0348');
INSERT INTO `fw_code` VALUES ('4123537', '3321', '1794', '5079', '8785', '5731');
INSERT INTO `fw_code` VALUES ('4123538', '3321', '1795', '8136', '1066', '2651');
INSERT INTO `fw_code` VALUES ('4123539', '3321', '1796', '4184', '7904', '7821');
INSERT INTO `fw_code` VALUES ('4123540', '3321', '1797', '1514', '9551', '5098');
INSERT INTO `fw_code` VALUES ('4123541', '3321', '1798', '1580', '7277', '3767');
INSERT INTO `fw_code` VALUES ('4123542', '3321', '1799', '3691', '5241', '5115');
INSERT INTO `fw_code` VALUES ('4123543', '3321', '1800', '3650', '4233', '5276');
INSERT INTO `fw_code` VALUES ('4123544', '3321', '1801', '5934', '8658', '3803');
INSERT INTO `fw_code` VALUES ('4123545', '3321', '1802', '2409', '0431', '3008');
INSERT INTO `fw_code` VALUES ('4123546', '3321', '1803', '8203', '8793', '1321');
INSERT INTO `fw_code` VALUES ('4123547', '3321', '1804', '8950', '9932', '0883');
INSERT INTO `fw_code` VALUES ('4123548', '3321', '1805', '6107', '5118', '0981');
INSERT INTO `fw_code` VALUES ('4123549', '3321', '1806', '4291', '6638', '6330');
INSERT INTO `fw_code` VALUES ('4123550', '3321', '1807', '8630', '3729', '5357');
INSERT INTO `fw_code` VALUES ('4123551', '3321', '1808', '4759', '2582', '0205');
INSERT INTO `fw_code` VALUES ('4123552', '3321', '1809', '6788', '8531', '1874');
INSERT INTO `fw_code` VALUES ('4123553', '3321', '1810', '2221', '9682', '4821');
INSERT INTO `fw_code` VALUES ('4123554', '3321', '1811', '6387', '0313', '6669');
INSERT INTO `fw_code` VALUES ('4123555', '3321', '1812', '3289', '7023', '9910');
INSERT INTO `fw_code` VALUES ('4123556', '3321', '1813', '6321', '2586', '7999');
INSERT INTO `fw_code` VALUES ('4123557', '3321', '1814', '8523', '4995', '6848');
INSERT INTO `fw_code` VALUES ('4123558', '3321', '1815', '0299', '2467', '1660');
INSERT INTO `fw_code` VALUES ('4123559', '3321', '1816', '3610', '3225', '5437');
INSERT INTO `fw_code` VALUES ('4123560', '3321', '1817', '3584', '6507', '6606');
INSERT INTO `fw_code` VALUES ('4123561', '3321', '1818', '3823', '0694', '2455');
INSERT INTO `fw_code` VALUES ('4123562', '3321', '1819', '7816', '4864', '7124');
INSERT INTO `fw_code` VALUES ('4123563', '3321', '1820', '2836', '5368', '7044');
INSERT INTO `fw_code` VALUES ('4123564', '3321', '1821', '9632', '3344', '1776');
INSERT INTO `fw_code` VALUES ('4123565', '3321', '1822', '1153', '2340', '9732');
INSERT INTO `fw_code` VALUES ('4123566', '3321', '1823', '7882', '2590', '5794');
INSERT INTO `fw_code` VALUES ('4123567', '3321', '1824', '7602', '7396', '0106');
INSERT INTO `fw_code` VALUES ('4123568', '3321', '1825', '1260', '1075', '8241');
INSERT INTO `fw_code` VALUES ('4123569', '3321', '1826', '4998', '6769', '6053');
INSERT INTO `fw_code` VALUES ('4123570', '3321', '1827', '3437', '6765', '8258');
INSERT INTO `fw_code` VALUES ('4123571', '3321', '1828', '3396', '5757', '8419');
INSERT INTO `fw_code` VALUES ('4123572', '3321', '1829', '2008', '2214', '7803');
INSERT INTO `fw_code` VALUES ('4123573', '3321', '1830', '2155', '1955', '6151');
INSERT INTO `fw_code` VALUES ('4123574', '3321', '1831', '1621', '8285', '3606');
INSERT INTO `fw_code` VALUES ('4123575', '3321', '1832', '6041', '7392', '2312');
INSERT INTO `fw_code` VALUES ('4123576', '3321', '1833', '9525', '4610', '3267');
INSERT INTO `fw_code` VALUES ('4123577', '3321', '1834', '4037', '8162', '9473');
INSERT INTO `fw_code` VALUES ('4123578', '3321', '1835', '2048', '3221', '7642');
INSERT INTO `fw_code` VALUES ('4123579', '3321', '1836', '4505', '4106', '3348');
INSERT INTO `fw_code` VALUES ('4123580', '3321', '1837', '6427', '1320', '6508');
INSERT INTO `fw_code` VALUES ('4123581', '3321', '1838', '5639', '9174', '7107');
INSERT INTO `fw_code` VALUES ('4123582', '3321', '1839', '3477', '7773', '8097');
INSERT INTO `fw_code` VALUES ('4123583', '3321', '1840', '6707', '6515', '2196');
INSERT INTO `fw_code` VALUES ('4123584', '3321', '1841', '1982', '5495', '8972');
INSERT INTO `fw_code` VALUES ('4123585', '3321', '1842', '9739', '2078', '0285');
INSERT INTO `fw_code` VALUES ('4123586', '3321', '1843', '5613', '2455', '8276');
INSERT INTO `fw_code` VALUES ('4123587', '3321', '1844', '3717', '1960', '3946');
INSERT INTO `fw_code` VALUES ('4123588', '3321', '1845', '0700', '0685', '6865');
INSERT INTO `fw_code` VALUES ('4123589', '3321', '1846', '7002', '5999', '8892');
INSERT INTO `fw_code` VALUES ('4123590', '3321', '1847', '0913', '8154', '3883');
INSERT INTO `fw_code` VALUES ('4123591', '3321', '1848', '1234', '4356', '9410');
INSERT INTO `fw_code` VALUES ('4123592', '3321', '1849', '2582', '6892', '0187');
INSERT INTO `fw_code` VALUES ('4123593', '3321', '1850', '0085', '4999', '4642');
INSERT INTO `fw_code` VALUES ('4123594', '3321', '1851', '9378', '4868', '4919');
INSERT INTO `fw_code` VALUES ('4123595', '3321', '1852', '4571', '1833', '2017');
INSERT INTO `fw_code` VALUES ('4123596', '3321', '1853', '1020', '6888', '2392');
INSERT INTO `fw_code` VALUES ('4123597', '3321', '1854', '8416', '6261', '8339');
INSERT INTO `fw_code` VALUES ('4123598', '3321', '1855', '7775', '3856', '7285');
INSERT INTO `fw_code` VALUES ('4123599', '3321', '1856', '4255', '0662', '1262');
INSERT INTO `fw_code` VALUES ('4123600', '3321', '1857', '9194', '9151', '1504');
INSERT INTO `fw_code` VALUES ('4123601', '3321', '1858', '5669', '0924', '0709');
INSERT INTO `fw_code` VALUES ('4123602', '3321', '1859', '8807', '5222', '7307');
INSERT INTO `fw_code` VALUES ('4123603', '3321', '1860', '9555', '6361', '6869');
INSERT INTO `fw_code` VALUES ('4123604', '3321', '1861', '9234', '0158', '1343');
INSERT INTO `fw_code` VALUES ('4123605', '3321', '1862', '8019', '3075', '7905');
INSERT INTO `fw_code` VALUES ('4123606', '3321', '1863', '0048', '9024', '9575');
INSERT INTO `fw_code` VALUES ('4123607', '3321', '1864', '9942', '0289', '1066');
INSERT INTO `fw_code` VALUES ('4123608', '3321', '1865', '2826', '6111', '0807');
INSERT INTO `fw_code` VALUES ('4123609', '3321', '1866', '6991', '6742', '2655');
INSERT INTO `fw_code` VALUES ('4123610', '3321', '1867', '3894', '3452', '5896');
INSERT INTO `fw_code` VALUES ('4123611', '3321', '1868', '5496', '4464', '3530');
INSERT INTO `fw_code` VALUES ('4123612', '3321', '1869', '6925', '9015', '3985');
INSERT INTO `fw_code` VALUES ('4123613', '3321', '1870', '9127', '1424', '2834');
INSERT INTO `fw_code` VALUES ('4123614', '3321', '1871', '0903', '8897', '7646');
INSERT INTO `fw_code` VALUES ('4123615', '3321', '1872', '4214', '9654', '1423');
INSERT INTO `fw_code` VALUES ('4123616', '3321', '1873', '6844', '7000', '4307');
INSERT INTO `fw_code` VALUES ('4123617', '3321', '1874', '4428', '7123', '8441');
INSERT INTO `fw_code` VALUES ('4123618', '3321', '1875', '8420', '1293', '3110');
INSERT INTO `fw_code` VALUES ('4123619', '3321', '1876', '6096', '5861', '4745');
INSERT INTO `fw_code` VALUES ('4123620', '3321', '1877', '7271', '1936', '8343');
INSERT INTO `fw_code` VALUES ('4123621', '3321', '1878', '0236', '9773', '7762');
INSERT INTO `fw_code` VALUES ('4123622', '3321', '1879', '8487', '9020', '1780');
INSERT INTO `fw_code` VALUES ('4123623', '3321', '1880', '8207', '3825', '6093');
INSERT INTO `fw_code` VALUES ('4123624', '3321', '1881', '5603', '3198', '2039');
INSERT INTO `fw_code` VALUES ('4123625', '3321', '1882', '4041', '3194', '4244');
INSERT INTO `fw_code` VALUES ('4123626', '3321', '1883', '4962', '0793', '0986');
INSERT INTO `fw_code` VALUES ('4123627', '3321', '1884', '2612', '8643', '3789');
INSERT INTO `fw_code` VALUES ('4123628', '3321', '1885', '2759', '8385', '2137');
INSERT INTO `fw_code` VALUES ('4123629', '3321', '1886', '9301', '7885', '0012');
INSERT INTO `fw_code` VALUES ('4123630', '3321', '1887', '0129', '1039', '9253');
INSERT INTO `fw_code` VALUES ('4123631', '3321', '1888', '4641', '4591', '5459');
INSERT INTO `fw_code` VALUES ('4123632', '3321', '1889', '2652', '9650', '3628');
INSERT INTO `fw_code` VALUES ('4123633', '3321', '1890', '5109', '0535', '9334');
INSERT INTO `fw_code` VALUES ('4123634', '3321', '1891', '7032', '7750', '2494');
INSERT INTO `fw_code` VALUES ('4123635', '3321', '1892', '6244', '5603', '3093');
INSERT INTO `fw_code` VALUES ('4123636', '3321', '1893', '6737', '8266', '5798');
INSERT INTO `fw_code` VALUES ('4123637', '3321', '1894', '7312', '2944', '8182');
INSERT INTO `fw_code` VALUES ('4123638', '3321', '1895', '5242', '5988', '6673');
INSERT INTO `fw_code` VALUES ('4123639', '3321', '1896', '0343', '8507', '6271');
INSERT INTO `fw_code` VALUES ('4123640', '3321', '1897', '4321', '8389', '9932');
INSERT INTO `fw_code` VALUES ('4123641', '3321', '1898', '3960', '1178', '4566');
INSERT INTO `fw_code` VALUES ('4123642', '3321', '1899', '0262', '6492', '6593');
INSERT INTO `fw_code` VALUES ('4123643', '3321', '1900', '4174', '8647', '1584');
INSERT INTO `fw_code` VALUES ('4123644', '3321', '1901', '4494', '4849', '7111');
INSERT INTO `fw_code` VALUES ('4123645', '3321', '1902', '3186', '3321', '6173');
INSERT INTO `fw_code` VALUES ('4123646', '3321', '1903', '0689', '1428', '0628');
INSERT INTO `fw_code` VALUES ('4123647', '3321', '1904', '9982', '1297', '0905');
INSERT INTO `fw_code` VALUES ('4123648', '3321', '1905', '8233', '0543', '4923');
INSERT INTO `fw_code` VALUES ('4123649', '3321', '1906', '4280', '7381', '0093');
INSERT INTO `fw_code` VALUES ('4123650', '3321', '1907', '8954', '4964', '5655');
INSERT INTO `fw_code` VALUES ('4123651', '3321', '1908', '9021', '2690', '4325');
INSERT INTO `fw_code` VALUES ('4123652', '3321', '1909', '3787', '4718', '7387');
INSERT INTO `fw_code` VALUES ('4123653', '3321', '1910', '8380', '0285', '3271');
INSERT INTO `fw_code` VALUES ('4123654', '3321', '1911', '6030', '8135', '6075');
INSERT INTO `fw_code` VALUES ('4123655', '3321', '1912', '2505', '9908', '5280');
INSERT INTO `fw_code` VALUES ('4123656', '3321', '1913', '9382', '1739', '3029');
INSERT INTO `fw_code` VALUES ('4123657', '3321', '1914', '0130', '2878', '2592');
INSERT INTO `fw_code` VALUES ('4123658', '3321', '1915', '8126', '3648', '9753');
INSERT INTO `fw_code` VALUES ('4123659', '3321', '1916', '9809', '6675', '7065');
INSERT INTO `fw_code` VALUES ('4123660', '3321', '1917', '0623', '5541', '5297');
INSERT INTO `fw_code` VALUES ('4123661', '3321', '1918', '0517', '6806', '6788');
INSERT INTO `fw_code` VALUES ('4123662', '3321', '1919', '3401', '2628', '6530');
INSERT INTO `fw_code` VALUES ('4123663', '3321', '1920', '7566', '3259', '8378');
INSERT INTO `fw_code` VALUES ('4123664', '3321', '1921', '4469', '9969', '1619');
INSERT INTO `fw_code` VALUES ('4123665', '3321', '1922', '9703', '7941', '8556');
INSERT INTO `fw_code` VALUES ('4123666', '3321', '1923', '1478', '5414', '3369');
INSERT INTO `fw_code` VALUES ('4123667', '3321', '1924', '4789', '6171', '7146');
INSERT INTO `fw_code` VALUES ('4123668', '3321', '1925', '7419', '3517', '0030');
INSERT INTO `fw_code` VALUES ('4123669', '3321', '1926', '5003', '3640', '4163');
INSERT INTO `fw_code` VALUES ('4123670', '3321', '1927', '1651', '1874', '0548');
INSERT INTO `fw_code` VALUES ('4123671', '3321', '1928', '6671', '2378', '0467');
INSERT INTO `fw_code` VALUES ('4123672', '3321', '1929', '7846', '8453', '4065');
INSERT INTO `fw_code` VALUES ('4123673', '3321', '1930', '3467', '0354', '5199');
INSERT INTO `fw_code` VALUES ('4123674', '3321', '1931', '2332', '5287', '1440');
INSERT INTO `fw_code` VALUES ('4123675', '3321', '1932', '9062', '5536', '7503');
INSERT INTO `fw_code` VALUES ('4123676', '3321', '1933', '2439', '4021', '9949');
INSERT INTO `fw_code` VALUES ('4123677', '3321', '1934', '4616', '9711', '9967');
INSERT INTO `fw_code` VALUES ('4123678', '3321', '1935', '5537', '7310', '6708');
INSERT INTO `fw_code` VALUES ('4123679', '3321', '1936', '4576', '8703', '0128');
INSERT INTO `fw_code` VALUES ('4123680', '3321', '1937', '2800', '1231', '5315');
INSERT INTO `fw_code` VALUES ('4123681', '3321', '1938', '9876', '4402', '5735');
INSERT INTO `fw_code` VALUES ('4123682', '3321', '1939', '3360', '1620', '6690');
INSERT INTO `fw_code` VALUES ('4123683', '3321', '1940', '5216', '1108', '1181');
INSERT INTO `fw_code` VALUES ('4123684', '3321', '1941', '8340', '1116', '6771');
INSERT INTO `fw_code` VALUES ('4123685', '3321', '1942', '0263', '8330', '9931');
INSERT INTO `fw_code` VALUES ('4123686', '3321', '1943', '6819', '2120', '8815');
INSERT INTO `fw_code` VALUES ('4123687', '3321', '1944', '5817', '2505', '2396');
INSERT INTO `fw_code` VALUES ('4123688', '3321', '1945', '3574', '9088', '3708');
INSERT INTO `fw_code` VALUES ('4123689', '3321', '1946', '9448', '9465', '1699');
INSERT INTO `fw_code` VALUES ('4123690', '3321', '1947', '4896', '4906', '5654');
INSERT INTO `fw_code` VALUES ('4123691', '3321', '1948', '4535', '7695', '0289');
INSERT INTO `fw_code` VALUES ('4123692', '3321', '1949', '0837', '3009', '2315');
INSERT INTO `fw_code` VALUES ('4123693', '3321', '1950', '4749', '5164', '7306');
INSERT INTO `fw_code` VALUES ('4123694', '3321', '1951', '5069', '1366', '2833');
INSERT INTO `fw_code` VALUES ('4123695', '3321', '1952', '3761', '9838', '1895');
INSERT INTO `fw_code` VALUES ('4123696', '3321', '1953', '1264', '7945', '6351');
INSERT INTO `fw_code` VALUES ('4123697', '3321', '1954', '0557', '7814', '6628');
INSERT INTO `fw_code` VALUES ('4123698', '3321', '1955', '4609', '2314', '6917');
INSERT INTO `fw_code` VALUES ('4123699', '3321', '1956', '7986', '0798', '9363');
INSERT INTO `fw_code` VALUES ('4123700', '3321', '1957', '0163', '6488', '9381');
INSERT INTO `fw_code` VALUES ('4123701', '3321', '1958', '0122', '5481', '9542');
INSERT INTO `fw_code` VALUES ('4123702', '3321', '1959', '8881', '1679', '7274');
INSERT INTO `fw_code` VALUES ('4123703', '3321', '1960', '4675', '0040', '5586');
INSERT INTO `fw_code` VALUES ('4123704', '3321', '1961', '5102', '4977', '9622');
INSERT INTO `fw_code` VALUES ('4123705', '3321', '1962', '3260', '9778', '6140');
INSERT INTO `fw_code` VALUES ('4123706', '3321', '1963', '3154', '1044', '7631');
INSERT INTO `fw_code` VALUES ('4123707', '3321', '1964', '6038', '6865', '7372');
INSERT INTO `fw_code` VALUES ('4123708', '3321', '1965', '7106', '4207', '2461');
INSERT INTO `fw_code` VALUES ('4123709', '3321', '1966', '2793', '3834', '2265');
INSERT INTO `fw_code` VALUES ('4123710', '3321', '1967', '4995', '6243', '1113');
INSERT INTO `fw_code` VALUES ('4123711', '3321', '1968', '7426', '0409', '7988');
INSERT INTO `fw_code` VALUES ('4123712', '3321', '1969', '0056', '7754', '0872');
INSERT INTO `fw_code` VALUES ('4123713', '3321', '1970', '7640', '7877', '5006');
INSERT INTO `fw_code` VALUES ('4123714', '3321', '1971', '4288', '6112', '1390');
INSERT INTO `fw_code` VALUES ('4123715', '3321', '1972', '0483', '2691', '4908');
INSERT INTO `fw_code` VALUES ('4123716', '3321', '1973', '4969', '9524', '2282');
INSERT INTO `fw_code` VALUES ('4123717', '3321', '1974', '4354', '3838', '0060');
INSERT INTO `fw_code` VALUES ('4123718', '3321', '1975', '7213', '2941', '0970');
INSERT INTO `fw_code` VALUES ('4123719', '3321', '1976', '5824', '9397', '0354');
INSERT INTO `fw_code` VALUES ('4123720', '3321', '1977', '8627', '3203', '0417');
INSERT INTO `fw_code` VALUES ('4123721', '3321', '1978', '8093', '9532', '7872');
INSERT INTO `fw_code` VALUES ('4123722', '3321', '1979', '5997', '5858', '7533');
INSERT INTO `fw_code` VALUES ('4123723', '3321', '1980', '7853', '5345', '2024');
INSERT INTO `fw_code` VALUES ('4123724', '3321', '1981', '8520', '4469', '1908');
INSERT INTO `fw_code` VALUES ('4123725', '3321', '1982', '3180', '7762', '6461');
INSERT INTO `fw_code` VALUES ('4123726', '3321', '1983', '2085', '3703', '2541');
INSERT INTO `fw_code` VALUES ('4123727', '3321', '1984', '7172', '1933', '1131');
INSERT INTO `fw_code` VALUES ('4123728', '3321', '1985', '3474', '7246', '3157');
INSERT INTO `fw_code` VALUES ('4123729', '3321', '1986', '9054', '8139', '4452');
INSERT INTO `fw_code` VALUES ('4123730', '3321', '1987', '8387', '9016', '4568');
INSERT INTO `fw_code` VALUES ('4123731', '3321', '1988', '4889', '7508', '2604');
INSERT INTO `fw_code` VALUES ('4123732', '3321', '1989', '9242', '8889', '2640');
INSERT INTO `fw_code` VALUES ('4123733', '3321', '1990', '9415', '5350', '9818');
INSERT INTO `fw_code` VALUES ('4123734', '3321', '1991', '7599', '6869', '5166');
INSERT INTO `fw_code` VALUES ('4123735', '3321', '1992', '9695', '0544', '5506');
INSERT INTO `fw_code` VALUES ('4123736', '3321', '1993', '1968', '5711', '7796');
INSERT INTO `fw_code` VALUES ('4123737', '3321', '1994', '0686', '0902', '5689');
INSERT INTO `fw_code` VALUES ('4123738', '3321', '1995', '1088', '9120', '0894');
INSERT INTO `fw_code` VALUES ('4123739', '3321', '1996', '4959', '0267', '6046');
INSERT INTO `fw_code` VALUES ('4123740', '3321', '1997', '4679', '5072', '0358');
INSERT INTO `fw_code` VALUES ('4123741', '3321', '1998', '2075', '4446', '6305');
INSERT INTO `fw_code` VALUES ('4123742', '3321', '1999', '0513', '4441', '8510');
INSERT INTO `fw_code` VALUES ('4123743', '3321', '2000', '1434', '2041', '5251');
INSERT INTO `fw_code` VALUES ('4123744', '3321', '2001', '9231', '9632', '6403');
INSERT INTO `fw_code` VALUES ('4123745', '3321', '2002', '8697', '5961', '3858');
INSERT INTO `fw_code` VALUES ('4123746', '3321', '2003', '3117', '5068', '2563');
INSERT INTO `fw_code` VALUES ('4123747', '3321', '2004', '6601', '2287', '3519');
INSERT INTO `fw_code` VALUES ('4123748', '3321', '2005', '1114', '5838', '9724');
INSERT INTO `fw_code` VALUES ('4123749', '3321', '2006', '9125', '0898', '7894');
INSERT INTO `fw_code` VALUES ('4123750', '3321', '2007', '9939', '9763', '6126');
INSERT INTO `fw_code` VALUES ('4123751', '3321', '2008', '3504', '8997', '6760');
INSERT INTO `fw_code` VALUES ('4123752', '3321', '2009', '2716', '6850', '7358');
INSERT INTO `fw_code` VALUES ('4123753', '3321', '2010', '3784', '4192', '2447');
INSERT INTO `fw_code` VALUES ('4123754', '3321', '2011', '6815', '9755', '0537');
INSERT INTO `fw_code` VALUES ('4123755', '3321', '2012', '2690', '0132', '8528');
INSERT INTO `fw_code` VALUES ('4123756', '3321', '2013', '0793', '9636', '4197');
INSERT INTO `fw_code` VALUES ('4123757', '3321', '2014', '4078', '3675', '9144');
INSERT INTO `fw_code` VALUES ('4123758', '3321', '2015', '8310', '2033', '9662');
INSERT INTO `fw_code` VALUES ('4123759', '3321', '2016', '9659', '4568', '0438');
INSERT INTO `fw_code` VALUES ('4123760', '3321', '2017', '7161', '2676', '4894');
INSERT INTO `fw_code` VALUES ('4123761', '3321', '2018', '2049', '7727', '7474');
INSERT INTO `fw_code` VALUES ('4123762', '3321', '2019', '8097', '4564', '2644');
INSERT INTO `fw_code` VALUES ('4123763', '3321', '2020', '0259', '5965', '1653');
INSERT INTO `fw_code` VALUES ('4123764', '3321', '2021', '4852', '1533', '7537');
INSERT INTO `fw_code` VALUES ('4123765', '3321', '2022', '2502', '9382', '0340');
INSERT INTO `fw_code` VALUES ('4123766', '3321', '2023', '2115', '5453', '6144');
INSERT INTO `fw_code` VALUES ('4123767', '3321', '2024', '0019', '1779', '5804');
INSERT INTO `fw_code` VALUES ('4123768', '3321', '2025', '8204', '3299', '1153');
INSERT INTO `fw_code` VALUES ('4123769', '3321', '2026', '1327', '3307', '6742');
INSERT INTO `fw_code` VALUES ('4123770', '3321', '2027', '8804', '4695', '2367');
INSERT INTO `fw_code` VALUES ('4123771', '3321', '2028', '0233', '9247', '2822');
INSERT INTO `fw_code` VALUES ('4123772', '3321', '2029', '4211', '9128', '6483');
INSERT INTO `fw_code` VALUES ('4123773', '3321', '2030', '7522', '9886', '0260');
INSERT INTO `fw_code` VALUES ('4123774', '3321', '2031', '9405', '6092', '3581');
INSERT INTO `fw_code` VALUES ('4123775', '3321', '2032', '4348', '9613', '8594');
INSERT INTO `fw_code` VALUES ('4123776', '3321', '2033', '8834', '6446', '5969');
INSERT INTO `fw_code` VALUES ('4123777', '3321', '2034', '5563', '6696', '2032');
INSERT INTO `fw_code` VALUES ('4123778', '3321', '2035', '5283', '1501', '6344');
INSERT INTO `fw_code` VALUES ('4123779', '3321', '2036', '2679', '0875', '2291');
INSERT INTO `fw_code` VALUES ('4123780', '3321', '2037', '2038', '8470', '1237');
INSERT INTO `fw_code` VALUES ('4123781', '3321', '2038', '1077', '9863', '4657');
INSERT INTO `fw_code` VALUES ('4123782', '3321', '2039', '9688', '6319', '4041');
INSERT INTO `fw_code` VALUES ('4123783', '3321', '2040', '9836', '6061', '2389');
INSERT INTO `fw_code` VALUES ('4123784', '3321', '2041', '9302', '2390', '9844');
INSERT INTO `fw_code` VALUES ('4123785', '3321', '2042', '6377', '5561', '0264');
INSERT INTO `fw_code` VALUES ('4123786', '3321', '2043', '7206', '8716', '9505');
INSERT INTO `fw_code` VALUES ('4123787', '3321', '2044', '1718', '2268', '5710');
INSERT INTO `fw_code` VALUES ('4123788', '3321', '2045', '9729', '7327', '3880');
INSERT INTO `fw_code` VALUES ('4123789', '3321', '2046', '0543', '6192', '2112');
INSERT INTO `fw_code` VALUES ('4123790', '3321', '2047', '4108', '5426', '2746');
INSERT INTO `fw_code` VALUES ('4123791', '3321', '2048', '3320', '3279', '3344');
INSERT INTO `fw_code` VALUES ('4123792', '3321', '2049', '4388', '0621', '8434');
INSERT INTO `fw_code` VALUES ('4123793', '3321', '2050', '2318', '3664', '6925');
INSERT INTO `fw_code` VALUES ('4123794', '3321', '2051', '1397', '6065', '0184');
INSERT INTO `fw_code` VALUES ('4123795', '3321', '2052', '7339', '4168', '6844');
INSERT INTO `fw_code` VALUES ('4123796', '3321', '2053', '1250', '6323', '1836');
INSERT INTO `fw_code` VALUES ('4123797', '3321', '2054', '7766', '9105', '0880');
INSERT INTO `fw_code` VALUES ('4123798', '3321', '2055', '2252', '5938', '8255');
INSERT INTO `fw_code` VALUES ('4123799', '3321', '2056', '5309', '8220', '5175');
INSERT INTO `fw_code` VALUES ('4123800', '3321', '2057', '6031', '2640', '5907');
INSERT INTO `fw_code` VALUES ('4123801', '3321', '2058', '6097', '0367', '4576');
INSERT INTO `fw_code` VALUES ('4123802', '3321', '2059', '0863', '2395', '7639');
INSERT INTO `fw_code` VALUES ('4123803', '3321', '2060', '5456', '7962', '3523');
INSERT INTO `fw_code` VALUES ('4123804', '3321', '2061', '0823', '1387', '7800');
INSERT INTO `fw_code` VALUES ('4123805', '3321', '2062', '9582', '7585', '5532');
INSERT INTO `fw_code` VALUES ('4123806', '3321', '2063', '2720', '1882', '2130');
INSERT INTO `fw_code` VALUES ('4123807', '3321', '2064', '1464', '3791', '8853');
INSERT INTO `fw_code` VALUES ('4123808', '3321', '2065', '3147', '6819', '6166');
INSERT INTO `fw_code` VALUES ('4123809', '3321', '2066', '3854', '6950', '5889');
INSERT INTO `fw_code` VALUES ('4123810', '3321', '2067', '6738', '2771', '5630');
INSERT INTO `fw_code` VALUES ('4123811', '3321', '2068', '0904', '3402', '7478');
INSERT INTO `fw_code` VALUES ('4123812', '3321', '2069', '9408', '1125', '8353');
INSERT INTO `fw_code` VALUES ('4123813', '3321', '2070', '4815', '5557', '2469');
INSERT INTO `fw_code` VALUES ('4123814', '3321', '2071', '8127', '6315', '6246');
INSERT INTO `fw_code` VALUES ('4123815', '3321', '2072', '0757', '3660', '9130');
INSERT INTO `fw_code` VALUES ('4123816', '3321', '2073', '7579', '0194', '6032');
INSERT INTO `fw_code` VALUES ('4123817', '3321', '2074', '2065', '7027', '3406');
INSERT INTO `fw_code` VALUES ('4123818', '3321', '2075', '5910', '1456', '9728');
INSERT INTO `fw_code` VALUES ('4123819', '3321', '2076', '5269', '9051', '8674');
INSERT INTO `fw_code` VALUES ('4123820', '3321', '2077', '4308', '0444', '2094');
INSERT INTO `fw_code` VALUES ('4123821', '3321', '2078', '2919', '6900', '1478');
INSERT INTO `fw_code` VALUES ('4123822', '3321', '2079', '3067', '6642', '9826');
INSERT INTO `fw_code` VALUES ('4123823', '3321', '2080', '9608', '6142', '7701');
INSERT INTO `fw_code` VALUES ('4123824', '3321', '2081', '4949', '2848', '3148');
INSERT INTO `fw_code` VALUES ('4123825', '3321', '2082', '3774', '6773', '9549');
INSERT INTO `fw_code` VALUES ('4123826', '3321', '2083', '9995', '0071', '1898');
INSERT INTO `fw_code` VALUES ('4123827', '3321', '2084', '6551', '3860', '0781');
INSERT INTO `fw_code` VALUES ('4123828', '3321', '2085', '7619', '1202', '5871');
INSERT INTO `fw_code` VALUES ('4123829', '3321', '2086', '5549', '4245', '4362');
INSERT INTO `fw_code` VALUES ('4123830', '3321', '2087', '3306', '0829', '5674');
INSERT INTO `fw_code` VALUES ('4123831', '3321', '2088', '9181', '1206', '3665');
INSERT INTO `fw_code` VALUES ('4123832', '3321', '2089', '4628', '6646', '7621');
INSERT INTO `fw_code` VALUES ('4123833', '3321', '2090', '4267', '9436', '2255');
INSERT INTO `fw_code` VALUES ('4123834', '3321', '2091', '0569', '4749', '4281');
INSERT INTO `fw_code` VALUES ('4123835', '3321', '2092', '3494', '1578', '3862');
INSERT INTO `fw_code` VALUES ('4123836', '3321', '2093', '0997', '9686', '8317');
INSERT INTO `fw_code` VALUES ('4123837', '3321', '2094', '5483', '6519', '5692');
INSERT INTO `fw_code` VALUES ('4123838', '3321', '2095', '8540', '8801', '2612');
INSERT INTO `fw_code` VALUES ('4123839', '3321', '2096', '4588', '5638', '7782');
INSERT INTO `fw_code` VALUES ('4123840', '3321', '2097', '9328', '0948', '2014');
INSERT INTO `fw_code` VALUES ('4123841', '3321', '2098', '4094', '2975', '5076');
INSERT INTO `fw_code` VALUES ('4123842', '3321', '2099', '4054', '1968', '5237');
INSERT INTO `fw_code` VALUES ('4123843', '3321', '2100', '6337', '6392', '3764');
INSERT INTO `fw_code` VALUES ('4123844', '3321', '2101', '2812', '8166', '2969');
INSERT INTO `fw_code` VALUES ('4123845', '3321', '2102', '8606', '6527', '1282');
INSERT INTO `fw_code` VALUES ('4123846', '3321', '2103', '4695', '4372', '6290');
INSERT INTO `fw_code` VALUES ('4123847', '3321', '2104', '9034', '1464', '5317');
INSERT INTO `fw_code` VALUES ('4123848', '3321', '2105', '9969', '3352', '3067');
INSERT INTO `fw_code` VALUES ('4123849', '3321', '2106', '4135', '3983', '4915');
INSERT INTO `fw_code` VALUES ('4123850', '3321', '2107', '6724', '0321', '7960');
INSERT INTO `fw_code` VALUES ('4123851', '3321', '2108', '8046', '6138', '9906');
INSERT INTO `fw_code` VALUES ('4123852', '3321', '2109', '1358', '6896', '3683');
INSERT INTO `fw_code` VALUES ('4123853', '3321', '2110', '3987', '4241', '6567');
INSERT INTO `fw_code` VALUES ('4123854', '3321', '2111', '1571', '4364', '0701');
INSERT INTO `fw_code` VALUES ('4123855', '3321', '2112', '8183', '6623', '2018');
INSERT INTO `fw_code` VALUES ('4123856', '3321', '2113', '3804', '8524', '3152');
INSERT INTO `fw_code` VALUES ('4123857', '3321', '2114', '2669', '3456', '9393');
INSERT INTO `fw_code` VALUES ('4123858', '3321', '2115', '7608', '1944', '9634');
INSERT INTO `fw_code` VALUES ('4123859', '3321', '2116', '5874', '5480', '4660');
INSERT INTO `fw_code` VALUES ('4123860', '3321', '2117', '3524', '3329', '7464');
INSERT INTO `fw_code` VALUES ('4123861', '3321', '2118', '6327', '7135', '7527');
INSERT INTO `fw_code` VALUES ('4123862', '3321', '2119', '0212', '2571', '3687');
INSERT INTO `fw_code` VALUES ('4123863', '3321', '2120', '3697', '9790', '4643');
INSERT INTO `fw_code` VALUES ('4123864', '3321', '2121', '5553', '9277', '9134');
INSERT INTO `fw_code` VALUES ('4123865', '3321', '2122', '8677', '9286', '4723');
INSERT INTO `fw_code` VALUES ('4123866', '3321', '2123', '4378', '3202', '5535');
INSERT INTO `fw_code` VALUES ('4123867', '3321', '2124', '0599', '6500', '7884');
INSERT INTO `fw_code` VALUES ('4123868', '3321', '2125', '0879', '1695', '3571');
INSERT INTO `fw_code` VALUES ('4123869', '3321', '2126', '3910', '7258', '1661');
INSERT INTO `fw_code` VALUES ('4123870', '3321', '2127', '5085', '3333', '5259');
INSERT INTO `fw_code` VALUES ('4123871', '3321', '2128', '5406', '9536', '0786');
INSERT INTO `fw_code` VALUES ('4123872', '3321', '2129', '6754', '2071', '1562');
INSERT INTO `fw_code` VALUES ('4123873', '3321', '2130', '3550', '0048', '6295');
INSERT INTO `fw_code` VALUES ('4123874', '3321', '2131', '6087', '2948', '1678');
INSERT INTO `fw_code` VALUES ('4123875', '3321', '2132', '9144', '5230', '8598');
INSERT INTO `fw_code` VALUES ('4123876', '3321', '2133', '5192', '2067', '3768');
INSERT INTO `fw_code` VALUES ('4123877', '3321', '2134', '4699', '9404', '1062');
INSERT INTO `fw_code` VALUES ('4123878', '3321', '2135', '1947', '9036', '8661');
INSERT INTO `fw_code` VALUES ('4123879', '3321', '2136', '4658', '8397', '1223');
INSERT INTO `fw_code` VALUES ('4123880', '3321', '2137', '6942', '2821', '9750');
INSERT INTO `fw_code` VALUES ('4123881', '3321', '2138', '3417', '4595', '8955');
INSERT INTO `fw_code` VALUES ('4123882', '3321', '2139', '9211', '2956', '7268');
INSERT INTO `fw_code` VALUES ('4123883', '3321', '2140', '7115', '9282', '6928');
INSERT INTO `fw_code` VALUES ('4123884', '3321', '2141', '5299', '0801', '2277');
INSERT INTO `fw_code` VALUES ('4123885', '3321', '2142', '9638', '7893', '1303');
INSERT INTO `fw_code` VALUES ('4123886', '3321', '2143', '4297', '1187', '5857');
INSERT INTO `fw_code` VALUES ('4123887', '3321', '2144', '9531', '9159', '2795');
INSERT INTO `fw_code` VALUES ('4123888', '3321', '2145', '1307', '6631', '7607');
INSERT INTO `fw_code` VALUES ('4123889', '3321', '2146', '4618', '7389', '1384');
INSERT INTO `fw_code` VALUES ('4123890', '3321', '2147', '4592', '0670', '2553');
INSERT INTO `fw_code` VALUES ('4123891', '3321', '2148', '8824', '9028', '3071');
INSERT INTO `fw_code` VALUES ('4123892', '3321', '2149', '3844', '9531', '2991');
INSERT INTO `fw_code` VALUES ('4123893', '3321', '2150', '5019', '5607', '6589');
INSERT INTO `fw_code` VALUES ('4123894', '3321', '2151', '8890', '6754', '1741');
INSERT INTO `fw_code` VALUES ('4123895', '3321', '2152', '4445', '0928', '4205');
INSERT INTO `fw_code` VALUES ('4123896', '3321', '2153', '5365', '8528', '0946');
INSERT INTO `fw_code` VALUES ('4123897', '3321', '2154', '4404', '9921', '4366');
INSERT INTO `fw_code` VALUES ('4123898', '3321', '2155', '6784', '3822', '5165');
INSERT INTO `fw_code` VALUES ('4123899', '3321', '2156', '6931', '3564', '3513');
INSERT INTO `fw_code` VALUES ('4123900', '3321', '2157', '4301', '6219', '0629');
INSERT INTO `fw_code` VALUES ('4123901', '3321', '2158', '6824', '4830', '5004');
INSERT INTO `fw_code` VALUES ('4123902', '3321', '2159', '7638', '3695', '3236');
INSERT INTO `fw_code` VALUES ('4123903', '3321', '2160', '1204', '2929', '3870');
INSERT INTO `fw_code` VALUES ('4123904', '3321', '2161', '0415', '0782', '4468');
INSERT INTO `fw_code` VALUES ('4123905', '3321', '2162', '1484', '8124', '9558');
INSERT INTO `fw_code` VALUES ('4123906', '3321', '2163', '6758', '7104', '6334');
INSERT INTO `fw_code` VALUES ('4123907', '3321', '2164', '4515', '3687', '7647');
INSERT INTO `fw_code` VALUES ('4123908', '3321', '2165', '0390', '4064', '5638');
INSERT INTO `fw_code` VALUES ('4123909', '3321', '2166', '8493', '3568', '1308');
INSERT INTO `fw_code` VALUES ('4123910', '3321', '2167', '7358', '8501', '7549');
INSERT INTO `fw_code` VALUES ('4123911', '3321', '2168', '9347', '3441', '9379');
INSERT INTO `fw_code` VALUES ('4123912', '3321', '2169', '9749', '1659', '4584');
INSERT INTO `fw_code` VALUES ('4123913', '3321', '2170', '5797', '8496', '9754');
INSERT INTO `fw_code` VALUES ('4123914', '3321', '2171', '3126', '0143', '7031');
INSERT INTO `fw_code` VALUES ('4123915', '3321', '2172', '3193', '7870', '5700');
INSERT INTO `fw_code` VALUES ('4123916', '3321', '2173', '7959', '9897', '8763');
INSERT INTO `fw_code` VALUES ('4123917', '3321', '2174', '2552', '5465', '4647');
INSERT INTO `fw_code` VALUES ('4123918', '3321', '2175', '0202', '3314', '7450');
INSERT INTO `fw_code` VALUES ('4123919', '3321', '2176', '6677', '5088', '6656');
INSERT INTO `fw_code` VALUES ('4123920', '3321', '2177', '9815', '9385', '3254');
INSERT INTO `fw_code` VALUES ('4123921', '3321', '2178', '0242', '4322', '7290');
INSERT INTO `fw_code` VALUES ('4123922', '3321', '2179', '1056', '3187', '5522');
INSERT INTO `fw_code` VALUES ('4123923', '3321', '2180', '0950', '4453', '7013');
INSERT INTO `fw_code` VALUES ('4123924', '3321', '2181', '3834', '0274', '6754');
INSERT INTO `fw_code` VALUES ('4123925', '3321', '2182', '7999', '0905', '8602');
INSERT INTO `fw_code` VALUES ('4123926', '3321', '2183', '4902', '7616', '1843');
INSERT INTO `fw_code` VALUES ('4123927', '3321', '2184', '6504', '8628', '9477');
INSERT INTO `fw_code` VALUES ('4123928', '3321', '2185', '0135', '5588', '8781');
INSERT INTO `fw_code` VALUES ('4123929', '3321', '2186', '1911', '3060', '3593');
INSERT INTO `fw_code` VALUES ('4123930', '3321', '2187', '5222', '3818', '7370');
INSERT INTO `fw_code` VALUES ('4123931', '3321', '2188', '7852', '1163', '0254');
INSERT INTO `fw_code` VALUES ('4123932', '3321', '2189', '9428', '5457', '9057');
INSERT INTO `fw_code` VALUES ('4123933', '3321', '2190', '7104', '0024', '0692');
INSERT INTO `fw_code` VALUES ('4123934', '3321', '2191', '2765', '2933', '1665');
INSERT INTO `fw_code` VALUES ('4123935', '3321', '2192', '9495', '3183', '7727');
INSERT INTO `fw_code` VALUES ('4123936', '3321', '2193', '5049', '7358', '0191');
INSERT INTO `fw_code` VALUES ('4123937', '3321', '2194', '5970', '4957', '6933');
INSERT INTO `fw_code` VALUES ('4123938', '3321', '2195', '5008', '6350', '0352');
INSERT INTO `fw_code` VALUES ('4123939', '3321', '2196', '3767', '2548', '8084');
INSERT INTO `fw_code` VALUES ('4123940', '3321', '2197', '3233', '8877', '5540');
INSERT INTO `fw_code` VALUES ('4123941', '3321', '2198', '5649', '8754', '1406');
INSERT INTO `fw_code` VALUES ('4123942', '3321', '2199', '4474', '2679', '7808');
INSERT INTO `fw_code` VALUES ('4123943', '3321', '2200', '1808', '9358', '9856');
INSERT INTO `fw_code` VALUES ('4123944', '3321', '2201', '2088', '4553', '5544');
INSERT INTO `fw_code` VALUES ('4123945', '3321', '2202', '0018', '7597', '4035');
INSERT INTO `fw_code` VALUES ('4123946', '3321', '2203', '5119', '0116', '3633');
INSERT INTO `fw_code` VALUES ('4123947', '3321', '2204', '9097', '9997', '7294');
INSERT INTO `fw_code` VALUES ('4123948', '3321', '2205', '8736', '2787', '1928');
INSERT INTO `fw_code` VALUES ('4123949', '3321', '2206', '5038', '8100', '3955');
INSERT INTO `fw_code` VALUES ('4123950', '3321', '2207', '7963', '4930', '3535');
INSERT INTO `fw_code` VALUES ('4123951', '3321', '2208', '5466', '3037', '7990');
INSERT INTO `fw_code` VALUES ('4123952', '3321', '2209', '4758', '2906', '8267');
INSERT INTO `fw_code` VALUES ('4123953', '3321', '2210', '9952', '9870', '5365');
INSERT INTO `fw_code` VALUES ('4123954', '3321', '2211', '3009', '2152', '2285');
INSERT INTO `fw_code` VALUES ('4123955', '3321', '2212', '9057', '8989', '7455');
INSERT INTO `fw_code` VALUES ('4123956', '3321', '2213', '3731', '6572', '3017');
INSERT INTO `fw_code` VALUES ('4123957', '3321', '2214', '3797', '4299', '1687');
INSERT INTO `fw_code` VALUES ('4123958', '3321', '2215', '8563', '6327', '4749');
INSERT INTO `fw_code` VALUES ('4123959', '3321', '2216', '3156', '1894', '0633');
INSERT INTO `fw_code` VALUES ('4123960', '3321', '2217', '7281', '1517', '2642');
INSERT INTO `fw_code` VALUES ('4123961', '3321', '2218', '0419', '5814', '9240');
INSERT INTO `fw_code` VALUES ('4123962', '3321', '2219', '1167', '6953', '8803');
INSERT INTO `fw_code` VALUES ('4123963', '3321', '2220', '9164', '7724', '5964');
INSERT INTO `fw_code` VALUES ('4123964', '3321', '2221', '0847', '0751', '3276');
INSERT INTO `fw_code` VALUES ('4123965', '3321', '2222', '9631', '3668', '9838');
INSERT INTO `fw_code` VALUES ('4123966', '3321', '2223', '1661', '9616', '1508');
INSERT INTO `fw_code` VALUES ('4123967', '3321', '2224', '1554', '0882', '2999');
INSERT INTO `fw_code` VALUES ('4123968', '3321', '2225', '4438', '6703', '2740');
INSERT INTO `fw_code` VALUES ('4123969', '3321', '2226', '5506', '4045', '7829');
INSERT INTO `fw_code` VALUES ('4123970', '3321', '2227', '7108', '5057', '5463');
INSERT INTO `fw_code` VALUES ('4123971', '3321', '2228', '1193', '3672', '7633');
INSERT INTO `fw_code` VALUES ('4123972', '3321', '2229', '0740', '2017', '4767');
INSERT INTO `fw_code` VALUES ('4123973', '3321', '2230', '2515', '9489', '9579');
INSERT INTO `fw_code` VALUES ('4123974', '3321', '2231', '5826', '0247', '3356');
INSERT INTO `fw_code` VALUES ('4123975', '3321', '2232', '8456', '7592', '6240');
INSERT INTO `fw_code` VALUES ('4123976', '3321', '2233', '6040', '7715', '0374');
INSERT INTO `fw_code` VALUES ('4123977', '3321', '2234', '7709', '6454', '6678');
INSERT INTO `fw_code` VALUES ('4123978', '3321', '2235', '8884', '2529', '0276');
INSERT INTO `fw_code` VALUES ('4123979', '3321', '2236', '4504', '4430', '1410');
INSERT INTO `fw_code` VALUES ('4123980', '3321', '2237', '3370', '9362', '7651');
INSERT INTO `fw_code` VALUES ('4123981', '3321', '2238', '0099', '9612', '3713');
INSERT INTO `fw_code` VALUES ('4123982', '3321', '2239', '2475', '8481', '9740');
INSERT INTO `fw_code` VALUES ('4123983', '3321', '2240', '5653', '3787', '6177');
INSERT INTO `fw_code` VALUES ('4123984', '3321', '2241', '4224', '9235', '5722');
INSERT INTO `fw_code` VALUES ('4123985', '3321', '2242', '3837', '5307', '1526');
INSERT INTO `fw_code` VALUES ('4123986', '3321', '2243', '4397', '5696', '2901');
INSERT INTO `fw_code` VALUES ('4123987', '3321', '2244', '2025', '0525', '3399');
INSERT INTO `fw_code` VALUES ('4123988', '3321', '2245', '0036', '5584', '1569');
INSERT INTO `fw_code` VALUES ('4123989', '3321', '2246', '0850', '4450', '9801');
INSERT INTO `fw_code` VALUES ('4123990', '3321', '2247', '3628', '1537', '1033');
INSERT INTO `fw_code` VALUES ('4123991', '3321', '2248', '4121', '4200', '3739');
INSERT INTO `fw_code` VALUES ('4123992', '3321', '2249', '0383', '8505', '5926');
INSERT INTO `fw_code` VALUES ('4123993', '3321', '2250', '6257', '8882', '3917');
INSERT INTO `fw_code` VALUES ('4123994', '3321', '2251', '7646', '2426', '4533');
INSERT INTO `fw_code` VALUES ('4123995', '3321', '2252', '1878', '0783', '5051');
INSERT INTO `fw_code` VALUES ('4123996', '3321', '2253', '8073', '7362', '8569');
INSERT INTO `fw_code` VALUES ('4123997', '3321', '2254', '8994', '4962', '5310');
INSERT INTO `fw_code` VALUES ('4123998', '3321', '2255', '1171', '0652', '5328');
INSERT INTO `fw_code` VALUES ('4123999', '3321', '2256', '1130', '9644', '5489');
INSERT INTO `fw_code` VALUES ('4124000', '3321', '2257', '5683', '4204', '1533');
INSERT INTO `fw_code` VALUES ('4124001', '3321', '2258', '6431', '5343', '1096');
INSERT INTO `fw_code` VALUES ('4124002', '3321', '2259', '1771', '2049', '6542');
INSERT INTO `fw_code` VALUES ('4124003', '3321', '2260', '6110', '9140', '5569');
INSERT INTO `fw_code` VALUES ('4124004', '3321', '2261', '4162', '5207', '3578');
INSERT INTO `fw_code` VALUES ('4124005', '3321', '2262', '7046', '1029', '3319');
INSERT INTO `fw_code` VALUES ('4124006', '3321', '2263', '8114', '8370', '8408');
INSERT INTO `fw_code` VALUES ('4124007', '3321', '2264', '6003', '0406', '7060');
INSERT INTO `fw_code` VALUES ('4124008', '3321', '2265', '8434', '4572', '3935');
INSERT INTO `fw_code` VALUES ('4124009', '3321', '2266', '1064', '1918', '6819');
INSERT INTO `fw_code` VALUES ('4124010', '3321', '2267', '5296', '0275', '7337');
INSERT INTO `fw_code` VALUES ('4124011', '3321', '2268', '0316', '0779', '7256');
INSERT INTO `fw_code` VALUES ('4124012', '3321', '2269', '1491', '6854', '0854');
INSERT INTO `fw_code` VALUES ('4124013', '3321', '2270', '7112', '8755', '1988');
INSERT INTO `fw_code` VALUES ('4124014', '3321', '2271', '5362', '8001', '6006');
INSERT INTO `fw_code` VALUES ('4124015', '3321', '2272', '9823', '8116', '4551');
INSERT INTO `fw_code` VALUES ('4124016', '3321', '2273', '0917', '2176', '8471');
INSERT INTO `fw_code` VALUES ('4124017', '3321', '2274', '1989', '4549', '8332');
INSERT INTO `fw_code` VALUES ('4124018', '3321', '2275', '0600', '1006', '7716');
INSERT INTO `fw_code` VALUES ('4124019', '3321', '2276', '2869', '1141', '5234');
INSERT INTO `fw_code` VALUES ('4124020', '3321', '2277', '2630', '6954', '9385');
INSERT INTO `fw_code` VALUES ('4124021', '3321', '2278', '3296', '6077', '9269');
INSERT INTO `fw_code` VALUES ('4124022', '3321', '2279', '5753', '6962', '4975');
INSERT INTO `fw_code` VALUES ('4124023', '3321', '2280', '1455', '0879', '5787');
INSERT INTO `fw_code` VALUES ('4124024', '3321', '2281', '7676', '4176', '8135');
INSERT INTO `fw_code` VALUES ('4124025', '3321', '2282', '4232', '7966', '7019');
INSERT INTO `fw_code` VALUES ('4124026', '3321', '2283', '4726', '0629', '9725');
INSERT INTO `fw_code` VALUES ('4124027', '3321', '2284', '7956', '9371', '3823');
INSERT INTO `fw_code` VALUES ('4124028', '3321', '2285', '6862', '5311', '9903');
INSERT INTO `fw_code` VALUES ('4124029', '3321', '2286', '8250', '8855', '0519');
INSERT INTO `fw_code` VALUES ('4124030', '3321', '2287', '2162', '1010', '5510');
INSERT INTO `fw_code` VALUES ('4124031', '3321', '2288', '2482', '7212', '1037');
INSERT INTO `fw_code` VALUES ('4124032', '3321', '2289', '3831', '9748', '1814');
INSERT INTO `fw_code` VALUES ('4124033', '3321', '2290', '9665', '9117', '9966');
INSERT INTO `fw_code` VALUES ('4124034', '3321', '2291', '1775', '7081', '1314');
INSERT INTO `fw_code` VALUES ('4124035', '3321', '2292', '9024', '6712', '8912');
INSERT INTO `fw_code` VALUES ('4124036', '3321', '2293', '1735', '6073', '1475');
INSERT INTO `fw_code` VALUES ('4124037', '3321', '2294', '0493', '2272', '9207');
INSERT INTO `fw_code` VALUES ('4124038', '3321', '2295', '6287', '0633', '7519');
INSERT INTO `fw_code` VALUES ('4124039', '3321', '2296', '7035', '1772', '7082');
INSERT INTO `fw_code` VALUES ('4124040', '3321', '2297', '6715', '5569', '1555');
INSERT INTO `fw_code` VALUES ('4124041', '3321', '2298', '0306', '1522', '1019');
INSERT INTO `fw_code` VALUES ('4124042', '3321', '2299', '2976', '9875', '3743');
INSERT INTO `fw_code` VALUES ('4124043', '3321', '2300', '4405', '4426', '4198');
INSERT INTO `fw_code` VALUES ('4124044', '3321', '2301', '6608', '6835', '3046');
INSERT INTO `fw_code` VALUES ('4124045', '3321', '2302', '8383', '4308', '7859');
INSERT INTO `fw_code` VALUES ('4124046', '3321', '2303', '1694', '5065', '1636');
INSERT INTO `fw_code` VALUES ('4124047', '3321', '2304', '1908', '2534', '8653');
INSERT INTO `fw_code` VALUES ('4124048', '3321', '2305', '5900', '6704', '3323');
INSERT INTO `fw_code` VALUES ('4124049', '3321', '2306', '2096', '3283', '6841');
INSERT INTO `fw_code` VALUES ('4124050', '3321', '2307', '7716', '5184', '7975');
INSERT INTO `fw_code` VALUES ('4124051', '3321', '2308', '9344', '2915', '4439');
INSERT INTO `fw_code` VALUES ('4124052', '3321', '2309', '3083', '8609', '2252');
INSERT INTO `fw_code` VALUES ('4124053', '3321', '2310', '1521', '8605', '4457');
INSERT INTO `fw_code` VALUES ('4124054', '3321', '2311', '2442', '6204', '1198');
INSERT INTO `fw_code` VALUES ('4124055', '3321', '2312', '0092', '4054', '4002');
INSERT INTO `fw_code` VALUES ('4124056', '3321', '2313', '0239', '3795', '2350');
INSERT INTO `fw_code` VALUES ('4124057', '3321', '2314', '2122', '0002', '5671');
INSERT INTO `fw_code` VALUES ('4124058', '3321', '2315', '0133', '5061', '3841');
INSERT INTO `fw_code` VALUES ('4124059', '3321', '2316', '4715', '1372', '3488');

-- ----------------------------
-- Table structure for fw_cust
-- ----------------------------
DROP TABLE IF EXISTS `fw_cust`;
CREATE TABLE `fw_cust` (
  `fid` int(11) NOT NULL AUTO_INCREMENT,
  `unitcode` varchar(4) DEFAULT NULL,
  `unitname` varchar(64) DEFAULT NULL,
  `addr` varchar(64) DEFAULT NULL,
  `master` varchar(80) DEFAULT NULL,
  `phone` varchar(64) DEFAULT NULL,
  `post` varchar(20) DEFAULT NULL,
  `fax` varchar(64) DEFAULT NULL,
  `property` varchar(100) DEFAULT NULL,
  `remark` int(254) DEFAULT NULL,
  `codelen` int(11) DEFAULT NULL,
  `mlength` int(11) DEFAULT NULL,
  `maxvalue` varchar(64) DEFAULT NULL,
  `regdate` datetime DEFAULT NULL,
  `operator` varchar(64) DEFAULT NULL,
  `overk` int(11) DEFAULT NULL,
  `voicewelcome` varchar(254) DEFAULT NULL,
  `smsnote` varchar(500) DEFAULT NULL,
  `bcode` varchar(1) DEFAULT NULL,
  `upyn` varchar(1) DEFAULT NULL,
  `voicere` varchar(150) DEFAULT NULL,
  `renote` varchar(500) DEFAULT NULL,
  `vlen` int(11) DEFAULT NULL,
  `jfyn` varchar(1) DEFAULT NULL,
  `zjyn` varchar(1) DEFAULT NULL,
  `aajf` decimal(18,2) DEFAULT NULL,
  `password` varchar(64) DEFAULT NULL,
  `p_no` varchar(20) DEFAULT NULL,
  `unitinfo` varchar(500) DEFAULT NULL,
  `prodinfo` varchar(500) DEFAULT NULL,
  `zp` longblob,
  `ccodeyn` varchar(1) DEFAULT NULL,
  `ctype` varchar(20) DEFAULT NULL,
  `sntype` varchar(32) DEFAULT NULL,
  `snLen` int(11) DEFAULT NULL,
  `msnlength` int(11) DEFAULT NULL,
  `dckyn` varchar(1) DEFAULT NULL,
  `snpr` varchar(10) DEFAULT NULL,
  `chrtype` varchar(32) DEFAULT NULL,
  `ncxtype` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`fid`)
) ENGINE=InnoDB AUTO_INCREMENT=1875 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of fw_cust
-- ----------------------------
INSERT INTO `fw_cust` VALUES ('1874', '3321', '柏缦商贸(允美)', '', '', '', '', '', '', '0', '12', '2316', '800000万', '2018-07-03 00:00:00', '', '0', '', '', 'N', 'N', '', '', '0', 'N', 'N', '0.00', '', '', '', '', null, 'N', '', '4-双码流水号2', null, '0', 'N', '', '', '');

-- ----------------------------
-- Table structure for fw_dealer
-- ----------------------------
DROP TABLE IF EXISTS `fw_dealer`;
CREATE TABLE `fw_dealer` (
  `dl_id` int(11) NOT NULL AUTO_INCREMENT,
  `dl_unitcode` varchar(32) DEFAULT NULL,
  `dl_openid` varchar(64) DEFAULT NULL COMMENT '微信openid',
  `dl_username` varchar(64) DEFAULT NULL,
  `dl_pwd` varchar(64) DEFAULT NULL,
  `dl_number` varchar(32) DEFAULT NULL,
  `dl_name` varchar(128) DEFAULT NULL,
  `dl_des` text,
  `dl_area` varchar(128) DEFAULT NULL,
  `dl_type` int(11) DEFAULT '0' COMMENT '代理级别分类1',
  `dl_sttype` int(11) DEFAULT '0' COMMENT '代理级别分类2',
  `dl_belong` int(11) DEFAULT '0' COMMENT '该经销商所属 上家',
  `dl_referee` int(11) DEFAULT '0' COMMENT '推荐人',
  `dl_level` int(4) DEFAULT '0' COMMENT '经销商级数',
  `dl_contact` varchar(32) DEFAULT NULL,
  `dl_tel` varchar(32) DEFAULT NULL,
  `dl_fax` varchar(32) DEFAULT NULL,
  `dl_email` varchar(64) DEFAULT NULL,
  `dl_weixin` varchar(32) DEFAULT NULL,
  `dl_wxnickname` varchar(64) DEFAULT NULL,
  `dl_wxsex` int(4) DEFAULT '0',
  `dl_wxprovince` varchar(32) DEFAULT NULL,
  `dl_wxcity` varchar(32) DEFAULT NULL,
  `dl_wxcountry` varchar(32) DEFAULT NULL,
  `dl_wxheadimg` varchar(512) DEFAULT NULL,
  `dl_qq` varchar(32) DEFAULT NULL,
  `dl_country` int(11) DEFAULT '0' COMMENT '国家',
  `dl_sheng` int(11) DEFAULT '0',
  `dl_shi` int(11) DEFAULT '0',
  `dl_qu` int(11) DEFAULT '0',
  `dl_qustr` varchar(64) DEFAULT NULL,
  `dl_address` varchar(64) DEFAULT NULL,
  `dl_idcard` varchar(64) DEFAULT NULL,
  `dl_idcardpic` varchar(64) DEFAULT NULL COMMENT '身份证图片',
  `dl_idcardpic2` varchar(64) DEFAULT NULL,
  `dl_tbdian` varchar(128) DEFAULT NULL COMMENT '淘宝店店铺名',
  `dl_tbzhanggui` varchar(128) DEFAULT NULL COMMENT '淘宝店掌柜名',
  `dl_tbsqpic` varchar(64) DEFAULT NULL COMMENT '淘宝授权书',
  `dl_tblevel` int(11) DEFAULT NULL COMMENT '淘宝授权级别',
  `dl_remark` varchar(512) DEFAULT NULL,
  `dl_status` int(4) DEFAULT NULL,
  `dl_startdate` int(11) DEFAULT NULL,
  `dl_enddate` int(11) DEFAULT NULL,
  `dl_addtime` int(11) DEFAULT NULL,
  `dl_pic` varchar(64) DEFAULT NULL,
  `dl_brand` varchar(128) DEFAULT NULL COMMENT '授权品牌',
  `dl_brandlevel` varchar(64) DEFAULT NULL COMMENT '授权品牌级别',
  `dl_oddtime` int(11) DEFAULT '0' COMMENT '出货单号计数日期',
  `dl_oddcount` int(11) DEFAULT '0' COMMENT '出货单号计数',
  `dl_logintime` int(11) DEFAULT '0',
  `dl_fanli` decimal(10,2) DEFAULT '0.00' COMMENT '代理返利金额',
  `dl_jifen` int(11) DEFAULT '0' COMMENT '代理积分',
  `dl_lastflid` int(11) DEFAULT '0' COMMENT '记录最近计算结束的返利明细id',
  `dl_flmodel` int(11) DEFAULT '0' COMMENT '[明臣使用]推荐人选择的返利模式，1-一次性  ',
  `dl_deposit` decimal(10,2) DEFAULT '0.00' COMMENT '保证金',
  `dl_depositpic` varchar(32) DEFAULT NULL COMMENT '保证金支付图',
  `dl_paypic` varchar(32) DEFAULT NULL COMMENT '支付凭证图',
  PRIMARY KEY (`dl_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of fw_dealer
-- ----------------------------
INSERT INTO `fw_dealer` VALUES ('1', '3321', null, 'test', '66730c784751efc66db25382bd59bbbb', 'N0001', '钟琪', null, null, '9', '0', '0', '0', '1', null, null, null, null, '15875872790', null, '0', null, null, null, null, null, '0', '0', '0', '0', null, null, null, null, null, null, null, null, null, null, '1', null, null, null, '3321/1542267509_1_1919.jpg', null, null, '0', '0', '1542596733', '0.00', '0', '0', '0', '0.00', null, null);
INSERT INTO `fw_dealer` VALUES ('2', '3321', '', '15875872791', '587ccacd43c51cad35df059b107a9577', 'No:007700', '钟琪1', null, null, '10', '0', '1', '1', '2', '钟琪1', '15875872791', null, null, '15875872791', '', '0', '', '', '', '', null, '0', '11', '1111', '0', '北京市房山区', '北京市房山区', '440804199606160571', '', '', '', '', null, null, '', '1', '1542180469', '1573716469', '1542180462', null, '', '', '0', '0', '1542593651', '0.00', '0', '0', '0', '0.00', null, null);
INSERT INTO `fw_dealer` VALUES ('3', '3321', '', '15875872792', '1bde2478115e4e64b4f71e030dc33710', 'No:007701', '钟琪2', null, null, '9', '0', '0', '1', '1', '钟琪2', '15875872792', null, null, '15875872792', '', '0', '', '', '', '', null, '0', '11', '1129', '0', '北京市延庆县', '北京市延庆县', '440804199606160572', '', '', '', '', null, null, '', '1', '1542590318', '1574126318', '1542590308', '3321/1542590435_3_8558.jpg', '', '', '0', '0', '1542590431', '0.00', '0', '0', '0', '0.00', null, null);
INSERT INTO `fw_dealer` VALUES ('4', '3321', '', '15875872793', 'ad2a523b032e8cb63f6a217150d94385', 'No:007702', '钟琪3', null, null, '9', '0', '0', '3', '1', '钟琪3', '15875872793', null, null, '15875872793', '', '0', '', '', '', '', null, '0', '44', '4451', '445101', '广东省潮州市枫溪区', '广东省潮州市枫溪区', '440804199606160573', '', '', '', '', null, null, '', '1', '1542591186', '1574127186', '1542591176', null, '', '', '0', '0', '1542591215', '0.00', '0', '0', '0', '0.00', null, null);
INSERT INTO `fw_dealer` VALUES ('6', '3321', '', '15875872794', '8fa2bfbeed9dc739761683298301a3b4', 'No:007703', '钟琪4', null, null, '10', '0', '1', '2', '2', '钟琪4', '15875872794', null, null, '15875872794', '', '0', '', '', '', '', null, '0', '12', '1225', '0', '天津市蓟县', '天津市蓟县', '440804199606160574', '', '', '', '', null, null, '', '1', '1542592061', '1574128061', '1542592007', null, '', '', '0', '0', '1542592123', '0.00', '0', '0', '0', '0.00', null, null);
INSERT INTO `fw_dealer` VALUES ('7', '3321', '', '15875872795', '6299c582af7ba53fda8c1b769c6cb129', 'No:007704', '钟琪5', null, null, '10', '0', '1', '6', '2', '钟琪5', '15875872795', null, null, '15875872795', '', '0', '', '', '', '', null, '0', '11', '1129', '0', '北京市延庆县', '广东广州越秀区', '440804199606160575', '', '', '', '', null, null, '', '1', '1542596588', '1574132588', '1542596575', null, '', '', '0', '0', '1542596660', '0.00', '0', '0', '0', '0.00', null, null);
INSERT INTO `fw_dealer` VALUES ('8', '3321', '', '15875872796', '531440891208d2c680f05d04aa42a247', 'No:007705', '钟琪6', null, null, '9', '0', '0', '7', '1', '钟琪6', '15875872796', null, null, '15875872796', '', '0', '', '', '', '', null, '0', '12', '1225', '0', '天津市蓟县', '天津市蓟县', '440804199606160576', '', '', '', '', null, null, '', '1', '1542597171', '1574133171', '1542597162', null, '', '', '0', '0', '1542597226', '0.00', '0', '0', '0', '0.00', null, null);
INSERT INTO `fw_dealer` VALUES ('9', '3321', '', '15875872797', 'a9048d4e8ad193f03ad47e57772a7fcc', 'No:007706', '钟琪7', null, null, '11', '0', '8', '8', '3', '钟琪7', '15875872797', null, null, '15875872797', '', '0', '', '', '', '', null, '0', '11', '1129', '0', '北京市延庆县', '北京市延庆县', '440804199606160597', '', '', '', '', null, null, '', '1', '1542598636', '1574134636', '1542598630', null, '', '', '0', '0', '0', '0.00', '0', '0', '0', '0.00', null, null);
INSERT INTO `fw_dealer` VALUES ('10', '3321', '', '15875872798', 'd39becd200e9e636bd140220b176868f', 'No:007707', '钟琪8', null, null, '10', '0', '8', '9', '2', '钟琪8', '15875872798', null, null, '15875872798', '', '0', '', '', '', '', null, '0', '12', '1225', '0', '天津市蓟县', '天津市蓟县', '440804199606160578', '', '', '', '', null, null, '', '1', '1542598964', '1574134964', '1542598949', null, '', '', '0', '0', '1542598995', '0.00', '0', '0', '0', '0.00', null, null);
INSERT INTO `fw_dealer` VALUES ('11', '3321', '', '15875872799', '2523aa43222f38f037ea7a2ace4c3d75', 'No:007708', '钟琪9', null, null, '10', '0', '8', '9', '2', '钟琪9', '15875872799', null, null, '15875872799', '', '0', '', '', '', '', null, '0', '11', '1129', '0', '北京市延庆县', '北京市延庆县', '440804199606160579', '', '', '', '', null, null, '', '1', '1542599701', '1574135701', '1542599693', null, '', '', '0', '0', '1542599743', '0.00', '0', '0', '0', '0.00', null, null);

-- ----------------------------
-- Table structure for fw_dealerlogs
-- ----------------------------
DROP TABLE IF EXISTS `fw_dealerlogs`;
CREATE TABLE `fw_dealerlogs` (
  `dlg_id` int(11) NOT NULL AUTO_INCREMENT,
  `dlg_unitcode` int(32) DEFAULT NULL COMMENT '企业码',
  `dlg_dlid` int(11) DEFAULT '0' COMMENT '对应代理id',
  `dlg_type` int(11) DEFAULT '0' COMMENT '0-公司操作 1-代理操作',
  `dlg_operatid` int(11) DEFAULT '0' COMMENT '操作者id',
  `dlg_dlusername` varchar(32) DEFAULT NULL COMMENT '操作者用户名',
  `dlg_dlname` varchar(32) DEFAULT NULL COMMENT '操作者名',
  `dlg_action` varchar(64) DEFAULT NULL COMMENT '动作',
  `dlg_addtime` int(11) DEFAULT NULL COMMENT '操作时间',
  `dlg_link` varchar(256) DEFAULT NULL COMMENT '操作链接',
  `dlg_ip` varchar(32) DEFAULT NULL COMMENT '操作ip',
  PRIMARY KEY (`dlg_id`),
  KEY `dlg_unitcode` (`dlg_unitcode`),
  KEY `dlg_dlid` (`dlg_dlid`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='代理商操作日志表';

-- ----------------------------
-- Records of fw_dealerlogs
-- ----------------------------
INSERT INTO `fw_dealerlogs` VALUES ('134', '3321', '66', '1', '66', '654081', '石瑶瑶', '代理商注册 公司邀请', '1531822589', '/baiman/dealer/qyjxapply', '117.136.68.56');
INSERT INTO `fw_dealerlogs` VALUES ('135', '3321', '66', '0', '1191', 'yunmei', 'yunmei', '修改经销商级别-1', '1531822665', '/mp/dealer/update_dltype', '180.123.221.45');
INSERT INTO `fw_dealerlogs` VALUES ('136', '3321', '66', '0', '1191', 'yunmei', 'yunmei', '审核/禁用经销商-1', '1531822671', '/mp/dealer/active', '180.123.221.45');
INSERT INTO `fw_dealerlogs` VALUES ('137', '3321', '67', '1', '67', '13636393523', '马小倩', '代理商注册 公司邀请', '1531822773', '/baiman/dealer/qyjxapply', '121.233.7.152');
INSERT INTO `fw_dealerlogs` VALUES ('138', '3321', '67', '0', '1191', 'yunmei', 'yunmei', '审核/禁用经销商-1', '1531822782', '/mp/dealer/active', '180.123.221.45');
INSERT INTO `fw_dealerlogs` VALUES ('139', '3321', '68', '1', '68', '15365433666', '英少柏', '代理商注册 公司邀请', '1531823059', '/baiman/dealer/qyjxapply', '49.92.154.107');
INSERT INTO `fw_dealerlogs` VALUES ('140', '3321', '68', '0', '1191', 'yunmei', 'yunmei', '审核/禁用经销商-1', '1531823099', '/mp/dealer/active', '180.123.221.45');
INSERT INTO `fw_dealerlogs` VALUES ('141', '3321', '69', '1', '69', '15365423666', '英少柏', '代理商注册 公司邀请', '1531828782', '/baiman/dealer/qyjxapply', '49.92.154.107');
INSERT INTO `fw_dealerlogs` VALUES ('142', '3321', '69', '0', '1191', 'yunmei', 'yunmei', '审核/禁用经销商-1', '1531828829', '/mp/dealer/active', '121.233.44.162');
INSERT INTO `fw_dealerlogs` VALUES ('143', '3321', '70', '1', '70', '15862222202', '杨尚', '代理商注册 公司邀请', '1531828899', '/baiman/dealer/qyjxapply', '122.96.40.69');
INSERT INTO `fw_dealerlogs` VALUES ('144', '3321', '70', '0', '1191', 'yunmei', 'yunmei', '审核/禁用经销商-1', '1531828936', '/mp/dealer/active', '121.233.44.162');
INSERT INTO `fw_dealerlogs` VALUES ('145', '3321', '71', '1', '71', '15298791234', '胡东', '代理商注册 公司邀请', '1531881616', '/baiman/dealer/qyjxapply', '114.234.210.212');
INSERT INTO `fw_dealerlogs` VALUES ('146', '3321', '71', '0', '1191', 'yunmei', 'yunmei', '审核/禁用经销商-1', '1531882031', '/mp/dealer/active', '58.218.14.40');
INSERT INTO `fw_dealerlogs` VALUES ('147', '3321', '72', '1', '72', 'maoyu517', '陈宇', '代理商注册 推荐人：15298791234 上家：15298791234', '1532520157', '/baiman/dealer/apply', '117.136.68.48');
INSERT INTO `fw_dealerlogs` VALUES ('148', '3321', '72', '0', '1191', 'yunmei', 'yunmei', '审核/禁用经销商-1', '1532520531', '/mp/dealer/active', '180.123.221.203');
INSERT INTO `fw_dealerlogs` VALUES ('149', '3321', '72', '0', '1191', 'yunmei', 'yunmei', '审核/禁用经销商-0', '1532520688', '/mp/dealer/active', '180.123.221.203');
INSERT INTO `fw_dealerlogs` VALUES ('150', '3321', '72', '0', '1191', 'yunmei', 'yunmei', '审核/禁用经销商-1', '1532590346', '/mp/dealer/active', '180.124.222.82');
INSERT INTO `fw_dealerlogs` VALUES ('151', '3321', '73', '1', '73', 'tzwl588', '王莉', '代理商注册 推荐人：654081 上家：654081', '1533524369', '/baiman/dealer/apply', '122.194.88.150');
INSERT INTO `fw_dealerlogs` VALUES ('152', '3321', '73', '0', '1191', 'yunmei', 'yunmei', '审核/禁用经销商-1', '1533524401', '/mp/dealer/active', '180.123.223.131');
INSERT INTO `fw_dealerlogs` VALUES ('153', '3321', '74', '1', '74', '13395253609', '戴言', '代理商注册 推荐人：654081 上家：654081', '1533524651', '/baiman/dealer/apply', '49.81.118.121');
INSERT INTO `fw_dealerlogs` VALUES ('154', '3321', '74', '0', '1191', 'yunmei', 'yunmei', '审核/禁用经销商-1', '1533524739', '/mp/dealer/active', '180.123.223.131');
INSERT INTO `fw_dealerlogs` VALUES ('155', '3321', '75', '1', '75', '17712154959', '靖英', '代理商注册 推荐人：tzwl588 上家：tzwl588', '1533534673', '/baiman/dealer/apply', '114.235.97.59');
INSERT INTO `fw_dealerlogs` VALUES ('156', '3321', '75', '0', '1191', 'yunmei', 'yunmei', '审核/禁用经销商-1', '1533887037', '/mp/dealer/active', '180.123.221.157');
INSERT INTO `fw_dealerlogs` VALUES ('157', '3321', '76', '1', '76', 'maoyu517', '陈宇', '代理商注册 公司邀请', '1534148824', '/baiman/dealer/qyjxapply', '114.235.188.50');
INSERT INTO `fw_dealerlogs` VALUES ('158', '3321', '76', '0', '1191', 'yunmei', 'yunmei', '审核/禁用经销商-1', '1534148904', '/mp/dealer/active', '180.123.221.52');
INSERT INTO `fw_dealerlogs` VALUES ('159', '3321', '77', '1', '77', 'T13736877828', '汤丹丽', '代理商注册 推荐人：13636393523 上家：13636393523', '1537612805', '/baiman/dealer/apply', '223.104.247.243');
INSERT INTO `fw_dealerlogs` VALUES ('160', '3321', '78', '1', '78', 'han864411327', '孙晨晗', '代理商注册 推荐人：13636393523 上家：13636393523', '1537612805', '/baiman/dealer/apply', '183.212.0.94');
INSERT INTO `fw_dealerlogs` VALUES ('161', '3321', '79', '1', '79', '15985812447', '张燕玲', '代理商注册 推荐人：13636393523 上家：13636393523', '1537613809', '/baiman/dealer/apply', '58.23.18.150');
INSERT INTO `fw_dealerlogs` VALUES ('162', '3321', '80', '1', '80', 'Zyy575757', '张云燕', '代理商注册 推荐人：13636393523 上家：13636393523', '1537614049', '/baiman/dealer/apply', '120.33.14.160');
INSERT INTO `fw_dealerlogs` VALUES ('163', '3321', '79', '0', '1191', 'yunmei', 'yunmei', '审核/禁用经销商-1', '1537614439', '/mp/dealer/active', '117.136.46.131');
INSERT INTO `fw_dealerlogs` VALUES ('164', '3321', '78', '0', '1191', 'yunmei', 'yunmei', '审核/禁用经销商-1', '1537614477', '/mp/dealer/active', '117.136.46.131');
INSERT INTO `fw_dealerlogs` VALUES ('165', '3321', '77', '0', '1191', 'yunmei', 'yunmei', '审核/禁用经销商-1', '1537614493', '/mp/dealer/active', '117.136.46.131');
INSERT INTO `fw_dealerlogs` VALUES ('166', '3321', '80', '0', '1191', 'yunmei', 'yunmei', '审核/禁用经销商-1', '1537614510', '/mp/dealer/active', '117.136.46.131');
INSERT INTO `fw_dealerlogs` VALUES ('167', '3321', '81', '1', '81', '13758761295', '玲玲', '代理商注册 推荐人：13636393523 上家：13636393523', '1537614511', '/baiman/dealer/apply', '112.17.240.153');
INSERT INTO `fw_dealerlogs` VALUES ('168', '3321', '81', '0', '1191', 'yunmei', 'yunmei', '审核/禁用经销商-1', '1537614705', '/mp/dealer/active', '117.136.46.131');
INSERT INTO `fw_dealerlogs` VALUES ('169', '3321', '82', '1', '82', 'Zyy575757', '张云燕', '代理商注册 推荐人：15985812447 上家：15985812447', '1537614829', '/baiman/dealer/apply', '120.33.14.160');
INSERT INTO `fw_dealerlogs` VALUES ('170', '3321', '82', '0', '1191', 'yunmei', 'yunmei', '审核/禁用经销商-1', '1537614932', '/mp/dealer/active', '117.136.46.131');
INSERT INTO `fw_dealerlogs` VALUES ('171', '3321', '83', '1', '83', '15980787369', '林秋婕', '代理商注册 推荐人：15985812447 上家：15985812447', '1537627123', '/baiman/dealer/apply', '117.30.133.227');
INSERT INTO `fw_dealerlogs` VALUES ('172', '3321', '84', '1', '84', '13615672165', '王莹', '代理商注册 推荐人：13636393523 上家：13636393523', '1537630181', '/baiman/dealer/apply', '223.104.36.249');
INSERT INTO `fw_dealerlogs` VALUES ('173', '3321', '84', '0', '1191', 'yunmei', 'yunmei', '审核/禁用经销商-1', '1537683111', '/mp/dealer/active', '180.123.220.102');
INSERT INTO `fw_dealerlogs` VALUES ('174', '3321', '83', '0', '1191', 'yunmei', 'yunmei', '审核/禁用经销商-1', '1537683129', '/mp/dealer/active', '180.123.220.102');
INSERT INTO `fw_dealerlogs` VALUES ('175', '3321', '85', '1', '85', 'yanjuxyz', '杨菊', '代理商注册 推荐人：15365423666 上家：15365423666', '1537685552', '/baiman/dealer/apply', '180.123.220.102');
INSERT INTO `fw_dealerlogs` VALUES ('176', '3321', '85', '0', '1191', 'yunmei', 'yunmei', '审核/禁用经销商-1', '1537685690', '/mp/dealer/active', '180.123.220.102');
INSERT INTO `fw_dealerlogs` VALUES ('177', '3321', '86', '1', '86', 'xuqian2386', '许倩', '代理商注册 推荐人：15985812447 上家：15985812447', '1537858072', '/baiman/dealer/apply', '140.243.241.175');
INSERT INTO `fw_dealerlogs` VALUES ('178', '3321', '86', '0', '1191', 'yunmei', 'yunmei', '审核/禁用经销商-1', '1540018704', '/mp/dealer/active', '180.124.222.49');
INSERT INTO `fw_dealerlogs` VALUES ('179', '3321', '87', '1', '87', '13991499199', '张晓雪', '代理商注册 推荐人：tzwl588 上家：tzwl588', '1540094160', '/baiman/dealer/apply', '113.138.11.25');
INSERT INTO `fw_dealerlogs` VALUES ('180', '3321', '87', '0', '1191', 'yunmei', 'yunmei', '审核/禁用经销商-1', '1540451694', '/mp/dealer/active', '180.123.222.191');
INSERT INTO `fw_dealerlogs` VALUES ('181', '3321', '2', '1', '2', '15875872791', '钟琪1', '代理商注册 自己申请', '1542180462', '/Angels/Apply/index', '127.0.0.1');
INSERT INTO `fw_dealerlogs` VALUES ('182', '3321', '2', '0', '1191', 'test', 'test', '审核/禁用经销商-1', '1542180469', '/Mp/Dealer/active', '127.0.0.1');
INSERT INTO `fw_dealerlogs` VALUES ('183', '3321', '3', '1', '3', '15875872792', '钟琪2', '代理商注册 自己申请', '1542590308', '/Angels/Apply/index', '127.0.0.1');
INSERT INTO `fw_dealerlogs` VALUES ('184', '3321', '3', '0', '1191', 'test', 'test', '审核/禁用经销商-1', '1542590318', '/Mp/Dealer/active', '127.0.0.1');
INSERT INTO `fw_dealerlogs` VALUES ('185', '3321', '4', '1', '4', '15875872793', '钟琪3', '代理商注册 推荐人：15875872792 上家：总公司', '1542591176', '/Angels/Dealer/apply', '127.0.0.1');
INSERT INTO `fw_dealerlogs` VALUES ('186', '3321', '4', '0', '1191', 'test', 'test', '审核/禁用经销商-1', '1542591186', '/Mp/Dealer/active', '127.0.0.1');
INSERT INTO `fw_dealerlogs` VALUES ('187', '3321', '5', '1', '5', '15875872794', '钟琪4', '代理商注册 自己申请', '1542591669', '/Angels/Apply/index', '127.0.0.1');
INSERT INTO `fw_dealerlogs` VALUES ('188', '3321', '5', '0', '1191', 'test', 'test', '审核/禁用经销商-1', '1542591676', '/Mp/Dealer/active', '127.0.0.1');
INSERT INTO `fw_dealerlogs` VALUES ('189', '3321', '6', '1', '6', '15875872794', '钟琪4', '代理商注册 自己申请', '1542592007', '/Angels/Apply/index', '127.0.0.1');
INSERT INTO `fw_dealerlogs` VALUES ('190', '3321', '6', '0', '1191', 'test', 'test', '审核/禁用经销商-1', '1542592061', '/Mp/Dealer/active', '127.0.0.1');
INSERT INTO `fw_dealerlogs` VALUES ('191', '3321', '7', '1', '7', '15875872795', '钟琪5', '代理商注册 自己申请', '1542596575', '/Angels/Apply/index', '127.0.0.1');
INSERT INTO `fw_dealerlogs` VALUES ('192', '3321', '7', '0', '1191', 'test', 'test', '审核/禁用经销商-1', '1542596588', '/Mp/Dealer/active', '127.0.0.1');
INSERT INTO `fw_dealerlogs` VALUES ('193', '3321', '8', '1', '8', '15875872796', '钟琪6', '代理商注册 自己申请', '1542597163', '/Angels/Apply/index', '127.0.0.1');
INSERT INTO `fw_dealerlogs` VALUES ('194', '3321', '8', '0', '1191', 'test', 'test', '审核/禁用经销商-1', '1542597171', '/Mp/Dealer/active', '127.0.0.1');
INSERT INTO `fw_dealerlogs` VALUES ('195', '3321', '9', '1', '9', '15875872797', '钟琪7', '代理商注册 自己申请', '1542598630', '/Angels/Apply/index', '127.0.0.1');
INSERT INTO `fw_dealerlogs` VALUES ('196', '3321', '9', '0', '1191', 'test', 'test', '审核/禁用经销商-1', '1542598636', '/Mp/Dealer/active', '127.0.0.1');
INSERT INTO `fw_dealerlogs` VALUES ('197', '3321', '10', '1', '10', '15875872798', '钟琪8', '代理商注册 自己申请', '1542598949', '/Angels/Apply/index', '127.0.0.1');
INSERT INTO `fw_dealerlogs` VALUES ('198', '3321', '10', '0', '1191', 'test', 'test', '审核/禁用经销商-1', '1542598964', '/Mp/Dealer/active', '127.0.0.1');
INSERT INTO `fw_dealerlogs` VALUES ('199', '3321', '11', '1', '11', '15875872799', '钟琪9', '代理商注册 自己申请', '1542599693', '/Angels/Apply/index', '127.0.0.1');
INSERT INTO `fw_dealerlogs` VALUES ('200', '3321', '11', '0', '1191', 'test', 'test', '审核/禁用经销商-1', '1542599701', '/Mp/Dealer/active', '127.0.0.1');

-- ----------------------------
-- Table structure for fw_denyip
-- ----------------------------
DROP TABLE IF EXISTS `fw_denyip`;
CREATE TABLE `fw_denyip` (
  `deny_id` int(11) NOT NULL AUTO_INCREMENT,
  `deny_ip` varchar(32) DEFAULT NULL,
  `deny_remark` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`deny_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='禁止ip表';

-- ----------------------------
-- Records of fw_denyip
-- ----------------------------

-- ----------------------------
-- Table structure for fw_dgjfdetail
-- ----------------------------
DROP TABLE IF EXISTS `fw_dgjfdetail`;
CREATE TABLE `fw_dgjfdetail` (
  `dgjf_id` int(11) NOT NULL AUTO_INCREMENT,
  `dgjf_unitcode` varchar(32) DEFAULT NULL,
  `dgjf_userid` int(11) DEFAULT NULL,
  `dgjf_username` varchar(64) DEFAULT NULL,
  `dgjf_type` int(11) DEFAULT NULL,
  `dgjf_jf` int(11) DEFAULT NULL,
  `dgjf_addtime` int(11) DEFAULT NULL,
  `dgjf_ip` varchar(32) DEFAULT NULL,
  `dgjf_actionuser` int(11) DEFAULT NULL,
  `dgjf_code` varchar(32) DEFAULT NULL,
  `dgjf_proid` int(11) DEFAULT NULL,
  `dgjf_proname` varchar(64) DEFAULT NULL,
  `dgjf_pronumber` varchar(32) DEFAULT NULL,
  `dgjf_remark` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`dgjf_id`),
  KEY `jf_uintcode` (`dgjf_unitcode`),
  KEY `jf_code` (`dgjf_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='代购积分详细';

-- ----------------------------
-- Records of fw_dgjfdetail
-- ----------------------------

-- ----------------------------
-- Table structure for fw_dgjfexchange
-- ----------------------------
DROP TABLE IF EXISTS `fw_dgjfexchange`;
CREATE TABLE `fw_dgjfexchange` (
  `exch_id` int(11) NOT NULL AUTO_INCREMENT,
  `exch_unitcode` varchar(32) DEFAULT NULL,
  `exch_jf` int(11) DEFAULT NULL,
  `exch_qty` int(11) DEFAULT NULL,
  `exch_userid` int(11) DEFAULT NULL COMMENT '代购id',
  `exch_username` varchar(64) DEFAULT NULL COMMENT '用户名',
  `exch_contact` varchar(32) DEFAULT NULL,
  `exch_tel` varchar(32) DEFAULT NULL,
  `exch_address` varchar(254) DEFAULT NULL,
  `exch_msg` varchar(512) DEFAULT NULL,
  `exch_kuaidi` varchar(32) DEFAULT NULL,
  `exch_kdhao` varchar(32) DEFAULT NULL,
  `exch_time` int(11) DEFAULT NULL,
  `exch_remark` varchar(512) DEFAULT NULL,
  `exch_state` int(4) DEFAULT NULL,
  `exch_ip` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`exch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='代购积分兑换';

-- ----------------------------
-- Records of fw_dgjfexchange
-- ----------------------------

-- ----------------------------
-- Table structure for fw_dgjfexchdetail
-- ----------------------------
DROP TABLE IF EXISTS `fw_dgjfexchdetail`;
CREATE TABLE `fw_dgjfexchdetail` (
  `detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `detail_exchid` int(11) DEFAULT NULL,
  `detail_unitcode` varchar(32) DEFAULT NULL,
  `detail_giftid` int(11) DEFAULT NULL,
  `detail_giftname` varchar(128) DEFAULT NULL,
  `detail_xnid` int(11) DEFAULT '0' COMMENT '虚拟礼品兑换数据id',
  `detail_xncardid` varchar(64) DEFAULT NULL,
  `detail_xnpwd` varchar(256) DEFAULT NULL,
  `detail_jf` int(11) DEFAULT NULL,
  `detail_qty` int(11) DEFAULT NULL,
  PRIMARY KEY (`detail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='代购积分兑换详细';

-- ----------------------------
-- Records of fw_dgjfexchdetail
-- ----------------------------

-- ----------------------------
-- Table structure for fw_dgjfgift
-- ----------------------------
DROP TABLE IF EXISTS `fw_dgjfgift`;
CREATE TABLE `fw_dgjfgift` (
  `gif_id` int(11) NOT NULL AUTO_INCREMENT,
  `gif_unitcode` varchar(32) DEFAULT NULL,
  `gif_type` int(4) DEFAULT NULL,
  `gif_name` varchar(128) DEFAULT NULL,
  `gif_pic` varchar(64) DEFAULT NULL,
  `gif_jf` int(11) DEFAULT NULL,
  `gif_qty` int(11) DEFAULT NULL,
  `gif_brief` varchar(254) DEFAULT NULL,
  `gif_des` text,
  `gif_addtime` int(11) DEFAULT NULL,
  `gif_active` int(4) DEFAULT NULL,
  PRIMARY KEY (`gif_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='代购积分礼品';

-- ----------------------------
-- Records of fw_dgjfgift
-- ----------------------------

-- ----------------------------
-- Table structure for fw_dguser
-- ----------------------------
DROP TABLE IF EXISTS `fw_dguser`;
CREATE TABLE `fw_dguser` (
  `dguser_id` int(11) NOT NULL AUTO_INCREMENT,
  `dguser_unitcode` varchar(32) DEFAULT NULL,
  `dguser_openid` varchar(64) DEFAULT NULL COMMENT '微信openid',
  `dguser_username` varchar(64) DEFAULT NULL COMMENT '登录使用的用户名',
  `dguser_pwd` varchar(64) DEFAULT NULL,
  `dguser_truename` varchar(32) DEFAULT NULL,
  `dguser_tel` varchar(32) DEFAULT NULL,
  `dguser_email` varchar(64) DEFAULT NULL,
  `dguser_qq` varchar(32) DEFAULT NULL,
  `dguser_dianpu` varchar(64) DEFAULT NULL COMMENT '所属店铺',
  `dguser_belong` int(11) DEFAULT '0' COMMENT '所属经销商',
  `dguser_sheng` int(11) DEFAULT NULL,
  `dguser_shi` int(11) DEFAULT NULL,
  `dguser_qu` int(11) DEFAULT NULL,
  `dguser_diqustr` varchar(64) DEFAULT NULL,
  `dguser_address` varchar(64) DEFAULT NULL,
  `dguser_jf` int(11) DEFAULT '0',
  `dguser_logintime` int(11) DEFAULT NULL,
  `dguser_errtimes` int(4) DEFAULT '0',
  `dguser_addtime` int(11) DEFAULT NULL,
  `dguser_active` int(4) DEFAULT NULL,
  `dguser_remark` varchar(512) DEFAULT NULL,
  `dguser_weixin` varchar(32) DEFAULT NULL COMMENT '微信号',
  `dguser_wxnickname` varchar(128) DEFAULT NULL COMMENT '微信昵称',
  `dguser_wxsex` int(4) DEFAULT NULL,
  `dguser_wxprovince` varchar(32) DEFAULT NULL,
  `dguser_wxcity` varchar(32) DEFAULT NULL,
  `dguser_wxcountry` varchar(32) DEFAULT NULL,
  `dguser_wxheadimg` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`dguser_id`),
  KEY `dguser_id` (`dguser_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of fw_dguser
-- ----------------------------

-- ----------------------------
-- Table structure for fw_dladdress
-- ----------------------------
DROP TABLE IF EXISTS `fw_dladdress`;
CREATE TABLE `fw_dladdress` (
  `dladd_id` int(11) NOT NULL AUTO_INCREMENT,
  `dladd_unitcode` varchar(32) DEFAULT NULL,
  `dladd_dlid` int(11) DEFAULT NULL COMMENT '代理商id',
  `dladd_contact` varchar(64) DEFAULT NULL COMMENT '联系人',
  `dladd_sheng` int(11) DEFAULT '0' COMMENT '省',
  `dladd_shi` int(11) DEFAULT '0' COMMENT '市',
  `dladd_qu` int(11) DEFAULT '0' COMMENT '区',
  `dladd_diqustr` varchar(64) DEFAULT NULL COMMENT '地区',
  `dladd_address` varchar(64) DEFAULT NULL COMMENT '地址',
  `dladd_tel` varchar(32) DEFAULT NULL,
  `dladd_default` int(11) DEFAULT '0' COMMENT '默认',
  `dladd_customer` int(11) DEFAULT '0' COMMENT '是否代理的客户',
  PRIMARY KEY (`dladd_id`),
  KEY `dladd_unitcode` (`dladd_unitcode`),
  KEY `dladd_dlid` (`dladd_dlid`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='经销商地址表';

-- ----------------------------
-- Records of fw_dladdress
-- ----------------------------
INSERT INTO `fw_dladdress` VALUES ('73', '3321', '2', '钟琪1', '11', '1111', '0', '北京市房山区', '北京市房山区', '15875872791', '1', '0');
INSERT INTO `fw_dladdress` VALUES ('74', '3321', '3', '钟琪2', '11', '1129', '0', '北京市延庆县', '北京市延庆县', '15875872792', '1', '0');
INSERT INTO `fw_dladdress` VALUES ('75', '3321', '4', '钟琪3', '44', '4451', '445101', '广东省潮州市枫溪区', '广东省潮州市枫溪区', '15875872793', '1', '0');
INSERT INTO `fw_dladdress` VALUES ('77', '3321', '6', '钟琪4', '12', '1225', '0', '天津市蓟县', '天津市蓟县', '15875872794', '1', '0');
INSERT INTO `fw_dladdress` VALUES ('78', '3321', '1', '钟琪test', '14', '1401', '140105', '山西省太原市小店区', '山西省太原市小店区', '15875872790', '1', '0');
INSERT INTO `fw_dladdress` VALUES ('79', '3321', '7', '钟琪5', '11', '1129', '0', '北京市延庆县', '广东广州越秀区', '15875872795', '1', '0');
INSERT INTO `fw_dladdress` VALUES ('80', '3321', '8', '钟琪6', '12', '1225', '0', '天津市蓟县', '天津市蓟县', '15875872796', '1', '0');
INSERT INTO `fw_dladdress` VALUES ('81', '3321', '9', '钟琪7', '11', '1129', '0', '北京市延庆县', '北京市延庆县', '15875872797', '1', '0');
INSERT INTO `fw_dladdress` VALUES ('82', '3321', '10', '钟琪8', '12', '1225', '0', '天津市蓟县', '天津市蓟县', '15875872798', '1', '0');
INSERT INTO `fw_dladdress` VALUES ('83', '3321', '11', '钟琪9', '11', '1129', '0', '北京市延庆县', '北京市延庆县', '15875872799', '1', '0');

-- ----------------------------
-- Table structure for fw_dljfdetail
-- ----------------------------
DROP TABLE IF EXISTS `fw_dljfdetail`;
CREATE TABLE `fw_dljfdetail` (
  `dljf_id` int(11) NOT NULL AUTO_INCREMENT,
  `dljf_unitcode` varchar(32) DEFAULT NULL,
  `dljf_dlid` int(11) DEFAULT '0' COMMENT '代理id',
  `dljf_username` varchar(32) DEFAULT NULL COMMENT '代理用户名',
  `dljf_type` int(11) DEFAULT '0' COMMENT '积分类型',
  `dljf_jf` int(11) DEFAULT '0' COMMENT '积分',
  `dljf_addtime` int(11) DEFAULT NULL,
  `dljf_ip` varchar(32) DEFAULT NULL,
  `dljf_actionuser` varchar(32) DEFAULT NULL COMMENT '积分操作者',
  `dljf_odid` int(11) DEFAULT '0' COMMENT '订单流水id',
  `dljf_orderid` varchar(32) DEFAULT NULL COMMENT '订单orderid',
  `dljf_odblid` int(11) DEFAULT '0' COMMENT '订单关系id',
  `dljf_proid` int(11) DEFAULT '0' COMMENT '订单产品id',
  `dljf_qty` int(11) DEFAULT '0' COMMENT '订单数量',
  `dljf_remark` varchar(256) DEFAULT NULL COMMENT '简单说明',
  PRIMARY KEY (`dljf_id`),
  KEY `jf_uintcode` (`dljf_unitcode`),
  KEY `jf_code` (`dljf_orderid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='代购积分详细';

-- ----------------------------
-- Records of fw_dljfdetail
-- ----------------------------

-- ----------------------------
-- Table structure for fw_dljfexchange
-- ----------------------------
DROP TABLE IF EXISTS `fw_dljfexchange`;
CREATE TABLE `fw_dljfexchange` (
  `exch_id` int(11) NOT NULL AUTO_INCREMENT,
  `exch_unitcode` varchar(32) DEFAULT NULL,
  `exch_jf` int(11) DEFAULT NULL,
  `exch_qty` int(11) DEFAULT NULL,
  `exch_dlid` int(11) DEFAULT '0' COMMENT '兑换代理id',
  `exch_username` varchar(64) DEFAULT NULL COMMENT '用户名',
  `exch_contact` varchar(32) DEFAULT NULL,
  `exch_tel` varchar(32) DEFAULT NULL,
  `exch_address` varchar(254) DEFAULT NULL,
  `exch_msg` varchar(512) DEFAULT NULL,
  `exch_kuaidi` varchar(32) DEFAULT NULL,
  `exch_kdhao` varchar(32) DEFAULT NULL,
  `exch_time` int(11) DEFAULT NULL,
  `exch_remark` varchar(512) DEFAULT NULL,
  `exch_state` int(4) DEFAULT NULL,
  `exch_ip` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`exch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='代购积分兑换';

-- ----------------------------
-- Records of fw_dljfexchange
-- ----------------------------

-- ----------------------------
-- Table structure for fw_dljfexchdetail
-- ----------------------------
DROP TABLE IF EXISTS `fw_dljfexchdetail`;
CREATE TABLE `fw_dljfexchdetail` (
  `detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `detail_exchid` int(11) DEFAULT NULL,
  `detail_unitcode` varchar(32) DEFAULT NULL,
  `detail_giftid` int(11) DEFAULT NULL,
  `detail_giftname` varchar(128) DEFAULT NULL,
  `detail_xnid` int(11) DEFAULT '0' COMMENT '虚拟礼品兑换数据id',
  `detail_xncardid` varchar(64) DEFAULT NULL,
  `detail_xnpwd` varchar(256) DEFAULT NULL,
  `detail_jf` int(11) DEFAULT NULL,
  `detail_qty` int(11) DEFAULT NULL,
  PRIMARY KEY (`detail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='代理积分兑换详细';

-- ----------------------------
-- Records of fw_dljfexchdetail
-- ----------------------------

-- ----------------------------
-- Table structure for fw_dljfgift
-- ----------------------------
DROP TABLE IF EXISTS `fw_dljfgift`;
CREATE TABLE `fw_dljfgift` (
  `gif_id` int(11) NOT NULL AUTO_INCREMENT,
  `gif_unitcode` varchar(32) DEFAULT NULL,
  `gif_type` int(4) DEFAULT NULL,
  `gif_name` varchar(128) DEFAULT NULL,
  `gif_pic` varchar(64) DEFAULT NULL,
  `gif_jf` int(11) DEFAULT NULL,
  `gif_qty` int(11) DEFAULT NULL,
  `gif_brief` varchar(254) DEFAULT NULL,
  `gif_des` text,
  `gif_addtime` int(11) DEFAULT NULL,
  `gif_active` int(4) DEFAULT NULL,
  PRIMARY KEY (`gif_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='代理积分礼品';

-- ----------------------------
-- Records of fw_dljfgift
-- ----------------------------

-- ----------------------------
-- Table structure for fw_dlmaiduan
-- ----------------------------
DROP TABLE IF EXISTS `fw_dlmaiduan`;
CREATE TABLE `fw_dlmaiduan` (
  `dl_maiduan_id` int(11) NOT NULL AUTO_INCREMENT,
  `maiduan_dlid` int(11) DEFAULT NULL,
  `maiduan_tjdlid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`dl_maiduan_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fw_dlmaiduan
-- ----------------------------
INSERT INTO `fw_dlmaiduan` VALUES ('1', '7', '8');
INSERT INTO `fw_dlmaiduan` VALUES ('2', '9', '11');

-- ----------------------------
-- Table structure for fw_dlsttype
-- ----------------------------
DROP TABLE IF EXISTS `fw_dlsttype`;
CREATE TABLE `fw_dlsttype` (
  `dlstt_id` int(11) NOT NULL AUTO_INCREMENT,
  `dlstt_unitcode` varchar(32) DEFAULT NULL,
  `dlstt_name` varchar(64) DEFAULT NULL,
  `dlstt_level` int(11) DEFAULT '0' COMMENT '代理级别',
  `dlstt_fanli1` decimal(10,2) DEFAULT '0.00' COMMENT '推荐返利1级',
  `dlstt_fanli2` decimal(10,2) DEFAULT '0.00' COMMENT '推荐返利2级',
  PRIMARY KEY (`dlstt_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='代理级别分类2';

-- ----------------------------
-- Records of fw_dlsttype
-- ----------------------------

-- ----------------------------
-- Table structure for fw_dltype
-- ----------------------------
DROP TABLE IF EXISTS `fw_dltype`;
CREATE TABLE `fw_dltype` (
  `dlt_id` int(11) NOT NULL AUTO_INCREMENT,
  `dlt_unitcode` varchar(32) DEFAULT NULL,
  `dlt_name` varchar(64) DEFAULT NULL,
  `dlt_level` int(11) DEFAULT '0' COMMENT '代理级别',
  `dlt_fanli1` decimal(10,2) DEFAULT '0.00' COMMENT '推荐返利1级',
  `dlt_fanli2` decimal(10,2) DEFAULT '0.00' COMMENT '推荐返利2级',
  `dlt_fanli3` decimal(10,2) DEFAULT '0.00' COMMENT '推荐返利3级',
  `dlt_fanli4` decimal(10,2) DEFAULT '0.00' COMMENT '推荐返利4',
  `dlt_fanli5` decimal(10,2) DEFAULT '0.00' COMMENT '推荐返利5',
  `dlt_fanli6` decimal(10,2) DEFAULT '0.00' COMMENT '推荐返利6',
  `dlt_fanli7` decimal(10,2) DEFAULT '0.00' COMMENT '推荐返利7',
  `dlt_fanli8` decimal(10,2) DEFAULT '0.00' COMMENT '推荐返利8',
  `dlt_fanli9` decimal(10,2) DEFAULT '0.00' COMMENT '推荐返利9',
  `dlt_fanli10` decimal(10,2) DEFAULT '0.00' COMMENT '推荐返利10',
  `dlt_firstquota` decimal(10,2) DEFAULT '0.00' COMMENT '首次下单金额',
  `dlt_minnum` int(11) DEFAULT '0' COMMENT '最低补货数量',
  PRIMARY KEY (`dlt_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='代理级别分类1';

-- ----------------------------
-- Records of fw_dltype
-- ----------------------------
INSERT INTO `fw_dltype` VALUES ('9', '3321', 'CEO', '1', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '300000.00', '0');
INSERT INTO `fw_dltype` VALUES ('10', '3321', '执行董事', '2', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '100000.00', '0');
INSERT INTO `fw_dltype` VALUES ('11', '3321', '销售总监', '3', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '300000.00', '0');
INSERT INTO `fw_dltype` VALUES ('12', '3321', '销售经理', '4', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '10000.00', '0');

-- ----------------------------
-- Table structure for fw_dltypefanli
-- ----------------------------
DROP TABLE IF EXISTS `fw_dltypefanli`;
CREATE TABLE `fw_dltypefanli` (
  `tfl_id` int(11) NOT NULL AUTO_INCREMENT,
  `tfl_unitcode` varchar(32) DEFAULT NULL,
  `tfl_dltype` int(11) DEFAULT '0' COMMENT '推荐级别',
  `tfl_tjdltype` int(11) DEFAULT '0' COMMENT '被推荐级别',
  `tfl_fanli1` decimal(10,2) DEFAULT '0.00' COMMENT '直推返利',
  `tfl_fanli2` decimal(10,2) DEFAULT '0.00' COMMENT '间推返利',
  `tfl_fanli3` decimal(10,2) DEFAULT '0.00' COMMENT '第三间推返利',
  PRIMARY KEY (`tfl_id`),
  KEY `tfl_unitcode` (`tfl_unitcode`)
) ENGINE=MyISAM AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 COMMENT='推荐返利设置';

-- ----------------------------
-- Records of fw_dltypefanli
-- ----------------------------
INSERT INTO `fw_dltypefanli` VALUES ('31', '3321', '9', '9', '0.03', '0.01', '0.00');
INSERT INTO `fw_dltypefanli` VALUES ('32', '3321', '9', '10', '0.00', '0.00', '0.00');
INSERT INTO `fw_dltypefanli` VALUES ('33', '3321', '9', '11', '0.00', '0.00', '0.00');
INSERT INTO `fw_dltypefanli` VALUES ('34', '3321', '9', '12', '0.00', '0.00', '0.00');
INSERT INTO `fw_dltypefanli` VALUES ('35', '3321', '10', '9', '5000.00', '0.00', '0.00');
INSERT INTO `fw_dltypefanli` VALUES ('36', '3321', '10', '10', '0.02', '0.00', '0.00');
INSERT INTO `fw_dltypefanli` VALUES ('37', '3321', '10', '11', '0.00', '0.00', '0.00');
INSERT INTO `fw_dltypefanli` VALUES ('38', '3321', '10', '12', '0.00', '0.00', '0.00');
INSERT INTO `fw_dltypefanli` VALUES ('39', '3321', '11', '9', '5000.00', '0.00', '0.00');
INSERT INTO `fw_dltypefanli` VALUES ('40', '3321', '11', '10', '2000.00', '0.00', '0.00');
INSERT INTO `fw_dltypefanli` VALUES ('41', '3321', '11', '11', '0.00', '0.00', '0.00');
INSERT INTO `fw_dltypefanli` VALUES ('42', '3321', '11', '12', '0.00', '0.00', '0.00');
INSERT INTO `fw_dltypefanli` VALUES ('43', '3321', '12', '9', '5000.00', '0.00', '0.00');
INSERT INTO `fw_dltypefanli` VALUES ('44', '3321', '12', '10', '2000.00', '0.00', '0.00');
INSERT INTO `fw_dltypefanli` VALUES ('45', '3321', '12', '11', '0.00', '0.00', '0.00');
INSERT INTO `fw_dltypefanli` VALUES ('46', '3321', '12', '12', '0.00', '0.00', '0.00');

-- ----------------------------
-- Table structure for fw_express
-- ----------------------------
DROP TABLE IF EXISTS `fw_express`;
CREATE TABLE `fw_express` (
  `exp_id` int(11) NOT NULL AUTO_INCREMENT,
  `exp_name` varchar(32) DEFAULT NULL COMMENT '快递名称',
  `exp_code` varchar(32) DEFAULT NULL COMMENT '快递100接口对应快递代码',
  `exp_addtime` int(11) DEFAULT NULL,
  PRIMARY KEY (`exp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='快递表';

-- ----------------------------
-- Records of fw_express
-- ----------------------------
INSERT INTO `fw_express` VALUES ('1', '无需物流', 'noexp', '1488268353');
INSERT INTO `fw_express` VALUES ('2', '申通快递', 'shentong', '1487845801');
INSERT INTO `fw_express` VALUES ('3', '圆通快递', 'yuantong', '1487845876');
INSERT INTO `fw_express` VALUES ('4', '顺丰快递', 'shunfeng', '1488268110');
INSERT INTO `fw_express` VALUES ('5', '中通物流', 'zhongtong', '1488268310');

-- ----------------------------
-- Table structure for fw_fanlidetail
-- ----------------------------
DROP TABLE IF EXISTS `fw_fanlidetail`;
CREATE TABLE `fw_fanlidetail` (
  `fl_id` int(11) NOT NULL AUTO_INCREMENT,
  `fl_unitcode` varchar(32) DEFAULT NULL COMMENT '企业码',
  `fl_dlid` int(11) DEFAULT '0' COMMENT '接收返利的经销商id',
  `fl_senddlid` int(11) DEFAULT '0' COMMENT '发放返利的代理',
  `fl_type` int(11) DEFAULT '0' COMMENT '返利类型',
  `fl_money` decimal(10,2) DEFAULT '0.00' COMMENT '返利金额',
  `fl_refedlid` int(11) DEFAULT '0' COMMENT '推荐返利中被推荐的经销商id',
  `fl_oddlid` int(11) DEFAULT '0' COMMENT '订单返利中下单的经销商id',
  `fl_odid` int(11) DEFAULT '0' COMMENT '订单返利中订单id',
  `fl_orderid` varchar(32) DEFAULT NULL COMMENT '订单orderid',
  `fl_odblid` int(11) DEFAULT '0' COMMENT '订单关系id',
  `fl_proid` int(11) DEFAULT '0' COMMENT '订单产品id',
  `fl_qty` int(11) DEFAULT '0' COMMENT '订单产品数量',
  `fl_level` int(11) DEFAULT '0' COMMENT '该返利是第几级返利',
  `fl_addtime` int(11) DEFAULT '0' COMMENT '返利时间',
  `fl_remark` varchar(256) DEFAULT NULL COMMENT '简单说明',
  `fl_state` int(11) DEFAULT '0' COMMENT '0-待收款 1-已收款 2-收款中 9-取消',
  `fl_rcid` int(11) DEFAULT '0' COMMENT '对应提现id',
  PRIMARY KEY (`fl_id`),
  KEY `fl_unitcode` (`fl_unitcode`),
  KEY `fl_dlid` (`fl_dlid`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='返利明细';

-- ----------------------------
-- Records of fw_fanlidetail
-- ----------------------------
INSERT INTO `fw_fanlidetail` VALUES ('1', '3321', '1', '0', '1', '9000.00', '3', '0', '0', '', '0', '0', '0', '1', '1542590978', '邀请代理 钟琪2(15875872792) 成为 CEO', '0', '0');
INSERT INTO `fw_fanlidetail` VALUES ('2', '3321', '3', '0', '1', '12000.00', '4', '0', '0', '', '0', '0', '0', '1', '1542591340', '邀请代理 钟琪3(15875872793) 成为 CEO', '0', '0');
INSERT INTO `fw_fanlidetail` VALUES ('3', '3321', '1', '0', '1', '4000.00', '4', '0', '0', '', '0', '0', '0', '2', '1542591340', '代理 钟琪2(15875872792) 邀请代理 钟琪3(15875872793) 成为 CEO', '0', '0');
INSERT INTO `fw_fanlidetail` VALUES ('4', '3321', '2', '1', '1', '20000.00', '6', '0', '0', '', '0', '0', '0', '1', '1542596218', '邀请代理 钟琪4(15875872794) 成为 执行董事', '0', '0');
INSERT INTO `fw_fanlidetail` VALUES ('5', '3321', '6', '1', '1', '20000.00', '7', '0', '0', '', '0', '0', '0', '1', '1542596896', '邀请代理 钟琪5(15875872795) 成为 执行董事', '0', '0');
INSERT INTO `fw_fanlidetail` VALUES ('8', '3321', '7', '0', '1', '5000.00', '8', '0', '0', '', '0', '0', '0', '1', '1542598248', '邀请代理 钟琪6(15875872796) 成为 CEO', '0', '0');
INSERT INTO `fw_fanlidetail` VALUES ('12', '3321', '9', '8', '1', '2000.00', '11', '0', '0', '', '0', '0', '0', '1', '1542600715', '邀请代理 钟琪9(15875872799) 成为 执行董事', '0', '0');

-- ----------------------------
-- Table structure for fw_jfdetail
-- ----------------------------
DROP TABLE IF EXISTS `fw_jfdetail`;
CREATE TABLE `fw_jfdetail` (
  `jf_id` int(11) NOT NULL AUTO_INCREMENT,
  `jf_unitcode` varchar(32) DEFAULT NULL,
  `jf_userid` int(11) DEFAULT NULL,
  `jf_username` varchar(32) DEFAULT NULL,
  `jf_type` int(11) DEFAULT NULL,
  `jf_jf` int(11) DEFAULT NULL,
  `jf_addtime` int(11) DEFAULT NULL,
  `jf_ip` varchar(32) DEFAULT NULL,
  `jf_actionuser` int(11) DEFAULT NULL,
  `jf_code` varchar(32) DEFAULT NULL,
  `jf_proid` int(11) DEFAULT NULL,
  `jf_proname` varchar(64) DEFAULT NULL,
  `jf_pronumber` varchar(32) DEFAULT NULL,
  `jf_remark` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`jf_id`),
  KEY `jf_uintcode` (`jf_unitcode`),
  KEY `jf_code` (`jf_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户积分详细';

-- ----------------------------
-- Records of fw_jfdetail
-- ----------------------------

-- ----------------------------
-- Table structure for fw_jfexchange
-- ----------------------------
DROP TABLE IF EXISTS `fw_jfexchange`;
CREATE TABLE `fw_jfexchange` (
  `exch_id` int(11) NOT NULL AUTO_INCREMENT,
  `exch_unitcode` varchar(32) DEFAULT NULL,
  `exch_jf` int(11) DEFAULT NULL,
  `exch_qty` int(11) DEFAULT NULL,
  `exch_userid` int(11) DEFAULT NULL,
  `exch_username` varchar(64) DEFAULT NULL,
  `exch_contact` varchar(32) DEFAULT NULL,
  `exch_tel` varchar(32) DEFAULT NULL,
  `exch_address` varchar(254) DEFAULT NULL,
  `exch_msg` varchar(512) DEFAULT NULL,
  `exch_kuaidi` varchar(32) DEFAULT NULL,
  `exch_kdhao` varchar(32) DEFAULT NULL,
  `exch_time` int(11) DEFAULT NULL,
  `exch_remark` varchar(512) DEFAULT NULL,
  `exch_state` int(4) DEFAULT NULL,
  `exch_ip` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`exch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户积分兑换';

-- ----------------------------
-- Records of fw_jfexchange
-- ----------------------------

-- ----------------------------
-- Table structure for fw_jfexchdetail
-- ----------------------------
DROP TABLE IF EXISTS `fw_jfexchdetail`;
CREATE TABLE `fw_jfexchdetail` (
  `detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `detail_exchid` int(11) DEFAULT NULL,
  `detail_unitcode` varchar(32) DEFAULT NULL,
  `detail_giftid` int(11) DEFAULT NULL,
  `detail_giftname` varchar(128) DEFAULT NULL,
  `detail_xnid` int(11) DEFAULT '0' COMMENT '虚拟礼品兑换数据id',
  `detail_xncardid` varchar(64) DEFAULT NULL,
  `detail_xnpwd` varchar(256) DEFAULT NULL,
  `detail_jf` int(11) DEFAULT NULL,
  `detail_qty` int(11) DEFAULT NULL,
  PRIMARY KEY (`detail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户积分兑换详细';

-- ----------------------------
-- Records of fw_jfexchdetail
-- ----------------------------

-- ----------------------------
-- Table structure for fw_jffeedback
-- ----------------------------
DROP TABLE IF EXISTS `fw_jffeedback`;
CREATE TABLE `fw_jffeedback` (
  `fb_id` int(11) NOT NULL AUTO_INCREMENT,
  `fb_unitcode` varchar(32) DEFAULT NULL,
  `fb_type` int(4) DEFAULT NULL,
  `fb_userid` int(11) DEFAULT NULL,
  `fb_username` varchar(32) DEFAULT NULL,
  `fb_contact` varchar(64) DEFAULT NULL,
  `fb_tel` varchar(64) DEFAULT NULL,
  `fb_qq` varchar(32) DEFAULT NULL,
  `fb_email` varchar(64) DEFAULT NULL,
  `fb_content` text,
  `fb_recontent` text,
  `fb_addtime` int(11) DEFAULT NULL,
  `fb_ip` varchar(32) DEFAULT NULL,
  `fb_state` int(4) DEFAULT NULL,
  PRIMARY KEY (`fb_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='反馈留言';

-- ----------------------------
-- Records of fw_jffeedback
-- ----------------------------
INSERT INTO `fw_jffeedback` VALUES ('1', '3321', '1', '1', 'test', '11', '15875872797', '522402295', '', '测试', null, '1542160391', '127.0.0.1', '1');

-- ----------------------------
-- Table structure for fw_jfgift
-- ----------------------------
DROP TABLE IF EXISTS `fw_jfgift`;
CREATE TABLE `fw_jfgift` (
  `gif_id` int(11) NOT NULL AUTO_INCREMENT,
  `gif_unitcode` varchar(32) DEFAULT NULL,
  `gif_type` int(4) DEFAULT NULL COMMENT '虚拟礼品 实物礼品',
  `gif_gifttype` int(11) NOT NULL DEFAULT '0' COMMENT '礼品分类',
  `gif_name` varchar(128) DEFAULT NULL,
  `gif_pic` varchar(64) DEFAULT NULL,
  `gif_jf` int(11) DEFAULT NULL,
  `gif_qty` int(11) DEFAULT NULL,
  `gif_brief` varchar(254) DEFAULT NULL,
  `gif_des` text,
  `gif_addtime` int(11) DEFAULT NULL,
  `gif_active` int(4) DEFAULT NULL,
  PRIMARY KEY (`gif_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='积分礼品';

-- ----------------------------
-- Records of fw_jfgift
-- ----------------------------

-- ----------------------------
-- Table structure for fw_jfgifttype
-- ----------------------------
DROP TABLE IF EXISTS `fw_jfgifttype`;
CREATE TABLE `fw_jfgifttype` (
  `giftype_id` int(11) NOT NULL AUTO_INCREMENT,
  `giftype_unitcode` varchar(32) DEFAULT NULL,
  `giftype_name` varchar(128) DEFAULT NULL,
  `giftype_order` int(11) DEFAULT '0',
  PRIMARY KEY (`giftype_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of fw_jfgifttype
-- ----------------------------

-- ----------------------------
-- Table structure for fw_jfmobasic
-- ----------------------------
DROP TABLE IF EXISTS `fw_jfmobasic`;
CREATE TABLE `fw_jfmobasic` (
  `bas_id` int(11) NOT NULL AUTO_INCREMENT,
  `bas_unitcode` varchar(32) DEFAULT NULL,
  `bas_sitename` varchar(128) DEFAULT NULL,
  `bas_company` varchar(254) DEFAULT NULL,
  `bas_address` varchar(254) DEFAULT NULL,
  `bas_hotline` varchar(64) DEFAULT NULL,
  `bas_tel` varchar(64) DEFAULT NULL,
  `bas_fax` varchar(64) DEFAULT NULL,
  `bas_website` varchar(254) DEFAULT NULL,
  `bas_weixin` varchar(254) DEFAULT NULL,
  `bas_wxpic` varchar(64) DEFAULT NULL,
  `bas_weibo` varchar(254) DEFAULT NULL,
  `bas_wbpic` varchar(64) DEFAULT NULL,
  `bas_logopic` varchar(32) DEFAULT NULL COMMENT 'logo',
  `bas_footpic` varchar(32) DEFAULT NULL COMMENT '页面底部图片',
  `bas_profile` text,
  `bas_contact` text,
  `bas_agreement` text,
  `bas_rule` text,
  `bas_help` text,
  `bas_buyer` text,
  `bas_buyer2` text,
  `bas_buyer3` text,
  `bas_ppzc` text COMMENT '品牌政策',
  PRIMARY KEY (`bas_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='积分商城手机端基本资料';

-- ----------------------------
-- Records of fw_jfmobasic
-- ----------------------------
INSERT INTO `fw_jfmobasic` VALUES ('4', '3321', '', '安吉思燕窝', '', '400-168-1810', '', '', 'http://www.bomanvip.com', '', null, '', null, null, null, '安吉思燕窝', '联系方式：15068026064；\r\n邮箱：taihuimei2016@163.com;', null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for fw_jfmonews
-- ----------------------------
DROP TABLE IF EXISTS `fw_jfmonews`;
CREATE TABLE `fw_jfmonews` (
  `news_id` int(11) NOT NULL AUTO_INCREMENT,
  `news_unitcode` varchar(32) DEFAULT NULL,
  `news_title` varchar(254) DEFAULT NULL,
  `news_type` int(4) DEFAULT NULL,
  `news_pic` varchar(64) DEFAULT NULL,
  `news_content` text,
  `news_addtime` int(11) DEFAULT NULL,
  `news_isgg` int(11) DEFAULT '0' COMMENT '是否公告',
  PRIMARY KEY (`news_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='积分商城手机端企业动态';

-- ----------------------------
-- Records of fw_jfmonews
-- ----------------------------
INSERT INTO `fw_jfmonews` VALUES ('22', '3321', '买家秀测试', '2', '3321/15421604392.jpg', '测试', '1542160439', '0');
INSERT INTO `fw_jfmonews` VALUES ('23', '3321', '企业动态测试', '1', '3321/15422462601.jpg', '测试内容', '1542160533', '0');

-- ----------------------------
-- Table structure for fw_jfmopics
-- ----------------------------
DROP TABLE IF EXISTS `fw_jfmopics`;
CREATE TABLE `fw_jfmopics` (
  `pics_id` int(11) NOT NULL AUTO_INCREMENT,
  `pics_unitcode` varchar(32) DEFAULT NULL,
  `pics_title` varchar(64) DEFAULT NULL,
  `pics_group` int(11) DEFAULT NULL,
  `pics_name` varchar(64) DEFAULT NULL,
  `pics_name_s` varchar(64) DEFAULT NULL,
  `pics_addtime` int(11) DEFAULT NULL,
  PRIMARY KEY (`pics_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='图片管理';

-- ----------------------------
-- Records of fw_jfmopics
-- ----------------------------

-- ----------------------------
-- Table structure for fw_jfproduct
-- ----------------------------
DROP TABLE IF EXISTS `fw_jfproduct`;
CREATE TABLE `fw_jfproduct` (
  `pro_id` int(11) NOT NULL AUTO_INCREMENT,
  `pro_unitcode` varchar(32) DEFAULT NULL,
  `pro_typeid` int(11) DEFAULT NULL,
  `pro_name` varchar(254) DEFAULT NULL,
  `pro_number` varchar(32) DEFAULT NULL,
  `pro_pic` varchar(64) DEFAULT NULL,
  `pro_price` decimal(8,2) DEFAULT NULL,
  `pro_desc` text,
  `pro_link` varchar(512) DEFAULT NULL,
  `pro_active` int(4) DEFAULT NULL,
  `pro_addtime` int(11) DEFAULT NULL,
  PRIMARY KEY (`pro_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='产品展示仅用于微站，无防窜';

-- ----------------------------
-- Records of fw_jfproduct
-- ----------------------------
INSERT INTO `fw_jfproduct` VALUES ('0', '', null, '', '', '', null, '', '', null, null);
INSERT INTO `fw_jfproduct` VALUES ('1', '3321', '0', '测试产品1', 'N0001', '3321/1542160304_1488.jpg', '100.00', '养身', '', '1', '1542160304');

-- ----------------------------
-- Table structure for fw_jfprotype
-- ----------------------------
DROP TABLE IF EXISTS `fw_jfprotype`;
CREATE TABLE `fw_jfprotype` (
  `protype_id` int(11) NOT NULL AUTO_INCREMENT,
  `protype_unitcode` varchar(32) DEFAULT NULL,
  `protype_name` varchar(128) DEFAULT NULL,
  `protype_iswho` int(11) DEFAULT '0',
  `protype_order` int(11) DEFAULT '0',
  PRIMARY KEY (`protype_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='产品分类';

-- ----------------------------
-- Records of fw_jfprotype
-- ----------------------------

-- ----------------------------
-- Table structure for fw_jfuser
-- ----------------------------
DROP TABLE IF EXISTS `fw_jfuser`;
CREATE TABLE `fw_jfuser` (
  `jfuser_id` int(11) NOT NULL AUTO_INCREMENT,
  `jfuser_unitcode` varchar(32) DEFAULT NULL,
  `jfuser_openid` varchar(64) DEFAULT NULL COMMENT '微信openid',
  `jfuser_username` varchar(64) DEFAULT NULL,
  `jfuser_pwd` varchar(64) DEFAULT NULL,
  `jfuser_truename` varchar(32) DEFAULT NULL,
  `jfuser_tel` varchar(32) DEFAULT NULL,
  `jfuser_email` varchar(64) DEFAULT NULL,
  `jfuser_qq` varchar(32) DEFAULT NULL,
  `jfuser_sheng` int(11) DEFAULT NULL,
  `jfuser_shi` int(11) DEFAULT NULL,
  `jfuser_qu` int(11) DEFAULT NULL,
  `jfuser_diqustr` varchar(64) DEFAULT NULL,
  `jfuser_address` varchar(64) DEFAULT NULL,
  `jfuser_jf` int(11) DEFAULT '0',
  `jfuser_logintime` int(11) DEFAULT NULL,
  `jfuser_addtime` int(11) DEFAULT NULL,
  `jfuser_active` int(4) DEFAULT NULL,
  `jfuser_remark` varchar(512) DEFAULT NULL,
  `jfuser_weixin` varchar(32) DEFAULT NULL,
  `jfuser_wxnickname` varchar(128) DEFAULT NULL COMMENT '微信昵称',
  `jfuser_wxsex` int(4) DEFAULT NULL,
  `jfuser_wxprovince` varchar(32) DEFAULT NULL,
  `jfuser_wxcity` varchar(32) DEFAULT NULL,
  `jfuser_wxcountry` varchar(32) DEFAULT NULL,
  `jfuser_wxheadimg` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`jfuser_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='积分用户';

-- ----------------------------
-- Records of fw_jfuser
-- ----------------------------

-- ----------------------------
-- Table structure for fw_jfxngift
-- ----------------------------
DROP TABLE IF EXISTS `fw_jfxngift`;
CREATE TABLE `fw_jfxngift` (
  `xn_id` int(11) NOT NULL AUTO_INCREMENT,
  `xn_unitcode` varchar(32) DEFAULT NULL,
  `xn_giftid` int(11) DEFAULT NULL,
  `xn_cardid` varchar(128) DEFAULT NULL,
  `xn_cardpwd` varchar(256) DEFAULT NULL,
  `xn_addtime` int(11) DEFAULT NULL,
  `xn_exchtime` int(11) DEFAULT NULL,
  `xn_userid` int(11) DEFAULT NULL,
  `xn_username` varchar(32) DEFAULT NULL,
  `xn_isexch` int(4) DEFAULT NULL,
  PRIMARY KEY (`xn_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='虚拟礼品';

-- ----------------------------
-- Records of fw_jfxngift
-- ----------------------------

-- ----------------------------
-- Table structure for fw_jxtellist
-- ----------------------------
DROP TABLE IF EXISTS `fw_jxtellist`;
CREATE TABLE `fw_jxtellist` (
  `jx_fid` int(11) NOT NULL AUTO_INCREMENT,
  `jx_unitcode` varchar(32) DEFAULT NULL,
  `jx_code` varchar(32) DEFAULT NULL,
  `jx_state` varchar(16) DEFAULT NULL,
  `jx_ip` varchar(32) DEFAULT NULL,
  `jx_addtime` int(11) DEFAULT NULL,
  `jx_remark` varchar(254) DEFAULT NULL,
  PRIMARY KEY (`jx_fid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='经销商内部查码记录';

-- ----------------------------
-- Records of fw_jxtellist
-- ----------------------------

-- ----------------------------
-- Table structure for fw_log
-- ----------------------------
DROP TABLE IF EXISTS `fw_log`;
CREATE TABLE `fw_log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `log_qyid` int(11) DEFAULT NULL,
  `log_user` varchar(32) DEFAULT NULL,
  `log_qycode` varchar(32) DEFAULT NULL,
  `log_action` varchar(32) DEFAULT NULL,
  `log_addtime` int(11) DEFAULT NULL,
  `log_ip` varchar(32) DEFAULT NULL,
  `log_link` varchar(128) NOT NULL,
  `log_remark` text,
  `log_type` int(11) DEFAULT '0' COMMENT '日志分类0-系统 1-企业 2-经销商',
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2419 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of fw_log
-- ----------------------------
INSERT INTO `fw_log` VALUES ('1699', '1191', 'baiman', '3321', '企业登录', '1530841597', '113.109.121.220', '/Mp/Login/logining', '', '1');
INSERT INTO `fw_log` VALUES ('1700', '1191', 'baiman', '3321', '企业登录', '1530842924', '113.109.121.220', '/Mp/Login/logining', '', '1');
INSERT INTO `fw_log` VALUES ('1701', '1191', 'baiman', '3321', '修改密码', '1530842968', '113.109.121.220', '/Mp/Index/updatepwd_save', '{\"qy_id\":1191,\"qy_code\":\"3321\",\"qy_pwd\":\"89c4c076641706363f43be3680fd322f\"}', '0');
INSERT INTO `fw_log` VALUES ('1702', '1191', 'baiman', '3321', '企业登录', '1530842986', '113.109.121.220', '/Mp/Login/logining', '', '1');
INSERT INTO `fw_log` VALUES ('1703', '1191', 'baiman', '3321', '添加经销商级别', '1530843007', '113.109.121.220', '/Mp/Dealer/type_save', '{\"dlt_unitcode\":\"3321\",\"dlt_name\":\"\\u603b\\u4ee3\",\"dlt_level\":1,\"dlt_fanli1\":0,\"dlt_fanli2\":0,\"dlt_fanli3\":0,\"dlt_fanli4\":0,\"dlt_fanli5\":0,\"dlt_fanli6\":0,\"dlt_fanli7\":0,\"dlt_fanli8\":0,\"dlt_fanli9\":0,\"dlt_fanli10\":0,\"dlt_firstquota\":0,\"dlt_minnum\":0}', '1');
INSERT INTO `fw_log` VALUES ('1704', '1191', 'baiman', '3321', '添加产品类型', '1530843030', '113.109.121.220', '/Mp/Product/typeedit_save', '{\"protype_unitcode\":\"3321\",\"protype_name\":\"\\u6d4b\\u8bd5\\u5927\\u7c7b\",\"protype_iswho\":\"0\"}', '1');
INSERT INTO `fw_log` VALUES ('1705', '1191', 'baiman', '3321', '添加经销商级别', '1530844722', '113.109.121.220', '/Mp/Dealer/type_save', '{\"dlt_unitcode\":\"3321\",\"dlt_name\":\"\\u4e8c\\u7ea7\\u4ee3\\u7406\",\"dlt_level\":2,\"dlt_fanli1\":0,\"dlt_fanli2\":0,\"dlt_fanli3\":0,\"dlt_fanli4\":0,\"dlt_fanli5\":0,\"dlt_fanli6\":0,\"dlt_fanli7\":0,\"dlt_fanli8\":0,\"dlt_fanli9\":0,\"dlt_fanli10\":0,\"dlt_firstquota\":0,\"dlt_minnum\":0}', '1');
INSERT INTO `fw_log` VALUES ('1706', '1191', 'baiman', '3321', '添加经销商级别', '1530844732', '113.109.121.220', '/Mp/Dealer/type_save', '{\"dlt_unitcode\":\"3321\",\"dlt_name\":\"\\u4e09\\u7ea7\\u4ee3\\u7406\",\"dlt_level\":3,\"dlt_fanli1\":0,\"dlt_fanli2\":0,\"dlt_fanli3\":0,\"dlt_fanli4\":0,\"dlt_fanli5\":0,\"dlt_fanli6\":0,\"dlt_fanli7\":0,\"dlt_fanli8\":0,\"dlt_fanli9\":0,\"dlt_fanli10\":0,\"dlt_firstquota\":0,\"dlt_minnum\":0}', '1');
INSERT INTO `fw_log` VALUES ('1707', '1191', 'baiman', '3321', '添加经销商级别', '1530844742', '113.109.121.220', '/Mp/Dealer/type_save', '{\"dlt_unitcode\":\"3321\",\"dlt_name\":\"\\u56db\\u7ea7\\u4ee3\\u7406\",\"dlt_level\":4,\"dlt_fanli1\":0,\"dlt_fanli2\":0,\"dlt_fanli3\":0,\"dlt_fanli4\":0,\"dlt_fanli5\":0,\"dlt_fanli6\":0,\"dlt_fanli7\":0,\"dlt_fanli8\":0,\"dlt_fanli9\":0,\"dlt_fanli10\":0,\"dlt_firstquota\":0,\"dlt_minnum\":0}', '1');
INSERT INTO `fw_log` VALUES ('1708', '1191', 'baiman', '3321', '企业登录', '1531101179', '113.109.121.40', '/mp/login/logining', '', '1');
INSERT INTO `fw_log` VALUES ('1709', '1191', 'baiman', '3321', '企业登录', '1531272139', '58.63.147.9', '/mp/login/logining', '', '1');
INSERT INTO `fw_log` VALUES ('1710', '1191', 'baiman', '3321', '企业登录', '1531273356', '58.63.138.160', '/mp/login/logining', '', '1');
INSERT INTO `fw_log` VALUES ('1711', '60', '18122734809', '3321', '代理商注册', '1531273687', '58.63.138.160', '/baiman/dealer/qyjxapply', '{\"dl_username\":\"18122734809\",\"dl_pwd\":\"516a2b5a42459150bce557383bfd87ba\",\"dl_number\":\"\",\"dl_unitcode\":\"3321\",\"dl_name\":\"\\u6f58\\u751f\",\"dl_contact\":\"\\u6f58\\u751f\",\"dl_tel\":\"18122734809\",\"dl_idcard\":\"440880199012081234\",\"dl_idcardpic\":\"\",\"dl_idcardpic2\":\"\",\"dl_tbdian\":\"\",\"dl_tbzhanggui\":\"\",\"dl_addtime\":1531273687,\"dl_status\":0,\"dl_level\":\"1\",\"dl_type\":2,\"dl_sttype\":0,\"dl_belong\":0,\"dl_referee\":0,\"dl_remark\":\"\",\"dl_address\":\"\\u5e7f\\u4e1c\\u7701\\u5e7f\\u5dde\\u5e02\\u8354\\u6e7e\\u533a\",\"dl_sheng\":\"44\",\"dl_shi\":\"4401\",\"dl_qu\":\"440103\",\"dl_qustr\":\"\\u5e7f\\u4e1c\\u7701\\u5e7f\\u5dde\\u5e02\\u8354\\u6e7e\\u533a\",\"dl_openid\":\"\",\"dl_weixin\":\"18122734809\",\"dl_wxnickname\":\"\",\"dl_wxsex\":0,\"dl_wxprovince\":\"\",\"dl_wxcity\":\"\",\"dl_wxcountry\":\"\",\"dl_wxheadimg\":\"\",\"dl_brand\":\"\",\"dl_brandlevel\":\"\"}', '2');
INSERT INTO `fw_log` VALUES ('1712', '60', '18122734809', '3321', '经销商账号登录', '1531273749', '58.63.138.160', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('1713', '1191', 'baiman', '3321', '添加产品', '1531274363', '58.63.138.160', '/mp/product/edit_save', '{\"pro_name\":\"\\u6d4b\\u8bd5\\u4ea7\\u54c1\",\"pro_number\":\"123\",\"pro_unitcode\":\"3321\",\"pro_typeid\":19,\"pro_jftype\":1,\"pro_jifen\":0,\"pro_jfmax\":0,\"pro_dljf\":0,\"pro_desc\":\"\",\"pro_link\":\"\",\"pro_barcode\":\"\",\"pro_remark\":\"\",\"pro_addtime\":1531274363,\"pro_active\":1,\"pro_price\":\"299\",\"pro_stock\":0,\"pro_units\":\"\\u7f50\",\"pro_dbiao\":0,\"pro_zbiao\":0,\"pro_xbiao\":0,\"pro_pic2\":\"3321\\/15312743632_8286.jpg\"}', '1');
INSERT INTO `fw_log` VALUES ('1714', '1191', 'baiman', '3321', '修改产品', '1531274384', '58.63.138.160', '/mp/product/edit_save', '{\"pro_id\":16,\"pro_name\":\"\\u6d4b\\u8bd5\\u4ea7\\u54c1\",\"pro_number\":\"123\",\"pro_typeid\":19,\"pro_jftype\":1,\"pro_jifen\":0,\"pro_jfmax\":0,\"pro_dljf\":0,\"pro_desc\":\"\",\"pro_link\":\"\",\"pro_barcode\":\"\",\"pro_remark\":\"\",\"pro_price\":\"299.00\",\"pro_stock\":0,\"pro_units\":\"\\u7f50\",\"pro_dbiao\":0,\"pro_zbiao\":0,\"pro_xbiao\":0,\"pro_pic\":\"3321\\/1531274384_7385.jpg\"}', '1');
INSERT INTO `fw_log` VALUES ('1715', '1191', 'baiman', '3321', '修改产品价格体系', '1531274551', '58.63.138.160', '/mp/product/propriceedit_save', '[{\"dlt_id\":\"2\",\"dlt_unitcode\":\"3321\",\"dlt_name\":\"\\u603b\\u4ee3\",\"dlt_level\":\"1\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"0.00\",\"dlt_minnum\":\"0\",\"priprice\":\"180.00\",\"pro_id\":\"16\"},{\"dlt_id\":\"3\",\"dlt_unitcode\":\"3321\",\"dlt_name\":\"\\u4e8c\\u7ea7\\u4ee3\\u7406\",\"dlt_level\":\"2\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"0.00\",\"dlt_minnum\":\"0\",\"priprice\":\"200.00\",\"pro_id\":\"16\"},{\"dlt_id\":\"4\",\"dlt_unitcode\":\"3321\",\"dlt_name\":\"\\u4e09\\u7ea7\\u4ee3\\u7406\",\"dlt_level\":\"3\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"0.00\",\"dlt_minnum\":\"0\",\"priprice\":\"230.00\",\"pro_id\":\"16\"},{\"dlt_id\":\"5\",\"dlt_unitcode\":\"3321\",\"dlt_name\":\"\\u56db\\u7ea7\\u4ee3\\u7406\",\"dlt_level\":\"4\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"0.00\",\"dlt_minnum\":\"0\",\"priprice\":\"250.00\",\"pro_id\":\"16\"}]', '1');
INSERT INTO `fw_log` VALUES ('1716', '1191', 'baiman', '3321', '修改产品', '1531274706', '58.63.138.160', '/mp/product/edit_save', '{\"pro_id\":16,\"pro_name\":\"\\u6d4b\\u8bd5\\u4ea7\\u54c1\",\"pro_number\":\"123\",\"pro_typeid\":19,\"pro_jftype\":1,\"pro_jifen\":0,\"pro_jfmax\":0,\"pro_dljf\":0,\"pro_desc\":\"\",\"pro_link\":\"\",\"pro_barcode\":\"\",\"pro_remark\":\"\",\"pro_price\":\"299.00\",\"pro_stock\":0,\"pro_units\":\"\\u7f50\",\"pro_dbiao\":0,\"pro_zbiao\":0,\"pro_xbiao\":0,\"pro_pic\":\"3321\\/1531274706_8509.png\",\"pro_pic2\":\"3321\\/15312747062_8742.png\"}', '1');
INSERT INTO `fw_log` VALUES ('1717', '1191', 'baiman', '3321', '修改产品', '1531275239', '58.63.138.160', '/mp/product/edit_save', '{\"pro_id\":16,\"pro_name\":\"\\u6d4b\\u8bd5\\u4ea7\\u54c1\",\"pro_number\":\"123\",\"pro_typeid\":19,\"pro_jftype\":1,\"pro_jifen\":0,\"pro_jfmax\":0,\"pro_dljf\":0,\"pro_desc\":\"\",\"pro_link\":\"\",\"pro_barcode\":\"\",\"pro_remark\":\"\",\"pro_price\":\"299.00\",\"pro_stock\":0,\"pro_units\":\"\\u76d2\",\"pro_dbiao\":0,\"pro_zbiao\":0,\"pro_xbiao\":0}', '1');
INSERT INTO `fw_log` VALUES ('1718', '60', '18122734809', '3321', '经销商账号登录', '1531275814', '58.63.138.160', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('1719', '1191', 'baiman', '3321', '手动增加预付款：200', '1531276930', '58.63.138.160', '/mp/capital/yufukuanadd_save', '{\"yfk_unitcode\":\"3321\",\"yfk_type\":1,\"yfk_sendid\":0,\"yfk_receiveid\":60,\"yfk_money\":\"200\",\"yfk_refedlid\":0,\"yfk_oddlid\":0,\"yfk_odid\":0,\"yfk_orderid\":\"\",\"yfk_odblid\":0,\"yfk_qty\":0,\"yfk_level\":0,\"yfk_addtime\":1531276930,\"yfk_remark\":\"\\u5145\\u503c\",\"yfk_state\":1}', '1');
INSERT INTO `fw_log` VALUES ('1720', '1191', 'baiman', '3321', '手动增加余额：300', '1531276974', '58.63.138.160', '/mp/capital/yueadd_save', '{\"bl_unitcode\":\"3321\",\"bl_type\":1,\"bl_sendid\":0,\"bl_receiveid\":60,\"bl_money\":\"300\",\"bl_odid\":0,\"bl_orderid\":\"\",\"bl_odblid\":0,\"bl_addtime\":1531276974,\"bl_remark\":\"\\u5145\\u503c\",\"bl_state\":1,\"bl_rcid\":0}', '1');
INSERT INTO `fw_log` VALUES ('1721', '1191', 'baiman', '3321', '手动减少预付款：200', '1531277003', '58.63.138.160', '/mp/capital/yufukuanadd_save', '{\"yfk_unitcode\":\"3321\",\"yfk_type\":1,\"yfk_sendid\":60,\"yfk_receiveid\":0,\"yfk_money\":\"200\",\"yfk_refedlid\":0,\"yfk_oddlid\":0,\"yfk_odid\":0,\"yfk_orderid\":\"\",\"yfk_odblid\":0,\"yfk_qty\":0,\"yfk_level\":0,\"yfk_addtime\":1531277003,\"yfk_remark\":\"111\",\"yfk_state\":1}', '1');
INSERT INTO `fw_log` VALUES ('1722', '1191', 'baiman', '3321', '手动增加余额：200', '1531277759', '58.63.138.160', '/mp/capital/yueadd_save', '{\"bl_unitcode\":\"3321\",\"bl_type\":1,\"bl_sendid\":0,\"bl_receiveid\":60,\"bl_money\":\"200\",\"bl_odid\":0,\"bl_orderid\":\"\",\"bl_odblid\":0,\"bl_addtime\":1531277759,\"bl_remark\":\"\\u5145\\u503c\",\"bl_state\":1,\"bl_rcid\":0}', '1');
INSERT INTO `fw_log` VALUES ('1723', '1191', 'baiman', '3321', '企业登录', '1531279449', '58.63.147.9', '/mp/login/logining', '', '1');
INSERT INTO `fw_log` VALUES ('1724', '1191', 'baiman', '3321', '企业登录', '1531295021', '117.136.68.217', '/mp/login/logining', '', '1');
INSERT INTO `fw_log` VALUES ('1725', '1191', 'baiman', '3321', '修改经销商级别', '1531295235', '117.136.68.217', '/mp/dealer/type_save', '{\"dlt_name\":\"\\u8054\\u5408\\u521b\\u59cb\\u4eba\",\"dlt_level\":1,\"dlt_fanli1\":0,\"dlt_fanli2\":0,\"dlt_fanli3\":0,\"dlt_fanli4\":0,\"dlt_fanli5\":0,\"dlt_fanli6\":0,\"dlt_fanli7\":0,\"dlt_fanli8\":0,\"dlt_fanli9\":0,\"dlt_fanli10\":0,\"dlt_firstquota\":\"0.00\",\"dlt_minnum\":\"3\"}', '1');
INSERT INTO `fw_log` VALUES ('1726', '1191', 'baiman', '3321', '修改经销商级别', '1531295261', '117.136.68.217', '/mp/dealer/type_save', '{\"dlt_name\":\"\\u6267\\u884c\\u8463\\u4e8b\",\"dlt_level\":2,\"dlt_fanli1\":0,\"dlt_fanli2\":0,\"dlt_fanli3\":0,\"dlt_fanli4\":0,\"dlt_fanli5\":0,\"dlt_fanli6\":0,\"dlt_fanli7\":0,\"dlt_fanli8\":0,\"dlt_fanli9\":0,\"dlt_fanli10\":0,\"dlt_firstquota\":\"0.00\",\"dlt_minnum\":\"3\"}', '1');
INSERT INTO `fw_log` VALUES ('1727', '1191', 'baiman', '3321', '修改经销商级别', '1531295284', '117.136.68.217', '/mp/dealer/type_save', '{\"dlt_name\":\"\\u5b98\\u7f51\\u4ee3\\u7406\",\"dlt_level\":3,\"dlt_fanli1\":0,\"dlt_fanli2\":0,\"dlt_fanli3\":0,\"dlt_fanli4\":0,\"dlt_fanli5\":0,\"dlt_fanli6\":0,\"dlt_fanli7\":0,\"dlt_fanli8\":0,\"dlt_fanli9\":0,\"dlt_fanli10\":0,\"dlt_firstquota\":\"0.00\",\"dlt_minnum\":\"0\"}', '1');
INSERT INTO `fw_log` VALUES ('1728', '1191', 'baiman', '3321', '修改经销商级别', '1531295298', '117.136.68.217', '/mp/dealer/type_save', '{\"dlt_name\":\"\\u94bb\\u77f3\\u4ee3\\u7406\",\"dlt_level\":4,\"dlt_fanli1\":0,\"dlt_fanli2\":0,\"dlt_fanli3\":0,\"dlt_fanli4\":0,\"dlt_fanli5\":0,\"dlt_fanli6\":0,\"dlt_fanli7\":0,\"dlt_fanli8\":0,\"dlt_fanli9\":0,\"dlt_fanli10\":0,\"dlt_firstquota\":\"0.00\",\"dlt_minnum\":\"0\"}', '1');
INSERT INTO `fw_log` VALUES ('1729', '1191', 'baiman', '3321', '修改产品', '1531295373', '117.136.68.217', '/mp/product/edit_save', '{\"pro_id\":16,\"pro_name\":\"\\u5141\\u7f8e\\u4ee3\\u9910\\u997c\\u5e72 15g*21\\u7247\",\"pro_number\":\"123\",\"pro_typeid\":19,\"pro_jftype\":1,\"pro_jifen\":0,\"pro_jfmax\":0,\"pro_dljf\":0,\"pro_desc\":\"\",\"pro_link\":\"\",\"pro_barcode\":\"\",\"pro_remark\":\"\",\"pro_price\":\"380\",\"pro_stock\":0,\"pro_units\":\"\\u76d2\",\"pro_dbiao\":0,\"pro_zbiao\":0,\"pro_xbiao\":0}', '1');
INSERT INTO `fw_log` VALUES ('1730', '1191', 'baiman', '3321', '修改产品价格体系', '1531295496', '117.136.68.217', '/mp/product/propriceedit_save', '[{\"dlt_id\":\"2\",\"dlt_unitcode\":\"3321\",\"dlt_name\":\"\\u8054\\u5408\\u521b\\u59cb\\u4eba\",\"dlt_level\":\"1\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"0.00\",\"dlt_minnum\":\"3\",\"priprice\":\"105\",\"pro_id\":\"16\"},{\"dlt_id\":\"3\",\"dlt_unitcode\":\"3321\",\"dlt_name\":\"\\u6267\\u884c\\u8463\\u4e8b\",\"dlt_level\":\"2\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"0.00\",\"dlt_minnum\":\"3\",\"priprice\":\"152\",\"pro_id\":\"16\"},{\"dlt_id\":\"4\",\"dlt_unitcode\":\"3321\",\"dlt_name\":\"\\u5b98\\u7f51\\u4ee3\\u7406\",\"dlt_level\":\"3\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"0.00\",\"dlt_minnum\":\"0\",\"priprice\":0,\"pro_id\":\"16\"},{\"dlt_id\":\"5\",\"dlt_unitcode\":\"3321\",\"dlt_name\":\"\\u94bb\\u77f3\\u4ee3\\u7406\",\"dlt_level\":\"4\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"0.00\",\"dlt_minnum\":\"0\",\"priprice\":0,\"pro_id\":\"16\"}]', '1');
INSERT INTO `fw_log` VALUES ('1731', '1191', 'baiman', '3321', '删除经销商分类', '1531295517', '117.136.68.217', '/mp/dealer/dltdel/dlt_id/4', '{\"dlt_id\":\"4\",\"dlt_unitcode\":\"3321\",\"dlt_name\":\"\\u5b98\\u7f51\\u4ee3\\u7406\",\"dlt_level\":\"3\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"0.00\",\"dlt_minnum\":\"0\"}', '1');
INSERT INTO `fw_log` VALUES ('1732', '1191', 'baiman', '3321', '删除经销商分类', '1531295522', '117.136.68.217', '/mp/dealer/dltdel/dlt_id/5', '{\"dlt_id\":\"5\",\"dlt_unitcode\":\"3321\",\"dlt_name\":\"\\u94bb\\u77f3\\u4ee3\\u7406\",\"dlt_level\":\"4\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"0.00\",\"dlt_minnum\":\"0\"}', '1');
INSERT INTO `fw_log` VALUES ('1733', '1191', 'baiman', '3321', '删除订单', '1531295561', '117.136.68.217', '/mp/orders/deleteorder/od_id/45', '{\"od_id\":\"45\",\"od_unitcode\":\"3321\",\"od_orderid\":\"201807111056214230\",\"od_total\":\"360.00\",\"od_addtime\":\"1531277781\",\"od_oddlid\":\"60\",\"od_contact\":\"\\u6f58\\u751f\",\"od_addressid\":\"45\",\"od_sheng\":\"44\",\"od_shi\":\"4401\",\"od_qu\":\"440103\",\"od_jie\":\"0\",\"od_address\":\"\\u5e7f\\u4e1c\\u7701\\u5e7f\\u5dde\\u5e02\\u8354\\u6e7e\\u533a\",\"od_tel\":\"18122734809\",\"od_express\":\"0\",\"od_expressnum\":\"\",\"od_expressdate\":\"0\",\"od_remark\":null,\"od_state\":\"9\",\"od_stead\":\"0\",\"od_blid\":\"6\",\"od_paymode\":\"1\"}', '1');
INSERT INTO `fw_log` VALUES ('1734', '61', '6540811', '3321', '代理商注册', '1531296010', '117.136.68.217', '/baiman/apply/index', '{\"dl_username\":\"6540811\",\"dl_pwd\":\"9fa93775354c25a9fd5b2e09e985d7ba\",\"dl_number\":\"\",\"dl_unitcode\":\"3321\",\"dl_name\":\"\\u6234\\u6653\",\"dl_contact\":\"\\u6234\\u6653\",\"dl_tel\":\"13564690205\",\"dl_idcard\":\"320321198808020726\",\"dl_idcardpic\":\"\",\"dl_idcardpic2\":\"\",\"dl_tbdian\":\"\",\"dl_tbzhanggui\":\"\",\"dl_addtime\":1531296010,\"dl_status\":0,\"dl_level\":\"1\",\"dl_type\":2,\"dl_sttype\":0,\"dl_belong\":0,\"dl_referee\":\"60\",\"dl_remark\":\"\",\"dl_address\":\"\\u6c5f\\u82cf\\u7701\\u5f90\\u5dde\\u5e02\\u7762\\u5b81\\u53bf\",\"dl_sheng\":\"32\",\"dl_shi\":\"3203\",\"dl_qu\":\"320324\",\"dl_qustr\":\"\\u6c5f\\u82cf\\u7701\\u5f90\\u5dde\\u5e02\\u7762\\u5b81\\u53bf\",\"dl_openid\":\"\",\"dl_weixin\":\"6540811\",\"dl_wxnickname\":\"\",\"dl_wxsex\":0,\"dl_wxprovince\":\"\",\"dl_wxcity\":\"\",\"dl_wxcountry\":\"\",\"dl_wxheadimg\":\"\",\"dl_brand\":\"\",\"dl_brandlevel\":\"\"}', '2');
INSERT INTO `fw_log` VALUES ('1735', '1191', 'baiman', '3321', '修改经销商', '1531296056', '117.136.68.217', '/mp/dealer/edit_save', '{\"dl_id\":61,\"dl_number\":\"No:007701\",\"dl_name\":\"\\u6234\\u6653\",\"dl_area\":\"\",\"dl_contact\":\"\\u6234\\u6653\",\"dl_tel\":\"13564690205\",\"dl_fax\":\"\",\"dl_address\":\"\\u6c5f\\u82cf\\u7701\\u5f90\\u5dde\\u5e02\\u7762\\u5b81\\u53bf\",\"dl_email\":\"\",\"dl_qq\":\"\",\"dl_idcard\":\"320321198808020726\",\"dl_remark\":\"\",\"dl_des\":\"\",\"dl_weixin\":\"6540811\",\"dl_pwd\":\"c56d0e9a7ccec67b4ea131655038d604\"}', '1');
INSERT INTO `fw_log` VALUES ('1736', '61', '6540811', '3321', '经销商账号登录', '1531296270', '117.136.68.217', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('1737', '62', '297261647', '3321', '代理商注册', '1531296463', '36.60.3.35', '/baiman/dealer/apply', '{\"dl_username\":\"297261647\",\"dl_pwd\":\"ee4f9d70cb3205f10a35ef38b9aa710a\",\"dl_number\":\"\",\"dl_unitcode\":\"3321\",\"dl_name\":\"\\u6234\\u7ef4\\u519b\",\"dl_contact\":\"\\u6234\\u7ef4\\u519b\",\"dl_tel\":\"15000867809\",\"dl_idcard\":\"320324199012060696\",\"dl_idcardpic\":\"\",\"dl_idcardpic2\":\"\",\"dl_tbdian\":\"\",\"dl_tbzhanggui\":\"\",\"dl_addtime\":1531296463,\"dl_status\":0,\"dl_level\":\"2\",\"dl_type\":3,\"dl_sttype\":0,\"dl_belong\":\"61\",\"dl_referee\":61,\"dl_remark\":\"\",\"dl_address\":\"\\u6c5f\\u82cf\\u7701\\u5f90\\u5dde\\u5e02\\u7762\\u5b81\\u53bf\",\"dl_sheng\":\"32\",\"dl_shi\":\"3203\",\"dl_qu\":\"320324\",\"dl_qustr\":\"\\u6c5f\\u82cf\\u7701\\u5f90\\u5dde\\u5e02\\u7762\\u5b81\\u53bf\",\"dl_openid\":\"\",\"dl_weixin\":\"297261647\",\"dl_wxnickname\":\"\",\"dl_wxsex\":0,\"dl_wxprovince\":\"\",\"dl_wxcity\":\"\",\"dl_wxcountry\":\"\",\"dl_wxheadimg\":\"\",\"dl_brand\":\"\",\"dl_brandlevel\":\"\"}', '2');
INSERT INTO `fw_log` VALUES ('1738', '62', '297261647', '3321', '经销商账号登录', '1531296562', '36.60.3.35', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('1739', '1191', 'baiman', '3321', '修改产品类型', '1531297142', '117.136.68.217', '/mp/product/typeedit_save', '{\"protype_id\":19,\"protype_name\":\"\\u5141\\u7f8e\",\"protype_iswho\":\"0\"}', '1');
INSERT INTO `fw_log` VALUES ('1740', '1191', 'baiman', '3321', '企业登录', '1531297150', '58.63.147.9', '/mp/login/logining', '', '1');
INSERT INTO `fw_log` VALUES ('1741', '1191', 'baiman', '3321', '添加子用户', '1531297213', '58.63.147.9', '/mp/subuser/subuseradd_save', '{\"su_purview\":\"\",\"su_unitcode\":\"3321\",\"su_username\":\"ruku\",\"su_pwd\":\"c56d0e9a7ccec67b4ea131655038d604\",\"su_name\":\"\\u5165\\u5e93\",\"su_belong\":0,\"su_logintime\":0,\"su_status\":1}', '1');
INSERT INTO `fw_log` VALUES ('1742', '1191', 'baiman', '3321', '修改产品', '1531297356', '117.136.68.217', '/mp/product/edit_save', '{\"pro_id\":16,\"pro_name\":\"\\u5141\\u7f8e\\u4ee3\\u9910\\u997c\\u5e72 15g*21\\u7247\",\"pro_number\":\"\\u51cf\\u4e4b\\u5708\",\"pro_typeid\":19,\"pro_jftype\":1,\"pro_jifen\":0,\"pro_jfmax\":0,\"pro_dljf\":0,\"pro_desc\":\"\",\"pro_link\":\"\",\"pro_barcode\":\"\",\"pro_remark\":\"\",\"pro_price\":\"380.00\",\"pro_stock\":0,\"pro_units\":\"\\u76d2\",\"pro_dbiao\":0,\"pro_zbiao\":0,\"pro_xbiao\":0}', '1');
INSERT INTO `fw_log` VALUES ('1743', '1191', 'baiman', '3321', '手动增加余额：99000090', '1531297825', '117.136.68.217', '/mp/capital/yueadd_save', '{\"bl_unitcode\":\"3321\",\"bl_type\":1,\"bl_sendid\":0,\"bl_receiveid\":62,\"bl_money\":\"99000090\",\"bl_odid\":0,\"bl_orderid\":\"\",\"bl_odblid\":0,\"bl_addtime\":1531297825,\"bl_remark\":\"baiman\",\"bl_state\":1,\"bl_rcid\":0}', '1');
INSERT INTO `fw_log` VALUES ('1744', '1191', 'baiman', '3321', '手动减少余额：9999999', '1531298079', '117.136.68.217', '/mp/capital/yueadd_save', '{\"bl_unitcode\":\"3321\",\"bl_type\":1,\"bl_sendid\":62,\"bl_receiveid\":0,\"bl_money\":\"9999999\",\"bl_odid\":0,\"bl_orderid\":\"\",\"bl_odblid\":0,\"bl_addtime\":1531298079,\"bl_remark\":\"baiman\",\"bl_state\":1,\"bl_rcid\":0}', '1');
INSERT INTO `fw_log` VALUES ('1745', '1191', 'baiman', '3321', '手动减少余额：89000000', '1531298104', '117.136.68.217', '/mp/capital/yueadd_save', '{\"bl_unitcode\":\"3321\",\"bl_type\":1,\"bl_sendid\":62,\"bl_receiveid\":0,\"bl_money\":\"89000000\",\"bl_odid\":0,\"bl_orderid\":\"\",\"bl_odblid\":0,\"bl_addtime\":1531298104,\"bl_remark\":\"baiman\",\"bl_state\":1,\"bl_rcid\":0}', '1');
INSERT INTO `fw_log` VALUES ('1746', '60', '18122734809', '3321', '经销商账号登录', '1531298744', '58.63.147.9', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('1747', '7', 'baiman:ruku', '3321', '企业APP子用户登录', '1531298989', '58.63.147.9', '/zxapi/login/index', '{\"su_id\":\"7\",\"su_unitcode\":\"3321\",\"su_username\":\"ruku\",\"su_pwd\":\"c56d0e9a7ccec67b4ea131655038d604\",\"su_openid\":null,\"su_wxnickname\":null,\"su_wxsex\":\"0\",\"su_wxprovince\":null,\"su_wxcity\":null,\"su_wxcountry\":null,\"su_wxheadimg\":null,\"su_weixin\":null,\"su_name\":\"\\u5165\\u5e93\",\"su_logintime\":\"0\",\"su_errlogintime\":null,\"su_errtimes\":null,\"su_remark\":null,\"su_status\":\"1\",\"su_belong\":\"0\",\"su_purview\":\"\"}', '1');
INSERT INTO `fw_log` VALUES ('1748', '1191', 'baiman', '3321', '手动增加余额：10000', '1531299149', '117.136.68.217', '/mp/capital/yueadd_save', '{\"bl_unitcode\":\"3321\",\"bl_type\":1,\"bl_sendid\":0,\"bl_receiveid\":61,\"bl_money\":\"10000\",\"bl_odid\":0,\"bl_orderid\":\"\",\"bl_odblid\":0,\"bl_addtime\":1531299149,\"bl_remark\":\"baiman\",\"bl_state\":1,\"bl_rcid\":0}', '1');
INSERT INTO `fw_log` VALUES ('1749', '1191', 'baiman', '3321', '添加子用户', '1531300222', '58.63.147.9', '/mp/subuser/subuseradd_save', '{\"su_purview\":\"\",\"su_unitcode\":\"3321\",\"su_username\":\"ruku\",\"su_pwd\":\"c56d0e9a7ccec67b4ea131655038d604\",\"su_name\":\"\\u5165\\u5e93\",\"su_belong\":0,\"su_logintime\":0,\"su_status\":1}', '1');
INSERT INTO `fw_log` VALUES ('1750', '8', 'baiman:ruku', '3321', '企业APP子用户登录', '1531300290', '58.63.147.9', '/zxapi/login/index', '{\"su_id\":\"8\",\"su_unitcode\":\"3321\",\"su_username\":\"ruku\",\"su_pwd\":\"c56d0e9a7ccec67b4ea131655038d604\",\"su_openid\":null,\"su_wxnickname\":null,\"su_wxsex\":\"0\",\"su_wxprovince\":null,\"su_wxcity\":null,\"su_wxcountry\":null,\"su_wxheadimg\":null,\"su_weixin\":null,\"su_name\":\"\\u5165\\u5e93\",\"su_logintime\":\"0\",\"su_errlogintime\":null,\"su_errtimes\":null,\"su_remark\":null,\"su_status\":\"1\",\"su_belong\":\"0\",\"su_purview\":\"\"}', '1');
INSERT INTO `fw_log` VALUES ('1751', '1191', 'baiman', '3321', '修改子用户', '1531301337', '58.63.147.9', '/mp/subuser/subuseradd_save', '{\"su_name\":\"\\u51fa\\u5e93\",\"su_purview\":\"\"}', '1');
INSERT INTO `fw_log` VALUES ('1752', '8', 'baiman:chuku', '3321', '企业APP子用户登录', '1531301392', '58.63.147.9', '/zxapi/login/index', '{\"su_id\":\"8\",\"su_unitcode\":\"3321\",\"su_username\":\"chuku\",\"su_pwd\":\"c56d0e9a7ccec67b4ea131655038d604\",\"su_openid\":null,\"su_wxnickname\":null,\"su_wxsex\":\"0\",\"su_wxprovince\":null,\"su_wxcity\":null,\"su_wxcountry\":null,\"su_wxheadimg\":null,\"su_weixin\":null,\"su_name\":\"\\u51fa\\u5e93\",\"su_logintime\":\"1531300290\",\"su_errlogintime\":\"1531300290\",\"su_errtimes\":\"0\",\"su_remark\":null,\"su_status\":\"1\",\"su_belong\":\"0\",\"su_purview\":\"\"}', '1');
INSERT INTO `fw_log` VALUES ('1753', '8', 'baiman:chuku', '3321', '出货导入', '1531301519', '58.63.147.9', '/zxapi/order/odshipscanres_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201807111011567102\",\"ship_deliver\":0,\"ship_dealer\":\"60\",\"ship_pro\":\"16\",\"ship_odid\":44,\"ship_odblid\":44,\"ship_oddtid\":55,\"ship_whid\":7,\"ship_proqty\":1,\"ship_barcode\":\"1000332426\",\"ship_date\":1531301519,\"ship_ucode\":\"10003324\",\"ship_tcode\":\"10003324\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"8\",\"ship_czuser\":\"baiman:chuku\"}', '1');
INSERT INTO `fw_log` VALUES ('1754', '8', 'baiman:chuku', '3321', '企业APP子用户登录', '1531302010', '58.63.147.9', '/zxapi/login/index', '{\"su_id\":\"8\",\"su_unitcode\":\"3321\",\"su_username\":\"chuku\",\"su_pwd\":\"c56d0e9a7ccec67b4ea131655038d604\",\"su_openid\":null,\"su_wxnickname\":null,\"su_wxsex\":\"0\",\"su_wxprovince\":null,\"su_wxcity\":null,\"su_wxcountry\":null,\"su_wxheadimg\":null,\"su_weixin\":null,\"su_name\":\"\\u51fa\\u5e93\",\"su_logintime\":\"1531301392\",\"su_errlogintime\":\"1531301392\",\"su_errtimes\":\"0\",\"su_remark\":null,\"su_status\":\"1\",\"su_belong\":\"0\",\"su_purview\":\"\"}', '1');
INSERT INTO `fw_log` VALUES ('1755', '8', 'baiman:chuku', '3321', '出货导入', '1531302921', '58.63.147.9', '/zxapi/order/odshipscanres_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201807111753495993\",\"ship_deliver\":0,\"ship_dealer\":\"60\",\"ship_pro\":\"16\",\"ship_odid\":49,\"ship_odblid\":49,\"ship_oddtid\":60,\"ship_whid\":7,\"ship_proqty\":1,\"ship_barcode\":\"1000332413\",\"ship_date\":1531302921,\"ship_ucode\":\"10003324\",\"ship_tcode\":\"10003324\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"8\",\"ship_czuser\":\"baiman:chuku\"}', '1');
INSERT INTO `fw_log` VALUES ('1756', '8', 'baiman:chuku', '3321', '删除出货记录', '1531303552', '58.63.147.9', '/zxapi/order/deleteFhjl', '{\"ship_id\":\"113\",\"ship_unitcode\":\"3321\",\"ship_number\":\"201807111753495993\",\"ship_deliver\":\"0\",\"ship_dealer\":\"60\",\"ship_pro\":\"16\",\"ship_odid\":\"49\",\"ship_odblid\":\"49\",\"ship_whid\":\"7\",\"ship_proqty\":\"1\",\"ship_barcode\":\"1000332413\",\"ship_ucode\":\"10003324\",\"ship_tcode\":\"10003324\",\"ship_date\":\"1531302921\",\"ship_remark\":\"\",\"ship_cztype\":\"0\",\"ship_czid\":\"8\",\"ship_czuser\":\"baiman:chuku\",\"ship_prodate\":null,\"ship_batchnum\":null,\"ship_status\":\"0\"}', '1');
INSERT INTO `fw_log` VALUES ('1757', '8', 'baiman:chuku', '3321', '出货导入', '1531303719', '58.63.147.9', '/zxapi/order/odshipscanres_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201807111753495993\",\"ship_deliver\":0,\"ship_dealer\":\"60\",\"ship_pro\":\"16\",\"ship_odid\":49,\"ship_odblid\":49,\"ship_oddtid\":60,\"ship_whid\":7,\"ship_proqty\":1,\"ship_barcode\":\"1000332416\",\"ship_date\":1531303719,\"ship_ucode\":\"10003324\",\"ship_tcode\":\"10003324\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"8\",\"ship_czuser\":\"baiman:chuku\"}', '1');
INSERT INTO `fw_log` VALUES ('1758', '8', 'baiman:chuku', '3321', '企业APP子用户登录', '1531304528', '58.63.147.9', '/zxapi/login/index', '{\"su_id\":\"8\",\"su_unitcode\":\"3321\",\"su_username\":\"chuku\",\"su_pwd\":\"c56d0e9a7ccec67b4ea131655038d604\",\"su_openid\":null,\"su_wxnickname\":null,\"su_wxsex\":\"0\",\"su_wxprovince\":null,\"su_wxcity\":null,\"su_wxcountry\":null,\"su_wxheadimg\":null,\"su_weixin\":null,\"su_name\":\"\\u51fa\\u5e93\",\"su_logintime\":\"1531302010\",\"su_errlogintime\":\"1531302010\",\"su_errtimes\":\"0\",\"su_remark\":null,\"su_status\":\"1\",\"su_belong\":\"0\",\"su_purview\":\"\"}', '1');
INSERT INTO `fw_log` VALUES ('1759', '8', 'baiman:chuku', '3321', '出货导入', '1531304713', '58.63.147.9', '/zxapi/order/odshipscanres_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201807111753495993\",\"ship_deliver\":0,\"ship_dealer\":\"60\",\"ship_pro\":\"16\",\"ship_odid\":49,\"ship_odblid\":49,\"ship_oddtid\":60,\"ship_whid\":7,\"ship_proqty\":1,\"ship_barcode\":\"1000332403\",\"ship_date\":1531304713,\"ship_ucode\":\"10003324\",\"ship_tcode\":\"10003324\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"8\",\"ship_czuser\":\"baiman:chuku\"}', '1');
INSERT INTO `fw_log` VALUES ('1760', '8', 'baiman:chuku', '3321', '出货导入', '1531305692', '58.63.147.9', '/zxapi/order/odshipscanres_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201807111753495993\",\"ship_deliver\":0,\"ship_dealer\":\"60\",\"ship_pro\":\"16\",\"ship_odid\":49,\"ship_odblid\":49,\"ship_oddtid\":60,\"ship_whid\":7,\"ship_proqty\":1,\"ship_barcode\":\"1000332330\",\"ship_date\":1531305692,\"ship_ucode\":\"10003323\",\"ship_tcode\":\"10003323\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"8\",\"ship_czuser\":\"baiman:chuku\"}', '1');
INSERT INTO `fw_log` VALUES ('1761', '1191', 'baiman', '3321', '企业登录', '1531307100', '58.63.147.9', '/mp/login/logining', '', '1');
INSERT INTO `fw_log` VALUES ('1762', '60', '18122734809', '3321', '经销商账号登录', '1531307457', '58.63.147.9', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('1763', '8', 'baiman:chuku', '3321', '企业APP子用户登录', '1531308345', '58.63.147.9', '/zxapi/login/index', '{\"su_id\":\"8\",\"su_unitcode\":\"3321\",\"su_username\":\"chuku\",\"su_pwd\":\"c56d0e9a7ccec67b4ea131655038d604\",\"su_openid\":null,\"su_wxnickname\":null,\"su_wxsex\":\"0\",\"su_wxprovince\":null,\"su_wxcity\":null,\"su_wxcountry\":null,\"su_wxheadimg\":null,\"su_weixin\":null,\"su_name\":\"\\u51fa\\u5e93\",\"su_logintime\":\"1531304528\",\"su_errlogintime\":\"1531304528\",\"su_errtimes\":\"0\",\"su_remark\":null,\"su_status\":\"1\",\"su_belong\":\"0\",\"su_purview\":\"\"}', '1');
INSERT INTO `fw_log` VALUES ('1764', '8', 'baiman:chuku', '3321', '出货导入', '1531308497', '58.63.147.9', '/zxapi/order/odshipscanres_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201807111753495993\",\"ship_deliver\":0,\"ship_dealer\":\"60\",\"ship_pro\":\"16\",\"ship_odid\":49,\"ship_odblid\":49,\"ship_oddtid\":60,\"ship_whid\":7,\"ship_proqty\":1,\"ship_barcode\":\"1000332418\",\"ship_date\":1531308497,\"ship_ucode\":\"10003324\",\"ship_tcode\":\"10003324\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"8\",\"ship_czuser\":\"baiman:chuku\"}', '1');
INSERT INTO `fw_log` VALUES ('1765', '8', 'baiman:chuku', '3321', '企业APP子用户登录', '1531308997', '58.63.147.9', '/zxapi/login/index', '{\"su_id\":\"8\",\"su_unitcode\":\"3321\",\"su_username\":\"chuku\",\"su_pwd\":\"c56d0e9a7ccec67b4ea131655038d604\",\"su_openid\":null,\"su_wxnickname\":null,\"su_wxsex\":\"0\",\"su_wxprovince\":null,\"su_wxcity\":null,\"su_wxcountry\":null,\"su_wxheadimg\":null,\"su_weixin\":null,\"su_name\":\"\\u51fa\\u5e93\",\"su_logintime\":\"1531308345\",\"su_errlogintime\":\"1531308345\",\"su_errtimes\":\"0\",\"su_remark\":null,\"su_status\":\"1\",\"su_belong\":\"0\",\"su_purview\":\"\"}', '1');
INSERT INTO `fw_log` VALUES ('1766', '8', 'baiman:chuku', '3321', '出货导入', '1531309069', '58.63.147.9', '/zxapi/order/odshipscanres_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201807111753495993\",\"ship_deliver\":0,\"ship_dealer\":\"60\",\"ship_pro\":\"16\",\"ship_odid\":49,\"ship_odblid\":49,\"ship_oddtid\":60,\"ship_whid\":7,\"ship_proqty\":1,\"ship_barcode\":\"1000332433\",\"ship_date\":1531309069,\"ship_ucode\":\"10003324\",\"ship_tcode\":\"10003324\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"8\",\"ship_czuser\":\"baiman:chuku\"}', '1');
INSERT INTO `fw_log` VALUES ('1767', '1191', 'baiman', '3321', '企业登录', '1531309830', '180.123.220.80', '/mp/login/logining', '', '1');
INSERT INTO `fw_log` VALUES ('1768', '1191', 'baiman', '3321', '修改经销商级别', '1531310215', '180.123.220.80', '/mp/dealer/type_save', '{\"dlt_name\":\"\\u7ba1\\u7406\\u5458\",\"dlt_level\":1,\"dlt_fanli1\":0,\"dlt_fanli2\":0,\"dlt_fanli3\":0,\"dlt_fanli4\":0,\"dlt_fanli5\":0,\"dlt_fanli6\":0,\"dlt_fanli7\":0,\"dlt_fanli8\":0,\"dlt_fanli9\":0,\"dlt_fanli10\":0,\"dlt_firstquota\":\"0.00\",\"dlt_minnum\":\"3\"}', '1');
INSERT INTO `fw_log` VALUES ('1769', '1191', 'baiman', '3321', '修改产品', '1531311279', '180.123.220.80', '/mp/product/edit_save', '{\"pro_id\":16,\"pro_name\":\"\\u5141\\u7f8e\\u4ee3\\u9910\\u997c\\u5e72 15g*21\\u7247\",\"pro_number\":\"\\u51cf\\u4e4b\\u5708\",\"pro_typeid\":19,\"pro_jftype\":1,\"pro_jifen\":0,\"pro_jfmax\":0,\"pro_dljf\":0,\"pro_desc\":\"\",\"pro_link\":\"\",\"pro_barcode\":\"\",\"pro_remark\":\"\",\"pro_price\":\"380.00\",\"pro_stock\":0,\"pro_units\":\"\\u7bb1\",\"pro_dbiao\":0,\"pro_zbiao\":0,\"pro_xbiao\":0}', '1');
INSERT INTO `fw_log` VALUES ('1770', '1191', 'baiman', '3321', '修改产品价格体系', '1531311320', '180.123.220.80', '/mp/product/propriceedit_save', '[{\"dlt_id\":\"2\",\"dlt_unitcode\":\"3321\",\"dlt_name\":\"\\u7ba1\\u7406\\u5458\",\"dlt_level\":\"1\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"0.00\",\"dlt_minnum\":\"3\",\"priprice\":\"2100\",\"pro_id\":\"16\"},{\"dlt_id\":\"3\",\"dlt_unitcode\":\"3321\",\"dlt_name\":\"\\u6267\\u884c\\u8463\\u4e8b\",\"dlt_level\":\"2\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"0.00\",\"dlt_minnum\":\"3\",\"priprice\":\"3040\",\"pro_id\":\"16\"}]', '1');
INSERT INTO `fw_log` VALUES ('1771', '1191', 'baiman', '3321', '修改产品', '1531311354', '180.123.220.80', '/mp/product/edit_save', '{\"pro_id\":16,\"pro_name\":\"\\u5141\\u7f8e\\u4ee3\\u9910\\u997c\\u5e72 15g*21\\u7247\",\"pro_number\":\"\\u51cf\\u4e4b\\u5708\",\"pro_typeid\":19,\"pro_jftype\":1,\"pro_jifen\":0,\"pro_jfmax\":0,\"pro_dljf\":0,\"pro_desc\":\"\",\"pro_link\":\"\",\"pro_barcode\":\"\",\"pro_remark\":\"\",\"pro_price\":\"7600\",\"pro_stock\":0,\"pro_units\":\"\\u7bb1\",\"pro_dbiao\":0,\"pro_zbiao\":0,\"pro_xbiao\":0}', '1');
INSERT INTO `fw_log` VALUES ('1772', '1191', 'baiman', '3321', '修改产品', '1531311439', '180.123.220.80', '/mp/product/edit_save', '{\"pro_id\":16,\"pro_name\":\"\\u5141\\u7f8e\\u4ee3\\u9910\\u997c\\u5e72 21\\u7247*20\\u76d2\",\"pro_number\":\"\\u51cf\\u4e4b\\u5708\",\"pro_typeid\":19,\"pro_jftype\":1,\"pro_jifen\":0,\"pro_jfmax\":0,\"pro_dljf\":0,\"pro_desc\":\"\",\"pro_link\":\"\",\"pro_barcode\":\"\",\"pro_remark\":\"\",\"pro_price\":\"7600.00\",\"pro_stock\":0,\"pro_units\":\"\\u7bb1\",\"pro_dbiao\":0,\"pro_zbiao\":0,\"pro_xbiao\":0}', '1');
INSERT INTO `fw_log` VALUES ('1773', '61', '6540811', '3321', '经销商账号登录', '1531320181', '121.233.39.178', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('1774', '61', '6540811', '3321', '经销商账号登录', '1531358424', '121.233.39.178', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('1775', '1191', 'baiman', '3321', '企业登录', '1531360311', '58.63.147.95', '/mp/login/logining', '', '1');
INSERT INTO `fw_log` VALUES ('1776', '60', '18122734809', '3321', '经销商账号登录', '1531360468', '58.63.147.95', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('1777', '1191', 'baiman', '3321', '企业登录', '1531360493', '58.63.146.245', '/mp/login/logining', '', '1');
INSERT INTO `fw_log` VALUES ('1778', '1191', 'baiman', '3321', '企业登录', '1531360881', '58.63.147.95', '/mp/login/logining', '', '1');
INSERT INTO `fw_log` VALUES ('1779', '1191', 'baiman', '3321', '企业登录', '1531374275', '180.123.220.22', '/mp/login/logining', '', '1');
INSERT INTO `fw_log` VALUES ('1780', '1191', 'baiman', '3321', '删除订单', '1531374287', '180.123.220.22', '/mp/orders/deleteorder/od_id/50', '{\"od_id\":\"50\",\"od_unitcode\":\"3321\",\"od_orderid\":\"201807112013422741\",\"od_total\":\"6300.00\",\"od_addtime\":\"1531311222\",\"od_oddlid\":\"61\",\"od_contact\":\"\\u6234\\u6653\",\"od_addressid\":\"46\",\"od_sheng\":\"32\",\"od_shi\":\"3203\",\"od_qu\":\"320324\",\"od_jie\":\"0\",\"od_address\":\"\\u6c5f\\u82cf\\u7701\\u5f90\\u5dde\\u5e02\\u7762\\u5b81\\u53bf\",\"od_tel\":\"13564690205\",\"od_express\":\"0\",\"od_expressnum\":\"\",\"od_expressdate\":\"0\",\"od_remark\":null,\"od_state\":\"9\",\"od_stead\":\"0\",\"od_blid\":\"0\",\"od_paymode\":\"0\"}', '1');
INSERT INTO `fw_log` VALUES ('1781', '60', '18122734809', '3321', '经销商账号登录', '1531384185', '58.63.147.95', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('1782', '62', '297261647', '3321', '经销商账号登录', '1531386934', '180.123.220.22', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('1783', '1191', 'baiman', '3321', '修改产品', '1531388188', '58.63.147.95', '/mp/product/edit_save', '{\"pro_id\":16,\"pro_name\":\"\\u5141\\u7f8e\\u4ee3\\u9910\\u997c\\u5e72 21\\u7247*20\\u76d2\",\"pro_number\":\"\\u51cf\\u4e4b\\u5708\",\"pro_typeid\":19,\"pro_jftype\":1,\"pro_jifen\":0,\"pro_jfmax\":0,\"pro_dljf\":0,\"pro_desc\":\"\",\"pro_link\":\"\",\"pro_barcode\":\"\",\"pro_remark\":\"\",\"pro_price\":\"7600.00\",\"pro_stock\":0,\"pro_units\":\"\\u7bb1\",\"pro_dbiao\":1,\"pro_zbiao\":0,\"pro_xbiao\":20}', '1');
INSERT INTO `fw_log` VALUES ('1784', '1191', 'baiman', '3321', '企业登录', '1531393534', '58.63.146.245', '/mp/login/logining', '', '1');
INSERT INTO `fw_log` VALUES ('1785', '60', '18122734809', '3321', '经销商账号登录', '1531393593', '58.63.146.245', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('1786', '60', '18122734809', '3321', '经销商账号登录', '1531394095', '58.63.146.245', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('1787', '61', '6540811', '3321', '经销商账号登录', '1531397989', '180.123.220.22', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('1788', '61', '6540811', '3321', '经销商账号登录', '1531446731', '58.218.14.146', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('1789', '60', '18122734809', '3321', '经销商账号登录', '1531451347', '113.109.120.88', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('1790', '1191', 'baiman', '3321', '企业登录', '1531451382', '113.109.120.88', '/mp/login/logining', '', '1');
INSERT INTO `fw_log` VALUES ('1791', '63', '156988556', '3321', '代理商注册', '1531452105', '180.123.220.22', '/baiman/dealer/apply', '{\"dl_username\":\"156988556\",\"dl_pwd\":\"7a2f8cfac5baa23152cc991493d33fe2\",\"dl_number\":\"\",\"dl_unitcode\":\"3321\",\"dl_name\":\"dxd\",\"dl_contact\":\"dxd\",\"dl_tel\":\"15000867802\",\"dl_idcard\":\"320324198802010555\",\"dl_idcardpic\":\"\",\"dl_idcardpic2\":\"\",\"dl_tbdian\":\"\",\"dl_tbzhanggui\":\"\",\"dl_addtime\":1531452105,\"dl_status\":0,\"dl_level\":\"2\",\"dl_type\":3,\"dl_sttype\":0,\"dl_belong\":\"60\",\"dl_referee\":60,\"dl_remark\":\"\",\"dl_address\":\"\\u5c71\\u897f\\u7701\\u664b\\u57ce\\u5e02\\u9ad8\\u5e73\\u5e02\",\"dl_sheng\":\"14\",\"dl_shi\":\"1405\",\"dl_qu\":\"140581\",\"dl_qustr\":\"\\u5c71\\u897f\\u7701\\u664b\\u57ce\\u5e02\\u9ad8\\u5e73\\u5e02\",\"dl_openid\":\"\",\"dl_weixin\":\"156988556\",\"dl_wxnickname\":\"\",\"dl_wxsex\":0,\"dl_wxprovince\":\"\",\"dl_wxcity\":\"\",\"dl_wxcountry\":\"\",\"dl_wxheadimg\":\"\",\"dl_brand\":\"\",\"dl_brandlevel\":\"\"}', '2');
INSERT INTO `fw_log` VALUES ('1792', '1191', 'baiman', '3321', '企业登录', '1531463598', '180.123.220.22', '/mp/login/logining', '', '1');
INSERT INTO `fw_log` VALUES ('1793', '1191', 'baiman', '3321', '修改经销商级别', '1531463650', '180.123.220.22', '/mp/dealer/type_save', '{\"dlt_name\":\"\\u7ba1\\u7406\\u8d26\\u53f7\",\"dlt_level\":1,\"dlt_fanli1\":0,\"dlt_fanli2\":0,\"dlt_fanli3\":0,\"dlt_fanli4\":0,\"dlt_fanli5\":0,\"dlt_fanli6\":0,\"dlt_fanli7\":0,\"dlt_fanli8\":0,\"dlt_fanli9\":0,\"dlt_fanli10\":0,\"dlt_firstquota\":\"0.00\",\"dlt_minnum\":\"3\"}', '1');
INSERT INTO `fw_log` VALUES ('1794', '1191', 'baiman', '3321', '删除经销商', '1531464122', '180.123.220.22', '/mp/dealer/delete/dl_id/63', '{\"dl_id\":\"63\",\"dl_unitcode\":\"3321\",\"dl_openid\":\"\",\"dl_username\":\"156988556\",\"dl_pwd\":\"7a2f8cfac5baa23152cc991493d33fe2\",\"dl_number\":\"No:007703\",\"dl_name\":\"dxd\",\"dl_des\":null,\"dl_area\":null,\"dl_type\":\"3\",\"dl_sttype\":\"0\",\"dl_belong\":\"60\",\"dl_referee\":\"60\",\"dl_level\":\"2\",\"dl_contact\":\"dxd\",\"dl_tel\":\"15000867802\",\"dl_fax\":null,\"dl_email\":null,\"dl_weixin\":\"156988556\",\"dl_wxnickname\":\"\",\"dl_wxsex\":\"0\",\"dl_wxprovince\":\"\",\"dl_wxcity\":\"\",\"dl_wxcountry\":\"\",\"dl_wxheadimg\":\"\",\"dl_qq\":null,\"dl_country\":\"0\",\"dl_sheng\":\"14\",\"dl_shi\":\"1405\",\"dl_qu\":\"140581\",\"dl_qustr\":\"\\u5c71\\u897f\\u7701\\u664b\\u57ce\\u5e02\\u9ad8\\u5e73\\u5e02\",\"dl_address\":\"\\u5c71\\u897f\\u7701\\u664b\\u57ce\\u5e02\\u9ad8\\u5e73\\u5e02\",\"dl_idcard\":\"320324198802010555\",\"dl_idcardpic\":\"\",\"dl_idcardpic2\":\"\",\"dl_tbdian\":\"\",\"dl_tbzhanggui\":\"\",\"dl_tbsqpic\":null,\"dl_tblevel\":null,\"dl_remark\":\"\",\"dl_status\":\"0\",\"dl_startdate\":null,\"dl_enddate\":null,\"dl_addtime\":\"1531452105\",\"dl_pic\":null,\"dl_brand\":\"\",\"dl_brandlevel\":\"\",\"dl_oddtime\":\"0\",\"dl_oddcount\":\"0\",\"dl_logintime\":\"0\",\"dl_fanli\":\"0.00\",\"dl_jifen\":\"0\",\"dl_lastflid\":\"0\",\"dl_flmodel\":\"0\",\"dl_deposit\":\"0.00\",\"dl_depositpic\":null,\"dl_paypic\":null}', '1');
INSERT INTO `fw_log` VALUES ('1795', '1191', 'baiman', '3321', '企业登录', '1531477617', '58.63.139.110', '/mp/login/logining', '', '1');
INSERT INTO `fw_log` VALUES ('1796', '1191', 'baiman', '3321', '手机端基本设置', '1531477642', '58.63.139.110', '/mp/jfmobi/edit_save/action/basic', '{\"bas_sitename\":\"\",\"bas_company\":\"\",\"bas_address\":\"\",\"bas_hotline\":\"\",\"bas_tel\":\"\",\"bas_fax\":\"\",\"bas_website\":\"www.bomanvip.com\",\"bas_weixin\":\"\",\"bas_weibo\":\"\"}', '1');
INSERT INTO `fw_log` VALUES ('1797', '1191', 'baiman', '3321', '手机端基本设置', '1531477893', '58.63.139.110', '/mp/jfmobi/edit_save/action/basic', '{\"bas_sitename\":\"\",\"bas_company\":\"\",\"bas_address\":\"\",\"bas_hotline\":\"\",\"bas_tel\":\"\",\"bas_fax\":\"\",\"bas_website\":\"http:\\/\\/www.bomanvip.com\",\"bas_weixin\":\"\",\"bas_weibo\":\"\"}', '1');
INSERT INTO `fw_log` VALUES ('1798', '1191', 'yunmei', '3321', '企业登录', '1531478049', '58.63.139.110', '/mp/login/logining', '', '1');
INSERT INTO `fw_log` VALUES ('1799', '60', '18122734809', '3321', '经销商账号登录', '1531540081', '58.63.147.146', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('1800', '61', '6540811', '3321', '经销商账号登录', '1531542351', '117.136.46.124', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('1801', '1191', 'yunmei', '3321', '企业登录', '1531549577', '58.63.147.146', '/mp/login/logining', '', '1');
INSERT INTO `fw_log` VALUES ('1802', '8', 'yunmei:chuku', '3321', '企业APP子用户登录', '1531549636', '49.81.113.163', '/zxapi/login/index', '{\"su_id\":\"8\",\"su_unitcode\":\"3321\",\"su_username\":\"chuku\",\"su_pwd\":\"c56d0e9a7ccec67b4ea131655038d604\",\"su_openid\":null,\"su_wxnickname\":null,\"su_wxsex\":\"0\",\"su_wxprovince\":null,\"su_wxcity\":null,\"su_wxcountry\":null,\"su_wxheadimg\":null,\"su_weixin\":null,\"su_name\":\"\\u51fa\\u5e93\",\"su_logintime\":\"1531308997\",\"su_errlogintime\":\"1531308997\",\"su_errtimes\":\"0\",\"su_remark\":null,\"su_status\":\"1\",\"su_belong\":\"0\",\"su_purview\":\"\"}', '1');
INSERT INTO `fw_log` VALUES ('1803', '8', 'yunmei:chuku', '3321', '出货导入', '1531550327', '49.81.113.163', '/zxapi/order/odshipscanres_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201807131744177236\",\"ship_deliver\":0,\"ship_dealer\":\"61\",\"ship_pro\":\"16\",\"ship_odid\":52,\"ship_odblid\":52,\"ship_oddtid\":63,\"ship_whid\":7,\"ship_proqty\":\"20\",\"ship_barcode\":\"10002520\",\"ship_date\":1531550327,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"8\",\"ship_czuser\":\"yunmei:chuku\"}', '1');
INSERT INTO `fw_log` VALUES ('1804', '1191', 'yunmei', '3321', '企业登录', '1531550899', '49.81.113.163', '/mp/login/logining', '', '1');
INSERT INTO `fw_log` VALUES ('1805', '1191', 'yunmei', '3321', '企业登录', '1531551436', '113.109.123.34', '/mp/login/logining', '', '1');
INSERT INTO `fw_log` VALUES ('1806', '8', 'yunmei:chuku', '3321', '企业APP子用户登录', '1531551628', '49.81.113.163', '/zxapi/login/index', '{\"su_id\":\"8\",\"su_unitcode\":\"3321\",\"su_username\":\"chuku\",\"su_pwd\":\"c56d0e9a7ccec67b4ea131655038d604\",\"su_openid\":null,\"su_wxnickname\":null,\"su_wxsex\":\"0\",\"su_wxprovince\":null,\"su_wxcity\":null,\"su_wxcountry\":null,\"su_wxheadimg\":null,\"su_weixin\":null,\"su_name\":\"\\u51fa\\u5e93\",\"su_logintime\":\"1531549636\",\"su_errlogintime\":\"1531549636\",\"su_errtimes\":\"0\",\"su_remark\":null,\"su_status\":\"1\",\"su_belong\":\"0\",\"su_purview\":\"\"}', '1');
INSERT INTO `fw_log` VALUES ('1807', '8', 'yunmei:chuku', '3321', '企业APP子用户登录', '1531559956', '49.81.113.163', '/zxapi/login/index', '{\"su_id\":\"8\",\"su_unitcode\":\"3321\",\"su_username\":\"chuku\",\"su_pwd\":\"c56d0e9a7ccec67b4ea131655038d604\",\"su_openid\":null,\"su_wxnickname\":null,\"su_wxsex\":\"0\",\"su_wxprovince\":null,\"su_wxcity\":null,\"su_wxcountry\":null,\"su_wxheadimg\":null,\"su_weixin\":null,\"su_name\":\"\\u51fa\\u5e93\",\"su_logintime\":\"1531551628\",\"su_errlogintime\":\"1531551628\",\"su_errtimes\":\"0\",\"su_remark\":null,\"su_status\":\"1\",\"su_belong\":\"0\",\"su_purview\":\"\"}', '1');
INSERT INTO `fw_log` VALUES ('1808', '8', 'yunmei:chuku', '3321', '企业APP子用户登录', '1531559964', '49.81.113.163', '/zxapi/login/index', '{\"su_id\":\"8\",\"su_unitcode\":\"3321\",\"su_username\":\"chuku\",\"su_pwd\":\"c56d0e9a7ccec67b4ea131655038d604\",\"su_openid\":null,\"su_wxnickname\":null,\"su_wxsex\":\"0\",\"su_wxprovince\":null,\"su_wxcity\":null,\"su_wxcountry\":null,\"su_wxheadimg\":null,\"su_weixin\":null,\"su_name\":\"\\u51fa\\u5e93\",\"su_logintime\":\"1531559956\",\"su_errlogintime\":\"1531559956\",\"su_errtimes\":\"0\",\"su_remark\":null,\"su_status\":\"1\",\"su_belong\":\"0\",\"su_purview\":\"\"}', '1');
INSERT INTO `fw_log` VALUES ('1809', '8', 'yunmei:chuku', '3321', '企业APP子用户登录', '1531564783', '49.81.113.163', '/zxapi/login/index', '{\"su_id\":\"8\",\"su_unitcode\":\"3321\",\"su_username\":\"chuku\",\"su_pwd\":\"c56d0e9a7ccec67b4ea131655038d604\",\"su_openid\":null,\"su_wxnickname\":null,\"su_wxsex\":\"0\",\"su_wxprovince\":null,\"su_wxcity\":null,\"su_wxcountry\":null,\"su_wxheadimg\":null,\"su_weixin\":null,\"su_name\":\"\\u51fa\\u5e93\",\"su_logintime\":\"1531559964\",\"su_errlogintime\":\"1531564779\",\"su_errtimes\":\"1\",\"su_remark\":null,\"su_status\":\"1\",\"su_belong\":\"0\",\"su_purview\":\"\"}', '1');
INSERT INTO `fw_log` VALUES ('1810', '8', 'yunmei:chuku', '3321', '企业APP子用户登录', '1531564915', '49.81.113.163', '/zxapi/login/index', '{\"su_id\":\"8\",\"su_unitcode\":\"3321\",\"su_username\":\"chuku\",\"su_pwd\":\"c56d0e9a7ccec67b4ea131655038d604\",\"su_openid\":null,\"su_wxnickname\":null,\"su_wxsex\":\"0\",\"su_wxprovince\":null,\"su_wxcity\":null,\"su_wxcountry\":null,\"su_wxheadimg\":null,\"su_weixin\":null,\"su_name\":\"\\u51fa\\u5e93\",\"su_logintime\":\"1531564783\",\"su_errlogintime\":\"1531564910\",\"su_errtimes\":\"1\",\"su_remark\":null,\"su_status\":\"1\",\"su_belong\":\"0\",\"su_purview\":\"\"}', '1');
INSERT INTO `fw_log` VALUES ('1811', '8', 'yunmei:chuku', '3321', '企业APP子用户登录', '1531565917', '49.81.113.163', '/zxapi/login/index', '{\"su_id\":\"8\",\"su_unitcode\":\"3321\",\"su_username\":\"chuku\",\"su_pwd\":\"c56d0e9a7ccec67b4ea131655038d604\",\"su_openid\":null,\"su_wxnickname\":null,\"su_wxsex\":\"0\",\"su_wxprovince\":null,\"su_wxcity\":null,\"su_wxcountry\":null,\"su_wxheadimg\":null,\"su_weixin\":null,\"su_name\":\"\\u51fa\\u5e93\",\"su_logintime\":\"1531564915\",\"su_errlogintime\":\"1531564915\",\"su_errtimes\":\"0\",\"su_remark\":null,\"su_status\":\"1\",\"su_belong\":\"0\",\"su_purview\":\"\"}', '1');
INSERT INTO `fw_log` VALUES ('1812', '8', 'yunmei:chuku', '3321', '企业APP子用户登录', '1531565920', '49.81.113.163', '/zxapi/login/index', '{\"su_id\":\"8\",\"su_unitcode\":\"3321\",\"su_username\":\"chuku\",\"su_pwd\":\"c56d0e9a7ccec67b4ea131655038d604\",\"su_openid\":null,\"su_wxnickname\":null,\"su_wxsex\":\"0\",\"su_wxprovince\":null,\"su_wxcity\":null,\"su_wxcountry\":null,\"su_wxheadimg\":null,\"su_weixin\":null,\"su_name\":\"\\u51fa\\u5e93\",\"su_logintime\":\"1531565917\",\"su_errlogintime\":\"1531565917\",\"su_errtimes\":\"0\",\"su_remark\":null,\"su_status\":\"1\",\"su_belong\":\"0\",\"su_purview\":\"\"}', '1');
INSERT INTO `fw_log` VALUES ('1813', '8', 'yunmei:chuku', '3321', '企业APP子用户登录', '1531567119', '49.81.113.163', '/zxapi/login/index', '{\"su_id\":\"8\",\"su_unitcode\":\"3321\",\"su_username\":\"chuku\",\"su_pwd\":\"c56d0e9a7ccec67b4ea131655038d604\",\"su_openid\":null,\"su_wxnickname\":null,\"su_wxsex\":\"0\",\"su_wxprovince\":null,\"su_wxcity\":null,\"su_wxcountry\":null,\"su_wxheadimg\":null,\"su_weixin\":null,\"su_name\":\"\\u51fa\\u5e93\",\"su_logintime\":\"1531565920\",\"su_errlogintime\":\"1531565920\",\"su_errtimes\":\"0\",\"su_remark\":null,\"su_status\":\"1\",\"su_belong\":\"0\",\"su_purview\":\"\"}', '1');
INSERT INTO `fw_log` VALUES ('1814', '61', '6540811', '3321', '经销商账号登录', '1531581499', '117.136.46.124', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('1815', '8', 'yunmei:chuku', '3321', '删除出货记录', '1531627890', '49.81.113.163', '/zxapi/order/deleteFhjl', '{\"ship_id\":\"114\",\"ship_unitcode\":\"3321\",\"ship_number\":\"201807111753495993\",\"ship_deliver\":\"0\",\"ship_dealer\":\"60\",\"ship_pro\":\"16\",\"ship_odid\":\"49\",\"ship_odblid\":\"49\",\"ship_whid\":\"7\",\"ship_proqty\":\"1\",\"ship_barcode\":\"1000332416\",\"ship_ucode\":\"10003324\",\"ship_tcode\":\"10003324\",\"ship_date\":\"1531303719\",\"ship_remark\":\"\",\"ship_cztype\":\"0\",\"ship_czid\":\"8\",\"ship_czuser\":\"baiman:chuku\",\"ship_prodate\":null,\"ship_batchnum\":null,\"ship_status\":\"0\"}', '1');
INSERT INTO `fw_log` VALUES ('1816', '8', 'yunmei:chuku', '3321', '删除出货记录', '1531627892', '49.81.113.163', '/zxapi/order/deleteFhjl', '{\"ship_id\":\"115\",\"ship_unitcode\":\"3321\",\"ship_number\":\"201807111753495993\",\"ship_deliver\":\"0\",\"ship_dealer\":\"60\",\"ship_pro\":\"16\",\"ship_odid\":\"49\",\"ship_odblid\":\"49\",\"ship_whid\":\"7\",\"ship_proqty\":\"1\",\"ship_barcode\":\"1000332403\",\"ship_ucode\":\"10003324\",\"ship_tcode\":\"10003324\",\"ship_date\":\"1531304713\",\"ship_remark\":\"\",\"ship_cztype\":\"0\",\"ship_czid\":\"8\",\"ship_czuser\":\"baiman:chuku\",\"ship_prodate\":null,\"ship_batchnum\":null,\"ship_status\":\"0\"}', '1');
INSERT INTO `fw_log` VALUES ('1817', '8', 'yunmei:chuku', '3321', '删除出货记录', '1531627900', '49.81.113.163', '/zxapi/order/deleteFhjl', '{\"ship_id\":\"116\",\"ship_unitcode\":\"3321\",\"ship_number\":\"201807111753495993\",\"ship_deliver\":\"0\",\"ship_dealer\":\"60\",\"ship_pro\":\"16\",\"ship_odid\":\"49\",\"ship_odblid\":\"49\",\"ship_whid\":\"7\",\"ship_proqty\":\"1\",\"ship_barcode\":\"1000332330\",\"ship_ucode\":\"10003323\",\"ship_tcode\":\"10003323\",\"ship_date\":\"1531305692\",\"ship_remark\":\"\",\"ship_cztype\":\"0\",\"ship_czid\":\"8\",\"ship_czuser\":\"baiman:chuku\",\"ship_prodate\":null,\"ship_batchnum\":null,\"ship_status\":\"0\"}', '1');
INSERT INTO `fw_log` VALUES ('1818', '8', 'yunmei:chuku', '3321', '删除出货记录', '1531627902', '49.81.113.163', '/zxapi/order/deleteFhjl', '{\"ship_id\":\"117\",\"ship_unitcode\":\"3321\",\"ship_number\":\"201807111753495993\",\"ship_deliver\":\"0\",\"ship_dealer\":\"60\",\"ship_pro\":\"16\",\"ship_odid\":\"49\",\"ship_odblid\":\"49\",\"ship_whid\":\"7\",\"ship_proqty\":\"1\",\"ship_barcode\":\"1000332418\",\"ship_ucode\":\"10003324\",\"ship_tcode\":\"10003324\",\"ship_date\":\"1531308497\",\"ship_remark\":\"\",\"ship_cztype\":\"0\",\"ship_czid\":\"8\",\"ship_czuser\":\"baiman:chuku\",\"ship_prodate\":null,\"ship_batchnum\":null,\"ship_status\":\"0\"}', '1');
INSERT INTO `fw_log` VALUES ('1819', '8', 'yunmei:chuku', '3321', '删除出货记录', '1531627904', '49.81.113.163', '/zxapi/order/deleteFhjl', '{\"ship_id\":\"118\",\"ship_unitcode\":\"3321\",\"ship_number\":\"201807111753495993\",\"ship_deliver\":\"0\",\"ship_dealer\":\"60\",\"ship_pro\":\"16\",\"ship_odid\":\"49\",\"ship_odblid\":\"49\",\"ship_whid\":\"7\",\"ship_proqty\":\"1\",\"ship_barcode\":\"1000332433\",\"ship_ucode\":\"10003324\",\"ship_tcode\":\"10003324\",\"ship_date\":\"1531309069\",\"ship_remark\":\"\",\"ship_cztype\":\"0\",\"ship_czid\":\"8\",\"ship_czuser\":\"baiman:chuku\",\"ship_prodate\":null,\"ship_batchnum\":null,\"ship_status\":\"0\"}', '1');
INSERT INTO `fw_log` VALUES ('1820', '1191', 'yunmei', '3321', '企业登录', '1531627974', '49.81.113.163', '/mp/login/logining', '', '1');
INSERT INTO `fw_log` VALUES ('1821', '1191', 'yunmei', '3321', '修改产品', '1531628120', '49.81.113.163', '/mp/product/edit_save', '{\"pro_id\":16,\"pro_name\":\"\\u5141\\u7f8e\\u4ee3\\u9910\\u997c\\u5e72 21\\u7247*20\\u76d2\",\"pro_number\":\"\\u51cf\\u4e4b\\u5708\",\"pro_typeid\":19,\"pro_jftype\":1,\"pro_jifen\":0,\"pro_jfmax\":0,\"pro_dljf\":0,\"pro_desc\":\"\",\"pro_link\":\"\",\"pro_barcode\":\"\",\"pro_remark\":\"\",\"pro_price\":\"7600.00\",\"pro_stock\":0,\"pro_units\":\"\\u7bb1\",\"pro_dbiao\":1,\"pro_zbiao\":0,\"pro_xbiao\":20,\"pro_pic2\":\"3321\\/15316281202_8236.jpg\"}', '1');
INSERT INTO `fw_log` VALUES ('1822', '61', '6540811', '3321', '经销商账号登录', '1531628352', '49.81.113.163', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('1823', '61', '6540811', '3321', '经销商账号登录', '1531628413', '49.81.113.163', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('1824', '8', 'yunmei:chuku', '3321', '企业APP子用户登录', '1531646927', '49.81.113.163', '/zxapi/login/index', '{\"su_id\":\"8\",\"su_unitcode\":\"3321\",\"su_username\":\"chuku\",\"su_pwd\":\"c56d0e9a7ccec67b4ea131655038d604\",\"su_openid\":null,\"su_wxnickname\":null,\"su_wxsex\":\"0\",\"su_wxprovince\":null,\"su_wxcity\":null,\"su_wxcountry\":null,\"su_wxheadimg\":null,\"su_weixin\":null,\"su_name\":\"\\u51fa\\u5e93\",\"su_logintime\":\"1531567119\",\"su_errlogintime\":\"1531646923\",\"su_errtimes\":\"1\",\"su_remark\":null,\"su_status\":\"1\",\"su_belong\":\"0\",\"su_purview\":\"\"}', '1');
INSERT INTO `fw_log` VALUES ('1825', '61', '6540811', '3321', '经销商账号登录', '1531669168', '121.233.7.248', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('1826', '61', '6540811', '3321', '经销商账号登录', '1531669185', '121.233.7.248', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('1827', '61', '6540811', '3321', '经销商账号登录', '1531669187', '121.233.7.248', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('1828', '61', '6540811', '3321', '经销商账号登录', '1531669188', '121.233.7.248', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('1829', '61', '6540811', '3321', '经销商账号登录', '1531669191', '121.233.7.248', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('1830', '61', '6540811', '3321', '经销商账号登录', '1531669218', '121.233.7.248', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('1831', '61', '6540811', '3321', '经销商账号登录', '1531669220', '121.233.7.248', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('1832', '61', '6540811', '3321', '经销商账号登录', '1531669221', '121.233.7.248', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('1833', '61', '6540811', '3321', '经销商账号登录', '1531669221', '121.233.7.248', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('1834', '61', '6540811', '3321', '经销商账号登录', '1531669221', '121.233.7.248', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('1835', '60', '18122734809', '3321', '经销商账号登录', '1531705571', '58.63.139.149', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('1836', '61', '6540811', '3321', '经销商账号登录', '1531706075', '121.233.7.248', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('1837', '61', '6540811', '3321', '经销商出货', '1531706187', '121.233.7.248', '/baiman/orders/odshipping/step/1/od_id/48/odbl_id/48/oddt_id/59', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201807111729284785\",\"ship_deliver\":\"61\",\"ship_dealer\":\"62\",\"ship_pro\":\"16\",\"ship_odid\":48,\"ship_odblid\":48,\"ship_whid\":null,\"ship_proqty\":\"20\",\"ship_barcode\":10002520,\"ship_date\":1531706187,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":2,\"ship_czid\":\"61\",\"ship_czuser\":\"6540811\"}', '2');
INSERT INTO `fw_log` VALUES ('1838', '1191', 'yunmei', '3321', '企业登录', '1531706654', '58.63.139.149', '/mp/login/logining', '', '1');
INSERT INTO `fw_log` VALUES ('1839', '8', 'yunmei:chuku', '3321', '企业APP子用户登录', '1531711738', '180.123.221.45', '/zxapi/login/index', '{\"su_id\":\"8\",\"su_unitcode\":\"3321\",\"su_username\":\"chuku\",\"su_pwd\":\"c56d0e9a7ccec67b4ea131655038d604\",\"su_openid\":null,\"su_wxnickname\":null,\"su_wxsex\":\"0\",\"su_wxprovince\":null,\"su_wxcity\":null,\"su_wxcountry\":null,\"su_wxheadimg\":null,\"su_weixin\":null,\"su_name\":\"\\u51fa\\u5e93\",\"su_logintime\":\"1531646927\",\"su_errlogintime\":\"1531646927\",\"su_errtimes\":\"0\",\"su_remark\":null,\"su_status\":\"1\",\"su_belong\":\"0\",\"su_purview\":\"\"}', '1');
INSERT INTO `fw_log` VALUES ('1840', '1191', 'yunmei', '3321', '企业登录', '1531712192', '180.123.221.45', '/Mp/Login/logining', '', '1');
INSERT INTO `fw_log` VALUES ('1841', '1191', 'yunmei', '3321', '修改产品', '1531712280', '180.123.221.45', '/Mp/Product/edit_save', '{\"pro_id\":16,\"pro_name\":\"\\u51cf\\u4e4b\\u5708\\u4ee3\\u9910\\u997c\\u5e72\",\"pro_number\":\"\\u51cf\\u4e4b\\u5708\",\"pro_typeid\":19,\"pro_jftype\":1,\"pro_jifen\":0,\"pro_jfmax\":0,\"pro_dljf\":0,\"pro_desc\":\" 21\\u7247*20\\u76d2\",\"pro_link\":\"\",\"pro_barcode\":\"\",\"pro_remark\":\"\",\"pro_price\":\"7600.00\",\"pro_stock\":0,\"pro_units\":\"\\u7bb1\",\"pro_dbiao\":1,\"pro_zbiao\":0,\"pro_xbiao\":20}', '1');
INSERT INTO `fw_log` VALUES ('1842', '1191', 'yunmei', '3321', '修改产品', '1531712499', '180.123.221.45', '/Mp/Product/edit_save', '{\"pro_id\":16,\"pro_name\":\"\\u51cf\\u4e4b\\u5708\\u4ee3\\u9910\\u997c\\u5e72\",\"pro_number\":\"\\u51cf\\u4e4b\\u5708\",\"pro_typeid\":19,\"pro_jftype\":1,\"pro_jifen\":0,\"pro_jfmax\":0,\"pro_dljf\":0,\"pro_desc\":\" 21\\u7247*20\\u76d2\",\"pro_link\":\"\",\"pro_barcode\":\"\",\"pro_remark\":\" 21\\u7247*20\\u76d2\",\"pro_price\":\"7600.00\",\"pro_stock\":0,\"pro_units\":\"\\u7bb1\",\"pro_dbiao\":1,\"pro_zbiao\":0,\"pro_xbiao\":20}', '1');
INSERT INTO `fw_log` VALUES ('1843', '60', '18122734809', '3321', '经销商账号登录', '1531712529', '58.63.139.149', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('1844', '1191', 'yunmei', '3321', '添加产品类型', '1531712647', '180.123.221.45', '/mp/product/typeedit_save', '{\"protype_unitcode\":\"3321\",\"protype_name\":\"YM\",\"protype_iswho\":\"0\"}', '1');
INSERT INTO `fw_log` VALUES ('1845', '1191', 'yunmei', '3321', '添加产品', '1531712771', '180.123.221.45', '/mp/product/edit_save', '{\"pro_name\":\"\\u9175\\u7d20\\u5496\\u5561\",\"pro_number\":\"KF\",\"pro_unitcode\":\"3321\",\"pro_typeid\":20,\"pro_jftype\":1,\"pro_jifen\":0,\"pro_jfmax\":0,\"pro_dljf\":0,\"pro_desc\":\"\\u5496\\u5561\",\"pro_link\":\"\",\"pro_barcode\":\"\",\"pro_remark\":\"\",\"pro_addtime\":1531712771,\"pro_active\":1,\"pro_price\":\"210\",\"pro_stock\":0,\"pro_units\":\"\\u7bb1\",\"pro_dbiao\":1,\"pro_zbiao\":0,\"pro_xbiao\":36,\"pro_pic\":\"3321\\/1531712771_7058.JPG\",\"pro_pic2\":\"3321\\/15317127712_1189.JPG\"}', '1');
INSERT INTO `fw_log` VALUES ('1846', '1191', 'yunmei', '3321', '修改产品', '1531712870', '180.123.221.45', '/mp/product/edit_save', '{\"pro_id\":17,\"pro_name\":\"\\u9175\\u7d20\\u5496\\u5561\",\"pro_number\":\"KF\",\"pro_typeid\":20,\"pro_jftype\":1,\"pro_jifen\":0,\"pro_jfmax\":0,\"pro_dljf\":0,\"pro_desc\":\"\\u5496\\u55611\\u7bb1\",\"pro_link\":\"\",\"pro_barcode\":\"\",\"pro_remark\":\"\",\"pro_price\":\"210.00\",\"pro_stock\":0,\"pro_units\":\"\\u7bb1\",\"pro_dbiao\":1,\"pro_zbiao\":0,\"pro_xbiao\":36}', '1');
INSERT INTO `fw_log` VALUES ('1847', '1191', 'yunmei', '3321', '修改产品价格体系', '1531712887', '180.123.221.45', '/mp/product/propriceedit_save', '[{\"dlt_id\":\"2\",\"dlt_unitcode\":\"3321\",\"dlt_name\":\"\\u7ba1\\u7406\\u8d26\\u53f7\",\"dlt_level\":\"1\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"0.00\",\"dlt_minnum\":\"3\",\"priprice\":\"100\",\"pro_id\":\"17\"},{\"dlt_id\":\"3\",\"dlt_unitcode\":\"3321\",\"dlt_name\":\"\\u6267\\u884c\\u8463\\u4e8b\",\"dlt_level\":\"2\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"0.00\",\"dlt_minnum\":\"3\",\"priprice\":\"120\",\"pro_id\":\"17\"}]', '1');
INSERT INTO `fw_log` VALUES ('1848', '8', 'yunmei:chuku', '3321', '企业APP子用户登录', '1531712944', '180.123.221.45', '/zxapi/login/index', '{\"su_id\":\"8\",\"su_unitcode\":\"3321\",\"su_username\":\"chuku\",\"su_pwd\":\"c56d0e9a7ccec67b4ea131655038d604\",\"su_openid\":null,\"su_wxnickname\":null,\"su_wxsex\":\"0\",\"su_wxprovince\":null,\"su_wxcity\":null,\"su_wxcountry\":null,\"su_wxheadimg\":null,\"su_weixin\":null,\"su_name\":\"\\u51fa\\u5e93\",\"su_logintime\":\"1531711738\",\"su_errlogintime\":\"1531711738\",\"su_errtimes\":\"0\",\"su_remark\":null,\"su_status\":\"1\",\"su_belong\":\"0\",\"su_purview\":\"\"}', '1');
INSERT INTO `fw_log` VALUES ('1849', '8', 'yunmei:chuku', '3321', '出货导入', '1531713048', '180.123.221.45', '/zxapi/order/odshipscanres_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201807161148475689\",\"ship_deliver\":0,\"ship_dealer\":\"61\",\"ship_pro\":\"17\",\"ship_odid\":53,\"ship_odblid\":53,\"ship_oddtid\":64,\"ship_whid\":7,\"ship_proqty\":1,\"ship_barcode\":\"1000251901\",\"ship_date\":1531713048,\"ship_ucode\":\"10002519\",\"ship_tcode\":\"10002519\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"8\",\"ship_czuser\":\"yunmei:chuku\"}', '1');
INSERT INTO `fw_log` VALUES ('1850', '8', 'yunmei:chuku', '3321', '出货导入', '1531713324', '180.123.221.45', '/zxapi/order/odshipscanres_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201807161148475689\",\"ship_deliver\":0,\"ship_dealer\":\"61\",\"ship_pro\":\"17\",\"ship_odid\":53,\"ship_odblid\":53,\"ship_oddtid\":64,\"ship_whid\":7,\"ship_proqty\":1,\"ship_barcode\":\"1000251911\",\"ship_date\":1531713323,\"ship_ucode\":\"10002519\",\"ship_tcode\":\"10002519\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"8\",\"ship_czuser\":\"yunmei:chuku\"}', '1');
INSERT INTO `fw_log` VALUES ('1851', '8', 'yunmei:chuku', '3321', '出货导入', '1531713393', '180.123.221.45', '/zxapi/order/odshipscanres_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201807161148475689\",\"ship_deliver\":0,\"ship_dealer\":\"61\",\"ship_pro\":\"17\",\"ship_odid\":53,\"ship_odblid\":53,\"ship_oddtid\":64,\"ship_whid\":7,\"ship_proqty\":1,\"ship_barcode\":\"1000251912\",\"ship_date\":1531713393,\"ship_ucode\":\"10002519\",\"ship_tcode\":\"10002519\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"8\",\"ship_czuser\":\"yunmei:chuku\"}', '1');
INSERT INTO `fw_log` VALUES ('1852', '1191', 'yunmei', '3321', '企业登录', '1531713477', '180.123.221.45', '/mp/login/logining', '', '1');
INSERT INTO `fw_log` VALUES ('1853', '1191', 'yunmei', '3321', '企业登录', '1531725818', '180.123.221.45', '/mp/login/logining', '', '1');
INSERT INTO `fw_log` VALUES ('1854', '1191', 'yunmei', '3321', '手机端基本设置', '1531725902', '180.123.221.45', '/mp/jfmobi/edit_save/action/basic', '{\"bas_sitename\":\"\\u5141\\u7f8e-\\u56e0\\u4f60\\u800c\\u7f8e\",\"bas_company\":\"\",\"bas_address\":\"\",\"bas_hotline\":\"\",\"bas_tel\":\"\",\"bas_fax\":\"\",\"bas_website\":\"http:\\/\\/www.bomanvip.com\",\"bas_weixin\":\"\",\"bas_weibo\":\"\"}', '1');
INSERT INTO `fw_log` VALUES ('1855', '8', 'yunmei:chuku', '3321', '企业APP子用户登录', '1531727654', '180.123.221.45', '/zxapi/login/index', '{\"su_id\":\"8\",\"su_unitcode\":\"3321\",\"su_username\":\"chuku\",\"su_pwd\":\"c56d0e9a7ccec67b4ea131655038d604\",\"su_openid\":null,\"su_wxnickname\":null,\"su_wxsex\":\"0\",\"su_wxprovince\":null,\"su_wxcity\":null,\"su_wxcountry\":null,\"su_wxheadimg\":null,\"su_weixin\":null,\"su_name\":\"\\u51fa\\u5e93\",\"su_logintime\":\"1531712944\",\"su_errlogintime\":\"1531712944\",\"su_errtimes\":\"0\",\"su_remark\":null,\"su_status\":\"1\",\"su_belong\":\"0\",\"su_purview\":\"\"}', '1');
INSERT INTO `fw_log` VALUES ('1856', '60', '18122734809', '3321', '经销商账号登录', '1531728907', '113.109.120.24', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('1857', '60', '18122734809', '3321', '经销商账号登录', '1531790880', '58.63.139.85', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('1858', '1191', 'yunmei', '3321', '企业登录', '1531790946', '58.63.139.85', '/mp/login/logining', '', '1');
INSERT INTO `fw_log` VALUES ('1859', '60', '18122734809', '3321', '经销商账号登录', '1531792903', '113.109.120.163', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('1860', '60', '18122734809', '3321', '经销商账号登录', '1531793019', '113.109.120.163', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('1861', '61', '6540811', '3321', '经销商账号登录', '1531795689', '58.218.14.40', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('1862', '1191', 'yunmei', '3321', '企业登录', '1531798253', '180.123.221.45', '/mp/login/logining', '', '1');
INSERT INTO `fw_log` VALUES ('1863', '1191', 'yunmei', '3321', '修改产品', '1531798323', '180.123.221.45', '/mp/product/edit_save', '{\"pro_id\":17,\"pro_name\":\"\\u5141\\u7f8e \\u9175\\u7d20\\u5496\\u5561\",\"pro_number\":\"KF\",\"pro_typeid\":20,\"pro_jftype\":1,\"pro_jifen\":0,\"pro_jfmax\":0,\"pro_dljf\":0,\"pro_desc\":\"\\u5496\\u55611\\u7bb1\",\"pro_link\":\"\",\"pro_barcode\":\"\",\"pro_remark\":\"\",\"pro_price\":\"210.00\",\"pro_stock\":0,\"pro_units\":\"\\u7bb1\",\"pro_dbiao\":1,\"pro_zbiao\":0,\"pro_xbiao\":36}', '1');
INSERT INTO `fw_log` VALUES ('1864', '8', 'yunmei:chuku', '3321', '出货导入', '1531798362', '180.123.221.45', '/zxapi/order/odshipscanres_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201807161148475689\",\"ship_deliver\":0,\"ship_dealer\":\"61\",\"ship_pro\":\"17\",\"ship_odid\":53,\"ship_odblid\":53,\"ship_oddtid\":64,\"ship_whid\":7,\"ship_proqty\":1,\"ship_barcode\":\"1000251902\",\"ship_date\":1531798362,\"ship_ucode\":\"10002519\",\"ship_tcode\":\"10002519\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"8\",\"ship_czuser\":\"yunmei:chuku\"}', '1');
INSERT INTO `fw_log` VALUES ('1865', '8', 'yunmei:chuku', '3321', '出货导入', '1531798811', '180.123.221.45', '/zxapi/order/odshipscanres_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201807171138472233\",\"ship_deliver\":0,\"ship_dealer\":\"61\",\"ship_pro\":\"17\",\"ship_odid\":54,\"ship_odblid\":54,\"ship_oddtid\":65,\"ship_whid\":7,\"ship_proqty\":1,\"ship_barcode\":\"1000251914\",\"ship_date\":1531798811,\"ship_ucode\":\"10002519\",\"ship_tcode\":\"10002519\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"8\",\"ship_czuser\":\"yunmei:chuku\"}', '1');
INSERT INTO `fw_log` VALUES ('1866', '62', '297261647', '3321', '经销商账号登录', '1531798946', '180.123.221.45', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('1867', '1191', 'yunmei', '3321', '修改产品', '1531798989', '180.123.221.45', '/mp/product/edit_save', '{\"pro_id\":16,\"pro_name\":\"\\u5141\\u7f8e \\u51cf\\u4e4b\\u5708\\u4ee3\\u9910\\u997c\\u5e72\",\"pro_number\":\"\\u51cf\\u4e4b\\u5708\",\"pro_typeid\":19,\"pro_jftype\":1,\"pro_jifen\":0,\"pro_jfmax\":0,\"pro_dljf\":0,\"pro_desc\":\" 21\\u7247*20\\u76d2\",\"pro_link\":\"\",\"pro_barcode\":\"\",\"pro_remark\":\" 21\\u7247*20\\u76d2\",\"pro_price\":\"7600.00\",\"pro_stock\":0,\"pro_units\":\"\\u7bb1\",\"pro_dbiao\":1,\"pro_zbiao\":0,\"pro_xbiao\":20}', '1');
INSERT INTO `fw_log` VALUES ('1868', '61', '6540811', '3321', '经销商出货', '1531799156', '180.123.221.45', '/baiman/orders/odshipping/step/1/od_id/55/odbl_id/55/oddt_id/66', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201807171143028391\",\"ship_deliver\":\"61\",\"ship_dealer\":\"62\",\"ship_pro\":\"17\",\"ship_odid\":55,\"ship_odblid\":55,\"ship_whid\":null,\"ship_proqty\":\"1\",\"ship_barcode\":1000251914,\"ship_date\":1531799156,\"ship_ucode\":\"10002519\",\"ship_tcode\":\"10002519\",\"ship_remark\":\"\",\"ship_cztype\":2,\"ship_czid\":\"61\",\"ship_czuser\":\"6540811\"}', '2');
INSERT INTO `fw_log` VALUES ('1869', '1191', 'yunmei', '3321', '企业登录', '1531799316', '113.109.120.163', '/mp/login/logining', '', '1');
INSERT INTO `fw_log` VALUES ('1870', '1191', 'yunmei', '3321', '修改产品', '1531799524', '180.123.221.45', '/mp/product/edit_save', '{\"pro_id\":17,\"pro_name\":\"\\u5141\\u7f8e \\u9175\\u7d20\\u5496\\u5561\",\"pro_number\":\"KF\",\"pro_typeid\":20,\"pro_jftype\":1,\"pro_jifen\":0,\"pro_jfmax\":0,\"pro_dljf\":0,\"pro_desc\":\"\\u5496\\u55611\\u7bb1\",\"pro_link\":\"\",\"pro_barcode\":\"\",\"pro_remark\":\"\",\"pro_price\":\"210.00\",\"pro_stock\":0,\"pro_units\":\"\\u7bb1\",\"pro_dbiao\":1,\"pro_zbiao\":0,\"pro_xbiao\":1}', '1');
INSERT INTO `fw_log` VALUES ('1871', '64', '15365423666', '3321', '代理商注册', '1531799531', '49.92.154.107', '/baiman/dealer/apply', '{\"dl_username\":\"15365423666\",\"dl_pwd\":\"67526052c9cd9e8f85cb62da53568578\",\"dl_number\":\"\",\"dl_unitcode\":\"3321\",\"dl_name\":\"\\u82f1\\u5c11\\u67cf\",\"dl_contact\":\"\\u82f1\\u5c11\\u67cf\",\"dl_tel\":\"15365423666\",\"dl_idcard\":\"320324199206260012\",\"dl_idcardpic\":\"\",\"dl_idcardpic2\":\"\",\"dl_tbdian\":\"\",\"dl_tbzhanggui\":\"\",\"dl_addtime\":1531799531,\"dl_status\":0,\"dl_level\":\"2\",\"dl_type\":3,\"dl_sttype\":0,\"dl_belong\":\"61\",\"dl_referee\":61,\"dl_remark\":\"\",\"dl_address\":\"\\u6c5f\\u82cf\\u7701\\u5f90\\u5dde\\u5e02\\u7762\\u5b81\\u53bf\",\"dl_sheng\":\"32\",\"dl_shi\":\"3203\",\"dl_qu\":\"320324\",\"dl_qustr\":\"\\u6c5f\\u82cf\\u7701\\u5f90\\u5dde\\u5e02\\u7762\\u5b81\\u53bf\",\"dl_openid\":\"\",\"dl_weixin\":\"15365423666\",\"dl_wxnickname\":\"\",\"dl_wxsex\":0,\"dl_wxprovince\":\"\",\"dl_wxcity\":\"\",\"dl_wxcountry\":\"\",\"dl_wxheadimg\":\"\",\"dl_brand\":\"\",\"dl_brandlevel\":\"\"}', '2');
INSERT INTO `fw_log` VALUES ('1872', '60', '18122734809', '3321', '经销商账号登录', '1531799919', '58.63.139.85', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('1873', '1191', 'yunmei', '3321', '修改产品', '1531799944', '180.123.221.45', '/mp/product/edit_save', '{\"pro_id\":17,\"pro_name\":\"\\u5141\\u7f8e \\u9175\\u7d20\\u5496\\u5561\",\"pro_number\":\"KF\",\"pro_typeid\":20,\"pro_jftype\":1,\"pro_jifen\":0,\"pro_jfmax\":0,\"pro_dljf\":0,\"pro_desc\":\"\\u5496\\u55611\\u7bb1\",\"pro_link\":\"\",\"pro_barcode\":\"\",\"pro_remark\":\"\",\"pro_price\":\"210.00\",\"pro_stock\":0,\"pro_units\":\"\\u76d2\",\"pro_dbiao\":1,\"pro_zbiao\":0,\"pro_xbiao\":1}', '1');
INSERT INTO `fw_log` VALUES ('1874', '64', '15365423666', '3321', '经销商账号登录', '1531800353', '49.92.154.107', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('1875', '1191', 'yunmei', '3321', '删除订单', '1531800483', '113.109.120.163', '/mp/orders/deleteorder/od_id/49', '{\"od_id\":\"49\",\"od_unitcode\":\"3321\",\"od_orderid\":\"201807111753495993\",\"od_total\":\"6300.00\",\"od_addtime\":\"1531302829\",\"od_oddlid\":\"60\",\"od_contact\":\"\\u6f58\\u751f\",\"od_addressid\":\"45\",\"od_sheng\":\"44\",\"od_shi\":\"4401\",\"od_qu\":\"440103\",\"od_jie\":\"0\",\"od_address\":\"\\u5e7f\\u4e1c\\u7701\\u5e7f\\u5dde\\u5e02\\u8354\\u6e7e\\u533a\",\"od_tel\":\"18122734809\",\"od_express\":\"0\",\"od_expressnum\":\"\",\"od_expressdate\":\"0\",\"od_remark\":null,\"od_state\":\"9\",\"od_stead\":\"0\",\"od_blid\":\"0\",\"od_paymode\":\"0\"}', '1');
INSERT INTO `fw_log` VALUES ('1876', '8', 'yunmei:chuku', '3321', '出货导入', '1531800715', '180.123.221.45', '/zxapi/order/odshipscanres_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201807171210207632\",\"ship_deliver\":0,\"ship_dealer\":\"60\",\"ship_pro\":\"17\",\"ship_odid\":57,\"ship_odblid\":57,\"ship_oddtid\":68,\"ship_whid\":7,\"ship_proqty\":1,\"ship_barcode\":\"1000251920\",\"ship_date\":1531800715,\"ship_ucode\":\"10002519\",\"ship_tcode\":\"10002519\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"8\",\"ship_czuser\":\"yunmei:chuku\"}', '1');
INSERT INTO `fw_log` VALUES ('1877', '65', 'pan123456', '3321', '代理商注册', '1531802439', '113.109.120.163', '/baiman/dealer/apply', '{\"dl_username\":\"pan123456\",\"dl_pwd\":\"c56d0e9a7ccec67b4ea131655038d604\",\"dl_number\":\"\",\"dl_unitcode\":\"3321\",\"dl_name\":\"\\u6797\\u751f\",\"dl_contact\":\"\\u6797\\u751f\",\"dl_tel\":\"15000123456\",\"dl_idcard\":\"440812199001021234\",\"dl_idcardpic\":\"\",\"dl_idcardpic2\":\"\",\"dl_tbdian\":\"\",\"dl_tbzhanggui\":\"\",\"dl_addtime\":1531802439,\"dl_status\":0,\"dl_level\":\"2\",\"dl_type\":3,\"dl_sttype\":0,\"dl_belong\":\"60\",\"dl_referee\":60,\"dl_remark\":\"\",\"dl_address\":\"\\u5e7f\\u4e1c\\u7701\\u5e7f\\u5dde\\u5e02\\u8354\\u6e7e\\u533a\",\"dl_sheng\":\"44\",\"dl_shi\":\"4401\",\"dl_qu\":\"440103\",\"dl_qustr\":\"\\u5e7f\\u4e1c\\u7701\\u5e7f\\u5dde\\u5e02\\u8354\\u6e7e\\u533a\",\"dl_openid\":\"\",\"dl_weixin\":\"pan123456\",\"dl_wxnickname\":\"\",\"dl_wxsex\":0,\"dl_wxprovince\":\"\",\"dl_wxcity\":\"\",\"dl_wxcountry\":\"\",\"dl_wxheadimg\":\"\",\"dl_brand\":\"\",\"dl_brandlevel\":\"\"}', '2');
INSERT INTO `fw_log` VALUES ('1878', '65', 'pan123456', '3321', '经销商账号登录', '1531802500', '113.109.120.163', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('1879', '60', '18122734809', '3321', '经销商出货', '1531802787', '113.109.120.163', '/baiman/orders/odshipping/step/1/od_id/59/odbl_id/59/oddt_id/70', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201807171243089605\",\"ship_deliver\":\"60\",\"ship_dealer\":\"65\",\"ship_pro\":\"17\",\"ship_odid\":59,\"ship_odblid\":59,\"ship_whid\":null,\"ship_proqty\":\"1\",\"ship_barcode\":1000251920,\"ship_date\":1531802787,\"ship_ucode\":\"10002519\",\"ship_tcode\":\"10002519\",\"ship_remark\":\"\",\"ship_cztype\":2,\"ship_czid\":\"60\",\"ship_czuser\":\"18122734809\"}', '2');
INSERT INTO `fw_log` VALUES ('1880', '65', 'pan123456', '3321', '经销商账号登录', '1531803050', '113.109.120.163', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('1881', '60', '18122734809', '3321', '经销商账号登录', '1531816478', '58.63.146.174', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('1882', '1191', 'yunmei', '3321', '企业登录', '1531816550', '58.63.146.174', '/mp/login/logining', '', '1');
INSERT INTO `fw_log` VALUES ('1883', '60', '18122734809', '3321', '经销商账号登录', '1531816711', '58.63.146.174', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('1884', '65', 'pan123456', '3321', '经销商账号登录', '1531817781', '58.63.146.174', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('1885', '60', '18122734809', '3321', '经销商账号登录', '1531817801', '113.109.120.163', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('1886', '60', '18122734809', '3321', '经销商账号登录', '1531817878', '58.63.146.174', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('1887', '65', 'pan123456', '3321', '经销商账号登录', '1531818698', '113.109.120.163', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('1888', '60', '18122734809', '3321', '经销商账号登录', '1531819034', '113.109.120.163', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('1889', '1191', 'yunmei', '3321', '企业登录', '1531819479', '180.123.221.45', '/mp/login/logining', '', '1');
INSERT INTO `fw_log` VALUES ('1890', '1191', 'yunmei', '3321', '企业登录', '1531821590', '113.109.120.163', '/mp/login/logining', '', '1');
INSERT INTO `fw_log` VALUES ('1891', '1191', 'yunmei', '3321', '修改产品', '1531822151', '180.123.221.45', '/mp/product/edit_save', '{\"pro_id\":17,\"pro_name\":\"\\u5141\\u7f8e \\u9175\\u7d20\\u5496\\u5561\",\"pro_number\":\"KF\",\"pro_typeid\":20,\"pro_jftype\":1,\"pro_jifen\":0,\"pro_jfmax\":0,\"pro_dljf\":0,\"pro_desc\":\"\\u5496\\u55611\\u7bb1\",\"pro_link\":\"\",\"pro_barcode\":\"\",\"pro_remark\":\"\",\"pro_price\":\"210.00\",\"pro_stock\":0,\"pro_units\":\"\\u76d2\",\"pro_dbiao\":1,\"pro_zbiao\":0,\"pro_xbiao\":36}', '1');
INSERT INTO `fw_log` VALUES ('1892', '1191', 'yunmei', '3321', '企业登录', '1531822502', '117.136.79.34', '/mp/login/logining', '', '1');
INSERT INTO `fw_log` VALUES ('1893', '66', '654081', '3321', '代理商注册', '1531822589', '117.136.68.56', '/baiman/dealer/qyjxapply', '{\"dl_username\":\"654081\",\"dl_pwd\":\"9fa93775354c25a9fd5b2e09e985d7ba\",\"dl_number\":\"\",\"dl_unitcode\":\"3321\",\"dl_name\":\"\\u77f3\\u7476\\u7476\",\"dl_contact\":\"\\u77f3\\u7476\\u7476\",\"dl_tel\":\"13564690205\",\"dl_idcard\":\"320324199410080721\",\"dl_idcardpic\":\"\",\"dl_idcardpic2\":\"\",\"dl_tbdian\":\"\",\"dl_tbzhanggui\":\"\",\"dl_addtime\":1531822589,\"dl_status\":0,\"dl_level\":\"2\",\"dl_type\":3,\"dl_sttype\":0,\"dl_belong\":0,\"dl_referee\":0,\"dl_remark\":\"\",\"dl_address\":\"\\u6c5f\\u82cf\\u7701\\u5f90\\u5dde\\u5e02\\u7762\\u5b81\\u53bf\\u661f\\u6cb3\\u6e7e\",\"dl_sheng\":\"32\",\"dl_shi\":\"3203\",\"dl_qu\":\"320324\",\"dl_qustr\":\"\\u6c5f\\u82cf\\u7701\\u5f90\\u5dde\\u5e02\\u7762\\u5b81\\u53bf\",\"dl_openid\":\"\",\"dl_weixin\":\"654081\",\"dl_wxnickname\":\"\",\"dl_wxsex\":0,\"dl_wxprovince\":\"\",\"dl_wxcity\":\"\",\"dl_wxcountry\":\"\",\"dl_wxheadimg\":\"\",\"dl_brand\":\"\",\"dl_brandlevel\":\"\"}', '2');
INSERT INTO `fw_log` VALUES ('1894', '1191', 'yunmei', '3321', '修改经销商', '1531822756', '180.123.221.45', '/mp/dealer/edit_save', '{\"dl_id\":66,\"dl_number\":\"N007700\",\"dl_name\":\"\\u77f3\\u7476\\u7476\",\"dl_area\":\"\",\"dl_contact\":\"\\u77f3\\u7476\\u7476\",\"dl_tel\":\"15252161759\",\"dl_fax\":\"\",\"dl_address\":\"\\u6c5f\\u82cf\\u7701\\u5f90\\u5dde\\u5e02\\u7762\\u5b81\\u53bf\\u661f\\u6cb3\\u6e7e\",\"dl_email\":\"\",\"dl_qq\":\"\",\"dl_idcard\":\"320324199410080721\",\"dl_remark\":\"\",\"dl_des\":\"\",\"dl_weixin\":\"654081\",\"dl_pwd\":\"c56d0e9a7ccec67b4ea131655038d604\"}', '1');
INSERT INTO `fw_log` VALUES ('1895', '67', '13636393523', '3321', '代理商注册', '1531822773', '121.233.7.152', '/baiman/dealer/qyjxapply', '{\"dl_username\":\"13636393523\",\"dl_pwd\":\"69e5bd0f7d281a238b685ee6ad2adb5f\",\"dl_number\":\"\",\"dl_unitcode\":\"3321\",\"dl_name\":\"\\u9a6c\\u5c0f\\u5029\",\"dl_contact\":\"\\u9a6c\\u5c0f\\u5029\",\"dl_tel\":\"13636393523\",\"dl_idcard\":\"321324198908283821\",\"dl_idcardpic\":\"\",\"dl_idcardpic2\":\"\",\"dl_tbdian\":\"\",\"dl_tbzhanggui\":\"\",\"dl_addtime\":1531822773,\"dl_status\":0,\"dl_level\":\"1\",\"dl_type\":2,\"dl_sttype\":0,\"dl_belong\":0,\"dl_referee\":0,\"dl_remark\":\"\",\"dl_address\":\"\\u6c5f\\u82cf\\u7701\\u5f90\\u5dde\\u5e02\\u7762\\u5b81\\u53bf\\u661f\\u6cb3\\u6e7e\",\"dl_sheng\":\"32\",\"dl_shi\":\"3203\",\"dl_qu\":\"320324\",\"dl_qustr\":\"\\u6c5f\\u82cf\\u7701\\u5f90\\u5dde\\u5e02\\u7762\\u5b81\\u53bf\",\"dl_openid\":\"\",\"dl_weixin\":\"13636393523\",\"dl_wxnickname\":\"\",\"dl_wxsex\":0,\"dl_wxprovince\":\"\",\"dl_wxcity\":\"\",\"dl_wxcountry\":\"\",\"dl_wxheadimg\":\"\",\"dl_brand\":\"\",\"dl_brandlevel\":\"\"}', '2');
INSERT INTO `fw_log` VALUES ('1896', '1191', 'yunmei', '3321', '修改产品', '1531823029', '180.123.221.45', '/mp/product/edit_save', '{\"pro_id\":17,\"pro_name\":\"\\u5141\\u7f8e \\u9175\\u7d20\\u5496\\u5561\",\"pro_number\":\"KF\",\"pro_typeid\":20,\"pro_jftype\":1,\"pro_jifen\":0,\"pro_jfmax\":0,\"pro_dljf\":0,\"pro_desc\":\"\\u5496\\u55611\\u7bb1\",\"pro_link\":\"\",\"pro_barcode\":\"\",\"pro_remark\":\"\",\"pro_price\":\"7600\",\"pro_stock\":0,\"pro_units\":\"\\u76d2\",\"pro_dbiao\":1,\"pro_zbiao\":0,\"pro_xbiao\":36}', '1');
INSERT INTO `fw_log` VALUES ('1897', '68', '15365433666', '3321', '代理商注册', '1531823059', '49.92.154.107', '/baiman/dealer/qyjxapply', '{\"dl_username\":\"15365433666\",\"dl_pwd\":\"67526052c9cd9e8f85cb62da53568578\",\"dl_number\":\"\",\"dl_unitcode\":\"3321\",\"dl_name\":\"\\u82f1\\u5c11\\u67cf\",\"dl_contact\":\"\\u82f1\\u5c11\\u67cf\",\"dl_tel\":\"15365423666\",\"dl_idcard\":\"320324199206260012\",\"dl_idcardpic\":\"\",\"dl_idcardpic2\":\"\",\"dl_tbdian\":\"\",\"dl_tbzhanggui\":\"\",\"dl_addtime\":1531823059,\"dl_status\":0,\"dl_level\":\"1\",\"dl_type\":2,\"dl_sttype\":0,\"dl_belong\":0,\"dl_referee\":0,\"dl_remark\":\"\",\"dl_address\":\"\\u6c5f\\u82cf\\u7701\\u5f90\\u5dde\\u5e02\\u7762\\u5b81\\u53bf\",\"dl_sheng\":\"32\",\"dl_shi\":\"3203\",\"dl_qu\":\"320324\",\"dl_qustr\":\"\\u6c5f\\u82cf\\u7701\\u5f90\\u5dde\\u5e02\\u7762\\u5b81\\u53bf\",\"dl_openid\":\"\",\"dl_weixin\":\"15365433666\",\"dl_wxnickname\":\"\",\"dl_wxsex\":0,\"dl_wxprovince\":\"\",\"dl_wxcity\":\"\",\"dl_wxcountry\":\"\",\"dl_wxheadimg\":\"\",\"dl_brand\":\"\",\"dl_brandlevel\":\"\"}', '2');
INSERT INTO `fw_log` VALUES ('1898', '1191', 'yunmei', '3321', '修改产品', '1531823063', '180.123.221.45', '/mp/product/edit_save', '{\"pro_id\":16,\"pro_name\":\"\\u5141\\u7f8e \\u51cf\\u4e4b\\u5708\\u4ee3\\u9910\\u997c\\u5e72\",\"pro_number\":\"\\u51cf\\u4e4b\\u5708\",\"pro_typeid\":19,\"pro_jftype\":1,\"pro_jifen\":0,\"pro_jfmax\":0,\"pro_dljf\":0,\"pro_desc\":\"\\u4e00\\u7bb1\\uff1a21\\u7247*20\\u76d2\",\"pro_link\":\"\",\"pro_barcode\":\"\",\"pro_remark\":\"\\u4e00\\u7bb1\\uff1a21\\u7247*20\\u76d2\",\"pro_price\":\"7600.00\",\"pro_stock\":0,\"pro_units\":\"\\u7bb1\",\"pro_dbiao\":1,\"pro_zbiao\":0,\"pro_xbiao\":20}', '1');
INSERT INTO `fw_log` VALUES ('1899', '1191', 'yunmei', '3321', '修改产品', '1531823275', '180.123.221.45', '/mp/product/edit_save', '{\"pro_id\":17,\"pro_name\":\"\\u5141\\u7f8e \\u9175\\u7d20\\u5496\\u5561\",\"pro_number\":\"KF\",\"pro_typeid\":20,\"pro_jftype\":1,\"pro_jifen\":0,\"pro_jfmax\":0,\"pro_dljf\":0,\"pro_desc\":\"\\u5496\\u55611\\u7bb1 15\\u888b*36\\u76d2\",\"pro_link\":\"\",\"pro_barcode\":\"\",\"pro_remark\":\"\\u5496\\u55611\\u7bb1 15\\u888b*36\\u76d2\",\"pro_price\":\"7600.00\",\"pro_stock\":0,\"pro_units\":\"\\u76d2\",\"pro_dbiao\":1,\"pro_zbiao\":0,\"pro_xbiao\":36}', '1');
INSERT INTO `fw_log` VALUES ('1900', '66', '654081', '3321', '经销商账号登录', '1531823608', '180.123.221.45', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('1901', '1191', 'yunmei', '3321', '修改产品价格体系', '1531823659', '180.123.221.45', '/mp/product/propriceedit_save', '[{\"dlt_id\":\"2\",\"dlt_unitcode\":\"3321\",\"dlt_name\":\"\\u7ba1\\u7406\\u8d26\\u53f7\",\"dlt_level\":\"1\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"0.00\",\"dlt_minnum\":\"3\",\"priprice\":\"7000\",\"pro_id\":\"17\"},{\"dlt_id\":\"3\",\"dlt_unitcode\":\"3321\",\"dlt_name\":\"\\u6267\\u884c\\u8463\\u4e8b\",\"dlt_level\":\"2\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"0.00\",\"dlt_minnum\":\"3\",\"priprice\":\"7000\",\"pro_id\":\"17\"}]', '1');
INSERT INTO `fw_log` VALUES ('1902', '1191', 'yunmei', '3321', '手机端基本设置', '1531823762', '180.123.221.45', '/mp/jfmobi/edit_save/action/basic', '{\"bas_sitename\":\"\\u5141\\u7f8e-\\u56e0\\u4f60\\u800c\\u7f8e\",\"bas_company\":\"\\u5f90\\u5dde\\u67cf\\u7f26\\u5546\\u8d38\\u6709\\u9650\\u516c\\u53f8\",\"bas_address\":\"\",\"bas_hotline\":\"400-168-1810\",\"bas_tel\":\"\",\"bas_fax\":\"\",\"bas_website\":\"http:\\/\\/www.bomanvip.com\",\"bas_weixin\":\"\",\"bas_weibo\":\"\"}', '1');
INSERT INTO `fw_log` VALUES ('1903', '1191', 'yunmei', '3321', '企业登录', '1531823943', '180.123.221.45', '/mp/login/logining', '', '1');
INSERT INTO `fw_log` VALUES ('1904', '1191', 'yunmei', '3321', '修改子用户', '1531823963', '180.123.221.45', '/mp/subuser/subuseradd_save', '{\"su_name\":\"\\u51fa\\u5e93\",\"su_pwd\":\"0e92ed5bef4b2458da02cf12ef3ea68e\",\"su_purview\":\"\"}', '1');
INSERT INTO `fw_log` VALUES ('1905', '1191', 'yunmei', '3321', '修改密码', '1531823978', '180.123.221.45', '/mp/index/updatepwd_save', '{\"qy_id\":1191,\"qy_code\":\"3321\",\"qy_pwd\":\"0e92ed5bef4b2458da02cf12ef3ea68e\"}', '0');
INSERT INTO `fw_log` VALUES ('1906', '1191', 'yunmei', '3321', '添加经销商级别', '1531825059', '180.123.221.45', '/mp/dealer/type_save', '{\"dlt_unitcode\":\"3321\",\"dlt_name\":\"\\u5b98\\u7f51\\u4ee3\\u7406\",\"dlt_level\":3,\"dlt_fanli1\":0,\"dlt_fanli2\":0,\"dlt_fanli3\":0,\"dlt_fanli4\":0,\"dlt_fanli5\":0,\"dlt_fanli6\":0,\"dlt_fanli7\":0,\"dlt_fanli8\":0,\"dlt_fanli9\":0,\"dlt_fanli10\":0,\"dlt_firstquota\":0,\"dlt_minnum\":\"1\"}', '1');
INSERT INTO `fw_log` VALUES ('1907', '1191', 'yunmei', '3321', '修改经销商级别', '1531825068', '180.123.221.45', '/mp/dealer/type_save', '{\"dlt_name\":\"\\u5b98\\u65b9\\u4ee3\\u7406\",\"dlt_level\":3,\"dlt_fanli1\":0,\"dlt_fanli2\":0,\"dlt_fanli3\":0,\"dlt_fanli4\":0,\"dlt_fanli5\":0,\"dlt_fanli6\":0,\"dlt_fanli7\":0,\"dlt_fanli8\":0,\"dlt_fanli9\":0,\"dlt_fanli10\":0,\"dlt_firstquota\":\"0.00\",\"dlt_minnum\":\"0\"}', '1');
INSERT INTO `fw_log` VALUES ('1908', '1191', 'yunmei', '3321', '添加经销商级别', '1531825089', '180.123.221.45', '/mp/dealer/type_save', '{\"dlt_unitcode\":\"3321\",\"dlt_name\":\"\\u94bb\\u77f3\\u4ee3\\u7406\",\"dlt_level\":4,\"dlt_fanli1\":0,\"dlt_fanli2\":0,\"dlt_fanli3\":0,\"dlt_fanli4\":0,\"dlt_fanli5\":0,\"dlt_fanli6\":0,\"dlt_fanli7\":0,\"dlt_fanli8\":0,\"dlt_fanli9\":0,\"dlt_fanli10\":0,\"dlt_firstquota\":0,\"dlt_minnum\":0}', '1');
INSERT INTO `fw_log` VALUES ('1909', '1191', 'yunmei', '3321', '添加经销商级别', '1531825103', '180.123.221.45', '/mp/dealer/type_save', '{\"dlt_unitcode\":\"3321\",\"dlt_name\":\"VIP\\u4ee3\\u7406\",\"dlt_level\":5,\"dlt_fanli1\":0,\"dlt_fanli2\":0,\"dlt_fanli3\":0,\"dlt_fanli4\":0,\"dlt_fanli5\":0,\"dlt_fanli6\":0,\"dlt_fanli7\":0,\"dlt_fanli8\":0,\"dlt_fanli9\":0,\"dlt_fanli10\":0,\"dlt_firstquota\":0,\"dlt_minnum\":0}', '1');
INSERT INTO `fw_log` VALUES ('1910', '1191', 'yunmei', '3321', '修改产品价格体系', '1531825167', '180.123.221.45', '/mp/product/propriceedit_save', '[{\"dlt_id\":\"2\",\"dlt_unitcode\":\"3321\",\"dlt_name\":\"\\u7ba1\\u7406\\u8d26\\u53f7\",\"dlt_level\":\"1\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"0.00\",\"dlt_minnum\":\"3\",\"priprice\":\"2100.00\",\"pro_id\":\"16\"},{\"dlt_id\":\"3\",\"dlt_unitcode\":\"3321\",\"dlt_name\":\"\\u6267\\u884c\\u8463\\u4e8b\",\"dlt_level\":\"2\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"0.00\",\"dlt_minnum\":\"3\",\"priprice\":\"3040.00\",\"pro_id\":\"16\"},{\"dlt_id\":\"6\",\"dlt_unitcode\":\"3321\",\"dlt_name\":\"\\u5b98\\u65b9\\u4ee3\\u7406\",\"dlt_level\":\"3\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"0.00\",\"dlt_minnum\":\"0\",\"priprice\":\"4180\",\"pro_id\":\"16\"},{\"dlt_id\":\"7\",\"dlt_unitcode\":\"3321\",\"dlt_name\":\"\\u94bb\\u77f3\\u4ee3\\u7406\",\"dlt_level\":\"4\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"0.00\",\"dlt_minnum\":\"0\",\"priprice\":\"5320\",\"pro_id\":\"16\"},{\"dlt_id\":\"8\",\"dlt_unitcode\":\"3321\",\"dlt_name\":\"VIP\\u4ee3\\u7406\",\"dlt_level\":\"5\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"0.00\",\"dlt_minnum\":\"0\",\"priprice\":\"6460\",\"pro_id\":\"16\"}]', '1');
INSERT INTO `fw_log` VALUES ('1911', '1191', 'yunmei', '3321', '修改产品价格体系', '1531825179', '180.123.221.45', '/mp/product/propriceedit_save', '[{\"dlt_id\":\"2\",\"dlt_unitcode\":\"3321\",\"dlt_name\":\"\\u7ba1\\u7406\\u8d26\\u53f7\",\"dlt_level\":\"1\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"0.00\",\"dlt_minnum\":\"3\",\"priprice\":\"7000.00\",\"pro_id\":\"17\"},{\"dlt_id\":\"3\",\"dlt_unitcode\":\"3321\",\"dlt_name\":\"\\u6267\\u884c\\u8463\\u4e8b\",\"dlt_level\":\"2\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"0.00\",\"dlt_minnum\":\"3\",\"priprice\":\"7000.00\",\"pro_id\":\"17\"},{\"dlt_id\":\"6\",\"dlt_unitcode\":\"3321\",\"dlt_name\":\"\\u5b98\\u65b9\\u4ee3\\u7406\",\"dlt_level\":\"3\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"0.00\",\"dlt_minnum\":\"0\",\"priprice\":\"7000.0\",\"pro_id\":\"17\"},{\"dlt_id\":\"7\",\"dlt_unitcode\":\"3321\",\"dlt_name\":\"\\u94bb\\u77f3\\u4ee3\\u7406\",\"dlt_level\":\"4\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"0.00\",\"dlt_minnum\":\"0\",\"priprice\":\"7000.0\",\"pro_id\":\"17\"},{\"dlt_id\":\"8\",\"dlt_unitcode\":\"3321\",\"dlt_name\":\"VIP\\u4ee3\\u7406\",\"dlt_level\":\"5\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"0.00\",\"dlt_minnum\":\"0\",\"priprice\":\"7000.0\",\"pro_id\":\"17\"}]', '1');
INSERT INTO `fw_log` VALUES ('1912', '1191', 'yunmei', '3321', '修改产品价格体系', '1531825196', '180.123.221.45', '/mp/product/propriceedit_save', '[{\"dlt_id\":\"2\",\"dlt_unitcode\":\"3321\",\"dlt_name\":\"\\u7ba1\\u7406\\u8d26\\u53f7\",\"dlt_level\":\"1\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"0.00\",\"dlt_minnum\":\"3\",\"priprice\":\"7600\",\"pro_id\":\"17\"},{\"dlt_id\":\"3\",\"dlt_unitcode\":\"3321\",\"dlt_name\":\"\\u6267\\u884c\\u8463\\u4e8b\",\"dlt_level\":\"2\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"0.00\",\"dlt_minnum\":\"3\",\"priprice\":\"7600\",\"pro_id\":\"17\"},{\"dlt_id\":\"6\",\"dlt_unitcode\":\"3321\",\"dlt_name\":\"\\u5b98\\u65b9\\u4ee3\\u7406\",\"dlt_level\":\"3\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"0.00\",\"dlt_minnum\":\"0\",\"priprice\":\"7600\",\"pro_id\":\"17\"},{\"dlt_id\":\"7\",\"dlt_unitcode\":\"3321\",\"dlt_name\":\"\\u94bb\\u77f3\\u4ee3\\u7406\",\"dlt_level\":\"4\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"0.00\",\"dlt_minnum\":\"0\",\"priprice\":\"7600\",\"pro_id\":\"17\"},{\"dlt_id\":\"8\",\"dlt_unitcode\":\"3321\",\"dlt_name\":\"VIP\\u4ee3\\u7406\",\"dlt_level\":\"5\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"0.00\",\"dlt_minnum\":\"0\",\"priprice\":\"7600\",\"pro_id\":\"17\"}]', '1');
INSERT INTO `fw_log` VALUES ('1913', '66', '654081', '3321', '经销商账号登录', '1531827759', '117.136.68.56', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('1914', '1191', 'yunmei', '3321', '企业登录', '1531828617', '121.233.44.162', '/mp/login/logining', '', '1');
INSERT INTO `fw_log` VALUES ('1915', '1191', 'yunmei', '3321', '删除经销商', '1531828664', '121.233.44.162', '/mp/dealer/delete/dl_id/68', '{\"dl_id\":\"68\",\"dl_unitcode\":\"3321\",\"dl_openid\":\"\",\"dl_username\":\"15365433666\",\"dl_pwd\":\"67526052c9cd9e8f85cb62da53568578\",\"dl_number\":\"N007702\",\"dl_name\":\"\\u82f1\\u5c11\\u67cf\",\"dl_des\":null,\"dl_area\":null,\"dl_type\":\"2\",\"dl_sttype\":\"0\",\"dl_belong\":\"0\",\"dl_referee\":\"0\",\"dl_level\":\"1\",\"dl_contact\":\"\\u82f1\\u5c11\\u67cf\",\"dl_tel\":\"15365423666\",\"dl_fax\":null,\"dl_email\":null,\"dl_weixin\":\"15365433666\",\"dl_wxnickname\":\"\",\"dl_wxsex\":\"0\",\"dl_wxprovince\":\"\",\"dl_wxcity\":\"\",\"dl_wxcountry\":\"\",\"dl_wxheadimg\":\"\",\"dl_qq\":null,\"dl_country\":\"0\",\"dl_sheng\":\"32\",\"dl_shi\":\"3203\",\"dl_qu\":\"320324\",\"dl_qustr\":\"\\u6c5f\\u82cf\\u7701\\u5f90\\u5dde\\u5e02\\u7762\\u5b81\\u53bf\",\"dl_address\":\"\\u6c5f\\u82cf\\u7701\\u5f90\\u5dde\\u5e02\\u7762\\u5b81\\u53bf\",\"dl_idcard\":\"320324199206260012\",\"dl_idcardpic\":\"\",\"dl_idcardpic2\":\"\",\"dl_tbdian\":\"\",\"dl_tbzhanggui\":\"\",\"dl_tbsqpic\":null,\"dl_tblevel\":null,\"dl_remark\":\"\",\"dl_status\":\"1\",\"dl_startdate\":\"1531823099\",\"dl_enddate\":\"1563359099\",\"dl_addtime\":\"1531823059\",\"dl_pic\":null,\"dl_brand\":\"\",\"dl_brandlevel\":\"\",\"dl_oddtime\":\"0\",\"dl_oddcount\":\"0\",\"dl_logintime\":\"0\",\"dl_fanli\":\"0.00\",\"dl_jifen\":\"0\",\"dl_lastflid\":\"0\",\"dl_flmodel\":\"0\",\"dl_deposit\":\"0.00\",\"dl_depositpic\":null,\"dl_paypic\":null}', '1');
INSERT INTO `fw_log` VALUES ('1916', '69', '15365423666', '3321', '代理商注册', '1531828782', '49.92.154.107', '/baiman/dealer/qyjxapply', '{\"dl_username\":\"15365423666\",\"dl_pwd\":\"67526052c9cd9e8f85cb62da53568578\",\"dl_number\":\"\",\"dl_unitcode\":\"3321\",\"dl_name\":\"\\u82f1\\u5c11\\u67cf\",\"dl_contact\":\"\\u82f1\\u5c11\\u67cf\",\"dl_tel\":\"15365423666\",\"dl_idcard\":\"320324199206260012\",\"dl_idcardpic\":\"\",\"dl_idcardpic2\":\"\",\"dl_tbdian\":\"\",\"dl_tbzhanggui\":\"\",\"dl_addtime\":1531828782,\"dl_status\":0,\"dl_level\":\"1\",\"dl_type\":2,\"dl_sttype\":0,\"dl_belong\":0,\"dl_referee\":0,\"dl_remark\":\"\",\"dl_address\":\"\\u6c5f\\u82cf\\u7701\\u5f90\\u5dde\\u5e02\\u7762\\u5b81\\u53bf\",\"dl_sheng\":\"32\",\"dl_shi\":\"3203\",\"dl_qu\":\"320324\",\"dl_qustr\":\"\\u6c5f\\u82cf\\u7701\\u5f90\\u5dde\\u5e02\\u7762\\u5b81\\u53bf\",\"dl_openid\":\"\",\"dl_weixin\":\"15365423666\",\"dl_wxnickname\":\"\",\"dl_wxsex\":0,\"dl_wxprovince\":\"\",\"dl_wxcity\":\"\",\"dl_wxcountry\":\"\",\"dl_wxheadimg\":\"\",\"dl_brand\":\"\",\"dl_brandlevel\":\"\"}', '2');
INSERT INTO `fw_log` VALUES ('1917', '69', '15365423666', '3321', '经销商账号登录', '1531828867', '49.92.154.107', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('1918', '1191', 'yunmei', '3321', '修改产品', '1531828897', '121.233.44.162', '/mp/product/edit_save', '{\"pro_id\":16,\"pro_name\":\"\\u5141\\u7f8e \\u51cf\\u4e4b\\u5708\\u4ee3\\u9910\\u997c\\u5e72\",\"pro_number\":\"21\\u7247\",\"pro_typeid\":19,\"pro_jftype\":1,\"pro_jifen\":0,\"pro_jfmax\":0,\"pro_dljf\":0,\"pro_desc\":\"\\u4e00\\u7bb1\\uff1a21\\u7247*20\\u76d2\",\"pro_link\":\"\",\"pro_barcode\":\"\",\"pro_remark\":\"\\u4e00\\u7bb1\\uff1a21\\u7247*20\\u76d2\",\"pro_price\":\"7600.00\",\"pro_stock\":0,\"pro_units\":\"\\u7bb1\",\"pro_dbiao\":1,\"pro_zbiao\":0,\"pro_xbiao\":20}', '1');
INSERT INTO `fw_log` VALUES ('1919', '70', '15862222202', '3321', '代理商注册', '1531828899', '122.96.40.69', '/baiman/dealer/qyjxapply', '{\"dl_username\":\"15862222202\",\"dl_pwd\":\"30a0ac89b57793ffd3dcb327457f980e\",\"dl_number\":\"\",\"dl_unitcode\":\"3321\",\"dl_name\":\"\\u6768\\u5c1a\",\"dl_contact\":\"\\u6768\\u5c1a\",\"dl_tel\":\"15862222202\",\"dl_idcard\":\"320324199005270310\",\"dl_idcardpic\":\"\",\"dl_idcardpic2\":\"\",\"dl_tbdian\":\"\",\"dl_tbzhanggui\":\"\",\"dl_addtime\":1531828899,\"dl_status\":0,\"dl_level\":\"1\",\"dl_type\":2,\"dl_sttype\":0,\"dl_belong\":0,\"dl_referee\":0,\"dl_remark\":\"\",\"dl_address\":\"\\u6c5f\\u82cf\\u7701\\u5f90\\u5dde\\u5e02\\u7762\\u5b81\\u53bf\",\"dl_sheng\":\"32\",\"dl_shi\":\"3203\",\"dl_qu\":\"320324\",\"dl_qustr\":\"\\u6c5f\\u82cf\\u7701\\u5f90\\u5dde\\u5e02\\u7762\\u5b81\\u53bf\",\"dl_openid\":\"\",\"dl_weixin\":\"15862222202\",\"dl_wxnickname\":\"\",\"dl_wxsex\":0,\"dl_wxprovince\":\"\",\"dl_wxcity\":\"\",\"dl_wxcountry\":\"\",\"dl_wxheadimg\":\"\",\"dl_brand\":\"\",\"dl_brandlevel\":\"\"}', '2');
INSERT INTO `fw_log` VALUES ('1920', '70', '15862222202', '3321', '经销商账号登录', '1531828938', '122.96.40.69', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('1921', '66', '654081', '3321', '经销商账号登录', '1531832839', '117.136.46.132', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('1922', '1191', 'yunmei', '3321', '企业登录', '1531834788', '117.136.46.132', '/mp/login/logining', '', '1');
INSERT INTO `fw_log` VALUES ('1923', '1191', 'yunmei', '3321', '企业登录', '1531835196', '58.218.14.40', '/mp/login/logining', '', '1');
INSERT INTO `fw_log` VALUES ('1924', '66', '654081', '3321', '经销商账号登录', '1531876548', '58.218.14.40', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('1925', '1191', 'yunmei', '3321', '企业登录', '1531877601', '113.109.123.61', '/mp/login/logining', '', '1');
INSERT INTO `fw_log` VALUES ('1926', '1191', 'yunmei', '3321', '企业登录', '1531881214', '58.218.14.40', '/mp/login/logining', '', '1');
INSERT INTO `fw_log` VALUES ('1927', '71', '15298791234', '3321', '代理商注册', '1531881616', '114.234.210.212', '/baiman/dealer/qyjxapply', '{\"dl_username\":\"15298791234\",\"dl_pwd\":\"3964ec6e01900b9b92bd5f2c702df7ed\",\"dl_number\":\"\",\"dl_unitcode\":\"3321\",\"dl_name\":\"\\u80e1\\u4e1c\",\"dl_contact\":\"\\u80e1\\u4e1c\",\"dl_tel\":\"15298791234\",\"dl_idcard\":\"320324199011070032\",\"dl_idcardpic\":\"\",\"dl_idcardpic2\":\"\",\"dl_tbdian\":\"\",\"dl_tbzhanggui\":\"\",\"dl_addtime\":1531881616,\"dl_status\":0,\"dl_level\":\"1\",\"dl_type\":2,\"dl_sttype\":0,\"dl_belong\":0,\"dl_referee\":0,\"dl_remark\":\"\",\"dl_address\":\"\\u6c5f\\u82cf\\u7701\\u5f90\\u5dde\\u5e02\\u7762\\u5b81\\u53bf\\u6587\\u5b66\\u5317\\u8def\\u540d\\u90fd\\u9152\\u5e97\\u897f100\\u7c73 \\u5916\\u661f\\u4eba\",\"dl_sheng\":\"32\",\"dl_shi\":\"3203\",\"dl_qu\":\"0\",\"dl_qustr\":\"\\u6c5f\\u82cf\\u7701\\u5f90\\u5dde\\u5e02\",\"dl_openid\":\"\",\"dl_weixin\":\"15298791234\",\"dl_wxnickname\":\"\",\"dl_wxsex\":0,\"dl_wxprovince\":\"\",\"dl_wxcity\":\"\",\"dl_wxcountry\":\"\",\"dl_wxheadimg\":\"\",\"dl_brand\":\"\",\"dl_brandlevel\":\"\"}', '2');
INSERT INTO `fw_log` VALUES ('1928', '8', 'yunmei:chuku', '3321', '企业APP子用户登录', '1531903301', '180.124.94.228', '/zxapi/login/index', '{\"su_id\":\"8\",\"su_unitcode\":\"3321\",\"su_username\":\"chuku\",\"su_pwd\":\"0e92ed5bef4b2458da02cf12ef3ea68e\",\"su_openid\":null,\"su_wxnickname\":null,\"su_wxsex\":\"0\",\"su_wxprovince\":null,\"su_wxcity\":null,\"su_wxcountry\":null,\"su_wxheadimg\":null,\"su_weixin\":null,\"su_name\":\"\\u51fa\\u5e93\",\"su_logintime\":\"1531727654\",\"su_errlogintime\":\"1531727654\",\"su_errtimes\":\"0\",\"su_remark\":null,\"su_status\":\"1\",\"su_belong\":\"0\",\"su_purview\":\"\"}', '1');
INSERT INTO `fw_log` VALUES ('1929', '8', 'yunmei:chuku', '3321', '企业APP子用户登录', '1531903316', '180.124.94.228', '/zxapi/login/index', '{\"su_id\":\"8\",\"su_unitcode\":\"3321\",\"su_username\":\"chuku\",\"su_pwd\":\"0e92ed5bef4b2458da02cf12ef3ea68e\",\"su_openid\":null,\"su_wxnickname\":null,\"su_wxsex\":\"0\",\"su_wxprovince\":null,\"su_wxcity\":null,\"su_wxcountry\":null,\"su_wxheadimg\":null,\"su_weixin\":null,\"su_name\":\"\\u51fa\\u5e93\",\"su_logintime\":\"1531903301\",\"su_errlogintime\":\"1531903301\",\"su_errtimes\":\"0\",\"su_remark\":null,\"su_status\":\"1\",\"su_belong\":\"0\",\"su_purview\":\"\"}', '1');
INSERT INTO `fw_log` VALUES ('1930', '8', 'yunmei:chuku', '3321', '企业APP子用户登录', '1531903330', '180.124.94.228', '/zxapi/login/index', '{\"su_id\":\"8\",\"su_unitcode\":\"3321\",\"su_username\":\"chuku\",\"su_pwd\":\"0e92ed5bef4b2458da02cf12ef3ea68e\",\"su_openid\":null,\"su_wxnickname\":null,\"su_wxsex\":\"0\",\"su_wxprovince\":null,\"su_wxcity\":null,\"su_wxcountry\":null,\"su_wxheadimg\":null,\"su_weixin\":null,\"su_name\":\"\\u51fa\\u5e93\",\"su_logintime\":\"1531903316\",\"su_errlogintime\":\"1531903316\",\"su_errtimes\":\"0\",\"su_remark\":null,\"su_status\":\"1\",\"su_belong\":\"0\",\"su_purview\":\"\"}', '1');
INSERT INTO `fw_log` VALUES ('1931', '70', '15862222202', '3321', '经销商账号登录', '1531905739', '122.96.40.204', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('1932', '66', '654081', '3321', '经销商账号登录', '1532230222', '117.136.68.56', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('1933', '1191', 'yunmei', '3321', '企业登录', '1532241394', '180.123.220.244', '/mp/login/logining', '', '1');
INSERT INTO `fw_log` VALUES ('1934', '8', 'yunmei:chuku', '3321', '企业APP子用户登录', '1532404862', '180.123.221.203', '/zxapi/login/index', '{\"su_id\":\"8\",\"su_unitcode\":\"3321\",\"su_username\":\"chuku\",\"su_pwd\":\"0e92ed5bef4b2458da02cf12ef3ea68e\",\"su_openid\":null,\"su_wxnickname\":null,\"su_wxsex\":\"0\",\"su_wxprovince\":null,\"su_wxcity\":null,\"su_wxcountry\":null,\"su_wxheadimg\":null,\"su_weixin\":null,\"su_name\":\"\\u51fa\\u5e93\",\"su_logintime\":\"1531903330\",\"su_errlogintime\":\"1531903330\",\"su_errtimes\":\"0\",\"su_remark\":null,\"su_status\":\"1\",\"su_belong\":\"0\",\"su_purview\":\"\"}', '1');
INSERT INTO `fw_log` VALUES ('1935', '8', 'yunmei:chuku', '3321', '企业APP子用户登录', '1532418520', '180.123.221.203', '/zxapi/login/index', '{\"su_id\":\"8\",\"su_unitcode\":\"3321\",\"su_username\":\"chuku\",\"su_pwd\":\"0e92ed5bef4b2458da02cf12ef3ea68e\",\"su_openid\":null,\"su_wxnickname\":null,\"su_wxsex\":\"0\",\"su_wxprovince\":null,\"su_wxcity\":null,\"su_wxcountry\":null,\"su_wxheadimg\":null,\"su_weixin\":null,\"su_name\":\"\\u51fa\\u5e93\",\"su_logintime\":\"1532404862\",\"su_errlogintime\":\"1532404862\",\"su_errtimes\":\"0\",\"su_remark\":null,\"su_status\":\"1\",\"su_belong\":\"0\",\"su_purview\":\"\"}', '1');
INSERT INTO `fw_log` VALUES ('1936', '69', '15365423666', '3321', '经销商账号登录', '1532433146', '49.90.57.189', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('1937', '8', 'yunmei:chuku', '3321', '出货导入', '1532433306', '49.95.126.187', '/zxapi/order/odshipscanres_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201807241953052656\",\"ship_deliver\":0,\"ship_dealer\":\"69\",\"ship_pro\":\"16\",\"ship_odid\":62,\"ship_odblid\":62,\"ship_oddtid\":73,\"ship_whid\":7,\"ship_proqty\":\"20\",\"ship_barcode\":\"10000065\",\"ship_date\":1532433306,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"8\",\"ship_czuser\":\"yunmei:chuku\"}', '1');
INSERT INTO `fw_log` VALUES ('1938', '8', 'yunmei:chuku', '3321', '出货导入', '1532433306', '49.95.126.187', '/zxapi/order/odshipscanres_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201807241953052656\",\"ship_deliver\":0,\"ship_dealer\":\"69\",\"ship_pro\":\"16\",\"ship_odid\":62,\"ship_odblid\":62,\"ship_oddtid\":73,\"ship_whid\":7,\"ship_proqty\":\"20\",\"ship_barcode\":\"10000077\",\"ship_date\":1532433306,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"8\",\"ship_czuser\":\"yunmei:chuku\"}', '1');
INSERT INTO `fw_log` VALUES ('1939', '8', 'yunmei:chuku', '3321', '出货导入', '1532433306', '49.95.126.187', '/zxapi/order/odshipscanres_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201807241953052656\",\"ship_deliver\":0,\"ship_dealer\":\"69\",\"ship_pro\":\"16\",\"ship_odid\":62,\"ship_odblid\":62,\"ship_oddtid\":73,\"ship_whid\":7,\"ship_proqty\":\"20\",\"ship_barcode\":\"10000001\",\"ship_date\":1532433306,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"8\",\"ship_czuser\":\"yunmei:chuku\"}', '1');
INSERT INTO `fw_log` VALUES ('1940', '8', 'yunmei:chuku', '3321', '出货导入', '1532433306', '49.95.126.187', '/zxapi/order/odshipscanres_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201807241953052656\",\"ship_deliver\":0,\"ship_dealer\":\"69\",\"ship_pro\":\"16\",\"ship_odid\":62,\"ship_odblid\":62,\"ship_oddtid\":73,\"ship_whid\":7,\"ship_proqty\":\"20\",\"ship_barcode\":\"10000154\",\"ship_date\":1532433306,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"8\",\"ship_czuser\":\"yunmei:chuku\"}', '1');
INSERT INTO `fw_log` VALUES ('1941', '8', 'yunmei:chuku', '3321', '出货导入', '1532433306', '49.95.126.187', '/zxapi/order/odshipscanres_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201807241953052656\",\"ship_deliver\":0,\"ship_dealer\":\"69\",\"ship_pro\":\"16\",\"ship_odid\":62,\"ship_odblid\":62,\"ship_oddtid\":73,\"ship_whid\":7,\"ship_proqty\":\"20\",\"ship_barcode\":\"10000100\",\"ship_date\":1532433306,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"8\",\"ship_czuser\":\"yunmei:chuku\"}', '1');
INSERT INTO `fw_log` VALUES ('1942', '8', 'yunmei:chuku', '3321', '出货导入', '1532433306', '49.95.126.187', '/zxapi/order/odshipscanres_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201807241953052656\",\"ship_deliver\":0,\"ship_dealer\":\"69\",\"ship_pro\":\"16\",\"ship_odid\":62,\"ship_odblid\":62,\"ship_oddtid\":73,\"ship_whid\":7,\"ship_proqty\":\"20\",\"ship_barcode\":\"10000112\",\"ship_date\":1532433306,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"8\",\"ship_czuser\":\"yunmei:chuku\"}', '1');
INSERT INTO `fw_log` VALUES ('1943', '8', 'yunmei:chuku', '3321', '出货导入', '1532433306', '49.95.126.187', '/zxapi/order/odshipscanres_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201807241953052656\",\"ship_deliver\":0,\"ship_dealer\":\"69\",\"ship_pro\":\"16\",\"ship_odid\":62,\"ship_odblid\":62,\"ship_oddtid\":73,\"ship_whid\":7,\"ship_proqty\":\"20\",\"ship_barcode\":\"10000114\",\"ship_date\":1532433306,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"8\",\"ship_czuser\":\"yunmei:chuku\"}', '1');
INSERT INTO `fw_log` VALUES ('1944', '8', 'yunmei:chuku', '3321', '出货导入', '1532433306', '49.95.126.187', '/zxapi/order/odshipscanres_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201807241953052656\",\"ship_deliver\":0,\"ship_dealer\":\"69\",\"ship_pro\":\"16\",\"ship_odid\":62,\"ship_odblid\":62,\"ship_oddtid\":73,\"ship_whid\":7,\"ship_proqty\":\"20\",\"ship_barcode\":\"10000017\",\"ship_date\":1532433306,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"8\",\"ship_czuser\":\"yunmei:chuku\"}', '1');
INSERT INTO `fw_log` VALUES ('1945', '8', 'yunmei:chuku', '3321', '出货导入', '1532433306', '49.95.126.187', '/zxapi/order/odshipscanres_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201807241953052656\",\"ship_deliver\":0,\"ship_dealer\":\"69\",\"ship_pro\":\"16\",\"ship_odid\":62,\"ship_odblid\":62,\"ship_oddtid\":73,\"ship_whid\":7,\"ship_proqty\":\"20\",\"ship_barcode\":\"10000053\",\"ship_date\":1532433306,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"8\",\"ship_czuser\":\"yunmei:chuku\"}', '1');
INSERT INTO `fw_log` VALUES ('1946', '8', 'yunmei:chuku', '3321', '出货导入', '1532433306', '49.95.126.187', '/zxapi/order/odshipscanres_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201807241953052656\",\"ship_deliver\":0,\"ship_dealer\":\"69\",\"ship_pro\":\"16\",\"ship_odid\":62,\"ship_odblid\":62,\"ship_oddtid\":73,\"ship_whid\":7,\"ship_proqty\":\"20\",\"ship_barcode\":\"10000058\",\"ship_date\":1532433306,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"8\",\"ship_czuser\":\"yunmei:chuku\"}', '1');
INSERT INTO `fw_log` VALUES ('1947', '70', '15862222202', '3321', '经销商账号登录', '1532434018', '122.96.41.224', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('1948', '8', 'yunmei:chuku', '3321', '出货导入', '1532434120', '49.95.126.187', '/zxapi/order/odshipscanres_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201807242007324812\",\"ship_deliver\":0,\"ship_dealer\":\"70\",\"ship_pro\":\"16\",\"ship_odid\":63,\"ship_odblid\":63,\"ship_oddtid\":74,\"ship_whid\":7,\"ship_proqty\":\"20\",\"ship_barcode\":\"10000078\",\"ship_date\":1532434120,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"8\",\"ship_czuser\":\"yunmei:chuku\"}', '1');
INSERT INTO `fw_log` VALUES ('1949', '8', 'yunmei:chuku', '3321', '出货导入', '1532434120', '49.95.126.187', '/zxapi/order/odshipscanres_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201807242007324812\",\"ship_deliver\":0,\"ship_dealer\":\"70\",\"ship_pro\":\"16\",\"ship_odid\":63,\"ship_odblid\":63,\"ship_oddtid\":74,\"ship_whid\":7,\"ship_proqty\":\"20\",\"ship_barcode\":\"10000118\",\"ship_date\":1532434120,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"8\",\"ship_czuser\":\"yunmei:chuku\"}', '1');
INSERT INTO `fw_log` VALUES ('1950', '67', '13636393523', '3321', '经销商账号登录', '1532436813', '121.233.44.121', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('1951', '66', '654081', '3321', '经销商账号登录', '1532445075', '121.233.39.172', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('1952', '1191', 'yunmei', '3321', '企业登录', '1532445127', '121.233.39.172', '/mp/login/logining', '', '1');
INSERT INTO `fw_log` VALUES ('1953', '66', '654081', '3321', '经销商账号登录', '1532482912', '121.233.39.172', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('1954', '71', '15298791234', '3321', '经销商账号登录', '1532483784', '117.136.46.114', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('1955', '67', '13636393523', '3321', '经销商账号登录', '1532500948', '180.123.221.203', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('1956', '69', '15365423666', '3321', '经销商账号登录', '1532501030', '49.90.57.189', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('1957', '8', 'yunmei:chuku', '3321', '出货导入', '1532501097', '180.123.221.203', '/zxapi/order/odshipscanres_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201807251443255582\",\"ship_deliver\":0,\"ship_dealer\":\"67\",\"ship_pro\":\"16\",\"ship_odid\":64,\"ship_odblid\":64,\"ship_oddtid\":75,\"ship_whid\":7,\"ship_proqty\":\"20\",\"ship_barcode\":\"10000079\",\"ship_date\":1532501097,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"8\",\"ship_czuser\":\"yunmei:chuku\"}', '1');
INSERT INTO `fw_log` VALUES ('1958', '8', 'yunmei:chuku', '3321', '出货导入', '1532501097', '180.123.221.203', '/zxapi/order/odshipscanres_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201807251443255582\",\"ship_deliver\":0,\"ship_dealer\":\"67\",\"ship_pro\":\"16\",\"ship_odid\":64,\"ship_odblid\":64,\"ship_oddtid\":75,\"ship_whid\":7,\"ship_proqty\":\"20\",\"ship_barcode\":\"10000094\",\"ship_date\":1532501097,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"8\",\"ship_czuser\":\"yunmei:chuku\"}', '1');
INSERT INTO `fw_log` VALUES ('1959', '71', '15298791234', '3321', '经销商账号登录', '1532502851', '117.136.46.142', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('1960', '8', 'yunmei:chuku', '3321', '企业APP子用户登录', '1532503035', '49.90.139.28', '/zxapi/login/index', '{\"su_id\":\"8\",\"su_unitcode\":\"3321\",\"su_username\":\"chuku\",\"su_pwd\":\"0e92ed5bef4b2458da02cf12ef3ea68e\",\"su_openid\":null,\"su_wxnickname\":null,\"su_wxsex\":\"0\",\"su_wxprovince\":null,\"su_wxcity\":null,\"su_wxcountry\":null,\"su_wxheadimg\":null,\"su_weixin\":null,\"su_name\":\"\\u51fa\\u5e93\",\"su_logintime\":\"1532418520\",\"su_errlogintime\":\"1532418520\",\"su_errtimes\":\"0\",\"su_remark\":null,\"su_status\":\"1\",\"su_belong\":\"0\",\"su_purview\":\"\"}', '1');
INSERT INTO `fw_log` VALUES ('1961', '8', 'yunmei:chuku', '3321', '出货导入', '1532511061', '180.123.221.203', '/zxapi/order/odshipscanres_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201807251730203205\",\"ship_deliver\":0,\"ship_dealer\":\"67\",\"ship_pro\":\"16\",\"ship_odid\":66,\"ship_odblid\":66,\"ship_oddtid\":77,\"ship_whid\":7,\"ship_proqty\":\"20\",\"ship_barcode\":\"10000076\",\"ship_date\":1532511061,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"8\",\"ship_czuser\":\"yunmei:chuku\"}', '1');
INSERT INTO `fw_log` VALUES ('1962', '8', 'yunmei:chuku', '3321', '出货导入', '1532511061', '180.123.221.203', '/zxapi/order/odshipscanres_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201807251730203205\",\"ship_deliver\":0,\"ship_dealer\":\"67\",\"ship_pro\":\"16\",\"ship_odid\":66,\"ship_odblid\":66,\"ship_oddtid\":77,\"ship_whid\":7,\"ship_proqty\":\"20\",\"ship_barcode\":\"10000111\",\"ship_date\":1532511061,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"8\",\"ship_czuser\":\"yunmei:chuku\"}', '1');
INSERT INTO `fw_log` VALUES ('1963', '66', '654081', '3321', '经销商账号登录', '1532515220', '180.123.221.203', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('1964', '8', 'yunmei:chuku', '3321', '出货导入', '1532518372', '180.123.221.203', '/zxapi/order/odshipscanres_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201807251929129517\",\"ship_deliver\":0,\"ship_dealer\":\"71\",\"ship_pro\":\"16\",\"ship_odid\":67,\"ship_odblid\":67,\"ship_oddtid\":78,\"ship_whid\":7,\"ship_proqty\":\"20\",\"ship_barcode\":\"10000043\",\"ship_date\":1532518372,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"8\",\"ship_czuser\":\"yunmei:chuku\"}', '1');
INSERT INTO `fw_log` VALUES ('1965', '8', 'yunmei:chuku', '3321', '出货导入', '1532518372', '180.123.221.203', '/zxapi/order/odshipscanres_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201807251929129517\",\"ship_deliver\":0,\"ship_dealer\":\"71\",\"ship_pro\":\"16\",\"ship_odid\":67,\"ship_odblid\":67,\"ship_oddtid\":78,\"ship_whid\":7,\"ship_proqty\":\"20\",\"ship_barcode\":\"10000096\",\"ship_date\":1532518372,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"8\",\"ship_czuser\":\"yunmei:chuku\"}', '1');
INSERT INTO `fw_log` VALUES ('1966', '8', 'yunmei:chuku', '3321', '出货导入', '1532518372', '180.123.221.203', '/zxapi/order/odshipscanres_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201807251929129517\",\"ship_deliver\":0,\"ship_dealer\":\"71\",\"ship_pro\":\"16\",\"ship_odid\":67,\"ship_odblid\":67,\"ship_oddtid\":78,\"ship_whid\":7,\"ship_proqty\":\"20\",\"ship_barcode\":\"10000007\",\"ship_date\":1532518372,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"8\",\"ship_czuser\":\"yunmei:chuku\"}', '1');
INSERT INTO `fw_log` VALUES ('1967', '8', 'yunmei:chuku', '3321', '出货导入', '1532518372', '180.123.221.203', '/zxapi/order/odshipscanres_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201807251929129517\",\"ship_deliver\":0,\"ship_dealer\":\"71\",\"ship_pro\":\"16\",\"ship_odid\":67,\"ship_odblid\":67,\"ship_oddtid\":78,\"ship_whid\":7,\"ship_proqty\":\"20\",\"ship_barcode\":\"10000095\",\"ship_date\":1532518372,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"8\",\"ship_czuser\":\"yunmei:chuku\"}', '1');
INSERT INTO `fw_log` VALUES ('1968', '8', 'yunmei:chuku', '3321', '出货导入', '1532518372', '180.123.221.203', '/zxapi/order/odshipscanres_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201807251929129517\",\"ship_deliver\":0,\"ship_dealer\":\"71\",\"ship_pro\":\"16\",\"ship_odid\":67,\"ship_odblid\":67,\"ship_oddtid\":78,\"ship_whid\":7,\"ship_proqty\":\"20\",\"ship_barcode\":\"10000003\",\"ship_date\":1532518372,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"8\",\"ship_czuser\":\"yunmei:chuku\"}', '1');
INSERT INTO `fw_log` VALUES ('1969', '8', 'yunmei:chuku', '3321', '出货导入', '1532518372', '180.123.221.203', '/zxapi/order/odshipscanres_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201807251929129517\",\"ship_deliver\":0,\"ship_dealer\":\"71\",\"ship_pro\":\"16\",\"ship_odid\":67,\"ship_odblid\":67,\"ship_oddtid\":78,\"ship_whid\":7,\"ship_proqty\":\"20\",\"ship_barcode\":\"10000052\",\"ship_date\":1532518372,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"8\",\"ship_czuser\":\"yunmei:chuku\"}', '1');
INSERT INTO `fw_log` VALUES ('1970', '8', 'yunmei:chuku', '3321', '出货导入', '1532518372', '180.123.221.203', '/zxapi/order/odshipscanres_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201807251929129517\",\"ship_deliver\":0,\"ship_dealer\":\"71\",\"ship_pro\":\"16\",\"ship_odid\":67,\"ship_odblid\":67,\"ship_oddtid\":78,\"ship_whid\":7,\"ship_proqty\":\"20\",\"ship_barcode\":\"10000015\",\"ship_date\":1532518372,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"8\",\"ship_czuser\":\"yunmei:chuku\"}', '1');
INSERT INTO `fw_log` VALUES ('1971', '8', 'yunmei:chuku', '3321', '出货导入', '1532518372', '180.123.221.203', '/zxapi/order/odshipscanres_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201807251929129517\",\"ship_deliver\":0,\"ship_dealer\":\"71\",\"ship_pro\":\"16\",\"ship_odid\":67,\"ship_odblid\":67,\"ship_oddtid\":78,\"ship_whid\":7,\"ship_proqty\":\"20\",\"ship_barcode\":\"10000072\",\"ship_date\":1532518372,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"8\",\"ship_czuser\":\"yunmei:chuku\"}', '1');
INSERT INTO `fw_log` VALUES ('1972', '8', 'yunmei:chuku', '3321', '出货导入', '1532518372', '180.123.221.203', '/zxapi/order/odshipscanres_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201807251929129517\",\"ship_deliver\":0,\"ship_dealer\":\"71\",\"ship_pro\":\"16\",\"ship_odid\":67,\"ship_odblid\":67,\"ship_oddtid\":78,\"ship_whid\":7,\"ship_proqty\":\"20\",\"ship_barcode\":\"10000022\",\"ship_date\":1532518372,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"8\",\"ship_czuser\":\"yunmei:chuku\"}', '1');
INSERT INTO `fw_log` VALUES ('1973', '8', 'yunmei:chuku', '3321', '出货导入', '1532518372', '180.123.221.203', '/zxapi/order/odshipscanres_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201807251929129517\",\"ship_deliver\":0,\"ship_dealer\":\"71\",\"ship_pro\":\"16\",\"ship_odid\":67,\"ship_odblid\":67,\"ship_oddtid\":78,\"ship_whid\":7,\"ship_proqty\":\"20\",\"ship_barcode\":\"10000098\",\"ship_date\":1532518372,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"8\",\"ship_czuser\":\"yunmei:chuku\"}', '1');
INSERT INTO `fw_log` VALUES ('1974', '72', 'maoyu517', '3321', '代理商注册', '1532520157', '117.136.68.48', '/baiman/dealer/apply', '{\"dl_username\":\"maoyu517\",\"dl_pwd\":\"e7df5ec9971637a3137a212347f55db6\",\"dl_number\":\"\",\"dl_unitcode\":\"3321\",\"dl_name\":\"\\u9648\\u5b87\",\"dl_contact\":\"\\u9648\\u5b87\",\"dl_tel\":\"18752575777\",\"dl_idcard\":\"320324199406250329\",\"dl_idcardpic\":\"\",\"dl_idcardpic2\":\"\",\"dl_tbdian\":\"\",\"dl_tbzhanggui\":\"\",\"dl_addtime\":1532520157,\"dl_status\":0,\"dl_level\":\"2\",\"dl_type\":3,\"dl_sttype\":0,\"dl_belong\":\"71\",\"dl_referee\":71,\"dl_remark\":\"\",\"dl_address\":\"\\u6c5f\\u82cf\\u7701\\u5f90\\u5dde\\u5e02\\u7762\\u5b81\\u53bf\",\"dl_sheng\":\"32\",\"dl_shi\":\"3203\",\"dl_qu\":\"320324\",\"dl_qustr\":\"\\u6c5f\\u82cf\\u7701\\u5f90\\u5dde\\u5e02\\u7762\\u5b81\\u53bf\",\"dl_openid\":\"\",\"dl_weixin\":\"maoyu517\",\"dl_wxnickname\":\"\",\"dl_wxsex\":0,\"dl_wxprovince\":\"\",\"dl_wxcity\":\"\",\"dl_wxcountry\":\"\",\"dl_wxheadimg\":\"\",\"dl_brand\":\"\",\"dl_brandlevel\":\"\"}', '2');
INSERT INTO `fw_log` VALUES ('1975', '1191', 'yunmei', '3321', '企业登录', '1532520346', '180.123.221.203', '/mp/login/logining', '', '1');
INSERT INTO `fw_log` VALUES ('1976', '66', '654081', '3321', '经销商账号登录', '1532520414', '180.123.221.203', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('1977', '1191', 'yunmei', '3321', '删除订单', '1532520585', '180.123.221.203', '/mp/orders/deleteorder/od_id/65', '{\"od_id\":\"65\",\"od_unitcode\":\"3321\",\"od_orderid\":\"201807251520001401\",\"od_total\":\"2097900.00\",\"od_addtime\":\"1532503200\",\"od_oddlid\":\"71\",\"od_contact\":\"\\u80e1\\u4e1c\",\"od_addressid\":\"56\",\"od_sheng\":\"32\",\"od_shi\":\"3203\",\"od_qu\":\"0\",\"od_jie\":\"0\",\"od_address\":\"\\u6c5f\\u82cf\\u7701\\u5f90\\u5dde\\u5e02\\u7762\\u5b81\\u53bf\\u6587\\u5b66\\u5317\\u8def\\u540d\\u90fd\\u9152\\u5e97\\u897f100\\u7c73 \\u5916\\u661f\\u4eba\",\"od_tel\":\"15298791234\",\"od_express\":\"0\",\"od_expressnum\":\"\",\"od_expressdate\":\"0\",\"od_remark\":null,\"od_state\":\"9\",\"od_stead\":\"0\",\"od_blid\":\"0\",\"od_paymode\":\"0\"}', '1');
INSERT INTO `fw_log` VALUES ('1978', '1191', 'yunmei', '3321', '修改经销商', '1532520735', '180.123.221.203', '/mp/dealer/edit_save', '{\"dl_id\":72,\"dl_number\":\"N007705\",\"dl_name\":\"\\u9648\\u5b87\",\"dl_area\":\"\",\"dl_contact\":\"\\u9648\\u5b87\",\"dl_tel\":\"18752575777\",\"dl_fax\":\"\",\"dl_address\":\"\\u6c5f\\u82cf\\u7701\\u5f90\\u5dde\\u5e02\\u7762\\u5b81\\u53bf\",\"dl_email\":\"\",\"dl_qq\":\"\",\"dl_idcard\":\"320324199406250329\",\"dl_remark\":\"\",\"dl_des\":\"\",\"dl_weixin\":\"maoyu517\",\"dl_pwd\":\"0e92ed5bef4b2458da02cf12ef3ea68e\"}', '1');
INSERT INTO `fw_log` VALUES ('1979', '1191', 'yunmei', '3321', '企业登录', '1532590338', '180.124.222.82', '/mp/login/logining', '', '1');
INSERT INTO `fw_log` VALUES ('1980', '66', '654081', '3321', '经销商账号登录', '1532604066', '117.136.46.124', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('1981', '66', '654081', '3321', '经销商账号登录', '1532666463', '223.104.147.140', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('1982', '70', '15862222202', '3321', '经销商账号登录', '1532690491', '122.96.42.221', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('1983', '69', '15365423666', '3321', '经销商账号登录', '1532690528', '49.90.57.189', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('1984', '8', 'yunmei:chuku', '3321', '企业APP子用户登录', '1532690585', '49.90.139.28', '/zxapi/login/index', '{\"su_id\":\"8\",\"su_unitcode\":\"3321\",\"su_username\":\"chuku\",\"su_pwd\":\"0e92ed5bef4b2458da02cf12ef3ea68e\",\"su_openid\":null,\"su_wxnickname\":null,\"su_wxsex\":\"0\",\"su_wxprovince\":null,\"su_wxcity\":null,\"su_wxcountry\":null,\"su_wxheadimg\":null,\"su_weixin\":null,\"su_name\":\"\\u51fa\\u5e93\",\"su_logintime\":\"1532503035\",\"su_errlogintime\":\"1532503035\",\"su_errtimes\":\"0\",\"su_remark\":null,\"su_status\":\"1\",\"su_belong\":\"0\",\"su_purview\":\"\"}', '1');
INSERT INTO `fw_log` VALUES ('1985', '8', 'yunmei:chuku', '3321', '出货导入', '1532691587', '49.90.139.28', '/zxapi/order/odshipscanres_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201807271923238689\",\"ship_deliver\":0,\"ship_dealer\":\"69\",\"ship_pro\":\"16\",\"ship_odid\":69,\"ship_odblid\":69,\"ship_oddtid\":80,\"ship_whid\":7,\"ship_proqty\":\"20\",\"ship_barcode\":\"10000021\",\"ship_date\":1532691587,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"8\",\"ship_czuser\":\"yunmei:chuku\"}', '1');
INSERT INTO `fw_log` VALUES ('1986', '8', 'yunmei:chuku', '3321', '出货导入', '1532691587', '49.90.139.28', '/zxapi/order/odshipscanres_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201807271923238689\",\"ship_deliver\":0,\"ship_dealer\":\"69\",\"ship_pro\":\"16\",\"ship_odid\":69,\"ship_odblid\":69,\"ship_oddtid\":80,\"ship_whid\":7,\"ship_proqty\":\"20\",\"ship_barcode\":\"10000054\",\"ship_date\":1532691587,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"8\",\"ship_czuser\":\"yunmei:chuku\"}', '1');
INSERT INTO `fw_log` VALUES ('1987', '8', 'yunmei:chuku', '3321', '出货导入', '1532691587', '49.90.139.28', '/zxapi/order/odshipscanres_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201807271923238689\",\"ship_deliver\":0,\"ship_dealer\":\"69\",\"ship_pro\":\"16\",\"ship_odid\":69,\"ship_odblid\":69,\"ship_oddtid\":80,\"ship_whid\":7,\"ship_proqty\":\"20\",\"ship_barcode\":\"10000012\",\"ship_date\":1532691587,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"8\",\"ship_czuser\":\"yunmei:chuku\"}', '1');
INSERT INTO `fw_log` VALUES ('1988', '8', 'yunmei:chuku', '3321', '出货导入', '1532691587', '49.90.139.28', '/zxapi/order/odshipscanres_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201807271923238689\",\"ship_deliver\":0,\"ship_dealer\":\"69\",\"ship_pro\":\"16\",\"ship_odid\":69,\"ship_odblid\":69,\"ship_oddtid\":80,\"ship_whid\":7,\"ship_proqty\":\"20\",\"ship_barcode\":\"10000027\",\"ship_date\":1532691587,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"8\",\"ship_czuser\":\"yunmei:chuku\"}', '1');
INSERT INTO `fw_log` VALUES ('1989', '8', 'yunmei:chuku', '3321', '出货导入', '1532691587', '49.90.139.28', '/zxapi/order/odshipscanres_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201807271923238689\",\"ship_deliver\":0,\"ship_dealer\":\"69\",\"ship_pro\":\"16\",\"ship_odid\":69,\"ship_odblid\":69,\"ship_oddtid\":80,\"ship_whid\":7,\"ship_proqty\":\"20\",\"ship_barcode\":\"10000060\",\"ship_date\":1532691587,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"8\",\"ship_czuser\":\"yunmei:chuku\"}', '1');
INSERT INTO `fw_log` VALUES ('1990', '8', 'yunmei:chuku', '3321', '出货导入', '1532691650', '49.90.139.28', '/zxapi/order/odshipscanres_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201807271923248445\",\"ship_deliver\":0,\"ship_dealer\":\"70\",\"ship_pro\":\"16\",\"ship_odid\":70,\"ship_odblid\":70,\"ship_oddtid\":81,\"ship_whid\":7,\"ship_proqty\":\"20\",\"ship_barcode\":\"10000070\",\"ship_date\":1532691650,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"8\",\"ship_czuser\":\"yunmei:chuku\"}', '1');
INSERT INTO `fw_log` VALUES ('1991', '8', 'yunmei:chuku', '3321', '出货导入', '1532691650', '49.90.139.28', '/zxapi/order/odshipscanres_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201807271923248445\",\"ship_deliver\":0,\"ship_dealer\":\"70\",\"ship_pro\":\"16\",\"ship_odid\":70,\"ship_odblid\":70,\"ship_oddtid\":81,\"ship_whid\":7,\"ship_proqty\":\"20\",\"ship_barcode\":\"10000024\",\"ship_date\":1532691650,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"8\",\"ship_czuser\":\"yunmei:chuku\"}', '1');
INSERT INTO `fw_log` VALUES ('1992', '8', 'yunmei:chuku', '3321', '出货导入', '1532691650', '49.90.139.28', '/zxapi/order/odshipscanres_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201807271923248445\",\"ship_deliver\":0,\"ship_dealer\":\"70\",\"ship_pro\":\"16\",\"ship_odid\":70,\"ship_odblid\":70,\"ship_oddtid\":81,\"ship_whid\":7,\"ship_proqty\":\"20\",\"ship_barcode\":\"10000089\",\"ship_date\":1532691650,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"8\",\"ship_czuser\":\"yunmei:chuku\"}', '1');
INSERT INTO `fw_log` VALUES ('1993', '8', 'yunmei:chuku', '3321', '出货导入', '1532691650', '49.90.139.28', '/zxapi/order/odshipscanres_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201807271923248445\",\"ship_deliver\":0,\"ship_dealer\":\"70\",\"ship_pro\":\"16\",\"ship_odid\":70,\"ship_odblid\":70,\"ship_oddtid\":81,\"ship_whid\":7,\"ship_proqty\":\"20\",\"ship_barcode\":\"10000061\",\"ship_date\":1532691650,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"8\",\"ship_czuser\":\"yunmei:chuku\"}', '1');
INSERT INTO `fw_log` VALUES ('1994', '8', 'yunmei:chuku', '3321', '出货导入', '1532691650', '49.90.139.28', '/zxapi/order/odshipscanres_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201807271923248445\",\"ship_deliver\":0,\"ship_dealer\":\"70\",\"ship_pro\":\"16\",\"ship_odid\":70,\"ship_odblid\":70,\"ship_oddtid\":81,\"ship_whid\":7,\"ship_proqty\":\"20\",\"ship_barcode\":\"10000080\",\"ship_date\":1532691650,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"8\",\"ship_czuser\":\"yunmei:chuku\"}', '1');
INSERT INTO `fw_log` VALUES ('1995', '8', 'yunmei:chuku', '3321', '出货导入', '1532752320', '49.90.139.28', '/zxapi/order/odshipscanres_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201807251929129517\",\"ship_deliver\":0,\"ship_dealer\":\"71\",\"ship_pro\":\"16\",\"ship_odid\":67,\"ship_odblid\":67,\"ship_oddtid\":78,\"ship_whid\":7,\"ship_proqty\":\"20\",\"ship_barcode\":\"10000081\",\"ship_date\":1532752320,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"8\",\"ship_czuser\":\"yunmei:chuku\"}', '1');
INSERT INTO `fw_log` VALUES ('1996', '8', 'yunmei:chuku', '3321', '出货导入', '1532752320', '49.90.139.28', '/zxapi/order/odshipscanres_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201807251929129517\",\"ship_deliver\":0,\"ship_dealer\":\"71\",\"ship_pro\":\"16\",\"ship_odid\":67,\"ship_odblid\":67,\"ship_oddtid\":78,\"ship_whid\":7,\"ship_proqty\":\"20\",\"ship_barcode\":\"10000108\",\"ship_date\":1532752320,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"8\",\"ship_czuser\":\"yunmei:chuku\"}', '1');
INSERT INTO `fw_log` VALUES ('1997', '8', 'yunmei:chuku', '3321', '出货导入', '1532752320', '49.90.139.28', '/zxapi/order/odshipscanres_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201807251929129517\",\"ship_deliver\":0,\"ship_dealer\":\"71\",\"ship_pro\":\"16\",\"ship_odid\":67,\"ship_odblid\":67,\"ship_oddtid\":78,\"ship_whid\":7,\"ship_proqty\":\"20\",\"ship_barcode\":\"10000144\",\"ship_date\":1532752320,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"8\",\"ship_czuser\":\"yunmei:chuku\"}', '1');
INSERT INTO `fw_log` VALUES ('1998', '8', 'yunmei:chuku', '3321', '出货导入', '1532752320', '49.90.139.28', '/zxapi/order/odshipscanres_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201807251929129517\",\"ship_deliver\":0,\"ship_dealer\":\"71\",\"ship_pro\":\"16\",\"ship_odid\":67,\"ship_odblid\":67,\"ship_oddtid\":78,\"ship_whid\":7,\"ship_proqty\":\"20\",\"ship_barcode\":\"10000069\",\"ship_date\":1532752320,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"8\",\"ship_czuser\":\"yunmei:chuku\"}', '1');
INSERT INTO `fw_log` VALUES ('1999', '8', 'yunmei:chuku', '3321', '出货导入', '1532752320', '49.90.139.28', '/zxapi/order/odshipscanres_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201807251929129517\",\"ship_deliver\":0,\"ship_dealer\":\"71\",\"ship_pro\":\"16\",\"ship_odid\":67,\"ship_odblid\":67,\"ship_oddtid\":78,\"ship_whid\":7,\"ship_proqty\":\"20\",\"ship_barcode\":\"10000115\",\"ship_date\":1532752320,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"8\",\"ship_czuser\":\"yunmei:chuku\"}', '1');
INSERT INTO `fw_log` VALUES ('2000', '8', 'yunmei:chuku', '3321', '出货导入', '1532752320', '49.90.139.28', '/zxapi/order/odshipscanres_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201807251929129517\",\"ship_deliver\":0,\"ship_dealer\":\"71\",\"ship_pro\":\"16\",\"ship_odid\":67,\"ship_odblid\":67,\"ship_oddtid\":78,\"ship_whid\":7,\"ship_proqty\":\"20\",\"ship_barcode\":\"10000102\",\"ship_date\":1532752320,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"8\",\"ship_czuser\":\"yunmei:chuku\"}', '1');
INSERT INTO `fw_log` VALUES ('2001', '8', 'yunmei:chuku', '3321', '出货导入', '1532752320', '49.90.139.28', '/zxapi/order/odshipscanres_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201807251929129517\",\"ship_deliver\":0,\"ship_dealer\":\"71\",\"ship_pro\":\"16\",\"ship_odid\":67,\"ship_odblid\":67,\"ship_oddtid\":78,\"ship_whid\":7,\"ship_proqty\":\"20\",\"ship_barcode\":\"10000109\",\"ship_date\":1532752320,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"8\",\"ship_czuser\":\"yunmei:chuku\"}', '1');
INSERT INTO `fw_log` VALUES ('2002', '8', 'yunmei:chuku', '3321', '出货导入', '1532752320', '49.90.139.28', '/zxapi/order/odshipscanres_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201807251929129517\",\"ship_deliver\":0,\"ship_dealer\":\"71\",\"ship_pro\":\"16\",\"ship_odid\":67,\"ship_odblid\":67,\"ship_oddtid\":78,\"ship_whid\":7,\"ship_proqty\":\"20\",\"ship_barcode\":\"10000020\",\"ship_date\":1532752320,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"8\",\"ship_czuser\":\"yunmei:chuku\"}', '1');
INSERT INTO `fw_log` VALUES ('2003', '8', 'yunmei:chuku', '3321', '出货导入', '1532752320', '49.90.139.28', '/zxapi/order/odshipscanres_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201807251929129517\",\"ship_deliver\":0,\"ship_dealer\":\"71\",\"ship_pro\":\"16\",\"ship_odid\":67,\"ship_odblid\":67,\"ship_oddtid\":78,\"ship_whid\":7,\"ship_proqty\":\"20\",\"ship_barcode\":\"10000059\",\"ship_date\":1532752320,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"8\",\"ship_czuser\":\"yunmei:chuku\"}', '1');
INSERT INTO `fw_log` VALUES ('2004', '8', 'yunmei:chuku', '3321', '出货导入', '1532752320', '49.90.139.28', '/zxapi/order/odshipscanres_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201807251929129517\",\"ship_deliver\":0,\"ship_dealer\":\"71\",\"ship_pro\":\"16\",\"ship_odid\":67,\"ship_odblid\":67,\"ship_oddtid\":78,\"ship_whid\":7,\"ship_proqty\":\"20\",\"ship_barcode\":\"10000033\",\"ship_date\":1532752320,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"8\",\"ship_czuser\":\"yunmei:chuku\"}', '1');
INSERT INTO `fw_log` VALUES ('2005', '8', 'yunmei:chuku', '3321', '出货导入', '1532752320', '49.90.139.28', '/zxapi/order/odshipscanres_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201807251929129517\",\"ship_deliver\":0,\"ship_dealer\":\"71\",\"ship_pro\":\"16\",\"ship_odid\":67,\"ship_odblid\":67,\"ship_oddtid\":78,\"ship_whid\":7,\"ship_proqty\":\"20\",\"ship_barcode\":\"10000088\",\"ship_date\":1532752320,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"8\",\"ship_czuser\":\"yunmei:chuku\"}', '1');
INSERT INTO `fw_log` VALUES ('2006', '8', 'yunmei:chuku', '3321', '出货导入', '1532752320', '49.90.139.28', '/zxapi/order/odshipscanres_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201807251929129517\",\"ship_deliver\":0,\"ship_dealer\":\"71\",\"ship_pro\":\"16\",\"ship_odid\":67,\"ship_odblid\":67,\"ship_oddtid\":78,\"ship_whid\":7,\"ship_proqty\":\"20\",\"ship_barcode\":\"10000030\",\"ship_date\":1532752320,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"8\",\"ship_czuser\":\"yunmei:chuku\"}', '1');
INSERT INTO `fw_log` VALUES ('2007', '8', 'yunmei:chuku', '3321', '出货导入', '1532752320', '49.90.139.28', '/zxapi/order/odshipscanres_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201807251929129517\",\"ship_deliver\":0,\"ship_dealer\":\"71\",\"ship_pro\":\"16\",\"ship_odid\":67,\"ship_odblid\":67,\"ship_oddtid\":78,\"ship_whid\":7,\"ship_proqty\":\"20\",\"ship_barcode\":\"10000050\",\"ship_date\":1532752320,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"8\",\"ship_czuser\":\"yunmei:chuku\"}', '1');
INSERT INTO `fw_log` VALUES ('2008', '8', 'yunmei:chuku', '3321', '出货导入', '1532752320', '49.90.139.28', '/zxapi/order/odshipscanres_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201807251929129517\",\"ship_deliver\":0,\"ship_dealer\":\"71\",\"ship_pro\":\"16\",\"ship_odid\":67,\"ship_odblid\":67,\"ship_oddtid\":78,\"ship_whid\":7,\"ship_proqty\":\"20\",\"ship_barcode\":\"10000090\",\"ship_date\":1532752320,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"8\",\"ship_czuser\":\"yunmei:chuku\"}', '1');
INSERT INTO `fw_log` VALUES ('2009', '1191', 'yunmei', '3321', '企业登录', '1532765496', '180.123.222.60', '/mp/login/logining', '', '1');
INSERT INTO `fw_log` VALUES ('2010', '1191', 'yunmei', '3321', '修改经销商', '1532765513', '180.123.222.60', '/mp/dealer/edit_save', '{\"dl_id\":66,\"dl_number\":\"N007700\",\"dl_name\":\"\\u77f3\\u7476\\u7476\",\"dl_area\":\"\",\"dl_contact\":\"\\u77f3\\u7476\\u7476\",\"dl_tel\":\"15252161759\",\"dl_fax\":\"\",\"dl_address\":\"\\u6c5f\\u82cf\\u7701\\u5f90\\u5dde\\u5e02\\u7762\\u5b81\\u53bf\\u661f\\u6cb3\\u6e7e\",\"dl_email\":\"\",\"dl_qq\":\"\",\"dl_idcard\":\"320324199410080721\",\"dl_remark\":\"\",\"dl_des\":\"\",\"dl_weixin\":\"654081\",\"dl_pwd\":\"2604e6c587446320b5bca9fee86de9bb\"}', '1');
INSERT INTO `fw_log` VALUES ('2011', '66', '654081', '3321', '经销商账号登录', '1532765543', '180.123.222.60', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2012', '66', '654081', '3321', '经销商账号登录', '1532765571', '117.136.68.223', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2013', '8', 'yunmei:chuku', '3321', '出货导入', '1532765658', '180.123.222.60', '/zxapi/order/odshipscanres_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201807281613095782\",\"ship_deliver\":0,\"ship_dealer\":\"66\",\"ship_pro\":\"16\",\"ship_odid\":71,\"ship_odblid\":71,\"ship_oddtid\":82,\"ship_whid\":7,\"ship_proqty\":\"20\",\"ship_barcode\":\"10000049\",\"ship_date\":1532765658,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"8\",\"ship_czuser\":\"yunmei:chuku\"}', '1');
INSERT INTO `fw_log` VALUES ('2014', '8', 'yunmei:chuku', '3321', '出货导入', '1532765658', '180.123.222.60', '/zxapi/order/odshipscanres_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201807281613095782\",\"ship_deliver\":0,\"ship_dealer\":\"66\",\"ship_pro\":\"16\",\"ship_odid\":71,\"ship_odblid\":71,\"ship_oddtid\":82,\"ship_whid\":7,\"ship_proqty\":\"20\",\"ship_barcode\":\"10000067\",\"ship_date\":1532765658,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"8\",\"ship_czuser\":\"yunmei:chuku\"}', '1');
INSERT INTO `fw_log` VALUES ('2015', '66', '654081', '3321', '经销商账号登录', '1532828575', '121.233.3.153', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2016', '1191', 'yunmei', '3321', '企业登录', '1532842256', '180.124.222.67', '/mp/login/logining', '', '1');
INSERT INTO `fw_log` VALUES ('2017', '1191', 'yunmei', '3321', '删除订单', '1532842297', '180.124.222.67', '/mp/orders/deleteorder/od_id/68', '{\"od_id\":\"68\",\"od_unitcode\":\"3321\",\"od_orderid\":\"201807271921465841\",\"od_total\":\"10500.00\",\"od_addtime\":\"1532690506\",\"od_oddlid\":\"70\",\"od_contact\":\"\\u6768\\u5c1a\",\"od_addressid\":\"55\",\"od_sheng\":\"32\",\"od_shi\":\"3203\",\"od_qu\":\"320324\",\"od_jie\":\"0\",\"od_address\":\"\\u6c5f\\u82cf\\u7701\\u5f90\\u5dde\\u5e02\\u7762\\u5b81\\u53bf\",\"od_tel\":\"15862222202\",\"od_express\":\"0\",\"od_expressnum\":\"\",\"od_expressdate\":\"0\",\"od_remark\":null,\"od_state\":\"9\",\"od_stead\":\"0\",\"od_blid\":\"0\",\"od_paymode\":\"0\"}', '1');
INSERT INTO `fw_log` VALUES ('2018', '66', '654081', '3321', '经销商账号登录', '1532920403', '180.124.222.67', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2019', '8', 'yunmei:chuku', '3321', '企业APP子用户登录', '1532920465', '180.124.222.67', '/zxapi/login/index', '{\"su_id\":\"8\",\"su_unitcode\":\"3321\",\"su_username\":\"chuku\",\"su_pwd\":\"0e92ed5bef4b2458da02cf12ef3ea68e\",\"su_openid\":null,\"su_wxnickname\":null,\"su_wxsex\":\"0\",\"su_wxprovince\":null,\"su_wxcity\":null,\"su_wxcountry\":null,\"su_wxheadimg\":null,\"su_weixin\":null,\"su_name\":\"\\u51fa\\u5e93\",\"su_logintime\":\"1532690585\",\"su_errlogintime\":\"1532690585\",\"su_errtimes\":\"0\",\"su_remark\":null,\"su_status\":\"1\",\"su_belong\":\"0\",\"su_purview\":\"\"}', '1');
INSERT INTO `fw_log` VALUES ('2020', '8', 'yunmei:chuku', '3321', '企业APP子用户登录', '1533020284', '180.123.223.56', '/zxapi/login/index', '{\"su_id\":\"8\",\"su_unitcode\":\"3321\",\"su_username\":\"chuku\",\"su_pwd\":\"0e92ed5bef4b2458da02cf12ef3ea68e\",\"su_openid\":null,\"su_wxnickname\":null,\"su_wxsex\":\"0\",\"su_wxprovince\":null,\"su_wxcity\":null,\"su_wxcountry\":null,\"su_wxheadimg\":null,\"su_weixin\":null,\"su_name\":\"\\u51fa\\u5e93\",\"su_logintime\":\"1532920465\",\"su_errlogintime\":\"1532920465\",\"su_errtimes\":\"0\",\"su_remark\":null,\"su_status\":\"1\",\"su_belong\":\"0\",\"su_purview\":\"\"}', '1');
INSERT INTO `fw_log` VALUES ('2021', '66', '654081', '3321', '经销商账号登录', '1533025051', '180.123.223.56', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2022', '8', 'yunmei:chuku', '3321', '出货导入', '1533025143', '180.123.223.56', '/zxapi/order/odshipscanres_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201807311617516933\",\"ship_deliver\":0,\"ship_dealer\":\"66\",\"ship_pro\":\"16\",\"ship_odid\":73,\"ship_odblid\":73,\"ship_oddtid\":84,\"ship_whid\":7,\"ship_proqty\":\"20\",\"ship_barcode\":\"10000040\",\"ship_date\":1533025143,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"8\",\"ship_czuser\":\"yunmei:chuku\"}', '1');
INSERT INTO `fw_log` VALUES ('2023', '8', 'yunmei:chuku', '3321', '出货导入', '1533025143', '180.123.223.56', '/zxapi/order/odshipscanres_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201807311617516933\",\"ship_deliver\":0,\"ship_dealer\":\"66\",\"ship_pro\":\"16\",\"ship_odid\":73,\"ship_odblid\":73,\"ship_oddtid\":84,\"ship_whid\":7,\"ship_proqty\":\"20\",\"ship_barcode\":\"10000016\",\"ship_date\":1533025143,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"8\",\"ship_czuser\":\"yunmei:chuku\"}', '1');
INSERT INTO `fw_log` VALUES ('2024', '8', 'yunmei:chuku', '3321', '出货导入', '1533025143', '180.123.223.56', '/zxapi/order/odshipscanres_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201807311617516933\",\"ship_deliver\":0,\"ship_dealer\":\"66\",\"ship_pro\":\"16\",\"ship_odid\":73,\"ship_odblid\":73,\"ship_oddtid\":84,\"ship_whid\":7,\"ship_proqty\":\"20\",\"ship_barcode\":\"10000064\",\"ship_date\":1533025143,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"8\",\"ship_czuser\":\"yunmei:chuku\"}', '1');
INSERT INTO `fw_log` VALUES ('2025', '66', '654081', '3321', '经销商账号登录', '1533088331', '114.235.235.195', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2026', '1191', 'yunmei', '3321', '企业登录', '1533090705', '114.235.235.195', '/mp/login/logining', '', '1');
INSERT INTO `fw_log` VALUES ('2027', '1191', 'yunmei', '3321', '修改经销商', '1533090722', '114.235.235.195', '/mp/dealer/edit_save', '{\"dl_id\":72,\"dl_number\":\"N007705\",\"dl_name\":\"\\u9648\\u5b87\",\"dl_area\":\"\",\"dl_contact\":\"\\u9648\\u5b87\",\"dl_tel\":\"18752575777\",\"dl_fax\":\"\",\"dl_address\":\"\\u6c5f\\u82cf\\u7701\\u5f90\\u5dde\\u5e02\\u7762\\u5b81\\u53bf\",\"dl_email\":\"\",\"dl_qq\":\"\",\"dl_idcard\":\"320324199406250329\",\"dl_remark\":\"\",\"dl_des\":\"\",\"dl_weixin\":\"maoyu517\",\"dl_pwd\":\"c56d0e9a7ccec67b4ea131655038d604\"}', '1');
INSERT INTO `fw_log` VALUES ('2028', '72', 'maoyu517', '3321', '经销商账号登录', '1533090966', '114.235.235.195', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2029', '72', 'maoyu517', '3321', '经销商账号登录', '1533090967', '114.235.235.195', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2030', '72', 'maoyu517', '3321', '经销商账号登录', '1533090968', '114.235.235.195', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2031', '72', 'maoyu517', '3321', '经销商账号登录', '1533090968', '114.235.235.195', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2032', '72', 'maoyu517', '3321', '经销商账号登录', '1533090968', '114.235.235.195', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2033', '72', 'maoyu517', '3321', '经销商账号登录', '1533090969', '114.235.235.195', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2034', '72', 'maoyu517', '3321', '经销商账号登录', '1533090969', '114.235.235.195', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2035', '72', 'maoyu517', '3321', '经销商账号登录', '1533090969', '114.235.235.195', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2036', '72', 'maoyu517', '3321', '经销商账号登录', '1533090970', '114.235.235.195', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2037', '72', 'maoyu517', '3321', '经销商账号登录', '1533090970', '114.235.235.195', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2038', '72', 'maoyu517', '3321', '经销商账号登录', '1533090970', '114.235.235.195', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2039', '72', 'maoyu517', '3321', '经销商账号登录', '1533090971', '114.235.235.195', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2040', '72', 'maoyu517', '3321', '经销商账号登录', '1533090977', '117.136.68.218', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2041', '66', '654081', '3321', '经销商账号登录', '1533091064', '117.136.68.218', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2042', '66', '654081', '3321', '经销商账号登录', '1533091070', '117.136.68.218', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2043', '1191', 'yunmei', '3321', '删除订单', '1533091103', '114.235.235.195', '/mp/orders/deleteorder/od_id/72', '{\"od_id\":\"72\",\"od_unitcode\":\"3321\",\"od_orderid\":\"201807301113321185\",\"od_total\":\"2100.00\",\"od_addtime\":\"1532920412\",\"od_oddlid\":\"66\",\"od_contact\":\"\\u77f3\\u7476\\u7476\",\"od_addressid\":\"51\",\"od_sheng\":\"32\",\"od_shi\":\"3203\",\"od_qu\":\"320324\",\"od_jie\":\"0\",\"od_address\":\"\\u6c5f\\u82cf\\u7701\\u5f90\\u5dde\\u5e02\\u7762\\u5b81\\u53bf\\u661f\\u6cb3\\u6e7e\",\"od_tel\":\"13564690205\",\"od_express\":\"0\",\"od_expressnum\":\"\",\"od_expressdate\":\"0\",\"od_remark\":null,\"od_state\":\"9\",\"od_stead\":\"0\",\"od_blid\":\"0\",\"od_paymode\":\"0\"}', '1');
INSERT INTO `fw_log` VALUES ('2044', '72', 'maoyu517', '3321', '经销商账号登录', '1533091448', '223.107.20.178', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2045', '72', 'maoyu517', '3321', '经销商账号登录', '1533091457', '117.136.68.218', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2046', '72', 'maoyu517', '3321', '经销商账号登录', '1533091517', '122.96.43.136', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2047', '66', '654081', '3321', '经销商账号登录', '1533091521', '117.136.68.218', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2048', '1191', 'yunmei', '3321', '企业登录', '1533106419', '180.123.223.56', '/mp/login/logining', '', '1');
INSERT INTO `fw_log` VALUES ('2049', '1191', 'yunmei', '3321', '修改产品', '1533106460', '180.123.223.56', '/mp/product/edit_save', '{\"pro_id\":17,\"pro_name\":\"\\u5141\\u7f8e \\u9175\\u7d20\\u7c89\",\"pro_number\":\"\\u9175\\u7d20\",\"pro_typeid\":20,\"pro_jftype\":1,\"pro_jifen\":0,\"pro_jfmax\":0,\"pro_dljf\":0,\"pro_desc\":\"\\u5496\\u55611\\u7bb1 15\\u888b*36\\u76d2\",\"pro_link\":\"\",\"pro_barcode\":\"\",\"pro_remark\":\"\\u9175\\u7d20\\u7c891\\u7bb1 15\\u888b*36\\u76d2\",\"pro_price\":\"7600.00\",\"pro_stock\":0,\"pro_units\":\"\\u76d2\",\"pro_dbiao\":1,\"pro_zbiao\":0,\"pro_xbiao\":36}', '1');
INSERT INTO `fw_log` VALUES ('2050', '8', 'yunmei:chuku', '3321', '企业APP子用户登录', '1533197222', '180.123.220.173', '/zxapi/login/index', '{\"su_id\":\"8\",\"su_unitcode\":\"3321\",\"su_username\":\"chuku\",\"su_pwd\":\"0e92ed5bef4b2458da02cf12ef3ea68e\",\"su_openid\":null,\"su_wxnickname\":null,\"su_wxsex\":\"0\",\"su_wxprovince\":null,\"su_wxcity\":null,\"su_wxcountry\":null,\"su_wxheadimg\":null,\"su_weixin\":null,\"su_name\":\"\\u51fa\\u5e93\",\"su_logintime\":\"1533020284\",\"su_errlogintime\":\"1533020284\",\"su_errtimes\":\"0\",\"su_remark\":null,\"su_status\":\"1\",\"su_belong\":\"0\",\"su_purview\":\"\"}', '1');
INSERT INTO `fw_log` VALUES ('2051', '8', 'yunmei:chuku', '3321', '企业APP子用户登录', '1533284929', '180.123.220.173', '/zxapi/login/index', '{\"su_id\":\"8\",\"su_unitcode\":\"3321\",\"su_username\":\"chuku\",\"su_pwd\":\"0e92ed5bef4b2458da02cf12ef3ea68e\",\"su_openid\":null,\"su_wxnickname\":null,\"su_wxsex\":\"0\",\"su_wxprovince\":null,\"su_wxcity\":null,\"su_wxcountry\":null,\"su_wxheadimg\":null,\"su_weixin\":null,\"su_name\":\"\\u51fa\\u5e93\",\"su_logintime\":\"1533197222\",\"su_errlogintime\":\"1533197222\",\"su_errtimes\":\"0\",\"su_remark\":null,\"su_status\":\"1\",\"su_belong\":\"0\",\"su_purview\":\"\"}', '1');
INSERT INTO `fw_log` VALUES ('2052', '66', '654081', '3321', '经销商账号登录', '1533524008', '180.123.223.131', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2053', '1191', 'yunmei', '3321', '企业登录', '1533524219', '180.123.223.131', '/mp/login/logining', '', '1');
INSERT INTO `fw_log` VALUES ('2054', '73', 'tzwl588', '3321', '代理商注册', '1533524369', '122.194.88.150', '/baiman/dealer/apply', '{\"dl_username\":\"tzwl588\",\"dl_pwd\":\"d85300a0743a9d6f4cdcd595d719e9d4\",\"dl_number\":\"\",\"dl_unitcode\":\"3321\",\"dl_name\":\"\\u738b\\u8389\",\"dl_contact\":\"\\u738b\\u8389\",\"dl_tel\":\"15380162335\",\"dl_idcard\":\"321201198811190266\",\"dl_idcardpic\":\"\",\"dl_idcardpic2\":\"\",\"dl_tbdian\":\"\",\"dl_tbzhanggui\":\"\",\"dl_addtime\":1533524369,\"dl_status\":0,\"dl_level\":\"2\",\"dl_type\":3,\"dl_sttype\":0,\"dl_belong\":\"66\",\"dl_referee\":66,\"dl_remark\":\"\",\"dl_address\":\"\\u6c5f\\u82cf\\u7701\\u6cf0\\u5dde\\u5e02\\u9ad8\\u6e2f\\u533a\\u5201\\u94fa\\u8857\\u9053\\u754c\\u724c\\u6751\\u56db\\u7ec414\\u53f7\",\"dl_sheng\":\"32\",\"dl_shi\":\"3212\",\"dl_qu\":\"321203\",\"dl_qustr\":\"\\u6c5f\\u82cf\\u7701\\u6cf0\\u5dde\\u5e02\\u9ad8\\u6e2f\\u533a\",\"dl_openid\":\"\",\"dl_weixin\":\"tzwl588\",\"dl_wxnickname\":\"\",\"dl_wxsex\":0,\"dl_wxprovince\":\"\",\"dl_wxcity\":\"\",\"dl_wxcountry\":\"\",\"dl_wxheadimg\":\"\",\"dl_brand\":\"\",\"dl_brandlevel\":\"\"}', '2');
INSERT INTO `fw_log` VALUES ('2055', '73', 'tzwl588', '3321', '经销商账号登录', '1533524513', '122.194.88.150', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2056', '74', '13395253609', '3321', '代理商注册', '1533524651', '49.81.118.121', '/baiman/dealer/apply', '{\"dl_username\":\"13395253609\",\"dl_pwd\":\"39a5a61a6d57f1dc50532e5bcb403ff3\",\"dl_number\":\"\",\"dl_unitcode\":\"3321\",\"dl_name\":\"\\u6234\\u8a00\",\"dl_contact\":\"\\u6234\\u8a00\",\"dl_tel\":\"13395253609\",\"dl_idcard\":\"32032419880204061X\",\"dl_idcardpic\":\"\",\"dl_idcardpic2\":\"\",\"dl_tbdian\":\"\",\"dl_tbzhanggui\":\"\",\"dl_addtime\":1533524651,\"dl_status\":0,\"dl_level\":\"2\",\"dl_type\":3,\"dl_sttype\":0,\"dl_belong\":\"66\",\"dl_referee\":66,\"dl_remark\":\"\",\"dl_address\":\"\\u6c5f\\u82cf\\u7701\\u5f90\\u5dde\\u5e02\\u7762\\u5b81\\u53bf\",\"dl_sheng\":\"32\",\"dl_shi\":\"3203\",\"dl_qu\":\"320324\",\"dl_qustr\":\"\\u6c5f\\u82cf\\u7701\\u5f90\\u5dde\\u5e02\\u7762\\u5b81\\u53bf\",\"dl_openid\":\"\",\"dl_weixin\":\"13395253609\",\"dl_wxnickname\":\"\",\"dl_wxsex\":0,\"dl_wxprovince\":\"\",\"dl_wxcity\":\"\",\"dl_wxcountry\":\"\",\"dl_wxheadimg\":\"\",\"dl_brand\":\"\",\"dl_brandlevel\":\"\"}', '2');
INSERT INTO `fw_log` VALUES ('2057', '74', '13395253609', '3321', '经销商账号登录', '1533524908', '49.81.118.121', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2058', '8', 'yunmei:chuku', '3321', '企业APP子用户登录', '1533525231', '180.123.223.131', '/zxapi/login/index', '{\"su_id\":\"8\",\"su_unitcode\":\"3321\",\"su_username\":\"chuku\",\"su_pwd\":\"0e92ed5bef4b2458da02cf12ef3ea68e\",\"su_openid\":null,\"su_wxnickname\":null,\"su_wxsex\":\"0\",\"su_wxprovince\":null,\"su_wxcity\":null,\"su_wxcountry\":null,\"su_wxheadimg\":null,\"su_weixin\":null,\"su_name\":\"\\u51fa\\u5e93\",\"su_logintime\":\"1533284929\",\"su_errlogintime\":\"1533284929\",\"su_errtimes\":\"0\",\"su_remark\":null,\"su_status\":\"1\",\"su_belong\":\"0\",\"su_purview\":\"\"}', '1');
INSERT INTO `fw_log` VALUES ('2059', '8', 'yunmei:chuku', '3321', '出货导入', '1533525369', '180.123.223.131', '/zxapi/order/odshipscanres_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201808061109452463\",\"ship_deliver\":0,\"ship_dealer\":\"66\",\"ship_pro\":\"16\",\"ship_odid\":76,\"ship_odblid\":76,\"ship_oddtid\":87,\"ship_whid\":7,\"ship_proqty\":\"20\",\"ship_barcode\":\"10000071\",\"ship_date\":1533525369,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"8\",\"ship_czuser\":\"yunmei:chuku\"}', '1');
INSERT INTO `fw_log` VALUES ('2060', '8', 'yunmei:chuku', '3321', '出货导入', '1533525369', '180.123.223.131', '/zxapi/order/odshipscanres_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201808061109452463\",\"ship_deliver\":0,\"ship_dealer\":\"66\",\"ship_pro\":\"16\",\"ship_odid\":76,\"ship_odblid\":76,\"ship_oddtid\":87,\"ship_whid\":7,\"ship_proqty\":\"20\",\"ship_barcode\":\"10000026\",\"ship_date\":1533525369,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"8\",\"ship_czuser\":\"yunmei:chuku\"}', '1');
INSERT INTO `fw_log` VALUES ('2061', '73', 'tzwl588', '3321', '经销商账号登录', '1533525512', '122.194.88.150', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2062', '66', '654081', '3321', '经销商出货', '1533525715', '180.123.223.131', '/baiman/orders/odshipping/step/1/od_id/74/odbl_id/74/oddt_id/85', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201808061103557802\",\"ship_deliver\":\"66\",\"ship_dealer\":\"73\",\"ship_pro\":\"16\",\"ship_odid\":74,\"ship_odblid\":74,\"ship_whid\":null,\"ship_proqty\":\"20\",\"ship_barcode\":10000071,\"ship_date\":1533525715,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":2,\"ship_czid\":\"66\",\"ship_czuser\":\"654081\"}', '2');
INSERT INTO `fw_log` VALUES ('2063', '66', '654081', '3321', '经销商出货', '1533525744', '180.123.223.131', '/baiman/orders/odshipping/step/1/od_id/75/odbl_id/75/oddt_id/86', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201808061109098476\",\"ship_deliver\":\"66\",\"ship_dealer\":\"74\",\"ship_pro\":\"16\",\"ship_odid\":75,\"ship_odblid\":75,\"ship_whid\":null,\"ship_proqty\":\"20\",\"ship_barcode\":10000026,\"ship_date\":1533525744,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":2,\"ship_czid\":\"66\",\"ship_czuser\":\"654081\"}', '2');
INSERT INTO `fw_log` VALUES ('2064', '73', 'tzwl588', '3321', '经销商账号登录', '1533531933', '122.194.88.150', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2065', '75', '17712154959', '3321', '代理商注册', '1533534673', '114.235.97.59', '/baiman/dealer/apply', '{\"dl_username\":\"17712154959\",\"dl_pwd\":\"092d97fe3c36758b5de7ed9f5e89c635\",\"dl_number\":\"\",\"dl_unitcode\":\"3321\",\"dl_name\":\"\\u9756\\u82f1\",\"dl_contact\":\"\\u9756\\u82f1\",\"dl_tel\":\"17712154959\",\"dl_idcard\":\"342225198210191525\",\"dl_idcardpic\":\"\",\"dl_idcardpic2\":\"\",\"dl_tbdian\":\"\",\"dl_tbzhanggui\":\"\",\"dl_addtime\":1533534673,\"dl_status\":0,\"dl_level\":\"3\",\"dl_type\":6,\"dl_sttype\":0,\"dl_belong\":\"73\",\"dl_referee\":73,\"dl_remark\":\"\",\"dl_address\":\"\\u5f90\\u5dde\\u5e02\\u7762\\u5b81\\u9ad8\\u4f5c\\u9547\",\"dl_sheng\":\"32\",\"dl_shi\":\"3203\",\"dl_qu\":\"320324\",\"dl_qustr\":\"\\u6c5f\\u82cf\\u7701\\u5f90\\u5dde\\u5e02\\u7762\\u5b81\\u53bf\",\"dl_openid\":\"\",\"dl_weixin\":\"17712154959\",\"dl_wxnickname\":\"\",\"dl_wxsex\":0,\"dl_wxprovince\":\"\",\"dl_wxcity\":\"\",\"dl_wxcountry\":\"\",\"dl_wxheadimg\":\"\",\"dl_brand\":\"\",\"dl_brandlevel\":\"\"}', '2');
INSERT INTO `fw_log` VALUES ('2066', '8', 'yunmei:chuku', '3321', '出货导入', '1533541200', '180.123.223.131', '/zxapi/order/odshipscanres_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201808061538594824\",\"ship_deliver\":0,\"ship_dealer\":\"66\",\"ship_pro\":\"16\",\"ship_odid\":77,\"ship_odblid\":77,\"ship_oddtid\":88,\"ship_whid\":7,\"ship_proqty\":\"20\",\"ship_barcode\":\"10000014\",\"ship_date\":1533541200,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"8\",\"ship_czuser\":\"yunmei:chuku\"}', '1');
INSERT INTO `fw_log` VALUES ('2067', '73', 'tzwl588', '3321', '经销商账号登录', '1533572755', '122.194.88.150', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2068', '73', 'tzwl588', '3321', '经销商账号登录', '1533618325', '122.194.88.150', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2069', '66', '654081', '3321', '经销商账号登录', '1533629934', '180.124.222.98', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2070', '8', 'yunmei:chuku', '3321', '出货导入', '1533630024', '180.124.222.98', '/zxapi/order/odshipscanres_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201808071619103907\",\"ship_deliver\":0,\"ship_dealer\":\"66\",\"ship_pro\":\"16\",\"ship_odid\":78,\"ship_odblid\":78,\"ship_oddtid\":89,\"ship_whid\":7,\"ship_proqty\":\"20\",\"ship_barcode\":\"10000062\",\"ship_date\":1533630024,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"8\",\"ship_czuser\":\"yunmei:chuku\"}', '1');
INSERT INTO `fw_log` VALUES ('2071', '8', 'yunmei:chuku', '3321', '出货导入', '1533630024', '180.124.222.98', '/zxapi/order/odshipscanres_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201808071619103907\",\"ship_deliver\":0,\"ship_dealer\":\"66\",\"ship_pro\":\"16\",\"ship_odid\":78,\"ship_odblid\":78,\"ship_oddtid\":89,\"ship_whid\":7,\"ship_proqty\":\"20\",\"ship_barcode\":\"10000068\",\"ship_date\":1533630024,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"8\",\"ship_czuser\":\"yunmei:chuku\"}', '1');
INSERT INTO `fw_log` VALUES ('2072', '8', 'yunmei:chuku', '3321', '出货导入', '1533630024', '180.124.222.98', '/zxapi/order/odshipscanres_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201808071619103907\",\"ship_deliver\":0,\"ship_dealer\":\"66\",\"ship_pro\":\"16\",\"ship_odid\":78,\"ship_odblid\":78,\"ship_oddtid\":89,\"ship_whid\":7,\"ship_proqty\":\"20\",\"ship_barcode\":\"10000056\",\"ship_date\":1533630024,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"8\",\"ship_czuser\":\"yunmei:chuku\"}', '1');
INSERT INTO `fw_log` VALUES ('2073', '8', 'yunmei:chuku', '3321', '出货导入', '1533630024', '180.124.222.98', '/zxapi/order/odshipscanres_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201808071619103907\",\"ship_deliver\":0,\"ship_dealer\":\"66\",\"ship_pro\":\"16\",\"ship_odid\":78,\"ship_odblid\":78,\"ship_oddtid\":89,\"ship_whid\":7,\"ship_proqty\":\"20\",\"ship_barcode\":\"10000082\",\"ship_date\":1533630024,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"8\",\"ship_czuser\":\"yunmei:chuku\"}', '1');
INSERT INTO `fw_log` VALUES ('2074', '8', 'yunmei:chuku', '3321', '出货导入', '1533630024', '180.124.222.98', '/zxapi/order/odshipscanres_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201808071619103907\",\"ship_deliver\":0,\"ship_dealer\":\"66\",\"ship_pro\":\"16\",\"ship_odid\":78,\"ship_odblid\":78,\"ship_oddtid\":89,\"ship_whid\":7,\"ship_proqty\":\"20\",\"ship_barcode\":\"10000074\",\"ship_date\":1533630024,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"8\",\"ship_czuser\":\"yunmei:chuku\"}', '1');
INSERT INTO `fw_log` VALUES ('2075', '8', 'yunmei:chuku', '3321', '出货导入', '1533630024', '180.124.222.98', '/zxapi/order/odshipscanres_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201808071619103907\",\"ship_deliver\":0,\"ship_dealer\":\"66\",\"ship_pro\":\"16\",\"ship_odid\":78,\"ship_odblid\":78,\"ship_oddtid\":89,\"ship_whid\":7,\"ship_proqty\":\"20\",\"ship_barcode\":\"10000075\",\"ship_date\":1533630024,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"8\",\"ship_czuser\":\"yunmei:chuku\"}', '1');
INSERT INTO `fw_log` VALUES ('2076', '73', 'tzwl588', '3321', '经销商账号登录', '1533655492', '49.92.148.22', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2077', '8', 'yunmei:chuku', '3321', '企业APP子用户登录', '1533704530', '180.124.222.98', '/zxapi/login/index', '{\"su_id\":\"8\",\"su_unitcode\":\"3321\",\"su_username\":\"chuku\",\"su_pwd\":\"0e92ed5bef4b2458da02cf12ef3ea68e\",\"su_openid\":null,\"su_wxnickname\":null,\"su_wxsex\":\"0\",\"su_wxprovince\":null,\"su_wxcity\":null,\"su_wxcountry\":null,\"su_wxheadimg\":null,\"su_weixin\":null,\"su_name\":\"\\u51fa\\u5e93\",\"su_logintime\":\"1533525231\",\"su_errlogintime\":\"1533525231\",\"su_errtimes\":\"0\",\"su_remark\":null,\"su_status\":\"1\",\"su_belong\":\"0\",\"su_purview\":\"\"}', '1');
INSERT INTO `fw_log` VALUES ('2078', '73', 'tzwl588', '3321', '经销商账号登录', '1533751206', '49.90.135.102', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2079', '73', 'tzwl588', '3321', '经销商账号登录', '1533776407', '123.77.102.10', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2080', '73', 'tzwl588', '3321', '经销商账号登录', '1533807992', '49.90.135.102', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2081', '69', '15365423666', '3321', '经销商账号登录', '1533812392', '49.90.177.86', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2082', '73', 'tzwl588', '3321', '经销商账号登录', '1533863868', '122.194.88.150', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2083', '73', 'tzwl588', '3321', '经销商账号登录', '1533876082', '49.95.206.23', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2084', '66', '654081', '3321', '经销商账号登录', '1533886760', '180.123.221.157', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2085', '8', 'yunmei:chuku', '3321', '企业APP子用户登录', '1533886788', '180.123.221.157', '/zxapi/login/index', '{\"su_id\":\"8\",\"su_unitcode\":\"3321\",\"su_username\":\"chuku\",\"su_pwd\":\"0e92ed5bef4b2458da02cf12ef3ea68e\",\"su_openid\":null,\"su_wxnickname\":null,\"su_wxsex\":\"0\",\"su_wxprovince\":null,\"su_wxcity\":null,\"su_wxcountry\":null,\"su_wxheadimg\":null,\"su_weixin\":null,\"su_name\":\"\\u51fa\\u5e93\",\"su_logintime\":\"1533704530\",\"su_errlogintime\":\"1533704530\",\"su_errtimes\":\"0\",\"su_remark\":null,\"su_status\":\"1\",\"su_belong\":\"0\",\"su_purview\":\"\"}', '1');
INSERT INTO `fw_log` VALUES ('2086', '8', 'yunmei:chuku', '3321', '出货导入', '1533886822', '180.123.221.157', '/zxapi/order/odshipscanres_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201808101539287844\",\"ship_deliver\":0,\"ship_dealer\":\"66\",\"ship_pro\":\"16\",\"ship_odid\":79,\"ship_odblid\":79,\"ship_oddtid\":90,\"ship_whid\":7,\"ship_proqty\":\"20\",\"ship_barcode\":\"10000140\",\"ship_date\":1533886822,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"8\",\"ship_czuser\":\"yunmei:chuku\"}', '1');
INSERT INTO `fw_log` VALUES ('2087', '1191', 'yunmei', '3321', '企业登录', '1533886989', '180.123.221.157', '/mp/login/logining', '', '1');
INSERT INTO `fw_log` VALUES ('2088', '66', '654081', '3321', '经销商账号登录', '1533968719', '180.123.221.216', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2089', '1191', 'yunmei', '3321', '企业登录', '1533968753', '180.123.221.216', '/mp/login/logining', '', '1');
INSERT INTO `fw_log` VALUES ('2090', '8', 'yunmei:chuku', '3321', '企业APP子用户登录', '1533968831', '180.123.221.216', '/zxapi/login/index', '{\"su_id\":\"8\",\"su_unitcode\":\"3321\",\"su_username\":\"chuku\",\"su_pwd\":\"0e92ed5bef4b2458da02cf12ef3ea68e\",\"su_openid\":null,\"su_wxnickname\":null,\"su_wxsex\":\"0\",\"su_wxprovince\":null,\"su_wxcity\":null,\"su_wxcountry\":null,\"su_wxheadimg\":null,\"su_weixin\":null,\"su_name\":\"\\u51fa\\u5e93\",\"su_logintime\":\"1533886788\",\"su_errlogintime\":\"1533886788\",\"su_errtimes\":\"0\",\"su_remark\":null,\"su_status\":\"1\",\"su_belong\":\"0\",\"su_purview\":\"\"}', '1');
INSERT INTO `fw_log` VALUES ('2091', '8', 'yunmei:chuku', '3321', '出货导入', '1533968880', '180.123.221.216', '/zxapi/order/odshipscanres_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201808111425285680\",\"ship_deliver\":0,\"ship_dealer\":\"66\",\"ship_pro\":\"16\",\"ship_odid\":80,\"ship_odblid\":80,\"ship_oddtid\":91,\"ship_whid\":7,\"ship_proqty\":\"20\",\"ship_barcode\":\"10000085\",\"ship_date\":1533968880,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"8\",\"ship_czuser\":\"yunmei:chuku\"}', '1');
INSERT INTO `fw_log` VALUES ('2092', '66', '654081', '3321', '经销商账号登录', '1534145437', '117.136.68.214', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2093', '8', 'yunmei:chuku', '3321', '企业APP子用户登录', '1534145472', '180.123.221.52', '/zxapi/login/index', '{\"su_id\":\"8\",\"su_unitcode\":\"3321\",\"su_username\":\"chuku\",\"su_pwd\":\"0e92ed5bef4b2458da02cf12ef3ea68e\",\"su_openid\":null,\"su_wxnickname\":null,\"su_wxsex\":\"0\",\"su_wxprovince\":null,\"su_wxcity\":null,\"su_wxcountry\":null,\"su_wxheadimg\":null,\"su_weixin\":null,\"su_name\":\"\\u51fa\\u5e93\",\"su_logintime\":\"1533968831\",\"su_errlogintime\":\"1533968831\",\"su_errtimes\":\"0\",\"su_remark\":null,\"su_status\":\"1\",\"su_belong\":\"0\",\"su_purview\":\"\"}', '1');
INSERT INTO `fw_log` VALUES ('2094', '8', 'yunmei:chuku', '3321', '出货导入', '1534145551', '180.123.221.52', '/zxapi/order/odshipscanres_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201808131530472213\",\"ship_deliver\":0,\"ship_dealer\":\"66\",\"ship_pro\":\"16\",\"ship_odid\":81,\"ship_odblid\":81,\"ship_oddtid\":92,\"ship_whid\":7,\"ship_proqty\":\"20\",\"ship_barcode\":\"10000045\",\"ship_date\":1534145551,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"8\",\"ship_czuser\":\"yunmei:chuku\"}', '1');
INSERT INTO `fw_log` VALUES ('2095', '8', 'yunmei:chuku', '3321', '出货导入', '1534145551', '180.123.221.52', '/zxapi/order/odshipscanres_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201808131530472213\",\"ship_deliver\":0,\"ship_dealer\":\"66\",\"ship_pro\":\"16\",\"ship_odid\":81,\"ship_odblid\":81,\"ship_oddtid\":92,\"ship_whid\":7,\"ship_proqty\":\"20\",\"ship_barcode\":\"10000146\",\"ship_date\":1534145551,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"8\",\"ship_czuser\":\"yunmei:chuku\"}', '1');
INSERT INTO `fw_log` VALUES ('2096', '8', 'yunmei:chuku', '3321', '出货导入', '1534145551', '180.123.221.52', '/zxapi/order/odshipscanres_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201808131530472213\",\"ship_deliver\":0,\"ship_dealer\":\"66\",\"ship_pro\":\"16\",\"ship_odid\":81,\"ship_odblid\":81,\"ship_oddtid\":92,\"ship_whid\":7,\"ship_proqty\":\"20\",\"ship_barcode\":\"10000143\",\"ship_date\":1534145551,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"8\",\"ship_czuser\":\"yunmei:chuku\"}', '1');
INSERT INTO `fw_log` VALUES ('2097', '8', 'yunmei:chuku', '3321', '出货导入', '1534145551', '180.123.221.52', '/zxapi/order/odshipscanres_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201808131530472213\",\"ship_deliver\":0,\"ship_dealer\":\"66\",\"ship_pro\":\"16\",\"ship_odid\":81,\"ship_odblid\":81,\"ship_oddtid\":92,\"ship_whid\":7,\"ship_proqty\":\"20\",\"ship_barcode\":\"10000035\",\"ship_date\":1534145551,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"8\",\"ship_czuser\":\"yunmei:chuku\"}', '1');
INSERT INTO `fw_log` VALUES ('2098', '8', 'yunmei:chuku', '3321', '出货导入', '1534145551', '180.123.221.52', '/zxapi/order/odshipscanres_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201808131530472213\",\"ship_deliver\":0,\"ship_dealer\":\"66\",\"ship_pro\":\"16\",\"ship_odid\":81,\"ship_odblid\":81,\"ship_oddtid\":92,\"ship_whid\":7,\"ship_proqty\":\"20\",\"ship_barcode\":\"10000091\",\"ship_date\":1534145551,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"8\",\"ship_czuser\":\"yunmei:chuku\"}', '1');
INSERT INTO `fw_log` VALUES ('2099', '8', 'yunmei:chuku', '3321', '出货导入', '1534145551', '180.123.221.52', '/zxapi/order/odshipscanres_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201808131530472213\",\"ship_deliver\":0,\"ship_dealer\":\"66\",\"ship_pro\":\"16\",\"ship_odid\":81,\"ship_odblid\":81,\"ship_oddtid\":92,\"ship_whid\":7,\"ship_proqty\":\"20\",\"ship_barcode\":\"10000009\",\"ship_date\":1534145551,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"8\",\"ship_czuser\":\"yunmei:chuku\"}', '1');
INSERT INTO `fw_log` VALUES ('2100', '8', 'yunmei:chuku', '3321', '出货导入', '1534145551', '180.123.221.52', '/zxapi/order/odshipscanres_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201808131530472213\",\"ship_deliver\":0,\"ship_dealer\":\"66\",\"ship_pro\":\"16\",\"ship_odid\":81,\"ship_odblid\":81,\"ship_oddtid\":92,\"ship_whid\":7,\"ship_proqty\":\"20\",\"ship_barcode\":\"10000120\",\"ship_date\":1534145551,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"8\",\"ship_czuser\":\"yunmei:chuku\"}', '1');
INSERT INTO `fw_log` VALUES ('2101', '8', 'yunmei:chuku', '3321', '出货导入', '1534145551', '180.123.221.52', '/zxapi/order/odshipscanres_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201808131530472213\",\"ship_deliver\":0,\"ship_dealer\":\"66\",\"ship_pro\":\"16\",\"ship_odid\":81,\"ship_odblid\":81,\"ship_oddtid\":92,\"ship_whid\":7,\"ship_proqty\":\"20\",\"ship_barcode\":\"10000039\",\"ship_date\":1534145551,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"8\",\"ship_czuser\":\"yunmei:chuku\"}', '1');
INSERT INTO `fw_log` VALUES ('2102', '8', 'yunmei:chuku', '3321', '出货导入', '1534145551', '180.123.221.52', '/zxapi/order/odshipscanres_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201808131530472213\",\"ship_deliver\":0,\"ship_dealer\":\"66\",\"ship_pro\":\"16\",\"ship_odid\":81,\"ship_odblid\":81,\"ship_oddtid\":92,\"ship_whid\":7,\"ship_proqty\":\"20\",\"ship_barcode\":\"10000132\",\"ship_date\":1534145551,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"8\",\"ship_czuser\":\"yunmei:chuku\"}', '1');
INSERT INTO `fw_log` VALUES ('2103', '1191', 'yunmei', '3321', '企业登录', '1534146822', '180.123.221.52', '/mp/login/logining', '', '1');
INSERT INTO `fw_log` VALUES ('2104', '1191', 'yunmei', '3321', '删除经销商', '1534146916', '180.123.221.52', '/mp/dealer/delete/dl_id/72', '{\"dl_id\":\"72\",\"dl_unitcode\":\"3321\",\"dl_openid\":\"\",\"dl_username\":\"maoyu517\",\"dl_pwd\":\"c56d0e9a7ccec67b4ea131655038d604\",\"dl_number\":\"N007705\",\"dl_name\":\"\\u9648\\u5b87\",\"dl_des\":\"\",\"dl_area\":\"\",\"dl_type\":\"3\",\"dl_sttype\":\"0\",\"dl_belong\":\"71\",\"dl_referee\":\"71\",\"dl_level\":\"2\",\"dl_contact\":\"\\u9648\\u5b87\",\"dl_tel\":\"18752575777\",\"dl_fax\":\"\",\"dl_email\":\"\",\"dl_weixin\":\"maoyu517\",\"dl_wxnickname\":\"\",\"dl_wxsex\":\"0\",\"dl_wxprovince\":\"\",\"dl_wxcity\":\"\",\"dl_wxcountry\":\"\",\"dl_wxheadimg\":\"\",\"dl_qq\":\"\",\"dl_country\":\"0\",\"dl_sheng\":\"32\",\"dl_shi\":\"3203\",\"dl_qu\":\"320324\",\"dl_qustr\":\"\\u6c5f\\u82cf\\u7701\\u5f90\\u5dde\\u5e02\\u7762\\u5b81\\u53bf\",\"dl_address\":\"\\u6c5f\\u82cf\\u7701\\u5f90\\u5dde\\u5e02\\u7762\\u5b81\\u53bf\",\"dl_idcard\":\"320324199406250329\",\"dl_idcardpic\":\"\",\"dl_idcardpic2\":\"\",\"dl_tbdian\":\"\",\"dl_tbzhanggui\":\"\",\"dl_tbsqpic\":null,\"dl_tblevel\":null,\"dl_remark\":\"\",\"dl_status\":\"1\",\"dl_startdate\":\"1532520531\",\"dl_enddate\":\"1564056531\",\"dl_addtime\":\"1532520157\",\"dl_pic\":\"3321\\/1533090982_72_8960.jpg\",\"dl_brand\":\"\",\"dl_brandlevel\":\"\",\"dl_oddtime\":\"0\",\"dl_oddcount\":\"0\",\"dl_logintime\":\"1533091517\",\"dl_fanli\":\"0.00\",\"dl_jifen\":\"0\",\"dl_lastflid\":\"0\",\"dl_flmodel\":\"0\",\"dl_deposit\":\"0.00\",\"dl_depositpic\":null,\"dl_paypic\":null}', '1');
INSERT INTO `fw_log` VALUES ('2105', '1191', 'yunmei', '3321', '修改经销商级别', '1534147031', '180.123.221.52', '/mp/dealer/type_save', '{\"dlt_name\":\"\\u5141\\u7f8e\\u5927\\u5065\\u5eb7\",\"dlt_level\":1,\"dlt_fanli1\":0,\"dlt_fanli2\":0,\"dlt_fanli3\":0,\"dlt_fanli4\":0,\"dlt_fanli5\":0,\"dlt_fanli6\":0,\"dlt_fanli7\":0,\"dlt_fanli8\":0,\"dlt_fanli9\":0,\"dlt_fanli10\":0,\"dlt_firstquota\":\"0.00\",\"dlt_minnum\":\"3\"}', '1');
INSERT INTO `fw_log` VALUES ('2106', '1191', 'yunmei', '3321', '修改产品价格体系', '1534148010', '180.123.221.52', '/mp/product/propriceedit_save', '[{\"dlt_id\":\"2\",\"dlt_unitcode\":\"3321\",\"dlt_name\":\"\\u5141\\u7f8e\\u5927\\u5065\\u5eb7\",\"dlt_level\":\"1\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"0.00\",\"dlt_minnum\":\"3\",\"priprice\":\"2000\",\"pro_id\":\"16\"},{\"dlt_id\":\"3\",\"dlt_unitcode\":\"3321\",\"dlt_name\":\"\\u6267\\u884c\\u8463\\u4e8b\",\"dlt_level\":\"2\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"0.00\",\"dlt_minnum\":\"3\",\"priprice\":\"2900\",\"pro_id\":\"16\"},{\"dlt_id\":\"6\",\"dlt_unitcode\":\"3321\",\"dlt_name\":\"\\u5b98\\u65b9\\u4ee3\\u7406\",\"dlt_level\":\"3\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"0.00\",\"dlt_minnum\":\"0\",\"priprice\":\"3900\",\"pro_id\":\"16\"},{\"dlt_id\":\"7\",\"dlt_unitcode\":\"3321\",\"dlt_name\":\"\\u94bb\\u77f3\\u4ee3\\u7406\",\"dlt_level\":\"4\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"0.00\",\"dlt_minnum\":\"0\",\"priprice\":\"4780\",\"pro_id\":\"16\"},{\"dlt_id\":\"8\",\"dlt_unitcode\":\"3321\",\"dlt_name\":\"VIP\\u4ee3\\u7406\",\"dlt_level\":\"5\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"0.00\",\"dlt_minnum\":\"0\",\"priprice\":\"5980\",\"pro_id\":\"16\"}]', '1');
INSERT INTO `fw_log` VALUES ('2107', '1191', 'yunmei', '3321', '修改产品', '1534148033', '180.123.221.52', '/mp/product/edit_save', '{\"pro_id\":17,\"pro_name\":\"\\u5141\\u7f8e \\u9175\\u7d20\\u7c89\",\"pro_number\":\"\\u9175\\u7d20\",\"pro_typeid\":20,\"pro_jftype\":1,\"pro_jifen\":0,\"pro_jfmax\":0,\"pro_dljf\":0,\"pro_desc\":\"\\u9175\\u7d201\\u7bb1 15\\u888b*36\\u76d2\",\"pro_link\":\"\",\"pro_barcode\":\"\",\"pro_remark\":\"\\u9175\\u7d20\\u7c891\\u7bb1 15\\u888b*36\\u76d2\",\"pro_price\":\"7600.00\",\"pro_stock\":0,\"pro_units\":\"\\u76d2\",\"pro_dbiao\":1,\"pro_zbiao\":0,\"pro_xbiao\":36}', '1');
INSERT INTO `fw_log` VALUES ('2108', '1191', 'yunmei', '3321', '删除经销商', '1534148400', '180.123.221.52', '/mp/dealer/delete/dl_id/75', '{\"dl_id\":\"75\",\"dl_unitcode\":\"3321\",\"dl_openid\":\"\",\"dl_username\":\"17712154959\",\"dl_pwd\":\"092d97fe3c36758b5de7ed9f5e89c635\",\"dl_number\":\"No:007708\",\"dl_name\":\"\\u9756\\u82f1\",\"dl_des\":null,\"dl_area\":null,\"dl_type\":\"6\",\"dl_sttype\":\"0\",\"dl_belong\":\"73\",\"dl_referee\":\"73\",\"dl_level\":\"3\",\"dl_contact\":\"\\u9756\\u82f1\",\"dl_tel\":\"17712154959\",\"dl_fax\":null,\"dl_email\":null,\"dl_weixin\":\"17712154959\",\"dl_wxnickname\":\"\",\"dl_wxsex\":\"0\",\"dl_wxprovince\":\"\",\"dl_wxcity\":\"\",\"dl_wxcountry\":\"\",\"dl_wxheadimg\":\"\",\"dl_qq\":null,\"dl_country\":\"0\",\"dl_sheng\":\"32\",\"dl_shi\":\"3203\",\"dl_qu\":\"320324\",\"dl_qustr\":\"\\u6c5f\\u82cf\\u7701\\u5f90\\u5dde\\u5e02\\u7762\\u5b81\\u53bf\",\"dl_address\":\"\\u5f90\\u5dde\\u5e02\\u7762\\u5b81\\u9ad8\\u4f5c\\u9547\",\"dl_idcard\":\"342225198210191525\",\"dl_idcardpic\":\"\",\"dl_idcardpic2\":\"\",\"dl_tbdian\":\"\",\"dl_tbzhanggui\":\"\",\"dl_tbsqpic\":null,\"dl_tblevel\":null,\"dl_remark\":\"\",\"dl_status\":\"1\",\"dl_startdate\":\"1533887037\",\"dl_enddate\":\"1565423037\",\"dl_addtime\":\"1533534673\",\"dl_pic\":null,\"dl_brand\":\"\",\"dl_brandlevel\":\"\",\"dl_oddtime\":\"0\",\"dl_oddcount\":\"0\",\"dl_logintime\":\"0\",\"dl_fanli\":\"0.00\",\"dl_jifen\":\"0\",\"dl_lastflid\":\"0\",\"dl_flmodel\":\"0\",\"dl_deposit\":\"0.00\",\"dl_depositpic\":null,\"dl_paypic\":null}', '1');
INSERT INTO `fw_log` VALUES ('2109', '76', 'maoyu517', '3321', '代理商注册', '1534148824', '114.235.188.50', '/baiman/dealer/qyjxapply', '{\"dl_username\":\"maoyu517\",\"dl_pwd\":\"e7df5ec9971637a3137a212347f55db6\",\"dl_number\":\"\",\"dl_unitcode\":\"3321\",\"dl_name\":\"\\u9648\\u5b87\",\"dl_contact\":\"\\u9648\\u5b87\",\"dl_tel\":\"18752575777\",\"dl_idcard\":\"320324199406250329\",\"dl_idcardpic\":\"\",\"dl_idcardpic2\":\"\",\"dl_tbdian\":\"\",\"dl_tbzhanggui\":\"\",\"dl_addtime\":1534148824,\"dl_status\":0,\"dl_level\":\"1\",\"dl_type\":2,\"dl_sttype\":0,\"dl_belong\":0,\"dl_referee\":0,\"dl_remark\":\"\",\"dl_address\":\"\\u6c5f\\u82cf\\u7701\\u5f90\\u5dde\\u5e02\\u7762\\u5b81\\u53bf\",\"dl_sheng\":\"32\",\"dl_shi\":\"3203\",\"dl_qu\":\"320324\",\"dl_qustr\":\"\\u6c5f\\u82cf\\u7701\\u5f90\\u5dde\\u5e02\\u7762\\u5b81\\u53bf\",\"dl_openid\":\"\",\"dl_weixin\":\"maoyu517\",\"dl_wxnickname\":\"\",\"dl_wxsex\":0,\"dl_wxprovince\":\"\",\"dl_wxcity\":\"\",\"dl_wxcountry\":\"\",\"dl_wxheadimg\":\"\",\"dl_brand\":\"\",\"dl_brandlevel\":\"\"}', '2');
INSERT INTO `fw_log` VALUES ('2110', '8', 'yunmei:chuku', '3321', '企业APP子用户登录', '1534149093', '49.92.154.144', '/zxapi/login/index', '{\"su_id\":\"8\",\"su_unitcode\":\"3321\",\"su_username\":\"chuku\",\"su_pwd\":\"0e92ed5bef4b2458da02cf12ef3ea68e\",\"su_openid\":null,\"su_wxnickname\":null,\"su_wxsex\":\"0\",\"su_wxprovince\":null,\"su_wxcity\":null,\"su_wxcountry\":null,\"su_wxheadimg\":null,\"su_weixin\":null,\"su_name\":\"\\u51fa\\u5e93\",\"su_logintime\":\"1534145472\",\"su_errlogintime\":\"1534145472\",\"su_errtimes\":\"0\",\"su_remark\":null,\"su_status\":\"1\",\"su_belong\":\"0\",\"su_purview\":\"\"}', '1');
INSERT INTO `fw_log` VALUES ('2111', '76', 'maoyu517', '3321', '经销商账号登录', '1534149095', '114.235.188.50', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2112', '8', 'yunmei:chuku', '3321', '出货导入', '1534149261', '49.92.154.144', '/zxapi/order/odshipscanres_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201808131632506621\",\"ship_deliver\":0,\"ship_dealer\":\"76\",\"ship_pro\":\"16\",\"ship_odid\":82,\"ship_odblid\":82,\"ship_oddtid\":93,\"ship_whid\":7,\"ship_proqty\":\"20\",\"ship_barcode\":\"10000046\",\"ship_date\":1534149261,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"8\",\"ship_czuser\":\"yunmei:chuku\"}', '1');
INSERT INTO `fw_log` VALUES ('2113', '8', 'yunmei:chuku', '3321', '出货导入', '1534149261', '49.92.154.144', '/zxapi/order/odshipscanres_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201808131632506621\",\"ship_deliver\":0,\"ship_dealer\":\"76\",\"ship_pro\":\"16\",\"ship_odid\":82,\"ship_odblid\":82,\"ship_oddtid\":93,\"ship_whid\":7,\"ship_proqty\":\"20\",\"ship_barcode\":\"10000092\",\"ship_date\":1534149261,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"8\",\"ship_czuser\":\"yunmei:chuku\"}', '1');
INSERT INTO `fw_log` VALUES ('2114', '8', 'yunmei:chuku', '3321', '出货导入', '1534149261', '49.92.154.144', '/zxapi/order/odshipscanres_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201808131632506621\",\"ship_deliver\":0,\"ship_dealer\":\"76\",\"ship_pro\":\"16\",\"ship_odid\":82,\"ship_odblid\":82,\"ship_oddtid\":93,\"ship_whid\":7,\"ship_proqty\":\"20\",\"ship_barcode\":\"10000123\",\"ship_date\":1534149261,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"8\",\"ship_czuser\":\"yunmei:chuku\"}', '1');
INSERT INTO `fw_log` VALUES ('2115', '8', 'yunmei:chuku', '3321', '出货导入', '1534149261', '49.92.154.144', '/zxapi/order/odshipscanres_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201808131632506621\",\"ship_deliver\":0,\"ship_dealer\":\"76\",\"ship_pro\":\"16\",\"ship_odid\":82,\"ship_odblid\":82,\"ship_oddtid\":93,\"ship_whid\":7,\"ship_proqty\":\"20\",\"ship_barcode\":\"10000124\",\"ship_date\":1534149261,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"8\",\"ship_czuser\":\"yunmei:chuku\"}', '1');
INSERT INTO `fw_log` VALUES ('2116', '8', 'yunmei:chuku', '3321', '出货导入', '1534149261', '49.92.154.144', '/zxapi/order/odshipscanres_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201808131632506621\",\"ship_deliver\":0,\"ship_dealer\":\"76\",\"ship_pro\":\"16\",\"ship_odid\":82,\"ship_odblid\":82,\"ship_oddtid\":93,\"ship_whid\":7,\"ship_proqty\":\"20\",\"ship_barcode\":\"10000139\",\"ship_date\":1534149261,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"8\",\"ship_czuser\":\"yunmei:chuku\"}', '1');
INSERT INTO `fw_log` VALUES ('2117', '8', 'yunmei:chuku', '3321', '出货导入', '1534149261', '49.92.154.144', '/zxapi/order/odshipscanres_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201808131632506621\",\"ship_deliver\":0,\"ship_dealer\":\"76\",\"ship_pro\":\"16\",\"ship_odid\":82,\"ship_odblid\":82,\"ship_oddtid\":93,\"ship_whid\":7,\"ship_proqty\":\"20\",\"ship_barcode\":\"10000103\",\"ship_date\":1534149261,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"8\",\"ship_czuser\":\"yunmei:chuku\"}', '1');
INSERT INTO `fw_log` VALUES ('2118', '8', 'yunmei:chuku', '3321', '出货导入', '1534149261', '49.92.154.144', '/zxapi/order/odshipscanres_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201808131632506621\",\"ship_deliver\":0,\"ship_dealer\":\"76\",\"ship_pro\":\"16\",\"ship_odid\":82,\"ship_odblid\":82,\"ship_oddtid\":93,\"ship_whid\":7,\"ship_proqty\":\"20\",\"ship_barcode\":\"10000131\",\"ship_date\":1534149261,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"8\",\"ship_czuser\":\"yunmei:chuku\"}', '1');
INSERT INTO `fw_log` VALUES ('2119', '8', 'yunmei:chuku', '3321', '出货导入', '1534149261', '49.92.154.144', '/zxapi/order/odshipscanres_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201808131632506621\",\"ship_deliver\":0,\"ship_dealer\":\"76\",\"ship_pro\":\"16\",\"ship_odid\":82,\"ship_odblid\":82,\"ship_oddtid\":93,\"ship_whid\":7,\"ship_proqty\":\"20\",\"ship_barcode\":\"10000010\",\"ship_date\":1534149261,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"8\",\"ship_czuser\":\"yunmei:chuku\"}', '1');
INSERT INTO `fw_log` VALUES ('2120', '66', '654081', '3321', '经销商账号登录', '1534388241', '114.235.235.186', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2121', '66', '654081', '3321', '经销商账号登录', '1534581188', '223.104.147.141', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2122', '8', 'yunmei:chuku', '3321', '企业APP子用户登录', '1534581245', '180.124.222.71', '/zxapi/login/index', '{\"su_id\":\"8\",\"su_unitcode\":\"3321\",\"su_username\":\"chuku\",\"su_pwd\":\"0e92ed5bef4b2458da02cf12ef3ea68e\",\"su_openid\":null,\"su_wxnickname\":null,\"su_wxsex\":\"0\",\"su_wxprovince\":null,\"su_wxcity\":null,\"su_wxcountry\":null,\"su_wxheadimg\":null,\"su_weixin\":null,\"su_name\":\"\\u51fa\\u5e93\",\"su_logintime\":\"1534149093\",\"su_errlogintime\":\"1534149093\",\"su_errtimes\":\"0\",\"su_remark\":null,\"su_status\":\"1\",\"su_belong\":\"0\",\"su_purview\":\"\"}', '1');
INSERT INTO `fw_log` VALUES ('2123', '8', 'yunmei:chuku', '3321', '出货导入', '1534581348', '180.124.222.71', '/zxapi/order/odshipscanres_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201808181633273684\",\"ship_deliver\":0,\"ship_dealer\":\"66\",\"ship_pro\":\"16\",\"ship_odid\":83,\"ship_odblid\":83,\"ship_oddtid\":94,\"ship_whid\":7,\"ship_proqty\":\"20\",\"ship_barcode\":\"10000128\",\"ship_date\":1534581348,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"8\",\"ship_czuser\":\"yunmei:chuku\"}', '1');
INSERT INTO `fw_log` VALUES ('2124', '8', 'yunmei:chuku', '3321', '出货导入', '1534581348', '180.124.222.71', '/zxapi/order/odshipscanres_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201808181633273684\",\"ship_deliver\":0,\"ship_dealer\":\"66\",\"ship_pro\":\"16\",\"ship_odid\":83,\"ship_odblid\":83,\"ship_oddtid\":94,\"ship_whid\":7,\"ship_proqty\":\"20\",\"ship_barcode\":\"10000121\",\"ship_date\":1534581348,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"8\",\"ship_czuser\":\"yunmei:chuku\"}', '1');
INSERT INTO `fw_log` VALUES ('2125', '8', 'yunmei:chuku', '3321', '出货导入', '1534581348', '180.124.222.71', '/zxapi/order/odshipscanres_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201808181633273684\",\"ship_deliver\":0,\"ship_dealer\":\"66\",\"ship_pro\":\"16\",\"ship_odid\":83,\"ship_odblid\":83,\"ship_oddtid\":94,\"ship_whid\":7,\"ship_proqty\":\"20\",\"ship_barcode\":\"10000141\",\"ship_date\":1534581348,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"8\",\"ship_czuser\":\"yunmei:chuku\"}', '1');
INSERT INTO `fw_log` VALUES ('2126', '8', 'yunmei:chuku', '3321', '出货导入', '1534581348', '180.124.222.71', '/zxapi/order/odshipscanres_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201808181633273684\",\"ship_deliver\":0,\"ship_dealer\":\"66\",\"ship_pro\":\"16\",\"ship_odid\":83,\"ship_odblid\":83,\"ship_oddtid\":94,\"ship_whid\":7,\"ship_proqty\":\"20\",\"ship_barcode\":\"10000044\",\"ship_date\":1534581348,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"8\",\"ship_czuser\":\"yunmei:chuku\"}', '1');
INSERT INTO `fw_log` VALUES ('2127', '76', 'maoyu517', '3321', '经销商账号登录', '1534601097', '117.136.66.248', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2128', '8', 'yunmei:chuku', '3321', '企业APP子用户登录', '1534652605', '180.124.222.71', '/zxapi/login/index', '{\"su_id\":\"8\",\"su_unitcode\":\"3321\",\"su_username\":\"chuku\",\"su_pwd\":\"0e92ed5bef4b2458da02cf12ef3ea68e\",\"su_openid\":null,\"su_wxnickname\":null,\"su_wxsex\":\"0\",\"su_wxprovince\":null,\"su_wxcity\":null,\"su_wxcountry\":null,\"su_wxheadimg\":null,\"su_weixin\":null,\"su_name\":\"\\u51fa\\u5e93\",\"su_logintime\":\"1534581245\",\"su_errlogintime\":\"1534581245\",\"su_errtimes\":\"0\",\"su_remark\":null,\"su_status\":\"1\",\"su_belong\":\"0\",\"su_purview\":\"\"}', '1');
INSERT INTO `fw_log` VALUES ('2129', '66', '654081', '3321', '经销商账号登录', '1534838646', '117.136.68.79', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2130', '8', 'yunmei:chuku', '3321', '企业APP子用户登录', '1534838734', '180.124.222.236', '/zxapi/login/index', '{\"su_id\":\"8\",\"su_unitcode\":\"3321\",\"su_username\":\"chuku\",\"su_pwd\":\"0e92ed5bef4b2458da02cf12ef3ea68e\",\"su_openid\":null,\"su_wxnickname\":null,\"su_wxsex\":\"0\",\"su_wxprovince\":null,\"su_wxcity\":null,\"su_wxcountry\":null,\"su_wxheadimg\":null,\"su_weixin\":null,\"su_name\":\"\\u51fa\\u5e93\",\"su_logintime\":\"1534652605\",\"su_errlogintime\":\"1534652605\",\"su_errtimes\":\"0\",\"su_remark\":null,\"su_status\":\"1\",\"su_belong\":\"0\",\"su_purview\":\"\"}', '1');
INSERT INTO `fw_log` VALUES ('2131', '1191', 'yunmei', '3321', '企业登录', '1534838777', '180.124.222.236', '/mp/login/logining', '', '1');
INSERT INTO `fw_log` VALUES ('2132', '8', 'yunmei:chuku', '3321', '企业APP子用户登录', '1534839356', '180.124.222.236', '/zxapi/login/index', '{\"su_id\":\"8\",\"su_unitcode\":\"3321\",\"su_username\":\"chuku\",\"su_pwd\":\"0e92ed5bef4b2458da02cf12ef3ea68e\",\"su_openid\":null,\"su_wxnickname\":null,\"su_wxsex\":\"0\",\"su_wxprovince\":null,\"su_wxcity\":null,\"su_wxcountry\":null,\"su_wxheadimg\":null,\"su_weixin\":null,\"su_name\":\"\\u51fa\\u5e93\",\"su_logintime\":\"1534838734\",\"su_errlogintime\":\"1534838734\",\"su_errtimes\":\"0\",\"su_remark\":null,\"su_status\":\"1\",\"su_belong\":\"0\",\"su_purview\":\"\"}', '1');
INSERT INTO `fw_log` VALUES ('2133', '8', 'yunmei:chuku', '3321', '企业APP子用户登录', '1534918182', '180.123.221.154', '/zxapi/login/index', '{\"su_id\":\"8\",\"su_unitcode\":\"3321\",\"su_username\":\"chuku\",\"su_pwd\":\"0e92ed5bef4b2458da02cf12ef3ea68e\",\"su_openid\":null,\"su_wxnickname\":null,\"su_wxsex\":\"0\",\"su_wxprovince\":null,\"su_wxcity\":null,\"su_wxcountry\":null,\"su_wxheadimg\":null,\"su_weixin\":null,\"su_name\":\"\\u51fa\\u5e93\",\"su_logintime\":\"1534839356\",\"su_errlogintime\":\"1534839356\",\"su_errtimes\":\"0\",\"su_remark\":null,\"su_status\":\"1\",\"su_belong\":\"0\",\"su_purview\":\"\"}', '1');
INSERT INTO `fw_log` VALUES ('2134', '1191', 'yunmei', '3321', '企业登录', '1535003989', '180.123.221.154', '/mp/login/logining', '', '1');
INSERT INTO `fw_log` VALUES ('2135', '8', 'yunmei:chuku', '3321', '企业APP子用户登录', '1535865431', '180.104.220.191', '/zxapi/login/index', '{\"su_id\":\"8\",\"su_unitcode\":\"3321\",\"su_username\":\"chuku\",\"su_pwd\":\"0e92ed5bef4b2458da02cf12ef3ea68e\",\"su_openid\":null,\"su_wxnickname\":null,\"su_wxsex\":\"0\",\"su_wxprovince\":null,\"su_wxcity\":null,\"su_wxcountry\":null,\"su_wxheadimg\":null,\"su_weixin\":null,\"su_name\":\"\\u51fa\\u5e93\",\"su_logintime\":\"1534918182\",\"su_errlogintime\":\"1535787786\",\"su_errtimes\":\"2\",\"su_remark\":null,\"su_status\":\"1\",\"su_belong\":\"0\",\"su_purview\":\"\"}', '1');
INSERT INTO `fw_log` VALUES ('2136', '76', 'maoyu517', '3321', '经销商账号登录', '1535900472', '117.136.46.136', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2137', '66', '654081', '3321', '经销商账号登录', '1536127502', '49.81.113.175', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2138', '8', 'yunmei:chuku', '3321', '企业APP子用户登录', '1536127541', '121.233.39.115', '/zxapi/login/index', '{\"su_id\":\"8\",\"su_unitcode\":\"3321\",\"su_username\":\"chuku\",\"su_pwd\":\"0e92ed5bef4b2458da02cf12ef3ea68e\",\"su_openid\":null,\"su_wxnickname\":null,\"su_wxsex\":\"0\",\"su_wxprovince\":null,\"su_wxcity\":null,\"su_wxcountry\":null,\"su_wxheadimg\":null,\"su_weixin\":null,\"su_name\":\"\\u51fa\\u5e93\",\"su_logintime\":\"1535865431\",\"su_errlogintime\":\"1535865431\",\"su_errtimes\":\"0\",\"su_remark\":null,\"su_status\":\"1\",\"su_belong\":\"0\",\"su_purview\":\"\"}', '1');
INSERT INTO `fw_log` VALUES ('2139', '8', 'yunmei:chuku', '3321', '出货导入', '1536127639', '121.233.39.115', '/zxapi/order/odshipscanres_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201809051405111285\",\"ship_deliver\":0,\"ship_dealer\":\"66\",\"ship_pro\":\"16\",\"ship_odid\":84,\"ship_odblid\":84,\"ship_oddtid\":95,\"ship_whid\":7,\"ship_proqty\":\"20\",\"ship_barcode\":\"10000156\",\"ship_date\":1536127639,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"8\",\"ship_czuser\":\"yunmei:chuku\"}', '1');
INSERT INTO `fw_log` VALUES ('2140', '8', 'yunmei:chuku', '3321', '出货导入', '1536127639', '121.233.39.115', '/zxapi/order/odshipscanres_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201809051405111285\",\"ship_deliver\":0,\"ship_dealer\":\"66\",\"ship_pro\":\"16\",\"ship_odid\":84,\"ship_odblid\":84,\"ship_oddtid\":95,\"ship_whid\":7,\"ship_proqty\":\"20\",\"ship_barcode\":\"10000127\",\"ship_date\":1536127639,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"8\",\"ship_czuser\":\"yunmei:chuku\"}', '1');
INSERT INTO `fw_log` VALUES ('2141', '8', 'yunmei:chuku', '3321', '出货导入', '1536127639', '121.233.39.115', '/zxapi/order/odshipscanres_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201809051405111285\",\"ship_deliver\":0,\"ship_dealer\":\"66\",\"ship_pro\":\"16\",\"ship_odid\":84,\"ship_odblid\":84,\"ship_oddtid\":95,\"ship_whid\":7,\"ship_proqty\":\"20\",\"ship_barcode\":\"10000038\",\"ship_date\":1536127639,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"8\",\"ship_czuser\":\"yunmei:chuku\"}', '1');
INSERT INTO `fw_log` VALUES ('2142', '1191', 'yunmei', '3321', '企业登录', '1536318017', '180.123.223.33', '/mp/login/logining', '', '1');
INSERT INTO `fw_log` VALUES ('2143', '73', 'tzwl588', '3321', '经销商账号登录', '1536565197', '49.95.119.22', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2144', '73', 'tzwl588', '3321', '经销商账号登录', '1536635262', '122.96.49.4', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2145', '69', '15365423666', '3321', '经销商账号登录', '1536658989', '49.95.187.151', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2146', '8', 'yunmei:chuku', '3321', '企业APP子用户登录', '1536834311', '49.81.113.141', '/zxapi/login/index', '{\"su_id\":\"8\",\"su_unitcode\":\"3321\",\"su_username\":\"chuku\",\"su_pwd\":\"0e92ed5bef4b2458da02cf12ef3ea68e\",\"su_openid\":null,\"su_wxnickname\":null,\"su_wxsex\":\"0\",\"su_wxprovince\":null,\"su_wxcity\":null,\"su_wxcountry\":null,\"su_wxheadimg\":null,\"su_weixin\":null,\"su_name\":\"\\u51fa\\u5e93\",\"su_logintime\":\"1536127541\",\"su_errlogintime\":\"1536127541\",\"su_errtimes\":\"0\",\"su_remark\":null,\"su_status\":\"1\",\"su_belong\":\"0\",\"su_purview\":\"\"}', '1');
INSERT INTO `fw_log` VALUES ('2147', '1191', 'yunmei', '3321', '企业登录', '1536897059', '49.81.113.141', '/mp/login/logining', '', '1');
INSERT INTO `fw_log` VALUES ('2148', '1191', 'yunmei', '3321', '修改经销商', '1536897135', '49.81.113.141', '/mp/dealer/edit_save', '{\"dl_id\":66,\"dl_number\":\"N007700\",\"dl_name\":\"\\u77f3\\u7476\\u7476\",\"dl_area\":\"\",\"dl_contact\":\"\\u77f3\\u7476\\u7476\",\"dl_tel\":\"15252161759\",\"dl_fax\":\"\",\"dl_address\":\"\\u6c5f\\u82cf\\u7701\\u5f90\\u5dde\\u5e02\\u7762\\u5b81\\u53bf\\u661f\\u6cb3\\u6e7e\",\"dl_email\":\"\",\"dl_qq\":\"\",\"dl_idcard\":\"320324199410080721\",\"dl_remark\":\"\",\"dl_des\":\"\",\"dl_weixin\":\"654081\",\"dl_pwd\":\"0e92ed5bef4b2458da02cf12ef3ea68e\"}', '1');
INSERT INTO `fw_log` VALUES ('2149', '66', '654081', '3321', '经销商账号登录', '1536897137', '223.104.147.156', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2150', '8', 'yunmei:chuku', '3321', '企业APP子用户登录', '1536897192', '49.81.113.141', '/zxapi/login/index', '{\"su_id\":\"8\",\"su_unitcode\":\"3321\",\"su_username\":\"chuku\",\"su_pwd\":\"0e92ed5bef4b2458da02cf12ef3ea68e\",\"su_openid\":null,\"su_wxnickname\":null,\"su_wxsex\":\"0\",\"su_wxprovince\":null,\"su_wxcity\":null,\"su_wxcountry\":null,\"su_wxheadimg\":null,\"su_weixin\":null,\"su_name\":\"\\u51fa\\u5e93\",\"su_logintime\":\"1536834311\",\"su_errlogintime\":\"1536834311\",\"su_errtimes\":\"0\",\"su_remark\":null,\"su_status\":\"1\",\"su_belong\":\"0\",\"su_purview\":\"\"}', '1');
INSERT INTO `fw_log` VALUES ('2151', '8', 'yunmei:chuku', '3321', '出货导入', '1536897224', '49.81.113.141', '/zxapi/order/odshipscanres_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201807271923238689\",\"ship_deliver\":0,\"ship_dealer\":\"69\",\"ship_pro\":\"16\",\"ship_odid\":69,\"ship_odblid\":69,\"ship_oddtid\":80,\"ship_whid\":7,\"ship_proqty\":\"20\",\"ship_barcode\":\"10000138\",\"ship_date\":1536897224,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"8\",\"ship_czuser\":\"yunmei:chuku\"}', '1');
INSERT INTO `fw_log` VALUES ('2152', '8', 'yunmei:chuku', '3321', '出货导入', '1536897364', '49.81.113.141', '/zxapi/order/odshipscanres_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201809141152483931\",\"ship_deliver\":0,\"ship_dealer\":\"66\",\"ship_pro\":\"16\",\"ship_odid\":85,\"ship_odblid\":85,\"ship_oddtid\":96,\"ship_whid\":7,\"ship_proqty\":\"20\",\"ship_barcode\":\"10000135\",\"ship_date\":1536897364,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"8\",\"ship_czuser\":\"yunmei:chuku\"}', '1');
INSERT INTO `fw_log` VALUES ('2153', '8', 'yunmei:chuku', '3321', '出货导入', '1536897364', '49.81.113.141', '/zxapi/order/odshipscanres_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201809141152483931\",\"ship_deliver\":0,\"ship_dealer\":\"66\",\"ship_pro\":\"16\",\"ship_odid\":85,\"ship_odblid\":85,\"ship_oddtid\":96,\"ship_whid\":7,\"ship_proqty\":\"20\",\"ship_barcode\":\"10000137\",\"ship_date\":1536897364,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"8\",\"ship_czuser\":\"yunmei:chuku\"}', '1');
INSERT INTO `fw_log` VALUES ('2154', '8', 'yunmei:chuku', '3321', '出货导入', '1536897364', '49.81.113.141', '/zxapi/order/odshipscanres_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201809141152483931\",\"ship_deliver\":0,\"ship_dealer\":\"66\",\"ship_pro\":\"16\",\"ship_odid\":85,\"ship_odblid\":85,\"ship_oddtid\":96,\"ship_whid\":7,\"ship_proqty\":\"20\",\"ship_barcode\":\"10000129\",\"ship_date\":1536897364,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"8\",\"ship_czuser\":\"yunmei:chuku\"}', '1');
INSERT INTO `fw_log` VALUES ('2155', '8', 'yunmei:chuku', '3321', '出货导入', '1536897364', '49.81.113.141', '/zxapi/order/odshipscanres_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201809141152483931\",\"ship_deliver\":0,\"ship_dealer\":\"66\",\"ship_pro\":\"16\",\"ship_odid\":85,\"ship_odblid\":85,\"ship_oddtid\":96,\"ship_whid\":7,\"ship_proqty\":\"20\",\"ship_barcode\":\"10000134\",\"ship_date\":1536897364,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"8\",\"ship_czuser\":\"yunmei:chuku\"}', '1');
INSERT INTO `fw_log` VALUES ('2156', '8', 'yunmei:chuku', '3321', '企业APP子用户登录', '1537328906', '180.123.222.200', '/zxapi/login/index', '{\"su_id\":\"8\",\"su_unitcode\":\"3321\",\"su_username\":\"chuku\",\"su_pwd\":\"0e92ed5bef4b2458da02cf12ef3ea68e\",\"su_openid\":null,\"su_wxnickname\":null,\"su_wxsex\":\"0\",\"su_wxprovince\":null,\"su_wxcity\":null,\"su_wxcountry\":null,\"su_wxheadimg\":null,\"su_weixin\":null,\"su_name\":\"\\u51fa\\u5e93\",\"su_logintime\":\"1536897192\",\"su_errlogintime\":\"1536897192\",\"su_errtimes\":\"0\",\"su_remark\":null,\"su_status\":\"1\",\"su_belong\":\"0\",\"su_purview\":\"\"}', '1');
INSERT INTO `fw_log` VALUES ('2157', '1191', 'yunmei', '3321', '企业登录', '1537443843', '121.233.25.216', '/mp/login/logining', '', '1');
INSERT INTO `fw_log` VALUES ('2158', '66', '654081', '3321', '经销商账号登录', '1537609076', '49.81.113.78', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2159', '1191', 'yunmei', '3321', '企业登录', '1537609279', '49.81.113.78', '/mp/login/logining', '', '1');
INSERT INTO `fw_log` VALUES ('2160', '67', '13636393523', '3321', '经销商账号登录', '1537609366', '49.81.113.78', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2161', '77', 'T13736877828', '3321', '代理商注册', '1537612805', '223.104.247.243', '/baiman/dealer/apply', '{\"dl_username\":\"T13736877828\",\"dl_pwd\":\"cd58584d66efaf246561bb9c388276ba\",\"dl_number\":\"\",\"dl_unitcode\":\"3321\",\"dl_name\":\"\\u6c64\\u4e39\\u4e3d\",\"dl_contact\":\"\\u6c64\\u4e39\\u4e3d\",\"dl_tel\":\"13736877828\",\"dl_idcard\":\"330424198811291223\",\"dl_idcardpic\":\"\",\"dl_idcardpic2\":\"\",\"dl_tbdian\":\"\",\"dl_tbzhanggui\":\"\",\"dl_addtime\":1537612805,\"dl_status\":0,\"dl_level\":\"3\",\"dl_type\":6,\"dl_sttype\":0,\"dl_belong\":\"67\",\"dl_referee\":67,\"dl_remark\":\"\",\"dl_address\":\"\\u6d59\\u6c5f\\u7701\\u5609\\u5174\\u5e02\\u6d77\\u76d0\\u53bf\\u6b66\\u539f\\u8857\\u9053\\u767e\\u5c3a\\u5357\\u8def\\u91d1\\u57df\\u84dd\\u6e7e16\\u5e621002\\u5ba4\",\"dl_sheng\":\"33\",\"dl_shi\":\"3304\",\"dl_qu\":\"330424\",\"dl_qustr\":\"\\u6d59\\u6c5f\\u7701\\u5609\\u5174\\u5e02\\u6d77\\u76d0\\u53bf\",\"dl_openid\":\"\",\"dl_weixin\":\"T13736877828\",\"dl_wxnickname\":\"\",\"dl_wxsex\":0,\"dl_wxprovince\":\"\",\"dl_wxcity\":\"\",\"dl_wxcountry\":\"\",\"dl_wxheadimg\":\"\",\"dl_brand\":\"\",\"dl_brandlevel\":\"\"}', '2');
INSERT INTO `fw_log` VALUES ('2162', '78', 'han864411327', '3321', '代理商注册', '1537612805', '183.212.0.94', '/baiman/dealer/apply', '{\"dl_username\":\"han864411327\",\"dl_pwd\":\"2307817429dc065f504706befec4a8a0\",\"dl_number\":\"\",\"dl_unitcode\":\"3321\",\"dl_name\":\"\\u5b59\\u6668\\u6657\",\"dl_contact\":\"\\u5b59\\u6668\\u6657\",\"dl_tel\":\"15396970007\",\"dl_idcard\":\"32082119910728050X\",\"dl_idcardpic\":\"\",\"dl_idcardpic2\":\"\",\"dl_tbdian\":\"\",\"dl_tbzhanggui\":\"\",\"dl_addtime\":1537612805,\"dl_status\":0,\"dl_level\":\"3\",\"dl_type\":6,\"dl_sttype\":0,\"dl_belong\":\"67\",\"dl_referee\":67,\"dl_remark\":\"\",\"dl_address\":\"\\u6c5f\\u82cf\\u7701\\u6dee\\u5b89\\u5e02\\u6e05\\u6c5f\\u6d66\\u533a\\u6c34\\u6e21\\u53e3\\u5927\\u9053\\u4e1c\\u65b9\\u4e3d\\u666f\\u4e09\\u533a\\u5341\\u4e5d\\u680b305\",\"dl_sheng\":\"32\",\"dl_shi\":\"3208\",\"dl_qu\":\"320802\",\"dl_qustr\":\"\\u6c5f\\u82cf\\u7701\\u6dee\\u5b89\\u5e02\\u6e05\\u6cb3\\u533a\",\"dl_openid\":\"\",\"dl_weixin\":\"han864411327\",\"dl_wxnickname\":\"\",\"dl_wxsex\":0,\"dl_wxprovince\":\"\",\"dl_wxcity\":\"\",\"dl_wxcountry\":\"\",\"dl_wxheadimg\":\"\",\"dl_brand\":\"\",\"dl_brandlevel\":\"\"}', '2');
INSERT INTO `fw_log` VALUES ('2163', '79', '15985812447', '3321', '代理商注册', '1537613809', '58.23.18.150', '/baiman/dealer/apply', '{\"dl_username\":\"15985812447\",\"dl_pwd\":\"69bb23a5df6414a1c085c113e9c1e9bd\",\"dl_number\":\"\",\"dl_unitcode\":\"3321\",\"dl_name\":\"\\u5f20\\u71d5\\u73b2\",\"dl_contact\":\"\\u5f20\\u71d5\\u73b2\",\"dl_tel\":\"15985812447\",\"dl_idcard\":\"350521199103075268\",\"dl_idcardpic\":\"\",\"dl_idcardpic2\":\"\",\"dl_tbdian\":\"\",\"dl_tbzhanggui\":\"\",\"dl_addtime\":1537613809,\"dl_status\":0,\"dl_level\":\"2\",\"dl_type\":3,\"dl_sttype\":0,\"dl_belong\":\"67\",\"dl_referee\":67,\"dl_remark\":\"\",\"dl_address\":\"\\u798f\\u5efa\\u7701\\u53a6\\u95e8\\u5e02\\u6e56\\u91cc\\u533a\\u5b89\\u5cad\\u4e8c\\u8def\\u4fe1\\u8bda\\u56fd\\u9645703\",\"dl_sheng\":\"35\",\"dl_shi\":\"3502\",\"dl_qu\":\"350206\",\"dl_qustr\":\"\\u798f\\u5efa\\u7701\\u53a6\\u95e8\\u5e02\\u6e56\\u91cc\\u533a\",\"dl_openid\":\"\",\"dl_weixin\":\"15985812447\",\"dl_wxnickname\":\"\",\"dl_wxsex\":0,\"dl_wxprovince\":\"\",\"dl_wxcity\":\"\",\"dl_wxcountry\":\"\",\"dl_wxheadimg\":\"\",\"dl_brand\":\"\",\"dl_brandlevel\":\"\"}', '2');
INSERT INTO `fw_log` VALUES ('2164', '80', 'Zyy575757', '3321', '代理商注册', '1537614049', '120.33.14.160', '/baiman/dealer/apply', '{\"dl_username\":\"Zyy575757\",\"dl_pwd\":\"62a831ff96754364bb6fbad30b21b253\",\"dl_number\":\"\",\"dl_unitcode\":\"3321\",\"dl_name\":\"\\u5f20\\u4e91\\u71d5\",\"dl_contact\":\"\\u5f20\\u4e91\\u71d5\",\"dl_tel\":\"13959750796\",\"dl_idcard\":\"350521198904225268\",\"dl_idcardpic\":\"\",\"dl_idcardpic2\":\"\",\"dl_tbdian\":\"\",\"dl_tbzhanggui\":\"\",\"dl_addtime\":1537614049,\"dl_status\":0,\"dl_level\":\"3\",\"dl_type\":6,\"dl_sttype\":0,\"dl_belong\":\"67\",\"dl_referee\":67,\"dl_remark\":\"\",\"dl_address\":\"\\u798f\\u5efa\\u7701\\u6cc9\\u5dde\\u5e02\\u60e0\\u5b89\\u53bf\\u4e1c\\u6865\\u9547\\u9999\\u5c71\\u6751\",\"dl_sheng\":\"35\",\"dl_shi\":\"3505\",\"dl_qu\":\"350521\",\"dl_qustr\":\"\\u798f\\u5efa\\u7701\\u6cc9\\u5dde\\u5e02\\u60e0\\u5b89\\u53bf\",\"dl_openid\":\"\",\"dl_weixin\":\"Zyy575757\",\"dl_wxnickname\":\"\",\"dl_wxsex\":0,\"dl_wxprovince\":\"\",\"dl_wxcity\":\"\",\"dl_wxcountry\":\"\",\"dl_wxheadimg\":\"\",\"dl_brand\":\"\",\"dl_brandlevel\":\"\"}', '2');
INSERT INTO `fw_log` VALUES ('2165', '1191', 'yunmei', '3321', '企业登录', '1537614342', '117.136.46.131', '/mp/login/logining', '', '1');
INSERT INTO `fw_log` VALUES ('2166', '79', '15985812447', '3321', '经销商账号登录', '1537614477', '223.104.6.41', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2167', '81', '13758761295', '3321', '代理商注册', '1537614511', '112.17.240.153', '/baiman/dealer/apply', '{\"dl_username\":\"13758761295\",\"dl_pwd\":\"50b22cb4036ca463789be118109158e0\",\"dl_number\":\"\",\"dl_unitcode\":\"3321\",\"dl_name\":\"\\u73b2\\u73b2\",\"dl_contact\":\"\\u73b2\\u73b2\",\"dl_tel\":\"13758761295\",\"dl_idcard\":\"330328197112173346\",\"dl_idcardpic\":\"\",\"dl_idcardpic2\":\"\",\"dl_tbdian\":\"\",\"dl_tbzhanggui\":\"\",\"dl_addtime\":1537614511,\"dl_status\":0,\"dl_level\":\"3\",\"dl_type\":6,\"dl_sttype\":0,\"dl_belong\":\"67\",\"dl_referee\":67,\"dl_remark\":\"\",\"dl_address\":\"\\u6d59\\u6c5f\\u7701\\u6e29\\u5dde\\u5e02\\u745e\\u5b89\\u5e02\\u5858\\u4e0b\\u7f57\\u51e4\\u6751\\u76f8\\u5802\\u8def104\",\"dl_sheng\":\"33\",\"dl_shi\":\"3303\",\"dl_qu\":\"330381\",\"dl_qustr\":\"\\u6d59\\u6c5f\\u7701\\u6e29\\u5dde\\u5e02\\u745e\\u5b89\\u5e02\",\"dl_openid\":\"\",\"dl_weixin\":\"13758761295\",\"dl_wxnickname\":\"\",\"dl_wxsex\":0,\"dl_wxprovince\":\"\",\"dl_wxcity\":\"\",\"dl_wxcountry\":\"\",\"dl_wxheadimg\":\"\",\"dl_brand\":\"\",\"dl_brandlevel\":\"\"}', '2');
INSERT INTO `fw_log` VALUES ('2168', '1191', 'yunmei', '3321', '修改经销商', '1537614648', '117.136.46.131', '/mp/dealer/edit_save', '{\"dl_id\":80,\"dl_number\":\"No:007711\",\"dl_name\":\"\\u5f20\\u4e91\\u71d5\",\"dl_area\":\"\",\"dl_contact\":\"\\u5f20\\u4e91\\u71d5\",\"dl_tel\":\"13959750796\",\"dl_fax\":\"\",\"dl_address\":\"\\u798f\\u5efa\\u7701\\u6cc9\\u5dde\\u5e02\\u60e0\\u5b89\\u53bf\\u4e1c\\u6865\\u9547\\u9999\\u5c71\\u6751\",\"dl_email\":\"\",\"dl_qq\":\"\",\"dl_idcard\":\"350521198904225268\",\"dl_remark\":\"\",\"dl_des\":\"\",\"dl_weixin\":\"Zyy575757\"}', '1');
INSERT INTO `fw_log` VALUES ('2169', '77', 'T13736877828', '3321', '经销商账号登录', '1537614723', '223.104.247.243', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2170', '1191', 'yunmei', '3321', '删除经销商', '1537614771', '117.136.46.131', '/mp/dealer/delete/dl_id/80', '{\"dl_id\":\"80\",\"dl_unitcode\":\"3321\",\"dl_openid\":\"\",\"dl_username\":\"Zyy575757\",\"dl_pwd\":\"62a831ff96754364bb6fbad30b21b253\",\"dl_number\":\"No:007711\",\"dl_name\":\"\\u5f20\\u4e91\\u71d5\",\"dl_des\":\"\",\"dl_area\":\"\",\"dl_type\":\"6\",\"dl_sttype\":\"0\",\"dl_belong\":\"67\",\"dl_referee\":\"67\",\"dl_level\":\"3\",\"dl_contact\":\"\\u5f20\\u4e91\\u71d5\",\"dl_tel\":\"13959750796\",\"dl_fax\":\"\",\"dl_email\":\"\",\"dl_weixin\":\"Zyy575757\",\"dl_wxnickname\":\"\",\"dl_wxsex\":\"0\",\"dl_wxprovince\":\"\",\"dl_wxcity\":\"\",\"dl_wxcountry\":\"\",\"dl_wxheadimg\":\"\",\"dl_qq\":\"\",\"dl_country\":\"0\",\"dl_sheng\":\"35\",\"dl_shi\":\"3505\",\"dl_qu\":\"350521\",\"dl_qustr\":\"\\u798f\\u5efa\\u7701\\u6cc9\\u5dde\\u5e02\\u60e0\\u5b89\\u53bf\",\"dl_address\":\"\\u798f\\u5efa\\u7701\\u6cc9\\u5dde\\u5e02\\u60e0\\u5b89\\u53bf\\u4e1c\\u6865\\u9547\\u9999\\u5c71\\u6751\",\"dl_idcard\":\"350521198904225268\",\"dl_idcardpic\":\"\",\"dl_idcardpic2\":\"\",\"dl_tbdian\":\"\",\"dl_tbzhanggui\":\"\",\"dl_tbsqpic\":null,\"dl_tblevel\":null,\"dl_remark\":\"\",\"dl_status\":\"1\",\"dl_startdate\":\"1537614510\",\"dl_enddate\":\"1569150510\",\"dl_addtime\":\"1537614049\",\"dl_pic\":null,\"dl_brand\":\"\",\"dl_brandlevel\":\"\",\"dl_oddtime\":\"0\",\"dl_oddcount\":\"0\",\"dl_logintime\":\"0\",\"dl_fanli\":\"0.00\",\"dl_jifen\":\"0\",\"dl_lastflid\":\"0\",\"dl_flmodel\":\"0\",\"dl_deposit\":\"0.00\",\"dl_depositpic\":null,\"dl_paypic\":null}', '1');
INSERT INTO `fw_log` VALUES ('2171', '82', 'Zyy575757', '3321', '代理商注册', '1537614829', '120.33.14.160', '/baiman/dealer/apply', '{\"dl_username\":\"Zyy575757\",\"dl_pwd\":\"62a831ff96754364bb6fbad30b21b253\",\"dl_number\":\"\",\"dl_unitcode\":\"3321\",\"dl_name\":\"\\u5f20\\u4e91\\u71d5\",\"dl_contact\":\"\\u5f20\\u4e91\\u71d5\",\"dl_tel\":\"13959750796\",\"dl_idcard\":\"350521198904225268\",\"dl_idcardpic\":\"\",\"dl_idcardpic2\":\"\",\"dl_tbdian\":\"\",\"dl_tbzhanggui\":\"\",\"dl_addtime\":1537614829,\"dl_status\":0,\"dl_level\":\"3\",\"dl_type\":6,\"dl_sttype\":0,\"dl_belong\":\"79\",\"dl_referee\":79,\"dl_remark\":\"\",\"dl_address\":\"\\u798f\\u5efa\\u7701\\u6cc9\\u5dde\\u5e02\\u60e0\\u5b89\\u53bf\\u4e1c\\u6865\\u9547\\u9999\\u5c71\\u5c0f\\u5751\\u9ec4\",\"dl_sheng\":\"35\",\"dl_shi\":\"3505\",\"dl_qu\":\"350521\",\"dl_qustr\":\"\\u798f\\u5efa\\u7701\\u6cc9\\u5dde\\u5e02\\u60e0\\u5b89\\u53bf\",\"dl_openid\":\"\",\"dl_weixin\":\"Zyy575757\",\"dl_wxnickname\":\"\",\"dl_wxsex\":0,\"dl_wxprovince\":\"\",\"dl_wxcity\":\"\",\"dl_wxcountry\":\"\",\"dl_wxheadimg\":\"\",\"dl_brand\":\"\",\"dl_brandlevel\":\"\"}', '2');
INSERT INTO `fw_log` VALUES ('2172', '82', 'Zyy575757', '3321', '经销商账号登录', '1537614937', '120.33.14.160', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2173', '78', 'han864411327', '3321', '经销商账号登录', '1537620816', '183.212.0.94', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2174', '1191', 'yunmei', '3321', '企业登录', '1537625025', '121.233.25.118', '/mp/login/logining', '', '1');
INSERT INTO `fw_log` VALUES ('2175', '1191', 'yunmei', '3321', '修改经销商', '1537625059', '121.233.25.118', '/mp/dealer/edit_save', '{\"dl_id\":82,\"dl_number\":\"No:007713\",\"dl_name\":\"\\u5f20\\u4e91\\u71d5\",\"dl_area\":\"\",\"dl_contact\":\"\\u5f20\\u4e91\\u71d5\",\"dl_tel\":\"13959750796\",\"dl_fax\":\"\",\"dl_address\":\"\\u798f\\u5efa\\u7701\\u6cc9\\u5dde\\u5e02\\u60e0\\u5b89\\u53bf\\u4e1c\\u6865\\u9547\\u9999\\u5c71\\u5c0f\\u5751\\u9ec4\",\"dl_email\":\"\",\"dl_qq\":\"\",\"dl_idcard\":\"350521198904225268\",\"dl_remark\":\"\",\"dl_des\":\"\",\"dl_weixin\":\"Zyy575757\",\"dl_pwd\":\"c56d0e9a7ccec67b4ea131655038d604\"}', '1');
INSERT INTO `fw_log` VALUES ('2176', '83', '15980787369', '3321', '代理商注册', '1537627123', '117.30.133.227', '/baiman/dealer/apply', '{\"dl_username\":\"15980787369\",\"dl_pwd\":\"3ae9f10017d0ce4a9ff23705b88eba1f\",\"dl_number\":\"\",\"dl_unitcode\":\"3321\",\"dl_name\":\"\\u6797\\u79cb\\u5a55\",\"dl_contact\":\"\\u6797\\u79cb\\u5a55\",\"dl_tel\":\"15980787369\",\"dl_idcard\":\"350206199608282027\",\"dl_idcardpic\":\"\",\"dl_idcardpic2\":\"\",\"dl_tbdian\":\"\",\"dl_tbzhanggui\":\"\",\"dl_addtime\":1537627123,\"dl_status\":0,\"dl_level\":\"3\",\"dl_type\":6,\"dl_sttype\":0,\"dl_belong\":\"79\",\"dl_referee\":79,\"dl_remark\":\"\",\"dl_address\":\"\\u798f\\u5efa\\u7701\\u53a6\\u95e8\\u5e02\\u6e56\\u91cc\\u533a\\u91d1\\u5c71\\u8857\\u9053\\u91d1\\u6cf0\\u8def\\u6653\\u7b51\\u516c\\u5bd3\",\"dl_sheng\":\"35\",\"dl_shi\":\"3502\",\"dl_qu\":\"350206\",\"dl_qustr\":\"\\u798f\\u5efa\\u7701\\u53a6\\u95e8\\u5e02\\u6e56\\u91cc\\u533a\",\"dl_openid\":\"\",\"dl_weixin\":\"15980787369\",\"dl_wxnickname\":\"\",\"dl_wxsex\":0,\"dl_wxprovince\":\"\",\"dl_wxcity\":\"\",\"dl_wxcountry\":\"\",\"dl_wxheadimg\":\"\",\"dl_brand\":\"\",\"dl_brandlevel\":\"\"}', '2');
INSERT INTO `fw_log` VALUES ('2177', '82', 'Zyy575757', '3321', '经销商账号登录', '1537628470', '121.233.25.118', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2178', '66', '654081', '3321', '经销商账号登录', '1537629194', '121.233.25.118', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2179', '84', '13615672165', '3321', '代理商注册', '1537630181', '223.104.36.249', '/baiman/dealer/apply', '{\"dl_username\":\"13615672165\",\"dl_pwd\":\"8fdb1d236601d5c0ae6b8c9982bc9293\",\"dl_number\":\"\",\"dl_unitcode\":\"3321\",\"dl_name\":\"\\u738b\\u83b9\",\"dl_contact\":\"\\u738b\\u83b9\",\"dl_tel\":\"13615672165\",\"dl_idcard\":\"341222198512082527\",\"dl_idcardpic\":\"\",\"dl_idcardpic2\":\"\",\"dl_tbdian\":\"\",\"dl_tbzhanggui\":\"\",\"dl_addtime\":1537630181,\"dl_status\":0,\"dl_level\":\"2\",\"dl_type\":3,\"dl_sttype\":0,\"dl_belong\":\"67\",\"dl_referee\":67,\"dl_remark\":\"\",\"dl_address\":\"\\u5b89\\u5fbd\\u7701\\u961c\\u9633\\u5e02\\u592a\\u548c\\u53bf\\u53cb\\u8c0a\\u65b0\\u6751\\uff08\\u516c\\u5b89\\u5c40\\u5bf9\\u9762\\uff0922#102\",\"dl_sheng\":\"34\",\"dl_shi\":\"3412\",\"dl_qu\":\"341222\",\"dl_qustr\":\"\\u5b89\\u5fbd\\u7701\\u961c\\u9633\\u5e02\\u592a\\u548c\\u53bf\",\"dl_openid\":\"\",\"dl_weixin\":\"13615672165\",\"dl_wxnickname\":\"\",\"dl_wxsex\":0,\"dl_wxprovince\":\"\",\"dl_wxcity\":\"\",\"dl_wxcountry\":\"\",\"dl_wxheadimg\":\"\",\"dl_brand\":\"\",\"dl_brandlevel\":\"\"}', '2');
INSERT INTO `fw_log` VALUES ('2180', '82', 'Zyy575757', '3321', '经销商账号登录', '1537659672', '120.33.14.160', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2181', '82', 'Zyy575757', '3321', '经销商账号登录', '1537666938', '223.104.147.141', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2182', '66', '654081', '3321', '经销商账号登录', '1537666979', '223.104.147.141', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2183', '79', '15985812447', '3321', '经销商账号登录', '1537670679', '223.104.6.1', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2184', '1191', 'yunmei', '3321', '企业登录', '1537683063', '180.123.220.102', '/mp/login/logining', '', '1');
INSERT INTO `fw_log` VALUES ('2185', '1191', 'yunmei', '3321', '修改产品价格体系', '1537683329', '180.123.220.102', '/mp/product/propriceedit_save', '[{\"dlt_id\":\"2\",\"dlt_unitcode\":\"3321\",\"dlt_name\":\"\\u5141\\u7f8e\\u5927\\u5065\\u5eb7\",\"dlt_level\":\"1\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"0.00\",\"dlt_minnum\":\"3\",\"priprice\":\"2000.00\",\"pro_id\":\"16\"},{\"dlt_id\":\"3\",\"dlt_unitcode\":\"3321\",\"dlt_name\":\"\\u6267\\u884c\\u8463\\u4e8b\",\"dlt_level\":\"2\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"0.00\",\"dlt_minnum\":\"3\",\"priprice\":\"2900.00\",\"pro_id\":\"16\"},{\"dlt_id\":\"6\",\"dlt_unitcode\":\"3321\",\"dlt_name\":\"\\u5b98\\u65b9\\u4ee3\\u7406\",\"dlt_level\":\"3\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"0.00\",\"dlt_minnum\":\"0\",\"priprice\":\"3800\",\"pro_id\":\"16\"},{\"dlt_id\":\"7\",\"dlt_unitcode\":\"3321\",\"dlt_name\":\"\\u94bb\\u77f3\\u4ee3\\u7406\",\"dlt_level\":\"4\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"0.00\",\"dlt_minnum\":\"0\",\"priprice\":\"4780.00\",\"pro_id\":\"16\"},{\"dlt_id\":\"8\",\"dlt_unitcode\":\"3321\",\"dlt_name\":\"VIP\\u4ee3\\u7406\",\"dlt_level\":\"5\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"0.00\",\"dlt_minnum\":\"0\",\"priprice\":\"5980.00\",\"pro_id\":\"16\"}]', '1');
INSERT INTO `fw_log` VALUES ('2186', '1191', 'yunmei', '3321', '修改产品价格体系', '1537683423', '180.123.220.102', '/mp/product/propriceedit_save', '[{\"dlt_id\":\"2\",\"dlt_unitcode\":\"3321\",\"dlt_name\":\"\\u5141\\u7f8e\\u5927\\u5065\\u5eb7\",\"dlt_level\":\"1\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"0.00\",\"dlt_minnum\":\"3\",\"priprice\":\"1296\",\"pro_id\":\"17\"},{\"dlt_id\":\"3\",\"dlt_unitcode\":\"3321\",\"dlt_name\":\"\\u6267\\u884c\\u8463\\u4e8b\",\"dlt_level\":\"2\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"0.00\",\"dlt_minnum\":\"3\",\"priprice\":\"1656\",\"pro_id\":\"17\"},{\"dlt_id\":\"6\",\"dlt_unitcode\":\"3321\",\"dlt_name\":\"\\u5b98\\u65b9\\u4ee3\\u7406\",\"dlt_level\":\"3\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"0.00\",\"dlt_minnum\":\"0\",\"priprice\":\"2088\",\"pro_id\":\"17\"},{\"dlt_id\":\"7\",\"dlt_unitcode\":\"3321\",\"dlt_name\":\"\\u94bb\\u77f3\\u4ee3\\u7406\",\"dlt_level\":\"4\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"0.00\",\"dlt_minnum\":\"0\",\"priprice\":\"2736\",\"pro_id\":\"17\"},{\"dlt_id\":\"8\",\"dlt_unitcode\":\"3321\",\"dlt_name\":\"VIP\\u4ee3\\u7406\",\"dlt_level\":\"5\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"0.00\",\"dlt_minnum\":\"0\",\"priprice\":\"3456\",\"pro_id\":\"17\"}]', '1');
INSERT INTO `fw_log` VALUES ('2187', '1191', 'yunmei', '3321', '修改产品', '1537683457', '180.123.220.102', '/mp/product/edit_save', '{\"pro_id\":17,\"pro_name\":\"\\u5141\\u7f8e\\u679c\\u852c\\u9175\\u7d20\\u7c89\",\"pro_number\":\"\\u9175\\u7d20\",\"pro_typeid\":20,\"pro_jftype\":1,\"pro_jifen\":0,\"pro_jfmax\":0,\"pro_dljf\":0,\"pro_desc\":\"\\u9175\\u7d201\\u7bb1 10\\u888b*36\\u76d2\",\"pro_link\":\"\",\"pro_barcode\":\"\",\"pro_remark\":\"\\u9175\\u7d20\\u7c891\\u7bb1 10\\u888b*36\\u76d2\",\"pro_price\":\"7600.00\",\"pro_stock\":0,\"pro_units\":\"\\u76d2\",\"pro_dbiao\":1,\"pro_zbiao\":0,\"pro_xbiao\":36}', '1');
INSERT INTO `fw_log` VALUES ('2188', '1191', 'yunmei', '3321', '修改产品', '1537683466', '180.123.220.102', '/mp/product/edit_save', '{\"pro_id\":17,\"pro_name\":\"\\u5141\\u7f8e \\u679c\\u852c\\u9175\\u7d20\\u7c89\",\"pro_number\":\"\\u9175\\u7d20\",\"pro_typeid\":20,\"pro_jftype\":1,\"pro_jifen\":0,\"pro_jfmax\":0,\"pro_dljf\":0,\"pro_desc\":\"\\u9175\\u7d201\\u7bb1 10\\u888b*36\\u76d2\",\"pro_link\":\"\",\"pro_barcode\":\"\",\"pro_remark\":\"\\u9175\\u7d20\\u7c891\\u7bb1 10\\u888b*36\\u76d2\",\"pro_price\":\"7600.00\",\"pro_stock\":0,\"pro_units\":\"\\u76d2\",\"pro_dbiao\":1,\"pro_zbiao\":0,\"pro_xbiao\":36}', '1');
INSERT INTO `fw_log` VALUES ('2189', '69', '15365423666', '3321', '经销商账号登录', '1537685429', '49.90.56.150', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2190', '85', 'yanjuxyz', '3321', '代理商注册', '1537685552', '180.123.220.102', '/baiman/dealer/apply', '{\"dl_username\":\"yanjuxyz\",\"dl_pwd\":\"e977ff272d2b12b35581d3473f598e66\",\"dl_number\":\"\",\"dl_unitcode\":\"3321\",\"dl_name\":\"\\u6768\\u83ca\",\"dl_contact\":\"\\u6768\\u83ca\",\"dl_tel\":\"18361763168\",\"dl_idcard\":\"320324198611190324\",\"dl_idcardpic\":\"\",\"dl_idcardpic2\":\"\",\"dl_tbdian\":\"\",\"dl_tbzhanggui\":\"\",\"dl_addtime\":1537685552,\"dl_status\":0,\"dl_level\":\"3\",\"dl_type\":6,\"dl_sttype\":0,\"dl_belong\":\"69\",\"dl_referee\":69,\"dl_remark\":\"\",\"dl_address\":\"\\u6c5f\\u82cf\\u7701\\u5f90\\u5dde\\u5e02\\u7762\\u5b81\\u53bf\\u5929\\u666f\\u540d\\u57ce\\u5317\\u95e8\",\"dl_sheng\":\"32\",\"dl_shi\":\"3203\",\"dl_qu\":\"320324\",\"dl_qustr\":\"\\u6c5f\\u82cf\\u7701\\u5f90\\u5dde\\u5e02\\u7762\\u5b81\\u53bf\",\"dl_openid\":\"\",\"dl_weixin\":\"yanjuxyz\",\"dl_wxnickname\":\"\",\"dl_wxsex\":0,\"dl_wxprovince\":\"\",\"dl_wxcity\":\"\",\"dl_wxcountry\":\"\",\"dl_wxheadimg\":\"\",\"dl_brand\":\"\",\"dl_brandlevel\":\"\"}', '2');
INSERT INTO `fw_log` VALUES ('2191', '85', 'yanjuxyz', '3321', '经销商账号登录', '1537685729', '180.123.220.102', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2192', '77', 'T13736877828', '3321', '经销商账号登录', '1537768043', '112.11.59.14', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2193', '82', 'Zyy575757', '3321', '经销商账号登录', '1537840559', '58.63.138.8', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2194', '82', 'Zyy575757', '3321', '经销商账号登录', '1537840566', '113.109.122.166', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2195', '82', 'Zyy575757', '3321', '经销商账号登录', '1537840653', '113.109.122.166', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2196', '1191', 'yunmei', '3321', '企业登录', '1537843428', '114.234.210.25', '/mp/login/logining', '', '1');
INSERT INTO `fw_log` VALUES ('2197', '1191', 'yunmei', '3321', '企业登录', '1537843837', '113.109.122.166', '/mp/login/logining', '', '1');
INSERT INTO `fw_log` VALUES ('2198', '1191', 'yunmei', '3321', '企业登录', '1537844473', '113.109.122.166', '/mp/login/logining', '', '1');
INSERT INTO `fw_log` VALUES ('2199', '79', '15985812447', '3321', '经销商账号登录', '1537857887', '223.104.6.5', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2200', '86', 'xuqian2386', '3321', '代理商注册', '1537858072', '140.243.241.175', '/baiman/dealer/apply', '{\"dl_username\":\"xuqian2386\",\"dl_pwd\":\"3ca70b8c076f133f769fa1d1cab87ee3\",\"dl_number\":\"\",\"dl_unitcode\":\"3321\",\"dl_name\":\"\\u8bb8\\u5029\",\"dl_contact\":\"\\u8bb8\\u5029\",\"dl_tel\":\"13860139976\",\"dl_idcard\":\"350203197912061028\",\"dl_idcardpic\":\"\",\"dl_idcardpic2\":\"\",\"dl_tbdian\":\"\",\"dl_tbzhanggui\":\"\",\"dl_addtime\":1537858072,\"dl_status\":0,\"dl_level\":\"3\",\"dl_type\":6,\"dl_sttype\":0,\"dl_belong\":\"79\",\"dl_referee\":79,\"dl_remark\":\"\",\"dl_address\":\"\\u798f\\u5efa\\u7701\\u53a6\\u95e8\\u5e02\\u601d\\u660e\\u533a\\u4e07\\u5bff\\u8def22\\u53f7301\",\"dl_sheng\":\"35\",\"dl_shi\":\"3502\",\"dl_qu\":\"350203\",\"dl_qustr\":\"\\u798f\\u5efa\\u7701\\u53a6\\u95e8\\u5e02\\u601d\\u660e\\u533a\",\"dl_openid\":\"\",\"dl_weixin\":\"xuqian2386\",\"dl_wxnickname\":\"\",\"dl_wxsex\":0,\"dl_wxprovince\":\"\",\"dl_wxcity\":\"\",\"dl_wxcountry\":\"\",\"dl_wxheadimg\":\"\",\"dl_brand\":\"\",\"dl_brandlevel\":\"\"}', '2');
INSERT INTO `fw_log` VALUES ('2201', '79', '15985812447', '3321', '经销商账号登录', '1537926899', '223.104.6.5', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2202', '82', 'Zyy575757', '3321', '经销商账号登录', '1537944065', '113.109.120.116', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2203', '82', 'Zyy575757', '3321', '经销商账号登录', '1537944131', '113.109.120.116', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2204', '83', '15980787369', '3321', '经销商账号登录', '1537960298', '120.33.62.2', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2205', '78', 'han864411327', '3321', '经销商账号登录', '1539123384', '114.238.83.219', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2206', '66', '654081', '3321', '经销商账号登录', '1539676844', '180.123.223.162', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2207', '8', 'yunmei:chuku', '3321', '企业APP子用户登录', '1539920178', '180.124.222.2', '/zxapi/login/index', '{\"su_id\":\"8\",\"su_unitcode\":\"3321\",\"su_username\":\"chuku\",\"su_pwd\":\"0e92ed5bef4b2458da02cf12ef3ea68e\",\"su_openid\":null,\"su_wxnickname\":null,\"su_wxsex\":\"0\",\"su_wxprovince\":null,\"su_wxcity\":null,\"su_wxcountry\":null,\"su_wxheadimg\":null,\"su_weixin\":null,\"su_name\":\"\\u51fa\\u5e93\",\"su_logintime\":\"1537328906\",\"su_errlogintime\":\"1537328906\",\"su_errtimes\":\"0\",\"su_remark\":null,\"su_status\":\"1\",\"su_belong\":\"0\",\"su_purview\":\"\"}', '1');
INSERT INTO `fw_log` VALUES ('2208', '8', 'yunmei:chuku', '3321', '出货导入', '1539920231', '180.124.222.2', '/zxapi/order/odshipscanres_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201810161600533437\",\"ship_deliver\":0,\"ship_dealer\":\"66\",\"ship_pro\":\"16\",\"ship_odid\":86,\"ship_odblid\":86,\"ship_oddtid\":97,\"ship_whid\":7,\"ship_proqty\":\"20\",\"ship_barcode\":\"10000125\",\"ship_date\":1539920231,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"8\",\"ship_czuser\":\"yunmei:chuku\"}', '1');
INSERT INTO `fw_log` VALUES ('2209', '8', 'yunmei:chuku', '3321', '出货导入', '1539920231', '180.124.222.2', '/zxapi/order/odshipscanres_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201810161600533437\",\"ship_deliver\":0,\"ship_dealer\":\"66\",\"ship_pro\":\"16\",\"ship_odid\":86,\"ship_odblid\":86,\"ship_oddtid\":97,\"ship_whid\":7,\"ship_proqty\":\"20\",\"ship_barcode\":\"10000122\",\"ship_date\":1539920231,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"8\",\"ship_czuser\":\"yunmei:chuku\"}', '1');
INSERT INTO `fw_log` VALUES ('2210', '1191', 'yunmei', '3321', '企业登录', '1540018694', '180.124.222.49', '/mp/login/logining', '', '1');
INSERT INTO `fw_log` VALUES ('2211', '69', '15365423666', '3321', '经销商账号登录', '1540018792', '49.90.21.36', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2212', '66', '654081', '3321', '经销商账号登录', '1540018895', '180.124.222.49', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2213', '8', 'yunmei:chuku', '3321', '企业APP子用户登录', '1540018948', '180.124.222.49', '/zxapi/login/index', '{\"su_id\":\"8\",\"su_unitcode\":\"3321\",\"su_username\":\"chuku\",\"su_pwd\":\"0e92ed5bef4b2458da02cf12ef3ea68e\",\"su_openid\":null,\"su_wxnickname\":null,\"su_wxsex\":\"0\",\"su_wxprovince\":null,\"su_wxcity\":null,\"su_wxcountry\":null,\"su_wxheadimg\":null,\"su_weixin\":null,\"su_name\":\"\\u51fa\\u5e93\",\"su_logintime\":\"1539920178\",\"su_errlogintime\":\"1539920178\",\"su_errtimes\":\"0\",\"su_remark\":null,\"su_status\":\"1\",\"su_belong\":\"0\",\"su_purview\":\"\"}', '1');
INSERT INTO `fw_log` VALUES ('2214', '1191', 'yunmei', '3321', '修改产品', '1540019047', '180.124.222.49', '/mp/product/edit_save', '{\"pro_id\":17,\"pro_name\":\"\\u5141\\u7f8e \\u679c\\u852c\\u9175\\u7d20\\u7c89\",\"pro_number\":\"\\u9175\\u7d20\",\"pro_typeid\":20,\"pro_jftype\":1,\"pro_jifen\":0,\"pro_jfmax\":0,\"pro_dljf\":0,\"pro_desc\":\"\\u9175\\u7d201\\u7bb1 10\\u888b*36\\u76d2\",\"pro_link\":\"\",\"pro_barcode\":\"\",\"pro_remark\":\"\\u9175\\u7d20\\u7c891\\u7bb1 10\\u888b*36\\u76d2\",\"pro_price\":\"7600.00\",\"pro_stock\":0,\"pro_units\":\"\\u7bb1\",\"pro_dbiao\":1,\"pro_zbiao\":0,\"pro_xbiao\":36}', '1');
INSERT INTO `fw_log` VALUES ('2215', '1191', 'yunmei', '3321', '删除订单', '1540019075', '180.124.222.49', '/mp/orders/deleteorder/od_id/88', '{\"od_id\":\"88\",\"od_unitcode\":\"3321\",\"od_orderid\":\"201810201501591518\",\"od_total\":\"14256.00\",\"od_addtime\":\"1540018919\",\"od_oddlid\":\"66\",\"od_contact\":\"\\u77f3\\u7476\\u7476\",\"od_addressid\":\"51\",\"od_sheng\":\"32\",\"od_shi\":\"3203\",\"od_qu\":\"320324\",\"od_jie\":\"0\",\"od_address\":\"\\u6c5f\\u82cf\\u7701\\u5f90\\u5dde\\u5e02\\u7762\\u5b81\\u53bf\\u661f\\u6cb3\\u6e7e\",\"od_tel\":\"13564690205\",\"od_express\":\"0\",\"od_expressnum\":\"\",\"od_expressdate\":\"0\",\"od_remark\":null,\"od_state\":\"9\",\"od_stead\":\"0\",\"od_blid\":\"0\",\"od_paymode\":\"0\"}', '1');
INSERT INTO `fw_log` VALUES ('2216', '8', 'yunmei:chuku', '3321', '出货导入', '1540019376', '180.124.222.49', '/zxapi/order/odshipscanres_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201810201504597994\",\"ship_deliver\":0,\"ship_dealer\":\"66\",\"ship_pro\":\"17\",\"ship_odid\":89,\"ship_odblid\":89,\"ship_oddtid\":100,\"ship_whid\":7,\"ship_proqty\":\"36\",\"ship_barcode\":\"10002562\",\"ship_date\":1540019376,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"8\",\"ship_czuser\":\"yunmei:chuku\"}', '1');
INSERT INTO `fw_log` VALUES ('2217', '8', 'yunmei:chuku', '3321', '出货导入', '1540019376', '180.124.222.49', '/zxapi/order/odshipscanres_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201810201504597994\",\"ship_deliver\":0,\"ship_dealer\":\"66\",\"ship_pro\":\"17\",\"ship_odid\":89,\"ship_odblid\":89,\"ship_oddtid\":100,\"ship_whid\":7,\"ship_proqty\":\"36\",\"ship_barcode\":\"10002550\",\"ship_date\":1540019376,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"8\",\"ship_czuser\":\"yunmei:chuku\"}', '1');
INSERT INTO `fw_log` VALUES ('2218', '8', 'yunmei:chuku', '3321', '出货导入', '1540019376', '180.124.222.49', '/zxapi/order/odshipscanres_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201810201504597994\",\"ship_deliver\":0,\"ship_dealer\":\"66\",\"ship_pro\":\"17\",\"ship_odid\":89,\"ship_odblid\":89,\"ship_oddtid\":100,\"ship_whid\":7,\"ship_proqty\":\"36\",\"ship_barcode\":\"10002591\",\"ship_date\":1540019376,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"8\",\"ship_czuser\":\"yunmei:chuku\"}', '1');
INSERT INTO `fw_log` VALUES ('2219', '8', 'yunmei:chuku', '3321', '出货导入', '1540019376', '180.124.222.49', '/zxapi/order/odshipscanres_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201810201504597994\",\"ship_deliver\":0,\"ship_dealer\":\"66\",\"ship_pro\":\"17\",\"ship_odid\":89,\"ship_odblid\":89,\"ship_oddtid\":100,\"ship_whid\":7,\"ship_proqty\":\"36\",\"ship_barcode\":\"10002641\",\"ship_date\":1540019376,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"8\",\"ship_czuser\":\"yunmei:chuku\"}', '1');
INSERT INTO `fw_log` VALUES ('2220', '8', 'yunmei:chuku', '3321', '出货导入', '1540019376', '180.124.222.49', '/zxapi/order/odshipscanres_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201810201504597994\",\"ship_deliver\":0,\"ship_dealer\":\"66\",\"ship_pro\":\"17\",\"ship_odid\":89,\"ship_odblid\":89,\"ship_oddtid\":100,\"ship_whid\":7,\"ship_proqty\":\"36\",\"ship_barcode\":\"10002547\",\"ship_date\":1540019376,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"8\",\"ship_czuser\":\"yunmei:chuku\"}', '1');
INSERT INTO `fw_log` VALUES ('2221', '8', 'yunmei:chuku', '3321', '出货导入', '1540019376', '180.124.222.49', '/zxapi/order/odshipscanres_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201810201504597994\",\"ship_deliver\":0,\"ship_dealer\":\"66\",\"ship_pro\":\"17\",\"ship_odid\":89,\"ship_odblid\":89,\"ship_oddtid\":100,\"ship_whid\":7,\"ship_proqty\":\"36\",\"ship_barcode\":\"10002558\",\"ship_date\":1540019376,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"8\",\"ship_czuser\":\"yunmei:chuku\"}', '1');
INSERT INTO `fw_log` VALUES ('2222', '8', 'yunmei:chuku', '3321', '出货导入', '1540019376', '180.124.222.49', '/zxapi/order/odshipscanres_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201810201504597994\",\"ship_deliver\":0,\"ship_dealer\":\"66\",\"ship_pro\":\"17\",\"ship_odid\":89,\"ship_odblid\":89,\"ship_oddtid\":100,\"ship_whid\":7,\"ship_proqty\":\"36\",\"ship_barcode\":\"10002625\",\"ship_date\":1540019376,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"8\",\"ship_czuser\":\"yunmei:chuku\"}', '1');
INSERT INTO `fw_log` VALUES ('2223', '8', 'yunmei:chuku', '3321', '出货导入', '1540019376', '180.124.222.49', '/zxapi/order/odshipscanres_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201810201504597994\",\"ship_deliver\":0,\"ship_dealer\":\"66\",\"ship_pro\":\"17\",\"ship_odid\":89,\"ship_odblid\":89,\"ship_oddtid\":100,\"ship_whid\":7,\"ship_proqty\":\"36\",\"ship_barcode\":\"10002595\",\"ship_date\":1540019376,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"8\",\"ship_czuser\":\"yunmei:chuku\"}', '1');
INSERT INTO `fw_log` VALUES ('2224', '8', 'yunmei:chuku', '3321', '出货导入', '1540019376', '180.124.222.49', '/zxapi/order/odshipscanres_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201810201504597994\",\"ship_deliver\":0,\"ship_dealer\":\"66\",\"ship_pro\":\"17\",\"ship_odid\":89,\"ship_odblid\":89,\"ship_oddtid\":100,\"ship_whid\":7,\"ship_proqty\":\"36\",\"ship_barcode\":\"10002535\",\"ship_date\":1540019376,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"8\",\"ship_czuser\":\"yunmei:chuku\"}', '1');
INSERT INTO `fw_log` VALUES ('2225', '8', 'yunmei:chuku', '3321', '出货导入', '1540019376', '180.124.222.49', '/zxapi/order/odshipscanres_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201810201504597994\",\"ship_deliver\":0,\"ship_dealer\":\"66\",\"ship_pro\":\"17\",\"ship_odid\":89,\"ship_odblid\":89,\"ship_oddtid\":100,\"ship_whid\":7,\"ship_proqty\":\"36\",\"ship_barcode\":\"10002616\",\"ship_date\":1540019376,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"8\",\"ship_czuser\":\"yunmei:chuku\"}', '1');
INSERT INTO `fw_log` VALUES ('2226', '1191', 'yunmei', '3321', '删除订单', '1540019404', '180.124.222.49', '/mp/orders/deleteorder/od_id/87', '{\"od_id\":\"87\",\"od_unitcode\":\"3321\",\"od_orderid\":\"201810201500055177\",\"od_total\":\"3888.00\",\"od_addtime\":\"1540018805\",\"od_oddlid\":\"69\",\"od_contact\":\"\\u82f1\\u5c11\\u67cf\",\"od_addressid\":\"54\",\"od_sheng\":\"32\",\"od_shi\":\"3203\",\"od_qu\":\"320324\",\"od_jie\":\"0\",\"od_address\":\"\\u6c5f\\u82cf\\u7701\\u5f90\\u5dde\\u5e02\\u7762\\u5b81\\u53bf\",\"od_tel\":\"15365423666\",\"od_express\":\"0\",\"od_expressnum\":\"\",\"od_expressdate\":\"0\",\"od_remark\":null,\"od_state\":\"9\",\"od_stead\":\"0\",\"od_blid\":\"0\",\"od_paymode\":\"0\"}', '1');
INSERT INTO `fw_log` VALUES ('2227', '69', '15365423666', '3321', '经销商账号登录', '1540019452', '49.90.21.36', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2228', '8', 'yunmei:chuku', '3321', '出货导入', '1540020633', '180.124.222.49', '/zxapi/order/odshipscanres_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201810201511006482\",\"ship_deliver\":0,\"ship_dealer\":\"69\",\"ship_pro\":\"17\",\"ship_odid\":90,\"ship_odblid\":90,\"ship_oddtid\":101,\"ship_whid\":7,\"ship_proqty\":\"36\",\"ship_barcode\":\"10002638\",\"ship_date\":1540020633,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"8\",\"ship_czuser\":\"yunmei:chuku\"}', '1');
INSERT INTO `fw_log` VALUES ('2229', '8', 'yunmei:chuku', '3321', '出货导入', '1540020633', '180.124.222.49', '/zxapi/order/odshipscanres_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201810201511006482\",\"ship_deliver\":0,\"ship_dealer\":\"69\",\"ship_pro\":\"17\",\"ship_odid\":90,\"ship_odblid\":90,\"ship_oddtid\":101,\"ship_whid\":7,\"ship_proqty\":\"36\",\"ship_barcode\":\"10002586\",\"ship_date\":1540020633,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"8\",\"ship_czuser\":\"yunmei:chuku\"}', '1');
INSERT INTO `fw_log` VALUES ('2230', '8', 'yunmei:chuku', '3321', '出货导入', '1540020674', '180.124.222.49', '/zxapi/order/odshipscanres_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201810201511006482\",\"ship_deliver\":0,\"ship_dealer\":\"69\",\"ship_pro\":\"17\",\"ship_odid\":90,\"ship_odblid\":90,\"ship_oddtid\":101,\"ship_whid\":7,\"ship_proqty\":\"36\",\"ship_barcode\":\"10002529\",\"ship_date\":1540020674,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"8\",\"ship_czuser\":\"yunmei:chuku\"}', '1');
INSERT INTO `fw_log` VALUES ('2231', '73', 'tzwl588', '3321', '经销商账号登录', '1540094062', '122.194.88.77', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2232', '87', '13991499199', '3321', '代理商注册', '1540094160', '113.138.11.25', '/baiman/dealer/apply', '{\"dl_username\":\"13991499199\",\"dl_pwd\":\"4e2bc5b07fa0f96dc0f4c2647fd6d41b\",\"dl_number\":\"\",\"dl_unitcode\":\"3321\",\"dl_name\":\"\\u5f20\\u6653\\u96ea\",\"dl_contact\":\"\\u5f20\\u6653\\u96ea\",\"dl_tel\":\"13991499199\",\"dl_idcard\":\"612523198212160086\",\"dl_idcardpic\":\"\",\"dl_idcardpic2\":\"\",\"dl_tbdian\":\"\",\"dl_tbzhanggui\":\"\",\"dl_addtime\":1540094160,\"dl_status\":0,\"dl_level\":\"3\",\"dl_type\":6,\"dl_sttype\":0,\"dl_belong\":\"73\",\"dl_referee\":73,\"dl_remark\":\"\",\"dl_address\":\"\\u9655\\u897f\\u7701\\u5546\\u6d1b\\u5e02\\u4e39\\u51e4\\u53bf\\u8001\\u623f\\u5b50\\u79c1\\u623f\\u83dc\",\"dl_sheng\":\"61\",\"dl_shi\":\"6110\",\"dl_qu\":\"611022\",\"dl_qustr\":\"\\u9655\\u897f\\u7701\\u5546\\u6d1b\\u5e02\\u4e39\\u51e4\\u53bf\",\"dl_openid\":\"\",\"dl_weixin\":\"13991499199\",\"dl_wxnickname\":\"\",\"dl_wxsex\":0,\"dl_wxprovince\":\"\",\"dl_wxcity\":\"\",\"dl_wxcountry\":\"\",\"dl_wxheadimg\":\"\",\"dl_brand\":\"\",\"dl_brandlevel\":\"\"}', '2');
INSERT INTO `fw_log` VALUES ('2233', '73', 'tzwl588', '3321', '经销商账号登录', '1540217936', '122.194.88.77', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2234', '8', 'yunmei:chuku', '3321', '企业APP子用户登录', '1540267625', '180.123.221.98', '/zxapi/login/index', '{\"su_id\":\"8\",\"su_unitcode\":\"3321\",\"su_username\":\"chuku\",\"su_pwd\":\"0e92ed5bef4b2458da02cf12ef3ea68e\",\"su_openid\":null,\"su_wxnickname\":null,\"su_wxsex\":\"0\",\"su_wxprovince\":null,\"su_wxcity\":null,\"su_wxcountry\":null,\"su_wxheadimg\":null,\"su_weixin\":null,\"su_name\":\"\\u51fa\\u5e93\",\"su_logintime\":\"1540018948\",\"su_errlogintime\":\"1540018948\",\"su_errtimes\":\"0\",\"su_remark\":null,\"su_status\":\"1\",\"su_belong\":\"0\",\"su_purview\":\"\"}', '1');
INSERT INTO `fw_log` VALUES ('2235', '8', 'yunmei:chuku', '3321', '出货导入', '1540267654', '180.123.221.98', '/zxapi/order/odshipscanres_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201810201504597994\",\"ship_deliver\":0,\"ship_dealer\":\"66\",\"ship_pro\":\"17\",\"ship_odid\":89,\"ship_odblid\":89,\"ship_oddtid\":100,\"ship_whid\":7,\"ship_proqty\":\"36\",\"ship_barcode\":\"10002646\",\"ship_date\":1540267654,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"8\",\"ship_czuser\":\"yunmei:chuku\"}', '1');
INSERT INTO `fw_log` VALUES ('2236', '69', '15365423666', '3321', '经销商账号登录', '1540290752', '49.90.55.6', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2237', '8', 'yunmei:chuku', '3321', '企业APP子用户登录', '1540353824', '180.123.221.98', '/zxapi/login/index', '{\"su_id\":\"8\",\"su_unitcode\":\"3321\",\"su_username\":\"chuku\",\"su_pwd\":\"0e92ed5bef4b2458da02cf12ef3ea68e\",\"su_openid\":null,\"su_wxnickname\":null,\"su_wxsex\":\"0\",\"su_wxprovince\":null,\"su_wxcity\":null,\"su_wxcountry\":null,\"su_wxheadimg\":null,\"su_weixin\":null,\"su_name\":\"\\u51fa\\u5e93\",\"su_logintime\":\"1540267625\",\"su_errlogintime\":\"1540267625\",\"su_errtimes\":\"0\",\"su_remark\":null,\"su_status\":\"1\",\"su_belong\":\"0\",\"su_purview\":\"\"}', '1');
INSERT INTO `fw_log` VALUES ('2238', '8', 'yunmei:chuku', '3321', '出货导入', '1540353902', '180.123.221.98', '/zxapi/order/odshipscanres_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201810231832399388\",\"ship_deliver\":0,\"ship_dealer\":\"69\",\"ship_pro\":\"17\",\"ship_odid\":91,\"ship_odblid\":91,\"ship_oddtid\":102,\"ship_whid\":7,\"ship_proqty\":\"36\",\"ship_barcode\":\"10002530\",\"ship_date\":1540353902,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"8\",\"ship_czuser\":\"yunmei:chuku\"}', '1');
INSERT INTO `fw_log` VALUES ('2239', '8', 'yunmei:chuku', '3321', '出货导入', '1540353902', '180.123.221.98', '/zxapi/order/odshipscanres_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201810231832399388\",\"ship_deliver\":0,\"ship_dealer\":\"69\",\"ship_pro\":\"17\",\"ship_odid\":91,\"ship_odblid\":91,\"ship_oddtid\":102,\"ship_whid\":7,\"ship_proqty\":\"36\",\"ship_barcode\":\"10002620\",\"ship_date\":1540353902,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"8\",\"ship_czuser\":\"yunmei:chuku\"}', '1');
INSERT INTO `fw_log` VALUES ('2240', '1191', 'yunmei', '3321', '企业登录', '1540451687', '180.123.222.191', '/mp/login/logining', '', '1');
INSERT INTO `fw_log` VALUES ('2241', '69', '15365423666', '3321', '经销商账号登录', '1541231947', '49.92.88.110', '/baiman/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2242', '1191', 'yunmei', '3321', '企业登录', '1541321270', '180.123.223.171', '/mp/login/logining', '', '1');
INSERT INTO `fw_log` VALUES ('2243', '8', 'yunmei:chuku', '3321', '企业APP子用户登录', '1541321857', '180.123.223.171', '/zxapi/login/index', '{\"su_id\":\"8\",\"su_unitcode\":\"3321\",\"su_username\":\"chuku\",\"su_pwd\":\"0e92ed5bef4b2458da02cf12ef3ea68e\",\"su_openid\":null,\"su_wxnickname\":null,\"su_wxsex\":\"0\",\"su_wxprovince\":null,\"su_wxcity\":null,\"su_wxcountry\":null,\"su_wxheadimg\":null,\"su_weixin\":null,\"su_name\":\"\\u51fa\\u5e93\",\"su_logintime\":\"1540353824\",\"su_errlogintime\":\"1541321846\",\"su_errtimes\":\"1\",\"su_remark\":null,\"su_status\":\"1\",\"su_belong\":\"0\",\"su_purview\":\"\"}', '1');
INSERT INTO `fw_log` VALUES ('2244', '89', 'test', '3321', '经销商账号登录', '1541496830', '0.0.0.0', '/angels/Angels/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2245', '1191', 'test', '3321', '企业登录', '1541496991', '0.0.0.0', '/angels/Mp/Login/logining', '', '1');
INSERT INTO `fw_log` VALUES ('2246', '1191', 'test', '3321', '修改产品', '1541498395', '0.0.0.0', '/angels/Mp/Product/edit_save', '{\"pro_id\":17,\"pro_name\":\"\\u5141\\u7f8e \\u679c\\u852c\\u9175\\u7d20\\u7c89\",\"pro_number\":\"\\u9175\\u7d20\",\"pro_typeid\":20,\"pro_jftype\":1,\"pro_jifen\":0,\"pro_jfmax\":0,\"pro_dljf\":0,\"pro_desc\":\"\\u9175\\u7d201\\u7bb1 10\\u888b*36\\u76d2\",\"pro_link\":\"\",\"pro_barcode\":\"\",\"pro_remark\":\"\\u9175\\u7d20\\u7c891\\u7bb1 10\\u888b*36\\u76d2\",\"pro_price\":\"7600.00\",\"pro_stock\":0,\"pro_units\":\"\\u7bb1\",\"pro_dbiao\":1,\"pro_zbiao\":0,\"pro_xbiao\":36,\"pro_pic\":\"3321\\/1541498395_8303.jpg\"}', '1');
INSERT INTO `fw_log` VALUES ('2247', '1191', 'test', '3321', '修改产品', '1541498404', '0.0.0.0', '/angels/Mp/Product/edit_save', '{\"pro_id\":16,\"pro_name\":\"\\u5141\\u7f8e \\u51cf\\u4e4b\\u5708\\u4ee3\\u9910\\u997c\\u5e72\",\"pro_number\":\"21\\u7247\",\"pro_typeid\":19,\"pro_jftype\":1,\"pro_jifen\":0,\"pro_jfmax\":0,\"pro_dljf\":0,\"pro_desc\":\"\\u4e00\\u7bb1\\uff1a21\\u7247*20\\u76d2\",\"pro_link\":\"\",\"pro_barcode\":\"\",\"pro_remark\":\"\\u4e00\\u7bb1\\uff1a21\\u7247*20\\u76d2\",\"pro_price\":\"7600.00\",\"pro_stock\":0,\"pro_units\":\"\\u7bb1\",\"pro_dbiao\":1,\"pro_zbiao\":0,\"pro_xbiao\":20,\"pro_pic\":\"3321\\/1541498404_6811.jpg\"}', '1');
INSERT INTO `fw_log` VALUES ('2248', '89', 'test', '3321', '经销商账号登录', '1541500610', '0.0.0.0', '/angels/Angels/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2249', '87', 'test1', '3321', '经销商账号登录', '1541501815', '0.0.0.0', '/angels/Angels/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2250', '89', 'test', '3321', '经销商账号登录', '1541503291', '0.0.0.0', '/angels/Angels/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2251', '69', '15365423666', '3321', '经销商账号登录', '1541504195', '0.0.0.0', '/angels/Angels/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2252', '77', 'T13736877828', '3321', '经销商账号登录', '1541504237', '0.0.0.0', '/angels/Angels/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2253', '89', 'test', '3321', '经销商账号登录', '1541504368', '0.0.0.0', '/angels/Angels/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2254', '77', 'T13736877828', '3321', '经销商账号登录', '1541504627', '0.0.0.0', '/angels/Angels/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2255', '69', '15365423666', '3321', '经销商账号登录', '1541504661', '0.0.0.0', '/angels/Angels/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2256', '66', '654081', '3321', '经销商账号登录', '1541504781', '0.0.0.0', '/angels/Angels/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2257', '74', '13395253609', '3321', '经销商账号登录', '1541505328', '0.0.0.0', '/angels/Angels/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2258', '66', '654081', '3321', '经销商账号登录', '1541505498', '0.0.0.0', '/angels/Angels/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2259', '0', '654081', '3321', '经销商账号登录', '1541506503', '0.0.0.0', '/angels/Angels/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2260', '66', '654081', '3321', '经销商账号登录', '1541507132', '0.0.0.0', '/angels/Angels/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2261', '1191', 'test', '3321', '企业登录', '1541553504', '0.0.0.0', '/angels/Mp/Login/logining', '', '1');
INSERT INTO `fw_log` VALUES ('2262', '66', '654081', '3321', '经销商账号登录', '1541553610', '0.0.0.0', '/angels/Angels/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2263', '66', '654081', '3321', '经销商账号登录', '1541556814', '0.0.0.0', '/angels/Angels/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2264', '66', '654081', '3321', '经销商账号登录', '1541557127', '0.0.0.0', '/angels/Angels/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2265', '89', 'test', '3321', '经销商账号登录', '1541562808', '0.0.0.0', '/angels/Angels/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2266', '73', 'tzwl588', '3321', '经销商账号登录', '1541562985', '0.0.0.0', '/angels/Angels/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2267', '66', '654081', '3321', '经销商账号登录', '1541563616', '0.0.0.0', '/angels/Angels/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2268', '1191', 'test', '3321', '出货扫描', '1541573781', '0.0.0.0', '/angels/Mp/Shipment/add_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"564346463656\",\"ship_deliver\":0,\"ship_dealer\":69,\"ship_pro\":16,\"ship_whid\":7,\"ship_proqty\":\"20\",\"ship_barcode\":\"10000002\",\"ship_date\":1542124800,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\\u4e1c\\u65b9\\u7ea2\",\"ship_cztype\":0,\"ship_czid\":\"1191\",\"ship_czuser\":\"test\"}', '1');
INSERT INTO `fw_log` VALUES ('2269', '66', '654081', '3321', '经销商账号登录', '1541574830', '0.0.0.0', '/angels/Angels/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2270', '66', '654081', '3321', '出货扫描', '1541578567', '0.0.0.0', '/angels/Angels/Dealer/shipadd_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"23453554\",\"ship_deliver\":\"66\",\"ship_dealer\":73,\"ship_pro\":16,\"ship_whid\":7,\"ship_proqty\":\"20\",\"ship_barcode\":\"10000004\",\"ship_date\":1514822400,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\\u975e\\u5178\\u8fc7\\u540e\\u7684\\u89c4\\u8303\\u5316\",\"ship_cztype\":2,\"ship_czid\":\"66\",\"ship_czuser\":\"654081\"}', '1');
INSERT INTO `fw_log` VALUES ('2271', '87', 'test1', '3321', '经销商账号登录', '1541578652', '0.0.0.0', '/angels/Angels/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2272', '73', 'tzwl588', '3321', '经销商账号登录', '1541578746', '0.0.0.0', '/angels/Angels/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2273', '73', 'tzwl588', '3321', '出货扫描', '1541578827', '0.0.0.0', '/angels/Angels/Dealer/shipadd_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"2345255643\",\"ship_deliver\":\"73\",\"ship_dealer\":87,\"ship_pro\":16,\"ship_whid\":7,\"ship_proqty\":\"20\",\"ship_barcode\":\"10000004\",\"ship_date\":1580745600,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\\u53d1\\u4e2a\\u56de\\u590d\",\"ship_cztype\":2,\"ship_czid\":\"73\",\"ship_czuser\":\"tzwl588\"}', '1');
INSERT INTO `fw_log` VALUES ('2274', '73', 'tzwl588', '3321', '出货扫描', '1541579074', '0.0.0.0', '/angels/Angels/Dealer/shipadd_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"2345\",\"ship_deliver\":\"73\",\"ship_dealer\":87,\"ship_pro\":16,\"ship_whid\":7,\"ship_proqty\":\"20\",\"ship_barcode\":\"10000005\",\"ship_date\":1514736000,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\\u98ce\\u683c\\u5316\",\"ship_cztype\":2,\"ship_czid\":\"73\",\"ship_czuser\":\"tzwl588\"}', '1');
INSERT INTO `fw_log` VALUES ('2275', '1191', 'test', '3321', '出货扫描', '1541579777', '0.0.0.0', '/angels/Mp/Shipment/add_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"3454365666456\",\"ship_deliver\":0,\"ship_dealer\":66,\"ship_pro\":16,\"ship_whid\":7,\"ship_proqty\":\"20\",\"ship_barcode\":\"10000006\",\"ship_date\":1541520000,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"1191\",\"ship_czuser\":\"test\"}', '1');
INSERT INTO `fw_log` VALUES ('2276', '1191', 'test', '3321', '出货扫描', '1541579931', '0.0.0.0', '/angels/Mp/Shipment/add_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"564346463656\",\"ship_deliver\":0,\"ship_dealer\":66,\"ship_pro\":16,\"ship_whid\":7,\"ship_proqty\":\"20\",\"ship_barcode\":\"10002420\",\"ship_date\":1541520000,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"1191\",\"ship_czuser\":\"test\"}', '1');
INSERT INTO `fw_log` VALUES ('2277', '1191', 'test', '3321', '删除出货记录', '1541579942', '0.0.0.0', '/angels/Mp/Shipment/delete/ship_id/249', '{\"ship_id\":\"249\",\"ship_unitcode\":\"3321\",\"ship_number\":\"564346463656\",\"ship_deliver\":\"0\",\"ship_dealer\":\"66\",\"ship_pro\":\"16\",\"ship_odid\":\"0\",\"ship_odblid\":\"0\",\"ship_whid\":\"7\",\"ship_proqty\":\"20\",\"ship_barcode\":\"10002420\",\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_date\":\"1541520000\",\"ship_remark\":\"\",\"ship_cztype\":\"0\",\"ship_czid\":\"1191\",\"ship_czuser\":\"test\",\"ship_prodate\":null,\"ship_batchnum\":null,\"ship_status\":\"0\"}', '1');
INSERT INTO `fw_log` VALUES ('2278', '1191', 'test', '3321', '出货扫描', '1541579992', '0.0.0.0', '/angels/Mp/Shipment/add_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"523445\",\"ship_deliver\":0,\"ship_dealer\":66,\"ship_pro\":16,\"ship_whid\":7,\"ship_proqty\":\"20\",\"ship_barcode\":\"10002420\",\"ship_date\":1541520000,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"1191\",\"ship_czuser\":\"test\"}', '1');
INSERT INTO `fw_log` VALUES ('2279', '1191', 'test', '3321', '出货扫描', '1541580101', '0.0.0.0', '/angels/Mp/Shipment/add_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201810301543135387\",\"ship_deliver\":0,\"ship_dealer\":66,\"ship_pro\":16,\"ship_whid\":7,\"ship_proqty\":\"36\",\"ship_barcode\":\"10002521\",\"ship_date\":1541606400,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"1191\",\"ship_czuser\":\"test\"}', '1');
INSERT INTO `fw_log` VALUES ('2280', '1191', 'test', '3321', '出货扫描', '1541580387', '0.0.0.0', '/angels/Mp/Shipment/add_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201810301543135387\",\"ship_deliver\":0,\"ship_dealer\":66,\"ship_pro\":16,\"ship_whid\":7,\"ship_proqty\":1,\"ship_barcode\":\"1000242101\",\"ship_date\":1541520000,\"ship_ucode\":\"10002421\",\"ship_tcode\":\"10002421\",\"ship_remark\":\"\\u6cd5\\u56fd\\u7ea2\\u9152\",\"ship_cztype\":0,\"ship_czid\":\"1191\",\"ship_czuser\":\"test\"}', '1');
INSERT INTO `fw_log` VALUES ('2281', '73', 'tzwl588', '3321', '出货扫描', '1541583458', '0.0.0.0', '/angels/Angels/Dealer/shipadd_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"53454354\",\"ship_deliver\":\"73\",\"ship_dealer\":87,\"ship_pro\":16,\"ship_whid\":7,\"ship_proqty\":\"20\",\"ship_barcode\":\"10002422\",\"ship_date\":1517500800,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\\u963f\\u51e1\\u8fbe\\u53e4\\u5178\\u98ce\\u683c\",\"ship_cztype\":2,\"ship_czid\":\"73\",\"ship_czuser\":\"tzwl588\"}', '1');
INSERT INTO `fw_log` VALUES ('2282', '73', 'tzwl588', '3321', '出货扫描', '1541584223', '0.0.0.0', '/angels/Angels/Dealer/shipadd_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"23453453\",\"ship_deliver\":\"73\",\"ship_dealer\":87,\"ship_pro\":16,\"ship_whid\":7,\"ship_proqty\":\"36\",\"ship_barcode\":\"10002522\",\"ship_date\":1520092800,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"fghgf\",\"ship_cztype\":2,\"ship_czid\":\"73\",\"ship_czuser\":\"tzwl588\"}', '1');
INSERT INTO `fw_log` VALUES ('2283', '73', 'tzwl588', '3321', '出货扫描', '1541584223', '0.0.0.0', '/angels/Angels/Dealer/shipadd_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"23453453\",\"ship_deliver\":\"73\",\"ship_dealer\":87,\"ship_pro\":16,\"ship_whid\":7,\"ship_proqty\":\"36\",\"ship_barcode\":\"10002523\",\"ship_date\":1520092800,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"fghgf\",\"ship_cztype\":2,\"ship_czid\":\"73\",\"ship_czuser\":\"tzwl588\"}', '1');
INSERT INTO `fw_log` VALUES ('2284', '73', 'tzwl588', '3321', '出货扫描', '1541584505', '0.0.0.0', '/angels/Angels/Dealer/shipadd_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"35345245\",\"ship_deliver\":\"73\",\"ship_dealer\":87,\"ship_pro\":17,\"ship_whid\":7,\"ship_proqty\":\"36\",\"ship_barcode\":\"10002524\",\"ship_date\":1551542400,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"ewrt\",\"ship_cztype\":2,\"ship_czid\":\"73\",\"ship_czuser\":\"tzwl588\"}', '1');
INSERT INTO `fw_log` VALUES ('2285', '73', 'tzwl588', '3321', '出货扫描', '1541584505', '0.0.0.0', '/angels/Angels/Dealer/shipadd_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"35345245\",\"ship_deliver\":\"73\",\"ship_dealer\":87,\"ship_pro\":17,\"ship_whid\":7,\"ship_proqty\":\"36\",\"ship_barcode\":\"10002525\",\"ship_date\":1551542400,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"ewrt\",\"ship_cztype\":2,\"ship_czid\":\"73\",\"ship_czuser\":\"tzwl588\"}', '1');
INSERT INTO `fw_log` VALUES ('2286', '73', 'tzwl588', '3321', '出货扫描', '1541584561', '0.0.0.0', '/angels/Angels/Dealer/shipadd_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"345343\",\"ship_deliver\":\"73\",\"ship_dealer\":87,\"ship_pro\":16,\"ship_whid\":7,\"ship_proqty\":\"36\",\"ship_barcode\":\"10002526\",\"ship_date\":1549123200,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"ert\",\"ship_cztype\":2,\"ship_czid\":\"73\",\"ship_czuser\":\"tzwl588\"}', '1');
INSERT INTO `fw_log` VALUES ('2287', '73', 'tzwl588', '3321', '出货扫描', '1541584584', '0.0.0.0', '/angels/Angels/Dealer/shipadd_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"345343\",\"ship_deliver\":\"73\",\"ship_dealer\":87,\"ship_pro\":16,\"ship_whid\":7,\"ship_proqty\":\"36\",\"ship_barcode\":\"10002527\",\"ship_date\":1549123200,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"ert\",\"ship_cztype\":2,\"ship_czid\":\"73\",\"ship_czuser\":\"tzwl588\"}', '1');
INSERT INTO `fw_log` VALUES ('2288', '73', 'tzwl588', '3321', '出货扫描', '1541585239', '0.0.0.0', '/angels/Angels/Dealer/shipadd_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"345254545\",\"ship_deliver\":\"73\",\"ship_dealer\":87,\"ship_pro\":17,\"ship_whid\":7,\"ship_proqty\":\"36\",\"ship_barcode\":\"10002528\",\"ship_date\":1514908800,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":2,\"ship_czid\":\"73\",\"ship_czuser\":\"tzwl588\"}', '1');
INSERT INTO `fw_log` VALUES ('2289', '73', 'tzwl588', '3321', '出货扫描', '1541585267', '0.0.0.0', '/angels/Angels/Dealer/shipadd_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"34524\",\"ship_deliver\":\"73\",\"ship_dealer\":87,\"ship_pro\":16,\"ship_whid\":7,\"ship_proqty\":\"36\",\"ship_barcode\":\"10002529\",\"ship_date\":1517587200,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":2,\"ship_czid\":\"73\",\"ship_czuser\":\"tzwl588\"}', '1');
INSERT INTO `fw_log` VALUES ('2290', '73', 'tzwl588', '3321', '出货扫描', '1541585341', '0.0.0.0', '/angels/Angels/Dealer/shipadd_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"2342\",\"ship_deliver\":\"73\",\"ship_dealer\":87,\"ship_pro\":16,\"ship_whid\":7,\"ship_proqty\":\"36\",\"ship_barcode\":\"10002530\",\"ship_date\":1517500800,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":2,\"ship_czid\":\"73\",\"ship_czuser\":\"tzwl588\"}', '1');
INSERT INTO `fw_log` VALUES ('2291', '73', 'tzwl588', '3321', '出货扫描', '1541585341', '0.0.0.0', '/angels/Angels/Dealer/shipadd_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"2342\",\"ship_deliver\":\"73\",\"ship_dealer\":87,\"ship_pro\":16,\"ship_whid\":7,\"ship_proqty\":\"36\",\"ship_barcode\":\"10002531\",\"ship_date\":1517500800,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":2,\"ship_czid\":\"73\",\"ship_czuser\":\"tzwl588\"}', '1');
INSERT INTO `fw_log` VALUES ('2292', '73', 'tzwl588', '3321', '出货扫描', '1541585418', '0.0.0.0', '/angels/Angels/Dealer/shipadd_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"345345\",\"ship_deliver\":\"73\",\"ship_dealer\":87,\"ship_pro\":16,\"ship_whid\":7,\"ship_proqty\":\"36\",\"ship_barcode\":\"10002532\",\"ship_date\":1517673600,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":2,\"ship_czid\":\"73\",\"ship_czuser\":\"tzwl588\"}', '1');
INSERT INTO `fw_log` VALUES ('2293', '73', 'tzwl588', '3321', '出货扫描', '1541585418', '0.0.0.0', '/angels/Angels/Dealer/shipadd_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"345345\",\"ship_deliver\":\"73\",\"ship_dealer\":87,\"ship_pro\":16,\"ship_whid\":7,\"ship_proqty\":1,\"ship_barcode\":\"1000253301\",\"ship_date\":1517673600,\"ship_ucode\":\"10002533\",\"ship_tcode\":\"10002533\",\"ship_remark\":\"\",\"ship_cztype\":2,\"ship_czid\":\"73\",\"ship_czuser\":\"tzwl588\"}', '1');
INSERT INTO `fw_log` VALUES ('2294', '73', 'tzwl588', '3321', '出货扫描', '1541585816', '0.0.0.0', '/angels/Angels/Dealer/shipadd_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"23453255\",\"ship_deliver\":\"73\",\"ship_dealer\":87,\"ship_pro\":16,\"ship_whid\":7,\"ship_proqty\":\"36\",\"ship_barcode\":\"10002534\",\"ship_date\":1514822400,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":2,\"ship_czid\":\"73\",\"ship_czuser\":\"tzwl588\"}', '1');
INSERT INTO `fw_log` VALUES ('2295', '73', 'tzwl588', '3321', '出货扫描', '1541585816', '0.0.0.0', '/angels/Angels/Dealer/shipadd_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"23453255\",\"ship_deliver\":\"73\",\"ship_dealer\":87,\"ship_pro\":16,\"ship_whid\":7,\"ship_proqty\":1,\"ship_barcode\":\"1000253501\",\"ship_date\":1514822400,\"ship_ucode\":\"10002535\",\"ship_tcode\":\"10002535\",\"ship_remark\":\"\",\"ship_cztype\":2,\"ship_czid\":\"73\",\"ship_czuser\":\"tzwl588\"}', '1');
INSERT INTO `fw_log` VALUES ('2296', '1191', 'test', '3321', '出货扫描', '1541586975', '0.0.0.0', '/angels/Mp/Shipment/add_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"34525325\",\"ship_deliver\":0,\"ship_dealer\":66,\"ship_pro\":16,\"ship_whid\":7,\"ship_proqty\":\"36\",\"ship_barcode\":\"10002536\",\"ship_date\":1541347200,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\\u4ed6\\u5982\\u4f55\\u56de\\u5e94\",\"ship_cztype\":0,\"ship_czid\":\"1191\",\"ship_czuser\":\"test\"}', '1');
INSERT INTO `fw_log` VALUES ('2297', '1191', 'test', '3321', '出货扫描', '1541586975', '0.0.0.0', '/angels/Mp/Shipment/add_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"34525325\",\"ship_deliver\":0,\"ship_dealer\":66,\"ship_pro\":16,\"ship_whid\":7,\"ship_proqty\":1,\"ship_barcode\":\"1000253701\",\"ship_date\":1541347200,\"ship_ucode\":\"10002537\",\"ship_tcode\":\"10002537\",\"ship_remark\":\"\\u4ed6\\u5982\\u4f55\\u56de\\u5e94\",\"ship_cztype\":0,\"ship_czid\":\"1191\",\"ship_czuser\":\"test\"}', '1');
INSERT INTO `fw_log` VALUES ('2298', '89', 'test', '3321', '经销商账号登录', '1541642181', '127.0.0.1', '/Angels/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2299', '1191', 'test', '3321', '企业登录', '1541642297', '127.0.0.1', '/Mp/Login/logining', '', '1');
INSERT INTO `fw_log` VALUES ('2300', '66', 'test', '3321', '经销商账号登录', '1541642369', '127.0.0.1', '/Angels/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2301', '66', 'test', '3321', '出货扫描', '1541642401', '127.0.0.1', '/Angels/Dealer/shipadd_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"345636456453\",\"ship_deliver\":\"66\",\"ship_dealer\":73,\"ship_pro\":16,\"ship_whid\":7,\"ship_proqty\":\"36\",\"ship_barcode\":\"10002536\",\"ship_date\":1517587200,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"sdfgh\",\"ship_cztype\":2,\"ship_czid\":\"66\",\"ship_czuser\":\"test\"}', '1');
INSERT INTO `fw_log` VALUES ('2302', '66', 'test', '3321', '出货扫描', '1541642401', '127.0.0.1', '/Angels/Dealer/shipadd_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"345636456453\",\"ship_deliver\":\"66\",\"ship_dealer\":73,\"ship_pro\":16,\"ship_whid\":7,\"ship_proqty\":1,\"ship_barcode\":\"1000253701\",\"ship_date\":1517587200,\"ship_ucode\":\"10002537\",\"ship_tcode\":\"10002537\",\"ship_remark\":\"sdfgh\",\"ship_cztype\":2,\"ship_czid\":\"66\",\"ship_czuser\":\"test\"}', '1');
INSERT INTO `fw_log` VALUES ('2303', '66', 'test', '3321', '出货扫描', '1541642583', '127.0.0.1', '/Angels/Dealer/shipadd_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"324523455\",\"ship_deliver\":\"66\",\"ship_dealer\":73,\"ship_pro\":16,\"ship_whid\":7,\"ship_proqty\":\"36\",\"ship_barcode\":\"10002538\",\"ship_date\":1517587200,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"dfgh\",\"ship_cztype\":2,\"ship_czid\":\"66\",\"ship_czuser\":\"test\"}', '1');
INSERT INTO `fw_log` VALUES ('2304', '1191', 'test', '3321', '出货扫描', '1541643499', '127.0.0.1', '/Mp/Shipment/add_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201810301543135387\",\"ship_deliver\":0,\"ship_dealer\":67,\"ship_pro\":16,\"ship_whid\":7,\"ship_proqty\":\"36\",\"ship_barcode\":\"10002539\",\"ship_date\":1540828800,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"1191\",\"ship_czuser\":\"test\"}', '1');
INSERT INTO `fw_log` VALUES ('2305', '1191', 'test', '3321', '出货扫描', '1541643499', '127.0.0.1', '/Mp/Shipment/add_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201810301543135387\",\"ship_deliver\":0,\"ship_dealer\":67,\"ship_pro\":16,\"ship_whid\":7,\"ship_proqty\":\"36\",\"ship_barcode\":\"10002540\",\"ship_date\":1540828800,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"1191\",\"ship_czuser\":\"test\"}', '1');
INSERT INTO `fw_log` VALUES ('2306', '1191', 'test', '3321', '出货扫描', '1541643499', '127.0.0.1', '/Mp/Shipment/add_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201810301543135387\",\"ship_deliver\":0,\"ship_dealer\":67,\"ship_pro\":16,\"ship_whid\":7,\"ship_proqty\":1,\"ship_barcode\":\"1000254101\",\"ship_date\":1540828800,\"ship_ucode\":\"10002541\",\"ship_tcode\":\"10002541\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"1191\",\"ship_czuser\":\"test\"}', '1');
INSERT INTO `fw_log` VALUES ('2307', '1191', 'test', '3321', '出货扫描', '1541643499', '127.0.0.1', '/Mp/Shipment/add_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201810301543135387\",\"ship_deliver\":0,\"ship_dealer\":67,\"ship_pro\":16,\"ship_whid\":7,\"ship_proqty\":\"36\",\"ship_barcode\":\"10002542\",\"ship_date\":1540828800,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"1191\",\"ship_czuser\":\"test\"}', '1');
INSERT INTO `fw_log` VALUES ('2308', '1191', 'test', '3321', '出货扫描', '1541643500', '127.0.0.1', '/Mp/Shipment/add_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201810301543135387\",\"ship_deliver\":0,\"ship_dealer\":67,\"ship_pro\":16,\"ship_whid\":7,\"ship_proqty\":\"36\",\"ship_barcode\":\"10002543\",\"ship_date\":1540828800,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"1191\",\"ship_czuser\":\"test\"}', '1');
INSERT INTO `fw_log` VALUES ('2309', '66', 'test', '3321', '经销商账号登录', '1541646736', '127.0.0.1', '/Angels/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2310', '66', 'test', '3321', '经销商账号登录', '1542003010', '127.0.0.1', '/Angels/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2311', '66', 'test', '3321', '经销商账号登录', '1542014390', '113.109.120.205', '/Angels/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2312', '1191', 'test', '3321', '企业登录', '1542015641', '113.109.120.205', '/Mp/Login/logining', '', '1');
INSERT INTO `fw_log` VALUES ('2313', '1191', 'test', '3321', '企业登录', '1542091189', '58.63.147.225', '/mp/login/logining', '', '1');
INSERT INTO `fw_log` VALUES ('2314', '1191', 'test', '3321', '删除产品', '1542092592', '58.63.147.225', '/mp/product/delete/pro_id/17', '{\"pro_id\":\"17\",\"pro_unitcode\":\"3321\",\"pro_typeid\":\"20\",\"pro_name\":\"\\u5141\\u7f8e \\u679c\\u852c\\u9175\\u7d20\\u7c89\",\"pro_number\":\"\\u9175\\u7d20\",\"pro_barcode\":\"\",\"pro_jftype\":\"1\",\"pro_jifen\":\"0\",\"pro_jfmax\":\"0\",\"pro_dljf\":\"0\",\"pro_pic\":\"3321\\/1541498395_8303.jpg\",\"pro_pic2\":\"3321\\/15317127712_1189.JPG\",\"pro_price\":\"7600.00\",\"pro_stock\":\"0\",\"pro_units\":\"\\u7bb1\",\"pro_dbiao\":\"1\",\"pro_zbiao\":\"0\",\"pro_xbiao\":\"36\",\"pro_desc\":\"\\u9175\\u7d201\\u7bb1 10\\u888b*36\\u76d2\",\"pro_link\":\"\",\"pro_expirydate\":null,\"pro_remark\":\"\\u9175\\u7d20\\u7c891\\u7bb1 10\\u888b*36\\u76d2\",\"pro_active\":\"1\",\"pro_order\":\"0\",\"pro_addtime\":\"1531712771\"}', '1');
INSERT INTO `fw_log` VALUES ('2315', '1191', 'test', '3321', '删除产品', '1542092595', '58.63.147.225', '/mp/product/delete/pro_id/16', '{\"pro_id\":\"16\",\"pro_unitcode\":\"3321\",\"pro_typeid\":\"19\",\"pro_name\":\"\\u5141\\u7f8e \\u51cf\\u4e4b\\u5708\\u4ee3\\u9910\\u997c\\u5e72\",\"pro_number\":\"21\\u7247\",\"pro_barcode\":\"\",\"pro_jftype\":\"1\",\"pro_jifen\":\"0\",\"pro_jfmax\":\"0\",\"pro_dljf\":\"0\",\"pro_pic\":\"3321\\/1541498404_6811.jpg\",\"pro_pic2\":\"3321\\/15316281202_8236.jpg\",\"pro_price\":\"7600.00\",\"pro_stock\":\"0\",\"pro_units\":\"\\u7bb1\",\"pro_dbiao\":\"1\",\"pro_zbiao\":\"0\",\"pro_xbiao\":\"20\",\"pro_desc\":\"\\u4e00\\u7bb1\\uff1a21\\u7247*20\\u76d2\",\"pro_link\":\"\",\"pro_expirydate\":null,\"pro_remark\":\"\\u4e00\\u7bb1\\uff1a21\\u7247*20\\u76d2\",\"pro_active\":\"1\",\"pro_order\":\"0\",\"pro_addtime\":\"1531274363\"}', '1');
INSERT INTO `fw_log` VALUES ('2316', '1191', 'test', '3321', '添加产品', '1542092811', '58.63.147.225', '/mp/product/edit_save', '{\"pro_name\":\"\\u5373\\u98df\\u71d5\\u7a9d\",\"pro_number\":\"00001\",\"pro_unitcode\":\"3321\",\"pro_typeid\":19,\"pro_jftype\":1,\"pro_jifen\":0,\"pro_jfmax\":0,\"pro_dljf\":0,\"pro_desc\":\"\",\"pro_link\":\"\",\"pro_barcode\":\"\",\"pro_remark\":\"\",\"pro_addtime\":1542092811,\"pro_active\":1,\"pro_price\":\"100\",\"pro_stock\":0,\"pro_units\":\"\\u76d2\",\"pro_dbiao\":0,\"pro_zbiao\":0,\"pro_xbiao\":0,\"pro_pic\":\"3321\\/1542092811_9174.jpg\"}', '1');
INSERT INTO `fw_log` VALUES ('2317', '1191', 'test', '3321', '添加产品', '1542092849', '58.63.147.225', '/mp/product/edit_save', '{\"pro_name\":\"\\u4e2d\\u6bdb\\u71d5\\u76cf\",\"pro_number\":\"00002\",\"pro_unitcode\":\"3321\",\"pro_typeid\":19,\"pro_jftype\":1,\"pro_jifen\":0,\"pro_jfmax\":0,\"pro_dljf\":0,\"pro_desc\":\"\",\"pro_link\":\"\",\"pro_barcode\":\"\",\"pro_remark\":\"\",\"pro_addtime\":1542092849,\"pro_active\":1,\"pro_price\":\"100\",\"pro_stock\":0,\"pro_units\":\"\\u76d2\",\"pro_dbiao\":0,\"pro_zbiao\":0,\"pro_xbiao\":0,\"pro_pic\":\"3321\\/1542092849_9725.jpg\"}', '1');
INSERT INTO `fw_log` VALUES ('2318', '1191', 'test', '3321', '添加产品', '1542092885', '58.63.147.225', '/mp/product/edit_save', '{\"pro_name\":\"\\u4e2d\\u6bdb\\u71d5\\u76cf2\",\"pro_number\":\"00003\",\"pro_unitcode\":\"3321\",\"pro_typeid\":19,\"pro_jftype\":1,\"pro_jifen\":0,\"pro_jfmax\":0,\"pro_dljf\":0,\"pro_desc\":\"\",\"pro_link\":\"\",\"pro_barcode\":\"\",\"pro_remark\":\"\",\"pro_addtime\":1542092885,\"pro_active\":1,\"pro_price\":\"100\",\"pro_stock\":0,\"pro_units\":\"\\u76d2\",\"pro_dbiao\":0,\"pro_zbiao\":0,\"pro_xbiao\":0,\"pro_pic\":\"3321\\/1542092885_3446.jpg\"}', '1');
INSERT INTO `fw_log` VALUES ('2319', '66', 'test', '3321', '经销商账号登录', '1542094372', '58.63.147.225', '/angels/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2320', '66', 'test', '3321', '经销商账号登录', '1542094399', '112.96.197.47', '/angels/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2321', '66', 'test', '3321', '经销商账号登录', '1542098179', '58.63.147.225', '/angels/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2322', '1191', 'test', '3321', '企业登录', '1542098213', '58.63.147.225', '/mp/login/logining', '', '1');
INSERT INTO `fw_log` VALUES ('2323', '66', 'test', '3321', '经销商账号登录', '1542098364', '58.63.146.231', '/angels/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2324', '1191', 'test', '3321', '企业登录', '1542098521', '58.63.146.231', '/mp/login/logining', '', '1');
INSERT INTO `fw_log` VALUES ('2325', '1191', 'test', '3321', '企业登录', '1542100644', '58.63.147.225', '/mp/login/logining', '', '1');
INSERT INTO `fw_log` VALUES ('2326', '66', 'test', '3321', '经销商账号登录', '1542101161', '58.63.147.225', '/angels/dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2327', '1191', 'test', '3321', '企业登录', '1542103258', '58.63.147.225', '/mp/login/logining', '', '1');
INSERT INTO `fw_log` VALUES ('2328', '1191', 'test', '3321', '企业登录', '1542103516', '58.63.147.225', '/mp/login/logining', '', '1');
INSERT INTO `fw_log` VALUES ('2329', '1191', 'test', '3321', '企业登录', '1542158938', '127.0.0.1', '/Mp/Login/logining', '', '1');
INSERT INTO `fw_log` VALUES ('2330', '1191', 'test', '3321', '删除经销商分类', '1542159179', '127.0.0.1', '/Mp/Dealer/dltdel/dlt_id/2', '{\"dlt_id\":\"2\",\"dlt_unitcode\":\"3321\",\"dlt_name\":\"\\u5141\\u7f8e\\u5927\\u5065\\u5eb7\",\"dlt_level\":\"1\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"0.00\",\"dlt_minnum\":\"3\"}', '1');
INSERT INTO `fw_log` VALUES ('2331', '1191', 'test', '3321', '添加经销商级别', '1542159238', '127.0.0.1', '/Mp/Dealer/type_save', '{\"dlt_unitcode\":\"3321\",\"dlt_name\":\"CEO\",\"dlt_level\":1,\"dlt_fanli1\":0,\"dlt_fanli2\":0,\"dlt_fanli3\":0,\"dlt_fanli4\":0,\"dlt_fanli5\":0,\"dlt_fanli6\":0,\"dlt_fanli7\":0,\"dlt_fanli8\":0,\"dlt_fanli9\":0,\"dlt_fanli10\":0,\"dlt_firstquota\":0,\"dlt_minnum\":0}', '1');
INSERT INTO `fw_log` VALUES ('2332', '1191', 'test', '3321', '添加经销商级别', '1542159254', '127.0.0.1', '/Mp/Dealer/type_save', '{\"dlt_unitcode\":\"3321\",\"dlt_name\":\"\\u6267\\u884c\\u8463\\u4e8b\",\"dlt_level\":2,\"dlt_fanli1\":0,\"dlt_fanli2\":0,\"dlt_fanli3\":0,\"dlt_fanli4\":0,\"dlt_fanli5\":0,\"dlt_fanli6\":0,\"dlt_fanli7\":0,\"dlt_fanli8\":0,\"dlt_fanli9\":0,\"dlt_fanli10\":0,\"dlt_firstquota\":0,\"dlt_minnum\":0}', '1');
INSERT INTO `fw_log` VALUES ('2333', '1191', 'test', '3321', '添加经销商级别', '1542159270', '127.0.0.1', '/Mp/Dealer/type_save', '{\"dlt_unitcode\":\"3321\",\"dlt_name\":\"\\u9500\\u552e\\u603b\\u76d1\",\"dlt_level\":3,\"dlt_fanli1\":0,\"dlt_fanli2\":0,\"dlt_fanli3\":0,\"dlt_fanli4\":0,\"dlt_fanli5\":0,\"dlt_fanli6\":0,\"dlt_fanli7\":0,\"dlt_fanli8\":0,\"dlt_fanli9\":0,\"dlt_fanli10\":0,\"dlt_firstquota\":0,\"dlt_minnum\":0}', '1');
INSERT INTO `fw_log` VALUES ('2334', '1191', 'test', '3321', '添加经销商级别', '1542159284', '127.0.0.1', '/Mp/Dealer/type_save', '{\"dlt_unitcode\":\"3321\",\"dlt_name\":\"\\u9500\\u552e\\u7ecf\\u7406\",\"dlt_level\":4,\"dlt_fanli1\":0,\"dlt_fanli2\":0,\"dlt_fanli3\":0,\"dlt_fanli4\":0,\"dlt_fanli5\":0,\"dlt_fanli6\":0,\"dlt_fanli7\":0,\"dlt_fanli8\":0,\"dlt_fanli9\":0,\"dlt_fanli10\":0,\"dlt_firstquota\":0,\"dlt_minnum\":0}', '1');
INSERT INTO `fw_log` VALUES ('2335', '1', 'test', '3321', '经销商账号登录', '1542159398', '127.0.0.1', '/Angels/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2336', '1191', 'test', '3321', '企业登录', '1542159699', '127.0.0.1', '/Mp/Login/logining', '', '1');
INSERT INTO `fw_log` VALUES ('2337', '1191', 'test', '3321', '企业登录', '1542159864', '127.0.0.1', '/Mp/Login/logining', '', '1');
INSERT INTO `fw_log` VALUES ('2338', '1191', 'test', '3321', '手机端基本设置', '1542160754', '127.0.0.1', '/Mp/Jfmobi/edit_save/action/basic', '{\"bas_sitename\":\"\",\"bas_company\":\"\\u5b89\\u5409\\u601d\\u71d5\\u7a9d\",\"bas_address\":\"\",\"bas_hotline\":\"400-168-1810\",\"bas_tel\":\"\",\"bas_fax\":\"\",\"bas_website\":\"http:\\/\\/www.bomanvip.com\",\"bas_weixin\":\"\",\"bas_weibo\":\"\"}', '1');
INSERT INTO `fw_log` VALUES ('2339', '1191', 'test', '3321', '企业登录', '1542178003', '127.0.0.1', '/Mp/Login/logining', '', '1');
INSERT INTO `fw_log` VALUES ('2340', '1191', 'test', '3321', '企业登录', '1542180337', '127.0.0.1', '/Mp/Login/logining', '', '1');
INSERT INTO `fw_log` VALUES ('2341', '2', '15875872791', '3321', '代理商注册', '1542180462', '127.0.0.1', '/Angels/Apply/index', '{\"dl_username\":\"15875872791\",\"dl_pwd\":\"587ccacd43c51cad35df059b107a9577\",\"dl_number\":\"\",\"dl_unitcode\":\"3321\",\"dl_name\":\"\\u949f\\u742a1\",\"dl_contact\":\"\\u949f\\u742a1\",\"dl_tel\":\"15875872791\",\"dl_idcard\":\"440804199606160571\",\"dl_idcardpic\":\"\",\"dl_idcardpic2\":\"\",\"dl_tbdian\":\"\",\"dl_tbzhanggui\":\"\",\"dl_addtime\":1542180462,\"dl_status\":0,\"dl_level\":\"1\",\"dl_type\":9,\"dl_sttype\":0,\"dl_belong\":0,\"dl_referee\":\"1\",\"dl_remark\":\"\",\"dl_address\":\"\\u5317\\u4eac\\u5e02\\u623f\\u5c71\\u533a\",\"dl_sheng\":\"11\",\"dl_shi\":\"1111\",\"dl_qu\":\"0\",\"dl_qustr\":\"\\u5317\\u4eac\\u5e02\\u623f\\u5c71\\u533a\",\"dl_openid\":\"\",\"dl_weixin\":\"15875872791\",\"dl_wxnickname\":\"\",\"dl_wxsex\":0,\"dl_wxprovince\":\"\",\"dl_wxcity\":\"\",\"dl_wxcountry\":\"\",\"dl_wxheadimg\":\"\",\"dl_brand\":\"\",\"dl_brandlevel\":\"\"}', '2');
INSERT INTO `fw_log` VALUES ('2342', '1191', 'test', '3321', '出货扫描', '1542180570', '127.0.0.1', '/Mp/Shipment/add_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201810301543135387\",\"ship_deliver\":0,\"ship_dealer\":1,\"ship_pro\":18,\"ship_whid\":7,\"ship_proqty\":\"20\",\"ship_barcode\":\"10000001\",\"ship_date\":1542124800,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"1191\",\"ship_czuser\":\"test\"}', '1');
INSERT INTO `fw_log` VALUES ('2343', '1', 'test', '3321', '出货扫描', '1542180673', '127.0.0.1', '/Angels/Dealer/shipadd_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"634563656\",\"ship_deliver\":\"1\",\"ship_dealer\":2,\"ship_pro\":18,\"ship_whid\":7,\"ship_proqty\":\"20\",\"ship_barcode\":\"10000001\",\"ship_date\":1514822400,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":2,\"ship_czid\":\"1\",\"ship_czuser\":\"test\"}', '1');
INSERT INTO `fw_log` VALUES ('2344', '1191', 'test', '3321', '删除产品类型', '1542184326', '127.0.0.1', '/Mp/Product/typedelete/protype_id/20', '{\"protype_id\":\"20\",\"protype_unitcode\":\"3321\",\"protype_name\":\"YM\",\"protype_iswho\":\"0\",\"protype_order\":\"19\"}', '1');
INSERT INTO `fw_log` VALUES ('2345', '1191', 'test', '3321', '修改产品类型', '1542184368', '127.0.0.1', '/Mp/Product/typeedit_save', '{\"protype_id\":19,\"protype_name\":\"\\u71d5\\u7a9d\",\"protype_iswho\":\"0\"}', '1');
INSERT INTO `fw_log` VALUES ('2346', '1191', 'test', '3321', '修改产品类型', '1542184416', '127.0.0.1', '/Mp/Product/typeedit_save', '{\"protype_id\":19,\"protype_name\":\"\\u71d5\\u76cf\",\"protype_iswho\":\"0\"}', '1');
INSERT INTO `fw_log` VALUES ('2347', '1191', 'test', '3321', '添加产品类型', '1542184436', '127.0.0.1', '/Mp/Product/typeedit_save', '{\"protype_unitcode\":\"3321\",\"protype_name\":\"\\u71d5\\u7a9d\",\"protype_iswho\":\"0\"}', '1');
INSERT INTO `fw_log` VALUES ('2348', '1191', 'test', '3321', '修改产品', '1542184450', '127.0.0.1', '/Mp/Product/edit_save', '{\"pro_id\":18,\"pro_name\":\"\\u5373\\u98df\\u71d5\\u7a9d\",\"pro_number\":\"00001\",\"pro_typeid\":21,\"pro_jftype\":1,\"pro_jifen\":0,\"pro_jfmax\":0,\"pro_dljf\":0,\"pro_desc\":\"\",\"pro_link\":\"\",\"pro_barcode\":\"\",\"pro_remark\":\"\",\"pro_price\":\"100.00\",\"pro_stock\":0,\"pro_units\":\"\\u76d2\",\"pro_dbiao\":0,\"pro_zbiao\":0,\"pro_xbiao\":0}', '1');
INSERT INTO `fw_log` VALUES ('2349', '1191', 'test', '3321', '企业登录', '1542245410', '127.0.0.1', '/Mp/Login/logining', '', '1');
INSERT INTO `fw_log` VALUES ('2350', '1191', 'test', '3321', '修改仓库', '1542246893', '127.0.0.1', '/Mp/Warehouse/edit_save', '{\"wh_munber\":\"store_001\",\"wh_name\":\"\\u5b89\\u5409\\u601d\",\"wh_address\":\"\",\"wh_director\":\"\",\"wh_remark\":\"\"}', '1');
INSERT INTO `fw_log` VALUES ('2351', '1191', 'test', '3321', '企业登录', '1542247239', '127.0.0.1', '/Mp/Login/logining', '', '1');
INSERT INTO `fw_log` VALUES ('2352', '1191', 'test', '3321', '企业登录', '1542247374', '127.0.0.1', '/Mp/Login/logining', '', '1');
INSERT INTO `fw_log` VALUES ('2353', '1191', 'test', '3321', '添加子用户', '1542247417', '127.0.0.1', '/Mp/Subuser/subuseradd_save', '{\"su_purview\":\"10000,10001,10002,10003,10004,10005,10008,10009,10010,90000,90001,90003,90004,90005,20006,20007,13004\",\"su_unitcode\":\"3321\",\"su_username\":\"zq123\",\"su_pwd\":\"66730c784751efc66db25382bd59bbbb\",\"su_name\":\"\\u949f\\u742a\",\"su_belong\":0,\"su_logintime\":0,\"su_status\":1}', '1');
INSERT INTO `fw_log` VALUES ('2354', '1', 'test', '3321', '经销商账号登录', '1542267503', '127.0.0.1', '/Angels/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2355', '1191', 'test', '3321', '企业登录', '1542357498', '127.0.0.1', '/Mp/Login/logining', '', '1');
INSERT INTO `fw_log` VALUES ('2356', '1191', 'test', '3321', '企业登录', '1542424783', '127.0.0.1', '/Mp/Login/logining', '', '1');
INSERT INTO `fw_log` VALUES ('2357', '1191', 'test', '3321', '修改经销商级别', '1542424922', '127.0.0.1', '/Mp/Dealer/type_save', '{\"dlt_name\":\"CEO\",\"dlt_level\":1,\"dlt_fanli1\":0,\"dlt_fanli2\":0,\"dlt_fanli3\":0,\"dlt_fanli4\":0,\"dlt_fanli5\":0,\"dlt_fanli6\":0,\"dlt_fanli7\":0,\"dlt_fanli8\":0,\"dlt_fanli9\":0,\"dlt_fanli10\":0,\"dlt_firstquota\":\"300000\",\"dlt_minnum\":\"0\"}', '1');
INSERT INTO `fw_log` VALUES ('2358', '1191', 'test', '3321', '修改经销商级别', '1542424931', '127.0.0.1', '/Mp/Dealer/type_save', '{\"dlt_name\":\"\\u6267\\u884c\\u8463\\u4e8b\",\"dlt_level\":2,\"dlt_fanli1\":0,\"dlt_fanli2\":0,\"dlt_fanli3\":0,\"dlt_fanli4\":0,\"dlt_fanli5\":0,\"dlt_fanli6\":0,\"dlt_fanli7\":0,\"dlt_fanli8\":0,\"dlt_fanli9\":0,\"dlt_fanli10\":0,\"dlt_firstquota\":\"100000\",\"dlt_minnum\":\"0\"}', '1');
INSERT INTO `fw_log` VALUES ('2359', '1191', 'test', '3321', '修改经销商级别', '1542424945', '127.0.0.1', '/Mp/Dealer/type_save', '{\"dlt_name\":\"\\u9500\\u552e\\u603b\\u76d1\",\"dlt_level\":3,\"dlt_fanli1\":0,\"dlt_fanli2\":0,\"dlt_fanli3\":0,\"dlt_fanli4\":0,\"dlt_fanli5\":0,\"dlt_fanli6\":0,\"dlt_fanli7\":0,\"dlt_fanli8\":0,\"dlt_fanli9\":0,\"dlt_fanli10\":0,\"dlt_firstquota\":\"300000\",\"dlt_minnum\":\"0\"}', '1');
INSERT INTO `fw_log` VALUES ('2360', '1191', 'test', '3321', '修改经销商级别', '1542424967', '127.0.0.1', '/Mp/Dealer/type_save', '{\"dlt_name\":\"\\u9500\\u552e\\u7ecf\\u7406\",\"dlt_level\":4,\"dlt_fanli1\":0,\"dlt_fanli2\":0,\"dlt_fanli3\":0,\"dlt_fanli4\":0,\"dlt_fanli5\":0,\"dlt_fanli6\":0,\"dlt_fanli7\":0,\"dlt_fanli8\":0,\"dlt_fanli9\":0,\"dlt_fanli10\":0,\"dlt_firstquota\":\"10000\",\"dlt_minnum\":\"0\"}', '1');
INSERT INTO `fw_log` VALUES ('2361', '1191', 'test', '3321', '修改经销商级别', '1542427574', '127.0.0.1', '/Mp/Dealer/type_save', '{\"dlt_name\":\"CEO\",\"dlt_level\":1,\"dlt_fanli1\":0,\"dlt_fanli2\":0,\"dlt_fanli3\":0,\"dlt_fanli4\":0,\"dlt_fanli5\":0,\"dlt_fanli6\":0,\"dlt_fanli7\":0,\"dlt_fanli8\":0,\"dlt_fanli9\":0,\"dlt_fanli10\":0,\"dlt_firstquota\":\"300000.00\",\"dlt_minnum\":\"10\"}', '1');
INSERT INTO `fw_log` VALUES ('2362', '1191', 'test', '3321', '修改产品价格体系', '1542429970', '127.0.0.1', '/Mp/Product/propriceedit_save', '[{\"dlt_id\":\"9\",\"dlt_unitcode\":\"3321\",\"dlt_name\":\"CEO\",\"dlt_level\":\"1\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"300000.00\",\"dlt_minnum\":\"10\",\"priprice\":0,\"pro_id\":\"20\"},{\"dlt_id\":\"10\",\"dlt_unitcode\":\"3321\",\"dlt_name\":\"\\u6267\\u884c\\u8463\\u4e8b\",\"dlt_level\":\"2\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"100000.00\",\"dlt_minnum\":\"0\",\"priprice\":0,\"pro_id\":\"20\"},{\"dlt_id\":\"11\",\"dlt_unitcode\":\"3321\",\"dlt_name\":\"\\u9500\\u552e\\u603b\\u76d1\",\"dlt_level\":\"3\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"300000.00\",\"dlt_minnum\":\"0\",\"priprice\":0,\"pro_id\":\"20\"},{\"dlt_id\":\"12\",\"dlt_unitcode\":\"3321\",\"dlt_name\":\"\\u9500\\u552e\\u7ecf\\u7406\",\"dlt_level\":\"4\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"10000.00\",\"dlt_minnum\":\"0\",\"priprice\":0,\"pro_id\":\"20\"}]', '1');
INSERT INTO `fw_log` VALUES ('2363', '1191', 'test', '3321', '产品返利设置', '1542431065', '127.0.0.1', '/Mp/Product/profanli_save', '[]', '1');
INSERT INTO `fw_log` VALUES ('2364', '1191', 'test', '3321', '修改产品价格体系', '1542431074', '127.0.0.1', '/Mp/Product/propriceedit_save', '[{\"dlt_id\":\"9\",\"dlt_unitcode\":\"3321\",\"dlt_name\":\"CEO\",\"dlt_level\":\"1\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"300000.00\",\"dlt_minnum\":\"10\",\"priprice\":0,\"pro_id\":\"20\"},{\"dlt_id\":\"10\",\"dlt_unitcode\":\"3321\",\"dlt_name\":\"\\u6267\\u884c\\u8463\\u4e8b\",\"dlt_level\":\"2\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"100000.00\",\"dlt_minnum\":\"0\",\"priprice\":0,\"pro_id\":\"20\"},{\"dlt_id\":\"11\",\"dlt_unitcode\":\"3321\",\"dlt_name\":\"\\u9500\\u552e\\u603b\\u76d1\",\"dlt_level\":\"3\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"300000.00\",\"dlt_minnum\":\"0\",\"priprice\":0,\"pro_id\":\"20\"},{\"dlt_id\":\"12\",\"dlt_unitcode\":\"3321\",\"dlt_name\":\"\\u9500\\u552e\\u7ecf\\u7406\",\"dlt_level\":\"4\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"10000.00\",\"dlt_minnum\":\"0\",\"priprice\":0,\"pro_id\":\"20\"}]', '1');
INSERT INTO `fw_log` VALUES ('2365', '1', 'test', '3321', '经销商账号登录', '1542434677', '127.0.0.1', '/Angels/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2366', '1191', 'test', '3321', '修改经销商级别', '1542436635', '127.0.0.1', '/Mp/Dealer/type_save', '{\"dlt_name\":\"CEO\",\"dlt_level\":1,\"dlt_fanli1\":0,\"dlt_fanli2\":0,\"dlt_fanli3\":0,\"dlt_fanli4\":0,\"dlt_fanli5\":0,\"dlt_fanli6\":0,\"dlt_fanli7\":0,\"dlt_fanli8\":0,\"dlt_fanli9\":0,\"dlt_fanli10\":0,\"dlt_firstquota\":\"300000.00\",\"dlt_minnum\":\"0\",\"dlt_butie\":0,\"dltypefanli\":[{\"dlt_id\":\"9\",\"dlt_unitcode\":\"3321\",\"dlt_name\":\"CEO\",\"dlt_level\":\"1\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"300000.00\",\"dlt_minnum\":\"10\",\"tfl_fanli1\":\"0.03\",\"tfl_fanli2\":\"0.01\"},{\"dlt_id\":\"10\",\"dlt_unitcode\":\"3321\",\"dlt_name\":\"\\u6267\\u884c\\u8463\\u4e8b\",\"dlt_level\":\"2\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"100000.00\",\"dlt_minnum\":\"0\",\"tfl_fanli1\":\"0.00\",\"tfl_fanli2\":\"0.00\"},{\"dlt_id\":\"11\",\"dlt_unitcode\":\"3321\",\"dlt_name\":\"\\u9500\\u552e\\u603b\\u76d1\",\"dlt_level\":\"3\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"300000.00\",\"dlt_minnum\":\"0\",\"tfl_fanli1\":\"0.00\",\"tfl_fanli2\":\"0.00\"},{\"dlt_id\":\"12\",\"dlt_unitcode\":\"3321\",\"dlt_name\":\"\\u9500\\u552e\\u7ecf\\u7406\",\"dlt_level\":\"4\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"10000.00\",\"dlt_minnum\":\"0\",\"tfl_fanli1\":\"0.00\",\"tfl_fanli2\":\"0.00\"}]}', '1');
INSERT INTO `fw_log` VALUES ('2367', '1191', 'test', '3321', '修改产品价格体系', '1542449198', '127.0.0.1', '/Mp/Product/propriceedit_save', '[{\"dlt_id\":\"9\",\"dlt_unitcode\":\"3321\",\"dlt_name\":\"CEO\",\"dlt_level\":\"1\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"300000.00\",\"dlt_minnum\":\"0\",\"priprice\":\"100\",\"pro_id\":\"20\"},{\"dlt_id\":\"10\",\"dlt_unitcode\":\"3321\",\"dlt_name\":\"\\u6267\\u884c\\u8463\\u4e8b\",\"dlt_level\":\"2\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"100000.00\",\"dlt_minnum\":\"0\",\"priprice\":\"100\",\"pro_id\":\"20\"},{\"dlt_id\":\"11\",\"dlt_unitcode\":\"3321\",\"dlt_name\":\"\\u9500\\u552e\\u603b\\u76d1\",\"dlt_level\":\"3\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"300000.00\",\"dlt_minnum\":\"0\",\"priprice\":\"100\",\"pro_id\":\"20\"},{\"dlt_id\":\"12\",\"dlt_unitcode\":\"3321\",\"dlt_name\":\"\\u9500\\u552e\\u7ecf\\u7406\",\"dlt_level\":\"4\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"10000.00\",\"dlt_minnum\":\"0\",\"priprice\":\"100\",\"pro_id\":\"20\"}]', '1');
INSERT INTO `fw_log` VALUES ('2368', '1191', 'test', '3321', '修改产品价格体系', '1542449212', '127.0.0.1', '/Mp/Product/propriceedit_save', '[{\"dlt_id\":\"9\",\"dlt_unitcode\":\"3321\",\"dlt_name\":\"CEO\",\"dlt_level\":\"1\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"300000.00\",\"dlt_minnum\":\"0\",\"priprice\":\"100\",\"pro_id\":\"19\"},{\"dlt_id\":\"10\",\"dlt_unitcode\":\"3321\",\"dlt_name\":\"\\u6267\\u884c\\u8463\\u4e8b\",\"dlt_level\":\"2\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"100000.00\",\"dlt_minnum\":\"0\",\"priprice\":\"100\",\"pro_id\":\"19\"},{\"dlt_id\":\"11\",\"dlt_unitcode\":\"3321\",\"dlt_name\":\"\\u9500\\u552e\\u603b\\u76d1\",\"dlt_level\":\"3\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"300000.00\",\"dlt_minnum\":\"0\",\"priprice\":\"100\",\"pro_id\":\"19\"},{\"dlt_id\":\"12\",\"dlt_unitcode\":\"3321\",\"dlt_name\":\"\\u9500\\u552e\\u7ecf\\u7406\",\"dlt_level\":\"4\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"10000.00\",\"dlt_minnum\":\"0\",\"priprice\":\"100\",\"pro_id\":\"19\"}]', '1');
INSERT INTO `fw_log` VALUES ('2369', '1191', 'test', '3321', '修改产品价格体系', '1542449229', '127.0.0.1', '/Mp/Product/propriceedit_save', '[{\"dlt_id\":\"9\",\"dlt_unitcode\":\"3321\",\"dlt_name\":\"CEO\",\"dlt_level\":\"1\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"300000.00\",\"dlt_minnum\":\"0\",\"priprice\":\"100\",\"pro_id\":\"18\"},{\"dlt_id\":\"10\",\"dlt_unitcode\":\"3321\",\"dlt_name\":\"\\u6267\\u884c\\u8463\\u4e8b\",\"dlt_level\":\"2\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"100000.00\",\"dlt_minnum\":\"0\",\"priprice\":\"100\",\"pro_id\":\"18\"},{\"dlt_id\":\"11\",\"dlt_unitcode\":\"3321\",\"dlt_name\":\"\\u9500\\u552e\\u603b\\u76d1\",\"dlt_level\":\"3\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"300000.00\",\"dlt_minnum\":\"0\",\"priprice\":\"100\",\"pro_id\":\"18\"},{\"dlt_id\":\"12\",\"dlt_unitcode\":\"3321\",\"dlt_name\":\"\\u9500\\u552e\\u7ecf\\u7406\",\"dlt_level\":\"4\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"10000.00\",\"dlt_minnum\":\"0\",\"priprice\":\"100\",\"pro_id\":\"18\"}]', '1');
INSERT INTO `fw_log` VALUES ('2370', '1191', 'test', '3321', '企业登录', '1542590046', '127.0.0.1', '/Mp/Login/logining', '', '1');
INSERT INTO `fw_log` VALUES ('2371', '3', '15875872792', '3321', '代理商注册', '1542590308', '127.0.0.1', '/Angels/Apply/index', '{\"dl_username\":\"15875872792\",\"dl_pwd\":\"1bde2478115e4e64b4f71e030dc33710\",\"dl_number\":\"\",\"dl_unitcode\":\"3321\",\"dl_name\":\"\\u949f\\u742a2\",\"dl_contact\":\"\\u949f\\u742a2\",\"dl_tel\":\"15875872792\",\"dl_idcard\":\"440804199606160572\",\"dl_idcardpic\":\"\",\"dl_idcardpic2\":\"\",\"dl_tbdian\":\"\",\"dl_tbzhanggui\":\"\",\"dl_addtime\":1542590308,\"dl_status\":0,\"dl_level\":\"1\",\"dl_type\":9,\"dl_sttype\":0,\"dl_belong\":0,\"dl_referee\":\"1\",\"dl_remark\":\"\",\"dl_address\":\"\\u5317\\u4eac\\u5e02\\u5ef6\\u5e86\\u53bf\",\"dl_sheng\":\"11\",\"dl_shi\":\"1129\",\"dl_qu\":\"0\",\"dl_qustr\":\"\\u5317\\u4eac\\u5e02\\u5ef6\\u5e86\\u53bf\",\"dl_openid\":\"\",\"dl_weixin\":\"15875872792\",\"dl_wxnickname\":\"\",\"dl_wxsex\":0,\"dl_wxprovince\":\"\",\"dl_wxcity\":\"\",\"dl_wxcountry\":\"\",\"dl_wxheadimg\":\"\",\"dl_brand\":\"\",\"dl_brandlevel\":\"\"}', '2');
INSERT INTO `fw_log` VALUES ('2372', '1', 'test', '3321', '经销商账号登录', '1542590381', '127.0.0.1', '/Angels/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2373', '3', '15875872792', '3321', '经销商账号登录', '1542590431', '127.0.0.1', '/Angels/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2374', '4', '15875872793', '3321', '代理商注册', '1542591176', '127.0.0.1', '/Angels/Dealer/apply', '{\"dl_username\":\"15875872793\",\"dl_pwd\":\"ad2a523b032e8cb63f6a217150d94385\",\"dl_number\":\"\",\"dl_unitcode\":\"3321\",\"dl_name\":\"\\u949f\\u742a3\",\"dl_contact\":\"\\u949f\\u742a3\",\"dl_tel\":\"15875872793\",\"dl_idcard\":\"440804199606160573\",\"dl_idcardpic\":\"\",\"dl_idcardpic2\":\"\",\"dl_tbdian\":\"\",\"dl_tbzhanggui\":\"\",\"dl_addtime\":1542591176,\"dl_status\":0,\"dl_level\":\"1\",\"dl_type\":9,\"dl_sttype\":0,\"dl_belong\":0,\"dl_referee\":3,\"dl_remark\":\"\",\"dl_address\":\"\\u5e7f\\u4e1c\\u7701\\u6f6e\\u5dde\\u5e02\\u67ab\\u6eaa\\u533a\",\"dl_sheng\":\"44\",\"dl_shi\":\"4451\",\"dl_qu\":\"445101\",\"dl_qustr\":\"\\u5e7f\\u4e1c\\u7701\\u6f6e\\u5dde\\u5e02\\u67ab\\u6eaa\\u533a\",\"dl_openid\":\"\",\"dl_weixin\":\"15875872793\",\"dl_wxnickname\":\"\",\"dl_wxsex\":0,\"dl_wxprovince\":\"\",\"dl_wxcity\":\"\",\"dl_wxcountry\":\"\",\"dl_wxheadimg\":\"\",\"dl_brand\":\"\",\"dl_brandlevel\":\"\"}', '2');
INSERT INTO `fw_log` VALUES ('2375', '4', '15875872793', '3321', '经销商账号登录', '1542591215', '127.0.0.1', '/Angels/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2376', '2', '15875872791', '3321', '经销商账号登录', '1542591514', '127.0.0.1', '/Angels/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2377', '5', '15875872794', '3321', '代理商注册', '1542591669', '127.0.0.1', '/Angels/Apply/index', '{\"dl_username\":\"15875872794\",\"dl_pwd\":\"8fa2bfbeed9dc739761683298301a3b4\",\"dl_number\":\"\",\"dl_unitcode\":\"3321\",\"dl_name\":\"\\u949f\\u742a4\",\"dl_contact\":\"\\u949f\\u742a4\",\"dl_tel\":\"15875872794\",\"dl_idcard\":\"440804199606160574\",\"dl_idcardpic\":\"\",\"dl_idcardpic2\":\"\",\"dl_tbdian\":\"\",\"dl_tbzhanggui\":\"\",\"dl_addtime\":1542591668,\"dl_status\":0,\"dl_level\":\"2\",\"dl_type\":10,\"dl_sttype\":0,\"dl_belong\":\"1\",\"dl_referee\":\"2\",\"dl_remark\":\"\",\"dl_address\":\"\\u5317\\u4eac\\u5e02\\u5ef6\\u5e86\\u53bf\",\"dl_sheng\":\"11\",\"dl_shi\":\"1129\",\"dl_qu\":\"0\",\"dl_qustr\":\"\\u5317\\u4eac\\u5e02\\u5ef6\\u5e86\\u53bf\",\"dl_openid\":\"\",\"dl_weixin\":\"15875872794\",\"dl_wxnickname\":\"\",\"dl_wxsex\":0,\"dl_wxprovince\":\"\",\"dl_wxcity\":\"\",\"dl_wxcountry\":\"\",\"dl_wxheadimg\":\"\",\"dl_brand\":\"\",\"dl_brandlevel\":\"\"}', '2');
INSERT INTO `fw_log` VALUES ('2378', '5', '15875872794', '3321', '经销商账号登录', '1542591715', '127.0.0.1', '/Angels/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2379', '2', '15875872791', '3321', '经销商账号登录', '1542591858', '127.0.0.1', '/Angels/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2380', '1191', 'test', '3321', '删除经销商', '1542591959', '127.0.0.1', '/Mp/Dealer/delete/dl_id/5', '{\"dl_id\":\"5\",\"dl_unitcode\":\"3321\",\"dl_openid\":\"\",\"dl_username\":\"15875872794\",\"dl_pwd\":\"8fa2bfbeed9dc739761683298301a3b4\",\"dl_number\":\"No:007703\",\"dl_name\":\"\\u949f\\u742a4\",\"dl_des\":null,\"dl_area\":null,\"dl_type\":\"10\",\"dl_sttype\":\"0\",\"dl_belong\":\"1\",\"dl_referee\":\"2\",\"dl_level\":\"2\",\"dl_contact\":\"\\u949f\\u742a4\",\"dl_tel\":\"15875872794\",\"dl_fax\":null,\"dl_email\":null,\"dl_weixin\":\"15875872794\",\"dl_wxnickname\":\"\",\"dl_wxsex\":\"0\",\"dl_wxprovince\":\"\",\"dl_wxcity\":\"\",\"dl_wxcountry\":\"\",\"dl_wxheadimg\":\"\",\"dl_qq\":null,\"dl_country\":\"0\",\"dl_sheng\":\"11\",\"dl_shi\":\"1129\",\"dl_qu\":\"0\",\"dl_qustr\":\"\\u5317\\u4eac\\u5e02\\u5ef6\\u5e86\\u53bf\",\"dl_address\":\"\\u5317\\u4eac\\u5e02\\u5ef6\\u5e86\\u53bf\",\"dl_idcard\":\"440804199606160574\",\"dl_idcardpic\":\"\",\"dl_idcardpic2\":\"\",\"dl_tbdian\":\"\",\"dl_tbzhanggui\":\"\",\"dl_tbsqpic\":null,\"dl_tblevel\":null,\"dl_remark\":\"\",\"dl_status\":\"1\",\"dl_startdate\":\"1542591676\",\"dl_enddate\":\"1574127676\",\"dl_addtime\":\"1542591668\",\"dl_pic\":null,\"dl_brand\":\"\",\"dl_brandlevel\":\"\",\"dl_oddtime\":\"0\",\"dl_oddcount\":\"0\",\"dl_logintime\":\"1542591715\",\"dl_fanli\":\"0.00\",\"dl_jifen\":\"0\",\"dl_lastflid\":\"0\",\"dl_flmodel\":\"0\",\"dl_deposit\":\"0.00\",\"dl_depositpic\":null,\"dl_paypic\":null}', '1');
INSERT INTO `fw_log` VALUES ('2381', '6', '15875872794', '3321', '代理商注册', '1542592007', '127.0.0.1', '/Angels/Apply/index', '{\"dl_username\":\"15875872794\",\"dl_pwd\":\"8fa2bfbeed9dc739761683298301a3b4\",\"dl_number\":\"\",\"dl_unitcode\":\"3321\",\"dl_name\":\"\\u949f\\u742a4\",\"dl_contact\":\"\\u949f\\u742a4\",\"dl_tel\":\"15875872794\",\"dl_idcard\":\"440804199606160574\",\"dl_idcardpic\":\"\",\"dl_idcardpic2\":\"\",\"dl_tbdian\":\"\",\"dl_tbzhanggui\":\"\",\"dl_addtime\":1542592007,\"dl_status\":0,\"dl_level\":\"2\",\"dl_type\":10,\"dl_sttype\":0,\"dl_belong\":\"1\",\"dl_referee\":\"2\",\"dl_remark\":\"\",\"dl_address\":\"\\u5929\\u6d25\\u5e02\\u84df\\u53bf\",\"dl_sheng\":\"12\",\"dl_shi\":\"1225\",\"dl_qu\":\"0\",\"dl_qustr\":\"\\u5929\\u6d25\\u5e02\\u84df\\u53bf\",\"dl_openid\":\"\",\"dl_weixin\":\"15875872794\",\"dl_wxnickname\":\"\",\"dl_wxsex\":0,\"dl_wxprovince\":\"\",\"dl_wxcity\":\"\",\"dl_wxcountry\":\"\",\"dl_wxheadimg\":\"\",\"dl_brand\":\"\",\"dl_brandlevel\":\"\"}', '2');
INSERT INTO `fw_log` VALUES ('2382', '1', 'test', '3321', '经销商账号登录', '1542592101', '127.0.0.1', '/Angels/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2383', '6', '15875872794', '3321', '经销商账号登录', '1542592123', '127.0.0.1', '/Angels/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2384', '1', 'test', '3321', '经销商账号登录', '1542592183', '127.0.0.1', '/Angels/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2385', '2', '15875872791', '3321', '经销商账号登录', '1542593030', '127.0.0.1', '/Angels/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2386', '1', 'test', '3321', '经销商账号登录', '1542593104', '127.0.0.1', '/Angels/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2387', '1191', 'test', '3321', '出货导入', '1542593224', '127.0.0.1', '/Mp/Orders/odshipscanres_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201811191006186593\",\"ship_deliver\":0,\"ship_dealer\":\"1\",\"ship_pro\":\"18\",\"ship_odid\":6,\"ship_odblid\":98,\"ship_whid\":7,\"ship_proqty\":\"20\",\"ship_barcode\":\"10000002\",\"ship_date\":1542593224,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"1191\",\"ship_czuser\":\"test\"}', '1');
INSERT INTO `fw_log` VALUES ('2388', '1', 'test', '3321', '经销商账号登录', '1542593280', '127.0.0.1', '/Angels/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2389', '1', 'test', '3321', '经销商出货', '1542593321', '127.0.0.1', '/Angels/Orders/odshipping/step/1/od_id/5/odbl_id/97/oddt_id/5', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201811191004205873\",\"ship_deliver\":\"1\",\"ship_dealer\":\"2\",\"ship_pro\":\"18\",\"ship_odid\":5,\"ship_odblid\":97,\"ship_whid\":null,\"ship_proqty\":\"20\",\"ship_barcode\":10000002,\"ship_date\":1542593321,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":2,\"ship_czid\":\"1\",\"ship_czuser\":\"test\"}', '2');
INSERT INTO `fw_log` VALUES ('2390', '1', 'test', '3321', '经销商账号登录', '1542593533', '127.0.0.1', '/Angels/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2391', '1191', 'test', '3321', '出货导入', '1542593580', '127.0.0.1', '/Mp/Orders/odshipscanres_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201811191012374567\",\"ship_deliver\":0,\"ship_dealer\":\"1\",\"ship_pro\":\"18\",\"ship_odid\":7,\"ship_odblid\":99,\"ship_whid\":7,\"ship_proqty\":\"20\",\"ship_barcode\":\"10000003\",\"ship_date\":1542593579,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"1191\",\"ship_czuser\":\"test\"}', '1');
INSERT INTO `fw_log` VALUES ('2392', '2', '15875872791', '3321', '经销商账号登录', '1542593651', '127.0.0.1', '/Angels/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2393', '1', 'test', '3321', '经销商账号登录', '1542593686', '127.0.0.1', '/Angels/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2394', '1', 'test', '3321', '经销商出货', '1542593802', '127.0.0.1', '/Angels/Orders/odshipping/step/1/od_id/4/odbl_id/96/oddt_id/4', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201811190949215797\",\"ship_deliver\":\"1\",\"ship_dealer\":\"6\",\"ship_pro\":\"18\",\"ship_odid\":4,\"ship_odblid\":96,\"ship_whid\":null,\"ship_proqty\":\"20\",\"ship_barcode\":10000003,\"ship_date\":1542593802,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":2,\"ship_czid\":\"1\",\"ship_czuser\":\"test\"}', '2');
INSERT INTO `fw_log` VALUES ('2395', '1', 'test', '3321', '经销商账号登录', '1542595897', '127.0.0.1', '/Angels/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2396', '1191', 'test', '3321', '出货导入', '1542595960', '127.0.0.1', '/Mp/Orders/odshipscanres_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201811191052145005\",\"ship_deliver\":0,\"ship_dealer\":\"1\",\"ship_pro\":\"18\",\"ship_odid\":9,\"ship_odblid\":101,\"ship_whid\":7,\"ship_proqty\":\"10000\",\"ship_barcode\":\"10000004\",\"ship_date\":1542595960,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"1191\",\"ship_czuser\":\"test\"}', '1');
INSERT INTO `fw_log` VALUES ('2397', '1', 'test', '3321', '经销商出货', '1542596035', '127.0.0.1', '/Angels/Orders/odshipping/step/1/od_id/8/odbl_id/100/oddt_id/8', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201811191050549575\",\"ship_deliver\":\"1\",\"ship_dealer\":\"6\",\"ship_pro\":\"18\",\"ship_odid\":8,\"ship_odblid\":100,\"ship_whid\":null,\"ship_proqty\":\"10000\",\"ship_barcode\":10000004,\"ship_date\":1542596035,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":2,\"ship_czid\":\"1\",\"ship_czuser\":\"test\"}', '2');
INSERT INTO `fw_log` VALUES ('2398', '1', 'test', '3321', '经销商账号登录', '1542596464', '127.0.0.1', '/Angels/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2399', '7', '15875872795', '3321', '代理商注册', '1542596575', '127.0.0.1', '/Angels/Apply/index', '{\"dl_username\":\"15875872795\",\"dl_pwd\":\"6299c582af7ba53fda8c1b769c6cb129\",\"dl_number\":\"\",\"dl_unitcode\":\"3321\",\"dl_name\":\"\\u949f\\u742a5\",\"dl_contact\":\"\\u949f\\u742a5\",\"dl_tel\":\"15875872795\",\"dl_idcard\":\"440804199606160575\",\"dl_idcardpic\":\"\",\"dl_idcardpic2\":\"\",\"dl_tbdian\":\"\",\"dl_tbzhanggui\":\"\",\"dl_addtime\":1542596575,\"dl_status\":0,\"dl_level\":\"2\",\"dl_type\":10,\"dl_sttype\":0,\"dl_belong\":\"1\",\"dl_referee\":\"6\",\"dl_remark\":\"\",\"dl_address\":\"\\u5e7f\\u4e1c\\u5e7f\\u5dde\\u8d8a\\u79c0\\u533a\",\"dl_sheng\":\"11\",\"dl_shi\":\"1129\",\"dl_qu\":\"0\",\"dl_qustr\":\"\\u5317\\u4eac\\u5e02\\u5ef6\\u5e86\\u53bf\",\"dl_openid\":\"\",\"dl_weixin\":\"15875872795\",\"dl_wxnickname\":\"\",\"dl_wxsex\":0,\"dl_wxprovince\":\"\",\"dl_wxcity\":\"\",\"dl_wxcountry\":\"\",\"dl_wxheadimg\":\"\",\"dl_brand\":\"\",\"dl_brandlevel\":\"\"}', '2');
INSERT INTO `fw_log` VALUES ('2400', '7', '15875872795', '3321', '经销商账号登录', '1542596660', '127.0.0.1', '/Angels/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2401', '1', 'test', '3321', '经销商账号登录', '1542596733', '127.0.0.1', '/Angels/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2402', '1191', 'test', '3321', '出货导入', '1542596791', '127.0.0.1', '/Mp/Orders/odshipscanres_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201811191105595814\",\"ship_deliver\":0,\"ship_dealer\":\"1\",\"ship_pro\":\"18\",\"ship_odid\":11,\"ship_odblid\":103,\"ship_whid\":7,\"ship_proqty\":\"10000\",\"ship_barcode\":\"10000005\",\"ship_date\":1542596791,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"1191\",\"ship_czuser\":\"test\"}', '1');
INSERT INTO `fw_log` VALUES ('2403', '1', 'test', '3321', '经销商出货', '1542596828', '127.0.0.1', '/Angels/Orders/odshipping/step/1/od_id/10/odbl_id/102/oddt_id/10', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201811191104427941\",\"ship_deliver\":\"1\",\"ship_dealer\":\"7\",\"ship_pro\":\"18\",\"ship_odid\":10,\"ship_odblid\":102,\"ship_whid\":null,\"ship_proqty\":\"10000\",\"ship_barcode\":10000005,\"ship_date\":1542596827,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":2,\"ship_czid\":\"1\",\"ship_czuser\":\"test\"}', '2');
INSERT INTO `fw_log` VALUES ('2404', '8', '15875872796', '3321', '代理商注册', '1542597163', '127.0.0.1', '/Angels/Apply/index', '{\"dl_username\":\"15875872796\",\"dl_pwd\":\"531440891208d2c680f05d04aa42a247\",\"dl_number\":\"\",\"dl_unitcode\":\"3321\",\"dl_name\":\"\\u949f\\u742a6\",\"dl_contact\":\"\\u949f\\u742a6\",\"dl_tel\":\"15875872796\",\"dl_idcard\":\"440804199606160576\",\"dl_idcardpic\":\"\",\"dl_idcardpic2\":\"\",\"dl_tbdian\":\"\",\"dl_tbzhanggui\":\"\",\"dl_addtime\":1542597162,\"dl_status\":0,\"dl_level\":\"1\",\"dl_type\":9,\"dl_sttype\":0,\"dl_belong\":0,\"dl_referee\":\"7\",\"dl_remark\":\"\",\"dl_address\":\"\\u5929\\u6d25\\u5e02\\u84df\\u53bf\",\"dl_sheng\":\"12\",\"dl_shi\":\"1225\",\"dl_qu\":\"0\",\"dl_qustr\":\"\\u5929\\u6d25\\u5e02\\u84df\\u53bf\",\"dl_openid\":\"\",\"dl_weixin\":\"15875872796\",\"dl_wxnickname\":\"\",\"dl_wxsex\":0,\"dl_wxprovince\":\"\",\"dl_wxcity\":\"\",\"dl_wxcountry\":\"\",\"dl_wxheadimg\":\"\",\"dl_brand\":\"\",\"dl_brandlevel\":\"\"}', '2');
INSERT INTO `fw_log` VALUES ('2405', '8', '15875872796', '3321', '经销商账号登录', '1542597226', '127.0.0.1', '/Angels/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2406', '1191', 'test', '3321', '出货导入', '1542597289', '127.0.0.1', '/Mp/Orders/odshipscanres_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201811191114031904\",\"ship_deliver\":0,\"ship_dealer\":\"8\",\"ship_pro\":\"18\",\"ship_odid\":12,\"ship_odblid\":104,\"ship_whid\":7,\"ship_proqty\":\"10000\",\"ship_barcode\":\"10000006\",\"ship_date\":1542597289,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"1191\",\"ship_czuser\":\"test\"}', '1');
INSERT INTO `fw_log` VALUES ('2407', '1191', 'test', '3321', '出货导入', '1542597584', '127.0.0.1', '/Mp/Orders/odshipscanres_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201811191119115980\",\"ship_deliver\":0,\"ship_dealer\":\"8\",\"ship_pro\":\"18\",\"ship_odid\":13,\"ship_odblid\":105,\"ship_whid\":7,\"ship_proqty\":\"10000\",\"ship_barcode\":\"10000006\",\"ship_date\":1542597584,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"1191\",\"ship_czuser\":\"test\"}', '1');
INSERT INTO `fw_log` VALUES ('2408', '1191', 'test', '3321', '出货导入', '1542598393', '127.0.0.1', '/Mp/Orders/odshipscanres_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201811191131554860\",\"ship_deliver\":0,\"ship_dealer\":\"8\",\"ship_pro\":\"18\",\"ship_odid\":14,\"ship_odblid\":106,\"ship_whid\":7,\"ship_proqty\":\"10000\",\"ship_barcode\":\"10000007\",\"ship_date\":1542598393,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"1191\",\"ship_czuser\":\"test\"}', '1');
INSERT INTO `fw_log` VALUES ('2409', '9', '15875872797', '3321', '代理商注册', '1542598630', '127.0.0.1', '/Angels/Apply/index', '{\"dl_username\":\"15875872797\",\"dl_pwd\":\"a9048d4e8ad193f03ad47e57772a7fcc\",\"dl_number\":\"\",\"dl_unitcode\":\"3321\",\"dl_name\":\"\\u949f\\u742a7\",\"dl_contact\":\"\\u949f\\u742a7\",\"dl_tel\":\"15875872797\",\"dl_idcard\":\"440804199606160597\",\"dl_idcardpic\":\"\",\"dl_idcardpic2\":\"\",\"dl_tbdian\":\"\",\"dl_tbzhanggui\":\"\",\"dl_addtime\":1542598630,\"dl_status\":0,\"dl_level\":\"3\",\"dl_type\":11,\"dl_sttype\":0,\"dl_belong\":\"8\",\"dl_referee\":\"8\",\"dl_remark\":\"\",\"dl_address\":\"\\u5317\\u4eac\\u5e02\\u5ef6\\u5e86\\u53bf\",\"dl_sheng\":\"11\",\"dl_shi\":\"1129\",\"dl_qu\":\"0\",\"dl_qustr\":\"\\u5317\\u4eac\\u5e02\\u5ef6\\u5e86\\u53bf\",\"dl_openid\":\"\",\"dl_weixin\":\"15875872797\",\"dl_wxnickname\":\"\",\"dl_wxsex\":0,\"dl_wxprovince\":\"\",\"dl_wxcity\":\"\",\"dl_wxcountry\":\"\",\"dl_wxheadimg\":\"\",\"dl_brand\":\"\",\"dl_brandlevel\":\"\"}', '2');
INSERT INTO `fw_log` VALUES ('2410', '10', '15875872798', '3321', '代理商注册', '1542598949', '127.0.0.1', '/Angels/Apply/index', '{\"dl_username\":\"15875872798\",\"dl_pwd\":\"d39becd200e9e636bd140220b176868f\",\"dl_number\":\"\",\"dl_unitcode\":\"3321\",\"dl_name\":\"\\u949f\\u742a8\",\"dl_contact\":\"\\u949f\\u742a8\",\"dl_tel\":\"15875872798\",\"dl_idcard\":\"440804199606160578\",\"dl_idcardpic\":\"\",\"dl_idcardpic2\":\"\",\"dl_tbdian\":\"\",\"dl_tbzhanggui\":\"\",\"dl_addtime\":1542598949,\"dl_status\":0,\"dl_level\":\"2\",\"dl_type\":10,\"dl_sttype\":0,\"dl_belong\":\"8\",\"dl_referee\":\"9\",\"dl_remark\":\"\",\"dl_address\":\"\\u5929\\u6d25\\u5e02\\u84df\\u53bf\",\"dl_sheng\":\"12\",\"dl_shi\":\"1225\",\"dl_qu\":\"0\",\"dl_qustr\":\"\\u5929\\u6d25\\u5e02\\u84df\\u53bf\",\"dl_openid\":\"\",\"dl_weixin\":\"15875872798\",\"dl_wxnickname\":\"\",\"dl_wxsex\":0,\"dl_wxprovince\":\"\",\"dl_wxcity\":\"\",\"dl_wxcountry\":\"\",\"dl_wxheadimg\":\"\",\"dl_brand\":\"\",\"dl_brandlevel\":\"\"}', '2');
INSERT INTO `fw_log` VALUES ('2411', '10', '15875872798', '3321', '经销商账号登录', '1542598995', '127.0.0.1', '/Angels/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2412', '1191', 'test', '3321', '出货导入', '1542599212', '127.0.0.1', '/Mp/Orders/odshipscanres_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201811191146294221\",\"ship_deliver\":0,\"ship_dealer\":\"8\",\"ship_pro\":\"18\",\"ship_odid\":16,\"ship_odblid\":108,\"ship_whid\":7,\"ship_proqty\":\"10000\",\"ship_barcode\":\"10000008\",\"ship_date\":1542599211,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"1191\",\"ship_czuser\":\"test\"}', '1');
INSERT INTO `fw_log` VALUES ('2413', '8', '15875872796', '3321', '经销商出货', '1542599250', '127.0.0.1', '/Angels/Orders/odshipping/step/1/od_id/15/odbl_id/107/oddt_id/15', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201811191143319278\",\"ship_deliver\":\"8\",\"ship_dealer\":\"10\",\"ship_pro\":\"18\",\"ship_odid\":15,\"ship_odblid\":107,\"ship_whid\":null,\"ship_proqty\":\"10000\",\"ship_barcode\":10000008,\"ship_date\":1542599250,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":2,\"ship_czid\":\"8\",\"ship_czuser\":\"15875872796\"}', '2');
INSERT INTO `fw_log` VALUES ('2414', '11', '15875872799', '3321', '代理商注册', '1542599693', '127.0.0.1', '/Angels/Apply/index', '{\"dl_username\":\"15875872799\",\"dl_pwd\":\"2523aa43222f38f037ea7a2ace4c3d75\",\"dl_number\":\"\",\"dl_unitcode\":\"3321\",\"dl_name\":\"\\u949f\\u742a9\",\"dl_contact\":\"\\u949f\\u742a9\",\"dl_tel\":\"15875872799\",\"dl_idcard\":\"440804199606160579\",\"dl_idcardpic\":\"\",\"dl_idcardpic2\":\"\",\"dl_tbdian\":\"\",\"dl_tbzhanggui\":\"\",\"dl_addtime\":1542599693,\"dl_status\":0,\"dl_level\":\"2\",\"dl_type\":10,\"dl_sttype\":0,\"dl_belong\":\"8\",\"dl_referee\":\"9\",\"dl_remark\":\"\",\"dl_address\":\"\\u5317\\u4eac\\u5e02\\u5ef6\\u5e86\\u53bf\",\"dl_sheng\":\"11\",\"dl_shi\":\"1129\",\"dl_qu\":\"0\",\"dl_qustr\":\"\\u5317\\u4eac\\u5e02\\u5ef6\\u5e86\\u53bf\",\"dl_openid\":\"\",\"dl_weixin\":\"15875872799\",\"dl_wxnickname\":\"\",\"dl_wxsex\":0,\"dl_wxprovince\":\"\",\"dl_wxcity\":\"\",\"dl_wxcountry\":\"\",\"dl_wxheadimg\":\"\",\"dl_brand\":\"\",\"dl_brandlevel\":\"\"}', '2');
INSERT INTO `fw_log` VALUES ('2415', '11', '15875872799', '3321', '经销商账号登录', '1542599736', '127.0.0.1', '/Angels/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2416', '11', '15875872799', '3321', '经销商账号登录', '1542599743', '127.0.0.1', '/Angels/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2417', '1191', 'test', '3321', '出货导入', '1542599810', '127.0.0.1', '/Mp/Orders/odshipscanres_save', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201811191156252104\",\"ship_deliver\":0,\"ship_dealer\":\"8\",\"ship_pro\":\"18\",\"ship_odid\":18,\"ship_odblid\":110,\"ship_whid\":7,\"ship_proqty\":\"10000\",\"ship_barcode\":\"10000009\",\"ship_date\":1542599810,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"1191\",\"ship_czuser\":\"test\"}', '1');
INSERT INTO `fw_log` VALUES ('2418', '8', '15875872796', '3321', '经销商出货', '1542599916', '127.0.0.1', '/Angels/Orders/odshipping/step/1/od_id/17/odbl_id/109/oddt_id/17', '{\"ship_unitcode\":\"3321\",\"ship_number\":\"201811191155579250\",\"ship_deliver\":\"8\",\"ship_dealer\":\"11\",\"ship_pro\":\"18\",\"ship_odid\":17,\"ship_odblid\":109,\"ship_whid\":null,\"ship_proqty\":\"10000\",\"ship_barcode\":10000009,\"ship_date\":1542599915,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":2,\"ship_czid\":\"8\",\"ship_czuser\":\"15875872796\"}', '2');

-- ----------------------------
-- Table structure for fw_orderbelong
-- ----------------------------
DROP TABLE IF EXISTS `fw_orderbelong`;
CREATE TABLE `fw_orderbelong` (
  `odbl_id` int(11) NOT NULL AUTO_INCREMENT,
  `odbl_unitcode` varchar(32) DEFAULT NULL,
  `odbl_odid` int(11) DEFAULT '0' COMMENT '对应订单id',
  `odbl_orderid` varchar(32) DEFAULT NULL,
  `odbl_total` decimal(10,2) DEFAULT '0.00' COMMENT '转上家的订单金额',
  `odbl_oddlid` int(11) DEFAULT '0' COMMENT '下单代理id',
  `odbl_rcdlid` int(11) DEFAULT '0' COMMENT '接单代理id',
  `odbl_paypic` varchar(32) DEFAULT NULL COMMENT '凭证图片',
  `odbl_remark` varchar(512) DEFAULT NULL COMMENT '备注',
  `odbl_addtime` int(11) DEFAULT '0' COMMENT '下单时间',
  `odbl_belongship` int(11) DEFAULT '0' COMMENT '是否转上家',
  `odbl_state` int(11) DEFAULT '0' COMMENT '订单状态',
  PRIMARY KEY (`odbl_id`),
  KEY `odbl_unitcode` (`odbl_unitcode`),
  KEY `odbl_odid` (`odbl_odid`),
  KEY `odbl_oddlid` (`odbl_oddlid`)
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='订单关系表';

-- ----------------------------
-- Records of fw_orderbelong
-- ----------------------------
INSERT INTO `fw_orderbelong` VALUES ('62', '3321', '62', '201807241953052656', '21000.00', '69', '0', '3321/5b57131dcd2895276.jpeg', '', '1532433185', '0', '8');
INSERT INTO `fw_orderbelong` VALUES ('63', '3321', '63', '201807242007324812', '4200.00', '70', '0', '3321/5b5716814a1346690.jpeg', '', '1532434052', '0', '8');
INSERT INTO `fw_orderbelong` VALUES ('64', '3321', '64', '201807251443255582', '4200.00', '67', '0', null, '', '1532501005', '0', '8');
INSERT INTO `fw_orderbelong` VALUES ('66', '3321', '66', '201807251730203205', '4200.00', '67', '0', null, '', '1532511020', '0', '8');
INSERT INTO `fw_orderbelong` VALUES ('67', '3321', '67', '201807251929129517', '50400.00', '71', '0', null, '', '1532518152', '0', '8');
INSERT INTO `fw_orderbelong` VALUES ('69', '3321', '69', '201807271923238689', '29400.00', '69', '0', null, '', '1532690603', '0', '0');
INSERT INTO `fw_orderbelong` VALUES ('70', '3321', '70', '201807271923248445', '46200.00', '70', '0', null, '', '1532690604', '0', '0');
INSERT INTO `fw_orderbelong` VALUES ('71', '3321', '71', '201807281613095782', '4200.00', '66', '0', null, '', '1532765589', '0', '8');
INSERT INTO `fw_orderbelong` VALUES ('73', '3321', '73', '201807311617516933', '6300.00', '66', '0', null, '', '1533025071', '0', '8');
INSERT INTO `fw_orderbelong` VALUES ('74', '3321', '74', '201808061103557802', '3040.00', '73', '66', null, '', '1533524635', '0', '8');
INSERT INTO `fw_orderbelong` VALUES ('75', '3321', '75', '201808061109098476', '3040.00', '74', '66', null, '', '1533524949', '0', '8');
INSERT INTO `fw_orderbelong` VALUES ('76', '3321', '76', '201808061109452463', '4200.00', '66', '0', null, '', '1533524985', '0', '8');
INSERT INTO `fw_orderbelong` VALUES ('77', '3321', '77', '201808061538594824', '2100.00', '66', '0', null, '', '1533541139', '0', '8');
INSERT INTO `fw_orderbelong` VALUES ('78', '3321', '78', '201808071619103907', '12600.00', '66', '0', null, '', '1533629950', '0', '8');
INSERT INTO `fw_orderbelong` VALUES ('79', '3321', '79', '201808101539287844', '2100.00', '66', '0', null, '', '1533886768', '0', '8');
INSERT INTO `fw_orderbelong` VALUES ('80', '3321', '80', '201808111425285680', '2100.00', '66', '0', null, '', '1533968728', '0', '8');
INSERT INTO `fw_orderbelong` VALUES ('81', '3321', '81', '201808131530472213', '18900.00', '66', '0', null, '', '1534145447', '0', '8');
INSERT INTO `fw_orderbelong` VALUES ('82', '3321', '82', '201808131632506621', '16000.00', '76', '0', null, '', '1534149170', '0', '8');
INSERT INTO `fw_orderbelong` VALUES ('83', '3321', '83', '201808181633273684', '8000.00', '66', '0', null, '', '1534581207', '0', '8');
INSERT INTO `fw_orderbelong` VALUES ('84', '3321', '84', '201809051405111285', '6000.00', '66', '0', null, '', '1536127511', '0', '8');
INSERT INTO `fw_orderbelong` VALUES ('85', '3321', '85', '201809141152483931', '8000.00', '66', '0', null, '', '1536897168', '0', '8');
INSERT INTO `fw_orderbelong` VALUES ('86', '3321', '86', '201810161600533437', '4000.00', '66', '0', null, '', '1539676853', '0', '8');
INSERT INTO `fw_orderbelong` VALUES ('89', '3321', '89', '201810201504597994', '14256.00', '66', '0', null, '', '1540019099', '0', '8');
INSERT INTO `fw_orderbelong` VALUES ('90', '3321', '90', '201810201511006482', '3888.00', '69', '0', null, '', '1540019460', '0', '8');
INSERT INTO `fw_orderbelong` VALUES ('91', '3321', '91', '201810231832399388', '2592.00', '69', '0', null, '', '1540290759', '0', '8');
INSERT INTO `fw_orderbelong` VALUES ('92', '3321', '92', '201811061956401778', '17400.00', '74', '66', '3321/5be18170845d55674.jpeg', '', '1541505400', '0', '1');
INSERT INTO `fw_orderbelong` VALUES ('93', '3321', '1', '201811190929022418', '300000.00', '3', '0', null, '哈哈', '1542590942', '0', '3');
INSERT INTO `fw_orderbelong` VALUES ('94', '3321', '2', '201811190934308526', '400000.00', '4', '0', null, '', '1542591270', '0', '3');
INSERT INTO `fw_orderbelong` VALUES ('95', '3321', '3', '201811190943048496', '100000.00', '5', '1', null, '', '1542591784', '0', '0');
INSERT INTO `fw_orderbelong` VALUES ('96', '3321', '4', '201811190949215797', '100000.00', '6', '1', null, '', '1542592161', '0', '1');
INSERT INTO `fw_orderbelong` VALUES ('97', '3321', '5', '201811191004205873', '1000000.00', '2', '1', null, '', '1542593060', '0', '1');
INSERT INTO `fw_orderbelong` VALUES ('98', '3321', '6', '201811191006186593', '1000000.00', '1', '0', null, '', '1542593178', '0', '3');
INSERT INTO `fw_orderbelong` VALUES ('99', '3321', '7', '201811191012374567', '2000.00', '1', '0', null, '', '1542593557', '0', '3');
INSERT INTO `fw_orderbelong` VALUES ('100', '3321', '8', '201811191050549575', '1000000.00', '6', '1', null, '', '1542595854', '0', '3');
INSERT INTO `fw_orderbelong` VALUES ('101', '3321', '9', '201811191052145005', '1000000.00', '1', '0', null, '', '1542595934', '0', '8');
INSERT INTO `fw_orderbelong` VALUES ('102', '3321', '10', '201811191104427941', '1000000.00', '7', '1', null, '', '1542596682', '0', '3');
INSERT INTO `fw_orderbelong` VALUES ('103', '3321', '11', '201811191105595814', '1000000.00', '1', '0', null, '', '1542596759', '0', '3');
INSERT INTO `fw_orderbelong` VALUES ('104', '3321', '12', '201811191114031904', '1000000.00', '8', '0', null, '', '1542597243', '0', '3');
INSERT INTO `fw_orderbelong` VALUES ('105', '3321', '13', '201811191119115980', '1000000.00', '8', '0', null, '', '1542597551', '0', '3');
INSERT INTO `fw_orderbelong` VALUES ('106', '3321', '14', '201811191131554860', '1000000.00', '8', '0', '3321/5bf24363f20d3468.jpeg', '', '1542598315', '0', '3');
INSERT INTO `fw_orderbelong` VALUES ('107', '3321', '15', '201811191143319278', '1000000.00', '10', '8', null, '', '1542599011', '0', '3');
INSERT INTO `fw_orderbelong` VALUES ('108', '3321', '16', '201811191146294221', '1000000.00', '8', '0', null, '', '1542599189', '0', '3');
INSERT INTO `fw_orderbelong` VALUES ('109', '3321', '17', '201811191155579250', '1000000.00', '11', '8', null, '', '1542599757', '0', '3');
INSERT INTO `fw_orderbelong` VALUES ('110', '3321', '18', '201811191156252104', '1000000.00', '8', '0', null, '', '1542599785', '0', '3');
INSERT INTO `fw_orderbelong` VALUES ('111', '3321', '19', '201811191306452615', '100.00', '8', '0', '3321/5bf244e3dbd314159.jpeg', '', '1542604005', '0', '0');
INSERT INTO `fw_orderbelong` VALUES ('112', '3321', '20', '201811191307135263', '100.00', '8', '0', '3321/5bf245073a73f946.jpeg', '', '1542604033', '0', '0');
INSERT INTO `fw_orderbelong` VALUES ('113', '3321', '21', '201811191308217400', '100.00', '8', '0', '3321/5bf24588517ee205.jpeg', '', '1542604101', '0', '0');
INSERT INTO `fw_orderbelong` VALUES ('114', '3321', '22', '201811191311024501', '100.00', '8', '0', '3321/5bf245e5beb5f4289.jpeg', '', '1542604262', '0', '0');
INSERT INTO `fw_orderbelong` VALUES ('115', '3321', '23', '201811191311237035', '100.00', '8', '0', '3321/5bf2460ac16cc322.jpeg', '', '1542604283', '0', '0');

-- ----------------------------
-- Table structure for fw_orderdetail
-- ----------------------------
DROP TABLE IF EXISTS `fw_orderdetail`;
CREATE TABLE `fw_orderdetail` (
  `oddt_id` int(11) NOT NULL AUTO_INCREMENT,
  `oddt_unitcode` varchar(32) DEFAULT NULL,
  `oddt_odid` int(11) DEFAULT '0' COMMENT '对应订单id',
  `oddt_orderid` varchar(32) DEFAULT NULL,
  `oddt_odblid` int(11) DEFAULT '0' COMMENT '订单关系的id',
  `oddt_proid` int(11) DEFAULT '0' COMMENT '产品id',
  `oddt_proname` varchar(64) DEFAULT NULL COMMENT '产品名称',
  `oddt_pronumber` varchar(32) DEFAULT NULL COMMENT '产品编号',
  `oddt_prounits` varchar(32) DEFAULT NULL COMMENT '产品单位',
  `oddt_prodbiao` int(11) DEFAULT '0' COMMENT '产品包装比例大标',
  `oddt_prozbiao` int(11) DEFAULT '0' COMMENT '产品包装比例中标',
  `oddt_proxbiao` int(11) DEFAULT '0' COMMENT '产品包装比例小标',
  `oddt_price` decimal(10,2) DEFAULT '0.00' COMMENT '原零售价格',
  `oddt_dlprice` decimal(10,2) DEFAULT '0.00' COMMENT '成交价格',
  `oddt_qty` int(11) DEFAULT '0' COMMENT '下单数量',
  PRIMARY KEY (`oddt_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='订单详细表';

-- ----------------------------
-- Records of fw_orderdetail
-- ----------------------------
INSERT INTO `fw_orderdetail` VALUES ('1', '3321', '1', '201811190929022418', '93', '18', '即食燕窝', '00001', '盒', '0', '0', '0', '100.00', '100.00', '3000');
INSERT INTO `fw_orderdetail` VALUES ('2', '3321', '2', '201811190934308526', '94', '19', '中毛燕盏', '00002', '盒', '0', '0', '0', '100.00', '100.00', '4000');
INSERT INTO `fw_orderdetail` VALUES ('3', '3321', '3', '201811190943048496', '95', '18', '即食燕窝', '00001', '盒', '0', '0', '0', '100.00', '100.00', '1000');
INSERT INTO `fw_orderdetail` VALUES ('4', '3321', '4', '201811190949215797', '96', '18', '即食燕窝', '00001', '盒', '0', '0', '0', '100.00', '100.00', '1000');
INSERT INTO `fw_orderdetail` VALUES ('5', '3321', '5', '201811191004205873', '97', '18', '即食燕窝', '00001', '盒', '0', '0', '0', '100.00', '100.00', '10000');
INSERT INTO `fw_orderdetail` VALUES ('6', '3321', '6', '201811191006186593', '98', '18', '即食燕窝', '00001', '盒', '0', '0', '0', '100.00', '100.00', '10000');
INSERT INTO `fw_orderdetail` VALUES ('7', '3321', '7', '201811191012374567', '99', '18', '即食燕窝', '00001', '盒', '0', '0', '0', '100.00', '100.00', '20');
INSERT INTO `fw_orderdetail` VALUES ('8', '3321', '8', '201811191050549575', '100', '18', '即食燕窝', '00001', '盒', '0', '0', '0', '100.00', '100.00', '10000');
INSERT INTO `fw_orderdetail` VALUES ('9', '3321', '9', '201811191052145005', '101', '18', '即食燕窝', '00001', '盒', '0', '0', '0', '100.00', '100.00', '10000');
INSERT INTO `fw_orderdetail` VALUES ('10', '3321', '10', '201811191104427941', '102', '18', '即食燕窝', '00001', '盒', '0', '0', '0', '100.00', '100.00', '10000');
INSERT INTO `fw_orderdetail` VALUES ('11', '3321', '11', '201811191105595814', '103', '18', '即食燕窝', '00001', '盒', '0', '0', '0', '100.00', '100.00', '10000');
INSERT INTO `fw_orderdetail` VALUES ('12', '3321', '12', '201811191114031904', '104', '18', '即食燕窝', '00001', '盒', '0', '0', '0', '100.00', '100.00', '10000');
INSERT INTO `fw_orderdetail` VALUES ('13', '3321', '13', '201811191119115980', '105', '18', '即食燕窝', '00001', '盒', '0', '0', '0', '100.00', '100.00', '10000');
INSERT INTO `fw_orderdetail` VALUES ('14', '3321', '14', '201811191131554860', '106', '18', '即食燕窝', '00001', '盒', '0', '0', '0', '100.00', '100.00', '10000');
INSERT INTO `fw_orderdetail` VALUES ('15', '3321', '15', '201811191143319278', '107', '18', '即食燕窝', '00001', '盒', '0', '0', '0', '100.00', '100.00', '10000');
INSERT INTO `fw_orderdetail` VALUES ('16', '3321', '16', '201811191146294221', '108', '18', '即食燕窝', '00001', '盒', '0', '0', '0', '100.00', '100.00', '10000');
INSERT INTO `fw_orderdetail` VALUES ('17', '3321', '17', '201811191155579250', '109', '18', '即食燕窝', '00001', '盒', '0', '0', '0', '100.00', '100.00', '10000');
INSERT INTO `fw_orderdetail` VALUES ('18', '3321', '18', '201811191156252104', '110', '18', '即食燕窝', '00001', '盒', '0', '0', '0', '100.00', '100.00', '10000');
INSERT INTO `fw_orderdetail` VALUES ('19', '3321', '19', '201811191306452615', '111', '18', '即食燕窝', '00001', '盒', '0', '0', '0', '100.00', '100.00', '1');
INSERT INTO `fw_orderdetail` VALUES ('20', '3321', '20', '201811191307135263', '112', '18', '即食燕窝', '00001', '盒', '0', '0', '0', '100.00', '100.00', '1');
INSERT INTO `fw_orderdetail` VALUES ('21', '3321', '21', '201811191308217400', '113', '18', '即食燕窝', '00001', '盒', '0', '0', '0', '100.00', '100.00', '1');
INSERT INTO `fw_orderdetail` VALUES ('22', '3321', '22', '201811191311024501', '114', '18', '即食燕窝', '00001', '盒', '0', '0', '0', '100.00', '100.00', '1');
INSERT INTO `fw_orderdetail` VALUES ('23', '3321', '23', '201811191311237035', '115', '18', '即食燕窝', '00001', '盒', '0', '0', '0', '100.00', '100.00', '1');

-- ----------------------------
-- Table structure for fw_orderlogs
-- ----------------------------
DROP TABLE IF EXISTS `fw_orderlogs`;
CREATE TABLE `fw_orderlogs` (
  `odlg_id` int(11) NOT NULL AUTO_INCREMENT,
  `odlg_unitcode` varchar(32) DEFAULT NULL,
  `odlg_odid` int(11) DEFAULT '0' COMMENT '对应订单id',
  `odlg_orderid` varchar(32) DEFAULT NULL COMMENT '对应订单号',
  `odlg_type` int(11) DEFAULT '0' COMMENT '0-公司操作 1-代理操作',
  `odlg_dlid` int(11) DEFAULT NULL COMMENT '操作id',
  `odlg_dlusername` varchar(32) DEFAULT NULL COMMENT '操作用户名',
  `odlg_dlname` varchar(32) DEFAULT NULL COMMENT '操作人',
  `odlg_action` varchar(64) DEFAULT NULL COMMENT '动作',
  `odlg_addtime` int(11) DEFAULT '0' COMMENT '操作时间',
  `odlg_link` varchar(256) DEFAULT NULL COMMENT '操作链接',
  `odlg_ip` varchar(32) DEFAULT NULL COMMENT '操作IP',
  PRIMARY KEY (`odlg_id`),
  KEY `odlg_unitcode` (`odlg_unitcode`)
) ENGINE=InnoDB AUTO_INCREMENT=356 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='订单操作日志';

-- ----------------------------
-- Records of fw_orderlogs
-- ----------------------------
INSERT INTO `fw_orderlogs` VALUES ('215', '3321', '62', '201807241953052656', '1', '69', '15365423666', '英少柏', '创建订单', '1532433185', '/baiman/orders/submitorders', '49.90.57.189');
INSERT INTO `fw_orderlogs` VALUES ('216', '3321', '62', '201807241953052656', '0', '8', 'yunmei:chuku', 'yunmei:chuku', '确认订单', '1532433222', '/zxapi/order/canceldlorder', '49.95.126.187');
INSERT INTO `fw_orderlogs` VALUES ('217', '3321', '63', '201807242007324812', '1', '70', '15862222202', '杨尚', '创建订单', '1532434052', '/baiman/orders/submitorders', '122.96.41.224');
INSERT INTO `fw_orderlogs` VALUES ('218', '3321', '63', '201807242007324812', '0', '8', 'yunmei:chuku', 'yunmei:chuku', '确认订单', '1532434075', '/zxapi/order/canceldlorder', '49.95.126.187');
INSERT INTO `fw_orderlogs` VALUES ('219', '3321', '64', '201807251443255582', '1', '67', '13636393523', '马小倩', '创建订单', '1532501005', '/baiman/orders/submitorders', '180.123.221.203');
INSERT INTO `fw_orderlogs` VALUES ('220', '3321', '64', '201807251443255582', '0', '8', 'yunmei:chuku', 'yunmei:chuku', '确认订单', '1532501034', '/zxapi/order/canceldlorder', '180.123.221.203');
INSERT INTO `fw_orderlogs` VALUES ('221', '3321', '62', '201807241953052656', '1', '69', '15365423666', '英少柏', '确认收货', '1532501045', '/baiman/orders/confirmreceipt/od_id/62/od_state/3', '49.90.57.189');
INSERT INTO `fw_orderlogs` VALUES ('224', '3321', '66', '201807251730203205', '1', '67', '13636393523', '马小倩', '创建订单', '1532511020', '/baiman/orders/submitorders', '180.123.221.203');
INSERT INTO `fw_orderlogs` VALUES ('225', '3321', '66', '201807251730203205', '0', '8', 'yunmei:chuku', 'yunmei:chuku', '确认订单', '1532511036', '/zxapi/order/canceldlorder', '180.123.221.203');
INSERT INTO `fw_orderlogs` VALUES ('226', '3321', '67', '201807251929129517', '1', '71', '15298791234', '胡东', '创建订单', '1532518152', '/baiman/orders/submitorders', '117.136.46.142');
INSERT INTO `fw_orderlogs` VALUES ('227', '3321', '67', '201807251929129517', '0', '8', 'yunmei:chuku', 'yunmei:chuku', '确认订单', '1532518223', '/zxapi/order/canceldlorder', '180.123.221.203');
INSERT INTO `fw_orderlogs` VALUES ('230', '3321', '69', '201807271923238689', '1', '69', '15365423666', '英少柏', '创建订单', '1532690603', '/baiman/orders/submitorders', '49.90.57.189');
INSERT INTO `fw_orderlogs` VALUES ('231', '3321', '70', '201807271923248445', '1', '70', '15862222202', '杨尚', '创建订单', '1532690604', '/baiman/orders/submitorders', '122.96.42.221');
INSERT INTO `fw_orderlogs` VALUES ('232', '3321', '70', '201807271923248445', '0', '8', 'yunmei:chuku', 'yunmei:chuku', '确认订单', '1532690626', '/zxapi/order/canceldlorder', '49.90.139.28');
INSERT INTO `fw_orderlogs` VALUES ('233', '3321', '69', '201807271923238689', '0', '8', 'yunmei:chuku', 'yunmei:chuku', '确认订单', '1532690628', '/zxapi/order/canceldlorder', '49.90.139.28');
INSERT INTO `fw_orderlogs` VALUES ('234', '3321', '71', '201807281613095782', '1', '66', '654081', '石瑶瑶', '创建订单', '1532765589', '/baiman/orders/submitorders', '117.136.68.223');
INSERT INTO `fw_orderlogs` VALUES ('235', '3321', '71', '201807281613095782', '0', '8', 'yunmei:chuku', 'yunmei:chuku', '确认订单', '1532765618', '/zxapi/order/canceldlorder', '180.123.222.60');
INSERT INTO `fw_orderlogs` VALUES ('239', '3321', '73', '201807311617516933', '1', '66', '654081', '石瑶瑶', '创建订单', '1533025071', '/baiman/orders/submitorders', '180.123.223.56');
INSERT INTO `fw_orderlogs` VALUES ('240', '3321', '73', '201807311617516933', '0', '8', 'yunmei:chuku', 'yunmei:chuku', '确认订单', '1533025095', '/zxapi/order/canceldlorder', '180.123.223.56');
INSERT INTO `fw_orderlogs` VALUES ('241', '3321', '74', '201808061103557802', '1', '73', 'tzwl588', '王莉', '创建订单', '1533524635', '/baiman/orders/submitorders', '122.194.88.150');
INSERT INTO `fw_orderlogs` VALUES ('242', '3321', '74', '201808061103557802', '1', '66', '654081', '石瑶瑶', '确认订单', '1533524942', '/baiman/orders/canceldlorder/state/1/od_id/74/odbl_id/74/od_state/0', '180.123.223.131');
INSERT INTO `fw_orderlogs` VALUES ('243', '3321', '75', '201808061109098476', '1', '74', '13395253609', '戴言', '创建订单', '1533524949', '/baiman/orders/submitorders', '49.81.118.121');
INSERT INTO `fw_orderlogs` VALUES ('244', '3321', '76', '201808061109452463', '1', '66', '654081', '石瑶瑶', '创建订单', '1533524985', '/baiman/orders/submitorders', '180.123.223.131');
INSERT INTO `fw_orderlogs` VALUES ('245', '3321', '75', '201808061109098476', '1', '66', '654081', '石瑶瑶', '确认订单', '1533525065', '/baiman/orders/canceldlorder/state/1/od_id/75/odbl_id/75/od_state/0', '180.123.223.131');
INSERT INTO `fw_orderlogs` VALUES ('246', '3321', '76', '201808061109452463', '0', '1191', 'yunmei', 'yunmei', '确认订单', '1533525149', '/mp/orders/cancelorder/state/1/od_id/76/odbl_id/76', '180.123.223.131');
INSERT INTO `fw_orderlogs` VALUES ('247', '3321', '77', '201808061538594824', '1', '66', '654081', '石瑶瑶', '创建订单', '1533541139', '/baiman/orders/submitorders', '180.123.223.131');
INSERT INTO `fw_orderlogs` VALUES ('248', '3321', '77', '201808061538594824', '0', '8', 'yunmei:chuku', 'yunmei:chuku', '确认订单', '1533541153', '/zxapi/order/canceldlorder', '180.123.223.131');
INSERT INTO `fw_orderlogs` VALUES ('249', '3321', '78', '201808071619103907', '1', '66', '654081', '石瑶瑶', '创建订单', '1533629950', '/baiman/orders/submitorders', '180.124.222.98');
INSERT INTO `fw_orderlogs` VALUES ('250', '3321', '78', '201808071619103907', '0', '8', 'yunmei:chuku', 'yunmei:chuku', '确认订单', '1533629974', '/zxapi/order/canceldlorder', '180.124.222.98');
INSERT INTO `fw_orderlogs` VALUES ('251', '3321', '79', '201808101539287844', '1', '66', '654081', '石瑶瑶', '创建订单', '1533886768', '/baiman/orders/submitorders', '180.123.221.157');
INSERT INTO `fw_orderlogs` VALUES ('252', '3321', '79', '201808101539287844', '0', '8', 'yunmei:chuku', 'yunmei:chuku', '确认订单', '1533886796', '/zxapi/order/canceldlorder', '180.123.221.157');
INSERT INTO `fw_orderlogs` VALUES ('253', '3321', '63', '201807242007324812', '0', '0', '', '', '系统确认收货', '1533886989', '/mp/index/index', '180.123.221.157');
INSERT INTO `fw_orderlogs` VALUES ('254', '3321', '64', '201807251443255582', '0', '0', '', '', '系统确认收货', '1533886989', '/mp/index/index', '180.123.221.157');
INSERT INTO `fw_orderlogs` VALUES ('255', '3321', '66', '201807251730203205', '0', '0', '', '', '系统确认收货', '1533886989', '/mp/index/index', '180.123.221.157');
INSERT INTO `fw_orderlogs` VALUES ('256', '3321', '80', '201808111425285680', '1', '66', '654081', '石瑶瑶', '创建订单', '1533968728', '/baiman/orders/submitorders', '180.123.221.216');
INSERT INTO `fw_orderlogs` VALUES ('257', '3321', '80', '201808111425285680', '0', '1191', 'yunmei', 'yunmei', '确认订单', '1533968790', '/mp/orders/cancelorder/state/1/od_id/80/odbl_id/80', '180.123.221.216');
INSERT INTO `fw_orderlogs` VALUES ('258', '3321', '81', '201808131530472213', '1', '66', '654081', '石瑶瑶', '创建订单', '1534145447', '/baiman/orders/submitorders', '117.136.68.214');
INSERT INTO `fw_orderlogs` VALUES ('259', '3321', '81', '201808131530472213', '0', '8', 'yunmei:chuku', 'yunmei:chuku', '确认订单', '1534145481', '/zxapi/order/canceldlorder', '180.123.221.52');
INSERT INTO `fw_orderlogs` VALUES ('260', '3321', '67', '201807251929129517', '0', '0', '', '', '系统确认收货', '1534146822', '/mp/index/index', '180.123.221.52');
INSERT INTO `fw_orderlogs` VALUES ('261', '3321', '71', '201807281613095782', '0', '0', '', '', '系统确认收货', '1534146822', '/mp/index/index', '180.123.221.52');
INSERT INTO `fw_orderlogs` VALUES ('262', '3321', '82', '201808131632506621', '1', '76', 'maoyu517', '陈宇', '创建订单', '1534149170', '/baiman/orders/submitorders', '114.235.188.50');
INSERT INTO `fw_orderlogs` VALUES ('263', '3321', '82', '201808131632506621', '0', '8', 'yunmei:chuku', 'yunmei:chuku', '确认订单', '1534149180', '/zxapi/order/canceldlorder', '49.92.154.144');
INSERT INTO `fw_orderlogs` VALUES ('264', '3321', '83', '201808181633273684', '1', '66', '654081', '石瑶瑶', '创建订单', '1534581207', '/baiman/orders/submitorders', '223.104.147.141');
INSERT INTO `fw_orderlogs` VALUES ('265', '3321', '83', '201808181633273684', '0', '8', 'yunmei:chuku', 'yunmei:chuku', '确认订单', '1534581269', '/zxapi/order/canceldlorder', '180.124.222.71');
INSERT INTO `fw_orderlogs` VALUES ('266', '3321', '73', '201807311617516933', '0', '0', '', '', '系统确认收货', '1534838777', '/mp/index/index', '180.124.222.236');
INSERT INTO `fw_orderlogs` VALUES ('267', '3321', '76', '201808061109452463', '0', '0', '', '', '系统确认收货', '1534838777', '/mp/index/index', '180.124.222.236');
INSERT INTO `fw_orderlogs` VALUES ('268', '3321', '75', '201808061109098476', '0', '0', '', '', '系统确认收货', '1534838777', '/mp/index/index', '180.124.222.236');
INSERT INTO `fw_orderlogs` VALUES ('269', '3321', '74', '201808061103557802', '0', '0', '', '', '系统确认收货', '1534838777', '/mp/index/index', '180.124.222.236');
INSERT INTO `fw_orderlogs` VALUES ('270', '3321', '77', '201808061538594824', '0', '0', '', '', '系统确认收货', '1534838777', '/mp/index/index', '180.124.222.236');
INSERT INTO `fw_orderlogs` VALUES ('271', '3321', '78', '201808071619103907', '0', '0', '', '', '系统确认收货', '1535003989', '/mp/index/index', '180.123.221.154');
INSERT INTO `fw_orderlogs` VALUES ('272', '3321', '84', '201809051405111285', '1', '66', '654081', '石瑶瑶', '创建订单', '1536127511', '/baiman/orders/submitorders', '49.81.113.175');
INSERT INTO `fw_orderlogs` VALUES ('273', '3321', '84', '201809051405111285', '0', '8', 'yunmei:chuku', 'yunmei:chuku', '确认订单', '1536127552', '/zxapi/order/canceldlorder', '121.233.39.115');
INSERT INTO `fw_orderlogs` VALUES ('274', '3321', '79', '201808101539287844', '0', '0', '', '', '系统确认收货', '1536318017', '/mp/index/index', '180.123.223.33');
INSERT INTO `fw_orderlogs` VALUES ('275', '3321', '80', '201808111425285680', '0', '0', '', '', '系统确认收货', '1536318017', '/mp/index/index', '180.123.223.33');
INSERT INTO `fw_orderlogs` VALUES ('276', '3321', '81', '201808131530472213', '0', '0', '', '', '系统确认收货', '1536318017', '/mp/index/index', '180.123.223.33');
INSERT INTO `fw_orderlogs` VALUES ('277', '3321', '82', '201808131632506621', '0', '0', '', '', '系统确认收货', '1536318017', '/mp/index/index', '180.123.223.33');
INSERT INTO `fw_orderlogs` VALUES ('278', '3321', '83', '201808181633273684', '0', '0', '', '', '系统确认收货', '1536318017', '/mp/index/index', '180.123.223.33');
INSERT INTO `fw_orderlogs` VALUES ('279', '3321', '85', '201809141152483931', '1', '66', '654081', '石瑶瑶', '创建订单', '1536897168', '/baiman/orders/submitorders', '223.104.147.156');
INSERT INTO `fw_orderlogs` VALUES ('280', '3321', '85', '201809141152483931', '0', '8', 'yunmei:chuku', 'yunmei:chuku', '确认订单', '1536897304', '/zxapi/order/canceldlorder', '49.81.113.141');
INSERT INTO `fw_orderlogs` VALUES ('281', '3321', '84', '201809051405111285', '0', '0', '', '', '系统确认收货', '1537443843', '/mp/index/index', '121.233.25.216');
INSERT INTO `fw_orderlogs` VALUES ('282', '3321', '86', '201810161600533437', '1', '66', '654081', '石瑶瑶', '创建订单', '1539676853', '/baiman/orders/submitorders', '180.123.223.162');
INSERT INTO `fw_orderlogs` VALUES ('283', '3321', '86', '201810161600533437', '0', '8', 'yunmei:chuku', 'yunmei:chuku', '确认订单', '1539920190', '/zxapi/order/canceldlorder', '180.124.222.2');
INSERT INTO `fw_orderlogs` VALUES ('284', '3321', '85', '201809141152483931', '0', '0', '', '', '系统确认收货', '1540018694', '/mp/index/index', '180.124.222.49');
INSERT INTO `fw_orderlogs` VALUES ('290', '3321', '89', '201810201504597994', '1', '66', '654081', '石瑶瑶', '创建订单', '1540019099', '/baiman/orders/submitorders', '180.124.222.49');
INSERT INTO `fw_orderlogs` VALUES ('291', '3321', '89', '201810201504597994', '0', '8', 'yunmei:chuku', 'yunmei:chuku', '确认订单', '1540019112', '/zxapi/order/canceldlorder', '180.124.222.49');
INSERT INTO `fw_orderlogs` VALUES ('292', '3321', '89', '201810201504597994', '0', '1191', 'yunmei', 'yunmei', '确认订单', '1540019156', '/mp/orders/cancelorder/state/1/od_id/89/odbl_id/89', '180.124.222.49');
INSERT INTO `fw_orderlogs` VALUES ('294', '3321', '90', '201810201511006482', '1', '69', '15365423666', '英少柏', '创建订单', '1540019460', '/baiman/orders/submitorders', '49.90.21.36');
INSERT INTO `fw_orderlogs` VALUES ('295', '3321', '90', '201810201511006482', '0', '8', 'yunmei:chuku', 'yunmei:chuku', '确认订单', '1540020526', '/zxapi/order/canceldlorder', '180.124.222.49');
INSERT INTO `fw_orderlogs` VALUES ('296', '3321', '91', '201810231832399388', '1', '69', '15365423666', '英少柏', '创建订单', '1540290759', '/baiman/orders/submitorders', '49.90.55.6');
INSERT INTO `fw_orderlogs` VALUES ('297', '3321', '91', '201810231832399388', '0', '8', 'yunmei:chuku', 'yunmei:chuku', '确认订单', '1540353857', '/zxapi/order/canceldlorder', '180.123.221.98');
INSERT INTO `fw_orderlogs` VALUES ('298', '3321', '86', '201810161600533437', '0', '0', '', '', '系统确认收货', '1541321270', '/mp/index/index', '180.123.223.171');
INSERT INTO `fw_orderlogs` VALUES ('299', '3321', '90', '201810201511006482', '0', '0', '', '', '系统确认收货', '1541321270', '/mp/index/index', '180.123.223.171');
INSERT INTO `fw_orderlogs` VALUES ('300', '3321', '92', '201811061956401778', '1', '74', '13395253609', '戴言', '创建订单', '1541505400', '/angels/Angels/Orders/submitorders', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('301', '3321', '92', '201811061956401778', '1', '66', '654081', '石瑶瑶', '确认订单', '1541505898', '/angels/Angels/Orders/canceldlorder/state/1/od_id/92/odbl_id/92/od_state/0', '0.0.0.0');
INSERT INTO `fw_orderlogs` VALUES ('302', '3321', '89', '201810201504597994', '0', '0', '', '', '系统确认收货', '1541642297', '/Mp/Index/index', '127.0.0.1');
INSERT INTO `fw_orderlogs` VALUES ('303', '3321', '91', '201810231832399388', '0', '0', '', '', '系统确认收货', '1542015641', '/Mp/Index/index', '113.109.120.205');
INSERT INTO `fw_orderlogs` VALUES ('304', '3321', '1', '201811190929022418', '1', '3', '15875872792', '钟琪2', '创建订单', '1542590942', '/Angels/Orders/submitorders', '127.0.0.1');
INSERT INTO `fw_orderlogs` VALUES ('305', '3321', '1', '201811190929022418', '0', '1191', 'test', 'test', '确认订单', '1542590966', '/Mp/Orders/cancelorder/state/1/od_id/1/odbl_id/93', '127.0.0.1');
INSERT INTO `fw_orderlogs` VALUES ('306', '3321', '1', '201811190929022418', '0', '1191', 'test', 'test', '完成发货', '1542590978', '/Mp/Orders/odfinishship_save', '127.0.0.1');
INSERT INTO `fw_orderlogs` VALUES ('307', '3321', '2', '201811190934308526', '1', '4', '15875872793', '钟琪3', '创建订单', '1542591270', '/Angels/Orders/submitorders', '127.0.0.1');
INSERT INTO `fw_orderlogs` VALUES ('308', '3321', '2', '201811190934308526', '0', '1191', 'test', 'test', '确认订单', '1542591330', '/Mp/Orders/cancelorder/state/1/od_id/2/odbl_id/94', '127.0.0.1');
INSERT INTO `fw_orderlogs` VALUES ('309', '3321', '2', '201811190934308526', '0', '1191', 'test', 'test', '完成发货', '1542591340', '/Mp/Orders/odfinishship_save', '127.0.0.1');
INSERT INTO `fw_orderlogs` VALUES ('310', '3321', '3', '201811190943048496', '1', '5', '15875872794', '钟琪4', '创建订单', '1542591784', '/Angels/Orders/submitorders', '127.0.0.1');
INSERT INTO `fw_orderlogs` VALUES ('311', '3321', '4', '201811190949215797', '1', '6', '15875872794', '钟琪4', '创建订单', '1542592162', '/Angels/Orders/submitorders', '127.0.0.1');
INSERT INTO `fw_orderlogs` VALUES ('312', '3321', '4', '201811190949215797', '1', '1', 'test', '钟琪', '确认订单', '1542592191', '/Angels/Orders/canceldlorder/state/1/od_id/4/odbl_id/96/od_state/0', '127.0.0.1');
INSERT INTO `fw_orderlogs` VALUES ('313', '3321', '5', '201811191004205873', '1', '2', '15875872791', '钟琪1', '创建订单', '1542593060', '/Angels/Orders/submitorders', '127.0.0.1');
INSERT INTO `fw_orderlogs` VALUES ('314', '3321', '6', '201811191006186593', '1', '1', 'test', '钟琪', '创建订单', '1542593178', '/Angels/Orders/submitorders', '127.0.0.1');
INSERT INTO `fw_orderlogs` VALUES ('315', '3321', '6', '201811191006186593', '0', '1191', 'test', 'test', '确认订单', '1542593207', '/Mp/Orders/cancelorder/state/1/od_id/6/odbl_id/98', '127.0.0.1');
INSERT INTO `fw_orderlogs` VALUES ('316', '3321', '6', '201811191006186593', '0', '1191', 'test', 'test', '完成发货', '1542593232', '/Mp/Orders/odfinishship_save', '127.0.0.1');
INSERT INTO `fw_orderlogs` VALUES ('317', '3321', '5', '201811191004205873', '1', '1', 'test', '钟琪', '确认订单', '1542593283', '/Angels/Orders/canceldlorder/state/1/od_id/5/odbl_id/97/od_state/0', '127.0.0.1');
INSERT INTO `fw_orderlogs` VALUES ('318', '3321', '7', '201811191012374567', '1', '1', 'test', '钟琪', '创建订单', '1542593557', '/Angels/Orders/submitorders', '127.0.0.1');
INSERT INTO `fw_orderlogs` VALUES ('319', '3321', '7', '201811191012374567', '0', '1191', 'test', 'test', '确认订单', '1542593567', '/Mp/Orders/cancelorder/state/1/od_id/7/odbl_id/99', '127.0.0.1');
INSERT INTO `fw_orderlogs` VALUES ('320', '3321', '7', '201811191012374567', '0', '1191', 'test', 'test', '完成发货', '1542593587', '/Mp/Orders/odfinishship_save', '127.0.0.1');
INSERT INTO `fw_orderlogs` VALUES ('321', '3321', '8', '201811191050549575', '1', '6', '15875872794', '钟琪4', '创建订单', '1542595854', '/Angels/Orders/submitorders', '127.0.0.1');
INSERT INTO `fw_orderlogs` VALUES ('322', '3321', '9', '201811191052145005', '1', '1', 'test', '钟琪', '创建订单', '1542595935', '/Angels/Orders/submitorders', '127.0.0.1');
INSERT INTO `fw_orderlogs` VALUES ('323', '3321', '9', '201811191052145005', '0', '1191', 'test', 'test', '确认订单', '1542595940', '/Mp/Orders/cancelorder/state/1/od_id/9/odbl_id/101', '127.0.0.1');
INSERT INTO `fw_orderlogs` VALUES ('324', '3321', '9', '201811191052145005', '0', '1191', 'test', 'test', '完成发货', '1542595971', '/Mp/Orders/odfinishship_save', '127.0.0.1');
INSERT INTO `fw_orderlogs` VALUES ('325', '3321', '9', '201811191052145005', '1', '1', 'test', '钟琪', '确认收货', '1542595988', '/Angels/Orders/confirmreceipt/od_id/9/od_state/3', '127.0.0.1');
INSERT INTO `fw_orderlogs` VALUES ('326', '3321', '8', '201811191050549575', '1', '1', 'test', '钟琪', '确认订单', '1542596014', '/Angels/Orders/canceldlorder/state/1/od_id/8/odbl_id/100/od_state/0', '127.0.0.1');
INSERT INTO `fw_orderlogs` VALUES ('327', '3321', '10', '201811191104427941', '1', '7', '15875872795', '钟琪5', '创建订单', '1542596682', '/Angels/Orders/submitorders', '127.0.0.1');
INSERT INTO `fw_orderlogs` VALUES ('328', '3321', '11', '201811191105595814', '1', '1', 'test', '钟琪', '创建订单', '1542596759', '/Angels/Orders/submitorders', '127.0.0.1');
INSERT INTO `fw_orderlogs` VALUES ('329', '3321', '11', '201811191105595814', '0', '1191', 'test', 'test', '确认订单', '1542596771', '/Mp/Orders/cancelorder/state/1/od_id/11/odbl_id/103', '127.0.0.1');
INSERT INTO `fw_orderlogs` VALUES ('330', '3321', '11', '201811191105595814', '0', '1191', 'test', 'test', '完成发货', '1542596796', '/Mp/Orders/odfinishship_save', '127.0.0.1');
INSERT INTO `fw_orderlogs` VALUES ('331', '3321', '10', '201811191104427941', '1', '1', 'test', '钟琪', '确认订单', '1542596811', '/Angels/Orders/canceldlorder/state/1/od_id/10/odbl_id/102/od_state/0', '127.0.0.1');
INSERT INTO `fw_orderlogs` VALUES ('332', '3321', '12', '201811191114031904', '1', '8', '15875872796', '钟琪6', '创建订单', '1542597243', '/Angels/Orders/submitorders', '127.0.0.1');
INSERT INTO `fw_orderlogs` VALUES ('333', '3321', '12', '201811191114031904', '0', '1191', 'test', 'test', '确认订单', '1542597267', '/Mp/Orders/cancelorder/state/1/od_id/12/odbl_id/104', '127.0.0.1');
INSERT INTO `fw_orderlogs` VALUES ('334', '3321', '12', '201811191114031904', '0', '1191', 'test', 'test', '完成发货', '1542597374', '/Mp/Orders/odfinishship_save', '127.0.0.1');
INSERT INTO `fw_orderlogs` VALUES ('335', '3321', '13', '201811191119115980', '1', '8', '15875872796', '钟琪6', '创建订单', '1542597551', '/Angels/Orders/submitorders', '127.0.0.1');
INSERT INTO `fw_orderlogs` VALUES ('336', '3321', '13', '201811191119115980', '0', '1191', 'test', 'test', '确认订单', '1542597556', '/Mp/Orders/cancelorder/state/1/od_id/13/odbl_id/105', '127.0.0.1');
INSERT INTO `fw_orderlogs` VALUES ('337', '3321', '13', '201811191119115980', '0', '1191', 'test', 'test', '完成发货', '1542598248', '/Mp/Orders/odfinishship_save', '127.0.0.1');
INSERT INTO `fw_orderlogs` VALUES ('338', '3321', '14', '201811191131554860', '1', '8', '15875872796', '钟琪6', '创建订单', '1542598315', '/Angels/Orders/submitorders', '127.0.0.1');
INSERT INTO `fw_orderlogs` VALUES ('339', '3321', '14', '201811191131554860', '0', '1191', 'test', 'test', '确认订单', '1542598343', '/Mp/Orders/cancelorder/state/1/od_id/14/odbl_id/106', '127.0.0.1');
INSERT INTO `fw_orderlogs` VALUES ('340', '3321', '14', '201811191131554860', '0', '1191', 'test', 'test', '完成发货', '1542598419', '/Mp/Orders/odfinishship_save', '127.0.0.1');
INSERT INTO `fw_orderlogs` VALUES ('341', '3321', '15', '201811191143319278', '1', '10', '15875872798', '钟琪8', '创建订单', '1542599011', '/Angels/Orders/submitorders', '127.0.0.1');
INSERT INTO `fw_orderlogs` VALUES ('342', '3321', '15', '201811191143319278', '1', '8', '15875872796', '钟琪6', '确认订单', '1542599050', '/Angels/Orders/canceldlorder/state/1/od_id/15/odbl_id/107/od_state/0', '127.0.0.1');
INSERT INTO `fw_orderlogs` VALUES ('343', '3321', '16', '201811191146294221', '1', '8', '15875872796', '钟琪6', '创建订单', '1542599189', '/Angels/Orders/submitorders', '127.0.0.1');
INSERT INTO `fw_orderlogs` VALUES ('344', '3321', '16', '201811191146294221', '0', '1191', 'test', 'test', '确认订单', '1542599196', '/Mp/Orders/cancelorder/state/1/od_id/16/odbl_id/108', '127.0.0.1');
INSERT INTO `fw_orderlogs` VALUES ('345', '3321', '16', '201811191146294221', '0', '1191', 'test', 'test', '完成发货', '1542599220', '/Mp/Orders/odfinishship_save', '127.0.0.1');
INSERT INTO `fw_orderlogs` VALUES ('346', '3321', '17', '201811191155579250', '1', '11', '15875872799', '钟琪9', '创建订单', '1542599758', '/Angels/Orders/submitorders', '127.0.0.1');
INSERT INTO `fw_orderlogs` VALUES ('347', '3321', '18', '201811191156252104', '1', '8', '15875872796', '钟琪6', '创建订单', '1542599786', '/Angels/Orders/submitorders', '127.0.0.1');
INSERT INTO `fw_orderlogs` VALUES ('348', '3321', '18', '201811191156252104', '0', '1191', 'test', 'test', '确认订单', '1542599791', '/Mp/Orders/cancelorder/state/1/od_id/18/odbl_id/110', '127.0.0.1');
INSERT INTO `fw_orderlogs` VALUES ('349', '3321', '18', '201811191156252104', '0', '1191', 'test', 'test', '完成发货', '1542599819', '/Mp/Orders/odfinishship_save', '127.0.0.1');
INSERT INTO `fw_orderlogs` VALUES ('350', '3321', '17', '201811191155579250', '1', '8', '15875872796', '钟琪6', '确认订单', '1542599900', '/Angels/Orders/canceldlorder/state/1/od_id/17/odbl_id/109/od_state/0', '127.0.0.1');
INSERT INTO `fw_orderlogs` VALUES ('351', '3321', '19', '201811191306452615', '1', '8', '15875872796', '钟琪6', '创建订单', '1542604005', '/Angels/Orders/submitorders', '127.0.0.1');
INSERT INTO `fw_orderlogs` VALUES ('352', '3321', '20', '201811191307135263', '1', '8', '15875872796', '钟琪6', '创建订单', '1542604033', '/Angels/Orders/submitorders', '127.0.0.1');
INSERT INTO `fw_orderlogs` VALUES ('353', '3321', '21', '201811191308217400', '1', '8', '15875872796', '钟琪6', '创建订单', '1542604101', '/Angels/Orders/submitorders', '127.0.0.1');
INSERT INTO `fw_orderlogs` VALUES ('354', '3321', '22', '201811191311024501', '1', '8', '15875872796', '钟琪6', '创建订单', '1542604262', '/Angels/Orders/submitorders', '127.0.0.1');
INSERT INTO `fw_orderlogs` VALUES ('355', '3321', '23', '201811191311237035', '1', '8', '15875872796', '钟琪6', '创建订单', '1542604283', '/Angels/Orders/submitorders', '127.0.0.1');

-- ----------------------------
-- Table structure for fw_orders
-- ----------------------------
DROP TABLE IF EXISTS `fw_orders`;
CREATE TABLE `fw_orders` (
  `od_id` int(11) NOT NULL AUTO_INCREMENT,
  `od_unitcode` varchar(32) DEFAULT NULL COMMENT '企业码',
  `od_orderid` varchar(32) DEFAULT NULL COMMENT '订单号',
  `od_total` decimal(10,2) DEFAULT '0.00' COMMENT '订单金额',
  `od_addtime` int(11) DEFAULT '0' COMMENT '下单时间',
  `od_oddlid` int(11) DEFAULT '0' COMMENT '下单的代理',
  `od_contact` varchar(32) DEFAULT NULL COMMENT '收件人',
  `od_addressid` int(11) DEFAULT '0' COMMENT '地址ID',
  `od_sheng` int(11) DEFAULT '0' COMMENT '省id',
  `od_shi` int(11) DEFAULT '0' COMMENT '市id',
  `od_qu` int(11) DEFAULT '0' COMMENT '区id',
  `od_jie` int(11) DEFAULT '0' COMMENT '街id',
  `od_address` varchar(64) DEFAULT NULL COMMENT '详细地址',
  `od_tel` varchar(32) DEFAULT NULL COMMENT '电话',
  `od_express` int(11) DEFAULT '0' COMMENT '快递id',
  `od_expressnum` varchar(64) DEFAULT NULL COMMENT '快递单号',
  `od_expressdate` int(11) DEFAULT '0' COMMENT '发货时间',
  `od_remark` varchar(512) DEFAULT NULL COMMENT '处理订单备注',
  `od_state` int(11) DEFAULT '0' COMMENT '订单状态',
  `od_stead` int(11) DEFAULT '0' COMMENT '是否代客户下单',
  `od_blid` int(11) NOT NULL DEFAULT '0' COMMENT '支付余额ID',
  `od_paymode` int(4) NOT NULL DEFAULT '0' COMMENT '支付方式0线下 1余额 ',
  PRIMARY KEY (`od_id`),
  KEY `od_unitcode` (`od_unitcode`),
  KEY `od_oddlid` (`od_oddlid`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='订单表';

-- ----------------------------
-- Records of fw_orders
-- ----------------------------
INSERT INTO `fw_orders` VALUES ('1', '3321', '201811190929022418', '300000.00', '1542590942', '3', '钟琪2', '74', '11', '1129', '0', '0', '北京市延庆县', '15875872792', '1', '', '1542590977', '', '3', '0', '0', '0');
INSERT INTO `fw_orders` VALUES ('2', '3321', '201811190934308526', '400000.00', '1542591270', '4', '钟琪3', '75', '44', '4451', '445101', '0', '广东省潮州市枫溪区', '15875872793', '1', '', '1542591340', '', '3', '0', '0', '0');
INSERT INTO `fw_orders` VALUES ('4', '3321', '201811190949215797', '100000.00', '1542592161', '6', '钟琪4', '77', '12', '1225', '0', '0', '天津市蓟县', '15875872794', '0', '', '0', null, '1', '0', '0', '0');
INSERT INTO `fw_orders` VALUES ('5', '3321', '201811191004205873', '1000000.00', '1542593060', '2', '钟琪1', '73', '11', '1111', '0', '0', '北京市房山区', '15875872791', '0', '', '0', null, '1', '0', '0', '0');
INSERT INTO `fw_orders` VALUES ('6', '3321', '201811191006186593', '1000000.00', '1542593178', '1', '钟琪test', '78', '14', '1401', '140105', '0', '山西省太原市小店区', '15875872790', '1', '', '1542593232', '', '3', '0', '0', '0');
INSERT INTO `fw_orders` VALUES ('7', '3321', '201811191012374567', '2000.00', '1542593557', '1', '钟琪test', '78', '14', '1401', '140105', '0', '山西省太原市小店区', '15875872790', '1', '', '1542593587', '', '3', '0', '0', '0');
INSERT INTO `fw_orders` VALUES ('8', '3321', '201811191050549575', '1000000.00', '1542595854', '6', '钟琪4', '77', '12', '1225', '0', '0', '天津市蓟县', '15875872794', '1', '', '1542596218', '', '3', '0', '0', '0');
INSERT INTO `fw_orders` VALUES ('9', '3321', '201811191052145005', '1000000.00', '1542595934', '1', '钟琪test', '78', '14', '1401', '140105', '0', '山西省太原市小店区', '15875872790', '1', '', '1542595971', '', '8', '0', '0', '0');
INSERT INTO `fw_orders` VALUES ('10', '3321', '201811191104427941', '1000000.00', '1542596682', '7', '钟琪5', '79', '11', '1129', '0', '0', '广东广州越秀区', '15875872795', '1', '', '1542596896', '', '3', '0', '0', '0');
INSERT INTO `fw_orders` VALUES ('11', '3321', '201811191105595814', '1000000.00', '1542596759', '1', '钟琪test', '78', '14', '1401', '140105', '0', '山西省太原市小店区', '15875872790', '1', '', '1542596796', '', '3', '0', '0', '0');
INSERT INTO `fw_orders` VALUES ('13', '3321', '201811191119115980', '1000000.00', '1542597551', '8', '钟琪6', '80', '12', '1225', '0', '0', '天津市蓟县', '15875872796', '1', '', '1542598248', '', '3', '0', '0', '0');
INSERT INTO `fw_orders` VALUES ('14', '3321', '201811191131554860', '1000000.00', '1542598315', '8', '钟琪6', '80', '12', '1225', '0', '0', '天津市蓟县', '15875872796', '0', '', '0', '', '0', '0', '0', '0');
INSERT INTO `fw_orders` VALUES ('16', '3321', '201811191146294221', '1000000.00', '1542599189', '8', '钟琪6', '80', '12', '1225', '0', '0', '天津市蓟县', '15875872796', '1', '', '1542599220', '', '3', '0', '0', '0');
INSERT INTO `fw_orders` VALUES ('17', '3321', '201811191155579250', '1000000.00', '1542599757', '11', '钟琪9', '83', '11', '1129', '0', '0', '北京市延庆县', '15875872799', '1', '', '1542600715', '', '3', '0', '0', '0');
INSERT INTO `fw_orders` VALUES ('19', '3321', '201811191306452615', '100.00', '1542604005', '8', '钟琪6', '80', '12', '1225', '0', '0', '天津市蓟县', '15875872796', '0', '', '0', null, '0', '0', '0', '0');
INSERT INTO `fw_orders` VALUES ('20', '3321', '201811191307135263', '100.00', '1542604033', '8', '钟琪6', '80', '12', '1225', '0', '0', '天津市蓟县', '15875872796', '0', '', '0', null, '0', '0', '0', '0');
INSERT INTO `fw_orders` VALUES ('21', '3321', '201811191308217400', '100.00', '1542604101', '8', '钟琪6', '80', '12', '1225', '0', '0', '天津市蓟县', '15875872796', '0', '', '0', null, '0', '0', '0', '0');
INSERT INTO `fw_orders` VALUES ('22', '3321', '201811191311024501', '100.00', '1542604262', '8', '钟琪6', '80', '12', '1225', '0', '0', '天津市蓟县', '15875872796', '0', '', '0', null, '0', '0', '0', '0');
INSERT INTO `fw_orders` VALUES ('23', '3321', '201811191311237035', '100.00', '1542604283', '8', '钟琪6', '80', '12', '1225', '0', '0', '天津市蓟县', '15875872796', '0', '', '0', null, '0', '0', '0', '0');

-- ----------------------------
-- Table structure for fw_overdue
-- ----------------------------
DROP TABLE IF EXISTS `fw_overdue`;
CREATE TABLE `fw_overdue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `unitcode` varchar(32) DEFAULT NULL,
  `offbegin` int(11) DEFAULT NULL,
  `offend` int(11) DEFAULT NULL,
  `reason` varchar(256) DEFAULT NULL,
  `datetime` int(11) DEFAULT NULL,
  `operator` varchar(32) DEFAULT NULL,
  `type` int(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='防伪码分段作废 ';

-- ----------------------------
-- Records of fw_overdue
-- ----------------------------

-- ----------------------------
-- Table structure for fw_overduecode
-- ----------------------------
DROP TABLE IF EXISTS `fw_overduecode`;
CREATE TABLE `fw_overduecode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `unitcode` varchar(32) DEFAULT NULL,
  `fwcode` varchar(32) DEFAULT NULL,
  `addtime` int(11) DEFAULT '0',
  `operator` varchar(32) DEFAULT NULL,
  `type` int(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='防伪码作废';

-- ----------------------------
-- Records of fw_overduecode
-- ----------------------------

-- ----------------------------
-- Table structure for fw_payin
-- ----------------------------
DROP TABLE IF EXISTS `fw_payin`;
CREATE TABLE `fw_payin` (
  `pi_id` int(11) NOT NULL AUTO_INCREMENT,
  `pi_unitcode` varchar(32) DEFAULT NULL,
  `pi_dlid` int(11) DEFAULT '0' COMMENT '充值代理',
  `pi_receiveid` int(11) NOT NULL DEFAULT '0' COMMENT '接收充值代理',
  `pi_money` decimal(10,2) DEFAULT '0.00' COMMENT '金额',
  `pi_addtime` int(11) DEFAULT '0' COMMENT '充值时间',
  `pi_remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `pi_pic` varchar(32) DEFAULT NULL COMMENT '凭证',
  `pi_dealtime` int(11) DEFAULT '0' COMMENT '处理时间',
  `pi_dealremark` varchar(256) DEFAULT NULL COMMENT '处理备注',
  `pi_state` int(11) DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`pi_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='充值记录';

-- ----------------------------
-- Records of fw_payin
-- ----------------------------

-- ----------------------------
-- Table structure for fw_product
-- ----------------------------
DROP TABLE IF EXISTS `fw_product`;
CREATE TABLE `fw_product` (
  `pro_id` int(11) NOT NULL AUTO_INCREMENT,
  `pro_unitcode` varchar(32) DEFAULT NULL,
  `pro_typeid` int(11) DEFAULT NULL,
  `pro_name` varchar(254) DEFAULT NULL,
  `pro_number` varchar(32) DEFAULT NULL,
  `pro_barcode` varchar(64) DEFAULT NULL,
  `pro_jftype` int(4) DEFAULT '0',
  `pro_jifen` int(11) DEFAULT '0',
  `pro_jfmax` int(11) DEFAULT '0',
  `pro_dljf` int(11) DEFAULT '0' COMMENT '代理获得积分',
  `pro_pic` varchar(64) DEFAULT NULL,
  `pro_pic2` varchar(64) DEFAULT NULL COMMENT '防伪出现的图片',
  `pro_price` decimal(10,2) DEFAULT NULL,
  `pro_stock` int(11) DEFAULT '0' COMMENT '库存',
  `pro_units` varchar(32) DEFAULT NULL COMMENT '产品单位',
  `pro_dbiao` int(11) DEFAULT '0' COMMENT '产品包装比例大标',
  `pro_zbiao` int(11) DEFAULT '0' COMMENT '产品包装比例中标',
  `pro_xbiao` int(11) DEFAULT '0' COMMENT '产品包装比例小标',
  `pro_desc` text,
  `pro_link` varchar(512) DEFAULT NULL,
  `pro_expirydate` varchar(32) DEFAULT NULL COMMENT '产品有效期',
  `pro_remark` varchar(512) DEFAULT NULL,
  `pro_active` int(4) DEFAULT NULL,
  `pro_order` int(11) NOT NULL COMMENT '产品序号',
  `pro_addtime` int(11) DEFAULT NULL,
  PRIMARY KEY (`pro_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of fw_product
-- ----------------------------
INSERT INTO `fw_product` VALUES ('18', '3321', '21', '即食燕窝', '00001', '', '1', '0', '0', '0', '3321/1542092811_9174.jpg', null, '100.00', '0', '盒', '0', '0', '0', '', '', null, '', '1', '0', '1542092811');
INSERT INTO `fw_product` VALUES ('19', '3321', '19', '中毛燕盏', '00002', '', '1', '0', '0', '0', '3321/1542092849_9725.jpg', null, '100.00', '0', '盒', '0', '0', '0', '', '', null, '', '1', '0', '1542092849');
INSERT INTO `fw_product` VALUES ('20', '3321', '19', '中毛燕盏2', '00003', '', '1', '0', '0', '0', '3321/1542092885_3446.jpg', null, '100.00', '0', '盒', '0', '0', '0', '', '', null, '', '1', '0', '1542092885');

-- ----------------------------
-- Table structure for fw_profanli
-- ----------------------------
DROP TABLE IF EXISTS `fw_profanli`;
CREATE TABLE `fw_profanli` (
  `pfl_id` int(11) NOT NULL AUTO_INCREMENT,
  `pfl_unitcode` varchar(32) DEFAULT NULL,
  `pfl_proid` int(11) DEFAULT '0',
  `pfl_dltype` int(11) DEFAULT '0' COMMENT '推荐级别',
  `pfl_tjdltype` int(11) DEFAULT '0' COMMENT '被推荐级别',
  `pfl_fanli1` decimal(10,2) DEFAULT '0.00' COMMENT '直推返利',
  `pfl_fanli2` decimal(10,2) DEFAULT '0.00' COMMENT '间推返利',
  `pfl_fanli3` decimal(10,2) DEFAULT '0.00' COMMENT '第三间推返利',
  `pfl_fanli4` decimal(10,2) DEFAULT '0.00' COMMENT '产品返利4',
  `pfl_fanli5` decimal(10,2) DEFAULT '0.00' COMMENT '产品返利5',
  `pfl_fanli6` decimal(10,2) DEFAULT '0.00' COMMENT '产品返利6',
  `pfl_fanli7` decimal(10,2) DEFAULT '0.00' COMMENT '产品返利7',
  `pfl_fanli8` decimal(10,2) DEFAULT '0.00' COMMENT '产品返利8',
  `pfl_fanli9` decimal(10,2) DEFAULT '0.00' COMMENT '产品返利9',
  `pfl_fanli10` decimal(10,2) DEFAULT '0.00' COMMENT '产品返利10',
  `pfl_maiduan` decimal(10,2) DEFAULT '0.00' COMMENT '买断返利',
  PRIMARY KEY (`pfl_id`),
  KEY `pri_unitcode` (`pfl_unitcode`),
  KEY `pfl_unitcode` (`pfl_unitcode`),
  KEY `pfl_proid` (`pfl_proid`)
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COMMENT='产品返利设置';

-- ----------------------------
-- Records of fw_profanli
-- ----------------------------

-- ----------------------------
-- Table structure for fw_proprice
-- ----------------------------
DROP TABLE IF EXISTS `fw_proprice`;
CREATE TABLE `fw_proprice` (
  `pri_id` int(11) NOT NULL AUTO_INCREMENT,
  `pri_unitcode` varchar(32) DEFAULT NULL,
  `pri_proid` int(11) DEFAULT '0',
  `pri_dltype` int(11) DEFAULT '0',
  `pri_price` decimal(10,2) DEFAULT '0.00',
  `pri_minimum` int(11) DEFAULT '0' COMMENT '最低补货量',
  `pri_jifen` int(11) DEFAULT '0' COMMENT '产品积分',
  PRIMARY KEY (`pri_id`),
  KEY `pri_unitcode` (`pri_unitcode`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='产品价格体系';

-- ----------------------------
-- Records of fw_proprice
-- ----------------------------
INSERT INTO `fw_proprice` VALUES ('1', '3321', '20', '9', '100.00', '0', '0');
INSERT INTO `fw_proprice` VALUES ('2', '3321', '20', '10', '100.00', '0', '0');
INSERT INTO `fw_proprice` VALUES ('3', '3321', '20', '11', '100.00', '0', '0');
INSERT INTO `fw_proprice` VALUES ('4', '3321', '20', '12', '100.00', '0', '0');
INSERT INTO `fw_proprice` VALUES ('5', '3321', '19', '9', '100.00', '0', '0');
INSERT INTO `fw_proprice` VALUES ('6', '3321', '19', '10', '100.00', '0', '0');
INSERT INTO `fw_proprice` VALUES ('7', '3321', '19', '11', '100.00', '0', '0');
INSERT INTO `fw_proprice` VALUES ('8', '3321', '19', '12', '100.00', '0', '0');
INSERT INTO `fw_proprice` VALUES ('9', '3321', '18', '9', '100.00', '0', '0');
INSERT INTO `fw_proprice` VALUES ('10', '3321', '18', '10', '100.00', '0', '0');
INSERT INTO `fw_proprice` VALUES ('11', '3321', '18', '11', '100.00', '0', '0');
INSERT INTO `fw_proprice` VALUES ('12', '3321', '18', '12', '100.00', '0', '0');

-- ----------------------------
-- Table structure for fw_protype
-- ----------------------------
DROP TABLE IF EXISTS `fw_protype`;
CREATE TABLE `fw_protype` (
  `protype_id` int(11) NOT NULL AUTO_INCREMENT,
  `protype_unitcode` varchar(32) DEFAULT NULL,
  `protype_name` varchar(128) DEFAULT NULL,
  `protype_iswho` int(11) DEFAULT '0',
  `protype_order` int(11) DEFAULT '0',
  PRIMARY KEY (`protype_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of fw_protype
-- ----------------------------
INSERT INTO `fw_protype` VALUES ('19', '3321', '燕盏', '0', '20');
INSERT INTO `fw_protype` VALUES ('21', '3321', '燕窝', '0', '21');

-- ----------------------------
-- Table structure for fw_qyinfo
-- ----------------------------
DROP TABLE IF EXISTS `fw_qyinfo`;
CREATE TABLE `fw_qyinfo` (
  `qy_id` int(11) NOT NULL AUTO_INCREMENT,
  `qy_username` varchar(64) DEFAULT NULL,
  `qy_pwd` varchar(64) DEFAULT NULL,
  `qy_code` varchar(32) DEFAULT NULL,
  `qy_name` varchar(64) DEFAULT NULL,
  `qy_address` varchar(64) DEFAULT NULL,
  `qy_tel` varchar(32) DEFAULT NULL,
  `qy_fax` varchar(32) DEFAULT NULL,
  `qy_email` varchar(64) DEFAULT NULL,
  `qy_contact` varchar(32) DEFAULT NULL,
  `qy_addtime` int(11) DEFAULT NULL,
  `qy_active` int(4) DEFAULT '0',
  `qy_purview` text COMMENT '权限',
  `qy_fwkey` varchar(128) DEFAULT NULL,
  `qy_fwsecret` varchar(128) DEFAULT NULL,
  `qy_querytimes` int(11) DEFAULT '0',
  `qy_relation` varchar(64) DEFAULT NULL,
  `qy_remark` text,
  `qy_pic` varchar(64) DEFAULT NULL,
  `qy_folder` varchar(64) DEFAULT NULL,
  `qy_logintime` int(11) DEFAULT '0',
  `qy_errtimes` int(4) DEFAULT '0',
  `qy_fchpwd` varchar(64) DEFAULT NULL COMMENT '防窜货查询密码',
  `qy_admindir` int(11) DEFAULT '0' COMMENT '选择管理目录',
  PRIMARY KEY (`qy_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1192 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='企业基本信息';

-- ----------------------------
-- Records of fw_qyinfo
-- ----------------------------
INSERT INTO `fw_qyinfo` VALUES ('1191', 'test', '66730c784751efc66db25382bd59bbbb', '3321', '安吉思燕窝', '', '微商LIN', '', '', '-', '1530611682', '1', '10000,10001,10002,10003,10004,10005,10008,10009,10010,10011,10012,10013,90000,90001,90003,90004,90005,11000,11001,11002,20000,20001,20002,20003,20004,20005,20006,20007,16000,16001,16002,16003,16004,16005,16006,16007,16008,16009,30000,30001,30002,30003,30004,30005,30006,30007,30008,13000,13001,13002,13003,13004,13005,13006,13007,13008,14000,14001,14002,14003,14004,14005,17001,15000,15001,15002,15003,15004,70000,70001,70010,70011,70012,70006,70007,70009,70015,70018,70020,70013,70005,17002', '9f19Ul2Oc1M2TG6QiMZLqEGigb0sTyNrT4QRqsmBwXjN', '1501de200bc366e9644a3685efc59fc036775a4e9e77ff46eb0a47befed19e65', '600', '', '', '', 'angels', '1542590046', '0', null, '1');

-- ----------------------------
-- Table structure for fw_qysubuser
-- ----------------------------
DROP TABLE IF EXISTS `fw_qysubuser`;
CREATE TABLE `fw_qysubuser` (
  `su_id` int(11) NOT NULL AUTO_INCREMENT,
  `su_unitcode` varchar(32) DEFAULT NULL,
  `su_username` varchar(64) DEFAULT NULL,
  `su_pwd` varchar(64) DEFAULT NULL,
  `su_openid` varchar(64) DEFAULT NULL,
  `su_wxnickname` varchar(128) DEFAULT NULL,
  `su_wxsex` int(4) DEFAULT '0',
  `su_wxprovince` varchar(32) DEFAULT NULL,
  `su_wxcity` varchar(32) DEFAULT NULL,
  `su_wxcountry` varchar(32) DEFAULT NULL,
  `su_wxheadimg` varchar(512) DEFAULT NULL,
  `su_weixin` varchar(32) DEFAULT NULL,
  `su_name` varchar(64) DEFAULT NULL,
  `su_logintime` int(11) DEFAULT NULL,
  `su_errlogintime` int(11) DEFAULT NULL,
  `su_errtimes` int(4) DEFAULT NULL COMMENT '登录错误次数 连续5次错误 锁20分钟钟',
  `su_remark` varchar(512) DEFAULT NULL,
  `su_status` int(4) DEFAULT NULL,
  `su_belong` int(11) NOT NULL DEFAULT '0' COMMENT '子用户所属 0-公司 大于0代理id',
  `su_purview` varchar(512) DEFAULT NULL COMMENT ' 权限',
  PRIMARY KEY (`su_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='企业子管理用户表 子用户发货 app发货';

-- ----------------------------
-- Records of fw_qysubuser
-- ----------------------------
INSERT INTO `fw_qysubuser` VALUES ('8', '3321', 'chuku', '0e92ed5bef4b2458da02cf12ef3ea68e', null, null, '0', null, null, null, null, null, '出库', '1541321857', '1541321857', '0', null, '1', '0', '');
INSERT INTO `fw_qysubuser` VALUES ('9', '3321', 'zq123', '66730c784751efc66db25382bd59bbbb', null, null, '0', null, null, null, null, null, '钟琪', '0', null, null, null, '1', '0', '10000,10001,10002,10003,10004,10005,10008,10009,10010,90000,90001,90003,90004,90005,20006,20007,13004');

-- ----------------------------
-- Table structure for fw_recash
-- ----------------------------
DROP TABLE IF EXISTS `fw_recash`;
CREATE TABLE `fw_recash` (
  `rc_id` int(11) NOT NULL AUTO_INCREMENT,
  `rc_unitcode` varchar(32) DEFAULT NULL COMMENT '企业号',
  `rc_dlid` int(11) DEFAULT '0' COMMENT '提现代理id',
  `rc_sdlid` int(11) DEFAULT '0' COMMENT '发佣金的id 默认为公司',
  `rc_money` decimal(10,2) DEFAULT '0.00' COMMENT '金额',
  `rc_bank` int(11) DEFAULT '0' COMMENT '提现方式',
  `rc_bankcard` varchar(64) DEFAULT NULL COMMENT '提现账号 加密',
  `rc_name` varchar(32) DEFAULT NULL COMMENT '账号对应名称',
  `rc_addtime` int(11) DEFAULT '0' COMMENT '申请时间',
  `rc_dealtime` int(11) DEFAULT '0' COMMENT '处理时间',
  `rc_state` int(11) DEFAULT '0' COMMENT '处理状态',
  `rc_verify` varchar(64) DEFAULT NULL COMMENT '验证串',
  `rc_remark` varchar(256) DEFAULT NULL COMMENT '处理备注',
  `rc_remark2` varchar(256) DEFAULT NULL COMMENT '处理备注(仅内部看)',
  `rc_ip` varchar(64) DEFAULT NULL,
  `rc_pic` varchar(32) DEFAULT NULL COMMENT '凭证',
  PRIMARY KEY (`rc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='返利提现记录';

-- ----------------------------
-- Records of fw_recash
-- ----------------------------

-- ----------------------------
-- Table structure for fw_retchaibox
-- ----------------------------
DROP TABLE IF EXISTS `fw_retchaibox`;
CREATE TABLE `fw_retchaibox` (
  `chai_id` int(11) NOT NULL AUTO_INCREMENT,
  `chai_unitcode` varchar(32) DEFAULT NULL,
  `chai_deliver` int(11) DEFAULT '0' COMMENT '退货者',
  `chai_addtime` int(11) DEFAULT NULL,
  `chai_barcode` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`chai_id`),
  KEY `chai_unitcode` (`chai_unitcode`),
  KEY `chai_unitcode_2` (`chai_unitcode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='退换拆箱记录';

-- ----------------------------
-- Records of fw_retchaibox
-- ----------------------------

-- ----------------------------
-- Table structure for fw_returnable
-- ----------------------------
DROP TABLE IF EXISTS `fw_returnable`;
CREATE TABLE `fw_returnable` (
  `ret_id` int(11) NOT NULL AUTO_INCREMENT,
  `ret_unitcode` varchar(32) DEFAULT NULL,
  `ret_number` varchar(32) DEFAULT NULL,
  `ret_deliver` int(11) DEFAULT '0' COMMENT '退货者',
  `ret_dealer` int(11) DEFAULT '0' COMMENT '退货接收者',
  `ret_pro` int(11) DEFAULT NULL,
  `ret_odid` int(11) DEFAULT '0' COMMENT '对应订单ID',
  `ret_odblid` int(11) DEFAULT '0' COMMENT '订单关系id',
  `ret_proqty` int(11) DEFAULT NULL,
  `ret_barcode` varchar(32) DEFAULT NULL,
  `ret_ucode` varchar(32) DEFAULT NULL,
  `ret_tcode` varchar(32) DEFAULT NULL,
  `ret_date` int(11) DEFAULT NULL,
  `ret_remark` varchar(256) DEFAULT NULL COMMENT '申请退换备注',
  `ret_type` int(4) DEFAULT '0' COMMENT '退换货类型 1-换货 2-退货',
  `ret_dealremark` varchar(256) DEFAULT NULL COMMENT '处理备注',
  `ret_status` int(11) DEFAULT '0' COMMENT '状态 默认0-新 1-同意退换 2-不同意',
  PRIMARY KEY (`ret_id`),
  KEY `ship_unitcode` (`ret_unitcode`),
  KEY `ship_barcode` (`ret_barcode`),
  KEY `ret_unitcode` (`ret_unitcode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='退换货处理';

-- ----------------------------
-- Records of fw_returnable
-- ----------------------------

-- ----------------------------
-- Table structure for fw_salemonfanlirate
-- ----------------------------
DROP TABLE IF EXISTS `fw_salemonfanlirate`;
CREATE TABLE `fw_salemonfanlirate` (
  `smfr_id` int(11) NOT NULL AUTO_INCREMENT,
  `smfr_unitcode` varchar(32) DEFAULT NULL,
  `smfr_dltype` int(11) DEFAULT '0' COMMENT '代理级别',
  `smfr_minsale` decimal(10,2) DEFAULT '0.00' COMMENT '最小业绩',
  `smfr_maxsale` decimal(10,2) DEFAULT '0.00' COMMENT '最大业绩',
  `smfr_saleunit` int(11) DEFAULT '0' COMMENT '业绩计算单位',
  `smfr_fanlirate` decimal(10,2) DEFAULT '0.00' COMMENT '返利',
  `smfr_fanlieval` int(11) DEFAULT '0' COMMENT '奖金计算方式',
  `smfr_countdate` int(11) DEFAULT '0' COMMENT '业绩计算时间',
  `smfr_remark` varchar(265) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`smfr_id`),
  KEY `smfr_unitcode` (`smfr_unitcode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='按业绩销售奖设置';

-- ----------------------------
-- Records of fw_salemonfanlirate
-- ----------------------------

-- ----------------------------
-- Table structure for fw_salemonthly
-- ----------------------------
DROP TABLE IF EXISTS `fw_salemonthly`;
CREATE TABLE `fw_salemonthly` (
  `sm_id` int(11) NOT NULL AUTO_INCREMENT,
  `sm_unitcode` varchar(32) DEFAULT NULL,
  `sm_dlid` int(11) DEFAULT '0' COMMENT '收方代理',
  `sm_senddlid` int(11) DEFAULT '0' COMMENT '发方代理',
  `sm_mysale` decimal(10,2) DEFAULT '0.00' COMMENT '我的业绩',
  `sm_teamsale` decimal(10,2) DEFAULT '0.00' COMMENT '团队业绩',
  `sm_reward` decimal(10,2) DEFAULT '0.00' COMMENT '奖金',
  `sm_date` int(11) DEFAULT '0' COMMENT '计算月份',
  `sm_flid` int(11) DEFAULT '0' COMMENT '对应返利表id',
  `sm_addtime` int(11) DEFAULT '0' COMMENT '添加时间',
  `sm_state` int(11) DEFAULT '0' COMMENT '状态备用',
  `sm_remark` varchar(256) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`sm_id`),
  KEY `sm_unitcode` (`sm_unitcode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='按月销量奖励返利(如：卡一西)';

-- ----------------------------
-- Records of fw_salemonthly
-- ----------------------------

-- ----------------------------
-- Table structure for fw_salesreward
-- ----------------------------
DROP TABLE IF EXISTS `fw_salesreward`;
CREATE TABLE `fw_salesreward` (
  `sr_id` int(11) NOT NULL AUTO_INCREMENT,
  `sr_unitcode` varchar(32) DEFAULT NULL,
  `sr_salesvolume` int(11) DEFAULT NULL COMMENT '销量',
  `sr_unitreward` decimal(10,2) DEFAULT '0.00' COMMENT '每1销量单位奖励多少',
  `sr_total` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '总金额',
  `sr_addtime` int(11) NOT NULL DEFAULT '0' COMMENT '申请时间',
  `sr_dlid` int(11) NOT NULL DEFAULT '0' COMMENT '接受奖励的代理id',
  `sr_senddlid` int(11) DEFAULT '0' COMMENT '发放奖励id 0-公司',
  `sr_flid` int(11) DEFAULT '0' COMMENT '对应返利详细里面的id',
  `sr_state` int(11) DEFAULT '1' COMMENT '状态，默认1-有效- 0-无效 与返利乡详细里状态相关',
  PRIMARY KEY (`sr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='销售累计奖励(瑧善)';

-- ----------------------------
-- Records of fw_salesreward
-- ----------------------------

-- ----------------------------
-- Table structure for fw_sellrecord
-- ----------------------------
DROP TABLE IF EXISTS `fw_sellrecord`;
CREATE TABLE `fw_sellrecord` (
  `fid` int(11) NOT NULL AUTO_INCREMENT,
  `unitcode` varchar(4) DEFAULT NULL,
  `sellcount` int(11) DEFAULT NULL COMMENT '理论发行数',
  `mybegin` int(11) DEFAULT NULL,
  `txttype` tinyint(4) DEFAULT NULL,
  `selldatetime` datetime DEFAULT NULL,
  `operator` varchar(30) DEFAULT NULL,
  `endflag` varchar(10) DEFAULT NULL,
  `memo` varchar(100) DEFAULT NULL,
  `snyn` tinyint(4) DEFAULT NULL,
  `snbegin` varchar(30) DEFAULT NULL,
  `snend` varchar(30) DEFAULT NULL,
  `upyn` varchar(1) DEFAULT NULL,
  `voice01` varchar(250) DEFAULT NULL,
  `renote` varchar(200) DEFAULT NULL,
  `remark` varchar(300) DEFAULT NULL,
  `lot_no` varchar(50) DEFAULT NULL,
  `pr_date` datetime DEFAULT NULL,
  `ex_date` datetime DEFAULT NULL,
  `exdays` int(11) DEFAULT NULL,
  `mqty` decimal(18,0) DEFAULT NULL COMMENT '实际发行数',
  `packtype` varchar(50) DEFAULT NULL,
  `pdqty` int(11) DEFAULT NULL,
  `pzqty` int(11) DEFAULT NULL,
  `pxqty` int(11) DEFAULT NULL,
  `sntype` varchar(50) DEFAULT NULL,
  `dsnf` varchar(50) DEFAULT NULL,
  `dsnt` varchar(50) DEFAULT NULL,
  `zsnf` varchar(50) DEFAULT NULL,
  `zsnt` varchar(50) DEFAULT NULL,
  `sbqty` decimal(18,0) DEFAULT NULL,
  `sxqty` int(11) DEFAULT NULL,
  PRIMARY KEY (`fid`)
) ENGINE=InnoDB AUTO_INCREMENT=4364 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='生码发行记录';

-- ----------------------------
-- Records of fw_sellrecord
-- ----------------------------
INSERT INTO `fw_sellrecord` VALUES ('4362', '3321', '50400', '1', '0', '2018-07-03 00:00:00', '', '', '', '0', '10000001', '10002520', 'N', '', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0', '50400', '2-大小包装', '1', '0', '20', '4-双码流水号2', '', '', '', '', '0', '10000');
INSERT INTO `fw_sellrecord` VALUES ('4363', '3321', '53280', '50401', '0', '2018-07-03 00:00:00', '', '', '', '0', '10002521', '10004000', 'N', '', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0', '53280', '2-大小包装', '1', '0', '36', '4-双码流水号2', '', '', '', '', '0', '36');

-- ----------------------------
-- Table structure for fw_session
-- ----------------------------
DROP TABLE IF EXISTS `fw_session`;
CREATE TABLE `fw_session` (
  `session_id` varchar(255) NOT NULL,
  `session_expire` int(11) NOT NULL,
  `session_data` blob,
  UNIQUE KEY `session_id` (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of fw_session
-- ----------------------------

-- ----------------------------
-- Table structure for fw_sharelinks
-- ----------------------------
DROP TABLE IF EXISTS `fw_sharelinks`;
CREATE TABLE `fw_sharelinks` (
  `sl_id` int(11) NOT NULL AUTO_INCREMENT,
  `sl_unitcode` varchar(32) DEFAULT NULL,
  `sl_brid` int(11) DEFAULT NULL,
  `sl_dealerid` int(11) DEFAULT NULL,
  `sl_level` int(11) DEFAULT '0',
  `sl_endtime` int(11) DEFAULT NULL,
  `sl_views` int(11) DEFAULT NULL,
  `sl_applynum` int(11) DEFAULT NULL,
  PRIMARY KEY (`sl_id`)
) ENGINE=InnoDB AUTO_INCREMENT=162 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='代理邀请链接';

-- ----------------------------
-- Records of fw_sharelinks
-- ----------------------------
INSERT INTO `fw_sharelinks` VALUES ('131', '3321', '0', '62', '2', '1531339691', '3', '0');
INSERT INTO `fw_sharelinks` VALUES ('134', '3321', '0', '61', '3', '1531835462', '2', '1');
INSERT INTO `fw_sharelinks` VALUES ('135', '3321', '0', '60', '3', '1531838257', '2', '1');
INSERT INTO `fw_sharelinks` VALUES ('137', '3321', '0', '71', '3', '1532554720', '9', '1');
INSERT INTO `fw_sharelinks` VALUES ('142', '3321', '0', '67', '3', '1537645619', '9', '2');
INSERT INTO `fw_sharelinks` VALUES ('143', '3321', '0', '67', '2', '1537648531', '0', '0');
INSERT INTO `fw_sharelinks` VALUES ('144', '3321', '0', '67', '2', '1537648582', '0', '0');
INSERT INTO `fw_sharelinks` VALUES ('145', '3321', '0', '67', '2', '1537648666', '0', '0');
INSERT INTO `fw_sharelinks` VALUES ('146', '3321', '0', '67', '6', '1537648674', '20', '4');
INSERT INTO `fw_sharelinks` VALUES ('149', '3321', '0', '69', '6', '1537721447', '3', '1');
INSERT INTO `fw_sharelinks` VALUES ('150', '3321', '0', '79', '2', '1537893892', '0', '0');
INSERT INTO `fw_sharelinks` VALUES ('151', '3321', '0', '79', '6', '1537893901', '3', '1');
INSERT INTO `fw_sharelinks` VALUES ('153', '3321', '0', '89', '3', '1541540050', '0', '0');
INSERT INTO `fw_sharelinks` VALUES ('154', '3321', '0', '66', '2', '1542135332', '0', '0');
INSERT INTO `fw_sharelinks` VALUES ('155', '3321', '0', '66', '2', '1542135354', '0', '0');
INSERT INTO `fw_sharelinks` VALUES ('156', '3321', '0', '66', '3', '1542136199', '0', '0');
INSERT INTO `fw_sharelinks` VALUES ('157', '3321', '0', '66', '2', '1542137164', '0', '0');
INSERT INTO `fw_sharelinks` VALUES ('158', '3321', '0', '66', '2', '1542137245', '0', '0');
INSERT INTO `fw_sharelinks` VALUES ('159', '3321', '0', '1', '9', '1542470682', '0', '0');
INSERT INTO `fw_sharelinks` VALUES ('160', '3321', '0', '3', '9', '1542627044', '1', '1');
INSERT INTO `fw_sharelinks` VALUES ('161', '3321', '0', '2', '9', '1542627535', '1', '0');

-- ----------------------------
-- Table structure for fw_shipment
-- ----------------------------
DROP TABLE IF EXISTS `fw_shipment`;
CREATE TABLE `fw_shipment` (
  `ship_id` int(11) NOT NULL AUTO_INCREMENT,
  `ship_unitcode` varchar(32) DEFAULT NULL,
  `ship_number` varchar(32) DEFAULT NULL,
  `ship_deliver` int(11) DEFAULT '0' COMMENT '出货提供者',
  `ship_dealer` int(11) DEFAULT '0' COMMENT '出货接收者',
  `ship_pro` int(11) DEFAULT NULL,
  `ship_odid` int(11) DEFAULT '0' COMMENT '对应订单ID',
  `ship_odblid` int(11) DEFAULT '0' COMMENT '订单关系id',
  `ship_whid` int(11) DEFAULT NULL COMMENT '出货仓库',
  `ship_proqty` int(11) DEFAULT NULL,
  `ship_barcode` varchar(32) DEFAULT NULL,
  `ship_ucode` varchar(32) DEFAULT NULL,
  `ship_tcode` varchar(32) DEFAULT NULL,
  `ship_date` int(11) DEFAULT NULL,
  `ship_remark` text,
  `ship_cztype` int(4) DEFAULT '0' COMMENT '操作者类型 0-企业主主账户  1-企业子管理用户 2-经销商',
  `ship_czid` int(11) DEFAULT '0' COMMENT '操作者ID',
  `ship_czuser` varchar(64) DEFAULT NULL,
  `ship_prodate` varchar(32) DEFAULT NULL COMMENT '产品生产日期',
  `ship_batchnum` varchar(32) DEFAULT NULL COMMENT '生产批号',
  `ship_status` int(11) DEFAULT '0' COMMENT '出货状态 默认0-正常 2-禁用',
  PRIMARY KEY (`ship_id`),
  KEY `ship_unitcode` (`ship_unitcode`),
  KEY `ship_barcode` (`ship_barcode`)
) ENGINE=InnoDB AUTO_INCREMENT=295 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of fw_shipment
-- ----------------------------
INSERT INTO `fw_shipment` VALUES ('278', '3321', '201810301543135387', '0', '1', '18', '0', '0', '7', '20', '10000001', '', '', '1542124800', '', '0', '1191', 'test', null, null, '0');
INSERT INTO `fw_shipment` VALUES ('279', '3321', '634563656', '1', '2', '18', '0', '0', '7', '20', '10000001', '', '', '1514822400', '', '2', '1', 'test', null, null, '0');
INSERT INTO `fw_shipment` VALUES ('280', '3321', '201811191006186593', '0', '1', '18', '6', '98', '7', '20', '10000002', '', '', '1542593224', '', '0', '1191', 'test', null, null, '0');
INSERT INTO `fw_shipment` VALUES ('281', '3321', '201811191004205873', '1', '2', '18', '5', '97', null, '20', '10000002', '', '', '1542593321', '', '2', '1', 'test', null, null, '0');
INSERT INTO `fw_shipment` VALUES ('282', '3321', '201811191012374567', '0', '1', '18', '7', '99', '7', '20', '10000003', '', '', '1542593579', '', '0', '1191', 'test', null, null, '0');
INSERT INTO `fw_shipment` VALUES ('283', '3321', '201811190949215797', '1', '6', '18', '4', '96', null, '20', '10000003', '', '', '1542593802', '', '2', '1', 'test', null, null, '0');
INSERT INTO `fw_shipment` VALUES ('284', '3321', '201811191052145005', '0', '1', '18', '9', '101', '7', '10000', '10000004', '', '', '1542595960', '', '0', '1191', 'test', null, null, '0');
INSERT INTO `fw_shipment` VALUES ('285', '3321', '201811191050549575', '1', '6', '18', '8', '100', null, '10000', '10000004', '', '', '1542596035', '', '2', '1', 'test', null, null, '0');
INSERT INTO `fw_shipment` VALUES ('286', '3321', '201811191105595814', '0', '1', '18', '11', '103', '7', '10000', '10000005', '', '', '1542596791', '', '0', '1191', 'test', null, null, '0');
INSERT INTO `fw_shipment` VALUES ('287', '3321', '201811191104427941', '1', '7', '18', '10', '102', null, '10000', '10000005', '', '', '1542596827', '', '2', '1', 'test', null, null, '0');
INSERT INTO `fw_shipment` VALUES ('289', '3321', '201811191119115980', '0', '8', '18', '13', '105', '7', '10000', '10000006', '', '', '1542597584', '', '0', '1191', 'test', null, null, '0');
INSERT INTO `fw_shipment` VALUES ('290', '3321', '201811191131554860', '0', '8', '18', '14', '106', '7', '10000', '10000007', '', '', '1542598393', '', '0', '1191', 'test', null, null, '0');
INSERT INTO `fw_shipment` VALUES ('291', '3321', '201811191146294221', '0', '8', '18', '16', '108', '7', '10000', '10000008', '', '', '1542599211', '', '0', '1191', 'test', null, null, '0');
INSERT INTO `fw_shipment` VALUES ('292', '3321', '201811191143319278', '8', '10', '18', '15', '107', null, '10000', '10000008', '', '', '1542599250', '', '2', '8', '15875872796', null, null, '0');
INSERT INTO `fw_shipment` VALUES ('293', '3321', '201811191156252104', '0', '8', '18', '18', '110', '7', '10000', '10000009', '', '', '1542599810', '', '0', '1191', 'test', null, null, '0');
INSERT INTO `fw_shipment` VALUES ('294', '3321', '201811191155579250', '8', '11', '18', '17', '109', null, '10000', '10000009', '', '', '1542599915', '', '2', '8', '15875872796', null, null, '0');

-- ----------------------------
-- Table structure for fw_shopcart
-- ----------------------------
DROP TABLE IF EXISTS `fw_shopcart`;
CREATE TABLE `fw_shopcart` (
  `sc_id` int(11) NOT NULL AUTO_INCREMENT,
  `sc_unitcode` varchar(32) DEFAULT NULL,
  `sc_dlid` int(11) DEFAULT '0',
  `sc_proid` int(11) DEFAULT '0',
  `sc_qty` int(11) DEFAULT '0',
  `sc_addtime` int(11) DEFAULT '0',
  PRIMARY KEY (`sc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=175 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='购物车';

-- ----------------------------
-- Records of fw_shopcart
-- ----------------------------
INSERT INTO `fw_shopcart` VALUES ('150', '3321', '76', '16', '16', '1535900538');

-- ----------------------------
-- Table structure for fw_sip
-- ----------------------------
DROP TABLE IF EXISTS `fw_sip`;
CREATE TABLE `fw_sip` (
  `s_id` int(11) NOT NULL AUTO_INCREMENT,
  `s_ip` varchar(64) DEFAULT NULL,
  `s_maxfid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`s_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of fw_sip
-- ----------------------------

-- ----------------------------
-- Table structure for fw_snmm
-- ----------------------------
DROP TABLE IF EXISTS `fw_snmm`;
CREATE TABLE `fw_snmm` (
  `fid` int(11) NOT NULL AUTO_INCREMENT,
  `unitcode` varchar(4) DEFAULT NULL,
  `address` int(11) DEFAULT NULL,
  `codea` varchar(32) DEFAULT NULL,
  `codeb` varchar(32) DEFAULT NULL,
  `codec` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`fid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of fw_snmm
-- ----------------------------

-- ----------------------------
-- Table structure for fw_storage
-- ----------------------------
DROP TABLE IF EXISTS `fw_storage`;
CREATE TABLE `fw_storage` (
  `stor_id` int(11) NOT NULL AUTO_INCREMENT,
  `stor_unitcode` varchar(32) DEFAULT NULL,
  `stor_number` varchar(32) DEFAULT NULL COMMENT '入库单号',
  `stor_pro` int(11) DEFAULT '0' COMMENT '入库产品id',
  `stor_whid` int(11) DEFAULT NULL COMMENT '入库仓库',
  `stor_proqty` int(11) DEFAULT '0' COMMENT '入库产品数量',
  `stor_barcode` varchar(32) DEFAULT NULL COMMENT '条码',
  `stor_ucode` varchar(32) DEFAULT NULL COMMENT '大标',
  `stor_tcode` varchar(32) DEFAULT NULL COMMENT '中标',
  `stor_date` int(11) DEFAULT NULL COMMENT '入库时间',
  `stor_remark` text,
  `stor_cztype` int(4) DEFAULT '0' COMMENT '操作者类型 0-企业主主账户  1-企业子管理用户 2-经销商',
  `stor_czid` int(11) DEFAULT '0' COMMENT '操作者ID',
  `stor_czuser` varchar(64) DEFAULT NULL,
  `stor_prodate` varchar(32) DEFAULT NULL COMMENT '产品生产日期',
  `stor_batchnum` varchar(32) DEFAULT NULL COMMENT '生产批号',
  `stor_isship` int(11) NOT NULL DEFAULT '0' COMMENT '是否已出货',
  PRIMARY KEY (`stor_id`),
  KEY `ship_unitcode` (`stor_unitcode`),
  KEY `ship_barcode` (`stor_barcode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='产品入库';

-- ----------------------------
-- Records of fw_storage
-- ----------------------------

-- ----------------------------
-- Table structure for fw_storchaibox
-- ----------------------------
DROP TABLE IF EXISTS `fw_storchaibox`;
CREATE TABLE `fw_storchaibox` (
  `chai_id` int(11) NOT NULL AUTO_INCREMENT,
  `chai_unitcode` varchar(32) DEFAULT NULL,
  `chai_addtime` int(11) DEFAULT NULL,
  `chai_barcode` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`chai_id`),
  KEY `chai_unitcode` (`chai_unitcode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='产品入库拆箱记录';

-- ----------------------------
-- Records of fw_storchaibox
-- ----------------------------

-- ----------------------------
-- Table structure for fw_sysadmin
-- ----------------------------
DROP TABLE IF EXISTS `fw_sysadmin`;
CREATE TABLE `fw_sysadmin` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_username` varchar(30) DEFAULT NULL,
  `admin_pwd` varchar(64) DEFAULT NULL,
  `admin_truename` varchar(20) DEFAULT NULL,
  `admin_email` varchar(64) DEFAULT NULL,
  `admin_tel` varchar(64) DEFAULT NULL,
  `admin_des` varchar(250) DEFAULT NULL,
  `admin_purview` text,
  `admin_addtime` int(11) DEFAULT NULL,
  `admin_logintime` int(11) DEFAULT '0',
  `admin_errtimes` int(4) DEFAULT '0',
  `admin_active` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of fw_sysadmin
-- ----------------------------

-- ----------------------------
-- Table structure for fw_tellist
-- ----------------------------
DROP TABLE IF EXISTS `fw_tellist`;
CREATE TABLE `fw_tellist` (
  `tid` int(11) NOT NULL AUTO_INCREMENT,
  `fid` int(11) NOT NULL DEFAULT '0',
  `unitcode` varchar(10) DEFAULT NULL,
  `fwcode` varchar(200) DEFAULT NULL,
  `querystatu` varchar(10) DEFAULT NULL,
  `querydate` datetime DEFAULT NULL,
  `callerid` varchar(64) DEFAULT NULL,
  `calltime` int(11) DEFAULT '0',
  `remark` varchar(64) DEFAULT NULL,
  `chid` varchar(10) DEFAULT NULL,
  `upyn` varchar(10) DEFAULT NULL,
  `qutype` varchar(1) DEFAULT NULL,
  `remess` varchar(150) DEFAULT NULL,
  `k` decimal(18,0) DEFAULT '0',
  `jfqty` decimal(18,2) DEFAULT '0.00',
  `cu_name` varchar(50) DEFAULT NULL,
  `loca` varchar(30) DEFAULT NULL,
  `man_no` varchar(20) DEFAULT NULL,
  `snno` varchar(30) DEFAULT NULL,
  `sloca` varchar(30) DEFAULT NULL,
  `fcresult` varchar(50) DEFAULT NULL,
  `yun` int(4) DEFAULT '0',
  PRIMARY KEY (`tid`),
  KEY `unitcode` (`unitcode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of fw_tellist
-- ----------------------------

-- ----------------------------
-- Table structure for fw_templist
-- ----------------------------
DROP TABLE IF EXISTS `fw_templist`;
CREATE TABLE `fw_templist` (
  `tmp_fid` int(11) NOT NULL AUTO_INCREMENT,
  `tmp_unitcode` varchar(32) DEFAULT NULL,
  `tmp_code` varchar(32) DEFAULT NULL,
  `tmp_state` int(4) DEFAULT '0',
  `tmp_ip` varchar(32) DEFAULT NULL,
  `tmp_addtime` int(11) DEFAULT NULL,
  `tmp_remark` varchar(512) DEFAULT NULL,
  `tmp_referer` varchar(512) DEFAULT NULL,
  `tmp_clr` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`tmp_fid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of fw_templist
-- ----------------------------

-- ----------------------------
-- Table structure for fw_warehouse
-- ----------------------------
DROP TABLE IF EXISTS `fw_warehouse`;
CREATE TABLE `fw_warehouse` (
  `wh_id` int(11) NOT NULL AUTO_INCREMENT,
  `wh_unitcode` varchar(32) DEFAULT NULL,
  `wh_munber` varchar(64) DEFAULT NULL COMMENT '仓库编号',
  `wh_name` varchar(64) DEFAULT NULL COMMENT '仓库名称',
  `wh_address` varchar(64) DEFAULT NULL COMMENT '仓库场所地址',
  `wh_director` varchar(64) DEFAULT NULL COMMENT '仓库管理员',
  `wh_remark` text COMMENT '备注',
  PRIMARY KEY (`wh_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='仓库管理';

-- ----------------------------
-- Records of fw_warehouse
-- ----------------------------
INSERT INTO `fw_warehouse` VALUES ('7', '3321', 'store_001', '安吉思', '', '', '');

-- ----------------------------
-- Table structure for fw_yifuattr
-- ----------------------------
DROP TABLE IF EXISTS `fw_yifuattr`;
CREATE TABLE `fw_yifuattr` (
  `attr_id` int(11) NOT NULL AUTO_INCREMENT,
  `attr_unitcode` varchar(32) DEFAULT NULL,
  `attr_proid` int(11) DEFAULT '0',
  `attr_color` varchar(16) DEFAULT NULL,
  `attr_size` varchar(16) NOT NULL,
  `attr_stock` int(11) NOT NULL DEFAULT '0',
  `attr_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`attr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='产品服装属性';

-- ----------------------------
-- Records of fw_yifuattr
-- ----------------------------

-- ----------------------------
-- Table structure for fw_yufukuan
-- ----------------------------
DROP TABLE IF EXISTS `fw_yufukuan`;
CREATE TABLE `fw_yufukuan` (
  `yfk_id` int(11) NOT NULL AUTO_INCREMENT,
  `yfk_unitcode` varchar(32) DEFAULT NULL COMMENT '企业码',
  `yfk_type` int(11) DEFAULT '0' COMMENT '预付款类型',
  `yfk_sendid` int(11) DEFAULT '0' COMMENT '发款方id',
  `yfk_receiveid` int(11) DEFAULT '0' COMMENT '收款方id',
  `yfk_money` decimal(10,2) DEFAULT '0.00' COMMENT '金额',
  `yfk_refedlid` int(11) DEFAULT '0' COMMENT '推荐返利时被推荐人的id',
  `yfk_oddlid` int(11) DEFAULT '0' COMMENT '订单返利中下单人id',
  `yfk_odid` int(11) DEFAULT '0' COMMENT '订单返利中订单id',
  `yfk_orderid` varchar(32) DEFAULT NULL COMMENT '订单返利中订单号',
  `yfk_odblid` int(11) DEFAULT '0' COMMENT '订单返利中订单关系id',
  `yfk_proid` int(11) DEFAULT '0' COMMENT '订单返利中产品id',
  `yfk_qty` int(11) DEFAULT '0' COMMENT '订单返利中产品数量',
  `yfk_level` int(11) DEFAULT '0' COMMENT '返利中的层次',
  `yfk_addtime` int(11) DEFAULT '0' COMMENT '时间',
  `yfk_remark` varchar(256) DEFAULT NULL COMMENT '简单说明',
  `yfk_state` int(11) DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`yfk_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='预付款明细表';

-- ----------------------------
-- Records of fw_yufukuan
-- ----------------------------
INSERT INTO `fw_yufukuan` VALUES ('11', '3321', '1', '0', '60', '200.00', '0', '0', '0', '', '0', '0', '0', '0', '1531276930', '充值', '1');
INSERT INTO `fw_yufukuan` VALUES ('12', '3321', '1', '60', '0', '200.00', '0', '0', '0', '', '0', '0', '0', '0', '1531277003', '111', '1');
