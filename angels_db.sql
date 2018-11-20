/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1_3306
Source Server Version : 50553
Source Host           : 127.0.0.1:3306
Source Database       : angels_db

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2018-11-20 16:54:50
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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='海报设置';

-- ----------------------------
-- Records of fw_adinfo
-- ----------------------------
INSERT INTO `fw_adinfo` VALUES ('19', '3408', '1', '海报1', '', '3408/15427006388.jpg', '', '1542700638');
INSERT INTO `fw_adinfo` VALUES ('21', '3408', '1', '海报2', '', '3408/15427007021.jpg', '', '1542700702');
INSERT INTO `fw_adinfo` VALUES ('22', '3408', '1', '海报3', '', '3408/15427007152.jpg', '', '1542700715');
INSERT INTO `fw_adinfo` VALUES ('23', '3408', '1', '海报4', '', '3408/15427007224.jpg', '', '1542700722');

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
) ENGINE=InnoDB AUTO_INCREMENT=4325552 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of fw_code
-- ----------------------------
INSERT INTO `fw_code` VALUES ('4323236', '3408', '1', '1675', '4004', '0681');
INSERT INTO `fw_code` VALUES ('4323237', '3408', '2', '5117', '6537', '5120');
INSERT INTO `fw_code` VALUES ('4323238', '3408', '3', '4156', '7930', '8540');
INSERT INTO `fw_code` VALUES ('4323239', '3408', '4', '2767', '4387', '7924');
INSERT INTO `fw_code` VALUES ('4323240', '3408', '5', '2915', '4129', '6272');
INSERT INTO `fw_code` VALUES ('4323241', '3408', '6', '2381', '0458', '3727');
INSERT INTO `fw_code` VALUES ('4323242', '3408', '7', '9456', '3629', '4147');
INSERT INTO `fw_code` VALUES ('4323243', '3408', '8', '2941', '0847', '5103');
INSERT INTO `fw_code` VALUES ('4323244', '3408', '9', '4797', '0335', '9594');
INSERT INTO `fw_code` VALUES ('4323245', '3408', '10', '2808', '5395', '7763');
INSERT INTO `fw_code` VALUES ('4323246', '3408', '11', '7920', '0343', '5183');
INSERT INTO `fw_code` VALUES ('4323247', '3408', '12', '3622', '4260', '5995');
INSERT INTO `fw_code` VALUES ('4323248', '3408', '13', '9843', '7558', '8344');
INSERT INTO `fw_code` VALUES ('4323249', '3408', '14', '6399', '1347', '7227');
INSERT INTO `fw_code` VALUES ('4323250', '3408', '15', '6893', '4010', '9933');
INSERT INTO `fw_code` VALUES ('4323251', '3408', '16', '7467', '8688', '2317');
INSERT INTO `fw_code` VALUES ('4323252', '3408', '17', '5397', '1732', '0808');
INSERT INTO `fw_code` VALUES ('4323253', '3408', '18', '3154', '8315', '2121');
INSERT INTO `fw_code` VALUES ('4323254', '3408', '19', '9029', '8692', '0112');
INSERT INTO `fw_code` VALUES ('4323255', '3408', '20', '4476', '4133', '4067');
INSERT INTO `fw_code` VALUES ('4323256', '3408', '21', '4116', '6923', '8701');
INSERT INTO `fw_code` VALUES ('4323257', '3408', '22', '0418', '2236', '0728');
INSERT INTO `fw_code` VALUES ('4323258', '3408', '23', '4329', '4391', '5719');
INSERT INTO `fw_code` VALUES ('4323259', '3408', '24', '4650', '0593', '1245');
INSERT INTO `fw_code` VALUES ('4323260', '3408', '25', '3342', '9065', '0308');
INSERT INTO `fw_code` VALUES ('4323261', '3408', '26', '0845', '7172', '4763');
INSERT INTO `fw_code` VALUES ('4323262', '3408', '27', '0138', '7041', '5040');
INSERT INTO `fw_code` VALUES ('4323263', '3408', '28', '5331', '4006', '2138');
INSERT INTO `fw_code` VALUES ('4323264', '3408', '29', '8388', '6288', '9058');
INSERT INTO `fw_code` VALUES ('4323265', '3408', '30', '4436', '3125', '4228');
INSERT INTO `fw_code` VALUES ('4323266', '3408', '31', '1766', '4772', '1504');
INSERT INTO `fw_code` VALUES ('4323267', '3408', '32', '9176', '8434', '8460');
INSERT INTO `fw_code` VALUES ('4323268', '3408', '33', '3942', '0462', '1522');
INSERT INTO `fw_code` VALUES ('4323269', '3408', '34', '8535', '6030', '7406');
INSERT INTO `fw_code` VALUES ('4323270', '3408', '35', '3902', '9454', '1683');
INSERT INTO `fw_code` VALUES ('4323271', '3408', '36', '6186', '3879', '0210');
INSERT INTO `fw_code` VALUES ('4323272', '3408', '37', '2661', '5653', '9415');
INSERT INTO `fw_code` VALUES ('4323273', '3408', '38', '8455', '4014', '7728');
INSERT INTO `fw_code` VALUES ('4323274', '3408', '39', '9202', '5153', '7290');
INSERT INTO `fw_code` VALUES ('4323275', '3408', '40', '6359', '0339', '7388');
INSERT INTO `fw_code` VALUES ('4323276', '3408', '41', '4543', '1859', '2737');
INSERT INTO `fw_code` VALUES ('4323277', '3408', '42', '8882', '8950', '1763');
INSERT INTO `fw_code` VALUES ('4323278', '3408', '43', '5011', '7803', '6611');
INSERT INTO `fw_code` VALUES ('4323279', '3408', '44', '7040', '3752', '8281');
INSERT INTO `fw_code` VALUES ('4323280', '3408', '45', '6933', '5018', '9772');
INSERT INTO `fw_code` VALUES ('4323281', '3408', '46', '9817', '0839', '9513');
INSERT INTO `fw_code` VALUES ('4323282', '3408', '47', '3983', '1470', '1361');
INSERT INTO `fw_code` VALUES ('4323283', '3408', '48', '0885', '8180', '4602');
INSERT INTO `fw_code` VALUES ('4323284', '3408', '49', '2487', '9192', '2236');
INSERT INTO `fw_code` VALUES ('4323285', '3408', '50', '6572', '7807', '4406');
INSERT INTO `fw_code` VALUES ('4323286', '3408', '51', '8775', '0216', '3255');
INSERT INTO `fw_code` VALUES ('4323287', '3408', '52', '7895', '3625', '6352');
INSERT INTO `fw_code` VALUES ('4323288', '3408', '53', '1206', '4383', '0129');
INSERT INTO `fw_code` VALUES ('4323289', '3408', '54', '3836', '1728', '3013');
INSERT INTO `fw_code` VALUES ('4323290', '3408', '55', '1419', '1851', '7147');
INSERT INTO `fw_code` VALUES ('4323291', '3408', '56', '8068', '0085', '3531');
INSERT INTO `fw_code` VALUES ('4323292', '3408', '57', '3088', '0589', '3451');
INSERT INTO `fw_code` VALUES ('4323293', '3408', '58', '4263', '6664', '7049');
INSERT INTO `fw_code` VALUES ('4323294', '3408', '59', '9884', '8565', '8183');
INSERT INTO `fw_code` VALUES ('4323295', '3408', '60', '8749', '3498', '4424');
INSERT INTO `fw_code` VALUES ('4323296', '3408', '61', '8134', '7812', '2201');
INSERT INTO `fw_code` VALUES ('4323297', '3408', '62', '7854', '2617', '6513');
INSERT INTO `fw_code` VALUES ('4323298', '3408', '63', '8856', '2232', '2933');
INSERT INTO `fw_code` VALUES ('4323299', '3408', '64', '2594', '7926', '0745');
INSERT INTO `fw_code` VALUES ('4323300', '3408', '65', '3688', '1986', '4665');
INSERT INTO `fw_code` VALUES ('4323301', '3408', '66', '1953', '5522', '9692');
INSERT INTO `fw_code` VALUES ('4323302', '3408', '67', '0992', '6914', '3111');
INSERT INTO `fw_code` VALUES ('4323303', '3408', '68', '9604', '3371', '2495');
INSERT INTO `fw_code` VALUES ('4323304', '3408', '69', '2407', '7177', '2558');
INSERT INTO `fw_code` VALUES ('4323305', '3408', '70', '1873', '3506', '0013');
INSERT INTO `fw_code` VALUES ('4323306', '3408', '71', '6292', '2613', '8719');
INSERT INTO `fw_code` VALUES ('4323307', '3408', '72', '9777', '9831', '9674');
INSERT INTO `fw_code` VALUES ('4323308', '3408', '73', '1633', '9319', '4165');
INSERT INTO `fw_code` VALUES ('4323309', '3408', '74', '2300', '8442', '4049');
INSERT INTO `fw_code` VALUES ('4323310', '3408', '75', '4756', '9327', '9754');
INSERT INTO `fw_code` VALUES ('4323311', '3408', '76', '0458', '3244', '0567');
INSERT INTO `fw_code` VALUES ('4323312', '3408', '77', '6679', '6542', '2915');
INSERT INTO `fw_code` VALUES ('4323313', '3408', '78', '3235', '0331', '1799');
INSERT INTO `fw_code` VALUES ('4323314', '3408', '79', '3729', '2994', '4504');
INSERT INTO `fw_code` VALUES ('4323315', '3408', '80', '6959', '1736', '8603');
INSERT INTO `fw_code` VALUES ('4323316', '3408', '81', '2233', '0716', '5379');
INSERT INTO `fw_code` VALUES ('4323317', '3408', '82', '9990', '7299', '6692');
INSERT INTO `fw_code` VALUES ('4323318', '3408', '83', '5865', '7676', '4683');
INSERT INTO `fw_code` VALUES ('4323319', '3408', '84', '1313', '3117', '8638');
INSERT INTO `fw_code` VALUES ('4323320', '3408', '85', '0952', '5907', '3272');
INSERT INTO `fw_code` VALUES ('4323321', '3408', '86', '7254', '1220', '5299');
INSERT INTO `fw_code` VALUES ('4323322', '3408', '87', '1165', '3375', '0290');
INSERT INTO `fw_code` VALUES ('4323323', '3408', '88', '1486', '9577', '5817');
INSERT INTO `fw_code` VALUES ('4323324', '3408', '89', '2834', '2113', '6594');
INSERT INTO `fw_code` VALUES ('4323325', '3408', '90', '7681', '6157', '9335');
INSERT INTO `fw_code` VALUES ('4323326', '3408', '91', '9629', '0089', '1326');
INSERT INTO `fw_code` VALUES ('4323327', '3408', '92', '2167', '2990', '6710');
INSERT INTO `fw_code` VALUES ('4323328', '3408', '93', '5224', '5272', '3629');
INSERT INTO `fw_code` VALUES ('4323329', '3408', '94', '1272', '2109', '8799');
INSERT INTO `fw_code` VALUES ('4323330', '3408', '95', '8602', '3756', '6076');
INSERT INTO `fw_code` VALUES ('4323331', '3408', '96', '8668', '1482', '4746');
INSERT INTO `fw_code` VALUES ('4323332', '3408', '97', '0778', '9446', '6094');
INSERT INTO `fw_code` VALUES ('4323333', '3408', '98', '8027', '9077', '3692');
INSERT INTO `fw_code` VALUES ('4323334', '3408', '99', '0738', '8438', '6254');
INSERT INTO `fw_code` VALUES ('4323335', '3408', '100', '3022', '2863', '4781');
INSERT INTO `fw_code` VALUES ('4323336', '3408', '101', '9497', '4637', '3986');
INSERT INTO `fw_code` VALUES ('4323337', '3408', '102', '5291', '2998', '2299');
INSERT INTO `fw_code` VALUES ('4323338', '3408', '103', '6038', '4137', '1862');
INSERT INTO `fw_code` VALUES ('4323339', '3408', '104', '3195', '9323', '1960');
INSERT INTO `fw_code` VALUES ('4323340', '3408', '105', '1379', '0843', '7308');
INSERT INTO `fw_code` VALUES ('4323341', '3408', '106', '5718', '7934', '6335');
INSERT INTO `fw_code` VALUES ('4323342', '3408', '107', '1847', '6787', '1183');
INSERT INTO `fw_code` VALUES ('4323343', '3408', '108', '3876', '2736', '2852');
INSERT INTO `fw_code` VALUES ('4323344', '3408', '109', '8918', '3088', '3492');
INSERT INTO `fw_code` VALUES ('4323345', '3408', '110', '4457', '2973', '4948');
INSERT INTO `fw_code` VALUES ('4323346', '3408', '111', '8623', '3604', '6796');
INSERT INTO `fw_code` VALUES ('4323347', '3408', '112', '5526', '0314', '0037');
INSERT INTO `fw_code` VALUES ('4323348', '3408', '113', '7128', '1326', '7671');
INSERT INTO `fw_code` VALUES ('4323349', '3408', '114', '8557', '5877', '8126');
INSERT INTO `fw_code` VALUES ('4323350', '3408', '115', '0759', '8286', '6975');
INSERT INTO `fw_code` VALUES ('4323351', '3408', '116', '2535', '5759', '1787');
INSERT INTO `fw_code` VALUES ('4323352', '3408', '117', '5846', '6516', '5564');
INSERT INTO `fw_code` VALUES ('4323353', '3408', '118', '5820', '9798', '6733');
INSERT INTO `fw_code` VALUES ('4323354', '3408', '119', '6060', '3985', '2582');
INSERT INTO `fw_code` VALUES ('4323355', '3408', '120', '0052', '8155', '7251');
INSERT INTO `fw_code` VALUES ('4323356', '3408', '121', '5072', '8659', '7171');
INSERT INTO `fw_code` VALUES ('4323357', '3408', '122', '6247', '4734', '0769');
INSERT INTO `fw_code` VALUES ('4323358', '3408', '123', '1868', '6635', '1903');
INSERT INTO `fw_code` VALUES ('4323359', '3408', '124', '3389', '5632', '9859');
INSERT INTO `fw_code` VALUES ('4323360', '3408', '125', '0119', '5881', '5921');
INSERT INTO `fw_code` VALUES ('4323361', '3408', '126', '9839', '0687', '0233');
INSERT INTO `fw_code` VALUES ('4323362', '3408', '127', '3496', '4366', '8368');
INSERT INTO `fw_code` VALUES ('4323363', '3408', '128', '7235', '0060', '6180');
INSERT INTO `fw_code` VALUES ('4323364', '3408', '129', '5673', '0056', '8385');
INSERT INTO `fw_code` VALUES ('4323365', '3408', '130', '6594', '7655', '5126');
INSERT INTO `fw_code` VALUES ('4323366', '3408', '131', '5632', '9048', '8546');
INSERT INTO `fw_code` VALUES ('4323367', '3408', '132', '4244', '5505', '7930');
INSERT INTO `fw_code` VALUES ('4323368', '3408', '133', '4391', '5246', '6278');
INSERT INTO `fw_code` VALUES ('4323369', '3408', '134', '3857', '1576', '3733');
INSERT INTO `fw_code` VALUES ('4323370', '3408', '135', '8277', '0683', '2439');
INSERT INTO `fw_code` VALUES ('4323371', '3408', '136', '1761', '7901', '3394');
INSERT INTO `fw_code` VALUES ('4323372', '3408', '137', '6273', '1453', '9600');
INSERT INTO `fw_code` VALUES ('4323373', '3408', '138', '4284', '6512', '7769');
INSERT INTO `fw_code` VALUES ('4323374', '3408', '139', '6741', '7397', '3474');
INSERT INTO `fw_code` VALUES ('4323375', '3408', '140', '5098', '5378', '6001');
INSERT INTO `fw_code` VALUES ('4323376', '3408', '141', '8664', '4611', '6635');
INSERT INTO `fw_code` VALUES ('4323377', '3408', '142', '7876', '2465', '7234');
INSERT INTO `fw_code` VALUES ('4323378', '3408', '143', '5713', '1064', '8224');
INSERT INTO `fw_code` VALUES ('4323379', '3408', '144', '8944', '9806', '2323');
INSERT INTO `fw_code` VALUES ('4323380', '3408', '145', '4218', '8786', '9099');
INSERT INTO `fw_code` VALUES ('4323381', '3408', '146', '1975', '5369', '0412');
INSERT INTO `fw_code` VALUES ('4323382', '3408', '147', '7850', '5746', '8403');
INSERT INTO `fw_code` VALUES ('4323383', '3408', '148', '5953', '5251', '4073');
INSERT INTO `fw_code` VALUES ('4323384', '3408', '149', '2936', '3976', '6992');
INSERT INTO `fw_code` VALUES ('4323385', '3408', '150', '9238', '9290', '9019');
INSERT INTO `fw_code` VALUES ('4323386', '3408', '151', '3150', '1445', '4010');
INSERT INTO `fw_code` VALUES ('4323387', '3408', '152', '3470', '7647', '9537');
INSERT INTO `fw_code` VALUES ('4323388', '3408', '153', '4818', '0183', '0314');
INSERT INTO `fw_code` VALUES ('4323389', '3408', '154', '2321', '8290', '4769');
INSERT INTO `fw_code` VALUES ('4323390', '3408', '155', '1614', '8159', '5046');
INSERT INTO `fw_code` VALUES ('4323391', '3408', '156', '6807', '5124', '2144');
INSERT INTO `fw_code` VALUES ('4323392', '3408', '157', '7209', '3341', '7349');
INSERT INTO `fw_code` VALUES ('4323393', '3408', '158', '3257', '0179', '2519');
INSERT INTO `fw_code` VALUES ('4323394', '3408', '159', '0586', '1826', '9796');
INSERT INTO `fw_code` VALUES ('4323395', '3408', '160', '0653', '9552', '8466');
INSERT INTO `fw_code` VALUES ('4323396', '3408', '161', '5419', '1580', '1528');
INSERT INTO `fw_code` VALUES ('4323397', '3408', '162', '0012', '7147', '7412');
INSERT INTO `fw_code` VALUES ('4323398', '3408', '163', '2723', '6508', '9974');
INSERT INTO `fw_code` VALUES ('4323399', '3408', '164', '7662', '4997', '0216');
INSERT INTO `fw_code` VALUES ('4323400', '3408', '165', '4137', '6770', '9421');
INSERT INTO `fw_code` VALUES ('4323401', '3408', '166', '7275', '1068', '6019');
INSERT INTO `fw_code` VALUES ('4323402', '3408', '167', '8023', '2207', '5582');
INSERT INTO `fw_code` VALUES ('4323403', '3408', '168', '5179', '7393', '5680');
INSERT INTO `fw_code` VALUES ('4323404', '3408', '169', '3363', '8913', '1028');
INSERT INTO `fw_code` VALUES ('4323405', '3408', '170', '7702', '6004', '0055');
INSERT INTO `fw_code` VALUES ('4323406', '3408', '171', '6487', '8921', '6617');
INSERT INTO `fw_code` VALUES ('4323407', '3408', '172', '8516', '4870', '8287');
INSERT INTO `fw_code` VALUES ('4323408', '3408', '173', '8410', '6135', '9778');
INSERT INTO `fw_code` VALUES ('4323409', '3408', '174', '1294', '1957', '9519');
INSERT INTO `fw_code` VALUES ('4323410', '3408', '175', '5459', '2588', '1367');
INSERT INTO `fw_code` VALUES ('4323411', '3408', '176', '2362', '9298', '4608');
INSERT INTO `fw_code` VALUES ('4323412', '3408', '177', '3964', '0310', '2242');
INSERT INTO `fw_code` VALUES ('4323413', '3408', '178', '5393', '4861', '2698');
INSERT INTO `fw_code` VALUES ('4323414', '3408', '179', '7596', '7270', '1546');
INSERT INTO `fw_code` VALUES ('4323415', '3408', '180', '9371', '4743', '6359');
INSERT INTO `fw_code` VALUES ('4323416', '3408', '181', '2682', '5500', '0135');
INSERT INTO `fw_code` VALUES ('4323417', '3408', '182', '5312', '2846', '3019');
INSERT INTO `fw_code` VALUES ('4323418', '3408', '183', '2896', '2969', '7153');
INSERT INTO `fw_code` VALUES ('4323419', '3408', '184', '6888', '7139', '1823');
INSERT INTO `fw_code` VALUES ('4323420', '3408', '185', '4564', '1707', '3457');
INSERT INTO `fw_code` VALUES ('4323421', '3408', '186', '5739', '7782', '7055');
INSERT INTO `fw_code` VALUES ('4323422', '3408', '187', '8704', '5619', '6474');
INSERT INTO `fw_code` VALUES ('4323423', '3408', '188', '0225', '4616', '4430');
INSERT INTO `fw_code` VALUES ('4323424', '3408', '189', '6955', '4865', '0492');
INSERT INTO `fw_code` VALUES ('4323425', '3408', '190', '6675', '9671', '4805');
INSERT INTO `fw_code` VALUES ('4323426', '3408', '191', '0332', '3350', '2939');
INSERT INTO `fw_code` VALUES ('4323427', '3408', '192', '4071', '9044', '0751');
INSERT INTO `fw_code` VALUES ('4323428', '3408', '193', '2509', '9040', '2957');
INSERT INTO `fw_code` VALUES ('4323429', '3408', '194', '3430', '6639', '9698');
INSERT INTO `fw_code` VALUES ('4323430', '3408', '195', '2468', '8032', '3117');
INSERT INTO `fw_code` VALUES ('4323431', '3408', '196', '1080', '4489', '2501');
INSERT INTO `fw_code` VALUES ('4323432', '3408', '197', '1227', '4230', '0849');
INSERT INTO `fw_code` VALUES ('4323433', '3408', '198', '0693', '0560', '8305');
INSERT INTO `fw_code` VALUES ('4323434', '3408', '199', '7769', '3731', '8725');
INSERT INTO `fw_code` VALUES ('4323435', '3408', '200', '8597', '6885', '7965');
INSERT INTO `fw_code` VALUES ('4323436', '3408', '201', '3109', '0437', '4171');
INSERT INTO `fw_code` VALUES ('4323437', '3408', '202', '1120', '5496', '2340');
INSERT INTO `fw_code` VALUES ('4323438', '3408', '203', '3577', '6381', '8046');
INSERT INTO `fw_code` VALUES ('4323439', '3408', '204', '1934', '4362', '0573');
INSERT INTO `fw_code` VALUES ('4323440', '3408', '205', '5500', '3595', '1207');
INSERT INTO `fw_code` VALUES ('4323441', '3408', '206', '4712', '1449', '1805');
INSERT INTO `fw_code` VALUES ('4323442', '3408', '207', '5205', '4112', '4510');
INSERT INTO `fw_code` VALUES ('4323443', '3408', '208', '5780', '8790', '6894');
INSERT INTO `fw_code` VALUES ('4323444', '3408', '209', '3710', '1834', '5385');
INSERT INTO `fw_code` VALUES ('4323445', '3408', '210', '8811', '4353', '4983');
INSERT INTO `fw_code` VALUES ('4323446', '3408', '211', '7341', '8794', '4689');
INSERT INTO `fw_code` VALUES ('4323447', '3408', '212', '2789', '4235', '8644');
INSERT INTO `fw_code` VALUES ('4323448', '3408', '213', '2428', '7024', '3278');
INSERT INTO `fw_code` VALUES ('4323449', '3408', '214', '8730', '2338', '5305');
INSERT INTO `fw_code` VALUES ('4323450', '3408', '215', '2642', '4493', '0296');
INSERT INTO `fw_code` VALUES ('4323451', '3408', '216', '2962', '0695', '5823');
INSERT INTO `fw_code` VALUES ('4323452', '3408', '217', '1654', '9167', '4885');
INSERT INTO `fw_code` VALUES ('4323453', '3408', '218', '9157', '7274', '9341');
INSERT INTO `fw_code` VALUES ('4323454', '3408', '219', '8450', '7143', '9617');
INSERT INTO `fw_code` VALUES ('4323455', '3408', '220', '6165', '9042', '4413');
INSERT INTO `fw_code` VALUES ('4323456', '3408', '221', '9223', '1323', '1333');
INSERT INTO `fw_code` VALUES ('4323457', '3408', '222', '5270', '8161', '6503');
INSERT INTO `fw_code` VALUES ('4323458', '3408', '223', '9944', '5744', '2065');
INSERT INTO `fw_code` VALUES ('4323459', '3408', '224', '0011', '3470', '0735');
INSERT INTO `fw_code` VALUES ('4323460', '3408', '225', '4777', '5498', '3797');
INSERT INTO `fw_code` VALUES ('4323461', '3408', '226', '9370', '1065', '9681');
INSERT INTO `fw_code` VALUES ('4323462', '3408', '227', '4736', '4490', '3958');
INSERT INTO `fw_code` VALUES ('4323463', '3408', '228', '7020', '8915', '2485');
INSERT INTO `fw_code` VALUES ('4323464', '3408', '229', '3495', '0689', '1690');
INSERT INTO `fw_code` VALUES ('4323465', '3408', '230', '6633', '4986', '8288');
INSERT INTO `fw_code` VALUES ('4323466', '3408', '231', '7381', '6125', '7851');
INSERT INTO `fw_code` VALUES ('4323467', '3408', '232', '7193', '5375', '9663');
INSERT INTO `fw_code` VALUES ('4323468', '3408', '233', '5377', '6895', '5012');
INSERT INTO `fw_code` VALUES ('4323469', '3408', '234', '7060', '9922', '2324');
INSERT INTO `fw_code` VALUES ('4323470', '3408', '235', '5845', '2839', '8887');
INSERT INTO `fw_code` VALUES ('4323471', '3408', '236', '7874', '8788', '0556');
INSERT INTO `fw_code` VALUES ('4323472', '3408', '237', '7768', '0054', '2047');
INSERT INTO `fw_code` VALUES ('4323473', '3408', '238', '0652', '5875', '1788');
INSERT INTO `fw_code` VALUES ('4323474', '3408', '239', '4817', '6506', '3636');
INSERT INTO `fw_code` VALUES ('4323475', '3408', '240', '1720', '3216', '6878');
INSERT INTO `fw_code` VALUES ('4323476', '3408', '241', '3322', '4228', '4511');
INSERT INTO `fw_code` VALUES ('4323477', '3408', '242', '7407', '2843', '6681');
INSERT INTO `fw_code` VALUES ('4323478', '3408', '243', '6954', '1188', '3815');
INSERT INTO `fw_code` VALUES ('4323479', '3408', '244', '8729', '8661', '8628');
INSERT INTO `fw_code` VALUES ('4323480', '3408', '245', '2040', '9419', '2404');
INSERT INTO `fw_code` VALUES ('4323481', '3408', '246', '4670', '6764', '5288');
INSERT INTO `fw_code` VALUES ('4323482', '3408', '247', '2254', '6887', '9422');
INSERT INTO `fw_code` VALUES ('4323483', '3408', '248', '8902', '5121', '5806');
INSERT INTO `fw_code` VALUES ('4323484', '3408', '249', '3922', '5625', '5726');
INSERT INTO `fw_code` VALUES ('4323485', '3408', '250', '5097', '1700', '9324');
INSERT INTO `fw_code` VALUES ('4323486', '3408', '251', '0718', '3601', '0458');
INSERT INTO `fw_code` VALUES ('4323487', '3408', '252', '9583', '8534', '6699');
INSERT INTO `fw_code` VALUES ('4323488', '3408', '253', '6313', '8784', '2761');
INSERT INTO `fw_code` VALUES ('4323489', '3408', '254', '8688', '7653', '8788');
INSERT INTO `fw_code` VALUES ('4323490', '3408', '255', '9690', '7268', '5208');
INSERT INTO `fw_code` VALUES ('4323491', '3408', '256', '3429', '2962', '3020');
INSERT INTO `fw_code` VALUES ('4323492', '3408', '257', '1867', '2958', '5226');
INSERT INTO `fw_code` VALUES ('4323493', '3408', '258', '2788', '0557', '1967');
INSERT INTO `fw_code` VALUES ('4323494', '3408', '259', '1826', '1950', '5386');
INSERT INTO `fw_code` VALUES ('4323495', '3408', '260', '0438', '8407', '4770');
INSERT INTO `fw_code` VALUES ('4323496', '3408', '261', '0585', '8149', '3119');
INSERT INTO `fw_code` VALUES ('4323497', '3408', '262', '0051', '4478', '0574');
INSERT INTO `fw_code` VALUES ('4323498', '3408', '263', '7127', '7649', '0994');
INSERT INTO `fw_code` VALUES ('4323499', '3408', '264', '0611', '4867', '1949');
INSERT INTO `fw_code` VALUES ('4323500', '3408', '265', '2467', '4355', '6440');
INSERT INTO `fw_code` VALUES ('4323501', '3408', '266', '0478', '9414', '4610');
INSERT INTO `fw_code` VALUES ('4323502', '3408', '267', '5591', '4363', '2030');
INSERT INTO `fw_code` VALUES ('4323503', '3408', '268', '1292', '8280', '2842');
INSERT INTO `fw_code` VALUES ('4323504', '3408', '269', '7514', '1577', '5190');
INSERT INTO `fw_code` VALUES ('4323505', '3408', '270', '4070', '5367', '4074');
INSERT INTO `fw_code` VALUES ('4323506', '3408', '271', '4563', '8030', '6779');
INSERT INTO `fw_code` VALUES ('4323507', '3408', '272', '5138', '2708', '9163');
INSERT INTO `fw_code` VALUES ('4323508', '3408', '273', '3068', '5752', '7654');
INSERT INTO `fw_code` VALUES ('4323509', '3408', '274', '0825', '2335', '8967');
INSERT INTO `fw_code` VALUES ('4323510', '3408', '275', '6699', '2712', '6958');
INSERT INTO `fw_code` VALUES ('4323511', '3408', '276', '2147', '8153', '0913');
INSERT INTO `fw_code` VALUES ('4323512', '3408', '277', '1786', '0942', '5547');
INSERT INTO `fw_code` VALUES ('4323513', '3408', '278', '8088', '6256', '7574');
INSERT INTO `fw_code` VALUES ('4323514', '3408', '279', '2000', '8411', '2565');
INSERT INTO `fw_code` VALUES ('4323515', '3408', '280', '2320', '4613', '8092');
INSERT INTO `fw_code` VALUES ('4323516', '3408', '281', '1012', '3085', '7154');
INSERT INTO `fw_code` VALUES ('4323517', '3408', '282', '8515', '1192', '1610');
INSERT INTO `fw_code` VALUES ('4323518', '3408', '283', '7808', '1061', '1886');
INSERT INTO `fw_code` VALUES ('4323519', '3408', '284', '3001', '8026', '8985');
INSERT INTO `fw_code` VALUES ('4323520', '3408', '285', '6059', '0308', '5904');
INSERT INTO `fw_code` VALUES ('4323521', '3408', '286', '2106', '7145', '1074');
INSERT INTO `fw_code` VALUES ('4323522', '3408', '287', '9436', '8792', '8351');
INSERT INTO `fw_code` VALUES ('4323523', '3408', '288', '6847', '2454', '5306');
INSERT INTO `fw_code` VALUES ('4323524', '3408', '289', '1613', '4482', '8369');
INSERT INTO `fw_code` VALUES ('4323525', '3408', '290', '6206', '0049', '4253');
INSERT INTO `fw_code` VALUES ('4323526', '3408', '291', '1572', '3474', '8529');
INSERT INTO `fw_code` VALUES ('4323527', '3408', '292', '3856', '7899', '7056');
INSERT INTO `fw_code` VALUES ('4323528', '3408', '293', '0331', '9673', '6262');
INSERT INTO `fw_code` VALUES ('4323529', '3408', '294', '6125', '8034', '4574');
INSERT INTO `fw_code` VALUES ('4323530', '3408', '295', '6873', '9173', '4137');
INSERT INTO `fw_code` VALUES ('4323531', '3408', '296', '4029', '4359', '4235');
INSERT INTO `fw_code` VALUES ('4323532', '3408', '297', '2213', '5879', '9583');
INSERT INTO `fw_code` VALUES ('4323533', '3408', '298', '6552', '2970', '8610');
INSERT INTO `fw_code` VALUES ('4323534', '3408', '299', '2681', '1823', '3458');
INSERT INTO `fw_code` VALUES ('4323535', '3408', '300', '4710', '7772', '5128');
INSERT INTO `fw_code` VALUES ('4323536', '3408', '301', '4604', '9038', '6619');
INSERT INTO `fw_code` VALUES ('4323537', '3408', '302', '1448', '1258', '2319');
INSERT INTO `fw_code` VALUES ('4323538', '3408', '303', '5614', '1889', '4167');
INSERT INTO `fw_code` VALUES ('4323539', '3408', '304', '2516', '8599', '7408');
INSERT INTO `fw_code` VALUES ('4323540', '3408', '305', '4119', '9611', '5042');
INSERT INTO `fw_code` VALUES ('4323541', '3408', '306', '8203', '8226', '7212');
INSERT INTO `fw_code` VALUES ('4323542', '3408', '307', '0406', '0635', '6060');
INSERT INTO `fw_code` VALUES ('4323543', '3408', '308', '9526', '4044', '9158');
INSERT INTO `fw_code` VALUES ('4323544', '3408', '309', '2837', '4802', '2935');
INSERT INTO `fw_code` VALUES ('4323545', '3408', '310', '5467', '2147', '5819');
INSERT INTO `fw_code` VALUES ('4323546', '3408', '311', '3051', '2270', '9953');
INSERT INTO `fw_code` VALUES ('4323547', '3408', '312', '9699', '0504', '6337');
INSERT INTO `fw_code` VALUES ('4323548', '3408', '313', '4719', '1008', '6256');
INSERT INTO `fw_code` VALUES ('4323549', '3408', '314', '5894', '7083', '9854');
INSERT INTO `fw_code` VALUES ('4323550', '3408', '315', '1515', '8984', '0988');
INSERT INTO `fw_code` VALUES ('4323551', '3408', '316', '0380', '3917', '7229');
INSERT INTO `fw_code` VALUES ('4323552', '3408', '317', '9765', '8231', '5006');
INSERT INTO `fw_code` VALUES ('4323553', '3408', '318', '9485', '3036', '9319');
INSERT INTO `fw_code` VALUES ('4323554', '3408', '319', '0487', '2651', '5738');
INSERT INTO `fw_code` VALUES ('4323555', '3408', '320', '4225', '8345', '3551');
INSERT INTO `fw_code` VALUES ('4323556', '3408', '321', '5320', '2405', '7471');
INSERT INTO `fw_code` VALUES ('4323557', '3408', '322', '3585', '5941', '2497');
INSERT INTO `fw_code` VALUES ('4323558', '3408', '323', '2623', '7333', '5917');
INSERT INTO `fw_code` VALUES ('4323559', '3408', '324', '1235', '3790', '5301');
INSERT INTO `fw_code` VALUES ('4323560', '3408', '325', '4038', '7596', '5364');
INSERT INTO `fw_code` VALUES ('4323561', '3408', '326', '3504', '3925', '2819');
INSERT INTO `fw_code` VALUES ('4323562', '3408', '327', '7923', '3032', '1524');
INSERT INTO `fw_code` VALUES ('4323563', '3408', '328', '1408', '0250', '2479');
INSERT INTO `fw_code` VALUES ('4323564', '3408', '329', '3264', '9738', '6970');
INSERT INTO `fw_code` VALUES ('4323565', '3408', '330', '3931', '8861', '6855');
INSERT INTO `fw_code` VALUES ('4323566', '3408', '331', '6388', '9746', '2560');
INSERT INTO `fw_code` VALUES ('4323567', '3408', '332', '2089', '3663', '3372');
INSERT INTO `fw_code` VALUES ('4323568', '3408', '333', '8310', '6961', '5721');
INSERT INTO `fw_code` VALUES ('4323569', '3408', '334', '4866', '0750', '4604');
INSERT INTO `fw_code` VALUES ('4323570', '3408', '335', '5360', '3413', '7310');
INSERT INTO `fw_code` VALUES ('4323571', '3408', '336', '8590', '2155', '1408');
INSERT INTO `fw_code` VALUES ('4323572', '3408', '337', '3865', '1135', '8185');
INSERT INTO `fw_code` VALUES ('4323573', '3408', '338', '1622', '7718', '9497');
INSERT INTO `fw_code` VALUES ('4323574', '3408', '339', '7496', '8095', '7488');
INSERT INTO `fw_code` VALUES ('4323575', '3408', '340', '2944', '3536', '1444');
INSERT INTO `fw_code` VALUES ('4323576', '3408', '341', '2583', '6326', '6078');
INSERT INTO `fw_code` VALUES ('4323577', '3408', '342', '8885', '1639', '8104');
INSERT INTO `fw_code` VALUES ('4323578', '3408', '343', '2796', '3794', '3096');
INSERT INTO `fw_code` VALUES ('4323579', '3408', '344', '3117', '9996', '8622');
INSERT INTO `fw_code` VALUES ('4323580', '3408', '345', '4465', '2532', '9399');
INSERT INTO `fw_code` VALUES ('4323581', '3408', '346', '9312', '6576', '2140');
INSERT INTO `fw_code` VALUES ('4323582', '3408', '347', '1261', '0508', '4131');
INSERT INTO `fw_code` VALUES ('4323583', '3408', '348', '3798', '3409', '9515');
INSERT INTO `fw_code` VALUES ('4323584', '3408', '349', '6855', '5691', '6435');
INSERT INTO `fw_code` VALUES ('4323585', '3408', '350', '2903', '2528', '1604');
INSERT INTO `fw_code` VALUES ('4323586', '3408', '351', '0233', '4175', '8881');
INSERT INTO `fw_code` VALUES ('4323587', '3408', '352', '0299', '1901', '7551');
INSERT INTO `fw_code` VALUES ('4323588', '3408', '353', '2410', '9865', '8899');
INSERT INTO `fw_code` VALUES ('4323589', '3408', '354', '9658', '9496', '6497');
INSERT INTO `fw_code` VALUES ('4323590', '3408', '355', '2369', '8857', '9060');
INSERT INTO `fw_code` VALUES ('4323591', '3408', '356', '4653', '3282', '7586');
INSERT INTO `fw_code` VALUES ('4323592', '3408', '357', '1128', '5056', '6792');
INSERT INTO `fw_code` VALUES ('4323593', '3408', '358', '6922', '3417', '5105');
INSERT INTO `fw_code` VALUES ('4323594', '3408', '359', '7669', '4556', '4667');
INSERT INTO `fw_code` VALUES ('4323595', '3408', '360', '4826', '9742', '4765');
INSERT INTO `fw_code` VALUES ('4323596', '3408', '361', '3010', '1262', '0113');
INSERT INTO `fw_code` VALUES ('4323597', '3408', '362', '7349', '8353', '9140');
INSERT INTO `fw_code` VALUES ('4323598', '3408', '363', '3478', '7206', '3988');
INSERT INTO `fw_code` VALUES ('4323599', '3408', '364', '5507', '3155', '5658');
INSERT INTO `fw_code` VALUES ('4323600', '3408', '365', '5400', '4421', '7149');
INSERT INTO `fw_code` VALUES ('4323601', '3408', '366', '0940', '4306', '8605');
INSERT INTO `fw_code` VALUES ('4323602', '3408', '367', '5106', '4937', '0453');
INSERT INTO `fw_code` VALUES ('4323603', '3408', '368', '2008', '1647', '3694');
INSERT INTO `fw_code` VALUES ('4323604', '3408', '369', '3611', '2659', '1328');
INSERT INTO `fw_code` VALUES ('4323605', '3408', '370', '5040', '7210', '1783');
INSERT INTO `fw_code` VALUES ('4323606', '3408', '371', '7242', '9619', '0631');
INSERT INTO `fw_code` VALUES ('4323607', '3408', '372', '9018', '7092', '5444');
INSERT INTO `fw_code` VALUES ('4323608', '3408', '373', '2329', '7850', '9221');
INSERT INTO `fw_code` VALUES ('4323609', '3408', '374', '2303', '1131', '0390');
INSERT INTO `fw_code` VALUES ('4323610', '3408', '375', '2542', '5318', '6239');
INSERT INTO `fw_code` VALUES ('4323611', '3408', '376', '6535', '9488', '0908');
INSERT INTO `fw_code` VALUES ('4323612', '3408', '377', '1555', '9992', '0828');
INSERT INTO `fw_code` VALUES ('4323613', '3408', '378', '2730', '6068', '4426');
INSERT INTO `fw_code` VALUES ('4323614', '3408', '379', '8351', '7968', '5560');
INSERT INTO `fw_code` VALUES ('4323615', '3408', '380', '9872', '6965', '3515');
INSERT INTO `fw_code` VALUES ('4323616', '3408', '381', '6601', '7215', '9578');
INSERT INTO `fw_code` VALUES ('4323617', '3408', '382', '6321', '2020', '3890');
INSERT INTO `fw_code` VALUES ('4323618', '3408', '383', '9979', '5699', '2024');
INSERT INTO `fw_code` VALUES ('4323619', '3408', '384', '3717', '1393', '9837');
INSERT INTO `fw_code` VALUES ('4323620', '3408', '385', '2156', '1389', '2042');
INSERT INTO `fw_code` VALUES ('4323621', '3408', '386', '3076', '8988', '8783');
INSERT INTO `fw_code` VALUES ('4323622', '3408', '387', '2115', '0381', '2203');
INSERT INTO `fw_code` VALUES ('4323623', '3408', '388', '0727', '6838', '1587');
INSERT INTO `fw_code` VALUES ('4323624', '3408', '389', '0874', '6580', '9935');
INSERT INTO `fw_code` VALUES ('4323625', '3408', '390', '0340', '2909', '7390');
INSERT INTO `fw_code` VALUES ('4323626', '3408', '391', '4760', '2016', '6095');
INSERT INTO `fw_code` VALUES ('4323627', '3408', '392', '8244', '9234', '7051');
INSERT INTO `fw_code` VALUES ('4323628', '3408', '393', '2756', '2786', '3256');
INSERT INTO `fw_code` VALUES ('4323629', '3408', '394', '0767', '7845', '1426');
INSERT INTO `fw_code` VALUES ('4323630', '3408', '395', '3224', '8730', '7131');
INSERT INTO `fw_code` VALUES ('4323631', '3408', '396', '1581', '6711', '9658');
INSERT INTO `fw_code` VALUES ('4323632', '3408', '397', '0324', '4943', '9704');
INSERT INTO `fw_code` VALUES ('4323633', '3408', '398', '9536', '2796', '0303');
INSERT INTO `fw_code` VALUES ('4323634', '3408', '399', '7374', '1395', '1294');
INSERT INTO `fw_code` VALUES ('4323635', '3408', '400', '0604', '0137', '5392');
INSERT INTO `fw_code` VALUES ('4323636', '3408', '401', '5878', '9117', '2169');
INSERT INTO `fw_code` VALUES ('4323637', '3408', '402', '3635', '5700', '3481');
INSERT INTO `fw_code` VALUES ('4323638', '3408', '403', '9510', '6077', '1472');
INSERT INTO `fw_code` VALUES ('4323639', '3408', '404', '7613', '5582', '7142');
INSERT INTO `fw_code` VALUES ('4323640', '3408', '405', '4597', '4308', '0061');
INSERT INTO `fw_code` VALUES ('4323641', '3408', '406', '0899', '9621', '2088');
INSERT INTO `fw_code` VALUES ('4323642', '3408', '407', '4810', '1776', '7079');
INSERT INTO `fw_code` VALUES ('4323643', '3408', '408', '5131', '7978', '2606');
INSERT INTO `fw_code` VALUES ('4323644', '3408', '409', '6479', '0514', '3383');
INSERT INTO `fw_code` VALUES ('4323645', '3408', '410', '3982', '8621', '7838');
INSERT INTO `fw_code` VALUES ('4323646', '3408', '411', '3274', '8490', '8115');
INSERT INTO `fw_code` VALUES ('4323647', '3408', '412', '8468', '5455', '5213');
INSERT INTO `fw_code` VALUES ('4323648', '3408', '413', '8869', '3673', '0419');
INSERT INTO `fw_code` VALUES ('4323649', '3408', '414', '4917', '0510', '5588');
INSERT INTO `fw_code` VALUES ('4323650', '3408', '415', '2247', '2157', '2865');
INSERT INTO `fw_code` VALUES ('4323651', '3408', '416', '2313', '9883', '1535');
INSERT INTO `fw_code` VALUES ('4323652', '3408', '417', '7079', '1911', '4597');
INSERT INTO `fw_code` VALUES ('4323653', '3408', '418', '1672', '7478', '0481');
INSERT INTO `fw_code` VALUES ('4323654', '3408', '419', '4383', '6839', '3044');
INSERT INTO `fw_code` VALUES ('4323655', '3408', '420', '9322', '5328', '3285');
INSERT INTO `fw_code` VALUES ('4323656', '3408', '421', '5797', '7102', '2490');
INSERT INTO `fw_code` VALUES ('4323657', '3408', '422', '8936', '1399', '9088');
INSERT INTO `fw_code` VALUES ('4323658', '3408', '423', '9683', '2538', '8651');
INSERT INTO `fw_code` VALUES ('4323659', '3408', '424', '6840', '7724', '8749');
INSERT INTO `fw_code` VALUES ('4323660', '3408', '425', '5024', '9244', '4097');
INSERT INTO `fw_code` VALUES ('4323661', '3408', '426', '9363', '6335', '3124');
INSERT INTO `fw_code` VALUES ('4323662', '3408', '427', '8147', '9252', '9687');
INSERT INTO `fw_code` VALUES ('4323663', '3408', '428', '0177', '5201', '1356');
INSERT INTO `fw_code` VALUES ('4323664', '3408', '429', '0070', '6467', '2847');
INSERT INTO `fw_code` VALUES ('4323665', '3408', '430', '2954', '2288', '2588');
INSERT INTO `fw_code` VALUES ('4323666', '3408', '431', '7120', '2919', '4437');
INSERT INTO `fw_code` VALUES ('4323667', '3408', '432', '4022', '9629', '7678');
INSERT INTO `fw_code` VALUES ('4323668', '3408', '433', '5624', '0641', '5312');
INSERT INTO `fw_code` VALUES ('4323669', '3408', '434', '7053', '5192', '5767');
INSERT INTO `fw_code` VALUES ('4323670', '3408', '435', '9256', '7601', '4615');
INSERT INTO `fw_code` VALUES ('4323671', '3408', '436', '1031', '5074', '9428');
INSERT INTO `fw_code` VALUES ('4323672', '3408', '437', '4343', '5832', '3204');
INSERT INTO `fw_code` VALUES ('4323673', '3408', '438', '6972', '3177', '6088');
INSERT INTO `fw_code` VALUES ('4323674', '3408', '439', '4556', '3300', '0222');
INSERT INTO `fw_code` VALUES ('4323675', '3408', '440', '8549', '7470', '4892');
INSERT INTO `fw_code` VALUES ('4323676', '3408', '441', '6225', '2038', '6526');
INSERT INTO `fw_code` VALUES ('4323677', '3408', '442', '7400', '8113', '0124');
INSERT INTO `fw_code` VALUES ('4323678', '3408', '443', '0365', '5950', '9543');
INSERT INTO `fw_code` VALUES ('4323679', '3408', '444', '1886', '4947', '7499');
INSERT INTO `fw_code` VALUES ('4323680', '3408', '445', '8615', '5197', '3561');
INSERT INTO `fw_code` VALUES ('4323681', '3408', '446', '8335', '0002', '7874');
INSERT INTO `fw_code` VALUES ('4323682', '3408', '447', '1993', '3681', '6008');
INSERT INTO `fw_code` VALUES ('4323683', '3408', '448', '5731', '9375', '3820');
INSERT INTO `fw_code` VALUES ('4323684', '3408', '449', '4169', '9371', '6026');
INSERT INTO `fw_code` VALUES ('4323685', '3408', '450', '5090', '6970', '2767');
INSERT INTO `fw_code` VALUES ('4323686', '3408', '451', '4129', '8363', '6187');
INSERT INTO `fw_code` VALUES ('4323687', '3408', '452', '2740', '4820', '5570');
INSERT INTO `fw_code` VALUES ('4323688', '3408', '453', '2888', '4562', '3919');
INSERT INTO `fw_code` VALUES ('4323689', '3408', '454', '2354', '0891', '1374');
INSERT INTO `fw_code` VALUES ('4323690', '3408', '455', '9429', '4062', '1794');
INSERT INTO `fw_code` VALUES ('4323691', '3408', '456', '0258', '7216', '1035');
INSERT INTO `fw_code` VALUES ('4323692', '3408', '457', '4770', '0768', '7240');
INSERT INTO `fw_code` VALUES ('4323693', '3408', '458', '2781', '5827', '5410');
INSERT INTO `fw_code` VALUES ('4323694', '3408', '459', '5238', '6712', '1115');
INSERT INTO `fw_code` VALUES ('4323695', '3408', '460', '3595', '4693', '3642');
INSERT INTO `fw_code` VALUES ('4323696', '3408', '461', '7160', '3927', '4276');
INSERT INTO `fw_code` VALUES ('4323697', '3408', '462', '6372', '1780', '4874');
INSERT INTO `fw_code` VALUES ('4323698', '3408', '463', '6866', '4443', '7579');
INSERT INTO `fw_code` VALUES ('4323699', '3408', '464', '7440', '9121', '9963');
INSERT INTO `fw_code` VALUES ('4323700', '3408', '465', '5370', '2165', '8455');
INSERT INTO `fw_code` VALUES ('4323701', '3408', '466', '0471', '4684', '8052');
INSERT INTO `fw_code` VALUES ('4323702', '3408', '467', '9002', '9125', '7758');
INSERT INTO `fw_code` VALUES ('4323703', '3408', '468', '4449', '4566', '1713');
INSERT INTO `fw_code` VALUES ('4323704', '3408', '469', '4088', '7355', '6347');
INSERT INTO `fw_code` VALUES ('4323705', '3408', '470', '0390', '2669', '8374');
INSERT INTO `fw_code` VALUES ('4323706', '3408', '471', '4302', '4824', '3365');
INSERT INTO `fw_code` VALUES ('4323707', '3408', '472', '4623', '1026', '8892');
INSERT INTO `fw_code` VALUES ('4323708', '3408', '473', '3315', '9498', '7954');
INSERT INTO `fw_code` VALUES ('4323709', '3408', '474', '0818', '7605', '2410');
INSERT INTO `fw_code` VALUES ('4323710', '3408', '475', '0110', '7474', '2686');
INSERT INTO `fw_code` VALUES ('4323711', '3408', '476', '5304', '4439', '9785');
INSERT INTO `fw_code` VALUES ('4323712', '3408', '477', '8361', '6721', '6704');
INSERT INTO `fw_code` VALUES ('4323713', '3408', '478', '4409', '3558', '1874');
INSERT INTO `fw_code` VALUES ('4323714', '3408', '479', '9083', '1141', '7436');
INSERT INTO `fw_code` VALUES ('4323715', '3408', '480', '9149', '8867', '6106');
INSERT INTO `fw_code` VALUES ('4323716', '3408', '481', '3915', '0895', '9169');
INSERT INTO `fw_code` VALUES ('4323717', '3408', '482', '8508', '6462', '5053');
INSERT INTO `fw_code` VALUES ('4323718', '3408', '483', '3875', '9887', '9330');
INSERT INTO `fw_code` VALUES ('4323719', '3408', '484', '6158', '4312', '7856');
INSERT INTO `fw_code` VALUES ('4323720', '3408', '485', '2634', '6086', '7062');
INSERT INTO `fw_code` VALUES ('4323721', '3408', '486', '5772', '0383', '3660');
INSERT INTO `fw_code` VALUES ('4323722', '3408', '487', '6519', '1522', '3222');
INSERT INTO `fw_code` VALUES ('4323723', '3408', '488', '6332', '0772', '5035');
INSERT INTO `fw_code` VALUES ('4323724', '3408', '489', '4516', '2292', '0383');
INSERT INTO `fw_code` VALUES ('4323725', '3408', '490', '6199', '5319', '7695');
INSERT INTO `fw_code` VALUES ('4323726', '3408', '491', '4983', '8236', '4258');
INSERT INTO `fw_code` VALUES ('4323727', '3408', '492', '7013', '4185', '5928');
INSERT INTO `fw_code` VALUES ('4323728', '3408', '493', '6906', '5451', '7419');
INSERT INTO `fw_code` VALUES ('4323729', '3408', '494', '9790', '1272', '7160');
INSERT INTO `fw_code` VALUES ('4323730', '3408', '495', '3956', '1903', '9008');
INSERT INTO `fw_code` VALUES ('4323731', '3408', '496', '0858', '8613', '2249');
INSERT INTO `fw_code` VALUES ('4323732', '3408', '497', '4953', '4647', '7317');
INSERT INTO `fw_code` VALUES ('4323733', '3408', '498', '9038', '3262', '9487');
INSERT INTO `fw_code` VALUES ('4323734', '3408', '499', '8585', '1607', '6620');
INSERT INTO `fw_code` VALUES ('4323735', '3408', '500', '0360', '9080', '1433');
INSERT INTO `fw_code` VALUES ('4323736', '3408', '501', '3671', '9838', '5210');
INSERT INTO `fw_code` VALUES ('4323737', '3408', '502', '6301', '7183', '8094');
INSERT INTO `fw_code` VALUES ('4323738', '3408', '503', '3885', '7306', '2228');
INSERT INTO `fw_code` VALUES ('4323739', '3408', '504', '0533', '5540', '8612');
INSERT INTO `fw_code` VALUES ('4323740', '3408', '505', '5553', '6044', '8531');
INSERT INTO `fw_code` VALUES ('4323741', '3408', '506', '6728', '2119', '2130');
INSERT INTO `fw_code` VALUES ('4323742', '3408', '507', '2349', '4020', '3264');
INSERT INTO `fw_code` VALUES ('4323743', '3408', '508', '1215', '8953', '9504');
INSERT INTO `fw_code` VALUES ('4323744', '3408', '509', '7944', '9203', '5567');
INSERT INTO `fw_code` VALUES ('4323745', '3408', '510', '0320', '8072', '1594');
INSERT INTO `fw_code` VALUES ('4323746', '3408', '511', '1321', '7687', '8013');
INSERT INTO `fw_code` VALUES ('4323747', '3408', '512', '5060', '3381', '5826');
INSERT INTO `fw_code` VALUES ('4323748', '3408', '513', '3498', '3377', '8031');
INSERT INTO `fw_code` VALUES ('4323749', '3408', '514', '4419', '0976', '4772');
INSERT INTO `fw_code` VALUES ('4323750', '3408', '515', '3458', '2369', '8192');
INSERT INTO `fw_code` VALUES ('4323751', '3408', '516', '2069', '8826', '7576');
INSERT INTO `fw_code` VALUES ('4323752', '3408', '517', '2216', '8568', '5924');
INSERT INTO `fw_code` VALUES ('4323753', '3408', '518', '1682', '4897', '3379');
INSERT INTO `fw_code` VALUES ('4323754', '3408', '519', '8758', '8068', '3799');
INSERT INTO `fw_code` VALUES ('4323755', '3408', '520', '2242', '5286', '4755');
INSERT INTO `fw_code` VALUES ('4323756', '3408', '521', '4099', '4774', '9246');
INSERT INTO `fw_code` VALUES ('4323757', '3408', '522', '2110', '9833', '7415');
INSERT INTO `fw_code` VALUES ('4323758', '3408', '523', '7222', '4782', '4835');
INSERT INTO `fw_code` VALUES ('4323759', '3408', '524', '2924', '8699', '5647');
INSERT INTO `fw_code` VALUES ('4323760', '3408', '525', '9145', '1996', '7996');
INSERT INTO `fw_code` VALUES ('4323761', '3408', '526', '5701', '5786', '6879');
INSERT INTO `fw_code` VALUES ('4323762', '3408', '527', '6194', '8449', '9585');
INSERT INTO `fw_code` VALUES ('4323763', '3408', '528', '6769', '3127', '1969');
INSERT INTO `fw_code` VALUES ('4323764', '3408', '529', '4699', '6171', '0460');
INSERT INTO `fw_code` VALUES ('4323765', '3408', '530', '2456', '2754', '1772');
INSERT INTO `fw_code` VALUES ('4323766', '3408', '531', '8331', '3131', '9763');
INSERT INTO `fw_code` VALUES ('4323767', '3408', '532', '3778', '8572', '3719');
INSERT INTO `fw_code` VALUES ('4323768', '3408', '533', '3417', '1362', '8353');
INSERT INTO `fw_code` VALUES ('4323769', '3408', '534', '9719', '6675', '0380');
INSERT INTO `fw_code` VALUES ('4323770', '3408', '535', '3631', '8830', '5371');
INSERT INTO `fw_code` VALUES ('4323771', '3408', '536', '3951', '5032', '0897');
INSERT INTO `fw_code` VALUES ('4323772', '3408', '537', '2644', '3504', '9960');
INSERT INTO `fw_code` VALUES ('4323773', '3408', '538', '0146', '1611', '4415');
INSERT INTO `fw_code` VALUES ('4323774', '3408', '539', '9439', '1480', '4692');
INSERT INTO `fw_code` VALUES ('4323775', '3408', '540', '4633', '8445', '1790');
INSERT INTO `fw_code` VALUES ('4323776', '3408', '541', '7690', '0727', '8710');
INSERT INTO `fw_code` VALUES ('4323777', '3408', '542', '3738', '7564', '3880');
INSERT INTO `fw_code` VALUES ('4323778', '3408', '543', '6245', '8209', '0569');
INSERT INTO `fw_code` VALUES ('4323779', '3408', '544', '3656', '1871', '7524');
INSERT INTO `fw_code` VALUES ('4323780', '3408', '545', '8422', '3899', '0586');
INSERT INTO `fw_code` VALUES ('4323781', '3408', '546', '3015', '9466', '6470');
INSERT INTO `fw_code` VALUES ('4323782', '3408', '547', '8381', '2891', '0747');
INSERT INTO `fw_code` VALUES ('4323783', '3408', '548', '0665', '7316', '9274');
INSERT INTO `fw_code` VALUES ('4323784', '3408', '549', '7140', '9089', '8479');
INSERT INTO `fw_code` VALUES ('4323785', '3408', '550', '3682', '8590', '6355');
INSERT INTO `fw_code` VALUES ('4323786', '3408', '551', '0838', '3776', '6453');
INSERT INTO `fw_code` VALUES ('4323787', '3408', '552', '9022', '5296', '1801');
INSERT INTO `fw_code` VALUES ('4323788', '3408', '553', '9490', '1240', '5676');
INSERT INTO `fw_code` VALUES ('4323789', '3408', '554', '1519', '7189', '7345');
INSERT INTO `fw_code` VALUES ('4323790', '3408', '555', '1413', '8455', '8836');
INSERT INTO `fw_code` VALUES ('4323791', '3408', '556', '4297', '4276', '8577');
INSERT INTO `fw_code` VALUES ('4323792', '3408', '557', '8462', '4907', '0426');
INSERT INTO `fw_code` VALUES ('4323793', '3408', '558', '5365', '1617', '3667');
INSERT INTO `fw_code` VALUES ('4323794', '3408', '559', '6967', '2629', '1301');
INSERT INTO `fw_code` VALUES ('4323795', '3408', '560', '1052', '1244', '3471');
INSERT INTO `fw_code` VALUES ('4323796', '3408', '561', '2374', '7062', '5417');
INSERT INTO `fw_code` VALUES ('4323797', '3408', '562', '5685', '7820', '9194');
INSERT INTO `fw_code` VALUES ('4323798', '3408', '563', '8315', '5165', '2078');
INSERT INTO `fw_code` VALUES ('4323799', '3408', '564', '5899', '5288', '6211');
INSERT INTO `fw_code` VALUES ('4323800', '3408', '565', '2547', '3522', '2596');
INSERT INTO `fw_code` VALUES ('4323801', '3408', '566', '6914', '6848', '5209');
INSERT INTO `fw_code` VALUES ('4323802', '3408', '567', '5165', '6095', '9227');
INSERT INTO `fw_code` VALUES ('4323803', '3408', '568', '4885', '0900', '3539');
INSERT INTO `fw_code` VALUES ('4323804', '3408', '569', '5886', '0515', '9959');
INSERT INTO `fw_code` VALUES ('4323805', '3408', '570', '9625', '6209', '7771');
INSERT INTO `fw_code` VALUES ('4323806', '3408', '571', '0719', '0269', '1691');
INSERT INTO `fw_code` VALUES ('4323807', '3408', '572', '8984', '3805', '6717');
INSERT INTO `fw_code` VALUES ('4323808', '3408', '573', '6634', '1654', '9521');
INSERT INTO `fw_code` VALUES ('4323809', '3408', '574', '9437', '5460', '9584');
INSERT INTO `fw_code` VALUES ('4323810', '3408', '575', '8903', '1789', '7039');
INSERT INTO `fw_code` VALUES ('4323811', '3408', '576', '3323', '0896', '5744');
INSERT INTO `fw_code` VALUES ('4323812', '3408', '577', '9330', '6726', '1075');
INSERT INTO `fw_code` VALUES ('4323813', '3408', '578', '1787', '7610', '6780');
INSERT INTO `fw_code` VALUES ('4323814', '3408', '579', '7489', '1527', '7592');
INSERT INTO `fw_code` VALUES ('4323815', '3408', '580', '0266', '8614', '8825');
INSERT INTO `fw_code` VALUES ('4323816', '3408', '581', '3990', '0019', '5628');
INSERT INTO `fw_code` VALUES ('4323817', '3408', '582', '9264', '8999', '2405');
INSERT INTO `fw_code` VALUES ('4323818', '3408', '583', '2199', '4581', '3130');
INSERT INTO `fw_code` VALUES ('4323819', '3408', '584', '8073', '4957', '1121');
INSERT INTO `fw_code` VALUES ('4323820', '3408', '585', '3521', '0398', '5076');
INSERT INTO `fw_code` VALUES ('4323821', '3408', '586', '3160', '3188', '9710');
INSERT INTO `fw_code` VALUES ('4323822', '3408', '587', '9462', '8501', '1737');
INSERT INTO `fw_code` VALUES ('4323823', '3408', '588', '3374', '0656', '6728');
INSERT INTO `fw_code` VALUES ('4323824', '3408', '589', '3694', '6858', '2255');
INSERT INTO `fw_code` VALUES ('4323825', '3408', '590', '5042', '9394', '3032');
INSERT INTO `fw_code` VALUES ('4323826', '3408', '591', '9889', '3438', '5773');
INSERT INTO `fw_code` VALUES ('4323827', '3408', '592', '4331', '2392', '5198');
INSERT INTO `fw_code` VALUES ('4323828', '3408', '593', '6868', '5293', '0582');
INSERT INTO `fw_code` VALUES ('4323829', '3408', '594', '9925', '7575', '7502');
INSERT INTO `fw_code` VALUES ('4323830', '3408', '595', '5973', '4412', '2671');
INSERT INTO `fw_code` VALUES ('4323831', '3408', '596', '3303', '6059', '9948');
INSERT INTO `fw_code` VALUES ('4323832', '3408', '597', '3369', '3785', '8618');
INSERT INTO `fw_code` VALUES ('4323833', '3408', '598', '5480', '1749', '9966');
INSERT INTO `fw_code` VALUES ('4323834', '3408', '599', '2728', '1380', '7564');
INSERT INTO `fw_code` VALUES ('4323835', '3408', '600', '5439', '0741', '0127');
INSERT INTO `fw_code` VALUES ('4323836', '3408', '601', '7723', '5166', '8653');
INSERT INTO `fw_code` VALUES ('4323837', '3408', '602', '4198', '6940', '7859');
INSERT INTO `fw_code` VALUES ('4323838', '3408', '603', '9992', '5301', '6171');
INSERT INTO `fw_code` VALUES ('4323839', '3408', '604', '0739', '6440', '5734');
INSERT INTO `fw_code` VALUES ('4323840', '3408', '605', '4350', '6724', '5902');
INSERT INTO `fw_code` VALUES ('4323841', '3408', '606', '0479', '5577', '0750');
INSERT INTO `fw_code` VALUES ('4323842', '3408', '607', '2402', '2792', '3911');
INSERT INTO `fw_code` VALUES ('4323843', '3408', '608', '7942', '2677', '5367');
INSERT INTO `fw_code` VALUES ('4323844', '3408', '609', '2107', '3308', '7215');
INSERT INTO `fw_code` VALUES ('4323845', '3408', '610', '9010', '0018', '0456');
INSERT INTO `fw_code` VALUES ('4323846', '3408', '611', '0612', '1030', '8090');
INSERT INTO `fw_code` VALUES ('4323847', '3408', '612', '2041', '5581', '8545');
INSERT INTO `fw_code` VALUES ('4323848', '3408', '613', '4243', '7990', '7393');
INSERT INTO `fw_code` VALUES ('4323849', '3408', '614', '6019', '5463', '2206');
INSERT INTO `fw_code` VALUES ('4323850', '3408', '615', '9304', '9502', '7152');
INSERT INTO `fw_code` VALUES ('4323851', '3408', '616', '9544', '3689', '3001');
INSERT INTO `fw_code` VALUES ('4323852', '3408', '617', '3536', '7859', '7670');
INSERT INTO `fw_code` VALUES ('4323853', '3408', '618', '1108', '3209', '5551');
INSERT INTO `fw_code` VALUES ('4323854', '3408', '619', '2283', '9285', '9149');
INSERT INTO `fw_code` VALUES ('4323855', '3408', '620', '7903', '1186', '0283');
INSERT INTO `fw_code` VALUES ('4323856', '3408', '621', '9425', '0182', '8239');
INSERT INTO `fw_code` VALUES ('4323857', '3408', '622', '6154', '0432', '4301');
INSERT INTO `fw_code` VALUES ('4323858', '3408', '623', '5874', '5237', '8614');
INSERT INTO `fw_code` VALUES ('4323859', '3408', '624', '9531', '8916', '6748');
INSERT INTO `fw_code` VALUES ('4323860', '3408', '625', '3270', '4610', '4560');
INSERT INTO `fw_code` VALUES ('4323861', '3408', '626', '1708', '4606', '6765');
INSERT INTO `fw_code` VALUES ('4323862', '3408', '627', '2629', '2206', '3507');
INSERT INTO `fw_code` VALUES ('4323863', '3408', '628', '1668', '3598', '6926');
INSERT INTO `fw_code` VALUES ('4323864', '3408', '629', '0279', '0055', '6310');
INSERT INTO `fw_code` VALUES ('4323865', '3408', '630', '0426', '9797', '4658');
INSERT INTO `fw_code` VALUES ('4323866', '3408', '631', '9892', '6126', '2114');
INSERT INTO `fw_code` VALUES ('4323867', '3408', '632', '4312', '5233', '0819');
INSERT INTO `fw_code` VALUES ('4323868', '3408', '633', '7797', '2451', '1774');
INSERT INTO `fw_code` VALUES ('4323869', '3408', '634', '2309', '6003', '7980');
INSERT INTO `fw_code` VALUES ('4323870', '3408', '635', '2776', '1948', '1855');
INSERT INTO `fw_code` VALUES ('4323871', '3408', '636', '1134', '9928', '4382');
INSERT INTO `fw_code` VALUES ('4323872', '3408', '637', '3911', '7015', '5614');
INSERT INTO `fw_code` VALUES ('4323873', '3408', '638', '1749', '5614', '6605');
INSERT INTO `fw_code` VALUES ('4323874', '3408', '639', '4979', '4356', '0703');
INSERT INTO `fw_code` VALUES ('4323875', '3408', '640', '0253', '3336', '7480');
INSERT INTO `fw_code` VALUES ('4323876', '3408', '641', '8010', '9920', '8792');
INSERT INTO `fw_code` VALUES ('4323877', '3408', '642', '9063', '9295', '6196');
INSERT INTO `fw_code` VALUES ('4323878', '3408', '643', '7166', '8799', '1865');
INSERT INTO `fw_code` VALUES ('4323879', '3408', '644', '4149', '7525', '4785');
INSERT INTO `fw_code` VALUES ('4323880', '3408', '645', '0451', '2838', '6812');
INSERT INTO `fw_code` VALUES ('4323881', '3408', '646', '4363', '4993', '1803');
INSERT INTO `fw_code` VALUES ('4323882', '3408', '647', '4683', '1195', '7330');
INSERT INTO `fw_code` VALUES ('4323883', '3408', '648', '3534', '1839', '2562');
INSERT INTO `fw_code` VALUES ('4323884', '3408', '649', '8020', '8672', '9937');
INSERT INTO `fw_code` VALUES ('4323885', '3408', '650', '4470', '3727', '0312');
INSERT INTO `fw_code` VALUES ('4323886', '3408', '651', '1799', '5374', '7589');
INSERT INTO `fw_code` VALUES ('4323887', '3408', '652', '9125', '0150', '6755');
INSERT INTO `fw_code` VALUES ('4323888', '3408', '653', '3718', '5718', '2639');
INSERT INTO `fw_code` VALUES ('4323889', '3408', '654', '6428', '5078', '5201');
INSERT INTO `fw_code` VALUES ('4323890', '3408', '655', '1368', '3567', '5442');
INSERT INTO `fw_code` VALUES ('4323891', '3408', '656', '7843', '5341', '4648');
INSERT INTO `fw_code` VALUES ('4323892', '3408', '657', '0981', '9638', '1246');
INSERT INTO `fw_code` VALUES ('4323893', '3408', '658', '7069', '7483', '6255');
INSERT INTO `fw_code` VALUES ('4323894', '3408', '659', '0193', '7491', '1844');
INSERT INTO `fw_code` VALUES ('4323895', '3408', '660', '2222', '3440', '3514');
INSERT INTO `fw_code` VALUES ('4323896', '3408', '661', '6067', '7868', '9835');
INSERT INTO `fw_code` VALUES ('4323897', '3408', '662', '7670', '8880', '7469');
INSERT INTO `fw_code` VALUES ('4323898', '3408', '663', '1301', '5840', '6773');
INSERT INTO `fw_code` VALUES ('4323899', '3408', '664', '3077', '3313', '1585');
INSERT INTO `fw_code` VALUES ('4323900', '3408', '665', '8270', '0277', '8684');
INSERT INTO `fw_code` VALUES ('4323901', '3408', '666', '9445', '6353', '2282');
INSERT INTO `fw_code` VALUES ('4323902', '3408', '667', '7776', '7614', '5978');
INSERT INTO `fw_code` VALUES ('4323903', '3408', '668', '7136', '5210', '4924');
INSERT INTO `fw_code` VALUES ('4323904', '3408', '669', '4399', '9130', '3532');
INSERT INTO `fw_code` VALUES ('4323905', '3408', '670', '1474', '2301', '3951');
INSERT INTO `fw_code` VALUES ('4323906', '3408', '671', '6815', '9007', '9398');
INSERT INTO `fw_code` VALUES ('4323907', '3408', '672', '7283', '4951', '3273');
INSERT INTO `fw_code` VALUES ('4323908', '3408', '673', '5640', '2932', '5800');
INSERT INTO `fw_code` VALUES ('4323909', '3408', '674', '9205', '2166', '6433');
INSERT INTO `fw_code` VALUES ('4323910', '3408', '675', '8911', '2682', '9737');
INSERT INTO `fw_code` VALUES ('4323911', '3408', '676', '7416', '0404', '0612');
INSERT INTO `fw_code` VALUES ('4323912', '3408', '677', '1047', '7364', '9916');
INSERT INTO `fw_code` VALUES ('4323913', '3408', '678', '6495', '2805', '3871');
INSERT INTO `fw_code` VALUES ('4323914', '3408', '679', '6134', '5595', '8505');
INSERT INTO `fw_code` VALUES ('4323915', '3408', '680', '2436', '0908', '0532');
INSERT INTO `fw_code` VALUES ('4323916', '3408', '681', '6347', '3063', '5523');
INSERT INTO `fw_code` VALUES ('4323917', '3408', '682', '6668', '9265', '1050');
INSERT INTO `fw_code` VALUES ('4323918', '3408', '683', '2863', '5845', '4567');
INSERT INTO `fw_code` VALUES ('4323919', '3408', '684', '6454', '1797', '4032');
INSERT INTO `fw_code` VALUES ('4323920', '3408', '685', '1194', '7106', '8264');
INSERT INTO `fw_code` VALUES ('4323921', '3408', '686', '0554', '4702', '7210');
INSERT INTO `fw_code` VALUES ('4323922', '3408', '687', '5920', '8126', '1487');
INSERT INTO `fw_code` VALUES ('4323923', '3408', '688', '8204', '2551', '0014');
INSERT INTO `fw_code` VALUES ('4323924', '3408', '689', '4679', '4325', '9219');
INSERT INTO `fw_code` VALUES ('4323925', '3408', '690', '8565', '9761', '5380');
INSERT INTO `fw_code` VALUES ('4323926', '3408', '691', '8377', '9011', '7192');
INSERT INTO `fw_code` VALUES ('4323927', '3408', '692', '6561', '0531', '2541');
INSERT INTO `fw_code` VALUES ('4323928', '3408', '693', '7029', '6475', '6416');
INSERT INTO `fw_code` VALUES ('4323929', '3408', '694', '9058', '2424', '8085');
INSERT INTO `fw_code` VALUES ('4323930', '3408', '695', '8951', '3690', '9576');
INSERT INTO `fw_code` VALUES ('4323931', '3408', '696', '1835', '9511', '9317');
INSERT INTO `fw_code` VALUES ('4323932', '3408', '697', '1179', '9140', '0578');
INSERT INTO `fw_code` VALUES ('4323933', '3408', '698', '8081', '5850', '3819');
INSERT INTO `fw_code` VALUES ('4323934', '3408', '699', '3768', '5477', '3623');
INSERT INTO `fw_code` VALUES ('4323935', '3408', '700', '8402', '2053', '9346');
INSERT INTO `fw_code` VALUES ('4323936', '3408', '701', '1032', '9398', '2230');
INSERT INTO `fw_code` VALUES ('4323937', '3408', '702', '5264', '7755', '2748');
INSERT INTO `fw_code` VALUES ('4323938', '3408', '703', '0284', '8259', '2667');
INSERT INTO `fw_code` VALUES ('4323939', '3408', '704', '1459', '4335', '6265');
INSERT INTO `fw_code` VALUES ('4323940', '3408', '705', '5945', '1168', '3640');
INSERT INTO `fw_code` VALUES ('4323941', '3408', '706', '2674', '1418', '9703');
INSERT INTO `fw_code` VALUES ('4323942', '3408', '707', '5050', '0287', '5730');
INSERT INTO `fw_code` VALUES ('4323943', '3408', '708', '6052', '9902', '2149');
INSERT INTO `fw_code` VALUES ('4323944', '3408', '709', '8228', '5592', '2167');
INSERT INTO `fw_code` VALUES ('4323945', '3408', '710', '8188', '4584', '2328');
INSERT INTO `fw_code` VALUES ('4323946', '3408', '711', '6799', '1041', '1712');
INSERT INTO `fw_code` VALUES ('4323947', '3408', '712', '6947', '0783', '0060');
INSERT INTO `fw_code` VALUES ('4323948', '3408', '713', '6413', '7112', '7515');
INSERT INTO `fw_code` VALUES ('4323949', '3408', '714', '3488', '0283', '7935');
INSERT INTO `fw_code` VALUES ('4323950', '3408', '715', '6973', '7501', '8891');
INSERT INTO `fw_code` VALUES ('4323951', '3408', '716', '8829', '6989', '3381');
INSERT INTO `fw_code` VALUES ('4323952', '3408', '717', '1952', '6997', '8971');
INSERT INTO `fw_code` VALUES ('4323953', '3408', '718', '7654', '0914', '9783');
INSERT INTO `fw_code` VALUES ('4323954', '3408', '719', '0431', '8001', '1015');
INSERT INTO `fw_code` VALUES ('4323955', '3408', '720', '0925', '0664', '3721');
INSERT INTO `fw_code` VALUES ('4323956', '3408', '721', '1499', '5342', '6105');
INSERT INTO `fw_code` VALUES ('4323957', '3408', '722', '7186', '4969', '5908');
INSERT INTO `fw_code` VALUES ('4323958', '3408', '723', '3061', '5346', '3899');
INSERT INTO `fw_code` VALUES ('4323959', '3408', '724', '8148', '3577', '2489');
INSERT INTO `fw_code` VALUES ('4323960', '3408', '725', '4450', '8890', '4515');
INSERT INTO `fw_code` VALUES ('4323961', '3408', '726', '8682', '7247', '5033');
INSERT INTO `fw_code` VALUES ('4323962', '3408', '727', '4877', '3827', '8551');
INSERT INTO `fw_code` VALUES ('4323963', '3408', '728', '4170', '3695', '8828');
INSERT INTO `fw_code` VALUES ('4323964', '3408', '729', '2420', '2942', '2846');
INSERT INTO `fw_code` VALUES ('4323965', '3408', '730', '5798', '1426', '5292');
INSERT INTO `fw_code` VALUES ('4323966', '3408', '731', '3208', '5088', '2247');
INSERT INTO `fw_code` VALUES ('4323967', '3408', '732', '7974', '7116', '5310');
INSERT INTO `fw_code` VALUES ('4323968', '3408', '733', '2567', '2684', '1194');
INSERT INTO `fw_code` VALUES ('4323969', '3408', '734', '7934', '6108', '5471');
INSERT INTO `fw_code` VALUES ('4323970', '3408', '735', '0217', '0533', '3997');
INSERT INTO `fw_code` VALUES ('4323971', '3408', '736', '6693', '2307', '3203');
INSERT INTO `fw_code` VALUES ('4323972', '3408', '737', '2486', '0668', '1516');
INSERT INTO `fw_code` VALUES ('4323973', '3408', '738', '3234', '1807', '1078');
INSERT INTO `fw_code` VALUES ('4323974', '3408', '739', '0391', '6993', '1176');
INSERT INTO `fw_code` VALUES ('4323975', '3408', '740', '8575', '8513', '6524');
INSERT INTO `fw_code` VALUES ('4323976', '3408', '741', '9043', '4457', '0399');
INSERT INTO `fw_code` VALUES ('4323977', '3408', '742', '1072', '0406', '2069');
INSERT INTO `fw_code` VALUES ('4323978', '3408', '743', '0965', '1672', '3560');
INSERT INTO `fw_code` VALUES ('4323979', '3408', '744', '3849', '7493', '3301');
INSERT INTO `fw_code` VALUES ('4323980', '3408', '745', '8015', '8124', '5149');
INSERT INTO `fw_code` VALUES ('4323981', '3408', '746', '2807', '6870', '7042');
INSERT INTO `fw_code` VALUES ('4323982', '3408', '747', '1927', '0279', '0140');
INSERT INTO `fw_code` VALUES ('4323983', '3408', '748', '7868', '8382', '6801');
INSERT INTO `fw_code` VALUES ('4323984', '3408', '749', '5451', '8505', '0935');
INSERT INTO `fw_code` VALUES ('4323985', '3408', '750', '2100', '6739', '7319');
INSERT INTO `fw_code` VALUES ('4323986', '3408', '751', '8295', '3319', '0837');
INSERT INTO `fw_code` VALUES ('4323987', '3408', '752', '3916', '5219', '1971');
INSERT INTO `fw_code` VALUES ('4323988', '3408', '753', '2166', '4466', '5989');
INSERT INTO `fw_code` VALUES ('4323989', '3408', '754', '6626', '4580', '4533');
INSERT INTO `fw_code` VALUES ('4323990', '3408', '755', '7720', '8640', '8453');
INSERT INTO `fw_code` VALUES ('4323991', '3408', '756', '5985', '2176', '3480');
INSERT INTO `fw_code` VALUES ('4323992', '3408', '757', '3636', '0025', '6283');
INSERT INTO `fw_code` VALUES ('4323993', '3408', '758', '6439', '3831', '6346');
INSERT INTO `fw_code` VALUES ('4323994', '3408', '759', '5905', '0160', '3801');
INSERT INTO `fw_code` VALUES ('4323995', '3408', '760', '3809', '6485', '3462');
INSERT INTO `fw_code` VALUES ('4323996', '3408', '761', '5665', '5973', '7953');
INSERT INTO `fw_code` VALUES ('4323997', '3408', '762', '8788', '5981', '3542');
INSERT INTO `fw_code` VALUES ('4323998', '3408', '763', '4490', '9898', '4355');
INSERT INTO `fw_code` VALUES ('4323999', '3408', '764', '5918', '2106', '6379');
INSERT INTO `fw_code` VALUES ('4324000', '3408', '765', '2474', '5895', '5263');
INSERT INTO `fw_code` VALUES ('4324001', '3408', '766', '2968', '8558', '7968');
INSERT INTO `fw_code` VALUES ('4324002', '3408', '767', '6198', '7300', '2067');
INSERT INTO `fw_code` VALUES ('4324003', '3408', '768', '1472', '6280', '8843');
INSERT INTO `fw_code` VALUES ('4324004', '3408', '769', '9229', '2864', '0156');
INSERT INTO `fw_code` VALUES ('4324005', '3408', '770', '5104', '3240', '8147');
INSERT INTO `fw_code` VALUES ('4324006', '3408', '771', '0552', '8681', '2102');
INSERT INTO `fw_code` VALUES ('4324007', '3408', '772', '0191', '1471', '6736');
INSERT INTO `fw_code` VALUES ('4324008', '3408', '773', '6493', '6784', '8763');
INSERT INTO `fw_code` VALUES ('4324009', '3408', '774', '0404', '8939', '3754');
INSERT INTO `fw_code` VALUES ('4324010', '3408', '775', '0725', '5141', '9281');
INSERT INTO `fw_code` VALUES ('4324011', '3408', '776', '2073', '7677', '0058');
INSERT INTO `fw_code` VALUES ('4324012', '3408', '777', '6920', '1721', '2799');
INSERT INTO `fw_code` VALUES ('4324013', '3408', '778', '1406', '8554', '0173');
INSERT INTO `fw_code` VALUES ('4324014', '3408', '779', '4463', '0836', '7093');
INSERT INTO `fw_code` VALUES ('4324015', '3408', '780', '0511', '7673', '2263');
INSERT INTO `fw_code` VALUES ('4324016', '3408', '781', '7841', '9320', '9540');
INSERT INTO `fw_code` VALUES ('4324017', '3408', '782', '7907', '7046', '8209');
INSERT INTO `fw_code` VALUES ('4324018', '3408', '783', '0018', '5010', '9557');
INSERT INTO `fw_code` VALUES ('4324019', '3408', '784', '7266', '4642', '7156');
INSERT INTO `fw_code` VALUES ('4324020', '3408', '785', '9977', '4002', '9718');
INSERT INTO `fw_code` VALUES ('4324021', '3408', '786', '2261', '8427', '8245');
INSERT INTO `fw_code` VALUES ('4324022', '3408', '787', '8736', '0201', '7450');
INSERT INTO `fw_code` VALUES ('4324023', '3408', '788', '4530', '8562', '5763');
INSERT INTO `fw_code` VALUES ('4324024', '3408', '789', '5277', '9701', '5325');
INSERT INTO `fw_code` VALUES ('4324025', '3408', '790', '2434', '4887', '5424');
INSERT INTO `fw_code` VALUES ('4324026', '3408', '791', '0618', '6407', '0772');
INSERT INTO `fw_code` VALUES ('4324027', '3408', '792', '4957', '3499', '9799');
INSERT INTO `fw_code` VALUES ('4324028', '3408', '793', '1086', '2352', '4647');
INSERT INTO `fw_code` VALUES ('4324029', '3408', '794', '3115', '8300', '6316');
INSERT INTO `fw_code` VALUES ('4324030', '3408', '795', '3008', '9566', '7807');
INSERT INTO `fw_code` VALUES ('4324031', '3408', '796', '8548', '9451', '9263');
INSERT INTO `fw_code` VALUES ('4324032', '3408', '797', '2714', '0082', '1111');
INSERT INTO `fw_code` VALUES ('4324033', '3408', '798', '9616', '6792', '4352');
INSERT INTO `fw_code` VALUES ('4324034', '3408', '799', '1218', '7804', '1986');
INSERT INTO `fw_code` VALUES ('4324035', '3408', '800', '2647', '2356', '2441');
INSERT INTO `fw_code` VALUES ('4324036', '3408', '801', '4850', '4764', '1290');
INSERT INTO `fw_code` VALUES ('4324037', '3408', '802', '6625', '2237', '6102');
INSERT INTO `fw_code` VALUES ('4324038', '3408', '803', '9937', '2995', '9879');
INSERT INTO `fw_code` VALUES ('4324039', '3408', '804', '9911', '6276', '1048');
INSERT INTO `fw_code` VALUES ('4324040', '3408', '805', '0150', '0463', '6897');
INSERT INTO `fw_code` VALUES ('4324041', '3408', '806', '4143', '4633', '1566');
INSERT INTO `fw_code` VALUES ('4324042', '3408', '807', '9163', '5137', '1486');
INSERT INTO `fw_code` VALUES ('4324043', '3408', '808', '0338', '1213', '5084');
INSERT INTO `fw_code` VALUES ('4324044', '3408', '809', '5959', '3113', '6218');
INSERT INTO `fw_code` VALUES ('4324045', '3408', '810', '7480', '2110', '4174');
INSERT INTO `fw_code` VALUES ('4324046', '3408', '811', '4209', '2360', '0236');
INSERT INTO `fw_code` VALUES ('4324047', '3408', '812', '3929', '7165', '4549');
INSERT INTO `fw_code` VALUES ('4324048', '3408', '813', '7587', '0844', '2683');
INSERT INTO `fw_code` VALUES ('4324049', '3408', '814', '1325', '6538', '0495');
INSERT INTO `fw_code` VALUES ('4324050', '3408', '815', '9763', '6534', '2700');
INSERT INTO `fw_code` VALUES ('4324051', '3408', '816', '0684', '4134', '9442');
INSERT INTO `fw_code` VALUES ('4324052', '3408', '817', '9723', '5526', '2861');
INSERT INTO `fw_code` VALUES ('4324053', '3408', '818', '8334', '1983', '2245');
INSERT INTO `fw_code` VALUES ('4324054', '3408', '819', '8482', '1725', '0593');
INSERT INTO `fw_code` VALUES ('4324055', '3408', '820', '7948', '8054', '8049');
INSERT INTO `fw_code` VALUES ('4324056', '3408', '821', '2367', '7161', '6754');
INSERT INTO `fw_code` VALUES ('4324057', '3408', '822', '5852', '4379', '7709');
INSERT INTO `fw_code` VALUES ('4324058', '3408', '823', '0364', '7931', '3915');
INSERT INTO `fw_code` VALUES ('4324059', '3408', '824', '8375', '2991', '2084');
INSERT INTO `fw_code` VALUES ('4324060', '3408', '825', '0832', '3875', '7790');
INSERT INTO `fw_code` VALUES ('4324061', '3408', '826', '9189', '1856', '0317');
INSERT INTO `fw_code` VALUES ('4324062', '3408', '827', '2754', '1090', '0950');
INSERT INTO `fw_code` VALUES ('4324063', '3408', '828', '1966', '8943', '1549');
INSERT INTO `fw_code` VALUES ('4324064', '3408', '829', '9804', '7542', '2540');
INSERT INTO `fw_code` VALUES ('4324065', '3408', '830', '3034', '6284', '6638');
INSERT INTO `fw_code` VALUES ('4324066', '3408', '831', '8309', '5264', '3415');
INSERT INTO `fw_code` VALUES ('4324067', '3408', '832', '6065', '1848', '4727');
INSERT INTO `fw_code` VALUES ('4324068', '3408', '833', '1940', '2225', '2718');
INSERT INTO `fw_code` VALUES ('4324069', '3408', '834', '0043', '1729', '8388');
INSERT INTO `fw_code` VALUES ('4324070', '3408', '835', '7027', '0455', '1307');
INSERT INTO `fw_code` VALUES ('4324071', '3408', '836', '3329', '5768', '3334');
INSERT INTO `fw_code` VALUES ('4324072', '3408', '837', '7240', '7923', '8325');
INSERT INTO `fw_code` VALUES ('4324073', '3408', '838', '7561', '4125', '3852');
INSERT INTO `fw_code` VALUES ('4324074', '3408', '839', '8909', '6661', '4629');
INSERT INTO `fw_code` VALUES ('4324075', '3408', '840', '6412', '4769', '9084');
INSERT INTO `fw_code` VALUES ('4324076', '3408', '841', '0898', '1602', '6459');
INSERT INTO `fw_code` VALUES ('4324077', '3408', '842', '1299', '9820', '1665');
INSERT INTO `fw_code` VALUES ('4324078', '3408', '843', '7347', '6657', '6834');
INSERT INTO `fw_code` VALUES ('4324079', '3408', '844', '4677', '8304', '4111');
INSERT INTO `fw_code` VALUES ('4324080', '3408', '845', '9509', '8058', '5843');
INSERT INTO `fw_code` VALUES ('4324081', '3408', '846', '6624', '8560', '9425');
INSERT INTO `fw_code` VALUES ('4324082', '3408', '847', '9335', '7921', '1987');
INSERT INTO `fw_code` VALUES ('4324083', '3408', '848', '4274', '6409', '2229');
INSERT INTO `fw_code` VALUES ('4324084', '3408', '849', '0750', '8183', '1434');
INSERT INTO `fw_code` VALUES ('4324085', '3408', '850', '3888', '2480', '8032');
INSERT INTO `fw_code` VALUES ('4324086', '3408', '851', '4635', '3619', '7595');
INSERT INTO `fw_code` VALUES ('4324087', '3408', '852', '1792', '8805', '7693');
INSERT INTO `fw_code` VALUES ('4324088', '3408', '853', '9976', '0325', '3041');
INSERT INTO `fw_code` VALUES ('4324089', '3408', '854', '4315', '7417', '2068');
INSERT INTO `fw_code` VALUES ('4324090', '3408', '855', '3099', '0334', '8630');
INSERT INTO `fw_code` VALUES ('4324091', '3408', '856', '5129', '6282', '0300');
INSERT INTO `fw_code` VALUES ('4324092', '3408', '857', '5022', '7548', '1791');
INSERT INTO `fw_code` VALUES ('4324093', '3408', '858', '7906', '3369', '1532');
INSERT INTO `fw_code` VALUES ('4324094', '3408', '859', '2072', '4000', '3380');
INSERT INTO `fw_code` VALUES ('4324095', '3408', '860', '8974', '0710', '6621');
INSERT INTO `fw_code` VALUES ('4324096', '3408', '861', '0576', '1722', '4255');
INSERT INTO `fw_code` VALUES ('4324097', '3408', '862', '2005', '6274', '4711');
INSERT INTO `fw_code` VALUES ('4324098', '3408', '863', '4208', '8683', '3559');
INSERT INTO `fw_code` VALUES ('4324099', '3408', '864', '5983', '6155', '8371');
INSERT INTO `fw_code` VALUES ('4324100', '3408', '865', '9295', '6913', '2148');
INSERT INTO `fw_code` VALUES ('4324101', '3408', '866', '1925', '4258', '5032');
INSERT INTO `fw_code` VALUES ('4324102', '3408', '867', '9508', '4381', '9166');
INSERT INTO `fw_code` VALUES ('4324103', '3408', '868', '3501', '8551', '3836');
INSERT INTO `fw_code` VALUES ('4324104', '3408', '869', '1177', '3119', '5470');
INSERT INTO `fw_code` VALUES ('4324105', '3408', '870', '2352', '9195', '9068');
INSERT INTO `fw_code` VALUES ('4324106', '3408', '871', '5317', '7032', '8487');
INSERT INTO `fw_code` VALUES ('4324107', '3408', '872', '6838', '6028', '6443');
INSERT INTO `fw_code` VALUES ('4324108', '3408', '873', '3567', '6278', '2505');
INSERT INTO `fw_code` VALUES ('4324109', '3408', '874', '3287', '1083', '6818');
INSERT INTO `fw_code` VALUES ('4324110', '3408', '875', '6945', '4762', '4952');
INSERT INTO `fw_code` VALUES ('4324111', '3408', '876', '0683', '0456', '2764');
INSERT INTO `fw_code` VALUES ('4324112', '3408', '877', '9121', '0452', '4969');
INSERT INTO `fw_code` VALUES ('4324113', '3408', '878', '0042', '8052', '1711');
INSERT INTO `fw_code` VALUES ('4324114', '3408', '879', '9081', '9445', '5130');
INSERT INTO `fw_code` VALUES ('4324115', '3408', '880', '7692', '5901', '4514');
INSERT INTO `fw_code` VALUES ('4324116', '3408', '881', '7840', '5643', '2862');
INSERT INTO `fw_code` VALUES ('4324117', '3408', '882', '7306', '1972', '0318');
INSERT INTO `fw_code` VALUES ('4324118', '3408', '883', '4381', '5143', '0738');
INSERT INTO `fw_code` VALUES ('4324119', '3408', '884', '5210', '8297', '9978');
INSERT INTO `fw_code` VALUES ('4324120', '3408', '885', '9722', '1849', '6184');
INSERT INTO `fw_code` VALUES ('4324121', '3408', '886', '7733', '6909', '4353');
INSERT INTO `fw_code` VALUES ('4324122', '3408', '887', '0190', '7794', '0059');
INSERT INTO `fw_code` VALUES ('4324123', '3408', '888', '8547', '5774', '2586');
INSERT INTO `fw_code` VALUES ('4324124', '3408', '889', '2112', '5008', '3219');
INSERT INTO `fw_code` VALUES ('4324125', '3408', '890', '1324', '2861', '3818');
INSERT INTO `fw_code` VALUES ('4324126', '3408', '891', '1818', '5524', '6523');
INSERT INTO `fw_code` VALUES ('4324127', '3408', '892', '2392', '0202', '8907');
INSERT INTO `fw_code` VALUES ('4324128', '3408', '893', '0322', '3246', '7398');
INSERT INTO `fw_code` VALUES ('4324129', '3408', '894', '5423', '5766', '6996');
INSERT INTO `fw_code` VALUES ('4324130', '3408', '895', '3954', '0207', '6702');
INSERT INTO `fw_code` VALUES ('4324131', '3408', '896', '9401', '5647', '0657');
INSERT INTO `fw_code` VALUES ('4324132', '3408', '897', '9041', '8437', '5291');
INSERT INTO `fw_code` VALUES ('4324133', '3408', '898', '5343', '3750', '7318');
INSERT INTO `fw_code` VALUES ('4324134', '3408', '899', '9254', '5905', '2309');
INSERT INTO `fw_code` VALUES ('4324135', '3408', '900', '9575', '2107', '7836');
INSERT INTO `fw_code` VALUES ('4324136', '3408', '901', '8267', '0579', '6898');
INSERT INTO `fw_code` VALUES ('4324137', '3408', '902', '5770', '8687', '1354');
INSERT INTO `fw_code` VALUES ('4324138', '3408', '903', '5063', '8556', '1630');
INSERT INTO `fw_code` VALUES ('4324139', '3408', '904', '0256', '5520', '8729');
INSERT INTO `fw_code` VALUES ('4324140', '3408', '905', '3313', '7802', '5648');
INSERT INTO `fw_code` VALUES ('4324141', '3408', '906', '9361', '4639', '0818');
INSERT INTO `fw_code` VALUES ('4324142', '3408', '907', '4035', '2222', '6380');
INSERT INTO `fw_code` VALUES ('4324143', '3408', '908', '4101', '9948', '5050');
INSERT INTO `fw_code` VALUES ('4324144', '3408', '909', '8867', '1976', '8112');
INSERT INTO `fw_code` VALUES ('4324145', '3408', '910', '3460', '7544', '3996');
INSERT INTO `fw_code` VALUES ('4324146', '3408', '911', '8827', '0968', '8273');
INSERT INTO `fw_code` VALUES ('4324147', '3408', '912', '1110', '5393', '6800');
INSERT INTO `fw_code` VALUES ('4324148', '3408', '913', '7586', '7167', '6005');
INSERT INTO `fw_code` VALUES ('4324149', '3408', '914', '0724', '1464', '2603');
INSERT INTO `fw_code` VALUES ('4324150', '3408', '915', '1471', '2603', '2166');
INSERT INTO `fw_code` VALUES ('4324151', '3408', '916', '1284', '1853', '3979');
INSERT INTO `fw_code` VALUES ('4324152', '3408', '917', '9468', '3373', '9327');
INSERT INTO `fw_code` VALUES ('4324153', '3408', '918', '1151', '6401', '6639');
INSERT INTO `fw_code` VALUES ('4324154', '3408', '919', '9936', '9318', '3202');
INSERT INTO `fw_code` VALUES ('4324155', '3408', '920', '1965', '5266', '4871');
INSERT INTO `fw_code` VALUES ('4324156', '3408', '921', '1858', '6532', '6362');
INSERT INTO `fw_code` VALUES ('4324157', '3408', '922', '4742', '2353', '6103');
INSERT INTO `fw_code` VALUES ('4324158', '3408', '923', '8908', '2984', '7952');
INSERT INTO `fw_code` VALUES ('4324159', '3408', '924', '5810', '9694', '1193');
INSERT INTO `fw_code` VALUES ('4324160', '3408', '925', '7412', '0706', '8827');
INSERT INTO `fw_code` VALUES ('4324161', '3408', '926', '1497', '9322', '0996');
INSERT INTO `fw_code` VALUES ('4324162', '3408', '927', '1044', '7667', '8130');
INSERT INTO `fw_code` VALUES ('4324163', '3408', '928', '2819', '5139', '2943');
INSERT INTO `fw_code` VALUES ('4324164', '3408', '929', '6131', '5897', '6720');
INSERT INTO `fw_code` VALUES ('4324165', '3408', '930', '8761', '3242', '9604');
INSERT INTO `fw_code` VALUES ('4324166', '3408', '931', '6344', '3365', '3737');
INSERT INTO `fw_code` VALUES ('4324167', '3408', '932', '2993', '1599', '0121');
INSERT INTO `fw_code` VALUES ('4324168', '3408', '933', '8013', '2103', '0041');
INSERT INTO `fw_code` VALUES ('4324169', '3408', '934', '9188', '8179', '3639');
INSERT INTO `fw_code` VALUES ('4324170', '3408', '935', '4808', '0080', '4773');
INSERT INTO `fw_code` VALUES ('4324171', '3408', '936', '7576', '1587', '6446');
INSERT INTO `fw_code` VALUES ('4324172', '3408', '937', '4305', '1837', '2508');
INSERT INTO `fw_code` VALUES ('4324173', '3408', '938', '7683', '0321', '4955');
INSERT INTO `fw_code` VALUES ('4324174', '3408', '939', '9860', '6011', '4973');
INSERT INTO `fw_code` VALUES ('4324175', '3408', '940', '0781', '3611', '1714');
INSERT INTO `fw_code` VALUES ('4324176', '3408', '941', '9819', '5003', '5133');
INSERT INTO `fw_code` VALUES ('4324177', '3408', '942', '8431', '1460', '4517');
INSERT INTO `fw_code` VALUES ('4324178', '3408', '943', '8044', '7531', '0321');
INSERT INTO `fw_code` VALUES ('4324179', '3408', '944', '5119', '0702', '0741');
INSERT INTO `fw_code` VALUES ('4324180', '3408', '945', '8604', '7920', '1696');
INSERT INTO `fw_code` VALUES ('4324181', '3408', '946', '8471', '2468', '4356');
INSERT INTO `fw_code` VALUES ('4324182', '3408', '947', '3584', '7416', '1776');
INSERT INTO `fw_code` VALUES ('4324183', '3408', '948', '9285', '1333', '2589');
INSERT INTO `fw_code` VALUES ('4324184', '3408', '949', '5506', '4631', '4937');
INSERT INTO `fw_code` VALUES ('4324185', '3408', '950', '2062', '8420', '3821');
INSERT INTO `fw_code` VALUES ('4324186', '3408', '951', '3130', '5761', '8910');
INSERT INTO `fw_code` VALUES ('4324187', '3408', '952', '8817', '5388', '8714');
INSERT INTO `fw_code` VALUES ('4324188', '3408', '953', '4692', '5765', '6705');
INSERT INTO `fw_code` VALUES ('4324189', '3408', '954', '0140', '1206', '0660');
INSERT INTO `fw_code` VALUES ('4324190', '3408', '955', '9779', '3996', '5294');
INSERT INTO `fw_code` VALUES ('4324191', '3408', '956', '6081', '9309', '7321');
INSERT INTO `fw_code` VALUES ('4324192', '3408', '957', '0313', '7666', '7839');
INSERT INTO `fw_code` VALUES ('4324193', '3408', '958', '9005', '6138', '6901');
INSERT INTO `fw_code` VALUES ('4324194', '3408', '959', '6508', '4246', '1357');
INSERT INTO `fw_code` VALUES ('4324195', '3408', '960', '5801', '4114', '1633');
INSERT INTO `fw_code` VALUES ('4324196', '3408', '961', '0994', '1079', '8732');
INSERT INTO `fw_code` VALUES ('4324197', '3408', '962', '4051', '3361', '5651');
INSERT INTO `fw_code` VALUES ('4324198', '3408', '963', '0099', '0198', '0821');
INSERT INTO `fw_code` VALUES ('4324199', '3408', '964', '7429', '1845', '8098');
INSERT INTO `fw_code` VALUES ('4324200', '3408', '965', '4199', '3103', '3999');
INSERT INTO `fw_code` VALUES ('4324201', '3408', '966', '9565', '6527', '8276');
INSERT INTO `fw_code` VALUES ('4324202', '3408', '967', '1849', '0952', '6803');
INSERT INTO `fw_code` VALUES ('4324203', '3408', '968', '4118', '1087', '4321');
INSERT INTO `fw_code` VALUES ('4324204', '3408', '969', '4865', '2226', '3884');
INSERT INTO `fw_code` VALUES ('4324205', '3408', '970', '2022', '7412', '3982');
INSERT INTO `fw_code` VALUES ('4324206', '3408', '971', '4545', '6023', '8357');
INSERT INTO `fw_code` VALUES ('4324207', '3408', '972', '0674', '4876', '3205');
INSERT INTO `fw_code` VALUES ('4324208', '3408', '973', '2596', '2091', '6365');
INSERT INTO `fw_code` VALUES ('4324209', '3408', '974', '9646', '8543', '7955');
INSERT INTO `fw_code` VALUES ('4324210', '3408', '975', '6548', '5253', '1196');
INSERT INTO `fw_code` VALUES ('4324211', '3408', '976', '8151', '6265', '8830');
INSERT INTO `fw_code` VALUES ('4324212', '3408', '977', '2235', '4881', '1000');
INSERT INTO `fw_code` VALUES ('4324213', '3408', '978', '4438', '7289', '9848');
INSERT INTO `fw_code` VALUES ('4324214', '3408', '979', '3558', '0698', '2946');
INSERT INTO `fw_code` VALUES ('4324215', '3408', '980', '6869', '1456', '6723');
INSERT INTO `fw_code` VALUES ('4324216', '3408', '981', '9499', '8801', '9607');
INSERT INTO `fw_code` VALUES ('4324217', '3408', '982', '7083', '8924', '3740');
INSERT INTO `fw_code` VALUES ('4324218', '3408', '983', '8751', '7662', '0044');
INSERT INTO `fw_code` VALUES ('4324219', '3408', '984', '5547', '5638', '4776');
INSERT INTO `fw_code` VALUES ('4324220', '3408', '985', '4412', '0571', '1017');
INSERT INTO `fw_code` VALUES ('4324221', '3408', '986', '3797', '4885', '8794');
INSERT INTO `fw_code` VALUES ('4324222', '3408', '987', '3517', '9690', '3107');
INSERT INTO `fw_code` VALUES ('4324223', '3408', '988', '4519', '9305', '9526');
INSERT INTO `fw_code` VALUES ('4324224', '3408', '989', '8257', '4999', '7339');
INSERT INTO `fw_code` VALUES ('4324225', '3408', '990', '9351', '9059', '1258');
INSERT INTO `fw_code` VALUES ('4324226', '3408', '991', '7617', '2595', '6285');
INSERT INTO `fw_code` VALUES ('4324227', '3408', '992', '6655', '3987', '9705');
INSERT INTO `fw_code` VALUES ('4324228', '3408', '993', '5267', '0444', '9089');
INSERT INTO `fw_code` VALUES ('4324229', '3408', '994', '8070', '4250', '9151');
INSERT INTO `fw_code` VALUES ('4324230', '3408', '995', '5440', '6904', '6267');
INSERT INTO `fw_code` VALUES ('4324231', '3408', '996', '7296', '6392', '0758');
INSERT INTO `fw_code` VALUES ('4324232', '3408', '997', '7963', '5515', '0642');
INSERT INTO `fw_code` VALUES ('4324233', '3408', '998', '0420', '6400', '6348');
INSERT INTO `fw_code` VALUES ('4324234', '3408', '999', '2342', '3615', '9508');
INSERT INTO `fw_code` VALUES ('4324235', '3408', '1000', '8898', '7404', '8392');
INSERT INTO `fw_code` VALUES ('4324236', '3408', '1001', '9392', '0067', '1098');
INSERT INTO `fw_code` VALUES ('4324237', '3408', '1002', '2622', '8809', '5196');
INSERT INTO `fw_code` VALUES ('4324238', '3408', '1003', '7897', '7789', '1973');
INSERT INTO `fw_code` VALUES ('4324239', '3408', '1004', '1528', '4749', '1276');
INSERT INTO `fw_code` VALUES ('4324240', '3408', '1005', '6976', '0190', '5231');
INSERT INTO `fw_code` VALUES ('4324241', '3408', '1006', '6615', '2980', '9866');
INSERT INTO `fw_code` VALUES ('4324242', '3408', '1007', '2917', '8293', '1892');
INSERT INTO `fw_code` VALUES ('4324243', '3408', '1008', '6828', '0448', '6883');
INSERT INTO `fw_code` VALUES ('4324244', '3408', '1009', '8497', '9186', '3187');
INSERT INTO `fw_code` VALUES ('4324245', '3408', '1010', '7815', '2096', '5617');
INSERT INTO `fw_code` VALUES ('4324246', '3408', '1011', '3409', '7279', '7920');
INSERT INTO `fw_code` VALUES ('4324247', '3408', '1012', '9457', '4116', '3090');
INSERT INTO `fw_code` VALUES ('4324248', '3408', '1013', '6787', '5763', '0367');
INSERT INTO `fw_code` VALUES ('4324249', '3408', '1014', '6853', '3489', '9037');
INSERT INTO `fw_code` VALUES ('4324250', '3408', '1015', '6212', '1085', '7983');
INSERT INTO `fw_code` VALUES ('4324251', '3408', '1016', '8923', '0445', '0545');
INSERT INTO `fw_code` VALUES ('4324252', '3408', '1017', '7682', '6644', '8277');
INSERT INTO `fw_code` VALUES ('4324253', '3408', '1018', '3476', '5005', '6590');
INSERT INTO `fw_code` VALUES ('4324254', '3408', '1019', '4223', '6144', '6153');
INSERT INTO `fw_code` VALUES ('4324255', '3408', '1020', '1380', '1330', '6251');
INSERT INTO `fw_code` VALUES ('4324256', '3408', '1021', '9564', '2850', '1599');
INSERT INTO `fw_code` VALUES ('4324257', '3408', '1022', '3903', '9942', '0626');
INSERT INTO `fw_code` VALUES ('4324258', '3408', '1023', '0032', '8795', '5474');
INSERT INTO `fw_code` VALUES ('4324259', '3408', '1024', '1954', '6009', '8635');
INSERT INTO `fw_code` VALUES ('4324260', '3408', '1025', '7494', '5894', '0090');
INSERT INTO `fw_code` VALUES ('4324261', '3408', '1026', '1660', '6525', '1938');
INSERT INTO `fw_code` VALUES ('4324262', '3408', '1027', '8562', '3235', '5179');
INSERT INTO `fw_code` VALUES ('4324263', '3408', '1028', '0164', '4247', '2813');
INSERT INTO `fw_code` VALUES ('4324264', '3408', '1029', '3796', '1207', '2117');
INSERT INTO `fw_code` VALUES ('4324265', '3408', '1030', '5571', '8680', '6930');
INSERT INTO `fw_code` VALUES ('4324266', '3408', '1031', '8883', '9438', '0706');
INSERT INTO `fw_code` VALUES ('4324267', '3408', '1032', '8857', '2719', '1876');
INSERT INTO `fw_code` VALUES ('4324268', '3408', '1033', '9096', '6906', '7724');
INSERT INTO `fw_code` VALUES ('4324269', '3408', '1034', '3089', '1076', '2394');
INSERT INTO `fw_code` VALUES ('4324270', '3408', '1035', '9284', '7656', '5911');
INSERT INTO `fw_code` VALUES ('4324271', '3408', '1036', '4905', '9557', '7045');
INSERT INTO `fw_code` VALUES ('4324272', '3408', '1037', '6426', '8553', '5001');
INSERT INTO `fw_code` VALUES ('4324273', '3408', '1038', '3155', '8803', '1063');
INSERT INTO `fw_code` VALUES ('4324274', '3408', '1039', '2875', '3608', '5376');
INSERT INTO `fw_code` VALUES ('4324275', '3408', '1040', '6533', '7287', '3510');
INSERT INTO `fw_code` VALUES ('4324276', '3408', '1041', '0271', '2981', '1322');
INSERT INTO `fw_code` VALUES ('4324277', '3408', '1042', '8710', '2977', '3528');
INSERT INTO `fw_code` VALUES ('4324278', '3408', '1043', '9630', '0577', '0269');
INSERT INTO `fw_code` VALUES ('4324279', '3408', '1044', '8669', '1969', '3688');
INSERT INTO `fw_code` VALUES ('4324280', '3408', '1045', '7280', '8426', '3072');
INSERT INTO `fw_code` VALUES ('4324281', '3408', '1046', '7428', '8168', '1420');
INSERT INTO `fw_code` VALUES ('4324282', '3408', '1047', '6894', '4497', '8876');
INSERT INTO `fw_code` VALUES ('4324283', '3408', '1048', '4798', '0822', '8536');
INSERT INTO `fw_code` VALUES ('4324284', '3408', '1049', '9310', '4374', '4742');
INSERT INTO `fw_code` VALUES ('4324285', '3408', '1050', '7321', '9434', '2912');
INSERT INTO `fw_code` VALUES ('4324286', '3408', '1051', '9778', '0318', '8617');
INSERT INTO `fw_code` VALUES ('4324287', '3408', '1052', '8135', '8299', '1144');
INSERT INTO `fw_code` VALUES ('4324288', '3408', '1053', '1700', '7533', '1778');
INSERT INTO `fw_code` VALUES ('4324289', '3408', '1054', '0912', '5386', '2376');
INSERT INTO `fw_code` VALUES ('4324290', '3408', '1055', '1980', '2727', '7465');
INSERT INTO `fw_code` VALUES ('4324291', '3408', '1056', '5012', '8291', '5554');
INSERT INTO `fw_code` VALUES ('4324292', '3408', '1057', '0886', '8668', '3545');
INSERT INTO `fw_code` VALUES ('4324293', '3408', '1058', '8990', '8172', '9215');
INSERT INTO `fw_code` VALUES ('4324294', '3408', '1059', '2275', '2211', '4161');
INSERT INTO `fw_code` VALUES ('4324295', '3408', '1060', '6507', '0568', '4679');
INSERT INTO `fw_code` VALUES ('4324296', '3408', '1061', '7855', '3104', '5456');
INSERT INTO `fw_code` VALUES ('4324297', '3408', '1062', '5358', '1212', '9912');
INSERT INTO `fw_code` VALUES ('4324298', '3408', '1063', '4651', '1080', '0188');
INSERT INTO `fw_code` VALUES ('4324299', '3408', '1064', '9844', '8045', '7287');
INSERT INTO `fw_code` VALUES ('4324300', '3408', '1065', '0245', '6263', '2492');
INSERT INTO `fw_code` VALUES ('4324301', '3408', '1066', '6293', '3100', '7661');
INSERT INTO `fw_code` VALUES ('4324302', '3408', '1067', '3623', '4747', '4938');
INSERT INTO `fw_code` VALUES ('4324303', '3408', '1068', '3689', '2473', '3608');
INSERT INTO `fw_code` VALUES ('4324304', '3408', '1069', '0966', '8340', '4793');
INSERT INTO `fw_code` VALUES ('4324305', '3408', '1070', '5906', '6828', '5034');
INSERT INTO `fw_code` VALUES ('4324306', '3408', '1071', '5519', '2899', '0838');
INSERT INTO `fw_code` VALUES ('4324307', '3408', '1072', '6266', '4038', '0400');
INSERT INTO `fw_code` VALUES ('4324308', '3408', '1073', '3423', '9224', '0498');
INSERT INTO `fw_code` VALUES ('4324309', '3408', '1074', '1607', '0744', '5846');
INSERT INTO `fw_code` VALUES ('4324310', '3408', '1075', '5946', '7836', '4873');
INSERT INTO `fw_code` VALUES ('4324311', '3408', '1076', '4731', '0753', '1436');
INSERT INTO `fw_code` VALUES ('4324312', '3408', '1077', '6760', '6701', '3106');
INSERT INTO `fw_code` VALUES ('4324313', '3408', '1078', '9537', '3788', '4338');
INSERT INTO `fw_code` VALUES ('4324314', '3408', '1079', '3703', '4419', '6186');
INSERT INTO `fw_code` VALUES ('4324315', '3408', '1080', '0605', '1129', '9427');
INSERT INTO `fw_code` VALUES ('4324316', '3408', '1081', '2208', '2141', '7061');
INSERT INTO `fw_code` VALUES ('4324317', '3408', '1082', '3637', '6693', '7516');
INSERT INTO `fw_code` VALUES ('4324318', '3408', '1083', '5839', '9102', '6364');
INSERT INTO `fw_code` VALUES ('4324319', '3408', '1084', '7615', '6574', '1177');
INSERT INTO `fw_code` VALUES ('4324320', '3408', '1085', '0926', '7332', '4954');
INSERT INTO `fw_code` VALUES ('4324321', '3408', '1086', '1139', '4800', '1972');
INSERT INTO `fw_code` VALUES ('4324322', '3408', '1087', '5132', '8970', '6641');
INSERT INTO `fw_code` VALUES ('4324323', '3408', '1088', '6948', '7451', '1293');
INSERT INTO `fw_code` VALUES ('4324324', '3408', '1089', '8469', '6447', '9248');
INSERT INTO `fw_code` VALUES ('4324325', '3408', '1090', '5198', '6697', '5311');
INSERT INTO `fw_code` VALUES ('4324326', '3408', '1091', '4918', '1502', '9623');
INSERT INTO `fw_code` VALUES ('4324327', '3408', '1092', '8576', '5181', '7757');
INSERT INTO `fw_code` VALUES ('4324328', '3408', '1093', '0753', '0871', '7775');
INSERT INTO `fw_code` VALUES ('4324329', '3408', '1094', '1674', '8471', '4516');
INSERT INTO `fw_code` VALUES ('4324330', '3408', '1095', '0712', '9864', '7936');
INSERT INTO `fw_code` VALUES ('4324331', '3408', '1096', '9324', '6320', '7320');
INSERT INTO `fw_code` VALUES ('4324332', '3408', '1097', '9471', '6062', '5668');
INSERT INTO `fw_code` VALUES ('4324333', '3408', '1098', '8937', '2391', '3123');
INSERT INTO `fw_code` VALUES ('4324334', '3408', '1099', '6012', '5562', '3543');
INSERT INTO `fw_code` VALUES ('4324335', '3408', '1100', '6841', '8716', '2784');
INSERT INTO `fw_code` VALUES ('4324336', '3408', '1101', '1353', '2268', '8989');
INSERT INTO `fw_code` VALUES ('4324337', '3408', '1102', '9364', '7328', '7159');
INSERT INTO `fw_code` VALUES ('4324338', '3408', '1103', '1821', '8213', '2864');
INSERT INTO `fw_code` VALUES ('4324339', '3408', '1104', '0178', '6193', '5391');
INSERT INTO `fw_code` VALUES ('4324340', '3408', '1105', '3743', '5427', '6025');
INSERT INTO `fw_code` VALUES ('4324341', '3408', '1106', '2955', '3280', '6623');
INSERT INTO `fw_code` VALUES ('4324342', '3408', '1107', '3449', '5943', '9329');
INSERT INTO `fw_code` VALUES ('4324343', '3408', '1108', '7055', '6185', '9802');
INSERT INTO `fw_code` VALUES ('4324344', '3408', '1109', '5585', '0626', '9507');
INSERT INTO `fw_code` VALUES ('4324345', '3408', '1110', '1033', '6066', '3463');
INSERT INTO `fw_code` VALUES ('4324346', '3408', '1111', '0672', '8856', '8097');
INSERT INTO `fw_code` VALUES ('4324347', '3408', '1112', '6974', '4169', '0123');
INSERT INTO `fw_code` VALUES ('4324348', '3408', '1113', '7401', '9106', '4159');
INSERT INTO `fw_code` VALUES ('4324349', '3408', '1114', '6694', '8975', '4436');
INSERT INTO `fw_code` VALUES ('4324350', '3408', '1115', '1887', '5939', '1534');
INSERT INTO `fw_code` VALUES ('4324351', '3408', '1116', '4944', '8221', '8454');
INSERT INTO `fw_code` VALUES ('4324352', '3408', '1117', '5666', '2641', '9186');
INSERT INTO `fw_code` VALUES ('4324353', '3408', '1118', '5732', '0367', '7855');
INSERT INTO `fw_code` VALUES ('4324354', '3408', '1119', '0499', '2395', '0918');
INSERT INTO `fw_code` VALUES ('4324355', '3408', '1120', '5092', '7963', '6802');
INSERT INTO `fw_code` VALUES ('4324356', '3408', '1121', '2742', '5812', '9605');
INSERT INTO `fw_code` VALUES ('4324357', '3408', '1122', '9217', '7586', '8811');
INSERT INTO `fw_code` VALUES ('4324358', '3408', '1123', '2355', '1883', '5409');
INSERT INTO `fw_code` VALUES ('4324359', '3408', '1124', '3103', '3022', '4971');
INSERT INTO `fw_code` VALUES ('4324360', '3408', '1125', '1099', '3792', '2132');
INSERT INTO `fw_code` VALUES ('4324361', '3408', '1126', '2782', '6820', '9445');
INSERT INTO `fw_code` VALUES ('4324362', '3408', '1127', '1567', '9737', '6007');
INSERT INTO `fw_code` VALUES ('4324363', '3408', '1128', '3596', '5685', '7677');
INSERT INTO `fw_code` VALUES ('4324364', '3408', '1129', '3489', '6951', '9168');
INSERT INTO `fw_code` VALUES ('4324365', '3408', '1130', '6373', '2772', '8909');
INSERT INTO `fw_code` VALUES ('4324366', '3408', '1131', '0539', '3403', '0757');
INSERT INTO `fw_code` VALUES ('4324367', '3408', '1132', '7441', '0113', '3998');
INSERT INTO `fw_code` VALUES ('4324368', '3408', '1133', '9044', '1125', '1632');
INSERT INTO `fw_code` VALUES ('4324369', '3408', '1134', '3128', '9741', '3802');
INSERT INTO `fw_code` VALUES ('4324370', '3408', '1135', '2675', '8086', '0936');
INSERT INTO `fw_code` VALUES ('4324371', '3408', '1136', '4451', '5558', '5748');
INSERT INTO `fw_code` VALUES ('4324372', '3408', '1137', '7762', '6316', '9525');
INSERT INTO `fw_code` VALUES ('4324373', '3408', '1138', '0392', '3661', '2409');
INSERT INTO `fw_code` VALUES ('4324374', '3408', '1139', '0497', '8718', '4241');
INSERT INTO `fw_code` VALUES ('4324375', '3408', '1140', '7146', '6952', '0625');
INSERT INTO `fw_code` VALUES ('4324376', '3408', '1141', '3341', '3532', '4142');
INSERT INTO `fw_code` VALUES ('4324377', '3408', '1142', '8962', '5433', '5276');
INSERT INTO `fw_code` VALUES ('4324378', '3408', '1143', '7827', '0365', '1517');
INSERT INTO `fw_code` VALUES ('4324379', '3408', '1144', '6932', '9484', '3607');
INSERT INTO `fw_code` VALUES ('4324380', '3408', '1145', '8855', '6698', '6768');
INSERT INTO `fw_code` VALUES ('4324381', '3408', '1146', '3835', '6195', '6848');
INSERT INTO `fw_code` VALUES ('4324382', '3408', '1147', '1312', '7583', '2473');
INSERT INTO `fw_code` VALUES ('4324383', '3408', '1148', '9068', '4167', '3785');
INSERT INTO `fw_code` VALUES ('4324384', '3408', '1149', '0030', '2774', '0366');
INSERT INTO `fw_code` VALUES ('4324385', '3408', '1150', '0243', '0242', '7384');
INSERT INTO `fw_code` VALUES ('4324386', '3408', '1151', '0564', '6444', '2910');
INSERT INTO `fw_code` VALUES ('4324387', '3408', '1152', '6759', '3024', '6428');
INSERT INTO `fw_code` VALUES ('4324388', '3408', '1153', '1245', '9857', '3803');
INSERT INTO `fw_code` VALUES ('4324389', '3408', '1154', '0350', '8976', '5893');
INSERT INTO `fw_code` VALUES ('4324390', '3408', '1155', '7680', '0623', '3169');
INSERT INTO `fw_code` VALUES ('4324391', '3408', '1156', '9816', '5306', '3348');
INSERT INTO `fw_code` VALUES ('4324392', '3408', '1157', '5116', '1004', '8955');
INSERT INTO `fw_code` VALUES ('4324393', '3408', '1158', '2273', '6190', '9053');
INSERT INTO `fw_code` VALUES ('4324394', '3408', '1159', '0457', '7710', '4401');
INSERT INTO `fw_code` VALUES ('4324395', '3408', '1160', '2847', '0869', '1437');
INSERT INTO `fw_code` VALUES ('4324396', '3408', '1161', '9897', '7321', '3026');
INSERT INTO `fw_code` VALUES ('4324397', '3408', '1162', '9750', '7579', '4678');
INSERT INTO `fw_code` VALUES ('4324398', '3408', '1163', '7334', '7702', '8812');
INSERT INTO `fw_code` VALUES ('4324399', '3408', '1164', '4663', '9349', '6089');
INSERT INTO `fw_code` VALUES ('4324400', '3408', '1165', '9603', '7837', '6330');
INSERT INTO `fw_code` VALUES ('4324401', '3408', '1166', '5518', '9222', '4160');
INSERT INTO `fw_code` VALUES ('4324402', '3408', '1167', '8321', '3028', '4223');
INSERT INTO `fw_code` VALUES ('4324403', '3408', '1168', '7787', '9357', '1678');
INSERT INTO `fw_code` VALUES ('4324404', '3408', '1169', '5691', '5683', '1339');
INSERT INTO `fw_code` VALUES ('4324405', '3408', '1170', '7547', '5170', '5830');
INSERT INTO `fw_code` VALUES ('4324406', '3408', '1171', '8214', '4294', '5714');
INSERT INTO `fw_code` VALUES ('4324407', '3408', '1172', '0671', '5179', '1419');
INSERT INTO `fw_code` VALUES ('4324408', '3408', '1173', '2593', '2393', '4580');
INSERT INTO `fw_code` VALUES ('4324409', '3408', '1174', '9643', '8845', '6169');
INSERT INTO `fw_code` VALUES ('4324410', '3408', '1175', '2873', '7587', '0268');
INSERT INTO `fw_code` VALUES ('4324411', '3408', '1176', '3168', '7071', '6964');
INSERT INTO `fw_code` VALUES ('4324412', '3408', '1177', '2228', '8312', '1104');
INSERT INTO `fw_code` VALUES ('4324413', '3408', '1178', '2548', '4514', '6630');
INSERT INTO `fw_code` VALUES ('4324414', '3408', '1179', '3896', '7050', '7407');
INSERT INTO `fw_code` VALUES ('4324415', '3408', '1180', '8744', '1094', '0148');
INSERT INTO `fw_code` VALUES ('4324416', '3408', '1181', '3230', '7927', '7523');
INSERT INTO `fw_code` VALUES ('4324417', '3408', '1182', '6287', '0209', '4443');
INSERT INTO `fw_code` VALUES ('4324418', '3408', '1183', '9664', '8693', '6889');
INSERT INTO `fw_code` VALUES ('4324419', '3408', '1184', '9731', '6419', '5559');
INSERT INTO `fw_code` VALUES ('4324420', '3408', '1185', '9090', '4015', '4506');
INSERT INTO `fw_code` VALUES ('4324421', '3408', '1186', '4084', '7800', '5595');
INSERT INTO `fw_code` VALUES ('4324422', '3408', '1187', '0559', '9574', '4800');
INSERT INTO `fw_code` VALUES ('4324423', '3408', '1188', '6353', '7935', '3113');
INSERT INTO `fw_code` VALUES ('4324424', '3408', '1189', '7101', '9074', '2675');
INSERT INTO `fw_code` VALUES ('4324425', '3408', '1190', '2442', '5780', '8122');
INSERT INTO `fw_code` VALUES ('4324426', '3408', '1191', '6780', '2872', '7148');
INSERT INTO `fw_code` VALUES ('4324427', '3408', '1192', '0372', '8824', '6613');
INSERT INTO `fw_code` VALUES ('4324428', '3408', '1193', '4537', '9455', '8461');
INSERT INTO `fw_code` VALUES ('4324429', '3408', '1194', '1440', '6165', '1702');
INSERT INTO `fw_code` VALUES ('4324430', '3408', '1195', '8449', '1610', '3452');
INSERT INTO `fw_code` VALUES ('4324431', '3408', '1196', '1734', '5649', '8398');
INSERT INTO `fw_code` VALUES ('4324432', '3408', '1197', '1974', '9836', '4247');
INSERT INTO `fw_code` VALUES ('4324433', '3408', '1198', '2162', '0586', '2434');
INSERT INTO `fw_code` VALUES ('4324434', '3408', '1199', '7782', '2487', '3568');
INSERT INTO `fw_code` VALUES ('4324435', '3408', '1200', '9303', '1483', '1523');
INSERT INTO `fw_code` VALUES ('4324436', '3408', '1201', '9410', '0217', '0032');
INSERT INTO `fw_code` VALUES ('4324437', '3408', '1202', '3149', '5911', '7845');
INSERT INTO `fw_code` VALUES ('4324438', '3408', '1203', '2508', '3507', '6791');
INSERT INTO `fw_code` VALUES ('4324439', '3408', '1204', '1547', '4899', '0211');
INSERT INTO `fw_code` VALUES ('4324440', '3408', '1205', '0158', '1356', '9595');
INSERT INTO `fw_code` VALUES ('4324441', '3408', '1206', '0305', '1098', '7943');
INSERT INTO `fw_code` VALUES ('4324442', '3408', '1207', '9771', '7427', '5398');
INSERT INTO `fw_code` VALUES ('4324443', '3408', '1208', '2187', '7304', '1264');
INSERT INTO `fw_code` VALUES ('4324444', '3408', '1209', '0198', '2364', '9434');
INSERT INTO `fw_code` VALUES ('4324445', '3408', '1210', '2655', '3248', '5139');
INSERT INTO `fw_code` VALUES ('4324446', '3408', '1211', '1013', '1229', '7666');
INSERT INTO `fw_code` VALUES ('4324447', '3408', '1212', '3790', '8316', '8898');
INSERT INTO `fw_code` VALUES ('4324448', '3408', '1213', '1627', '6915', '9889');
INSERT INTO `fw_code` VALUES ('4324449', '3408', '1214', '7889', '1221', '2077');
INSERT INTO `fw_code` VALUES ('4324450', '3408', '1215', '3764', '1598', '0068');
INSERT INTO `fw_code` VALUES ('4324451', '3408', '1216', '8850', '9828', '8657');
INSERT INTO `fw_code` VALUES ('4324452', '3408', '1217', '9064', '7296', '5675');
INSERT INTO `fw_code` VALUES ('4324453', '3408', '1218', '0733', '6034', '1979');
INSERT INTO `fw_code` VALUES ('4324454', '3408', '1219', '8235', '4142', '6434');
INSERT INTO `fw_code` VALUES ('4324455', '3408', '1220', '2722', '0975', '3809');
INSERT INTO `fw_code` VALUES ('4324456', '3408', '1221', '3123', '9193', '9014');
INSERT INTO `fw_code` VALUES ('4324457', '3408', '1222', '6567', '5403', '0131');
INSERT INTO `fw_code` VALUES ('4324458', '3408', '1223', '1333', '7431', '3193');
INSERT INTO `fw_code` VALUES ('4324459', '3408', '1224', '5926', '2999', '9077');
INSERT INTO `fw_code` VALUES ('4324460', '3408', '1225', '3576', '0848', '1881');
INSERT INTO `fw_code` VALUES ('4324461', '3408', '1226', '3189', '6919', '7684');
INSERT INTO `fw_code` VALUES ('4324462', '3408', '1227', '4431', '0721', '9952');
INSERT INTO `fw_code` VALUES ('4324463', '3408', '1228', '4324', '1987', '1443');
INSERT INTO `fw_code` VALUES ('4324464', '3408', '1229', '7208', '7808', '1184');
INSERT INTO `fw_code` VALUES ('4324465', '3408', '1230', '8276', '5149', '6273');
INSERT INTO `fw_code` VALUES ('4324466', '3408', '1231', '2400', '1095', '1605');
INSERT INTO `fw_code` VALUES ('4324467', '3408', '1232', '6032', '8056', '0909');
INSERT INTO `fw_code` VALUES ('4324468', '3408', '1233', '1118', '6286', '9498');
INSERT INTO `fw_code` VALUES ('4324469', '3408', '1234', '3748', '3631', '2382');
INSERT INTO `fw_code` VALUES ('4324470', '3408', '1235', '1332', '3754', '6516');
INSERT INTO `fw_code` VALUES ('4324471', '3408', '1236', '5324', '7924', '1185');
INSERT INTO `fw_code` VALUES ('4324472', '3408', '1237', '8662', '5401', '3793');
INSERT INTO `fw_code` VALUES ('4324473', '3408', '1238', '5391', '5651', '9855');
INSERT INTO `fw_code` VALUES ('4324474', '3408', '1239', '8768', '4135', '2301');
INSERT INTO `fw_code` VALUES ('4324475', '3408', '1240', '2507', '9829', '0114');
INSERT INTO `fw_code` VALUES ('4324476', '3408', '1241', '0905', '8818', '2480');
INSERT INTO `fw_code` VALUES ('4324477', '3408', '1242', '9516', '5274', '1864');
INSERT INTO `fw_code` VALUES ('4324478', '3408', '1243', '9663', '5016', '0212');
INSERT INTO `fw_code` VALUES ('4324479', '3408', '1244', '9129', '1345', '7667');
INSERT INTO `fw_code` VALUES ('4324480', '3408', '1245', '6205', '4516', '8087');
INSERT INTO `fw_code` VALUES ('4324481', '3408', '1246', '7033', '7670', '7328');
INSERT INTO `fw_code` VALUES ('4324482', '3408', '1247', '1545', '1222', '3534');
INSERT INTO `fw_code` VALUES ('4324483', '3408', '1248', '3148', '2234', '1168');
INSERT INTO `fw_code` VALUES ('4324484', '3408', '1249', '4216', '9575', '6257');
INSERT INTO `fw_code` VALUES ('4324485', '3408', '1250', '2146', '2619', '4748');
INSERT INTO `fw_code` VALUES ('4324486', '3408', '1251', '5778', '9580', '4052');
INSERT INTO `fw_code` VALUES ('4324487', '3408', '1252', '1225', '5020', '8007');
INSERT INTO `fw_code` VALUES ('4324488', '3408', '1253', '0864', '7810', '2641');
INSERT INTO `fw_code` VALUES ('4324489', '3408', '1254', '1078', '5278', '9659');
INSERT INTO `fw_code` VALUES ('4324490', '3408', '1255', '0091', '9952', '4248');
INSERT INTO `fw_code` VALUES ('4324491', '3408', '1256', '7593', '8060', '8703');
INSERT INTO `fw_code` VALUES ('4324492', '3408', '1257', '6886', '7929', '8980');
INSERT INTO `fw_code` VALUES ('4324493', '3408', '1258', '5137', '7175', '2998');
INSERT INTO `fw_code` VALUES ('4324494', '3408', '1259', '1185', '4012', '8168');
INSERT INTO `fw_code` VALUES ('4324495', '3408', '1260', '5858', '1595', '3730');
INSERT INTO `fw_code` VALUES ('4324496', '3408', '1261', '5925', '9321', '2400');
INSERT INTO `fw_code` VALUES ('4324497', '3408', '1262', '0691', '1349', '5462');
INSERT INTO `fw_code` VALUES ('4324498', '3408', '1263', '5284', '6917', '1346');
INSERT INTO `fw_code` VALUES ('4324499', '3408', '1264', '0651', '0342', '5623');
INSERT INTO `fw_code` VALUES ('4324500', '3408', '1265', '2934', '4766', '4150');
INSERT INTO `fw_code` VALUES ('4324501', '3408', '1266', '9409', '6540', '3355');
INSERT INTO `fw_code` VALUES ('4324502', '3408', '1267', '1291', '2746', '6677');
INSERT INTO `fw_code` VALUES ('4324503', '3408', '1268', '1759', '8691', '0551');
INSERT INTO `fw_code` VALUES ('4324504', '3408', '1269', '6566', '1726', '3453');
INSERT INTO `fw_code` VALUES ('4324505', '3408', '1270', '7634', '9067', '8542');
INSERT INTO `fw_code` VALUES ('4324506', '3408', '1271', '9236', '0079', '6176');
INSERT INTO `fw_code` VALUES ('4324507', '3408', '1272', '3321', '8695', '8346');
INSERT INTO `fw_code` VALUES ('4324508', '3408', '1273', '2868', '7040', '5480');
INSERT INTO `fw_code` VALUES ('4324509', '3408', '1274', '4643', '4512', '0292');
INSERT INTO `fw_code` VALUES ('4324510', '3408', '1275', '7954', '5270', '4069');
INSERT INTO `fw_code` VALUES ('4324511', '3408', '1276', '0584', '2615', '6953');
INSERT INTO `fw_code` VALUES ('4324512', '3408', '1277', '8168', '2738', '1087');
INSERT INTO `fw_code` VALUES ('4324513', '3408', '1278', '9836', '1476', '7391');
INSERT INTO `fw_code` VALUES ('4324514', '3408', '1279', '1011', '7552', '0989');
INSERT INTO `fw_code` VALUES ('4324515', '3408', '1280', '6632', '9453', '2123');
INSERT INTO `fw_code` VALUES ('4324516', '3408', '1281', '5498', '4385', '8364');
INSERT INTO `fw_code` VALUES ('4324517', '3408', '1282', '7434', '3545', '4102');
INSERT INTO `fw_code` VALUES ('4324518', '3408', '1283', '0811', '2029', '6549');
INSERT INTO `fw_code` VALUES ('4324519', '3408', '1284', '2988', '7719', '6567');
INSERT INTO `fw_code` VALUES ('4324520', '3408', '1285', '1559', '3168', '6111');
INSERT INTO `fw_code` VALUES ('4324521', '3408', '1286', '1706', '2910', '4459');
INSERT INTO `fw_code` VALUES ('4324522', '3408', '1287', '1172', '9239', '1915');
INSERT INTO `fw_code` VALUES ('4324523', '3408', '1288', '8248', '2410', '2335');
INSERT INTO `fw_code` VALUES ('4324524', '3408', '1289', '1732', '9628', '3290');
INSERT INTO `fw_code` VALUES ('4324525', '3408', '1290', '3589', '9116', '7781');
INSERT INTO `fw_code` VALUES ('4324526', '3408', '1291', '1600', '4176', '5951');
INSERT INTO `fw_code` VALUES ('4324527', '3408', '1292', '2414', '3041', '4183');
INSERT INTO `fw_code` VALUES ('4324528', '3408', '1293', '8635', '6339', '6531');
INSERT INTO `fw_code` VALUES ('4324529', '3408', '1294', '5191', '0128', '5415');
INSERT INTO `fw_code` VALUES ('4324530', '3408', '1295', '5684', '2791', '8120');
INSERT INTO `fw_code` VALUES ('4324531', '3408', '1296', '4189', '0513', '8995');
INSERT INTO `fw_code` VALUES ('4324532', '3408', '1297', '3268', '2914', '2254');
INSERT INTO `fw_code` VALUES ('4324533', '3408', '1298', '2907', '5704', '6888');
INSERT INTO `fw_code` VALUES ('4324534', '3408', '1299', '9209', '1017', '8915');
INSERT INTO `fw_code` VALUES ('4324535', '3408', '1300', '3121', '3172', '3906');
INSERT INTO `fw_code` VALUES ('4324536', '3408', '1301', '3441', '9374', '9433');
INSERT INTO `fw_code` VALUES ('4324537', '3408', '1302', '2134', '7846', '8495');
INSERT INTO `fw_code` VALUES ('4324538', '3408', '1303', '9637', '5954', '2951');
INSERT INTO `fw_code` VALUES ('4324539', '3408', '1304', '8929', '5823', '3227');
INSERT INTO `fw_code` VALUES ('4324540', '3408', '1305', '4123', '2787', '0326');
INSERT INTO `fw_code` VALUES ('4324541', '3408', '1306', '7180', '5069', '7245');
INSERT INTO `fw_code` VALUES ('4324542', '3408', '1307', '3228', '1906', '2415');
INSERT INTO `fw_code` VALUES ('4324543', '3408', '1308', '7327', '4811', '5593');
INSERT INTO `fw_code` VALUES ('4324544', '3408', '1309', '4977', '2660', '8397');
INSERT INTO `fw_code` VALUES ('4324545', '3408', '1310', '1452', '4434', '7602');
INSERT INTO `fw_code` VALUES ('4324546', '3408', '1311', '7246', '2795', '5915');
INSERT INTO `fw_code` VALUES ('4324547', '3408', '1312', '7994', '3934', '5478');
INSERT INTO `fw_code` VALUES ('4324548', '3408', '1313', '5150', '9120', '5576');
INSERT INTO `fw_code` VALUES ('4324549', '3408', '1314', '3335', '0640', '0924');
INSERT INTO `fw_code` VALUES ('4324550', '3408', '1315', '7673', '7732', '9951');
INSERT INTO `fw_code` VALUES ('4324551', '3408', '1316', '3802', '6585', '4799');
INSERT INTO `fw_code` VALUES ('4324552', '3408', '1317', '5832', '2533', '6468');
INSERT INTO `fw_code` VALUES ('4324553', '3408', '1318', '5725', '3799', '7960');
INSERT INTO `fw_code` VALUES ('4324554', '3408', '1319', '8609', '9620', '7701');
INSERT INTO `fw_code` VALUES ('4324555', '3408', '1320', '2775', '0251', '9549');
INSERT INTO `fw_code` VALUES ('4324556', '3408', '1321', '9677', '6962', '2790');
INSERT INTO `fw_code` VALUES ('4324557', '3408', '1322', '1279', '7973', '0424');
INSERT INTO `fw_code` VALUES ('4324558', '3408', '1323', '5364', '6589', '2594');
INSERT INTO `fw_code` VALUES ('4324559', '3408', '1324', '7567', '8998', '1442');
INSERT INTO `fw_code` VALUES ('4324560', '3408', '1325', '6686', '2406', '4540');
INSERT INTO `fw_code` VALUES ('4324561', '3408', '1326', '9997', '3164', '8317');
INSERT INTO `fw_code` VALUES ('4324562', '3408', '1327', '2627', '0509', '1201');
INSERT INTO `fw_code` VALUES ('4324563', '3408', '1328', '0211', '0632', '5334');
INSERT INTO `fw_code` VALUES ('4324564', '3408', '1329', '6859', '8866', '1719');
INSERT INTO `fw_code` VALUES ('4324565', '3408', '1330', '1880', '9370', '1638');
INSERT INTO `fw_code` VALUES ('4324566', '3408', '1331', '3055', '5446', '5236');
INSERT INTO `fw_code` VALUES ('4324567', '3408', '1332', '8675', '7347', '6370');
INSERT INTO `fw_code` VALUES ('4324568', '3408', '1333', '7541', '2279', '2611');
INSERT INTO `fw_code` VALUES ('4324569', '3408', '1334', '6926', '6593', '0388');
INSERT INTO `fw_code` VALUES ('4324570', '3408', '1335', '6646', '1398', '4701');
INSERT INTO `fw_code` VALUES ('4324571', '3408', '1336', '7647', '1013', '1120');
INSERT INTO `fw_code` VALUES ('4324572', '3408', '1337', '1386', '6708', '8933');
INSERT INTO `fw_code` VALUES ('4324573', '3408', '1338', '2480', '0767', '2853');
INSERT INTO `fw_code` VALUES ('4324574', '3408', '1339', '0745', '4303', '7879');
INSERT INTO `fw_code` VALUES ('4324575', '3408', '1340', '2306', '0630', '8997');
INSERT INTO `fw_code` VALUES ('4324576', '3408', '1341', '0917', '7086', '8380');
INSERT INTO `fw_code` VALUES ('4324577', '3408', '1342', '3720', '0892', '8443');
INSERT INTO `fw_code` VALUES ('4324578', '3408', '1343', '3186', '7221', '5899');
INSERT INTO `fw_code` VALUES ('4324579', '3408', '1344', '2947', '3035', '0050');
INSERT INTO `fw_code` VALUES ('4324580', '3408', '1345', '3613', '2158', '9934');
INSERT INTO `fw_code` VALUES ('4324581', '3408', '1346', '6070', '3043', '5640');
INSERT INTO `fw_code` VALUES ('4324582', '3408', '1347', '1772', '6959', '6452');
INSERT INTO `fw_code` VALUES ('4324583', '3408', '1348', '7993', '0257', '8800');
INSERT INTO `fw_code` VALUES ('4324584', '3408', '1349', '8273', '5452', '4488');
INSERT INTO `fw_code` VALUES ('4324585', '3408', '1350', '1304', '1015', '2577');
INSERT INTO `fw_code` VALUES ('4324586', '3408', '1351', '7179', '1392', '0568');
INSERT INTO `fw_code` VALUES ('4324587', '3408', '1352', '2626', '6832', '4523');
INSERT INTO `fw_code` VALUES ('4324588', '3408', '1353', '2265', '9622', '9157');
INSERT INTO `fw_code` VALUES ('4324589', '3408', '1354', '2479', '7090', '6175');
INSERT INTO `fw_code` VALUES ('4324590', '3408', '1355', '8995', '9872', '5220');
INSERT INTO `fw_code` VALUES ('4324591', '3408', '1356', '3481', '6705', '2595');
INSERT INTO `fw_code` VALUES ('4324592', '3408', '1357', '6538', '8987', '9514');
INSERT INTO `fw_code` VALUES ('4324593', '3408', '1358', '2586', '5824', '4684');
INSERT INTO `fw_code` VALUES ('4324594', '3408', '1359', '9915', '7471', '1961');
INSERT INTO `fw_code` VALUES ('4324595', '3408', '1360', '9341', '2793', '9577');
INSERT INTO `fw_code` VALUES ('4324596', '3408', '1361', '4335', '6578', '0666');
INSERT INTO `fw_code` VALUES ('4324597', '3408', '1362', '0810', '8352', '9872');
INSERT INTO `fw_code` VALUES ('4324598', '3408', '1363', '6604', '6713', '8184');
INSERT INTO `fw_code` VALUES ('4324599', '3408', '1364', '7352', '7852', '7747');
INSERT INTO `fw_code` VALUES ('4324600', '3408', '1365', '7031', '1650', '2220');
INSERT INTO `fw_code` VALUES ('4324601', '3408', '1366', '5190', '6451', '8738');
INSERT INTO `fw_code` VALUES ('4324602', '3408', '1367', '5083', '7717', '0229');
INSERT INTO `fw_code` VALUES ('4324603', '3408', '1368', '0623', '7602', '1684');
INSERT INTO `fw_code` VALUES ('4324604', '3408', '1369', '1691', '4944', '6774');
INSERT INTO `fw_code` VALUES ('4324605', '3408', '1370', '3293', '5955', '4407');
INSERT INTO `fw_code` VALUES ('4324606', '3408', '1371', '4722', '0507', '4863');
INSERT INTO `fw_code` VALUES ('4324607', '3408', '1372', '6925', '2916', '3711');
INSERT INTO `fw_code` VALUES ('4324608', '3408', '1373', '8700', '0388', '8524');
INSERT INTO `fw_code` VALUES ('4324609', '3408', '1374', '2011', '1146', '2300');
INSERT INTO `fw_code` VALUES ('4324610', '3408', '1375', '1985', '4427', '3470');
INSERT INTO `fw_code` VALUES ('4324611', '3408', '1376', '1238', '3289', '3907');
INSERT INTO `fw_code` VALUES ('4324612', '3408', '1377', '2413', '9364', '7505');
INSERT INTO `fw_code` VALUES ('4324613', '3408', '1378', '8033', '1265', '8639');
INSERT INTO `fw_code` VALUES ('4324614', '3408', '1379', '9555', '0261', '6595');
INSERT INTO `fw_code` VALUES ('4324615', '3408', '1380', '6284', '0511', '2657');
INSERT INTO `fw_code` VALUES ('4324616', '3408', '1381', '9661', '8995', '5104');
INSERT INTO `fw_code` VALUES ('4324617', '3408', '1382', '3400', '4690', '2916');
INSERT INTO `fw_code` VALUES ('4324618', '3408', '1383', '1838', '4685', '5122');
INSERT INTO `fw_code` VALUES ('4324619', '3408', '1384', '2759', '2285', '1863');
INSERT INTO `fw_code` VALUES ('4324620', '3408', '1385', '1798', '3678', '5283');
INSERT INTO `fw_code` VALUES ('4324621', '3408', '1386', '0409', '0134', '4666');
INSERT INTO `fw_code` VALUES ('4324622', '3408', '1387', '0556', '9876', '3015');
INSERT INTO `fw_code` VALUES ('4324623', '3408', '1388', '0022', '6205', '0470');
INSERT INTO `fw_code` VALUES ('4324624', '3408', '1389', '4442', '5312', '9175');
INSERT INTO `fw_code` VALUES ('4324625', '3408', '1390', '2438', '6082', '6336');
INSERT INTO `fw_code` VALUES ('4324626', '3408', '1391', '1264', '0007', '2738');
INSERT INTO `fw_code` VALUES ('4324627', '3408', '1392', '4041', '7094', '3970');
INSERT INTO `fw_code` VALUES ('4324628', '3408', '1393', '1878', '5693', '4961');
INSERT INTO `fw_code` VALUES ('4324629', '3408', '1394', '5109', '4436', '9059');
INSERT INTO `fw_code` VALUES ('4324630', '3408', '1395', '0383', '3416', '5836');
INSERT INTO `fw_code` VALUES ('4324631', '3408', '1396', '7946', '6863', '0835');
INSERT INTO `fw_code` VALUES ('4324632', '3408', '1397', '6049', '6367', '6505');
INSERT INTO `fw_code` VALUES ('4324633', '3408', '1398', '3033', '5093', '9424');
INSERT INTO `fw_code` VALUES ('4324634', '3408', '1399', '3246', '2561', '6442');
INSERT INTO `fw_code` VALUES ('4324635', '3408', '1400', '4915', '1299', '2746');
INSERT INTO `fw_code` VALUES ('4324636', '3408', '1401', '2418', '9407', '7201');
INSERT INTO `fw_code` VALUES ('4324637', '3408', '1402', '1711', '9276', '7478');
INSERT INTO `fw_code` VALUES ('4324638', '3408', '1403', '6904', '6240', '4576');
INSERT INTO `fw_code` VALUES ('4324639', '3408', '1404', '7305', '4458', '9781');
INSERT INTO `fw_code` VALUES ('4324640', '3408', '1405', '3353', '1295', '4951');
INSERT INTO `fw_code` VALUES ('4324641', '3408', '1406', '5515', '2696', '3960');
INSERT INTO `fw_code` VALUES ('4324642', '3408', '1407', '0108', '8264', '9844');
INSERT INTO `fw_code` VALUES ('4324643', '3408', '1408', '7758', '6113', '2647');
INSERT INTO `fw_code` VALUES ('4324644', '3408', '1409', '4234', '7887', '1853');
INSERT INTO `fw_code` VALUES ('4324645', '3408', '1410', '7372', '2184', '8451');
INSERT INTO `fw_code` VALUES ('4324646', '3408', '1411', '7799', '7121', '2487');
INSERT INTO `fw_code` VALUES ('4324647', '3408', '1412', '6584', '0038', '9049');
INSERT INTO `fw_code` VALUES ('4324648', '3408', '1413', '8613', '5986', '0719');
INSERT INTO `fw_code` VALUES ('4324649', '3408', '1414', '8506', '7252', '2210');
INSERT INTO `fw_code` VALUES ('4324650', '3408', '1415', '1390', '3073', '1951');
INSERT INTO `fw_code` VALUES ('4324651', '3408', '1416', '2458', '0415', '7040');
INSERT INTO `fw_code` VALUES ('4324652', '3408', '1417', '5489', '5978', '5129');
INSERT INTO `fw_code` VALUES ('4324653', '3408', '1418', '9467', '5859', '8790');
INSERT INTO `fw_code` VALUES ('4324654', '3408', '1419', '2779', '6617', '2567');
INSERT INTO `fw_code` VALUES ('4324655', '3408', '1420', '5409', '3962', '5451');
INSERT INTO `fw_code` VALUES ('4324656', '3408', '1421', '6985', '8256', '4254');
INSERT INTO `fw_code` VALUES ('4324657', '3408', '1422', '4661', '2823', '5889');
INSERT INTO `fw_code` VALUES ('4324658', '3408', '1423', '8801', '6736', '8906');
INSERT INTO `fw_code` VALUES ('4324659', '3408', '1424', '7051', '5982', '2924');
INSERT INTO `fw_code` VALUES ('4324660', '3408', '1425', '6771', '0787', '7237');
INSERT INTO `fw_code` VALUES ('4324661', '3408', '1426', '4167', '0161', '3183');
INSERT INTO `fw_code` VALUES ('4324662', '3408', '1427', '2606', '0156', '5388');
INSERT INTO `fw_code` VALUES ('4324663', '3408', '1428', '2565', '9149', '5549');
INSERT INTO `fw_code` VALUES ('4324664', '3408', '1429', '1176', '5605', '4933');
INSERT INTO `fw_code` VALUES ('4324665', '3408', '1430', '0790', '1676', '0737');
INSERT INTO `fw_code` VALUES ('4324666', '3408', '1431', '7865', '4847', '1156');
INSERT INTO `fw_code` VALUES ('4324667', '3408', '1432', '8694', '8002', '0397');
INSERT INTO `fw_code` VALUES ('4324668', '3408', '1433', '3206', '1553', '6603');
INSERT INTO `fw_code` VALUES ('4324669', '3408', '1434', '3674', '7498', '0478');
INSERT INTO `fw_code` VALUES ('4324670', '3408', '1435', '2031', '5478', '3005');
INSERT INTO `fw_code` VALUES ('4324671', '3408', '1436', '5596', '4712', '3638');
INSERT INTO `fw_code` VALUES ('4324672', '3408', '1437', '5302', '5228', '6942');
INSERT INTO `fw_code` VALUES ('4324673', '3408', '1438', '5876', '9907', '9326');
INSERT INTO `fw_code` VALUES ('4324674', '3408', '1439', '3806', '2950', '7817');
INSERT INTO `fw_code` VALUES ('4324675', '3408', '1440', '7438', '9911', '7121');
INSERT INTO `fw_code` VALUES ('4324676', '3408', '1441', '2886', '5351', '1076');
INSERT INTO `fw_code` VALUES ('4324677', '3408', '1442', '2525', '8141', '5710');
INSERT INTO `fw_code` VALUES ('4324678', '3408', '1443', '2738', '5609', '2728');
INSERT INTO `fw_code` VALUES ('4324679', '3408', '1444', '3059', '1811', '8255');
INSERT INTO `fw_code` VALUES ('4324680', '3408', '1445', '3740', '5224', '9147');
INSERT INTO `fw_code` VALUES ('4324681', '3408', '1446', '6797', '7506', '6067');
INSERT INTO `fw_code` VALUES ('4324682', '3408', '1447', '2845', '4343', '1237');
INSERT INTO `fw_code` VALUES ('4324683', '3408', '1448', '7519', '1926', '6799');
INSERT INTO `fw_code` VALUES ('4324684', '3408', '1449', '7585', '9653', '5469');
INSERT INTO `fw_code` VALUES ('4324685', '3408', '1450', '2311', '0673', '8692');
INSERT INTO `fw_code` VALUES ('4324686', '3408', '1451', '4595', '5097', '7219');
INSERT INTO `fw_code` VALUES ('4324687', '3408', '1452', '6218', '5957', '5573');
INSERT INTO `fw_code` VALUES ('4324688', '3408', '1453', '9356', '0254', '2171');
INSERT INTO `fw_code` VALUES ('4324689', '3408', '1454', '9916', '0643', '3546');
INSERT INTO `fw_code` VALUES ('4324690', '3408', '1455', '8100', '2163', '8894');
INSERT INTO `fw_code` VALUES ('4324691', '3408', '1456', '9783', '5191', '6207');
INSERT INTO `fw_code` VALUES ('4324692', '3408', '1457', '8568', '8108', '2769');
INSERT INTO `fw_code` VALUES ('4324693', '3408', '1458', '0597', '4056', '4439');
INSERT INTO `fw_code` VALUES ('4324694', '3408', '1459', '0491', '5322', '5930');
INSERT INTO `fw_code` VALUES ('4324695', '3408', '1460', '3375', '1143', '5671');
INSERT INTO `fw_code` VALUES ('4324696', '3408', '1461', '7540', '1774', '7519');
INSERT INTO `fw_code` VALUES ('4324697', '3408', '1462', '4443', '8484', '0760');
INSERT INTO `fw_code` VALUES ('4324698', '3408', '1463', '0130', '8112', '0564');
INSERT INTO `fw_code` VALUES ('4324699', '3408', '1464', '4763', '4687', '6287');
INSERT INTO `fw_code` VALUES ('4324700', '3408', '1465', '7393', '2032', '9171');
INSERT INTO `fw_code` VALUES ('4324701', '3408', '1466', '1625', '0389', '9689');
INSERT INTO `fw_code` VALUES ('4324702', '3408', '1467', '6645', '0893', '9609');
INSERT INTO `fw_code` VALUES ('4324703', '3408', '1468', '7820', '6969', '3207');
INSERT INTO `fw_code` VALUES ('4324704', '3408', '1469', '9036', '4052', '6644');
INSERT INTO `fw_code` VALUES ('4324705', '3408', '1470', '6152', '8230', '6903');
INSERT INTO `fw_code` VALUES ('4324706', '3408', '1471', '5511', '5826', '5850');
INSERT INTO `fw_code` VALUES ('4324707', '3408', '1472', '4550', '7219', '9269');
INSERT INTO `fw_code` VALUES ('4324708', '3408', '1473', '9850', '2917', '4876');
INSERT INTO `fw_code` VALUES ('4324709', '3408', '1474', '3334', '0135', '5832');
INSERT INTO `fw_code` VALUES ('4324710', '3408', '1475', '3201', '4683', '8492');
INSERT INTO `fw_code` VALUES ('4324711', '3408', '1476', '8314', '9631', '5912');
INSERT INTO `fw_code` VALUES ('4324712', '3408', '1477', '4016', '3548', '6725');
INSERT INTO `fw_code` VALUES ('4324713', '3408', '1478', '0237', '6846', '9073');
INSERT INTO `fw_code` VALUES ('4324714', '3408', '1479', '7286', '3298', '0662');
INSERT INTO `fw_code` VALUES ('4324715', '3408', '1480', '7861', '7976', '3046');
INSERT INTO `fw_code` VALUES ('4324716', '3408', '1481', '5791', '1020', '1537');
INSERT INTO `fw_code` VALUES ('4324717', '3408', '1482', '3548', '7604', '2850');
INSERT INTO `fw_code` VALUES ('4324718', '3408', '1483', '9423', '7981', '0841');
INSERT INTO `fw_code` VALUES ('4324719', '3408', '1484', '4870', '3421', '4796');
INSERT INTO `fw_code` VALUES ('4324720', '3408', '1485', '4509', '6211', '9430');
INSERT INTO `fw_code` VALUES ('4324721', '3408', '1486', '4723', '3679', '6448');
INSERT INTO `fw_code` VALUES ('4324722', '3408', '1487', '5043', '9881', '1975');
INSERT INTO `fw_code` VALUES ('4324723', '3408', '1488', '0531', '6330', '5769');
INSERT INTO `fw_code` VALUES ('4324724', '3408', '1489', '8782', '5576', '9787');
INSERT INTO `fw_code` VALUES ('4324725', '3408', '1490', '4830', '2413', '4957');
INSERT INTO `fw_code` VALUES ('4324726', '3408', '1491', '2159', '4060', '2234');
INSERT INTO `fw_code` VALUES ('4324727', '3408', '1492', '9570', '7722', '9189');
INSERT INTO `fw_code` VALUES ('4324728', '3408', '1493', '4336', '9750', '2251');
INSERT INTO `fw_code` VALUES ('4324729', '3408', '1494', '4296', '8742', '2412');
INSERT INTO `fw_code` VALUES ('4324730', '3408', '1495', '6579', '3167', '0939');
INSERT INTO `fw_code` VALUES ('4324731', '3408', '1496', '3054', '4941', '0144');
INSERT INTO `fw_code` VALUES ('4324732', '3408', '1497', '8848', '3302', '8457');
INSERT INTO `fw_code` VALUES ('4324733', '3408', '1498', '9596', '4441', '8019');
INSERT INTO `fw_code` VALUES ('4324734', '3408', '1499', '9274', '4561', '5815');
INSERT INTO `fw_code` VALUES ('4324735', '3408', '1500', '7458', '6081', '1164');
INSERT INTO `fw_code` VALUES ('4324736', '3408', '1501', '1797', '3173', '0190');
INSERT INTO `fw_code` VALUES ('4324737', '3408', '1502', '7926', '2026', '5038');
INSERT INTO `fw_code` VALUES ('4324738', '3408', '1503', '9956', '7974', '6708');
INSERT INTO `fw_code` VALUES ('4324739', '3408', '1504', '9849', '9240', '8199');
INSERT INTO `fw_code` VALUES ('4324740', '3408', '1505', '2733', '5061', '7940');
INSERT INTO `fw_code` VALUES ('4324741', '3408', '1506', '6898', '5692', '9788');
INSERT INTO `fw_code` VALUES ('4324742', '3408', '1507', '3801', '2403', '3029');
INSERT INTO `fw_code` VALUES ('4324743', '3408', '1508', '5403', '3414', '0663');
INSERT INTO `fw_code` VALUES ('4324744', '3408', '1509', '9488', '2030', '2833');
INSERT INTO `fw_code` VALUES ('4324745', '3408', '1510', '4121', '8605', '8556');
INSERT INTO `fw_code` VALUES ('4324746', '3408', '1511', '0983', '4307', '1958');
INSERT INTO `fw_code` VALUES ('4324747', '3408', '1512', '7178', '0887', '5476');
INSERT INTO `fw_code` VALUES ('4324748', '3408', '1513', '2799', '2788', '6610');
INSERT INTO `fw_code` VALUES ('4324749', '3408', '1514', '1665', '7720', '2851');
INSERT INTO `fw_code` VALUES ('4324750', '3408', '1515', '1050', '2034', '0628');
INSERT INTO `fw_code` VALUES ('4324751', '3408', '1516', '1771', '6454', '1360');
INSERT INTO `fw_code` VALUES ('4324752', '3408', '1517', '5510', '2149', '9172');
INSERT INTO `fw_code` VALUES ('4324753', '3408', '1518', '4869', '9744', '8119');
INSERT INTO `fw_code` VALUES ('4324754', '3408', '1519', '3908', '1137', '1538');
INSERT INTO `fw_code` VALUES ('4324755', '3408', '1520', '2519', '7593', '0922');
INSERT INTO `fw_code` VALUES ('4324756', '3408', '1521', '4788', '7728', '8440');
INSERT INTO `fw_code` VALUES ('4324757', '3408', '1522', '9208', '6835', '7146');
INSERT INTO `fw_code` VALUES ('4324758', '3408', '1523', '2692', '4053', '8101');
INSERT INTO `fw_code` VALUES ('4324759', '3408', '1524', '4548', '3541', '2592');
INSERT INTO `fw_code` VALUES ('4324760', '3408', '1525', '5215', '2665', '2476');
INSERT INTO `fw_code` VALUES ('4324761', '3408', '1526', '7672', '3550', '8181');
INSERT INTO `fw_code` VALUES ('4324762', '3408', '1527', '9595', '0764', '1342');
INSERT INTO `fw_code` VALUES ('4324763', '3408', '1528', '6151', '4553', '0226');
INSERT INTO `fw_code` VALUES ('4324764', '3408', '1529', '9875', '5958', '7030');
INSERT INTO `fw_code` VALUES ('4324765', '3408', '1530', '5149', '4938', '3806');
INSERT INTO `fw_code` VALUES ('4324766', '3408', '1531', '8781', '1899', '3110');
INSERT INTO `fw_code` VALUES ('4324767', '3408', '1532', '4228', '7339', '7065');
INSERT INTO `fw_code` VALUES ('4324768', '3408', '1533', '3867', '0129', '1699');
INSERT INTO `fw_code` VALUES ('4324769', '3408', '1534', '0169', '5442', '3726');
INSERT INTO `fw_code` VALUES ('4324770', '3408', '1535', '4081', '7597', '8717');
INSERT INTO `fw_code` VALUES ('4324771', '3408', '1536', '0596', '0379', '7762');
INSERT INTO `fw_code` VALUES ('4324772', '3408', '1537', '8140', '9494', '2056');
INSERT INTO `fw_code` VALUES ('4324773', '3408', '1538', '4188', '6331', '7226');
INSERT INTO `fw_code` VALUES ('4324774', '3408', '1539', '3654', '2661', '4681');
INSERT INTO `fw_code` VALUES ('4324775', '3408', '1540', '5937', '7085', '3208');
INSERT INTO `fw_code` VALUES ('4324776', '3408', '1541', '2412', '8859', '2413');
INSERT INTO `fw_code` VALUES ('4324777', '3408', '1542', '8206', '7220', '0726');
INSERT INTO `fw_code` VALUES ('4324778', '3408', '1543', '8954', '8359', '0289');
INSERT INTO `fw_code` VALUES ('4324779', '3408', '1544', '4294', '5065', '5735');
INSERT INTO `fw_code` VALUES ('4324780', '3408', '1545', '4762', '1010', '9610');
INSERT INTO `fw_code` VALUES ('4324781', '3408', '1546', '6792', '6958', '1279');
INSERT INTO `fw_code` VALUES ('4324782', '3408', '1547', '6685', '8224', '2770');
INSERT INTO `fw_code` VALUES ('4324783', '3408', '1548', '2225', '8109', '4226');
INSERT INTO `fw_code` VALUES ('4324784', '3408', '1549', '6390', '8740', '6074');
INSERT INTO `fw_code` VALUES ('4324785', '3408', '1550', '6324', '1014', '7405');
INSERT INTO `fw_code` VALUES ('4324786', '3408', '1551', '8526', '3423', '6253');
INSERT INTO `fw_code` VALUES ('4324787', '3408', '1552', '3587', '4934', '6012');
INSERT INTO `fw_code` VALUES ('4324788', '3408', '1553', '9034', '8031', '1536');
INSERT INTO `fw_code` VALUES ('4324789', '3408', '1554', '3026', '2202', '6206');
INSERT INTO `fw_code` VALUES ('4324790', '3408', '1555', '8047', '2705', '6125');
INSERT INTO `fw_code` VALUES ('4324791', '3408', '1556', '9221', '8781', '9723');
INSERT INTO `fw_code` VALUES ('4324792', '3408', '1557', '4842', '0682', '0857');
INSERT INTO `fw_code` VALUES ('4324793', '3408', '1558', '6363', '9678', '8813');
INSERT INTO `fw_code` VALUES ('4324794', '3408', '1559', '2813', '4733', '9188');
INSERT INTO `fw_code` VALUES ('4324795', '3408', '1560', '6470', '8412', '7322');
INSERT INTO `fw_code` VALUES ('4324796', '3408', '1561', '0209', '4107', '5134');
INSERT INTO `fw_code` VALUES ('4324797', '3408', '1562', '8647', '4102', '7340');
INSERT INTO `fw_code` VALUES ('4324798', '3408', '1563', '9568', '1702', '4081');
INSERT INTO `fw_code` VALUES ('4324799', '3408', '1564', '8607', '3095', '7500');
INSERT INTO `fw_code` VALUES ('4324800', '3408', '1565', '7218', '9551', '6884');
INSERT INTO `fw_code` VALUES ('4324801', '3408', '1566', '7365', '9293', '5232');
INSERT INTO `fw_code` VALUES ('4324802', '3408', '1567', '6831', '5622', '2688');
INSERT INTO `fw_code` VALUES ('4324803', '3408', '1568', '1251', '4729', '1393');
INSERT INTO `fw_code` VALUES ('4324804', '3408', '1569', '9247', '5499', '8554');
INSERT INTO `fw_code` VALUES ('4324805', '3408', '1570', '9715', '1444', '2429');
INSERT INTO `fw_code` VALUES ('4324806', '3408', '1571', '8072', '9424', '4956');
INSERT INTO `fw_code` VALUES ('4324807', '3408', '1572', '1638', '8658', '5589');
INSERT INTO `fw_code` VALUES ('4324808', '3408', '1573', '0850', '6511', '6188');
INSERT INTO `fw_code` VALUES ('4324809', '3408', '1574', '8687', '5110', '7179');
INSERT INTO `fw_code` VALUES ('4324810', '3408', '1575', '1918', '3853', '1277');
INSERT INTO `fw_code` VALUES ('4324811', '3408', '1576', '7192', '2832', '8054');
INSERT INTO `fw_code` VALUES ('4324812', '3408', '1577', '4949', '9416', '9366');
INSERT INTO `fw_code` VALUES ('4324813', '3408', '1578', '0824', '9793', '7357');
INSERT INTO `fw_code` VALUES ('4324814', '3408', '1579', '8927', '9297', '3027');
INSERT INTO `fw_code` VALUES ('4324815', '3408', '1580', '5910', '8023', '5947');
INSERT INTO `fw_code` VALUES ('4324816', '3408', '1581', '6124', '5491', '2964');
INSERT INTO `fw_code` VALUES ('4324817', '3408', '1582', '6444', '1694', '8491');
INSERT INTO `fw_code` VALUES ('4324818', '3408', '1583', '7792', '4229', '9268');
INSERT INTO `fw_code` VALUES ('4324819', '3408', '1584', '5295', '2337', '3724');
INSERT INTO `fw_code` VALUES ('4324820', '3408', '1585', '9781', '9170', '1099');
INSERT INTO `fw_code` VALUES ('4324821', '3408', '1586', '0183', '7388', '6304');
INSERT INTO `fw_code` VALUES ('4324822', '3408', '1587', '6231', '4225', '1473');
INSERT INTO `fw_code` VALUES ('4324823', '3408', '1588', '3560', '5872', '8750');
INSERT INTO `fw_code` VALUES ('4324824', '3408', '1589', '3627', '3599', '7420');
INSERT INTO `fw_code` VALUES ('4324825', '3408', '1590', '8393', '5626', '0483');
INSERT INTO `fw_code` VALUES ('4324826', '3408', '1591', '2986', '1194', '6366');
INSERT INTO `fw_code` VALUES ('4324827', '3408', '1592', '5697', '0555', '8929');
INSERT INTO `fw_code` VALUES ('4324828', '3408', '1593', '0636', '9043', '9170');
INSERT INTO `fw_code` VALUES ('4324829', '3408', '1594', '7111', '0817', '8375');
INSERT INTO `fw_code` VALUES ('4324830', '3408', '1595', '0997', '6253', '4536');
INSERT INTO `fw_code` VALUES ('4324831', '3408', '1596', '8153', '1440', '4634');
INSERT INTO `fw_code` VALUES ('4324832', '3408', '1597', '6338', '2959', '9982');
INSERT INTO `fw_code` VALUES ('4324833', '3408', '1598', '0676', '0051', '9009');
INSERT INTO `fw_code` VALUES ('4324834', '3408', '1599', '9461', '2968', '5572');
INSERT INTO `fw_code` VALUES ('4324835', '3408', '1600', '8433', '6634', '0322');
INSERT INTO `fw_code` VALUES ('4324836', '3408', '1601', '5336', '3345', '3563');
INSERT INTO `fw_code` VALUES ('4324837', '3408', '1602', '8367', '8908', '1652');
INSERT INTO `fw_code` VALUES ('4324838', '3408', '1603', '0570', '1317', '0500');
INSERT INTO `fw_code` VALUES ('4324839', '3408', '1604', '2345', '8789', '5313');
INSERT INTO `fw_code` VALUES ('4324840', '3408', '1605', '5656', '9547', '9090');
INSERT INTO `fw_code` VALUES ('4324841', '3408', '1606', '8286', '6892', '1974');
INSERT INTO `fw_code` VALUES ('4324842', '3408', '1607', '7538', '5753', '2411');
INSERT INTO `fw_code` VALUES ('4324843', '3408', '1608', '8713', '1829', '6009');
INSERT INTO `fw_code` VALUES ('4324844', '3408', '1609', '1678', '9666', '5429');
INSERT INTO `fw_code` VALUES ('4324845', '3408', '1610', '3199', '8662', '3384');
INSERT INTO `fw_code` VALUES ('4324846', '3408', '1611', '9929', '8912', '9447');
INSERT INTO `fw_code` VALUES ('4324847', '3408', '1612', '9649', '3717', '3759');
INSERT INTO `fw_code` VALUES ('4324848', '3408', '1613', '3306', '7396', '1893');
INSERT INTO `fw_code` VALUES ('4324849', '3408', '1614', '9567', '8025', '7403');
INSERT INTO `fw_code` VALUES ('4324850', '3408', '1615', '8926', '5620', '6350');
INSERT INTO `fw_code` VALUES ('4324851', '3408', '1616', '7965', '7013', '9769');
INSERT INTO `fw_code` VALUES ('4324852', '3408', '1617', '6576', '3469', '9153');
INSERT INTO `fw_code` VALUES ('4324853', '3408', '1618', '6723', '3211', '7501');
INSERT INTO `fw_code` VALUES ('4324854', '3408', '1619', '3265', '2711', '5377');
INSERT INTO `fw_code` VALUES ('4324855', '3408', '1620', '4093', '5866', '4617');
INSERT INTO `fw_code` VALUES ('4324856', '3408', '1621', '8605', '9417', '0823');
INSERT INTO `fw_code` VALUES ('4324857', '3408', '1622', '6616', '4477', '8993');
INSERT INTO `fw_code` VALUES ('4324858', '3408', '1623', '9073', '5362', '4698');
INSERT INTO `fw_code` VALUES ('4324859', '3408', '1624', '7430', '3342', '7225');
INSERT INTO `fw_code` VALUES ('4324860', '3408', '1625', '0701', '3092', '1162');
INSERT INTO `fw_code` VALUES ('4324861', '3408', '1626', '9206', '0814', '2037');
INSERT INTO `fw_code` VALUES ('4324862', '3408', '1627', '4307', '3334', '1635');
INSERT INTO `fw_code` VALUES ('4324863', '3408', '1628', '8285', '3215', '5296');
INSERT INTO `fw_code` VALUES ('4324864', '3408', '1629', '7924', '6005', '9930');
INSERT INTO `fw_code` VALUES ('4324865', '3408', '1630', '4226', '1318', '1957');
INSERT INTO `fw_code` VALUES ('4324866', '3408', '1631', '8138', '3473', '6948');
INSERT INTO `fw_code` VALUES ('4324867', '3408', '1632', '8458', '9676', '2475');
INSERT INTO `fw_code` VALUES ('4324868', '3408', '1633', '3946', '6124', '6269');
INSERT INTO `fw_code` VALUES ('4324869', '3408', '1634', '2197', '5370', '0287');
INSERT INTO `fw_code` VALUES ('4324870', '3408', '1635', '2918', '9790', '1019');
INSERT INTO `fw_code` VALUES ('4324871', '3408', '1636', '7751', '9544', '2752');
INSERT INTO `fw_code` VALUES ('4324872', '3408', '1637', '9994', '2961', '1439');
INSERT INTO `fw_code` VALUES ('4324873', '3408', '1638', '6469', '4735', '0644');
INSERT INTO `fw_code` VALUES ('4324874', '3408', '1639', '9607', '9032', '7243');
INSERT INTO `fw_code` VALUES ('4324875', '3408', '1640', '0355', '0171', '6805');
INSERT INTO `fw_code` VALUES ('4324876', '3408', '1641', '0034', '3969', '1278');
INSERT INTO `fw_code` VALUES ('4324877', '3408', '1642', '8819', '6886', '7841');
INSERT INTO `fw_code` VALUES ('4324878', '3408', '1643', '0848', '2834', '9510');
INSERT INTO `fw_code` VALUES ('4324879', '3408', '1644', '0742', '4100', '1002');
INSERT INTO `fw_code` VALUES ('4324880', '3408', '1645', '3626', '9921', '0743');
INSERT INTO `fw_code` VALUES ('4324881', '3408', '1646', '7791', '0552', '2591');
INSERT INTO `fw_code` VALUES ('4324882', '3408', '1647', '6296', '8275', '3466');
INSERT INTO `fw_code` VALUES ('4324883', '3408', '1648', '0381', '6890', '5636');
INSERT INTO `fw_code` VALUES ('4324884', '3408', '1649', '1703', '2707', '7582');
INSERT INTO `fw_code` VALUES ('4324885', '3408', '1650', '5014', '3465', '1359');
INSERT INTO `fw_code` VALUES ('4324886', '3408', '1651', '7644', '0810', '4243');
INSERT INTO `fw_code` VALUES ('4324887', '3408', '1652', '5228', '0933', '8377');
INSERT INTO `fw_code` VALUES ('4324888', '3408', '1653', '1876', '9168', '4761');
INSERT INTO `fw_code` VALUES ('4324889', '3408', '1654', '8071', '5747', '8278');
INSERT INTO `fw_code` VALUES ('4324890', '3408', '1655', '3692', '7648', '9412');
INSERT INTO `fw_code` VALUES ('4324891', '3408', '1656', '2558', '2580', '5653');
INSERT INTO `fw_code` VALUES ('4324892', '3408', '1657', '9287', '2830', '1716');
INSERT INTO `fw_code` VALUES ('4324893', '3408', '1658', '1663', '1699', '7743');
INSERT INTO `fw_code` VALUES ('4324894', '3408', '1659', '2664', '1314', '4162');
INSERT INTO `fw_code` VALUES ('4324895', '3408', '1660', '4841', '7005', '4180');
INSERT INTO `fw_code` VALUES ('4324896', '3408', '1661', '5762', '4604', '0921');
INSERT INTO `fw_code` VALUES ('4324897', '3408', '1662', '4801', '5997', '4341');
INSERT INTO `fw_code` VALUES ('4324898', '3408', '1663', '3412', '2453', '3725');
INSERT INTO `fw_code` VALUES ('4324899', '3408', '1664', '3559', '2195', '2073');
INSERT INTO `fw_code` VALUES ('4324900', '3408', '1665', '3025', '8524', '9528');
INSERT INTO `fw_code` VALUES ('4324901', '3408', '1666', '5441', '8402', '5394');
INSERT INTO `fw_code` VALUES ('4324902', '3408', '1667', '8601', '2547', '2713');
INSERT INTO `fw_code` VALUES ('4324903', '3408', '1668', '3713', '7496', '0133');
INSERT INTO `fw_code` VALUES ('4324904', '3408', '1669', '9415', '1412', '0945');
INSERT INTO `fw_code` VALUES ('4324905', '3408', '1670', '5636', '4710', '3293');
INSERT INTO `fw_code` VALUES ('4324906', '3408', '1671', '2192', '8499', '2177');
INSERT INTO `fw_code` VALUES ('4324907', '3408', '1672', '2686', '1162', '4882');
INSERT INTO `fw_code` VALUES ('4324908', '3408', '1673', '3260', '5841', '7266');
INSERT INTO `fw_code` VALUES ('4324909', '3408', '1674', '1190', '8884', '5757');
INSERT INTO `fw_code` VALUES ('4324910', '3408', '1675', '8947', '5468', '7070');
INSERT INTO `fw_code` VALUES ('4324911', '3408', '1676', '0269', '1285', '9016');
INSERT INTO `fw_code` VALUES ('4324912', '3408', '1677', '9909', '4075', '3650');
INSERT INTO `fw_code` VALUES ('4324913', '3408', '1678', '6211', '9388', '5677');
INSERT INTO `fw_code` VALUES ('4324914', '3408', '1679', '0122', '1543', '0668');
INSERT INTO `fw_code` VALUES ('4324915', '3408', '1680', '0443', '7745', '6195');
INSERT INTO `fw_code` VALUES ('4324916', '3408', '1681', '9135', '6217', '5257');
INSERT INTO `fw_code` VALUES ('4324917', '3408', '1682', '5931', '4194', '9989');
INSERT INTO `fw_code` VALUES ('4324918', '3408', '1683', '1124', '1158', '7088');
INSERT INTO `fw_code` VALUES ('4324919', '3408', '1684', '7559', '1924', '6454');
INSERT INTO `fw_code` VALUES ('4324920', '3408', '1685', '4969', '5587', '3409');
INSERT INTO `fw_code` VALUES ('4324921', '3408', '1686', '4328', '3182', '2356');
INSERT INTO `fw_code` VALUES ('4324922', '3408', '1687', '9695', '6607', '6633');
INSERT INTO `fw_code` VALUES ('4324923', '3408', '1688', '1979', '1031', '5159');
INSERT INTO `fw_code` VALUES ('4324924', '3408', '1689', '4247', '1166', '2677');
INSERT INTO `fw_code` VALUES ('4324925', '3408', '1690', '4995', '2305', '2240');
INSERT INTO `fw_code` VALUES ('4324926', '3408', '1691', '4675', '6103', '6713');
INSERT INTO `fw_code` VALUES ('4324927', '3408', '1692', '0804', '4956', '1561');
INSERT INTO `fw_code` VALUES ('4324928', '3408', '1693', '2833', '0904', '3231');
INSERT INTO `fw_code` VALUES ('4324929', '3408', '1694', '2726', '2170', '4722');
INSERT INTO `fw_code` VALUES ('4324930', '3408', '1695', '5610', '7991', '4463');
INSERT INTO `fw_code` VALUES ('4324931', '3408', '1696', '9776', '8622', '6311');
INSERT INTO `fw_code` VALUES ('4324932', '3408', '1697', '6678', '5333', '9552');
INSERT INTO `fw_code` VALUES ('4324933', '3408', '1698', '8280', '6344', '7186');
INSERT INTO `fw_code` VALUES ('4324934', '3408', '1699', '2365', '4960', '9356');
INSERT INTO `fw_code` VALUES ('4324935', '3408', '1700', '4568', '7369', '8204');
INSERT INTO `fw_code` VALUES ('4324936', '3408', '1701', '6999', '1535', '5079');
INSERT INTO `fw_code` VALUES ('4324937', '3408', '1702', '7212', '9003', '2097');
INSERT INTO `fw_code` VALUES ('4324938', '3408', '1703', '3861', '7237', '8481');
INSERT INTO `fw_code` VALUES ('4324939', '3408', '1704', '8881', '7741', '8400');
INSERT INTO `fw_code` VALUES ('4324940', '3408', '1705', '0056', '3817', '1998');
INSERT INTO `fw_code` VALUES ('4324941', '3408', '1706', '4542', '0650', '9373');
INSERT INTO `fw_code` VALUES ('4324942', '3408', '1707', '3927', '4964', '7150');
INSERT INTO `fw_code` VALUES ('4324943', '3408', '1708', '3647', '9769', '1463');
INSERT INTO `fw_code` VALUES ('4324944', '3408', '1709', '4649', '9384', '7882');
INSERT INTO `fw_code` VALUES ('4324945', '3408', '1710', '8387', '5079', '5695');
INSERT INTO `fw_code` VALUES ('4324946', '3408', '1711', '9481', '9138', '9615');
INSERT INTO `fw_code` VALUES ('4324947', '3408', '1712', '7746', '2674', '4641');
INSERT INTO `fw_code` VALUES ('4324948', '3408', '1713', '6785', '4067', '8061');
INSERT INTO `fw_code` VALUES ('4324949', '3408', '1714', '7919', '5457', '5143');
INSERT INTO `fw_code` VALUES ('4324950', '3408', '1715', '0722', '9263', '5205');
INSERT INTO `fw_code` VALUES ('4324951', '3408', '1716', '4607', '4699', '1366');
INSERT INTO `fw_code` VALUES ('4324952', '3408', '1717', '8092', '1918', '2321');
INSERT INTO `fw_code` VALUES ('4324953', '3408', '1718', '0615', '0529', '6696');
INSERT INTO `fw_code` VALUES ('4324954', '3408', '1719', '3071', '1414', '2402');
INSERT INTO `fw_code` VALUES ('4324955', '3408', '1720', '8773', '5330', '3214');
INSERT INTO `fw_code` VALUES ('4324956', '3408', '1721', '4994', '8628', '5562');
INSERT INTO `fw_code` VALUES ('4324957', '3408', '1722', '1550', '2417', '4446');
INSERT INTO `fw_code` VALUES ('4324958', '3408', '1723', '5274', '3822', '1250');
INSERT INTO `fw_code` VALUES ('4324959', '3408', '1724', '0548', '2802', '8027');
INSERT INTO `fw_code` VALUES ('4324960', '3408', '1725', '8305', '9386', '9339');
INSERT INTO `fw_code` VALUES ('4324961', '3408', '1726', '9628', '5203', '1285');
INSERT INTO `fw_code` VALUES ('4324962', '3408', '1727', '9267', '7993', '5919');
INSERT INTO `fw_code` VALUES ('4324963', '3408', '1728', '5569', '3306', '7946');
INSERT INTO `fw_code` VALUES ('4324964', '3408', '1729', '9480', '5461', '2937');
INSERT INTO `fw_code` VALUES ('4324965', '3408', '1730', '9801', '1664', '8464');
INSERT INTO `fw_code` VALUES ('4324966', '3408', '1731', '1149', '4199', '9241');
INSERT INTO `fw_code` VALUES ('4324967', '3408', '1732', '5996', '8243', '1982');
INSERT INTO `fw_code` VALUES ('4324968', '3408', '1733', '0482', '5076', '9357');
INSERT INTO `fw_code` VALUES ('4324969', '3408', '1734', '3539', '7358', '6277');
INSERT INTO `fw_code` VALUES ('4324970', '3408', '1735', '9587', '4195', '1446');
INSERT INTO `fw_code` VALUES ('4324971', '3408', '1736', '6917', '5842', '8723');
INSERT INTO `fw_code` VALUES ('4324972', '3408', '1737', '9093', '1532', '8741');
INSERT INTO `fw_code` VALUES ('4324973', '3408', '1738', '6342', '1164', '6339');
INSERT INTO `fw_code` VALUES ('4324974', '3408', '1739', '9053', '0525', '8902');
INSERT INTO `fw_code` VALUES ('4324975', '3408', '1740', '1337', '4949', '7428');
INSERT INTO `fw_code` VALUES ('4324976', '3408', '1741', '7812', '6723', '6634');
INSERT INTO `fw_code` VALUES ('4324977', '3408', '1742', '3606', '5084', '4946');
INSERT INTO `fw_code` VALUES ('4324978', '3408', '1743', '4353', '6223', '4509');
INSERT INTO `fw_code` VALUES ('4324979', '3408', '1744', '1510', '1410', '4607');
INSERT INTO `fw_code` VALUES ('4324980', '3408', '1745', '9694', '2929', '9955');
INSERT INTO `fw_code` VALUES ('4324981', '3408', '1746', '4033', '0021', '8982');
INSERT INTO `fw_code` VALUES ('4324982', '3408', '1747', '0162', '8874', '3830');
INSERT INTO `fw_code` VALUES ('4324983', '3408', '1748', '2191', '4822', '5500');
INSERT INTO `fw_code` VALUES ('4324984', '3408', '1749', '2084', '6088', '6991');
INSERT INTO `fw_code` VALUES ('4324985', '3408', '1750', '1790', '6604', '0295');
INSERT INTO `fw_code` VALUES ('4324986', '3408', '1751', '8692', '3315', '3536');
INSERT INTO `fw_code` VALUES ('4324987', '3408', '1752', '0294', '4326', '1170');
INSERT INTO `fw_code` VALUES ('4324988', '3408', '1753', '1723', '8878', '1625');
INSERT INTO `fw_code` VALUES ('4324989', '3408', '1754', '3926', '1287', '0473');
INSERT INTO `fw_code` VALUES ('4324990', '3408', '1755', '9013', '9517', '9062');
INSERT INTO `fw_code` VALUES ('4324991', '3408', '1756', '8987', '2798', '0232');
INSERT INTO `fw_code` VALUES ('4324992', '3408', '1757', '9226', '6985', '6080');
INSERT INTO `fw_code` VALUES ('4324993', '3408', '1758', '8239', '1659', '0669');
INSERT INTO `fw_code` VALUES ('4324994', '3408', '1759', '9414', '7735', '4268');
INSERT INTO `fw_code` VALUES ('4324995', '3408', '1760', '5035', '9636', '5402');
INSERT INTO `fw_code` VALUES ('4324996', '3408', '1761', '6556', '8632', '3357');
INSERT INTO `fw_code` VALUES ('4324997', '3408', '1762', '3285', '8882', '9420');
INSERT INTO `fw_code` VALUES ('4324998', '3408', '1763', '3005', '3687', '3732');
INSERT INTO `fw_code` VALUES ('4324999', '3408', '1764', '6663', '7366', '1866');
INSERT INTO `fw_code` VALUES ('4325000', '3408', '1765', '0401', '3061', '9678');
INSERT INTO `fw_code` VALUES ('4325001', '3408', '1766', '8839', '3056', '1884');
INSERT INTO `fw_code` VALUES ('4325002', '3408', '1767', '8799', '2049', '2045');
INSERT INTO `fw_code` VALUES ('4325003', '3408', '1768', '7558', '8247', '9777');
INSERT INTO `fw_code` VALUES ('4325004', '3408', '1769', '7024', '4576', '7232');
INSERT INTO `fw_code` VALUES ('4325005', '3408', '1770', '3401', '0852', '9057');
INSERT INTO `fw_code` VALUES ('4325006', '3408', '1771', '3868', '6797', '2932');
INSERT INTO `fw_code` VALUES ('4325007', '3408', '1772', '2226', '4777', '5459');
INSERT INTO `fw_code` VALUES ('4325008', '3408', '1773', '5003', '1864', '6691');
INSERT INTO `fw_code` VALUES ('4325009', '3408', '1774', '6071', '9206', '1780');
INSERT INTO `fw_code` VALUES ('4325010', '3408', '1775', '1345', '8186', '8557');
INSERT INTO `fw_code` VALUES ('4325011', '3408', '1776', '3080', '4650', '3530');
INSERT INTO `fw_code` VALUES ('4325012', '3408', '1777', '0063', '3376', '6450');
INSERT INTO `fw_code` VALUES ('4325013', '3408', '1778', '6365', '8689', '8477');
INSERT INTO `fw_code` VALUES ('4325014', '3408', '1779', '1946', '9583', '9771');
INSERT INTO `fw_code` VALUES ('4325015', '3408', '1780', '9448', '7690', '4227');
INSERT INTO `fw_code` VALUES ('4325016', '3408', '1781', '3935', '4523', '1602');
INSERT INTO `fw_code` VALUES ('4325017', '3408', '1782', '0384', '9578', '1977');
INSERT INTO `fw_code` VALUES ('4325018', '3408', '1783', '7714', '1225', '9253');
INSERT INTO `fw_code` VALUES ('4325019', '3408', '1784', '7780', '8952', '7923');
INSERT INTO `fw_code` VALUES ('4325020', '3408', '1785', '2546', '0979', '0986');
INSERT INTO `fw_code` VALUES ('4325021', '3408', '1786', '7139', '6547', '6870');
INSERT INTO `fw_code` VALUES ('4325022', '3408', '1787', '4789', '4396', '9673');
INSERT INTO `fw_code` VALUES ('4325023', '3408', '1788', '4402', '0467', '5477');
INSERT INTO `fw_code` VALUES ('4325024', '3408', '1789', '3614', '8321', '6075');
INSERT INTO `fw_code` VALUES ('4325025', '3408', '1790', '5644', '4269', '7745');
INSERT INTO `fw_code` VALUES ('4325026', '3408', '1791', '5537', '5535', '9236');
INSERT INTO `fw_code` VALUES ('4325027', '3408', '1792', '9489', '8698', '4066');
INSERT INTO `fw_code` VALUES ('4325028', '3408', '1793', '1091', '9710', '1700');
INSERT INTO `fw_code` VALUES ('4325029', '3408', '1794', '2520', '4261', '2155');
INSERT INTO `fw_code` VALUES ('4325030', '3408', '1795', '9809', '4900', '9593');
INSERT INTO `fw_code` VALUES ('4325031', '3408', '1796', '2439', '2245', '2477');
INSERT INTO `fw_code` VALUES ('4325032', '3408', '1797', '4015', '6539', '1280');
INSERT INTO `fw_code` VALUES ('4325033', '3408', '1798', '1692', '1106', '2914');
INSERT INTO `fw_code` VALUES ('4325034', '3408', '1799', '5831', '5019', '5932');
INSERT INTO `fw_code` VALUES ('4325035', '3408', '1800', '4082', '4265', '9950');
INSERT INTO `fw_code` VALUES ('4325036', '3408', '1801', '7459', '2749', '2396');
INSERT INTO `fw_code` VALUES ('4325037', '3408', '1802', '1198', '8444', '0209');
INSERT INTO `fw_code` VALUES ('4325038', '3408', '1803', '9636', '8440', '2414');
INSERT INTO `fw_code` VALUES ('4325039', '3408', '1804', '0557', '6039', '9155');
INSERT INTO `fw_code` VALUES ('4325040', '3408', '1805', '8207', '3888', '1959');
INSERT INTO `fw_code` VALUES ('4325041', '3408', '1806', '8354', '3630', '0307');
INSERT INTO `fw_code` VALUES ('4325042', '3408', '1807', '4896', '3130', '8182');
INSERT INTO `fw_code` VALUES ('4325043', '3408', '1808', '0704', '5781', '7503');
INSERT INTO `fw_code` VALUES ('4325044', '3408', '1809', '9062', '3761', '0030');
INSERT INTO `fw_code` VALUES ('4325045', '3408', '1810', '2332', '3511', '3968');
INSERT INTO `fw_code` VALUES ('4325046', '3408', '1811', '0837', '1233', '4843');
INSERT INTO `fw_code` VALUES ('4325047', '3408', '1812', '5938', '3753', '4441');
INSERT INTO `fw_code` VALUES ('4325048', '3408', '1813', '4469', '8194', '4146');
INSERT INTO `fw_code` VALUES ('4325049', '3408', '1814', '5857', '1737', '4762');
INSERT INTO `fw_code` VALUES ('4325050', '3408', '1815', '0089', '0095', '5280');
INSERT INTO `fw_code` VALUES ('4325051', '3408', '1816', '6350', '0723', '0791');
INSERT INTO `fw_code` VALUES ('4325052', '3408', '1817', '2398', '7560', '5960');
INSERT INTO `fw_code` VALUES ('4325053', '3408', '1818', '7138', '2870', '0192');
INSERT INTO `fw_code` VALUES ('4325054', '3408', '1819', '6497', '0465', '9139');
INSERT INTO `fw_code` VALUES ('4325055', '3408', '1820', '1864', '3890', '3416');
INSERT INTO `fw_code` VALUES ('4325056', '3408', '1821', '4147', '8314', '1942');
INSERT INTO `fw_code` VALUES ('4325057', '3408', '1822', '0622', '0088', '1148');
INSERT INTO `fw_code` VALUES ('4325058', '3408', '1823', '3760', '4386', '7746');
INSERT INTO `fw_code` VALUES ('4325059', '3408', '1824', '4320', '4775', '9121');
INSERT INTO `fw_code` VALUES ('4325060', '3408', '1825', '2504', '6295', '4469');
INSERT INTO `fw_code` VALUES ('4325061', '3408', '1826', '0449', '3628', '3969');
INSERT INTO `fw_code` VALUES ('4325062', '3408', '1827', '4534', '2243', '6139');
INSERT INTO `fw_code` VALUES ('4325063', '3408', '1828', '6029', '4521', '5264');
INSERT INTO `fw_code` VALUES ('4325064', '3408', '1829', '2224', '1100', '8782');
INSERT INTO `fw_code` VALUES ('4325065', '3408', '1830', '6711', '7933', '6157');
INSERT INTO `fw_code` VALUES ('4325066', '3408', '1831', '5816', '7052', '8246');
INSERT INTO `fw_code` VALUES ('4325067', '3408', '1832', '4254', '7048', '0451');
INSERT INTO `fw_code` VALUES ('4325068', '3408', '1833', '7738', '4267', '1407');
INSERT INTO `fw_code` VALUES ('4325069', '3408', '1834', '1690', '7429', '6237');
INSERT INTO `fw_code` VALUES ('4325070', '3408', '1835', '0195', '5152', '7112');
INSERT INTO `fw_code` VALUES ('4325071', '3408', '1836', '7952', '1735', '8425');
INSERT INTO `fw_code` VALUES ('4325072', '3408', '1837', '9447', '4013', '7550');
INSERT INTO `fw_code` VALUES ('4325073', '3408', '1838', '5643', '0592', '1067');
INSERT INTO `fw_code` VALUES ('4325074', '3408', '1839', '4935', '0461', '1344');
INSERT INTO `fw_code` VALUES ('4325075', '3408', '1840', '0129', '7425', '8442');
INSERT INTO `fw_code` VALUES ('4325076', '3408', '1841', '6563', '8191', '7808');
INSERT INTO `fw_code` VALUES ('4325077', '3408', '1842', '3974', '1854', '4764');
INSERT INTO `fw_code` VALUES ('4325078', '3408', '1843', '8740', '3882', '7826');
INSERT INTO `fw_code` VALUES ('4325079', '3408', '1844', '3333', '9449', '3710');
INSERT INTO `fw_code` VALUES ('4325080', '3408', '1845', '3679', '2370', '8067');
INSERT INTO `fw_code` VALUES ('4325081', '3408', '1846', '6986', '6257', '3734');
INSERT INTO `fw_code` VALUES ('4325082', '3408', '1847', '6879', '7523', '5225');
INSERT INTO `fw_code` VALUES ('4325083', '3408', '1848', '8721', '2722', '8707');
INSERT INTO `fw_code` VALUES ('4325084', '3408', '1849', '8014', '2591', '8984');
INSERT INTO `fw_code` VALUES ('4325085', '3408', '1850', '7800', '5122', '1966');
INSERT INTO `fw_code` VALUES ('4325086', '3408', '1851', '8802', '4737', '8386');
INSERT INTO `fw_code` VALUES ('4325087', '3408', '1852', '3634', '4491', '0118');
INSERT INTO `fw_code` VALUES ('4325088', '3408', '1853', '1900', '8027', '5144');
INSERT INTO `fw_code` VALUES ('4325089', '3408', '1854', '0938', '9420', '8564');
INSERT INTO `fw_code` VALUES ('4325090', '3408', '1855', '9550', '5876', '7948');
INSERT INTO `fw_code` VALUES ('4325091', '3408', '1856', '2353', '9682', '8011');
INSERT INTO `fw_code` VALUES ('4325092', '3408', '1857', '1579', '1824', '9618');
INSERT INTO `fw_code` VALUES ('4325093', '3408', '1858', '2246', '0948', '9502');
INSERT INTO `fw_code` VALUES ('4325094', '3408', '1859', '4703', '1833', '5207');
INSERT INTO `fw_code` VALUES ('4325095', '3408', '1860', '3181', '2836', '7252');
INSERT INTO `fw_code` VALUES ('4325096', '3408', '1861', '6905', '4242', '4055');
INSERT INTO `fw_code` VALUES ('4325097', '3408', '1862', '2180', '3221', '0832');
INSERT INTO `fw_code` VALUES ('4325098', '3408', '1863', '7200', '3725', '0752');
INSERT INTO `fw_code` VALUES ('4325099', '3408', '1864', '1111', '5880', '5743');
INSERT INTO `fw_code` VALUES ('4325100', '3408', '1865', '1432', '2083', '1270');
INSERT INTO `fw_code` VALUES ('4325101', '3408', '1866', '2780', '4618', '2046');
INSERT INTO `fw_code` VALUES ('4325102', '3408', '1867', '2113', '5495', '2162');
INSERT INTO `fw_code` VALUES ('4325103', '3408', '1868', '5170', '7777', '9082');
INSERT INTO `fw_code` VALUES ('4325104', '3408', '1869', '8614', '3988', '0198');
INSERT INTO `fw_code` VALUES ('4325105', '3408', '1870', '7973', '1583', '9145');
INSERT INTO `fw_code` VALUES ('4325106', '3408', '1871', '9443', '7142', '9439');
INSERT INTO `fw_code` VALUES ('4325107', '3408', '1872', '5237', '5503', '7752');
INSERT INTO `fw_code` VALUES ('4325108', '3408', '1873', '5984', '6642', '7314');
INSERT INTO `fw_code` VALUES ('4325109', '3408', '1874', '6237', '1441', '7494');
INSERT INTO `fw_code` VALUES ('4325110', '3408', '1875', '4447', '9679', '1673');
INSERT INTO `fw_code` VALUES ('4325111', '3408', '1876', '8079', '6640', '0976');
INSERT INTO `fw_code` VALUES ('4325112', '3408', '1877', '4554', '8414', '0182');
INSERT INTO `fw_code` VALUES ('4325113', '3408', '1878', '2952', '7402', '2548');
INSERT INTO `fw_code` VALUES ('4325114', '3408', '1879', '1563', '3858', '1932');
INSERT INTO `fw_code` VALUES ('4325115', '3408', '1880', '1604', '4866', '1771');
INSERT INTO `fw_code` VALUES ('4325116', '3408', '1881', '4061', '5751', '7476');
INSERT INTO `fw_code` VALUES ('4325117', '3408', '1882', '5195', '0818', '1235');
INSERT INTO `fw_code` VALUES ('4325118', '3408', '1883', '6263', '8160', '6325');
INSERT INTO `fw_code` VALUES ('4325119', '3408', '1884', '1538', '7140', '3101');
INSERT INTO `fw_code` VALUES ('4325120', '3408', '1885', '9294', '3723', '4414');
INSERT INTO `fw_code` VALUES ('4325121', '3408', '1886', '6558', '7643', '3021');
INSERT INTO `fw_code` VALUES ('4325122', '3408', '1887', '2138', '8537', '4316');
INSERT INTO `fw_code` VALUES ('4325123', '3408', '1888', '8934', '6513', '9048');
INSERT INTO `fw_code` VALUES ('4325124', '3408', '1889', '4127', '3477', '6146');
INSERT INTO `fw_code` VALUES ('4325125', '3408', '1890', '4528', '1695', '1351');
INSERT INTO `fw_code` VALUES ('4325126', '3408', '1891', '7972', '7906', '2467');
INSERT INTO `fw_code` VALUES ('4325127', '3408', '1892', '7331', '5501', '1414');
INSERT INTO `fw_code` VALUES ('4325128', '3408', '1893', '3807', '7275', '0619');
INSERT INTO `fw_code` VALUES ('4325129', '3408', '1894', '5836', '3223', '2289');
INSERT INTO `fw_code` VALUES ('4325130', '3408', '1895', '1898', '2006', '0036');
INSERT INTO `fw_code` VALUES ('4325131', '3408', '1896', '5209', '2764', '3813');
INSERT INTO `fw_code` VALUES ('4325132', '3408', '1897', '7839', '0109', '6697');
INSERT INTO `fw_code` VALUES ('4325133', '3408', '1898', '5422', '0232', '0831');
INSERT INTO `fw_code` VALUES ('4325134', '3408', '1899', '7091', '8971', '7135');
INSERT INTO `fw_code` VALUES ('4325135', '3408', '1900', '8266', '5046', '0733');
INSERT INTO `fw_code` VALUES ('4325136', '3408', '1901', '1231', '2883', '0152');
INSERT INTO `fw_code` VALUES ('4325137', '3408', '1902', '2752', '1879', '8108');
INSERT INTO `fw_code` VALUES ('4325138', '3408', '1903', '9201', '6935', '8483');
INSERT INTO `fw_code` VALUES ('4325139', '3408', '1904', '6597', '6308', '4429');
INSERT INTO `fw_code` VALUES ('4325140', '3408', '1905', '5956', '3903', '3376');
INSERT INTO `fw_code` VALUES ('4325141', '3408', '1906', '3607', '1752', '6179');
INSERT INTO `fw_code` VALUES ('4325142', '3408', '1907', '3754', '1494', '4527');
INSERT INTO `fw_code` VALUES ('4325143', '3408', '1908', '3220', '7823', '1983');
INSERT INTO `fw_code` VALUES ('4325144', '3408', '1909', '6104', '3645', '1724');
INSERT INTO `fw_code` VALUES ('4325145', '3408', '1910', '4461', '1625', '4251');
INSERT INTO `fw_code` VALUES ('4325146', '3408', '1911', '8026', '0859', '4884');
INSERT INTO `fw_code` VALUES ('4325147', '3408', '1912', '7238', '8712', '5483');
INSERT INTO `fw_code` VALUES ('4325148', '3408', '1913', '7732', '1375', '8188');
INSERT INTO `fw_code` VALUES ('4325149', '3408', '1914', '8306', '6054', '0572');
INSERT INTO `fw_code` VALUES ('4325150', '3408', '1915', '6236', '9098', '9063');
INSERT INTO `fw_code` VALUES ('4325151', '3408', '1916', '9868', '6058', '8367');
INSERT INTO `fw_code` VALUES ('4325152', '3408', '1917', '5316', '1498', '2322');
INSERT INTO `fw_code` VALUES ('4325153', '3408', '1918', '4955', '4288', '6956');
INSERT INTO `fw_code` VALUES ('4325154', '3408', '1919', '1257', '9601', '8983');
INSERT INTO `fw_code` VALUES ('4325155', '3408', '1920', '5168', '1756', '3974');
INSERT INTO `fw_code` VALUES ('4325156', '3408', '1921', '4181', '6431', '8563');
INSERT INTO `fw_code` VALUES ('4325157', '3408', '1922', '1684', '4538', '3018');
INSERT INTO `fw_code` VALUES ('4325158', '3408', '1923', '0977', '4407', '3295');
INSERT INTO `fw_code` VALUES ('4325159', '3408', '1924', '6170', '1371', '0393');
INSERT INTO `fw_code` VALUES ('4325160', '3408', '1925', '9227', '3653', '7313');
INSERT INTO `fw_code` VALUES ('4325161', '3408', '1926', '5275', '0490', '2483');
INSERT INTO `fw_code` VALUES ('4325162', '3408', '1927', '9949', '8073', '8045');
INSERT INTO `fw_code` VALUES ('4325163', '3408', '1928', '0015', '5800', '6715');
INSERT INTO `fw_code` VALUES ('4325164', '3408', '1929', '9375', '3395', '5661');
INSERT INTO `fw_code` VALUES ('4325165', '3408', '1930', '7386', '8454', '3831');
INSERT INTO `fw_code` VALUES ('4325166', '3408', '1931', '7198', '7705', '5644');
INSERT INTO `fw_code` VALUES ('4325167', '3408', '1932', '5382', '9225', '0992');
INSERT INTO `fw_code` VALUES ('4325168', '3408', '1933', '7065', '2252', '8304');
INSERT INTO `fw_code` VALUES ('4325169', '3408', '1934', '5850', '5169', '4867');
INSERT INTO `fw_code` VALUES ('4325170', '3408', '1935', '7879', '1117', '6536');
INSERT INTO `fw_code` VALUES ('4325171', '3408', '1936', '0656', '8204', '7768');
INSERT INTO `fw_code` VALUES ('4325172', '3408', '1937', '1724', '5546', '2858');
INSERT INTO `fw_code` VALUES ('4325173', '3408', '1938', '7411', '5173', '2661');
INSERT INTO `fw_code` VALUES ('4325174', '3408', '1939', '6958', '3518', '9795');
INSERT INTO `fw_code` VALUES ('4325175', '3408', '1940', '2045', '1748', '8384');
INSERT INTO `fw_code` VALUES ('4325176', '3408', '1941', '5102', '4030', '5304');
INSERT INTO `fw_code` VALUES ('4325177', '3408', '1942', '0723', '5931', '6438');
INSERT INTO `fw_code` VALUES ('4325178', '3408', '1943', '9588', '0863', '2679');
INSERT INTO `fw_code` VALUES ('4325179', '3408', '1944', '6317', '1113', '8742');
INSERT INTO `fw_code` VALUES ('4325180', '3408', '1945', '3433', '5292', '9000');
INSERT INTO `fw_code` VALUES ('4325181', '3408', '1946', '7049', '4286', '0618');
INSERT INTO `fw_code` VALUES ('4325182', '3408', '1947', '7970', '1885', '7359');
INSERT INTO `fw_code` VALUES ('4325183', '3408', '1948', '7009', '3278', '0779');
INSERT INTO `fw_code` VALUES ('4325184', '3408', '1949', '5620', '9734', '0163');
INSERT INTO `fw_code` VALUES ('4325185', '3408', '1950', '5768', '9476', '8511');
INSERT INTO `fw_code` VALUES ('4325186', '3408', '1951', '5234', '5805', '5966');
INSERT INTO `fw_code` VALUES ('4325187', '3408', '1952', '5661', '0742', '0002');
INSERT INTO `fw_code` VALUES ('4325188', '3408', '1953', '6475', '9607', '8234');
INSERT INTO `fw_code` VALUES ('4325189', '3408', '1954', '2696', '2905', '0583');
INSERT INTO `fw_code` VALUES ('4325190', '3408', '1955', '9252', '6694', '9466');
INSERT INTO `fw_code` VALUES ('4325191', '3408', '1956', '8250', '7080', '3047');
INSERT INTO `fw_code` VALUES ('4325192', '3408', '1957', '1882', '4040', '2350');
INSERT INTO `fw_code` VALUES ('4325193', '3408', '1958', '7329', '9480', '6306');
INSERT INTO `fw_code` VALUES ('4325194', '3408', '1959', '6195', '4413', '2547');
INSERT INTO `fw_code` VALUES ('4325195', '3408', '1960', '3698', '2520', '7002');
INSERT INTO `fw_code` VALUES ('4325196', '3408', '1961', '2991', '2389', '7279');
INSERT INTO `fw_code` VALUES ('4325197', '3408', '1962', '8184', '9353', '4377');
INSERT INTO `fw_code` VALUES ('4325198', '3408', '1963', '1241', '1635', '1297');
INSERT INTO `fw_code` VALUES ('4325199', '3408', '1964', '7289', '8472', '6467');
INSERT INTO `fw_code` VALUES ('4325200', '3408', '1965', '4619', '0119', '3743');
INSERT INTO `fw_code` VALUES ('4325201', '3408', '1966', '2029', '3782', '0699');
INSERT INTO `fw_code` VALUES ('4325202', '3408', '1967', '6795', '5810', '3761');
INSERT INTO `fw_code` VALUES ('4325203', '3408', '1968', '1388', '1377', '9645');
INSERT INTO `fw_code` VALUES ('4325204', '3408', '1969', '5514', '1000', '1654');
INSERT INTO `fw_code` VALUES ('4325205', '3408', '1970', '1307', '9361', '9967');
INSERT INTO `fw_code` VALUES ('4325206', '3408', '1971', '2055', '0500', '9529');
INSERT INTO `fw_code` VALUES ('4325207', '3408', '1972', '9212', '5687', '9627');
INSERT INTO `fw_code` VALUES ('4325208', '3408', '1973', '7396', '7207', '4975');
INSERT INTO `fw_code` VALUES ('4325209', '3408', '1974', '1735', '4298', '4002');
INSERT INTO `fw_code` VALUES ('4325210', '3408', '1975', '7863', '3151', '8850');
INSERT INTO `fw_code` VALUES ('4325211', '3408', '1976', '9893', '9099', '0520');
INSERT INTO `fw_code` VALUES ('4325212', '3408', '1977', '2670', '6186', '1752');
INSERT INTO `fw_code` VALUES ('4325213', '3408', '1978', '6836', '6817', '3600');
INSERT INTO `fw_code` VALUES ('4325214', '3408', '1979', '5340', '4540', '4475');
INSERT INTO `fw_code` VALUES ('4325215', '3408', '1980', '1628', '5564', '5493');
INSERT INTO `fw_code` VALUES ('4325216', '3408', '1981', '0747', '8972', '8591');
INSERT INTO `fw_code` VALUES ('4325217', '3408', '1982', '4059', '9730', '2368');
INSERT INTO `fw_code` VALUES ('4325218', '3408', '1983', '6689', '7075', '5252');
INSERT INTO `fw_code` VALUES ('4325219', '3408', '1984', '4272', '7198', '9386');
INSERT INTO `fw_code` VALUES ('4325220', '3408', '1985', '5941', '5937', '5690');
INSERT INTO `fw_code` VALUES ('4325221', '3408', '1986', '7116', '2012', '9288');
INSERT INTO `fw_code` VALUES ('4325222', '3408', '1987', '2736', '3913', '0422');
INSERT INTO `fw_code` VALUES ('4325223', '3408', '1988', '0987', '3159', '4440');
INSERT INTO `fw_code` VALUES ('4325224', '3408', '1989', '0707', '7964', '8752');
INSERT INTO `fw_code` VALUES ('4325225', '3408', '1990', '5447', '3274', '2984');
INSERT INTO `fw_code` VALUES ('4325226', '3408', '1991', '6541', '7334', '6904');
INSERT INTO `fw_code` VALUES ('4325227', '3408', '1992', '3845', '2262', '5350');
INSERT INTO `fw_code` VALUES ('4325228', '3408', '1993', '5260', '2524', '4797');
INSERT INTO `fw_code` VALUES ('4325229', '3408', '1994', '4725', '8853', '2252');
INSERT INTO `fw_code` VALUES ('4325230', '3408', '1995', '4486', '4667', '6404');
INSERT INTO `fw_code` VALUES ('4325231', '3408', '1996', '7609', '4675', '1993');
INSERT INTO `fw_code` VALUES ('4325232', '3408', '1997', '3311', '8591', '2806');
INSERT INTO `fw_code` VALUES ('4325233', '3408', '1998', '6088', '5678', '4038');
INSERT INTO `fw_code` VALUES ('4325234', '3408', '1999', '9074', '3363', '4177');
INSERT INTO `fw_code` VALUES ('4325235', '3408', '2000', '7579', '1086', '5052');
INSERT INTO `fw_code` VALUES ('4325236', '3408', '2001', '6658', '3486', '8311');
INSERT INTO `fw_code` VALUES ('4325237', '3408', '2002', '2599', '1589', '4972');
INSERT INTO `fw_code` VALUES ('4325238', '3408', '2003', '4975', '0459', '0999');
INSERT INTO `fw_code` VALUES ('4325239', '3408', '2004', '7513', '3359', '6383');
INSERT INTO `fw_code` VALUES ('4325240', '3408', '2005', '6618', '2478', '8472');
INSERT INTO `fw_code` VALUES ('4325241', '3408', '2006', '4014', '1852', '4419');
INSERT INTO `fw_code` VALUES ('4325242', '3408', '2007', '6084', '8808', '5927');
INSERT INTO `fw_code` VALUES ('4325243', '3408', '2008', '9222', '3105', '2525');
INSERT INTO `fw_code` VALUES ('4325244', '3408', '2009', '9115', '4371', '4016');
INSERT INTO `fw_code` VALUES ('4325245', '3408', '2010', '4655', '4256', '5472');
INSERT INTO `fw_code` VALUES ('4325246', '3408', '2011', '7325', '2609', '8195');
INSERT INTO `fw_code` VALUES ('4325247', '3408', '2012', '2732', '7042', '2311');
INSERT INTO `fw_code` VALUES ('4325248', '3408', '2013', '6017', '1081', '7258');
INSERT INTO `fw_code` VALUES ('4325249', '3408', '2014', '0249', '9439', '7776');
INSERT INTO `fw_code` VALUES ('4325250', '3408', '2015', '2065', '7919', '2427');
INSERT INTO `fw_code` VALUES ('4325251', '3408', '2016', '5830', '0332', '9070');
INSERT INTO `fw_code` VALUES ('4325252', '3408', '2017', '8474', '1966', '2963');
INSERT INTO `fw_code` VALUES ('4325253', '3408', '2018', '1958', '9185', '3918');
INSERT INTO `fw_code` VALUES ('4325254', '3408', '2019', '4481', '7796', '8293');
INSERT INTO `fw_code` VALUES ('4325255', '3408', '2020', '9842', '8834', '4444');
INSERT INTO `fw_code` VALUES ('4325256', '3408', '2021', '8347', '6557', '5319');
INSERT INTO `fw_code` VALUES ('4325257', '3408', '2022', '6103', '3140', '6632');
INSERT INTO `fw_code` VALUES ('4325258', '3408', '2023', '1978', '3517', '4623');
INSERT INTO `fw_code` VALUES ('4325259', '3408', '2024', '3367', '7060', '5239');
INSERT INTO `fw_code` VALUES ('4325260', '3408', '2025', '7278', '9215', '0230');
INSERT INTO `fw_code` VALUES ('4325261', '3408', '2026', '5743', '5930', '1266');
INSERT INTO `fw_code` VALUES ('4325262', '3408', '2027', '7385', '7949', '8739');
INSERT INTO `fw_code` VALUES ('4325263', '3408', '2028', '4715', '9596', '6015');
INSERT INTO `fw_code` VALUES ('4325264', '3408', '2029', '4781', '7323', '4685');
INSERT INTO `fw_code` VALUES ('4325265', '3408', '2030', '9547', '9350', '7748');
INSERT INTO `fw_code` VALUES ('4325266', '3408', '2031', '4140', '4918', '3632');
INSERT INTO `fw_code` VALUES ('4325267', '3408', '2032', '6851', '4279', '6194');
INSERT INTO `fw_code` VALUES ('4325268', '3408', '2033', '1404', '8838', '2239');
INSERT INTO `fw_code` VALUES ('4325269', '3408', '2034', '9308', '5164', '1899');
INSERT INTO `fw_code` VALUES ('4325270', '3408', '2035', '7492', '6684', '7248');
INSERT INTO `fw_code` VALUES ('4325271', '3408', '2036', '1831', '3775', '6274');
INSERT INTO `fw_code` VALUES ('4325272', '3408', '2037', '2645', '2640', '4507');
INSERT INTO `fw_code` VALUES ('4325273', '3408', '2038', '2538', '3906', '5998');
INSERT INTO `fw_code` VALUES ('4325274', '3408', '2039', '9521', '2632', '8917');
INSERT INTO `fw_code` VALUES ('4325275', '3408', '2040', '3499', '2513', '2578');
INSERT INTO `fw_code` VALUES ('4325276', '3408', '2041', '9441', '0616', '9239');
INSERT INTO `fw_code` VALUES ('4325277', '3408', '2042', '1017', '4910', '8042');
INSERT INTO `fw_code` VALUES ('4325278', '3408', '2043', '8693', '9477', '9676');
INSERT INTO `fw_code` VALUES ('4325279', '3408', '2044', '4354', '2386', '0650');
INSERT INTO `fw_code` VALUES ('4325280', '3408', '2045', '1083', '2636', '6712');
INSERT INTO `fw_code` VALUES ('4325281', '3408', '2046', '0803', '7441', '1024');
INSERT INTO `fw_code` VALUES ('4325282', '3408', '2047', '8199', '6815', '6971');
INSERT INTO `fw_code` VALUES ('4325283', '3408', '2048', '6637', '6811', '9176');
INSERT INTO `fw_code` VALUES ('4325284', '3408', '2049', '5208', '2259', '8721');
INSERT INTO `fw_code` VALUES ('4325285', '3408', '2050', '5356', '2001', '7069');
INSERT INTO `fw_code` VALUES ('4325286', '3408', '2051', '4822', '8330', '4524');
INSERT INTO `fw_code` VALUES ('4325287', '3408', '2052', '1897', '1501', '4944');
INSERT INTO `fw_code` VALUES ('4325288', '3408', '2053', '5249', '3267', '8560');
INSERT INTO `fw_code` VALUES ('4325289', '3408', '2054', '7706', '4152', '4265');
INSERT INTO `fw_code` VALUES ('4325290', '3408', '2055', '8840', '9219', '8024');
INSERT INTO `fw_code` VALUES ('4325291', '3408', '2056', '1885', '6728', '8691');
INSERT INTO `fw_code` VALUES ('4325292', '3408', '2057', '4021', '1411', '8870');
INSERT INTO `fw_code` VALUES ('4325293', '3408', '2058', '9469', '6851', '2825');
INSERT INTO `fw_code` VALUES ('4325294', '3408', '2059', '9108', '9641', '7459');
INSERT INTO `fw_code` VALUES ('4325295', '3408', '2060', '5410', '4955', '9486');
INSERT INTO `fw_code` VALUES ('4325296', '3408', '2061', '9321', '7109', '4477');
INSERT INTO `fw_code` VALUES ('4325297', '3408', '2062', '9642', '3312', '0004');
INSERT INTO `fw_code` VALUES ('4325298', '3408', '2063', '5837', '9891', '3522');
INSERT INTO `fw_code` VALUES ('4325299', '3408', '2064', '5130', '9760', '3798');
INSERT INTO `fw_code` VALUES ('4325300', '3408', '2065', '3380', '9006', '7816');
INSERT INTO `fw_code` VALUES ('4325301', '3408', '2066', '9428', '5843', '2986');
INSERT INTO `fw_code` VALUES ('4325302', '3408', '2067', '4102', '3426', '8548');
INSERT INTO `fw_code` VALUES ('4325303', '3408', '2068', '8935', '3181', '0281');
INSERT INTO `fw_code` VALUES ('4325304', '3408', '2069', '3528', '8748', '6164');
INSERT INTO `fw_code` VALUES ('4325305', '3408', '2070', '8894', '2173', '0441');
INSERT INTO `fw_code` VALUES ('4325306', '3408', '2071', '1178', '6597', '8968');
INSERT INTO `fw_code` VALUES ('4325307', '3408', '2072', '7653', '8371', '8173');
INSERT INTO `fw_code` VALUES ('4325308', '3408', '2073', '1539', '3807', '4334');
INSERT INTO `fw_code` VALUES ('4325309', '3408', '2074', '1351', '3058', '6147');
INSERT INTO `fw_code` VALUES ('4325310', '3408', '2075', '9535', '4578', '1495');
INSERT INTO `fw_code` VALUES ('4325311', '3408', '2076', '0003', '0522', '5370');
INSERT INTO `fw_code` VALUES ('4325312', '3408', '2077', '8975', '4188', '0120');
INSERT INTO `fw_code` VALUES ('4325313', '3408', '2078', '1565', '0526', '3165');
INSERT INTO `fw_code` VALUES ('4325314', '3408', '2079', '2887', '6343', '5111');
INSERT INTO `fw_code` VALUES ('4325315', '3408', '2080', '3060', '2804', '2290');
INSERT INTO `fw_code` VALUES ('4325316', '3408', '2081', '9255', '9383', '5807');
INSERT INTO `fw_code` VALUES ('4325317', '3408', '2082', '4876', '1284', '6941');
INSERT INTO `fw_code` VALUES ('4325318', '3408', '2083', '3741', '6216', '3182');
INSERT INTO `fw_code` VALUES ('4325319', '3408', '2084', '2846', '5336', '5272');
INSERT INTO `fw_code` VALUES ('4325320', '3408', '2085', '6946', '8240', '8450');
INSERT INTO `fw_code` VALUES ('4325321', '3408', '2086', '4596', '6089', '1254');
INSERT INTO `fw_code` VALUES ('4325322', '3408', '2087', '4743', '5831', '9602');
INSERT INTO `fw_code` VALUES ('4325323', '3408', '2088', '1285', '5331', '7477');
INSERT INTO `fw_code` VALUES ('4325324', '3408', '2089', '4769', '2550', '8432');
INSERT INTO `fw_code` VALUES ('4325325', '3408', '2090', '4636', '7097', '1093');
INSERT INTO `fw_code` VALUES ('4325326', '3408', '2091', '9749', '2046', '8513');
INSERT INTO `fw_code` VALUES ('4325327', '3408', '2092', '5450', '5962', '9325');
INSERT INTO `fw_code` VALUES ('4325328', '3408', '2093', '1671', '9260', '1674');
INSERT INTO `fw_code` VALUES ('4325329', '3408', '2094', '8227', '3050', '0557');
INSERT INTO `fw_code` VALUES ('4325330', '3408', '2095', '7226', '3435', '4138');
INSERT INTO `fw_code` VALUES ('4325331', '3408', '2096', '0857', '0395', '3441');
INSERT INTO `fw_code` VALUES ('4325332', '3408', '2097', '6305', '5835', '7397');
INSERT INTO `fw_code` VALUES ('4325333', '3408', '2098', '5944', '8625', '2031');
INSERT INTO `fw_code` VALUES ('4325334', '3408', '2099', '0348', '9766', '3050');
INSERT INTO `fw_code` VALUES ('4325335', '3408', '2100', '7144', '7742', '7782');
INSERT INTO `fw_code` VALUES ('4325336', '3408', '2101', '2337', '4706', '4880');
INSERT INTO `fw_code` VALUES ('4325337', '3408', '2102', '5394', '6988', '1800');
INSERT INTO `fw_code` VALUES ('4325338', '3408', '2103', '6182', '9135', '1202');
INSERT INTO `fw_code` VALUES ('4325339', '3408', '2104', '0949', '1163', '4264');
INSERT INTO `fw_code` VALUES ('4325340', '3408', '2105', '0908', '0155', '4425');
INSERT INTO `fw_code` VALUES ('4325341', '3408', '2106', '3192', '4579', '2952');
INSERT INTO `fw_code` VALUES ('4325342', '3408', '2107', '3365', '1040', '0130');
INSERT INTO `fw_code` VALUES ('4325343', '3408', '2108', '1549', '2560', '5479');
INSERT INTO `fw_code` VALUES ('4325344', '3408', '2109', '2017', '8504', '9354');
INSERT INTO `fw_code` VALUES ('4325345', '3408', '2110', '4046', '4452', '1023');
INSERT INTO `fw_code` VALUES ('4325346', '3408', '2111', '9494', '9893', '4979');
INSERT INTO `fw_code` VALUES ('4325347', '3408', '2112', '5781', '0917', '5997');
INSERT INTO `fw_code` VALUES ('4325348', '3408', '2113', '8212', '5083', '2871');
INSERT INTO `fw_code` VALUES ('4325349', '3408', '2114', '0842', '2429', '5755');
INSERT INTO `fw_code` VALUES ('4325350', '3408', '2115', '0094', '1290', '6193');
INSERT INTO `fw_code` VALUES ('4325351', '3408', '2116', '1269', '7365', '9791');
INSERT INTO `fw_code` VALUES ('4325352', '3408', '2117', '6890', '9266', '0925');
INSERT INTO `fw_code` VALUES ('4325353', '3408', '2118', '5755', '4198', '7166');
INSERT INTO `fw_code` VALUES ('4325354', '3408', '2119', '5140', '8512', '4943');
INSERT INTO `fw_code` VALUES ('4325355', '3408', '2120', '4860', '3317', '9255');
INSERT INTO `fw_code` VALUES ('4325356', '3408', '2121', '9600', '8627', '3487');
INSERT INTO `fw_code` VALUES ('4325357', '3408', '2122', '7998', '7615', '5854');
INSERT INTO `fw_code` VALUES ('4325358', '3408', '2123', '6610', '4071', '5237');
INSERT INTO `fw_code` VALUES ('4325359', '3408', '2124', '9413', '7877', '5300');
INSERT INTO `fw_code` VALUES ('4325360', '3408', '2125', '8879', '4206', '2756');
INSERT INTO `fw_code` VALUES ('4325361', '3408', '2126', '6783', '0532', '2416');
INSERT INTO `fw_code` VALUES ('4325362', '3408', '2127', '8639', '0020', '6907');
INSERT INTO `fw_code` VALUES ('4325363', '3408', '2128', '7464', '3944', '3309');
INSERT INTO `fw_code` VALUES ('4325364', '3408', '2129', '3685', '7242', '5657');
INSERT INTO `fw_code` VALUES ('4325365', '3408', '2130', '0241', '1032', '4541');
INSERT INTO `fw_code` VALUES ('4325366', '3408', '2131', '0735', '3694', '7246');
INSERT INTO `fw_code` VALUES ('4325367', '3408', '2132', '3965', '2437', '1345');
INSERT INTO `fw_code` VALUES ('4325368', '3408', '2133', '9239', '1417', '8121');
INSERT INTO `fw_code` VALUES ('4325369', '3408', '2134', '2871', '8377', '7425');
INSERT INTO `fw_code` VALUES ('4325370', '3408', '2135', '4260', '1921', '8041');
INSERT INTO `fw_code` VALUES ('4325371', '3408', '2136', '8492', '0278', '8559');
INSERT INTO `fw_code` VALUES ('4325372', '3408', '2137', '9840', '2814', '9336');
INSERT INTO `fw_code` VALUES ('4325373', '3408', '2138', '6636', '0790', '4068');
INSERT INTO `fw_code` VALUES ('4325374', '3408', '2139', '2230', '5972', '6371');
INSERT INTO `fw_code` VALUES ('4325375', '3408', '2140', '8278', '2810', '1541');
INSERT INTO `fw_code` VALUES ('4325376', '3408', '2141', '5608', '4456', '8818');
INSERT INTO `fw_code` VALUES ('4325377', '3408', '2142', '8167', '7205', '4922');
INSERT INTO `fw_code` VALUES ('4325378', '3408', '2143', '0878', '6566', '7484');
INSERT INTO `fw_code` VALUES ('4325379', '3408', '2144', '5217', '3657', '6511');
INSERT INTO `fw_code` VALUES ('4325380', '3408', '2145', '8808', '9609', '5975');
INSERT INTO `fw_code` VALUES ('4325381', '3408', '2146', '2973', '0240', '7824');
INSERT INTO `fw_code` VALUES ('4325382', '3408', '2147', '5110', '4923', '8002');
INSERT INTO `fw_code` VALUES ('4325383', '3408', '2148', '0196', '3153', '6591');
INSERT INTO `fw_code` VALUES ('4325384', '3408', '2149', '0170', '6435', '7761');
INSERT INTO `fw_code` VALUES ('4325385', '3408', '2150', '0410', '0621', '3609');
INSERT INTO `fw_code` VALUES ('4325386', '3408', '2151', '7846', '1002', '9395');
INSERT INTO `fw_code` VALUES ('4325387', '3408', '2152', '0944', '4292', '6154');
INSERT INTO `fw_code` VALUES ('4325388', '3408', '2153', '0624', '8090', '0627');
INSERT INTO `fw_code` VALUES ('4325389', '3408', '2154', '9449', '2014', '7029');
INSERT INTO `fw_code` VALUES ('4325390', '3408', '2155', '3014', '1248', '7663');
INSERT INTO `fw_code` VALUES ('4325391', '3408', '2156', '0064', '7700', '9252');
INSERT INTO `fw_code` VALUES ('4325392', '3408', '2157', '3294', '6443', '3350');
INSERT INTO `fw_code` VALUES ('4325393', '3408', '2158', '0303', '1887', '5100');
INSERT INTO `fw_code` VALUES ('4325394', '3408', '2159', '3588', '5927', '0046');
INSERT INTO `fw_code` VALUES ('4325395', '3408', '2160', '6671', '4927', '5797');
INSERT INTO `fw_code` VALUES ('4325396', '3408', '2161', '1158', '1760', '3172');
INSERT INTO `fw_code` VALUES ('4325397', '3408', '2162', '7607', '6816', '3547');
INSERT INTO `fw_code` VALUES ('4325398', '3408', '2163', '9769', '8217', '2556');
INSERT INTO `fw_code` VALUES ('4325399', '3408', '2164', '2012', '1633', '1243');
INSERT INTO `fw_code` VALUES ('4325400', '3408', '2165', '8487', '3407', '0449');
INSERT INTO `fw_code` VALUES ('4325401', '3408', '2166', '2373', '8843', '6609');
INSERT INTO `fw_code` VALUES ('4325402', '3408', '2167', '2867', '1506', '9315');
INSERT INTO `fw_code` VALUES ('4325403', '3408', '2168', '8899', '0377', '6798');
INSERT INTO `fw_code` VALUES ('4325404', '3408', '2169', '4840', '8480', '3459');
INSERT INTO `fw_code` VALUES ('4325405', '3408', '2170', '2424', '8603', '7593');
INSERT INTO `fw_code` VALUES ('4325406', '3408', '2171', '4092', '7342', '3897');
INSERT INTO `fw_code` VALUES ('4325407', '3408', '2172', '8232', '1254', '6914');
INSERT INTO `fw_code` VALUES ('4325408', '3408', '2173', '6203', '5305', '5245');
INSERT INTO `fw_code` VALUES ('4325409', '3408', '2174', '3599', '4679', '1191');
INSERT INTO `fw_code` VALUES ('4325410', '3408', '2175', '2958', '2274', '0138');
INSERT INTO `fw_code` VALUES ('4325411', '3408', '2176', '1997', '3667', '3557');
INSERT INTO `fw_code` VALUES ('4325412', '3408', '2177', '0608', '0123', '2941');
INSERT INTO `fw_code` VALUES ('4325413', '3408', '2178', '0221', '6194', '8745');
INSERT INTO `fw_code` VALUES ('4325414', '3408', '2179', '7297', '9365', '9165');
INSERT INTO `fw_code` VALUES ('4325415', '3408', '2180', '2637', '6072', '4611');
INSERT INTO `fw_code` VALUES ('4325416', '3408', '2181', '5028', '9230', '1646');
INSERT INTO `fw_code` VALUES ('4325417', '3408', '2182', '5308', '4425', '7334');
INSERT INTO `fw_code` VALUES ('4325418', '3408', '2183', '3238', '7469', '5825');
INSERT INTO `fw_code` VALUES ('4325419', '3408', '2184', '8339', '9988', '5423');
INSERT INTO `fw_code` VALUES ('4325420', '3408', '2185', '8258', '7972', '5745');
INSERT INTO `fw_code` VALUES ('4325421', '3408', '2186', '2170', '0127', '0736');
INSERT INTO `fw_code` VALUES ('4325422', '3408', '2187', '7978', '2778', '0057');
INSERT INTO `fw_code` VALUES ('4325423', '3408', '2188', '6229', '2024', '4075');
INSERT INTO `fw_code` VALUES ('4325424', '3408', '2189', '7017', '4171', '3477');
INSERT INTO `fw_code` VALUES ('4325425', '3408', '2190', '1783', '6199', '6539');
INSERT INTO `fw_code` VALUES ('4325426', '3408', '2191', '6376', '1766', '2423');
INSERT INTO `fw_code` VALUES ('4325427', '3408', '2192', '4026', '9615', '5227');
INSERT INTO `fw_code` VALUES ('4325428', '3408', '2193', '3639', '5686', '1030');
INSERT INTO `fw_code` VALUES ('4325429', '3408', '2194', '2383', '7595', '7754');
INSERT INTO `fw_code` VALUES ('4325430', '3408', '2195', '2851', '3540', '1629');
INSERT INTO `fw_code` VALUES ('4325431', '3408', '2196', '4774', '0754', '4789');
INSERT INTO `fw_code` VALUES ('4325432', '3408', '2197', '7658', '6575', '4530');
INSERT INTO `fw_code` VALUES ('4325433', '3408', '2198', '0328', '4929', '7254');
INSERT INTO `fw_code` VALUES ('4325434', '3408', '2199', '4413', '3544', '9423');
INSERT INTO `fw_code` VALUES ('4325435', '3408', '2200', '2103', '2401', '2066');
INSERT INTO `fw_code` VALUES ('4325436', '3408', '2201', '7724', '4302', '3200');
INSERT INTO `fw_code` VALUES ('4325437', '3408', '2202', '1384', '7497', '6090');
INSERT INTO `fw_code` VALUES ('4325438', '3408', '2203', '6684', '3195', '1697');
INSERT INTO `fw_code` VALUES ('4325439', '3408', '2204', '0168', '0414', '2653');
INSERT INTO `fw_code` VALUES ('4325440', '3408', '2205', '5148', '9910', '2733');
INSERT INTO `fw_code` VALUES ('4325441', '3408', '2206', '7071', '7124', '5894');
INSERT INTO `fw_code` VALUES ('4325442', '3408', '2207', '4695', '8255', '9867');
INSERT INTO `fw_code` VALUES ('4325443', '3408', '2208', '0382', '7882', '9671');
INSERT INTO `fw_code` VALUES ('4325444', '3408', '2209', '1704', '3699', '1617');
INSERT INTO `fw_code` VALUES ('4325445', '3408', '2210', '1557', '3957', '3269');
INSERT INTO `fw_code` VALUES ('4325446', '3408', '2211', '2559', '3572', '9688');
INSERT INTO `fw_code` VALUES ('4325447', '3408', '2212', '5616', '5854', '6608');
INSERT INTO `fw_code` VALUES ('4325448', '3408', '2213', '8993', '4338', '9055');
INSERT INTO `fw_code` VALUES ('4325449', '3408', '2214', '1170', '0029', '9072');
INSERT INTO `fw_code` VALUES ('4325450', '3408', '2215', '1130', '9021', '9233');
INSERT INTO `fw_code` VALUES ('4325451', '3408', '2216', '3413', '3445', '7760');
INSERT INTO `fw_code` VALUES ('4325452', '3408', '2217', '5682', '3581', '5278');
INSERT INTO `fw_code` VALUES ('4325453', '3408', '2218', '6430', '4719', '4840');
INSERT INTO `fw_code` VALUES ('4325454', '3408', '2219', '6110', '8517', '9313');
INSERT INTO `fw_code` VALUES ('4325455', '3408', '2220', '4268', '3318', '5831');
INSERT INTO `fw_code` VALUES ('4325456', '3408', '2221', '1211', '1037', '8911');
INSERT INTO `fw_code` VALUES ('4325457', '3408', '2222', '8113', '7747', '2152');
INSERT INTO `fw_code` VALUES ('4325458', '3408', '2223', '3800', '7374', '1956');
INSERT INTO `fw_code` VALUES ('4325459', '3408', '2224', '6003', '9783', '0805');
INSERT INTO `fw_code` VALUES ('4325460', '3408', '2225', '5122', '3191', '3903');
INSERT INTO `fw_code` VALUES ('4325461', '3408', '2226', '8434', '3949', '7679');
INSERT INTO `fw_code` VALUES ('4325462', '3408', '2227', '6241', '0293', '9976');
INSERT INTO `fw_code` VALUES ('4325463', '3408', '2228', '3825', '0416', '4110');
INSERT INTO `fw_code` VALUES ('4325464', '3408', '2229', '0473', '8650', '0494');
INSERT INTO `fw_code` VALUES ('4325465', '3408', '2230', '5493', '9154', '0413');
INSERT INTO `fw_code` VALUES ('4325466', '3408', '2231', '2289', '7130', '5145');
INSERT INTO `fw_code` VALUES ('4325467', '3408', '2232', '1155', '2062', '1386');
INSERT INTO `fw_code` VALUES ('4325468', '3408', '2233', '0260', '1182', '3476');
INSERT INTO `fw_code` VALUES ('4325469', '3408', '2234', '5000', '6491', '7708');
INSERT INTO `fw_code` VALUES ('4325470', '3408', '2235', '6094', '0551', '1628');
INSERT INTO `fw_code` VALUES ('4325471', '3408', '2236', '4359', '4086', '6654');
INSERT INTO `fw_code` VALUES ('4325472', '3408', '2237', '3398', '5479', '0074');
INSERT INTO `fw_code` VALUES ('4325473', '3408', '2238', '2009', '1935', '9458');
INSERT INTO `fw_code` VALUES ('4325474', '3408', '2239', '4812', '5741', '9520');
INSERT INTO `fw_code` VALUES ('4325475', '3408', '2240', '4278', '2071', '6976');
INSERT INTO `fw_code` VALUES ('4325476', '3408', '2241', '8698', '1177', '5681');
INSERT INTO `fw_code` VALUES ('4325477', '3408', '2242', '2182', '8396', '6636');
INSERT INTO `fw_code` VALUES ('4325478', '3408', '2243', '4039', '7884', '1127');
INSERT INTO `fw_code` VALUES ('4325479', '3408', '2244', '4705', '7007', '1012');
INSERT INTO `fw_code` VALUES ('4325480', '3408', '2245', '2864', '1808', '7529');
INSERT INTO `fw_code` VALUES ('4325481', '3408', '2246', '9085', '5106', '9878');
INSERT INTO `fw_code` VALUES ('4325482', '3408', '2247', '5641', '8896', '8761');
INSERT INTO `fw_code` VALUES ('4325483', '3408', '2248', '9365', '0301', '5565');
INSERT INTO `fw_code` VALUES ('4325484', '3408', '2249', '4639', '9281', '2342');
INSERT INTO `fw_code` VALUES ('4325485', '3408', '2250', '2396', '5864', '3654');
INSERT INTO `fw_code` VALUES ('4325486', '3408', '2251', '8271', '6241', '1645');
INSERT INTO `fw_code` VALUES ('4325487', '3408', '2252', '3357', '4471', '0235');
INSERT INTO `fw_code` VALUES ('4325488', '3408', '2253', '9659', '9785', '2261');
INSERT INTO `fw_code` VALUES ('4325489', '3408', '2254', '3891', '8142', '2779');
INSERT INTO `fw_code` VALUES ('4325490', '3408', '2255', '5239', '0678', '3556');
INSERT INTO `fw_code` VALUES ('4325491', '3408', '2256', '0086', '4721', '6297');
INSERT INTO `fw_code` VALUES ('4325492', '3408', '2257', '4573', '1554', '3672');
INSERT INTO `fw_code` VALUES ('4325493', '3408', '2258', '7630', '3836', '0592');
INSERT INTO `fw_code` VALUES ('4325494', '3408', '2259', '3678', '0674', '5761');
INSERT INTO `fw_code` VALUES ('4325495', '3408', '2260', '1007', '2320', '3038');
INSERT INTO `fw_code` VALUES ('4325496', '3408', '2261', '5677', '3033', '0490');
INSERT INTO `fw_code` VALUES ('4325497', '3408', '2262', '2925', '2664', '8089');
INSERT INTO `fw_code` VALUES ('4325498', '3408', '2263', '4395', '8223', '8383');
INSERT INTO `fw_code` VALUES ('4325499', '3408', '2264', '0936', '7723', '6258');
INSERT INTO `fw_code` VALUES ('4325500', '3408', '2265', '6277', '4430', '1704');
INSERT INTO `fw_code` VALUES ('4325501', '3408', '2266', '0616', '1521', '0731');
INSERT INTO `fw_code` VALUES ('4325502', '3408', '2267', '6745', '0374', '5579');
INSERT INTO `fw_code` VALUES ('4325503', '3408', '2268', '8774', '6322', '7249');
INSERT INTO `fw_code` VALUES ('4325504', '3408', '2269', '8667', '7588', '8740');
INSERT INTO `fw_code` VALUES ('4325505', '3408', '2270', '8373', '8104', '2044');
INSERT INTO `fw_code` VALUES ('4325506', '3408', '2271', '8307', '0378', '3374');
INSERT INTO `fw_code` VALUES ('4325507', '3408', '2272', '2285', '0259', '7035');
INSERT INTO `fw_code` VALUES ('4325508', '3408', '2273', '5570', '4299', '1981');
INSERT INTO `fw_code` VALUES ('4325509', '3408', '2274', '5809', '8485', '7830');
INSERT INTO `fw_code` VALUES ('4325510', '3408', '2275', '9802', '2656', '2499');
INSERT INTO `fw_code` VALUES ('4325511', '3408', '2276', '5997', '9235', '6017');
INSERT INTO `fw_code` VALUES ('4325512', '3408', '2277', '7177', '5353', '9311');
INSERT INTO `fw_code` VALUES ('4325513', '3408', '2278', '0916', '1048', '7123');
INSERT INTO `fw_code` VALUES ('4325514', '3408', '2279', '9354', '1044', '9328');
INSERT INTO `fw_code` VALUES ('4325515', '3408', '2280', '0275', '8643', '6070');
INSERT INTO `fw_code` VALUES ('4325516', '3408', '2281', '9314', '0036', '9489');
INSERT INTO `fw_code` VALUES ('4325517', '3408', '2282', '7925', '6492', '8873');
INSERT INTO `fw_code` VALUES ('4325518', '3408', '2283', '5442', '8889', '4337');
INSERT INTO `fw_code` VALUES ('4325519', '3408', '2284', '9954', '2441', '0543');
INSERT INTO `fw_code` VALUES ('4325520', '3408', '2285', '0422', '8385', '4418');
INSERT INTO `fw_code` VALUES ('4325521', '3408', '2286', '8780', '6365', '6945');
INSERT INTO `fw_code` VALUES ('4325522', '3408', '2287', '2625', '0794', '3266');
INSERT INTO `fw_code` VALUES ('4325523', '3408', '2288', '3106', '8684', '9719');
INSERT INTO `fw_code` VALUES ('4325524', '3408', '2289', '0863', '5267', '1031');
INSERT INTO `fw_code` VALUES ('4325525', '3408', '2290', '6738', '5644', '9022');
INSERT INTO `fw_code` VALUES ('4325526', '3408', '2291', '1824', '3874', '7611');
INSERT INTO `fw_code` VALUES ('4325527', '3408', '2292', '8126', '9188', '9638');
INSERT INTO `fw_code` VALUES ('4325528', '3408', '2293', '3707', '0081', '0933');
INSERT INTO `fw_code` VALUES ('4325529', '3408', '2294', '1209', '8188', '5389');
INSERT INTO `fw_code` VALUES ('4325530', '3408', '2295', '0502', '8057', '5665');
INSERT INTO `fw_code` VALUES ('4325531', '3408', '2296', '5696', '5021', '2763');
INSERT INTO `fw_code` VALUES ('4325532', '3408', '2297', '6097', '3239', '7969');
INSERT INTO `fw_code` VALUES ('4325533', '3408', '2298', '2145', '0077', '3138');
INSERT INTO `fw_code` VALUES ('4325534', '3408', '2299', '9475', '1723', '0415');
INSERT INTO `fw_code` VALUES ('4325535', '3408', '2300', '9541', '9450', '9085');
INSERT INTO `fw_code` VALUES ('4325536', '3408', '2301', '6829', '6412', '9845');
INSERT INTO `fw_code` VALUES ('4325537', '3408', '2302', '1422', '1979', '5729');
INSERT INTO `fw_code` VALUES ('4325538', '3408', '2303', '4133', '1340', '8291');
INSERT INTO `fw_code` VALUES ('4325539', '3408', '2304', '8685', '5900', '4336');
INSERT INTO `fw_code` VALUES ('4325540', '3408', '2305', '9820', '0967', '8095');
INSERT INTO `fw_code` VALUES ('4325541', '3408', '2306', '3772', '4130', '2925');
INSERT INTO `fw_code` VALUES ('4325542', '3408', '2307', '5374', '5142', '0559');
INSERT INTO `fw_code` VALUES ('4325543', '3408', '2308', '9006', '2102', '9863');
INSERT INTO `fw_code` VALUES ('4325544', '3408', '2309', '6722', '7678', '1336');
INSERT INTO `fw_code` VALUES ('4325545', '3408', '2310', '7149', '2614', '5372');
INSERT INTO `fw_code` VALUES ('4325546', '3408', '2311', '0114', '0451', '4791');
INSERT INTO `fw_code` VALUES ('4325547', '3408', '2312', '1636', '9447', '2747');
INSERT INTO `fw_code` VALUES ('4325548', '3408', '2313', '8365', '9697', '8809');
INSERT INTO `fw_code` VALUES ('4325549', '3408', '2314', '8085', '4503', '3122');
INSERT INTO `fw_code` VALUES ('4325550', '3408', '2315', '1742', '8182', '1256');
INSERT INTO `fw_code` VALUES ('4325551', '3408', '2316', '7786', '8148', '8315');

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
) ENGINE=InnoDB AUTO_INCREMENT=1963 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of fw_cust
-- ----------------------------
INSERT INTO `fw_cust` VALUES ('1962', '3408', '安吉思燕窝angels', '', '', '', '', '', '', '0', '12', '2316', '800000万', '2018-11-20 00:00:00', '', '0', '', '', 'N', 'N', '', '', '0', 'N', 'N', '0.00', '', '', '', '', null, 'N', '', '4-双码流水号2', null, '0', 'N', '', '', '');

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
INSERT INTO `fw_dealer` VALUES ('1', '3408', null, 'test', '66730c784751efc66db25382bd59bbbb', 'N0001', '钟琪', null, null, '9', '0', '0', '0', '1', null, null, null, null, '15875872790', null, '0', null, null, null, null, null, '0', '0', '0', '0', null, null, null, null, null, null, null, null, null, null, '1', null, null, null, '3408/1542267509_1_1919.jpg', null, null, '0', '0', '1542702972', '0.00', '0', '0', '0', '0.00', null, null);
INSERT INTO `fw_dealer` VALUES ('2', '3408', '', '15875872791', '587ccacd43c51cad35df059b107a9577', 'No:007700', '钟琪1', null, null, '10', '0', '1', '1', '2', '钟琪1', '15875872791', null, null, '15875872791', '', '0', '', '', '', '', null, '0', '11', '1111', '0', '北京市房山区', '北京市房山区', '440804199606160571', '', '', '', '', null, null, '', '1', '1542180469', '1573716469', '1542180462', null, '', '', '0', '0', '1542702648', '0.00', '0', '0', '0', '0.00', null, null);
INSERT INTO `fw_dealer` VALUES ('3', '3408', '', '15875872792', '1bde2478115e4e64b4f71e030dc33710', 'No:007701', '钟琪2', null, null, '9', '0', '0', '1', '1', '钟琪2', '15875872792', null, null, '15875872792', '', '0', '', '', '', '', null, '0', '11', '1129', '0', '北京市延庆县', '北京市延庆县', '440804199606160572', '', '', '', '', null, null, '', '1', '1542590318', '1574126318', '1542590308', '3408/1542590435_3_8558.jpg', '', '', '0', '0', '1542590431', '0.00', '0', '0', '0', '0.00', null, null);
INSERT INTO `fw_dealer` VALUES ('4', '3408', '', '15875872793', 'ad2a523b032e8cb63f6a217150d94385', 'No:007702', '钟琪3', null, null, '9', '0', '0', '3', '1', '钟琪3', '15875872793', null, null, '15875872793', '', '0', '', '', '', '', null, '0', '44', '4451', '445101', '广东省潮州市枫溪区', '广东省潮州市枫溪区', '440804199606160573', '', '', '', '', null, null, '', '1', '1542591186', '1574127186', '1542591176', null, '', '', '0', '0', '1542591215', '0.00', '0', '0', '0', '0.00', null, null);
INSERT INTO `fw_dealer` VALUES ('6', '3408', '', '15875872794', '8fa2bfbeed9dc739761683298301a3b4', 'No:007703', '钟琪4', null, null, '10', '0', '1', '2', '2', '钟琪4', '15875872794', null, null, '15875872794', '', '0', '', '', '', '', null, '0', '12', '1225', '0', '天津市蓟县', '天津市蓟县', '440804199606160574', '', '', '', '', null, null, '', '1', '1542592061', '1574128061', '1542592007', null, '', '', '0', '0', '1542702914', '0.00', '0', '0', '0', '0.00', null, null);
INSERT INTO `fw_dealer` VALUES ('7', '3408', '', '15875872795', '6299c582af7ba53fda8c1b769c6cb129', 'No:007704', '钟琪5', null, null, '10', '0', '1', '6', '2', '钟琪5', '15875872795', null, null, '15875872795', '', '0', '', '', '', '', null, '0', '11', '1129', '0', '北京市延庆县', '广东广州越秀区', '440804199606160575', '', '', '', '', null, null, '', '1', '1542596588', '1574132588', '1542596575', null, '', '', '0', '0', '1542596660', '0.00', '0', '0', '0', '0.00', null, null);
INSERT INTO `fw_dealer` VALUES ('8', '3408', '', '15875872796', '531440891208d2c680f05d04aa42a247', 'No:007705', '钟琪6', null, null, '9', '0', '0', '7', '1', '钟琪6', '15875872796', null, null, '15875872796', '', '0', '', '', '', '', null, '0', '12', '1225', '0', '天津市蓟县', '天津市蓟县', '440804199606160576', '', '', '', '', null, null, '', '1', '1542597171', '1574133171', '1542597162', null, '', '', '0', '0', '1542597226', '0.00', '0', '0', '0', '0.00', null, null);
INSERT INTO `fw_dealer` VALUES ('9', '3408', '', '15875872797', 'a9048d4e8ad193f03ad47e57772a7fcc', 'No:007706', '钟琪7', null, null, '11', '0', '8', '8', '3', '钟琪7', '15875872797', null, null, '15875872797', '', '0', '', '', '', '', null, '0', '11', '1129', '0', '北京市延庆县', '北京市延庆县', '440804199606160597', '', '', '', '', null, null, '', '1', '1542598636', '1574134636', '1542598630', null, '', '', '0', '0', '0', '0.00', '0', '0', '0', '0.00', null, null);
INSERT INTO `fw_dealer` VALUES ('10', '3408', '', '15875872798', 'd39becd200e9e636bd140220b176868f', 'No:007707', '钟琪8', null, null, '10', '0', '8', '9', '2', '钟琪8', '15875872798', null, null, '15875872798', '', '0', '', '', '', '', null, '0', '12', '1225', '0', '天津市蓟县', '天津市蓟县', '440804199606160578', '', '', '', '', null, null, '', '1', '1542598964', '1574134964', '1542598949', null, '', '', '0', '0', '1542598995', '0.00', '0', '0', '0', '0.00', null, null);
INSERT INTO `fw_dealer` VALUES ('11', '3408', '', '15875872799', '2523aa43222f38f037ea7a2ace4c3d75', 'No:007708', '钟琪9', null, null, '10', '0', '8', '9', '2', '钟琪9', '15875872799', null, null, '15875872799', '', '0', '', '', '', '', null, '0', '11', '1129', '0', '北京市延庆县', '北京市延庆县', '440804199606160579', '', '', '', '', null, null, '', '1', '1542599701', '1574135701', '1542599693', null, '', '', '0', '0', '1542599743', '0.00', '0', '0', '0', '0.00', null, null);

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
) ENGINE=InnoDB AUTO_INCREMENT=202 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='代理商操作日志表';

-- ----------------------------
-- Records of fw_dealerlogs
-- ----------------------------

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
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='经销商地址表';

-- ----------------------------
-- Records of fw_dladdress
-- ----------------------------
INSERT INTO `fw_dladdress` VALUES ('84', '3408', '1', '钟琪', '11', '1101', '0', '北京市东城区', '北京市东城区', '15875872790', '1', '0');
INSERT INTO `fw_dladdress` VALUES ('85', '3408', '2', '钟琪1', '11', '1101', '0', '北京市东城区', '北京市东城区', '15875872791', '1', '0');
INSERT INTO `fw_dladdress` VALUES ('86', '3408', '6', '钟琪4', '11', '1102', '0', '北京市西城区', '北京市', '15875872794', '1', '0');

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
INSERT INTO `fw_dltype` VALUES ('9', '3408', 'CEO', '1', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '300000.00', '0');
INSERT INTO `fw_dltype` VALUES ('10', '3408', '执行董事', '2', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '100000.00', '0');
INSERT INTO `fw_dltype` VALUES ('11', '3408', '销售总监', '3', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '300000.00', '0');
INSERT INTO `fw_dltype` VALUES ('12', '3408', '销售经理', '4', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '10000.00', '0');

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
INSERT INTO `fw_dltypefanli` VALUES ('31', '3408', '9', '9', '0.03', '0.01', '0.00');
INSERT INTO `fw_dltypefanli` VALUES ('32', '3408', '9', '10', '0.00', '0.00', '0.00');
INSERT INTO `fw_dltypefanli` VALUES ('33', '3408', '9', '11', '0.00', '0.00', '0.00');
INSERT INTO `fw_dltypefanli` VALUES ('34', '3408', '9', '12', '0.00', '0.00', '0.00');
INSERT INTO `fw_dltypefanli` VALUES ('35', '3408', '10', '9', '5000.00', '0.00', '0.00');
INSERT INTO `fw_dltypefanli` VALUES ('36', '3408', '10', '10', '0.02', '0.00', '0.00');
INSERT INTO `fw_dltypefanli` VALUES ('37', '3408', '10', '11', '0.00', '0.00', '0.00');
INSERT INTO `fw_dltypefanli` VALUES ('38', '3408', '10', '12', '0.00', '0.00', '0.00');
INSERT INTO `fw_dltypefanli` VALUES ('39', '3408', '11', '9', '5000.00', '0.00', '0.00');
INSERT INTO `fw_dltypefanli` VALUES ('40', '3408', '11', '10', '2000.00', '0.00', '0.00');
INSERT INTO `fw_dltypefanli` VALUES ('41', '3408', '11', '11', '0.00', '0.00', '0.00');
INSERT INTO `fw_dltypefanli` VALUES ('42', '3408', '11', '12', '0.00', '0.00', '0.00');
INSERT INTO `fw_dltypefanli` VALUES ('43', '3408', '12', '9', '5000.00', '0.00', '0.00');
INSERT INTO `fw_dltypefanli` VALUES ('44', '3408', '12', '10', '2000.00', '0.00', '0.00');
INSERT INTO `fw_dltypefanli` VALUES ('45', '3408', '12', '11', '0.00', '0.00', '0.00');
INSERT INTO `fw_dltypefanli` VALUES ('46', '3408', '12', '12', '0.00', '0.00', '0.00');

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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='返利明细';

-- ----------------------------
-- Records of fw_fanlidetail
-- ----------------------------
INSERT INTO `fw_fanlidetail` VALUES ('13', '3408', '2', '1', '1', '6000.00', '6', '0', '0', '', '0', '0', '0', '1', '1542703126', '邀请代理 钟琪4(15875872794) 成为 执行董事', '0', '0');

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
INSERT INTO `fw_jfmobasic` VALUES ('4', '3408', '', '安吉思燕窝', '', '400-168-1810', '', '', 'http://www.bomanvip.com', '', null, '', null, null, null, '安吉思燕窝', '联系方式：15068026064；\r\n邮箱：taihuimei2016@163.com;', null, null, null, null, null, null, null);

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
INSERT INTO `fw_jfmonews` VALUES ('22', '3408', '买家秀测试', '2', '3408/15421604392.jpg', '测试', '1542160439', '0');
INSERT INTO `fw_jfmonews` VALUES ('23', '3408', '企业动态测试', '1', '3408/15422462601.jpg', '测试内容', '1542160533', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='产品展示仅用于微站，无防窜';

-- ----------------------------
-- Records of fw_jfproduct
-- ----------------------------
INSERT INTO `fw_jfproduct` VALUES ('1', '3408', '0', '测试产品1', 'N0001', '3408/1542160304_1488.jpg', '100.00', '养身', '', '1', '1542160304');

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
) ENGINE=InnoDB AUTO_INCREMENT=2452 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of fw_log
-- ----------------------------
INSERT INTO `fw_log` VALUES ('2424', '1280', 'test', '3408', '企业登录', '1542698437', '127.0.0.1', '/Mp/Login/logining', '', '1');
INSERT INTO `fw_log` VALUES ('2425', '1', 'test', '3408', '经销商账号登录', '1542700261', '127.0.0.1', '/Angels/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2426', '1280', 'test', '3408', '添加产品类型', '1542700840', '127.0.0.1', '/Mp/Product/typeedit_save', '{\"protype_unitcode\":\"3408\",\"protype_name\":\"\\u71d5\\u76cf\",\"protype_iswho\":\"0\"}', '1');
INSERT INTO `fw_log` VALUES ('2427', '1280', 'test', '3408', '添加产品', '1542700894', '127.0.0.1', '/Mp/Product/edit_save', '{\"pro_name\":\"\\u6d4b\\u8bd5\\u4ea7\\u54c11\",\"pro_number\":\"0001\",\"pro_unitcode\":\"3408\",\"pro_typeid\":22,\"pro_jftype\":1,\"pro_jifen\":0,\"pro_jfmax\":0,\"pro_dljf\":0,\"pro_desc\":\"\\u6ecb\\u517b\",\"pro_link\":\"\",\"pro_barcode\":\"\",\"pro_remark\":\"\",\"pro_addtime\":1542700894,\"pro_active\":1,\"pro_price\":\"1000\",\"pro_stock\":0,\"pro_units\":\"\\u76d2\",\"pro_dbiao\":0,\"pro_zbiao\":0,\"pro_xbiao\":0,\"pro_pic\":\"3408\\/1542700894_3022.jpg\"}', '1');
INSERT INTO `fw_log` VALUES ('2428', '1280', 'test', '3408', '添加产品', '1542700920', '127.0.0.1', '/Mp/Product/edit_save', '{\"pro_name\":\"\\u6d4b\\u8bd5\\u4ea7\\u54c12\",\"pro_number\":\"0002\",\"pro_unitcode\":\"3408\",\"pro_typeid\":22,\"pro_jftype\":1,\"pro_jifen\":0,\"pro_jfmax\":0,\"pro_dljf\":0,\"pro_desc\":\"\\u6ecb\\u8865\",\"pro_link\":\"\",\"pro_barcode\":\"\",\"pro_remark\":\"\",\"pro_addtime\":1542700920,\"pro_active\":1,\"pro_price\":\"1000\",\"pro_stock\":0,\"pro_units\":\"\\u76d2\",\"pro_dbiao\":0,\"pro_zbiao\":0,\"pro_xbiao\":0,\"pro_pic\":\"3408\\/1542700920_3253.jpg\"}', '1');
INSERT INTO `fw_log` VALUES ('2429', '1280', 'test', '3408', '修改产品价格体系', '1542700973', '127.0.0.1', '/Mp/Product/propriceedit_save', '[{\"dlt_id\":\"9\",\"dlt_unitcode\":\"3408\",\"dlt_name\":\"CEO\",\"dlt_level\":\"1\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"300000.00\",\"dlt_minnum\":\"0\",\"priprice\":\"1000\",\"pro_id\":\"22\"},{\"dlt_id\":\"10\",\"dlt_unitcode\":\"3408\",\"dlt_name\":\"\\u6267\\u884c\\u8463\\u4e8b\",\"dlt_level\":\"2\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"100000.00\",\"dlt_minnum\":\"0\",\"priprice\":\"1000\",\"pro_id\":\"22\"},{\"dlt_id\":\"11\",\"dlt_unitcode\":\"3408\",\"dlt_name\":\"\\u9500\\u552e\\u603b\\u76d1\",\"dlt_level\":\"3\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"300000.00\",\"dlt_minnum\":\"0\",\"priprice\":\"1000\",\"pro_id\":\"22\"},{\"dlt_id\":\"12\",\"dlt_unitcode\":\"3408\",\"dlt_name\":\"\\u9500\\u552e\\u7ecf\\u7406\",\"dlt_level\":\"4\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"10000.00\",\"dlt_minnum\":\"0\",\"priprice\":\"1000\",\"pro_id\":\"22\"}]', '1');
INSERT INTO `fw_log` VALUES ('2430', '1280', 'test', '3408', '修改产品价格体系', '1542700988', '127.0.0.1', '/Mp/Product/propriceedit_save', '[{\"dlt_id\":\"9\",\"dlt_unitcode\":\"3408\",\"dlt_name\":\"CEO\",\"dlt_level\":\"1\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"300000.00\",\"dlt_minnum\":\"0\",\"priprice\":\"1000\",\"pro_id\":\"21\"},{\"dlt_id\":\"10\",\"dlt_unitcode\":\"3408\",\"dlt_name\":\"\\u6267\\u884c\\u8463\\u4e8b\",\"dlt_level\":\"2\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"100000.00\",\"dlt_minnum\":\"0\",\"priprice\":\"1000\",\"pro_id\":\"21\"},{\"dlt_id\":\"11\",\"dlt_unitcode\":\"3408\",\"dlt_name\":\"\\u9500\\u552e\\u603b\\u76d1\",\"dlt_level\":\"3\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"300000.00\",\"dlt_minnum\":\"0\",\"priprice\":\"1000\",\"pro_id\":\"21\"},{\"dlt_id\":\"12\",\"dlt_unitcode\":\"3408\",\"dlt_name\":\"\\u9500\\u552e\\u7ecf\\u7406\",\"dlt_level\":\"4\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"10000.00\",\"dlt_minnum\":\"0\",\"priprice\":\"1000\",\"pro_id\":\"21\"}]', '1');
INSERT INTO `fw_log` VALUES ('2431', '1280', 'test', '3408', '出货导入', '1542701246', '127.0.0.1', '/Mp/Orders/odshipscanres_save', '{\"ship_unitcode\":\"3408\",\"ship_number\":\"201811201606149230\",\"ship_deliver\":0,\"ship_dealer\":\"1\",\"ship_pro\":\"22\",\"ship_odid\":24,\"ship_odblid\":116,\"ship_whid\":8,\"ship_proqty\":1,\"ship_barcode\":\"10000001\",\"ship_date\":1542701246,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"1280\",\"ship_czuser\":\"test\"}', '1');
INSERT INTO `fw_log` VALUES ('2432', '1280', 'test', '3408', '修改产品', '1542702010', '127.0.0.1', '/Mp/Product/edit_save', '{\"pro_id\":22,\"pro_name\":\"\\u6d4b\\u8bd5\\u4ea7\\u54c12\",\"pro_number\":\"0002\",\"pro_typeid\":22,\"pro_jftype\":1,\"pro_jifen\":0,\"pro_jfmax\":0,\"pro_dljf\":0,\"pro_desc\":\"\\u6ecb\\u8865\",\"pro_link\":\"\",\"pro_barcode\":\"\",\"pro_remark\":\"\",\"pro_price\":\"300000\",\"pro_stock\":0,\"pro_units\":\"\\u76d2\",\"pro_dbiao\":0,\"pro_zbiao\":0,\"pro_xbiao\":0}', '1');
INSERT INTO `fw_log` VALUES ('2433', '1280', 'test', '3408', '修改产品', '1542702019', '127.0.0.1', '/Mp/Product/edit_save', '{\"pro_id\":21,\"pro_name\":\"\\u6d4b\\u8bd5\\u4ea7\\u54c11\",\"pro_number\":\"0001\",\"pro_typeid\":22,\"pro_jftype\":1,\"pro_jifen\":0,\"pro_jfmax\":0,\"pro_dljf\":0,\"pro_desc\":\"\\u6ecb\\u517b\",\"pro_link\":\"\",\"pro_barcode\":\"\",\"pro_remark\":\"\",\"pro_price\":\"300000\",\"pro_stock\":0,\"pro_units\":\"\\u76d2\",\"pro_dbiao\":0,\"pro_zbiao\":0,\"pro_xbiao\":0}', '1');
INSERT INTO `fw_log` VALUES ('2434', '1280', 'test', '3408', '修改产品价格体系', '1542702039', '127.0.0.1', '/Mp/Product/propriceedit_save', '[{\"dlt_id\":\"9\",\"dlt_unitcode\":\"3408\",\"dlt_name\":\"CEO\",\"dlt_level\":\"1\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"300000.00\",\"dlt_minnum\":\"0\",\"priprice\":\"300000\",\"pro_id\":\"22\"},{\"dlt_id\":\"10\",\"dlt_unitcode\":\"3408\",\"dlt_name\":\"\\u6267\\u884c\\u8463\\u4e8b\",\"dlt_level\":\"2\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"100000.00\",\"dlt_minnum\":\"0\",\"priprice\":\"300000\",\"pro_id\":\"22\"},{\"dlt_id\":\"11\",\"dlt_unitcode\":\"3408\",\"dlt_name\":\"\\u9500\\u552e\\u603b\\u76d1\",\"dlt_level\":\"3\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"300000.00\",\"dlt_minnum\":\"0\",\"priprice\":\"300000\",\"pro_id\":\"22\"},{\"dlt_id\":\"12\",\"dlt_unitcode\":\"3408\",\"dlt_name\":\"\\u9500\\u552e\\u7ecf\\u7406\",\"dlt_level\":\"4\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"10000.00\",\"dlt_minnum\":\"0\",\"priprice\":\"300000\",\"pro_id\":\"22\"}]', '1');
INSERT INTO `fw_log` VALUES ('2435', '1280', 'test', '3408', '修改产品价格体系', '1542702056', '127.0.0.1', '/Mp/Product/propriceedit_save', '[{\"dlt_id\":\"9\",\"dlt_unitcode\":\"3408\",\"dlt_name\":\"CEO\",\"dlt_level\":\"1\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"300000.00\",\"dlt_minnum\":\"0\",\"priprice\":\"300000\",\"pro_id\":\"21\"},{\"dlt_id\":\"10\",\"dlt_unitcode\":\"3408\",\"dlt_name\":\"\\u6267\\u884c\\u8463\\u4e8b\",\"dlt_level\":\"2\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"100000.00\",\"dlt_minnum\":\"0\",\"priprice\":\"300000\",\"pro_id\":\"21\"},{\"dlt_id\":\"11\",\"dlt_unitcode\":\"3408\",\"dlt_name\":\"\\u9500\\u552e\\u603b\\u76d1\",\"dlt_level\":\"3\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"300000.00\",\"dlt_minnum\":\"0\",\"priprice\":\"300000\",\"pro_id\":\"21\"},{\"dlt_id\":\"12\",\"dlt_unitcode\":\"3408\",\"dlt_name\":\"\\u9500\\u552e\\u7ecf\\u7406\",\"dlt_level\":\"4\",\"dlt_fanli1\":\"0.00\",\"dlt_fanli2\":\"0.00\",\"dlt_fanli3\":\"0.00\",\"dlt_fanli4\":\"0.00\",\"dlt_fanli5\":\"0.00\",\"dlt_fanli6\":\"0.00\",\"dlt_fanli7\":\"0.00\",\"dlt_fanli8\":\"0.00\",\"dlt_fanli9\":\"0.00\",\"dlt_fanli10\":\"0.00\",\"dlt_firstquota\":\"10000.00\",\"dlt_minnum\":\"0\",\"priprice\":\"300000\",\"pro_id\":\"21\"}]', '1');
INSERT INTO `fw_log` VALUES ('2436', '1280', 'test', '3408', '出货导入', '1542702294', '127.0.0.1', '/Mp/Orders/odshipscanres_save', '{\"ship_unitcode\":\"3408\",\"ship_number\":\"201811201622381573\",\"ship_deliver\":0,\"ship_dealer\":\"1\",\"ship_pro\":\"21\",\"ship_odid\":25,\"ship_odblid\":117,\"ship_whid\":8,\"ship_proqty\":1,\"ship_barcode\":\"10000001\",\"ship_date\":1542702293,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"1280\",\"ship_czuser\":\"test\"}', '1');
INSERT INTO `fw_log` VALUES ('2437', '2', '15875872791', '3408', '经销商账号登录', '1542702343', '127.0.0.1', '/Angels/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2438', '1', 'test', '3408', '经销商账号登录', '1542702466', '127.0.0.1', '/Angels/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2439', '1', 'test', '3408', '经销商出货', '1542702517', '127.0.0.1', '/Angels/Orders/odshipping/step/1/od_id/26/odbl_id/118/oddt_id/27', '{\"ship_unitcode\":\"3408\",\"ship_number\":\"201811201627292586\",\"ship_deliver\":\"1\",\"ship_dealer\":\"2\",\"ship_pro\":\"21\",\"ship_odid\":26,\"ship_odblid\":118,\"ship_whid\":null,\"ship_proqty\":\"1\",\"ship_barcode\":10000001,\"ship_date\":1542702517,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":2,\"ship_czid\":\"1\",\"ship_czuser\":\"test\"}', '2');
INSERT INTO `fw_log` VALUES ('2440', '1', 'test', '3408', '经销商账号登录', '1542702565', '127.0.0.1', '/Angels/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2441', '1280', 'test', '3408', '企业登录', '1542702603', '127.0.0.1', '/Mp/Login/logining', '', '1');
INSERT INTO `fw_log` VALUES ('2442', '1280', 'test', '3408', '出货导入', '1542702619', '127.0.0.1', '/Mp/Orders/odshipscanres_save', '{\"ship_unitcode\":\"3408\",\"ship_number\":\"201811201629405991\",\"ship_deliver\":0,\"ship_dealer\":\"1\",\"ship_pro\":\"22\",\"ship_odid\":27,\"ship_odblid\":119,\"ship_whid\":8,\"ship_proqty\":1,\"ship_barcode\":\"10000002\",\"ship_date\":1542702619,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"1280\",\"ship_czuser\":\"test\"}', '1');
INSERT INTO `fw_log` VALUES ('2443', '2', '15875872791', '3408', '经销商账号登录', '1542702648', '127.0.0.1', '/Angels/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2444', '1', 'test', '3408', '经销商账号登录', '1542702677', '127.0.0.1', '/Angels/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2445', '1', 'test', '3408', '经销商出货', '1542702692', '127.0.0.1', '/Angels/Orders/odshipping/step/1/od_id/26/odbl_id/118/oddt_id/26', '{\"ship_unitcode\":\"3408\",\"ship_number\":\"201811201627292586\",\"ship_deliver\":\"1\",\"ship_dealer\":\"2\",\"ship_pro\":\"22\",\"ship_odid\":26,\"ship_odblid\":118,\"ship_whid\":null,\"ship_proqty\":\"1\",\"ship_barcode\":10000002,\"ship_date\":1542702692,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":2,\"ship_czid\":\"1\",\"ship_czuser\":\"test\"}', '2');
INSERT INTO `fw_log` VALUES ('2446', '1280', 'test', '3408', '企业登录', '1542702813', '127.0.0.1', '/Mp/Login/logining', '', '1');
INSERT INTO `fw_log` VALUES ('2447', '6', '15875872794', '3408', '经销商账号登录', '1542702914', '127.0.0.1', '/Angels/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2448', '1', 'test', '3408', '经销商账号登录', '1542702972', '127.0.0.1', '/Angels/Dealer/login', '', '2');
INSERT INTO `fw_log` VALUES ('2449', '1280', 'test', '3408', '出货导入', '1542703014', '127.0.0.1', '/Mp/Orders/odshipscanres_save', '{\"ship_unitcode\":\"3408\",\"ship_number\":\"201811201636351224\",\"ship_deliver\":0,\"ship_dealer\":\"1\",\"ship_pro\":\"21\",\"ship_odid\":29,\"ship_odblid\":121,\"ship_whid\":8,\"ship_proqty\":1,\"ship_barcode\":\"10000003\",\"ship_date\":1542703014,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":0,\"ship_czid\":\"1280\",\"ship_czuser\":\"test\"}', '1');
INSERT INTO `fw_log` VALUES ('2450', '1', 'test', '3408', '经销商出货', '1542703099', '127.0.0.1', '/Angels/Orders/odshipping/step/1/od_id/28/odbl_id/120/oddt_id/29', '{\"ship_unitcode\":\"3408\",\"ship_number\":\"201811201635587585\",\"ship_deliver\":\"1\",\"ship_dealer\":\"6\",\"ship_pro\":\"21\",\"ship_odid\":28,\"ship_odblid\":120,\"ship_whid\":null,\"ship_proqty\":\"1\",\"ship_barcode\":10000003,\"ship_date\":1542703099,\"ship_ucode\":\"\",\"ship_tcode\":\"\",\"ship_remark\":\"\",\"ship_cztype\":2,\"ship_czid\":\"1\",\"ship_czuser\":\"test\"}', '2');
INSERT INTO `fw_log` VALUES ('2451', '1280', 'test', '3408', '企业登录', '1542703872', '127.0.0.1', '/Mp/Login/logining', '', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='订单关系表';

-- ----------------------------
-- Records of fw_orderbelong
-- ----------------------------
INSERT INTO `fw_orderbelong` VALUES ('116', '3408', '24', '201811201606149230', '1000000.00', '1', '0', '3408/5bf3c0753f5676336.jpeg', '', '1542701174', '0', '3');
INSERT INTO `fw_orderbelong` VALUES ('117', '3408', '25', '201811201622381573', '300000.00', '1', '0', '3408/5bf3c456cddfd730.jpeg', '', '1542702158', '0', '8');
INSERT INTO `fw_orderbelong` VALUES ('118', '3408', '26', '201811201627292586', '600000.00', '2', '1', null, '', '1542702449', '0', '3');
INSERT INTO `fw_orderbelong` VALUES ('119', '3408', '27', '201811201629405991', '300000.00', '1', '0', null, '', '1542702580', '0', '3');
INSERT INTO `fw_orderbelong` VALUES ('120', '3408', '28', '201811201635587585', '300000.00', '6', '1', null, '', '1542702958', '0', '3');
INSERT INTO `fw_orderbelong` VALUES ('121', '3408', '29', '201811201636351224', '300000.00', '1', '0', null, '', '1542702995', '0', '3');

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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='订单详细表';

-- ----------------------------
-- Records of fw_orderdetail
-- ----------------------------
INSERT INTO `fw_orderdetail` VALUES ('24', '3408', '24', '201811201606149230', '116', '22', '测试产品2', '0002', '盒', '0', '0', '0', '1000.00', '1000.00', '1000');
INSERT INTO `fw_orderdetail` VALUES ('25', '3408', '25', '201811201622381573', '117', '21', '测试产品1', '0001', '盒', '0', '0', '0', '300000.00', '300000.00', '1');
INSERT INTO `fw_orderdetail` VALUES ('26', '3408', '26', '201811201627292586', '118', '22', '测试产品2', '0002', '盒', '0', '0', '0', '300000.00', '300000.00', '1');
INSERT INTO `fw_orderdetail` VALUES ('27', '3408', '26', '201811201627292586', '118', '21', '测试产品1', '0001', '盒', '0', '0', '0', '300000.00', '300000.00', '1');
INSERT INTO `fw_orderdetail` VALUES ('28', '3408', '27', '201811201629405991', '119', '22', '测试产品2', '0002', '盒', '0', '0', '0', '300000.00', '300000.00', '1');
INSERT INTO `fw_orderdetail` VALUES ('29', '3408', '28', '201811201635587585', '120', '21', '测试产品1', '0001', '盒', '0', '0', '0', '300000.00', '300000.00', '1');
INSERT INTO `fw_orderdetail` VALUES ('30', '3408', '29', '201811201636351224', '121', '21', '测试产品1', '0001', '盒', '0', '0', '0', '300000.00', '300000.00', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=373 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='订单操作日志';

-- ----------------------------
-- Records of fw_orderlogs
-- ----------------------------
INSERT INTO `fw_orderlogs` VALUES ('356', '3408', '24', '201811201606149230', '1', '1', 'test', '钟琪', '创建订单', '1542701174', '/Angels/Orders/submitorders', '127.0.0.1');
INSERT INTO `fw_orderlogs` VALUES ('357', '3408', '24', '201811201606149230', '0', '1280', 'test', 'test', '确认订单', '1542701184', '/Mp/Orders/cancelorder/state/1/od_id/24/odbl_id/116', '127.0.0.1');
INSERT INTO `fw_orderlogs` VALUES ('358', '3408', '24', '201811201606149230', '0', '1280', 'test', 'test', '完成发货', '1542701632', '/Mp/Orders/odfinishship_save', '127.0.0.1');
INSERT INTO `fw_orderlogs` VALUES ('359', '3408', '25', '201811201622381573', '1', '1', 'test', '钟琪', '创建订单', '1542702159', '/Angels/Orders/submitorders', '127.0.0.1');
INSERT INTO `fw_orderlogs` VALUES ('360', '3408', '25', '201811201622381573', '0', '1280', 'test', 'test', '确认订单', '1542702282', '/Mp/Orders/cancelorder/state/1/od_id/25/odbl_id/117', '127.0.0.1');
INSERT INTO `fw_orderlogs` VALUES ('361', '3408', '25', '201811201622381573', '0', '1280', 'test', 'test', '完成发货', '1542702299', '/Mp/Orders/odfinishship_save', '127.0.0.1');
INSERT INTO `fw_orderlogs` VALUES ('362', '3408', '26', '201811201627292586', '1', '2', '15875872791', '钟琪1', '创建订单', '1542702449', '/Angels/Orders/submitorders', '127.0.0.1');
INSERT INTO `fw_orderlogs` VALUES ('363', '3408', '25', '201811201622381573', '1', '1', 'test', '钟琪', '确认收货', '1542702479', '/Angels/Orders/confirmreceipt/od_id/25/od_state/3', '127.0.0.1');
INSERT INTO `fw_orderlogs` VALUES ('364', '3408', '26', '201811201627292586', '1', '1', 'test', '钟琪', '确认订单', '1542702485', '/Angels/Orders/canceldlorder/state/1/od_id/26/odbl_id/118/od_state/0', '127.0.0.1');
INSERT INTO `fw_orderlogs` VALUES ('365', '3408', '27', '201811201629405991', '1', '1', 'test', '钟琪', '创建订单', '1542702581', '/Angels/Orders/submitorders', '127.0.0.1');
INSERT INTO `fw_orderlogs` VALUES ('366', '3408', '27', '201811201629405991', '0', '1280', 'test', 'test', '确认订单', '1542702606', '/Mp/Orders/cancelorder/state/1/od_id/27/odbl_id/119', '127.0.0.1');
INSERT INTO `fw_orderlogs` VALUES ('367', '3408', '27', '201811201629405991', '0', '1280', 'test', 'test', '完成发货', '1542702624', '/Mp/Orders/odfinishship_save', '127.0.0.1');
INSERT INTO `fw_orderlogs` VALUES ('368', '3408', '28', '201811201635587585', '1', '6', '15875872794', '钟琪4', '创建订单', '1542702958', '/Angels/Orders/submitorders', '127.0.0.1');
INSERT INTO `fw_orderlogs` VALUES ('369', '3408', '28', '201811201635587585', '1', '1', 'test', '钟琪', '确认订单', '1542702976', '/Angels/Orders/canceldlorder/state/1/od_id/28/odbl_id/120/od_state/0', '127.0.0.1');
INSERT INTO `fw_orderlogs` VALUES ('370', '3408', '29', '201811201636351224', '1', '1', 'test', '钟琪', '创建订单', '1542702995', '/Angels/Orders/submitorders', '127.0.0.1');
INSERT INTO `fw_orderlogs` VALUES ('371', '3408', '29', '201811201636351224', '0', '1280', 'test', 'test', '确认订单', '1542703000', '/Mp/Orders/cancelorder/state/1/od_id/29/odbl_id/121', '127.0.0.1');
INSERT INTO `fw_orderlogs` VALUES ('372', '3408', '29', '201811201636351224', '0', '1280', 'test', 'test', '完成发货', '1542703020', '/Mp/Orders/odfinishship_save', '127.0.0.1');

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
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='订单表';

-- ----------------------------
-- Records of fw_orders
-- ----------------------------
INSERT INTO `fw_orders` VALUES ('25', '3408', '201811201622381573', '300000.00', '1542702158', '1', '钟琪', '84', '11', '1101', '0', '0', '北京市东城区', '15875872790', '1', '', '1542702299', '', '8', '0', '0', '0');
INSERT INTO `fw_orders` VALUES ('26', '3408', '201811201627292586', '600000.00', '1542702449', '2', '钟琪1', '85', '11', '1101', '0', '0', '北京市东城区', '15875872791', '1', '', '1542702761', '', '3', '0', '0', '0');
INSERT INTO `fw_orders` VALUES ('27', '3408', '201811201629405991', '300000.00', '1542702580', '1', '钟琪', '84', '11', '1101', '0', '0', '北京市东城区', '15875872790', '1', '', '1542702624', '', '3', '0', '0', '0');
INSERT INTO `fw_orders` VALUES ('28', '3408', '201811201635587585', '300000.00', '1542702958', '6', '钟琪4', '86', '11', '1102', '0', '0', '北京市', '15875872794', '1', '', '1542703126', '', '3', '0', '0', '0');
INSERT INTO `fw_orders` VALUES ('29', '3408', '201811201636351224', '300000.00', '1542702995', '1', '钟琪', '84', '11', '1101', '0', '0', '北京市东城区', '15875872790', '1', '', '1542703020', '', '3', '0', '0', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of fw_product
-- ----------------------------
INSERT INTO `fw_product` VALUES ('21', '3408', '22', '测试产品1', '0001', '', '1', '0', '0', '0', '3408/1542700894_3022.jpg', null, '300000.00', '0', '盒', '0', '0', '0', '滋养', '', null, '', '1', '0', '1542700894');
INSERT INTO `fw_product` VALUES ('22', '3408', '22', '测试产品2', '0002', '', '1', '0', '0', '0', '3408/1542700920_3253.jpg', null, '300000.00', '0', '盒', '0', '0', '0', '滋补', '', null, '', '1', '0', '1542700920');

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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='产品价格体系';

-- ----------------------------
-- Records of fw_proprice
-- ----------------------------
INSERT INTO `fw_proprice` VALUES ('13', '3408', '22', '9', '300000.00', '0', '0');
INSERT INTO `fw_proprice` VALUES ('14', '3408', '22', '10', '300000.00', '0', '0');
INSERT INTO `fw_proprice` VALUES ('15', '3408', '22', '11', '300000.00', '0', '0');
INSERT INTO `fw_proprice` VALUES ('16', '3408', '22', '12', '300000.00', '0', '0');
INSERT INTO `fw_proprice` VALUES ('17', '3408', '21', '9', '300000.00', '0', '0');
INSERT INTO `fw_proprice` VALUES ('18', '3408', '21', '10', '300000.00', '0', '0');
INSERT INTO `fw_proprice` VALUES ('19', '3408', '21', '11', '300000.00', '0', '0');
INSERT INTO `fw_proprice` VALUES ('20', '3408', '21', '12', '300000.00', '0', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of fw_protype
-- ----------------------------
INSERT INTO `fw_protype` VALUES ('22', '3408', '燕盏', '0', '22');

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
) ENGINE=InnoDB AUTO_INCREMENT=1281 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='企业基本信息';

-- ----------------------------
-- Records of fw_qyinfo
-- ----------------------------
INSERT INTO `fw_qyinfo` VALUES ('1280', 'test', '66730c784751efc66db25382bd59bbbb', '3408', '安吉思燕窝angels', '', '-', '', '', '微商ZQ', '1542683063', '1', '10000,10001,10002,10003,10004,10005,10008,10009,10010,10011,10012,10013,90000,90001,90003,90004,90005,11000,11001,11002,20000,20001,20002,20003,20004,20005,20006,20007,16000,16001,16002,16003,16004,16005,16006,16007,16008,16009,30000,30001,30002,30003,30004,30005,30006,30007,30008,13000,13001,13002,13003,13004,13005,13006,13007,13008,14000,14001,14002,14003,14004,14005,17001,15000,15001,15002,15003,15004,70000,70001,70010,70011,70012,70006,70007,70009,70015,70018,70020,70013,70005,17002,80000,80001,80002', 'a2abren2Wd2p5XeWtFBjrxjBH0V5IRjgw0PvFoJ9pLkm', '2d70041a73fec7d27bf8d3ff913041ad4c057bc0c92497773d1bea702a2fff17', '1000', '', '', '', 'angels', '1542703872', '0', null, '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='返利提现记录';

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
) ENGINE=InnoDB AUTO_INCREMENT=4673 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='生码发行记录';

-- ----------------------------
-- Records of fw_sellrecord
-- ----------------------------
INSERT INTO `fw_sellrecord` VALUES ('4672', '3408', '105000', '1', '0', '2018-11-20 00:00:00', '', '', '', '0', '10000001', '10105000', 'N', '', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0', '105000', '1-单个包装', '0', '0', '1', '4-双码流水号2', '', '', '', '', '0', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=302 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of fw_shipment
-- ----------------------------
INSERT INTO `fw_shipment` VALUES ('296', '3408', '201811201622381573', '0', '1', '21', '25', '117', '8', '1', '10000001', '', '', '1542702293', '', '0', '1280', 'test', null, null, '0');
INSERT INTO `fw_shipment` VALUES ('297', '3408', '201811201627292586', '1', '2', '21', '26', '118', null, '1', '10000001', '', '', '1542702517', '', '2', '1', 'test', null, null, '0');
INSERT INTO `fw_shipment` VALUES ('298', '3408', '201811201629405991', '0', '1', '22', '27', '119', '8', '1', '10000002', '', '', '1542702619', '', '0', '1280', 'test', null, null, '0');
INSERT INTO `fw_shipment` VALUES ('299', '3408', '201811201627292586', '1', '2', '22', '26', '118', null, '1', '10000002', '', '', '1542702692', '', '2', '1', 'test', null, null, '0');
INSERT INTO `fw_shipment` VALUES ('300', '3408', '201811201636351224', '0', '1', '21', '29', '121', '8', '1', '10000003', '', '', '1542703014', '', '0', '1280', 'test', null, null, '0');
INSERT INTO `fw_shipment` VALUES ('301', '3408', '201811201635587585', '1', '6', '21', '28', '120', null, '1', '10000003', '', '', '1542703099', '', '2', '1', 'test', null, null, '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=158 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='购物车';

-- ----------------------------
-- Records of fw_shopcart
-- ----------------------------

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='仓库管理';

-- ----------------------------
-- Records of fw_warehouse
-- ----------------------------
INSERT INTO `fw_warehouse` VALUES ('8', '3408', '0001', '安吉思', '', '', '');

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
