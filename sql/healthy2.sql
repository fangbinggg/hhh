CREATE DATABASE IF NOT EXISTS `healthy2` CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `healthy2`;
/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80031
 Source Host           : localhost:3306
 Source Schema         : healthy2

 Target Server Type    : MySQL
 Target Server Version : 80031
 File Encoding         : 65001

 Date: 13/04/2024 22:25:05
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for health_appointment
-- ----------------------------
DROP TABLE IF EXISTS `health_appointment`;
CREATE TABLE `health_appointment`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '体检预约主键',
  `time` datetime NOT NULL COMMENT '预约时间',
  `user_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '就诊人',
  `id_card` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '身份证号',
  `user_phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '联系电话',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0待处理1预约成功2预约失败3已就诊）',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `appointment_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '预约编号',
  `user_id` int NOT NULL COMMENT '用户id',
  `taocan_id` int NULL DEFAULT NULL COMMENT '套餐id',
  `taocan_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '套餐名称',
  `hospital` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医院名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of health_appointment
-- ----------------------------
INSERT INTO `health_appointment` VALUES (9, '2024-04-05 16:00:00', '刘德华', '530381200001010101', '15883288881', '1', '2024-04-06 23:15:10', '2024-04-06 23:15:10', 'AY1712416563528', 21, 1, '体检套餐1', '医院1');

-- ----------------------------
-- Table structure for health_archives
-- ----------------------------
DROP TABLE IF EXISTS `health_archives`;
CREATE TABLE `health_archives`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '档案主键',
  `user_id` int NOT NULL COMMENT '用户主键',
  `age` int NULL DEFAULT NULL COMMENT '年龄',
  `gender` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'M' COMMENT '性别（使用ENUM类型限制为\'M男\'、\'F女\'或\'O其他\'）',
  `height` int NULL DEFAULT NULL COMMENT '身高',
  `weight` int NULL DEFAULT NULL COMMENT '体重',
  `blood_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '血型',
  `allergies` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '过敏情况',
  `medical_history` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病史',
  `medication` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者正在服用药物',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '档案创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '档案更新时间',
  `archive_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '档案档案编号（有系统生成）',
  `id_card` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  `group_id` int NULL DEFAULT NULL COMMENT '分组id',
  `blood_pressure` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '血压',
  `blood_sugar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '血糖',
  `heart_rate` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '心率',
  `liver` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '肝（0正常1异常）',
  `kidney` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '肾（0正常1异常）',
  `gallbladder` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '胆（0正常1异常）',
  `spleen` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '脾（0正常1异常）',
  `stomach` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '胃（0正常1异常）',
  `smell` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '嗅觉（0正常1异常）',
  `gustatorySensation` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '味觉（正常1异常）',
  `hearing` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '听觉',
  `tactileSensation` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '触觉',
  `vision` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '视觉',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of health_archives
-- ----------------------------
INSERT INTO `health_archives` VALUES (1, 11, 22, 'M', 150, 125, 'A血型', '无', '无', '维生素', '2023-12-24 00:57:48', '2023-12-24 00:57:48', 'AN1703350668232', '530381200110101010', NULL, '100', '67', '45', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `health_archives` VALUES (2, 16, 1, 'M', 1, 1, 'O血型', '芒果', '无', '阿莫西陵', '2023-12-24 17:29:42', '2023-12-24 17:29:42', 'AN1703410182512', '530381200112205121', 2, '120', '55', '60', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `health_archives` VALUES (3, 17, 1, 'M', 1, 1, 'AB血型', '', '', '', '2024-04-13 21:52:49', '2024-04-13 21:52:49', 'AN1713016369276', '530381200101013131', 1, '200', '80', '60', '0', '1', '0', '0', '0', '0', '0', '1', '0', '0');

-- ----------------------------
-- Table structure for health_diet
-- ----------------------------
DROP TABLE IF EXISTS `health_diet`;
CREATE TABLE `health_diet`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '饮食方案主键',
  `diet_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '方案名',
  `diet_content` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '方案内容',
  `archive_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '档案编号',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of health_diet
-- ----------------------------
INSERT INTO `health_diet` VALUES (1, '方案一', '好好吃饭！', 'AN1703410182512', '2023-12-25 16:20:42', '2023-12-25 16:20:42');
INSERT INTO `health_diet` VALUES (2, '方案三', '多喝热水！', 'AN1703350668232', '2023-12-25 21:43:51', '2023-12-25 21:43:51');

-- ----------------------------
-- Table structure for health_group
-- ----------------------------
DROP TABLE IF EXISTS `health_group`;
CREATE TABLE `health_group`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '档案分组',
  `group_name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组名',
  `group_key` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组标识',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of health_group
-- ----------------------------
INSERT INTO `health_group` VALUES (1, '流感', 'key_one', '2023-12-24 17:13:09', '2023-12-24 17:13:09');
INSERT INTO `health_group` VALUES (2, '腹痛', 'key_tow', '2023-12-24 17:13:34', '2023-12-24 17:13:34');

-- ----------------------------
-- Table structure for health_jkpg
-- ----------------------------
DROP TABLE IF EXISTS `health_jkpg`;
CREATE TABLE `health_jkpg`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '姓名',
  `blood_pressure` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '血压',
  `heart_rate` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '心率',
  `saturation` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '饱和度',
  `weight` double NULL DEFAULT NULL COMMENT '体重',
  `grade` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '预警等级',
  `evaluation_time` datetime NULL DEFAULT NULL COMMENT '评估时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of health_jkpg
-- ----------------------------
INSERT INTO `health_jkpg` VALUES (5, '小明', '1', '1', '1', 1, '1', '2024-04-05 16:00:00');
INSERT INTO `health_jkpg` VALUES (6, '小张', '2', '2', '2', 2, '2', '2024-04-04 16:00:00');
INSERT INTO `health_jkpg` VALUES (7, '张学友', '80', '90', '100', 110, '5', '2024-04-11 16:00:00');
INSERT INTO `health_jkpg` VALUES (8, '刘德华', '100', '99', '100', 130, '5', '2024-03-31 16:00:00');

-- ----------------------------
-- Table structure for health_jkyj
-- ----------------------------
DROP TABLE IF EXISTS `health_jkyj`;
CREATE TABLE `health_jkyj`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '姓名',
  `blood_pressure` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '血压',
  `heart_rate` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '心率',
  `saturation` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '饱和度',
  `weight` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '体重',
  `evaluation_time` datetime NULL DEFAULT NULL COMMENT '预警时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of health_jkyj
-- ----------------------------
INSERT INTO `health_jkyj` VALUES (2, '小明', '偏低', '偏低', '偏低', '偏低', '2024-04-07 02:59:23');
INSERT INTO `health_jkyj` VALUES (3, '张学友', '偏低', '偏高', '偏低', '偏高', '2024-04-07 03:01:21');
INSERT INTO `health_jkyj` VALUES (4, '刘德华', '偏低', '偏高', '偏低', '偏高', '2024-04-07 03:25:20');

-- ----------------------------
-- Table structure for health_medicine
-- ----------------------------
DROP TABLE IF EXISTS `health_medicine`;
CREATE TABLE `health_medicine`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '药物方案主键',
  `medicine_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '药物方案名',
  `medicine_content` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '药物方案内容',
  `archive_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '档案编号',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of health_medicine
-- ----------------------------
INSERT INTO `health_medicine` VALUES (1, '方案二', '阿莫西灵、999感冒灵颗粒', 'AN1703350668232', '2023-12-25 22:13:19', '2023-12-25 22:13:19');

-- ----------------------------
-- Table structure for health_menu
-- ----------------------------
DROP TABLE IF EXISTS `health_menu`;
CREATE TABLE `health_menu`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '菜单主键',
  `menu_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单名',
  `path` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '路由',
  `parent_id` int NOT NULL DEFAULT 0 COMMENT '父菜单id',
  `sort_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图标',
  `role_key` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'user' COMMENT '（用户user,管理员admin）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of health_menu
-- ----------------------------
INSERT INTO `health_menu` VALUES (1, '个性服务', 'service', 0, 1, 'Finished', 'user');
INSERT INTO `health_menu` VALUES (2, '健康日志', 'health_logs', 0, 1, 'Edit', 'user');
INSERT INTO `health_menu` VALUES (3, '健康分析', 'health_analysis', 1, 0, 'Star', 'user');
INSERT INTO `health_menu` VALUES (5, '我的日志', 'my_logs', 2, 0, 'Discount', 'user');
INSERT INTO `health_menu` VALUES (6, '用户管理', NULL, 0, 0, 'User', 'admin');
INSERT INTO `health_menu` VALUES (7, '档案管理', 'archives', 6, 1, 'Tickets', 'admin');
INSERT INTO `health_menu` VALUES (8, '饮食方案', 'programme', 12, 2, 'Memo', 'admin');
INSERT INTO `health_menu` VALUES (10, '药物方案', 'statistics', 12, 4, 'SetUp', 'admin');
INSERT INTO `health_menu` VALUES (12, '方案设计', NULL, 0, 3, 'Files', 'admin');
INSERT INTO `health_menu` VALUES (14, '用户中心', 'sys_user', 6, 0, 'User', 'admin');
INSERT INTO `health_menu` VALUES (15, '体检中心', NULL, 0, 0, 'SetUp', 'admin');
INSERT INTO `health_menu` VALUES (17, '预约管理', 'make', 15, 0, 'DocumentChecked', 'admin');
INSERT INTO `health_menu` VALUES (19, '体检中心', NULL, 0, 0, 'SetUp', 'user');
INSERT INTO `health_menu` VALUES (20, '体检预约', 'phy_center', 19, 1, 'Postcard', 'user');
INSERT INTO `health_menu` VALUES (21, '个性服务', NULL, 0, 3, 'Finished', 'admin');
INSERT INTO `health_menu` VALUES (22, '健康分析', 'health_analysis', 21, 0, 'Star', 'admin');
INSERT INTO `health_menu` VALUES (23, '健康评估', 'jkpg', 21, 0, 'Star', 'admin');
INSERT INTO `health_menu` VALUES (24, '健康预警', 'jkyj', 21, 0, 'Star', 'admin');
INSERT INTO `health_menu` VALUES (25, '体检套餐', 'phy_taocan', 19, 0, 'Postcard', 'user');

-- ----------------------------
-- Table structure for health_record
-- ----------------------------
DROP TABLE IF EXISTS `health_record`;
CREATE TABLE `health_record`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '健康日志表',
  `time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录时间',
  `mood` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'L' COMMENT '心情',
  `diet` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '饮食情况',
  `sleep` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '睡眠情况',
  `height` int NULL DEFAULT NULL COMMENT '身高',
  `weight` int NULL DEFAULT NULL COMMENT '体重',
  `blood_pressure` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '血压',
  `heart_rate` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '心率',
  `blood_sugar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '血糖',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of health_record
-- ----------------------------
INSERT INTO `health_record` VALUES (1, '2023-12-26 15:44:41', 'L', '西蓝花，西红柿，糖醋排骨。。。', 'L', 180, 120, '120', '60', '22');

-- ----------------------------
-- Table structure for health_taocan
-- ----------------------------
DROP TABLE IF EXISTS `health_taocan`;
CREATE TABLE `health_taocan`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `taocan_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '套餐名称',
  `hospital` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '医院',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '体检地点',
  `room_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '科室名称',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '价格',
  `cover` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '封面图片',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '体检套餐' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of health_taocan
-- ----------------------------
INSERT INTO `health_taocan` VALUES (1, '体检套餐1', '医院1', '体检地点1', '科室1', 1.00, 'https://edu-learn-bucket.oss-cn-hangzhou.aliyuncs.com/img_files/1702455268011.png');
INSERT INTO `health_taocan` VALUES (2, '体检套餐2', '医院2', '体检地点2', '科室2', 2.00, 'https://edu-learn-bucket.oss-cn-hangzhou.aliyuncs.com/img_files/1702455268011.png');
INSERT INTO `health_taocan` VALUES (3, '体检套餐3', '医院3', '体检地点3', '科室3', 2.00, 'https://edu-learn-bucket.oss-cn-hangzhou.aliyuncs.com/img_files/1702455268011.png');

-- ----------------------------
-- Table structure for health_user
-- ----------------------------
DROP TABLE IF EXISTS `health_user`;
CREATE TABLE `health_user`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '用户主键',
  `user_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名',
  `user_phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '手机号',
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '密码',
  `user_role` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'U' COMMENT '用户角色（U普通用户A管理员）',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `avatar` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像',
  `remark` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of health_user
-- ----------------------------
INSERT INTO `health_user` VALUES (11, '小可爱~', '13100000002', 'e10adc3949ba59abbe56e057f20f883e', 'A', '2023-12-03 17:12:35', '2023-12-03 17:12:35', 'https://edu-learn-bucket.oss-cn-hangzhou.aliyuncs.com/img_files/1712592501666.png', NULL, '0');
INSERT INTO `health_user` VALUES (12, '太难听了', '13100000003', '4297f44b13955235245b2497399d7a93', 'U', '2023-12-03 17:33:10', '2023-12-03 17:33:10', 'https://edu-learn-bucket.oss-cn-hangzhou.aliyuncs.com/img_files/女孩.png', NULL, '0');
INSERT INTO `health_user` VALUES (16, '小可爱4', '13100000004', '4297f44b13955235245b2497399d7a93', 'U', '2023-12-08 15:34:03', '2023-12-08 15:34:03', 'https://edu-learn-bucket.oss-cn-hangzhou.aliyuncs.com/img_files/女孩.png', NULL, '0');
INSERT INTO `health_user` VALUES (17, '小可爱5', '13100000005', '4297f44b13955235245b2497399d7a93', 'U', '2023-12-08 15:34:15', '2023-12-08 15:34:15', 'https://edu-learn-bucket.oss-cn-hangzhou.aliyuncs.com/img_files/女孩.png', NULL, '0');
INSERT INTO `health_user` VALUES (18, '星星', '18838761570', 'e10adc3949ba59abbe56e057f20f883e', 'U', '2024-03-14 14:21:30', '2024-03-14 14:21:30', 'https://edu-learn-bucket.oss-cn-hangzhou.aliyuncs.com/img_files/女孩.png', NULL, '0');
INSERT INTO `health_user` VALUES (19, '老张', '123', 'c4ca4238a0b923820dcc509a6f75849b', 'A', '2024-04-06 12:52:13', '2024-04-06 12:52:13', 'https://edu-learn-bucket.oss-cn-hangzhou.aliyuncs.com/img_files/1712379647958.png', NULL, '0');
INSERT INTO `health_user` VALUES (20, 'admin', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'A', '2024-04-06 13:16:49', '2024-04-06 13:16:49', 'https://edu-learn-bucket.oss-cn-hangzhou.aliyuncs.com/img_files/女孩.png', NULL, '0');
INSERT INTO `health_user` VALUES (21, 'user1', 'user1', '24c9e15e52afc47c225b757e7bee1f9d', 'U', '2024-04-06 13:17:07', '2024-04-06 13:17:07', 'https://edu-learn-bucket.oss-cn-hangzhou.aliyuncs.com/img_files/1712460465040.png', NULL, '0');

SET FOREIGN_KEY_CHECKS = 1;
