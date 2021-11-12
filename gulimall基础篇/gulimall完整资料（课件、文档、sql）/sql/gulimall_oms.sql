/*
 Navicat Premium Data Transfer

 Source Server         : vm-gulimall
 Source Server Type    : MySQL
 Source Server Version : 80022
 Source Host           : gulimall.com:3306
 Source Schema         : gulimall_oms

 Target Server Type    : MySQL
 Target Server Version : 80022
 File Encoding         : 65001

 Date: 31/01/2021 20:40:55
*/
CREATE DATABASE /*!32312 IF NOT EXISTS*/`gulimall_oms` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `gulimall_oms`;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for oms_order
-- ----------------------------
DROP TABLE IF EXISTS `oms_order`;
CREATE TABLE `oms_order`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `member_id` bigint(0) NULL DEFAULT NULL COMMENT 'member_id',
  `order_sn` char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '订单号',
  `coupon_id` bigint(0) NULL DEFAULT NULL COMMENT '使用的优惠券',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT 'create_time',
  `member_username` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户名',
  `total_amount` decimal(18, 4) NULL DEFAULT NULL COMMENT '订单总额',
  `pay_amount` decimal(18, 4) NULL DEFAULT NULL COMMENT '应付总额',
  `freight_amount` decimal(18, 4) NULL DEFAULT NULL COMMENT '运费金额',
  `promotion_amount` decimal(18, 4) NULL DEFAULT NULL COMMENT '促销优化金额（促销价、满减、阶梯价）',
  `integration_amount` decimal(18, 4) NULL DEFAULT NULL COMMENT '积分抵扣金额',
  `coupon_amount` decimal(18, 4) NULL DEFAULT NULL COMMENT '优惠券抵扣金额',
  `discount_amount` decimal(18, 4) NULL DEFAULT NULL COMMENT '后台调整订单使用的折扣金额',
  `pay_type` tinyint(0) NULL DEFAULT NULL COMMENT '支付方式【1->支付宝；2->微信；3->银联； 4->货到付款；】',
  `source_type` tinyint(0) NULL DEFAULT NULL COMMENT '订单来源[0->PC订单；1->app订单]',
  `status` tinyint(0) NULL DEFAULT NULL COMMENT '订单状态【0->待付款；1->待发货；2->已发货；3->已完成；4->已关闭；5->无效订单】',
  `delivery_company` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '物流公司(配送方式)',
  `delivery_sn` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '物流单号',
  `auto_confirm_day` int(0) NULL DEFAULT NULL COMMENT '自动确认时间（天）',
  `integration` int(0) NULL DEFAULT NULL COMMENT '可以获得的积分',
  `growth` int(0) NULL DEFAULT NULL COMMENT '可以获得的成长值',
  `bill_type` tinyint(0) NULL DEFAULT NULL COMMENT '发票类型[0->不开发票；1->电子发票；2->纸质发票]',
  `bill_header` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '发票抬头',
  `bill_content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '发票内容',
  `bill_receiver_phone` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '收票人电话',
  `bill_receiver_email` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '收票人邮箱',
  `receiver_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '收货人姓名',
  `receiver_phone` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '收货人电话',
  `receiver_post_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '收货人邮编',
  `receiver_province` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '省份/直辖市',
  `receiver_city` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '城市',
  `receiver_region` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '区',
  `receiver_detail_address` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '详细地址',
  `note` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '订单备注',
  `confirm_status` tinyint(0) NULL DEFAULT NULL COMMENT '确认收货状态[0->未确认；1->已确认]',
  `delete_status` tinyint(0) NULL DEFAULT NULL COMMENT '删除状态【0->未删除；1->已删除】',
  `use_integration` int(0) NULL DEFAULT NULL COMMENT '下单时使用的积分',
  `payment_time` datetime(0) NULL DEFAULT NULL COMMENT '支付时间',
  `delivery_time` datetime(0) NULL DEFAULT NULL COMMENT '发货时间',
  `receive_time` datetime(0) NULL DEFAULT NULL COMMENT '确认收货时间',
  `comment_time` datetime(0) NULL DEFAULT NULL COMMENT '评价时间',
  `modify_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 53 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '订单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oms_order
-- ----------------------------
INSERT INTO `oms_order` VALUES (33, 14, '202101281641128461354711111048179713', NULL, '2021-01-28 16:41:13', '余生余生愿你安好', 55490.0000, 55492.0000, 2.0000, 0.0000, 0.0000, 0.0000, NULL, 1, NULL, 4, NULL, NULL, 7, 500, 500, NULL, NULL, NULL, NULL, NULL, '王伟', '13572523592', NULL, '陕西省', '西安市', NULL, '西沣路266', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, '2021-01-28 16:41:13');
INSERT INTO `oms_order` VALUES (34, 14, '202101281649307561354713199429890049', NULL, '2021-01-28 16:49:31', '余生余生愿你安好', 55490.0000, 55492.0000, 2.0000, 0.0000, 0.0000, 0.0000, NULL, 1, NULL, 4, NULL, NULL, 7, 500, 500, NULL, NULL, NULL, NULL, NULL, '王伟', '13572523592', NULL, '陕西省', '西安市', NULL, '西沣路266', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, '2021-01-28 16:49:31');
INSERT INTO `oms_order` VALUES (35, 14, '202101282211337601354794245999661058', NULL, '2021-01-28 22:11:34', '余生余生愿你安好', 55490.0000, 55492.0000, 2.0000, 0.0000, 0.0000, 0.0000, NULL, 1, NULL, 4, NULL, NULL, 7, 500, 500, NULL, NULL, NULL, NULL, NULL, '王伟', '13572523592', NULL, '陕西省', '西安市', NULL, '西沣路266', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, '2021-01-28 22:11:34');
INSERT INTO `oms_order` VALUES (36, 14, '202101282222341641354797015913828353', NULL, '2021-01-28 22:22:34', '余生余生愿你安好', 55490.0000, 55492.0000, 2.0000, 0.0000, 0.0000, 0.0000, NULL, 1, NULL, 4, NULL, NULL, 7, 500, 500, NULL, NULL, NULL, NULL, NULL, '王伟', '13572523592', NULL, '陕西省', '西安市', NULL, '西沣路266', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, '2021-01-28 22:22:34');
INSERT INTO `oms_order` VALUES (37, 14, '202101282326002041354812979619299329', NULL, '2021-01-28 23:26:00', '余生余生愿你安好', 81985.0000, 81987.0000, 2.0000, 0.0000, 0.0000, 0.0000, NULL, 1, NULL, 4, NULL, NULL, 7, 750, 750, NULL, NULL, NULL, NULL, NULL, '王伟', '13572523592', NULL, '陕西省', '西安市', NULL, '西沣路266', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, '2021-01-28 23:26:00');
INSERT INTO `oms_order` VALUES (38, 14, '202101290940568381354967735310483457', NULL, '2021-01-29 09:40:57', '余生余生愿你安好', 55490.0000, 55492.0000, 2.0000, 0.0000, 0.0000, 0.0000, NULL, 1, NULL, 4, NULL, NULL, 7, 500, 500, NULL, NULL, NULL, NULL, NULL, '王伟', '13572523592', NULL, '陕西省', '西安市', NULL, '西沣路266', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, '2021-01-29 09:40:57');
INSERT INTO `oms_order` VALUES (39, 14, '202101291153040791355000984636260354', NULL, '2021-01-29 11:53:04', '余生余生愿你安好', 62787.0000, 62789.0000, 2.0000, 0.0000, 0.0000, 0.0000, NULL, 1, NULL, 4, NULL, NULL, 7, 510, 510, NULL, NULL, NULL, NULL, NULL, '王伟', '13572523592', NULL, '陕西省', '西安市', NULL, '西沣路266', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, '2021-01-29 11:53:04');
INSERT INTO `oms_order` VALUES (40, 14, '202101291156188691355001801577627649', NULL, '2021-01-29 11:56:19', '余生余生愿你安好', 62787.0000, 62789.0000, 2.0000, 0.0000, 0.0000, 0.0000, NULL, 1, NULL, 4, NULL, NULL, 7, 510, 510, NULL, NULL, NULL, NULL, NULL, '王伟', '13572523592', NULL, '陕西省', '西安市', NULL, '西沣路266', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, '2021-01-29 11:56:19');
INSERT INTO `oms_order` VALUES (41, 14, '202101291158481061355002427518779394', NULL, '2021-01-29 11:58:48', '余生余生愿你安好', 62787.0000, 62789.0000, 2.0000, 0.0000, 0.0000, 0.0000, NULL, 1, NULL, 4, NULL, NULL, 7, 510, 510, NULL, NULL, NULL, NULL, NULL, '王伟', '13572523592', NULL, '陕西省', '西安市', NULL, '西沣路266', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, '2021-01-29 11:58:48');
INSERT INTO `oms_order` VALUES (42, 14, '202101291332522821355026100921417730', NULL, '2021-01-29 13:32:52', '余生余生愿你安好', 62787.0000, 62789.0000, 2.0000, 0.0000, 0.0000, 0.0000, NULL, 1, NULL, 4, NULL, NULL, 7, 510, 510, NULL, NULL, NULL, NULL, NULL, '王伟', '13572523592', NULL, '陕西省', '西安市', NULL, '西沣路266', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, '2021-01-29 13:32:52');
INSERT INTO `oms_order` VALUES (43, 14, '202101291355082701355031704452841474', NULL, '2021-01-29 13:55:08', '余生余生愿你安好', 62787.0000, 62789.0000, 2.0000, 0.0000, 0.0000, 0.0000, NULL, 1, NULL, 4, NULL, NULL, 7, 510, 510, NULL, NULL, NULL, NULL, NULL, '王伟', '13572523592', NULL, '陕西省', '西安市', NULL, '西沣路266', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, '2021-01-29 13:55:08');
INSERT INTO `oms_order` VALUES (44, 14, '202101291400141101355032987238776833', NULL, '2021-01-29 14:00:14', '余生余生愿你安好', 62787.0000, 62789.0000, 2.0000, 0.0000, 0.0000, 0.0000, NULL, 1, NULL, 4, NULL, NULL, 7, 510, 510, NULL, NULL, NULL, NULL, NULL, '王伟', '13572523592', NULL, '陕西省', '西安市', NULL, '西沣路266', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, '2021-01-29 14:00:14');
INSERT INTO `oms_order` VALUES (45, 14, '202101291415338341355036844836634626', NULL, '2021-01-29 14:15:34', '余生余生愿你安好', 62787.0000, 62789.0000, 2.0000, 0.0000, 0.0000, 0.0000, NULL, 1, NULL, 4, NULL, NULL, 7, 510, 510, NULL, NULL, NULL, NULL, NULL, '王伟', '13572523592', NULL, '陕西省', '西安市', NULL, '西沣路266', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, '2021-01-29 14:15:34');
INSERT INTO `oms_order` VALUES (46, 14, '202101291628467061355070369359052802', NULL, '2021-01-29 16:28:47', '余生余生愿你安好', 62787.0000, 62789.0000, 2.0000, 0.0000, 0.0000, 0.0000, NULL, 1, NULL, 3, NULL, NULL, 7, 510, 510, NULL, NULL, NULL, NULL, NULL, '王伟', '13572523592', NULL, '陕西省', '西安市', NULL, '西沣路266', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, '2021-01-29 16:28:47');
INSERT INTO `oms_order` VALUES (47, 14, '202101291638065571355072717582008321', NULL, '2021-01-29 16:38:07', '余生余生愿你安好', 62787.0000, 62789.0000, 2.0000, 0.0000, 0.0000, 0.0000, NULL, 1, NULL, 4, NULL, NULL, 7, 510, 510, NULL, NULL, NULL, NULL, NULL, '王伟', '13572523592', NULL, '陕西省', '西安市', NULL, '西沣路266', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, '2021-01-29 16:38:07');
INSERT INTO `oms_order` VALUES (48, 14, '202101291639556391355073175079911426', NULL, '2021-01-29 16:39:56', '余生余生愿你安好', 62787.0000, 62789.0000, 2.0000, 0.0000, 0.0000, 0.0000, NULL, 1, NULL, 4, NULL, NULL, 7, 510, 510, NULL, NULL, NULL, NULL, NULL, '王伟', '13572523592', NULL, '陕西省', '西安市', NULL, '西沣路266', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, '2021-01-29 16:39:56');
INSERT INTO `oms_order` VALUES (49, 14, '202101291648285451355075326367793154', NULL, '2021-01-29 16:48:29', '余生余生愿你安好', 62787.0000, 62789.0000, 2.0000, 0.0000, 0.0000, 0.0000, NULL, 1, NULL, 4, NULL, NULL, 7, 510, 510, NULL, NULL, NULL, NULL, NULL, '王伟', '13572523592', NULL, '陕西省', '西安市', NULL, '西沣路266', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, '2021-01-29 16:48:29');
INSERT INTO `oms_order` VALUES (50, 14, '202101291649055991355075481783533570', NULL, '2021-01-29 16:49:06', '余生余生愿你安好', 62787.0000, 62789.0000, 2.0000, 0.0000, 0.0000, 0.0000, NULL, 1, NULL, 4, NULL, NULL, 7, 510, 510, NULL, NULL, NULL, NULL, NULL, '王伟', '13572523592', NULL, '陕西省', '西安市', NULL, '西沣路266', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, '2021-01-29 16:49:06');
INSERT INTO `oms_order` VALUES (51, 14, '202101291700138671355078284698484738', NULL, '2021-01-29 17:00:14', '余生余生愿你安好', 62787.0000, 62789.0000, 2.0000, 0.0000, 0.0000, 0.0000, NULL, 1, NULL, 4, NULL, NULL, 7, 510, 510, NULL, NULL, NULL, NULL, NULL, '王伟', '13572523592', NULL, '陕西省', '西安市', NULL, '西沣路266', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, '2021-01-29 17:00:14');
INSERT INTO `oms_order` VALUES (52, 14, '202101291702163081355078798253260801', NULL, '2021-01-29 17:02:16', '余生余生愿你安好', 62787.0000, 62789.0000, 2.0000, 0.0000, 0.0000, 0.0000, NULL, 1, NULL, 4, NULL, NULL, 7, 510, 510, NULL, NULL, NULL, NULL, NULL, '王伟', '13572523592', NULL, '陕西省', '西安市', NULL, '西沣路266', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, '2021-01-29 17:02:16');
INSERT INTO `oms_order` VALUES (53, 14, '202101291708568221355080478143381506', NULL, '2021-01-29 17:08:57', '余生余生愿你安好', 62787.0000, 62789.0000, 2.0000, 0.0000, 0.0000, 0.0000, NULL, 1, NULL, 4, NULL, NULL, 7, 510, 510, NULL, NULL, NULL, NULL, NULL, '王伟', '13572523592', NULL, '陕西省', '西安市', NULL, '西沣路266', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, '2021-01-29 17:08:57');
INSERT INTO `oms_order` VALUES (58, 14, '202101312013247461355851676108312577', NULL, '2021-01-31 20:13:26', '余生余生愿你安好', 1799.0000, 1801.0000, 2.0000, 0.0000, 0.0000, 0.0000, NULL, 1, NULL, 4, NULL, NULL, 7, 30, 30, NULL, NULL, NULL, NULL, NULL, '王伟', '13572523592', NULL, '陕西省', '西安市', NULL, '西沣路266', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, '2021-01-31 20:13:26');
INSERT INTO `oms_order` VALUES (59, 14, '202101312019250421355853187295072258', NULL, '2021-01-31 20:19:25', '余生余生愿你安好', 1799.0000, 1801.0000, 2.0000, 0.0000, 0.0000, 0.0000, NULL, 1, NULL, 4, NULL, NULL, 7, 30, 30, NULL, NULL, NULL, NULL, NULL, '王伟', '13572523592', NULL, '陕西省', '西安市', NULL, '西沣路266', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, '2021-01-31 20:19:25');
INSERT INTO `oms_order` VALUES (60, 14, '202101312026238451355854943877976065', NULL, '2021-01-31 20:26:24', '余生余生愿你安好', 1799.0000, 1801.0000, 2.0000, 0.0000, 0.0000, 0.0000, NULL, 1, NULL, 1, NULL, NULL, 7, 30, 30, NULL, NULL, NULL, NULL, NULL, '王伟', '13572523592', NULL, '陕西省', '西安市', NULL, '西沣路266', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, '2021-01-31 20:26:24');

-- ----------------------------
-- Table structure for oms_order_item
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_item`;
CREATE TABLE `oms_order_item`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `order_id` bigint(0) NULL DEFAULT NULL COMMENT 'order_id',
  `order_sn` char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'order_sn',
  `spu_id` bigint(0) NULL DEFAULT NULL COMMENT 'spu_id',
  `spu_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'spu_name',
  `spu_pic` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'spu_pic',
  `spu_brand` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '品牌',
  `category_id` bigint(0) NULL DEFAULT NULL COMMENT '商品分类id',
  `sku_id` bigint(0) NULL DEFAULT NULL COMMENT '商品sku编号',
  `sku_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '商品sku名字',
  `sku_pic` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '商品sku图片',
  `sku_price` decimal(18, 4) NULL DEFAULT NULL COMMENT '商品sku价格',
  `sku_quantity` int(0) NULL DEFAULT NULL COMMENT '商品购买的数量',
  `sku_attrs_vals` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '商品销售属性组合（JSON）',
  `promotion_amount` decimal(18, 4) NULL DEFAULT NULL COMMENT '商品促销分解金额',
  `coupon_amount` decimal(18, 4) NULL DEFAULT NULL COMMENT '优惠券优惠分解金额',
  `integration_amount` decimal(18, 4) NULL DEFAULT NULL COMMENT '积分优惠分解金额',
  `real_amount` decimal(18, 4) NULL DEFAULT NULL COMMENT '该商品经过优惠后的分解金额',
  `gift_integration` int(0) NULL DEFAULT NULL COMMENT '赠送积分',
  `gift_growth` int(0) NULL DEFAULT NULL COMMENT '赠送成长值',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 106 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '订单项信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oms_order_item
-- ----------------------------
INSERT INTO `oms_order_item` VALUES (65, NULL, '202101281641128461354711111048179713', 3, '华为 HUAWEI Mate 30E Pro 5G', NULL, '华为', 225, 5, '华为 HUAWEI Mate 30E Pro 5G 星河银 8+128g 麒麟990E SoC芯片 双4000万徕卡电影影像 全网通手机', 'https://vivi-gulimall.oss-cn-hangzhou.aliyuncs.com/2021-01-10/57c8e0f3-b570-4e20-8af7-c689ae813fd7_d511faab82abb34b.jpg', 5299.0000, 5, '颜色：星河银;内存：8+128g', 0.0000, 0.0000, 0.0000, 26495.0000, 250, 250);
INSERT INTO `oms_order_item` VALUES (66, NULL, '202101281641128461354711111048179713', 3, '华为 HUAWEI Mate 30E Pro 5G', NULL, '华为', 225, 4, '华为 HUAWEI Mate 30E Pro 5G 亮黑色 8+256g 麒麟990E SoC芯片 双4000万徕卡电影影像 全网通手机', 'https://vivi-gulimall.oss-cn-hangzhou.aliyuncs.com/2021-01-10/8fd16570-d701-4a61-8f58-3c2b7b1d57fb_8bf441260bffa42f.jpg', 5799.0000, 5, '颜色：亮黑色;内存：8+256g', 0.0000, 0.0000, 0.0000, 28995.0000, 250, 250);
INSERT INTO `oms_order_item` VALUES (67, NULL, '202101281649307561354713199429890049', 3, '华为 HUAWEI Mate 30E Pro 5G', NULL, '华为', 225, 5, '华为 HUAWEI Mate 30E Pro 5G 星河银 8+128g 麒麟990E SoC芯片 双4000万徕卡电影影像 全网通手机', 'https://vivi-gulimall.oss-cn-hangzhou.aliyuncs.com/2021-01-10/57c8e0f3-b570-4e20-8af7-c689ae813fd7_d511faab82abb34b.jpg', 5299.0000, 5, '颜色：星河银;内存：8+128g', 0.0000, 0.0000, 0.0000, 26495.0000, 250, 250);
INSERT INTO `oms_order_item` VALUES (68, NULL, '202101281649307561354713199429890049', 3, '华为 HUAWEI Mate 30E Pro 5G', NULL, '华为', 225, 4, '华为 HUAWEI Mate 30E Pro 5G 亮黑色 8+256g 麒麟990E SoC芯片 双4000万徕卡电影影像 全网通手机', 'https://vivi-gulimall.oss-cn-hangzhou.aliyuncs.com/2021-01-10/8fd16570-d701-4a61-8f58-3c2b7b1d57fb_8bf441260bffa42f.jpg', 5799.0000, 5, '颜色：亮黑色;内存：8+256g', 0.0000, 0.0000, 0.0000, 28995.0000, 250, 250);
INSERT INTO `oms_order_item` VALUES (69, NULL, '202101282211337601354794245999661058', 3, '华为 HUAWEI Mate 30E Pro 5G', NULL, '华为', 225, 5, '华为 HUAWEI Mate 30E Pro 5G 星河银 8+128g 麒麟990E SoC芯片 双4000万徕卡电影影像 全网通手机', 'https://vivi-gulimall.oss-cn-hangzhou.aliyuncs.com/2021-01-10/57c8e0f3-b570-4e20-8af7-c689ae813fd7_d511faab82abb34b.jpg', 5299.0000, 5, '颜色：星河银;内存：8+128g', 0.0000, 0.0000, 0.0000, 26495.0000, 250, 250);
INSERT INTO `oms_order_item` VALUES (70, NULL, '202101282211337601354794245999661058', 3, '华为 HUAWEI Mate 30E Pro 5G', NULL, '华为', 225, 6, '华为 HUAWEI Mate 30E Pro 5G 星河银 8+256g 麒麟990E SoC芯片 双4000万徕卡电影影像 全网通手机', 'https://vivi-gulimall.oss-cn-hangzhou.aliyuncs.com/2021-01-10/57c8e0f3-b570-4e20-8af7-c689ae813fd7_d511faab82abb34b.jpg', 5799.0000, 5, '颜色：星河银;内存：8+256g', 0.0000, 0.0000, 0.0000, 28995.0000, 250, 250);
INSERT INTO `oms_order_item` VALUES (71, NULL, '202101282222341641354797015913828353', 3, '华为 HUAWEI Mate 30E Pro 5G', NULL, '华为', 225, 1, '华为 HUAWEI Mate 30E Pro 5G 翡翠冷 8+128g 麒麟990E SoC芯片 双4000万徕卡电影影像 全网通手机', 'https://vivi-gulimall.oss-cn-hangzhou.aliyuncs.com/2021-01-10/9501feff-cf63-4741-8ca4-4a796a6cfbce_a83bf5250e14caf2 - 副本.jpg', 5299.0000, 5, '颜色：翡翠冷;内存：8+128g', 0.0000, 0.0000, 0.0000, 26495.0000, 250, 250);
INSERT INTO `oms_order_item` VALUES (72, NULL, '202101282222341641354797015913828353', 3, '华为 HUAWEI Mate 30E Pro 5G', NULL, '华为', 225, 2, '华为 HUAWEI Mate 30E Pro 5G 翡翠冷 8+256g 麒麟990E SoC芯片 双4000万徕卡电影影像 全网通手机', 'https://vivi-gulimall.oss-cn-hangzhou.aliyuncs.com/2021-01-10/9501feff-cf63-4741-8ca4-4a796a6cfbce_a83bf5250e14caf2 - 副本.jpg', 5799.0000, 5, '颜色：翡翠冷;内存：8+256g', 0.0000, 0.0000, 0.0000, 28995.0000, 250, 250);
INSERT INTO `oms_order_item` VALUES (73, NULL, '202101282326002041354812979619299329', 3, '华为 HUAWEI Mate 30E Pro 5G', NULL, '华为', 225, 1, '华为 HUAWEI Mate 30E Pro 5G 翡翠冷 8+128g 麒麟990E SoC芯片 双4000万徕卡电影影像 全网通手机', 'https://vivi-gulimall.oss-cn-hangzhou.aliyuncs.com/2021-01-10/9501feff-cf63-4741-8ca4-4a796a6cfbce_a83bf5250e14caf2 - 副本.jpg', 5299.0000, 10, '颜色：翡翠冷;内存：8+128g', 0.0000, 0.0000, 0.0000, 52990.0000, 500, 500);
INSERT INTO `oms_order_item` VALUES (74, NULL, '202101282326002041354812979619299329', 3, '华为 HUAWEI Mate 30E Pro 5G', NULL, '华为', 225, 2, '华为 HUAWEI Mate 30E Pro 5G 翡翠冷 8+256g 麒麟990E SoC芯片 双4000万徕卡电影影像 全网通手机', 'https://vivi-gulimall.oss-cn-hangzhou.aliyuncs.com/2021-01-10/9501feff-cf63-4741-8ca4-4a796a6cfbce_a83bf5250e14caf2 - 副本.jpg', 5799.0000, 5, '颜色：翡翠冷;内存：8+256g', 0.0000, 0.0000, 0.0000, 28995.0000, 250, 250);
INSERT INTO `oms_order_item` VALUES (75, NULL, '202101290940568381354967735310483457', 3, '华为 HUAWEI Mate 30E Pro 5G', NULL, '华为', 225, 3, '华为 HUAWEI Mate 30E Pro 5G 亮黑色 8+128g 麒麟990E SoC芯片 双4000万徕卡电影影像 全网通手机', 'https://vivi-gulimall.oss-cn-hangzhou.aliyuncs.com/2021-01-10/8fd16570-d701-4a61-8f58-3c2b7b1d57fb_8bf441260bffa42f.jpg', 5299.0000, 5, '颜色：亮黑色;内存：8+128g', 0.0000, 0.0000, 0.0000, 26495.0000, 250, 250);
INSERT INTO `oms_order_item` VALUES (76, NULL, '202101290940568381354967735310483457', 3, '华为 HUAWEI Mate 30E Pro 5G', NULL, '华为', 225, 2, '华为 HUAWEI Mate 30E Pro 5G 翡翠冷 8+256g 麒麟990E SoC芯片 双4000万徕卡电影影像 全网通手机', 'https://vivi-gulimall.oss-cn-hangzhou.aliyuncs.com/2021-01-10/9501feff-cf63-4741-8ca4-4a796a6cfbce_a83bf5250e14caf2 - 副本.jpg', 5799.0000, 5, '颜色：翡翠冷;内存：8+256g', 0.0000, 0.0000, 0.0000, 28995.0000, 250, 250);
INSERT INTO `oms_order_item` VALUES (77, NULL, '202101291153040791355000984636260354', 4, 'Apple iPhone XR (A2108) ', NULL, '苹果', 225, 7, 'Apple iPhone XR (A2108)  红色 64g 移动联通电信4G手机 双卡双待', 'https://vivi-gulimall.oss-cn-hangzhou.aliyuncs.com/2021-01-10/571335f0-73d0-4544-88d1-a9ecc4bc054b_ccd1077b985c7150.jpg', 3999.0000, 7, '颜色：红色;内存：64g', 0.0000, 0.0000, 0.0000, 27993.0000, 210, 210);
INSERT INTO `oms_order_item` VALUES (78, NULL, '202101291153040791355000984636260354', 3, '华为 HUAWEI Mate 30E Pro 5G', NULL, '华为', 225, 6, '华为 HUAWEI Mate 30E Pro 5G 星河银 8+256g 麒麟990E SoC芯片 双4000万徕卡电影影像 全网通手机', 'https://vivi-gulimall.oss-cn-hangzhou.aliyuncs.com/2021-01-10/57c8e0f3-b570-4e20-8af7-c689ae813fd7_d511faab82abb34b.jpg', 5799.0000, 6, '颜色：星河银;内存：8+256g', 0.0000, 0.0000, 0.0000, 34794.0000, 300, 300);
INSERT INTO `oms_order_item` VALUES (79, NULL, '202101291156188691355001801577627649', 4, 'Apple iPhone XR (A2108) ', NULL, '苹果', 225, 7, 'Apple iPhone XR (A2108)  红色 64g 移动联通电信4G手机 双卡双待', 'https://vivi-gulimall.oss-cn-hangzhou.aliyuncs.com/2021-01-10/571335f0-73d0-4544-88d1-a9ecc4bc054b_ccd1077b985c7150.jpg', 3999.0000, 7, '颜色：红色;内存：64g', 0.0000, 0.0000, 0.0000, 27993.0000, 210, 210);
INSERT INTO `oms_order_item` VALUES (80, NULL, '202101291156188691355001801577627649', 3, '华为 HUAWEI Mate 30E Pro 5G', NULL, '华为', 225, 6, '华为 HUAWEI Mate 30E Pro 5G 星河银 8+256g 麒麟990E SoC芯片 双4000万徕卡电影影像 全网通手机', 'https://vivi-gulimall.oss-cn-hangzhou.aliyuncs.com/2021-01-10/57c8e0f3-b570-4e20-8af7-c689ae813fd7_d511faab82abb34b.jpg', 5799.0000, 6, '颜色：星河银;内存：8+256g', 0.0000, 0.0000, 0.0000, 34794.0000, 300, 300);
INSERT INTO `oms_order_item` VALUES (81, NULL, '202101291158481061355002427518779394', 4, 'Apple iPhone XR (A2108) ', NULL, '苹果', 225, 7, 'Apple iPhone XR (A2108)  红色 64g 移动联通电信4G手机 双卡双待', 'https://vivi-gulimall.oss-cn-hangzhou.aliyuncs.com/2021-01-10/571335f0-73d0-4544-88d1-a9ecc4bc054b_ccd1077b985c7150.jpg', 3999.0000, 7, '颜色：红色;内存：64g', 0.0000, 0.0000, 0.0000, 27993.0000, 210, 210);
INSERT INTO `oms_order_item` VALUES (82, NULL, '202101291158481061355002427518779394', 3, '华为 HUAWEI Mate 30E Pro 5G', NULL, '华为', 225, 6, '华为 HUAWEI Mate 30E Pro 5G 星河银 8+256g 麒麟990E SoC芯片 双4000万徕卡电影影像 全网通手机', 'https://vivi-gulimall.oss-cn-hangzhou.aliyuncs.com/2021-01-10/57c8e0f3-b570-4e20-8af7-c689ae813fd7_d511faab82abb34b.jpg', 5799.0000, 6, '颜色：星河银;内存：8+256g', 0.0000, 0.0000, 0.0000, 34794.0000, 300, 300);
INSERT INTO `oms_order_item` VALUES (83, NULL, '202101291332522821355026100921417730', 4, 'Apple iPhone XR (A2108) ', NULL, '苹果', 225, 7, 'Apple iPhone XR (A2108)  红色 64g 移动联通电信4G手机 双卡双待', 'https://vivi-gulimall.oss-cn-hangzhou.aliyuncs.com/2021-01-10/571335f0-73d0-4544-88d1-a9ecc4bc054b_ccd1077b985c7150.jpg', 3999.0000, 7, '颜色：红色;内存：64g', 0.0000, 0.0000, 0.0000, 27993.0000, 210, 210);
INSERT INTO `oms_order_item` VALUES (84, NULL, '202101291332522821355026100921417730', 3, '华为 HUAWEI Mate 30E Pro 5G', NULL, '华为', 225, 6, '华为 HUAWEI Mate 30E Pro 5G 星河银 8+256g 麒麟990E SoC芯片 双4000万徕卡电影影像 全网通手机', 'https://vivi-gulimall.oss-cn-hangzhou.aliyuncs.com/2021-01-10/57c8e0f3-b570-4e20-8af7-c689ae813fd7_d511faab82abb34b.jpg', 5799.0000, 6, '颜色：星河银;内存：8+256g', 0.0000, 0.0000, 0.0000, 34794.0000, 300, 300);
INSERT INTO `oms_order_item` VALUES (85, NULL, '202101291355082701355031704452841474', 4, 'Apple iPhone XR (A2108) ', NULL, '苹果', 225, 7, 'Apple iPhone XR (A2108)  红色 64g 移动联通电信4G手机 双卡双待', 'https://vivi-gulimall.oss-cn-hangzhou.aliyuncs.com/2021-01-10/571335f0-73d0-4544-88d1-a9ecc4bc054b_ccd1077b985c7150.jpg', 3999.0000, 7, '颜色：红色;内存：64g', 0.0000, 0.0000, 0.0000, 27993.0000, 210, 210);
INSERT INTO `oms_order_item` VALUES (86, NULL, '202101291355082701355031704452841474', 3, '华为 HUAWEI Mate 30E Pro 5G', NULL, '华为', 225, 6, '华为 HUAWEI Mate 30E Pro 5G 星河银 8+256g 麒麟990E SoC芯片 双4000万徕卡电影影像 全网通手机', 'https://vivi-gulimall.oss-cn-hangzhou.aliyuncs.com/2021-01-10/57c8e0f3-b570-4e20-8af7-c689ae813fd7_d511faab82abb34b.jpg', 5799.0000, 6, '颜色：星河银;内存：8+256g', 0.0000, 0.0000, 0.0000, 34794.0000, 300, 300);
INSERT INTO `oms_order_item` VALUES (87, NULL, '202101291400141101355032987238776833', 4, 'Apple iPhone XR (A2108) ', NULL, '苹果', 225, 7, 'Apple iPhone XR (A2108)  红色 64g 移动联通电信4G手机 双卡双待', 'https://vivi-gulimall.oss-cn-hangzhou.aliyuncs.com/2021-01-10/571335f0-73d0-4544-88d1-a9ecc4bc054b_ccd1077b985c7150.jpg', 3999.0000, 7, '颜色：红色;内存：64g', 0.0000, 0.0000, 0.0000, 27993.0000, 210, 210);
INSERT INTO `oms_order_item` VALUES (88, NULL, '202101291400141101355032987238776833', 3, '华为 HUAWEI Mate 30E Pro 5G', NULL, '华为', 225, 6, '华为 HUAWEI Mate 30E Pro 5G 星河银 8+256g 麒麟990E SoC芯片 双4000万徕卡电影影像 全网通手机', 'https://vivi-gulimall.oss-cn-hangzhou.aliyuncs.com/2021-01-10/57c8e0f3-b570-4e20-8af7-c689ae813fd7_d511faab82abb34b.jpg', 5799.0000, 6, '颜色：星河银;内存：8+256g', 0.0000, 0.0000, 0.0000, 34794.0000, 300, 300);
INSERT INTO `oms_order_item` VALUES (89, NULL, '202101291415338341355036844836634626', 4, 'Apple iPhone XR (A2108) ', NULL, '苹果', 225, 7, 'Apple iPhone XR (A2108)  红色 64g 移动联通电信4G手机 双卡双待', 'https://vivi-gulimall.oss-cn-hangzhou.aliyuncs.com/2021-01-10/571335f0-73d0-4544-88d1-a9ecc4bc054b_ccd1077b985c7150.jpg', 3999.0000, 7, '颜色：红色;内存：64g', 0.0000, 0.0000, 0.0000, 27993.0000, 210, 210);
INSERT INTO `oms_order_item` VALUES (90, NULL, '202101291415338341355036844836634626', 3, '华为 HUAWEI Mate 30E Pro 5G', NULL, '华为', 225, 6, '华为 HUAWEI Mate 30E Pro 5G 星河银 8+256g 麒麟990E SoC芯片 双4000万徕卡电影影像 全网通手机', 'https://vivi-gulimall.oss-cn-hangzhou.aliyuncs.com/2021-01-10/57c8e0f3-b570-4e20-8af7-c689ae813fd7_d511faab82abb34b.jpg', 5799.0000, 6, '颜色：星河银;内存：8+256g', 0.0000, 0.0000, 0.0000, 34794.0000, 300, 300);
INSERT INTO `oms_order_item` VALUES (91, NULL, '202101291628467061355070369359052802', 4, 'Apple iPhone XR (A2108) ', NULL, '苹果', 225, 7, 'Apple iPhone XR (A2108)  红色 64g 移动联通电信4G手机 双卡双待', 'https://vivi-gulimall.oss-cn-hangzhou.aliyuncs.com/2021-01-10/571335f0-73d0-4544-88d1-a9ecc4bc054b_ccd1077b985c7150.jpg', 3999.0000, 7, '颜色：红色;内存：64g', 0.0000, 0.0000, 0.0000, 27993.0000, 210, 210);
INSERT INTO `oms_order_item` VALUES (92, NULL, '202101291628467061355070369359052802', 3, '华为 HUAWEI Mate 30E Pro 5G', NULL, '华为', 225, 6, '华为 HUAWEI Mate 30E Pro 5G 星河银 8+256g 麒麟990E SoC芯片 双4000万徕卡电影影像 全网通手机', 'https://vivi-gulimall.oss-cn-hangzhou.aliyuncs.com/2021-01-10/57c8e0f3-b570-4e20-8af7-c689ae813fd7_d511faab82abb34b.jpg', 5799.0000, 6, '颜色：星河银;内存：8+256g', 0.0000, 0.0000, 0.0000, 34794.0000, 300, 300);
INSERT INTO `oms_order_item` VALUES (93, NULL, '202101291638065571355072717582008321', 4, 'Apple iPhone XR (A2108) ', NULL, '苹果', 225, 7, 'Apple iPhone XR (A2108)  红色 64g 移动联通电信4G手机 双卡双待', 'https://vivi-gulimall.oss-cn-hangzhou.aliyuncs.com/2021-01-10/571335f0-73d0-4544-88d1-a9ecc4bc054b_ccd1077b985c7150.jpg', 3999.0000, 7, '颜色：红色;内存：64g', 0.0000, 0.0000, 0.0000, 27993.0000, 210, 210);
INSERT INTO `oms_order_item` VALUES (94, NULL, '202101291638065571355072717582008321', 3, '华为 HUAWEI Mate 30E Pro 5G', NULL, '华为', 225, 6, '华为 HUAWEI Mate 30E Pro 5G 星河银 8+256g 麒麟990E SoC芯片 双4000万徕卡电影影像 全网通手机', 'https://vivi-gulimall.oss-cn-hangzhou.aliyuncs.com/2021-01-10/57c8e0f3-b570-4e20-8af7-c689ae813fd7_d511faab82abb34b.jpg', 5799.0000, 6, '颜色：星河银;内存：8+256g', 0.0000, 0.0000, 0.0000, 34794.0000, 300, 300);
INSERT INTO `oms_order_item` VALUES (95, NULL, '202101291639556391355073175079911426', 4, 'Apple iPhone XR (A2108) ', NULL, '苹果', 225, 7, 'Apple iPhone XR (A2108)  红色 64g 移动联通电信4G手机 双卡双待', 'https://vivi-gulimall.oss-cn-hangzhou.aliyuncs.com/2021-01-10/571335f0-73d0-4544-88d1-a9ecc4bc054b_ccd1077b985c7150.jpg', 3999.0000, 7, '颜色：红色;内存：64g', 0.0000, 0.0000, 0.0000, 27993.0000, 210, 210);
INSERT INTO `oms_order_item` VALUES (96, NULL, '202101291639556391355073175079911426', 3, '华为 HUAWEI Mate 30E Pro 5G', NULL, '华为', 225, 6, '华为 HUAWEI Mate 30E Pro 5G 星河银 8+256g 麒麟990E SoC芯片 双4000万徕卡电影影像 全网通手机', 'https://vivi-gulimall.oss-cn-hangzhou.aliyuncs.com/2021-01-10/57c8e0f3-b570-4e20-8af7-c689ae813fd7_d511faab82abb34b.jpg', 5799.0000, 6, '颜色：星河银;内存：8+256g', 0.0000, 0.0000, 0.0000, 34794.0000, 300, 300);
INSERT INTO `oms_order_item` VALUES (97, NULL, '202101291648285451355075326367793154', 4, 'Apple iPhone XR (A2108) ', NULL, '苹果', 225, 7, 'Apple iPhone XR (A2108)  红色 64g 移动联通电信4G手机 双卡双待', 'https://vivi-gulimall.oss-cn-hangzhou.aliyuncs.com/2021-01-10/571335f0-73d0-4544-88d1-a9ecc4bc054b_ccd1077b985c7150.jpg', 3999.0000, 7, '颜色：红色;内存：64g', 0.0000, 0.0000, 0.0000, 27993.0000, 210, 210);
INSERT INTO `oms_order_item` VALUES (98, NULL, '202101291648285451355075326367793154', 3, '华为 HUAWEI Mate 30E Pro 5G', NULL, '华为', 225, 6, '华为 HUAWEI Mate 30E Pro 5G 星河银 8+256g 麒麟990E SoC芯片 双4000万徕卡电影影像 全网通手机', 'https://vivi-gulimall.oss-cn-hangzhou.aliyuncs.com/2021-01-10/57c8e0f3-b570-4e20-8af7-c689ae813fd7_d511faab82abb34b.jpg', 5799.0000, 6, '颜色：星河银;内存：8+256g', 0.0000, 0.0000, 0.0000, 34794.0000, 300, 300);
INSERT INTO `oms_order_item` VALUES (99, NULL, '202101291649055991355075481783533570', 4, 'Apple iPhone XR (A2108) ', NULL, '苹果', 225, 7, 'Apple iPhone XR (A2108)  红色 64g 移动联通电信4G手机 双卡双待', 'https://vivi-gulimall.oss-cn-hangzhou.aliyuncs.com/2021-01-10/571335f0-73d0-4544-88d1-a9ecc4bc054b_ccd1077b985c7150.jpg', 3999.0000, 7, '颜色：红色;内存：64g', 0.0000, 0.0000, 0.0000, 27993.0000, 210, 210);
INSERT INTO `oms_order_item` VALUES (100, NULL, '202101291649055991355075481783533570', 3, '华为 HUAWEI Mate 30E Pro 5G', NULL, '华为', 225, 6, '华为 HUAWEI Mate 30E Pro 5G 星河银 8+256g 麒麟990E SoC芯片 双4000万徕卡电影影像 全网通手机', 'https://vivi-gulimall.oss-cn-hangzhou.aliyuncs.com/2021-01-10/57c8e0f3-b570-4e20-8af7-c689ae813fd7_d511faab82abb34b.jpg', 5799.0000, 6, '颜色：星河银;内存：8+256g', 0.0000, 0.0000, 0.0000, 34794.0000, 300, 300);
INSERT INTO `oms_order_item` VALUES (101, NULL, '202101291700138671355078284698484738', 4, 'Apple iPhone XR (A2108) ', NULL, '苹果', 225, 7, 'Apple iPhone XR (A2108)  红色 64g 移动联通电信4G手机 双卡双待', 'https://vivi-gulimall.oss-cn-hangzhou.aliyuncs.com/2021-01-10/571335f0-73d0-4544-88d1-a9ecc4bc054b_ccd1077b985c7150.jpg', 3999.0000, 7, '颜色：红色;内存：64g', 0.0000, 0.0000, 0.0000, 27993.0000, 210, 210);
INSERT INTO `oms_order_item` VALUES (102, NULL, '202101291700138671355078284698484738', 3, '华为 HUAWEI Mate 30E Pro 5G', NULL, '华为', 225, 6, '华为 HUAWEI Mate 30E Pro 5G 星河银 8+256g 麒麟990E SoC芯片 双4000万徕卡电影影像 全网通手机', 'https://vivi-gulimall.oss-cn-hangzhou.aliyuncs.com/2021-01-10/57c8e0f3-b570-4e20-8af7-c689ae813fd7_d511faab82abb34b.jpg', 5799.0000, 6, '颜色：星河银;内存：8+256g', 0.0000, 0.0000, 0.0000, 34794.0000, 300, 300);
INSERT INTO `oms_order_item` VALUES (103, NULL, '202101291702163081355078798253260801', 4, 'Apple iPhone XR (A2108) ', NULL, '苹果', 225, 7, 'Apple iPhone XR (A2108)  红色 64g 移动联通电信4G手机 双卡双待', 'https://vivi-gulimall.oss-cn-hangzhou.aliyuncs.com/2021-01-10/571335f0-73d0-4544-88d1-a9ecc4bc054b_ccd1077b985c7150.jpg', 3999.0000, 7, '颜色：红色;内存：64g', 0.0000, 0.0000, 0.0000, 27993.0000, 210, 210);
INSERT INTO `oms_order_item` VALUES (104, NULL, '202101291702163081355078798253260801', 3, '华为 HUAWEI Mate 30E Pro 5G', NULL, '华为', 225, 6, '华为 HUAWEI Mate 30E Pro 5G 星河银 8+256g 麒麟990E SoC芯片 双4000万徕卡电影影像 全网通手机', 'https://vivi-gulimall.oss-cn-hangzhou.aliyuncs.com/2021-01-10/57c8e0f3-b570-4e20-8af7-c689ae813fd7_d511faab82abb34b.jpg', 5799.0000, 6, '颜色：星河银;内存：8+256g', 0.0000, 0.0000, 0.0000, 34794.0000, 300, 300);
INSERT INTO `oms_order_item` VALUES (105, NULL, '202101291708568221355080478143381506', 4, 'Apple iPhone XR (A2108) ', NULL, '苹果', 225, 7, 'Apple iPhone XR (A2108)  红色 64g 移动联通电信4G手机 双卡双待', 'https://vivi-gulimall.oss-cn-hangzhou.aliyuncs.com/2021-01-10/571335f0-73d0-4544-88d1-a9ecc4bc054b_ccd1077b985c7150.jpg', 3999.0000, 7, '颜色：红色;内存：64g', 0.0000, 0.0000, 0.0000, 27993.0000, 210, 210);
INSERT INTO `oms_order_item` VALUES (106, NULL, '202101291708568221355080478143381506', 3, '华为 HUAWEI Mate 30E Pro 5G', NULL, '华为', 225, 6, '华为 HUAWEI Mate 30E Pro 5G 星河银 8+256g 麒麟990E SoC芯片 双4000万徕卡电影影像 全网通手机', 'https://vivi-gulimall.oss-cn-hangzhou.aliyuncs.com/2021-01-10/57c8e0f3-b570-4e20-8af7-c689ae813fd7_d511faab82abb34b.jpg', 5799.0000, 6, '颜色：星河银;内存：8+256g', 0.0000, 0.0000, 0.0000, 34794.0000, 300, 300);
INSERT INTO `oms_order_item` VALUES (111, NULL, '202101312013247461355851676108312577', 4, 'Apple iPhone XR (A2108) ', NULL, '苹果', 225, 10, 'Apple iPhone XR (A2108)  蓝色 128g', 'https://vivi-gulimall.oss-cn-hangzhou.aliyuncs.com/2021-01-10/eca929c4-8608-49f2-80c1-d760a34da35b_hd2fcnwosm.png', 1799.0000, 1, '颜色：蓝色;内存：128g', 0.0000, 0.0000, 0.0000, 1799.0000, 30, 30);
INSERT INTO `oms_order_item` VALUES (112, NULL, '202101312019250421355853187295072258', 4, 'Apple iPhone XR (A2108) ', NULL, '苹果', 225, 10, 'Apple iPhone XR (A2108)  蓝色 128g', 'https://vivi-gulimall.oss-cn-hangzhou.aliyuncs.com/2021-01-10/eca929c4-8608-49f2-80c1-d760a34da35b_hd2fcnwosm.png', 1799.0000, 1, '颜色：蓝色;内存：128g', 0.0000, 0.0000, 0.0000, 1799.0000, 30, 30);
INSERT INTO `oms_order_item` VALUES (113, NULL, '202101312026238451355854943877976065', 4, 'Apple iPhone XR (A2108) ', NULL, '苹果', 225, 10, 'Apple iPhone XR (A2108)  蓝色 128g', 'https://vivi-gulimall.oss-cn-hangzhou.aliyuncs.com/2021-01-10/eca929c4-8608-49f2-80c1-d760a34da35b_hd2fcnwosm.png', 1799.0000, 1, '颜色：蓝色;内存：128g', 0.0000, 0.0000, 0.0000, 1799.0000, 30, 30);

-- ----------------------------
-- Table structure for oms_order_operate_history
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_operate_history`;
CREATE TABLE `oms_order_operate_history`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `order_id` bigint(0) NULL DEFAULT NULL COMMENT '订单id',
  `operate_man` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '操作人[用户；系统；后台管理员]',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
  `order_status` tinyint(0) NULL DEFAULT NULL COMMENT '订单状态【0->待付款；1->待发货；2->已发货；3->已完成；4->已关闭；5->无效订单】',
  `note` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '订单操作历史记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for oms_order_return_apply
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_return_apply`;
CREATE TABLE `oms_order_return_apply`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `order_id` bigint(0) NULL DEFAULT NULL COMMENT 'order_id',
  `sku_id` bigint(0) NULL DEFAULT NULL COMMENT '退货商品id',
  `order_sn` char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '订单编号',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '申请时间',
  `member_username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '会员用户名',
  `return_amount` decimal(18, 4) NULL DEFAULT NULL COMMENT '退款金额',
  `return_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '退货人姓名',
  `return_phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '退货人电话',
  `status` tinyint(1) NULL DEFAULT NULL COMMENT '申请状态[0->待处理；1->退货中；2->已完成；3->已拒绝]',
  `handle_time` datetime(0) NULL DEFAULT NULL COMMENT '处理时间',
  `sku_img` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '商品图片',
  `sku_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '商品名称',
  `sku_brand` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '商品品牌',
  `sku_attrs_vals` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '商品销售属性(JSON)',
  `sku_count` int(0) NULL DEFAULT NULL COMMENT '退货数量',
  `sku_price` decimal(18, 4) NULL DEFAULT NULL COMMENT '商品单价',
  `sku_real_price` decimal(18, 4) NULL DEFAULT NULL COMMENT '商品实际支付单价',
  `reason` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '原因',
  `description述` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '描述',
  `desc_pics` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '凭证图片，以逗号隔开',
  `handle_note` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '处理备注',
  `handle_man` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '处理人员',
  `receive_man` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '收货人',
  `receive_time` datetime(0) NULL DEFAULT NULL COMMENT '收货时间',
  `receive_note` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '收货备注',
  `receive_phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '收货电话',
  `company_address` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '公司收货地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '订单退货申请' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for oms_order_return_reason
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_return_reason`;
CREATE TABLE `oms_order_return_reason`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '退货原因名',
  `sort` int(0) NULL DEFAULT NULL COMMENT '排序',
  `status` tinyint(1) NULL DEFAULT NULL COMMENT '启用状态',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT 'create_time',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '退货原因' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for oms_order_setting
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_setting`;
CREATE TABLE `oms_order_setting`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `flash_order_overtime` int(0) NULL DEFAULT NULL COMMENT '秒杀订单超时关闭时间(分)',
  `normal_order_overtime` int(0) NULL DEFAULT NULL COMMENT '正常订单超时时间(分)',
  `confirm_overtime` int(0) NULL DEFAULT NULL COMMENT '发货后自动确认收货时间（天）',
  `finish_overtime` int(0) NULL DEFAULT NULL COMMENT '自动完成交易时间，不能申请退货（天）',
  `comment_overtime` int(0) NULL DEFAULT NULL COMMENT '订单完成后自动好评时间（天）',
  `member_level` tinyint(0) NULL DEFAULT NULL COMMENT '会员等级【0-不限会员等级，全部通用；其他-对应的其他会员等级】',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '订单配置信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for oms_payment_info
-- ----------------------------
DROP TABLE IF EXISTS `oms_payment_info`;
CREATE TABLE `oms_payment_info`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `order_sn` char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '订单号（对外业务号）',
  `order_id` bigint(0) NULL DEFAULT NULL COMMENT '订单id',
  `alipay_trade_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '支付宝交易流水号',
  `total_amount` decimal(18, 4) NULL DEFAULT NULL COMMENT '支付总金额',
  `subject` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '交易内容',
  `payment_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '支付状态',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `confirm_time` datetime(0) NULL DEFAULT NULL COMMENT '确认时间',
  `callback_content` varchar(4000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '回调内容',
  `callback_time` datetime(0) NULL DEFAULT NULL COMMENT '回调时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '支付信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oms_payment_info
-- ----------------------------
INSERT INTO `oms_payment_info` VALUES (1, '202101291708568221355080478143381506', NULL, '2021012922001444310500942422', 62789.0000, '谷粒商城订单', 'TRADE_SUCCESS', NULL, NULL, NULL, '2021-01-29 17:09:28');
INSERT INTO `oms_payment_info` VALUES (2, '202101312026238451355854943877976065', NULL, '2021013122001444310500943572', 1801.0000, '谷粒商城订单', 'TRADE_SUCCESS', NULL, NULL, NULL, '2021-01-31 20:26:52');

-- ----------------------------
-- Table structure for oms_refund_info
-- ----------------------------
DROP TABLE IF EXISTS `oms_refund_info`;
CREATE TABLE `oms_refund_info`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `order_return_id` bigint(0) NULL DEFAULT NULL COMMENT '退款的订单',
  `refund` decimal(18, 4) NULL DEFAULT NULL COMMENT '退款金额',
  `refund_sn` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '退款交易流水号',
  `refund_status` tinyint(1) NULL DEFAULT NULL COMMENT '退款状态',
  `refund_channel` tinyint(0) NULL DEFAULT NULL COMMENT '退款渠道[1-支付宝，2-微信，3-银联，4-汇款]',
  `refund_content` varchar(5000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '退款信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for undo_log
-- ----------------------------
DROP TABLE IF EXISTS `undo_log`;
CREATE TABLE `undo_log`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `branch_id` bigint(0) NOT NULL,
  `xid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `context` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `rollback_info` longblob NOT NULL,
  `log_status` int(0) NOT NULL,
  `log_created` datetime(0) NOT NULL,
  `log_modified` datetime(0) NOT NULL,
  `ext` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `ux_undo_log`(`xid`, `branch_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
