/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50621
Source Host           : localhost:3306
Source Database       : material

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2017-02-16 19:54:41
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `dm_algorithm`
-- ----------------------------
DROP TABLE IF EXISTS `dm_algorithm`;
CREATE TABLE `dm_algorithm` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dmal_name` varchar(255) NOT NULL COMMENT '算法名称',
  `dmal_dmac_id` int(11) NOT NULL COMMENT '所属类别ID',
  `dmal_desc` text COMMENT '算法说明',
  `dmal_cmd_path` varchar(255) DEFAULT NULL COMMENT '算法调用路径',
  `dmal_cmd_arg` varchar(255) DEFAULT NULL COMMENT '算法调用参数',
  `dmal_time` datetime DEFAULT NULL COMMENT '添加时间',
  `dmal_user_id` int(11) DEFAULT NULL COMMENT '添加用户ID',
  `dmal_status` bit(1) DEFAULT b'0' COMMENT '算法当前状态，0：正在添加，不可用，1：可用',
  PRIMARY KEY (`id`),
  KEY `fk_dm_algo_cate` (`dmal_dmac_id`),
  CONSTRAINT `fk_dm_algo_cate` FOREIGN KEY (`dmal_dmac_id`) REFERENCES `dm_algo_cate` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='数据挖掘算法';

-- ----------------------------
-- Records of dm_algorithm
-- ----------------------------
INSERT INTO `dm_algorithm` VALUES ('4', 'gfdgfdg', '1', 'gfdgfd', null, 'gfdgfd', '2017-02-05 18:27:43', '5', '');
INSERT INTO `dm_algorithm` VALUES ('5', 'C45', '1', 'fdasf', null, 'fdsaf', '2017-02-05 18:41:32', '5', '');
INSERT INTO `dm_algorithm` VALUES ('6', 'SCM', '3', 'gfdsgf', null, 'gfdsg', '2017-02-05 18:43:16', '5', '');
INSERT INTO `dm_algorithm` VALUES ('7', 'ggg', '2', 'ghhh', null, 'fgg', '2017-02-05 19:21:10', '5', '');
INSERT INTO `dm_algorithm` VALUES ('8', 'bxcvbvc', '4', 'bxb', null, 'bvxcb', '2017-02-05 19:24:32', '5', '');
INSERT INTO `dm_algorithm` VALUES ('9', 'gsdfg', '2', 'fgsg', null, 'fsg', '2017-02-05 19:25:33', '5', '');
INSERT INTO `dm_algorithm` VALUES ('12', 'bvbbxcvb', '2', 'bvcxb', null, 'bvcxb', '2017-02-05 19:39:57', '5', '');
INSERT INTO `dm_algorithm` VALUES ('13', 'erer', '2', 'hgdh', 'jfinal-club-1.0 (1)1.zip', 'rerer', '2017-02-05 20:15:56', '5', '');
INSERT INTO `dm_algorithm` VALUES ('14', 'sdfdsa', '3', 'faf', 'commons-email-1.4-bin1.zip', 'fdasf', '2017-02-05 19:58:09', '5', '');
INSERT INTO `dm_algorithm` VALUES ('15', 'bcvbvcb', '3', 'nbv', 'fancyapps-fancyBox-v2.1.6-0-gc00852a.zip', 'nvbn', '2017-02-06 08:14:12', '5', '');
INSERT INTO `dm_algorithm` VALUES ('16', 'fdsg', '1', 'fdsg', 'Dm7JdbcDriver16.jar', 'gsdfg', '2017-02-06 08:20:07', '5', '');
INSERT INTO `dm_algorithm` VALUES ('17', 'fsdafds', '2', 'fdsaf', 'msutil.jar', 'dfsaf', '2017-02-06 08:22:59', '5', '');
INSERT INTO `dm_algorithm` VALUES ('18', 'dfsgdf', '3', 'fdsg', 'asm-5.1.jar', 'gfsdg', '2017-02-06 08:35:41', '5', '');
INSERT INTO `dm_algorithm` VALUES ('19', 'sgdfsgdf', '2', 'gfsdgdf', 'commons-codec-1.10.jar', 'sdfg', '2017-02-06 08:42:00', '5', '');
INSERT INTO `dm_algorithm` VALUES ('20', 'gfdsg', '1', 'gfds', 'cglib-3.2.2.jar', 'gfdsg', '2017-02-06 08:43:55', '5', '');
INSERT INTO `dm_algorithm` VALUES ('21', 'hhjjhjh', '1', 'hgfjhf', 'beetl-2.7.6.jar', 'jhgjghj', '2017-02-06 08:48:52', '5', '');
INSERT INTO `dm_algorithm` VALUES ('22', 'hfd', '2', 'hfdh', 'json5.jar', 'hgdh', '2017-02-06 09:15:47', '5', '');
INSERT INTO `dm_algorithm` VALUES ('23', 'fdsgfd', '1', 'gsdfg', 'commons-lang3-3.4.jar', 'gfsdg', '2017-02-06 09:17:02', '5', '');
INSERT INTO `dm_algorithm` VALUES ('24', 'jgjh', '2', 'ghb', 'commons-net-3.4.jar', 'mbjhj', '2017-02-06 09:22:34', '5', '');
INSERT INTO `dm_algorithm` VALUES ('25', 'hkhjk', '1', 'jbjh', 'commons-pool2-2.4.2.jar', 'jghj', '2017-02-06 09:23:48', '5', '');
INSERT INTO `dm_algorithm` VALUES ('26', 'dfsghfd', '2', 'shdfh', 'cron4j-2.2.5.jar', 'sdhdh', '2017-02-06 09:26:25', '5', '');
INSERT INTO `dm_algorithm` VALUES ('27', 'fdsf', '1', 'fdsfd', 'commons-io-2.42.jar', 'fdsf', '2017-02-06 10:33:23', '5', '');

-- ----------------------------
-- Table structure for `dm_algo_argument`
-- ----------------------------
DROP TABLE IF EXISTS `dm_algo_argument`;
CREATE TABLE `dm_algo_argument` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `dmaa_dmal_id` int(11) DEFAULT NULL COMMENT '对应的算法编号',
  `dmaa_argu` varchar(45) DEFAULT NULL COMMENT '参数标识',
  `dmaa_name_en` varchar(255) DEFAULT NULL COMMENT '参数英文名',
  `dmaa_name_zh` varchar(255) DEFAULT NULL COMMENT '参数中文名',
  `dmaa_desc` text COMMENT '参数描述',
  `dmaa_value` varchar(255) DEFAULT NULL COMMENT '参数默认值',
  PRIMARY KEY (`id`),
  KEY `fk_dmal` (`dmaa_dmal_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COMMENT='每个数据挖掘算法对应的参数说明';

-- ----------------------------
-- Records of dm_algo_argument
-- ----------------------------
INSERT INTO `dm_algo_argument` VALUES ('2', '4', 'e', 'ee', '', 'dfgfdg', '3');
INSERT INTO `dm_algo_argument` VALUES ('3', '4', 'r', 'rr', '', '', '5');
INSERT INTO `dm_algo_argument` VALUES ('4', '4', 'd', 'dd', 'ddd', '', '5');
INSERT INTO `dm_algo_argument` VALUES ('5', '5', 'fdaf', 'dsaf', 'daf', 'dafdasf', 'daf');
INSERT INTO `dm_algo_argument` VALUES ('6', '5', 'dfsdfdsaf', 'fdsaf', 'e', 'fdasf', '4');
INSERT INTO `dm_algo_argument` VALUES ('7', '5', 's', 's', '', '', '4');
INSERT INTO `dm_algo_argument` VALUES ('8', '6', 'd', 'rr', '电风扇广泛', '', '4');
INSERT INTO `dm_algo_argument` VALUES ('9', '6', 'gfsd', 'gfsd', 'gfsd', '', 'gfsd');
INSERT INTO `dm_algo_argument` VALUES ('10', '7', '33', 'rtt', 'ttt', 'yyy', 'yyy');
INSERT INTO `dm_algo_argument` VALUES ('11', '7', 'ff', 'tt', 'tttt', 'rgg', 'jjj');
INSERT INTO `dm_algo_argument` VALUES ('12', '7', 'f', 'fff', '', '', '7');
INSERT INTO `dm_algo_argument` VALUES ('13', '8', 'bvcx', 'b', 'bv', '', 'bvxc');
INSERT INTO `dm_algo_argument` VALUES ('14', '8', 'bvx', 'bvxb', '', '', 'v');
INSERT INTO `dm_algo_argument` VALUES ('15', '9', 'fgfd', 'gfd', 'gfd', 'gfdgd', 'gfd');
INSERT INTO `dm_algo_argument` VALUES ('16', '9', 'd', 'd', 'd', 'd', '');
INSERT INTO `dm_algo_argument` VALUES ('19', '12', 'vbxc', 'bvcx', 'bvcx', 'bvcxb', 'bvcx');
INSERT INTO `dm_algo_argument` VALUES ('21', '14', 'fda', 'fdas', 'fasf', 'fasdf', 'fasdf');
INSERT INTO `dm_algo_argument` VALUES ('22', '13', 're', 're', 're', 're', 're');
INSERT INTO `dm_algo_argument` VALUES ('23', '13', 'er', 'er', 'er', 'er', 'er');
INSERT INTO `dm_algo_argument` VALUES ('24', '15', 'nbv', 'nbv', 'nbv', 'nbv', 'nbv');
INSERT INTO `dm_algo_argument` VALUES ('25', '16', 'gfds', 'gf', 'gfd', 'gfd', 'gfd');
INSERT INTO `dm_algo_argument` VALUES ('26', '17', 'e', 'e', 'e', 'e', 'e');
INSERT INTO `dm_algo_argument` VALUES ('27', '17', 'f', 'f', 'f', 'f', 'f');
INSERT INTO `dm_algo_argument` VALUES ('28', '18', 'gsf', 'gfds', 'gfsd', 'gfds', 'gfds');
INSERT INTO `dm_algo_argument` VALUES ('29', '19', 'gfds', 'gfds', 'gfd', 'sgfds', 'gfd');
INSERT INTO `dm_algo_argument` VALUES ('30', '20', 'gf', 'g', 'g', 'gfdgd', 'g');
INSERT INTO `dm_algo_argument` VALUES ('31', '21', 'f', 'g', 'y', 'bbbbb', 'bbbb');
INSERT INTO `dm_algo_argument` VALUES ('32', '22', 'h', 'h', 'h', 'h', 'h');
INSERT INTO `dm_algo_argument` VALUES ('33', '23', 'dg', 'g', 'g', 'gfdgg', 'g');
INSERT INTO `dm_algo_argument` VALUES ('34', '24', 'b', 'gfds', 'bbb', 'dddd', 'gfd');
INSERT INTO `dm_algo_argument` VALUES ('35', '25', 'gfds', 'gfds', 'bbbb', 'gfdgd', 'gfd');
INSERT INTO `dm_algo_argument` VALUES ('36', '26', 'd', 'gfds', 'bbbb', 'dddd', 'bbbb');

-- ----------------------------
-- Table structure for `dm_algo_cate`
-- ----------------------------
DROP TABLE IF EXISTS `dm_algo_cate`;
CREATE TABLE `dm_algo_cate` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `dmac_name` varchar(255) NOT NULL COMMENT '数据挖掘算法类别名称',
  `dmac_desc` text COMMENT '类别描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='数据挖掘算法类别';

-- ----------------------------
-- Records of dm_algo_cate
-- ----------------------------
INSERT INTO `dm_algo_cate` VALUES ('1', '关联规则分析', '关联模型由一系列项集和说明这些项在事例中如何分组的规则组成。 ');
INSERT INTO `dm_algo_cate` VALUES ('2', '聚类分析', '聚类分析模型标识数据集中可能无法通过随意观察在逻辑上得出的关系。');
INSERT INTO `dm_algo_cate` VALUES ('3', '分类算法', '分类算法');
INSERT INTO `dm_algo_cate` VALUES ('4', '神经网络算法', '利用神经网络的算法');

-- ----------------------------
-- Table structure for `dm_submit`
-- ----------------------------
DROP TABLE IF EXISTS `dm_submit`;
CREATE TABLE `dm_submit` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `dmsu_dmal_id` int(11) DEFAULT NULL COMMENT '所属算法编号',
  `dmsu_user_id` int(11) DEFAULT NULL COMMENT '操作用户编号',
  `dmsu_argument` text COMMENT '使用的参数',
  `dmsu_data_file` varchar(255) DEFAULT NULL COMMENT '所使用的数据文件（存放地址）',
  `dmsu_result` text COMMENT '算法运行输出结果',
  `dmsu_time` datetime DEFAULT NULL COMMENT '算法运行时间',
  `dmsu_ip` varchar(45) DEFAULT NULL COMMENT '提交用户的ip',
  `dmsu_time_use` int(11) DEFAULT NULL COMMENT '算法运行消耗时间（毫秒）',
  `dmsu_mem_use` double DEFAULT NULL COMMENT '算法运行小号内存',
  PRIMARY KEY (`id`),
  KEY `fk_dmsu_dmal` (`dmsu_dmal_id`),
  KEY `fk_dmsu_user` (`dmsu_user_id`),
  CONSTRAINT `fk_dmsu_dmal` FOREIGN KEY (`dmsu_dmal_id`) REFERENCES `dm_algorithm` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_dmsu_user` FOREIGN KEY (`dmsu_user_id`) REFERENCES `ke_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户提交的数据计算结果';

-- ----------------------------
-- Records of dm_submit
-- ----------------------------

-- ----------------------------
-- Table structure for `em_attr`
-- ----------------------------
DROP TABLE IF EXISTS `em_attr`;
CREATE TABLE `em_attr` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `emat_pare_id` int(11) DEFAULT '0' COMMENT '属性父ID',
  `emat_secu_id` int(11) DEFAULT NULL COMMENT '密级',
  `emat_name` varchar(255) DEFAULT NULL COMMENT '属性名称',
  `emat_type` int(11) DEFAULT NULL COMMENT '属性类型，1：数字，2：文本，3：图片，4：表格数字',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8 COMMENT='含能材料配方属性信息表';

-- ----------------------------
-- Records of em_attr
-- ----------------------------
INSERT INTO `em_attr` VALUES ('2', '0', '1', '组份及配比', '2');
INSERT INTO `em_attr` VALUES ('3', '2', '1', '质量分数/%', '4');
INSERT INTO `em_attr` VALUES ('4', '2', '1', '体积分数/%', '4');
INSERT INTO `em_attr` VALUES ('5', '0', '1', '化学性质', '2');
INSERT INTO `em_attr` VALUES ('6', '5', '1', '结构式', '3');
INSERT INTO `em_attr` VALUES ('7', '5', '1', '相对分子质量', '1');
INSERT INTO `em_attr` VALUES ('8', '5', '1', '溶解性', '2');
INSERT INTO `em_attr` VALUES ('9', '8', '1', '17℃溶解度', '4');
INSERT INTO `em_attr` VALUES ('10', '8', '1', '20℃溶解度', '4');
INSERT INTO `em_attr` VALUES ('11', '8', '1', '25℃溶解度', '4');
INSERT INTO `em_attr` VALUES ('12', '8', '1', '40℃溶解度', '4');
INSERT INTO `em_attr` VALUES ('13', '8', '1', '50℃溶解度', '4');
INSERT INTO `em_attr` VALUES ('14', '8', '1', '60℃溶解度', '4');
INSERT INTO `em_attr` VALUES ('15', '8', '1', '70℃溶解度', '4');
INSERT INTO `em_attr` VALUES ('16', '5', '1', '化学稳定性', '2');
INSERT INTO `em_attr` VALUES ('17', '0', '1', '物理性质', '2');
INSERT INTO `em_attr` VALUES ('18', '17', '1', '外观(物理状态)', '2');
INSERT INTO `em_attr` VALUES ('19', '17', '1', '理论密度（g/cm^3）', '1');
INSERT INTO `em_attr` VALUES ('20', '17', '1', '实际密度（g/cm^3）', '1');
INSERT INTO `em_attr` VALUES ('21', '17', '1', '名义相对分子质量', '1');
INSERT INTO `em_attr` VALUES ('22', '17', '1', '元素组成', '4');
INSERT INTO `em_attr` VALUES ('23', '17', '1', '晶体结构', '2');
INSERT INTO `em_attr` VALUES ('24', '17', '1', '晶体密度（g/cm^3）', '1');
INSERT INTO `em_attr` VALUES ('25', '17', '1', '熔点（℃）', '1');
INSERT INTO `em_attr` VALUES ('26', '0', '1', '热性质', '2');
INSERT INTO `em_attr` VALUES ('27', '26', '1', '燃烧热（MJ/kg）', '1');
INSERT INTO `em_attr` VALUES ('28', '26', '1', '生成热（kJ/mol）', '1');
INSERT INTO `em_attr` VALUES ('29', '26', '1', '爆热（MJ/kg）', '1');
INSERT INTO `em_attr` VALUES ('30', '26', '1', '爆热-表（MJ/kg）', '4');
INSERT INTO `em_attr` VALUES ('31', '26', '1', '爆容（L/kg）', '1');
INSERT INTO `em_attr` VALUES ('32', '26', '1', '爆容-表（L/kg）', '4');
INSERT INTO `em_attr` VALUES ('33', '26', '1', '爆发点', '1');
INSERT INTO `em_attr` VALUES ('34', '26', '1', '热安定性', '2');
INSERT INTO `em_attr` VALUES ('35', '26', '1', 'DTA曲线', '3');
INSERT INTO `em_attr` VALUES ('36', '26', '1', '蒸气压（Pa）', '4');
INSERT INTO `em_attr` VALUES ('37', '26', '1', '质量热容（kJ/kgK）', '1');
INSERT INTO `em_attr` VALUES ('38', '26', '1', '热扩散率（*10^-7m^2/s）', '1');
INSERT INTO `em_attr` VALUES ('39', '26', '1', '热扩散率-表（*10^-7m^2/s）', '4');
INSERT INTO `em_attr` VALUES ('40', '26', '1', '导热系数（W/mK）', '1');
INSERT INTO `em_attr` VALUES ('41', '26', '1', '线膨胀系数（*10^-5/K）', '1');
INSERT INTO `em_attr` VALUES ('42', '26', '1', '线膨胀系数-表（/*10^-5K）', '4');
INSERT INTO `em_attr` VALUES ('43', '26', '1', '质量热容（J/g·K）', '1');
INSERT INTO `em_attr` VALUES ('44', '34', '1', '布鲁屯压力法-表格', '4');
INSERT INTO `em_attr` VALUES ('45', '34', '1', '真空安定性-表格', '4');
INSERT INTO `em_attr` VALUES ('46', '34', '1', '化学反应性', '2');
INSERT INTO `em_attr` VALUES ('47', '34', '1', '热失重-表格', '4');
INSERT INTO `em_attr` VALUES ('48', '26', '1', '差热分析-文本', '2');
INSERT INTO `em_attr` VALUES ('49', '26', '1', '差热分析-图片', '3');
INSERT INTO `em_attr` VALUES ('50', '26', '1', '热爆炸（爆发点）', '2');
INSERT INTO `em_attr` VALUES ('51', '0', '1', '力学性能', '2');
INSERT INTO `em_attr` VALUES ('52', '51', '1', '抗压强度（MPa）', '1');
INSERT INTO `em_attr` VALUES ('53', '51', '1', '抗拉强度（MPa）', '1');
INSERT INTO `em_attr` VALUES ('54', '51', '1', '抗压强度和抗拉强度', '1');
INSERT INTO `em_attr` VALUES ('55', '54', '1', '抗压强度和抗拉强度-数据1', '1');
INSERT INTO `em_attr` VALUES ('56', '54', '1', '抗压强度和抗拉强度-数据2', '1');
INSERT INTO `em_attr` VALUES ('57', '51', '1', '泊松比', '1');
INSERT INTO `em_attr` VALUES ('58', '51', '1', '压缩弹性模量（GPa）', '1');
INSERT INTO `em_attr` VALUES ('59', '51', '1', '压缩模量（GPa）', '1');
INSERT INTO `em_attr` VALUES ('60', '51', '1', '应力应变曲线', '3');
INSERT INTO `em_attr` VALUES ('61', '51', '1', '蠕变曲线', '3');
INSERT INTO `em_attr` VALUES ('62', '0', '1', '感度', '2');
INSERT INTO `em_attr` VALUES ('63', '62', '1', '落锤撞击感度（%）', '1');
INSERT INTO `em_attr` VALUES ('64', '62', '1', '摩擦感度（%）', '1');
INSERT INTO `em_attr` VALUES ('65', '62', '1', '50%爆炸特性落高（cm）', '1');
INSERT INTO `em_attr` VALUES ('66', '62', '1', '电火花感度（%）', '1');
INSERT INTO `em_attr` VALUES ('67', '62', '1', '苏珊感度-数字（%）', '1');
INSERT INTO `em_attr` VALUES ('68', '62', '1', '苏珊感度-图片', '3');
INSERT INTO `em_attr` VALUES ('69', '62', '1', '枪击感度', '1');
INSERT INTO `em_attr` VALUES ('70', '62', '1', '实测超压（kPa）', '1');
INSERT INTO `em_attr` VALUES ('71', '62', '1', 'TNT当量（g）', '1');
INSERT INTO `em_attr` VALUES ('72', '0', '1', '冲击波引爆', '2');
INSERT INTO `em_attr` VALUES ('73', '72', '1', '大隔板实验', '2');
INSERT INTO `em_attr` VALUES ('74', '73', '1', '大隔板实验-数据1', '4');
INSERT INTO `em_attr` VALUES ('75', '73', '1', '大隔板实验-数据2', '4');
INSERT INTO `em_attr` VALUES ('76', '72', '1', '小隔板实验', '2');
INSERT INTO `em_attr` VALUES ('77', '76', '1', '小隔板实验-数据1', '4');
INSERT INTO `em_attr` VALUES ('78', '76', '1', '小隔板实验-数据2', '4');
INSERT INTO `em_attr` VALUES ('79', '0', '1', '爆轰性能', '2');
INSERT INTO `em_attr` VALUES ('80', '79', '1', '爆速（m/s）-表格', '4');
INSERT INTO `em_attr` VALUES ('81', '79', '1', '爆压（GPa）', '1');
INSERT INTO `em_attr` VALUES ('82', '79', '1', '爆压（GPa）-表格', '4');
INSERT INTO `em_attr` VALUES ('83', '79', '1', '多方指数', '1');
INSERT INTO `em_attr` VALUES ('84', '79', '1', '多方指数-表格', '4');
INSERT INTO `em_attr` VALUES ('85', '79', '1', '平面飞片速度ρ（g/cm^3）', '2');
INSERT INTO `em_attr` VALUES ('86', '85', '1', '平面飞片速度μ（m/s）', '1');
INSERT INTO `em_attr` VALUES ('87', '85', '1', '平面飞片速度Δμ（m/s）', '1');
INSERT INTO `em_attr` VALUES ('88', '79', '1', '板痕实验', '1');
INSERT INTO `em_attr` VALUES ('89', '79', '1', '圆筒试验', '2');
INSERT INTO `em_attr` VALUES ('90', '89', '1', '圆筒试验-数据1', '4');
INSERT INTO `em_attr` VALUES ('91', '89', '1', '圆筒试验-数据2', '4');
INSERT INTO `em_attr` VALUES ('92', '0', '1', '加速老化及长期贮存性能', '2');
INSERT INTO `em_attr` VALUES ('93', '92', '1', '老化前后及密度变化率', '2');
INSERT INTO `em_attr` VALUES ('94', '93', '1', '老化前后及密度变化率-初始值', '1');
INSERT INTO `em_attr` VALUES ('95', '93', '1', '老化前后及密度变化率-数据1', '4');
INSERT INTO `em_attr` VALUES ('96', '93', '1', '老化前后及密度变化率-数据2', '4');
INSERT INTO `em_attr` VALUES ('97', '93', '1', '老化前后及密度变化率-数据3', '4');
INSERT INTO `em_attr` VALUES ('98', '93', '1', '老化前后及密度变化率-数据4', '4');
INSERT INTO `em_attr` VALUES ('99', '93', '1', '老化前后及密度变化率-数据5', '4');
INSERT INTO `em_attr` VALUES ('100', '93', '1', '老化前后及密度变化率-数据6', '4');
INSERT INTO `em_attr` VALUES ('101', '0', '1', '炸药感度', '2');
INSERT INTO `em_attr` VALUES ('102', '101', '1', '摩擦感度', '1');
INSERT INTO `em_attr` VALUES ('103', '101', '1', '电火花感度', '1');

-- ----------------------------
-- Table structure for `em_attr_type`
-- ----------------------------
DROP TABLE IF EXISTS `em_attr_type`;
CREATE TABLE `em_attr_type` (
  `id` int(11) NOT NULL COMMENT '编号',
  `type_name` varchar(40) DEFAULT NULL COMMENT '类型名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of em_attr_type
-- ----------------------------
INSERT INTO `em_attr_type` VALUES ('1', '数字');
INSERT INTO `em_attr_type` VALUES ('2', '文本');
INSERT INTO `em_attr_type` VALUES ('3', '图片');
INSERT INTO `em_attr_type` VALUES ('4', '表格数字');

-- ----------------------------
-- Table structure for `em_cate`
-- ----------------------------
DROP TABLE IF EXISTS `em_cate`;
CREATE TABLE `em_cate` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `emca_name` varchar(255) NOT NULL COMMENT '分类名称',
  `emca_parent_id` int(11) DEFAULT NULL COMMENT '父类编号',
  `emca_imag` varchar(255) DEFAULT NULL COMMENT '类别图标（图片）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='含能材料分类信息';

-- ----------------------------
-- Records of em_cate
-- ----------------------------
INSERT INTO `em_cate` VALUES ('1', '用途', '0', null);
INSERT INTO `em_cate` VALUES ('2', '化学成分', '0', null);
INSERT INTO `em_cate` VALUES ('4', '起爆药', '1', null);
INSERT INTO `em_cate` VALUES ('5', '猛炸药', '1', null);
INSERT INTO `em_cate` VALUES ('6', '发射药', '1', null);
INSERT INTO `em_cate` VALUES ('7', '单质炸药', '2', null);
INSERT INTO `em_cate` VALUES ('8', '混合炸药', '2', null);
INSERT INTO `em_cate` VALUES ('9', '使用条件', '0', null);
INSERT INTO `em_cate` VALUES ('10', '安全炸药（煤矿许用炸药）', '9', null);
INSERT INTO `em_cate` VALUES ('11', '非安全炸药', '9', null);
INSERT INTO `em_cate` VALUES ('12', '地下露天可使用', '11', null);
INSERT INTO `em_cate` VALUES ('13', '仅露天可使用', '11', null);

-- ----------------------------
-- Table structure for `em_file`
-- ----------------------------
DROP TABLE IF EXISTS `em_file`;
CREATE TABLE `em_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `emfo_emfo_id` int(11) NOT NULL COMMENT '配方编号',
  `emfi_name` varchar(255) NOT NULL COMMENT '文件名',
  `emfi_path` varchar(255) NOT NULL COMMENT '数据文件存放位置',
  `enfi_desc` text COMMENT '文件描述',
  `enfi_order` int(11) DEFAULT NULL COMMENT '显示顺序',
  PRIMARY KEY (`id`),
  KEY `fk_emfi_em_formula` (`emfo_emfo_id`),
  CONSTRAINT `fk_emfi_em_formula` FOREIGN KEY (`emfo_emfo_id`) REFERENCES `em_gene` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='配方对应的数据文件';

-- ----------------------------
-- Records of em_file
-- ----------------------------

-- ----------------------------
-- Table structure for `em_gene`
-- ----------------------------
DROP TABLE IF EXISTS `em_gene`;
CREATE TABLE `em_gene` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `emge_abbr_name` varchar(255) DEFAULT NULL COMMENT '配方名称缩写',
  `emge_en_name` varchar(255) DEFAULT NULL COMMENT '配方英文名',
  `emge_zh_name` varchar(255) DEFAULT NULL COMMENT '配方中文名',
  `emge_code` varchar(255) DEFAULT NULL COMMENT '配方代码',
  `emge_src` text COMMENT '配方来源',
  `emge_desc` text COMMENT '配方说明',
  `emge_status` int(11) DEFAULT '0' COMMENT '配方状态，0：正在编辑；1：编辑完成，等待校对；2：校对完成，等待审核；9：审核完成，正式配方',
  `emge_create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `emge_update_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `emge_search_count` int(11) DEFAULT NULL COMMENT '搜索次数',
  `emge_user_id` int(11) DEFAULT NULL COMMENT '添加用户id',
  `emge_secu_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='含能材料配方信息表';

-- ----------------------------
-- Records of em_gene
-- ----------------------------

-- ----------------------------
-- Table structure for `em_gene_attr`
-- ----------------------------
DROP TABLE IF EXISTS `em_gene_attr`;
CREATE TABLE `em_gene_attr` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `emge_id` int(11) NOT NULL COMMENT '配方编号',
  `emat_id` int(11) NOT NULL COMMENT '属性编号',
  `emga_value` text NOT NULL COMMENT '属性值',
  PRIMARY KEY (`id`),
  KEY `fk_emfo_em_formu` (`emge_id`),
  KEY `fk_emfo_em_attr` (`emat_id`),
  CONSTRAINT `fk_emfo_em_attr` FOREIGN KEY (`emat_id`) REFERENCES `em_attr` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_emfo_em_formu` FOREIGN KEY (`emge_id`) REFERENCES `em_gene` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='配方与属性对应关系表';

-- ----------------------------
-- Records of em_gene_attr
-- ----------------------------

-- ----------------------------
-- Table structure for `em_gene_cate`
-- ----------------------------
DROP TABLE IF EXISTS `em_gene_cate`;
CREATE TABLE `em_gene_cate` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `emge_id` int(11) DEFAULT NULL COMMENT '配方编号',
  `emca_id` int(11) DEFAULT NULL COMMENT '分类编号',
  PRIMARY KEY (`id`),
  KEY `fk_emfc_em_formula` (`emge_id`),
  KEY `fk_emfc_em_cate` (`emca_id`),
  CONSTRAINT `fk_emfc_em_cate` FOREIGN KEY (`emca_id`) REFERENCES `em_cate` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_emfc_em_formula` FOREIGN KEY (`emge_id`) REFERENCES `em_gene` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='配方与分类信息对应表';

-- ----------------------------
-- Records of em_gene_cate
-- ----------------------------

-- ----------------------------
-- Table structure for `em_gene_opt`
-- ----------------------------
DROP TABLE IF EXISTS `em_gene_opt`;
CREATE TABLE `em_gene_opt` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `emgo_id` int(11) DEFAULT NULL COMMENT '操作的配方编号',
  `emgo_user_id` int(11) DEFAULT NULL COMMENT '操作用户ID',
  `emgo_type` int(11) DEFAULT NULL COMMENT '操作的类型：\n0：新增\n1：校对\n2：审核',
  `emgo_sugg` text,
  `emgo_create_time` datetime DEFAULT NULL,
  `emgo_ip` varchar(45) DEFAULT NULL,
  `emgo_status` bit(1) DEFAULT b'0' COMMENT '操作状态，0：返回修改，1：通过。',
  PRIMARY KEY (`id`),
  KEY `fk_emfp_em_formula` (`emgo_id`),
  KEY `fk_ke_user` (`emgo_user_id`),
  CONSTRAINT `fk_emfp_em_formula` FOREIGN KEY (`emgo_id`) REFERENCES `em_gene` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ke_user` FOREIGN KEY (`emgo_user_id`) REFERENCES `ke_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='配方操作新信息表';

-- ----------------------------
-- Records of em_gene_opt
-- ----------------------------

-- ----------------------------
-- Table structure for `em_molecular`
-- ----------------------------
DROP TABLE IF EXISTS `em_molecular`;
CREATE TABLE `em_molecular` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `emmo_molu_text` text COMMENT '分子式描述，mol文件格式',
  `emm0_emfo_id` int(11) DEFAULT NULL COMMENT '所属配方id\n',
  `emmo_order` int(11) DEFAULT NULL COMMENT '显示顺序',
  PRIMARY KEY (`id`),
  KEY `fk_emmo_em_formula` (`emm0_emfo_id`),
  CONSTRAINT `fk_emmo_em_formula` FOREIGN KEY (`emm0_emfo_id`) REFERENCES `em_gene` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='配方对应的分子式';

-- ----------------------------
-- Records of em_molecular
-- ----------------------------

-- ----------------------------
-- Table structure for `ke_action`
-- ----------------------------
DROP TABLE IF EXISTS `ke_action`;
CREATE TABLE `ke_action` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `acti_name` varchar(245) NOT NULL COMMENT '访问资源名称',
  `acti_url` varchar(255) NOT NULL COMMENT '资源地址',
  `acti_desc` varchar(255) DEFAULT NULL COMMENT '资源说明',
  `acti_type` int(11) NOT NULL DEFAULT '0' COMMENT '0:白名单，公用资源，不拦截，1：需要拦截的资源',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='存放所有操作的action';

-- ----------------------------
-- Records of ke_action
-- ----------------------------
INSERT INTO `ke_action` VALUES ('1', '服务器环境', 'getServerStatus', '获取服务器环境信息', '0');
INSERT INTO `ke_action` VALUES ('2', '统计信息', 'siteStatics', '服务器统计信息', '0');

-- ----------------------------
-- Table structure for `ke_auth_code`
-- ----------------------------
DROP TABLE IF EXISTS `ke_auth_code`;
CREATE TABLE `ke_auth_code` (
  `id` varchar(33) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `expire_time` bigint(20) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ke_auth_code
-- ----------------------------

-- ----------------------------
-- Table structure for `ke_menu`
-- ----------------------------
DROP TABLE IF EXISTS `ke_menu`;
CREATE TABLE `ke_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_parent_id` int(11) DEFAULT '0' COMMENT '父id',
  `menu_name` varchar(255) DEFAULT NULL COMMENT '功能名称',
  `menu_url` varchar(255) DEFAULT NULL COMMENT '功能对应的url',
  `menu_icon` varchar(255) DEFAULT NULL COMMENT '图标',
  `menu_level` int(11) DEFAULT '1' COMMENT '菜单层次',
  `menu_order` int(11) DEFAULT '0' COMMENT '菜单排序',
  `menu_is_leaf` bit(1) DEFAULT b'1' COMMENT '是否叶子节点',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COMMENT='功能菜单描述';

-- ----------------------------
-- Records of ke_menu
-- ----------------------------
INSERT INTO `ke_menu` VALUES ('1', '0', '平台概览', 'index', 'glyphicon glyphicon-dashboard', '1', '0', '');
INSERT INTO `ke_menu` VALUES ('2', '0', '平台安全管理', 'menu', 'glyphicon glyphicon-exclamation-sign', '1', '1', '');
INSERT INTO `ke_menu` VALUES ('3', '2', '管理菜单设置', 'menu', 'glyphicon glyphicon-th-list', '2', '0', '');
INSERT INTO `ke_menu` VALUES ('4', '2', '机构设置', 'organ', 'glyphicon glyphicon-modal-window', '2', '2', '');
INSERT INTO `ke_menu` VALUES ('5', '2', '角色设置', 'role', 'glyphicon glyphicon-king', '2', '1', '');
INSERT INTO `ke_menu` VALUES ('6', '2', '用户管理', 'user', 'glyphicon glyphicon-user', '2', '5', '');
INSERT INTO `ke_menu` VALUES ('18', '0', '知识库管理', '/knlodege', 'glyphicon glyphicon-book', '1', '2', '');
INSERT INTO `ke_menu` VALUES ('20', '2', '操作日志管理', 'userlog', 'glyphicon glyphicon-eye-open', '2', '6', '');
INSERT INTO `ke_menu` VALUES ('21', '18', '知识结构树设置', 'kntree', 'glyphicon glyphicon-tree-conifer', '2', '1', '');
INSERT INTO `ke_menu` VALUES ('22', '18', '知识词条管理', 'knentry', 'glyphicon glyphicon-file', '2', '2', '');
INSERT INTO `ke_menu` VALUES ('23', '18', '文件管理', 'knfile', 'glyphicon glyphicon-duplicate', '2', '3', '');
INSERT INTO `ke_menu` VALUES ('24', '18', '公式管理', 'knform', 'glyphicon glyphicon-euro', '2', '4', '');
INSERT INTO `ke_menu` VALUES ('25', '18', '分子式管理', 'knmole', 'glyphicon glyphicon-filter', '2', '5', '');
INSERT INTO `ke_menu` VALUES ('26', '0', '含能材料基因库管理', 'em', 'glyphicon glyphicon-oil', '1', '3', '');
INSERT INTO `ke_menu` VALUES ('27', '0', '数据挖掘工具管理', 'dm', 'glyphicon glyphicon-cutlery', '1', '4', '');
INSERT INTO `ke_menu` VALUES ('28', '27', '算法分类设置', 'dmcate', 'glyphicon glyphicon-tasks', '2', '1', '');
INSERT INTO `ke_menu` VALUES ('29', '27', '算法管理', 'dmalgo', 'glyphicon glyphicon-folder-close', '2', '2', '');
INSERT INTO `ke_menu` VALUES ('30', '27', '算法运行结果', 'dmsubmit', 'glyphicon glyphicon-credit-card', '2', '3', '');
INSERT INTO `ke_menu` VALUES ('31', '26', '分类设置', 'emcate', 'glyphicon glyphicon-tent', '2', '1', '');
INSERT INTO `ke_menu` VALUES ('32', '26', '属性设置', 'emattr', 'glyphicon glyphicon-equalizer', '2', '2', '');
INSERT INTO `ke_menu` VALUES ('33', '26', '材料配方管理', 'emgene', 'glyphicon glyphicon-baby-formula', '2', '3', '');

-- ----------------------------
-- Table structure for `ke_menu_action`
-- ----------------------------
DROP TABLE IF EXISTS `ke_menu_action`;
CREATE TABLE `ke_menu_action` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_id` int(11) NOT NULL COMMENT '功能菜单ID',
  `acti_id` int(11) NOT NULL COMMENT 'actionID',
  PRIMARY KEY (`id`),
  KEY `fk_kemc_ke_action` (`acti_id`),
  CONSTRAINT `fk_kemc_ke_action` FOREIGN KEY (`acti_id`) REFERENCES `ke_action` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_kemc_ke_menu` FOREIGN KEY (`id`) REFERENCES `ke_menu` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='功能菜单和操作资源的对应关系';

-- ----------------------------
-- Records of ke_menu_action
-- ----------------------------
INSERT INTO `ke_menu_action` VALUES ('1', '1', '1');
INSERT INTO `ke_menu_action` VALUES ('2', '1', '2');

-- ----------------------------
-- Table structure for `ke_organ`
-- ----------------------------
DROP TABLE IF EXISTS `ke_organ`;
CREATE TABLE `ke_organ` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `orga_parent_id` int(11) DEFAULT NULL COMMENT '父类编号',
  `orga_name` varchar(255) DEFAULT NULL COMMENT '机构名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='组织机构信息';

-- ----------------------------
-- Records of ke_organ
-- ----------------------------
INSERT INTO `ke_organ` VALUES ('1', '0', '化工材料研究所');
INSERT INTO `ke_organ` VALUES ('2', '1', '办公室');
INSERT INTO `ke_organ` VALUES ('3', '1', '含能材料基因中心');
INSERT INTO `ke_organ` VALUES ('8', '3', '她她她');
INSERT INTO `ke_organ` VALUES ('9', '1', '测试二级');
INSERT INTO `ke_organ` VALUES ('10', '3', '测试四级');
INSERT INTO `ke_organ` VALUES ('11', '8', '翻跟斗广泛的');
INSERT INTO `ke_organ` VALUES ('12', '11', '梵蒂冈');
INSERT INTO `ke_organ` VALUES ('13', '11', '梵蒂冈风格');
INSERT INTO `ke_organ` VALUES ('14', '0', '测试');
INSERT INTO `ke_organ` VALUES ('15', '14', '幅度萨芬');
INSERT INTO `ke_organ` VALUES ('17', '0', '非官方');
INSERT INTO `ke_organ` VALUES ('18', '17', '高富帅');

-- ----------------------------
-- Table structure for `ke_role`
-- ----------------------------
DROP TABLE IF EXISTS `ke_role`;
CREATE TABLE `ke_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `role_name` varchar(45) NOT NULL COMMENT '角色名称',
  `role_desc` varchar(255) DEFAULT NULL COMMENT '角色描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='用角色信息';

-- ----------------------------
-- Records of ke_role
-- ----------------------------
INSERT INTO `ke_role` VALUES ('1', '系统管理员', '系统中的最高级别用户');
INSERT INTO `ke_role` VALUES ('2', '知识管理', '管理知识库系统的用户');
INSERT INTO `ke_role` VALUES ('3', '知识管理元', '管理知识库系统的用户');

-- ----------------------------
-- Table structure for `ke_role_menu`
-- ----------------------------
DROP TABLE IF EXISTS `ke_role_menu`;
CREATE TABLE `ke_role_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ke_rome_ke_menu` (`menu_id`),
  KEY `fk_ke_rome_ke_role` (`role_id`),
  CONSTRAINT `fk_ke_rome_ke_menu` FOREIGN KEY (`menu_id`) REFERENCES `ke_menu` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ke_rome_ke_role` FOREIGN KEY (`role_id`) REFERENCES `ke_role` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8 COMMENT='角色名称和功能菜单的对应关系\r\n';

-- ----------------------------
-- Records of ke_role_menu
-- ----------------------------
INSERT INTO `ke_role_menu` VALUES ('1', '1', '1');
INSERT INTO `ke_role_menu` VALUES ('2', '1', '2');
INSERT INTO `ke_role_menu` VALUES ('3', '1', '3');
INSERT INTO `ke_role_menu` VALUES ('4', '1', '4');
INSERT INTO `ke_role_menu` VALUES ('5', '1', '5');
INSERT INTO `ke_role_menu` VALUES ('6', '1', '6');
INSERT INTO `ke_role_menu` VALUES ('8', '3', '1');
INSERT INTO `ke_role_menu` VALUES ('37', '2', '18');
INSERT INTO `ke_role_menu` VALUES ('44', '1', '20');
INSERT INTO `ke_role_menu` VALUES ('45', '1', '18');
INSERT INTO `ke_role_menu` VALUES ('46', '1', '21');
INSERT INTO `ke_role_menu` VALUES ('47', '1', '22');
INSERT INTO `ke_role_menu` VALUES ('48', '1', '23');
INSERT INTO `ke_role_menu` VALUES ('49', '1', '24');
INSERT INTO `ke_role_menu` VALUES ('50', '1', '25');
INSERT INTO `ke_role_menu` VALUES ('51', '1', '26');
INSERT INTO `ke_role_menu` VALUES ('52', '1', '27');
INSERT INTO `ke_role_menu` VALUES ('53', '1', '28');
INSERT INTO `ke_role_menu` VALUES ('54', '1', '29');
INSERT INTO `ke_role_menu` VALUES ('55', '1', '30');
INSERT INTO `ke_role_menu` VALUES ('56', '1', '31');
INSERT INTO `ke_role_menu` VALUES ('57', '1', '32');
INSERT INTO `ke_role_menu` VALUES ('58', '1', '33');

-- ----------------------------
-- Table structure for `ke_security`
-- ----------------------------
DROP TABLE IF EXISTS `ke_security`;
CREATE TABLE `ke_security` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `secu_name` varchar(45) DEFAULT NULL COMMENT '密级名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='密集信息';

-- ----------------------------
-- Records of ke_security
-- ----------------------------
INSERT INTO `ke_security` VALUES ('1', '公开');
INSERT INTO `ke_security` VALUES ('2', '秘密');
INSERT INTO `ke_security` VALUES ('3', '绝密');

-- ----------------------------
-- Table structure for `ke_session`
-- ----------------------------
DROP TABLE IF EXISTS `ke_session`;
CREATE TABLE `ke_session` (
  `id` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `expire_time` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ke_session
-- ----------------------------
INSERT INTO `ke_session` VALUES ('160fdca4ae3a4e478649c7a1f56ad3d2', '5', '1580093912198');
INSERT INTO `ke_session` VALUES ('1a9ee949cb6d47d29958174e9f89105c', '5', '1580259509646');
INSERT INTO `ke_session` VALUES ('3f3899d4521245b5b46777f77c8c646a', '5', '1580094418986');
INSERT INTO `ke_session` VALUES ('50ba1a4487cd4887968e65e06b9e3c9b', '5', '1580093992304');
INSERT INTO `ke_session` VALUES ('88f8634be9784f48a0e0beafe9ee6f5d', '5', '1580094115643');
INSERT INTO `ke_session` VALUES ('a35e632cb5964d3288a8261f0bff0eb3', '5', '1580094263706');
INSERT INTO `ke_session` VALUES ('ca9b928f9d254b11b719b6aee6cebbcc', '5', '1580095648331');
INSERT INTO `ke_session` VALUES ('d753fadad6a743c2bc17ceffd0e33dfd', '5', '1581595263870');
INSERT INTO `ke_session` VALUES ('dbc9899c3acc4908a4f467f1e04163ee', '5', '1580093525552');
INSERT INTO `ke_session` VALUES ('deef5aad3edd4e1092ca6dc19cfa58da', '5', '1580093354313');
INSERT INTO `ke_session` VALUES ('df2f7c1db9e94c2fb69f7a990ffe264f', '5', '1581643031836');

-- ----------------------------
-- Table structure for `ke_user`
-- ----------------------------
DROP TABLE IF EXISTS `ke_user`;
CREATE TABLE `ke_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_name` varchar(255) NOT NULL COMMENT '登录名',
  `user_passwd` varchar(255) NOT NULL COMMENT '登录密码',
  `user_real_name` varchar(255) DEFAULT NULL COMMENT '真实姓名',
  `user_reg_time` datetime DEFAULT NULL COMMENT '注册时间',
  `user_last_login_time` datetime DEFAULT NULL COMMENT '最后登录时间',
  `user_login_count` int(11) DEFAULT NULL COMMENT '登陆次数',
  `user_orga_id` int(11) DEFAULT NULL COMMENT '所属机构编号',
  `user_role_id` int(11) DEFAULT NULL COMMENT '角色编号',
  `user_security_id` int(11) DEFAULT NULL COMMENT '所属密级编号',
  `user_isenable` bit(1) DEFAULT NULL COMMENT '是否激活标识',
  `user_salt` varchar(33) DEFAULT NULL,
  `user_is_super` bit(1) DEFAULT b'0',
  PRIMARY KEY (`id`),
  KEY `fk_user_orgn` (`user_orga_id`),
  KEY `fk_user_secu` (`user_security_id`),
  KEY `fk_user_role` (`user_role_id`),
  CONSTRAINT `fk_user_orgn` FOREIGN KEY (`user_orga_id`) REFERENCES `ke_organ` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_role` FOREIGN KEY (`user_role_id`) REFERENCES `ke_role` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_secu` FOREIGN KEY (`user_security_id`) REFERENCES `ke_security` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='用户信息';

-- ----------------------------
-- Records of ke_user
-- ----------------------------
INSERT INTO `ke_user` VALUES ('5', 'admin@admin.com', 'e10adc3949ba59abbe56e057f20f883e', 'MrYang', '2017-01-27 09:53:48', '2017-02-16 19:51:42', '1', '3', '1', '3', '', null, '');
INSERT INTO `ke_user` VALUES ('6', 'mryang@yahoo.cn', 'e10adc3949ba59abbe56e057f20f883e', '杨春明', '2017-02-02 13:37:06', null, null, '3', '2', '3', '', null, '');
INSERT INTO `ke_user` VALUES ('8', 'test@test.com', 'e10adc3949ba59abbe56e057f20f883e', '测试账号', '2017-02-02 14:25:29', null, null, '2', '1', '1', '', null, '');
INSERT INTO `ke_user` VALUES ('9', 'test@www.com', 'e10adc3949ba59abbe56e057f20f883e', '测试', '2017-02-02 14:25:54', null, null, '2', '1', '1', '', null, '');
INSERT INTO `ke_user` VALUES ('10', 'r@qq.com', 'e10adc3949ba59abbe56e057f20f883e', '咳咳咳', '2017-02-02 14:27:10', null, null, '2', '1', '1', '', null, '');
INSERT INTO `ke_user` VALUES ('11', 'tt@tt.com', 'e10adc3949ba59abbe56e057f20f883e', '天天', '2017-02-02 14:27:25', null, null, '2', '1', '1', '', null, '');
INSERT INTO `ke_user` VALUES ('12', 'gg@gg.com', 'e10adc3949ba59abbe56e057f20f883e', 'lll ', '2017-02-02 14:51:12', null, null, '2', '1', '1', '', null, '');
INSERT INTO `ke_user` VALUES ('13', 'ghfjhg@qq.com', 'e10adc3949ba59abbe56e057f20f883e', 'fdsaf ', '2017-02-02 14:51:37', null, null, '2', '1', '1', '', null, '');
INSERT INTO `ke_user` VALUES ('14', 'eee@eee.com', 'e10adc3949ba59abbe56e057f20f883e', 'eee', '2017-02-02 15:31:08', null, null, '2', '1', '1', '', null, '');
INSERT INTO `ke_user` VALUES ('15', 'sss@sss.com', 'e10adc3949ba59abbe56e057f20f883e', 'sddd', '2017-02-02 15:31:19', null, null, '2', '1', '1', '', null, '');
INSERT INTO `ke_user` VALUES ('17', 'www@www.com', 'fcea920f7412b5da7be0cf42b8c93759', '发的发', '2017-02-04 09:02:23', null, null, '15', '2', '1', '', null, '');

-- ----------------------------
-- Table structure for `ke_user_log`
-- ----------------------------
DROP TABLE IF EXISTS `ke_user_log`;
CREATE TABLE `ke_user_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `log_user_id` int(11) NOT NULL COMMENT '用户编号',
  `log_desc` varchar(255) NOT NULL COMMENT '操作描述',
  `log_ip` varchar(45) NOT NULL COMMENT '来源IP',
  `log_time` datetime NOT NULL COMMENT '操作时间',
  `log_opt_table` varchar(45) DEFAULT NULL COMMENT '操作表格名称',
  PRIMARY KEY (`id`),
  KEY `fk_log_user` (`log_user_id`),
  CONSTRAINT `fk_log_user` FOREIGN KEY (`log_user_id`) REFERENCES `ke_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4567 DEFAULT CHARSET=utf8 COMMENT='用户操作日志信息';

-- ----------------------------
-- Records of ke_user_log
-- ----------------------------
INSERT INTO `ke_user_log` VALUES ('1', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-27 00:00:00', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-27 11:27:28', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-27 15:24:37', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('4', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-27 15:25:02', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('5', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-27 15:25:02', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('6', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-27 15:28:42', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('7', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-29 08:33:21', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('8', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-29 08:35:50', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('9', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-29 08:40:05', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('10', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-29 08:41:56', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('11', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-29 08:43:11', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('12', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-29 08:51:46', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('13', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-29 08:58:29', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('14', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-29 09:05:34', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('15', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-29 09:07:58', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('16', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-29 09:11:37', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('17', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-29 09:17:22', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('18', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-29 09:20:36', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('19', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-29 09:23:20', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('20', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-29 09:31:18', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('21', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-29 09:35:40', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('22', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-29 09:37:55', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('23', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-29 09:40:00', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('24', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-29 09:42:30', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('25', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-29 09:44:30', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('26', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-29 09:47:29', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('27', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-29 09:51:22', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('28', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-29 09:53:25', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('29', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-29 09:53:52', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('30', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-29 09:55:37', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('31', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-29 09:55:58', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('32', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-29 10:00:46', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('33', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-29 10:03:43', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('34', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-29 10:07:29', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('35', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-29 10:09:02', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('36', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-29 11:23:26', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('37', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-29 11:34:05', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('38', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-29 11:37:50', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('39', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-29 11:40:22', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('40', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-29 11:42:52', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('41', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-29 12:26:39', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('42', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-29 12:29:49', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('43', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-29 12:32:12', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('44', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-30 07:48:14', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('45', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-30 07:50:20', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('46', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-30 07:52:51', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('47', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-30 07:59:41', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('48', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-30 08:02:31', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('49', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-30 08:04:43', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('50', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-30 08:06:48', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('51', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-30 08:11:54', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('52', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-30 08:14:13', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('53', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-30 08:17:07', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('54', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-30 08:26:39', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('55', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-30 08:29:34', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('56', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-30 08:32:12', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('57', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-30 08:35:59', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('58', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-30 08:46:58', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('59', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-30 08:50:20', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('60', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-30 08:52:47', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('61', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-30 08:56:04', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('62', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-30 09:02:00', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('63', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-30 09:04:47', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('64', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-30 09:08:42', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('65', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-30 09:10:44', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('66', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-30 09:13:23', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('67', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-30 09:14:42', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('68', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-30 09:17:00', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('69', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-30 09:19:21', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('70', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-30 09:21:22', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('71', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-30 09:27:07', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('72', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-30 09:30:57', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('73', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-30 09:44:20', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('74', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-30 09:49:53', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('75', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-30 09:59:14', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('76', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-30 10:01:50', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('77', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-30 10:18:43', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('78', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-30 10:21:46', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('79', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-30 10:25:34', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('80', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-30 10:34:27', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('81', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-30 10:39:31', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('82', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-30 10:45:06', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('83', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-30 10:47:33', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('84', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-30 10:50:46', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('85', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-30 10:53:30', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('86', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-30 10:57:16', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('87', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-30 10:59:30', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('88', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-30 11:26:13', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('89', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-30 11:28:39', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('90', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-30 11:30:05', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('91', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-30 11:35:07', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('92', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-30 11:36:52', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('93', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-30 11:39:27', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('94', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-30 11:41:14', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('95', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-30 11:42:56', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('96', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-30 11:43:31', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('97', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-30 11:44:58', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('98', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-30 11:45:58', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('99', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-30 11:48:21', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('100', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-30 11:49:19', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('101', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-30 11:50:35', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('102', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-30 11:58:06', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('103', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-30 11:58:31', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('104', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-30 11:59:30', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('105', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-30 12:01:45', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('106', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-30 12:33:17', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('107', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-30 12:35:22', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('108', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-30 12:37:51', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('109', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-30 12:39:52', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('110', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-30 12:41:25', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('111', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-30 12:44:33', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('112', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-30 12:47:59', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('113', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-30 12:49:56', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('114', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-30 12:51:23', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('115', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-30 12:56:27', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('116', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-30 12:57:27', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('117', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-30 12:59:34', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('118', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-30 12:59:38', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('119', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-30 13:00:27', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('120', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-30 13:02:46', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('121', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-30 13:05:13', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('122', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-30 13:06:43', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('123', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-30 13:10:17', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('124', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-30 13:13:38', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('125', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-31 08:25:07', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('126', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-31 08:37:04', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('127', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-31 08:39:29', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('128', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-31 08:42:00', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('129', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-31 08:44:47', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('130', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-31 08:47:41', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('131', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-31 08:51:10', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('132', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-31 08:55:30', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('133', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-31 08:57:06', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('134', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-31 08:57:50', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('135', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-31 08:59:01', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('136', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-31 08:59:36', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('137', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-31 09:00:40', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('138', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-31 09:01:39', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('139', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-31 09:04:45', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('140', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-31 09:05:20', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('141', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-31 09:07:23', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('142', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-31 09:13:06', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('143', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-31 09:16:02', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('144', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-31 09:27:17', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('145', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-31 09:29:35', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('146', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-31 09:32:51', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('147', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-31 09:37:35', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('148', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-31 09:54:23', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('149', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-31 09:55:27', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('150', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-31 09:58:07', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('151', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-31 10:00:29', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('152', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-31 10:03:59', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('153', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-31 10:08:04', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('154', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-31 10:19:21', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('155', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-31 10:21:45', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('156', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-31 10:27:10', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('157', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-31 10:43:38', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('158', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-31 10:46:04', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('159', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-31 10:48:07', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('160', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-31 10:51:09', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('161', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-31 10:52:01', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('162', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-31 10:54:06', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('163', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-31 10:56:04', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('164', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-31 11:06:03', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('165', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-31 11:13:36', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('166', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-31 11:17:27', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('167', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-31 11:18:01', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('168', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-31 11:23:19', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('169', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-31 11:26:17', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('170', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-31 11:26:57', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('171', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-31 11:27:43', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('172', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-31 11:32:44', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('173', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-31 11:35:50', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('174', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-31 11:37:55', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('175', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-31 11:42:06', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('176', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-31 12:07:28', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('177', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-31 12:09:40', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('178', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-31 12:12:02', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('179', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-31 12:16:58', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('180', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-31 12:19:01', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('181', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-31 12:26:23', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('182', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-31 12:28:48', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('183', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-31 12:30:11', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('184', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-31 12:30:55', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('185', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-31 12:32:17', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('186', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-31 12:34:18', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('187', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-31 12:36:00', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('188', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-31 12:39:27', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('189', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-31 12:42:30', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('190', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-31 12:44:38', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('191', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-31 12:47:12', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('192', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-31 12:49:25', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('193', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-31 12:55:28', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('194', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-31 13:00:09', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('195', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-31 13:31:50', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('196', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-31 13:34:11', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('197', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-31 13:35:59', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('198', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-31 13:38:36', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('199', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-31 13:38:39', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('200', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-31 13:44:04', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('201', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-31 16:55:37', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('202', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-31 16:57:57', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('203', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-31 17:00:03', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('204', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-31 17:02:27', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('205', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-31 17:05:48', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('206', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-31 17:10:27', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('207', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-31 17:23:42', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('208', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-31 17:46:45', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('209', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-31 17:47:27', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('210', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-31 17:50:49', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('211', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-31 17:52:05', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('212', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-31 17:58:43', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('213', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-31 18:00:45', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('214', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-31 18:02:55', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('215', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-31 18:31:32', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('216', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-31 18:32:44', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('217', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-31 18:33:12', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('218', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-31 18:35:43', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('219', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-31 18:39:50', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('220', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-31 18:42:13', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('221', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-31 18:42:54', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('222', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-31 18:46:52', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('223', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-01-31 18:49:23', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('224', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-01 08:29:52', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('225', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-01 08:38:10', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('226', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-01 08:38:53', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('227', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-01 08:41:08', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('228', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-01 08:45:26', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('229', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-01 08:53:02', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('230', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-01 08:57:26', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('231', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-01 08:59:28', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('232', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-01 09:07:32', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('233', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-01 09:11:01', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('234', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-01 09:20:29', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('235', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-01 09:22:48', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('236', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-01 09:26:41', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('237', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-01 09:29:01', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('238', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-01 09:31:30', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('239', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-01 09:33:44', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('240', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-01 09:46:33', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('241', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-01 09:47:19', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('242', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-01 09:48:09', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('243', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-01 10:14:15', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('244', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-01 10:15:57', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('245', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-01 12:06:39', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('246', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-02 07:54:24', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('247', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-02 07:56:55', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('248', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-02 07:59:07', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('249', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-02 08:01:57', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('250', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-02 08:04:06', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('251', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-02 08:06:14', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('252', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-02 08:08:35', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('253', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-02 08:11:05', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('254', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-02 08:13:44', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('255', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-02 08:17:20', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('256', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-02 08:30:33', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('257', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-02 08:34:13', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('258', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-02 09:08:37', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('259', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-02 09:10:18', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('260', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-02 09:10:44', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('261', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-02 09:21:57', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('262', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-02 09:24:48', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('263', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-02 09:27:42', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('264', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-02 09:28:51', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('265', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-02 09:33:05', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('266', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-02 09:35:06', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('267', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-02 09:39:40', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('268', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-02 10:00:05', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('269', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-02 10:01:07', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('270', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-02 10:02:05', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('271', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-02 10:05:43', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('272', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-02 11:26:39', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('273', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-02 11:27:17', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('274', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-02 11:29:16', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('275', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-02 11:34:56', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('276', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-02 11:36:28', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('277', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-02 11:38:02', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('278', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-02 11:39:24', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('279', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-02 11:39:53', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('280', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-02 12:04:14', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('281', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-02 12:06:59', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('282', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-02 12:26:22', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('283', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-02 12:28:25', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('284', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-02 12:34:59', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('285', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-02 13:02:47', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('286', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-02 13:04:14', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('287', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-02 13:05:31', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('288', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-02 13:11:23', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('289', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-02 13:13:36', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('290', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-02 13:15:39', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('291', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-02 13:20:33', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('292', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-02 13:21:34', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('293', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-02 13:22:53', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('294', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-02 13:25:12', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('295', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-02 13:27:38', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('296', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-02 13:29:51', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('297', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-02 13:31:47', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('298', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-02 13:35:07', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('299', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-02 13:37:15', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('300', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-02 13:40:11', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('301', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-02 13:44:30', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('302', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-02 13:57:08', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('303', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-02 13:59:18', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('304', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-02 14:01:13', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('305', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-02 14:05:49', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('306', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-02 14:06:41', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('307', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-02 14:17:56', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('308', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-02 14:20:24', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('309', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-02 14:23:44', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('310', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-02 14:25:54', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('311', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-02 14:29:18', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('312', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-02 14:31:50', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('313', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-02 14:33:55', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('314', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-02 14:36:18', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('315', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-02 14:38:29', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('316', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-02 14:40:56', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('317', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-02 14:47:34', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('318', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-02 14:49:50', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('319', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-02 14:52:22', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('320', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-02 14:55:42', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('321', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-02 14:57:44', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('322', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-02 15:00:42', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('323', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-02 15:07:23', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('324', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-02 15:11:46', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('325', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-02 15:13:55', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('326', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-02 15:17:32', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('327', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-02 15:19:38', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('328', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-02 15:21:43', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('329', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-02 15:23:56', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('330', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-02 15:28:03', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('331', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-02 15:30:06', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('332', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-02 15:32:06', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('333', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-02 15:34:07', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('334', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-02 15:36:07', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('335', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-02 15:37:48', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('336', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-02 15:37:55', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('337', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-02 17:13:07', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('338', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-02 17:15:35', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('339', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-02 17:18:28', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('340', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-02 17:21:45', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('341', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-02 17:22:07', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('342', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-02 17:46:04', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('343', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-02 17:48:25', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('344', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-02 17:51:20', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('345', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-02 17:53:28', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('346', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-02 17:55:36', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('347', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-02 18:04:54', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('348', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-02 18:12:01', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('349', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-02 18:13:35', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('350', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-02 18:18:56', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('351', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-02 18:23:14', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('352', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-02 18:25:18', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('353', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-02 18:28:14', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('354', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-02 18:30:44', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('355', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-02 18:33:28', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('356', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-02 18:39:42', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('357', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-02 18:44:48', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('358', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-02 18:49:17', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('359', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-02 18:52:54', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('360', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-02 18:55:41', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('361', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-02 18:57:43', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('362', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-02 19:01:49', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('363', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-02 19:03:10', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('364', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-02 19:03:47', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('365', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-02 19:10:28', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('366', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-02 19:11:32', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('367', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-02 19:12:14', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('368', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-02 19:15:39', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('369', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-02 19:17:16', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('370', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-02 19:19:18', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('371', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-02 19:21:49', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('372', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-02 19:23:53', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('373', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-02 19:25:53', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('374', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-02 19:27:56', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('375', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-02 19:31:18', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('376', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-02 19:33:21', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('377', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-02 19:59:49', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('378', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-02 20:04:54', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('379', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-02 20:09:10', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('380', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-02 20:11:22', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('381', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-03 08:38:52', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('382', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-03 08:43:19', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('383', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-03 08:53:26', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('384', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-03 10:57:38', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('385', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-03 11:00:21', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('386', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-03 11:02:36', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('387', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-03 11:05:51', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('388', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-03 11:08:50', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('389', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-03 11:12:36', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('390', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-03 11:16:03', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('391', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-03 11:20:49', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('392', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-03 11:22:36', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('393', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-03 11:27:49', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('394', '5', '/admin/user', '0:0:0:0:0:0:0:1', '2017-02-03 11:27:49', 'index');
INSERT INTO `ke_user_log` VALUES ('395', '5', '/admin/user/save', '0:0:0:0:0:0:0:1', '2017-02-03 11:28:30', 'save');
INSERT INTO `ke_user_log` VALUES ('396', '5', '/admin/user/del', '0:0:0:0:0:0:0:1', '2017-02-03 11:28:41', 'del');
INSERT INTO `ke_user_log` VALUES ('397', '5', '/admin/user', '0:0:0:0:0:0:0:1', '2017-02-03 11:28:41', 'index');
INSERT INTO `ke_user_log` VALUES ('398', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-03 11:31:47', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('399', '5', '/admin/user', '0:0:0:0:0:0:0:1', '2017-02-03 11:31:47', 'index');
INSERT INTO `ke_user_log` VALUES ('400', '5', '/admin/user', '0:0:0:0:0:0:0:1', '2017-02-03 11:31:50', 'index');
INSERT INTO `ke_user_log` VALUES ('401', '5', '/admin/user', '0:0:0:0:0:0:0:1', '2017-02-03 11:31:52', 'index');
INSERT INTO `ke_user_log` VALUES ('402', '5', '/admin/user', '0:0:0:0:0:0:0:1', '2017-02-03 11:31:54', 'index');
INSERT INTO `ke_user_log` VALUES ('403', '5', '/admin/role', '0:0:0:0:0:0:0:1', '2017-02-03 11:31:57', 'index');
INSERT INTO `ke_user_log` VALUES ('404', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-03 11:31:57', 'index');
INSERT INTO `ke_user_log` VALUES ('405', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-03 11:42:00', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('406', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-03 11:42:00', 'index');
INSERT INTO `ke_user_log` VALUES ('407', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-03 11:42:01', 'index');
INSERT INTO `ke_user_log` VALUES ('408', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-03 11:43:01', 'index');
INSERT INTO `ke_user_log` VALUES ('409', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-03 11:43:49', 'index');
INSERT INTO `ke_user_log` VALUES ('410', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-03 11:44:23', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('411', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-03 11:44:23', 'index');
INSERT INTO `ke_user_log` VALUES ('412', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-03 11:44:28', 'index');
INSERT INTO `ke_user_log` VALUES ('413', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-03 11:44:53', 'index');
INSERT INTO `ke_user_log` VALUES ('414', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-03 11:45:27', 'index');
INSERT INTO `ke_user_log` VALUES ('415', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-03 11:46:34', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('416', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-03 11:46:34', 'index');
INSERT INTO `ke_user_log` VALUES ('417', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-03 11:46:45', 'index');
INSERT INTO `ke_user_log` VALUES ('418', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-03 11:47:06', 'index');
INSERT INTO `ke_user_log` VALUES ('419', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-03 11:47:32', 'index');
INSERT INTO `ke_user_log` VALUES ('420', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-03 11:47:33', 'index');
INSERT INTO `ke_user_log` VALUES ('421', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-03 11:48:02', 'index');
INSERT INTO `ke_user_log` VALUES ('422', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-03 11:59:47', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('423', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-03 11:59:47', 'index');
INSERT INTO `ke_user_log` VALUES ('424', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-03 11:59:49', 'index');
INSERT INTO `ke_user_log` VALUES ('425', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-03 11:59:50', 'index');
INSERT INTO `ke_user_log` VALUES ('426', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-03 11:59:57', 'index');
INSERT INTO `ke_user_log` VALUES ('427', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-03 12:01:03', 'index');
INSERT INTO `ke_user_log` VALUES ('428', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-03 12:01:12', 'index');
INSERT INTO `ke_user_log` VALUES ('429', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-03 12:01:13', 'index');
INSERT INTO `ke_user_log` VALUES ('430', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-03 12:01:56', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('431', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-03 12:01:56', 'index');
INSERT INTO `ke_user_log` VALUES ('432', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-03 12:01:57', 'index');
INSERT INTO `ke_user_log` VALUES ('433', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-03 12:01:58', 'index');
INSERT INTO `ke_user_log` VALUES ('434', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-03 12:02:47', 'index');
INSERT INTO `ke_user_log` VALUES ('435', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-03 12:02:48', 'index');
INSERT INTO `ke_user_log` VALUES ('436', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-03 12:04:15', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('437', '5', '/admin/organ/save', '0:0:0:0:0:0:0:1', '2017-02-03 12:04:15', 'save');
INSERT INTO `ke_user_log` VALUES ('438', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-03 12:04:15', 'index');
INSERT INTO `ke_user_log` VALUES ('439', '5', '/admin/organ/save', '0:0:0:0:0:0:0:1', '2017-02-03 12:04:22', 'save');
INSERT INTO `ke_user_log` VALUES ('440', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-03 12:04:22', 'index');
INSERT INTO `ke_user_log` VALUES ('441', '5', '/admin/organ/save', '0:0:0:0:0:0:0:1', '2017-02-03 12:04:29', 'save');
INSERT INTO `ke_user_log` VALUES ('442', '5', '/admin/organ/save', '0:0:0:0:0:0:0:1', '2017-02-03 12:04:33', 'save');
INSERT INTO `ke_user_log` VALUES ('443', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-03 12:04:33', 'index');
INSERT INTO `ke_user_log` VALUES ('444', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-03 12:05:53', 'index');
INSERT INTO `ke_user_log` VALUES ('445', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-03 12:05:54', 'index');
INSERT INTO `ke_user_log` VALUES ('446', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-03 12:07:17', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('447', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-03 12:07:17', 'index');
INSERT INTO `ke_user_log` VALUES ('448', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-03 12:08:19', 'index');
INSERT INTO `ke_user_log` VALUES ('449', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-03 12:08:20', 'index');
INSERT INTO `ke_user_log` VALUES ('450', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-03 12:08:21', 'index');
INSERT INTO `ke_user_log` VALUES ('451', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-03 12:08:48', 'index');
INSERT INTO `ke_user_log` VALUES ('452', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-03 12:09:20', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('453', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-03 12:09:20', 'index');
INSERT INTO `ke_user_log` VALUES ('454', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-03 12:09:22', 'index');
INSERT INTO `ke_user_log` VALUES ('455', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-03 12:09:46', 'index');
INSERT INTO `ke_user_log` VALUES ('456', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-03 12:09:49', 'index');
INSERT INTO `ke_user_log` VALUES ('457', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-03 12:10:46', 'index');
INSERT INTO `ke_user_log` VALUES ('458', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-03 12:10:47', 'index');
INSERT INTO `ke_user_log` VALUES ('459', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-03 12:10:49', 'index');
INSERT INTO `ke_user_log` VALUES ('460', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-03 12:10:51', 'index');
INSERT INTO `ke_user_log` VALUES ('461', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-03 12:10:53', 'index');
INSERT INTO `ke_user_log` VALUES ('462', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-03 12:10:53', 'index');
INSERT INTO `ke_user_log` VALUES ('463', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-03 12:10:54', 'index');
INSERT INTO `ke_user_log` VALUES ('464', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-03 12:10:54', 'index');
INSERT INTO `ke_user_log` VALUES ('465', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-03 12:11:47', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('466', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-03 12:11:47', 'index');
INSERT INTO `ke_user_log` VALUES ('467', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-03 12:11:49', 'index');
INSERT INTO `ke_user_log` VALUES ('468', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-03 12:11:50', 'index');
INSERT INTO `ke_user_log` VALUES ('469', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-03 12:11:50', 'index');
INSERT INTO `ke_user_log` VALUES ('470', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-03 12:11:50', 'index');
INSERT INTO `ke_user_log` VALUES ('471', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-03 12:11:52', 'index');
INSERT INTO `ke_user_log` VALUES ('472', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-03 12:11:53', 'index');
INSERT INTO `ke_user_log` VALUES ('473', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-03 12:11:53', 'index');
INSERT INTO `ke_user_log` VALUES ('474', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-03 12:11:53', 'index');
INSERT INTO `ke_user_log` VALUES ('475', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-03 12:11:54', 'index');
INSERT INTO `ke_user_log` VALUES ('476', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-03 12:11:55', 'index');
INSERT INTO `ke_user_log` VALUES ('477', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-03 12:11:55', 'index');
INSERT INTO `ke_user_log` VALUES ('478', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-03 12:11:55', 'index');
INSERT INTO `ke_user_log` VALUES ('479', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-03 12:11:56', 'index');
INSERT INTO `ke_user_log` VALUES ('480', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-03 12:11:56', 'index');
INSERT INTO `ke_user_log` VALUES ('481', '5', '/admin/role', '0:0:0:0:0:0:0:1', '2017-02-03 12:11:57', 'index');
INSERT INTO `ke_user_log` VALUES ('482', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-03 12:11:58', 'index');
INSERT INTO `ke_user_log` VALUES ('483', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-03 12:12:00', 'index');
INSERT INTO `ke_user_log` VALUES ('484', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-03 12:12:01', 'index');
INSERT INTO `ke_user_log` VALUES ('485', '5', '/admin/role', '0:0:0:0:0:0:0:1', '2017-02-03 12:12:02', 'index');
INSERT INTO `ke_user_log` VALUES ('486', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-03 12:12:03', 'index');
INSERT INTO `ke_user_log` VALUES ('487', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-03 12:12:30', 'index');
INSERT INTO `ke_user_log` VALUES ('488', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-03 12:12:31', 'index');
INSERT INTO `ke_user_log` VALUES ('489', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-03 12:13:06', 'index');
INSERT INTO `ke_user_log` VALUES ('490', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-03 12:13:07', 'index');
INSERT INTO `ke_user_log` VALUES ('491', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-03 12:14:04', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('492', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-03 12:14:04', 'index');
INSERT INTO `ke_user_log` VALUES ('493', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-03 12:14:06', 'index');
INSERT INTO `ke_user_log` VALUES ('494', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-03 12:14:08', 'index');
INSERT INTO `ke_user_log` VALUES ('495', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-03 12:15:08', 'index');
INSERT INTO `ke_user_log` VALUES ('496', '5', '/admin/organ/save', '0:0:0:0:0:0:0:1', '2017-02-03 12:15:53', 'save');
INSERT INTO `ke_user_log` VALUES ('497', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-03 12:15:53', 'index');
INSERT INTO `ke_user_log` VALUES ('498', '5', '/admin/organ/save', '0:0:0:0:0:0:0:1', '2017-02-03 12:16:00', 'save');
INSERT INTO `ke_user_log` VALUES ('499', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-03 12:16:00', 'index');
INSERT INTO `ke_user_log` VALUES ('500', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-03 12:16:05', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('501', '5', '/admin/organ/save', '0:0:0:0:0:0:0:1', '2017-02-03 12:16:05', 'save');
INSERT INTO `ke_user_log` VALUES ('502', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-03 12:16:05', 'index');
INSERT INTO `ke_user_log` VALUES ('503', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-03 12:19:51', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('504', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-03 12:19:51', 'index');
INSERT INTO `ke_user_log` VALUES ('505', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-03 12:19:52', 'index');
INSERT INTO `ke_user_log` VALUES ('506', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-03 12:32:04', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('507', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-03 12:32:04', 'index');
INSERT INTO `ke_user_log` VALUES ('508', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-03 12:32:30', 'index');
INSERT INTO `ke_user_log` VALUES ('509', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-03 12:33:29', 'index');
INSERT INTO `ke_user_log` VALUES ('510', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-03 12:33:29', 'index');
INSERT INTO `ke_user_log` VALUES ('511', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-03 12:34:34', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('512', '5', '/admin/user', '0:0:0:0:0:0:0:1', '2017-02-03 12:34:34', 'index');
INSERT INTO `ke_user_log` VALUES ('513', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-03 12:34:35', 'index');
INSERT INTO `ke_user_log` VALUES ('514', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-03 12:34:44', 'index');
INSERT INTO `ke_user_log` VALUES ('515', '5', '/admin/role', '0:0:0:0:0:0:0:1', '2017-02-03 12:34:45', 'index');
INSERT INTO `ke_user_log` VALUES ('516', '5', '/admin/user', '0:0:0:0:0:0:0:1', '2017-02-03 12:34:45', 'index');
INSERT INTO `ke_user_log` VALUES ('517', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-04 08:18:49', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('518', '5', '/admin', '0:0:0:0:0:0:0:1', '2017-02-04 08:18:52', 'index');
INSERT INTO `ke_user_log` VALUES ('519', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-04 08:19:02', 'index');
INSERT INTO `ke_user_log` VALUES ('520', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-04 08:21:26', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('521', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-04 08:21:26', 'index');
INSERT INTO `ke_user_log` VALUES ('522', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-04 08:21:27', 'index');
INSERT INTO `ke_user_log` VALUES ('523', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-04 08:26:02', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('524', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-04 08:26:02', 'index');
INSERT INTO `ke_user_log` VALUES ('525', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-04 08:26:02', 'index');
INSERT INTO `ke_user_log` VALUES ('526', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-04 08:26:58', 'index');
INSERT INTO `ke_user_log` VALUES ('527', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-04 08:26:59', 'index');
INSERT INTO `ke_user_log` VALUES ('528', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-04 08:27:19', 'index');
INSERT INTO `ke_user_log` VALUES ('529', '5', '/admin/role', '0:0:0:0:0:0:0:1', '2017-02-04 08:27:30', 'index');
INSERT INTO `ke_user_log` VALUES ('530', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-04 08:27:32', 'index');
INSERT INTO `ke_user_log` VALUES ('532', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-04 08:30:14', 'index');
INSERT INTO `ke_user_log` VALUES ('533', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-04 08:30:15', 'index');
INSERT INTO `ke_user_log` VALUES ('534', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-04 08:30:32', 'index');
INSERT INTO `ke_user_log` VALUES ('535', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-04 08:30:37', 'index');
INSERT INTO `ke_user_log` VALUES ('536', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-04 08:30:40', 'index');
INSERT INTO `ke_user_log` VALUES ('538', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-04 08:36:09', 'index');
INSERT INTO `ke_user_log` VALUES ('539', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-04 08:36:10', 'index');
INSERT INTO `ke_user_log` VALUES ('540', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-04 08:36:11', 'index');
INSERT INTO `ke_user_log` VALUES ('541', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-04 08:36:48', 'index');
INSERT INTO `ke_user_log` VALUES ('542', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-04 08:36:49', 'index');
INSERT INTO `ke_user_log` VALUES ('543', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-04 08:36:50', 'index');
INSERT INTO `ke_user_log` VALUES ('544', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-04 08:36:51', 'index');
INSERT INTO `ke_user_log` VALUES ('545', '5', '/admin/role', '0:0:0:0:0:0:0:1', '2017-02-04 08:36:52', 'index');
INSERT INTO `ke_user_log` VALUES ('546', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-04 08:36:53', 'index');
INSERT INTO `ke_user_log` VALUES ('547', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-04 08:46:40', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('548', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-04 08:46:40', 'index');
INSERT INTO `ke_user_log` VALUES ('549', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-04 08:46:40', 'index');
INSERT INTO `ke_user_log` VALUES ('550', '5', '/admin/organ/save', '0:0:0:0:0:0:0:1', '2017-02-04 08:46:48', 'save');
INSERT INTO `ke_user_log` VALUES ('551', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-04 08:46:48', 'index');
INSERT INTO `ke_user_log` VALUES ('552', '5', '/admin/organ/save', '0:0:0:0:0:0:0:1', '2017-02-04 08:46:55', 'save');
INSERT INTO `ke_user_log` VALUES ('553', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-04 08:46:55', 'index');
INSERT INTO `ke_user_log` VALUES ('554', '5', '/admin/organ/save', '0:0:0:0:0:0:0:1', '2017-02-04 08:47:01', 'save');
INSERT INTO `ke_user_log` VALUES ('555', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-04 08:47:01', 'index');
INSERT INTO `ke_user_log` VALUES ('556', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-04 08:47:40', 'index');
INSERT INTO `ke_user_log` VALUES ('557', '5', '/admin/organ/getOrganById', '0:0:0:0:0:0:0:1', '2017-02-04 08:47:44', 'getOrganById');
INSERT INTO `ke_user_log` VALUES ('558', '5', '/admin/organ/save', '0:0:0:0:0:0:0:1', '2017-02-04 08:47:49', 'save');
INSERT INTO `ke_user_log` VALUES ('559', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-04 08:47:49', 'index');
INSERT INTO `ke_user_log` VALUES ('560', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-04 08:48:16', 'index');
INSERT INTO `ke_user_log` VALUES ('561', '5', '/admin/organ/del', '0:0:0:0:0:0:0:1', '2017-02-04 08:48:22', 'del');
INSERT INTO `ke_user_log` VALUES ('562', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-04 08:48:22', 'index');
INSERT INTO `ke_user_log` VALUES ('563', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-04 08:48:43', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('564', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-04 08:48:43', 'index');
INSERT INTO `ke_user_log` VALUES ('565', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-04 08:49:05', 'index');
INSERT INTO `ke_user_log` VALUES ('566', '5', '/admin/role', '0:0:0:0:0:0:0:1', '2017-02-04 08:49:06', 'index');
INSERT INTO `ke_user_log` VALUES ('567', '5', '/admin/role/getRoleById', '0:0:0:0:0:0:0:1', '2017-02-04 08:50:17', 'getRoleById');
INSERT INTO `ke_user_log` VALUES ('568', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-04 08:53:04', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('569', '5', '/admin/role', '0:0:0:0:0:0:0:1', '2017-02-04 08:53:04', 'index');
INSERT INTO `ke_user_log` VALUES ('570', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-04 08:56:07', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('571', '5', '/admin/role', '0:0:0:0:0:0:0:1', '2017-02-04 08:56:07', 'index');
INSERT INTO `ke_user_log` VALUES ('572', '5', '/admin/role', '0:0:0:0:0:0:0:1', '2017-02-04 08:56:08', 'index');
INSERT INTO `ke_user_log` VALUES ('573', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-04 08:56:13', 'index');
INSERT INTO `ke_user_log` VALUES ('574', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-04 08:56:42', 'index');
INSERT INTO `ke_user_log` VALUES ('575', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-04 08:56:43', 'index');
INSERT INTO `ke_user_log` VALUES ('576', '5', '/admin/role', '0:0:0:0:0:0:0:1', '2017-02-04 08:56:46', 'index');
INSERT INTO `ke_user_log` VALUES ('577', '5', '/admin/role/save', '0:0:0:0:0:0:0:1', '2017-02-04 08:57:05', 'save');
INSERT INTO `ke_user_log` VALUES ('578', '5', '/admin/role', '0:0:0:0:0:0:0:1', '2017-02-04 08:57:05', 'index');
INSERT INTO `ke_user_log` VALUES ('579', '5', '/admin/role/getRoleById', '0:0:0:0:0:0:0:1', '2017-02-04 08:57:09', 'getRoleById');
INSERT INTO `ke_user_log` VALUES ('580', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-04 08:58:52', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('581', '5', '/admin/role', '0:0:0:0:0:0:0:1', '2017-02-04 08:58:52', 'index');
INSERT INTO `ke_user_log` VALUES ('582', '5', '/admin/role', '0:0:0:0:0:0:0:1', '2017-02-04 08:58:52', 'index');
INSERT INTO `ke_user_log` VALUES ('583', '5', '/admin/role/getRoleById', '0:0:0:0:0:0:0:1', '2017-02-04 08:58:54', 'getRoleById');
INSERT INTO `ke_user_log` VALUES ('584', '5', '/admin/role', '0:0:0:0:0:0:0:1', '2017-02-04 08:59:38', 'index');
INSERT INTO `ke_user_log` VALUES ('585', '5', '/admin/role/getRoleById', '0:0:0:0:0:0:0:1', '2017-02-04 08:59:41', 'getRoleById');
INSERT INTO `ke_user_log` VALUES ('586', '5', '/admin/role/del', '0:0:0:0:0:0:0:1', '2017-02-04 08:59:49', 'del');
INSERT INTO `ke_user_log` VALUES ('587', '5', '/admin/role', '0:0:0:0:0:0:0:1', '2017-02-04 08:59:49', 'index');
INSERT INTO `ke_user_log` VALUES ('588', '5', '/admin/user', '0:0:0:0:0:0:0:1', '2017-02-04 08:59:52', 'index');
INSERT INTO `ke_user_log` VALUES ('589', '5', '/admin/role', '0:0:0:0:0:0:0:1', '2017-02-04 08:59:54', 'index');
INSERT INTO `ke_user_log` VALUES ('590', '5', '/admin/user', '0:0:0:0:0:0:0:1', '2017-02-04 08:59:55', 'index');
INSERT INTO `ke_user_log` VALUES ('591', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-04 09:01:32', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('592', '5', '/admin/user', '0:0:0:0:0:0:0:1', '2017-02-04 09:01:32', 'index');
INSERT INTO `ke_user_log` VALUES ('593', '5', '/admin/user', '0:0:0:0:0:0:0:1', '2017-02-04 09:01:56', 'index');
INSERT INTO `ke_user_log` VALUES ('594', '5', '/admin/user', '0:0:0:0:0:0:0:1', '2017-02-04 09:01:57', 'index');
INSERT INTO `ke_user_log` VALUES ('595', '5', '/admin/user/save', '0:0:0:0:0:0:0:1', '2017-02-04 09:02:23', 'save');
INSERT INTO `ke_user_log` VALUES ('596', '5', '/admin/user', '0:0:0:0:0:0:0:1', '2017-02-04 09:02:23', 'index');
INSERT INTO `ke_user_log` VALUES ('597', '5', '/admin/user', '0:0:0:0:0:0:0:1', '2017-02-04 09:02:29', 'index');
INSERT INTO `ke_user_log` VALUES ('598', '5', '/admin/user', '0:0:0:0:0:0:0:1', '2017-02-04 09:02:31', 'index');
INSERT INTO `ke_user_log` VALUES ('599', '5', '/admin/user', '0:0:0:0:0:0:0:1', '2017-02-04 09:02:33', 'index');
INSERT INTO `ke_user_log` VALUES ('600', '5', '/admin/user', '0:0:0:0:0:0:0:1', '2017-02-04 09:02:35', 'index');
INSERT INTO `ke_user_log` VALUES ('601', '5', '/admin/user', '0:0:0:0:0:0:0:1', '2017-02-04 09:03:12', 'index');
INSERT INTO `ke_user_log` VALUES ('602', '5', '/admin/role', '0:0:0:0:0:0:0:1', '2017-02-04 09:03:13', 'index');
INSERT INTO `ke_user_log` VALUES ('603', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-04 09:03:14', 'index');
INSERT INTO `ke_user_log` VALUES ('604', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-04 09:03:17', 'index');
INSERT INTO `ke_user_log` VALUES ('605', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-04 09:09:59', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('606', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-04 09:09:59', 'index');
INSERT INTO `ke_user_log` VALUES ('607', '5', '/admin/menu/reOrder', '0:0:0:0:0:0:0:1', '2017-02-04 09:10:07', 'reOrder');
INSERT INTO `ke_user_log` VALUES ('608', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-04 09:10:07', 'index');
INSERT INTO `ke_user_log` VALUES ('609', '5', '/admin/menu/reOrder', '0:0:0:0:0:0:0:1', '2017-02-04 09:10:08', 'reOrder');
INSERT INTO `ke_user_log` VALUES ('610', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-04 09:10:08', 'index');
INSERT INTO `ke_user_log` VALUES ('611', '5', '/admin/menu/reOrder', '0:0:0:0:0:0:0:1', '2017-02-04 09:10:11', 'reOrder');
INSERT INTO `ke_user_log` VALUES ('612', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-04 09:10:11', 'index');
INSERT INTO `ke_user_log` VALUES ('613', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-04 09:10:51', 'index');
INSERT INTO `ke_user_log` VALUES ('614', '5', '/admin/menu/reOrder', '0:0:0:0:0:0:0:1', '2017-02-04 09:10:57', 'reOrder');
INSERT INTO `ke_user_log` VALUES ('615', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-04 09:10:57', 'index');
INSERT INTO `ke_user_log` VALUES ('616', '5', '/admin/menu/reOrder', '0:0:0:0:0:0:0:1', '2017-02-04 09:11:02', 'reOrder');
INSERT INTO `ke_user_log` VALUES ('617', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-04 09:11:02', 'index');
INSERT INTO `ke_user_log` VALUES ('618', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-04 09:11:12', 'index');
INSERT INTO `ke_user_log` VALUES ('619', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-04 09:13:42', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('620', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-04 09:13:42', 'index');
INSERT INTO `ke_user_log` VALUES ('621', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-04 09:14:02', 'index');
INSERT INTO `ke_user_log` VALUES ('622', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-04 09:14:03', 'index');
INSERT INTO `ke_user_log` VALUES ('623', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-04 09:14:22', 'index');
INSERT INTO `ke_user_log` VALUES ('624', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-04 09:14:32', 'index');
INSERT INTO `ke_user_log` VALUES ('625', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-04 09:18:29', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('626', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-04 09:18:29', 'index');
INSERT INTO `ke_user_log` VALUES ('627', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-04 09:18:31', 'index');
INSERT INTO `ke_user_log` VALUES ('628', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-04 09:18:36', 'index');
INSERT INTO `ke_user_log` VALUES ('629', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-04 09:18:36', 'index');
INSERT INTO `ke_user_log` VALUES ('630', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-04 09:18:52', 'index');
INSERT INTO `ke_user_log` VALUES ('631', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-04 09:20:28', 'index');
INSERT INTO `ke_user_log` VALUES ('632', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-04 09:20:33', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('633', '5', '/admin/menu/reOrder', '0:0:0:0:0:0:0:1', '2017-02-04 09:20:33', 'reOrder');
INSERT INTO `ke_user_log` VALUES ('634', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-04 09:20:33', 'index');
INSERT INTO `ke_user_log` VALUES ('635', '5', '/admin/menu/reOrder', '0:0:0:0:0:0:0:1', '2017-02-04 09:20:35', 'reOrder');
INSERT INTO `ke_user_log` VALUES ('636', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-04 09:20:51', 'index');
INSERT INTO `ke_user_log` VALUES ('637', '5', '/admin/menu/reOrder', '0:0:0:0:0:0:0:1', '2017-02-04 09:20:53', 'reOrder');
INSERT INTO `ke_user_log` VALUES ('638', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-04 09:22:19', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('639', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-04 09:22:19', 'index');
INSERT INTO `ke_user_log` VALUES ('640', '5', '/admin/menu/reOrder', '0:0:0:0:0:0:0:1', '2017-02-04 09:22:21', 'reOrder');
INSERT INTO `ke_user_log` VALUES ('641', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-04 09:22:21', 'index');
INSERT INTO `ke_user_log` VALUES ('642', '5', '/admin/menu/reOrder', '0:0:0:0:0:0:0:1', '2017-02-04 09:22:24', 'reOrder');
INSERT INTO `ke_user_log` VALUES ('643', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-04 09:22:24', 'index');
INSERT INTO `ke_user_log` VALUES ('644', '5', '/admin/menu/reOrder', '0:0:0:0:0:0:0:1', '2017-02-04 09:22:25', 'reOrder');
INSERT INTO `ke_user_log` VALUES ('645', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-04 09:22:25', 'index');
INSERT INTO `ke_user_log` VALUES ('646', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-04 09:23:13', 'index');
INSERT INTO `ke_user_log` VALUES ('647', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-04 09:23:14', 'index');
INSERT INTO `ke_user_log` VALUES ('648', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-04 09:23:16', 'index');
INSERT INTO `ke_user_log` VALUES ('649', '5', '/admin/menu/reOrder', '0:0:0:0:0:0:0:1', '2017-02-04 09:23:19', 'reOrder');
INSERT INTO `ke_user_log` VALUES ('650', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-04 09:23:19', 'index');
INSERT INTO `ke_user_log` VALUES ('651', '5', '/admin/menu/reOrder', '0:0:0:0:0:0:0:1', '2017-02-04 09:23:21', 'reOrder');
INSERT INTO `ke_user_log` VALUES ('652', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-04 09:23:21', 'index');
INSERT INTO `ke_user_log` VALUES ('653', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-04 09:23:58', 'index');
INSERT INTO `ke_user_log` VALUES ('654', '5', '/admin/role', '0:0:0:0:0:0:0:1', '2017-02-04 09:23:59', 'index');
INSERT INTO `ke_user_log` VALUES ('655', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-04 09:23:59', 'index');
INSERT INTO `ke_user_log` VALUES ('656', '5', '/admin/user', '0:0:0:0:0:0:0:1', '2017-02-04 09:24:00', 'index');
INSERT INTO `ke_user_log` VALUES ('657', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-04 09:24:02', 'index');
INSERT INTO `ke_user_log` VALUES ('658', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-04 09:25:18', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('659', '5', '/admin/menu/save', '0:0:0:0:0:0:0:1', '2017-02-04 09:25:18', 'save');
INSERT INTO `ke_user_log` VALUES ('660', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-04 09:25:18', 'index');
INSERT INTO `ke_user_log` VALUES ('661', '5', '/admin/role', '0:0:0:0:0:0:0:1', '2017-02-04 09:25:25', 'index');
INSERT INTO `ke_user_log` VALUES ('662', '5', '/admin/role/getRoleById', '0:0:0:0:0:0:0:1', '2017-02-04 09:25:28', 'getRoleById');
INSERT INTO `ke_user_log` VALUES ('663', '5', '/admin/role/save', '0:0:0:0:0:0:0:1', '2017-02-04 09:25:33', 'save');
INSERT INTO `ke_user_log` VALUES ('664', '5', '/admin/role', '0:0:0:0:0:0:0:1', '2017-02-04 09:25:33', 'index');
INSERT INTO `ke_user_log` VALUES ('665', '5', '/admin', '0:0:0:0:0:0:0:1', '2017-02-04 09:25:37', 'index');
INSERT INTO `ke_user_log` VALUES ('666', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-04 09:29:40', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('667', '5', '/admin/user', '0:0:0:0:0:0:0:1', '2017-02-04 09:29:40', 'index');
INSERT INTO `ke_user_log` VALUES ('668', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-04 09:47:29', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('669', '5', '/admin/user', '0:0:0:0:0:0:0:1', '2017-02-04 09:47:29', 'index');
INSERT INTO `ke_user_log` VALUES ('670', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 09:47:31', 'index');
INSERT INTO `ke_user_log` VALUES ('671', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-04 09:50:00', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('672', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 09:50:00', 'index');
INSERT INTO `ke_user_log` VALUES ('673', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 09:50:16', 'index');
INSERT INTO `ke_user_log` VALUES ('674', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 09:50:30', 'index');
INSERT INTO `ke_user_log` VALUES ('675', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 09:50:45', 'index');
INSERT INTO `ke_user_log` VALUES ('676', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-04 09:52:39', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('677', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 09:52:39', 'index');
INSERT INTO `ke_user_log` VALUES ('678', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 09:52:40', 'index');
INSERT INTO `ke_user_log` VALUES ('679', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 09:54:25', 'index');
INSERT INTO `ke_user_log` VALUES ('680', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 09:54:28', 'index');
INSERT INTO `ke_user_log` VALUES ('681', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 09:54:29', 'index');
INSERT INTO `ke_user_log` VALUES ('682', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-04 09:55:00', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('683', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 09:55:00', 'index');
INSERT INTO `ke_user_log` VALUES ('684', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 09:55:01', 'index');
INSERT INTO `ke_user_log` VALUES ('685', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 09:55:01', 'index');
INSERT INTO `ke_user_log` VALUES ('686', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 09:55:02', 'index');
INSERT INTO `ke_user_log` VALUES ('687', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-04 09:57:08', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('688', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 09:57:08', 'index');
INSERT INTO `ke_user_log` VALUES ('689', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 09:57:10', 'index');
INSERT INTO `ke_user_log` VALUES ('690', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 09:57:11', 'index');
INSERT INTO `ke_user_log` VALUES ('691', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 09:57:12', 'index');
INSERT INTO `ke_user_log` VALUES ('692', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 09:57:36', 'index');
INSERT INTO `ke_user_log` VALUES ('693', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-04 10:00:18', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('694', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 10:00:18', 'index');
INSERT INTO `ke_user_log` VALUES ('695', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 10:00:22', 'index');
INSERT INTO `ke_user_log` VALUES ('696', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 10:02:01', 'index');
INSERT INTO `ke_user_log` VALUES ('697', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 10:02:02', 'index');
INSERT INTO `ke_user_log` VALUES ('698', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 10:02:03', 'index');
INSERT INTO `ke_user_log` VALUES ('699', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 10:02:04', 'index');
INSERT INTO `ke_user_log` VALUES ('700', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 10:02:08', 'index');
INSERT INTO `ke_user_log` VALUES ('701', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-04 10:02:37', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('702', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 10:02:37', 'index');
INSERT INTO `ke_user_log` VALUES ('703', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 10:02:38', 'index');
INSERT INTO `ke_user_log` VALUES ('704', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 10:02:39', 'index');
INSERT INTO `ke_user_log` VALUES ('705', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 10:04:36', 'index');
INSERT INTO `ke_user_log` VALUES ('706', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 10:04:37', 'index');
INSERT INTO `ke_user_log` VALUES ('707', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-04 10:04:39', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('708', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 10:04:39', 'index');
INSERT INTO `ke_user_log` VALUES ('709', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 10:04:40', 'index');
INSERT INTO `ke_user_log` VALUES ('710', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 10:04:40', 'index');
INSERT INTO `ke_user_log` VALUES ('711', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 10:04:42', 'index');
INSERT INTO `ke_user_log` VALUES ('712', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 10:04:42', 'index');
INSERT INTO `ke_user_log` VALUES ('713', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 10:04:44', 'index');
INSERT INTO `ke_user_log` VALUES ('714', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 10:04:45', 'index');
INSERT INTO `ke_user_log` VALUES ('715', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 10:04:46', 'index');
INSERT INTO `ke_user_log` VALUES ('716', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-04 10:08:09', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('717', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 10:08:09', 'index');
INSERT INTO `ke_user_log` VALUES ('718', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 10:08:28', 'index');
INSERT INTO `ke_user_log` VALUES ('719', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 10:08:31', 'index');
INSERT INTO `ke_user_log` VALUES ('720', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-04 10:10:21', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('721', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 10:10:21', 'index');
INSERT INTO `ke_user_log` VALUES ('722', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 10:10:25', 'index');
INSERT INTO `ke_user_log` VALUES ('723', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 10:10:34', 'index');
INSERT INTO `ke_user_log` VALUES ('724', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 10:12:02', 'index');
INSERT INTO `ke_user_log` VALUES ('725', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 10:12:03', 'index');
INSERT INTO `ke_user_log` VALUES ('726', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 10:12:05', 'index');
INSERT INTO `ke_user_log` VALUES ('727', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 10:12:08', 'index');
INSERT INTO `ke_user_log` VALUES ('728', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 10:12:10', 'index');
INSERT INTO `ke_user_log` VALUES ('729', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 10:12:12', 'index');
INSERT INTO `ke_user_log` VALUES ('730', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 10:12:14', 'index');
INSERT INTO `ke_user_log` VALUES ('731', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 10:12:16', 'index');
INSERT INTO `ke_user_log` VALUES ('732', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 10:12:17', 'index');
INSERT INTO `ke_user_log` VALUES ('733', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 10:12:18', 'index');
INSERT INTO `ke_user_log` VALUES ('734', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 10:12:20', 'index');
INSERT INTO `ke_user_log` VALUES ('735', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-04 10:12:28', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('736', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 10:12:28', 'index');
INSERT INTO `ke_user_log` VALUES ('737', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 10:13:14', 'index');
INSERT INTO `ke_user_log` VALUES ('738', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 10:13:27', 'index');
INSERT INTO `ke_user_log` VALUES ('739', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 10:14:01', 'index');
INSERT INTO `ke_user_log` VALUES ('740', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 10:14:08', 'index');
INSERT INTO `ke_user_log` VALUES ('741', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-04 10:14:52', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('742', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 10:14:52', 'index');
INSERT INTO `ke_user_log` VALUES ('743', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-04 10:49:33', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('744', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 10:49:33', 'index');
INSERT INTO `ke_user_log` VALUES ('745', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-04 10:52:32', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('746', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 10:52:32', 'index');
INSERT INTO `ke_user_log` VALUES ('747', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 10:52:33', 'index');
INSERT INTO `ke_user_log` VALUES ('748', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-04 10:53:48', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('749', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 10:53:48', 'index');
INSERT INTO `ke_user_log` VALUES ('750', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 10:53:50', 'index');
INSERT INTO `ke_user_log` VALUES ('751', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 10:53:51', 'index');
INSERT INTO `ke_user_log` VALUES ('752', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 10:53:55', 'index');
INSERT INTO `ke_user_log` VALUES ('753', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-04 10:58:19', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('754', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 10:58:19', 'index');
INSERT INTO `ke_user_log` VALUES ('755', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 10:58:22', 'index');
INSERT INTO `ke_user_log` VALUES ('756', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 10:58:34', 'index');
INSERT INTO `ke_user_log` VALUES ('757', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-04 10:59:58', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('758', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 10:59:58', 'index');
INSERT INTO `ke_user_log` VALUES ('759', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 11:00:13', 'index');
INSERT INTO `ke_user_log` VALUES ('760', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 11:00:16', 'index');
INSERT INTO `ke_user_log` VALUES ('761', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 11:00:18', 'index');
INSERT INTO `ke_user_log` VALUES ('762', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 11:00:20', 'index');
INSERT INTO `ke_user_log` VALUES ('763', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 11:01:25', 'index');
INSERT INTO `ke_user_log` VALUES ('764', '5', '/admin/userlog/del', '0:0:0:0:0:0:0:1', '2017-02-04 11:01:34', 'del');
INSERT INTO `ke_user_log` VALUES ('765', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 11:01:34', 'index');
INSERT INTO `ke_user_log` VALUES ('766', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 11:01:40', 'index');
INSERT INTO `ke_user_log` VALUES ('767', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 11:01:44', 'index');
INSERT INTO `ke_user_log` VALUES ('768', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-04 11:06:02', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('769', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 11:06:02', 'index');
INSERT INTO `ke_user_log` VALUES ('770', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-04 11:08:59', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('771', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 11:08:59', 'index');
INSERT INTO `ke_user_log` VALUES ('772', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 11:09:03', 'index');
INSERT INTO `ke_user_log` VALUES ('773', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 11:09:59', 'index');
INSERT INTO `ke_user_log` VALUES ('774', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 11:10:00', 'index');
INSERT INTO `ke_user_log` VALUES ('775', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 11:10:12', 'index');
INSERT INTO `ke_user_log` VALUES ('776', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 11:10:14', 'index');
INSERT INTO `ke_user_log` VALUES ('777', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 11:10:14', 'index');
INSERT INTO `ke_user_log` VALUES ('778', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 11:10:15', 'index');
INSERT INTO `ke_user_log` VALUES ('779', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 11:10:34', 'index');
INSERT INTO `ke_user_log` VALUES ('780', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 11:10:36', 'index');
INSERT INTO `ke_user_log` VALUES ('781', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 11:10:56', 'index');
INSERT INTO `ke_user_log` VALUES ('782', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 11:10:58', 'index');
INSERT INTO `ke_user_log` VALUES ('783', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-04 11:11:18', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('784', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 11:11:18', 'index');
INSERT INTO `ke_user_log` VALUES ('785', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 11:11:33', 'index');
INSERT INTO `ke_user_log` VALUES ('786', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 11:11:35', 'index');
INSERT INTO `ke_user_log` VALUES ('787', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 11:12:44', 'index');
INSERT INTO `ke_user_log` VALUES ('788', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 11:12:45', 'index');
INSERT INTO `ke_user_log` VALUES ('789', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-04 11:13:53', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('790', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 11:13:53', 'index');
INSERT INTO `ke_user_log` VALUES ('791', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 11:14:28', 'index');
INSERT INTO `ke_user_log` VALUES ('792', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 11:15:14', 'index');
INSERT INTO `ke_user_log` VALUES ('793', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-04 11:21:04', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('794', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 11:21:04', 'index');
INSERT INTO `ke_user_log` VALUES ('795', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-04 11:27:50', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('796', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 11:27:50', 'index');
INSERT INTO `ke_user_log` VALUES ('797', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 11:27:51', 'index');
INSERT INTO `ke_user_log` VALUES ('798', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-04 11:30:54', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('799', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 11:30:54', 'index');
INSERT INTO `ke_user_log` VALUES ('800', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 11:30:55', 'index');
INSERT INTO `ke_user_log` VALUES ('801', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 11:32:00', 'index');
INSERT INTO `ke_user_log` VALUES ('802', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 11:32:01', 'index');
INSERT INTO `ke_user_log` VALUES ('803', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 11:32:25', 'index');
INSERT INTO `ke_user_log` VALUES ('804', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 11:32:26', 'index');
INSERT INTO `ke_user_log` VALUES ('805', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-04 11:33:17', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('806', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 11:33:17', 'index');
INSERT INTO `ke_user_log` VALUES ('807', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-04 11:33:18', 'index');
INSERT INTO `ke_user_log` VALUES ('808', '5', '/admin/role', '0:0:0:0:0:0:0:1', '2017-02-04 11:33:22', 'index');
INSERT INTO `ke_user_log` VALUES ('809', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-04 11:33:23', 'index');
INSERT INTO `ke_user_log` VALUES ('810', '5', '/admin/user', '0:0:0:0:0:0:0:1', '2017-02-04 11:33:25', 'index');
INSERT INTO `ke_user_log` VALUES ('811', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 11:33:26', 'index');
INSERT INTO `ke_user_log` VALUES ('812', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-04 11:33:44', 'index');
INSERT INTO `ke_user_log` VALUES ('813', '5', '/admin/menu/reOrder', '0:0:0:0:0:0:0:1', '2017-02-04 11:33:48', 'reOrder');
INSERT INTO `ke_user_log` VALUES ('814', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-04 11:33:48', 'index');
INSERT INTO `ke_user_log` VALUES ('815', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-04 11:33:54', 'index');
INSERT INTO `ke_user_log` VALUES ('816', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-04 11:33:54', 'index');
INSERT INTO `ke_user_log` VALUES ('817', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-04 11:33:55', 'index');
INSERT INTO `ke_user_log` VALUES ('818', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-04 11:34:48', 'index');
INSERT INTO `ke_user_log` VALUES ('819', '5', '/admin/role', '0:0:0:0:0:0:0:1', '2017-02-04 11:34:50', 'index');
INSERT INTO `ke_user_log` VALUES ('820', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-04 11:34:51', 'index');
INSERT INTO `ke_user_log` VALUES ('821', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 11:34:54', 'index');
INSERT INTO `ke_user_log` VALUES ('822', '5', '/admin/user', '0:0:0:0:0:0:0:1', '2017-02-04 11:35:12', 'index');
INSERT INTO `ke_user_log` VALUES ('823', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-04 11:36:26', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('824', '5', '/admin/role', '0:0:0:0:0:0:0:1', '2017-02-04 11:36:26', 'index');
INSERT INTO `ke_user_log` VALUES ('825', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-04 11:36:28', 'index');
INSERT INTO `ke_user_log` VALUES ('826', '5', '/admin/role', '0:0:0:0:0:0:0:1', '2017-02-04 11:36:30', 'index');
INSERT INTO `ke_user_log` VALUES ('827', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-04 11:38:32', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('828', '5', '/admin/user', '0:0:0:0:0:0:0:1', '2017-02-04 11:38:32', 'index');
INSERT INTO `ke_user_log` VALUES ('829', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 11:38:33', 'index');
INSERT INTO `ke_user_log` VALUES ('830', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-04 11:44:51', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('831', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 11:44:51', 'index');
INSERT INTO `ke_user_log` VALUES ('832', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 11:44:52', 'index');
INSERT INTO `ke_user_log` VALUES ('833', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-04 12:11:06', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('834', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 12:11:06', 'index');
INSERT INTO `ke_user_log` VALUES ('835', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 12:11:22', 'index');
INSERT INTO `ke_user_log` VALUES ('836', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 12:11:23', 'index');
INSERT INTO `ke_user_log` VALUES ('837', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 12:12:20', 'index');
INSERT INTO `ke_user_log` VALUES ('838', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 12:12:21', 'index');
INSERT INTO `ke_user_log` VALUES ('839', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-04 12:14:26', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('840', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 12:14:26', 'index');
INSERT INTO `ke_user_log` VALUES ('841', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 12:15:18', 'index');
INSERT INTO `ke_user_log` VALUES ('842', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 12:16:05', 'index');
INSERT INTO `ke_user_log` VALUES ('843', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-04 12:16:42', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('844', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 12:16:42', 'index');
INSERT INTO `ke_user_log` VALUES ('845', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 12:16:57', 'index');
INSERT INTO `ke_user_log` VALUES ('846', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 12:16:58', 'index');
INSERT INTO `ke_user_log` VALUES ('847', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 12:17:10', 'index');
INSERT INTO `ke_user_log` VALUES ('848', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 12:17:31', 'index');
INSERT INTO `ke_user_log` VALUES ('849', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 12:17:32', 'index');
INSERT INTO `ke_user_log` VALUES ('850', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-04 12:33:28', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('851', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 12:33:28', 'index');
INSERT INTO `ke_user_log` VALUES ('852', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 12:33:49', 'index');
INSERT INTO `ke_user_log` VALUES ('853', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 12:35:23', 'index');
INSERT INTO `ke_user_log` VALUES ('854', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-04 12:36:39', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('855', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 12:36:39', 'index');
INSERT INTO `ke_user_log` VALUES ('856', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 12:37:18', 'index');
INSERT INTO `ke_user_log` VALUES ('857', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-04 12:39:25', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('858', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 12:39:25', 'index');
INSERT INTO `ke_user_log` VALUES ('859', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 12:39:30', 'index');
INSERT INTO `ke_user_log` VALUES ('860', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 12:41:18', 'index');
INSERT INTO `ke_user_log` VALUES ('861', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-04 12:41:41', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('862', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 12:41:41', 'index');
INSERT INTO `ke_user_log` VALUES ('863', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 12:43:14', 'index');
INSERT INTO `ke_user_log` VALUES ('864', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 12:43:17', 'index');
INSERT INTO `ke_user_log` VALUES ('865', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-04 12:43:19', 'index');
INSERT INTO `ke_user_log` VALUES ('866', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-04 12:44:31', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('867', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-04 12:44:31', 'index');
INSERT INTO `ke_user_log` VALUES ('868', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-04 12:44:33', 'index');
INSERT INTO `ke_user_log` VALUES ('869', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-04 12:44:34', 'index');
INSERT INTO `ke_user_log` VALUES ('870', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-04 12:44:35', 'index');
INSERT INTO `ke_user_log` VALUES ('871', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-04 12:47:12', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('872', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-04 12:47:12', 'index');
INSERT INTO `ke_user_log` VALUES ('873', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-04 12:47:37', 'index');
INSERT INTO `ke_user_log` VALUES ('874', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-04 12:47:50', 'index');
INSERT INTO `ke_user_log` VALUES ('875', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-04 12:47:51', 'index');
INSERT INTO `ke_user_log` VALUES ('876', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-04 12:47:52', 'index');
INSERT INTO `ke_user_log` VALUES ('877', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-04 12:48:12', 'index');
INSERT INTO `ke_user_log` VALUES ('878', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-04 12:49:39', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('879', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-04 12:49:39', 'index');
INSERT INTO `ke_user_log` VALUES ('880', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-04 12:49:47', 'index');
INSERT INTO `ke_user_log` VALUES ('881', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-04 12:50:03', 'index');
INSERT INTO `ke_user_log` VALUES ('882', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-04 12:50:10', 'index');
INSERT INTO `ke_user_log` VALUES ('883', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-04 12:51:52', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('884', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-04 12:51:52', 'index');
INSERT INTO `ke_user_log` VALUES ('885', '5', '/admin/user', '0:0:0:0:0:0:0:1', '2017-02-04 12:51:58', 'index');
INSERT INTO `ke_user_log` VALUES ('886', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 12:52:01', 'index');
INSERT INTO `ke_user_log` VALUES ('887', '5', '/admin/role', '0:0:0:0:0:0:0:1', '2017-02-04 12:52:06', 'index');
INSERT INTO `ke_user_log` VALUES ('888', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-04 12:52:10', 'index');
INSERT INTO `ke_user_log` VALUES ('889', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-04 12:52:38', 'index');
INSERT INTO `ke_user_log` VALUES ('890', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-04 12:52:39', 'index');
INSERT INTO `ke_user_log` VALUES ('891', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-04 12:52:40', 'index');
INSERT INTO `ke_user_log` VALUES ('892', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-04 12:52:41', 'index');
INSERT INTO `ke_user_log` VALUES ('893', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-04 12:52:42', 'index');
INSERT INTO `ke_user_log` VALUES ('894', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-04 12:52:43', 'index');
INSERT INTO `ke_user_log` VALUES ('895', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-04 12:55:09', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('896', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-04 12:55:09', 'index');
INSERT INTO `ke_user_log` VALUES ('897', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-04 12:55:29', 'index');
INSERT INTO `ke_user_log` VALUES ('898', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-04 12:58:02', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('899', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-04 12:58:02', 'index');
INSERT INTO `ke_user_log` VALUES ('900', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-04 12:58:03', 'index');
INSERT INTO `ke_user_log` VALUES ('901', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-04 12:58:04', 'index');
INSERT INTO `ke_user_log` VALUES ('902', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-04 12:58:14', 'index');
INSERT INTO `ke_user_log` VALUES ('903', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-04 12:58:22', 'index');
INSERT INTO `ke_user_log` VALUES ('904', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-04 12:58:31', 'index');
INSERT INTO `ke_user_log` VALUES ('905', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-04 12:59:02', 'index');
INSERT INTO `ke_user_log` VALUES ('906', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-04 12:59:03', 'index');
INSERT INTO `ke_user_log` VALUES ('907', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-04 12:59:06', 'index');
INSERT INTO `ke_user_log` VALUES ('908', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-04 12:59:08', 'index');
INSERT INTO `ke_user_log` VALUES ('909', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-04 13:01:06', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('910', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-04 13:01:06', 'index');
INSERT INTO `ke_user_log` VALUES ('911', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-04 13:01:07', 'index');
INSERT INTO `ke_user_log` VALUES ('912', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-04 13:01:23', 'index');
INSERT INTO `ke_user_log` VALUES ('913', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-04 13:01:24', 'index');
INSERT INTO `ke_user_log` VALUES ('914', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-04 13:01:34', 'index');
INSERT INTO `ke_user_log` VALUES ('915', '5', '/admin/role', '0:0:0:0:0:0:0:1', '2017-02-04 13:01:37', 'index');
INSERT INTO `ke_user_log` VALUES ('916', '5', '/admin/role', '0:0:0:0:0:0:0:1', '2017-02-04 13:01:55', 'index');
INSERT INTO `ke_user_log` VALUES ('917', '5', '/admin/role', '0:0:0:0:0:0:0:1', '2017-02-04 13:01:56', 'index');
INSERT INTO `ke_user_log` VALUES ('918', '5', '/admin/role', '0:0:0:0:0:0:0:1', '2017-02-04 13:01:57', 'index');
INSERT INTO `ke_user_log` VALUES ('919', '5', '/admin/role', '0:0:0:0:0:0:0:1', '2017-02-04 13:02:30', 'index');
INSERT INTO `ke_user_log` VALUES ('920', '5', '/admin/role', '0:0:0:0:0:0:0:1', '2017-02-04 13:02:31', 'index');
INSERT INTO `ke_user_log` VALUES ('921', '5', '/admin/role', '0:0:0:0:0:0:0:1', '2017-02-04 13:02:35', 'index');
INSERT INTO `ke_user_log` VALUES ('922', '5', '/admin/role', '0:0:0:0:0:0:0:1', '2017-02-04 13:02:55', 'index');
INSERT INTO `ke_user_log` VALUES ('923', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-04 13:03:00', 'index');
INSERT INTO `ke_user_log` VALUES ('924', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-04 13:03:01', 'index');
INSERT INTO `ke_user_log` VALUES ('925', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-04 13:03:08', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('926', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-04 13:03:08', 'index');
INSERT INTO `ke_user_log` VALUES ('927', '5', '/admin/role', '0:0:0:0:0:0:0:1', '2017-02-04 13:03:11', 'index');
INSERT INTO `ke_user_log` VALUES ('928', '5', '/admin/role', '0:0:0:0:0:0:0:1', '2017-02-04 13:03:13', 'index');
INSERT INTO `ke_user_log` VALUES ('929', '5', '/admin/user', '0:0:0:0:0:0:0:1', '2017-02-04 13:03:18', 'index');
INSERT INTO `ke_user_log` VALUES ('930', '5', '/admin/user', '0:0:0:0:0:0:0:1', '2017-02-04 13:03:44', 'index');
INSERT INTO `ke_user_log` VALUES ('931', '5', '/admin/user', '0:0:0:0:0:0:0:1', '2017-02-04 13:04:02', 'index');
INSERT INTO `ke_user_log` VALUES ('932', '5', '/admin/role', '0:0:0:0:0:0:0:1', '2017-02-04 13:04:06', 'index');
INSERT INTO `ke_user_log` VALUES ('933', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-04 13:04:07', 'index');
INSERT INTO `ke_user_log` VALUES ('934', '5', '/admin/user', '0:0:0:0:0:0:0:1', '2017-02-04 13:04:09', 'index');
INSERT INTO `ke_user_log` VALUES ('935', '5', '/admin/user', '0:0:0:0:0:0:0:1', '2017-02-04 13:04:40', 'index');
INSERT INTO `ke_user_log` VALUES ('936', '5', '/admin/user', '0:0:0:0:0:0:0:1', '2017-02-04 13:04:59', 'index');
INSERT INTO `ke_user_log` VALUES ('937', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-04 13:07:08', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('938', '5', '/admin/user', '0:0:0:0:0:0:0:1', '2017-02-04 13:07:08', 'index');
INSERT INTO `ke_user_log` VALUES ('939', '5', '/admin/user', '0:0:0:0:0:0:0:1', '2017-02-04 13:07:09', 'index');
INSERT INTO `ke_user_log` VALUES ('940', '5', '/admin/user', '0:0:0:0:0:0:0:1', '2017-02-04 13:07:10', 'index');
INSERT INTO `ke_user_log` VALUES ('941', '5', '/admin/user', '0:0:0:0:0:0:0:1', '2017-02-04 13:08:01', 'index');
INSERT INTO `ke_user_log` VALUES ('942', '5', '/admin/user', '0:0:0:0:0:0:0:1', '2017-02-04 13:08:03', 'index');
INSERT INTO `ke_user_log` VALUES ('943', '5', '/admin/user', '0:0:0:0:0:0:0:1', '2017-02-04 13:08:34', 'index');
INSERT INTO `ke_user_log` VALUES ('944', '5', '/admin/user', '0:0:0:0:0:0:0:1', '2017-02-04 13:08:38', 'index');
INSERT INTO `ke_user_log` VALUES ('945', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-04 13:08:40', 'index');
INSERT INTO `ke_user_log` VALUES ('946', '5', '/admin/menu/getMenuById', '0:0:0:0:0:0:0:1', '2017-02-04 13:08:44', 'getMenuById');
INSERT INTO `ke_user_log` VALUES ('947', '5', '/admin/menu/save', '0:0:0:0:0:0:0:1', '2017-02-04 13:08:49', 'save');
INSERT INTO `ke_user_log` VALUES ('948', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-04 13:09:11', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('949', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-04 13:09:11', 'index');
INSERT INTO `ke_user_log` VALUES ('950', '5', '/admin', '0:0:0:0:0:0:0:1', '2017-02-04 13:09:14', 'index');
INSERT INTO `ke_user_log` VALUES ('951', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-04 13:09:23', 'index');
INSERT INTO `ke_user_log` VALUES ('952', '5', '/admin/menu/getMenuById', '0:0:0:0:0:0:0:1', '2017-02-04 13:09:27', 'getMenuById');
INSERT INTO `ke_user_log` VALUES ('953', '5', '/admin/menu/save', '0:0:0:0:0:0:0:1', '2017-02-04 13:09:32', 'save');
INSERT INTO `ke_user_log` VALUES ('954', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-04 13:09:32', 'index');
INSERT INTO `ke_user_log` VALUES ('955', '5', '/admin', '0:0:0:0:0:0:0:1', '2017-02-04 13:09:35', 'index');
INSERT INTO `ke_user_log` VALUES ('956', '5', '/admin', '0:0:0:0:0:0:0:1', '2017-02-04 13:09:37', 'index');
INSERT INTO `ke_user_log` VALUES ('957', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-04 13:09:38', 'index');
INSERT INTO `ke_user_log` VALUES ('958', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-04 13:10:58', 'index');
INSERT INTO `ke_user_log` VALUES ('959', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-04 13:11:02', 'index');
INSERT INTO `ke_user_log` VALUES ('960', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-04 13:11:11', 'index');
INSERT INTO `ke_user_log` VALUES ('961', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-04 13:11:13', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('962', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-04 13:11:13', 'index');
INSERT INTO `ke_user_log` VALUES ('963', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-04 13:11:36', 'index');
INSERT INTO `ke_user_log` VALUES ('964', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-04 13:11:38', 'index');
INSERT INTO `ke_user_log` VALUES ('965', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-04 13:11:39', 'index');
INSERT INTO `ke_user_log` VALUES ('966', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-04 13:11:40', 'index');
INSERT INTO `ke_user_log` VALUES ('967', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-04 13:12:06', 'index');
INSERT INTO `ke_user_log` VALUES ('968', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-04 13:12:07', 'index');
INSERT INTO `ke_user_log` VALUES ('969', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-04 13:12:37', 'index');
INSERT INTO `ke_user_log` VALUES ('970', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-04 13:12:41', 'index');
INSERT INTO `ke_user_log` VALUES ('971', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-04 13:14:59', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('972', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-04 13:14:59', 'index');
INSERT INTO `ke_user_log` VALUES ('973', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-04 13:15:00', 'index');
INSERT INTO `ke_user_log` VALUES ('974', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-04 13:15:03', 'index');
INSERT INTO `ke_user_log` VALUES ('975', '5', '/admin/role', '0:0:0:0:0:0:0:1', '2017-02-04 13:15:04', 'index');
INSERT INTO `ke_user_log` VALUES ('976', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-04 13:15:05', 'index');
INSERT INTO `ke_user_log` VALUES ('977', '5', '/admin/user', '0:0:0:0:0:0:0:1', '2017-02-04 13:15:05', 'index');
INSERT INTO `ke_user_log` VALUES ('978', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 13:15:06', 'index');
INSERT INTO `ke_user_log` VALUES ('979', '5', '/admin/user', '0:0:0:0:0:0:0:1', '2017-02-04 13:15:07', 'index');
INSERT INTO `ke_user_log` VALUES ('980', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-04 13:15:08', 'index');
INSERT INTO `ke_user_log` VALUES ('981', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-04 13:15:10', 'index');
INSERT INTO `ke_user_log` VALUES ('982', '5', '/admin/menu/getMenuById', '0:0:0:0:0:0:0:1', '2017-02-04 13:15:23', 'getMenuById');
INSERT INTO `ke_user_log` VALUES ('983', '5', '/admin/menu/save', '0:0:0:0:0:0:0:1', '2017-02-04 13:15:25', 'save');
INSERT INTO `ke_user_log` VALUES ('984', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-04 13:15:26', 'index');
INSERT INTO `ke_user_log` VALUES ('985', '5', '/admin/menu/getMenuById', '0:0:0:0:0:0:0:1', '2017-02-04 13:15:32', 'getMenuById');
INSERT INTO `ke_user_log` VALUES ('986', '5', '/admin/menu/save', '0:0:0:0:0:0:0:1', '2017-02-04 13:15:38', 'save');
INSERT INTO `ke_user_log` VALUES ('987', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-04 13:15:38', 'index');
INSERT INTO `ke_user_log` VALUES ('988', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-04 13:15:44', 'index');
INSERT INTO `ke_user_log` VALUES ('989', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-04 13:16:13', 'index');
INSERT INTO `ke_user_log` VALUES ('990', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-04 13:16:15', 'index');
INSERT INTO `ke_user_log` VALUES ('991', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-04 13:18:03', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('992', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-04 13:18:03', 'index');
INSERT INTO `ke_user_log` VALUES ('993', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-04 13:18:04', 'index');
INSERT INTO `ke_user_log` VALUES ('994', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-04 13:18:12', 'index');
INSERT INTO `ke_user_log` VALUES ('995', '5', '/admin', '0:0:0:0:0:0:0:1', '2017-02-04 13:18:15', 'index');
INSERT INTO `ke_user_log` VALUES ('996', '5', '/admin', '0:0:0:0:0:0:0:1', '2017-02-04 13:18:20', 'index');
INSERT INTO `ke_user_log` VALUES ('997', '5', '/admin', '0:0:0:0:0:0:0:1', '2017-02-04 13:19:00', 'index');
INSERT INTO `ke_user_log` VALUES ('998', '5', '/admin', '0:0:0:0:0:0:0:1', '2017-02-04 13:19:04', 'index');
INSERT INTO `ke_user_log` VALUES ('999', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-04 13:20:23', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1000', '5', '/admin', '0:0:0:0:0:0:0:1', '2017-02-04 13:20:23', 'index');
INSERT INTO `ke_user_log` VALUES ('1001', '5', '/admin', '0:0:0:0:0:0:0:1', '2017-02-04 13:20:59', 'index');
INSERT INTO `ke_user_log` VALUES ('1002', '5', '/admin', '0:0:0:0:0:0:0:1', '2017-02-04 13:21:20', 'index');
INSERT INTO `ke_user_log` VALUES ('1003', '5', '/admin', '0:0:0:0:0:0:0:1', '2017-02-04 13:21:31', 'index');
INSERT INTO `ke_user_log` VALUES ('1004', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-04 13:21:35', 'index');
INSERT INTO `ke_user_log` VALUES ('1005', '5', '/admin', '0:0:0:0:0:0:0:1', '2017-02-04 13:21:38', 'index');
INSERT INTO `ke_user_log` VALUES ('1006', '5', '/admin', '0:0:0:0:0:0:0:1', '2017-02-04 13:21:39', 'index');
INSERT INTO `ke_user_log` VALUES ('1007', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-04 13:21:41', 'index');
INSERT INTO `ke_user_log` VALUES ('1008', '5', '/admin/role', '0:0:0:0:0:0:0:1', '2017-02-04 13:21:42', 'index');
INSERT INTO `ke_user_log` VALUES ('1009', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-04 13:23:11', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1010', '5', '/admin/role', '0:0:0:0:0:0:0:1', '2017-02-04 13:23:11', 'index');
INSERT INTO `ke_user_log` VALUES ('1011', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-04 13:23:14', 'index');
INSERT INTO `ke_user_log` VALUES ('1012', '5', '/admin/user', '0:0:0:0:0:0:0:1', '2017-02-04 13:23:15', 'index');
INSERT INTO `ke_user_log` VALUES ('1013', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 13:23:16', 'index');
INSERT INTO `ke_user_log` VALUES ('1014', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-04 13:23:18', 'index');
INSERT INTO `ke_user_log` VALUES ('1015', '5', '/admin/role', '0:0:0:0:0:0:0:1', '2017-02-04 13:23:19', 'index');
INSERT INTO `ke_user_log` VALUES ('1016', '5', '/admin/user', '0:0:0:0:0:0:0:1', '2017-02-04 13:23:20', 'index');
INSERT INTO `ke_user_log` VALUES ('1017', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 13:23:21', 'index');
INSERT INTO `ke_user_log` VALUES ('1018', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-04 13:23:32', 'index');
INSERT INTO `ke_user_log` VALUES ('1019', '5', '/admin/role', '0:0:0:0:0:0:0:1', '2017-02-04 13:23:33', 'index');
INSERT INTO `ke_user_log` VALUES ('1020', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-04 13:23:34', 'index');
INSERT INTO `ke_user_log` VALUES ('1021', '5', '/admin/user', '0:0:0:0:0:0:0:1', '2017-02-04 13:23:34', 'index');
INSERT INTO `ke_user_log` VALUES ('1022', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 13:23:35', 'index');
INSERT INTO `ke_user_log` VALUES ('1023', '5', '/admin/user', '0:0:0:0:0:0:0:1', '2017-02-04 13:23:38', 'index');
INSERT INTO `ke_user_log` VALUES ('1024', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-04 13:23:40', 'index');
INSERT INTO `ke_user_log` VALUES ('1025', '5', '/admin/role', '0:0:0:0:0:0:0:1', '2017-02-04 13:23:41', 'index');
INSERT INTO `ke_user_log` VALUES ('1026', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-04 13:23:44', 'index');
INSERT INTO `ke_user_log` VALUES ('1027', '5', '/admin/user', '0:0:0:0:0:0:0:1', '2017-02-04 13:23:47', 'index');
INSERT INTO `ke_user_log` VALUES ('1028', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 13:23:51', 'index');
INSERT INTO `ke_user_log` VALUES ('1029', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 13:24:11', 'index');
INSERT INTO `ke_user_log` VALUES ('1030', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 13:24:12', 'index');
INSERT INTO `ke_user_log` VALUES ('1031', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 13:24:14', 'index');
INSERT INTO `ke_user_log` VALUES ('1032', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-04 13:24:37', 'index');
INSERT INTO `ke_user_log` VALUES ('1033', '5', '/admin/menu/getMenuById', '0:0:0:0:0:0:0:1', '2017-02-04 13:24:39', 'getMenuById');
INSERT INTO `ke_user_log` VALUES ('1034', '5', '/admin/menu/save', '0:0:0:0:0:0:0:1', '2017-02-04 13:24:46', 'save');
INSERT INTO `ke_user_log` VALUES ('1035', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-04 13:24:46', 'index');
INSERT INTO `ke_user_log` VALUES ('1036', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-04 13:26:40', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1037', '5', '/admin/menu/save', '0:0:0:0:0:0:0:1', '2017-02-04 13:26:40', 'save');
INSERT INTO `ke_user_log` VALUES ('1038', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-04 13:26:40', 'index');
INSERT INTO `ke_user_log` VALUES ('1039', '5', '/admin/role', '0:0:0:0:0:0:0:1', '2017-02-04 13:26:49', 'index');
INSERT INTO `ke_user_log` VALUES ('1040', '5', '/admin/role/getRoleById', '0:0:0:0:0:0:0:1', '2017-02-04 13:26:53', 'getRoleById');
INSERT INTO `ke_user_log` VALUES ('1041', '5', '/admin/role/save', '0:0:0:0:0:0:0:1', '2017-02-04 13:26:56', 'save');
INSERT INTO `ke_user_log` VALUES ('1042', '5', '/admin/role', '0:0:0:0:0:0:0:1', '2017-02-04 13:26:56', 'index');
INSERT INTO `ke_user_log` VALUES ('1043', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-04 13:28:50', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1044', '5', '/admin/role', '0:0:0:0:0:0:0:1', '2017-02-04 13:28:50', 'index');
INSERT INTO `ke_user_log` VALUES ('1045', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-04 13:29:47', 'index');
INSERT INTO `ke_user_log` VALUES ('1046', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-04 13:31:02', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1047', '5', '/admin/menu/save', '0:0:0:0:0:0:0:1', '2017-02-04 13:31:02', 'save');
INSERT INTO `ke_user_log` VALUES ('1048', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-04 13:31:02', 'index');
INSERT INTO `ke_user_log` VALUES ('1049', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-04 13:33:12', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1050', '5', '/admin/menu/save', '0:0:0:0:0:0:0:1', '2017-02-04 13:33:12', 'save');
INSERT INTO `ke_user_log` VALUES ('1051', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-04 13:33:12', 'index');
INSERT INTO `ke_user_log` VALUES ('1052', '5', '/admin/menu/save', '0:0:0:0:0:0:0:1', '2017-02-04 13:34:37', 'save');
INSERT INTO `ke_user_log` VALUES ('1053', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-04 13:34:37', 'index');
INSERT INTO `ke_user_log` VALUES ('1054', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-04 13:36:17', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1055', '5', '/admin/menu/save', '0:0:0:0:0:0:0:1', '2017-02-04 13:36:17', 'save');
INSERT INTO `ke_user_log` VALUES ('1056', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-04 13:36:17', 'index');
INSERT INTO `ke_user_log` VALUES ('1057', '5', '/admin/role', '0:0:0:0:0:0:0:1', '2017-02-04 13:36:20', 'index');
INSERT INTO `ke_user_log` VALUES ('1058', '5', '/admin/role/getRoleById', '0:0:0:0:0:0:0:1', '2017-02-04 13:36:23', 'getRoleById');
INSERT INTO `ke_user_log` VALUES ('1059', '5', '/admin/role/save', '0:0:0:0:0:0:0:1', '2017-02-04 13:36:36', 'save');
INSERT INTO `ke_user_log` VALUES ('1060', '5', '/admin/role', '0:0:0:0:0:0:0:1', '2017-02-04 13:36:36', 'index');
INSERT INTO `ke_user_log` VALUES ('1061', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-04 13:49:15', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1062', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-04 13:49:15', 'index');
INSERT INTO `ke_user_log` VALUES ('1063', '5', '/admin/user', '0:0:0:0:0:0:0:1', '2017-02-04 13:49:28', 'index');
INSERT INTO `ke_user_log` VALUES ('1064', '5', '/admin/user', '0:0:0:0:0:0:0:1', '2017-02-04 13:49:30', 'index');
INSERT INTO `ke_user_log` VALUES ('1065', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-04 13:49:36', 'index');
INSERT INTO `ke_user_log` VALUES ('1066', '5', '/admin/user', '0:0:0:0:0:0:0:1', '2017-02-04 13:49:39', 'index');
INSERT INTO `ke_user_log` VALUES ('1067', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-04 13:49:40', 'index');
INSERT INTO `ke_user_log` VALUES ('1068', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-04 13:56:26', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1069', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-04 13:56:26', 'index');
INSERT INTO `ke_user_log` VALUES ('1070', '5', '/admin', '0:0:0:0:0:0:0:1', '2017-02-04 13:56:28', 'index');
INSERT INTO `ke_user_log` VALUES ('1071', '5', '/admin', '0:0:0:0:0:0:0:1', '2017-02-04 13:56:46', 'index');
INSERT INTO `ke_user_log` VALUES ('1072', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-04 13:56:51', 'index');
INSERT INTO `ke_user_log` VALUES ('1073', '5', '/admin/menu/getMenuById', '0:0:0:0:0:0:0:1', '2017-02-04 13:56:54', 'getMenuById');
INSERT INTO `ke_user_log` VALUES ('1074', '5', '/admin/menu/save', '0:0:0:0:0:0:0:1', '2017-02-04 13:57:01', 'save');
INSERT INTO `ke_user_log` VALUES ('1075', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-04 13:57:01', 'index');
INSERT INTO `ke_user_log` VALUES ('1076', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-04 13:57:03', 'index');
INSERT INTO `ke_user_log` VALUES ('1077', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-04 13:57:41', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1078', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-04 13:57:41', 'index');
INSERT INTO `ke_user_log` VALUES ('1079', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-04 13:58:31', 'index');
INSERT INTO `ke_user_log` VALUES ('1080', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-04 13:58:46', 'index');
INSERT INTO `ke_user_log` VALUES ('1081', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-04 14:00:23', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1082', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-04 14:00:23', 'index');
INSERT INTO `ke_user_log` VALUES ('1083', '5', '/admin/kntree/save', '0:0:0:0:0:0:0:1', '2017-02-04 14:01:02', 'save');
INSERT INTO `ke_user_log` VALUES ('1084', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-04 14:01:02', 'index');
INSERT INTO `ke_user_log` VALUES ('1085', '5', '/admin/kntree/save', '0:0:0:0:0:0:0:1', '2017-02-04 14:01:15', 'save');
INSERT INTO `ke_user_log` VALUES ('1086', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-04 14:01:15', 'index');
INSERT INTO `ke_user_log` VALUES ('1087', '5', '/admin/kntree/save', '0:0:0:0:0:0:0:1', '2017-02-04 14:01:30', 'save');
INSERT INTO `ke_user_log` VALUES ('1088', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-04 14:01:30', 'index');
INSERT INTO `ke_user_log` VALUES ('1089', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-04 14:02:06', 'index');
INSERT INTO `ke_user_log` VALUES ('1090', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-04 14:02:08', 'index');
INSERT INTO `ke_user_log` VALUES ('1091', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-04 14:02:45', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1092', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-04 14:02:45', 'index');
INSERT INTO `ke_user_log` VALUES ('1093', '5', '/admin/kntree/save', '0:0:0:0:0:0:0:1', '2017-02-04 14:03:01', 'save');
INSERT INTO `ke_user_log` VALUES ('1094', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-04 14:03:01', 'index');
INSERT INTO `ke_user_log` VALUES ('1095', '5', '/admin/kntree/save', '0:0:0:0:0:0:0:1', '2017-02-04 14:03:32', 'save');
INSERT INTO `ke_user_log` VALUES ('1096', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-04 14:03:32', 'index');
INSERT INTO `ke_user_log` VALUES ('1097', '5', '/admin/kntree/save', '0:0:0:0:0:0:0:1', '2017-02-04 14:03:48', 'save');
INSERT INTO `ke_user_log` VALUES ('1098', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-04 14:03:48', 'index');
INSERT INTO `ke_user_log` VALUES ('1099', '5', '/admin/kntree/save', '0:0:0:0:0:0:0:1', '2017-02-04 14:04:00', 'save');
INSERT INTO `ke_user_log` VALUES ('1100', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-04 14:04:00', 'index');
INSERT INTO `ke_user_log` VALUES ('1101', '5', '/admin/kntree/save', '0:0:0:0:0:0:0:1', '2017-02-04 14:04:12', 'save');
INSERT INTO `ke_user_log` VALUES ('1102', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-04 14:04:12', 'index');
INSERT INTO `ke_user_log` VALUES ('1103', '5', '/admin/kntree/save', '0:0:0:0:0:0:0:1', '2017-02-04 14:04:33', 'save');
INSERT INTO `ke_user_log` VALUES ('1104', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-04 14:04:33', 'index');
INSERT INTO `ke_user_log` VALUES ('1105', '5', '/admin/kntree/save', '0:0:0:0:0:0:0:1', '2017-02-04 14:04:42', 'save');
INSERT INTO `ke_user_log` VALUES ('1106', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-04 14:04:42', 'index');
INSERT INTO `ke_user_log` VALUES ('1107', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-04 14:04:52', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1108', '5', '/admin/kntree/save', '0:0:0:0:0:0:0:1', '2017-02-04 14:04:52', 'save');
INSERT INTO `ke_user_log` VALUES ('1109', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-04 14:04:52', 'index');
INSERT INTO `ke_user_log` VALUES ('1110', '5', '/admin/kntree/save', '0:0:0:0:0:0:0:1', '2017-02-04 14:05:01', 'save');
INSERT INTO `ke_user_log` VALUES ('1111', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-04 14:05:01', 'index');
INSERT INTO `ke_user_log` VALUES ('1112', '5', '/admin/kntree/save', '0:0:0:0:0:0:0:1', '2017-02-04 14:05:14', 'save');
INSERT INTO `ke_user_log` VALUES ('1113', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-04 14:05:14', 'index');
INSERT INTO `ke_user_log` VALUES ('1114', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-05 08:33:33', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1115', '5', '/admin', '0:0:0:0:0:0:0:1', '2017-02-05 08:33:36', 'index');
INSERT INTO `ke_user_log` VALUES ('1116', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-05 08:34:00', 'index');
INSERT INTO `ke_user_log` VALUES ('1117', '5', '/admin', '0:0:0:0:0:0:0:1', '2017-02-05 08:34:02', 'index');
INSERT INTO `ke_user_log` VALUES ('1118', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-05 08:34:03', 'index');
INSERT INTO `ke_user_log` VALUES ('1119', '5', '/admin', '0:0:0:0:0:0:0:1', '2017-02-05 08:34:04', 'index');
INSERT INTO `ke_user_log` VALUES ('1120', '5', '/admin', '0:0:0:0:0:0:0:1', '2017-02-05 08:34:05', 'index');
INSERT INTO `ke_user_log` VALUES ('1121', '5', '/admin', '0:0:0:0:0:0:0:1', '2017-02-05 08:34:06', 'index');
INSERT INTO `ke_user_log` VALUES ('1122', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-05 08:34:09', 'index');
INSERT INTO `ke_user_log` VALUES ('1123', '5', '/admin/role', '0:0:0:0:0:0:0:1', '2017-02-05 08:34:11', 'index');
INSERT INTO `ke_user_log` VALUES ('1124', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-05 08:34:12', 'index');
INSERT INTO `ke_user_log` VALUES ('1125', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-05 08:34:13', 'index');
INSERT INTO `ke_user_log` VALUES ('1126', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-05 08:35:19', 'index');
INSERT INTO `ke_user_log` VALUES ('1127', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-05 08:35:23', 'index');
INSERT INTO `ke_user_log` VALUES ('1128', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-05 08:35:27', 'index');
INSERT INTO `ke_user_log` VALUES ('1129', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-05 08:36:08', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1130', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-05 08:36:08', 'index');
INSERT INTO `ke_user_log` VALUES ('1131', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-05 08:36:10', 'index');
INSERT INTO `ke_user_log` VALUES ('1132', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-05 08:36:11', 'index');
INSERT INTO `ke_user_log` VALUES ('1133', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-05 08:36:12', 'index');
INSERT INTO `ke_user_log` VALUES ('1134', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-05 08:37:33', 'index');
INSERT INTO `ke_user_log` VALUES ('1135', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-05 08:37:34', 'index');
INSERT INTO `ke_user_log` VALUES ('1136', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-05 08:37:35', 'index');
INSERT INTO `ke_user_log` VALUES ('1137', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-05 08:37:36', 'index');
INSERT INTO `ke_user_log` VALUES ('1138', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-05 08:37:37', 'index');
INSERT INTO `ke_user_log` VALUES ('1139', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-05 08:37:38', 'index');
INSERT INTO `ke_user_log` VALUES ('1140', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-05 08:37:39', 'index');
INSERT INTO `ke_user_log` VALUES ('1141', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-05 08:38:23', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1142', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-05 08:38:23', 'index');
INSERT INTO `ke_user_log` VALUES ('1143', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-05 08:38:24', 'index');
INSERT INTO `ke_user_log` VALUES ('1144', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-05 08:39:00', 'index');
INSERT INTO `ke_user_log` VALUES ('1145', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-05 08:40:51', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1146', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-05 08:40:51', 'index');
INSERT INTO `ke_user_log` VALUES ('1147', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-05 08:40:53', 'index');
INSERT INTO `ke_user_log` VALUES ('1148', '5', '/admin/user', '0:0:0:0:0:0:0:1', '2017-02-05 08:41:03', 'index');
INSERT INTO `ke_user_log` VALUES ('1149', '5', '/admin/user', '0:0:0:0:0:0:0:1', '2017-02-05 08:41:08', 'index');
INSERT INTO `ke_user_log` VALUES ('1150', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-05 08:42:30', 'index');
INSERT INTO `ke_user_log` VALUES ('1151', '5', '/admin/role', '0:0:0:0:0:0:0:1', '2017-02-05 08:42:32', 'index');
INSERT INTO `ke_user_log` VALUES ('1152', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-05 08:42:33', 'index');
INSERT INTO `ke_user_log` VALUES ('1153', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-05 08:42:39', 'index');
INSERT INTO `ke_user_log` VALUES ('1154', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-05 08:43:26', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1155', '5', '/admin/kntree/save', '0:0:0:0:0:0:0:1', '2017-02-05 08:43:26', 'save');
INSERT INTO `ke_user_log` VALUES ('1156', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-05 08:43:26', 'index');
INSERT INTO `ke_user_log` VALUES ('1157', '5', '/admin/organ/getOrganById', '0:0:0:0:0:0:0:1', '2017-02-05 08:43:34', 'getOrganById');
INSERT INTO `ke_user_log` VALUES ('1158', '5', '/admin/organ/getOrganById', '0:0:0:0:0:0:0:1', '2017-02-05 08:43:47', 'getOrganById');
INSERT INTO `ke_user_log` VALUES ('1159', '5', '/admin/organ/getOrganById', '0:0:0:0:0:0:0:1', '2017-02-05 08:44:05', 'getOrganById');
INSERT INTO `ke_user_log` VALUES ('1160', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-05 08:44:47', 'index');
INSERT INTO `ke_user_log` VALUES ('1161', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-05 08:44:50', 'index');
INSERT INTO `ke_user_log` VALUES ('1162', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-05 08:45:21', 'index');
INSERT INTO `ke_user_log` VALUES ('1163', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-05 08:45:22', 'index');
INSERT INTO `ke_user_log` VALUES ('1164', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-05 08:45:25', 'index');
INSERT INTO `ke_user_log` VALUES ('1165', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-05 08:45:27', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1166', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-05 08:45:27', 'index');
INSERT INTO `ke_user_log` VALUES ('1167', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-05 08:45:35', 'index');
INSERT INTO `ke_user_log` VALUES ('1168', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-05 08:45:36', 'index');
INSERT INTO `ke_user_log` VALUES ('1169', '5', '/admin/kntree/getTreeById', '0:0:0:0:0:0:0:1', '2017-02-05 08:45:38', 'getTreeById');
INSERT INTO `ke_user_log` VALUES ('1170', '5', '/admin/kntree/save', '0:0:0:0:0:0:0:1', '2017-02-05 08:45:52', 'save');
INSERT INTO `ke_user_log` VALUES ('1171', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-05 08:45:52', 'index');
INSERT INTO `ke_user_log` VALUES ('1172', '5', '/admin/kntree/getTreeById', '0:0:0:0:0:0:0:1', '2017-02-05 08:46:14', 'getTreeById');
INSERT INTO `ke_user_log` VALUES ('1173', '5', '/admin/kntree/save', '0:0:0:0:0:0:0:1', '2017-02-05 08:46:30', 'save');
INSERT INTO `ke_user_log` VALUES ('1174', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-05 08:46:30', 'index');
INSERT INTO `ke_user_log` VALUES ('1175', '5', '/admin/kntree/getTreeById', '0:0:0:0:0:0:0:1', '2017-02-05 08:46:49', 'getTreeById');
INSERT INTO `ke_user_log` VALUES ('1176', '5', '/admin/kntree/save', '0:0:0:0:0:0:0:1', '2017-02-05 08:46:57', 'save');
INSERT INTO `ke_user_log` VALUES ('1177', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-05 08:46:57', 'index');
INSERT INTO `ke_user_log` VALUES ('1178', '5', '/admin/kntree/getTreeById', '0:0:0:0:0:0:0:1', '2017-02-05 08:47:14', 'getTreeById');
INSERT INTO `ke_user_log` VALUES ('1179', '5', '/admin/kntree/save', '0:0:0:0:0:0:0:1', '2017-02-05 08:47:25', 'save');
INSERT INTO `ke_user_log` VALUES ('1180', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-05 08:47:25', 'index');
INSERT INTO `ke_user_log` VALUES ('1181', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-05 08:47:49', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1182', '5', '/admin/kntree/save', '0:0:0:0:0:0:0:1', '2017-02-05 08:47:49', 'save');
INSERT INTO `ke_user_log` VALUES ('1183', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-05 08:47:49', 'index');
INSERT INTO `ke_user_log` VALUES ('1184', '5', '/admin/kntree/save', '0:0:0:0:0:0:0:1', '2017-02-05 08:48:09', 'save');
INSERT INTO `ke_user_log` VALUES ('1185', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-05 08:48:09', 'index');
INSERT INTO `ke_user_log` VALUES ('1186', '5', '/admin/kntree/save', '0:0:0:0:0:0:0:1', '2017-02-05 08:48:27', 'save');
INSERT INTO `ke_user_log` VALUES ('1187', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-05 08:48:27', 'index');
INSERT INTO `ke_user_log` VALUES ('1188', '5', '/admin/kntree/save', '0:0:0:0:0:0:0:1', '2017-02-05 08:48:43', 'save');
INSERT INTO `ke_user_log` VALUES ('1189', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-05 08:48:43', 'index');
INSERT INTO `ke_user_log` VALUES ('1190', '5', '/admin/kntree/save', '0:0:0:0:0:0:0:1', '2017-02-05 08:49:04', 'save');
INSERT INTO `ke_user_log` VALUES ('1191', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-05 08:49:04', 'index');
INSERT INTO `ke_user_log` VALUES ('1192', '5', '/admin/kntree/save', '0:0:0:0:0:0:0:1', '2017-02-05 08:49:13', 'save');
INSERT INTO `ke_user_log` VALUES ('1193', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-05 08:49:13', 'index');
INSERT INTO `ke_user_log` VALUES ('1194', '5', '/admin/kntree/save', '0:0:0:0:0:0:0:1', '2017-02-05 08:49:35', 'save');
INSERT INTO `ke_user_log` VALUES ('1195', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-05 08:49:35', 'index');
INSERT INTO `ke_user_log` VALUES ('1196', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-05 08:49:55', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1197', '5', '/admin/kntree/save', '0:0:0:0:0:0:0:1', '2017-02-05 08:49:55', 'save');
INSERT INTO `ke_user_log` VALUES ('1198', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-05 08:49:55', 'index');
INSERT INTO `ke_user_log` VALUES ('1199', '5', '/admin/kntree/save', '0:0:0:0:0:0:0:1', '2017-02-05 08:50:19', 'save');
INSERT INTO `ke_user_log` VALUES ('1200', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-05 08:50:20', 'index');
INSERT INTO `ke_user_log` VALUES ('1201', '5', '/admin/kntree/save', '0:0:0:0:0:0:0:1', '2017-02-05 08:50:35', 'save');
INSERT INTO `ke_user_log` VALUES ('1202', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-05 08:50:35', 'index');
INSERT INTO `ke_user_log` VALUES ('1203', '5', '/admin/kntree/save', '0:0:0:0:0:0:0:1', '2017-02-05 08:50:51', 'save');
INSERT INTO `ke_user_log` VALUES ('1204', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-05 08:50:51', 'index');
INSERT INTO `ke_user_log` VALUES ('1205', '5', '/admin/kntree/save', '0:0:0:0:0:0:0:1', '2017-02-05 08:51:03', 'save');
INSERT INTO `ke_user_log` VALUES ('1206', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-05 08:51:03', 'index');
INSERT INTO `ke_user_log` VALUES ('1207', '5', '/admin/kntree/save', '0:0:0:0:0:0:0:1', '2017-02-05 08:51:25', 'save');
INSERT INTO `ke_user_log` VALUES ('1208', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-05 08:51:26', 'index');
INSERT INTO `ke_user_log` VALUES ('1209', '5', '/admin/kntree/save', '0:0:0:0:0:0:0:1', '2017-02-05 08:51:40', 'save');
INSERT INTO `ke_user_log` VALUES ('1210', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-05 08:51:40', 'index');
INSERT INTO `ke_user_log` VALUES ('1211', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-05 08:53:39', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1212', '5', '/admin', '0:0:0:0:0:0:0:1', '2017-02-05 08:53:39', 'index');
INSERT INTO `ke_user_log` VALUES ('1213', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-05 08:54:43', 'index');
INSERT INTO `ke_user_log` VALUES ('1214', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-05 08:56:49', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1215', '5', '/admin/kntree/save', '0:0:0:0:0:0:0:1', '2017-02-05 08:56:49', 'save');
INSERT INTO `ke_user_log` VALUES ('1216', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-05 08:56:49', 'index');
INSERT INTO `ke_user_log` VALUES ('1217', '5', '/admin/kntree/save', '0:0:0:0:0:0:0:1', '2017-02-05 08:57:31', 'save');
INSERT INTO `ke_user_log` VALUES ('1218', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-05 08:57:31', 'index');
INSERT INTO `ke_user_log` VALUES ('1219', '5', '/admin/kntree/save', '0:0:0:0:0:0:0:1', '2017-02-05 08:57:44', 'save');
INSERT INTO `ke_user_log` VALUES ('1220', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-05 08:57:44', 'index');
INSERT INTO `ke_user_log` VALUES ('1221', '5', '/admin/kntree/save', '0:0:0:0:0:0:0:1', '2017-02-05 08:58:01', 'save');
INSERT INTO `ke_user_log` VALUES ('1222', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-05 08:58:01', 'index');
INSERT INTO `ke_user_log` VALUES ('1223', '5', '/admin/kntree/save', '0:0:0:0:0:0:0:1', '2017-02-05 08:58:24', 'save');
INSERT INTO `ke_user_log` VALUES ('1224', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-05 08:58:24', 'index');
INSERT INTO `ke_user_log` VALUES ('1225', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-05 08:58:55', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1226', '5', '/admin/kntree/save', '0:0:0:0:0:0:0:1', '2017-02-05 08:58:55', 'save');
INSERT INTO `ke_user_log` VALUES ('1227', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-05 08:58:55', 'index');
INSERT INTO `ke_user_log` VALUES ('1228', '5', '/admin/kntree/save', '0:0:0:0:0:0:0:1', '2017-02-05 08:59:12', 'save');
INSERT INTO `ke_user_log` VALUES ('1229', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-05 08:59:12', 'index');
INSERT INTO `ke_user_log` VALUES ('1230', '5', '/admin/kntree/save', '0:0:0:0:0:0:0:1', '2017-02-05 08:59:37', 'save');
INSERT INTO `ke_user_log` VALUES ('1231', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-05 08:59:37', 'index');
INSERT INTO `ke_user_log` VALUES ('1232', '5', '/admin/kntree/save', '0:0:0:0:0:0:0:1', '2017-02-05 08:59:57', 'save');
INSERT INTO `ke_user_log` VALUES ('1233', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-05 08:59:57', 'index');
INSERT INTO `ke_user_log` VALUES ('1234', '5', '/admin/kntree/save', '0:0:0:0:0:0:0:1', '2017-02-05 09:00:19', 'save');
INSERT INTO `ke_user_log` VALUES ('1235', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-05 09:00:19', 'index');
INSERT INTO `ke_user_log` VALUES ('1236', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-05 09:01:28', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1237', '5', '/admin/kntree/save', '0:0:0:0:0:0:0:1', '2017-02-05 09:01:28', 'save');
INSERT INTO `ke_user_log` VALUES ('1238', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-05 09:01:28', 'index');
INSERT INTO `ke_user_log` VALUES ('1239', '5', '/admin/kntree/save', '0:0:0:0:0:0:0:1', '2017-02-05 09:01:45', 'save');
INSERT INTO `ke_user_log` VALUES ('1240', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-05 09:01:45', 'index');
INSERT INTO `ke_user_log` VALUES ('1241', '5', '/admin/kntree/save', '0:0:0:0:0:0:0:1', '2017-02-05 09:02:19', 'save');
INSERT INTO `ke_user_log` VALUES ('1242', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-05 09:02:19', 'index');
INSERT INTO `ke_user_log` VALUES ('1243', '5', '/admin/kntree/save', '0:0:0:0:0:0:0:1', '2017-02-05 09:02:40', 'save');
INSERT INTO `ke_user_log` VALUES ('1244', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-05 09:02:40', 'index');
INSERT INTO `ke_user_log` VALUES ('1245', '5', '/admin/kntree/save', '0:0:0:0:0:0:0:1', '2017-02-05 09:03:11', 'save');
INSERT INTO `ke_user_log` VALUES ('1246', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-05 09:03:11', 'index');
INSERT INTO `ke_user_log` VALUES ('1247', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-05 09:03:46', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1248', '5', '/admin/kntree/save', '0:0:0:0:0:0:0:1', '2017-02-05 09:03:46', 'save');
INSERT INTO `ke_user_log` VALUES ('1249', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-05 09:03:46', 'index');
INSERT INTO `ke_user_log` VALUES ('1250', '5', '/admin/kntree/save', '0:0:0:0:0:0:0:1', '2017-02-05 09:04:24', 'save');
INSERT INTO `ke_user_log` VALUES ('1251', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-05 09:04:24', 'index');
INSERT INTO `ke_user_log` VALUES ('1252', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-05 09:04:30', 'index');
INSERT INTO `ke_user_log` VALUES ('1253', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-05 09:04:31', 'index');
INSERT INTO `ke_user_log` VALUES ('1254', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-05 09:04:32', 'index');
INSERT INTO `ke_user_log` VALUES ('1255', '5', '/admin/kntree/save', '0:0:0:0:0:0:0:1', '2017-02-05 09:05:28', 'save');
INSERT INTO `ke_user_log` VALUES ('1256', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-05 09:05:28', 'index');
INSERT INTO `ke_user_log` VALUES ('1257', '5', '/admin/kntree/save', '0:0:0:0:0:0:0:1', '2017-02-05 09:05:43', 'save');
INSERT INTO `ke_user_log` VALUES ('1258', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-05 09:05:43', 'index');
INSERT INTO `ke_user_log` VALUES ('1259', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-05 09:05:59', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1260', '5', '/admin/kntree/getTreeById', '0:0:0:0:0:0:0:1', '2017-02-05 09:05:59', 'getTreeById');
INSERT INTO `ke_user_log` VALUES ('1261', '5', '/admin/kntree/save', '0:0:0:0:0:0:0:1', '2017-02-05 09:06:13', 'save');
INSERT INTO `ke_user_log` VALUES ('1262', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-05 09:06:13', 'index');
INSERT INTO `ke_user_log` VALUES ('1263', '5', '/admin/kntree/getTreeById', '0:0:0:0:0:0:0:1', '2017-02-05 09:06:19', 'getTreeById');
INSERT INTO `ke_user_log` VALUES ('1264', '5', '/admin/kntree/save', '0:0:0:0:0:0:0:1', '2017-02-05 09:06:35', 'save');
INSERT INTO `ke_user_log` VALUES ('1265', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-05 09:06:35', 'index');
INSERT INTO `ke_user_log` VALUES ('1266', '5', '/admin/kntree/save', '0:0:0:0:0:0:0:1', '2017-02-05 09:06:54', 'save');
INSERT INTO `ke_user_log` VALUES ('1267', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-05 09:06:54', 'index');
INSERT INTO `ke_user_log` VALUES ('1268', '5', '/admin/kntree/save', '0:0:0:0:0:0:0:1', '2017-02-05 09:07:20', 'save');
INSERT INTO `ke_user_log` VALUES ('1269', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-05 09:07:20', 'index');
INSERT INTO `ke_user_log` VALUES ('1270', '5', '/admin/kntree/save', '0:0:0:0:0:0:0:1', '2017-02-05 09:07:39', 'save');
INSERT INTO `ke_user_log` VALUES ('1271', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-05 09:07:39', 'index');
INSERT INTO `ke_user_log` VALUES ('1272', '5', '/admin/kntree/save', '0:0:0:0:0:0:0:1', '2017-02-05 09:07:57', 'save');
INSERT INTO `ke_user_log` VALUES ('1273', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-05 09:07:57', 'index');
INSERT INTO `ke_user_log` VALUES ('1274', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-05 09:08:20', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1275', '5', '/admin/kntree/save', '0:0:0:0:0:0:0:1', '2017-02-05 09:08:20', 'save');
INSERT INTO `ke_user_log` VALUES ('1276', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-05 09:08:21', 'index');
INSERT INTO `ke_user_log` VALUES ('1277', '5', '/admin/kntree/save', '0:0:0:0:0:0:0:1', '2017-02-05 09:08:41', 'save');
INSERT INTO `ke_user_log` VALUES ('1278', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-05 09:08:41', 'index');
INSERT INTO `ke_user_log` VALUES ('1279', '5', '/admin/kntree/save', '0:0:0:0:0:0:0:1', '2017-02-05 09:09:00', 'save');
INSERT INTO `ke_user_log` VALUES ('1280', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-05 09:09:00', 'index');
INSERT INTO `ke_user_log` VALUES ('1281', '5', '/admin/kntree/save', '0:0:0:0:0:0:0:1', '2017-02-05 09:09:20', 'save');
INSERT INTO `ke_user_log` VALUES ('1282', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-05 09:09:20', 'index');
INSERT INTO `ke_user_log` VALUES ('1283', '5', '/admin/kntree/save', '0:0:0:0:0:0:0:1', '2017-02-05 09:09:40', 'save');
INSERT INTO `ke_user_log` VALUES ('1284', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-05 09:09:40', 'index');
INSERT INTO `ke_user_log` VALUES ('1285', '5', '/admin/kntree/save', '0:0:0:0:0:0:0:1', '2017-02-05 09:09:57', 'save');
INSERT INTO `ke_user_log` VALUES ('1286', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-05 09:09:57', 'index');
INSERT INTO `ke_user_log` VALUES ('1287', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-05 09:10:26', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1288', '5', '/admin/kntree/save', '0:0:0:0:0:0:0:1', '2017-02-05 09:10:26', 'save');
INSERT INTO `ke_user_log` VALUES ('1289', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-05 09:10:26', 'index');
INSERT INTO `ke_user_log` VALUES ('1290', '5', '/admin/kntree/save', '0:0:0:0:0:0:0:1', '2017-02-05 09:10:45', 'save');
INSERT INTO `ke_user_log` VALUES ('1291', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-05 09:10:45', 'index');
INSERT INTO `ke_user_log` VALUES ('1292', '5', '/admin/kntree/save', '0:0:0:0:0:0:0:1', '2017-02-05 09:11:10', 'save');
INSERT INTO `ke_user_log` VALUES ('1293', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-05 09:11:10', 'index');
INSERT INTO `ke_user_log` VALUES ('1294', '5', '/admin/kntree/save', '0:0:0:0:0:0:0:1', '2017-02-05 09:11:24', 'save');
INSERT INTO `ke_user_log` VALUES ('1295', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-05 09:11:24', 'index');
INSERT INTO `ke_user_log` VALUES ('1296', '5', '/admin/kntree/save', '0:0:0:0:0:0:0:1', '2017-02-05 09:11:49', 'save');
INSERT INTO `ke_user_log` VALUES ('1297', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-05 09:11:49', 'index');
INSERT INTO `ke_user_log` VALUES ('1298', '5', '/admin/kntree/save', '0:0:0:0:0:0:0:1', '2017-02-05 09:12:03', 'save');
INSERT INTO `ke_user_log` VALUES ('1299', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-05 09:12:03', 'index');
INSERT INTO `ke_user_log` VALUES ('1300', '5', '/admin/kntree/save', '0:0:0:0:0:0:0:1', '2017-02-05 09:12:22', 'save');
INSERT INTO `ke_user_log` VALUES ('1301', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-05 09:12:22', 'index');
INSERT INTO `ke_user_log` VALUES ('1302', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-05 09:12:44', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1303', '5', '/admin/kntree/save', '0:0:0:0:0:0:0:1', '2017-02-05 09:12:44', 'save');
INSERT INTO `ke_user_log` VALUES ('1304', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-05 09:12:44', 'index');
INSERT INTO `ke_user_log` VALUES ('1305', '5', '/admin/kntree/save', '0:0:0:0:0:0:0:1', '2017-02-05 09:12:56', 'save');
INSERT INTO `ke_user_log` VALUES ('1306', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-05 09:12:56', 'index');
INSERT INTO `ke_user_log` VALUES ('1307', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-05 09:16:54', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1308', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-05 09:16:54', 'index');
INSERT INTO `ke_user_log` VALUES ('1309', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-05 09:16:56', 'index');
INSERT INTO `ke_user_log` VALUES ('1310', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-05 09:16:57', 'index');
INSERT INTO `ke_user_log` VALUES ('1311', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-05 09:17:05', 'index');
INSERT INTO `ke_user_log` VALUES ('1312', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-05 09:17:07', 'index');
INSERT INTO `ke_user_log` VALUES ('1313', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-05 09:17:11', 'index');
INSERT INTO `ke_user_log` VALUES ('1314', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-05 09:17:13', 'index');
INSERT INTO `ke_user_log` VALUES ('1315', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-05 09:17:16', 'index');
INSERT INTO `ke_user_log` VALUES ('1316', '5', '/admin/role', '0:0:0:0:0:0:0:1', '2017-02-05 09:17:20', 'index');
INSERT INTO `ke_user_log` VALUES ('1317', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-05 09:17:21', 'index');
INSERT INTO `ke_user_log` VALUES ('1318', '5', '/admin/user', '0:0:0:0:0:0:0:1', '2017-02-05 09:17:22', 'index');
INSERT INTO `ke_user_log` VALUES ('1319', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-05 09:17:24', 'index');
INSERT INTO `ke_user_log` VALUES ('1320', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-05 09:17:47', 'index');
INSERT INTO `ke_user_log` VALUES ('1321', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-05 09:17:48', 'index');
INSERT INTO `ke_user_log` VALUES ('1322', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-05 09:17:56', 'index');
INSERT INTO `ke_user_log` VALUES ('1323', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-05 09:19:09', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1324', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-05 09:19:09', 'index');
INSERT INTO `ke_user_log` VALUES ('1325', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-05 09:22:41', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1326', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-05 09:22:41', 'index');
INSERT INTO `ke_user_log` VALUES ('1327', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-05 09:22:42', 'index');
INSERT INTO `ke_user_log` VALUES ('1328', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-05 09:22:51', 'index');
INSERT INTO `ke_user_log` VALUES ('1329', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-05 09:22:52', 'index');
INSERT INTO `ke_user_log` VALUES ('1330', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-05 09:22:54', 'index');
INSERT INTO `ke_user_log` VALUES ('1331', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-05 09:22:54', 'index');
INSERT INTO `ke_user_log` VALUES ('1332', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-05 09:22:55', 'index');
INSERT INTO `ke_user_log` VALUES ('1333', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-05 09:28:21', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1334', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-05 09:28:21', 'index');
INSERT INTO `ke_user_log` VALUES ('1335', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-05 09:28:26', 'index');
INSERT INTO `ke_user_log` VALUES ('1336', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-05 09:28:26', 'index');
INSERT INTO `ke_user_log` VALUES ('1337', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-05 09:29:05', 'index');
INSERT INTO `ke_user_log` VALUES ('1338', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-05 09:29:16', 'index');
INSERT INTO `ke_user_log` VALUES ('1339', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-05 09:30:20', 'index');
INSERT INTO `ke_user_log` VALUES ('1340', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-05 09:30:22', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1341', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-05 09:30:22', 'index');
INSERT INTO `ke_user_log` VALUES ('1342', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-05 09:30:23', 'index');
INSERT INTO `ke_user_log` VALUES ('1343', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-05 09:30:39', 'index');
INSERT INTO `ke_user_log` VALUES ('1344', '5', '/admin/role', '0:0:0:0:0:0:0:1', '2017-02-05 09:30:46', 'index');
INSERT INTO `ke_user_log` VALUES ('1345', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-05 09:30:57', 'index');
INSERT INTO `ke_user_log` VALUES ('1346', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-05 09:38:21', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1347', '5', '/admin/menu/save', '0:0:0:0:0:0:0:1', '2017-02-05 09:38:21', 'save');
INSERT INTO `ke_user_log` VALUES ('1348', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-05 09:38:21', 'index');
INSERT INTO `ke_user_log` VALUES ('1349', '5', '/admin/menu/save', '0:0:0:0:0:0:0:1', '2017-02-05 09:39:29', 'save');
INSERT INTO `ke_user_log` VALUES ('1350', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-05 09:39:29', 'index');
INSERT INTO `ke_user_log` VALUES ('1351', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-05 09:40:58', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1352', '5', '/admin/menu/save', '0:0:0:0:0:0:0:1', '2017-02-05 09:40:58', 'save');
INSERT INTO `ke_user_log` VALUES ('1353', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-05 09:40:58', 'index');
INSERT INTO `ke_user_log` VALUES ('1354', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-05 09:43:13', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1355', '5', '/admin/menu/save', '0:0:0:0:0:0:0:1', '2017-02-05 09:43:13', 'save');
INSERT INTO `ke_user_log` VALUES ('1356', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-05 09:43:13', 'index');
INSERT INTO `ke_user_log` VALUES ('1357', '5', '/admin/role', '0:0:0:0:0:0:0:1', '2017-02-05 09:43:28', 'index');
INSERT INTO `ke_user_log` VALUES ('1358', '5', '/admin/role/getRoleById', '0:0:0:0:0:0:0:1', '2017-02-05 09:43:31', 'getRoleById');
INSERT INTO `ke_user_log` VALUES ('1359', '5', '/admin/role/save', '0:0:0:0:0:0:0:1', '2017-02-05 09:43:34', 'save');
INSERT INTO `ke_user_log` VALUES ('1360', '5', '/admin/role', '0:0:0:0:0:0:0:1', '2017-02-05 09:43:34', 'index');
INSERT INTO `ke_user_log` VALUES ('1361', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-05 09:43:55', 'index');
INSERT INTO `ke_user_log` VALUES ('1362', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-05 09:53:15', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1363', '5', '/admin/menu/save', '0:0:0:0:0:0:0:1', '2017-02-05 09:53:15', 'save');
INSERT INTO `ke_user_log` VALUES ('1364', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-05 09:53:15', 'index');
INSERT INTO `ke_user_log` VALUES ('1365', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-05 09:54:44', 'index');
INSERT INTO `ke_user_log` VALUES ('1366', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-05 09:54:44', 'index');
INSERT INTO `ke_user_log` VALUES ('1367', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-05 09:54:59', 'index');
INSERT INTO `ke_user_log` VALUES ('1368', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-05 09:55:20', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1369', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-05 09:55:20', 'index');
INSERT INTO `ke_user_log` VALUES ('1370', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-05 09:55:21', 'index');
INSERT INTO `ke_user_log` VALUES ('1371', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-05 09:55:23', 'index');
INSERT INTO `ke_user_log` VALUES ('1372', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-05 09:55:24', 'index');
INSERT INTO `ke_user_log` VALUES ('1373', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-05 09:55:30', 'index');
INSERT INTO `ke_user_log` VALUES ('1374', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-05 09:55:31', 'index');
INSERT INTO `ke_user_log` VALUES ('1375', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-05 09:55:32', 'index');
INSERT INTO `ke_user_log` VALUES ('1376', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-05 09:55:33', 'index');
INSERT INTO `ke_user_log` VALUES ('1377', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-05 09:55:39', 'index');
INSERT INTO `ke_user_log` VALUES ('1378', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-05 09:55:41', 'index');
INSERT INTO `ke_user_log` VALUES ('1379', '5', '/admin/role', '0:0:0:0:0:0:0:1', '2017-02-05 09:55:48', 'index');
INSERT INTO `ke_user_log` VALUES ('1380', '5', '/admin/role', '0:0:0:0:0:0:0:1', '2017-02-05 09:56:46', 'index');
INSERT INTO `ke_user_log` VALUES ('1381', '5', '/admin/role', '0:0:0:0:0:0:0:1', '2017-02-05 09:56:47', 'index');
INSERT INTO `ke_user_log` VALUES ('1382', '5', '/admin/role', '0:0:0:0:0:0:0:1', '2017-02-05 09:57:08', 'index');
INSERT INTO `ke_user_log` VALUES ('1383', '5', '/admin/role', '0:0:0:0:0:0:0:1', '2017-02-05 09:57:08', 'index');
INSERT INTO `ke_user_log` VALUES ('1384', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-05 09:58:33', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1385', '5', '/admin/role', '0:0:0:0:0:0:0:1', '2017-02-05 09:58:33', 'index');
INSERT INTO `ke_user_log` VALUES ('1386', '5', '/admin/role', '0:0:0:0:0:0:0:1', '2017-02-05 09:59:59', 'index');
INSERT INTO `ke_user_log` VALUES ('1387', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-05 10:01:58', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1388', '5', '/admin/role', '0:0:0:0:0:0:0:1', '2017-02-05 10:01:58', 'index');
INSERT INTO `ke_user_log` VALUES ('1389', '5', '/admin/role', '0:0:0:0:0:0:0:1', '2017-02-05 10:02:40', 'index');
INSERT INTO `ke_user_log` VALUES ('1390', '5', '/admin/role', '0:0:0:0:0:0:0:1', '2017-02-05 10:03:48', 'index');
INSERT INTO `ke_user_log` VALUES ('1391', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-05 10:04:01', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1392', '5', '/admin/role', '0:0:0:0:0:0:0:1', '2017-02-05 10:04:01', 'index');
INSERT INTO `ke_user_log` VALUES ('1393', '5', '/admin/role', '0:0:0:0:0:0:0:1', '2017-02-05 10:04:43', 'index');
INSERT INTO `ke_user_log` VALUES ('1394', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-05 10:05:10', 'index');
INSERT INTO `ke_user_log` VALUES ('1395', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-05 10:06:01', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1396', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-05 10:06:01', 'index');
INSERT INTO `ke_user_log` VALUES ('1397', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-05 10:06:20', 'index');
INSERT INTO `ke_user_log` VALUES ('1398', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-05 10:06:45', 'index');
INSERT INTO `ke_user_log` VALUES ('1399', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-05 10:06:54', 'index');
INSERT INTO `ke_user_log` VALUES ('1400', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-05 10:08:59', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1401', '5', '/admin', '0:0:0:0:0:0:0:1', '2017-02-05 10:08:59', 'index');
INSERT INTO `ke_user_log` VALUES ('1402', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-05 10:09:02', 'index');
INSERT INTO `ke_user_log` VALUES ('1403', '5', '/admin/menu/getMenuById', '0:0:0:0:0:0:0:1', '2017-02-05 10:09:06', 'getMenuById');
INSERT INTO `ke_user_log` VALUES ('1404', '5', '/admin/menu/save', '0:0:0:0:0:0:0:1', '2017-02-05 10:09:11', 'save');
INSERT INTO `ke_user_log` VALUES ('1405', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-05 10:09:11', 'index');
INSERT INTO `ke_user_log` VALUES ('1406', '5', '/admin/menu/getMenuById', '0:0:0:0:0:0:0:1', '2017-02-05 10:09:15', 'getMenuById');
INSERT INTO `ke_user_log` VALUES ('1407', '5', '/admin/menu/save', '0:0:0:0:0:0:0:1', '2017-02-05 10:09:19', 'save');
INSERT INTO `ke_user_log` VALUES ('1408', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-05 10:09:19', 'index');
INSERT INTO `ke_user_log` VALUES ('1409', '5', '/admin/menu/getMenuById', '0:0:0:0:0:0:0:1', '2017-02-05 10:09:23', 'getMenuById');
INSERT INTO `ke_user_log` VALUES ('1410', '5', '/admin/menu/save', '0:0:0:0:0:0:0:1', '2017-02-05 10:09:26', 'save');
INSERT INTO `ke_user_log` VALUES ('1411', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-05 10:09:26', 'index');
INSERT INTO `ke_user_log` VALUES ('1412', '5', '/admin/role', '0:0:0:0:0:0:0:1', '2017-02-05 10:09:40', 'index');
INSERT INTO `ke_user_log` VALUES ('1413', '5', '/admin/role/getRoleById', '0:0:0:0:0:0:0:1', '2017-02-05 10:09:44', 'getRoleById');
INSERT INTO `ke_user_log` VALUES ('1414', '5', '/admin/role/save', '0:0:0:0:0:0:0:1', '2017-02-05 10:09:49', 'save');
INSERT INTO `ke_user_log` VALUES ('1415', '5', '/admin/role', '0:0:0:0:0:0:0:1', '2017-02-05 10:09:49', 'index');
INSERT INTO `ke_user_log` VALUES ('1416', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-05 10:12:00', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1417', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-05 10:12:00', 'index');
INSERT INTO `ke_user_log` VALUES ('1418', '5', '/admin/role', '0:0:0:0:0:0:0:1', '2017-02-05 10:12:01', 'index');
INSERT INTO `ke_user_log` VALUES ('1419', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-05 10:12:02', 'index');
INSERT INTO `ke_user_log` VALUES ('1420', '5', '/admin/user', '0:0:0:0:0:0:0:1', '2017-02-05 10:12:06', 'index');
INSERT INTO `ke_user_log` VALUES ('1421', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-05 10:12:08', 'index');
INSERT INTO `ke_user_log` VALUES ('1422', '5', '/admin/user', '0:0:0:0:0:0:0:1', '2017-02-05 10:12:10', 'index');
INSERT INTO `ke_user_log` VALUES ('1423', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-05 10:12:11', 'index');
INSERT INTO `ke_user_log` VALUES ('1424', '5', '/admin/role', '0:0:0:0:0:0:0:1', '2017-02-05 10:12:12', 'index');
INSERT INTO `ke_user_log` VALUES ('1425', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-05 10:12:15', 'index');
INSERT INTO `ke_user_log` VALUES ('1426', '5', '/admin/user', '0:0:0:0:0:0:0:1', '2017-02-05 10:12:16', 'index');
INSERT INTO `ke_user_log` VALUES ('1427', '5', '/admin/role', '0:0:0:0:0:0:0:1', '2017-02-05 10:12:17', 'index');
INSERT INTO `ke_user_log` VALUES ('1428', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-05 10:41:19', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1429', '5', '/admin/role', '0:0:0:0:0:0:0:1', '2017-02-05 10:41:19', 'index');
INSERT INTO `ke_user_log` VALUES ('1430', '5', '/admin/dmcate', '0:0:0:0:0:0:0:1', '2017-02-05 10:41:22', 'index');
INSERT INTO `ke_user_log` VALUES ('1431', '5', '/admin/dmcate', '0:0:0:0:0:0:0:1', '2017-02-05 10:42:21', 'index');
INSERT INTO `ke_user_log` VALUES ('1432', '5', '/admin/dmcate', '0:0:0:0:0:0:0:1', '2017-02-05 10:42:23', 'index');
INSERT INTO `ke_user_log` VALUES ('1433', '5', '/admin/role', '0:0:0:0:0:0:0:1', '2017-02-05 10:42:24', 'index');
INSERT INTO `ke_user_log` VALUES ('1434', '5', '/admin', '0:0:0:0:0:0:0:1', '2017-02-05 10:42:26', 'index');
INSERT INTO `ke_user_log` VALUES ('1435', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-05 10:42:27', 'index');
INSERT INTO `ke_user_log` VALUES ('1436', '5', '/admin/dmcate', '0:0:0:0:0:0:0:1', '2017-02-05 10:42:29', 'index');
INSERT INTO `ke_user_log` VALUES ('1437', '5', '/admin/dmcate', '0:0:0:0:0:0:0:1', '2017-02-05 10:42:49', 'index');
INSERT INTO `ke_user_log` VALUES ('1438', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-05 10:46:49', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1439', '5', '/admin/dmcate', '0:0:0:0:0:0:0:1', '2017-02-05 10:46:49', 'index');
INSERT INTO `ke_user_log` VALUES ('1440', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-05 10:48:51', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1441', '5', '/admin/dmcate', '0:0:0:0:0:0:0:1', '2017-02-05 10:48:51', 'index');
INSERT INTO `ke_user_log` VALUES ('1442', '5', '/admin/dmcate', '0:0:0:0:0:0:0:1', '2017-02-05 10:49:21', 'index');
INSERT INTO `ke_user_log` VALUES ('1443', '5', '/admin/dmcate', '0:0:0:0:0:0:0:1', '2017-02-05 10:49:42', 'index');
INSERT INTO `ke_user_log` VALUES ('1444', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-05 10:52:11', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1445', '5', '/admin/dmcate/save', '0:0:0:0:0:0:0:1', '2017-02-05 10:52:11', 'save');
INSERT INTO `ke_user_log` VALUES ('1446', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-05 10:53:11', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1447', '5', '/admin/dmcate/save', '0:0:0:0:0:0:0:1', '2017-02-05 10:53:11', 'save');
INSERT INTO `ke_user_log` VALUES ('1448', '5', '/admin/dmcate', '0:0:0:0:0:0:0:1', '2017-02-05 10:53:11', 'index');
INSERT INTO `ke_user_log` VALUES ('1449', '5', '/admin/dmcate/save', '0:0:0:0:0:0:0:1', '2017-02-05 10:54:26', 'save');
INSERT INTO `ke_user_log` VALUES ('1450', '5', '/admin/dmcate', '0:0:0:0:0:0:0:1', '2017-02-05 10:54:26', 'index');
INSERT INTO `ke_user_log` VALUES ('1451', '5', '/admin/dmcate/getAlgoCateById', '0:0:0:0:0:0:0:1', '2017-02-05 10:54:32', 'getAlgoCateById');
INSERT INTO `ke_user_log` VALUES ('1452', '5', '/admin/dmcate/save', '0:0:0:0:0:0:0:1', '2017-02-05 10:54:45', 'save');
INSERT INTO `ke_user_log` VALUES ('1453', '5', '/admin/dmcate', '0:0:0:0:0:0:0:1', '2017-02-05 10:54:45', 'index');
INSERT INTO `ke_user_log` VALUES ('1454', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-05 10:55:13', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1455', '5', '/admin/dmcate/save', '0:0:0:0:0:0:0:1', '2017-02-05 10:55:13', 'save');
INSERT INTO `ke_user_log` VALUES ('1456', '5', '/admin/dmcate', '0:0:0:0:0:0:0:1', '2017-02-05 10:55:13', 'index');
INSERT INTO `ke_user_log` VALUES ('1457', '5', '/admin/dmcate/save', '0:0:0:0:0:0:0:1', '2017-02-05 10:55:40', 'save');
INSERT INTO `ke_user_log` VALUES ('1458', '5', '/admin/dmcate', '0:0:0:0:0:0:0:1', '2017-02-05 10:55:40', 'index');
INSERT INTO `ke_user_log` VALUES ('1459', '5', '/admin/dmcate/getAlgoCateById', '0:0:0:0:0:0:0:1', '2017-02-05 10:55:44', 'getAlgoCateById');
INSERT INTO `ke_user_log` VALUES ('1460', '5', '/admin/dmcate/save', '0:0:0:0:0:0:0:1', '2017-02-05 10:55:51', 'save');
INSERT INTO `ke_user_log` VALUES ('1461', '5', '/admin/dmcate', '0:0:0:0:0:0:0:1', '2017-02-05 10:55:51', 'index');
INSERT INTO `ke_user_log` VALUES ('1462', '5', '/admin/dmcate/save', '0:0:0:0:0:0:0:1', '2017-02-05 10:56:01', 'save');
INSERT INTO `ke_user_log` VALUES ('1463', '5', '/admin/dmcate/save', '0:0:0:0:0:0:0:1', '2017-02-05 10:56:03', 'save');
INSERT INTO `ke_user_log` VALUES ('1464', '5', '/admin/dmcate', '0:0:0:0:0:0:0:1', '2017-02-05 10:56:03', 'index');
INSERT INTO `ke_user_log` VALUES ('1465', '5', '/admin/dmcate/del', '0:0:0:0:0:0:0:1', '2017-02-05 10:56:07', 'del');
INSERT INTO `ke_user_log` VALUES ('1466', '5', '/admin/dmcate', '0:0:0:0:0:0:0:1', '2017-02-05 10:56:07', 'index');
INSERT INTO `ke_user_log` VALUES ('1467', '5', '/admin/role', '0:0:0:0:0:0:0:1', '2017-02-05 10:57:10', 'index');
INSERT INTO `ke_user_log` VALUES ('1468', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-05 10:57:37', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1469', '5', '/admin/role', '0:0:0:0:0:0:0:1', '2017-02-05 10:57:37', 'index');
INSERT INTO `ke_user_log` VALUES ('1470', '5', '/admin/dmcate', '0:0:0:0:0:0:0:1', '2017-02-05 10:57:40', 'index');
INSERT INTO `ke_user_log` VALUES ('1471', '5', '/admin/dmcate/del', '0:0:0:0:0:0:0:1', '2017-02-05 10:57:44', 'del');
INSERT INTO `ke_user_log` VALUES ('1472', '5', '/admin/dmcate', '0:0:0:0:0:0:0:1', '2017-02-05 10:57:44', 'index');
INSERT INTO `ke_user_log` VALUES ('1473', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-05 11:00:23', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1474', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-05 11:00:23', 'index');
INSERT INTO `ke_user_log` VALUES ('1475', '5', '/admin', '0:0:0:0:0:0:0:1', '2017-02-05 11:00:25', 'index');
INSERT INTO `ke_user_log` VALUES ('1476', '5', '/admin', '0:0:0:0:0:0:0:1', '2017-02-05 11:00:26', 'index');
INSERT INTO `ke_user_log` VALUES ('1477', '5', '/admin', '0:0:0:0:0:0:0:1', '2017-02-05 11:00:28', 'index');
INSERT INTO `ke_user_log` VALUES ('1478', '5', '/admin', '0:0:0:0:0:0:0:1', '2017-02-05 11:00:30', 'index');
INSERT INTO `ke_user_log` VALUES ('1479', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-05 11:06:37', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1480', '5', '/admin/dmcate', '0:0:0:0:0:0:0:1', '2017-02-05 11:06:37', 'index');
INSERT INTO `ke_user_log` VALUES ('1481', '5', '/admin/dmcate/save', '0:0:0:0:0:0:0:1', '2017-02-05 11:06:44', 'save');
INSERT INTO `ke_user_log` VALUES ('1482', '5', '/admin/dmcate', '0:0:0:0:0:0:0:1', '2017-02-05 11:06:44', 'index');
INSERT INTO `ke_user_log` VALUES ('1483', '5', '/admin/dmcate/save', '0:0:0:0:0:0:0:1', '2017-02-05 11:06:51', 'save');
INSERT INTO `ke_user_log` VALUES ('1484', '5', '/admin/dmcate', '0:0:0:0:0:0:0:1', '2017-02-05 11:06:51', 'index');
INSERT INTO `ke_user_log` VALUES ('1485', '5', '/admin/dmcate/del', '0:0:0:0:0:0:0:1', '2017-02-05 11:06:56', 'del');
INSERT INTO `ke_user_log` VALUES ('1486', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-05 11:07:24', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1487', '5', '/admin/dmcate/del', '0:0:0:0:0:0:0:1', '2017-02-05 11:07:24', 'del');
INSERT INTO `ke_user_log` VALUES ('1488', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-05 11:09:15', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1489', '5', '/admin/dmcate/del', '0:0:0:0:0:0:0:1', '2017-02-05 11:09:15', 'del');
INSERT INTO `ke_user_log` VALUES ('1490', '5', '/admin/dmcate', '0:0:0:0:0:0:0:1', '2017-02-05 11:09:15', 'index');
INSERT INTO `ke_user_log` VALUES ('1491', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-05 11:12:59', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1492', '5', '/admin/dmcate', '0:0:0:0:0:0:0:1', '2017-02-05 11:12:59', 'index');
INSERT INTO `ke_user_log` VALUES ('1493', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-05 12:08:33', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1494', '5', '/admin/dmcate', '0:0:0:0:0:0:0:1', '2017-02-05 12:08:33', 'index');
INSERT INTO `ke_user_log` VALUES ('1495', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-05 12:08:42', 'index');
INSERT INTO `ke_user_log` VALUES ('1496', '5', '/admin/menu/getMenuById', '0:0:0:0:0:0:0:1', '2017-02-05 12:08:46', 'getMenuById');
INSERT INTO `ke_user_log` VALUES ('1497', '5', '/admin/menu/save', '0:0:0:0:0:0:0:1', '2017-02-05 12:08:53', 'save');
INSERT INTO `ke_user_log` VALUES ('1498', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-05 12:08:53', 'index');
INSERT INTO `ke_user_log` VALUES ('1499', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-05 12:08:57', 'index');
INSERT INTO `ke_user_log` VALUES ('1500', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-05 12:09:34', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1501', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-05 12:09:34', 'index');
INSERT INTO `ke_user_log` VALUES ('1502', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-05 12:09:37', 'index');
INSERT INTO `ke_user_log` VALUES ('1503', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-05 12:10:30', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1504', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-05 12:10:30', 'index');
INSERT INTO `ke_user_log` VALUES ('1505', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-05 12:11:00', 'index');
INSERT INTO `ke_user_log` VALUES ('1506', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-05 12:11:09', 'index');
INSERT INTO `ke_user_log` VALUES ('1507', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-05 12:20:16', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1508', '5', '/admin/dmcate', '0:0:0:0:0:0:0:1', '2017-02-05 12:20:16', 'index');
INSERT INTO `ke_user_log` VALUES ('1509', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-05 12:20:25', 'index');
INSERT INTO `ke_user_log` VALUES ('1510', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-05 12:20:33', 'index');
INSERT INTO `ke_user_log` VALUES ('1511', '5', '/admin/user', '0:0:0:0:0:0:0:1', '2017-02-05 12:20:34', 'index');
INSERT INTO `ke_user_log` VALUES ('1512', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-05 12:20:38', 'index');
INSERT INTO `ke_user_log` VALUES ('1513', '5', '/admin/role', '0:0:0:0:0:0:0:1', '2017-02-05 12:20:39', 'index');
INSERT INTO `ke_user_log` VALUES ('1514', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-05 12:20:40', 'index');
INSERT INTO `ke_user_log` VALUES ('1515', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-05 12:20:46', 'index');
INSERT INTO `ke_user_log` VALUES ('1516', '5', '/admin/dmcate', '0:0:0:0:0:0:0:1', '2017-02-05 12:20:49', 'index');
INSERT INTO `ke_user_log` VALUES ('1517', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-05 12:20:57', 'index');
INSERT INTO `ke_user_log` VALUES ('1518', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-05 12:22:06', 'index');
INSERT INTO `ke_user_log` VALUES ('1519', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-05 12:22:08', 'index');
INSERT INTO `ke_user_log` VALUES ('1520', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-05 12:22:11', 'index');
INSERT INTO `ke_user_log` VALUES ('1521', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-05 12:22:39', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1522', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-05 12:22:39', 'index');
INSERT INTO `ke_user_log` VALUES ('1523', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-05 12:22:41', 'index');
INSERT INTO `ke_user_log` VALUES ('1524', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-05 12:22:50', 'index');
INSERT INTO `ke_user_log` VALUES ('1525', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-05 12:23:35', 'index');
INSERT INTO `ke_user_log` VALUES ('1526', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-05 12:23:35', 'index');
INSERT INTO `ke_user_log` VALUES ('1527', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-05 12:24:15', 'index');
INSERT INTO `ke_user_log` VALUES ('1528', '5', '/admin/dmcate', '0:0:0:0:0:0:0:1', '2017-02-05 12:24:30', 'index');
INSERT INTO `ke_user_log` VALUES ('1529', '5', '/admin/dmcate', '0:0:0:0:0:0:0:1', '2017-02-05 12:24:31', 'index');
INSERT INTO `ke_user_log` VALUES ('1530', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-05 12:24:33', 'index');
INSERT INTO `ke_user_log` VALUES ('1531', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-05 12:24:40', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1532', '5', '/admin/user', '0:0:0:0:0:0:0:1', '2017-02-05 12:24:40', 'index');
INSERT INTO `ke_user_log` VALUES ('1533', '5', '/admin/user', '0:0:0:0:0:0:0:1', '2017-02-05 12:25:01', 'index');
INSERT INTO `ke_user_log` VALUES ('1534', '5', '/admin/user', '0:0:0:0:0:0:0:1', '2017-02-05 12:25:02', 'index');
INSERT INTO `ke_user_log` VALUES ('1535', '5', '/admin/user', '0:0:0:0:0:0:0:1', '2017-02-05 12:25:19', 'index');
INSERT INTO `ke_user_log` VALUES ('1536', '5', '/admin/user', '0:0:0:0:0:0:0:1', '2017-02-05 12:25:30', 'index');
INSERT INTO `ke_user_log` VALUES ('1537', '5', '/admin/user', '0:0:0:0:0:0:0:1', '2017-02-05 12:25:31', 'index');
INSERT INTO `ke_user_log` VALUES ('1538', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-05 12:27:10', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1539', '5', '/admin/user', '0:0:0:0:0:0:0:1', '2017-02-05 12:27:10', 'index');
INSERT INTO `ke_user_log` VALUES ('1540', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-05 12:27:13', 'index');
INSERT INTO `ke_user_log` VALUES ('1541', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-05 12:27:23', 'index');
INSERT INTO `ke_user_log` VALUES ('1542', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-05 12:27:25', 'index');
INSERT INTO `ke_user_log` VALUES ('1543', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-05 12:27:34', 'index');
INSERT INTO `ke_user_log` VALUES ('1544', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-05 12:28:26', 'index');
INSERT INTO `ke_user_log` VALUES ('1545', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-05 12:28:28', 'index');
INSERT INTO `ke_user_log` VALUES ('1546', '5', '/admin/user', '0:0:0:0:0:0:0:1', '2017-02-05 12:28:29', 'index');
INSERT INTO `ke_user_log` VALUES ('1547', '5', '/admin/user', '0:0:0:0:0:0:0:1', '2017-02-05 12:28:42', 'index');
INSERT INTO `ke_user_log` VALUES ('1548', '5', '/admin/user', '0:0:0:0:0:0:0:1', '2017-02-05 12:28:43', 'index');
INSERT INTO `ke_user_log` VALUES ('1549', '5', '/admin/user', '0:0:0:0:0:0:0:1', '2017-02-05 12:28:44', 'index');
INSERT INTO `ke_user_log` VALUES ('1550', '5', '/admin/user', '0:0:0:0:0:0:0:1', '2017-02-05 12:28:52', 'index');
INSERT INTO `ke_user_log` VALUES ('1551', '5', '/admin/user', '0:0:0:0:0:0:0:1', '2017-02-05 12:28:56', 'index');
INSERT INTO `ke_user_log` VALUES ('1552', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-05 12:30:19', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1553', '5', '/admin/user', '0:0:0:0:0:0:0:1', '2017-02-05 12:30:19', 'index');
INSERT INTO `ke_user_log` VALUES ('1554', '5', '/admin/user', '0:0:0:0:0:0:0:1', '2017-02-05 12:30:21', 'index');
INSERT INTO `ke_user_log` VALUES ('1555', '5', '/admin/user', '0:0:0:0:0:0:0:1', '2017-02-05 12:30:22', 'index');
INSERT INTO `ke_user_log` VALUES ('1556', '5', '/admin/user', '0:0:0:0:0:0:0:1', '2017-02-05 12:30:50', 'index');
INSERT INTO `ke_user_log` VALUES ('1557', '5', '/admin/user', '0:0:0:0:0:0:0:1', '2017-02-05 12:30:54', 'index');
INSERT INTO `ke_user_log` VALUES ('1558', '5', '/admin/dmcate', '0:0:0:0:0:0:0:1', '2017-02-05 12:31:45', 'index');
INSERT INTO `ke_user_log` VALUES ('1559', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-05 12:31:46', 'index');
INSERT INTO `ke_user_log` VALUES ('1560', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-05 12:33:07', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1561', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-05 12:33:07', 'index');
INSERT INTO `ke_user_log` VALUES ('1562', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-05 12:33:08', 'index');
INSERT INTO `ke_user_log` VALUES ('1563', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-05 12:33:09', 'index');
INSERT INTO `ke_user_log` VALUES ('1564', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-05 12:34:02', 'index');
INSERT INTO `ke_user_log` VALUES ('1565', '5', '/admin/user', '0:0:0:0:0:0:0:1', '2017-02-05 12:34:39', 'index');
INSERT INTO `ke_user_log` VALUES ('1566', '5', '/admin/user', '0:0:0:0:0:0:0:1', '2017-02-05 12:34:42', 'index');
INSERT INTO `ke_user_log` VALUES ('1567', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-05 12:34:44', 'index');
INSERT INTO `ke_user_log` VALUES ('1568', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-05 12:34:48', 'index');
INSERT INTO `ke_user_log` VALUES ('1569', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-05 12:35:11', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1570', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-05 12:35:11', 'index');
INSERT INTO `ke_user_log` VALUES ('1571', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-05 12:35:15', 'index');
INSERT INTO `ke_user_log` VALUES ('1572', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-05 12:35:28', 'index');
INSERT INTO `ke_user_log` VALUES ('1573', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-05 12:52:11', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1574', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-05 12:52:11', 'index');
INSERT INTO `ke_user_log` VALUES ('1575', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-05 12:52:58', 'index');
INSERT INTO `ke_user_log` VALUES ('1576', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-05 12:53:57', 'index');
INSERT INTO `ke_user_log` VALUES ('1577', '5', '/admin/user', '0:0:0:0:0:0:0:1', '2017-02-05 12:54:09', 'index');
INSERT INTO `ke_user_log` VALUES ('1578', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-05 12:54:57', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1579', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-05 12:54:57', 'index');
INSERT INTO `ke_user_log` VALUES ('1580', '5', '/admin/user', '0:0:0:0:0:0:0:1', '2017-02-05 12:56:52', 'index');
INSERT INTO `ke_user_log` VALUES ('1581', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-05 12:57:46', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1582', '5', '/admin/user', '0:0:0:0:0:0:0:1', '2017-02-05 12:57:46', 'index');
INSERT INTO `ke_user_log` VALUES ('1583', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-05 12:57:48', 'index');
INSERT INTO `ke_user_log` VALUES ('1584', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-05 12:57:49', 'index');
INSERT INTO `ke_user_log` VALUES ('1585', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-05 12:58:40', 'index');
INSERT INTO `ke_user_log` VALUES ('1586', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-05 13:00:32', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1587', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-05 13:00:32', 'index');
INSERT INTO `ke_user_log` VALUES ('1588', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-05 13:00:53', 'index');
INSERT INTO `ke_user_log` VALUES ('1589', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-05 13:01:32', 'index');
INSERT INTO `ke_user_log` VALUES ('1590', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-05 13:01:33', 'index');
INSERT INTO `ke_user_log` VALUES ('1591', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-05 13:01:58', 'index');
INSERT INTO `ke_user_log` VALUES ('1592', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-05 13:03:47', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1593', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-05 13:03:47', 'index');
INSERT INTO `ke_user_log` VALUES ('1594', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-05 13:04:30', 'index');
INSERT INTO `ke_user_log` VALUES ('1595', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-05 13:07:46', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1596', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-05 13:07:46', 'index');
INSERT INTO `ke_user_log` VALUES ('1597', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-05 13:10:56', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1598', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-05 13:10:56', 'index');
INSERT INTO `ke_user_log` VALUES ('1599', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-05 13:12:14', 'index');
INSERT INTO `ke_user_log` VALUES ('1600', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-05 13:15:43', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1601', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-05 13:15:43', 'index');
INSERT INTO `ke_user_log` VALUES ('1602', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-05 13:18:38', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1603', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-05 13:18:38', 'index');
INSERT INTO `ke_user_log` VALUES ('1604', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-05 13:20:25', 'index');
INSERT INTO `ke_user_log` VALUES ('1605', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-05 13:20:40', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1606', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-05 13:20:40', 'index');
INSERT INTO `ke_user_log` VALUES ('1607', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-05 13:20:41', 'index');
INSERT INTO `ke_user_log` VALUES ('1608', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-05 13:22:22', 'index');
INSERT INTO `ke_user_log` VALUES ('1609', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-05 13:22:46', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1610', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-05 13:22:46', 'index');
INSERT INTO `ke_user_log` VALUES ('1611', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-05 13:23:40', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1612', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-05 13:23:40', 'index');
INSERT INTO `ke_user_log` VALUES ('1613', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-05 13:23:46', 'index');
INSERT INTO `ke_user_log` VALUES ('1614', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-05 13:23:50', 'index');
INSERT INTO `ke_user_log` VALUES ('1615', '5', '/admin/user', '0:0:0:0:0:0:0:1', '2017-02-05 13:24:04', 'index');
INSERT INTO `ke_user_log` VALUES ('1616', '5', '/admin/user', '0:0:0:0:0:0:0:1', '2017-02-05 13:24:10', 'index');
INSERT INTO `ke_user_log` VALUES ('1617', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-05 13:28:11', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1618', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-05 13:28:11', 'index');
INSERT INTO `ke_user_log` VALUES ('1619', '5', '/admin/dmalgo/save', '0:0:0:0:0:0:0:1', '2017-02-05 13:28:14', 'save');
INSERT INTO `ke_user_log` VALUES ('1620', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-05 13:48:41', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1621', '5', '/admin/dmalgo/save', '0:0:0:0:0:0:0:1', '2017-02-05 13:48:41', 'save');
INSERT INTO `ke_user_log` VALUES ('1622', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-05 13:56:31', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1623', '5', '/admin/dmalgo/save', '0:0:0:0:0:0:0:1', '2017-02-05 13:56:31', 'save');
INSERT INTO `ke_user_log` VALUES ('1624', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-05 14:01:07', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1625', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-05 14:01:07', 'index');
INSERT INTO `ke_user_log` VALUES ('1626', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-05 14:01:08', 'index');
INSERT INTO `ke_user_log` VALUES ('1627', '5', '/admin/dmalgo/save', '0:0:0:0:0:0:0:1', '2017-02-05 14:01:47', 'save');
INSERT INTO `ke_user_log` VALUES ('1628', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-05 14:02:25', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1629', '5', '/admin/dmalgo/save', '0:0:0:0:0:0:0:1', '2017-02-05 14:02:25', 'save');
INSERT INTO `ke_user_log` VALUES ('1630', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-05 14:03:55', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1631', '5', '/admin/dmalgo/save', '0:0:0:0:0:0:0:1', '2017-02-05 14:03:55', 'save');
INSERT INTO `ke_user_log` VALUES ('1632', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-05 14:09:31', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1633', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-05 14:09:31', 'index');
INSERT INTO `ke_user_log` VALUES ('1634', '5', '/admin/dmalgo/save', '0:0:0:0:0:0:0:1', '2017-02-05 14:09:57', 'save');
INSERT INTO `ke_user_log` VALUES ('1635', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-05 14:12:46', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1636', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-05 14:12:46', 'index');
INSERT INTO `ke_user_log` VALUES ('1637', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-05 14:13:47', 'index');
INSERT INTO `ke_user_log` VALUES ('1638', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-05 14:15:25', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1639', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-05 14:15:25', 'index');
INSERT INTO `ke_user_log` VALUES ('1640', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-05 14:17:04', 'index');
INSERT INTO `ke_user_log` VALUES ('1641', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-05 14:17:26', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1642', '5', '/admin/dmalgo/save', '0:0:0:0:0:0:0:1', '2017-02-05 14:17:26', 'save');
INSERT INTO `ke_user_log` VALUES ('1643', '5', '/admin/dmalgo/save', '0:0:0:0:0:0:0:1', '2017-02-05 14:18:13', 'save');
INSERT INTO `ke_user_log` VALUES ('1644', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-05 16:44:16', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1645', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-05 16:44:16', 'index');
INSERT INTO `ke_user_log` VALUES ('1646', '5', '/admin/dmalgo/save', '0:0:0:0:0:0:0:1', '2017-02-05 16:44:38', 'save');
INSERT INTO `ke_user_log` VALUES ('1647', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-05 16:47:51', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1648', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-05 16:47:51', 'index');
INSERT INTO `ke_user_log` VALUES ('1649', '5', '/admin/dmalgo/save', '0:0:0:0:0:0:0:1', '2017-02-05 16:48:16', 'save');
INSERT INTO `ke_user_log` VALUES ('1650', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-05 16:53:03', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1651', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-05 16:53:03', 'index');
INSERT INTO `ke_user_log` VALUES ('1652', '5', '/admin/dmalgo/save', '0:0:0:0:0:0:0:1', '2017-02-05 16:53:27', 'save');
INSERT INTO `ke_user_log` VALUES ('1653', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-05 16:57:25', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1654', '5', '/admin/dmalgo/save', '0:0:0:0:0:0:0:1', '2017-02-05 16:57:25', 'save');
INSERT INTO `ke_user_log` VALUES ('1655', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-05 16:59:20', 'index');
INSERT INTO `ke_user_log` VALUES ('1656', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-05 17:44:39', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1657', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-05 17:44:39', 'index');
INSERT INTO `ke_user_log` VALUES ('1658', '5', '/admin/dmalgo/save', '0:0:0:0:0:0:0:1', '2017-02-05 17:45:05', 'save');
INSERT INTO `ke_user_log` VALUES ('1659', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-05 18:02:20', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1660', '5', '/admin/dmalgo/save', '0:0:0:0:0:0:0:1', '2017-02-05 18:02:20', 'save');
INSERT INTO `ke_user_log` VALUES ('1661', '5', '/admin/dmalgo/save', '0:0:0:0:0:0:0:1', '2017-02-05 18:03:05', 'save');
INSERT INTO `ke_user_log` VALUES ('1662', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-05 18:03:17', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1663', '5', '/admin/dmalgo/save', '0:0:0:0:0:0:0:1', '2017-02-05 18:03:17', 'save');
INSERT INTO `ke_user_log` VALUES ('1664', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-05 18:06:57', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1665', '5', '/admin/dmalgo/save', '0:0:0:0:0:0:0:1', '2017-02-05 18:06:57', 'save');
INSERT INTO `ke_user_log` VALUES ('1666', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-05 18:07:26', 'index');
INSERT INTO `ke_user_log` VALUES ('1667', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-05 18:07:27', 'index');
INSERT INTO `ke_user_log` VALUES ('1668', '5', '/admin/dmalgo/save', '0:0:0:0:0:0:0:1', '2017-02-05 18:07:56', 'save');
INSERT INTO `ke_user_log` VALUES ('1669', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-05 18:09:08', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1670', '5', '/admin/dmalgo/save', '0:0:0:0:0:0:0:1', '2017-02-05 18:09:08', 'save');
INSERT INTO `ke_user_log` VALUES ('1671', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-05 18:12:58', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1672', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-05 18:12:58', 'index');
INSERT INTO `ke_user_log` VALUES ('1673', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-05 18:12:59', 'index');
INSERT INTO `ke_user_log` VALUES ('1674', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-05 18:13:19', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1675', '5', '/admin/dmalgo/save', '0:0:0:0:0:0:0:1', '2017-02-05 18:13:19', 'save');
INSERT INTO `ke_user_log` VALUES ('1676', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-05 18:14:11', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1677', '5', '/admin/dmalgo/save', '0:0:0:0:0:0:0:1', '2017-02-05 18:14:11', 'save');
INSERT INTO `ke_user_log` VALUES ('1678', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-05 18:16:42', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1679', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-05 18:16:42', 'index');
INSERT INTO `ke_user_log` VALUES ('1680', '5', '/admin/dmalgo/save', '0:0:0:0:0:0:0:1', '2017-02-05 18:17:10', 'save');
INSERT INTO `ke_user_log` VALUES ('1681', '5', '/admin/dmalgo/save', '0:0:0:0:0:0:0:1', '2017-02-05 18:17:57', 'save');
INSERT INTO `ke_user_log` VALUES ('1682', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-05 18:19:04', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1683', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-05 18:19:04', 'index');
INSERT INTO `ke_user_log` VALUES ('1684', '5', '/admin/dmalgo/save', '0:0:0:0:0:0:0:1', '2017-02-05 18:19:34', 'save');
INSERT INTO `ke_user_log` VALUES ('1685', '5', '/admin/dmalgo/save', '0:0:0:0:0:0:0:1', '2017-02-05 18:19:55', 'save');
INSERT INTO `ke_user_log` VALUES ('1686', '5', '/admin/dmalgo/save', '0:0:0:0:0:0:0:1', '2017-02-05 18:20:17', 'save');
INSERT INTO `ke_user_log` VALUES ('1687', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-05 18:23:18', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1688', '5', '/admin/dmalgo/save', '0:0:0:0:0:0:0:1', '2017-02-05 18:23:18', 'save');
INSERT INTO `ke_user_log` VALUES ('1689', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-05 18:25:55', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1690', '5', '/admin/dmalgo/save', '0:0:0:0:0:0:0:1', '2017-02-05 18:25:55', 'save');
INSERT INTO `ke_user_log` VALUES ('1691', '5', '/admin/dmalgo/save', '0:0:0:0:0:0:0:1', '2017-02-05 18:26:31', 'save');
INSERT INTO `ke_user_log` VALUES ('1692', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-05 18:26:31', 'index');
INSERT INTO `ke_user_log` VALUES ('1693', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-05 18:26:50', 'index');
INSERT INTO `ke_user_log` VALUES ('1694', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-05 18:26:59', 'index');
INSERT INTO `ke_user_log` VALUES ('1695', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-05 18:40:57', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1696', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-05 18:40:57', 'index');
INSERT INTO `ke_user_log` VALUES ('1697', '5', '/admin/dmalgo/save', '0:0:0:0:0:0:0:1', '2017-02-05 18:41:32', 'save');
INSERT INTO `ke_user_log` VALUES ('1698', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-05 18:41:33', 'index');
INSERT INTO `ke_user_log` VALUES ('1699', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-05 18:42:48', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1700', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-05 18:42:48', 'index');
INSERT INTO `ke_user_log` VALUES ('1701', '5', '/admin/dmalgo/save', '0:0:0:0:0:0:0:1', '2017-02-05 18:43:16', 'save');
INSERT INTO `ke_user_log` VALUES ('1702', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-05 18:43:16', 'index');
INSERT INTO `ke_user_log` VALUES ('1703', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-05 18:53:11', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1704', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-05 18:53:11', 'index');
INSERT INTO `ke_user_log` VALUES ('1705', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-05 18:53:16', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1706', '5', '/admin/dmalgo/getAlgoById', '0:0:0:0:0:0:0:1', '2017-02-05 18:53:16', 'getAlgoById');
INSERT INTO `ke_user_log` VALUES ('1707', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-05 19:01:08', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1708', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-05 19:01:08', 'index');
INSERT INTO `ke_user_log` VALUES ('1709', '5', '/admin/dmalgo/getAlgoById', '0:0:0:0:0:0:0:1', '2017-02-05 19:01:11', 'getAlgoById');
INSERT INTO `ke_user_log` VALUES ('1710', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-05 19:01:35', 'index');
INSERT INTO `ke_user_log` VALUES ('1711', '5', '/admin/dmalgo/getAlgoById', '0:0:0:0:0:0:0:1', '2017-02-05 19:01:39', 'getAlgoById');
INSERT INTO `ke_user_log` VALUES ('1712', '5', '/admin/dmalgo/getAlgoById', '0:0:0:0:0:0:0:1', '2017-02-05 19:01:46', 'getAlgoById');
INSERT INTO `ke_user_log` VALUES ('1713', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-05 19:03:38', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1714', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-05 19:03:38', 'index');
INSERT INTO `ke_user_log` VALUES ('1715', '5', '/admin/dmalgo/getAlgoById', '0:0:0:0:0:0:0:1', '2017-02-05 19:03:41', 'getAlgoById');
INSERT INTO `ke_user_log` VALUES ('1716', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-05 19:04:27', 'index');
INSERT INTO `ke_user_log` VALUES ('1717', '5', '/admin/dmalgo/getAlgoById', '0:0:0:0:0:0:0:1', '2017-02-05 19:04:30', 'getAlgoById');
INSERT INTO `ke_user_log` VALUES ('1718', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-05 19:05:48', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1719', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-05 19:05:48', 'index');
INSERT INTO `ke_user_log` VALUES ('1720', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-05 19:20:22', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1721', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-05 19:20:22', 'index');
INSERT INTO `ke_user_log` VALUES ('1722', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-05 19:20:23', 'index');
INSERT INTO `ke_user_log` VALUES ('1723', '5', '/admin/dmalgo/save', '0:0:0:0:0:0:0:1', '2017-02-05 19:21:10', 'save');
INSERT INTO `ke_user_log` VALUES ('1724', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-05 19:21:10', 'index');
INSERT INTO `ke_user_log` VALUES ('1725', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-05 19:24:32', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1726', '5', '/admin/dmalgo/save', '0:0:0:0:0:0:0:1', '2017-02-05 19:24:32', 'save');
INSERT INTO `ke_user_log` VALUES ('1727', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-05 19:24:32', 'index');
INSERT INTO `ke_user_log` VALUES ('1728', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-05 19:25:09', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1729', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-05 19:25:10', 'index');
INSERT INTO `ke_user_log` VALUES ('1730', '5', '/admin/dmalgo/save', '0:0:0:0:0:0:0:1', '2017-02-05 19:25:33', 'save');
INSERT INTO `ke_user_log` VALUES ('1731', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-05 19:25:33', 'index');
INSERT INTO `ke_user_log` VALUES ('1732', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-05 19:28:57', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1733', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-05 19:28:57', 'index');
INSERT INTO `ke_user_log` VALUES ('1734', '5', '/admin/dmalgo/save', '0:0:0:0:0:0:0:1', '2017-02-05 19:29:14', 'save');
INSERT INTO `ke_user_log` VALUES ('1735', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-05 19:29:14', 'index');
INSERT INTO `ke_user_log` VALUES ('1736', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-05 19:33:18', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1737', '5', '/admin/dmalgo/getAlgoById', '0:0:0:0:0:0:0:1', '2017-02-05 19:33:18', 'getAlgoById');
INSERT INTO `ke_user_log` VALUES ('1738', '5', '/admin/dmalgo/save', '0:0:0:0:0:0:0:1', '2017-02-05 19:33:20', 'save');
INSERT INTO `ke_user_log` VALUES ('1739', '5', '/admin/dmalgo/save', '0:0:0:0:0:0:0:1', '2017-02-05 19:33:23', 'save');
INSERT INTO `ke_user_log` VALUES ('1740', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-05 19:34:46', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1741', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-05 19:34:46', 'index');
INSERT INTO `ke_user_log` VALUES ('1742', '5', '/admin/dmalgo/save', '0:0:0:0:0:0:0:1', '2017-02-05 19:35:12', 'save');
INSERT INTO `ke_user_log` VALUES ('1743', '5', '/admin/dmalgo/save', '0:0:0:0:0:0:0:1', '2017-02-05 19:35:34', 'save');
INSERT INTO `ke_user_log` VALUES ('1744', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-05 19:35:34', 'index');
INSERT INTO `ke_user_log` VALUES ('1745', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-05 19:39:39', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1746', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-05 19:39:39', 'index');
INSERT INTO `ke_user_log` VALUES ('1747', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-05 19:39:40', 'index');
INSERT INTO `ke_user_log` VALUES ('1748', '5', '/admin/dmalgo/save', '0:0:0:0:0:0:0:1', '2017-02-05 19:39:57', 'save');
INSERT INTO `ke_user_log` VALUES ('1749', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-05 19:39:57', 'index');
INSERT INTO `ke_user_log` VALUES ('1750', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-05 19:42:26', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1751', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-05 19:42:26', 'index');
INSERT INTO `ke_user_log` VALUES ('1752', '5', '/admin/dmalgo/save', '0:0:0:0:0:0:0:1', '2017-02-05 19:42:49', 'save');
INSERT INTO `ke_user_log` VALUES ('1753', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-05 19:42:50', 'index');
INSERT INTO `ke_user_log` VALUES ('1754', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-05 19:58:09', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1755', '5', '/admin/dmalgo/save', '0:0:0:0:0:0:0:1', '2017-02-05 19:58:09', 'save');
INSERT INTO `ke_user_log` VALUES ('1756', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-05 19:58:09', 'index');
INSERT INTO `ke_user_log` VALUES ('1757', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-05 20:12:52', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1758', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-05 20:12:52', 'index');
INSERT INTO `ke_user_log` VALUES ('1759', '5', '/admin/dmalgo/getAlgoById', '0:0:0:0:0:0:0:1', '2017-02-05 20:12:56', 'getAlgoById');
INSERT INTO `ke_user_log` VALUES ('1760', '5', '/admin/dmalgo/save', '0:0:0:0:0:0:0:1', '2017-02-05 20:13:21', 'save');
INSERT INTO `ke_user_log` VALUES ('1761', '5', '/admin/dmalgo/save', '0:0:0:0:0:0:0:1', '2017-02-05 20:14:44', 'save');
INSERT INTO `ke_user_log` VALUES ('1762', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-05 20:15:56', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1763', '5', '/admin/dmalgo/save', '0:0:0:0:0:0:0:1', '2017-02-05 20:15:56', 'save');
INSERT INTO `ke_user_log` VALUES ('1764', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-05 20:15:56', 'index');
INSERT INTO `ke_user_log` VALUES ('1765', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-05 20:20:24', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1766', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-05 20:20:24', 'index');
INSERT INTO `ke_user_log` VALUES ('1767', '5', '/admin/dmalgo/del', '0:0:0:0:0:0:0:1', '2017-02-05 20:20:38', 'del');
INSERT INTO `ke_user_log` VALUES ('1768', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-05 20:21:16', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1769', '5', '/admin/dmalgo/del', '0:0:0:0:0:0:0:1', '2017-02-05 20:21:16', 'del');
INSERT INTO `ke_user_log` VALUES ('1770', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-05 20:21:16', 'index');
INSERT INTO `ke_user_log` VALUES ('1771', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-05 20:21:23', 'index');
INSERT INTO `ke_user_log` VALUES ('1772', '5', '/admin', '0:0:0:0:0:0:0:1', '2017-02-05 20:22:56', 'index');
INSERT INTO `ke_user_log` VALUES ('1773', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-05 20:22:58', 'index');
INSERT INTO `ke_user_log` VALUES ('1774', '5', '/admin/dmcate', '0:0:0:0:0:0:0:1', '2017-02-05 20:22:59', 'index');
INSERT INTO `ke_user_log` VALUES ('1775', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-05 20:23:00', 'index');
INSERT INTO `ke_user_log` VALUES ('1776', '5', '/admin/dmalgo/getAlgoById', '0:0:0:0:0:0:0:1', '2017-02-05 20:23:04', 'getAlgoById');
INSERT INTO `ke_user_log` VALUES ('1777', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-06 08:13:46', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1778', '5', '/admin', '0:0:0:0:0:0:0:1', '2017-02-06 08:13:48', 'index');
INSERT INTO `ke_user_log` VALUES ('1779', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-06 08:13:50', 'index');
INSERT INTO `ke_user_log` VALUES ('1780', '5', '/admin/dmalgo/save', '0:0:0:0:0:0:0:1', '2017-02-06 08:14:12', 'save');
INSERT INTO `ke_user_log` VALUES ('1781', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-06 08:14:12', 'index');
INSERT INTO `ke_user_log` VALUES ('1782', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-06 08:16:33', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1783', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-06 08:16:33', 'index');
INSERT INTO `ke_user_log` VALUES ('1784', '5', '/admin/dmalgo/save', '0:0:0:0:0:0:0:1', '2017-02-06 08:16:57', 'save');
INSERT INTO `ke_user_log` VALUES ('1785', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-06 08:17:39', 'index');
INSERT INTO `ke_user_log` VALUES ('1786', '5', '/admin/dmalgo/save', '0:0:0:0:0:0:0:1', '2017-02-06 08:18:14', 'save');
INSERT INTO `ke_user_log` VALUES ('1787', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-06 08:20:07', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1788', '5', '/admin/dmalgo/save', '0:0:0:0:0:0:0:1', '2017-02-06 08:20:07', 'save');
INSERT INTO `ke_user_log` VALUES ('1789', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-06 08:20:07', 'index');
INSERT INTO `ke_user_log` VALUES ('1790', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-06 08:22:16', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1791', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-06 08:22:16', 'index');
INSERT INTO `ke_user_log` VALUES ('1792', '5', '/admin/dmalgo/save', '0:0:0:0:0:0:0:1', '2017-02-06 08:22:36', 'save');
INSERT INTO `ke_user_log` VALUES ('1793', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-06 08:22:59', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1794', '5', '/admin/dmalgo/save', '0:0:0:0:0:0:0:1', '2017-02-06 08:22:59', 'save');
INSERT INTO `ke_user_log` VALUES ('1795', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-06 08:22:59', 'index');
INSERT INTO `ke_user_log` VALUES ('1796', '5', '/admin/dmalgo/save', '0:0:0:0:0:0:0:1', '2017-02-06 08:23:46', 'save');
INSERT INTO `ke_user_log` VALUES ('1797', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-06 08:35:02', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1798', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-06 08:35:02', 'index');
INSERT INTO `ke_user_log` VALUES ('1799', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-06 08:35:03', 'index');
INSERT INTO `ke_user_log` VALUES ('1800', '5', '/admin/dmalgo/save', '0:0:0:0:0:0:0:1', '2017-02-06 08:35:41', 'save');
INSERT INTO `ke_user_log` VALUES ('1801', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-06 08:35:41', 'index');
INSERT INTO `ke_user_log` VALUES ('1802', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-06 08:41:45', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1803', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-06 08:41:45', 'index');
INSERT INTO `ke_user_log` VALUES ('1804', '5', '/admin/dmalgo/save', '0:0:0:0:0:0:0:1', '2017-02-06 08:42:00', 'save');
INSERT INTO `ke_user_log` VALUES ('1805', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-06 08:42:00', 'index');
INSERT INTO `ke_user_log` VALUES ('1806', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-06 08:43:55', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1807', '5', '/admin/dmalgo/save', '0:0:0:0:0:0:0:1', '2017-02-06 08:43:55', 'save');
INSERT INTO `ke_user_log` VALUES ('1808', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-06 08:43:55', 'index');
INSERT INTO `ke_user_log` VALUES ('1809', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-06 08:48:52', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1810', '5', '/admin/dmalgo/save', '0:0:0:0:0:0:0:1', '2017-02-06 08:48:52', 'save');
INSERT INTO `ke_user_log` VALUES ('1811', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-06 08:48:52', 'index');
INSERT INTO `ke_user_log` VALUES ('1812', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-06 09:06:43', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1813', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-06 09:06:43', 'index');
INSERT INTO `ke_user_log` VALUES ('1814', '5', '/admin/dmalgo/save', '0:0:0:0:0:0:0:1', '2017-02-06 09:06:58', 'save');
INSERT INTO `ke_user_log` VALUES ('1815', '5', '/admin/dmalgo/save', '0:0:0:0:0:0:0:1', '2017-02-06 09:06:59', 'save');
INSERT INTO `ke_user_log` VALUES ('1816', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-06 09:09:05', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1817', '5', '/admin/dmalgo/save', '0:0:0:0:0:0:0:1', '2017-02-06 09:09:05', 'save');
INSERT INTO `ke_user_log` VALUES ('1818', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-06 09:10:42', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1819', '5', '/admin/dmalgo/save', '0:0:0:0:0:0:0:1', '2017-02-06 09:10:42', 'save');
INSERT INTO `ke_user_log` VALUES ('1820', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-06 09:12:19', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1821', '5', '/admin/dmalgo/save', '0:0:0:0:0:0:0:1', '2017-02-06 09:12:19', 'save');
INSERT INTO `ke_user_log` VALUES ('1822', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-06 09:15:47', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1823', '5', '/admin/dmalgo/save', '0:0:0:0:0:0:0:1', '2017-02-06 09:15:47', 'save');
INSERT INTO `ke_user_log` VALUES ('1824', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-06 09:15:47', 'index');
INSERT INTO `ke_user_log` VALUES ('1825', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-06 09:16:48', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1826', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-06 09:16:48', 'index');
INSERT INTO `ke_user_log` VALUES ('1827', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-06 09:16:49', 'index');
INSERT INTO `ke_user_log` VALUES ('1828', '5', '/admin/dmalgo/save', '0:0:0:0:0:0:0:1', '2017-02-06 09:17:02', 'save');
INSERT INTO `ke_user_log` VALUES ('1829', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-06 09:17:02', 'index');
INSERT INTO `ke_user_log` VALUES ('1830', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-06 09:19:33', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1831', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-06 09:19:33', 'index');
INSERT INTO `ke_user_log` VALUES ('1832', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-06 09:19:55', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1833', '5', '/admin/dmalgo/save', '0:0:0:0:0:0:0:1', '2017-02-06 09:19:55', 'save');
INSERT INTO `ke_user_log` VALUES ('1834', '5', '/admin/dmalgo/save', '0:0:0:0:0:0:0:1', '2017-02-06 09:20:24', 'save');
INSERT INTO `ke_user_log` VALUES ('1835', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-06 09:21:19', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1836', '5', '/admin/dmalgo/save', '0:0:0:0:0:0:0:1', '2017-02-06 09:21:19', 'save');
INSERT INTO `ke_user_log` VALUES ('1837', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-06 09:22:34', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1838', '5', '/admin/dmalgo/save', '0:0:0:0:0:0:0:1', '2017-02-06 09:22:34', 'save');
INSERT INTO `ke_user_log` VALUES ('1839', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-06 09:22:34', 'index');
INSERT INTO `ke_user_log` VALUES ('1840', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-06 09:23:26', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1841', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-06 09:23:26', 'index');
INSERT INTO `ke_user_log` VALUES ('1842', '5', '/admin/dmalgo/save', '0:0:0:0:0:0:0:1', '2017-02-06 09:23:48', 'save');
INSERT INTO `ke_user_log` VALUES ('1843', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-06 09:23:48', 'index');
INSERT INTO `ke_user_log` VALUES ('1844', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-06 09:26:25', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1845', '5', '/admin/dmalgo/save', '0:0:0:0:0:0:0:1', '2017-02-06 09:26:25', 'save');
INSERT INTO `ke_user_log` VALUES ('1846', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-06 09:26:25', 'index');
INSERT INTO `ke_user_log` VALUES ('1847', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-06 09:32:22', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1848', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-06 09:32:22', 'index');
INSERT INTO `ke_user_log` VALUES ('1849', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-06 09:32:26', 'index');
INSERT INTO `ke_user_log` VALUES ('1850', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-06 09:32:29', 'index');
INSERT INTO `ke_user_log` VALUES ('1851', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-06 09:32:31', 'index');
INSERT INTO `ke_user_log` VALUES ('1852', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-06 09:32:34', 'index');
INSERT INTO `ke_user_log` VALUES ('1853', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-06 09:35:09', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1854', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-06 09:35:09', 'index');
INSERT INTO `ke_user_log` VALUES ('1855', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-06 09:35:16', 'index');
INSERT INTO `ke_user_log` VALUES ('1856', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-06 09:35:19', 'index');
INSERT INTO `ke_user_log` VALUES ('1857', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-06 09:35:21', 'index');
INSERT INTO `ke_user_log` VALUES ('1858', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-06 09:35:23', 'index');
INSERT INTO `ke_user_log` VALUES ('1859', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-06 09:35:25', 'index');
INSERT INTO `ke_user_log` VALUES ('1860', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-06 09:35:31', 'index');
INSERT INTO `ke_user_log` VALUES ('1861', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-06 09:35:42', 'index');
INSERT INTO `ke_user_log` VALUES ('1862', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-06 09:36:40', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1863', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-06 09:36:40', 'index');
INSERT INTO `ke_user_log` VALUES ('1864', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-06 09:36:46', 'index');
INSERT INTO `ke_user_log` VALUES ('1865', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-06 09:36:48', 'index');
INSERT INTO `ke_user_log` VALUES ('1866', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-06 09:36:51', 'index');
INSERT INTO `ke_user_log` VALUES ('1867', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-06 09:36:56', 'index');
INSERT INTO `ke_user_log` VALUES ('1868', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-06 09:37:01', 'index');
INSERT INTO `ke_user_log` VALUES ('1869', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-06 09:37:02', 'index');
INSERT INTO `ke_user_log` VALUES ('1870', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-06 09:37:03', 'index');
INSERT INTO `ke_user_log` VALUES ('1871', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-06 09:40:12', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1872', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-06 09:40:12', 'index');
INSERT INTO `ke_user_log` VALUES ('1873', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-06 09:40:29', 'index');
INSERT INTO `ke_user_log` VALUES ('1874', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-06 09:40:57', 'index');
INSERT INTO `ke_user_log` VALUES ('1875', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-06 09:40:58', 'index');
INSERT INTO `ke_user_log` VALUES ('1876', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-06 09:41:57', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1877', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-06 09:41:57', 'index');
INSERT INTO `ke_user_log` VALUES ('1878', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-06 09:42:40', 'index');
INSERT INTO `ke_user_log` VALUES ('1879', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-06 09:42:43', 'index');
INSERT INTO `ke_user_log` VALUES ('1880', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-06 09:42:46', 'index');
INSERT INTO `ke_user_log` VALUES ('1881', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-06 09:42:48', 'index');
INSERT INTO `ke_user_log` VALUES ('1882', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-06 09:43:14', 'index');
INSERT INTO `ke_user_log` VALUES ('1883', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-06 09:43:15', 'index');
INSERT INTO `ke_user_log` VALUES ('1884', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-06 09:43:16', 'index');
INSERT INTO `ke_user_log` VALUES ('1885', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-06 09:47:27', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1886', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-06 09:47:27', 'index');
INSERT INTO `ke_user_log` VALUES ('1887', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-06 09:47:29', 'index');
INSERT INTO `ke_user_log` VALUES ('1888', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-06 09:48:54', 'index');
INSERT INTO `ke_user_log` VALUES ('1889', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-06 09:49:51', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1890', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-06 09:49:51', 'index');
INSERT INTO `ke_user_log` VALUES ('1891', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-06 09:55:04', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1892', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-06 09:55:04', 'index');
INSERT INTO `ke_user_log` VALUES ('1893', '5', '/admin/dmalgo/revStatus', '0:0:0:0:0:0:0:1', '2017-02-06 09:55:06', 'revStatus');
INSERT INTO `ke_user_log` VALUES ('1894', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-06 09:56:25', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1895', '5', '/admin/dmalgo/revStatus', '0:0:0:0:0:0:0:1', '2017-02-06 09:56:25', 'revStatus');
INSERT INTO `ke_user_log` VALUES ('1896', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-06 09:56:25', 'index');
INSERT INTO `ke_user_log` VALUES ('1897', '5', '/admin/dmalgo/revStatus', '0:0:0:0:0:0:0:1', '2017-02-06 09:56:26', 'revStatus');
INSERT INTO `ke_user_log` VALUES ('1898', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-06 09:56:26', 'index');
INSERT INTO `ke_user_log` VALUES ('1899', '5', '/admin/dmalgo/revStatus', '0:0:0:0:0:0:0:1', '2017-02-06 09:56:28', 'revStatus');
INSERT INTO `ke_user_log` VALUES ('1900', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-06 09:56:28', 'index');
INSERT INTO `ke_user_log` VALUES ('1901', '5', '/admin/dmalgo/revStatus', '0:0:0:0:0:0:0:1', '2017-02-06 09:56:29', 'revStatus');
INSERT INTO `ke_user_log` VALUES ('1902', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-06 09:56:29', 'index');
INSERT INTO `ke_user_log` VALUES ('1903', '5', '/admin/dmalgo/revStatus', '0:0:0:0:0:0:0:1', '2017-02-06 09:56:29', 'revStatus');
INSERT INTO `ke_user_log` VALUES ('1904', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-06 09:56:29', 'index');
INSERT INTO `ke_user_log` VALUES ('1905', '5', '/admin/dmalgo/revStatus', '0:0:0:0:0:0:0:1', '2017-02-06 09:56:30', 'revStatus');
INSERT INTO `ke_user_log` VALUES ('1906', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-06 09:56:30', 'index');
INSERT INTO `ke_user_log` VALUES ('1907', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-06 10:01:02', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1908', '5', '/admin/dmalgo/save', '0:0:0:0:0:0:0:1', '2017-02-06 10:01:02', 'save');
INSERT INTO `ke_user_log` VALUES ('1909', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-06 10:01:55', 'index');
INSERT INTO `ke_user_log` VALUES ('1910', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-06 10:01:55', 'index');
INSERT INTO `ke_user_log` VALUES ('1911', '5', '/admin/dmalgo/save', '0:0:0:0:0:0:0:1', '2017-02-06 10:02:06', 'save');
INSERT INTO `ke_user_log` VALUES ('1912', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-06 10:05:38', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1913', '5', '/admin/dmalgo/save', '0:0:0:0:0:0:0:1', '2017-02-06 10:05:38', 'save');
INSERT INTO `ke_user_log` VALUES ('1914', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-06 10:06:04', 'index');
INSERT INTO `ke_user_log` VALUES ('1915', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-06 10:06:05', 'index');
INSERT INTO `ke_user_log` VALUES ('1916', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-06 10:06:31', 'index');
INSERT INTO `ke_user_log` VALUES ('1917', '5', '/admin/dmalgo/save', '0:0:0:0:0:0:0:1', '2017-02-06 10:06:34', 'save');
INSERT INTO `ke_user_log` VALUES ('1918', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-06 10:07:27', 'index');
INSERT INTO `ke_user_log` VALUES ('1919', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-06 10:07:28', 'index');
INSERT INTO `ke_user_log` VALUES ('1920', '5', '/admin/dmalgo/save', '0:0:0:0:0:0:0:1', '2017-02-06 10:07:30', 'save');
INSERT INTO `ke_user_log` VALUES ('1921', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-06 10:08:27', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1922', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-06 10:08:27', 'index');
INSERT INTO `ke_user_log` VALUES ('1923', '5', '/admin/dmalgo/save', '0:0:0:0:0:0:0:1', '2017-02-06 10:08:38', 'save');
INSERT INTO `ke_user_log` VALUES ('1924', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-06 10:09:10', 'index');
INSERT INTO `ke_user_log` VALUES ('1925', '5', '/admin/dmalgo/save', '0:0:0:0:0:0:0:1', '2017-02-06 10:09:27', 'save');
INSERT INTO `ke_user_log` VALUES ('1926', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-06 10:09:30', 'index');
INSERT INTO `ke_user_log` VALUES ('1927', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-06 10:10:43', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1928', '5', '/admin/dmalgo/save', '0:0:0:0:0:0:0:1', '2017-02-06 10:10:43', 'save');
INSERT INTO `ke_user_log` VALUES ('1929', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-06 10:10:46', 'index');
INSERT INTO `ke_user_log` VALUES ('1930', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-06 10:10:46', 'index');
INSERT INTO `ke_user_log` VALUES ('1931', '5', '/admin/dmalgo/save', '0:0:0:0:0:0:0:1', '2017-02-06 10:10:48', 'save');
INSERT INTO `ke_user_log` VALUES ('1932', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-06 10:14:40', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1933', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-06 10:14:40', 'index');
INSERT INTO `ke_user_log` VALUES ('1934', '5', '/admin/dmalgo/save', '0:0:0:0:0:0:0:1', '2017-02-06 10:14:43', 'save');
INSERT INTO `ke_user_log` VALUES ('1935', '5', '/admin/dmalgo/save', '0:0:0:0:0:0:0:1', '2017-02-06 10:14:45', 'save');
INSERT INTO `ke_user_log` VALUES ('1936', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-06 10:15:32', 'index');
INSERT INTO `ke_user_log` VALUES ('1937', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-06 10:15:33', 'index');
INSERT INTO `ke_user_log` VALUES ('1938', '5', '/admin/dmalgo/save', '0:0:0:0:0:0:0:1', '2017-02-06 10:15:36', 'save');
INSERT INTO `ke_user_log` VALUES ('1939', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-06 10:16:48', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1940', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-06 10:16:48', 'index');
INSERT INTO `ke_user_log` VALUES ('1941', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-06 10:17:12', 'index');
INSERT INTO `ke_user_log` VALUES ('1942', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-06 10:18:49', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1943', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-06 10:18:49', 'index');
INSERT INTO `ke_user_log` VALUES ('1944', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-06 10:18:50', 'index');
INSERT INTO `ke_user_log` VALUES ('1945', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-06 10:22:06', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1946', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-06 10:22:06', 'index');
INSERT INTO `ke_user_log` VALUES ('1947', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-06 10:22:07', 'index');
INSERT INTO `ke_user_log` VALUES ('1948', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-06 10:22:39', 'index');
INSERT INTO `ke_user_log` VALUES ('1949', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-06 10:22:40', 'index');
INSERT INTO `ke_user_log` VALUES ('1950', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-06 10:23:47', 'index');
INSERT INTO `ke_user_log` VALUES ('1951', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-06 10:23:47', 'index');
INSERT INTO `ke_user_log` VALUES ('1952', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-06 10:23:48', 'index');
INSERT INTO `ke_user_log` VALUES ('1953', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-06 10:24:39', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1954', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-06 10:24:39', 'index');
INSERT INTO `ke_user_log` VALUES ('1955', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-06 10:24:40', 'index');
INSERT INTO `ke_user_log` VALUES ('1956', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-06 10:25:05', 'index');
INSERT INTO `ke_user_log` VALUES ('1957', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-06 10:25:06', 'index');
INSERT INTO `ke_user_log` VALUES ('1958', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-06 10:26:22', 'index');
INSERT INTO `ke_user_log` VALUES ('1959', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-06 10:26:23', 'index');
INSERT INTO `ke_user_log` VALUES ('1960', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-06 10:26:50', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1961', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-06 10:26:50', 'index');
INSERT INTO `ke_user_log` VALUES ('1962', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-06 10:26:51', 'index');
INSERT INTO `ke_user_log` VALUES ('1963', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-06 10:27:44', 'index');
INSERT INTO `ke_user_log` VALUES ('1964', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-06 10:27:45', 'index');
INSERT INTO `ke_user_log` VALUES ('1965', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-06 10:28:12', 'index');
INSERT INTO `ke_user_log` VALUES ('1966', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-06 10:28:12', 'index');
INSERT INTO `ke_user_log` VALUES ('1967', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-06 10:29:00', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1968', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-06 10:29:00', 'index');
INSERT INTO `ke_user_log` VALUES ('1969', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-06 10:29:01', 'index');
INSERT INTO `ke_user_log` VALUES ('1970', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-06 10:29:01', 'index');
INSERT INTO `ke_user_log` VALUES ('1971', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-06 10:29:54', 'index');
INSERT INTO `ke_user_log` VALUES ('1972', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-06 10:29:54', 'index');
INSERT INTO `ke_user_log` VALUES ('1973', '5', '/admin/dmalgo/save', '0:0:0:0:0:0:0:1', '2017-02-06 10:30:11', 'save');
INSERT INTO `ke_user_log` VALUES ('1974', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-06 10:32:21', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1975', '5', '/admin/dmalgo/save', '0:0:0:0:0:0:0:1', '2017-02-06 10:32:21', 'save');
INSERT INTO `ke_user_log` VALUES ('1976', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-06 10:33:23', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1977', '5', '/admin/dmalgo/save', '0:0:0:0:0:0:0:1', '2017-02-06 10:33:23', 'save');
INSERT INTO `ke_user_log` VALUES ('1978', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-06 10:33:23', 'index');
INSERT INTO `ke_user_log` VALUES ('1979', '5', '/admin/dmalgo/getAlgoById', '0:0:0:0:0:0:0:1', '2017-02-06 10:34:00', 'getAlgoById');
INSERT INTO `ke_user_log` VALUES ('1980', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-06 10:34:53', 'index');
INSERT INTO `ke_user_log` VALUES ('1981', '5', '/admin/dmalgo/getAlgoById', '0:0:0:0:0:0:0:1', '2017-02-06 10:34:56', 'getAlgoById');
INSERT INTO `ke_user_log` VALUES ('1982', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-06 10:35:00', 'index');
INSERT INTO `ke_user_log` VALUES ('1983', '5', '/admin/dmalgo/getAlgoById', '0:0:0:0:0:0:0:1', '2017-02-06 10:35:03', 'getAlgoById');
INSERT INTO `ke_user_log` VALUES ('1984', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-06 10:35:34', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1985', '5', '/admin/dmalgo/getAlgoById', '0:0:0:0:0:0:0:1', '2017-02-06 10:35:34', 'getAlgoById');
INSERT INTO `ke_user_log` VALUES ('1986', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-06 10:36:50', 'index');
INSERT INTO `ke_user_log` VALUES ('1987', '5', '/admin/dmalgo/getAlgoById', '0:0:0:0:0:0:0:1', '2017-02-06 10:36:54', 'getAlgoById');
INSERT INTO `ke_user_log` VALUES ('1988', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-06 10:37:51', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1989', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-06 10:37:51', 'index');
INSERT INTO `ke_user_log` VALUES ('1990', '5', '/admin/dmalgo/getAlgoById', '0:0:0:0:0:0:0:1', '2017-02-06 10:37:54', 'getAlgoById');
INSERT INTO `ke_user_log` VALUES ('1991', '5', '/admin/dmalgo/getAlgoById', '0:0:0:0:0:0:0:1', '2017-02-06 10:37:59', 'getAlgoById');
INSERT INTO `ke_user_log` VALUES ('1992', '5', '/admin/dmalgo/getAlgoById', '0:0:0:0:0:0:0:1', '2017-02-06 10:38:04', 'getAlgoById');
INSERT INTO `ke_user_log` VALUES ('1993', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-06 10:38:07', 'index');
INSERT INTO `ke_user_log` VALUES ('1994', '5', '/admin/dmalgo/getAlgoById', '0:0:0:0:0:0:0:1', '2017-02-06 10:38:10', 'getAlgoById');
INSERT INTO `ke_user_log` VALUES ('1995', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-06 11:05:22', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1996', '5', '/admin/dmsubmit', '0:0:0:0:0:0:0:1', '2017-02-06 11:05:22', 'index');
INSERT INTO `ke_user_log` VALUES ('1997', '5', '/admin/dmsubmit', '0:0:0:0:0:0:0:1', '2017-02-06 11:05:25', 'index');
INSERT INTO `ke_user_log` VALUES ('1998', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-06 11:07:14', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('1999', '5', '/admin/dmsubmit', '0:0:0:0:0:0:0:1', '2017-02-06 11:07:14', 'index');
INSERT INTO `ke_user_log` VALUES ('2000', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-06 11:07:58', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2001', '5', '/admin/dmsubmit', '0:0:0:0:0:0:0:1', '2017-02-06 11:07:58', 'index');
INSERT INTO `ke_user_log` VALUES ('2002', '5', '/admin/dmsubmit', '0:0:0:0:0:0:0:1', '2017-02-06 11:08:04', 'index');
INSERT INTO `ke_user_log` VALUES ('2003', '5', '/admin/dmsubmit', '0:0:0:0:0:0:0:1', '2017-02-06 11:08:12', 'index');
INSERT INTO `ke_user_log` VALUES ('2004', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-06 11:09:12', 'index');
INSERT INTO `ke_user_log` VALUES ('2005', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-06 11:11:13', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2006', '5', '/admin', '0:0:0:0:0:0:0:1', '2017-02-06 11:11:13', 'index');
INSERT INTO `ke_user_log` VALUES ('2007', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-06 11:11:14', 'index');
INSERT INTO `ke_user_log` VALUES ('2008', '5', '/admin', '0:0:0:0:0:0:0:1', '2017-02-06 11:11:42', 'index');
INSERT INTO `ke_user_log` VALUES ('2009', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-06 11:11:43', 'index');
INSERT INTO `ke_user_log` VALUES ('2010', '5', '/admin', '0:0:0:0:0:0:0:1', '2017-02-06 11:11:52', 'index');
INSERT INTO `ke_user_log` VALUES ('2011', '5', '/admin', '0:0:0:0:0:0:0:1', '2017-02-06 11:11:53', 'index');
INSERT INTO `ke_user_log` VALUES ('2012', '5', '/admin', '0:0:0:0:0:0:0:1', '2017-02-06 11:11:54', 'index');
INSERT INTO `ke_user_log` VALUES ('2013', '5', '/admin', '0:0:0:0:0:0:0:1', '2017-02-06 11:11:54', 'index');
INSERT INTO `ke_user_log` VALUES ('2014', '5', '/admin', '0:0:0:0:0:0:0:1', '2017-02-06 11:11:55', 'index');
INSERT INTO `ke_user_log` VALUES ('2015', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-06 11:11:56', 'index');
INSERT INTO `ke_user_log` VALUES ('2016', '5', '/admin', '0:0:0:0:0:0:0:1', '2017-02-06 11:11:59', 'index');
INSERT INTO `ke_user_log` VALUES ('2017', '5', '/admin', '0:0:0:0:0:0:0:1', '2017-02-06 11:12:00', 'index');
INSERT INTO `ke_user_log` VALUES ('2018', '5', '/admin', '0:0:0:0:0:0:0:1', '2017-02-06 11:12:01', 'index');
INSERT INTO `ke_user_log` VALUES ('2019', '5', '/admin', '0:0:0:0:0:0:0:1', '2017-02-06 11:12:01', 'index');
INSERT INTO `ke_user_log` VALUES ('2020', '5', '/admin', '0:0:0:0:0:0:0:1', '2017-02-06 11:12:02', 'index');
INSERT INTO `ke_user_log` VALUES ('2021', '5', '/admin', '0:0:0:0:0:0:0:1', '2017-02-06 11:12:02', 'index');
INSERT INTO `ke_user_log` VALUES ('2022', '5', '/admin', '0:0:0:0:0:0:0:1', '2017-02-06 11:12:03', 'index');
INSERT INTO `ke_user_log` VALUES ('2023', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-06 12:23:56', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2024', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-06 12:23:56', 'index');
INSERT INTO `ke_user_log` VALUES ('2025', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-06 12:29:59', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2026', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-06 12:29:59', 'index');
INSERT INTO `ke_user_log` VALUES ('2027', '5', '/admin/menu/getMenuById', '0:0:0:0:0:0:0:1', '2017-02-06 12:30:15', 'getMenuById');
INSERT INTO `ke_user_log` VALUES ('2028', '5', '/admin/menu/save', '0:0:0:0:0:0:0:1', '2017-02-06 12:30:20', 'save');
INSERT INTO `ke_user_log` VALUES ('2029', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-06 12:30:20', 'index');
INSERT INTO `ke_user_log` VALUES ('2030', '5', '/admin/menu/getMenuById', '0:0:0:0:0:0:0:1', '2017-02-06 12:30:27', 'getMenuById');
INSERT INTO `ke_user_log` VALUES ('2031', '5', '/admin/menu/save', '0:0:0:0:0:0:0:1', '2017-02-06 12:30:37', 'save');
INSERT INTO `ke_user_log` VALUES ('2032', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-06 12:30:37', 'index');
INSERT INTO `ke_user_log` VALUES ('2033', '5', '/admin/menu/getMenuById', '0:0:0:0:0:0:0:1', '2017-02-06 12:30:40', 'getMenuById');
INSERT INTO `ke_user_log` VALUES ('2034', '5', '/admin/menu/save', '0:0:0:0:0:0:0:1', '2017-02-06 12:30:57', 'save');
INSERT INTO `ke_user_log` VALUES ('2035', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-06 12:30:57', 'index');
INSERT INTO `ke_user_log` VALUES ('2036', '5', '/admin/menu/getMenuById', '0:0:0:0:0:0:0:1', '2017-02-06 12:31:01', 'getMenuById');
INSERT INTO `ke_user_log` VALUES ('2037', '5', '/admin/menu/save', '0:0:0:0:0:0:0:1', '2017-02-06 12:31:08', 'save');
INSERT INTO `ke_user_log` VALUES ('2038', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-06 12:31:08', 'index');
INSERT INTO `ke_user_log` VALUES ('2039', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-06 13:19:41', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2040', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-06 13:19:41', 'index');
INSERT INTO `ke_user_log` VALUES ('2041', '5', '/admin/knfile', '0:0:0:0:0:0:0:1', '2017-02-06 13:19:43', 'index');
INSERT INTO `ke_user_log` VALUES ('2042', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-06 13:20:08', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2043', '5', '/admin/knfile', '0:0:0:0:0:0:0:1', '2017-02-06 13:20:08', 'index');
INSERT INTO `ke_user_log` VALUES ('2044', '5', '/admin/knfile', '0:0:0:0:0:0:0:1', '2017-02-06 13:20:42', 'index');
INSERT INTO `ke_user_log` VALUES ('2045', '5', '/admin/knfile', '0:0:0:0:0:0:0:1', '2017-02-06 13:21:38', 'index');
INSERT INTO `ke_user_log` VALUES ('2046', '5', '/admin/knfile', '0:0:0:0:0:0:0:1', '2017-02-06 13:21:40', 'index');
INSERT INTO `ke_user_log` VALUES ('2047', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-06 13:28:36', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2048', '5', '/admin/knfile', '0:0:0:0:0:0:0:1', '2017-02-06 13:28:36', 'index');
INSERT INTO `ke_user_log` VALUES ('2049', '5', '/admin/knfile', '0:0:0:0:0:0:0:1', '2017-02-06 13:28:37', 'index');
INSERT INTO `ke_user_log` VALUES ('2050', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-06 13:35:40', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2051', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-06 13:35:40', 'index');
INSERT INTO `ke_user_log` VALUES ('2052', '5', '/admin/knfile', '0:0:0:0:0:0:0:1', '2017-02-06 13:36:05', 'index');
INSERT INTO `ke_user_log` VALUES ('2053', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-06 13:36:36', 'index');
INSERT INTO `ke_user_log` VALUES ('2054', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-06 13:37:46', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2055', '5', '/admin/knfile', '0:0:0:0:0:0:0:1', '2017-02-06 13:37:46', 'index');
INSERT INTO `ke_user_log` VALUES ('2056', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-06 13:47:27', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2057', '5', '/admin/knfile', '0:0:0:0:0:0:0:1', '2017-02-06 13:47:28', 'index');
INSERT INTO `ke_user_log` VALUES ('2058', '5', '/admin/knfile/save', '0:0:0:0:0:0:0:1', '2017-02-06 13:47:45', 'save');
INSERT INTO `ke_user_log` VALUES ('2059', '5', '/admin/knfile', '0:0:0:0:0:0:0:1', '2017-02-06 13:47:45', 'index');
INSERT INTO `ke_user_log` VALUES ('2060', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-06 13:49:33', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2061', '5', '/admin/knfile', '0:0:0:0:0:0:0:1', '2017-02-06 13:49:33', 'index');
INSERT INTO `ke_user_log` VALUES ('2062', '5', '/admin/knfile/getKnFileById', '0:0:0:0:0:0:0:1', '2017-02-06 13:49:36', 'getKnFileById');
INSERT INTO `ke_user_log` VALUES ('2063', '5', '/admin/knfile', '0:0:0:0:0:0:0:1', '2017-02-06 13:50:10', 'index');
INSERT INTO `ke_user_log` VALUES ('2064', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-06 13:53:50', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2065', '5', '/admin/knfile/save', '0:0:0:0:0:0:0:1', '2017-02-06 13:53:50', 'save');
INSERT INTO `ke_user_log` VALUES ('2066', '5', '/admin/knfile', '0:0:0:0:0:0:0:1', '2017-02-06 13:53:50', 'index');
INSERT INTO `ke_user_log` VALUES ('2067', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-06 13:56:16', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2068', '5', '/admin/knfile', '0:0:0:0:0:0:0:1', '2017-02-06 13:56:16', 'index');
INSERT INTO `ke_user_log` VALUES ('2069', '5', '/admin/knfile/save', '0:0:0:0:0:0:0:1', '2017-02-06 13:56:29', 'save');
INSERT INTO `ke_user_log` VALUES ('2070', '5', '/admin/knfile', '0:0:0:0:0:0:0:1', '2017-02-06 13:56:29', 'index');
INSERT INTO `ke_user_log` VALUES ('2071', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-06 14:08:04', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2072', '5', '/admin/knfile/getKnFileById', '0:0:0:0:0:0:0:1', '2017-02-06 14:08:04', 'getKnFileById');
INSERT INTO `ke_user_log` VALUES ('2073', '5', '/admin/knfile/getKnFileById', '0:0:0:0:0:0:0:1', '2017-02-06 14:08:14', 'getKnFileById');
INSERT INTO `ke_user_log` VALUES ('2074', '5', '/admin/knfile/save', '0:0:0:0:0:0:0:1', '2017-02-06 14:08:23', 'save');
INSERT INTO `ke_user_log` VALUES ('2075', '5', '/admin/knfile', '0:0:0:0:0:0:0:1', '2017-02-06 14:08:23', 'index');
INSERT INTO `ke_user_log` VALUES ('2076', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-06 14:17:14', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2077', '5', '/admin/knfile', '0:0:0:0:0:0:0:1', '2017-02-06 14:17:14', 'index');
INSERT INTO `ke_user_log` VALUES ('2078', '5', '/admin/knfile/save', '0:0:0:0:0:0:0:1', '2017-02-06 14:17:31', 'save');
INSERT INTO `ke_user_log` VALUES ('2079', '5', '/admin/knfile', '0:0:0:0:0:0:0:1', '2017-02-06 14:17:31', 'index');
INSERT INTO `ke_user_log` VALUES ('2080', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-06 14:17:56', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2081', '5', '/admin/knfile', '0:0:0:0:0:0:0:1', '2017-02-06 14:17:56', 'index');
INSERT INTO `ke_user_log` VALUES ('2082', '5', '/admin/knfile/save', '0:0:0:0:0:0:0:1', '2017-02-06 14:18:05', 'save');
INSERT INTO `ke_user_log` VALUES ('2083', '5', '/admin/knfile', '0:0:0:0:0:0:0:1', '2017-02-06 14:18:05', 'index');
INSERT INTO `ke_user_log` VALUES ('2084', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-06 14:18:32', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2085', '5', '/admin/knfile', '0:0:0:0:0:0:0:1', '2017-02-06 14:18:32', 'index');
INSERT INTO `ke_user_log` VALUES ('2086', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-06 14:19:00', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2087', '5', '/admin/knfile/save', '0:0:0:0:0:0:0:1', '2017-02-06 14:19:00', 'save');
INSERT INTO `ke_user_log` VALUES ('2088', '5', '/admin/knfile', '0:0:0:0:0:0:0:1', '2017-02-06 14:19:00', 'index');
INSERT INTO `ke_user_log` VALUES ('2089', '5', '/admin/knfile', '0:0:0:0:0:0:0:1', '2017-02-06 14:19:39', 'index');
INSERT INTO `ke_user_log` VALUES ('2090', '5', '/admin/knfile', '0:0:0:0:0:0:0:1', '2017-02-06 14:19:40', 'index');
INSERT INTO `ke_user_log` VALUES ('2091', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-06 14:21:04', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2092', '5', '/admin/knfile', '0:0:0:0:0:0:0:1', '2017-02-06 14:21:05', 'index');
INSERT INTO `ke_user_log` VALUES ('2093', '5', '/admin/knfile', '0:0:0:0:0:0:0:1', '2017-02-06 14:21:08', 'index');
INSERT INTO `ke_user_log` VALUES ('2094', '5', '/admin/knfile', '0:0:0:0:0:0:0:1', '2017-02-06 14:21:49', 'index');
INSERT INTO `ke_user_log` VALUES ('2095', '5', '/admin/knfile', '0:0:0:0:0:0:0:1', '2017-02-06 14:21:49', 'index');
INSERT INTO `ke_user_log` VALUES ('2096', '5', '/admin/knfile', '0:0:0:0:0:0:0:1', '2017-02-06 14:21:50', 'index');
INSERT INTO `ke_user_log` VALUES ('2097', '5', '/admin/knfile/getKnFileById', '0:0:0:0:0:0:0:1', '2017-02-06 14:21:56', 'getKnFileById');
INSERT INTO `ke_user_log` VALUES ('2098', '5', '/admin/knfile/getKnFileById', '0:0:0:0:0:0:0:1', '2017-02-06 14:22:06', 'getKnFileById');
INSERT INTO `ke_user_log` VALUES ('2099', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-06 14:23:29', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2100', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-06 14:23:29', 'index');
INSERT INTO `ke_user_log` VALUES ('2101', '5', '/admin', '0:0:0:0:0:0:0:1', '2017-02-06 14:23:36', 'index');
INSERT INTO `ke_user_log` VALUES ('2102', '5', '/admin/knfile', '0:0:0:0:0:0:0:1', '2017-02-06 14:23:38', 'index');
INSERT INTO `ke_user_log` VALUES ('2103', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-06 14:37:31', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2104', '5', '/admin/knfile', '0:0:0:0:0:0:0:1', '2017-02-06 14:37:31', 'index');
INSERT INTO `ke_user_log` VALUES ('2105', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-06 14:40:15', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2106', '5', '/admin/knfile', '0:0:0:0:0:0:0:1', '2017-02-06 14:40:15', 'index');
INSERT INTO `ke_user_log` VALUES ('2107', '5', '/admin/knfile', '0:0:0:0:0:0:0:1', '2017-02-06 14:40:19', 'index');
INSERT INTO `ke_user_log` VALUES ('2108', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-06 14:42:15', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2109', '5', '/admin/knfile', '0:0:0:0:0:0:0:1', '2017-02-06 14:42:15', 'index');
INSERT INTO `ke_user_log` VALUES ('2110', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-06 14:43:19', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2111', '5', '/admin/knfile', '0:0:0:0:0:0:0:1', '2017-02-06 14:43:19', 'index');
INSERT INTO `ke_user_log` VALUES ('2112', '5', '/admin/knfile/fileDown', '0:0:0:0:0:0:0:1', '2017-02-06 14:43:22', 'fileDown');
INSERT INTO `ke_user_log` VALUES ('2113', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-06 14:44:28', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2114', '5', '/admin/knfile', '0:0:0:0:0:0:0:1', '2017-02-06 14:44:28', 'index');
INSERT INTO `ke_user_log` VALUES ('2115', '5', '/admin/knfile', '0:0:0:0:0:0:0:1', '2017-02-06 14:44:29', 'index');
INSERT INTO `ke_user_log` VALUES ('2116', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-06 14:44:57', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2117', '5', '/admin/knfile', '0:0:0:0:0:0:0:1', '2017-02-06 14:44:57', 'index');
INSERT INTO `ke_user_log` VALUES ('2118', '5', '/admin/knfile/fileDown', '0:0:0:0:0:0:0:1', '2017-02-06 14:44:58', 'fileDown');
INSERT INTO `ke_user_log` VALUES ('2119', '5', '/admin/knfile/fileDown', '0:0:0:0:0:0:0:1', '2017-02-06 14:46:38', 'fileDown');
INSERT INTO `ke_user_log` VALUES ('2120', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-06 14:48:49', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2121', '5', '/admin/knfile', '0:0:0:0:0:0:0:1', '2017-02-06 14:48:49', 'index');
INSERT INTO `ke_user_log` VALUES ('2122', '5', '/admin/knfile/fileDown', '0:0:0:0:0:0:0:1', '2017-02-06 14:48:53', 'fileDown');
INSERT INTO `ke_user_log` VALUES ('2123', '5', '/admin/knfile', '0:0:0:0:0:0:0:1', '2017-02-06 14:50:01', 'index');
INSERT INTO `ke_user_log` VALUES ('2124', '5', '/admin/knfile/fileDown', '0:0:0:0:0:0:0:1', '2017-02-06 14:50:07', 'fileDown');
INSERT INTO `ke_user_log` VALUES ('2125', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-06 14:51:26', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2126', '5', '/admin/knfile', '0:0:0:0:0:0:0:1', '2017-02-06 14:51:26', 'index');
INSERT INTO `ke_user_log` VALUES ('2127', '5', '/admin/knfile/fileDown', '0:0:0:0:0:0:0:1', '2017-02-06 14:51:28', 'fileDown');
INSERT INTO `ke_user_log` VALUES ('2128', '5', '/admin/knfile', '0:0:0:0:0:0:0:1', '2017-02-06 14:51:54', 'index');
INSERT INTO `ke_user_log` VALUES ('2129', '5', '/admin/knfile/fileDown', '0:0:0:0:0:0:0:1', '2017-02-06 14:51:56', 'fileDown');
INSERT INTO `ke_user_log` VALUES ('2130', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-06 16:43:18', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2131', '5', '/admin/knfile/fileDown', '0:0:0:0:0:0:0:1', '2017-02-06 16:43:18', 'fileDown');
INSERT INTO `ke_user_log` VALUES ('2132', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-06 16:45:30', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2133', '5', '/admin/knfile', '0:0:0:0:0:0:0:1', '2017-02-06 16:45:30', 'index');
INSERT INTO `ke_user_log` VALUES ('2134', '5', '/admin/knfile/fileDown', '0:0:0:0:0:0:0:1', '2017-02-06 16:45:34', 'fileDown');
INSERT INTO `ke_user_log` VALUES ('2135', '5', '/admin/knfile/fileDown', '0:0:0:0:0:0:0:1', '2017-02-06 16:45:41', 'fileDown');
INSERT INTO `ke_user_log` VALUES ('2136', '5', '/admin/knfile/fileDown', '0:0:0:0:0:0:0:1', '2017-02-06 16:46:08', 'fileDown');
INSERT INTO `ke_user_log` VALUES ('2137', '5', '/admin/knfile/fileDown', '0:0:0:0:0:0:0:1', '2017-02-06 16:46:23', 'fileDown');
INSERT INTO `ke_user_log` VALUES ('2138', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-06 16:47:27', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2139', '5', '/admin/knfile/getKnFileById', '0:0:0:0:0:0:0:1', '2017-02-06 16:47:27', 'getKnFileById');
INSERT INTO `ke_user_log` VALUES ('2140', '5', '/admin/knfile/save', '0:0:0:0:0:0:0:1', '2017-02-06 16:47:35', 'save');
INSERT INTO `ke_user_log` VALUES ('2141', '5', '/admin/knfile', '0:0:0:0:0:0:0:1', '2017-02-06 16:47:35', 'index');
INSERT INTO `ke_user_log` VALUES ('2142', '5', '/admin/knfile/fileDown', '0:0:0:0:0:0:0:1', '2017-02-06 16:47:39', 'fileDown');
INSERT INTO `ke_user_log` VALUES ('2143', '5', '/admin/knfile', '0:0:0:0:0:0:0:1', '2017-02-06 16:49:10', 'index');
INSERT INTO `ke_user_log` VALUES ('2144', '5', '/admin/knfile', '0:0:0:0:0:0:0:1', '2017-02-06 16:49:11', 'index');
INSERT INTO `ke_user_log` VALUES ('2145', '5', '/admin/knfile/fileDown', '0:0:0:0:0:0:0:1', '2017-02-06 16:49:13', 'fileDown');
INSERT INTO `ke_user_log` VALUES ('2146', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-06 16:49:41', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2147', '5', '/admin/knfile/fileDown', '0:0:0:0:0:0:0:1', '2017-02-06 16:49:41', 'fileDown');
INSERT INTO `ke_user_log` VALUES ('2148', '5', '/admin/knfile/fileDown', '0:0:0:0:0:0:0:1', '2017-02-06 16:49:43', 'fileDown');
INSERT INTO `ke_user_log` VALUES ('2149', '5', '/admin/knfile/fileDown', '0:0:0:0:0:0:0:1', '2017-02-06 16:49:44', 'fileDown');
INSERT INTO `ke_user_log` VALUES ('2150', '5', '/admin/knfile/fileDown', '0:0:0:0:0:0:0:1', '2017-02-06 16:49:45', 'fileDown');
INSERT INTO `ke_user_log` VALUES ('2151', '5', '/admin/knfile/fileDown', '0:0:0:0:0:0:0:1', '2017-02-06 16:49:46', 'fileDown');
INSERT INTO `ke_user_log` VALUES ('2152', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-06 16:52:07', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2153', '5', '/admin/knfile', '0:0:0:0:0:0:0:1', '2017-02-06 16:52:07', 'index');
INSERT INTO `ke_user_log` VALUES ('2154', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-06 16:52:12', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2155', '5', '/admin/knfile', '0:0:0:0:0:0:0:1', '2017-02-06 16:52:12', 'index');
INSERT INTO `ke_user_log` VALUES ('2156', '5', '/admin/knfile/fileDown', '0:0:0:0:0:0:0:1', '2017-02-06 16:52:14', 'fileDown');
INSERT INTO `ke_user_log` VALUES ('2157', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-06 17:01:43', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2158', '5', '/admin/knfile', '0:0:0:0:0:0:0:1', '2017-02-06 17:01:43', 'index');
INSERT INTO `ke_user_log` VALUES ('2159', '5', '/admin/knfile/fileDown', '0:0:0:0:0:0:0:1', '2017-02-06 17:01:46', 'fileDown');
INSERT INTO `ke_user_log` VALUES ('2160', '5', '/admin/knfile/fileDown', '0:0:0:0:0:0:0:1', '2017-02-06 17:01:51', 'fileDown');
INSERT INTO `ke_user_log` VALUES ('2161', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-06 17:03:20', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2162', '5', '/admin/knfile', '0:0:0:0:0:0:0:1', '2017-02-06 17:03:20', 'index');
INSERT INTO `ke_user_log` VALUES ('2163', '5', '/admin/knfile/fileDown', '0:0:0:0:0:0:0:1', '2017-02-06 17:03:23', 'fileDown');
INSERT INTO `ke_user_log` VALUES ('2164', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-06 17:05:16', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2165', '5', '/admin/knfile', '0:0:0:0:0:0:0:1', '2017-02-06 17:05:16', 'index');
INSERT INTO `ke_user_log` VALUES ('2166', '5', '/admin/knfile/fileDown', '0:0:0:0:0:0:0:1', '2017-02-06 17:05:19', 'fileDown');
INSERT INTO `ke_user_log` VALUES ('2167', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-06 17:09:11', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2168', '5', '/admin/knfile', '0:0:0:0:0:0:0:1', '2017-02-06 17:09:11', 'index');
INSERT INTO `ke_user_log` VALUES ('2169', '5', '/admin/knfile/fileDown', '0:0:0:0:0:0:0:1', '2017-02-06 17:09:13', 'fileDown');
INSERT INTO `ke_user_log` VALUES ('2170', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-06 17:09:48', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2171', '5', '/admin/knfile/fileDown', '0:0:0:0:0:0:0:1', '2017-02-06 17:09:48', 'fileDown');
INSERT INTO `ke_user_log` VALUES ('2172', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-06 17:10:28', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2173', '5', '/admin/knfile/fileDown', '0:0:0:0:0:0:0:1', '2017-02-06 17:10:29', 'fileDown');
INSERT INTO `ke_user_log` VALUES ('2174', '5', '/admin/knfile', '0:0:0:0:0:0:0:1', '2017-02-06 17:12:07', 'index');
INSERT INTO `ke_user_log` VALUES ('2175', '5', '/admin/knfile/fileDown', '0:0:0:0:0:0:0:1', '2017-02-06 17:12:09', 'fileDown');
INSERT INTO `ke_user_log` VALUES ('2176', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-06 17:12:42', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2177', '5', '/admin/knfile', '0:0:0:0:0:0:0:1', '2017-02-06 17:12:42', 'index');
INSERT INTO `ke_user_log` VALUES ('2178', '5', '/admin/knfile/fileDown', '0:0:0:0:0:0:0:1', '2017-02-06 17:12:43', 'fileDown');
INSERT INTO `ke_user_log` VALUES ('2179', '5', '/admin/knfile', '0:0:0:0:0:0:0:1', '2017-02-06 17:12:59', 'index');
INSERT INTO `ke_user_log` VALUES ('2180', '5', '/admin/knfile/fileDown', '0:0:0:0:0:0:0:1', '2017-02-06 17:13:04', 'fileDown');
INSERT INTO `ke_user_log` VALUES ('2181', '5', '/admin/knfile', '0:0:0:0:0:0:0:1', '2017-02-06 17:13:12', 'index');
INSERT INTO `ke_user_log` VALUES ('2182', '5', '/admin/knfile', '0:0:0:0:0:0:0:1', '2017-02-06 17:13:31', 'index');
INSERT INTO `ke_user_log` VALUES ('2183', '5', '/admin/knfile/fileDown', '0:0:0:0:0:0:0:1', '2017-02-06 17:13:37', 'fileDown');
INSERT INTO `ke_user_log` VALUES ('2184', '5', '/admin/knfile/fileDown', '0:0:0:0:0:0:0:1', '2017-02-06 17:13:40', 'fileDown');
INSERT INTO `ke_user_log` VALUES ('2185', '5', '/admin/knfile/fileDown', '0:0:0:0:0:0:0:1', '2017-02-06 17:13:43', 'fileDown');
INSERT INTO `ke_user_log` VALUES ('2186', '5', '/admin/knfile/fileDown', '0:0:0:0:0:0:0:1', '2017-02-06 17:13:46', 'fileDown');
INSERT INTO `ke_user_log` VALUES ('2187', '5', '/admin/knfile/fileDown', '0:0:0:0:0:0:0:1', '2017-02-06 17:13:49', 'fileDown');
INSERT INTO `ke_user_log` VALUES ('2188', '5', '/admin/knfile/fileDown', '0:0:0:0:0:0:0:1', '2017-02-06 17:13:52', 'fileDown');
INSERT INTO `ke_user_log` VALUES ('2189', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-06 17:14:59', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2190', '5', '/admin/knfile', '0:0:0:0:0:0:0:1', '2017-02-06 17:14:59', 'index');
INSERT INTO `ke_user_log` VALUES ('2191', '5', '/admin/knfile/fileDown', '0:0:0:0:0:0:0:1', '2017-02-06 17:15:03', 'fileDown');
INSERT INTO `ke_user_log` VALUES ('2192', '5', '/admin/knfile/fileDown', '0:0:0:0:0:0:0:1', '2017-02-06 17:15:05', 'fileDown');
INSERT INTO `ke_user_log` VALUES ('2193', '5', '/admin/knfile', '0:0:0:0:0:0:0:1', '2017-02-06 17:16:06', 'index');
INSERT INTO `ke_user_log` VALUES ('2194', '5', '/admin/knfile/del', '0:0:0:0:0:0:0:1', '2017-02-06 17:16:10', 'del');
INSERT INTO `ke_user_log` VALUES ('2195', '5', '/admin/knfile', '0:0:0:0:0:0:0:1', '2017-02-06 17:16:10', 'index');
INSERT INTO `ke_user_log` VALUES ('2196', '5', '/admin/knfile/del', '0:0:0:0:0:0:0:1', '2017-02-06 17:16:17', 'del');
INSERT INTO `ke_user_log` VALUES ('2197', '5', '/admin/knfile', '0:0:0:0:0:0:0:1', '2017-02-06 17:16:17', 'index');
INSERT INTO `ke_user_log` VALUES ('2198', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-06 17:18:43', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2199', '5', '/admin/knfile', '0:0:0:0:0:0:0:1', '2017-02-06 17:18:43', 'index');
INSERT INTO `ke_user_log` VALUES ('2200', '5', '/admin/knfile', '0:0:0:0:0:0:0:1', '2017-02-06 17:20:09', 'index');
INSERT INTO `ke_user_log` VALUES ('2201', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-06 19:24:07', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2202', '5', '/admin/knfile', '0:0:0:0:0:0:0:1', '2017-02-06 19:24:07', 'index');
INSERT INTO `ke_user_log` VALUES ('2203', '5', '/admin/knfile', '0:0:0:0:0:0:0:1', '2017-02-06 19:24:27', 'index');
INSERT INTO `ke_user_log` VALUES ('2204', '5', '/admin/knfile/save', '0:0:0:0:0:0:0:1', '2017-02-06 19:24:44', 'save');
INSERT INTO `ke_user_log` VALUES ('2205', '5', '/admin/knfile', '0:0:0:0:0:0:0:1', '2017-02-06 19:26:03', 'index');
INSERT INTO `ke_user_log` VALUES ('2206', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-06 19:27:11', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2207', '5', '/admin/knfile', '0:0:0:0:0:0:0:1', '2017-02-06 19:27:11', 'index');
INSERT INTO `ke_user_log` VALUES ('2208', '5', '/admin/knfile/save', '0:0:0:0:0:0:0:1', '2017-02-06 19:27:25', 'save');
INSERT INTO `ke_user_log` VALUES ('2209', '5', '/admin/knfile/save', '0:0:0:0:0:0:0:1', '2017-02-06 19:27:34', 'save');
INSERT INTO `ke_user_log` VALUES ('2210', '5', '/admin/knfile', '0:0:0:0:0:0:0:1', '2017-02-06 19:27:34', 'index');
INSERT INTO `ke_user_log` VALUES ('2211', '5', '/admin/knfile/fileDown', '0:0:0:0:0:0:0:1', '2017-02-06 19:29:02', 'fileDown');
INSERT INTO `ke_user_log` VALUES ('2212', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-06 19:29:13', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2213', '5', '/admin/knfile/getKnFileById', '0:0:0:0:0:0:0:1', '2017-02-06 19:29:13', 'getKnFileById');
INSERT INTO `ke_user_log` VALUES ('2214', '5', '/admin/knfile/save', '0:0:0:0:0:0:0:1', '2017-02-06 19:29:15', 'save');
INSERT INTO `ke_user_log` VALUES ('2215', '5', '/admin/knfile/save', '0:0:0:0:0:0:0:1', '2017-02-06 19:29:19', 'save');
INSERT INTO `ke_user_log` VALUES ('2216', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-06 19:31:13', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2217', '5', '/admin/knfile', '0:0:0:0:0:0:0:1', '2017-02-06 19:31:13', 'index');
INSERT INTO `ke_user_log` VALUES ('2218', '5', '/admin/knfile/getKnFileById', '0:0:0:0:0:0:0:1', '2017-02-06 19:31:17', 'getKnFileById');
INSERT INTO `ke_user_log` VALUES ('2219', '5', '/admin/knfile/save', '0:0:0:0:0:0:0:1', '2017-02-06 19:31:22', 'save');
INSERT INTO `ke_user_log` VALUES ('2220', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-06 19:33:09', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2221', '5', '/admin/knfile/save', '0:0:0:0:0:0:0:1', '2017-02-06 19:33:09', 'save');
INSERT INTO `ke_user_log` VALUES ('2222', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-06 19:36:17', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2223', '5', '/admin/knfile/save', '0:0:0:0:0:0:0:1', '2017-02-06 19:36:17', 'save');
INSERT INTO `ke_user_log` VALUES ('2224', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-06 19:37:47', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2225', '5', '/admin/knfile/save', '0:0:0:0:0:0:0:1', '2017-02-06 19:37:47', 'save');
INSERT INTO `ke_user_log` VALUES ('2226', '5', '/admin/knfile/save', '0:0:0:0:0:0:0:1', '2017-02-06 19:39:06', 'save');
INSERT INTO `ke_user_log` VALUES ('2227', '5', '/admin/knfile', '0:0:0:0:0:0:0:1', '2017-02-06 19:39:06', 'index');
INSERT INTO `ke_user_log` VALUES ('2228', '5', '/admin/knfile/fileDown', '0:0:0:0:0:0:0:1', '2017-02-06 19:39:14', 'fileDown');
INSERT INTO `ke_user_log` VALUES ('2229', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-06 19:39:52', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2230', '5', '/admin/knfile', '0:0:0:0:0:0:0:1', '2017-02-06 19:39:52', 'index');
INSERT INTO `ke_user_log` VALUES ('2231', '5', '/admin/knfile/getKnFileById', '0:0:0:0:0:0:0:1', '2017-02-06 19:39:55', 'getKnFileById');
INSERT INTO `ke_user_log` VALUES ('2232', '5', '/admin/knfile/save', '0:0:0:0:0:0:0:1', '2017-02-06 19:40:05', 'save');
INSERT INTO `ke_user_log` VALUES ('2233', '5', '/admin/knfile', '0:0:0:0:0:0:0:1', '2017-02-06 19:40:05', 'index');
INSERT INTO `ke_user_log` VALUES ('2234', '5', '/admin/knfile/fileDown', '0:0:0:0:0:0:0:1', '2017-02-06 19:40:09', 'fileDown');
INSERT INTO `ke_user_log` VALUES ('2235', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-06 19:42:29', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2236', '5', '/admin/knfile/save', '0:0:0:0:0:0:0:1', '2017-02-06 19:42:29', 'save');
INSERT INTO `ke_user_log` VALUES ('2237', '5', '/admin/knfile', '0:0:0:0:0:0:0:1', '2017-02-06 19:42:41', 'index');
INSERT INTO `ke_user_log` VALUES ('2238', '5', '/admin/knfile', '0:0:0:0:0:0:0:1', '2017-02-06 19:42:42', 'index');
INSERT INTO `ke_user_log` VALUES ('2239', '5', '/admin/knfile/save', '0:0:0:0:0:0:0:1', '2017-02-06 19:43:07', 'save');
INSERT INTO `ke_user_log` VALUES ('2240', '5', '/admin/knfile', '0:0:0:0:0:0:0:1', '2017-02-06 19:43:07', 'index');
INSERT INTO `ke_user_log` VALUES ('2241', '5', '/admin/knfile/fileDown', '0:0:0:0:0:0:0:1', '2017-02-06 19:43:18', 'fileDown');
INSERT INTO `ke_user_log` VALUES ('2242', '5', '/admin/knfile/getKnFileById', '0:0:0:0:0:0:0:1', '2017-02-06 19:43:24', 'getKnFileById');
INSERT INTO `ke_user_log` VALUES ('2243', '5', '/admin/knfile', '0:0:0:0:0:0:0:1', '2017-02-06 19:44:04', 'index');
INSERT INTO `ke_user_log` VALUES ('2244', '5', '/admin/knfile/getKnFileById', '0:0:0:0:0:0:0:1', '2017-02-06 19:44:06', 'getKnFileById');
INSERT INTO `ke_user_log` VALUES ('2245', '5', '/admin/knfile/save', '0:0:0:0:0:0:0:1', '2017-02-06 19:44:11', 'save');
INSERT INTO `ke_user_log` VALUES ('2246', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-06 19:46:01', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2247', '5', '/admin/knfile', '0:0:0:0:0:0:0:1', '2017-02-06 19:46:01', 'index');
INSERT INTO `ke_user_log` VALUES ('2248', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-06 19:46:04', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2249', '5', '/admin/knfile', '0:0:0:0:0:0:0:1', '2017-02-06 19:46:04', 'index');
INSERT INTO `ke_user_log` VALUES ('2250', '5', '/admin/knfile/getKnFileById', '0:0:0:0:0:0:0:1', '2017-02-06 19:46:07', 'getKnFileById');
INSERT INTO `ke_user_log` VALUES ('2251', '5', '/admin/knfile/save', '0:0:0:0:0:0:0:1', '2017-02-06 19:46:13', 'save');
INSERT INTO `ke_user_log` VALUES ('2252', '5', '/admin/knfile', '0:0:0:0:0:0:0:1', '2017-02-06 19:46:33', 'index');
INSERT INTO `ke_user_log` VALUES ('2253', '5', '/admin/knfile/save', '0:0:0:0:0:0:0:1', '2017-02-06 19:46:46', 'save');
INSERT INTO `ke_user_log` VALUES ('2254', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-06 19:47:31', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2255', '5', '/admin/knfile/save', '0:0:0:0:0:0:0:1', '2017-02-06 19:47:31', 'save');
INSERT INTO `ke_user_log` VALUES ('2256', '5', '/admin/knfile', '0:0:0:0:0:0:0:1', '2017-02-06 19:47:35', 'index');
INSERT INTO `ke_user_log` VALUES ('2257', '5', '/admin/knfile', '0:0:0:0:0:0:0:1', '2017-02-06 19:47:36', 'index');
INSERT INTO `ke_user_log` VALUES ('2258', '5', '/admin/knfile', '0:0:0:0:0:0:0:1', '2017-02-06 19:47:36', 'index');
INSERT INTO `ke_user_log` VALUES ('2259', '5', '/admin/knfile/save', '0:0:0:0:0:0:0:1', '2017-02-06 19:47:47', 'save');
INSERT INTO `ke_user_log` VALUES ('2260', '5', '/admin/knfile', '0:0:0:0:0:0:0:1', '2017-02-06 19:48:17', 'index');
INSERT INTO `ke_user_log` VALUES ('2261', '5', '/admin/knfile', '0:0:0:0:0:0:0:1', '2017-02-06 19:48:18', 'index');
INSERT INTO `ke_user_log` VALUES ('2262', '5', '/admin/knfile', '0:0:0:0:0:0:0:1', '2017-02-06 19:48:18', 'index');
INSERT INTO `ke_user_log` VALUES ('2263', '5', '/admin/knfile/save', '0:0:0:0:0:0:0:1', '2017-02-06 19:48:26', 'save');
INSERT INTO `ke_user_log` VALUES ('2264', '5', '/admin/knfile', '0:0:0:0:0:0:0:1', '2017-02-06 19:48:26', 'index');
INSERT INTO `ke_user_log` VALUES ('2265', '5', '/admin/knfile/getKnFileById', '0:0:0:0:0:0:0:1', '2017-02-06 19:48:31', 'getKnFileById');
INSERT INTO `ke_user_log` VALUES ('2266', '5', '/admin/knfile/save', '0:0:0:0:0:0:0:1', '2017-02-06 19:48:38', 'save');
INSERT INTO `ke_user_log` VALUES ('2267', '5', '/admin/knfile', '0:0:0:0:0:0:0:1', '2017-02-06 19:48:38', 'index');
INSERT INTO `ke_user_log` VALUES ('2268', '5', '/admin/knfile/fileDown', '0:0:0:0:0:0:0:1', '2017-02-06 19:48:41', 'fileDown');
INSERT INTO `ke_user_log` VALUES ('2269', '5', '/admin/knfile', '0:0:0:0:0:0:0:1', '2017-02-06 19:49:12', 'index');
INSERT INTO `ke_user_log` VALUES ('2270', '5', '/admin/knfile', '0:0:0:0:0:0:0:1', '2017-02-06 19:49:18', 'index');
INSERT INTO `ke_user_log` VALUES ('2271', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-06 20:06:22', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2272', '5', '/admin/knfile', '0:0:0:0:0:0:0:1', '2017-02-06 20:06:22', 'index');
INSERT INTO `ke_user_log` VALUES ('2273', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-06 20:06:24', 'index');
INSERT INTO `ke_user_log` VALUES ('2274', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-06 20:19:50', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2275', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-06 20:19:50', 'index');
INSERT INTO `ke_user_log` VALUES ('2276', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-06 20:20:12', 'index');
INSERT INTO `ke_user_log` VALUES ('2277', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-06 20:21:49', 'index');
INSERT INTO `ke_user_log` VALUES ('2278', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-06 20:24:00', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2279', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-06 20:24:00', 'index');
INSERT INTO `ke_user_log` VALUES ('2280', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-06 20:39:48', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2281', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-06 20:39:48', 'index');
INSERT INTO `ke_user_log` VALUES ('2282', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-06 20:41:02', 'index');
INSERT INTO `ke_user_log` VALUES ('2283', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-06 20:41:20', 'index');
INSERT INTO `ke_user_log` VALUES ('2284', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-07 07:46:43', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2285', '5', '/admin', '0:0:0:0:0:0:0:1', '2017-02-07 07:46:47', 'index');
INSERT INTO `ke_user_log` VALUES ('2286', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 07:47:06', 'index');
INSERT INTO `ke_user_log` VALUES ('2287', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-07 07:56:14', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2288', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 07:56:14', 'index');
INSERT INTO `ke_user_log` VALUES ('2289', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 07:56:52', 'index');
INSERT INTO `ke_user_log` VALUES ('2290', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-07 08:10:20', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2291', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 08:10:20', 'index');
INSERT INTO `ke_user_log` VALUES ('2292', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 08:10:22', 'index');
INSERT INTO `ke_user_log` VALUES ('2293', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 08:10:35', 'index');
INSERT INTO `ke_user_log` VALUES ('2294', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 08:10:55', 'index');
INSERT INTO `ke_user_log` VALUES ('2295', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 08:11:11', 'index');
INSERT INTO `ke_user_log` VALUES ('2296', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 08:11:13', 'index');
INSERT INTO `ke_user_log` VALUES ('2297', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 08:11:25', 'index');
INSERT INTO `ke_user_log` VALUES ('2298', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 08:11:27', 'index');
INSERT INTO `ke_user_log` VALUES ('2299', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-07 08:12:39', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2300', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 08:12:39', 'index');
INSERT INTO `ke_user_log` VALUES ('2301', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-07 08:12:42', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2302', '5', '/admin/knform/add', '0:0:0:0:0:0:0:1', '2017-02-07 08:12:42', 'add');
INSERT INTO `ke_user_log` VALUES ('2303', '5', '/admin/knform/add', '0:0:0:0:0:0:0:1', '2017-02-07 08:14:26', 'add');
INSERT INTO `ke_user_log` VALUES ('2304', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-07 08:15:07', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2305', '5', '/admin/knform/add', '0:0:0:0:0:0:0:1', '2017-02-07 08:15:07', 'add');
INSERT INTO `ke_user_log` VALUES ('2306', '5', '/admin/knform/add', '0:0:0:0:0:0:0:1', '2017-02-07 08:16:14', 'add');
INSERT INTO `ke_user_log` VALUES ('2307', '5', '/admin/knform/add', '0:0:0:0:0:0:0:1', '2017-02-07 08:16:26', 'add');
INSERT INTO `ke_user_log` VALUES ('2308', '5', '/admin/knform/add', '0:0:0:0:0:0:0:1', '2017-02-07 08:16:52', 'add');
INSERT INTO `ke_user_log` VALUES ('2309', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-07 08:17:17', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2310', '5', '/admin/knform/add', '0:0:0:0:0:0:0:1', '2017-02-07 08:17:17', 'add');
INSERT INTO `ke_user_log` VALUES ('2311', '5', '/admin/knform/add', '0:0:0:0:0:0:0:1', '2017-02-07 08:18:22', 'add');
INSERT INTO `ke_user_log` VALUES ('2312', '5', '/admin/knform/add', '0:0:0:0:0:0:0:1', '2017-02-07 08:18:48', 'add');
INSERT INTO `ke_user_log` VALUES ('2313', '5', '/admin/knform/add', '0:0:0:0:0:0:0:1', '2017-02-07 08:18:49', 'add');
INSERT INTO `ke_user_log` VALUES ('2314', '5', '/admin/knform/add', '0:0:0:0:0:0:0:1', '2017-02-07 08:18:49', 'add');
INSERT INTO `ke_user_log` VALUES ('2315', '5', '/admin/knform/add', '0:0:0:0:0:0:0:1', '2017-02-07 08:18:50', 'add');
INSERT INTO `ke_user_log` VALUES ('2316', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-07 08:29:56', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2317', '5', '/admin/knform/add', '0:0:0:0:0:0:0:1', '2017-02-07 08:29:56', 'add');
INSERT INTO `ke_user_log` VALUES ('2318', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-07 08:32:15', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2319', '5', '/admin/knform/add', '0:0:0:0:0:0:0:1', '2017-02-07 08:32:15', 'add');
INSERT INTO `ke_user_log` VALUES ('2320', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-07 08:34:16', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2321', '5', '/admin/knform/add', '0:0:0:0:0:0:0:1', '2017-02-07 08:34:16', 'add');
INSERT INTO `ke_user_log` VALUES ('2322', '5', '/admin/knform/add', '0:0:0:0:0:0:0:1', '2017-02-07 08:35:04', 'add');
INSERT INTO `ke_user_log` VALUES ('2323', '5', '/admin/knform/add', '0:0:0:0:0:0:0:1', '2017-02-07 08:35:08', 'add');
INSERT INTO `ke_user_log` VALUES ('2324', '5', '/admin/knform/add', '0:0:0:0:0:0:0:1', '2017-02-07 08:35:20', 'add');
INSERT INTO `ke_user_log` VALUES ('2325', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-07 08:37:22', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2326', '5', '/admin/knform/add', '0:0:0:0:0:0:0:1', '2017-02-07 08:37:23', 'add');
INSERT INTO `ke_user_log` VALUES ('2327', '5', '/admin/knform/add', '0:0:0:0:0:0:0:1', '2017-02-07 08:37:26', 'add');
INSERT INTO `ke_user_log` VALUES ('2328', '5', '/admin/knform/add', '0:0:0:0:0:0:0:1', '2017-02-07 08:37:35', 'add');
INSERT INTO `ke_user_log` VALUES ('2329', '5', '/admin/knform/add', '0:0:0:0:0:0:0:1', '2017-02-07 08:37:49', 'add');
INSERT INTO `ke_user_log` VALUES ('2330', '5', '/admin/knform/add', '0:0:0:0:0:0:0:1', '2017-02-07 08:37:50', 'add');
INSERT INTO `ke_user_log` VALUES ('2331', '5', '/admin/knform/add', '0:0:0:0:0:0:0:1', '2017-02-07 08:38:02', 'add');
INSERT INTO `ke_user_log` VALUES ('2332', '5', '/admin/knform/add', '0:0:0:0:0:0:0:1', '2017-02-07 08:38:26', 'add');
INSERT INTO `ke_user_log` VALUES ('2333', '5', '/admin/knform/add', '0:0:0:0:0:0:0:1', '2017-02-07 08:38:42', 'add');
INSERT INTO `ke_user_log` VALUES ('2334', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-07 08:40:26', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2335', '5', '/admin/knform/add', '0:0:0:0:0:0:0:1', '2017-02-07 08:40:26', 'add');
INSERT INTO `ke_user_log` VALUES ('2336', '5', '/admin/knform/add', '0:0:0:0:0:0:0:1', '2017-02-07 08:40:47', 'add');
INSERT INTO `ke_user_log` VALUES ('2337', '5', '/admin/knform/add', '0:0:0:0:0:0:0:1', '2017-02-07 08:40:49', 'add');
INSERT INTO `ke_user_log` VALUES ('2338', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-07 08:52:34', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2339', '5', '/admin/knform/add', '0:0:0:0:0:0:0:1', '2017-02-07 08:52:34', 'add');
INSERT INTO `ke_user_log` VALUES ('2340', '5', '/admin/knform/add', '0:0:0:0:0:0:0:1', '2017-02-07 08:52:43', 'add');
INSERT INTO `ke_user_log` VALUES ('2341', '5', '/admin/knform/add', '0:0:0:0:0:0:0:1', '2017-02-07 08:53:51', 'add');
INSERT INTO `ke_user_log` VALUES ('2342', '5', '/admin/knform/add', '0:0:0:0:0:0:0:1', '2017-02-07 08:53:53', 'add');
INSERT INTO `ke_user_log` VALUES ('2343', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-07 08:57:47', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2344', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 08:57:47', 'index');
INSERT INTO `ke_user_log` VALUES ('2345', '5', '/admin/knform/add', '0:0:0:0:0:0:0:1', '2017-02-07 08:57:50', 'add');
INSERT INTO `ke_user_log` VALUES ('2346', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-07 09:04:33', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2347', '5', '/admin/knform/add', '0:0:0:0:0:0:0:1', '2017-02-07 09:04:33', 'add');
INSERT INTO `ke_user_log` VALUES ('2348', '5', '/admin/knform/add', '0:0:0:0:0:0:0:1', '2017-02-07 09:04:37', 'add');
INSERT INTO `ke_user_log` VALUES ('2349', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-07 09:05:21', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2350', '5', '/admin/knform/add', '0:0:0:0:0:0:0:1', '2017-02-07 09:05:21', 'add');
INSERT INTO `ke_user_log` VALUES ('2351', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-07 09:07:12', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2352', '5', '/admin/knform/add', '0:0:0:0:0:0:0:1', '2017-02-07 09:07:12', 'add');
INSERT INTO `ke_user_log` VALUES ('2353', '5', '/admin/knform/add', '0:0:0:0:0:0:0:1', '2017-02-07 09:08:46', 'add');
INSERT INTO `ke_user_log` VALUES ('2354', '5', '/admin/knform/add', '0:0:0:0:0:0:0:1', '2017-02-07 09:09:08', 'add');
INSERT INTO `ke_user_log` VALUES ('2355', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-07 09:10:27', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2356', '5', '/admin/knform/add', '0:0:0:0:0:0:0:1', '2017-02-07 09:10:27', 'add');
INSERT INTO `ke_user_log` VALUES ('2357', '5', '/admin/knform/add', '0:0:0:0:0:0:0:1', '2017-02-07 09:10:31', 'add');
INSERT INTO `ke_user_log` VALUES ('2358', '5', '/admin/knform/add', '0:0:0:0:0:0:0:1', '2017-02-07 09:10:33', 'add');
INSERT INTO `ke_user_log` VALUES ('2359', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-07 09:16:47', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2360', '5', '/admin/knform/add', '0:0:0:0:0:0:0:1', '2017-02-07 09:16:47', 'add');
INSERT INTO `ke_user_log` VALUES ('2361', '5', '/admin/knform/add', '0:0:0:0:0:0:0:1', '2017-02-07 09:16:58', 'add');
INSERT INTO `ke_user_log` VALUES ('2362', '5', '/admin/knform/add', '0:0:0:0:0:0:0:1', '2017-02-07 09:17:22', 'add');
INSERT INTO `ke_user_log` VALUES ('2363', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-07 09:19:49', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2364', '5', '/admin/knform/add', '0:0:0:0:0:0:0:1', '2017-02-07 09:19:49', 'add');
INSERT INTO `ke_user_log` VALUES ('2365', '5', '/admin/knform/add', '0:0:0:0:0:0:0:1', '2017-02-07 09:20:47', 'add');
INSERT INTO `ke_user_log` VALUES ('2366', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-07 09:23:51', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2367', '5', '/admin/knform/add', '0:0:0:0:0:0:0:1', '2017-02-07 09:23:51', 'add');
INSERT INTO `ke_user_log` VALUES ('2368', '5', '/admin/knform/add', '0:0:0:0:0:0:0:1', '2017-02-07 09:24:53', 'add');
INSERT INTO `ke_user_log` VALUES ('2369', '5', '/admin/knform/add', '0:0:0:0:0:0:0:1', '2017-02-07 09:25:05', 'add');
INSERT INTO `ke_user_log` VALUES ('2370', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-07 09:26:22', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2371', '5', '/admin/knform/add', '0:0:0:0:0:0:0:1', '2017-02-07 09:26:22', 'add');
INSERT INTO `ke_user_log` VALUES ('2372', '5', '/admin/knform/add', '0:0:0:0:0:0:0:1', '2017-02-07 09:26:24', 'add');
INSERT INTO `ke_user_log` VALUES ('2373', '5', '/admin/knform/add', '0:0:0:0:0:0:0:1', '2017-02-07 09:26:55', 'add');
INSERT INTO `ke_user_log` VALUES ('2374', '5', '/admin/knform/add', '0:0:0:0:0:0:0:1', '2017-02-07 09:26:56', 'add');
INSERT INTO `ke_user_log` VALUES ('2375', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-07 09:28:34', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2376', '5', '/admin/knform/add', '0:0:0:0:0:0:0:1', '2017-02-07 09:28:34', 'add');
INSERT INTO `ke_user_log` VALUES ('2377', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-07 09:56:26', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2378', '5', '/admin/knfile', '0:0:0:0:0:0:0:1', '2017-02-07 09:56:26', 'index');
INSERT INTO `ke_user_log` VALUES ('2379', '5', '/admin/knfile/save', '0:0:0:0:0:0:0:1', '2017-02-07 09:57:01', 'save');
INSERT INTO `ke_user_log` VALUES ('2380', '5', '/admin/knfile', '0:0:0:0:0:0:0:1', '2017-02-07 09:57:01', 'index');
INSERT INTO `ke_user_log` VALUES ('2381', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-07 09:58:03', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2382', '5', '/admin/knfile/getKnFileById', '0:0:0:0:0:0:0:1', '2017-02-07 09:58:03', 'getKnFileById');
INSERT INTO `ke_user_log` VALUES ('2383', '5', '/admin/knfile/save', '0:0:0:0:0:0:0:1', '2017-02-07 09:58:46', 'save');
INSERT INTO `ke_user_log` VALUES ('2384', '5', '/admin/knfile', '0:0:0:0:0:0:0:1', '2017-02-07 09:58:46', 'index');
INSERT INTO `ke_user_log` VALUES ('2385', '5', '/admin/knfile/getKnFileById', '0:0:0:0:0:0:0:1', '2017-02-07 09:59:02', 'getKnFileById');
INSERT INTO `ke_user_log` VALUES ('2386', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-07 10:00:09', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2387', '5', '/admin/knfile/save', '0:0:0:0:0:0:0:1', '2017-02-07 10:00:09', 'save');
INSERT INTO `ke_user_log` VALUES ('2388', '5', '/admin/knfile', '0:0:0:0:0:0:0:1', '2017-02-07 10:00:09', 'index');
INSERT INTO `ke_user_log` VALUES ('2389', '5', '/admin/knfile/del', '0:0:0:0:0:0:0:1', '2017-02-07 10:00:25', 'del');
INSERT INTO `ke_user_log` VALUES ('2390', '5', '/admin/knfile', '0:0:0:0:0:0:0:1', '2017-02-07 10:00:25', 'index');
INSERT INTO `ke_user_log` VALUES ('2391', '5', '/admin/knfile/getKnFileById', '0:0:0:0:0:0:0:1', '2017-02-07 10:01:01', 'getKnFileById');
INSERT INTO `ke_user_log` VALUES ('2392', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 10:01:16', 'index');
INSERT INTO `ke_user_log` VALUES ('2393', '5', '/admin/knform/add', '0:0:0:0:0:0:0:1', '2017-02-07 10:01:18', 'add');
INSERT INTO `ke_user_log` VALUES ('2394', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-07 10:05:43', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2395', '5', '/admin/knform/add', '0:0:0:0:0:0:0:1', '2017-02-07 10:05:43', 'add');
INSERT INTO `ke_user_log` VALUES ('2396', '5', '/admin/knform/add', '0:0:0:0:0:0:0:1', '2017-02-07 10:05:55', 'add');
INSERT INTO `ke_user_log` VALUES ('2397', '5', '/admin/knform/add', '0:0:0:0:0:0:0:1', '2017-02-07 10:07:15', 'add');
INSERT INTO `ke_user_log` VALUES ('2398', '5', '/admin/knform/add', '0:0:0:0:0:0:0:1', '2017-02-07 10:07:22', 'add');
INSERT INTO `ke_user_log` VALUES ('2399', '5', '/admin/knform/save', '0:0:0:0:0:0:0:1', '2017-02-07 10:07:24', 'save');
INSERT INTO `ke_user_log` VALUES ('2400', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-07 10:09:21', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2401', '5', '/admin/knform/save', '0:0:0:0:0:0:0:1', '2017-02-07 10:09:21', 'save');
INSERT INTO `ke_user_log` VALUES ('2402', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-07 10:10:38', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2403', '5', '/admin/knform/save', '0:0:0:0:0:0:0:1', '2017-02-07 10:10:38', 'save');
INSERT INTO `ke_user_log` VALUES ('2404', '5', '/admin/knform/add', '0:0:0:0:0:0:0:1', '2017-02-07 10:10:38', 'add');
INSERT INTO `ke_user_log` VALUES ('2405', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 10:11:31', 'index');
INSERT INTO `ke_user_log` VALUES ('2406', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-07 10:11:57', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2407', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 10:11:57', 'index');
INSERT INTO `ke_user_log` VALUES ('2408', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 10:12:05', 'index');
INSERT INTO `ke_user_log` VALUES ('2409', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 10:13:27', 'index');
INSERT INTO `ke_user_log` VALUES ('2410', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-07 10:16:23', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2411', '5', '/admin/knform/add', '0:0:0:0:0:0:0:1', '2017-02-07 10:16:23', 'add');
INSERT INTO `ke_user_log` VALUES ('2412', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-07 10:19:47', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2413', '5', '/admin/knform/add', '0:0:0:0:0:0:0:1', '2017-02-07 10:19:47', 'add');
INSERT INTO `ke_user_log` VALUES ('2414', '5', '/admin/knform/save', '0:0:0:0:0:0:0:1', '2017-02-07 10:19:49', 'save');
INSERT INTO `ke_user_log` VALUES ('2415', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-07 10:20:43', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2416', '5', '/admin/knform/save', '0:0:0:0:0:0:0:1', '2017-02-07 10:20:43', 'save');
INSERT INTO `ke_user_log` VALUES ('2417', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-07 10:22:58', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2418', '5', '/admin/knform/add', '0:0:0:0:0:0:0:1', '2017-02-07 10:22:58', 'add');
INSERT INTO `ke_user_log` VALUES ('2419', '5', '/admin/knform/add', '0:0:0:0:0:0:0:1', '2017-02-07 10:24:15', 'add');
INSERT INTO `ke_user_log` VALUES ('2420', '5', '/admin/knform/save', '0:0:0:0:0:0:0:1', '2017-02-07 10:24:21', 'save');
INSERT INTO `ke_user_log` VALUES ('2421', '5', '/admin/knform/add', '0:0:0:0:0:0:0:1', '2017-02-07 10:24:49', 'add');
INSERT INTO `ke_user_log` VALUES ('2422', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-07 10:27:10', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2423', '5', '/admin/knform/add', '0:0:0:0:0:0:0:1', '2017-02-07 10:27:10', 'add');
INSERT INTO `ke_user_log` VALUES ('2424', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-07 11:02:15', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2425', '5', '/admin/knform/add', '0:0:0:0:0:0:0:1', '2017-02-07 11:02:15', 'add');
INSERT INTO `ke_user_log` VALUES ('2426', '5', '/admin/knform/save', '0:0:0:0:0:0:0:1', '2017-02-07 11:03:16', 'save');
INSERT INTO `ke_user_log` VALUES ('2427', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-07 11:04:47', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2428', '5', '/admin/knform/save', '0:0:0:0:0:0:0:1', '2017-02-07 11:04:47', 'save');
INSERT INTO `ke_user_log` VALUES ('2429', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-07 11:30:53', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2430', '5', '/admin/knform/save', '0:0:0:0:0:0:0:1', '2017-02-07 11:30:54', 'save');
INSERT INTO `ke_user_log` VALUES ('2431', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-07 11:35:19', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2432', '5', '/admin/knform/save', '0:0:0:0:0:0:0:1', '2017-02-07 11:35:19', 'save');
INSERT INTO `ke_user_log` VALUES ('2433', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-07 11:37:00', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2434', '5', '/admin/knform/save', '0:0:0:0:0:0:0:1', '2017-02-07 11:37:00', 'save');
INSERT INTO `ke_user_log` VALUES ('2435', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-07 11:39:38', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2436', '5', '/admin/knform/save', '0:0:0:0:0:0:0:1', '2017-02-07 11:39:38', 'save');
INSERT INTO `ke_user_log` VALUES ('2437', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-07 11:40:22', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2438', '5', '/admin/knform/save', '0:0:0:0:0:0:0:1', '2017-02-07 11:40:22', 'save');
INSERT INTO `ke_user_log` VALUES ('2439', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-07 11:41:39', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2440', '5', '/admin/knform/save', '0:0:0:0:0:0:0:1', '2017-02-07 11:41:39', 'save');
INSERT INTO `ke_user_log` VALUES ('2441', '5', '/admin/knform/save', '0:0:0:0:0:0:0:1', '2017-02-07 11:42:15', 'save');
INSERT INTO `ke_user_log` VALUES ('2442', '5', '/admin/knform/add', '0:0:0:0:0:0:0:1', '2017-02-07 11:42:15', 'add');
INSERT INTO `ke_user_log` VALUES ('2443', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-07 12:27:20', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2444', '5', '/admin/knform/add', '0:0:0:0:0:0:0:1', '2017-02-07 12:27:20', 'add');
INSERT INTO `ke_user_log` VALUES ('2445', '5', '/admin/knform/save', '0:0:0:0:0:0:0:1', '2017-02-07 12:27:44', 'save');
INSERT INTO `ke_user_log` VALUES ('2446', '5', '/admin/knform/add', '0:0:0:0:0:0:0:1', '2017-02-07 12:27:44', 'add');
INSERT INTO `ke_user_log` VALUES ('2447', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-07 12:34:14', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2448', '5', '/admin/knform/add', '0:0:0:0:0:0:0:1', '2017-02-07 12:34:14', 'add');
INSERT INTO `ke_user_log` VALUES ('2449', '5', '/admin/knform/save', '0:0:0:0:0:0:0:1', '2017-02-07 12:34:35', 'save');
INSERT INTO `ke_user_log` VALUES ('2450', '5', '/admin/knform/add', '0:0:0:0:0:0:0:1', '2017-02-07 12:34:35', 'add');
INSERT INTO `ke_user_log` VALUES ('2451', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 12:35:08', 'index');
INSERT INTO `ke_user_log` VALUES ('2452', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-07 12:44:29', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2453', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 12:44:29', 'index');
INSERT INTO `ke_user_log` VALUES ('2454', '5', '/admin/knform/add', '0:0:0:0:0:0:0:1', '2017-02-07 12:44:30', 'add');
INSERT INTO `ke_user_log` VALUES ('2455', '5', '/admin/knform/save', '0:0:0:0:0:0:0:1', '2017-02-07 12:44:43', 'save');
INSERT INTO `ke_user_log` VALUES ('2456', '5', '/admin/knform/add', '0:0:0:0:0:0:0:1', '2017-02-07 12:45:36', 'add');
INSERT INTO `ke_user_log` VALUES ('2457', '5', '/admin/knform/save', '0:0:0:0:0:0:0:1', '2017-02-07 12:45:53', 'save');
INSERT INTO `ke_user_log` VALUES ('2458', '5', '/admin/knform/add', '0:0:0:0:0:0:0:1', '2017-02-07 12:45:53', 'add');
INSERT INTO `ke_user_log` VALUES ('2459', '5', '/admin/knform/add', '0:0:0:0:0:0:0:1', '2017-02-07 12:46:10', 'add');
INSERT INTO `ke_user_log` VALUES ('2460', '5', '/admin/knform/save', '0:0:0:0:0:0:0:1', '2017-02-07 12:46:24', 'save');
INSERT INTO `ke_user_log` VALUES ('2461', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 12:46:28', 'index');
INSERT INTO `ke_user_log` VALUES ('2462', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-07 12:46:46', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2463', '5', '/admin/knform/add', '0:0:0:0:0:0:0:1', '2017-02-07 12:46:46', 'add');
INSERT INTO `ke_user_log` VALUES ('2464', '5', '/admin/knform/save', '0:0:0:0:0:0:0:1', '2017-02-07 12:47:02', 'save');
INSERT INTO `ke_user_log` VALUES ('2465', '5', '/admin/knform/save', '0:0:0:0:0:0:0:1', '2017-02-07 12:47:24', 'save');
INSERT INTO `ke_user_log` VALUES ('2466', '5', '/admin/knform/save', '0:0:0:0:0:0:0:1', '2017-02-07 12:47:58', 'save');
INSERT INTO `ke_user_log` VALUES ('2467', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 12:47:59', 'index');
INSERT INTO `ke_user_log` VALUES ('2468', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-07 12:49:05', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2469', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 12:49:05', 'index');
INSERT INTO `ke_user_log` VALUES ('2470', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-07 12:50:40', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2471', '5', '/admin/knform/edit', '0:0:0:0:0:0:0:1', '2017-02-07 12:50:40', 'edit');
INSERT INTO `ke_user_log` VALUES ('2472', '5', '/admin/knform/edit', '0:0:0:0:0:0:0:1', '2017-02-07 12:51:50', 'edit');
INSERT INTO `ke_user_log` VALUES ('2473', '5', '/admin/knform/edit', '0:0:0:0:0:0:0:1', '2017-02-07 12:52:03', 'edit');
INSERT INTO `ke_user_log` VALUES ('2474', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-07 12:56:27', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2475', '5', '/admin/knform/edit', '0:0:0:0:0:0:0:1', '2017-02-07 12:56:27', 'edit');
INSERT INTO `ke_user_log` VALUES ('2476', '5', '/admin/knform/edit', '0:0:0:0:0:0:0:1', '2017-02-07 12:57:50', 'edit');
INSERT INTO `ke_user_log` VALUES ('2477', '5', '/admin/knform/edit', '0:0:0:0:0:0:0:1', '2017-02-07 12:57:52', 'edit');
INSERT INTO `ke_user_log` VALUES ('2478', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-07 12:58:54', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2479', '5', '/admin/knform/edit', '0:0:0:0:0:0:0:1', '2017-02-07 12:58:54', 'edit');
INSERT INTO `ke_user_log` VALUES ('2480', '5', '/admin/knform/edit', '0:0:0:0:0:0:0:1', '2017-02-07 12:59:43', 'edit');
INSERT INTO `ke_user_log` VALUES ('2481', '5', '/admin/knform/edit', '0:0:0:0:0:0:0:1', '2017-02-07 12:59:51', 'edit');
INSERT INTO `ke_user_log` VALUES ('2482', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 13:00:14', 'index');
INSERT INTO `ke_user_log` VALUES ('2483', '5', '/admin/knform/edit', '0:0:0:0:0:0:0:1', '2017-02-07 13:00:21', 'edit');
INSERT INTO `ke_user_log` VALUES ('2484', '5', '/admin/role', '0:0:0:0:0:0:0:1', '2017-02-07 13:00:29', 'index');
INSERT INTO `ke_user_log` VALUES ('2485', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-07 13:00:34', 'index');
INSERT INTO `ke_user_log` VALUES ('2486', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-07 13:01:39', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2487', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-07 13:01:39', 'index');
INSERT INTO `ke_user_log` VALUES ('2488', '5', '/admin/knfile', '0:0:0:0:0:0:0:1', '2017-02-07 13:01:42', 'index');
INSERT INTO `ke_user_log` VALUES ('2489', '5', '/admin/knfile', '0:0:0:0:0:0:0:1', '2017-02-07 13:02:10', 'index');
INSERT INTO `ke_user_log` VALUES ('2490', '5', '/admin/knfile/getKnFileById', '0:0:0:0:0:0:0:1', '2017-02-07 13:02:18', 'getKnFileById');
INSERT INTO `ke_user_log` VALUES ('2491', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 13:02:26', 'index');
INSERT INTO `ke_user_log` VALUES ('2492', '5', '/admin/knform/add', '0:0:0:0:0:0:0:1', '2017-02-07 13:02:28', 'add');
INSERT INTO `ke_user_log` VALUES ('2493', '5', '/admin/knform/add', '0:0:0:0:0:0:0:1', '2017-02-07 13:03:20', 'add');
INSERT INTO `ke_user_log` VALUES ('2494', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-07 13:03:59', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2495', '5', '/admin/knform/add', '0:0:0:0:0:0:0:1', '2017-02-07 13:03:59', 'add');
INSERT INTO `ke_user_log` VALUES ('2496', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-07 13:09:12', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2497', '5', '/admin/knform/add', '0:0:0:0:0:0:0:1', '2017-02-07 13:09:12', 'add');
INSERT INTO `ke_user_log` VALUES ('2498', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-07 13:14:21', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2499', '5', '/admin/knform/add', '0:0:0:0:0:0:0:1', '2017-02-07 13:14:21', 'add');
INSERT INTO `ke_user_log` VALUES ('2500', '5', '/admin/knform/add', '0:0:0:0:0:0:0:1', '2017-02-07 13:14:52', 'add');
INSERT INTO `ke_user_log` VALUES ('2501', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 13:14:57', 'index');
INSERT INTO `ke_user_log` VALUES ('2502', '5', '/admin/knform/edit', '0:0:0:0:0:0:0:1', '2017-02-07 13:15:08', 'edit');
INSERT INTO `ke_user_log` VALUES ('2503', '5', '/admin/knform/save', '0:0:0:0:0:0:0:1', '2017-02-07 13:15:21', 'save');
INSERT INTO `ke_user_log` VALUES ('2504', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 13:15:23', 'index');
INSERT INTO `ke_user_log` VALUES ('2505', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 13:16:14', 'index');
INSERT INTO `ke_user_log` VALUES ('2506', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 13:16:18', 'index');
INSERT INTO `ke_user_log` VALUES ('2507', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-07 13:16:23', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2508', '5', '/admin/knform/edit', '0:0:0:0:0:0:0:1', '2017-02-07 13:16:23', 'edit');
INSERT INTO `ke_user_log` VALUES ('2509', '5', '/admin/knform/save', '0:0:0:0:0:0:0:1', '2017-02-07 13:17:01', 'save');
INSERT INTO `ke_user_log` VALUES ('2510', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 13:17:02', 'index');
INSERT INTO `ke_user_log` VALUES ('2511', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 13:17:42', 'index');
INSERT INTO `ke_user_log` VALUES ('2512', '5', '/admin/knform/edit', '0:0:0:0:0:0:0:1', '2017-02-07 13:17:42', 'edit');
INSERT INTO `ke_user_log` VALUES ('2513', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 13:17:44', 'index');
INSERT INTO `ke_user_log` VALUES ('2514', '5', '/admin/knform/add', '0:0:0:0:0:0:0:1', '2017-02-07 13:17:46', 'add');
INSERT INTO `ke_user_log` VALUES ('2515', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-07 13:18:37', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2516', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 13:18:37', 'index');
INSERT INTO `ke_user_log` VALUES ('2517', '5', '/admin/knform/edit', '0:0:0:0:0:0:0:1', '2017-02-07 13:18:40', 'edit');
INSERT INTO `ke_user_log` VALUES ('2518', '5', '/admin/knform/save', '0:0:0:0:0:0:0:1', '2017-02-07 13:18:51', 'save');
INSERT INTO `ke_user_log` VALUES ('2519', '5', '/admin/knform/edit', '0:0:0:0:0:0:0:1', '2017-02-07 13:19:03', 'edit');
INSERT INTO `ke_user_log` VALUES ('2520', '5', '/admin/knform/save', '0:0:0:0:0:0:0:1', '2017-02-07 13:19:06', 'save');
INSERT INTO `ke_user_log` VALUES ('2521', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 13:19:08', 'index');
INSERT INTO `ke_user_log` VALUES ('2522', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 13:19:11', 'index');
INSERT INTO `ke_user_log` VALUES ('2523', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 13:19:17', 'index');
INSERT INTO `ke_user_log` VALUES ('2524', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 13:19:22', 'index');
INSERT INTO `ke_user_log` VALUES ('2525', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 13:19:33', 'index');
INSERT INTO `ke_user_log` VALUES ('2526', '5', '/admin/knform/edit', '0:0:0:0:0:0:0:1', '2017-02-07 13:19:42', 'edit');
INSERT INTO `ke_user_log` VALUES ('2527', '5', '/admin/knform/save', '0:0:0:0:0:0:0:1', '2017-02-07 13:19:53', 'save');
INSERT INTO `ke_user_log` VALUES ('2528', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 13:19:55', 'index');
INSERT INTO `ke_user_log` VALUES ('2529', '5', '/admin/knform/edit', '0:0:0:0:0:0:0:1', '2017-02-07 13:19:59', 'edit');
INSERT INTO `ke_user_log` VALUES ('2530', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 13:20:07', 'index');
INSERT INTO `ke_user_log` VALUES ('2531', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 13:20:11', 'index');
INSERT INTO `ke_user_log` VALUES ('2532', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 13:20:21', 'index');
INSERT INTO `ke_user_log` VALUES ('2533', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 13:20:21', 'index');
INSERT INTO `ke_user_log` VALUES ('2534', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 13:20:22', 'index');
INSERT INTO `ke_user_log` VALUES ('2535', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 13:20:23', 'index');
INSERT INTO `ke_user_log` VALUES ('2536', '5', '/admin', '0:0:0:0:0:0:0:1', '2017-02-07 13:20:25', 'index');
INSERT INTO `ke_user_log` VALUES ('2537', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 13:20:27', 'index');
INSERT INTO `ke_user_log` VALUES ('2538', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 13:20:37', 'index');
INSERT INTO `ke_user_log` VALUES ('2539', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-07 13:20:59', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2540', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 13:20:59', 'index');
INSERT INTO `ke_user_log` VALUES ('2541', '5', '/admin', '0:0:0:0:0:0:0:1', '2017-02-07 13:21:01', 'index');
INSERT INTO `ke_user_log` VALUES ('2542', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 13:21:04', 'index');
INSERT INTO `ke_user_log` VALUES ('2543', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 13:21:18', 'index');
INSERT INTO `ke_user_log` VALUES ('2544', '5', '/admin/knform/add', '0:0:0:0:0:0:0:1', '2017-02-07 13:21:20', 'add');
INSERT INTO `ke_user_log` VALUES ('2545', '5', '/admin/knform/save', '0:0:0:0:0:0:0:1', '2017-02-07 13:21:39', 'save');
INSERT INTO `ke_user_log` VALUES ('2546', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 13:21:42', 'index');
INSERT INTO `ke_user_log` VALUES ('2547', '5', '/admin/knform/add', '0:0:0:0:0:0:0:1', '2017-02-07 13:21:46', 'add');
INSERT INTO `ke_user_log` VALUES ('2548', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 13:21:47', 'index');
INSERT INTO `ke_user_log` VALUES ('2549', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 13:21:53', 'index');
INSERT INTO `ke_user_log` VALUES ('2550', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 13:22:11', 'index');
INSERT INTO `ke_user_log` VALUES ('2551', '5', '/admin/knform/edit', '0:0:0:0:0:0:0:1', '2017-02-07 13:22:13', 'edit');
INSERT INTO `ke_user_log` VALUES ('2552', '5', '/admin/knform/save', '0:0:0:0:0:0:0:1', '2017-02-07 13:22:15', 'save');
INSERT INTO `ke_user_log` VALUES ('2553', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 13:22:17', 'index');
INSERT INTO `ke_user_log` VALUES ('2554', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 13:22:22', 'index');
INSERT INTO `ke_user_log` VALUES ('2555', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 13:22:27', 'index');
INSERT INTO `ke_user_log` VALUES ('2556', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 13:22:29', 'index');
INSERT INTO `ke_user_log` VALUES ('2557', '5', '/admin/knform/edit', '0:0:0:0:0:0:0:1', '2017-02-07 13:22:32', 'edit');
INSERT INTO `ke_user_log` VALUES ('2558', '5', '/admin/knform/save', '0:0:0:0:0:0:0:1', '2017-02-07 13:22:34', 'save');
INSERT INTO `ke_user_log` VALUES ('2559', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 13:22:36', 'index');
INSERT INTO `ke_user_log` VALUES ('2560', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 13:22:51', 'index');
INSERT INTO `ke_user_log` VALUES ('2561', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 13:22:56', 'index');
INSERT INTO `ke_user_log` VALUES ('2562', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 13:22:57', 'index');
INSERT INTO `ke_user_log` VALUES ('2563', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-07 13:22:59', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2564', '5', '/admin/knform/edit', '0:0:0:0:0:0:0:1', '2017-02-07 13:22:59', 'edit');
INSERT INTO `ke_user_log` VALUES ('2565', '5', '/admin/knform/save', '0:0:0:0:0:0:0:1', '2017-02-07 13:23:01', 'save');
INSERT INTO `ke_user_log` VALUES ('2566', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 13:23:02', 'index');
INSERT INTO `ke_user_log` VALUES ('2567', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-07 13:26:51', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2568', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 13:26:51', 'index');
INSERT INTO `ke_user_log` VALUES ('2569', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 13:26:56', 'index');
INSERT INTO `ke_user_log` VALUES ('2570', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 13:26:58', 'index');
INSERT INTO `ke_user_log` VALUES ('2571', '5', '/admin/knform/edit', '0:0:0:0:0:0:0:1', '2017-02-07 13:27:00', 'edit');
INSERT INTO `ke_user_log` VALUES ('2572', '5', '/admin/knform/save', '0:0:0:0:0:0:0:1', '2017-02-07 13:27:03', 'save');
INSERT INTO `ke_user_log` VALUES ('2573', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 13:27:04', 'index');
INSERT INTO `ke_user_log` VALUES ('2574', '5', '/admin/knform/edit', '0:0:0:0:0:0:0:1', '2017-02-07 13:27:09', 'edit');
INSERT INTO `ke_user_log` VALUES ('2575', '5', '/admin/knform/save', '0:0:0:0:0:0:0:1', '2017-02-07 13:27:11', 'save');
INSERT INTO `ke_user_log` VALUES ('2576', '5', '/admin/knform/edit', '0:0:0:0:0:0:0:1', '2017-02-07 13:27:51', 'edit');
INSERT INTO `ke_user_log` VALUES ('2577', '5', '/admin/knform/save', '0:0:0:0:0:0:0:1', '2017-02-07 13:27:53', 'save');
INSERT INTO `ke_user_log` VALUES ('2578', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 13:27:56', 'index');
INSERT INTO `ke_user_log` VALUES ('2579', '5', '/admin/knform/edit', '0:0:0:0:0:0:0:1', '2017-02-07 13:28:08', 'edit');
INSERT INTO `ke_user_log` VALUES ('2580', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 13:28:15', 'index');
INSERT INTO `ke_user_log` VALUES ('2581', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-07 13:30:30', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2582', '5', '/admin/knfile/del', '0:0:0:0:0:0:0:1', '2017-02-07 13:30:30', 'del');
INSERT INTO `ke_user_log` VALUES ('2583', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 13:30:30', 'index');
INSERT INTO `ke_user_log` VALUES ('2584', '5', '/admin/knfile', '0:0:0:0:0:0:0:1', '2017-02-07 13:30:52', 'index');
INSERT INTO `ke_user_log` VALUES ('2585', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 13:31:19', 'index');
INSERT INTO `ke_user_log` VALUES ('2586', '5', '/admin/knform/del', '0:0:0:0:0:0:0:1', '2017-02-07 13:31:40', 'del');
INSERT INTO `ke_user_log` VALUES ('2587', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 13:31:40', 'index');
INSERT INTO `ke_user_log` VALUES ('2588', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-07 13:39:02', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2589', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 13:39:02', 'index');
INSERT INTO `ke_user_log` VALUES ('2590', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 13:40:05', 'index');
INSERT INTO `ke_user_log` VALUES ('2591', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 13:40:07', 'index');
INSERT INTO `ke_user_log` VALUES ('2592', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-07 13:42:05', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2593', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 13:42:05', 'index');
INSERT INTO `ke_user_log` VALUES ('2594', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 13:42:21', 'index');
INSERT INTO `ke_user_log` VALUES ('2595', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-07 13:47:50', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2596', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 13:47:50', 'index');
INSERT INTO `ke_user_log` VALUES ('2597', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 13:48:43', 'index');
INSERT INTO `ke_user_log` VALUES ('2598', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 13:49:05', 'index');
INSERT INTO `ke_user_log` VALUES ('2599', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 13:49:11', 'index');
INSERT INTO `ke_user_log` VALUES ('2600', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 13:49:37', 'index');
INSERT INTO `ke_user_log` VALUES ('2601', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-07 13:49:54', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2602', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 13:49:54', 'index');
INSERT INTO `ke_user_log` VALUES ('2603', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 13:50:11', 'index');
INSERT INTO `ke_user_log` VALUES ('2604', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-07 13:54:19', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2605', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 13:54:19', 'index');
INSERT INTO `ke_user_log` VALUES ('2606', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 13:54:25', 'index');
INSERT INTO `ke_user_log` VALUES ('2607', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 13:54:36', 'index');
INSERT INTO `ke_user_log` VALUES ('2608', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 13:55:52', 'index');
INSERT INTO `ke_user_log` VALUES ('2609', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 13:55:54', 'index');
INSERT INTO `ke_user_log` VALUES ('2610', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 13:56:09', 'index');
INSERT INTO `ke_user_log` VALUES ('2611', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-07 13:57:55', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2612', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 13:57:55', 'index');
INSERT INTO `ke_user_log` VALUES ('2613', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 13:57:56', 'index');
INSERT INTO `ke_user_log` VALUES ('2614', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 13:58:43', 'index');
INSERT INTO `ke_user_log` VALUES ('2615', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 13:58:44', 'index');
INSERT INTO `ke_user_log` VALUES ('2616', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 13:58:52', 'index');
INSERT INTO `ke_user_log` VALUES ('2617', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-07 14:00:42', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2618', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 14:00:42', 'index');
INSERT INTO `ke_user_log` VALUES ('2619', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 14:00:56', 'index');
INSERT INTO `ke_user_log` VALUES ('2620', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 14:01:44', 'index');
INSERT INTO `ke_user_log` VALUES ('2621', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 14:02:15', 'index');
INSERT INTO `ke_user_log` VALUES ('2622', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-07 14:03:06', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2623', '5', '/admin/knform/edit', '0:0:0:0:0:0:0:1', '2017-02-07 14:03:06', 'edit');
INSERT INTO `ke_user_log` VALUES ('2624', '5', '/admin/knform/save', '0:0:0:0:0:0:0:1', '2017-02-07 14:03:19', 'save');
INSERT INTO `ke_user_log` VALUES ('2625', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 14:03:21', 'index');
INSERT INTO `ke_user_log` VALUES ('2626', '5', '/admin/knform/edit', '0:0:0:0:0:0:0:1', '2017-02-07 14:03:29', 'edit');
INSERT INTO `ke_user_log` VALUES ('2627', '5', '/admin/knform/save', '0:0:0:0:0:0:0:1', '2017-02-07 14:03:35', 'save');
INSERT INTO `ke_user_log` VALUES ('2628', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 14:03:36', 'index');
INSERT INTO `ke_user_log` VALUES ('2629', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 14:03:50', 'index');
INSERT INTO `ke_user_log` VALUES ('2630', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-07 14:06:17', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2631', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 14:06:17', 'index');
INSERT INTO `ke_user_log` VALUES ('2632', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 14:06:24', 'index');
INSERT INTO `ke_user_log` VALUES ('2633', '5', '/admin/knfile', '0:0:0:0:0:0:0:1', '2017-02-07 14:06:44', 'index');
INSERT INTO `ke_user_log` VALUES ('2634', '5', '/admin/knfile', '0:0:0:0:0:0:0:1', '2017-02-07 14:07:04', 'index');
INSERT INTO `ke_user_log` VALUES ('2635', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 14:07:11', 'index');
INSERT INTO `ke_user_log` VALUES ('2636', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 14:07:21', 'index');
INSERT INTO `ke_user_log` VALUES ('2637', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-07 14:07:48', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2638', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 14:07:48', 'index');
INSERT INTO `ke_user_log` VALUES ('2639', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 14:08:20', 'index');
INSERT INTO `ke_user_log` VALUES ('2640', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 14:08:24', 'index');
INSERT INTO `ke_user_log` VALUES ('2641', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 14:08:26', 'index');
INSERT INTO `ke_user_log` VALUES ('2642', '5', '/admin/knform/edit', '0:0:0:0:0:0:0:1', '2017-02-07 14:09:43', 'edit');
INSERT INTO `ke_user_log` VALUES ('2643', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-07 14:28:39', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2644', '5', '/admin/knform/edit', '0:0:0:0:0:0:0:1', '2017-02-07 14:28:39', 'edit');
INSERT INTO `ke_user_log` VALUES ('2645', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 14:28:41', 'index');
INSERT INTO `ke_user_log` VALUES ('2646', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 14:28:43', 'index');
INSERT INTO `ke_user_log` VALUES ('2647', '5', '/admin/knform/getFormImgById', '0:0:0:0:0:0:0:1', '2017-02-07 14:28:45', 'getFormImgById');
INSERT INTO `ke_user_log` VALUES ('2648', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 14:28:48', 'index');
INSERT INTO `ke_user_log` VALUES ('2649', '5', '/admin/knform/getFormImgById', '0:0:0:0:0:0:0:1', '2017-02-07 14:28:49', 'getFormImgById');
INSERT INTO `ke_user_log` VALUES ('2650', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 14:28:51', 'index');
INSERT INTO `ke_user_log` VALUES ('2651', '5', '/admin/knform/getFormImgById', '0:0:0:0:0:0:0:1', '2017-02-07 14:28:52', 'getFormImgById');
INSERT INTO `ke_user_log` VALUES ('2652', '5', '/admin/knform/getFormImgById', '0:0:0:0:0:0:0:1', '2017-02-07 14:28:54', 'getFormImgById');
INSERT INTO `ke_user_log` VALUES ('2653', '5', '/admin/knform/getFormImgById', '0:0:0:0:0:0:0:1', '2017-02-07 14:28:56', 'getFormImgById');
INSERT INTO `ke_user_log` VALUES ('2654', '5', '/admin/knform/getFormImgById', '0:0:0:0:0:0:0:1', '2017-02-07 14:28:58', 'getFormImgById');
INSERT INTO `ke_user_log` VALUES ('2655', '5', '/admin/knform/getFormImgById', '0:0:0:0:0:0:0:1', '2017-02-07 14:29:00', 'getFormImgById');
INSERT INTO `ke_user_log` VALUES ('2656', '5', '/admin/knform/getFormImgById', '0:0:0:0:0:0:0:1', '2017-02-07 14:29:02', 'getFormImgById');
INSERT INTO `ke_user_log` VALUES ('2657', '5', '/admin/knform/getFormImgById', '0:0:0:0:0:0:0:1', '2017-02-07 14:29:04', 'getFormImgById');
INSERT INTO `ke_user_log` VALUES ('2658', '5', '/admin/knform/getFormImgById', '0:0:0:0:0:0:0:1', '2017-02-07 14:29:05', 'getFormImgById');
INSERT INTO `ke_user_log` VALUES ('2659', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 14:29:08', 'index');
INSERT INTO `ke_user_log` VALUES ('2660', '5', '/admin/knform/getFormImgById', '0:0:0:0:0:0:0:1', '2017-02-07 14:29:22', 'getFormImgById');
INSERT INTO `ke_user_log` VALUES ('2661', '5', '/admin/knform/getFormImgById', '0:0:0:0:0:0:0:1', '2017-02-07 14:29:25', 'getFormImgById');
INSERT INTO `ke_user_log` VALUES ('2662', '5', '/admin/knform/getFormImgById', '0:0:0:0:0:0:0:1', '2017-02-07 14:29:26', 'getFormImgById');
INSERT INTO `ke_user_log` VALUES ('2663', '5', '/admin/knform/getFormImgById', '0:0:0:0:0:0:0:1', '2017-02-07 14:29:26', 'getFormImgById');
INSERT INTO `ke_user_log` VALUES ('2664', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 14:29:28', 'index');
INSERT INTO `ke_user_log` VALUES ('2665', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-07 14:32:34', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2666', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 14:32:34', 'index');
INSERT INTO `ke_user_log` VALUES ('2667', '5', '/admin/knform/getFormImgById', '0:0:0:0:0:0:0:1', '2017-02-07 14:32:36', 'getFormImgById');
INSERT INTO `ke_user_log` VALUES ('2668', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 14:32:42', 'index');
INSERT INTO `ke_user_log` VALUES ('2669', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 14:33:18', 'index');
INSERT INTO `ke_user_log` VALUES ('2670', '5', '/admin/knform/getFormImgById', '0:0:0:0:0:0:0:1', '2017-02-07 14:33:20', 'getFormImgById');
INSERT INTO `ke_user_log` VALUES ('2671', '5', '/admin/knform/getFormImgById', '0:0:0:0:0:0:0:1', '2017-02-07 14:33:23', 'getFormImgById');
INSERT INTO `ke_user_log` VALUES ('2672', '5', '/admin/knform/getFormImgById', '0:0:0:0:0:0:0:1', '2017-02-07 14:33:25', 'getFormImgById');
INSERT INTO `ke_user_log` VALUES ('2673', '5', '/admin/knform/getFormImgById', '0:0:0:0:0:0:0:1', '2017-02-07 14:33:26', 'getFormImgById');
INSERT INTO `ke_user_log` VALUES ('2674', '5', '/admin/knform/getFormImgById', '0:0:0:0:0:0:0:1', '2017-02-07 14:33:27', 'getFormImgById');
INSERT INTO `ke_user_log` VALUES ('2675', '5', '/admin/knform/getFormImgById', '0:0:0:0:0:0:0:1', '2017-02-07 14:33:28', 'getFormImgById');
INSERT INTO `ke_user_log` VALUES ('2676', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 14:33:29', 'index');
INSERT INTO `ke_user_log` VALUES ('2677', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-07 14:35:35', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2678', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 14:35:35', 'index');
INSERT INTO `ke_user_log` VALUES ('2679', '5', '/admin/knform/getFormImgById', '0:0:0:0:0:0:0:1', '2017-02-07 14:35:37', 'getFormImgById');
INSERT INTO `ke_user_log` VALUES ('2680', '5', '/admin/knform/getFormImgById', '0:0:0:0:0:0:0:1', '2017-02-07 14:35:39', 'getFormImgById');
INSERT INTO `ke_user_log` VALUES ('2681', '5', '/admin/knform/getFormImgById', '0:0:0:0:0:0:0:1', '2017-02-07 14:35:40', 'getFormImgById');
INSERT INTO `ke_user_log` VALUES ('2682', '5', '/admin/knform/getFormImgById', '0:0:0:0:0:0:0:1', '2017-02-07 14:35:41', 'getFormImgById');
INSERT INTO `ke_user_log` VALUES ('2683', '5', '/admin/knform/getFormImgById', '0:0:0:0:0:0:0:1', '2017-02-07 14:35:42', 'getFormImgById');
INSERT INTO `ke_user_log` VALUES ('2684', '5', '/admin/knform/getFormImgById', '0:0:0:0:0:0:0:1', '2017-02-07 14:35:46', 'getFormImgById');
INSERT INTO `ke_user_log` VALUES ('2685', '5', '/admin/knform/getFormImgById', '0:0:0:0:0:0:0:1', '2017-02-07 14:35:47', 'getFormImgById');
INSERT INTO `ke_user_log` VALUES ('2686', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 14:35:58', 'index');
INSERT INTO `ke_user_log` VALUES ('2687', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 14:35:59', 'index');
INSERT INTO `ke_user_log` VALUES ('2688', '5', '/admin/knform/getFormImgById', '0:0:0:0:0:0:0:1', '2017-02-07 14:36:00', 'getFormImgById');
INSERT INTO `ke_user_log` VALUES ('2689', '5', '/admin/knform/getFormImgById', '0:0:0:0:0:0:0:1', '2017-02-07 14:36:02', 'getFormImgById');
INSERT INTO `ke_user_log` VALUES ('2690', '5', '/admin/knform/getFormImgById', '0:0:0:0:0:0:0:1', '2017-02-07 14:36:03', 'getFormImgById');
INSERT INTO `ke_user_log` VALUES ('2691', '5', '/admin/knform/getFormImgById', '0:0:0:0:0:0:0:1', '2017-02-07 14:36:05', 'getFormImgById');
INSERT INTO `ke_user_log` VALUES ('2692', '5', '/admin/knform/getFormImgById', '0:0:0:0:0:0:0:1', '2017-02-07 14:36:07', 'getFormImgById');
INSERT INTO `ke_user_log` VALUES ('2693', '5', '/admin/knform/getFormImgById', '0:0:0:0:0:0:0:1', '2017-02-07 14:36:08', 'getFormImgById');
INSERT INTO `ke_user_log` VALUES ('2694', '5', '/admin/knform/getFormImgById', '0:0:0:0:0:0:0:1', '2017-02-07 14:36:09', 'getFormImgById');
INSERT INTO `ke_user_log` VALUES ('2695', '5', '/admin/knform/getFormImgById', '0:0:0:0:0:0:0:1', '2017-02-07 14:36:10', 'getFormImgById');
INSERT INTO `ke_user_log` VALUES ('2696', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 14:36:12', 'index');
INSERT INTO `ke_user_log` VALUES ('2697', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 14:36:20', 'index');
INSERT INTO `ke_user_log` VALUES ('2698', '5', '/admin/knform/getFormImgById', '0:0:0:0:0:0:0:1', '2017-02-07 14:36:21', 'getFormImgById');
INSERT INTO `ke_user_log` VALUES ('2699', '5', '/admin/knform/getFormImgById', '0:0:0:0:0:0:0:1', '2017-02-07 14:36:22', 'getFormImgById');
INSERT INTO `ke_user_log` VALUES ('2700', '5', '/admin/knform/getFormImgById', '0:0:0:0:0:0:0:1', '2017-02-07 14:36:24', 'getFormImgById');
INSERT INTO `ke_user_log` VALUES ('2701', '5', '/admin/knform/getFormImgById', '0:0:0:0:0:0:0:1', '2017-02-07 14:36:25', 'getFormImgById');
INSERT INTO `ke_user_log` VALUES ('2702', '5', '/admin/knform/getFormImgById', '0:0:0:0:0:0:0:1', '2017-02-07 14:36:26', 'getFormImgById');
INSERT INTO `ke_user_log` VALUES ('2703', '5', '/admin/knform/getFormImgById', '0:0:0:0:0:0:0:1', '2017-02-07 14:36:27', 'getFormImgById');
INSERT INTO `ke_user_log` VALUES ('2704', '5', '/admin/knform/getFormImgById', '0:0:0:0:0:0:0:1', '2017-02-07 14:36:28', 'getFormImgById');
INSERT INTO `ke_user_log` VALUES ('2705', '5', '/admin/knform/getFormImgById', '0:0:0:0:0:0:0:1', '2017-02-07 14:36:29', 'getFormImgById');
INSERT INTO `ke_user_log` VALUES ('2706', '5', '/admin/knform/getFormImgById', '0:0:0:0:0:0:0:1', '2017-02-07 14:36:31', 'getFormImgById');
INSERT INTO `ke_user_log` VALUES ('2707', '5', '/admin/knform/getFormImgById', '0:0:0:0:0:0:0:1', '2017-02-07 14:36:32', 'getFormImgById');
INSERT INTO `ke_user_log` VALUES ('2708', '5', '/admin/knform/getFormImgById', '0:0:0:0:0:0:0:1', '2017-02-07 14:36:33', 'getFormImgById');
INSERT INTO `ke_user_log` VALUES ('2709', '5', '/admin/knform/getFormImgById', '0:0:0:0:0:0:0:1', '2017-02-07 14:36:34', 'getFormImgById');
INSERT INTO `ke_user_log` VALUES ('2710', '5', '/admin/knform/getFormImgById', '0:0:0:0:0:0:0:1', '2017-02-07 14:36:34', 'getFormImgById');
INSERT INTO `ke_user_log` VALUES ('2711', '5', '/admin/knform/getFormImgById', '0:0:0:0:0:0:0:1', '2017-02-07 14:36:35', 'getFormImgById');
INSERT INTO `ke_user_log` VALUES ('2712', '5', '/admin/knform/getFormImgById', '0:0:0:0:0:0:0:1', '2017-02-07 14:36:36', 'getFormImgById');
INSERT INTO `ke_user_log` VALUES ('2713', '5', '/admin/knform/getFormImgById', '0:0:0:0:0:0:0:1', '2017-02-07 14:36:37', 'getFormImgById');
INSERT INTO `ke_user_log` VALUES ('2714', '5', '/admin/knform/getFormImgById', '0:0:0:0:0:0:0:1', '2017-02-07 14:36:37', 'getFormImgById');
INSERT INTO `ke_user_log` VALUES ('2715', '5', '/admin/knform/getFormImgById', '0:0:0:0:0:0:0:1', '2017-02-07 14:36:38', 'getFormImgById');
INSERT INTO `ke_user_log` VALUES ('2716', '5', '/admin/knform/getFormImgById', '0:0:0:0:0:0:0:1', '2017-02-07 14:36:39', 'getFormImgById');
INSERT INTO `ke_user_log` VALUES ('2717', '5', '/admin/knform/getFormImgById', '0:0:0:0:0:0:0:1', '2017-02-07 14:36:39', 'getFormImgById');
INSERT INTO `ke_user_log` VALUES ('2718', '5', '/admin/knform/getFormImgById', '0:0:0:0:0:0:0:1', '2017-02-07 14:36:39', 'getFormImgById');
INSERT INTO `ke_user_log` VALUES ('2719', '5', '/admin/knform/getFormImgById', '0:0:0:0:0:0:0:1', '2017-02-07 14:36:40', 'getFormImgById');
INSERT INTO `ke_user_log` VALUES ('2720', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 14:36:42', 'index');
INSERT INTO `ke_user_log` VALUES ('2721', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-07 14:40:06', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2722', '5', '/admin/knform/add', '0:0:0:0:0:0:0:1', '2017-02-07 14:40:06', 'add');
INSERT INTO `ke_user_log` VALUES ('2723', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 14:41:19', 'index');
INSERT INTO `ke_user_log` VALUES ('2724', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-07 14:43:38', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2725', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 14:43:38', 'index');
INSERT INTO `ke_user_log` VALUES ('2726', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 14:43:39', 'index');
INSERT INTO `ke_user_log` VALUES ('2727', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-07 14:50:20', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2728', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 14:50:20', 'index');
INSERT INTO `ke_user_log` VALUES ('2729', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 14:51:23', 'index');
INSERT INTO `ke_user_log` VALUES ('2730', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-07 14:56:07', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2731', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 14:56:07', 'index');
INSERT INTO `ke_user_log` VALUES ('2732', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 14:56:37', 'index');
INSERT INTO `ke_user_log` VALUES ('2733', '5', '/admin/knform/getFormImgById', '0:0:0:0:0:0:0:1', '2017-02-07 14:56:55', 'getFormImgById');
INSERT INTO `ke_user_log` VALUES ('2734', '5', '/admin/knform/getFormImgById', '0:0:0:0:0:0:0:1', '2017-02-07 14:56:56', 'getFormImgById');
INSERT INTO `ke_user_log` VALUES ('2735', '5', '/admin/knform/getFormImgById', '0:0:0:0:0:0:0:1', '2017-02-07 14:56:57', 'getFormImgById');
INSERT INTO `ke_user_log` VALUES ('2736', '5', '/admin/knform/getFormImgById', '0:0:0:0:0:0:0:1', '2017-02-07 14:56:58', 'getFormImgById');
INSERT INTO `ke_user_log` VALUES ('2737', '5', '/admin/knform/getFormImgById', '0:0:0:0:0:0:0:1', '2017-02-07 14:56:59', 'getFormImgById');
INSERT INTO `ke_user_log` VALUES ('2738', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 14:57:00', 'index');
INSERT INTO `ke_user_log` VALUES ('2739', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-07 15:00:01', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2740', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 15:00:02', 'index');
INSERT INTO `ke_user_log` VALUES ('2741', '5', '/admin/knform/getFormImgById', '0:0:0:0:0:0:0:1', '2017-02-07 15:00:06', 'getFormImgById');
INSERT INTO `ke_user_log` VALUES ('2742', '5', '/admin/knform/getFormImgById', '0:0:0:0:0:0:0:1', '2017-02-07 15:00:07', 'getFormImgById');
INSERT INTO `ke_user_log` VALUES ('2743', '5', '/admin/knform/getFormImgById', '0:0:0:0:0:0:0:1', '2017-02-07 15:00:08', 'getFormImgById');
INSERT INTO `ke_user_log` VALUES ('2744', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 15:00:09', 'index');
INSERT INTO `ke_user_log` VALUES ('2745', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 15:00:13', 'index');
INSERT INTO `ke_user_log` VALUES ('2746', '5', '/admin/knform/getFormImgById', '0:0:0:0:0:0:0:1', '2017-02-07 15:00:17', 'getFormImgById');
INSERT INTO `ke_user_log` VALUES ('2747', '5', '/admin/knform/getFormImgById', '0:0:0:0:0:0:0:1', '2017-02-07 15:00:25', 'getFormImgById');
INSERT INTO `ke_user_log` VALUES ('2748', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 15:00:38', 'index');
INSERT INTO `ke_user_log` VALUES ('2749', '5', '/admin/knfile', '0:0:0:0:0:0:0:1', '2017-02-07 15:00:47', 'index');
INSERT INTO `ke_user_log` VALUES ('2750', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-07 15:07:29', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2751', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 15:07:29', 'index');
INSERT INTO `ke_user_log` VALUES ('2752', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 15:08:23', 'index');
INSERT INTO `ke_user_log` VALUES ('2753', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-07 15:08:34', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2754', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 15:08:34', 'index');
INSERT INTO `ke_user_log` VALUES ('2755', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 15:08:46', 'index');
INSERT INTO `ke_user_log` VALUES ('2756', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-07 15:10:33', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2757', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 15:10:33', 'index');
INSERT INTO `ke_user_log` VALUES ('2758', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-07 15:12:49', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2759', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 15:12:49', 'index');
INSERT INTO `ke_user_log` VALUES ('2760', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 15:13:52', 'index');
INSERT INTO `ke_user_log` VALUES ('2761', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-07 15:15:06', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2762', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 15:15:06', 'index');
INSERT INTO `ke_user_log` VALUES ('2763', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-07 15:15:21', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2764', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 15:15:21', 'index');
INSERT INTO `ke_user_log` VALUES ('2765', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 15:15:25', 'index');
INSERT INTO `ke_user_log` VALUES ('2766', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-07 15:19:41', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2767', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 15:19:41', 'index');
INSERT INTO `ke_user_log` VALUES ('2768', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 15:19:44', 'index');
INSERT INTO `ke_user_log` VALUES ('2769', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 15:20:15', 'index');
INSERT INTO `ke_user_log` VALUES ('2770', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 15:20:17', 'index');
INSERT INTO `ke_user_log` VALUES ('2771', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 15:20:59', 'index');
INSERT INTO `ke_user_log` VALUES ('2772', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-07 15:21:52', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2773', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 15:21:52', 'index');
INSERT INTO `ke_user_log` VALUES ('2774', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-07 15:22:07', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2775', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 15:22:07', 'index');
INSERT INTO `ke_user_log` VALUES ('2776', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 15:22:12', 'index');
INSERT INTO `ke_user_log` VALUES ('2777', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 15:22:28', 'index');
INSERT INTO `ke_user_log` VALUES ('2778', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 15:23:17', 'index');
INSERT INTO `ke_user_log` VALUES ('2779', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-07 15:27:01', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2780', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 15:27:01', 'index');
INSERT INTO `ke_user_log` VALUES ('2781', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-07 15:29:57', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2782', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 15:29:57', 'index');
INSERT INTO `ke_user_log` VALUES ('2783', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-07 15:32:39', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2784', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 15:32:39', 'index');
INSERT INTO `ke_user_log` VALUES ('2785', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-07 15:32:57', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2786', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 15:32:57', 'index');
INSERT INTO `ke_user_log` VALUES ('2787', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 15:33:18', 'index');
INSERT INTO `ke_user_log` VALUES ('2788', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 15:33:29', 'index');
INSERT INTO `ke_user_log` VALUES ('2789', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-07 15:36:52', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2790', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 15:36:52', 'index');
INSERT INTO `ke_user_log` VALUES ('2791', '5', '/admin/knfile', '0:0:0:0:0:0:0:1', '2017-02-07 15:36:55', 'index');
INSERT INTO `ke_user_log` VALUES ('2792', '5', '/admin/knfile', '0:0:0:0:0:0:0:1', '2017-02-07 15:37:08', 'index');
INSERT INTO `ke_user_log` VALUES ('2793', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 15:37:16', 'index');
INSERT INTO `ke_user_log` VALUES ('2794', '5', '/admin/knfile', '0:0:0:0:0:0:0:1', '2017-02-07 15:37:39', 'index');
INSERT INTO `ke_user_log` VALUES ('2795', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-07 15:37:45', 'index');
INSERT INTO `ke_user_log` VALUES ('2796', '5', '/admin/user', '0:0:0:0:0:0:0:1', '2017-02-07 15:37:49', 'index');
INSERT INTO `ke_user_log` VALUES ('2797', '5', '/admin/dmsubmit', '0:0:0:0:0:0:0:1', '2017-02-07 15:37:56', 'index');
INSERT INTO `ke_user_log` VALUES ('2798', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-07 15:38:02', 'index');
INSERT INTO `ke_user_log` VALUES ('2799', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-07 15:39:52', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2800', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-07 15:39:52', 'index');
INSERT INTO `ke_user_log` VALUES ('2801', '5', '/admin/dmsubmit', '0:0:0:0:0:0:0:1', '2017-02-07 15:39:57', 'index');
INSERT INTO `ke_user_log` VALUES ('2802', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-07 15:40:05', 'index');
INSERT INTO `ke_user_log` VALUES ('2803', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-07 15:41:04', 'index');
INSERT INTO `ke_user_log` VALUES ('2804', '5', '/admin/user', '0:0:0:0:0:0:0:1', '2017-02-07 15:41:12', 'index');
INSERT INTO `ke_user_log` VALUES ('2805', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-07 15:41:15', 'index');
INSERT INTO `ke_user_log` VALUES ('2806', '5', '/admin/role', '0:0:0:0:0:0:0:1', '2017-02-07 15:41:17', 'index');
INSERT INTO `ke_user_log` VALUES ('2807', '5', '/admin/role', '0:0:0:0:0:0:0:1', '2017-02-07 15:41:21', 'index');
INSERT INTO `ke_user_log` VALUES ('2808', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 15:41:38', 'index');
INSERT INTO `ke_user_log` VALUES ('2809', '5', '/admin/knform/getFormImgById', '0:0:0:0:0:0:0:1', '2017-02-07 15:41:41', 'getFormImgById');
INSERT INTO `ke_user_log` VALUES ('2810', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 15:41:44', 'index');
INSERT INTO `ke_user_log` VALUES ('2811', '5', '/admin/knform/getFormImgById', '0:0:0:0:0:0:0:1', '2017-02-07 15:41:45', 'getFormImgById');
INSERT INTO `ke_user_log` VALUES ('2812', '5', '/admin/knform/getFormImgById', '0:0:0:0:0:0:0:1', '2017-02-07 15:41:46', 'getFormImgById');
INSERT INTO `ke_user_log` VALUES ('2813', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 15:41:49', 'index');
INSERT INTO `ke_user_log` VALUES ('2814', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-07 15:42:56', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2815', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 15:42:56', 'index');
INSERT INTO `ke_user_log` VALUES ('2816', '5', '/admin/knform/edit', '0:0:0:0:0:0:0:1', '2017-02-07 15:42:58', 'edit');
INSERT INTO `ke_user_log` VALUES ('2817', '5', '/admin/knform/edit', '0:0:0:0:0:0:0:1', '2017-02-07 15:43:41', 'edit');
INSERT INTO `ke_user_log` VALUES ('2818', '5', '/admin/knform/edit', '0:0:0:0:0:0:0:1', '2017-02-07 15:43:42', 'edit');
INSERT INTO `ke_user_log` VALUES ('2819', '5', '/admin/knform/edit', '0:0:0:0:0:0:0:1', '2017-02-07 15:43:44', 'edit');
INSERT INTO `ke_user_log` VALUES ('2820', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-07 15:43:49', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2821', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 15:43:49', 'index');
INSERT INTO `ke_user_log` VALUES ('2822', '5', '/admin/knform/edit', '0:0:0:0:0:0:0:1', '2017-02-07 15:43:50', 'edit');
INSERT INTO `ke_user_log` VALUES ('2823', '5', '/admin/knform/edit', '0:0:0:0:0:0:0:1', '2017-02-07 15:44:02', 'edit');
INSERT INTO `ke_user_log` VALUES ('2824', '5', '/admin/knform/edit', '0:0:0:0:0:0:0:1', '2017-02-07 15:44:20', 'edit');
INSERT INTO `ke_user_log` VALUES ('2825', '5', '/admin/knform/edit', '0:0:0:0:0:0:0:1', '2017-02-07 15:44:36', 'edit');
INSERT INTO `ke_user_log` VALUES ('2826', '5', '/admin/knform/edit', '0:0:0:0:0:0:0:1', '2017-02-07 15:44:44', 'edit');
INSERT INTO `ke_user_log` VALUES ('2827', '5', '/admin/knform/edit', '0:0:0:0:0:0:0:1', '2017-02-07 15:44:52', 'edit');
INSERT INTO `ke_user_log` VALUES ('2828', '5', '/admin/knform/edit', '0:0:0:0:0:0:0:1', '2017-02-07 15:45:03', 'edit');
INSERT INTO `ke_user_log` VALUES ('2829', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 15:45:37', 'index');
INSERT INTO `ke_user_log` VALUES ('2830', '5', '/admin/knform/edit', '0:0:0:0:0:0:0:1', '2017-02-07 15:45:42', 'edit');
INSERT INTO `ke_user_log` VALUES ('2831', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-07 15:45:52', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2832', '5', '/admin/knform/save', '0:0:0:0:0:0:0:1', '2017-02-07 15:45:52', 'save');
INSERT INTO `ke_user_log` VALUES ('2833', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 15:45:55', 'index');
INSERT INTO `ke_user_log` VALUES ('2834', '5', '/admin/knform/edit', '0:0:0:0:0:0:0:1', '2017-02-07 15:45:57', 'edit');
INSERT INTO `ke_user_log` VALUES ('2835', '5', '/admin/knform/save', '0:0:0:0:0:0:0:1', '2017-02-07 15:46:22', 'save');
INSERT INTO `ke_user_log` VALUES ('2836', '5', '/admin/knform/save', '0:0:0:0:0:0:0:1', '2017-02-07 15:46:45', 'save');
INSERT INTO `ke_user_log` VALUES ('2837', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 15:46:54', 'index');
INSERT INTO `ke_user_log` VALUES ('2838', '5', '/admin/knform/edit', '0:0:0:0:0:0:0:1', '2017-02-07 15:46:56', 'edit');
INSERT INTO `ke_user_log` VALUES ('2839', '5', '/admin/knform/save', '0:0:0:0:0:0:0:1', '2017-02-07 15:47:00', 'save');
INSERT INTO `ke_user_log` VALUES ('2840', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 15:47:08', 'index');
INSERT INTO `ke_user_log` VALUES ('2841', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-07 15:48:52', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2842', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 15:48:52', 'index');
INSERT INTO `ke_user_log` VALUES ('2843', '5', '/admin/knform/edit', '0:0:0:0:0:0:0:1', '2017-02-07 15:48:53', 'edit');
INSERT INTO `ke_user_log` VALUES ('2844', '5', '/admin/knform/save', '0:0:0:0:0:0:0:1', '2017-02-07 15:49:01', 'save');
INSERT INTO `ke_user_log` VALUES ('2845', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 15:49:09', 'index');
INSERT INTO `ke_user_log` VALUES ('2846', '5', '/admin/knform/edit', '0:0:0:0:0:0:0:1', '2017-02-07 15:49:11', 'edit');
INSERT INTO `ke_user_log` VALUES ('2847', '5', '/admin/knform/save', '0:0:0:0:0:0:0:1', '2017-02-07 15:49:19', 'save');
INSERT INTO `ke_user_log` VALUES ('2848', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 15:49:30', 'index');
INSERT INTO `ke_user_log` VALUES ('2849', '5', '/admin/knform/edit', '0:0:0:0:0:0:0:1', '2017-02-07 15:49:32', 'edit');
INSERT INTO `ke_user_log` VALUES ('2850', '5', '/admin/knform/save', '0:0:0:0:0:0:0:1', '2017-02-07 15:49:40', 'save');
INSERT INTO `ke_user_log` VALUES ('2851', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 15:49:42', 'index');
INSERT INTO `ke_user_log` VALUES ('2852', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 15:50:07', 'index');
INSERT INTO `ke_user_log` VALUES ('2853', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 15:50:09', 'index');
INSERT INTO `ke_user_log` VALUES ('2854', '5', '/admin/knform/edit', '0:0:0:0:0:0:0:1', '2017-02-07 15:50:48', 'edit');
INSERT INTO `ke_user_log` VALUES ('2855', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-07 15:51:05', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2856', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 15:51:05', 'index');
INSERT INTO `ke_user_log` VALUES ('2857', '5', '/admin/knform/edit', '0:0:0:0:0:0:0:1', '2017-02-07 15:51:07', 'edit');
INSERT INTO `ke_user_log` VALUES ('2858', '5', '/admin/knfile', '0:0:0:0:0:0:0:1', '2017-02-07 15:52:47', 'index');
INSERT INTO `ke_user_log` VALUES ('2859', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-07 15:53:29', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2860', '5', '/admin/knfile', '0:0:0:0:0:0:0:1', '2017-02-07 15:53:29', 'index');
INSERT INTO `ke_user_log` VALUES ('2861', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 15:53:31', 'index');
INSERT INTO `ke_user_log` VALUES ('2862', '5', '/admin/knform/add', '0:0:0:0:0:0:0:1', '2017-02-07 15:53:33', 'add');
INSERT INTO `ke_user_log` VALUES ('2863', '5', '/admin/knform/add', '0:0:0:0:0:0:0:1', '2017-02-07 15:54:43', 'add');
INSERT INTO `ke_user_log` VALUES ('2864', '5', '/admin/knform/add', '0:0:0:0:0:0:0:1', '2017-02-07 15:54:47', 'add');
INSERT INTO `ke_user_log` VALUES ('2865', '5', '/admin/knform/edit', '0:0:0:0:0:0:0:1', '2017-02-07 15:54:50', 'edit');
INSERT INTO `ke_user_log` VALUES ('2866', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-07 15:57:09', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2867', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 15:57:09', 'index');
INSERT INTO `ke_user_log` VALUES ('2868', '5', '/admin', '0:0:0:0:0:0:0:1', '2017-02-07 15:57:10', 'index');
INSERT INTO `ke_user_log` VALUES ('2869', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 15:57:11', 'index');
INSERT INTO `ke_user_log` VALUES ('2870', '5', '/admin/knfile', '0:0:0:0:0:0:0:1', '2017-02-07 15:57:12', 'index');
INSERT INTO `ke_user_log` VALUES ('2871', '5', '/admin', '0:0:0:0:0:0:0:1', '2017-02-07 15:57:13', 'index');
INSERT INTO `ke_user_log` VALUES ('2872', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-07 15:57:14', 'index');
INSERT INTO `ke_user_log` VALUES ('2873', '5', '/admin', '0:0:0:0:0:0:0:1', '2017-02-07 15:57:14', 'index');
INSERT INTO `ke_user_log` VALUES ('2874', '5', '/admin/knfile', '0:0:0:0:0:0:0:1', '2017-02-07 15:57:15', 'index');
INSERT INTO `ke_user_log` VALUES ('2875', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-07 15:57:15', 'index');
INSERT INTO `ke_user_log` VALUES ('2876', '5', '/admin/dmcate', '0:0:0:0:0:0:0:1', '2017-02-07 15:57:18', 'index');
INSERT INTO `ke_user_log` VALUES ('2877', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-07 15:57:18', 'index');
INSERT INTO `ke_user_log` VALUES ('2878', '5', '/admin/dmsubmit', '0:0:0:0:0:0:0:1', '2017-02-07 15:57:20', 'index');
INSERT INTO `ke_user_log` VALUES ('2879', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-07 15:57:21', 'index');
INSERT INTO `ke_user_log` VALUES ('2880', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-07 15:57:33', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2881', '5', '/admin/knform/edit', '0:0:0:0:0:0:0:1', '2017-02-07 15:57:33', 'edit');
INSERT INTO `ke_user_log` VALUES ('2882', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-07 19:18:32', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2883', '5', '/admin', '0:0:0:0:0:0:0:1', '2017-02-07 19:18:34', 'index');
INSERT INTO `ke_user_log` VALUES ('2884', '5', '/admin/knfile', '0:0:0:0:0:0:0:1', '2017-02-07 19:18:37', 'index');
INSERT INTO `ke_user_log` VALUES ('2885', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-07 19:42:00', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2886', '5', '/admin/knmole', '0:0:0:0:0:0:0:1', '2017-02-07 19:42:00', 'index');
INSERT INTO `ke_user_log` VALUES ('2887', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-07 19:42:55', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2888', '5', '/admin/knmole', '0:0:0:0:0:0:0:1', '2017-02-07 19:42:55', 'index');
INSERT INTO `ke_user_log` VALUES ('2889', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-07 19:46:45', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2890', '5', '/admin/knmole/save', '0:0:0:0:0:0:0:1', '2017-02-07 19:46:45', 'save');
INSERT INTO `ke_user_log` VALUES ('2891', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-07 19:50:12', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2892', '5', '/admin/knmole/save', '0:0:0:0:0:0:0:1', '2017-02-07 19:50:12', 'save');
INSERT INTO `ke_user_log` VALUES ('2893', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-07 19:51:33', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2894', '5', '/admin/knmole/save', '0:0:0:0:0:0:0:1', '2017-02-07 19:51:33', 'save');
INSERT INTO `ke_user_log` VALUES ('2895', '5', '/admin/knmole', '0:0:0:0:0:0:0:1', '2017-02-07 19:52:47', 'index');
INSERT INTO `ke_user_log` VALUES ('2896', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-07 19:54:30', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2897', '5', '/admin/knmole/save', '0:0:0:0:0:0:0:1', '2017-02-07 19:54:30', 'save');
INSERT INTO `ke_user_log` VALUES ('2898', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-07 19:55:15', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2899', '5', '/admin/knmole/save', '0:0:0:0:0:0:0:1', '2017-02-07 19:55:15', 'save');
INSERT INTO `ke_user_log` VALUES ('2900', '5', '/admin/knmole', '0:0:0:0:0:0:0:1', '2017-02-07 19:55:15', 'index');
INSERT INTO `ke_user_log` VALUES ('2901', '5', '/admin/knmole', '0:0:0:0:0:0:0:1', '2017-02-07 19:56:01', 'index');
INSERT INTO `ke_user_log` VALUES ('2902', '5', '/admin/knmole', '0:0:0:0:0:0:0:1', '2017-02-07 19:56:06', 'index');
INSERT INTO `ke_user_log` VALUES ('2903', '5', '/admin/knmole', '0:0:0:0:0:0:0:1', '2017-02-07 19:56:25', 'index');
INSERT INTO `ke_user_log` VALUES ('2904', '5', '/admin/knmole/fileDown', '0:0:0:0:0:0:0:1', '2017-02-07 19:56:27', 'fileDown');
INSERT INTO `ke_user_log` VALUES ('2905', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-07 19:57:43', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2906', '5', '/admin/knmole/fileDown', '0:0:0:0:0:0:0:1', '2017-02-07 19:57:43', 'fileDown');
INSERT INTO `ke_user_log` VALUES ('2907', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-07 19:58:25', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2908', '5', '/admin/knmole/getKnMoleById', '0:0:0:0:0:0:0:1', '2017-02-07 19:58:25', 'getKnMoleById');
INSERT INTO `ke_user_log` VALUES ('2909', '5', '/admin/knmole', '0:0:0:0:0:0:0:1', '2017-02-07 19:58:54', 'index');
INSERT INTO `ke_user_log` VALUES ('2910', '5', '/admin/knmole', '0:0:0:0:0:0:0:1', '2017-02-07 19:59:06', 'index');
INSERT INTO `ke_user_log` VALUES ('2911', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-07 20:00:45', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2912', '5', '/admin/knmole/save', '0:0:0:0:0:0:0:1', '2017-02-07 20:00:45', 'save');
INSERT INTO `ke_user_log` VALUES ('2913', '5', '/admin/knmole', '0:0:0:0:0:0:0:1', '2017-02-07 20:00:45', 'index');
INSERT INTO `ke_user_log` VALUES ('2914', '5', '/admin/knmole', '0:0:0:0:0:0:0:1', '2017-02-07 20:00:56', 'index');
INSERT INTO `ke_user_log` VALUES ('2915', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-07 20:01:28', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2916', '5', '/admin/knmole', '0:0:0:0:0:0:0:1', '2017-02-07 20:01:28', 'index');
INSERT INTO `ke_user_log` VALUES ('2917', '5', '/admin/knmole', '0:0:0:0:0:0:0:1', '2017-02-07 20:01:43', 'index');
INSERT INTO `ke_user_log` VALUES ('2918', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-08 08:00:38', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2919', '5', '/admin', '0:0:0:0:0:0:0:1', '2017-02-08 08:00:40', 'index');
INSERT INTO `ke_user_log` VALUES ('2920', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-08 08:00:42', 'index');
INSERT INTO `ke_user_log` VALUES ('2921', '5', '/admin/knform/add', '0:0:0:0:0:0:0:1', '2017-02-08 08:00:46', 'add');
INSERT INTO `ke_user_log` VALUES ('2922', '5', '/admin/knform/save', '0:0:0:0:0:0:0:1', '2017-02-08 08:01:01', 'save');
INSERT INTO `ke_user_log` VALUES ('2923', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-08 08:02:52', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2924', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-08 08:02:52', 'index');
INSERT INTO `ke_user_log` VALUES ('2925', '5', '/admin/knform/edit', '0:0:0:0:0:0:0:1', '2017-02-08 08:02:56', 'edit');
INSERT INTO `ke_user_log` VALUES ('2926', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-08 08:03:36', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2927', '5', '/admin/knform/save', '0:0:0:0:0:0:0:1', '2017-02-08 08:03:36', 'save');
INSERT INTO `ke_user_log` VALUES ('2928', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-08 08:04:09', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2929', '5', '/admin/knform/save', '0:0:0:0:0:0:0:1', '2017-02-08 08:04:09', 'save');
INSERT INTO `ke_user_log` VALUES ('2930', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-08 08:05:50', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2931', '5', '/admin/knform/save', '0:0:0:0:0:0:0:1', '2017-02-08 08:05:50', 'save');
INSERT INTO `ke_user_log` VALUES ('2932', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-08 08:07:47', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2933', '5', '/admin/knform/save', '0:0:0:0:0:0:0:1', '2017-02-08 08:07:47', 'save');
INSERT INTO `ke_user_log` VALUES ('2934', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-08 08:08:43', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2935', '5', '/admin/knform/save', '0:0:0:0:0:0:0:1', '2017-02-08 08:08:43', 'save');
INSERT INTO `ke_user_log` VALUES ('2936', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-08 15:39:24', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2937', '5', '/admin', '0:0:0:0:0:0:0:1', '2017-02-08 15:39:26', 'index');
INSERT INTO `ke_user_log` VALUES ('2938', '5', '/admin/knmole', '0:0:0:0:0:0:0:1', '2017-02-08 15:39:29', 'index');
INSERT INTO `ke_user_log` VALUES ('2939', '5', '/admin/knmole/getKnMoleById', '0:0:0:0:0:0:0:1', '2017-02-08 15:39:33', 'getKnMoleById');
INSERT INTO `ke_user_log` VALUES ('2940', '5', '/admin/knmole/fileDown', '0:0:0:0:0:0:0:1', '2017-02-08 15:39:49', 'fileDown');
INSERT INTO `ke_user_log` VALUES ('2941', '5', '/admin/knmole/getKnMoleById', '0:0:0:0:0:0:0:1', '2017-02-08 15:40:41', 'getKnMoleById');
INSERT INTO `ke_user_log` VALUES ('2942', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-08 15:41:46', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2943', '5', '/admin/knmole', '0:0:0:0:0:0:0:1', '2017-02-08 15:41:46', 'index');
INSERT INTO `ke_user_log` VALUES ('2944', '5', '/admin/knmole/getKnMoleById', '0:0:0:0:0:0:0:1', '2017-02-08 15:41:48', 'getKnMoleById');
INSERT INTO `ke_user_log` VALUES ('2945', '5', '/admin/knmole/getKnMoleById', '0:0:0:0:0:0:0:1', '2017-02-08 15:41:58', 'getKnMoleById');
INSERT INTO `ke_user_log` VALUES ('2946', '5', '/admin/knmole', '0:0:0:0:0:0:0:1', '2017-02-08 15:43:18', 'index');
INSERT INTO `ke_user_log` VALUES ('2947', '5', '/admin/knmole/getKnMoleById', '0:0:0:0:0:0:0:1', '2017-02-08 15:43:20', 'getKnMoleById');
INSERT INTO `ke_user_log` VALUES ('2948', '5', '/admin/knmole/save', '0:0:0:0:0:0:0:1', '2017-02-08 15:43:23', 'save');
INSERT INTO `ke_user_log` VALUES ('2949', '5', '/admin/knmole', '0:0:0:0:0:0:0:1', '2017-02-08 15:43:23', 'index');
INSERT INTO `ke_user_log` VALUES ('2950', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-08 15:45:36', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2951', '5', '/admin/knmole', '0:0:0:0:0:0:0:1', '2017-02-08 15:45:36', 'index');
INSERT INTO `ke_user_log` VALUES ('2952', '5', '/admin/knmole/getKnMoleById', '0:0:0:0:0:0:0:1', '2017-02-08 15:45:41', 'getKnMoleById');
INSERT INTO `ke_user_log` VALUES ('2953', '5', '/admin/knmole/save', '0:0:0:0:0:0:0:1', '2017-02-08 15:45:44', 'save');
INSERT INTO `ke_user_log` VALUES ('2954', '5', '/admin/knmole', '0:0:0:0:0:0:0:1', '2017-02-08 15:45:44', 'index');
INSERT INTO `ke_user_log` VALUES ('2955', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-08 15:52:28', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2956', '5', '/admin/knmole/getKnMoleById', '0:0:0:0:0:0:0:1', '2017-02-08 15:52:28', 'getKnMoleById');
INSERT INTO `ke_user_log` VALUES ('2957', '5', '/admin/knmole/save', '0:0:0:0:0:0:0:1', '2017-02-08 15:52:31', 'save');
INSERT INTO `ke_user_log` VALUES ('2958', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-08 15:54:16', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2959', '5', '/admin/knmole/save', '0:0:0:0:0:0:0:1', '2017-02-08 15:54:16', 'save');
INSERT INTO `ke_user_log` VALUES ('2960', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-08 15:57:15', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2961', '5', '/admin/knmole', '0:0:0:0:0:0:0:1', '2017-02-08 15:57:15', 'index');
INSERT INTO `ke_user_log` VALUES ('2962', '5', '/admin/knmole/getKnMoleById', '0:0:0:0:0:0:0:1', '2017-02-08 15:57:18', 'getKnMoleById');
INSERT INTO `ke_user_log` VALUES ('2963', '5', '/admin/knmole/save', '0:0:0:0:0:0:0:1', '2017-02-08 15:57:25', 'save');
INSERT INTO `ke_user_log` VALUES ('2964', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-08 16:00:04', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2965', '5', '/admin/knmole/save', '0:0:0:0:0:0:0:1', '2017-02-08 16:00:04', 'save');
INSERT INTO `ke_user_log` VALUES ('2966', '5', '/admin/knmole', '0:0:0:0:0:0:0:1', '2017-02-08 16:00:04', 'index');
INSERT INTO `ke_user_log` VALUES ('2967', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-08 16:01:27', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2968', '5', '/admin/knmole', '0:0:0:0:0:0:0:1', '2017-02-08 16:01:27', 'index');
INSERT INTO `ke_user_log` VALUES ('2969', '5', '/admin/knmole/getKnMoleById', '0:0:0:0:0:0:0:1', '2017-02-08 16:01:30', 'getKnMoleById');
INSERT INTO `ke_user_log` VALUES ('2970', '5', '/admin/knmole/save', '0:0:0:0:0:0:0:1', '2017-02-08 16:01:32', 'save');
INSERT INTO `ke_user_log` VALUES ('2971', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-08 16:03:09', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2972', '5', '/admin/knmole', '0:0:0:0:0:0:0:1', '2017-02-08 16:03:09', 'index');
INSERT INTO `ke_user_log` VALUES ('2973', '5', '/admin/knmole/getKnMoleById', '0:0:0:0:0:0:0:1', '2017-02-08 16:03:14', 'getKnMoleById');
INSERT INTO `ke_user_log` VALUES ('2974', '5', '/admin/knmole/save', '0:0:0:0:0:0:0:1', '2017-02-08 16:03:17', 'save');
INSERT INTO `ke_user_log` VALUES ('2975', '5', '/admin/knmole', '0:0:0:0:0:0:0:1', '2017-02-08 16:03:17', 'index');
INSERT INTO `ke_user_log` VALUES ('2976', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-08 16:05:17', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2977', '5', '/admin/knmole/getKnMoleById', '0:0:0:0:0:0:0:1', '2017-02-08 16:05:17', 'getKnMoleById');
INSERT INTO `ke_user_log` VALUES ('2978', '5', '/admin/knmole/save', '0:0:0:0:0:0:0:1', '2017-02-08 16:05:20', 'save');
INSERT INTO `ke_user_log` VALUES ('2979', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-08 16:11:45', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2980', '5', '/admin/knmole/save', '0:0:0:0:0:0:0:1', '2017-02-08 16:11:45', 'save');
INSERT INTO `ke_user_log` VALUES ('2981', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-08 16:23:23', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2982', '5', '/admin/knmole/save', '0:0:0:0:0:0:0:1', '2017-02-08 16:23:23', 'save');
INSERT INTO `ke_user_log` VALUES ('2983', '5', '/admin/knmole/save', '0:0:0:0:0:0:0:1', '2017-02-08 16:23:34', 'save');
INSERT INTO `ke_user_log` VALUES ('2984', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-08 16:28:05', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2985', '5', '/admin/knmole/save', '0:0:0:0:0:0:0:1', '2017-02-08 16:28:05', 'save');
INSERT INTO `ke_user_log` VALUES ('2986', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-08 16:29:29', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2987', '5', '/admin/knmole/save', '0:0:0:0:0:0:0:1', '2017-02-08 16:29:29', 'save');
INSERT INTO `ke_user_log` VALUES ('2988', '5', '/admin/knmole', '0:0:0:0:0:0:0:1', '2017-02-08 16:29:29', 'index');
INSERT INTO `ke_user_log` VALUES ('2989', '5', '/admin/knmole/getKnMoleById', '0:0:0:0:0:0:0:1', '2017-02-08 16:30:11', 'getKnMoleById');
INSERT INTO `ke_user_log` VALUES ('2990', '5', '/admin/knmole/save', '0:0:0:0:0:0:0:1', '2017-02-08 16:30:15', 'save');
INSERT INTO `ke_user_log` VALUES ('2991', '5', '/admin/knmole', '0:0:0:0:0:0:0:1', '2017-02-08 16:30:15', 'index');
INSERT INTO `ke_user_log` VALUES ('2992', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-08 16:31:31', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('2993', '5', '/admin/knmole/getKnMoleById', '0:0:0:0:0:0:0:1', '2017-02-08 16:31:31', 'getKnMoleById');
INSERT INTO `ke_user_log` VALUES ('2994', '5', '/admin/knmole/save', '0:0:0:0:0:0:0:1', '2017-02-08 16:31:34', 'save');
INSERT INTO `ke_user_log` VALUES ('2995', '5', '/admin/knmole', '0:0:0:0:0:0:0:1', '2017-02-08 16:32:45', 'index');
INSERT INTO `ke_user_log` VALUES ('2996', '5', '/admin/knmole', '0:0:0:0:0:0:0:1', '2017-02-08 16:32:46', 'index');
INSERT INTO `ke_user_log` VALUES ('2997', '5', '/admin/knmole/getKnMoleById', '0:0:0:0:0:0:0:1', '2017-02-08 16:32:49', 'getKnMoleById');
INSERT INTO `ke_user_log` VALUES ('2998', '5', '/admin/knmole/save', '0:0:0:0:0:0:0:1', '2017-02-08 16:32:51', 'save');
INSERT INTO `ke_user_log` VALUES ('2999', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-08 16:43:30', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3000', '5', '/admin/knmole', '0:0:0:0:0:0:0:1', '2017-02-08 16:43:30', 'index');
INSERT INTO `ke_user_log` VALUES ('3001', '5', '/admin/knmole/getKnMoleById', '0:0:0:0:0:0:0:1', '2017-02-08 16:43:57', 'getKnMoleById');
INSERT INTO `ke_user_log` VALUES ('3002', '5', '/admin/knmole/save', '0:0:0:0:0:0:0:1', '2017-02-08 16:43:59', 'save');
INSERT INTO `ke_user_log` VALUES ('3003', '5', '/admin/knmole/save', '0:0:0:0:0:0:0:1', '2017-02-08 16:45:29', 'save');
INSERT INTO `ke_user_log` VALUES ('3004', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-08 16:47:04', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3005', '5', '/admin/knmole', '0:0:0:0:0:0:0:1', '2017-02-08 16:47:04', 'index');
INSERT INTO `ke_user_log` VALUES ('3006', '5', '/admin/knmole/getKnMoleById', '0:0:0:0:0:0:0:1', '2017-02-08 16:47:06', 'getKnMoleById');
INSERT INTO `ke_user_log` VALUES ('3007', '5', '/admin/knmole/save', '0:0:0:0:0:0:0:1', '2017-02-08 16:47:08', 'save');
INSERT INTO `ke_user_log` VALUES ('3008', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-08 16:48:18', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3009', '5', '/admin/knmole/save', '0:0:0:0:0:0:0:1', '2017-02-08 16:48:18', 'save');
INSERT INTO `ke_user_log` VALUES ('3010', '5', '/admin/knmole/save', '0:0:0:0:0:0:0:1', '2017-02-08 16:48:35', 'save');
INSERT INTO `ke_user_log` VALUES ('3011', '5', '/admin/knmole', '0:0:0:0:0:0:0:1', '2017-02-08 16:48:52', 'index');
INSERT INTO `ke_user_log` VALUES ('3012', '5', '/admin/knmole/getKnMoleById', '0:0:0:0:0:0:0:1', '2017-02-08 16:48:56', 'getKnMoleById');
INSERT INTO `ke_user_log` VALUES ('3013', '5', '/admin/knmole/save', '0:0:0:0:0:0:0:1', '2017-02-08 16:48:58', 'save');
INSERT INTO `ke_user_log` VALUES ('3014', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-08 16:54:09', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3015', '5', '/admin/knmole/save', '0:0:0:0:0:0:0:1', '2017-02-08 16:54:09', 'save');
INSERT INTO `ke_user_log` VALUES ('3016', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-08 19:34:49', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3017', '5', '/admin', '0:0:0:0:0:0:0:1', '2017-02-08 19:34:52', 'index');
INSERT INTO `ke_user_log` VALUES ('3018', '5', '/admin/knmole', '0:0:0:0:0:0:0:1', '2017-02-08 19:34:54', 'index');
INSERT INTO `ke_user_log` VALUES ('3019', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-08 19:38:43', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3020', '5', '/admin/knmole', '0:0:0:0:0:0:0:1', '2017-02-08 19:38:43', 'index');
INSERT INTO `ke_user_log` VALUES ('3021', '5', '/admin/knmole/save', '0:0:0:0:0:0:0:1', '2017-02-08 19:39:18', 'save');
INSERT INTO `ke_user_log` VALUES ('3022', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-08 19:41:59', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3023', '5', '/admin/knmole/save', '0:0:0:0:0:0:0:1', '2017-02-08 19:41:59', 'save');
INSERT INTO `ke_user_log` VALUES ('3024', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-08 19:42:40', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3025', '5', '/admin/knmole/save', '0:0:0:0:0:0:0:1', '2017-02-08 19:42:40', 'save');
INSERT INTO `ke_user_log` VALUES ('3026', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-08 19:56:57', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3027', '5', '/admin/knmole/save', '0:0:0:0:0:0:0:1', '2017-02-08 19:56:57', 'save');
INSERT INTO `ke_user_log` VALUES ('3028', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-08 20:03:54', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3029', '5', '/admin/knmole/save', '0:0:0:0:0:0:0:1', '2017-02-08 20:03:54', 'save');
INSERT INTO `ke_user_log` VALUES ('3030', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-08 20:04:42', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3031', '5', '/admin/knmole/save', '0:0:0:0:0:0:0:1', '2017-02-08 20:04:42', 'save');
INSERT INTO `ke_user_log` VALUES ('3032', '5', '/admin/knmole', '0:0:0:0:0:0:0:1', '2017-02-08 20:04:42', 'index');
INSERT INTO `ke_user_log` VALUES ('3033', '5', '/admin/knmole/getKnMoleById', '0:0:0:0:0:0:0:1', '2017-02-08 20:05:37', 'getKnMoleById');
INSERT INTO `ke_user_log` VALUES ('3034', '5', '/admin/knmole/save', '0:0:0:0:0:0:0:1', '2017-02-08 20:05:39', 'save');
INSERT INTO `ke_user_log` VALUES ('3035', '5', '/admin/knmole', '0:0:0:0:0:0:0:1', '2017-02-08 20:05:39', 'index');
INSERT INTO `ke_user_log` VALUES ('3036', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-08 20:07:15', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3037', '5', '/admin/knmole/getKnMoleById', '0:0:0:0:0:0:0:1', '2017-02-08 20:07:15', 'getKnMoleById');
INSERT INTO `ke_user_log` VALUES ('3038', '5', '/admin/knmole/save', '0:0:0:0:0:0:0:1', '2017-02-08 20:07:17', 'save');
INSERT INTO `ke_user_log` VALUES ('3039', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-08 20:26:17', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3040', '5', '/admin/knmole', '0:0:0:0:0:0:0:1', '2017-02-08 20:26:17', 'index');
INSERT INTO `ke_user_log` VALUES ('3041', '5', '/admin/knmole/getKnMoleById', '0:0:0:0:0:0:0:1', '2017-02-08 20:26:21', 'getKnMoleById');
INSERT INTO `ke_user_log` VALUES ('3042', '5', '/admin/knmole/save', '0:0:0:0:0:0:0:1', '2017-02-08 20:26:23', 'save');
INSERT INTO `ke_user_log` VALUES ('3043', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-09 11:38:15', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3044', '5', '/admin', '0:0:0:0:0:0:0:1', '2017-02-09 11:38:53', 'index');
INSERT INTO `ke_user_log` VALUES ('3045', '5', '/admin/knmole', '0:0:0:0:0:0:0:1', '2017-02-09 11:38:54', 'index');
INSERT INTO `ke_user_log` VALUES ('3046', '5', '/admin/knmole/getKnMoleById', '0:0:0:0:0:0:0:1', '2017-02-09 11:38:58', 'getKnMoleById');
INSERT INTO `ke_user_log` VALUES ('3047', '5', '/admin/knmole/save', '0:0:0:0:0:0:0:1', '2017-02-09 11:39:00', 'save');
INSERT INTO `ke_user_log` VALUES ('3048', '5', '/admin/knmole', '0:0:0:0:0:0:0:1', '2017-02-09 11:39:00', 'index');
INSERT INTO `ke_user_log` VALUES ('3049', '5', '/admin/knmole/getKnMoleById', '0:0:0:0:0:0:0:1', '2017-02-09 11:39:14', 'getKnMoleById');
INSERT INTO `ke_user_log` VALUES ('3050', '5', '/admin/knmole/save', '0:0:0:0:0:0:0:1', '2017-02-09 11:39:16', 'save');
INSERT INTO `ke_user_log` VALUES ('3051', '5', '/admin/knmole', '0:0:0:0:0:0:0:1', '2017-02-09 11:39:16', 'index');
INSERT INTO `ke_user_log` VALUES ('3052', '5', '/admin/knmole/getKnMoleById', '0:0:0:0:0:0:0:1', '2017-02-09 11:39:23', 'getKnMoleById');
INSERT INTO `ke_user_log` VALUES ('3053', '5', '/admin/knmole/save', '0:0:0:0:0:0:0:1', '2017-02-09 11:39:24', 'save');
INSERT INTO `ke_user_log` VALUES ('3054', '5', '/admin/knmole', '0:0:0:0:0:0:0:1', '2017-02-09 11:39:24', 'index');
INSERT INTO `ke_user_log` VALUES ('3055', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-09 11:39:49', 'index');
INSERT INTO `ke_user_log` VALUES ('3056', '5', '/admin/knform/getFormImgById', '0:0:0:0:0:0:0:1', '2017-02-09 11:39:51', 'getFormImgById');
INSERT INTO `ke_user_log` VALUES ('3057', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-09 11:39:56', 'index');
INSERT INTO `ke_user_log` VALUES ('3058', '5', '/admin/knform/getFormImgById', '0:0:0:0:0:0:0:1', '2017-02-09 11:39:57', 'getFormImgById');
INSERT INTO `ke_user_log` VALUES ('3059', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-09 11:39:59', 'index');
INSERT INTO `ke_user_log` VALUES ('3060', '5', '/admin/knform/getFormImgById', '0:0:0:0:0:0:0:1', '2017-02-09 11:40:00', 'getFormImgById');
INSERT INTO `ke_user_log` VALUES ('3061', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-09 11:40:01', 'index');
INSERT INTO `ke_user_log` VALUES ('3062', '5', '/admin/knform/getFormImgById', '0:0:0:0:0:0:0:1', '2017-02-09 11:40:02', 'getFormImgById');
INSERT INTO `ke_user_log` VALUES ('3063', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-09 11:40:04', 'index');
INSERT INTO `ke_user_log` VALUES ('3064', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-09 11:42:09', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3065', '5', '/admin/knmole', '0:0:0:0:0:0:0:1', '2017-02-09 11:42:09', 'index');
INSERT INTO `ke_user_log` VALUES ('3066', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-09 11:45:27', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3067', '5', '/admin/knmole', '0:0:0:0:0:0:0:1', '2017-02-09 11:45:27', 'index');
INSERT INTO `ke_user_log` VALUES ('3068', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-09 12:10:09', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3069', '5', '/admin/knmole', '0:0:0:0:0:0:0:1', '2017-02-09 12:10:09', 'index');
INSERT INTO `ke_user_log` VALUES ('3070', '5', '/admin/knmole', '0:0:0:0:0:0:0:1', '2017-02-09 12:10:29', 'index');
INSERT INTO `ke_user_log` VALUES ('3071', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-09 12:14:07', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3072', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-09 12:34:49', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3073', '5', '/admin', '0:0:0:0:0:0:0:1', '2017-02-09 12:34:51', 'index');
INSERT INTO `ke_user_log` VALUES ('3074', '5', '/admin', '0:0:0:0:0:0:0:1', '2017-02-09 12:35:29', 'index');
INSERT INTO `ke_user_log` VALUES ('3075', '5', '/admin', '0:0:0:0:0:0:0:1', '2017-02-09 12:36:25', 'index');
INSERT INTO `ke_user_log` VALUES ('3076', '5', '/admin/role', '0:0:0:0:0:0:0:1', '2017-02-09 12:36:29', 'index');
INSERT INTO `ke_user_log` VALUES ('3077', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-09 12:36:32', 'index');
INSERT INTO `ke_user_log` VALUES ('3078', '5', '/admin/role', '0:0:0:0:0:0:0:1', '2017-02-09 12:36:39', 'index');
INSERT INTO `ke_user_log` VALUES ('3079', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-09 12:36:41', 'index');
INSERT INTO `ke_user_log` VALUES ('3080', '5', '/admin/user', '0:0:0:0:0:0:0:1', '2017-02-09 12:36:42', 'index');
INSERT INTO `ke_user_log` VALUES ('3081', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-09 12:36:43', 'index');
INSERT INTO `ke_user_log` VALUES ('3082', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-09 12:36:45', 'index');
INSERT INTO `ke_user_log` VALUES ('3083', '5', '/admin', '0:0:0:0:0:0:0:1', '2017-02-09 12:36:46', 'index');
INSERT INTO `ke_user_log` VALUES ('3084', '5', '/admin/knfile', '0:0:0:0:0:0:0:1', '2017-02-09 12:36:47', 'index');
INSERT INTO `ke_user_log` VALUES ('3085', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-09 12:36:48', 'index');
INSERT INTO `ke_user_log` VALUES ('3086', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-09 12:36:49', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3087', '5', '/admin/knmole', '0:0:0:0:0:0:0:1', '2017-02-09 12:36:49', 'index');
INSERT INTO `ke_user_log` VALUES ('3088', '5', '/admin/dmcate', '0:0:0:0:0:0:0:1', '2017-02-09 12:36:51', 'index');
INSERT INTO `ke_user_log` VALUES ('3089', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-09 12:36:52', 'index');
INSERT INTO `ke_user_log` VALUES ('3090', '5', '/admin/dmsubmit', '0:0:0:0:0:0:0:1', '2017-02-09 12:36:53', 'index');
INSERT INTO `ke_user_log` VALUES ('3091', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-09 12:36:54', 'index');
INSERT INTO `ke_user_log` VALUES ('3092', '5', '/admin/dmcate', '0:0:0:0:0:0:0:1', '2017-02-09 12:36:55', 'index');
INSERT INTO `ke_user_log` VALUES ('3093', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-09 12:36:59', 'index');
INSERT INTO `ke_user_log` VALUES ('3094', '5', '/admin/knmole', '0:0:0:0:0:0:0:1', '2017-02-09 12:37:00', 'index');
INSERT INTO `ke_user_log` VALUES ('3095', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-09 12:45:03', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3096', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-09 12:45:03', 'index');
INSERT INTO `ke_user_log` VALUES ('3097', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-09 12:45:04', 'index');
INSERT INTO `ke_user_log` VALUES ('3103', '5', '/admin/userlog/del', '0:0:0:0:0:0:0:1', '2017-02-09 12:49:11', 'del');
INSERT INTO `ke_user_log` VALUES ('3104', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-09 12:49:11', 'index');
INSERT INTO `ke_user_log` VALUES ('3105', '5', '/admin/userlog/del', '0:0:0:0:0:0:0:1', '2017-02-09 12:49:23', 'del');
INSERT INTO `ke_user_log` VALUES ('3106', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-09 12:49:23', 'index');
INSERT INTO `ke_user_log` VALUES ('3107', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-09 12:49:49', 'index');
INSERT INTO `ke_user_log` VALUES ('3108', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-09 12:49:56', 'index');
INSERT INTO `ke_user_log` VALUES ('3109', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-09 12:50:05', 'index');
INSERT INTO `ke_user_log` VALUES ('3110', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-09 12:50:06', 'index');
INSERT INTO `ke_user_log` VALUES ('3111', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-09 12:50:07', 'index');
INSERT INTO `ke_user_log` VALUES ('3112', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-09 12:50:09', 'index');
INSERT INTO `ke_user_log` VALUES ('3113', '5', '/admin/knfile', '0:0:0:0:0:0:0:1', '2017-02-09 12:50:12', 'index');
INSERT INTO `ke_user_log` VALUES ('3114', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-09 12:50:14', 'index');
INSERT INTO `ke_user_log` VALUES ('3115', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-09 12:50:15', 'index');
INSERT INTO `ke_user_log` VALUES ('3116', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-09 12:50:16', 'index');
INSERT INTO `ke_user_log` VALUES ('3117', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-09 12:52:02', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3118', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-09 12:52:02', 'index');
INSERT INTO `ke_user_log` VALUES ('3119', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-09 12:52:48', 'index');
INSERT INTO `ke_user_log` VALUES ('3120', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-09 12:52:50', 'index');
INSERT INTO `ke_user_log` VALUES ('3121', '5', '/admin/role', '0:0:0:0:0:0:0:1', '2017-02-09 12:52:56', 'index');
INSERT INTO `ke_user_log` VALUES ('3122', '5', '/admin/user', '0:0:0:0:0:0:0:1', '2017-02-09 12:53:01', 'index');
INSERT INTO `ke_user_log` VALUES ('3123', '5', '/admin/knfile', '0:0:0:0:0:0:0:1', '2017-02-09 12:53:14', 'index');
INSERT INTO `ke_user_log` VALUES ('3124', '5', '/admin/dmcate', '0:0:0:0:0:0:0:1', '2017-02-09 12:53:26', 'index');
INSERT INTO `ke_user_log` VALUES ('3125', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-09 12:53:29', 'index');
INSERT INTO `ke_user_log` VALUES ('3126', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-09 12:54:32', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3127', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-09 12:54:32', 'index');
INSERT INTO `ke_user_log` VALUES ('3128', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-09 13:02:09', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3129', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-09 13:02:09', 'index');
INSERT INTO `ke_user_log` VALUES ('3130', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-09 13:08:21', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3131', '5', '/admin/user', '0:0:0:0:0:0:0:1', '2017-02-09 13:08:21', 'index');
INSERT INTO `ke_user_log` VALUES ('3132', '5', '/admin/user', '0:0:0:0:0:0:0:1', '2017-02-09 13:09:02', 'index');
INSERT INTO `ke_user_log` VALUES ('3133', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-09 13:17:13', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3134', '5', '/admin/user', '0:0:0:0:0:0:0:1', '2017-02-09 13:17:13', 'index');
INSERT INTO `ke_user_log` VALUES ('3135', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-09 13:19:46', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3136', '5', '/admin', '0:0:0:0:0:0:0:1', '2017-02-09 13:19:48', 'index');
INSERT INTO `ke_user_log` VALUES ('3137', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-09 13:19:52', 'index');
INSERT INTO `ke_user_log` VALUES ('3138', '5', '/admin/knform/edit', '0:0:0:0:0:0:0:1', '2017-02-09 13:19:54', 'edit');
INSERT INTO `ke_user_log` VALUES ('3139', '5', '/admin/knform/save', '0:0:0:0:0:0:0:1', '2017-02-09 13:19:57', 'save');
INSERT INTO `ke_user_log` VALUES ('3140', '5', '/admin/knform/edit', '0:0:0:0:0:0:0:1', '2017-02-09 13:20:50', 'edit');
INSERT INTO `ke_user_log` VALUES ('3141', '5', '/admin/knfile', '0:0:0:0:0:0:0:1', '2017-02-09 13:20:53', 'index');
INSERT INTO `ke_user_log` VALUES ('3142', '5', '/admin/knfile/getKnFileById', '0:0:0:0:0:0:0:1', '2017-02-09 13:20:56', 'getKnFileById');
INSERT INTO `ke_user_log` VALUES ('3143', '5', '/admin/knmole', '0:0:0:0:0:0:0:1', '2017-02-09 13:20:59', 'index');
INSERT INTO `ke_user_log` VALUES ('3144', '5', '/admin/knmole/getKnMoleById', '0:0:0:0:0:0:0:1', '2017-02-09 13:21:02', 'getKnMoleById');
INSERT INTO `ke_user_log` VALUES ('3145', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-09 13:21:18', 'index');
INSERT INTO `ke_user_log` VALUES ('3146', '5', '/admin/knform/edit', '0:0:0:0:0:0:0:1', '2017-02-09 13:21:19', 'edit');
INSERT INTO `ke_user_log` VALUES ('3147', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-09 13:24:08', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3148', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-09 13:24:08', 'index');
INSERT INTO `ke_user_log` VALUES ('3149', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-09 13:24:09', 'index');
INSERT INTO `ke_user_log` VALUES ('3150', '5', '/admin/knform/edit', '0:0:0:0:0:0:0:1', '2017-02-09 13:24:10', 'edit');
INSERT INTO `ke_user_log` VALUES ('3151', '5', '/admin/knform/save', '0:0:0:0:0:0:0:1', '2017-02-09 13:24:12', 'save');
INSERT INTO `ke_user_log` VALUES ('3152', '5', '/admin/knform/edit', '0:0:0:0:0:0:0:1', '2017-02-09 13:24:17', 'edit');
INSERT INTO `ke_user_log` VALUES ('3153', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-09 13:24:30', 'index');
INSERT INTO `ke_user_log` VALUES ('3154', '5', '/admin/knform/edit', '0:0:0:0:0:0:0:1', '2017-02-09 13:24:33', 'edit');
INSERT INTO `ke_user_log` VALUES ('3155', '5', '/admin/knform/save', '0:0:0:0:0:0:0:1', '2017-02-09 13:24:41', 'save');
INSERT INTO `ke_user_log` VALUES ('3156', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-09 13:24:42', 'index');
INSERT INTO `ke_user_log` VALUES ('3157', '5', '/admin/knform/edit', '0:0:0:0:0:0:0:1', '2017-02-09 13:24:47', 'edit');
INSERT INTO `ke_user_log` VALUES ('3158', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-09 13:26:23', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3159', '5', '/admin/knform/edit', '0:0:0:0:0:0:0:1', '2017-02-09 13:26:23', 'edit');
INSERT INTO `ke_user_log` VALUES ('3160', '5', '/admin/knform/edit', '0:0:0:0:0:0:0:1', '2017-02-09 13:26:51', 'edit');
INSERT INTO `ke_user_log` VALUES ('3161', '5', '/admin/knform/save', '0:0:0:0:0:0:0:1', '2017-02-09 13:27:07', 'save');
INSERT INTO `ke_user_log` VALUES ('3162', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-09 13:27:09', 'index');
INSERT INTO `ke_user_log` VALUES ('3163', '5', '/admin/knform/edit', '0:0:0:0:0:0:0:1', '2017-02-09 13:27:12', 'edit');
INSERT INTO `ke_user_log` VALUES ('3164', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-09 13:30:23', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3165', '5', '/admin/knmole', '0:0:0:0:0:0:0:1', '2017-02-09 13:30:23', 'index');
INSERT INTO `ke_user_log` VALUES ('3166', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-09 13:33:13', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3167', '5', '/admin/knmole', '0:0:0:0:0:0:0:1', '2017-02-09 13:33:13', 'index');
INSERT INTO `ke_user_log` VALUES ('3168', '5', '/admin/knmole', '0:0:0:0:0:0:0:1', '2017-02-09 13:34:36', 'index');
INSERT INTO `ke_user_log` VALUES ('3169', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-09 13:35:18', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3170', '5', '/admin/knmole', '0:0:0:0:0:0:0:1', '2017-02-09 13:35:18', 'index');
INSERT INTO `ke_user_log` VALUES ('3171', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-09 13:41:43', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3172', '5', '/admin/knmole/save', '0:0:0:0:0:0:0:1', '2017-02-09 13:41:43', 'save');
INSERT INTO `ke_user_log` VALUES ('3173', '5', '/admin/knmole', '0:0:0:0:0:0:0:1', '2017-02-09 13:41:43', 'index');
INSERT INTO `ke_user_log` VALUES ('3174', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-09 13:44:28', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3175', '5', '/admin/knmole/save', '0:0:0:0:0:0:0:1', '2017-02-09 13:44:28', 'save');
INSERT INTO `ke_user_log` VALUES ('3176', '5', '/admin/knmole', '0:0:0:0:0:0:0:1', '2017-02-09 13:44:29', 'index');
INSERT INTO `ke_user_log` VALUES ('3177', '5', '/admin/knmole/getKnMoleById', '0:0:0:0:0:0:0:1', '2017-02-09 13:45:22', 'getKnMoleById');
INSERT INTO `ke_user_log` VALUES ('3178', '5', '/admin/knmole/save', '0:0:0:0:0:0:0:1', '2017-02-09 13:45:24', 'save');
INSERT INTO `ke_user_log` VALUES ('3179', '5', '/admin/knmole', '0:0:0:0:0:0:0:1', '2017-02-09 13:45:24', 'index');
INSERT INTO `ke_user_log` VALUES ('3180', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-09 13:46:22', 'index');
INSERT INTO `ke_user_log` VALUES ('3181', '5', '/admin/knform/getFormImgById', '0:0:0:0:0:0:0:1', '2017-02-09 13:46:25', 'getFormImgById');
INSERT INTO `ke_user_log` VALUES ('3182', '5', '/admin/knform/getFormImgById', '0:0:0:0:0:0:0:1', '2017-02-09 13:46:27', 'getFormImgById');
INSERT INTO `ke_user_log` VALUES ('3183', '5', '/admin/knform/getFormImgById', '0:0:0:0:0:0:0:1', '2017-02-09 13:46:28', 'getFormImgById');
INSERT INTO `ke_user_log` VALUES ('3184', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-09 13:46:29', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3185', '5', '/admin/knform/getFormImgById', '0:0:0:0:0:0:0:1', '2017-02-09 13:46:29', 'getFormImgById');
INSERT INTO `ke_user_log` VALUES ('3186', '5', '/admin/knform/getFormImgById', '0:0:0:0:0:0:0:1', '2017-02-09 13:46:30', 'getFormImgById');
INSERT INTO `ke_user_log` VALUES ('3187', '5', '/admin/knform/getFormImgById', '0:0:0:0:0:0:0:1', '2017-02-09 13:46:30', 'getFormImgById');
INSERT INTO `ke_user_log` VALUES ('3188', '5', '/admin/knform/getFormImgById', '0:0:0:0:0:0:0:1', '2017-02-09 13:46:31', 'getFormImgById');
INSERT INTO `ke_user_log` VALUES ('3189', '5', '/admin/knform/getFormImgById', '0:0:0:0:0:0:0:1', '2017-02-09 13:46:32', 'getFormImgById');
INSERT INTO `ke_user_log` VALUES ('3190', '5', '/admin/knform/getFormImgById', '0:0:0:0:0:0:0:1', '2017-02-09 13:46:32', 'getFormImgById');
INSERT INTO `ke_user_log` VALUES ('3191', '5', '/admin/knform/getFormImgById', '0:0:0:0:0:0:0:1', '2017-02-09 13:46:33', 'getFormImgById');
INSERT INTO `ke_user_log` VALUES ('3192', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-09 13:46:35', 'index');
INSERT INTO `ke_user_log` VALUES ('3193', '5', '/admin/knmole', '0:0:0:0:0:0:0:1', '2017-02-09 13:47:18', 'index');
INSERT INTO `ke_user_log` VALUES ('3194', '5', '/admin/knmole', '0:0:0:0:0:0:0:1', '2017-02-09 13:47:33', 'index');
INSERT INTO `ke_user_log` VALUES ('3195', '5', '/admin/knmole', '0:0:0:0:0:0:0:1', '2017-02-09 13:47:46', 'index');
INSERT INTO `ke_user_log` VALUES ('3196', '5', '/admin/knmole', '0:0:0:0:0:0:0:1', '2017-02-09 13:47:56', 'index');
INSERT INTO `ke_user_log` VALUES ('3197', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-09 13:54:13', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3198', '5', '/admin/knmole', '0:0:0:0:0:0:0:1', '2017-02-09 13:54:13', 'index');
INSERT INTO `ke_user_log` VALUES ('3199', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-09 13:54:48', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3200', '5', '/admin/knmole', '0:0:0:0:0:0:0:1', '2017-02-09 13:54:48', 'index');
INSERT INTO `ke_user_log` VALUES ('3201', '5', '/admin/knmole', '0:0:0:0:0:0:0:1', '2017-02-09 13:54:49', 'index');
INSERT INTO `ke_user_log` VALUES ('3202', '5', '/admin/knmole', '0:0:0:0:0:0:0:1', '2017-02-09 13:54:50', 'index');
INSERT INTO `ke_user_log` VALUES ('3203', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-09 20:29:55', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3204', '5', '/admin', '0:0:0:0:0:0:0:1', '2017-02-09 20:29:57', 'index');
INSERT INTO `ke_user_log` VALUES ('3205', '5', '/admin', '0:0:0:0:0:0:0:1', '2017-02-09 20:30:00', 'index');
INSERT INTO `ke_user_log` VALUES ('3206', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-09 20:38:57', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3207', '5', '/admin', '0:0:0:0:0:0:0:1', '2017-02-09 20:38:59', 'index');
INSERT INTO `ke_user_log` VALUES ('3208', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-09 20:39:01', 'index');
INSERT INTO `ke_user_log` VALUES ('3209', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-09 20:39:02', 'index');
INSERT INTO `ke_user_log` VALUES ('3210', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-09 20:39:03', 'index');
INSERT INTO `ke_user_log` VALUES ('3211', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-09 20:39:04', 'index');
INSERT INTO `ke_user_log` VALUES ('3212', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-09 20:39:06', 'index');
INSERT INTO `ke_user_log` VALUES ('3213', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-09 20:39:06', 'index');
INSERT INTO `ke_user_log` VALUES ('3214', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-09 20:39:07', 'index');
INSERT INTO `ke_user_log` VALUES ('3215', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-09 20:39:07', 'index');
INSERT INTO `ke_user_log` VALUES ('3216', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-09 20:39:08', 'index');
INSERT INTO `ke_user_log` VALUES ('3217', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-09 20:42:00', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3218', '5', '/admin/knentry', '0:0:0:0:0:0:0:1', '2017-02-09 20:42:00', 'index');
INSERT INTO `ke_user_log` VALUES ('3219', '5', '/admin/knform/add', '0:0:0:0:0:0:0:1', '2017-02-09 20:42:08', 'add');
INSERT INTO `ke_user_log` VALUES ('3220', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-09 20:45:50', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3221', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-09 20:45:50', 'index');
INSERT INTO `ke_user_log` VALUES ('3222', '5', '/admin/knform/add', '0:0:0:0:0:0:0:1', '2017-02-09 20:45:51', 'add');
INSERT INTO `ke_user_log` VALUES ('3223', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-09 20:48:04', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3224', '5', '/admin/knentry', '0:0:0:0:0:0:0:1', '2017-02-09 20:48:04', 'index');
INSERT INTO `ke_user_log` VALUES ('3225', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-09 20:48:06', 'add');
INSERT INTO `ke_user_log` VALUES ('3226', '5', '/admin/knentry', '0:0:0:0:0:0:0:1', '2017-02-09 20:48:13', 'index');
INSERT INTO `ke_user_log` VALUES ('3227', '5', '/admin/knentry', '0:0:0:0:0:0:0:1', '2017-02-09 20:49:31', 'index');
INSERT INTO `ke_user_log` VALUES ('3228', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-09 20:49:33', 'add');
INSERT INTO `ke_user_log` VALUES ('3229', '5', '/admin/knentry', '0:0:0:0:0:0:0:1', '2017-02-09 20:49:41', 'index');
INSERT INTO `ke_user_log` VALUES ('3230', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-09 20:49:44', 'index');
INSERT INTO `ke_user_log` VALUES ('3231', '5', '/admin/knentry', '0:0:0:0:0:0:0:1', '2017-02-09 20:49:46', 'index');
INSERT INTO `ke_user_log` VALUES ('3232', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-09 20:50:20', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3233', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-09 20:50:20', 'add');
INSERT INTO `ke_user_log` VALUES ('3234', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-09 20:52:45', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3235', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-09 20:52:45', 'add');
INSERT INTO `ke_user_log` VALUES ('3236', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-09 20:54:03', 'add');
INSERT INTO `ke_user_log` VALUES ('3237', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-09 20:54:07', 'add');
INSERT INTO `ke_user_log` VALUES ('3238', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-09 20:54:43', 'add');
INSERT INTO `ke_user_log` VALUES ('3239', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-09 20:57:19', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3240', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-09 20:57:19', 'add');
INSERT INTO `ke_user_log` VALUES ('3241', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-09 20:58:13', 'add');
INSERT INTO `ke_user_log` VALUES ('3242', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-09 20:58:36', 'add');
INSERT INTO `ke_user_log` VALUES ('3243', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-09 21:00:08', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3244', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-09 21:00:08', 'add');
INSERT INTO `ke_user_log` VALUES ('3245', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-09 21:01:01', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3246', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-09 21:01:01', 'add');
INSERT INTO `ke_user_log` VALUES ('3247', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-09 21:01:08', 'add');
INSERT INTO `ke_user_log` VALUES ('3248', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-09 21:01:17', 'add');
INSERT INTO `ke_user_log` VALUES ('3249', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-09 21:01:36', 'add');
INSERT INTO `ke_user_log` VALUES ('3250', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-09 21:03:03', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3251', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-09 21:03:03', 'add');
INSERT INTO `ke_user_log` VALUES ('3252', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-09 21:03:13', 'add');
INSERT INTO `ke_user_log` VALUES ('3253', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-09 21:04:24', 'add');
INSERT INTO `ke_user_log` VALUES ('3254', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-09 21:04:59', 'index');
INSERT INTO `ke_user_log` VALUES ('3255', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-09 21:05:39', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3256', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-09 21:05:39', 'index');
INSERT INTO `ke_user_log` VALUES ('3257', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-09 21:05:44', 'index');
INSERT INTO `ke_user_log` VALUES ('3258', '5', '/admin/knentry', '0:0:0:0:0:0:0:1', '2017-02-09 21:05:46', 'index');
INSERT INTO `ke_user_log` VALUES ('3259', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-09 21:05:47', 'add');
INSERT INTO `ke_user_log` VALUES ('3260', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-09 21:05:49', 'add');
INSERT INTO `ke_user_log` VALUES ('3261', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-09 21:06:21', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3262', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-09 21:06:21', 'add');
INSERT INTO `ke_user_log` VALUES ('3263', '5', '/admin/knentry', '0:0:0:0:0:0:0:1', '2017-02-09 21:06:32', 'index');
INSERT INTO `ke_user_log` VALUES ('3264', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-09 21:06:36', 'index');
INSERT INTO `ke_user_log` VALUES ('3265', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-09 21:07:31', 'add');
INSERT INTO `ke_user_log` VALUES ('3266', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-09 21:07:45', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3267', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-09 21:07:45', 'add');
INSERT INTO `ke_user_log` VALUES ('3268', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-09 21:07:46', 'add');
INSERT INTO `ke_user_log` VALUES ('3269', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-09 21:08:04', 'add');
INSERT INTO `ke_user_log` VALUES ('3270', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-09 21:08:25', 'add');
INSERT INTO `ke_user_log` VALUES ('3271', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-09 21:08:32', 'add');
INSERT INTO `ke_user_log` VALUES ('3272', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-09 21:11:10', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3273', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-09 21:11:10', 'add');
INSERT INTO `ke_user_log` VALUES ('3274', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-09 21:11:49', 'add');
INSERT INTO `ke_user_log` VALUES ('3275', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-09 21:16:41', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3276', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-09 21:16:41', 'add');
INSERT INTO `ke_user_log` VALUES ('3277', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-09 21:24:50', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3278', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-09 21:24:50', 'add');
INSERT INTO `ke_user_log` VALUES ('3279', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-09 21:26:52', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3280', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-09 21:26:52', 'add');
INSERT INTO `ke_user_log` VALUES ('3281', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-09 21:26:54', 'add');
INSERT INTO `ke_user_log` VALUES ('3282', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-09 21:27:21', 'add');
INSERT INTO `ke_user_log` VALUES ('3283', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-09 21:28:26', 'add');
INSERT INTO `ke_user_log` VALUES ('3284', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-09 21:28:40', 'add');
INSERT INTO `ke_user_log` VALUES ('3285', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-09 21:29:07', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3286', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-09 21:29:07', 'add');
INSERT INTO `ke_user_log` VALUES ('3287', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-09 21:29:28', 'add');
INSERT INTO `ke_user_log` VALUES ('3288', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-09 21:31:33', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3289', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-09 21:31:33', 'index');
INSERT INTO `ke_user_log` VALUES ('3290', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-10 07:30:05', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3291', '5', '/admin', '0:0:0:0:0:0:0:1', '2017-02-10 07:30:07', 'index');
INSERT INTO `ke_user_log` VALUES ('3292', '5', '/admin/knentry', '0:0:0:0:0:0:0:1', '2017-02-10 07:30:10', 'index');
INSERT INTO `ke_user_log` VALUES ('3293', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-10 07:30:12', 'add');
INSERT INTO `ke_user_log` VALUES ('3294', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-10 07:30:49', 'add');
INSERT INTO `ke_user_log` VALUES ('3295', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-10 07:30:50', 'add');
INSERT INTO `ke_user_log` VALUES ('3296', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-10 07:31:33', 'add');
INSERT INTO `ke_user_log` VALUES ('3297', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-10 07:33:25', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3298', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-10 07:33:25', 'add');
INSERT INTO `ke_user_log` VALUES ('3299', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-10 07:34:50', 'add');
INSERT INTO `ke_user_log` VALUES ('3300', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-10 07:35:43', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3301', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-10 07:35:43', 'add');
INSERT INTO `ke_user_log` VALUES ('3302', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-10 07:38:00', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3303', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-10 07:38:00', 'add');
INSERT INTO `ke_user_log` VALUES ('3304', '5', '/admin/knfile', '0:0:0:0:0:0:0:1', '2017-02-10 07:39:42', 'index');
INSERT INTO `ke_user_log` VALUES ('3305', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-10 07:39:54', 'index');
INSERT INTO `ke_user_log` VALUES ('3306', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-10 07:40:04', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3307', '5', '/admin/knmole', '0:0:0:0:0:0:0:1', '2017-02-10 07:40:04', 'index');
INSERT INTO `ke_user_log` VALUES ('3308', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-10 07:40:10', 'index');
INSERT INTO `ke_user_log` VALUES ('3309', '5', '/admin/knfile', '0:0:0:0:0:0:0:1', '2017-02-10 07:40:11', 'index');
INSERT INTO `ke_user_log` VALUES ('3310', '5', '/admin/knentry', '0:0:0:0:0:0:0:1', '2017-02-10 07:40:12', 'index');
INSERT INTO `ke_user_log` VALUES ('3311', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-10 07:40:15', 'index');
INSERT INTO `ke_user_log` VALUES ('3312', '5', '/admin/knentry', '0:0:0:0:0:0:0:1', '2017-02-10 07:40:16', 'index');
INSERT INTO `ke_user_log` VALUES ('3313', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-10 07:40:18', 'add');
INSERT INTO `ke_user_log` VALUES ('3314', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-10 07:47:19', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3315', '5', '/admin/knmole', '0:0:0:0:0:0:0:1', '2017-02-10 07:47:19', 'index');
INSERT INTO `ke_user_log` VALUES ('3316', '5', '/admin/knentry', '0:0:0:0:0:0:0:1', '2017-02-10 07:47:45', 'index');
INSERT INTO `ke_user_log` VALUES ('3317', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-10 07:47:47', 'add');
INSERT INTO `ke_user_log` VALUES ('3318', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-10 07:52:36', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3319', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-10 07:52:36', 'add');
INSERT INTO `ke_user_log` VALUES ('3320', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-10 07:53:04', 'add');
INSERT INTO `ke_user_log` VALUES ('3321', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-10 07:54:31', 'add');
INSERT INTO `ke_user_log` VALUES ('3322', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-10 07:54:58', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3323', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-10 07:56:02', 'add');
INSERT INTO `ke_user_log` VALUES ('3324', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-10 07:56:55', 'add');
INSERT INTO `ke_user_log` VALUES ('3325', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-10 07:57:43', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3326', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-10 07:57:43', 'add');
INSERT INTO `ke_user_log` VALUES ('3327', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-10 08:00:01', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3328', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-10 08:01:58', 'add');
INSERT INTO `ke_user_log` VALUES ('3329', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-10 08:03:53', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3330', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-10 08:23:40', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3331', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-10 08:23:40', 'add');
INSERT INTO `ke_user_log` VALUES ('3332', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-10 08:24:29', 'add');
INSERT INTO `ke_user_log` VALUES ('3333', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-10 08:25:29', 'add');
INSERT INTO `ke_user_log` VALUES ('3334', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-10 08:26:19', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3335', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-10 08:26:19', 'add');
INSERT INTO `ke_user_log` VALUES ('3336', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-10 08:26:41', 'add');
INSERT INTO `ke_user_log` VALUES ('3337', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-10 08:30:08', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3338', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-10 08:30:08', 'add');
INSERT INTO `ke_user_log` VALUES ('3339', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-10 08:31:14', 'add');
INSERT INTO `ke_user_log` VALUES ('3340', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-10 08:31:19', 'add');
INSERT INTO `ke_user_log` VALUES ('3341', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-10 11:51:08', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3342', '5', '/admin', '0:0:0:0:0:0:0:1', '2017-02-10 11:51:10', 'index');
INSERT INTO `ke_user_log` VALUES ('3343', '5', '/admin/knentry', '0:0:0:0:0:0:0:1', '2017-02-10 11:51:12', 'index');
INSERT INTO `ke_user_log` VALUES ('3344', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-10 11:51:13', 'add');
INSERT INTO `ke_user_log` VALUES ('3345', '5', '/admin/knentry/findRelaFile', '0:0:0:0:0:0:0:1', '2017-02-10 11:51:16', 'findRelaFile');
INSERT INTO `ke_user_log` VALUES ('3346', '5', '/admin/knfile', '0:0:0:0:0:0:0:1', '2017-02-10 11:51:25', 'index');
INSERT INTO `ke_user_log` VALUES ('3347', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-10 11:51:26', 'index');
INSERT INTO `ke_user_log` VALUES ('3348', '5', '/admin/knmole', '0:0:0:0:0:0:0:1', '2017-02-10 11:51:28', 'index');
INSERT INTO `ke_user_log` VALUES ('3349', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-10 11:51:31', 'index');
INSERT INTO `ke_user_log` VALUES ('3350', '5', '/admin/knfile', '0:0:0:0:0:0:0:1', '2017-02-10 11:51:31', 'index');
INSERT INTO `ke_user_log` VALUES ('3351', '5', '/admin/knentry', '0:0:0:0:0:0:0:1', '2017-02-10 11:51:32', 'index');
INSERT INTO `ke_user_log` VALUES ('3352', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-10 11:51:32', 'index');
INSERT INTO `ke_user_log` VALUES ('3353', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-10 11:51:33', 'index');
INSERT INTO `ke_user_log` VALUES ('3354', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-10 11:51:34', 'index');
INSERT INTO `ke_user_log` VALUES ('3355', '5', '/admin/knmole', '0:0:0:0:0:0:0:1', '2017-02-10 11:51:35', 'index');
INSERT INTO `ke_user_log` VALUES ('3356', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-10 13:23:03', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3357', '5', '/admin/knmole', '0:0:0:0:0:0:0:1', '2017-02-10 13:23:03', 'index');
INSERT INTO `ke_user_log` VALUES ('3358', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-10 13:23:06', 'index');
INSERT INTO `ke_user_log` VALUES ('3359', '5', '/admin/knfile', '0:0:0:0:0:0:0:1', '2017-02-10 13:23:07', 'index');
INSERT INTO `ke_user_log` VALUES ('3360', '5', '/admin/knentry', '0:0:0:0:0:0:0:1', '2017-02-10 13:23:08', 'index');
INSERT INTO `ke_user_log` VALUES ('3361', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-10 13:23:09', 'add');
INSERT INTO `ke_user_log` VALUES ('3362', '5', '/admin/knentry/findRelaFile', '0:0:0:0:0:0:0:1', '2017-02-10 13:23:14', 'findRelaFile');
INSERT INTO `ke_user_log` VALUES ('3363', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-10 13:35:18', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3364', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-10 13:35:18', 'add');
INSERT INTO `ke_user_log` VALUES ('3365', '5', '/admin/knentry/findRelaFile', '0:0:0:0:0:0:0:1', '2017-02-10 13:35:20', 'findRelaFile');
INSERT INTO `ke_user_log` VALUES ('3366', '5', '/admin/knentry/findRelaFile', '0:0:0:0:0:0:0:1', '2017-02-10 13:35:38', 'findRelaFile');
INSERT INTO `ke_user_log` VALUES ('3367', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-10 13:37:30', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3368', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-10 13:37:30', 'add');
INSERT INTO `ke_user_log` VALUES ('3369', '5', '/admin/knentry/findRelaFile', '0:0:0:0:0:0:0:1', '2017-02-10 13:37:31', 'findRelaFile');
INSERT INTO `ke_user_log` VALUES ('3370', '5', '/admin/knentry/findRelaFile', '0:0:0:0:0:0:0:1', '2017-02-10 13:39:10', 'findRelaFile');
INSERT INTO `ke_user_log` VALUES ('3371', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-10 13:40:35', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3372', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-10 13:40:35', 'add');
INSERT INTO `ke_user_log` VALUES ('3373', '5', '/admin/knentry/findRelaFile', '0:0:0:0:0:0:0:1', '2017-02-10 13:40:37', 'findRelaFile');
INSERT INTO `ke_user_log` VALUES ('3374', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-10 13:43:13', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3375', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-10 13:43:13', 'add');
INSERT INTO `ke_user_log` VALUES ('3376', '5', '/admin/knentry/findRelaFile', '0:0:0:0:0:0:0:1', '2017-02-10 13:43:17', 'findRelaFile');
INSERT INTO `ke_user_log` VALUES ('3377', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-10 13:43:44', 'add');
INSERT INTO `ke_user_log` VALUES ('3378', '5', '/admin/knentry/findRelaFile', '0:0:0:0:0:0:0:1', '2017-02-10 13:43:45', 'findRelaFile');
INSERT INTO `ke_user_log` VALUES ('3379', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-10 13:45:23', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3380', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-10 13:45:23', 'add');
INSERT INTO `ke_user_log` VALUES ('3381', '5', '/admin/knentry/findRelaFile', '0:0:0:0:0:0:0:1', '2017-02-10 13:45:25', 'findRelaFile');
INSERT INTO `ke_user_log` VALUES ('3382', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-10 13:47:40', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3383', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-10 13:47:40', 'add');
INSERT INTO `ke_user_log` VALUES ('3384', '5', '/admin/knentry/findRelaFile', '0:0:0:0:0:0:0:1', '2017-02-10 13:47:42', 'findRelaFile');
INSERT INTO `ke_user_log` VALUES ('3385', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-10 13:51:17', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3386', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-10 13:51:17', 'add');
INSERT INTO `ke_user_log` VALUES ('3387', '5', '/admin/knentry/findRelaFile', '0:0:0:0:0:0:0:1', '2017-02-10 13:51:20', 'findRelaFile');
INSERT INTO `ke_user_log` VALUES ('3388', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-10 13:51:58', 'add');
INSERT INTO `ke_user_log` VALUES ('3389', '5', '/admin/knentry/findRelaFile', '0:0:0:0:0:0:0:1', '2017-02-10 13:52:00', 'findRelaFile');
INSERT INTO `ke_user_log` VALUES ('3390', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-10 13:54:25', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3391', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-10 13:54:25', 'add');
INSERT INTO `ke_user_log` VALUES ('3392', '5', '/admin/knentry/findRelaFile', '0:0:0:0:0:0:0:1', '2017-02-10 13:54:27', 'findRelaFile');
INSERT INTO `ke_user_log` VALUES ('3393', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-10 14:03:58', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3394', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-10 14:03:58', 'add');
INSERT INTO `ke_user_log` VALUES ('3395', '5', '/admin/knentry/findRelaFile', '0:0:0:0:0:0:0:1', '2017-02-10 14:04:00', 'findRelaFile');
INSERT INTO `ke_user_log` VALUES ('3396', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-10 14:04:11', 'add');
INSERT INTO `ke_user_log` VALUES ('3397', '5', '/admin/knentry/findRelaFile', '0:0:0:0:0:0:0:1', '2017-02-10 14:04:13', 'findRelaFile');
INSERT INTO `ke_user_log` VALUES ('3398', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-10 14:06:16', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3399', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-10 14:06:16', 'add');
INSERT INTO `ke_user_log` VALUES ('3400', '5', '/admin/knentry/findRelaFile', '0:0:0:0:0:0:0:1', '2017-02-10 14:06:18', 'findRelaFile');
INSERT INTO `ke_user_log` VALUES ('3401', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-10 14:08:40', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3402', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-10 14:08:40', 'add');
INSERT INTO `ke_user_log` VALUES ('3403', '5', '/admin/knentry/findRelaFile', '0:0:0:0:0:0:0:1', '2017-02-10 14:08:42', 'findRelaFile');
INSERT INTO `ke_user_log` VALUES ('3404', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-10 14:09:07', 'add');
INSERT INTO `ke_user_log` VALUES ('3405', '5', '/admin/knentry/findRelaFile', '0:0:0:0:0:0:0:1', '2017-02-10 14:09:10', 'findRelaFile');
INSERT INTO `ke_user_log` VALUES ('3406', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-10 14:09:25', 'add');
INSERT INTO `ke_user_log` VALUES ('3407', '5', '/admin/knentry/findRelaFile', '0:0:0:0:0:0:0:1', '2017-02-10 14:09:27', 'findRelaFile');
INSERT INTO `ke_user_log` VALUES ('3408', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-10 14:10:45', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3409', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-10 14:10:45', 'add');
INSERT INTO `ke_user_log` VALUES ('3410', '5', '/admin/knentry/findRelaFile', '0:0:0:0:0:0:0:1', '2017-02-10 14:10:47', 'findRelaFile');
INSERT INTO `ke_user_log` VALUES ('3411', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-10 14:11:27', 'add');
INSERT INTO `ke_user_log` VALUES ('3412', '5', '/admin/knentry/findRelaFile', '0:0:0:0:0:0:0:1', '2017-02-10 14:11:30', 'findRelaFile');
INSERT INTO `ke_user_log` VALUES ('3413', '5', '/admin/knentry/findRelaFile', '0:0:0:0:0:0:0:1', '2017-02-10 14:11:35', 'findRelaFile');
INSERT INTO `ke_user_log` VALUES ('3414', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-10 14:13:14', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3415', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-10 14:13:14', 'add');
INSERT INTO `ke_user_log` VALUES ('3416', '5', '/admin/knentry/findRelaFile', '0:0:0:0:0:0:0:1', '2017-02-10 14:13:15', 'findRelaFile');
INSERT INTO `ke_user_log` VALUES ('3417', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-10 14:13:33', 'add');
INSERT INTO `ke_user_log` VALUES ('3418', '5', '/admin/knentry/findRelaFile', '0:0:0:0:0:0:0:1', '2017-02-10 14:13:35', 'findRelaFile');
INSERT INTO `ke_user_log` VALUES ('3419', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-10 14:15:30', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3420', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-10 14:15:30', 'add');
INSERT INTO `ke_user_log` VALUES ('3421', '5', '/admin/knentry/findRelaFile', '0:0:0:0:0:0:0:1', '2017-02-10 14:15:32', 'findRelaFile');
INSERT INTO `ke_user_log` VALUES ('3422', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-10 14:15:57', 'add');
INSERT INTO `ke_user_log` VALUES ('3423', '5', '/admin/knentry/findRelaFile', '0:0:0:0:0:0:0:1', '2017-02-10 14:15:59', 'findRelaFile');
INSERT INTO `ke_user_log` VALUES ('3424', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-10 14:17:59', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3425', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-10 14:17:59', 'add');
INSERT INTO `ke_user_log` VALUES ('3426', '5', '/admin/knentry/findRelaFile', '0:0:0:0:0:0:0:1', '2017-02-10 14:18:00', 'findRelaFile');
INSERT INTO `ke_user_log` VALUES ('3427', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-10 14:19:21', 'add');
INSERT INTO `ke_user_log` VALUES ('3428', '5', '/admin/knentry/findRelaFile', '0:0:0:0:0:0:0:1', '2017-02-10 14:19:22', 'findRelaFile');
INSERT INTO `ke_user_log` VALUES ('3429', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-10 14:20:18', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3430', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-10 14:20:18', 'add');
INSERT INTO `ke_user_log` VALUES ('3431', '5', '/admin/knentry/findRelaFile', '0:0:0:0:0:0:0:1', '2017-02-10 14:20:20', 'findRelaFile');
INSERT INTO `ke_user_log` VALUES ('3432', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-10 14:21:03', 'add');
INSERT INTO `ke_user_log` VALUES ('3433', '5', '/admin/knentry/findRelaFile', '0:0:0:0:0:0:0:1', '2017-02-10 14:21:05', 'findRelaFile');
INSERT INTO `ke_user_log` VALUES ('3434', '5', '/admin/knentry/findRelaFile', '0:0:0:0:0:0:0:1', '2017-02-10 14:21:10', 'findRelaFile');
INSERT INTO `ke_user_log` VALUES ('3435', '5', '/admin/knentry/findRelaFile', '0:0:0:0:0:0:0:1', '2017-02-10 14:21:23', 'findRelaFile');
INSERT INTO `ke_user_log` VALUES ('3436', '5', '/admin/knentry/findRelaFile', '0:0:0:0:0:0:0:1', '2017-02-10 14:21:44', 'findRelaFile');
INSERT INTO `ke_user_log` VALUES ('3437', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-10 14:22:39', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3438', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-10 14:22:39', 'add');
INSERT INTO `ke_user_log` VALUES ('3439', '5', '/admin/knentry/findRelaFile', '0:0:0:0:0:0:0:1', '2017-02-10 14:22:41', 'findRelaFile');
INSERT INTO `ke_user_log` VALUES ('3440', '5', '/admin/knentry/findRelaFile', '0:0:0:0:0:0:0:1', '2017-02-10 14:22:46', 'findRelaFile');
INSERT INTO `ke_user_log` VALUES ('3441', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-10 14:23:46', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3442', '5', '/admin/knentry/findRelaFile', '0:0:0:0:0:0:0:1', '2017-02-10 14:23:46', 'findRelaFile');
INSERT INTO `ke_user_log` VALUES ('3443', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-10 14:26:21', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3444', '5', '/admin/knentry/findRelaFile', '0:0:0:0:0:0:0:1', '2017-02-10 14:26:21', 'findRelaFile');
INSERT INTO `ke_user_log` VALUES ('3445', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-10 14:41:05', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3446', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-10 14:41:05', 'add');
INSERT INTO `ke_user_log` VALUES ('3447', '5', '/admin/knentry/findRelaFile', '0:0:0:0:0:0:0:1', '2017-02-10 14:41:07', 'findRelaFile');
INSERT INTO `ke_user_log` VALUES ('3448', '5', '/admin/knentry/findRelaFile', '0:0:0:0:0:0:0:1', '2017-02-10 14:41:15', 'findRelaFile');
INSERT INTO `ke_user_log` VALUES ('3449', '5', '/admin/knentry/findRelaFile', '0:0:0:0:0:0:0:1', '2017-02-10 14:41:36', 'findRelaFile');
INSERT INTO `ke_user_log` VALUES ('3450', '5', '/admin/knentry/findRelaFile', '0:0:0:0:0:0:0:1', '2017-02-10 14:41:54', 'findRelaFile');
INSERT INTO `ke_user_log` VALUES ('3451', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-10 14:42:40', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3452', '5', '/admin/knentry/findRelaFile', '0:0:0:0:0:0:0:1', '2017-02-10 14:42:40', 'findRelaFile');
INSERT INTO `ke_user_log` VALUES ('3453', '5', '/admin/knentry/findRelaFile', '0:0:0:0:0:0:0:1', '2017-02-10 14:43:13', 'findRelaFile');
INSERT INTO `ke_user_log` VALUES ('3454', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-10 14:45:03', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3455', '5', '/admin/knentry/findRelaFile', '0:0:0:0:0:0:0:1', '2017-02-10 14:45:03', 'findRelaFile');
INSERT INTO `ke_user_log` VALUES ('3456', '5', '/admin/knentry/findRelaFile', '0:0:0:0:0:0:0:1', '2017-02-10 14:45:30', 'findRelaFile');
INSERT INTO `ke_user_log` VALUES ('3457', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-10 15:01:00', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3458', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-10 15:01:00', 'add');
INSERT INTO `ke_user_log` VALUES ('3459', '5', '/admin/knentry/findRelaFile', '0:0:0:0:0:0:0:1', '2017-02-10 15:01:02', 'findRelaFile');
INSERT INTO `ke_user_log` VALUES ('3460', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-10 15:01:23', 'add');
INSERT INTO `ke_user_log` VALUES ('3461', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-10 15:01:24', 'add');
INSERT INTO `ke_user_log` VALUES ('3462', '5', '/admin/knentry/findRelaFile', '0:0:0:0:0:0:0:1', '2017-02-10 15:01:26', 'findRelaFile');
INSERT INTO `ke_user_log` VALUES ('3463', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-10 15:01:41', 'add');
INSERT INTO `ke_user_log` VALUES ('3464', '5', '/admin/knentry/findRelaFile', '0:0:0:0:0:0:0:1', '2017-02-10 15:01:43', 'findRelaFile');
INSERT INTO `ke_user_log` VALUES ('3465', '5', '/admin/knentry/findRelaFile', '0:0:0:0:0:0:0:1', '2017-02-10 15:01:57', 'findRelaFile');
INSERT INTO `ke_user_log` VALUES ('3466', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-10 15:02:23', 'add');
INSERT INTO `ke_user_log` VALUES ('3467', '5', '/admin/knentry/findRelaFile', '0:0:0:0:0:0:0:1', '2017-02-10 15:02:25', 'findRelaFile');
INSERT INTO `ke_user_log` VALUES ('3468', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-10 15:03:01', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3469', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-10 15:03:01', 'add');
INSERT INTO `ke_user_log` VALUES ('3470', '5', '/admin/knentry/findRelaFile', '0:0:0:0:0:0:0:1', '2017-02-10 15:03:03', 'findRelaFile');
INSERT INTO `ke_user_log` VALUES ('3471', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-10 15:05:49', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3472', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-10 15:05:49', 'add');
INSERT INTO `ke_user_log` VALUES ('3473', '5', '/admin/knentry/findRelaFile', '0:0:0:0:0:0:0:1', '2017-02-10 15:05:50', 'findRelaFile');
INSERT INTO `ke_user_log` VALUES ('3474', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-10 15:13:38', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3475', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-10 15:13:38', 'add');
INSERT INTO `ke_user_log` VALUES ('3476', '5', '/admin/knentry', '0:0:0:0:0:0:0:1', '2017-02-10 15:13:40', 'index');
INSERT INTO `ke_user_log` VALUES ('3477', '5', '/admin/knentry', '0:0:0:0:0:0:0:1', '2017-02-10 15:13:53', 'index');
INSERT INTO `ke_user_log` VALUES ('3478', '5', '/admin/knentry', '0:0:0:0:0:0:0:1', '2017-02-10 15:14:03', 'index');
INSERT INTO `ke_user_log` VALUES ('3479', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-10 15:15:23', 'add');
INSERT INTO `ke_user_log` VALUES ('3480', '5', '/admin/knentry/findRelaFile', '0:0:0:0:0:0:0:1', '2017-02-10 15:15:24', 'findRelaFile');
INSERT INTO `ke_user_log` VALUES ('3481', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-10 15:17:10', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3482', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-10 15:17:10', 'add');
INSERT INTO `ke_user_log` VALUES ('3483', '5', '/admin/knentry/findRelaFile', '0:0:0:0:0:0:0:1', '2017-02-10 15:17:11', 'findRelaFile');
INSERT INTO `ke_user_log` VALUES ('3484', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-10 15:26:12', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3485', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-10 15:26:12', 'add');
INSERT INTO `ke_user_log` VALUES ('3486', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-10 15:27:04', 'add');
INSERT INTO `ke_user_log` VALUES ('3487', '5', '/admin/knentry/findRelaForm', '0:0:0:0:0:0:0:1', '2017-02-10 15:27:06', 'findRelaForm');
INSERT INTO `ke_user_log` VALUES ('3488', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-10 15:30:35', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3489', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-10 15:30:35', 'add');
INSERT INTO `ke_user_log` VALUES ('3490', '5', '/admin/knentry/findRelaMole', '0:0:0:0:0:0:0:1', '2017-02-10 15:30:38', 'findRelaMole');
INSERT INTO `ke_user_log` VALUES ('3491', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-10 15:31:28', 'add');
INSERT INTO `ke_user_log` VALUES ('3492', '5', '/admin/knentry/findRelaForm', '0:0:0:0:0:0:0:1', '2017-02-10 15:31:29', 'findRelaForm');
INSERT INTO `ke_user_log` VALUES ('3493', '5', '/admin/knentry/findRelaForm', '0:0:0:0:0:0:0:1', '2017-02-10 15:31:32', 'findRelaForm');
INSERT INTO `ke_user_log` VALUES ('3494', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-10 15:32:26', 'add');
INSERT INTO `ke_user_log` VALUES ('3495', '5', '/admin/knentry/findRelaForm', '0:0:0:0:0:0:0:1', '2017-02-10 15:32:28', 'findRelaForm');
INSERT INTO `ke_user_log` VALUES ('3496', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-10 15:32:36', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3497', '5', '/admin/knentry/findRelaMole', '0:0:0:0:0:0:0:1', '2017-02-10 15:32:36', 'findRelaMole');
INSERT INTO `ke_user_log` VALUES ('3498', '5', '/admin/knentry/findRelaForm', '0:0:0:0:0:0:0:1', '2017-02-10 15:32:41', 'findRelaForm');
INSERT INTO `ke_user_log` VALUES ('3499', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-10 15:32:57', 'add');
INSERT INTO `ke_user_log` VALUES ('3500', '5', '/admin/knentry/findRelaForm', '0:0:0:0:0:0:0:1', '2017-02-10 15:32:59', 'findRelaForm');
INSERT INTO `ke_user_log` VALUES ('3501', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-10 15:34:27', 'add');
INSERT INTO `ke_user_log` VALUES ('3502', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-10 15:34:36', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3503', '5', '/admin/knentry/findRelaFile', '0:0:0:0:0:0:0:1', '2017-02-10 15:34:36', 'findRelaFile');
INSERT INTO `ke_user_log` VALUES ('3504', '5', '/admin/knentry/findRelaForm', '0:0:0:0:0:0:0:1', '2017-02-10 15:34:39', 'findRelaForm');
INSERT INTO `ke_user_log` VALUES ('3505', '5', '/admin/knentry/findRelaMole', '0:0:0:0:0:0:0:1', '2017-02-10 15:34:41', 'findRelaMole');
INSERT INTO `ke_user_log` VALUES ('3506', '5', '/admin/knentry/findRelaFile', '0:0:0:0:0:0:0:1', '2017-02-10 15:34:59', 'findRelaFile');
INSERT INTO `ke_user_log` VALUES ('3507', '5', '/admin/knentry/findRelaForm', '0:0:0:0:0:0:0:1', '2017-02-10 15:34:59', 'findRelaForm');
INSERT INTO `ke_user_log` VALUES ('3508', '5', '/admin/knentry/findRelaMole', '0:0:0:0:0:0:0:1', '2017-02-10 15:34:59', 'findRelaMole');
INSERT INTO `ke_user_log` VALUES ('3509', '5', '/admin/knentry/findRelaFile', '0:0:0:0:0:0:0:1', '2017-02-10 15:35:01', 'findRelaFile');
INSERT INTO `ke_user_log` VALUES ('3510', '5', '/admin/knentry/findRelaForm', '0:0:0:0:0:0:0:1', '2017-02-10 15:35:04', 'findRelaForm');
INSERT INTO `ke_user_log` VALUES ('3511', '5', '/admin/knentry/findRelaMole', '0:0:0:0:0:0:0:1', '2017-02-10 15:35:07', 'findRelaMole');
INSERT INTO `ke_user_log` VALUES ('3512', '5', '/admin/knentry/findRelaFile', '0:0:0:0:0:0:0:1', '2017-02-10 15:35:37', 'findRelaFile');
INSERT INTO `ke_user_log` VALUES ('3513', '5', '/admin/knentry/findRelaForm', '0:0:0:0:0:0:0:1', '2017-02-10 15:35:39', 'findRelaForm');
INSERT INTO `ke_user_log` VALUES ('3514', '5', '/admin/knentry/findRelaMole', '0:0:0:0:0:0:0:1', '2017-02-10 15:35:41', 'findRelaMole');
INSERT INTO `ke_user_log` VALUES ('3515', '5', '/admin/knentry/findRelaFile', '0:0:0:0:0:0:0:1', '2017-02-10 15:35:45', 'findRelaFile');
INSERT INTO `ke_user_log` VALUES ('3516', '5', '/admin/knentry', '0:0:0:0:0:0:0:1', '2017-02-10 15:35:48', 'index');
INSERT INTO `ke_user_log` VALUES ('3517', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-10 15:36:01', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3518', '5', '/admin/knentry', '0:0:0:0:0:0:0:1', '2017-02-10 15:36:01', 'index');
INSERT INTO `ke_user_log` VALUES ('3519', '5', '/admin/knentry', '0:0:0:0:0:0:0:1', '2017-02-10 15:36:09', 'index');
INSERT INTO `ke_user_log` VALUES ('3520', '5', '/admin/knentry', '0:0:0:0:0:0:0:1', '2017-02-10 15:36:46', 'index');
INSERT INTO `ke_user_log` VALUES ('3521', '5', '/admin/knentry', '0:0:0:0:0:0:0:1', '2017-02-10 15:36:50', 'index');
INSERT INTO `ke_user_log` VALUES ('3522', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-10 15:36:54', 'add');
INSERT INTO `ke_user_log` VALUES ('3523', '5', '/admin/knentry/findRelaFile', '0:0:0:0:0:0:0:1', '2017-02-10 15:37:00', 'findRelaFile');
INSERT INTO `ke_user_log` VALUES ('3524', '5', '/admin/knentry/findRelaForm', '0:0:0:0:0:0:0:1', '2017-02-10 15:37:04', 'findRelaForm');
INSERT INTO `ke_user_log` VALUES ('3525', '5', '/admin/knentry/findRelaMole', '0:0:0:0:0:0:0:1', '2017-02-10 15:37:06', 'findRelaMole');
INSERT INTO `ke_user_log` VALUES ('3526', '5', '/admin/knentry', '0:0:0:0:0:0:0:1', '2017-02-10 15:37:08', 'index');
INSERT INTO `ke_user_log` VALUES ('3527', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-10 15:37:13', 'add');
INSERT INTO `ke_user_log` VALUES ('3528', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-10 15:37:21', 'add');
INSERT INTO `ke_user_log` VALUES ('3529', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-10 15:37:26', 'add');
INSERT INTO `ke_user_log` VALUES ('3530', '5', '/admin/knentry/findRelaMole', '0:0:0:0:0:0:0:1', '2017-02-10 15:37:46', 'findRelaMole');
INSERT INTO `ke_user_log` VALUES ('3531', '5', '/admin/knentry/findRelaForm', '0:0:0:0:0:0:0:1', '2017-02-10 15:37:48', 'findRelaForm');
INSERT INTO `ke_user_log` VALUES ('3532', '5', '/admin/knentry/findRelaFile', '0:0:0:0:0:0:0:1', '2017-02-10 15:37:50', 'findRelaFile');
INSERT INTO `ke_user_log` VALUES ('3533', '5', '/admin/knentry/findRelaFile', '0:0:0:0:0:0:0:1', '2017-02-10 15:37:57', 'findRelaFile');
INSERT INTO `ke_user_log` VALUES ('3534', '5', '/admin/knentry/findRelaForm', '0:0:0:0:0:0:0:1', '2017-02-10 15:37:59', 'findRelaForm');
INSERT INTO `ke_user_log` VALUES ('3535', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-10 15:38:02', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3536', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-10 15:38:02', 'add');
INSERT INTO `ke_user_log` VALUES ('3537', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-10 15:39:24', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3538', '5', '/admin/knentry', '0:0:0:0:0:0:0:1', '2017-02-10 15:39:24', 'index');
INSERT INTO `ke_user_log` VALUES ('3539', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-10 15:39:25', 'add');
INSERT INTO `ke_user_log` VALUES ('3540', '5', '/admin/knentry/findRelaFile', '0:0:0:0:0:0:0:1', '2017-02-10 15:39:36', 'findRelaFile');
INSERT INTO `ke_user_log` VALUES ('3541', '5', '/admin/knentry/findRelaForm', '0:0:0:0:0:0:0:1', '2017-02-10 15:39:36', 'findRelaForm');
INSERT INTO `ke_user_log` VALUES ('3542', '5', '/admin/knentry/findRelaMole', '0:0:0:0:0:0:0:1', '2017-02-10 15:39:36', 'findRelaMole');
INSERT INTO `ke_user_log` VALUES ('3543', '5', '/admin/knentry/findRelaFile', '0:0:0:0:0:0:0:1', '2017-02-10 15:39:37', 'findRelaFile');
INSERT INTO `ke_user_log` VALUES ('3544', '5', '/admin/knentry/findRelaForm', '0:0:0:0:0:0:0:1', '2017-02-10 15:39:39', 'findRelaForm');
INSERT INTO `ke_user_log` VALUES ('3545', '5', '/admin/knentry/findRelaMole', '0:0:0:0:0:0:0:1', '2017-02-10 15:39:44', 'findRelaMole');
INSERT INTO `ke_user_log` VALUES ('3546', '5', '/admin/knentry/findRelaFile', '0:0:0:0:0:0:0:1', '2017-02-10 15:39:57', 'findRelaFile');
INSERT INTO `ke_user_log` VALUES ('3547', '5', '/admin/knentry/findRelaFile', '0:0:0:0:0:0:0:1', '2017-02-10 15:40:03', 'findRelaFile');
INSERT INTO `ke_user_log` VALUES ('3548', '5', '/admin/knentry/findRelaFile', '0:0:0:0:0:0:0:1', '2017-02-10 15:40:41', 'findRelaFile');
INSERT INTO `ke_user_log` VALUES ('3549', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-10 15:40:45', 'add');
INSERT INTO `ke_user_log` VALUES ('3550', '5', '/admin/knentry/findRelaFile', '0:0:0:0:0:0:0:1', '2017-02-10 15:40:50', 'findRelaFile');
INSERT INTO `ke_user_log` VALUES ('3551', '5', '/admin/knentry/findRelaForm', '0:0:0:0:0:0:0:1', '2017-02-10 15:40:50', 'findRelaForm');
INSERT INTO `ke_user_log` VALUES ('3552', '5', '/admin/knentry/findRelaMole', '0:0:0:0:0:0:0:1', '2017-02-10 15:40:50', 'findRelaMole');
INSERT INTO `ke_user_log` VALUES ('3553', '5', '/admin/knentry/findRelaFile', '0:0:0:0:0:0:0:1', '2017-02-10 15:40:50', 'findRelaFile');
INSERT INTO `ke_user_log` VALUES ('3554', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-10 15:41:05', 'add');
INSERT INTO `ke_user_log` VALUES ('3555', '5', '/admin/knentry/findRelaMole', '0:0:0:0:0:0:0:1', '2017-02-10 15:41:08', 'findRelaMole');
INSERT INTO `ke_user_log` VALUES ('3556', '5', '/admin/knentry/findRelaFile', '0:0:0:0:0:0:0:1', '2017-02-10 15:41:08', 'findRelaFile');
INSERT INTO `ke_user_log` VALUES ('3557', '5', '/admin/knentry/findRelaForm', '0:0:0:0:0:0:0:1', '2017-02-10 15:41:08', 'findRelaForm');
INSERT INTO `ke_user_log` VALUES ('3558', '5', '/admin/knentry/findRelaFile', '0:0:0:0:0:0:0:1', '2017-02-10 15:41:08', 'findRelaFile');
INSERT INTO `ke_user_log` VALUES ('3559', '5', '/admin/knentry/findRelaFile', '0:0:0:0:0:0:0:1', '2017-02-10 15:41:13', 'findRelaFile');
INSERT INTO `ke_user_log` VALUES ('3560', '5', '/admin/knentry/findRelaFile', '0:0:0:0:0:0:0:1', '2017-02-10 15:41:22', 'findRelaFile');
INSERT INTO `ke_user_log` VALUES ('3561', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-10 15:41:29', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3562', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-10 15:41:29', 'add');
INSERT INTO `ke_user_log` VALUES ('3563', '5', '/admin/knentry/findRelaFile', '0:0:0:0:0:0:0:1', '2017-02-10 15:41:30', 'findRelaFile');
INSERT INTO `ke_user_log` VALUES ('3564', '5', '/admin/knentry/findRelaFile', '0:0:0:0:0:0:0:1', '2017-02-10 15:41:34', 'findRelaFile');
INSERT INTO `ke_user_log` VALUES ('3565', '5', '/admin/knentry/findRelaForm', '0:0:0:0:0:0:0:1', '2017-02-10 15:42:08', 'findRelaForm');
INSERT INTO `ke_user_log` VALUES ('3566', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-10 19:22:27', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3567', '5', '/admin', '0:0:0:0:0:0:0:1', '2017-02-10 19:22:29', 'index');
INSERT INTO `ke_user_log` VALUES ('3568', '5', '/admin/knentry', '0:0:0:0:0:0:0:1', '2017-02-10 19:22:30', 'index');
INSERT INTO `ke_user_log` VALUES ('3569', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-10 19:22:32', 'add');
INSERT INTO `ke_user_log` VALUES ('3570', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-10 19:22:43', 'add');
INSERT INTO `ke_user_log` VALUES ('3571', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-10 19:23:00', 'add');
INSERT INTO `ke_user_log` VALUES ('3572', '5', '/admin/knentry/findRelaFile', '0:0:0:0:0:0:0:1', '2017-02-10 19:23:02', 'findRelaFile');
INSERT INTO `ke_user_log` VALUES ('3573', '5', '/admin/knentry/findRelaForm', '0:0:0:0:0:0:0:1', '2017-02-10 19:23:05', 'findRelaForm');
INSERT INTO `ke_user_log` VALUES ('3574', '5', '/admin/knentry/findRelaMole', '0:0:0:0:0:0:0:1', '2017-02-10 19:23:11', 'findRelaMole');
INSERT INTO `ke_user_log` VALUES ('3575', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-10 19:23:31', 'add');
INSERT INTO `ke_user_log` VALUES ('3576', '5', '/admin/knentry/findRelaFile', '0:0:0:0:0:0:0:1', '2017-02-10 19:23:32', 'findRelaFile');
INSERT INTO `ke_user_log` VALUES ('3577', '5', '/admin/knentry/findRelaForm', '0:0:0:0:0:0:0:1', '2017-02-10 19:23:35', 'findRelaForm');
INSERT INTO `ke_user_log` VALUES ('3578', '5', '/admin/knentry/findRelaMole', '0:0:0:0:0:0:0:1', '2017-02-10 19:23:47', 'findRelaMole');
INSERT INTO `ke_user_log` VALUES ('3579', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-10 19:24:48', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3580', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-10 19:24:48', 'add');
INSERT INTO `ke_user_log` VALUES ('3581', '5', '/admin/knentry/findRelaFile', '0:0:0:0:0:0:0:1', '2017-02-10 19:24:50', 'findRelaFile');
INSERT INTO `ke_user_log` VALUES ('3582', '5', '/admin/knentry/findRelaForm', '0:0:0:0:0:0:0:1', '2017-02-10 19:24:53', 'findRelaForm');
INSERT INTO `ke_user_log` VALUES ('3583', '5', '/admin/knentry/findRelaMole', '0:0:0:0:0:0:0:1', '2017-02-10 19:24:58', 'findRelaMole');
INSERT INTO `ke_user_log` VALUES ('3584', '5', '/admin/knentry/findRelaFile', '0:0:0:0:0:0:0:1', '2017-02-10 19:25:14', 'findRelaFile');
INSERT INTO `ke_user_log` VALUES ('3585', '5', '/admin/knentry/findRelaForm', '0:0:0:0:0:0:0:1', '2017-02-10 19:25:18', 'findRelaForm');
INSERT INTO `ke_user_log` VALUES ('3586', '5', '/admin/knentry/findRelaMole', '0:0:0:0:0:0:0:1', '2017-02-10 19:25:21', 'findRelaMole');
INSERT INTO `ke_user_log` VALUES ('3587', '5', '/admin/knentry/findRelaFile', '0:0:0:0:0:0:0:1', '2017-02-10 19:26:45', 'findRelaFile');
INSERT INTO `ke_user_log` VALUES ('3588', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-10 19:26:51', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3589', '5', '/admin/knentry/findRelaFile', '0:0:0:0:0:0:0:1', '2017-02-10 19:26:51', 'findRelaFile');
INSERT INTO `ke_user_log` VALUES ('3590', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-10 19:29:09', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3591', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-10 19:29:09', 'add');
INSERT INTO `ke_user_log` VALUES ('3592', '5', '/admin/knentry/findRelaFile', '0:0:0:0:0:0:0:1', '2017-02-10 19:29:11', 'findRelaFile');
INSERT INTO `ke_user_log` VALUES ('3593', '5', '/admin/knentry/findRelaForm', '0:0:0:0:0:0:0:1', '2017-02-10 19:29:26', 'findRelaForm');
INSERT INTO `ke_user_log` VALUES ('3594', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-10 19:29:51', 'add');
INSERT INTO `ke_user_log` VALUES ('3595', '5', '/admin/knentry/findRelaFile', '0:0:0:0:0:0:0:1', '2017-02-10 19:29:53', 'findRelaFile');
INSERT INTO `ke_user_log` VALUES ('3596', '5', '/admin/knentry/findRelaForm', '0:0:0:0:0:0:0:1', '2017-02-10 19:29:57', 'findRelaForm');
INSERT INTO `ke_user_log` VALUES ('3597', '5', '/admin/knentry/findRelaMole', '0:0:0:0:0:0:0:1', '2017-02-10 19:30:00', 'findRelaMole');
INSERT INTO `ke_user_log` VALUES ('3598', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-10 19:31:26', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3599', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-10 19:31:26', 'add');
INSERT INTO `ke_user_log` VALUES ('3600', '5', '/admin/knentry/findRelaFile', '0:0:0:0:0:0:0:1', '2017-02-10 19:31:28', 'findRelaFile');
INSERT INTO `ke_user_log` VALUES ('3601', '5', '/admin/knentry/findRelaFile', '0:0:0:0:0:0:0:1', '2017-02-10 19:31:34', 'findRelaFile');
INSERT INTO `ke_user_log` VALUES ('3602', '5', '/admin/knentry/findRelaForm', '0:0:0:0:0:0:0:1', '2017-02-10 19:31:38', 'findRelaForm');
INSERT INTO `ke_user_log` VALUES ('3603', '5', '/admin/knentry/findRelaForm', '0:0:0:0:0:0:0:1', '2017-02-10 19:31:41', 'findRelaForm');
INSERT INTO `ke_user_log` VALUES ('3604', '5', '/admin/knentry/findRelaMole', '0:0:0:0:0:0:0:1', '2017-02-10 19:31:45', 'findRelaMole');
INSERT INTO `ke_user_log` VALUES ('3605', '5', '/admin/knentry/findRelaMole', '0:0:0:0:0:0:0:1', '2017-02-10 19:31:47', 'findRelaMole');
INSERT INTO `ke_user_log` VALUES ('3606', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-10 19:35:53', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3607', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-10 19:35:53', 'add');
INSERT INTO `ke_user_log` VALUES ('3608', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-10 19:37:19', 'add');
INSERT INTO `ke_user_log` VALUES ('3609', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-10 19:38:41', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3610', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-10 19:38:41', 'add');
INSERT INTO `ke_user_log` VALUES ('3611', '5', '/admin/knentry/findRelaFile', '0:0:0:0:0:0:0:1', '2017-02-10 19:38:43', 'findRelaFile');
INSERT INTO `ke_user_log` VALUES ('3612', '5', '/admin/knentry/findRelaForm', '0:0:0:0:0:0:0:1', '2017-02-10 19:38:45', 'findRelaForm');
INSERT INTO `ke_user_log` VALUES ('3613', '5', '/admin/knentry/findRelaMole', '0:0:0:0:0:0:0:1', '2017-02-10 19:38:49', 'findRelaMole');
INSERT INTO `ke_user_log` VALUES ('3614', '5', '/admin/knentry/findRelaFile', '0:0:0:0:0:0:0:1', '2017-02-10 19:39:52', 'findRelaFile');
INSERT INTO `ke_user_log` VALUES ('3615', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-10 19:40:46', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3616', '5', '/admin/knentry/findRelaForm', '0:0:0:0:0:0:0:1', '2017-02-10 19:40:46', 'findRelaForm');
INSERT INTO `ke_user_log` VALUES ('3617', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-10 19:43:14', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3618', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-10 19:43:14', 'add');
INSERT INTO `ke_user_log` VALUES ('3619', '5', '/admin/knentry/findRelaForm', '0:0:0:0:0:0:0:1', '2017-02-10 19:43:16', 'findRelaForm');
INSERT INTO `ke_user_log` VALUES ('3620', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-10 19:43:55', 'add');
INSERT INTO `ke_user_log` VALUES ('3621', '5', '/admin/knentry/findRelaForm', '0:0:0:0:0:0:0:1', '2017-02-10 19:43:56', 'findRelaForm');
INSERT INTO `ke_user_log` VALUES ('3622', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-10 19:44:14', 'add');
INSERT INTO `ke_user_log` VALUES ('3623', '5', '/admin/knentry/findRelaFile', '0:0:0:0:0:0:0:1', '2017-02-10 19:44:15', 'findRelaFile');
INSERT INTO `ke_user_log` VALUES ('3624', '5', '/admin/knentry/findRelaForm', '0:0:0:0:0:0:0:1', '2017-02-10 19:44:19', 'findRelaForm');
INSERT INTO `ke_user_log` VALUES ('3625', '5', '/admin/knentry/findRelaMole', '0:0:0:0:0:0:0:1', '2017-02-10 19:44:21', 'findRelaMole');
INSERT INTO `ke_user_log` VALUES ('3626', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-10 19:47:34', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3627', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-10 19:47:34', 'add');
INSERT INTO `ke_user_log` VALUES ('3628', '5', '/admin/knentry/findRelaForm', '0:0:0:0:0:0:0:1', '2017-02-10 19:47:35', 'findRelaForm');
INSERT INTO `ke_user_log` VALUES ('3629', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-10 19:48:06', 'add');
INSERT INTO `ke_user_log` VALUES ('3630', '5', '/admin/knentry/findRelaForm', '0:0:0:0:0:0:0:1', '2017-02-10 19:48:07', 'findRelaForm');
INSERT INTO `ke_user_log` VALUES ('3631', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-10 19:49:07', 'add');
INSERT INTO `ke_user_log` VALUES ('3632', '5', '/admin/knentry/findRelaForm', '0:0:0:0:0:0:0:1', '2017-02-10 19:49:10', 'findRelaForm');
INSERT INTO `ke_user_log` VALUES ('3633', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-10 19:51:56', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3634', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-10 19:51:56', 'add');
INSERT INTO `ke_user_log` VALUES ('3635', '5', '/admin/knentry/findRelaForm', '0:0:0:0:0:0:0:1', '2017-02-10 19:51:57', 'findRelaForm');
INSERT INTO `ke_user_log` VALUES ('3636', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-10 19:52:09', 'add');
INSERT INTO `ke_user_log` VALUES ('3637', '5', '/admin/knentry/findRelaForm', '0:0:0:0:0:0:0:1', '2017-02-10 19:52:11', 'findRelaForm');
INSERT INTO `ke_user_log` VALUES ('3638', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-10 19:52:43', 'add');
INSERT INTO `ke_user_log` VALUES ('3639', '5', '/admin/knentry/findRelaForm', '0:0:0:0:0:0:0:1', '2017-02-10 19:52:44', 'findRelaForm');
INSERT INTO `ke_user_log` VALUES ('3640', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-10 19:53:22', 'add');
INSERT INTO `ke_user_log` VALUES ('3641', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-10 19:53:23', 'add');
INSERT INTO `ke_user_log` VALUES ('3642', '5', '/admin/knentry/findRelaForm', '0:0:0:0:0:0:0:1', '2017-02-10 19:53:25', 'findRelaForm');
INSERT INTO `ke_user_log` VALUES ('3643', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-10 19:58:30', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3644', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-10 19:58:30', 'add');
INSERT INTO `ke_user_log` VALUES ('3645', '5', '/admin/knentry/findRelaForm', '0:0:0:0:0:0:0:1', '2017-02-10 19:58:31', 'findRelaForm');
INSERT INTO `ke_user_log` VALUES ('3646', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-10 19:58:53', 'add');
INSERT INTO `ke_user_log` VALUES ('3647', '5', '/admin/knentry/findRelaForm', '0:0:0:0:0:0:0:1', '2017-02-10 19:58:55', 'findRelaForm');
INSERT INTO `ke_user_log` VALUES ('3648', '5', '/admin/knentry/findRelaForm', '0:0:0:0:0:0:0:1', '2017-02-10 19:58:58', 'findRelaForm');
INSERT INTO `ke_user_log` VALUES ('3649', '5', '/admin/knentry/findRelaForm', '0:0:0:0:0:0:0:1', '2017-02-10 19:59:00', 'findRelaForm');
INSERT INTO `ke_user_log` VALUES ('3650', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-10 19:59:07', 'add');
INSERT INTO `ke_user_log` VALUES ('3651', '5', '/admin/knentry/findRelaForm', '0:0:0:0:0:0:0:1', '2017-02-10 19:59:09', 'findRelaForm');
INSERT INTO `ke_user_log` VALUES ('3652', '5', '/admin/knentry/findRelaForm', '0:0:0:0:0:0:0:1', '2017-02-10 19:59:10', 'findRelaForm');
INSERT INTO `ke_user_log` VALUES ('3653', '5', '/admin/knentry/findRelaForm', '0:0:0:0:0:0:0:1', '2017-02-10 19:59:12', 'findRelaForm');
INSERT INTO `ke_user_log` VALUES ('3654', '5', '/admin/knentry/findRelaForm', '0:0:0:0:0:0:0:1', '2017-02-10 19:59:13', 'findRelaForm');
INSERT INTO `ke_user_log` VALUES ('3655', '5', '/admin/knentry/findRelaForm', '0:0:0:0:0:0:0:1', '2017-02-10 19:59:14', 'findRelaForm');
INSERT INTO `ke_user_log` VALUES ('3656', '5', '/admin/knentry/findRelaForm', '0:0:0:0:0:0:0:1', '2017-02-10 19:59:15', 'findRelaForm');
INSERT INTO `ke_user_log` VALUES ('3657', '5', '/admin/knentry/findRelaForm', '0:0:0:0:0:0:0:1', '2017-02-10 19:59:19', 'findRelaForm');
INSERT INTO `ke_user_log` VALUES ('3658', '5', '/admin/knentry/findRelaForm', '0:0:0:0:0:0:0:1', '2017-02-10 19:59:21', 'findRelaForm');
INSERT INTO `ke_user_log` VALUES ('3659', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-10 19:59:45', 'add');
INSERT INTO `ke_user_log` VALUES ('3660', '5', '/admin/knentry/findRelaForm', '0:0:0:0:0:0:0:1', '2017-02-10 19:59:47', 'findRelaForm');
INSERT INTO `ke_user_log` VALUES ('3661', '5', '/admin/knentry/findRelaForm', '0:0:0:0:0:0:0:1', '2017-02-10 19:59:48', 'findRelaForm');
INSERT INTO `ke_user_log` VALUES ('3662', '5', '/admin/knentry/findRelaForm', '0:0:0:0:0:0:0:1', '2017-02-10 19:59:50', 'findRelaForm');
INSERT INTO `ke_user_log` VALUES ('3663', '5', '/admin/knentry/findRelaForm', '0:0:0:0:0:0:0:1', '2017-02-10 19:59:50', 'findRelaForm');
INSERT INTO `ke_user_log` VALUES ('3664', '5', '/admin/knentry/findRelaForm', '0:0:0:0:0:0:0:1', '2017-02-10 19:59:51', 'findRelaForm');
INSERT INTO `ke_user_log` VALUES ('3665', '5', '/admin/knentry/findRelaForm', '0:0:0:0:0:0:0:1', '2017-02-10 19:59:51', 'findRelaForm');
INSERT INTO `ke_user_log` VALUES ('3666', '5', '/admin/knentry/findRelaForm', '0:0:0:0:0:0:0:1', '2017-02-10 19:59:51', 'findRelaForm');
INSERT INTO `ke_user_log` VALUES ('3667', '5', '/admin/knentry/findRelaForm', '0:0:0:0:0:0:0:1', '2017-02-10 19:59:51', 'findRelaForm');
INSERT INTO `ke_user_log` VALUES ('3668', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-10 20:00:03', 'add');
INSERT INTO `ke_user_log` VALUES ('3669', '5', '/admin/knentry/findRelaForm', '0:0:0:0:0:0:0:1', '2017-02-10 20:00:04', 'findRelaForm');
INSERT INTO `ke_user_log` VALUES ('3670', '5', '/admin/knentry/findRelaForm', '0:0:0:0:0:0:0:1', '2017-02-10 20:00:05', 'findRelaForm');
INSERT INTO `ke_user_log` VALUES ('3671', '5', '/admin/knentry/findRelaForm', '0:0:0:0:0:0:0:1', '2017-02-10 20:00:06', 'findRelaForm');
INSERT INTO `ke_user_log` VALUES ('3672', '5', '/admin/knentry/findRelaForm', '0:0:0:0:0:0:0:1', '2017-02-10 20:00:06', 'findRelaForm');
INSERT INTO `ke_user_log` VALUES ('3673', '5', '/admin/knentry/findRelaForm', '0:0:0:0:0:0:0:1', '2017-02-10 20:00:06', 'findRelaForm');
INSERT INTO `ke_user_log` VALUES ('3674', '5', '/admin/knentry/findRelaForm', '0:0:0:0:0:0:0:1', '2017-02-10 20:00:06', 'findRelaForm');
INSERT INTO `ke_user_log` VALUES ('3675', '5', '/admin/knentry/findRelaForm', '0:0:0:0:0:0:0:1', '2017-02-10 20:00:07', 'findRelaForm');
INSERT INTO `ke_user_log` VALUES ('3676', '5', '/admin/knentry/findRelaForm', '0:0:0:0:0:0:0:1', '2017-02-10 20:00:07', 'findRelaForm');
INSERT INTO `ke_user_log` VALUES ('3677', '5', '/admin/knentry/findRelaForm', '0:0:0:0:0:0:0:1', '2017-02-10 20:00:09', 'findRelaForm');
INSERT INTO `ke_user_log` VALUES ('3678', '5', '/admin/knentry/findRelaForm', '0:0:0:0:0:0:0:1', '2017-02-10 20:00:12', 'findRelaForm');
INSERT INTO `ke_user_log` VALUES ('3679', '5', '/admin/knentry/findRelaForm', '0:0:0:0:0:0:0:1', '2017-02-10 20:00:13', 'findRelaForm');
INSERT INTO `ke_user_log` VALUES ('3680', '5', '/admin/knentry/findRelaForm', '0:0:0:0:0:0:0:1', '2017-02-10 20:00:13', 'findRelaForm');
INSERT INTO `ke_user_log` VALUES ('3681', '5', '/admin/knentry/findRelaForm', '0:0:0:0:0:0:0:1', '2017-02-10 20:00:14', 'findRelaForm');
INSERT INTO `ke_user_log` VALUES ('3682', '5', '/admin/knentry/findRelaForm', '0:0:0:0:0:0:0:1', '2017-02-10 20:00:14', 'findRelaForm');
INSERT INTO `ke_user_log` VALUES ('3683', '5', '/admin/knentry/findRelaForm', '0:0:0:0:0:0:0:1', '2017-02-10 20:00:15', 'findRelaForm');
INSERT INTO `ke_user_log` VALUES ('3684', '5', '/admin/knentry/findRelaForm', '0:0:0:0:0:0:0:1', '2017-02-10 20:00:15', 'findRelaForm');
INSERT INTO `ke_user_log` VALUES ('3685', '5', '/admin/knentry/findRelaForm', '0:0:0:0:0:0:0:1', '2017-02-10 20:00:16', 'findRelaForm');
INSERT INTO `ke_user_log` VALUES ('3686', '5', '/admin/knentry/findRelaForm', '0:0:0:0:0:0:0:1', '2017-02-10 20:00:16', 'findRelaForm');
INSERT INTO `ke_user_log` VALUES ('3687', '5', '/admin/knentry/findRelaForm', '0:0:0:0:0:0:0:1', '2017-02-10 20:00:17', 'findRelaForm');
INSERT INTO `ke_user_log` VALUES ('3688', '5', '/admin/knentry/findRelaForm', '0:0:0:0:0:0:0:1', '2017-02-10 20:00:17', 'findRelaForm');
INSERT INTO `ke_user_log` VALUES ('3689', '5', '/admin/knentry/findRelaForm', '0:0:0:0:0:0:0:1', '2017-02-10 20:00:17', 'findRelaForm');
INSERT INTO `ke_user_log` VALUES ('3690', '5', '/admin/knentry/findRelaForm', '0:0:0:0:0:0:0:1', '2017-02-10 20:00:18', 'findRelaForm');
INSERT INTO `ke_user_log` VALUES ('3691', '5', '/admin/knentry/findRelaForm', '0:0:0:0:0:0:0:1', '2017-02-10 20:00:18', 'findRelaForm');
INSERT INTO `ke_user_log` VALUES ('3692', '5', '/admin/knentry/findRelaForm', '0:0:0:0:0:0:0:1', '2017-02-10 20:00:18', 'findRelaForm');
INSERT INTO `ke_user_log` VALUES ('3693', '5', '/admin/knentry/findRelaForm', '0:0:0:0:0:0:0:1', '2017-02-10 20:00:18', 'findRelaForm');
INSERT INTO `ke_user_log` VALUES ('3694', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-10 20:00:40', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3695', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-10 20:00:40', 'add');
INSERT INTO `ke_user_log` VALUES ('3696', '5', '/admin/knentry/findRelaForm', '0:0:0:0:0:0:0:1', '2017-02-10 20:00:42', 'findRelaForm');
INSERT INTO `ke_user_log` VALUES ('3697', '5', '/admin/knentry/findRelaForm', '0:0:0:0:0:0:0:1', '2017-02-10 20:00:44', 'findRelaForm');
INSERT INTO `ke_user_log` VALUES ('3698', '5', '/admin/knentry/findRelaForm', '0:0:0:0:0:0:0:1', '2017-02-10 20:00:45', 'findRelaForm');
INSERT INTO `ke_user_log` VALUES ('3699', '5', '/admin/knentry/findRelaForm', '0:0:0:0:0:0:0:1', '2017-02-10 20:00:46', 'findRelaForm');
INSERT INTO `ke_user_log` VALUES ('3700', '5', '/admin/knentry/findRelaForm', '0:0:0:0:0:0:0:1', '2017-02-10 20:00:47', 'findRelaForm');
INSERT INTO `ke_user_log` VALUES ('3701', '5', '/admin/knentry/findRelaForm', '0:0:0:0:0:0:0:1', '2017-02-10 20:00:56', 'findRelaForm');
INSERT INTO `ke_user_log` VALUES ('3702', '5', '/admin/knentry/findRelaForm', '0:0:0:0:0:0:0:1', '2017-02-10 20:01:02', 'findRelaForm');
INSERT INTO `ke_user_log` VALUES ('3703', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-10 20:14:46', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3704', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-10 20:14:46', 'add');
INSERT INTO `ke_user_log` VALUES ('3705', '5', '/admin/knentry/findRelaForm', '0:0:0:0:0:0:0:1', '2017-02-10 20:14:48', 'findRelaForm');
INSERT INTO `ke_user_log` VALUES ('3706', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-10 20:18:13', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3707', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-10 20:18:14', 'add');
INSERT INTO `ke_user_log` VALUES ('3708', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-10 20:19:30', 'add');
INSERT INTO `ke_user_log` VALUES ('3709', '5', '/admin/knentry/findRelaForm', '0:0:0:0:0:0:0:1', '2017-02-10 20:19:32', 'findRelaForm');
INSERT INTO `ke_user_log` VALUES ('3710', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-10 20:20:14', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3711', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-10 20:20:14', 'add');
INSERT INTO `ke_user_log` VALUES ('3712', '5', '/admin/knentry/findRelaForm', '0:0:0:0:0:0:0:1', '2017-02-10 20:20:16', 'findRelaForm');
INSERT INTO `ke_user_log` VALUES ('3713', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-10 20:20:44', 'add');
INSERT INTO `ke_user_log` VALUES ('3714', '5', '/admin/knentry/findRelaForm', '0:0:0:0:0:0:0:1', '2017-02-10 20:20:46', 'findRelaForm');
INSERT INTO `ke_user_log` VALUES ('3715', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-10 20:24:45', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3716', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-10 20:24:45', 'add');
INSERT INTO `ke_user_log` VALUES ('3717', '5', '/admin/knentry/findRelaForm', '0:0:0:0:0:0:0:1', '2017-02-10 20:24:47', 'findRelaForm');
INSERT INTO `ke_user_log` VALUES ('3718', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-10 20:26:30', 'add');
INSERT INTO `ke_user_log` VALUES ('3719', '5', '/admin/knentry/findRelaForm', '0:0:0:0:0:0:0:1', '2017-02-10 20:26:31', 'findRelaForm');
INSERT INTO `ke_user_log` VALUES ('3720', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-10 20:27:45', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3721', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-10 20:27:45', 'add');
INSERT INTO `ke_user_log` VALUES ('3722', '5', '/admin/knentry/findRelaForm', '0:0:0:0:0:0:0:1', '2017-02-10 20:27:46', 'findRelaForm');
INSERT INTO `ke_user_log` VALUES ('3723', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-10 20:37:00', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3724', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-10 20:37:00', 'add');
INSERT INTO `ke_user_log` VALUES ('3725', '5', '/admin/knentry/findRelaForm', '0:0:0:0:0:0:0:1', '2017-02-10 20:37:02', 'findRelaForm');
INSERT INTO `ke_user_log` VALUES ('3726', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-10 20:37:20', 'add');
INSERT INTO `ke_user_log` VALUES ('3727', '5', '/admin/knentry/findRelaForm', '0:0:0:0:0:0:0:1', '2017-02-10 20:37:22', 'findRelaForm');
INSERT INTO `ke_user_log` VALUES ('3728', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-10 20:37:32', 'add');
INSERT INTO `ke_user_log` VALUES ('3729', '5', '/admin/knentry/findRelaForm', '0:0:0:0:0:0:0:1', '2017-02-10 20:37:34', 'findRelaForm');
INSERT INTO `ke_user_log` VALUES ('3730', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-10 20:38:45', 'add');
INSERT INTO `ke_user_log` VALUES ('3731', '5', '/admin/knentry/findRelaFile', '0:0:0:0:0:0:0:1', '2017-02-10 20:38:46', 'findRelaFile');
INSERT INTO `ke_user_log` VALUES ('3732', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-10 20:49:58', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3733', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-10 20:49:58', 'add');
INSERT INTO `ke_user_log` VALUES ('3734', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-10 20:50:15', 'add');
INSERT INTO `ke_user_log` VALUES ('3735', '5', '/admin/knentry/findRelaFile', '0:0:0:0:0:0:0:1', '2017-02-10 20:50:17', 'findRelaFile');
INSERT INTO `ke_user_log` VALUES ('3736', '5', '/admin/knentry/findRelaForm', '0:0:0:0:0:0:0:1', '2017-02-10 20:50:51', 'findRelaForm');
INSERT INTO `ke_user_log` VALUES ('3737', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-10 20:51:16', 'add');
INSERT INTO `ke_user_log` VALUES ('3738', '5', '/admin/knentry/findRelaFile', '0:0:0:0:0:0:0:1', '2017-02-10 20:51:18', 'findRelaFile');
INSERT INTO `ke_user_log` VALUES ('3739', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-10 20:51:41', 'add');
INSERT INTO `ke_user_log` VALUES ('3740', '5', '/admin/knentry/findRelaFile', '0:0:0:0:0:0:0:1', '2017-02-10 20:51:42', 'findRelaFile');
INSERT INTO `ke_user_log` VALUES ('3741', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-10 20:52:09', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3742', '5', '/admin/knentry/findRelaFile', '0:0:0:0:0:0:0:1', '2017-02-10 20:52:09', 'findRelaFile');
INSERT INTO `ke_user_log` VALUES ('3743', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-10 20:52:30', 'add');
INSERT INTO `ke_user_log` VALUES ('3744', '5', '/admin/knentry/findRelaForm', '0:0:0:0:0:0:0:1', '2017-02-10 20:52:31', 'findRelaForm');
INSERT INTO `ke_user_log` VALUES ('3745', '5', '/admin/knentry/findRelaForm', '0:0:0:0:0:0:0:1', '2017-02-10 20:52:51', 'findRelaForm');
INSERT INTO `ke_user_log` VALUES ('3746', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-10 20:53:22', 'add');
INSERT INTO `ke_user_log` VALUES ('3747', '5', '/admin/knentry/findRelaForm', '0:0:0:0:0:0:0:1', '2017-02-10 20:53:24', 'findRelaForm');
INSERT INTO `ke_user_log` VALUES ('3748', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-10 20:53:51', 'add');
INSERT INTO `ke_user_log` VALUES ('3749', '5', '/admin/knentry/findRelaForm', '0:0:0:0:0:0:0:1', '2017-02-10 20:53:53', 'findRelaForm');
INSERT INTO `ke_user_log` VALUES ('3750', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-10 20:54:51', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3751', '5', '/admin/knentry/findRelaFile', '0:0:0:0:0:0:0:1', '2017-02-10 20:54:51', 'findRelaFile');
INSERT INTO `ke_user_log` VALUES ('3752', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-10 20:55:25', 'add');
INSERT INTO `ke_user_log` VALUES ('3753', '5', '/admin/knentry/findRelaFile', '0:0:0:0:0:0:0:1', '2017-02-10 20:55:27', 'findRelaFile');
INSERT INTO `ke_user_log` VALUES ('3754', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-10 20:56:43', 'add');
INSERT INTO `ke_user_log` VALUES ('3755', '5', '/admin/knentry/findRelaFile', '0:0:0:0:0:0:0:1', '2017-02-10 20:56:44', 'findRelaFile');
INSERT INTO `ke_user_log` VALUES ('3756', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-10 20:57:23', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3757', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-10 20:57:23', 'add');
INSERT INTO `ke_user_log` VALUES ('3758', '5', '/admin/knentry/findRelaFile', '0:0:0:0:0:0:0:1', '2017-02-10 20:57:25', 'findRelaFile');
INSERT INTO `ke_user_log` VALUES ('3759', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-10 20:59:14', 'add');
INSERT INTO `ke_user_log` VALUES ('3760', '5', '/admin/knentry/findRelaFile', '0:0:0:0:0:0:0:1', '2017-02-10 20:59:15', 'findRelaFile');
INSERT INTO `ke_user_log` VALUES ('3761', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-10 20:59:33', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3762', '5', '/admin/knentry/findRelaForm', '0:0:0:0:0:0:0:1', '2017-02-10 20:59:33', 'findRelaForm');
INSERT INTO `ke_user_log` VALUES ('3763', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-10 20:59:40', 'add');
INSERT INTO `ke_user_log` VALUES ('3764', '5', '/admin/knentry/findRelaFile', '0:0:0:0:0:0:0:1', '2017-02-10 20:59:42', 'findRelaFile');
INSERT INTO `ke_user_log` VALUES ('3765', '5', '/admin/knentry/findRelaForm', '0:0:0:0:0:0:0:1', '2017-02-10 20:59:46', 'findRelaForm');
INSERT INTO `ke_user_log` VALUES ('3766', '5', '/admin/knentry/findRelaForm', '0:0:0:0:0:0:0:1', '2017-02-10 20:59:49', 'findRelaForm');
INSERT INTO `ke_user_log` VALUES ('3767', '5', '/admin/knentry/findRelaMole', '0:0:0:0:0:0:0:1', '2017-02-10 20:59:54', 'findRelaMole');
INSERT INTO `ke_user_log` VALUES ('3768', '5', '/admin/knentry/save', '0:0:0:0:0:0:0:1', '2017-02-10 21:00:35', 'save');
INSERT INTO `ke_user_log` VALUES ('3769', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-10 21:02:02', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3770', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-10 21:02:02', 'add');
INSERT INTO `ke_user_log` VALUES ('3771', '5', '/admin/knentry/findRelaFile', '0:0:0:0:0:0:0:1', '2017-02-10 21:02:04', 'findRelaFile');
INSERT INTO `ke_user_log` VALUES ('3772', '5', '/admin/knentry/findRelaForm', '0:0:0:0:0:0:0:1', '2017-02-10 21:02:08', 'findRelaForm');
INSERT INTO `ke_user_log` VALUES ('3773', '5', '/admin/knentry/findRelaMole', '0:0:0:0:0:0:0:1', '2017-02-10 21:02:11', 'findRelaMole');
INSERT INTO `ke_user_log` VALUES ('3774', '5', '/admin/knentry/save', '0:0:0:0:0:0:0:1', '2017-02-10 21:02:15', 'save');
INSERT INTO `ke_user_log` VALUES ('3775', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-10 21:02:48', 'add');
INSERT INTO `ke_user_log` VALUES ('3776', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-11 11:30:10', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3777', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-11 11:33:18', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3778', '5', '/admin', '0:0:0:0:0:0:0:1', '2017-02-11 11:33:18', 'index');
INSERT INTO `ke_user_log` VALUES ('3779', '5', '/admin/knentry', '0:0:0:0:0:0:0:1', '2017-02-11 11:33:20', 'index');
INSERT INTO `ke_user_log` VALUES ('3780', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-11 11:33:21', 'add');
INSERT INTO `ke_user_log` VALUES ('3781', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-11 11:39:48', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3782', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-11 11:39:48', 'add');
INSERT INTO `ke_user_log` VALUES ('3783', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-11 11:40:40', 'add');
INSERT INTO `ke_user_log` VALUES ('3784', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-11 11:40:57', 'add');
INSERT INTO `ke_user_log` VALUES ('3785', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-11 12:05:09', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3786', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-11 12:05:09', 'add');
INSERT INTO `ke_user_log` VALUES ('3787', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-11 12:06:17', 'add');
INSERT INTO `ke_user_log` VALUES ('3788', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-11 12:06:18', 'add');
INSERT INTO `ke_user_log` VALUES ('3789', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-11 12:09:09', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3790', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-11 12:09:09', 'add');
INSERT INTO `ke_user_log` VALUES ('3791', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-11 12:12:09', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3792', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-11 12:12:09', 'add');
INSERT INTO `ke_user_log` VALUES ('3793', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-11 12:12:35', 'add');
INSERT INTO `ke_user_log` VALUES ('3794', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-11 12:16:02', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3795', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-11 12:16:02', 'add');
INSERT INTO `ke_user_log` VALUES ('3796', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-11 12:16:24', 'add');
INSERT INTO `ke_user_log` VALUES ('3797', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-11 12:16:35', 'add');
INSERT INTO `ke_user_log` VALUES ('3798', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-11 13:00:12', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3799', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-11 13:00:12', 'add');
INSERT INTO `ke_user_log` VALUES ('3800', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-11 13:06:08', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3801', '5', '/admin/knentry/findRelaFile', '0:0:0:0:0:0:0:1', '2017-02-11 13:06:08', 'findRelaFile');
INSERT INTO `ke_user_log` VALUES ('3802', '5', '/admin/knentry/findRelaFile', '0:0:0:0:0:0:0:1', '2017-02-11 13:06:15', 'findRelaFile');
INSERT INTO `ke_user_log` VALUES ('3803', '5', '/admin/knentry/findRelaForm', '0:0:0:0:0:0:0:1', '2017-02-11 13:06:20', 'findRelaForm');
INSERT INTO `ke_user_log` VALUES ('3804', '5', '/admin/knentry/findRelaForm', '0:0:0:0:0:0:0:1', '2017-02-11 13:06:23', 'findRelaForm');
INSERT INTO `ke_user_log` VALUES ('3805', '5', '/admin/knentry/findRelaForm', '0:0:0:0:0:0:0:1', '2017-02-11 13:06:26', 'findRelaForm');
INSERT INTO `ke_user_log` VALUES ('3806', '5', '/admin/knentry/findRelaForm', '0:0:0:0:0:0:0:1', '2017-02-11 13:06:28', 'findRelaForm');
INSERT INTO `ke_user_log` VALUES ('3807', '5', '/admin/knentry/findRelaMole', '0:0:0:0:0:0:0:1', '2017-02-11 13:06:33', 'findRelaMole');
INSERT INTO `ke_user_log` VALUES ('3808', '5', '/admin/knentry/findRelaMole', '0:0:0:0:0:0:0:1', '2017-02-11 13:06:36', 'findRelaMole');
INSERT INTO `ke_user_log` VALUES ('3809', '5', '/admin/knentry/save', '0:0:0:0:0:0:0:1', '2017-02-11 13:06:47', 'save');
INSERT INTO `ke_user_log` VALUES ('3810', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-11 13:07:41', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3811', '5', '/admin/knentry/save', '0:0:0:0:0:0:0:1', '2017-02-11 13:07:42', 'save');
INSERT INTO `ke_user_log` VALUES ('3812', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-11 13:09:06', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3813', '5', '/admin/knentry/save', '0:0:0:0:0:0:0:1', '2017-02-11 13:09:06', 'save');
INSERT INTO `ke_user_log` VALUES ('3814', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-11 13:09:51', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3815', '5', '/admin/knentry/save', '0:0:0:0:0:0:0:1', '2017-02-11 13:09:51', 'save');
INSERT INTO `ke_user_log` VALUES ('3816', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-11 13:13:17', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3817', '5', '/admin/knentry/save', '0:0:0:0:0:0:0:1', '2017-02-11 13:13:17', 'save');
INSERT INTO `ke_user_log` VALUES ('3818', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-11 13:15:44', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3819', '5', '/admin/knentry/save', '0:0:0:0:0:0:0:1', '2017-02-11 13:15:44', 'save');
INSERT INTO `ke_user_log` VALUES ('3820', '5', '/admin/knentry/save', '0:0:0:0:0:0:0:1', '2017-02-11 13:15:59', 'save');
INSERT INTO `ke_user_log` VALUES ('3821', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-11 13:18:05', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3822', '5', '/admin/knentry/save', '0:0:0:0:0:0:0:1', '2017-02-11 13:18:05', 'save');
INSERT INTO `ke_user_log` VALUES ('3823', '5', '/admin/knentry', '0:0:0:0:0:0:0:1', '2017-02-11 13:18:08', 'index');
INSERT INTO `ke_user_log` VALUES ('3824', '5', '/admin/knentry', '0:0:0:0:0:0:0:1', '2017-02-11 13:18:12', 'index');
INSERT INTO `ke_user_log` VALUES ('3825', '5', '/admin/knentry', '0:0:0:0:0:0:0:1', '2017-02-11 13:18:22', 'index');
INSERT INTO `ke_user_log` VALUES ('3826', '5', '/admin/knentry', '0:0:0:0:0:0:0:1', '2017-02-11 13:20:02', 'index');
INSERT INTO `ke_user_log` VALUES ('3827', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-11 13:20:40', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3828', '5', '/admin/knentry/edit', '0:0:0:0:0:0:0:1', '2017-02-11 13:20:40', 'edit');
INSERT INTO `ke_user_log` VALUES ('3829', '5', '/admin/knentry', '0:0:0:0:0:0:0:1', '2017-02-11 13:20:53', 'index');
INSERT INTO `ke_user_log` VALUES ('3830', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-11 13:20:56', 'add');
INSERT INTO `ke_user_log` VALUES ('3831', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-11 13:24:49', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3832', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-11 13:24:49', 'add');
INSERT INTO `ke_user_log` VALUES ('3833', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-11 13:27:53', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3834', '5', '/admin/knentry', '0:0:0:0:0:0:0:1', '2017-02-11 13:27:53', 'index');
INSERT INTO `ke_user_log` VALUES ('3835', '5', '/admin/knentry', '0:0:0:0:0:0:0:1', '2017-02-11 13:28:01', 'index');
INSERT INTO `ke_user_log` VALUES ('3836', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-11 13:31:12', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3837', '5', '/admin/knentry', '0:0:0:0:0:0:0:1', '2017-02-11 13:31:12', 'index');
INSERT INTO `ke_user_log` VALUES ('3838', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-11 13:32:23', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3839', '5', '/admin/knentry', '0:0:0:0:0:0:0:1', '2017-02-11 13:32:23', 'index');
INSERT INTO `ke_user_log` VALUES ('3840', '5', '/admin/knentry/edit', '0:0:0:0:0:0:0:1', '2017-02-11 13:32:26', 'edit');
INSERT INTO `ke_user_log` VALUES ('3841', '5', '/admin/knentry', '0:0:0:0:0:0:0:1', '2017-02-11 13:32:37', 'index');
INSERT INTO `ke_user_log` VALUES ('3842', '5', '/admin/knentry/edit', '0:0:0:0:0:0:0:1', '2017-02-11 13:32:39', 'edit');
INSERT INTO `ke_user_log` VALUES ('3843', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-11 13:33:05', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3844', '5', '/admin/knentry/edit', '0:0:0:0:0:0:0:1', '2017-02-11 13:33:05', 'edit');
INSERT INTO `ke_user_log` VALUES ('3845', '5', '/admin/knentry/edit', '0:0:0:0:0:0:0:1', '2017-02-11 13:33:44', 'edit');
INSERT INTO `ke_user_log` VALUES ('3846', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-11 13:35:18', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3847', '5', '/admin/knentry/edit', '0:0:0:0:0:0:0:1', '2017-02-11 13:35:18', 'edit');
INSERT INTO `ke_user_log` VALUES ('3848', '5', '/admin/knentry/edit', '0:0:0:0:0:0:0:1', '2017-02-11 13:35:40', 'edit');
INSERT INTO `ke_user_log` VALUES ('3849', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-11 13:42:03', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3850', '5', '/admin/knentry/edit', '0:0:0:0:0:0:0:1', '2017-02-11 13:42:04', 'edit');
INSERT INTO `ke_user_log` VALUES ('3851', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-11 19:52:45', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3852', '5', '/admin/knentry/edit', '0:0:0:0:0:0:0:1', '2017-02-11 19:52:45', 'edit');
INSERT INTO `ke_user_log` VALUES ('3853', '5', '/admin/knentry/edit', '0:0:0:0:0:0:0:1', '2017-02-11 19:52:56', 'edit');
INSERT INTO `ke_user_log` VALUES ('3854', '5', '/admin/knentry/edit', '0:0:0:0:0:0:0:1', '2017-02-11 19:53:38', 'edit');
INSERT INTO `ke_user_log` VALUES ('3855', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-11 19:54:49', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3856', '5', '/admin/knentry/edit', '0:0:0:0:0:0:0:1', '2017-02-11 19:54:49', 'edit');
INSERT INTO `ke_user_log` VALUES ('3857', '5', '/admin/knentry/edit', '0:0:0:0:0:0:0:1', '2017-02-11 19:54:53', 'edit');
INSERT INTO `ke_user_log` VALUES ('3858', '5', '/admin/knentry/edit', '0:0:0:0:0:0:0:1', '2017-02-11 19:54:59', 'edit');
INSERT INTO `ke_user_log` VALUES ('3859', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-11 19:56:57', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3860', '5', '/admin/knentry', '0:0:0:0:0:0:0:1', '2017-02-11 19:56:57', 'index');
INSERT INTO `ke_user_log` VALUES ('3861', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-11 19:56:59', 'add');
INSERT INTO `ke_user_log` VALUES ('3862', '5', '/admin/knentry', '0:0:0:0:0:0:0:1', '2017-02-11 19:57:08', 'index');
INSERT INTO `ke_user_log` VALUES ('3863', '5', '/admin/knentry/edit', '0:0:0:0:0:0:0:1', '2017-02-11 19:57:10', 'edit');
INSERT INTO `ke_user_log` VALUES ('3864', '5', '/admin/knentry/edit', '0:0:0:0:0:0:0:1', '2017-02-11 19:57:17', 'edit');
INSERT INTO `ke_user_log` VALUES ('3865', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-11 20:01:05', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3866', '5', '/admin/knentry/edit', '0:0:0:0:0:0:0:1', '2017-02-11 20:01:05', 'edit');
INSERT INTO `ke_user_log` VALUES ('3867', '5', '/admin/knentry/findRelaFile', '0:0:0:0:0:0:0:1', '2017-02-11 20:01:08', 'findRelaFile');
INSERT INTO `ke_user_log` VALUES ('3868', '5', '/admin/knentry/findRelaFile', '0:0:0:0:0:0:0:1', '2017-02-11 20:01:17', 'findRelaFile');
INSERT INTO `ke_user_log` VALUES ('3869', '5', '/admin/knentry/findRelaForm', '0:0:0:0:0:0:0:1', '2017-02-11 20:01:22', 'findRelaForm');
INSERT INTO `ke_user_log` VALUES ('3870', '5', '/admin/knentry/findRelaForm', '0:0:0:0:0:0:0:1', '2017-02-11 20:01:31', 'findRelaForm');
INSERT INTO `ke_user_log` VALUES ('3871', '5', '/admin/knentry/findRelaForm', '0:0:0:0:0:0:0:1', '2017-02-11 20:01:43', 'findRelaForm');
INSERT INTO `ke_user_log` VALUES ('3872', '5', '/admin/knentry/findRelaForm', '0:0:0:0:0:0:0:1', '2017-02-11 20:01:47', 'findRelaForm');
INSERT INTO `ke_user_log` VALUES ('3873', '5', '/admin/knentry/save', '0:0:0:0:0:0:0:1', '2017-02-11 20:01:59', 'save');
INSERT INTO `ke_user_log` VALUES ('3874', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-11 20:05:57', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3875', '5', '/admin/knentry', '0:0:0:0:0:0:0:1', '2017-02-11 20:05:57', 'index');
INSERT INTO `ke_user_log` VALUES ('3876', '5', '/admin/knentry/edit', '0:0:0:0:0:0:0:1', '2017-02-11 20:05:59', 'edit');
INSERT INTO `ke_user_log` VALUES ('3877', '5', '/admin/knentry/findRelaForm', '0:0:0:0:0:0:0:1', '2017-02-11 20:06:04', 'findRelaForm');
INSERT INTO `ke_user_log` VALUES ('3878', '5', '/admin/knentry/findRelaForm', '0:0:0:0:0:0:0:1', '2017-02-11 20:06:07', 'findRelaForm');
INSERT INTO `ke_user_log` VALUES ('3879', '5', '/admin/knentry/save', '0:0:0:0:0:0:0:1', '2017-02-11 20:06:13', 'save');
INSERT INTO `ke_user_log` VALUES ('3880', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-11 20:07:28', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3881', '5', '/admin/knentry/save', '0:0:0:0:0:0:0:1', '2017-02-11 20:07:28', 'save');
INSERT INTO `ke_user_log` VALUES ('3882', '5', '/admin/knentry', '0:0:0:0:0:0:0:1', '2017-02-11 20:07:30', 'index');
INSERT INTO `ke_user_log` VALUES ('3883', '5', '/admin/knentry/edit', '0:0:0:0:0:0:0:1', '2017-02-11 20:07:48', 'edit');
INSERT INTO `ke_user_log` VALUES ('3884', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-11 20:10:20', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3885', '5', '/admin/knentry/edit', '0:0:0:0:0:0:0:1', '2017-02-11 20:10:20', 'edit');
INSERT INTO `ke_user_log` VALUES ('3886', '5', '/admin/knentry/edit', '0:0:0:0:0:0:0:1', '2017-02-11 20:11:02', 'edit');
INSERT INTO `ke_user_log` VALUES ('3887', '5', '/admin/knentry/edit', '0:0:0:0:0:0:0:1', '2017-02-11 20:11:14', 'edit');
INSERT INTO `ke_user_log` VALUES ('3888', '5', '/admin/knentry', '0:0:0:0:0:0:0:1', '2017-02-11 20:11:27', 'index');
INSERT INTO `ke_user_log` VALUES ('3889', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-11 20:11:29', 'add');
INSERT INTO `ke_user_log` VALUES ('3890', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-11 20:12:14', 'add');
INSERT INTO `ke_user_log` VALUES ('3891', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-11 20:12:23', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3892', '5', '/admin/knentry', '0:0:0:0:0:0:0:1', '2017-02-11 20:12:23', 'index');
INSERT INTO `ke_user_log` VALUES ('3893', '5', '/admin/knentry/edit', '0:0:0:0:0:0:0:1', '2017-02-11 20:12:24', 'edit');
INSERT INTO `ke_user_log` VALUES ('3894', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-11 20:14:34', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3895', '5', '/admin/knentry/edit', '0:0:0:0:0:0:0:1', '2017-02-11 20:14:34', 'edit');
INSERT INTO `ke_user_log` VALUES ('3896', '5', '/admin/knentry/edit', '0:0:0:0:0:0:0:1', '2017-02-11 20:14:35', 'edit');
INSERT INTO `ke_user_log` VALUES ('3897', '5', '/admin/knentry', '0:0:0:0:0:0:0:1', '2017-02-11 20:14:37', 'index');
INSERT INTO `ke_user_log` VALUES ('3898', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-11 20:14:39', 'add');
INSERT INTO `ke_user_log` VALUES ('3899', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-11 20:24:08', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3900', '5', '/admin/knentry/findRelaMole', '0:0:0:0:0:0:0:1', '2017-02-11 20:24:08', 'findRelaMole');
INSERT INTO `ke_user_log` VALUES ('3901', '5', '/admin/knentry/findRelaMole', '0:0:0:0:0:0:0:1', '2017-02-11 20:24:13', 'findRelaMole');
INSERT INTO `ke_user_log` VALUES ('3902', '5', '/admin/knentry/save', '0:0:0:0:0:0:0:1', '2017-02-11 20:25:35', 'save');
INSERT INTO `ke_user_log` VALUES ('3903', '5', '/admin/knentry', '0:0:0:0:0:0:0:1', '2017-02-11 20:25:37', 'index');
INSERT INTO `ke_user_log` VALUES ('3904', '5', '/admin/knentry/edit', '0:0:0:0:0:0:0:1', '2017-02-11 20:25:53', 'edit');
INSERT INTO `ke_user_log` VALUES ('3905', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-11 20:29:21', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3906', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-11 20:37:32', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3907', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-12 15:01:43', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3908', '5', '/admin', '0:0:0:0:0:0:0:1', '2017-02-12 15:01:45', 'index');
INSERT INTO `ke_user_log` VALUES ('3909', '5', '/admin/knentry', '0:0:0:0:0:0:0:1', '2017-02-12 15:01:47', 'index');
INSERT INTO `ke_user_log` VALUES ('3910', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-12 15:01:51', 'add');
INSERT INTO `ke_user_log` VALUES ('3911', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-12 15:02:23', 'add');
INSERT INTO `ke_user_log` VALUES ('3912', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-12 15:05:18', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3913', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-12 15:05:18', 'add');
INSERT INTO `ke_user_log` VALUES ('3914', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-12 15:05:21', 'add');
INSERT INTO `ke_user_log` VALUES ('3915', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-12 15:05:51', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3916', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-12 15:05:51', 'add');
INSERT INTO `ke_user_log` VALUES ('3917', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-12 15:07:45', 'add');
INSERT INTO `ke_user_log` VALUES ('3918', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-12 15:08:03', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3919', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-12 15:25:29', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3920', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-12 15:25:29', 'add');
INSERT INTO `ke_user_log` VALUES ('3921', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-12 15:29:00', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3922', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-12 15:37:39', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3923', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-12 15:40:26', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3924', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-12 15:41:36', 'add');
INSERT INTO `ke_user_log` VALUES ('3925', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-12 15:41:50', 'add');
INSERT INTO `ke_user_log` VALUES ('3926', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-12 15:43:50', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3927', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-12 15:43:50', 'add');
INSERT INTO `ke_user_log` VALUES ('3928', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-12 15:46:05', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3929', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-12 15:46:05', 'add');
INSERT INTO `ke_user_log` VALUES ('3930', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-12 15:46:40', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3931', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-12 15:46:40', 'add');
INSERT INTO `ke_user_log` VALUES ('3932', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-12 15:50:48', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3933', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-12 15:50:48', 'add');
INSERT INTO `ke_user_log` VALUES ('3934', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-12 15:53:36', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3935', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-12 15:53:36', 'add');
INSERT INTO `ke_user_log` VALUES ('3936', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-12 16:18:53', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3937', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-12 16:18:53', 'add');
INSERT INTO `ke_user_log` VALUES ('3938', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-12 16:19:43', 'add');
INSERT INTO `ke_user_log` VALUES ('3939', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-12 18:28:58', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3940', '5', '/admin/knentry/save', '0:0:0:0:0:0:0:1', '2017-02-12 18:28:58', 'save');
INSERT INTO `ke_user_log` VALUES ('3941', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-12 18:31:42', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3942', '5', '/admin/knentry/save', '0:0:0:0:0:0:0:1', '2017-02-12 18:31:42', 'save');
INSERT INTO `ke_user_log` VALUES ('3943', '5', '/admin/knentry/save', '0:0:0:0:0:0:0:1', '2017-02-12 18:31:45', 'save');
INSERT INTO `ke_user_log` VALUES ('3944', '5', '/admin/knentry/save', '0:0:0:0:0:0:0:1', '2017-02-12 18:31:56', 'save');
INSERT INTO `ke_user_log` VALUES ('3945', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-12 18:32:45', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3946', '5', '/admin/knentry/save', '0:0:0:0:0:0:0:1', '2017-02-12 18:32:45', 'save');
INSERT INTO `ke_user_log` VALUES ('3947', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-12 18:37:09', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3948', '5', '/admin/knentry/save', '0:0:0:0:0:0:0:1', '2017-02-12 18:37:09', 'save');
INSERT INTO `ke_user_log` VALUES ('3949', '5', '/admin/knentry/save', '0:0:0:0:0:0:0:1', '2017-02-12 18:37:17', 'save');
INSERT INTO `ke_user_log` VALUES ('3950', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-12 18:56:02', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3951', '5', '/admin/knentry/save', '0:0:0:0:0:0:0:1', '2017-02-12 18:56:02', 'save');
INSERT INTO `ke_user_log` VALUES ('3952', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-12 18:57:11', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3953', '5', '/admin/knentry/save', '0:0:0:0:0:0:0:1', '2017-02-12 18:57:11', 'save');
INSERT INTO `ke_user_log` VALUES ('3954', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-12 18:57:53', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3955', '5', '/admin/knentry/save', '0:0:0:0:0:0:0:1', '2017-02-12 18:57:53', 'save');
INSERT INTO `ke_user_log` VALUES ('3956', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-12 19:01:51', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3957', '5', '/admin/knentry/save', '0:0:0:0:0:0:0:1', '2017-02-12 19:01:51', 'save');
INSERT INTO `ke_user_log` VALUES ('3958', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-12 19:03:38', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3959', '5', '/admin/knentry/save', '0:0:0:0:0:0:0:1', '2017-02-12 19:03:38', 'save');
INSERT INTO `ke_user_log` VALUES ('3960', '5', '/admin/knentry', '0:0:0:0:0:0:0:1', '2017-02-12 19:04:37', 'index');
INSERT INTO `ke_user_log` VALUES ('3961', '5', '/admin/knentry/edit', '0:0:0:0:0:0:0:1', '2017-02-12 19:04:40', 'edit');
INSERT INTO `ke_user_log` VALUES ('3962', '5', '/admin/knentry/save', '0:0:0:0:0:0:0:1', '2017-02-12 19:04:47', 'save');
INSERT INTO `ke_user_log` VALUES ('3963', '5', '/admin/knentry', '0:0:0:0:0:0:0:1', '2017-02-12 19:04:54', 'index');
INSERT INTO `ke_user_log` VALUES ('3964', '5', '/admin/knentry/edit', '0:0:0:0:0:0:0:1', '2017-02-12 19:04:55', 'edit');
INSERT INTO `ke_user_log` VALUES ('3965', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-12 19:05:22', 'index');
INSERT INTO `ke_user_log` VALUES ('3966', '5', '/admin/knform/edit', '0:0:0:0:0:0:0:1', '2017-02-12 19:05:24', 'edit');
INSERT INTO `ke_user_log` VALUES ('3967', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-12 19:05:29', 'index');
INSERT INTO `ke_user_log` VALUES ('3968', '5', '/admin/knentry', '0:0:0:0:0:0:0:1', '2017-02-12 19:05:35', 'index');
INSERT INTO `ke_user_log` VALUES ('3969', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-12 19:05:37', 'add');
INSERT INTO `ke_user_log` VALUES ('3970', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-12 19:07:38', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3971', '5', '/admin/knentry/save', '0:0:0:0:0:0:0:1', '2017-02-12 19:07:38', 'save');
INSERT INTO `ke_user_log` VALUES ('3972', '5', '/admin/knentry', '0:0:0:0:0:0:0:1', '2017-02-12 19:07:40', 'index');
INSERT INTO `ke_user_log` VALUES ('3973', '5', '/admin/knentry/edit', '0:0:0:0:0:0:0:1', '2017-02-12 19:07:42', 'edit');
INSERT INTO `ke_user_log` VALUES ('3974', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-12 19:09:50', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3975', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-12 19:09:51', 'index');
INSERT INTO `ke_user_log` VALUES ('3976', '5', '/admin/knform/edit', '0:0:0:0:0:0:0:1', '2017-02-12 19:09:57', 'edit');
INSERT INTO `ke_user_log` VALUES ('3977', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-12 19:10:03', 'index');
INSERT INTO `ke_user_log` VALUES ('3978', '5', '/admin/knform/getFormImgById', '0:0:0:0:0:0:0:1', '2017-02-12 19:10:14', 'getFormImgById');
INSERT INTO `ke_user_log` VALUES ('3979', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-12 19:10:16', 'index');
INSERT INTO `ke_user_log` VALUES ('3980', '5', '/admin/knform/getFormImgById', '0:0:0:0:0:0:0:1', '2017-02-12 19:10:17', 'getFormImgById');
INSERT INTO `ke_user_log` VALUES ('3981', '5', '/admin/knform/getFormImgById', '0:0:0:0:0:0:0:1', '2017-02-12 19:10:18', 'getFormImgById');
INSERT INTO `ke_user_log` VALUES ('3982', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-12 19:10:20', 'index');
INSERT INTO `ke_user_log` VALUES ('3983', '5', '/admin/knform/edit', '0:0:0:0:0:0:0:1', '2017-02-12 19:10:22', 'edit');
INSERT INTO `ke_user_log` VALUES ('3984', '5', '/admin/knentry', '0:0:0:0:0:0:0:1', '2017-02-12 19:10:30', 'index');
INSERT INTO `ke_user_log` VALUES ('3985', '5', '/admin/knentry/edit', '0:0:0:0:0:0:0:1', '2017-02-12 19:10:31', 'edit');
INSERT INTO `ke_user_log` VALUES ('3986', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-13 13:26:36', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3987', '5', '/admin', '0:0:0:0:0:0:0:1', '2017-02-13 13:26:42', 'index');
INSERT INTO `ke_user_log` VALUES ('3988', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-13 13:28:43', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3989', '5', '/admin', '0:0:0:0:0:0:0:1', '2017-02-13 13:28:43', 'index');
INSERT INTO `ke_user_log` VALUES ('3990', '5', '/admin', '0:0:0:0:0:0:0:1', '2017-02-13 13:28:45', 'index');
INSERT INTO `ke_user_log` VALUES ('3991', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-13 13:30:59', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('3992', '5', '/admin', '0:0:0:0:0:0:0:1', '2017-02-13 13:30:59', 'index');
INSERT INTO `ke_user_log` VALUES ('3993', '5', '/admin', '0:0:0:0:0:0:0:1', '2017-02-13 13:31:00', 'index');
INSERT INTO `ke_user_log` VALUES ('3994', '5', '/admin', '0:0:0:0:0:0:0:1', '2017-02-13 13:31:01', 'index');
INSERT INTO `ke_user_log` VALUES ('3995', '5', '/admin', '0:0:0:0:0:0:0:1', '2017-02-13 13:31:46', 'index');
INSERT INTO `ke_user_log` VALUES ('3996', '5', '/admin', '0:0:0:0:0:0:0:1', '2017-02-13 13:31:48', 'index');
INSERT INTO `ke_user_log` VALUES ('3997', '5', '/admin', '0:0:0:0:0:0:0:1', '2017-02-13 13:32:23', 'index');
INSERT INTO `ke_user_log` VALUES ('3998', '5', '/admin', '0:0:0:0:0:0:0:1', '2017-02-13 13:32:25', 'index');
INSERT INTO `ke_user_log` VALUES ('3999', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-13 13:34:24', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('4000', '5', '/admin', '0:0:0:0:0:0:0:1', '2017-02-13 13:34:24', 'index');
INSERT INTO `ke_user_log` VALUES ('4001', '5', '/admin', '0:0:0:0:0:0:0:1', '2017-02-13 13:34:26', 'index');
INSERT INTO `ke_user_log` VALUES ('4002', '5', '/admin', '0:0:0:0:0:0:0:1', '2017-02-13 13:35:51', 'index');
INSERT INTO `ke_user_log` VALUES ('4003', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-13 13:37:16', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('4004', '5', '/admin', '0:0:0:0:0:0:0:1', '2017-02-13 13:37:16', 'index');
INSERT INTO `ke_user_log` VALUES ('4005', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-13 13:37:23', 'index');
INSERT INTO `ke_user_log` VALUES ('4006', '5', '/admin/role', '0:0:0:0:0:0:0:1', '2017-02-13 13:37:24', 'index');
INSERT INTO `ke_user_log` VALUES ('4007', '5', '/admin/role', '0:0:0:0:0:0:0:1', '2017-02-13 13:38:59', 'index');
INSERT INTO `ke_user_log` VALUES ('4008', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-13 13:39:48', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('4009', '5', '/admin/role', '0:0:0:0:0:0:0:1', '2017-02-13 13:39:48', 'index');
INSERT INTO `ke_user_log` VALUES ('4010', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-13 13:46:57', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('4011', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-13 13:49:11', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('4012', '5', '/admin', '0:0:0:0:0:0:0:1', '2017-02-13 13:51:09', 'index');
INSERT INTO `ke_user_log` VALUES ('4013', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-13 13:51:11', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('4014', '5', '/admin', '0:0:0:0:0:0:0:1', '2017-02-13 13:51:11', 'index');
INSERT INTO `ke_user_log` VALUES ('4015', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-13 13:56:25', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('4016', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-13 14:27:21', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('4017', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-13 14:28:45', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('4018', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-13 14:36:52', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('4019', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-13 14:38:58', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('4020', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-13 14:41:09', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('4021', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-13 14:49:46', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('4022', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-13 14:55:57', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('4023', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-13 14:57:58', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('4024', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-13 15:02:25', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('4025', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-13 15:05:14', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('4026', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-13 15:07:23', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('4027', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-13 15:12:55', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('4028', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-13 15:15:13', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('4029', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-13 15:24:36', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('4030', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-13 15:29:30', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('4031', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-13 15:33:37', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('4032', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-13 15:35:56', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('4033', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-13 15:37:57', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('4034', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-13 15:41:12', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('4035', '5', '/admin', '0:0:0:0:0:0:0:1', '2017-02-13 15:41:59', 'index');
INSERT INTO `ke_user_log` VALUES ('4036', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-13 15:42:37', 'index');
INSERT INTO `ke_user_log` VALUES ('4037', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-13 15:44:31', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('4038', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-13 15:48:56', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('4039', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-13 15:51:30', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('4040', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-13 15:53:53', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('4041', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-13 15:57:47', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('4042', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-13 16:01:21', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('4043', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-13 16:04:13', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('4044', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-13 16:07:06', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('4045', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-13 16:24:31', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('4046', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-13 16:27:23', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('4047', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-13 16:29:39', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('4048', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-13 19:34:33', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('4049', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-13 19:38:25', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('4050', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-13 19:42:45', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('4051', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-13 19:45:26', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('4052', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-13 19:48:57', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('4053', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-13 19:52:05', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('4054', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-13 19:54:06', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('4055', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-13 20:01:03', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('4056', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-13 20:03:15', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('4057', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-13 20:05:31', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('4058', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-13 20:07:50', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('4059', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-13 20:10:34', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('4060', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-13 20:12:36', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('4061', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-13 20:15:36', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('4062', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-13 20:17:36', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('4063', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-13 20:21:15', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('4064', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-13 20:24:53', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('4065', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-14 09:17:11', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('4066', '5', '/admin', '0:0:0:0:0:0:0:1', '2017-02-14 09:17:14', 'index');
INSERT INTO `ke_user_log` VALUES ('4067', '5', '/admin/knentry', '0:0:0:0:0:0:0:1', '2017-02-14 09:17:15', 'index');
INSERT INTO `ke_user_log` VALUES ('4068', '5', '/admin/knentry/edit', '0:0:0:0:0:0:0:1', '2017-02-14 09:17:25', 'edit');
INSERT INTO `ke_user_log` VALUES ('4069', '5', '/admin/knentry', '0:0:0:0:0:0:0:1', '2017-02-14 09:17:33', 'index');
INSERT INTO `ke_user_log` VALUES ('4070', '5', '/admin/knentry/edit', '0:0:0:0:0:0:0:1', '2017-02-14 09:17:35', 'edit');
INSERT INTO `ke_user_log` VALUES ('4071', '5', '/admin/knentry', '0:0:0:0:0:0:0:1', '2017-02-14 09:17:37', 'index');
INSERT INTO `ke_user_log` VALUES ('4072', '5', '/admin/knentry/edit', '0:0:0:0:0:0:0:1', '2017-02-14 09:17:39', 'edit');
INSERT INTO `ke_user_log` VALUES ('4073', '5', '/admin/knentry', '0:0:0:0:0:0:0:1', '2017-02-14 09:17:42', 'index');
INSERT INTO `ke_user_log` VALUES ('4074', '5', '/admin/knentry/edit', '0:0:0:0:0:0:0:1', '2017-02-14 09:17:44', 'edit');
INSERT INTO `ke_user_log` VALUES ('4075', '5', '/admin/knfile', '0:0:0:0:0:0:0:1', '2017-02-14 09:18:07', 'index');
INSERT INTO `ke_user_log` VALUES ('4076', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-14 09:18:09', 'index');
INSERT INTO `ke_user_log` VALUES ('4077', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-14 09:18:16', 'index');
INSERT INTO `ke_user_log` VALUES ('4078', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-14 09:18:18', 'index');
INSERT INTO `ke_user_log` VALUES ('4079', '5', '/admin/knform/del', '0:0:0:0:0:0:0:1', '2017-02-14 09:18:28', 'del');
INSERT INTO `ke_user_log` VALUES ('4080', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-14 09:18:28', 'index');
INSERT INTO `ke_user_log` VALUES ('4081', '5', '/admin/knform/del', '0:0:0:0:0:0:0:1', '2017-02-14 09:18:34', 'del');
INSERT INTO `ke_user_log` VALUES ('4082', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-14 09:18:34', 'index');
INSERT INTO `ke_user_log` VALUES ('4083', '5', '/admin/knentry', '0:0:0:0:0:0:0:1', '2017-02-14 09:18:39', 'index');
INSERT INTO `ke_user_log` VALUES ('4084', '5', '/admin/knentry/edit', '0:0:0:0:0:0:0:1', '2017-02-14 09:18:42', 'edit');
INSERT INTO `ke_user_log` VALUES ('4085', '5', '/admin/knentry/save', '0:0:0:0:0:0:0:1', '2017-02-14 09:18:48', 'save');
INSERT INTO `ke_user_log` VALUES ('4086', '5', '/admin/knentry', '0:0:0:0:0:0:0:1', '2017-02-14 09:18:52', 'index');
INSERT INTO `ke_user_log` VALUES ('4087', '5', '/admin/knentry/edit', '0:0:0:0:0:0:0:1', '2017-02-14 09:18:55', 'edit');
INSERT INTO `ke_user_log` VALUES ('4088', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-14 09:19:08', 'index');
INSERT INTO `ke_user_log` VALUES ('4089', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-14 09:19:14', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('4090', '5', '/admin/knform/del', '0:0:0:0:0:0:0:1', '2017-02-14 09:19:14', 'del');
INSERT INTO `ke_user_log` VALUES ('4091', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-14 09:19:14', 'index');
INSERT INTO `ke_user_log` VALUES ('4092', '5', '/admin/knmole', '0:0:0:0:0:0:0:1', '2017-02-14 09:19:17', 'index');
INSERT INTO `ke_user_log` VALUES ('4093', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-14 09:19:20', 'index');
INSERT INTO `ke_user_log` VALUES ('4094', '5', '/admin/knentry', '0:0:0:0:0:0:0:1', '2017-02-14 09:19:27', 'index');
INSERT INTO `ke_user_log` VALUES ('4095', '5', '/admin/knentry/edit', '0:0:0:0:0:0:0:1', '2017-02-14 09:19:29', 'edit');
INSERT INTO `ke_user_log` VALUES ('4096', '5', '/admin/knentry/save', '0:0:0:0:0:0:0:1', '2017-02-14 09:19:37', 'save');
INSERT INTO `ke_user_log` VALUES ('4097', '5', '/admin/knentry', '0:0:0:0:0:0:0:1', '2017-02-14 09:19:40', 'index');
INSERT INTO `ke_user_log` VALUES ('4098', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-14 09:19:42', 'index');
INSERT INTO `ke_user_log` VALUES ('4099', '5', '/admin/knform/del', '0:0:0:0:0:0:0:1', '2017-02-14 09:19:49', 'del');
INSERT INTO `ke_user_log` VALUES ('4100', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-14 09:19:50', 'index');
INSERT INTO `ke_user_log` VALUES ('4101', '5', '/admin/knmole', '0:0:0:0:0:0:0:1', '2017-02-14 09:19:51', 'index');
INSERT INTO `ke_user_log` VALUES ('4102', '5', '/admin/knfile', '0:0:0:0:0:0:0:1', '2017-02-14 09:19:54', 'index');
INSERT INTO `ke_user_log` VALUES ('4103', '5', '/admin/knentry', '0:0:0:0:0:0:0:1', '2017-02-14 09:19:57', 'index');
INSERT INTO `ke_user_log` VALUES ('4104', '5', '/admin/knentry/edit', '0:0:0:0:0:0:0:1', '2017-02-14 09:19:59', 'edit');
INSERT INTO `ke_user_log` VALUES ('4105', '5', '/admin/knentry/save', '0:0:0:0:0:0:0:1', '2017-02-14 09:20:04', 'save');
INSERT INTO `ke_user_log` VALUES ('4106', '5', '/admin/knentry', '0:0:0:0:0:0:0:1', '2017-02-14 09:20:07', 'index');
INSERT INTO `ke_user_log` VALUES ('4107', '5', '/admin/knentry/edit', '0:0:0:0:0:0:0:1', '2017-02-14 09:20:09', 'edit');
INSERT INTO `ke_user_log` VALUES ('4108', '5', '/admin/knentry', '0:0:0:0:0:0:0:1', '2017-02-14 09:20:14', 'index');
INSERT INTO `ke_user_log` VALUES ('4109', '5', '/admin/knentry/edit', '0:0:0:0:0:0:0:1', '2017-02-14 09:20:15', 'edit');
INSERT INTO `ke_user_log` VALUES ('4110', '5', '/admin/knentry', '0:0:0:0:0:0:0:1', '2017-02-14 09:20:20', 'index');
INSERT INTO `ke_user_log` VALUES ('4111', '5', '/admin/knentry/edit', '0:0:0:0:0:0:0:1', '2017-02-14 09:20:21', 'edit');
INSERT INTO `ke_user_log` VALUES ('4112', '5', '/admin/knfile', '0:0:0:0:0:0:0:1', '2017-02-14 09:20:24', 'index');
INSERT INTO `ke_user_log` VALUES ('4113', '5', '/admin/knfile/del', '0:0:0:0:0:0:0:1', '2017-02-14 09:20:29', 'del');
INSERT INTO `ke_user_log` VALUES ('4114', '5', '/admin/knfile', '0:0:0:0:0:0:0:1', '2017-02-14 09:20:29', 'index');
INSERT INTO `ke_user_log` VALUES ('4115', '5', '/admin/dmcate', '0:0:0:0:0:0:0:1', '2017-02-14 09:20:38', 'index');
INSERT INTO `ke_user_log` VALUES ('4116', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-14 09:20:39', 'index');
INSERT INTO `ke_user_log` VALUES ('4117', '5', '/admin/dmsubmit', '0:0:0:0:0:0:0:1', '2017-02-14 09:20:40', 'index');
INSERT INTO `ke_user_log` VALUES ('4118', '5', '/admin/dmcate', '0:0:0:0:0:0:0:1', '2017-02-14 09:21:05', 'index');
INSERT INTO `ke_user_log` VALUES ('4119', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-14 09:21:05', 'index');
INSERT INTO `ke_user_log` VALUES ('4120', '5', '/admin/dmsubmit', '0:0:0:0:0:0:0:1', '2017-02-14 09:21:07', 'index');
INSERT INTO `ke_user_log` VALUES ('4121', '5', '/admin/dmcate', '0:0:0:0:0:0:0:1', '2017-02-14 09:21:07', 'index');
INSERT INTO `ke_user_log` VALUES ('4122', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-14 09:21:08', 'index');
INSERT INTO `ke_user_log` VALUES ('4123', '5', '/admin/dmcate', '0:0:0:0:0:0:0:1', '2017-02-14 09:21:13', 'index');
INSERT INTO `ke_user_log` VALUES ('4124', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-14 09:21:21', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('4125', '5', '/admin/dmsubmit', '0:0:0:0:0:0:0:1', '2017-02-14 09:21:21', 'index');
INSERT INTO `ke_user_log` VALUES ('4126', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-14 09:21:23', 'index');
INSERT INTO `ke_user_log` VALUES ('4127', '5', '/admin/dmcate', '0:0:0:0:0:0:0:1', '2017-02-14 09:21:25', 'index');
INSERT INTO `ke_user_log` VALUES ('4128', '5', '/admin/knentry', '0:0:0:0:0:0:0:1', '2017-02-14 09:21:30', 'index');
INSERT INTO `ke_user_log` VALUES ('4129', '5', '/admin/knentry/edit', '0:0:0:0:0:0:0:1', '2017-02-14 09:21:31', 'edit');
INSERT INTO `ke_user_log` VALUES ('4130', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-14 09:24:28', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('4131', '5', '/admin/knentry/edit', '0:0:0:0:0:0:0:1', '2017-02-14 09:24:28', 'edit');
INSERT INTO `ke_user_log` VALUES ('4132', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-14 09:27:15', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('4133', '5', '/admin/knentry/edit', '0:0:0:0:0:0:0:1', '2017-02-14 09:27:15', 'edit');
INSERT INTO `ke_user_log` VALUES ('4134', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-14 09:30:56', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('4135', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-14 09:30:56', 'index');
INSERT INTO `ke_user_log` VALUES ('4136', '5', '/admin/menu/save', '0:0:0:0:0:0:0:1', '2017-02-14 09:32:29', 'save');
INSERT INTO `ke_user_log` VALUES ('4137', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-14 09:32:29', 'index');
INSERT INTO `ke_user_log` VALUES ('4138', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-14 09:33:40', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('4139', '5', '/admin/menu/save', '0:0:0:0:0:0:0:1', '2017-02-14 09:33:40', 'save');
INSERT INTO `ke_user_log` VALUES ('4140', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-14 09:33:40', 'index');
INSERT INTO `ke_user_log` VALUES ('4141', '5', '/admin/menu/save', '0:0:0:0:0:0:0:1', '2017-02-14 09:35:06', 'save');
INSERT INTO `ke_user_log` VALUES ('4142', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-14 09:35:07', 'index');
INSERT INTO `ke_user_log` VALUES ('4143', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-14 09:35:56', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('4144', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-14 09:35:56', 'index');
INSERT INTO `ke_user_log` VALUES ('4145', '5', '/admin/role', '0:0:0:0:0:0:0:1', '2017-02-14 09:36:06', 'index');
INSERT INTO `ke_user_log` VALUES ('4146', '5', '/admin/role/getRoleById', '0:0:0:0:0:0:0:1', '2017-02-14 09:36:10', 'getRoleById');
INSERT INTO `ke_user_log` VALUES ('4147', '5', '/admin/role/save', '0:0:0:0:0:0:0:1', '2017-02-14 09:36:16', 'save');
INSERT INTO `ke_user_log` VALUES ('4148', '5', '/admin/role', '0:0:0:0:0:0:0:1', '2017-02-14 09:36:16', 'index');
INSERT INTO `ke_user_log` VALUES ('4149', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-14 09:36:52', 'index');
INSERT INTO `ke_user_log` VALUES ('4150', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-14 09:54:13', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('4151', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-14 09:54:13', 'index');
INSERT INTO `ke_user_log` VALUES ('4152', '5', '/admin/emcate', '0:0:0:0:0:0:0:1', '2017-02-14 09:54:16', 'index');
INSERT INTO `ke_user_log` VALUES ('4153', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-14 09:57:46', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('4154', '5', '/admin/emcate', '0:0:0:0:0:0:0:1', '2017-02-14 09:57:46', 'index');
INSERT INTO `ke_user_log` VALUES ('4155', '5', '/admin/emcate/save', '0:0:0:0:0:0:0:1', '2017-02-14 09:58:05', 'save');
INSERT INTO `ke_user_log` VALUES ('4156', '5', '/admin/emcate', '0:0:0:0:0:0:0:1', '2017-02-14 09:58:05', 'index');
INSERT INTO `ke_user_log` VALUES ('4157', '5', '/admin/emcate/save', '0:0:0:0:0:0:0:1', '2017-02-14 09:58:12', 'save');
INSERT INTO `ke_user_log` VALUES ('4158', '5', '/admin/emcate', '0:0:0:0:0:0:0:1', '2017-02-14 09:58:13', 'index');
INSERT INTO `ke_user_log` VALUES ('4159', '5', '/admin/kntree/getTreeById', '0:0:0:0:0:0:0:1', '2017-02-14 09:58:18', 'getTreeById');
INSERT INTO `ke_user_log` VALUES ('4160', '5', '/admin/emcate', '0:0:0:0:0:0:0:1', '2017-02-14 09:59:35', 'index');
INSERT INTO `ke_user_log` VALUES ('4161', '5', '/admin/emcate/getCateById', '0:0:0:0:0:0:0:1', '2017-02-14 09:59:38', 'getCateById');
INSERT INTO `ke_user_log` VALUES ('4162', '5', '/admin/emcate/save', '0:0:0:0:0:0:0:1', '2017-02-14 09:59:45', 'save');
INSERT INTO `ke_user_log` VALUES ('4163', '5', '/admin/emcate', '0:0:0:0:0:0:0:1', '2017-02-14 09:59:45', 'index');
INSERT INTO `ke_user_log` VALUES ('4164', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-14 09:59:51', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('4165', '5', '/admin/emcate/del', '0:0:0:0:0:0:0:1', '2017-02-14 09:59:51', 'del');
INSERT INTO `ke_user_log` VALUES ('4166', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-14 10:00:21', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('4167', '5', '/admin/emcate', '0:0:0:0:0:0:0:1', '2017-02-14 10:00:21', 'index');
INSERT INTO `ke_user_log` VALUES ('4168', '5', '/admin/emcate/del', '0:0:0:0:0:0:0:1', '2017-02-14 10:00:26', 'del');
INSERT INTO `ke_user_log` VALUES ('4169', '5', '/admin/emcate', '0:0:0:0:0:0:0:1', '2017-02-14 10:00:27', 'index');
INSERT INTO `ke_user_log` VALUES ('4170', '5', '/admin/emcate', '0:0:0:0:0:0:0:1', '2017-02-14 10:00:43', 'index');
INSERT INTO `ke_user_log` VALUES ('4171', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-14 10:02:40', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('4172', '5', '/admin/emcate/save', '0:0:0:0:0:0:0:1', '2017-02-14 10:02:41', 'save');
INSERT INTO `ke_user_log` VALUES ('4173', '5', '/admin/emcate', '0:0:0:0:0:0:0:1', '2017-02-14 10:02:41', 'index');
INSERT INTO `ke_user_log` VALUES ('4174', '5', '/admin/emcate/save', '0:0:0:0:0:0:0:1', '2017-02-14 10:02:47', 'save');
INSERT INTO `ke_user_log` VALUES ('4175', '5', '/admin/emcate/save', '0:0:0:0:0:0:0:1', '2017-02-14 10:02:58', 'save');
INSERT INTO `ke_user_log` VALUES ('4176', '5', '/admin/emcate', '0:0:0:0:0:0:0:1', '2017-02-14 10:02:58', 'index');
INSERT INTO `ke_user_log` VALUES ('4177', '5', '/admin/emcate', '0:0:0:0:0:0:0:1', '2017-02-14 10:03:08', 'index');
INSERT INTO `ke_user_log` VALUES ('4178', '5', '/admin/emcate', '0:0:0:0:0:0:0:1', '2017-02-14 10:03:09', 'index');
INSERT INTO `ke_user_log` VALUES ('4179', '5', '/admin/emcate', '0:0:0:0:0:0:0:1', '2017-02-14 10:04:07', 'index');
INSERT INTO `ke_user_log` VALUES ('4180', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-14 10:05:28', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('4181', '5', '/admin/dmalgo', '0:0:0:0:0:0:0:1', '2017-02-14 10:05:28', 'index');
INSERT INTO `ke_user_log` VALUES ('4182', '5', '/admin/user', '0:0:0:0:0:0:0:1', '2017-02-14 10:05:44', 'index');
INSERT INTO `ke_user_log` VALUES ('4183', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-14 10:10:29', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('4184', '5', '/admin/knentry', '0:0:0:0:0:0:0:1', '2017-02-14 10:10:29', 'index');
INSERT INTO `ke_user_log` VALUES ('4185', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-14 10:40:09', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('4186', '5', '/admin/knentry', '0:0:0:0:0:0:0:1', '2017-02-14 10:40:09', 'index');
INSERT INTO `ke_user_log` VALUES ('4187', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 10:40:12', 'index');
INSERT INTO `ke_user_log` VALUES ('4188', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 10:40:43', 'index');
INSERT INTO `ke_user_log` VALUES ('4189', '5', '/admin', '0:0:0:0:0:0:0:1', '2017-02-14 10:41:11', 'index');
INSERT INTO `ke_user_log` VALUES ('4190', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-14 10:41:16', 'index');
INSERT INTO `ke_user_log` VALUES ('4191', '5', '/admin/role', '0:0:0:0:0:0:0:1', '2017-02-14 10:41:17', 'index');
INSERT INTO `ke_user_log` VALUES ('4192', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-14 10:41:18', 'index');
INSERT INTO `ke_user_log` VALUES ('4193', '5', '/admin/user', '0:0:0:0:0:0:0:1', '2017-02-14 10:41:19', 'index');
INSERT INTO `ke_user_log` VALUES ('4194', '5', '/admin/userlog', '0:0:0:0:0:0:0:1', '2017-02-14 10:41:20', 'index');
INSERT INTO `ke_user_log` VALUES ('4195', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-14 10:41:22', 'index');
INSERT INTO `ke_user_log` VALUES ('4196', '5', '/admin/knentry', '0:0:0:0:0:0:0:1', '2017-02-14 10:41:22', 'index');
INSERT INTO `ke_user_log` VALUES ('4197', '5', '/admin/knfile', '0:0:0:0:0:0:0:1', '2017-02-14 10:41:24', 'index');
INSERT INTO `ke_user_log` VALUES ('4198', '5', '/admin/knform', '0:0:0:0:0:0:0:1', '2017-02-14 10:41:25', 'index');
INSERT INTO `ke_user_log` VALUES ('4199', '5', '/admin/knmole', '0:0:0:0:0:0:0:1', '2017-02-14 10:41:26', 'index');
INSERT INTO `ke_user_log` VALUES ('4200', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-14 14:02:44', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('4201', '5', '/admin', '0:0:0:0:0:0:0:1', '2017-02-14 14:02:47', 'index');
INSERT INTO `ke_user_log` VALUES ('4202', '5', '/admin/emcate', '0:0:0:0:0:0:0:1', '2017-02-14 14:02:50', 'index');
INSERT INTO `ke_user_log` VALUES ('4203', '5', '/admin/emcate/getCateById', '0:0:0:0:0:0:0:1', '2017-02-14 14:03:26', 'getCateById');
INSERT INTO `ke_user_log` VALUES ('4204', '5', '/admin/emcate/save', '0:0:0:0:0:0:0:1', '2017-02-14 14:03:32', 'save');
INSERT INTO `ke_user_log` VALUES ('4205', '5', '/admin/emcate', '0:0:0:0:0:0:0:1', '2017-02-14 14:03:32', 'index');
INSERT INTO `ke_user_log` VALUES ('4206', '5', '/admin/emcate/getCateById', '0:0:0:0:0:0:0:1', '2017-02-14 14:03:37', 'getCateById');
INSERT INTO `ke_user_log` VALUES ('4207', '5', '/admin/emcate/save', '0:0:0:0:0:0:0:1', '2017-02-14 14:03:47', 'save');
INSERT INTO `ke_user_log` VALUES ('4208', '5', '/admin/emcate', '0:0:0:0:0:0:0:1', '2017-02-14 14:03:47', 'index');
INSERT INTO `ke_user_log` VALUES ('4209', '5', '/admin/emcate/getCateById', '0:0:0:0:0:0:0:1', '2017-02-14 14:03:49', 'getCateById');
INSERT INTO `ke_user_log` VALUES ('4210', '5', '/admin/emcate/save', '0:0:0:0:0:0:0:1', '2017-02-14 14:03:58', 'save');
INSERT INTO `ke_user_log` VALUES ('4211', '5', '/admin/emcate', '0:0:0:0:0:0:0:1', '2017-02-14 14:03:58', 'index');
INSERT INTO `ke_user_log` VALUES ('4212', '5', '/admin/emcate/save', '0:0:0:0:0:0:0:1', '2017-02-14 14:04:07', 'save');
INSERT INTO `ke_user_log` VALUES ('4213', '5', '/admin/emcate', '0:0:0:0:0:0:0:1', '2017-02-14 14:04:07', 'index');
INSERT INTO `ke_user_log` VALUES ('4214', '5', '/admin/emcate/getCateById', '0:0:0:0:0:0:0:1', '2017-02-14 14:04:09', 'getCateById');
INSERT INTO `ke_user_log` VALUES ('4215', '5', '/admin/emcate/save', '0:0:0:0:0:0:0:1', '2017-02-14 14:04:18', 'save');
INSERT INTO `ke_user_log` VALUES ('4216', '5', '/admin/emcate', '0:0:0:0:0:0:0:1', '2017-02-14 14:04:18', 'index');
INSERT INTO `ke_user_log` VALUES ('4217', '5', '/admin/emcate/save', '0:0:0:0:0:0:0:1', '2017-02-14 14:04:30', 'save');
INSERT INTO `ke_user_log` VALUES ('4218', '5', '/admin/emcate', '0:0:0:0:0:0:0:1', '2017-02-14 14:04:30', 'index');
INSERT INTO `ke_user_log` VALUES ('4219', '5', '/admin/emcate/save', '0:0:0:0:0:0:0:1', '2017-02-14 14:04:40', 'save');
INSERT INTO `ke_user_log` VALUES ('4220', '5', '/admin/emcate', '0:0:0:0:0:0:0:1', '2017-02-14 14:04:40', 'index');
INSERT INTO `ke_user_log` VALUES ('4221', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-14 14:04:48', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('4222', '5', '/admin/emcate/save', '0:0:0:0:0:0:0:1', '2017-02-14 14:04:48', 'save');
INSERT INTO `ke_user_log` VALUES ('4223', '5', '/admin/emcate', '0:0:0:0:0:0:0:1', '2017-02-14 14:04:48', 'index');
INSERT INTO `ke_user_log` VALUES ('4224', '5', '/admin/emcate/save', '0:0:0:0:0:0:0:1', '2017-02-14 14:05:14', 'save');
INSERT INTO `ke_user_log` VALUES ('4225', '5', '/admin/emcate', '0:0:0:0:0:0:0:1', '2017-02-14 14:05:14', 'index');
INSERT INTO `ke_user_log` VALUES ('4226', '5', '/admin/emcate/save', '0:0:0:0:0:0:0:1', '2017-02-14 14:05:29', 'save');
INSERT INTO `ke_user_log` VALUES ('4227', '5', '/admin/emcate', '0:0:0:0:0:0:0:1', '2017-02-14 14:05:29', 'index');
INSERT INTO `ke_user_log` VALUES ('4228', '5', '/admin/emcate/save', '0:0:0:0:0:0:0:1', '2017-02-14 14:05:56', 'save');
INSERT INTO `ke_user_log` VALUES ('4229', '5', '/admin/emcate', '0:0:0:0:0:0:0:1', '2017-02-14 14:05:56', 'index');
INSERT INTO `ke_user_log` VALUES ('4230', '5', '/admin/emcate/save', '0:0:0:0:0:0:0:1', '2017-02-14 14:06:09', 'save');
INSERT INTO `ke_user_log` VALUES ('4231', '5', '/admin/emcate', '0:0:0:0:0:0:0:1', '2017-02-14 14:06:09', 'index');
INSERT INTO `ke_user_log` VALUES ('4232', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 14:06:30', 'index');
INSERT INTO `ke_user_log` VALUES ('4233', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-14 14:24:50', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('4234', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-14 14:24:50', 'index');
INSERT INTO `ke_user_log` VALUES ('4235', '5', '/admin/organ', '0:0:0:0:0:0:0:1', '2017-02-14 14:25:07', 'index');
INSERT INTO `ke_user_log` VALUES ('4236', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-14 14:25:13', 'index');
INSERT INTO `ke_user_log` VALUES ('4237', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-14 14:34:25', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('4238', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-14 14:34:25', 'index');
INSERT INTO `ke_user_log` VALUES ('4239', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 14:34:28', 'index');
INSERT INTO `ke_user_log` VALUES ('4240', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 14:34:30', 'index');
INSERT INTO `ke_user_log` VALUES ('4241', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 14:35:08', 'index');
INSERT INTO `ke_user_log` VALUES ('4242', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-14 14:36:00', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('4243', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 14:36:00', 'index');
INSERT INTO `ke_user_log` VALUES ('4244', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 14:36:04', 'index');
INSERT INTO `ke_user_log` VALUES ('4245', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-14 14:45:14', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('4246', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 14:45:14', 'index');
INSERT INTO `ke_user_log` VALUES ('4247', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 14:45:23', 'index');
INSERT INTO `ke_user_log` VALUES ('4248', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 14:45:51', 'index');
INSERT INTO `ke_user_log` VALUES ('4249', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 14:46:33', 'index');
INSERT INTO `ke_user_log` VALUES ('4250', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-14 14:47:17', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('4251', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 14:47:17', 'index');
INSERT INTO `ke_user_log` VALUES ('4252', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-14 14:50:02', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('4253', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 14:50:02', 'index');
INSERT INTO `ke_user_log` VALUES ('4254', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 14:50:14', 'index');
INSERT INTO `ke_user_log` VALUES ('4255', '5', '/admin/emattr/save', '0:0:0:0:0:0:0:1', '2017-02-14 14:51:08', 'save');
INSERT INTO `ke_user_log` VALUES ('4256', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 14:51:51', 'index');
INSERT INTO `ke_user_log` VALUES ('4257', '5', '/admin/emattr/save', '0:0:0:0:0:0:0:1', '2017-02-14 14:51:57', 'save');
INSERT INTO `ke_user_log` VALUES ('4258', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-14 14:53:39', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('4259', '5', '/admin/emattr/save', '0:0:0:0:0:0:0:1', '2017-02-14 14:53:39', 'save');
INSERT INTO `ke_user_log` VALUES ('4260', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 14:53:39', 'index');
INSERT INTO `ke_user_log` VALUES ('4261', '5', '/admin/emattr/save', '0:0:0:0:0:0:0:1', '2017-02-14 14:54:07', 'save');
INSERT INTO `ke_user_log` VALUES ('4262', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 14:54:08', 'index');
INSERT INTO `ke_user_log` VALUES ('4263', '5', '/admin/emattr/save', '0:0:0:0:0:0:0:1', '2017-02-14 14:54:26', 'save');
INSERT INTO `ke_user_log` VALUES ('4264', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 14:54:26', 'index');
INSERT INTO `ke_user_log` VALUES ('4265', '5', '/admin/emattr/save', '0:0:0:0:0:0:0:1', '2017-02-14 14:54:42', 'save');
INSERT INTO `ke_user_log` VALUES ('4266', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 14:54:42', 'index');
INSERT INTO `ke_user_log` VALUES ('4267', '5', '/admin/emattr/save', '0:0:0:0:0:0:0:1', '2017-02-14 14:54:53', 'save');
INSERT INTO `ke_user_log` VALUES ('4268', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 14:54:53', 'index');
INSERT INTO `ke_user_log` VALUES ('4269', '5', '/admin/emattr/save', '0:0:0:0:0:0:0:1', '2017-02-14 14:55:05', 'save');
INSERT INTO `ke_user_log` VALUES ('4270', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 14:55:05', 'index');
INSERT INTO `ke_user_log` VALUES ('4271', '5', '/admin/kntree', '0:0:0:0:0:0:0:1', '2017-02-14 14:55:12', 'index');
INSERT INTO `ke_user_log` VALUES ('4272', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 14:55:20', 'index');
INSERT INTO `ke_user_log` VALUES ('4273', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-14 14:56:11', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('4274', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 14:56:11', 'index');
INSERT INTO `ke_user_log` VALUES ('4275', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 14:56:11', 'index');
INSERT INTO `ke_user_log` VALUES ('4276', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 14:57:19', 'index');
INSERT INTO `ke_user_log` VALUES ('4277', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 14:57:28', 'index');
INSERT INTO `ke_user_log` VALUES ('4278', '5', '/admin/emattr/save', '0:0:0:0:0:0:0:1', '2017-02-14 14:57:45', 'save');
INSERT INTO `ke_user_log` VALUES ('4279', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 14:57:45', 'index');
INSERT INTO `ke_user_log` VALUES ('4280', '5', '/admin/emattr/save', '0:0:0:0:0:0:0:1', '2017-02-14 14:58:02', 'save');
INSERT INTO `ke_user_log` VALUES ('4281', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 14:58:02', 'index');
INSERT INTO `ke_user_log` VALUES ('4282', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-14 14:58:14', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('4283', '5', '/admin/emattr/save', '0:0:0:0:0:0:0:1', '2017-02-14 14:58:14', 'save');
INSERT INTO `ke_user_log` VALUES ('4284', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 14:58:14', 'index');
INSERT INTO `ke_user_log` VALUES ('4285', '5', '/admin/emattr/save', '0:0:0:0:0:0:0:1', '2017-02-14 14:58:25', 'save');
INSERT INTO `ke_user_log` VALUES ('4286', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 14:58:25', 'index');
INSERT INTO `ke_user_log` VALUES ('4287', '5', '/admin/emattr/save', '0:0:0:0:0:0:0:1', '2017-02-14 14:58:34', 'save');
INSERT INTO `ke_user_log` VALUES ('4288', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 14:58:34', 'index');
INSERT INTO `ke_user_log` VALUES ('4289', '5', '/admin/emattr/save', '0:0:0:0:0:0:0:1', '2017-02-14 14:58:45', 'save');
INSERT INTO `ke_user_log` VALUES ('4290', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 14:58:45', 'index');
INSERT INTO `ke_user_log` VALUES ('4291', '5', '/admin/emattr/save', '0:0:0:0:0:0:0:1', '2017-02-14 14:58:55', 'save');
INSERT INTO `ke_user_log` VALUES ('4292', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 14:58:55', 'index');
INSERT INTO `ke_user_log` VALUES ('4293', '5', '/admin/emattr/save', '0:0:0:0:0:0:0:1', '2017-02-14 14:59:06', 'save');
INSERT INTO `ke_user_log` VALUES ('4294', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 14:59:06', 'index');
INSERT INTO `ke_user_log` VALUES ('4295', '5', '/admin/emattr/save', '0:0:0:0:0:0:0:1', '2017-02-14 14:59:25', 'save');
INSERT INTO `ke_user_log` VALUES ('4296', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 14:59:25', 'index');
INSERT INTO `ke_user_log` VALUES ('4297', '5', '/admin/emattr/save', '0:0:0:0:0:0:0:1', '2017-02-14 14:59:41', 'save');
INSERT INTO `ke_user_log` VALUES ('4298', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 14:59:41', 'index');
INSERT INTO `ke_user_log` VALUES ('4299', '5', '/admin/emattr/save', '0:0:0:0:0:0:0:1', '2017-02-14 14:59:57', 'save');
INSERT INTO `ke_user_log` VALUES ('4300', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 14:59:57', 'index');
INSERT INTO `ke_user_log` VALUES ('4301', '5', '/admin/emattr/save', '0:0:0:0:0:0:0:1', '2017-02-14 15:00:08', 'save');
INSERT INTO `ke_user_log` VALUES ('4302', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 15:00:08', 'index');
INSERT INTO `ke_user_log` VALUES ('4303', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-14 15:00:23', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('4304', '5', '/admin/emattr/save', '0:0:0:0:0:0:0:1', '2017-02-14 15:00:23', 'save');
INSERT INTO `ke_user_log` VALUES ('4305', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 15:00:23', 'index');
INSERT INTO `ke_user_log` VALUES ('4306', '5', '/admin/emattr/save', '0:0:0:0:0:0:0:1', '2017-02-14 15:00:31', 'save');
INSERT INTO `ke_user_log` VALUES ('4307', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 15:00:31', 'index');
INSERT INTO `ke_user_log` VALUES ('4308', '5', '/admin/emattr/save', '0:0:0:0:0:0:0:1', '2017-02-14 15:00:43', 'save');
INSERT INTO `ke_user_log` VALUES ('4309', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 15:00:43', 'index');
INSERT INTO `ke_user_log` VALUES ('4310', '5', '/admin/emattr/save', '0:0:0:0:0:0:0:1', '2017-02-14 15:00:57', 'save');
INSERT INTO `ke_user_log` VALUES ('4311', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 15:00:57', 'index');
INSERT INTO `ke_user_log` VALUES ('4312', '5', '/admin/emattr/save', '0:0:0:0:0:0:0:1', '2017-02-14 15:01:07', 'save');
INSERT INTO `ke_user_log` VALUES ('4313', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 15:01:07', 'index');
INSERT INTO `ke_user_log` VALUES ('4314', '5', '/admin/emattr/save', '0:0:0:0:0:0:0:1', '2017-02-14 15:01:17', 'save');
INSERT INTO `ke_user_log` VALUES ('4315', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 15:01:17', 'index');
INSERT INTO `ke_user_log` VALUES ('4316', '5', '/admin/emattr/save', '0:0:0:0:0:0:0:1', '2017-02-14 15:01:32', 'save');
INSERT INTO `ke_user_log` VALUES ('4317', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 15:01:32', 'index');
INSERT INTO `ke_user_log` VALUES ('4318', '5', '/admin/emattr/save', '0:0:0:0:0:0:0:1', '2017-02-14 15:01:44', 'save');
INSERT INTO `ke_user_log` VALUES ('4319', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 15:01:44', 'index');
INSERT INTO `ke_user_log` VALUES ('4320', '5', '/admin/emattr/save', '0:0:0:0:0:0:0:1', '2017-02-14 15:01:56', 'save');
INSERT INTO `ke_user_log` VALUES ('4321', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 15:01:56', 'index');
INSERT INTO `ke_user_log` VALUES ('4322', '5', '/admin/emattr/save', '0:0:0:0:0:0:0:1', '2017-02-14 15:02:07', 'save');
INSERT INTO `ke_user_log` VALUES ('4323', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 15:02:07', 'index');
INSERT INTO `ke_user_log` VALUES ('4324', '5', '/admin/emattr/save', '0:0:0:0:0:0:0:1', '2017-02-14 15:02:20', 'save');
INSERT INTO `ke_user_log` VALUES ('4325', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 15:02:20', 'index');
INSERT INTO `ke_user_log` VALUES ('4326', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-14 15:02:46', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('4327', '5', '/admin/emattr/save', '0:0:0:0:0:0:0:1', '2017-02-14 15:02:46', 'save');
INSERT INTO `ke_user_log` VALUES ('4328', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 15:02:46', 'index');
INSERT INTO `ke_user_log` VALUES ('4329', '5', '/admin/emattr/save', '0:0:0:0:0:0:0:1', '2017-02-14 15:02:58', 'save');
INSERT INTO `ke_user_log` VALUES ('4330', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 15:02:58', 'index');
INSERT INTO `ke_user_log` VALUES ('4331', '5', '/admin/emattr/save', '0:0:0:0:0:0:0:1', '2017-02-14 15:03:10', 'save');
INSERT INTO `ke_user_log` VALUES ('4332', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 15:03:10', 'index');
INSERT INTO `ke_user_log` VALUES ('4333', '5', '/admin/emattr/save', '0:0:0:0:0:0:0:1', '2017-02-14 15:03:36', 'save');
INSERT INTO `ke_user_log` VALUES ('4334', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 15:03:37', 'index');
INSERT INTO `ke_user_log` VALUES ('4335', '5', '/admin/emattr/save', '0:0:0:0:0:0:0:1', '2017-02-14 15:03:51', 'save');
INSERT INTO `ke_user_log` VALUES ('4336', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 15:03:51', 'index');
INSERT INTO `ke_user_log` VALUES ('4337', '5', '/admin/emattr/save', '0:0:0:0:0:0:0:1', '2017-02-14 15:04:05', 'save');
INSERT INTO `ke_user_log` VALUES ('4338', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 15:04:05', 'index');
INSERT INTO `ke_user_log` VALUES ('4339', '5', '/admin/emattr/save', '0:0:0:0:0:0:0:1', '2017-02-14 15:04:17', 'save');
INSERT INTO `ke_user_log` VALUES ('4340', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 15:04:17', 'index');
INSERT INTO `ke_user_log` VALUES ('4341', '5', '/admin/emattr/save', '0:0:0:0:0:0:0:1', '2017-02-14 15:04:35', 'save');
INSERT INTO `ke_user_log` VALUES ('4342', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 15:04:35', 'index');
INSERT INTO `ke_user_log` VALUES ('4343', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-14 15:04:47', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('4344', '5', '/admin/emattr/save', '0:0:0:0:0:0:0:1', '2017-02-14 15:04:47', 'save');
INSERT INTO `ke_user_log` VALUES ('4345', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 15:04:47', 'index');
INSERT INTO `ke_user_log` VALUES ('4346', '5', '/admin/emattr/save', '0:0:0:0:0:0:0:1', '2017-02-14 15:04:58', 'save');
INSERT INTO `ke_user_log` VALUES ('4347', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 15:04:58', 'index');
INSERT INTO `ke_user_log` VALUES ('4348', '5', '/admin/emattr/save', '0:0:0:0:0:0:0:1', '2017-02-14 15:05:09', 'save');
INSERT INTO `ke_user_log` VALUES ('4349', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 15:05:09', 'index');
INSERT INTO `ke_user_log` VALUES ('4350', '5', '/admin/emattr/save', '0:0:0:0:0:0:0:1', '2017-02-14 15:05:24', 'save');
INSERT INTO `ke_user_log` VALUES ('4351', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 15:05:24', 'index');
INSERT INTO `ke_user_log` VALUES ('4352', '5', '/admin/emattr/save', '0:0:0:0:0:0:0:1', '2017-02-14 15:05:40', 'save');
INSERT INTO `ke_user_log` VALUES ('4353', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 15:05:40', 'index');
INSERT INTO `ke_user_log` VALUES ('4354', '5', '/admin/emattr/save', '0:0:0:0:0:0:0:1', '2017-02-14 15:05:59', 'save');
INSERT INTO `ke_user_log` VALUES ('4355', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 15:05:59', 'index');
INSERT INTO `ke_user_log` VALUES ('4356', '5', '/admin/emattr/save', '0:0:0:0:0:0:0:1', '2017-02-14 15:06:13', 'save');
INSERT INTO `ke_user_log` VALUES ('4357', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 15:06:13', 'index');
INSERT INTO `ke_user_log` VALUES ('4358', '5', '/admin/emattr/save', '0:0:0:0:0:0:0:1', '2017-02-14 15:06:26', 'save');
INSERT INTO `ke_user_log` VALUES ('4359', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 15:06:26', 'index');
INSERT INTO `ke_user_log` VALUES ('4360', '5', '/admin/emattr/save', '0:0:0:0:0:0:0:1', '2017-02-14 15:06:40', 'save');
INSERT INTO `ke_user_log` VALUES ('4361', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 15:06:40', 'index');
INSERT INTO `ke_user_log` VALUES ('4362', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-14 15:06:56', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('4363', '5', '/admin/emattr/save', '0:0:0:0:0:0:0:1', '2017-02-14 15:06:56', 'save');
INSERT INTO `ke_user_log` VALUES ('4364', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 15:06:56', 'index');
INSERT INTO `ke_user_log` VALUES ('4365', '5', '/admin/emattr/save', '0:0:0:0:0:0:0:1', '2017-02-14 15:07:08', 'save');
INSERT INTO `ke_user_log` VALUES ('4366', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 15:07:08', 'index');
INSERT INTO `ke_user_log` VALUES ('4367', '5', '/admin/emattr/save', '0:0:0:0:0:0:0:1', '2017-02-14 15:07:24', 'save');
INSERT INTO `ke_user_log` VALUES ('4368', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 15:07:24', 'index');
INSERT INTO `ke_user_log` VALUES ('4369', '5', '/admin/emattr/save', '0:0:0:0:0:0:0:1', '2017-02-14 15:08:03', 'save');
INSERT INTO `ke_user_log` VALUES ('4370', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 15:08:03', 'index');
INSERT INTO `ke_user_log` VALUES ('4371', '5', '/admin/emattr/save', '0:0:0:0:0:0:0:1', '2017-02-14 15:08:18', 'save');
INSERT INTO `ke_user_log` VALUES ('4372', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 15:08:18', 'index');
INSERT INTO `ke_user_log` VALUES ('4373', '5', '/admin/emattr/save', '0:0:0:0:0:0:0:1', '2017-02-14 15:08:26', 'save');
INSERT INTO `ke_user_log` VALUES ('4374', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 15:08:26', 'index');
INSERT INTO `ke_user_log` VALUES ('4375', '5', '/admin/emattr/save', '0:0:0:0:0:0:0:1', '2017-02-14 15:08:39', 'save');
INSERT INTO `ke_user_log` VALUES ('4376', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 15:08:39', 'index');
INSERT INTO `ke_user_log` VALUES ('4377', '5', '/admin/emattr/save', '0:0:0:0:0:0:0:1', '2017-02-14 15:08:50', 'save');
INSERT INTO `ke_user_log` VALUES ('4378', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 15:08:50', 'index');
INSERT INTO `ke_user_log` VALUES ('4379', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-14 15:09:17', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('4380', '5', '/admin/emattr/save', '0:0:0:0:0:0:0:1', '2017-02-14 15:09:17', 'save');
INSERT INTO `ke_user_log` VALUES ('4381', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 15:09:17', 'index');
INSERT INTO `ke_user_log` VALUES ('4382', '5', '/admin/emattr/save', '0:0:0:0:0:0:0:1', '2017-02-14 15:09:29', 'save');
INSERT INTO `ke_user_log` VALUES ('4383', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 15:09:29', 'index');
INSERT INTO `ke_user_log` VALUES ('4384', '5', '/admin/emattr/save', '0:0:0:0:0:0:0:1', '2017-02-14 15:09:39', 'save');
INSERT INTO `ke_user_log` VALUES ('4385', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 15:09:39', 'index');
INSERT INTO `ke_user_log` VALUES ('4386', '5', '/admin/emattr/save', '0:0:0:0:0:0:0:1', '2017-02-14 15:09:48', 'save');
INSERT INTO `ke_user_log` VALUES ('4387', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 15:09:48', 'index');
INSERT INTO `ke_user_log` VALUES ('4388', '5', '/admin/emattr/save', '0:0:0:0:0:0:0:1', '2017-02-14 15:09:58', 'save');
INSERT INTO `ke_user_log` VALUES ('4389', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 15:09:58', 'index');
INSERT INTO `ke_user_log` VALUES ('4390', '5', '/admin/emattr/save', '0:0:0:0:0:0:0:1', '2017-02-14 15:10:10', 'save');
INSERT INTO `ke_user_log` VALUES ('4391', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 15:10:10', 'index');
INSERT INTO `ke_user_log` VALUES ('4392', '5', '/admin/emattr/save', '0:0:0:0:0:0:0:1', '2017-02-14 15:10:22', 'save');
INSERT INTO `ke_user_log` VALUES ('4393', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 15:10:22', 'index');
INSERT INTO `ke_user_log` VALUES ('4394', '5', '/admin/emattr/save', '0:0:0:0:0:0:0:1', '2017-02-14 15:10:33', 'save');
INSERT INTO `ke_user_log` VALUES ('4395', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 15:10:33', 'index');
INSERT INTO `ke_user_log` VALUES ('4396', '5', '/admin/emattr/save', '0:0:0:0:0:0:0:1', '2017-02-14 15:10:41', 'save');
INSERT INTO `ke_user_log` VALUES ('4397', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 15:10:41', 'index');
INSERT INTO `ke_user_log` VALUES ('4398', '5', '/admin/emattr/save', '0:0:0:0:0:0:0:1', '2017-02-14 15:10:49', 'save');
INSERT INTO `ke_user_log` VALUES ('4399', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 15:10:49', 'index');
INSERT INTO `ke_user_log` VALUES ('4400', '5', '/admin/emattr/save', '0:0:0:0:0:0:0:1', '2017-02-14 15:10:58', 'save');
INSERT INTO `ke_user_log` VALUES ('4401', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 15:10:58', 'index');
INSERT INTO `ke_user_log` VALUES ('4402', '5', '/admin/emattr/save', '0:0:0:0:0:0:0:1', '2017-02-14 15:11:05', 'save');
INSERT INTO `ke_user_log` VALUES ('4403', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 15:11:05', 'index');
INSERT INTO `ke_user_log` VALUES ('4404', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-14 15:11:18', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('4405', '5', '/admin/emattr/save', '0:0:0:0:0:0:0:1', '2017-02-14 15:11:18', 'save');
INSERT INTO `ke_user_log` VALUES ('4406', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 15:11:18', 'index');
INSERT INTO `ke_user_log` VALUES ('4407', '5', '/admin/emattr/save', '0:0:0:0:0:0:0:1', '2017-02-14 15:11:29', 'save');
INSERT INTO `ke_user_log` VALUES ('4408', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 15:11:29', 'index');
INSERT INTO `ke_user_log` VALUES ('4409', '5', '/admin/emattr/save', '0:0:0:0:0:0:0:1', '2017-02-14 15:11:38', 'save');
INSERT INTO `ke_user_log` VALUES ('4410', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 15:11:38', 'index');
INSERT INTO `ke_user_log` VALUES ('4411', '5', '/admin/emattr/save', '0:0:0:0:0:0:0:1', '2017-02-14 15:11:49', 'save');
INSERT INTO `ke_user_log` VALUES ('4412', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 15:11:49', 'index');
INSERT INTO `ke_user_log` VALUES ('4413', '5', '/admin/emattr/save', '0:0:0:0:0:0:0:1', '2017-02-14 15:11:58', 'save');
INSERT INTO `ke_user_log` VALUES ('4414', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 15:11:58', 'index');
INSERT INTO `ke_user_log` VALUES ('4415', '5', '/admin/emattr/save', '0:0:0:0:0:0:0:1', '2017-02-14 15:12:44', 'save');
INSERT INTO `ke_user_log` VALUES ('4416', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 15:12:44', 'index');
INSERT INTO `ke_user_log` VALUES ('4417', '5', '/admin/emattr/save', '0:0:0:0:0:0:0:1', '2017-02-14 15:12:54', 'save');
INSERT INTO `ke_user_log` VALUES ('4418', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 15:12:54', 'index');
INSERT INTO `ke_user_log` VALUES ('4419', '5', '/admin/emattr/save', '0:0:0:0:0:0:0:1', '2017-02-14 15:13:05', 'save');
INSERT INTO `ke_user_log` VALUES ('4420', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 15:13:05', 'index');
INSERT INTO `ke_user_log` VALUES ('4421', '5', '/admin/emattr/save', '0:0:0:0:0:0:0:1', '2017-02-14 15:13:18', 'save');
INSERT INTO `ke_user_log` VALUES ('4422', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 15:13:18', 'index');
INSERT INTO `ke_user_log` VALUES ('4423', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-14 15:13:27', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('4424', '5', '/admin/emattr/save', '0:0:0:0:0:0:0:1', '2017-02-14 15:13:27', 'save');
INSERT INTO `ke_user_log` VALUES ('4425', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 15:13:27', 'index');
INSERT INTO `ke_user_log` VALUES ('4426', '5', '/admin/emattr/save', '0:0:0:0:0:0:0:1', '2017-02-14 15:13:37', 'save');
INSERT INTO `ke_user_log` VALUES ('4427', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 15:13:37', 'index');
INSERT INTO `ke_user_log` VALUES ('4428', '5', '/admin/emattr/save', '0:0:0:0:0:0:0:1', '2017-02-14 15:13:47', 'save');
INSERT INTO `ke_user_log` VALUES ('4429', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 15:13:47', 'index');
INSERT INTO `ke_user_log` VALUES ('4430', '5', '/admin/emattr/save', '0:0:0:0:0:0:0:1', '2017-02-14 15:14:04', 'save');
INSERT INTO `ke_user_log` VALUES ('4431', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 15:14:04', 'index');
INSERT INTO `ke_user_log` VALUES ('4432', '5', '/admin/emattr/save', '0:0:0:0:0:0:0:1', '2017-02-14 15:14:15', 'save');
INSERT INTO `ke_user_log` VALUES ('4433', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 15:14:15', 'index');
INSERT INTO `ke_user_log` VALUES ('4434', '5', '/admin/emattr/save', '0:0:0:0:0:0:0:1', '2017-02-14 15:14:26', 'save');
INSERT INTO `ke_user_log` VALUES ('4435', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 15:14:26', 'index');
INSERT INTO `ke_user_log` VALUES ('4436', '5', '/admin/emattr/save', '0:0:0:0:0:0:0:1', '2017-02-14 15:14:39', 'save');
INSERT INTO `ke_user_log` VALUES ('4437', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 15:14:39', 'index');
INSERT INTO `ke_user_log` VALUES ('4438', '5', '/admin/emattr/save', '0:0:0:0:0:0:0:1', '2017-02-14 15:14:51', 'save');
INSERT INTO `ke_user_log` VALUES ('4439', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 15:14:51', 'index');
INSERT INTO `ke_user_log` VALUES ('4440', '5', '/admin/emattr/save', '0:0:0:0:0:0:0:1', '2017-02-14 15:15:06', 'save');
INSERT INTO `ke_user_log` VALUES ('4441', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 15:15:06', 'index');
INSERT INTO `ke_user_log` VALUES ('4442', '5', '/admin/emattr/save', '0:0:0:0:0:0:0:1', '2017-02-14 15:15:19', 'save');
INSERT INTO `ke_user_log` VALUES ('4443', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 15:15:19', 'index');
INSERT INTO `ke_user_log` VALUES ('4444', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-14 15:15:35', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('4445', '5', '/admin/emattr/save', '0:0:0:0:0:0:0:1', '2017-02-14 15:15:35', 'save');
INSERT INTO `ke_user_log` VALUES ('4446', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 15:15:35', 'index');
INSERT INTO `ke_user_log` VALUES ('4447', '5', '/admin/emattr/save', '0:0:0:0:0:0:0:1', '2017-02-14 15:16:00', 'save');
INSERT INTO `ke_user_log` VALUES ('4448', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 15:16:00', 'index');
INSERT INTO `ke_user_log` VALUES ('4449', '5', '/admin/emattr/save', '0:0:0:0:0:0:0:1', '2017-02-14 15:16:12', 'save');
INSERT INTO `ke_user_log` VALUES ('4450', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 15:16:12', 'index');
INSERT INTO `ke_user_log` VALUES ('4451', '5', '/admin/emattr/save', '0:0:0:0:0:0:0:1', '2017-02-14 15:16:23', 'save');
INSERT INTO `ke_user_log` VALUES ('4452', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 15:16:23', 'index');
INSERT INTO `ke_user_log` VALUES ('4453', '5', '/admin/emattr/save', '0:0:0:0:0:0:0:1', '2017-02-14 15:16:33', 'save');
INSERT INTO `ke_user_log` VALUES ('4454', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 15:16:33', 'index');
INSERT INTO `ke_user_log` VALUES ('4455', '5', '/admin/emattr/save', '0:0:0:0:0:0:0:1', '2017-02-14 15:16:45', 'save');
INSERT INTO `ke_user_log` VALUES ('4456', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 15:16:45', 'index');
INSERT INTO `ke_user_log` VALUES ('4457', '5', '/admin/emattr/save', '0:0:0:0:0:0:0:1', '2017-02-14 15:17:07', 'save');
INSERT INTO `ke_user_log` VALUES ('4458', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 15:17:07', 'index');
INSERT INTO `ke_user_log` VALUES ('4459', '5', '/admin/emattr/save', '0:0:0:0:0:0:0:1', '2017-02-14 15:17:27', 'save');
INSERT INTO `ke_user_log` VALUES ('4460', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 15:17:27', 'index');
INSERT INTO `ke_user_log` VALUES ('4461', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-14 15:17:38', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('4462', '5', '/admin/emattr/save', '0:0:0:0:0:0:0:1', '2017-02-14 15:17:38', 'save');
INSERT INTO `ke_user_log` VALUES ('4463', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 15:17:38', 'index');
INSERT INTO `ke_user_log` VALUES ('4464', '5', '/admin/emattr/save', '0:0:0:0:0:0:0:1', '2017-02-14 15:17:51', 'save');
INSERT INTO `ke_user_log` VALUES ('4465', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 15:17:51', 'index');
INSERT INTO `ke_user_log` VALUES ('4466', '5', '/admin/emattr/save', '0:0:0:0:0:0:0:1', '2017-02-14 15:18:05', 'save');
INSERT INTO `ke_user_log` VALUES ('4467', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 15:18:05', 'index');
INSERT INTO `ke_user_log` VALUES ('4468', '5', '/admin/emattr/save', '0:0:0:0:0:0:0:1', '2017-02-14 15:18:17', 'save');
INSERT INTO `ke_user_log` VALUES ('4469', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 15:18:17', 'index');
INSERT INTO `ke_user_log` VALUES ('4470', '5', '/admin/emattr/save', '0:0:0:0:0:0:0:1', '2017-02-14 15:18:29', 'save');
INSERT INTO `ke_user_log` VALUES ('4471', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 15:18:29', 'index');
INSERT INTO `ke_user_log` VALUES ('4472', '5', '/admin/emattr/save', '0:0:0:0:0:0:0:1', '2017-02-14 15:18:40', 'save');
INSERT INTO `ke_user_log` VALUES ('4473', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 15:18:40', 'index');
INSERT INTO `ke_user_log` VALUES ('4474', '5', '/admin/emattr/save', '0:0:0:0:0:0:0:1', '2017-02-14 15:18:51', 'save');
INSERT INTO `ke_user_log` VALUES ('4475', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 15:18:51', 'index');
INSERT INTO `ke_user_log` VALUES ('4476', '5', '/admin/emattr/save', '0:0:0:0:0:0:0:1', '2017-02-14 15:19:03', 'save');
INSERT INTO `ke_user_log` VALUES ('4477', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 15:19:03', 'index');
INSERT INTO `ke_user_log` VALUES ('4478', '5', '/admin/emattr/save', '0:0:0:0:0:0:0:1', '2017-02-14 15:19:11', 'save');
INSERT INTO `ke_user_log` VALUES ('4479', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 15:19:11', 'index');
INSERT INTO `ke_user_log` VALUES ('4480', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 15:19:36', 'index');
INSERT INTO `ke_user_log` VALUES ('4481', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-14 15:19:38', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('4482', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 15:19:38', 'index');
INSERT INTO `ke_user_log` VALUES ('4483', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 15:19:41', 'index');
INSERT INTO `ke_user_log` VALUES ('4484', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 15:19:43', 'index');
INSERT INTO `ke_user_log` VALUES ('4485', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 15:19:45', 'index');
INSERT INTO `ke_user_log` VALUES ('4486', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 15:19:51', 'index');
INSERT INTO `ke_user_log` VALUES ('4487', '5', '/admin/emattr/getAttrById', '0:0:0:0:0:0:0:1', '2017-02-14 15:20:07', 'getAttrById');
INSERT INTO `ke_user_log` VALUES ('4488', '5', '/admin/emattr/getAttrById', '0:0:0:0:0:0:0:1', '2017-02-14 15:20:14', 'getAttrById');
INSERT INTO `ke_user_log` VALUES ('4489', '5', '/admin/emcate', '0:0:0:0:0:0:0:1', '2017-02-14 15:20:55', 'index');
INSERT INTO `ke_user_log` VALUES ('4490', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 15:20:57', 'index');
INSERT INTO `ke_user_log` VALUES ('4491', '5', '/admin/emcate', '0:0:0:0:0:0:0:1', '2017-02-14 15:20:59', 'index');
INSERT INTO `ke_user_log` VALUES ('4492', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 15:21:00', 'index');
INSERT INTO `ke_user_log` VALUES ('4493', '5', '/admin/emcate', '0:0:0:0:0:0:0:1', '2017-02-14 15:21:02', 'index');
INSERT INTO `ke_user_log` VALUES ('4494', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 15:21:02', 'index');
INSERT INTO `ke_user_log` VALUES ('4495', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-14 15:21:44', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('4496', '5', '/admin', '0:0:0:0:0:0:0:1', '2017-02-14 15:21:44', 'index');
INSERT INTO `ke_user_log` VALUES ('4497', '5', '/admin', '0:0:0:0:0:0:0:1', '2017-02-14 15:21:50', 'index');
INSERT INTO `ke_user_log` VALUES ('4498', '5', '/admin/emcate', '0:0:0:0:0:0:0:1', '2017-02-14 15:21:52', 'index');
INSERT INTO `ke_user_log` VALUES ('4499', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 15:21:53', 'index');
INSERT INTO `ke_user_log` VALUES ('4500', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-14 15:29:44', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('4501', '5', '/admin', '0:0:0:0:0:0:0:1', '2017-02-14 15:29:44', 'index');
INSERT INTO `ke_user_log` VALUES ('4502', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 15:29:46', 'index');
INSERT INTO `ke_user_log` VALUES ('4503', '5', '/admin/emcate', '0:0:0:0:0:0:0:1', '2017-02-14 15:29:47', 'index');
INSERT INTO `ke_user_log` VALUES ('4504', '5', '/admin/knmole', '0:0:0:0:0:0:0:1', '2017-02-14 15:29:49', 'index');
INSERT INTO `ke_user_log` VALUES ('4505', '5', '/admin/knmole', '0:0:0:0:0:0:0:1', '2017-02-14 15:30:05', 'index');
INSERT INTO `ke_user_log` VALUES ('4506', '5', '/admin/knmole', '0:0:0:0:0:0:0:1', '2017-02-14 15:30:49', 'index');
INSERT INTO `ke_user_log` VALUES ('4507', '5', '/admin/emcate', '0:0:0:0:0:0:0:1', '2017-02-14 15:30:51', 'index');
INSERT INTO `ke_user_log` VALUES ('4508', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 15:30:52', 'index');
INSERT INTO `ke_user_log` VALUES ('4509', '5', '/admin/emcate', '0:0:0:0:0:0:0:1', '2017-02-14 15:30:53', 'index');
INSERT INTO `ke_user_log` VALUES ('4510', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 15:31:05', 'index');
INSERT INTO `ke_user_log` VALUES ('4511', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-14 15:36:50', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('4512', '5', '/admin/emattr/save', '0:0:0:0:0:0:0:1', '2017-02-14 15:36:50', 'save');
INSERT INTO `ke_user_log` VALUES ('4513', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 15:36:50', 'index');
INSERT INTO `ke_user_log` VALUES ('4514', '5', '/admin/emattr/del', '0:0:0:0:0:0:0:1', '2017-02-14 15:36:54', 'del');
INSERT INTO `ke_user_log` VALUES ('4515', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 15:37:36', 'index');
INSERT INTO `ke_user_log` VALUES ('4516', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-14 15:37:40', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('4517', '5', '/admin/emattr/del', '0:0:0:0:0:0:0:1', '2017-02-14 15:37:40', 'del');
INSERT INTO `ke_user_log` VALUES ('4518', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 15:38:40', 'index');
INSERT INTO `ke_user_log` VALUES ('4519', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-14 15:38:45', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('4520', '5', '/admin/emattr/del', '0:0:0:0:0:0:0:1', '2017-02-14 15:38:45', 'del');
INSERT INTO `ke_user_log` VALUES ('4521', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-14 15:38:45', 'index');
INSERT INTO `ke_user_log` VALUES ('4522', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-16 12:21:13', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('4523', '5', '/admin', '0:0:0:0:0:0:0:1', '2017-02-16 12:21:17', 'index');
INSERT INTO `ke_user_log` VALUES ('4524', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-16 12:21:20', 'index');
INSERT INTO `ke_user_log` VALUES ('4525', '5', '/admin', '0:0:0:0:0:0:0:1', '2017-02-16 12:21:35', 'index');
INSERT INTO `ke_user_log` VALUES ('4526', '5', '/admin', '0:0:0:0:0:0:0:1', '2017-02-16 12:21:36', 'index');
INSERT INTO `ke_user_log` VALUES ('4527', '5', '/admin', '0:0:0:0:0:0:0:1', '2017-02-16 12:22:11', 'index');
INSERT INTO `ke_user_log` VALUES ('4528', '5', '/admin', '0:0:0:0:0:0:0:1', '2017-02-16 12:22:12', 'index');
INSERT INTO `ke_user_log` VALUES ('4529', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-16 19:12:23', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('4530', '5', '/admin', '0:0:0:0:0:0:0:1', '2017-02-16 19:12:25', 'index');
INSERT INTO `ke_user_log` VALUES ('4531', '5', '/admin', '0:0:0:0:0:0:0:1', '2017-02-16 19:12:27', 'index');
INSERT INTO `ke_user_log` VALUES ('4532', '5', '/admin', '0:0:0:0:0:0:0:1', '2017-02-16 19:12:37', 'index');
INSERT INTO `ke_user_log` VALUES ('4533', '5', '/admin', '0:0:0:0:0:0:0:1', '2017-02-16 19:12:48', 'index');
INSERT INTO `ke_user_log` VALUES ('4534', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-16 19:13:43', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('4535', '5', '/admin', '0:0:0:0:0:0:0:1', '2017-02-16 19:13:43', 'index');
INSERT INTO `ke_user_log` VALUES ('4536', '5', '/admin/emcate', '0:0:0:0:0:0:0:1', '2017-02-16 19:13:54', 'index');
INSERT INTO `ke_user_log` VALUES ('4537', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-16 19:14:13', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('4538', '5', '/admin/emcate', '0:0:0:0:0:0:0:1', '2017-02-16 19:14:13', 'index');
INSERT INTO `ke_user_log` VALUES ('4539', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-16 19:14:15', 'index');
INSERT INTO `ke_user_log` VALUES ('4540', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-16 19:16:01', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('4541', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-16 19:16:01', 'index');
INSERT INTO `ke_user_log` VALUES ('4542', '5', '/admin', '0:0:0:0:0:0:0:1', '2017-02-16 19:16:33', 'index');
INSERT INTO `ke_user_log` VALUES ('4543', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-16 19:16:46', 'index');
INSERT INTO `ke_user_log` VALUES ('4544', '5', '/admin/menu/getMenuById', '0:0:0:0:0:0:0:1', '2017-02-16 19:16:51', 'getMenuById');
INSERT INTO `ke_user_log` VALUES ('4545', '5', '/admin/menu/save', '0:0:0:0:0:0:0:1', '2017-02-16 19:16:59', 'save');
INSERT INTO `ke_user_log` VALUES ('4546', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-16 19:16:59', 'index');
INSERT INTO `ke_user_log` VALUES ('4547', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-16 19:21:21', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('4548', '5', '/admin/menu/getMenuById', '0:0:0:0:0:0:0:1', '2017-02-16 19:21:21', 'getMenuById');
INSERT INTO `ke_user_log` VALUES ('4549', '5', '/admin/menu/save', '0:0:0:0:0:0:0:1', '2017-02-16 19:21:27', 'save');
INSERT INTO `ke_user_log` VALUES ('4550', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-16 19:21:27', 'index');
INSERT INTO `ke_user_log` VALUES ('4551', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-16 19:32:16', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('4552', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-16 19:32:16', 'index');
INSERT INTO `ke_user_log` VALUES ('4553', '5', '/admin/menu', '0:0:0:0:0:0:0:1', '2017-02-16 19:32:17', 'index');
INSERT INTO `ke_user_log` VALUES ('4554', '5', '/admin/emattr', '0:0:0:0:0:0:0:1', '2017-02-16 19:32:18', 'index');
INSERT INTO `ke_user_log` VALUES ('4555', '5', '/admin/emcate', '0:0:0:0:0:0:0:1', '2017-02-16 19:32:20', 'index');
INSERT INTO `ke_user_log` VALUES ('4556', '5', '/admin', '0:0:0:0:0:0:0:1', '2017-02-16 19:32:21', 'index');
INSERT INTO `ke_user_log` VALUES ('4557', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-16 19:50:33', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('4558', '5', '/admin/emgene', '0:0:0:0:0:0:0:1', '2017-02-16 19:50:33', 'index');
INSERT INTO `ke_user_log` VALUES ('4559', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-16 19:51:12', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('4560', '5', '/admin/emgene', '0:0:0:0:0:0:0:1', '2017-02-16 19:51:12', 'index');
INSERT INTO `ke_user_log` VALUES ('4561', '5', '用户登录', '0:0:0:0:0:0:0:1', '2017-02-16 19:51:42', 'ke_user_log');
INSERT INTO `ke_user_log` VALUES ('4562', '5', '/admin/emgene', '0:0:0:0:0:0:0:1', '2017-02-16 19:51:42', 'index');
INSERT INTO `ke_user_log` VALUES ('4563', '5', '/admin/emgene', '0:0:0:0:0:0:0:1', '2017-02-16 19:52:12', 'index');
INSERT INTO `ke_user_log` VALUES ('4564', '5', '/admin/knentry/add', '0:0:0:0:0:0:0:1', '2017-02-16 19:52:16', 'add');
INSERT INTO `ke_user_log` VALUES ('4565', '5', '/admin/emgene', '0:0:0:0:0:0:0:1', '2017-02-16 19:52:22', 'index');
INSERT INTO `ke_user_log` VALUES ('4566', '5', '/admin/emgene', '0:0:0:0:0:0:0:1', '2017-02-16 19:52:23', 'index');

-- ----------------------------
-- Table structure for `kn_entry`
-- ----------------------------
DROP TABLE IF EXISTS `kn_entry`;
CREATE TABLE `kn_entry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `knen_name` varchar(255) NOT NULL COMMENT '词条名称',
  `knen_text` text NOT NULL COMMENT '词条正文',
  `knen_kntr_id` int(11) NOT NULL COMMENT '所属知识树节点编号',
  `knen_time` datetime NOT NULL COMMENT '创建时间',
  `knen_last_time` datetime NOT NULL COMMENT '最后更新时间',
  `knen_status` int(11) NOT NULL DEFAULT '0' COMMENT '0:编辑状态，1:审核状态；9：发布状态',
  `knen_tag` varchar(255) DEFAULT NULL COMMENT '词条关键词',
  `knen_crea_user_id` int(11) DEFAULT NULL COMMENT '创建词条用户ID',
  `knen_last_user_id` int(11) DEFAULT NULL COMMENT '最后修改词条的用户ID',
  `knen_is_form` bit(1) DEFAULT b'0' COMMENT '该词条是否有公式',
  `knen_is_mole` bit(1) DEFAULT b'0' COMMENT '该词条是否包含分子式',
  `knen_is_file` bit(1) DEFAULT b'0' COMMENT '该词条是否含有可计算的数据文件',
  `knen_last_ip` varchar(45) DEFAULT NULL COMMENT '最后修改IP\n',
  `knen_secu_id` int(11) DEFAULT '1' COMMENT '密级',
  `knen_text_type` varchar(255) DEFAULT 'HTML' COMMENT '词条文本语言类型：WIKI，Markdown，HTML',
  PRIMARY KEY (`id`),
  KEY `fk_knen_kn_tree` (`knen_kntr_id`),
  CONSTRAINT `fk_knen_kn_tree` FOREIGN KEY (`knen_kntr_id`) REFERENCES `kn_tree` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='存放词条正文';

-- ----------------------------
-- Records of kn_entry
-- ----------------------------
INSERT INTO `kn_entry` VALUES ('6', '炸药', '<p>炸药是一种嫌贵不稳定的物质，在外界能量的作用下，能够自行发生急剧的化学变化，在极短的时间内突然释放出大量的能量，产生的爆炸产物快速向周围膨胀，产生强冲击波，造成对周围介质的破坏。</p><p>广义上，炸药指能发生化学爆炸的物质，包括化合物和混合物。火药、烟火剂、起爆药都属于炸药的范畴。但是技术上只将用于爆破目的的物质叫做炸药，又叫猛炸药，这是炸药的侠义概念。</p><p>炸药因其组成、物理性能、化学性能和爆炸性能的不同可分为很多种。通常有两种分类方法，一是按炸药的化学组分分类，一是按炸药的用途分类。</p>', '15', '2017-02-14 09:20:04', '2017-02-14 09:20:04', '0', '猛炸药,火药,烟火剂,起爆药', '5', '5', '', '', '', '0:0:0:0:0:0:0:1', '1', 'HTML');
INSERT INTO `kn_entry` VALUES ('7', '单质炸药', '<p>单质炸药是只含有一种化合物的炸药，在他们的分子内含有爆炸性基团，期中最重要的是硝基（—NO<sub>2</sub>）。根据硝基基团的连接方式可分为有C<span style=\"font-family: 微软雅黑; font-size: 18px;\">—NO</span><sub style=\"font-family: 微软雅黑; white-space: normal;\">2</sub>、N<span style=\"font-family: 微软雅黑; font-size: 18px;\">—NO</span><sub style=\"font-family: 微软雅黑; white-space: normal;\">2</sub>和O<span style=\"font-family: 微软雅黑; font-size: 18px;\">—NO</span><sub style=\"font-family: 微软雅黑; white-space: normal;\">2</sub>，分别形成了硝基化合物、硝铵和硝酸酯三类最重要的单质炸药。</p><p><strong>硝基化合物炸药</strong></p><p>目前用作炸药的硝基化合物主要是芳香族多硝基化合物。最常用的是以梯恩梯（TNT）为代表的单碳环多硝基化合物。此类扎奥的感度和能量大多数低于硝铵和硝酸酯类炸药，但其制造工艺成熟，原料廉价易得，因而被广泛应用。可用作炸药的脂肪族多硝基化合物主要有硝防系化合物，虽然其机械感度较高，但它们氧平衡较好，爆速和爆压较高，有的已获得实际应用。</p><p><br/></p><p><br/></p>', '4', '2017-02-11 20:25:35', '2017-02-11 20:25:35', '0', '单质炸药,硝基化合物', '5', '5', '', '', '', '0:0:0:0:0:0:0:1', '1', 'HTML');
INSERT INTO `kn_entry` VALUES ('8', '静电势', '<p>分子中心的原子核和核外电子在其周围空间某点上的静电势，取决于分子固有的结构和电荷分布，且有分子本身的性质决定，可以采用他来描述分子的性质。</p><p><img class=\"kfformula\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAacAAABDCAYAAAA4Tcq4AAAWNklEQVR4Xu3dBdAtzVEG4A4W3N2CS0GQQHAL7u4Q3IMEDRbcXYIGd/fg7hKCBAgOwd0JGqAearrYWlbP2bNnv+/2VN1K/nv37My+09Nv28zcJaoVAoVAIVAIFAIHQ+AuBxtPDacQKAQKgUKgEIgipxKCQqAQKAQKgcMhUOR0uCmpARUChUAhUAgUOZUMFAKFQCFQCBwOgSKnw01JDagQKAQKgUKgyKlkoBAoBAqBQuBwCBQ5HW5KakCFQCFQCBQCRU4lA4VAIVAIFAKHQ6DI6XBTUgMqBAqBQqAQKHIqGSgECoFCoBA4HAJFToebkhpQIVAIFAKFQJFTyUAhUAgUAoXA4RAocjrclNSACoFCoBAoBG4qOT1ORLxtRPxVRLxQRPxDRHxKRPzdTlP6aBHhz7+e0R/sHysi/iUi/vuM99wpP90Cc1g9ZkT8Z/tzW7G7b0Q8wQU+7lsj4hcv8N5rvnIrubrmN1y676usmZtITo8aEe8QET8REb8cEXeNiE9oCv79zySMJZP8ZBFxn4j4nIj48yU/mHjmpSLiOSPiC2+5sjwTptgS86eIiHeOiM+KiL88d2AH/T0Ced42th+JiB9eOc5niAh/nq9HcsjptVe+68iPbylXR/7Oc8d2lTVzE8npqSPiPSLioyLiHxvqrxARnxgRbxQRv3HuTEz8nsf2gRHxFRHxsA36gf8bt/d8TXlQg4hujblOGARvHhEfExH/vME8Hu0VSAUh8Z5EE57xjKiCd71V++N93vX7Ex8sGsBYfNf2zE9HxEMi4g86v3mMiHi1iHjhiHi3iHjAFQC8hFxd4TN263L3NXMUcnqi5ol8dUSwzqba00fEl0SEZx/YHnzxiPiuiHjFiLAYnjwi3iwiXiki7hkRv9pCgN8bEV8+oJA8f7+2AJ84IlibnvuyiPiP1ges3q6F4b5yQyKxSBDtFzdPcDdpuwEdXQpz7yUfFOkXbDiXR4JUaO9T24AQ1b3OHNwTtnWHmLx7rN0tIr4qIh4eER8cEb/Xwxf2bxIRn9vW2PttbCAgU54xZer/P15bx+8VEX99wlp+pmb0vlhEvHpE/E3D4S/au/w7/fWjTSdlH2fCfbif775mjkJOr9UE9ZubJSWHtKZRNCxhFl431PYiEYGQfrIpoynBeey2mH+sLa7/6g3g2RuBvXdE/O2awS14Vt7s3hFhocpBXas9TUTcPyI+4ALfeMo3XRJzCuWTI+LjL+xtz303g+r52zjmnl37798SEdaW9uER8WFrXzDwPMMQOY3ld18zIt4mIt5xIOxN3yDJL2q5q6FnzhmiORVVQcp0yNNGxEu2kPk3dULnp8iVEDyj9fMi4j1765SB+b4tCiLlgKhuY9t1zRyBnB6/KX0ekYX0OhHxAytmVtxY/oDwfW3PSiOE/g6ZILA/mXjvC7a+PyIi/q33HJwI5N+3/NCK4S16lHBbUKz4n130i+0fkhiWs3uJBUS+fe///42XxlyPimqEqmB/jaKUp2xz/jMR8ZEXAJW3I//Em9EQw9r8U39YmYtCfP0mH/yhEfH9Iwr6pSPiS5sxIOz3Wxt/s/Vu/SLPPx1596lyhUh5e+/UCKr/euFO0RyphreY6H/jT979dbutmSOQE8vxSVroTd7FQiW4S3IBFCp3nWKhYFRhdRviEmKQ0HvDiPj1kalEkCzLzx5ZME8aEZ/RnrlUTsukP1VEfPSVFKXQqMIMYRtEfu3wxB6YP1dEfEgrcFH5uWejyFn5vBn50kuQk+8R2vqF9mHmlpd2qapWc8aI+7hOPjgxFWYTutbeeqOcbX++WPbC8UhC6H2onSJXqtV42e8SEQh2yDOiw/Qp/JfphT3laa++dlsz1yanTEpKiKqcQhAEV5HAnGucxQQKJD59pNpNvJlXJWTGI1Dh128ZS/X3Y7kkipu7jjSzCGNrYXieiPigZpltHTacG6tFneRI+I5ATntgTj7InspLuco9G0+dInuNJuuXIiffhAB5NBqPR3TiEg2eDKzf7L2ccSgchijfsoXHLtF/em4v28L8Q4Ubp8gVHUM3KOR405ZP648/c208KHP685f4wAO8c7c1c21yermIEM5Li8qC/YaI+O6BuG5/XsSAWYHIh8ek8AHBdQWSMLHiWHMIT4iv3561WUQW71iui0tv0SHPS4V/eHmf35SIEvm9WpKzPoVVLd4jkNMemPt28y4ERHnu1XjqjJ1vbMTIaLokOfku4TxWv2Y9fNpOH8sAVb3HQBQS49Vcag35pNQhD2o53H4E5hS5eoGI+PYWrrSNZMhAVTEsvy0ntzTys9MUbNrNbmvmmuSkUkqFnIq7P27w5Z6lN2j7KcbyL2LLL9MEQX7IdyhJ/c6I+O3eVEjwi0ML/2X1Uj6iP2EdhRgPHplC1hjFISSoem+sWYSq+VQKsbSQLMX3h50feJfCDTH5/Ob8ZwUZPMCvi4jv21Scpl/GY1M4Yh5UV82Rk3kz1qmmmMQC7odZ8zeP0qxoe2Ye2kqKJZspFL9dirn5e90WHlOWbB7NdX+jKNL9nYj4lYFByw88RysEeeQOuJNVfaogVcnGIp8iJ88jMyHsqQZrxtWY4pd/Yrhlebn806U31BqzAiIGonym0NiYTGwFvTyeEDwdghC70ZClctUfi/mSK6NLhsLu5uczI4JeulTIcit8bsyauSY5qVATQmJpdBeUvxd6+Ppm+fSLE3gYrNx+aIJiI4z9kBgvwL4kXk/f8xEbvnuzIscUE2WM1BDft41IiLAF4aTkPMNjU7X0a61qKTd7+l5/z5Ls95dennDAWLx8KwHN9yBUVp7qKWO0+MbICQ4UjYpCrv1UU26LeFQ+9huFxXIXBmGcsGxVVckVsOZtJViCubFTFPohK+Tk5Vtn5CCT7Txe3zi2p8l8vOoCT30r7OVeeDCMAYQxRU4wIntLwnDkU7Xq1MZiBt0PtQ9BTAjqUvmnS5eM9+eDTJJPRUs/3tlm0t37uESu+u/tRl8YOX0doF97H5+7VeyN5bW3kp9z3nOj1sy1yAl7U3IUUj8unN4TQXj9CY9m6SSNlYCysJRMf2xE/NnEyzLRyXsayllRtr6FpyAsl2RKaJUpIxuFBqw2zxFuVvNQQw4sS2PqNkpXqeopTYhUXiX3a3XfAV+FAFnBNUZOWXjCq/GNvpUiEMYQDhTSQAJTnqV+yZsyYyFWijS9x1QaCNt7LSJKewzzDEUie6STYRayw0P2PoaI97FkbQAdqwBFxuRgyLA5Be+p3xgXDx9OZC5la8hzYvCQHwU9P9iILIsNHtE8EWHBtcqQAaAQQ2MYwucSLSvzkOC5JeNZkftJI9WsaRyaY6SfoSfy3K2um1vLQzgooKCn7tFIiAeukVF5bNsvGHcI8dJe4TnzdOPWzLXISVz4RZvSHApDIBSVe3JRQmPnTHrGiynRzKUgCuWmQkoU7FSbE2gK0mZfoYT+OLn5lBHlR8iRwVBVYfZvMWmXzj/oQ0mwkFh33GPkZD7k9LLwxLcI0xgnS5XSRMJzRSyw4uUI7yDsbElOxmSOtClyQoQUniq3fk7BhmqhPX/sGeM1GfdYPhE5+e498my8NGPKsO0YOaV8CjULd2rGad34FqE55MtzPOUIpu7xRryyobLwcxThXGWeb7GJdUkpeW7EZhQx0vpGRp5IIbRmreU8p1FqvZHVf+8YA2NGz9A3C3sL0f9SC9uT9yQnxRGInvzAcE0ubY5wz8F/6Lc3bs1cg5xYt7wAykfMfaixSlj78ghix2OexpIJfJZGdDyarLSZ2tPUf+ccOVHaFpod8f1GyfhWFq4Q4s/N7GPai5x4Qu/e9oZ1Pdcxcnr0tvCSfCkXoTD5OvPphAvKY8qKz/0l4vf9Y6ay5N8c8WDkpKbISRGLvBeFMdTevhkeLGrvkosaa3uREwsbASKX9K6nPCfly56j8GCnktM2C8QmfKygQo6QF7W2MQIQFJIjt/57qzZXmUdekAWvbWjN9MdhbPYXqWw0r/2iJkVVvEtru0tcuceRV8obd0jz3FoewoCsMpSH0gIZ5RE5WKOn5gh3q7novufGrZlrkBNLhDusfHfK0iB0lIowRIZoTpm0FEjHjPBcKOOpPU39Pixgm2ONYyisNzcmCklIzUGcc2e5IYd/GijcmOtj7b/LPfB+WITdNpVzyueyXJdVL0SJWBgSiGpqD1jiyHPoVzyldfodTXHlsUKnYo5w5BKfro1tbEOmb/IsL1oxS1rF/v71BvBZgrN8G2+k60UyBoSXvqfnLUyRU7cvVq88JTKi0HkFlHH/pIIl48tnsrxcxetWhRFLKvOUWisnF7ru55P744cbz4Txh2Csw+45fFngIArT32Sf5MQwzEjE2rWc7xf5GMo3GW8WXCl0WporniNc70V8IgO8wbVN/lG4No9YWvL7LdbMkn4WP7M3OZlsQibpPbeZNStgeCZrrJL+x2cVHOWDFC0Oben5eBlykkgeKkWfA9ukU0xOsJiy4LMfRQRLhXyu76F/hyulL9+DCLuN0oOPikEkIqTU3//j3xV/mEdzSAkIDfLEpuY0CUiotp9Ty6IVhACnczHP42kQ6JwRpG9H3Jyj6Ofmwf4eZADLrkHmO20OF0FAZpQ1K72fAxV+5XnnGM8ds0IM8syL48Fs0ZZU5tE35ESec4mMi3AImVt3quUYL13ZSbJJ8upeYZNHlyGNLGJYK1e5qffZmmHb3+LR3Uc5tjl3LeFuMRenvONoa+Z/wwV7NjkHLjDltqRs14Jk3RPIoQq3JWPvWj8SzCySqT1NQ+9kHVkAp+yFQU5yLA67HAtj6jMFXR99D+1SBRH9b13iOdmsayGm9+P75JHmNh7KtzBKzGm3VD4VxjP3jn05B3MLjdJldc8dByV3JU+1R56vj/cSzylD3Igt5Q82yL7v7S1ZD57hKSmCmTrAdem7PLe0Mo/cWINkaC5UTy54iowZFbjIzOZeYfIlYVHzas0JI3dPRF8jV2P5psQmjywSgl16I8Ic4a7BfctnD7dm9iQnJMFFpZjmBDNBZ7lYkDbqzin3qYnilgupCYmcUgFI8OS/MrG6Rigob9cDWBRThKxsmCX7PgN7tdb0d86zc+RkPhQyqEzK8+h8n/8eC3sYTxoIcOQddcNIvDXHRiG7TP77zTmYdwtRpk70yDJhuZxTvOJzsPbbJeRka4XqPko2idY8vfLEaQVT40pPSbXkFo0OmTvMFdG8SluDvmFsI2t3PIxYWwyM93HbZvusEk0PKefPf3fXV8qpmwr6p86vkas0qBjHQ+s3/x3RZ1jRt9rnmFV93W9aQrhbzMkp7zjcmtmTnHw8S40ntMRrSoAJqX0EwkinHtCZYSOl3G7MXdO/cZxznpTFIEQ2tkcqv/OUY1VOEcKx3ySBKJkdq1wTXqIsKJr07iTnhQGFXMYIOMMviEjxhLyB8JYiASFBnlf/0N5zMBfSYUwg+6km7ybsx2va81SOHFMei6NUfMhzy4S7sJJCkTz/LzeF9r3QOXkQWrQvTM5xq/1NmduRU3WGX796kELOqyuMb8n9TchFvkWOzvuQkM3tCnP6Jf+5FYCnJFSdJdPyUEPXcSyVq27EZex0mTwVwjhzzfQrMtcS7twcXurfD7dm9iKnrNQS3jq1UYbix1MXnY29mwALB5y63+LUU8OzeEA4a+qsrcTnUqeeT2Fu4fNmkJLcnvusEAXvtpv/oBgUkvBiKZjc7EyRCNNSIoyIoSs/Mjxiv4gKO8UpCgeERfQxlKs6FXPfap4VQcwZBLwSoTG5nCUHDZ8qu/3f2WNH4enfHUFOy5e4d4KF/1X2rKXnoEzZMV2Zr7I9QrgLoSH2JY2nhJwQxVbEtKTftc/kXjihuG74d8yr97yiDrqBR87gMJe8zSFZnJOrvFBREQois4blAM3NH/WuAUG8ijvkxcybxoCwPaV/5c4awl2L2RbPH27N7EVOW4B37XfwGizsNZWDLGOELBw4VTZrIXhOufBUXuraGJza/1i+ae59p2Aud6fgQ6hwyiBIw4FCU4Rxm1vejMtjOrcyTzFFvu8SmKlko/DlmLvkIjTPiELq/SPK1o7jFLla20f3+bWEe05fp/z2kGumyGn5VLJ8LBi71OcqDfOtS0N1QgJ5lP+ajXzLR3+9JzM8Yl/U0qRxjvYUzIWZ5Bd5d1P3d3lOfk/oZ+9T4PecDUSiMk95+7l3ORk370to95QIxtx350kkwpz9sy6tEcbbOZW758jV3Nin/n0Pwj1nfIdcM0VO66ZUtZE/lN+SUyu4yvYBTd3RJO8iHOZEg+4tvutGdtynp/Y3LRn1WszlAVjYU6XhlCDMFWB0izCWjOcmPbN1ybjQoLwxwtu6OZuOx4R8VNPaWGt/IONGGFO/iqIYFMKcQwUHa8a0Vq7WvLv77F6Ee+r4/O6Qa6bIad2UwktYQZMrmfJy8oIyC2nslPG8z8rBtA9bN5Qb83Tmm+QATrlIcQ3mQBH+kc8aK/tf+74bA/TAQHlKwnjnlowjI8VIwoI2d261N+qa2O4hB3sT7ql4HnLNFDmtn06WkHJ0ey4eMvFz5CTZrrhg6Pwzx+ogOgUCS0vr14/2+r9ATvJ0QqI/deJwlmIOU9a3jcxjeQmFHwoxbIjuJ61PHN4hf4ZAVNCdQkyZVxKOQkjd442EWo9cULFmMpbK1Zp33rRnD7tmipxumijVeAuBeQQQUv/usvlfzT/hlIat9kfN91ZP3NEIFDnd0dNfH39LEUBOvJ+tmxD1udV+W4+p3ndLEShyuqUTW59VCBQChcBNRqDI6SbPXo29ECgECoFbikCR0y2d2PqsQuAEBNz549ggtwn/7gm/r58UApshUOS0GZT1okLgRiOgck1Vpc26W2x0vdFg1OCvj0CR0/XnoEZQCBwBAVc5uHHWIbMOlO3f43WEMdYY7iAEipzuoMmuTy0ERhCwGfx+7ZZem6UdRvugQqsQuCYCRU7XRL/6LgSOgYCDed0t9dB2krujn65xv9Ux0KhRHAKBIqdDTEMNohC4GgJuAc5Nu3ldinPtnOhRrRC4GgJFTleDvjouBK6OQP8qh7z80H1Ebn+tVghcDYEip6tBXx0XAldHwJl5TsN3iPEjIsK9Pq6lcA+Wm6fzOvSrD7QGcOchUOR05815fXEhAAGl426HVviQV9S72TXP5Ju6cqQQLAQujkCR08Uhrg4KgUMioHTcZZgPiIhHthHmNS93i4h73/JLGA85KTWo/0OgyKmkoRC48xDIe8QeOHCj7f0j4l7tYr/bePnlnTfbN/SLi5xu6MTVsAuBExDIW2XvExH3bLcFuwjTvVZ3bbc8yzXdvV3a6N+mrro/YQj1k0JgGQJFTstwqqcKgUKgECgEdkSgyGlHsKurQqAQKAQKgWUIFDktw6meKgQKgUKgENgRgSKnHcGurgqBQqAQKASWIVDktAyneqoQKAQKgUJgRwSKnHYEu7oqBAqBQqAQWIZAkdMynOqpQqAQKAQKgR0RKHLaEezqqhAoBAqBQmAZAkVOy3CqpwqBQqAQKAR2RKDIaUewq6tCoBAoBAqBZQgUOS3DqZ4qBAqBQqAQ2BGBIqcdwa6uCoFCoBAoBJYh8D8pJiqPmzS2UwAAAABJRU5ErkJggg==\" data-latex=\"{\\Delta }^{2}V(\\gamma )=4\\pi \\rho (\\gamma )-4\\pi \\sum _{A} {{Z}_{A}}\\delta ({R}_{A}-\\gamma )\"/></p>', '62', '2017-02-12 19:04:47', '2017-02-12 19:04:47', '0', '静电势,感度', '5', '5', '', '', '', '0:0:0:0:0:0:0:1', '1', 'HTML');
INSERT INTO `kn_entry` VALUES ('9', '最小键级法', '<p>所为的最小键级法师用化合物体系中最弱键级来判定感°</p><p><br/></p>', '62', '2017-02-14 09:19:38', '2017-02-14 09:19:38', '0', '最小键级法,感度', '5', '5', '', '', '', '0:0:0:0:0:0:0:1', '1', 'HTML');

-- ----------------------------
-- Table structure for `kn_entry_history`
-- ----------------------------
DROP TABLE IF EXISTS `kn_entry_history`;
CREATE TABLE `kn_entry_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kneh_knen_id` int(11) NOT NULL COMMENT '所属词条id',
  `kneh_opra_type` int(11) NOT NULL DEFAULT '0' COMMENT '操作类型，0：新增，1：修改，2：审核',
  `kneh_user_id` int(11) DEFAULT NULL COMMENT '操作用户ID',
  `kneh_time` datetime DEFAULT NULL COMMENT '操作时间',
  `kneh_ip` varchar(45) DEFAULT NULL COMMENT '操作IP',
  `kneh_text` text COMMENT '本次操作结果的词条文本',
  PRIMARY KEY (`id`),
  KEY `fk_kneh_kn_entry` (`kneh_knen_id`),
  KEY `fk_kneh_ke_user` (`kneh_user_id`),
  CONSTRAINT `fk_kneh_ke_user` FOREIGN KEY (`kneh_user_id`) REFERENCES `ke_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_kneh_kn_entry` FOREIGN KEY (`kneh_knen_id`) REFERENCES `kn_entry` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='词条的编辑历史';

-- ----------------------------
-- Records of kn_entry_history
-- ----------------------------

-- ----------------------------
-- Table structure for `kn_entr_file`
-- ----------------------------
DROP TABLE IF EXISTS `kn_entr_file`;
CREATE TABLE `kn_entr_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entr_id` int(11) DEFAULT NULL,
  `knfi_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_entry_file` (`entr_id`),
  KEY `fk_entry_entry` (`knfi_id`),
  CONSTRAINT `fk_entry_entry` FOREIGN KEY (`knfi_id`) REFERENCES `kn_file` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_entry_file` FOREIGN KEY (`entr_id`) REFERENCES `kn_entry` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kn_entr_file
-- ----------------------------

-- ----------------------------
-- Table structure for `kn_entr_form`
-- ----------------------------
DROP TABLE IF EXISTS `kn_entr_form`;
CREATE TABLE `kn_entr_form` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entr_id` int(11) DEFAULT NULL COMMENT '词条编号',
  `form_id` int(11) DEFAULT NULL COMMENT '公式编号',
  PRIMARY KEY (`id`),
  KEY `fk_to_entry` (`entr_id`),
  KEY `fk_to_formu` (`form_id`),
  CONSTRAINT `fk_to_entry` FOREIGN KEY (`entr_id`) REFERENCES `kn_entry` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_to_formu` FOREIGN KEY (`form_id`) REFERENCES `kn_formula` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kn_entr_form
-- ----------------------------
INSERT INTO `kn_entr_form` VALUES ('2', '8', '22');

-- ----------------------------
-- Table structure for `kn_entr_mole`
-- ----------------------------
DROP TABLE IF EXISTS `kn_entr_mole`;
CREATE TABLE `kn_entr_mole` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entr_id` int(11) DEFAULT NULL COMMENT '词条id',
  `mole_id` int(11) DEFAULT NULL COMMENT '分子式id',
  PRIMARY KEY (`id`),
  KEY `fk_re_entry` (`entr_id`),
  KEY `fk_re_mole` (`mole_id`),
  CONSTRAINT `fk_re_entry` FOREIGN KEY (`entr_id`) REFERENCES `kn_entry` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_re_mole` FOREIGN KEY (`mole_id`) REFERENCES `kn_molecular` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kn_entr_mole
-- ----------------------------
INSERT INTO `kn_entr_mole` VALUES ('13', '7', '3');
INSERT INTO `kn_entr_mole` VALUES ('17', '6', '4');
INSERT INTO `kn_entr_mole` VALUES ('18', '6', '3');
INSERT INTO `kn_entr_mole` VALUES ('19', '6', '2');

-- ----------------------------
-- Table structure for `kn_file`
-- ----------------------------
DROP TABLE IF EXISTS `kn_file`;
CREATE TABLE `kn_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `knfi_kntr_id` int(11) DEFAULT NULL COMMENT '所属结构树ID',
  `knfi_ename` varchar(255) DEFAULT NULL COMMENT '文件名',
  `knfi_path` varchar(255) DEFAULT NULL COMMENT '数据文件存放位置',
  `knfi_desc` text COMMENT '文件描述',
  `knfi_type` varchar(20) DEFAULT NULL COMMENT '文件类型',
  `knfi_user_id` int(11) DEFAULT NULL COMMENT '创建文件的用户',
  `knfi_time` datetime DEFAULT NULL COMMENT '文件创建时间',
  `knfi_size` bigint(20) DEFAULT NULL COMMENT '文件大小',
  `knfi_tag` varchar(255) DEFAULT NULL COMMENT '文件标签，多个，中间用"，"隔开',
  PRIMARY KEY (`id`),
  KEY `fk_knfi_kn-tree` (`knfi_kntr_id`),
  CONSTRAINT `fk_knfi_kn?tree` FOREIGN KEY (`knfi_kntr_id`) REFERENCES `kn_tree` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='存放词条中的数据文件';

-- ----------------------------
-- Records of kn_file
-- ----------------------------

-- ----------------------------
-- Table structure for `kn_formula`
-- ----------------------------
DROP TABLE IF EXISTS `kn_formula`;
CREATE TABLE `kn_formula` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `knfo_kntr_id` int(11) DEFAULT NULL COMMENT '对应的结构树ID',
  `knfo_text` text COMMENT '公式图片，base64编码',
  `knfo_code` text COMMENT '该公式对应的程序代码',
  `knfo_lang` varchar(45) DEFAULT NULL COMMENT '代码对应的程序设计语言',
  `knfo_user_id` int(11) DEFAULT NULL COMMENT '添加用户',
  `knfo_input` text COMMENT '公式计算的输入数据',
  `knfo_desc` text COMMENT '公式描述',
  `knfo_name` varchar(255) DEFAULT NULL COMMENT '公式名称',
  `knfo_time` datetime DEFAULT NULL COMMENT '添加时间',
  `knfo_tag` varchar(255) DEFAULT NULL COMMENT '公式标签，多个，中间用“，”隔开',
  `knfo_input_desc` text COMMENT '计算输入数据的格式说明',
  `knfo_latex` text COMMENT '公式的Latex表示',
  `knfo_png` varchar(255) DEFAULT NULL COMMENT '图片文件名',
  PRIMARY KEY (`id`),
  KEY `fk_knfo_kn_tree` (`knfo_kntr_id`),
  CONSTRAINT `fk_knfo_kn_tree` FOREIGN KEY (`knfo_kntr_id`) REFERENCES `kn_tree` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COMMENT='词条中对应的公式';

-- ----------------------------
-- Records of kn_formula
-- ----------------------------
INSERT INTO `kn_formula` VALUES ('22', '62', '<img class=\"kfformula\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAacAAABDCAYAAAA4Tcq4AAAWNklEQVR4Xu3dBdAtzVEG4A4W3N2CS0GQQHAL7u4Q3IMEDRbcXYIGd/fg7hKCBAgOwd0JGqAearrYWlbP2bNnv+/2VN1K/nv37My+09Nv28zcJaoVAoVAIVAIFAIHQ+AuBxtPDacQKAQKgUKgEIgipxKCQqAQKAQKgcMhUOR0uCmpARUChUAhUAgUOZUMFAKFQCFQCBwOgSKnw01JDagQKAQKgUKgyKlkoBAoBAqBQuBwCBQ5HW5KakCFQCFQCBQCRU4lA4VAIVAIFAKHQ6DI6XBTUgMqBAqBQqAQKHIqGSgECoFCoBA4HAJFToebkhpQIVAIFAKFQJFTyUAhUAgUAoXA4RAocjrclNSACoFCoBAoBG4qOT1ORLxtRPxVRLxQRPxDRHxKRPzdTlP6aBHhz7+e0R/sHysi/iUi/vuM99wpP90Cc1g9ZkT8Z/tzW7G7b0Q8wQU+7lsj4hcv8N5rvnIrubrmN1y676usmZtITo8aEe8QET8REb8cEXeNiE9oCv79zySMJZP8ZBFxn4j4nIj48yU/mHjmpSLiOSPiC2+5sjwTptgS86eIiHeOiM+KiL88d2AH/T0Ced42th+JiB9eOc5niAh/nq9HcsjptVe+68iPbylXR/7Oc8d2lTVzE8npqSPiPSLioyLiHxvqrxARnxgRbxQRv3HuTEz8nsf2gRHxFRHxsA36gf8bt/d8TXlQg4hujblOGARvHhEfExH/vME8Hu0VSAUh8Z5EE57xjKiCd71V++N93vX7Ex8sGsBYfNf2zE9HxEMi4g86v3mMiHi1iHjhiHi3iHjAFQC8hFxd4TN263L3NXMUcnqi5ol8dUSwzqba00fEl0SEZx/YHnzxiPiuiHjFiLAYnjwi3iwiXiki7hkRv9pCgN8bEV8+oJA8f7+2AJ84IlibnvuyiPiP1ges3q6F4b5yQyKxSBDtFzdPcDdpuwEdXQpz7yUfFOkXbDiXR4JUaO9T24AQ1b3OHNwTtnWHmLx7rN0tIr4qIh4eER8cEb/Xwxf2bxIRn9vW2PttbCAgU54xZer/P15bx+8VEX99wlp+pmb0vlhEvHpE/E3D4S/au/w7/fWjTSdlH2fCfbif775mjkJOr9UE9ZubJSWHtKZRNCxhFl431PYiEYGQfrIpoynBeey2mH+sLa7/6g3g2RuBvXdE/O2awS14Vt7s3hFhocpBXas9TUTcPyI+4ALfeMo3XRJzCuWTI+LjL+xtz303g+r52zjmnl37798SEdaW9uER8WFrXzDwPMMQOY3ld18zIt4mIt5xIOxN3yDJL2q5q6FnzhmiORVVQcp0yNNGxEu2kPk3dULnp8iVEDyj9fMi4j1765SB+b4tCiLlgKhuY9t1zRyBnB6/KX0ekYX0OhHxAytmVtxY/oDwfW3PSiOE/g6ZILA/mXjvC7a+PyIi/q33HJwI5N+3/NCK4S16lHBbUKz4n130i+0fkhiWs3uJBUS+fe///42XxlyPimqEqmB/jaKUp2xz/jMR8ZEXAJW3I//Em9EQw9r8U39YmYtCfP0mH/yhEfH9Iwr6pSPiS5sxIOz3Wxt/s/Vu/SLPPx1596lyhUh5e+/UCKr/euFO0RyphreY6H/jT979dbutmSOQE8vxSVroTd7FQiW4S3IBFCp3nWKhYFRhdRviEmKQ0HvDiPj1kalEkCzLzx5ZME8aEZ/RnrlUTsukP1VEfPSVFKXQqMIMYRtEfu3wxB6YP1dEfEgrcFH5uWejyFn5vBn50kuQk+8R2vqF9mHmlpd2qapWc8aI+7hOPjgxFWYTutbeeqOcbX++WPbC8UhC6H2onSJXqtV42e8SEQh2yDOiw/Qp/JfphT3laa++dlsz1yanTEpKiKqcQhAEV5HAnGucxQQKJD59pNpNvJlXJWTGI1Dh128ZS/X3Y7kkipu7jjSzCGNrYXieiPigZpltHTacG6tFneRI+I5ATntgTj7InspLuco9G0+dInuNJuuXIiffhAB5NBqPR3TiEg2eDKzf7L2ccSgchijfsoXHLtF/em4v28L8Q4Ubp8gVHUM3KOR405ZP648/c208KHP685f4wAO8c7c1c21yermIEM5Li8qC/YaI+O6BuG5/XsSAWYHIh8ek8AHBdQWSMLHiWHMIT4iv3561WUQW71iui0tv0SHPS4V/eHmf35SIEvm9WpKzPoVVLd4jkNMemPt28y4ERHnu1XjqjJ1vbMTIaLokOfku4TxWv2Y9fNpOH8sAVb3HQBQS49Vcag35pNQhD2o53H4E5hS5eoGI+PYWrrSNZMhAVTEsvy0ntzTys9MUbNrNbmvmmuSkUkqFnIq7P27w5Z6lN2j7KcbyL2LLL9MEQX7IdyhJ/c6I+O3eVEjwi0ML/2X1Uj6iP2EdhRgPHplC1hjFISSoem+sWYSq+VQKsbSQLMX3h50feJfCDTH5/Ob8ZwUZPMCvi4jv21Scpl/GY1M4Yh5UV82Rk3kz1qmmmMQC7odZ8zeP0qxoe2Ye2kqKJZspFL9dirn5e90WHlOWbB7NdX+jKNL9nYj4lYFByw88RysEeeQOuJNVfaogVcnGIp8iJ88jMyHsqQZrxtWY4pd/Yrhlebn806U31BqzAiIGonym0NiYTGwFvTyeEDwdghC70ZClctUfi/mSK6NLhsLu5uczI4JeulTIcit8bsyauSY5qVATQmJpdBeUvxd6+Ppm+fSLE3gYrNx+aIJiI4z9kBgvwL4kXk/f8xEbvnuzIscUE2WM1BDft41IiLAF4aTkPMNjU7X0a61qKTd7+l5/z5Ls95dennDAWLx8KwHN9yBUVp7qKWO0+MbICQ4UjYpCrv1UU26LeFQ+9huFxXIXBmGcsGxVVckVsOZtJViCubFTFPohK+Tk5Vtn5CCT7Txe3zi2p8l8vOoCT30r7OVeeDCMAYQxRU4wIntLwnDkU7Xq1MZiBt0PtQ9BTAjqUvmnS5eM9+eDTJJPRUs/3tlm0t37uESu+u/tRl8YOX0doF97H5+7VeyN5bW3kp9z3nOj1sy1yAl7U3IUUj8unN4TQXj9CY9m6SSNlYCysJRMf2xE/NnEyzLRyXsayllRtr6FpyAsl2RKaJUpIxuFBqw2zxFuVvNQQw4sS2PqNkpXqeopTYhUXiX3a3XfAV+FAFnBNUZOWXjCq/GNvpUiEMYQDhTSQAJTnqV+yZsyYyFWijS9x1QaCNt7LSJKewzzDEUie6STYRayw0P2PoaI97FkbQAdqwBFxuRgyLA5Be+p3xgXDx9OZC5la8hzYvCQHwU9P9iILIsNHtE8EWHBtcqQAaAQQ2MYwucSLSvzkOC5JeNZkftJI9WsaRyaY6SfoSfy3K2um1vLQzgooKCn7tFIiAeukVF5bNsvGHcI8dJe4TnzdOPWzLXISVz4RZvSHApDIBSVe3JRQmPnTHrGiynRzKUgCuWmQkoU7FSbE2gK0mZfoYT+OLn5lBHlR8iRwVBVYfZvMWmXzj/oQ0mwkFh33GPkZD7k9LLwxLcI0xgnS5XSRMJzRSyw4uUI7yDsbElOxmSOtClyQoQUniq3fk7BhmqhPX/sGeM1GfdYPhE5+e498my8NGPKsO0YOaV8CjULd2rGad34FqE55MtzPOUIpu7xRryyobLwcxThXGWeb7GJdUkpeW7EZhQx0vpGRp5IIbRmreU8p1FqvZHVf+8YA2NGz9A3C3sL0f9SC9uT9yQnxRGInvzAcE0ubY5wz8F/6Lc3bs1cg5xYt7wAykfMfaixSlj78ghix2OexpIJfJZGdDyarLSZ2tPUf+ccOVHaFpod8f1GyfhWFq4Q4s/N7GPai5x4Qu/e9oZ1Pdcxcnr0tvCSfCkXoTD5OvPphAvKY8qKz/0l4vf9Y6ay5N8c8WDkpKbISRGLvBeFMdTevhkeLGrvkosaa3uREwsbASKX9K6nPCfly56j8GCnktM2C8QmfKygQo6QF7W2MQIQFJIjt/57qzZXmUdekAWvbWjN9MdhbPYXqWw0r/2iJkVVvEtru0tcuceRV8obd0jz3FoewoCsMpSH0gIZ5RE5WKOn5gh3q7novufGrZlrkBNLhDusfHfK0iB0lIowRIZoTpm0FEjHjPBcKOOpPU39Pixgm2ONYyisNzcmCklIzUGcc2e5IYd/GijcmOtj7b/LPfB+WITdNpVzyueyXJdVL0SJWBgSiGpqD1jiyHPoVzyldfodTXHlsUKnYo5w5BKfro1tbEOmb/IsL1oxS1rF/v71BvBZgrN8G2+k60UyBoSXvqfnLUyRU7cvVq88JTKi0HkFlHH/pIIl48tnsrxcxetWhRFLKvOUWisnF7ru55P744cbz4Txh2Csw+45fFngIArT32Sf5MQwzEjE2rWc7xf5GMo3GW8WXCl0WporniNc70V8IgO8wbVN/lG4No9YWvL7LdbMkn4WP7M3OZlsQibpPbeZNStgeCZrrJL+x2cVHOWDFC0Oben5eBlykkgeKkWfA9ukU0xOsJiy4LMfRQRLhXyu76F/hyulL9+DCLuN0oOPikEkIqTU3//j3xV/mEdzSAkIDfLEpuY0CUiotp9Ty6IVhACnczHP42kQ6JwRpG9H3Jyj6Ofmwf4eZADLrkHmO20OF0FAZpQ1K72fAxV+5XnnGM8ds0IM8syL48Fs0ZZU5tE35ESec4mMi3AImVt3quUYL13ZSbJJ8upeYZNHlyGNLGJYK1e5qffZmmHb3+LR3Uc5tjl3LeFuMRenvONoa+Z/wwV7NjkHLjDltqRs14Jk3RPIoQq3JWPvWj8SzCySqT1NQ+9kHVkAp+yFQU5yLA67HAtj6jMFXR99D+1SBRH9b13iOdmsayGm9+P75JHmNh7KtzBKzGm3VD4VxjP3jn05B3MLjdJldc8dByV3JU+1R56vj/cSzylD3Igt5Q82yL7v7S1ZD57hKSmCmTrAdem7PLe0Mo/cWINkaC5UTy54iowZFbjIzOZeYfIlYVHzas0JI3dPRF8jV2P5psQmjywSgl16I8Ic4a7BfctnD7dm9iQnJMFFpZjmBDNBZ7lYkDbqzin3qYnilgupCYmcUgFI8OS/MrG6Rigob9cDWBRThKxsmCX7PgN7tdb0d86zc+RkPhQyqEzK8+h8n/8eC3sYTxoIcOQddcNIvDXHRiG7TP77zTmYdwtRpk70yDJhuZxTvOJzsPbbJeRka4XqPko2idY8vfLEaQVT40pPSbXkFo0OmTvMFdG8SluDvmFsI2t3PIxYWwyM93HbZvusEk0PKefPf3fXV8qpmwr6p86vkas0qBjHQ+s3/x3RZ1jRt9rnmFV93W9aQrhbzMkp7zjcmtmTnHw8S40ntMRrSoAJqX0EwkinHtCZYSOl3G7MXdO/cZxznpTFIEQ2tkcqv/OUY1VOEcKx3ySBKJkdq1wTXqIsKJr07iTnhQGFXMYIOMMviEjxhLyB8JYiASFBnlf/0N5zMBfSYUwg+6km7ybsx2va81SOHFMei6NUfMhzy4S7sJJCkTz/LzeF9r3QOXkQWrQvTM5xq/1NmduRU3WGX796kELOqyuMb8n9TchFvkWOzvuQkM3tCnP6Jf+5FYCnJFSdJdPyUEPXcSyVq27EZex0mTwVwjhzzfQrMtcS7twcXurfD7dm9iKnrNQS3jq1UYbix1MXnY29mwALB5y63+LUU8OzeEA4a+qsrcTnUqeeT2Fu4fNmkJLcnvusEAXvtpv/oBgUkvBiKZjc7EyRCNNSIoyIoSs/Mjxiv4gKO8UpCgeERfQxlKs6FXPfap4VQcwZBLwSoTG5nCUHDZ8qu/3f2WNH4enfHUFOy5e4d4KF/1X2rKXnoEzZMV2Zr7I9QrgLoSH2JY2nhJwQxVbEtKTftc/kXjihuG74d8yr97yiDrqBR87gMJe8zSFZnJOrvFBREQois4blAM3NH/WuAUG8ijvkxcybxoCwPaV/5c4awl2L2RbPH27N7EVOW4B37XfwGizsNZWDLGOELBw4VTZrIXhOufBUXuraGJza/1i+ae59p2Aud6fgQ6hwyiBIw4FCU4Rxm1vejMtjOrcyTzFFvu8SmKlko/DlmLvkIjTPiELq/SPK1o7jFLla20f3+bWEe05fp/z2kGumyGn5VLJ8LBi71OcqDfOtS0N1QgJ5lP+ajXzLR3+9JzM8Yl/U0qRxjvYUzIWZ5Bd5d1P3d3lOfk/oZ+9T4PecDUSiMk95+7l3ORk370to95QIxtx350kkwpz9sy6tEcbbOZW758jV3Nin/n0Pwj1nfIdcM0VO66ZUtZE/lN+SUyu4yvYBTd3RJO8iHOZEg+4tvutGdtynp/Y3LRn1WszlAVjYU6XhlCDMFWB0izCWjOcmPbN1ybjQoLwxwtu6OZuOx4R8VNPaWGt/IONGGFO/iqIYFMKcQwUHa8a0Vq7WvLv77F6Ee+r4/O6Qa6bIad2UwktYQZMrmfJy8oIyC2nslPG8z8rBtA9bN5Qb83Tmm+QATrlIcQ3mQBH+kc8aK/tf+74bA/TAQHlKwnjnlowjI8VIwoI2d261N+qa2O4hB3sT7ql4HnLNFDmtn06WkHJ0ey4eMvFz5CTZrrhg6Pwzx+ogOgUCS0vr14/2+r9ATvJ0QqI/deJwlmIOU9a3jcxjeQmFHwoxbIjuJ61PHN4hf4ZAVNCdQkyZVxKOQkjd442EWo9cULFmMpbK1Zp33rRnD7tmipxumijVeAuBeQQQUv/usvlfzT/hlIat9kfN91ZP3NEIFDnd0dNfH39LEUBOvJ+tmxD1udV+W4+p3ndLEShyuqUTW59VCBQChcBNRqDI6SbPXo29ECgECoFbikCR0y2d2PqsQuAEBNz549ggtwn/7gm/r58UApshUOS0GZT1okLgRiOgck1Vpc26W2x0vdFg1OCvj0CR0/XnoEZQCBwBAVc5uHHWIbMOlO3f43WEMdYY7iAEipzuoMmuTy0ERhCwGfx+7ZZem6UdRvugQqsQuCYCRU7XRL/6LgSOgYCDed0t9dB2krujn65xv9Ux0KhRHAKBIqdDTEMNohC4GgJuAc5Nu3ldinPtnOhRrRC4GgJFTleDvjouBK6OQP8qh7z80H1Ebn+tVghcDYEip6tBXx0XAldHwJl5TsN3iPEjIsK9Pq6lcA+Wm6fzOvSrD7QGcOchUOR05815fXEhAAGl426HVviQV9S72TXP5Ju6cqQQLAQujkCR08Uhrg4KgUMioHTcZZgPiIhHthHmNS93i4h73/JLGA85KTWo/0OgyKmkoRC48xDIe8QeOHCj7f0j4l7tYr/bePnlnTfbN/SLi5xu6MTVsAuBExDIW2XvExH3bLcFuwjTvVZ3bbc8yzXdvV3a6N+mrro/YQj1k0JgGQJFTstwqqcKgUKgECgEdkSgyGlHsKurQqAQKAQKgWUIFDktw6meKgQKgUKgENgRgSKnHcGurgqBQqAQKASWIVDktAyneqoQKAQKgUJgRwSKnHYEu7oqBAqBQqAQWIZAkdMynOqpQqAQKAQKgR0RKHLaEezqqhAoBAqBQmAZAkVOy3CqpwqBQqAQKAR2RKDIaUewq6tCoBAoBAqBZQgUOS3DqZ4qBAqBQqAQ2BGBIqcdwa6uCoFCoBAoBJYh8D8pJiqPmzS2UwAAAABJRU5ErkJggg==\" data-latex=\"{\\Delta }^{2}V(\\gamma )=4\\pi \\rho (\\gamma )-4\\pi \\sum _{A} {{Z}_{A}}\\delta ({R}_{A}-\\gamma )\">', null, null, '5', null, null, '静电势', '2017-02-12 19:04:48', '静电势,感度', null, '{\\Delta }^{2}V(\\gamma )=4\\pi \\rho (\\gamma )-4\\pi \\sum _{A} {{Z}_{A}}\\delta ({R}_{A}-\\gamma )', '1486897488038.png');

-- ----------------------------
-- Table structure for `kn_lang`
-- ----------------------------
DROP TABLE IF EXISTS `kn_lang`;
CREATE TABLE `kn_lang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lang` varchar(40) DEFAULT NULL COMMENT '语言名称',
  `ext` varchar(255) DEFAULT NULL COMMENT '扩展名',
  `cmd` varchar(255) DEFAULT NULL COMMENT '调用的路径和命令名',
  `argu` varchar(255) DEFAULT NULL COMMENT '参数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='公式附加程序代码支持的语言。';

-- ----------------------------
-- Records of kn_lang
-- ----------------------------
INSERT INTO `kn_lang` VALUES ('4', 'Python', '.py', 'python', null);
INSERT INTO `kn_lang` VALUES ('5', 'JavaScript', '.js', null, null);
INSERT INTO `kn_lang` VALUES ('6', 'MatLab', '.m', null, null);

-- ----------------------------
-- Table structure for `kn_molecular`
-- ----------------------------
DROP TABLE IF EXISTS `kn_molecular`;
CREATE TABLE `kn_molecular` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `knmo_molu_text` text COMMENT '分子式描述，mol文件格式',
  `knmo_kntr_id` int(11) DEFAULT NULL COMMENT '所属词条ID',
  `knmo_user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `knmo_time` datetime DEFAULT NULL COMMENT '添加时间',
  `knmo_file` varchar(255) DEFAULT NULL COMMENT '分子文件',
  `knmo_name` varchar(255) DEFAULT NULL COMMENT '分子式名称',
  `knmo_desc` text COMMENT '分子式描述',
  `knmo_tag` varchar(255) DEFAULT NULL COMMENT '分子式标签，多个，中间用","隔开',
  `knmo_file_type` varchar(255) DEFAULT NULL COMMENT '分子结构文件格式',
  `knmo_png` varchar(255) DEFAULT NULL COMMENT '分子结构对用图文件名',
  PRIMARY KEY (`id`),
  KEY `fk_knmo_kn_tree` (`knmo_kntr_id`),
  CONSTRAINT `fk_knmo_kn_tree` FOREIGN KEY (`knmo_kntr_id`) REFERENCES `kn_tree` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='词条中对用的分子式';

-- ----------------------------
-- Records of kn_molecular
-- ----------------------------
INSERT INTO `kn_molecular` VALUES ('1', 'CL-20.11\r\n  MatStudio         3D                             0\r\n\r\n 36 39  0  0  0  0  0  0  0  0999 V2000\r\n   12.6627    3.7366    0.7457 N   0  0  0  0  0  0  0  0  0  0\r\n   13.8319    4.1941    0.0092 C   0  0  0  0  0  0  0  0  0  0\r\n   14.6157    3.7170    0.2191 H   0  0  0  0  0  0  0  0  0  0\r\n   13.9440    2.4442    2.0444 O   0  0  0  0  0  0  0  0  0  0\r\n   11.9153    2.8625    2.6501 O   0  5  0  0  0  0  0  0  0  0\r\n   11.7057    4.8411    0.7889 C   0  0  0  0  0  0  0  0  0  0\r\n   11.2523    4.8435    1.5816 H   0  0  0  0  0  0  0  0  0  0\r\n   12.8721    2.9711    1.9058 N   0  3  0  0  0  0  0  0  0  0\r\n   13.9433    5.6049    0.3502 N   0  0  0  0  0  0  0  0  0  0\r\n   12.5773    6.1269    0.5378 C   0  0  0  0  0  0  0  0  0  0\r\n   12.5754    6.7396    1.2588 H   0  0  0  0  0  0  0  0  0  0\r\n   14.7904    7.0786    1.7912 O   0  5  0  0  0  0  0  0  0  0\r\n   13.5449    4.0944   -1.5535 C   0  0  0  0  0  0  0  0  0  0\r\n   14.2084    3.5699   -1.9595 H   0  0  0  0  0  0  0  0  0  0\r\n   15.7734    5.1605    1.5784 O   0  0  0  0  0  0  0  0  0  0\r\n   14.9039    5.9651    1.3371 N   0  3  0  0  0  0  0  0  0  0\r\n   12.1259    6.7728   -0.6578 N   0  0  0  0  0  0  0  0  0  0\r\n   11.2626    4.6899   -1.6263 C   0  0  0  0  0  0  0  0  0  0\r\n   10.5838    4.5813   -2.2188 H   0  0  0  0  0  0  0  0  0  0\r\n   12.3105    8.7541    0.3016 O   0  5  0  0  0  0  0  0  0  0\r\n   12.1061    5.9913   -1.8665 C   0  0  0  0  0  0  0  0  0  0\r\n   11.7533    6.5027   -2.5627 H   0  0  0  0  0  0  0  0  0  0\r\n   11.7339    8.6381   -1.7905 O   0  0  0  0  0  0  0  0  0  0\r\n   12.0735    8.1594   -0.7316 N   0  3  0  0  0  0  0  0  0  0\r\n   10.7370    4.7251   -0.2843 N   0  0  0  0  0  0  0  0  0  0\r\n    9.4470    3.6108    1.1481 O   0  5  0  0  0  0  0  0  0  0\r\n    9.1005    3.3559   -0.9675 O   0  0  0  0  0  0  0  0  0  0\r\n    9.6851    3.8142   -0.0158 N   0  3  0  0  0  0  0  0  0  0\r\n   10.9543    2.8037   -3.5017 O   0  5  0  0  0  0  0  0  0  0\r\n   12.2158    3.5613   -1.7977 N   0  0  0  0  0  0  0  0  0  0\r\n   12.0806    2.9246   -3.0854 N   0  3  0  0  0  0  0  0  0  0\r\n   13.0973    2.5169   -3.6039 O   0  0  0  0  0  0  0  0  0  0\r\n   13.4044    5.3965   -2.1903 N   0  0  0  0  0  0  0  0  0  0\r\n   15.5966    5.6441   -2.3069 O   0  5  0  0  0  0  0  0  0  0\r\n   14.5130    6.1947   -2.3779 N   0  3  0  0  0  0  0  0  0  0\r\n   14.3066    7.3580   -2.6280 O   0  0  0  0  0  0  0  0  0  0\r\n  2  1  1  0  0  0\r\n  3  2  1  0  0  0\r\n  6  1  1  0  0  0\r\n  7  6  1  0  0  0\r\n  8  4  2  0  0  0\r\n  8  5  1  0  0  0\r\n  8  1  1  0  0  0\r\n  9  2  1  0  0  0\r\n 10  9  1  0  0  0\r\n 10  6  1  0  0  0\r\n 11 10  1  0  0  0\r\n 13  2  1  0  0  0\r\n 14 13  1  0  0  0\r\n 16  9  1  0  0  0\r\n 16 15  2  0  0  0\r\n 16 12  1  0  0  0\r\n 17 10  1  0  0  0\r\n 19 18  1  0  0  0\r\n 21 17  1  0  0  0\r\n 21 18  1  0  0  0\r\n 22 21  1  0  0  0\r\n 24 17  1  0  0  0\r\n 24 23  2  0  0  0\r\n 24 20  1  0  0  0\r\n 25 18  1  0  0  0\r\n 25  6  1  0  0  0\r\n 28 25  1  0  0  0\r\n 28 27  2  0  0  0\r\n 28 26  1  0  0  0\r\n 30 18  1  0  0  0\r\n 30 13  1  0  0  0\r\n 31 29  1  0  0  0\r\n 31 30  1  0  0  0\r\n 32 31  2  0  0  0\r\n 33 21  1  0  0  0\r\n 33 13  1  0  0  0\r\n 35 34  1  0  0  0\r\n 35 33  1  0  0  0\r\n 36 35  2  0  0  0\r\nM  END\r\n', '64', '5', '2017-02-09 11:39:24', '1486468515530.mol', 'CL-20.11', '学名为六硝基六氮杂异伍兹烷的炸药，爆轰速度高达9500米/秒，被称为“第四代炸药”，也被誉为“突破性含能材料”，是一种划时代的全新高爆军用炸药，在世界火炸药学界享有盛名。', 'CL-20,第四代,炸药', '.mol', '1486468515530.png');
INSERT INTO `kn_molecular` VALUES ('2', 'HMX opt+freq\r\n\r\nCreated by GaussView 3.07\r\n 28 28  0  0  0  0  0  0  0  0  0    0\r\n   -0.2976    0.3012   -1.6980 C   0  0  0  0  0  0  0  0  0  0  0  0\r\n    0.2976   -0.3012    1.6980 C   0  0  0  0  0  0  0  0  0  0  0  0\r\n    1.7265    0.7038   -0.1957 C   0  0  0  0  0  0  0  0  0  0  0  0\r\n   -0.3772    1.3686   -1.4916 H   0  0  0  0  0  0  0  0  0  0  0  0\r\n    0.3772   -1.3686    1.4916 H   0  0  0  0  0  0  0  0  0  0  0  0\r\n   -0.2622    0.1447   -2.7738 H   0  0  0  0  0  0  0  0  0  0  0  0\r\n    0.2622   -0.1447    2.7738 H   0  0  0  0  0  0  0  0  0  0  0  0\r\n    2.7839    0.5676   -0.4048 H   0  0  0  0  0  0  0  0  0  0  0  0\r\n    1.4591    1.7427   -0.3977 H   0  0  0  0  0  0  0  0  0  0  0  0\r\n   -1.7265   -0.7038    0.1957 C   0  0  0  0  0  0  0  0  0  0  0  0\r\n   -1.4591   -1.7427    0.3977 H   0  0  0  0  0  0  0  0  0  0  0  0\r\n   -2.7839   -0.5676    0.4048 H   0  0  0  0  0  0  0  0  0  0  0  0\r\n    1.4875    0.3844    1.2271 N   0  0  0  0  0  0  0  0  0  0  0  0\r\n   -1.4875   -0.3844   -1.2271 N   0  0  0  0  0  0  0  0  0  0  0  0\r\n   -0.9380    0.1411    1.0574 N   0  0  0  0  0  0  0  0  0  0  0  0\r\n    0.9380   -0.1411   -1.0574 N   0  0  0  0  0  0  0  0  0  0  0  0\r\n    1.4729   -1.3773   -1.4431 N   0  0  0  0  0  0  0  0  0  0  0  0\r\n    2.1980    1.1723    2.1304 N   0  0  0  0  0  0  0  0  0  0  0  0\r\n   -1.4729    1.3773    1.4431 N   0  0  0  0  0  0  0  0  0  0  0  0\r\n   -2.1980   -1.1723   -2.1304 N   0  0  0  0  0  0  0  0  0  0  0  0\r\n    2.5239   -1.7067   -0.9231 O   0  0  0  0  0  0  0  0  0  0  0  0\r\n    0.8130   -2.0153   -2.2447 O   0  0  0  0  0  0  0  0  0  0  0  0\r\n   -2.9865   -1.9613   -1.6274 O   0  0  0  0  0  0  0  0  0  0  0  0\r\n   -2.0138   -0.9843   -3.3183 O   0  0  0  0  0  0  0  0  0  0  0  0\r\n    2.0138    0.9843    3.3183 O   0  0  0  0  0  0  0  0  0  0  0  0\r\n    2.9865    1.9613    1.6274 O   0  0  0  0  0  0  0  0  0  0  0  0\r\n   -0.8130    2.0153    2.2447 O   0  0  0  0  0  0  0  0  0  0  0  0\r\n   -2.5239    1.7067    0.9231 O   0  0  0  0  0  0  0  0  0  0  0  0\r\n  1  4  1  0  0  0  0\r\n  1  6  1  0  0  0  0\r\n  1 14  1  0  0  0  0\r\n  1 16  1  0  0  0  0\r\n  2  5  1  0  0  0  0\r\n  2  7  1  0  0  0  0\r\n  2 13  1  0  0  0  0\r\n  2 15  1  0  0  0  0\r\n  3  8  1  0  0  0  0\r\n  3  9  1  0  0  0  0\r\n  3 13  1  0  0  0  0\r\n  3 16  1  0  0  0  0\r\n 10 11  1  0  0  0  0\r\n 10 12  1  0  0  0  0\r\n 10 14  1  0  0  0  0\r\n 10 15  1  0  0  0  0\r\n 13 18  1  0  0  0  0\r\n 14 20  1  0  0  0  0\r\n 15 19  1  0  0  0  0\r\n 16 17  1  0  0  0  0\r\n 17 21  2  0  0  0  0\r\n 17 22  2  0  0  0  0\r\n 18 25  2  0  0  0  0\r\n 18 26  2  0  0  0  0\r\n 19 27  2  0  0  0  0\r\n 19 28  2  0  0  0  0\r\n 20 23  2  0  0  0  0\r\n 20 24  2  0  0  0  0\r\n', '14', '5', '2017-02-09 11:39:16', '1486468845280.mol', 'HMX', '现时全球军事上最强力的炸药，可用于火箭燃料及爆破炸药。核用途：HMX可以点燃核弹中的核分裂材料，引发核反应。', 'HMX,炸药', '.mol', '1486468845280.png');
INSERT INTO `kn_molecular` VALUES ('3', '310f\r\n\r\nCreated by GaussView 3.07\r\n 21 21  0  0  0  0  0  0  0  0  0    0\r\n   -0.8778   -1.2081   -0.0124 C   0  0  0  0  0  0  0  0  0  0  0  0\r\n    0.5086   -1.1793    0.0244 C   0  0  0  0  0  0  0  0  0  0  0  0\r\n    1.2741    0.0000    0.0539 C   0  0  0  0  0  0  0  0  0  0  0  0\r\n    0.5086    1.1793    0.0244 C   0  0  0  0  0  0  0  0  0  0  0  0\r\n   -0.8778    1.2081   -0.0124 C   0  0  0  0  0  0  0  0  0  0  0  0\r\n   -1.5536   -0.0000   -0.0442 C   0  0  0  0  0  0  0  0  0  0  0  0\r\n   -1.4154   -2.1459   -0.0132 H   0  0  0  0  0  0  0  0  0  0  0  0\r\n   -1.4155    2.1459   -0.0132 H   0  0  0  0  0  0  0  0  0  0  0  0\r\n    2.7744    0.0001    0.1837 C   0  0  0  0  0  0  0  0  0  0  0  0\r\n    3.2412    0.0001   -0.8036 H   0  0  0  0  0  0  0  0  0  0  0  0\r\n    3.1210    0.8865    0.7109 H   0  0  0  0  0  0  0  0  0  0  0  0\r\n    3.1211   -0.8864    0.7108 H   0  0  0  0  0  0  0  0  0  0  0  0\r\n    1.1709   -2.5089    0.0247 N   0  0  0  0  0  0  0  0  0  0  0  0\r\n    2.1702   -2.6386   -0.6659 O   0  0  0  0  0  0  0  0  0  0  0  0\r\n    0.6505   -3.3856    0.6968 O   0  0  0  0  0  0  0  0  0  0  0  0\r\n    1.1708    2.5090    0.0247 N   0  0  0  0  0  0  0  0  0  0  0  0\r\n    0.6503    3.3857    0.6968 O   0  0  0  0  0  0  0  0  0  0  0  0\r\n    2.1701    2.6387   -0.6658 O   0  0  0  0  0  0  0  0  0  0  0  0\r\n   -3.0348   -0.0001   -0.1035 N   0  0  0  0  0  0  0  0  0  0  0  0\r\n   -3.5918    1.0866   -0.1258 O   0  0  0  0  0  0  0  0  0  0  0  0\r\n   -3.5917   -1.0868   -0.1259 O   0  0  0  0  0  0  0  0  0  0  0  0\r\n  1  2  4  0  0  0  0\r\n  1  6  2  0  0  0  0\r\n  1  7  1  0  0  0  0\r\n  2  3  4  0  0  0  0\r\n  2 13  1  0  0  0  0\r\n  3  4  4  0  0  0  0\r\n  3  9  1  0  0  0  0\r\n  4  5  4  0  0  0  0\r\n  4 16  1  0  0  0  0\r\n  5  6  2  0  0  0  0\r\n  5  8  1  0  0  0  0\r\n  6 19  1  0  0  0  0\r\n  9 10  1  0  0  0  0\r\n  9 11  1  0  0  0  0\r\n  9 12  1  0  0  0  0\r\n 13 14  2  0  0  0  0\r\n 13 15  2  0  0  0  0\r\n 16 17  2  0  0  0  0\r\n 16 18  2  0  0  0  0\r\n 19 20  2  0  0  0  0\r\n 19 21  2  0  0  0  0\r\n', '14', '5', '2017-02-09 11:39:00', '1486555482566.mol', 'TNT', 'TNT炸药是一种烈性炸药，由J·威尔勃兰德发明，纯品为无色针状结晶,工业品呈黄色粉末或鱼鳞片状，难溶于水，可用于水下爆破。由于威力大，常用来做副起爆药。爆炸后呈负氧平衡，产生有毒气体 。性质稳定，不易爆炸，即使直接被子弹击中也不会引爆。需要雷管进行引爆。', 'TNT,炸药,三硝基甲苯,C4', '.mol', '1486555482566.png');
INSERT INTO `kn_molecular` VALUES ('4', 'FOX-7.09.alpha\r\n  MatStudio         3D                             0\r\n\r\n 14 13  0  0  0  0  0  0  0  0999 V2000\r\n    1.3473    2.1834    3.7846 O   0  5  0  0  0  0  0  0  0  0\r\n   -0.1418    2.9026    2.3984 O   0  0  0  0  0  0  0  0  0  0\r\n    4.0200    1.9571    0.8782 O   0  0  0  0  0  0  0  0  0  0\r\n    3.6123    2.8937    2.7937 O   0  5  0  0  0  0  0  0  0  0\r\n    0.9842    2.4404    2.6304 N   0  3  0  0  0  0  0  0  0  0\r\n    3.2140    2.3298    1.7559 N   0  3  0  0  0  0  0  0  0  0\r\n   -0.0349    1.5943    0.1140 N   0  0  0  0  0  0  0  0  0  0\r\n    2.0630    1.2918   -0.7137 N   0  0  0  0  0  0  0  0  0  0\r\n    1.8446    2.1667    1.5296 C   0  0  0  0  0  0  0  0  0  0\r\n    1.2825    1.6897    0.2773 C   0  0  0  0  0  0  0  0  0  0\r\n   -0.4064    1.3040   -0.7748 H   0  0  0  0  0  0  0  0  0  0\r\n   -0.6613    1.9607    0.8114 H   0  0  0  0  0  0  0  0  0  0\r\n    1.6171    0.9878   -1.5628 H   0  0  0  0  0  0  0  0  0  0\r\n    3.0637    1.3036   -0.6074 H   0  0  0  0  0  0  0  0  0  0\r\n  5  2  2  0  0  0\r\n  5  1  1  0  0  0\r\n  6  3  2  0  0  0\r\n  6  4  1  0  0  0\r\n  9  6  1  0  0  0\r\n  9  5  1  0  0  0\r\n 10  7  1  0  0  0\r\n 10  9  2  0  0  0\r\n 10  8  1  0  0  0\r\n 11  7  1  0  0  0\r\n 12  7  1  0  0  0\r\n 13  8  1  0  0  0\r\n 14  8  1  0  0  0\r\nM  END\r\n', '17', '5', '2017-02-09 13:41:43', '1486618903190.mol', 'FOX-7.09.alpha', 'FOX-7作为高能钝感炸药', 'FOX-7,高能,钝感,炸药', '.mol', '1486618903190.png');
INSERT INTO `kn_molecular` VALUES ('5', 'BTF\r\n  MatStudio         3D                             0\r\n\r\n 18 21  0  0  0  0  0  0  0  0999 V2000\r\n    2.8834    1.9418    0.0000 C   0  0  0  0  0  0  0  0  0  0\r\n    4.1600    1.4500   -0.4504 C   0  0  0  0  0  0  0  0  0  0\r\n    4.7298    1.8540   -1.6647 C   0  0  0  0  0  0  0  0  0  0\r\n    4.0029    2.7576   -2.4879 C   0  0  0  0  0  0  0  0  0  0\r\n    2.7519    3.3041   -2.0773 C   0  0  0  0  0  0  0  0  0  0\r\n    2.2264    2.8786   -0.8180 C   0  0  0  0  0  0  0  0  0  0\r\n    2.2285    1.6608    1.0931 N   0  5  0  0  0  0  0  0  0  0\r\n    4.9956    0.6187    0.1408 N   0  3  0  0  0  0  0  0  0  0\r\n    5.9247    1.3193   -1.8531 N   0  5  0  0  0  0  0  0  0  0\r\n    4.2597    3.2338   -3.7022 N   0  3  0  0  0  0  0  0  0  0\r\n    2.2465    4.1101   -2.9624 N   0  5  0  0  0  0  0  0  0  0\r\n    1.0994    3.2260   -0.1897 N   0  3  0  0  0  0  0  0  0  0\r\n    1.0717    2.4434    1.0494 O   0  0  0  0  0  0  0  0  0  0\r\n    4.9790   -0.0273    1.1648 O   0  0  0  0  0  0  0  0  0  0\r\n    6.1587    0.5347   -0.7411 O   0  0  0  0  0  0  0  0  0  0\r\n    5.1313    3.1050   -4.5196 O   0  0  0  0  0  0  0  0  0  0\r\n    3.1382    4.1413   -4.0112 O   0  0  0  0  0  0  0  0  0  0\r\n    0.1814    3.9715   -0.4276 O   0  0  0  0  0  0  0  0  0  0\r\n  2  1  1  0  0  0\r\n  3  2  2  0  0  0\r\n  4  3  1  0  0  0\r\n  5  4  2  0  0  0\r\n  6  5  1  0  0  0\r\n  6  1  2  0  0  0\r\n  7  1  1  0  0  0\r\n  8  2  1  0  0  0\r\n  9  3  1  0  0  0\r\n 10  4  1  0  0  0\r\n 11  5  1  0  0  0\r\n 12  6  1  0  0  0\r\n 13  7  1  0  0  0\r\n 13 12  1  0  0  0\r\n 14  8  2  0  0  0\r\n 15  9  1  0  0  0\r\n 15  8  1  0  0  0\r\n 16 10  2  0  0  0\r\n 17 10  1  0  0  0\r\n 17 11  1  0  0  0\r\n 18 12  2  0  0  0\r\nM  END\r\n', '14', '5', '2017-02-09 13:45:24', '1486619068882.mol', 'BTF.00', '苯并三氧化呋咱是在苯环上引入氧化呋咱替代硝基，是苯环系比较理想的一种无氢炸药，由于其高能量和较好的起爆性能，其安全性、热安定性、爆轰能量与HMX相当，冲击起爆感度、熄爆直径与太安相当，是性能优良的起爆药，已被成功用于导爆索装药和改善B炸药的装药性能，是爆炸网络中的主要成分之一。', '苯并三氧化呋咱,炸药,Benzotrifuroxan,C6N6O6', '.mol', '1486619068882.png');

-- ----------------------------
-- Table structure for `kn_tag`
-- ----------------------------
DROP TABLE IF EXISTS `kn_tag`;
CREATE TABLE `kn_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag` varchar(255) DEFAULT NULL COMMENT '标签名称',
  `num` int(11) DEFAULT NULL COMMENT '使用次数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kn_tag
-- ----------------------------
INSERT INTO `kn_tag` VALUES ('1', '活化', '1');
INSERT INTO `kn_tag` VALUES ('2', '氧化', '1');
INSERT INTO `kn_tag` VALUES ('3', '分类', '1');
INSERT INTO `kn_tag` VALUES ('4', '用途', '1');
INSERT INTO `kn_tag` VALUES ('5', '安全', '2');
INSERT INTO `kn_tag` VALUES ('6', '废水', '1');
INSERT INTO `kn_tag` VALUES ('7', '策略', '1');
INSERT INTO `kn_tag` VALUES ('8', '密度', '28');
INSERT INTO `kn_tag` VALUES ('9', '爆轰', '28');
INSERT INTO `kn_tag` VALUES ('10', 'CL-20', '3');
INSERT INTO `kn_tag` VALUES ('11', '第四代', '3');
INSERT INTO `kn_tag` VALUES ('12', '炸药', '16');
INSERT INTO `kn_tag` VALUES ('13', 'HMX', '8');
INSERT INTO `kn_tag` VALUES ('14', '发', '7');
INSERT INTO `kn_tag` VALUES ('15', '的', '7');
INSERT INTO `kn_tag` VALUES ('16', 'TNT', '2');
INSERT INTO `kn_tag` VALUES ('17', '三硝基甲苯', '2');
INSERT INTO `kn_tag` VALUES ('18', 'C4', '2');
INSERT INTO `kn_tag` VALUES ('19', 'FOX-7', '1');
INSERT INTO `kn_tag` VALUES ('20', '高能', '1');
INSERT INTO `kn_tag` VALUES ('21', '钝感', '1');
INSERT INTO `kn_tag` VALUES ('22', '苯并三氧化呋咱', '2');
INSERT INTO `kn_tag` VALUES ('23', 'Benzotrifuroxan', '2');
INSERT INTO `kn_tag` VALUES ('24', 'C6N6O6', '2');
INSERT INTO `kn_tag` VALUES ('25', '猛炸药', '11');
INSERT INTO `kn_tag` VALUES ('26', '火药', '11');
INSERT INTO `kn_tag` VALUES ('27', '烟火剂', '11');
INSERT INTO `kn_tag` VALUES ('28', '起爆药', '11');
INSERT INTO `kn_tag` VALUES ('29', '单质炸药', '1');
INSERT INTO `kn_tag` VALUES ('30', '硝基化合物', '1');
INSERT INTO `kn_tag` VALUES ('31', '静电势', '2');
INSERT INTO `kn_tag` VALUES ('32', '感度', '4');
INSERT INTO `kn_tag` VALUES ('33', '最小键级法', '2');

-- ----------------------------
-- Table structure for `kn_tree`
-- ----------------------------
DROP TABLE IF EXISTS `kn_tree`;
CREATE TABLE `kn_tree` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kntr_parent_id` int(11) NOT NULL COMMENT '父类编号',
  `kntr_name` varchar(255) NOT NULL COMMENT '知识结构树名称',
  `kntr_type` int(11) DEFAULT NULL COMMENT '类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8 COMMENT='词条知识框架树\n';

-- ----------------------------
-- Records of kn_tree
-- ----------------------------
INSERT INTO `kn_tree` VALUES ('1', '15', '含能材料历史', '1');
INSERT INTO `kn_tree` VALUES ('2', '15', '含能材料的分类', null);
INSERT INTO `kn_tree` VALUES ('3', '15', '含能材料的特征', null);
INSERT INTO `kn_tree` VALUES ('4', '2', '化学组分分类', null);
INSERT INTO `kn_tree` VALUES ('5', '2', '用途分类', null);
INSERT INTO `kn_tree` VALUES ('6', '3', '高体积能量密度', null);
INSERT INTO `kn_tree` VALUES ('7', '3', '强自行活化', null);
INSERT INTO `kn_tree` VALUES ('8', '3', '亚稳定性', null);
INSERT INTO `kn_tree` VALUES ('9', '3', '自供氧', null);
INSERT INTO `kn_tree` VALUES ('10', '15', '含能材料的化学变化', null);
INSERT INTO `kn_tree` VALUES ('11', '10', '热分解', null);
INSERT INTO `kn_tree` VALUES ('12', '10', '燃烧', null);
INSERT INTO `kn_tree` VALUES ('13', '10', '爆炸', null);
INSERT INTO `kn_tree` VALUES ('14', '10', '爆轰', null);
INSERT INTO `kn_tree` VALUES ('15', '0', '含能材料基础', null);
INSERT INTO `kn_tree` VALUES ('16', '0', '含能材料能量', null);
INSERT INTO `kn_tree` VALUES ('17', '16', '含能材料的密度', null);
INSERT INTO `kn_tree` VALUES ('18', '17', '晶体密度的计算', null);
INSERT INTO `kn_tree` VALUES ('19', '17', '晶体密度的测定', null);
INSERT INTO `kn_tree` VALUES ('20', '18', '摩尔折射法', null);
INSERT INTO `kn_tree` VALUES ('21', '18', '摩尔体积法', null);
INSERT INTO `kn_tree` VALUES ('22', '16', '含能材料的暴热', null);
INSERT INTO `kn_tree` VALUES ('23', '22', '暴热的计算', null);
INSERT INTO `kn_tree` VALUES ('24', '22', '影响暴热的因素', null);
INSERT INTO `kn_tree` VALUES ('25', '22', '暴热的实验测定', null);
INSERT INTO `kn_tree` VALUES ('26', '23', '暴热的理论计算', null);
INSERT INTO `kn_tree` VALUES ('27', '23', '暴热的经验计算', null);
INSERT INTO `kn_tree` VALUES ('28', '0', '含能材料安全性能', null);
INSERT INTO `kn_tree` VALUES ('29', '28', '含能材料的安定性', null);
INSERT INTO `kn_tree` VALUES ('30', '16', '含能材料的生成焓', null);
INSERT INTO `kn_tree` VALUES ('31', '30', '键或基因加和法', null);
INSERT INTO `kn_tree` VALUES ('32', '30', '分子轨道法', null);
INSERT INTO `kn_tree` VALUES ('33', '30', '原子化方案', null);
INSERT INTO `kn_tree` VALUES ('34', '16', '含能材料的爆温', null);
INSERT INTO `kn_tree` VALUES ('35', '34', '爆温的理论计算', null);
INSERT INTO `kn_tree` VALUES ('36', '34', '改变爆温的途径', null);
INSERT INTO `kn_tree` VALUES ('37', '16', '含能材料的爆速', null);
INSERT INTO `kn_tree` VALUES ('38', '37', '爆速的计算', null);
INSERT INTO `kn_tree` VALUES ('39', '37', '爆速的实验测定', null);
INSERT INTO `kn_tree` VALUES ('40', '37', '影响爆速的因素', null);
INSERT INTO `kn_tree` VALUES ('41', '16', '含能材料的爆压', null);
INSERT INTO `kn_tree` VALUES ('42', '41', 'C-J爆压经验公式', null);
INSERT INTO `kn_tree` VALUES ('43', '41', 'Kamlet经验公式法', null);
INSERT INTO `kn_tree` VALUES ('44', '41', '氮当量及其修正', null);
INSERT INTO `kn_tree` VALUES ('45', '41', '佩佩金经验公式法', null);
INSERT INTO `kn_tree` VALUES ('46', '16', '含能材料的爆容', null);
INSERT INTO `kn_tree` VALUES ('47', '16', '含能材料的做功能力', null);
INSERT INTO `kn_tree` VALUES ('48', '16', '含能材料的猛度', null);
INSERT INTO `kn_tree` VALUES ('49', '29', '热安定性', null);
INSERT INTO `kn_tree` VALUES ('50', '29', '影响安定性的因素', null);
INSERT INTO `kn_tree` VALUES ('51', '29', '安定性的评价', null);
INSERT INTO `kn_tree` VALUES ('52', '29', '测定热安定性的方法', null);
INSERT INTO `kn_tree` VALUES ('53', '28', '含能材料的相容性', null);
INSERT INTO `kn_tree` VALUES ('54', '53', '相容性', null);
INSERT INTO `kn_tree` VALUES ('55', '53', '相容性实验测试方法', null);
INSERT INTO `kn_tree` VALUES ('56', '28', '含能材料的感度', null);
INSERT INTO `kn_tree` VALUES ('57', '56', '感度的选择性', null);
INSERT INTO `kn_tree` VALUES ('58', '56', '感度的相对性', null);
INSERT INTO `kn_tree` VALUES ('59', '56', '影响感度的因素', null);
INSERT INTO `kn_tree` VALUES ('60', '56', '感度的理论计算', null);
INSERT INTO `kn_tree` VALUES ('61', '56', '量子化学参量', null);
INSERT INTO `kn_tree` VALUES ('62', '56', '实验测试方法', null);
INSERT INTO `kn_tree` VALUES ('63', '28', '含能材料的安全使用', null);
INSERT INTO `kn_tree` VALUES ('64', '63', '毒性', null);
INSERT INTO `kn_tree` VALUES ('65', '63', '安全使用注意事项', null);
INSERT INTO `kn_tree` VALUES ('66', '63', '过期和报废处理', null);
INSERT INTO `kn_tree` VALUES ('67', '63', '废水处理', null);
