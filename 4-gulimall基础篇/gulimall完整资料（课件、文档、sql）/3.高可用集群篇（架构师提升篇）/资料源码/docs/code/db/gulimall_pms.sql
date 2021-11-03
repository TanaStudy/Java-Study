/*
Navicat MySQL Data Transfer

Source Server         : 192.168.56.10_3306
Source Server Version : 50727
Source Host           : 192.168.56.10:3306
Source Database       : gulimall_pms

Target Server Type    : MYSQL
Target Server Version : 50727
File Encoding         : 65001

Date: 2020-03-11 17:36:52
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for pms_attr
-- ----------------------------
DROP TABLE IF EXISTS `pms_attr`;
CREATE TABLE `pms_attr` (
  `attr_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '属性id',
  `attr_name` char(30) DEFAULT NULL COMMENT '属性名',
  `search_type` tinyint(4) DEFAULT NULL COMMENT '是否需要检索[0-不需要，1-需要]',
  `value_type` tinyint(4) DEFAULT NULL COMMENT '值类型[0-为单个值，1-可以选择多个值]',
  `icon` varchar(255) DEFAULT NULL COMMENT '属性图标',
  `value_select` char(255) DEFAULT NULL COMMENT '可选值列表[用逗号分隔]',
  `attr_type` tinyint(4) DEFAULT NULL COMMENT '属性类型[0-销售属性，1-基本属性',
  `enable` bigint(20) DEFAULT NULL COMMENT '启用状态[0 - 禁用，1 - 启用]',
  `catelog_id` bigint(20) DEFAULT NULL COMMENT '所属分类',
  `show_desc` tinyint(4) DEFAULT NULL COMMENT '快速展示【是否展示在介绍上；0-否 1-是】，在sku中仍然可以调整',
  PRIMARY KEY (`attr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COMMENT='商品属性';

-- ----------------------------
-- Records of pms_attr
-- ----------------------------
INSERT INTO `pms_attr` VALUES ('7', '入网型号', '0', '0', 'xxx', 'A2217;C3J;以官网信息为准', '1', '1', '225', '0');
INSERT INTO `pms_attr` VALUES ('8', '上市年份', '0', '0', 'xxx', '2018;2019', '1', '1', '225', '0');
INSERT INTO `pms_attr` VALUES ('9', '颜色', '0', '0', 'xxx', '黑色;白色;蓝色', '0', '1', '225', '0');
INSERT INTO `pms_attr` VALUES ('10', '内存', '0', '0', 'xxx', '4GB;6GB;8GB;12GB', '0', '1', '225', '0');
INSERT INTO `pms_attr` VALUES ('11', '机身颜色', '0', '0', 'xxx', '黑色;白色', '1', '1', '225', '1');
INSERT INTO `pms_attr` VALUES ('12', '版本', '0', '0', 'xxx', '', '0', '1', '225', '0');
INSERT INTO `pms_attr` VALUES ('13', '机身长度（mm）', '0', '0', 'xx', '158.3;135.9', '1', '1', '225', '0');
INSERT INTO `pms_attr` VALUES ('14', '机身材质工艺', '0', '1', 'xxx', '以官网信息为准;陶瓷;玻璃', '1', '1', '225', '0');
INSERT INTO `pms_attr` VALUES ('15', 'CPU品牌', '1', '0', 'xxx', '高通(Qualcomm);海思（Hisilicon）;以官网信息为准', '1', '1', '225', '1');
INSERT INTO `pms_attr` VALUES ('16', 'CPU型号', '1', '0', 'xxx', '骁龙665;骁龙845;骁龙855;骁龙730;HUAWEI Kirin 980;HUAWEI Kirin 970', '1', '1', '225', '0');

-- ----------------------------
-- Table structure for pms_attr_attrgroup_relation
-- ----------------------------
DROP TABLE IF EXISTS `pms_attr_attrgroup_relation`;
CREATE TABLE `pms_attr_attrgroup_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `attr_id` bigint(20) DEFAULT NULL COMMENT '属性id',
  `attr_group_id` bigint(20) DEFAULT NULL COMMENT '属性分组id',
  `attr_sort` int(11) DEFAULT NULL COMMENT '属性组内排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COMMENT='属性&属性分组关联';

-- ----------------------------
-- Records of pms_attr_attrgroup_relation
-- ----------------------------
INSERT INTO `pms_attr_attrgroup_relation` VALUES ('23', '7', '1', null);
INSERT INTO `pms_attr_attrgroup_relation` VALUES ('24', '8', '1', null);
INSERT INTO `pms_attr_attrgroup_relation` VALUES ('26', '11', '2', null);
INSERT INTO `pms_attr_attrgroup_relation` VALUES ('27', '13', '2', null);
INSERT INTO `pms_attr_attrgroup_relation` VALUES ('28', '14', '2', null);
INSERT INTO `pms_attr_attrgroup_relation` VALUES ('29', '15', '7', null);
INSERT INTO `pms_attr_attrgroup_relation` VALUES ('30', '16', '7', null);

-- ----------------------------
-- Table structure for pms_attr_group
-- ----------------------------
DROP TABLE IF EXISTS `pms_attr_group`;
CREATE TABLE `pms_attr_group` (
  `attr_group_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '分组id',
  `attr_group_name` char(20) DEFAULT NULL COMMENT '组名',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `descript` varchar(255) DEFAULT NULL COMMENT '描述',
  `icon` varchar(255) DEFAULT NULL COMMENT '组图标',
  `catelog_id` bigint(20) DEFAULT NULL COMMENT '所属分类id',
  PRIMARY KEY (`attr_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COMMENT='属性分组';

-- ----------------------------
-- Records of pms_attr_group
-- ----------------------------
INSERT INTO `pms_attr_group` VALUES ('1', '主体', '0', '主体', 'dd', '225');
INSERT INTO `pms_attr_group` VALUES ('2', '基本信息', '0', '基本信息', 'xx', '225');
INSERT INTO `pms_attr_group` VALUES ('4', '屏幕', '0', '屏幕', 'xx', '233');
INSERT INTO `pms_attr_group` VALUES ('7', '主芯片', '0', '主芯片', 'xx', '225');

-- ----------------------------
-- Table structure for pms_brand
-- ----------------------------
DROP TABLE IF EXISTS `pms_brand`;
CREATE TABLE `pms_brand` (
  `brand_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '品牌id',
  `name` char(50) DEFAULT NULL COMMENT '品牌名',
  `logo` varchar(2000) DEFAULT NULL COMMENT '品牌logo地址',
  `descript` longtext COMMENT '介绍',
  `show_status` tinyint(4) DEFAULT NULL COMMENT '显示状态[0-不显示；1-显示]',
  `first_letter` char(1) DEFAULT NULL COMMENT '检索首字母',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`brand_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COMMENT='品牌';

-- ----------------------------
-- Records of pms_brand
-- ----------------------------
INSERT INTO `pms_brand` VALUES ('9', '华为', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-18/de2426bd-a689-41d0-865a-d45d1afa7cde_huawei.png', '华为', '1', 'H', '1');
INSERT INTO `pms_brand` VALUES ('10', '小米', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-18/1f9e6968-cf92-462e-869a-4c2331a4113f_xiaomi.png', '小米', '1', 'M', '1');
INSERT INTO `pms_brand` VALUES ('11', 'oppo', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-18/5c8303f2-8b0c-4a5b-89a6-86513133d758_oppo.png', 'oppo', '1', 'O', '1');
INSERT INTO `pms_brand` VALUES ('12', 'Apple', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-18/819bb0b1-3ed8-4072-8304-78811a289781_apple.png', '苹果', '1', 'A', '1');

-- ----------------------------
-- Table structure for pms_category
-- ----------------------------
DROP TABLE IF EXISTS `pms_category`;
CREATE TABLE `pms_category` (
  `cat_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `name` char(50) DEFAULT NULL COMMENT '分类名称',
  `parent_cid` bigint(20) DEFAULT NULL COMMENT '父分类id',
  `cat_level` int(11) DEFAULT NULL COMMENT '层级',
  `show_status` tinyint(4) DEFAULT NULL COMMENT '是否显示[0-不显示，1显示]',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `icon` char(255) DEFAULT NULL COMMENT '图标地址',
  `product_unit` char(50) DEFAULT NULL COMMENT '计量单位',
  `product_count` int(11) DEFAULT NULL COMMENT '商品数量',
  PRIMARY KEY (`cat_id`),
  KEY `parent_cid` (`parent_cid`)
) ENGINE=InnoDB AUTO_INCREMENT=1433 DEFAULT CHARSET=utf8mb4 COMMENT='商品三级分类';

-- ----------------------------
-- Records of pms_category
-- ----------------------------
INSERT INTO `pms_category` VALUES ('1', '图书、音像、电子书刊', '0', '1', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('2', '手机', '0', '1', '1', '0', '111q', null, '0');
INSERT INTO `pms_category` VALUES ('3', '家用电器', '0', '1', '1', '0', 'aaa', null, '0');
INSERT INTO `pms_category` VALUES ('4', '数码', '0', '1', '1', '0', 'aaa', null, '0');
INSERT INTO `pms_category` VALUES ('5', '家居家装', '0', '1', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('6', '电脑办公', '0', '1', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('7', '厨具', '0', '1', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('8', '个护化妆', '0', '1', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('9', '服饰内衣', '0', '1', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('10', '钟表', '0', '1', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('11', '鞋靴', '0', '1', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('12', '母婴', '0', '1', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('13', '礼品箱包', '0', '1', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('14', '食品饮料、保健食品', '0', '1', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('15', '珠宝', '0', '1', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('16', '汽车用品', '0', '1', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('17', '运动健康', '0', '1', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('18', '玩具乐器', '0', '1', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('19', '彩票、旅行、充值、票务', '0', '1', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('20', '生鲜', '0', '1', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('21', '整车', '0', '1', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('22', '电子书刊', '1', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('23', '音像', '1', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('24', '英文原版', '1', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('25', '文艺', '1', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('26', '少儿', '1', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('27', '人文社科', '1', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('28', '经管励志', '1', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('29', '生活', '1', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('30', '科技', '1', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('31', '教育', '1', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('32', '港台图书', '1', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('33', '其他', '1', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('34', '手机通讯', '2', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('35', '运营商', '2', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('36', '手机配件', '2', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('37', '大 家 电', '3', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('38', '厨卫大电', '3', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('39', '厨房小电', '3', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('40', '生活电器', '3', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('41', '个护健康', '3', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('42', '五金家装', '3', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('43', '摄影摄像', '4', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('44', '数码配件', '4', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('45', '智能设备', '4', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('46', '影音娱乐', '4', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('47', '电子教育', '4', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('48', '虚拟商品', '4', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('49', '家纺', '5', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('50', '灯具', '5', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('51', '生活日用', '5', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('52', '家装软饰', '5', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('53', '宠物生活', '5', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('54', '电脑整机', '6', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('55', '电脑配件', '6', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('56', '外设产品', '6', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('57', '游戏设备', '6', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('58', '网络产品', '6', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('59', '办公设备', '6', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('60', '文具/耗材', '6', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('61', '服务产品', '6', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('62', '烹饪锅具', '7', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('63', '刀剪菜板', '7', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('64', '厨房配件', '7', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('65', '水具酒具', '7', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('66', '餐具', '7', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('67', '酒店用品', '7', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('68', '茶具/咖啡具', '7', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('69', '清洁用品', '8', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('70', '面部护肤', '8', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('71', '身体护理', '8', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('72', '口腔护理', '8', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('73', '女性护理', '8', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('74', '洗发护发', '8', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('75', '香水彩妆', '8', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('76', '女装', '9', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('77', '男装', '9', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('78', '内衣', '9', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('79', '洗衣服务', '9', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('80', '服饰配件', '9', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('81', '钟表', '10', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('82', '流行男鞋', '11', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('83', '时尚女鞋', '11', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('84', '奶粉', '12', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('85', '营养辅食', '12', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('86', '尿裤湿巾', '12', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('87', '喂养用品', '12', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('88', '洗护用品', '12', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('89', '童车童床', '12', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('90', '寝居服饰', '12', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('91', '妈妈专区', '12', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('92', '童装童鞋', '12', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('93', '安全座椅', '12', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('94', '潮流女包', '13', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('95', '精品男包', '13', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('96', '功能箱包', '13', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('97', '礼品', '13', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('98', '奢侈品', '13', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('99', '婚庆', '13', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('100', '进口食品', '14', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('101', '地方特产', '14', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('102', '休闲食品', '14', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('103', '粮油调味', '14', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('104', '饮料冲调', '14', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('105', '食品礼券', '14', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('106', '茗茶', '14', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('107', '时尚饰品', '15', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('108', '黄金', '15', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('109', 'K金饰品', '15', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('110', '金银投资', '15', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('111', '银饰', '15', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('112', '钻石', '15', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('113', '翡翠玉石', '15', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('114', '水晶玛瑙', '15', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('115', '彩宝', '15', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('116', '铂金', '15', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('117', '木手串/把件', '15', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('118', '珍珠', '15', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('119', '维修保养', '16', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('120', '车载电器', '16', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('121', '美容清洗', '16', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('122', '汽车装饰', '16', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('123', '安全自驾', '16', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('124', '汽车服务', '16', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('125', '赛事改装', '16', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('126', '运动鞋包', '17', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('127', '运动服饰', '17', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('128', '骑行运动', '17', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('129', '垂钓用品', '17', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('130', '游泳用品', '17', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('131', '户外鞋服', '17', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('132', '户外装备', '17', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('133', '健身训练', '17', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('134', '体育用品', '17', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('135', '适用年龄', '18', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('136', '遥控/电动', '18', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('137', '毛绒布艺', '18', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('138', '娃娃玩具', '18', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('139', '模型玩具', '18', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('140', '健身玩具', '18', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('141', '动漫玩具', '18', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('142', '益智玩具', '18', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('143', '积木拼插', '18', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('144', 'DIY玩具', '18', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('145', '创意减压', '18', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('146', '乐器', '18', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('147', '彩票', '19', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('148', '机票', '19', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('149', '酒店', '19', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('150', '旅行', '19', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('151', '充值', '19', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('152', '游戏', '19', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('153', '票务', '19', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('154', '产地直供', '20', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('155', '水果', '20', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('156', '猪牛羊肉', '20', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('157', '海鲜水产', '20', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('158', '禽肉蛋品', '20', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('159', '冷冻食品', '20', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('160', '熟食腊味', '20', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('161', '饮品甜品', '20', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('162', '蔬菜', '20', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('163', '全新整车', '21', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('164', '二手车', '21', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('165', '电子书', '22', '3', '1', '1', null, null, '0');
INSERT INTO `pms_category` VALUES ('166', '网络原创', '22', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('167', '数字杂志', '22', '3', '1', '2', null, null, '0');
INSERT INTO `pms_category` VALUES ('168', '多媒体图书', '22', '3', '1', '3', null, null, '0');
INSERT INTO `pms_category` VALUES ('169', '音乐', '23', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('170', '影视', '23', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('171', '教育音像', '23', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('172', '少儿', '24', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('173', '商务投资', '24', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('174', '英语学习与考试', '24', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('175', '文学', '24', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('176', '传记', '24', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('177', '励志', '24', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('178', '小说', '25', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('179', '文学', '25', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('180', '青春文学', '25', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('181', '传记', '25', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('182', '艺术', '25', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('183', '少儿', '26', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('184', '0-2岁', '26', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('185', '3-6岁', '26', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('186', '7-10岁', '26', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('187', '11-14岁', '26', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('188', '历史', '27', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('189', '哲学', '27', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('190', '国学', '27', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('191', '政治/军事', '27', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('192', '法律', '27', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('193', '人文社科', '27', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('194', '心理学', '27', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('195', '文化', '27', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('196', '社会科学', '27', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('197', '经济', '28', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('198', '金融与投资', '28', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('199', '管理', '28', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('200', '励志与成功', '28', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('201', '生活', '29', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('202', '健身与保健', '29', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('203', '家庭与育儿', '29', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('204', '旅游', '29', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('205', '烹饪美食', '29', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('206', '工业技术', '30', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('207', '科普读物', '30', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('208', '建筑', '30', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('209', '医学', '30', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('210', '科学与自然', '30', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('211', '计算机与互联网', '30', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('212', '电子通信', '30', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('213', '中小学教辅', '31', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('214', '教育与考试', '31', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('215', '外语学习', '31', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('216', '大中专教材', '31', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('217', '字典词典', '31', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('218', '艺术/设计/收藏', '32', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('219', '经济管理', '32', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('220', '文化/学术', '32', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('221', '少儿', '32', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('222', '工具书', '33', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('223', '杂志/期刊', '33', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('224', '套装书', '33', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('225', '手机', '34', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('226', '对讲机', '34', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('227', '合约机', '35', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('228', '选号中心', '35', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('229', '装宽带', '35', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('230', '办套餐', '35', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('231', '移动电源', '36', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('232', '电池/移动电源', '36', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('233', '蓝牙耳机', '36', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('234', '充电器/数据线', '36', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('235', '苹果周边', '36', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('236', '手机耳机', '36', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('237', '手机贴膜', '36', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('238', '手机存储卡', '36', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('239', '充电器', '36', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('240', '数据线', '36', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('241', '手机保护套', '36', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('242', '车载配件', '36', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('243', 'iPhone 配件', '36', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('244', '手机电池', '36', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('245', '创意配件', '36', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('246', '便携/无线音响', '36', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('247', '手机饰品', '36', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('248', '拍照配件', '36', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('249', '手机支架', '36', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('250', '平板电视', '37', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('251', '空调', '37', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('252', '冰箱', '37', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('253', '洗衣机', '37', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('254', '家庭影院', '37', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('255', 'DVD/电视盒子', '37', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('256', '迷你音响', '37', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('257', '冷柜/冰吧', '37', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('258', '家电配件', '37', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('259', '功放', '37', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('260', '回音壁/Soundbar', '37', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('261', 'Hi-Fi专区', '37', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('262', '电视盒子', '37', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('263', '酒柜', '37', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('264', '燃气灶', '38', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('265', '油烟机', '38', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('266', '热水器', '38', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('267', '消毒柜', '38', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('268', '洗碗机', '38', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('269', '料理机', '39', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('270', '榨汁机', '39', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('271', '电饭煲', '39', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('272', '电压力锅', '39', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('273', '豆浆机', '39', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('274', '咖啡机', '39', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('275', '微波炉', '39', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('276', '电烤箱', '39', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('277', '电磁炉', '39', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('278', '面包机', '39', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('279', '煮蛋器', '39', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('280', '酸奶机', '39', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('281', '电炖锅', '39', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('282', '电水壶/热水瓶', '39', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('283', '电饼铛', '39', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('284', '多用途锅', '39', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('285', '电烧烤炉', '39', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('286', '果蔬解毒机', '39', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('287', '其它厨房电器', '39', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('288', '养生壶/煎药壶', '39', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('289', '电热饭盒', '39', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('290', '取暖电器', '40', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('291', '净化器', '40', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('292', '加湿器', '40', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('293', '扫地机器人', '40', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('294', '吸尘器', '40', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('295', '挂烫机/熨斗', '40', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('296', '插座', '40', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('297', '电话机', '40', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('298', '清洁机', '40', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('299', '除湿机', '40', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('300', '干衣机', '40', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('301', '收录/音机', '40', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('302', '电风扇', '40', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('303', '冷风扇', '40', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('304', '其它生活电器', '40', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('305', '生活电器配件', '40', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('306', '净水器', '40', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('307', '饮水机', '40', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('308', '剃须刀', '41', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('309', '剃/脱毛器', '41', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('310', '口腔护理', '41', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('311', '电吹风', '41', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('312', '美容器', '41', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('313', '理发器', '41', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('314', '卷/直发器', '41', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('315', '按摩椅', '41', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('316', '按摩器', '41', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('317', '足浴盆', '41', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('318', '血压计', '41', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('319', '电子秤/厨房秤', '41', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('320', '血糖仪', '41', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('321', '体温计', '41', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('322', '其它健康电器', '41', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('323', '计步器/脂肪检测仪', '41', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('324', '电动工具', '42', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('325', '手动工具', '42', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('326', '仪器仪表', '42', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('327', '浴霸/排气扇', '42', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('328', '灯具', '42', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('329', 'LED灯', '42', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('330', '洁身器', '42', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('331', '水槽', '42', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('332', '龙头', '42', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('333', '淋浴花洒', '42', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('334', '厨卫五金', '42', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('335', '家具五金', '42', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('336', '门铃', '42', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('337', '电气开关', '42', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('338', '插座', '42', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('339', '电工电料', '42', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('340', '监控安防', '42', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('341', '电线/线缆', '42', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('342', '数码相机', '43', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('343', '单电/微单相机', '43', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('344', '单反相机', '43', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('345', '摄像机', '43', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('346', '拍立得', '43', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('347', '运动相机', '43', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('348', '镜头', '43', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('349', '户外器材', '43', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('350', '影棚器材', '43', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('351', '冲印服务', '43', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('352', '数码相框', '43', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('353', '存储卡', '44', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('354', '读卡器', '44', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('355', '滤镜', '44', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('356', '闪光灯/手柄', '44', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('357', '相机包', '44', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('358', '三脚架/云台', '44', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('359', '相机清洁/贴膜', '44', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('360', '机身附件', '44', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('361', '镜头附件', '44', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('362', '电池/充电器', '44', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('363', '移动电源', '44', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('364', '数码支架', '44', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('365', '智能手环', '45', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('366', '智能手表', '45', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('367', '智能眼镜', '45', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('368', '运动跟踪器', '45', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('369', '健康监测', '45', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('370', '智能配饰', '45', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('371', '智能家居', '45', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('372', '体感车', '45', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('373', '其他配件', '45', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('374', '智能机器人', '45', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('375', '无人机', '45', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('376', 'MP3/MP4', '46', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('377', '智能设备', '46', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('378', '耳机/耳麦', '46', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('379', '便携/无线音箱', '46', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('380', '音箱/音响', '46', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('381', '高清播放器', '46', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('382', '收音机', '46', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('383', 'MP3/MP4配件', '46', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('384', '麦克风', '46', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('385', '专业音频', '46', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('386', '苹果配件', '46', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('387', '学生平板', '47', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('388', '点读机/笔', '47', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('389', '早教益智', '47', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('390', '录音笔', '47', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('391', '电纸书', '47', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('392', '电子词典', '47', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('393', '复读机', '47', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('394', '延保服务', '48', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('395', '杀毒软件', '48', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('396', '积分商品', '48', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('397', '桌布/罩件', '49', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('398', '地毯地垫', '49', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('399', '沙发垫套/椅垫', '49', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('400', '床品套件', '49', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('401', '被子', '49', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('402', '枕芯', '49', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('403', '床单被罩', '49', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('404', '毯子', '49', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('405', '床垫/床褥', '49', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('406', '蚊帐', '49', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('407', '抱枕靠垫', '49', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('408', '毛巾浴巾', '49', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('409', '电热毯', '49', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('410', '窗帘/窗纱', '49', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('411', '布艺软饰', '49', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('412', '凉席', '49', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('413', '台灯', '50', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('414', '节能灯', '50', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('415', '装饰灯', '50', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('416', '落地灯', '50', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('417', '应急灯/手电', '50', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('418', 'LED灯', '50', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('419', '吸顶灯', '50', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('420', '五金电器', '50', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('421', '筒灯射灯', '50', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('422', '吊灯', '50', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('423', '氛围照明', '50', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('424', '保暖防护', '51', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('425', '收纳用品', '51', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('426', '雨伞雨具', '51', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('427', '浴室用品', '51', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('428', '缝纫/针织用品', '51', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('429', '洗晒/熨烫', '51', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('430', '净化除味', '51', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('431', '相框/照片墙', '52', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('432', '装饰字画', '52', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('433', '节庆饰品', '52', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('434', '手工/十字绣', '52', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('435', '装饰摆件', '52', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('436', '帘艺隔断', '52', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('437', '墙贴/装饰贴', '52', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('438', '钟饰', '52', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('439', '花瓶花艺', '52', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('440', '香薰蜡烛', '52', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('441', '创意家居', '52', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('442', '宠物主粮', '53', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('443', '宠物零食', '53', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('444', '医疗保健', '53', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('445', '家居日用', '53', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('446', '宠物玩具', '53', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('447', '出行装备', '53', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('448', '洗护美容', '53', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('449', '笔记本', '54', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('450', '超极本', '54', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('451', '游戏本', '54', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('452', '平板电脑', '54', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('453', '平板电脑配件', '54', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('454', '台式机', '54', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('455', '服务器/工作站', '54', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('456', '笔记本配件', '54', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('457', '一体机', '54', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('458', 'CPU', '55', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('459', '主板', '55', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('460', '显卡', '55', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('461', '硬盘', '55', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('462', 'SSD固态硬盘', '55', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('463', '内存', '55', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('464', '机箱', '55', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('465', '电源', '55', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('466', '显示器', '55', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('467', '刻录机/光驱', '55', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('468', '散热器', '55', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('469', '声卡/扩展卡', '55', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('470', '装机配件', '55', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('471', '组装电脑', '55', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('472', '移动硬盘', '56', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('473', 'U盘', '56', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('474', '鼠标', '56', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('475', '键盘', '56', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('476', '鼠标垫', '56', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('477', '摄像头', '56', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('478', '手写板', '56', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('479', '硬盘盒', '56', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('480', '插座', '56', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('481', '线缆', '56', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('482', 'UPS电源', '56', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('483', '电脑工具', '56', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('484', '游戏设备', '56', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('485', '电玩', '56', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('486', '电脑清洁', '56', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('487', '网络仪表仪器', '56', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('488', '游戏机', '57', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('489', '游戏耳机', '57', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('490', '手柄/方向盘', '57', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('491', '游戏软件', '57', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('492', '游戏周边', '57', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('493', '路由器', '58', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('494', '网卡', '58', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('495', '交换机', '58', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('496', '网络存储', '58', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('497', '4G/3G上网', '58', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('498', '网络盒子', '58', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('499', '网络配件', '58', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('500', '投影机', '59', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('501', '投影配件', '59', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('502', '多功能一体机', '59', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('503', '打印机', '59', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('504', '传真设备', '59', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('505', '验钞/点钞机', '59', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('506', '扫描设备', '59', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('507', '复合机', '59', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('508', '碎纸机', '59', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('509', '考勤机', '59', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('510', '收款/POS机', '59', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('511', '会议音频视频', '59', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('512', '保险柜', '59', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('513', '装订/封装机', '59', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('514', '安防监控', '59', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('515', '办公家具', '59', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('516', '白板', '59', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('517', '硒鼓/墨粉', '60', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('518', '墨盒', '60', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('519', '色带', '60', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('520', '纸类', '60', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('521', '办公文具', '60', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('522', '学生文具', '60', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('523', '财会用品', '60', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('524', '文件管理', '60', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('525', '本册/便签', '60', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('526', '计算器', '60', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('527', '笔类', '60', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('528', '画具画材', '60', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('529', '刻录碟片/附件', '60', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('530', '上门安装', '61', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('531', '延保服务', '61', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('532', '维修保养', '61', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('533', '电脑软件', '61', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('534', '京东服务', '61', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('535', '炒锅', '62', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('536', '煎锅', '62', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('537', '压力锅', '62', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('538', '蒸锅', '62', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('539', '汤锅', '62', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('540', '奶锅', '62', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('541', '锅具套装', '62', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('542', '煲类', '62', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('543', '水壶', '62', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('544', '火锅', '62', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('545', '菜刀', '63', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('546', '剪刀', '63', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('547', '刀具套装', '63', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('548', '砧板', '63', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('549', '瓜果刀/刨', '63', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('550', '多功能刀', '63', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('551', '保鲜盒', '64', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('552', '烘焙/烧烤', '64', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('553', '饭盒/提锅', '64', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('554', '储物/置物架', '64', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('555', '厨房DIY/小工具', '64', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('556', '塑料杯', '65', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('557', '运动水壶', '65', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('558', '玻璃杯', '65', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('559', '陶瓷/马克杯', '65', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('560', '保温杯', '65', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('561', '保温壶', '65', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('562', '酒杯/酒具', '65', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('563', '杯具套装', '65', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('564', '餐具套装', '66', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('565', '碗/碟/盘', '66', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('566', '筷勺/刀叉', '66', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('567', '一次性用品', '66', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('568', '果盘/果篮', '66', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('569', '自助餐炉', '67', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('570', '酒店餐具', '67', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('571', '酒店水具', '67', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('572', '整套茶具', '68', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('573', '茶杯', '68', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('574', '茶壶', '68', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('575', '茶盘茶托', '68', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('576', '茶叶罐', '68', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('577', '茶具配件', '68', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('578', '茶宠摆件', '68', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('579', '咖啡具', '68', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('580', '其他', '68', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('581', '纸品湿巾', '69', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('582', '衣物清洁', '69', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('583', '清洁工具', '69', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('584', '驱虫用品', '69', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('585', '家庭清洁', '69', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('586', '皮具护理', '69', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('587', '一次性用品', '69', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('588', '洁面', '70', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('589', '乳液面霜', '70', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('590', '面膜', '70', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('591', '剃须', '70', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('592', '套装', '70', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('593', '精华', '70', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('594', '眼霜', '70', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('595', '卸妆', '70', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('596', '防晒', '70', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('597', '防晒隔离', '70', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('598', 'T区护理', '70', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('599', '眼部护理', '70', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('600', '精华露', '70', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('601', '爽肤水', '70', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('602', '沐浴', '71', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('603', '润肤', '71', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('604', '颈部', '71', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('605', '手足', '71', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('606', '纤体塑形', '71', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('607', '美胸', '71', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('608', '套装', '71', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('609', '精油', '71', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('610', '洗发护发', '71', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('611', '染发/造型', '71', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('612', '香薰精油', '71', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('613', '磨砂/浴盐', '71', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('614', '手工/香皂', '71', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('615', '洗发', '71', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('616', '护发', '71', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('617', '染发', '71', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('618', '磨砂膏', '71', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('619', '香皂', '71', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('620', '牙膏/牙粉', '72', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('621', '牙刷/牙线', '72', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('622', '漱口水', '72', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('623', '套装', '72', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('624', '卫生巾', '73', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('625', '卫生护垫', '73', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('626', '私密护理', '73', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('627', '脱毛膏', '73', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('628', '其他', '73', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('629', '洗发', '74', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('630', '护发', '74', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('631', '染发', '74', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('632', '造型', '74', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('633', '假发', '74', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('634', '套装', '74', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('635', '美发工具', '74', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('636', '脸部护理', '74', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('637', '香水', '75', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('638', '底妆', '75', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('639', '腮红', '75', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('640', '眼影', '75', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('641', '唇部', '75', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('642', '美甲', '75', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('643', '眼线', '75', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('644', '美妆工具', '75', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('645', '套装', '75', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('646', '防晒隔离', '75', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('647', '卸妆', '75', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('648', '眉笔', '75', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('649', '睫毛膏', '75', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('650', 'T恤', '76', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('651', '衬衫', '76', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('652', '针织衫', '76', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('653', '雪纺衫', '76', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('654', '卫衣', '76', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('655', '马甲', '76', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('656', '连衣裙', '76', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('657', '半身裙', '76', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('658', '牛仔裤', '76', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('659', '休闲裤', '76', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('660', '打底裤', '76', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('661', '正装裤', '76', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('662', '小西装', '76', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('663', '短外套', '76', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('664', '风衣', '76', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('665', '毛呢大衣', '76', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('666', '真皮皮衣', '76', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('667', '棉服', '76', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('668', '羽绒服', '76', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('669', '大码女装', '76', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('670', '中老年女装', '76', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('671', '婚纱', '76', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('672', '打底衫', '76', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('673', '旗袍/唐装', '76', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('674', '加绒裤', '76', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('675', '吊带/背心', '76', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('676', '羊绒衫', '76', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('677', '短裤', '76', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('678', '皮草', '76', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('679', '礼服', '76', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('680', '仿皮皮衣', '76', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('681', '羊毛衫', '76', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('682', '设计师/潮牌', '76', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('683', '衬衫', '77', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('684', 'T恤', '77', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('685', 'POLO衫', '77', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('686', '针织衫', '77', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('687', '羊绒衫', '77', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('688', '卫衣', '77', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('689', '马甲/背心', '77', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('690', '夹克', '77', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('691', '风衣', '77', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('692', '毛呢大衣', '77', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('693', '仿皮皮衣', '77', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('694', '西服', '77', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('695', '棉服', '77', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('696', '羽绒服', '77', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('697', '牛仔裤', '77', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('698', '休闲裤', '77', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('699', '西裤', '77', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('700', '西服套装', '77', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('701', '大码男装', '77', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('702', '中老年男装', '77', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('703', '唐装/中山装', '77', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('704', '工装', '77', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('705', '真皮皮衣', '77', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('706', '加绒裤', '77', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('707', '卫裤/运动裤', '77', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('708', '短裤', '77', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('709', '设计师/潮牌', '77', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('710', '羊毛衫', '77', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('711', '文胸', '78', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('712', '女式内裤', '78', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('713', '男式内裤', '78', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('714', '睡衣/家居服', '78', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('715', '塑身美体', '78', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('716', '泳衣', '78', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('717', '吊带/背心', '78', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('718', '抹胸', '78', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('719', '连裤袜/丝袜', '78', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('720', '美腿袜', '78', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('721', '商务男袜', '78', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('722', '保暖内衣', '78', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('723', '情侣睡衣', '78', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('724', '文胸套装', '78', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('725', '少女文胸', '78', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('726', '休闲棉袜', '78', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('727', '大码内衣', '78', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('728', '内衣配件', '78', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('729', '打底裤袜', '78', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('730', '打底衫', '78', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('731', '秋衣秋裤', '78', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('732', '情趣内衣', '78', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('733', '服装洗护', '79', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('734', '太阳镜', '80', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('735', '光学镜架/镜片', '80', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('736', '围巾/手套/帽子套装', '80', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('737', '袖扣', '80', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('738', '棒球帽', '80', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('739', '毛线帽', '80', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('740', '遮阳帽', '80', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('741', '老花镜', '80', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('742', '装饰眼镜', '80', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('743', '防辐射眼镜', '80', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('744', '游泳镜', '80', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('745', '女士丝巾/围巾/披肩', '80', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('746', '男士丝巾/围巾', '80', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('747', '鸭舌帽', '80', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('748', '贝雷帽', '80', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('749', '礼帽', '80', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('750', '真皮手套', '80', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('751', '毛线手套', '80', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('752', '防晒手套', '80', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('753', '男士腰带/礼盒', '80', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('754', '女士腰带/礼盒', '80', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('755', '钥匙扣', '80', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('756', '遮阳伞/雨伞', '80', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('757', '口罩', '80', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('758', '耳罩/耳包', '80', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('759', '假领', '80', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('760', '毛线/布面料', '80', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('761', '领带/领结/领带夹', '80', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('762', '男表', '81', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('763', '瑞表', '81', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('764', '女表', '81', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('765', '国表', '81', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('766', '日韩表', '81', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('767', '欧美表', '81', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('768', '德表', '81', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('769', '儿童手表', '81', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('770', '智能手表', '81', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('771', '闹钟', '81', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('772', '座钟挂钟', '81', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('773', '钟表配件', '81', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('774', '商务休闲鞋', '82', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('775', '正装鞋', '82', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('776', '休闲鞋', '82', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('777', '凉鞋/沙滩鞋', '82', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('778', '男靴', '82', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('779', '功能鞋', '82', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('780', '拖鞋/人字拖', '82', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('781', '雨鞋/雨靴', '82', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('782', '传统布鞋', '82', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('783', '鞋配件', '82', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('784', '帆布鞋', '82', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('785', '增高鞋', '82', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('786', '工装鞋', '82', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('787', '定制鞋', '82', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('788', '高跟鞋', '83', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('789', '单鞋', '83', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('790', '休闲鞋', '83', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('791', '凉鞋', '83', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('792', '女靴', '83', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('793', '雪地靴', '83', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('794', '拖鞋/人字拖', '83', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('795', '踝靴', '83', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('796', '筒靴', '83', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('797', '帆布鞋', '83', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('798', '雨鞋/雨靴', '83', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('799', '妈妈鞋', '83', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('800', '鞋配件', '83', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('801', '特色鞋', '83', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('802', '鱼嘴鞋', '83', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('803', '布鞋/绣花鞋', '83', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('804', '马丁靴', '83', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('805', '坡跟鞋', '83', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('806', '松糕鞋', '83', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('807', '内增高', '83', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('808', '防水台', '83', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('809', '婴幼奶粉', '84', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('810', '孕妈奶粉', '84', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('811', '益生菌/初乳', '85', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('812', '米粉/菜粉', '85', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('813', '果泥/果汁', '85', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('814', 'DHA', '85', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('815', '宝宝零食', '85', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('816', '钙铁锌/维生素', '85', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('817', '清火/开胃', '85', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('818', '面条/粥', '85', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('819', '婴儿尿裤', '86', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('820', '拉拉裤', '86', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('821', '婴儿湿巾', '86', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('822', '成人尿裤', '86', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('823', '奶瓶奶嘴', '87', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('824', '吸奶器', '87', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('825', '暖奶消毒', '87', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('826', '儿童餐具', '87', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('827', '水壶/水杯', '87', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('828', '牙胶安抚', '87', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('829', '围兜/防溅衣', '87', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('830', '辅食料理机', '87', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('831', '食物存储', '87', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('832', '宝宝护肤', '88', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('833', '洗发沐浴', '88', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('834', '奶瓶清洗', '88', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('835', '驱蚊防晒', '88', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('836', '理发器', '88', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('837', '洗澡用具', '88', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('838', '婴儿口腔清洁', '88', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('839', '洗衣液/皂', '88', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('840', '日常护理', '88', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('841', '座便器', '88', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('842', '婴儿推车', '89', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('843', '餐椅摇椅', '89', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('844', '婴儿床', '89', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('845', '学步车', '89', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('846', '三轮车', '89', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('847', '自行车', '89', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('848', '电动车', '89', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('849', '扭扭车', '89', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('850', '滑板车', '89', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('851', '婴儿床垫', '89', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('852', '婴儿外出服', '90', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('853', '婴儿内衣', '90', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('854', '婴儿礼盒', '90', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('855', '婴儿鞋帽袜', '90', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('856', '安全防护', '90', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('857', '家居床品', '90', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('858', '睡袋/抱被', '90', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('859', '爬行垫', '90', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('860', '妈咪包/背婴带', '91', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('861', '产后塑身', '91', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('862', '文胸/内裤', '91', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('863', '防辐射服', '91', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('864', '孕妈装', '91', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('865', '孕期营养', '91', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('866', '孕妇护肤', '91', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('867', '待产护理', '91', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('868', '月子装', '91', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('869', '防溢乳垫', '91', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('870', '套装', '92', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('871', '上衣', '92', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('872', '裤子', '92', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('873', '裙子', '92', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('874', '内衣/家居服', '92', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('875', '羽绒服/棉服', '92', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('876', '亲子装', '92', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('877', '儿童配饰', '92', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('878', '礼服/演出服', '92', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('879', '运动鞋', '92', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('880', '皮鞋/帆布鞋', '92', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('881', '靴子', '92', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('882', '凉鞋', '92', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('883', '功能鞋', '92', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('884', '户外/运动服', '92', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('885', '提篮式', '93', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('886', '安全座椅', '93', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('887', '增高垫', '93', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('888', '钱包', '94', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('889', '手拿包', '94', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('890', '单肩包', '94', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('891', '双肩包', '94', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('892', '手提包', '94', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('893', '斜挎包', '94', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('894', '钥匙包', '94', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('895', '卡包/零钱包', '94', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('896', '男士钱包', '95', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('897', '男士手包', '95', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('898', '卡包名片夹', '95', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('899', '商务公文包', '95', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('900', '双肩包', '95', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('901', '单肩/斜挎包', '95', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('902', '钥匙包', '95', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('903', '电脑包', '96', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('904', '拉杆箱', '96', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('905', '旅行包', '96', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('906', '旅行配件', '96', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('907', '休闲运动包', '96', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('908', '拉杆包', '96', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('909', '登山包', '96', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('910', '妈咪包', '96', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('911', '书包', '96', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('912', '相机包', '96', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('913', '腰包/胸包', '96', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('914', '火机烟具', '97', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('915', '礼品文具', '97', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('916', '军刀军具', '97', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('917', '收藏品', '97', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('918', '工艺礼品', '97', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('919', '创意礼品', '97', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('920', '礼盒礼券', '97', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('921', '鲜花绿植', '97', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('922', '婚庆节庆', '97', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('923', '京东卡', '97', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('924', '美妆礼品', '97', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('925', '礼品定制', '97', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('926', '京东福卡', '97', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('927', '古董文玩', '97', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('928', '箱包', '98', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('929', '钱包', '98', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('930', '服饰', '98', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('931', '腰带', '98', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('932', '太阳镜/眼镜框', '98', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('933', '配件', '98', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('934', '鞋靴', '98', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('935', '饰品', '98', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('936', '名品腕表', '98', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('937', '高档化妆品', '98', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('938', '婚嫁首饰', '99', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('939', '婚纱摄影', '99', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('940', '婚纱礼服', '99', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('941', '婚庆服务', '99', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('942', '婚庆礼品/用品', '99', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('943', '婚宴', '99', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('944', '饼干蛋糕', '100', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('945', '糖果/巧克力', '100', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('946', '休闲零食', '100', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('947', '冲调饮品', '100', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('948', '粮油调味', '100', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('949', '牛奶', '100', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('950', '其他特产', '101', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('951', '新疆', '101', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('952', '北京', '101', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('953', '山西', '101', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('954', '内蒙古', '101', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('955', '福建', '101', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('956', '湖南', '101', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('957', '四川', '101', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('958', '云南', '101', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('959', '东北', '101', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('960', '休闲零食', '102', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('961', '坚果炒货', '102', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('962', '肉干肉脯', '102', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('963', '蜜饯果干', '102', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('964', '糖果/巧克力', '102', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('965', '饼干蛋糕', '102', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('966', '无糖食品', '102', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('967', '米面杂粮', '103', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('968', '食用油', '103', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('969', '调味品', '103', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('970', '南北干货', '103', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('971', '方便食品', '103', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('972', '有机食品', '103', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('973', '饮用水', '104', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('974', '饮料', '104', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('975', '牛奶乳品', '104', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('976', '咖啡/奶茶', '104', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('977', '冲饮谷物', '104', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('978', '蜂蜜/柚子茶', '104', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('979', '成人奶粉', '104', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('980', '月饼', '105', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('981', '大闸蟹', '105', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('982', '粽子', '105', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('983', '卡券', '105', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('984', '铁观音', '106', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('985', '普洱', '106', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('986', '龙井', '106', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('987', '绿茶', '106', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('988', '红茶', '106', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('989', '乌龙茶', '106', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('990', '花草茶', '106', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('991', '花果茶', '106', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('992', '养生茶', '106', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('993', '黑茶', '106', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('994', '白茶', '106', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('995', '其它茶', '106', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('996', '项链', '107', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('997', '手链/脚链', '107', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('998', '戒指', '107', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('999', '耳饰', '107', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1000', '毛衣链', '107', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1001', '发饰/发卡', '107', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1002', '胸针', '107', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1003', '饰品配件', '107', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1004', '婚庆饰品', '107', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1005', '黄金吊坠', '108', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1006', '黄金项链', '108', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1007', '黄金转运珠', '108', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1008', '黄金手镯/手链/脚链', '108', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1009', '黄金耳饰', '108', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1010', '黄金戒指', '108', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1011', 'K金吊坠', '109', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1012', 'K金项链', '109', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1013', 'K金手镯/手链/脚链', '109', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1014', 'K金戒指', '109', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1015', 'K金耳饰', '109', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1016', '投资金', '110', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1017', '投资银', '110', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1018', '投资收藏', '110', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1019', '银吊坠/项链', '111', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1020', '银手镯/手链/脚链', '111', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1021', '银戒指', '111', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1022', '银耳饰', '111', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1023', '足银手镯', '111', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1024', '宝宝银饰', '111', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1025', '裸钻', '112', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1026', '钻戒', '112', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1027', '钻石项链/吊坠', '112', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1028', '钻石耳饰', '112', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1029', '钻石手镯/手链', '112', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1030', '项链/吊坠', '113', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1031', '手镯/手串', '113', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1032', '戒指', '113', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1033', '耳饰', '113', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1034', '挂件/摆件/把件', '113', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1035', '玉石孤品', '113', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1036', '项链/吊坠', '114', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1037', '耳饰', '114', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1038', '手镯/手链/脚链', '114', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1039', '戒指', '114', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1040', '头饰/胸针', '114', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1041', '摆件/挂件', '114', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1042', '琥珀/蜜蜡', '115', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1043', '碧玺', '115', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1044', '红宝石/蓝宝石', '115', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1045', '坦桑石', '115', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1046', '珊瑚', '115', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1047', '祖母绿', '115', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1048', '葡萄石', '115', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1049', '其他天然宝石', '115', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1050', '项链/吊坠', '115', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1051', '耳饰', '115', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1052', '手镯/手链', '115', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1053', '戒指', '115', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1054', '铂金项链/吊坠', '116', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1055', '铂金手镯/手链/脚链', '116', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1056', '铂金戒指', '116', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1057', '铂金耳饰', '116', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1058', '小叶紫檀', '117', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1059', '黄花梨', '117', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1060', '沉香木', '117', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1061', '金丝楠', '117', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1062', '菩提', '117', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1063', '其他', '117', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1064', '橄榄核/核桃', '117', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1065', '檀香', '117', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1066', '珍珠项链', '118', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1067', '珍珠吊坠', '118', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1068', '珍珠耳饰', '118', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1069', '珍珠手链', '118', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1070', '珍珠戒指', '118', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1071', '珍珠胸针', '118', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1072', '机油', '119', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1073', '正时皮带', '119', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1074', '添加剂', '119', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1075', '汽车喇叭', '119', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1076', '防冻液', '119', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1077', '汽车玻璃', '119', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1078', '滤清器', '119', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1079', '火花塞', '119', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1080', '减震器', '119', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1081', '柴机油/辅助油', '119', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1082', '雨刷', '119', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1083', '车灯', '119', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1084', '后视镜', '119', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1085', '轮胎', '119', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1086', '轮毂', '119', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1087', '刹车片/盘', '119', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1088', '维修配件', '119', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1089', '蓄电池', '119', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1090', '底盘装甲/护板', '119', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1091', '贴膜', '119', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1092', '汽修工具', '119', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1093', '改装配件', '119', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1094', '导航仪', '120', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1095', '安全预警仪', '120', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1096', '行车记录仪', '120', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1097', '倒车雷达', '120', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1098', '蓝牙设备', '120', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1099', '车载影音', '120', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1100', '净化器', '120', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1101', '电源', '120', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1102', '智能驾驶', '120', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1103', '车载电台', '120', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1104', '车载电器配件', '120', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1105', '吸尘器', '120', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1106', '智能车机', '120', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1107', '冰箱', '120', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1108', '汽车音响', '120', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1109', '车载生活电器', '120', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1110', '车蜡', '121', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1111', '补漆笔', '121', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1112', '玻璃水', '121', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1113', '清洁剂', '121', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1114', '洗车工具', '121', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1115', '镀晶镀膜', '121', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1116', '打蜡机', '121', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1117', '洗车配件', '121', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1118', '洗车机', '121', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1119', '洗车水枪', '121', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1120', '毛巾掸子', '121', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1121', '脚垫', '122', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1122', '座垫', '122', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1123', '座套', '122', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1124', '后备箱垫', '122', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1125', '头枕腰靠', '122', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1126', '方向盘套', '122', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1127', '香水', '122', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1128', '空气净化', '122', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1129', '挂件摆件', '122', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1130', '功能小件', '122', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1131', '车身装饰件', '122', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1132', '车衣', '122', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1133', '安全座椅', '123', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1134', '胎压监测', '123', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1135', '防盗设备', '123', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1136', '应急救援', '123', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1137', '保温箱', '123', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1138', '地锁', '123', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1139', '摩托车', '123', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1140', '充气泵', '123', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1141', '储物箱', '123', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1142', '自驾野营', '123', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1143', '摩托车装备', '123', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1144', '清洗美容', '124', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1145', '功能升级', '124', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1146', '保养维修', '124', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1147', '油卡充值', '124', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1148', '车险', '124', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1149', '加油卡', '124', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1150', 'ETC', '124', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1151', '驾驶培训', '124', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1152', '赛事服装', '125', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1153', '赛事用品', '125', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1154', '制动系统', '125', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1155', '悬挂系统', '125', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1156', '进气系统', '125', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1157', '排气系统', '125', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1158', '电子管理', '125', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1159', '车身强化', '125', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1160', '赛事座椅', '125', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1161', '跑步鞋', '126', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1162', '休闲鞋', '126', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1163', '篮球鞋', '126', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1164', '板鞋', '126', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1165', '帆布鞋', '126', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1166', '足球鞋', '126', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1167', '乒羽网鞋', '126', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1168', '专项运动鞋', '126', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1169', '训练鞋', '126', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1170', '拖鞋', '126', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1171', '运动包', '126', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1172', '羽绒服', '127', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1173', '棉服', '127', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1174', '运动裤', '127', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1175', '夹克/风衣', '127', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1176', '卫衣/套头衫', '127', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1177', 'T恤', '127', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1178', '套装', '127', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1179', '乒羽网服', '127', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1180', '健身服', '127', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1181', '运动背心', '127', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1182', '毛衫/线衫', '127', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1183', '运动配饰', '127', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1184', '折叠车', '128', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1185', '山地车/公路车', '128', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1186', '电动车', '128', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1187', '其他整车', '128', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1188', '骑行服', '128', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1189', '骑行装备', '128', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1190', '平衡车', '128', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1191', '鱼竿鱼线', '129', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1192', '浮漂鱼饵', '129', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1193', '钓鱼桌椅', '129', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1194', '钓鱼配件', '129', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1195', '钓箱鱼包', '129', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1196', '其它', '129', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1197', '泳镜', '130', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1198', '泳帽', '130', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1199', '游泳包防水包', '130', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1200', '女士泳衣', '130', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1201', '男士泳衣', '130', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1202', '比基尼', '130', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1203', '其它', '130', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1204', '冲锋衣裤', '131', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1205', '速干衣裤', '131', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1206', '滑雪服', '131', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1207', '羽绒服/棉服', '131', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1208', '休闲衣裤', '131', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1209', '抓绒衣裤', '131', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1210', '软壳衣裤', '131', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1211', 'T恤', '131', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1212', '户外风衣', '131', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1213', '功能内衣', '131', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1214', '军迷服饰', '131', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1215', '登山鞋', '131', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1216', '雪地靴', '131', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1217', '徒步鞋', '131', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1218', '越野跑鞋', '131', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1219', '休闲鞋', '131', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1220', '工装鞋', '131', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1221', '溯溪鞋', '131', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1222', '沙滩/凉拖', '131', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1223', '户外袜', '131', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1224', '帐篷/垫子', '132', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1225', '睡袋/吊床', '132', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1226', '登山攀岩', '132', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1227', '户外配饰', '132', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1228', '背包', '132', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1229', '户外照明', '132', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1230', '户外仪表', '132', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1231', '户外工具', '132', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1232', '望远镜', '132', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1233', '旅游用品', '132', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1234', '便携桌椅床', '132', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1235', '野餐烧烤', '132', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1236', '军迷用品', '132', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1237', '救援装备', '132', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1238', '滑雪装备', '132', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1239', '极限户外', '132', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1240', '冲浪潜水', '132', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1241', '综合训练器', '133', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1242', '其他大型器械', '133', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1243', '哑铃', '133', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1244', '仰卧板/收腹机', '133', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1245', '其他中小型器材', '133', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1246', '瑜伽舞蹈', '133', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1247', '甩脂机', '133', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1248', '踏步机', '133', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1249', '武术搏击', '133', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1250', '健身车/动感单车', '133', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1251', '跑步机', '133', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1252', '运动护具', '133', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1253', '羽毛球', '134', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1254', '乒乓球', '134', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1255', '篮球', '134', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1256', '足球', '134', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1257', '网球', '134', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1258', '排球', '134', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1259', '高尔夫', '134', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1260', '台球', '134', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1261', '棋牌麻将', '134', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1262', '轮滑滑板', '134', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1263', '其他', '134', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1264', '0-6个月', '135', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1265', '6-12个月', '135', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1266', '1-3岁', '135', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1267', '3-6岁', '135', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1268', '6-14岁', '135', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1269', '14岁以上', '135', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1270', '遥控车', '136', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1271', '遥控飞机', '136', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1272', '遥控船', '136', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1273', '机器人', '136', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1274', '轨道/助力', '136', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1275', '毛绒/布艺', '137', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1276', '靠垫/抱枕', '137', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1277', '芭比娃娃', '138', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1278', '卡通娃娃', '138', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1279', '智能娃娃', '138', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1280', '仿真模型', '139', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1281', '拼插模型', '139', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1282', '收藏爱好', '139', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1283', '炫舞毯', '140', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1284', '爬行垫/毯', '140', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1285', '户外玩具', '140', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1286', '戏水玩具', '140', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1287', '电影周边', '141', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1288', '卡通周边', '141', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1289', '网游周边', '141', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1290', '摇铃/床铃', '142', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1291', '健身架', '142', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1292', '早教启智', '142', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1293', '拖拉玩具', '142', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1294', '积木', '143', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1295', '拼图', '143', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1296', '磁力棒', '143', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1297', '立体拼插', '143', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1298', '手工彩泥', '144', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1299', '绘画工具', '144', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1300', '情景玩具', '144', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1301', '减压玩具', '145', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1302', '创意玩具', '145', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1303', '钢琴', '146', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1304', '电子琴/电钢琴', '146', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1305', '吉他/尤克里里', '146', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1306', '打击乐器', '146', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1307', '西洋管弦', '146', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1308', '民族管弦乐器', '146', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1309', '乐器配件', '146', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1310', '电脑音乐', '146', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1311', '工艺礼品乐器', '146', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1312', '口琴/口风琴/竖笛', '146', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1313', '手风琴', '146', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1314', '双色球', '147', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1315', '大乐透', '147', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1316', '福彩3D', '147', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1317', '排列三', '147', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1318', '排列五', '147', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1319', '七星彩', '147', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1320', '七乐彩', '147', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1321', '竞彩足球', '147', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1322', '竞彩篮球', '147', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1323', '新时时彩', '147', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1324', '国内机票', '148', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1325', '国内酒店', '149', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1326', '酒店团购', '149', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1327', '度假', '150', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1328', '景点', '150', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1329', '租车', '150', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1330', '火车票', '150', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1331', '旅游团购', '150', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1332', '手机充值', '151', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1333', '游戏点卡', '152', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1334', 'QQ充值', '152', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1335', '电影票', '153', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1336', '演唱会', '153', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1337', '话剧歌剧', '153', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1338', '音乐会', '153', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1339', '体育赛事', '153', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1340', '舞蹈芭蕾', '153', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1341', '戏曲综艺', '153', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1342', '东北', '154', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1343', '华北', '154', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1344', '西北', '154', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1345', '华中', '154', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1346', '华东', '154', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1347', '华南', '154', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1348', '西南', '154', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1349', '苹果', '155', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1350', '橙子', '155', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1351', '奇异果/猕猴桃', '155', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1352', '车厘子/樱桃', '155', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1353', '芒果', '155', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1354', '蓝莓', '155', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1355', '火龙果', '155', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1356', '葡萄/提子', '155', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1357', '柚子', '155', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1358', '香蕉', '155', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1359', '牛油果', '155', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1360', '梨', '155', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1361', '菠萝/凤梨', '155', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1362', '桔/橘', '155', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1363', '柠檬', '155', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1364', '草莓', '155', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1365', '桃/李/杏', '155', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1366', '更多水果', '155', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1367', '水果礼盒/券', '155', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1368', '牛肉', '156', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1369', '羊肉', '156', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1370', '猪肉', '156', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1371', '内脏类', '156', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1372', '鱼类', '157', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1373', '虾类', '157', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1374', '蟹类', '157', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1375', '贝类', '157', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1376', '海参', '157', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1377', '海产干货', '157', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1378', '其他水产', '157', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1379', '海产礼盒', '157', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1380', '鸡肉', '158', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1381', '鸭肉', '158', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1382', '蛋类', '158', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1383', '其他禽类', '158', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1384', '水饺/馄饨', '159', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1385', '汤圆/元宵', '159', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1386', '面点', '159', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1387', '火锅丸串', '159', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1388', '速冻半成品', '159', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1389', '奶酪黄油', '159', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1390', '熟食', '160', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1391', '腊肠/腊肉', '160', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1392', '火腿', '160', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1393', '糕点', '160', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1394', '礼品卡券', '160', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1395', '冷藏果蔬汁', '161', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1396', '冰激凌', '161', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1397', '其他', '161', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1398', '叶菜类', '162', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1399', '茄果瓜类', '162', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1400', '根茎类', '162', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1401', '鲜菌菇', '162', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1402', '葱姜蒜椒', '162', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1403', '半加工蔬菜', '162', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1404', '微型车', '163', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1405', '小型车', '163', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1406', '紧凑型车', '163', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1407', '中型车', '163', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1408', '中大型车', '163', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1409', '豪华车', '163', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1410', 'MPV', '163', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1411', 'SUV', '163', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1412', '跑车', '163', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1413', '微型车（二手）', '164', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1414', '小型车（二手）', '164', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1415', '紧凑型车（二手）', '164', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1416', '中型车（二手）', '164', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1417', '中大型车（二手）', '164', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1418', '豪华车（二手）', '164', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1419', 'MPV（二手）', '164', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1420', 'SUV（二手）', '164', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1421', '跑车（二手）', '164', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1422', '皮卡（二手）', '164', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1423', '面包车（二手）', '164', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1431', 'dsa323', '1', '2', '1', null, null, null, null);
INSERT INTO `pms_category` VALUES ('1432', 'fdsffdsadddd大萨达', '1431', '3', '1', null, null, null, null);

-- ----------------------------
-- Table structure for pms_category_brand_relation
-- ----------------------------
DROP TABLE IF EXISTS `pms_category_brand_relation`;
CREATE TABLE `pms_category_brand_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `brand_id` bigint(20) DEFAULT NULL COMMENT '品牌id',
  `catelog_id` bigint(20) DEFAULT NULL COMMENT '分类id',
  `brand_name` varchar(255) DEFAULT NULL,
  `catelog_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COMMENT='品牌分类关联';

-- ----------------------------
-- Records of pms_category_brand_relation
-- ----------------------------
INSERT INTO `pms_category_brand_relation` VALUES ('13', '9', '225', '华为', '手机');
INSERT INTO `pms_category_brand_relation` VALUES ('15', '9', '250', '华为', '平板电视');
INSERT INTO `pms_category_brand_relation` VALUES ('16', '9', '449', '华为', '笔记本');
INSERT INTO `pms_category_brand_relation` VALUES ('17', '10', '449', '小米', '笔记本');
INSERT INTO `pms_category_brand_relation` VALUES ('18', '10', '225', '小米', '手机');
INSERT INTO `pms_category_brand_relation` VALUES ('19', '10', '231', '小米', '移动电源');
INSERT INTO `pms_category_brand_relation` VALUES ('20', '10', '233', '小米', '蓝牙耳机');
INSERT INTO `pms_category_brand_relation` VALUES ('21', '10', '250', '小米', '平板电视');
INSERT INTO `pms_category_brand_relation` VALUES ('22', '10', '449', '小米', '笔记本');
INSERT INTO `pms_category_brand_relation` VALUES ('23', '11', '225', 'oppo', '手机');
INSERT INTO `pms_category_brand_relation` VALUES ('24', '11', '227', 'oppo', '合约机');
INSERT INTO `pms_category_brand_relation` VALUES ('25', '12', '225', 'Apple', '手机');
INSERT INTO `pms_category_brand_relation` VALUES ('26', '12', '243', 'Apple', 'iPhone 配件');
INSERT INTO `pms_category_brand_relation` VALUES ('27', '12', '366', 'Apple', '智能手表');

-- ----------------------------
-- Table structure for pms_comment_replay
-- ----------------------------
DROP TABLE IF EXISTS `pms_comment_replay`;
CREATE TABLE `pms_comment_replay` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `comment_id` bigint(20) DEFAULT NULL COMMENT '评论id',
  `reply_id` bigint(20) DEFAULT NULL COMMENT '回复id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='商品评价回复关系';

-- ----------------------------
-- Records of pms_comment_replay
-- ----------------------------

-- ----------------------------
-- Table structure for pms_product_attr_value
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_attr_value`;
CREATE TABLE `pms_product_attr_value` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `spu_id` bigint(20) DEFAULT NULL COMMENT '商品id',
  `attr_id` bigint(20) DEFAULT NULL COMMENT '属性id',
  `attr_name` varchar(200) DEFAULT NULL COMMENT '属性名',
  `attr_value` varchar(200) DEFAULT NULL COMMENT '属性值',
  `attr_sort` int(11) DEFAULT NULL COMMENT '顺序',
  `quick_show` tinyint(4) DEFAULT NULL COMMENT '快速展示【是否展示在介绍上；0-否 1-是】',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COMMENT='spu属性值';

-- ----------------------------
-- Records of pms_product_attr_value
-- ----------------------------
INSERT INTO `pms_product_attr_value` VALUES ('55', '13', '7', '入网型号', 'A2217', null, '0');
INSERT INTO `pms_product_attr_value` VALUES ('56', '13', '8', '上市年份', '2018', null, '0');
INSERT INTO `pms_product_attr_value` VALUES ('57', '13', '13', '机身长度（mm）', '158.3', null, '0');
INSERT INTO `pms_product_attr_value` VALUES ('58', '13', '14', '机身材质工艺', '以官网信息为准', null, '0');
INSERT INTO `pms_product_attr_value` VALUES ('59', '13', '15', 'CPU品牌', '以官网信息为准', null, '1');
INSERT INTO `pms_product_attr_value` VALUES ('60', '13', '16', 'CPU型号', 'A13仿生', null, '1');
INSERT INTO `pms_product_attr_value` VALUES ('61', '11', '7', '入网型号', 'LIO-AL00', null, '1');
INSERT INTO `pms_product_attr_value` VALUES ('62', '11', '8', '上市年份', '2019', null, '0');
INSERT INTO `pms_product_attr_value` VALUES ('63', '11', '11', '机身颜色', '黑色', null, '1');
INSERT INTO `pms_product_attr_value` VALUES ('64', '11', '13', '机身长度（mm）', '158.3', null, '1');
INSERT INTO `pms_product_attr_value` VALUES ('65', '11', '14', '机身材质工艺', '玻璃;陶瓷', null, '0');
INSERT INTO `pms_product_attr_value` VALUES ('66', '11', '15', 'CPU品牌', '海思（Hisilicon）', null, '1');
INSERT INTO `pms_product_attr_value` VALUES ('67', '11', '16', 'CPU型号', 'HUAWEI Kirin 970', null, '1');

-- ----------------------------
-- Table structure for pms_sku_images
-- ----------------------------
DROP TABLE IF EXISTS `pms_sku_images`;
CREATE TABLE `pms_sku_images` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `sku_id` bigint(20) DEFAULT NULL COMMENT 'sku_id',
  `img_url` varchar(255) DEFAULT NULL COMMENT '图片地址',
  `img_sort` int(11) DEFAULT NULL COMMENT '排序',
  `default_img` int(11) DEFAULT NULL COMMENT '默认图[0 - 不是默认图，1 - 是默认图]',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8mb4 COMMENT='sku图片';

-- ----------------------------
-- Records of pms_sku_images
-- ----------------------------
INSERT INTO `pms_sku_images` VALUES ('1', '1', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/ef2691e5-de1a-4ca3-827d-a60f39fbda93_0d40c24b264aa511.jpg', null, '0');
INSERT INTO `pms_sku_images` VALUES ('2', '1', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/20f83b0c-86ba-4a64-808a-f2ace190ea2c_1f15cdbcf9e1273c.jpg', null, '0');
INSERT INTO `pms_sku_images` VALUES ('3', '1', '', null, '0');
INSERT INTO `pms_sku_images` VALUES ('4', '1', '', null, '0');
INSERT INTO `pms_sku_images` VALUES ('5', '1', '', null, '0');
INSERT INTO `pms_sku_images` VALUES ('6', '1', '', null, '0');
INSERT INTO `pms_sku_images` VALUES ('7', '1', '', null, '0');
INSERT INTO `pms_sku_images` VALUES ('8', '1', '', null, '0');
INSERT INTO `pms_sku_images` VALUES ('9', '1', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/d12516dd-43cf-4ace-8dc9-14618d2d75e4_919c850652e98031.jpg', null, '0');
INSERT INTO `pms_sku_images` VALUES ('10', '1', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/60e65a44-f943-4ed5-87c8-8cf90f403018_d511faab82abb34b.jpg', null, '1');
INSERT INTO `pms_sku_images` VALUES ('11', '2', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/ef2691e5-de1a-4ca3-827d-a60f39fbda93_0d40c24b264aa511.jpg', null, '1');
INSERT INTO `pms_sku_images` VALUES ('12', '2', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/20f83b0c-86ba-4a64-808a-f2ace190ea2c_1f15cdbcf9e1273c.jpg', null, '0');
INSERT INTO `pms_sku_images` VALUES ('13', '2', '', null, '0');
INSERT INTO `pms_sku_images` VALUES ('14', '2', '', null, '0');
INSERT INTO `pms_sku_images` VALUES ('15', '2', '', null, '0');
INSERT INTO `pms_sku_images` VALUES ('16', '2', '', null, '0');
INSERT INTO `pms_sku_images` VALUES ('17', '2', '', null, '0');
INSERT INTO `pms_sku_images` VALUES ('18', '2', '', null, '0');
INSERT INTO `pms_sku_images` VALUES ('19', '2', '', null, '0');
INSERT INTO `pms_sku_images` VALUES ('20', '2', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/60e65a44-f943-4ed5-87c8-8cf90f403018_d511faab82abb34b.jpg', null, '0');
INSERT INTO `pms_sku_images` VALUES ('21', '3', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/ef2691e5-de1a-4ca3-827d-a60f39fbda93_0d40c24b264aa511.jpg', null, '1');
INSERT INTO `pms_sku_images` VALUES ('22', '3', '', null, '0');
INSERT INTO `pms_sku_images` VALUES ('23', '3', '', null, '0');
INSERT INTO `pms_sku_images` VALUES ('24', '3', '', null, '0');
INSERT INTO `pms_sku_images` VALUES ('25', '3', '', null, '0');
INSERT INTO `pms_sku_images` VALUES ('26', '3', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/099f297e-ddea-4fb5-87c7-78cd88e500c0_28f296629cca865e.jpg', null, '0');
INSERT INTO `pms_sku_images` VALUES ('27', '3', '', null, '0');
INSERT INTO `pms_sku_images` VALUES ('28', '3', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/7aa1019e-4e01-49dd-8ac4-7d2794d0b1a8_335b2c690e43a8f8.jpg', null, '0');
INSERT INTO `pms_sku_images` VALUES ('29', '3', '', null, '0');
INSERT INTO `pms_sku_images` VALUES ('30', '3', '', null, '0');
INSERT INTO `pms_sku_images` VALUES ('31', '4', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/ef2691e5-de1a-4ca3-827d-a60f39fbda93_0d40c24b264aa511.jpg', null, '1');
INSERT INTO `pms_sku_images` VALUES ('32', '4', '', null, '0');
INSERT INTO `pms_sku_images` VALUES ('33', '4', '', null, '0');
INSERT INTO `pms_sku_images` VALUES ('34', '4', '', null, '0');
INSERT INTO `pms_sku_images` VALUES ('35', '4', '', null, '0');
INSERT INTO `pms_sku_images` VALUES ('36', '4', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/099f297e-ddea-4fb5-87c7-78cd88e500c0_28f296629cca865e.jpg', null, '0');
INSERT INTO `pms_sku_images` VALUES ('37', '4', '', null, '0');
INSERT INTO `pms_sku_images` VALUES ('38', '4', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/7aa1019e-4e01-49dd-8ac4-7d2794d0b1a8_335b2c690e43a8f8.jpg', null, '0');
INSERT INTO `pms_sku_images` VALUES ('39', '4', '', null, '0');
INSERT INTO `pms_sku_images` VALUES ('40', '4', '', null, '0');
INSERT INTO `pms_sku_images` VALUES ('41', '5', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/ef2691e5-de1a-4ca3-827d-a60f39fbda93_0d40c24b264aa511.jpg', null, '1');
INSERT INTO `pms_sku_images` VALUES ('42', '5', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/20f83b0c-86ba-4a64-808a-f2ace190ea2c_1f15cdbcf9e1273c.jpg', null, '0');
INSERT INTO `pms_sku_images` VALUES ('43', '5', '', null, '0');
INSERT INTO `pms_sku_images` VALUES ('44', '5', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/9a6ba5c0-0a31-4364-8759-012bdfbf5ad3_3c24f9cd69534030.jpg', null, '0');
INSERT INTO `pms_sku_images` VALUES ('45', '5', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/a73ef55a-79b4-41d9-8eb6-760c8b5a33dc_23d9fbb256ea5d4a.jpg', null, '0');
INSERT INTO `pms_sku_images` VALUES ('46', '5', '', null, '0');
INSERT INTO `pms_sku_images` VALUES ('47', '5', '', null, '0');
INSERT INTO `pms_sku_images` VALUES ('48', '5', '', null, '0');
INSERT INTO `pms_sku_images` VALUES ('49', '5', '', null, '0');
INSERT INTO `pms_sku_images` VALUES ('50', '5', '', null, '0');
INSERT INTO `pms_sku_images` VALUES ('51', '6', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/ef2691e5-de1a-4ca3-827d-a60f39fbda93_0d40c24b264aa511.jpg', null, '1');
INSERT INTO `pms_sku_images` VALUES ('52', '6', '', null, '0');
INSERT INTO `pms_sku_images` VALUES ('53', '6', '', null, '0');
INSERT INTO `pms_sku_images` VALUES ('54', '6', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/9a6ba5c0-0a31-4364-8759-012bdfbf5ad3_3c24f9cd69534030.jpg', null, '0');
INSERT INTO `pms_sku_images` VALUES ('55', '6', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/a73ef55a-79b4-41d9-8eb6-760c8b5a33dc_23d9fbb256ea5d4a.jpg', null, '0');
INSERT INTO `pms_sku_images` VALUES ('56', '6', '', null, '0');
INSERT INTO `pms_sku_images` VALUES ('57', '6', '', null, '0');
INSERT INTO `pms_sku_images` VALUES ('58', '6', '', null, '0');
INSERT INTO `pms_sku_images` VALUES ('59', '6', '', null, '0');
INSERT INTO `pms_sku_images` VALUES ('60', '6', '', null, '0');
INSERT INTO `pms_sku_images` VALUES ('61', '7', '', null, '0');
INSERT INTO `pms_sku_images` VALUES ('62', '7', '', null, '0');
INSERT INTO `pms_sku_images` VALUES ('63', '7', '', null, '0');
INSERT INTO `pms_sku_images` VALUES ('64', '7', '', null, '0');
INSERT INTO `pms_sku_images` VALUES ('65', '7', '', null, '0');
INSERT INTO `pms_sku_images` VALUES ('66', '7', '', null, '0');
INSERT INTO `pms_sku_images` VALUES ('67', '7', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/38492c9f-b0e0-4cba-87a9-77cb6189ea73_73ab4d2e818d2211.jpg', null, '0');
INSERT INTO `pms_sku_images` VALUES ('68', '7', '', null, '0');
INSERT INTO `pms_sku_images` VALUES ('69', '7', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/d12516dd-43cf-4ace-8dc9-14618d2d75e4_919c850652e98031.jpg', null, '0');
INSERT INTO `pms_sku_images` VALUES ('70', '7', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/60e65a44-f943-4ed5-87c8-8cf90f403018_d511faab82abb34b.jpg', null, '1');
INSERT INTO `pms_sku_images` VALUES ('71', '8', '', null, '0');
INSERT INTO `pms_sku_images` VALUES ('72', '8', '', null, '0');
INSERT INTO `pms_sku_images` VALUES ('73', '8', '', null, '0');
INSERT INTO `pms_sku_images` VALUES ('74', '8', '', null, '0');
INSERT INTO `pms_sku_images` VALUES ('75', '8', '', null, '0');
INSERT INTO `pms_sku_images` VALUES ('76', '8', '', null, '0');
INSERT INTO `pms_sku_images` VALUES ('77', '8', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/38492c9f-b0e0-4cba-87a9-77cb6189ea73_73ab4d2e818d2211.jpg', null, '0');
INSERT INTO `pms_sku_images` VALUES ('78', '8', '', null, '0');
INSERT INTO `pms_sku_images` VALUES ('79', '8', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/d12516dd-43cf-4ace-8dc9-14618d2d75e4_919c850652e98031.jpg', null, '0');
INSERT INTO `pms_sku_images` VALUES ('80', '8', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/60e65a44-f943-4ed5-87c8-8cf90f403018_d511faab82abb34b.jpg', null, '1');
INSERT INTO `pms_sku_images` VALUES ('81', '9', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/462ef293-2b8b-4c53-85f2-1726e14dc976_23cd65077f12f7f5.jpg', null, '0');
INSERT INTO `pms_sku_images` VALUES ('82', '9', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/bc4825d6-2a6c-43f8-8d75-5f35b77b9514_a2c208410ae84d1f.jpg', null, '1');
INSERT INTO `pms_sku_images` VALUES ('83', '9', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/f968b6ac-2fca-4440-842f-8db8b76478f0_b8494bf281991f94.jpg', null, '0');
INSERT INTO `pms_sku_images` VALUES ('84', '10', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/462ef293-2b8b-4c53-85f2-1726e14dc976_23cd65077f12f7f5.jpg', null, '0');
INSERT INTO `pms_sku_images` VALUES ('85', '10', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/bc4825d6-2a6c-43f8-8d75-5f35b77b9514_a2c208410ae84d1f.jpg', null, '1');
INSERT INTO `pms_sku_images` VALUES ('86', '10', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/f968b6ac-2fca-4440-842f-8db8b76478f0_b8494bf281991f94.jpg', null, '0');
INSERT INTO `pms_sku_images` VALUES ('87', '11', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/462ef293-2b8b-4c53-85f2-1726e14dc976_23cd65077f12f7f5.jpg', null, '0');
INSERT INTO `pms_sku_images` VALUES ('88', '11', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/bc4825d6-2a6c-43f8-8d75-5f35b77b9514_a2c208410ae84d1f.jpg', null, '1');
INSERT INTO `pms_sku_images` VALUES ('89', '11', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/f968b6ac-2fca-4440-842f-8db8b76478f0_b8494bf281991f94.jpg', null, '0');
INSERT INTO `pms_sku_images` VALUES ('90', '12', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/462ef293-2b8b-4c53-85f2-1726e14dc976_23cd65077f12f7f5.jpg', null, '1');
INSERT INTO `pms_sku_images` VALUES ('91', '13', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/462ef293-2b8b-4c53-85f2-1726e14dc976_23cd65077f12f7f5.jpg', null, '1');
INSERT INTO `pms_sku_images` VALUES ('92', '14', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/462ef293-2b8b-4c53-85f2-1726e14dc976_23cd65077f12f7f5.jpg', null, '1');
INSERT INTO `pms_sku_images` VALUES ('93', '15', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/299481e9-4704-4824-8b18-60c7d268353c_7ae0120ec27dc3a7.jpg', null, '1');
INSERT INTO `pms_sku_images` VALUES ('94', '16', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/299481e9-4704-4824-8b18-60c7d268353c_7ae0120ec27dc3a7.jpg', null, '1');
INSERT INTO `pms_sku_images` VALUES ('95', '17', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/299481e9-4704-4824-8b18-60c7d268353c_7ae0120ec27dc3a7.jpg', null, '1');
INSERT INTO `pms_sku_images` VALUES ('96', '18', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/299481e9-4704-4824-8b18-60c7d268353c_7ae0120ec27dc3a7.jpg', null, '1');
INSERT INTO `pms_sku_images` VALUES ('97', '19', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/299481e9-4704-4824-8b18-60c7d268353c_7ae0120ec27dc3a7.jpg', null, '1');
INSERT INTO `pms_sku_images` VALUES ('98', '20', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/299481e9-4704-4824-8b18-60c7d268353c_7ae0120ec27dc3a7.jpg', null, '1');
INSERT INTO `pms_sku_images` VALUES ('99', '21', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/1756fa6d-1934-4d5c-8faf-84b3d882fe53_5b5e74d0978360a1.jpg', null, '0');
INSERT INTO `pms_sku_images` VALUES ('100', '21', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/e21777b3-18ac-4580-819e-497c3aa25e4f_6a1b2703a9ed8737.jpg', null, '1');
INSERT INTO `pms_sku_images` VALUES ('101', '21', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/2419c5cf-a641-4ec1-8f94-64981dc207f6_63e862164165f483.jpg', null, '0');
INSERT INTO `pms_sku_images` VALUES ('102', '22', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/1756fa6d-1934-4d5c-8faf-84b3d882fe53_5b5e74d0978360a1.jpg', null, '0');
INSERT INTO `pms_sku_images` VALUES ('103', '22', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/e21777b3-18ac-4580-819e-497c3aa25e4f_6a1b2703a9ed8737.jpg', null, '1');
INSERT INTO `pms_sku_images` VALUES ('104', '22', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/2419c5cf-a641-4ec1-8f94-64981dc207f6_63e862164165f483.jpg', null, '0');
INSERT INTO `pms_sku_images` VALUES ('105', '23', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/1756fa6d-1934-4d5c-8faf-84b3d882fe53_5b5e74d0978360a1.jpg', null, '0');
INSERT INTO `pms_sku_images` VALUES ('106', '23', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/e21777b3-18ac-4580-819e-497c3aa25e4f_6a1b2703a9ed8737.jpg', null, '1');
INSERT INTO `pms_sku_images` VALUES ('107', '23', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/2419c5cf-a641-4ec1-8f94-64981dc207f6_63e862164165f483.jpg', null, '0');
INSERT INTO `pms_sku_images` VALUES ('108', '24', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/299481e9-4704-4824-8b18-60c7d268353c_7ae0120ec27dc3a7.jpg', null, '1');
INSERT INTO `pms_sku_images` VALUES ('109', '25', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/299481e9-4704-4824-8b18-60c7d268353c_7ae0120ec27dc3a7.jpg', null, '1');
INSERT INTO `pms_sku_images` VALUES ('110', '26', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/299481e9-4704-4824-8b18-60c7d268353c_7ae0120ec27dc3a7.jpg', null, '1');

-- ----------------------------
-- Table structure for pms_sku_info
-- ----------------------------
DROP TABLE IF EXISTS `pms_sku_info`;
CREATE TABLE `pms_sku_info` (
  `sku_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'skuId',
  `spu_id` bigint(20) DEFAULT NULL COMMENT 'spuId',
  `sku_name` varchar(255) DEFAULT NULL COMMENT 'sku名称',
  `sku_desc` varchar(2000) DEFAULT NULL COMMENT 'sku介绍描述',
  `catalog_id` bigint(20) DEFAULT NULL COMMENT '所属分类id',
  `brand_id` bigint(20) DEFAULT NULL COMMENT '品牌id',
  `sku_default_img` varchar(255) DEFAULT NULL COMMENT '默认图片',
  `sku_title` varchar(255) DEFAULT NULL COMMENT '标题',
  `sku_subtitle` varchar(2000) DEFAULT NULL COMMENT '副标题',
  `price` decimal(18,4) DEFAULT NULL COMMENT '价格',
  `sale_count` bigint(20) DEFAULT NULL COMMENT '销量',
  PRIMARY KEY (`sku_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COMMENT='sku信息';

-- ----------------------------
-- Records of pms_sku_info
-- ----------------------------
INSERT INTO `pms_sku_info` VALUES ('1', '11', '华为 HUAWEI Mate 30 Pro 星河银 8GB+256GB', null, '225', '9', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/60e65a44-f943-4ed5-87c8-8cf90f403018_d511faab82abb34b.jpg', '华为 HUAWEI Mate 30 Pro 星河银 8GB+256GB麒麟990旗舰芯片OLED环幕屏双4000万徕卡电影四摄4G全网通手机', '【现货抢购！享白条12期免息！】麒麟990，OLED环幕屏双4000万徕卡电影四摄；Mate30系列享12期免息》', '6299.0000', '0');
INSERT INTO `pms_sku_info` VALUES ('2', '11', '华为 HUAWEI Mate 30 Pro 星河银 8GB+128GB', null, '225', '9', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/ef2691e5-de1a-4ca3-827d-a60f39fbda93_0d40c24b264aa511.jpg', '华为 HUAWEI Mate 30 Pro 星河银 8GB+128GB麒麟990旗舰芯片OLED环幕屏双4000万徕卡电影四摄4G全网通手机', '【现货抢购！享白条12期免息！】麒麟990，OLED环幕屏双4000万徕卡电影四摄；Mate30系列享12期免息》', '5799.0000', '0');
INSERT INTO `pms_sku_info` VALUES ('3', '11', '华为 HUAWEI Mate 30 Pro 亮黑色 8GB+256GB', null, '225', '9', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/ef2691e5-de1a-4ca3-827d-a60f39fbda93_0d40c24b264aa511.jpg', '华为 HUAWEI Mate 30 Pro 亮黑色 8GB+256GB麒麟990旗舰芯片OLED环幕屏双4000万徕卡电影四摄4G全网通手机', '【现货抢购！享白条12期免息！】麒麟990，OLED环幕屏双4000万徕卡电影四摄；Mate30系列享12期免息》', '6299.0000', '0');
INSERT INTO `pms_sku_info` VALUES ('4', '11', '华为 HUAWEI Mate 30 Pro 亮黑色 8GB+128GB', null, '225', '9', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/ef2691e5-de1a-4ca3-827d-a60f39fbda93_0d40c24b264aa511.jpg', '华为 HUAWEI Mate 30 Pro 亮黑色 8GB+128GB麒麟990旗舰芯片OLED环幕屏双4000万徕卡电影四摄4G全网通手机', '【现货抢购！享白条12期免息！】麒麟990，OLED环幕屏双4000万徕卡电影四摄；Mate30系列享12期免息》', '5799.0000', '0');
INSERT INTO `pms_sku_info` VALUES ('5', '11', '华为 HUAWEI Mate 30 Pro 翡冷翠 8GB+256GB', null, '225', '9', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/ef2691e5-de1a-4ca3-827d-a60f39fbda93_0d40c24b264aa511.jpg', '华为 HUAWEI Mate 30 Pro 翡冷翠 8GB+256GB麒麟990旗舰芯片OLED环幕屏双4000万徕卡电影四摄4G全网通手机', '【现货抢购！享白条12期免息！】麒麟990，OLED环幕屏双4000万徕卡电影四摄；Mate30系列享12期免息》', '6299.0000', '0');
INSERT INTO `pms_sku_info` VALUES ('6', '11', '华为 HUAWEI Mate 30 Pro 翡冷翠 8GB+128GB', null, '225', '9', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/ef2691e5-de1a-4ca3-827d-a60f39fbda93_0d40c24b264aa511.jpg', '华为 HUAWEI Mate 30 Pro 翡冷翠 8GB+128GB麒麟990旗舰芯片OLED环幕屏双4000万徕卡电影四摄4G全网通手机', '【现货抢购！享白条12期免息！】麒麟990，OLED环幕屏双4000万徕卡电影四摄；Mate30系列享12期免息》', '5799.0000', '0');
INSERT INTO `pms_sku_info` VALUES ('7', '11', '华为 HUAWEI Mate 30 Pro 罗兰紫 8GB+256GB', null, '225', '9', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/60e65a44-f943-4ed5-87c8-8cf90f403018_d511faab82abb34b.jpg', '华为 HUAWEI Mate 30 Pro 罗兰紫 8GB+256GB麒麟990旗舰芯片OLED环幕屏双4000万徕卡电影四摄4G全网通手机', '【现货抢购！享白条12期免息！】麒麟990，OLED环幕屏双4000万徕卡电影四摄；Mate30系列享12期免息》', '6299.0000', '0');
INSERT INTO `pms_sku_info` VALUES ('8', '11', '华为 HUAWEI Mate 30 Pro 罗兰紫 8GB+128GB', null, '225', '9', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/60e65a44-f943-4ed5-87c8-8cf90f403018_d511faab82abb34b.jpg', '华为 HUAWEI Mate 30 Pro 罗兰紫 8GB+128GB麒麟990旗舰芯片OLED环幕屏双4000万徕卡电影四摄4G全网通手机', '【现货抢购！享白条12期免息！】麒麟990，OLED环幕屏双4000万徕卡电影四摄；Mate30系列享12期免息》', '5799.0000', '0');
INSERT INTO `pms_sku_info` VALUES ('9', '13', ' Apple iPhone 11 (A2223)  黑色 128GB ', null, '225', '12', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/bc4825d6-2a6c-43f8-8d75-5f35b77b9514_a2c208410ae84d1f.jpg', ' Apple iPhone 11 (A2223)  黑色 128GB 移动联通电信4G手机 双卡双待 最后几件优惠', 'iPhoneXS系列性能强劲，样样出色，现特惠来袭，低至5399元！详情请点击！', '5999.0000', '0');
INSERT INTO `pms_sku_info` VALUES ('10', '13', ' Apple iPhone 11 (A2223)  黑色 256GB', null, '225', '12', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/bc4825d6-2a6c-43f8-8d75-5f35b77b9514_a2c208410ae84d1f.jpg', ' Apple iPhone 11 (A2223)  黑色 256GB 移动联通电信4G手机 双卡双待', 'iPhoneXS系列性能强劲，样样出色，现特惠来袭，低至5399元！详情请点击！', '6799.0000', '0');
INSERT INTO `pms_sku_info` VALUES ('11', '13', ' Apple iPhone 11 (A2223)  黑色 64GB', null, '225', '12', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/bc4825d6-2a6c-43f8-8d75-5f35b77b9514_a2c208410ae84d1f.jpg', ' Apple iPhone 11 (A2223)  黑色 64GB  移动联通电信4G手机 双卡双待', 'iPhoneXS系列性能强劲，样样出色，现特惠来袭，低至5399元！详情请点击！', '5499.0000', '0');
INSERT INTO `pms_sku_info` VALUES ('12', '13', ' Apple iPhone 11 (A2223)  白色 128GB ', null, '225', '12', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/462ef293-2b8b-4c53-85f2-1726e14dc976_23cd65077f12f7f5.jpg', ' Apple iPhone 11 (A2223)  白色 128GB  移动联通电信4G手机 双卡双待', 'iPhoneXS系列性能强劲，样样出色，现特惠来袭，低至5399元！详情请点击！', '5999.0000', '0');
INSERT INTO `pms_sku_info` VALUES ('13', '13', ' Apple iPhone 11 (A2223)  白色 256GB', null, '225', '12', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/462ef293-2b8b-4c53-85f2-1726e14dc976_23cd65077f12f7f5.jpg', ' Apple iPhone 11 (A2223)  白色 256GB  移动联通电信4G手机 双卡双待', 'iPhoneXS系列性能强劲，样样出色，现特惠来袭，低至5399元！详情请点击！', '6799.0000', '0');
INSERT INTO `pms_sku_info` VALUES ('14', '13', ' Apple iPhone 11 (A2223)  白色 64GB', null, '225', '12', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/462ef293-2b8b-4c53-85f2-1726e14dc976_23cd65077f12f7f5.jpg', ' Apple iPhone 11 (A2223)  白色 64GB  移动联通电信4G手机 双卡双待', 'iPhoneXS系列性能强劲，样样出色，现特惠来袭，低至5399元！详情请点击！', '5499.0000', '0');
INSERT INTO `pms_sku_info` VALUES ('15', '13', ' Apple iPhone 11 (A2223)  绿色 128GB ', null, '225', '12', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/299481e9-4704-4824-8b18-60c7d268353c_7ae0120ec27dc3a7.jpg', ' Apple iPhone 11 (A2223)  绿色 128GB  移动联通电信4G手机 双卡双待', 'iPhoneXS系列性能强劲，样样出色，现特惠来袭，低至5399元！详情请点击！', '5999.0000', '0');
INSERT INTO `pms_sku_info` VALUES ('16', '13', ' Apple iPhone 11 (A2223)  绿色 256GB', null, '225', '12', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/299481e9-4704-4824-8b18-60c7d268353c_7ae0120ec27dc3a7.jpg', ' Apple iPhone 11 (A2223)  绿色 256GB  移动联通电信4G手机 双卡双待', 'iPhoneXS系列性能强劲，样样出色，现特惠来袭，低至5399元！详情请点击！', '6799.0000', '0');
INSERT INTO `pms_sku_info` VALUES ('17', '13', ' Apple iPhone 11 (A2223)  绿色 64GB', null, '225', '12', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/299481e9-4704-4824-8b18-60c7d268353c_7ae0120ec27dc3a7.jpg', ' Apple iPhone 11 (A2223)  绿色 64GB  移动联通电信4G手机 双卡双待', 'iPhoneXS系列性能强劲，样样出色，现特惠来袭，低至5399元！详情请点击！', '5499.0000', '0');
INSERT INTO `pms_sku_info` VALUES ('18', '13', ' Apple iPhone 11 (A2223)  黄色 128GB ', null, '225', '12', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/299481e9-4704-4824-8b18-60c7d268353c_7ae0120ec27dc3a7.jpg', ' Apple iPhone 11 (A2223)  黄色 128GB  移动联通电信4G手机 双卡双待', 'iPhoneXS系列性能强劲，样样出色，现特惠来袭，低至5399元！详情请点击！', '5999.0000', '0');
INSERT INTO `pms_sku_info` VALUES ('19', '13', ' Apple iPhone 11 (A2223)  黄色 256GB', null, '225', '12', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/299481e9-4704-4824-8b18-60c7d268353c_7ae0120ec27dc3a7.jpg', ' Apple iPhone 11 (A2223)  黄色 256GB  移动联通电信4G手机 双卡双待', 'iPhoneXS系列性能强劲，样样出色，现特惠来袭，低至5399元！详情请点击！', '6799.0000', '0');
INSERT INTO `pms_sku_info` VALUES ('20', '13', ' Apple iPhone 11 (A2223)  黄色 64GB', null, '225', '12', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/299481e9-4704-4824-8b18-60c7d268353c_7ae0120ec27dc3a7.jpg', ' Apple iPhone 11 (A2223)  黄色 64GB  移动联通电信4G手机 双卡双待', 'iPhoneXS系列性能强劲，样样出色，现特惠来袭，低至5399元！详情请点击！', '5499.0000', '0');
INSERT INTO `pms_sku_info` VALUES ('21', '13', ' Apple iPhone 11 (A2223)  红色 128GB ', null, '225', '12', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/e21777b3-18ac-4580-819e-497c3aa25e4f_6a1b2703a9ed8737.jpg', ' Apple iPhone 11 (A2223)  红色 128GB  移动联通电信4G手机 双卡双待', 'iPhoneXS系列性能强劲，样样出色，现特惠来袭，低至5399元！详情请点击！', '5999.0000', '0');
INSERT INTO `pms_sku_info` VALUES ('22', '13', ' Apple iPhone 11 (A2223)  红色 256GB', null, '225', '12', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/e21777b3-18ac-4580-819e-497c3aa25e4f_6a1b2703a9ed8737.jpg', ' Apple iPhone 11 (A2223)  红色 256GB  移动联通电信4G手机 双卡双待', 'iPhoneXS系列性能强劲，样样出色，现特惠来袭，低至5399元！详情请点击！', '6799.0000', '0');
INSERT INTO `pms_sku_info` VALUES ('23', '13', ' Apple iPhone 11 (A2223)  红色 64GB', null, '225', '12', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/e21777b3-18ac-4580-819e-497c3aa25e4f_6a1b2703a9ed8737.jpg', ' Apple iPhone 11 (A2223)  红色 64GB  移动联通电信4G手机 双卡双待', 'iPhoneXS系列性能强劲，样样出色，现特惠来袭，低至5399元！详情请点击！', '5499.0000', '0');
INSERT INTO `pms_sku_info` VALUES ('24', '13', ' Apple iPhone 11 (A2223)  紫色 128GB ', null, '225', '12', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/299481e9-4704-4824-8b18-60c7d268353c_7ae0120ec27dc3a7.jpg', ' Apple iPhone 11 (A2223)  紫色 128GB  移动联通电信4G手机 双卡双待', 'iPhoneXS系列性能强劲，样样出色，现特惠来袭，低至5399元！详情请点击！', '5999.0000', '0');
INSERT INTO `pms_sku_info` VALUES ('25', '13', ' Apple iPhone 11 (A2223)  紫色 256GB', null, '225', '12', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/299481e9-4704-4824-8b18-60c7d268353c_7ae0120ec27dc3a7.jpg', ' Apple iPhone 11 (A2223)  紫色 256GB  移动联通电信4G手机 双卡双待', 'iPhoneXS系列性能强劲，样样出色，现特惠来袭，低至5399元！详情请点击！', '6799.0000', '0');
INSERT INTO `pms_sku_info` VALUES ('26', '13', ' Apple iPhone 11 (A2223)  紫色 64GB', null, '225', '12', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/299481e9-4704-4824-8b18-60c7d268353c_7ae0120ec27dc3a7.jpg', ' Apple iPhone 11 (A2223)  紫色 64GB  移动联通电信4G手机 双卡双待', 'iPhoneXS系列性能强劲，样样出色，现特惠来袭，低至5399元！详情请点击！', '5499.0000', '0');

-- ----------------------------
-- Table structure for pms_sku_sale_attr_value
-- ----------------------------
DROP TABLE IF EXISTS `pms_sku_sale_attr_value`;
CREATE TABLE `pms_sku_sale_attr_value` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `sku_id` bigint(20) DEFAULT NULL COMMENT 'sku_id',
  `attr_id` bigint(20) DEFAULT NULL COMMENT 'attr_id',
  `attr_name` varchar(200) DEFAULT NULL COMMENT '销售属性名',
  `attr_value` varchar(200) DEFAULT NULL COMMENT '销售属性值',
  `attr_sort` int(11) DEFAULT NULL COMMENT '顺序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COMMENT='sku销售属性&值';

-- ----------------------------
-- Records of pms_sku_sale_attr_value
-- ----------------------------
INSERT INTO `pms_sku_sale_attr_value` VALUES ('1', '1', '9', '颜色', '星河银', null);
INSERT INTO `pms_sku_sale_attr_value` VALUES ('2', '1', '12', '版本', '8GB+256GB', null);
INSERT INTO `pms_sku_sale_attr_value` VALUES ('3', '2', '9', '颜色', '星河银', null);
INSERT INTO `pms_sku_sale_attr_value` VALUES ('4', '2', '12', '版本', '8GB+128GB', null);
INSERT INTO `pms_sku_sale_attr_value` VALUES ('5', '3', '9', '颜色', '亮黑色', null);
INSERT INTO `pms_sku_sale_attr_value` VALUES ('6', '3', '12', '版本', '8GB+256GB', null);
INSERT INTO `pms_sku_sale_attr_value` VALUES ('7', '4', '9', '颜色', '亮黑色', null);
INSERT INTO `pms_sku_sale_attr_value` VALUES ('8', '4', '12', '版本', '8GB+128GB', null);
INSERT INTO `pms_sku_sale_attr_value` VALUES ('9', '5', '9', '颜色', '翡冷翠', null);
INSERT INTO `pms_sku_sale_attr_value` VALUES ('10', '5', '12', '版本', '8GB+256GB', null);
INSERT INTO `pms_sku_sale_attr_value` VALUES ('11', '6', '9', '颜色', '翡冷翠', null);
INSERT INTO `pms_sku_sale_attr_value` VALUES ('12', '6', '12', '版本', '8GB+128GB', null);
INSERT INTO `pms_sku_sale_attr_value` VALUES ('13', '7', '9', '颜色', '罗兰紫', null);
INSERT INTO `pms_sku_sale_attr_value` VALUES ('14', '7', '12', '版本', '8GB+256GB', null);
INSERT INTO `pms_sku_sale_attr_value` VALUES ('15', '8', '9', '颜色', '罗兰紫', null);
INSERT INTO `pms_sku_sale_attr_value` VALUES ('16', '8', '12', '版本', '8GB+128GB', null);
INSERT INTO `pms_sku_sale_attr_value` VALUES ('17', '9', '9', '颜色', '黑色', null);
INSERT INTO `pms_sku_sale_attr_value` VALUES ('18', '9', '12', '版本', '128GB ', null);
INSERT INTO `pms_sku_sale_attr_value` VALUES ('19', '10', '9', '颜色', '黑色', null);
INSERT INTO `pms_sku_sale_attr_value` VALUES ('20', '10', '12', '版本', '256GB', null);
INSERT INTO `pms_sku_sale_attr_value` VALUES ('21', '11', '9', '颜色', '黑色', null);
INSERT INTO `pms_sku_sale_attr_value` VALUES ('22', '11', '12', '版本', '64GB', null);
INSERT INTO `pms_sku_sale_attr_value` VALUES ('23', '12', '9', '颜色', '白色', null);
INSERT INTO `pms_sku_sale_attr_value` VALUES ('24', '12', '12', '版本', '128GB ', null);
INSERT INTO `pms_sku_sale_attr_value` VALUES ('25', '13', '9', '颜色', '白色', null);
INSERT INTO `pms_sku_sale_attr_value` VALUES ('26', '13', '12', '版本', '256GB', null);
INSERT INTO `pms_sku_sale_attr_value` VALUES ('27', '14', '9', '颜色', '白色', null);
INSERT INTO `pms_sku_sale_attr_value` VALUES ('28', '14', '12', '版本', '64GB', null);
INSERT INTO `pms_sku_sale_attr_value` VALUES ('29', '15', '9', '颜色', '绿色', null);
INSERT INTO `pms_sku_sale_attr_value` VALUES ('30', '15', '12', '版本', '128GB ', null);
INSERT INTO `pms_sku_sale_attr_value` VALUES ('31', '16', '9', '颜色', '绿色', null);
INSERT INTO `pms_sku_sale_attr_value` VALUES ('32', '16', '12', '版本', '256GB', null);
INSERT INTO `pms_sku_sale_attr_value` VALUES ('33', '17', '9', '颜色', '绿色', null);
INSERT INTO `pms_sku_sale_attr_value` VALUES ('34', '17', '12', '版本', '64GB', null);
INSERT INTO `pms_sku_sale_attr_value` VALUES ('35', '18', '9', '颜色', '黄色', null);
INSERT INTO `pms_sku_sale_attr_value` VALUES ('36', '18', '12', '版本', '128GB ', null);
INSERT INTO `pms_sku_sale_attr_value` VALUES ('37', '19', '9', '颜色', '黄色', null);
INSERT INTO `pms_sku_sale_attr_value` VALUES ('38', '19', '12', '版本', '256GB', null);
INSERT INTO `pms_sku_sale_attr_value` VALUES ('39', '20', '9', '颜色', '黄色', null);
INSERT INTO `pms_sku_sale_attr_value` VALUES ('40', '20', '12', '版本', '64GB', null);
INSERT INTO `pms_sku_sale_attr_value` VALUES ('41', '21', '9', '颜色', '红色', null);
INSERT INTO `pms_sku_sale_attr_value` VALUES ('42', '21', '12', '版本', '128GB ', null);
INSERT INTO `pms_sku_sale_attr_value` VALUES ('43', '22', '9', '颜色', '红色', null);
INSERT INTO `pms_sku_sale_attr_value` VALUES ('44', '22', '12', '版本', '256GB', null);
INSERT INTO `pms_sku_sale_attr_value` VALUES ('45', '23', '9', '颜色', '红色', null);
INSERT INTO `pms_sku_sale_attr_value` VALUES ('46', '23', '12', '版本', '64GB', null);
INSERT INTO `pms_sku_sale_attr_value` VALUES ('47', '24', '9', '颜色', '紫色', null);
INSERT INTO `pms_sku_sale_attr_value` VALUES ('48', '24', '12', '版本', '128GB ', null);
INSERT INTO `pms_sku_sale_attr_value` VALUES ('49', '25', '9', '颜色', '紫色', null);
INSERT INTO `pms_sku_sale_attr_value` VALUES ('50', '25', '12', '版本', '256GB', null);
INSERT INTO `pms_sku_sale_attr_value` VALUES ('51', '26', '9', '颜色', '紫色', null);
INSERT INTO `pms_sku_sale_attr_value` VALUES ('52', '26', '12', '版本', '64GB', null);

-- ----------------------------
-- Table structure for pms_spu_comment
-- ----------------------------
DROP TABLE IF EXISTS `pms_spu_comment`;
CREATE TABLE `pms_spu_comment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `sku_id` bigint(20) DEFAULT NULL COMMENT 'sku_id',
  `spu_id` bigint(20) DEFAULT NULL COMMENT 'spu_id',
  `spu_name` varchar(255) DEFAULT NULL COMMENT '商品名字',
  `member_nick_name` varchar(255) DEFAULT NULL COMMENT '会员昵称',
  `star` tinyint(1) DEFAULT NULL COMMENT '星级',
  `member_ip` varchar(64) DEFAULT NULL COMMENT '会员ip',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `show_status` tinyint(1) DEFAULT NULL COMMENT '显示状态[0-不显示，1-显示]',
  `spu_attributes` varchar(255) DEFAULT NULL COMMENT '购买时属性组合',
  `likes_count` int(11) DEFAULT NULL COMMENT '点赞数',
  `reply_count` int(11) DEFAULT NULL COMMENT '回复数',
  `resources` varchar(1000) DEFAULT NULL COMMENT '评论图片/视频[json数据；[{type:文件类型,url:资源路径}]]',
  `content` text COMMENT '内容',
  `member_icon` varchar(255) DEFAULT NULL COMMENT '用户头像',
  `comment_type` tinyint(4) DEFAULT NULL COMMENT '评论类型[0 - 对商品的直接评论，1 - 对评论的回复]',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='商品评价';

-- ----------------------------
-- Records of pms_spu_comment
-- ----------------------------

-- ----------------------------
-- Table structure for pms_spu_images
-- ----------------------------
DROP TABLE IF EXISTS `pms_spu_images`;
CREATE TABLE `pms_spu_images` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `spu_id` bigint(20) DEFAULT NULL COMMENT 'spu_id',
  `img_name` varchar(200) DEFAULT NULL COMMENT '图片名',
  `img_url` varchar(255) DEFAULT NULL COMMENT '图片地址',
  `img_sort` int(11) DEFAULT NULL COMMENT '顺序',
  `default_img` tinyint(4) DEFAULT NULL COMMENT '是否默认图',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8mb4 COMMENT='spu图片';

-- ----------------------------
-- Records of pms_spu_images
-- ----------------------------
INSERT INTO `pms_spu_images` VALUES ('71', '11', null, 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/ef2691e5-de1a-4ca3-827d-a60f39fbda93_0d40c24b264aa511.jpg', null, null);
INSERT INTO `pms_spu_images` VALUES ('72', '11', null, 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/20f83b0c-86ba-4a64-808a-f2ace190ea2c_1f15cdbcf9e1273c.jpg', null, null);
INSERT INTO `pms_spu_images` VALUES ('73', '11', null, 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/89e324b9-d0cf-4f4f-8e81-94bb219910b3_2b1837c6c50add30.jpg', null, null);
INSERT INTO `pms_spu_images` VALUES ('74', '11', null, 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/9a6ba5c0-0a31-4364-8759-012bdfbf5ad3_3c24f9cd69534030.jpg', null, null);
INSERT INTO `pms_spu_images` VALUES ('75', '11', null, 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/a73ef55a-79b4-41d9-8eb6-760c8b5a33dc_23d9fbb256ea5d4a.jpg', null, null);
INSERT INTO `pms_spu_images` VALUES ('76', '11', null, 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/099f297e-ddea-4fb5-87c7-78cd88e500c0_28f296629cca865e.jpg', null, null);
INSERT INTO `pms_spu_images` VALUES ('77', '11', null, 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/38492c9f-b0e0-4cba-87a9-77cb6189ea73_73ab4d2e818d2211.jpg', null, null);
INSERT INTO `pms_spu_images` VALUES ('78', '11', null, 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/7aa1019e-4e01-49dd-8ac4-7d2794d0b1a8_335b2c690e43a8f8.jpg', null, null);
INSERT INTO `pms_spu_images` VALUES ('79', '11', null, 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/d12516dd-43cf-4ace-8dc9-14618d2d75e4_919c850652e98031.jpg', null, null);
INSERT INTO `pms_spu_images` VALUES ('80', '11', null, 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/60e65a44-f943-4ed5-87c8-8cf90f403018_d511faab82abb34b.jpg', null, null);
INSERT INTO `pms_spu_images` VALUES ('88', '13', null, 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/1756fa6d-1934-4d5c-8faf-84b3d882fe53_5b5e74d0978360a1.jpg', null, null);
INSERT INTO `pms_spu_images` VALUES ('89', '13', null, 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/299481e9-4704-4824-8b18-60c7d268353c_7ae0120ec27dc3a7.jpg', null, null);
INSERT INTO `pms_spu_images` VALUES ('90', '13', null, 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/462ef293-2b8b-4c53-85f2-1726e14dc976_23cd65077f12f7f5.jpg', null, null);
INSERT INTO `pms_spu_images` VALUES ('91', '13', null, 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/bc4825d6-2a6c-43f8-8d75-5f35b77b9514_a2c208410ae84d1f.jpg', null, null);
INSERT INTO `pms_spu_images` VALUES ('92', '13', null, 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/f968b6ac-2fca-4440-842f-8db8b76478f0_b8494bf281991f94.jpg', null, null);
INSERT INTO `pms_spu_images` VALUES ('93', '13', null, 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/e21777b3-18ac-4580-819e-497c3aa25e4f_6a1b2703a9ed8737.jpg', null, null);
INSERT INTO `pms_spu_images` VALUES ('94', '13', null, 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/2419c5cf-a641-4ec1-8f94-64981dc207f6_63e862164165f483.jpg', null, null);

-- ----------------------------
-- Table structure for pms_spu_info
-- ----------------------------
DROP TABLE IF EXISTS `pms_spu_info`;
CREATE TABLE `pms_spu_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '商品id',
  `spu_name` varchar(200) DEFAULT NULL COMMENT '商品名称',
  `spu_description` varchar(1000) DEFAULT NULL COMMENT '商品描述',
  `catalog_id` bigint(20) DEFAULT NULL COMMENT '所属分类id',
  `brand_id` bigint(20) DEFAULT NULL COMMENT '品牌id',
  `weight` decimal(18,4) DEFAULT NULL,
  `publish_status` tinyint(4) DEFAULT NULL COMMENT '上架状态[0 - 下架，1 - 上架]',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COMMENT='spu信息';

-- ----------------------------
-- Records of pms_spu_info
-- ----------------------------
INSERT INTO `pms_spu_info` VALUES ('11', '华为 HUAWEI Mate 30 Pro', '华为 HUAWEI Mate 30 Pro', '225', '9', '0.1980', '1', '2019-11-26 10:10:57', '2019-12-15 23:04:16');
INSERT INTO `pms_spu_info` VALUES ('13', ' Apple iPhone 11 (A2223) ', ' Apple iPhone 11 (A2223) ', '225', '12', '0.1940', '1', '2019-11-27 05:37:30', '2019-12-15 23:25:19');

-- ----------------------------
-- Table structure for pms_spu_info_desc
-- ----------------------------
DROP TABLE IF EXISTS `pms_spu_info_desc`;
CREATE TABLE `pms_spu_info_desc` (
  `spu_id` bigint(20) NOT NULL COMMENT '商品id',
  `decript` longtext COMMENT '商品介绍',
  PRIMARY KEY (`spu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='spu信息介绍';

-- ----------------------------
-- Records of pms_spu_info_desc
-- ----------------------------
INSERT INTO `pms_spu_info_desc` VALUES ('11', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/702b76e6-ce3e-4268-8216-a12db5607347_73366cc235d68202.jpg,https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/38956d81-5dff-4abd-8ce8-144908e869d8_528211b97272d88a.jpg');
INSERT INTO `pms_spu_info_desc` VALUES ('13', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/ffc5a377-b037-4f26-84a0-df5b1c7cf42d_f205d9c99a2b4b01.jpg');

-- ----------------------------
-- Table structure for undo_log
-- ----------------------------
DROP TABLE IF EXISTS `undo_log`;
CREATE TABLE `undo_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `branch_id` bigint(20) NOT NULL,
  `xid` varchar(100) NOT NULL,
  `context` varchar(128) NOT NULL,
  `rollback_info` longblob NOT NULL,
  `log_status` int(11) NOT NULL,
  `log_created` datetime NOT NULL,
  `log_modified` datetime NOT NULL,
  `ext` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ux_undo_log` (`xid`,`branch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of undo_log
-- ----------------------------
