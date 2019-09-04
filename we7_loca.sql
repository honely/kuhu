/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50553
 Source Host           : localhost:3306
 Source Schema         : we7_loca

 Target Server Type    : MySQL
 Target Server Version : 50553
 File Encoding         : 65001

 Date: 02/07/2019 15:05:40
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for deam_deamx_food_coupon_activity
-- ----------------------------
DROP TABLE IF EXISTS `deam_deamx_food_coupon_activity`;
CREATE TABLE `deam_deamx_food_coupon_activity`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `coupon_uniacid` int(11) NOT NULL,
  `activity_id` int(11) NOT NULL,
  `card_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `activity_bg_color` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `begin_time` int(11) NOT NULL,
  `end_time` int(11) NOT NULL,
  `gift_num` int(11) NOT NULL,
  `max_partic_times_act` int(11) NOT NULL,
  `max_partic_times_one_day` int(11) NOT NULL,
  `min_amt` int(11) NOT NULL,
  `to_user` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `createtime` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fa_jz_images
-- ----------------------------
DROP TABLE IF EXISTS `fa_jz_images`;
CREATE TABLE `fa_jz_images`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NULL DEFAULT NULL COMMENT '商品id',
  `images` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '图片表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fa_jz_prize_order
-- ----------------------------
DROP TABLE IF EXISTS `fa_jz_prize_order`;
CREATE TABLE `fa_jz_prize_order`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '奖品订单id',
  `jz_user_id` int(11) NULL DEFAULT NULL COMMENT '用户的id',
  `prize_type` enum('0','1','2') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '2' COMMENT '状态:0=未核销,1=已核销,2=全部',
  `prize_time` int(11) NULL DEFAULT NULL COMMENT '中奖的时间',
  `code` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '核销码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '奖品订单' ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for ims_account
-- ----------------------------
DROP TABLE IF EXISTS `ims_account`;
CREATE TABLE `ims_account`  (
  `acid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `hash` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` tinyint(3) UNSIGNED NOT NULL,
  `isconnect` tinyint(4) NOT NULL,
  `isdeleted` tinyint(3) UNSIGNED NOT NULL,
  `endtime` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`acid`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ims_account
-- ----------------------------
INSERT INTO `ims_account` VALUES (6, 8, 'BI8H8aK7', 1, 1, 0, 0);

-- ----------------------------
-- Table structure for ims_account_aliapp
-- ----------------------------
DROP TABLE IF EXISTS `ims_account_aliapp`;
CREATE TABLE `ims_account_aliapp`  (
  `acid` int(10) NOT NULL,
  `uniacid` int(10) NOT NULL,
  `level` tinyint(4) UNSIGNED NOT NULL,
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `key` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`acid`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_account_phoneapp
-- ----------------------------
DROP TABLE IF EXISTS `ims_account_phoneapp`;
CREATE TABLE `ims_account_phoneapp`  (
  `acid` int(11) NOT NULL,
  `uniacid` int(11) NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`acid`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_account_webapp
-- ----------------------------
DROP TABLE IF EXISTS `ims_account_webapp`;
CREATE TABLE `ims_account_webapp`  (
  `acid` int(11) NOT NULL,
  `uniacid` int(11) NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`acid`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_account_wechats
-- ----------------------------
DROP TABLE IF EXISTS `ims_account_wechats`;
CREATE TABLE `ims_account_wechats`  (
  `acid` int(10) UNSIGNED NOT NULL,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `token` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `encodingaeskey` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `level` tinyint(4) UNSIGNED NOT NULL,
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `account` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `original` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `signature` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `country` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `province` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `city` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `username` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `lastupdate` int(10) UNSIGNED NOT NULL,
  `key` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `secret` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `styleid` int(10) UNSIGNED NOT NULL,
  `subscribeurl` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `auth_refresh_token` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`acid`) USING BTREE,
  INDEX `idx_key`(`key`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ims_account_wechats
-- ----------------------------
INSERT INTO `ims_account_wechats` VALUES (6, 8, 'aE8kkXXfkevXvbQHq8dnXqkEhVvfe3xm', 'D0ooKO1nKu0oItWFPtARfouK0RR0teikeko11IwRkQR', 2, '测试公众号', 'weibin755', 'gh_1bbd71088661', '', '', '', '', '', '', 0, 'wxd55d257d9eaa0dbf', 'fb05457a108fc22802a8a1580d5173dc', 0, '', '');

-- ----------------------------
-- Table structure for ims_account_wxapp
-- ----------------------------
DROP TABLE IF EXISTS `ims_account_wxapp`;
CREATE TABLE `ims_account_wxapp`  (
  `acid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) NOT NULL,
  `token` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `encodingaeskey` varchar(43) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `level` tinyint(4) NOT NULL,
  `account` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `original` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `key` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `secret` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `appdomain` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`acid`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_account_xzapp
-- ----------------------------
DROP TABLE IF EXISTS `ims_account_xzapp`;
CREATE TABLE `ims_account_xzapp`  (
  `acid` int(11) NOT NULL,
  `uniacid` int(11) NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `original` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `lastupdate` int(10) NOT NULL,
  `styleid` int(10) NOT NULL,
  `createtime` int(10) NOT NULL,
  `token` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `encodingaeskey` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `xzapp_id` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `level` tinyint(4) UNSIGNED NOT NULL,
  `key` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `secret` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`acid`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_ants_jizanbao_activitys
-- ----------------------------
DROP TABLE IF EXISTS `ims_ants_jizanbao_activitys`;
CREATE TABLE `ims_ants_jizanbao_activitys`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL COMMENT '公众号id',
  `state` int(11) NOT NULL COMMENT '活动开关',
  `packet` int(2) NOT NULL COMMENT '红包开关',
  `register` int(2) NOT NULL COMMENT '获取用户信息',
  `business` int(2) NOT NULL COMMENT '商户开关',
  `date_start` varchar(125) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '活动开始时间',
  `date_end` varchar(125) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '活动结束时间',
  `activity_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '活动标题',
  `activity_rule` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '活动规则',
  `follow` int(2) NOT NULL COMMENT '是否关注',
  `follow_qrcode` varchar(125) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '关注二维码',
  `background_color` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '背景颜色',
  `theme_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主题图片',
  `pageviews` int(11) NOT NULL COMMENT '浏览量',
  `activity_tel` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '活动电话',
  `verification` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '核销员',
  `domain` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主域名',
  `domain1` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '防封域名一',
  `domain2` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '防封域名二',
  `infinite` int(2) NOT NULL COMMENT '活动限制',
  `share_des` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分享描述',
  `share_title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分享标题',
  `business_id` int(11) NULL DEFAULT NULL COMMENT '商家关联id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '//配置表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ims_ants_jizanbao_activitys
-- ----------------------------
INSERT INTO `ims_ants_jizanbao_activitys` VALUES (21, 0, 0, 0, 0, 0, '2019-06-06 10:08', '2019-07-15 10:08', '活动名称1000', '&lt;p&gt;这个是活动的规则说明这个是活动的规则说明这个是活动的规则说明这个是活动的规则说明这个是活动的规则说明这个是活动的规则说明这个是活动的规则说明&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;这个是活动的规则说明这个是活动的规则说明这个是活动的规则说明这个是活动的规则说明&lt;/p&gt;&lt;p&gt;这个是活动的规则说明这个是活动的规则说明这个是活动的规则说明这个是活动的规则说明&lt;/p&gt;&lt;p&gt;这个是活动的规则说明这个是活动的规则说明这个是活动的规则说明这个是活动的规则说明&lt;/p&gt;&lt;p&gt;这个是活动的规则说明这个是活动的规则说明这个是活动的规则说明这个是活动的规则说明&lt;/p&gt;&lt;p&gt;这个是活动的规则说明这个是活动的规则说明这个是活动的规则说明这个是活动的规则说明&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;这个是活动的规则说明这个是活动的规则说明这个是活动的规则说明这个是活动的规则说明&lt;/p&gt;', 0, 'images/8/2019/06/GR1A9Zpx6299z661DIIC412a4xzZE1.png', '#ff00ff', '/images/8/2019/06/O9k7Kg7iSs9kX9G9X7V7gY92gknkk4.jpg', 5000, '1366633020', 'openid001', 'abc.com', 'abc1.com', 'abc2.com', 0, '分享描述1000分享描述1000分享描述1000分享描述1000分享描述1000分享描述1000分享描述1000分享描述1000分享描述1000分享描述1000分享描述1000分享描述1000分享描述1000分享描述1000分享描述1000分享描述1000分享描述1000分享描述1000分享描述10', '分享标题1000', NULL);
INSERT INTO `ims_ants_jizanbao_activitys` VALUES (22, 0, 0, 0, 0, 0, '2019-06-06 15:54', '2019-06-06 15:54', '活动名称8888888', '&lt;p&gt;88888888888888&lt;/p&gt;', 0, 'images/8/2019/06/O9k7Kg7iSs9kX9G9X7V7gY92gknkk4.jpg', '#fce5cd', '', 0, '', '585858', 'antwx.cn', 'abc1.com', 'adddd.com', 0, '8888888888888888888分享描述', '分享标题', NULL);
INSERT INTO `ims_ants_jizanbao_activitys` VALUES (23, 0, 0, 0, 0, 0, '2019-06-06 15:56', '2019-06-06 15:56', '785785', '', 0, '', '', '', 0, '', '86876openid', 'abc.com', 'abc1.com', 'abc2.com', 0, '78585', '分享标题', NULL);
INSERT INTO `ims_ants_jizanbao_activitys` VALUES (24, 0, 0, 0, 0, 0, '2019-06-06 15:56', '2019-06-06 15:56', '785785', '', 0, '', '', '', 0, '', '86876openid', 'abc.com', 'abc1.com', 'abc2.com', 0, '78585', '分享标题', NULL);
INSERT INTO `ims_ants_jizanbao_activitys` VALUES (25, 0, 0, 0, 0, 0, '2019-06-06 16:06', '2019-06-06 16:06', '5278', '&lt;p&gt;5725&lt;/p&gt;', 0, '', '', '', 0, '', '86876openid', 'antwx.cn', 'abc1.com', '', 0, '7252', '分享标题', NULL);
INSERT INTO `ims_ants_jizanbao_activitys` VALUES (26, 0, 0, 0, 0, 0, '2019-06-06 16:06', '2019-06-06 16:06', '5278', '&lt;p&gt;57258558&lt;/p&gt;', 0, '', '', '', 0, '5285855285', '86876openid', 'antwx.cn', 'abc1.com', '', 0, '7252', '分享标题', NULL);
INSERT INTO `ims_ants_jizanbao_activitys` VALUES (27, 0, 0, 0, 0, 0, '2019-06-06 17:12', '2019-06-06 17:12', '活动9', '&lt;p&gt;规则说明规则说明规则说明规则说明规则说明&lt;/p&gt;', 0, 'images/8/2019/06/EvgPjvPP2m4PNV4k4VM2jMIGImcc2k.jpg', '#ff0000', 'images/8/2019/06/O9k7Kg7iSs9kX9G9X7V7gY92gknkk4.jpg', 0, '', '55858openid', 'antwx.cn', 'aa.com', 'adddd.com', 0, '分享描述分享描述分享描述分享描述分享描述', '分享标题', 16);
INSERT INTO `ims_ants_jizanbao_activitys` VALUES (28, 0, 0, 0, 0, 0, '2019-06-06 17:12', '2019-06-06 17:12', '活动9', '&lt;p&gt;规则说明规则说明规则说明规则说明规则说明&lt;/p&gt;', 0, 'images/8/2019/06/EvgPjvPP2m4PNV4k4VM2jMIGImcc2k.jpg', '#ff0000', 'images/8/2019/06/O9k7Kg7iSs9kX9G9X7V7gY92gknkk4.jpg', 0, '', '55858openid', 'antwx.cn', 'aa.com', 'adddd.com', 0, '分享描述分享描述分享描述分享描述分享描述', '分享标题', 0);
INSERT INTO `ims_ants_jizanbao_activitys` VALUES (29, 0, 0, 0, 0, 0, '2019-06-06 17:30', '2019-06-06 17:30', '85252', '', 0, '', '525', '52525', 0, '', '525', 'antwx.cn', 'c.com', 'd.com', 0, '25252525', '58585', 18);
INSERT INTO `ims_ants_jizanbao_activitys` VALUES (30, 0, 1, 0, 0, 0, '2019-06-06 17:45', '2019-06-06 17:45', '活动名称dsgerg', '&lt;p&gt;fdhbdbdsghsdf&lt;/p&gt;', 0, '', '#ff0000', '', 0, '', 'dsfgszdfg', 'antwx.cn', 'abc1.com', 'adddd.com', 1, 'dfshsdfhbdfssfdgsdfg', '8585', 19);

-- ----------------------------
-- Table structure for ims_ants_jizanbao_business
-- ----------------------------
DROP TABLE IF EXISTS `ims_ants_jizanbao_business`;
CREATE TABLE `ims_ants_jizanbao_business`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL COMMENT '公众号id',
  `business_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商户地址',
  `business_info` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商户介绍',
  `business_name` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商户名称',
  `business_tel` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商户电话',
  `business_longitude` float(9, 6) NOT NULL COMMENT '商户经度',
  `business_latitude` float(9, 6) NOT NULL COMMENT '商户维度',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '//商户信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ims_ants_jizanbao_business
-- ----------------------------
INSERT INTO `ims_ants_jizanbao_business` VALUES (1, 0, '我在北大街', '我是信息', '商家的名称', '1322520000', 123.220024, 125.321114);
INSERT INTO `ims_ants_jizanbao_business` VALUES (2, 0, '我在北大街', '我是信息', '商家的名称', '1322520000', 123.220024, 125.321114);
INSERT INTO `ims_ants_jizanbao_business` VALUES (3, 0, '我在北大街', '我是信息', '商家的名称', '1322520000', 123.220024, 125.321114);
INSERT INTO `ims_ants_jizanbao_business` VALUES (4, 0, '我在北大街', '我是信息', '商家的名称', '1322520000', 123.220024, 125.321114);
INSERT INTO `ims_ants_jizanbao_business` VALUES (5, 0, '我在北大街', '我是信息', '商家的名称', '1322520000', 123.220024, 125.321114);
INSERT INTO `ims_ants_jizanbao_business` VALUES (6, 0, '我在北大街', '我是信息', '商家的名称', '1322520000', 123.220024, 125.321114);
INSERT INTO `ims_ants_jizanbao_business` VALUES (7, 0, '商家地址', '&lt;p&gt;722测试&lt;/p&gt;', '商家名称11', '5285855285', 116.180206, 39.915176);
INSERT INTO `ims_ants_jizanbao_business` VALUES (8, 0, '商家地址9', '&lt;p&gt;商家介绍&lt;/p&gt;', '商家名称9', '999999', 116.403854, 39.915176);
INSERT INTO `ims_ants_jizanbao_business` VALUES (9, 0, '商家地址9', '&lt;p&gt;商家介绍&lt;/p&gt;', '商家名称9', '999999', 116.403854, 39.915176);
INSERT INTO `ims_ants_jizanbao_business` VALUES (10, 0, '商家地址9', '&lt;p&gt;商家介绍&lt;/p&gt;', '商家名称9', '999999', 116.403854, 39.915176);
INSERT INTO `ims_ants_jizanbao_business` VALUES (11, 0, '商家地址9', '&lt;p&gt;商家介绍&lt;/p&gt;', '商家名称9', '999999', 116.403854, 39.915176);
INSERT INTO `ims_ants_jizanbao_business` VALUES (12, 0, '商家地址9', '&lt;p&gt;商家介绍&lt;/p&gt;', '商家名称9', '999999', 116.403854, 39.915176);
INSERT INTO `ims_ants_jizanbao_business` VALUES (13, 0, '商家地址9', '&lt;p&gt;商家介绍&lt;/p&gt;', '商家名称9', '999999', 116.403854, 39.915176);
INSERT INTO `ims_ants_jizanbao_business` VALUES (14, 0, '商家地址9', '&lt;p&gt;商家介绍&lt;/p&gt;', '商家名称9', '999999', 116.403854, 39.915176);
INSERT INTO `ims_ants_jizanbao_business` VALUES (15, 0, '商家地址9', '&lt;p&gt;商家介绍&lt;/p&gt;', '商家名称9', '999999', 116.403854, 39.915176);
INSERT INTO `ims_ants_jizanbao_business` VALUES (17, 0, '商家地址9', '&lt;p&gt;商家介绍&lt;/p&gt;', '商家名称9', '999999', 116.403854, 39.915176);
INSERT INTO `ims_ants_jizanbao_business` VALUES (18, 0, '商家地址', '&lt;p&gt;85585858&lt;/p&gt;', '商家名称11', '2520202', 116.403854, 39.915176);
INSERT INTO `ims_ants_jizanbao_business` VALUES (19, 0, 'dz', '&lt;p&gt;dfsgffffffffffffffffffffffffffff&lt;/p&gt;', 'mc', '123566855', 116.403854, 39.915176);

-- ----------------------------
-- Table structure for ims_ants_jizanbao_orders
-- ----------------------------
DROP TABLE IF EXISTS `ims_ants_jizanbao_orders`;
CREATE TABLE `ims_ants_jizanbao_orders`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL COMMENT '公众号id',
  `nuid` int(11) NOT NULL COMMENT '活动id',
  `uid` int(11) NOT NULL COMMENT '粉丝ID',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名称',
  `nickname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '粉丝名称',
  `prize_name` varchar(125) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '核销奖品名称',
  `portrait` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '核销头像',
  `offline_code` int(11) NOT NULL COMMENT '核销码',
  `exchange_time` int(11) NOT NULL COMMENT '兑换时间',
  `verification_time` int(11) NOT NULL COMMENT '核销时间',
  `state` smallint(1) NULL DEFAULT 0 COMMENT '状态：0=未核销，1=已核销',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 43 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '//核销表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ims_ants_jizanbao_orders
-- ----------------------------
INSERT INTO `ims_ants_jizanbao_orders` VALUES (29, 525, 888, 85555, '航三11', '昵称555', '奖品名称1', 'abc.com', 5858, 1560338124, 555, 0);
INSERT INTO `ims_ants_jizanbao_orders` VALUES (30, 525, 888, 85555, '航三22', '昵称555', '奖品名称2', 'abc.com', 5858, 1560338124, 555, 1);
INSERT INTO `ims_ants_jizanbao_orders` VALUES (31, 525, 888, 85555, '航三33', '昵称555', '奖品名称3', 'abc.com', 5858, 1560338124, 555, 0);
INSERT INTO `ims_ants_jizanbao_orders` VALUES (32, 525, 888, 85555, '航三44', '昵称555', '奖品名称4', 'abc.com', 5858, 1560338124, 555, 0);
INSERT INTO `ims_ants_jizanbao_orders` VALUES (33, 525, 888, 85555, '航三55', '昵称555', '奖品名称5', 'abc.com', 5858, 1560338124, 555, 0);
INSERT INTO `ims_ants_jizanbao_orders` VALUES (34, 525, 888, 85555, '航三66', '昵称555', '奖品名称6', 'abc.com', 5858, 1560338124, 555, 0);
INSERT INTO `ims_ants_jizanbao_orders` VALUES (35, 525, 888, 85555, '航三77', '昵称555', '奖品名称7', 'abc.com', 5858, 1560338124, 555, 0);
INSERT INTO `ims_ants_jizanbao_orders` VALUES (36, 525, 888, 85555, '航三88', '昵称555', '奖品名称8', 'abc.com', 5858, 1560338124, 555, 0);
INSERT INTO `ims_ants_jizanbao_orders` VALUES (37, 525, 888, 85555, '航三99', '昵称555', '奖品名称9', 'abc.com', 5858, 1560338124, 555, 1);
INSERT INTO `ims_ants_jizanbao_orders` VALUES (38, 525, 888, 85555, '航三10', '昵称555', '奖品名称10', 'abc.com', 5858, 1560338124, 555, 1);
INSERT INTO `ims_ants_jizanbao_orders` VALUES (39, 525, 888, 85555, '航三11', '昵称555', '奖品名称11', 'abc.com', 5858, 1560338124, 555, 1);
INSERT INTO `ims_ants_jizanbao_orders` VALUES (40, 525, 888, 85555, '航三12', '昵称555', '奖品名称12', 'abc.com', 5858, 1560338124, 555, 1);
INSERT INTO `ims_ants_jizanbao_orders` VALUES (41, 525, 888, 85555, '航三13', '昵称555', '奖品名称13', 'abc.com', 5858, 1560338124, 555, 1);
INSERT INTO `ims_ants_jizanbao_orders` VALUES (42, 525, 888, 85555, '航三14', '昵称555', '奖品名称14', 'abc.com', 5858, 1560338124, 555, 1);

-- ----------------------------
-- Table structure for ims_ants_jizanbao_prizes
-- ----------------------------
DROP TABLE IF EXISTS `ims_ants_jizanbao_prizes`;
CREATE TABLE `ims_ants_jizanbao_prizes`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nuid` int(11) NOT NULL COMMENT '活动id',
  `uniacid` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '公众号id',
  `prize_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '奖品名称',
  `prize_img` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '奖品图片',
  `exchange_zan` int(11) NOT NULL COMMENT '所需集赞数',
  `prize_quantity` int(11) NOT NULL COMMENT '奖品数量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '//奖品表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ims_ants_jizanbao_prizes
-- ----------------------------
INSERT INTO `ims_ants_jizanbao_prizes` VALUES (6, 21, 'gongzhong_id', '奖品名称1', '/images/8/2019/06/ZgSQaoltgW2PolM3ZGT4SYKQ32YDPg.jpg', 2147483647, 99999100);
INSERT INTO `ims_ants_jizanbao_prizes` VALUES (7, 21, '', '奖品名称2', '/images/8/2019/06/ZgSQaoltgW2PolM3ZGT4SYKQ32YDPg.jpg', 15200, 66666);
INSERT INTO `ims_ants_jizanbao_prizes` VALUES (8, 21, 'gongzhong_id', '奖品名称3', '/images/8/2019/06/ZgSQaoltgW2PolM3ZGT4SYKQ32YDPg.jpg', 1200, 100);
INSERT INTO `ims_ants_jizanbao_prizes` VALUES (9, 21, '', '奖品名称4', '/images/8/2019/06/ZgSQaoltgW2PolM3ZGT4SYKQ32YDPg.jpg', 15200, 66666);
INSERT INTO `ims_ants_jizanbao_prizes` VALUES (10, 21, 'gongzhong_id', '奖品名称5', '/images/8/2019/06/ZgSQaoltgW2PolM3ZGT4SYKQ32YDPg.jpg', 100, 100);
INSERT INTO `ims_ants_jizanbao_prizes` VALUES (11, 21, '', '奖品名称6', '/images/8/2019/06/ZgSQaoltgW2PolM3ZGT4SYKQ32YDPg.jpg', 15200, 66666);
INSERT INTO `ims_ants_jizanbao_prizes` VALUES (12, 0, 'gongzhong_id', '奖品名称7', '/images/8/2019/06/ZgSQaoltgW2PolM3ZGT4SYKQ32YDPg.jpg', 2147483647, 2147483647);
INSERT INTO `ims_ants_jizanbao_prizes` VALUES (13, 0, '', '奖品名称8', '/images/8/2019/06/ZgSQaoltgW2PolM3ZGT4SYKQ32YDPg.jpg', 15200, 66666);
INSERT INTO `ims_ants_jizanbao_prizes` VALUES (14, 0, 'gongzhong_id', '奖品名称9', '/images/8/2019/06/ZgSQaoltgW2PolM3ZGT4SYKQ32YDPg.jpg', 2147483647, 2147483647);
INSERT INTO `ims_ants_jizanbao_prizes` VALUES (15, 0, '', '奖品名称10', '/images/8/2019/06/ZgSQaoltgW2PolM3ZGT4SYKQ32YDPg.jpg', 15200, 66666);
INSERT INTO `ims_ants_jizanbao_prizes` VALUES (16, 0, 'gongzhong_id', '奖品名称11', '/images/8/2019/06/ZgSQaoltgW2PolM3ZGT4SYKQ32YDPg.jpg', 2147483647, 2147483647);
INSERT INTO `ims_ants_jizanbao_prizes` VALUES (17, 0, '', '奖品名称12', '/images/8/2019/06/ZgSQaoltgW2PolM3ZGT4SYKQ32YDPg.jpg', 15200, 66666);
INSERT INTO `ims_ants_jizanbao_prizes` VALUES (18, 0, 'gongzhong_id', '奖品名称13', '/images/8/2019/06/ZgSQaoltgW2PolM3ZGT4SYKQ32YDPg.jpg', 2147483647, 2147483647);
INSERT INTO `ims_ants_jizanbao_prizes` VALUES (19, 0, '', '奖品名称14', '/images/8/2019/06/ZgSQaoltgW2PolM3ZGT4SYKQ32YDPg.jpg', 15200, 66666);

-- ----------------------------
-- Table structure for ims_ants_jizanbao_record
-- ----------------------------
DROP TABLE IF EXISTS `ims_ants_jizanbao_record`;
CREATE TABLE `ims_ants_jizanbao_record`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `random_key` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '随机key',
  `openid` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'openid',
  `time` int(11) NULL DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 83 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '临时记录表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ims_ants_jizanbao_record
-- ----------------------------
INSERT INTO `ims_ants_jizanbao_record` VALUES (1, '', 'oqo_mw5J50OoH3PUyRgParlPubas', 1561449208);
INSERT INTO `ims_ants_jizanbao_record` VALUES (2, '', 'oqo_mw5J50OoH3PUyRgParlPubas', 1561449227);
INSERT INTO `ims_ants_jizanbao_record` VALUES (3, '', 'oqo_mw5J50OoH3PUyRgParlPubas', 1561449254);
INSERT INTO `ims_ants_jizanbao_record` VALUES (4, '', 'oqo_mw5J50OoH3PUyRgParlPubas', 1561449266);
INSERT INTO `ims_ants_jizanbao_record` VALUES (5, '', 'oqo_mw5J50OoH3PUyRgParlPubas', 1561449336);
INSERT INTO `ims_ants_jizanbao_record` VALUES (6, '', 'oqo_mw5J50OoH3PUyRgParlPubas', 1561449408);
INSERT INTO `ims_ants_jizanbao_record` VALUES (7, '', 'oqo_mw5J50OoH3PUyRgParlPubas', 1561449505);
INSERT INTO `ims_ants_jizanbao_record` VALUES (8, '', 'oqo_mw5J50OoH3PUyRgParlPubas', 1561449540);
INSERT INTO `ims_ants_jizanbao_record` VALUES (9, '', 'oqo_mw5J50OoH3PUyRgParlPubas', 1561449547);
INSERT INTO `ims_ants_jizanbao_record` VALUES (10, '', 'oqo_mw5J50OoH3PUyRgParlPubas', 1561449561);
INSERT INTO `ims_ants_jizanbao_record` VALUES (11, '', 'oqo_mw5J50OoH3PUyRgParlPubas', 1561449669);
INSERT INTO `ims_ants_jizanbao_record` VALUES (12, '', 'oqo_mw5J50OoH3PUyRgParlPubas', 1561449692);
INSERT INTO `ims_ants_jizanbao_record` VALUES (13, '', 'oqo_mw5J50OoH3PUyRgParlPubas', 1561449887);
INSERT INTO `ims_ants_jizanbao_record` VALUES (14, '', 'oqo_mw5J50OoH3PUyRgParlPubas', 1561449902);
INSERT INTO `ims_ants_jizanbao_record` VALUES (15, '', 'oqo_mw5J50OoH3PUyRgParlPubas', 1561450095);
INSERT INTO `ims_ants_jizanbao_record` VALUES (16, '', 'oqo_mw5J50OoH3PUyRgParlPubas', 1561450147);
INSERT INTO `ims_ants_jizanbao_record` VALUES (17, '', 'oqo_mw500M6iLFYCCIuHU_THtpfA', 1561450358);
INSERT INTO `ims_ants_jizanbao_record` VALUES (18, '', 'oqo_mw500M6iLFYCCIuHU_THtpfA', 1561450372);
INSERT INTO `ims_ants_jizanbao_record` VALUES (19, '', 'oqo_mw500M6iLFYCCIuHU_THtpfA', 1561450382);
INSERT INTO `ims_ants_jizanbao_record` VALUES (20, '', 'oqo_mw500M6iLFYCCIuHU_THtpfA', 1561450401);
INSERT INTO `ims_ants_jizanbao_record` VALUES (21, '', 'oqo_mw500M6iLFYCCIuHU_THtpfA', 1561450427);
INSERT INTO `ims_ants_jizanbao_record` VALUES (22, '', 'oqo_mw500M6iLFYCCIuHU_THtpfA', 1561450455);
INSERT INTO `ims_ants_jizanbao_record` VALUES (23, '', 'oqo_mw500M6iLFYCCIuHU_THtpfA', 1561450483);
INSERT INTO `ims_ants_jizanbao_record` VALUES (24, '', 'oqo_mw500M6iLFYCCIuHU_THtpfA', 1561450548);
INSERT INTO `ims_ants_jizanbao_record` VALUES (25, '', 'oqo_mw5J50OoH3PUyRgParlPubas', 1561451029);
INSERT INTO `ims_ants_jizanbao_record` VALUES (26, '', 'oqo_mw5J50OoH3PUyRgParlPubas', 1561451449);
INSERT INTO `ims_ants_jizanbao_record` VALUES (27, '', 'oqo_mw5J50OoH3PUyRgParlPubas', 1561451503);
INSERT INTO `ims_ants_jizanbao_record` VALUES (28, '', 'oqo_mw5J50OoH3PUyRgParlPubas', 1561451766);
INSERT INTO `ims_ants_jizanbao_record` VALUES (29, '', 'oqo_mw5J50OoH3PUyRgParlPubas', 1561451783);
INSERT INTO `ims_ants_jizanbao_record` VALUES (30, '', 'oqo_mw5J50OoH3PUyRgParlPubas', 1561451790);
INSERT INTO `ims_ants_jizanbao_record` VALUES (31, '', 'oqo_mw5J50OoH3PUyRgParlPubas', 1561451833);
INSERT INTO `ims_ants_jizanbao_record` VALUES (32, '', 'oqo_mw5J50OoH3PUyRgParlPubas', 1561451845);
INSERT INTO `ims_ants_jizanbao_record` VALUES (33, '', 'oqo_mw5J50OoH3PUyRgParlPubas', 1561451915);
INSERT INTO `ims_ants_jizanbao_record` VALUES (34, '', 'oqo_mw5J50OoH3PUyRgParlPubas', 1561453361);
INSERT INTO `ims_ants_jizanbao_record` VALUES (35, '', 'oqo_mw5J50OoH3PUyRgParlPubas', 1561453493);
INSERT INTO `ims_ants_jizanbao_record` VALUES (36, '', 'oqo_mw5J50OoH3PUyRgParlPubas', 1561453496);
INSERT INTO `ims_ants_jizanbao_record` VALUES (37, '', 'oqo_mw5J50OoH3PUyRgParlPubas', 1561453497);
INSERT INTO `ims_ants_jizanbao_record` VALUES (38, '', 'oqo_mw5J50OoH3PUyRgParlPubas', 1561456266);
INSERT INTO `ims_ants_jizanbao_record` VALUES (39, '', 'oqo_mw5J50OoH3PUyRgParlPubas', 1561456275);
INSERT INTO `ims_ants_jizanbao_record` VALUES (40, '', 'oqo_mw5J50OoH3PUyRgParlPubas', 1561538133);
INSERT INTO `ims_ants_jizanbao_record` VALUES (41, '', 'oqo_mw5J50OoH3PUyRgParlPubas', 1561539109);
INSERT INTO `ims_ants_jizanbao_record` VALUES (42, '', 'oqo_mw5J50OoH3PUyRgParlPubas', 1561540020);
INSERT INTO `ims_ants_jizanbao_record` VALUES (43, '', 'oqo_mw5J50OoH3PUyRgParlPubas', 1561540147);
INSERT INTO `ims_ants_jizanbao_record` VALUES (44, '', '', 1561541116);
INSERT INTO `ims_ants_jizanbao_record` VALUES (45, '', 'oqo_mw5J50OoH3PUyRgParlPubas', 1561541285);
INSERT INTO `ims_ants_jizanbao_record` VALUES (46, '', '', 1561541370);
INSERT INTO `ims_ants_jizanbao_record` VALUES (47, '', 'oqo_mw5J50OoH3PUyRgParlPubas', 1561604026);
INSERT INTO `ims_ants_jizanbao_record` VALUES (48, '', 'oqo_mw5J50OoH3PUyRgParlPubas', 1561604061);
INSERT INTO `ims_ants_jizanbao_record` VALUES (49, '', 'oqo_mw5J50OoH3PUyRgParlPubas', 1561604138);
INSERT INTO `ims_ants_jizanbao_record` VALUES (50, '', 'oqo_mw5J50OoH3PUyRgParlPubas', 1561604585);
INSERT INTO `ims_ants_jizanbao_record` VALUES (51, '', 'oqo_mw5J50OoH3PUyRgParlPubas', 1561604611);
INSERT INTO `ims_ants_jizanbao_record` VALUES (52, '', 'oqo_mw5J50OoH3PUyRgParlPubas', 1561604634);
INSERT INTO `ims_ants_jizanbao_record` VALUES (53, '', 'oqo_mw5J50OoH3PUyRgParlPubas', 1561604636);
INSERT INTO `ims_ants_jizanbao_record` VALUES (54, '', 'oqo_mw5J50OoH3PUyRgParlPubas', 1561604637);
INSERT INTO `ims_ants_jizanbao_record` VALUES (55, '', 'oqo_mw5J50OoH3PUyRgParlPubas', 1561604637);
INSERT INTO `ims_ants_jizanbao_record` VALUES (56, '', 'oqo_mw5J50OoH3PUyRgParlPubas', 1561604638);
INSERT INTO `ims_ants_jizanbao_record` VALUES (57, '', 'oqo_mw5J50OoH3PUyRgParlPubas', 1561604638);
INSERT INTO `ims_ants_jizanbao_record` VALUES (58, '', 'oqo_mw5J50OoH3PUyRgParlPubas', 1561604638);
INSERT INTO `ims_ants_jizanbao_record` VALUES (59, '', 'oqo_mw5J50OoH3PUyRgParlPubas', 1561604638);
INSERT INTO `ims_ants_jizanbao_record` VALUES (60, '', 'oqo_mw5J50OoH3PUyRgParlPubas', 1561604639);
INSERT INTO `ims_ants_jizanbao_record` VALUES (61, '', 'oqo_mw5J50OoH3PUyRgParlPubas', 1561604639);
INSERT INTO `ims_ants_jizanbao_record` VALUES (62, '', 'oqo_mw5J50OoH3PUyRgParlPubas', 1561604662);
INSERT INTO `ims_ants_jizanbao_record` VALUES (63, '', 'oqo_mw5J50OoH3PUyRgParlPubas', 1561605488);
INSERT INTO `ims_ants_jizanbao_record` VALUES (64, '', 'oqo_mw5J50OoH3PUyRgParlPubas', 1561605524);
INSERT INTO `ims_ants_jizanbao_record` VALUES (65, '', 'oqo_mw5J50OoH3PUyRgParlPubas', 1561605529);
INSERT INTO `ims_ants_jizanbao_record` VALUES (66, '', 'oqo_mw5J50OoH3PUyRgParlPubas', 1561605530);
INSERT INTO `ims_ants_jizanbao_record` VALUES (67, '', 'oqo_mw5J50OoH3PUyRgParlPubas', 1561605530);
INSERT INTO `ims_ants_jizanbao_record` VALUES (68, '', 'oqo_mw5J50OoH3PUyRgParlPubas', 1561605531);
INSERT INTO `ims_ants_jizanbao_record` VALUES (69, '', 'oqo_mw5J50OoH3PUyRgParlPubas', 1561605532);
INSERT INTO `ims_ants_jizanbao_record` VALUES (70, '', 'oqo_mw5J50OoH3PUyRgParlPubas', 1561605570);
INSERT INTO `ims_ants_jizanbao_record` VALUES (71, '', 'oqo_mw5J50OoH3PUyRgParlPubas', 1561605592);
INSERT INTO `ims_ants_jizanbao_record` VALUES (72, '', 'oqo_mw5J50OoH3PUyRgParlPubas', 1561605638);
INSERT INTO `ims_ants_jizanbao_record` VALUES (73, '', 'oqo_mw5J50OoH3PUyRgParlPubas', 1561605773);
INSERT INTO `ims_ants_jizanbao_record` VALUES (74, '', 'oqo_mw5J50OoH3PUyRgParlPubas', 1561606205);
INSERT INTO `ims_ants_jizanbao_record` VALUES (75, '', 'oqo_mw5J50OoH3PUyRgParlPubas', 1561606362);
INSERT INTO `ims_ants_jizanbao_record` VALUES (76, '', 'oqo_mw5J50OoH3PUyRgParlPubas', 1561606371);
INSERT INTO `ims_ants_jizanbao_record` VALUES (77, '', 'oqo_mw5J50OoH3PUyRgParlPubas', 1561606392);
INSERT INTO `ims_ants_jizanbao_record` VALUES (78, '', 'oqo_mw5J50OoH3PUyRgParlPubas', 1561606456);
INSERT INTO `ims_ants_jizanbao_record` VALUES (79, '', 'oqo_mw5J50OoH3PUyRgParlPubas', 1561606472);
INSERT INTO `ims_ants_jizanbao_record` VALUES (80, '', 'oqo_mw5J50OoH3PUyRgParlPubas', 1561606589);
INSERT INTO `ims_ants_jizanbao_record` VALUES (81, '', 'oqo_mw5J50OoH3PUyRgParlPubas', 1561606848);
INSERT INTO `ims_ants_jizanbao_record` VALUES (82, '', 'oqo_mw5J50OoH3PUyRgParlPubas', 1561606909);

-- ----------------------------
-- Table structure for ims_ants_jizanbao_shares
-- ----------------------------
DROP TABLE IF EXISTS `ims_ants_jizanbao_shares`;
CREATE TABLE `ims_ants_jizanbao_shares`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL COMMENT '公众号id',
  `share_title` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分享名称',
  `share_blurb` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分享内容',
  `share_img` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分享图片',
  `share_openid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分享人的唯一标示',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 134 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '//分享表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ims_ants_jizanbao_shares
-- ----------------------------
INSERT INTO `ims_ants_jizanbao_shares` VALUES (1, 8, '', '', '', '');
INSERT INTO `ims_ants_jizanbao_shares` VALUES (2, 8, '', '', '', '');
INSERT INTO `ims_ants_jizanbao_shares` VALUES (3, 8, '', '', '', '');
INSERT INTO `ims_ants_jizanbao_shares` VALUES (4, 8, '', '', '', '');
INSERT INTO `ims_ants_jizanbao_shares` VALUES (5, 8, '', '', '', '');
INSERT INTO `ims_ants_jizanbao_shares` VALUES (6, 8, '', '', '', '');
INSERT INTO `ims_ants_jizanbao_shares` VALUES (7, 8, '', '', '', '');
INSERT INTO `ims_ants_jizanbao_shares` VALUES (8, 8, '', '', '', 'oqo_mw5J50OoH3PUyRgParlPubas');
INSERT INTO `ims_ants_jizanbao_shares` VALUES (9, 8, '', '', '', 'oqo_mw5J50OoH3PUyRgParlPubas');
INSERT INTO `ims_ants_jizanbao_shares` VALUES (10, 8, '', '', '', 'oqo_mw5J50OoH3PUyRgParlPubas');
INSERT INTO `ims_ants_jizanbao_shares` VALUES (11, 8, '', '', '', 'oqo_mw5J50OoH3PUyRgParlPubas');
INSERT INTO `ims_ants_jizanbao_shares` VALUES (12, 8, '', '', '', 'oqo_mw5J50OoH3PUyRgParlPubas');
INSERT INTO `ims_ants_jizanbao_shares` VALUES (13, 8, '', '', '', 'oqo_mw5J50OoH3PUyRgParlPubas');
INSERT INTO `ims_ants_jizanbao_shares` VALUES (14, 8, '', '', '', 'oqo_mw5J50OoH3PUyRgParlPubas');
INSERT INTO `ims_ants_jizanbao_shares` VALUES (15, 8, '', '', '', 'oqo_mw5J50OoH3PUyRgParlPubas');
INSERT INTO `ims_ants_jizanbao_shares` VALUES (16, 8, '', '', '', 'oqo_mw5J50OoH3PUyRgParlPubas');
INSERT INTO `ims_ants_jizanbao_shares` VALUES (17, 8, '', '', '', 'oqo_mw5J50OoH3PUyRgParlPubas');
INSERT INTO `ims_ants_jizanbao_shares` VALUES (18, 8, '', '', '', 'oqo_mw5J50OoH3PUyRgParlPubas');
INSERT INTO `ims_ants_jizanbao_shares` VALUES (19, 8, '', '', '', 'oqo_mw5J50OoH3PUyRgParlPubas');
INSERT INTO `ims_ants_jizanbao_shares` VALUES (20, 8, '', '', '', 'oqo_mw5J50OoH3PUyRgParlPubas');
INSERT INTO `ims_ants_jizanbao_shares` VALUES (21, 8, '', '', '', 'oqo_mw5J50OoH3PUyRgParlPubas');
INSERT INTO `ims_ants_jizanbao_shares` VALUES (22, 8, '', '', '', 'oqo_mw5J50OoH3PUyRgParlPubas');
INSERT INTO `ims_ants_jizanbao_shares` VALUES (23, 8, '', '', '', 'oqo_mw5J50OoH3PUyRgParlPubas');
INSERT INTO `ims_ants_jizanbao_shares` VALUES (24, 8, '', '', '', 'oqo_mw5J50OoH3PUyRgParlPubas');
INSERT INTO `ims_ants_jizanbao_shares` VALUES (25, 8, '', '', '', 'oqo_mw5J50OoH3PUyRgParlPubas');
INSERT INTO `ims_ants_jizanbao_shares` VALUES (26, 8, '', '', '', 'oqo_mw5J50OoH3PUyRgParlPubas');
INSERT INTO `ims_ants_jizanbao_shares` VALUES (27, 8, '', '', '', 'oqo_mw5J50OoH3PUyRgParlPubas');
INSERT INTO `ims_ants_jizanbao_shares` VALUES (28, 8, '', '', '', 'oqo_mw5J50OoH3PUyRgParlPubas');
INSERT INTO `ims_ants_jizanbao_shares` VALUES (29, 8, '', '', '', 'oqo_mw5J50OoH3PUyRgParlPubas');
INSERT INTO `ims_ants_jizanbao_shares` VALUES (30, 8, '', '', '', 'oqo_mw5J50OoH3PUyRgParlPubas');
INSERT INTO `ims_ants_jizanbao_shares` VALUES (31, 8, '', '', '', 'oqo_mw5J50OoH3PUyRgParlPubas');
INSERT INTO `ims_ants_jizanbao_shares` VALUES (32, 8, '', '', '', 'oqo_mw5J50OoH3PUyRgParlPubas');
INSERT INTO `ims_ants_jizanbao_shares` VALUES (33, 8, '', '', '', 'oqo_mw5J50OoH3PUyRgParlPubas');
INSERT INTO `ims_ants_jizanbao_shares` VALUES (34, 8, '', '', '', 'oqo_mw5J50OoH3PUyRgParlPubas');
INSERT INTO `ims_ants_jizanbao_shares` VALUES (35, 8, '', '', '', 'oqo_mw5J50OoH3PUyRgParlPubas');
INSERT INTO `ims_ants_jizanbao_shares` VALUES (36, 8, '', '', '', 'oqo_mw5J50OoH3PUyRgParlPubas');
INSERT INTO `ims_ants_jizanbao_shares` VALUES (37, 8, '', '', '', 'oqo_mw5J50OoH3PUyRgParlPubas');
INSERT INTO `ims_ants_jizanbao_shares` VALUES (38, 8, '', '', '', 'oqo_mw5J50OoH3PUyRgParlPubas');
INSERT INTO `ims_ants_jizanbao_shares` VALUES (39, 8, '', '', '', 'oqo_mw5J50OoH3PUyRgParlPubas');
INSERT INTO `ims_ants_jizanbao_shares` VALUES (40, 8, '', '', '', 'oqo_mw5J50OoH3PUyRgParlPubas');
INSERT INTO `ims_ants_jizanbao_shares` VALUES (41, 8, '', '', '', 'oqo_mw5J50OoH3PUyRgParlPubas');
INSERT INTO `ims_ants_jizanbao_shares` VALUES (42, 8, '', '', '', 'oqo_mw5J50OoH3PUyRgParlPubas');
INSERT INTO `ims_ants_jizanbao_shares` VALUES (43, 8, '', '', '', 'oqo_mw5J50OoH3PUyRgParlPubas');
INSERT INTO `ims_ants_jizanbao_shares` VALUES (44, 8, '', '', '', 'oqo_mw5J50OoH3PUyRgParlPubas');
INSERT INTO `ims_ants_jizanbao_shares` VALUES (45, 8, '', '', '', 'oqo_mw5J50OoH3PUyRgParlPubas');
INSERT INTO `ims_ants_jizanbao_shares` VALUES (46, 8, '', '', '', 'oqo_mw5J50OoH3PUyRgParlPubas');
INSERT INTO `ims_ants_jizanbao_shares` VALUES (47, 8, '', '', '', 'oqo_mw5J50OoH3PUyRgParlPubas');
INSERT INTO `ims_ants_jizanbao_shares` VALUES (48, 8, '', '', '', 'oqo_mw5J50OoH3PUyRgParlPubas');
INSERT INTO `ims_ants_jizanbao_shares` VALUES (49, 8, '', '', '', 'oqo_mw5J50OoH3PUyRgParlPubas');
INSERT INTO `ims_ants_jizanbao_shares` VALUES (50, 8, '', '', '', 'oqo_mw5J50OoH3PUyRgParlPubas');
INSERT INTO `ims_ants_jizanbao_shares` VALUES (51, 8, '', '', '', 'oqo_mw5J50OoH3PUyRgParlPubas');
INSERT INTO `ims_ants_jizanbao_shares` VALUES (52, 8, '', '', '', 'oqo_mw5J50OoH3PUyRgParlPubas');
INSERT INTO `ims_ants_jizanbao_shares` VALUES (53, 8, '', '', '', 'oqo_mw5J50OoH3PUyRgParlPubas');
INSERT INTO `ims_ants_jizanbao_shares` VALUES (54, 8, '', '', '', 'oqo_mw5J50OoH3PUyRgParlPubas');
INSERT INTO `ims_ants_jizanbao_shares` VALUES (55, 8, '', '', '', 'oqo_mw5J50OoH3PUyRgParlPubas');
INSERT INTO `ims_ants_jizanbao_shares` VALUES (56, 8, '', '', '', 'oqo_mw5J50OoH3PUyRgParlPubas');
INSERT INTO `ims_ants_jizanbao_shares` VALUES (57, 8, '', '', '', 'oqo_mw5J50OoH3PUyRgParlPubas');
INSERT INTO `ims_ants_jizanbao_shares` VALUES (58, 8, '', '', '', 'oqo_mw5J50OoH3PUyRgParlPubas');
INSERT INTO `ims_ants_jizanbao_shares` VALUES (59, 8, '', '', '', 'oqo_mw5J50OoH3PUyRgParlPubas');
INSERT INTO `ims_ants_jizanbao_shares` VALUES (60, 8, '', '', '', 'oqo_mw5J50OoH3PUyRgParlPubas');
INSERT INTO `ims_ants_jizanbao_shares` VALUES (61, 8, '', '', '', 'oqo_mw5J50OoH3PUyRgParlPubas');
INSERT INTO `ims_ants_jizanbao_shares` VALUES (62, 8, '', '', '', 'oqo_mw5J50OoH3PUyRgParlPubas');
INSERT INTO `ims_ants_jizanbao_shares` VALUES (63, 8, '', '', '', 'oqo_mw5J50OoH3PUyRgParlPubas');
INSERT INTO `ims_ants_jizanbao_shares` VALUES (64, 8, '', '', '', 'oqo_mw5J50OoH3PUyRgParlPubas');
INSERT INTO `ims_ants_jizanbao_shares` VALUES (65, 8, '', '', '', 'oqo_mw5J50OoH3PUyRgParlPubas');
INSERT INTO `ims_ants_jizanbao_shares` VALUES (66, 8, '', '', '', 'oqo_mw5J50OoH3PUyRgParlPubas');
INSERT INTO `ims_ants_jizanbao_shares` VALUES (67, 8, '', '', '', 'oqo_mw5J50OoH3PUyRgParlPubas');
INSERT INTO `ims_ants_jizanbao_shares` VALUES (68, 8, '', '', '', 'oqo_mw5J50OoH3PUyRgParlPubas');
INSERT INTO `ims_ants_jizanbao_shares` VALUES (69, 8, '', '', '', 'oqo_mw5J50OoH3PUyRgParlPubas');
INSERT INTO `ims_ants_jizanbao_shares` VALUES (70, 8, '', '', '', 'oqo_mw5J50OoH3PUyRgParlPubas');
INSERT INTO `ims_ants_jizanbao_shares` VALUES (71, 8, '', '', '', 'oqo_mw5J50OoH3PUyRgParlPubas');
INSERT INTO `ims_ants_jizanbao_shares` VALUES (72, 8, '', '', '', 'oqo_mw5J50OoH3PUyRgParlPubas');
INSERT INTO `ims_ants_jizanbao_shares` VALUES (73, 8, '', '', '', 'oqo_mw5J50OoH3PUyRgParlPubas');
INSERT INTO `ims_ants_jizanbao_shares` VALUES (74, 8, '', '', '', 'oqo_mw5J50OoH3PUyRgParlPubas');
INSERT INTO `ims_ants_jizanbao_shares` VALUES (75, 8, '', '', '', 'oqo_mw5J50OoH3PUyRgParlPubas');
INSERT INTO `ims_ants_jizanbao_shares` VALUES (76, 8, '', '', '', 'oqo_mw5J50OoH3PUyRgParlPubas');
INSERT INTO `ims_ants_jizanbao_shares` VALUES (77, 8, '', '', '', 'oqo_mw5J50OoH3PUyRgParlPubas');
INSERT INTO `ims_ants_jizanbao_shares` VALUES (78, 8, '', '', '', 'oqo_mw5J50OoH3PUyRgParlPubas');
INSERT INTO `ims_ants_jizanbao_shares` VALUES (79, 8, '', '', '', 'oqo_mw5J50OoH3PUyRgParlPubas');
INSERT INTO `ims_ants_jizanbao_shares` VALUES (80, 8, '', '', '', 'oqo_mw5J50OoH3PUyRgParlPubas');
INSERT INTO `ims_ants_jizanbao_shares` VALUES (81, 8, '', '', '', 'oqo_mw5J50OoH3PUyRgParlPubas');
INSERT INTO `ims_ants_jizanbao_shares` VALUES (82, 8, '', '', '', 'oqo_mw5J50OoH3PUyRgParlPubas');
INSERT INTO `ims_ants_jizanbao_shares` VALUES (83, 8, '', '', '', 'oqo_mw5J50OoH3PUyRgParlPubas');
INSERT INTO `ims_ants_jizanbao_shares` VALUES (84, 8, '', '', '', 'oqo_mw5J50OoH3PUyRgParlPubas');
INSERT INTO `ims_ants_jizanbao_shares` VALUES (85, 8, '', '', '', 'oqo_mw5J50OoH3PUyRgParlPubas');
INSERT INTO `ims_ants_jizanbao_shares` VALUES (86, 8, '', '', '', 'oqo_mw5J50OoH3PUyRgParlPubas');
INSERT INTO `ims_ants_jizanbao_shares` VALUES (87, 8, '', '', '', 'oqo_mw5J50OoH3PUyRgParlPubas');
INSERT INTO `ims_ants_jizanbao_shares` VALUES (88, 8, '', '', '', 'oqo_mw5J50OoH3PUyRgParlPubas');
INSERT INTO `ims_ants_jizanbao_shares` VALUES (89, 8, '', '', '', 'oqo_mw5J50OoH3PUyRgParlPubas');
INSERT INTO `ims_ants_jizanbao_shares` VALUES (90, 8, '', '', '', 'oqo_mw5J50OoH3PUyRgParlPubas');
INSERT INTO `ims_ants_jizanbao_shares` VALUES (91, 8, '', '', '', 'oqo_mw5J50OoH3PUyRgParlPubas');
INSERT INTO `ims_ants_jizanbao_shares` VALUES (92, 8, '', '', '', 'oqo_mw5J50OoH3PUyRgParlPubas');
INSERT INTO `ims_ants_jizanbao_shares` VALUES (93, 8, '', '', '', 'oqo_mw5J50OoH3PUyRgParlPubas');
INSERT INTO `ims_ants_jizanbao_shares` VALUES (94, 8, '', '', '', 'oqo_mw5J50OoH3PUyRgParlPubas');
INSERT INTO `ims_ants_jizanbao_shares` VALUES (95, 8, '', '', '', 'oqo_mw5J50OoH3PUyRgParlPubas');
INSERT INTO `ims_ants_jizanbao_shares` VALUES (96, 8, '', '', '', 'oqo_mw5J50OoH3PUyRgParlPubas');
INSERT INTO `ims_ants_jizanbao_shares` VALUES (97, 8, '', '', '', 'oqo_mw5J50OoH3PUyRgParlPubas');
INSERT INTO `ims_ants_jizanbao_shares` VALUES (98, 8, '', '', '', 'oqo_mw5J50OoH3PUyRgParlPubas');
INSERT INTO `ims_ants_jizanbao_shares` VALUES (99, 8, '', '', '', 'oqo_mw5J50OoH3PUyRgParlPubas');
INSERT INTO `ims_ants_jizanbao_shares` VALUES (100, 8, '', '', '', 'oqo_mw5J50OoH3PUyRgParlPubas');
INSERT INTO `ims_ants_jizanbao_shares` VALUES (101, 8, '', '', '', 'oqo_mw5J50OoH3PUyRgParlPubas');
INSERT INTO `ims_ants_jizanbao_shares` VALUES (102, 8, '', '', '', 'oqo_mw5J50OoH3PUyRgParlPubas');
INSERT INTO `ims_ants_jizanbao_shares` VALUES (103, 8, '', '', '', '');
INSERT INTO `ims_ants_jizanbao_shares` VALUES (104, 8, '', '', '', '');
INSERT INTO `ims_ants_jizanbao_shares` VALUES (105, 8, '', '', '', 'oqo_mw5J50OoH3PUyRgParlPubas');
INSERT INTO `ims_ants_jizanbao_shares` VALUES (106, 8, '', '', '', 'oqo_mw5J50OoH3PUyRgParlPubas');
INSERT INTO `ims_ants_jizanbao_shares` VALUES (107, 8, '', '', '', 'oqo_mw5J50OoH3PUyRgParlPubas');
INSERT INTO `ims_ants_jizanbao_shares` VALUES (108, 8, '', '', '', 'oqo_mw5J50OoH3PUyRgParlPubas');
INSERT INTO `ims_ants_jizanbao_shares` VALUES (109, 8, '', '', '', 'oqo_mw5J50OoH3PUyRgParlPubas');
INSERT INTO `ims_ants_jizanbao_shares` VALUES (110, 8, '', '', '', 'oqo_mw5J50OoH3PUyRgParlPubas');
INSERT INTO `ims_ants_jizanbao_shares` VALUES (111, 8, '', '', '', 'oqo_mw5J50OoH3PUyRgParlPubas');
INSERT INTO `ims_ants_jizanbao_shares` VALUES (112, 8, '', '', '', 'oqo_mw5J50OoH3PUyRgParlPubas');
INSERT INTO `ims_ants_jizanbao_shares` VALUES (113, 8, '', '', '', 'oqo_mw5J50OoH3PUyRgParlPubas');
INSERT INTO `ims_ants_jizanbao_shares` VALUES (114, 8, '', '', '', 'oqo_mw5J50OoH3PUyRgParlPubas');
INSERT INTO `ims_ants_jizanbao_shares` VALUES (115, 8, '', '', '', 'oqo_mw5J50OoH3PUyRgParlPubas');
INSERT INTO `ims_ants_jizanbao_shares` VALUES (116, 8, '', '', '', 'oqo_mw5J50OoH3PUyRgParlPubas');
INSERT INTO `ims_ants_jizanbao_shares` VALUES (117, 8, '', '', '', '');
INSERT INTO `ims_ants_jizanbao_shares` VALUES (118, 8, '', '', '', '');
INSERT INTO `ims_ants_jizanbao_shares` VALUES (119, 8, '', '', '', '');
INSERT INTO `ims_ants_jizanbao_shares` VALUES (120, 8, '', '', '', '');
INSERT INTO `ims_ants_jizanbao_shares` VALUES (121, 8, '', '', '', '');
INSERT INTO `ims_ants_jizanbao_shares` VALUES (122, 8, '', '', '', '');
INSERT INTO `ims_ants_jizanbao_shares` VALUES (123, 8, '', '', '', '');
INSERT INTO `ims_ants_jizanbao_shares` VALUES (124, 8, '', '', '', 'oqo_mw5J50OoH3PUyRgParlPubas');
INSERT INTO `ims_ants_jizanbao_shares` VALUES (125, 8, '', '', '', 'oqo_mw5J50OoH3PUyRgParlPubas');
INSERT INTO `ims_ants_jizanbao_shares` VALUES (126, 8, '', '', '', '');
INSERT INTO `ims_ants_jizanbao_shares` VALUES (127, 8, '', '', '', '');
INSERT INTO `ims_ants_jizanbao_shares` VALUES (128, 8, '', '', '', '');
INSERT INTO `ims_ants_jizanbao_shares` VALUES (129, 8, '', '', '', '');
INSERT INTO `ims_ants_jizanbao_shares` VALUES (130, 8, '', '', '', '');
INSERT INTO `ims_ants_jizanbao_shares` VALUES (131, 8, '', '', '', '');
INSERT INTO `ims_ants_jizanbao_shares` VALUES (132, 8, '', '', '', '');
INSERT INTO `ims_ants_jizanbao_shares` VALUES (133, 8, '', '', '', '');

-- ----------------------------
-- Table structure for ims_ants_jizanbao_users
-- ----------------------------
DROP TABLE IF EXISTS `ims_ants_jizanbao_users`;
CREATE TABLE `ims_ants_jizanbao_users`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` char(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '公众号id',
  `nuid` int(11) NOT NULL COMMENT '活动id',
  `follow` int(11) NOT NULL COMMENT '是否关注',
  `nickname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '粉丝名称',
  `username` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户姓名',
  `portrait` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户头像',
  `openid` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户openid',
  `user_tel` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户电话',
  `user_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户收货地址',
  `my_zan` int(11) NOT NULL DEFAULT 0 COMMENT '我的攒数量',
  `my_share` int(11) NOT NULL DEFAULT 0 COMMENT '我的分享次数',
  `status` int(11) NULL DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 142 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '//用户表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ims_ants_jizanbao_users
-- ----------------------------
INSERT INTO `ims_ants_jizanbao_users` VALUES (98, '25252', 21, 88, '个人股', '名称001', '/images/8/2019/06/GR1A9Zpx6299z661DIIC412a4xzZE1.png', '1200', '1366925200', '山西', 1200, 200, 1);
INSERT INTO `ims_ants_jizanbao_users` VALUES (99, '25252', 21, 88, '个人股', '名称001', '/images/8/2019/06/GR1A9Zpx6299z661DIIC412a4xzZE1.png', '1200', '1366925200', '山西', 1200, 200, 1);
INSERT INTO `ims_ants_jizanbao_users` VALUES (100, '25252', 21, 88, '个人股', '名称001', '/images/8/2019/06/GR1A9Zpx6299z661DIIC412a4xzZE1.png', '1200', '1366925200', '山西', 23, 200, 1);
INSERT INTO `ims_ants_jizanbao_users` VALUES (101, '25252', 21, 88, '个人股', '名称001', '/images/8/2019/06/GR1A9Zpx6299z661DIIC412a4xzZE1.png', '1200', '1366925200', '山西', 1200, 200, 1);
INSERT INTO `ims_ants_jizanbao_users` VALUES (102, '25252', 21, 88, '个人股', '名称001', '/images/8/2019/06/GR1A9Zpx6299z661DIIC412a4xzZE1.png', '1200', '1366925200', '山西', 1200, 200, 1);
INSERT INTO `ims_ants_jizanbao_users` VALUES (103, '25252', 21, 88, '个人股', '名称001', '/images/8/2019/06/GR1A9Zpx6299z661DIIC412a4xzZE1.png', '1200', '1366925200', '山西', 1200, 200, 1);
INSERT INTO `ims_ants_jizanbao_users` VALUES (104, '25252', 21, 88, '个人股', '名称001', '/images/8/2019/06/GR1A9Zpx6299z661DIIC412a4xzZE1.png', '1200', '1366925200', '山西', 1200, 200, 1);
INSERT INTO `ims_ants_jizanbao_users` VALUES (106, '25252', 21, 88, '个人股', '名称001', '/images/8/2019/06/GR1A9Zpx6299z661DIIC412a4xzZE1.png', '1200', '1366925200', '山西', 1200, 200, 1);
INSERT INTO `ims_ants_jizanbao_users` VALUES (107, '25252', 21, 88, '个人股', '名称001', '/images/8/2019/06/GR1A9Zpx6299z661DIIC412a4xzZE1.png', '1200', '1366925200', '山西', 1200, 200, 1);
INSERT INTO `ims_ants_jizanbao_users` VALUES (108, '25252', 21, 88, '个人股', '名称001', '/images/8/2019/06/GR1A9Zpx6299z661DIIC412a4xzZE1.png', '1200', '1366925200', '山西', 1200, 200, 1);
INSERT INTO `ims_ants_jizanbao_users` VALUES (109, '25252', 21, 88, '个人股', '名称001', '/images/8/2019/06/GR1A9Zpx6299z661DIIC412a4xzZE1.png', '1200', '1366925200', '山西', 1200, 200, 1);
INSERT INTO `ims_ants_jizanbao_users` VALUES (110, '25252', 21, 88, '个人股', '名称001', '/images/8/2019/06/GR1A9Zpx6299z661DIIC412a4xzZE1.png', '1200', '1366925200', '山西', 1200, 200, 1);
INSERT INTO `ims_ants_jizanbao_users` VALUES (111, '25252', 21, 88, '个人股', '名称001', '/images/8/2019/06/GR1A9Zpx6299z661DIIC412a4xzZE1.png', '1200', '1366925200', '山西', 1200, 200, 1);
INSERT INTO `ims_ants_jizanbao_users` VALUES (112, '25252', 21, 88, '个人股', '名称001', '/images/8/2019/06/GR1A9Zpx6299z661DIIC412a4xzZE1.png', '1200', '1366925200', '山西', 1200, 200, 1);
INSERT INTO `ims_ants_jizanbao_users` VALUES (113, '25252', 21, 88, '个人股', '名称001', '/images/8/2019/06/GR1A9Zpx6299z661DIIC412a4xzZE1.png', '1200', '1366925200', '山西', 1200, 200, 1);
INSERT INTO `ims_ants_jizanbao_users` VALUES (114, '25252', 21, 88, '个人股', '名称001', '/images/8/2019/06/GR1A9Zpx6299z661DIIC412a4xzZE1.png', '1200', '1366925200', '山西', 1200, 200, 1);
INSERT INTO `ims_ants_jizanbao_users` VALUES (115, '25252', 21, 88, '个人股', '名称001', '/images/8/2019/06/GR1A9Zpx6299z661DIIC412a4xzZE1.png', '1200', '1366925200', '山西', 1200, 200, 1);
INSERT INTO `ims_ants_jizanbao_users` VALUES (118, '8', 0, 0, '努力和方法都很重要', '', 'http://thirdwx.qlogo.cn/mmopen/vi_32/5Xa4AibCQXuDRKPXSR6IiaR99ibX6BMRs8WqDeqxOql45lngrYEYiaOhaial0ISHNo8seQRuCO8RVTn8PAz3oicHsuOw/132', 'oqo_mw1rjesx0AiC72vqhEsbL5Vs', '', '中国-陕西-西安', 0, 0, 0);
INSERT INTO `ims_ants_jizanbao_users` VALUES (119, '8', 0, 0, '致小别', '昂哈', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJYqfibPHFMy0BA3JUyy6xpCgT9b9Rtic9Cb5ycZhISl2ia7dAluCdLGsiasE171JrnUOkv4PHAIWJ8Pg/132', 'oqo_mw4Kd1KMSvKU-2otQmyxMQk8', '13571023026', '中国-陕西-铜川', 0, 0, 0);
INSERT INTO `ims_ants_jizanbao_users` VALUES (121, '8', 0, 0, 'Merroy_禁', '', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIup2uiazHbRHQic8zYYWrGDMN1vYAfp7ExHicMyktmLaGzQnbbzxUyAmy7DRKqkZwsXqeroxFClJibUQ/132', 'oqo_mw500M6iLFYCCIuHU_THtpfA', '', '中国-山西-运城', 0, 0, 0);
INSERT INTO `ims_ants_jizanbao_users` VALUES (122, '8', 0, 0, 'm-lin-k', '', 'http://thirdwx.qlogo.cn/mmopen/vi_32/ZTb6rw5weBicgXTGC7J4BTqEBd5yOiaHuRm0DQ5hw4XDmrHckZzeLmSekfyonYkicCUtqEribJcTza447XU6opgbng/132', 'oqo_mw6KUyT0hQPgzIncbr9VirZc', '', '新西兰-北岸-', 0, 0, 0);
INSERT INTO `ims_ants_jizanbao_users` VALUES (123, '8', 0, 0, '', '', '', '', '', '--', 0, 0, 0);
INSERT INTO `ims_ants_jizanbao_users` VALUES (124, '8', 0, 0, '', '', '', '', '', '--', 0, 0, 0);
INSERT INTO `ims_ants_jizanbao_users` VALUES (125, '8', 0, 0, '', '', '', '', '', '--', 0, 0, 0);
INSERT INTO `ims_ants_jizanbao_users` VALUES (127, '8', 0, 0, '', '', '', '', '', '--', 0, 0, 0);
INSERT INTO `ims_ants_jizanbao_users` VALUES (128, '8', 0, 0, '', '', '', '', '', '--', 0, 0, 0);
INSERT INTO `ims_ants_jizanbao_users` VALUES (129, '8', 0, 0, '', '', '', '', '', '--', 0, 0, 0);
INSERT INTO `ims_ants_jizanbao_users` VALUES (130, '8', 0, 0, '', '', '', '', '', '--', 0, 0, 0);
INSERT INTO `ims_ants_jizanbao_users` VALUES (131, '8', 0, 0, '', '', '', '', '', '--', 0, 0, 0);
INSERT INTO `ims_ants_jizanbao_users` VALUES (135, '8', 0, 0, '', '', '', '', '', '--', 0, 0, 0);
INSERT INTO `ims_ants_jizanbao_users` VALUES (137, '8', 0, 0, '', '', '', '', '', '--', 0, 0, 0);
INSERT INTO `ims_ants_jizanbao_users` VALUES (138, '8', 0, 0, '', '', '', '', '', '--', 0, 0, 0);
INSERT INTO `ims_ants_jizanbao_users` VALUES (139, '8', 0, 0, '', '', '', '', '', '--', 0, 0, 0);
INSERT INTO `ims_ants_jizanbao_users` VALUES (140, '8', 0, 0, '', '', '', '', '', '--', 0, 0, 0);
INSERT INTO `ims_ants_jizanbao_users` VALUES (141, '8', 0, 0, '', '', '', '', '', '--', 0, 0, 0);

-- ----------------------------
-- Table structure for ims_ants_jizanbao_zans
-- ----------------------------
DROP TABLE IF EXISTS `ims_ants_jizanbao_zans`;
CREATE TABLE `ims_ants_jizanbao_zans`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL COMMENT '公众号id',
  `nuid` int(11) NOT NULL COMMENT '活动id',
  `nickname` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '点赞者名称',
  `portrait` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '帮赞头像',
  `dianzan_id` int(11) NOT NULL COMMENT '点赞人id',
  `beizan_id` int(11) NOT NULL COMMENT '被赞人id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '//点赞记录表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ims_ants_jizanbao_zans
-- ----------------------------
INSERT INTO `ims_ants_jizanbao_zans` VALUES (2, 8, 1, '过客匆匆', 'http://thirdwx.qlogo.cn/mmopen/vi_32/plSODqEAUHNoSXXLmonUZgLjeytYGoiadt5l4iaYl6iaVYIE6gnH12icGic7Uicj8QGZQ8DpmZgfLXk73j5wcsLlODog/132', 131, 131);
INSERT INTO `ims_ants_jizanbao_zans` VALUES (3, 8, 2, '过客匆匆', 'http://thirdwx.qlogo.cn/mmopen/vi_32/plSODqEAUHNoSXXLmonUZgLjeytYGoiadt5l4iaYl6iaVYIE6gnH12icGic7Uicj8QGZQ8DpmZgfLXk73j5wcsLlODog/132', 131, 131);
INSERT INTO `ims_ants_jizanbao_zans` VALUES (4, 8, 3, '过客匆匆', 'http://thirdwx.qlogo.cn/mmopen/vi_32/plSODqEAUHNoSXXLmonUZgLjeytYGoiadt5l4iaYl6iaVYIE6gnH12icGic7Uicj8QGZQ8DpmZgfLXk73j5wcsLlODog/132', 131, 131);
INSERT INTO `ims_ants_jizanbao_zans` VALUES (5, 8, 4, '过客匆匆', 'http://thirdwx.qlogo.cn/mmopen/vi_32/plSODqEAUHNoSXXLmonUZgLjeytYGoiadt5l4iaYl6iaVYIE6gnH12icGic7Uicj8QGZQ8DpmZgfLXk73j5wcsLlODog/132', 131, 131);
INSERT INTO `ims_ants_jizanbao_zans` VALUES (6, 8, 5, '过客匆匆', 'http://thirdwx.qlogo.cn/mmopen/vi_32/plSODqEAUHNoSXXLmonUZgLjeytYGoiadt5l4iaYl6iaVYIE6gnH12icGic7Uicj8QGZQ8DpmZgfLXk73j5wcsLlODog/132', 131, 131);
INSERT INTO `ims_ants_jizanbao_zans` VALUES (7, 8, 6, '过客匆匆', 'http://thirdwx.qlogo.cn/mmopen/vi_32/plSODqEAUHNoSXXLmonUZgLjeytYGoiadt5l4iaYl6iaVYIE6gnH12icGic7Uicj8QGZQ8DpmZgfLXk73j5wcsLlODog/132', 131, 131);
INSERT INTO `ims_ants_jizanbao_zans` VALUES (8, 8, 6, '过客匆匆', 'http://thirdwx.qlogo.cn/mmopen/vi_32/plSODqEAUHNoSXXLmonUZgLjeytYGoiadt5l4iaYl6iaVYIE6gnH12icGic7Uicj8QGZQ8DpmZgfLXk73j5wcsLlODog/132', 135, 131);

-- ----------------------------
-- Table structure for ims_article_category
-- ----------------------------
DROP TABLE IF EXISTS `ims_article_category`;
CREATE TABLE `ims_article_category`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `displayorder` tinyint(3) UNSIGNED NOT NULL,
  `type` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `type`(`type`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_article_comment
-- ----------------------------
DROP TABLE IF EXISTS `ims_article_comment`;
CREATE TABLE `ims_article_comment`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `articleid` int(10) NOT NULL,
  `parentid` int(10) NOT NULL,
  `uid` int(10) NOT NULL,
  `content` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_like` tinyint(1) NOT NULL,
  `is_reply` tinyint(1) NOT NULL,
  `like_num` int(10) NOT NULL,
  `createtime` int(10) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `articleid`(`articleid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_article_news
-- ----------------------------
DROP TABLE IF EXISTS `ims_article_news`;
CREATE TABLE `ims_article_news`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `cateid` int(10) UNSIGNED NOT NULL,
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `thumb` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `source` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `author` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `displayorder` tinyint(3) UNSIGNED NOT NULL,
  `is_display` tinyint(3) UNSIGNED NOT NULL,
  `is_show_home` tinyint(3) UNSIGNED NOT NULL,
  `createtime` int(10) UNSIGNED NOT NULL,
  `click` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `title`(`title`) USING BTREE,
  INDEX `cateid`(`cateid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_article_notice
-- ----------------------------
DROP TABLE IF EXISTS `ims_article_notice`;
CREATE TABLE `ims_article_notice`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `cateid` int(10) UNSIGNED NOT NULL,
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `displayorder` tinyint(3) UNSIGNED NOT NULL,
  `is_display` tinyint(3) UNSIGNED NOT NULL,
  `is_show_home` tinyint(3) UNSIGNED NOT NULL,
  `createtime` int(10) UNSIGNED NOT NULL,
  `click` int(10) UNSIGNED NOT NULL,
  `style` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `group` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `title`(`title`) USING BTREE,
  INDEX `cateid`(`cateid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_article_unread_notice
-- ----------------------------
DROP TABLE IF EXISTS `ims_article_unread_notice`;
CREATE TABLE `ims_article_unread_notice`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `notice_id` int(10) UNSIGNED NOT NULL,
  `uid` int(10) UNSIGNED NOT NULL,
  `is_new` tinyint(3) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `notice_id`(`notice_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for ims_attachment_group
-- ----------------------------
DROP TABLE IF EXISTS `ims_attachment_group`;
CREATE TABLE `ims_attachment_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `uniacid` int(11) NULL DEFAULT NULL,
  `uid` int(11) NULL DEFAULT NULL,
  `type` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_basic_reply
-- ----------------------------
DROP TABLE IF EXISTS `ims_basic_reply`;
CREATE TABLE `ims_basic_reply`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `rid` int(10) UNSIGNED NOT NULL,
  `content` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `rid`(`rid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_business
-- ----------------------------
DROP TABLE IF EXISTS `ims_business`;
CREATE TABLE `ims_business`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `weid` int(10) UNSIGNED NOT NULL,
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `thumb` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `phone` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `qq` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `province` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `city` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `dist` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `address` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `lng` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `lat` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `industry1` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `industry2` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `createtime` int(10) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_lat_lng`(`lng`, `lat`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_core_attachment
-- ----------------------------
DROP TABLE IF EXISTS `ims_core_attachment`;
CREATE TABLE `ims_core_attachment`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `uid` int(10) UNSIGNED NOT NULL,
  `filename` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `attachment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` tinyint(3) UNSIGNED NOT NULL,
  `createtime` int(10) UNSIGNED NOT NULL,
  `module_upload_dir` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `group_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ims_core_attachment
-- ----------------------------
INSERT INTO `ims_core_attachment` VALUES (6, 8, 1, 'tooopen_sl_182308805503.jpg', 'images/8/2019/06/Caoz0olEzBtLu0AEJpEYLJPojoEt0Y.jpg', 1, 1559699852, '', -1);
INSERT INTO `ims_core_attachment` VALUES (7, 8, 1, 'tooopen_sl_1409059575549.jpg', 'images/8/2019/06/VO46z61AZD614d8Qq6quDgoo8618o6.jpg', 1, 1559700027, '', -1);
INSERT INTO `ims_core_attachment` VALUES (5, 8, 1, 'tooopen_sl_083223899534.jpg', 'images/8/2019/06/wVH3LBbfWvhMH62wwf2urZFwo93vrW.jpg', 1, 1559555614, '', -1);
INSERT INTO `ims_core_attachment` VALUES (8, 8, 1, 'tooopen_sl_18180418412805.jpg', 'images/8/2019/06/EvgPjvPP2m4PNV4k4VM2jMIGImcc2k.jpg', 1, 1559721674, '', -1);
INSERT INTO `ims_core_attachment` VALUES (9, 8, 1, 'tooopen_sl_092115211584072.jpg', 'images/8/2019/06/f5rAsYafYRfGAAysFkC4580F5aZoYf.jpg', 1, 1559721693, '', -1);
INSERT INTO `ims_core_attachment` VALUES (10, 8, 1, 'tooopen_sl_11470047010704.jpg', 'images/8/2019/06/O9k7Kg7iSs9kX9G9X7V7gY92gknkk4.jpg', 1, 1559786989, '', -1);
INSERT INTO `ims_core_attachment` VALUES (11, 8, 1, 'u=2076756158,2878148492&fm=76.png', 'images/8/2019/06/GR1A9Zpx6299z661DIIC412a4xzZE1.png', 1, 1559787089, '', -1);

-- ----------------------------
-- Table structure for ims_core_cache
-- ----------------------------
DROP TABLE IF EXISTS `ims_core_cache`;
CREATE TABLE `ims_core_cache`  (
  `key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`key`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ims_core_cache
-- ----------------------------
INSERT INTO `ims_core_cache` VALUES ('we7:account_ticket', 's:0:\"\";');
INSERT INTO `ims_core_cache` VALUES ('we7:userbasefields', 'a:46:{s:7:\"uniacid\";s:17:\"同一公众号id\";s:7:\"groupid\";s:8:\"分组id\";s:7:\"credit1\";s:6:\"积分\";s:7:\"credit2\";s:6:\"余额\";s:7:\"credit3\";s:19:\"预留积分类型3\";s:7:\"credit4\";s:19:\"预留积分类型4\";s:7:\"credit5\";s:19:\"预留积分类型5\";s:7:\"credit6\";s:19:\"预留积分类型6\";s:10:\"createtime\";s:12:\"加入时间\";s:6:\"mobile\";s:12:\"手机号码\";s:5:\"email\";s:12:\"电子邮箱\";s:8:\"realname\";s:12:\"真实姓名\";s:8:\"nickname\";s:6:\"昵称\";s:6:\"avatar\";s:6:\"头像\";s:2:\"qq\";s:5:\"QQ号\";s:6:\"gender\";s:6:\"性别\";s:5:\"birth\";s:6:\"生日\";s:13:\"constellation\";s:6:\"星座\";s:6:\"zodiac\";s:6:\"生肖\";s:9:\"telephone\";s:12:\"固定电话\";s:6:\"idcard\";s:12:\"证件号码\";s:9:\"studentid\";s:6:\"学号\";s:5:\"grade\";s:6:\"班级\";s:7:\"address\";s:6:\"地址\";s:7:\"zipcode\";s:6:\"邮编\";s:11:\"nationality\";s:6:\"国籍\";s:6:\"reside\";s:9:\"居住地\";s:14:\"graduateschool\";s:12:\"毕业学校\";s:7:\"company\";s:6:\"公司\";s:9:\"education\";s:6:\"学历\";s:10:\"occupation\";s:6:\"职业\";s:8:\"position\";s:6:\"职位\";s:7:\"revenue\";s:9:\"年收入\";s:15:\"affectivestatus\";s:12:\"情感状态\";s:10:\"lookingfor\";s:13:\" 交友目的\";s:9:\"bloodtype\";s:6:\"血型\";s:6:\"height\";s:6:\"身高\";s:6:\"weight\";s:6:\"体重\";s:6:\"alipay\";s:15:\"支付宝帐号\";s:3:\"msn\";s:3:\"MSN\";s:6:\"taobao\";s:12:\"阿里旺旺\";s:4:\"site\";s:6:\"主页\";s:3:\"bio\";s:12:\"自我介绍\";s:8:\"interest\";s:12:\"兴趣爱好\";s:8:\"password\";s:6:\"密码\";s:12:\"pay_password\";s:12:\"支付密码\";}');
INSERT INTO `ims_core_cache` VALUES ('we7:usersfields', 'a:47:{s:8:\"realname\";s:12:\"真实姓名\";s:8:\"nickname\";s:6:\"昵称\";s:6:\"avatar\";s:6:\"头像\";s:2:\"qq\";s:5:\"QQ号\";s:6:\"mobile\";s:12:\"手机号码\";s:3:\"vip\";s:9:\"VIP级别\";s:6:\"gender\";s:6:\"性别\";s:9:\"birthyear\";s:12:\"出生生日\";s:13:\"constellation\";s:6:\"星座\";s:6:\"zodiac\";s:6:\"生肖\";s:9:\"telephone\";s:12:\"固定电话\";s:6:\"idcard\";s:12:\"证件号码\";s:9:\"studentid\";s:6:\"学号\";s:5:\"grade\";s:6:\"班级\";s:7:\"address\";s:12:\"邮寄地址\";s:7:\"zipcode\";s:6:\"邮编\";s:11:\"nationality\";s:6:\"国籍\";s:14:\"resideprovince\";s:12:\"居住地址\";s:14:\"graduateschool\";s:12:\"毕业学校\";s:7:\"company\";s:6:\"公司\";s:9:\"education\";s:6:\"学历\";s:10:\"occupation\";s:6:\"职业\";s:8:\"position\";s:6:\"职位\";s:7:\"revenue\";s:9:\"年收入\";s:15:\"affectivestatus\";s:12:\"情感状态\";s:10:\"lookingfor\";s:13:\" 交友目的\";s:9:\"bloodtype\";s:6:\"血型\";s:6:\"height\";s:6:\"身高\";s:6:\"weight\";s:6:\"体重\";s:6:\"alipay\";s:15:\"支付宝帐号\";s:3:\"msn\";s:3:\"MSN\";s:5:\"email\";s:12:\"电子邮箱\";s:6:\"taobao\";s:12:\"阿里旺旺\";s:4:\"site\";s:6:\"主页\";s:3:\"bio\";s:12:\"自我介绍\";s:8:\"interest\";s:12:\"兴趣爱好\";s:7:\"uniacid\";s:17:\"同一公众号id\";s:7:\"groupid\";s:8:\"分组id\";s:7:\"credit1\";s:6:\"积分\";s:7:\"credit2\";s:6:\"余额\";s:7:\"credit3\";s:19:\"预留积分类型3\";s:7:\"credit4\";s:19:\"预留积分类型4\";s:7:\"credit5\";s:19:\"预留积分类型5\";s:7:\"credit6\";s:19:\"预留积分类型6\";s:10:\"createtime\";s:12:\"加入时间\";s:8:\"password\";s:12:\"用户密码\";s:12:\"pay_password\";s:12:\"支付密码\";}');
INSERT INTO `ims_core_cache` VALUES ('we7:setting', 'a:7:{s:8:\"authmode\";i:1;s:5:\"close\";a:2:{s:6:\"status\";s:1:\"0\";s:6:\"reason\";s:0:\"\";}s:9:\"copyright\";a:37:{s:6:\"status\";i:0;s:10:\"verifycode\";N;s:6:\"reason\";s:0:\"\";s:8:\"sitename\";s:0:\"\";s:3:\"url\";s:7:\"http://\";s:8:\"statcode\";s:0:\"\";s:10:\"footerleft\";s:0:\"\";s:11:\"footerright\";s:0:\"\";s:4:\"icon\";s:0:\"\";s:5:\"flogo\";s:0:\"\";s:14:\"background_img\";s:0:\"\";s:6:\"slides\";s:216:\"a:3:{i:0;s:58:\"https://img.alicdn.com/tps/TB1pfG4IFXXXXc6XXXXXXXXXXXX.jpg\";i:1;s:58:\"https://img.alicdn.com/tps/TB1sXGYIFXXXXc5XpXXXXXXXXXX.jpg\";i:2;s:58:\"https://img.alicdn.com/tps/TB1h9xxIFXXXXbKXXXXXXXXXXXX.jpg\";}\";s:6:\"notice\";s:0:\"\";s:5:\"blogo\";s:0:\"\";s:8:\"baidumap\";a:2:{s:3:\"lng\";s:10:\"116.403851\";s:3:\"lat\";s:9:\"39.915177\";}s:7:\"company\";s:0:\"\";s:14:\"companyprofile\";s:0:\"\";s:7:\"address\";s:0:\"\";s:6:\"person\";s:0:\"\";s:5:\"phone\";s:0:\"\";s:2:\"qq\";s:0:\"\";s:5:\"email\";s:0:\"\";s:8:\"keywords\";s:0:\"\";s:11:\"description\";s:0:\"\";s:12:\"showhomepage\";i:0;s:13:\"leftmenufixed\";i:0;s:13:\"mobile_status\";N;s:10:\"login_type\";N;s:10:\"log_status\";i:0;s:14:\"develop_status\";i:1;s:3:\"icp\";s:0:\"\";s:8:\"sms_name\";s:0:\"\";s:12:\"sms_password\";s:0:\"\";s:8:\"sms_sign\";s:0:\"\";s:4:\"bind\";N;s:12:\"welcome_link\";N;s:10:\"oauth_bind\";N;}s:8:\"platform\";a:5:{s:5:\"token\";s:32:\"MZ7X1c79Ex4drjRdycK11x2JN2j1nC4o\";s:14:\"encodingaeskey\";s:43:\"VKyl2SRuzi9K4QaVyAydKSR9FArSius4sSJQsyqk4rP\";s:9:\"appsecret\";s:0:\"\";s:5:\"appid\";s:0:\"\";s:9:\"authstate\";i:1;}s:8:\"register\";a:4:{s:4:\"open\";i:1;s:6:\"verify\";i:0;s:4:\"code\";i:1;s:7:\"groupid\";i:1;}s:18:\"module_receive_ban\";a:0:{}s:5:\"basic\";a:1:{s:8:\"template\";s:5:\"black\";}}');
INSERT INTO `ims_core_cache` VALUES ('we7:module_receive_enable', 'a:18:{s:13:\"user_get_card\";a:1:{i:0;s:9:\"deam_food\";}s:15:\"card_pass_check\";a:1:{i:0;s:9:\"deam_food\";}s:17:\"user_gifting_card\";a:1:{i:0;s:9:\"deam_food\";}s:13:\"user_del_card\";a:1:{i:0;s:9:\"deam_food\";}s:17:\"user_consume_card\";a:1:{i:0;s:9:\"deam_food\";}s:5:\"image\";a:1:{i:0;s:11:\"yunphp_shop\";}s:5:\"voice\";a:1:{i:0;s:11:\"yunphp_shop\";}s:5:\"video\";a:1:{i:0;s:11:\"yunphp_shop\";}s:10:\"shortvideo\";a:1:{i:0;s:11:\"yunphp_shop\";}s:8:\"location\";a:1:{i:0;s:11:\"yunphp_shop\";}s:4:\"link\";a:1:{i:0;s:11:\"yunphp_shop\";}s:9:\"subscribe\";a:1:{i:0;s:11:\"yunphp_shop\";}s:11:\"unsubscribe\";a:1:{i:0;s:11:\"yunphp_shop\";}s:2:\"qr\";a:1:{i:0;s:11:\"yunphp_shop\";}s:5:\"trace\";a:1:{i:0;s:11:\"yunphp_shop\";}s:5:\"click\";a:1:{i:0;s:11:\"yunphp_shop\";}s:4:\"view\";a:1:{i:0;s:11:\"yunphp_shop\";}s:14:\"merchant_order\";a:1:{i:0;s:11:\"yunphp_shop\";}}');
INSERT INTO `ims_core_cache` VALUES ('setting', 'a:7:{s:8:\"authmode\";i:1;s:5:\"close\";a:2:{s:6:\"status\";s:1:\"0\";s:6:\"reason\";s:0:\"\";}s:9:\"copyright\";a:37:{s:6:\"status\";i:0;s:10:\"verifycode\";N;s:6:\"reason\";s:0:\"\";s:8:\"sitename\";s:0:\"\";s:3:\"url\";s:7:\"http://\";s:8:\"statcode\";s:0:\"\";s:10:\"footerleft\";s:0:\"\";s:11:\"footerright\";s:0:\"\";s:4:\"icon\";s:0:\"\";s:5:\"flogo\";s:0:\"\";s:14:\"background_img\";s:0:\"\";s:6:\"slides\";s:216:\"a:3:{i:0;s:58:\"https://img.alicdn.com/tps/TB1pfG4IFXXXXc6XXXXXXXXXXXX.jpg\";i:1;s:58:\"https://img.alicdn.com/tps/TB1sXGYIFXXXXc5XpXXXXXXXXXX.jpg\";i:2;s:58:\"https://img.alicdn.com/tps/TB1h9xxIFXXXXbKXXXXXXXXXXXX.jpg\";}\";s:6:\"notice\";s:0:\"\";s:5:\"blogo\";s:0:\"\";s:8:\"baidumap\";a:2:{s:3:\"lng\";s:10:\"116.403851\";s:3:\"lat\";s:9:\"39.915177\";}s:7:\"company\";s:0:\"\";s:14:\"companyprofile\";s:0:\"\";s:7:\"address\";s:0:\"\";s:6:\"person\";s:0:\"\";s:5:\"phone\";s:0:\"\";s:2:\"qq\";s:0:\"\";s:5:\"email\";s:0:\"\";s:8:\"keywords\";s:0:\"\";s:11:\"description\";s:0:\"\";s:12:\"showhomepage\";i:0;s:13:\"leftmenufixed\";i:0;s:13:\"mobile_status\";N;s:10:\"login_type\";N;s:10:\"log_status\";i:0;s:14:\"develop_status\";i:1;s:3:\"icp\";s:0:\"\";s:8:\"sms_name\";s:0:\"\";s:12:\"sms_password\";s:0:\"\";s:8:\"sms_sign\";s:0:\"\";s:4:\"bind\";N;s:12:\"welcome_link\";N;s:10:\"oauth_bind\";N;}s:8:\"platform\";a:5:{s:5:\"token\";s:32:\"MZ7X1c79Ex4drjRdycK11x2JN2j1nC4o\";s:14:\"encodingaeskey\";s:43:\"VKyl2SRuzi9K4QaVyAydKSR9FArSius4sSJQsyqk4rP\";s:9:\"appsecret\";s:0:\"\";s:5:\"appid\";s:0:\"\";s:9:\"authstate\";i:1;}s:8:\"register\";a:4:{s:4:\"open\";i:1;s:6:\"verify\";i:0;s:4:\"code\";i:1;s:7:\"groupid\";i:1;}s:18:\"module_receive_ban\";a:0:{}s:5:\"basic\";a:1:{s:8:\"template\";s:5:\"black\";}}');
INSERT INTO `ims_core_cache` VALUES ('we7:module_info:mon_jgg', 'a:32:{s:3:\"mid\";s:2:\"19\";s:4:\"name\";s:7:\"mon_jgg\";s:4:\"type\";s:8:\"activity\";s:5:\"title\";s:15:\"幸运九宫格\";s:7:\"version\";s:5:\"1.6.1\";s:7:\"ability\";s:18:\"幸运九宫格！\";s:11:\"description\";s:18:\"幸运九宫格！\";s:6:\"author\";s:12:\"兔哥资源\";s:3:\"url\";s:22:\"http://www.tubaoge.com\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";a:0:{}s:7:\"handles\";a:1:{i:0;s:4:\"text\";}s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"0\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:6:\"a:0:{}\";s:13:\"title_initial\";s:1:\"X\";s:13:\"wxapp_support\";s:1:\"1\";s:15:\"welcome_support\";s:1:\"1\";s:10:\"oauth_type\";s:1:\"1\";s:14:\"webapp_support\";s:1:\"1\";s:16:\"phoneapp_support\";s:1:\"1\";s:15:\"account_support\";s:1:\"2\";s:13:\"xzapp_support\";s:1:\"1\";s:11:\"app_support\";s:1:\"0\";s:14:\"aliapp_support\";s:1:\"1\";s:9:\"isdisplay\";i:1;s:4:\"logo\";s:53:\"http://mywe7.com/addons/mon_jgg/icon.jpg?v=1559274568\";s:7:\"preview\";s:43:\"http://mywe7.com/addons/mon_jgg/preview.jpg\";s:11:\"main_module\";b:0;s:11:\"plugin_list\";a:0:{}}');
INSERT INTO `ims_core_cache` VALUES ('we7:module_info:jizan', 'a:32:{s:3:\"mid\";s:2:\"18\";s:4:\"name\";s:5:\"jizan\";s:4:\"type\";s:8:\"business\";s:5:\"title\";s:6:\"集赞\";s:7:\"version\";s:5:\"7.0.4\";s:7:\"ability\";s:6:\"集赞\";s:11:\"description\";s:6:\"集赞\";s:6:\"author\";s:20:\"WeEngine Team & ewei\";s:3:\"url\";s:0:\"\";s:8:\"settings\";s:1:\"1\";s:10:\"subscribes\";a:0:{}s:7:\"handles\";a:1:{i:0;s:4:\"text\";}s:12:\"isrulefields\";s:1:\"0\";s:8:\"issystem\";s:1:\"0\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:2:\"N;\";s:13:\"title_initial\";s:1:\"J\";s:13:\"wxapp_support\";s:1:\"1\";s:15:\"welcome_support\";s:1:\"1\";s:10:\"oauth_type\";s:1:\"1\";s:14:\"webapp_support\";s:1:\"1\";s:16:\"phoneapp_support\";s:1:\"1\";s:15:\"account_support\";s:1:\"2\";s:13:\"xzapp_support\";s:1:\"1\";s:11:\"app_support\";s:1:\"0\";s:14:\"aliapp_support\";s:1:\"1\";s:9:\"isdisplay\";i:1;s:4:\"logo\";s:51:\"http://mywe7.com/addons/jizan/icon.jpg?v=1559121524\";s:7:\"preview\";s:41:\"http://mywe7.com/addons/jizan/preview.jpg\";s:11:\"main_module\";b:0;s:11:\"plugin_list\";a:1:{i:0;s:27:\"ewei_shopping_plugin_notice\";}}');
INSERT INTO `ims_core_cache` VALUES ('we7:module_setting:jizan:7', 'a:1:{s:6:\"module\";s:5:\"jizan\";}');
INSERT INTO `ims_core_cache` VALUES ('we7:module_info:demo_app', 'a:32:{s:3:\"mid\";s:2:\"17\";s:4:\"name\";s:8:\"demo_app\";s:4:\"type\";s:8:\"business\";s:5:\"title\";s:9:\"微商城\";s:7:\"version\";s:5:\"7.0.4\";s:7:\"ability\";s:9:\"微商城\";s:11:\"description\";s:9:\"微商城\";s:6:\"author\";s:20:\"WeEngine Team & ewei\";s:3:\"url\";s:0:\"\";s:8:\"settings\";s:1:\"1\";s:10:\"subscribes\";a:0:{}s:7:\"handles\";a:1:{i:0;s:4:\"text\";}s:12:\"isrulefields\";s:1:\"0\";s:8:\"issystem\";s:1:\"0\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:2:\"N;\";s:13:\"title_initial\";s:1:\"W\";s:13:\"wxapp_support\";s:1:\"1\";s:15:\"welcome_support\";s:1:\"1\";s:10:\"oauth_type\";s:1:\"1\";s:14:\"webapp_support\";s:1:\"1\";s:16:\"phoneapp_support\";s:1:\"1\";s:15:\"account_support\";s:1:\"2\";s:13:\"xzapp_support\";s:1:\"1\";s:11:\"app_support\";s:1:\"0\";s:14:\"aliapp_support\";s:1:\"1\";s:9:\"isdisplay\";i:1;s:4:\"logo\";s:54:\"http://mywe7.com/addons/demo_app/icon.jpg?v=1559121524\";s:7:\"preview\";s:44:\"http://mywe7.com/addons/demo_app/preview.jpg\";s:11:\"main_module\";b:0;s:11:\"plugin_list\";a:1:{i:0;s:27:\"ewei_shopping_plugin_notice\";}}');
INSERT INTO `ims_core_cache` VALUES ('we7:module_setting:demo_app:7', 'a:1:{s:6:\"module\";s:8:\"demo_app\";}');
INSERT INTO `ims_core_cache` VALUES ('we7:module_info:yunphp_shop', 'a:32:{s:3:\"mid\";s:2:\"16\";s:4:\"name\";s:11:\"yunphp_shop\";s:4:\"type\";s:8:\"business\";s:5:\"title\";s:9:\"YUN商城\";s:7:\"version\";s:5:\"2.9.4\";s:7:\"ability\";s:84:\"YUN商城(分销),多用户分权，淘宝商品一键转换，多种插件支持。\";s:11:\"description\";s:71:\"YUN商城(分销)，多项信息模板，强大的自定义规格设置\";s:6:\"author\";s:9:\"YUN商城\";s:3:\"url\";s:19:\"http://bbs.3r86.com\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";a:14:{i:0;s:4:\"text\";i:1;s:5:\"image\";i:2;s:5:\"voice\";i:3;s:5:\"video\";i:4;s:10:\"shortvideo\";i:5;s:8:\"location\";i:6;s:4:\"link\";i:7;s:9:\"subscribe\";i:8;s:11:\"unsubscribe\";i:9;s:2:\"qr\";i:10;s:5:\"trace\";i:11;s:5:\"click\";i:12;s:4:\"view\";i:13;s:14:\"merchant_order\";}s:7:\"handles\";a:12:{i:0;s:4:\"text\";i:1;s:5:\"image\";i:2;s:5:\"voice\";i:3;s:5:\"video\";i:4;s:10:\"shortvideo\";i:5;s:8:\"location\";i:6;s:4:\"link\";i:7;s:9:\"subscribe\";i:8;s:2:\"qr\";i:9;s:5:\"trace\";i:10;s:5:\"click\";i:11;s:14:\"merchant_order\";}s:12:\"isrulefields\";s:1:\"0\";s:8:\"issystem\";s:1:\"0\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:6:\"a:0:{}\";s:13:\"title_initial\";s:1:\"Y\";s:13:\"wxapp_support\";s:1:\"1\";s:15:\"welcome_support\";s:1:\"1\";s:10:\"oauth_type\";s:1:\"1\";s:14:\"webapp_support\";s:1:\"1\";s:16:\"phoneapp_support\";s:1:\"1\";s:15:\"account_support\";s:1:\"2\";s:13:\"xzapp_support\";s:1:\"1\";s:11:\"app_support\";s:1:\"0\";s:14:\"aliapp_support\";s:1:\"1\";s:9:\"isdisplay\";i:1;s:4:\"logo\";s:57:\"http://mywe7.com/addons/yunphp_shop/icon.jpg?v=1559121524\";s:7:\"preview\";s:47:\"http://mywe7.com/addons/yunphp_shop/preview.jpg\";s:11:\"main_module\";b:0;s:11:\"plugin_list\";a:0:{}}');
INSERT INTO `ims_core_cache` VALUES ('we7:module_setting:yunphp_shop:7', 'a:1:{s:6:\"module\";s:11:\"yunphp_shop\";}');
INSERT INTO `ims_core_cache` VALUES ('we7:module_info:deam_food', 'a:32:{s:3:\"mid\";s:2:\"14\";s:4:\"name\";s:9:\"deam_food\";s:4:\"type\";s:3:\"biz\";s:5:\"title\";s:18:\"自助点餐程序\";s:7:\"version\";s:6:\"1.0.44\";s:7:\"ability\";s:21:\"自助点餐小程序\";s:11:\"description\";s:21:\"自助点餐小程序\";s:6:\"author\";s:12:\"兔宝资源\";s:3:\"url\";s:23:\"https://bbs.tubaoge.com\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";a:5:{i:0;s:13:\"user_get_card\";i:1;s:15:\"card_pass_check\";i:2;s:17:\"user_gifting_card\";i:3;s:13:\"user_del_card\";i:4;s:17:\"user_consume_card\";}s:7:\"handles\";a:0:{}s:12:\"isrulefields\";s:1:\"0\";s:8:\"issystem\";s:1:\"0\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:2:\"N;\";s:13:\"title_initial\";s:1:\"Z\";s:13:\"wxapp_support\";s:1:\"2\";s:15:\"welcome_support\";s:1:\"1\";s:10:\"oauth_type\";s:1:\"1\";s:14:\"webapp_support\";s:1:\"1\";s:16:\"phoneapp_support\";s:1:\"1\";s:15:\"account_support\";s:1:\"1\";s:13:\"xzapp_support\";s:1:\"1\";s:11:\"app_support\";s:1:\"0\";s:14:\"aliapp_support\";s:1:\"1\";s:9:\"isdisplay\";i:1;s:4:\"logo\";s:55:\"http://mywe7.com/addons/deam_food/icon.jpg?v=1559121524\";s:7:\"preview\";s:45:\"http://mywe7.com/addons/deam_food/preview.jpg\";s:11:\"main_module\";b:0;s:11:\"plugin_list\";a:0:{}}');
INSERT INTO `ims_core_cache` VALUES ('we7:module_setting:deam_food:7', 'a:1:{s:6:\"module\";s:9:\"deam_food\";}');
INSERT INTO `ims_core_cache` VALUES ('we7:module_info:store', 'a:32:{s:3:\"mid\";s:2:\"12\";s:4:\"name\";s:5:\"store\";s:4:\"type\";s:8:\"business\";s:5:\"title\";s:12:\"站内商城\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:12:\"站内商城\";s:11:\"description\";s:12:\"站内商城\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"0\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:13:\"title_initial\";s:0:\"\";s:13:\"wxapp_support\";s:1:\"1\";s:15:\"welcome_support\";s:1:\"1\";s:10:\"oauth_type\";s:1:\"1\";s:14:\"webapp_support\";s:1:\"1\";s:16:\"phoneapp_support\";s:1:\"0\";s:15:\"account_support\";s:1:\"2\";s:13:\"xzapp_support\";s:1:\"0\";s:11:\"app_support\";s:1:\"0\";s:14:\"aliapp_support\";s:1:\"0\";s:9:\"isdisplay\";i:1;s:4:\"logo\";s:51:\"http://mywe7.com/addons/store/icon.jpg?v=1559121524\";s:7:\"preview\";s:41:\"http://mywe7.com/addons/store/preview.jpg\";s:11:\"main_module\";b:0;s:11:\"plugin_list\";a:0:{}}');
INSERT INTO `ims_core_cache` VALUES ('we7:module_setting:store:7', 'a:1:{s:6:\"module\";s:5:\"store\";}');
INSERT INTO `ims_core_cache` VALUES ('we7:module_info:wxcard', 'a:32:{s:3:\"mid\";s:2:\"11\";s:4:\"name\";s:6:\"wxcard\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:18:\"微信卡券回复\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:18:\"微信卡券回复\";s:11:\"description\";s:18:\"微信卡券回复\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:13:\"title_initial\";s:0:\"\";s:13:\"wxapp_support\";s:1:\"1\";s:15:\"welcome_support\";s:1:\"1\";s:10:\"oauth_type\";s:1:\"1\";s:14:\"webapp_support\";s:1:\"1\";s:16:\"phoneapp_support\";s:1:\"0\";s:15:\"account_support\";s:1:\"2\";s:13:\"xzapp_support\";s:1:\"0\";s:11:\"app_support\";s:1:\"0\";s:14:\"aliapp_support\";s:1:\"0\";s:9:\"isdisplay\";i:1;s:4:\"logo\";s:52:\"http://mywe7.com/addons/wxcard/icon.jpg?v=1559121524\";s:7:\"preview\";s:42:\"http://mywe7.com/addons/wxcard/preview.jpg\";s:11:\"main_module\";b:0;s:11:\"plugin_list\";a:0:{}}');
INSERT INTO `ims_core_cache` VALUES ('we7:module_setting:wxcard:7', 'a:1:{s:6:\"module\";s:6:\"wxcard\";}');
INSERT INTO `ims_core_cache` VALUES ('we7:module_info:chats', 'a:32:{s:3:\"mid\";s:2:\"10\";s:4:\"name\";s:5:\"chats\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:18:\"发送客服消息\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:77:\"公众号可以在粉丝最后发送消息的48小时内无限制发送消息\";s:11:\"description\";s:0:\"\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"0\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:13:\"title_initial\";s:0:\"\";s:13:\"wxapp_support\";s:1:\"1\";s:15:\"welcome_support\";s:1:\"1\";s:10:\"oauth_type\";s:1:\"1\";s:14:\"webapp_support\";s:1:\"1\";s:16:\"phoneapp_support\";s:1:\"0\";s:15:\"account_support\";s:1:\"2\";s:13:\"xzapp_support\";s:1:\"0\";s:11:\"app_support\";s:1:\"0\";s:14:\"aliapp_support\";s:1:\"0\";s:9:\"isdisplay\";i:1;s:4:\"logo\";s:51:\"http://mywe7.com/addons/chats/icon.jpg?v=1559121524\";s:7:\"preview\";s:41:\"http://mywe7.com/addons/chats/preview.jpg\";s:11:\"main_module\";b:0;s:11:\"plugin_list\";a:0:{}}');
INSERT INTO `ims_core_cache` VALUES ('we7:module_setting:chats:7', 'a:1:{s:6:\"module\";s:5:\"chats\";}');
INSERT INTO `ims_core_cache` VALUES ('we7:module_info:voice', 'a:32:{s:3:\"mid\";s:1:\"9\";s:4:\"name\";s:5:\"voice\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:18:\"基本语音回复\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:18:\"提供语音回复\";s:11:\"description\";s:132:\"在回复规则中可选择具有语音的回复内容，并根据用户所设置的特定关键字精准的返回给粉丝语音。\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:13:\"title_initial\";s:0:\"\";s:13:\"wxapp_support\";s:1:\"1\";s:15:\"welcome_support\";s:1:\"1\";s:10:\"oauth_type\";s:1:\"1\";s:14:\"webapp_support\";s:1:\"1\";s:16:\"phoneapp_support\";s:1:\"0\";s:15:\"account_support\";s:1:\"2\";s:13:\"xzapp_support\";s:1:\"0\";s:11:\"app_support\";s:1:\"0\";s:14:\"aliapp_support\";s:1:\"0\";s:9:\"isdisplay\";i:1;s:4:\"logo\";s:51:\"http://mywe7.com/addons/voice/icon.jpg?v=1559121524\";s:7:\"preview\";s:41:\"http://mywe7.com/addons/voice/preview.jpg\";s:11:\"main_module\";b:0;s:11:\"plugin_list\";a:0:{}}');
INSERT INTO `ims_core_cache` VALUES ('we7:module_setting:voice:7', 'a:1:{s:6:\"module\";s:5:\"voice\";}');
INSERT INTO `ims_core_cache` VALUES ('we7:module_info:video', 'a:32:{s:3:\"mid\";s:1:\"8\";s:4:\"name\";s:5:\"video\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:18:\"基本视频回复\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:18:\"提供图片回复\";s:11:\"description\";s:132:\"在回复规则中可选择具有视频的回复内容，并根据用户所设置的特定关键字精准的返回给粉丝视频。\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:13:\"title_initial\";s:0:\"\";s:13:\"wxapp_support\";s:1:\"1\";s:15:\"welcome_support\";s:1:\"1\";s:10:\"oauth_type\";s:1:\"1\";s:14:\"webapp_support\";s:1:\"1\";s:16:\"phoneapp_support\";s:1:\"0\";s:15:\"account_support\";s:1:\"2\";s:13:\"xzapp_support\";s:1:\"0\";s:11:\"app_support\";s:1:\"0\";s:14:\"aliapp_support\";s:1:\"0\";s:9:\"isdisplay\";i:1;s:4:\"logo\";s:51:\"http://mywe7.com/addons/video/icon.jpg?v=1559121524\";s:7:\"preview\";s:41:\"http://mywe7.com/addons/video/preview.jpg\";s:11:\"main_module\";b:0;s:11:\"plugin_list\";a:0:{}}');
INSERT INTO `ims_core_cache` VALUES ('we7:module_setting:video:7', 'a:1:{s:6:\"module\";s:5:\"video\";}');
INSERT INTO `ims_core_cache` VALUES ('we7:module_info:images', 'a:32:{s:3:\"mid\";s:1:\"7\";s:4:\"name\";s:6:\"images\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:18:\"基本图片回复\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:18:\"提供图片回复\";s:11:\"description\";s:132:\"在回复规则中可选择具有图片的回复内容，并根据用户所设置的特定关键字精准的返回给粉丝图片。\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:13:\"title_initial\";s:0:\"\";s:13:\"wxapp_support\";s:1:\"1\";s:15:\"welcome_support\";s:1:\"1\";s:10:\"oauth_type\";s:1:\"1\";s:14:\"webapp_support\";s:1:\"1\";s:16:\"phoneapp_support\";s:1:\"0\";s:15:\"account_support\";s:1:\"2\";s:13:\"xzapp_support\";s:1:\"0\";s:11:\"app_support\";s:1:\"0\";s:14:\"aliapp_support\";s:1:\"0\";s:9:\"isdisplay\";i:1;s:4:\"logo\";s:52:\"http://mywe7.com/addons/images/icon.jpg?v=1559121524\";s:7:\"preview\";s:42:\"http://mywe7.com/addons/images/preview.jpg\";s:11:\"main_module\";b:0;s:11:\"plugin_list\";a:0:{}}');
INSERT INTO `ims_core_cache` VALUES ('we7:module_setting:images:7', 'a:1:{s:6:\"module\";s:6:\"images\";}');
INSERT INTO `ims_core_cache` VALUES ('we7:module_info:custom', 'a:32:{s:3:\"mid\";s:1:\"6\";s:4:\"name\";s:6:\"custom\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:15:\"多客服转接\";s:7:\"version\";s:5:\"1.0.0\";s:7:\"ability\";s:36:\"用来接入腾讯的多客服系统\";s:11:\"description\";s:0:\"\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:17:\"http://bbs.we7.cc\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";a:0:{}s:7:\"handles\";a:6:{i:0;s:5:\"image\";i:1;s:5:\"voice\";i:2;s:5:\"video\";i:3;s:8:\"location\";i:4;s:4:\"link\";i:5;s:4:\"text\";}s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:13:\"title_initial\";s:0:\"\";s:13:\"wxapp_support\";s:1:\"1\";s:15:\"welcome_support\";s:1:\"1\";s:10:\"oauth_type\";s:1:\"1\";s:14:\"webapp_support\";s:1:\"1\";s:16:\"phoneapp_support\";s:1:\"0\";s:15:\"account_support\";s:1:\"2\";s:13:\"xzapp_support\";s:1:\"0\";s:11:\"app_support\";s:1:\"0\";s:14:\"aliapp_support\";s:1:\"0\";s:9:\"isdisplay\";i:1;s:4:\"logo\";s:52:\"http://mywe7.com/addons/custom/icon.jpg?v=1559121524\";s:7:\"preview\";s:42:\"http://mywe7.com/addons/custom/preview.jpg\";s:11:\"main_module\";b:0;s:11:\"plugin_list\";a:0:{}}');
INSERT INTO `ims_core_cache` VALUES ('we7:module_setting:custom:7', 'a:1:{s:6:\"module\";s:6:\"custom\";}');
INSERT INTO `ims_core_cache` VALUES ('we7:module_info:recharge', 'a:32:{s:3:\"mid\";s:1:\"5\";s:4:\"name\";s:8:\"recharge\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:24:\"会员中心充值模块\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:24:\"提供会员充值功能\";s:11:\"description\";s:0:\"\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"0\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:13:\"title_initial\";s:0:\"\";s:13:\"wxapp_support\";s:1:\"1\";s:15:\"welcome_support\";s:1:\"1\";s:10:\"oauth_type\";s:1:\"1\";s:14:\"webapp_support\";s:1:\"1\";s:16:\"phoneapp_support\";s:1:\"0\";s:15:\"account_support\";s:1:\"2\";s:13:\"xzapp_support\";s:1:\"0\";s:11:\"app_support\";s:1:\"0\";s:14:\"aliapp_support\";s:1:\"0\";s:9:\"isdisplay\";i:1;s:4:\"logo\";s:54:\"http://mywe7.com/addons/recharge/icon.jpg?v=1559121524\";s:7:\"preview\";s:44:\"http://mywe7.com/addons/recharge/preview.jpg\";s:11:\"main_module\";b:0;s:11:\"plugin_list\";a:0:{}}');
INSERT INTO `ims_core_cache` VALUES ('we7:module_setting:recharge:7', 'a:1:{s:6:\"module\";s:8:\"recharge\";}');
INSERT INTO `ims_core_cache` VALUES ('we7:module_info:userapi', 'a:32:{s:3:\"mid\";s:1:\"4\";s:4:\"name\";s:7:\"userapi\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:21:\"自定义接口回复\";s:7:\"version\";s:3:\"1.1\";s:7:\"ability\";s:33:\"更方便的第三方接口设置\";s:11:\"description\";s:141:\"自定义接口又称第三方接口，可以让开发者更方便的接入微擎系统，高效的与微信公众平台进行对接整合。\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:13:\"title_initial\";s:0:\"\";s:13:\"wxapp_support\";s:1:\"1\";s:15:\"welcome_support\";s:1:\"1\";s:10:\"oauth_type\";s:1:\"1\";s:14:\"webapp_support\";s:1:\"1\";s:16:\"phoneapp_support\";s:1:\"0\";s:15:\"account_support\";s:1:\"2\";s:13:\"xzapp_support\";s:1:\"0\";s:11:\"app_support\";s:1:\"0\";s:14:\"aliapp_support\";s:1:\"0\";s:9:\"isdisplay\";i:1;s:4:\"logo\";s:53:\"http://mywe7.com/addons/userapi/icon.jpg?v=1559121524\";s:7:\"preview\";s:43:\"http://mywe7.com/addons/userapi/preview.jpg\";s:11:\"main_module\";b:0;s:11:\"plugin_list\";a:0:{}}');
INSERT INTO `ims_core_cache` VALUES ('we7:module_setting:userapi:7', 'a:1:{s:6:\"module\";s:7:\"userapi\";}');
INSERT INTO `ims_core_cache` VALUES ('we7:module_info:music', 'a:32:{s:3:\"mid\";s:1:\"3\";s:4:\"name\";s:5:\"music\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:18:\"基本音乐回复\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:39:\"提供语音、音乐等音频类回复\";s:11:\"description\";s:183:\"在回复规则中可选择具有语音、音乐等音频类的回复内容，并根据用户所设置的特定关键字精准的返回给粉丝，实现一问一答得简单对话。\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:13:\"title_initial\";s:0:\"\";s:13:\"wxapp_support\";s:1:\"1\";s:15:\"welcome_support\";s:1:\"1\";s:10:\"oauth_type\";s:1:\"1\";s:14:\"webapp_support\";s:1:\"1\";s:16:\"phoneapp_support\";s:1:\"0\";s:15:\"account_support\";s:1:\"2\";s:13:\"xzapp_support\";s:1:\"0\";s:11:\"app_support\";s:1:\"0\";s:14:\"aliapp_support\";s:1:\"0\";s:9:\"isdisplay\";i:1;s:4:\"logo\";s:51:\"http://mywe7.com/addons/music/icon.jpg?v=1559121524\";s:7:\"preview\";s:41:\"http://mywe7.com/addons/music/preview.jpg\";s:11:\"main_module\";b:0;s:11:\"plugin_list\";a:0:{}}');
INSERT INTO `ims_core_cache` VALUES ('we7:module_setting:music:7', 'a:1:{s:6:\"module\";s:5:\"music\";}');
INSERT INTO `ims_core_cache` VALUES ('we7:module_info:news', 'a:32:{s:3:\"mid\";s:1:\"2\";s:4:\"name\";s:4:\"news\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:24:\"基本混合图文回复\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:33:\"为你提供生动的图文资讯\";s:11:\"description\";s:272:\"一问一答得简单对话, 但是回复内容包括图片文字等更生动的媒体内容. 当访客的对话语句中包含指定关键字, 或对话语句完全等于特定关键字, 或符合某些特定的格式时. 系统自动应答设定好的图文回复内容.\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:13:\"title_initial\";s:0:\"\";s:13:\"wxapp_support\";s:1:\"1\";s:15:\"welcome_support\";s:1:\"1\";s:10:\"oauth_type\";s:1:\"1\";s:14:\"webapp_support\";s:1:\"1\";s:16:\"phoneapp_support\";s:1:\"0\";s:15:\"account_support\";s:1:\"2\";s:13:\"xzapp_support\";s:1:\"0\";s:11:\"app_support\";s:1:\"0\";s:14:\"aliapp_support\";s:1:\"0\";s:9:\"isdisplay\";i:1;s:4:\"logo\";s:50:\"http://mywe7.com/addons/news/icon.jpg?v=1559121524\";s:7:\"preview\";s:40:\"http://mywe7.com/addons/news/preview.jpg\";s:11:\"main_module\";b:0;s:11:\"plugin_list\";a:0:{}}');
INSERT INTO `ims_core_cache` VALUES ('we7:module_setting:news:7', 'a:1:{s:6:\"module\";s:4:\"news\";}');
INSERT INTO `ims_core_cache` VALUES ('we7:module_info:basic', 'a:32:{s:3:\"mid\";s:1:\"1\";s:4:\"name\";s:5:\"basic\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:18:\"基本文字回复\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:24:\"和您进行简单对话\";s:11:\"description\";s:201:\"一问一答得简单对话. 当访客的对话语句中包含指定关键字, 或对话语句完全等于特定关键字, 或符合某些特定的格式时. 系统自动应答设定好的回复内容.\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:13:\"title_initial\";s:0:\"\";s:13:\"wxapp_support\";s:1:\"1\";s:15:\"welcome_support\";s:1:\"1\";s:10:\"oauth_type\";s:1:\"1\";s:14:\"webapp_support\";s:1:\"1\";s:16:\"phoneapp_support\";s:1:\"0\";s:15:\"account_support\";s:1:\"2\";s:13:\"xzapp_support\";s:1:\"0\";s:11:\"app_support\";s:1:\"0\";s:14:\"aliapp_support\";s:1:\"0\";s:9:\"isdisplay\";i:1;s:4:\"logo\";s:51:\"http://mywe7.com/addons/basic/icon.jpg?v=1559121524\";s:7:\"preview\";s:41:\"http://mywe7.com/addons/basic/preview.jpg\";s:11:\"main_module\";b:0;s:11:\"plugin_list\";a:0:{}}');
INSERT INTO `ims_core_cache` VALUES ('we7:module_setting:basic:7', 'a:1:{s:6:\"module\";s:5:\"basic\";}');
INSERT INTO `ims_core_cache` VALUES ('we7:system_frame:7', 'a:12:{s:8:\"platform\";a:7:{s:5:\"title\";s:6:\"平台\";s:4:\"icon\";s:14:\"wi wi-platform\";s:3:\"url\";s:44:\"./index.php?c=account&a=display&do=platform&\";s:7:\"section\";a:0:{}s:9:\"is_system\";b:1;s:10:\"is_display\";b:1;s:12:\"displayorder\";i:2;}s:7:\"account\";a:7:{s:5:\"title\";s:9:\"公众号\";s:4:\"icon\";s:18:\"wi wi-white-collar\";s:3:\"url\";s:41:\"./index.php?c=home&a=welcome&do=platform&\";s:7:\"section\";a:5:{s:13:\"platform_plus\";a:3:{s:5:\"title\";s:12:\"增强功能\";s:4:\"menu\";a:5:{s:14:\"platform_reply\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:0;s:5:\"title\";s:12:\"自动回复\";s:3:\"url\";s:31:\"./index.php?c=platform&a=reply&\";s:15:\"permission_name\";s:14:\"platform_reply\";s:4:\"icon\";s:11:\"wi wi-reply\";s:12:\"displayorder\";i:5;s:2:\"id\";N;s:14:\"sub_permission\";a:0:{}}s:13:\"platform_menu\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:0;s:5:\"title\";s:15:\"自定义菜单\";s:3:\"url\";s:38:\"./index.php?c=platform&a=menu&do=post&\";s:15:\"permission_name\";s:13:\"platform_menu\";s:4:\"icon\";s:16:\"wi wi-custommenu\";s:12:\"displayorder\";i:4;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:11:\"platform_qr\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:0;s:5:\"title\";s:22:\"二维码/转化链接\";s:3:\"url\";s:28:\"./index.php?c=platform&a=qr&\";s:15:\"permission_name\";s:11:\"platform_qr\";s:4:\"icon\";s:12:\"wi wi-qrcode\";s:12:\"displayorder\";i:3;s:2:\"id\";N;s:14:\"sub_permission\";a:0:{}}s:17:\"platform_material\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:0;s:5:\"title\";s:16:\"素材/编辑器\";s:3:\"url\";s:34:\"./index.php?c=platform&a=material&\";s:15:\"permission_name\";s:17:\"platform_material\";s:4:\"icon\";s:12:\"wi wi-redact\";s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";a:2:{i:0;a:3:{s:5:\"title\";s:13:\"添加/编辑\";s:3:\"url\";s:39:\"./index.php?c=platform&a=material-post&\";s:15:\"permission_name\";s:13:\"material_post\";}i:1;a:2:{s:5:\"title\";s:6:\"删除\";s:15:\"permission_name\";s:24:\"platform_material_delete\";}}}s:13:\"platform_site\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:0;s:5:\"title\";s:16:\"微官网-文章\";s:3:\"url\";s:38:\"./index.php?c=site&a=multi&do=display&\";s:15:\"permission_name\";s:13:\"platform_site\";s:4:\"icon\";s:10:\"wi wi-home\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";a:0:{}}}s:10:\"is_display\";i:0;}s:15:\"platform_module\";a:3:{s:5:\"title\";s:12:\"应用模块\";s:4:\"menu\";a:0:{}s:10:\"is_display\";b:1;}s:2:\"mc\";a:3:{s:5:\"title\";s:6:\"粉丝\";s:4:\"menu\";a:2:{s:7:\"mc_fans\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:0;s:5:\"title\";s:12:\"粉丝管理\";s:3:\"url\";s:24:\"./index.php?c=mc&a=fans&\";s:15:\"permission_name\";s:7:\"mc_fans\";s:4:\"icon\";s:16:\"wi wi-fansmanage\";s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:9:\"mc_member\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:0;s:5:\"title\";s:12:\"会员管理\";s:3:\"url\";s:26:\"./index.php?c=mc&a=member&\";s:15:\"permission_name\";s:9:\"mc_member\";s:4:\"icon\";s:10:\"wi wi-fans\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}s:10:\"is_display\";i:0;}s:7:\"profile\";a:3:{s:5:\"title\";s:6:\"配置\";s:4:\"menu\";a:4:{s:7:\"profile\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:0;s:5:\"title\";s:12:\"参数配置\";s:3:\"url\";s:31:\"./index.php?c=profile&a=remote&\";s:15:\"permission_name\";s:15:\"profile_setting\";s:4:\"icon\";s:23:\"wi wi-parameter-setting\";s:12:\"displayorder\";i:4;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:7:\"payment\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:0;s:5:\"title\";s:12:\"支付参数\";s:3:\"url\";s:32:\"./index.php?c=profile&a=payment&\";s:15:\"permission_name\";s:19:\"profile_pay_setting\";s:4:\"icon\";s:17:\"wi wi-pay-setting\";s:12:\"displayorder\";i:3;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:15:\"app_module_link\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:0;s:5:\"title\";s:12:\"数据同步\";s:3:\"url\";s:44:\"./index.php?c=profile&a=module-link-uniacid&\";s:15:\"permission_name\";s:31:\"profile_app_module_link_uniacid\";s:4:\"icon\";s:18:\"wi wi-data-synchro\";s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:11:\"bind_domain\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:0;s:5:\"title\";s:12:\"域名绑定\";s:3:\"url\";s:36:\"./index.php?c=profile&a=bind-domain&\";s:15:\"permission_name\";s:19:\"profile_bind_domain\";s:4:\"icon\";s:17:\"wi wi-bind-domain\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}s:10:\"is_display\";i:0;}s:10:\"statistics\";a:3:{s:5:\"title\";s:6:\"统计\";s:4:\"menu\";a:2:{s:14:\"statistics_app\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:0;s:5:\"title\";s:12:\"访问统计\";s:3:\"url\";s:31:\"./index.php?c=statistics&a=app&\";s:15:\"permission_name\";s:14:\"statistics_app\";s:4:\"icon\";s:17:\"wi wi-statistical\";s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:15:\"statistics_fans\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:0;s:5:\"title\";s:12:\"用户统计\";s:3:\"url\";s:32:\"./index.php?c=statistics&a=fans&\";s:15:\"permission_name\";s:15:\"statistics_fans\";s:4:\"icon\";s:17:\"wi wi-statistical\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}s:10:\"is_display\";i:0;}}s:9:\"is_system\";b:1;s:10:\"is_display\";b:1;s:12:\"displayorder\";i:3;}s:5:\"wxapp\";a:7:{s:5:\"title\";s:15:\"微信小程序\";s:4:\"icon\";s:19:\"wi wi-small-routine\";s:3:\"url\";s:38:\"./index.php?c=wxapp&a=display&do=home&\";s:7:\"section\";a:5:{s:14:\"wxapp_entrance\";a:3:{s:5:\"title\";s:15:\"小程序入口\";s:4:\"menu\";a:1:{s:20:\"module_entrance_link\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:0;s:5:\"title\";s:12:\"入口页面\";s:3:\"url\";s:36:\"./index.php?c=wxapp&a=entrance-link&\";s:15:\"permission_name\";s:19:\"wxapp_entrance_link\";s:4:\"icon\";s:18:\"wi wi-data-synchro\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}s:10:\"is_display\";i:0;}s:15:\"platform_module\";a:3:{s:5:\"title\";s:6:\"应用\";s:4:\"menu\";a:0:{}s:10:\"is_display\";b:1;}s:2:\"mc\";a:3:{s:5:\"title\";s:6:\"粉丝\";s:4:\"menu\";a:1:{s:12:\"wxapp_member\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:0;s:5:\"title\";s:6:\"会员\";s:3:\"url\";s:26:\"./index.php?c=mc&a=member&\";s:15:\"permission_name\";s:12:\"wxapp_member\";s:4:\"icon\";s:10:\"wi wi-fans\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}s:10:\"is_display\";i:0;}s:13:\"wxapp_profile\";a:2:{s:5:\"title\";s:6:\"配置\";s:4:\"menu\";a:5:{s:17:\"wxapp_module_link\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:0;s:5:\"title\";s:12:\"数据同步\";s:3:\"url\";s:42:\"./index.php?c=wxapp&a=module-link-uniacid&\";s:15:\"permission_name\";s:25:\"wxapp_module_link_uniacid\";s:4:\"icon\";s:18:\"wi wi-data-synchro\";s:12:\"displayorder\";i:5;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:13:\"wxapp_payment\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:0;s:5:\"title\";s:12:\"支付参数\";s:3:\"url\";s:30:\"./index.php?c=wxapp&a=payment&\";s:15:\"permission_name\";s:13:\"wxapp_payment\";s:4:\"icon\";s:16:\"wi wi-appsetting\";s:12:\"displayorder\";i:4;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:14:\"front_download\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:18:\"上传微信审核\";s:3:\"url\";s:37:\"./index.php?c=wxapp&a=front-download&\";s:15:\"permission_name\";s:20:\"wxapp_front_download\";s:4:\"icon\";s:13:\"wi wi-examine\";s:12:\"displayorder\";i:3;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:17:\"parameter_setting\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:0;s:5:\"title\";s:12:\"参数配置\";s:3:\"url\";s:31:\"./index.php?c=profile&a=remote&\";s:15:\"permission_name\";s:13:\"wxapp_setting\";s:4:\"icon\";s:23:\"wi wi-parameter-setting\";s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:23:\"wxapp_platform_material\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:0;s:5:\"title\";s:12:\"素材管理\";s:3:\"url\";N;s:15:\"permission_name\";s:23:\"wxapp_platform_material\";s:4:\"icon\";N;s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";a:1:{i:0;a:2:{s:5:\"title\";s:6:\"删除\";s:15:\"permission_name\";s:30:\"wxapp_platform_material_delete\";}}}}}s:10:\"statistics\";a:3:{s:5:\"title\";s:6:\"统计\";s:4:\"menu\";a:1:{s:15:\"statistics_fans\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:0;s:5:\"title\";s:12:\"访问统计\";s:3:\"url\";s:33:\"./index.php?c=wxapp&a=statistics&\";s:15:\"permission_name\";s:15:\"statistics_fans\";s:4:\"icon\";s:17:\"wi wi-statistical\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}s:10:\"is_display\";i:0;}}s:9:\"is_system\";b:1;s:10:\"is_display\";b:1;s:12:\"displayorder\";i:4;}s:6:\"webapp\";a:7:{s:5:\"title\";s:2:\"PC\";s:4:\"icon\";s:8:\"wi wi-pc\";s:3:\"url\";s:39:\"./index.php?c=webapp&a=home&do=display&\";s:7:\"section\";a:4:{s:15:\"platform_module\";a:3:{s:5:\"title\";s:12:\"应用模块\";s:4:\"menu\";a:0:{}s:10:\"is_display\";b:1;}s:2:\"mc\";a:2:{s:5:\"title\";s:6:\"粉丝\";s:4:\"menu\";a:1:{s:9:\"mc_member\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"会员管理\";s:3:\"url\";s:26:\"./index.php?c=mc&a=member&\";s:15:\"permission_name\";s:9:\"mc_member\";s:4:\"icon\";s:10:\"wi wi-fans\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}}s:6:\"webapp\";a:2:{s:5:\"title\";s:6:\"配置\";s:4:\"menu\";a:3:{s:18:\"webapp_module_link\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"数据同步\";s:3:\"url\";s:43:\"./index.php?c=webapp&a=module-link-uniacid&\";s:15:\"permission_name\";s:26:\"webapp_module_link_uniacid\";s:4:\"icon\";s:18:\"wi wi-data-synchro\";s:12:\"displayorder\";i:3;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:14:\"webapp_rewrite\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:9:\"伪静态\";s:3:\"url\";s:31:\"./index.php?c=webapp&a=rewrite&\";s:15:\"permission_name\";s:14:\"webapp_rewrite\";s:4:\"icon\";s:13:\"wi wi-rewrite\";s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:18:\"webapp_bind_domain\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:18:\"域名访问设置\";s:3:\"url\";s:35:\"./index.php?c=webapp&a=bind-domain&\";s:15:\"permission_name\";s:18:\"webapp_bind_domain\";s:4:\"icon\";s:17:\"wi wi-bind-domain\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}}s:10:\"statistics\";a:2:{s:5:\"title\";s:6:\"统计\";s:4:\"menu\";a:1:{s:14:\"statistics_app\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"访问统计\";s:3:\"url\";s:31:\"./index.php?c=statistics&a=app&\";s:15:\"permission_name\";s:14:\"statistics_app\";s:4:\"icon\";s:17:\"wi wi-statistical\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}}}s:9:\"is_system\";b:1;s:10:\"is_display\";b:1;s:12:\"displayorder\";i:5;}s:8:\"phoneapp\";a:7:{s:5:\"title\";s:3:\"APP\";s:4:\"icon\";s:18:\"wi wi-white-collar\";s:3:\"url\";s:41:\"./index.php?c=phoneapp&a=display&do=home&\";s:7:\"section\";a:2:{s:15:\"platform_module\";a:3:{s:5:\"title\";s:6:\"应用\";s:4:\"menu\";a:0:{}s:10:\"is_display\";b:1;}s:16:\"phoneapp_profile\";a:2:{s:5:\"title\";s:6:\"配置\";s:4:\"menu\";a:1:{s:14:\"front_download\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:9:\"下载APP\";s:3:\"url\";s:40:\"./index.php?c=phoneapp&a=front-download&\";s:15:\"permission_name\";s:23:\"phoneapp_front_download\";s:4:\"icon\";s:13:\"wi wi-examine\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}}}s:9:\"is_system\";b:1;s:10:\"is_display\";b:1;s:12:\"displayorder\";i:6;}s:5:\"xzapp\";a:7:{s:5:\"title\";s:9:\"熊掌号\";s:4:\"icon\";s:18:\"wi wi-white-collar\";s:3:\"url\";s:38:\"./index.php?c=xzapp&a=home&do=display&\";s:7:\"section\";a:1:{s:15:\"platform_module\";a:3:{s:5:\"title\";s:12:\"应用模块\";s:4:\"menu\";a:0:{}s:10:\"is_display\";b:1;}}s:9:\"is_system\";b:1;s:10:\"is_display\";b:1;s:12:\"displayorder\";i:7;}s:6:\"aliapp\";a:7:{s:5:\"title\";s:18:\"支付宝小程序\";s:4:\"icon\";s:18:\"wi wi-white-collar\";s:3:\"url\";s:40:\"./index.php?c=miniapp&a=display&do=home&\";s:7:\"section\";a:1:{s:15:\"platform_module\";a:3:{s:5:\"title\";s:6:\"应用\";s:4:\"menu\";a:0:{}s:10:\"is_display\";b:1;}}s:9:\"is_system\";b:1;s:10:\"is_display\";b:1;s:12:\"displayorder\";i:8;}s:6:\"module\";a:7:{s:5:\"title\";s:6:\"应用\";s:4:\"icon\";s:11:\"wi wi-apply\";s:3:\"url\";s:31:\"./index.php?c=module&a=display&\";s:7:\"section\";a:0:{}s:9:\"is_system\";b:1;s:10:\"is_display\";b:1;s:12:\"displayorder\";i:9;}s:6:\"system\";a:7:{s:5:\"title\";s:6:\"系统\";s:4:\"icon\";s:13:\"wi wi-setting\";s:3:\"url\";s:39:\"./index.php?c=home&a=welcome&do=system&\";s:7:\"section\";a:13:{s:10:\"wxplatform\";a:2:{s:5:\"title\";s:9:\"公众号\";s:4:\"menu\";a:4:{s:14:\"system_account\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:16:\" 微信公众号\";s:3:\"url\";s:45:\"./index.php?c=account&a=manage&account_type=1\";s:15:\"permission_name\";s:14:\"system_account\";s:4:\"icon\";s:12:\"wi wi-wechat\";s:12:\"displayorder\";i:4;s:2:\"id\";N;s:14:\"sub_permission\";a:6:{i:0;a:2:{s:5:\"title\";s:21:\"公众号管理设置\";s:15:\"permission_name\";s:21:\"system_account_manage\";}i:1;a:2:{s:5:\"title\";s:15:\"添加公众号\";s:15:\"permission_name\";s:19:\"system_account_post\";}i:2;a:2:{s:5:\"title\";s:15:\"公众号停用\";s:15:\"permission_name\";s:19:\"system_account_stop\";}i:3;a:2:{s:5:\"title\";s:18:\"公众号回收站\";s:15:\"permission_name\";s:22:\"system_account_recycle\";}i:4;a:2:{s:5:\"title\";s:15:\"公众号删除\";s:15:\"permission_name\";s:21:\"system_account_delete\";}i:5;a:2:{s:5:\"title\";s:15:\"公众号恢复\";s:15:\"permission_name\";s:22:\"system_account_recover\";}}}s:13:\"system_module\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:15:\"公众号应用\";s:3:\"url\";s:60:\"./index.php?c=module&a=manage-system&support=account_support\";s:15:\"permission_name\";s:13:\"system_module\";s:4:\"icon\";s:14:\"wi wi-wx-apply\";s:12:\"displayorder\";i:3;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:15:\"system_template\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:15:\"微官网模板\";s:3:\"url\";s:32:\"./index.php?c=system&a=template&\";s:15:\"permission_name\";s:15:\"system_template\";s:4:\"icon\";s:17:\"wi wi-wx-template\";s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:15:\"system_platform\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:19:\" 微信开放平台\";s:3:\"url\";s:32:\"./index.php?c=system&a=platform&\";s:15:\"permission_name\";s:15:\"system_platform\";s:4:\"icon\";s:20:\"wi wi-exploitsetting\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}}s:6:\"module\";a:2:{s:5:\"title\";s:9:\"小程序\";s:4:\"menu\";a:2:{s:12:\"system_wxapp\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:15:\"微信小程序\";s:3:\"url\";s:45:\"./index.php?c=account&a=manage&account_type=4\";s:15:\"permission_name\";s:12:\"system_wxapp\";s:4:\"icon\";s:11:\"wi wi-wxapp\";s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";a:6:{i:0;a:2:{s:5:\"title\";s:21:\"小程序管理设置\";s:15:\"permission_name\";s:19:\"system_wxapp_manage\";}i:1;a:2:{s:5:\"title\";s:15:\"添加小程序\";s:15:\"permission_name\";s:17:\"system_wxapp_post\";}i:2;a:2:{s:5:\"title\";s:15:\"小程序停用\";s:15:\"permission_name\";s:17:\"system_wxapp_stop\";}i:3;a:2:{s:5:\"title\";s:18:\"小程序回收站\";s:15:\"permission_name\";s:20:\"system_wxapp_recycle\";}i:4;a:2:{s:5:\"title\";s:15:\"小程序删除\";s:15:\"permission_name\";s:19:\"system_wxapp_delete\";}i:5;a:2:{s:5:\"title\";s:15:\"小程序恢复\";s:15:\"permission_name\";s:20:\"system_wxapp_recover\";}}}s:19:\"system_module_wxapp\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:15:\"小程序应用\";s:3:\"url\";s:58:\"./index.php?c=module&a=manage-system&support=wxapp_support\";s:15:\"permission_name\";s:19:\"system_module_wxapp\";s:4:\"icon\";s:17:\"wi wi-wxapp-apply\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}}s:7:\"welcome\";a:3:{s:5:\"title\";s:12:\"系统首页\";s:4:\"menu\";a:1:{s:14:\"system_welcome\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:18:\"系统首页应用\";s:3:\"url\";s:60:\"./index.php?c=module&a=manage-system&support=welcome_support\";s:15:\"permission_name\";s:14:\"system_welcome\";s:4:\"icon\";s:11:\"wi wi-wxapp\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}s:7:\"founder\";b:1;}s:6:\"webapp\";a:2:{s:5:\"title\";s:2:\"PC\";s:4:\"menu\";a:2:{s:13:\"system_webapp\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:2:\"PC\";s:3:\"url\";s:45:\"./index.php?c=account&a=manage&account_type=5\";s:15:\"permission_name\";s:13:\"system_webapp\";s:4:\"icon\";s:8:\"wi wi-pc\";s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";a:0:{}}s:20:\"system_module_webapp\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:8:\"PC应用\";s:3:\"url\";s:59:\"./index.php?c=module&a=manage-system&support=webapp_support\";s:15:\"permission_name\";s:20:\"system_module_webapp\";s:4:\"icon\";s:14:\"wi wi-pc-apply\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}}s:8:\"phoneapp\";a:2:{s:5:\"title\";s:3:\"APP\";s:4:\"menu\";a:2:{s:15:\"system_phoneapp\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:3:\"APP\";s:3:\"url\";s:45:\"./index.php?c=account&a=manage&account_type=6\";s:15:\"permission_name\";s:15:\"system_phoneapp\";s:4:\"icon\";s:9:\"wi wi-app\";s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";a:0:{}}s:22:\"system_module_phoneapp\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:9:\"APP应用\";s:3:\"url\";s:61:\"./index.php?c=module&a=manage-system&support=phoneapp_support\";s:15:\"permission_name\";s:22:\"system_module_phoneapp\";s:4:\"icon\";s:15:\"wi wi-app-apply\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}}s:5:\"xzapp\";a:2:{s:5:\"title\";s:9:\"熊掌号\";s:4:\"menu\";a:2:{s:12:\"system_xzapp\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:9:\"熊掌号\";s:3:\"url\";s:45:\"./index.php?c=account&a=manage&account_type=9\";s:15:\"permission_name\";s:12:\"system_xzapp\";s:4:\"icon\";s:11:\"wi wi-xzapp\";s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";a:0:{}}s:19:\"system_module_xzapp\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:15:\"熊掌号应用\";s:3:\"url\";s:58:\"./index.php?c=module&a=manage-system&support=xzapp_support\";s:15:\"permission_name\";s:19:\"system_module_xzapp\";s:4:\"icon\";s:17:\"wi wi-xzapp-apply\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}}s:6:\"aliapp\";a:2:{s:5:\"title\";s:18:\"支付宝小程序\";s:4:\"menu\";a:2:{s:13:\"system_aliapp\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:18:\"支付宝小程序\";s:3:\"url\";s:46:\"./index.php?c=account&a=manage&account_type=11\";s:15:\"permission_name\";s:13:\"system_aliapp\";s:4:\"icon\";s:12:\"wi wi-aliapp\";s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";a:0:{}}s:20:\"system_module_aliapp\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:24:\"支付宝小程序应用\";s:3:\"url\";s:59:\"./index.php?c=module&a=manage-system&support=aliapp_support\";s:15:\"permission_name\";s:20:\"system_module_aliapp\";s:4:\"icon\";s:18:\"wi wi-aliapp-apply\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}}s:4:\"user\";a:2:{s:5:\"title\";s:13:\"帐户/用户\";s:4:\"menu\";a:3:{s:9:\"system_my\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"我的帐户\";s:3:\"url\";s:29:\"./index.php?c=user&a=profile&\";s:15:\"permission_name\";s:9:\"system_my\";s:4:\"icon\";s:10:\"wi wi-user\";s:12:\"displayorder\";i:3;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:11:\"system_user\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"用户管理\";s:3:\"url\";s:29:\"./index.php?c=user&a=display&\";s:15:\"permission_name\";s:11:\"system_user\";s:4:\"icon\";s:16:\"wi wi-user-group\";s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";a:7:{i:0;a:2:{s:5:\"title\";s:12:\"编辑用户\";s:15:\"permission_name\";s:16:\"system_user_post\";}i:1;a:2:{s:5:\"title\";s:12:\"审核用户\";s:15:\"permission_name\";s:17:\"system_user_check\";}i:2;a:2:{s:5:\"title\";s:12:\"店员管理\";s:15:\"permission_name\";s:17:\"system_user_clerk\";}i:3;a:2:{s:5:\"title\";s:15:\"用户回收站\";s:15:\"permission_name\";s:19:\"system_user_recycle\";}i:4;a:2:{s:5:\"title\";s:18:\"用户属性设置\";s:15:\"permission_name\";s:18:\"system_user_fields\";}i:5;a:2:{s:5:\"title\";s:31:\"用户属性设置-编辑字段\";s:15:\"permission_name\";s:23:\"system_user_fields_post\";}i:6;a:2:{s:5:\"title\";s:18:\"用户注册设置\";s:15:\"permission_name\";s:23:\"system_user_registerset\";}}}s:25:\"system_user_founder_group\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:15:\"副创始人组\";s:3:\"url\";s:32:\"./index.php?c=founder&a=display&\";s:15:\"permission_name\";s:21:\"system_founder_manage\";s:4:\"icon\";s:16:\"wi wi-co-founder\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";a:6:{i:0;a:2:{s:5:\"title\";s:18:\"添加创始人组\";s:15:\"permission_name\";s:24:\"system_founder_group_add\";}i:1;a:2:{s:5:\"title\";s:18:\"编辑创始人组\";s:15:\"permission_name\";s:25:\"system_founder_group_post\";}i:2;a:2:{s:5:\"title\";s:18:\"删除创始人组\";s:15:\"permission_name\";s:24:\"system_founder_group_del\";}i:3;a:2:{s:5:\"title\";s:15:\"添加创始人\";s:15:\"permission_name\";s:23:\"system_founder_user_add\";}i:4;a:2:{s:5:\"title\";s:15:\"编辑创始人\";s:15:\"permission_name\";s:24:\"system_founder_user_post\";}i:5;a:2:{s:5:\"title\";s:15:\"删除创始人\";s:15:\"permission_name\";s:23:\"system_founder_user_del\";}}}}}s:10:\"permission\";a:2:{s:5:\"title\";s:12:\"权限管理\";s:4:\"menu\";a:2:{s:19:\"system_module_group\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:15:\"应用权限组\";s:3:\"url\";s:29:\"./index.php?c=module&a=group&\";s:15:\"permission_name\";s:19:\"system_module_group\";s:4:\"icon\";s:21:\"wi wi-appjurisdiction\";s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";a:3:{i:0;a:2:{s:5:\"title\";s:21:\"添加应用权限组\";s:15:\"permission_name\";s:23:\"system_module_group_add\";}i:1;a:2:{s:5:\"title\";s:21:\"编辑应用权限组\";s:15:\"permission_name\";s:24:\"system_module_group_post\";}i:2;a:2:{s:5:\"title\";s:21:\"删除应用权限组\";s:15:\"permission_name\";s:23:\"system_module_group_del\";}}}s:17:\"system_user_group\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:15:\"用户权限组\";s:3:\"url\";s:27:\"./index.php?c=user&a=group&\";s:15:\"permission_name\";s:17:\"system_user_group\";s:4:\"icon\";s:22:\"wi wi-userjurisdiction\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";a:3:{i:0;a:2:{s:5:\"title\";s:15:\"添加用户组\";s:15:\"permission_name\";s:21:\"system_user_group_add\";}i:1;a:2:{s:5:\"title\";s:15:\"编辑用户组\";s:15:\"permission_name\";s:22:\"system_user_group_post\";}i:2;a:2:{s:5:\"title\";s:15:\"删除用户组\";s:15:\"permission_name\";s:21:\"system_user_group_del\";}}}}}s:7:\"article\";a:2:{s:5:\"title\";s:13:\"文章/公告\";s:4:\"menu\";a:2:{s:14:\"system_article\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"文章管理\";s:3:\"url\";s:29:\"./index.php?c=article&a=news&\";s:15:\"permission_name\";s:19:\"system_article_news\";s:4:\"icon\";s:13:\"wi wi-article\";s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:21:\"system_article_notice\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"公告管理\";s:3:\"url\";s:31:\"./index.php?c=article&a=notice&\";s:15:\"permission_name\";s:21:\"system_article_notice\";s:4:\"icon\";s:12:\"wi wi-notice\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}}s:7:\"message\";a:2:{s:5:\"title\";s:12:\"消息提醒\";s:4:\"menu\";a:1:{s:21:\"system_message_notice\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"消息提醒\";s:3:\"url\";s:31:\"./index.php?c=message&a=notice&\";s:15:\"permission_name\";s:21:\"system_message_notice\";s:4:\"icon\";s:10:\"wi wi-bell\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}}s:17:\"system_statistics\";a:2:{s:5:\"title\";s:6:\"统计\";s:4:\"menu\";a:1:{s:23:\"system_account_analysis\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"访问统计\";s:3:\"url\";s:35:\"./index.php?c=statistics&a=account&\";s:15:\"permission_name\";s:23:\"system_account_analysis\";s:4:\"icon\";s:17:\"wi wi-statistical\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}}s:5:\"cache\";a:2:{s:5:\"title\";s:6:\"缓存\";s:4:\"menu\";a:1:{s:26:\"system_setting_updatecache\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"更新缓存\";s:3:\"url\";s:35:\"./index.php?c=system&a=updatecache&\";s:15:\"permission_name\";s:26:\"system_setting_updatecache\";s:4:\"icon\";s:12:\"wi wi-update\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}}}s:9:\"is_system\";b:1;s:10:\"is_display\";b:1;s:12:\"displayorder\";i:10;}s:4:\"site\";a:8:{s:5:\"title\";s:6:\"站点\";s:4:\"icon\";s:17:\"wi wi-system-site\";s:3:\"url\";s:28:\"./index.php?c=system&a=site&\";s:7:\"section\";a:3:{s:7:\"setting\";a:2:{s:5:\"title\";s:6:\"设置\";s:4:\"menu\";a:9:{s:19:\"system_setting_site\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"站点设置\";s:3:\"url\";s:28:\"./index.php?c=system&a=site&\";s:15:\"permission_name\";s:19:\"system_setting_site\";s:4:\"icon\";s:18:\"wi wi-site-setting\";s:12:\"displayorder\";i:9;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:19:\"system_setting_menu\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"菜单设置\";s:3:\"url\";s:28:\"./index.php?c=system&a=menu&\";s:15:\"permission_name\";s:19:\"system_setting_menu\";s:4:\"icon\";s:18:\"wi wi-menu-setting\";s:12:\"displayorder\";i:8;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:25:\"system_setting_attachment\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"附件设置\";s:3:\"url\";s:34:\"./index.php?c=system&a=attachment&\";s:15:\"permission_name\";s:25:\"system_setting_attachment\";s:4:\"icon\";s:16:\"wi wi-attachment\";s:12:\"displayorder\";i:7;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:25:\"system_setting_systeminfo\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"系统信息\";s:3:\"url\";s:34:\"./index.php?c=system&a=systeminfo&\";s:15:\"permission_name\";s:25:\"system_setting_systeminfo\";s:4:\"icon\";s:17:\"wi wi-system-info\";s:12:\"displayorder\";i:6;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:19:\"system_setting_logs\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"查看日志\";s:3:\"url\";s:28:\"./index.php?c=system&a=logs&\";s:15:\"permission_name\";s:19:\"system_setting_logs\";s:4:\"icon\";s:9:\"wi wi-log\";s:12:\"displayorder\";i:5;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:26:\"system_setting_ipwhitelist\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:11:\"IP白名单\";s:3:\"url\";s:35:\"./index.php?c=system&a=ipwhitelist&\";s:15:\"permission_name\";s:26:\"system_setting_ipwhitelist\";s:4:\"icon\";s:8:\"wi wi-ip\";s:12:\"displayorder\";i:4;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:28:\"system_setting_sensitiveword\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:15:\"过滤敏感词\";s:3:\"url\";s:37:\"./index.php?c=system&a=sensitiveword&\";s:15:\"permission_name\";s:28:\"system_setting_sensitiveword\";s:4:\"icon\";s:15:\"wi wi-sensitive\";s:12:\"displayorder\";i:3;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:25:\"system_setting_thirdlogin\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:25:\"用户登录/注册设置\";s:3:\"url\";s:33:\"./index.php?c=user&a=registerset&\";s:15:\"permission_name\";s:25:\"system_setting_thirdlogin\";s:4:\"icon\";s:10:\"wi wi-user\";s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:20:\"system_setting_oauth\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:17:\"oauth全局设置\";s:3:\"url\";s:29:\"./index.php?c=system&a=oauth&\";s:15:\"permission_name\";s:20:\"system_setting_oauth\";s:4:\"icon\";s:11:\"wi wi-oauth\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}}s:7:\"utility\";a:2:{s:5:\"title\";s:12:\"常用工具\";s:4:\"menu\";a:5:{s:24:\"system_utility_filecheck\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:18:\"系统文件校验\";s:3:\"url\";s:33:\"./index.php?c=system&a=filecheck&\";s:15:\"permission_name\";s:24:\"system_utility_filecheck\";s:4:\"icon\";s:10:\"wi wi-file\";s:12:\"displayorder\";i:5;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:23:\"system_utility_optimize\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"性能优化\";s:3:\"url\";s:32:\"./index.php?c=system&a=optimize&\";s:15:\"permission_name\";s:23:\"system_utility_optimize\";s:4:\"icon\";s:14:\"wi wi-optimize\";s:12:\"displayorder\";i:4;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:23:\"system_utility_database\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:9:\"数据库\";s:3:\"url\";s:32:\"./index.php?c=system&a=database&\";s:15:\"permission_name\";s:23:\"system_utility_database\";s:4:\"icon\";s:9:\"wi wi-sql\";s:12:\"displayorder\";i:3;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:19:\"system_utility_scan\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"木马查杀\";s:3:\"url\";s:28:\"./index.php?c=system&a=scan&\";s:15:\"permission_name\";s:19:\"system_utility_scan\";s:4:\"icon\";s:12:\"wi wi-safety\";s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:18:\"system_utility_bom\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:15:\"检测文件BOM\";s:3:\"url\";s:27:\"./index.php?c=system&a=bom&\";s:15:\"permission_name\";s:18:\"system_utility_bom\";s:4:\"icon\";s:9:\"wi wi-bom\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}}s:7:\"backjob\";a:2:{s:5:\"title\";s:12:\"后台任务\";s:4:\"menu\";a:1:{s:10:\"system_job\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"后台任务\";s:3:\"url\";s:38:\"./index.php?c=system&a=job&do=display&\";s:15:\"permission_name\";s:10:\"system_job\";s:4:\"icon\";s:9:\"wi wi-job\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}}}s:7:\"founder\";b:1;s:9:\"is_system\";b:1;s:10:\"is_display\";b:1;s:12:\"displayorder\";i:11;}s:4:\"help\";a:8:{s:5:\"title\";s:12:\"系统帮助\";s:4:\"icon\";s:12:\"wi wi-market\";s:3:\"url\";s:29:\"./index.php?c=help&a=display&\";s:7:\"section\";a:0:{}s:5:\"blank\";b:0;s:9:\"is_system\";b:1;s:10:\"is_display\";b:1;s:12:\"displayorder\";i:12;}s:5:\"store\";a:7:{s:5:\"title\";s:6:\"商城\";s:4:\"icon\";s:11:\"wi wi-store\";s:3:\"url\";s:43:\"./index.php?c=home&a=welcome&do=ext&m=store\";s:7:\"section\";a:0:{}s:9:\"is_system\";b:1;s:10:\"is_display\";b:1;s:12:\"displayorder\";i:13;}}');
INSERT INTO `ims_core_cache` VALUES ('we7:system_frame:0', 'a:12:{s:8:\"platform\";a:7:{s:5:\"title\";s:6:\"平台\";s:4:\"icon\";s:14:\"wi wi-platform\";s:3:\"url\";s:44:\"./index.php?c=account&a=display&do=platform&\";s:7:\"section\";a:0:{}s:9:\"is_system\";b:1;s:10:\"is_display\";b:1;s:12:\"displayorder\";i:2;}s:7:\"account\";a:7:{s:5:\"title\";s:9:\"公众号\";s:4:\"icon\";s:18:\"wi wi-white-collar\";s:3:\"url\";s:41:\"./index.php?c=home&a=welcome&do=platform&\";s:7:\"section\";a:5:{s:13:\"platform_plus\";a:3:{s:5:\"title\";s:12:\"增强功能\";s:4:\"menu\";a:5:{s:14:\"platform_reply\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:0;s:5:\"title\";s:12:\"自动回复\";s:3:\"url\";s:31:\"./index.php?c=platform&a=reply&\";s:15:\"permission_name\";s:14:\"platform_reply\";s:4:\"icon\";s:11:\"wi wi-reply\";s:12:\"displayorder\";i:5;s:2:\"id\";N;s:14:\"sub_permission\";a:0:{}}s:13:\"platform_menu\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:0;s:5:\"title\";s:15:\"自定义菜单\";s:3:\"url\";s:38:\"./index.php?c=platform&a=menu&do=post&\";s:15:\"permission_name\";s:13:\"platform_menu\";s:4:\"icon\";s:16:\"wi wi-custommenu\";s:12:\"displayorder\";i:4;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:11:\"platform_qr\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:0;s:5:\"title\";s:22:\"二维码/转化链接\";s:3:\"url\";s:28:\"./index.php?c=platform&a=qr&\";s:15:\"permission_name\";s:11:\"platform_qr\";s:4:\"icon\";s:12:\"wi wi-qrcode\";s:12:\"displayorder\";i:3;s:2:\"id\";N;s:14:\"sub_permission\";a:0:{}}s:17:\"platform_material\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:0;s:5:\"title\";s:16:\"素材/编辑器\";s:3:\"url\";s:34:\"./index.php?c=platform&a=material&\";s:15:\"permission_name\";s:17:\"platform_material\";s:4:\"icon\";s:12:\"wi wi-redact\";s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";a:2:{i:0;a:3:{s:5:\"title\";s:13:\"添加/编辑\";s:3:\"url\";s:39:\"./index.php?c=platform&a=material-post&\";s:15:\"permission_name\";s:13:\"material_post\";}i:1;a:2:{s:5:\"title\";s:6:\"删除\";s:15:\"permission_name\";s:24:\"platform_material_delete\";}}}s:13:\"platform_site\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:0;s:5:\"title\";s:16:\"微官网-文章\";s:3:\"url\";s:38:\"./index.php?c=site&a=multi&do=display&\";s:15:\"permission_name\";s:13:\"platform_site\";s:4:\"icon\";s:10:\"wi wi-home\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";a:0:{}}}s:10:\"is_display\";i:0;}s:15:\"platform_module\";a:3:{s:5:\"title\";s:12:\"应用模块\";s:4:\"menu\";a:0:{}s:10:\"is_display\";b:1;}s:2:\"mc\";a:3:{s:5:\"title\";s:6:\"粉丝\";s:4:\"menu\";a:2:{s:7:\"mc_fans\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:0;s:5:\"title\";s:12:\"粉丝管理\";s:3:\"url\";s:24:\"./index.php?c=mc&a=fans&\";s:15:\"permission_name\";s:7:\"mc_fans\";s:4:\"icon\";s:16:\"wi wi-fansmanage\";s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:9:\"mc_member\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:0;s:5:\"title\";s:12:\"会员管理\";s:3:\"url\";s:26:\"./index.php?c=mc&a=member&\";s:15:\"permission_name\";s:9:\"mc_member\";s:4:\"icon\";s:10:\"wi wi-fans\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}s:10:\"is_display\";i:0;}s:7:\"profile\";a:3:{s:5:\"title\";s:6:\"配置\";s:4:\"menu\";a:4:{s:7:\"profile\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:0;s:5:\"title\";s:12:\"参数配置\";s:3:\"url\";s:31:\"./index.php?c=profile&a=remote&\";s:15:\"permission_name\";s:15:\"profile_setting\";s:4:\"icon\";s:23:\"wi wi-parameter-setting\";s:12:\"displayorder\";i:4;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:7:\"payment\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:0;s:5:\"title\";s:12:\"支付参数\";s:3:\"url\";s:32:\"./index.php?c=profile&a=payment&\";s:15:\"permission_name\";s:19:\"profile_pay_setting\";s:4:\"icon\";s:17:\"wi wi-pay-setting\";s:12:\"displayorder\";i:3;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:15:\"app_module_link\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:0;s:5:\"title\";s:12:\"数据同步\";s:3:\"url\";s:44:\"./index.php?c=profile&a=module-link-uniacid&\";s:15:\"permission_name\";s:31:\"profile_app_module_link_uniacid\";s:4:\"icon\";s:18:\"wi wi-data-synchro\";s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:11:\"bind_domain\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:0;s:5:\"title\";s:12:\"域名绑定\";s:3:\"url\";s:36:\"./index.php?c=profile&a=bind-domain&\";s:15:\"permission_name\";s:19:\"profile_bind_domain\";s:4:\"icon\";s:17:\"wi wi-bind-domain\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}s:10:\"is_display\";i:0;}s:10:\"statistics\";a:3:{s:5:\"title\";s:6:\"统计\";s:4:\"menu\";a:2:{s:14:\"statistics_app\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:0;s:5:\"title\";s:12:\"访问统计\";s:3:\"url\";s:31:\"./index.php?c=statistics&a=app&\";s:15:\"permission_name\";s:14:\"statistics_app\";s:4:\"icon\";s:17:\"wi wi-statistical\";s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:15:\"statistics_fans\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:0;s:5:\"title\";s:12:\"用户统计\";s:3:\"url\";s:32:\"./index.php?c=statistics&a=fans&\";s:15:\"permission_name\";s:15:\"statistics_fans\";s:4:\"icon\";s:17:\"wi wi-statistical\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}s:10:\"is_display\";i:0;}}s:9:\"is_system\";b:1;s:10:\"is_display\";b:1;s:12:\"displayorder\";i:3;}s:5:\"wxapp\";a:7:{s:5:\"title\";s:15:\"微信小程序\";s:4:\"icon\";s:19:\"wi wi-small-routine\";s:3:\"url\";s:38:\"./index.php?c=wxapp&a=display&do=home&\";s:7:\"section\";a:5:{s:14:\"wxapp_entrance\";a:3:{s:5:\"title\";s:15:\"小程序入口\";s:4:\"menu\";a:1:{s:20:\"module_entrance_link\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:0;s:5:\"title\";s:12:\"入口页面\";s:3:\"url\";s:36:\"./index.php?c=wxapp&a=entrance-link&\";s:15:\"permission_name\";s:19:\"wxapp_entrance_link\";s:4:\"icon\";s:18:\"wi wi-data-synchro\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}s:10:\"is_display\";i:0;}s:15:\"platform_module\";a:3:{s:5:\"title\";s:6:\"应用\";s:4:\"menu\";a:0:{}s:10:\"is_display\";b:1;}s:2:\"mc\";a:3:{s:5:\"title\";s:6:\"粉丝\";s:4:\"menu\";a:1:{s:12:\"wxapp_member\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:0;s:5:\"title\";s:6:\"会员\";s:3:\"url\";s:26:\"./index.php?c=mc&a=member&\";s:15:\"permission_name\";s:12:\"wxapp_member\";s:4:\"icon\";s:10:\"wi wi-fans\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}s:10:\"is_display\";i:0;}s:13:\"wxapp_profile\";a:2:{s:5:\"title\";s:6:\"配置\";s:4:\"menu\";a:5:{s:17:\"wxapp_module_link\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:0;s:5:\"title\";s:12:\"数据同步\";s:3:\"url\";s:42:\"./index.php?c=wxapp&a=module-link-uniacid&\";s:15:\"permission_name\";s:25:\"wxapp_module_link_uniacid\";s:4:\"icon\";s:18:\"wi wi-data-synchro\";s:12:\"displayorder\";i:5;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:13:\"wxapp_payment\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:0;s:5:\"title\";s:12:\"支付参数\";s:3:\"url\";s:30:\"./index.php?c=wxapp&a=payment&\";s:15:\"permission_name\";s:13:\"wxapp_payment\";s:4:\"icon\";s:16:\"wi wi-appsetting\";s:12:\"displayorder\";i:4;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:14:\"front_download\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:18:\"上传微信审核\";s:3:\"url\";s:37:\"./index.php?c=wxapp&a=front-download&\";s:15:\"permission_name\";s:20:\"wxapp_front_download\";s:4:\"icon\";s:13:\"wi wi-examine\";s:12:\"displayorder\";i:3;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:17:\"parameter_setting\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:0;s:5:\"title\";s:12:\"参数配置\";s:3:\"url\";s:31:\"./index.php?c=profile&a=remote&\";s:15:\"permission_name\";s:13:\"wxapp_setting\";s:4:\"icon\";s:23:\"wi wi-parameter-setting\";s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:23:\"wxapp_platform_material\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:0;s:5:\"title\";s:12:\"素材管理\";s:3:\"url\";N;s:15:\"permission_name\";s:23:\"wxapp_platform_material\";s:4:\"icon\";N;s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";a:1:{i:0;a:2:{s:5:\"title\";s:6:\"删除\";s:15:\"permission_name\";s:30:\"wxapp_platform_material_delete\";}}}}}s:10:\"statistics\";a:3:{s:5:\"title\";s:6:\"统计\";s:4:\"menu\";a:1:{s:15:\"statistics_fans\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:0;s:5:\"title\";s:12:\"访问统计\";s:3:\"url\";s:33:\"./index.php?c=wxapp&a=statistics&\";s:15:\"permission_name\";s:15:\"statistics_fans\";s:4:\"icon\";s:17:\"wi wi-statistical\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}s:10:\"is_display\";i:0;}}s:9:\"is_system\";b:1;s:10:\"is_display\";b:1;s:12:\"displayorder\";i:4;}s:6:\"webapp\";a:7:{s:5:\"title\";s:2:\"PC\";s:4:\"icon\";s:8:\"wi wi-pc\";s:3:\"url\";s:39:\"./index.php?c=webapp&a=home&do=display&\";s:7:\"section\";a:4:{s:15:\"platform_module\";a:3:{s:5:\"title\";s:12:\"应用模块\";s:4:\"menu\";a:0:{}s:10:\"is_display\";b:1;}s:2:\"mc\";a:2:{s:5:\"title\";s:6:\"粉丝\";s:4:\"menu\";a:1:{s:9:\"mc_member\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"会员管理\";s:3:\"url\";s:26:\"./index.php?c=mc&a=member&\";s:15:\"permission_name\";s:9:\"mc_member\";s:4:\"icon\";s:10:\"wi wi-fans\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}}s:6:\"webapp\";a:2:{s:5:\"title\";s:6:\"配置\";s:4:\"menu\";a:3:{s:18:\"webapp_module_link\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"数据同步\";s:3:\"url\";s:43:\"./index.php?c=webapp&a=module-link-uniacid&\";s:15:\"permission_name\";s:26:\"webapp_module_link_uniacid\";s:4:\"icon\";s:18:\"wi wi-data-synchro\";s:12:\"displayorder\";i:3;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:14:\"webapp_rewrite\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:9:\"伪静态\";s:3:\"url\";s:31:\"./index.php?c=webapp&a=rewrite&\";s:15:\"permission_name\";s:14:\"webapp_rewrite\";s:4:\"icon\";s:13:\"wi wi-rewrite\";s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:18:\"webapp_bind_domain\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:18:\"域名访问设置\";s:3:\"url\";s:35:\"./index.php?c=webapp&a=bind-domain&\";s:15:\"permission_name\";s:18:\"webapp_bind_domain\";s:4:\"icon\";s:17:\"wi wi-bind-domain\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}}s:10:\"statistics\";a:3:{s:5:\"title\";s:6:\"统计\";s:4:\"menu\";a:1:{s:14:\"statistics_app\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:0;s:5:\"title\";s:12:\"访问统计\";s:3:\"url\";s:31:\"./index.php?c=statistics&a=app&\";s:15:\"permission_name\";s:14:\"statistics_app\";s:4:\"icon\";s:17:\"wi wi-statistical\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}s:10:\"is_display\";i:0;}}s:9:\"is_system\";b:1;s:10:\"is_display\";b:1;s:12:\"displayorder\";i:5;}s:8:\"phoneapp\";a:7:{s:5:\"title\";s:3:\"APP\";s:4:\"icon\";s:18:\"wi wi-white-collar\";s:3:\"url\";s:41:\"./index.php?c=phoneapp&a=display&do=home&\";s:7:\"section\";a:2:{s:15:\"platform_module\";a:3:{s:5:\"title\";s:6:\"应用\";s:4:\"menu\";a:0:{}s:10:\"is_display\";b:1;}s:16:\"phoneapp_profile\";a:2:{s:5:\"title\";s:6:\"配置\";s:4:\"menu\";a:1:{s:14:\"front_download\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:9:\"下载APP\";s:3:\"url\";s:40:\"./index.php?c=phoneapp&a=front-download&\";s:15:\"permission_name\";s:23:\"phoneapp_front_download\";s:4:\"icon\";s:13:\"wi wi-examine\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}}}s:9:\"is_system\";b:1;s:10:\"is_display\";b:1;s:12:\"displayorder\";i:6;}s:5:\"xzapp\";a:7:{s:5:\"title\";s:9:\"熊掌号\";s:4:\"icon\";s:18:\"wi wi-white-collar\";s:3:\"url\";s:38:\"./index.php?c=xzapp&a=home&do=display&\";s:7:\"section\";a:1:{s:15:\"platform_module\";a:3:{s:5:\"title\";s:12:\"应用模块\";s:4:\"menu\";a:0:{}s:10:\"is_display\";b:1;}}s:9:\"is_system\";b:1;s:10:\"is_display\";b:1;s:12:\"displayorder\";i:7;}s:6:\"aliapp\";a:7:{s:5:\"title\";s:18:\"支付宝小程序\";s:4:\"icon\";s:18:\"wi wi-white-collar\";s:3:\"url\";s:40:\"./index.php?c=miniapp&a=display&do=home&\";s:7:\"section\";a:1:{s:15:\"platform_module\";a:3:{s:5:\"title\";s:6:\"应用\";s:4:\"menu\";a:0:{}s:10:\"is_display\";b:1;}}s:9:\"is_system\";b:1;s:10:\"is_display\";b:1;s:12:\"displayorder\";i:8;}s:6:\"module\";a:7:{s:5:\"title\";s:6:\"应用\";s:4:\"icon\";s:11:\"wi wi-apply\";s:3:\"url\";s:31:\"./index.php?c=module&a=display&\";s:7:\"section\";a:0:{}s:9:\"is_system\";b:1;s:10:\"is_display\";b:1;s:12:\"displayorder\";i:9;}s:6:\"system\";a:7:{s:5:\"title\";s:6:\"系统\";s:4:\"icon\";s:13:\"wi wi-setting\";s:3:\"url\";s:39:\"./index.php?c=home&a=welcome&do=system&\";s:7:\"section\";a:13:{s:10:\"wxplatform\";a:2:{s:5:\"title\";s:9:\"公众号\";s:4:\"menu\";a:4:{s:14:\"system_account\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:16:\" 微信公众号\";s:3:\"url\";s:45:\"./index.php?c=account&a=manage&account_type=1\";s:15:\"permission_name\";s:14:\"system_account\";s:4:\"icon\";s:12:\"wi wi-wechat\";s:12:\"displayorder\";i:4;s:2:\"id\";N;s:14:\"sub_permission\";a:6:{i:0;a:2:{s:5:\"title\";s:21:\"公众号管理设置\";s:15:\"permission_name\";s:21:\"system_account_manage\";}i:1;a:2:{s:5:\"title\";s:15:\"添加公众号\";s:15:\"permission_name\";s:19:\"system_account_post\";}i:2;a:2:{s:5:\"title\";s:15:\"公众号停用\";s:15:\"permission_name\";s:19:\"system_account_stop\";}i:3;a:2:{s:5:\"title\";s:18:\"公众号回收站\";s:15:\"permission_name\";s:22:\"system_account_recycle\";}i:4;a:2:{s:5:\"title\";s:15:\"公众号删除\";s:15:\"permission_name\";s:21:\"system_account_delete\";}i:5;a:2:{s:5:\"title\";s:15:\"公众号恢复\";s:15:\"permission_name\";s:22:\"system_account_recover\";}}}s:13:\"system_module\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:15:\"公众号应用\";s:3:\"url\";s:60:\"./index.php?c=module&a=manage-system&support=account_support\";s:15:\"permission_name\";s:13:\"system_module\";s:4:\"icon\";s:14:\"wi wi-wx-apply\";s:12:\"displayorder\";i:3;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:15:\"system_template\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:15:\"微官网模板\";s:3:\"url\";s:32:\"./index.php?c=system&a=template&\";s:15:\"permission_name\";s:15:\"system_template\";s:4:\"icon\";s:17:\"wi wi-wx-template\";s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:15:\"system_platform\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:19:\" 微信开放平台\";s:3:\"url\";s:32:\"./index.php?c=system&a=platform&\";s:15:\"permission_name\";s:15:\"system_platform\";s:4:\"icon\";s:20:\"wi wi-exploitsetting\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}}s:6:\"module\";a:2:{s:5:\"title\";s:9:\"小程序\";s:4:\"menu\";a:2:{s:12:\"system_wxapp\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:15:\"微信小程序\";s:3:\"url\";s:45:\"./index.php?c=account&a=manage&account_type=4\";s:15:\"permission_name\";s:12:\"system_wxapp\";s:4:\"icon\";s:11:\"wi wi-wxapp\";s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";a:6:{i:0;a:2:{s:5:\"title\";s:21:\"小程序管理设置\";s:15:\"permission_name\";s:19:\"system_wxapp_manage\";}i:1;a:2:{s:5:\"title\";s:15:\"添加小程序\";s:15:\"permission_name\";s:17:\"system_wxapp_post\";}i:2;a:2:{s:5:\"title\";s:15:\"小程序停用\";s:15:\"permission_name\";s:17:\"system_wxapp_stop\";}i:3;a:2:{s:5:\"title\";s:18:\"小程序回收站\";s:15:\"permission_name\";s:20:\"system_wxapp_recycle\";}i:4;a:2:{s:5:\"title\";s:15:\"小程序删除\";s:15:\"permission_name\";s:19:\"system_wxapp_delete\";}i:5;a:2:{s:5:\"title\";s:15:\"小程序恢复\";s:15:\"permission_name\";s:20:\"system_wxapp_recover\";}}}s:19:\"system_module_wxapp\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:15:\"小程序应用\";s:3:\"url\";s:58:\"./index.php?c=module&a=manage-system&support=wxapp_support\";s:15:\"permission_name\";s:19:\"system_module_wxapp\";s:4:\"icon\";s:17:\"wi wi-wxapp-apply\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}}s:7:\"welcome\";a:3:{s:5:\"title\";s:12:\"系统首页\";s:4:\"menu\";a:1:{s:14:\"system_welcome\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:18:\"系统首页应用\";s:3:\"url\";s:60:\"./index.php?c=module&a=manage-system&support=welcome_support\";s:15:\"permission_name\";s:14:\"system_welcome\";s:4:\"icon\";s:11:\"wi wi-wxapp\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}s:7:\"founder\";b:1;}s:6:\"webapp\";a:2:{s:5:\"title\";s:2:\"PC\";s:4:\"menu\";a:2:{s:13:\"system_webapp\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:2:\"PC\";s:3:\"url\";s:45:\"./index.php?c=account&a=manage&account_type=5\";s:15:\"permission_name\";s:13:\"system_webapp\";s:4:\"icon\";s:8:\"wi wi-pc\";s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";a:0:{}}s:20:\"system_module_webapp\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:8:\"PC应用\";s:3:\"url\";s:59:\"./index.php?c=module&a=manage-system&support=webapp_support\";s:15:\"permission_name\";s:20:\"system_module_webapp\";s:4:\"icon\";s:14:\"wi wi-pc-apply\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}}s:8:\"phoneapp\";a:2:{s:5:\"title\";s:3:\"APP\";s:4:\"menu\";a:2:{s:15:\"system_phoneapp\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:3:\"APP\";s:3:\"url\";s:45:\"./index.php?c=account&a=manage&account_type=6\";s:15:\"permission_name\";s:15:\"system_phoneapp\";s:4:\"icon\";s:9:\"wi wi-app\";s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";a:0:{}}s:22:\"system_module_phoneapp\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:9:\"APP应用\";s:3:\"url\";s:61:\"./index.php?c=module&a=manage-system&support=phoneapp_support\";s:15:\"permission_name\";s:22:\"system_module_phoneapp\";s:4:\"icon\";s:15:\"wi wi-app-apply\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}}s:5:\"xzapp\";a:2:{s:5:\"title\";s:9:\"熊掌号\";s:4:\"menu\";a:2:{s:12:\"system_xzapp\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:9:\"熊掌号\";s:3:\"url\";s:45:\"./index.php?c=account&a=manage&account_type=9\";s:15:\"permission_name\";s:12:\"system_xzapp\";s:4:\"icon\";s:11:\"wi wi-xzapp\";s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";a:0:{}}s:19:\"system_module_xzapp\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:15:\"熊掌号应用\";s:3:\"url\";s:58:\"./index.php?c=module&a=manage-system&support=xzapp_support\";s:15:\"permission_name\";s:19:\"system_module_xzapp\";s:4:\"icon\";s:17:\"wi wi-xzapp-apply\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}}s:6:\"aliapp\";a:2:{s:5:\"title\";s:18:\"支付宝小程序\";s:4:\"menu\";a:2:{s:13:\"system_aliapp\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:18:\"支付宝小程序\";s:3:\"url\";s:46:\"./index.php?c=account&a=manage&account_type=11\";s:15:\"permission_name\";s:13:\"system_aliapp\";s:4:\"icon\";s:12:\"wi wi-aliapp\";s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";a:0:{}}s:20:\"system_module_aliapp\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:24:\"支付宝小程序应用\";s:3:\"url\";s:59:\"./index.php?c=module&a=manage-system&support=aliapp_support\";s:15:\"permission_name\";s:20:\"system_module_aliapp\";s:4:\"icon\";s:18:\"wi wi-aliapp-apply\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}}s:4:\"user\";a:2:{s:5:\"title\";s:13:\"帐户/用户\";s:4:\"menu\";a:3:{s:9:\"system_my\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"我的帐户\";s:3:\"url\";s:29:\"./index.php?c=user&a=profile&\";s:15:\"permission_name\";s:9:\"system_my\";s:4:\"icon\";s:10:\"wi wi-user\";s:12:\"displayorder\";i:3;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:11:\"system_user\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"用户管理\";s:3:\"url\";s:29:\"./index.php?c=user&a=display&\";s:15:\"permission_name\";s:11:\"system_user\";s:4:\"icon\";s:16:\"wi wi-user-group\";s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";a:7:{i:0;a:2:{s:5:\"title\";s:12:\"编辑用户\";s:15:\"permission_name\";s:16:\"system_user_post\";}i:1;a:2:{s:5:\"title\";s:12:\"审核用户\";s:15:\"permission_name\";s:17:\"system_user_check\";}i:2;a:2:{s:5:\"title\";s:12:\"店员管理\";s:15:\"permission_name\";s:17:\"system_user_clerk\";}i:3;a:2:{s:5:\"title\";s:15:\"用户回收站\";s:15:\"permission_name\";s:19:\"system_user_recycle\";}i:4;a:2:{s:5:\"title\";s:18:\"用户属性设置\";s:15:\"permission_name\";s:18:\"system_user_fields\";}i:5;a:2:{s:5:\"title\";s:31:\"用户属性设置-编辑字段\";s:15:\"permission_name\";s:23:\"system_user_fields_post\";}i:6;a:2:{s:5:\"title\";s:18:\"用户注册设置\";s:15:\"permission_name\";s:23:\"system_user_registerset\";}}}s:25:\"system_user_founder_group\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:15:\"副创始人组\";s:3:\"url\";s:32:\"./index.php?c=founder&a=display&\";s:15:\"permission_name\";s:21:\"system_founder_manage\";s:4:\"icon\";s:16:\"wi wi-co-founder\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";a:6:{i:0;a:2:{s:5:\"title\";s:18:\"添加创始人组\";s:15:\"permission_name\";s:24:\"system_founder_group_add\";}i:1;a:2:{s:5:\"title\";s:18:\"编辑创始人组\";s:15:\"permission_name\";s:25:\"system_founder_group_post\";}i:2;a:2:{s:5:\"title\";s:18:\"删除创始人组\";s:15:\"permission_name\";s:24:\"system_founder_group_del\";}i:3;a:2:{s:5:\"title\";s:15:\"添加创始人\";s:15:\"permission_name\";s:23:\"system_founder_user_add\";}i:4;a:2:{s:5:\"title\";s:15:\"编辑创始人\";s:15:\"permission_name\";s:24:\"system_founder_user_post\";}i:5;a:2:{s:5:\"title\";s:15:\"删除创始人\";s:15:\"permission_name\";s:23:\"system_founder_user_del\";}}}}}s:10:\"permission\";a:2:{s:5:\"title\";s:12:\"权限管理\";s:4:\"menu\";a:2:{s:19:\"system_module_group\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:15:\"应用权限组\";s:3:\"url\";s:29:\"./index.php?c=module&a=group&\";s:15:\"permission_name\";s:19:\"system_module_group\";s:4:\"icon\";s:21:\"wi wi-appjurisdiction\";s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";a:3:{i:0;a:2:{s:5:\"title\";s:21:\"添加应用权限组\";s:15:\"permission_name\";s:23:\"system_module_group_add\";}i:1;a:2:{s:5:\"title\";s:21:\"编辑应用权限组\";s:15:\"permission_name\";s:24:\"system_module_group_post\";}i:2;a:2:{s:5:\"title\";s:21:\"删除应用权限组\";s:15:\"permission_name\";s:23:\"system_module_group_del\";}}}s:17:\"system_user_group\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:15:\"用户权限组\";s:3:\"url\";s:27:\"./index.php?c=user&a=group&\";s:15:\"permission_name\";s:17:\"system_user_group\";s:4:\"icon\";s:22:\"wi wi-userjurisdiction\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";a:3:{i:0;a:2:{s:5:\"title\";s:15:\"添加用户组\";s:15:\"permission_name\";s:21:\"system_user_group_add\";}i:1;a:2:{s:5:\"title\";s:15:\"编辑用户组\";s:15:\"permission_name\";s:22:\"system_user_group_post\";}i:2;a:2:{s:5:\"title\";s:15:\"删除用户组\";s:15:\"permission_name\";s:21:\"system_user_group_del\";}}}}}s:7:\"article\";a:2:{s:5:\"title\";s:13:\"文章/公告\";s:4:\"menu\";a:2:{s:14:\"system_article\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"文章管理\";s:3:\"url\";s:29:\"./index.php?c=article&a=news&\";s:15:\"permission_name\";s:19:\"system_article_news\";s:4:\"icon\";s:13:\"wi wi-article\";s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:21:\"system_article_notice\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"公告管理\";s:3:\"url\";s:31:\"./index.php?c=article&a=notice&\";s:15:\"permission_name\";s:21:\"system_article_notice\";s:4:\"icon\";s:12:\"wi wi-notice\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}}s:7:\"message\";a:2:{s:5:\"title\";s:12:\"消息提醒\";s:4:\"menu\";a:1:{s:21:\"system_message_notice\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"消息提醒\";s:3:\"url\";s:31:\"./index.php?c=message&a=notice&\";s:15:\"permission_name\";s:21:\"system_message_notice\";s:4:\"icon\";s:10:\"wi wi-bell\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}}s:17:\"system_statistics\";a:2:{s:5:\"title\";s:6:\"统计\";s:4:\"menu\";a:1:{s:23:\"system_account_analysis\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"访问统计\";s:3:\"url\";s:35:\"./index.php?c=statistics&a=account&\";s:15:\"permission_name\";s:23:\"system_account_analysis\";s:4:\"icon\";s:17:\"wi wi-statistical\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}}s:5:\"cache\";a:2:{s:5:\"title\";s:6:\"缓存\";s:4:\"menu\";a:1:{s:26:\"system_setting_updatecache\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"更新缓存\";s:3:\"url\";s:35:\"./index.php?c=system&a=updatecache&\";s:15:\"permission_name\";s:26:\"system_setting_updatecache\";s:4:\"icon\";s:12:\"wi wi-update\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}}}s:9:\"is_system\";b:1;s:10:\"is_display\";b:1;s:12:\"displayorder\";i:10;}s:4:\"site\";a:8:{s:5:\"title\";s:6:\"站点\";s:4:\"icon\";s:17:\"wi wi-system-site\";s:3:\"url\";s:28:\"./index.php?c=system&a=site&\";s:7:\"section\";a:3:{s:7:\"setting\";a:2:{s:5:\"title\";s:6:\"设置\";s:4:\"menu\";a:9:{s:19:\"system_setting_site\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"站点设置\";s:3:\"url\";s:28:\"./index.php?c=system&a=site&\";s:15:\"permission_name\";s:19:\"system_setting_site\";s:4:\"icon\";s:18:\"wi wi-site-setting\";s:12:\"displayorder\";i:9;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:19:\"system_setting_menu\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"菜单设置\";s:3:\"url\";s:28:\"./index.php?c=system&a=menu&\";s:15:\"permission_name\";s:19:\"system_setting_menu\";s:4:\"icon\";s:18:\"wi wi-menu-setting\";s:12:\"displayorder\";i:8;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:25:\"system_setting_attachment\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"附件设置\";s:3:\"url\";s:34:\"./index.php?c=system&a=attachment&\";s:15:\"permission_name\";s:25:\"system_setting_attachment\";s:4:\"icon\";s:16:\"wi wi-attachment\";s:12:\"displayorder\";i:7;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:25:\"system_setting_systeminfo\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"系统信息\";s:3:\"url\";s:34:\"./index.php?c=system&a=systeminfo&\";s:15:\"permission_name\";s:25:\"system_setting_systeminfo\";s:4:\"icon\";s:17:\"wi wi-system-info\";s:12:\"displayorder\";i:6;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:19:\"system_setting_logs\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"查看日志\";s:3:\"url\";s:28:\"./index.php?c=system&a=logs&\";s:15:\"permission_name\";s:19:\"system_setting_logs\";s:4:\"icon\";s:9:\"wi wi-log\";s:12:\"displayorder\";i:5;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:26:\"system_setting_ipwhitelist\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:11:\"IP白名单\";s:3:\"url\";s:35:\"./index.php?c=system&a=ipwhitelist&\";s:15:\"permission_name\";s:26:\"system_setting_ipwhitelist\";s:4:\"icon\";s:8:\"wi wi-ip\";s:12:\"displayorder\";i:4;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:28:\"system_setting_sensitiveword\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:15:\"过滤敏感词\";s:3:\"url\";s:37:\"./index.php?c=system&a=sensitiveword&\";s:15:\"permission_name\";s:28:\"system_setting_sensitiveword\";s:4:\"icon\";s:15:\"wi wi-sensitive\";s:12:\"displayorder\";i:3;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:25:\"system_setting_thirdlogin\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:25:\"用户登录/注册设置\";s:3:\"url\";s:33:\"./index.php?c=user&a=registerset&\";s:15:\"permission_name\";s:25:\"system_setting_thirdlogin\";s:4:\"icon\";s:10:\"wi wi-user\";s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:20:\"system_setting_oauth\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:17:\"oauth全局设置\";s:3:\"url\";s:29:\"./index.php?c=system&a=oauth&\";s:15:\"permission_name\";s:20:\"system_setting_oauth\";s:4:\"icon\";s:11:\"wi wi-oauth\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}}s:7:\"utility\";a:2:{s:5:\"title\";s:12:\"常用工具\";s:4:\"menu\";a:5:{s:24:\"system_utility_filecheck\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:18:\"系统文件校验\";s:3:\"url\";s:33:\"./index.php?c=system&a=filecheck&\";s:15:\"permission_name\";s:24:\"system_utility_filecheck\";s:4:\"icon\";s:10:\"wi wi-file\";s:12:\"displayorder\";i:5;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:23:\"system_utility_optimize\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"性能优化\";s:3:\"url\";s:32:\"./index.php?c=system&a=optimize&\";s:15:\"permission_name\";s:23:\"system_utility_optimize\";s:4:\"icon\";s:14:\"wi wi-optimize\";s:12:\"displayorder\";i:4;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:23:\"system_utility_database\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:9:\"数据库\";s:3:\"url\";s:32:\"./index.php?c=system&a=database&\";s:15:\"permission_name\";s:23:\"system_utility_database\";s:4:\"icon\";s:9:\"wi wi-sql\";s:12:\"displayorder\";i:3;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:19:\"system_utility_scan\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"木马查杀\";s:3:\"url\";s:28:\"./index.php?c=system&a=scan&\";s:15:\"permission_name\";s:19:\"system_utility_scan\";s:4:\"icon\";s:12:\"wi wi-safety\";s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:18:\"system_utility_bom\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:15:\"检测文件BOM\";s:3:\"url\";s:27:\"./index.php?c=system&a=bom&\";s:15:\"permission_name\";s:18:\"system_utility_bom\";s:4:\"icon\";s:9:\"wi wi-bom\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}}s:7:\"backjob\";a:2:{s:5:\"title\";s:12:\"后台任务\";s:4:\"menu\";a:1:{s:10:\"system_job\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"后台任务\";s:3:\"url\";s:38:\"./index.php?c=system&a=job&do=display&\";s:15:\"permission_name\";s:10:\"system_job\";s:4:\"icon\";s:9:\"wi wi-job\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}}}s:7:\"founder\";b:1;s:9:\"is_system\";b:1;s:10:\"is_display\";b:1;s:12:\"displayorder\";i:11;}s:4:\"help\";a:8:{s:5:\"title\";s:12:\"系统帮助\";s:4:\"icon\";s:12:\"wi wi-market\";s:3:\"url\";s:29:\"./index.php?c=help&a=display&\";s:7:\"section\";a:0:{}s:5:\"blank\";b:0;s:9:\"is_system\";b:1;s:10:\"is_display\";b:1;s:12:\"displayorder\";i:12;}s:5:\"store\";a:7:{s:5:\"title\";s:6:\"商城\";s:4:\"icon\";s:11:\"wi wi-store\";s:3:\"url\";s:43:\"./index.php?c=home&a=welcome&do=ext&m=store\";s:7:\"section\";a:0:{}s:9:\"is_system\";b:1;s:10:\"is_display\";b:1;s:12:\"displayorder\";i:13;}}');
INSERT INTO `ims_core_cache` VALUES ('we7:unimodules:0:', 'a:16:{s:5:\"basic\";a:1:{s:4:\"name\";s:5:\"basic\";}s:4:\"news\";a:1:{s:4:\"name\";s:4:\"news\";}s:5:\"music\";a:1:{s:4:\"name\";s:5:\"music\";}s:7:\"userapi\";a:1:{s:4:\"name\";s:7:\"userapi\";}s:8:\"recharge\";a:1:{s:4:\"name\";s:8:\"recharge\";}s:6:\"custom\";a:1:{s:4:\"name\";s:6:\"custom\";}s:6:\"images\";a:1:{s:4:\"name\";s:6:\"images\";}s:5:\"video\";a:1:{s:4:\"name\";s:5:\"video\";}s:5:\"voice\";a:1:{s:4:\"name\";s:5:\"voice\";}s:5:\"chats\";a:1:{s:4:\"name\";s:5:\"chats\";}s:6:\"wxcard\";a:1:{s:4:\"name\";s:6:\"wxcard\";}s:5:\"store\";a:1:{s:4:\"name\";s:5:\"store\";}s:9:\"deam_food\";a:1:{s:4:\"name\";s:9:\"deam_food\";}s:8:\"demo_app\";a:1:{s:4:\"name\";s:8:\"demo_app\";}s:11:\"yunphp_shop\";a:1:{s:4:\"name\";s:11:\"yunphp_shop\";}s:5:\"jizan\";a:1:{s:4:\"name\";s:5:\"jizan\";}}');
INSERT INTO `ims_core_cache` VALUES ('we7:unisetting:8', 'a:29:{s:7:\"uniacid\";s:1:\"8\";s:8:\"passport\";s:0:\"\";s:5:\"oauth\";s:0:\"\";s:11:\"jsauth_acid\";s:1:\"0\";s:2:\"uc\";a:1:{i:0;s:3:\"123\";}s:6:\"notify\";s:0:\"\";s:11:\"creditnames\";a:2:{s:7:\"credit1\";a:2:{s:5:\"title\";s:6:\"积分\";s:7:\"enabled\";i:1;}s:7:\"credit2\";a:2:{s:5:\"title\";s:6:\"余额\";s:7:\"enabled\";i:1;}}s:15:\"creditbehaviors\";a:2:{s:8:\"activity\";s:7:\"credit1\";s:8:\"currency\";s:7:\"credit2\";}s:7:\"welcome\";s:0:\"\";s:7:\"default\";s:0:\"\";s:15:\"default_message\";s:0:\"\";s:7:\"payment\";s:0:\"\";s:4:\"stat\";s:0:\"\";s:12:\"default_site\";s:1:\"2\";s:4:\"sync\";s:1:\"0\";s:8:\"recharge\";s:0:\"\";s:9:\"tplnotice\";s:0:\"\";s:10:\"grouplevel\";s:1:\"0\";s:8:\"mcplugin\";s:0:\"\";s:15:\"exchange_enable\";s:1:\"0\";s:11:\"coupon_type\";s:1:\"0\";s:7:\"menuset\";s:0:\"\";s:10:\"statistics\";s:0:\"\";s:11:\"bind_domain\";s:0:\"\";s:14:\"comment_status\";s:1:\"0\";s:13:\"reply_setting\";s:1:\"0\";s:14:\"default_module\";s:0:\"\";s:16:\"attachment_limit\";N;s:15:\"attachment_size\";N;}');
INSERT INTO `ims_core_cache` VALUES ('we7:uniaccount:8', 'a:37:{s:4:\"acid\";s:1:\"6\";s:7:\"uniacid\";s:1:\"8\";s:5:\"token\";s:32:\"aE8kkXXfkevXvbQHq8dnXqkEhVvfe3xm\";s:14:\"encodingaeskey\";s:43:\"D0ooKO1nKu0oItWFPtARfouK0RR0teikeko11IwRkQR\";s:5:\"level\";s:1:\"2\";s:4:\"name\";s:15:\"测试公众号\";s:7:\"account\";s:9:\"weibin755\";s:8:\"original\";s:15:\"gh_1bbd71088661\";s:9:\"signature\";s:0:\"\";s:7:\"country\";s:0:\"\";s:8:\"province\";s:0:\"\";s:4:\"city\";s:0:\"\";s:8:\"username\";s:0:\"\";s:8:\"password\";s:0:\"\";s:10:\"lastupdate\";s:1:\"0\";s:3:\"key\";s:18:\"wxd55d257d9eaa0dbf\";s:6:\"secret\";s:32:\"fb05457a108fc22802a8a1580d5173dc\";s:7:\"styleid\";s:1:\"0\";s:12:\"subscribeurl\";s:0:\"\";s:18:\"auth_refresh_token\";s:0:\"\";s:11:\"encrypt_key\";s:18:\"wxd55d257d9eaa0dbf\";s:4:\"type\";s:1:\"1\";s:9:\"isconnect\";s:1:\"1\";s:9:\"isdeleted\";s:1:\"0\";s:7:\"endtime\";s:1:\"0\";s:9:\"type_sign\";s:7:\"account\";s:3:\"uid\";s:1:\"1\";s:9:\"starttime\";s:1:\"0\";s:6:\"groups\";a:1:{i:2;a:5:{s:7:\"groupid\";s:1:\"2\";s:7:\"uniacid\";s:1:\"8\";s:5:\"title\";s:15:\"默认会员组\";s:6:\"credit\";s:1:\"0\";s:9:\"isdefault\";s:1:\"1\";}}s:7:\"setting\";a:29:{s:7:\"uniacid\";s:1:\"8\";s:8:\"passport\";s:0:\"\";s:5:\"oauth\";s:0:\"\";s:11:\"jsauth_acid\";s:1:\"0\";s:2:\"uc\";a:1:{i:0;s:3:\"123\";}s:6:\"notify\";s:0:\"\";s:11:\"creditnames\";a:2:{s:7:\"credit1\";a:2:{s:5:\"title\";s:6:\"积分\";s:7:\"enabled\";i:1;}s:7:\"credit2\";a:2:{s:5:\"title\";s:6:\"余额\";s:7:\"enabled\";i:1;}}s:15:\"creditbehaviors\";a:2:{s:8:\"activity\";s:7:\"credit1\";s:8:\"currency\";s:7:\"credit2\";}s:7:\"welcome\";s:0:\"\";s:7:\"default\";s:0:\"\";s:15:\"default_message\";s:0:\"\";s:7:\"payment\";s:0:\"\";s:4:\"stat\";s:0:\"\";s:12:\"default_site\";s:1:\"2\";s:4:\"sync\";s:1:\"0\";s:8:\"recharge\";s:0:\"\";s:9:\"tplnotice\";s:0:\"\";s:10:\"grouplevel\";s:1:\"0\";s:8:\"mcplugin\";s:0:\"\";s:15:\"exchange_enable\";s:1:\"0\";s:11:\"coupon_type\";s:1:\"0\";s:7:\"menuset\";s:0:\"\";s:10:\"statistics\";s:0:\"\";s:11:\"bind_domain\";s:0:\"\";s:14:\"comment_status\";s:1:\"0\";s:13:\"reply_setting\";s:1:\"0\";s:14:\"default_module\";s:0:\"\";s:16:\"attachment_limit\";N;s:15:\"attachment_size\";N;}s:10:\"grouplevel\";s:1:\"0\";s:4:\"logo\";s:67:\"http://snants.shenzhuo.vip/attachment/headimg_6.jpg?time=1560305878\";s:6:\"qrcode\";s:66:\"http://snants.shenzhuo.vip/attachment/qrcode_6.jpg?time=1560305878\";s:9:\"type_name\";s:9:\"公众号\";s:9:\"switchurl\";s:51:\"./index.php?c=account&a=display&do=switch&uniacid=8\";s:3:\"sms\";i:0;s:7:\"setmeal\";a:5:{s:3:\"uid\";i:-1;s:8:\"username\";s:9:\"创始人\";s:9:\"timelimit\";s:9:\"未设置\";s:7:\"groupid\";s:2:\"-1\";s:9:\"groupname\";s:12:\"所有服务\";}}');
INSERT INTO `ims_core_cache` VALUES ('we7:last_account_type', 's:7:\"account\";');
INSERT INTO `ims_core_cache` VALUES ('we7:unimodules:7:', 'a:16:{s:5:\"basic\";a:1:{s:4:\"name\";s:5:\"basic\";}s:4:\"news\";a:1:{s:4:\"name\";s:4:\"news\";}s:5:\"music\";a:1:{s:4:\"name\";s:5:\"music\";}s:7:\"userapi\";a:1:{s:4:\"name\";s:7:\"userapi\";}s:8:\"recharge\";a:1:{s:4:\"name\";s:8:\"recharge\";}s:6:\"custom\";a:1:{s:4:\"name\";s:6:\"custom\";}s:6:\"images\";a:1:{s:4:\"name\";s:6:\"images\";}s:5:\"video\";a:1:{s:4:\"name\";s:5:\"video\";}s:5:\"voice\";a:1:{s:4:\"name\";s:5:\"voice\";}s:5:\"chats\";a:1:{s:4:\"name\";s:5:\"chats\";}s:6:\"wxcard\";a:1:{s:4:\"name\";s:6:\"wxcard\";}s:5:\"store\";a:1:{s:4:\"name\";s:5:\"store\";}s:9:\"deam_food\";a:1:{s:4:\"name\";s:9:\"deam_food\";}s:8:\"demo_app\";a:1:{s:4:\"name\";s:8:\"demo_app\";}s:11:\"yunphp_shop\";a:1:{s:4:\"name\";s:11:\"yunphp_shop\";}s:5:\"jizan\";a:1:{s:4:\"name\";s:5:\"jizan\";}}');
INSERT INTO `ims_core_cache` VALUES ('we7:unimodules:3:1', 'a:16:{s:5:\"basic\";a:1:{s:4:\"name\";s:5:\"basic\";}s:4:\"news\";a:1:{s:4:\"name\";s:4:\"news\";}s:5:\"music\";a:1:{s:4:\"name\";s:5:\"music\";}s:7:\"userapi\";a:1:{s:4:\"name\";s:7:\"userapi\";}s:8:\"recharge\";a:1:{s:4:\"name\";s:8:\"recharge\";}s:6:\"custom\";a:1:{s:4:\"name\";s:6:\"custom\";}s:6:\"images\";a:1:{s:4:\"name\";s:6:\"images\";}s:5:\"video\";a:1:{s:4:\"name\";s:5:\"video\";}s:5:\"voice\";a:1:{s:4:\"name\";s:5:\"voice\";}s:5:\"chats\";a:1:{s:4:\"name\";s:5:\"chats\";}s:6:\"wxcard\";a:1:{s:4:\"name\";s:6:\"wxcard\";}s:5:\"store\";a:1:{s:4:\"name\";s:5:\"store\";}s:9:\"deam_food\";a:1:{s:4:\"name\";s:9:\"deam_food\";}s:8:\"demo_app\";a:1:{s:4:\"name\";s:8:\"demo_app\";}s:11:\"yunphp_shop\";a:1:{s:4:\"name\";s:11:\"yunphp_shop\";}s:5:\"jizan\";a:1:{s:4:\"name\";s:5:\"jizan\";}}');
INSERT INTO `ims_core_cache` VALUES ('we7:unimodules:7:1', 'a:16:{s:5:\"basic\";a:1:{s:4:\"name\";s:5:\"basic\";}s:4:\"news\";a:1:{s:4:\"name\";s:4:\"news\";}s:5:\"music\";a:1:{s:4:\"name\";s:5:\"music\";}s:7:\"userapi\";a:1:{s:4:\"name\";s:7:\"userapi\";}s:8:\"recharge\";a:1:{s:4:\"name\";s:8:\"recharge\";}s:6:\"custom\";a:1:{s:4:\"name\";s:6:\"custom\";}s:6:\"images\";a:1:{s:4:\"name\";s:6:\"images\";}s:5:\"video\";a:1:{s:4:\"name\";s:5:\"video\";}s:5:\"voice\";a:1:{s:4:\"name\";s:5:\"voice\";}s:5:\"chats\";a:1:{s:4:\"name\";s:5:\"chats\";}s:6:\"wxcard\";a:1:{s:4:\"name\";s:6:\"wxcard\";}s:5:\"store\";a:1:{s:4:\"name\";s:5:\"store\";}s:9:\"deam_food\";a:1:{s:4:\"name\";s:9:\"deam_food\";}s:8:\"demo_app\";a:1:{s:4:\"name\";s:8:\"demo_app\";}s:11:\"yunphp_shop\";a:1:{s:4:\"name\";s:11:\"yunphp_shop\";}s:5:\"jizan\";a:1:{s:4:\"name\";s:5:\"jizan\";}}');
INSERT INTO `ims_core_cache` VALUES ('we7:site_store_buy:6:7', 'i:0;');
INSERT INTO `ims_core_cache` VALUES ('we7:site_store_buy:6:8', 'i:0;');
INSERT INTO `ims_core_cache` VALUES ('we7:site_store_buy:1:8', 'a:0:{}');
INSERT INTO `ims_core_cache` VALUES ('we7:site_store_buy:5:8', 'a:0:{}');
INSERT INTO `ims_core_cache` VALUES ('we7:last_account:g6R58', 'i:8;');
INSERT INTO `ims_core_cache` VALUES ('we7:system_frame:8', 'a:12:{s:8:\"platform\";a:7:{s:5:\"title\";s:6:\"平台\";s:4:\"icon\";s:14:\"wi wi-platform\";s:3:\"url\";s:44:\"./index.php?c=account&a=display&do=platform&\";s:7:\"section\";a:0:{}s:9:\"is_system\";b:1;s:10:\"is_display\";b:1;s:12:\"displayorder\";i:2;}s:7:\"account\";a:7:{s:5:\"title\";s:9:\"公众号\";s:4:\"icon\";s:18:\"wi wi-white-collar\";s:3:\"url\";s:41:\"./index.php?c=home&a=welcome&do=platform&\";s:7:\"section\";a:5:{s:13:\"platform_plus\";a:2:{s:5:\"title\";s:12:\"增强功能\";s:4:\"menu\";a:5:{s:14:\"platform_reply\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"自动回复\";s:3:\"url\";s:31:\"./index.php?c=platform&a=reply&\";s:15:\"permission_name\";s:14:\"platform_reply\";s:4:\"icon\";s:11:\"wi wi-reply\";s:12:\"displayorder\";i:5;s:2:\"id\";N;s:14:\"sub_permission\";a:0:{}}s:13:\"platform_menu\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:15:\"自定义菜单\";s:3:\"url\";s:38:\"./index.php?c=platform&a=menu&do=post&\";s:15:\"permission_name\";s:13:\"platform_menu\";s:4:\"icon\";s:16:\"wi wi-custommenu\";s:12:\"displayorder\";i:4;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:11:\"platform_qr\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:22:\"二维码/转化链接\";s:3:\"url\";s:28:\"./index.php?c=platform&a=qr&\";s:15:\"permission_name\";s:11:\"platform_qr\";s:4:\"icon\";s:12:\"wi wi-qrcode\";s:12:\"displayorder\";i:3;s:2:\"id\";N;s:14:\"sub_permission\";a:0:{}}s:17:\"platform_material\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:16:\"素材/编辑器\";s:3:\"url\";s:34:\"./index.php?c=platform&a=material&\";s:15:\"permission_name\";s:17:\"platform_material\";s:4:\"icon\";s:12:\"wi wi-redact\";s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";a:2:{i:0;a:3:{s:5:\"title\";s:13:\"添加/编辑\";s:3:\"url\";s:39:\"./index.php?c=platform&a=material-post&\";s:15:\"permission_name\";s:13:\"material_post\";}i:1;a:2:{s:5:\"title\";s:6:\"删除\";s:15:\"permission_name\";s:24:\"platform_material_delete\";}}}s:13:\"platform_site\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:16:\"微官网-文章\";s:3:\"url\";s:38:\"./index.php?c=site&a=multi&do=display&\";s:15:\"permission_name\";s:13:\"platform_site\";s:4:\"icon\";s:10:\"wi wi-home\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";a:0:{}}}}s:15:\"platform_module\";a:3:{s:5:\"title\";s:12:\"应用模块\";s:4:\"menu\";a:0:{}s:10:\"is_display\";b:1;}s:2:\"mc\";a:2:{s:5:\"title\";s:6:\"粉丝\";s:4:\"menu\";a:2:{s:7:\"mc_fans\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"粉丝管理\";s:3:\"url\";s:24:\"./index.php?c=mc&a=fans&\";s:15:\"permission_name\";s:7:\"mc_fans\";s:4:\"icon\";s:16:\"wi wi-fansmanage\";s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:9:\"mc_member\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"会员管理\";s:3:\"url\";s:26:\"./index.php?c=mc&a=member&\";s:15:\"permission_name\";s:9:\"mc_member\";s:4:\"icon\";s:10:\"wi wi-fans\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}}s:7:\"profile\";a:2:{s:5:\"title\";s:6:\"配置\";s:4:\"menu\";a:4:{s:7:\"profile\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"参数配置\";s:3:\"url\";s:31:\"./index.php?c=profile&a=remote&\";s:15:\"permission_name\";s:15:\"profile_setting\";s:4:\"icon\";s:23:\"wi wi-parameter-setting\";s:12:\"displayorder\";i:4;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:7:\"payment\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"支付参数\";s:3:\"url\";s:32:\"./index.php?c=profile&a=payment&\";s:15:\"permission_name\";s:19:\"profile_pay_setting\";s:4:\"icon\";s:17:\"wi wi-pay-setting\";s:12:\"displayorder\";i:3;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:15:\"app_module_link\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"数据同步\";s:3:\"url\";s:44:\"./index.php?c=profile&a=module-link-uniacid&\";s:15:\"permission_name\";s:31:\"profile_app_module_link_uniacid\";s:4:\"icon\";s:18:\"wi wi-data-synchro\";s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:11:\"bind_domain\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"域名绑定\";s:3:\"url\";s:36:\"./index.php?c=profile&a=bind-domain&\";s:15:\"permission_name\";s:19:\"profile_bind_domain\";s:4:\"icon\";s:17:\"wi wi-bind-domain\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}}s:10:\"statistics\";a:2:{s:5:\"title\";s:6:\"统计\";s:4:\"menu\";a:2:{s:14:\"statistics_app\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"访问统计\";s:3:\"url\";s:31:\"./index.php?c=statistics&a=app&\";s:15:\"permission_name\";s:14:\"statistics_app\";s:4:\"icon\";s:17:\"wi wi-statistical\";s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:15:\"statistics_fans\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"用户统计\";s:3:\"url\";s:32:\"./index.php?c=statistics&a=fans&\";s:15:\"permission_name\";s:15:\"statistics_fans\";s:4:\"icon\";s:17:\"wi wi-statistical\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}}}s:9:\"is_system\";b:1;s:10:\"is_display\";b:1;s:12:\"displayorder\";i:3;}s:5:\"wxapp\";a:7:{s:5:\"title\";s:15:\"微信小程序\";s:4:\"icon\";s:19:\"wi wi-small-routine\";s:3:\"url\";s:38:\"./index.php?c=wxapp&a=display&do=home&\";s:7:\"section\";a:5:{s:14:\"wxapp_entrance\";a:3:{s:5:\"title\";s:15:\"小程序入口\";s:4:\"menu\";a:1:{s:20:\"module_entrance_link\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:0;s:5:\"title\";s:12:\"入口页面\";s:3:\"url\";s:36:\"./index.php?c=wxapp&a=entrance-link&\";s:15:\"permission_name\";s:19:\"wxapp_entrance_link\";s:4:\"icon\";s:18:\"wi wi-data-synchro\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}s:10:\"is_display\";i:0;}s:15:\"platform_module\";a:3:{s:5:\"title\";s:6:\"应用\";s:4:\"menu\";a:0:{}s:10:\"is_display\";b:1;}s:2:\"mc\";a:3:{s:5:\"title\";s:6:\"粉丝\";s:4:\"menu\";a:1:{s:12:\"wxapp_member\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:0;s:5:\"title\";s:6:\"会员\";s:3:\"url\";s:26:\"./index.php?c=mc&a=member&\";s:15:\"permission_name\";s:12:\"wxapp_member\";s:4:\"icon\";s:10:\"wi wi-fans\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}s:10:\"is_display\";i:0;}s:13:\"wxapp_profile\";a:2:{s:5:\"title\";s:6:\"配置\";s:4:\"menu\";a:5:{s:17:\"wxapp_module_link\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:0;s:5:\"title\";s:12:\"数据同步\";s:3:\"url\";s:42:\"./index.php?c=wxapp&a=module-link-uniacid&\";s:15:\"permission_name\";s:25:\"wxapp_module_link_uniacid\";s:4:\"icon\";s:18:\"wi wi-data-synchro\";s:12:\"displayorder\";i:5;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:13:\"wxapp_payment\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:0;s:5:\"title\";s:12:\"支付参数\";s:3:\"url\";s:30:\"./index.php?c=wxapp&a=payment&\";s:15:\"permission_name\";s:13:\"wxapp_payment\";s:4:\"icon\";s:16:\"wi wi-appsetting\";s:12:\"displayorder\";i:4;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:14:\"front_download\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:18:\"上传微信审核\";s:3:\"url\";s:37:\"./index.php?c=wxapp&a=front-download&\";s:15:\"permission_name\";s:20:\"wxapp_front_download\";s:4:\"icon\";s:13:\"wi wi-examine\";s:12:\"displayorder\";i:3;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:17:\"parameter_setting\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:0;s:5:\"title\";s:12:\"参数配置\";s:3:\"url\";s:31:\"./index.php?c=profile&a=remote&\";s:15:\"permission_name\";s:13:\"wxapp_setting\";s:4:\"icon\";s:23:\"wi wi-parameter-setting\";s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:23:\"wxapp_platform_material\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:0;s:5:\"title\";s:12:\"素材管理\";s:3:\"url\";N;s:15:\"permission_name\";s:23:\"wxapp_platform_material\";s:4:\"icon\";N;s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";a:1:{i:0;a:2:{s:5:\"title\";s:6:\"删除\";s:15:\"permission_name\";s:30:\"wxapp_platform_material_delete\";}}}}}s:10:\"statistics\";a:3:{s:5:\"title\";s:6:\"统计\";s:4:\"menu\";a:1:{s:15:\"statistics_fans\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:0;s:5:\"title\";s:12:\"访问统计\";s:3:\"url\";s:33:\"./index.php?c=wxapp&a=statistics&\";s:15:\"permission_name\";s:15:\"statistics_fans\";s:4:\"icon\";s:17:\"wi wi-statistical\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}s:10:\"is_display\";i:0;}}s:9:\"is_system\";b:1;s:10:\"is_display\";b:1;s:12:\"displayorder\";i:4;}s:6:\"webapp\";a:7:{s:5:\"title\";s:2:\"PC\";s:4:\"icon\";s:8:\"wi wi-pc\";s:3:\"url\";s:39:\"./index.php?c=webapp&a=home&do=display&\";s:7:\"section\";a:4:{s:15:\"platform_module\";a:3:{s:5:\"title\";s:12:\"应用模块\";s:4:\"menu\";a:0:{}s:10:\"is_display\";b:1;}s:2:\"mc\";a:2:{s:5:\"title\";s:6:\"粉丝\";s:4:\"menu\";a:1:{s:9:\"mc_member\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"会员管理\";s:3:\"url\";s:26:\"./index.php?c=mc&a=member&\";s:15:\"permission_name\";s:9:\"mc_member\";s:4:\"icon\";s:10:\"wi wi-fans\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}}s:6:\"webapp\";a:2:{s:5:\"title\";s:6:\"配置\";s:4:\"menu\";a:3:{s:18:\"webapp_module_link\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"数据同步\";s:3:\"url\";s:43:\"./index.php?c=webapp&a=module-link-uniacid&\";s:15:\"permission_name\";s:26:\"webapp_module_link_uniacid\";s:4:\"icon\";s:18:\"wi wi-data-synchro\";s:12:\"displayorder\";i:3;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:14:\"webapp_rewrite\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:9:\"伪静态\";s:3:\"url\";s:31:\"./index.php?c=webapp&a=rewrite&\";s:15:\"permission_name\";s:14:\"webapp_rewrite\";s:4:\"icon\";s:13:\"wi wi-rewrite\";s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:18:\"webapp_bind_domain\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:18:\"域名访问设置\";s:3:\"url\";s:35:\"./index.php?c=webapp&a=bind-domain&\";s:15:\"permission_name\";s:18:\"webapp_bind_domain\";s:4:\"icon\";s:17:\"wi wi-bind-domain\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}}s:10:\"statistics\";a:3:{s:5:\"title\";s:6:\"统计\";s:4:\"menu\";a:1:{s:14:\"statistics_app\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:0;s:5:\"title\";s:12:\"访问统计\";s:3:\"url\";s:31:\"./index.php?c=statistics&a=app&\";s:15:\"permission_name\";s:14:\"statistics_app\";s:4:\"icon\";s:17:\"wi wi-statistical\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}s:10:\"is_display\";i:0;}}s:9:\"is_system\";b:1;s:10:\"is_display\";b:1;s:12:\"displayorder\";i:5;}s:8:\"phoneapp\";a:7:{s:5:\"title\";s:3:\"APP\";s:4:\"icon\";s:18:\"wi wi-white-collar\";s:3:\"url\";s:41:\"./index.php?c=phoneapp&a=display&do=home&\";s:7:\"section\";a:2:{s:15:\"platform_module\";a:3:{s:5:\"title\";s:6:\"应用\";s:4:\"menu\";a:0:{}s:10:\"is_display\";b:1;}s:16:\"phoneapp_profile\";a:2:{s:5:\"title\";s:6:\"配置\";s:4:\"menu\";a:1:{s:14:\"front_download\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:9:\"下载APP\";s:3:\"url\";s:40:\"./index.php?c=phoneapp&a=front-download&\";s:15:\"permission_name\";s:23:\"phoneapp_front_download\";s:4:\"icon\";s:13:\"wi wi-examine\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}}}s:9:\"is_system\";b:1;s:10:\"is_display\";b:1;s:12:\"displayorder\";i:6;}s:5:\"xzapp\";a:7:{s:5:\"title\";s:9:\"熊掌号\";s:4:\"icon\";s:18:\"wi wi-white-collar\";s:3:\"url\";s:38:\"./index.php?c=xzapp&a=home&do=display&\";s:7:\"section\";a:1:{s:15:\"platform_module\";a:3:{s:5:\"title\";s:12:\"应用模块\";s:4:\"menu\";a:0:{}s:10:\"is_display\";b:1;}}s:9:\"is_system\";b:1;s:10:\"is_display\";b:1;s:12:\"displayorder\";i:7;}s:6:\"aliapp\";a:7:{s:5:\"title\";s:18:\"支付宝小程序\";s:4:\"icon\";s:18:\"wi wi-white-collar\";s:3:\"url\";s:40:\"./index.php?c=miniapp&a=display&do=home&\";s:7:\"section\";a:1:{s:15:\"platform_module\";a:3:{s:5:\"title\";s:6:\"应用\";s:4:\"menu\";a:0:{}s:10:\"is_display\";b:1;}}s:9:\"is_system\";b:1;s:10:\"is_display\";b:1;s:12:\"displayorder\";i:8;}s:6:\"module\";a:7:{s:5:\"title\";s:6:\"应用\";s:4:\"icon\";s:11:\"wi wi-apply\";s:3:\"url\";s:31:\"./index.php?c=module&a=display&\";s:7:\"section\";a:0:{}s:9:\"is_system\";b:1;s:10:\"is_display\";b:1;s:12:\"displayorder\";i:9;}s:6:\"system\";a:7:{s:5:\"title\";s:6:\"系统\";s:4:\"icon\";s:13:\"wi wi-setting\";s:3:\"url\";s:39:\"./index.php?c=home&a=welcome&do=system&\";s:7:\"section\";a:13:{s:10:\"wxplatform\";a:2:{s:5:\"title\";s:9:\"公众号\";s:4:\"menu\";a:4:{s:14:\"system_account\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:16:\" 微信公众号\";s:3:\"url\";s:45:\"./index.php?c=account&a=manage&account_type=1\";s:15:\"permission_name\";s:14:\"system_account\";s:4:\"icon\";s:12:\"wi wi-wechat\";s:12:\"displayorder\";i:4;s:2:\"id\";N;s:14:\"sub_permission\";a:6:{i:0;a:2:{s:5:\"title\";s:21:\"公众号管理设置\";s:15:\"permission_name\";s:21:\"system_account_manage\";}i:1;a:2:{s:5:\"title\";s:15:\"添加公众号\";s:15:\"permission_name\";s:19:\"system_account_post\";}i:2;a:2:{s:5:\"title\";s:15:\"公众号停用\";s:15:\"permission_name\";s:19:\"system_account_stop\";}i:3;a:2:{s:5:\"title\";s:18:\"公众号回收站\";s:15:\"permission_name\";s:22:\"system_account_recycle\";}i:4;a:2:{s:5:\"title\";s:15:\"公众号删除\";s:15:\"permission_name\";s:21:\"system_account_delete\";}i:5;a:2:{s:5:\"title\";s:15:\"公众号恢复\";s:15:\"permission_name\";s:22:\"system_account_recover\";}}}s:13:\"system_module\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:15:\"公众号应用\";s:3:\"url\";s:60:\"./index.php?c=module&a=manage-system&support=account_support\";s:15:\"permission_name\";s:13:\"system_module\";s:4:\"icon\";s:14:\"wi wi-wx-apply\";s:12:\"displayorder\";i:3;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:15:\"system_template\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:15:\"微官网模板\";s:3:\"url\";s:32:\"./index.php?c=system&a=template&\";s:15:\"permission_name\";s:15:\"system_template\";s:4:\"icon\";s:17:\"wi wi-wx-template\";s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:15:\"system_platform\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:19:\" 微信开放平台\";s:3:\"url\";s:32:\"./index.php?c=system&a=platform&\";s:15:\"permission_name\";s:15:\"system_platform\";s:4:\"icon\";s:20:\"wi wi-exploitsetting\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}}s:6:\"module\";a:2:{s:5:\"title\";s:9:\"小程序\";s:4:\"menu\";a:2:{s:12:\"system_wxapp\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:15:\"微信小程序\";s:3:\"url\";s:45:\"./index.php?c=account&a=manage&account_type=4\";s:15:\"permission_name\";s:12:\"system_wxapp\";s:4:\"icon\";s:11:\"wi wi-wxapp\";s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";a:6:{i:0;a:2:{s:5:\"title\";s:21:\"小程序管理设置\";s:15:\"permission_name\";s:19:\"system_wxapp_manage\";}i:1;a:2:{s:5:\"title\";s:15:\"添加小程序\";s:15:\"permission_name\";s:17:\"system_wxapp_post\";}i:2;a:2:{s:5:\"title\";s:15:\"小程序停用\";s:15:\"permission_name\";s:17:\"system_wxapp_stop\";}i:3;a:2:{s:5:\"title\";s:18:\"小程序回收站\";s:15:\"permission_name\";s:20:\"system_wxapp_recycle\";}i:4;a:2:{s:5:\"title\";s:15:\"小程序删除\";s:15:\"permission_name\";s:19:\"system_wxapp_delete\";}i:5;a:2:{s:5:\"title\";s:15:\"小程序恢复\";s:15:\"permission_name\";s:20:\"system_wxapp_recover\";}}}s:19:\"system_module_wxapp\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:15:\"小程序应用\";s:3:\"url\";s:58:\"./index.php?c=module&a=manage-system&support=wxapp_support\";s:15:\"permission_name\";s:19:\"system_module_wxapp\";s:4:\"icon\";s:17:\"wi wi-wxapp-apply\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}}s:7:\"welcome\";a:3:{s:5:\"title\";s:12:\"系统首页\";s:4:\"menu\";a:1:{s:14:\"system_welcome\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:18:\"系统首页应用\";s:3:\"url\";s:60:\"./index.php?c=module&a=manage-system&support=welcome_support\";s:15:\"permission_name\";s:14:\"system_welcome\";s:4:\"icon\";s:11:\"wi wi-wxapp\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}s:7:\"founder\";b:1;}s:6:\"webapp\";a:2:{s:5:\"title\";s:2:\"PC\";s:4:\"menu\";a:2:{s:13:\"system_webapp\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:2:\"PC\";s:3:\"url\";s:45:\"./index.php?c=account&a=manage&account_type=5\";s:15:\"permission_name\";s:13:\"system_webapp\";s:4:\"icon\";s:8:\"wi wi-pc\";s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";a:0:{}}s:20:\"system_module_webapp\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:8:\"PC应用\";s:3:\"url\";s:59:\"./index.php?c=module&a=manage-system&support=webapp_support\";s:15:\"permission_name\";s:20:\"system_module_webapp\";s:4:\"icon\";s:14:\"wi wi-pc-apply\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}}s:8:\"phoneapp\";a:2:{s:5:\"title\";s:3:\"APP\";s:4:\"menu\";a:2:{s:15:\"system_phoneapp\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:3:\"APP\";s:3:\"url\";s:45:\"./index.php?c=account&a=manage&account_type=6\";s:15:\"permission_name\";s:15:\"system_phoneapp\";s:4:\"icon\";s:9:\"wi wi-app\";s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";a:0:{}}s:22:\"system_module_phoneapp\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:9:\"APP应用\";s:3:\"url\";s:61:\"./index.php?c=module&a=manage-system&support=phoneapp_support\";s:15:\"permission_name\";s:22:\"system_module_phoneapp\";s:4:\"icon\";s:15:\"wi wi-app-apply\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}}s:5:\"xzapp\";a:2:{s:5:\"title\";s:9:\"熊掌号\";s:4:\"menu\";a:2:{s:12:\"system_xzapp\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:9:\"熊掌号\";s:3:\"url\";s:45:\"./index.php?c=account&a=manage&account_type=9\";s:15:\"permission_name\";s:12:\"system_xzapp\";s:4:\"icon\";s:11:\"wi wi-xzapp\";s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";a:0:{}}s:19:\"system_module_xzapp\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:15:\"熊掌号应用\";s:3:\"url\";s:58:\"./index.php?c=module&a=manage-system&support=xzapp_support\";s:15:\"permission_name\";s:19:\"system_module_xzapp\";s:4:\"icon\";s:17:\"wi wi-xzapp-apply\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}}s:6:\"aliapp\";a:2:{s:5:\"title\";s:18:\"支付宝小程序\";s:4:\"menu\";a:2:{s:13:\"system_aliapp\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:18:\"支付宝小程序\";s:3:\"url\";s:46:\"./index.php?c=account&a=manage&account_type=11\";s:15:\"permission_name\";s:13:\"system_aliapp\";s:4:\"icon\";s:12:\"wi wi-aliapp\";s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";a:0:{}}s:20:\"system_module_aliapp\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:24:\"支付宝小程序应用\";s:3:\"url\";s:59:\"./index.php?c=module&a=manage-system&support=aliapp_support\";s:15:\"permission_name\";s:20:\"system_module_aliapp\";s:4:\"icon\";s:18:\"wi wi-aliapp-apply\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}}s:4:\"user\";a:2:{s:5:\"title\";s:13:\"帐户/用户\";s:4:\"menu\";a:3:{s:9:\"system_my\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"我的帐户\";s:3:\"url\";s:29:\"./index.php?c=user&a=profile&\";s:15:\"permission_name\";s:9:\"system_my\";s:4:\"icon\";s:10:\"wi wi-user\";s:12:\"displayorder\";i:3;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:11:\"system_user\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"用户管理\";s:3:\"url\";s:29:\"./index.php?c=user&a=display&\";s:15:\"permission_name\";s:11:\"system_user\";s:4:\"icon\";s:16:\"wi wi-user-group\";s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";a:7:{i:0;a:2:{s:5:\"title\";s:12:\"编辑用户\";s:15:\"permission_name\";s:16:\"system_user_post\";}i:1;a:2:{s:5:\"title\";s:12:\"审核用户\";s:15:\"permission_name\";s:17:\"system_user_check\";}i:2;a:2:{s:5:\"title\";s:12:\"店员管理\";s:15:\"permission_name\";s:17:\"system_user_clerk\";}i:3;a:2:{s:5:\"title\";s:15:\"用户回收站\";s:15:\"permission_name\";s:19:\"system_user_recycle\";}i:4;a:2:{s:5:\"title\";s:18:\"用户属性设置\";s:15:\"permission_name\";s:18:\"system_user_fields\";}i:5;a:2:{s:5:\"title\";s:31:\"用户属性设置-编辑字段\";s:15:\"permission_name\";s:23:\"system_user_fields_post\";}i:6;a:2:{s:5:\"title\";s:18:\"用户注册设置\";s:15:\"permission_name\";s:23:\"system_user_registerset\";}}}s:25:\"system_user_founder_group\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:15:\"副创始人组\";s:3:\"url\";s:32:\"./index.php?c=founder&a=display&\";s:15:\"permission_name\";s:21:\"system_founder_manage\";s:4:\"icon\";s:16:\"wi wi-co-founder\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";a:6:{i:0;a:2:{s:5:\"title\";s:18:\"添加创始人组\";s:15:\"permission_name\";s:24:\"system_founder_group_add\";}i:1;a:2:{s:5:\"title\";s:18:\"编辑创始人组\";s:15:\"permission_name\";s:25:\"system_founder_group_post\";}i:2;a:2:{s:5:\"title\";s:18:\"删除创始人组\";s:15:\"permission_name\";s:24:\"system_founder_group_del\";}i:3;a:2:{s:5:\"title\";s:15:\"添加创始人\";s:15:\"permission_name\";s:23:\"system_founder_user_add\";}i:4;a:2:{s:5:\"title\";s:15:\"编辑创始人\";s:15:\"permission_name\";s:24:\"system_founder_user_post\";}i:5;a:2:{s:5:\"title\";s:15:\"删除创始人\";s:15:\"permission_name\";s:23:\"system_founder_user_del\";}}}}}s:10:\"permission\";a:2:{s:5:\"title\";s:12:\"权限管理\";s:4:\"menu\";a:2:{s:19:\"system_module_group\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:15:\"应用权限组\";s:3:\"url\";s:29:\"./index.php?c=module&a=group&\";s:15:\"permission_name\";s:19:\"system_module_group\";s:4:\"icon\";s:21:\"wi wi-appjurisdiction\";s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";a:3:{i:0;a:2:{s:5:\"title\";s:21:\"添加应用权限组\";s:15:\"permission_name\";s:23:\"system_module_group_add\";}i:1;a:2:{s:5:\"title\";s:21:\"编辑应用权限组\";s:15:\"permission_name\";s:24:\"system_module_group_post\";}i:2;a:2:{s:5:\"title\";s:21:\"删除应用权限组\";s:15:\"permission_name\";s:23:\"system_module_group_del\";}}}s:17:\"system_user_group\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:15:\"用户权限组\";s:3:\"url\";s:27:\"./index.php?c=user&a=group&\";s:15:\"permission_name\";s:17:\"system_user_group\";s:4:\"icon\";s:22:\"wi wi-userjurisdiction\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";a:3:{i:0;a:2:{s:5:\"title\";s:15:\"添加用户组\";s:15:\"permission_name\";s:21:\"system_user_group_add\";}i:1;a:2:{s:5:\"title\";s:15:\"编辑用户组\";s:15:\"permission_name\";s:22:\"system_user_group_post\";}i:2;a:2:{s:5:\"title\";s:15:\"删除用户组\";s:15:\"permission_name\";s:21:\"system_user_group_del\";}}}}}s:7:\"article\";a:2:{s:5:\"title\";s:13:\"文章/公告\";s:4:\"menu\";a:2:{s:14:\"system_article\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"文章管理\";s:3:\"url\";s:29:\"./index.php?c=article&a=news&\";s:15:\"permission_name\";s:19:\"system_article_news\";s:4:\"icon\";s:13:\"wi wi-article\";s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:21:\"system_article_notice\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"公告管理\";s:3:\"url\";s:31:\"./index.php?c=article&a=notice&\";s:15:\"permission_name\";s:21:\"system_article_notice\";s:4:\"icon\";s:12:\"wi wi-notice\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}}s:7:\"message\";a:2:{s:5:\"title\";s:12:\"消息提醒\";s:4:\"menu\";a:1:{s:21:\"system_message_notice\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"消息提醒\";s:3:\"url\";s:31:\"./index.php?c=message&a=notice&\";s:15:\"permission_name\";s:21:\"system_message_notice\";s:4:\"icon\";s:10:\"wi wi-bell\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}}s:17:\"system_statistics\";a:2:{s:5:\"title\";s:6:\"统计\";s:4:\"menu\";a:1:{s:23:\"system_account_analysis\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"访问统计\";s:3:\"url\";s:35:\"./index.php?c=statistics&a=account&\";s:15:\"permission_name\";s:23:\"system_account_analysis\";s:4:\"icon\";s:17:\"wi wi-statistical\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}}s:5:\"cache\";a:2:{s:5:\"title\";s:6:\"缓存\";s:4:\"menu\";a:1:{s:26:\"system_setting_updatecache\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"更新缓存\";s:3:\"url\";s:35:\"./index.php?c=system&a=updatecache&\";s:15:\"permission_name\";s:26:\"system_setting_updatecache\";s:4:\"icon\";s:12:\"wi wi-update\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}}}s:9:\"is_system\";b:1;s:10:\"is_display\";b:1;s:12:\"displayorder\";i:10;}s:4:\"site\";a:8:{s:5:\"title\";s:6:\"站点\";s:4:\"icon\";s:17:\"wi wi-system-site\";s:3:\"url\";s:28:\"./index.php?c=system&a=site&\";s:7:\"section\";a:3:{s:7:\"setting\";a:2:{s:5:\"title\";s:6:\"设置\";s:4:\"menu\";a:9:{s:19:\"system_setting_site\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"站点设置\";s:3:\"url\";s:28:\"./index.php?c=system&a=site&\";s:15:\"permission_name\";s:19:\"system_setting_site\";s:4:\"icon\";s:18:\"wi wi-site-setting\";s:12:\"displayorder\";i:9;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:19:\"system_setting_menu\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"菜单设置\";s:3:\"url\";s:28:\"./index.php?c=system&a=menu&\";s:15:\"permission_name\";s:19:\"system_setting_menu\";s:4:\"icon\";s:18:\"wi wi-menu-setting\";s:12:\"displayorder\";i:8;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:25:\"system_setting_attachment\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"附件设置\";s:3:\"url\";s:34:\"./index.php?c=system&a=attachment&\";s:15:\"permission_name\";s:25:\"system_setting_attachment\";s:4:\"icon\";s:16:\"wi wi-attachment\";s:12:\"displayorder\";i:7;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:25:\"system_setting_systeminfo\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"系统信息\";s:3:\"url\";s:34:\"./index.php?c=system&a=systeminfo&\";s:15:\"permission_name\";s:25:\"system_setting_systeminfo\";s:4:\"icon\";s:17:\"wi wi-system-info\";s:12:\"displayorder\";i:6;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:19:\"system_setting_logs\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"查看日志\";s:3:\"url\";s:28:\"./index.php?c=system&a=logs&\";s:15:\"permission_name\";s:19:\"system_setting_logs\";s:4:\"icon\";s:9:\"wi wi-log\";s:12:\"displayorder\";i:5;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:26:\"system_setting_ipwhitelist\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:11:\"IP白名单\";s:3:\"url\";s:35:\"./index.php?c=system&a=ipwhitelist&\";s:15:\"permission_name\";s:26:\"system_setting_ipwhitelist\";s:4:\"icon\";s:8:\"wi wi-ip\";s:12:\"displayorder\";i:4;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:28:\"system_setting_sensitiveword\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:15:\"过滤敏感词\";s:3:\"url\";s:37:\"./index.php?c=system&a=sensitiveword&\";s:15:\"permission_name\";s:28:\"system_setting_sensitiveword\";s:4:\"icon\";s:15:\"wi wi-sensitive\";s:12:\"displayorder\";i:3;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:25:\"system_setting_thirdlogin\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:25:\"用户登录/注册设置\";s:3:\"url\";s:33:\"./index.php?c=user&a=registerset&\";s:15:\"permission_name\";s:25:\"system_setting_thirdlogin\";s:4:\"icon\";s:10:\"wi wi-user\";s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:20:\"system_setting_oauth\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:17:\"oauth全局设置\";s:3:\"url\";s:29:\"./index.php?c=system&a=oauth&\";s:15:\"permission_name\";s:20:\"system_setting_oauth\";s:4:\"icon\";s:11:\"wi wi-oauth\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}}s:7:\"utility\";a:2:{s:5:\"title\";s:12:\"常用工具\";s:4:\"menu\";a:5:{s:24:\"system_utility_filecheck\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:18:\"系统文件校验\";s:3:\"url\";s:33:\"./index.php?c=system&a=filecheck&\";s:15:\"permission_name\";s:24:\"system_utility_filecheck\";s:4:\"icon\";s:10:\"wi wi-file\";s:12:\"displayorder\";i:5;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:23:\"system_utility_optimize\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"性能优化\";s:3:\"url\";s:32:\"./index.php?c=system&a=optimize&\";s:15:\"permission_name\";s:23:\"system_utility_optimize\";s:4:\"icon\";s:14:\"wi wi-optimize\";s:12:\"displayorder\";i:4;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:23:\"system_utility_database\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:9:\"数据库\";s:3:\"url\";s:32:\"./index.php?c=system&a=database&\";s:15:\"permission_name\";s:23:\"system_utility_database\";s:4:\"icon\";s:9:\"wi wi-sql\";s:12:\"displayorder\";i:3;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:19:\"system_utility_scan\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"木马查杀\";s:3:\"url\";s:28:\"./index.php?c=system&a=scan&\";s:15:\"permission_name\";s:19:\"system_utility_scan\";s:4:\"icon\";s:12:\"wi wi-safety\";s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:18:\"system_utility_bom\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:15:\"检测文件BOM\";s:3:\"url\";s:27:\"./index.php?c=system&a=bom&\";s:15:\"permission_name\";s:18:\"system_utility_bom\";s:4:\"icon\";s:9:\"wi wi-bom\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}}s:7:\"backjob\";a:2:{s:5:\"title\";s:12:\"后台任务\";s:4:\"menu\";a:1:{s:10:\"system_job\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"后台任务\";s:3:\"url\";s:38:\"./index.php?c=system&a=job&do=display&\";s:15:\"permission_name\";s:10:\"system_job\";s:4:\"icon\";s:9:\"wi wi-job\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}}}s:7:\"founder\";b:1;s:9:\"is_system\";b:1;s:10:\"is_display\";b:1;s:12:\"displayorder\";i:11;}s:4:\"help\";a:8:{s:5:\"title\";s:12:\"系统帮助\";s:4:\"icon\";s:12:\"wi wi-market\";s:3:\"url\";s:29:\"./index.php?c=help&a=display&\";s:7:\"section\";a:0:{}s:5:\"blank\";b:0;s:9:\"is_system\";b:1;s:10:\"is_display\";b:1;s:12:\"displayorder\";i:12;}s:5:\"store\";a:7:{s:5:\"title\";s:6:\"商城\";s:4:\"icon\";s:11:\"wi wi-store\";s:3:\"url\";s:43:\"./index.php?c=home&a=welcome&do=ext&m=store\";s:7:\"section\";a:0:{}s:9:\"is_system\";b:1;s:10:\"is_display\";b:1;s:12:\"displayorder\";i:13;}}');
INSERT INTO `ims_core_cache` VALUES ('we7:module_setting:basic:8', 'a:1:{s:6:\"module\";s:5:\"basic\";}');
INSERT INTO `ims_core_cache` VALUES ('we7:module_setting:news:8', 'a:1:{s:6:\"module\";s:4:\"news\";}');
INSERT INTO `ims_core_cache` VALUES ('we7:module_setting:music:8', 'a:1:{s:6:\"module\";s:5:\"music\";}');
INSERT INTO `ims_core_cache` VALUES ('we7:module_setting:userapi:8', 'a:1:{s:6:\"module\";s:7:\"userapi\";}');
INSERT INTO `ims_core_cache` VALUES ('we7:module_setting:recharge:8', 'a:1:{s:6:\"module\";s:8:\"recharge\";}');
INSERT INTO `ims_core_cache` VALUES ('we7:module_setting:custom:8', 'a:1:{s:6:\"module\";s:6:\"custom\";}');
INSERT INTO `ims_core_cache` VALUES ('we7:module_setting:images:8', 'a:1:{s:6:\"module\";s:6:\"images\";}');
INSERT INTO `ims_core_cache` VALUES ('we7:module_setting:video:8', 'a:1:{s:6:\"module\";s:5:\"video\";}');
INSERT INTO `ims_core_cache` VALUES ('we7:module_setting:voice:8', 'a:1:{s:6:\"module\";s:5:\"voice\";}');
INSERT INTO `ims_core_cache` VALUES ('we7:module_setting:chats:8', 'a:1:{s:6:\"module\";s:5:\"chats\";}');
INSERT INTO `ims_core_cache` VALUES ('we7:module_setting:wxcard:8', 'a:1:{s:6:\"module\";s:6:\"wxcard\";}');
INSERT INTO `ims_core_cache` VALUES ('we7:module_setting:store:8', 'a:1:{s:6:\"module\";s:5:\"store\";}');
INSERT INTO `ims_core_cache` VALUES ('we7:module_setting:deam_food:8', 'a:1:{s:6:\"module\";s:9:\"deam_food\";}');
INSERT INTO `ims_core_cache` VALUES ('we7:module_setting:demo_app:8', 'a:1:{s:6:\"module\";s:8:\"demo_app\";}');
INSERT INTO `ims_core_cache` VALUES ('we7:module_setting:yunphp_shop:8', 'a:1:{s:6:\"module\";s:11:\"yunphp_shop\";}');
INSERT INTO `ims_core_cache` VALUES ('we7:module_setting:jizan:8', 'a:1:{s:6:\"module\";s:5:\"jizan\";}');
INSERT INTO `ims_core_cache` VALUES ('we7:stat_todaylock:8', 'a:1:{s:6:\"expire\";i:1561955663;}');
INSERT INTO `ims_core_cache` VALUES ('we7:unicount:8', 's:1:\"1\";');
INSERT INTO `ims_core_cache` VALUES ('yunphp_shop_e3c814d41c557b3ff00bc2f8ee6ceb7b', 'a:0:{}');
INSERT INTO `ims_core_cache` VALUES ('yunphp_shop_d6cd81c617919ea52c071c80195a59d4', 'a:0:{}');
INSERT INTO `ims_core_cache` VALUES ('yunphp_shop_9a52bfbf32243c1f30edc58b89a2935a', 'a:0:{}');
INSERT INTO `ims_core_cache` VALUES ('yunphp_shop_a4676ec36c0e61443f52f5bf9c711135', 'a:11:{i:0;a:13:{s:2:\"id\";s:1:\"1\";s:12:\"displayorder\";s:1:\"1\";s:8:\"identity\";s:5:\"qiniu\";s:4:\"name\";s:12:\"七牛存储\";s:7:\"version\";s:3:\"1.0\";s:6:\"author\";s:6:\"官方\";s:6:\"status\";s:1:\"1\";s:8:\"category\";s:4:\"tool\";s:5:\"thumb\";s:45:\"../addons/yunphp_shop/static/images/qiniu.jpg\";s:4:\"desc\";N;s:5:\"iscom\";s:1:\"1\";s:10:\"deprecated\";s:1:\"0\";s:4:\"isv2\";s:1:\"0\";}i:1;a:13:{s:2:\"id\";s:1:\"5\";s:12:\"displayorder\";s:1:\"5\";s:8:\"identity\";s:6:\"verify\";s:4:\"name\";s:9:\"O2O核销\";s:7:\"version\";s:3:\"1.0\";s:6:\"author\";s:6:\"官方\";s:6:\"status\";s:1:\"1\";s:8:\"category\";s:3:\"biz\";s:5:\"thumb\";s:46:\"../addons/yunphp_shop/static/images/verify.jpg\";s:4:\"desc\";N;s:5:\"iscom\";s:1:\"1\";s:10:\"deprecated\";s:1:\"0\";s:4:\"isv2\";s:1:\"0\";}i:2;a:13:{s:2:\"id\";s:1:\"6\";s:12:\"displayorder\";s:1:\"6\";s:8:\"identity\";s:8:\"tmessage\";s:4:\"name\";s:12:\"会员群发\";s:7:\"version\";s:3:\"1.0\";s:6:\"author\";s:6:\"官方\";s:6:\"status\";s:1:\"1\";s:8:\"category\";s:4:\"tool\";s:5:\"thumb\";s:48:\"../addons/yunphp_shop/static/images/tmessage.jpg\";s:4:\"desc\";N;s:5:\"iscom\";s:1:\"1\";s:10:\"deprecated\";s:1:\"0\";s:4:\"isv2\";s:1:\"0\";}i:3;a:13:{s:2:\"id\";s:1:\"7\";s:12:\"displayorder\";s:1:\"7\";s:8:\"identity\";s:4:\"perm\";s:4:\"name\";s:12:\"分权系统\";s:7:\"version\";s:3:\"1.0\";s:6:\"author\";s:6:\"官方\";s:6:\"status\";s:1:\"1\";s:8:\"category\";s:4:\"help\";s:5:\"thumb\";s:44:\"../addons/yunphp_shop/static/images/perm.jpg\";s:4:\"desc\";N;s:5:\"iscom\";s:1:\"1\";s:10:\"deprecated\";s:1:\"0\";s:4:\"isv2\";s:1:\"0\";}i:4;a:13:{s:2:\"id\";s:1:\"8\";s:12:\"displayorder\";s:1:\"8\";s:8:\"identity\";s:4:\"sale\";s:4:\"name\";s:9:\"营销宝\";s:7:\"version\";s:3:\"1.0\";s:6:\"author\";s:6:\"官方\";s:6:\"status\";s:1:\"1\";s:8:\"category\";s:4:\"sale\";s:5:\"thumb\";s:44:\"../addons/yunphp_shop/static/images/sale.jpg\";s:4:\"desc\";N;s:5:\"iscom\";s:1:\"1\";s:10:\"deprecated\";s:1:\"0\";s:4:\"isv2\";s:1:\"0\";}i:5;a:13:{s:2:\"id\";s:2:\"11\";s:12:\"displayorder\";s:2:\"11\";s:8:\"identity\";s:7:\"virtual\";s:4:\"name\";s:12:\"虚拟物品\";s:7:\"version\";s:3:\"1.0\";s:6:\"author\";s:6:\"官方\";s:6:\"status\";s:1:\"1\";s:8:\"category\";s:3:\"biz\";s:5:\"thumb\";s:47:\"../addons/yunphp_shop/static/images/virtual.jpg\";s:4:\"desc\";N;s:5:\"iscom\";s:1:\"1\";s:10:\"deprecated\";s:1:\"0\";s:4:\"isv2\";s:1:\"0\";}i:6;a:13:{s:2:\"id\";s:2:\"13\";s:12:\"displayorder\";s:2:\"13\";s:8:\"identity\";s:6:\"coupon\";s:4:\"name\";s:9:\"超级券\";s:7:\"version\";s:3:\"1.0\";s:6:\"author\";s:6:\"官方\";s:6:\"status\";s:1:\"1\";s:8:\"category\";s:4:\"sale\";s:5:\"thumb\";s:46:\"../addons/yunphp_shop/static/images/coupon.jpg\";s:4:\"desc\";N;s:5:\"iscom\";s:1:\"1\";s:10:\"deprecated\";s:1:\"0\";s:4:\"isv2\";s:1:\"0\";}i:7;a:13:{s:2:\"id\";s:2:\"24\";s:12:\"displayorder\";s:2:\"27\";s:8:\"identity\";s:3:\"sms\";s:4:\"name\";s:12:\"短信提醒\";s:7:\"version\";s:3:\"1.0\";s:6:\"author\";s:6:\"官方\";s:6:\"status\";s:1:\"1\";s:8:\"category\";s:4:\"tool\";s:5:\"thumb\";s:43:\"../addons/yunphp_shop/static/images/sms.jpg\";s:4:\"desc\";s:0:\"\";s:5:\"iscom\";s:1:\"1\";s:10:\"deprecated\";s:1:\"0\";s:4:\"isv2\";s:1:\"1\";}i:8;a:13:{s:2:\"id\";s:2:\"27\";s:12:\"displayorder\";s:2:\"33\";s:8:\"identity\";s:3:\"wap\";s:4:\"name\";s:9:\"全网通\";s:7:\"version\";s:3:\"1.0\";s:6:\"author\";s:6:\"官方\";s:6:\"status\";s:1:\"1\";s:8:\"category\";s:4:\"tool\";s:5:\"thumb\";s:0:\"\";s:4:\"desc\";s:0:\"\";s:5:\"iscom\";s:1:\"1\";s:10:\"deprecated\";s:1:\"0\";s:4:\"isv2\";s:1:\"1\";}i:9;a:13:{s:2:\"id\";s:2:\"30\";s:12:\"displayorder\";s:2:\"33\";s:8:\"identity\";s:7:\"printer\";s:4:\"name\";s:15:\"小票打印机\";s:7:\"version\";s:3:\"1.0\";s:6:\"author\";s:6:\"官方\";s:6:\"status\";s:1:\"1\";s:8:\"category\";s:4:\"tool\";s:5:\"thumb\";s:0:\"\";s:4:\"desc\";s:0:\"\";s:5:\"iscom\";s:1:\"1\";s:10:\"deprecated\";s:1:\"0\";s:4:\"isv2\";s:1:\"1\";}i:10;a:13:{s:2:\"id\";s:2:\"28\";s:12:\"displayorder\";s:2:\"34\";s:8:\"identity\";s:5:\"h5app\";s:4:\"name\";s:5:\"H5APP\";s:7:\"version\";s:3:\"1.0\";s:6:\"author\";s:6:\"官方\";s:6:\"status\";s:1:\"1\";s:8:\"category\";s:4:\"tool\";s:5:\"thumb\";s:0:\"\";s:4:\"desc\";s:0:\"\";s:5:\"iscom\";s:1:\"1\";s:10:\"deprecated\";s:1:\"0\";s:4:\"isv2\";s:1:\"1\";}}');
INSERT INTO `ims_core_cache` VALUES ('yunphp_shop_09110ee6c3659ae7c87f306b6c6a8616', 'a:29:{i:0;a:13:{s:2:\"id\";s:1:\"2\";s:12:\"displayorder\";s:1:\"2\";s:8:\"identity\";s:6:\"taobao\";s:4:\"name\";s:12:\"商品助手\";s:7:\"version\";s:3:\"1.0\";s:6:\"author\";s:6:\"官方\";s:6:\"status\";s:1:\"1\";s:8:\"category\";s:4:\"tool\";s:5:\"thumb\";s:46:\"../addons/yunphp_shop/static/images/taobao.jpg\";s:4:\"desc\";s:0:\"\";s:5:\"iscom\";s:1:\"0\";s:10:\"deprecated\";s:1:\"0\";s:4:\"isv2\";s:1:\"0\";}i:1;a:13:{s:2:\"id\";s:1:\"3\";s:12:\"displayorder\";s:1:\"3\";s:8:\"identity\";s:10:\"commission\";s:4:\"name\";s:12:\"分销系统\";s:7:\"version\";s:3:\"1.0\";s:6:\"author\";s:6:\"官方\";s:6:\"status\";s:1:\"1\";s:8:\"category\";s:3:\"biz\";s:5:\"thumb\";s:50:\"../addons/yunphp_shop/static/images/commission.jpg\";s:4:\"desc\";s:0:\"\";s:5:\"iscom\";s:1:\"0\";s:10:\"deprecated\";s:1:\"0\";s:4:\"isv2\";s:1:\"0\";}i:2;a:13:{s:2:\"id\";s:1:\"4\";s:12:\"displayorder\";s:1:\"4\";s:8:\"identity\";s:6:\"poster\";s:4:\"name\";s:12:\"超级海报\";s:7:\"version\";s:3:\"1.2\";s:6:\"author\";s:6:\"官方\";s:6:\"status\";s:1:\"1\";s:8:\"category\";s:4:\"sale\";s:5:\"thumb\";s:46:\"../addons/yunphp_shop/static/images/poster.jpg\";s:4:\"desc\";s:0:\"\";s:5:\"iscom\";s:1:\"0\";s:10:\"deprecated\";s:1:\"0\";s:4:\"isv2\";s:1:\"0\";}i:3;a:13:{s:2:\"id\";s:2:\"10\";s:12:\"displayorder\";s:2:\"10\";s:8:\"identity\";s:10:\"creditshop\";s:4:\"name\";s:12:\"积分商城\";s:7:\"version\";s:3:\"1.0\";s:6:\"author\";s:6:\"官方\";s:6:\"status\";s:1:\"1\";s:8:\"category\";s:3:\"biz\";s:5:\"thumb\";s:50:\"../addons/yunphp_shop/static/images/creditshop.jpg\";s:4:\"desc\";s:0:\"\";s:5:\"iscom\";s:1:\"0\";s:10:\"deprecated\";s:1:\"0\";s:4:\"isv2\";s:1:\"0\";}i:4;a:13:{s:2:\"id\";s:2:\"12\";s:12:\"displayorder\";s:2:\"11\";s:8:\"identity\";s:7:\"article\";s:4:\"name\";s:12:\"文章营销\";s:7:\"version\";s:3:\"1.0\";s:6:\"author\";s:6:\"官方\";s:6:\"status\";s:1:\"1\";s:8:\"category\";s:4:\"help\";s:5:\"thumb\";s:47:\"../addons/yunphp_shop/static/images/article.jpg\";s:4:\"desc\";s:0:\"\";s:5:\"iscom\";s:1:\"0\";s:10:\"deprecated\";s:1:\"0\";s:4:\"isv2\";s:1:\"0\";}i:5;a:13:{s:2:\"id\";s:2:\"14\";s:12:\"displayorder\";s:2:\"14\";s:8:\"identity\";s:7:\"postera\";s:4:\"name\";s:12:\"活动海报\";s:7:\"version\";s:3:\"1.0\";s:6:\"author\";s:6:\"官方\";s:6:\"status\";s:1:\"1\";s:8:\"category\";s:4:\"sale\";s:5:\"thumb\";s:47:\"../addons/yunphp_shop/static/images/postera.jpg\";s:4:\"desc\";s:0:\"\";s:5:\"iscom\";s:1:\"0\";s:10:\"deprecated\";s:1:\"0\";s:4:\"isv2\";s:1:\"0\";}i:6;a:13:{s:2:\"id\";s:2:\"16\";s:12:\"displayorder\";s:2:\"15\";s:8:\"identity\";s:7:\"diyform\";s:4:\"name\";s:12:\"自定表单\";s:7:\"version\";s:3:\"1.0\";s:6:\"author\";s:6:\"官方\";s:6:\"status\";s:1:\"1\";s:8:\"category\";s:4:\"help\";s:5:\"thumb\";s:47:\"../addons/yunphp_shop/static/images/diyform.jpg\";s:4:\"desc\";s:0:\"\";s:5:\"iscom\";s:1:\"0\";s:10:\"deprecated\";s:1:\"0\";s:4:\"isv2\";s:1:\"0\";}i:7;a:13:{s:2:\"id\";s:2:\"17\";s:12:\"displayorder\";s:2:\"16\";s:8:\"identity\";s:8:\"exhelper\";s:4:\"name\";s:12:\"快递助手\";s:7:\"version\";s:3:\"1.0\";s:6:\"author\";s:6:\"官方\";s:6:\"status\";s:1:\"1\";s:8:\"category\";s:4:\"help\";s:5:\"thumb\";s:48:\"../addons/yunphp_shop/static/images/exhelper.jpg\";s:4:\"desc\";s:0:\"\";s:5:\"iscom\";s:1:\"0\";s:10:\"deprecated\";s:1:\"0\";s:4:\"isv2\";s:1:\"0\";}i:8;a:13:{s:2:\"id\";s:2:\"18\";s:12:\"displayorder\";s:2:\"19\";s:8:\"identity\";s:6:\"groups\";s:4:\"name\";s:12:\"拼团系统\";s:7:\"version\";s:3:\"1.0\";s:6:\"author\";s:6:\"官方\";s:6:\"status\";s:1:\"1\";s:8:\"category\";s:3:\"biz\";s:5:\"thumb\";s:46:\"../addons/yunphp_shop/static/images/groups.jpg\";s:4:\"desc\";s:0:\"\";s:5:\"iscom\";s:1:\"0\";s:10:\"deprecated\";s:1:\"0\";s:4:\"isv2\";s:1:\"0\";}i:9;a:13:{s:2:\"id\";s:2:\"19\";s:12:\"displayorder\";s:2:\"20\";s:8:\"identity\";s:7:\"diypage\";s:4:\"name\";s:12:\"店铺装修\";s:7:\"version\";s:3:\"2.0\";s:6:\"author\";s:6:\"官方\";s:6:\"status\";s:1:\"1\";s:8:\"category\";s:4:\"help\";s:5:\"thumb\";s:48:\"../addons/yunphp_shop/static/images/designer.jpg\";s:4:\"desc\";s:0:\"\";s:5:\"iscom\";s:1:\"0\";s:10:\"deprecated\";s:1:\"0\";s:4:\"isv2\";s:1:\"0\";}i:10;a:13:{s:2:\"id\";s:2:\"20\";s:12:\"displayorder\";s:2:\"22\";s:8:\"identity\";s:8:\"globonus\";s:4:\"name\";s:12:\"全民股东\";s:7:\"version\";s:3:\"1.0\";s:6:\"author\";s:6:\"官方\";s:6:\"status\";s:1:\"1\";s:8:\"category\";s:3:\"biz\";s:5:\"thumb\";s:48:\"../addons/yunphp_shop/static/images/globonus.jpg\";s:4:\"desc\";s:0:\"\";s:5:\"iscom\";s:1:\"0\";s:10:\"deprecated\";s:1:\"0\";s:4:\"isv2\";s:1:\"0\";}i:11;a:13:{s:2:\"id\";s:2:\"21\";s:12:\"displayorder\";s:2:\"23\";s:8:\"identity\";s:5:\"merch\";s:4:\"name\";s:9:\"多商户\";s:7:\"version\";s:3:\"1.0\";s:6:\"author\";s:6:\"官方\";s:6:\"status\";s:1:\"1\";s:8:\"category\";s:3:\"biz\";s:5:\"thumb\";s:45:\"../addons/yunphp_shop/static/images/merch.jpg\";s:4:\"desc\";s:0:\"\";s:5:\"iscom\";s:1:\"0\";s:10:\"deprecated\";s:1:\"0\";s:4:\"isv2\";s:1:\"1\";}i:12;a:13:{s:2:\"id\";s:2:\"22\";s:12:\"displayorder\";s:2:\"26\";s:8:\"identity\";s:2:\"qa\";s:4:\"name\";s:12:\"帮助中心\";s:7:\"version\";s:3:\"1.0\";s:6:\"author\";s:6:\"官方\";s:6:\"status\";s:1:\"1\";s:8:\"category\";s:4:\"help\";s:5:\"thumb\";s:42:\"../addons/yunphp_shop/static/images/qa.jpg\";s:4:\"desc\";s:0:\"\";s:5:\"iscom\";s:1:\"0\";s:10:\"deprecated\";s:1:\"0\";s:4:\"isv2\";s:1:\"1\";}i:13;a:13:{s:2:\"id\";s:2:\"29\";s:12:\"displayorder\";s:2:\"26\";s:8:\"identity\";s:6:\"abonus\";s:4:\"name\";s:12:\"区域代理\";s:7:\"version\";s:3:\"1.0\";s:6:\"author\";s:6:\"官方\";s:6:\"status\";s:1:\"1\";s:8:\"category\";s:3:\"biz\";s:5:\"thumb\";s:46:\"../addons/yunphp_shop/static/images/abonus.jpg\";s:4:\"desc\";s:0:\"\";s:5:\"iscom\";s:1:\"0\";s:10:\"deprecated\";s:1:\"0\";s:4:\"isv2\";s:1:\"1\";}i:14;a:13:{s:2:\"id\";s:2:\"25\";s:12:\"displayorder\";s:2:\"29\";s:8:\"identity\";s:4:\"sign\";s:4:\"name\";s:12:\"积分签到\";s:7:\"version\";s:3:\"1.0\";s:6:\"author\";s:6:\"官方\";s:6:\"status\";s:1:\"1\";s:8:\"category\";s:4:\"tool\";s:5:\"thumb\";s:44:\"../addons/yunphp_shop/static/images/sign.jpg\";s:4:\"desc\";s:0:\"\";s:5:\"iscom\";s:1:\"0\";s:10:\"deprecated\";s:1:\"0\";s:4:\"isv2\";s:1:\"1\";}i:15;a:13:{s:2:\"id\";s:2:\"26\";s:12:\"displayorder\";s:2:\"30\";s:8:\"identity\";s:3:\"sns\";s:4:\"name\";s:9:\"SNS社区\";s:7:\"version\";s:3:\"1.0\";s:6:\"author\";s:6:\"官方\";s:6:\"status\";s:1:\"1\";s:8:\"category\";s:4:\"sale\";s:5:\"thumb\";s:43:\"../addons/yunphp_shop/static/images/sns.jpg\";s:4:\"desc\";s:0:\"\";s:5:\"iscom\";s:1:\"0\";s:10:\"deprecated\";s:1:\"0\";s:4:\"isv2\";s:1:\"1\";}i:16;a:13:{s:2:\"id\";s:2:\"31\";s:12:\"displayorder\";s:2:\"34\";s:8:\"identity\";s:7:\"bargain\";s:4:\"name\";s:12:\"砍价活动\";s:7:\"version\";s:3:\"1.0\";s:6:\"author\";s:6:\"官方\";s:6:\"status\";s:1:\"1\";s:8:\"category\";s:3:\"biz\";s:5:\"thumb\";s:47:\"../addons/yunphp_shop/static/images/bargain.jpg\";s:4:\"desc\";s:0:\"\";s:5:\"iscom\";s:1:\"0\";s:10:\"deprecated\";s:1:\"0\";s:4:\"isv2\";s:1:\"1\";}i:17;a:13:{s:2:\"id\";s:2:\"32\";s:12:\"displayorder\";s:2:\"35\";s:8:\"identity\";s:4:\"task\";s:4:\"name\";s:12:\"任务中心\";s:7:\"version\";s:3:\"1.0\";s:6:\"author\";s:6:\"官方\";s:6:\"status\";s:1:\"1\";s:8:\"category\";s:4:\"sale\";s:5:\"thumb\";s:44:\"../addons/yunphp_shop/static/images/task.jpg\";s:4:\"desc\";s:0:\"\";s:5:\"iscom\";s:1:\"0\";s:10:\"deprecated\";s:1:\"0\";s:4:\"isv2\";s:1:\"1\";}i:18;a:13:{s:2:\"id\";s:2:\"33\";s:12:\"displayorder\";s:2:\"36\";s:8:\"identity\";s:6:\"direct\";s:4:\"name\";s:12:\"直销系统\";s:7:\"version\";s:3:\"1.0\";s:6:\"author\";s:6:\"官方\";s:6:\"status\";s:1:\"0\";s:8:\"category\";s:3:\"biz\";s:5:\"thumb\";s:46:\"../addons/yunphp_shop/static/images/direct.jpg\";s:4:\"desc\";s:0:\"\";s:5:\"iscom\";s:1:\"0\";s:10:\"deprecated\";s:1:\"0\";s:4:\"isv2\";s:1:\"0\";}i:19;a:13:{s:2:\"id\";s:2:\"35\";s:12:\"displayorder\";s:2:\"36\";s:8:\"identity\";s:7:\"cashier\";s:4:\"name\";s:9:\"收银台\";s:7:\"version\";s:3:\"1.0\";s:6:\"author\";s:6:\"官方\";s:6:\"status\";s:1:\"1\";s:8:\"category\";s:3:\"biz\";s:5:\"thumb\";s:47:\"../addons/yunphp_shop/static/images/cashier.jpg\";s:4:\"desc\";s:0:\"\";s:5:\"iscom\";s:1:\"0\";s:10:\"deprecated\";s:1:\"0\";s:4:\"isv2\";s:1:\"1\";}i:20;a:13:{s:2:\"id\";s:2:\"34\";s:12:\"displayorder\";s:2:\"37\";s:8:\"identity\";s:5:\"tyiot\";s:4:\"name\";s:15:\"物联网系统\";s:7:\"version\";s:3:\"1.0\";s:6:\"author\";s:6:\"官方\";s:6:\"status\";s:1:\"1\";s:8:\"category\";s:3:\"biz\";s:5:\"thumb\";s:45:\"../addons/yunphp_shop/static/images/tyiot.jpg\";s:4:\"desc\";s:0:\"\";s:5:\"iscom\";s:1:\"0\";s:10:\"deprecated\";s:1:\"0\";s:4:\"isv2\";s:1:\"0\";}i:21;a:13:{s:2:\"id\";s:2:\"36\";s:12:\"displayorder\";s:2:\"37\";s:8:\"identity\";s:8:\"messages\";s:4:\"name\";s:12:\"消息群发\";s:7:\"version\";s:3:\"1.0\";s:6:\"author\";s:6:\"官方\";s:6:\"status\";s:1:\"1\";s:8:\"category\";s:4:\"tool\";s:5:\"thumb\";s:48:\"../addons/yunphp_shop/static/images/messages.jpg\";s:4:\"desc\";s:0:\"\";s:5:\"iscom\";s:1:\"0\";s:10:\"deprecated\";s:1:\"0\";s:4:\"isv2\";s:1:\"1\";}i:22;a:13:{s:2:\"id\";s:2:\"39\";s:12:\"displayorder\";s:2:\"37\";s:8:\"identity\";s:9:\"assistant\";s:4:\"name\";s:12:\"微商助手\";s:7:\"version\";s:3:\"1.0\";s:6:\"author\";s:6:\"官方\";s:6:\"status\";s:1:\"1\";s:8:\"category\";s:4:\"tool\";s:5:\"thumb\";s:49:\"../addons/yunphp_shop/static/images/assistant.jpg\";s:4:\"desc\";s:0:\"\";s:5:\"iscom\";s:1:\"0\";s:10:\"deprecated\";s:1:\"0\";s:4:\"isv2\";s:1:\"1\";}i:23;a:13:{s:2:\"id\";s:2:\"37\";s:12:\"displayorder\";s:2:\"38\";s:8:\"identity\";s:7:\"seckill\";s:4:\"name\";s:12:\"整点秒杀\";s:7:\"version\";s:3:\"1.0\";s:6:\"author\";s:6:\"官方\";s:6:\"status\";s:1:\"1\";s:8:\"category\";s:4:\"sale\";s:5:\"thumb\";s:47:\"../addons/yunphp_shop/static/images/seckill.jpg\";s:4:\"desc\";s:0:\"\";s:5:\"iscom\";s:1:\"0\";s:10:\"deprecated\";s:1:\"0\";s:4:\"isv2\";s:1:\"1\";}i:24;a:13:{s:2:\"id\";s:2:\"38\";s:12:\"displayorder\";s:2:\"38\";s:8:\"identity\";s:8:\"exchange\";s:4:\"name\";s:12:\"兑换中心\";s:7:\"version\";s:3:\"1.0\";s:6:\"author\";s:6:\"官方\";s:6:\"status\";s:1:\"1\";s:8:\"category\";s:3:\"biz\";s:5:\"thumb\";s:48:\"../addons/yunphp_shop/static/images/exchange.jpg\";s:4:\"desc\";s:0:\"\";s:5:\"iscom\";s:1:\"0\";s:10:\"deprecated\";s:1:\"0\";s:4:\"isv2\";s:1:\"0\";}i:25;a:13:{s:2:\"id\";s:2:\"42\";s:12:\"displayorder\";s:2:\"38\";s:8:\"identity\";s:5:\"quick\";s:4:\"name\";s:12:\"快速购买\";s:7:\"version\";s:3:\"1.0\";s:6:\"author\";s:6:\"官方\";s:6:\"status\";s:1:\"1\";s:8:\"category\";s:3:\"biz\";s:5:\"thumb\";s:0:\"\";s:4:\"desc\";s:1:\"0\";s:5:\"iscom\";s:1:\"0\";s:10:\"deprecated\";s:1:\"0\";s:4:\"isv2\";s:1:\"0\";}i:26;a:13:{s:2:\"id\";s:2:\"40\";s:12:\"displayorder\";s:2:\"40\";s:8:\"identity\";s:7:\"lottery\";s:4:\"name\";s:12:\"游戏营销\";s:7:\"version\";s:3:\"1.0\";s:6:\"author\";s:6:\"官方\";s:6:\"status\";s:1:\"1\";s:8:\"category\";s:3:\"biz\";s:5:\"thumb\";s:47:\"../addons/yunphp_shop/static/images/lottery.jpg\";s:4:\"desc\";s:0:\"\";s:5:\"iscom\";s:1:\"0\";s:10:\"deprecated\";s:1:\"0\";s:4:\"isv2\";s:1:\"1\";}i:27;a:13:{s:2:\"id\";s:2:\"45\";s:12:\"displayorder\";s:2:\"45\";s:8:\"identity\";s:5:\"clubs\";s:4:\"name\";s:9:\"俱乐部\";s:7:\"version\";s:3:\"1.0\";s:6:\"author\";s:6:\"官方\";s:6:\"status\";s:1:\"1\";s:8:\"category\";s:3:\"biz\";s:5:\"thumb\";s:0:\"\";s:4:\"desc\";s:1:\"0\";s:5:\"iscom\";s:1:\"0\";s:10:\"deprecated\";s:1:\"0\";s:4:\"isv2\";s:1:\"0\";}i:28;a:13:{s:2:\"id\";s:2:\"46\";s:12:\"displayorder\";s:2:\"45\";s:8:\"identity\";s:8:\"business\";s:4:\"name\";s:12:\"企业服务\";s:7:\"version\";s:3:\"1.0\";s:6:\"author\";s:6:\"官方\";s:6:\"status\";s:1:\"1\";s:8:\"category\";s:3:\"biz\";s:5:\"thumb\";s:0:\"\";s:4:\"desc\";s:1:\"0\";s:5:\"iscom\";s:1:\"0\";s:10:\"deprecated\";s:1:\"0\";s:4:\"isv2\";s:1:\"0\";}}');
INSERT INTO `ims_core_cache` VALUES ('we7:module_setting:mon_jgg:8', 'a:1:{s:6:\"module\";s:7:\"mon_jgg\";}');
INSERT INTO `ims_core_cache` VALUES ('we7:unimodules:8:', 'a:18:{s:5:\"basic\";a:1:{s:4:\"name\";s:5:\"basic\";}s:4:\"news\";a:1:{s:4:\"name\";s:4:\"news\";}s:5:\"music\";a:1:{s:4:\"name\";s:5:\"music\";}s:7:\"userapi\";a:1:{s:4:\"name\";s:7:\"userapi\";}s:8:\"recharge\";a:1:{s:4:\"name\";s:8:\"recharge\";}s:6:\"custom\";a:1:{s:4:\"name\";s:6:\"custom\";}s:6:\"images\";a:1:{s:4:\"name\";s:6:\"images\";}s:5:\"video\";a:1:{s:4:\"name\";s:5:\"video\";}s:5:\"voice\";a:1:{s:4:\"name\";s:5:\"voice\";}s:5:\"chats\";a:1:{s:4:\"name\";s:5:\"chats\";}s:6:\"wxcard\";a:1:{s:4:\"name\";s:6:\"wxcard\";}s:5:\"store\";a:1:{s:4:\"name\";s:5:\"store\";}s:9:\"deam_food\";a:1:{s:4:\"name\";s:9:\"deam_food\";}s:8:\"demo_app\";a:1:{s:4:\"name\";s:8:\"demo_app\";}s:11:\"yunphp_shop\";a:1:{s:4:\"name\";s:11:\"yunphp_shop\";}s:5:\"jizan\";a:1:{s:4:\"name\";s:5:\"jizan\";}s:7:\"mon_jgg\";a:1:{s:4:\"name\";s:7:\"mon_jgg\";}s:13:\"ants_jizanbao\";a:1:{s:4:\"name\";s:13:\"ants_jizanbao\";}}');
INSERT INTO `ims_core_cache` VALUES ('we7:module_info:ants_jizanbao', 'a:32:{s:3:\"mid\";s:2:\"20\";s:4:\"name\";s:13:\"ants_jizanbao\";s:4:\"type\";s:8:\"services\";s:5:\"title\";s:9:\"集赞宝\";s:7:\"version\";s:5:\"1.0.0\";s:7:\"ability\";s:9:\"集赞宝\";s:11:\"description\";s:9:\"集赞宝\";s:6:\"author\";s:12:\"蚁族创想\";s:3:\"url\";s:22:\"https://www.snants.com\";s:8:\"settings\";s:1:\"1\";s:10:\"subscribes\";a:0:{}s:7:\"handles\";a:1:{i:0;s:4:\"text\";}s:12:\"isrulefields\";s:1:\"0\";s:8:\"issystem\";s:1:\"0\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:2:\"N;\";s:13:\"title_initial\";s:1:\"J\";s:13:\"wxapp_support\";s:1:\"1\";s:15:\"welcome_support\";s:1:\"1\";s:10:\"oauth_type\";s:1:\"1\";s:14:\"webapp_support\";s:1:\"1\";s:16:\"phoneapp_support\";s:1:\"1\";s:15:\"account_support\";s:1:\"2\";s:13:\"xzapp_support\";s:1:\"1\";s:11:\"app_support\";s:1:\"0\";s:14:\"aliapp_support\";s:1:\"1\";s:9:\"isdisplay\";i:1;s:4:\"logo\";s:59:\"http://mywe7.com/addons/ants_jizanbao/icon.jpg?v=1560228098\";s:7:\"preview\";s:49:\"http://mywe7.com/addons/ants_jizanbao/preview.jpg\";s:11:\"main_module\";b:0;s:11:\"plugin_list\";a:0:{}}');
INSERT INTO `ims_core_cache` VALUES ('we7:unimodules:8:1', 'a:18:{s:5:\"basic\";a:1:{s:4:\"name\";s:5:\"basic\";}s:4:\"news\";a:1:{s:4:\"name\";s:4:\"news\";}s:5:\"music\";a:1:{s:4:\"name\";s:5:\"music\";}s:7:\"userapi\";a:1:{s:4:\"name\";s:7:\"userapi\";}s:8:\"recharge\";a:1:{s:4:\"name\";s:8:\"recharge\";}s:6:\"custom\";a:1:{s:4:\"name\";s:6:\"custom\";}s:6:\"images\";a:1:{s:4:\"name\";s:6:\"images\";}s:5:\"video\";a:1:{s:4:\"name\";s:5:\"video\";}s:5:\"voice\";a:1:{s:4:\"name\";s:5:\"voice\";}s:5:\"chats\";a:1:{s:4:\"name\";s:5:\"chats\";}s:6:\"wxcard\";a:1:{s:4:\"name\";s:6:\"wxcard\";}s:5:\"store\";a:1:{s:4:\"name\";s:5:\"store\";}s:9:\"deam_food\";a:1:{s:4:\"name\";s:9:\"deam_food\";}s:8:\"demo_app\";a:1:{s:4:\"name\";s:8:\"demo_app\";}s:11:\"yunphp_shop\";a:1:{s:4:\"name\";s:11:\"yunphp_shop\";}s:5:\"jizan\";a:1:{s:4:\"name\";s:5:\"jizan\";}s:7:\"mon_jgg\";a:1:{s:4:\"name\";s:7:\"mon_jgg\";}s:13:\"ants_jizanbao\";a:1:{s:4:\"name\";s:13:\"ants_jizanbao\";}}');
INSERT INTO `ims_core_cache` VALUES ('we7:system_frame:1', 'a:12:{s:8:\"platform\";a:7:{s:5:\"title\";s:6:\"平台\";s:4:\"icon\";s:14:\"wi wi-platform\";s:3:\"url\";s:44:\"./index.php?c=account&a=display&do=platform&\";s:7:\"section\";a:0:{}s:9:\"is_system\";b:1;s:10:\"is_display\";b:1;s:12:\"displayorder\";i:2;}s:7:\"account\";a:7:{s:5:\"title\";s:9:\"公众号\";s:4:\"icon\";s:18:\"wi wi-white-collar\";s:3:\"url\";s:41:\"./index.php?c=home&a=welcome&do=platform&\";s:7:\"section\";a:5:{s:13:\"platform_plus\";a:3:{s:5:\"title\";s:12:\"增强功能\";s:4:\"menu\";a:5:{s:14:\"platform_reply\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:0;s:5:\"title\";s:12:\"自动回复\";s:3:\"url\";s:31:\"./index.php?c=platform&a=reply&\";s:15:\"permission_name\";s:14:\"platform_reply\";s:4:\"icon\";s:11:\"wi wi-reply\";s:12:\"displayorder\";i:5;s:2:\"id\";N;s:14:\"sub_permission\";a:0:{}}s:13:\"platform_menu\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:0;s:5:\"title\";s:15:\"自定义菜单\";s:3:\"url\";s:38:\"./index.php?c=platform&a=menu&do=post&\";s:15:\"permission_name\";s:13:\"platform_menu\";s:4:\"icon\";s:16:\"wi wi-custommenu\";s:12:\"displayorder\";i:4;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:11:\"platform_qr\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:0;s:5:\"title\";s:22:\"二维码/转化链接\";s:3:\"url\";s:28:\"./index.php?c=platform&a=qr&\";s:15:\"permission_name\";s:11:\"platform_qr\";s:4:\"icon\";s:12:\"wi wi-qrcode\";s:12:\"displayorder\";i:3;s:2:\"id\";N;s:14:\"sub_permission\";a:0:{}}s:17:\"platform_material\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:0;s:5:\"title\";s:16:\"素材/编辑器\";s:3:\"url\";s:34:\"./index.php?c=platform&a=material&\";s:15:\"permission_name\";s:17:\"platform_material\";s:4:\"icon\";s:12:\"wi wi-redact\";s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";a:2:{i:0;a:3:{s:5:\"title\";s:13:\"添加/编辑\";s:3:\"url\";s:39:\"./index.php?c=platform&a=material-post&\";s:15:\"permission_name\";s:13:\"material_post\";}i:1;a:2:{s:5:\"title\";s:6:\"删除\";s:15:\"permission_name\";s:24:\"platform_material_delete\";}}}s:13:\"platform_site\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:0;s:5:\"title\";s:16:\"微官网-文章\";s:3:\"url\";s:38:\"./index.php?c=site&a=multi&do=display&\";s:15:\"permission_name\";s:13:\"platform_site\";s:4:\"icon\";s:10:\"wi wi-home\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";a:0:{}}}s:10:\"is_display\";i:0;}s:15:\"platform_module\";a:3:{s:5:\"title\";s:12:\"应用模块\";s:4:\"menu\";a:0:{}s:10:\"is_display\";b:1;}s:2:\"mc\";a:3:{s:5:\"title\";s:6:\"粉丝\";s:4:\"menu\";a:2:{s:7:\"mc_fans\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:0;s:5:\"title\";s:12:\"粉丝管理\";s:3:\"url\";s:24:\"./index.php?c=mc&a=fans&\";s:15:\"permission_name\";s:7:\"mc_fans\";s:4:\"icon\";s:16:\"wi wi-fansmanage\";s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:9:\"mc_member\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:0;s:5:\"title\";s:12:\"会员管理\";s:3:\"url\";s:26:\"./index.php?c=mc&a=member&\";s:15:\"permission_name\";s:9:\"mc_member\";s:4:\"icon\";s:10:\"wi wi-fans\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}s:10:\"is_display\";i:0;}s:7:\"profile\";a:3:{s:5:\"title\";s:6:\"配置\";s:4:\"menu\";a:4:{s:7:\"profile\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:0;s:5:\"title\";s:12:\"参数配置\";s:3:\"url\";s:31:\"./index.php?c=profile&a=remote&\";s:15:\"permission_name\";s:15:\"profile_setting\";s:4:\"icon\";s:23:\"wi wi-parameter-setting\";s:12:\"displayorder\";i:4;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:7:\"payment\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:0;s:5:\"title\";s:12:\"支付参数\";s:3:\"url\";s:32:\"./index.php?c=profile&a=payment&\";s:15:\"permission_name\";s:19:\"profile_pay_setting\";s:4:\"icon\";s:17:\"wi wi-pay-setting\";s:12:\"displayorder\";i:3;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:15:\"app_module_link\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:0;s:5:\"title\";s:12:\"数据同步\";s:3:\"url\";s:44:\"./index.php?c=profile&a=module-link-uniacid&\";s:15:\"permission_name\";s:31:\"profile_app_module_link_uniacid\";s:4:\"icon\";s:18:\"wi wi-data-synchro\";s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:11:\"bind_domain\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:0;s:5:\"title\";s:12:\"域名绑定\";s:3:\"url\";s:36:\"./index.php?c=profile&a=bind-domain&\";s:15:\"permission_name\";s:19:\"profile_bind_domain\";s:4:\"icon\";s:17:\"wi wi-bind-domain\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}s:10:\"is_display\";i:0;}s:10:\"statistics\";a:3:{s:5:\"title\";s:6:\"统计\";s:4:\"menu\";a:2:{s:14:\"statistics_app\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:0;s:5:\"title\";s:12:\"访问统计\";s:3:\"url\";s:31:\"./index.php?c=statistics&a=app&\";s:15:\"permission_name\";s:14:\"statistics_app\";s:4:\"icon\";s:17:\"wi wi-statistical\";s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:15:\"statistics_fans\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:0;s:5:\"title\";s:12:\"用户统计\";s:3:\"url\";s:32:\"./index.php?c=statistics&a=fans&\";s:15:\"permission_name\";s:15:\"statistics_fans\";s:4:\"icon\";s:17:\"wi wi-statistical\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}s:10:\"is_display\";i:0;}}s:9:\"is_system\";b:1;s:10:\"is_display\";b:1;s:12:\"displayorder\";i:3;}s:5:\"wxapp\";a:7:{s:5:\"title\";s:15:\"微信小程序\";s:4:\"icon\";s:19:\"wi wi-small-routine\";s:3:\"url\";s:38:\"./index.php?c=wxapp&a=display&do=home&\";s:7:\"section\";a:5:{s:14:\"wxapp_entrance\";a:3:{s:5:\"title\";s:15:\"小程序入口\";s:4:\"menu\";a:1:{s:20:\"module_entrance_link\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:0;s:5:\"title\";s:12:\"入口页面\";s:3:\"url\";s:36:\"./index.php?c=wxapp&a=entrance-link&\";s:15:\"permission_name\";s:19:\"wxapp_entrance_link\";s:4:\"icon\";s:18:\"wi wi-data-synchro\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}s:10:\"is_display\";i:0;}s:15:\"platform_module\";a:3:{s:5:\"title\";s:6:\"应用\";s:4:\"menu\";a:0:{}s:10:\"is_display\";b:1;}s:2:\"mc\";a:3:{s:5:\"title\";s:6:\"粉丝\";s:4:\"menu\";a:1:{s:12:\"wxapp_member\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:0;s:5:\"title\";s:6:\"会员\";s:3:\"url\";s:26:\"./index.php?c=mc&a=member&\";s:15:\"permission_name\";s:12:\"wxapp_member\";s:4:\"icon\";s:10:\"wi wi-fans\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}s:10:\"is_display\";i:0;}s:13:\"wxapp_profile\";a:2:{s:5:\"title\";s:6:\"配置\";s:4:\"menu\";a:5:{s:17:\"wxapp_module_link\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:0;s:5:\"title\";s:12:\"数据同步\";s:3:\"url\";s:42:\"./index.php?c=wxapp&a=module-link-uniacid&\";s:15:\"permission_name\";s:25:\"wxapp_module_link_uniacid\";s:4:\"icon\";s:18:\"wi wi-data-synchro\";s:12:\"displayorder\";i:5;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:13:\"wxapp_payment\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:0;s:5:\"title\";s:12:\"支付参数\";s:3:\"url\";s:30:\"./index.php?c=wxapp&a=payment&\";s:15:\"permission_name\";s:13:\"wxapp_payment\";s:4:\"icon\";s:16:\"wi wi-appsetting\";s:12:\"displayorder\";i:4;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:14:\"front_download\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:18:\"上传微信审核\";s:3:\"url\";s:37:\"./index.php?c=wxapp&a=front-download&\";s:15:\"permission_name\";s:20:\"wxapp_front_download\";s:4:\"icon\";s:13:\"wi wi-examine\";s:12:\"displayorder\";i:3;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:17:\"parameter_setting\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:0;s:5:\"title\";s:12:\"参数配置\";s:3:\"url\";s:31:\"./index.php?c=profile&a=remote&\";s:15:\"permission_name\";s:13:\"wxapp_setting\";s:4:\"icon\";s:23:\"wi wi-parameter-setting\";s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:23:\"wxapp_platform_material\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:0;s:5:\"title\";s:12:\"素材管理\";s:3:\"url\";N;s:15:\"permission_name\";s:23:\"wxapp_platform_material\";s:4:\"icon\";N;s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";a:1:{i:0;a:2:{s:5:\"title\";s:6:\"删除\";s:15:\"permission_name\";s:30:\"wxapp_platform_material_delete\";}}}}}s:10:\"statistics\";a:3:{s:5:\"title\";s:6:\"统计\";s:4:\"menu\";a:1:{s:15:\"statistics_fans\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:0;s:5:\"title\";s:12:\"访问统计\";s:3:\"url\";s:33:\"./index.php?c=wxapp&a=statistics&\";s:15:\"permission_name\";s:15:\"statistics_fans\";s:4:\"icon\";s:17:\"wi wi-statistical\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}s:10:\"is_display\";i:0;}}s:9:\"is_system\";b:1;s:10:\"is_display\";b:1;s:12:\"displayorder\";i:4;}s:6:\"webapp\";a:7:{s:5:\"title\";s:2:\"PC\";s:4:\"icon\";s:8:\"wi wi-pc\";s:3:\"url\";s:39:\"./index.php?c=webapp&a=home&do=display&\";s:7:\"section\";a:4:{s:15:\"platform_module\";a:3:{s:5:\"title\";s:12:\"应用模块\";s:4:\"menu\";a:0:{}s:10:\"is_display\";b:1;}s:2:\"mc\";a:2:{s:5:\"title\";s:6:\"粉丝\";s:4:\"menu\";a:1:{s:9:\"mc_member\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"会员管理\";s:3:\"url\";s:26:\"./index.php?c=mc&a=member&\";s:15:\"permission_name\";s:9:\"mc_member\";s:4:\"icon\";s:10:\"wi wi-fans\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}}s:6:\"webapp\";a:2:{s:5:\"title\";s:6:\"配置\";s:4:\"menu\";a:3:{s:18:\"webapp_module_link\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"数据同步\";s:3:\"url\";s:43:\"./index.php?c=webapp&a=module-link-uniacid&\";s:15:\"permission_name\";s:26:\"webapp_module_link_uniacid\";s:4:\"icon\";s:18:\"wi wi-data-synchro\";s:12:\"displayorder\";i:3;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:14:\"webapp_rewrite\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:9:\"伪静态\";s:3:\"url\";s:31:\"./index.php?c=webapp&a=rewrite&\";s:15:\"permission_name\";s:14:\"webapp_rewrite\";s:4:\"icon\";s:13:\"wi wi-rewrite\";s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:18:\"webapp_bind_domain\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:18:\"域名访问设置\";s:3:\"url\";s:35:\"./index.php?c=webapp&a=bind-domain&\";s:15:\"permission_name\";s:18:\"webapp_bind_domain\";s:4:\"icon\";s:17:\"wi wi-bind-domain\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}}s:10:\"statistics\";a:3:{s:5:\"title\";s:6:\"统计\";s:4:\"menu\";a:1:{s:14:\"statistics_app\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:0;s:5:\"title\";s:12:\"访问统计\";s:3:\"url\";s:31:\"./index.php?c=statistics&a=app&\";s:15:\"permission_name\";s:14:\"statistics_app\";s:4:\"icon\";s:17:\"wi wi-statistical\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}s:10:\"is_display\";i:0;}}s:9:\"is_system\";b:1;s:10:\"is_display\";b:1;s:12:\"displayorder\";i:5;}s:8:\"phoneapp\";a:7:{s:5:\"title\";s:3:\"APP\";s:4:\"icon\";s:18:\"wi wi-white-collar\";s:3:\"url\";s:41:\"./index.php?c=phoneapp&a=display&do=home&\";s:7:\"section\";a:2:{s:15:\"platform_module\";a:3:{s:5:\"title\";s:6:\"应用\";s:4:\"menu\";a:0:{}s:10:\"is_display\";b:1;}s:16:\"phoneapp_profile\";a:2:{s:5:\"title\";s:6:\"配置\";s:4:\"menu\";a:1:{s:14:\"front_download\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:9:\"下载APP\";s:3:\"url\";s:40:\"./index.php?c=phoneapp&a=front-download&\";s:15:\"permission_name\";s:23:\"phoneapp_front_download\";s:4:\"icon\";s:13:\"wi wi-examine\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}}}s:9:\"is_system\";b:1;s:10:\"is_display\";b:1;s:12:\"displayorder\";i:6;}s:5:\"xzapp\";a:7:{s:5:\"title\";s:9:\"熊掌号\";s:4:\"icon\";s:18:\"wi wi-white-collar\";s:3:\"url\";s:38:\"./index.php?c=xzapp&a=home&do=display&\";s:7:\"section\";a:1:{s:15:\"platform_module\";a:3:{s:5:\"title\";s:12:\"应用模块\";s:4:\"menu\";a:0:{}s:10:\"is_display\";b:1;}}s:9:\"is_system\";b:1;s:10:\"is_display\";b:1;s:12:\"displayorder\";i:7;}s:6:\"aliapp\";a:7:{s:5:\"title\";s:18:\"支付宝小程序\";s:4:\"icon\";s:18:\"wi wi-white-collar\";s:3:\"url\";s:40:\"./index.php?c=miniapp&a=display&do=home&\";s:7:\"section\";a:1:{s:15:\"platform_module\";a:3:{s:5:\"title\";s:6:\"应用\";s:4:\"menu\";a:0:{}s:10:\"is_display\";b:1;}}s:9:\"is_system\";b:1;s:10:\"is_display\";b:1;s:12:\"displayorder\";i:8;}s:6:\"module\";a:7:{s:5:\"title\";s:6:\"应用\";s:4:\"icon\";s:11:\"wi wi-apply\";s:3:\"url\";s:31:\"./index.php?c=module&a=display&\";s:7:\"section\";a:0:{}s:9:\"is_system\";b:1;s:10:\"is_display\";b:1;s:12:\"displayorder\";i:9;}s:6:\"system\";a:7:{s:5:\"title\";s:6:\"系统\";s:4:\"icon\";s:13:\"wi wi-setting\";s:3:\"url\";s:39:\"./index.php?c=home&a=welcome&do=system&\";s:7:\"section\";a:13:{s:10:\"wxplatform\";a:2:{s:5:\"title\";s:9:\"公众号\";s:4:\"menu\";a:4:{s:14:\"system_account\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:16:\" 微信公众号\";s:3:\"url\";s:45:\"./index.php?c=account&a=manage&account_type=1\";s:15:\"permission_name\";s:14:\"system_account\";s:4:\"icon\";s:12:\"wi wi-wechat\";s:12:\"displayorder\";i:4;s:2:\"id\";N;s:14:\"sub_permission\";a:6:{i:0;a:2:{s:5:\"title\";s:21:\"公众号管理设置\";s:15:\"permission_name\";s:21:\"system_account_manage\";}i:1;a:2:{s:5:\"title\";s:15:\"添加公众号\";s:15:\"permission_name\";s:19:\"system_account_post\";}i:2;a:2:{s:5:\"title\";s:15:\"公众号停用\";s:15:\"permission_name\";s:19:\"system_account_stop\";}i:3;a:2:{s:5:\"title\";s:18:\"公众号回收站\";s:15:\"permission_name\";s:22:\"system_account_recycle\";}i:4;a:2:{s:5:\"title\";s:15:\"公众号删除\";s:15:\"permission_name\";s:21:\"system_account_delete\";}i:5;a:2:{s:5:\"title\";s:15:\"公众号恢复\";s:15:\"permission_name\";s:22:\"system_account_recover\";}}}s:13:\"system_module\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:15:\"公众号应用\";s:3:\"url\";s:60:\"./index.php?c=module&a=manage-system&support=account_support\";s:15:\"permission_name\";s:13:\"system_module\";s:4:\"icon\";s:14:\"wi wi-wx-apply\";s:12:\"displayorder\";i:3;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:15:\"system_template\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:15:\"微官网模板\";s:3:\"url\";s:32:\"./index.php?c=system&a=template&\";s:15:\"permission_name\";s:15:\"system_template\";s:4:\"icon\";s:17:\"wi wi-wx-template\";s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:15:\"system_platform\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:19:\" 微信开放平台\";s:3:\"url\";s:32:\"./index.php?c=system&a=platform&\";s:15:\"permission_name\";s:15:\"system_platform\";s:4:\"icon\";s:20:\"wi wi-exploitsetting\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}}s:6:\"module\";a:2:{s:5:\"title\";s:9:\"小程序\";s:4:\"menu\";a:2:{s:12:\"system_wxapp\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:15:\"微信小程序\";s:3:\"url\";s:45:\"./index.php?c=account&a=manage&account_type=4\";s:15:\"permission_name\";s:12:\"system_wxapp\";s:4:\"icon\";s:11:\"wi wi-wxapp\";s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";a:6:{i:0;a:2:{s:5:\"title\";s:21:\"小程序管理设置\";s:15:\"permission_name\";s:19:\"system_wxapp_manage\";}i:1;a:2:{s:5:\"title\";s:15:\"添加小程序\";s:15:\"permission_name\";s:17:\"system_wxapp_post\";}i:2;a:2:{s:5:\"title\";s:15:\"小程序停用\";s:15:\"permission_name\";s:17:\"system_wxapp_stop\";}i:3;a:2:{s:5:\"title\";s:18:\"小程序回收站\";s:15:\"permission_name\";s:20:\"system_wxapp_recycle\";}i:4;a:2:{s:5:\"title\";s:15:\"小程序删除\";s:15:\"permission_name\";s:19:\"system_wxapp_delete\";}i:5;a:2:{s:5:\"title\";s:15:\"小程序恢复\";s:15:\"permission_name\";s:20:\"system_wxapp_recover\";}}}s:19:\"system_module_wxapp\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:15:\"小程序应用\";s:3:\"url\";s:58:\"./index.php?c=module&a=manage-system&support=wxapp_support\";s:15:\"permission_name\";s:19:\"system_module_wxapp\";s:4:\"icon\";s:17:\"wi wi-wxapp-apply\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}}s:7:\"welcome\";a:3:{s:5:\"title\";s:12:\"系统首页\";s:4:\"menu\";a:1:{s:14:\"system_welcome\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:18:\"系统首页应用\";s:3:\"url\";s:60:\"./index.php?c=module&a=manage-system&support=welcome_support\";s:15:\"permission_name\";s:14:\"system_welcome\";s:4:\"icon\";s:11:\"wi wi-wxapp\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}s:7:\"founder\";b:1;}s:6:\"webapp\";a:2:{s:5:\"title\";s:2:\"PC\";s:4:\"menu\";a:2:{s:13:\"system_webapp\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:2:\"PC\";s:3:\"url\";s:45:\"./index.php?c=account&a=manage&account_type=5\";s:15:\"permission_name\";s:13:\"system_webapp\";s:4:\"icon\";s:8:\"wi wi-pc\";s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";a:0:{}}s:20:\"system_module_webapp\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:8:\"PC应用\";s:3:\"url\";s:59:\"./index.php?c=module&a=manage-system&support=webapp_support\";s:15:\"permission_name\";s:20:\"system_module_webapp\";s:4:\"icon\";s:14:\"wi wi-pc-apply\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}}s:8:\"phoneapp\";a:2:{s:5:\"title\";s:3:\"APP\";s:4:\"menu\";a:2:{s:15:\"system_phoneapp\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:3:\"APP\";s:3:\"url\";s:45:\"./index.php?c=account&a=manage&account_type=6\";s:15:\"permission_name\";s:15:\"system_phoneapp\";s:4:\"icon\";s:9:\"wi wi-app\";s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";a:0:{}}s:22:\"system_module_phoneapp\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:9:\"APP应用\";s:3:\"url\";s:61:\"./index.php?c=module&a=manage-system&support=phoneapp_support\";s:15:\"permission_name\";s:22:\"system_module_phoneapp\";s:4:\"icon\";s:15:\"wi wi-app-apply\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}}s:5:\"xzapp\";a:2:{s:5:\"title\";s:9:\"熊掌号\";s:4:\"menu\";a:2:{s:12:\"system_xzapp\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:9:\"熊掌号\";s:3:\"url\";s:45:\"./index.php?c=account&a=manage&account_type=9\";s:15:\"permission_name\";s:12:\"system_xzapp\";s:4:\"icon\";s:11:\"wi wi-xzapp\";s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";a:0:{}}s:19:\"system_module_xzapp\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:15:\"熊掌号应用\";s:3:\"url\";s:58:\"./index.php?c=module&a=manage-system&support=xzapp_support\";s:15:\"permission_name\";s:19:\"system_module_xzapp\";s:4:\"icon\";s:17:\"wi wi-xzapp-apply\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}}s:6:\"aliapp\";a:2:{s:5:\"title\";s:18:\"支付宝小程序\";s:4:\"menu\";a:2:{s:13:\"system_aliapp\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:18:\"支付宝小程序\";s:3:\"url\";s:46:\"./index.php?c=account&a=manage&account_type=11\";s:15:\"permission_name\";s:13:\"system_aliapp\";s:4:\"icon\";s:12:\"wi wi-aliapp\";s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";a:0:{}}s:20:\"system_module_aliapp\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:24:\"支付宝小程序应用\";s:3:\"url\";s:59:\"./index.php?c=module&a=manage-system&support=aliapp_support\";s:15:\"permission_name\";s:20:\"system_module_aliapp\";s:4:\"icon\";s:18:\"wi wi-aliapp-apply\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}}s:4:\"user\";a:2:{s:5:\"title\";s:13:\"帐户/用户\";s:4:\"menu\";a:3:{s:9:\"system_my\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"我的帐户\";s:3:\"url\";s:29:\"./index.php?c=user&a=profile&\";s:15:\"permission_name\";s:9:\"system_my\";s:4:\"icon\";s:10:\"wi wi-user\";s:12:\"displayorder\";i:3;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:11:\"system_user\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"用户管理\";s:3:\"url\";s:29:\"./index.php?c=user&a=display&\";s:15:\"permission_name\";s:11:\"system_user\";s:4:\"icon\";s:16:\"wi wi-user-group\";s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";a:7:{i:0;a:2:{s:5:\"title\";s:12:\"编辑用户\";s:15:\"permission_name\";s:16:\"system_user_post\";}i:1;a:2:{s:5:\"title\";s:12:\"审核用户\";s:15:\"permission_name\";s:17:\"system_user_check\";}i:2;a:2:{s:5:\"title\";s:12:\"店员管理\";s:15:\"permission_name\";s:17:\"system_user_clerk\";}i:3;a:2:{s:5:\"title\";s:15:\"用户回收站\";s:15:\"permission_name\";s:19:\"system_user_recycle\";}i:4;a:2:{s:5:\"title\";s:18:\"用户属性设置\";s:15:\"permission_name\";s:18:\"system_user_fields\";}i:5;a:2:{s:5:\"title\";s:31:\"用户属性设置-编辑字段\";s:15:\"permission_name\";s:23:\"system_user_fields_post\";}i:6;a:2:{s:5:\"title\";s:18:\"用户注册设置\";s:15:\"permission_name\";s:23:\"system_user_registerset\";}}}s:25:\"system_user_founder_group\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:15:\"副创始人组\";s:3:\"url\";s:32:\"./index.php?c=founder&a=display&\";s:15:\"permission_name\";s:21:\"system_founder_manage\";s:4:\"icon\";s:16:\"wi wi-co-founder\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";a:6:{i:0;a:2:{s:5:\"title\";s:18:\"添加创始人组\";s:15:\"permission_name\";s:24:\"system_founder_group_add\";}i:1;a:2:{s:5:\"title\";s:18:\"编辑创始人组\";s:15:\"permission_name\";s:25:\"system_founder_group_post\";}i:2;a:2:{s:5:\"title\";s:18:\"删除创始人组\";s:15:\"permission_name\";s:24:\"system_founder_group_del\";}i:3;a:2:{s:5:\"title\";s:15:\"添加创始人\";s:15:\"permission_name\";s:23:\"system_founder_user_add\";}i:4;a:2:{s:5:\"title\";s:15:\"编辑创始人\";s:15:\"permission_name\";s:24:\"system_founder_user_post\";}i:5;a:2:{s:5:\"title\";s:15:\"删除创始人\";s:15:\"permission_name\";s:23:\"system_founder_user_del\";}}}}}s:10:\"permission\";a:2:{s:5:\"title\";s:12:\"权限管理\";s:4:\"menu\";a:2:{s:19:\"system_module_group\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:15:\"应用权限组\";s:3:\"url\";s:29:\"./index.php?c=module&a=group&\";s:15:\"permission_name\";s:19:\"system_module_group\";s:4:\"icon\";s:21:\"wi wi-appjurisdiction\";s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";a:3:{i:0;a:2:{s:5:\"title\";s:21:\"添加应用权限组\";s:15:\"permission_name\";s:23:\"system_module_group_add\";}i:1;a:2:{s:5:\"title\";s:21:\"编辑应用权限组\";s:15:\"permission_name\";s:24:\"system_module_group_post\";}i:2;a:2:{s:5:\"title\";s:21:\"删除应用权限组\";s:15:\"permission_name\";s:23:\"system_module_group_del\";}}}s:17:\"system_user_group\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:15:\"用户权限组\";s:3:\"url\";s:27:\"./index.php?c=user&a=group&\";s:15:\"permission_name\";s:17:\"system_user_group\";s:4:\"icon\";s:22:\"wi wi-userjurisdiction\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";a:3:{i:0;a:2:{s:5:\"title\";s:15:\"添加用户组\";s:15:\"permission_name\";s:21:\"system_user_group_add\";}i:1;a:2:{s:5:\"title\";s:15:\"编辑用户组\";s:15:\"permission_name\";s:22:\"system_user_group_post\";}i:2;a:2:{s:5:\"title\";s:15:\"删除用户组\";s:15:\"permission_name\";s:21:\"system_user_group_del\";}}}}}s:7:\"article\";a:2:{s:5:\"title\";s:13:\"文章/公告\";s:4:\"menu\";a:2:{s:14:\"system_article\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"文章管理\";s:3:\"url\";s:29:\"./index.php?c=article&a=news&\";s:15:\"permission_name\";s:19:\"system_article_news\";s:4:\"icon\";s:13:\"wi wi-article\";s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:21:\"system_article_notice\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"公告管理\";s:3:\"url\";s:31:\"./index.php?c=article&a=notice&\";s:15:\"permission_name\";s:21:\"system_article_notice\";s:4:\"icon\";s:12:\"wi wi-notice\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}}s:7:\"message\";a:2:{s:5:\"title\";s:12:\"消息提醒\";s:4:\"menu\";a:1:{s:21:\"system_message_notice\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"消息提醒\";s:3:\"url\";s:31:\"./index.php?c=message&a=notice&\";s:15:\"permission_name\";s:21:\"system_message_notice\";s:4:\"icon\";s:10:\"wi wi-bell\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}}s:17:\"system_statistics\";a:2:{s:5:\"title\";s:6:\"统计\";s:4:\"menu\";a:1:{s:23:\"system_account_analysis\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"访问统计\";s:3:\"url\";s:35:\"./index.php?c=statistics&a=account&\";s:15:\"permission_name\";s:23:\"system_account_analysis\";s:4:\"icon\";s:17:\"wi wi-statistical\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}}s:5:\"cache\";a:2:{s:5:\"title\";s:6:\"缓存\";s:4:\"menu\";a:1:{s:26:\"system_setting_updatecache\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"更新缓存\";s:3:\"url\";s:35:\"./index.php?c=system&a=updatecache&\";s:15:\"permission_name\";s:26:\"system_setting_updatecache\";s:4:\"icon\";s:12:\"wi wi-update\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}}}s:9:\"is_system\";b:1;s:10:\"is_display\";b:1;s:12:\"displayorder\";i:10;}s:4:\"site\";a:8:{s:5:\"title\";s:6:\"站点\";s:4:\"icon\";s:17:\"wi wi-system-site\";s:3:\"url\";s:28:\"./index.php?c=system&a=site&\";s:7:\"section\";a:3:{s:7:\"setting\";a:2:{s:5:\"title\";s:6:\"设置\";s:4:\"menu\";a:9:{s:19:\"system_setting_site\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"站点设置\";s:3:\"url\";s:28:\"./index.php?c=system&a=site&\";s:15:\"permission_name\";s:19:\"system_setting_site\";s:4:\"icon\";s:18:\"wi wi-site-setting\";s:12:\"displayorder\";i:9;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:19:\"system_setting_menu\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"菜单设置\";s:3:\"url\";s:28:\"./index.php?c=system&a=menu&\";s:15:\"permission_name\";s:19:\"system_setting_menu\";s:4:\"icon\";s:18:\"wi wi-menu-setting\";s:12:\"displayorder\";i:8;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:25:\"system_setting_attachment\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"附件设置\";s:3:\"url\";s:34:\"./index.php?c=system&a=attachment&\";s:15:\"permission_name\";s:25:\"system_setting_attachment\";s:4:\"icon\";s:16:\"wi wi-attachment\";s:12:\"displayorder\";i:7;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:25:\"system_setting_systeminfo\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"系统信息\";s:3:\"url\";s:34:\"./index.php?c=system&a=systeminfo&\";s:15:\"permission_name\";s:25:\"system_setting_systeminfo\";s:4:\"icon\";s:17:\"wi wi-system-info\";s:12:\"displayorder\";i:6;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:19:\"system_setting_logs\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"查看日志\";s:3:\"url\";s:28:\"./index.php?c=system&a=logs&\";s:15:\"permission_name\";s:19:\"system_setting_logs\";s:4:\"icon\";s:9:\"wi wi-log\";s:12:\"displayorder\";i:5;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:26:\"system_setting_ipwhitelist\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:11:\"IP白名单\";s:3:\"url\";s:35:\"./index.php?c=system&a=ipwhitelist&\";s:15:\"permission_name\";s:26:\"system_setting_ipwhitelist\";s:4:\"icon\";s:8:\"wi wi-ip\";s:12:\"displayorder\";i:4;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:28:\"system_setting_sensitiveword\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:15:\"过滤敏感词\";s:3:\"url\";s:37:\"./index.php?c=system&a=sensitiveword&\";s:15:\"permission_name\";s:28:\"system_setting_sensitiveword\";s:4:\"icon\";s:15:\"wi wi-sensitive\";s:12:\"displayorder\";i:3;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:25:\"system_setting_thirdlogin\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:25:\"用户登录/注册设置\";s:3:\"url\";s:33:\"./index.php?c=user&a=registerset&\";s:15:\"permission_name\";s:25:\"system_setting_thirdlogin\";s:4:\"icon\";s:10:\"wi wi-user\";s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:20:\"system_setting_oauth\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:17:\"oauth全局设置\";s:3:\"url\";s:29:\"./index.php?c=system&a=oauth&\";s:15:\"permission_name\";s:20:\"system_setting_oauth\";s:4:\"icon\";s:11:\"wi wi-oauth\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}}s:7:\"utility\";a:2:{s:5:\"title\";s:12:\"常用工具\";s:4:\"menu\";a:5:{s:24:\"system_utility_filecheck\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:18:\"系统文件校验\";s:3:\"url\";s:33:\"./index.php?c=system&a=filecheck&\";s:15:\"permission_name\";s:24:\"system_utility_filecheck\";s:4:\"icon\";s:10:\"wi wi-file\";s:12:\"displayorder\";i:5;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:23:\"system_utility_optimize\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"性能优化\";s:3:\"url\";s:32:\"./index.php?c=system&a=optimize&\";s:15:\"permission_name\";s:23:\"system_utility_optimize\";s:4:\"icon\";s:14:\"wi wi-optimize\";s:12:\"displayorder\";i:4;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:23:\"system_utility_database\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:9:\"数据库\";s:3:\"url\";s:32:\"./index.php?c=system&a=database&\";s:15:\"permission_name\";s:23:\"system_utility_database\";s:4:\"icon\";s:9:\"wi wi-sql\";s:12:\"displayorder\";i:3;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:19:\"system_utility_scan\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"木马查杀\";s:3:\"url\";s:28:\"./index.php?c=system&a=scan&\";s:15:\"permission_name\";s:19:\"system_utility_scan\";s:4:\"icon\";s:12:\"wi wi-safety\";s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:18:\"system_utility_bom\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:15:\"检测文件BOM\";s:3:\"url\";s:27:\"./index.php?c=system&a=bom&\";s:15:\"permission_name\";s:18:\"system_utility_bom\";s:4:\"icon\";s:9:\"wi wi-bom\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}}s:7:\"backjob\";a:2:{s:5:\"title\";s:12:\"后台任务\";s:4:\"menu\";a:1:{s:10:\"system_job\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"后台任务\";s:3:\"url\";s:38:\"./index.php?c=system&a=job&do=display&\";s:15:\"permission_name\";s:10:\"system_job\";s:4:\"icon\";s:9:\"wi wi-job\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}}}s:7:\"founder\";b:1;s:9:\"is_system\";b:1;s:10:\"is_display\";b:1;s:12:\"displayorder\";i:11;}s:4:\"help\";a:8:{s:5:\"title\";s:12:\"系统帮助\";s:4:\"icon\";s:12:\"wi wi-market\";s:3:\"url\";s:29:\"./index.php?c=help&a=display&\";s:7:\"section\";a:0:{}s:5:\"blank\";b:0;s:9:\"is_system\";b:1;s:10:\"is_display\";b:1;s:12:\"displayorder\";i:12;}s:5:\"store\";a:7:{s:5:\"title\";s:6:\"商城\";s:4:\"icon\";s:11:\"wi wi-store\";s:3:\"url\";s:43:\"./index.php?c=home&a=welcome&do=ext&m=store\";s:7:\"section\";a:0:{}s:9:\"is_system\";b:1;s:10:\"is_display\";b:1;s:12:\"displayorder\";i:13;}}');
INSERT INTO `ims_core_cache` VALUES ('we7:system_frame:', 'a:12:{s:8:\"platform\";a:7:{s:5:\"title\";s:6:\"平台\";s:4:\"icon\";s:14:\"wi wi-platform\";s:3:\"url\";s:44:\"./index.php?c=account&a=display&do=platform&\";s:7:\"section\";a:0:{}s:9:\"is_system\";b:1;s:10:\"is_display\";b:1;s:12:\"displayorder\";i:2;}s:7:\"account\";a:7:{s:5:\"title\";s:9:\"公众号\";s:4:\"icon\";s:18:\"wi wi-white-collar\";s:3:\"url\";s:41:\"./index.php?c=home&a=welcome&do=platform&\";s:7:\"section\";a:5:{s:13:\"platform_plus\";a:3:{s:5:\"title\";s:12:\"增强功能\";s:4:\"menu\";a:5:{s:14:\"platform_reply\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:0;s:5:\"title\";s:12:\"自动回复\";s:3:\"url\";s:31:\"./index.php?c=platform&a=reply&\";s:15:\"permission_name\";s:14:\"platform_reply\";s:4:\"icon\";s:11:\"wi wi-reply\";s:12:\"displayorder\";i:5;s:2:\"id\";N;s:14:\"sub_permission\";a:0:{}}s:13:\"platform_menu\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:0;s:5:\"title\";s:15:\"自定义菜单\";s:3:\"url\";s:38:\"./index.php?c=platform&a=menu&do=post&\";s:15:\"permission_name\";s:13:\"platform_menu\";s:4:\"icon\";s:16:\"wi wi-custommenu\";s:12:\"displayorder\";i:4;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:11:\"platform_qr\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:0;s:5:\"title\";s:22:\"二维码/转化链接\";s:3:\"url\";s:28:\"./index.php?c=platform&a=qr&\";s:15:\"permission_name\";s:11:\"platform_qr\";s:4:\"icon\";s:12:\"wi wi-qrcode\";s:12:\"displayorder\";i:3;s:2:\"id\";N;s:14:\"sub_permission\";a:0:{}}s:17:\"platform_material\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:0;s:5:\"title\";s:16:\"素材/编辑器\";s:3:\"url\";s:34:\"./index.php?c=platform&a=material&\";s:15:\"permission_name\";s:17:\"platform_material\";s:4:\"icon\";s:12:\"wi wi-redact\";s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";a:2:{i:0;a:3:{s:5:\"title\";s:13:\"添加/编辑\";s:3:\"url\";s:39:\"./index.php?c=platform&a=material-post&\";s:15:\"permission_name\";s:13:\"material_post\";}i:1;a:2:{s:5:\"title\";s:6:\"删除\";s:15:\"permission_name\";s:24:\"platform_material_delete\";}}}s:13:\"platform_site\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:0;s:5:\"title\";s:16:\"微官网-文章\";s:3:\"url\";s:38:\"./index.php?c=site&a=multi&do=display&\";s:15:\"permission_name\";s:13:\"platform_site\";s:4:\"icon\";s:10:\"wi wi-home\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";a:0:{}}}s:10:\"is_display\";i:0;}s:15:\"platform_module\";a:3:{s:5:\"title\";s:12:\"应用模块\";s:4:\"menu\";a:0:{}s:10:\"is_display\";b:1;}s:2:\"mc\";a:3:{s:5:\"title\";s:6:\"粉丝\";s:4:\"menu\";a:2:{s:7:\"mc_fans\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:0;s:5:\"title\";s:12:\"粉丝管理\";s:3:\"url\";s:24:\"./index.php?c=mc&a=fans&\";s:15:\"permission_name\";s:7:\"mc_fans\";s:4:\"icon\";s:16:\"wi wi-fansmanage\";s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:9:\"mc_member\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:0;s:5:\"title\";s:12:\"会员管理\";s:3:\"url\";s:26:\"./index.php?c=mc&a=member&\";s:15:\"permission_name\";s:9:\"mc_member\";s:4:\"icon\";s:10:\"wi wi-fans\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}s:10:\"is_display\";i:0;}s:7:\"profile\";a:3:{s:5:\"title\";s:6:\"配置\";s:4:\"menu\";a:4:{s:7:\"profile\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:0;s:5:\"title\";s:12:\"参数配置\";s:3:\"url\";s:31:\"./index.php?c=profile&a=remote&\";s:15:\"permission_name\";s:15:\"profile_setting\";s:4:\"icon\";s:23:\"wi wi-parameter-setting\";s:12:\"displayorder\";i:4;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:7:\"payment\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:0;s:5:\"title\";s:12:\"支付参数\";s:3:\"url\";s:32:\"./index.php?c=profile&a=payment&\";s:15:\"permission_name\";s:19:\"profile_pay_setting\";s:4:\"icon\";s:17:\"wi wi-pay-setting\";s:12:\"displayorder\";i:3;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:15:\"app_module_link\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:0;s:5:\"title\";s:12:\"数据同步\";s:3:\"url\";s:44:\"./index.php?c=profile&a=module-link-uniacid&\";s:15:\"permission_name\";s:31:\"profile_app_module_link_uniacid\";s:4:\"icon\";s:18:\"wi wi-data-synchro\";s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:11:\"bind_domain\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:0;s:5:\"title\";s:12:\"域名绑定\";s:3:\"url\";s:36:\"./index.php?c=profile&a=bind-domain&\";s:15:\"permission_name\";s:19:\"profile_bind_domain\";s:4:\"icon\";s:17:\"wi wi-bind-domain\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}s:10:\"is_display\";i:0;}s:10:\"statistics\";a:3:{s:5:\"title\";s:6:\"统计\";s:4:\"menu\";a:2:{s:14:\"statistics_app\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:0;s:5:\"title\";s:12:\"访问统计\";s:3:\"url\";s:31:\"./index.php?c=statistics&a=app&\";s:15:\"permission_name\";s:14:\"statistics_app\";s:4:\"icon\";s:17:\"wi wi-statistical\";s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:15:\"statistics_fans\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:0;s:5:\"title\";s:12:\"用户统计\";s:3:\"url\";s:32:\"./index.php?c=statistics&a=fans&\";s:15:\"permission_name\";s:15:\"statistics_fans\";s:4:\"icon\";s:17:\"wi wi-statistical\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}s:10:\"is_display\";i:0;}}s:9:\"is_system\";b:1;s:10:\"is_display\";b:1;s:12:\"displayorder\";i:3;}s:5:\"wxapp\";a:7:{s:5:\"title\";s:15:\"微信小程序\";s:4:\"icon\";s:19:\"wi wi-small-routine\";s:3:\"url\";s:38:\"./index.php?c=wxapp&a=display&do=home&\";s:7:\"section\";a:5:{s:14:\"wxapp_entrance\";a:3:{s:5:\"title\";s:15:\"小程序入口\";s:4:\"menu\";a:1:{s:20:\"module_entrance_link\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:0;s:5:\"title\";s:12:\"入口页面\";s:3:\"url\";s:36:\"./index.php?c=wxapp&a=entrance-link&\";s:15:\"permission_name\";s:19:\"wxapp_entrance_link\";s:4:\"icon\";s:18:\"wi wi-data-synchro\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}s:10:\"is_display\";i:0;}s:15:\"platform_module\";a:3:{s:5:\"title\";s:6:\"应用\";s:4:\"menu\";a:0:{}s:10:\"is_display\";b:1;}s:2:\"mc\";a:3:{s:5:\"title\";s:6:\"粉丝\";s:4:\"menu\";a:1:{s:12:\"wxapp_member\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:0;s:5:\"title\";s:6:\"会员\";s:3:\"url\";s:26:\"./index.php?c=mc&a=member&\";s:15:\"permission_name\";s:12:\"wxapp_member\";s:4:\"icon\";s:10:\"wi wi-fans\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}s:10:\"is_display\";i:0;}s:13:\"wxapp_profile\";a:2:{s:5:\"title\";s:6:\"配置\";s:4:\"menu\";a:5:{s:17:\"wxapp_module_link\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:0;s:5:\"title\";s:12:\"数据同步\";s:3:\"url\";s:42:\"./index.php?c=wxapp&a=module-link-uniacid&\";s:15:\"permission_name\";s:25:\"wxapp_module_link_uniacid\";s:4:\"icon\";s:18:\"wi wi-data-synchro\";s:12:\"displayorder\";i:5;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:13:\"wxapp_payment\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:0;s:5:\"title\";s:12:\"支付参数\";s:3:\"url\";s:30:\"./index.php?c=wxapp&a=payment&\";s:15:\"permission_name\";s:13:\"wxapp_payment\";s:4:\"icon\";s:16:\"wi wi-appsetting\";s:12:\"displayorder\";i:4;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:14:\"front_download\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:18:\"上传微信审核\";s:3:\"url\";s:37:\"./index.php?c=wxapp&a=front-download&\";s:15:\"permission_name\";s:20:\"wxapp_front_download\";s:4:\"icon\";s:13:\"wi wi-examine\";s:12:\"displayorder\";i:3;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:17:\"parameter_setting\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:0;s:5:\"title\";s:12:\"参数配置\";s:3:\"url\";s:31:\"./index.php?c=profile&a=remote&\";s:15:\"permission_name\";s:13:\"wxapp_setting\";s:4:\"icon\";s:23:\"wi wi-parameter-setting\";s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:23:\"wxapp_platform_material\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:0;s:5:\"title\";s:12:\"素材管理\";s:3:\"url\";N;s:15:\"permission_name\";s:23:\"wxapp_platform_material\";s:4:\"icon\";N;s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";a:1:{i:0;a:2:{s:5:\"title\";s:6:\"删除\";s:15:\"permission_name\";s:30:\"wxapp_platform_material_delete\";}}}}}s:10:\"statistics\";a:3:{s:5:\"title\";s:6:\"统计\";s:4:\"menu\";a:1:{s:15:\"statistics_fans\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:0;s:5:\"title\";s:12:\"访问统计\";s:3:\"url\";s:33:\"./index.php?c=wxapp&a=statistics&\";s:15:\"permission_name\";s:15:\"statistics_fans\";s:4:\"icon\";s:17:\"wi wi-statistical\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}s:10:\"is_display\";i:0;}}s:9:\"is_system\";b:1;s:10:\"is_display\";b:1;s:12:\"displayorder\";i:4;}s:6:\"webapp\";a:7:{s:5:\"title\";s:2:\"PC\";s:4:\"icon\";s:8:\"wi wi-pc\";s:3:\"url\";s:39:\"./index.php?c=webapp&a=home&do=display&\";s:7:\"section\";a:4:{s:15:\"platform_module\";a:3:{s:5:\"title\";s:12:\"应用模块\";s:4:\"menu\";a:0:{}s:10:\"is_display\";b:1;}s:2:\"mc\";a:2:{s:5:\"title\";s:6:\"粉丝\";s:4:\"menu\";a:1:{s:9:\"mc_member\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"会员管理\";s:3:\"url\";s:26:\"./index.php?c=mc&a=member&\";s:15:\"permission_name\";s:9:\"mc_member\";s:4:\"icon\";s:10:\"wi wi-fans\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}}s:6:\"webapp\";a:2:{s:5:\"title\";s:6:\"配置\";s:4:\"menu\";a:3:{s:18:\"webapp_module_link\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"数据同步\";s:3:\"url\";s:43:\"./index.php?c=webapp&a=module-link-uniacid&\";s:15:\"permission_name\";s:26:\"webapp_module_link_uniacid\";s:4:\"icon\";s:18:\"wi wi-data-synchro\";s:12:\"displayorder\";i:3;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:14:\"webapp_rewrite\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:9:\"伪静态\";s:3:\"url\";s:31:\"./index.php?c=webapp&a=rewrite&\";s:15:\"permission_name\";s:14:\"webapp_rewrite\";s:4:\"icon\";s:13:\"wi wi-rewrite\";s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:18:\"webapp_bind_domain\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:18:\"域名访问设置\";s:3:\"url\";s:35:\"./index.php?c=webapp&a=bind-domain&\";s:15:\"permission_name\";s:18:\"webapp_bind_domain\";s:4:\"icon\";s:17:\"wi wi-bind-domain\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}}s:10:\"statistics\";a:3:{s:5:\"title\";s:6:\"统计\";s:4:\"menu\";a:1:{s:14:\"statistics_app\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:0;s:5:\"title\";s:12:\"访问统计\";s:3:\"url\";s:31:\"./index.php?c=statistics&a=app&\";s:15:\"permission_name\";s:14:\"statistics_app\";s:4:\"icon\";s:17:\"wi wi-statistical\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}s:10:\"is_display\";i:0;}}s:9:\"is_system\";b:1;s:10:\"is_display\";b:1;s:12:\"displayorder\";i:5;}s:8:\"phoneapp\";a:7:{s:5:\"title\";s:3:\"APP\";s:4:\"icon\";s:18:\"wi wi-white-collar\";s:3:\"url\";s:41:\"./index.php?c=phoneapp&a=display&do=home&\";s:7:\"section\";a:2:{s:15:\"platform_module\";a:3:{s:5:\"title\";s:6:\"应用\";s:4:\"menu\";a:0:{}s:10:\"is_display\";b:1;}s:16:\"phoneapp_profile\";a:2:{s:5:\"title\";s:6:\"配置\";s:4:\"menu\";a:1:{s:14:\"front_download\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:9:\"下载APP\";s:3:\"url\";s:40:\"./index.php?c=phoneapp&a=front-download&\";s:15:\"permission_name\";s:23:\"phoneapp_front_download\";s:4:\"icon\";s:13:\"wi wi-examine\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}}}s:9:\"is_system\";b:1;s:10:\"is_display\";b:1;s:12:\"displayorder\";i:6;}s:5:\"xzapp\";a:7:{s:5:\"title\";s:9:\"熊掌号\";s:4:\"icon\";s:18:\"wi wi-white-collar\";s:3:\"url\";s:38:\"./index.php?c=xzapp&a=home&do=display&\";s:7:\"section\";a:1:{s:15:\"platform_module\";a:3:{s:5:\"title\";s:12:\"应用模块\";s:4:\"menu\";a:0:{}s:10:\"is_display\";b:1;}}s:9:\"is_system\";b:1;s:10:\"is_display\";b:1;s:12:\"displayorder\";i:7;}s:6:\"aliapp\";a:7:{s:5:\"title\";s:18:\"支付宝小程序\";s:4:\"icon\";s:18:\"wi wi-white-collar\";s:3:\"url\";s:40:\"./index.php?c=miniapp&a=display&do=home&\";s:7:\"section\";a:1:{s:15:\"platform_module\";a:3:{s:5:\"title\";s:6:\"应用\";s:4:\"menu\";a:0:{}s:10:\"is_display\";b:1;}}s:9:\"is_system\";b:1;s:10:\"is_display\";b:1;s:12:\"displayorder\";i:8;}s:6:\"module\";a:7:{s:5:\"title\";s:6:\"应用\";s:4:\"icon\";s:11:\"wi wi-apply\";s:3:\"url\";s:31:\"./index.php?c=module&a=display&\";s:7:\"section\";a:0:{}s:9:\"is_system\";b:1;s:10:\"is_display\";b:1;s:12:\"displayorder\";i:9;}s:6:\"system\";a:7:{s:5:\"title\";s:6:\"系统\";s:4:\"icon\";s:13:\"wi wi-setting\";s:3:\"url\";s:39:\"./index.php?c=home&a=welcome&do=system&\";s:7:\"section\";a:13:{s:10:\"wxplatform\";a:2:{s:5:\"title\";s:9:\"公众号\";s:4:\"menu\";a:4:{s:14:\"system_account\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:16:\" 微信公众号\";s:3:\"url\";s:45:\"./index.php?c=account&a=manage&account_type=1\";s:15:\"permission_name\";s:14:\"system_account\";s:4:\"icon\";s:12:\"wi wi-wechat\";s:12:\"displayorder\";i:4;s:2:\"id\";N;s:14:\"sub_permission\";a:6:{i:0;a:2:{s:5:\"title\";s:21:\"公众号管理设置\";s:15:\"permission_name\";s:21:\"system_account_manage\";}i:1;a:2:{s:5:\"title\";s:15:\"添加公众号\";s:15:\"permission_name\";s:19:\"system_account_post\";}i:2;a:2:{s:5:\"title\";s:15:\"公众号停用\";s:15:\"permission_name\";s:19:\"system_account_stop\";}i:3;a:2:{s:5:\"title\";s:18:\"公众号回收站\";s:15:\"permission_name\";s:22:\"system_account_recycle\";}i:4;a:2:{s:5:\"title\";s:15:\"公众号删除\";s:15:\"permission_name\";s:21:\"system_account_delete\";}i:5;a:2:{s:5:\"title\";s:15:\"公众号恢复\";s:15:\"permission_name\";s:22:\"system_account_recover\";}}}s:13:\"system_module\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:15:\"公众号应用\";s:3:\"url\";s:60:\"./index.php?c=module&a=manage-system&support=account_support\";s:15:\"permission_name\";s:13:\"system_module\";s:4:\"icon\";s:14:\"wi wi-wx-apply\";s:12:\"displayorder\";i:3;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:15:\"system_template\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:15:\"微官网模板\";s:3:\"url\";s:32:\"./index.php?c=system&a=template&\";s:15:\"permission_name\";s:15:\"system_template\";s:4:\"icon\";s:17:\"wi wi-wx-template\";s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:15:\"system_platform\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:19:\" 微信开放平台\";s:3:\"url\";s:32:\"./index.php?c=system&a=platform&\";s:15:\"permission_name\";s:15:\"system_platform\";s:4:\"icon\";s:20:\"wi wi-exploitsetting\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}}s:6:\"module\";a:2:{s:5:\"title\";s:9:\"小程序\";s:4:\"menu\";a:2:{s:12:\"system_wxapp\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:15:\"微信小程序\";s:3:\"url\";s:45:\"./index.php?c=account&a=manage&account_type=4\";s:15:\"permission_name\";s:12:\"system_wxapp\";s:4:\"icon\";s:11:\"wi wi-wxapp\";s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";a:6:{i:0;a:2:{s:5:\"title\";s:21:\"小程序管理设置\";s:15:\"permission_name\";s:19:\"system_wxapp_manage\";}i:1;a:2:{s:5:\"title\";s:15:\"添加小程序\";s:15:\"permission_name\";s:17:\"system_wxapp_post\";}i:2;a:2:{s:5:\"title\";s:15:\"小程序停用\";s:15:\"permission_name\";s:17:\"system_wxapp_stop\";}i:3;a:2:{s:5:\"title\";s:18:\"小程序回收站\";s:15:\"permission_name\";s:20:\"system_wxapp_recycle\";}i:4;a:2:{s:5:\"title\";s:15:\"小程序删除\";s:15:\"permission_name\";s:19:\"system_wxapp_delete\";}i:5;a:2:{s:5:\"title\";s:15:\"小程序恢复\";s:15:\"permission_name\";s:20:\"system_wxapp_recover\";}}}s:19:\"system_module_wxapp\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:15:\"小程序应用\";s:3:\"url\";s:58:\"./index.php?c=module&a=manage-system&support=wxapp_support\";s:15:\"permission_name\";s:19:\"system_module_wxapp\";s:4:\"icon\";s:17:\"wi wi-wxapp-apply\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}}s:7:\"welcome\";a:3:{s:5:\"title\";s:12:\"系统首页\";s:4:\"menu\";a:1:{s:14:\"system_welcome\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:18:\"系统首页应用\";s:3:\"url\";s:60:\"./index.php?c=module&a=manage-system&support=welcome_support\";s:15:\"permission_name\";s:14:\"system_welcome\";s:4:\"icon\";s:11:\"wi wi-wxapp\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}s:7:\"founder\";b:1;}s:6:\"webapp\";a:2:{s:5:\"title\";s:2:\"PC\";s:4:\"menu\";a:2:{s:13:\"system_webapp\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:2:\"PC\";s:3:\"url\";s:45:\"./index.php?c=account&a=manage&account_type=5\";s:15:\"permission_name\";s:13:\"system_webapp\";s:4:\"icon\";s:8:\"wi wi-pc\";s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";a:0:{}}s:20:\"system_module_webapp\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:8:\"PC应用\";s:3:\"url\";s:59:\"./index.php?c=module&a=manage-system&support=webapp_support\";s:15:\"permission_name\";s:20:\"system_module_webapp\";s:4:\"icon\";s:14:\"wi wi-pc-apply\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}}s:8:\"phoneapp\";a:2:{s:5:\"title\";s:3:\"APP\";s:4:\"menu\";a:2:{s:15:\"system_phoneapp\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:3:\"APP\";s:3:\"url\";s:45:\"./index.php?c=account&a=manage&account_type=6\";s:15:\"permission_name\";s:15:\"system_phoneapp\";s:4:\"icon\";s:9:\"wi wi-app\";s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";a:0:{}}s:22:\"system_module_phoneapp\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:9:\"APP应用\";s:3:\"url\";s:61:\"./index.php?c=module&a=manage-system&support=phoneapp_support\";s:15:\"permission_name\";s:22:\"system_module_phoneapp\";s:4:\"icon\";s:15:\"wi wi-app-apply\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}}s:5:\"xzapp\";a:2:{s:5:\"title\";s:9:\"熊掌号\";s:4:\"menu\";a:2:{s:12:\"system_xzapp\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:9:\"熊掌号\";s:3:\"url\";s:45:\"./index.php?c=account&a=manage&account_type=9\";s:15:\"permission_name\";s:12:\"system_xzapp\";s:4:\"icon\";s:11:\"wi wi-xzapp\";s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";a:0:{}}s:19:\"system_module_xzapp\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:15:\"熊掌号应用\";s:3:\"url\";s:58:\"./index.php?c=module&a=manage-system&support=xzapp_support\";s:15:\"permission_name\";s:19:\"system_module_xzapp\";s:4:\"icon\";s:17:\"wi wi-xzapp-apply\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}}s:6:\"aliapp\";a:2:{s:5:\"title\";s:18:\"支付宝小程序\";s:4:\"menu\";a:2:{s:13:\"system_aliapp\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:18:\"支付宝小程序\";s:3:\"url\";s:46:\"./index.php?c=account&a=manage&account_type=11\";s:15:\"permission_name\";s:13:\"system_aliapp\";s:4:\"icon\";s:12:\"wi wi-aliapp\";s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";a:0:{}}s:20:\"system_module_aliapp\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:24:\"支付宝小程序应用\";s:3:\"url\";s:59:\"./index.php?c=module&a=manage-system&support=aliapp_support\";s:15:\"permission_name\";s:20:\"system_module_aliapp\";s:4:\"icon\";s:18:\"wi wi-aliapp-apply\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}}s:4:\"user\";a:2:{s:5:\"title\";s:13:\"帐户/用户\";s:4:\"menu\";a:3:{s:9:\"system_my\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"我的帐户\";s:3:\"url\";s:29:\"./index.php?c=user&a=profile&\";s:15:\"permission_name\";s:9:\"system_my\";s:4:\"icon\";s:10:\"wi wi-user\";s:12:\"displayorder\";i:3;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:11:\"system_user\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"用户管理\";s:3:\"url\";s:29:\"./index.php?c=user&a=display&\";s:15:\"permission_name\";s:11:\"system_user\";s:4:\"icon\";s:16:\"wi wi-user-group\";s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";a:7:{i:0;a:2:{s:5:\"title\";s:12:\"编辑用户\";s:15:\"permission_name\";s:16:\"system_user_post\";}i:1;a:2:{s:5:\"title\";s:12:\"审核用户\";s:15:\"permission_name\";s:17:\"system_user_check\";}i:2;a:2:{s:5:\"title\";s:12:\"店员管理\";s:15:\"permission_name\";s:17:\"system_user_clerk\";}i:3;a:2:{s:5:\"title\";s:15:\"用户回收站\";s:15:\"permission_name\";s:19:\"system_user_recycle\";}i:4;a:2:{s:5:\"title\";s:18:\"用户属性设置\";s:15:\"permission_name\";s:18:\"system_user_fields\";}i:5;a:2:{s:5:\"title\";s:31:\"用户属性设置-编辑字段\";s:15:\"permission_name\";s:23:\"system_user_fields_post\";}i:6;a:2:{s:5:\"title\";s:18:\"用户注册设置\";s:15:\"permission_name\";s:23:\"system_user_registerset\";}}}s:25:\"system_user_founder_group\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:15:\"副创始人组\";s:3:\"url\";s:32:\"./index.php?c=founder&a=display&\";s:15:\"permission_name\";s:21:\"system_founder_manage\";s:4:\"icon\";s:16:\"wi wi-co-founder\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";a:6:{i:0;a:2:{s:5:\"title\";s:18:\"添加创始人组\";s:15:\"permission_name\";s:24:\"system_founder_group_add\";}i:1;a:2:{s:5:\"title\";s:18:\"编辑创始人组\";s:15:\"permission_name\";s:25:\"system_founder_group_post\";}i:2;a:2:{s:5:\"title\";s:18:\"删除创始人组\";s:15:\"permission_name\";s:24:\"system_founder_group_del\";}i:3;a:2:{s:5:\"title\";s:15:\"添加创始人\";s:15:\"permission_name\";s:23:\"system_founder_user_add\";}i:4;a:2:{s:5:\"title\";s:15:\"编辑创始人\";s:15:\"permission_name\";s:24:\"system_founder_user_post\";}i:5;a:2:{s:5:\"title\";s:15:\"删除创始人\";s:15:\"permission_name\";s:23:\"system_founder_user_del\";}}}}}s:10:\"permission\";a:2:{s:5:\"title\";s:12:\"权限管理\";s:4:\"menu\";a:2:{s:19:\"system_module_group\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:15:\"应用权限组\";s:3:\"url\";s:29:\"./index.php?c=module&a=group&\";s:15:\"permission_name\";s:19:\"system_module_group\";s:4:\"icon\";s:21:\"wi wi-appjurisdiction\";s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";a:3:{i:0;a:2:{s:5:\"title\";s:21:\"添加应用权限组\";s:15:\"permission_name\";s:23:\"system_module_group_add\";}i:1;a:2:{s:5:\"title\";s:21:\"编辑应用权限组\";s:15:\"permission_name\";s:24:\"system_module_group_post\";}i:2;a:2:{s:5:\"title\";s:21:\"删除应用权限组\";s:15:\"permission_name\";s:23:\"system_module_group_del\";}}}s:17:\"system_user_group\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:15:\"用户权限组\";s:3:\"url\";s:27:\"./index.php?c=user&a=group&\";s:15:\"permission_name\";s:17:\"system_user_group\";s:4:\"icon\";s:22:\"wi wi-userjurisdiction\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";a:3:{i:0;a:2:{s:5:\"title\";s:15:\"添加用户组\";s:15:\"permission_name\";s:21:\"system_user_group_add\";}i:1;a:2:{s:5:\"title\";s:15:\"编辑用户组\";s:15:\"permission_name\";s:22:\"system_user_group_post\";}i:2;a:2:{s:5:\"title\";s:15:\"删除用户组\";s:15:\"permission_name\";s:21:\"system_user_group_del\";}}}}}s:7:\"article\";a:2:{s:5:\"title\";s:13:\"文章/公告\";s:4:\"menu\";a:2:{s:14:\"system_article\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"文章管理\";s:3:\"url\";s:29:\"./index.php?c=article&a=news&\";s:15:\"permission_name\";s:19:\"system_article_news\";s:4:\"icon\";s:13:\"wi wi-article\";s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:21:\"system_article_notice\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"公告管理\";s:3:\"url\";s:31:\"./index.php?c=article&a=notice&\";s:15:\"permission_name\";s:21:\"system_article_notice\";s:4:\"icon\";s:12:\"wi wi-notice\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}}s:7:\"message\";a:2:{s:5:\"title\";s:12:\"消息提醒\";s:4:\"menu\";a:1:{s:21:\"system_message_notice\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"消息提醒\";s:3:\"url\";s:31:\"./index.php?c=message&a=notice&\";s:15:\"permission_name\";s:21:\"system_message_notice\";s:4:\"icon\";s:10:\"wi wi-bell\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}}s:17:\"system_statistics\";a:2:{s:5:\"title\";s:6:\"统计\";s:4:\"menu\";a:1:{s:23:\"system_account_analysis\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"访问统计\";s:3:\"url\";s:35:\"./index.php?c=statistics&a=account&\";s:15:\"permission_name\";s:23:\"system_account_analysis\";s:4:\"icon\";s:17:\"wi wi-statistical\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}}s:5:\"cache\";a:2:{s:5:\"title\";s:6:\"缓存\";s:4:\"menu\";a:1:{s:26:\"system_setting_updatecache\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"更新缓存\";s:3:\"url\";s:35:\"./index.php?c=system&a=updatecache&\";s:15:\"permission_name\";s:26:\"system_setting_updatecache\";s:4:\"icon\";s:12:\"wi wi-update\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}}}s:9:\"is_system\";b:1;s:10:\"is_display\";b:1;s:12:\"displayorder\";i:10;}s:4:\"site\";a:8:{s:5:\"title\";s:6:\"站点\";s:4:\"icon\";s:17:\"wi wi-system-site\";s:3:\"url\";s:28:\"./index.php?c=system&a=site&\";s:7:\"section\";a:3:{s:7:\"setting\";a:2:{s:5:\"title\";s:6:\"设置\";s:4:\"menu\";a:9:{s:19:\"system_setting_site\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"站点设置\";s:3:\"url\";s:28:\"./index.php?c=system&a=site&\";s:15:\"permission_name\";s:19:\"system_setting_site\";s:4:\"icon\";s:18:\"wi wi-site-setting\";s:12:\"displayorder\";i:9;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:19:\"system_setting_menu\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"菜单设置\";s:3:\"url\";s:28:\"./index.php?c=system&a=menu&\";s:15:\"permission_name\";s:19:\"system_setting_menu\";s:4:\"icon\";s:18:\"wi wi-menu-setting\";s:12:\"displayorder\";i:8;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:25:\"system_setting_attachment\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"附件设置\";s:3:\"url\";s:34:\"./index.php?c=system&a=attachment&\";s:15:\"permission_name\";s:25:\"system_setting_attachment\";s:4:\"icon\";s:16:\"wi wi-attachment\";s:12:\"displayorder\";i:7;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:25:\"system_setting_systeminfo\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"系统信息\";s:3:\"url\";s:34:\"./index.php?c=system&a=systeminfo&\";s:15:\"permission_name\";s:25:\"system_setting_systeminfo\";s:4:\"icon\";s:17:\"wi wi-system-info\";s:12:\"displayorder\";i:6;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:19:\"system_setting_logs\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"查看日志\";s:3:\"url\";s:28:\"./index.php?c=system&a=logs&\";s:15:\"permission_name\";s:19:\"system_setting_logs\";s:4:\"icon\";s:9:\"wi wi-log\";s:12:\"displayorder\";i:5;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:26:\"system_setting_ipwhitelist\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:11:\"IP白名单\";s:3:\"url\";s:35:\"./index.php?c=system&a=ipwhitelist&\";s:15:\"permission_name\";s:26:\"system_setting_ipwhitelist\";s:4:\"icon\";s:8:\"wi wi-ip\";s:12:\"displayorder\";i:4;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:28:\"system_setting_sensitiveword\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:15:\"过滤敏感词\";s:3:\"url\";s:37:\"./index.php?c=system&a=sensitiveword&\";s:15:\"permission_name\";s:28:\"system_setting_sensitiveword\";s:4:\"icon\";s:15:\"wi wi-sensitive\";s:12:\"displayorder\";i:3;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:25:\"system_setting_thirdlogin\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:25:\"用户登录/注册设置\";s:3:\"url\";s:33:\"./index.php?c=user&a=registerset&\";s:15:\"permission_name\";s:25:\"system_setting_thirdlogin\";s:4:\"icon\";s:10:\"wi wi-user\";s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:20:\"system_setting_oauth\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:17:\"oauth全局设置\";s:3:\"url\";s:29:\"./index.php?c=system&a=oauth&\";s:15:\"permission_name\";s:20:\"system_setting_oauth\";s:4:\"icon\";s:11:\"wi wi-oauth\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}}s:7:\"utility\";a:2:{s:5:\"title\";s:12:\"常用工具\";s:4:\"menu\";a:5:{s:24:\"system_utility_filecheck\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:18:\"系统文件校验\";s:3:\"url\";s:33:\"./index.php?c=system&a=filecheck&\";s:15:\"permission_name\";s:24:\"system_utility_filecheck\";s:4:\"icon\";s:10:\"wi wi-file\";s:12:\"displayorder\";i:5;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:23:\"system_utility_optimize\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"性能优化\";s:3:\"url\";s:32:\"./index.php?c=system&a=optimize&\";s:15:\"permission_name\";s:23:\"system_utility_optimize\";s:4:\"icon\";s:14:\"wi wi-optimize\";s:12:\"displayorder\";i:4;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:23:\"system_utility_database\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:9:\"数据库\";s:3:\"url\";s:32:\"./index.php?c=system&a=database&\";s:15:\"permission_name\";s:23:\"system_utility_database\";s:4:\"icon\";s:9:\"wi wi-sql\";s:12:\"displayorder\";i:3;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:19:\"system_utility_scan\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"木马查杀\";s:3:\"url\";s:28:\"./index.php?c=system&a=scan&\";s:15:\"permission_name\";s:19:\"system_utility_scan\";s:4:\"icon\";s:12:\"wi wi-safety\";s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:18:\"system_utility_bom\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:15:\"检测文件BOM\";s:3:\"url\";s:27:\"./index.php?c=system&a=bom&\";s:15:\"permission_name\";s:18:\"system_utility_bom\";s:4:\"icon\";s:9:\"wi wi-bom\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}}s:7:\"backjob\";a:2:{s:5:\"title\";s:12:\"后台任务\";s:4:\"menu\";a:1:{s:10:\"system_job\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"后台任务\";s:3:\"url\";s:38:\"./index.php?c=system&a=job&do=display&\";s:15:\"permission_name\";s:10:\"system_job\";s:4:\"icon\";s:9:\"wi wi-job\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}}}s:7:\"founder\";b:1;s:9:\"is_system\";b:1;s:10:\"is_display\";b:1;s:12:\"displayorder\";i:11;}s:4:\"help\";a:8:{s:5:\"title\";s:12:\"系统帮助\";s:4:\"icon\";s:12:\"wi wi-market\";s:3:\"url\";s:29:\"./index.php?c=help&a=display&\";s:7:\"section\";a:0:{}s:5:\"blank\";b:0;s:9:\"is_system\";b:1;s:10:\"is_display\";b:1;s:12:\"displayorder\";i:12;}s:5:\"store\";a:7:{s:5:\"title\";s:6:\"商城\";s:4:\"icon\";s:11:\"wi wi-store\";s:3:\"url\";s:43:\"./index.php?c=home&a=welcome&do=ext&m=store\";s:7:\"section\";a:0:{}s:9:\"is_system\";b:1;s:10:\"is_display\";b:1;s:12:\"displayorder\";i:13;}}');
INSERT INTO `ims_core_cache` VALUES ('we7:unimodules::', 'a:17:{s:5:\"basic\";a:1:{s:4:\"name\";s:5:\"basic\";}s:4:\"news\";a:1:{s:4:\"name\";s:4:\"news\";}s:5:\"music\";a:1:{s:4:\"name\";s:5:\"music\";}s:7:\"userapi\";a:1:{s:4:\"name\";s:7:\"userapi\";}s:8:\"recharge\";a:1:{s:4:\"name\";s:8:\"recharge\";}s:6:\"custom\";a:1:{s:4:\"name\";s:6:\"custom\";}s:6:\"images\";a:1:{s:4:\"name\";s:6:\"images\";}s:5:\"video\";a:1:{s:4:\"name\";s:5:\"video\";}s:5:\"voice\";a:1:{s:4:\"name\";s:5:\"voice\";}s:5:\"chats\";a:1:{s:4:\"name\";s:5:\"chats\";}s:6:\"wxcard\";a:1:{s:4:\"name\";s:6:\"wxcard\";}s:5:\"store\";a:1:{s:4:\"name\";s:5:\"store\";}s:9:\"deam_food\";a:1:{s:4:\"name\";s:9:\"deam_food\";}s:8:\"demo_app\";a:1:{s:4:\"name\";s:8:\"demo_app\";}s:11:\"yunphp_shop\";a:1:{s:4:\"name\";s:11:\"yunphp_shop\";}s:5:\"jizan\";a:1:{s:4:\"name\";s:5:\"jizan\";}s:7:\"mon_jgg\";a:1:{s:4:\"name\";s:7:\"mon_jgg\";}}');
INSERT INTO `ims_core_cache` VALUES ('we7:last_account:imwBq', 'i:8;');
INSERT INTO `ims_core_cache` VALUES ('we7:module_setting:ants_jizanbao:8', 'a:7:{s:2:\"id\";s:1:\"1\";s:7:\"uniacid\";s:1:\"8\";s:6:\"module\";s:13:\"ants_jizanbao\";s:7:\"enabled\";s:1:\"1\";s:8:\"settings\";s:232:\"a:10:{s:11:\"noticeemail\";s:0:\"\";s:6:\"mobile\";s:0:\"\";s:8:\"shopname\";s:0:\"\";s:8:\"template\";s:1:\"0\";s:10:\"templateid\";s:0:\"\";s:7:\"address\";s:0:\"\";s:5:\"phone\";s:0:\"\";s:11:\"officialweb\";s:0:\"\";s:6:\"status\";i:0;s:11:\"description\";s:0:\"\";}\";s:8:\"shortcut\";s:1:\"0\";s:12:\"displayorder\";s:1:\"0\";}');
INSERT INTO `ims_core_cache` VALUES ('we7:user_modules:1', 'a:18:{s:13:\"ants_jizanbao\";s:3:\"all\";s:7:\"mon_jgg\";s:3:\"all\";s:5:\"jizan\";s:3:\"all\";s:8:\"demo_app\";s:3:\"all\";s:11:\"yunphp_shop\";s:3:\"all\";s:9:\"deam_food\";s:3:\"all\";s:5:\"store\";s:3:\"all\";s:6:\"wxcard\";s:3:\"all\";s:5:\"chats\";s:3:\"all\";s:5:\"voice\";s:3:\"all\";s:5:\"video\";s:3:\"all\";s:6:\"images\";s:3:\"all\";s:6:\"custom\";s:3:\"all\";s:8:\"recharge\";s:3:\"all\";s:7:\"userapi\";s:3:\"all\";s:5:\"music\";s:3:\"all\";s:4:\"news\";s:3:\"all\";s:5:\"basic\";s:3:\"all\";}');
INSERT INTO `ims_core_cache` VALUES ('we7:user_accounts:wechats:1', 'a:1:{i:8;a:8:{s:4:\"acid\";s:1:\"6\";s:7:\"uniacid\";s:1:\"8\";s:4:\"name\";s:15:\"测试公众号\";s:4:\"type\";s:1:\"1\";s:5:\"level\";s:1:\"2\";s:3:\"key\";s:8:\"55555555\";s:6:\"secret\";s:10:\"5555555555\";s:5:\"token\";s:32:\"aE8kkXXfkevXvbQHq8dnXqkEhVvfe3xm\";}}');
INSERT INTO `ims_core_cache` VALUES ('we7:last_account:v9OvG', 'i:8;');
INSERT INTO `ims_core_cache` VALUES ('we7:uni_groups', 'a:2:{i:2;a:12:{s:2:\"id\";s:1:\"2\";s:9:\"owner_uid\";s:1:\"0\";s:4:\"name\";s:0:\"\";s:7:\"modules\";a:2:{i:0;s:5:\"jizan\";i:1;s:13:\"ants_jizanbao\";}s:9:\"templates\";a:0:{}s:7:\"uniacid\";s:1:\"0\";s:3:\"uid\";s:1:\"2\";s:6:\"aliapp\";a:0:{}s:5:\"xzapp\";a:0:{}s:8:\"phoneapp\";a:0:{}s:6:\"webapp\";a:0:{}s:5:\"wxapp\";a:0:{}}i:1;a:12:{s:2:\"id\";s:1:\"1\";s:9:\"owner_uid\";s:1:\"0\";s:4:\"name\";s:18:\"体验套餐服务\";s:7:\"modules\";a:5:{i:0;s:11:\"yunphp_shop\";i:1;s:8:\"demo_app\";i:2;s:5:\"jizan\";i:3;s:7:\"mon_jgg\";i:4;s:13:\"ants_jizanbao\";}s:9:\"templates\";a:0:{}s:7:\"uniacid\";s:1:\"0\";s:3:\"uid\";s:1:\"0\";s:6:\"aliapp\";a:0:{}s:5:\"xzapp\";a:0:{}s:8:\"phoneapp\";a:0:{}s:6:\"webapp\";a:0:{}s:5:\"wxapp\";a:1:{i:0;s:9:\"deam_food\";}}}');
INSERT INTO `ims_core_cache` VALUES ('we7:defaultgroupid:8', 's:1:\"2\";');
INSERT INTO `ims_core_cache` VALUES ('we7:accesstoken:6', 'a:2:{s:5:\"token\";s:157:\"22_XW7IB5bdyNPFoRiegy1soWA2rtG92z4nQOXqe1tuylDu9UG6h6SjkxNjUEMpiWwPK96Mh5evygehT1C7SAOjUYbZbgG-QAXcaxIXStUQo3nqZm5MOu4WRB0NF2skWvp0AyZALxSWrSTgZ9r_UMZiAJAIAN\";s:6:\"expire\";i:1560423909;}');
INSERT INTO `ims_core_cache` VALUES ('we7:last_account:Qfoqc', 'i:8;');
INSERT INTO `ims_core_cache` VALUES ('we7:last_account:FziEi', 'i:8;');
INSERT INTO `ims_core_cache` VALUES ('we7:jsticket:6', 'a:2:{s:6:\"ticket\";s:86:\"kgt8ON7yVITDhtdwci0qecdgKgMGSmLXS4farrZ2f5f2fOIvu1AgugwglzQFPTUvAM8yvIBKu4yxyCCPIWq45g\";s:6:\"expire\";i:1560423909;}');
INSERT INTO `ims_core_cache` VALUES ('we7:last_account:LFvP4', 'i:8;');
INSERT INTO `ims_core_cache` VALUES ('we7:last_account:iexXK', 'i:8;');
INSERT INTO `ims_core_cache` VALUES ('we7:last_account:XNsXN', 'i:8;');
INSERT INTO `ims_core_cache` VALUES ('we7:last_account:c1TX2', 'i:8;');
INSERT INTO `ims_core_cache` VALUES ('oqo_mw5J50OoH3PUyRgParlPubas', 'a:3:{s:6:\"openid\";s:28:\"oqo_mw5J50OoH3PUyRgParlPubas\";s:4:\"nuid\";N;s:9:\"beizan_id\";N;}');

-- ----------------------------
-- Table structure for ims_core_cron
-- ----------------------------
DROP TABLE IF EXISTS `ims_core_cron`;
CREATE TABLE `ims_core_cron`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `cloudid` int(10) UNSIGNED NOT NULL,
  `module` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `type` tinyint(3) UNSIGNED NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `filename` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `lastruntime` int(10) UNSIGNED NOT NULL,
  `nextruntime` int(10) UNSIGNED NOT NULL,
  `weekday` tinyint(3) NOT NULL,
  `day` tinyint(3) NOT NULL,
  `hour` tinyint(3) NOT NULL,
  `minute` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `extra` varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL,
  `createtime` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `createtime`(`createtime`) USING BTREE,
  INDEX `nextruntime`(`nextruntime`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `cloudid`(`cloudid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_core_cron_record
-- ----------------------------
DROP TABLE IF EXISTS `ims_core_cron_record`;
CREATE TABLE `ims_core_cron_record`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `module` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tid` int(10) UNSIGNED NOT NULL,
  `note` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tag` varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `createtime` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `tid`(`tid`) USING BTREE,
  INDEX `module`(`module`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_core_job
-- ----------------------------
DROP TABLE IF EXISTS `ims_core_job`;
CREATE TABLE `ims_core_job`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(4) NOT NULL,
  `uniacid` int(11) NOT NULL,
  `payload` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` tinyint(3) NOT NULL,
  `title` varchar(22) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `handled` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `createtime` int(11) NOT NULL,
  `updatetime` int(11) NOT NULL,
  `endtime` int(11) NOT NULL,
  `isdeleted` tinyint(1) NULL DEFAULT NULL,
  `uid` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ims_core_job
-- ----------------------------
INSERT INTO `ims_core_job` VALUES (1, 10, 2, '', 1, '删除111的素材数据', 0, 0, 1556439249, 1556439249, 1556439249, 1, 1);
INSERT INTO `ims_core_job` VALUES (2, 10, 1, '', 1, '删除微擎团队的素材数据', 0, 0, 1559117895, 1559117895, 1559117896, 1, 1);
INSERT INTO `ims_core_job` VALUES (3, 10, 7, '', 1, '删除del001的素材数据', 0, 0, 1559122024, 1559122024, 1559122025, 1, 1);
INSERT INTO `ims_core_job` VALUES (4, 10, 6, '', 1, '删除del001的素材数据', 0, 0, 1559122053, 1559122053, 1559122054, 1, 1);
INSERT INTO `ims_core_job` VALUES (5, 10, 3, '', 1, '删除驾校招生管理系统的素材数据', 1, 1, 1559122093, 1559122094, 1559122095, 1, 1);

-- ----------------------------
-- Table structure for ims_core_menu
-- ----------------------------
DROP TABLE IF EXISTS `ims_core_menu`;
CREATE TABLE `ims_core_menu`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pid` int(10) UNSIGNED NOT NULL,
  `title` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `append_title` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `append_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `displayorder` tinyint(3) UNSIGNED NOT NULL,
  `type` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_display` tinyint(3) UNSIGNED NOT NULL,
  `is_system` tinyint(3) UNSIGNED NOT NULL,
  `permission_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `group_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `icon` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_core_paylog
-- ----------------------------
DROP TABLE IF EXISTS `ims_core_paylog`;
CREATE TABLE `ims_core_paylog`  (
  `plid` bigint(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `uniacid` int(11) NOT NULL,
  `acid` int(10) NOT NULL,
  `openid` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `uniontid` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tid` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `fee` decimal(10, 2) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `module` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tag` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_usecard` tinyint(3) UNSIGNED NOT NULL,
  `card_type` tinyint(3) UNSIGNED NOT NULL,
  `card_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `card_fee` decimal(10, 2) UNSIGNED NOT NULL,
  `encrypt_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`plid`) USING BTREE,
  INDEX `idx_openid`(`openid`) USING BTREE,
  INDEX `idx_tid`(`tid`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `uniontid`(`uniontid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_core_performance
-- ----------------------------
DROP TABLE IF EXISTS `ims_core_performance`;
CREATE TABLE `ims_core_performance`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) NOT NULL,
  `runtime` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `runurl` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `runsql` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `createtime` int(10) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ims_core_performance
-- ----------------------------
INSERT INTO `ims_core_performance` VALUES (1, 2, '15.1280910', 'http://mywe7.com/web/index.php?c=site&a=entry&op=post&do=AddActivitys&m=ants_jizanbao', 'INSERT INTO `ims_ants_jizanbao_business` SET `business_info` = :business_info_8 , `business_longitude` = :business_longitude_9 , `business_latitude` = :business_latitude_10 , `business_address` = :business_address_11 , `business_name` = :business_name_12 , `business_tel` = :business_tel_13', 1559813095);
INSERT INTO `ims_core_performance` VALUES (2, 2, '12.0958101', 'http://mywe7.com/web/index.php?c=site&a=entry&op=post&do=AddActivitys&m=ants_jizanbao', 'INSERT INTO `ims_ants_jizanbao_activitys` SET `activity_title` = :activity_title_19 , `state` = :state_20 , `date_start` = :date_start_21 , `date_end` = :date_end_22 , `infinite` = :infinite_23 , `theme_img` = :theme_img_24 , `background_color` = :background_color_25 , `activity_rule` = :activity_rule_26 , `follow` = :follow_27 , `follow_qrcode` = :follow_qrcode_28 , `verification` = :verification_29 , `domain` = :domain_30 , `domain1` = :domain1_31 , `domain2` = :domain2_32 , `share_title` = :share_title_3', 1559813140);
INSERT INTO `ims_core_performance` VALUES (3, 2, '25.6639068', 'http://mywe7.com/web/index.php?c=site&a=entry&op=post&do=AddActivitys&m=ants_jizanbao', 'INSERT INTO `ims_ants_jizanbao_activitys` SET `activity_title` = :activity_title_14 , `state` = :state_15 , `date_start` = :date_start_16 , `date_end` = :date_end_17 , `infinite` = :infinite_18 , `theme_img` = :theme_img_19 , `background_color` = :background_color_20 , `activity_rule` = :activity_rule_21 , `follow` = :follow_22 , `follow_qrcode` = :follow_qrcode_23 , `verification` = :verification_24 , `domain` = :domain_25 , `domain1` = :domain1_26 , `domain2` = :domain2_27 , `share_title` = :share_title_2', 1559813202);

-- ----------------------------
-- Table structure for ims_core_queue
-- ----------------------------
DROP TABLE IF EXISTS `ims_core_queue`;
CREATE TABLE `ims_core_queue`  (
  `qid` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `acid` int(10) UNSIGNED NOT NULL,
  `message` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `params` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `keyword` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `response` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `module` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` tinyint(3) UNSIGNED NOT NULL,
  `dateline` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`qid`) USING BTREE,
  INDEX `uniacid`(`uniacid`, `acid`) USING BTREE,
  INDEX `module`(`module`) USING BTREE,
  INDEX `dateline`(`dateline`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_core_refundlog
-- ----------------------------
DROP TABLE IF EXISTS `ims_core_refundlog`;
CREATE TABLE `ims_core_refundlog`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `refund_uniontid` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `reason` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `uniontid` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `fee` decimal(10, 2) NOT NULL,
  `status` int(2) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `refund_uniontid`(`refund_uniontid`) USING BTREE,
  INDEX `uniontid`(`uniontid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_core_resource
-- ----------------------------
DROP TABLE IF EXISTS `ims_core_resource`;
CREATE TABLE `ims_core_resource`  (
  `mid` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `media_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trunk` int(10) UNSIGNED NOT NULL,
  `type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `dateline` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`mid`) USING BTREE,
  INDEX `acid`(`uniacid`) USING BTREE,
  INDEX `type`(`type`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_core_sendsms_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_core_sendsms_log`;
CREATE TABLE `ims_core_sendsms_log`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `mobile` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `result` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `createtime` int(11) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_core_sessions
-- ----------------------------
DROP TABLE IF EXISTS `ims_core_sessions`;
CREATE TABLE `ims_core_sessions`  (
  `sid` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `openid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `data` varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `expiretime` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`sid`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ims_core_sessions
-- ----------------------------
INSERT INTO `ims_core_sessions` VALUES ('2695560439cb6e8033a8359ceea4eb7b', 8, '192.168.0.110', 'acid|s:1:\"6\";uniacid|i:8;token|a:2:{s:4:\"pVv9\";i:1561713475;s:4:\"OfW9\";i:1561713477;}access_token_web|a:7:{s:12:\"access_token\";s:89:\"22_4H7i3Il1W9MUiYtqEOEnCBipy-YBblDqMnPTlJJr7qRJx2HWt1oUcVrTGZxKfJORs-J59ftbhvBoDTqUHkK5_g\";s:10:\"expires_in\";i:7200;s:13:\"refresh_token\";s:89:\"22_aT3N6rpJab20m_tQ-citGfs-KrOb0r44NSnXh2EhMCOmn2yjRNC2rIO45L2YUN15okdXWWsTveJxwb1kecEZtg\";s:6:\"openid\";s:28:\"oqo_mw5J50OoH3PUyRgParlPubas\";s:5:\"scope\";s:15:\"snsapi_userinfo\";s:7:\"unionid\";s:28:\"oILAIwM-LI-DA46L5qx54xvLrYwU\";s:8:\"time_out\";i:1561715040;}', 1561717077);
INSERT INTO `ims_core_sessions` VALUES ('212e4c1fd5563e859a64a5631b9cea4b', 8, '192.168.0.110', 'acid|s:1:\"6\";uniacid|i:8;token|a:1:{s:4:\"OF1N\";i:1561943019;}', 1561946619);
INSERT INTO `ims_core_sessions` VALUES ('86b037ac1ad7368eaf6802fa3e2a06dd', 8, '192.168.0.110', 'acid|s:1:\"6\";uniacid|i:8;token|a:1:{s:4:\"Ix98\";i:1561706952;}', 1561710552);
INSERT INTO `ims_core_sessions` VALUES ('1666a432898afea80ed07bcfd2647866', 8, '117.136.87.41', 'acid|s:1:\"6\";uniacid|i:8;token|a:6:{s:4:\"AgDW\";i:1561708225;s:4:\"cPZ7\";i:1561708300;s:4:\"GchI\";i:1561708302;s:4:\"qZw1\";i:1561708303;s:4:\"l372\";i:1561708309;s:4:\"yBMr\";i:1561708322;}access_token_web|a:3:{s:7:\"errcode\";i:40030;s:6:\"errmsg\";s:58:\"invalid refresh_token, hints: [ req_id: YhNCpz4ce-8f_Zga ]\";s:8:\"time_out\";i:1561708025;}', 1561711922);
INSERT INTO `ims_core_sessions` VALUES ('eb012edce1a818b469a68234769017ed', 8, '192.168.0.110', 'acid|s:1:\"6\";uniacid|i:8;token|a:1:{s:4:\"l88S\";i:1561705229;}', 1561708829);
INSERT INTO `ims_core_sessions` VALUES ('01b5389ff5ed41d0d73b13666601e924', 8, '192.168.0.110', 'acid|s:1:\"6\";uniacid|i:8;token|a:1:{s:4:\"aRO3\";i:1561625052;}', 1561628652);
INSERT INTO `ims_core_sessions` VALUES ('4250ced68bbd086b04c2a479c0dd2a81', 8, '192.168.0.110', 'acid|s:1:\"6\";uniacid|i:8;token|a:1:{s:4:\"MT5k\";i:1561625200;}', 1561628800);
INSERT INTO `ims_core_sessions` VALUES ('c16b2b004cf51c20983bd7953718dd61', 8, '192.168.0.110', 'acid|s:1:\"6\";uniacid|i:8;token|a:1:{s:4:\"ehxM\";i:1561684825;}', 1561688425);
INSERT INTO `ims_core_sessions` VALUES ('dc1ded259e3e8763f73eb5ba7b01ea4b', 8, '192.168.0.110', 'acid|s:1:\"6\";uniacid|i:8;token|a:1:{s:4:\"RaHi\";i:1561684825;}', 1561688425);
INSERT INTO `ims_core_sessions` VALUES ('d3d692be6c4fa90a226f9ec6f6141eab', 8, '192.168.0.110', 'acid|s:1:\"6\";uniacid|i:8;token|a:1:{s:4:\"b3qA\";i:1561684825;}', 1561688425);
INSERT INTO `ims_core_sessions` VALUES ('321fff31b2a050e23b014fa144763fac', 8, '192.168.0.110', 'acid|s:1:\"6\";uniacid|i:8;token|a:1:{s:4:\"NFu1\";i:1561684827;}', 1561688427);
INSERT INTO `ims_core_sessions` VALUES ('c9763108c38fff1b3ace36e1d31f97cc', 8, '192.168.0.110', 'acid|s:1:\"6\";uniacid|i:8;token|a:6:{s:4:\"Igy6\";i:1561706675;s:4:\"F6D3\";i:1561706676;s:4:\"g051\";i:1561706677;s:4:\"RM52\";i:1561706711;s:4:\"Vbzq\";i:1561706712;s:4:\"W6C9\";i:1561706716;}', 1561710316);
INSERT INTO `ims_core_sessions` VALUES ('335c93b44feff069f78e254799a41fc5', 8, '192.168.0.110', 'acid|s:1:\"6\";uniacid|i:8;token|a:1:{s:4:\"UI23\";i:1561684418;}', 1561688018);
INSERT INTO `ims_core_sessions` VALUES ('1c08a2b20e0b3e89e90e98f40d65952d', 8, '192.168.0.110', 'acid|s:1:\"6\";uniacid|i:8;token|a:1:{s:4:\"AFLG\";i:1561684409;}', 1561688009);
INSERT INTO `ims_core_sessions` VALUES ('661226ec794d86ba752b1f7545b017a0', 8, '192.168.0.110', 'acid|s:1:\"6\";uniacid|i:8;token|a:1:{s:4:\"fZlJ\";i:1561603093;}', 1561606693);
INSERT INTO `ims_core_sessions` VALUES ('64ac80983838735c9ebc3ff8a0ea8fa1', 8, '192.168.0.110', 'acid|s:1:\"6\";uniacid|i:8;token|a:1:{s:4:\"H3F9\";i:1561624775;}', 1561628375);
INSERT INTO `ims_core_sessions` VALUES ('bc12ded60b012c3582dd4373f9c5cb6f', 8, '192.168.0.110', 'acid|s:1:\"6\";uniacid|i:8;token|a:1:{s:4:\"QxCf\";i:1561607026;}', 1561610626);
INSERT INTO `ims_core_sessions` VALUES ('078dc29f275895dda6c66ba5d92a974d', 8, '192.168.0.110', 'acid|s:1:\"6\";uniacid|i:8;token|a:1:{s:4:\"t14B\";i:1561607061;}', 1561610661);
INSERT INTO `ims_core_sessions` VALUES ('d3fae3725e2e853fe983803dbd4b574d', 8, '192.168.0.110', 'acid|s:1:\"6\";uniacid|i:8;token|a:1:{s:4:\"tpAl\";i:1561616307;}', 1561619907);
INSERT INTO `ims_core_sessions` VALUES ('c1451bb6ceec0f5671b0c2548c545ca4', 8, '192.168.0.110', 'acid|s:1:\"6\";uniacid|i:8;token|a:1:{s:4:\"jfAs\";i:1561689432;}', 1561693032);
INSERT INTO `ims_core_sessions` VALUES ('2c24861e3832baa782187ddc0b3bf32d', 8, '192.168.0.110', 'acid|s:1:\"6\";uniacid|i:8;token|a:6:{s:4:\"VuyZ\";i:1561619744;s:4:\"fQ1a\";i:1561619745;s:4:\"UMJ1\";i:1561619746;s:4:\"red0\";i:1561619748;s:4:\"D22B\";i:1561619749;s:4:\"CSpw\";i:1561619749;}', 1561623349);
INSERT INTO `ims_core_sessions` VALUES ('e54538d4a06b7071c5919d9ddb4cfd1c', 8, '192.168.0.110', 'acid|s:1:\"6\";uniacid|i:8;token|a:2:{s:4:\"Ik30\";i:1561621055;s:4:\"veno\";i:1561621056;}access_token_web|a:7:{s:12:\"access_token\";s:89:\"22_P6fZDo_fvdX5jc07or9cAgr4p7INM1UiMUChlhQf7vkFMjJvVE2aR4XWSSrXWDC8hIwDcfRgTejQ_ccVhDQ9KA\";s:10:\"expires_in\";i:7200;s:13:\"refresh_token\";s:89:\"22_WHjpldYXqWmdOnOT6fG4SshrJjGa15B7zKyqAcFAS-Kkq7UHytqtCOFtnHu9RceNbFLH3QJ7Dw-cRhltxNPx9Q\";s:6:\"openid\";s:28:\"oqo_mw4Kd1KMSvKU-2otQmyxMQk8\";s:5:\"scope\";s:15:\"snsapi_userinfo\";s:7:\"unionid\";s:28:\"oILAIwNFe_OHM3MRUSMAQ2T71wvg\";s:8:\"time_out\";i:1561627017;}', 1561624656);
INSERT INTO `ims_core_sessions` VALUES ('83785ef1ca5a2dd4956b9909b7823300', 8, '192.168.0.110', 'acid|s:1:\"6\";uniacid|i:8;token|a:1:{s:4:\"n5p2\";i:1561621623;}', 1561625223);
INSERT INTO `ims_core_sessions` VALUES ('7d85e8ffd26873bca977cd36baaba8b8', 8, '192.168.0.110', 'acid|s:1:\"6\";uniacid|i:8;token|a:1:{s:4:\"cPqa\";i:1561620467;}', 1561624067);
INSERT INTO `ims_core_sessions` VALUES ('4f3db0b3d6b54c8acbd71864e7361fcc', 8, '192.168.0.110', 'acid|s:1:\"6\";uniacid|i:8;token|a:3:{s:4:\"E595\";i:1561625369;s:4:\"IP2b\";i:1561625369;s:4:\"Bh97\";i:1561625371;}', 1561628971);
INSERT INTO `ims_core_sessions` VALUES ('6e7192707a5cd56165660ca3779dbd1d', 8, '192.168.0.110', 'acid|s:1:\"6\";uniacid|i:8;token|a:1:{s:4:\"Dtra\";i:1561624078;}', 1561627678);
INSERT INTO `ims_core_sessions` VALUES ('a85c2242a43bad26d0653e9fbdb2a2a2', 8, '192.168.0.110', 'acid|s:1:\"6\";uniacid|i:8;token|a:1:{s:4:\"uv42\";i:1561623641;}', 1561627241);
INSERT INTO `ims_core_sessions` VALUES ('8abbfbd4f724ce29e9e3e946241671d6', 8, '192.168.0.110', 'acid|s:1:\"6\";uniacid|i:8;token|a:1:{s:4:\"sM59\";i:1561624355;}', 1561627955);
INSERT INTO `ims_core_sessions` VALUES ('4fb1c58fd4d48a7fd613fae420f37ee8', 8, '192.168.0.110', 'acid|s:1:\"6\";uniacid|i:8;token|a:1:{s:4:\"Ioqi\";i:1561624461;}', 1561628061);
INSERT INTO `ims_core_sessions` VALUES ('8c03ea14a4a69b3da45495ad54df541b', 8, '192.168.0.110', 'acid|s:1:\"6\";uniacid|i:8;token|a:1:{s:4:\"O9D6\";i:1561624484;}', 1561628084);
INSERT INTO `ims_core_sessions` VALUES ('ee9b63d2f214777a839b0b921072ca8e', 8, '192.168.0.110', 'acid|s:1:\"6\";uniacid|i:8;token|a:1:{s:4:\"nLg1\";i:1561691024;}', 1561694624);
INSERT INTO `ims_core_sessions` VALUES ('55db4d2f2b7fdbd63fc5100fdfb57c77', 8, '117.136.50.195', 'acid|s:1:\"6\";uniacid|i:8;token|a:2:{s:4:\"sgmr\";i:1561456189;s:4:\"oiLz\";i:1561456274;}access_token_web|a:7:{s:12:\"access_token\";s:110:\"22_xP_JVlnM3C5UoRzgKEtv8iConXC2nbBGPon95yjL4rTQz9MipxmojiyOLXXmGnwOYcEnsikTZemCakZ9qT8HkPhCGzTc9X0B19f1wGDLiL0\";s:10:\"expires_in\";i:7200;s:13:\"refresh_token\";s:110:\"22_JbM3afsycp9ERvb5AzGVYY0n0teqI8Gf5-4lSqotuI92FUAqFzSxGZYEj92rebYc0iNBxtyBrX9Ytk0F-37aGMEq6pncdOFxutkn4YMqU1k\";s:6:\"openid\";s:28:\"oqo_mw5J50OoH3PUyRgParlPubas\";s:5:\"scope\";s:15:\"snsapi_userinfo\";s:7:\"unionid\";s:28:\"oILAIwM-LI-DA46L5qx54xvLrYwU\";s:8:\"time_out\";i:1561460216;}', 1561459874);
INSERT INTO `ims_core_sessions` VALUES ('16fbbfc37f3a8385a52a12456b452195', 8, '192.168.0.110', 'acid|s:1:\"6\";uniacid|i:8;token|a:1:{s:4:\"yF2o\";i:1561452537;}', 1561456137);
INSERT INTO `ims_core_sessions` VALUES ('45cfb2ad9440165aa353fc292b8e9b26', 8, '192.168.0.110', 'acid|s:1:\"6\";uniacid|i:8;token|a:1:{s:4:\"UEv4\";i:1561456950;}', 1561460550);
INSERT INTO `ims_core_sessions` VALUES ('7c3af012e597b845c36c8bafd51238d3', 8, '192.168.0.110', 'acid|s:1:\"6\";uniacid|i:8;token|a:1:{s:4:\"B7x5\";i:1561450901;}', 1561454501);
INSERT INTO `ims_core_sessions` VALUES ('945ec79a6f43cc30691d3ef6ece317be', 8, '192.168.0.110', 'acid|s:1:\"6\";uniacid|i:8;token|a:1:{s:4:\"IQj7\";i:1561453505;}', 1561457105);
INSERT INTO `ims_core_sessions` VALUES ('4253f566886f5b49346446e2a8819254', 8, '192.168.0.110', 'acid|s:1:\"6\";uniacid|i:8;token|a:1:{s:4:\"hPf9\";i:1561621212;}', 1561624812);
INSERT INTO `ims_core_sessions` VALUES ('68667da162f98d23380ccc551f64bdb8', 8, '117.136.50.195', 'acid|s:1:\"6\";uniacid|i:8;token|a:1:{s:4:\"k577\";i:1561451473;}', 1561455073);
INSERT INTO `ims_core_sessions` VALUES ('729d4c50246d90d03d52372b90aa8795', 8, '192.168.0.110', 'acid|s:1:\"6\";uniacid|i:8;token|a:2:{s:4:\"dYB3\";i:1561456207;s:4:\"duu7\";i:1561456265;}access_token_web|a:7:{s:12:\"access_token\";s:89:\"22_zUOKP_yxM03hsqEJjWB3N7LmKAgaO5OvwPWa7bZpSA4Q3iq8SYOtpQflDxhOSVh2XRPC8oc2iisVLzZqwXFhHA\";s:10:\"expires_in\";i:7200;s:13:\"refresh_token\";s:89:\"22_KD5DkodxceeTzPneT3hekXMElwIwWlSrInQ8lUiVMg2IP95SH1hnuG1twYz_pHMWzarCab5mgJ8ipsD1Wvs2uw\";s:6:\"openid\";s:28:\"oqo_mw5J50OoH3PUyRgParlPubas\";s:5:\"scope\";s:15:\"snsapi_userinfo\";s:7:\"unionid\";s:28:\"oILAIwM-LI-DA46L5qx54xvLrYwU\";s:8:\"time_out\";i:1561458892;}', 1561459865);
INSERT INTO `ims_core_sessions` VALUES ('d2a6f7f4d8ba2af0eea64d0294de9bce', 8, '192.168.0.110', 'acid|s:1:\"6\";uniacid|i:8;token|a:6:{s:4:\"g3l2\";i:1561451638;s:4:\"TTtZ\";i:1561451665;s:4:\"hM2h\";i:1561451665;s:4:\"Z5kq\";i:1561451766;s:4:\"vQFQ\";i:1561451783;s:4:\"jDIJ\";i:1561451790;}access_token_web|a:7:{s:12:\"access_token\";s:89:\"22_KBN3VVS5aGTu1SWp4lvvDFxbWjmzcBfh618thMmRicAMrEKNPM0EFVV2pDT1zi1WGyWV2J-_ICTWanikKyqjNA\";s:10:\"expires_in\";i:7200;s:13:\"refresh_token\";s:89:\"22_5SHM3a5CNkfuTnBC0s8FJOW2cRgoesj0K0acNaMfE05MGZ9yBEzhMkN3D7825mEOJKFmpp0gvR1USLAwphgmmQ\";s:6:\"openid\";s:28:\"oqo_mw5J50OoH3PUyRgParlPubas\";s:5:\"scope\";s:15:\"snsapi_userinfo\";s:7:\"unionid\";s:28:\"oILAIwM-LI-DA46L5qx54xvLrYwU\";s:8:\"time_out\";i:1561458638;}', 1561455390);
INSERT INTO `ims_core_sessions` VALUES ('b3ceb92503065703e3e7d31077d8d5ca', 8, '192.168.0.110', 'acid|s:1:\"6\";uniacid|i:8;token|a:1:{s:4:\"nFml\";i:1561451713;}', 1561455313);
INSERT INTO `ims_core_sessions` VALUES ('7aaf1ce4bbf8abd686289f54decfa89b', 8, '192.168.0.110', 'acid|s:1:\"6\";uniacid|i:8;token|a:2:{s:4:\"Tm14\";i:1561451372;s:4:\"i9g8\";i:1561451384;}', 1561454984);
INSERT INTO `ims_core_sessions` VALUES ('c6707d16e56608c355c92ad6037472d0', 8, '192.168.0.110', 'acid|s:1:\"6\";uniacid|i:8;token|a:2:{s:4:\"ypo1\";i:1561619539;s:4:\"C2ZV\";i:1561619631;}', 1561623231);
INSERT INTO `ims_core_sessions` VALUES ('9a96cdbbdfcb9b3fe0a357e9633626fa', 8, '192.168.0.110', 'acid|s:1:\"6\";uniacid|i:8;token|a:6:{s:4:\"sIb0\";i:1561450382;s:4:\"WUEE\";i:1561450401;s:4:\"H0wU\";i:1561450426;s:4:\"MYlt\";i:1561450455;s:4:\"foov\";i:1561450482;s:4:\"er1q\";i:1561450548;}access_token_web|a:7:{s:12:\"access_token\";s:89:\"22_u9FbfdhROwuf6SR4o895ngO9XNvdO6COJyZq9fhrZamUfQeXPncT4obSyor1V89e_Vb6AHSVEcqSwWAOE_jG_A\";s:10:\"expires_in\";i:7200;s:13:\"refresh_token\";s:89:\"22_TP7BgXzPG8l2Juaa-4tLSCzXJATtgsznlr8rdChLtgW1Z7TeJA8K_QKkfDLqV_eSsrT-UmOloNd4ymLnr5gT1Q\";s:6:\"openid\";s:28:\"oqo_mw500M6iLFYCCIuHU_THtpfA\";s:5:\"scope\";s:15:\"snsapi_userinfo\";s:7:\"unionid\";s:28:\"oILAIwI7IqP93Ry4Tdb7DA446oQI\";s:8:\"time_out\";i:1561457193;}', 1561454148);
INSERT INTO `ims_core_sessions` VALUES ('c2b90281fab5a3c717b1789d514f741c', 8, '117.136.50.207', 'acid|s:1:\"6\";uniacid|i:8;token|a:1:{s:4:\"XWMx\";i:1561449295;}', 1561452895);
INSERT INTO `ims_core_sessions` VALUES ('cae54aa3bdbe9f9172cb8478538985e5', 8, '192.168.0.110', 'acid|s:1:\"6\";uniacid|i:8;token|a:1:{s:4:\"iW2A\";i:1561449745;}', 1561453345);
INSERT INTO `ims_core_sessions` VALUES ('1aef53ff22af5e30539813d898a78344', 8, '192.168.0.110', 'acid|s:1:\"6\";uniacid|i:8;token|a:1:{s:4:\"lrYx\";i:1561449712;}', 1561453312);
INSERT INTO `ims_core_sessions` VALUES ('d5fa495dd38a59b06b91a8ac8fb7d20f', 8, 'oqo_mw_M33JHwuEArVsS3WZqIawM', 'openid|s:28:\"oqo_mw_M33JHwuEArVsS3WZqIawM\";__reply_times|a:3:{s:7:\"content\";N;s:4:\"date\";s:10:\"2019-06-26\";s:5:\"times\";i:1;}', 1561526200);
INSERT INTO `ims_core_sessions` VALUES ('50cd3bbd430f42b27300e2aefad862bc', 8, '192.168.0.110', 'acid|s:1:\"6\";uniacid|i:8;token|a:1:{s:4:\"PpBU\";i:1561449968;}', 1561453568);
INSERT INTO `ims_core_sessions` VALUES ('7120e6dd090b543e23aac9a1857949a7', 8, '192.168.0.110', 'acid|s:1:\"6\";uniacid|i:8;token|a:1:{s:4:\"b81a\";i:1561450506;}', 1561454106);
INSERT INTO `ims_core_sessions` VALUES ('44e67db3c3a553166a97ad7554dcb55f', 8, '192.168.0.110', 'acid|s:1:\"6\";uniacid|i:8;token|a:3:{s:4:\"r0id\";i:1561450531;s:4:\"FB14\";i:1561450563;s:4:\"Veer\";i:1561450564;}access_token_web|a:7:{s:12:\"access_token\";s:89:\"22_QOQuxYW1xA9VYmtpDB1w6jBInVRDPAdK_myYXEguruPFpmyJ6kyWn_qtxse-Sp4UROf-tDpXQbfprL8DPFjMlQ\";s:10:\"expires_in\";i:7200;s:13:\"refresh_token\";s:89:\"22_4eMD0Dz8mEdrkLbMx1xot4Pu5_B-_lxo70ZbWdKTtP44-KWaRFT2aqgm0CcGloP5moO9SCx5vHijou5Tgloh-Q\";s:6:\"openid\";s:28:\"oqo_mw6KUyT0hQPgzIncbr9VirZc\";s:5:\"scope\";s:15:\"snsapi_userinfo\";s:7:\"unionid\";s:28:\"oILAIwDBTHfdR2WMOwkIwyj1Njjg\";s:8:\"time_out\";i:1561457563;}', 1561454164);
INSERT INTO `ims_core_sessions` VALUES ('fbfd3963f4a940bcea3a719eafad5e38', 8, '192.168.0.110', 'acid|s:1:\"6\";uniacid|i:8;token|a:1:{s:4:\"jAPA\";i:1561443940;}', 1561447540);
INSERT INTO `ims_core_sessions` VALUES ('98d757b2bcd3f11646aa9cc70e0ad974', 8, '192.168.0.110', 'acid|s:1:\"6\";uniacid|i:8;token|a:1:{s:4:\"I6Zi\";i:1561443941;}', 1561447541);
INSERT INTO `ims_core_sessions` VALUES ('52e2635ec58fb819fe58e4779b4b4554', 8, '192.168.0.110', 'acid|s:1:\"6\";uniacid|i:8;token|a:1:{s:4:\"qV2F\";i:1561443941;}', 1561447541);
INSERT INTO `ims_core_sessions` VALUES ('42dd3b775aff5e48523c7e58264365c1', 8, '192.168.0.110', 'acid|s:1:\"6\";uniacid|i:8;token|a:1:{s:4:\"R9BZ\";i:1561443943;}', 1561447543);
INSERT INTO `ims_core_sessions` VALUES ('66ea49af8bee37df9870e94524a735ba', 8, '192.168.0.110', 'acid|s:1:\"6\";uniacid|i:8;token|a:1:{s:4:\"SID9\";i:1561443953;}', 1561447553);
INSERT INTO `ims_core_sessions` VALUES ('4bd61ebafab01346840a1960adb57951', 8, '192.168.0.110', 'acid|s:1:\"6\";uniacid|i:8;token|a:1:{s:4:\"eJfa\";i:1561444018;}', 1561447618);
INSERT INTO `ims_core_sessions` VALUES ('fddef2a7acba1979153f0936c7e95f55', 8, '192.168.0.110', 'acid|s:1:\"6\";uniacid|i:8;token|a:1:{s:4:\"dmKh\";i:1561445002;}', 1561448602);
INSERT INTO `ims_core_sessions` VALUES ('0d486784208dcddae71e6b11163e8a5e', 8, '192.168.0.110', 'acid|s:1:\"6\";uniacid|i:8;token|a:1:{s:4:\"mbQK\";i:1561445002;}', 1561448602);
INSERT INTO `ims_core_sessions` VALUES ('f9fb88aea75fe7815c4e726f2b935112', 8, '192.168.0.110', 'acid|s:1:\"6\";uniacid|i:8;token|a:1:{s:4:\"zNBn\";i:1561453908;}', 1561457508);
INSERT INTO `ims_core_sessions` VALUES ('699fc877f48c12306b8fe3224ec60cb0', 8, '192.168.0.110', 'acid|s:1:\"6\";uniacid|i:8;token|a:3:{s:4:\"TZig\";i:1561453789;s:4:\"OMMb\";i:1561453789;s:4:\"jyT4\";i:1561453813;}', 1561457413);
INSERT INTO `ims_core_sessions` VALUES ('2041bb05d98107fbddb28ac387074818', 8, '117.136.50.195', 'acid|s:1:\"6\";uniacid|i:8;token|a:2:{s:4:\"u6X9\";i:1561451833;s:4:\"c9N8\";i:1561451844;}access_token_web|a:7:{s:12:\"access_token\";s:110:\"22_72F2KVyUQIIFIOBhxZgC6fY9pTmS7cHvEqJ3790wna7bLWG0nl-VwXs8buRXI_GznxzE5emxmalPr9yzetPG5L2avBTN0TsGi5oAmsRL6DQ\";s:10:\"expires_in\";i:7200;s:13:\"refresh_token\";s:110:\"22_A9qcjlaS0oWWHoQ01VO547CaqiPOYdTt1t04SOVojHQUnhbzW_GffewIwi9s1oAi06ms-5ixTPtOk9cDLr2-n2Q2gJk6Qa4l6WnzSoE-EEw\";s:6:\"openid\";s:28:\"oqo_mw5J50OoH3PUyRgParlPubas\";s:5:\"scope\";s:15:\"snsapi_userinfo\";s:7:\"unionid\";s:28:\"oILAIwM-LI-DA46L5qx54xvLrYwU\";s:8:\"time_out\";i:1561456099;}', 1561455444);
INSERT INTO `ims_core_sessions` VALUES ('93747d6272e3f6ff2c0fd2356c8ce2b9', 8, '192.168.0.110', 'acid|s:1:\"6\";uniacid|i:8;token|a:6:{s:4:\"XgsJ\";i:1561444821;s:4:\"hwBS\";i:1561444859;s:4:\"c21P\";i:1561444867;s:4:\"wS1s\";i:1561444899;s:4:\"f2bI\";i:1561444982;s:4:\"s5DD\";i:1561444993;}', 1561448593);
INSERT INTO `ims_core_sessions` VALUES ('8bdfeffed93e7f0776cb61473a23f09b', 8, '192.168.0.110', 'acid|s:1:\"6\";uniacid|i:8;token|a:1:{s:4:\"f477\";i:1561443831;}', 1561447431);
INSERT INTO `ims_core_sessions` VALUES ('e6ca4b11051bf9961c495cbeac1058b4', 8, '192.168.0.110', 'acid|s:1:\"6\";uniacid|i:8;token|a:1:{s:4:\"RVGC\";i:1561443831;}', 1561447431);
INSERT INTO `ims_core_sessions` VALUES ('bef064308c4ca546d16436cb2217ff84', 8, '192.168.0.110', 'acid|s:1:\"6\";uniacid|i:8;token|a:1:{s:4:\"ph60\";i:1561443832;}', 1561447432);
INSERT INTO `ims_core_sessions` VALUES ('937e0f09a628111d4e910a6e5b2f558f', 8, '192.168.0.110', 'acid|s:1:\"6\";uniacid|i:8;token|a:1:{s:4:\"gddm\";i:1561443832;}', 1561447432);
INSERT INTO `ims_core_sessions` VALUES ('e6d72edfaea89bbce73240d4b1961e13', 8, '192.168.0.110', 'acid|s:1:\"6\";uniacid|i:8;token|a:1:{s:4:\"inXq\";i:1561510913;}', 1561514513);
INSERT INTO `ims_core_sessions` VALUES ('191cbddd30fccdeec13dbe210054f124', 8, '192.168.0.110', 'acid|s:1:\"6\";uniacid|i:8;token|a:1:{s:4:\"Lv72\";i:1561510913;}', 1561514513);
INSERT INTO `ims_core_sessions` VALUES ('c047454486ad2bad648785c59deb92d1', 8, '192.168.0.110', 'acid|s:1:\"6\";uniacid|i:8;token|a:1:{s:4:\"orKr\";i:1561510913;}', 1561514513);
INSERT INTO `ims_core_sessions` VALUES ('242e528f03cdc0587e45818297ad9394', 8, '192.168.0.110', 'acid|s:1:\"6\";uniacid|i:8;token|a:6:{s:4:\"MVdT\";i:1561515203;s:4:\"E6A2\";i:1561515203;s:4:\"pFw3\";i:1561515203;s:4:\"KK8R\";i:1561515203;s:4:\"d9z6\";i:1561515203;s:4:\"bVTL\";i:1561515203;}', 1561518803);
INSERT INTO `ims_core_sessions` VALUES ('ac0f3e156968f7713921edc5609ed7cf', 8, '192.168.0.110', 'acid|s:1:\"6\";uniacid|i:8;token|a:1:{s:4:\"iGe3\";i:1561512805;}', 1561516405);
INSERT INTO `ims_core_sessions` VALUES ('cdfbd357e23828ba0a31abb816dcc1b4', 8, '192.168.0.110', 'acid|s:1:\"6\";uniacid|i:8;token|a:6:{s:4:\"W05s\";i:1561529603;s:4:\"O35Q\";i:1561529606;s:4:\"YKsW\";i:1561529609;s:4:\"jo5y\";i:1561529642;s:4:\"r35U\";i:1561529691;s:4:\"Ufjh\";i:1561529695;}', 1561533295);
INSERT INTO `ims_core_sessions` VALUES ('f51f0c78564effc9bf021fffc2173701', 8, '117.136.87.41', 'acid|s:1:\"6\";uniacid|i:8;token|a:6:{s:4:\"br4B\";i:1561706367;s:4:\"xjSx\";i:1561706369;s:4:\"l7R9\";i:1561706381;s:4:\"rONQ\";i:1561706455;s:4:\"iZuz\";i:1561706461;s:4:\"O27C\";i:1561706492;}access_token_web|a:7:{s:12:\"access_token\";s:110:\"22_aFOppA8gYPm01gFeBMHITvJs2U5WXYqObNghGsHJW-sRjlT-0tI05PJFJp2WCDAexgiskeaFKd2TWCl6SoF0E-9kgx6axIIE9M5j6yJ9jAM\";s:10:\"expires_in\";i:7200;s:13:\"refresh_token\";s:110:\"22_BvWm3z6yUaNuiM366qPr-IS0_1tNCp2tDvmEQT28RSfojJD_stRlnMAqt9SYJW1a_OtB6rsKqGYxI6ElvAcbXIKXmp8UBVSpWfCqL9pJbjw\";s:6:\"openid\";s:28:\"oqo_mw5J50OoH3PUyRgParlPubas\";s:5:\"scope\";s:15:\"snsapi_userinfo\";s:7:\"unionid\";s:28:\"oILAIwM-LI-DA46L5qx54xvLrYwU\";s:8:\"time_out\";i:1561712917;}', 1561710092);
INSERT INTO `ims_core_sessions` VALUES ('de246a84f8f5530b64eb4f204b7dd867', 8, '192.168.0.110', 'acid|s:1:\"6\";uniacid|i:8;token|a:1:{s:4:\"Ll63\";i:1561513505;}', 1561517105);
INSERT INTO `ims_core_sessions` VALUES ('3c8ac4d18ac84d8a7d1558e5767a90d1', 8, '192.168.0.110', 'acid|s:1:\"6\";uniacid|i:8;token|a:1:{s:4:\"F2fj\";i:1561513505;}', 1561517105);
INSERT INTO `ims_core_sessions` VALUES ('ad5dd66d05f2dc19680386fc8996fa37', 8, '192.168.0.110', 'acid|s:1:\"6\";uniacid|i:8;token|a:6:{s:4:\"q15c\";i:1561515173;s:4:\"V23N\";i:1561515189;s:4:\"ARk3\";i:1561515192;s:4:\"e0su\";i:1561515201;s:4:\"Co9Z\";i:1561515205;s:4:\"Qz6G\";i:1561515240;}', 1561518840);
INSERT INTO `ims_core_sessions` VALUES ('989f740c0399af9bf7481bed3624db30', 8, '192.168.0.110', 'acid|s:1:\"6\";uniacid|i:8;token|a:6:{s:4:\"hVhj\";i:1561542867;s:4:\"zu53\";i:1561542890;s:4:\"dDzk\";i:1561542947;s:4:\"TG5b\";i:1561543099;s:4:\"q3IW\";i:1561543130;s:4:\"yNTD\";i:1561543166;}', 1561546766);
INSERT INTO `ims_core_sessions` VALUES ('fe2fd1004440c4a5ff8ab283b9f4358c', 8, '192.168.0.110', 'acid|s:1:\"6\";uniacid|i:8;token|a:1:{s:4:\"sUAw\";i:1561529348;}', 1561532948);
INSERT INTO `ims_core_sessions` VALUES ('5d626cb78aa0e08fbd07d05ad2e2d377', 8, '192.168.0.110', 'acid|s:1:\"6\";uniacid|i:8;token|a:6:{s:4:\"e44m\";i:1561624379;s:4:\"ORki\";i:1561624381;s:4:\"cR77\";i:1561624420;s:4:\"BZmO\";i:1561624431;s:4:\"ZF5q\";i:1561624437;s:4:\"m101\";i:1561624517;}access_token_web|a:7:{s:12:\"access_token\";s:89:\"22_U9uIXuwpjJ6fSKCNbEsUFTO72xonpAzmsIMwl_SOs8NkuR0AeLrOZogZdiQy_iNOlvZscVhMKV_dHwUBuxFc8Q\";s:10:\"expires_in\";i:7200;s:13:\"refresh_token\";s:89:\"22_WdN2j-DWloOypBSDw84Xo51CT7XVZRGe9csYsKcIQ4hKJaidR9sfuoGuScX1ZmSG55Uiu1EwWuT1oxE1iCYenQ\";s:6:\"openid\";s:28:\"oqo_mw5J50OoH3PUyRgParlPubas\";s:5:\"scope\";s:15:\"snsapi_userinfo\";s:7:\"unionid\";s:28:\"oILAIwM-LI-DA46L5qx54xvLrYwU\";s:8:\"time_out\";i:1561631261;}', 1561628117);
INSERT INTO `ims_core_sessions` VALUES ('8937d879c6dd1d417c1c1063f1d83272', 8, '192.168.0.110', 'acid|s:1:\"6\";uniacid|i:8;token|a:1:{s:4:\"GXQL\";i:1561541436;}', 1561545036);
INSERT INTO `ims_core_sessions` VALUES ('9918cf69d9719a5db6555f58b382a8fb', 8, '192.168.0.110', 'acid|s:1:\"6\";uniacid|i:8;token|a:1:{s:4:\"Ia1o\";i:1561541757;}', 1561545357);
INSERT INTO `ims_core_sessions` VALUES ('3034e0fb6c62f2199ec6b0c4395af7fd', 8, '192.168.0.110', 'acid|s:1:\"6\";uniacid|i:8;token|a:1:{s:4:\"bttb\";i:1561535886;}', 1561539486);
INSERT INTO `ims_core_sessions` VALUES ('babd160c0917266d50e493d36e6044ed', 8, '192.168.0.110', 'acid|s:1:\"6\";uniacid|i:8;token|a:1:{s:4:\"ru3w\";i:1561619958;}', 1561623558);
INSERT INTO `ims_core_sessions` VALUES ('6d90c25340a271dbc33d07265afb3c99', 8, '192.168.0.110', 'acid|s:1:\"6\";uniacid|i:8;token|a:1:{s:4:\"e7ll\";i:1561543559;}', 1561547159);
INSERT INTO `ims_core_sessions` VALUES ('7f7bed2730e3f4ddb0783e68e23f4442', 8, '192.168.0.110', 'acid|s:1:\"6\";uniacid|i:8;token|a:1:{s:4:\"lG2I\";i:1561543560;}', 1561547160);
INSERT INTO `ims_core_sessions` VALUES ('17175548a785e370ab11f100805be9ae', 8, '192.168.0.110', 'acid|s:1:\"6\";uniacid|i:8;token|a:1:{s:4:\"L15l\";i:1561535981;}', 1561539581);
INSERT INTO `ims_core_sessions` VALUES ('2b87903e23d2036149d39968c444b9cc', 8, '192.168.0.110', 'acid|s:1:\"6\";uniacid|i:8;token|a:1:{s:4:\"mUbx\";i:1561536125;}', 1561539725);
INSERT INTO `ims_core_sessions` VALUES ('37ed0d2e7abb5a8637c62174353e30d3', 8, '192.168.0.110', 'acid|s:1:\"6\";uniacid|i:8;token|a:1:{s:4:\"xjgq\";i:1561536156;}', 1561539756);
INSERT INTO `ims_core_sessions` VALUES ('72253bac8cd29229992b0f792588757a', 8, '192.168.0.110', 'acid|s:1:\"6\";uniacid|i:8;token|a:1:{s:4:\"lLYz\";i:1561536290;}', 1561539890);
INSERT INTO `ims_core_sessions` VALUES ('813fc0ebea524ad1705ae158a9523dbb', 8, '192.168.0.110', 'acid|s:1:\"6\";uniacid|i:8;token|a:5:{s:4:\"z9CW\";i:1561684346;s:4:\"rH5J\";i:1561684349;s:4:\"l0Rk\";i:1561684350;s:4:\"DfVh\";i:1561684358;s:4:\"h112\";i:1561684436;}access_token_web|a:7:{s:12:\"access_token\";s:89:\"22_kwbxvlHMOn6FBGKjrdD8Pf7p98mOIRFoa4uku2M0mOjKVv4TlcfrT8pCNmEESPNMenyZz1G1dkSopL3v2XyaTg\";s:10:\"expires_in\";i:7200;s:13:\"refresh_token\";s:89:\"22_RHUxRBSNN40icp5hLCceOmDn_wIHjtRoLGqsivhNl3D4lEH9Y5PdNgQET6Eu8hZuivd8swFxBreWqMXtsngNMw\";s:6:\"openid\";s:28:\"oqo_mw5J50OoH3PUyRgParlPubas\";s:5:\"scope\";s:15:\"snsapi_userinfo\";s:7:\"unionid\";s:28:\"oILAIwM-LI-DA46L5qx54xvLrYwU\";s:8:\"time_out\";i:1561691349;}', 1561688036);
INSERT INTO `ims_core_sessions` VALUES ('632a32010259040b0f15d69381b6be0f', 8, '192.168.0.110', 'acid|s:1:\"6\";uniacid|i:8;token|a:1:{s:4:\"x385\";i:1561606275;}', 1561609875);
INSERT INTO `ims_core_sessions` VALUES ('0a0817088e0ce9e02aa4483f48134302', 8, '192.168.0.110', 'acid|s:1:\"6\";uniacid|i:8;token|a:1:{s:4:\"pZks\";i:1561617231;}', 1561620831);
INSERT INTO `ims_core_sessions` VALUES ('f1e9766c6cfaf098c306d9d8f15b5306', 8, '192.168.0.110', 'acid|s:1:\"6\";uniacid|i:8;token|a:6:{s:4:\"r29I\";i:1561707070;s:4:\"ZqZ2\";i:1561707082;s:4:\"Tv2y\";i:1561707085;s:4:\"UWQw\";i:1561707177;s:4:\"yP1p\";i:1561707235;s:4:\"CGm3\";i:1561707247;}access_token_web|a:7:{s:12:\"access_token\";s:89:\"22_5cm3NtuGyzsffZ-aR4ioRyAs32ZJL9jzhDjQKZEIrYdWR8qX8Q4N7pzFNuiUiExkRZENLlxMe5RiGA3xv91Kdw\";s:10:\"expires_in\";i:7200;s:13:\"refresh_token\";s:89:\"22_6fV35vQ8hLPKWl6MBCxtS1R6IGDWVFLmcan9g-Ckf3msxtKzW5Ip0QFZyQ0BZ4RyGbevxWxVxuA1xfnRzsTM6w\";s:6:\"openid\";s:28:\"oqo_mw5J50OoH3PUyRgParlPubas\";s:5:\"scope\";s:15:\"snsapi_userinfo\";s:7:\"unionid\";s:28:\"oILAIwM-LI-DA46L5qx54xvLrYwU\";s:8:\"time_out\";i:1561711873;}', 1561710847);
INSERT INTO `ims_core_sessions` VALUES ('96a6bbb83180734fff723c9b8b7930e6', 8, '192.168.0.110', 'acid|s:1:\"6\";uniacid|i:8;token|a:1:{s:4:\"axBt\";i:1561541802;}', 1561545402);
INSERT INTO `ims_core_sessions` VALUES ('f56fd2662185a95292c4b6a801033f68', 8, '192.168.0.110', 'acid|s:1:\"6\";uniacid|i:8;token|a:1:{s:4:\"F4kS\";i:1561541908;}', 1561545508);
INSERT INTO `ims_core_sessions` VALUES ('87a9471b893632128fcba2c0f7227884', 8, '192.168.0.110', 'acid|s:1:\"6\";uniacid|i:8;token|a:1:{s:4:\"Da4Z\";i:1561543241;}', 1561546841);
INSERT INTO `ims_core_sessions` VALUES ('5a2e1359edc32dba84f423bdfc5057e1', 8, '192.168.0.110', 'acid|s:1:\"6\";uniacid|i:8;token|a:1:{s:4:\"Y8zi\";i:1561443833;}', 1561447433);
INSERT INTO `ims_core_sessions` VALUES ('34d17d7b91aa6e265e91dc53398c87bf', 8, '192.168.0.110', 'acid|s:1:\"6\";uniacid|i:8;token|a:1:{s:4:\"c5rY\";i:1561443841;}', 1561447441);
INSERT INTO `ims_core_sessions` VALUES ('3c7ad1e08c7ec7ade86c4153645a38f6', 8, '192.168.0.110', 'acid|s:1:\"6\";uniacid|i:8;token|a:6:{s:4:\"PCz3\";i:1561447455;s:4:\"Gskn\";i:1561447485;s:4:\"z0tt\";i:1561447494;s:4:\"y4ur\";i:1561447495;s:4:\"z46T\";i:1561447517;s:4:\"YJ2S\";i:1561447518;}', 1561451118);
INSERT INTO `ims_core_sessions` VALUES ('5353e5a35dbb55130a440e6bd08c2244', 8, '192.168.0.110', 'acid|s:1:\"6\";uniacid|i:8;token|a:1:{s:4:\"Seu8\";i:1561446618;}', 1561450218);
INSERT INTO `ims_core_sessions` VALUES ('1c0b8dde90451ca50512fd934a5283d5', 8, '192.168.0.110', 'acid|s:1:\"6\";uniacid|i:8;token|a:1:{s:4:\"yz3D\";i:1561446618;}', 1561450218);
INSERT INTO `ims_core_sessions` VALUES ('254b02a3d0e08d70c5b281ac68f5c435', 8, '192.168.0.110', 'acid|s:1:\"6\";uniacid|i:8;token|a:1:{s:4:\"g90P\";i:1561446618;}', 1561450218);
INSERT INTO `ims_core_sessions` VALUES ('818952f683026653a675ea8ffa3cf4cb', 8, '192.168.0.110', 'acid|s:1:\"6\";uniacid|i:8;token|a:1:{s:4:\"xO01\";i:1561446619;}', 1561450219);
INSERT INTO `ims_core_sessions` VALUES ('1ecdde54f24fd49c82ebc9af6c82bb5c', 8, '192.168.0.110', 'acid|s:1:\"6\";uniacid|i:8;token|a:1:{s:4:\"fxx5\";i:1561446621;}', 1561450221);
INSERT INTO `ims_core_sessions` VALUES ('a833c8f9b5a27f5073de34527f2d398e', 8, '192.168.0.110', 'acid|s:1:\"6\";uniacid|i:8;token|a:1:{s:4:\"o5Ff\";i:1561446646;}', 1561450246);
INSERT INTO `ims_core_sessions` VALUES ('9ef16c8b5a003be61168a9e5b4d65724', 8, '192.168.0.110', 'acid|s:1:\"6\";uniacid|i:8;token|a:1:{s:4:\"z91i\";i:1561446646;}', 1561450246);
INSERT INTO `ims_core_sessions` VALUES ('2ab2d9e2040e62c9d6d506f8aa4e7180', 8, '192.168.0.110', 'acid|s:1:\"6\";uniacid|i:8;token|a:1:{s:4:\"i7Kk\";i:1561446646;}', 1561450246);
INSERT INTO `ims_core_sessions` VALUES ('8d2761be758e0cbd28759ddcdd63721d', 8, '192.168.0.110', 'acid|s:1:\"6\";uniacid|i:8;token|a:1:{s:4:\"w3jJ\";i:1561446647;}', 1561450247);
INSERT INTO `ims_core_sessions` VALUES ('cb62f95a23fe705ce7b4e9689f47d4cb', 8, '192.168.0.110', 'acid|s:1:\"6\";uniacid|i:8;token|a:1:{s:4:\"oW7R\";i:1561448252;}', 1561451852);
INSERT INTO `ims_core_sessions` VALUES ('5caa75c3aa55d119fb8de8c8c8ae400a', 8, '192.168.0.110', 'acid|s:1:\"6\";uniacid|i:8;token|a:1:{s:4:\"oTp5\";i:1561448252;}', 1561451852);
INSERT INTO `ims_core_sessions` VALUES ('d0f32eddcfa6d0a5e2fd20a91f718d16', 8, '192.168.0.110', 'acid|s:1:\"6\";uniacid|i:8;token|a:1:{s:4:\"Fjz0\";i:1561448252;}', 1561451852);
INSERT INTO `ims_core_sessions` VALUES ('f08b39199c91fd632b4ea8a919be6843', 8, '192.168.0.110', 'acid|s:1:\"6\";uniacid|i:8;token|a:1:{s:4:\"u5lR\";i:1561443940;}', 1561447540);
INSERT INTO `ims_core_sessions` VALUES ('0283049946bc964cec513bfb81ecc639', 8, '117.136.50.204', 'acid|s:1:\"6\";uniacid|i:8;token|a:6:{s:4:\"yUuK\";i:1561948068;s:4:\"r4mS\";i:1561948069;s:4:\"Wpsb\";i:1561948069;s:4:\"o1Ss\";i:1561948069;s:4:\"L1x9\";i:1561948070;s:4:\"YL1u\";i:1561948096;}access_token_web|a:1:{s:8:\"time_out\";i:1561947869;}', 1561951696);
INSERT INTO `ims_core_sessions` VALUES ('54ca3332491726a8a731ade970ce3e0b', 8, '192.168.0.110', 'acid|s:1:\"6\";uniacid|i:8;token|a:1:{s:4:\"N9TJ\";i:1561713114;}', 1561716714);
INSERT INTO `ims_core_sessions` VALUES ('4927f81e51342c62ec9ba9ae554c5672', 8, '192.168.0.110', 'acid|s:1:\"6\";uniacid|i:8;token|a:1:{s:4:\"X6nY\";i:1561713542;}', 1561717142);
INSERT INTO `ims_core_sessions` VALUES ('18c37beb4a396daebcbb01d6bd0ef70c', 8, '192.168.0.110', 'acid|s:1:\"6\";uniacid|i:8;token|a:1:{s:4:\"lNu0\";i:1561712401;}', 1561716001);
INSERT INTO `ims_core_sessions` VALUES ('5cae6ac1da7b16daa2c17c57ee023aa4', 8, '192.168.0.110', 'acid|s:1:\"6\";uniacid|i:8;token|a:1:{s:4:\"MYX8\";i:1561708996;}', 1561712596);
INSERT INTO `ims_core_sessions` VALUES ('99ec3e0bbbc52da95ac1fcca87978dad', 8, '192.168.0.110', 'acid|s:1:\"6\";uniacid|i:8;token|a:1:{s:4:\"G6Ns\";i:1561709152;}', 1561712752);
INSERT INTO `ims_core_sessions` VALUES ('de0f0d82bfc8941046fd7e027e6891e6', 8, '192.168.0.110', 'acid|s:1:\"6\";uniacid|i:8;token|a:1:{s:4:\"zBpf\";i:1561943917;}', 1561947517);
INSERT INTO `ims_core_sessions` VALUES ('afcb9a70d6b704eff2f516a9b586ff46', 8, '192.168.0.110', 'acid|s:1:\"6\";uniacid|i:8;token|a:1:{s:4:\"djuG\";i:1561943917;}', 1561947517);
INSERT INTO `ims_core_sessions` VALUES ('83be29a8a0935e5ab01ba3036f001fa5', 8, '192.168.0.110', 'acid|s:1:\"6\";uniacid|i:8;token|a:1:{s:4:\"XhLF\";i:1561967048;}', 1561970648);
INSERT INTO `ims_core_sessions` VALUES ('953eb3a6cf37a9d204740a936182a945', 8, '192.168.0.110', 'acid|s:1:\"6\";uniacid|i:8;token|a:1:{s:4:\"nP2D\";i:1561947535;}', 1561951135);
INSERT INTO `ims_core_sessions` VALUES ('3afea6c0ad24d7beda07d9364607ce01', 8, '192.168.0.110', 'acid|s:1:\"6\";uniacid|i:8;token|a:1:{s:4:\"mB9b\";i:1561947442;}', 1561951042);
INSERT INTO `ims_core_sessions` VALUES ('a7ee760f33539484cbb9db317b20148b', 8, '192.168.0.110', 'acid|s:1:\"6\";uniacid|i:8;token|a:1:{s:4:\"qXam\";i:1561947442;}', 1561951042);
INSERT INTO `ims_core_sessions` VALUES ('67e90aa07b62b1e960bbdea07eef3bda', 8, '192.168.0.110', 'acid|s:1:\"6\";uniacid|i:8;token|a:5:{s:4:\"dxQf\";i:1561951411;s:4:\"iJqQ\";i:1561951411;s:4:\"d6F5\";i:1561951455;s:4:\"v1RY\";i:1561951487;s:4:\"ms2B\";i:1561951493;}', 1561955093);
INSERT INTO `ims_core_sessions` VALUES ('41ba0ade846f7ac735686799e06c3e24', 8, '192.168.0.110', 'acid|s:1:\"6\";uniacid|i:8;token|a:4:{s:4:\"XjQU\";i:1561948003;s:4:\"TU6a\";i:1561948005;s:4:\"Px4u\";i:1561948006;s:4:\"o66n\";i:1561948010;}access_token_web|a:1:{s:8:\"time_out\";i:1561947805;}', 1561951610);
INSERT INTO `ims_core_sessions` VALUES ('37630b2a3de18e5d1ea0de7b0d64f8fb', 8, '192.168.0.110', 'acid|s:1:\"6\";uniacid|i:8;token|a:1:{s:4:\"PO57\";i:1561949425;}', 1561953025);
INSERT INTO `ims_core_sessions` VALUES ('4cfac44a48c9faf1e95b5bb9b58d5e54', 8, '192.168.0.110', 'acid|s:1:\"6\";uniacid|i:8;token|a:1:{s:4:\"w2jJ\";i:1561949382;}', 1561952982);
INSERT INTO `ims_core_sessions` VALUES ('9c7e45309c6720100005600b2b02b9aa', 8, '192.168.0.110', 'acid|s:1:\"6\";uniacid|i:8;token|a:1:{s:4:\"a1Xj\";i:1561948699;}', 1561952299);
INSERT INTO `ims_core_sessions` VALUES ('717ea16c1605f93e0835c21aa2371530', 8, '192.168.0.110', 'acid|s:1:\"6\";uniacid|i:8;token|a:1:{s:4:\"k0mV\";i:1561948725;}', 1561952325);
INSERT INTO `ims_core_sessions` VALUES ('e1fb676035a63487564ad37fcae7039d', 8, '192.168.0.110', 'acid|s:1:\"6\";uniacid|i:8;token|a:2:{s:4:\"tF6F\";i:1561948732;s:4:\"h8w2\";i:1561948741;}access_token_web|a:1:{s:8:\"time_out\";i:1561948532;}', 1561952341);
INSERT INTO `ims_core_sessions` VALUES ('094b95e859d644c09f4a8d84ba703695', 8, '192.168.0.110', 'acid|s:1:\"6\";uniacid|i:8;token|a:6:{s:4:\"r493\";i:1561951411;s:4:\"d77W\";i:1561951411;s:4:\"iw91\";i:1561951455;s:4:\"Qa1G\";i:1561951487;s:4:\"mq88\";i:1561951540;s:4:\"v8VF\";i:1561951541;}', 1561955141);

-- ----------------------------
-- Table structure for ims_core_settings
-- ----------------------------
DROP TABLE IF EXISTS `ims_core_settings`;
CREATE TABLE `ims_core_settings`  (
  `key` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`key`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ims_core_settings
-- ----------------------------
INSERT INTO `ims_core_settings` VALUES ('authmode', 'i:1;');
INSERT INTO `ims_core_settings` VALUES ('close', 'a:2:{s:6:\"status\";s:1:\"0\";s:6:\"reason\";s:0:\"\";}');
INSERT INTO `ims_core_settings` VALUES ('copyright', 'a:37:{s:6:\"status\";i:0;s:10:\"verifycode\";N;s:6:\"reason\";s:0:\"\";s:8:\"sitename\";s:0:\"\";s:3:\"url\";s:7:\"http://\";s:8:\"statcode\";s:0:\"\";s:10:\"footerleft\";s:0:\"\";s:11:\"footerright\";s:0:\"\";s:4:\"icon\";s:0:\"\";s:5:\"flogo\";s:0:\"\";s:14:\"background_img\";s:0:\"\";s:6:\"slides\";s:216:\"a:3:{i:0;s:58:\"https://img.alicdn.com/tps/TB1pfG4IFXXXXc6XXXXXXXXXXXX.jpg\";i:1;s:58:\"https://img.alicdn.com/tps/TB1sXGYIFXXXXc5XpXXXXXXXXXX.jpg\";i:2;s:58:\"https://img.alicdn.com/tps/TB1h9xxIFXXXXbKXXXXXXXXXXXX.jpg\";}\";s:6:\"notice\";s:0:\"\";s:5:\"blogo\";s:0:\"\";s:8:\"baidumap\";a:2:{s:3:\"lng\";s:10:\"116.403851\";s:3:\"lat\";s:9:\"39.915177\";}s:7:\"company\";s:0:\"\";s:14:\"companyprofile\";s:0:\"\";s:7:\"address\";s:0:\"\";s:6:\"person\";s:0:\"\";s:5:\"phone\";s:0:\"\";s:2:\"qq\";s:0:\"\";s:5:\"email\";s:0:\"\";s:8:\"keywords\";s:0:\"\";s:11:\"description\";s:0:\"\";s:12:\"showhomepage\";i:0;s:13:\"leftmenufixed\";i:0;s:13:\"mobile_status\";N;s:10:\"login_type\";N;s:10:\"log_status\";i:0;s:14:\"develop_status\";i:1;s:3:\"icp\";s:0:\"\";s:8:\"sms_name\";s:0:\"\";s:12:\"sms_password\";s:0:\"\";s:8:\"sms_sign\";s:0:\"\";s:4:\"bind\";N;s:12:\"welcome_link\";N;s:10:\"oauth_bind\";N;}');
INSERT INTO `ims_core_settings` VALUES ('platform', 'a:5:{s:5:\"token\";s:32:\"MZ7X1c79Ex4drjRdycK11x2JN2j1nC4o\";s:14:\"encodingaeskey\";s:43:\"VKyl2SRuzi9K4QaVyAydKSR9FArSius4sSJQsyqk4rP\";s:9:\"appsecret\";s:0:\"\";s:5:\"appid\";s:0:\"\";s:9:\"authstate\";i:1;}');
INSERT INTO `ims_core_settings` VALUES ('register', 'a:4:{s:4:\"open\";i:1;s:6:\"verify\";i:0;s:4:\"code\";i:1;s:7:\"groupid\";i:1;}');
INSERT INTO `ims_core_settings` VALUES ('module_receive_ban', 'a:0:{}');
INSERT INTO `ims_core_settings` VALUES ('basic', 'a:1:{s:8:\"template\";s:5:\"black\";}');

-- ----------------------------
-- Table structure for ims_coupon_location
-- ----------------------------
DROP TABLE IF EXISTS `ims_coupon_location`;
CREATE TABLE `ims_coupon_location`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `acid` int(10) UNSIGNED NOT NULL,
  `sid` int(10) UNSIGNED NOT NULL,
  `location_id` int(10) UNSIGNED NOT NULL,
  `business_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `branch_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `category` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `province` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `city` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `district` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `address` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `longitude` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `latitude` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `telephone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `photo_list` varchar(10000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `avg_price` int(10) UNSIGNED NOT NULL,
  `open_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `recommend` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `special` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `introduction` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `offset_type` tinyint(3) UNSIGNED NOT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL,
  `message` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`, `acid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_cover_reply
-- ----------------------------
DROP TABLE IF EXISTS `ims_cover_reply`;
CREATE TABLE `ims_cover_reply`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `multiid` int(10) UNSIGNED NOT NULL,
  `rid` int(10) UNSIGNED NOT NULL,
  `module` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `do` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `thumb` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `rid`(`rid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_custom_reply
-- ----------------------------
DROP TABLE IF EXISTS `ims_custom_reply`;
CREATE TABLE `ims_custom_reply`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `rid` int(10) UNSIGNED NOT NULL,
  `start1` int(10) NOT NULL,
  `end1` int(10) NOT NULL,
  `start2` int(10) NOT NULL,
  `end2` int(10) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `rid`(`rid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for ims_deamx_food_address
-- ----------------------------
DROP TABLE IF EXISTS `ims_deamx_food_address`;
CREATE TABLE `ims_deamx_food_address`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT NULL,
  `openid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `member_id` int(11) NULL DEFAULT NULL,
  `realname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sex` tinyint(3) NULL DEFAULT NULL,
  `telphone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address_road` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `latitude` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `longitude` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tag` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_default` tinyint(3) NULL DEFAULT NULL,
  `createtime` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_deamx_food_adv
-- ----------------------------
DROP TABLE IF EXISTS `ims_deamx_food_adv`;
CREATE TABLE `ims_deamx_food_adv`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) NULL DEFAULT NULL,
  `sortid` int(10) NULL DEFAULT NULL,
  `adv_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `adv_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `adv_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `adv_isshow` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_deamx_food_class
-- ----------------------------
DROP TABLE IF EXISTS `ims_deamx_food_class`;
CREATE TABLE `ims_deamx_food_class`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) NULL DEFAULT NULL,
  `store_id` int(10) NULL DEFAULT NULL,
  `sortid` int(10) NULL DEFAULT NULL,
  `classname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `enabled` tinyint(1) NULL DEFAULT NULL,
  `createtime` int(10) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_deamx_food_coupon
-- ----------------------------
DROP TABLE IF EXISTS `ims_deamx_food_coupon`;
CREATE TABLE `ims_deamx_food_coupon`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) NULL DEFAULT NULL,
  `coupon_uniacid` int(10) NULL DEFAULT NULL,
  `card_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` tinyint(3) NULL DEFAULT NULL,
  `logo_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `code_type` tinyint(3) NULL DEFAULT NULL,
  `brand_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sub_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `color` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `notice` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `quantity` int(10) NULL DEFAULT NULL,
  `use_custom_code` tinyint(3) NULL DEFAULT NULL,
  `bind_openid` tinyint(3) NULL DEFAULT NULL,
  `can_share` tinyint(3) NULL DEFAULT NULL,
  `can_give_friend` tinyint(3) NULL DEFAULT NULL,
  `get_limit` int(10) NULL DEFAULT NULL,
  `service_phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` tinyint(3) NULL DEFAULT NULL,
  `is_display` int(10) NULL DEFAULT NULL,
  `is_selfconsume` int(10) NULL DEFAULT NULL,
  `promotion_url_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `promotion_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `promotion_url_sub_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `source` int(10) NULL DEFAULT NULL,
  `date_info` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `extra` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `dosage` int(10) UNSIGNED NULL DEFAULT 0,
  `least_cost` int(11) NULL DEFAULT 0,
  `reduce_cost` int(11) NULL DEFAULT 0,
  `can_use_with_other_discount` tinyint(3) NOT NULL DEFAULT 1,
  `createtime` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_deamx_food_coupon_record
-- ----------------------------
DROP TABLE IF EXISTS `ims_deamx_food_coupon_record`;
CREATE TABLE `ims_deamx_food_coupon_record`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `acid` int(10) UNSIGNED NOT NULL,
  `card_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `openid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `unionid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `friend_openid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `givebyfriend` tinyint(3) UNSIGNED NOT NULL,
  `code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `hash` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `addtime` int(10) UNSIGNED NOT NULL,
  `usetime` int(10) UNSIGNED NOT NULL,
  `order_id` int(10) NULL DEFAULT 0,
  `starttime` int(11) NULL DEFAULT NULL,
  `endtime` int(11) NULL DEFAULT NULL,
  `status` tinyint(3) NOT NULL,
  `clerk_name` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `clerk_id` int(10) UNSIGNED NOT NULL,
  `store_id` int(10) UNSIGNED NOT NULL,
  `clerk_type` tinyint(3) UNSIGNED NOT NULL,
  `couponid` int(10) UNSIGNED NOT NULL,
  `uid` int(10) UNSIGNED NOT NULL,
  `grantmodule` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `rule_id` int(10) NULL DEFAULT 0,
  `source_orderid` int(10) NULL DEFAULT 0,
  `granttype` tinyint(4) NOT NULL COMMENT '获取卡券的方式：1 兑换，2 扫码，3派发',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`, `acid`) USING BTREE,
  INDEX `card_id`(`card_id`) USING BTREE,
  INDEX `hash`(`hash`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_deamx_food_coupon_rules
-- ----------------------------
DROP TABLE IF EXISTS `ims_deamx_food_coupon_rules`;
CREATE TABLE `ims_deamx_food_coupon_rules`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` tinyint(3) NULL DEFAULT NULL,
  `starttime` int(11) NULL DEFAULT NULL,
  `endtime` int(11) NULL DEFAULT NULL,
  `reduce_cost` decimal(10, 2) NULL DEFAULT NULL,
  `repeat_send` tinyint(3) NULL DEFAULT NULL,
  `limit_send` int(11) NULL DEFAULT NULL,
  `coupon_info` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `createtime` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_deamx_food_deliver_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_deamx_food_deliver_log`;
CREATE TABLE `ims_deamx_food_deliver_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` int(10) NULL DEFAULT NULL,
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `updatetime` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `order_id`(`order_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_deamx_food_desknumber
-- ----------------------------
DROP TABLE IF EXISTS `ims_deamx_food_desknumber`;
CREATE TABLE `ims_deamx_food_desknumber`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT NULL,
  `store_id` int(11) NULL DEFAULT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `wxacode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_deamx_food_goods
-- ----------------------------
DROP TABLE IF EXISTS `ims_deamx_food_goods`;
CREATE TABLE `ims_deamx_food_goods`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) NULL DEFAULT NULL,
  `store_id` int(10) NULL DEFAULT NULL,
  `displayorder` int(10) NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `intro` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `class_id` int(10) NULL DEFAULT NULL,
  `price` decimal(10, 2) NULL DEFAULT NULL,
  `is_pbox` tinyint(3) NULL DEFAULT 0,
  `pbox_price` decimal(10, 2) NULL DEFAULT NULL,
  `unit` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `hasoption` tinyint(1) NULL DEFAULT 0,
  `status` tinyint(3) NULL DEFAULT 0,
  `createtime` int(10) NULL DEFAULT NULL,
  `realsales` int(10) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_deamx_food_goods_option
-- ----------------------------
DROP TABLE IF EXISTS `ims_deamx_food_goods_option`;
CREATE TABLE `ims_deamx_food_goods_option`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `store_id` int(11) NULL DEFAULT 0,
  `goodsid` int(10) NULL DEFAULT 0,
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `marketprice` decimal(10, 2) NULL DEFAULT 0.00,
  `stock` int(11) NULL DEFAULT 0,
  `displayorder` int(11) NULL DEFAULT 0,
  `specs` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `realsales` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_goodsid`(`goodsid`) USING BTREE,
  INDEX `idx_displayorder`(`displayorder`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_deamx_food_goods_spec
-- ----------------------------
DROP TABLE IF EXISTS `ims_deamx_food_goods_spec`;
CREATE TABLE `ims_deamx_food_goods_spec`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `store_id` int(11) NULL DEFAULT 0,
  `goodsid` int(11) NULL DEFAULT 0,
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `description` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `displaytype` tinyint(3) NULL DEFAULT 0,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `displayorder` int(11) NULL DEFAULT 0,
  `propId` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_goodsid`(`goodsid`) USING BTREE,
  INDEX `idx_displayorder`(`displayorder`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_deamx_food_goods_spec_item
-- ----------------------------
DROP TABLE IF EXISTS `ims_deamx_food_goods_spec_item`;
CREATE TABLE `ims_deamx_food_goods_spec_item`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `store_id` int(11) NULL DEFAULT 0,
  `specid` int(11) NULL DEFAULT 0,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `show` int(11) NULL DEFAULT 0,
  `displayorder` int(11) NULL DEFAULT 0,
  `valueId` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `virtual` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_specid`(`specid`) USING BTREE,
  INDEX `idx_show`(`show`) USING BTREE,
  INDEX `idx_displayorder`(`displayorder`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_deamx_food_order
-- ----------------------------
DROP TABLE IF EXISTS `ims_deamx_food_order`;
CREATE TABLE `ims_deamx_food_order`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT NULL,
  `ordersn` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `store_id` int(11) NULL DEFAULT NULL,
  `openid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `member_id` int(11) NULL DEFAULT NULL,
  `order_type` tinyint(3) NULL DEFAULT 1,
  `desk_id` int(11) NULL DEFAULT 0,
  `goods_list` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `count` int(11) NULL DEFAULT NULL,
  `pbox_fee` decimal(10, 2) NULL DEFAULT 0.00,
  `send_fee` decimal(10, 2) NULL DEFAULT 0.00,
  `price` decimal(10, 2) NULL DEFAULT NULL,
  `enoughdeduct` decimal(10, 2) NULL DEFAULT 0.00,
  `use_coupon` int(10) NULL DEFAULT 0,
  `coupon_type` tinyint(3) NOT NULL DEFAULT 0 COMMENT '0为普通卡券，1为no_cash',
  `coupon_price` decimal(10, 2) NULL DEFAULT 0.00,
  `pay_price` decimal(10, 2) NULL DEFAULT NULL,
  `status` tinyint(3) NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `paytime` int(11) NULL DEFAULT 0,
  `prepay_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `message_count` int(10) NULL DEFAULT 0,
  `order_number` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createtime` int(11) NULL DEFAULT NULL,
  `receivetime` int(11) NULL DEFAULT NULL,
  `is_prompt` tinyint(3) NULL DEFAULT 1,
  `address_info` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `need_send_coupon` tinyint(3) NULL DEFAULT 0,
  `is_send_coupon` tinyint(3) NULL DEFAULT 0,
  `deliver_type` tinyint(3) NULL DEFAULT 0,
  `deliver_dada_failreason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `refund_fee` decimal(10, 2) NULL DEFAULT 0.00,
  `print_count` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_deamx_food_printer
-- ----------------------------
DROP TABLE IF EXISTS `ims_deamx_food_printer`;
CREATE TABLE `ims_deamx_food_printer`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) NULL DEFAULT NULL,
  `store_id` int(11) NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` tinyint(3) NULL DEFAULT NULL,
  `print_type` tinyint(3) NULL DEFAULT 0,
  `print_data` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `print_class` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createtime` int(11) NULL DEFAULT NULL,
  `merchid` int(10) NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_deamx_food_refundlog
-- ----------------------------
DROP TABLE IF EXISTS `ims_deamx_food_refundlog`;
CREATE TABLE `ims_deamx_food_refundlog`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT NULL,
  `refund_uniontid` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `reason` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `uniontid` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fee` decimal(10, 2) NULL DEFAULT NULL,
  `status` int(2) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_deamx_food_settings
-- ----------------------------
DROP TABLE IF EXISTS `ims_deamx_food_settings`;
CREATE TABLE `ims_deamx_food_settings`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` tinyint(1) NULL DEFAULT NULL,
  `bg_color` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fg_color` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `share_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `area_limit` int(10) NULL DEFAULT 0,
  `tencent_map_apikey` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `single_storeid` int(10) NULL DEFAULT NULL,
  `store_blogo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `copyright` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `template_status` tinyint(3) NULL DEFAULT 0,
  `template_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `takeout_template_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sms_status` tinyint(3) NULL DEFAULT 0,
  `sms_type` tinyint(3) NULL DEFAULT 1,
  `sms_params` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `login_logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `login_bg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `about_us` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `store_count` int(11) NULL DEFAULT 0,
  `wxapp_scan` tinyint(3) NULL DEFAULT 1,
  `wxapp_scan_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '堂食',
  `wxapp_scan_color` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '#ffa1a1',
  `wxapp_scan_intro` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '点我扫码进入',
  `wxapp_scan_logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `wxapp_takeout` tinyint(3) NULL DEFAULT 1,
  `wxapp_takeout_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '外卖',
  `wxapp_takeout_color` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '#faa040',
  `wxapp_takeout_intro` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '点餐快速配送',
  `wxapp_takeout_logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `wxapp_getself` tinyint(3) NULL DEFAULT 1,
  `wxapp_getself_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '自取',
  `wxapp_getself_color` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '#76bdef',
  `wxapp_getself_intro` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '点我开始订餐',
  `wxapp_getself_logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `coupon_uniacid` int(10) NULL DEFAULT NULL,
  `deliver_dada_status` tinyint(3) NULL DEFAULT 0,
  `deliver_dada_app_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `deliver_dada_app_secret` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `deliver_dada_shopid` int(10) NULL DEFAULT NULL,
  `bell_settings` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_deamx_food_store
-- ----------------------------
DROP TABLE IF EXISTS `ims_deamx_food_store`;
CREATE TABLE `ims_deamx_food_store`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `province` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `city` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `district` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `longitude` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `latitude` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` tinyint(3) NULL DEFAULT 1,
  `is_getself` tinyint(3) NULL DEFAULT 1,
  `is_takeout` tinyint(3) NULL DEFAULT 1,
  `close_reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `starttime` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `endtime` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bg_color` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fg_color` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `imgs` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `operator` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `notice_tel` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark_text` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `auto_order` tinyint(3) NULL DEFAULT 1,
  `wxacode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `start_price` decimal(10, 2) NULL DEFAULT NULL,
  `send_limit` decimal(10, 2) NULL DEFAULT NULL,
  `send_fee` decimal(10, 2) NULL DEFAULT NULL,
  `deliver_type` tinyint(3) NULL DEFAULT 0,
  `deliver_dada_shopno` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `deliver_dada_citycode` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `enoughmoney` decimal(10, 2) NULL DEFAULT 0.00,
  `enoughdeduct` decimal(10, 2) NULL DEFAULT 0.00,
  `createtime` int(10) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_deamx_food_store_clerk
-- ----------------------------
DROP TABLE IF EXISTS `ims_deamx_food_store_clerk`;
CREATE TABLE `ims_deamx_food_store_clerk`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT NULL,
  `store_id` int(11) NULL DEFAULT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `realname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `telphone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` tinyint(3) NULL DEFAULT 1,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `permission` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `lastvisit` int(11) NULL DEFAULT NULL,
  `lastip` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_fa_jz_goods_del
-- ----------------------------
DROP TABLE IF EXISTS `ims_fa_jz_goods_del`;
CREATE TABLE `ims_fa_jz_goods_del`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_name` char(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `goods_content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '商品内容',
  `activity_content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '活动详情',
  `start_time` int(11) NULL DEFAULT NULL COMMENT '开始时间',
  `end_time` int(11) NULL DEFAULT NULL COMMENT '结束时间',
  `back_musicfile` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '后台音乐',
  `images` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '多张图片',
  `switch` tinyint(1) NULL DEFAULT 0 COMMENT '是否开启',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_fa_jz_shopping_category
-- ----------------------------
DROP TABLE IF EXISTS `ims_fa_jz_shopping_category`;
CREATE TABLE `ims_fa_jz_shopping_category`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `weid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '所属帐号',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类名称',
  `thumb` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类图片',
  `parentid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '上级分类ID,0为第一级',
  `isrecommand` int(10) NULL DEFAULT 0,
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类介绍',
  `displayorder` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序',
  `enabled` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '是否开启',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ims_fa_jz_shopping_category
-- ----------------------------
INSERT INTO `ims_fa_jz_shopping_category` VALUES (3, 8, '分类3', 'images/8/2019/05/HzJ89OVo5vU5uJpNTgNPVM78Jt9qON.jpg', 0, 0, '这个是分类3的描述这个是分类3的描述这个是分类3的描述这个是分类3的描述这个是分类3的描述这个是分类3的描述这个是分类3的描述这个是分类3的描述这个是分类3的描述这个是分类3的描述这个是分类3的描述这个是分类3的描述这个是分类3的描述这个是分类3的描述这个是分类3的描述这个是分类3的描述这个是分类3的描述这个是分类3的描述这个是分类3的描述这个是分类3的描述这个是分类3的描述这个是分类3的描述这个是分类3的描述这个是分类3的描述', 0, 0);
INSERT INTO `ims_fa_jz_shopping_category` VALUES (2, 8, '分类2', 'images/8/2019/06/Ie0IX9WFnTLOk99ezfxNKtozv9e0Kf.jpg', 0, 0, '分类2分类2分类2分类2分类2', 1, 0);

-- ----------------------------
-- Table structure for ims_fa_jz_shopping_goods
-- ----------------------------
DROP TABLE IF EXISTS `ims_fa_jz_shopping_goods`;
CREATE TABLE `ims_fa_jz_shopping_goods`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `weid` int(10) UNSIGNED NOT NULL,
  `pcate` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `ccate` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `type` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '1为实体，2为虚拟',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `displayorder` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `thumb` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `unit` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `description` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `goodssn` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `productsn` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `marketprice` decimal(10, 2) NOT NULL DEFAULT 0.00,
  `productprice` decimal(10, 2) NOT NULL DEFAULT 0.00,
  `costprice` decimal(10, 2) NOT NULL DEFAULT 0.00,
  `originalprice` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '原价',
  `total` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `totalcnf` int(11) NULL DEFAULT 0 COMMENT '0 拍下减库存 1 付款减库存 2 永久不减',
  `sales` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `spec` varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `createtime` int(10) UNSIGNED NOT NULL,
  `weight` decimal(10, 2) NOT NULL DEFAULT 0.00,
  `credit` decimal(10, 2) NOT NULL DEFAULT 0.00,
  `maxbuy` int(11) NULL DEFAULT 0,
  `usermaxbuy` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户最多购买数量',
  `hasoption` int(11) NULL DEFAULT 0,
  `dispatch` int(11) NULL DEFAULT 0,
  `thumb_url` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `isnew` int(11) NULL DEFAULT 0,
  `ishot` int(11) NULL DEFAULT 0,
  `isdiscount` int(11) NULL DEFAULT 0,
  `isrecommand` int(11) NULL DEFAULT 0,
  `istime` int(11) NULL DEFAULT 0,
  `timestart` int(11) NULL DEFAULT 0,
  `timeend` int(11) NULL DEFAULT 0,
  `viewcount` int(11) NULL DEFAULT 0,
  `deleted` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_fa_jz_user
-- ----------------------------
DROP TABLE IF EXISTS `ims_fa_jz_user`;
CREATE TABLE `ims_fa_jz_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `open_id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户open_id',
  `goods_id` int(11) NULL DEFAULT NULL COMMENT '商品id',
  `zhuanfa_num` int(11) NULL DEFAULT NULL COMMENT '转发数量',
  `dianzan_num` int(11) NULL DEFAULT NULL COMMENT '点赞数量',
  `browse_num` int(11) NULL DEFAULT NULL COMMENT '浏览数量',
  `share_url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分享url',
  `user_json` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户信息',
  `state` enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '状态:0=暂停,1=正常',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 259 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '点赞表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ims_fa_jz_user
-- ----------------------------
INSERT INTO `ims_fa_jz_user` VALUES (6, '999999999999999999', 55, 66, 99, 0, '', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (7, '8888', 666, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (8, '5858', 55, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (9, '8888', 666, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (10, '5858', 55, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (11, '8888', 666, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (12, '5858', 55, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (13, '8888', 666, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (14, '5858', 55, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (15, '8888', 666, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (16, '5858', 55, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (17, '8888', 666, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (18, '5858', 55, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (19, '8888', 666, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (20, '5858', 55, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (21, '8888', 666, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (22, '5858', 55, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (23, '8888', 666, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (24, '5858', 55, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (25, '8888', 666, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (26, '5858', 55, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (27, '8888', 666, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (28, '5858', 55, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (29, '8888', 666, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (30, '5858', 55, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (31, '8888', 666, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (32, '5858', 55, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (33, '8888', 666, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (34, '5858', 55, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (35, '8888', 666, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (36, '5858', 55, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (37, '8888', 666, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (38, '5858', 55, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (39, '8888', 666, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (40, '5858', 55, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (41, '8888', 666, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (42, '5858', 55, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (43, '8888', 666, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (44, '5858', 55, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (45, '8888', 666, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (46, '5858', 55, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (47, '8888', 666, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (48, '5858', 55, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (49, '8888', 666, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (50, '5858', 55, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (51, '8888', 666, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (52, '5858', 55, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (53, '8888', 666, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (54, '5858', 55, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (55, '8888', 666, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (56, '5858', 55, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (57, '8888', 666, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (58, '5858', 55, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (59, '8888', 666, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (60, '5858', 55, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (61, '8888', 666, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (62, '5858', 55, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (63, '8888', 666, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (64, '5858', 55, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (65, '8888', 666, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (66, '5858', 55, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (67, '8888', 666, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (68, '5858', 55, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (69, '8888', 666, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (70, '5858', 55, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (71, '8888', 666, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (72, '5858', 55, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (73, '8888', 666, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (74, '5858', 55, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (75, '8888', 666, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (76, '5858', 55, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (77, '8888', 666, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (78, '5858', 55, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (79, '8888', 666, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (80, '5858', 55, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (81, '8888', 666, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (82, '5858', 55, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (83, '8888', 666, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (84, '5858', 55, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (85, '8888', 666, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (86, '5858', 55, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (87, '8888', 666, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (88, '5858', 55, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (89, '8888', 666, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (90, '5858', 55, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (91, '8888', 666, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (92, '5858', 55, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (93, '8888', 666, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (94, '5858', 55, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (95, '8888', 666, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (96, '5858', 55, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (97, '8888', 666, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (98, '5858', 55, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (99, '8888', 666, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (100, '5858', 55, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (101, '8888', 666, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (102, '5858', 55, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (103, '8888', 666, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (104, '5858', 55, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (105, '8888', 666, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (106, '5858', 55, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (107, '8888', 666, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (108, '5858', 55, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (109, '8888', 666, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (110, '5858', 55, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (111, '8888', 666, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (112, '5858', 55, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (113, '8888', 666, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (114, '5858', 55, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (115, '8888', 666, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (116, '5858', 55, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (117, '8888', 666, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (118, '5858', 55, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (119, '8888', 666, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (120, '5858', 55, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (121, '8888', 666, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (122, '5858', 55, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (123, '8888', 666, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (124, '5858', 55, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (125, '8888', 666, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (126, '5858', 55, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (127, '8888', 666, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (128, '5858', 55, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (129, '8888', 666, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (130, '5858', 55, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (131, '8888', 666, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (132, '5858', 55, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (133, '8888', 666, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (134, '5858', 55, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (135, '8888', 666, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (136, '5858', 55, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (137, '8888', 666, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (138, '5858', 55, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (139, '8888', 666, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (140, '5858', 55, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (141, '8888', 666, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (142, '5858', 55, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (143, '8888', 666, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (144, '5858', 55, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (145, '8888', 666, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (146, '5858', 55, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (147, '8888', 666, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (148, '5858', 55, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (149, '8888', 666, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (150, '5858', 55, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (151, '8888', 666, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (152, '5858', 55, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (153, '8888', 666, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (154, '5858', 55, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (155, '8888', 666, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (156, '5858', 55, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (157, '8888', 666, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (158, '5858', 55, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (159, '8888', 666, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (160, '5858', 55, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (161, '8888', 666, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (162, '5858', 55, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (163, '8888', 666, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (164, '5858', 55, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (165, '8888', 666, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (166, '5858', 55, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (167, '8888', 666, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (168, '5858', 55, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (169, '8888', 666, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (170, '5858', 55, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (171, '8888', 666, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (172, '5858', 55, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (173, '8888', 666, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (174, '5858', 55, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (175, '8888', 666, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (176, '5858', 55, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (177, '8888', 666, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (178, '5858', 55, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (179, '8888', 666, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (180, '5858', 55, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (181, '8888', 666, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (182, '5858', 55, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (183, '8888', 666, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (184, '5858', 55, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (185, '8888', 666, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (186, '5858', 55, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (187, '8888', 666, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (188, '5858', 55, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (189, '8888', 666, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (190, '5858', 55, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (191, '8888', 666, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (192, '5858', 55, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (193, '8888', 666, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (194, '5858', 55, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (195, '8888', 666, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (196, '5858', 55, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (197, '8888', 666, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (198, '5858', 55, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (199, '8888', 666, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (200, '5858', 55, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (201, '8888', 666, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (202, '5858', 55, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (203, '8888', 666, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (204, '5858', 55, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (205, '8888', 666, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (206, '5858', 55, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (207, '8888', 666, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (208, '5858', 55, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (209, '8888', 666, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (210, '5858', 55, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (211, '8888', 666, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (212, '5858', 55, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (213, '8888', 666, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (214, '5858', 55, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (215, '8888', 666, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (216, '5858', 55, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (217, '8888', 666, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (218, '5858', 55, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (219, '8888', 666, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (220, '5858', 55, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (221, '8888', 666, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (222, '5858', 55, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (223, '8888', 666, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (224, '5858', 55, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (225, '8888', 666, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (226, '5858', 55, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (227, '8888', 666, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (228, '5858', 55, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (229, '8888', 666, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (230, '5858', 55, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (231, '8888', 666, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (232, '5858', 55, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (233, '8888', 666, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (234, '5858', 55, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (235, '8888', 666, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (236, '5858', 55, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (237, '8888', 666, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (238, '5858', 55, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (239, '8888', 666, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (240, '5858', 55, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (241, '8888', 666, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (242, '5858', 55, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (243, '8888', 666, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (244, '5858', 55, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (245, '8888', 666, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (246, '5858', 55, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (247, '8888', 666, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (248, '5858', 55, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (249, '8888', 666, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (250, '5858', 55, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (251, '8888', 666, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (252, '5858', 55, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (253, '8888', 666, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (254, '5858', 55, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (255, '8888', 666, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (256, '5858', 55, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (257, '8888', 666, 66, 99, 665, 'http://bac.com', '{}', '1');
INSERT INTO `ims_fa_jz_user` VALUES (258, '5858', 55, 66, 99, 665, 'http://bac.com', '{}', '1');

-- ----------------------------
-- Table structure for ims_images_reply
-- ----------------------------
DROP TABLE IF EXISTS `ims_images_reply`;
CREATE TABLE `ims_images_reply`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `rid` int(10) UNSIGNED NOT NULL,
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mediaid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `createtime` int(10) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `rid`(`rid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_job
-- ----------------------------
DROP TABLE IF EXISTS `ims_job`;
CREATE TABLE `ims_job`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(4) NOT NULL,
  `uniacid` int(11) NOT NULL,
  `payload` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` tinyint(3) NOT NULL,
  `title` varchar(22) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `handled` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `createtime` int(11) NOT NULL,
  `updatetime` int(11) NOT NULL,
  `endtime` int(11) NOT NULL,
  `uid` int(11) NULL DEFAULT NULL,
  `isdeleted` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_mc_cash_record
-- ----------------------------
DROP TABLE IF EXISTS `ims_mc_cash_record`;
CREATE TABLE `ims_mc_cash_record`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `uid` int(10) UNSIGNED NOT NULL,
  `clerk_id` int(10) UNSIGNED NOT NULL,
  `store_id` int(10) UNSIGNED NOT NULL,
  `clerk_type` tinyint(3) UNSIGNED NOT NULL,
  `fee` decimal(10, 2) UNSIGNED NOT NULL,
  `final_fee` decimal(10, 2) UNSIGNED NOT NULL,
  `credit1` int(10) UNSIGNED NOT NULL,
  `credit1_fee` decimal(10, 2) UNSIGNED NOT NULL,
  `credit2` decimal(10, 2) UNSIGNED NOT NULL,
  `cash` decimal(10, 2) UNSIGNED NOT NULL,
  `return_cash` decimal(10, 2) UNSIGNED NOT NULL,
  `final_cash` decimal(10, 2) UNSIGNED NOT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `createtime` int(10) UNSIGNED NOT NULL,
  `trade_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_mc_chats_record
-- ----------------------------
DROP TABLE IF EXISTS `ims_mc_chats_record`;
CREATE TABLE `ims_mc_chats_record`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `acid` int(10) UNSIGNED NOT NULL,
  `flag` tinyint(3) UNSIGNED NOT NULL,
  `openid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `msgtype` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` varchar(10000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `createtime` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`, `acid`) USING BTREE,
  INDEX `openid`(`openid`) USING BTREE,
  INDEX `createtime`(`createtime`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_mc_credits_recharge
-- ----------------------------
DROP TABLE IF EXISTS `ims_mc_credits_recharge`;
CREATE TABLE `ims_mc_credits_recharge`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `uid` int(10) UNSIGNED NOT NULL,
  `openid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tid` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `transid` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `fee` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tag` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `createtime` int(10) UNSIGNED NOT NULL,
  `backtype` tinyint(3) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid_uid`(`uniacid`, `uid`) USING BTREE,
  INDEX `idx_tid`(`tid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_mc_credits_record
-- ----------------------------
DROP TABLE IF EXISTS `ims_mc_credits_record`;
CREATE TABLE `ims_mc_credits_record`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(10) UNSIGNED NOT NULL,
  `uniacid` int(11) NOT NULL,
  `credittype` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `num` decimal(10, 2) NOT NULL,
  `operator` int(10) UNSIGNED NOT NULL,
  `module` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `clerk_id` int(10) UNSIGNED NOT NULL,
  `store_id` int(10) UNSIGNED NOT NULL,
  `clerk_type` tinyint(3) UNSIGNED NOT NULL,
  `createtime` int(10) UNSIGNED NOT NULL,
  `remark` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `real_uniacid` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_mc_fans_groups
-- ----------------------------
DROP TABLE IF EXISTS `ims_mc_fans_groups`;
CREATE TABLE `ims_mc_fans_groups`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `acid` int(10) UNSIGNED NOT NULL,
  `groups` varchar(10000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_mc_fans_tag_mapping
-- ----------------------------
DROP TABLE IF EXISTS `ims_mc_fans_tag_mapping`;
CREATE TABLE `ims_mc_fans_tag_mapping`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `fanid` int(11) UNSIGNED NOT NULL,
  `tagid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `mapping`(`fanid`, `tagid`) USING BTREE,
  INDEX `fanid_index`(`fanid`) USING BTREE,
  INDEX `tagid_index`(`tagid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_mc_groups
-- ----------------------------
DROP TABLE IF EXISTS `ims_mc_groups`;
CREATE TABLE `ims_mc_groups`  (
  `groupid` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `title` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `credit` int(10) UNSIGNED NOT NULL,
  `isdefault` tinyint(4) NOT NULL,
  PRIMARY KEY (`groupid`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ims_mc_groups
-- ----------------------------
INSERT INTO `ims_mc_groups` VALUES (2, 8, '默认会员组', 0, 1);

-- ----------------------------
-- Table structure for ims_mc_handsel
-- ----------------------------
DROP TABLE IF EXISTS `ims_mc_handsel`;
CREATE TABLE `ims_mc_handsel`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) NOT NULL,
  `touid` int(10) UNSIGNED NOT NULL,
  `fromuid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `module` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sign` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `action` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `credit_value` int(10) UNSIGNED NOT NULL,
  `createtime` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid`(`touid`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_mc_mapping_fans
-- ----------------------------
DROP TABLE IF EXISTS `ims_mc_mapping_fans`;
CREATE TABLE `ims_mc_mapping_fans`  (
  `fanid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `acid` int(10) UNSIGNED NOT NULL,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `uid` int(10) UNSIGNED NOT NULL,
  `openid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `nickname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `groupid` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `salt` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `follow` tinyint(1) UNSIGNED NOT NULL,
  `followtime` int(10) UNSIGNED NOT NULL,
  `unfollowtime` int(10) UNSIGNED NOT NULL,
  `tag` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `updatetime` int(10) UNSIGNED NULL DEFAULT NULL,
  `unionid` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`fanid`) USING BTREE,
  UNIQUE INDEX `openid_2`(`openid`) USING BTREE,
  INDEX `acid`(`acid`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `nickname`(`nickname`) USING BTREE,
  INDEX `updatetime`(`updatetime`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `openid`(`openid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_mc_mapping_ucenter
-- ----------------------------
DROP TABLE IF EXISTS `ims_mc_mapping_ucenter`;
CREATE TABLE `ims_mc_mapping_ucenter`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `uid` int(10) UNSIGNED NOT NULL,
  `centeruid` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for ims_mc_mass_record
-- ----------------------------
DROP TABLE IF EXISTS `ims_mc_mass_record`;
CREATE TABLE `ims_mc_mass_record`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `acid` int(10) UNSIGNED NOT NULL,
  `groupname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `fansnum` int(10) UNSIGNED NOT NULL,
  `msgtype` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` varchar(10000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `group` int(10) NOT NULL,
  `attach_id` int(10) UNSIGNED NOT NULL,
  `media_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` tinyint(3) UNSIGNED NOT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL,
  `cron_id` int(10) UNSIGNED NOT NULL,
  `sendtime` int(10) UNSIGNED NOT NULL,
  `finalsendtime` int(10) UNSIGNED NOT NULL,
  `createtime` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`, `acid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_mc_member_address
-- ----------------------------
DROP TABLE IF EXISTS `ims_mc_member_address`;
CREATE TABLE `ims_mc_member_address`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `uid` int(50) UNSIGNED NOT NULL,
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mobile` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `zipcode` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `province` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `city` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `district` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `address` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `isdefault` tinyint(1) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uinacid`(`uniacid`) USING BTREE,
  INDEX `idx_uid`(`uid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_mc_member_fields
-- ----------------------------
DROP TABLE IF EXISTS `ims_mc_member_fields`;
CREATE TABLE `ims_mc_member_fields`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) NOT NULL,
  `fieldid` int(10) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `available` tinyint(1) NOT NULL,
  `displayorder` smallint(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_fieldid`(`fieldid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 37 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ims_mc_member_fields
-- ----------------------------
INSERT INTO `ims_mc_member_fields` VALUES (1, 8, 1, '真实姓名', 1, 0);
INSERT INTO `ims_mc_member_fields` VALUES (2, 8, 2, '昵称', 1, 1);
INSERT INTO `ims_mc_member_fields` VALUES (3, 8, 3, '头像', 1, 1);
INSERT INTO `ims_mc_member_fields` VALUES (4, 8, 4, 'QQ号', 1, 0);
INSERT INTO `ims_mc_member_fields` VALUES (5, 8, 5, '手机号码', 1, 0);
INSERT INTO `ims_mc_member_fields` VALUES (6, 8, 6, 'VIP级别', 1, 0);
INSERT INTO `ims_mc_member_fields` VALUES (7, 8, 7, '性别', 1, 0);
INSERT INTO `ims_mc_member_fields` VALUES (8, 8, 8, '出生生日', 1, 0);
INSERT INTO `ims_mc_member_fields` VALUES (9, 8, 9, '星座', 1, 0);
INSERT INTO `ims_mc_member_fields` VALUES (10, 8, 10, '生肖', 1, 0);
INSERT INTO `ims_mc_member_fields` VALUES (11, 8, 11, '固定电话', 1, 0);
INSERT INTO `ims_mc_member_fields` VALUES (12, 8, 12, '证件号码', 1, 0);
INSERT INTO `ims_mc_member_fields` VALUES (13, 8, 13, '学号', 1, 0);
INSERT INTO `ims_mc_member_fields` VALUES (14, 8, 14, '班级', 1, 0);
INSERT INTO `ims_mc_member_fields` VALUES (15, 8, 15, '邮寄地址', 1, 0);
INSERT INTO `ims_mc_member_fields` VALUES (16, 8, 16, '邮编', 1, 0);
INSERT INTO `ims_mc_member_fields` VALUES (17, 8, 17, '国籍', 1, 0);
INSERT INTO `ims_mc_member_fields` VALUES (18, 8, 18, '居住地址', 1, 0);
INSERT INTO `ims_mc_member_fields` VALUES (19, 8, 19, '毕业学校', 1, 0);
INSERT INTO `ims_mc_member_fields` VALUES (20, 8, 20, '公司', 1, 0);
INSERT INTO `ims_mc_member_fields` VALUES (21, 8, 21, '学历', 1, 0);
INSERT INTO `ims_mc_member_fields` VALUES (22, 8, 22, '职业', 1, 0);
INSERT INTO `ims_mc_member_fields` VALUES (23, 8, 23, '职位', 1, 0);
INSERT INTO `ims_mc_member_fields` VALUES (24, 8, 24, '年收入', 1, 0);
INSERT INTO `ims_mc_member_fields` VALUES (25, 8, 25, '情感状态', 1, 0);
INSERT INTO `ims_mc_member_fields` VALUES (26, 8, 26, ' 交友目的', 1, 0);
INSERT INTO `ims_mc_member_fields` VALUES (27, 8, 27, '血型', 1, 0);
INSERT INTO `ims_mc_member_fields` VALUES (28, 8, 28, '身高', 1, 0);
INSERT INTO `ims_mc_member_fields` VALUES (29, 8, 29, '体重', 1, 0);
INSERT INTO `ims_mc_member_fields` VALUES (30, 8, 30, '支付宝帐号', 1, 0);
INSERT INTO `ims_mc_member_fields` VALUES (31, 8, 31, 'MSN', 1, 0);
INSERT INTO `ims_mc_member_fields` VALUES (32, 8, 32, '电子邮箱', 1, 0);
INSERT INTO `ims_mc_member_fields` VALUES (33, 8, 33, '阿里旺旺', 1, 0);
INSERT INTO `ims_mc_member_fields` VALUES (34, 8, 34, '主页', 1, 0);
INSERT INTO `ims_mc_member_fields` VALUES (35, 8, 35, '自我介绍', 1, 0);
INSERT INTO `ims_mc_member_fields` VALUES (36, 8, 36, '兴趣爱好', 1, 0);

-- ----------------------------
-- Table structure for ims_mc_member_property
-- ----------------------------
DROP TABLE IF EXISTS `ims_mc_member_property`;
CREATE TABLE `ims_mc_member_property`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `property` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_mc_members
-- ----------------------------
DROP TABLE IF EXISTS `ims_mc_members`;
CREATE TABLE `ims_mc_members`  (
  `uid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `mobile` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `salt` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `groupid` int(11) NOT NULL,
  `credit1` decimal(10, 2) UNSIGNED NOT NULL,
  `credit2` decimal(10, 2) UNSIGNED NOT NULL,
  `credit3` decimal(10, 2) UNSIGNED NOT NULL,
  `credit4` decimal(10, 2) UNSIGNED NOT NULL,
  `credit5` decimal(10, 2) UNSIGNED NOT NULL,
  `credit6` decimal(10, 2) NOT NULL,
  `createtime` int(10) UNSIGNED NOT NULL,
  `realname` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `nickname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `qq` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `vip` tinyint(3) UNSIGNED NOT NULL,
  `gender` tinyint(1) NOT NULL,
  `birthyear` smallint(6) UNSIGNED NOT NULL,
  `birthmonth` tinyint(3) UNSIGNED NOT NULL,
  `birthday` tinyint(3) UNSIGNED NOT NULL,
  `constellation` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `zodiac` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `telephone` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `idcard` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `studentid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `grade` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `zipcode` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `nationality` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `resideprovince` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `residecity` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `residedist` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `graduateschool` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `company` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `education` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `occupation` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `position` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `revenue` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `affectivestatus` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `lookingfor` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `bloodtype` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `height` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `weight` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `alipay` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `msn` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `taobao` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `site` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `bio` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `interest` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pay_password` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`uid`) USING BTREE,
  INDEX `groupid`(`groupid`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `email`(`email`) USING BTREE,
  INDEX `mobile`(`mobile`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_mc_oauth_fans
-- ----------------------------
DROP TABLE IF EXISTS `ims_mc_oauth_fans`;
CREATE TABLE `ims_mc_oauth_fans`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `oauth_openid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `acid` int(10) UNSIGNED NOT NULL,
  `uid` int(10) UNSIGNED NOT NULL,
  `openid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_oauthopenid_acid`(`oauth_openid`, `acid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_menu_event
-- ----------------------------
DROP TABLE IF EXISTS `ims_menu_event`;
CREATE TABLE `ims_menu_event`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `keyword` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `picmd5` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `openid` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `createtime` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `picmd5`(`picmd5`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_message_notice_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_message_notice_log`;
CREATE TABLE `ims_message_notice_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_read` tinyint(3) NOT NULL,
  `uid` int(11) NOT NULL,
  `sign` varchar(22) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` tinyint(3) NOT NULL,
  `status` tinyint(3) NULL DEFAULT NULL,
  `create_time` int(11) NOT NULL,
  `end_time` int(11) NOT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ims_message_notice_log
-- ----------------------------
INSERT INTO `ims_message_notice_log` VALUES (1, 'admin000000 2019-05-29 17:40:22注册成功--admin', 1, 2, '2', 4, 2, 1559122822, 0, '');
INSERT INTO `ims_message_notice_log` VALUES (2, 'admin123 2019-06-27 09:03:22注册成功--system', 1, 3, '3', 4, 2, 1561597402, 0, '');

-- ----------------------------
-- Table structure for ims_mobilenumber
-- ----------------------------
DROP TABLE IF EXISTS `ims_mobilenumber`;
CREATE TABLE `ims_mobilenumber`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rid` int(10) NOT NULL,
  `enabled` tinyint(1) UNSIGNED NOT NULL,
  `dateline` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for ims_modules
-- ----------------------------
DROP TABLE IF EXISTS `ims_modules`;
CREATE TABLE `ims_modules`  (
  `mid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `version` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ability` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `author` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `settings` tinyint(1) NOT NULL,
  `subscribes` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `handles` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `isrulefields` tinyint(1) NOT NULL,
  `issystem` tinyint(1) UNSIGNED NOT NULL,
  `target` int(10) UNSIGNED NOT NULL,
  `iscard` tinyint(3) UNSIGNED NOT NULL,
  `permissions` varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `title_initial` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `wxapp_support` tinyint(1) NOT NULL,
  `welcome_support` int(2) NOT NULL,
  `oauth_type` tinyint(1) NOT NULL,
  `webapp_support` tinyint(1) NOT NULL,
  `phoneapp_support` tinyint(1) NOT NULL,
  `account_support` tinyint(1) NOT NULL,
  `xzapp_support` tinyint(1) NOT NULL,
  `app_support` tinyint(1) NOT NULL,
  `aliapp_support` tinyint(1) NOT NULL,
  PRIMARY KEY (`mid`) USING BTREE,
  INDEX `idx_name`(`name`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ims_modules
-- ----------------------------
INSERT INTO `ims_modules` VALUES (1, 'basic', 'system', '基本文字回复', '1.0', '和您进行简单对话', '一问一答得简单对话. 当访客的对话语句中包含指定关键字, 或对话语句完全等于特定关键字, 或符合某些特定的格式时. 系统自动应答设定好的回复内容.', 'WeEngine Team', 'http://www.we7.cc/', 0, '', '', 1, 1, 0, 0, '', '', 1, 1, 1, 1, 0, 2, 0, 0, 0);
INSERT INTO `ims_modules` VALUES (2, 'news', 'system', '基本混合图文回复', '1.0', '为你提供生动的图文资讯', '一问一答得简单对话, 但是回复内容包括图片文字等更生动的媒体内容. 当访客的对话语句中包含指定关键字, 或对话语句完全等于特定关键字, 或符合某些特定的格式时. 系统自动应答设定好的图文回复内容.', 'WeEngine Team', 'http://www.we7.cc/', 0, '', '', 1, 1, 0, 0, '', '', 1, 1, 1, 1, 0, 2, 0, 0, 0);
INSERT INTO `ims_modules` VALUES (3, 'music', 'system', '基本音乐回复', '1.0', '提供语音、音乐等音频类回复', '在回复规则中可选择具有语音、音乐等音频类的回复内容，并根据用户所设置的特定关键字精准的返回给粉丝，实现一问一答得简单对话。', 'WeEngine Team', 'http://www.we7.cc/', 0, '', '', 1, 1, 0, 0, '', '', 1, 1, 1, 1, 0, 2, 0, 0, 0);
INSERT INTO `ims_modules` VALUES (4, 'userapi', 'system', '自定义接口回复', '1.1', '更方便的第三方接口设置', '自定义接口又称第三方接口，可以让开发者更方便的接入微擎系统，高效的与微信公众平台进行对接整合。', 'WeEngine Team', 'http://www.we7.cc/', 0, '', '', 1, 1, 0, 0, '', '', 1, 1, 1, 1, 0, 2, 0, 0, 0);
INSERT INTO `ims_modules` VALUES (5, 'recharge', 'system', '会员中心充值模块', '1.0', '提供会员充值功能', '', 'WeEngine Team', 'http://www.we7.cc/', 0, '', '', 0, 1, 0, 0, '', '', 1, 1, 1, 1, 0, 2, 0, 0, 0);
INSERT INTO `ims_modules` VALUES (6, 'custom', 'system', '多客服转接', '1.0.0', '用来接入腾讯的多客服系统', '', 'WeEngine Team', 'http://bbs.we7.cc', 0, 'a:0:{}', 'a:6:{i:0;s:5:\"image\";i:1;s:5:\"voice\";i:2;s:5:\"video\";i:3;s:8:\"location\";i:4;s:4:\"link\";i:5;s:4:\"text\";}', 1, 1, 0, 0, '', '', 1, 1, 1, 1, 0, 2, 0, 0, 0);
INSERT INTO `ims_modules` VALUES (7, 'images', 'system', '基本图片回复', '1.0', '提供图片回复', '在回复规则中可选择具有图片的回复内容，并根据用户所设置的特定关键字精准的返回给粉丝图片。', 'WeEngine Team', 'http://www.we7.cc/', 0, '', '', 1, 1, 0, 0, '', '', 1, 1, 1, 1, 0, 2, 0, 0, 0);
INSERT INTO `ims_modules` VALUES (8, 'video', 'system', '基本视频回复', '1.0', '提供图片回复', '在回复规则中可选择具有视频的回复内容，并根据用户所设置的特定关键字精准的返回给粉丝视频。', 'WeEngine Team', 'http://www.we7.cc/', 0, '', '', 1, 1, 0, 0, '', '', 1, 1, 1, 1, 0, 2, 0, 0, 0);
INSERT INTO `ims_modules` VALUES (9, 'voice', 'system', '基本语音回复', '1.0', '提供语音回复', '在回复规则中可选择具有语音的回复内容，并根据用户所设置的特定关键字精准的返回给粉丝语音。', 'WeEngine Team', 'http://www.we7.cc/', 0, '', '', 1, 1, 0, 0, '', '', 1, 1, 1, 1, 0, 2, 0, 0, 0);
INSERT INTO `ims_modules` VALUES (10, 'chats', 'system', '发送客服消息', '1.0', '公众号可以在粉丝最后发送消息的48小时内无限制发送消息', '', 'WeEngine Team', 'http://www.we7.cc/', 0, '', '', 0, 1, 0, 0, '', '', 1, 1, 1, 1, 0, 2, 0, 0, 0);
INSERT INTO `ims_modules` VALUES (11, 'wxcard', 'system', '微信卡券回复', '1.0', '微信卡券回复', '微信卡券回复', 'WeEngine Team', 'http://www.we7.cc/', 0, '', '', 1, 1, 0, 0, '', '', 1, 1, 1, 1, 0, 2, 0, 0, 0);
INSERT INTO `ims_modules` VALUES (12, 'store', 'business', '站内商城', '1.0', '站内商城', '站内商城', 'WeEngine Team', 'http://www.we7.cc/', 0, '', '', 0, 1, 0, 0, '', '', 1, 1, 1, 1, 0, 2, 0, 0, 0);
INSERT INTO `ims_modules` VALUES (14, 'deam_food', 'biz', '自助点餐程序', '1.0.44', '自助点餐小程序', '自助点餐小程序', '兔宝资源', 'https://bbs.tubaoge.com', 0, 'a:5:{i:0;s:13:\"user_get_card\";i:1;s:15:\"card_pass_check\";i:2;s:17:\"user_gifting_card\";i:3;s:13:\"user_del_card\";i:4;s:17:\"user_consume_card\";}', 'a:0:{}', 0, 0, 0, 0, 'N;', 'Z', 2, 1, 1, 1, 1, 1, 1, 0, 1);
INSERT INTO `ims_modules` VALUES (17, 'demo_app', 'business', '微商城', '7.0.4', '微商城', '微商城', 'WeEngine Team & ewei', '', 1, 'a:0:{}', 'a:1:{i:0;s:4:\"text\";}', 0, 0, 0, 0, 'N;', 'W', 1, 1, 1, 1, 1, 2, 1, 0, 1);
INSERT INTO `ims_modules` VALUES (16, 'yunphp_shop', 'business', 'YUN商城', '2.9.4', 'YUN商城(分销),多用户分权，淘宝商品一键转换，多种插件支持。', 'YUN商城(分销)，多项信息模板，强大的自定义规格设置', 'YUN商城', 'http://bbs.3r86.com', 0, 'a:14:{i:0;s:4:\"text\";i:1;s:5:\"image\";i:2;s:5:\"voice\";i:3;s:5:\"video\";i:4;s:10:\"shortvideo\";i:5;s:8:\"location\";i:6;s:4:\"link\";i:7;s:9:\"subscribe\";i:8;s:11:\"unsubscribe\";i:9;s:2:\"qr\";i:10;s:5:\"trace\";i:11;s:5:\"click\";i:12;s:4:\"view\";i:13;s:14:\"merchant_order\";}', 'a:12:{i:0;s:4:\"text\";i:1;s:5:\"image\";i:2;s:5:\"voice\";i:3;s:5:\"video\";i:4;s:10:\"shortvideo\";i:5;s:8:\"location\";i:6;s:4:\"link\";i:7;s:9:\"subscribe\";i:8;s:2:\"qr\";i:9;s:5:\"trace\";i:10;s:5:\"click\";i:11;s:14:\"merchant_order\";}', 0, 0, 0, 0, 'a:0:{}', 'Y', 1, 1, 1, 1, 1, 2, 1, 0, 1);
INSERT INTO `ims_modules` VALUES (18, 'jizan', 'business', '集赞', '7.0.4', '集赞', '集赞', 'WeEngine Team & ewei', '', 1, 'a:0:{}', 'a:1:{i:0;s:4:\"text\";}', 0, 0, 0, 0, 'N;', 'J', 1, 1, 1, 1, 1, 2, 1, 0, 1);
INSERT INTO `ims_modules` VALUES (19, 'mon_jgg', 'activity', '幸运九宫格', '1.6.1', '幸运九宫格！', '幸运九宫格！', '兔哥资源', 'http://www.tubaoge.com', 0, 'a:0:{}', 'a:1:{i:0;s:4:\"text\";}', 1, 0, 0, 0, 'a:0:{}', 'X', 1, 1, 1, 1, 1, 2, 1, 0, 1);
INSERT INTO `ims_modules` VALUES (20, 'ants_jizanbao', 'services', '集赞宝', '1.0.0', '集赞宝', '集赞宝', '蚁族创想', 'https://www.snants.com', 1, 'a:0:{}', 'a:1:{i:0;s:4:\"text\";}', 0, 0, 0, 0, 'N;', 'J', 1, 1, 1, 1, 1, 2, 1, 0, 1);

-- ----------------------------
-- Table structure for ims_modules_bindings
-- ----------------------------
DROP TABLE IF EXISTS `ims_modules_bindings`;
CREATE TABLE `ims_modules_bindings`  (
  `eid` int(11) NOT NULL AUTO_INCREMENT,
  `module` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `entry` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `call` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `do` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `state` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `direct` int(11) NOT NULL,
  `url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `icon` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `displayorder` tinyint(255) UNSIGNED NOT NULL,
  PRIMARY KEY (`eid`) USING BTREE,
  INDEX `idx_module`(`module`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 52 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ims_modules_bindings
-- ----------------------------
INSERT INTO `ims_modules_bindings` VALUES (11, 'deam_food', 'menu', '', '报表', 'statistics', '', 0, '', 'fa fa-puzzle-piece', 0);
INSERT INTO `ims_modules_bindings` VALUES (10, 'deam_food', 'menu', '', '营销', 'coupon', '', 0, '', 'fa fa-puzzle-piece', 0);
INSERT INTO `ims_modules_bindings` VALUES (9, 'deam_food', 'menu', '', '系统设定', 'settings', '', 0, '', 'fa fa-puzzle-piece', 0);
INSERT INTO `ims_modules_bindings` VALUES (8, 'deam_food', 'menu', '', '幻灯片管理', 'adv', '', 0, '', 'fa fa-puzzle-piece', 0);
INSERT INTO `ims_modules_bindings` VALUES (7, 'deam_food', 'menu', '', '门店管理', 'store', '', 0, '', 'fa fa-puzzle-piece', 0);
INSERT INTO `ims_modules_bindings` VALUES (12, 'deam_food', 'menu', '', '门店操作台', 'manage', '', 1, '', 'fa fa-puzzle-piece', 0);
INSERT INTO `ims_modules_bindings` VALUES (33, 'demo_app', 'home', '', '商城', 'list', '', 0, '', 'fa fa-puzzle-piece', 0);
INSERT INTO `ims_modules_bindings` VALUES (32, 'demo_app', 'menu', '', '维权与告警', 'notice', '', 0, '', 'fa fa-puzzle-piece', 0);
INSERT INTO `ims_modules_bindings` VALUES (31, 'demo_app', 'menu', '', '幻灯片管理', 'adv', '', 0, '', 'fa fa-puzzle-piece', 0);
INSERT INTO `ims_modules_bindings` VALUES (30, 'demo_app', 'menu', '', '配送方式', 'dispatch', '', 0, '', 'fa fa-puzzle-piece', 0);
INSERT INTO `ims_modules_bindings` VALUES (29, 'demo_app', 'menu', '', '物流管理', 'express', '', 0, '', 'fa fa-puzzle-piece', 0);
INSERT INTO `ims_modules_bindings` VALUES (28, 'demo_app', 'menu', '', '商品分类', 'category', '', 0, '', 'fa fa-puzzle-piece', 0);
INSERT INTO `ims_modules_bindings` VALUES (27, 'demo_app', 'menu', '', '商品管理', 'goods', '', 0, '', 'fa fa-puzzle-piece', 0);
INSERT INTO `ims_modules_bindings` VALUES (26, 'demo_app', 'menu', '', '订单管理', 'order', '', 0, '', 'fa fa-puzzle-piece', 0);
INSERT INTO `ims_modules_bindings` VALUES (25, 'demo_app', 'cover', '', '商城入口设置', 'list', '', 0, '', 'fa fa-puzzle-piece', 0);
INSERT INTO `ims_modules_bindings` VALUES (23, 'yunphp_shop', 'cover', '', '商城入口', 'mobile', '', 0, '', 'fa fa-puzzle-piece', 0);
INSERT INTO `ims_modules_bindings` VALUES (24, 'yunphp_shop', 'menu', 'getMenus', '', '', '', 0, '', 'fa fa-puzzle-piece', 0);
INSERT INTO `ims_modules_bindings` VALUES (34, 'demo_app', 'profile', '', '我的订单', 'myorder', '', 0, '', 'fa fa-puzzle-piece', 0);
INSERT INTO `ims_modules_bindings` VALUES (35, 'jizan', 'cover', '', '集赞入口设置', 'list', '', 0, '', 'fa fa-puzzle-piece', 0);
INSERT INTO `ims_modules_bindings` VALUES (36, 'jizan', 'menu', '', '用户管理', 'user', '', 0, '', 'fa fa-puzzle-piece', 0);
INSERT INTO `ims_modules_bindings` VALUES (37, 'jizan', 'menu', '', '商品管理', 'goods', '', 0, '', 'fa fa-puzzle-piece', 0);
INSERT INTO `ims_modules_bindings` VALUES (38, 'jizan', 'menu', '', '订单管理', 'order', '', 0, '', 'fa fa-puzzle-piece', 0);
INSERT INTO `ims_modules_bindings` VALUES (39, 'jizan_', 'menu', '', '物流管理', 'express', '', 0, '', 'fa fa-puzzle-piece', 0);
INSERT INTO `ims_modules_bindings` VALUES (40, 'jizan_', 'menu', '', '配送方式', 'dispatch', '', 0, '', 'fa fa-puzzle-piece', 0);
INSERT INTO `ims_modules_bindings` VALUES (41, 'jizan_', 'menu', '', '幻灯片管理', 'adv', '', 0, '', 'fa fa-puzzle-piece', 0);
INSERT INTO `ims_modules_bindings` VALUES (42, 'jizan_', 'menu', '', '维权与告警', 'notice', '', 0, '', 'fa fa-puzzle-piece', 0);
INSERT INTO `ims_modules_bindings` VALUES (43, 'jizan', 'menu', '', '分类管理', 'category', '', 0, '', 'fa fa-puzzle-piece', 0);
INSERT INTO `ims_modules_bindings` VALUES (44, 'jizan_', 'profile', '', '我的订单', 'myorder', '', 0, '', 'fa fa-puzzle-piece', 0);
INSERT INTO `ims_modules_bindings` VALUES (45, 'mon_jgg', 'menu', '', '活动管理', 'jggManage', '', 0, '', 'fa fa-puzzle-piece', 0);
INSERT INTO `ims_modules_bindings` VALUES (46, 'ants_jizanbao', 'cover', '', '入口设置', 'list', '', 0, '', 'fa fa-puzzle-piece', 0);
INSERT INTO `ims_modules_bindings` VALUES (47, 'ants_jizanbao', 'menu', '', '活动管理', 'activitys', '', 0, '', 'fa fa-puzzle-piece', 0);
INSERT INTO `ims_modules_bindings` VALUES (48, 'ants_jizanbao', 'menu', '', '添加活动', 'addactivitys', '', 0, '', 'fa fa-puzzle-piece', 0);
INSERT INTO `ims_modules_bindings` VALUES (49, 'ants_jizanbao', 'menu', '', '用户列表', 'users', '', 0, '', 'fa fa-puzzle-piece', 0);
INSERT INTO `ims_modules_bindings` VALUES (50, 'ants_jizanbao', 'menu', '', '兑换列表', 'orders', '', 0, '', 'fa fa-puzzle-piece', 0);
INSERT INTO `ims_modules_bindings` VALUES (51, 'ants_jizanbao_hidden', 'menu', '', '数据统计', 'statistics', '', 0, '', 'fa fa-puzzle-piece', 0);

-- ----------------------------
-- Table structure for ims_modules_cloud
-- ----------------------------
DROP TABLE IF EXISTS `ims_modules_cloud`;
CREATE TABLE `ims_modules_cloud`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `title_initial` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `logo` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `version` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `install_status` tinyint(4) NOT NULL,
  `account_support` tinyint(4) NOT NULL,
  `wxapp_support` tinyint(4) NOT NULL,
  `webapp_support` tinyint(4) NOT NULL,
  `phoneapp_support` tinyint(4) NOT NULL,
  `welcome_support` tinyint(4) NOT NULL,
  `main_module_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `main_module_logo` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `has_new_version` tinyint(1) NOT NULL,
  `has_new_branch` tinyint(1) NOT NULL,
  `is_ban` tinyint(4) NOT NULL,
  `lastupdatetime` int(11) NOT NULL,
  `xzapp_support` tinyint(1) NOT NULL,
  `cloud_id` int(11) NOT NULL,
  `aliapp_support` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `name`(`name`) USING BTREE,
  INDEX `lastupdatetime`(`lastupdatetime`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ims_modules_cloud
-- ----------------------------
INSERT INTO `ims_modules_cloud` VALUES (8, 'bj', 'BJ测试模块', 'B', 'http://148.70.79.191:14802/addons/bj/icon.jpg', '1.0', 2, 2, 1, 1, 1, 1, '', '', 0, 0, 0, 0, 1, 0, 1);

-- ----------------------------
-- Table structure for ims_modules_ignore
-- ----------------------------
DROP TABLE IF EXISTS `ims_modules_ignore`;
CREATE TABLE `ims_modules_ignore`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `version` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `name`(`name`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_modules_plugin
-- ----------------------------
DROP TABLE IF EXISTS `ims_modules_plugin`;
CREATE TABLE `ims_modules_plugin`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `main_module` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `name`(`name`) USING BTREE,
  INDEX `main_module`(`main_module`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ims_modules_plugin
-- ----------------------------
INSERT INTO `ims_modules_plugin` VALUES (2, 'ewei_shopping_plugin_notice', 'demo_app');
INSERT INTO `ims_modules_plugin` VALUES (3, 'ewei_shopping_plugin_notice', 'jizan');

-- ----------------------------
-- Table structure for ims_modules_rank
-- ----------------------------
DROP TABLE IF EXISTS `ims_modules_rank`;
CREATE TABLE `ims_modules_rank`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `module_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `uid` int(10) NOT NULL,
  `rank` int(10) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `module_name`(`module_name`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_modules_recycle
-- ----------------------------
DROP TABLE IF EXISTS `ims_modules_recycle`;
CREATE TABLE `ims_modules_recycle`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` tinyint(4) NOT NULL,
  `modulename` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `name`(`name`) USING BTREE,
  INDEX `modulename`(`modulename`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_mon_jgg
-- ----------------------------
DROP TABLE IF EXISTS `ims_mon_jgg`;
CREATE TABLE `ims_mon_jgg`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `rid` int(10) NOT NULL,
  `weid` int(11) NOT NULL,
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `starttime` int(10) NULL DEFAULT NULL,
  `endtime` int(10) NULL DEFAULT NULL,
  `rule` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `join_intro` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `day_play_count` int(3) NULL DEFAULT 0,
  `play_count` int(10) NULL DEFAULT 0,
  `follow_btn` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '点击参加抽奖活动',
  `follow_welbtn` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '欢迎参加微信九宫格',
  `follow_url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `copyright` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `prize_level_0` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '没有中奖',
  `prize_name_0` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `prize_img_0` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `prize_p_0` int(3) NOT NULL,
  `prize_level_1` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '一等奖',
  `prize_name_1` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `prize_img_1` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `prize_p_1` int(3) NOT NULL DEFAULT 0,
  `prize_num_1` int(10) NOT NULL,
  `prize_level_2` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '二等奖',
  `prize_name_2` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `prize_img_2` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `prize_p_2` int(3) NOT NULL,
  `prize_num_2` int(10) NOT NULL DEFAULT 0,
  `prize_level_3` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '三等奖',
  `prize_name_3` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `prize_img_3` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `prize_p_3` int(3) NOT NULL,
  `prize_num_3` int(10) NOT NULL DEFAULT 0,
  `prize_level_4` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '四等奖',
  `prize_name_4` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `prize_img_4` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `prize_p_4` int(3) NOT NULL,
  `prize_num_4` int(10) NOT NULL DEFAULT 0,
  `prize_level_5` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '五等奖',
  `prize_name_5` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `prize_img_5` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `prize_p_5` int(3) NOT NULL,
  `prize_num_5` int(10) NOT NULL DEFAULT 0,
  `prize_level_6` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '六等奖',
  `prize_name_6` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `prize_img_6` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `prize_p_6` int(3) NOT NULL,
  `prize_num_6` int(10) NOT NULL DEFAULT 0,
  `prize_level_7` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '七等奖',
  `prize_name_7` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `prize_img_7` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `prize_p_7` int(3) NOT NULL,
  `prize_num_7` int(10) NOT NULL DEFAULT 0,
  `award_count` int(10) NULL DEFAULT 0,
  `day_award_count` int(10) NULL DEFAULT 0,
  `new_title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `new_icon` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `new_content` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `share_title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `share_icon` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `share_content` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createtime` int(10) NULL DEFAULT 0,
  `hx_enable` tinyint(1) NULL DEFAULT 0,
  `hx_password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bg` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bgcolor` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `share_enable` int(1) NULL DEFAULT 0,
  `share_times` int(10) NULL DEFAULT 0,
  `share_award_count` int(10) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_mon_jgg_share
-- ----------------------------
DROP TABLE IF EXISTS `ims_mon_jgg_share`;
CREATE TABLE `ims_mon_jgg_share`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `jid` int(10) NOT NULL,
  `uid` int(10) NULL DEFAULT NULL,
  `openid` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createtime` int(10) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_mon_jgg_user
-- ----------------------------
DROP TABLE IF EXISTS `ims_mon_jgg_user`;
CREATE TABLE `ims_mon_jgg_user`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `jid` int(10) NOT NULL,
  `openid` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `nickname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `headimgurl` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tel` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `uname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `createtime` int(10) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_mon_jgg_user_award
-- ----------------------------
DROP TABLE IF EXISTS `ims_mon_jgg_user_award`;
CREATE TABLE `ims_mon_jgg_user_award`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `jid` int(10) NOT NULL,
  `uid` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `openid` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `award_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `award_level` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `level` int(3) NULL DEFAULT 0,
  `status` int(11) NULL DEFAULT 0,
  `remark` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createtime` int(10) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_mon_jgg_user_record
-- ----------------------------
DROP TABLE IF EXISTS `ims_mon_jgg_user_record`;
CREATE TABLE `ims_mon_jgg_user_record`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `jid` int(10) NOT NULL,
  `uid` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `openid` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `award_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `award_level` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `level` int(3) NULL DEFAULT 0,
  `createtime` int(10) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 94 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_music_reply
-- ----------------------------
DROP TABLE IF EXISTS `ims_music_reply`;
CREATE TABLE `ims_music_reply`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `rid` int(10) UNSIGNED NOT NULL,
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `url` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `hqurl` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `rid`(`rid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_news_reply
-- ----------------------------
DROP TABLE IF EXISTS `ims_news_reply`;
CREATE TABLE `ims_news_reply`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `rid` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) NOT NULL,
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `author` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `thumb` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `displayorder` int(10) NOT NULL,
  `incontent` tinyint(1) NOT NULL,
  `createtime` int(10) NOT NULL,
  `media_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `rid`(`rid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_p2_activity
-- ----------------------------
DROP TABLE IF EXISTS `ims_p2_activity`;
CREATE TABLE `ims_p2_activity`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '活动名称',
  `browse` int(11) NULL DEFAULT NULL COMMENT '浏览量',
  `datetime` datetime NULL DEFAULT NULL COMMENT '活动时间',
  `state` smallint(1) NULL DEFAULT 1 COMMENT '默认开启（1）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '活动表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_p2_add_activity
-- ----------------------------
DROP TABLE IF EXISTS `ims_p2_add_activity`;
CREATE TABLE `ims_p2_add_activity`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '活动名称',
  `browse` int(11) NULL DEFAULT NULL COMMENT '浏览量',
  `start_time` datetime NULL DEFAULT NULL COMMENT '活动时间',
  `state` smallint(1) NULL DEFAULT 1 COMMENT '默认开启（1）',
  `limitone` smallint(2) NULL DEFAULT 0 COMMENT '参加限制',
  `image` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主题图片',
  `button_color` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '按钮颜色',
  `ruledes` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '规则说明',
  `is_follow` smallint(2) NULL DEFAULT NULL COMMENT '集赞是否需要关注',
  `follow_code` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '二维码',
  `write_openid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '核销人员openid',
  `main_domain` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主域名',
  `domain1` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '防封域名1',
  `domain2` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '防封域名2',
  `share_title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分享标题',
  `share_des` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分享描述',
  `share_image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分享封面图',
  `isbusiness` smallint(2) NULL DEFAULT 1 COMMENT '是否开启商家信息',
  `business` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商家描述',
  `business_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商家名称',
  `business_addr` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商家地址',
  `business_tel` char(13) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商家电话',
  `coordinate` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '坐标',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '活动表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_p2_exchange
-- ----------------------------
DROP TABLE IF EXISTS `ims_p2_exchange`;
CREATE TABLE `ims_p2_exchange`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` char(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户姓名',
  `fansname` char(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '粉丝姓名',
  `prizename` char(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '奖品名称',
  `write_time` datetime NULL DEFAULT NULL COMMENT '核销时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '兑换' ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for ims_p2_user
-- ----------------------------
DROP TABLE IF EXISTS `ims_p2_user`;
CREATE TABLE `ims_p2_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) NULL DEFAULT NULL COMMENT '活动id',
  `name` char(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `tel` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `image` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图像',
  `zan` int(11) NULL DEFAULT NULL COMMENT '被赞数',
  `share` int(11) NULL DEFAULT NULL COMMENT '分享数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_phoneapp_versions
-- ----------------------------
DROP TABLE IF EXISTS `ims_phoneapp_versions`;
CREATE TABLE `ims_phoneapp_versions`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) NOT NULL,
  `version` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `modules` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `createtime` int(10) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `version`(`version`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_profile_fields
-- ----------------------------
DROP TABLE IF EXISTS `ims_profile_fields`;
CREATE TABLE `ims_profile_fields`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `field` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `available` tinyint(1) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `displayorder` smallint(6) NOT NULL,
  `required` tinyint(1) NOT NULL,
  `unchangeable` tinyint(1) NOT NULL,
  `showinregister` tinyint(1) NOT NULL,
  `field_length` int(10) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 37 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ims_profile_fields
-- ----------------------------
INSERT INTO `ims_profile_fields` VALUES (1, 'realname', 1, '真实姓名', '', 0, 1, 1, 1, 0);
INSERT INTO `ims_profile_fields` VALUES (2, 'nickname', 1, '昵称', '', 1, 1, 0, 1, 0);
INSERT INTO `ims_profile_fields` VALUES (3, 'avatar', 1, '头像', '', 1, 0, 0, 0, 0);
INSERT INTO `ims_profile_fields` VALUES (4, 'qq', 1, 'QQ号', '', 0, 0, 0, 1, 0);
INSERT INTO `ims_profile_fields` VALUES (5, 'mobile', 1, '手机号码', '', 0, 0, 0, 0, 0);
INSERT INTO `ims_profile_fields` VALUES (6, 'vip', 1, 'VIP级别', '', 0, 0, 0, 0, 0);
INSERT INTO `ims_profile_fields` VALUES (7, 'gender', 1, '性别', '', 0, 0, 0, 0, 0);
INSERT INTO `ims_profile_fields` VALUES (8, 'birthyear', 1, '出生生日', '', 0, 0, 0, 0, 0);
INSERT INTO `ims_profile_fields` VALUES (9, 'constellation', 1, '星座', '', 0, 0, 0, 0, 0);
INSERT INTO `ims_profile_fields` VALUES (10, 'zodiac', 1, '生肖', '', 0, 0, 0, 0, 0);
INSERT INTO `ims_profile_fields` VALUES (11, 'telephone', 1, '固定电话', '', 0, 0, 0, 0, 0);
INSERT INTO `ims_profile_fields` VALUES (12, 'idcard', 1, '证件号码', '', 0, 0, 0, 0, 0);
INSERT INTO `ims_profile_fields` VALUES (13, 'studentid', 1, '学号', '', 0, 0, 0, 0, 0);
INSERT INTO `ims_profile_fields` VALUES (14, 'grade', 1, '班级', '', 0, 0, 0, 0, 0);
INSERT INTO `ims_profile_fields` VALUES (15, 'address', 1, '邮寄地址', '', 0, 0, 0, 0, 0);
INSERT INTO `ims_profile_fields` VALUES (16, 'zipcode', 1, '邮编', '', 0, 0, 0, 0, 0);
INSERT INTO `ims_profile_fields` VALUES (17, 'nationality', 1, '国籍', '', 0, 0, 0, 0, 0);
INSERT INTO `ims_profile_fields` VALUES (18, 'resideprovince', 1, '居住地址', '', 0, 0, 0, 0, 0);
INSERT INTO `ims_profile_fields` VALUES (19, 'graduateschool', 1, '毕业学校', '', 0, 0, 0, 0, 0);
INSERT INTO `ims_profile_fields` VALUES (20, 'company', 1, '公司', '', 0, 0, 0, 0, 0);
INSERT INTO `ims_profile_fields` VALUES (21, 'education', 1, '学历', '', 0, 0, 0, 0, 0);
INSERT INTO `ims_profile_fields` VALUES (22, 'occupation', 1, '职业', '', 0, 0, 0, 0, 0);
INSERT INTO `ims_profile_fields` VALUES (23, 'position', 1, '职位', '', 0, 0, 0, 0, 0);
INSERT INTO `ims_profile_fields` VALUES (24, 'revenue', 1, '年收入', '', 0, 0, 0, 0, 0);
INSERT INTO `ims_profile_fields` VALUES (25, 'affectivestatus', 1, '情感状态', '', 0, 0, 0, 0, 0);
INSERT INTO `ims_profile_fields` VALUES (26, 'lookingfor', 1, ' 交友目的', '', 0, 0, 0, 0, 0);
INSERT INTO `ims_profile_fields` VALUES (27, 'bloodtype', 1, '血型', '', 0, 0, 0, 0, 0);
INSERT INTO `ims_profile_fields` VALUES (28, 'height', 1, '身高', '', 0, 0, 0, 0, 0);
INSERT INTO `ims_profile_fields` VALUES (29, 'weight', 1, '体重', '', 0, 0, 0, 0, 0);
INSERT INTO `ims_profile_fields` VALUES (30, 'alipay', 1, '支付宝帐号', '', 0, 0, 0, 0, 0);
INSERT INTO `ims_profile_fields` VALUES (31, 'msn', 1, 'MSN', '', 0, 0, 0, 0, 0);
INSERT INTO `ims_profile_fields` VALUES (32, 'email', 1, '电子邮箱', '', 0, 0, 0, 0, 0);
INSERT INTO `ims_profile_fields` VALUES (33, 'taobao', 1, '阿里旺旺', '', 0, 0, 0, 0, 0);
INSERT INTO `ims_profile_fields` VALUES (34, 'site', 1, '主页', '', 0, 0, 0, 0, 0);
INSERT INTO `ims_profile_fields` VALUES (35, 'bio', 1, '自我介绍', '', 0, 0, 0, 0, 0);
INSERT INTO `ims_profile_fields` VALUES (36, 'interest', 1, '兴趣爱好', '', 0, 0, 0, 0, 0);

-- ----------------------------
-- Table structure for ims_qrcode
-- ----------------------------
DROP TABLE IF EXISTS `ims_qrcode`;
CREATE TABLE `ims_qrcode`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `acid` int(10) UNSIGNED NOT NULL,
  `type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `extra` int(10) UNSIGNED NOT NULL,
  `qrcid` bigint(20) NOT NULL,
  `scene_str` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `keyword` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `model` tinyint(1) UNSIGNED NOT NULL,
  `ticket` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `url` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `expire` int(10) UNSIGNED NOT NULL,
  `subnum` int(10) UNSIGNED NOT NULL,
  `createtime` int(10) UNSIGNED NOT NULL,
  `status` tinyint(1) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_qrcid`(`qrcid`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `ticket`(`ticket`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_qrcode_stat
-- ----------------------------
DROP TABLE IF EXISTS `ims_qrcode_stat`;
CREATE TABLE `ims_qrcode_stat`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `acid` int(10) UNSIGNED NOT NULL,
  `qid` int(10) UNSIGNED NOT NULL,
  `openid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` tinyint(1) UNSIGNED NOT NULL,
  `qrcid` bigint(20) UNSIGNED NOT NULL,
  `scene_str` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `createtime` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_rule
-- ----------------------------
DROP TABLE IF EXISTS `ims_rule`;
CREATE TABLE `ims_rule`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `module` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `displayorder` int(10) UNSIGNED NOT NULL,
  `status` tinyint(1) UNSIGNED NOT NULL,
  `containtype` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `reply_type` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ims_rule
-- ----------------------------
INSERT INTO `ims_rule` VALUES (1, 0, '城市天气', 'userapi', 255, 1, '', 0);
INSERT INTO `ims_rule` VALUES (2, 0, '百度百科', 'userapi', 255, 1, '', 0);
INSERT INTO `ims_rule` VALUES (3, 0, '即时翻译', 'userapi', 255, 1, '', 0);
INSERT INTO `ims_rule` VALUES (4, 0, '今日老黄历', 'userapi', 255, 1, '', 0);
INSERT INTO `ims_rule` VALUES (5, 0, '看新闻', 'userapi', 255, 1, '', 0);
INSERT INTO `ims_rule` VALUES (6, 0, '快递查询', 'userapi', 255, 1, '', 0);

-- ----------------------------
-- Table structure for ims_rule_keyword
-- ----------------------------
DROP TABLE IF EXISTS `ims_rule_keyword`;
CREATE TABLE `ims_rule_keyword`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `rid` int(10) UNSIGNED NOT NULL,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `module` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` tinyint(1) UNSIGNED NOT NULL,
  `displayorder` tinyint(3) UNSIGNED NOT NULL,
  `status` tinyint(1) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_content`(`content`) USING BTREE,
  INDEX `rid`(`rid`) USING BTREE,
  INDEX `idx_rid`(`rid`) USING BTREE,
  INDEX `idx_uniacid_type_content`(`uniacid`, `type`, `content`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ims_rule_keyword
-- ----------------------------
INSERT INTO `ims_rule_keyword` VALUES (1, 1, 0, 'userapi', '^.+天气$', 3, 255, 1);
INSERT INTO `ims_rule_keyword` VALUES (2, 2, 0, 'userapi', '^百科.+$', 3, 255, 1);
INSERT INTO `ims_rule_keyword` VALUES (3, 2, 0, 'userapi', '^定义.+$', 3, 255, 1);
INSERT INTO `ims_rule_keyword` VALUES (4, 3, 0, 'userapi', '^@.+$', 3, 255, 1);
INSERT INTO `ims_rule_keyword` VALUES (5, 4, 0, 'userapi', '日历', 1, 255, 1);
INSERT INTO `ims_rule_keyword` VALUES (6, 4, 0, 'userapi', '万年历', 1, 255, 1);
INSERT INTO `ims_rule_keyword` VALUES (7, 4, 0, 'userapi', '黄历', 1, 255, 1);
INSERT INTO `ims_rule_keyword` VALUES (8, 4, 0, 'userapi', '几号', 1, 255, 1);
INSERT INTO `ims_rule_keyword` VALUES (9, 5, 0, 'userapi', '新闻', 1, 255, 1);
INSERT INTO `ims_rule_keyword` VALUES (10, 6, 0, 'userapi', '^(申通|圆通|中通|汇通|韵达|顺丰|EMS) *[a-z0-9]{1,}$', 3, 255, 1);

-- ----------------------------
-- Table structure for ims_shopping_adv
-- ----------------------------
DROP TABLE IF EXISTS `ims_shopping_adv`;
CREATE TABLE `ims_shopping_adv`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) NULL DEFAULT 0,
  `advname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `link` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `thumb` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `displayorder` int(11) NULL DEFAULT 0,
  `enabled` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `indx_weid`(`weid`) USING BTREE,
  INDEX `indx_enabled`(`enabled`) USING BTREE,
  INDEX `indx_displayorder`(`displayorder`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_shopping_cart
-- ----------------------------
DROP TABLE IF EXISTS `ims_shopping_cart`;
CREATE TABLE `ims_shopping_cart`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `weid` int(10) UNSIGNED NOT NULL,
  `goodsid` int(11) NOT NULL,
  `goodstype` tinyint(1) NOT NULL DEFAULT 1,
  `from_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `total` int(10) UNSIGNED NOT NULL,
  `optionid` int(10) NULL DEFAULT 0,
  `marketprice` decimal(10, 2) NULL DEFAULT 0.00,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_openid`(`from_user`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_shopping_category
-- ----------------------------
DROP TABLE IF EXISTS `ims_shopping_category`;
CREATE TABLE `ims_shopping_category`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `weid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '所属帐号',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类名称',
  `thumb` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类图片',
  `parentid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '上级分类ID,0为第一级',
  `isrecommand` int(10) NULL DEFAULT 0,
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类介绍',
  `displayorder` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序',
  `enabled` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '是否开启',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ims_shopping_category
-- ----------------------------
INSERT INTO `ims_shopping_category` VALUES (1, 8, '分类1', 'images/8/2019/06/Ie0IX9WFnTLOk99ezfxNKtozv9e0Kf.jpg', 0, 1, '这个是可爱的，有颜值的，萌萌的，人见人爱，花见花开的国宝天尊大熊猫，就算是肉肉多成团子，也好看。', 0, 1);
INSERT INTO `ims_shopping_category` VALUES (2, 8, '分类2', 'images/8/2019/06/Ie0IX9WFnTLOk99ezfxNKtozv9e0Kf.jpg', 0, 0, '我是大猫', 1, 0);

-- ----------------------------
-- Table structure for ims_shopping_dispatch
-- ----------------------------
DROP TABLE IF EXISTS `ims_shopping_dispatch`;
CREATE TABLE `ims_shopping_dispatch`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) NULL DEFAULT 0,
  `dispatchname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `dispatchtype` int(11) NULL DEFAULT 0,
  `displayorder` int(11) NULL DEFAULT 0,
  `firstprice` decimal(10, 2) NULL DEFAULT 0.00,
  `secondprice` decimal(10, 2) NULL DEFAULT 0.00,
  `firstweight` int(11) NULL DEFAULT 0,
  `secondweight` int(11) NULL DEFAULT 0,
  `express` int(11) NULL DEFAULT 0,
  `enabled` int(11) NOT NULL DEFAULT 0,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `indx_weid`(`weid`) USING BTREE,
  INDEX `indx_displayorder`(`displayorder`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_shopping_express
-- ----------------------------
DROP TABLE IF EXISTS `ims_shopping_express`;
CREATE TABLE `ims_shopping_express`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) NULL DEFAULT 0,
  `express_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `displayorder` int(11) NULL DEFAULT 0,
  `express_price` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `express_area` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `express_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `indx_weid`(`weid`) USING BTREE,
  INDEX `indx_displayorder`(`displayorder`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_shopping_feedback
-- ----------------------------
DROP TABLE IF EXISTS `ims_shopping_feedback`;
CREATE TABLE `ims_shopping_feedback`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `weid` int(10) UNSIGNED NOT NULL,
  `openid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '1为维权，2为告擎',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '状态0未解决，1用户同意，2用户拒绝',
  `feedbackid` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '投诉单号',
  `transid` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单号',
  `reason` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '理由',
  `solution` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '期待解决方案',
  `remark` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '备注',
  `createtime` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_weid`(`weid`) USING BTREE,
  INDEX `idx_feedbackid`(`feedbackid`) USING BTREE,
  INDEX `idx_createtime`(`createtime`) USING BTREE,
  INDEX `idx_transid`(`transid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_shopping_goods
-- ----------------------------
DROP TABLE IF EXISTS `ims_shopping_goods`;
CREATE TABLE `ims_shopping_goods`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `weid` int(10) UNSIGNED NOT NULL,
  `pcate` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `ccate` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `type` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '1为实体，2为虚拟',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `displayorder` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `thumb` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `unit` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `description` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `goodssn` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `productsn` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `marketprice` decimal(10, 2) NOT NULL DEFAULT 0.00,
  `productprice` decimal(10, 2) NOT NULL DEFAULT 0.00,
  `costprice` decimal(10, 2) NOT NULL DEFAULT 0.00,
  `originalprice` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '原价',
  `total` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `totalcnf` int(11) NULL DEFAULT 0 COMMENT '0 拍下减库存 1 付款减库存 2 永久不减',
  `sales` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `spec` varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `createtime` int(10) UNSIGNED NOT NULL,
  `weight` decimal(10, 2) NOT NULL DEFAULT 0.00,
  `credit` decimal(10, 2) NOT NULL DEFAULT 0.00,
  `maxbuy` int(11) NULL DEFAULT 0,
  `usermaxbuy` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户最多购买数量',
  `hasoption` int(11) NULL DEFAULT 0,
  `dispatch` int(11) NULL DEFAULT 0,
  `thumb_url` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `isnew` int(11) NULL DEFAULT 0,
  `ishot` int(11) NULL DEFAULT 0,
  `isdiscount` int(11) NULL DEFAULT 0,
  `isrecommand` int(11) NULL DEFAULT 0,
  `istime` int(11) NULL DEFAULT 0,
  `timestart` int(11) NULL DEFAULT 0,
  `timeend` int(11) NULL DEFAULT 0,
  `viewcount` int(11) NULL DEFAULT 0,
  `deleted` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_shopping_goods_option
-- ----------------------------
DROP TABLE IF EXISTS `ims_shopping_goods_option`;
CREATE TABLE `ims_shopping_goods_option`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goodsid` int(10) NULL DEFAULT 0,
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `thumb` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `productprice` decimal(10, 2) NULL DEFAULT 0.00,
  `marketprice` decimal(10, 2) NULL DEFAULT 0.00,
  `costprice` decimal(10, 2) NULL DEFAULT 0.00,
  `stock` int(11) NULL DEFAULT 0,
  `weight` decimal(10, 2) NULL DEFAULT 0.00,
  `displayorder` int(11) NULL DEFAULT 0,
  `specs` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `indx_goodsid`(`goodsid`) USING BTREE,
  INDEX `indx_displayorder`(`displayorder`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_shopping_goods_param
-- ----------------------------
DROP TABLE IF EXISTS `ims_shopping_goods_param`;
CREATE TABLE `ims_shopping_goods_param`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goodsid` int(10) NULL DEFAULT 0,
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `value` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `displayorder` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `indx_goodsid`(`goodsid`) USING BTREE,
  INDEX `indx_displayorder`(`displayorder`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_shopping_order
-- ----------------------------
DROP TABLE IF EXISTS `ims_shopping_order`;
CREATE TABLE `ims_shopping_order`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `weid` int(10) UNSIGNED NOT NULL,
  `from_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ordersn` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `price` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '-1取消状态，0普通状态，1为已付款，2为已发货，3为成功',
  `sendtype` tinyint(1) UNSIGNED NOT NULL COMMENT '1为快递，2为自提',
  `paytype` tinyint(1) UNSIGNED NOT NULL COMMENT '1为余额，2为在线，3为到付',
  `transid` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '微信支付单号',
  `goodstype` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `remark` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `address` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '收货地址信息',
  `expresscom` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `expresssn` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `express` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `goodsprice` decimal(10, 2) NULL DEFAULT 0.00,
  `dispatchprice` decimal(10, 2) NULL DEFAULT 0.00,
  `dispatch` int(10) NULL DEFAULT 0,
  `paydetail` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '支付详情',
  `createtime` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_shopping_order_goods
-- ----------------------------
DROP TABLE IF EXISTS `ims_shopping_order_goods`;
CREATE TABLE `ims_shopping_order_goods`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `weid` int(10) UNSIGNED NOT NULL,
  `orderid` int(10) UNSIGNED NOT NULL,
  `goodsid` int(10) UNSIGNED NOT NULL,
  `price` decimal(10, 2) NULL DEFAULT 0.00,
  `total` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `optionid` int(10) NULL DEFAULT 0,
  `createtime` int(10) UNSIGNED NOT NULL,
  `optionname` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_shopping_product
-- ----------------------------
DROP TABLE IF EXISTS `ims_shopping_product`;
CREATE TABLE `ims_shopping_product`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `goodsid` int(11) NOT NULL,
  `productsn` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `title` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `marketprice` decimal(10, 0) UNSIGNED NOT NULL,
  `productprice` decimal(10, 0) UNSIGNED NOT NULL,
  `total` int(11) NOT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `spec` varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_goodsid`(`goodsid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_shopping_spec
-- ----------------------------
DROP TABLE IF EXISTS `ims_shopping_spec`;
CREATE TABLE `ims_shopping_spec`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `weid` int(10) UNSIGNED NOT NULL,
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `displaytype` tinyint(3) UNSIGNED NOT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `goodsid` int(11) NULL DEFAULT 0,
  `displayorder` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_shopping_spec_item
-- ----------------------------
DROP TABLE IF EXISTS `ims_shopping_spec_item`;
CREATE TABLE `ims_shopping_spec_item`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) NULL DEFAULT 0,
  `specid` int(11) NULL DEFAULT 0,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `thumb` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `show` int(11) NULL DEFAULT 0,
  `displayorder` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `indx_weid`(`weid`) USING BTREE,
  INDEX `indx_specid`(`specid`) USING BTREE,
  INDEX `indx_show`(`show`) USING BTREE,
  INDEX `indx_displayorder`(`displayorder`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_site_article
-- ----------------------------
DROP TABLE IF EXISTS `ims_site_article`;
CREATE TABLE `ims_site_article`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `rid` int(10) UNSIGNED NOT NULL,
  `kid` int(10) UNSIGNED NOT NULL,
  `iscommend` tinyint(1) NOT NULL,
  `ishot` tinyint(1) UNSIGNED NOT NULL,
  `pcate` int(10) UNSIGNED NOT NULL,
  `ccate` int(10) UNSIGNED NOT NULL,
  `template` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `thumb` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `incontent` tinyint(1) NOT NULL,
  `source` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `author` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `displayorder` int(10) UNSIGNED NOT NULL,
  `linkurl` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `createtime` int(10) UNSIGNED NOT NULL,
  `edittime` int(10) NOT NULL,
  `click` int(10) UNSIGNED NOT NULL,
  `type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `credit` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_iscommend`(`iscommend`) USING BTREE,
  INDEX `idx_ishot`(`ishot`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_site_article_comment
-- ----------------------------
DROP TABLE IF EXISTS `ims_site_article_comment`;
CREATE TABLE `ims_site_article_comment`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) NOT NULL,
  `articleid` int(10) NOT NULL,
  `parentid` int(10) NOT NULL,
  `uid` int(10) NOT NULL,
  `openid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `is_read` tinyint(1) NOT NULL,
  `iscomment` tinyint(1) NOT NULL,
  `createtime` int(10) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `articleid`(`articleid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_site_category
-- ----------------------------
DROP TABLE IF EXISTS `ims_site_category`;
CREATE TABLE `ims_site_category`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `nid` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `parentid` int(10) UNSIGNED NOT NULL,
  `displayorder` tinyint(3) UNSIGNED NOT NULL,
  `enabled` tinyint(1) UNSIGNED NOT NULL,
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `styleid` int(10) UNSIGNED NOT NULL,
  `linkurl` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ishomepage` tinyint(1) NOT NULL,
  `icontype` tinyint(1) UNSIGNED NOT NULL,
  `css` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `multiid` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_site_multi
-- ----------------------------
DROP TABLE IF EXISTS `ims_site_multi`;
CREATE TABLE `ims_site_multi`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `title` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `styleid` int(10) UNSIGNED NOT NULL,
  `site_info` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL,
  `bindhost` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `bindhost`(`bindhost`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ims_site_multi
-- ----------------------------
INSERT INTO `ims_site_multi` VALUES (2, 8, '测试公众号', 2, '', 1, '');

-- ----------------------------
-- Table structure for ims_site_nav
-- ----------------------------
DROP TABLE IF EXISTS `ims_site_nav`;
CREATE TABLE `ims_site_nav`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `multiid` int(10) UNSIGNED NOT NULL,
  `section` tinyint(4) NOT NULL,
  `module` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `displayorder` smallint(5) UNSIGNED NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `position` tinyint(4) NOT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `icon` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `css` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` tinyint(1) UNSIGNED NOT NULL,
  `categoryid` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `multiid`(`multiid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_site_page
-- ----------------------------
DROP TABLE IF EXISTS `ims_site_page`;
CREATE TABLE `ims_site_page`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `multiid` int(10) UNSIGNED NOT NULL,
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `params` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `html` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `multipage` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` tinyint(1) UNSIGNED NOT NULL,
  `status` tinyint(1) UNSIGNED NOT NULL,
  `createtime` int(10) UNSIGNED NOT NULL,
  `goodnum` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `multiid`(`multiid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_site_slide
-- ----------------------------
DROP TABLE IF EXISTS `ims_site_slide`;
CREATE TABLE `ims_site_slide`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `multiid` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `thumb` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `displayorder` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `multiid`(`multiid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_site_store_create_account
-- ----------------------------
DROP TABLE IF EXISTS `ims_site_store_create_account`;
CREATE TABLE `ims_site_store_create_account`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL,
  `uniacid` int(10) NOT NULL,
  `type` tinyint(4) NOT NULL,
  `endtime` int(12) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of ims_site_store_create_account
-- ----------------------------
INSERT INTO `ims_site_store_create_account` VALUES (1, 1, 3, 5, 0);
INSERT INTO `ims_site_store_create_account` VALUES (2, 1, 6, 5, 0);
INSERT INTO `ims_site_store_create_account` VALUES (3, 1, 7, 5, 0);

-- ----------------------------
-- Table structure for ims_site_store_goods
-- ----------------------------
DROP TABLE IF EXISTS `ims_site_store_goods`;
CREATE TABLE `ims_site_store_goods`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) NOT NULL,
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `module` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `account_num` int(10) NOT NULL,
  `wxapp_num` int(10) NOT NULL,
  `price` decimal(10, 2) NOT NULL,
  `unit` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `slide` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `category_id` int(10) NOT NULL,
  `title_initial` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `createtime` int(10) NOT NULL,
  `synopsis` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `module_group` int(10) NOT NULL,
  `api_num` int(10) NOT NULL,
  `user_group` int(10) NOT NULL,
  `user_group_price` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `module`(`module`) USING BTREE,
  INDEX `category_id`(`category_id`) USING BTREE,
  INDEX `price`(`price`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ims_site_store_goods
-- ----------------------------
INSERT INTO `ims_site_store_goods` VALUES (1, 1, '微商城', 'demo_app', 0, 0, 0.00, 'month', '', 0, 'W', 1, 1559117665, '微商城', '微商城', 0, 0, 0, '');

-- ----------------------------
-- Table structure for ims_site_store_order
-- ----------------------------
DROP TABLE IF EXISTS `ims_site_store_order`;
CREATE TABLE `ims_site_store_order`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `orderid` varchar(28) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `goodsid` int(10) NOT NULL,
  `duration` int(10) NOT NULL,
  `buyer` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `buyerid` int(10) NOT NULL,
  `amount` decimal(10, 2) NOT NULL,
  `type` tinyint(1) NOT NULL,
  `changeprice` tinyint(1) NOT NULL,
  `createtime` int(10) NOT NULL,
  `uniacid` int(10) NOT NULL,
  `endtime` int(15) NOT NULL,
  `wxapp` int(15) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `goodid`(`goodsid`) USING BTREE,
  INDEX `buyerid`(`buyerid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_site_styles
-- ----------------------------
DROP TABLE IF EXISTS `ims_site_styles`;
CREATE TABLE `ims_site_styles`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `templateid` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ims_site_styles
-- ----------------------------
INSERT INTO `ims_site_styles` VALUES (2, 8, 1, '微站默认模板_t6D8');

-- ----------------------------
-- Table structure for ims_site_styles_vars
-- ----------------------------
DROP TABLE IF EXISTS `ims_site_styles_vars`;
CREATE TABLE `ims_site_styles_vars`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `templateid` int(10) UNSIGNED NOT NULL,
  `styleid` int(10) UNSIGNED NOT NULL,
  `variable` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_site_templates
-- ----------------------------
DROP TABLE IF EXISTS `ims_site_templates`;
CREATE TABLE `ims_site_templates`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `title` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `version` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `author` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sections` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ims_site_templates
-- ----------------------------
INSERT INTO `ims_site_templates` VALUES (1, 'default', '微站默认模板', '', '由微擎提供默认微站模板套系', '微擎团队', 'http://we7.cc', '1', 0);

-- ----------------------------
-- Table structure for ims_stat_fans
-- ----------------------------
DROP TABLE IF EXISTS `ims_stat_fans`;
CREATE TABLE `ims_stat_fans`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `new` int(10) UNSIGNED NOT NULL,
  `cancel` int(10) UNSIGNED NOT NULL,
  `cumulate` int(10) NOT NULL,
  `date` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`, `date`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 64 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ims_stat_fans
-- ----------------------------
INSERT INTO `ims_stat_fans` VALUES (1, 1, 0, 0, 0, '20190427');
INSERT INTO `ims_stat_fans` VALUES (2, 1, 0, 0, 0, '20190426');
INSERT INTO `ims_stat_fans` VALUES (3, 1, 0, 0, 0, '20190425');
INSERT INTO `ims_stat_fans` VALUES (4, 1, 0, 0, 0, '20190424');
INSERT INTO `ims_stat_fans` VALUES (5, 1, 0, 0, 0, '20190423');
INSERT INTO `ims_stat_fans` VALUES (6, 1, 0, 0, 0, '20190422');
INSERT INTO `ims_stat_fans` VALUES (7, 1, 0, 0, 0, '20190421');
INSERT INTO `ims_stat_fans` VALUES (8, 1, 0, 0, 0, '20190527');
INSERT INTO `ims_stat_fans` VALUES (9, 1, 0, 0, 0, '20190526');
INSERT INTO `ims_stat_fans` VALUES (10, 1, 0, 0, 0, '20190525');
INSERT INTO `ims_stat_fans` VALUES (11, 1, 0, 0, 0, '20190524');
INSERT INTO `ims_stat_fans` VALUES (12, 1, 0, 0, 0, '20190523');
INSERT INTO `ims_stat_fans` VALUES (13, 1, 0, 0, 0, '20190522');
INSERT INTO `ims_stat_fans` VALUES (14, 1, 0, 0, 0, '20190521');
INSERT INTO `ims_stat_fans` VALUES (15, 1, 0, 0, 0, '20190528');
INSERT INTO `ims_stat_fans` VALUES (16, 0, 0, 0, 0, '20190528');
INSERT INTO `ims_stat_fans` VALUES (17, 0, 0, 0, 0, '20190527');
INSERT INTO `ims_stat_fans` VALUES (18, 0, 0, 0, 0, '20190526');
INSERT INTO `ims_stat_fans` VALUES (19, 0, 0, 0, 0, '20190525');
INSERT INTO `ims_stat_fans` VALUES (20, 0, 0, 0, 0, '20190524');
INSERT INTO `ims_stat_fans` VALUES (21, 0, 0, 0, 0, '20190523');
INSERT INTO `ims_stat_fans` VALUES (22, 0, 0, 0, 0, '20190522');
INSERT INTO `ims_stat_fans` VALUES (23, 7, 0, 0, 0, '20190528');
INSERT INTO `ims_stat_fans` VALUES (24, 7, 0, 0, 0, '20190527');
INSERT INTO `ims_stat_fans` VALUES (25, 7, 0, 0, 0, '20190526');
INSERT INTO `ims_stat_fans` VALUES (26, 7, 0, 0, 0, '20190525');
INSERT INTO `ims_stat_fans` VALUES (27, 7, 0, 0, 0, '20190524');
INSERT INTO `ims_stat_fans` VALUES (28, 7, 0, 0, 0, '20190523');
INSERT INTO `ims_stat_fans` VALUES (29, 7, 0, 0, 0, '20190522');
INSERT INTO `ims_stat_fans` VALUES (30, 8, 0, 0, 0, '20190528');
INSERT INTO `ims_stat_fans` VALUES (31, 8, 0, 0, 0, '20190527');
INSERT INTO `ims_stat_fans` VALUES (32, 8, 0, 0, 0, '20190526');
INSERT INTO `ims_stat_fans` VALUES (33, 8, 0, 0, 0, '20190525');
INSERT INTO `ims_stat_fans` VALUES (34, 8, 0, 0, 0, '20190524');
INSERT INTO `ims_stat_fans` VALUES (35, 8, 0, 0, 0, '20190523');
INSERT INTO `ims_stat_fans` VALUES (36, 8, 0, 0, 0, '20190522');
INSERT INTO `ims_stat_fans` VALUES (37, 8, 0, 0, 0, '20190529');
INSERT INTO `ims_stat_fans` VALUES (38, 8, 0, 0, 0, '20190530');
INSERT INTO `ims_stat_fans` VALUES (39, 8, 0, 0, 0, '20190603');
INSERT INTO `ims_stat_fans` VALUES (40, 8, 0, 0, 0, '20190602');
INSERT INTO `ims_stat_fans` VALUES (41, 8, 0, 0, 0, '20190601');
INSERT INTO `ims_stat_fans` VALUES (42, 8, 0, 0, 0, '20190531');
INSERT INTO `ims_stat_fans` VALUES (43, 8, 0, 0, 0, '20190604');
INSERT INTO `ims_stat_fans` VALUES (44, 8, 0, 0, 0, '20190609');
INSERT INTO `ims_stat_fans` VALUES (45, 8, 0, 0, 0, '20190608');
INSERT INTO `ims_stat_fans` VALUES (46, 8, 0, 0, 0, '20190607');
INSERT INTO `ims_stat_fans` VALUES (47, 8, 0, 0, 0, '20190606');
INSERT INTO `ims_stat_fans` VALUES (48, 8, 0, 0, 0, '20190605');
INSERT INTO `ims_stat_fans` VALUES (49, 8, 0, 0, 0, '20190610');
INSERT INTO `ims_stat_fans` VALUES (50, 8, 0, 0, 0, '20190611');
INSERT INTO `ims_stat_fans` VALUES (51, 8, 0, 0, 0, '20190612');
INSERT INTO `ims_stat_fans` VALUES (52, 8, 1, 0, 0, '20190624');
INSERT INTO `ims_stat_fans` VALUES (53, 8, 0, 0, 0, '20190625');
INSERT INTO `ims_stat_fans` VALUES (54, 8, 0, 0, 0, '20190623');
INSERT INTO `ims_stat_fans` VALUES (55, 8, 0, 0, 0, '20190622');
INSERT INTO `ims_stat_fans` VALUES (56, 8, 0, 0, 0, '20190621');
INSERT INTO `ims_stat_fans` VALUES (57, 8, 0, 0, 0, '20190620');
INSERT INTO `ims_stat_fans` VALUES (58, 8, 0, 0, 0, '20190619');
INSERT INTO `ims_stat_fans` VALUES (59, 8, 0, 0, 0, '20190626');
INSERT INTO `ims_stat_fans` VALUES (60, 8, 0, 0, 0, '20190627');
INSERT INTO `ims_stat_fans` VALUES (61, 8, 0, 0, 0, '20190630');
INSERT INTO `ims_stat_fans` VALUES (62, 8, 0, 0, 0, '20190629');
INSERT INTO `ims_stat_fans` VALUES (63, 8, 0, 0, 0, '20190628');

-- ----------------------------
-- Table structure for ims_stat_keyword
-- ----------------------------
DROP TABLE IF EXISTS `ims_stat_keyword`;
CREATE TABLE `ims_stat_keyword`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `rid` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `kid` int(10) UNSIGNED NOT NULL,
  `hit` int(10) UNSIGNED NOT NULL,
  `lastupdate` int(10) UNSIGNED NOT NULL,
  `createtime` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_createtime`(`createtime`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_stat_msg_history
-- ----------------------------
DROP TABLE IF EXISTS `ims_stat_msg_history`;
CREATE TABLE `ims_stat_msg_history`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `rid` int(10) UNSIGNED NOT NULL,
  `kid` int(10) UNSIGNED NOT NULL,
  `from_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `module` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `message` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `createtime` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_createtime`(`createtime`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_stat_rule
-- ----------------------------
DROP TABLE IF EXISTS `ims_stat_rule`;
CREATE TABLE `ims_stat_rule`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `rid` int(10) UNSIGNED NOT NULL,
  `hit` int(10) UNSIGNED NOT NULL,
  `lastupdate` int(10) UNSIGNED NOT NULL,
  `createtime` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_createtime`(`createtime`) USING BTREE,
  INDEX `rid`(`rid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for ims_stat_visit
-- ----------------------------
DROP TABLE IF EXISTS `ims_stat_visit`;
CREATE TABLE `ims_stat_visit`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) NOT NULL,
  `module` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `count` int(10) UNSIGNED NOT NULL,
  `date` int(10) UNSIGNED NOT NULL,
  `type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `date`(`date`) USING BTREE,
  INDEX `module`(`module`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 58 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ims_stat_visit
-- ----------------------------
INSERT INTO `ims_stat_visit` VALUES (2, 0, '', 50, 20190428, 'web');
INSERT INTO `ims_stat_visit` VALUES (3, 1, 'we7_account', 32, 20190428, 'web');
INSERT INTO `ims_stat_visit` VALUES (4, 1, 'we7_api', 1, 20190428, 'web');
INSERT INTO `ims_stat_visit` VALUES (5, 2, '', 11, 20190428, 'web');
INSERT INTO `ims_stat_visit` VALUES (6, 3, 'we7_webapp', 70, 20190428, 'web');
INSERT INTO `ims_stat_visit` VALUES (7, 0, '', 8, 20190528, 'web');
INSERT INTO `ims_stat_visit` VALUES (8, 3, 'we7_webapp', 21, 20190528, 'web');
INSERT INTO `ims_stat_visit` VALUES (9, 1, 'we7_account', 2, 20190528, 'web');
INSERT INTO `ims_stat_visit` VALUES (10, 0, '', 107, 20190529, 'web');
INSERT INTO `ims_stat_visit` VALUES (11, 3, 'we7_webapp', 154, 20190529, 'web');
INSERT INTO `ims_stat_visit` VALUES (12, 3, 'we7_account', 2, 20190529, 'web');
INSERT INTO `ims_stat_visit` VALUES (13, 6, 'we7_webapp', 33, 20190529, 'web');
INSERT INTO `ims_stat_visit` VALUES (14, 1, 'we7_account', 3, 20190529, 'web');
INSERT INTO `ims_stat_visit` VALUES (15, 7, 'we7_webapp', 197, 20190529, 'web');
INSERT INTO `ims_stat_visit` VALUES (16, 7, 'we7_account', 18, 20190529, 'web');
INSERT INTO `ims_stat_visit` VALUES (17, 8, 'we7_account', 38, 20190529, 'web');
INSERT INTO `ims_stat_visit` VALUES (18, 8, '', 44, 20190530, 'web');
INSERT INTO `ims_stat_visit` VALUES (19, 8, 'we7_account', 106, 20190530, 'web');
INSERT INTO `ims_stat_visit` VALUES (20, 8, '', 23, 20190531, 'web');
INSERT INTO `ims_stat_visit` VALUES (21, 8, 'we7_account', 57, 20190531, 'web');
INSERT INTO `ims_stat_visit` VALUES (22, 0, '', 3, 20190603, 'web');
INSERT INTO `ims_stat_visit` VALUES (23, 8, 'we7_account', 158, 20190603, 'web');
INSERT INTO `ims_stat_visit` VALUES (24, 8, '', 36, 20190604, 'web');
INSERT INTO `ims_stat_visit` VALUES (25, 8, 'we7_account', 270, 20190604, 'web');
INSERT INTO `ims_stat_visit` VALUES (26, 8, '', 6, 20190605, 'web');
INSERT INTO `ims_stat_visit` VALUES (27, 8, 'we7_account', 378, 20190605, 'web');
INSERT INTO `ims_stat_visit` VALUES (28, 8, '', 2, 20190606, 'web');
INSERT INTO `ims_stat_visit` VALUES (29, 8, 'we7_account', 97, 20190606, 'web');
INSERT INTO `ims_stat_visit` VALUES (30, 8, '', 2, 20190610, 'web');
INSERT INTO `ims_stat_visit` VALUES (31, 8, 'we7_account', 16, 20190610, 'web');
INSERT INTO `ims_stat_visit` VALUES (32, 8, '', 37, 20190611, 'web');
INSERT INTO `ims_stat_visit` VALUES (33, 8, 'we7_account', 51, 20190611, 'web');
INSERT INTO `ims_stat_visit` VALUES (34, 8, 'wesite', 2, 20190611, 'app');
INSERT INTO `ims_stat_visit` VALUES (35, 8, 'we7_api', 10, 20190611, 'web');
INSERT INTO `ims_stat_visit` VALUES (36, 0, '', 6, 20190612, 'web');
INSERT INTO `ims_stat_visit` VALUES (37, 8, 'we7_account', 21, 20190612, 'web');
INSERT INTO `ims_stat_visit` VALUES (38, 8, 'we7_api', 100, 20190612, 'web');
INSERT INTO `ims_stat_visit` VALUES (39, 8, 'we7_api', 13, 20190613, 'web');
INSERT INTO `ims_stat_visit` VALUES (40, 8, 'we7_account', 5, 20190613, 'web');
INSERT INTO `ims_stat_visit` VALUES (41, 8, '', 2, 20190614, 'web');
INSERT INTO `ims_stat_visit` VALUES (42, 8, 'we7_account', 5, 20190614, 'web');
INSERT INTO `ims_stat_visit` VALUES (43, 8, 'wesite', 1, 20190614, 'app');
INSERT INTO `ims_stat_visit` VALUES (44, 8, '', 2, 20190617, 'web');
INSERT INTO `ims_stat_visit` VALUES (45, 8, 'we7_account', 1, 20190617, 'web');
INSERT INTO `ims_stat_visit` VALUES (46, 8, '', 4, 20190618, 'web');
INSERT INTO `ims_stat_visit` VALUES (47, 8, 'we7_account', 7, 20190618, 'web');
INSERT INTO `ims_stat_visit` VALUES (48, 8, 'we7_api', 17, 20190624, 'web');
INSERT INTO `ims_stat_visit` VALUES (49, 8, 'we7_api', 15, 20190625, 'web');
INSERT INTO `ims_stat_visit` VALUES (50, 0, '', 2, 20190626, 'web');
INSERT INTO `ims_stat_visit` VALUES (51, 8, 'we7_account', 69, 20190626, 'web');
INSERT INTO `ims_stat_visit` VALUES (52, 8, 'we7_api', 3, 20190626, 'web');
INSERT INTO `ims_stat_visit` VALUES (53, 0, '', 2, 20190627, 'web');
INSERT INTO `ims_stat_visit` VALUES (54, 8, 'we7_account', 39, 20190627, 'web');
INSERT INTO `ims_stat_visit` VALUES (55, 8, 'wesite', 2, 20190627, 'app');
INSERT INTO `ims_stat_visit` VALUES (56, 8, 'we7_account', 50, 20190628, 'web');
INSERT INTO `ims_stat_visit` VALUES (57, 8, 'we7_account', 29, 20190701, 'web');

-- ----------------------------
-- Table structure for ims_system_stat_visit
-- ----------------------------
DROP TABLE IF EXISTS `ims_system_stat_visit`;
CREATE TABLE `ims_system_stat_visit`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) NOT NULL,
  `modulename` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `uid` int(10) NOT NULL,
  `displayorder` int(10) NOT NULL,
  `createtime` int(10) NOT NULL,
  `updatetime` int(10) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_uni_account
-- ----------------------------
DROP TABLE IF EXISTS `ims_uni_account`;
CREATE TABLE `ims_uni_account`  (
  `uniacid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `groupid` int(10) NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `default_acid` int(10) UNSIGNED NOT NULL,
  `rank` int(10) NULL DEFAULT NULL,
  `title_initial` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`uniacid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ims_uni_account
-- ----------------------------
INSERT INTO `ims_uni_account` VALUES (8, 0, '测试公众号', '这个是公众号的描述这个是公众号的描述这个是公众号的描述这个是公众号的描述', 6, NULL, 'C');
INSERT INTO `ims_uni_account` VALUES (4, 0, 'del001', '这个是del001的测试', 0, NULL, 'D');
INSERT INTO `ims_uni_account` VALUES (5, 0, 'del001', '这个是del001的测试', 0, NULL, 'D');

-- ----------------------------
-- Table structure for ims_uni_account_group
-- ----------------------------
DROP TABLE IF EXISTS `ims_uni_account_group`;
CREATE TABLE `ims_uni_account_group`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `groupid` int(10) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for ims_uni_account_menus
-- ----------------------------
DROP TABLE IF EXISTS `ims_uni_account_menus`;
CREATE TABLE `ims_uni_account_menus`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `menuid` int(10) UNSIGNED NOT NULL,
  `type` tinyint(3) UNSIGNED NOT NULL,
  `title` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sex` tinyint(3) UNSIGNED NOT NULL,
  `group_id` int(10) NOT NULL,
  `client_platform_type` tinyint(3) UNSIGNED NOT NULL,
  `area` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `data` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL,
  `createtime` int(10) UNSIGNED NOT NULL,
  `isdeleted` tinyint(3) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `menuid`(`menuid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_uni_account_modules
-- ----------------------------
DROP TABLE IF EXISTS `ims_uni_account_modules`;
CREATE TABLE `ims_uni_account_modules`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `module` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `enabled` tinyint(1) UNSIGNED NOT NULL,
  `settings` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `shortcut` tinyint(1) UNSIGNED NOT NULL,
  `displayorder` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_module`(`module`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ims_uni_account_modules
-- ----------------------------
INSERT INTO `ims_uni_account_modules` VALUES (1, 8, 'ants_jizanbao', 1, 'a:10:{s:11:\"noticeemail\";s:0:\"\";s:6:\"mobile\";s:0:\"\";s:8:\"shopname\";s:0:\"\";s:8:\"template\";s:1:\"0\";s:10:\"templateid\";s:0:\"\";s:7:\"address\";s:0:\"\";s:5:\"phone\";s:0:\"\";s:11:\"officialweb\";s:0:\"\";s:6:\"status\";i:0;s:11:\"description\";s:0:\"\";}', 0, 0);

-- ----------------------------
-- Table structure for ims_uni_account_users
-- ----------------------------
DROP TABLE IF EXISTS `ims_uni_account_users`;
CREATE TABLE `ims_uni_account_users`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `uid` int(10) UNSIGNED NOT NULL,
  `role` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `rank` tinyint(3) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_memberid`(`uid`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_uni_group
-- ----------------------------
DROP TABLE IF EXISTS `ims_uni_group`;
CREATE TABLE `ims_uni_group`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `owner_uid` int(10) NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `modules` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `templates` varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `uid` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ims_uni_group
-- ----------------------------
INSERT INTO `ims_uni_group` VALUES (1, 0, '体验套餐服务', 'a:5:{s:7:\"modules\";a:6:{i:0;s:9:\"deam_food\";i:2;s:11:\"yunphp_shop\";i:3;s:8:\"demo_app\";i:4;s:5:\"jizan\";i:5;s:7:\"mon_jgg\";i:6;s:13:\"ants_jizanbao\";}s:5:\"wxapp\";a:6:{i:0;s:9:\"deam_food\";i:2;s:11:\"yunphp_shop\";i:3;s:8:\"demo_app\";i:4;s:5:\"jizan\";i:5;s:7:\"mon_jgg\";i:6;s:13:\"ants_jizanbao\";}s:6:\"webapp\";a:6:{i:0;s:9:\"deam_food\";i:2;s:11:\"yunphp_shop\";i:3;s:8:\"demo_app\";i:4;s:5:\"jizan\";i:5;s:7:\"mon_jgg\";i:6;s:13:\"ants_jizanbao\";}s:5:\"xzapp\";a:6:{i:0;s:9:\"deam_food\";i:2;s:11:\"yunphp_shop\";i:3;s:8:\"demo_app\";i:4;s:5:\"jizan\";i:5;s:7:\"mon_jgg\";i:6;s:13:\"ants_jizanbao\";}s:8:\"phoneapp\";a:6:{i:0;s:9:\"deam_food\";i:2;s:11:\"yunphp_shop\";i:3;s:8:\"demo_app\";i:4;s:5:\"jizan\";i:5;s:7:\"mon_jgg\";i:6;s:13:\"ants_jizanbao\";}}', 'N;', 0, 0);
INSERT INTO `ims_uni_group` VALUES (2, 0, '', 'a:5:{s:7:\"modules\";a:2:{i:0;s:5:\"jizan\";i:1;s:13:\"ants_jizanbao\";}s:5:\"wxapp\";a:2:{i:0;s:5:\"jizan\";i:1;s:13:\"ants_jizanbao\";}s:6:\"webapp\";a:2:{i:0;s:5:\"jizan\";i:1;s:13:\"ants_jizanbao\";}s:5:\"xzapp\";a:2:{i:0;s:5:\"jizan\";i:1;s:13:\"ants_jizanbao\";}s:8:\"phoneapp\";a:2:{i:0;s:5:\"jizan\";i:1;s:13:\"ants_jizanbao\";}}', 'N;', 0, 2);

-- ----------------------------
-- Table structure for ims_uni_settings
-- ----------------------------
DROP TABLE IF EXISTS `ims_uni_settings`;
CREATE TABLE `ims_uni_settings`  (
  `uniacid` int(10) UNSIGNED NOT NULL,
  `passport` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `oauth` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `jsauth_acid` int(10) UNSIGNED NOT NULL,
  `uc` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `notify` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `creditnames` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `creditbehaviors` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `welcome` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `default` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `default_message` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `payment` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `stat` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `default_site` int(10) UNSIGNED NULL DEFAULT NULL,
  `sync` tinyint(3) UNSIGNED NOT NULL,
  `recharge` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tplnotice` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `grouplevel` tinyint(3) UNSIGNED NOT NULL,
  `mcplugin` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `exchange_enable` tinyint(3) UNSIGNED NOT NULL,
  `coupon_type` tinyint(3) UNSIGNED NOT NULL,
  `menuset` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `statistics` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `bind_domain` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `comment_status` tinyint(1) NOT NULL,
  `reply_setting` tinyint(4) NOT NULL,
  `default_module` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `attachment_limit` int(11) NULL DEFAULT NULL,
  `attachment_size` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`uniacid`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ims_uni_settings
-- ----------------------------
INSERT INTO `ims_uni_settings` VALUES (8, '', '', 0, '123', '', 'a:2:{s:7:\"credit1\";a:2:{s:5:\"title\";s:6:\"积分\";s:7:\"enabled\";i:1;}s:7:\"credit2\";a:2:{s:5:\"title\";s:6:\"余额\";s:7:\"enabled\";i:1;}}', 'a:2:{s:8:\"activity\";s:7:\"credit1\";s:8:\"currency\";s:7:\"credit2\";}', '', '', '', '', '', 2, 0, '', '', 0, '', 0, 0, '', '', '', 0, 0, '', NULL, NULL);

-- ----------------------------
-- Table structure for ims_uni_verifycode
-- ----------------------------
DROP TABLE IF EXISTS `ims_uni_verifycode`;
CREATE TABLE `ims_uni_verifycode`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `receiver` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `verifycode` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `total` tinyint(3) UNSIGNED NOT NULL,
  `createtime` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_userapi_cache
-- ----------------------------
DROP TABLE IF EXISTS `ims_userapi_cache`;
CREATE TABLE `ims_userapi_cache`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `key` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `lastupdate` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_userapi_reply
-- ----------------------------
DROP TABLE IF EXISTS `ims_userapi_reply`;
CREATE TABLE `ims_userapi_reply`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `rid` int(10) UNSIGNED NOT NULL,
  `description` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `apiurl` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `token` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `default_text` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cachetime` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `rid`(`rid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ims_userapi_reply
-- ----------------------------
INSERT INTO `ims_userapi_reply` VALUES (1, 1, '\"城市名+天气\", 如: \"北京天气\"', 'weather.php', '', '', 0);
INSERT INTO `ims_userapi_reply` VALUES (2, 2, '\"百科+查询内容\" 或 \"定义+查询内容\", 如: \"百科姚明\", \"定义自行车\"', 'baike.php', '', '', 0);
INSERT INTO `ims_userapi_reply` VALUES (3, 3, '\"@查询内容(中文或英文)\"', 'translate.php', '', '', 0);
INSERT INTO `ims_userapi_reply` VALUES (4, 4, '\"日历\", \"万年历\", \"黄历\"或\"几号\"', 'calendar.php', '', '', 0);
INSERT INTO `ims_userapi_reply` VALUES (5, 5, '\"新闻\"', 'news.php', '', '', 0);
INSERT INTO `ims_userapi_reply` VALUES (6, 6, '\"快递+单号\", 如: \"申通1200041125\"', 'express.php', '', '', 0);

-- ----------------------------
-- Table structure for ims_users
-- ----------------------------
DROP TABLE IF EXISTS `ims_users`;
CREATE TABLE `ims_users`  (
  `uid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `owner_uid` int(10) NOT NULL,
  `groupid` int(10) UNSIGNED NOT NULL,
  `founder_groupid` tinyint(4) NOT NULL,
  `username` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `salt` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` tinyint(3) UNSIGNED NOT NULL,
  `status` tinyint(4) NOT NULL,
  `joindate` int(10) UNSIGNED NOT NULL,
  `joinip` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `lastvisit` int(10) UNSIGNED NOT NULL,
  `lastip` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `starttime` int(10) UNSIGNED NOT NULL,
  `endtime` int(10) UNSIGNED NOT NULL,
  `register_type` tinyint(3) NOT NULL,
  `openid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `welcome_link` tinyint(4) NOT NULL,
  `is_bind` tinyint(1) NOT NULL,
  PRIMARY KEY (`uid`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ims_users
-- ----------------------------
INSERT INTO `ims_users` VALUES (1, 0, 1, 0, 'admin', 'd280bc2853cb3e4b50752bfb0797bed72b05df76', '58d88b36', 0, 0, 1556437680, '', 1561598855, '192.168.0.110', '', 0, 0, 0, '', 0, 0);
INSERT INTO `ims_users` VALUES (2, 0, 0, 0, 'admin000000', '2cb9f0d489321bd20417362c99b4c18d55fa62e2', 'XvZkVLks', 1, 2, 1559122822, '127.0.0.1', 1559122822, '127.0.0.1', '', 1559122822, 0, 0, '', 0, 0);
INSERT INTO `ims_users` VALUES (3, 0, 1, 0, 'admin123', '4544d67a40e43d514a86277a4bb98d824065e99e', 'LfLoUFCt', 1, 2, 1561597402, '192.168.0.110', 1561597435, '192.168.0.110', '', 1561597402, 0, 0, '', 0, 0);

-- ----------------------------
-- Table structure for ims_users_bind
-- ----------------------------
DROP TABLE IF EXISTS `ims_users_bind`;
CREATE TABLE `ims_users_bind`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `bind_sign` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `third_type` tinyint(4) NOT NULL,
  `third_nickname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `bind_sign`(`bind_sign`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_users_failed_login
-- ----------------------------
DROP TABLE IF EXISTS `ims_users_failed_login`;
CREATE TABLE `ims_users_failed_login`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ip` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `count` tinyint(1) UNSIGNED NOT NULL,
  `lastupdate` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ip_username`(`ip`, `username`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_users_founder_group
-- ----------------------------
DROP TABLE IF EXISTS `ims_users_founder_group`;
CREATE TABLE `ims_users_founder_group`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `package` varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `maxaccount` int(10) UNSIGNED NOT NULL,
  `maxsubaccount` int(10) UNSIGNED NOT NULL,
  `timelimit` int(10) UNSIGNED NOT NULL,
  `maxwxapp` int(10) UNSIGNED NOT NULL,
  `maxwebapp` int(10) NOT NULL,
  `maxphoneapp` int(10) NOT NULL,
  `maxxzapp` int(10) NOT NULL,
  `maxaliapp` int(10) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_users_group
-- ----------------------------
DROP TABLE IF EXISTS `ims_users_group`;
CREATE TABLE `ims_users_group`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `owner_uid` int(10) NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `package` varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `maxaccount` int(10) UNSIGNED NOT NULL,
  `maxsubaccount` int(10) UNSIGNED NOT NULL,
  `timelimit` int(10) UNSIGNED NOT NULL,
  `maxwxapp` int(10) UNSIGNED NOT NULL,
  `maxwebapp` int(10) NOT NULL,
  `maxphoneapp` int(10) NOT NULL,
  `maxxzapp` int(10) NOT NULL,
  `maxaliapp` int(10) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_users_invitation
-- ----------------------------
DROP TABLE IF EXISTS `ims_users_invitation`;
CREATE TABLE `ims_users_invitation`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `fromuid` int(10) UNSIGNED NOT NULL,
  `inviteuid` int(10) UNSIGNED NOT NULL,
  `createtime` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_code`(`code`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_users_permission
-- ----------------------------
DROP TABLE IF EXISTS `ims_users_permission`;
CREATE TABLE `ims_users_permission`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `uid` int(10) UNSIGNED NOT NULL,
  `type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `permission` varchar(10000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_users_profile
-- ----------------------------
DROP TABLE IF EXISTS `ims_users_profile`;
CREATE TABLE `ims_users_profile`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uid` int(10) UNSIGNED NOT NULL,
  `createtime` int(10) UNSIGNED NOT NULL,
  `edittime` int(10) NOT NULL,
  `realname` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `nickname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `qq` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mobile` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `fakeid` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `vip` tinyint(3) UNSIGNED NOT NULL,
  `gender` tinyint(1) NOT NULL,
  `birthyear` smallint(6) UNSIGNED NOT NULL,
  `birthmonth` tinyint(3) UNSIGNED NOT NULL,
  `birthday` tinyint(3) UNSIGNED NOT NULL,
  `constellation` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `zodiac` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `telephone` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `idcard` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `studentid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `grade` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `zipcode` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `nationality` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `resideprovince` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `residecity` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `residedist` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `graduateschool` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `company` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `education` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `occupation` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `position` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `revenue` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `affectivestatus` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `lookingfor` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `bloodtype` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `height` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `weight` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `alipay` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `msn` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `taobao` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `site` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `bio` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `interest` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `workerid` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_send_mobile_status` tinyint(3) NOT NULL,
  `send_expire_status` tinyint(3) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ims_users_profile
-- ----------------------------
INSERT INTO `ims_users_profile` VALUES (1, 3, 1561597402, 0, '刘智超', '烨', '', '3104314321', '', '', 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 0);

-- ----------------------------
-- Table structure for ims_video_reply
-- ----------------------------
DROP TABLE IF EXISTS `ims_video_reply`;
CREATE TABLE `ims_video_reply`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `rid` int(10) UNSIGNED NOT NULL,
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mediaid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `createtime` int(10) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `rid`(`rid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_voice_reply
-- ----------------------------
DROP TABLE IF EXISTS `ims_voice_reply`;
CREATE TABLE `ims_voice_reply`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `rid` int(10) UNSIGNED NOT NULL,
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mediaid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `createtime` int(10) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `rid`(`rid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_wechat_attachment
-- ----------------------------
DROP TABLE IF EXISTS `ims_wechat_attachment`;
CREATE TABLE `ims_wechat_attachment`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `acid` int(10) UNSIGNED NOT NULL,
  `uid` int(10) UNSIGNED NOT NULL,
  `filename` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `attachment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `media_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `width` int(10) UNSIGNED NOT NULL,
  `height` int(10) UNSIGNED NOT NULL,
  `type` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `model` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tag` varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `createtime` int(10) UNSIGNED NOT NULL,
  `module_upload_dir` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `group_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `media_id`(`media_id`) USING BTREE,
  INDEX `acid`(`acid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ims_wechat_attachment
-- ----------------------------
INSERT INTO `ims_wechat_attachment` VALUES (1, 8, 6, 1, 'image2.jpg', 'images/8/2019/05/V3Lb8F37n7VB9n3N229BVBJyU98ZiB.jpg', '', 500, 313, 'image', 'perm', '', 1559195685, '', -1);
INSERT INTO `ims_wechat_attachment` VALUES (2, 8, 6, 1, 'tooopen_sl_133620916999.jpg', 'images/8/2019/06/ZgSQaoltgW2PolM3ZGT4SYKQ32YDPg.jpg', '', 300, 393, 'image', 'perm', '', 1559554319, '', -1);

-- ----------------------------
-- Table structure for ims_wechat_news
-- ----------------------------
DROP TABLE IF EXISTS `ims_wechat_news`;
CREATE TABLE `ims_wechat_news`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) UNSIGNED NULL DEFAULT NULL,
  `attach_id` int(10) UNSIGNED NOT NULL,
  `thumb_media_id` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `thumb_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `author` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `digest` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_source_url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `show_cover_pic` tinyint(3) UNSIGNED NOT NULL,
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `displayorder` int(2) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `attach_id`(`attach_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_wxapp_general_analysis
-- ----------------------------
DROP TABLE IF EXISTS `ims_wxapp_general_analysis`;
CREATE TABLE `ims_wxapp_general_analysis`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) NOT NULL,
  `session_cnt` int(10) NOT NULL,
  `visit_pv` int(10) NOT NULL,
  `visit_uv` int(10) NOT NULL,
  `visit_uv_new` int(10) NOT NULL,
  `type` tinyint(2) NOT NULL,
  `stay_time_uv` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `stay_time_session` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `visit_depth` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ref_date` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `ref_date`(`ref_date`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_wxapp_versions
-- ----------------------------
DROP TABLE IF EXISTS `ims_wxapp_versions`;
CREATE TABLE `ims_wxapp_versions`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `multiid` int(10) UNSIGNED NOT NULL,
  `version` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `modules` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `design_method` tinyint(1) NOT NULL,
  `template` int(10) NOT NULL,
  `quickmenu` varchar(2500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `createtime` int(10) NOT NULL,
  `type` int(2) NOT NULL,
  `entry_id` int(11) NOT NULL,
  `appjson` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `default_appjson` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `use_default` tinyint(1) NOT NULL,
  `redirect` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `connection` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_modules` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `version`(`version`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_wxcard_reply
-- ----------------------------
DROP TABLE IF EXISTS `ims_wxcard_reply`;
CREATE TABLE `ims_wxcard_reply`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `rid` int(10) UNSIGNED NOT NULL,
  `title` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `card_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cid` int(10) UNSIGNED NOT NULL,
  `brand_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `logo_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `success` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `error` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `rid`(`rid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_iot_agent
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_iot_agent`;
CREATE TABLE `ims_yunphp_iot_agent`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `regid` int(11) NULL DEFAULT 0,
  `openid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `groupid` int(11) NULL DEFAULT 0,
  `merchno` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `merchname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `salecate` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `desc` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `realname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `mobile` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `status` tinyint(3) NULL DEFAULT 0,
  `accounttime` int(11) NULL DEFAULT 0,
  `diyformdata` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `diyformfields` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `applytime` int(11) NULL DEFAULT 0,
  `accounttotal` int(11) NULL DEFAULT 0,
  `remark` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `jointime` int(11) NULL DEFAULT 0,
  `accountid` int(11) NULL DEFAULT 0,
  `sets` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `payopenid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `payrate` decimal(10, 2) NOT NULL DEFAULT 0.00,
  `isrecommand` tinyint(1) NULL DEFAULT 0,
  `cateid` int(11) NULL DEFAULT 0,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `tel` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `lat` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `lng` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_status`(`status`) USING BTREE,
  INDEX `idx_groupid`(`groupid`) USING BTREE,
  INDEX `idx_regid`(`regid`) USING BTREE,
  INDEX `idx_cateid`(`cateid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_iot_com
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_iot_com`;
CREATE TABLE `ims_yunphp_iot_com`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `message` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `status` tinyint(1) NULL DEFAULT 0 COMMENT '1心跳信息，2注册信息，3通讯信息，4被动返回信息',
  `jqid` int(11) NULL DEFAULT 0,
  `posttime` int(11) NOT NULL DEFAULT 0,
  `client_id` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '记录设备上报的状态信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_iot_fault
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_iot_fault`;
CREATE TABLE `ims_yunphp_iot_fault`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `message` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '故障代码',
  `status` tinyint(3) NULL DEFAULT 0 COMMENT '0为系统自动处理故障无需人工处理，1为故障待处理，2为故障以通报维修人员，3为故障处理中，4为故障处理完成，-1为故障无法修复',
  `jqid` int(11) NULL DEFAULT 0,
  `posttime` int(11) NOT NULL DEFAULT 0 COMMENT '故障上报时间',
  `client_id` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `faulttype` tinyint(3) NOT NULL COMMENT '0为通讯故障，1为耗材补充，2为硬件故障',
  `faultdesc` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '故障描述',
  `postuser` int(11) NOT NULL COMMENT '故障上报人员',
  `displayorder` int(11) NOT NULL DEFAULT 0 COMMENT '优先等级，数字越大越往前显示',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '记录终端上报的注册信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_iot_heartbeat
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_iot_heartbeat`;
CREATE TABLE `ims_yunphp_iot_heartbeat`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `message` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `status` tinyint(1) NULL DEFAULT 0,
  `jqid` int(11) NULL DEFAULT 0,
  `posttime` int(11) NOT NULL DEFAULT 0,
  `client_id` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '记录终端上报的心跳信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_iot_instructions
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_iot_instructions`;
CREATE TABLE `ims_yunphp_iot_instructions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `catename` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `createtime` int(11) NULL DEFAULT 0,
  `status` tinyint(1) NULL DEFAULT 0,
  `displayorder` int(11) NULL DEFAULT 0,
  `typeexplain` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `isrecommand` tinyint(1) NULL DEFAULT 0,
  `instype` tinyint(3) NOT NULL DEFAULT 0 COMMENT '1终端返回的状态,2服务端查询指令,3服务端生产指令,4服务端设置指令',
  `tertypeid` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_iot_message
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_iot_message`;
CREATE TABLE `ims_yunphp_iot_message`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `message` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `status` tinyint(1) NULL DEFAULT 0 COMMENT '1心跳信息，2注册信息，3通讯信息，4被动返回信息',
  `jqid` int(11) NULL DEFAULT 0,
  `posttime` int(11) NOT NULL DEFAULT 0,
  `client_id` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `message_10` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `iswebpushbiaoshi` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '记录终端上报的所有信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_iot_register
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_iot_register`;
CREATE TABLE `ims_yunphp_iot_register`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `message` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `status` tinyint(1) NULL DEFAULT 0,
  `jqid` int(11) NULL DEFAULT 0,
  `posttime` int(11) NOT NULL DEFAULT 0,
  `client_id` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '记录终端上报的注册信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_iot_registerok
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_iot_registerok`;
CREATE TABLE `ims_yunphp_iot_registerok`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `message` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `status` tinyint(1) NULL DEFAULT 0,
  `jqid` int(11) NULL DEFAULT 0,
  `posttime` int(11) NOT NULL DEFAULT 0,
  `client_id` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '记录终端上报的注册信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_iot_terminal
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_iot_terminal`;
CREATE TABLE `ims_yunphp_iot_terminal`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `regid` int(11) NULL DEFAULT 0,
  `openid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `groupid` int(11) NULL DEFAULT 0,
  `merchno` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `terminalid` int(11) NOT NULL COMMENT '终端id',
  `salecate` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `desc` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `realname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `mobile` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `status` tinyint(3) NULL DEFAULT 0,
  `accounttime` int(11) NULL DEFAULT 0,
  `diyformdata` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `diyformfields` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `applytime` int(11) NULL DEFAULT 0,
  `accounttotal` int(11) NULL DEFAULT 0,
  `remark` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `jointime` int(11) NULL DEFAULT 0,
  `accountid` int(11) NULL DEFAULT 0,
  `sets` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `agentuid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `payrate` decimal(10, 2) NOT NULL DEFAULT 0.00,
  `isrecommand` tinyint(1) NULL DEFAULT 0,
  `cateid` int(11) NULL DEFAULT 0,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `tel` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `lat` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `lng` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `short_url` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_status`(`status`) USING BTREE,
  INDEX `idx_groupid`(`groupid`) USING BTREE,
  INDEX `idx_regid`(`regid`) USING BTREE,
  INDEX `idx_cateid`(`cateid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_iot_tertype
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_iot_tertype`;
CREATE TABLE `ims_yunphp_iot_tertype`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `catename` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `createtime` int(11) NULL DEFAULT 0,
  `status` tinyint(1) NULL DEFAULT 0,
  `displayorder` int(11) NULL DEFAULT 0,
  `typeexplain` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `isrecommand` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_message_mass_sign
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_message_mass_sign`;
CREATE TABLE `ims_yunphp_message_mass_sign`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `openid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `nickname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `taskid` int(11) NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT NULL,
  `log` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_message_mass_task
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_message_mass_task`;
CREATE TABLE `ims_yunphp_message_mass_task`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `status` tinyint(1) NULL DEFAULT 0,
  `processnum` int(11) NULL DEFAULT 1,
  `sendnum` int(11) NULL DEFAULT 0,
  `messagetype` tinyint(1) NULL DEFAULT 0,
  `templateid` int(11) NULL DEFAULT 0,
  `resptitle` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `respthumb` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `respdesc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `respurl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sendlimittype` tinyint(1) NULL DEFAULT 0,
  `send_openid` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `send_level` int(11) NULL DEFAULT NULL,
  `send_group` int(11) NULL DEFAULT NULL,
  `send_agentlevel` int(11) NULL DEFAULT NULL,
  `customertype` tinyint(1) NULL DEFAULT 0,
  `resdesc2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `pagecount` int(11) NULL DEFAULT 0,
  `successnum` int(11) NULL DEFAULT 0,
  `failnum` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_message_mass_template
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_message_mass_template`;
CREATE TABLE `ims_yunphp_message_mass_template`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `template_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `first` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `firstcolor` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `data` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `remark` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `remarkcolor` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `createtime` int(11) NULL DEFAULT 0,
  `sendtimes` int(11) NULL DEFAULT 0,
  `sendcount` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_abonus_bill
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_abonus_bill`;
CREATE TABLE `ims_yunphp_shop_abonus_bill`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `billno` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `paytype` int(11) NULL DEFAULT 0,
  `year` int(11) NULL DEFAULT 0,
  `month` int(11) NULL DEFAULT 0,
  `week` int(11) NULL DEFAULT 0,
  `ordercount` int(11) NULL DEFAULT 0,
  `ordermoney` decimal(10, 2) NULL DEFAULT 0.00,
  `paytime` int(11) NULL DEFAULT 0,
  `aagentcount1` int(11) NULL DEFAULT 0,
  `aagentcount2` int(11) NULL DEFAULT 0,
  `aagentcount3` int(11) NULL DEFAULT 0,
  `bonusmoney1` decimal(10, 2) NULL DEFAULT 0.00,
  `bonusmoney_send1` decimal(10, 2) NULL DEFAULT 0.00,
  `bonusmoney_pay1` decimal(10, 2) NULL DEFAULT 0.00,
  `bonusmoney2` decimal(10, 2) NULL DEFAULT 0.00,
  `bonusmoney_send2` decimal(10, 2) NULL DEFAULT 0.00,
  `bonusmoney_pay2` decimal(10, 2) NULL DEFAULT 0.00,
  `bonusmoney3` decimal(10, 2) NULL DEFAULT 0.00,
  `bonusmoney_send3` decimal(10, 2) NULL DEFAULT 0.00,
  `bonusmoney_pay3` decimal(10, 2) NULL DEFAULT 0.00,
  `createtime` int(11) NULL DEFAULT 0,
  `status` tinyint(3) NULL DEFAULT 0,
  `starttime` int(11) NULL DEFAULT 0,
  `endtime` int(11) NULL DEFAULT 0,
  `confirmtime` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_paytype`(`paytype`) USING BTREE,
  INDEX `idx_createtime`(`createtime`) USING BTREE,
  INDEX `idx_paytime`(`paytime`) USING BTREE,
  INDEX `idx_status`(`status`) USING BTREE,
  INDEX `idx_month`(`month`) USING BTREE,
  INDEX `idx_week`(`week`) USING BTREE,
  INDEX `idx_year`(`year`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_abonus_billo
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_abonus_billo`;
CREATE TABLE `ims_yunphp_shop_abonus_billo`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `billid` int(11) NULL DEFAULT 0,
  `orderid` int(11) NULL DEFAULT 0,
  `ordermoney` decimal(10, 2) NULL DEFAULT 0.00,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_billid`(`billid`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for ims_yunphp_shop_abonus_billp
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_abonus_billp`;
CREATE TABLE `ims_yunphp_shop_abonus_billp`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `billid` int(11) NULL DEFAULT 0,
  `openid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `payno` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `paytype` tinyint(3) NULL DEFAULT 0,
  `bonus1` decimal(10, 4) NULL DEFAULT 0.0000,
  `bonus2` decimal(10, 4) NULL DEFAULT 0.0000,
  `bonus3` decimal(10, 4) NULL DEFAULT 0.0000,
  `money1` decimal(10, 2) NULL DEFAULT 0.00,
  `realmoney1` decimal(10, 2) NULL DEFAULT 0.00,
  `paymoney1` decimal(10, 2) NULL DEFAULT 0.00,
  `money2` decimal(10, 2) NULL DEFAULT 0.00,
  `realmoney2` decimal(10, 2) NULL DEFAULT 0.00,
  `paymoney2` decimal(10, 2) NULL DEFAULT 0.00,
  `money3` decimal(10, 2) NULL DEFAULT 0.00,
  `realmoney3` decimal(10, 2) NULL DEFAULT 0.00,
  `paymoney3` decimal(10, 2) NULL DEFAULT 0.00,
  `chargemoney1` decimal(10, 2) NULL DEFAULT 0.00,
  `chargemoney2` decimal(10, 2) NULL DEFAULT 0.00,
  `chargemoney3` decimal(10, 2) NULL DEFAULT 0.00,
  `charge` decimal(10, 2) NULL DEFAULT 0.00,
  `status` tinyint(3) NULL DEFAULT 0,
  `reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `paytime` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_billid`(`billid`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_abonus_level
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_abonus_level`;
CREATE TABLE `ims_yunphp_shop_abonus_level`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `levelname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `bonus1` decimal(10, 4) NULL DEFAULT 0.0000,
  `bonus2` decimal(10, 4) NULL DEFAULT 0.0000,
  `bonus3` decimal(10, 4) NULL DEFAULT 0.0000,
  `ordermoney` decimal(10, 2) NULL DEFAULT 0.00,
  `ordercount` int(11) NULL DEFAULT 0,
  `bonusmoney` decimal(10, 2) NULL DEFAULT 0.00,
  `downcount` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_adv
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_adv`;
CREATE TABLE `ims_yunphp_shop_adv`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `advname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `link` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `thumb` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `displayorder` int(11) NULL DEFAULT 0,
  `enabled` int(11) NULL DEFAULT 0,
  `shopid` int(11) NULL DEFAULT 0,
  `iswxapp` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_enabled`(`enabled`) USING BTREE,
  INDEX `idx_displayorder`(`displayorder`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_area_config
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_area_config`;
CREATE TABLE `ims_yunphp_shop_area_config`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT 0,
  `new_area` tinyint(3) NOT NULL DEFAULT 0,
  `address_street` tinyint(3) NOT NULL DEFAULT 0,
  `createtime` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for ims_yunphp_shop_article
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_article`;
CREATE TABLE `ims_yunphp_shop_article`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '文章标题',
  `resp_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '回复介绍',
  `resp_img` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '回复图片',
  `article_content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `article_category` int(11) NOT NULL DEFAULT 0 COMMENT '文章分类',
  `article_date_v` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '虚拟发布时间',
  `article_date` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '文章发布时间',
  `article_mp` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '公众号',
  `article_author` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '发布作者',
  `article_readnum_v` int(11) NOT NULL DEFAULT 0 COMMENT '虚拟阅读量',
  `article_readnum` int(11) NOT NULL DEFAULT 0 COMMENT '真实阅读量',
  `article_likenum_v` int(11) NOT NULL DEFAULT 0 COMMENT '虚拟点赞数',
  `article_likenum` int(11) NOT NULL DEFAULT 0 COMMENT '真实点赞数',
  `article_linkurl` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '阅读原文链接',
  `article_rule_daynum` int(11) NOT NULL DEFAULT 0 COMMENT '每人每天参与次数',
  `article_rule_allnum` int(11) NOT NULL DEFAULT 0 COMMENT '所有参与次数',
  `article_rule_credit` int(11) NOT NULL DEFAULT 0 COMMENT '增加y积分',
  `article_rule_money` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '增加z余额',
  `page_set_option_nocopy` int(1) NOT NULL DEFAULT 0 COMMENT '页面禁止复制url',
  `page_set_option_noshare_tl` int(1) NOT NULL DEFAULT 0 COMMENT '页面禁止分享至朋友圈',
  `page_set_option_noshare_msg` int(1) NOT NULL DEFAULT 0 COMMENT '页面禁止发送给好友',
  `article_keyword` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '页面关键字',
  `article_report` int(1) NOT NULL DEFAULT 0 COMMENT '举报按钮',
  `product_advs_type` int(1) NOT NULL DEFAULT 0 COMMENT '营销显示产品',
  `product_advs_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '营销产品标题',
  `product_advs_more` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '推广产品底部标题',
  `product_advs_link` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '推广产品底部链接',
  `product_advs` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '营销商品',
  `article_state` int(1) NOT NULL DEFAULT 0,
  `network_attachment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `uniacid` int(11) NOT NULL DEFAULT 0,
  `article_rule_credittotal` int(11) NULL DEFAULT 0,
  `article_rule_moneytotal` decimal(10, 2) NULL DEFAULT 0.00,
  `article_rule_credit2` int(11) NOT NULL DEFAULT 0,
  `article_rule_money2` decimal(10, 2) NOT NULL DEFAULT 0.00,
  `article_rule_creditm` int(11) NOT NULL DEFAULT 0,
  `article_rule_moneym` decimal(10, 2) NOT NULL DEFAULT 0.00,
  `article_rule_creditm2` int(11) NOT NULL DEFAULT 0,
  `article_rule_moneym2` decimal(10, 2) NOT NULL DEFAULT 0.00,
  `article_readtime` int(11) NULL DEFAULT 0,
  `article_areas` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `article_endtime` int(11) NULL DEFAULT 0,
  `article_hasendtime` tinyint(3) NULL DEFAULT 0,
  `displayorder` int(11) NULL DEFAULT 0,
  `article_keyword2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `article_advance` int(11) NULL DEFAULT 0,
  `article_virtualadd` tinyint(3) NULL DEFAULT 0,
  `article_visit` tinyint(3) NULL DEFAULT 0,
  `article_visit_level` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `article_visit_tip` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_article_title`(`article_title`) USING BTREE,
  INDEX `idx_article_content`(`article_content`(10)) USING BTREE,
  INDEX `idx_article_keyword`(`article_keyword`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '营销文章' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_article_category
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_article_category`;
CREATE TABLE `ims_yunphp_shop_article_category`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '分类名称',
  `uniacid` int(11) NOT NULL DEFAULT 0,
  `displayorder` int(11) NOT NULL DEFAULT 0,
  `isshow` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_category_name`(`category_name`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '营销表单分类' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_article_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_article_log`;
CREATE TABLE `ims_yunphp_shop_article_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `aid` int(11) NOT NULL DEFAULT 0 COMMENT '文章id',
  `read` int(11) NOT NULL DEFAULT 0,
  `like` int(11) NOT NULL DEFAULT 0,
  `openid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户openid',
  `uniacid` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_aid`(`aid`) USING BTREE,
  INDEX `idx_openid`(`openid`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 621 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '点赞/阅读记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_article_report
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_article_report`;
CREATE TABLE `ims_yunphp_shop_article_report`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` int(11) NOT NULL DEFAULT 0,
  `openid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `aid` int(11) NULL DEFAULT 0,
  `cate` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `cons` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `uniacid` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户举报记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_article_share
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_article_share`;
CREATE TABLE `ims_yunphp_shop_article_share`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `aid` int(11) NOT NULL DEFAULT 0,
  `share_user` int(11) NOT NULL DEFAULT 0 COMMENT '分享人',
  `click_user` int(11) NOT NULL DEFAULT 0 COMMENT '点击人',
  `click_date` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '执行时间',
  `add_credit` int(11) NOT NULL DEFAULT 0 COMMENT '添加的积分',
  `add_money` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '添加的余额',
  `uniacid` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_aid`(`aid`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 63 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户分享数据' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_article_sys
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_article_sys`;
CREATE TABLE `ims_yunphp_shop_article_sys`  (
  `uniacid` int(11) NOT NULL DEFAULT 0,
  `article_message` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `article_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '标题',
  `article_image` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '图片',
  `article_shownum` int(11) NOT NULL DEFAULT 0 COMMENT '每页数量',
  `article_keyword` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '关键字',
  `article_temp` int(11) NOT NULL DEFAULT 0,
  `article_source` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`uniacid`) USING BTREE,
  INDEX `idx_article_message`(`article_message`) USING BTREE,
  INDEX `idx_article_keyword`(`article_keyword`) USING BTREE,
  INDEX `idx_article_title`(`article_title`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文章设置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_assistant
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_assistant`;
CREATE TABLE `ims_yunphp_shop_assistant`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `logno` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `eno` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '兑换码',
  `openid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `goodsid` int(11) NULL DEFAULT 0,
  `createtime` int(11) NULL DEFAULT 0,
  `status` tinyint(3) NULL DEFAULT 0 COMMENT '0 只生成记录未参加 1 未中奖 2 已中奖 3 已发奖',
  `paystatus` tinyint(3) NULL DEFAULT 0 COMMENT '支付状态 -1 不需要支付 0 未支付 1 已支付',
  `paytype` tinyint(3) NULL DEFAULT -1 COMMENT '支付类型 -1 不需要支付 0 余额 1 微信',
  `dispatchstatus` tinyint(3) NULL DEFAULT 0 COMMENT '运费状态 -1 不需要运费 0 未支付 1 已支付',
  `creditpay` tinyint(3) NULL DEFAULT 0 COMMENT '积分支付 0 未支付 1 已支付',
  `addressid` int(11) NULL DEFAULT 0 COMMENT '收货地址',
  `dispatchno` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '运费支付单号',
  `usetime` int(11) NULL DEFAULT 0,
  `express` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `expresssn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `expresscom` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `verifyopenid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `transid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `dispatchtransid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `storeid` int(11) NULL DEFAULT 0,
  `realname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `mobile` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `couponid` int(11) NULL DEFAULT 0,
  `dupdate1` tinyint(3) NULL DEFAULT 0,
  `address` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `optionid` int(11) NOT NULL DEFAULT 0,
  `time_send` int(11) NOT NULL DEFAULT 0,
  `time_finish` int(11) NOT NULL DEFAULT 0,
  `iscomment` tinyint(3) NOT NULL DEFAULT 0,
  `dispatchtime` int(11) NOT NULL DEFAULT 0,
  `verifynum` int(11) NOT NULL DEFAULT 1,
  `verifytime` int(11) NOT NULL DEFAULT 0,
  `merchid` int(11) NOT NULL DEFAULT 0,
  `goodsname` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sendtime` int(11) NOT NULL DEFAULT 0 COMMENT '上传时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_assistant_adv
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_assistant_adv`;
CREATE TABLE `ims_yunphp_shop_assistant_adv`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `advname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `link` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `thumb` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `displayorder` int(11) NULL DEFAULT 0,
  `enabled` int(11) NULL DEFAULT 0,
  `merchid` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_enabled`(`enabled`) USING BTREE,
  INDEX `idx_displayorder`(`displayorder`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_author_bill
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_author_bill`;
CREATE TABLE `ims_yunphp_shop_author_bill`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `billno` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `paytype` int(11) NULL DEFAULT 0,
  `year` int(11) NULL DEFAULT 0,
  `month` int(11) NULL DEFAULT 0,
  `week` int(11) NULL DEFAULT 0,
  `ordercount` int(11) NULL DEFAULT 0,
  `ordermoney` decimal(10, 2) NULL DEFAULT 0.00,
  `bonusordermoney` decimal(10, 2) NULL DEFAULT 0.00,
  `bonusrate` decimal(10, 2) NULL DEFAULT 0.00,
  `bonusmoney` decimal(10, 2) NULL DEFAULT 0.00,
  `bonusmoney_send` decimal(10, 2) NULL DEFAULT 0.00,
  `bonusmoney_pay` decimal(10, 2) NULL DEFAULT 0.00,
  `paytime` int(11) NULL DEFAULT 0,
  `partnercount` int(11) NULL DEFAULT 0,
  `createtime` int(11) NULL DEFAULT 0,
  `status` tinyint(3) NULL DEFAULT 0,
  `starttime` int(11) NULL DEFAULT 0,
  `endtime` int(11) NULL DEFAULT 0,
  `confirmtime` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_paytype`(`paytype`) USING BTREE,
  INDEX `idx_createtime`(`createtime`) USING BTREE,
  INDEX `idx_paytime`(`paytime`) USING BTREE,
  INDEX `idx_status`(`status`) USING BTREE,
  INDEX `idx_month`(`month`) USING BTREE,
  INDEX `idx_week`(`week`) USING BTREE,
  INDEX `idx_year`(`year`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_author_billo
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_author_billo`;
CREATE TABLE `ims_yunphp_shop_author_billo`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `billid` int(11) NULL DEFAULT 0,
  `authorid` int(11) NULL DEFAULT NULL,
  `orderid` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `ordermoney` decimal(10, 2) NULL DEFAULT 0.00,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_billid`(`billid`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_author_billp
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_author_billp`;
CREATE TABLE `ims_yunphp_shop_author_billp`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `billid` int(11) NULL DEFAULT 0,
  `openid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `payno` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `paytype` tinyint(3) NULL DEFAULT 0,
  `bonus` decimal(10, 2) NULL DEFAULT 0.00,
  `money` decimal(10, 2) NULL DEFAULT 0.00,
  `realmoney` decimal(10, 2) NULL DEFAULT 0.00,
  `paymoney` decimal(10, 2) NULL DEFAULT 0.00,
  `charge` decimal(10, 2) NULL DEFAULT 0.00,
  `chargemoney` decimal(10, 2) NULL DEFAULT 0.00,
  `status` tinyint(3) NULL DEFAULT 0,
  `reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `paytime` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_billid`(`billid`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_author_level
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_author_level`;
CREATE TABLE `ims_yunphp_shop_author_level`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `levelname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `bonus` decimal(10, 4) NULL DEFAULT 0.0000,
  `ordermoney` decimal(10, 2) NULL DEFAULT 0.00,
  `ordercount` int(11) NULL DEFAULT 0,
  `commissionmoney` decimal(10, 2) NULL DEFAULT 0.00,
  `bonusmoney` decimal(10, 2) NULL DEFAULT 0.00,
  `downcount` int(11) NULL DEFAULT 0,
  `bonus_fg` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_author_team
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_author_team`;
CREATE TABLE `ims_yunphp_shop_author_team`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `teamno` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `year` int(11) NULL DEFAULT 0,
  `month` int(11) NULL DEFAULT 0,
  `team_count` int(11) NULL DEFAULT 0,
  `team_ids` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `status` tinyint(1) NULL DEFAULT 0,
  `createtime` int(11) NULL DEFAULT 0,
  `paytime` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `teamno`(`teamno`) USING BTREE,
  INDEX `year`(`year`) USING BTREE,
  INDEX `month`(`month`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `createtime`(`createtime`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_author_team_pay
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_author_team_pay`;
CREATE TABLE `ims_yunphp_shop_author_team_pay`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `teamid` int(11) NULL DEFAULT 0,
  `mid` int(11) NULL DEFAULT 0,
  `payno` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `money` decimal(10, 2) NULL DEFAULT 0.00,
  `paymoney` decimal(10, 2) NULL DEFAULT 0.00,
  `paytime` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_teamid`(`teamid`) USING BTREE,
  INDEX `idx_mid`(`mid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_banner
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_banner`;
CREATE TABLE `ims_yunphp_shop_banner`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `bannername` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `link` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `thumb` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `displayorder` int(11) NULL DEFAULT 0,
  `enabled` int(11) NULL DEFAULT 0,
  `shopid` int(11) NULL DEFAULT 0,
  `iswxapp` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_enabled`(`enabled`) USING BTREE,
  INDEX `idx_displayorder`(`displayorder`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_bargain_account
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_bargain_account`;
CREATE TABLE `ims_yunphp_shop_bargain_account`  (
  `id` int(11) NOT NULL,
  `mall_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `banner` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mall_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mall_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mall_logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `message` int(11) NULL DEFAULT 0,
  `partin` int(11) NULL DEFAULT 0,
  `rule` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `end_message` int(11) NULL DEFAULT 0,
  `follow_swi` tinyint(1) NOT NULL DEFAULT 0,
  `sharestyle` tinyint(1) NOT NULL DEFAULT 0
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_bargain_actor
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_bargain_actor`;
CREATE TABLE `ims_yunphp_shop_bargain_actor`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL,
  `now_price` decimal(9, 2) NOT NULL,
  `created_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `bargain_times` int(10) NOT NULL,
  `openid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `nickname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `head_image` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `bargain_price` decimal(9, 2) NOT NULL,
  `status` tinyint(2) NOT NULL,
  `account_id` int(11) NOT NULL,
  `initiate` tinyint(4) NOT NULL DEFAULT 0,
  `order` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_bargain_goods
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_bargain_goods`;
CREATE TABLE `ims_yunphp_shop_bargain_goods`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `goods_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `end_price` decimal(10, 2) NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `status` tinyint(2) NOT NULL,
  `type` tinyint(2) NOT NULL,
  `user_set` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `rule` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `act_times` int(11) NOT NULL,
  `mode` tinyint(4) NOT NULL,
  `total_time` int(11) NOT NULL,
  `each_time` int(11) NOT NULL,
  `time_limit` int(11) NOT NULL,
  `probability` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `custom` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `maximum` int(11) NULL DEFAULT NULL,
  `initiate` tinyint(4) NOT NULL DEFAULT 0,
  `myself` tinyint(3) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `goods_id`(`goods_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_bargain_record
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_bargain_record`;
CREATE TABLE `ims_yunphp_shop_bargain_record`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `actor_id` int(11) NOT NULL,
  `bargain_price` decimal(9, 2) NOT NULL,
  `openid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `nickname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `head_image` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `bargain_time` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_business_bill
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_business_bill`;
CREATE TABLE `ims_yunphp_shop_business_bill`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `billno` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `paytype` int(11) NULL DEFAULT 0,
  `year` int(11) NULL DEFAULT 0,
  `month` int(11) NULL DEFAULT 0,
  `week` int(11) NULL DEFAULT 0,
  `ordercount` int(11) NULL DEFAULT 0,
  `ordermoney` decimal(10, 2) NULL DEFAULT 0.00,
  `bonusmoney` decimal(10, 2) NULL DEFAULT 0.00,
  `bonusmoney_send` decimal(10, 2) NULL DEFAULT 0.00,
  `bonusmoney_pay` decimal(10, 2) NULL DEFAULT 0.00,
  `paytime` int(11) NULL DEFAULT 0,
  `partnercount` int(11) NULL DEFAULT 0,
  `createtime` int(11) NULL DEFAULT 0,
  `status` tinyint(3) NULL DEFAULT 0,
  `starttime` int(11) NULL DEFAULT 0,
  `endtime` int(11) NULL DEFAULT 0,
  `confirmtime` int(11) NULL DEFAULT 0,
  `bonusordermoney` decimal(10, 2) NULL DEFAULT 0.00,
  `bonusrate` decimal(10, 2) NULL DEFAULT 0.00,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_paytype`(`paytype`) USING BTREE,
  INDEX `idx_createtime`(`createtime`) USING BTREE,
  INDEX `idx_paytime`(`paytime`) USING BTREE,
  INDEX `idx_status`(`status`) USING BTREE,
  INDEX `idx_month`(`month`) USING BTREE,
  INDEX `idx_week`(`week`) USING BTREE,
  INDEX `idx_year`(`year`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_business_level
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_business_level`;
CREATE TABLE `ims_yunphp_shop_business_level`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `levelname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `bonus` decimal(10, 4) NULL DEFAULT 0.0000,
  `ordermoney` decimal(10, 2) NULL DEFAULT 0.00,
  `ordercount` int(11) NULL DEFAULT 0,
  `commissionmoney` decimal(10, 2) NULL DEFAULT 0.00,
  `bonusmoney` decimal(10, 2) NULL DEFAULT 0.00,
  `downcount` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_business_order
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_business_order`;
CREATE TABLE `ims_yunphp_shop_business_order`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单号',
  `goods_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商品ID',
  `goods_type` int(11) NOT NULL DEFAULT 11 COMMENT '商品类型',
  `user_id` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户openid',
  `addtime` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `goods_id`(`goods_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ims_yunphp_shop_business_order_handle
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_business_order_handle`;
CREATE TABLE `ims_yunphp_shop_business_order_handle`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderid` int(11) NOT NULL COMMENT '企业服务订单表id',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作员',
  `operatingtime` int(11) NOT NULL DEFAULT 0 COMMENT '操作时间',
  `handle` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '办理事项',
  `addtime` int(11) NOT NULL DEFAULT 0 COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ims_yunphp_shop_carrier
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_carrier`;
CREATE TABLE `ims_yunphp_shop_carrier`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `realname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `mobile` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `deleted` tinyint(1) NULL DEFAULT 0,
  `createtime` int(11) NULL DEFAULT 0,
  `displayorder` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_deleted`(`deleted`) USING BTREE,
  INDEX `idx_createtime`(`createtime`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_cashier_category
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_cashier_category`;
CREATE TABLE `ims_yunphp_shop_cashier_category`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `catename` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `createtime` int(11) NULL DEFAULT 0,
  `status` tinyint(1) NULL DEFAULT 0,
  `displayorder` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_cashier_clearing
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_cashier_clearing`;
CREATE TABLE `ims_yunphp_shop_cashier_clearing`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `cashierid` int(11) NULL DEFAULT 0,
  `clearno` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `status` tinyint(3) NULL DEFAULT 0,
  `money` decimal(10, 2) NULL DEFAULT 0.00,
  `realmoney` decimal(10, 2) NULL DEFAULT 0.00,
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `orderids` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `createtime` int(11) NULL DEFAULT 0,
  `paytime` int(11) NULL DEFAULT 0,
  `deleted` tinyint(3) NULL DEFAULT 0,
  `paytype` tinyint(1) NULL DEFAULT 0,
  `payinfo` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `charge` decimal(10, 2) NULL DEFAULT 0.00,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `storeid`(`cashierid`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `createtime`(`createtime`) USING BTREE,
  INDEX `deleted`(`deleted`) USING BTREE,
  INDEX `clearno`(`clearno`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_cashier_goods
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_cashier_goods`;
CREATE TABLE `ims_yunphp_shop_cashier_goods`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `cashierid` int(11) NULL DEFAULT 0,
  `createtime` int(10) UNSIGNED NULL DEFAULT 0,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `categoryid` tinyint(1) NULL DEFAULT 0,
  `price` decimal(10, 2) NULL DEFAULT 0.00,
  `total` int(11) NULL DEFAULT 0,
  `status` tinyint(1) NULL DEFAULT 0,
  `goodssn` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `cashierid`(`cashierid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_cashier_goods_category
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_cashier_goods_category`;
CREATE TABLE `ims_yunphp_shop_cashier_goods_category`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `cashierid` int(11) NULL DEFAULT 0,
  `catename` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `createtime` int(11) NULL DEFAULT 0,
  `status` tinyint(1) NULL DEFAULT 0,
  `displayorder` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_cashierid`(`cashierid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_cashier_operator
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_cashier_operator`;
CREATE TABLE `ims_yunphp_shop_cashier_operator`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `cashierid` int(11) NULL DEFAULT 0,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `manageopenid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `salt` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `perm` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `createtime` int(10) UNSIGNED NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `cashierid`(`cashierid`) USING BTREE,
  INDEX `manageopenid`(`manageopenid`) USING BTREE,
  INDEX `username`(`username`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_cashier_order
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_cashier_order`;
CREATE TABLE `ims_yunphp_shop_cashier_order`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `ordersn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `price` decimal(10, 2) NULL DEFAULT 0.00,
  `openid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `payopenid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `createtime` int(10) UNSIGNED NULL DEFAULT 0,
  `status` tinyint(4) NULL DEFAULT 0,
  `paytime` int(10) UNSIGNED NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_cashier_pay_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_cashier_pay_log`;
CREATE TABLE `ims_yunphp_shop_cashier_pay_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `cashierid` int(11) NULL DEFAULT 0,
  `operatorid` int(11) NULL DEFAULT 0,
  `openid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `paytype` tinyint(3) NULL DEFAULT NULL,
  `logno` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `createtime` int(11) NULL DEFAULT 0,
  `status` int(11) NULL DEFAULT 0,
  `money` decimal(10, 2) NULL DEFAULT 0.00,
  `paytime` int(11) NULL DEFAULT 0,
  `is_applypay` tinyint(1) NULL DEFAULT 0,
  `randommoney` decimal(10, 2) NULL DEFAULT 0.00,
  `enough` decimal(10, 2) NULL DEFAULT 0.00,
  `mobile` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `deduction` decimal(10, 2) NULL DEFAULT 0.00,
  `discountmoney` decimal(10, 2) NULL DEFAULT 0.00,
  `discount` decimal(5, 2) NULL DEFAULT 0.00,
  `isgoods` tinyint(1) NULL DEFAULT 0,
  `orderid` int(11) NULL DEFAULT 0,
  `orderprice` decimal(10, 2) NULL DEFAULT 0.00,
  `goodsprice` decimal(10, 2) NULL DEFAULT 0.00,
  `couponpay` decimal(10, 2) NULL DEFAULT 0.00,
  `payopenid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `nosalemoney` decimal(10, 2) NULL DEFAULT 0.00,
  `coupon` int(11) NULL DEFAULT 0,
  `usecoupon` int(11) NULL DEFAULT 0,
  `usecouponprice` decimal(10, 2) NULL DEFAULT 0.00,
  `present_credit1` int(11) NULL DEFAULT 0,
  `refundsn` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `refunduser` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_type`(`paytype`) USING BTREE,
  INDEX `idx_createtime`(`createtime`) USING BTREE,
  INDEX `idx_status`(`status`) USING BTREE,
  INDEX `idx_storeid`(`cashierid`) USING BTREE,
  INDEX `idx_logno`(`logno`) USING BTREE,
  INDEX `is_applypay`(`is_applypay`) USING BTREE,
  INDEX `orderid`(`orderid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_cashier_pay_log_goods
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_cashier_pay_log_goods`;
CREATE TABLE `ims_yunphp_shop_cashier_pay_log_goods`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cashierid` int(11) NULL DEFAULT 0,
  `logid` int(11) NULL DEFAULT 0,
  `goodsid` int(11) NULL DEFAULT 0,
  `price` decimal(10, 2) NULL DEFAULT 0.00,
  `total` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `logid`(`logid`) USING BTREE,
  INDEX `goodsid`(`goodsid`) USING BTREE,
  INDEX `cashierid`(`cashierid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for ims_yunphp_shop_cashier_qrcode
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_cashier_qrcode`;
CREATE TABLE `ims_yunphp_shop_cashier_qrcode`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `cashierid` int(11) NULL DEFAULT 0,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `goodstitle` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `money` decimal(10, 2) NULL DEFAULT 0.00,
  `createtime` int(10) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `cashierid`(`cashierid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_cashier_user
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_cashier_user`;
CREATE TABLE `ims_yunphp_shop_cashier_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `storeid` int(11) NULL DEFAULT 0,
  `merchid` int(11) NULL DEFAULT 0,
  `setmeal` tinyint(3) NULL DEFAULT 0,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `manageopenid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `isopen_commission` tinyint(1) NULL DEFAULT 0,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `mobile` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `categoryid` int(11) NULL DEFAULT 0,
  `wechat_status` tinyint(1) NULL DEFAULT 0,
  `wechatpay` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `alipay_status` tinyint(1) NULL DEFAULT 0,
  `alipay` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `withdraw` decimal(10, 2) NULL DEFAULT 0.00,
  `openid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `diyformfields` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `diyformdata` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `createtime` int(11) NULL DEFAULT 0,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `salt` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `lifetimestart` int(10) UNSIGNED NULL DEFAULT 0,
  `lifetimeend` int(10) UNSIGNED NULL DEFAULT 0,
  `status` tinyint(1) NULL DEFAULT 0,
  `set` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `deleted` tinyint(1) NULL DEFAULT 0,
  `can_withdraw` tinyint(1) NULL DEFAULT 0,
  `show_paytype` tinyint(1) NULL DEFAULT 0,
  `couponid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `management` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `openid`(`manageopenid`) USING BTREE,
  INDEX `username`(`username`) USING BTREE,
  INDEX `status`(`status`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_category
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_category`;
CREATE TABLE `ims_yunphp_shop_category`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0 COMMENT '所属帐号',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类名称',
  `thumb` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类图片',
  `parentid` int(11) NULL DEFAULT 0 COMMENT '上级分类ID,0为第一级',
  `isrecommand` int(10) NULL DEFAULT 0,
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类介绍',
  `displayorder` tinyint(3) UNSIGNED NULL DEFAULT 0 COMMENT '排序',
  `enabled` tinyint(1) NULL DEFAULT 1 COMMENT '是否开启',
  `ishome` tinyint(3) NULL DEFAULT 0,
  `advimg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `advurl` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `level` tinyint(3) NULL DEFAULT NULL,
  `type` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_displayorder`(`displayorder`) USING BTREE,
  INDEX `idx_enabled`(`enabled`) USING BTREE,
  INDEX `idx_parentid`(`parentid`) USING BTREE,
  INDEX `idx_isrecommand`(`isrecommand`) USING BTREE,
  INDEX `idx_ishome`(`ishome`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1174 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_clubs_activities
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_clubs_activities`;
CREATE TABLE `ims_yunphp_shop_clubs_activities`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT NULL,
  `days` int(11) NOT NULL DEFAULT 0,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `data` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `keyword` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `resptype` tinyint(1) NOT NULL DEFAULT 0,
  `resptext` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `resptitle` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `respthumb` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `respdesc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `respurl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createtime` int(11) NULL DEFAULT NULL,
  `waittext` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `oktext` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `scantext` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `beagent` tinyint(1) NOT NULL DEFAULT 0,
  `bedown` tinyint(1) NOT NULL DEFAULT 0,
  `timestart` int(11) NULL DEFAULT NULL,
  `timeend` int(11) NULL DEFAULT NULL,
  `is_repeat` tinyint(1) NULL DEFAULT 0,
  `getposter` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT NULL,
  `starttext` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `endtext` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `reward_data` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `needcount` int(11) NOT NULL DEFAULT 0,
  `is_delete` tinyint(1) NOT NULL DEFAULT 0,
  `poster_type` tinyint(1) NULL DEFAULT 1,
  `reward_days` int(11) NULL DEFAULT 0,
  `titleicon` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `poster_banner` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `is_goods` tinyint(1) NULL DEFAULT 0,
  `autoposter` tinyint(1) NOT NULL DEFAULT 0,
  `thumb_first` tinyint(3) NOT NULL DEFAULT 0,
  `lng` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `lat` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `province` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `city` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `area` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `realname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `mobile` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `buyshow` tinyint(1) NULL DEFAULT 0,
  `price` decimal(10, 2) NULL DEFAULT 0.00,
  `subtitle` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `parking` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `thumb_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `thumb` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `atimestart` int(11) NULL DEFAULT 0,
  `atimeend` int(11) NULL DEFAULT 0,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `buycontent` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_clubs_bill
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_clubs_bill`;
CREATE TABLE `ims_yunphp_shop_clubs_bill`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `billno` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `paytype` int(11) NULL DEFAULT 0,
  `year` int(11) NULL DEFAULT 0,
  `month` int(11) NULL DEFAULT 0,
  `week` int(11) NULL DEFAULT 0,
  `ordercount` int(11) NULL DEFAULT 0,
  `ordermoney` decimal(10, 2) NULL DEFAULT 0.00,
  `bonusmoney` decimal(10, 2) NULL DEFAULT 0.00,
  `bonusmoney_send` decimal(10, 2) NULL DEFAULT 0.00,
  `bonusmoney_pay` decimal(10, 2) NULL DEFAULT 0.00,
  `paytime` int(11) NULL DEFAULT 0,
  `partnercount` int(11) NULL DEFAULT 0,
  `createtime` int(11) NULL DEFAULT 0,
  `status` tinyint(3) NULL DEFAULT 0,
  `starttime` int(11) NULL DEFAULT 0,
  `endtime` int(11) NULL DEFAULT 0,
  `confirmtime` int(11) NULL DEFAULT 0,
  `bonusordermoney` decimal(10, 2) NULL DEFAULT 0.00,
  `bonusrate` decimal(10, 2) NULL DEFAULT 0.00,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_paytype`(`paytype`) USING BTREE,
  INDEX `idx_createtime`(`createtime`) USING BTREE,
  INDEX `idx_paytime`(`paytime`) USING BTREE,
  INDEX `idx_status`(`status`) USING BTREE,
  INDEX `idx_month`(`month`) USING BTREE,
  INDEX `idx_week`(`week`) USING BTREE,
  INDEX `idx_year`(`year`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_clubs_level
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_clubs_level`;
CREATE TABLE `ims_yunphp_shop_clubs_level`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `levelname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `bonus` decimal(10, 4) NULL DEFAULT 0.0000,
  `ordermoney` decimal(10, 2) NULL DEFAULT 0.00,
  `ordercount` int(11) NULL DEFAULT 0,
  `commissionmoney` decimal(10, 2) NULL DEFAULT 0.00,
  `bonusmoney` decimal(10, 2) NULL DEFAULT 0.00,
  `downcount` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_commission_apply
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_commission_apply`;
CREATE TABLE `ims_yunphp_shop_commission_apply`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `applyno` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `mid` int(11) NULL DEFAULT 0 COMMENT '会员ID',
  `type` tinyint(3) NULL DEFAULT 0 COMMENT '0 余额 1 微信',
  `orderids` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `commission` decimal(10, 2) NULL DEFAULT 0.00,
  `commission_pay` decimal(10, 2) NULL DEFAULT 0.00,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `status` tinyint(3) NULL DEFAULT 0 COMMENT '-1 无效 0 未知 1 正在申请 2 审核通过 3 已经打款',
  `applytime` int(11) NULL DEFAULT 0,
  `checktime` int(11) NULL DEFAULT 0,
  `paytime` int(11) NULL DEFAULT 0,
  `invalidtime` int(11) NULL DEFAULT 0,
  `refusetime` int(11) NULL DEFAULT 0,
  `realmoney` decimal(10, 2) NULL DEFAULT 0.00,
  `charge` decimal(10, 2) NULL DEFAULT 0.00,
  `deductionmoney` decimal(10, 2) NULL DEFAULT 0.00,
  `beginmoney` decimal(10, 2) NULL DEFAULT 0.00,
  `endmoney` decimal(10, 2) NULL DEFAULT 0.00,
  `alipay` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `bankname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `bankcard` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `realname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `repurchase` decimal(10, 2) NULL DEFAULT 0.00,
  `alipay1` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `bankname1` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `bankcard1` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `sendmoney` decimal(10, 2) NULL DEFAULT 0.00,
  `senddata` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_mid`(`mid`) USING BTREE,
  INDEX `idx_checktime`(`checktime`) USING BTREE,
  INDEX `idx_paytime`(`paytime`) USING BTREE,
  INDEX `idx_applytime`(`applytime`) USING BTREE,
  INDEX `idx_status`(`status`) USING BTREE,
  INDEX `idx_invalidtime`(`invalidtime`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_commission_bank
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_commission_bank`;
CREATE TABLE `ims_yunphp_shop_commission_bank`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT 0,
  `bankname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `displayorder` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_commission_bonustask
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_commission_bonustask`;
CREATE TABLE `ims_yunphp_shop_commission_bonustask`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT NULL,
  `days` int(11) NOT NULL DEFAULT 0,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `data` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `keyword` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `resptype` tinyint(1) NOT NULL DEFAULT 0,
  `resptext` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `resptitle` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `respthumb` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `respdesc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `respurl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createtime` int(11) NULL DEFAULT NULL,
  `waittext` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `oktext` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `scantext` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `beagent` tinyint(1) NOT NULL DEFAULT 0,
  `bedown` tinyint(1) NOT NULL DEFAULT 0,
  `beown` tinyint(1) NOT NULL DEFAULT 0,
  `timestart` int(11) NULL DEFAULT NULL,
  `timeend` int(11) NULL DEFAULT NULL,
  `is_repeat` tinyint(1) NULL DEFAULT 0,
  `getposter` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT NULL,
  `starttext` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `endtext` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `reward_data` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `needcount` tinyint(3) NOT NULL DEFAULT 0,
  `is_delete` tinyint(1) NOT NULL DEFAULT 0,
  `poster_type` tinyint(1) NULL DEFAULT 1,
  `reward_days` int(11) NULL DEFAULT 0,
  `titleicon` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `poster_banner` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `is_goods` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_commission_bonustask_join
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_commission_bonustask_join`;
CREATE TABLE `ims_yunphp_shop_commission_bonustask_join`  (
  `join_id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT 0,
  `join_user` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `bonustask_id` int(11) NOT NULL DEFAULT 0,
  `bonustask_type` tinyint(1) NOT NULL DEFAULT 0,
  `needcount` int(11) NOT NULL DEFAULT 0,
  `completecount` int(11) NOT NULL DEFAULT 0,
  `reward_data` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `is_reward` tinyint(1) NOT NULL DEFAULT 0,
  `failtime` int(11) NOT NULL DEFAULT 0,
  `addtime` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`join_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 50 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_commission_bonustask_joiner
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_commission_bonustask_joiner`;
CREATE TABLE `ims_yunphp_shop_commission_bonustask_joiner`  (
  `complete_id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT 0,
  `bonustask_user` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `joiner_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `join_id` int(11) NOT NULL DEFAULT 0,
  `bonustask_id` int(11) NOT NULL DEFAULT 0,
  `bonustask_type` tinyint(1) NOT NULL DEFAULT 0,
  `join_status` tinyint(1) NOT NULL DEFAULT 1,
  `addtime` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`complete_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 577 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_commission_bonustask_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_commission_bonustask_log`;
CREATE TABLE `ims_yunphp_shop_commission_bonustask_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT 0,
  `openid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `from_openid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `join_id` int(11) NOT NULL DEFAULT 0,
  `bonustaskid` int(11) NULL DEFAULT 0,
  `bonustask_type` tinyint(1) NOT NULL DEFAULT 0,
  `subdata` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `recdata` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `createtime` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 577 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_commission_bonustaskadv
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_commission_bonustaskadv`;
CREATE TABLE `ims_yunphp_shop_commission_bonustaskadv`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `advname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `link` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `thumb` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `displayorder` int(11) NULL DEFAULT 0,
  `enabled` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_commission_bonustaskset
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_commission_bonustaskset`;
CREATE TABLE `ims_yunphp_shop_commission_bonustaskset`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT 0,
  `data` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `addtime` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_commission_clickcount
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_commission_clickcount`;
CREATE TABLE `ims_yunphp_shop_commission_clickcount`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `openid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `from_openid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `clicktime` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_openid`(`openid`) USING BTREE,
  INDEX `idx_from_openid`(`from_openid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 301 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_commission_level
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_commission_level`;
CREATE TABLE `ims_yunphp_shop_commission_level`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `levelname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `commission1` decimal(10, 2) NULL DEFAULT 0.00,
  `commission2` decimal(10, 2) NULL DEFAULT 0.00,
  `commission3` decimal(10, 2) NULL DEFAULT 0.00,
  `commissionmoney` decimal(10, 2) NULL DEFAULT 0.00,
  `ordermoney` decimal(10, 2) NULL DEFAULT 0.00,
  `downcount` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `ordercount` int(11) NULL DEFAULT 0,
  `withdraw` decimal(10, 2) NULL DEFAULT 0.00,
  `repurchase` decimal(10, 2) NULL DEFAULT 0.00,
  `goodsids` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_commission_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_commission_log`;
CREATE TABLE `ims_yunphp_shop_commission_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `applyid` int(11) NULL DEFAULT 0,
  `mid` int(11) NULL DEFAULT 0,
  `commission` decimal(10, 2) NULL DEFAULT 0.00,
  `createtime` int(11) NULL DEFAULT 0,
  `commission_pay` decimal(10, 2) NULL DEFAULT 0.00,
  `realmoney` decimal(10, 2) NULL DEFAULT 0.00,
  `charge` decimal(10, 2) NULL DEFAULT 0.00,
  `deductionmoney` decimal(10, 2) NULL DEFAULT 0.00,
  `type` tinyint(3) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_applyid`(`applyid`) USING BTREE,
  INDEX `idx_mid`(`mid`) USING BTREE,
  INDEX `idx_createtime`(`createtime`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for ims_yunphp_shop_commission_rank
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_commission_rank`;
CREATE TABLE `ims_yunphp_shop_commission_rank`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `type` tinyint(4) NOT NULL DEFAULT 0,
  `num` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_commission_repurchase
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_commission_repurchase`;
CREATE TABLE `ims_yunphp_shop_commission_repurchase`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `openid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `year` int(4) NULL DEFAULT 0,
  `month` tinyint(2) NULL DEFAULT 0,
  `repurchase` decimal(10, 2) NULL DEFAULT 0.00,
  `applyid` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `applyid`(`applyid`) USING BTREE,
  INDEX `openid`(`openid`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_commission_shop
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_commission_shop`;
CREATE TABLE `ims_yunphp_shop_commission_shop`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `mid` int(11) NULL DEFAULT 0,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `selectgoods` tinyint(3) NULL DEFAULT 0,
  `selectcategory` tinyint(3) NULL DEFAULT 0,
  `goodsids` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_mid`(`mid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 51 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_coupon
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_coupon`;
CREATE TABLE `ims_yunphp_shop_coupon`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `catid` int(11) NULL DEFAULT 0,
  `couponname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `gettype` tinyint(3) NULL DEFAULT 0,
  `getmax` int(11) NULL DEFAULT 0,
  `usetype` tinyint(3) NULL DEFAULT 0 COMMENT '消费方式 0 付款使用 1 下单使用',
  `returntype` tinyint(3) NULL DEFAULT 0 COMMENT '退回方式 0 不可退回 1 取消订单(未付款) 2.退款可以退回',
  `bgcolor` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `enough` decimal(10, 2) NULL DEFAULT 0.00,
  `timelimit` tinyint(3) NULL DEFAULT 0 COMMENT '0 领取后几天有效 1 时间范围',
  `coupontype` tinyint(3) NULL DEFAULT 0 COMMENT '0 优惠券 1 充值券',
  `timedays` int(11) NULL DEFAULT 0,
  `timestart` int(11) NULL DEFAULT 0,
  `timeend` int(11) NULL DEFAULT 0,
  `discount` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '折扣',
  `deduct` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '抵扣',
  `backtype` tinyint(3) NULL DEFAULT 0,
  `backmoney` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '返现',
  `backcredit` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '返积分',
  `backredpack` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `backwhen` tinyint(3) NULL DEFAULT 0,
  `thumb` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `desc` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `createtime` int(11) NULL DEFAULT 0,
  `total` int(11) NULL DEFAULT 0 COMMENT '数量 -1 不限制',
  `status` tinyint(3) NULL DEFAULT 0 COMMENT '可用',
  `money` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '购买价格',
  `respdesc` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '推送描述',
  `respthumb` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '推送图片',
  `resptitle` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '推送标题',
  `respurl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `credit` int(11) NULL DEFAULT 0,
  `usecredit2` tinyint(3) NULL DEFAULT 0,
  `remark` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `descnoset` tinyint(3) NULL DEFAULT 0,
  `pwdkey` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `pwdsuc` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `pwdfail` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `pwdurl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `pwdask` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `pwdstatus` tinyint(3) NULL DEFAULT 0,
  `pwdtimes` int(11) NULL DEFAULT 0,
  `pwdfull` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `pwdwords` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `pwdopen` tinyint(3) NULL DEFAULT 0,
  `pwdown` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `pwdexit` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `pwdexitstr` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `displayorder` int(11) NULL DEFAULT 0,
  `pwdkey2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `merchid` int(11) NULL DEFAULT 0,
  `limitgoodtype` tinyint(1) NULL DEFAULT 0,
  `limitgoodcatetype` tinyint(1) NULL DEFAULT 0,
  `limitgoodcateids` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `limitgoodids` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `islimitlevel` tinyint(1) NULL DEFAULT 0,
  `limitmemberlevels` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `limitagentlevels` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `limitpartnerlevels` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `limitaagentlevels` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `tagtitle` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `settitlecolor` tinyint(1) NULL DEFAULT 0,
  `titlecolor` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `limitdiscounttype` tinyint(1) NULL DEFAULT 1,
  `grouptype` tinyint(1) NOT NULL DEFAULT 0 COMMENT '拼团免单券使用条件，0 仅开团，1仅参团，2开团参团都可',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_coupontype`(`coupontype`) USING BTREE,
  INDEX `idx_timestart`(`timestart`) USING BTREE,
  INDEX `idx_timeend`(`timeend`) USING BTREE,
  INDEX `idx_timelimit`(`timelimit`) USING BTREE,
  INDEX `idx_status`(`status`) USING BTREE,
  INDEX `idx_givetype`(`backtype`) USING BTREE,
  INDEX `idx_catid`(`catid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_coupon_category
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_coupon_category`;
CREATE TABLE `ims_yunphp_shop_coupon_category`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `displayorder` int(11) NULL DEFAULT 0,
  `status` int(11) NULL DEFAULT 0,
  `merchid` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_displayorder`(`displayorder`) USING BTREE,
  INDEX `idx_status`(`status`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_coupon_data
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_coupon_data`;
CREATE TABLE `ims_yunphp_shop_coupon_data`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `openid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `couponid` int(11) NULL DEFAULT 0,
  `gettype` tinyint(3) NULL DEFAULT 0 COMMENT '获取方式 0 发放 1 领取 2 积分商城',
  `used` int(11) NULL DEFAULT 0,
  `usetime` int(11) NULL DEFAULT 0,
  `gettime` int(11) NULL DEFAULT 0 COMMENT '获取时间',
  `senduid` int(11) NULL DEFAULT 0,
  `ordersn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `back` tinyint(3) NULL DEFAULT 0,
  `backtime` int(11) NULL DEFAULT 0,
  `merchid` int(11) NULL DEFAULT 0,
  `isnew` tinyint(1) NULL DEFAULT 1,
  `nocount` tinyint(1) NULL DEFAULT 1,
  `couponwillcancelmessage` tinyint(3) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_couponid`(`couponid`) USING BTREE,
  INDEX `idx_gettype`(`gettype`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_coupon_goodsendtask
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_coupon_goodsendtask`;
CREATE TABLE `ims_yunphp_shop_coupon_goodsendtask`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT NULL,
  `goodsid` int(11) NULL DEFAULT 0,
  `couponid` int(11) NULL DEFAULT 0,
  `starttime` int(11) NULL DEFAULT 0,
  `endtime` int(11) NULL DEFAULT 0,
  `sendnum` int(11) NULL DEFAULT 1,
  `num` int(11) NULL DEFAULT 0,
  `sendpoint` tinyint(1) NULL DEFAULT 0,
  `status` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for ims_yunphp_shop_coupon_guess
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_coupon_guess`;
CREATE TABLE `ims_yunphp_shop_coupon_guess`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `couponid` int(11) NULL DEFAULT 0,
  `openid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `times` int(11) NULL DEFAULT 0,
  `pwdkey` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `ok` tinyint(3) NULL DEFAULT 0,
  `merchid` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_couponid`(`couponid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_coupon_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_coupon_log`;
CREATE TABLE `ims_yunphp_shop_coupon_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `logno` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `openid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `couponid` int(11) NULL DEFAULT 0,
  `status` int(11) NULL DEFAULT 0,
  `paystatus` tinyint(3) NULL DEFAULT 0,
  `creditstatus` tinyint(3) NULL DEFAULT 0,
  `createtime` int(11) NULL DEFAULT 0,
  `paytype` tinyint(3) NULL DEFAULT 0,
  `getfrom` tinyint(3) NULL DEFAULT 0 COMMENT '0 发放 1 中心 2 积分兑换',
  `merchid` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_couponid`(`couponid`) USING BTREE,
  INDEX `idx_status`(`status`) USING BTREE,
  INDEX `idx_paystatus`(`paystatus`) USING BTREE,
  INDEX `idx_createtime`(`createtime`) USING BTREE,
  INDEX `idx_getfrom`(`getfrom`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_coupon_sendshow
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_coupon_sendshow`;
CREATE TABLE `ims_yunphp_shop_coupon_sendshow`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `showkey` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `uniacid` int(11) NOT NULL,
  `openid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `coupondataid` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_coupon_sendtasks
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_coupon_sendtasks`;
CREATE TABLE `ims_yunphp_shop_coupon_sendtasks`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT NULL,
  `enough` decimal(10, 2) NULL DEFAULT 0.00,
  `couponid` int(11) NULL DEFAULT 0,
  `starttime` int(11) NULL DEFAULT 0,
  `endtime` int(11) NULL DEFAULT 0,
  `sendnum` int(11) NULL DEFAULT 1,
  `num` int(11) NULL DEFAULT 0,
  `sendpoint` tinyint(1) NULL DEFAULT 0,
  `status` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for ims_yunphp_shop_coupon_taskdata
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_coupon_taskdata`;
CREATE TABLE `ims_yunphp_shop_coupon_taskdata`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT NULL,
  `openid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `taskid` int(11) NULL DEFAULT 0,
  `couponid` int(11) NULL DEFAULT 0,
  `sendnum` int(11) NULL DEFAULT 0,
  `tasktype` tinyint(1) NULL DEFAULT 0,
  `orderid` int(11) NULL DEFAULT 0,
  `parentorderid` int(11) NULL DEFAULT 0,
  `createtime` int(11) NULL DEFAULT 0,
  `status` tinyint(1) NULL DEFAULT 0,
  `sendpoint` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_coupon_usesendtasks
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_coupon_usesendtasks`;
CREATE TABLE `ims_yunphp_shop_coupon_usesendtasks`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT NULL,
  `usecouponid` int(11) NULL DEFAULT 0,
  `couponid` int(11) NULL DEFAULT 0,
  `starttime` int(11) NULL DEFAULT 0,
  `endtime` int(11) NULL DEFAULT 0,
  `sendnum` int(11) NULL DEFAULT 1,
  `num` int(11) NULL DEFAULT 0,
  `status` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for ims_yunphp_shop_creditshop_adv
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_creditshop_adv`;
CREATE TABLE `ims_yunphp_shop_creditshop_adv`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `advname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `link` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `thumb` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `displayorder` int(11) NULL DEFAULT 0,
  `enabled` int(11) NULL DEFAULT 0,
  `merchid` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_enabled`(`enabled`) USING BTREE,
  INDEX `idx_displayorder`(`displayorder`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_creditshop_category
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_creditshop_category`;
CREATE TABLE `ims_yunphp_shop_creditshop_category`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0 COMMENT '所属帐号',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类名称',
  `thumb` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类图片',
  `displayorder` tinyint(3) UNSIGNED NULL DEFAULT 0 COMMENT '排序',
  `enabled` tinyint(1) NULL DEFAULT 1 COMMENT '是否开启',
  `advimg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `advurl` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `isrecommand` tinyint(3) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_displayorder`(`displayorder`) USING BTREE,
  INDEX `idx_enabled`(`enabled`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_creditshop_comment
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_creditshop_comment`;
CREATE TABLE `ims_yunphp_shop_creditshop_comment`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT 0,
  `logid` int(11) NOT NULL DEFAULT 0,
  `logno` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `goodsid` int(11) NOT NULL DEFAULT 0,
  `openid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `nickname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `headimg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `level` tinyint(3) NOT NULL DEFAULT 0,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `images` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `time` int(11) NOT NULL DEFAULT 0,
  `reply_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `reply_images` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `reply_time` int(11) NOT NULL DEFAULT 0,
  `append_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `append_images` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `append_time` int(11) NOT NULL DEFAULT 0,
  `append_reply_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `append_reply_images` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `append_reply_time` int(11) NOT NULL DEFAULT 0,
  `istop` tinyint(3) NOT NULL DEFAULT 0,
  `checked` tinyint(3) NOT NULL DEFAULT 0,
  `append_checked` tinyint(3) NOT NULL DEFAULT 0,
  `virtual` tinyint(3) NOT NULL DEFAULT 0,
  `deleted` tinyint(3) NOT NULL DEFAULT 0,
  `merchid` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_creditshop_goods
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_creditshop_goods`;
CREATE TABLE `ims_yunphp_shop_creditshop_goods`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `displayorder` int(11) NULL DEFAULT 0,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cate` int(11) NULL DEFAULT 0,
  `thumb` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `price` decimal(10, 2) NULL DEFAULT 0.00,
  `type` tinyint(3) NULL DEFAULT 0,
  `credit` int(11) NULL DEFAULT 0,
  `money` decimal(10, 2) NULL DEFAULT 0.00,
  `total` int(11) NULL DEFAULT 0,
  `totalday` int(11) NULL DEFAULT 0,
  `chance` int(11) NULL DEFAULT 0,
  `chanceday` int(11) NULL DEFAULT 0,
  `detail` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `rate1` int(11) NULL DEFAULT 0,
  `rate2` int(11) NULL DEFAULT 0,
  `endtime` int(11) NULL DEFAULT 0,
  `joins` int(11) NULL DEFAULT 0,
  `views` int(11) NULL DEFAULT 0,
  `createtime` int(11) NULL DEFAULT 0,
  `status` tinyint(3) NULL DEFAULT 0,
  `deleted` tinyint(3) NULL DEFAULT 0,
  `showlevels` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `buylevels` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `showgroups` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `buygroups` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `vip` tinyint(3) NULL DEFAULT 0,
  `istop` tinyint(3) NULL DEFAULT 0,
  `isrecommand` tinyint(3) NULL DEFAULT 0,
  `istime` tinyint(3) NULL DEFAULT 0,
  `timestart` int(11) NULL DEFAULT 0,
  `timeend` int(11) NULL DEFAULT 0,
  `share_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `share_icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `share_desc` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `followneed` tinyint(3) NULL DEFAULT 0,
  `followtext` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `subtitle` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `subdetail` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `noticedetail` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `usedetail` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `goodsdetail` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `isendtime` tinyint(3) NULL DEFAULT 0,
  `usecredit2` tinyint(3) NULL DEFAULT 0,
  `area` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `dispatch` decimal(10, 2) NULL DEFAULT 0.00,
  `storeids` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `noticeopenid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `noticetype` tinyint(3) NULL DEFAULT 0,
  `isverify` tinyint(3) NULL DEFAULT 0,
  `goodstype` tinyint(3) NULL DEFAULT 0,
  `couponid` int(11) NULL DEFAULT 0,
  `goodsid` int(11) NULL DEFAULT 0,
  `merchid` int(11) NOT NULL DEFAULT 0,
  `productprice` decimal(10, 2) NOT NULL DEFAULT 0.00,
  `mincredit` decimal(10, 2) NOT NULL DEFAULT 0.00,
  `minmoney` decimal(10, 2) NOT NULL DEFAULT 0.00,
  `maxcredit` decimal(10, 2) NOT NULL DEFAULT 0.00,
  `maxmoney` decimal(10, 2) NOT NULL DEFAULT 0.00,
  `dispatchtype` tinyint(3) NOT NULL DEFAULT 0,
  `dispatchid` int(11) NOT NULL DEFAULT 0,
  `verifytype` tinyint(3) NOT NULL DEFAULT 0,
  `verifynum` int(11) NOT NULL DEFAULT 0,
  `grant1` decimal(10, 2) NOT NULL DEFAULT 0.00,
  `grant2` decimal(10, 2) NOT NULL DEFAULT 0.00,
  `goodssn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `productsn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `weight` int(11) NOT NULL,
  `showtotal` tinyint(3) NOT NULL,
  `totalcnf` tinyint(3) NOT NULL DEFAULT 0,
  `usetime` int(11) NOT NULL DEFAULT 0,
  `hasoption` tinyint(3) NOT NULL DEFAULT 0,
  `noticedetailshow` tinyint(3) NOT NULL DEFAULT 0,
  `detailshow` tinyint(3) NOT NULL DEFAULT 0,
  `packetmoney` decimal(10, 2) NOT NULL DEFAULT 0.00,
  `surplusmoney` decimal(10, 2) NOT NULL DEFAULT 0.00,
  `packetlimit` decimal(10, 2) NOT NULL DEFAULT 0.00,
  `packettype` tinyint(3) NOT NULL DEFAULT 0,
  `minpacketmoney` decimal(10, 2) NOT NULL DEFAULT 0.00,
  `packettotal` int(11) NOT NULL DEFAULT 0,
  `packetsurplus` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_type`(`type`) USING BTREE,
  INDEX `idx_endtime`(`endtime`) USING BTREE,
  INDEX `idx_createtime`(`createtime`) USING BTREE,
  INDEX `idx_status`(`status`) USING BTREE,
  INDEX `idx_displayorder`(`displayorder`) USING BTREE,
  INDEX `idx_deleted`(`deleted`) USING BTREE,
  INDEX `idx_istop`(`istop`) USING BTREE,
  INDEX `idx_isrecommand`(`isrecommand`) USING BTREE,
  INDEX `idx_istime`(`istime`) USING BTREE,
  INDEX `idx_timestart`(`timestart`) USING BTREE,
  INDEX `idx_timeend`(`timeend`) USING BTREE,
  INDEX `idx_goodstype`(`goodstype`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_creditshop_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_creditshop_log`;
CREATE TABLE `ims_yunphp_shop_creditshop_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `logno` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `eno` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '兑换码',
  `openid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `goodsid` int(11) NULL DEFAULT 0,
  `createtime` int(11) NULL DEFAULT 0,
  `status` tinyint(3) NULL DEFAULT 0 COMMENT '0 只生成记录未参加 1 未中奖 2 已中奖 3 已发奖',
  `paystatus` tinyint(3) NULL DEFAULT 0 COMMENT '支付状态 -1 不需要支付 0 未支付 1 已支付',
  `paytype` tinyint(3) NULL DEFAULT -1 COMMENT '支付类型 -1 不需要支付 0 余额 1 微信',
  `dispatchstatus` tinyint(3) NULL DEFAULT 0 COMMENT '运费状态 -1 不需要运费 0 未支付 1 已支付',
  `creditpay` tinyint(3) NULL DEFAULT 0 COMMENT '积分支付 0 未支付 1 已支付',
  `addressid` int(11) NULL DEFAULT 0 COMMENT '收货地址',
  `dispatchno` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '运费支付单号',
  `usetime` int(11) NULL DEFAULT 0,
  `express` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `expresssn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `expresscom` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `verifyopenid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `storeid` int(11) NULL DEFAULT 0,
  `realname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `mobile` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `couponid` int(11) NULL DEFAULT 0,
  `dupdate1` tinyint(3) NULL DEFAULT 0,
  `transid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `dispatchtransid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `address` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `optionid` int(11) NOT NULL DEFAULT 0,
  `time_send` int(11) NOT NULL DEFAULT 0,
  `time_finish` int(11) NOT NULL DEFAULT 0,
  `iscomment` tinyint(3) NOT NULL DEFAULT 0,
  `dispatchtime` int(11) NOT NULL DEFAULT 0,
  `verifynum` int(11) NOT NULL DEFAULT 1,
  `verifytime` int(11) NOT NULL DEFAULT 0,
  `merchid` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 54 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_creditshop_option
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_creditshop_option`;
CREATE TABLE `ims_yunphp_shop_creditshop_option`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `goodsid` int(10) NULL DEFAULT 0,
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `thumb` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `credit` int(10) NOT NULL DEFAULT 0,
  `money` decimal(10, 2) NULL DEFAULT 0.00,
  `total` int(11) NULL DEFAULT 0,
  `weight` decimal(10, 2) NULL DEFAULT 0.00,
  `displayorder` int(11) NULL DEFAULT 0,
  `specs` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `skuId` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `goodssn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `productsn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `virtual` int(11) NULL DEFAULT 0,
  `exchange_stock` int(11) NOT NULL DEFAULT -1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_creditshop_spec
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_creditshop_spec`;
CREATE TABLE `ims_yunphp_shop_creditshop_spec`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `goodsid` int(11) NULL DEFAULT 0,
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `description` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `displaytype` tinyint(3) NULL DEFAULT 0,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `displayorder` int(11) NULL DEFAULT 0,
  `propId` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_creditshop_spec_item
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_creditshop_spec_item`;
CREATE TABLE `ims_yunphp_shop_creditshop_spec_item`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `specid` int(11) NULL DEFAULT 0,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `thumb` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `show` int(11) NULL DEFAULT 0,
  `displayorder` int(11) NULL DEFAULT 0,
  `valueId` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `virtual` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_creditshop_verify
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_creditshop_verify`;
CREATE TABLE `ims_yunphp_shop_creditshop_verify`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `openid` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0',
  `logid` int(11) NULL DEFAULT 0,
  `verifycode` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `storeid` int(11) NULL DEFAULT 0,
  `verifier` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0',
  `isverify` tinyint(3) NULL DEFAULT 0,
  `verifytime` int(11) NULL DEFAULT 0,
  `merchid` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_customer
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_customer`;
CREATE TABLE `ims_yunphp_shop_customer`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `kf_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `kf_account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `kf_nick` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `kf_pwd` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `kf_headimgurl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `createtime` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_createtime`(`createtime`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_customer_category
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_customer_category`;
CREATE TABLE `ims_yunphp_shop_customer_category`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_customer_guestbook
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_customer_guestbook`;
CREATE TABLE `ims_yunphp_shop_customer_guestbook`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `openid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `realname` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `mobile` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `weixin` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `images` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `remark` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `status` tinyint(3) NULL DEFAULT 0,
  `createtime` int(11) NULL DEFAULT 0,
  `deleted` tinyint(3) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_customer_robot
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_customer_robot`;
CREATE TABLE `ims_yunphp_shop_customer_robot`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `cate` int(11) NULL DEFAULT 0,
  `keywords` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `createtime` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_cate`(`cate`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_designer
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_designer`;
CREATE TABLE `ims_yunphp_shop_designer`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT 0 COMMENT '公众号',
  `pagename` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '页面名称',
  `pagetype` tinyint(3) NOT NULL DEFAULT 0 COMMENT '页面类型',
  `pageinfo` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `createtime` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '页面创建时间',
  `keyword` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `savetime` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '页面最后保存时间',
  `setdefault` tinyint(3) NOT NULL DEFAULT 0 COMMENT '默认页面',
  `datas` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '数据',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_pagetype`(`pagetype`) USING BTREE,
  INDEX `idx_keyword`(`keyword`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_designer_menu
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_designer_menu`;
CREATE TABLE `ims_yunphp_shop_designer_menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `menuname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `isdefault` tinyint(3) NULL DEFAULT 0,
  `createtime` int(11) NULL DEFAULT 0,
  `menus` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `params` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_isdefault`(`isdefault`) USING BTREE,
  INDEX `idx_createtime`(`createtime`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_dispatch
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_dispatch`;
CREATE TABLE `ims_yunphp_shop_dispatch`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `dispatchname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `dispatchtype` int(11) NULL DEFAULT 0,
  `displayorder` int(11) NULL DEFAULT 0,
  `firstprice` decimal(10, 2) NULL DEFAULT 0.00,
  `secondprice` decimal(10, 2) NULL DEFAULT 0.00,
  `firstweight` int(11) NULL DEFAULT 0,
  `secondweight` int(11) NULL DEFAULT 0,
  `express` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `areas` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `carriers` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `enabled` int(11) NULL DEFAULT 0,
  `calculatetype` tinyint(1) NULL DEFAULT 0,
  `firstnum` int(11) NULL DEFAULT 0,
  `secondnum` int(11) NULL DEFAULT 0,
  `firstnumprice` decimal(10, 2) NULL DEFAULT 0.00,
  `secondnumprice` decimal(10, 2) NULL DEFAULT 0.00,
  `isdefault` tinyint(1) NULL DEFAULT 0,
  `shopid` int(11) NULL DEFAULT 0,
  `merchid` int(11) NULL DEFAULT 0,
  `nodispatchareas` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `nodispatchareas_code` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `isdispatcharea` tinyint(3) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_displayorder`(`displayorder`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_diyform_category
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_diyform_category`;
CREATE TABLE `ims_yunphp_shop_diyform_category`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_diyform_data
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_diyform_data`;
CREATE TABLE `ims_yunphp_shop_diyform_data`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT 0,
  `typeid` int(11) NOT NULL DEFAULT 0 COMMENT '类型id',
  `cid` int(11) NULL DEFAULT 0 COMMENT '关联id',
  `diyformfields` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `fields` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字符集',
  `openid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '使用者openid',
  `type` tinyint(2) NULL DEFAULT 0 COMMENT '该数据所属模块',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_typeid`(`typeid`) USING BTREE,
  INDEX `idx_cid`(`cid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_diyform_temp
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_diyform_temp`;
CREATE TABLE `ims_yunphp_shop_diyform_temp`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT 0,
  `typeid` int(11) NULL DEFAULT 0,
  `cid` int(11) NOT NULL DEFAULT 0 COMMENT '关联id',
  `diyformfields` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `fields` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字符集',
  `openid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '使用者openid',
  `type` tinyint(1) NULL DEFAULT 0 COMMENT '类型',
  `diyformid` int(11) NULL DEFAULT 0,
  `diyformdata` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `carrier_realname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `carrier_mobile` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_cid`(`cid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_diyform_type
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_diyform_type`;
CREATE TABLE `ims_yunphp_shop_diyform_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT 0,
  `cate` int(11) NULL DEFAULT 0,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '分类名称',
  `fields` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字段集',
  `usedata` int(11) NOT NULL DEFAULT 0 COMMENT '已用数据',
  `alldata` int(11) NOT NULL DEFAULT 0 COMMENT '全部数据',
  `status` tinyint(1) NULL DEFAULT 1 COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_cate`(`cate`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_diypage
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_diypage`;
CREATE TABLE `ims_yunphp_shop_diypage`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT 0,
  `type` tinyint(1) NOT NULL DEFAULT 0,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `createtime` int(11) NOT NULL DEFAULT 0,
  `lastedittime` int(11) NOT NULL DEFAULT 0,
  `keyword` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `diymenu` int(11) NOT NULL DEFAULT 0,
  `merch` int(11) NOT NULL DEFAULT 0,
  `diyadv` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_type`(`type`) USING BTREE,
  INDEX `idx_keyword`(`keyword`) USING BTREE,
  INDEX `idx_lastedittime`(`lastedittime`) USING BTREE,
  INDEX `idx_createtime`(`createtime`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_diypage_menu
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_diypage_menu`;
CREATE TABLE `ims_yunphp_shop_diypage_menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT 0,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `data` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `createtime` int(11) NOT NULL DEFAULT 0,
  `lastedittime` int(11) NOT NULL DEFAULT 0,
  `merch` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_createtime`(`createtime`) USING BTREE,
  INDEX `idx_lastedittime`(`lastedittime`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_diypage_plu
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_diypage_plu`;
CREATE TABLE `ims_yunphp_shop_diypage_plu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT 0,
  `type` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(3) NOT NULL DEFAULT 0,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `data` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `createtime` int(11) NOT NULL DEFAULT 0,
  `lastedittime` int(11) NOT NULL DEFAULT 0,
  `merch` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_createtime`(`createtime`) USING BTREE,
  INDEX `idx_lastedittime`(`lastedittime`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_diypage_template
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_diypage_template`;
CREATE TABLE `ims_yunphp_shop_diypage_template`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT 0,
  `type` tinyint(3) NOT NULL DEFAULT 0,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `preview` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `tplid` int(11) NULL DEFAULT 0,
  `cate` int(11) NULL DEFAULT 0,
  `deleted` tinyint(3) NULL DEFAULT 0,
  `merch` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_type`(`type`) USING BTREE,
  INDEX `idx_cate`(`cate`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ims_yunphp_shop_diypage_template
-- ----------------------------
INSERT INTO `ims_yunphp_shop_diypage_template` VALUES (1, 0, 2, '系统模板01', 'eyJwYWdlIjp7InR5cGUiOiIyIiwidGl0bGUiOiJcdTMwMTBcdTZhMjFcdTY3N2ZcdTMwMTFcdTdjZmJcdTdlZGZcdTZhMjFcdTY3N2YwMSIsIm5hbWUiOiJcdTMwMTBcdTZhMjFcdTY3N2ZcdTMwMTFcdTdjZmJcdTdlZGZcdTZhMjFcdTY3N2YwMSIsImRlc2MiOiIiLCJpY29uIjoiIiwia2V5d29yZCI6IiIsImJhY2tncm91bmQiOiIjZmFmYWZhIiwiZGl5bWVudSI6Ii0xIn0sIml0ZW1zIjp7Ik0xNDY1ODAyOTg0ODg1Ijp7InN0eWxlIjp7ImRvdHN0eWxlIjoicm91bmQiLCJkb3RhbGlnbiI6ImNlbnRlciIsImJhY2tncm91bmQiOiIjZmZmZmZmIiwibGVmdHJpZ2h0IjoiNSIsImJvdHRvbSI6IjEwIiwib3BhY2l0eSI6IjAuOCJ9LCJkYXRhIjp7IkMxNDY1ODAyOTg0ODg1Ijp7ImltZ3VybCI6Ii4uXC9hZGRvbnNcL2V3ZWlfc2hvcHYyXC9wbHVnaW5cL2RpeXBhZ2VcL3N0YXRpY1wvdGVtcGxhdGVcL2RlZmF1bHQxXC9iYW5uZXJfMS5qcGciLCJsaW5rdXJsIjoiIn0sIkMxNDY1ODAyOTg0ODg2Ijp7ImltZ3VybCI6Ii4uXC9hZGRvbnNcL2V3ZWlfc2hvcHYyXC9wbHVnaW5cL2RpeXBhZ2VcL3N0YXRpY1wvdGVtcGxhdGVcL2RlZmF1bHQxXC9iYW5uZXJfMi5qcGciLCJsaW5rdXJsIjoiIn0sIk0xNDY1ODAzMDE0ODM3Ijp7ImltZ3VybCI6Ii4uXC9hZGRvbnNcL2V3ZWlfc2hvcHYyXC9wbHVnaW5cL2RpeXBhZ2VcL3N0YXRpY1wvdGVtcGxhdGVcL2RlZmF1bHQxXC9iYW5uZXJfMy5qcGciLCJsaW5rdXJsIjoiIn19LCJpZCI6ImJhbm5lciJ9LCJNMTQ2NTgwMzY5MjkzMiI6eyJzdHlsZSI6eyJoZWlnaHQiOiIxMCIsImJhY2tncm91bmQiOiIjZmZmZmZmIn0sImlkIjoiYmxhbmsifSwiTTE0NjU4MDMzMTk4NTMiOnsic3R5bGUiOnsibmF2c3R5bGUiOiIiLCJiYWNrZ3JvdW5kIjoiI2ZmZmZmZiIsInJvd251bSI6IjUifSwiZGF0YSI6eyJDMTQ2NTgwMzMxOTg1MyI6eyJpbWd1cmwiOiIuLlwvYWRkb25zXC9ld2VpX3Nob3B2MlwvcGx1Z2luXC9kaXlwYWdlXC9zdGF0aWNcL3RlbXBsYXRlXC9kZWZhdWx0MVwvbWVudV8xLnBuZyIsImxpbmt1cmwiOiIiLCJ0ZXh0IjoiXHU2NWIwXHU1NGMxIiwiY29sb3IiOiIjNjY2NjY2In0sIkMxNDY1ODAzMzE5ODU0Ijp7ImltZ3VybCI6Ii4uXC9hZGRvbnNcL2V3ZWlfc2hvcHYyXC9wbHVnaW5cL2RpeXBhZ2VcL3N0YXRpY1wvdGVtcGxhdGVcL2RlZmF1bHQxXC9tZW51XzIucG5nIiwibGlua3VybCI6IiIsInRleHQiOiJcdTcwZWRcdTUzNTYiLCJjb2xvciI6IiM2NjY2NjYifSwiQzE0NjU4MDMzMTk4NTUiOnsiaW1ndXJsIjoiLi5cL2FkZG9uc1wvZXdlaV9zaG9wdjJcL3BsdWdpblwvZGl5cGFnZVwvc3RhdGljXC90ZW1wbGF0ZVwvZGVmYXVsdDFcL21lbnVfMy5wbmciLCJsaW5rdXJsIjoiIiwidGV4dCI6Ilx1NGZjM1x1OTUwMCIsImNvbG9yIjoiIzY2NjY2NiJ9LCJDMTQ2NTgwMzMxOTg1NiI6eyJpbWd1cmwiOiIuLlwvYWRkb25zXC9ld2VpX3Nob3B2MlwvcGx1Z2luXC9kaXlwYWdlXC9zdGF0aWNcL3RlbXBsYXRlXC9kZWZhdWx0MVwvbWVudV80LnBuZyIsImxpbmt1cmwiOiIiLCJ0ZXh0IjoiXHU4YmEyXHU1MzU1IiwiY29sb3IiOiIjNjY2NjY2In0sIk0xNDY1ODAzMzQ3MDQ1Ijp7ImltZ3VybCI6Ii4uXC9hZGRvbnNcL2V3ZWlfc2hvcHYyXC9wbHVnaW5cL2RpeXBhZ2VcL3N0YXRpY1wvdGVtcGxhdGVcL2RlZmF1bHQxXC9tZW51XzUucG5nIiwibGlua3VybCI6IiIsInRleHQiOiJcdTdiN2VcdTUyMzAiLCJjb2xvciI6IiM2NjY2NjYifX0sImlkIjoibWVudSJ9LCJNMTQ2NTgwMzM1OTEwMCI6eyJzdHlsZSI6eyJuYXZzdHlsZSI6IiIsImJhY2tncm91bmQiOiIjZmZmZmZmIiwicm93bnVtIjoiNSJ9LCJkYXRhIjp7IkMxNDY1ODAzMzU5MTAwIjp7ImltZ3VybCI6Ii4uXC9hZGRvbnNcL2V3ZWlfc2hvcHYyXC9wbHVnaW5cL2RpeXBhZ2VcL3N0YXRpY1wvdGVtcGxhdGVcL2RlZmF1bHQxXC9tZW51XzYucG5nIiwibGlua3VybCI6IiIsInRleHQiOiJcdTRlMGFcdTg4NjMiLCJjb2xvciI6IiM2NjY2NjYifSwiQzE0NjU4MDMzNTkxMDEiOnsiaW1ndXJsIjoiLi5cL2FkZG9uc1wvZXdlaV9zaG9wdjJcL3BsdWdpblwvZGl5cGFnZVwvc3RhdGljXC90ZW1wbGF0ZVwvZGVmYXVsdDFcL21lbnVfNy5wbmciLCJsaW5rdXJsIjoiIiwidGV4dCI6Ilx1NGUwYlx1ODg2MyIsImNvbG9yIjoiIzY2NjY2NiJ9LCJDMTQ2NTgwMzM1OTEwMiI6eyJpbWd1cmwiOiIuLlwvYWRkb25zXC9ld2VpX3Nob3B2MlwvcGx1Z2luXC9kaXlwYWdlXC9zdGF0aWNcL3RlbXBsYXRlXC9kZWZhdWx0MVwvbWVudV84LnBuZyIsImxpbmt1cmwiOiIiLCJ0ZXh0IjoiXHU5NzhiXHU1YjUwIiwiY29sb3IiOiIjNjY2NjY2In0sIkMxNDY1ODAzMzU5MTAzIjp7ImltZ3VybCI6Ii4uXC9hZGRvbnNcL2V3ZWlfc2hvcHYyXC9wbHVnaW5cL2RpeXBhZ2VcL3N0YXRpY1wvdGVtcGxhdGVcL2RlZmF1bHQxXC9tZW51XzkucG5nIiwibGlua3VybCI6IiIsInRleHQiOiJcdTUxODVcdTg4NjMiLCJjb2xvciI6IiM2NjY2NjYifSwiTTE0NjU4MDM0NTA4MjciOnsiaW1ndXJsIjoiLi5cL2FkZG9uc1wvZXdlaV9zaG9wdjJcL3BsdWdpblwvZGl5cGFnZVwvc3RhdGljXC90ZW1wbGF0ZVwvZGVmYXVsdDFcL21lbnVfMTAucG5nIiwibGlua3VybCI6IiIsInRleHQiOiJcdTUxNjhcdTkwZTgiLCJjb2xvciI6IiM2NjY2NjYifX0sImlkIjoibWVudSJ9LCJNMTQ2NTgwMzcwMDEzMiI6eyJzdHlsZSI6eyJoZWlnaHQiOiIxMCIsImJhY2tncm91bmQiOiIjZmZmZmZmIn0sImlkIjoiYmxhbmsifSwiTTE0NjU4MDM2MjE5ODAiOnsicGFyYW1zIjp7Imljb251cmwiOiIuLlwvYWRkb25zXC9ld2VpX3Nob3B2Mlwvc3RhdGljXC9pbWFnZXNcL2hvdGRvdC5qcGciLCJub3RpY2VkYXRhIjoiMSIsInNwZWVkIjoiNCIsIm5vdGljZW51bSI6IjUifSwic3R5bGUiOnsiYmFja2dyb3VuZCI6IiNmZmZmZmYiLCJpY29uY29sb3IiOiIjZmQ1NDU0IiwiY29sb3IiOiIjNjY2NjY2In0sImRhdGEiOnsiQzE0NjU4MDM2MjE5ODAiOnsidGl0bGUiOiJcdThmZDlcdTkxY2NcdTY2MmZcdTdiMmNcdTRlMDBcdTY3NjFcdTgxZWFcdTViOWFcdTR\r\nlNDlcdTUxNmNcdTU0NGFcdTc2ODRcdTY4MDdcdTk4OTgiLCJsaW5rdXJsIjoiaHR0cDpcL1wvd3d3LmJhaWR1LmNvbSJ9LCJDMTQ2NTgwMzYyMTk4MSI6eyJ0aXRsZSI6Ilx1OGZkOVx1OTFjY1x1NjYyZlx1N2IyY1x1NGU4Y1x1Njc2MVx1ODFlYVx1NWI5YVx1NGU0OVx1NTE2Y1x1NTQ0YVx1NzY4NFx1NjgwN1x1OTg5OCIsImxpbmt1cmwiOiJodHRwOlwvXC93d3cuYmFpZHUuY29tIn19LCJpZCI6Im5vdGljZSJ9LCJNMTQ2NTgwMzkzMjQ2MCI6eyJwYXJhbXMiOnsicm93IjoiMiJ9LCJkYXRhIjp7IkMxNDY1ODAzOTMyNDYwIjp7ImltZ3VybCI6Ii4uXC9hZGRvbnNcL2V3ZWlfc2hvcHYyXC9wbHVnaW5cL2RpeXBhZ2VcL3N0YXRpY1wvdGVtcGxhdGVcL2RlZmF1bHQxXC9waWN0dXJld18xLmpwZyIsImxpbmt1cmwiOiIifSwiQzE0NjU4MDM5MzI0NjMiOnsiaW1ndXJsIjoiLi5cL2FkZG9uc1wvZXdlaV9zaG9wdjJcL3BsdWdpblwvZGl5cGFnZVwvc3RhdGljXC90ZW1wbGF0ZVwvZGVmYXVsdDFcL3BpY3R1cmV3XzIuanBnIiwibGlua3VybCI6IiJ9fSwiaWQiOiJwaWN0dXJldyIsInN0eWxlIjp7InBhZGRpbmd0b3AiOiIxNiIsInBhZGRpbmdsZWZ0IjoiNCJ9fSwiTTE0NjU4MDQwMjU1MDgiOnsicGFyYW1zIjp7InRpdGxlIjoiXHU2NWIwXHU1NGMxXHU0ZTBhXHU1ZTAyIiwiaWNvbiI6Imljb24tbmV3In0sInN0eWxlIjp7ImJhY2tncm91bmQiOiIjZmZmZmZmIiwiY29sb3IiOiIjZjA2MjkyIiwidGV4dGFsaWduIjoiY2VudGVyIiwiZm9udHNpemUiOiIxOCIsInBhZGRpbmd0b3AiOiI1IiwicGFkZGluZ2xlZnQiOiI1In0sImlkIjoidGl0bGUifSwiTTE0NjU4MTMzNjgwODUiOnsicGFyYW1zIjp7InNob3d0aXRsZSI6IjEiLCJzaG93cHJpY2UiOiIxIiwiZ29vZHNkYXRhIjoiMCIsImNhdGVpZCI6IiIsImNhdGVuYW1lIjoiIiwiZ3JvdXBpZCI6IiIsImdyb3VwbmFtZSI6IiIsImdvb2Rzc29ydCI6IjAiLCJnb29kc251bSI6IjYiLCJzaG93aWNvbiI6IjAiLCJpY29ucG9zaXRpb24iOiJsZWZ0IHRvcCJ9LCJzdHlsZSI6eyJsaXN0c3R5bGUiOiJibG9jayIsImJ1eXN0eWxlIjoiYnV5YnRuLTEiLCJnb29kc2ljb24iOiJyZWNvbW1hbmQiLCJwcmljZWNvbG9yIjoiI2VkMjgyMiIsImljb25wYWRkaW5ndG9wIjoiMCIsImljb25wYWRkaW5nbGVmdCI6IjAiLCJidXlidG5jb2xvciI6IiNmZTU0NTUiLCJpY29uem9vbSI6IjEwMCIsInRpdGxlY29sb3IiOiIjMjYyNjI2In0sImRhdGEiOnsiQzE0NjU4MTMzNjgwODUiOnsidGh1bWIiOiIuLlwvYWRkb25zXC9ld2VpX3Nob3B2MlwvcGx1Z2luXC9kaXlwYWdlXC9zdGF0aWNcL2ltYWdlc1wvZGVmYXVsdFwvZ29vZHMtMS5qcGciLCJwcmljZSI6IjIwLjAwIiwidGl0bGUiOiJcdThmZDlcdTkxY2NcdTY2MmZcdTU1NDZcdTU0YzFcdTY4MDdcdTk4OTgiLCJnaWQiOiIifSwiQzE0NjU4MTMzNjgwODYiOnsidGh1bWIiOiIuLlwvYWRkb25zXC9ld2VpX3Nob3B2MlwvcGx1Z2luXC9kaXlwYWdlXC9zdGF0aWNcL2ltYWdlc1wvZGVmYXVsdFwvZ29vZHMtMi5qcGciLCJwcmljZSI6IjIwLjAwIiwidGl0bGUiOiJcdThmZDlcdTkxY2NcdTY2MmZcdTU1NDZcdTU0YzFcdTY4MDdcdTk4OTgiLCJnaWQiOiIifSwiQzE0NjU4MTMzNjgwODciOnsidGh1bWIiOiIuLlwvYWRkb25zXC9ld2VpX3Nob3B2MlwvcGx1Z2luXC9kaXlwYWdlXC9zdGF0aWNcL2ltYWdlc1wvZGVmYXVsdFwvZ29vZHMtMy5qcGciLCJwcmljZSI6IjIwLjAwIiwidGl0bGUiOiJcdThmZDlcdTkxY2NcdTY2MmZcdTU1NDZcdTU0YzFcdTY4MDdcdTk4OTgiLCJnaWQiOiIifSwiQzE0NjU4MTMzNjgwODgiOnsidGh1bWIiOiIuLlwvYWRkb25zXC9ld2VpX3Nob3B2MlwvcGx1Z2luXC9kaXlwYWdlXC9zdGF0aWNcL2ltYWdlc1wvZGVmYXVsdFwvZ29vZHMtNC5qcGciLCJwcmljZSI6IjIwLjAwIiwidGl0bGUiOiJcdThmZDlcdTkxY2NcdTY2MmZcdTU1NDZcdTU0YzFcdTY4MDdcdTk4OTgiLCJnaWQiOiIifX0sImlkIjoiZ29vZHMifSwiTTE0NjU4MDU4MjEwNjciOnsicGFyYW1zIjp7InRpdGxlIjoiXHU3MGVkXHU1MzU2XHU1NTQ2XHU1NGMxIiwiaWNvbiI6Imljb24taG90In0sInN0eWxlIjp7ImJhY2tncm91bmQiOiIjZmZmZmZmIiwiY29sb3IiOiIjZmFjMDQyIiwidGV4dGFsaWduIjoiY2VudGVyIiwiZm9udHNpemUiOiIxOCIsInBhZGRpbmd0b3AiOiI1IiwicGFkZGluZ2xlZnQiOiI1In0sImlkIjoidGl0bGUifSwiTTE0NjU4MTMzNzY4OTIiOnsicGFyYW1zIjp7InNob3d0aXRsZSI6IjEiLCJzaG93cHJpY2UiOiIxIiwiZ29vZHNkYXRhIjoiMCIsImNhdGVpZCI6IiIsImNhdGVuYW1lIjoiIiwiZ3JvdXBpZCI6IiIsImdyb3VwbmFtZSI6IiIsImdvb2Rzc29ydCI6IjAiLCJnb29kc251bSI6IjYiLCJzaG93aWNvbiI6IjEiLCJpY29ucG9zaXRpb24iOiJsZWZ0IHRvcCJ9LCJzdHlsZSI6eyJsaXN0c3R5bGUiOiJibG9jayIsImJ1eXN0eWxlIjoiYnV5YnRuLTEiLCJnb29kc2ljb24iOiJyZWNvbW1hbmQiLCJwcmljZWNvbG9yIjoiI2VkMjgyMiIsImljb25wYWRkaW5ndG9wIjoiMCIsImljb25wYWRkaW5nbGVmdCI6IjAiLCJidXlidG5jb2xvciI6IiNmZTU0NTUiLCJpY29uem9vbSI6IjEwMCIsInRpdGxlY29sb3IiOiIjMjYyNjI2In0sImRhdGEiOnsiQzE0NjU4MTMzNzY4OTIiOnsidGh1bWIiOiIuLlwvYWRkb25zXC9ld2VpX3Nob3B2MlwvcGx1Z2luXC9kaXlwYWdlXC9zdGF0aWNcL2ltYWdlc1wvZGVmYXVsdFwvZ29vZHMtMS5qcGciLCJwcmljZSI6IjIwLjAwIiwidGl0bGUiOiJcdThmZDlcdTkxY2NcdTY2MmZcdTU1NDZcdTU0YzFcdTY4MDdcdTk4OTgiLCJnaWQiOiIifSwiQzE0NjU4MTMzNzY4OTMiOnsidGh1bWIiOiIuLlwvYWRkb25zXC9ld2VpX3Nob3B2MlwvcGx1Z2luXC9kaXlwYWdlXC9zdGF0aWNcL2ltYWdlc1wvZGVmYXVsdFwvZ29vZHMtMi5qcGciLCJwcmljZSI6IjIwLjAwIiwidGl0bGUiOiJcdThmZDlcdTkxY2NcdTY2MmZcdTU1NDZcdTU0YzFcdTY4MDdcdTk4OTgiLCJnaWQiOiIifSwiQzE0NjU4MTMzNzY4OTQiOnsidGh1bWIiOiIuLlwvYWRkb25zXC9ld2VpX3Nob3B2MlwvcGx1Z2luXC9kaXlwYWd\r\nlXC9zdGF0aWNcL2ltYWdlc1wvZGVmYXVsdFwvZ29vZHMtMy5qcGciLCJwcmljZSI6IjIwLjAwIiwidGl0bGUiOiJcdThmZDlcdTkxY2NcdTY2MmZcdTU1NDZcdTU0YzFcdTY4MDdcdTk4OTgiLCJnaWQiOiIifSwiQzE0NjU4MTMzNzY4OTUiOnsidGh1bWIiOiIuLlwvYWRkb25zXC9ld2VpX3Nob3B2MlwvcGx1Z2luXC9kaXlwYWdlXC9zdGF0aWNcL2ltYWdlc1wvZGVmYXVsdFwvZ29vZHMtNC5qcGciLCJwcmljZSI6IjIwLjAwIiwidGl0bGUiOiJcdThmZDlcdTkxY2NcdTY2MmZcdTU1NDZcdTU0YzFcdTY4MDdcdTk4OTgiLCJnaWQiOiIifX0sImlkIjoiZ29vZHMifX19', '../addons/yunphp_shop/plugin/diypage/static/template/default1/preview.jpg', 1, 0, 0, 0);
INSERT INTO `ims_yunphp_shop_diypage_template` VALUES (2, 0, 1, '系统模板02', 'eyJwYWdlIjp7InR5cGUiOiIxIiwidGl0bGUiOiJcdTMwMTBcdTZhMjFcdTY3N2ZcdTMwMTFcdTdjZmJcdTdlZGZcdTZhMjFcdTY3N2YwMiIsIm5hbWUiOiJcdTMwMTBcdTZhMjFcdTY3N2ZcdTMwMTFcdTdjZmJcdTdlZGZcdTZhMjFcdTY3N2YwMiIsImRlc2MiOiIiLCJpY29uIjoiIiwia2V5d29yZCI6IiIsImJhY2tncm91bmQiOiIjZmFmYWZhIiwiZGl5bWVudSI6Ii0xIn0sIml0ZW1zIjp7Ik0xNDY1ODA4NTU2MDAxIjp7InN0eWxlIjp7ImRvdHN0eWxlIjoicm91bmQiLCJkb3RhbGlnbiI6InJpZ2h0IiwiYmFja2dyb3VuZCI6IiNmZmZmZmYiLCJsZWZ0cmlnaHQiOiIxMCIsImJvdHRvbSI6IjEwIiwib3BhY2l0eSI6IjAuOCJ9LCJkYXRhIjp7IkMxNDY1ODA4NTU2MDAxIjp7ImltZ3VybCI6Ii4uXC9hZGRvbnNcL2V3ZWlfc2hvcHYyXC9wbHVnaW5cL2RpeXBhZ2VcL3N0YXRpY1wvdGVtcGxhdGVcL2RlZmF1bHQyXC9iYW5uZXJfMS5qcGciLCJsaW5rdXJsIjoiIn0sIkMxNDY1ODA4NTU2MDAyIjp7ImltZ3VybCI6Ii4uXC9hZGRvbnNcL2V3ZWlfc2hvcHYyXC9wbHVnaW5cL2RpeXBhZ2VcL3N0YXRpY1wvdGVtcGxhdGVcL2RlZmF1bHQyXC9iYW5uZXJfMi5qcGciLCJsaW5rdXJsIjoiIn0sIk0xNDY1ODA4NTc1MTIyIjp7ImltZ3VybCI6Ii4uXC9hZGRvbnNcL2V3ZWlfc2hvcHYyXC9wbHVnaW5cL2RpeXBhZ2VcL3N0YXRpY1wvdGVtcGxhdGVcL2RlZmF1bHQyXC9iYW5uZXJfMy5qcGciLCJsaW5rdXJsIjoiIn19LCJpZCI6ImJhbm5lciJ9LCJNMTQ2NTgwODcwNTA2NCI6eyJzdHlsZSI6eyJoZWlnaHQiOiIyMCIsImJhY2tncm91bmQiOiIjZmZmZmZmIn0sImlkIjoiYmxhbmsifSwiTTE0NjU4MDg2NzMwNDAiOnsicGFyYW1zIjp7InJvdyI6IjIifSwiZGF0YSI6eyJDMTQ2NTgwODY3MzA0MCI6eyJpbWd1cmwiOiIuLlwvYWRkb25zXC9ld2VpX3Nob3B2MlwvcGx1Z2luXC9kaXlwYWdlXC9zdGF0aWNcL3RlbXBsYXRlXC9kZWZhdWx0MlwvcGljdHVyZXdfMS5qcGciLCJsaW5rdXJsIjoiIn0sIkMxNDY1ODA4NjczMDQxIjp7ImltZ3VybCI6Ii4uXC9hZGRvbnNcL2V3ZWlfc2hvcHYyXC9wbHVnaW5cL2RpeXBhZ2VcL3N0YXRpY1wvdGVtcGxhdGVcL2RlZmF1bHQyXC9waWN0dXJld18yLmpwZyIsImxpbmt1cmwiOiIifX0sImlkIjoicGljdHVyZXciLCJzdHlsZSI6eyJwYWRkaW5ndG9wIjoiMCIsInBhZGRpbmdsZWZ0IjoiMCJ9fSwiTTE0NjU4MDg3MDkyODAiOnsic3R5bGUiOnsiaGVpZ2h0IjoiMjAiLCJiYWNrZ3JvdW5kIjoiI2ZmZmZmZiJ9LCJpZCI6ImJsYW5rIn0sIk0xNDY1ODA4NzY2NTY3Ijp7InBhcmFtcyI6eyJyb3ciOiIyIn0sImRhdGEiOnsiQzE0NjU4MDg3NjY1NzAiOnsiaW1ndXJsIjoiLi5cL2FkZG9uc1wvZXdlaV9zaG9wdjJcL3BsdWdpblwvZGl5cGFnZVwvc3RhdGljXC90ZW1wbGF0ZVwvZGVmYXVsdDJcL3BpY3R1cmV3XzMuanBnIiwibGlua3VybCI6IiJ9LCJDMTQ2NTgwODc2NjU3MSI6eyJpbWd1cmwiOiIuLlwvYWRkb25zXC9ld2VpX3Nob3B2MlwvcGx1Z2luXC9kaXlwYWdlXC9zdGF0aWNcL3RlbXBsYXRlXC9kZWZhdWx0MlwvcGljdHVyZXdfNC5qcGciLCJsaW5rdXJsIjoiIn19LCJpZCI6InBpY3R1cmV3Iiwic3R5bGUiOnsicGFkZGluZ3RvcCI6IjAiLCJwYWRkaW5nbGVmdCI6IjAifX0sIk0xNDY1ODA4NzkxMDcyIjp7InN0eWxlIjp7ImhlaWdodCI6IjIwIiwiYmFja2dyb3VuZCI6IiNmZmZmZmYifSwiaWQiOiJibGFuayJ9LCJNMTQ2NTgwODg3MDY4MCI6eyJkYXRhIjp7IkMxNDY1ODA4ODcwNjgwIjp7ImltZ3VybCI6Ii4uXC9hZGRvbnNcL2V3ZWlfc2hvcHYyXC9wbHVnaW5cL2RpeXBhZ2VcL3N0YXRpY1wvdGVtcGxhdGVcL2RlZmF1bHQyXC9iYW5uZXJfMy5qcGciLCJsaW5rdXJsIjoiIn19LCJpZCI6InBpY3R1cmUiLCJzdHlsZSI6eyJwYWRkaW5ndG9wIjoiMCIsInBhZGRpbmdsZWZ0IjoiMCJ9fSwiTTE0NjU4MDkwMTA0MTUiOnsic3R5bGUiOnsiaGVpZ2h0IjoiMjAiLCJiYWNrZ3JvdW5kIjoiI2ZmZmZmZiJ9LCJpZCI6ImJsYW5rIn0sIk0xNDY1ODA4OTgxNTk5Ijp7InBhcmFtcyI6eyJyb3ciOiIyIn0sImRhdGEiOnsiQzE0NjU4MDg5ODE1OTkiOnsiaW1ndXJsIjoiLi5cL2FkZG9uc1wvZXdlaV9zaG9wdjJcL3BsdWdpblwvZGl5cGFnZVwvc3RhdGljXC90ZW1wbGF0ZVwvZGVmYXVsdDJcL3BpY3R1cmV3XzUuanBnIiwibGlua3VybCI6IiJ9LCJDMTQ2NTgwODk4MTYwMCI6eyJpbWd1cmwiOiIuLlwvYWRkb25zXC9ld2VpX3Nob3B2MlwvcGx1Z2luXC9kaXlwYWdlXC9zdGF0aWNcL3RlbXBsYXRlXC9kZWZhdWx0MlwvcGljdHVyZXdfNi5qcGciLCJsaW5rdXJsIjoiIn19LCJpZCI6InBpY3R1cmV3Iiwic3R5bGUiOnsicGFkZGluZ3RvcCI6IjAiLCJwYWRkaW5nbGVmdCI6IjAifX0sIk0xNDY1ODg5MzczNTY3Ijp7InBhcmFtcyI6eyJzaG93dGl0bGUiOiIxIiwic2hvd3ByaWNlIjoiMSIsImdvb2RzZGF0YSI6IjAiLCJjYXRlaWQiOiIiLCJjYXRlbmFtZSI6IiIsImdyb3VwaWQiOiIiLCJncm91cG5hbWUiOiIiLCJnb29kc3NvcnQiOiIwIiwiZ29vZHNudW0iOiI2Iiwic2hvd2ljb24iOiIxIiwiaWNvbnBvc2l0aW9uIjoibGVmdCB0b3AifSwic3R5bGUiOnsibGlzdHN0eWxlIjoiYmxvY2siLCJidXlzdHlsZSI6ImJ1eWJ0bi0xIiwiZ29vZHNpY29uIjoicmVjb21tYW5kIiwicHJpY2Vjb2xvciI6IiNlZDI4MjIiLCJpY29ucGFkZGluZ3RvcCI6IjAiLCJpY29ucGFkZGluZ2xlZnQiOiIwIiwiYnV5YnRuY29sb3IiOiIjZmU1NDU1IiwiaWNvbnpvb20iOiIxMDAiLCJ0aXRsZWNvbG9yIjoiIzI2MjYyNiJ9LCJkYXRhIjp7IkMxNDY1ODg5MzczNTY3Ijp7InRodW1iIjoiLi5cL2FkZG9uc1wvZXdlaV9zaG9wdjJcL3BsdWdpblwvZGl5cGFnZVwvc3RhdGljXC9pbWFnZXNcL2RlZmF1bHRcL2dvb2RzLTEuanBnIiwicHJpY2UiOiIyMC4wMCIsInRpdGxlIjoiXHU4ZmQ5XHU5MWNjXHU2NjJmXHU1NTQ2XHU1NGMxXHU2ODA3XHU5ODk4IiwiZ2lkIjoiIn0sIkMxNDY1ODg5MzczNTY4Ijp7InRodW1iIjoiLi5cL2FkZG9uc1wvZXdlaV9zaG9wdjJcL3BsdWdpblwvZGl5cGF\r\nnZVwvc3RhdGljXC9pbWFnZXNcL2RlZmF1bHRcL2dvb2RzLTIuanBnIiwicHJpY2UiOiIyMC4wMCIsInRpdGxlIjoiXHU4ZmQ5XHU5MWNjXHU2NjJmXHU1NTQ2XHU1NGMxXHU2ODA3XHU5ODk4IiwiZ2lkIjoiIn0sIkMxNDY1ODg5MzczNTY5Ijp7InRodW1iIjoiLi5cL2FkZG9uc1wvZXdlaV9zaG9wdjJcL3BsdWdpblwvZGl5cGFnZVwvc3RhdGljXC9pbWFnZXNcL2RlZmF1bHRcL2dvb2RzLTMuanBnIiwicHJpY2UiOiIyMC4wMCIsInRpdGxlIjoiXHU4ZmQ5XHU5MWNjXHU2NjJmXHU1NTQ2XHU1NGMxXHU2ODA3XHU5ODk4IiwiZ2lkIjoiIn0sIkMxNDY1ODg5MzczNTcwIjp7InRodW1iIjoiLi5cL2FkZG9uc1wvZXdlaV9zaG9wdjJcL3BsdWdpblwvZGl5cGFnZVwvc3RhdGljXC9pbWFnZXNcL2RlZmF1bHRcL2dvb2RzLTQuanBnIiwicHJpY2UiOiIyMC4wMCIsInRpdGxlIjoiXHU4ZmQ5XHU5MWNjXHU2NjJmXHU1NTQ2XHU1NGMxXHU2ODA3XHU5ODk4IiwiZ2lkIjoiIn19LCJpZCI6Imdvb2RzIn0sIk0xNDY1ODg5Mzc3NDIzIjp7InBhcmFtcyI6eyJjb250ZW50IjoiUEhBZ2MzUjViR1U5SW5SbGVIUXRZV3hwWjI0NklHTmxiblJsY2pzaVB1V2J2dWVKaCthZHBlYTZrT1M2anVlOWtlZTduTys4ak9lSmlPYWRnK1c5a3VXT24rUzluT2lBaGVhSmdPYWNpVHd2Y0Q0PSJ9LCJzdHlsZSI6eyJiYWNrZ3JvdW5kIjoiI2ZmZmZmZiIsInBhZGRpbmciOiIyMCJ9LCJpZCI6InJpY2h0ZXh0In19fQ==', '../addons/yunphp_shop/plugin/diypage/static/template/default2/preview.jpg', 2, 0, 0, 0);
INSERT INTO `ims_yunphp_shop_diypage_template` VALUES (3, 0, 2, '系统模板03', 'eyJwYWdlIjp7InR5cGUiOiIyIiwidGl0bGUiOiJcdTMwMTBcdTZhMjFcdTY3N2ZcdTMwMTFcdTdjZmJcdTdlZGZcdTZhMjFcdTY3N2YwMyIsIm5hbWUiOiJcdTMwMTBcdTZhMjFcdTY3N2ZcdTMwMTFcdTdjZmJcdTdlZGZcdTZhMjFcdTY3N2YwMyIsImRlc2MiOiIiLCJpY29uIjoiIiwia2V5d29yZCI6IiIsImJhY2tncm91bmQiOiIjZmFmYWZhIiwiZGl5bWVudSI6Ii0xIn0sIml0ZW1zIjp7Ik0xNDY1ODA5MjQyOTc2Ijp7InN0eWxlIjp7ImRvdHN0eWxlIjoicm91bmQiLCJkb3RhbGlnbiI6ImxlZnQiLCJiYWNrZ3JvdW5kIjoiIzM0YmVkYyIsImxlZnRyaWdodCI6IjEwIiwiYm90dG9tIjoiMTAiLCJvcGFjaXR5IjoiMC43In0sImRhdGEiOnsiQzE0NjU4MDkyNDI5NzYiOnsiaW1ndXJsIjoiLi5cL2FkZG9uc1wvZXdlaV9zaG9wdjJcL3BsdWdpblwvZGl5cGFnZVwvc3RhdGljXC90ZW1wbGF0ZVwvZGVmYXVsdDNcL2Jhbm5lcl8xLmpwZyIsImxpbmt1cmwiOiIifSwiQzE0NjU4MDkyNDI5NzciOnsiaW1ndXJsIjoiLi5cL2FkZG9uc1wvZXdlaV9zaG9wdjJcL3BsdWdpblwvZGl5cGFnZVwvc3RhdGljXC90ZW1wbGF0ZVwvZGVmYXVsdDNcL2Jhbm5lcl8yLmpwZyIsImxpbmt1cmwiOiIifSwiTTE0NjU4MDkyNjU5OTIiOnsiaW1ndXJsIjoiLi5cL2FkZG9uc1wvZXdlaV9zaG9wdjJcL3BsdWdpblwvZGl5cGFnZVwvc3RhdGljXC90ZW1wbGF0ZVwvZGVmYXVsdDNcL2Jhbm5lcl8zLmpwZyIsImxpbmt1cmwiOiIifX0sImlkIjoiYmFubmVyIn0sIk0xNDY1ODA5NTQxNTM1Ijp7InBhcmFtcyI6eyJyb3ciOiIxIn0sImRhdGEiOnsiQzE0NjU4MDk1NDE1MzUiOnsiaW1ndXJsIjoiLi5cL2FkZG9uc1wvZXdlaV9zaG9wdjJcL3BsdWdpblwvZGl5cGFnZVwvc3RhdGljXC90ZW1wbGF0ZVwvZGVmYXVsdDNcL3BpY3R1cmV3XzEuanBnIiwibGlua3VybCI6IiJ9LCJDMTQ2NTgwOTU0MTUzNiI6eyJpbWd1cmwiOiIuLlwvYWRkb25zXC9ld2VpX3Nob3B2MlwvcGx1Z2luXC9kaXlwYWdlXC9zdGF0aWNcL3RlbXBsYXRlXC9kZWZhdWx0M1wvcGljdHVyZXdfMi5qcGciLCJsaW5rdXJsIjoiIn0sIkMxNDY1ODA5NTQxNTM3Ijp7ImltZ3VybCI6Ii4uXC9hZGRvbnNcL2V3ZWlfc2hvcHYyXC9wbHVnaW5cL2RpeXBhZ2VcL3N0YXRpY1wvdGVtcGxhdGVcL2RlZmF1bHQzXC9waWN0dXJld18zLmpwZyIsImxpbmt1cmwiOiIifX0sImlkIjoicGljdHVyZXciLCJzdHlsZSI6eyJwYWRkaW5ndG9wIjoiNSIsInBhZGRpbmdsZWZ0IjoiNSIsImJhY2tncm91bmQiOiIjZmFmYWZhIn19LCJNMTQ2NTgwOTc2MzQxNSI6eyJzdHlsZSI6eyJoZWlnaHQiOiI1IiwiYmFja2dyb3VuZCI6IiNmYWZhZmEifSwiaWQiOiJibGFuayJ9LCJNMTQ2NTgwOTcwOTA0MCI6eyJwYXJhbXMiOnsidGl0bGUiOiJcdTY1YjBcdTU0YzFcdTRlMGFcdTVlMDIiLCJpY29uIjoiaWNvbi1uZXcifSwic3R5bGUiOnsiYmFja2dyb3VuZCI6IiMyOGMxOTIiLCJjb2xvciI6IiNmZmZmZmYiLCJ0ZXh0YWxpZ24iOiJsZWZ0IiwiZm9udHNpemUiOiIxOCIsInBhZGRpbmd0b3AiOiI1IiwicGFkZGluZ2xlZnQiOiI1In0sImlkIjoidGl0bGUifSwiTTE0NjU4MDk3OTEyMzEiOnsicGFyYW1zIjp7InNob3d0aXRsZSI6IjEiLCJzaG93cHJpY2UiOiIxIiwiZ29vZHNkYXRhIjoiMCIsImNhdGVpZCI6IiIsImNhdGVuYW1lIjoiIiwiZ3JvdXBpZCI6IiIsImdyb3VwbmFtZSI6IiIsImdvb2Rzc29ydCI6IjAiLCJnb29kc251bSI6IjYiLCJzaG93aWNvbiI6IjAiLCJpY29ucG9zaXRpb24iOiJsZWZ0IHRvcCJ9LCJzdHlsZSI6eyJsaXN0c3R5bGUiOiJibG9jayIsImJ1eXN0eWxlIjoiYnV5YnRuLTMiLCJnb29kc2ljb24iOiJyZWNvbW1hbmQiLCJwcmljZWNvbG9yIjoiIzI4YzE5MiIsImljb25wYWRkaW5ndG9wIjoiMCIsImljb25wYWRkaW5nbGVmdCI6IjAiLCJidXlidG5jb2xvciI6IiMyOGMxOGYiLCJpY29uem9vbSI6IjEwMCIsInRpdGxlY29sb3IiOiIjMjhjMTkyIn0sImRhdGEiOnsiQzE0NjU4MDk3OTEyMzEiOnsidGh1bWIiOiIuLlwvYWRkb25zXC9ld2VpX3Nob3B2MlwvcGx1Z2luXC9kaXlwYWdlXC9zdGF0aWNcL2ltYWdlc1wvZGVmYXVsdFwvZ29vZHMtMS5qcGciLCJwcmljZSI6IjIwLjAwIiwidGl0bGUiOiJcdThmZDlcdTkxY2NcdTY2MmZcdTU1NDZcdTU0YzFcdTY4MDdcdTk4OTgiLCJnaWQiOiIifSwiQzE0NjU4MDk3OTEyMzIiOnsidGh1bWIiOiIuLlwvYWRkb25zXC9ld2VpX3Nob3B2MlwvcGx1Z2luXC9kaXlwYWdlXC9zdGF0aWNcL2ltYWdlc1wvZGVmYXVsdFwvZ29vZHMtMi5qcGciLCJwcmljZSI6IjIwLjAwIiwidGl0bGUiOiJcdThmZDlcdTkxY2NcdTY2MmZcdTU1NDZcdTU0YzFcdTY4MDdcdTk4OTgiLCJnaWQiOiIifSwiQzE0NjU4MDk3OTEyMzMiOnsidGh1bWIiOiIuLlwvYWRkb25zXC9ld2VpX3Nob3B2MlwvcGx1Z2luXC9kaXlwYWdlXC9zdGF0aWNcL2ltYWdlc1wvZGVmYXVsdFwvZ29vZHMtMy5qcGciLCJwcmljZSI6IjIwLjAwIiwidGl0bGUiOiJcdThmZDlcdTkxY2NcdTY2MmZcdTU1NDZcdTU0YzFcdTY4MDdcdTk4OTgiLCJnaWQiOiIifSwiQzE0NjU4MDk3OTEyMzQiOnsidGh1bWIiOiIuLlwvYWRkb25zXC9ld2VpX3Nob3B2MlwvcGx1Z2luXC9kaXlwYWdlXC9zdGF0aWNcL2ltYWdlc1wvZGVmYXVsdFwvZ29vZHMtNC5qcGciLCJwcmljZSI6IjIwLjAwIiwidGl0bGUiOiJcdThmZDlcdTkxY2NcdTY2MmZcdTU1NDZcdTU0YzFcdTY4MDdcdTk4OTgiLCJnaWQiOiIifX0sImlkIjoiZ29vZHMifSwiTTE0NjU4MDk5NTA4NDciOnsicGFyYW1zIjp7InRpdGxlIjoiXHU2MzhjXHU2N2RjXHU2M2E4XHU4MzUwIiwiaWNvbiI6Imljb24tYXBwcmVjaWF0ZSJ9LCJzdHlsZSI6eyJiYWNrZ3JvdW5kIjoiI2ZmYmQzMyIsImNvbG9yIjoiI2ZmZmZmZiIsInRleHRhbGlnbiI6InJpZ2h0IiwiZm9udHNpemUiOiIxOCIsInBhZGRpbmd0b3AiOiI1IiwicGFkZGluZ2xlZnQiOiI1In0sImlkIjoidGl0bGUifSwiTTE0NjU4MDk5NDMyMzEiOnsicGFyYW1zIjp7InNob3d0aXRsZSI6IjEiLCJzaG93cHJpY2UiOiIxIiwiZ29vZHNkYXRhIjoiMCIsImNhdGVpZCI\r\n6IiIsImNhdGVuYW1lIjoiIiwiZ3JvdXBpZCI6IiIsImdyb3VwbmFtZSI6IiIsImdvb2Rzc29ydCI6IjAiLCJnb29kc251bSI6IjYiLCJzaG93aWNvbiI6IjEiLCJpY29ucG9zaXRpb24iOiJsZWZ0IHRvcCJ9LCJzdHlsZSI6eyJsaXN0c3R5bGUiOiJibG9jayIsImJ1eXN0eWxlIjoiYnV5YnRuLTEiLCJnb29kc2ljb24iOiJyZWNvbW1hbmQiLCJwcmljZWNvbG9yIjoiI2VkMjgyMiIsImljb25wYWRkaW5ndG9wIjoiMCIsImljb25wYWRkaW5nbGVmdCI6IjAiLCJidXlidG5jb2xvciI6IiNmZTU0NTUiLCJpY29uem9vbSI6IjEwMCIsInRpdGxlY29sb3IiOiIjMjYyNjI2In0sImRhdGEiOnsiQzE0NjU4MDk5NDMyMzEiOnsidGh1bWIiOiIuLlwvYWRkb25zXC9ld2VpX3Nob3B2MlwvcGx1Z2luXC9kaXlwYWdlXC9zdGF0aWNcL2ltYWdlc1wvZGVmYXVsdFwvZ29vZHMtMS5qcGciLCJwcmljZSI6IjIwLjAwIiwidGl0bGUiOiJcdThmZDlcdTkxY2NcdTY2MmZcdTU1NDZcdTU0YzFcdTY4MDdcdTk4OTgiLCJnaWQiOiIifSwiQzE0NjU4MDk5NDMyMzIiOnsidGh1bWIiOiIuLlwvYWRkb25zXC9ld2VpX3Nob3B2MlwvcGx1Z2luXC9kaXlwYWdlXC9zdGF0aWNcL2ltYWdlc1wvZGVmYXVsdFwvZ29vZHMtMi5qcGciLCJwcmljZSI6IjIwLjAwIiwidGl0bGUiOiJcdThmZDlcdTkxY2NcdTY2MmZcdTU1NDZcdTU0YzFcdTY4MDdcdTk4OTgiLCJnaWQiOiIifSwiQzE0NjU4MDk5NDMyMzMiOnsidGh1bWIiOiIuLlwvYWRkb25zXC9ld2VpX3Nob3B2MlwvcGx1Z2luXC9kaXlwYWdlXC9zdGF0aWNcL2ltYWdlc1wvZGVmYXVsdFwvZ29vZHMtMy5qcGciLCJwcmljZSI6IjIwLjAwIiwidGl0bGUiOiJcdThmZDlcdTkxY2NcdTY2MmZcdTU1NDZcdTU0YzFcdTY4MDdcdTk4OTgiLCJnaWQiOiIifSwiQzE0NjU4MDk5NDMyMzQiOnsidGh1bWIiOiIuLlwvYWRkb25zXC9ld2VpX3Nob3B2MlwvcGx1Z2luXC9kaXlwYWdlXC9zdGF0aWNcL2ltYWdlc1wvZGVmYXVsdFwvZ29vZHMtNC5qcGciLCJwcmljZSI6IjIwLjAwIiwidGl0bGUiOiJcdThmZDlcdTkxY2NcdTY2MmZcdTU1NDZcdTU0YzFcdTY4MDdcdTk4OTgiLCJnaWQiOiIifX0sImlkIjoiZ29vZHMifSwiTTE0NjU4MTAwNTk2OTQiOnsicGFyYW1zIjp7ImNvbnRlbnQiOiJQSEFnYzNSNWJHVTlJblJsZUhRdFlXeHBaMjQ2SUdObGJuUmxjanNpUGp4aWNpOCtQQzl3UGp4d0lITjBlV3hsUFNKMFpYaDBMV0ZzYVdkdU9pQmpaVzUwWlhJN0lqN25pWWptbllQbWlZRG1uSWtvWXlsWVdPV1ZodVdmamp3dmNENDhjRDRtYm1KemNEczhZbkl2UGp3dmNEND0ifSwic3R5bGUiOnsiYmFja2dyb3VuZCI6IiNmZmZmZmYifSwiaWQiOiJyaWNodGV4dCJ9fX0=', '../addons/yunphp_shop/plugin/diypage/static/template/default3/preview.jpg', 3, 0, 0, 0);
INSERT INTO `ims_yunphp_shop_diypage_template` VALUES (4, 0, 1, '系统模板04', 'eyJwYWdlIjp7InR5cGUiOiIxIiwidGl0bGUiOiJcdTMwMTBcdTZhMjFcdTY3N2ZcdTMwMTFcdTdjZmJcdTdlZGZcdTZhMjFcdTY3N2YwNCIsIm5hbWUiOiJcdTMwMTBcdTZhMjFcdTY3N2ZcdTMwMTFcdTdjZmJcdTdlZGZcdTZhMjFcdTY3N2YwNCIsImRlc2MiOiIiLCJpY29uIjoiIiwia2V5d29yZCI6IiIsImJhY2tncm91bmQiOiIjZmFmYWZhIiwiZGl5bWVudSI6Ii0xIn0sIml0ZW1zIjp7Ik0xNDY1ODEwMzUyODk0Ijp7ImRhdGEiOnsiQzE0NjU4MTAzNTI4OTQiOnsiaW1ndXJsIjoiLi5cL2FkZG9uc1wvZXdlaV9zaG9wdjJcL3BsdWdpblwvZGl5cGFnZVwvc3RhdGljXC90ZW1wbGF0ZVwvZGVmYXVsdDRcL3BpY3R1cmVfMS5wbmciLCJsaW5rdXJsIjoiIn0sIkMxNDY1ODEwMzUyODk1Ijp7ImltZ3VybCI6Ii4uXC9hZGRvbnNcL2V3ZWlfc2hvcHYyXC9wbHVnaW5cL2RpeXBhZ2VcL3N0YXRpY1wvdGVtcGxhdGVcL2RlZmF1bHQ0XC9waWN0dXJlXzIucG5nIiwibGlua3VybCI6IiJ9LCJNMTQ2NTgxMDM3MDM5OSI6eyJpbWd1cmwiOiIuLlwvYWRkb25zXC9ld2VpX3Nob3B2MlwvcGx1Z2luXC9kaXlwYWdlXC9zdGF0aWNcL3RlbXBsYXRlXC9kZWZhdWx0NFwvcGljdHVyZV8zLnBuZyIsImxpbmt1cmwiOiIifSwiTTE0NjU4MTAzNzE3MDEiOnsiaW1ndXJsIjoiLi5cL2FkZG9uc1wvZXdlaV9zaG9wdjJcL3BsdWdpblwvZGl5cGFnZVwvc3RhdGljXC90ZW1wbGF0ZVwvZGVmYXVsdDRcL3BpY3R1cmVfNC5wbmciLCJsaW5rdXJsIjoiIn0sIk0xNDY1ODEwMzcyNzkxIjp7ImltZ3VybCI6Ii4uXC9hZGRvbnNcL2V3ZWlfc2hvcHYyXC9wbHVnaW5cL2RpeXBhZ2VcL3N0YXRpY1wvdGVtcGxhdGVcL2RlZmF1bHQ0XC9waWN0dXJlXzUucG5nIiwibGlua3VybCI6IiJ9fSwiaWQiOiJwaWN0dXJlIiwic3R5bGUiOnsicGFkZGluZ3RvcCI6IjAiLCJwYWRkaW5nbGVmdCI6IjAifX0sIk0xNDY1ODg5OTQ0NzY5Ijp7InBhcmFtcyI6eyJjb250ZW50IjoiUEhBZ2MzUjViR1U5SW5SbGVIUXRZV3hwWjI0NklHTmxiblJsY2pzaVB1V2J2dWVKaCthZHBlYTZrT1M2anVlOWtlZTduTys4ak9lSmlPYWRnK1c5a3VXT24rUzluT2lBaGVhSmdPYWNpVHd2Y0Q0PSJ9LCJzdHlsZSI6eyJiYWNrZ3JvdW5kIjoiI2ZmZmZmZiIsInBhZGRpbmciOiIyMCJ9LCJpZCI6InJpY2h0ZXh0In19fQ==', '../addons/yunphp_shop/plugin/diypage/static/template/default4/preview.jpg', 4, 0, 0, 0);
INSERT INTO `ims_yunphp_shop_diypage_template` VALUES (5, 0, 2, '系统模板05', 'eyJwYWdlIjp7InR5cGUiOiIyIiwidGl0bGUiOiJcdTMwMTBcdTZhMjFcdTY3N2ZcdTMwMTFcdTdjZmJcdTdlZGZcdTZhMjFcdTY3N2YwNSIsIm5hbWUiOiJcdTMwMTBcdTZhMjFcdTY3N2ZcdTMwMTFcdTdjZmJcdTdlZGZcdTZhMjFcdTY3N2YwNSIsImRlc2MiOiIiLCJpY29uIjoiIiwia2V5d29yZCI6InQ1IiwiYmFja2dyb3VuZCI6IiNmYWZhZmEiLCJkaXltZW51IjoiLTEifSwiaXRlbXMiOnsiTTE0NjU4MTA3NTE4MDciOnsic3R5bGUiOnsiZG90c3R5bGUiOiJyb3VuZCIsImRvdGFsaWduIjoibGVmdCIsImJhY2tncm91bmQiOiIjZmZmZmZmIiwibGVmdHJpZ2h0IjoiMTAiLCJib3R0b20iOiIxMCIsIm9wYWNpdHkiOiIwLjcifSwiZGF0YSI6eyJDMTQ2NTgxMDc1MTgwNyI6eyJpbWd1cmwiOiIuLlwvYWRkb25zXC9ld2VpX3Nob3B2MlwvcGx1Z2luXC9kaXlwYWdlXC9zdGF0aWNcL3RlbXBsYXRlXC9kZWZhdWx0NVwvYmFubmVyXzEuanBnIiwibGlua3VybCI6IiJ9LCJDMTQ2NTgxMDc1MTgwOCI6eyJpbWd1cmwiOiIuLlwvYWRkb25zXC9ld2VpX3Nob3B2MlwvcGx1Z2luXC9kaXlwYWdlXC9zdGF0aWNcL3RlbXBsYXRlXC9kZWZhdWx0NVwvYmFubmVyXzIuanBnIiwibGlua3VybCI6IiJ9LCJNMTQ2NTgxMDc2NjQ4NiI6eyJpbWd1cmwiOiIuLlwvYWRkb25zXC9ld2VpX3Nob3B2MlwvcGx1Z2luXC9kaXlwYWdlXC9zdGF0aWNcL3RlbXBsYXRlXC9kZWZhdWx0NVwvYmFubmVyXzMuanBnIiwibGlua3VybCI6IiJ9fSwiaWQiOiJiYW5uZXIifSwiTTE0NjU4MTA5NzA0OTQiOnsic3R5bGUiOnsibmF2c3R5bGUiOiIiLCJiYWNrZ3JvdW5kIjoiI2ZmZmZmZiIsInJvd251bSI6IjQifSwiZGF0YSI6eyJDMTQ2NTgxMDk3MDQ5NCI6eyJpbWd1cmwiOiIuLlwvYWRkb25zXC9ld2VpX3Nob3B2MlwvcGx1Z2luXC9kaXlwYWdlXC9zdGF0aWNcL3RlbXBsYXRlXC9kZWZhdWx0NVwvbWVudV8xLnBuZyIsImxpbmt1cmwiOiIiLCJ0ZXh0IjoiSE9NRSIsImNvbG9yIjoiIzY2NjY2NiJ9LCJDMTQ2NTgxMDk3MDQ5NSI6eyJpbWd1cmwiOiIuLlwvYWRkb25zXC9ld2VpX3Nob3B2MlwvcGx1Z2luXC9kaXlwYWdlXC9zdGF0aWNcL3RlbXBsYXRlXC9kZWZhdWx0NVwvbWVudV8yLnBuZyIsImxpbmt1cmwiOiIiLCJ0ZXh0IjoiTkVXIiwiY29sb3IiOiIjNjY2NjY2In0sIkMxNDY1ODEwOTcwNDk2Ijp7ImltZ3VybCI6Ii4uXC9hZGRvbnNcL2V3ZWlfc2hvcHYyXC9wbHVnaW5cL2RpeXBhZ2VcL3N0YXRpY1wvdGVtcGxhdGVcL2RlZmF1bHQ1XC9tZW51XzMucG5nIiwibGlua3VybCI6IiIsInRleHQiOiJIT1QiLCJjb2xvciI6IiM2NjY2NjYifSwiQzE0NjU4MTA5NzA0OTciOnsiaW1ndXJsIjoiLi5cL2FkZG9uc1wvZXdlaV9zaG9wdjJcL3BsdWdpblwvZGl5cGFnZVwvc3RhdGljXC90ZW1wbGF0ZVwvZGVmYXVsdDVcL21lbnVfNC5wbmciLCJsaW5rdXJsIjoiIiwidGV4dCI6IkxJU1QiLCJjb2xvciI6IiM2NjY2NjYifX0sImlkIjoibWVudSJ9LCJNMTQ2NTgxMTA5OTI0MCI6eyJwYXJhbXMiOnsicm93IjoiMyJ9LCJkYXRhIjp7IkMxNDY1ODExMDk5MjQwIjp7ImltZ3VybCI6Ii4uXC9hZGRvbnNcL2V3ZWlfc2hvcHYyXC9wbHVnaW5cL2RpeXBhZ2VcL3N0YXRpY1wvdGVtcGxhdGVcL2RlZmF1bHQ1XC9waWN0dXJld18xLmpwZyIsImxpbmt1cmwiOiIifSwiQzE0NjU4MTEwOTkyNDEiOnsiaW1ndXJsIjoiLi5cL2FkZG9uc1wvZXdlaV9zaG9wdjJcL3BsdWdpblwvZGl5cGFnZVwvc3RhdGljXC90ZW1wbGF0ZVwvZGVmYXVsdDVcL3BpY3R1cmV3XzQuanBnIiwibGlua3VybCI6IiJ9LCJDMTQ2NTgxMTA5OTI0MyI6eyJpbWd1cmwiOiIuLlwvYWRkb25zXC9ld2VpX3Nob3B2MlwvcGx1Z2luXC9kaXlwYWdlXC9zdGF0aWNcL3RlbXBsYXRlXC9kZWZhdWx0NVwvcGljdHVyZXdfMS5qcGciLCJsaW5rdXJsIjoiIn19LCJpZCI6InBpY3R1cmV3Iiwic3R5bGUiOnsiYmFja2dyb3VuZCI6IiNmZmZmZmYiLCJwYWRkaW5ndG9wIjoiNSIsInBhZGRpbmdsZWZ0IjoiNSJ9fSwiTTE0NjU4MTIzOTAxNzQiOnsicGFyYW1zIjp7InJvdyI6IjIifSwiZGF0YSI6eyJDMTQ2NTgxMjM5MDE3NSI6eyJpbWd1cmwiOiIuLlwvYWRkb25zXC9ld2VpX3Nob3B2MlwvcGx1Z2luXC9kaXlwYWdlXC9zdGF0aWNcL3RlbXBsYXRlXC9kZWZhdWx0NVwvcGljdHVyZXdfMy5qcGciLCJsaW5rdXJsIjoiIn0sIkMxNDY1ODEyMzkwMTc2Ijp7ImltZ3VybCI6Ii4uXC9hZGRvbnNcL2V3ZWlfc2hvcHYyXC9wbHVnaW5cL2RpeXBhZ2VcL3N0YXRpY1wvdGVtcGxhdGVcL2RlZmF1bHQ1XC9waWN0dXJld18zLmpwZyIsImxpbmt1cmwiOiIifX0sImlkIjoicGljdHVyZXciLCJzdHlsZSI6eyJiYWNrZ3JvdW5kIjoiI2ZmZmZmZiIsInBhZGRpbmd0b3AiOiIwIiwicGFkZGluZ2xlZnQiOiI1In19LCJNMTQ2NTg3MjQ4NTQ4NiI6eyJzdHlsZSI6eyJoZWlnaHQiOiIxMCIsImJhY2tncm91bmQiOiIjZmFmYWZhIn0sImlkIjoiYmxhbmsifSwiTTE0NjU4MTExNzQ5NTgiOnsiZGF0YSI6eyJDMTQ2NTgxMTE3NDk1OSI6eyJpbWd1cmwiOiIuLlwvYWRkb25zXC9ld2VpX3Nob3B2MlwvcGx1Z2luXC9kaXlwYWdlXC9zdGF0aWNcL3RlbXBsYXRlXC9kZWZhdWx0NVwvcGljdHVyZV8xLmpwZyIsImxpbmt1cmwiOiIifX0sImlkIjoicGljdHVyZSIsInN0eWxlIjp7InBhZGRpbmd0b3AiOiIwIiwicGFkZGluZ2xlZnQiOiIwIn19LCJNMTQ2NTgxMjQxMTM4MSI6eyJwYXJhbXMiOnsic2hvd3RpdGxlIjoiMSIsInNob3dwcmljZSI6IjEiLCJnb29kc2RhdGEiOiIwIiwiY2F0ZWlkIjoiIiwiY2F0ZW5hbWUiOiIiLCJncm91cGlkIjoiIiwiZ3JvdXBuYW1lIjoiIiwiZ29vZHNzb3J0IjoiMCIsImdvb2RzbnVtIjoiNiIsInNob3dpY29uIjoiMSIsImljb25wb3NpdGlvbiI6ImxlZnQgdG9wIn0sInN0eWxlIjp7Imxpc3RzdHlsZSI6ImJsb2NrIiwiYnV5c3R5bGUiOiJidXlidG4tMSIsImdvb2RzaWNvbiI6InJlY29tbWFuZCIsInByaWNlY29sb3IiOiIjZWQyODIyIiwiaWNvbnBhZGRpbmd0b3AiOiIwIiwiaWNvbnBhZGRpbmdsZWZ0IjoiMCIsImJ1eWJ0bmNvbG9yIjoiI2ZlNTQ1NSIsImljb25\r\n6b29tIjoiMTAwIiwidGl0bGVjb2xvciI6IiMyNjI2MjYifSwiZGF0YSI6eyJDMTQ2NTgxMjQxMTM4MSI6eyJ0aHVtYiI6Ii4uXC9hZGRvbnNcL2V3ZWlfc2hvcHYyXC9wbHVnaW5cL2RpeXBhZ2VcL3N0YXRpY1wvaW1hZ2VzXC9kZWZhdWx0XC9nb29kcy0xLmpwZyIsInByaWNlIjoiMjAuMDAiLCJ0aXRsZSI6Ilx1OGZkOVx1OTFjY1x1NjYyZlx1NTU0Nlx1NTRjMVx1NjgwN1x1OTg5OCIsImdpZCI6IiJ9LCJDMTQ2NTgxMjQxMTM4MiI6eyJ0aHVtYiI6Ii4uXC9hZGRvbnNcL2V3ZWlfc2hvcHYyXC9wbHVnaW5cL2RpeXBhZ2VcL3N0YXRpY1wvaW1hZ2VzXC9kZWZhdWx0XC9nb29kcy0yLmpwZyIsInByaWNlIjoiMjAuMDAiLCJ0aXRsZSI6Ilx1OGZkOVx1OTFjY1x1NjYyZlx1NTU0Nlx1NTRjMVx1NjgwN1x1OTg5OCIsImdpZCI6IiJ9LCJDMTQ2NTgxMjQxMTM4MyI6eyJ0aHVtYiI6Ii4uXC9hZGRvbnNcL2V3ZWlfc2hvcHYyXC9wbHVnaW5cL2RpeXBhZ2VcL3N0YXRpY1wvaW1hZ2VzXC9kZWZhdWx0XC9nb29kcy0zLmpwZyIsInByaWNlIjoiMjAuMDAiLCJ0aXRsZSI6Ilx1OGZkOVx1OTFjY1x1NjYyZlx1NTU0Nlx1NTRjMVx1NjgwN1x1OTg5OCIsImdpZCI6IiJ9LCJDMTQ2NTgxMjQxMTM4NCI6eyJ0aHVtYiI6Ii4uXC9hZGRvbnNcL2V3ZWlfc2hvcHYyXC9wbHVnaW5cL2RpeXBhZ2VcL3N0YXRpY1wvaW1hZ2VzXC9kZWZhdWx0XC9nb29kcy00LmpwZyIsInByaWNlIjoiMjAuMDAiLCJ0aXRsZSI6Ilx1OGZkOVx1OTFjY1x1NjYyZlx1NTU0Nlx1NTRjMVx1NjgwN1x1OTg5OCIsImdpZCI6IiJ9fSwiaWQiOiJnb29kcyJ9LCJNMTQ2NTgxMjQ2Njg5MyI6eyJwYXJhbXMiOnsiY29udGVudCI6IlBIQWdjM1I1YkdVOUluUmxlSFF0WVd4cFoyNDZJR05sYm5SbGNqc2lQanhpY2k4K1BDOXdQanh3SUhOMGVXeGxQU0owWlhoMExXRnNhV2R1T2lCalpXNTBaWEk3SWo3a3U2WGt1SXJsbTc3bmlZZmxuWWZtbmFYbXVwRGt1bzdudlpIbnU1enZ2SXpuaVlqbW5ZUGx2WkxsanBcL2t2WnpvZ0lYbWlZRG1uSW5qZ0lJOEwzQStQSEErUEdKeUx6NDhMM0ErIn0sInN0eWxlIjp7ImJhY2tncm91bmQiOiIjZmZmZmZmIn0sImlkIjoicmljaHRleHQifX19', '../addons/yunphp_shop/plugin/diypage/static/template/default5/preview.jpg', 5, 0, 0, 0);
INSERT INTO `ims_yunphp_shop_diypage_template` VALUES (6, 0, 1, '系统模板06', 'eyJwYWdlIjp7InR5cGUiOiIxIiwidGl0bGUiOiJcdTMwMTBcdTZhMjFcdTY3N2ZcdTMwMTFcdTdjZmJcdTdlZGZcdTZhMjFcdTY3N2YwNiIsIm5hbWUiOiJcdTMwMTBcdTZhMjFcdTY3N2ZcdTMwMTFcdTdjZmJcdTdlZGZcdTZhMjFcdTY3N2YwNiIsImRlc2MiOiIiLCJpY29uIjoiIiwia2V5d29yZCI6IiIsImJhY2tncm91bmQiOiIjZmFmYWZhIiwiZGl5bWVudSI6Ii0xIn0sIml0ZW1zIjp7Ik0xNDY1ODEyNjAyOTMzIjp7ImRhdGEiOnsiQzE0NjU4MTI2MDI5MzMiOnsiaW1ndXJsIjoiLi5cL2FkZG9uc1wvZXdlaV9zaG9wdjJcL3BsdWdpblwvZGl5cGFnZVwvc3RhdGljXC90ZW1wbGF0ZVwvZGVmYXVsdDZcL3BpY3R1cmVfMS5qcGciLCJsaW5rdXJsIjoiIn0sIkMxNDY1ODEyNjAyOTM0Ijp7ImltZ3VybCI6Ii4uXC9hZGRvbnNcL2V3ZWlfc2hvcHYyXC9wbHVnaW5cL2RpeXBhZ2VcL3N0YXRpY1wvdGVtcGxhdGVcL2RlZmF1bHQ2XC9waWN0dXJlXzIuanBnIiwibGlua3VybCI6IiJ9LCJNMTQ2NTgxMjYwNDQ5NCI6eyJpbWd1cmwiOiIuLlwvYWRkb25zXC9ld2VpX3Nob3B2MlwvcGx1Z2luXC9kaXlwYWdlXC9zdGF0aWNcL3RlbXBsYXRlXC9kZWZhdWx0NlwvcGljdHVyZV8zLmpwZyIsImxpbmt1cmwiOiIifSwiTTE0NjU4MTI2MDUyNDUiOnsiaW1ndXJsIjoiLi5cL2FkZG9uc1wvZXdlaV9zaG9wdjJcL3BsdWdpblwvZGl5cGFnZVwvc3RhdGljXC90ZW1wbGF0ZVwvZGVmYXVsdDZcL3BpY3R1cmVfNC5qcGciLCJsaW5rdXJsIjoiIn0sIk0xNDY1ODEyNjA1OTgwIjp7ImltZ3VybCI6Ii4uXC9hZGRvbnNcL2V3ZWlfc2hvcHYyXC9wbHVnaW5cL2RpeXBhZ2VcL3N0YXRpY1wvdGVtcGxhdGVcL2RlZmF1bHQ2XC9waWN0dXJlXzUuanBnIiwibGlua3VybCI6IiJ9LCJNMTQ2NTgxMjYwNzA0NSI6eyJpbWd1cmwiOiIuLlwvYWRkb25zXC9ld2VpX3Nob3B2MlwvcGx1Z2luXC9kaXlwYWdlXC9zdGF0aWNcL3RlbXBsYXRlXC9kZWZhdWx0NlwvcGljdHVyZV82LmpwZyIsImxpbmt1cmwiOiIifX0sImlkIjoicGljdHVyZSIsInN0eWxlIjp7InBhZGRpbmd0b3AiOiIwIiwicGFkZGluZ2xlZnQiOiIwIn19LCJNMTQ2NTg5MDE4NDY1MCI6eyJwYXJhbXMiOnsiY29udGVudCI6IlBIQWdjM1I1YkdVOUluUmxlSFF0WVd4cFoyNDZJR05sYm5SbGNqc2lQdVdidnVlSmgrYWRwZWE2a09TNmp1ZTlrZWU3bk8rOGpPZUppT2FkZytXOWt1V09uK1M5bk9pQWhlYUpnT2FjaVR3dmNEND0ifSwic3R5bGUiOnsiYmFja2dyb3VuZCI6IiNmZmZmZmYiLCJwYWRkaW5nIjoiMjAifSwiaWQiOiJyaWNodGV4dCJ9fX0=', '../addons/yunphp_shop/plugin/diypage/static/template/default6/preview.jpg', 6, 0, 0, 0);
INSERT INTO `ims_yunphp_shop_diypage_template` VALUES (7, 0, 2, '系统模板07', 'eyJwYWdlIjp7InR5cGUiOiIyIiwidGl0bGUiOiJcdTMwMTBcdTZhMjFcdTY3N2ZcdTMwMTFcdTdjZmJcdTdlZGZcdTZhMjFcdTY3N2YwNyIsIm5hbWUiOiJcdTMwMTBcdTZhMjFcdTY3N2ZcdTMwMTFcdTdjZmJcdTdlZGZcdTZhMjFcdTY3N2YwNyIsImRlc2MiOiIiLCJpY29uIjoiIiwia2V5d29yZCI6IiIsImJhY2tncm91bmQiOiIjZmFmYWZhIiwiZGl5bWVudSI6Ii0xIn0sIml0ZW1zIjp7Ik0xNDY1ODEyNjkxMzg5Ijp7ImRhdGEiOnsiQzE0NjU4MTI2OTEzODkiOnsiaW1ndXJsIjoiLi5cL2FkZG9uc1wvZXdlaV9zaG9wdjJcL3BsdWdpblwvZGl5cGFnZVwvc3RhdGljXC90ZW1wbGF0ZVwvZGVmYXVsdDdcL3BpY3R1cmVfMS5qcGciLCJsaW5rdXJsIjoiIn19LCJpZCI6InBpY3R1cmUiLCJzdHlsZSI6eyJiYWNrZ3JvdW5kIjoiI2ZmZmZmZiIsInBhZGRpbmd0b3AiOiIwIiwicGFkZGluZ2xlZnQiOiIwIn19LCJNMTQ2NTgxMjcyODgyMSI6eyJwYXJhbXMiOnsicGxhY2Vob2xkZXIiOiJcdThiZjdcdThmOTNcdTUxNjVcdTUxNzNcdTk1MmVcdTViNTdcdThmZGJcdTg4NGNcdTY0MWNcdTdkMjIifSwic3R5bGUiOnsiaW5wdXRiYWNrZ3JvdW5kIjoiI2ZmZmZmZiIsImJhY2tncm91bmQiOiIjZjFmMWYyIiwiaWNvbmNvbG9yIjoiI2I0YjRiNCIsImNvbG9yIjoiIzk5OTk5OSIsInBhZGRpbmd0b3AiOiIxMCIsInBhZGRpbmdsZWZ0IjoiMTAiLCJ0ZXh0YWxpZ24iOiJsZWZ0Iiwic2VhcmNoc3R5bGUiOiIifSwiaWQiOiJzZWFyY2gifSwiTTE0NjU4MTI3MzkxOTciOnsicGFyYW1zIjp7InJvdyI6IjMifSwiZGF0YSI6eyJDMTQ2NTgxMjczOTE5NyI6eyJpbWd1cmwiOiIuLlwvYWRkb25zXC9ld2VpX3Nob3B2MlwvcGx1Z2luXC9kaXlwYWdlXC9zdGF0aWNcL3RlbXBsYXRlXC9kZWZhdWx0N1wvcGljdHVyZXdfMS5qcGciLCJsaW5rdXJsIjoiIn0sIkMxNDY1ODEyNzM5MTk4Ijp7ImltZ3VybCI6Ii4uXC9hZGRvbnNcL2V3ZWlfc2hvcHYyXC9wbHVnaW5cL2RpeXBhZ2VcL3N0YXRpY1wvdGVtcGxhdGVcL2RlZmF1bHQ3XC9waWN0dXJld18yLmpwZyIsImxpbmt1cmwiOiIifSwiQzE0NjU4MTI3MzkxOTkiOnsiaW1ndXJsIjoiLi5cL2FkZG9uc1wvZXdlaV9zaG9wdjJcL3BsdWdpblwvZGl5cGFnZVwvc3RhdGljXC90ZW1wbGF0ZVwvZGVmYXVsdDdcL3BpY3R1cmV3XzMuanBnIiwibGlua3VybCI6IiJ9fSwiaWQiOiJwaWN0dXJldyIsInN0eWxlIjp7ImJhY2tncm91bmQiOiIjZmZmZmZmIiwicGFkZGluZ3RvcCI6IjAiLCJwYWRkaW5nbGVmdCI6IjUifX0sIk0xNDY1ODEyNzg0NTY1Ijp7ImRhdGEiOnsiQzE0NjU4MTI3ODQ1NjUiOnsiaW1ndXJsIjoiLi5cL2FkZG9uc1wvZXdlaV9zaG9wdjJcL3BsdWdpblwvZGl5cGFnZVwvc3RhdGljXC90ZW1wbGF0ZVwvZGVmYXVsdDdcL3BpY3R1cmVfMy5qcGciLCJsaW5rdXJsIjoiIn0sIk0xNDY1ODEyODE5OTQ4Ijp7ImltZ3VybCI6Ii4uXC9hZGRvbnNcL2V3ZWlfc2hvcHYyXC9wbHVnaW5cL2RpeXBhZ2VcL3N0YXRpY1wvdGVtcGxhdGVcL2RlZmF1bHQ3XC9waWN0dXJlXzIuanBnIiwibGlua3VybCI6IiJ9fSwiaWQiOiJwaWN0dXJlIiwic3R5bGUiOnsiYmFja2dyb3VuZCI6IiNmZmZmZmYiLCJwYWRkaW5ndG9wIjoiNCIsInBhZGRpbmdsZWZ0IjoiMCJ9fSwiTTE0NjU4MTI4NzU5ODgiOnsicGFyYW1zIjp7InJvdyI6IjIifSwiZGF0YSI6eyJDMTQ2NTgxMjg3NTk4OCI6eyJpbWd1cmwiOiIuLlwvYWRkb25zXC9ld2VpX3Nob3B2MlwvcGx1Z2luXC9kaXlwYWdlXC9zdGF0aWNcL3RlbXBsYXRlXC9kZWZhdWx0N1wvcGljdHVyZXdfNC5qcGciLCJsaW5rdXJsIjoiIn0sIkMxNDY1ODEyODc1OTg5Ijp7ImltZ3VybCI6Ii4uXC9hZGRvbnNcL2V3ZWlfc2hvcHYyXC9wbHVnaW5cL2RpeXBhZ2VcL3N0YXRpY1wvdGVtcGxhdGVcL2RlZmF1bHQ3XC9waWN0dXJld181LmpwZyIsImxpbmt1cmwiOiIifSwiQzE0NjU4MTI4NzU5OTAiOnsiaW1ndXJsIjoiLi5cL2FkZG9uc1wvZXdlaV9zaG9wdjJcL3BsdWdpblwvZGl5cGFnZVwvc3RhdGljXC90ZW1wbGF0ZVwvZGVmYXVsdDdcL3BpY3R1cmV3XzYuanBnIiwibGlua3VybCI6IiJ9LCJDMTQ2NTgxMjg3NTk5MSI6eyJpbWd1cmwiOiIuLlwvYWRkb25zXC9ld2VpX3Nob3B2MlwvcGx1Z2luXC9kaXlwYWdlXC9zdGF0aWNcL3RlbXBsYXRlXC9kZWZhdWx0N1wvcGljdHVyZXdfNy5qcGciLCJsaW5rdXJsIjoiIn19LCJpZCI6InBpY3R1cmV3Iiwic3R5bGUiOnsiYmFja2dyb3VuZCI6IiNmZmZmZmYiLCJwYWRkaW5ndG9wIjoiMCIsInBhZGRpbmdsZWZ0IjoiMCJ9fSwiTTE0NjU4NzI4OTQxMjAiOnsic3R5bGUiOnsiaGVpZ2h0IjoiMTAiLCJiYWNrZ3JvdW5kIjoiI2ZmZmZmZiJ9LCJpZCI6ImJsYW5rIn0sIk0xNDY1ODcyODMyODk1Ijp7InBhcmFtcyI6eyJ0aXRsZSI6Ilx1NzBlZFx1OTUwMFx1NTU0Nlx1NTRjMSIsImljb24iOiIifSwic3R5bGUiOnsiYmFja2dyb3VuZCI6IiNmMjMyNGMiLCJjb2xvciI6IiNmZmZmZmYiLCJ0ZXh0YWxpZ24iOiJjZW50ZXIiLCJmb250c2l6ZSI6IjE4IiwicGFkZGluZ3RvcCI6IjUiLCJwYWRkaW5nbGVmdCI6IjUifSwiaWQiOiJ0aXRsZSJ9LCJNMTQ2NTgxMjkwNDA1MyI6eyJwYXJhbXMiOnsic2hvd3RpdGxlIjoiMSIsInNob3dwcmljZSI6IjEiLCJnb29kc2RhdGEiOiIwIiwiY2F0ZWlkIjoiIiwiY2F0ZW5hbWUiOiIiLCJncm91cGlkIjoiIiwiZ3JvdXBuYW1lIjoiIiwiZ29vZHNzb3J0IjoiMCIsImdvb2RzbnVtIjoiNiIsInNob3dpY29uIjoiMSIsImljb25wb3NpdGlvbiI6ImxlZnQgdG9wIn0sInN0eWxlIjp7Imxpc3RzdHlsZSI6ImJsb2NrIiwiYnV5c3R5bGUiOiJidXlidG4tMSIsImdvb2RzaWNvbiI6InJlY29tbWFuZCIsInByaWNlY29sb3IiOiIjZWQyODIyIiwiaWNvbnBhZGRpbmd0b3AiOiIwIiwiaWNvbnBhZGRpbmdsZWZ0IjoiMCIsImJ1eWJ0bmNvbG9yIjoiI2ZlNTQ1NSIsImljb256b29tIjoiMTAwIiwidGl0bGVjb2xvciI6IiMyNjI2MjYifSwiZGF0YSI6eyJDMTQ2NTgxMjkwNDA1MyI6eyJ0aHVtYiI6Ii4uXC9hZGRvbnNcL2V3ZWlfc2hvcHYyXC9wbHVnaW5cL2RpeXBhZ2V\r\ncL3N0YXRpY1wvaW1hZ2VzXC9kZWZhdWx0XC9nb29kcy0xLmpwZyIsInByaWNlIjoiMjAuMDAiLCJ0aXRsZSI6Ilx1OGZkOVx1OTFjY1x1NjYyZlx1NTU0Nlx1NTRjMVx1NjgwN1x1OTg5OCIsImdpZCI6IiJ9LCJDMTQ2NTgxMjkwNDA1NCI6eyJ0aHVtYiI6Ii4uXC9hZGRvbnNcL2V3ZWlfc2hvcHYyXC9wbHVnaW5cL2RpeXBhZ2VcL3N0YXRpY1wvaW1hZ2VzXC9kZWZhdWx0XC9nb29kcy0yLmpwZyIsInByaWNlIjoiMjAuMDAiLCJ0aXRsZSI6Ilx1OGZkOVx1OTFjY1x1NjYyZlx1NTU0Nlx1NTRjMVx1NjgwN1x1OTg5OCIsImdpZCI6IiJ9LCJDMTQ2NTgxMjkwNDA1NSI6eyJ0aHVtYiI6Ii4uXC9hZGRvbnNcL2V3ZWlfc2hvcHYyXC9wbHVnaW5cL2RpeXBhZ2VcL3N0YXRpY1wvaW1hZ2VzXC9kZWZhdWx0XC9nb29kcy0zLmpwZyIsInByaWNlIjoiMjAuMDAiLCJ0aXRsZSI6Ilx1OGZkOVx1OTFjY1x1NjYyZlx1NTU0Nlx1NTRjMVx1NjgwN1x1OTg5OCIsImdpZCI6IiJ9LCJDMTQ2NTgxMjkwNDA1NiI6eyJ0aHVtYiI6Ii4uXC9hZGRvbnNcL2V3ZWlfc2hvcHYyXC9wbHVnaW5cL2RpeXBhZ2VcL3N0YXRpY1wvaW1hZ2VzXC9kZWZhdWx0XC9nb29kcy00LmpwZyIsInByaWNlIjoiMjAuMDAiLCJ0aXRsZSI6Ilx1OGZkOVx1OTFjY1x1NjYyZlx1NTU0Nlx1NTRjMVx1NjgwN1x1OTg5OCIsImdpZCI6IiJ9fSwiaWQiOiJnb29kcyJ9LCJNMTQ2NTg4ODU1MjYwNiI6eyJwYXJhbXMiOnsiY29udGVudCI6IlBIQWdjM1I1YkdVOUluUmxlSFF0WVd4cFoyNDZJR05sYm5SbGNqc2lQdVdidnVlSmgrYWRwZWE2a09TNmp1ZTlrZWU3bk8rOGpPZUppT2FkZytXOWt1V09uK1M5bk9pQWhlYUpnT2FjaVR3dmNEND0ifSwic3R5bGUiOnsiYmFja2dyb3VuZCI6IiNmZmZmZmYiLCJwYWRkaW5nIjoiMjAifSwiaWQiOiJyaWNodGV4dCJ9fX0=', '../addons/yunphp_shop/plugin/diypage/static/template/default7/preview.jpg', 7, 0, 0, 0);
INSERT INTO `ims_yunphp_shop_diypage_template` VALUES (8, 0, 2, '系统模板08', 'eyJwYWdlIjp7InR5cGUiOiIyIiwidGl0bGUiOiJcdTMwMTBcdTZhMjFcdTY3N2ZcdTMwMTFcdTdjZmJcdTdlZGZcdTZhMjFcdTY3N2YwOCIsIm5hbWUiOiJcdTMwMTBcdTZhMjFcdTY3N2ZcdTMwMTFcdTdjZmJcdTdlZGZcdTZhMjFcdTY3N2YwOCIsImRlc2MiOiIiLCJpY29uIjoiIiwia2V5d29yZCI6IiIsImJhY2tncm91bmQiOiIjZmFmYWZhIiwiZGl5bWVudSI6Ii0xIn0sIml0ZW1zIjp7Ik0xNDY1ODEyOTk3MDQ1Ijp7ImRhdGEiOnsiQzE0NjU4MTI5OTcwNDUiOnsiaW1ndXJsIjoiLi5cL2FkZG9uc1wvZXdlaV9zaG9wdjJcL3BsdWdpblwvZGl5cGFnZVwvc3RhdGljXC90ZW1wbGF0ZVwvZGVmYXVsdDhcL3BpY3R1cmVfMS5qcGciLCJsaW5rdXJsIjoiIn19LCJpZCI6InBpY3R1cmUiLCJzdHlsZSI6eyJwYWRkaW5ndG9wIjoiMCIsInBhZGRpbmdsZWZ0IjoiMCJ9fSwiTTE0NjU4MTMwMTc1NDkiOnsicGFyYW1zIjp7InJvdyI6IjMifSwiZGF0YSI6eyJDMTQ2NTgxMzAxNzU1MCI6eyJpbWd1cmwiOiIuLlwvYWRkb25zXC9ld2VpX3Nob3B2MlwvcGx1Z2luXC9kaXlwYWdlXC9zdGF0aWNcL3RlbXBsYXRlXC9kZWZhdWx0OFwvcGljdHVyZXdfMS5qcGciLCJsaW5rdXJsIjoiIn0sIkMxNDY1ODEzMDE3NTUxIjp7ImltZ3VybCI6Ii4uXC9hZGRvbnNcL2V3ZWlfc2hvcHYyXC9wbHVnaW5cL2RpeXBhZ2VcL3N0YXRpY1wvdGVtcGxhdGVcL2RlZmF1bHQ4XC9waWN0dXJld18yLmpwZyIsImxpbmt1cmwiOiIifSwiQzE0NjU4MTMwMTc1NTIiOnsiaW1ndXJsIjoiLi5cL2FkZG9uc1wvZXdlaV9zaG9wdjJcL3BsdWdpblwvZGl5cGFnZVwvc3RhdGljXC90ZW1wbGF0ZVwvZGVmYXVsdDhcL3BpY3R1cmV3XzMuanBnIiwibGlua3VybCI6IiJ9fSwiaWQiOiJwaWN0dXJldyIsInN0eWxlIjp7ImJhY2tncm91bmQiOiIjZmZmZmZmIiwicGFkZGluZ3RvcCI6IjAiLCJwYWRkaW5nbGVmdCI6IjAifX0sIk0xNDY1ODEzMDQyODc2Ijp7ImRhdGEiOnsiQzE0NjU4MTMwNDI4NzYiOnsiaW1ndXJsIjoiLi5cL2FkZG9uc1wvZXdlaV9zaG9wdjJcL3BsdWdpblwvZGl5cGFnZVwvc3RhdGljXC90ZW1wbGF0ZVwvZGVmYXVsdDhcL3BpY3R1cmVfMi5qcGciLCJsaW5rdXJsIjoiIn0sIkMxNDY1ODEzMDQyODc3Ijp7ImltZ3VybCI6Ii4uXC9hZGRvbnNcL2V3ZWlfc2hvcHYyXC9wbHVnaW5cL2RpeXBhZ2VcL3N0YXRpY1wvdGVtcGxhdGVcL2RlZmF1bHQ4XC9waWN0dXJlXzMuanBnIiwibGlua3VybCI6IiJ9fSwiaWQiOiJwaWN0dXJlIiwic3R5bGUiOnsicGFkZGluZ3RvcCI6IjAiLCJwYWRkaW5nbGVmdCI6IjAifX0sIk0xNDY1ODEzMDg4ODA0Ijp7InBhcmFtcyI6eyJyb3ciOiI0In0sImRhdGEiOnsiQzE0NjU4MTMwODg4MDQiOnsiaW1ndXJsIjoiLi5cL2FkZG9uc1wvZXdlaV9zaG9wdjJcL3BsdWdpblwvZGl5cGFnZVwvc3RhdGljXC90ZW1wbGF0ZVwvZGVmYXVsdDhcL3BpY3R1cmV3XzQuanBnIiwibGlua3VybCI6IiJ9LCJDMTQ2NTgxMzA4ODgwNSI6eyJpbWd1cmwiOiIuLlwvYWRkb25zXC9ld2VpX3Nob3B2MlwvcGx1Z2luXC9kaXlwYWdlXC9zdGF0aWNcL3RlbXBsYXRlXC9kZWZhdWx0OFwvcGljdHVyZXdfNS5qcGciLCJsaW5rdXJsIjoiIn0sIkMxNDY1ODEzMDg4ODA2Ijp7ImltZ3VybCI6Ii4uXC9hZGRvbnNcL2V3ZWlfc2hvcHYyXC9wbHVnaW5cL2RpeXBhZ2VcL3N0YXRpY1wvdGVtcGxhdGVcL2RlZmF1bHQ4XC9waWN0dXJld182LmpwZyIsImxpbmt1cmwiOiIifSwiQzE0NjU4MTMwODg4MDciOnsiaW1ndXJsIjoiLi5cL2FkZG9uc1wvZXdlaV9zaG9wdjJcL3BsdWdpblwvZGl5cGFnZVwvc3RhdGljXC90ZW1wbGF0ZVwvZGVmYXVsdDhcL3BpY3R1cmV3XzcuanBnIiwibGlua3VybCI6IiJ9fSwiaWQiOiJwaWN0dXJldyIsInN0eWxlIjp7ImJhY2tncm91bmQiOiIjZmZmZmZmIiwicGFkZGluZ3RvcCI6IjAiLCJwYWRkaW5nbGVmdCI6IjAifX0sIk0xNDY1ODEzMTMxMzgwIjp7InBhcmFtcyI6eyJzaG93dGl0bGUiOiIxIiwic2hvd3ByaWNlIjoiMSIsImdvb2RzZGF0YSI6IjAiLCJjYXRlaWQiOiIiLCJjYXRlbmFtZSI6IiIsImdyb3VwaWQiOiIiLCJncm91cG5hbWUiOiIiLCJnb29kc3NvcnQiOiIwIiwiZ29vZHNudW0iOiI2Iiwic2hvd2ljb24iOiIxIiwiaWNvbnBvc2l0aW9uIjoibGVmdCB0b3AifSwic3R5bGUiOnsibGlzdHN0eWxlIjoiYmxvY2siLCJidXlzdHlsZSI6ImJ1eWJ0bi0xIiwiZ29vZHNpY29uIjoicmVjb21tYW5kIiwicHJpY2Vjb2xvciI6IiNlZDI4MjIiLCJpY29ucGFkZGluZ3RvcCI6IjAiLCJpY29ucGFkZGluZ2xlZnQiOiIwIiwiYnV5YnRuY29sb3IiOiIjZmU1NDU1IiwiaWNvbnpvb20iOiIxMDAiLCJ0aXRsZWNvbG9yIjoiIzI2MjYyNiJ9LCJkYXRhIjp7IkMxNDY1ODEzMTMxMzgwIjp7InRodW1iIjoiLi5cL2FkZG9uc1wvZXdlaV9zaG9wdjJcL3BsdWdpblwvZGl5cGFnZVwvc3RhdGljXC9pbWFnZXNcL2RlZmF1bHRcL2dvb2RzLTEuanBnIiwicHJpY2UiOiIyMC4wMCIsInRpdGxlIjoiXHU4ZmQ5XHU5MWNjXHU2NjJmXHU1NTQ2XHU1NGMxXHU2ODA3XHU5ODk4IiwiZ2lkIjoiIn0sIkMxNDY1ODEzMTMxMzgxIjp7InRodW1iIjoiLi5cL2FkZG9uc1wvZXdlaV9zaG9wdjJcL3BsdWdpblwvZGl5cGFnZVwvc3RhdGljXC9pbWFnZXNcL2RlZmF1bHRcL2dvb2RzLTIuanBnIiwicHJpY2UiOiIyMC4wMCIsInRpdGxlIjoiXHU4ZmQ5XHU5MWNjXHU2NjJmXHU1NTQ2XHU1NGMxXHU2ODA3XHU5ODk4IiwiZ2lkIjoiIn0sIkMxNDY1ODEzMTMxMzgyIjp7InRodW1iIjoiLi5cL2FkZG9uc1wvZXdlaV9zaG9wdjJcL3BsdWdpblwvZGl5cGFnZVwvc3RhdGljXC9pbWFnZXNcL2RlZmF1bHRcL2dvb2RzLTMuanBnIiwicHJpY2UiOiIyMC4wMCIsInRpdGxlIjoiXHU4ZmQ5XHU5MWNjXHU2NjJmXHU1NTQ2XHU1NGMxXHU2ODA3XHU5ODk4IiwiZ2lkIjoiIn0sIkMxNDY1ODEzMTMxMzgzIjp7InRodW1iIjoiLi5cL2FkZG9uc1wvZXdlaV9zaG9wdjJcL3BsdWdpblwvZGl5cGFnZVwvc3RhdGljXC9pbWFnZXNcL2RlZmF1bHRcL2dvb2RzLTQuanBnIiwicHJpY2UiOiIyMC4wMCIsInRpdGxlIjoiXHU4ZmQ5XHU\r\n5MWNjXHU2NjJmXHU1NTQ2XHU1NGMxXHU2ODA3XHU5ODk4IiwiZ2lkIjoiIn19LCJpZCI6Imdvb2RzIn0sIk0xNDY1ODg4ODMxMjc4Ijp7InBhcmFtcyI6eyJjb250ZW50IjoiUEhBZ2MzUjViR1U5SW5SbGVIUXRZV3hwWjI0NklHTmxiblJsY2pzaVB1V2J2dWVKaCthZHBlYTZrT1M2anVlOWtlZTduTys4ak9lSmlPYWRnK1c5a3VXT24rUzluT2lBaGVhSmdPYWNpVHd2Y0Q0PSJ9LCJzdHlsZSI6eyJiYWNrZ3JvdW5kIjoiI2ZmZmZmZiIsInBhZGRpbmciOiIyMCJ9LCJpZCI6InJpY2h0ZXh0In19fQ==', '../addons/yunphp_shop/plugin/diypage/static/template/default8/preview.jpg', 8, 0, 0, 0);
INSERT INTO `ims_yunphp_shop_diypage_template` VALUES (9, 0, 3, '会员中心01', 'eyJwYWdlIjp7InR5cGUiOiIzIiwidGl0bGUiOiJcdTRmMWFcdTU0NThcdTRlMmRcdTVmYzMiLCJuYW1lIjoiXHU0ZjFhXHU1NDU4XHU0ZTJkXHU1ZmMzIiwiZGVzYyI6IiIsImljb24iOiIiLCJrZXl3b3JkIjoiIiwiYmFja2dyb3VuZCI6IiNmYWZhZmEiLCJkaXltZW51IjoiMCIsImZvbGxvd2JhciI6IjAiLCJ2aXNpdCI6IjAiLCJ2aXNpdGxldmVsIjp7Im1lbWJlciI6IiIsImNvbW1pc3Npb24iOiIifSwibm92aXNpdCI6eyJ0aXRsZSI6IiIsImxpbmsiOiIifX0sIml0ZW1zIjp7Ik0xNDc0NTI2MTM0ODE0Ijp7InBhcmFtcyI6eyJzdHlsZSI6ImRlZmF1bHQxIiwibGV2ZWxsaW5rIjoiIiwic2V0aWNvbiI6Imljb24tc2V0dGluZ3MiLCJzZXRsaW5rIjoiIiwibGVmdG5hdiI6Ilx1NTE0NVx1NTAzYyIsImxlZnRuYXZsaW5rIjoiIiwicmlnaHRuYXYiOiJcdTUxNTFcdTYzNjIiLCJyaWdodG5hdmxpbmsiOiIifSwic3R5bGUiOnsiYmFja2dyb3VuZCI6IiNmZTU0NTUiLCJ0ZXh0Y29sb3IiOiIjZmZmZmZmIiwidGV4dGxpZ2h0IjoiI2ZlZjMxZiIsImhlYWRzdHlsZSI6IiJ9LCJpbmZvIjp7ImF2YXRhciI6IiIsIm5pY2tuYW1lIjoiIiwibGV2ZWxuYW1lIjoiIiwidGV4dG1vbmV5IjoiIiwidGV4dGNyZWRpdCI6IiIsIm1vbmV5IjoiIiwiY3JlZGl0IjoiIn0sImlkIjoibWVtYmVyIn0sIk0xNDc0NTI2MTM4OTEwIjp7InBhcmFtcyI6eyJsaW5rdXJsIjoiIiwidGl0bGUiOiJcdTdlZDFcdTViOWFcdTYyNGJcdTY3M2FcdTUzZjciLCJ0ZXh0IjoiXHU1OTgyXHU2NzljXHU2MGE4XHU3NTI4XHU2MjRiXHU2NzNhXHU1M2Y3XHU2Y2U4XHU1MThjXHU4ZmM3XHU0ZjFhXHU1NDU4XHU2MjE2XHU2MGE4XHU2MGYzXHU5MDFhXHU4ZmM3XHU1ZmFlXHU0ZmUxXHU1OTE2XHU4ZDJkXHU3MjY5XHU4YmY3XHU3ZWQxXHU1YjlhXHU2MGE4XHU3Njg0XHU2MjRiXHU2NzNhXHU1M2Y3XHU3ODAxIiwiaWNvbmNsYXNzIjoiaWNvbi1tb2JpbGUifSwic3R5bGUiOnsibWFyZ2ludG9wIjoiMTAiLCJiYWNrZ3JvdW5kIjoiI2ZmZmZmZiIsInRpdGxlY29sb3IiOiIjZmYwMDExIiwidGV4dGNvbG9yIjoiIzk5OTk5OSIsImljb25jb2xvciI6IiM5OTk5OTkifSwiaWQiOiJiaW5kbW9iaWxlIn0sIk0xNDc0NTI2MTQzNDg3Ijp7InN0eWxlIjp7Im1hcmdpbnRvcCI6IjEwIiwiYmFja2dyb3VuZCI6IiNmZmZmZmYiLCJpY29uY29sb3IiOiIjOTk5OTk5IiwidGV4dGNvbG9yIjoiIzMzMzMzMyIsInJlbWFya2NvbG9yIjoiIzg4ODg4OCJ9LCJkYXRhIjp7IkMxNDc0NTI2MTQzNDg5Ijp7InRleHQiOiJcdTYyMTFcdTc2ODRcdThiYTJcdTUzNTUiLCJsaW5rdXJsIjoiIiwiaWNvbmNsYXNzIjoiaWNvbi1saXN0IiwicmVtYXJrIjoiXHU2N2U1XHU3NzBiXHU1MTY4XHU5MGU4IiwiZG90bnVtIjoiIn19LCJpZCI6Imxpc3RtZW51In0sIk0xNDc0NTI2MTgxNDMxIjp7InBhcmFtcyI6eyJyb3dudW0iOiI0IiwiYm9yZGVyIjoiMSIsImJvcmRlcnRvcCI6IjAiLCJib3JkZXJib3R0b20iOiIxIn0sInN0eWxlIjp7ImJhY2tncm91bmQiOiIjZmZmZmZmIiwiYm9yZGVyY29sb3IiOiIjZWJlYmViIiwidGV4dGNvbG9yIjoiIzdhN2E3YSIsImljb25jb2xvciI6IiNhYWFhYWEiLCJkb3Rjb2xvciI6IiNmZjAwMTEifSwiZGF0YSI6eyJDMTQ3NDUyNjE4MTQzMSI6eyJpY29uY2xhc3MiOiJpY29uLWNhcmQiLCJ0ZXh0IjoiXHU1Zjg1XHU0ZWQ4XHU2YjNlIiwibGlua3VybCI6IiIsImRvdG51bSI6IjAifSwiQzE0NzQ1MjYxODE0MzIiOnsiaWNvbmNsYXNzIjoiaWNvbi1ib3giLCJ0ZXh0IjoiXHU1Zjg1XHU1M2QxXHU4ZDI3IiwibGlua3VybCI6IiIsImRvdG51bSI6IjAifSwiQzE0NzQ1MjYxODE0MzMiOnsiaWNvbmNsYXNzIjoiaWNvbi1kZWxpdmVyIiwidGV4dCI6Ilx1NWY4NVx1NjUzNlx1OGQyNyIsImxpbmt1cmwiOiIiLCJkb3RudW0iOiIwIn0sIkMxNDc0NTI2MTgxNDM0Ijp7Imljb25jbGFzcyI6Imljb24tZWxlY3RyaWNhbCIsInRleHQiOiJcdTkwMDBcdTYzNjJcdThkMjciLCJsaW5rdXJsIjoiIiwiZG90bnVtIjoiMCJ9fSwiaWQiOiJpY29uZ3JvdXAifSwiTTE0NzQ1MjYxOTkxMDIiOnsic3R5bGUiOnsibWFyZ2ludG9wIjoiMTAiLCJiYWNrZ3JvdW5kIjoiI2ZmZmZmZiIsImljb25jb2xvciI6IiM5OTk5OTkiLCJ0ZXh0Y29sb3IiOiIjMzMzMzMzIiwicmVtYXJrY29sb3IiOiIjODg4ODg4In0sImRhdGEiOnsiQzE0NzQ1MjYxOTkxMDIiOnsidGV4dCI6Ilx1NTIwNlx1OTUwMFx1NGUyZFx1NWZjMyIsImxpbmt1cmwiOiIiLCJpY29uY2xhc3MiOiJpY29uLWdyb3VwIiwicmVtYXJrIjoiXHU2N2U1XHU3NzBiIiwiZG90bnVtIjoiIn0sIkMxNDc0NTI2MTk5MTAzIjp7InRleHQiOiJcdTc5ZWZcdTUyMDZcdTdiN2VcdTUyMzAiLCJsaW5rdXJsIjoiIiwiaWNvbmNsYXNzIjoiaWNvbi1naWZ0cyIsInJlbWFyayI6Ilx1NjdlNVx1NzcwYiIsImRvdG51bSI6IiJ9LCJDMTQ3NDUyNjE5OTEwNCI6eyJ0ZXh0IjoiXHU3OWVmXHU1MjA2XHU1NTQ2XHU1N2NlIiwibGlua3VybCI6IiIsImljb25jbGFzcyI6Imljb24tY3JlZGl0bGV2ZWwiLCJyZW1hcmsiOiJcdTY3ZTVcdTc3MGIiLCJkb3RudW0iOiIifX0sImlkIjoibGlzdG1lbnUifSwiTTE0NzQ1MjYyMjIyMDYiOnsic3R5bGUiOnsibWFyZ2ludG9wIjoiMTAiLCJiYWNrZ3JvdW5kIjoiI2ZmZmZmZiIsImljb25jb2xvciI6IiM5OTk5OTkiLCJ0ZXh0Y29sb3IiOiIjMzMzMzMzIiwicmVtYXJrY29sb3IiOiIjODg4ODg4In0sImRhdGEiOnsiQzE0NzQ1MjYyMjIyMDYiOnsidGV4dCI6Ilx1OTg4Nlx1NTNkNlx1NGYxOFx1NjBlMFx1NTIzOCIsImxpbmt1cmwiOiIiLCJpY29uY2xhc3MiOiJpY29uLXNhbWUiLCJyZW1hcmsiOiJcdTY3ZTVcdTc3MGIiLCJkb3RudW0iOiIifSwiQzE0NzQ1MjYyMjIyMDciOnsidGV4dCI6Ilx1NjIxMVx1NzY4NFx1NGYxOFx1NjBlMFx1NTIzOCIsImxpbmt1cmwiOiIiLCJpY29uY2xhc3MiOiJpY29uLWNhcmQiLCJyZW1hcmsiOiJcdTY3ZTVcdTc3MGIiLCJkb3RudW0iOiIifX0sImlkIjoibGlzdG1lbnUifSwiTTE0NzQ1MjYyNTM2MTQiOnsic3R5bGUiOnsibWFyZ2l\r\nudG9wIjoiMTAiLCJiYWNrZ3JvdW5kIjoiI2ZmZmZmZiIsImljb25jb2xvciI6IiM5OTk5OTkiLCJ0ZXh0Y29sb3IiOiIjMzMzMzMzIiwicmVtYXJrY29sb3IiOiIjODg4ODg4In0sImRhdGEiOnsiQzE0NzQ1MjYyNTM2MTQiOnsidGV4dCI6Ilx1NzllZlx1NTIwNlx1NjM5Mlx1ODg0YyIsImxpbmt1cmwiOiIiLCJpY29uY2xhc3MiOiJpY29uLXJhbmsiLCJyZW1hcmsiOiJcdTY3ZTVcdTc3MGIiLCJkb3RudW0iOiIifSwiQzE0NzQ1MjYyNTM2MTUiOnsidGV4dCI6Ilx1NmQ4OFx1OGQzOVx1NjM5Mlx1ODg0YyIsImxpbmt1cmwiOiIiLCJpY29uY2xhc3MiOiJpY29uLW1vbmV5IiwicmVtYXJrIjoiXHU2N2U1XHU3NzBiIiwiZG90bnVtIjoiIn19LCJpZCI6Imxpc3RtZW51In0sIk0xNDc0NTI2MjgxNzYwIjp7InN0eWxlIjp7Im1hcmdpbnRvcCI6IjEwIiwiYmFja2dyb3VuZCI6IiNmZmZmZmYiLCJpY29uY29sb3IiOiIjOTk5OTk5IiwidGV4dGNvbG9yIjoiIzMzMzMzMyIsInJlbWFya2NvbG9yIjoiIzg4ODg4OCJ9LCJkYXRhIjp7IkMxNDc0NTI2MjgxNzYwIjp7InRleHQiOiJcdTYyMTFcdTc2ODRcdThkMmRcdTcyNjlcdThmNjYiLCJsaW5rdXJsIjoiIiwiaWNvbmNsYXNzIjoiaWNvbi1jYXJ0IiwicmVtYXJrIjoiXHU2N2U1XHU3NzBiIiwiZG90bnVtIjoiIn0sIkMxNDc0NTI2MjgxNzYxIjp7InRleHQiOiJcdTYyMTFcdTc2ODRcdTUxNzNcdTZjZTgiLCJsaW5rdXJsIjoiIiwiaWNvbmNsYXNzIjoiaWNvbi1saWtlIiwicmVtYXJrIjoiXHU2N2U1XHU3NzBiIiwiZG90bnVtIjoiIn0sIkMxNDc0NTI2MjgxNzYyIjp7InRleHQiOiJcdTYyMTFcdTc2ODRcdThkYjNcdThmZjkiLCJsaW5rdXJsIjoiIiwiaWNvbmNsYXNzIjoiaWNvbi1mb290cHJpbnQiLCJyZW1hcmsiOiJcdTY3ZTVcdTc3MGIiLCJkb3RudW0iOiIifSwiTTE0NzQ1MjYzMDA1NDMiOnsidGV4dCI6Ilx1NmQ4OFx1NjA2Zlx1NjNkMFx1OTE5Mlx1OGJiZVx1N2Y2ZSIsImxpbmt1cmwiOiIiLCJpY29uY2xhc3MiOiJpY29uLW5vdGljZSIsInJlbWFyayI6Ilx1NjdlNVx1NzcwYiIsImRvdG51bSI6IiJ9fSwiaWQiOiJsaXN0bWVudSJ9LCJNMTQ3NDUyNjMwNzI3MCI6eyJzdHlsZSI6eyJtYXJnaW50b3AiOiIxMCIsImJhY2tncm91bmQiOiIjZmZmZmZmIiwiaWNvbmNvbG9yIjoiIzk5OTk5OSIsInRleHRjb2xvciI6IiMzMzMzMzMiLCJyZW1hcmtjb2xvciI6IiM4ODg4ODgifSwiZGF0YSI6eyJDMTQ3NDUyNjMwNzI3MCI6eyJ0ZXh0IjoiXHU2NTM2XHU4ZDI3XHU1NzMwXHU1NzQwXHU3YmExXHU3NDA2IiwibGlua3VybCI6IiIsImljb25jbGFzcyI6Imljb24tYWRkcmVzcyIsInJlbWFyayI6Ilx1NjdlNVx1NzcwYiIsImRvdG51bSI6IiJ9LCJDMTQ3NDUyNjMwNzI3MSI6eyJ0ZXh0IjoiXHU1ZTJlXHU1MmE5XHU0ZTJkXHU1ZmMzIiwibGlua3VybCI6IiIsImljb25jbGFzcyI6Imljb24tcXVlc3Rpb25maWxsIiwicmVtYXJrIjoiXHU2N2U1XHU3NzBiIiwiZG90bnVtIjoiIn19LCJpZCI6Imxpc3RtZW51In0sIk0xNDc0NTk3NzI2NTU2Ijp7InBhcmFtcyI6eyJiaW5kdXJsIjoiIiwibG9nb3V0dXJsIjoiIn0sInN0eWxlIjp7InRleHRjb2xvciI6IiNmZjAwMTEiLCJiYWNrZ3JvdW5kIjoiI2ZmZmZmZiIsIm1hcmdpbnRvcCI6IjEwIn0sImlkIjoibG9nb3V0In0sIk0xNDc0NTk3OTcxMjE4Ijp7InBhcmFtcyI6eyJjb250ZW50IjoiUEhBZ2MzUjViR1U5SW5SbGVIUXRZV3hwWjI0NklHTmxiblJsY2pzaVB1ZUppT2FkZythSmdPYWNpU0FvWXlrZ2VIaDQ1WldHNVorT1BDOXdQZz09In0sInN0eWxlIjp7ImJhY2tncm91bmQiOiIjZmZmZmZmIiwicGFkZGluZyI6IjIwIn0sImlkIjoicmljaHRleHQifX19', '../addons/yunphp_shop/plugin/diypage/static/template/member1/preview.jpg', 9, 0, 0, 0);
INSERT INTO `ims_yunphp_shop_diypage_template` VALUES (10, 0, 4, '分销中心01', 'eyJwYWdlIjp7InR5cGUiOiI0IiwidGl0bGUiOiJcdThiZjdcdThmOTNcdTUxNjVcdTk4NzVcdTk3NjJcdTY4MDdcdTk4OTgiLCJuYW1lIjoiXHU2NzJhXHU1NDdkXHU1NDBkXHU5ODc1XHU5NzYyIiwiZGVzYyI6IiIsImljb24iOiIiLCJrZXl3b3JkIjoiIiwiYmFja2dyb3VuZCI6IiNmYWZhZmEiLCJkaXltZW51IjoiLTEiLCJmb2xsb3diYXIiOiIwIiwidmlzaXQiOiIwIiwidmlzaXRsZXZlbCI6eyJtZW1iZXIiOiIiLCJjb21taXNzaW9uIjoiIn0sIm5vdmlzaXQiOnsidGl0bGUiOiIiLCJsaW5rIjoiIn19LCJpdGVtcyI6eyJNMTQ3NTk3NjIxMDU0NiI6eyJwYXJhbXMiOnsic3R5bGUiOiJkZWZhdWx0MSIsInNldGljb24iOiJpY29uLXNldHRpbmdzIiwic2V0bGluayI6IiIsImxlZnRuYXYiOiJcdTYzZDBcdTczYjAxIiwibGVmdG5hdmxpbmsiOiIiLCJyaWdodG5hdiI6Ilx1NjNkMFx1NzNiMDIiLCJyaWdodG5hdmxpbmsiOiIiLCJjZW50ZXJuYXYiOiJcdTYzZDBcdTczYjAiLCJjZW50ZXJuYXZsaW5rIjoiIn0sInN0eWxlIjp7ImJhY2tncm91bmQiOiIjZmU1NDU1IiwidGV4dGNvbG9yIjoiI2ZmZmZmZiIsInRleHRsaWdodCI6IiNmZWYzMWYifSwiaWQiOiJtZW1iZXJjIn0sIk0xNDc1OTc2MjEyMzA1Ijp7InBhcmFtcyI6eyJyb3dudW0iOiIzIn0sInN0eWxlIjp7ImJhY2tncm91bmQiOiIjZmZmZmZmIiwidGlwY29sb3IiOiIjZmViMzEyIn0sImRhdGEiOnsiQzE0NzU5NzYyMTIzMDUiOnsiaWNvbmNsYXNzIjoiaWNvbi1tb25leSIsImljb25jb2xvciI6IiNmZWIzMTIiLCJ0ZXh0IjoiXHU1MjA2XHU5NTAwXHU0ZjYzXHU5MWQxIiwidGV4dGNvbG9yIjoiIzY2NjY2NiIsImxpbmt1cmwiOiIiLCJ0aXBudW0iOiIwLjAwIiwidGlwdGV4dCI6Ilx1NTE0MyJ9LCJDMTQ3NTk3NjIxMjMwNiI6eyJpY29uY2xhc3MiOiJpY29uLWxpc3QiLCJpY29uY29sb3IiOiIjNTBiNmZlIiwidGV4dCI6Ilx1NGY2M1x1OTFkMVx1NjYwZVx1N2VjNiIsInRleHRjb2xvciI6IiM2NjY2NjYiLCJsaW5rdXJsIjoiIiwidGlwbnVtIjoiNTAiLCJ0aXB0ZXh0IjoiXHU3YjE0In0sIkMxNDc1OTc2MjEyMzA4Ijp7Imljb25jbGFzcyI6Imljb24tbWFuYWdlb3JkZXIiLCJpY29uY29sb3IiOiIjZmY3NDFkIiwidGV4dCI6Ilx1NjNkMFx1NzNiMFx1NjYwZVx1N2VjNiIsInRleHRjb2xvciI6IiM2NjY2NjYiLCJsaW5rdXJsIjoiIiwidGlwbnVtIjoiMTAiLCJ0aXB0ZXh0IjoiXHU3YjE0In0sIkMxNDc1OTc2MjEyMzA5Ijp7Imljb25jbGFzcyI6Imljb24tZ3JvdXAiLCJpY29uY29sb3IiOiIjZmY3NDFkIiwidGV4dCI6Ilx1NjIxMVx1NzY4NFx1NGUwYlx1N2ViZiIsInRleHRjb2xvciI6IiM2NjY2NjYiLCJsaW5rdXJsIjoiIiwidGlwbnVtIjoiMiIsInRpcHRleHQiOiJcdTRlYmEifSwiQzE0NzU5NzYyMTIzMTAiOnsiaWNvbmNsYXNzIjoiaWNvbi1xcmNvZGUiLCJpY29uY29sb3IiOiIjZmViMzEyIiwidGV4dCI6Ilx1NjNhOFx1NWU3Zlx1NGU4Y1x1N2VmNFx1NzgwMSIsInRleHRjb2xvciI6IiM2NjY2NjYiLCJsaW5rdXJsIjoiIiwidGlwbnVtIjoiIiwidGlwdGV4dCI6IiJ9LCJDMTQ3NTk3NjIxMjMxMSI6eyJpY29uY2xhc3MiOiJpY29uLXNob3BmaWxsIiwiaWNvbmNvbG9yIjoiIzUwYjZmZSIsInRleHQiOiJcdTVjMGZcdTVlOTdcdThiYmVcdTdmNmUiLCJ0ZXh0Y29sb3IiOiIjNjY2NjY2IiwibGlua3VybCI6IiIsInRpcG51bSI6IiIsInRpcHRleHQiOiIifSwiQzE0NzU5NzYyMTIzMTIiOnsiaWNvbmNsYXNzIjoiaWNvbi1yYW5rIiwiaWNvbmNvbG9yIjoiI2ZmNzQxZCIsInRleHQiOiJcdTRmNjNcdTkxZDFcdTYzOTJcdTU0MGQiLCJ0ZXh0Y29sb3IiOiIjNjY2NjY2IiwibGlua3VybCI6IiIsInRpcG51bSI6IiIsInRpcHRleHQiOiIifX0sImlkIjoiYmxvY2tncm91cCJ9fX0=', '../addons/yunphp_shop/plugin/diypage/static/template/commission1/preview.jpg', 10, 0, 0, 0);
INSERT INTO `ims_yunphp_shop_diypage_template` VALUES (11, 0, 5, '商品详情', 'eyJwYWdlIjp7InR5cGUiOiI1IiwidGl0bGUiOiJcdTU1NDZcdTU0YzFcdThiZTZcdTYwYzUiLCJuYW1lIjoiXHU1NTQ2XHU1NGMxXHU4YmU2XHU2MGM1IiwiZGVzYyI6IiIsImljb24iOiIiLCJrZXl3b3JkIjoiIiwiYmFja2dyb3VuZCI6IiNmYWZhZmEiLCJkaXltZW51IjoiLTEiLCJmb2xsb3diYXIiOiIwIiwidmlzaXQiOiIwIiwidmlzaXRsZXZlbCI6eyJtZW1iZXIiOiIiLCJjb21taXNzaW9uIjoiIn0sIm5vdmlzaXQiOnsidGl0bGUiOiIiLCJsaW5rIjoiIn0sImRpeWxheWVyIjoiMSJ9LCJpdGVtcyI6eyJNMTQ3ODc4Mjg4ODAyOCI6eyJ0eXBlIjoiNSIsIm1heCI6IjEiLCJwYXJhbXMiOnsiZ29vZHN0ZXh0IjoiXHU1NTQ2XHU1NGMxIiwiZGV0YWlsdGV4dCI6Ilx1OGJlNlx1NjBjNSJ9LCJzdHlsZSI6eyJiYWNrZ3JvdW5kIjoiI2Y3ZjdmNyIsInRleHRjb2xvciI6IiM2NjY2NjYiLCJhY3RpdmVjb2xvciI6IiNlZjRmNGYifSwiaWQiOiJkZXRhaWxfdGFiIn0sIk0xNDc4NzgyODkwMTA3Ijp7InR5cGUiOiI1IiwibWF4IjoiMSIsInN0eWxlIjp7ImRvdHN0eWxlIjoicmVjdGFuZ2xlIiwiZG90YWxpZ24iOiJsZWZ0IiwiYmFja2dyb3VuZCI6IiNmZmZmZmYiLCJsZWZ0cmlnaHQiOiI1IiwiYm90dG9tIjoiNSIsIm9wYWNpdHkiOiIwLjgifSwiaWQiOiJkZXRhaWxfc3dpcGUifSwiTTE0Nzg3ODMxMzUzNjUiOnsidHlwZSI6IjUiLCJtYXgiOiIxIiwicGFyYW1zIjp7InNoYXJlIjoiXHU1MjA2XHU0ZWFiIiwic2hhcmVfbGluayI6IiJ9LCJzdHlsZSI6eyJtYXJnaW50b3AiOiIwIiwibWFyZ2luYm90dG9tIjoiMCIsImJhY2tncm91bmQiOiIjZmZmZmZmIiwidGl0bGVjb2xvciI6IiMzMzMzMzMiLCJzdWJ0aXRsZWNvbG9yIjoiI2VmNGY0ZiIsInByaWNlY29sb3IiOiIjZWY0ZjRmIiwidGV4dGNvbG9yIjoiI2MwYzBjMCIsInRpbWVjb2xvciI6IiNlZjRmNGYiLCJ0aW1ldGV4dGNvbG9yIjoiI2VmNGY0ZiJ9LCJpZCI6ImRldGFpbF9pbmZvIn0sIk0xNDc4NzgyOTAzODE5Ijp7InR5cGUiOiI1IiwibWF4IjoiMSIsInN0eWxlIjp7Im1hcmdpbnRvcCI6IjAiLCJtYXJnaW5ib3R0b20iOiIwIiwiYmFja2dyb3VuZCI6IiNmZmZmZmYiLCJ0ZXh0Y29sb3IiOiIjNjY2NjY2IiwidGV4dGNvbG9yaGlnaCI6IiNlZjRmNGYifSwiZGF0YSI6eyJDMTQ3ODc4MjkwMzgxOSI6eyJuYW1lIjoiXHU0ZThjXHU2YjIxXHU4ZDJkXHU0ZTcwIiwidHlwZSI6ImVyY2kifSwiQzE0Nzg3ODI5MDM4MjAiOnsibmFtZSI6Ilx1NGYxYVx1NTQ1OFx1NGVmNyIsInR5cGUiOiJodWl5dWFuIn0sIkMxNDc4NzgyOTAzODIxIjp7Im5hbWUiOiJcdTRmMThcdTYwZTAiLCJ0eXBlIjoieW91aHVpIn0sIkMxNDc4NzgyOTAzODIyIjp7Im5hbWUiOiJcdTc5ZWZcdTUyMDYiLCJ0eXBlIjoiamlmZW4ifSwiQzE0Nzg3ODI5MDM4MjMiOnsibmFtZSI6Ilx1NGUwZFx1OTE0ZFx1OTAwMVx1NTMzYVx1NTdkZiIsInR5cGUiOiJidXBlaXNvbmcifSwiQzE0Nzg3ODI5MDM4MjQiOnsibmFtZSI6Ilx1NTU0Nlx1NTRjMVx1NjgwN1x1N2I3ZSIsInR5cGUiOiJiaWFvcWlhbiJ9fSwiaWQiOiJkZXRhaWxfc2FsZSJ9LCJNMTQ3ODc4MzE5MDI1NSI6eyJ0eXBlIjoiNSIsIm1heCI6IjEiLCJzdHlsZSI6eyJiYWNrZ3JvdW5kIjoiI2ZmZmZmZiIsInRleHRjb2xvciI6IiMzMzMzMzMiLCJtYXJnaW50b3AiOiIxMCIsIm1hcmdpbmJvdHRvbSI6IjAifSwiaWQiOiJkZXRhaWxfc3BlYyJ9LCJNMTQ3ODc4MzE5NjIxOSI6eyJ0eXBlIjoiNSIsIm1heCI6IjEiLCJzdHlsZSI6eyJiYWNrZ3JvdW5kIjoiI2ZmZmZmZiIsIm1hcmdpbnRvcCI6IjEwIiwibWFyZ2luYm90dG9tIjoiMCIsInRleHRjb2xvciI6IiM3YzdjN2MifSwiaWQiOiJkZXRhaWxfcGFja2FnZSJ9LCJNMTQ3ODc4MjkyNDA3NiI6eyJ0eXBlIjoiNSIsIm1heCI6IjEiLCJwYXJhbXMiOnsic2hvcGxvZ28iOiIuLlwvYWRkb25zXC9ld2VpX3Nob3B2Mlwvc3RhdGljXC9pbWFnZXNcL2Rlc2lnbmVyLmpwZyIsInNob3BuYW1lIjoiIiwic2hvcGRlc2MiOiIiLCJoaWRlbnVtIjoiMCIsImxlZnRuYXZ0ZXh0IjoiXHU1MTY4XHU5MGU4XHU1NTQ2XHU1NGMxIiwibGVmdG5hdmxpbmsiOiIiLCJyaWdodG5hdnRleHQiOiJcdThmZGJcdTVlOTdcdTkwMWJcdTkwMWIiLCJyaWdodG5hdmxpbmsiOiIifSwic3R5bGUiOnsibWFyZ2ludG9wIjoiMTAiLCJtYXJnaW5ib3R0b20iOiIwIiwiYmFja2dyb3VuZCI6IiNmZmZmZmYiLCJnb29kc251bWNvbG9yIjoiIzMzMzMzMyIsImdvb2RzdGV4dGNvbG9yIjoiIzdjN2M3YyIsInJpZ2h0bmF2Y29sb3IiOiIjN2M3YzdjIiwic2hvcG5hbWVjb2xvciI6IiMzMzMzMzMiLCJzaG9wZGVzY2NvbG9yIjoiIzQ0NDQ0NCJ9LCJpZCI6ImRldGFpbF9zaG9wIn0sIk0xNDc4NzgyOTI4ODg0Ijp7InR5cGUiOiI1IiwibWF4IjoiMSIsInN0eWxlIjp7ImJhY2tncm91bmQiOiIjZmZmZmZmIiwibWFyZ2ludG9wIjoiMTAiLCJtYXJnaW5ib3R0b20iOiIwIiwidGl0bGVjb2xvciI6IiMzMzMzMzMiLCJzaG9wbmFtZWNvbG9yIjoiIzMzMzMzMyIsInNob3BpbmZvY29sb3IiOiIjNjY2NjY2IiwibmF2dGVsY29sb3IiOiIjMDA4MDAwIiwibmF2bG9jYXRpb25jb2xvciI6IiNmZjk5MDAifSwiaWQiOiJkZXRhaWxfc3RvcmUifSwiTTE0Nzg3ODMyMTAxNDciOnsidHlwZSI6IjUiLCJtYXgiOiIxIiwic3R5bGUiOnsiYmFja2dyb3VuZCI6IiNmZmZmZmYiLCJtYXJnaW50b3AiOiIxMCIsIm1hcmdpbmJvdHRvbSI6IjAifSwiaWQiOiJkZXRhaWxfYnV5c2hvdyJ9LCJNMTQ3ODc4MzIxNDg3OSI6eyJ0eXBlIjoiNSIsIm1heCI6IjEiLCJzdHlsZSI6eyJtYXJnaW50b3AiOiIxMCIsIm1hcmdpbmJvdHRvbSI6IjEwIiwiYmFja2dyb3VuZCI6IiNmZmZmZmYiLCJtYWluY29sb3IiOiIjZmQ1NDU0Iiwic3ViY29sb3IiOiIjN2M3YzdjIiwidGV4dGNvbG9yIjoiIzMzMzMzMyJ9LCJpZCI6ImRldGFpbF9jb21tZW50In0sIk0xNDc4NzgzMjI1MTU4Ijp7InR5cGUiOiI1IiwibWF4IjoiMSIsInBhcmFtcyI6eyJoaWRlbGlrZSI6IjAiLCJoaWRlc2hvcCI6IjAiLCJoaWRlY2FydCI6IjAiLCJoaWRlY2FydGJ0\r\nbiI6IjAiLCJ0ZXh0YnV5IjoiXHU3YWNiXHU1MjNiXHU4ZDJkXHU0ZTcwIiwiZ29vZHN0ZXh0IjoiXHU1NTQ2XHU1NGMxIiwibGlrZXRleHQiOiJcdTUxNzNcdTZjZTgiLCJsaWtlaWNvbmNsYXNzIjoiaWNvbi1saWtlIiwibGlrZWxpbmsiOiJpY29uLWxpa2UiLCJzaG9wdGV4dCI6Ilx1NWU5N1x1OTRmYSIsInNob3BpY29uY2xhc3MiOiJpY29uLXNob3AiLCJjYXJ0dGV4dCI6Ilx1OGQyZFx1NzI2OVx1OGY2NiIsImNhcnRpY29uY2xhc3MiOiJpY29uLWNhcnQifSwic3R5bGUiOnsiYmFja2dyb3VuZCI6IiNmZmZmZmYiLCJ0ZXh0Y29sb3IiOiIjOTk5OTk5IiwiaWNvbmNvbG9yIjoiIzk5OTk5OSIsImNhcnRjb2xvciI6IiNmZTk0MDIiLCJidXljb2xvciI6IiNmZDU1NTUiLCJkb3Rjb2xvciI6IiNmZjAwMTEifSwiaWQiOiJkZXRhaWxfbmF2YmFyIn19fQ==', '../addons/yunphp_shop/plugin/diypage/static/template/detail1/preview.jpg', 11, 0, 0, 0);
INSERT INTO `ims_yunphp_shop_diypage_template` VALUES (12, 0, 7, '整点秒杀', 'eyJwYWdlIjp7InR5cGUiOiI3IiwidGl0bGUiOiJcdTY1NzRcdTcwYjlcdTc5ZDJcdTY3NDAiLCJuYW1lIjoiXHU2NTc0XHU3MGI5XHU3OWQyXHU2NzQwIiwiZGVzYyI6IiIsImljb24iOiIiLCJrZXl3b3JkIjoiIiwiYmFja2dyb3VuZCI6IiNmYWZhZmEiLCJkaXltZW51IjoiLTEiLCJmb2xsb3diYXIiOiIwIiwidmlzaXQiOiIwIiwidmlzaXRsZXZlbCI6eyJtZW1iZXIiOiIiLCJjb21taXNzaW9uIjoiIn0sIm5vdmlzaXQiOnsidGl0bGUiOiIiLCJsaW5rIjoiIn19LCJpdGVtcyI6eyJNMTQ4MDQ5ODExNTc4MCI6eyJ0eXBlIjoiNyIsIm1heCI6IjEiLCJzdHlsZSI6eyJtYXJnaW50b3AiOiIwIiwiYmFja2dyb3VuZCI6IiNmZmZmZmYiLCJjb2xvciI6IiMzMzMzMzMiLCJiZ2NvbG9yIjoiI2ZmZmZmZiIsInNlbGVjdGVkY29sb3IiOiIjZmYzMzAwIiwic2VsZWN0ZWRiZ2NvbG9yIjoiI2ZmZmZmZiJ9LCJpZCI6InNlY2tpbGxfdGltZXMifSwiTTE0ODA0OTgxMTgwMTkiOnsidHlwZSI6IjciLCJtYXgiOiIxIiwic3R5bGUiOnsibWFyZ2ludG9wIjoiMTAiLCJtYXJnaW5ib3R0b20iOiIwIiwiYmFja2dyb3VuZCI6IiNmZmZmZmYifSwiaWQiOiJzZWNraWxsX2FkdnMifSwiTTE0ODA0OTgxMTcwNDMiOnsidHlwZSI6IjciLCJtYXgiOiIxIiwic3R5bGUiOnsibWFyZ2ludG9wIjoiMTAiLCJiYWNrZ3JvdW5kIjoiI2ZmZmZmZiIsImNvbG9yIjoiIzMzMzMzMyIsImJnY29sb3IiOiIjZmZmZmZmIiwic2VsZWN0ZWRjb2xvciI6IiNlZjRmNGYiLCJzZWxlY3RlZGJnY29sb3IiOiIjZmZmZmZmIn0sImlkIjoic2Vja2lsbF9yb29tcyJ9LCJNMTQ4MDQ5ODExODQ1MyI6eyJ0eXBlIjoiNyIsIm1heCI6IjEiLCJwYXJhbXMiOnsidGl0bGV0ZXh0IjoiXHU1MTQ4XHU0ZTBiXHU1MzU1XHU1MTQ4XHU1Zjk3XHU1NGU2fiIsInRpdGxlb3ZlcnRleHQiOiJcdThmZDhcdTUzZWZcdTRlZTVcdTdlZTdcdTdlZWRcdTYyYTJcdThkMmRcdTU0ZTZ+IiwidGl0bGV3YWl0dGV4dCI6Ilx1NTM3M1x1NWMwNlx1NWYwMFx1NTljYiBcdTUxNDhcdTRlMGJcdTUzNTVcdTUxNDhcdTVmOTdcdTU0ZTYiLCJidG50ZXh0IjoiXHU2MmEyXHU4ZDJkXHU0ZTJkIiwiYnRub3ZlcnRleHQiOiJcdTVkZjJcdTYyYTJcdTViOGMiLCJidG53YWl0dGV4dCI6Ilx1N2I0OVx1NWY4NVx1NjJhMlx1OGQyZCJ9LCJzdHlsZSI6eyJtYXJnaW50b3AiOiIxMCIsIm1hcmdpbmJvdHRvbSI6IjAiLCJiYWNrZ3JvdW5kIjoiI2ZmZmZmZiIsInRvcGJnY29sb3IiOiIjZjBmMmY1IiwidG9wY29sb3IiOiIjMzMzMzMzIiwidGltZWJnY29sb3IiOiIjNDY0NTUzIiwidGltZWNvbG9yIjoiI2ZmZmZmZiIsInRpdGxlY29sb3IiOiIjMzMzMzMzIiwicHJpY2Vjb2xvciI6IiNlZjRmNGYiLCJtYXJrZXRwcmljZWNvbG9yIjoiIzk0OTU5OCIsImJ0bmJnY29sb3IiOiIjZWY0ZjRmIiwiYnRub3ZlcmJnY29sb3IiOiIjZjdmN2Y3IiwiYnRud2FpdGJnY29sb3IiOiIjMDRiZTAyIiwiYnRuY29sb3IiOiIjZmZmZmZmIiwiYnRub3ZlcmNvbG9yIjoiIzMzMzMzMyIsImJ0bndhaXRjb2xvciI6IiNmZmZmZmYiLCJwcm9jZXNzdGV4dGNvbG9yIjoiI2QwZDFkMiIsInByb2Nlc3NiZ2NvbG9yIjoiI2ZmOGY4ZiJ9LCJpZCI6InNlY2tpbGxfbGlzdCJ9fX0=', '../addons/yunphp_shop/plugin/diypage/static/template/seckill/preview.png', 12, 0, 0, 0);
INSERT INTO `ims_yunphp_shop_diypage_template` VALUES (13, 0, 6, '积分商城', 'eyJwYWdlIjp7InR5cGUiOiI2IiwidGl0bGUiOiJcdTc5ZWZcdTUyMDZcdTU1NDZcdTU3Y2UiLCJuYW1lIjoiXHU2ZDRiXHU4YmQ1XHU3OWVmXHU1MjA2XHU1NTQ2XHU1N2NlXHU5ODc1XHU5NzYyIiwiZGVzYyI6IiIsImljb24iOiIiLCJrZXl3b3JkIjoiIiwiYmFja2dyb3VuZCI6IiNmYWZhZmEiLCJkaXltZW51IjoiLTEiLCJmb2xsb3diYXIiOiIwIiwidmlzaXQiOiIwIiwidmlzaXRsZXZlbCI6eyJtZW1iZXIiOiIiLCJjb21taXNzaW9uIjoiIn0sIm5vdmlzaXQiOnsidGl0bGUiOiIiLCJsaW5rIjoiIn19LCJpdGVtcyI6eyJNMTQ3OTI2MTA2MTY0NSI6eyJzdHlsZSI6eyJkb3RzdHlsZSI6InJvdW5kIiwiZG90YWxpZ24iOiJjZW50ZXIiLCJiYWNrZ3JvdW5kIjoiI2ZmZmZmZiIsImxlZnRyaWdodCI6IjUiLCJib3R0b20iOiI1Iiwib3BhY2l0eSI6IjAuOCJ9LCJkYXRhIjp7IkMxNDc5MjYxMDYxNjQ1Ijp7ImltZ3VybCI6Imh0dHA6XC9cL29mNm9kaGRxMS5ia3QuY2xvdWRkbi5jb21cLzA2M2E2ZWM4NGY0NWE3MGQ2Y2NhOGQ4ZjI2NWQxYjcyLmpwZyIsImxpbmt1cmwiOiIuXC9pbmRleC5waHA/aT0xMiZjPWVudHJ5Jm09ZXdlaV9zaG9wdjImZG89bW9iaWxlJnI9Y3JlZGl0c2hvcC5kZXRhaWwmaWQ9MTE3In0sIkMxNDc5MjYxMDYxNjQ2Ijp7ImltZ3VybCI6Imh0dHA6XC9cL29mNm9kaGRxMS5ia3QuY2xvdWRkbi5jb21cLzQwMTgzYzEyY2M0MWIxYWYwMjY3NDIwYzUwNjQyODliLmpwZyIsImxpbmt1cmwiOiIuXC9pbmRleC5waHA/aT0xMiZjPWVudHJ5Jm09ZXdlaV9zaG9wdjImZG89bW9iaWxlJnI9Y3JlZGl0c2hvcC5saXN0cyJ9fSwiaWQiOiJiYW5uZXIifSwiTTE0NzkyNjgxMTQxNjEiOnsic3R5bGUiOnsibWFyZ2ludG9wIjoiMTAiLCJiYWNrZ3JvdW5kIjoiI2ZmZmZmZiJ9LCJkYXRhIjp7IkMxNDc5MjY4MTE0MTYxIjp7InRleHQiOiJcdTYyMTFcdTc2ODRcdTc5ZWZcdTUyMDYiLCJpY29uY2xhc3MiOiJpY29uLWppZmVuIiwidGV4dGNvbG9yIjoiIzY2NjY2NiIsImljb25jb2xvciI6IiM2NjY2NjYiLCJsaW5rdXJsIjoiLlwvaW5kZXgucGhwP2k9MTImYz1lbnRyeSZtPWV3ZWlfc2hvcHYyJmRvPW1vYmlsZSZyPWNyZWRpdHNob3AuY3JlZGl0bG9nIn0sIkMxNDc5MjY4MTE0MTYyIjp7InRleHQiOiJcdTUxNTFcdTYzNjJcdThiYjBcdTVmNTUiLCJpY29uY2xhc3MiOiJpY29uLWxpc3QiLCJ0ZXh0Y29sb3IiOiIjNjY2NjY2IiwiaWNvbmNvbG9yIjoiIzY2NjY2NiIsImxpbmt1cmwiOiIuXC9pbmRleC5waHA/aT0xMiZjPWVudHJ5Jm09ZXdlaV9zaG9wdjImZG89bW9iaWxlJnI9Y3JlZGl0c2hvcC5sb2cifX0sImlkIjoibWVudTIifSwiTTE0NzkyOTA3OTU0MjciOnsicGFyYW1zIjp7InBsYWNlaG9sZGVyIjoiXHU4YmY3XHU4ZjkzXHU1MTY1XHU1MTczXHU5NTJlXHU1YjU3XHU4ZmRiXHU4ODRjXHU2NDFjXHU3ZDIyIiwiZ29vZHN0eXBlIjoiMSJ9LCJzdHlsZSI6eyJpbnB1dGJhY2tncm91bmQiOiIjZmZmZmZmIiwiYmFja2dyb3VuZCI6IiNmMWYxZjIiLCJpY29uY29sb3IiOiIjYjRiNGI0IiwiY29sb3IiOiIjOTk5OTk5IiwicGFkZGluZ3RvcCI6IjYiLCJwYWRkaW5nbGVmdCI6IjEwIiwidGV4dGFsaWduIjoibGVmdCIsInNlYXJjaHN0eWxlIjoiIn0sImlkIjoic2VhcmNoIn0sIk0xNDc5NTQ0NjE5NDQwIjp7InN0eWxlIjp7ImhlaWdodCI6IjEwIiwiYmFja2dyb3VuZCI6IiNmYWZhZmEifSwiaWQiOiJibGFuayJ9LCJNMTQ3OTI2MTA3NjMzMyI6eyJzdHlsZSI6eyJuYXZzdHlsZSI6IiIsImJhY2tncm91bmQiOiIjZmZmZmZmIiwicm93bnVtIjoiNCIsInNob3d0eXBlIjoiMCIsInNob3dkb3QiOiIxIiwicGFnZW51bSI6IjgifSwiZGF0YSI6eyJDMTQ3OTI2MTA3NjMzMyI6eyJpbWd1cmwiOiJodHRwOlwvXC9vZjZvZGhkcTEuYmt0LmNsb3VkZG4uY29tXC9mNGM0ZWZlNjEwMzJiNGE5N2VjYTAzNWM3ZTcyNTA2OC5wbmciLCJsaW5rdXJsIjoiIiwidGV4dCI6Ilx1NzNiMFx1OTFkMVx1N2VhMlx1NTMwNSIsImNvbG9yIjoiIzY2NjY2NiJ9LCJDMTQ3OTI2MTA3NjMzNCI6eyJpbWd1cmwiOiJodHRwOlwvXC9vZjZvZGhkcTEuYmt0LmNsb3VkZG4uY29tXC83MTg2ZWI1NDE2OWExMzU1YTcwMjQxNjA1OGY1ODg2My5wbmciLCJsaW5rdXJsIjoiIiwidGV4dCI6Ilx1N2NiZVx1N2Y4ZVx1NWI5ZVx1NzI2OSIsImNvbG9yIjoiIzY2NjY2NiJ9LCJDMTQ3OTI2MTA3NjMzNSI6eyJpbWd1cmwiOiJodHRwOlwvXC9vZjZvZGhkcTEuYmt0LmNsb3VkZG4uY29tXC85NzFhODQxYzI1NzdlZDlhYjQyNDJlOTkxZjU5YWE1My5wbmciLCJsaW5rdXJsIjoiIiwidGV4dCI6Ilx1NGYxOFx1NjBlMFx1NTIzOCIsImNvbG9yIjoiIzY2NjY2NiJ9LCJDMTQ3OTI2MTA3NjMzNiI6eyJpbWd1cmwiOiJodHRwOlwvXC9vZjZvZGhkcTEuYmt0LmNsb3VkZG4uY29tXC80NWE3NDYwOTRlOWM5NmY2ZTY5Njg0OWFlNmYxMDFhZS5wbmciLCJsaW5rdXJsIjoiIiwidGV4dCI6Ilx1NGY1OVx1OTg5ZFx1NTk1Nlx1NTJiMSIsImNvbG9yIjoiIzY2NjY2NiJ9fSwiaWQiOiJtZW51In0sIk0xNDc5MjYxNDUwNzM0Ijp7InN0eWxlIjp7Im1hcmdpbnRvcCI6IjEwIiwiYmFja2dyb3VuZCI6IiNmZmZmZmYiLCJpY29uY29sb3IiOiIjOTk5OTk5IiwidGV4dGNvbG9yIjoiIzMzMzMzMyIsInJlbWFya2NvbG9yIjoiIzg4ODg4OCJ9LCJkYXRhIjp7IkMxNDc5MjYxNDUwNzM0Ijp7InRleHQiOiJcdTdjYmVcdTdmOGVcdTViOWVcdTcyNjlcdTYyYmRcdTU5NTYiLCJsaW5rdXJsIjoiIiwiaWNvbmNsYXNzIjoiaWNvbi1naWZ0cyIsInJlbWFyayI6Ilx1NjZmNFx1NTkxYSIsImRvdG51bSI6IiJ9fSwiaWQiOiJsaXN0bWVudSJ9LCJNMTQ3OTU0Mzc4MTg2NyI6eyJwYXJhbXMiOnsiZ29vZHN0eXBlIjoiMSIsInNob3d0aXRsZSI6IjEiLCJzaG93cHJpY2UiOiIxIiwic2hvd3RhZyI6IjIiLCJnb29kc2RhdGEiOiI1IiwiY2F0ZWlkIjoiIiwiY2F0ZW5hbWUiOiIiLCJncm91cGlkIjoiIiwiZ3JvdXBuYW1lIjoiIiwiZ29vZHNzb3J0IjoiMCIsImdvb2RzbnVtIjoiNiIsInNob3dpY29uIjoiMSIsImljb25wb3NpdGlvbiI6ImxlZnQg\r\ndG9wIiwicHJvZHVjdHByaWNlIjoiMSIsImdvb2Rzc2Nyb2xsIjoiMSJ9LCJzdHlsZSI6eyJiYWNrZ3JvdW5kIjoiI2ZmZmZmZiIsImxpc3RzdHlsZSI6ImJsb2NrIiwiYnV5c3R5bGUiOiJidXlidG4tMSIsImdvb2RzaWNvbiI6InJlY29tbWFuZCIsInByaWNlY29sb3IiOiIjZWQyODIyIiwiaWNvbnBhZGRpbmd0b3AiOiIwIiwiaWNvbnBhZGRpbmdsZWZ0IjoiMCIsImJ1eWJ0bmNvbG9yIjoiI2ZlNTQ1NSIsImljb256b29tIjoiMTAwIiwidGl0bGVjb2xvciI6IiMyNjI2MjYiLCJ0YWdiYWNrZ3JvdW5kIjoiI2ZlNTQ1NSJ9LCJkYXRhIjp7IkMxNDc5NTQzNzgxODY3Ijp7InRodW1iIjoiLi5cL2FkZG9uc1wvZXdlaV9zaG9wdjJcL3BsdWdpblwvZGl5cGFnZVwvc3RhdGljXC9pbWFnZXNcL2RlZmF1bHRcL2dvb2RzLTEuanBnIiwicHJpY2UiOiIyMC4wMCIsInRpdGxlIjoiXHU4ZmQ5XHU5MWNjXHU2NjJmXHU1NTQ2XHU1NGMxXHU2ODA3XHU5ODk4IiwiZ2lkIjoiIiwiYmFyZ2FpbiI6IjAiLCJjcmVkaXQiOiIwIiwiY3R5cGUiOiIxIn0sIkMxNDc5NTQzNzgxODY4Ijp7InRodW1iIjoiLi5cL2FkZG9uc1wvZXdlaV9zaG9wdjJcL3BsdWdpblwvZGl5cGFnZVwvc3RhdGljXC9pbWFnZXNcL2RlZmF1bHRcL2dvb2RzLTIuanBnIiwicHJpY2UiOiIyMC4wMCIsInRpdGxlIjoiXHU4ZmQ5XHU5MWNjXHU2NjJmXHU1NTQ2XHU1NGMxXHU2ODA3XHU5ODk4IiwiZ2lkIjoiIiwiYmFyZ2FpbiI6IjAiLCJjcmVkaXQiOiIwIiwiY3R5cGUiOiIxIn0sIkMxNDc5NTQzNzgxODY5Ijp7InRodW1iIjoiLi5cL2FkZG9uc1wvZXdlaV9zaG9wdjJcL3BsdWdpblwvZGl5cGFnZVwvc3RhdGljXC9pbWFnZXNcL2RlZmF1bHRcL2dvb2RzLTMuanBnIiwicHJpY2UiOiIyMC4wMCIsInRpdGxlIjoiXHU4ZmQ5XHU5MWNjXHU2NjJmXHU1NTQ2XHU1NGMxXHU2ODA3XHU5ODk4IiwiZ2lkIjoiIiwiYmFyZ2FpbiI6IjAiLCJjcmVkaXQiOiIwIiwiY3R5cGUiOiIwIn0sIkMxNDc5NTQzNzgxODcwIjp7InRodW1iIjoiLi5cL2FkZG9uc1wvZXdlaV9zaG9wdjJcL3BsdWdpblwvZGl5cGFnZVwvc3RhdGljXC9pbWFnZXNcL2RlZmF1bHRcL2dvb2RzLTQuanBnIiwicHJpY2UiOiIyMC4wMCIsInRpdGxlIjoiXHU4ZmQ5XHU5MWNjXHU2NjJmXHU1NTQ2XHU1NGMxXHU2ODA3XHU5ODk4IiwiZ2lkIjoiIiwiYmFyZ2FpbiI6IjAiLCJjcmVkaXQiOiIwIiwiY3R5cGUiOiIwIn19LCJpZCI6Imdvb2RzIn0sIk0xNDc5MjYxNTk0MDc3Ijp7InN0eWxlIjp7Im1hcmdpbnRvcCI6IjEwIiwiYmFja2dyb3VuZCI6IiNmZmZmZmYiLCJpY29uY29sb3IiOiIjOTk5OTk5IiwidGV4dGNvbG9yIjoiIzMzMzMzMyIsInJlbWFya2NvbG9yIjoiIzg4ODg4OCJ9LCJkYXRhIjp7IkMxNDc5MjYxNTk0MDc3Ijp7InRleHQiOiJcdTU1NDZcdTU3Y2VcdTRmMThcdTYwZTBcdTUyMzgiLCJsaW5rdXJsIjoiIiwiaWNvbmNsYXNzIjoiaWNvbi1naWZ0cyIsInJlbWFyayI6Ilx1NjZmNFx1NTkxYSIsImRvdG51bSI6IiJ9fSwiaWQiOiJsaXN0bWVudSJ9LCJNMTQ3OTI2MTY1NTkxOSI6eyJwYXJhbXMiOnsic2hvd3RpdGxlIjoiMSIsInNob3dwcmljZSI6IjEiLCJnb29kc2RhdGEiOiIxIiwiY2F0ZWlkIjoiOTAiLCJjYXRlbmFtZSI6Ilx1NmQ0Ylx1OGJkNVx1NTIwNlx1N2M3YjAxMCIsImdyb3VwaWQiOiIiLCJncm91cG5hbWUiOiIiLCJnb29kc3NvcnQiOiIwIiwiZ29vZHNudW0iOiI2Iiwic2hvd2ljb24iOiIxIiwiaWNvbnBvc2l0aW9uIjoibGVmdCB0b3AiLCJnb29kc3R5cGUiOiIxIiwiZ29vZHNzY3JvbGwiOiIwIn0sInN0eWxlIjp7Imxpc3RzdHlsZSI6IiIsImJ1eXN0eWxlIjoiYnV5YnRuLTEiLCJnb29kc2ljb24iOiJyZWNvbW1hbmQiLCJwcmljZWNvbG9yIjoiI2VkMjgyMiIsImljb25wYWRkaW5ndG9wIjoiMCIsImljb25wYWRkaW5nbGVmdCI6IjAiLCJidXlidG5jb2xvciI6IiNmZTU0NTUiLCJpY29uem9vbSI6IjEwMCIsInRpdGxlY29sb3IiOiIjMjYyNjI2In0sImRhdGEiOnsiQzE0NzkyNjE2NTU5MTkiOnsidGh1bWIiOiIuLlwvYWRkb25zXC9ld2VpX3Nob3B2MlwvcGx1Z2luXC9kaXlwYWdlXC9zdGF0aWNcL2ltYWdlc1wvZGVmYXVsdFwvZ29vZHMtMS5qcGciLCJwcmljZSI6IjIwLjAwIiwidGl0bGUiOiJcdThmZDlcdTkxY2NcdTY2MmZcdTU1NDZcdTU0YzFcdTY4MDdcdTk4OTgiLCJnaWQiOiIiLCJiYXJnYWluIjoiMCJ9LCJDMTQ3OTI2MTY1NTkyMCI6eyJ0aHVtYiI6Ii4uXC9hZGRvbnNcL2V3ZWlfc2hvcHYyXC9wbHVnaW5cL2RpeXBhZ2VcL3N0YXRpY1wvaW1hZ2VzXC9kZWZhdWx0XC9nb29kcy0yLmpwZyIsInByaWNlIjoiMjAuMDAiLCJ0aXRsZSI6Ilx1OGZkOVx1OTFjY1x1NjYyZlx1NTU0Nlx1NTRjMVx1NjgwN1x1OTg5OCIsImdpZCI6IiIsImJhcmdhaW4iOiIwIn0sIkMxNDc5MjYxNjU1OTIxIjp7InRodW1iIjoiLi5cL2FkZG9uc1wvZXdlaV9zaG9wdjJcL3BsdWdpblwvZGl5cGFnZVwvc3RhdGljXC9pbWFnZXNcL2RlZmF1bHRcL2dvb2RzLTMuanBnIiwicHJpY2UiOiIyMC4wMCIsInRpdGxlIjoiXHU4ZmQ5XHU5MWNjXHU2NjJmXHU1NTQ2XHU1NGMxXHU2ODA3XHU5ODk4IiwiZ2lkIjoiIiwiYmFyZ2FpbiI6IjAifSwiQzE0NzkyNjE2NTU5MjIiOnsidGh1bWIiOiIuLlwvYWRkb25zXC9ld2VpX3Nob3B2MlwvcGx1Z2luXC9kaXlwYWdlXC9zdGF0aWNcL2ltYWdlc1wvZGVmYXVsdFwvZ29vZHMtNC5qcGciLCJwcmljZSI6IjIwLjAwIiwidGl0bGUiOiJcdThmZDlcdTkxY2NcdTY2MmZcdTU1NDZcdTU0YzFcdTY4MDdcdTk4OTgiLCJnaWQiOiIiLCJiYXJnYWluIjoiMCJ9fSwiaWQiOiJnb29kcyJ9fX0=', '../addons/yunphp_shop/plugin/diypage/static/template/creditshop/preview.png', 13, 0, 0, 0);
INSERT INTO `ims_yunphp_shop_diypage_template` VALUES (14, 0, 8, '兑换中心', 'eyJwYWdlIjp7InR5cGUiOiI4IiwidGl0bGUiOiJcdTUxNTFcdTYzNjJcdTRlMmRcdTVmYzMiLCJuYW1lIjoiXHU1MTUxXHU2MzYyXHU0ZTJkXHU1ZmMzXHU2YTIxXHU2NzdmIiwiZGVzYyI6IiIsImljb24iOiIiLCJrZXl3b3JkIjoiIiwiYmFja2dyb3VuZCI6IiNmYWZhZmEiLCJkaXltZW51IjoiLTEiLCJkaXlsYXllciI6IjAiLCJkaXlnb3RvcCI6IjAiLCJmb2xsb3diYXIiOiIwIiwidmlzaXQiOiIwIiwidmlzaXRsZXZlbCI6eyJtZW1iZXIiOiIiLCJjb21taXNzaW9uIjoiIn0sIm5vdmlzaXQiOnsidGl0bGUiOiIiLCJsaW5rIjoiIn19LCJpdGVtcyI6eyJNMTQ4MjM3Mjk0MjA3NSI6eyJtYXgiOiIxIiwidHlwZSI6IjgiLCJwYXJhbXMiOnsiZGF0YXR5cGUiOiIwIn0sInN0eWxlIjp7ImRvdHN0eWxlIjoicm91bmQiLCJkb3RhbGlnbiI6ImNlbnRlciIsImJhY2tncm91bmQiOiIjZmZmZmZmIiwibGVmdHJpZ2h0IjoiNSIsImJvdHRvbSI6IjUiLCJvcGFjaXR5IjoiMC44In0sImRhdGEiOnsiQzE0ODIzNzI5NDIwNzUiOnsiaW1ndXJsIjoiLi5cL2FkZG9uc1wvZXdlaV9zaG9wdjJcL3BsdWdpblwvZGl5cGFnZVwvc3RhdGljXC9pbWFnZXNcL2RlZmF1bHRcL2Jhbm5lci0xLmpwZyIsImxpbmt1cmwiOiIifSwiQzE0ODIzNzI5NDIwNzYiOnsiaW1ndXJsIjoiLi5cL2FkZG9uc1wvZXdlaV9zaG9wdjJcL3BsdWdpblwvZGl5cGFnZVwvc3RhdGljXC9pbWFnZXNcL2RlZmF1bHRcL2Jhbm5lci0yLmpwZyIsImxpbmt1cmwiOiIifX0sImlkIjoiZXhjaGFuZ2VfYmFubmVyIn0sIk0xNDgyMzcyOTQyNTE1Ijp7Im1heCI6IjEiLCJ0eXBlIjoiOCIsInBhcmFtcyI6eyJwcmV2aWV3IjoiMCIsInRpdGxlIjoiXHU1MTUxXHU2MzYyXHU3ODAxXHU1MTUxXHU2MzYyIiwicGxhY2Vob2xkZXIiOiJcdThiZjdcdThmOTNcdTUxNjVcdTUxNTFcdTYzNjJcdTc4MDEiLCJidG50ZXh0IjoiXHU3YWNiXHU1MzczXHU1MTUxXHU2MzYyIiwiYmFja2J0biI6Ilx1OGZkNFx1NTZkZVx1OTFjZFx1NjViMFx1OGY5M1x1NTE2NVx1NTE1MVx1NjM2Mlx1NzgwMSIsImV4YnRudGV4dCI6Ilx1NTE1MVx1NjM2MiIsImV4YnRuMnRleHQiOiJcdTVkZjJcdTUxNTFcdTYzNjIiLCJjcmVkaXRpY29uIjoiLi5cL2FkZG9uc1wvZXdlaV9zaG9wdjJcL3BsdWdpblwvZGl5cGFnZVwvc3RhdGljXC9pbWFnZXNcL2RlZmF1bHRcL2ljb25fY3JlZGl0LnBuZyIsIm1vbmV5aWNvbiI6Ii4uXC9hZGRvbnNcL2V3ZWlfc2hvcHYyXC9wbHVnaW5cL2RpeXBhZ2VcL3N0YXRpY1wvaW1hZ2VzXC9kZWZhdWx0XC9pY29uX21vbmV5LnBuZyIsImNvdXBvbmljb24iOiIuLlwvYWRkb25zXC9ld2VpX3Nob3B2MlwvcGx1Z2luXC9kaXlwYWdlXC9zdGF0aWNcL2ltYWdlc1wvZGVmYXVsdFwvaWNvbl9jb3Vwb24ucG5nIiwicmVkYmFnaWNvbiI6Ii4uXC9hZGRvbnNcL2V3ZWlfc2hvcHYyXC9wbHVnaW5cL2RpeXBhZ2VcL3N0YXRpY1wvaW1hZ2VzXC9kZWZhdWx0XC9pY29uX3JlZGJhZy5wbmciLCJnb29kc2ljb24iOiIuLlwvYWRkb25zXC9ld2VpX3Nob3B2MlwvcGx1Z2luXC9kaXlwYWdlXC9zdGF0aWNcL2ltYWdlc1wvZGVmYXVsdFwvaWNvbl9nb29kcy5wbmcifSwic3R5bGUiOnsidGl0bGVjb2xvciI6IiM0NDQ0NDQiLCJidG5jb2xvciI6IiNmZmZmZmYiLCJidG5iYWNrZ3JvdW5kIjoiI2VkNTU2NSIsImlucHV0Y29sb3IiOiIjNjY2NjY2IiwiaW5wdXRiYWNrZ3JvdW5kIjoiI2ZmZmZmZiIsImlucHV0Ym9yZGVyIjoiI2VmZWZlZiIsImNvZGVjb2xvciI6IiM0NDQ0NDQiLCJudW1jb2xvciI6IiM5OTk5OTkiLCJleGJ0bmNvbG9yIjoiI2ZmZmZmZiIsImV4YnRuYmFja2dyb3VuZCI6IiNlZDU1NjUiLCJleGJ0bjJjb2xvciI6IiNmZmZmZmYiLCJleGJ0bjJiYWNrZ3JvdW5kIjoiI2NjY2NjYyIsImJhY2tidG5jb2xvciI6IiM0NDQ0NDQiLCJiYWNrYnRuYm9yZGVyIjoiI2U3ZWFlYyIsImJhY2tidG5iYWNrZ3JvdW5kIjoiI2Y3ZjdmNyIsImdvb2RzdGl0bGUiOiIjNDQ0NDQ0IiwiZ29vZHNwcmljZSI6IiNhYWFhYWEifSwiaWQiOiJleGNoYW5nZV9pbnB1dCJ9LCJNMTQ4MjM3Mjk0MzE3MyI6eyJtYXgiOiIxIiwidHlwZSI6IjgiLCJwYXJhbXMiOnsicnVsZXRpdGxlIjoiXHU1MTUxXHU2MzYyXHU4OWM0XHU1MjE5In0sInN0eWxlIjp7InJ1bGV0aXRsZWNvbG9yIjoiIzU1NTU1NSJ9LCJpZCI6ImV4Y2hhbmdlX3J1bGUifX19', '../addons/yunphp_shop/plugin/diypage/static/template/exchange/preview.png', 14, 0, 0, 0);

-- ----------------------------
-- Table structure for ims_yunphp_shop_diypage_template_category
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_diypage_template_category`;
CREATE TABLE `ims_yunphp_shop_diypage_template_category`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT 0,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `merch` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_exchange_cart
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_exchange_cart`;
CREATE TABLE `ims_yunphp_shop_exchange_cart`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT NULL,
  `openid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `goodsid` int(11) NULL DEFAULT NULL,
  `total` int(10) NULL DEFAULT 1,
  `marketprice` decimal(10, 2) NULL DEFAULT NULL,
  `optionid` int(11) NULL DEFAULT NULL,
  `selected` tinyint(1) NULL DEFAULT 1,
  `deleted` tinyint(1) NULL DEFAULT 0,
  `merchid` int(11) NULL DEFAULT 0,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `groupid` int(11) NULL DEFAULT NULL,
  `serial` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_exchange_code
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_exchange_code`;
CREATE TABLE `ims_yunphp_shop_exchange_code`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupid` int(11) NOT NULL DEFAULT 0,
  `uniacid` int(11) NOT NULL DEFAULT 0,
  `endtime` datetime NOT NULL DEFAULT '2016-10-01 00:00:00',
  `status` int(2) NOT NULL DEFAULT 1,
  `openid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `count` int(11) NOT NULL DEFAULT 0,
  `key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `type` int(11) NOT NULL DEFAULT 0,
  `scene` int(11) NOT NULL DEFAULT 0,
  `qrcode_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `serial` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `balancestatus` int(11) NULL DEFAULT 1,
  `redstatus` int(11) NULL DEFAULT 1,
  `scorestatus` int(11) NULL DEFAULT 1,
  `couponstatus` int(11) NULL DEFAULT 1,
  `goodsstatus` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`, `key`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_exchange_group
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_exchange_group`;
CREATE TABLE `ims_yunphp_shop_exchange_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `type` int(2) NOT NULL DEFAULT 0,
  `endtime` datetime NOT NULL DEFAULT '2016-10-01 00:00:00',
  `mode` int(2) NOT NULL DEFAULT 0,
  `status` int(2) NOT NULL DEFAULT 0,
  `max` int(2) NOT NULL DEFAULT 0,
  `value` decimal(10, 2) NOT NULL DEFAULT 0.00,
  `uniacid` int(11) NOT NULL DEFAULT 0,
  `starttime` datetime NOT NULL DEFAULT '2016-10-01 00:00:00',
  `goods` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `score` int(11) NOT NULL DEFAULT 0,
  `coupon` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `use` int(11) NOT NULL DEFAULT 0,
  `total` int(11) NOT NULL DEFAULT 0,
  `red` decimal(10, 2) NOT NULL DEFAULT 0.00,
  `balance` decimal(10, 2) NOT NULL DEFAULT 0.00,
  `balance_left` decimal(10, 2) NOT NULL DEFAULT 0.00,
  `balance_right` decimal(10, 2) NOT NULL DEFAULT 0.00,
  `red_left` decimal(10, 2) NOT NULL DEFAULT 0.00,
  `red_right` decimal(10, 2) NOT NULL DEFAULT 0.00,
  `score_left` int(11) NOT NULL DEFAULT 0,
  `score_right` int(11) NOT NULL DEFAULT 0,
  `balance_type` int(11) NOT NULL,
  `red_type` int(11) NOT NULL,
  `score_type` int(11) NOT NULL,
  `title_reply` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `rule` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `coupon_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `basic_content` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `reply_type` int(11) NOT NULL DEFAULT 0,
  `code_type` int(11) NOT NULL DEFAULT 0,
  `binding` int(11) NOT NULL DEFAULT 0,
  `showcount` int(11) NULL DEFAULT 0,
  `postage` decimal(10, 2) NULL DEFAULT 0.00,
  `postage_type` int(11) NULL DEFAULT 0,
  `banner` varchar(800) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `keyword_reply` int(11) NULL DEFAULT 0,
  `reply_status` int(11) NULL DEFAULT 1,
  `reply_keyword` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `input_banner` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `diypage` int(11) NOT NULL DEFAULT 0,
  `sendname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `wishing` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `actname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_exchange_query
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_exchange_query`;
CREATE TABLE `ims_yunphp_shop_exchange_query`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT 0,
  `openid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `querykey` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `querytime` int(11) NOT NULL DEFAULT 0,
  `unfreeze` int(11) NOT NULL DEFAULT 0,
  `errorcount` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`, `openid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_exchange_record
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_exchange_record`;
CREATE TABLE `ims_yunphp_shop_exchange_record`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `uniacid` int(11) NULL DEFAULT NULL,
  `goods` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `orderid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `time` int(11) NOT NULL,
  `openid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `mode` int(11) NOT NULL DEFAULT 0,
  `balance` decimal(10, 2) NULL DEFAULT 0.00,
  `red` decimal(10, 2) NOT NULL DEFAULT 0.00,
  `coupon` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `score` int(11) NOT NULL DEFAULT 0,
  `nickname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `groupid` int(11) NOT NULL DEFAULT 0,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `serial` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `ordersn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `goods_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`, `key`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_exchange_setting
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_exchange_setting`;
CREATE TABLE `ims_yunphp_shop_exchange_setting`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT 0,
  `freeze` int(11) NOT NULL DEFAULT 0,
  `mistake` int(11) NOT NULL DEFAULT 0,
  `grouplimit` int(11) NOT NULL DEFAULT 0,
  `alllimit` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`, `uniacid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for ims_yunphp_shop_exhelper_express
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_exhelper_express`;
CREATE TABLE `ims_yunphp_shop_exhelper_express`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `type` int(1) NOT NULL DEFAULT 1 COMMENT '单据分类 1为快递单 2为发货单',
  `expressname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `expresscom` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `express` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `width` decimal(10, 2) NULL DEFAULT 0.00,
  `datas` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `height` decimal(10, 2) NULL DEFAULT 0.00,
  `bg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `isdefault` tinyint(3) NULL DEFAULT 0,
  `merchid` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_isdefault`(`isdefault`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_exhelper_senduser
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_exhelper_senduser`;
CREATE TABLE `ims_yunphp_shop_exhelper_senduser`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `sendername` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '发件人',
  `sendertel` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '发件人联系电话',
  `sendersign` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '发件人签名',
  `sendercode` int(11) NULL DEFAULT NULL COMMENT '发件地址邮编',
  `senderaddress` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '发件地址',
  `sendercity` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发件城市',
  `isdefault` tinyint(3) NULL DEFAULT 0,
  `merchid` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_isdefault`(`isdefault`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_exhelper_sys
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_exhelper_sys`;
CREATE TABLE `ims_yunphp_shop_exhelper_sys`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT 0,
  `ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'localhost',
  `port` int(11) NOT NULL DEFAULT 8000,
  `ip_cloud` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `port_cloud` int(11) NOT NULL DEFAULT 8000,
  `is_cloud` int(1) NOT NULL DEFAULT 0,
  `merchid` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_express
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_express`;
CREATE TABLE `ims_yunphp_shop_express`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `express_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `express_price` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `express_area` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `express_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `express` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `status` tinyint(1) NULL DEFAULT 1,
  `displayorder` tinyint(3) UNSIGNED NULL DEFAULT 0,
  `code` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 92 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ims_yunphp_shop_express
-- ----------------------------
INSERT INTO `ims_yunphp_shop_express` VALUES (1, 0, '', '', '', '', '顺丰', 'shunfeng', 1, 0, '');
INSERT INTO `ims_yunphp_shop_express` VALUES (2, 0, '', '', '', '', '申通', 'shentong', 1, 0, '');
INSERT INTO `ims_yunphp_shop_express` VALUES (3, 0, '', '', '', '', '韵达快运', 'yunda', 1, 0, '');
INSERT INTO `ims_yunphp_shop_express` VALUES (4, 0, '', '', '', '', '天天快递', 'tiantian', 1, 0, '');
INSERT INTO `ims_yunphp_shop_express` VALUES (5, 0, '', '', '', '', '圆通速递', 'yuantong', 1, 0, '');
INSERT INTO `ims_yunphp_shop_express` VALUES (6, 0, '', '', '', '', '中通速递', 'zhongtong', 1, 0, '');
INSERT INTO `ims_yunphp_shop_express` VALUES (7, 0, '', '', '', '', 'ems快递', 'ems', 1, 0, '');
INSERT INTO `ims_yunphp_shop_express` VALUES (8, 0, '', '', '', '', '汇通快运', 'huitongkuaidi', 1, 0, '');
INSERT INTO `ims_yunphp_shop_express` VALUES (9, 0, '', '', '', '', '全峰快递', 'quanfengkuaidi', 1, 0, '');
INSERT INTO `ims_yunphp_shop_express` VALUES (10, 0, '', '', '', '', '宅急送', 'zhaijisong', 1, 0, '');
INSERT INTO `ims_yunphp_shop_express` VALUES (11, 0, '', '', '', '', 'aae全球专递', 'aae', 1, 0, '');
INSERT INTO `ims_yunphp_shop_express` VALUES (12, 0, '', '', '', '', '安捷快递', 'anjie', 1, 0, '');
INSERT INTO `ims_yunphp_shop_express` VALUES (13, 0, '', '', '', '', '安信达快递', 'anxindakuaixi', 1, 0, '');
INSERT INTO `ims_yunphp_shop_express` VALUES (14, 0, '', '', '', '', '彪记快递', 'biaojikuaidi', 1, 0, '');
INSERT INTO `ims_yunphp_shop_express` VALUES (15, 0, '', '', '', '', 'bht', 'bht', 1, 0, '');
INSERT INTO `ims_yunphp_shop_express` VALUES (16, 0, '', '', '', '', '百福东方国际物流', 'baifudongfang', 1, 0, '');
INSERT INTO `ims_yunphp_shop_express` VALUES (17, 0, '', '', '', '', '中国东方（COE）', 'coe', 1, 0, '');
INSERT INTO `ims_yunphp_shop_express` VALUES (18, 0, '', '', '', '', '长宇物流', 'changyuwuliu', 1, 0, '');
INSERT INTO `ims_yunphp_shop_express` VALUES (19, 0, '', '', '', '', '大田物流', 'datianwuliu', 1, 0, '');
INSERT INTO `ims_yunphp_shop_express` VALUES (20, 0, '', '', '', '', '德邦物流', 'debangwuliu', 1, 0, '');
INSERT INTO `ims_yunphp_shop_express` VALUES (21, 0, '', '', '', '', 'dhl', 'dhl', 1, 0, '');
INSERT INTO `ims_yunphp_shop_express` VALUES (22, 0, '', '', '', '', 'dpex', 'dpex', 1, 0, '');
INSERT INTO `ims_yunphp_shop_express` VALUES (23, 0, '', '', '', '', 'd速快递', 'dsukuaidi', 1, 0, '');
INSERT INTO `ims_yunphp_shop_express` VALUES (24, 0, '', '', '', '', '递四方', 'disifang', 1, 0, '');
INSERT INTO `ims_yunphp_shop_express` VALUES (25, 0, '', '', '', '', 'fedex（国外）', 'fedex', 1, 0, '');
INSERT INTO `ims_yunphp_shop_express` VALUES (26, 0, '', '', '', '', '飞康达物流', 'feikangda', 1, 0, '');
INSERT INTO `ims_yunphp_shop_express` VALUES (27, 0, '', '', '', '', '凤凰快递', 'fenghuangkuaidi', 1, 0, '');
INSERT INTO `ims_yunphp_shop_express` VALUES (28, 0, '', '', '', '', '飞快达', 'feikuaida', 1, 0, '');
INSERT INTO `ims_yunphp_shop_express` VALUES (29, 0, '', '', '', '', '国通快递', 'guotongkuaidi', 1, 0, '');
INSERT INTO `ims_yunphp_shop_express` VALUES (30, 0, '', '', '', '', '港中能达物流', 'ganzhongnengda', 1, 0, '');
INSERT INTO `ims_yunphp_shop_express` VALUES (31, 0, '', '', '', '', '广东邮政物流', 'guangdongyouzhengwuliu', 1, 0, '');
INSERT INTO `ims_yunphp_shop_express` VALUES (32, 0, '', '', '', '', '共速达', 'gongsuda', 1, 0, '');
INSERT INTO `ims_yunphp_shop_express` VALUES (33, 0, '', '', '', '', '恒路物流', 'hengluwuliu', 1, 0, '');
INSERT INTO `ims_yunphp_shop_express` VALUES (34, 0, '', '', '', '', '华夏龙物流', 'huaxialongwuliu', 1, 0, '');
INSERT INTO `ims_yunphp_shop_express` VALUES (35, 0, '', '', '', '', '海红', 'haihongwangsong', 1, 0, '');
INSERT INTO `ims_yunphp_shop_express` VALUES (36, 0, '', '', '', '', '海外环球', 'haiwaihuanqiu', 1, 0, '');
INSERT INTO `ims_yunphp_shop_express` VALUES (37, 0, '', '', '', '', '佳怡物流', 'jiayiwuliu', 1, 0, '');
INSERT INTO `ims_yunphp_shop_express` VALUES (38, 0, '', '', '', '', '京广速递', 'jinguangsudikuaijian', 1, 0, '');
INSERT INTO `ims_yunphp_shop_express` VALUES (39, 0, '', '', '', '', '急先达', 'jixianda', 1, 0, '');
INSERT INTO `ims_yunphp_shop_express` VALUES (40, 0, '', '', '', '', '佳吉物流', 'jjwl', 1, 0, '');
INSERT INTO `ims_yunphp_shop_express` VALUES (41, 0, '', '', '', '', '加运美物流', 'jymwl', 1, 0, '');
INSERT INTO `ims_yunphp_shop_express` VALUES (42, 0, '', '', '', '', '金大物流', 'jindawuliu', 1, 0, '');
INSERT INTO `ims_yunphp_shop_express` VALUES (43, 0, '', '', '', '', '嘉里大通', 'jialidatong', 1, 0, '');
INSERT INTO `ims_yunphp_shop_express` VALUES (44, 0, '', '', '', '', '晋越快递', 'jykd', 1, 0, '');
INSERT INTO `ims_yunphp_shop_express` VALUES (45, 0, '', '', '', '', '快捷速递', 'kuaijiesudi', 1, 0, '');
INSERT INTO `ims_yunphp_shop_express` VALUES (46, 0, '', '', '', '', '联邦快递（国内）', 'lianb', 1, 0, '');
INSERT INTO `ims_yunphp_shop_express` VALUES (47, 0, '', '', '', '', '联昊通物流', 'lianhaowuliu', 1, 0, '');
INSERT INTO `ims_yunphp_shop_express` VALUES (48, 0, '', '', '', '', '龙邦物流', 'longbanwuliu', 1, 0, '');
INSERT INTO `ims_yunphp_shop_express` VALUES (49, 0, '', '', '', '', '立即送', 'lijisong', 1, 0, '');
INSERT INTO `ims_yunphp_shop_express` VALUES (50, 0, '', '', '', '', '乐捷递', 'lejiedi', 1, 0, '');
INSERT INTO `ims_yunphp_shop_express` VALUES (51, 0, '', '', '', '', '民航快递', 'minghangkuaidi', 1, 0, '');
INSERT INTO `ims_yunphp_shop_express` VALUES (52, 0, '', '', '', '', '美国快递', 'meiguokuaidi', 1, 0, '');
INSERT INTO `ims_yunphp_shop_express` VALUES (53, 0, '', '', '', '', '门对门', 'menduimen', 1, 0, '');
INSERT INTO `ims_yunphp_shop_express` VALUES (54, 0, '', '', '', '', 'OCS', 'ocs', 1, 0, '');
INSERT INTO `ims_yunphp_shop_express` VALUES (55, 0, '', '', '', '', '配思货运', 'peisihuoyunkuaidi', 1, 0, '');
INSERT INTO `ims_yunphp_shop_express` VALUES (56, 0, '', '', '', '', '全晨快递', 'quanchenkuaidi', 1, 0, '');
INSERT INTO `ims_yunphp_shop_express` VALUES (57, 0, '', '', '', '', '全际通物流', 'quanjitong', 1, 0, '');
INSERT INTO `ims_yunphp_shop_express` VALUES (58, 0, '', '', '', '', '全日通快递', 'quanritongkuaidi', 1, 0, '');
INSERT INTO `ims_yunphp_shop_express` VALUES (59, 0, '', '', '', '', '全一快递', 'quanyikuaidi', 1, 0, '');
INSERT INTO `ims_yunphp_shop_express` VALUES (60, 0, '', '', '', '', '如风达', 'rufengda', 1, 0, '');
INSERT INTO `ims_yunphp_shop_express` VALUES (61, 0, '', '', '', '', '三态速递', 'santaisudi', 1, 0, '');
INSERT INTO `ims_yunphp_shop_express` VALUES (62, 0, '', '', '', '', '盛辉物流', 'shenghuiwuliu', 1, 0, '');
INSERT INTO `ims_yunphp_shop_express` VALUES (63, 0, '', '', '', '', '速尔物流', 'sue', 1, 0, '');
INSERT INTO `ims_yunphp_shop_express` VALUES (64, 0, '', '', '', '', '盛丰物流', 'shengfeng', 1, 0, '');
INSERT INTO `ims_yunphp_shop_express` VALUES (65, 0, '', '', '', '', '赛澳递', 'saiaodi', 1, 0, '');
INSERT INTO `ims_yunphp_shop_express` VALUES (66, 0, '', '', '', '', '天地华宇', 'tiandihuayu', 1, 0, '');
INSERT INTO `ims_yunphp_shop_express` VALUES (67, 0, '', '', '', '', 'tnt', 'tnt', 1, 0, '');
INSERT INTO `ims_yunphp_shop_express` VALUES (68, 0, '', '', '', '', 'ups', 'ups', 1, 0, '');
INSERT INTO `ims_yunphp_shop_express` VALUES (69, 0, '', '', '', '', '万家物流', 'wanjiawuliu', 1, 0, '');
INSERT INTO `ims_yunphp_shop_express` VALUES (70, 0, '', '', '', '', '文捷航空速递', 'wenjiesudi', 1, 0, '');
INSERT INTO `ims_yunphp_shop_express` VALUES (71, 0, '', '', '', '', '伍圆', 'wuyuan', 1, 0, '');
INSERT INTO `ims_yunphp_shop_express` VALUES (72, 0, '', '', '', '', '万象物流', 'wxwl', 1, 0, '');
INSERT INTO `ims_yunphp_shop_express` VALUES (73, 0, '', '', '', '', '新邦物流', 'xinbangwuliu', 1, 0, '');
INSERT INTO `ims_yunphp_shop_express` VALUES (74, 0, '', '', '', '', '信丰物流', 'xinfengwuliu', 1, 0, '');
INSERT INTO `ims_yunphp_shop_express` VALUES (75, 0, '', '', '', '', '亚风速递', 'yafengsudi', 1, 0, '');
INSERT INTO `ims_yunphp_shop_express` VALUES (76, 0, '', '', '', '', '一邦速递', 'yibangwuliu', 1, 0, '');
INSERT INTO `ims_yunphp_shop_express` VALUES (77, 0, '', '', '', '', '优速物流', 'youshuwuliu', 1, 0, '');
INSERT INTO `ims_yunphp_shop_express` VALUES (78, 0, '', '', '', '', '邮政包裹挂号信', 'youzhengguonei', 1, 0, '');
INSERT INTO `ims_yunphp_shop_express` VALUES (79, 0, '', '', '', '', '邮政国际包裹挂号信', 'youzhengguoji', 1, 0, '');
INSERT INTO `ims_yunphp_shop_express` VALUES (80, 0, '', '', '', '', '远成物流', 'yuanchengwuliu', 1, 0, '');
INSERT INTO `ims_yunphp_shop_express` VALUES (81, 0, '', '', '', '', '源伟丰快递', 'yuanweifeng', 1, 0, '');
INSERT INTO `ims_yunphp_shop_express` VALUES (82, 0, '', '', '', '', '元智捷诚快递', 'yuanzhijiecheng', 1, 0, '');
INSERT INTO `ims_yunphp_shop_express` VALUES (83, 0, '', '', '', '', '运通快递', 'yuntongkuaidi', 1, 0, '');
INSERT INTO `ims_yunphp_shop_express` VALUES (84, 0, '', '', '', '', '越丰物流', 'yuefengwuliu', 1, 0, '');
INSERT INTO `ims_yunphp_shop_express` VALUES (85, 0, '', '', '', '', '源安达', 'yad', 1, 0, '');
INSERT INTO `ims_yunphp_shop_express` VALUES (86, 0, '', '', '', '', '银捷速递', 'yinjiesudi', 1, 0, '');
INSERT INTO `ims_yunphp_shop_express` VALUES (87, 0, '', '', '', '', '中铁快运', 'zhongtiekuaiyun', 1, 0, '');
INSERT INTO `ims_yunphp_shop_express` VALUES (88, 0, '', '', '', '', '中邮物流', 'zhongyouwuliu', 1, 0, '');
INSERT INTO `ims_yunphp_shop_express` VALUES (89, 0, '', '', '', '', '忠信达', 'zhongxinda', 1, 0, '');
INSERT INTO `ims_yunphp_shop_express` VALUES (90, 0, '', '', '', '', '芝麻开门', 'zhimakaimen', 1, 0, '');
INSERT INTO `ims_yunphp_shop_express` VALUES (91, 0, '', '', '', '', '安能物流', 'annengwuliu', 1, 0, '');

-- ----------------------------
-- Table structure for ims_yunphp_shop_express_cache
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_express_cache`;
CREATE TABLE `ims_yunphp_shop_express_cache`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `expresssn` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `express` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `lasttime` int(11) NOT NULL,
  `datas` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_expresssn`(`expresssn`) USING BTREE,
  INDEX `idx_express`(`express`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_feedback
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_feedback`;
CREATE TABLE `ims_yunphp_shop_feedback`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `openid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0',
  `type` tinyint(1) NULL DEFAULT 1 COMMENT '1为维权，2为投诉',
  `status` tinyint(1) NULL DEFAULT 0 COMMENT '状态 0 未解决，1用户同意，2用户拒绝',
  `feedbackid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '投诉单号',
  `transid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '订单号',
  `reason` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '理由',
  `solution` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '期待解决方案',
  `remark` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  `createtime` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_feedbackid`(`feedbackid`) USING BTREE,
  INDEX `idx_createtime`(`createtime`) USING BTREE,
  INDEX `idx_transid`(`transid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_form
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_form`;
CREATE TABLE `ims_yunphp_shop_form`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `displayorder` int(11) NULL DEFAULT 0,
  `isrequire` tinyint(3) NULL DEFAULT 0,
  `key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `values` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `cate` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_form_category
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_form_category`;
CREATE TABLE `ims_yunphp_shop_form_category`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_fullback_goods
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_fullback_goods`;
CREATE TABLE `ims_yunphp_shop_fullback_goods`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT 0,
  `type` tinyint(3) NOT NULL DEFAULT 0,
  `goodsid` int(11) NOT NULL DEFAULT 0,
  `titles` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `thumb` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `marketprice` decimal(10, 2) NOT NULL DEFAULT 0.00,
  `minallfullbackallprice` decimal(10, 2) NOT NULL DEFAULT 0.00,
  `maxallfullbackallprice` decimal(10, 2) NOT NULL,
  `minallfullbackallratio` tinyint(3) NOT NULL DEFAULT 0,
  `maxallfullbackallratio` tinyint(3) NOT NULL,
  `day` int(11) NOT NULL DEFAULT 0,
  `fullbackprice` decimal(10, 2) NOT NULL DEFAULT 0.00,
  `fullbackratio` tinyint(3) NOT NULL DEFAULT 0,
  `status` tinyint(3) NOT NULL DEFAULT 0,
  `displayorder` int(11) NOT NULL DEFAULT 0,
  `hasoption` tinyint(3) NOT NULL DEFAULT 0,
  `optionid` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `startday` int(11) NOT NULL DEFAULT 0,
  `refund` tinyint(3) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_fullback_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_fullback_log`;
CREATE TABLE `ims_yunphp_shop_fullback_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `openid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `orderid` int(11) NOT NULL,
  `price` decimal(10, 2) NOT NULL,
  `priceevery` decimal(10, 2) NOT NULL,
  `day` int(10) NOT NULL,
  `fullbackday` int(10) NOT NULL,
  `createtime` int(10) NOT NULL,
  `fullbacktime` int(10) NOT NULL,
  `isfullback` tinyint(3) NOT NULL DEFAULT 0,
  `goodsid` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_funbar
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_funbar`;
CREATE TABLE `ims_yunphp_shop_funbar`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT 0,
  `datas` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `uniacid` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_gift
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_gift`;
CREATE TABLE `ims_yunphp_shop_gift`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT 0,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `thumb` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `activity` tinyint(3) NOT NULL DEFAULT 1,
  `orderprice` decimal(10, 2) NOT NULL DEFAULT 0.00,
  `goodsid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `giftgoodsid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `starttime` int(11) NOT NULL DEFAULT 0,
  `endtime` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(3) NOT NULL DEFAULT 0,
  `displayorder` int(11) NOT NULL DEFAULT 0,
  `share_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `share_icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `share_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_globonus_bill
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_globonus_bill`;
CREATE TABLE `ims_yunphp_shop_globonus_bill`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `billno` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `paytype` int(11) NULL DEFAULT 0,
  `year` int(11) NULL DEFAULT 0,
  `month` int(11) NULL DEFAULT 0,
  `week` int(11) NULL DEFAULT 0,
  `ordercount` int(11) NULL DEFAULT 0,
  `ordermoney` decimal(10, 2) NULL DEFAULT 0.00,
  `bonusmoney` decimal(10, 2) NULL DEFAULT 0.00,
  `bonusmoney_send` decimal(10, 2) NULL DEFAULT 0.00,
  `bonusmoney_pay` decimal(10, 2) NULL DEFAULT 0.00,
  `paytime` int(11) NULL DEFAULT 0,
  `partnercount` int(11) NULL DEFAULT 0,
  `createtime` int(11) NULL DEFAULT 0,
  `status` tinyint(3) NULL DEFAULT 0,
  `starttime` int(11) NULL DEFAULT 0,
  `endtime` int(11) NULL DEFAULT 0,
  `confirmtime` int(11) NULL DEFAULT 0,
  `bonusordermoney` decimal(10, 2) NULL DEFAULT 0.00,
  `bonusrate` decimal(10, 2) NULL DEFAULT 0.00,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_paytype`(`paytype`) USING BTREE,
  INDEX `idx_createtime`(`createtime`) USING BTREE,
  INDEX `idx_paytime`(`paytime`) USING BTREE,
  INDEX `idx_status`(`status`) USING BTREE,
  INDEX `idx_month`(`month`) USING BTREE,
  INDEX `idx_week`(`week`) USING BTREE,
  INDEX `idx_year`(`year`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_globonus_billo
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_globonus_billo`;
CREATE TABLE `ims_yunphp_shop_globonus_billo`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `billid` int(11) NULL DEFAULT 0,
  `orderid` int(11) NULL DEFAULT 0,
  `ordermoney` decimal(10, 2) NULL DEFAULT 0.00,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_billid`(`billid`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for ims_yunphp_shop_globonus_billp
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_globonus_billp`;
CREATE TABLE `ims_yunphp_shop_globonus_billp`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `billid` int(11) NULL DEFAULT 0,
  `openid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `payno` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `paytype` tinyint(3) NULL DEFAULT 0,
  `bonus` decimal(10, 2) NULL DEFAULT 0.00,
  `money` decimal(10, 2) NULL DEFAULT 0.00,
  `realmoney` decimal(10, 2) NULL DEFAULT 0.00,
  `paymoney` decimal(10, 2) NULL DEFAULT 0.00,
  `charge` decimal(10, 2) NULL DEFAULT 0.00,
  `chargemoney` decimal(10, 2) NULL DEFAULT 0.00,
  `status` tinyint(3) NULL DEFAULT 0,
  `reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `paytime` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_billid`(`billid`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_globonus_level
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_globonus_level`;
CREATE TABLE `ims_yunphp_shop_globonus_level`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `levelname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `bonus` decimal(10, 4) NULL DEFAULT 0.0000,
  `ordermoney` decimal(10, 2) NULL DEFAULT 0.00,
  `ordercount` int(11) NULL DEFAULT 0,
  `commissionmoney` decimal(10, 2) NULL DEFAULT 0.00,
  `bonusmoney` decimal(10, 2) NULL DEFAULT 0.00,
  `downcount` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_goods
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_goods`;
CREATE TABLE `ims_yunphp_shop_goods`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `pcate` int(11) NULL DEFAULT 0,
  `ccate` int(11) NULL DEFAULT 0,
  `type` tinyint(1) NULL DEFAULT 1 COMMENT '1为实体，2为虚拟',
  `status` tinyint(1) NULL DEFAULT 1,
  `displayorder` int(11) NULL DEFAULT 0,
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `thumb` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `unit` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `description` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `goodssn` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `productsn` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `productprice` decimal(10, 2) NULL DEFAULT 0.00,
  `marketprice` decimal(10, 2) NULL DEFAULT 0.00,
  `costprice` decimal(10, 2) NULL DEFAULT 0.00,
  `originalprice` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '原价',
  `total` int(10) NULL DEFAULT 0,
  `totalcnf` int(11) NULL DEFAULT 0 COMMENT '0 拍下减库存 1 付款减库存 2 永久不减',
  `sales` int(11) NULL DEFAULT 0,
  `salesreal` int(11) NULL DEFAULT 0,
  `spec` varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `createtime` int(11) NULL DEFAULT 0,
  `weight` decimal(10, 2) NULL DEFAULT 0.00,
  `credit` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `maxbuy` int(11) NULL DEFAULT 0,
  `usermaxbuy` int(11) NULL DEFAULT 0,
  `hasoption` int(11) NULL DEFAULT 0,
  `dispatch` int(11) NULL DEFAULT 0,
  `thumb_url` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `isnew` tinyint(1) NULL DEFAULT 0,
  `ishot` tinyint(1) NULL DEFAULT 0,
  `isdiscount` tinyint(1) NULL DEFAULT 0,
  `isrecommand` tinyint(1) NULL DEFAULT 0,
  `issendfree` tinyint(1) NULL DEFAULT 0,
  `istime` tinyint(1) NULL DEFAULT 0,
  `iscomment` tinyint(1) NULL DEFAULT 0,
  `timestart` int(11) NULL DEFAULT 0,
  `timeend` int(11) NULL DEFAULT 0,
  `viewcount` int(11) NULL DEFAULT 0,
  `deleted` tinyint(3) NULL DEFAULT 0,
  `hascommission` tinyint(3) NULL DEFAULT 0,
  `commission1_rate` decimal(10, 2) NULL DEFAULT 0.00,
  `commission1_pay` decimal(10, 2) NULL DEFAULT 0.00,
  `commission2_rate` decimal(10, 2) NULL DEFAULT 0.00,
  `commission2_pay` decimal(10, 2) NULL DEFAULT 0.00,
  `commission3_rate` decimal(10, 2) NULL DEFAULT 0.00,
  `commission3_pay` decimal(10, 2) NULL DEFAULT 0.00,
  `score` decimal(10, 2) NULL DEFAULT 0.00,
  `taobaoid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `taotaoid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `taobaourl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `updatetime` int(11) NULL DEFAULT 0,
  `share_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `share_icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cash` tinyint(3) NULL DEFAULT 0,
  `commission_thumb` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `isnodiscount` tinyint(3) NULL DEFAULT 0,
  `showlevels` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `buylevels` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `showgroups` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `buygroups` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `isverify` tinyint(3) NULL DEFAULT 0,
  `storeids` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `noticeopenid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `tcate` int(11) NULL DEFAULT 0,
  `noticetype` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `needfollow` tinyint(3) NULL DEFAULT 0,
  `followtip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `followurl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `deduct` decimal(10, 2) NULL DEFAULT 0.00,
  `virtual` int(11) NULL DEFAULT 0,
  `ccates` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `discounts` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `nocommission` tinyint(3) NULL DEFAULT 0,
  `hidecommission` tinyint(3) NULL DEFAULT 0,
  `saleupdate` tinyint(3) NULL DEFAULT 0,
  `pcates` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `tcates` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `cates` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `artid` int(11) NULL DEFAULT 0,
  `detail_logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `detail_shopname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `detail_btntext1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `detail_btnurl1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `detail_btntext2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `detail_btnurl2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `detail_totaltitle` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `saleupdate42392` tinyint(3) NULL DEFAULT 0,
  `deduct2` decimal(10, 2) NULL DEFAULT 0.00,
  `ednum` int(11) NULL DEFAULT 0,
  `edmoney` decimal(10, 2) NULL DEFAULT 0.00,
  `edareas` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `diyformtype` tinyint(1) NULL DEFAULT 0,
  `diyformid` int(11) NULL DEFAULT 0,
  `diymode` tinyint(1) NULL DEFAULT 0,
  `dispatchtype` tinyint(1) NULL DEFAULT 0,
  `dispatchid` int(11) NULL DEFAULT 0,
  `dispatchprice` decimal(10, 2) NULL DEFAULT 0.00,
  `manydeduct` tinyint(1) NULL DEFAULT 0,
  `shorttitle` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `isdiscount_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `isdiscount_time` int(11) NULL DEFAULT 0,
  `isdiscount_discounts` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `commission` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `saleupdate37975` tinyint(3) NULL DEFAULT 0,
  `shopid` int(11) NULL DEFAULT 0,
  `allcates` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `minbuy` int(11) NULL DEFAULT 0,
  `invoice` tinyint(3) NULL DEFAULT 0,
  `repair` tinyint(3) NULL DEFAULT 0,
  `seven` tinyint(3) NULL DEFAULT 0,
  `money` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `minprice` decimal(10, 2) NULL DEFAULT 0.00,
  `maxprice` decimal(10, 2) NULL DEFAULT 0.00,
  `province` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `city` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `buyshow` tinyint(1) NULL DEFAULT 0,
  `buycontent` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `saleupdate51117` tinyint(3) NULL DEFAULT 0,
  `virtualsend` tinyint(1) NULL DEFAULT 0,
  `virtualsendcontent` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `verifytype` tinyint(1) NULL DEFAULT 0,
  `diyfields` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `diysaveid` int(11) NULL DEFAULT 0,
  `diysave` tinyint(1) NULL DEFAULT 0,
  `quality` tinyint(3) NULL DEFAULT 0,
  `groupstype` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `showtotal` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `subtitle` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `minpriceupdated` tinyint(1) NULL DEFAULT 0,
  `sharebtn` tinyint(1) NOT NULL DEFAULT 0,
  `catesinit3` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `showtotaladd` tinyint(1) NULL DEFAULT 0,
  `merchid` int(11) NULL DEFAULT 0,
  `checked` tinyint(3) NULL DEFAULT 0,
  `thumb_first` tinyint(3) NULL DEFAULT 0,
  `merchsale` tinyint(1) NULL DEFAULT 0,
  `keywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `catch_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `catch_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `catch_source` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `saleupdate40170` tinyint(3) NULL DEFAULT 0,
  `saleupdate35843` tinyint(3) NULL DEFAULT 0,
  `labelname` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `autoreceive` int(11) NULL DEFAULT 0,
  `cannotrefund` tinyint(3) NULL DEFAULT 0,
  `saleupdate33219` tinyint(3) NULL DEFAULT 0,
  `bargain` int(11) NULL DEFAULT 0,
  `buyagain` decimal(10, 2) NULL DEFAULT 0.00,
  `buyagain_islong` tinyint(1) NULL DEFAULT 0,
  `buyagain_condition` tinyint(1) NULL DEFAULT 0,
  `buyagain_sale` tinyint(1) NULL DEFAULT 0,
  `buyagain_commission` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `saleupdate32484` tinyint(3) NULL DEFAULT 0,
  `saleupdate36586` tinyint(3) NULL DEFAULT 0,
  `diypage` int(11) NULL DEFAULT NULL,
  `cashier` tinyint(1) NULL DEFAULT 0,
  `saleupdate53481` tinyint(3) NULL DEFAULT 0,
  `saleupdate30424` tinyint(3) NULL DEFAULT 0,
  `isiot` tinyint(3) NOT NULL DEFAULT 0,
  `isendtime` tinyint(3) NOT NULL DEFAULT 0,
  `usetime` int(11) NOT NULL DEFAULT 0,
  `endtime` int(11) NOT NULL DEFAULT 0,
  `merchdisplayorder` int(11) NOT NULL DEFAULT 0,
  `exchange_stock` int(11) NULL DEFAULT 0,
  `exchange_postage` decimal(10, 2) NOT NULL DEFAULT 0.00,
  `ispresell` tinyint(3) NOT NULL DEFAULT 0,
  `presellprice` decimal(10, 2) NOT NULL DEFAULT 0.00,
  `presellover` tinyint(3) NOT NULL DEFAULT 0,
  `presellovertime` int(11) NOT NULL,
  `presellstart` tinyint(3) NOT NULL DEFAULT 0,
  `preselltimestart` int(11) NOT NULL DEFAULT 0,
  `presellend` tinyint(3) NOT NULL DEFAULT 0,
  `preselltimeend` int(11) NOT NULL DEFAULT 0,
  `presellsendtype` tinyint(3) NOT NULL DEFAULT 0,
  `presellsendstatrttime` int(11) NOT NULL DEFAULT 0,
  `presellsendtime` int(11) NOT NULL DEFAULT 0,
  `edareas_code` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `unite_total` tinyint(3) NOT NULL DEFAULT 0,
  `buyagain_price` decimal(10, 2) NULL DEFAULT 0.00,
  `threen` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `intervalfloor` tinyint(1) NULL DEFAULT 0,
  `intervalprice` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `isfullback` tinyint(3) NOT NULL DEFAULT 0,
  `isstatustime` tinyint(3) NOT NULL DEFAULT 0,
  `statustimestart` int(10) NOT NULL DEFAULT 0,
  `statustimeend` int(10) NOT NULL DEFAULT 0,
  `nosearch` tinyint(1) NOT NULL DEFAULT 0,
  `area` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `tel` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `atimestart` int(11) NULL DEFAULT 0,
  `atimeend` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_pcate`(`pcate`) USING BTREE,
  INDEX `idx_ccate`(`ccate`) USING BTREE,
  INDEX `idx_isnew`(`isnew`) USING BTREE,
  INDEX `idx_ishot`(`ishot`) USING BTREE,
  INDEX `idx_isdiscount`(`isdiscount`) USING BTREE,
  INDEX `idx_isrecommand`(`isrecommand`) USING BTREE,
  INDEX `idx_iscomment`(`iscomment`) USING BTREE,
  INDEX `idx_issendfree`(`issendfree`) USING BTREE,
  INDEX `idx_istime`(`istime`) USING BTREE,
  INDEX `idx_deleted`(`deleted`) USING BTREE,
  INDEX `idx_tcate`(`tcate`) USING BTREE,
  INDEX `idx_scate`(`tcate`) USING BTREE,
  INDEX `idx_merchid`(`merchid`) USING BTREE,
  INDEX `idx_checked`(`checked`) USING BTREE,
  FULLTEXT INDEX `idx_buylevels`(`buylevels`),
  FULLTEXT INDEX `idx_showgroups`(`showgroups`),
  FULLTEXT INDEX `idx_buygroups`(`buygroups`)
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_goods_comment
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_goods_comment`;
CREATE TABLE `ims_yunphp_shop_goods_comment`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `goodsid` int(10) NULL DEFAULT 0,
  `openid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `nickname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `headimgurl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `createtime` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_goodsid`(`goodsid`) USING BTREE,
  INDEX `idx_openid`(`openid`) USING BTREE,
  INDEX `idx_createtime`(`createtime`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_goods_group
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_goods_group`;
CREATE TABLE `ims_yunphp_shop_goods_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT 0,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `goodsids` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `enabled` tinyint(1) NOT NULL DEFAULT 0,
  `merchid` int(11) NOT NULL DEFAULT 0,
  `type` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_enabled`(`enabled`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_goods_label
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_goods_label`;
CREATE TABLE `ims_yunphp_shop_goods_label`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT 0,
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `labelname` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` tinyint(3) NOT NULL DEFAULT 0,
  `displayorder` int(11) NOT NULL DEFAULT 0,
  `type` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_goods_labelstyle
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_goods_labelstyle`;
CREATE TABLE `ims_yunphp_shop_goods_labelstyle`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `style` int(3) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for ims_yunphp_shop_goods_option
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_goods_option`;
CREATE TABLE `ims_yunphp_shop_goods_option`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `goodsid` int(10) NULL DEFAULT 0,
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `thumb` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `productprice` decimal(10, 2) NULL DEFAULT 0.00,
  `marketprice` decimal(10, 2) NULL DEFAULT 0.00,
  `costprice` decimal(10, 2) NULL DEFAULT 0.00,
  `stock` int(11) NULL DEFAULT 0,
  `weight` decimal(10, 2) NULL DEFAULT 0.00,
  `displayorder` int(11) NULL DEFAULT 0,
  `specs` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `skuId` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `goodssn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `productsn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `virtual` int(11) NULL DEFAULT 0,
  `exchange_stock` int(11) NULL DEFAULT 0,
  `exchange_postage` decimal(10, 2) NOT NULL DEFAULT 0.00,
  `presellprice` decimal(10, 2) NOT NULL DEFAULT 0.00,
  `day` int(3) NOT NULL,
  `allfullbackprice` decimal(10, 2) NOT NULL,
  `fullbackprice` decimal(10, 2) NOT NULL,
  `allfullbackratio` tinyint(3) NOT NULL,
  `fullbackratio` tinyint(3) NOT NULL,
  `isfullback` tinyint(3) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_goodsid`(`goodsid`) USING BTREE,
  INDEX `idx_displayorder`(`displayorder`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_goods_param
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_goods_param`;
CREATE TABLE `ims_yunphp_shop_goods_param`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `goodsid` int(10) NULL DEFAULT 0,
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `value` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `displayorder` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_goodsid`(`goodsid`) USING BTREE,
  INDEX `idx_displayorder`(`displayorder`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_goods_spec
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_goods_spec`;
CREATE TABLE `ims_yunphp_shop_goods_spec`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `goodsid` int(11) NULL DEFAULT 0,
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `description` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `displaytype` tinyint(3) NULL DEFAULT 0,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `displayorder` int(11) NULL DEFAULT 0,
  `propId` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_goodsid`(`goodsid`) USING BTREE,
  INDEX `idx_displayorder`(`displayorder`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_goods_spec_item
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_goods_spec_item`;
CREATE TABLE `ims_yunphp_shop_goods_spec_item`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `specid` int(11) NULL DEFAULT 0,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `thumb` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `show` int(11) NULL DEFAULT 0,
  `displayorder` int(11) NULL DEFAULT 0,
  `valueId` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `virtual` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_specid`(`specid`) USING BTREE,
  INDEX `idx_show`(`show`) USING BTREE,
  INDEX `idx_displayorder`(`displayorder`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_goodscode_good
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_goodscode_good`;
CREATE TABLE `ims_yunphp_shop_goodscode_good`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `goodsid` int(11) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `thumb` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `qrcode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` tinyint(3) NOT NULL,
  `displayorder` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_groups_adv
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_groups_adv`;
CREATE TABLE `ims_yunphp_shop_groups_adv`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `advname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `link` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `thumb` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `displayorder` int(11) NULL DEFAULT 0,
  `enabled` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_enabled`(`enabled`) USING BTREE,
  INDEX `idx_displayorder`(`displayorder`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_groups_category
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_groups_category`;
CREATE TABLE `ims_yunphp_shop_groups_category`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `thumb` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `displayorder` tinyint(3) UNSIGNED NULL DEFAULT 0,
  `enabled` tinyint(1) NULL DEFAULT 1,
  `advimg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `advurl` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `isrecommand` tinyint(3) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_displayorder`(`displayorder`) USING BTREE,
  INDEX `idx_enabled`(`enabled`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_groups_goods
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_groups_goods`;
CREATE TABLE `ims_yunphp_shop_groups_goods`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `displayorder` int(11) UNSIGNED NULL DEFAULT 0,
  `uniacid` int(11) NULL DEFAULT 0,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `category` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `stock` int(11) NOT NULL DEFAULT 0,
  `price` decimal(10, 2) NULL DEFAULT 0.00,
  `groupsprice` decimal(10, 2) NULL DEFAULT 0.00,
  `singleprice` decimal(10, 2) NULL DEFAULT 0.00,
  `goodsnum` int(11) NOT NULL DEFAULT 1,
  `units` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '件',
  `freight` decimal(10, 2) NULL DEFAULT 0.00,
  `endtime` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `groupnum` int(10) NOT NULL DEFAULT 0,
  `sales` int(10) NOT NULL DEFAULT 0,
  `thumb` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `description` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `createtime` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `status` tinyint(3) NOT NULL DEFAULT 0,
  `ishot` tinyint(3) NOT NULL DEFAULT 0,
  `deleted` tinyint(3) NOT NULL DEFAULT 0,
  `goodsid` int(11) NOT NULL DEFAULT 0,
  `followneed` tinyint(2) NOT NULL DEFAULT 0,
  `followtext` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `share_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `share_icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `share_desc` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `goodssn` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `productsn` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `showstock` tinyint(2) NOT NULL,
  `purchaselimit` int(11) NOT NULL DEFAULT 0,
  `single` tinyint(2) NOT NULL DEFAULT 0,
  `dispatchtype` tinyint(2) NOT NULL,
  `dispatchid` int(11) NOT NULL,
  `isindex` tinyint(3) NOT NULL DEFAULT 0,
  `followurl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `deduct` decimal(10, 2) NOT NULL DEFAULT 0.00,
  `rights` tinyint(2) NOT NULL DEFAULT 1,
  `thumb_url` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `gid` int(11) NULL DEFAULT 0,
  `discount` tinyint(3) NULL DEFAULT 0,
  `headstype` tinyint(3) NULL DEFAULT NULL,
  `headsmoney` decimal(10, 2) NULL DEFAULT 0.00,
  `headsdiscount` int(11) NULL DEFAULT 0,
  `isdiscount` tinyint(3) NULL DEFAULT 0,
  `isverify` tinyint(3) NULL DEFAULT 0,
  `verifytype` tinyint(3) NULL DEFAULT 0,
  `verifynum` int(11) NULL DEFAULT 0,
  `storeids` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `merchid` int(11) NULL DEFAULT 0,
  `shorttitle` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `teamnum` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_type`(`category`) USING BTREE,
  INDEX `idx_createtime`(`createtime`) USING BTREE,
  INDEX `idx_status`(`status`) USING BTREE,
  INDEX `idx_istop`(`ishot`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_groups_goods_atlas
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_groups_goods_atlas`;
CREATE TABLE `ims_yunphp_shop_groups_goods_atlas`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `g_id` int(11) NOT NULL,
  `thumb` varchar(145) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_groups_order
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_groups_order`;
CREATE TABLE `ims_yunphp_shop_groups_order`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT 0,
  `openid` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `orderno` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `groupnum` int(11) NOT NULL,
  `paytime` int(11) NOT NULL,
  `price` decimal(11, 2) NULL DEFAULT 0.00,
  `freight` decimal(11, 2) NULL DEFAULT 0.00,
  `status` int(9) NOT NULL,
  `pay_type` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `goodid` int(11) NOT NULL,
  `teamid` int(11) NOT NULL,
  `is_team` int(2) NOT NULL,
  `heads` int(11) NULL DEFAULT 0,
  `starttime` int(11) NOT NULL,
  `endtime` int(45) NOT NULL,
  `createtime` int(11) NOT NULL,
  `success` int(2) NOT NULL DEFAULT 0,
  `delete` int(2) NOT NULL DEFAULT 0,
  `credit` int(11) NULL DEFAULT 0,
  `creditmoney` decimal(11, 2) NULL DEFAULT 0.00,
  `dispatchid` int(11) NULL DEFAULT NULL,
  `addressid` int(11) NOT NULL DEFAULT 0,
  `address` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `discount` decimal(10, 2) NULL DEFAULT 0.00,
  `canceltime` int(11) NOT NULL DEFAULT 0,
  `finishtime` int(11) NOT NULL DEFAULT 0,
  `refundid` int(11) NOT NULL DEFAULT 0,
  `refundstate` tinyint(2) NOT NULL DEFAULT 0,
  `refundtime` int(11) NOT NULL DEFAULT 0,
  `express` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `expresscom` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `expresssn` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sendtime` int(45) NULL DEFAULT 0,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remarkclose` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `remarksend` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `message` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `deleted` int(2) NOT NULL DEFAULT 0,
  `realname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mobile` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `isverify` tinyint(3) NULL DEFAULT 0,
  `verifytype` tinyint(3) NULL DEFAULT 0,
  `verifycode` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0',
  `verifynum` int(11) NULL DEFAULT 0,
  `printstate` int(11) NOT NULL DEFAULT 0,
  `printstate2` int(11) NOT NULL DEFAULT 0,
  `apppay` tinyint(3) NOT NULL DEFAULT 0,
  `isborrow` tinyint(1) NULL DEFAULT 0,
  `borrowopenid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_groups_order_refund
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_groups_order_refund`;
CREATE TABLE `ims_yunphp_shop_groups_order_refund`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT 0,
  `openid` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `orderid` int(11) NOT NULL DEFAULT 0,
  `refundno` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `refundstatus` tinyint(3) NOT NULL DEFAULT 0,
  `refundaddressid` int(11) NOT NULL DEFAULT 0,
  `refundaddress` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `images` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `applytime` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `applycredit` int(11) NOT NULL DEFAULT 0,
  `applyprice` decimal(11, 2) NOT NULL DEFAULT 0.00,
  `reply` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `refundtype` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `rtype` int(3) NOT NULL DEFAULT 0,
  `refundtime` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `endtime` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `message` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `operatetime` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `realcredit` int(11) NOT NULL,
  `realmoney` decimal(11, 2) NOT NULL,
  `express` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `expresscom` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `expresssn` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sendtime` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `returntime` int(11) NOT NULL DEFAULT 0,
  `rexpress` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `rexpresscom` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `rexpresssn` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_groups_paylog
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_groups_paylog`;
CREATE TABLE `ims_yunphp_shop_groups_paylog`  (
  `plid` bigint(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `uniacid` int(11) NOT NULL,
  `acid` int(10) UNSIGNED NOT NULL,
  `openid` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tid` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `credit` int(10) NOT NULL DEFAULT 0,
  `creditmoney` decimal(10, 2) NOT NULL,
  `fee` decimal(10, 2) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `module` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tag` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_usecard` tinyint(3) UNSIGNED NOT NULL,
  `card_type` tinyint(3) UNSIGNED NOT NULL,
  `card_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `card_fee` decimal(10, 2) UNSIGNED NOT NULL,
  `encrypt_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `uniontid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`plid`) USING BTREE,
  INDEX `idx_openid`(`openid`) USING BTREE,
  INDEX `idx_tid`(`tid`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `uniontid`(`uniontid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_groups_set
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_groups_set`;
CREATE TABLE `ims_yunphp_shop_groups_set`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `groups` int(2) NOT NULL DEFAULT 0,
  `followurl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `groupsurl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `share_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `share_icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `share_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `groups_description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `description` int(2) NOT NULL DEFAULT 0,
  `followqrcode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `share_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `creditdeduct` tinyint(2) NOT NULL DEFAULT 0,
  `groupsdeduct` tinyint(2) NOT NULL DEFAULT 0,
  `credit` int(11) NOT NULL DEFAULT 1,
  `groupsmoney` decimal(11, 2) NOT NULL DEFAULT 0.00,
  `refund` int(11) NOT NULL DEFAULT 0,
  `refundday` int(11) NOT NULL DEFAULT 0,
  `goodsid` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `rules` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `receive` int(11) NULL DEFAULT 0,
  `discount` tinyint(3) NULL DEFAULT 0,
  `headstype` tinyint(3) NULL DEFAULT 0,
  `headsmoney` decimal(10, 2) NULL DEFAULT 0.00,
  `headsdiscount` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_groups_verify
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_groups_verify`;
CREATE TABLE `ims_yunphp_shop_groups_verify`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `openid` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0',
  `orderid` int(11) NULL DEFAULT 0,
  `verifycode` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `storeid` int(11) NULL DEFAULT 0,
  `verifier` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0',
  `isverify` tinyint(3) NULL DEFAULT 0,
  `verifytime` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_info_adv
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_info_adv`;
CREATE TABLE `ims_yunphp_shop_info_adv`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `advname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `link` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `thumb` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `displayorder` int(11) NULL DEFAULT 0,
  `enabled` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_enabled`(`enabled`) USING BTREE,
  INDEX `idx_displayorder`(`displayorder`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_info_board
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_info_board`;
CREATE TABLE `ims_yunphp_shop_info_board`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `cid` int(11) NULL DEFAULT 0,
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `displayorder` int(11) NULL DEFAULT 0,
  `enabled` int(11) NULL DEFAULT 0,
  `showgroups` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `showlevels` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `postgroups` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `postlevels` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `showagentlevels` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `postagentlevels` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `postcredit` int(11) NULL DEFAULT 0,
  `replycredit` int(11) NULL DEFAULT 0,
  `bestcredit` int(11) NULL DEFAULT 0,
  `bestboardcredit` int(11) NULL DEFAULT 0,
  `notagent` tinyint(3) NULL DEFAULT 0,
  `notagentpost` tinyint(3) NULL DEFAULT 0,
  `topcredit` int(11) NULL DEFAULT 0,
  `topboardcredit` int(11) NULL DEFAULT 0,
  `status` tinyint(3) NULL DEFAULT 0,
  `noimage` tinyint(3) NULL DEFAULT 0,
  `novoice` tinyint(3) NULL DEFAULT 0,
  `needfollow` tinyint(3) NULL DEFAULT 0,
  `needpostfollow` tinyint(3) NULL DEFAULT 0,
  `share_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `share_icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `share_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `keyword` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `isrecommand` tinyint(3) NULL DEFAULT 0,
  `banner` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `needcheck` tinyint(3) NULL DEFAULT 0,
  `needcheckmanager` tinyint(3) NULL DEFAULT 0,
  `needcheckreply` int(11) NULL DEFAULT 0,
  `needcheckreplymanager` int(11) NULL DEFAULT 0,
  `showsnslevels` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `postsnslevels` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `showpartnerlevels` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `postpartnerlevels` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `notpartner` tinyint(3) NULL DEFAULT 0,
  `notpartnerpost` tinyint(3) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_enabled`(`enabled`) USING BTREE,
  INDEX `idx_displayorder`(`displayorder`) USING BTREE,
  INDEX `idx_cid`(`cid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_info_board_follow
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_info_board_follow`;
CREATE TABLE `ims_yunphp_shop_info_board_follow`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `bid` int(11) NULL DEFAULT 0,
  `openid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createtime` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_bid`(`bid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_info_category
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_info_category`;
CREATE TABLE `ims_yunphp_shop_info_category`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `thumb` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `displayorder` tinyint(3) UNSIGNED NULL DEFAULT 0,
  `enabled` tinyint(1) NULL DEFAULT 1,
  `advimg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `advurl` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `isrecommand` tinyint(3) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_enabled`(`enabled`) USING BTREE,
  INDEX `idx_isrecommand`(`isrecommand`) USING BTREE,
  INDEX `idx_displayorder`(`displayorder`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_info_complain
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_info_complain`;
CREATE TABLE `ims_yunphp_shop_info_complain`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT 0,
  `type` tinyint(3) NOT NULL,
  `postsid` int(11) NOT NULL DEFAULT 0,
  `defendant` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `complainant` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `complaint_type` int(10) NOT NULL DEFAULT 0,
  `complaint_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `images` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `createtime` int(11) NOT NULL DEFAULT 0,
  `checkedtime` int(11) NOT NULL DEFAULT 0,
  `checked` tinyint(3) NOT NULL DEFAULT 0,
  `checked_note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `deleted` tinyint(3) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_info_complaincate
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_info_complaincate`;
CREATE TABLE `ims_yunphp_shop_info_complaincate`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` tinyint(3) NOT NULL DEFAULT 0,
  `displayorder` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_info_level
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_info_level`;
CREATE TABLE `ims_yunphp_shop_info_level`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `levelname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `credit` int(11) NULL DEFAULT 0,
  `enabled` tinyint(3) NULL DEFAULT 0,
  `post` int(11) NULL DEFAULT 0,
  `color` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `bg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_enabled`(`enabled`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_info_like
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_info_like`;
CREATE TABLE `ims_yunphp_shop_info_like`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `openid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `pid` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_pid`(`pid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_info_manage
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_info_manage`;
CREATE TABLE `ims_yunphp_shop_info_manage`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `bid` int(11) NULL DEFAULT 0,
  `openid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `enabled` tinyint(3) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_bid`(`bid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_info_member
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_info_member`;
CREATE TABLE `ims_yunphp_shop_info_member`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `openid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `level` int(11) NULL DEFAULT 0,
  `createtime` int(11) NULL DEFAULT 0,
  `credit` int(11) NULL DEFAULT 0,
  `sign` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `isblack` tinyint(3) NULL DEFAULT 0,
  `notupgrade` tinyint(3) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_info_post
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_info_post`;
CREATE TABLE `ims_yunphp_shop_info_post`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `bid` int(11) NULL DEFAULT 0,
  `pid` int(11) NULL DEFAULT 0,
  `rpid` int(11) NULL DEFAULT 0,
  `openid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `nickname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `images` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `voice` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createtime` int(11) NULL DEFAULT 0,
  `replytime` int(11) NULL DEFAULT 0,
  `credit` int(11) NULL DEFAULT 0,
  `views` int(11) NULL DEFAULT 0,
  `islock` tinyint(1) NULL DEFAULT 0,
  `istop` tinyint(1) NULL DEFAULT 0,
  `isboardtop` tinyint(1) NULL DEFAULT 0,
  `isbest` tinyint(1) NULL DEFAULT 0,
  `isboardbest` tinyint(3) NULL DEFAULT 0,
  `deleted` tinyint(3) NULL DEFAULT 0,
  `deletedtime` int(11) NULL DEFAULT 0,
  `checked` tinyint(3) NULL DEFAULT NULL,
  `checktime` int(11) NULL DEFAULT 0,
  `isadmin` tinyint(3) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_bid`(`bid`) USING BTREE,
  INDEX `idx_pid`(`pid`) USING BTREE,
  INDEX `idx_createtime`(`createtime`) USING BTREE,
  INDEX `idx_islock`(`islock`) USING BTREE,
  INDEX `idx_istop`(`istop`) USING BTREE,
  INDEX `idx_isboardtop`(`isboardtop`) USING BTREE,
  INDEX `idx_isbest`(`isbest`) USING BTREE,
  INDEX `idx_deleted`(`deleted`) USING BTREE,
  INDEX `idx_deletetime`(`deletedtime`) USING BTREE,
  INDEX `idx_checked`(`checked`) USING BTREE,
  INDEX `idx_rpid`(`rpid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_lottery
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_lottery`;
CREATE TABLE `ims_yunphp_shop_lottery`  (
  `lottery_id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `lottery_title` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `lottery_icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `lottery_banner` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `lottery_cannot` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `lottery_type` tinyint(1) NULL DEFAULT NULL,
  `is_delete` tinyint(1) NULL DEFAULT 0,
  `addtime` int(11) NULL DEFAULT NULL,
  `lottery_data` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `is_goods` tinyint(1) NULL DEFAULT 0,
  `lottery_days` int(11) NULL DEFAULT 0,
  `task_type` tinyint(1) NULL DEFAULT 0,
  `task_data` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `start_time` int(11) NULL DEFAULT NULL,
  `end_time` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`lottery_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_lottery_default
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_lottery_default`;
CREATE TABLE `ims_yunphp_shop_lottery_default`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT 0,
  `data` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `addtime` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_lottery_join
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_lottery_join`;
CREATE TABLE `ims_yunphp_shop_lottery_join`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `join_user` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `lottery_id` int(11) NULL DEFAULT NULL,
  `lottery_num` int(10) NULL DEFAULT 0,
  `lottery_tag` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `addtime` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_lottery_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_lottery_log`;
CREATE TABLE `ims_yunphp_shop_lottery_log`  (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT NULL,
  `lottery_id` int(11) NULL DEFAULT 0,
  `join_user` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `lottery_data` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `is_reward` tinyint(1) NULL DEFAULT 0,
  `addtime` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`log_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_mc_merchant
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_mc_merchant`;
CREATE TABLE `ims_yunphp_shop_mc_merchant`  (
  `id` int(11) NOT NULL,
  `uniacid` int(11) NOT NULL,
  `merchant_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `salt` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `contact_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `contact_mobile` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `contact_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `type` tinyint(4) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `createtime` int(11) NOT NULL,
  `validitytime` int(11) NOT NULL,
  `industry` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `remark` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_member
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_member`;
CREATE TABLE `ims_yunphp_shop_member`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `uid` int(11) NULL DEFAULT 0,
  `groupid` int(11) NULL DEFAULT 0,
  `level` int(11) NULL DEFAULT 0,
  `agentid` int(11) NULL DEFAULT 0,
  `openid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `realname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `mobile` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `pwd` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `weixin` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `commission` decimal(10, 2) NULL DEFAULT 0.00,
  `commission_pay` decimal(10, 2) NULL DEFAULT 0.00,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `createtime` int(10) NULL DEFAULT 0,
  `agenttime` int(10) NULL DEFAULT 0,
  `status` tinyint(1) NULL DEFAULT 0,
  `isagent` tinyint(1) NULL DEFAULT 0,
  `clickcount` int(11) NULL DEFAULT 0,
  `agentlevel` int(11) NULL DEFAULT 0,
  `noticeset` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `nickname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `credit1` decimal(10, 2) NULL DEFAULT 0.00,
  `credit2` decimal(10, 2) NULL DEFAULT 0.00,
  `birthyear` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `birthmonth` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `birthday` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `gender` tinyint(3) NULL DEFAULT 0,
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `province` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `city` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `jqbj` int(2) NULL DEFAULT NULL,
  `area` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `childtime` int(11) NULL DEFAULT 0,
  `inviter` int(11) NULL DEFAULT 0,
  `agentnotupgrade` int(11) NULL DEFAULT 0,
  `agentselectgoods` tinyint(3) NULL DEFAULT 0,
  `agentblack` int(11) NULL DEFAULT 0,
  `fixagentid` tinyint(3) NULL DEFAULT 0,
  `diymemberid` int(11) NULL DEFAULT 0,
  `diymemberfields` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `diymemberdata` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `diymemberdataid` int(11) NULL DEFAULT 0,
  `diycommissionid` int(11) NULL DEFAULT 0,
  `diycommissionfields` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `diycommissiondata` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `diycommissiondataid` int(11) NULL DEFAULT 0,
  `isblack` int(11) NULL DEFAULT 0,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `commission_total` decimal(10, 2) NULL DEFAULT 0.00,
  `endtime2` int(11) NULL DEFAULT 0,
  `ispartner` tinyint(3) NULL DEFAULT 0,
  `partnertime` int(11) NULL DEFAULT 0,
  `partnerstatus` tinyint(3) NULL DEFAULT 0,
  `partnerblack` tinyint(3) NULL DEFAULT 0,
  `partnerlevel` int(11) NULL DEFAULT 0,
  `partnernotupgrade` tinyint(3) NULL DEFAULT 0,
  `diyglobonusid` int(11) NULL DEFAULT 0,
  `diyglobonusdata` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `diyglobonusfields` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `isaagent` tinyint(3) NULL DEFAULT 0,
  `aagentlevel` int(11) NULL DEFAULT 0,
  `aagenttime` int(11) NULL DEFAULT 0,
  `aagentstatus` tinyint(3) NULL DEFAULT 0,
  `aagentblack` tinyint(3) NULL DEFAULT 0,
  `aagentnotupgrade` tinyint(3) NULL DEFAULT 0,
  `aagenttype` tinyint(3) NULL DEFAULT 0,
  `aagentprovinces` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `aagentcitys` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `aagentareas` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `diyaagentid` int(11) NULL DEFAULT 0,
  `diyaagentdata` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `diyaagentfields` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `salt` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mobileverify` tinyint(3) NULL DEFAULT 0,
  `mobileuser` tinyint(3) NULL DEFAULT 0,
  `carrier_mobile` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0',
  `isauthor` tinyint(1) NULL DEFAULT 0,
  `authortime` int(11) NULL DEFAULT 0,
  `authorstatus` tinyint(1) NULL DEFAULT 0,
  `authorblack` tinyint(1) NULL DEFAULT 0,
  `authorlevel` int(11) NULL DEFAULT 0,
  `authornotupgrade` tinyint(1) NULL DEFAULT 0,
  `diyauthorid` int(11) NULL DEFAULT 0,
  `diyauthordata` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `diyauthorfields` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `authorid` int(11) NULL DEFAULT 0,
  `comefrom` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `openid_qq` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `openid_wx` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `diymaxcredit` tinyint(3) NULL DEFAULT 0,
  `maxcredit` int(11) NULL DEFAULT 0,
  `datavalue` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `openid_wa` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `nickname_wechat` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `avatar_wechat` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `updateaddress` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_shareid`(`agentid`) USING BTREE,
  INDEX `idx_openid`(`openid`) USING BTREE,
  INDEX `idx_status`(`status`) USING BTREE,
  INDEX `idx_agenttime`(`agenttime`) USING BTREE,
  INDEX `idx_isagent`(`isagent`) USING BTREE,
  INDEX `idx_uid`(`uid`) USING BTREE,
  INDEX `idx_groupid`(`groupid`) USING BTREE,
  INDEX `idx_level`(`level`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2188 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_member_address
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_member_address`;
CREATE TABLE `ims_yunphp_shop_member_address`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `openid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0',
  `realname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `mobile` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `province` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `city` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `area` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `address` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `isdefault` tinyint(1) NULL DEFAULT 0,
  `zipcode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `deleted` tinyint(1) NULL DEFAULT 0,
  `street` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `datavalue` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `streetdatavalue` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_openid`(`openid`) USING BTREE,
  INDEX `idx_isdefault`(`isdefault`) USING BTREE,
  INDEX `idx_deleted`(`deleted`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 83 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_member_cart
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_member_cart`;
CREATE TABLE `ims_yunphp_shop_member_cart`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `openid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `goodsid` int(11) NULL DEFAULT 0,
  `total` int(11) NULL DEFAULT 0,
  `marketprice` decimal(10, 2) NULL DEFAULT 0.00,
  `deleted` tinyint(1) NULL DEFAULT 0,
  `optionid` int(11) NULL DEFAULT 0,
  `createtime` int(11) NULL DEFAULT 0,
  `diyformdataid` int(11) NULL DEFAULT 0,
  `diyformdata` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `diyformfields` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `diyformid` int(11) NULL DEFAULT 0,
  `selected` tinyint(1) NULL DEFAULT 1,
  `selectedadd` tinyint(1) NULL DEFAULT 1,
  `merchid` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_goodsid`(`goodsid`) USING BTREE,
  INDEX `idx_openid`(`openid`) USING BTREE,
  INDEX `idx_deleted`(`deleted`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 63 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_member_favorite
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_member_favorite`;
CREATE TABLE `ims_yunphp_shop_member_favorite`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `goodsid` int(10) NULL DEFAULT 0,
  `openid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `deleted` tinyint(1) NULL DEFAULT 0,
  `createtime` int(11) NULL DEFAULT 0,
  `merchid` int(11) NULL DEFAULT 0,
  `type` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_goodsid`(`goodsid`) USING BTREE,
  INDEX `idx_openid`(`openid`) USING BTREE,
  INDEX `idx_deleted`(`deleted`) USING BTREE,
  INDEX `idx_createtime`(`createtime`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_member_group
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_member_group`;
CREATE TABLE `ims_yunphp_shop_member_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `groupname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_member_history
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_member_history`;
CREATE TABLE `ims_yunphp_shop_member_history`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `goodsid` int(10) NULL DEFAULT 0,
  `openid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `deleted` tinyint(1) NULL DEFAULT 0,
  `createtime` int(11) NULL DEFAULT 0,
  `times` int(11) NULL DEFAULT 0,
  `merchid` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_goodsid`(`goodsid`) USING BTREE,
  INDEX `idx_openid`(`openid`) USING BTREE,
  INDEX `idx_deleted`(`deleted`) USING BTREE,
  INDEX `idx_createtime`(`createtime`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2234 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_member_level
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_member_level`;
CREATE TABLE `ims_yunphp_shop_member_level`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `level` int(11) NULL DEFAULT 0,
  `levelname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `ordermoney` decimal(10, 2) NULL DEFAULT 0.00,
  `ordercount` int(10) NULL DEFAULT 0,
  `discount` decimal(10, 2) NULL DEFAULT 0.00,
  `enabled` tinyint(3) NULL DEFAULT 0,
  `enabledadd` tinyint(1) NULL DEFAULT 0,
  `buygoods` tinyint(1) NOT NULL DEFAULT 0,
  `goodsids` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_member_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_member_log`;
CREATE TABLE `ims_yunphp_shop_member_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `openid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `type` tinyint(3) NULL DEFAULT NULL COMMENT '0 充值 1 提现',
  `logno` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `createtime` int(11) NULL DEFAULT 0,
  `status` int(11) NULL DEFAULT 0 COMMENT '0 生成 1 成功 2 失败',
  `money` decimal(10, 2) NULL DEFAULT 0.00,
  `rechargetype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '充值类型',
  `gives` decimal(10, 2) NULL DEFAULT NULL,
  `couponid` int(11) NULL DEFAULT 0,
  `transid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `realmoney` decimal(10, 2) NULL DEFAULT 0.00,
  `charge` decimal(10, 2) NULL DEFAULT 0.00,
  `deductionmoney` decimal(10, 2) NULL DEFAULT 0.00,
  `isborrow` tinyint(3) NULL DEFAULT 0,
  `borrowopenid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `apppay` tinyint(3) NOT NULL DEFAULT 0,
  `alipay` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `bankname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `bankcard` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `realname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `applytype` tinyint(3) NOT NULL DEFAULT 0,
  `sendmoney` decimal(10, 2) NULL DEFAULT 0.00,
  `senddata` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_openid`(`openid`) USING BTREE,
  INDEX `idx_type`(`type`) USING BTREE,
  INDEX `idx_createtime`(`createtime`) USING BTREE,
  INDEX `idx_status`(`status`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 106 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_member_mergelog
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_member_mergelog`;
CREATE TABLE `ims_yunphp_shop_member_mergelog`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT 0,
  `mergetime` int(11) NOT NULL DEFAULT 0,
  `openid_a` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `openid_b` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mid_a` int(11) NOT NULL,
  `mid_b` int(11) NOT NULL,
  `detail_a` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `detail_b` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `detail_c` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_mid_a`(`mid_a`) USING BTREE,
  INDEX `idx_mid_b`(`mid_b`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_member_message_template
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_member_message_template`;
CREATE TABLE `ims_yunphp_shop_member_message_template`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `template_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `first` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '键名',
  `firstcolor` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `data` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '颜色',
  `remark` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '键值',
  `remarkcolor` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `createtime` int(11) NULL DEFAULT 0,
  `sendtimes` int(11) NULL DEFAULT 0,
  `sendcount` int(11) NULL DEFAULT 0,
  `typecode` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `messagetype` tinyint(1) NULL DEFAULT 0,
  `send_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_createtime`(`createtime`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_member_message_template_default
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_member_message_template_default`;
CREATE TABLE `ims_yunphp_shop_member_message_template_default`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `typecode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `uniacid` int(11) NULL DEFAULT NULL,
  `templateid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_member_message_template_type
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_member_message_template_type`;
CREATE TABLE `ims_yunphp_shop_member_message_template_type`  (
  `id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `typecode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `templatecode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `templateid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `templatename` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `showtotaladd` tinyint(1) NULL DEFAULT 0,
  `typegroup` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `groupname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ims_yunphp_shop_member_message_template_type
-- ----------------------------
INSERT INTO `ims_yunphp_shop_member_message_template_type` VALUES (1, '订单付款通知', 'saler_pay', 'OPENTM405584202', 'xldHFTObiLLm7AK544PzW4bFJGgbS0o8Po4cXOgYEis', '订单付款通知', '{{first.DATA}}订单编号：{{keyword1.DATA}}商品名称：{{keyword2.DATA}}商品数量：{{keyword3.DATA}}支付金额：{{keyword4.DATA}}{{remark.DATA}}', 0, 'sys', '系统消息通知');
INSERT INTO `ims_yunphp_shop_member_message_template_type` VALUES (2, '自提订单提交成功通知', 'carrier', 'OPENTM201594720', 'W6-XbT9l2Wb9FUUISss9yVZdPU8iEmEes9IZfvNZnbc', '订单付款通知', '{{first.DATA}}自提码：{{keyword1.DATA}}商品详情：{{keyword2.DATA}}提货地址：{{keyword3.DATA}}提货时间：{{keyword4.DATA}}{{remark.DATA}}', 0, 'sys', '系统消息通知');
INSERT INTO `ims_yunphp_shop_member_message_template_type` VALUES (3, '订单取消通知', 'cancel', 'OPENTM201764653', 'EA6fL2052fvAs7F9w0Dx_UGbVuXmDFqLcrdT4IukWEY', '订单关闭提醒', '{{first.DATA}}订单商品：{{keyword1.DATA}}订单编号：{{keyword2.DATA}}下单时间：{{keyword3.DATA}}订单金额：{{keyword4.DATA}}关闭时间：{{keyword5.DATA}}{{remark.DATA}}', 0, 'sys', '系统消息通知');
INSERT INTO `ims_yunphp_shop_member_message_template_type` VALUES (4, '订单即将取消通知', 'willcancel', 'OPENTM201764653', 'EA6fL2052fvAs7F9w0Dx_UGbVuXmDFqLcrdT4IukWEY', '订单关闭提醒', '{{first.DATA}}订单商品：{{keyword1.DATA}}订单编号：{{keyword2.DATA}}下单时间：{{keyword3.DATA}}订单金额：{{keyword4.DATA}}关闭时间：{{keyword5.DATA}}{{remark.DATA}}', 0, 'sys', '系统消息通知');
INSERT INTO `ims_yunphp_shop_member_message_template_type` VALUES (5, '订单支付成功通知', 'pay', 'OPENTM405584202', 'xldHFTObiLLm7AK544PzW4bFJGgbS0o8Po4cXOgYEis', '订单支付通知', '{{first.DATA}}订单编号：{{keyword1.DATA}}商品名称：{{keyword2.DATA}}商品数量：{{keyword3.DATA}}支付金额：{{keyword4.DATA}}{{remark.DATA}}', 0, 'sys', '系统消息通知');
INSERT INTO `ims_yunphp_shop_member_message_template_type` VALUES (6, '订单发货通知', 'send', 'OPENTM401874827', 'c0Db6XJBYJ0PcdDyDR5YsoGKy6zfvnQrNM97Ml2hBt4', '订单发货通知', '{{first.DATA}}订单编号：{{keyword1.DATA}}快递公司：{{keyword2.DATA}}快递单号：{{keyword3.DATA}}{{remark.DATA}}', 0, 'sys', '系统消息通知');
INSERT INTO `ims_yunphp_shop_member_message_template_type` VALUES (7, '自动发货通知(虚拟物品及卡密)', 'virtualsend', 'OPENTM207793687', 'c2kQ5Pf7QkBUXhAVQRGpRusO1BS2uu_IBjPlIZ7IbYo', '自动发货通知', '{{first.DATA}}商品名称：{{keyword1.DATA}}订单号：{{keyword2.DATA}}订单金额：{{keyword3.DATA}}卡密信息：{{keyword4.DATA}}{{remark.DATA}}', 0, 'sys', '系统消息通知');
INSERT INTO `ims_yunphp_shop_member_message_template_type` VALUES (8, '订单状态更新(修改收货地址)(修改价格)', 'orderstatus', 'TM00017', 'v6w5z7I8FMki08ndnGnfHSyx46eyYq9m_cIZUcvwCgU', '订单付款通知', '{{first.DATA}}订单编号: {{OrderSn.DATA}}订单状态: {{OrderStatus.DATA}}{{remark.DATA}}', 0, 'sys', '系统消息通知');
INSERT INTO `ims_yunphp_shop_member_message_template_type` VALUES (9, '退款成功通知', 'refund1', 'TM00430', 'ez-VqnyVFEX6msJfoegrwMK2qZ6Va02sbOWvaHIMFNw', '退款成功通知', '{{first.DATA}}退款金额：{{orderProductPrice.DATA}}商品详情：{{orderProductName.DATA}}订单编号：{{orderName.DATA}}{{remark.DATA}}', 0, 'sys', '系统消息通知');
INSERT INTO `ims_yunphp_shop_member_message_template_type` VALUES (10, '换货成功通知', 'refund3', 'OPENTM200605630', 'uS1mhnM85BtUum0s5xmlfEhnDGupvYqUkjK0A5o0sb8', '任务处理通知', '{{first.DATA}}任务名称：{{keyword1.DATA}}通知类型：{{keyword2.DATA}}{{remark.DATA}}', 0, 'sys', '系统消息通知');
INSERT INTO `ims_yunphp_shop_member_message_template_type` VALUES (11, '退款申请驳回通知', 'refund2', 'OPENTM200605630', 'uS1mhnM85BtUum0s5xmlfEhnDGupvYqUkjK0A5o0sb8', '任务处理通知', '{{first.DATA}}任务名称：{{keyword1.DATA}}通知类型：{{keyword2.DATA}}{{remark.DATA}}', 0, 'sys', '系统消息通知');
INSERT INTO `ims_yunphp_shop_member_message_template_type` VALUES (12, '充值成功通知', 'recharge_ok', 'OPENTM207727673', 'PWycmpCcbBEOuB99kZK6Lb_S_Ve6rZoigooR8lHtRHk', '充值成功提醒', '{{first.DATA}}充值金额：{{keyword1.DATA}}充值时间：{{keyword2.DATA}}账户余额：{{keyword3.DATA}}{{remark.DATA}}', 0, 'sys', '系统消息通知');
INSERT INTO `ims_yunphp_shop_member_message_template_type` VALUES (13, '提现成功通知', 'withdraw_ok', 'OPENTM207422808', 'dpgcRnw1OrF_Beo7kgkK_0ThxcEY3nxpGHUPZ9Q4Yt0', '提现通知', '{{first.DATA}}申请提现金额：{{keyword1.DATA}}取提现手续费：{{keyword2.DATA}}实际到账金额：{{keyword3.DATA}}提现渠道：{{keyword4.DATA}}{{remark.DATA}}', 0, 'sys', '系统消息通知');
INSERT INTO `ims_yunphp_shop_member_message_template_type` VALUES (14, '会员升级通知(任务处理通知)', 'upgrade', 'OPENTM200605630', 'UhLLmFRFoJB21zWe8Ue6s2Wbs6-hwAIcywjXFPEgAfk', '任务处理通知', '{{first.DATA}}任务名称：{{keyword1.DATA}}通知类型：{{keyword2.DATA}}{{remark.DATA}}', 0, 'sys', '系统消息通知');
INSERT INTO `ims_yunphp_shop_member_message_template_type` VALUES (15, '充值成功通知（后台管理员手动）', 'backrecharge_ok', 'OPENTM207727673', '8cH0W4PS46ttwb0NKaOsWlZXzp68pFkvhmz8Cx1TFYI', '充值成功提醒', '{{first.DATA}}充值金额：{{keyword1.DATA}}充值时间：{{keyword2.DATA}}账户余额：{{keyword3.DATA}}{{remark.DATA}}', 0, 'sys', '系统消息通知');
INSERT INTO `ims_yunphp_shop_member_message_template_type` VALUES (16, '积分变动提醒', 'backpoint_ok', 'OPENTM207509450', 't4X8tcZsZRfiLaxvlZSd9QTgmQTZRpy110DgoJeu4DU', '积分变动提醒', '{{first.DATA}}获得时间：{{keyword1.DATA}}获得积分：{{keyword2.DATA}}获得原因：{{keyword3.DATA}}当前积分：{{keyword4.DATA}}{{remark.DATA}}', 0, 'sys', '系统消息通知');
INSERT INTO `ims_yunphp_shop_member_message_template_type` VALUES (17, '换货发货通知', 'refund4', 'OPENTM401874827', 'c0Db6XJBYJ0PcdDyDR5YsoGKy6zfvnQrNM97Ml2hBt4', '订单发货通知', '{{first.DATA}}订单编号：{{keyword1.DATA}}快递公司：{{keyword2.DATA}}快递单号：{{keyword3.DATA}}{{remark.DATA}}', 0, 'sys', '系统消息通知');
INSERT INTO `ims_yunphp_shop_member_message_template_type` VALUES (18, '砍价活动通知', 'bargain_message', 'OPENTM200605630', NULL, '任务处理通知', '{{first.DATA}}任务名称：{{keyword1.DATA}}通知类型：{{keyword2.DATA}}{{remark.DATA}}', 0, 'bargain', '砍价消息通知');
INSERT INTO `ims_yunphp_shop_member_message_template_type` VALUES (19, '拼团活动通知', 'groups', NULL, NULL, NULL, NULL, 0, 'groups', '拼团消息通知');
INSERT INTO `ims_yunphp_shop_member_message_template_type` VALUES (20, '分销系统通知', 'commission', NULL, NULL, NULL, NULL, 0, 'commission', '分销消息通知');
INSERT INTO `ims_yunphp_shop_member_message_template_type` VALUES (21, '商品付款通知', 'saler_goodpay', 'OPENTM200605630', '', '任务处理通知', '{{first.DATA}}任务名称：{{keyword1.DATA}}通知类型：{{keyword2.DATA}}{{remark.DATA}}', 0, 'sys', '系统消息通知');
INSERT INTO `ims_yunphp_shop_member_message_template_type` VALUES (22, '砍到底价通知', 'bargain_fprice', 'OPENTM200605630', '', '任务处理通知', '{{first.DATA}}任务名称：{{keyword1.DATA}}通知类型：{{keyword2.DATA}}{{remark.DATA}}', 0, 'bargain', '砍价消息通知');
INSERT INTO `ims_yunphp_shop_member_message_template_type` VALUES (23, '订单收货通知(卖家)', 'saler_finish', 'OPENTM200605630', '', '任务处理通知', '{{first.DATA}}任务名称：{{keyword1.DATA}}通知类型：{{keyword2.DATA}}{{remark.DATA}}', 0, 'sys', '系统消息通知');
INSERT INTO `ims_yunphp_shop_member_message_template_type` VALUES (24, '余额兑换成功通知', 'exchange_balance', 'OPENTM207727673', '', '充值成功提醒', '{{first.DATA}}充值金额：{{keyword1.DATA}}充值时间：{{keyword2.DATA}}账户余额：{{keyword3.DATA}}{{remark.DATA}}', 0, 'exchange', '兑换中心消息通知');
INSERT INTO `ims_yunphp_shop_member_message_template_type` VALUES (25, '积分兑换成功通知', 'exchange_score', 'OPENTM207509450', '', '积分变动提醒', '{{first.DATA}}获得时间：{{keyword1.DATA}}获得积分：{{keyword2.DATA}}获得原因：{{keyword3.DATA}}当前积分：{{keyword4.DATA}}{{remark.DATA}}', 0, 'exchange', '兑换中心消息通知');
INSERT INTO `ims_yunphp_shop_member_message_template_type` VALUES (26, '兑换中心余额充值通知', 'exchange_recharge', 'OPENTM207727673', '', '充值成功提醒', '{{first.DATA}}充值金额：{{keyword1.DATA}}充值时间：{{keyword2.DATA}}账户余额：{{keyword3.DATA}}{{remark.DATA}}', 0, 'exchange', '兑换中心消息通知');

-- ----------------------------
-- Table structure for ims_yunphp_shop_member_printer
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_member_printer`;
CREATE TABLE `ims_yunphp_shop_member_printer`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `type` tinyint(3) NULL DEFAULT 0,
  `print_data` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `createtime` int(11) NULL DEFAULT 0,
  `merchid` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_createtime`(`createtime`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_member_printer_template
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_member_printer_template`;
CREATE TABLE `ims_yunphp_shop_member_printer_template`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `type` tinyint(3) NULL DEFAULT 0,
  `print_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `print_style` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `print_data` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `code` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `qrcode` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `createtime` int(11) NULL DEFAULT 0,
  `merchid` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_createtime`(`createtime`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_member_rank
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_member_rank`;
CREATE TABLE `ims_yunphp_shop_member_rank`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `status` tinyint(4) NOT NULL,
  `num` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for ims_yunphp_shop_merch_account
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_merch_account`;
CREATE TABLE `ims_yunphp_shop_merch_account`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `openid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `merchid` int(11) NULL DEFAULT 0,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `pwd` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `salt` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `status` tinyint(3) NULL DEFAULT 0,
  `perms` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `isfounder` tinyint(3) NULL DEFAULT 0,
  `lastip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `lastvisit` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `roleid` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_merchid`(`merchid`) USING BTREE,
  INDEX `idx_status`(`status`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 95 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_merch_adv
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_merch_adv`;
CREATE TABLE `ims_yunphp_shop_merch_adv`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `advname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `link` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `thumb` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `displayorder` int(11) NULL DEFAULT NULL,
  `enabled` int(11) NULL DEFAULT NULL,
  `merchid` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_merchid`(`merchid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_merch_banner
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_merch_banner`;
CREATE TABLE `ims_yunphp_shop_merch_banner`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `bannername` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `link` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `thumb` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `displayorder` int(11) NULL DEFAULT 0,
  `enabled` int(11) NULL DEFAULT 0,
  `merchid` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_enabled`(`enabled`) USING BTREE,
  INDEX `idx_displayorder`(`displayorder`) USING BTREE,
  INDEX `idx_merchid`(`merchid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_merch_bill
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_merch_bill`;
CREATE TABLE `ims_yunphp_shop_merch_bill`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT 0,
  `applyno` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `merchid` int(11) NOT NULL DEFAULT 0,
  `orderids` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `realprice` decimal(10, 2) NOT NULL DEFAULT 0.00,
  `realpricerate` decimal(10, 2) NOT NULL DEFAULT 0.00,
  `finalprice` decimal(10, 2) NOT NULL DEFAULT 0.00,
  `payrateprice` decimal(10, 2) NOT NULL DEFAULT 0.00,
  `payrate` decimal(10, 2) NOT NULL DEFAULT 0.00,
  `money` decimal(10, 2) NOT NULL DEFAULT 0.00,
  `applytime` int(11) NOT NULL DEFAULT 0,
  `checktime` int(11) NOT NULL DEFAULT 0,
  `paytime` int(11) NOT NULL DEFAULT 0,
  `invalidtime` int(11) NOT NULL DEFAULT 0,
  `refusetime` int(11) NOT NULL DEFAULT 0,
  `remark` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` tinyint(3) NOT NULL DEFAULT 0,
  `ordernum` int(11) NOT NULL DEFAULT 0,
  `orderprice` decimal(10, 2) NOT NULL DEFAULT 0.00,
  `price` decimal(10, 2) NOT NULL DEFAULT 0.00,
  `passrealprice` decimal(10, 2) NOT NULL DEFAULT 0.00,
  `passrealpricerate` decimal(10, 2) NOT NULL DEFAULT 0.00,
  `passorderids` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `passordernum` int(11) NOT NULL DEFAULT 0,
  `passorderprice` decimal(10, 2) NOT NULL DEFAULT 0.00,
  `alipay` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `bankname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `bankcard` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `applyrealname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `applytype` tinyint(3) NOT NULL DEFAULT 0,
  `handpay` tinyint(3) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_merchid`(`merchid`) USING BTREE,
  INDEX `idx_status`(`status`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_merch_billo
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_merch_billo`;
CREATE TABLE `ims_yunphp_shop_merch_billo`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT 0,
  `billid` int(11) NOT NULL DEFAULT 0,
  `orderid` int(11) NOT NULL DEFAULT 0,
  `ordermoney` decimal(10, 2) NOT NULL DEFAULT 0.00,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 54 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for ims_yunphp_shop_merch_category
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_merch_category`;
CREATE TABLE `ims_yunphp_shop_merch_category`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `catename` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `createtime` int(11) NULL DEFAULT 0,
  `status` tinyint(1) NULL DEFAULT 0,
  `displayorder` int(11) NULL DEFAULT 0,
  `thumb` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `isrecommand` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_merch_category_swipe
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_merch_category_swipe`;
CREATE TABLE `ims_yunphp_shop_merch_category_swipe`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `createtime` int(11) NULL DEFAULT 0,
  `status` tinyint(1) NULL DEFAULT 0,
  `displayorder` int(11) NULL DEFAULT 0,
  `thumb` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_merch_clearing
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_merch_clearing`;
CREATE TABLE `ims_yunphp_shop_merch_clearing`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT 0,
  `merchid` int(11) NOT NULL DEFAULT 0,
  `clearno` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `goodsprice` decimal(10, 2) NOT NULL DEFAULT 0.00,
  `dispatchprice` decimal(10, 2) NOT NULL DEFAULT 0.00,
  `deductprice` decimal(10, 2) NOT NULL DEFAULT 0.00,
  `deductcredit2` decimal(10, 2) NOT NULL DEFAULT 0.00,
  `discountprice` decimal(10, 2) NOT NULL DEFAULT 0.00,
  `deductenough` decimal(10, 2) NOT NULL DEFAULT 0.00,
  `merchdeductenough` decimal(10, 2) NOT NULL DEFAULT 0.00,
  `isdiscountprice` decimal(10, 2) NOT NULL DEFAULT 0.00,
  `price` decimal(10, 2) NOT NULL DEFAULT 0.00,
  `createtime` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `starttime` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `endtime` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `realprice` decimal(10, 2) NOT NULL DEFAULT 0.00,
  `realpricerate` decimal(10, 2) NOT NULL DEFAULT 0.00,
  `finalprice` decimal(10, 2) NOT NULL DEFAULT 0.00,
  `remark` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `paytime` int(11) NOT NULL DEFAULT 0,
  `payrate` decimal(10, 2) NOT NULL DEFAULT 0.00,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `merchid`(`merchid`) USING BTREE,
  INDEX `starttime`(`starttime`) USING BTREE,
  INDEX `endtime`(`endtime`) USING BTREE,
  INDEX `status`(`status`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_merch_group
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_merch_group`;
CREATE TABLE `ims_yunphp_shop_merch_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `groupname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `createtime` int(11) NULL DEFAULT 0,
  `status` tinyint(3) NULL DEFAULT 0,
  `isdefault` tinyint(1) NULL DEFAULT 0,
  `goodschecked` tinyint(1) NULL DEFAULT 0,
  `commissionchecked` tinyint(1) NULL DEFAULT 0,
  `changepricechecked` tinyint(1) NULL DEFAULT 0,
  `finishchecked` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_merch_nav
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_merch_nav`;
CREATE TABLE `ims_yunphp_shop_merch_nav`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `navname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `displayorder` int(11) NULL DEFAULT 0,
  `status` tinyint(3) NULL DEFAULT 0,
  `merchid` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_status`(`status`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_merchid`(`merchid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_merch_notice
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_merch_notice`;
CREATE TABLE `ims_yunphp_shop_merch_notice`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `displayorder` int(11) NULL DEFAULT 0,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `thumb` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `link` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `detail` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `status` tinyint(3) NULL DEFAULT 0,
  `createtime` int(11) NULL DEFAULT NULL,
  `merchid` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_merchid`(`merchid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_merch_perm_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_merch_perm_log`;
CREATE TABLE `ims_yunphp_shop_merch_perm_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NULL DEFAULT 0,
  `uniacid` int(11) NULL DEFAULT 0,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `op` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `createtime` int(11) NULL DEFAULT 0,
  `merchid` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_createtime`(`createtime`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_merchid`(`merchid`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 489 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_merch_perm_role
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_merch_perm_role`;
CREATE TABLE `ims_yunphp_shop_merch_perm_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `merchid` int(11) NULL DEFAULT 0,
  `rolename` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `status` tinyint(3) NULL DEFAULT 0,
  `perms` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `deleted` tinyint(3) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_status`(`status`) USING BTREE,
  INDEX `idx_deleted`(`deleted`) USING BTREE,
  INDEX `merchid`(`merchid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_merch_reg
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_merch_reg`;
CREATE TABLE `ims_yunphp_shop_merch_reg`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `openid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `merchname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `salecate` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `desc` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `realname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `mobile` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `status` tinyint(3) NULL DEFAULT 0,
  `diyformdata` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `diyformfields` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `applytime` int(11) NULL DEFAULT 0,
  `reason` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `uname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `upass` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 112 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_merch_saler
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_merch_saler`;
CREATE TABLE `ims_yunphp_shop_merch_saler`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `storeid` int(11) NULL DEFAULT 0,
  `uniacid` int(11) NULL DEFAULT 0,
  `openid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `status` tinyint(3) NULL DEFAULT 0,
  `salername` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `merchid` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_storeid`(`storeid`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_merchid`(`merchid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_merch_store
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_merch_store`;
CREATE TABLE `ims_yunphp_shop_merch_store`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `storename` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `tel` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `lat` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `lng` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `status` tinyint(3) NULL DEFAULT 0,
  `type` tinyint(1) NULL DEFAULT 0,
  `realname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `mobile` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `fetchtime` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `saletime` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `desc` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `displayorder` int(11) NULL DEFAULT 0,
  `commission_total` decimal(10, 2) NULL DEFAULT NULL,
  `merchid` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_status`(`status`) USING BTREE,
  INDEX `idx_merchid`(`merchid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 39 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_merch_user
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_merch_user`;
CREATE TABLE `ims_yunphp_shop_merch_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `regid` int(11) NULL DEFAULT 0,
  `openid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `groupid` int(11) NULL DEFAULT 0,
  `merchno` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `merchname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `salecate` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `desc` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `realname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `mobile` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `status` tinyint(3) NULL DEFAULT 0,
  `accounttime` int(11) NULL DEFAULT 0,
  `diyformdata` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `diyformfields` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `applytime` int(11) NULL DEFAULT 0,
  `accounttotal` int(11) NULL DEFAULT 0,
  `remark` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `jointime` int(11) NULL DEFAULT 0,
  `accountid` int(11) NULL DEFAULT 0,
  `sets` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `payopenid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `payrate` decimal(10, 2) NOT NULL DEFAULT 0.00,
  `isrecommand` tinyint(1) NULL DEFAULT 0,
  `cateid` int(11) NULL DEFAULT 0,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `tel` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `lat` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `lng` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `pluginset` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `paytype` tinyint(3) NOT NULL DEFAULT 0,
  `uname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `upass` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_status`(`status`) USING BTREE,
  INDEX `idx_groupid`(`groupid`) USING BTREE,
  INDEX `idx_regid`(`regid`) USING BTREE,
  INDEX `idx_cateid`(`cateid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 97 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_multi_shop
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_multi_shop`;
CREATE TABLE `ims_yunphp_shop_multi_shop`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `uid` int(11) NULL DEFAULT 0,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `company` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `sales` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `starttime` int(11) NULL DEFAULT 0,
  `endtime` int(11) NULL DEFAULT 0,
  `applytime` int(11) NULL DEFAULT 0,
  `jointime` int(11) NULL DEFAULT 0,
  `status` tinyint(3) NULL DEFAULT 0,
  `refusecontent` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_nav
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_nav`;
CREATE TABLE `ims_yunphp_shop_nav`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `navname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `displayorder` int(11) NULL DEFAULT 0,
  `status` tinyint(3) NULL DEFAULT 0,
  `iswxapp` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_status`(`status`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_notice
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_notice`;
CREATE TABLE `ims_yunphp_shop_notice`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `displayorder` int(11) NULL DEFAULT 0,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `thumb` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `link` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `detail` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `status` tinyint(3) NULL DEFAULT 0,
  `createtime` int(11) NULL DEFAULT NULL,
  `shopid` int(11) NULL DEFAULT 0,
  `iswxapp` tinyint(3) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_order
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_order`;
CREATE TABLE `ims_yunphp_shop_order`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `openid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `agentid` int(11) NULL DEFAULT 0,
  `ordersn` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `price` decimal(10, 2) NULL DEFAULT 0.00,
  `goodsprice` decimal(10, 2) NULL DEFAULT 0.00,
  `discountprice` decimal(10, 2) NULL DEFAULT 0.00,
  `status` tinyint(3) NULL DEFAULT 0 COMMENT '-1取消状态，0普通状态，1为已付款，2为已发货，3为成功',
  `paytype` tinyint(1) NULL DEFAULT 0 COMMENT '1为余额，2为在线，3为到付',
  `transid` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '微信支付单号',
  `remark` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `addressid` int(11) NULL DEFAULT 0,
  `dispatchprice` decimal(10, 2) NULL DEFAULT 0.00,
  `dispatchid` int(10) NULL DEFAULT 0,
  `createtime` int(10) NULL DEFAULT NULL,
  `dispatchtype` tinyint(3) NULL DEFAULT 0,
  `carrier` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `refundid` int(11) NULL DEFAULT 0,
  `iscomment` tinyint(3) NULL DEFAULT 0,
  `creditadd` tinyint(3) NULL DEFAULT 0,
  `deleted` tinyint(3) NULL DEFAULT 0,
  `userdeleted` tinyint(3) NULL DEFAULT 0,
  `finishtime` int(11) NULL DEFAULT 0,
  `paytime` int(11) NULL DEFAULT 0,
  `expresscom` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `expresssn` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `express` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `sendtime` int(11) NULL DEFAULT 0,
  `fetchtime` int(11) NULL DEFAULT 0,
  `cash` tinyint(3) NULL DEFAULT 0,
  `canceltime` int(11) NULL DEFAULT NULL,
  `cancelpaytime` int(11) NULL DEFAULT 0,
  `refundtime` int(11) NULL DEFAULT 0,
  `isverify` tinyint(3) NULL DEFAULT 0,
  `verified` tinyint(3) NULL DEFAULT 0,
  `verifyopenid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `verifycode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `verifytime` int(11) NULL DEFAULT 0,
  `verifystoreid` int(11) NULL DEFAULT 0,
  `deductprice` decimal(10, 2) NULL DEFAULT 0.00,
  `deductcredit` int(10) NULL DEFAULT 0,
  `deductcredit2` decimal(10, 2) NULL DEFAULT 0.00,
  `deductenough` decimal(10, 2) NULL DEFAULT 0.00,
  `virtual` int(11) NULL DEFAULT 0,
  `virtual_info` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `virtual_str` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `address` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `sysdeleted` tinyint(3) NULL DEFAULT 0,
  `ordersn2` int(11) NULL DEFAULT 0,
  `changeprice` decimal(10, 2) NULL DEFAULT 0.00,
  `changedispatchprice` decimal(10, 2) NULL DEFAULT 0.00,
  `jqbj` tinyint(3) NULL DEFAULT 0,
  `jqid` int(11) NULL DEFAULT 0,
  `goodsid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `oldprice` decimal(10, 2) NULL DEFAULT 0.00,
  `olddispatchprice` decimal(10, 2) NULL DEFAULT 0.00,
  `isvirtual` tinyint(3) NULL DEFAULT 0,
  `couponid` int(11) NULL DEFAULT 0,
  `couponprice` decimal(10, 2) NULL DEFAULT 0.00,
  `diyformdata` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `diyformfields` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `diyformid` int(11) NULL DEFAULT 0,
  `storeid` int(11) NULL DEFAULT 0,
  `printstate` tinyint(1) NULL DEFAULT 0,
  `printstate2` tinyint(1) NULL DEFAULT 0,
  `address_send` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `refundstate` tinyint(3) NULL DEFAULT 0,
  `closereason` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `remarksaler` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `remarkclose` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `remarksend` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `ismr` int(1) NOT NULL DEFAULT 0,
  `isdiscountprice` decimal(10, 2) NULL DEFAULT 0.00,
  `isvirtualsend` tinyint(1) NULL DEFAULT 0,
  `virtualsend_info` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `verifyinfo` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `verifytype` tinyint(1) NULL DEFAULT 0,
  `verifycodes` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `invoicename` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `merchid` int(11) NULL DEFAULT 0,
  `ismerch` tinyint(1) NULL DEFAULT 0,
  `parentid` int(11) NULL DEFAULT 0,
  `isparent` tinyint(1) NULL DEFAULT 0,
  `grprice` decimal(10, 2) NULL DEFAULT 0.00,
  `merchshow` tinyint(1) NULL DEFAULT 0,
  `merchdeductenough` decimal(10, 2) NULL DEFAULT 0.00,
  `couponmerchid` int(11) NULL DEFAULT 0,
  `isglobonus` tinyint(3) NULL DEFAULT 0,
  `merchapply` tinyint(1) NULL DEFAULT 0,
  `isabonus` tinyint(3) NULL DEFAULT 0,
  `isborrow` tinyint(3) NULL DEFAULT 0,
  `borrowopenid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `merchisdiscountprice` decimal(10, 2) NULL DEFAULT 0.00,
  `apppay` tinyint(3) NOT NULL DEFAULT 0,
  `coupongoodprice` decimal(10, 2) NULL DEFAULT 1.00,
  `buyagainprice` decimal(10, 2) NULL DEFAULT 0.00,
  `authorid` int(11) NULL DEFAULT 0,
  `isauthor` tinyint(1) NULL DEFAULT 0,
  `ispackage` tinyint(3) NULL DEFAULT 0,
  `packageid` int(11) NULL DEFAULT 0,
  `taskdiscountprice` decimal(10, 2) NOT NULL DEFAULT 0.00,
  `seckilldiscountprice` decimal(10, 2) NULL DEFAULT 0.00,
  `verifyendtime` int(11) NOT NULL DEFAULT 0,
  `willcancelmessage` tinyint(1) NULL DEFAULT 0,
  `sendtype` tinyint(3) NOT NULL DEFAULT 0,
  `lotterydiscountprice` decimal(10, 2) NOT NULL DEFAULT 0.00,
  `contype` tinyint(1) NULL DEFAULT 0,
  `wxid` int(11) NULL DEFAULT 0,
  `wxcardid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `wxcode` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `dispatchkey` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `costprice` decimal(10, 2) NOT NULL DEFAULT 0.00,
  `quickid` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_openid`(`openid`) USING BTREE,
  INDEX `idx_shareid`(`agentid`) USING BTREE,
  INDEX `idx_status`(`status`) USING BTREE,
  INDEX `idx_createtime`(`createtime`) USING BTREE,
  INDEX `idx_refundid`(`refundid`) USING BTREE,
  INDEX `idx_paytime`(`paytime`) USING BTREE,
  INDEX `idx_finishtime`(`finishtime`) USING BTREE,
  INDEX `idx_merchid`(`merchid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_order_comment
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_order_comment`;
CREATE TABLE `ims_yunphp_shop_order_comment`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `orderid` int(11) NULL DEFAULT 0,
  `goodsid` int(11) NULL DEFAULT 0,
  `openid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `nickname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `headimgurl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `level` tinyint(3) NULL DEFAULT 0,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `images` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `createtime` int(11) NULL DEFAULT 0,
  `deleted` tinyint(3) NULL DEFAULT 0,
  `append_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `append_images` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `reply_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `reply_images` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `append_reply_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `append_reply_images` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `istop` tinyint(3) NULL DEFAULT 0,
  `checked` tinyint(3) NOT NULL DEFAULT 0,
  `replychecked` tinyint(3) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_goodsid`(`goodsid`) USING BTREE,
  INDEX `idx_openid`(`openid`) USING BTREE,
  INDEX `idx_createtime`(`createtime`) USING BTREE,
  INDEX `idx_orderid`(`orderid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_order_goods
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_order_goods`;
CREATE TABLE `ims_yunphp_shop_order_goods`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `orderid` int(11) NULL DEFAULT 0,
  `goodsid` int(11) NULL DEFAULT 0,
  `price` decimal(10, 2) NULL DEFAULT 0.00,
  `total` int(11) NULL DEFAULT 1,
  `optionid` int(10) NULL DEFAULT 0,
  `createtime` int(11) NULL DEFAULT 0,
  `optionname` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `commission1` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `applytime1` int(11) NULL DEFAULT 0,
  `checktime1` int(10) NULL DEFAULT 0,
  `paytime1` int(11) NULL DEFAULT 0,
  `invalidtime1` int(11) NULL DEFAULT 0,
  `deletetime1` int(11) NULL DEFAULT 0,
  `status1` tinyint(3) NULL DEFAULT 0 COMMENT '申请状态，-2删除，-1无效，0未申请，1申请，2审核通过 3已打款',
  `content1` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `commission2` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `applytime2` int(11) NULL DEFAULT 0,
  `checktime2` int(10) NULL DEFAULT 0,
  `paytime2` int(11) NULL DEFAULT 0,
  `invalidtime2` int(11) NULL DEFAULT 0,
  `deletetime2` int(11) NULL DEFAULT 0,
  `status2` tinyint(3) NULL DEFAULT 0 COMMENT '申请状态，-2删除，-1无效，0未申请，1申请，2审核通过 3已打款',
  `content2` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `commission3` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `applytime3` int(11) NULL DEFAULT 0,
  `checktime3` int(10) NULL DEFAULT 0,
  `paytime3` int(11) NULL DEFAULT 0,
  `invalidtime3` int(11) NULL DEFAULT 0,
  `deletetime3` int(11) NULL DEFAULT 0,
  `status3` tinyint(3) NULL DEFAULT 0 COMMENT '申请状态，-2删除，-1无效，0未申请，1申请，2审核通过 3已打款',
  `content3` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `realprice` decimal(10, 2) NULL DEFAULT 0.00,
  `goodssn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `productsn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `nocommission` tinyint(3) NULL DEFAULT 0,
  `changeprice` decimal(10, 2) NULL DEFAULT 0.00,
  `oldprice` decimal(10, 2) NULL DEFAULT 0.00,
  `commissions` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `diyformid` int(11) NULL DEFAULT 0,
  `diyformdataid` int(11) NULL DEFAULT 0,
  `diyformdata` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `diyformfields` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `openid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `printstate` int(11) NOT NULL DEFAULT 0,
  `printstate2` int(11) NOT NULL DEFAULT 0,
  `rstate` tinyint(3) NULL DEFAULT 0,
  `refundtime` int(11) NULL DEFAULT 0,
  `merchid` int(11) NULL DEFAULT 0,
  `parentorderid` int(11) NULL DEFAULT 0,
  `merchsale` tinyint(3) NOT NULL DEFAULT 0,
  `isdiscountprice` decimal(10, 2) NOT NULL DEFAULT 0.00,
  `canbuyagain` tinyint(1) NULL DEFAULT 0,
  `seckill` tinyint(3) NULL DEFAULT 0,
  `seckill_taskid` int(11) NULL DEFAULT 0,
  `seckill_roomid` int(11) NULL DEFAULT 0,
  `seckill_timeid` int(11) NULL DEFAULT 0,
  `is_make` tinyint(1) NULL DEFAULT 0,
  `sendtype` tinyint(3) NOT NULL DEFAULT 0,
  `expresscom` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `expresssn` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `express` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sendtime` int(11) NOT NULL,
  `finishtime` int(11) NOT NULL,
  `remarksend` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `costprice` decimal(10, 2) NOT NULL DEFAULT 0.00,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_orderid`(`orderid`) USING BTREE,
  INDEX `idx_goodsid`(`goodsid`) USING BTREE,
  INDEX `idx_createtime`(`createtime`) USING BTREE,
  INDEX `idx_applytime1`(`applytime1`) USING BTREE,
  INDEX `idx_checktime1`(`checktime1`) USING BTREE,
  INDEX `idx_status1`(`status1`) USING BTREE,
  INDEX `idx_applytime2`(`applytime2`) USING BTREE,
  INDEX `idx_checktime2`(`checktime2`) USING BTREE,
  INDEX `idx_status2`(`status2`) USING BTREE,
  INDEX `idx_applytime3`(`applytime3`) USING BTREE,
  INDEX `idx_invalidtime1`(`invalidtime1`) USING BTREE,
  INDEX `idx_checktime3`(`checktime3`) USING BTREE,
  INDEX `idx_invalidtime2`(`invalidtime2`) USING BTREE,
  INDEX `idx_invalidtime3`(`invalidtime3`) USING BTREE,
  INDEX `idx_status3`(`status3`) USING BTREE,
  INDEX `idx_paytime1`(`paytime1`) USING BTREE,
  INDEX `idx_paytime2`(`paytime2`) USING BTREE,
  INDEX `idx_paytime3`(`paytime3`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 162 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_order_peerpay
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_order_peerpay`;
CREATE TABLE `ims_yunphp_shop_order_peerpay`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT 0,
  `orderid` int(11) NOT NULL DEFAULT 0,
  `peerpay_type` tinyint(1) NOT NULL DEFAULT 0,
  `peerpay_price` decimal(10, 2) NOT NULL DEFAULT 0.00,
  `peerpay_maxprice` decimal(10, 2) NOT NULL DEFAULT 0.00,
  `peerpay_realprice` decimal(10, 2) NOT NULL DEFAULT 0.00,
  `peerpay_selfpay` decimal(10, 2) NOT NULL DEFAULT 0.00,
  `peerpay_message` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `createtime` int(10) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `orderid`(`orderid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_order_peerpay_payinfo
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_order_peerpay_payinfo`;
CREATE TABLE `ims_yunphp_shop_order_peerpay_payinfo`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT 0,
  `uid` int(11) NOT NULL DEFAULT 0,
  `uname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `usay` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `price` decimal(10, 2) NOT NULL DEFAULT 0.00,
  `createtime` int(11) NOT NULL DEFAULT 0,
  `headimg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `refundstatus` tinyint(1) NOT NULL DEFAULT 0,
  `refundprice` decimal(10, 2) NOT NULL DEFAULT 0.00,
  `openid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_order_refund
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_order_refund`;
CREATE TABLE `ims_yunphp_shop_order_refund`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `orderid` int(11) NULL DEFAULT 0,
  `refundno` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `price` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `images` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `createtime` int(11) NULL DEFAULT 0,
  `status` tinyint(3) NULL DEFAULT 0 COMMENT '0申请 1 通过 2 驳回',
  `reply` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `refundtype` tinyint(3) NULL DEFAULT 0,
  `orderprice` decimal(10, 2) NULL DEFAULT 0.00,
  `applyprice` decimal(10, 2) NULL DEFAULT 0.00,
  `imgs` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `rtype` tinyint(3) NULL DEFAULT 0,
  `refundaddress` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `message` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `express` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `expresscom` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `expresssn` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `operatetime` int(11) NULL DEFAULT 0,
  `sendtime` int(11) NULL DEFAULT 0,
  `returntime` int(11) NULL DEFAULT 0,
  `refundtime` int(11) NULL DEFAULT 0,
  `rexpress` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `rexpresscom` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `rexpresssn` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `refundaddressid` int(11) NULL DEFAULT 0,
  `endtime` int(11) NULL DEFAULT 0,
  `realprice` decimal(10, 2) NULL DEFAULT 0.00,
  `resptype` tinyint(3) NULL DEFAULT 0,
  `resptext` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `merchid` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_createtime`(`createtime`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_package
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_package`;
CREATE TABLE `ims_yunphp_shop_package`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT 0,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `price` decimal(10, 2) NOT NULL DEFAULT 0.00,
  `freight` decimal(10, 2) NOT NULL DEFAULT 0.00,
  `thumb` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `starttime` int(11) NOT NULL DEFAULT 0,
  `endtime` int(11) NOT NULL DEFAULT 0,
  `goodsid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cash` tinyint(3) NOT NULL DEFAULT 0,
  `share_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `share_icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `share_desc` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` tinyint(3) NOT NULL DEFAULT 0,
  `deleted` tinyint(3) NOT NULL DEFAULT 0,
  `displayorder` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_package_goods
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_package_goods`;
CREATE TABLE `ims_yunphp_shop_package_goods`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `goodsid` int(11) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `thumb` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `price` decimal(10, 2) NOT NULL DEFAULT 0.00,
  `option` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `goodssn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `productsn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `hasoption` tinyint(3) NOT NULL DEFAULT 0,
  `marketprice` decimal(10, 2) NULL DEFAULT 0.00,
  `packageprice` decimal(10, 2) NULL DEFAULT 0.00,
  `commission1` decimal(10, 2) NULL DEFAULT 0.00,
  `commission2` decimal(10, 2) NULL DEFAULT 0.00,
  `commission3` decimal(10, 2) NULL DEFAULT 0.00,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_package_goods_option
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_package_goods_option`;
CREATE TABLE `ims_yunphp_shop_package_goods_option`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT 0,
  `goodsid` int(11) NOT NULL DEFAULT 0,
  `optionid` int(11) NOT NULL DEFAULT 0,
  `pid` int(11) NOT NULL DEFAULT 0,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `packageprice` decimal(10, 2) NOT NULL DEFAULT 0.00,
  `marketprice` decimal(10, 2) NOT NULL DEFAULT 0.00,
  `commission1` decimal(10, 2) NOT NULL DEFAULT 0.00,
  `commission2` decimal(10, 2) NOT NULL DEFAULT 0.00,
  `commission3` decimal(10, 2) NOT NULL DEFAULT 0.00,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_payment
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_payment`;
CREATE TABLE `ims_yunphp_shop_payment`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT 0,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `type` tinyint(2) NOT NULL DEFAULT 0,
  `appid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `mch_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `apikey` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `sub_appid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `sub_appsecret` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `sub_mch_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cert_file` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `key_file` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `root_file` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `is_raw` tinyint(1) NULL DEFAULT 0,
  `createtime` int(10) UNSIGNED NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_type`(`type`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_perm_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_perm_log`;
CREATE TABLE `ims_yunphp_shop_perm_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NULL DEFAULT 0,
  `uniacid` int(11) NULL DEFAULT 0,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `op` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `createtime` int(11) NULL DEFAULT 0,
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uid`(`uid`) USING BTREE,
  INDEX `idx_createtime`(`createtime`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  FULLTEXT INDEX `idx_type`(`type`),
  FULLTEXT INDEX `idx_op`(`op`)
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_perm_plugin
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_perm_plugin`;
CREATE TABLE `ims_yunphp_shop_perm_plugin`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `acid` int(11) NULL DEFAULT 0,
  `uid` int(11) NULL DEFAULT 0,
  `type` tinyint(3) NULL DEFAULT 0,
  `plugins` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `coms` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `datas` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uid`(`uid`) USING BTREE,
  INDEX `idx_acid`(`acid`) USING BTREE,
  INDEX `idx_type`(`type`) USING BTREE,
  INDEX `idx_uniacid`(`acid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_perm_role
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_perm_role`;
CREATE TABLE `ims_yunphp_shop_perm_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `rolename` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `status` tinyint(3) NULL DEFAULT 0,
  `perms` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `deleted` tinyint(3) NULL DEFAULT 0,
  `perms2` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_status`(`status`) USING BTREE,
  INDEX `idx_deleted`(`deleted`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_perm_user
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_perm_user`;
CREATE TABLE `ims_yunphp_shop_perm_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `uid` int(11) NULL DEFAULT 0,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `roleid` int(11) NULL DEFAULT 0,
  `status` int(11) NULL DEFAULT 0,
  `perms` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `deleted` tinyint(3) NULL DEFAULT 0,
  `realname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `mobile` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `perms2` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `openid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_uid`(`uid`) USING BTREE,
  INDEX `idx_roleid`(`roleid`) USING BTREE,
  INDEX `idx_status`(`status`) USING BTREE,
  INDEX `idx_deleted`(`deleted`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_plugin
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_plugin`;
CREATE TABLE `ims_yunphp_shop_plugin`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `displayorder` int(11) NULL DEFAULT 0,
  `identity` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `version` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `author` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `status` int(11) NULL DEFAULT 0,
  `category` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `thumb` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `desc` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `iscom` tinyint(3) NULL DEFAULT 0,
  `deprecated` tinyint(3) NULL DEFAULT 0,
  `isv2` tinyint(3) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_displayorder`(`displayorder`) USING BTREE,
  INDEX `idx_identity`(`identity`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 47 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ims_yunphp_shop_plugin
-- ----------------------------
INSERT INTO `ims_yunphp_shop_plugin` VALUES (1, 1, 'qiniu', '七牛存储', '1.0', '官方', 1, 'tool', '../addons/yunphp_shop/static/images/qiniu.jpg', NULL, 1, 0, 0);
INSERT INTO `ims_yunphp_shop_plugin` VALUES (2, 2, 'taobao', '商品助手', '1.0', '官方', 1, 'tool', '../addons/yunphp_shop/static/images/taobao.jpg', '', 0, 0, 0);
INSERT INTO `ims_yunphp_shop_plugin` VALUES (3, 3, 'commission', '分销系统', '1.0', '官方', 1, 'biz', '../addons/yunphp_shop/static/images/commission.jpg', '', 0, 0, 0);
INSERT INTO `ims_yunphp_shop_plugin` VALUES (4, 4, 'poster', '超级海报', '1.2', '官方', 1, 'sale', '../addons/yunphp_shop/static/images/poster.jpg', '', 0, 0, 0);
INSERT INTO `ims_yunphp_shop_plugin` VALUES (5, 5, 'verify', 'O2O核销', '1.0', '官方', 1, 'biz', '../addons/yunphp_shop/static/images/verify.jpg', NULL, 1, 0, 0);
INSERT INTO `ims_yunphp_shop_plugin` VALUES (6, 6, 'tmessage', '会员群发', '1.0', '官方', 1, 'tool', '../addons/yunphp_shop/static/images/tmessage.jpg', NULL, 1, 0, 0);
INSERT INTO `ims_yunphp_shop_plugin` VALUES (7, 7, 'perm', '分权系统', '1.0', '官方', 1, 'help', '../addons/yunphp_shop/static/images/perm.jpg', NULL, 1, 0, 0);
INSERT INTO `ims_yunphp_shop_plugin` VALUES (8, 8, 'sale', '营销宝', '1.0', '官方', 1, 'sale', '../addons/yunphp_shop/static/images/sale.jpg', NULL, 1, 0, 0);
INSERT INTO `ims_yunphp_shop_plugin` VALUES (9, 9, 'designer', '店铺装修V1', '1.0', '官方', 1, 'help', '../addons/yunphp_shop/static/images/designer.jpg', NULL, 0, 1, 0);
INSERT INTO `ims_yunphp_shop_plugin` VALUES (10, 10, 'creditshop', '积分商城', '1.0', '官方', 1, 'biz', '../addons/yunphp_shop/static/images/creditshop.jpg', '', 0, 0, 0);
INSERT INTO `ims_yunphp_shop_plugin` VALUES (11, 11, 'virtual', '虚拟物品', '1.0', '官方', 1, 'biz', '../addons/yunphp_shop/static/images/virtual.jpg', NULL, 1, 0, 0);
INSERT INTO `ims_yunphp_shop_plugin` VALUES (12, 11, 'article', '文章营销', '1.0', '官方', 1, 'help', '../addons/yunphp_shop/static/images/article.jpg', '', 0, 0, 0);
INSERT INTO `ims_yunphp_shop_plugin` VALUES (13, 13, 'coupon', '超级券', '1.0', '官方', 1, 'sale', '../addons/yunphp_shop/static/images/coupon.jpg', NULL, 1, 0, 0);
INSERT INTO `ims_yunphp_shop_plugin` VALUES (14, 14, 'postera', '活动海报', '1.0', '官方', 1, 'sale', '../addons/yunphp_shop/static/images/postera.jpg', '', 0, 0, 0);
INSERT INTO `ims_yunphp_shop_plugin` VALUES (15, 16, 'system', '系统工具', '1.0', '官方', 0, 'help', '../addons/yunphp_shop/static/images/system.jpg', NULL, 0, 1, 0);
INSERT INTO `ims_yunphp_shop_plugin` VALUES (16, 15, 'diyform', '自定表单', '1.0', '官方', 1, 'help', '../addons/yunphp_shop/static/images/diyform.jpg', '', 0, 0, 0);
INSERT INTO `ims_yunphp_shop_plugin` VALUES (17, 16, 'exhelper', '快递助手', '1.0', '官方', 1, 'help', '../addons/yunphp_shop/static/images/exhelper.jpg', '', 0, 0, 0);
INSERT INTO `ims_yunphp_shop_plugin` VALUES (18, 19, 'groups', '拼团系统', '1.0', '官方', 1, 'biz', '../addons/yunphp_shop/static/images/groups.jpg', '', 0, 0, 0);
INSERT INTO `ims_yunphp_shop_plugin` VALUES (19, 20, 'diypage', '店铺装修', '2.0', '官方', 1, 'help', '../addons/yunphp_shop/static/images/designer.jpg', '', 0, 0, 0);
INSERT INTO `ims_yunphp_shop_plugin` VALUES (20, 22, 'globonus', '全民股东', '1.0', '官方', 1, 'biz', '../addons/yunphp_shop/static/images/globonus.jpg', '', 0, 0, 0);
INSERT INTO `ims_yunphp_shop_plugin` VALUES (21, 23, 'merch', '多商户', '1.0', '官方', 1, 'biz', '../addons/yunphp_shop/static/images/merch.jpg', '', 0, 0, 1);
INSERT INTO `ims_yunphp_shop_plugin` VALUES (22, 26, 'qa', '帮助中心', '1.0', '官方', 1, 'help', '../addons/yunphp_shop/static/images/qa.jpg', '', 0, 0, 1);
INSERT INTO `ims_yunphp_shop_plugin` VALUES (24, 27, 'sms', '短信提醒', '1.0', '官方', 1, 'tool', '../addons/yunphp_shop/static/images/sms.jpg', '', 1, 0, 1);
INSERT INTO `ims_yunphp_shop_plugin` VALUES (25, 29, 'sign', '积分签到', '1.0', '官方', 1, 'tool', '../addons/yunphp_shop/static/images/sign.jpg', '', 0, 0, 1);
INSERT INTO `ims_yunphp_shop_plugin` VALUES (26, 30, 'sns', 'SNS社区', '1.0', '官方', 1, 'sale', '../addons/yunphp_shop/static/images/sns.jpg', '', 0, 0, 1);
INSERT INTO `ims_yunphp_shop_plugin` VALUES (27, 33, 'wap', '全网通', '1.0', '官方', 1, 'tool', '', '', 1, 0, 1);
INSERT INTO `ims_yunphp_shop_plugin` VALUES (28, 34, 'h5app', 'H5APP', '1.0', '官方', 1, 'tool', '', '', 1, 0, 1);
INSERT INTO `ims_yunphp_shop_plugin` VALUES (29, 26, 'abonus', '区域代理', '1.0', '官方', 1, 'biz', '../addons/yunphp_shop/static/images/abonus.jpg', '', 0, 0, 1);
INSERT INTO `ims_yunphp_shop_plugin` VALUES (30, 33, 'printer', '小票打印机', '1.0', '官方', 1, 'tool', '', '', 1, 0, 1);
INSERT INTO `ims_yunphp_shop_plugin` VALUES (31, 34, 'bargain', '砍价活动', '1.0', '官方', 1, 'biz', '../addons/yunphp_shop/static/images/bargain.jpg', '', 0, 0, 1);
INSERT INTO `ims_yunphp_shop_plugin` VALUES (32, 35, 'task', '任务中心', '1.0', '官方', 1, 'sale', '../addons/yunphp_shop/static/images/task.jpg', '', 0, 0, 1);
INSERT INTO `ims_yunphp_shop_plugin` VALUES (33, 36, 'direct', '直销系统', '1.0', '官方', 0, 'biz', '../addons/yunphp_shop/static/images/direct.jpg', '', 0, 0, 0);
INSERT INTO `ims_yunphp_shop_plugin` VALUES (34, 37, 'tyiot', '物联网系统', '1.0', '官方', 1, 'biz', '../addons/yunphp_shop/static/images/tyiot.jpg', '', 0, 0, 0);
INSERT INTO `ims_yunphp_shop_plugin` VALUES (35, 36, 'cashier', '收银台', '1.0', '官方', 1, 'biz', '../addons/yunphp_shop/static/images/cashier.jpg', '', 0, 0, 1);
INSERT INTO `ims_yunphp_shop_plugin` VALUES (36, 37, 'messages', '消息群发', '1.0', '官方', 1, 'tool', '../addons/yunphp_shop/static/images/messages.jpg', '', 0, 0, 1);
INSERT INTO `ims_yunphp_shop_plugin` VALUES (37, 38, 'seckill', '整点秒杀', '1.0', '官方', 1, 'sale', '../addons/yunphp_shop/static/images/seckill.jpg', '', 0, 0, 1);
INSERT INTO `ims_yunphp_shop_plugin` VALUES (38, 38, 'exchange', '兑换中心', '1.0', '官方', 1, 'biz', '../addons/yunphp_shop/static/images/exchange.jpg', '', 0, 0, 0);
INSERT INTO `ims_yunphp_shop_plugin` VALUES (39, 37, 'assistant', '微商助手', '1.0', '官方', 1, 'tool', '../addons/yunphp_shop/static/images/assistant.jpg', '', 0, 0, 1);
INSERT INTO `ims_yunphp_shop_plugin` VALUES (40, 40, 'lottery', '游戏营销', '1.0', '官方', 1, 'biz', '../addons/yunphp_shop/static/images/lottery.jpg', '', 0, 0, 1);
INSERT INTO `ims_yunphp_shop_plugin` VALUES (41, 41, 'wxcard', '微信卡券', '1.0', '官方', 1, 'sale', '', '1', 0, 1, 0);
INSERT INTO `ims_yunphp_shop_plugin` VALUES (42, 38, 'quick', '快速购买', '1.0', '官方', 1, 'biz', '', '0', 0, 0, 0);
INSERT INTO `ims_yunphp_shop_plugin` VALUES (43, 43, 'mmanage', '手机端商家管理中心', '1.0', '官方', 1, 'tool', '', '0', 0, 1, 0);
INSERT INTO `ims_yunphp_shop_plugin` VALUES (44, 44, 'yunim', '云通信系统', '1.0', '官方', 1, 'tool', '', '0', 0, 1, 0);
INSERT INTO `ims_yunphp_shop_plugin` VALUES (45, 45, 'clubs', '俱乐部', '1.0', '官方', 1, 'biz', '', '0', 0, 0, 0);
INSERT INTO `ims_yunphp_shop_plugin` VALUES (46, 45, 'business', '企业服务', '1.0', '官方', 1, 'biz', '', '0', 0, 0, 0);

-- ----------------------------
-- Table structure for ims_yunphp_shop_polyapi_key
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_polyapi_key`;
CREATE TABLE `ims_yunphp_shop_polyapi_key`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT 0,
  `merchid` int(11) NOT NULL DEFAULT 0,
  `appkey` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `token` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `appsecret` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `createtime` int(11) NOT NULL DEFAULT 0,
  `updatetime` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_appkey`(`appkey`) USING BTREE,
  INDEX `idx_token`(`token`) USING BTREE,
  INDEX `idx_appsecret`(`appsecret`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_poster
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_poster`;
CREATE TABLE `ims_yunphp_shop_poster`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `type` tinyint(3) NULL DEFAULT 0 COMMENT '1 首页 2 小店 3 商城 4 自定义',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `bg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `data` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `keyword` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `times` int(11) NULL DEFAULT 0,
  `follows` int(11) NULL DEFAULT 0,
  `isdefault` tinyint(3) NULL DEFAULT 0,
  `resptitle` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `respthumb` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `createtime` int(11) NULL DEFAULT 0,
  `respdesc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `respurl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `waittext` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `oktext` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `subcredit` int(11) NULL DEFAULT 0,
  `submoney` decimal(10, 2) NULL DEFAULT 0.00,
  `reccredit` int(11) NULL DEFAULT 0,
  `recmoney` decimal(10, 2) NULL DEFAULT 0.00,
  `paytype` tinyint(1) NOT NULL DEFAULT 0,
  `scantext` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `subtext` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `beagent` tinyint(3) NULL DEFAULT 0,
  `bedown` tinyint(3) NULL DEFAULT 0,
  `isopen` tinyint(3) NULL DEFAULT 0,
  `opentext` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `openurl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `templateid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `subpaycontent` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `recpaycontent` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `entrytext` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `reccouponid` int(11) NULL DEFAULT 0,
  `reccouponnum` int(11) NULL DEFAULT 0,
  `subcouponid` int(11) NULL DEFAULT 0,
  `subcouponnum` int(11) NULL DEFAULT 0,
  `resptype` tinyint(3) NULL DEFAULT 0,
  `resptext` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `keyword2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `resptext11` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `reward_totle` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_type`(`type`) USING BTREE,
  INDEX `idx_times`(`times`) USING BTREE,
  INDEX `idx_isdefault`(`isdefault`) USING BTREE,
  INDEX `idx_createtime`(`createtime`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_poster_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_poster_log`;
CREATE TABLE `ims_yunphp_shop_poster_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `openid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `posterid` int(11) NULL DEFAULT 0,
  `from_openid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `subcredit` int(11) NULL DEFAULT 0,
  `submoney` decimal(10, 2) NULL DEFAULT 0.00,
  `reccredit` int(11) NULL DEFAULT 0,
  `recmoney` decimal(10, 2) NULL DEFAULT 0.00,
  `createtime` int(11) NULL DEFAULT 0,
  `reccouponid` int(11) NULL DEFAULT 0,
  `reccouponnum` int(11) NULL DEFAULT 0,
  `subcouponid` int(11) NULL DEFAULT 0,
  `subcouponnum` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_openid`(`openid`) USING BTREE,
  INDEX `idx_createtime`(`createtime`) USING BTREE,
  INDEX `idx_posterid`(`posterid`) USING BTREE,
  INDEX `idx_from_openid`(`from_openid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_poster_qr
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_poster_qr`;
CREATE TABLE `ims_yunphp_shop_poster_qr`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `acid` int(10) UNSIGNED NOT NULL,
  `openid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `type` tinyint(3) NULL DEFAULT 0,
  `sceneid` int(11) NULL DEFAULT 0,
  `mediaid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `ticket` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `url` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `createtime` int(10) UNSIGNED NOT NULL,
  `goodsid` int(11) NULL DEFAULT 0,
  `qrimg` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `scenestr` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `posterid` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_acid`(`acid`) USING BTREE,
  INDEX `idx_sceneid`(`sceneid`) USING BTREE,
  INDEX `idx_type`(`type`) USING BTREE,
  INDEX `idx_openid`(`openid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_poster_scan
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_poster_scan`;
CREATE TABLE `ims_yunphp_shop_poster_scan`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `posterid` int(11) NULL DEFAULT 0,
  `openid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `from_openid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `scantime` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_posterid`(`posterid`) USING BTREE,
  INDEX `idx_scantime`(`scantime`) USING BTREE,
  INDEX `idx_openid`(`openid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 31 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_postera
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_postera`;
CREATE TABLE `ims_yunphp_shop_postera`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `type` tinyint(3) NULL DEFAULT 0 COMMENT '1 首页 2 小店 3 商城 4 自定义',
  `days` int(11) NULL DEFAULT 0,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `bg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `data` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `keyword` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `isdefault` tinyint(3) NULL DEFAULT 0,
  `resptitle` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `respthumb` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `createtime` int(11) NULL DEFAULT 0,
  `respdesc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `respurl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `waittext` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `oktext` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `subcredit` int(11) NULL DEFAULT 0,
  `submoney` decimal(10, 2) NULL DEFAULT 0.00,
  `reccredit` int(11) NULL DEFAULT 0,
  `recmoney` decimal(10, 2) NULL DEFAULT 0.00,
  `scantext` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `subtext` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `beagent` tinyint(3) NULL DEFAULT 0,
  `bedown` tinyint(3) NULL DEFAULT 0,
  `isopen` tinyint(3) NULL DEFAULT 0,
  `opentext` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `openurl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `paytype` tinyint(1) NOT NULL DEFAULT 0,
  `subpaycontent` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `recpaycontent` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `templateid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `entrytext` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `reccouponid` int(11) NULL DEFAULT 0,
  `reccouponnum` int(11) NULL DEFAULT 0,
  `subcouponid` int(11) NULL DEFAULT 0,
  `subcouponnum` int(11) NULL DEFAULT 0,
  `timestart` int(11) NULL DEFAULT 0,
  `timeend` int(11) NULL DEFAULT 0,
  `status` tinyint(3) NULL DEFAULT 0,
  `goodsid` int(11) NULL DEFAULT 0,
  `starttext` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `endtext` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `resptype` tinyint(3) NULL DEFAULT 0,
  `resptext` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `testflag` tinyint(1) NULL DEFAULT 0,
  `keyword2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `reward_totle` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_type`(`type`) USING BTREE,
  INDEX `idx_isdefault`(`isdefault`) USING BTREE,
  INDEX `idx_createtime`(`createtime`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_postera_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_postera_log`;
CREATE TABLE `ims_yunphp_shop_postera_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `openid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `posterid` int(11) NULL DEFAULT 0,
  `from_openid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `subcredit` int(11) NULL DEFAULT 0,
  `submoney` decimal(10, 2) NULL DEFAULT 0.00,
  `reccredit` int(11) NULL DEFAULT 0,
  `recmoney` decimal(10, 2) NULL DEFAULT 0.00,
  `createtime` int(11) NULL DEFAULT 0,
  `reccouponid` int(11) NULL DEFAULT 0,
  `reccouponnum` int(11) NULL DEFAULT 0,
  `subcouponid` int(11) NULL DEFAULT 0,
  `subcouponnum` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_openid`(`openid`) USING BTREE,
  INDEX `idx_createtime`(`createtime`) USING BTREE,
  INDEX `idx_posteraid`(`posterid`) USING BTREE,
  INDEX `idx_from_openid`(`from_openid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_postera_qr
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_postera_qr`;
CREATE TABLE `ims_yunphp_shop_postera_qr`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `acid` int(10) UNSIGNED NOT NULL,
  `openid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `posterid` int(11) NULL DEFAULT 0,
  `type` tinyint(3) NULL DEFAULT 0,
  `sceneid` int(11) NULL DEFAULT 0,
  `mediaid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `ticket` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `url` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `createtime` int(10) UNSIGNED NOT NULL,
  `goodsid` int(11) NULL DEFAULT 0,
  `qrimg` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `expire` int(11) NULL DEFAULT 0,
  `endtime` int(11) NULL DEFAULT 0,
  `qrtime` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_acid`(`acid`) USING BTREE,
  INDEX `idx_sceneid`(`sceneid`) USING BTREE,
  INDEX `idx_type`(`type`) USING BTREE,
  INDEX `idx_posterid`(`posterid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_qa_adv
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_qa_adv`;
CREATE TABLE `ims_yunphp_shop_qa_adv`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `advname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `link` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `thumb` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `displayorder` int(11) NULL DEFAULT 0,
  `enabled` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_enabled`(`enabled`) USING BTREE,
  INDEX `idx_displayorder`(`displayorder`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_qa_category
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_qa_category`;
CREATE TABLE `ims_yunphp_shop_qa_category`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `thumb` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `displayorder` tinyint(3) UNSIGNED NULL DEFAULT 0,
  `enabled` tinyint(1) NULL DEFAULT 1,
  `isrecommand` tinyint(3) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_displayorder`(`displayorder`) USING BTREE,
  INDEX `idx_enabled`(`enabled`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_qa_question
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_qa_question`;
CREATE TABLE `ims_yunphp_shop_qa_question`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT 0,
  `cate` int(11) NOT NULL DEFAULT 0,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `keywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `content` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` tinyint(3) NOT NULL DEFAULT 0,
  `isrecommand` tinyint(3) NOT NULL DEFAULT 0,
  `displayorder` int(11) NOT NULL DEFAULT 0,
  `createtime` int(11) NOT NULL DEFAULT 0,
  `lastedittime` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_status`(`status`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_qa_set
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_qa_set`;
CREATE TABLE `ims_yunphp_shop_qa_set`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT 0,
  `showmember` tinyint(3) NOT NULL DEFAULT 0,
  `showtype` tinyint(3) NOT NULL DEFAULT 0,
  `keyword` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `enter_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `enter_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `enter_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `share` tinyint(3) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_unaicid`(`uniacid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_quick
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_quick`;
CREATE TABLE `ims_yunphp_shop_quick`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `keyword` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `datas` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `cart` tinyint(3) NOT NULL DEFAULT 0,
  `createtime` int(11) NULL DEFAULT NULL,
  `lasttime` int(11) NULL DEFAULT NULL,
  `share_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `share_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `share_icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `enter_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `enter_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `enter_icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` tinyint(3) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_quick_adv
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_quick_adv`;
CREATE TABLE `ims_yunphp_shop_quick_adv`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `merchid` int(11) NOT NULL DEFAULT 0,
  `advname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `link` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `thumb` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `displayorder` int(11) NULL DEFAULT 0,
  `enabled` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_enabled`(`enabled`) USING BTREE,
  INDEX `idx_displayorder`(`displayorder`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_quick_cart
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_quick_cart`;
CREATE TABLE `ims_yunphp_shop_quick_cart`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT 0,
  `quickid` int(11) NOT NULL DEFAULT 0,
  `openid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `goodsid` int(11) NULL DEFAULT 0,
  `total` int(11) NULL DEFAULT 0,
  `marketprice` decimal(10, 2) NULL DEFAULT 0.00,
  `deleted` tinyint(1) NULL DEFAULT 0,
  `optionid` int(11) NULL DEFAULT 0,
  `createtime` int(11) NULL DEFAULT 0,
  `diyformdataid` int(11) NULL DEFAULT NULL,
  `diyformdata` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `diyformfields` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `diyformid` int(11) NULL DEFAULT 0,
  `selected` tinyint(1) NULL DEFAULT 1,
  `merchid` int(11) NULL DEFAULT 0,
  `selectedadd` tinyint(1) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_goodsid`(`goodsid`) USING BTREE,
  INDEX `idx_openid`(`openid`) USING BTREE,
  INDEX `idx_deleted`(`deleted`) USING BTREE,
  INDEX `idx_merchid`(`merchid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_receive
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_receive`;
CREATE TABLE `ims_yunphp_shop_receive`  (
  `id` int(11) NOT NULL,
  `uniacid` int(11) NULL DEFAULT NULL,
  `enough` decimal(10, 2) NULL DEFAULT 0.00,
  `couponid` int(11) NULL DEFAULT 0,
  `starttime` int(11) NULL DEFAULT 0,
  `endtime` int(11) NULL DEFAULT 0,
  `sendnum` int(11) NULL DEFAULT 1,
  `num` int(11) NULL DEFAULT 0,
  `sendpoint` tinyint(1) NULL DEFAULT 0,
  `status` tinyint(1) NULL DEFAULT 0,
  `merchid` int(11) NOT NULL DEFAULT 0,
  `displayorder` int(11) NULL DEFAULT 0,
  `taskname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `reward_data` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tasktype` tinyint(1) NOT NULL DEFAULT 0,
  `createtime` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_unaicid`(`uniacid`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_receive_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_receive_log`;
CREATE TABLE `ims_yunphp_shop_receive_log`  (
  `id` int(11) NOT NULL,
  `uniacid` int(11) NULL DEFAULT NULL,
  `openid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `receiveid` int(11) NULL DEFAULT 0,
  `couponid` int(11) NULL DEFAULT 0,
  `sendnum` int(11) NULL DEFAULT 0,
  `tasktype` tinyint(1) NULL DEFAULT 0,
  `orderid` int(11) NULL DEFAULT 0,
  `parentorderid` int(11) NULL DEFAULT 0,
  `createtime` int(11) NULL DEFAULT 0,
  `status` tinyint(1) NULL DEFAULT 0,
  `sendpoint` tinyint(1) NULL DEFAULT 0,
  `subdata` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `recdata` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_unaicid`(`uniacid`) USING BTREE,
  INDEX `idx_openid`(`openid`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_refund_address
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_refund_address`;
CREATE TABLE `ims_yunphp_shop_refund_address`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `title` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `tel` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `mobile` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `province` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `city` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `area` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `address` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `isdefault` tinyint(1) NULL DEFAULT 0,
  `zipcode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `deleted` tinyint(1) NULL DEFAULT 0,
  `openid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0',
  `merchid` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_openid`(`openid`) USING BTREE,
  INDEX `idx_isdefault`(`isdefault`) USING BTREE,
  INDEX `idx_deleted`(`deleted`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_sale_coupon
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_sale_coupon`;
CREATE TABLE `ims_yunphp_shop_sale_coupon`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `type` tinyint(3) NULL DEFAULT 0,
  `ckey` decimal(10, 2) NULL DEFAULT 0.00,
  `cvalue` decimal(10, 2) NULL DEFAULT 0.00,
  `nums` int(11) NULL DEFAULT 0,
  `createtime` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_createtime`(`createtime`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_sale_coupon_data
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_sale_coupon_data`;
CREATE TABLE `ims_yunphp_shop_sale_coupon_data`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `openid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `couponid` int(11) NULL DEFAULT 0,
  `gettime` int(11) NULL DEFAULT 0,
  `gettype` tinyint(3) NULL DEFAULT 0,
  `usedtime` int(11) NULL DEFAULT 0,
  `orderid` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_couponid`(`couponid`) USING BTREE,
  INDEX `idx_gettime`(`gettime`) USING BTREE,
  INDEX `idx_gettype`(`gettype`) USING BTREE,
  INDEX `idx_usedtime`(`usedtime`) USING BTREE,
  INDEX `idx_orderid`(`orderid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_saler
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_saler`;
CREATE TABLE `ims_yunphp_shop_saler`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `storeid` int(11) NULL DEFAULT 0,
  `uniacid` int(11) NULL DEFAULT 0,
  `openid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `status` tinyint(3) NULL DEFAULT 0,
  `salername` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_storeid`(`storeid`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_seckill_adv
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_seckill_adv`;
CREATE TABLE `ims_yunphp_shop_seckill_adv`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `advname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `link` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `thumb` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `displayorder` int(11) NULL DEFAULT 0,
  `enabled` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_displayorder`(`displayorder`) USING BTREE,
  INDEX `idx_enabled`(`enabled`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_seckill_category
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_seckill_category`;
CREATE TABLE `ims_yunphp_shop_seckill_category`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_seckill_task
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_seckill_task`;
CREATE TABLE `ims_yunphp_shop_seckill_task`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `cateid` int(11) NULL DEFAULT 0,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `enabled` tinyint(3) NULL DEFAULT 0,
  `page_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `share_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `share_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `share_icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `tag` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `closesec` int(11) NULL DEFAULT 0,
  `oldshow` tinyint(3) NULL DEFAULT 0,
  `times` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `createtime` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_status`(`enabled`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_seckill_task_goods
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_seckill_task_goods`;
CREATE TABLE `ims_yunphp_shop_seckill_task_goods`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `displayorder` int(11) NULL DEFAULT 0,
  `taskid` int(11) NULL DEFAULT 0,
  `roomid` int(11) NULL DEFAULT 0,
  `timeid` int(11) NULL DEFAULT 0,
  `goodsid` int(11) NULL DEFAULT 0,
  `optionid` int(11) NULL DEFAULT 0,
  `price` decimal(10, 2) NULL DEFAULT 0.00,
  `total` int(11) NULL DEFAULT 0,
  `maxbuy` int(11) NULL DEFAULT 0,
  `totalmaxbuy` int(11) NULL DEFAULT 0,
  `commission1` decimal(10, 2) NULL DEFAULT 0.00,
  `commission2` decimal(10, 2) NULL DEFAULT 0.00,
  `commission3` decimal(10, 2) NULL DEFAULT 0.00,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_goodsid`(`goodsid`) USING BTREE,
  INDEX `idx_optionid`(`optionid`) USING BTREE,
  INDEX `idx_displayorder`(`displayorder`) USING BTREE,
  INDEX `idx_taskid`(`taskid`) USING BTREE,
  INDEX `idx_roomid`(`roomid`) USING BTREE,
  INDEX `idx_time`(`timeid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for ims_yunphp_shop_seckill_task_room
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_seckill_task_room`;
CREATE TABLE `ims_yunphp_shop_seckill_task_room`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `displayorder` int(11) NULL DEFAULT 0,
  `taskid` int(11) NULL DEFAULT 0,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `enabled` tinyint(3) NULL DEFAULT 0,
  `page_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `share_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `share_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `share_icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `oldshow` tinyint(3) NULL DEFAULT 0,
  `tag` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `createtime` int(11) NULL DEFAULT 0,
  `diypage` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_taskid`(`taskid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_seckill_task_time
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_seckill_task_time`;
CREATE TABLE `ims_yunphp_shop_seckill_task_time`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `taskid` int(11) NULL DEFAULT 0,
  `time` tinyint(3) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for ims_yunphp_shop_sign_records
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_sign_records`;
CREATE TABLE `ims_yunphp_shop_sign_records`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT 0,
  `time` int(11) NOT NULL DEFAULT 0,
  `openid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `credit` int(11) NOT NULL DEFAULT 0,
  `log` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `type` tinyint(3) NOT NULL DEFAULT 0,
  `day` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_time`(`time`) USING BTREE,
  INDEX `idx_type`(`type`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 602 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_sign_set
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_sign_set`;
CREATE TABLE `ims_yunphp_shop_sign_set`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT 0,
  `iscenter` tinyint(3) NOT NULL DEFAULT 0,
  `iscreditshop` tinyint(3) NOT NULL DEFAULT 0,
  `keyword` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `thumb` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `isopen` tinyint(3) NOT NULL DEFAULT 0,
  `signold` tinyint(3) NOT NULL DEFAULT 0,
  `signold_price` int(11) NOT NULL DEFAULT 0,
  `signold_type` tinyint(3) NOT NULL DEFAULT 0,
  `textsign` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `textsignold` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `textsigned` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `textsignforget` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `maincolor` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `cycle` tinyint(3) NOT NULL DEFAULT 0,
  `reward_default_first` int(11) NOT NULL DEFAULT 0,
  `reward_default_day` int(11) NOT NULL DEFAULT 0,
  `reword_order` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `reword_sum` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `reword_special` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sign_rule` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `share` tinyint(3) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_sign_user
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_sign_user`;
CREATE TABLE `ims_yunphp_shop_sign_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT 0,
  `openid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `order` int(11) NOT NULL DEFAULT 0,
  `orderday` int(11) NOT NULL DEFAULT 0,
  `sum` int(11) NOT NULL DEFAULT 0,
  `signdate` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 146 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_sms
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_sms`;
CREATE TABLE `ims_yunphp_shop_sms`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT 0,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `template` tinyint(3) NOT NULL DEFAULT 0,
  `smstplid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `smssign` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `content` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `data` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` tinyint(3) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_sms_set
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_sms_set`;
CREATE TABLE `ims_yunphp_shop_sms_set`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT 0,
  `juhe` tinyint(3) NOT NULL DEFAULT 0,
  `juhe_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `dayu` tinyint(3) NOT NULL DEFAULT 0,
  `dayu_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `dayu_secret` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `emay` tinyint(3) NOT NULL DEFAULT 0,
  `emay_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `emay_sn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `emay_pw` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `emay_sk` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `emay_phost` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `emay_pport` int(11) NOT NULL DEFAULT 0,
  `emay_puser` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `emay_ppw` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `emay_out` int(11) NOT NULL DEFAULT 0,
  `emay_outresp` int(11) NOT NULL DEFAULT 30,
  `emay_warn` decimal(10, 2) NOT NULL DEFAULT 0.00,
  `emay_mobile` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `emay_warn_time` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_sns_adv
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_sns_adv`;
CREATE TABLE `ims_yunphp_shop_sns_adv`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `advname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `link` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `thumb` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `displayorder` int(11) NULL DEFAULT 0,
  `enabled` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_enabled`(`enabled`) USING BTREE,
  INDEX `idx_displayorder`(`displayorder`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_sns_board
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_sns_board`;
CREATE TABLE `ims_yunphp_shop_sns_board`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `cid` int(11) NULL DEFAULT 0,
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `displayorder` int(11) NULL DEFAULT 0,
  `enabled` int(11) NULL DEFAULT 0,
  `showgroups` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `showlevels` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `postgroups` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `postlevels` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `showagentlevels` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `postagentlevels` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `postcredit` int(11) NULL DEFAULT 0,
  `replycredit` int(11) NULL DEFAULT 0,
  `bestcredit` int(11) NULL DEFAULT 0,
  `bestboardcredit` int(11) NULL DEFAULT 0,
  `notagent` tinyint(3) NULL DEFAULT 0,
  `notagentpost` tinyint(3) NULL DEFAULT 0,
  `topcredit` int(11) NULL DEFAULT 0,
  `topboardcredit` int(11) NULL DEFAULT 0,
  `status` tinyint(3) NULL DEFAULT 0,
  `noimage` tinyint(3) NULL DEFAULT 0,
  `novoice` tinyint(3) NULL DEFAULT 0,
  `needfollow` tinyint(3) NULL DEFAULT 0,
  `needpostfollow` tinyint(3) NULL DEFAULT 0,
  `share_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `share_icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `share_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `keyword` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `isrecommand` tinyint(3) NULL DEFAULT 0,
  `banner` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `needcheck` tinyint(3) NULL DEFAULT 0,
  `needcheckmanager` tinyint(3) NULL DEFAULT 0,
  `needcheckreply` int(11) NULL DEFAULT 0,
  `needcheckreplymanager` int(11) NULL DEFAULT 0,
  `showsnslevels` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `postsnslevels` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `showpartnerlevels` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `postpartnerlevels` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `notpartner` tinyint(3) NULL DEFAULT 0,
  `notpartnerpost` tinyint(3) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_enabled`(`enabled`) USING BTREE,
  INDEX `idx_displayorder`(`displayorder`) USING BTREE,
  INDEX `idx_cid`(`cid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_sns_board_follow
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_sns_board_follow`;
CREATE TABLE `ims_yunphp_shop_sns_board_follow`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `bid` int(11) NULL DEFAULT 0,
  `openid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createtime` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_bid`(`bid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_sns_category
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_sns_category`;
CREATE TABLE `ims_yunphp_shop_sns_category`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `thumb` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `displayorder` tinyint(3) UNSIGNED NULL DEFAULT 0,
  `enabled` tinyint(1) NULL DEFAULT 1,
  `advimg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `advurl` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `isrecommand` tinyint(3) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_enabled`(`enabled`) USING BTREE,
  INDEX `idx_isrecommand`(`isrecommand`) USING BTREE,
  INDEX `idx_displayorder`(`displayorder`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_sns_complain
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_sns_complain`;
CREATE TABLE `ims_yunphp_shop_sns_complain`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT 0,
  `type` tinyint(3) NOT NULL,
  `postsid` int(11) NOT NULL DEFAULT 0,
  `defendant` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `complainant` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `complaint_type` int(10) NOT NULL DEFAULT 0,
  `complaint_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `images` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `createtime` int(11) NOT NULL DEFAULT 0,
  `checkedtime` int(11) NOT NULL DEFAULT 0,
  `checked` tinyint(3) NOT NULL DEFAULT 0,
  `checked_note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `deleted` tinyint(3) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_sns_complaincate
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_sns_complaincate`;
CREATE TABLE `ims_yunphp_shop_sns_complaincate`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` tinyint(3) NOT NULL DEFAULT 0,
  `displayorder` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_sns_level
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_sns_level`;
CREATE TABLE `ims_yunphp_shop_sns_level`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `levelname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `credit` int(11) NULL DEFAULT 0,
  `enabled` tinyint(3) NULL DEFAULT 0,
  `post` int(11) NULL DEFAULT 0,
  `color` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `bg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_enabled`(`enabled`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_sns_like
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_sns_like`;
CREATE TABLE `ims_yunphp_shop_sns_like`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `openid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `pid` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_pid`(`pid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_sns_manage
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_sns_manage`;
CREATE TABLE `ims_yunphp_shop_sns_manage`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `bid` int(11) NULL DEFAULT 0,
  `openid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `enabled` tinyint(3) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_bid`(`bid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_sns_member
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_sns_member`;
CREATE TABLE `ims_yunphp_shop_sns_member`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `openid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `level` int(11) NULL DEFAULT 0,
  `createtime` int(11) NULL DEFAULT 0,
  `credit` int(11) NULL DEFAULT 0,
  `sign` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `isblack` tinyint(3) NULL DEFAULT 0,
  `notupgrade` tinyint(3) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_sns_post
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_sns_post`;
CREATE TABLE `ims_yunphp_shop_sns_post`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `bid` int(11) NULL DEFAULT 0,
  `pid` int(11) NULL DEFAULT 0,
  `rpid` int(11) NULL DEFAULT 0,
  `openid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `nickname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `images` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `voice` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createtime` int(11) NULL DEFAULT 0,
  `replytime` int(11) NULL DEFAULT 0,
  `credit` int(11) NULL DEFAULT 0,
  `views` int(11) NULL DEFAULT 0,
  `islock` tinyint(1) NULL DEFAULT 0,
  `istop` tinyint(1) NULL DEFAULT 0,
  `isboardtop` tinyint(1) NULL DEFAULT 0,
  `isbest` tinyint(1) NULL DEFAULT 0,
  `isboardbest` tinyint(3) NULL DEFAULT 0,
  `deleted` tinyint(3) NULL DEFAULT 0,
  `deletedtime` int(11) NULL DEFAULT 0,
  `checked` tinyint(3) NULL DEFAULT NULL,
  `checktime` int(11) NULL DEFAULT 0,
  `isadmin` tinyint(3) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_bid`(`bid`) USING BTREE,
  INDEX `idx_pid`(`pid`) USING BTREE,
  INDEX `idx_createtime`(`createtime`) USING BTREE,
  INDEX `idx_islock`(`islock`) USING BTREE,
  INDEX `idx_istop`(`istop`) USING BTREE,
  INDEX `idx_isboardtop`(`isboardtop`) USING BTREE,
  INDEX `idx_isbest`(`isbest`) USING BTREE,
  INDEX `idx_deleted`(`deleted`) USING BTREE,
  INDEX `idx_deletetime`(`deletedtime`) USING BTREE,
  INDEX `idx_checked`(`checked`) USING BTREE,
  INDEX `idx_rpid`(`rpid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_store
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_store`;
CREATE TABLE `ims_yunphp_shop_store`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `storename` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `tel` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `lat` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `lng` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `status` tinyint(3) NULL DEFAULT 0,
  `realname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `mobile` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `fetchtime` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `type` tinyint(1) NULL DEFAULT 0,
  `logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `saletime` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `desc` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `displayorder` int(11) NULL DEFAULT 0,
  `order_printer` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `order_template` int(11) NULL DEFAULT 0,
  `ordertype` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_status`(`status`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_sysset
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_sysset`;
CREATE TABLE `ims_yunphp_shop_sysset`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `sets` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `plugins` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `sec` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_system_adv
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_system_adv`;
CREATE TABLE `ims_yunphp_shop_system_adv`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `thumb` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `createtime` int(11) NULL DEFAULT 0,
  `displayorder` int(11) NULL DEFAULT 0,
  `module` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `status` tinyint(3) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_system_article
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_system_article`;
CREATE TABLE `ims_yunphp_shop_system_article`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `author` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `thumb` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `createtime` int(11) NULL DEFAULT 0,
  `displayorder` int(11) NULL DEFAULT 0,
  `cate` int(11) NULL DEFAULT 0,
  `status` tinyint(3) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_system_banner
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_system_banner`;
CREATE TABLE `ims_yunphp_shop_system_banner`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `thumb` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `createtime` int(11) NULL DEFAULT 0,
  `displayorder` int(11) NULL DEFAULT 0,
  `status` tinyint(3) NULL DEFAULT 0,
  `background` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_system_case
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_system_case`;
CREATE TABLE `ims_yunphp_shop_system_case`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `thumb` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `qr` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `displayorder` int(11) NULL DEFAULT 0,
  `status` tinyint(3) NULL DEFAULT 0,
  `cate` int(11) NULL DEFAULT 0,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_system_casecategory
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_system_casecategory`;
CREATE TABLE `ims_yunphp_shop_system_casecategory`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `displayorder` int(11) NULL DEFAULT 0,
  `status` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_system_category
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_system_category`;
CREATE TABLE `ims_yunphp_shop_system_category`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `displayorder` int(11) NULL DEFAULT 0,
  `status` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_system_company_article
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_system_company_article`;
CREATE TABLE `ims_yunphp_shop_system_company_article`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `author` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `thumb` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `createtime` int(11) NULL DEFAULT 0,
  `displayorder` int(11) NULL DEFAULT 0,
  `cate` int(11) NULL DEFAULT 0,
  `status` tinyint(3) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_system_company_category
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_system_company_category`;
CREATE TABLE `ims_yunphp_shop_system_company_category`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `displayorder` int(11) NULL DEFAULT 0,
  `status` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_system_copyright
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_system_copyright`;
CREATE TABLE `ims_yunphp_shop_system_copyright`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT NULL,
  `copyright` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `bgcolor` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `ismanage` tinyint(3) NULL DEFAULT 0,
  `logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_system_copyright_notice
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_system_copyright_notice`;
CREATE TABLE `ims_yunphp_shop_system_copyright_notice`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `author` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `createtime` int(11) NULL DEFAULT 0,
  `displayorder` int(11) NULL DEFAULT 0,
  `status` tinyint(3) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_system_guestbook
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_system_guestbook`;
CREATE TABLE `ims_yunphp_shop_system_guestbook`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `nickname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `createtime` int(11) NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `clientip` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `mobile` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_system_link
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_system_link`;
CREATE TABLE `ims_yunphp_shop_system_link`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `thumb` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `displayorder` int(11) NULL DEFAULT NULL,
  `status` tinyint(3) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_system_setting
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_system_setting`;
CREATE TABLE `ims_yunphp_shop_system_setting`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) NULL DEFAULT NULL,
  `background` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `casebanner` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `contact` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_system_site
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_system_site`;
CREATE TABLE `ims_yunphp_shop_system_site`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_task
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_task`;
CREATE TABLE `ims_yunphp_shop_task`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `type` int(11) NOT NULL,
  `starttime` int(11) NOT NULL,
  `endtime` int(11) NOT NULL,
  `dotime` int(11) NOT NULL DEFAULT 0,
  `donetime` int(11) NOT NULL DEFAULT 0,
  `timelimit` float(11, 1) NOT NULL,
  `keyword` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `explain` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `require_data` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `reward_data` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `period` int(11) NOT NULL DEFAULT 0,
  `repeat` int(11) NOT NULL DEFAULT 0,
  `maxtimes` int(11) NOT NULL DEFAULT 0,
  `everyhours` float(11, 1) NOT NULL DEFAULT 0.0,
  `logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_task_adv
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_task_adv`;
CREATE TABLE `ims_yunphp_shop_task_adv`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `advname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `link` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `thumb` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `displayorder` int(11) NULL DEFAULT 0,
  `enabled` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_task_default
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_task_default`;
CREATE TABLE `ims_yunphp_shop_task_default`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT 0,
  `data` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `addtime` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_task_extension
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_task_extension`;
CREATE TABLE `ims_yunphp_shop_task_extension`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `taskname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `taskclass` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `classify` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `classify_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `verb` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `unit` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ims_yunphp_shop_task_extension
-- ----------------------------
INSERT INTO `ims_yunphp_shop_task_extension` VALUES (1, '推荐人数', 'commission_member', 1, 'number', 'number', '推荐', '人');
INSERT INTO `ims_yunphp_shop_task_extension` VALUES (2, '分销佣金', 'commission_money', 1, 'number', 'number', '达到', '元');
INSERT INTO `ims_yunphp_shop_task_extension` VALUES (3, '分销订单', 'commission_order', 1, 'number', 'number', '达到', '笔');
INSERT INTO `ims_yunphp_shop_task_extension` VALUES (4, '订单满额', 'cost_enough', 1, 'number', 'number', '满', '元');
INSERT INTO `ims_yunphp_shop_task_extension` VALUES (5, '累计金额', 'cost_total', 1, 'number', 'number', '累计', '元');
INSERT INTO `ims_yunphp_shop_task_extension` VALUES (6, '订单数量', 'cost_count', 1, 'number', 'number', '达到', '单');
INSERT INTO `ims_yunphp_shop_task_extension` VALUES (7, '指定商品', 'cost_goods', 1, 'select', 'select', '购买指定商品', '件');
INSERT INTO `ims_yunphp_shop_task_extension` VALUES (8, '商品评价', 'cost_comment', 1, 'number', 'number', '评价订单', '次');
INSERT INTO `ims_yunphp_shop_task_extension` VALUES (9, '累计充值', 'cost_rechargetotal', 1, 'number', 'number', '达到', '元');
INSERT INTO `ims_yunphp_shop_task_extension` VALUES (10, '充值满额', 'cost_rechargeenough', 1, 'number', 'number', '满', '元');
INSERT INTO `ims_yunphp_shop_task_extension` VALUES (11, '完善信息', 'member_info', 1, 'boole', 'boole', '填写手机号', '');

-- ----------------------------
-- Table structure for ims_yunphp_shop_task_extension_join
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_task_extension_join`;
CREATE TABLE `ims_yunphp_shop_task_extension_join`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `uid` int(11) NOT NULL,
  `taskid` int(11) NOT NULL,
  `openid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `require_data` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `progress_data` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `reward_data` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `completetime` int(11) NOT NULL DEFAULT 0,
  `pickuptime` int(11) NOT NULL,
  `endtime` int(11) NOT NULL,
  `dotime` int(11) NOT NULL DEFAULT 0,
  `rewarded` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_task_join
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_task_join`;
CREATE TABLE `ims_yunphp_shop_task_join`  (
  `join_id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT 0,
  `join_user` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `task_id` int(11) NOT NULL DEFAULT 0,
  `task_type` tinyint(1) NOT NULL DEFAULT 0,
  `needcount` int(11) NOT NULL DEFAULT 0,
  `completecount` int(11) NOT NULL DEFAULT 0,
  `reward_data` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `is_reward` tinyint(1) NOT NULL DEFAULT 0,
  `failtime` int(11) NOT NULL DEFAULT 0,
  `addtime` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`join_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_task_joiner
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_task_joiner`;
CREATE TABLE `ims_yunphp_shop_task_joiner`  (
  `complete_id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT 0,
  `task_user` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `joiner_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `join_id` int(11) NOT NULL DEFAULT 0,
  `task_id` int(11) NOT NULL DEFAULT 0,
  `task_type` tinyint(1) NOT NULL DEFAULT 0,
  `join_status` tinyint(1) NOT NULL DEFAULT 1,
  `addtime` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`complete_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_task_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_task_log`;
CREATE TABLE `ims_yunphp_shop_task_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT 0,
  `openid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `from_openid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `join_id` int(11) NOT NULL DEFAULT 0,
  `taskid` int(11) NULL DEFAULT 0,
  `task_type` tinyint(1) NOT NULL DEFAULT 0,
  `subdata` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `recdata` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `createtime` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_task_poster
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_task_poster`;
CREATE TABLE `ims_yunphp_shop_task_poster`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT NULL,
  `days` int(11) NOT NULL DEFAULT 0,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `data` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `keyword` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `resptype` tinyint(1) NOT NULL DEFAULT 0,
  `resptext` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `resptitle` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `respthumb` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `respdesc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `respurl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createtime` int(11) NULL DEFAULT NULL,
  `waittext` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `oktext` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `scantext` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `beagent` tinyint(1) NOT NULL DEFAULT 0,
  `bedown` tinyint(1) NOT NULL DEFAULT 0,
  `timestart` int(11) NULL DEFAULT NULL,
  `timeend` int(11) NULL DEFAULT NULL,
  `is_repeat` tinyint(1) NULL DEFAULT 0,
  `getposter` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT NULL,
  `starttext` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `endtext` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `reward_data` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `needcount` int(11) NOT NULL DEFAULT 0,
  `is_delete` tinyint(1) NOT NULL DEFAULT 0,
  `poster_type` tinyint(1) NULL DEFAULT 1,
  `reward_days` int(11) NULL DEFAULT 0,
  `titleicon` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `poster_banner` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `is_goods` tinyint(1) NULL DEFAULT 0,
  `autoposter` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_task_poster_qr
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_task_poster_qr`;
CREATE TABLE `ims_yunphp_shop_task_poster_qr`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `acid` int(11) NOT NULL DEFAULT 0,
  `openid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `posterid` int(11) NOT NULL DEFAULT 0,
  `type` tinyint(1) NOT NULL DEFAULT 0,
  `sceneid` int(11) NOT NULL DEFAULT 0,
  `mediaid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ticket` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `createtime` int(11) NULL DEFAULT NULL,
  `qrimg` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `expire` int(11) NULL DEFAULT NULL,
  `endtime` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_virtual_category
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_virtual_category`;
CREATE TABLE `ims_yunphp_shop_virtual_category`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0 COMMENT '所属帐号',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类名称',
  `merchid` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_virtual_data
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_virtual_data`;
CREATE TABLE `ims_yunphp_shop_virtual_data`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT 0,
  `typeid` int(11) NOT NULL DEFAULT 0 COMMENT '类型id',
  `pvalue` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '主键键值',
  `fields` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字符集',
  `openid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '使用者openid',
  `usetime` int(11) NOT NULL DEFAULT 0 COMMENT '使用时间',
  `orderid` int(11) NULL DEFAULT 0,
  `ordersn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `price` decimal(10, 2) NULL DEFAULT 0.00,
  `merchid` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_typeid`(`typeid`) USING BTREE,
  INDEX `idx_usetime`(`usetime`) USING BTREE,
  INDEX `idx_orderid`(`orderid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1001 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_virtual_type
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_virtual_type`;
CREATE TABLE `ims_yunphp_shop_virtual_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT 0,
  `cate` int(11) NULL DEFAULT 0,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '分类名称',
  `fields` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字段集',
  `usedata` int(11) NOT NULL DEFAULT 0 COMMENT '已用数据',
  `alldata` int(11) NOT NULL DEFAULT 0 COMMENT '全部数据',
  `merchid` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_cate`(`cate`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_yunphp_shop_wxcard
-- ----------------------------
DROP TABLE IF EXISTS `ims_yunphp_shop_wxcard`;
CREATE TABLE `ims_yunphp_shop_wxcard`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT NULL,
  `card_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0',
  `displayorder` int(11) NULL DEFAULT NULL,
  `catid` int(11) NULL DEFAULT NULL,
  `card_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `logo_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `wxlogourl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `brand_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `code_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `color` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `notice` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `service_phone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `datetype` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `begin_timestamp` int(11) NULL DEFAULT NULL,
  `end_timestamp` int(11) NULL DEFAULT NULL,
  `fixed_term` int(11) NULL DEFAULT NULL,
  `fixed_begin_term` int(11) NULL DEFAULT NULL,
  `quantity` int(11) NULL DEFAULT NULL,
  `total_quantity` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `use_limit` int(11) NULL DEFAULT NULL,
  `get_limit` int(11) NULL DEFAULT NULL,
  `use_custom_code` tinyint(1) NULL DEFAULT NULL,
  `bind_openid` tinyint(1) NULL DEFAULT NULL,
  `can_share` tinyint(1) NULL DEFAULT NULL,
  `can_give_friend` tinyint(1) NULL DEFAULT NULL,
  `center_title` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `center_sub_title` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `center_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `setcustom` tinyint(1) NULL DEFAULT NULL,
  `custom_url_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `custom_url_sub_title` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `custom_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `setpromotion` tinyint(1) NULL DEFAULT NULL,
  `promotion_url_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `promotion_url_sub_title` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `promotion_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `source` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `can_use_with_other_discount` tinyint(1) NULL DEFAULT NULL,
  `setabstract` tinyint(1) NULL DEFAULT NULL,
  `abstract` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `abstractimg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `icon_url_list` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `accept_category` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `reject_category` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `least_cost` decimal(10, 2) NULL DEFAULT NULL,
  `reduce_cost` decimal(10, 2) NULL DEFAULT NULL,
  `discount` decimal(10, 2) NULL DEFAULT NULL,
  `limitgoodtype` tinyint(1) NULL DEFAULT 0,
  `limitgoodcatetype` tinyint(1) UNSIGNED NULL DEFAULT 0,
  `limitgoodcateids` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `limitgoodids` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `limitdiscounttype` tinyint(1) UNSIGNED NULL DEFAULT 0,
  `merchid` int(11) NULL DEFAULT 0,
  `gettype` tinyint(3) NULL DEFAULT NULL,
  `islimitlevel` tinyint(1) NULL DEFAULT 0,
  `limitmemberlevels` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `limitagentlevels` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `limitpartnerlevels` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `limitaagentlevels` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `settitlecolor` tinyint(1) NULL DEFAULT 0,
  `titlecolor` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `tagtitle` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `use_condition` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
