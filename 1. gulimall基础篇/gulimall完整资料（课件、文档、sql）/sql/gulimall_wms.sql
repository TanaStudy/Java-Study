/*
 Navicat Premium Data Transfer

 Source Server         : vm-gulimall
 Source Server Type    : MySQL
 Source Server Version : 80022
 Source Host           : gulimall.com:3306
 Source Schema         : gulimall_wms

 Target Server Type    : MySQL
 Target Server Version : 80022
 File Encoding         : 65001

 Date: 31/01/2021 20:41:33
*/

CREATE DATABASE /*!32312 IF NOT EXISTS*/`gulimall_wms` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `gulimall_wms`;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

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
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for wms_purchase
-- ----------------------------
DROP TABLE IF EXISTS `wms_purchase`;
CREATE TABLE `wms_purchase`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `assignee_id` bigint(0) NULL DEFAULT NULL,
  `assignee_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `phone` char(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `priority` int(0) NULL DEFAULT NULL,
  `status` int(0) NULL DEFAULT NULL,
  `ware_id` bigint(0) NULL DEFAULT NULL,
  `amount` decimal(18, 4) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '采购信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wms_purchase
-- ----------------------------
INSERT INTO `wms_purchase` VALUES (6, 1, 'admin', '13612345678', 1, 3, NULL, NULL, '2021-01-10 21:00:03', '2021-01-10 21:01:43');
INSERT INTO `wms_purchase` VALUES (7, 1, 'admin', '13612345678', 1, 4, NULL, NULL, '2021-01-10 21:04:42', '2021-01-10 21:05:48');

-- ----------------------------
-- Table structure for wms_purchase_detail
-- ----------------------------
DROP TABLE IF EXISTS `wms_purchase_detail`;
CREATE TABLE `wms_purchase_detail`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `purchase_id` bigint(0) NULL DEFAULT NULL COMMENT '采购单id',
  `sku_id` bigint(0) NULL DEFAULT NULL COMMENT '采购商品id',
  `sku_num` int(0) NULL DEFAULT NULL COMMENT '采购数量',
  `sku_price` decimal(18, 4) NULL DEFAULT NULL COMMENT '采购金额',
  `ware_id` bigint(0) NULL DEFAULT NULL COMMENT '仓库id',
  `status` int(0) NULL DEFAULT NULL COMMENT '状态[0新建，1待分配，2已分配，3正在采购，4已完成，5采购失败]',
  `fail_reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '采购失败原因',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wms_purchase_detail
-- ----------------------------
INSERT INTO `wms_purchase_detail` VALUES (8, 6, 2, 500, NULL, 2, 4, NULL);
INSERT INTO `wms_purchase_detail` VALUES (9, 7, 3, 1000, NULL, 1, 4, NULL);

-- ----------------------------
-- Table structure for wms_ware_info
-- ----------------------------
DROP TABLE IF EXISTS `wms_ware_info`;
CREATE TABLE `wms_ware_info`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '仓库名',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '仓库地址',
  `areacode` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '区域编码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '仓库信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wms_ware_info
-- ----------------------------
INSERT INTO `wms_ware_info` VALUES (1, '北京-1', '北京天安门对面', '128191');
INSERT INTO `wms_ware_info` VALUES (2, '上海-2', '上海交通大学后面', '728290');

-- ----------------------------
-- Table structure for wms_ware_order_task
-- ----------------------------
DROP TABLE IF EXISTS `wms_ware_order_task`;
CREATE TABLE `wms_ware_order_task`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `order_id` bigint(0) NULL DEFAULT NULL COMMENT 'order_id',
  `order_sn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'order_sn',
  `consignee` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '收货人',
  `consignee_tel` char(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '收货人电话',
  `delivery_address` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '配送地址',
  `order_comment` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '订单备注',
  `payment_way` tinyint(1) NULL DEFAULT NULL COMMENT '付款方式【 1:在线付款 2:货到付款】',
  `task_status` tinyint(0) NULL DEFAULT NULL COMMENT '任务状态',
  `order_body` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '订单描述',
  `tracking_no` char(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '物流单号',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT 'create_time',
  `ware_id` bigint(0) NULL DEFAULT NULL COMMENT '仓库id',
  `task_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '工作单备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '库存工作单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wms_ware_order_task
-- ----------------------------
INSERT INTO `wms_ware_order_task` VALUES (16, NULL, '202101281641128461354711111048179713', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `wms_ware_order_task` VALUES (17, NULL, '202101281649307561354713199429890049', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `wms_ware_order_task` VALUES (18, NULL, '202101282211337601354794245999661058', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `wms_ware_order_task` VALUES (19, NULL, '202101282222341641354797015913828353', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `wms_ware_order_task` VALUES (20, NULL, '202101282326002041354812979619299329', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `wms_ware_order_task` VALUES (21, NULL, '202101290940568381354967735310483457', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `wms_ware_order_task` VALUES (22, NULL, '202101291153040791355000984636260354', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `wms_ware_order_task` VALUES (23, NULL, '202101291156188691355001801577627649', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `wms_ware_order_task` VALUES (24, NULL, '202101291158481061355002427518779394', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `wms_ware_order_task` VALUES (25, NULL, '202101291332522821355026100921417730', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `wms_ware_order_task` VALUES (26, NULL, '202101291355082701355031704452841474', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `wms_ware_order_task` VALUES (27, NULL, '202101291400141101355032987238776833', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `wms_ware_order_task` VALUES (28, NULL, '202101291415338341355036844836634626', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `wms_ware_order_task` VALUES (29, NULL, '202101291628467061355070369359052802', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `wms_ware_order_task` VALUES (30, NULL, '202101291638065571355072717582008321', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `wms_ware_order_task` VALUES (31, NULL, '202101291639556391355073175079911426', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `wms_ware_order_task` VALUES (32, NULL, '202101291648285451355075326367793154', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `wms_ware_order_task` VALUES (33, NULL, '202101291649055991355075481783533570', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `wms_ware_order_task` VALUES (34, NULL, '202101291700138671355078284698484738', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `wms_ware_order_task` VALUES (35, NULL, '202101291702163081355078798253260801', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `wms_ware_order_task` VALUES (36, NULL, '202101291708568221355080478143381506', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for wms_ware_order_task_detail
-- ----------------------------
DROP TABLE IF EXISTS `wms_ware_order_task_detail`;
CREATE TABLE `wms_ware_order_task_detail`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `sku_id` bigint(0) NULL DEFAULT NULL COMMENT 'sku_id',
  `sku_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'sku_name',
  `sku_num` int(0) NULL DEFAULT NULL COMMENT '购买个数',
  `task_id` bigint(0) NULL DEFAULT NULL COMMENT '工作单id',
  `ware_id` bigint(0) NULL DEFAULT NULL COMMENT '仓库id',
  `lock_status` int(0) NULL DEFAULT NULL COMMENT '1-已锁定  2-已解锁  3-已扣减',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 72 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '库存工作单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wms_ware_order_task_detail
-- ----------------------------
INSERT INTO `wms_ware_order_task_detail` VALUES (31, 5, '华为 HUAWEI Mate 30E Pro 5G 星河银 8+128g 麒麟990E SoC芯片 双4000万徕卡电影影像 全网通手机', 5, 16, 1, 2);
INSERT INTO `wms_ware_order_task_detail` VALUES (32, 4, '华为 HUAWEI Mate 30E Pro 5G 亮黑色 8+256g 麒麟990E SoC芯片 双4000万徕卡电影影像 全网通手机', 5, 16, 2, 2);
INSERT INTO `wms_ware_order_task_detail` VALUES (33, 5, '华为 HUAWEI Mate 30E Pro 5G 星河银 8+128g 麒麟990E SoC芯片 双4000万徕卡电影影像 全网通手机', 5, 17, 1, 2);
INSERT INTO `wms_ware_order_task_detail` VALUES (34, 4, '华为 HUAWEI Mate 30E Pro 5G 亮黑色 8+256g 麒麟990E SoC芯片 双4000万徕卡电影影像 全网通手机', 5, 17, 2, 2);
INSERT INTO `wms_ware_order_task_detail` VALUES (35, 5, '华为 HUAWEI Mate 30E Pro 5G 星河银 8+128g 麒麟990E SoC芯片 双4000万徕卡电影影像 全网通手机', 5, 18, 1, 2);
INSERT INTO `wms_ware_order_task_detail` VALUES (36, 6, '华为 HUAWEI Mate 30E Pro 5G 星河银 8+256g 麒麟990E SoC芯片 双4000万徕卡电影影像 全网通手机', 5, 18, 2, 2);
INSERT INTO `wms_ware_order_task_detail` VALUES (37, 1, '华为 HUAWEI Mate 30E Pro 5G 翡翠冷 8+128g 麒麟990E SoC芯片 双4000万徕卡电影影像 全网通手机', 5, 19, 1, 2);
INSERT INTO `wms_ware_order_task_detail` VALUES (38, 2, '华为 HUAWEI Mate 30E Pro 5G 翡翠冷 8+256g 麒麟990E SoC芯片 双4000万徕卡电影影像 全网通手机', 5, 19, 1, 2);
INSERT INTO `wms_ware_order_task_detail` VALUES (39, 1, '华为 HUAWEI Mate 30E Pro 5G 翡翠冷 8+128g 麒麟990E SoC芯片 双4000万徕卡电影影像 全网通手机', 10, 20, 1, 2);
INSERT INTO `wms_ware_order_task_detail` VALUES (40, 2, '华为 HUAWEI Mate 30E Pro 5G 翡翠冷 8+256g 麒麟990E SoC芯片 双4000万徕卡电影影像 全网通手机', 5, 20, 1, 2);
INSERT INTO `wms_ware_order_task_detail` VALUES (41, 3, '华为 HUAWEI Mate 30E Pro 5G 亮黑色 8+128g 麒麟990E SoC芯片 双4000万徕卡电影影像 全网通手机', 5, 21, 1, 2);
INSERT INTO `wms_ware_order_task_detail` VALUES (42, 2, '华为 HUAWEI Mate 30E Pro 5G 翡翠冷 8+256g 麒麟990E SoC芯片 双4000万徕卡电影影像 全网通手机', 5, 21, 1, 2);
INSERT INTO `wms_ware_order_task_detail` VALUES (43, 7, 'Apple iPhone XR (A2108)  红色 64g 移动联通电信4G手机 双卡双待', 7, 22, 1, 2);
INSERT INTO `wms_ware_order_task_detail` VALUES (44, 6, '华为 HUAWEI Mate 30E Pro 5G 星河银 8+256g 麒麟990E SoC芯片 双4000万徕卡电影影像 全网通手机', 6, 22, 2, 2);
INSERT INTO `wms_ware_order_task_detail` VALUES (45, 7, 'Apple iPhone XR (A2108)  红色 64g 移动联通电信4G手机 双卡双待', 7, 23, 1, 2);
INSERT INTO `wms_ware_order_task_detail` VALUES (46, 6, '华为 HUAWEI Mate 30E Pro 5G 星河银 8+256g 麒麟990E SoC芯片 双4000万徕卡电影影像 全网通手机', 6, 23, 2, 2);
INSERT INTO `wms_ware_order_task_detail` VALUES (47, 7, 'Apple iPhone XR (A2108)  红色 64g 移动联通电信4G手机 双卡双待', 7, 24, 1, 2);
INSERT INTO `wms_ware_order_task_detail` VALUES (48, 6, '华为 HUAWEI Mate 30E Pro 5G 星河银 8+256g 麒麟990E SoC芯片 双4000万徕卡电影影像 全网通手机', 6, 24, 2, 2);
INSERT INTO `wms_ware_order_task_detail` VALUES (49, 7, 'Apple iPhone XR (A2108)  红色 64g 移动联通电信4G手机 双卡双待', 7, 25, 1, 2);
INSERT INTO `wms_ware_order_task_detail` VALUES (50, 6, '华为 HUAWEI Mate 30E Pro 5G 星河银 8+256g 麒麟990E SoC芯片 双4000万徕卡电影影像 全网通手机', 6, 25, 2, 2);
INSERT INTO `wms_ware_order_task_detail` VALUES (51, 7, 'Apple iPhone XR (A2108)  红色 64g 移动联通电信4G手机 双卡双待', 7, 26, 1, 2);
INSERT INTO `wms_ware_order_task_detail` VALUES (52, 6, '华为 HUAWEI Mate 30E Pro 5G 星河银 8+256g 麒麟990E SoC芯片 双4000万徕卡电影影像 全网通手机', 6, 26, 2, 2);
INSERT INTO `wms_ware_order_task_detail` VALUES (53, 7, 'Apple iPhone XR (A2108)  红色 64g 移动联通电信4G手机 双卡双待', 7, 27, 1, 2);
INSERT INTO `wms_ware_order_task_detail` VALUES (54, 6, '华为 HUAWEI Mate 30E Pro 5G 星河银 8+256g 麒麟990E SoC芯片 双4000万徕卡电影影像 全网通手机', 6, 27, 2, 2);
INSERT INTO `wms_ware_order_task_detail` VALUES (55, 7, 'Apple iPhone XR (A2108)  红色 64g 移动联通电信4G手机 双卡双待', 7, 28, 1, 2);
INSERT INTO `wms_ware_order_task_detail` VALUES (56, 6, '华为 HUAWEI Mate 30E Pro 5G 星河银 8+256g 麒麟990E SoC芯片 双4000万徕卡电影影像 全网通手机', 6, 28, 2, 2);
INSERT INTO `wms_ware_order_task_detail` VALUES (57, 7, 'Apple iPhone XR (A2108)  红色 64g 移动联通电信4G手机 双卡双待', 7, 29, 1, 2);
INSERT INTO `wms_ware_order_task_detail` VALUES (58, 6, '华为 HUAWEI Mate 30E Pro 5G 星河银 8+256g 麒麟990E SoC芯片 双4000万徕卡电影影像 全网通手机', 6, 29, 2, 2);
INSERT INTO `wms_ware_order_task_detail` VALUES (59, 7, 'Apple iPhone XR (A2108)  红色 64g 移动联通电信4G手机 双卡双待', 7, 30, 1, 2);
INSERT INTO `wms_ware_order_task_detail` VALUES (60, 6, '华为 HUAWEI Mate 30E Pro 5G 星河银 8+256g 麒麟990E SoC芯片 双4000万徕卡电影影像 全网通手机', 6, 30, 2, 2);
INSERT INTO `wms_ware_order_task_detail` VALUES (61, 7, 'Apple iPhone XR (A2108)  红色 64g 移动联通电信4G手机 双卡双待', 7, 31, 1, 2);
INSERT INTO `wms_ware_order_task_detail` VALUES (62, 6, '华为 HUAWEI Mate 30E Pro 5G 星河银 8+256g 麒麟990E SoC芯片 双4000万徕卡电影影像 全网通手机', 6, 31, 2, 2);
INSERT INTO `wms_ware_order_task_detail` VALUES (63, 7, 'Apple iPhone XR (A2108)  红色 64g 移动联通电信4G手机 双卡双待', 7, 32, 1, 2);
INSERT INTO `wms_ware_order_task_detail` VALUES (64, 6, '华为 HUAWEI Mate 30E Pro 5G 星河银 8+256g 麒麟990E SoC芯片 双4000万徕卡电影影像 全网通手机', 6, 32, 2, 2);
INSERT INTO `wms_ware_order_task_detail` VALUES (65, 7, 'Apple iPhone XR (A2108)  红色 64g 移动联通电信4G手机 双卡双待', 7, 33, 1, 2);
INSERT INTO `wms_ware_order_task_detail` VALUES (66, 6, '华为 HUAWEI Mate 30E Pro 5G 星河银 8+256g 麒麟990E SoC芯片 双4000万徕卡电影影像 全网通手机', 6, 33, 2, 2);
INSERT INTO `wms_ware_order_task_detail` VALUES (67, 7, 'Apple iPhone XR (A2108)  红色 64g 移动联通电信4G手机 双卡双待', 7, 34, 1, 2);
INSERT INTO `wms_ware_order_task_detail` VALUES (68, 6, '华为 HUAWEI Mate 30E Pro 5G 星河银 8+256g 麒麟990E SoC芯片 双4000万徕卡电影影像 全网通手机', 6, 34, 2, 2);
INSERT INTO `wms_ware_order_task_detail` VALUES (69, 7, 'Apple iPhone XR (A2108)  红色 64g 移动联通电信4G手机 双卡双待', 7, 35, 1, 2);
INSERT INTO `wms_ware_order_task_detail` VALUES (70, 6, '华为 HUAWEI Mate 30E Pro 5G 星河银 8+256g 麒麟990E SoC芯片 双4000万徕卡电影影像 全网通手机', 6, 35, 2, 2);
INSERT INTO `wms_ware_order_task_detail` VALUES (71, 7, 'Apple iPhone XR (A2108)  红色 64g 移动联通电信4G手机 双卡双待', 7, 36, 1, 2);
INSERT INTO `wms_ware_order_task_detail` VALUES (72, 6, '华为 HUAWEI Mate 30E Pro 5G 星河银 8+256g 麒麟990E SoC芯片 双4000万徕卡电影影像 全网通手机', 6, 36, 2, 2);

-- ----------------------------
-- Table structure for wms_ware_sku
-- ----------------------------
DROP TABLE IF EXISTS `wms_ware_sku`;
CREATE TABLE `wms_ware_sku`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `sku_id` bigint(0) NULL DEFAULT NULL COMMENT 'sku_id',
  `ware_id` bigint(0) NULL DEFAULT NULL COMMENT '仓库id',
  `stock` int(0) NULL DEFAULT NULL COMMENT '库存数',
  `sku_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'sku_name',
  `stock_locked` int(0) NULL DEFAULT 0 COMMENT '锁定库存',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sku_id`(`sku_id`) USING BTREE,
  INDEX `ware_id`(`ware_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '商品库存' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wms_ware_sku
-- ----------------------------
INSERT INTO `wms_ware_sku` VALUES (1, 1, 1, 1000, '华为 HUAWEI Mate 30E Pro 5G 翡翠冷 8+128g', 0);
INSERT INTO `wms_ware_sku` VALUES (2, 2, 1, 500, '华为 HUAWEI Mate 30E Pro 5G 翡翠冷 8+256g', 0);
INSERT INTO `wms_ware_sku` VALUES (3, 2, 2, 500, '华为 HUAWEI Mate 30E Pro 5G 翡翠冷 8+256g', 0);
INSERT INTO `wms_ware_sku` VALUES (4, 3, 1, 1000, '华为 HUAWEI Mate 30E Pro 5G 亮黑色 8+128g', 0);
INSERT INTO `wms_ware_sku` VALUES (5, 4, 2, 1000, '华为 HUAWEI Mate 30E Pro 5G 亮黑色 8+256g', 0);
INSERT INTO `wms_ware_sku` VALUES (6, 5, 1, 1000, '华为 HUAWEI Mate 30E Pro 5G 星河银 8+128g', 0);
INSERT INTO `wms_ware_sku` VALUES (7, 6, 2, 1000, '华为 HUAWEI Mate 30E Pro 5G 星河银 8+256g', 0);
INSERT INTO `wms_ware_sku` VALUES (8, 7, 1, 1000, 'Apple iPhone XR (A2108)  红色 64g', 0);
INSERT INTO `wms_ware_sku` VALUES (9, 8, 2, 1000, 'Apple iPhone XR (A2108)  红色 128g', 0);
INSERT INTO `wms_ware_sku` VALUES (10, 9, 1, 1000, 'Apple iPhone XR (A2108)  蓝色 64g', 0);
INSERT INTO `wms_ware_sku` VALUES (11, 10, 2, 1000, 'Apple iPhone XR (A2108)  蓝色 128g', 0);
INSERT INTO `wms_ware_sku` VALUES (12, 11, 1, 1000, 'Apple iPhone XR (A2108)  黑色 64g', 0);
INSERT INTO `wms_ware_sku` VALUES (13, 12, 2, 1000, 'Apple iPhone XR (A2108)  黑色 128g', 0);
INSERT INTO `wms_ware_sku` VALUES (14, 13, 1, 1000, '【向往的生活同款】小米10青春版  白桃乌龙 8g+128g', 0);
INSERT INTO `wms_ware_sku` VALUES (15, 14, 2, 1000, '【向往的生活同款】小米10青春版  白桃乌龙 8g+256g', 0);
INSERT INTO `wms_ware_sku` VALUES (16, 15, 1, 1000, '【向往的生活同款】小米10青春版  蓝莓薄荷 8g+128g', 0);
INSERT INTO `wms_ware_sku` VALUES (17, 16, 2, 1000, '【向往的生活同款】小米10青春版  蓝莓薄荷 8g+256g', 0);
INSERT INTO `wms_ware_sku` VALUES (18, 17, 1, 1000, '【向往的生活同款】小米10青春版  黑巧风暴 8g+128g', 0);
INSERT INTO `wms_ware_sku` VALUES (19, 18, 2, 1000, '【向往的生活同款】小米10青春版  黑巧风暴 8g+256g', 0);
INSERT INTO `wms_ware_sku` VALUES (20, 19, 1, 1000, 'vivo X50 5G手机 液氧 8g+128g', 0);
INSERT INTO `wms_ware_sku` VALUES (21, 20, 2, 1000, 'vivo X50 5G手机 液氧 8g+256g', 0);
INSERT INTO `wms_ware_sku` VALUES (22, 21, 1, 1000, 'vivo X50 5G手机 黑镜 8g+128g', 0);
INSERT INTO `wms_ware_sku` VALUES (23, 22, 2, 1000, 'vivo X50 5G手机 黑镜 8g+256g', 0);
INSERT INTO `wms_ware_sku` VALUES (24, 23, 1, 1000, 'vivo X50 5G手机 浅熏 8g+128g', 0);
INSERT INTO `wms_ware_sku` VALUES (25, 24, 2, 1000, 'vivo X50 5G手机 浅熏 8g+256g', 0);
INSERT INTO `wms_ware_sku` VALUES (26, 25, 1, 1000, 'OPPO K7 双模5G 骁龙765G 流云 8+128g', 0);
INSERT INTO `wms_ware_sku` VALUES (27, 26, 2, 1000, 'OPPO K7 双模5G 骁龙765G 流云 8+256g', 0);
INSERT INTO `wms_ware_sku` VALUES (28, 27, 1, 1000, 'OPPO K7 双模5G 骁龙765G 秘境 8+128g', 0);
INSERT INTO `wms_ware_sku` VALUES (29, 28, 2, 1000, 'OPPO K7 双模5G 骁龙765G 秘境 8+256g', 0);
INSERT INTO `wms_ware_sku` VALUES (30, 29, 1, 1000, 'OPPO K7 双模5G 骁龙765G 海夜 8+128g', 0);
INSERT INTO `wms_ware_sku` VALUES (31, 30, 2, 1000, 'OPPO K7 双模5G 骁龙765G 海夜 8+256g', 0);

SET FOREIGN_KEY_CHECKS = 1;
