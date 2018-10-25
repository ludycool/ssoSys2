/*
Navicat MySQL Data Transfer

Source Server         : 103.45.3.145
Source Server Version : 50723
Source Host           : 103.45.3.145:3306
Source Database       : ssoSysDB

Target Server Type    : MYSQL
Target Server Version : 50723
File Encoding         : 65001

Date: 2018-10-25 23:09:12
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for rms_buttons
-- ----------------------------
DROP TABLE IF EXISTS `rms_buttons`;
CREATE TABLE `rms_buttons` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `orderno` int(11) DEFAULT NULL COMMENT '排序',
  `buttonname` varchar(20) DEFAULT NULL COMMENT '名称',
  `valuename` varchar(200) DEFAULT NULL COMMENT '值',
  `icon` varchar(40) DEFAULT NULL COMMENT '图标',
  `functionname` varchar(20) DEFAULT NULL COMMENT '方法名',
  `remarks` varchar(200) DEFAULT NULL COMMENT '备注',
  `createtime` datetime(6) DEFAULT NULL COMMENT '添加时间',
  `modifytime` datetime(6) DEFAULT NULL COMMENT '更新时间',
  `color` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rms_buttons_pk` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='RMS_Buttons按钮';

-- ----------------------------
-- Records of rms_buttons
-- ----------------------------
INSERT INTO `rms_buttons` VALUES ('1', '3', '删除', 'delBtn', 'icon-delete', 'del', null, '2016-07-27 00:00:00.000000', '2018-10-23 08:50:48.000000', null);
INSERT INTO `rms_buttons` VALUES ('2', '4', '查看', 'detailsBtn', 'icon-zoom', 'showInfo', null, null, '2018-10-23 08:56:14.000000', null);
INSERT INTO `rms_buttons` VALUES ('3', '1', '添加', 'addBtn', 'icon-add', 'addInfo', ' \r\n添加数据 ', null, '2018-10-23 08:50:10.000000', null);
INSERT INTO `rms_buttons` VALUES ('4', '5', '搜索', 'divSearh', 'icon-search', 'search', null, '2016-07-27 00:00:00.000000', '2018-10-23 08:57:41.000000', null);
INSERT INTO `rms_buttons` VALUES ('5', '2', '修改', 'editBtn', 'icon-edit', 'editInfo', '434', null, '2018-10-23 08:50:19.000000', null);
INSERT INTO `rms_buttons` VALUES ('9', '7', '更新', 'reflashBtn', 'icon-disk_download', 'reflashOP', null, '2016-09-01 14:05:12.000000', '2018-10-23 08:57:25.000000', null);
INSERT INTO `rms_buttons` VALUES ('10', '4', '导入', 'importBtn', 'icon-table_add', 'import', null, '2016-09-09 13:52:47.000000', '2018-10-23 08:51:07.000000', null);

-- ----------------------------
-- Table structure for rms_company
-- ----------------------------
DROP TABLE IF EXISTS `rms_company`;
CREATE TABLE `rms_company` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `orderno` int(11) DEFAULT NULL COMMENT '排序',
  `name` varchar(20) DEFAULT NULL COMMENT '名称',
  `remarks` varchar(200) DEFAULT NULL COMMENT '备注',
  `createtime` datetime(6) DEFAULT NULL COMMENT '添加时间',
  `modifytime` datetime(6) DEFAULT NULL COMMENT '更新时间',
  `isvalid` tinyint(5) DEFAULT NULL COMMENT '是否有效',
  `isdeleted` tinyint(5) DEFAULT NULL COMMENT '是否删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `rms_department_pk2` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='公司';

-- ----------------------------
-- Records of rms_company
-- ----------------------------
INSERT INTO `rms_company` VALUES ('1', '3', '万瑞博 ', '433 脸人要', '2016-08-29 06:06:48.000000', '2018-10-21 14:36:07.000000', '1', '0');
INSERT INTO `rms_company` VALUES ('2', '22', '天绘北斗测试', '1212的多2222', '2016-08-29 15:28:54.000000', '2018-10-23 10:59:58.000000', '1', '0');
INSERT INTO `rms_company` VALUES ('3', '2', '吉风科技', '去人', '2014-04-05 12:23:23.000000', '2018-10-21 12:57:06.000000', '1', '0');
INSERT INTO `rms_company` VALUES ('6', '1', '植城智慧', null, '2018-10-23 14:16:54.016000', '2018-10-23 14:16:54.016000', '1', '0');

-- ----------------------------
-- Table structure for rms_department
-- ----------------------------
DROP TABLE IF EXISTS `rms_department`;
CREATE TABLE `rms_department` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `parentid` int(11) DEFAULT NULL COMMENT '上级Id',
  `orderno` int(11) DEFAULT NULL COMMENT '排序',
  `name` varchar(20) DEFAULT NULL COMMENT '名称',
  `icon` varchar(40) DEFAULT NULL COMMENT '图标',
  `remarks` varchar(200) DEFAULT NULL COMMENT '备注',
  `createtime` datetime(6) DEFAULT NULL COMMENT '添加时间',
  `modifytime` datetime(6) DEFAULT NULL COMMENT '更新时间',
  `companyid` int(11) DEFAULT NULL COMMENT '公司id',
  `level` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='RMS_Department部门';

-- ----------------------------
-- Records of rms_department
-- ----------------------------
INSERT INTO `rms_department` VALUES ('1', '0', '2', '设计部', 'icon-comment', '仍', '2016-08-29 16:57:24.000000', '2018-01-27 17:05:12.000000', '1', '0');
INSERT INTO `rms_department` VALUES ('2', '1', '0', '开发部2', 'icon-brick_edit', '哈哈1', '2016-07-29 00:00:00.000000', '2018-01-27 16:50:15.000000', '1', '1');
INSERT INTO `rms_department` VALUES ('3', '1', '2', '切图部', 'icon-color_swatch', '23', '2016-08-29 17:00:16.000000', '2016-08-29 17:00:16.000000', '2', null);
INSERT INTO `rms_department` VALUES ('4', '0', '12', '电池设计部', 'icon-arrow_in_longer', '12', '2016-08-29 19:36:38.000000', '2016-08-29 19:36:38.000000', '3', null);
INSERT INTO `rms_department` VALUES ('5', '4', '3', '宣传部', 'icon-page_landscape', '23', '2016-08-29 19:37:10.000000', '2016-08-29 19:37:10.000000', '3', null);
INSERT INTO `rms_department` VALUES ('6', '0', '3', '研发部', 'icon-computer_go', null, '2016-08-29 19:37:29.000000', '2016-11-03 17:21:49.000000', '3', null);
INSERT INTO `rms_department` VALUES ('7', '2', '2', '1', '3', '4', '2018-01-27 16:57:20.000000', '2018-01-27 17:17:25.000000', '1', '2');
INSERT INTO `rms_department` VALUES ('8', '6', '1212', '3333', 'icon-color', '232323', '2018-10-22 22:55:13.126000', '2018-10-22 23:00:18.000000', '3', '0');
INSERT INTO `rms_department` VALUES ('11', '0', '0', '研发部', 'icon-color_wheel', null, '2018-10-23 14:27:44.596000', '2018-10-23 14:27:44.596000', '6', '0');

-- ----------------------------
-- Table structure for rms_menubuttons
-- ----------------------------
DROP TABLE IF EXISTS `rms_menubuttons`;
CREATE TABLE `rms_menubuttons` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `buttonid` int(11) DEFAULT NULL COMMENT '按钮的Id',
  `manuid` int(11) DEFAULT NULL COMMENT '菜单Id',
  `orderno` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `rms_menubuttons_pk` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=196 DEFAULT CHARSET=utf8 COMMENT='RMS_MenuButtons菜单的按钮';

-- ----------------------------
-- Records of rms_menubuttons
-- ----------------------------
INSERT INTO `rms_menubuttons` VALUES ('1', '3', '5', '0');
INSERT INTO `rms_menubuttons` VALUES ('2', '2', '5', '4');
INSERT INTO `rms_menubuttons` VALUES ('3', '1', '5', '2');
INSERT INTO `rms_menubuttons` VALUES ('4', '5', '5', '1');
INSERT INTO `rms_menubuttons` VALUES ('5', '4', '5', '3');
INSERT INTO `rms_menubuttons` VALUES ('6', '1', '4', '3');
INSERT INTO `rms_menubuttons` VALUES ('7', '3', '4', '0');
INSERT INTO `rms_menubuttons` VALUES ('8', '4', '4', '4');
INSERT INTO `rms_menubuttons` VALUES ('9', '2', '4', '2');
INSERT INTO `rms_menubuttons` VALUES ('10', '5', '4', '1');
INSERT INTO `rms_menubuttons` VALUES ('11', '1', '6', '2');
INSERT INTO `rms_menubuttons` VALUES ('12', '2', '6', '4');
INSERT INTO `rms_menubuttons` VALUES ('13', '5', '6', '1');
INSERT INTO `rms_menubuttons` VALUES ('14', '4', '6', '3');
INSERT INTO `rms_menubuttons` VALUES ('15', '3', '6', '0');
INSERT INTO `rms_menubuttons` VALUES ('16', '1', '8', '3');
INSERT INTO `rms_menubuttons` VALUES ('17', '5', '8', '1');
INSERT INTO `rms_menubuttons` VALUES ('18', '2', '8', '2');
INSERT INTO `rms_menubuttons` VALUES ('19', '3', '8', '0');
INSERT INTO `rms_menubuttons` VALUES ('20', '4', '8', '4');
INSERT INTO `rms_menubuttons` VALUES ('21', '1', '7', '3');
INSERT INTO `rms_menubuttons` VALUES ('22', '2', '7', '2');
INSERT INTO `rms_menubuttons` VALUES ('23', '4', '7', '4');
INSERT INTO `rms_menubuttons` VALUES ('24', '3', '7', '0');
INSERT INTO `rms_menubuttons` VALUES ('25', '5', '7', '1');
INSERT INTO `rms_menubuttons` VALUES ('26', '3', '9', '0');
INSERT INTO `rms_menubuttons` VALUES ('27', '4', '9', '4');
INSERT INTO `rms_menubuttons` VALUES ('28', '1', '9', '1');
INSERT INTO `rms_menubuttons` VALUES ('29', '5', '9', '2');
INSERT INTO `rms_menubuttons` VALUES ('30', '2', '9', '3');
INSERT INTO `rms_menubuttons` VALUES ('31', '5', '10', '1');
INSERT INTO `rms_menubuttons` VALUES ('32', '4', '10', '4');
INSERT INTO `rms_menubuttons` VALUES ('33', '3', '10', '0');
INSERT INTO `rms_menubuttons` VALUES ('34', '2', '10', '2');
INSERT INTO `rms_menubuttons` VALUES ('35', '1', '10', '3');
INSERT INTO `rms_menubuttons` VALUES ('36', '3', '17', '0');
INSERT INTO `rms_menubuttons` VALUES ('37', '5', '17', '1');
INSERT INTO `rms_menubuttons` VALUES ('38', '5', '18', '1');
INSERT INTO `rms_menubuttons` VALUES ('39', '3', '18', '0');
INSERT INTO `rms_menubuttons` VALUES ('51', '1', '17', '2');
INSERT INTO `rms_menubuttons` VALUES ('52', '1', '18', '2');
INSERT INTO `rms_menubuttons` VALUES ('86', '4', '38', '3');
INSERT INTO `rms_menubuttons` VALUES ('87', '5', '38', '0');
INSERT INTO `rms_menubuttons` VALUES ('88', '2', '38', '2');
INSERT INTO `rms_menubuttons` VALUES ('90', '3', '34', '0');
INSERT INTO `rms_menubuttons` VALUES ('91', '1', '34', '2');
INSERT INTO `rms_menubuttons` VALUES ('92', '4', '34', '4');
INSERT INTO `rms_menubuttons` VALUES ('93', '5', '34', '1');
INSERT INTO `rms_menubuttons` VALUES ('94', '2', '35', '0');
INSERT INTO `rms_menubuttons` VALUES ('95', '9', '35', '1');
INSERT INTO `rms_menubuttons` VALUES ('130', '2', '34', '3');
INSERT INTO `rms_menubuttons` VALUES ('133', '1', '49', '1');
INSERT INTO `rms_menubuttons` VALUES ('134', '5', '49', '0');
INSERT INTO `rms_menubuttons` VALUES ('135', '4', '49', '3');
INSERT INTO `rms_menubuttons` VALUES ('136', '2', '49', '2');
INSERT INTO `rms_menubuttons` VALUES ('138', '3', '53', '0');
INSERT INTO `rms_menubuttons` VALUES ('139', '1', '53', '2');
INSERT INTO `rms_menubuttons` VALUES ('140', '2', '53', '3');
INSERT INTO `rms_menubuttons` VALUES ('141', '4', '53', '4');
INSERT INTO `rms_menubuttons` VALUES ('142', '5', '53', '1');
INSERT INTO `rms_menubuttons` VALUES ('143', '3', '54', '0');
INSERT INTO `rms_menubuttons` VALUES ('144', '4', '54', '4');
INSERT INTO `rms_menubuttons` VALUES ('145', '2', '54', '3');
INSERT INTO `rms_menubuttons` VALUES ('146', '1', '54', '2');
INSERT INTO `rms_menubuttons` VALUES ('147', '5', '54', '1');
INSERT INTO `rms_menubuttons` VALUES ('148', '3', '55', '0');
INSERT INTO `rms_menubuttons` VALUES ('149', '1', '55', '2');
INSERT INTO `rms_menubuttons` VALUES ('150', '5', '55', '1');
INSERT INTO `rms_menubuttons` VALUES ('151', '2', '55', '3');
INSERT INTO `rms_menubuttons` VALUES ('152', '4', '55', '4');
INSERT INTO `rms_menubuttons` VALUES ('153', '3', '56', '0');
INSERT INTO `rms_menubuttons` VALUES ('154', '2', '56', '3');
INSERT INTO `rms_menubuttons` VALUES ('155', '4', '56', '4');
INSERT INTO `rms_menubuttons` VALUES ('156', '1', '56', '2');
INSERT INTO `rms_menubuttons` VALUES ('157', '5', '56', '1');
INSERT INTO `rms_menubuttons` VALUES ('158', '3', '57', '0');
INSERT INTO `rms_menubuttons` VALUES ('159', '5', '57', '1');
INSERT INTO `rms_menubuttons` VALUES ('160', '1', '57', '2');
INSERT INTO `rms_menubuttons` VALUES ('161', '2', '57', '3');
INSERT INTO `rms_menubuttons` VALUES ('162', '4', '57', '4');
INSERT INTO `rms_menubuttons` VALUES ('164', '9', '36', '0');
INSERT INTO `rms_menubuttons` VALUES ('165', '2', '36', '1');
INSERT INTO `rms_menubuttons` VALUES ('166', '3', '61', '0');
INSERT INTO `rms_menubuttons` VALUES ('167', '1', '61', '2');
INSERT INTO `rms_menubuttons` VALUES ('168', '4', '61', '3');
INSERT INTO `rms_menubuttons` VALUES ('169', '5', '61', '1');
INSERT INTO `rms_menubuttons` VALUES ('170', '3', '60', '0');
INSERT INTO `rms_menubuttons` VALUES ('171', '5', '60', '1');
INSERT INTO `rms_menubuttons` VALUES ('172', '1', '60', '2');
INSERT INTO `rms_menubuttons` VALUES ('173', '4', '60', '3');
INSERT INTO `rms_menubuttons` VALUES ('174', '2', '62', '3');
INSERT INTO `rms_menubuttons` VALUES ('175', '1', '62', '2');
INSERT INTO `rms_menubuttons` VALUES ('176', '5', '62', '1');
INSERT INTO `rms_menubuttons` VALUES ('177', '4', '62', '4');
INSERT INTO `rms_menubuttons` VALUES ('178', '3', '62', '0');
INSERT INTO `rms_menubuttons` VALUES ('186', '1', '69', '2');
INSERT INTO `rms_menubuttons` VALUES ('187', '5', '69', '1');
INSERT INTO `rms_menubuttons` VALUES ('188', '3', '69', '0');
INSERT INTO `rms_menubuttons` VALUES ('189', '2', '69', '3');
INSERT INTO `rms_menubuttons` VALUES ('190', '4', '69', '4');
INSERT INTO `rms_menubuttons` VALUES ('191', '1', '68', '2');
INSERT INTO `rms_menubuttons` VALUES ('192', '2', '68', '3');
INSERT INTO `rms_menubuttons` VALUES ('193', '5', '68', '1');
INSERT INTO `rms_menubuttons` VALUES ('194', '3', '68', '0');
INSERT INTO `rms_menubuttons` VALUES ('195', '4', '68', '4');

-- ----------------------------
-- Table structure for rms_menus
-- ----------------------------
DROP TABLE IF EXISTS `rms_menus`;
CREATE TABLE `rms_menus` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `parentmanuid` int(11) DEFAULT NULL COMMENT '上级Id',
  `orderno` int(11) DEFAULT NULL COMMENT '排序',
  `manuname` varchar(20) DEFAULT NULL COMMENT '名称',
  `url` varchar(200) DEFAULT NULL COMMENT '跳转地址',
  `icon` varchar(200) DEFAULT NULL COMMENT '图标',
  `micon` varchar(200) DEFAULT NULL COMMENT '大图标',
  `remarks` varchar(200) DEFAULT NULL COMMENT '备注',
  `createtime` datetime(6) DEFAULT NULL COMMENT '添加时间',
  `modifytime` datetime(6) DEFAULT NULL COMMENT '更新时间',
  `isenable` varchar(5) DEFAULT NULL COMMENT '是否可用',
  `isshow` varchar(5) DEFAULT NULL COMMENT '是否显示',
  `typeid` smallint(6) DEFAULT NULL,
  `valuename` varchar(20) DEFAULT NULL COMMENT '值、编号',
  `companyid` int(11) DEFAULT NULL COMMENT '公司id',
  `projectid` int(11) DEFAULT NULL COMMENT '项目id',
  `level` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rms_menus_pk` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8 COMMENT='RMS_Menus菜单';

-- ----------------------------
-- Records of rms_menus
-- ----------------------------
INSERT INTO `rms_menus` VALUES ('1', '0', '12', '权限管理', 'permissionsystem', 'icon-shape_move_forwards', '/Content/EasyUI/themes/icons/32/box.png', '1212', '2016-07-28 00:00:00.000000', '2018-10-23 08:53:49.000000', '1', '1', '1', '0102', '1', '1', '0');
INSERT INTO `rms_menus` VALUES ('2', '0', '2', '基础设置', 'sysset', 'icon-note', null, 'sdsdsd', '2016-07-29 00:00:00.000000', '2018-10-23 08:51:38.000000', '1', '1', '1', '0101', '1', '1', '0');
INSERT INTO `rms_menus` VALUES ('3', '0', '2', '塞拉数据', 'main?values=02', 'menu-icon-7', null, null, '2016-08-08 00:00:00.000000', '2018-01-26 11:43:48.000000', 't', 'f', '0', '02', '1', '1', '0');
INSERT INTO `rms_menus` VALUES ('4', '2', '2', '数据字典', 'dictionary', 'icon-heart', null, null, '2016-08-08 00:00:00.000000', '2018-10-23 08:54:47.000000', '1', '0', '2', '010102', '1', '1', '1');
INSERT INTO `rms_menus` VALUES ('5', '2', '1', '字典类型', 'dictype', 'icon-page_white_star', null, '词典的类型', '2016-08-08 00:00:00.000000', '2018-10-23 08:54:41.000000', '1', '1', '2', '010101', '1', '1', '1');
INSERT INTO `rms_menus` VALUES ('6', '1', '0', '按钮管理', 'button', 'icon-user', null, null, '2016-07-26 00:00:00.000000', '2018-10-23 08:55:11.000000', '1', '1', '2', '010205', '1', '1', '1');
INSERT INTO `rms_menus` VALUES ('7', '1', '2', '角色管理', 'role', 'icon-key_go', null, null, '2016-07-28 00:00:00.000000', '2016-07-28 00:00:00.000000', 't', 't', '2', '010201', '1', '1', '1');
INSERT INTO `rms_menus` VALUES ('8', '1', '1', '菜单管理', 'manu', 'icon-note', '/Content/EasyUI/themes/icons/32/bell_error.png', null, '2016-07-26 00:00:00.000000', '2016-07-26 00:00:00.000000', 't', 't', '2', '010206', '1', '1', '1');
INSERT INTO `rms_menus` VALUES ('9', '1', '5', '用户管理', 'user', 'icon-user', null, '454545', '2016-08-17 00:00:00.000000', '2016-08-17 00:00:00.000000', 't', 't', '2', '010204', '1', '1', '1');
INSERT INTO `rms_menus` VALUES ('10', '1', '6', '部门管理', 'department', 'icon-door_open', null, null, '2016-07-28 00:00:00.000000', '2018-10-23 08:55:37.000000', '1', '1', '2', '010203', '1', '1', '1');
INSERT INTO `rms_menus` VALUES ('11', '3', '1', '广告管理', 'sl_advertise', 'icon-television', null, '哈哈', '2016-08-09 00:00:00.000000', '2018-01-26 11:53:17.000000', 't', 'f', '2', '0202', '1', '1', '1');
INSERT INTO `rms_menus` VALUES ('12', '3', '2', '设备列表1', 'device', 'icon-shape_flip_horizontal', null, 'sdsdsd', '2016-08-08 00:00:00.000000', '2018-01-26 11:37:02.000000', 't', 'f', '2', '0201', '1', '1', '1');
INSERT INTO `rms_menus` VALUES ('13', '3', '3', '服务站管理', 'sl_services', 'icon-color_swatch', null, '12', '2016-08-17 00:00:00.000000', '2018-01-26 12:29:57.000000', 'f', 'f', '1', '0203', '1', '1', '1');
INSERT INTO `rms_menus` VALUES ('17', '2', '3', '公司管理', 'company', 'icon-note', '/Content/EasyUI/themes/icons/32/bell_error.png', null, '2016-08-29 13:54:00.000000', '2018-10-23 08:54:54.000000', '1', '1', '2', '010103', '1', '1', '1');
INSERT INTO `rms_menus` VALUES ('18', '2', '4', '项目管理', 'project', 'icon-page_header_footer', '/Content/EasyUI/themes/icons/32/page.png', null, '2016-08-29 13:55:06.000000', '2018-10-23 08:55:01.000000', '1', '1', '2', '010104', '1', '1', '1');
INSERT INTO `rms_menus` VALUES ('32', '0', '10', '权限管理', 'SysRole', 'fa-desktop', null, null, '2016-09-02 17:45:20.000000', '2016-09-03 16:52:30.000000', 't', 't', '0', '02', '3', '5', '0');
INSERT INTO `rms_menus` VALUES ('33', '0', '2', '设备管理', 'Sys#', 'icon-color_swatch', null, null, '2016-09-02 17:46:06.000000', '2016-11-03 17:18:23.000000', 't', 't', '0', '01', '3', '5', '0');
INSERT INTO `rms_menus` VALUES ('34', '33', '2', 'CID管理', 'aid_seed', 'icon-pilcrow', null, null, '2016-09-02 17:46:41.000000', '2016-11-04 11:44:48.000000', 't', 't', '2', '0102', '3', '5', '1');
INSERT INTO `rms_menus` VALUES ('35', '32', '3', '角色', 'role', 'fa-eye-slash', null, null, '2016-09-02 17:47:35.000000', '2016-09-03 16:53:42.000000', 't', 't', '2', '0202', '3', '5', '1');
INSERT INTO `rms_menus` VALUES ('36', '32', '5', '测试', '0203', 'fa-barcode', null, null, '2016-09-02 17:48:11.000000', '2016-09-03 16:52:58.000000', 't', 't', '1', '0203', '3', '5', '1');
INSERT INTO `rms_menus` VALUES ('38', '33', '3', '设备列表', 'device', 'icon-sport_golf_practice', null, null, '2016-09-02 17:49:36.000000', '2016-11-04 11:45:15.000000', 't', 't', '2', '0101', '3', '5', '1');
INSERT INTO `rms_menus` VALUES ('49', '33', '2', 'app用户', 'app_user', 'icon-user', null, null, '2016-11-08 15:22:35.000000', '2016-11-08 15:22:35.000000', 't', 't', '2', '0103', '3', '5', '1');
INSERT INTO `rms_menus` VALUES ('50', '12', '23', '23', '23', '23', null, '22', '2018-01-26 17:34:43.000000', '2018-01-27 09:32:52.000000', 't', 'f', '2', '2', '1', '0', '2');
INSERT INTO `rms_menus` VALUES ('53', '33', '4', '设备类型', 'dev_type', 'icon-sport_soccer', null, null, '2018-03-24 11:20:16.000000', '2018-03-24 11:20:16.000000', 't', 't', '2', '0104', '3', '5', '0');
INSERT INTO `rms_menus` VALUES ('54', '33', '5', '设备品牌', 'dev_brand', 'icon-rainbow', null, null, '2018-03-24 11:22:38.000000', '2018-03-24 11:22:45.000000', 't', 't', '2', '0105', '3', '5', '0');
INSERT INTO `rms_menus` VALUES ('55', '33', '6', '设备型号', 'dev_model', 'icon-flag_blue', null, null, '2018-03-24 11:23:48.000000', '2018-03-24 11:23:54.000000', 't', 't', '2', '0106', '3', '5', '0');
INSERT INTO `rms_menus` VALUES ('56', '33', '7', '按键库', 'key_library', 'icon-shape_3d', null, null, '2018-03-24 11:26:01.000000', '2018-03-24 11:26:01.000000', 't', 't', '2', '0107', '3', '5', '0');
INSERT INTO `rms_menus` VALUES ('57', '33', '0', '服务器管理', 'server_mgt', 'icon-star', null, '服务器 及相应公司', '2018-04-28 10:46:38.000000', '2018-04-28 10:48:33.000000', 't', 't', '2', '0108', '3', '5', '0');
INSERT INTO `rms_menus` VALUES ('59', '0', '3', '基础数据', 'base#', 'icon-color', null, null, '2018-09-07 14:51:02.000000', '2018-09-07 14:51:02.000000', 't', 't', '1', '03', '3', '5', '0');
INSERT INTO `rms_menus` VALUES ('60', '59', '0', '字典类型', 'sys_dictype', 'icon-text_heading_1', null, null, '2018-09-07 14:51:48.000000', '2018-09-07 14:51:48.000000', 't', 't', '2', '0301', '3', '5', '1');
INSERT INTO `rms_menus` VALUES ('61', '59', '2', '数据字典', 'sys_dictionary', 'icon-ruby', null, null, '2018-09-07 14:52:27.000000', '2018-09-07 14:52:27.000000', 't', 't', '2', '0302', '3', '5', '1');
INSERT INTO `rms_menus` VALUES ('62', '59', '3', '新闻', 'jc_article', 'icon-rainbow', null, null, '2018-09-07 14:53:59.000000', '2018-09-07 14:53:59.000000', 't', 't', '2', '0303', '3', '5', '1');
INSERT INTO `rms_menus` VALUES ('66', '0', '1', '基础数据', 'base', 'icon-note', '34', '2', '2018-10-23 14:21:25.008000', '2018-10-23 14:22:00.000000', '1', '1', '1', '01', '6', '10', '0');
INSERT INTO `rms_menus` VALUES ('67', '0', '0', '权限管理', 'authority', 'icon-shape_3d', null, '1', '2018-10-23 14:23:22.762000', '2018-10-23 14:23:22.762000', '1', '1', '1', '02', '6', '10', '0');
INSERT INTO `rms_menus` VALUES ('68', '66', '2', '数据词典', 'dictionary', 'icon-sport_tennis', null, null, '2018-10-23 14:24:29.434000', '2018-10-23 14:25:40.000000', '1', '1', '2', '0101', '6', '10', '1');
INSERT INTO `rms_menus` VALUES ('69', '67', '0', '角色管理', 'role', 'icon-stop', null, null, '2018-10-23 14:25:32.223000', '2018-10-23 14:25:32.223000', '1', '1', '2', '0201', '6', '10', '1');

-- ----------------------------
-- Table structure for rms_project
-- ----------------------------
DROP TABLE IF EXISTS `rms_project`;
CREATE TABLE `rms_project` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `companyid` int(11) DEFAULT NULL COMMENT '公司id',
  `keyid` varchar(200) DEFAULT NULL COMMENT '加密key',
  `name` varchar(20) DEFAULT NULL COMMENT '名称',
  `remarks` varchar(200) DEFAULT NULL COMMENT '备注',
  `createtime` datetime(6) DEFAULT NULL COMMENT '添加时间',
  `modifytime` datetime(6) DEFAULT NULL COMMENT '更新时间',
  `isvalid` tinyint(5) DEFAULT NULL COMMENT '是否有效',
  `isdeleted` tinyint(5) DEFAULT NULL COMMENT '是否删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `rms_department_pk3` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='公司';

-- ----------------------------
-- Records of rms_project
-- ----------------------------
INSERT INTO `rms_project` VALUES ('1', '1', null, '权限管理系统', '2w', '2016-08-29 16:25:10.000000', '2018-07-18 22:43:09.000000', '1', '0');
INSERT INTO `rms_project` VALUES ('5', '3', null, '吉风物联', '222we we we ', '2016-09-02 17:14:05.000000', '2018-10-21 18:45:01.000000', '1', '0');
INSERT INTO `rms_project` VALUES ('7', '1', null, '222222222222222', '23', '2018-01-30 10:12:01.000000', '2018-01-30 18:08:56.000000', '1', '0');
INSERT INTO `rms_project` VALUES ('10', '6', null, '植城平台', null, '2018-10-23 14:17:19.429000', '2018-10-23 14:17:19.429000', '1', '0');

-- ----------------------------
-- Table structure for rms_role
-- ----------------------------
DROP TABLE IF EXISTS `rms_role`;
CREATE TABLE `rms_role` (
  `id` varchar(36) NOT NULL COMMENT '主键',
  `rolename` varchar(30) DEFAULT NULL COMMENT '角色名称',
  `remarks` varchar(30) DEFAULT NULL COMMENT '备注',
  `createby` varchar(20) DEFAULT NULL COMMENT '创建人',
  `modifyby` varchar(40) DEFAULT NULL COMMENT '修改人',
  `createtime` datetime DEFAULT NULL COMMENT '添加时间',
  `modifytime` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `roletypes` smallint(6) DEFAULT NULL,
  `jurisdiction` longtext COMMENT '权限 的json数据',
  `companyid` int(11) DEFAULT NULL COMMENT '公司id',
  `projectid` int(11) DEFAULT NULL COMMENT '项目id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `rms_role_pk` (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='RMS_Role角色';

-- ----------------------------
-- Records of rms_role
-- ----------------------------
INSERT INTO `rms_role` VALUES ('0899cc67-665b-44e2-9c1b-34e092becf34', '天绘管理员', '舒服舒服', '1', '1', '2016-08-29 00:00:00', '2016-08-29 00:00:00', '1', null, '2', '0');
INSERT INTO `rms_role` VALUES ('24b1762f-0b17-4656-a0c0-7382f057cc34', 'we', 'wewww', null, 'admin', '2018-10-23 11:08:36', '2018-10-23 11:13:16', '1', '{\"button\":{\"manuinfo\":{\"manuid\":6,\"parentmanuid\":1,\"orderno\":0,\"manuname\":\"按钮管理\",\"url\":\"button\",\"isenable\":false,\"icon\":\"icon-user\",\"typeid\":2,\"valuename\":\"010205\",\"level\":1},\"nobuttonD\":{\"editInfo\":{\"manuid\":6,\"functionname\":\"editInfo\"}},\"havebuttonsD\":{\"addInfo\":{\"manuid\":6,\"orderno\":0,\"icon\":\"icon-add\",\"valuename\":\"addBtn\",\"functionname\":\"addInfo\",\"buttonname\":\"添加\"},\"del\":{\"manuid\":6,\"orderno\":2,\"icon\":\"icon-delete\",\"valuename\":\"delBtn\",\"functionname\":\"del\",\"buttonname\":\"删除\"},\"search\":{\"manuid\":6,\"orderno\":3,\"icon\":\"icon-search\",\"valuename\":\"divSearh\",\"functionname\":\"search\",\"buttonname\":\"搜索\"},\"showInfo\":{\"manuid\":6,\"orderno\":4,\"icon\":\"icon-zoom\",\"valuename\":\"detailsBtn\",\"functionname\":\"showInfo\",\"buttonname\":\"查看\"}}},\"manu\":{\"manuinfo\":{\"manuid\":8,\"parentmanuid\":1,\"orderno\":1,\"manuname\":\"菜单管理\",\"url\":\"manu\",\"isenable\":false,\"icon\":\"icon-note\",\"micon\":\"/Content/EasyUI/themes/icons/32/bell_error.png\",\"typeid\":2,\"valuename\":\"010206\",\"level\":1},\"nobuttonD\":{\"addInfo\":{\"manuid\":8,\"functionname\":\"addInfo\"},\"del\":{\"manuid\":8,\"functionname\":\"del\"},\"search\":{\"manuid\":8,\"functionname\":\"search\"},\"showInfo\":{\"manuid\":8,\"functionname\":\"showInfo\"}},\"havebuttonsD\":{\"editInfo\":{\"manuid\":8,\"orderno\":1,\"icon\":\"icon-edit\",\"valuename\":\"editBtn\",\"functionname\":\"editInfo\",\"buttonname\":\"修改\"}}},\"dictype\":{\"manuinfo\":{\"manuid\":5,\"parentmanuid\":2,\"orderno\":1,\"manuname\":\"字典类型\",\"url\":\"dictype\",\"isenable\":false,\"icon\":\"icon-page_white_star\",\"typeid\":2,\"valuename\":\"010101\",\"level\":1},\"nobuttonD\":{\"addInfo\":{\"manuid\":5,\"functionname\":\"addInfo\"},\"editInfo\":{\"manuid\":5,\"functionname\":\"editInfo\"},\"search\":{\"manuid\":5,\"functionname\":\"search\"},\"showInfo\":{\"manuid\":5,\"functionname\":\"showInfo\"}},\"havebuttonsD\":{\"del\":{\"manuid\":5,\"orderno\":2,\"icon\":\"icon-delete\",\"valuename\":\"delBtn\",\"functionname\":\"del\",\"buttonname\":\"删除\"}}},\"dictionary\":{\"manuinfo\":{\"manuid\":4,\"parentmanuid\":2,\"orderno\":2,\"manuname\":\"数据字典\",\"url\":\"dictionary\",\"isenable\":false,\"icon\":\"icon-heart\",\"typeid\":2,\"valuename\":\"010102\",\"level\":1},\"nobuttonD\":{\"addInfo\":{\"manuid\":4,\"functionname\":\"addInfo\"},\"del\":{\"manuid\":4,\"functionname\":\"del\"},\"editInfo\":{\"manuid\":4,\"functionname\":\"editInfo\"},\"search\":{\"manuid\":4,\"functionname\":\"search\"}},\"havebuttonsD\":{\"showInfo\":{\"manuid\":4,\"orderno\":2,\"icon\":\"icon-zoom\",\"valuename\":\"detailsBtn\",\"functionname\":\"showInfo\",\"buttonname\":\"查看\"}}},\"company\":{\"manuinfo\":{\"manuid\":17,\"parentmanuid\":2,\"orderno\":3,\"manuname\":\"公司管理\",\"url\":\"company\",\"isenable\":false,\"icon\":\"icon-note\",\"micon\":\"/Content/EasyUI/themes/icons/32/bell_error.png\",\"typeid\":2,\"valuename\":\"010103\",\"level\":1},\"nobuttonD\":{\"addInfo\":{\"manuid\":17,\"functionname\":\"addInfo\"},\"del\":{\"manuid\":17,\"functionname\":\"del\"},\"editInfo\":{\"manuid\":17,\"functionname\":\"editInfo\"}},\"havebuttonsD\":{}},\"project\":{\"manuinfo\":{\"manuid\":18,\"parentmanuid\":2,\"orderno\":4,\"manuname\":\"项目管理\",\"url\":\"project\",\"isenable\":false,\"icon\":\"icon-page_header_footer\",\"micon\":\"/Content/EasyUI/themes/icons/32/page.png\",\"typeid\":2,\"valuename\":\"010104\",\"level\":1},\"nobuttonD\":{\"addInfo\":{\"manuid\":18,\"functionname\":\"addInfo\"},\"del\":{\"manuid\":18,\"functionname\":\"del\"},\"editInfo\":{\"manuid\":18,\"functionname\":\"editInfo\"}},\"havebuttonsD\":{}},\"user\":{\"manuinfo\":{\"manuid\":9,\"parentmanuid\":1,\"orderno\":5,\"manuname\":\"用户管理\",\"url\":\"user\",\"isenable\":false,\"icon\":\"icon-user\",\"typeid\":2,\"valuename\":\"010204\",\"level\":1},\"nobuttonD\":{\"addInfo\":{\"manuid\":9,\"functionname\":\"addInfo\"},\"del\":{\"manuid\":9,\"functionname\":\"del\"},\"editInfo\":{\"manuid\":9,\"functionname\":\"editInfo\"},\"showInfo\":{\"manuid\":9,\"functionname\":\"showInfo\"}},\"havebuttonsD\":{\"search\":{\"manuid\":9,\"orderno\":4,\"icon\":\"icon-search\",\"valuename\":\"divSearh\",\"functionname\":\"search\",\"buttonname\":\"搜索\"}}},\"department\":{\"manuinfo\":{\"manuid\":10,\"parentmanuid\":1,\"orderno\":6,\"manuname\":\"部门管理\",\"url\":\"department\",\"isenable\":false,\"icon\":\"icon-door_open\",\"typeid\":2,\"valuename\":\"010203\",\"level\":1},\"nobuttonD\":{\"del\":{\"manuid\":10,\"functionname\":\"del\"},\"editInfo\":{\"manuid\":10,\"functionname\":\"editInfo\"},\"search\":{\"manuid\":10,\"functionname\":\"search\"},\"showInfo\":{\"manuid\":10,\"functionname\":\"showInfo\"}},\"havebuttonsD\":{\"addInfo\":{\"manuid\":10,\"orderno\":0,\"icon\":\"icon-add\",\"valuename\":\"addBtn\",\"functionname\":\"addInfo\",\"buttonname\":\"添加\"}}},\"permissionsystem\":{\"manuinfo\":{\"manuid\":1,\"parentmanuid\":0,\"orderno\":12,\"manuname\":\"权限管理\",\"url\":\"permissionsystem\",\"isenable\":false,\"icon\":\"icon-shape_move_forwards\",\"micon\":\"/Content/EasyUI/themes/icons/32/box.png\",\"typeid\":1,\"valuename\":\"0102\",\"level\":0},\"nobuttonD\":{},\"havebuttonsD\":{}}}', '1', '1');
INSERT INTO `rms_role` VALUES ('4ac8f35a-e006-4ddc-9fe9-90bec52fe0be', '植城开发人员', null, null, 'admin', '2018-10-23 14:27:08', '2018-10-23 14:27:08', '1', '{\"role\":{\"manuinfo\":{\"manuid\":69,\"parentmanuid\":67,\"orderno\":0,\"manuname\":\"角色管理\",\"url\":\"role\",\"isenable\":false,\"icon\":\"icon-stop\",\"typeid\":2,\"valuename\":\"0201\",\"level\":1},\"nobuttonD\":{},\"havebuttonsD\":{\"addInfo\":{\"manuid\":69,\"orderno\":0,\"icon\":\"icon-add\",\"valuename\":\"addBtn\",\"functionname\":\"addInfo\",\"buttonname\":\"添加\"},\"editInfo\":{\"manuid\":69,\"orderno\":1,\"icon\":\"icon-edit\",\"valuename\":\"editBtn\",\"functionname\":\"editInfo\",\"buttonname\":\"修改\"},\"del\":{\"manuid\":69,\"orderno\":2,\"icon\":\"icon-delete\",\"valuename\":\"delBtn\",\"functionname\":\"del\",\"buttonname\":\"删除\"},\"showInfo\":{\"manuid\":69,\"orderno\":3,\"icon\":\"icon-zoom\",\"valuename\":\"detailsBtn\",\"functionname\":\"showInfo\",\"buttonname\":\"查看\"},\"search\":{\"manuid\":69,\"orderno\":4,\"icon\":\"icon-search\",\"valuename\":\"divSearh\",\"functionname\":\"search\",\"buttonname\":\"搜索\"}}},\"authority\":{\"manuinfo\":{\"manuid\":67,\"parentmanuid\":0,\"orderno\":0,\"manuname\":\"权限管理\",\"url\":\"authority\",\"isenable\":false,\"icon\":\"icon-shape_3d\",\"typeid\":1,\"valuename\":\"02\",\"level\":0},\"nobuttonD\":{},\"havebuttonsD\":{}},\"base\":{\"manuinfo\":{\"manuid\":66,\"parentmanuid\":0,\"orderno\":1,\"manuname\":\"基础数据\",\"url\":\"base\",\"isenable\":false,\"icon\":\"icon-note\",\"micon\":\"34\",\"typeid\":1,\"valuename\":\"01\",\"level\":0},\"nobuttonD\":{},\"havebuttonsD\":{}},\"dictionary\":{\"manuinfo\":{\"manuid\":68,\"parentmanuid\":66,\"orderno\":2,\"manuname\":\"数据词典\",\"url\":\"dictionary\",\"isenable\":false,\"icon\":\"icon-sport_tennis\",\"typeid\":2,\"valuename\":\"0101\",\"level\":1},\"nobuttonD\":{},\"havebuttonsD\":{\"addInfo\":{\"manuid\":68,\"orderno\":0,\"icon\":\"icon-add\",\"valuename\":\"addBtn\",\"functionname\":\"addInfo\",\"buttonname\":\"添加\"},\"editInfo\":{\"manuid\":68,\"orderno\":1,\"icon\":\"icon-edit\",\"valuename\":\"editBtn\",\"functionname\":\"editInfo\",\"buttonname\":\"修改\"},\"del\":{\"manuid\":68,\"orderno\":2,\"icon\":\"icon-delete\",\"valuename\":\"delBtn\",\"functionname\":\"del\",\"buttonname\":\"删除\"},\"showInfo\":{\"manuid\":68,\"orderno\":3,\"icon\":\"icon-zoom\",\"valuename\":\"detailsBtn\",\"functionname\":\"showInfo\",\"buttonname\":\"查看\"},\"search\":{\"manuid\":68,\"orderno\":4,\"icon\":\"icon-search\",\"valuename\":\"divSearh\",\"functionname\":\"search\",\"buttonname\":\"搜索\"}}}}', '6', '10');
INSERT INTO `rms_role` VALUES ('54993d46-529c-423b-ad0f-667bbc17c3e0', '4', '4121212', '1', '1', '2018-07-17 00:00:00', '2018-10-22 17:39:22', '0', '{\r\n  \"server_mgt\": {\r\n    \"manuinfo\": {\r\n      \"manuid\": 57,\r\n      \"parentmanuid\": 33,\r\n      \"orderno\": 0,\r\n      \"manuname\": \"服务器管理\",\r\n      \"url\": \"server_mgt\",\r\n      \"isenable\": true,\r\n      \"icon\": \"icon-star\",\r\n      \"typeid\": 2,\r\n      \"valuename\": \"0108\",\r\n      \"level\": 0\r\n    },\r\n    \"nobuttonD\": {},\r\n    \"havebuttonsD\": {\r\n      \"AddInfo\": {\r\n        \"manuid\": 57,\r\n        \"orderno\": 0,\r\n        \"icon\": \"icon-add\",\r\n        \"valuename\": \"AddBtn\",\r\n        \"functionname\": \"AddInfo\",\r\n        \"buttonname\": \"添加\",\r\n        \"color\": \"success\"\r\n      },\r\n      \"EditInfo\": {\r\n        \"manuid\": 57,\r\n        \"orderno\": 1,\r\n        \"icon\": \"icon-edit\",\r\n        \"valuename\": \" EditBtn\",\r\n        \"functionname\": \"EditInfo\",\r\n        \"buttonname\": \"修改\"\r\n      },\r\n      \"Del\": {\r\n        \"manuid\": 57,\r\n        \"orderno\": 2,\r\n        \"icon\": \"icon-delete\",\r\n        \"valuename\": \"DelBtn\",\r\n        \"functionname\": \"Del\",\r\n        \"buttonname\": \"删除\",\r\n        \"color\": \"danger\"\r\n      },\r\n      \"ShowOP\": {\r\n        \"manuid\": 57,\r\n        \"orderno\": 3,\r\n        \"icon\": \"icon-zoom\",\r\n        \"valuename\": \"DetailsBtn\",\r\n        \"functionname\": \"ShowOP\",\r\n        \"buttonname\": \"查看\",\r\n        \"color\": \"info\"\r\n      },\r\n      \"Search\": {\r\n        \"manuid\": 57,\r\n        \"orderno\": 4,\r\n        \"icon\": \"icon-search\",\r\n        \"valuename\": \"DivSearh\",\r\n        \"functionname\": \"Search\",\r\n        \"buttonname\": \"搜索\",\r\n        \"color\": \"primary\"\r\n      }\r\n    }\r\n  },\r\n  \"aid_seed\": {\r\n    \"manuinfo\": {\r\n      \"manuid\": 34,\r\n      \"parentmanuid\": 33,\r\n      \"orderno\": 2,\r\n      \"manuname\": \"CID管理\",\r\n      \"url\": \"aid_seed\",\r\n      \"isenable\": true,\r\n      \"icon\": \"icon-pilcrow\",\r\n      \"typeid\": 2,\r\n      \"valuename\": \"0102\",\r\n      \"level\": 1\r\n    },\r\n    \"nobuttonD\": {},\r\n    \"havebuttonsD\": {\r\n      \"AddInfo\": {\r\n        \"manuid\": 34,\r\n        \"orderno\": 0,\r\n        \"icon\": \"icon-add\",\r\n        \"valuename\": \"AddBtn\",\r\n        \"functionname\": \"AddInfo\",\r\n        \"buttonname\": \"添加\",\r\n        \"color\": \"success\"\r\n      },\r\n      \"EditInfo\": {\r\n        \"manuid\": 34,\r\n        \"orderno\": 1,\r\n        \"icon\": \"icon-edit\",\r\n        \"valuename\": \" EditBtn\",\r\n        \"functionname\": \"EditInfo\",\r\n        \"buttonname\": \"修改\"\r\n      },\r\n      \"Del\": {\r\n        \"manuid\": 34,\r\n        \"orderno\": 2,\r\n        \"icon\": \"icon-delete\",\r\n        \"valuename\": \"DelBtn\",\r\n        \"functionname\": \"Del\",\r\n        \"buttonname\": \"删除\",\r\n        \"color\": \"danger\"\r\n      },\r\n      \"ShowOP\": {\r\n        \"manuid\": 34,\r\n        \"orderno\": 3,\r\n        \"icon\": \"icon-zoom\",\r\n        \"valuename\": \"DetailsBtn\",\r\n        \"functionname\": \"ShowOP\",\r\n        \"buttonname\": \"查看\",\r\n        \"color\": \"info\"\r\n      },\r\n      \"Search\": {\r\n        \"manuid\": 34,\r\n        \"orderno\": 4,\r\n        \"icon\": \"icon-search\",\r\n        \"valuename\": \"DivSearh\",\r\n        \"functionname\": \"Search\",\r\n        \"buttonname\": \"搜索\",\r\n        \"color\": \"primary\"\r\n      }\r\n    }\r\n  },\r\n  \"app_user\": {\r\n    \"manuinfo\": {\r\n      \"manuid\": 49,\r\n      \"parentmanuid\": 33,\r\n      \"orderno\": 2,\r\n      \"manuname\": \"app用户\",\r\n      \"url\": \"app_user\",\r\n      \"isenable\": true,\r\n      \"icon\": \"icon-user\",\r\n      \"typeid\": 2,\r\n      \"valuename\": \"0103\",\r\n      \"level\": 1\r\n    },\r\n    \"nobuttonD\": {},\r\n    \"havebuttonsD\": {\r\n      \"EditInfo\": {\r\n        \"manuid\": 49,\r\n        \"orderno\": 0,\r\n        \"icon\": \"icon-edit\",\r\n        \"valuename\": \" EditBtn\",\r\n        \"functionname\": \"EditInfo\",\r\n        \"buttonname\": \"修改\"\r\n      },\r\n      \"Del\": {\r\n        \"manuid\": 49,\r\n        \"orderno\": 1,\r\n        \"icon\": \"icon-delete\",\r\n        \"valuename\": \"DelBtn\",\r\n        \"functionname\": \"Del\",\r\n        \"buttonname\": \"删除\",\r\n        \"color\": \"danger\"\r\n      },\r\n      \"ShowOP\": {\r\n        \"manuid\": 49,\r\n        \"orderno\": 2,\r\n        \"icon\": \"icon-zoom\",\r\n        \"valuename\": \"DetailsBtn\",\r\n        \"functionname\": \"ShowOP\",\r\n        \"buttonname\": \"查看\",\r\n        \"color\": \"info\"\r\n      },\r\n      \"Search\": {\r\n        \"manuid\": 49,\r\n        \"orderno\": 3,\r\n        \"icon\": \"icon-search\",\r\n        \"valuename\": \"DivSearh\",\r\n        \"functionname\": \"Search\",\r\n        \"buttonname\": \"搜索\",\r\n        \"color\": \"primary\"\r\n      }\r\n    }\r\n  },\r\n  \"sys#\": {\r\n    \"manuinfo\": {\r\n      \"manuid\": 33,\r\n      \"parentmanuid\": 0,\r\n      \"orderno\": 2,\r\n      \"manuname\": \"设备管理\",\r\n      \"url\": \"Sys#\",\r\n      \"isenable\": true,\r\n      \"icon\": \"icon-color_swatch\",\r\n      \"typeid\": 0,\r\n      \"valuename\": \"01\",\r\n      \"level\": 0\r\n    },\r\n    \"nobuttonD\": {},\r\n    \"havebuttonsD\": {}\r\n  },\r\n  \"role\": {\r\n    \"manuinfo\": {\r\n      \"manuid\": 35,\r\n      \"parentmanuid\": 32,\r\n      \"orderno\": 3,\r\n      \"manuname\": \"角色\",\r\n      \"url\": \"role\",\r\n      \"isenable\": true,\r\n      \"icon\": \"fa-eye-slash\",\r\n      \"typeid\": 2,\r\n      \"valuename\": \"0202\",\r\n      \"level\": 1\r\n    },\r\n    \"nobuttonD\": {},\r\n    \"havebuttonsD\": {\r\n      \"ShowOP\": {\r\n        \"manuid\": 35,\r\n        \"orderno\": 0,\r\n        \"icon\": \"icon-zoom\",\r\n        \"valuename\": \"DetailsBtn\",\r\n        \"functionname\": \"ShowOP\",\r\n        \"buttonname\": \"查看\",\r\n        \"color\": \"info\"\r\n      },\r\n      \"ReFlashOP\": {\r\n        \"manuid\": 35,\r\n        \"orderno\": 1,\r\n        \"icon\": \"icon-disk_download\",\r\n        \"valuename\": \"ReFlashBtn\",\r\n        \"functionname\": \"ReFlashOP\",\r\n        \"buttonname\": \"更新\",\r\n        \"color\": \"purple\"\r\n      }\r\n    }\r\n  },\r\n  \"device\": {\r\n    \"manuinfo\": {\r\n      \"manuid\": 38,\r\n      \"parentmanuid\": 33,\r\n      \"orderno\": 3,\r\n      \"manuname\": \"设备列表\",\r\n      \"url\": \"device\",\r\n      \"isenable\": true,\r\n      \"icon\": \"icon-sport_golf_practice\",\r\n      \"typeid\": 2,\r\n      \"valuename\": \"0101\",\r\n      \"level\": 1\r\n    },\r\n    \"nobuttonD\": {},\r\n    \"havebuttonsD\": {\r\n      \"EditInfo\": {\r\n        \"manuid\": 38,\r\n        \"orderno\": 0,\r\n        \"icon\": \"icon-edit\",\r\n        \"valuename\": \" EditBtn\",\r\n        \"functionname\": \"EditInfo\",\r\n        \"buttonname\": \"修改\"\r\n      },\r\n      \"ShowOP\": {\r\n        \"manuid\": 38,\r\n        \"orderno\": 2,\r\n        \"icon\": \"icon-zoom\",\r\n        \"valuename\": \"DetailsBtn\",\r\n        \"functionname\": \"ShowOP\",\r\n        \"buttonname\": \"查看\",\r\n        \"color\": \"info\"\r\n      },\r\n      \"Search\": {\r\n        \"manuid\": 38,\r\n        \"orderno\": 3,\r\n        \"icon\": \"icon-search\",\r\n        \"valuename\": \"DivSearh\",\r\n        \"functionname\": \"Search\",\r\n        \"buttonname\": \"搜索\",\r\n        \"color\": \"primary\"\r\n      }\r\n    }\r\n  },\r\n  \"dev_type\": {\r\n    \"manuinfo\": {\r\n      \"manuid\": 53,\r\n      \"parentmanuid\": 33,\r\n      \"orderno\": 4,\r\n      \"manuname\": \"设备类型\",\r\n      \"url\": \"dev_type\",\r\n      \"isenable\": true,\r\n      \"icon\": \"icon-sport_soccer\",\r\n      \"typeid\": 2,\r\n      \"valuename\": \"0104\",\r\n      \"level\": 0\r\n    },\r\n    \"nobuttonD\": {},\r\n    \"havebuttonsD\": {\r\n      \"AddInfo\": {\r\n        \"manuid\": 53,\r\n        \"orderno\": 0,\r\n        \"icon\": \"icon-add\",\r\n        \"valuename\": \"AddBtn\",\r\n        \"functionname\": \"AddInfo\",\r\n        \"buttonname\": \"添加\",\r\n        \"color\": \"success\"\r\n      },\r\n      \"EditInfo\": {\r\n        \"manuid\": 53,\r\n        \"orderno\": 1,\r\n        \"icon\": \"icon-edit\",\r\n        \"valuename\": \" EditBtn\",\r\n        \"functionname\": \"EditInfo\",\r\n        \"buttonname\": \"修改\"\r\n      },\r\n      \"Del\": {\r\n        \"manuid\": 53,\r\n        \"orderno\": 2,\r\n        \"icon\": \"icon-delete\",\r\n        \"valuename\": \"DelBtn\",\r\n        \"functionname\": \"Del\",\r\n        \"buttonname\": \"删除\",\r\n        \"color\": \"danger\"\r\n      },\r\n      \"ShowOP\": {\r\n        \"manuid\": 53,\r\n        \"orderno\": 3,\r\n        \"icon\": \"icon-zoom\",\r\n        \"valuename\": \"DetailsBtn\",\r\n        \"functionname\": \"ShowOP\",\r\n        \"buttonname\": \"查看\",\r\n        \"color\": \"info\"\r\n      },\r\n      \"Search\": {\r\n        \"manuid\": 53,\r\n        \"orderno\": 4,\r\n        \"icon\": \"icon-search\",\r\n        \"valuename\": \"DivSearh\",\r\n        \"functionname\": \"Search\",\r\n        \"buttonname\": \"搜索\",\r\n        \"color\": \"primary\"\r\n      }\r\n    }\r\n  },\r\n  \"dev_brand\": {\r\n    \"manuinfo\": {\r\n      \"manuid\": 54,\r\n      \"parentmanuid\": 33,\r\n      \"orderno\": 5,\r\n      \"manuname\": \"设备品牌\",\r\n      \"url\": \"dev_brand\",\r\n      \"isenable\": true,\r\n      \"icon\": \"icon-rainbow\",\r\n      \"typeid\": 2,\r\n      \"valuename\": \"0105\",\r\n      \"level\": 0\r\n    },\r\n    \"nobuttonD\": {},\r\n    \"havebuttonsD\": {\r\n      \"AddInfo\": {\r\n        \"manuid\": 54,\r\n        \"orderno\": 0,\r\n        \"icon\": \"icon-add\",\r\n        \"valuename\": \"AddBtn\",\r\n        \"functionname\": \"AddInfo\",\r\n        \"buttonname\": \"添加\",\r\n        \"color\": \"success\"\r\n      },\r\n      \"EditInfo\": {\r\n        \"manuid\": 54,\r\n        \"orderno\": 1,\r\n        \"icon\": \"icon-edit\",\r\n        \"valuename\": \" EditBtn\",\r\n        \"functionname\": \"EditInfo\",\r\n        \"buttonname\": \"修改\"\r\n      },\r\n      \"Del\": {\r\n        \"manuid\": 54,\r\n        \"orderno\": 2,\r\n        \"icon\": \"icon-delete\",\r\n        \"valuename\": \"DelBtn\",\r\n        \"functionname\": \"Del\",\r\n        \"buttonname\": \"删除\",\r\n        \"color\": \"danger\"\r\n      },\r\n      \"ShowOP\": {\r\n        \"manuid\": 54,\r\n        \"orderno\": 3,\r\n        \"icon\": \"icon-zoom\",\r\n        \"valuename\": \"DetailsBtn\",\r\n        \"functionname\": \"ShowOP\",\r\n        \"buttonname\": \"查看\",\r\n        \"color\": \"info\"\r\n      },\r\n      \"Search\": {\r\n        \"manuid\": 54,\r\n        \"orderno\": 4,\r\n        \"icon\": \"icon-search\",\r\n        \"valuename\": \"DivSearh\",\r\n        \"functionname\": \"Search\",\r\n        \"buttonname\": \"搜索\",\r\n        \"color\": \"primary\"\r\n      }\r\n    }\r\n  },\r\n  \"dev_model\": {\r\n    \"manuinfo\": {\r\n      \"manuid\": 55,\r\n      \"parentmanuid\": 33,\r\n      \"orderno\": 6,\r\n      \"manuname\": \"设备型号\",\r\n      \"url\": \"dev_model\",\r\n      \"isenable\": true,\r\n      \"icon\": \"icon-flag_blue\",\r\n      \"typeid\": 2,\r\n      \"valuename\": \"0106\",\r\n      \"level\": 0\r\n    },\r\n    \"nobuttonD\": {},\r\n    \"havebuttonsD\": {\r\n      \"AddInfo\": {\r\n        \"manuid\": 55,\r\n        \"orderno\": 0,\r\n        \"icon\": \"icon-add\",\r\n        \"valuename\": \"AddBtn\",\r\n        \"functionname\": \"AddInfo\",\r\n        \"buttonname\": \"添加\",\r\n        \"color\": \"success\"\r\n      },\r\n      \"EditInfo\": {\r\n        \"manuid\": 55,\r\n        \"orderno\": 1,\r\n        \"icon\": \"icon-edit\",\r\n        \"valuename\": \" EditBtn\",\r\n        \"functionname\": \"EditInfo\",\r\n        \"buttonname\": \"修改\"\r\n      },\r\n      \"Del\": {\r\n        \"manuid\": 55,\r\n        \"orderno\": 2,\r\n        \"icon\": \"icon-delete\",\r\n        \"valuename\": \"DelBtn\",\r\n        \"functionname\": \"Del\",\r\n        \"buttonname\": \"删除\",\r\n        \"color\": \"danger\"\r\n      },\r\n      \"ShowOP\": {\r\n        \"manuid\": 55,\r\n        \"orderno\": 3,\r\n        \"icon\": \"icon-zoom\",\r\n        \"valuename\": \"DetailsBtn\",\r\n        \"functionname\": \"ShowOP\",\r\n        \"buttonname\": \"查看\",\r\n        \"color\": \"info\"\r\n      },\r\n      \"Search\": {\r\n        \"manuid\": 55,\r\n        \"orderno\": 4,\r\n        \"icon\": \"icon-search\",\r\n        \"valuename\": \"DivSearh\",\r\n        \"functionname\": \"Search\",\r\n        \"buttonname\": \"搜索\",\r\n        \"color\": \"primary\"\r\n      }\r\n    }\r\n  },\r\n  \"key_library\": {\r\n    \"manuinfo\": {\r\n      \"manuid\": 56,\r\n      \"parentmanuid\": 33,\r\n      \"orderno\": 7,\r\n      \"manuname\": \"按键库\",\r\n      \"url\": \"key_library\",\r\n      \"isenable\": true,\r\n      \"icon\": \"icon-shape_3d\",\r\n      \"typeid\": 2,\r\n      \"valuename\": \"0107\",\r\n      \"level\": 0\r\n    },\r\n    \"nobuttonD\": {},\r\n    \"havebuttonsD\": {\r\n      \"AddInfo\": {\r\n        \"manuid\": 56,\r\n        \"orderno\": 0,\r\n        \"icon\": \"icon-add\",\r\n        \"valuename\": \"AddBtn\",\r\n        \"functionname\": \"AddInfo\",\r\n        \"buttonname\": \"添加\",\r\n        \"color\": \"success\"\r\n      },\r\n      \"EditInfo\": {\r\n        \"manuid\": 56,\r\n        \"orderno\": 1,\r\n        \"icon\": \"icon-edit\",\r\n        \"valuename\": \" EditBtn\",\r\n        \"functionname\": \"EditInfo\",\r\n        \"buttonname\": \"修改\"\r\n      },\r\n      \"Del\": {\r\n        \"manuid\": 56,\r\n        \"orderno\": 2,\r\n        \"icon\": \"icon-delete\",\r\n        \"valuename\": \"DelBtn\",\r\n        \"functionname\": \"Del\",\r\n        \"buttonname\": \"删除\",\r\n        \"color\": \"danger\"\r\n      },\r\n      \"ShowOP\": {\r\n        \"manuid\": 56,\r\n        \"orderno\": 3,\r\n        \"icon\": \"icon-zoom\",\r\n        \"valuename\": \"DetailsBtn\",\r\n        \"functionname\": \"ShowOP\",\r\n        \"buttonname\": \"查看\",\r\n        \"color\": \"info\"\r\n      },\r\n      \"Search\": {\r\n        \"manuid\": 56,\r\n        \"orderno\": 4,\r\n        \"icon\": \"icon-search\",\r\n        \"valuename\": \"DivSearh\",\r\n        \"functionname\": \"Search\",\r\n        \"buttonname\": \"搜索\",\r\n        \"color\": \"primary\"\r\n      }\r\n    }\r\n  },\r\n  \"sysrole\": {\r\n    \"manuinfo\": {\r\n      \"manuid\": 32,\r\n      \"parentmanuid\": 0,\r\n      \"orderno\": 10,\r\n      \"manuname\": \"权限管理\",\r\n      \"url\": \"SysRole\",\r\n      \"isenable\": true,\r\n      \"icon\": \"fa-desktop\",\r\n      \"typeid\": 0,\r\n      \"valuename\": \"02\",\r\n      \"level\": 0\r\n    },\r\n    \"nobuttonD\": {},\r\n    \"havebuttonsD\": {}\r\n  }\r\n}', '3', '5');
INSERT INTO `rms_role` VALUES ('8d17e9ae-778c-4489-b3e6-69990a226c20', '系统开发员', '1212', '1', '1', '2016-07-28 00:00:00', '2016-08-29 00:00:00', '1', '{\"button\":{\"manuinfo\":{\"manuid\":6,\"parentmanuid\":1,\"orderno\":0,\"manuname\":\"按钮管理\",\"url\":\"button\",\"isenable\":false,\"icon\":\"icon-user\",\"typeid\":2,\"valuename\":\"010205\",\"level\":1},\"nobuttonD\":{},\"havebuttonsD\":{\"addInfo\":{\"manuid\":6,\"orderno\":0,\"icon\":\"icon-add\",\"valuename\":\"addBtn\",\"functionname\":\"addInfo\",\"buttonname\":\"添加\"},\"editInfo\":{\"manuid\":6,\"orderno\":1,\"icon\":\"icon-edit\",\"valuename\":\"editBtn\",\"functionname\":\"editInfo\",\"buttonname\":\"修改\"},\"del\":{\"manuid\":6,\"orderno\":2,\"icon\":\"icon-delete\",\"valuename\":\"delBtn\",\"functionname\":\"del\",\"buttonname\":\"删除\"},\"search\":{\"manuid\":6,\"orderno\":3,\"icon\":\"icon-search\",\"valuename\":\"divSearh\",\"functionname\":\"search\",\"buttonname\":\"搜索\"},\"showInfo\":{\"manuid\":6,\"orderno\":4,\"icon\":\"icon-zoom\",\"valuename\":\"detailsBtn\",\"functionname\":\"showInfo\",\"buttonname\":\"查看\"}}},\"sl_advertise\":{\"manuinfo\":{\"manuid\":11,\"parentmanuid\":3,\"orderno\":1,\"manuname\":\"广告管理\",\"url\":\"sl_advertise\",\"isenable\":false,\"icon\":\"icon-television\",\"typeid\":2,\"valuename\":\"0202\",\"level\":1},\"nobuttonD\":{},\"havebuttonsD\":{}},\"manu\":{\"manuinfo\":{\"manuid\":8,\"parentmanuid\":1,\"orderno\":1,\"manuname\":\"菜单管理\",\"url\":\"manu\",\"isenable\":false,\"icon\":\"icon-note\",\"micon\":\"/Content/EasyUI/themes/icons/32/bell_error.png\",\"typeid\":2,\"valuename\":\"010206\",\"level\":1},\"nobuttonD\":{},\"havebuttonsD\":{\"addInfo\":{\"manuid\":8,\"orderno\":0,\"icon\":\"icon-add\",\"valuename\":\"addBtn\",\"functionname\":\"addInfo\",\"buttonname\":\"添加\"},\"editInfo\":{\"manuid\":8,\"orderno\":1,\"icon\":\"icon-edit\",\"valuename\":\"editBtn\",\"functionname\":\"editInfo\",\"buttonname\":\"修改\"},\"showInfo\":{\"manuid\":8,\"orderno\":2,\"icon\":\"icon-zoom\",\"valuename\":\"detailsBtn\",\"functionname\":\"showInfo\",\"buttonname\":\"查看\"},\"del\":{\"manuid\":8,\"orderno\":3,\"icon\":\"icon-delete\",\"valuename\":\"delBtn\",\"functionname\":\"del\",\"buttonname\":\"删除\"},\"search\":{\"manuid\":8,\"orderno\":4,\"icon\":\"icon-search\",\"valuename\":\"divSearh\",\"functionname\":\"search\",\"buttonname\":\"搜索\"}}},\"dictype\":{\"manuinfo\":{\"manuid\":5,\"parentmanuid\":2,\"orderno\":1,\"manuname\":\"字典类型\",\"url\":\"dictype\",\"isenable\":false,\"icon\":\"icon-page_white_star\",\"typeid\":2,\"valuename\":\"010101\",\"level\":1},\"nobuttonD\":{},\"havebuttonsD\":{\"addInfo\":{\"manuid\":5,\"orderno\":0,\"icon\":\"icon-add\",\"valuename\":\"addBtn\",\"functionname\":\"addInfo\",\"buttonname\":\"添加\"},\"editInfo\":{\"manuid\":5,\"orderno\":1,\"icon\":\"icon-edit\",\"valuename\":\"editBtn\",\"functionname\":\"editInfo\",\"buttonname\":\"修改\"},\"del\":{\"manuid\":5,\"orderno\":2,\"icon\":\"icon-delete\",\"valuename\":\"delBtn\",\"functionname\":\"del\",\"buttonname\":\"删除\"},\"search\":{\"manuid\":5,\"orderno\":3,\"icon\":\"icon-search\",\"valuename\":\"divSearh\",\"functionname\":\"search\",\"buttonname\":\"搜索\"},\"showInfo\":{\"manuid\":5,\"orderno\":4,\"icon\":\"icon-zoom\",\"valuename\":\"detailsBtn\",\"functionname\":\"showInfo\",\"buttonname\":\"查看\"}}},\"sysset\":{\"manuinfo\":{\"manuid\":2,\"parentmanuid\":0,\"orderno\":2,\"manuname\":\"基础设置\",\"url\":\"sysset\",\"isenable\":false,\"icon\":\"icon-note\",\"typeid\":1,\"valuename\":\"0101\",\"level\":0},\"nobuttonD\":{},\"havebuttonsD\":{}},\"role\":{\"manuinfo\":{\"manuid\":7,\"parentmanuid\":1,\"orderno\":2,\"manuname\":\"角色管理\",\"url\":\"role\",\"isenable\":false,\"icon\":\"icon-key_go\",\"typeid\":2,\"valuename\":\"010201\",\"level\":1},\"nobuttonD\":{},\"havebuttonsD\":{\"addInfo\":{\"manuid\":7,\"orderno\":0,\"icon\":\"icon-add\",\"valuename\":\"addBtn\",\"functionname\":\"addInfo\",\"buttonname\":\"添加\"},\"editInfo\":{\"manuid\":7,\"orderno\":1,\"icon\":\"icon-edit\",\"valuename\":\"editBtn\",\"functionname\":\"editInfo\",\"buttonname\":\"修改\"},\"showInfo\":{\"manuid\":7,\"orderno\":2,\"icon\":\"icon-zoom\",\"valuename\":\"detailsBtn\",\"functionname\":\"showInfo\",\"buttonname\":\"查看\"},\"del\":{\"manuid\":7,\"orderno\":3,\"icon\":\"icon-delete\",\"valuename\":\"delBtn\",\"functionname\":\"del\",\"buttonname\":\"删除\"},\"search\":{\"manuid\":7,\"orderno\":4,\"icon\":\"icon-search\",\"valuename\":\"divSearh\",\"functionname\":\"search\",\"buttonname\":\"搜索\"}}},\"main?values\\u003d02\":{\"manuinfo\":{\"manuid\":3,\"parentmanuid\":0,\"orderno\":2,\"manuname\":\"塞拉数据\",\"url\":\"main?values\\u003d02\",\"isenable\":false,\"icon\":\"menu-icon-7\",\"typeid\":0,\"valuename\":\"02\",\"level\":0},\"nobuttonD\":{},\"havebuttonsD\":{}},\"dictionary\":{\"manuinfo\":{\"manuid\":4,\"parentmanuid\":2,\"orderno\":2,\"manuname\":\"数据字典\",\"url\":\"dictionary\",\"isenable\":false,\"icon\":\"icon-heart\",\"typeid\":2,\"valuename\":\"010102\",\"level\":1},\"nobuttonD\":{},\"havebuttonsD\":{\"addInfo\":{\"manuid\":4,\"orderno\":0,\"icon\":\"icon-add\",\"valuename\":\"addBtn\",\"functionname\":\"addInfo\",\"buttonname\":\"添加\"},\"editInfo\":{\"manuid\":4,\"orderno\":1,\"icon\":\"icon-edit\",\"valuename\":\"editBtn\",\"functionname\":\"editInfo\",\"buttonname\":\"修改\"},\"showInfo\":{\"manuid\":4,\"orderno\":2,\"icon\":\"icon-zoom\",\"valuename\":\"detailsBtn\",\"functionname\":\"showInfo\",\"buttonname\":\"查看\"},\"del\":{\"manuid\":4,\"orderno\":3,\"icon\":\"icon-delete\",\"valuename\":\"delBtn\",\"functionname\":\"del\",\"buttonname\":\"删除\"},\"search\":{\"manuid\":4,\"orderno\":4,\"icon\":\"icon-search\",\"valuename\":\"divSearh\",\"functionname\":\"search\",\"buttonname\":\"搜索\"}}},\"device\":{\"manuinfo\":{\"manuid\":12,\"parentmanuid\":3,\"orderno\":2,\"manuname\":\"设备列表1\",\"url\":\"device\",\"isenable\":false,\"icon\":\"icon-shape_flip_horizontal\",\"typeid\":2,\"valuename\":\"0201\",\"level\":1},\"nobuttonD\":{},\"havebuttonsD\":{}},\"sl_services\":{\"manuinfo\":{\"manuid\":13,\"parentmanuid\":3,\"orderno\":3,\"manuname\":\"服务站管理\",\"url\":\"sl_services\",\"isenable\":false,\"icon\":\"icon-color_swatch\",\"typeid\":1,\"valuename\":\"0203\",\"level\":1},\"nobuttonD\":{},\"havebuttonsD\":{}},\"company\":{\"manuinfo\":{\"manuid\":17,\"parentmanuid\":2,\"orderno\":3,\"manuname\":\"公司管理\",\"url\":\"company\",\"isenable\":false,\"icon\":\"icon-note\",\"micon\":\"/Content/EasyUI/themes/icons/32/bell_error.png\",\"typeid\":2,\"valuename\":\"010103\",\"level\":1},\"nobuttonD\":{},\"havebuttonsD\":{\"addInfo\":{\"manuid\":17,\"orderno\":0,\"icon\":\"icon-add\",\"valuename\":\"addBtn\",\"functionname\":\"addInfo\",\"buttonname\":\"添加\"},\"editInfo\":{\"manuid\":17,\"orderno\":1,\"icon\":\"icon-edit\",\"valuename\":\"editBtn\",\"functionname\":\"editInfo\",\"buttonname\":\"修改\"},\"del\":{\"manuid\":17,\"orderno\":2,\"icon\":\"icon-delete\",\"valuename\":\"delBtn\",\"functionname\":\"del\",\"buttonname\":\"删除\"}}},\"project\":{\"manuinfo\":{\"manuid\":18,\"parentmanuid\":2,\"orderno\":4,\"manuname\":\"项目管理\",\"url\":\"project\",\"isenable\":false,\"icon\":\"icon-page_header_footer\",\"micon\":\"/Content/EasyUI/themes/icons/32/page.png\",\"typeid\":2,\"valuename\":\"010104\",\"level\":1},\"nobuttonD\":{},\"havebuttonsD\":{\"addInfo\":{\"manuid\":18,\"orderno\":0,\"icon\":\"icon-add\",\"valuename\":\"addBtn\",\"functionname\":\"addInfo\",\"buttonname\":\"添加\"},\"editInfo\":{\"manuid\":18,\"orderno\":1,\"icon\":\"icon-edit\",\"valuename\":\"editBtn\",\"functionname\":\"editInfo\",\"buttonname\":\"修改\"},\"del\":{\"manuid\":18,\"orderno\":2,\"icon\":\"icon-delete\",\"valuename\":\"delBtn\",\"functionname\":\"del\",\"buttonname\":\"删除\"}}},\"user\":{\"manuinfo\":{\"manuid\":9,\"parentmanuid\":1,\"orderno\":5,\"manuname\":\"用户管理\",\"url\":\"user\",\"isenable\":false,\"icon\":\"icon-user\",\"typeid\":2,\"valuename\":\"010204\",\"level\":1},\"nobuttonD\":{},\"havebuttonsD\":{\"addInfo\":{\"manuid\":9,\"orderno\":0,\"icon\":\"icon-add\",\"valuename\":\"addBtn\",\"functionname\":\"addInfo\",\"buttonname\":\"添加\"},\"del\":{\"manuid\":9,\"orderno\":1,\"icon\":\"icon-delete\",\"valuename\":\"delBtn\",\"functionname\":\"del\",\"buttonname\":\"删除\"},\"editInfo\":{\"manuid\":9,\"orderno\":2,\"icon\":\"icon-edit\",\"valuename\":\"editBtn\",\"functionname\":\"editInfo\",\"buttonname\":\"修改\"},\"showInfo\":{\"manuid\":9,\"orderno\":3,\"icon\":\"icon-zoom\",\"valuename\":\"detailsBtn\",\"functionname\":\"showInfo\",\"buttonname\":\"查看\"},\"search\":{\"manuid\":9,\"orderno\":4,\"icon\":\"icon-search\",\"valuename\":\"divSearh\",\"functionname\":\"search\",\"buttonname\":\"搜索\"}}},\"department\":{\"manuinfo\":{\"manuid\":10,\"parentmanuid\":1,\"orderno\":6,\"manuname\":\"部门管理\",\"url\":\"department\",\"isenable\":false,\"icon\":\"icon-door_open\",\"typeid\":2,\"valuename\":\"010203\",\"level\":1},\"nobuttonD\":{},\"havebuttonsD\":{\"addInfo\":{\"manuid\":10,\"orderno\":0,\"icon\":\"icon-add\",\"valuename\":\"addBtn\",\"functionname\":\"addInfo\",\"buttonname\":\"添加\"},\"editInfo\":{\"manuid\":10,\"orderno\":1,\"icon\":\"icon-edit\",\"valuename\":\"editBtn\",\"functionname\":\"editInfo\",\"buttonname\":\"修改\"},\"showInfo\":{\"manuid\":10,\"orderno\":2,\"icon\":\"icon-zoom\",\"valuename\":\"detailsBtn\",\"functionname\":\"showInfo\",\"buttonname\":\"查看\"},\"del\":{\"manuid\":10,\"orderno\":3,\"icon\":\"icon-delete\",\"valuename\":\"delBtn\",\"functionname\":\"del\",\"buttonname\":\"删除\"},\"search\":{\"manuid\":10,\"orderno\":4,\"icon\":\"icon-search\",\"valuename\":\"divSearh\",\"functionname\":\"search\",\"buttonname\":\"搜索\"}}},\"permissionsystem\":{\"manuinfo\":{\"manuid\":1,\"parentmanuid\":0,\"orderno\":12,\"manuname\":\"权限管理\",\"url\":\"permissionsystem\",\"isenable\":false,\"icon\":\"icon-shape_move_forwards\",\"micon\":\"/Content/EasyUI/themes/icons/32/box.png\",\"typeid\":1,\"valuename\":\"0102\",\"level\":0},\"nobuttonD\":{},\"havebuttonsD\":{}}}', '1', '1');
INSERT INTO `rms_role` VALUES ('a3e4cc49-3df2-4550-b321-ea68e2dc89ae', '1', '2', '1', '1', '2018-07-13 00:00:00', '2018-07-16 00:00:00', '1', '{\r\n  \"server_mgt\": {\r\n    \"manuinfo\": {\r\n      \"manuid\": 57,\r\n      \"parentmanuid\": 33,\r\n      \"orderno\": 0,\r\n      \"manuname\": \"服务器管理\",\r\n      \"url\": \"server_mgt\",\r\n      \"isenable\": true,\r\n      \"icon\": \"icon-star\",\r\n      \"typeid\": 2,\r\n      \"valuename\": \"0108\",\r\n      \"level\": 0\r\n    },\r\n    \"nobuttonD\": {},\r\n    \"havebuttonsD\": {\r\n      \"AddInfo\": {\r\n        \"manuid\": 57,\r\n        \"orderno\": 0,\r\n        \"icon\": \"icon-add\",\r\n        \"valuename\": \"AddBtn\",\r\n        \"functionname\": \"AddInfo\",\r\n        \"buttonname\": \"添加\",\r\n        \"color\": \"success\"\r\n      },\r\n      \"EditInfo\": {\r\n        \"manuid\": 57,\r\n        \"orderno\": 1,\r\n        \"icon\": \"icon-edit\",\r\n        \"valuename\": \" EditBtn\",\r\n        \"functionname\": \"EditInfo\",\r\n        \"buttonname\": \"修改\",\r\n        \"color\": \"warning\"\r\n      },\r\n      \"Del\": {\r\n        \"manuid\": 57,\r\n        \"orderno\": 2,\r\n        \"icon\": \"icon-delete\",\r\n        \"valuename\": \"DelBtn\",\r\n        \"functionname\": \"Del\",\r\n        \"buttonname\": \"删除\",\r\n        \"color\": \"danger\"\r\n      },\r\n      \"ShowOP\": {\r\n        \"manuid\": 57,\r\n        \"orderno\": 3,\r\n        \"icon\": \"icon-zoom\",\r\n        \"valuename\": \"DetailsBtn\",\r\n        \"functionname\": \"ShowOP\",\r\n        \"buttonname\": \"查看\",\r\n        \"color\": \"info\"\r\n      },\r\n      \"Search\": {\r\n        \"manuid\": 57,\r\n        \"orderno\": 4,\r\n        \"icon\": \"icon-search\",\r\n        \"valuename\": \"DivSearh\",\r\n        \"functionname\": \"Search\",\r\n        \"buttonname\": \"搜索\",\r\n        \"color\": \"primary\"\r\n      }\r\n    }\r\n  },\r\n  \"aid_seed\": {\r\n    \"manuinfo\": {\r\n      \"manuid\": 34,\r\n      \"parentmanuid\": 33,\r\n      \"orderno\": 2,\r\n      \"manuname\": \"CID管理\",\r\n      \"url\": \"aid_seed\",\r\n      \"isenable\": true,\r\n      \"icon\": \"icon-pilcrow\",\r\n      \"typeid\": 2,\r\n      \"valuename\": \"0102\",\r\n      \"level\": 1\r\n    },\r\n    \"nobuttonD\": {},\r\n    \"havebuttonsD\": {\r\n      \"AddInfo\": {\r\n        \"manuid\": 34,\r\n        \"orderno\": 0,\r\n        \"icon\": \"icon-add\",\r\n        \"valuename\": \"AddBtn\",\r\n        \"functionname\": \"AddInfo\",\r\n        \"buttonname\": \"添加\",\r\n        \"color\": \"success\"\r\n      },\r\n      \"EditInfo\": {\r\n        \"manuid\": 34,\r\n        \"orderno\": 1,\r\n        \"icon\": \"icon-edit\",\r\n        \"valuename\": \" EditBtn\",\r\n        \"functionname\": \"EditInfo\",\r\n        \"buttonname\": \"修改\",\r\n        \"color\": \"warning\"\r\n      },\r\n      \"Del\": {\r\n        \"manuid\": 34,\r\n        \"orderno\": 2,\r\n        \"icon\": \"icon-delete\",\r\n        \"valuename\": \"DelBtn\",\r\n        \"functionname\": \"Del\",\r\n        \"buttonname\": \"删除\",\r\n        \"color\": \"danger\"\r\n      },\r\n      \"ShowOP\": {\r\n        \"manuid\": 34,\r\n        \"orderno\": 3,\r\n        \"icon\": \"icon-zoom\",\r\n        \"valuename\": \"DetailsBtn\",\r\n        \"functionname\": \"ShowOP\",\r\n        \"buttonname\": \"查看\",\r\n        \"color\": \"info\"\r\n      },\r\n      \"Search\": {\r\n        \"manuid\": 34,\r\n        \"orderno\": 4,\r\n        \"icon\": \"icon-search\",\r\n        \"valuename\": \"DivSearh\",\r\n        \"functionname\": \"Search\",\r\n        \"buttonname\": \"搜索\",\r\n        \"color\": \"primary\"\r\n      }\r\n    }\r\n  },\r\n  \"app_user\": {\r\n    \"manuinfo\": {\r\n      \"manuid\": 49,\r\n      \"parentmanuid\": 33,\r\n      \"orderno\": 2,\r\n      \"manuname\": \"app用户\",\r\n      \"url\": \"app_user\",\r\n      \"isenable\": true,\r\n      \"icon\": \"icon-user\",\r\n      \"typeid\": 2,\r\n      \"valuename\": \"0103\",\r\n      \"level\": 1\r\n    },\r\n    \"nobuttonD\": {},\r\n    \"havebuttonsD\": {\r\n      \"EditInfo\": {\r\n        \"manuid\": 49,\r\n        \"orderno\": 0,\r\n        \"icon\": \"icon-edit\",\r\n        \"valuename\": \" EditBtn\",\r\n        \"functionname\": \"EditInfo\",\r\n        \"buttonname\": \"修改\",\r\n        \"color\": \"warning\"\r\n      },\r\n      \"Del\": {\r\n        \"manuid\": 49,\r\n        \"orderno\": 1,\r\n        \"icon\": \"icon-delete\",\r\n        \"valuename\": \"DelBtn\",\r\n        \"functionname\": \"Del\",\r\n        \"buttonname\": \"删除\",\r\n        \"color\": \"danger\"\r\n      },\r\n      \"ShowOP\": {\r\n        \"manuid\": 49,\r\n        \"orderno\": 2,\r\n        \"icon\": \"icon-zoom\",\r\n        \"valuename\": \"DetailsBtn\",\r\n        \"functionname\": \"ShowOP\",\r\n        \"buttonname\": \"查看\",\r\n        \"color\": \"info\"\r\n      },\r\n      \"Search\": {\r\n        \"manuid\": 49,\r\n        \"orderno\": 3,\r\n        \"icon\": \"icon-search\",\r\n        \"valuename\": \"DivSearh\",\r\n        \"functionname\": \"Search\",\r\n        \"buttonname\": \"搜索\",\r\n        \"color\": \"primary\"\r\n      }\r\n    }\r\n  },\r\n  \"sys#\": {\r\n    \"manuinfo\": {\r\n      \"manuid\": 33,\r\n      \"parentmanuid\": 0,\r\n      \"orderno\": 2,\r\n      \"manuname\": \"设备管理\",\r\n      \"url\": \"Sys#\",\r\n      \"isenable\": true,\r\n      \"icon\": \"icon-color_swatch\",\r\n      \"typeid\": 0,\r\n      \"valuename\": \"01\",\r\n      \"level\": 0\r\n    },\r\n    \"nobuttonD\": {},\r\n    \"havebuttonsD\": {}\r\n  },\r\n  \"role\": {\r\n    \"manuinfo\": {\r\n      \"manuid\": 35,\r\n      \"parentmanuid\": 32,\r\n      \"orderno\": 3,\r\n      \"manuname\": \"角色\",\r\n      \"url\": \"role\",\r\n      \"isenable\": true,\r\n      \"icon\": \"fa-eye-slash\",\r\n      \"typeid\": 2,\r\n      \"valuename\": \"0202\",\r\n      \"level\": 1\r\n    },\r\n    \"nobuttonD\": {},\r\n    \"havebuttonsD\": {\r\n      \"ShowOP\": {\r\n        \"manuid\": 35,\r\n        \"orderno\": 0,\r\n        \"icon\": \"icon-zoom\",\r\n        \"valuename\": \"DetailsBtn\",\r\n        \"functionname\": \"ShowOP\",\r\n        \"buttonname\": \"查看\",\r\n        \"color\": \"info\"\r\n      },\r\n      \"ReFlashOP\": {\r\n        \"manuid\": 35,\r\n        \"orderno\": 1,\r\n        \"icon\": \"icon-disk_download\",\r\n        \"valuename\": \"ReFlashBtn\",\r\n        \"functionname\": \"ReFlashOP\",\r\n        \"buttonname\": \"更新\",\r\n        \"color\": \"purple\"\r\n      }\r\n    }\r\n  },\r\n  \"device\": {\r\n    \"manuinfo\": {\r\n      \"manuid\": 38,\r\n      \"parentmanuid\": 33,\r\n      \"orderno\": 3,\r\n      \"manuname\": \"设备列表\",\r\n      \"url\": \"device\",\r\n      \"isenable\": true,\r\n      \"icon\": \"icon-sport_golf_practice\",\r\n      \"typeid\": 2,\r\n      \"valuename\": \"0101\",\r\n      \"level\": 1\r\n    },\r\n    \"nobuttonD\": {},\r\n    \"havebuttonsD\": {\r\n      \"EditInfo\": {\r\n        \"manuid\": 38,\r\n        \"orderno\": 0,\r\n        \"icon\": \"icon-edit\",\r\n        \"valuename\": \" EditBtn\",\r\n        \"functionname\": \"EditInfo\",\r\n        \"buttonname\": \"修改\",\r\n        \"color\": \"warning\"\r\n      },\r\n      \"ShowOP\": {\r\n        \"manuid\": 38,\r\n        \"orderno\": 2,\r\n        \"icon\": \"icon-zoom\",\r\n        \"valuename\": \"DetailsBtn\",\r\n        \"functionname\": \"ShowOP\",\r\n        \"buttonname\": \"查看\",\r\n        \"color\": \"info\"\r\n      },\r\n      \"Search\": {\r\n        \"manuid\": 38,\r\n        \"orderno\": 3,\r\n        \"icon\": \"icon-search\",\r\n        \"valuename\": \"DivSearh\",\r\n        \"functionname\": \"Search\",\r\n        \"buttonname\": \"搜索\",\r\n        \"color\": \"primary\"\r\n      },\r\n      \"QRcode\": {\r\n        \"manuid\": 38,\r\n        \"orderno\": 4,\r\n        \"icon\": \"fa-bell\",\r\n        \"valuename\": \"QRcodeBtn\",\r\n        \"functionname\": \"QRcode\",\r\n        \"buttonname\": \"二维码\",\r\n        \"color\": \"default\"\r\n      }\r\n    }\r\n  },\r\n  \"dev_type\": {\r\n    \"manuinfo\": {\r\n      \"manuid\": 53,\r\n      \"parentmanuid\": 33,\r\n      \"orderno\": 4,\r\n      \"manuname\": \"设备类型\",\r\n      \"url\": \"dev_type\",\r\n      \"isenable\": true,\r\n      \"icon\": \"icon-sport_soccer\",\r\n      \"typeid\": 2,\r\n      \"valuename\": \"0104\",\r\n      \"level\": 0\r\n    },\r\n    \"nobuttonD\": {},\r\n    \"havebuttonsD\": {\r\n      \"AddInfo\": {\r\n        \"manuid\": 53,\r\n        \"orderno\": 0,\r\n        \"icon\": \"icon-add\",\r\n        \"valuename\": \"AddBtn\",\r\n        \"functionname\": \"AddInfo\",\r\n        \"buttonname\": \"添加\",\r\n        \"color\": \"success\"\r\n      },\r\n      \"EditInfo\": {\r\n        \"manuid\": 53,\r\n        \"orderno\": 1,\r\n        \"icon\": \"icon-edit\",\r\n        \"valuename\": \" EditBtn\",\r\n        \"functionname\": \"EditInfo\",\r\n        \"buttonname\": \"修改\",\r\n        \"color\": \"warning\"\r\n      },\r\n      \"Del\": {\r\n        \"manuid\": 53,\r\n        \"orderno\": 2,\r\n        \"icon\": \"icon-delete\",\r\n        \"valuename\": \"DelBtn\",\r\n        \"functionname\": \"Del\",\r\n        \"buttonname\": \"删除\",\r\n        \"color\": \"danger\"\r\n      },\r\n      \"ShowOP\": {\r\n        \"manuid\": 53,\r\n        \"orderno\": 3,\r\n        \"icon\": \"icon-zoom\",\r\n        \"valuename\": \"DetailsBtn\",\r\n        \"functionname\": \"ShowOP\",\r\n        \"buttonname\": \"查看\",\r\n        \"color\": \"info\"\r\n      },\r\n      \"Search\": {\r\n        \"manuid\": 53,\r\n        \"orderno\": 4,\r\n        \"icon\": \"icon-search\",\r\n        \"valuename\": \"DivSearh\",\r\n        \"functionname\": \"Search\",\r\n        \"buttonname\": \"搜索\",\r\n        \"color\": \"primary\"\r\n      }\r\n    }\r\n  },\r\n  \"dev_brand\": {\r\n    \"manuinfo\": {\r\n      \"manuid\": 54,\r\n      \"parentmanuid\": 33,\r\n      \"orderno\": 5,\r\n      \"manuname\": \"设备品牌\",\r\n      \"url\": \"dev_brand\",\r\n      \"isenable\": true,\r\n      \"icon\": \"icon-rainbow\",\r\n      \"typeid\": 2,\r\n      \"valuename\": \"0105\",\r\n      \"level\": 0\r\n    },\r\n    \"nobuttonD\": {},\r\n    \"havebuttonsD\": {\r\n      \"AddInfo\": {\r\n        \"manuid\": 54,\r\n        \"orderno\": 0,\r\n        \"icon\": \"icon-add\",\r\n        \"valuename\": \"AddBtn\",\r\n        \"functionname\": \"AddInfo\",\r\n        \"buttonname\": \"添加\",\r\n        \"color\": \"success\"\r\n      },\r\n      \"EditInfo\": {\r\n        \"manuid\": 54,\r\n        \"orderno\": 1,\r\n        \"icon\": \"icon-edit\",\r\n        \"valuename\": \" EditBtn\",\r\n        \"functionname\": \"EditInfo\",\r\n        \"buttonname\": \"修改\",\r\n        \"color\": \"warning\"\r\n      },\r\n      \"Del\": {\r\n        \"manuid\": 54,\r\n        \"orderno\": 2,\r\n        \"icon\": \"icon-delete\",\r\n        \"valuename\": \"DelBtn\",\r\n        \"functionname\": \"Del\",\r\n        \"buttonname\": \"删除\",\r\n        \"color\": \"danger\"\r\n      },\r\n      \"ShowOP\": {\r\n        \"manuid\": 54,\r\n        \"orderno\": 3,\r\n        \"icon\": \"icon-zoom\",\r\n        \"valuename\": \"DetailsBtn\",\r\n        \"functionname\": \"ShowOP\",\r\n        \"buttonname\": \"查看\",\r\n        \"color\": \"info\"\r\n      },\r\n      \"Search\": {\r\n        \"manuid\": 54,\r\n        \"orderno\": 4,\r\n        \"icon\": \"icon-search\",\r\n        \"valuename\": \"DivSearh\",\r\n        \"functionname\": \"Search\",\r\n        \"buttonname\": \"搜索\",\r\n        \"color\": \"primary\"\r\n      }\r\n    }\r\n  },\r\n  \"dev_model\": {\r\n    \"manuinfo\": {\r\n      \"manuid\": 55,\r\n      \"parentmanuid\": 33,\r\n      \"orderno\": 6,\r\n      \"manuname\": \"设备型号\",\r\n      \"url\": \"dev_model\",\r\n      \"isenable\": true,\r\n      \"icon\": \"icon-flag_blue\",\r\n      \"typeid\": 2,\r\n      \"valuename\": \"0106\",\r\n      \"level\": 0\r\n    },\r\n    \"nobuttonD\": {},\r\n    \"havebuttonsD\": {\r\n      \"AddInfo\": {\r\n        \"manuid\": 55,\r\n        \"orderno\": 0,\r\n        \"icon\": \"icon-add\",\r\n        \"valuename\": \"AddBtn\",\r\n        \"functionname\": \"AddInfo\",\r\n        \"buttonname\": \"添加\",\r\n        \"color\": \"success\"\r\n      },\r\n      \"EditInfo\": {\r\n        \"manuid\": 55,\r\n        \"orderno\": 1,\r\n        \"icon\": \"icon-edit\",\r\n        \"valuename\": \" EditBtn\",\r\n        \"functionname\": \"EditInfo\",\r\n        \"buttonname\": \"修改\",\r\n        \"color\": \"warning\"\r\n      },\r\n      \"Del\": {\r\n        \"manuid\": 55,\r\n        \"orderno\": 2,\r\n        \"icon\": \"icon-delete\",\r\n        \"valuename\": \"DelBtn\",\r\n        \"functionname\": \"Del\",\r\n        \"buttonname\": \"删除\",\r\n        \"color\": \"danger\"\r\n      },\r\n      \"ShowOP\": {\r\n        \"manuid\": 55,\r\n        \"orderno\": 3,\r\n        \"icon\": \"icon-zoom\",\r\n        \"valuename\": \"DetailsBtn\",\r\n        \"functionname\": \"ShowOP\",\r\n        \"buttonname\": \"查看\",\r\n        \"color\": \"info\"\r\n      },\r\n      \"Search\": {\r\n        \"manuid\": 55,\r\n        \"orderno\": 4,\r\n        \"icon\": \"icon-search\",\r\n        \"valuename\": \"DivSearh\",\r\n        \"functionname\": \"Search\",\r\n        \"buttonname\": \"搜索\",\r\n        \"color\": \"primary\"\r\n      }\r\n    }\r\n  },\r\n  \"key_library\": {\r\n    \"manuinfo\": {\r\n      \"manuid\": 56,\r\n      \"parentmanuid\": 33,\r\n      \"orderno\": 7,\r\n      \"manuname\": \"按键库\",\r\n      \"url\": \"key_library\",\r\n      \"isenable\": true,\r\n      \"icon\": \"icon-shape_3d\",\r\n      \"typeid\": 2,\r\n      \"valuename\": \"0107\",\r\n      \"level\": 0\r\n    },\r\n    \"nobuttonD\": {},\r\n    \"havebuttonsD\": {\r\n      \"AddInfo\": {\r\n        \"manuid\": 56,\r\n        \"orderno\": 0,\r\n        \"icon\": \"icon-add\",\r\n        \"valuename\": \"AddBtn\",\r\n        \"functionname\": \"AddInfo\",\r\n        \"buttonname\": \"添加\",\r\n        \"color\": \"success\"\r\n      },\r\n      \"EditInfo\": {\r\n        \"manuid\": 56,\r\n        \"orderno\": 1,\r\n        \"icon\": \"icon-edit\",\r\n        \"valuename\": \" EditBtn\",\r\n        \"functionname\": \"EditInfo\",\r\n        \"buttonname\": \"修改\",\r\n        \"color\": \"warning\"\r\n      },\r\n      \"Del\": {\r\n        \"manuid\": 56,\r\n        \"orderno\": 2,\r\n        \"icon\": \"icon-delete\",\r\n        \"valuename\": \"DelBtn\",\r\n        \"functionname\": \"Del\",\r\n        \"buttonname\": \"删除\",\r\n        \"color\": \"danger\"\r\n      },\r\n      \"ShowOP\": {\r\n        \"manuid\": 56,\r\n        \"orderno\": 3,\r\n        \"icon\": \"icon-zoom\",\r\n        \"valuename\": \"DetailsBtn\",\r\n        \"functionname\": \"ShowOP\",\r\n        \"buttonname\": \"查看\",\r\n        \"color\": \"info\"\r\n      },\r\n      \"Search\": {\r\n        \"manuid\": 56,\r\n        \"orderno\": 4,\r\n        \"icon\": \"icon-search\",\r\n        \"valuename\": \"DivSearh\",\r\n        \"functionname\": \"Search\",\r\n        \"buttonname\": \"搜索\",\r\n        \"color\": \"primary\"\r\n      }\r\n    }\r\n  },\r\n  \"sysrole\": {\r\n    \"manuinfo\": {\r\n      \"manuid\": 32,\r\n      \"parentmanuid\": 0,\r\n      \"orderno\": 10,\r\n      \"manuname\": \"权限管理\",\r\n      \"url\": \"SysRole\",\r\n      \"isenable\": true,\r\n      \"icon\": \"fa-desktop\",\r\n      \"typeid\": 0,\r\n      \"valuename\": \"02\",\r\n      \"level\": 0\r\n    },\r\n    \"nobuttonD\": {},\r\n    \"havebuttonsD\": {}\r\n  }\r\n}', '3', '5');
INSERT INTO `rms_role` VALUES ('c6f8277f-ef6f-45fe-b950-b369c2f8e411', '吉风开发员', '新平台 1', '1', '1', '2016-09-02 00:00:00', '2018-07-13 00:00:00', '1', '{}', '3', '5');
INSERT INTO `rms_role` VALUES ('c8f12e86-60c6-46b5-84e8-d1d8781639de', '测试', '23111', '1', '1', '2016-07-28 00:00:00', '2018-01-30 00:00:00', '1', '{\"button\":{\"manuinfo\":{\"manuid\":6,\"parentmanuid\":1,\"orderno\":0,\"manuname\":\"按钮管理\",\"url\":\"button\",\"isenable\":false,\"icon\":\"icon-user\",\"typeid\":2,\"valuename\":\"010205\",\"level\":1},\"nobuttonD\":{},\"havebuttonsD\":{\"addInfo\":{\"manuid\":6,\"orderno\":0,\"icon\":\"icon-add\",\"valuename\":\"addBtn\",\"functionname\":\"addInfo\",\"buttonname\":\"添加\"},\"editInfo\":{\"manuid\":6,\"orderno\":1,\"icon\":\"icon-edit\",\"valuename\":\"editBtn\",\"functionname\":\"editInfo\",\"buttonname\":\"修改\"},\"del\":{\"manuid\":6,\"orderno\":2,\"icon\":\"icon-delete\",\"valuename\":\"delBtn\",\"functionname\":\"del\",\"buttonname\":\"删除\"},\"search\":{\"manuid\":6,\"orderno\":3,\"icon\":\"icon-search\",\"valuename\":\"divSearh\",\"functionname\":\"search\",\"buttonname\":\"搜索\"},\"showInfo\":{\"manuid\":6,\"orderno\":4,\"icon\":\"icon-zoom\",\"valuename\":\"detailsBtn\",\"functionname\":\"showInfo\",\"buttonname\":\"查看\"}}},\"sl_advertise\":{\"manuinfo\":{\"manuid\":11,\"parentmanuid\":3,\"orderno\":1,\"manuname\":\"广告管理\",\"url\":\"sl_advertise\",\"isenable\":false,\"icon\":\"icon-television\",\"typeid\":2,\"valuename\":\"0202\",\"level\":1},\"nobuttonD\":{},\"havebuttonsD\":{}},\"manu\":{\"manuinfo\":{\"manuid\":8,\"parentmanuid\":1,\"orderno\":1,\"manuname\":\"菜单管理\",\"url\":\"manu\",\"isenable\":false,\"icon\":\"icon-note\",\"micon\":\"/Content/EasyUI/themes/icons/32/bell_error.png\",\"typeid\":2,\"valuename\":\"010206\",\"level\":1},\"nobuttonD\":{},\"havebuttonsD\":{\"addInfo\":{\"manuid\":8,\"orderno\":0,\"icon\":\"icon-add\",\"valuename\":\"addBtn\",\"functionname\":\"addInfo\",\"buttonname\":\"添加\"},\"editInfo\":{\"manuid\":8,\"orderno\":1,\"icon\":\"icon-edit\",\"valuename\":\"editBtn\",\"functionname\":\"editInfo\",\"buttonname\":\"修改\"},\"showInfo\":{\"manuid\":8,\"orderno\":2,\"icon\":\"icon-zoom\",\"valuename\":\"detailsBtn\",\"functionname\":\"showInfo\",\"buttonname\":\"查看\"},\"del\":{\"manuid\":8,\"orderno\":3,\"icon\":\"icon-delete\",\"valuename\":\"delBtn\",\"functionname\":\"del\",\"buttonname\":\"删除\"},\"search\":{\"manuid\":8,\"orderno\":4,\"icon\":\"icon-search\",\"valuename\":\"divSearh\",\"functionname\":\"search\",\"buttonname\":\"搜索\"}}},\"dictype\":{\"manuinfo\":{\"manuid\":5,\"parentmanuid\":2,\"orderno\":1,\"manuname\":\"字典类型\",\"url\":\"dictype\",\"isenable\":false,\"icon\":\"icon-page_white_star\",\"typeid\":2,\"valuename\":\"010101\",\"level\":1},\"nobuttonD\":{},\"havebuttonsD\":{\"addInfo\":{\"manuid\":5,\"orderno\":0,\"icon\":\"icon-add\",\"valuename\":\"addBtn\",\"functionname\":\"addInfo\",\"buttonname\":\"添加\"},\"editInfo\":{\"manuid\":5,\"orderno\":1,\"icon\":\"icon-edit\",\"valuename\":\"editBtn\",\"functionname\":\"editInfo\",\"buttonname\":\"修改\"},\"del\":{\"manuid\":5,\"orderno\":2,\"icon\":\"icon-delete\",\"valuename\":\"delBtn\",\"functionname\":\"del\",\"buttonname\":\"删除\"},\"search\":{\"manuid\":5,\"orderno\":3,\"icon\":\"icon-search\",\"valuename\":\"divSearh\",\"functionname\":\"search\",\"buttonname\":\"搜索\"},\"showInfo\":{\"manuid\":5,\"orderno\":4,\"icon\":\"icon-zoom\",\"valuename\":\"detailsBtn\",\"functionname\":\"showInfo\",\"buttonname\":\"查看\"}}},\"sysset\":{\"manuinfo\":{\"manuid\":2,\"parentmanuid\":0,\"orderno\":2,\"manuname\":\"基础设置\",\"url\":\"sysset\",\"isenable\":false,\"icon\":\"icon-note\",\"typeid\":1,\"valuename\":\"0101\",\"level\":0},\"nobuttonD\":{},\"havebuttonsD\":{}},\"role\":{\"manuinfo\":{\"manuid\":7,\"parentmanuid\":1,\"orderno\":2,\"manuname\":\"角色管理\",\"url\":\"role\",\"isenable\":false,\"icon\":\"icon-key_go\",\"typeid\":2,\"valuename\":\"010201\",\"level\":1},\"nobuttonD\":{},\"havebuttonsD\":{\"addInfo\":{\"manuid\":7,\"orderno\":0,\"icon\":\"icon-add\",\"valuename\":\"addBtn\",\"functionname\":\"addInfo\",\"buttonname\":\"添加\"},\"editInfo\":{\"manuid\":7,\"orderno\":1,\"icon\":\"icon-edit\",\"valuename\":\"editBtn\",\"functionname\":\"editInfo\",\"buttonname\":\"修改\"},\"showInfo\":{\"manuid\":7,\"orderno\":2,\"icon\":\"icon-zoom\",\"valuename\":\"detailsBtn\",\"functionname\":\"showInfo\",\"buttonname\":\"查看\"},\"del\":{\"manuid\":7,\"orderno\":3,\"icon\":\"icon-delete\",\"valuename\":\"delBtn\",\"functionname\":\"del\",\"buttonname\":\"删除\"},\"search\":{\"manuid\":7,\"orderno\":4,\"icon\":\"icon-search\",\"valuename\":\"divSearh\",\"functionname\":\"search\",\"buttonname\":\"搜索\"}}},\"main?values\\u003d02\":{\"manuinfo\":{\"manuid\":3,\"parentmanuid\":0,\"orderno\":2,\"manuname\":\"塞拉数据\",\"url\":\"main?values\\u003d02\",\"isenable\":false,\"icon\":\"menu-icon-7\",\"typeid\":0,\"valuename\":\"02\",\"level\":0},\"nobuttonD\":{},\"havebuttonsD\":{}},\"dictionary\":{\"manuinfo\":{\"manuid\":4,\"parentmanuid\":2,\"orderno\":2,\"manuname\":\"数据字典\",\"url\":\"dictionary\",\"isenable\":false,\"icon\":\"icon-heart\",\"typeid\":2,\"valuename\":\"010102\",\"level\":1},\"nobuttonD\":{},\"havebuttonsD\":{\"addInfo\":{\"manuid\":4,\"orderno\":0,\"icon\":\"icon-add\",\"valuename\":\"addBtn\",\"functionname\":\"addInfo\",\"buttonname\":\"添加\"},\"editInfo\":{\"manuid\":4,\"orderno\":1,\"icon\":\"icon-edit\",\"valuename\":\"editBtn\",\"functionname\":\"editInfo\",\"buttonname\":\"修改\"},\"showInfo\":{\"manuid\":4,\"orderno\":2,\"icon\":\"icon-zoom\",\"valuename\":\"detailsBtn\",\"functionname\":\"showInfo\",\"buttonname\":\"查看\"},\"del\":{\"manuid\":4,\"orderno\":3,\"icon\":\"icon-delete\",\"valuename\":\"delBtn\",\"functionname\":\"del\",\"buttonname\":\"删除\"},\"search\":{\"manuid\":4,\"orderno\":4,\"icon\":\"icon-search\",\"valuename\":\"divSearh\",\"functionname\":\"search\",\"buttonname\":\"搜索\"}}},\"device\":{\"manuinfo\":{\"manuid\":12,\"parentmanuid\":3,\"orderno\":2,\"manuname\":\"设备列表1\",\"url\":\"device\",\"isenable\":false,\"icon\":\"icon-shape_flip_horizontal\",\"typeid\":2,\"valuename\":\"0201\",\"level\":1},\"nobuttonD\":{},\"havebuttonsD\":{}},\"sl_services\":{\"manuinfo\":{\"manuid\":13,\"parentmanuid\":3,\"orderno\":3,\"manuname\":\"服务站管理\",\"url\":\"sl_services\",\"isenable\":false,\"icon\":\"icon-color_swatch\",\"typeid\":1,\"valuename\":\"0203\",\"level\":1},\"nobuttonD\":{},\"havebuttonsD\":{}},\"company\":{\"manuinfo\":{\"manuid\":17,\"parentmanuid\":2,\"orderno\":3,\"manuname\":\"公司管理\",\"url\":\"company\",\"isenable\":false,\"icon\":\"icon-note\",\"micon\":\"/Content/EasyUI/themes/icons/32/bell_error.png\",\"typeid\":2,\"valuename\":\"010103\",\"level\":1},\"nobuttonD\":{},\"havebuttonsD\":{\"addInfo\":{\"manuid\":17,\"orderno\":0,\"icon\":\"icon-add\",\"valuename\":\"addBtn\",\"functionname\":\"addInfo\",\"buttonname\":\"添加\"},\"editInfo\":{\"manuid\":17,\"orderno\":1,\"icon\":\"icon-edit\",\"valuename\":\"editBtn\",\"functionname\":\"editInfo\",\"buttonname\":\"修改\"},\"del\":{\"manuid\":17,\"orderno\":2,\"icon\":\"icon-delete\",\"valuename\":\"delBtn\",\"functionname\":\"del\",\"buttonname\":\"删除\"}}},\"project\":{\"manuinfo\":{\"manuid\":18,\"parentmanuid\":2,\"orderno\":4,\"manuname\":\"项目管理\",\"url\":\"project\",\"isenable\":false,\"icon\":\"icon-page_header_footer\",\"micon\":\"/Content/EasyUI/themes/icons/32/page.png\",\"typeid\":2,\"valuename\":\"010104\",\"level\":1},\"nobuttonD\":{},\"havebuttonsD\":{\"addInfo\":{\"manuid\":18,\"orderno\":0,\"icon\":\"icon-add\",\"valuename\":\"addBtn\",\"functionname\":\"addInfo\",\"buttonname\":\"添加\"},\"editInfo\":{\"manuid\":18,\"orderno\":1,\"icon\":\"icon-edit\",\"valuename\":\"editBtn\",\"functionname\":\"editInfo\",\"buttonname\":\"修改\"},\"del\":{\"manuid\":18,\"orderno\":2,\"icon\":\"icon-delete\",\"valuename\":\"delBtn\",\"functionname\":\"del\",\"buttonname\":\"删除\"}}},\"user\":{\"manuinfo\":{\"manuid\":9,\"parentmanuid\":1,\"orderno\":5,\"manuname\":\"用户管理\",\"url\":\"user\",\"isenable\":false,\"icon\":\"icon-user\",\"typeid\":2,\"valuename\":\"010204\",\"level\":1},\"nobuttonD\":{},\"havebuttonsD\":{\"addInfo\":{\"manuid\":9,\"orderno\":0,\"icon\":\"icon-add\",\"valuename\":\"addBtn\",\"functionname\":\"addInfo\",\"buttonname\":\"添加\"},\"del\":{\"manuid\":9,\"orderno\":1,\"icon\":\"icon-delete\",\"valuename\":\"delBtn\",\"functionname\":\"del\",\"buttonname\":\"删除\"},\"editInfo\":{\"manuid\":9,\"orderno\":2,\"icon\":\"icon-edit\",\"valuename\":\"editBtn\",\"functionname\":\"editInfo\",\"buttonname\":\"修改\"},\"showInfo\":{\"manuid\":9,\"orderno\":3,\"icon\":\"icon-zoom\",\"valuename\":\"detailsBtn\",\"functionname\":\"showInfo\",\"buttonname\":\"查看\"},\"search\":{\"manuid\":9,\"orderno\":4,\"icon\":\"icon-search\",\"valuename\":\"divSearh\",\"functionname\":\"search\",\"buttonname\":\"搜索\"}}},\"department\":{\"manuinfo\":{\"manuid\":10,\"parentmanuid\":1,\"orderno\":6,\"manuname\":\"部门管理\",\"url\":\"department\",\"isenable\":false,\"icon\":\"icon-door_open\",\"typeid\":2,\"valuename\":\"010203\",\"level\":1},\"nobuttonD\":{},\"havebuttonsD\":{\"addInfo\":{\"manuid\":10,\"orderno\":0,\"icon\":\"icon-add\",\"valuename\":\"addBtn\",\"functionname\":\"addInfo\",\"buttonname\":\"添加\"},\"editInfo\":{\"manuid\":10,\"orderno\":1,\"icon\":\"icon-edit\",\"valuename\":\"editBtn\",\"functionname\":\"editInfo\",\"buttonname\":\"修改\"},\"showInfo\":{\"manuid\":10,\"orderno\":2,\"icon\":\"icon-zoom\",\"valuename\":\"detailsBtn\",\"functionname\":\"showInfo\",\"buttonname\":\"查看\"},\"del\":{\"manuid\":10,\"orderno\":3,\"icon\":\"icon-delete\",\"valuename\":\"delBtn\",\"functionname\":\"del\",\"buttonname\":\"删除\"},\"search\":{\"manuid\":10,\"orderno\":4,\"icon\":\"icon-search\",\"valuename\":\"divSearh\",\"functionname\":\"search\",\"buttonname\":\"搜索\"}}},\"permissionsystem\":{\"manuinfo\":{\"manuid\":1,\"parentmanuid\":0,\"orderno\":12,\"manuname\":\"权限管理\",\"url\":\"permissionsystem\",\"isenable\":false,\"icon\":\"icon-shape_move_forwards\",\"micon\":\"/Content/EasyUI/themes/icons/32/box.png\",\"typeid\":1,\"valuename\":\"0102\",\"level\":0},\"nobuttonD\":{},\"havebuttonsD\":{}}}', '1', '1');
INSERT INTO `rms_role` VALUES ('f035d3e0-dff2-443a-95fc-3abefa70d17f', '测试2', '2', null, 'lulu', '2018-10-23 14:33:03', '2018-10-23 14:33:47', '1', '{\"role\":{\"manuinfo\":{\"manuid\":69,\"parentmanuid\":67,\"orderno\":0,\"manuname\":\"角色管理\",\"url\":\"role\",\"isenable\":false,\"icon\":\"icon-stop\",\"typeid\":2,\"valuename\":\"0201\",\"level\":1},\"nobuttonD\":{},\"havebuttonsD\":{\"addInfo\":{\"manuid\":69,\"orderno\":0,\"icon\":\"icon-add\",\"valuename\":\"addBtn\",\"functionname\":\"addInfo\",\"buttonname\":\"添加\"},\"editInfo\":{\"manuid\":69,\"orderno\":1,\"icon\":\"icon-edit\",\"valuename\":\"editBtn\",\"functionname\":\"editInfo\",\"buttonname\":\"修改\"},\"del\":{\"manuid\":69,\"orderno\":2,\"icon\":\"icon-delete\",\"valuename\":\"delBtn\",\"functionname\":\"del\",\"buttonname\":\"删除\"},\"showInfo\":{\"manuid\":69,\"orderno\":3,\"icon\":\"icon-zoom\",\"valuename\":\"detailsBtn\",\"functionname\":\"showInfo\",\"buttonname\":\"查看\"},\"search\":{\"manuid\":69,\"orderno\":4,\"icon\":\"icon-search\",\"valuename\":\"divSearh\",\"functionname\":\"search\",\"buttonname\":\"搜索\"}}},\"authority\":{\"manuinfo\":{\"manuid\":67,\"parentmanuid\":0,\"orderno\":0,\"manuname\":\"权限管理\",\"url\":\"authority\",\"isenable\":false,\"icon\":\"icon-shape_3d\",\"typeid\":1,\"valuename\":\"02\",\"level\":0},\"nobuttonD\":{},\"havebuttonsD\":{}},\"base\":{\"manuinfo\":{\"manuid\":66,\"parentmanuid\":0,\"orderno\":1,\"manuname\":\"基础数据\",\"url\":\"base\",\"isenable\":false,\"icon\":\"icon-note\",\"micon\":\"34\",\"typeid\":1,\"valuename\":\"01\",\"level\":0},\"nobuttonD\":{},\"havebuttonsD\":{}},\"dictionary\":{\"manuinfo\":{\"manuid\":68,\"parentmanuid\":66,\"orderno\":2,\"manuname\":\"数据词典\",\"url\":\"dictionary\",\"isenable\":false,\"icon\":\"icon-sport_tennis\",\"typeid\":2,\"valuename\":\"0101\",\"level\":1},\"nobuttonD\":{\"addInfo\":{\"manuid\":68,\"functionname\":\"addInfo\"},\"del\":{\"manuid\":68,\"functionname\":\"del\"},\"search\":{\"manuid\":68,\"functionname\":\"search\"}},\"havebuttonsD\":{\"editInfo\":{\"manuid\":68,\"orderno\":1,\"icon\":\"icon-edit\",\"valuename\":\"editBtn\",\"functionname\":\"editInfo\",\"buttonname\":\"修改\"},\"showInfo\":{\"manuid\":68,\"orderno\":3,\"icon\":\"icon-zoom\",\"valuename\":\"detailsBtn\",\"functionname\":\"showInfo\",\"buttonname\":\"查看\"}}}}', '6', '10');
INSERT INTO `rms_role` VALUES ('f8da7c96-4cfd-4e2a-85a3-2d42868a4904', '新测试', '1', null, 'admin', '2018-10-22 21:25:34', '2018-10-22 21:25:34', '1', '{\"sys_dictype\":{\"manuinfo\":{\"manuid\":60,\"parentmanuid\":59,\"orderno\":0,\"manuname\":\"字典类型\",\"url\":\"sys_dictype\",\"isenable\":false,\"icon\":\"icon-text_heading_1\",\"typeid\":2,\"valuename\":\"0301\",\"level\":1},\"nobuttonD\":{\"AddInfo\":{\"manuid\":60,\"functionname\":\"AddInfo\"},\"Del\":{\"manuid\":60,\"functionname\":\"Del\"},\"EditInfo\":{\"manuid\":60,\"functionname\":\"EditInfo\"}},\"havebuttonsD\":{\"Search\":{\"manuid\":60,\"orderno\":3,\"icon\":\"icon-search\",\"valuename\":\"DivSearh\",\"functionname\":\"Search\",\"buttonname\":\"搜索\",\"color\":\"primary\"}}},\"server_mgt\":{\"manuinfo\":{\"manuid\":57,\"parentmanuid\":33,\"orderno\":0,\"manuname\":\"服务器管理\",\"url\":\"server_mgt\",\"isenable\":false,\"icon\":\"icon-star\",\"typeid\":2,\"valuename\":\"0108\",\"level\":0},\"nobuttonD\":{\"AddInfo\":{\"manuid\":57,\"functionname\":\"AddInfo\"},\"Del\":{\"manuid\":57,\"functionname\":\"Del\"},\"EditInfo\":{\"manuid\":57,\"functionname\":\"EditInfo\"},\"ShowOP\":{\"manuid\":57,\"functionname\":\"ShowOP\"}},\"havebuttonsD\":{\"Search\":{\"manuid\":57,\"orderno\":4,\"icon\":\"icon-search\",\"valuename\":\"DivSearh\",\"functionname\":\"Search\",\"buttonname\":\"搜索\",\"color\":\"primary\"}}},\"sys_dictionary\":{\"manuinfo\":{\"manuid\":61,\"parentmanuid\":59,\"orderno\":2,\"manuname\":\"数据字典\",\"url\":\"sys_dictionary\",\"isenable\":false,\"icon\":\"icon-ruby\",\"typeid\":2,\"valuename\":\"0302\",\"level\":1},\"nobuttonD\":{\"AddInfo\":{\"manuid\":61,\"functionname\":\"AddInfo\"},\"Del\":{\"manuid\":61,\"functionname\":\"Del\"},\"EditInfo\":{\"manuid\":61,\"functionname\":\"EditInfo\"}},\"havebuttonsD\":{\"Search\":{\"manuid\":61,\"orderno\":3,\"icon\":\"icon-search\",\"valuename\":\"DivSearh\",\"functionname\":\"Search\",\"buttonname\":\"搜索\",\"color\":\"primary\"}}},\"sys#\":{\"manuinfo\":{\"manuid\":33,\"parentmanuid\":0,\"orderno\":2,\"manuname\":\"设备管理\",\"url\":\"Sys#\",\"isenable\":false,\"icon\":\"icon-color_swatch\",\"typeid\":0,\"valuename\":\"01\",\"level\":0},\"nobuttonD\":{},\"havebuttonsD\":{}},\"app_user\":{\"manuinfo\":{\"manuid\":49,\"parentmanuid\":33,\"orderno\":2,\"manuname\":\"app用户\",\"url\":\"app_user\",\"isenable\":false,\"icon\":\"icon-user\",\"typeid\":2,\"valuename\":\"0103\",\"level\":1},\"nobuttonD\":{\"Del\":{\"manuid\":49,\"functionname\":\"Del\"},\"EditInfo\":{\"manuid\":49,\"functionname\":\"EditInfo\"},\"ShowOP\":{\"manuid\":49,\"functionname\":\"ShowOP\"}},\"havebuttonsD\":{\"Search\":{\"manuid\":49,\"orderno\":3,\"icon\":\"icon-search\",\"valuename\":\"DivSearh\",\"functionname\":\"Search\",\"buttonname\":\"搜索\",\"color\":\"primary\"}}},\"aid_seed\":{\"manuinfo\":{\"manuid\":34,\"parentmanuid\":33,\"orderno\":2,\"manuname\":\"CID管理\",\"url\":\"aid_seed\",\"isenable\":false,\"icon\":\"icon-pilcrow\",\"typeid\":2,\"valuename\":\"0102\",\"level\":1},\"nobuttonD\":{\"AddInfo\":{\"manuid\":34,\"functionname\":\"AddInfo\"},\"Del\":{\"manuid\":34,\"functionname\":\"Del\"},\"EditInfo\":{\"manuid\":34,\"functionname\":\"EditInfo\"},\"ShowOP\":{\"manuid\":34,\"functionname\":\"ShowOP\"}},\"havebuttonsD\":{\"Search\":{\"manuid\":34,\"orderno\":4,\"icon\":\"icon-search\",\"valuename\":\"DivSearh\",\"functionname\":\"Search\",\"buttonname\":\"搜索\",\"color\":\"primary\"}}},\"jc_article\":{\"manuinfo\":{\"manuid\":62,\"parentmanuid\":59,\"orderno\":3,\"manuname\":\"新闻\",\"url\":\"jc_article\",\"isenable\":false,\"icon\":\"icon-rainbow\",\"typeid\":2,\"valuename\":\"0303\",\"level\":1},\"nobuttonD\":{\"AddInfo\":{\"manuid\":62,\"functionname\":\"AddInfo\"},\"Del\":{\"manuid\":62,\"functionname\":\"Del\"},\"EditInfo\":{\"manuid\":62,\"functionname\":\"EditInfo\"}},\"havebuttonsD\":{\"ShowOP\":{\"manuid\":62,\"orderno\":3,\"icon\":\"icon-zoom\",\"valuename\":\"DetailsBtn\",\"functionname\":\"ShowOP\",\"buttonname\":\"查看\",\"color\":\"info\"},\"Search\":{\"manuid\":62,\"orderno\":4,\"icon\":\"icon-search\",\"valuename\":\"DivSearh\",\"functionname\":\"Search\",\"buttonname\":\"搜索\",\"color\":\"primary\"}}},\"device\":{\"manuinfo\":{\"manuid\":38,\"parentmanuid\":33,\"orderno\":3,\"manuname\":\"设备列表\",\"url\":\"device\",\"isenable\":false,\"icon\":\"icon-sport_golf_practice\",\"typeid\":2,\"valuename\":\"0101\",\"level\":1},\"nobuttonD\":{\"EditInfo\":{\"manuid\":38,\"functionname\":\"EditInfo\"},\"ShowOP\":{\"manuid\":38,\"functionname\":\"ShowOP\"}},\"havebuttonsD\":{\"Search\":{\"manuid\":38,\"orderno\":3,\"icon\":\"icon-search\",\"valuename\":\"DivSearh\",\"functionname\":\"Search\",\"buttonname\":\"搜索\",\"color\":\"primary\"}}},\"base#\":{\"manuinfo\":{\"manuid\":59,\"parentmanuid\":0,\"orderno\":3,\"manuname\":\"基础数据\",\"url\":\"base#\",\"isenable\":false,\"icon\":\"icon-color\",\"typeid\":1,\"valuename\":\"03\",\"level\":0},\"nobuttonD\":{},\"havebuttonsD\":{}},\"dev_type\":{\"manuinfo\":{\"manuid\":53,\"parentmanuid\":33,\"orderno\":4,\"manuname\":\"设备类型\",\"url\":\"dev_type\",\"isenable\":false,\"icon\":\"icon-sport_soccer\",\"typeid\":2,\"valuename\":\"0104\",\"level\":0},\"nobuttonD\":{\"AddInfo\":{\"manuid\":53,\"functionname\":\"AddInfo\"},\"Del\":{\"manuid\":53,\"functionname\":\"Del\"},\"EditInfo\":{\"manuid\":53,\"functionname\":\"EditInfo\"},\"ShowOP\":{\"manuid\":53,\"functionname\":\"ShowOP\"}},\"havebuttonsD\":{\"Search\":{\"manuid\":53,\"orderno\":4,\"icon\":\"icon-search\",\"valuename\":\"DivSearh\",\"functionname\":\"Search\",\"buttonname\":\"搜索\",\"color\":\"primary\"}}},\"dev_brand\":{\"manuinfo\":{\"manuid\":54,\"parentmanuid\":33,\"orderno\":5,\"manuname\":\"设备品牌\",\"url\":\"dev_brand\",\"isenable\":false,\"icon\":\"icon-rainbow\",\"typeid\":2,\"valuename\":\"0105\",\"level\":0},\"nobuttonD\":{\"AddInfo\":{\"manuid\":54,\"functionname\":\"AddInfo\"},\"Del\":{\"manuid\":54,\"functionname\":\"Del\"},\"EditInfo\":{\"manuid\":54,\"functionname\":\"EditInfo\"},\"ShowOP\":{\"manuid\":54,\"functionname\":\"ShowOP\"}},\"havebuttonsD\":{\"Search\":{\"manuid\":54,\"orderno\":4,\"icon\":\"icon-search\",\"valuename\":\"DivSearh\",\"functionname\":\"Search\",\"buttonname\":\"搜索\",\"color\":\"primary\"}}},\"0203\":{\"manuinfo\":{\"manuid\":36,\"parentmanuid\":32,\"orderno\":5,\"manuname\":\"测试\",\"url\":\"0203\",\"isenable\":false,\"icon\":\"fa-barcode\",\"typeid\":1,\"valuename\":\"0203\",\"level\":1},\"nobuttonD\":{\"ShowOP\":{\"manuid\":36,\"functionname\":\"ShowOP\"}},\"havebuttonsD\":{\"ReFlashOP\":{\"manuid\":36,\"orderno\":0,\"icon\":\"icon-disk_download\",\"valuename\":\"ReFlashBtn\",\"functionname\":\"ReFlashOP\",\"buttonname\":\"更新\",\"color\":\"purple\"}}},\"dev_model\":{\"manuinfo\":{\"manuid\":55,\"parentmanuid\":33,\"orderno\":6,\"manuname\":\"设备型号\",\"url\":\"dev_model\",\"isenable\":false,\"icon\":\"icon-flag_blue\",\"typeid\":2,\"valuename\":\"0106\",\"level\":0},\"nobuttonD\":{\"AddInfo\":{\"manuid\":55,\"functionname\":\"AddInfo\"},\"Del\":{\"manuid\":55,\"functionname\":\"Del\"},\"EditInfo\":{\"manuid\":55,\"functionname\":\"EditInfo\"},\"ShowOP\":{\"manuid\":55,\"functionname\":\"ShowOP\"}},\"havebuttonsD\":{\"Search\":{\"manuid\":55,\"orderno\":4,\"icon\":\"icon-search\",\"valuename\":\"DivSearh\",\"functionname\":\"Search\",\"buttonname\":\"搜索\",\"color\":\"primary\"}}},\"key_library\":{\"manuinfo\":{\"manuid\":56,\"parentmanuid\":33,\"orderno\":7,\"manuname\":\"按键库\",\"url\":\"key_library\",\"isenable\":false,\"icon\":\"icon-shape_3d\",\"typeid\":2,\"valuename\":\"0107\",\"level\":0},\"nobuttonD\":{\"AddInfo\":{\"manuid\":56,\"functionname\":\"AddInfo\"},\"Del\":{\"manuid\":56,\"functionname\":\"Del\"},\"EditInfo\":{\"manuid\":56,\"functionname\":\"EditInfo\"},\"ShowOP\":{\"manuid\":56,\"functionname\":\"ShowOP\"}},\"havebuttonsD\":{\"Search\":{\"manuid\":56,\"orderno\":4,\"icon\":\"icon-search\",\"valuename\":\"DivSearh\",\"functionname\":\"Search\",\"buttonname\":\"搜索\",\"color\":\"primary\"}}},\"sysrole\":{\"manuinfo\":{\"manuid\":32,\"parentmanuid\":0,\"orderno\":10,\"manuname\":\"权限管理\",\"url\":\"SysRole\",\"isenable\":false,\"icon\":\"fa-desktop\",\"typeid\":0,\"valuename\":\"02\",\"level\":0},\"nobuttonD\":{},\"havebuttonsD\":{}}}', '3', '5');

-- ----------------------------
-- Table structure for rms_rolemanubuttons
-- ----------------------------
DROP TABLE IF EXISTS `rms_rolemanubuttons`;
CREATE TABLE `rms_rolemanubuttons` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `roleid` varchar(36) DEFAULT NULL COMMENT '角色的Id',
  `menubuttonsid` int(11) DEFAULT NULL COMMENT '菜单的按钮的Id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `rms_rolemanubuttons_pk` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1808 DEFAULT CHARSET=utf8 COMMENT='RMS_RoleManuButtons角色菜单的按钮表';

-- ----------------------------
-- Records of rms_rolemanubuttons
-- ----------------------------
INSERT INTO `rms_rolemanubuttons` VALUES ('1198', '8d17e9ae-778c-4489-b3e6-69990a226c20', '24');
INSERT INTO `rms_rolemanubuttons` VALUES ('1199', '8d17e9ae-778c-4489-b3e6-69990a226c20', '25');
INSERT INTO `rms_rolemanubuttons` VALUES ('1200', '8d17e9ae-778c-4489-b3e6-69990a226c20', '21');
INSERT INTO `rms_rolemanubuttons` VALUES ('1201', '8d17e9ae-778c-4489-b3e6-69990a226c20', '23');
INSERT INTO `rms_rolemanubuttons` VALUES ('1202', '8d17e9ae-778c-4489-b3e6-69990a226c20', '22');
INSERT INTO `rms_rolemanubuttons` VALUES ('1203', '8d17e9ae-778c-4489-b3e6-69990a226c20', '19');
INSERT INTO `rms_rolemanubuttons` VALUES ('1204', '8d17e9ae-778c-4489-b3e6-69990a226c20', '17');
INSERT INTO `rms_rolemanubuttons` VALUES ('1205', '8d17e9ae-778c-4489-b3e6-69990a226c20', '16');
INSERT INTO `rms_rolemanubuttons` VALUES ('1206', '8d17e9ae-778c-4489-b3e6-69990a226c20', '20');
INSERT INTO `rms_rolemanubuttons` VALUES ('1207', '8d17e9ae-778c-4489-b3e6-69990a226c20', '18');
INSERT INTO `rms_rolemanubuttons` VALUES ('1208', '8d17e9ae-778c-4489-b3e6-69990a226c20', '26');
INSERT INTO `rms_rolemanubuttons` VALUES ('1209', '8d17e9ae-778c-4489-b3e6-69990a226c20', '29');
INSERT INTO `rms_rolemanubuttons` VALUES ('1210', '8d17e9ae-778c-4489-b3e6-69990a226c20', '28');
INSERT INTO `rms_rolemanubuttons` VALUES ('1211', '8d17e9ae-778c-4489-b3e6-69990a226c20', '27');
INSERT INTO `rms_rolemanubuttons` VALUES ('1212', '8d17e9ae-778c-4489-b3e6-69990a226c20', '30');
INSERT INTO `rms_rolemanubuttons` VALUES ('1213', '8d17e9ae-778c-4489-b3e6-69990a226c20', '33');
INSERT INTO `rms_rolemanubuttons` VALUES ('1214', '8d17e9ae-778c-4489-b3e6-69990a226c20', '31');
INSERT INTO `rms_rolemanubuttons` VALUES ('1215', '8d17e9ae-778c-4489-b3e6-69990a226c20', '35');
INSERT INTO `rms_rolemanubuttons` VALUES ('1216', '8d17e9ae-778c-4489-b3e6-69990a226c20', '32');
INSERT INTO `rms_rolemanubuttons` VALUES ('1217', '8d17e9ae-778c-4489-b3e6-69990a226c20', '34');
INSERT INTO `rms_rolemanubuttons` VALUES ('1218', '8d17e9ae-778c-4489-b3e6-69990a226c20', '15');
INSERT INTO `rms_rolemanubuttons` VALUES ('1219', '8d17e9ae-778c-4489-b3e6-69990a226c20', '13');
INSERT INTO `rms_rolemanubuttons` VALUES ('1220', '8d17e9ae-778c-4489-b3e6-69990a226c20', '11');
INSERT INTO `rms_rolemanubuttons` VALUES ('1221', '8d17e9ae-778c-4489-b3e6-69990a226c20', '14');
INSERT INTO `rms_rolemanubuttons` VALUES ('1222', '8d17e9ae-778c-4489-b3e6-69990a226c20', '12');
INSERT INTO `rms_rolemanubuttons` VALUES ('1223', '8d17e9ae-778c-4489-b3e6-69990a226c20', '1');
INSERT INTO `rms_rolemanubuttons` VALUES ('1224', '8d17e9ae-778c-4489-b3e6-69990a226c20', '4');
INSERT INTO `rms_rolemanubuttons` VALUES ('1225', '8d17e9ae-778c-4489-b3e6-69990a226c20', '3');
INSERT INTO `rms_rolemanubuttons` VALUES ('1226', '8d17e9ae-778c-4489-b3e6-69990a226c20', '5');
INSERT INTO `rms_rolemanubuttons` VALUES ('1227', '8d17e9ae-778c-4489-b3e6-69990a226c20', '2');
INSERT INTO `rms_rolemanubuttons` VALUES ('1228', '8d17e9ae-778c-4489-b3e6-69990a226c20', '36');
INSERT INTO `rms_rolemanubuttons` VALUES ('1229', '8d17e9ae-778c-4489-b3e6-69990a226c20', '37');
INSERT INTO `rms_rolemanubuttons` VALUES ('1230', '8d17e9ae-778c-4489-b3e6-69990a226c20', '51');
INSERT INTO `rms_rolemanubuttons` VALUES ('1231', '8d17e9ae-778c-4489-b3e6-69990a226c20', '39');
INSERT INTO `rms_rolemanubuttons` VALUES ('1232', '8d17e9ae-778c-4489-b3e6-69990a226c20', '38');
INSERT INTO `rms_rolemanubuttons` VALUES ('1233', '8d17e9ae-778c-4489-b3e6-69990a226c20', '52');
INSERT INTO `rms_rolemanubuttons` VALUES ('1234', '8d17e9ae-778c-4489-b3e6-69990a226c20', '7');
INSERT INTO `rms_rolemanubuttons` VALUES ('1235', '8d17e9ae-778c-4489-b3e6-69990a226c20', '10');
INSERT INTO `rms_rolemanubuttons` VALUES ('1236', '8d17e9ae-778c-4489-b3e6-69990a226c20', '6');
INSERT INTO `rms_rolemanubuttons` VALUES ('1237', '8d17e9ae-778c-4489-b3e6-69990a226c20', '8');
INSERT INTO `rms_rolemanubuttons` VALUES ('1238', '8d17e9ae-778c-4489-b3e6-69990a226c20', '9');
INSERT INTO `rms_rolemanubuttons` VALUES ('1407', 'a3e4cc49-3df2-4550-b321-ea68e2dc89ae', '90');
INSERT INTO `rms_rolemanubuttons` VALUES ('1408', 'a3e4cc49-3df2-4550-b321-ea68e2dc89ae', '93');
INSERT INTO `rms_rolemanubuttons` VALUES ('1409', 'a3e4cc49-3df2-4550-b321-ea68e2dc89ae', '91');
INSERT INTO `rms_rolemanubuttons` VALUES ('1410', 'a3e4cc49-3df2-4550-b321-ea68e2dc89ae', '92');
INSERT INTO `rms_rolemanubuttons` VALUES ('1411', 'a3e4cc49-3df2-4550-b321-ea68e2dc89ae', '130');
INSERT INTO `rms_rolemanubuttons` VALUES ('1412', 'a3e4cc49-3df2-4550-b321-ea68e2dc89ae', '134');
INSERT INTO `rms_rolemanubuttons` VALUES ('1413', 'a3e4cc49-3df2-4550-b321-ea68e2dc89ae', '133');
INSERT INTO `rms_rolemanubuttons` VALUES ('1414', 'a3e4cc49-3df2-4550-b321-ea68e2dc89ae', '135');
INSERT INTO `rms_rolemanubuttons` VALUES ('1415', 'a3e4cc49-3df2-4550-b321-ea68e2dc89ae', '136');
INSERT INTO `rms_rolemanubuttons` VALUES ('1416', 'a3e4cc49-3df2-4550-b321-ea68e2dc89ae', '87');
INSERT INTO `rms_rolemanubuttons` VALUES ('1417', 'a3e4cc49-3df2-4550-b321-ea68e2dc89ae', '86');
INSERT INTO `rms_rolemanubuttons` VALUES ('1418', 'a3e4cc49-3df2-4550-b321-ea68e2dc89ae', '137');
INSERT INTO `rms_rolemanubuttons` VALUES ('1419', 'a3e4cc49-3df2-4550-b321-ea68e2dc89ae', '88');
INSERT INTO `rms_rolemanubuttons` VALUES ('1420', 'a3e4cc49-3df2-4550-b321-ea68e2dc89ae', '138');
INSERT INTO `rms_rolemanubuttons` VALUES ('1421', 'a3e4cc49-3df2-4550-b321-ea68e2dc89ae', '142');
INSERT INTO `rms_rolemanubuttons` VALUES ('1422', 'a3e4cc49-3df2-4550-b321-ea68e2dc89ae', '139');
INSERT INTO `rms_rolemanubuttons` VALUES ('1423', 'a3e4cc49-3df2-4550-b321-ea68e2dc89ae', '141');
INSERT INTO `rms_rolemanubuttons` VALUES ('1424', 'a3e4cc49-3df2-4550-b321-ea68e2dc89ae', '140');
INSERT INTO `rms_rolemanubuttons` VALUES ('1425', 'a3e4cc49-3df2-4550-b321-ea68e2dc89ae', '143');
INSERT INTO `rms_rolemanubuttons` VALUES ('1426', 'a3e4cc49-3df2-4550-b321-ea68e2dc89ae', '147');
INSERT INTO `rms_rolemanubuttons` VALUES ('1427', 'a3e4cc49-3df2-4550-b321-ea68e2dc89ae', '146');
INSERT INTO `rms_rolemanubuttons` VALUES ('1428', 'a3e4cc49-3df2-4550-b321-ea68e2dc89ae', '144');
INSERT INTO `rms_rolemanubuttons` VALUES ('1429', 'a3e4cc49-3df2-4550-b321-ea68e2dc89ae', '145');
INSERT INTO `rms_rolemanubuttons` VALUES ('1430', 'a3e4cc49-3df2-4550-b321-ea68e2dc89ae', '148');
INSERT INTO `rms_rolemanubuttons` VALUES ('1431', 'a3e4cc49-3df2-4550-b321-ea68e2dc89ae', '150');
INSERT INTO `rms_rolemanubuttons` VALUES ('1432', 'a3e4cc49-3df2-4550-b321-ea68e2dc89ae', '149');
INSERT INTO `rms_rolemanubuttons` VALUES ('1433', 'a3e4cc49-3df2-4550-b321-ea68e2dc89ae', '152');
INSERT INTO `rms_rolemanubuttons` VALUES ('1434', 'a3e4cc49-3df2-4550-b321-ea68e2dc89ae', '151');
INSERT INTO `rms_rolemanubuttons` VALUES ('1435', 'a3e4cc49-3df2-4550-b321-ea68e2dc89ae', '153');
INSERT INTO `rms_rolemanubuttons` VALUES ('1436', 'a3e4cc49-3df2-4550-b321-ea68e2dc89ae', '157');
INSERT INTO `rms_rolemanubuttons` VALUES ('1437', 'a3e4cc49-3df2-4550-b321-ea68e2dc89ae', '156');
INSERT INTO `rms_rolemanubuttons` VALUES ('1438', 'a3e4cc49-3df2-4550-b321-ea68e2dc89ae', '155');
INSERT INTO `rms_rolemanubuttons` VALUES ('1439', 'a3e4cc49-3df2-4550-b321-ea68e2dc89ae', '154');
INSERT INTO `rms_rolemanubuttons` VALUES ('1440', 'a3e4cc49-3df2-4550-b321-ea68e2dc89ae', '158');
INSERT INTO `rms_rolemanubuttons` VALUES ('1441', 'a3e4cc49-3df2-4550-b321-ea68e2dc89ae', '159');
INSERT INTO `rms_rolemanubuttons` VALUES ('1442', 'a3e4cc49-3df2-4550-b321-ea68e2dc89ae', '160');
INSERT INTO `rms_rolemanubuttons` VALUES ('1443', 'a3e4cc49-3df2-4550-b321-ea68e2dc89ae', '162');
INSERT INTO `rms_rolemanubuttons` VALUES ('1444', 'a3e4cc49-3df2-4550-b321-ea68e2dc89ae', '161');
INSERT INTO `rms_rolemanubuttons` VALUES ('1445', 'a3e4cc49-3df2-4550-b321-ea68e2dc89ae', '95');
INSERT INTO `rms_rolemanubuttons` VALUES ('1446', 'a3e4cc49-3df2-4550-b321-ea68e2dc89ae', '94');
INSERT INTO `rms_rolemanubuttons` VALUES ('1570', '54993d46-529c-423b-ad0f-667bbc17c3e0', '90');
INSERT INTO `rms_rolemanubuttons` VALUES ('1571', '54993d46-529c-423b-ad0f-667bbc17c3e0', '91');
INSERT INTO `rms_rolemanubuttons` VALUES ('1572', '54993d46-529c-423b-ad0f-667bbc17c3e0', '92');
INSERT INTO `rms_rolemanubuttons` VALUES ('1573', '54993d46-529c-423b-ad0f-667bbc17c3e0', '130');
INSERT INTO `rms_rolemanubuttons` VALUES ('1574', '54993d46-529c-423b-ad0f-667bbc17c3e0', '93');
INSERT INTO `rms_rolemanubuttons` VALUES ('1575', '54993d46-529c-423b-ad0f-667bbc17c3e0', '133');
INSERT INTO `rms_rolemanubuttons` VALUES ('1576', '54993d46-529c-423b-ad0f-667bbc17c3e0', '135');
INSERT INTO `rms_rolemanubuttons` VALUES ('1577', '54993d46-529c-423b-ad0f-667bbc17c3e0', '136');
INSERT INTO `rms_rolemanubuttons` VALUES ('1578', '54993d46-529c-423b-ad0f-667bbc17c3e0', '134');
INSERT INTO `rms_rolemanubuttons` VALUES ('1579', '54993d46-529c-423b-ad0f-667bbc17c3e0', '86');
INSERT INTO `rms_rolemanubuttons` VALUES ('1580', '54993d46-529c-423b-ad0f-667bbc17c3e0', '88');
INSERT INTO `rms_rolemanubuttons` VALUES ('1581', '54993d46-529c-423b-ad0f-667bbc17c3e0', '87');
INSERT INTO `rms_rolemanubuttons` VALUES ('1582', '54993d46-529c-423b-ad0f-667bbc17c3e0', '138');
INSERT INTO `rms_rolemanubuttons` VALUES ('1583', '54993d46-529c-423b-ad0f-667bbc17c3e0', '139');
INSERT INTO `rms_rolemanubuttons` VALUES ('1584', '54993d46-529c-423b-ad0f-667bbc17c3e0', '141');
INSERT INTO `rms_rolemanubuttons` VALUES ('1585', '54993d46-529c-423b-ad0f-667bbc17c3e0', '140');
INSERT INTO `rms_rolemanubuttons` VALUES ('1586', '54993d46-529c-423b-ad0f-667bbc17c3e0', '142');
INSERT INTO `rms_rolemanubuttons` VALUES ('1587', '54993d46-529c-423b-ad0f-667bbc17c3e0', '143');
INSERT INTO `rms_rolemanubuttons` VALUES ('1588', '54993d46-529c-423b-ad0f-667bbc17c3e0', '146');
INSERT INTO `rms_rolemanubuttons` VALUES ('1589', '54993d46-529c-423b-ad0f-667bbc17c3e0', '144');
INSERT INTO `rms_rolemanubuttons` VALUES ('1590', '54993d46-529c-423b-ad0f-667bbc17c3e0', '145');
INSERT INTO `rms_rolemanubuttons` VALUES ('1591', '54993d46-529c-423b-ad0f-667bbc17c3e0', '147');
INSERT INTO `rms_rolemanubuttons` VALUES ('1592', '54993d46-529c-423b-ad0f-667bbc17c3e0', '148');
INSERT INTO `rms_rolemanubuttons` VALUES ('1593', '54993d46-529c-423b-ad0f-667bbc17c3e0', '149');
INSERT INTO `rms_rolemanubuttons` VALUES ('1594', '54993d46-529c-423b-ad0f-667bbc17c3e0', '152');
INSERT INTO `rms_rolemanubuttons` VALUES ('1595', '54993d46-529c-423b-ad0f-667bbc17c3e0', '151');
INSERT INTO `rms_rolemanubuttons` VALUES ('1596', '54993d46-529c-423b-ad0f-667bbc17c3e0', '150');
INSERT INTO `rms_rolemanubuttons` VALUES ('1597', '54993d46-529c-423b-ad0f-667bbc17c3e0', '153');
INSERT INTO `rms_rolemanubuttons` VALUES ('1598', '54993d46-529c-423b-ad0f-667bbc17c3e0', '156');
INSERT INTO `rms_rolemanubuttons` VALUES ('1599', '54993d46-529c-423b-ad0f-667bbc17c3e0', '155');
INSERT INTO `rms_rolemanubuttons` VALUES ('1600', '54993d46-529c-423b-ad0f-667bbc17c3e0', '154');
INSERT INTO `rms_rolemanubuttons` VALUES ('1601', '54993d46-529c-423b-ad0f-667bbc17c3e0', '157');
INSERT INTO `rms_rolemanubuttons` VALUES ('1602', '54993d46-529c-423b-ad0f-667bbc17c3e0', '158');
INSERT INTO `rms_rolemanubuttons` VALUES ('1603', '54993d46-529c-423b-ad0f-667bbc17c3e0', '160');
INSERT INTO `rms_rolemanubuttons` VALUES ('1604', '54993d46-529c-423b-ad0f-667bbc17c3e0', '162');
INSERT INTO `rms_rolemanubuttons` VALUES ('1605', '54993d46-529c-423b-ad0f-667bbc17c3e0', '161');
INSERT INTO `rms_rolemanubuttons` VALUES ('1606', '54993d46-529c-423b-ad0f-667bbc17c3e0', '159');
INSERT INTO `rms_rolemanubuttons` VALUES ('1607', '54993d46-529c-423b-ad0f-667bbc17c3e0', '95');
INSERT INTO `rms_rolemanubuttons` VALUES ('1608', '54993d46-529c-423b-ad0f-667bbc17c3e0', '94');
INSERT INTO `rms_rolemanubuttons` VALUES ('1609', '54993d46-529c-423b-ad0f-667bbc17c3e0', '165');
INSERT INTO `rms_rolemanubuttons` VALUES ('1610', 'c6f8277f-ef6f-45fe-b950-b369c2f8e411', '90');
INSERT INTO `rms_rolemanubuttons` VALUES ('1611', 'c6f8277f-ef6f-45fe-b950-b369c2f8e411', '91');
INSERT INTO `rms_rolemanubuttons` VALUES ('1612', 'c6f8277f-ef6f-45fe-b950-b369c2f8e411', '92');
INSERT INTO `rms_rolemanubuttons` VALUES ('1613', 'c6f8277f-ef6f-45fe-b950-b369c2f8e411', '130');
INSERT INTO `rms_rolemanubuttons` VALUES ('1614', 'c6f8277f-ef6f-45fe-b950-b369c2f8e411', '93');
INSERT INTO `rms_rolemanubuttons` VALUES ('1615', 'c6f8277f-ef6f-45fe-b950-b369c2f8e411', '133');
INSERT INTO `rms_rolemanubuttons` VALUES ('1616', 'c6f8277f-ef6f-45fe-b950-b369c2f8e411', '135');
INSERT INTO `rms_rolemanubuttons` VALUES ('1617', 'c6f8277f-ef6f-45fe-b950-b369c2f8e411', '136');
INSERT INTO `rms_rolemanubuttons` VALUES ('1618', 'c6f8277f-ef6f-45fe-b950-b369c2f8e411', '134');
INSERT INTO `rms_rolemanubuttons` VALUES ('1619', 'c6f8277f-ef6f-45fe-b950-b369c2f8e411', '86');
INSERT INTO `rms_rolemanubuttons` VALUES ('1620', 'c6f8277f-ef6f-45fe-b950-b369c2f8e411', '88');
INSERT INTO `rms_rolemanubuttons` VALUES ('1621', 'c6f8277f-ef6f-45fe-b950-b369c2f8e411', '87');
INSERT INTO `rms_rolemanubuttons` VALUES ('1622', 'c6f8277f-ef6f-45fe-b950-b369c2f8e411', '138');
INSERT INTO `rms_rolemanubuttons` VALUES ('1623', 'c6f8277f-ef6f-45fe-b950-b369c2f8e411', '139');
INSERT INTO `rms_rolemanubuttons` VALUES ('1624', 'c6f8277f-ef6f-45fe-b950-b369c2f8e411', '141');
INSERT INTO `rms_rolemanubuttons` VALUES ('1625', 'c6f8277f-ef6f-45fe-b950-b369c2f8e411', '140');
INSERT INTO `rms_rolemanubuttons` VALUES ('1626', 'c6f8277f-ef6f-45fe-b950-b369c2f8e411', '142');
INSERT INTO `rms_rolemanubuttons` VALUES ('1627', 'c6f8277f-ef6f-45fe-b950-b369c2f8e411', '143');
INSERT INTO `rms_rolemanubuttons` VALUES ('1628', 'c6f8277f-ef6f-45fe-b950-b369c2f8e411', '146');
INSERT INTO `rms_rolemanubuttons` VALUES ('1629', 'c6f8277f-ef6f-45fe-b950-b369c2f8e411', '144');
INSERT INTO `rms_rolemanubuttons` VALUES ('1630', 'c6f8277f-ef6f-45fe-b950-b369c2f8e411', '145');
INSERT INTO `rms_rolemanubuttons` VALUES ('1631', 'c6f8277f-ef6f-45fe-b950-b369c2f8e411', '147');
INSERT INTO `rms_rolemanubuttons` VALUES ('1632', 'c6f8277f-ef6f-45fe-b950-b369c2f8e411', '148');
INSERT INTO `rms_rolemanubuttons` VALUES ('1633', 'c6f8277f-ef6f-45fe-b950-b369c2f8e411', '149');
INSERT INTO `rms_rolemanubuttons` VALUES ('1634', 'c6f8277f-ef6f-45fe-b950-b369c2f8e411', '152');
INSERT INTO `rms_rolemanubuttons` VALUES ('1635', 'c6f8277f-ef6f-45fe-b950-b369c2f8e411', '151');
INSERT INTO `rms_rolemanubuttons` VALUES ('1636', 'c6f8277f-ef6f-45fe-b950-b369c2f8e411', '150');
INSERT INTO `rms_rolemanubuttons` VALUES ('1637', 'c6f8277f-ef6f-45fe-b950-b369c2f8e411', '153');
INSERT INTO `rms_rolemanubuttons` VALUES ('1638', 'c6f8277f-ef6f-45fe-b950-b369c2f8e411', '156');
INSERT INTO `rms_rolemanubuttons` VALUES ('1639', 'c6f8277f-ef6f-45fe-b950-b369c2f8e411', '155');
INSERT INTO `rms_rolemanubuttons` VALUES ('1640', 'c6f8277f-ef6f-45fe-b950-b369c2f8e411', '154');
INSERT INTO `rms_rolemanubuttons` VALUES ('1641', 'c6f8277f-ef6f-45fe-b950-b369c2f8e411', '157');
INSERT INTO `rms_rolemanubuttons` VALUES ('1642', 'c6f8277f-ef6f-45fe-b950-b369c2f8e411', '158');
INSERT INTO `rms_rolemanubuttons` VALUES ('1643', 'c6f8277f-ef6f-45fe-b950-b369c2f8e411', '160');
INSERT INTO `rms_rolemanubuttons` VALUES ('1644', 'c6f8277f-ef6f-45fe-b950-b369c2f8e411', '162');
INSERT INTO `rms_rolemanubuttons` VALUES ('1645', 'c6f8277f-ef6f-45fe-b950-b369c2f8e411', '161');
INSERT INTO `rms_rolemanubuttons` VALUES ('1646', 'c6f8277f-ef6f-45fe-b950-b369c2f8e411', '159');
INSERT INTO `rms_rolemanubuttons` VALUES ('1647', 'c6f8277f-ef6f-45fe-b950-b369c2f8e411', '170');
INSERT INTO `rms_rolemanubuttons` VALUES ('1648', 'c6f8277f-ef6f-45fe-b950-b369c2f8e411', '172');
INSERT INTO `rms_rolemanubuttons` VALUES ('1649', 'c6f8277f-ef6f-45fe-b950-b369c2f8e411', '173');
INSERT INTO `rms_rolemanubuttons` VALUES ('1650', 'c6f8277f-ef6f-45fe-b950-b369c2f8e411', '171');
INSERT INTO `rms_rolemanubuttons` VALUES ('1651', 'c6f8277f-ef6f-45fe-b950-b369c2f8e411', '166');
INSERT INTO `rms_rolemanubuttons` VALUES ('1652', 'c6f8277f-ef6f-45fe-b950-b369c2f8e411', '167');
INSERT INTO `rms_rolemanubuttons` VALUES ('1653', 'c6f8277f-ef6f-45fe-b950-b369c2f8e411', '168');
INSERT INTO `rms_rolemanubuttons` VALUES ('1654', 'c6f8277f-ef6f-45fe-b950-b369c2f8e411', '169');
INSERT INTO `rms_rolemanubuttons` VALUES ('1655', 'c6f8277f-ef6f-45fe-b950-b369c2f8e411', '178');
INSERT INTO `rms_rolemanubuttons` VALUES ('1656', 'c6f8277f-ef6f-45fe-b950-b369c2f8e411', '175');
INSERT INTO `rms_rolemanubuttons` VALUES ('1657', 'c6f8277f-ef6f-45fe-b950-b369c2f8e411', '177');
INSERT INTO `rms_rolemanubuttons` VALUES ('1658', 'c6f8277f-ef6f-45fe-b950-b369c2f8e411', '174');
INSERT INTO `rms_rolemanubuttons` VALUES ('1659', 'c6f8277f-ef6f-45fe-b950-b369c2f8e411', '176');
INSERT INTO `rms_rolemanubuttons` VALUES ('1728', 'f8da7c96-4cfd-4e2a-85a3-2d42868a4904', '164');
INSERT INTO `rms_rolemanubuttons` VALUES ('1729', 'f8da7c96-4cfd-4e2a-85a3-2d42868a4904', '92');
INSERT INTO `rms_rolemanubuttons` VALUES ('1730', 'f8da7c96-4cfd-4e2a-85a3-2d42868a4904', '86');
INSERT INTO `rms_rolemanubuttons` VALUES ('1731', 'f8da7c96-4cfd-4e2a-85a3-2d42868a4904', '135');
INSERT INTO `rms_rolemanubuttons` VALUES ('1732', 'f8da7c96-4cfd-4e2a-85a3-2d42868a4904', '141');
INSERT INTO `rms_rolemanubuttons` VALUES ('1733', 'f8da7c96-4cfd-4e2a-85a3-2d42868a4904', '144');
INSERT INTO `rms_rolemanubuttons` VALUES ('1734', 'f8da7c96-4cfd-4e2a-85a3-2d42868a4904', '152');
INSERT INTO `rms_rolemanubuttons` VALUES ('1735', 'f8da7c96-4cfd-4e2a-85a3-2d42868a4904', '155');
INSERT INTO `rms_rolemanubuttons` VALUES ('1736', 'f8da7c96-4cfd-4e2a-85a3-2d42868a4904', '162');
INSERT INTO `rms_rolemanubuttons` VALUES ('1737', 'f8da7c96-4cfd-4e2a-85a3-2d42868a4904', '173');
INSERT INTO `rms_rolemanubuttons` VALUES ('1738', 'f8da7c96-4cfd-4e2a-85a3-2d42868a4904', '168');
INSERT INTO `rms_rolemanubuttons` VALUES ('1739', 'f8da7c96-4cfd-4e2a-85a3-2d42868a4904', '174');
INSERT INTO `rms_rolemanubuttons` VALUES ('1740', 'f8da7c96-4cfd-4e2a-85a3-2d42868a4904', '177');
INSERT INTO `rms_rolemanubuttons` VALUES ('1741', 'c8f12e86-60c6-46b5-84e8-d1d8781639de', '11');
INSERT INTO `rms_rolemanubuttons` VALUES ('1742', 'c8f12e86-60c6-46b5-84e8-d1d8781639de', '12');
INSERT INTO `rms_rolemanubuttons` VALUES ('1743', 'c8f12e86-60c6-46b5-84e8-d1d8781639de', '15');
INSERT INTO `rms_rolemanubuttons` VALUES ('1744', 'c8f12e86-60c6-46b5-84e8-d1d8781639de', '14');
INSERT INTO `rms_rolemanubuttons` VALUES ('1745', 'c8f12e86-60c6-46b5-84e8-d1d8781639de', '13');
INSERT INTO `rms_rolemanubuttons` VALUES ('1746', 'c8f12e86-60c6-46b5-84e8-d1d8781639de', '21');
INSERT INTO `rms_rolemanubuttons` VALUES ('1747', 'c8f12e86-60c6-46b5-84e8-d1d8781639de', '22');
INSERT INTO `rms_rolemanubuttons` VALUES ('1748', 'c8f12e86-60c6-46b5-84e8-d1d8781639de', '24');
INSERT INTO `rms_rolemanubuttons` VALUES ('1749', 'c8f12e86-60c6-46b5-84e8-d1d8781639de', '23');
INSERT INTO `rms_rolemanubuttons` VALUES ('1750', 'c8f12e86-60c6-46b5-84e8-d1d8781639de', '25');
INSERT INTO `rms_rolemanubuttons` VALUES ('1751', 'c8f12e86-60c6-46b5-84e8-d1d8781639de', '16');
INSERT INTO `rms_rolemanubuttons` VALUES ('1752', 'c8f12e86-60c6-46b5-84e8-d1d8781639de', '18');
INSERT INTO `rms_rolemanubuttons` VALUES ('1753', 'c8f12e86-60c6-46b5-84e8-d1d8781639de', '19');
INSERT INTO `rms_rolemanubuttons` VALUES ('1754', 'c8f12e86-60c6-46b5-84e8-d1d8781639de', '20');
INSERT INTO `rms_rolemanubuttons` VALUES ('1755', 'c8f12e86-60c6-46b5-84e8-d1d8781639de', '17');
INSERT INTO `rms_rolemanubuttons` VALUES ('1756', 'c8f12e86-60c6-46b5-84e8-d1d8781639de', '28');
INSERT INTO `rms_rolemanubuttons` VALUES ('1757', 'c8f12e86-60c6-46b5-84e8-d1d8781639de', '30');
INSERT INTO `rms_rolemanubuttons` VALUES ('1758', 'c8f12e86-60c6-46b5-84e8-d1d8781639de', '26');
INSERT INTO `rms_rolemanubuttons` VALUES ('1759', 'c8f12e86-60c6-46b5-84e8-d1d8781639de', '27');
INSERT INTO `rms_rolemanubuttons` VALUES ('1760', 'c8f12e86-60c6-46b5-84e8-d1d8781639de', '29');
INSERT INTO `rms_rolemanubuttons` VALUES ('1761', 'c8f12e86-60c6-46b5-84e8-d1d8781639de', '35');
INSERT INTO `rms_rolemanubuttons` VALUES ('1762', 'c8f12e86-60c6-46b5-84e8-d1d8781639de', '34');
INSERT INTO `rms_rolemanubuttons` VALUES ('1763', 'c8f12e86-60c6-46b5-84e8-d1d8781639de', '33');
INSERT INTO `rms_rolemanubuttons` VALUES ('1764', 'c8f12e86-60c6-46b5-84e8-d1d8781639de', '32');
INSERT INTO `rms_rolemanubuttons` VALUES ('1765', 'c8f12e86-60c6-46b5-84e8-d1d8781639de', '31');
INSERT INTO `rms_rolemanubuttons` VALUES ('1766', 'c8f12e86-60c6-46b5-84e8-d1d8781639de', '6');
INSERT INTO `rms_rolemanubuttons` VALUES ('1767', 'c8f12e86-60c6-46b5-84e8-d1d8781639de', '9');
INSERT INTO `rms_rolemanubuttons` VALUES ('1768', 'c8f12e86-60c6-46b5-84e8-d1d8781639de', '7');
INSERT INTO `rms_rolemanubuttons` VALUES ('1769', 'c8f12e86-60c6-46b5-84e8-d1d8781639de', '8');
INSERT INTO `rms_rolemanubuttons` VALUES ('1770', 'c8f12e86-60c6-46b5-84e8-d1d8781639de', '10');
INSERT INTO `rms_rolemanubuttons` VALUES ('1771', 'c8f12e86-60c6-46b5-84e8-d1d8781639de', '3');
INSERT INTO `rms_rolemanubuttons` VALUES ('1772', 'c8f12e86-60c6-46b5-84e8-d1d8781639de', '2');
INSERT INTO `rms_rolemanubuttons` VALUES ('1773', 'c8f12e86-60c6-46b5-84e8-d1d8781639de', '1');
INSERT INTO `rms_rolemanubuttons` VALUES ('1774', 'c8f12e86-60c6-46b5-84e8-d1d8781639de', '5');
INSERT INTO `rms_rolemanubuttons` VALUES ('1775', 'c8f12e86-60c6-46b5-84e8-d1d8781639de', '4');
INSERT INTO `rms_rolemanubuttons` VALUES ('1776', 'c8f12e86-60c6-46b5-84e8-d1d8781639de', '51');
INSERT INTO `rms_rolemanubuttons` VALUES ('1777', 'c8f12e86-60c6-46b5-84e8-d1d8781639de', '36');
INSERT INTO `rms_rolemanubuttons` VALUES ('1778', 'c8f12e86-60c6-46b5-84e8-d1d8781639de', '37');
INSERT INTO `rms_rolemanubuttons` VALUES ('1779', 'c8f12e86-60c6-46b5-84e8-d1d8781639de', '52');
INSERT INTO `rms_rolemanubuttons` VALUES ('1780', 'c8f12e86-60c6-46b5-84e8-d1d8781639de', '39');
INSERT INTO `rms_rolemanubuttons` VALUES ('1781', 'c8f12e86-60c6-46b5-84e8-d1d8781639de', '38');
INSERT INTO `rms_rolemanubuttons` VALUES ('1782', '24b1762f-0b17-4656-a0c0-7382f057cc34', '11');
INSERT INTO `rms_rolemanubuttons` VALUES ('1783', '24b1762f-0b17-4656-a0c0-7382f057cc34', '12');
INSERT INTO `rms_rolemanubuttons` VALUES ('1784', '24b1762f-0b17-4656-a0c0-7382f057cc34', '15');
INSERT INTO `rms_rolemanubuttons` VALUES ('1785', '24b1762f-0b17-4656-a0c0-7382f057cc34', '14');
INSERT INTO `rms_rolemanubuttons` VALUES ('1786', '24b1762f-0b17-4656-a0c0-7382f057cc34', '17');
INSERT INTO `rms_rolemanubuttons` VALUES ('1787', '24b1762f-0b17-4656-a0c0-7382f057cc34', '27');
INSERT INTO `rms_rolemanubuttons` VALUES ('1788', '24b1762f-0b17-4656-a0c0-7382f057cc34', '33');
INSERT INTO `rms_rolemanubuttons` VALUES ('1789', '24b1762f-0b17-4656-a0c0-7382f057cc34', '9');
INSERT INTO `rms_rolemanubuttons` VALUES ('1790', '24b1762f-0b17-4656-a0c0-7382f057cc34', '3');
INSERT INTO `rms_rolemanubuttons` VALUES ('1791', '4ac8f35a-e006-4ddc-9fe9-90bec52fe0be', '191');
INSERT INTO `rms_rolemanubuttons` VALUES ('1792', '4ac8f35a-e006-4ddc-9fe9-90bec52fe0be', '192');
INSERT INTO `rms_rolemanubuttons` VALUES ('1793', '4ac8f35a-e006-4ddc-9fe9-90bec52fe0be', '194');
INSERT INTO `rms_rolemanubuttons` VALUES ('1794', '4ac8f35a-e006-4ddc-9fe9-90bec52fe0be', '195');
INSERT INTO `rms_rolemanubuttons` VALUES ('1795', '4ac8f35a-e006-4ddc-9fe9-90bec52fe0be', '193');
INSERT INTO `rms_rolemanubuttons` VALUES ('1796', '4ac8f35a-e006-4ddc-9fe9-90bec52fe0be', '186');
INSERT INTO `rms_rolemanubuttons` VALUES ('1797', '4ac8f35a-e006-4ddc-9fe9-90bec52fe0be', '189');
INSERT INTO `rms_rolemanubuttons` VALUES ('1798', '4ac8f35a-e006-4ddc-9fe9-90bec52fe0be', '188');
INSERT INTO `rms_rolemanubuttons` VALUES ('1799', '4ac8f35a-e006-4ddc-9fe9-90bec52fe0be', '190');
INSERT INTO `rms_rolemanubuttons` VALUES ('1800', '4ac8f35a-e006-4ddc-9fe9-90bec52fe0be', '187');
INSERT INTO `rms_rolemanubuttons` VALUES ('1801', 'f035d3e0-dff2-443a-95fc-3abefa70d17f', '192');
INSERT INTO `rms_rolemanubuttons` VALUES ('1802', 'f035d3e0-dff2-443a-95fc-3abefa70d17f', '193');
INSERT INTO `rms_rolemanubuttons` VALUES ('1803', 'f035d3e0-dff2-443a-95fc-3abefa70d17f', '186');
INSERT INTO `rms_rolemanubuttons` VALUES ('1804', 'f035d3e0-dff2-443a-95fc-3abefa70d17f', '189');
INSERT INTO `rms_rolemanubuttons` VALUES ('1805', 'f035d3e0-dff2-443a-95fc-3abefa70d17f', '188');
INSERT INTO `rms_rolemanubuttons` VALUES ('1806', 'f035d3e0-dff2-443a-95fc-3abefa70d17f', '190');
INSERT INTO `rms_rolemanubuttons` VALUES ('1807', 'f035d3e0-dff2-443a-95fc-3abefa70d17f', '187');

-- ----------------------------
-- Table structure for rms_rolemanus
-- ----------------------------
DROP TABLE IF EXISTS `rms_rolemanus`;
CREATE TABLE `rms_rolemanus` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `roleid` varchar(36) DEFAULT NULL COMMENT '角色的Id',
  `manuid` int(11) DEFAULT NULL COMMENT '菜单的Id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `rms_rolemanus_pk` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=804 DEFAULT CHARSET=utf8 COMMENT='RMS_RoleManus角色菜单';

-- ----------------------------
-- Records of rms_rolemanus
-- ----------------------------
INSERT INTO `rms_rolemanus` VALUES ('557', '8d17e9ae-778c-4489-b3e6-69990a226c20', '1');
INSERT INTO `rms_rolemanus` VALUES ('558', '8d17e9ae-778c-4489-b3e6-69990a226c20', '7');
INSERT INTO `rms_rolemanus` VALUES ('559', '8d17e9ae-778c-4489-b3e6-69990a226c20', '8');
INSERT INTO `rms_rolemanus` VALUES ('560', '8d17e9ae-778c-4489-b3e6-69990a226c20', '9');
INSERT INTO `rms_rolemanus` VALUES ('561', '8d17e9ae-778c-4489-b3e6-69990a226c20', '10');
INSERT INTO `rms_rolemanus` VALUES ('562', '8d17e9ae-778c-4489-b3e6-69990a226c20', '6');
INSERT INTO `rms_rolemanus` VALUES ('563', '8d17e9ae-778c-4489-b3e6-69990a226c20', '3');
INSERT INTO `rms_rolemanus` VALUES ('564', '8d17e9ae-778c-4489-b3e6-69990a226c20', '12');
INSERT INTO `rms_rolemanus` VALUES ('565', '8d17e9ae-778c-4489-b3e6-69990a226c20', '11');
INSERT INTO `rms_rolemanus` VALUES ('566', '8d17e9ae-778c-4489-b3e6-69990a226c20', '13');
INSERT INTO `rms_rolemanus` VALUES ('567', '8d17e9ae-778c-4489-b3e6-69990a226c20', '2');
INSERT INTO `rms_rolemanus` VALUES ('568', '8d17e9ae-778c-4489-b3e6-69990a226c20', '5');
INSERT INTO `rms_rolemanus` VALUES ('569', '8d17e9ae-778c-4489-b3e6-69990a226c20', '17');
INSERT INTO `rms_rolemanus` VALUES ('570', '8d17e9ae-778c-4489-b3e6-69990a226c20', '18');
INSERT INTO `rms_rolemanus` VALUES ('571', '8d17e9ae-778c-4489-b3e6-69990a226c20', '4');
INSERT INTO `rms_rolemanus` VALUES ('655', 'a3e4cc49-3df2-4550-b321-ea68e2dc89ae', '33');
INSERT INTO `rms_rolemanus` VALUES ('656', 'a3e4cc49-3df2-4550-b321-ea68e2dc89ae', '34');
INSERT INTO `rms_rolemanus` VALUES ('657', 'a3e4cc49-3df2-4550-b321-ea68e2dc89ae', '49');
INSERT INTO `rms_rolemanus` VALUES ('658', 'a3e4cc49-3df2-4550-b321-ea68e2dc89ae', '38');
INSERT INTO `rms_rolemanus` VALUES ('659', 'a3e4cc49-3df2-4550-b321-ea68e2dc89ae', '53');
INSERT INTO `rms_rolemanus` VALUES ('660', 'a3e4cc49-3df2-4550-b321-ea68e2dc89ae', '54');
INSERT INTO `rms_rolemanus` VALUES ('661', 'a3e4cc49-3df2-4550-b321-ea68e2dc89ae', '55');
INSERT INTO `rms_rolemanus` VALUES ('662', 'a3e4cc49-3df2-4550-b321-ea68e2dc89ae', '56');
INSERT INTO `rms_rolemanus` VALUES ('663', 'a3e4cc49-3df2-4550-b321-ea68e2dc89ae', '57');
INSERT INTO `rms_rolemanus` VALUES ('664', 'a3e4cc49-3df2-4550-b321-ea68e2dc89ae', '32');
INSERT INTO `rms_rolemanus` VALUES ('665', 'a3e4cc49-3df2-4550-b321-ea68e2dc89ae', '35');
INSERT INTO `rms_rolemanus` VALUES ('701', '54993d46-529c-423b-ad0f-667bbc17c3e0', '33');
INSERT INTO `rms_rolemanus` VALUES ('702', '54993d46-529c-423b-ad0f-667bbc17c3e0', '34');
INSERT INTO `rms_rolemanus` VALUES ('703', '54993d46-529c-423b-ad0f-667bbc17c3e0', '49');
INSERT INTO `rms_rolemanus` VALUES ('704', '54993d46-529c-423b-ad0f-667bbc17c3e0', '38');
INSERT INTO `rms_rolemanus` VALUES ('705', '54993d46-529c-423b-ad0f-667bbc17c3e0', '53');
INSERT INTO `rms_rolemanus` VALUES ('706', '54993d46-529c-423b-ad0f-667bbc17c3e0', '54');
INSERT INTO `rms_rolemanus` VALUES ('707', '54993d46-529c-423b-ad0f-667bbc17c3e0', '55');
INSERT INTO `rms_rolemanus` VALUES ('708', '54993d46-529c-423b-ad0f-667bbc17c3e0', '56');
INSERT INTO `rms_rolemanus` VALUES ('709', '54993d46-529c-423b-ad0f-667bbc17c3e0', '57');
INSERT INTO `rms_rolemanus` VALUES ('710', '54993d46-529c-423b-ad0f-667bbc17c3e0', '32');
INSERT INTO `rms_rolemanus` VALUES ('711', '54993d46-529c-423b-ad0f-667bbc17c3e0', '35');
INSERT INTO `rms_rolemanus` VALUES ('712', 'c6f8277f-ef6f-45fe-b950-b369c2f8e411', '33');
INSERT INTO `rms_rolemanus` VALUES ('713', 'c6f8277f-ef6f-45fe-b950-b369c2f8e411', '34');
INSERT INTO `rms_rolemanus` VALUES ('714', 'c6f8277f-ef6f-45fe-b950-b369c2f8e411', '49');
INSERT INTO `rms_rolemanus` VALUES ('715', 'c6f8277f-ef6f-45fe-b950-b369c2f8e411', '38');
INSERT INTO `rms_rolemanus` VALUES ('716', 'c6f8277f-ef6f-45fe-b950-b369c2f8e411', '53');
INSERT INTO `rms_rolemanus` VALUES ('717', 'c6f8277f-ef6f-45fe-b950-b369c2f8e411', '54');
INSERT INTO `rms_rolemanus` VALUES ('718', 'c6f8277f-ef6f-45fe-b950-b369c2f8e411', '55');
INSERT INTO `rms_rolemanus` VALUES ('719', 'c6f8277f-ef6f-45fe-b950-b369c2f8e411', '56');
INSERT INTO `rms_rolemanus` VALUES ('720', 'c6f8277f-ef6f-45fe-b950-b369c2f8e411', '57');
INSERT INTO `rms_rolemanus` VALUES ('721', 'c6f8277f-ef6f-45fe-b950-b369c2f8e411', '59');
INSERT INTO `rms_rolemanus` VALUES ('722', 'c6f8277f-ef6f-45fe-b950-b369c2f8e411', '60');
INSERT INTO `rms_rolemanus` VALUES ('723', 'c6f8277f-ef6f-45fe-b950-b369c2f8e411', '61');
INSERT INTO `rms_rolemanus` VALUES ('724', 'c6f8277f-ef6f-45fe-b950-b369c2f8e411', '62');
INSERT INTO `rms_rolemanus` VALUES ('757', 'f8da7c96-4cfd-4e2a-85a3-2d42868a4904', '32');
INSERT INTO `rms_rolemanus` VALUES ('758', 'f8da7c96-4cfd-4e2a-85a3-2d42868a4904', '36');
INSERT INTO `rms_rolemanus` VALUES ('759', 'f8da7c96-4cfd-4e2a-85a3-2d42868a4904', '33');
INSERT INTO `rms_rolemanus` VALUES ('760', 'f8da7c96-4cfd-4e2a-85a3-2d42868a4904', '34');
INSERT INTO `rms_rolemanus` VALUES ('761', 'f8da7c96-4cfd-4e2a-85a3-2d42868a4904', '38');
INSERT INTO `rms_rolemanus` VALUES ('762', 'f8da7c96-4cfd-4e2a-85a3-2d42868a4904', '49');
INSERT INTO `rms_rolemanus` VALUES ('763', 'f8da7c96-4cfd-4e2a-85a3-2d42868a4904', '53');
INSERT INTO `rms_rolemanus` VALUES ('764', 'f8da7c96-4cfd-4e2a-85a3-2d42868a4904', '54');
INSERT INTO `rms_rolemanus` VALUES ('765', 'f8da7c96-4cfd-4e2a-85a3-2d42868a4904', '55');
INSERT INTO `rms_rolemanus` VALUES ('766', 'f8da7c96-4cfd-4e2a-85a3-2d42868a4904', '56');
INSERT INTO `rms_rolemanus` VALUES ('767', 'f8da7c96-4cfd-4e2a-85a3-2d42868a4904', '57');
INSERT INTO `rms_rolemanus` VALUES ('768', 'f8da7c96-4cfd-4e2a-85a3-2d42868a4904', '59');
INSERT INTO `rms_rolemanus` VALUES ('769', 'f8da7c96-4cfd-4e2a-85a3-2d42868a4904', '60');
INSERT INTO `rms_rolemanus` VALUES ('770', 'f8da7c96-4cfd-4e2a-85a3-2d42868a4904', '61');
INSERT INTO `rms_rolemanus` VALUES ('771', 'f8da7c96-4cfd-4e2a-85a3-2d42868a4904', '62');
INSERT INTO `rms_rolemanus` VALUES ('772', 'c8f12e86-60c6-46b5-84e8-d1d8781639de', '1');
INSERT INTO `rms_rolemanus` VALUES ('773', 'c8f12e86-60c6-46b5-84e8-d1d8781639de', '6');
INSERT INTO `rms_rolemanus` VALUES ('774', 'c8f12e86-60c6-46b5-84e8-d1d8781639de', '7');
INSERT INTO `rms_rolemanus` VALUES ('775', 'c8f12e86-60c6-46b5-84e8-d1d8781639de', '8');
INSERT INTO `rms_rolemanus` VALUES ('776', 'c8f12e86-60c6-46b5-84e8-d1d8781639de', '9');
INSERT INTO `rms_rolemanus` VALUES ('777', 'c8f12e86-60c6-46b5-84e8-d1d8781639de', '10');
INSERT INTO `rms_rolemanus` VALUES ('778', 'c8f12e86-60c6-46b5-84e8-d1d8781639de', '2');
INSERT INTO `rms_rolemanus` VALUES ('779', 'c8f12e86-60c6-46b5-84e8-d1d8781639de', '4');
INSERT INTO `rms_rolemanus` VALUES ('780', 'c8f12e86-60c6-46b5-84e8-d1d8781639de', '5');
INSERT INTO `rms_rolemanus` VALUES ('781', 'c8f12e86-60c6-46b5-84e8-d1d8781639de', '17');
INSERT INTO `rms_rolemanus` VALUES ('782', 'c8f12e86-60c6-46b5-84e8-d1d8781639de', '18');
INSERT INTO `rms_rolemanus` VALUES ('783', 'c8f12e86-60c6-46b5-84e8-d1d8781639de', '3');
INSERT INTO `rms_rolemanus` VALUES ('784', 'c8f12e86-60c6-46b5-84e8-d1d8781639de', '11');
INSERT INTO `rms_rolemanus` VALUES ('785', 'c8f12e86-60c6-46b5-84e8-d1d8781639de', '12');
INSERT INTO `rms_rolemanus` VALUES ('786', 'c8f12e86-60c6-46b5-84e8-d1d8781639de', '13');
INSERT INTO `rms_rolemanus` VALUES ('787', '24b1762f-0b17-4656-a0c0-7382f057cc34', '1');
INSERT INTO `rms_rolemanus` VALUES ('788', '24b1762f-0b17-4656-a0c0-7382f057cc34', '6');
INSERT INTO `rms_rolemanus` VALUES ('789', '24b1762f-0b17-4656-a0c0-7382f057cc34', '8');
INSERT INTO `rms_rolemanus` VALUES ('790', '24b1762f-0b17-4656-a0c0-7382f057cc34', '9');
INSERT INTO `rms_rolemanus` VALUES ('791', '24b1762f-0b17-4656-a0c0-7382f057cc34', '10');
INSERT INTO `rms_rolemanus` VALUES ('792', '24b1762f-0b17-4656-a0c0-7382f057cc34', '4');
INSERT INTO `rms_rolemanus` VALUES ('793', '24b1762f-0b17-4656-a0c0-7382f057cc34', '5');
INSERT INTO `rms_rolemanus` VALUES ('794', '24b1762f-0b17-4656-a0c0-7382f057cc34', '17');
INSERT INTO `rms_rolemanus` VALUES ('795', '24b1762f-0b17-4656-a0c0-7382f057cc34', '18');
INSERT INTO `rms_rolemanus` VALUES ('796', '4ac8f35a-e006-4ddc-9fe9-90bec52fe0be', '66');
INSERT INTO `rms_rolemanus` VALUES ('797', '4ac8f35a-e006-4ddc-9fe9-90bec52fe0be', '68');
INSERT INTO `rms_rolemanus` VALUES ('798', '4ac8f35a-e006-4ddc-9fe9-90bec52fe0be', '67');
INSERT INTO `rms_rolemanus` VALUES ('799', '4ac8f35a-e006-4ddc-9fe9-90bec52fe0be', '69');
INSERT INTO `rms_rolemanus` VALUES ('800', 'f035d3e0-dff2-443a-95fc-3abefa70d17f', '66');
INSERT INTO `rms_rolemanus` VALUES ('801', 'f035d3e0-dff2-443a-95fc-3abefa70d17f', '68');
INSERT INTO `rms_rolemanus` VALUES ('802', 'f035d3e0-dff2-443a-95fc-3abefa70d17f', '67');
INSERT INTO `rms_rolemanus` VALUES ('803', 'f035d3e0-dff2-443a-95fc-3abefa70d17f', '69');

-- ----------------------------
-- Table structure for rms_user
-- ----------------------------
DROP TABLE IF EXISTS `rms_user`;
CREATE TABLE `rms_user` (
  `id` varchar(36) NOT NULL COMMENT '主键',
  `departmentid` int(11) DEFAULT NULL COMMENT '部门主键',
  `loginname` varchar(30) DEFAULT NULL COMMENT '登录名',
  `truename` varchar(20) DEFAULT NULL COMMENT '姓名',
  `password` varchar(40) DEFAULT NULL COMMENT '密码',
  `createtime` datetime(6) DEFAULT NULL COMMENT '添加时间',
  `modifytime` datetime(6) DEFAULT NULL COMMENT '修改时间',
  `usertype` int(11) DEFAULT NULL COMMENT '用户类型',
  `phone` varchar(30) DEFAULT NULL COMMENT '手机',
  `companyid` int(11) DEFAULT NULL COMMENT '公司id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `rms_user_pk` (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='RMS_User系统用户';

-- ----------------------------
-- Records of rms_user
-- ----------------------------
INSERT INTO `rms_user` VALUES ('24a9e22e-c2eb-439c-8cd7-a34c5da0ac11', '7', 'lulucaca', '小得意2', '123456', '2018-01-27 18:05:42.000000', '2018-01-29 15:11:53.000000', null, '1222', '1');
INSERT INTO `rms_user` VALUES ('40ba0992-a87e-483e-95dd-b4e43197f3ed', '6', 'tianneng32', '天能', '123456', '2016-08-29 19:38:26.000000', '2018-07-16 14:47:25.000000', null, null, '3');
INSERT INTO `rms_user` VALUES ('493be24b-f1f8-483e-a09b-0a1b89cd0bc5', '11', 'lulu', '卢露', '123456', '2018-10-23 14:28:27.137000', '2018-10-23 14:28:27.137000', '0', null, '6');
INSERT INTO `rms_user` VALUES ('597e5885-c6cf-4214-84a1-46f957b9b493', '0', '121212', '1212', '1111111', '2018-10-22 23:36:04.666000', '2018-10-22 23:36:02.241000', '0', null, '3');
INSERT INTO `rms_user` VALUES ('6905f4e3-6912-4f6e-80f8-6e4413432162', '2', 'yanshi', '风风', '123456', '2018-10-23 11:15:45.973000', '2018-10-23 11:15:56.000000', '0', null, '1');
INSERT INTO `rms_user` VALUES ('8ab63adb-2bb6-468f-84ad-df71221262e5', '2', 'admin', '小家伙', '123456', '2016-07-28 00:00:00.000000', '2018-07-03 22:57:22.000000', null, null, '1');
INSERT INTO `rms_user` VALUES ('a542648a-8174-4dbb-ae4a-20ceece2c461', '1', 'ludycool', '卢小帅', '123456', '2016-08-18 13:53:09.000000', '2016-08-30 13:53:13.000000', null, null, '1');
INSERT INTO `rms_user` VALUES ('a56cbdc9-598b-4128-97e8-bc41608b9760', '6', 'j-admin', '小卢', '123456', '2016-08-29 17:06:48.000000', '2016-11-03 17:22:29.000000', null, null, '3');
INSERT INTO `rms_user` VALUES ('ca42dc4d-ec4e-4c5b-b1ee-5d81be3f30e2', '8', '1222', '12121', '111111', '2018-10-22 23:49:46.788000', '2018-10-22 23:49:46.788000', '0', null, '3');

-- ----------------------------
-- Table structure for rms_userrole
-- ----------------------------
DROP TABLE IF EXISTS `rms_userrole`;
CREATE TABLE `rms_userrole` (
  `id` varchar(36) NOT NULL COMMENT '主键',
  `userid` varchar(36) DEFAULT NULL COMMENT '用户的Id',
  `roleid` varchar(36) DEFAULT NULL COMMENT '角色的Id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `rms_userrole_pk` (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='RMS_UserRole用户所属角色表';

-- ----------------------------
-- Records of rms_userrole
-- ----------------------------
INSERT INTO `rms_userrole` VALUES ('aef77d21-45ba-4bc6-b1b8-6c92527dd89f', '6905f4e3-6912-4f6e-80f8-6e4413432162', '24b1762f-0b17-4656-a0c0-7382f057cc34');
INSERT INTO `rms_userrole` VALUES ('af47bcba-5ad4-48eb-8f18-a07171b681ca', 'ca42dc4d-ec4e-4c5b-b1ee-5d81be3f30e2', 'a3e4cc49-3df2-4550-b321-ea68e2dc89ae');
INSERT INTO `rms_userrole` VALUES ('b874f12d-41d0-4aae-9ccf-95013fd78236', 'a56cbdc9-598b-4128-97e8-bc41608b9760', 'c6f8277f-ef6f-45fe-b950-b369c2f8e411');
INSERT INTO `rms_userrole` VALUES ('cf9ac5ed-93d8-4926-bcf5-34e7bdd22288', '493be24b-f1f8-483e-a09b-0a1b89cd0bc5', '4ac8f35a-e006-4ddc-9fe9-90bec52fe0be');
INSERT INTO `rms_userrole` VALUES ('dcc1817f-d428-45ce-8f9d-9ef02d04fe9f', '40ba0992-a87e-483e-95dd-b4e43197f3ed', 'a3e4cc49-3df2-4550-b321-ea68e2dc89ae');
INSERT INTO `rms_userrole` VALUES ('ec45dd7c-4504-4eec-8bc7-120906688f49', '8ab63adb-2bb6-468f-84ad-df71221262e5', '8d17e9ae-778c-4489-b3e6-69990a226c20');
INSERT INTO `rms_userrole` VALUES ('ef6cc7a2-43e7-4f2a-9aca-52f7b4267707', 'a542648a-8174-4dbb-ae4a-20ceece2c461', 'c8f12e86-60c6-46b5-84e8-d1d8781639de');

-- ----------------------------
-- Table structure for sl_user
-- ----------------------------
DROP TABLE IF EXISTS `sl_user`;
CREATE TABLE `sl_user` (
  `userid` varchar(36) NOT NULL COMMENT '主键',
  `weixinid` varchar(50) DEFAULT NULL COMMENT '用户微信openId',
  `loginname` varchar(30) DEFAULT NULL COMMENT '登录名',
  `password` varchar(200) DEFAULT NULL COMMENT '密码',
  `usertype` smallint(6) DEFAULT NULL COMMENT '用户类型 0为普通用户 1为vip会员',
  `levels` smallint(6) DEFAULT NULL COMMENT '等级（联盟）',
  `scores` int(11) DEFAULT NULL COMMENT '积分（联盟）',
  `states` smallint(6) DEFAULT NULL COMMENT '状态（1锁定 0 正常-1关闭）',
  `tags` varchar(20) DEFAULT NULL COMMENT '标签(组)',
  `currentip` varchar(20) DEFAULT NULL COMMENT '在线iP',
  `currentport` varchar(20) DEFAULT NULL COMMENT '在线端口',
  `lastloginaddr` varchar(30) DEFAULT NULL COMMENT '最后登录地点',
  `isonline` tinyint(5) DEFAULT NULL COMMENT '状态（1在线 0 下线 ）',
  `createtime` date DEFAULT NULL COMMENT '添加时间',
  `updatetime` date DEFAULT NULL COMMENT '修改时间',
  `isdeleted` tinyint(5) DEFAULT NULL COMMENT '是否删除',
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sl_user
-- ----------------------------

-- ----------------------------
-- Table structure for sl_userinfo
-- ----------------------------
DROP TABLE IF EXISTS `sl_userinfo`;
CREATE TABLE `sl_userinfo` (
  `userid` varchar(36) NOT NULL COMMENT '用户Id',
  `nickname` varchar(20) DEFAULT NULL COMMENT '昵称',
  `signed` varchar(254) DEFAULT NULL COMMENT '签名',
  `imgeurl` varchar(255) DEFAULT NULL COMMENT '头像图片',
  `phone` varchar(20) DEFAULT NULL COMMENT '电话',
  `provincecode` varchar(20) DEFAULT NULL COMMENT '省',
  `citycode` varchar(20) DEFAULT NULL COMMENT '城市',
  `areacode` varchar(20) DEFAULT NULL COMMENT '区',
  `address` varchar(200) DEFAULT NULL COMMENT '地址',
  `categoryid` varchar(20) DEFAULT NULL COMMENT '类别',
  `details` longtext COMMENT '详情',
  `longitude` double DEFAULT NULL COMMENT '经度',
  `latitude` double DEFAULT NULL COMMENT '纬度',
  `locationupdatetime` date DEFAULT NULL COMMENT '位置更新时间',
  `updatetime` date DEFAULT NULL COMMENT '更新时间',
  `truename` varchar(20) DEFAULT NULL COMMENT '姓名',
  `sex` varchar(10) DEFAULT NULL COMMENT ' 男 女',
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sl_userinfo
-- ----------------------------

-- ----------------------------
-- Table structure for sys_cityarea
-- ----------------------------
DROP TABLE IF EXISTS `sys_cityarea`;
CREATE TABLE `sys_cityarea` (
  `cityareaid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `parentid` int(11) DEFAULT NULL COMMENT '父级',
  `tname` varchar(30) DEFAULT NULL COMMENT '名称',
  `tcode` varchar(20) DEFAULT NULL COMMENT '代号',
  `orderno` int(11) DEFAULT NULL COMMENT '排序',
  `areatypes` int(11) DEFAULT NULL COMMENT '类型（类型 0市 1 区 2 省）',
  `icon` varchar(100) DEFAULT NULL COMMENT '图标',
  `remarks` varchar(100) DEFAULT NULL COMMENT '备注',
  `createtime` datetime DEFAULT NULL COMMENT '添加时间',
  `updatetime` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `isvalid` tinyint(5) DEFAULT NULL,
  `isdeleted` tinyint(5) DEFAULT NULL,
  PRIMARY KEY (`cityareaid`),
  UNIQUE KEY `sys_cityarea_pk` (`cityareaid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sys_CityArea 地区城市';

-- ----------------------------
-- Records of sys_cityarea
-- ----------------------------

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `cid` int(11) NOT NULL COMMENT '主键',
  `ctype` varchar(20) DEFAULT NULL COMMENT '类型',
  `cname` varchar(200) DEFAULT NULL COMMENT '名称',
  `cvalue` varchar(100) DEFAULT NULL COMMENT '值',
  `orderid` int(11) DEFAULT NULL COMMENT '排序',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `updatetime` date DEFAULT NULL COMMENT '更新时间',
  `createman` varchar(30) DEFAULT NULL COMMENT '添加人',
  `isvalid` tinyint(5) DEFAULT NULL COMMENT '是否有效',
  PRIMARY KEY (`cid`),
  UNIQUE KEY `sys_config_pk` (`cid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sys_Config  系统配置表';

-- ----------------------------
-- Records of sys_config
-- ----------------------------

-- ----------------------------
-- Table structure for sys_dictionary
-- ----------------------------
DROP TABLE IF EXISTS `sys_dictionary`;
CREATE TABLE `sys_dictionary` (
  `dicid` int(11) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dictypeid` int(11) DEFAULT NULL COMMENT '字典组（类型）',
  `parentid` int(11) DEFAULT NULL COMMENT '上级id',
  `dicname` varchar(30) DEFAULT NULL COMMENT '字典名称',
  `dicno` varchar(20) DEFAULT NULL COMMENT '字典类型编号',
  `icon` varchar(200) DEFAULT NULL COMMENT '图标',
  `remarks` varchar(100) DEFAULT NULL COMMENT '备注',
  `orderid` int(11) DEFAULT NULL COMMENT '排序号',
  `createtime` datetime(6) DEFAULT NULL COMMENT '添加时间',
  `isvalid` tinyint(5) DEFAULT NULL COMMENT '是否有效',
  `isdeleted` tinyint(5) DEFAULT NULL COMMENT '是否删除',
  PRIMARY KEY (`dicid`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='sys_dictionary 字典值表';

-- ----------------------------
-- Records of sys_dictionary
-- ----------------------------
INSERT INTO `sys_dictionary` VALUES ('1', '1', '0', 'wifi模块', '0101', 'icon-rainbow', '2', '23', '2016-08-08 00:00:00.000000', '1', '0');
INSERT INTO `sys_dictionary` VALUES ('2', '3', '7', '深圳', '0301', '3', '6', '0', '2016-11-04 16:51:23.000000', '1', '0');
INSERT INTO `sys_dictionary` VALUES ('3', '1', '0', '红外线', '0102', 'icon-plugin', '12', '4', '2016-08-08 00:00:00.000000', '1', '0');
INSERT INTO `sys_dictionary` VALUES ('4', '4', '0', '开关', '0401', 'icon-application_go', null, '2', '2016-11-08 11:43:19.000000', '1', '0');
INSERT INTO `sys_dictionary` VALUES ('5', '2', '0', 'app首页', '0201', 'icon-star', null, '1', '2016-08-09 00:00:00.000000', '1', '0');
INSERT INTO `sys_dictionary` VALUES ('6', '2', '0', '在路上横栏', '0202', 'icon-page_green', null, '3', '2016-08-09 00:00:00.000000', '1', '0');
INSERT INTO `sys_dictionary` VALUES ('7', '3', '0', '中国', '0300', 'icon-picture_empty', null, '0', '2016-11-04 16:48:57.000000', '1', '0');
INSERT INTO `sys_dictionary` VALUES ('8', '4', '0', '量调节（范围）', '0402', 'icon-arrow_rotate_clockwise', null, '2', '2016-11-08 11:45:03.000000', '1', '0');
INSERT INTO `sys_dictionary` VALUES ('9', '2', '7', '5', '33', '4', '6', '5', '2018-01-30 10:10:19.000000', '1', '0');

-- ----------------------------
-- Table structure for sys_dictype
-- ----------------------------
DROP TABLE IF EXISTS `sys_dictype`;
CREATE TABLE `sys_dictype` (
  `dictypeid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dictypename` varchar(30) DEFAULT NULL COMMENT '字典类型名称',
  `dictypenum` varchar(20) DEFAULT NULL COMMENT '字典类型编号',
  `icon` varchar(200) DEFAULT NULL COMMENT '图标',
  `remarks` varchar(100) DEFAULT NULL COMMENT '备注',
  `orderid` int(11) DEFAULT NULL COMMENT '排序号',
  `createtime` datetime(6) DEFAULT NULL COMMENT '添加时间',
  `isvalid` tinyint(5) DEFAULT NULL COMMENT '是否有效',
  `isdeleted` tinyint(5) DEFAULT NULL COMMENT '是否删除',
  PRIMARY KEY (`dictypeid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='Sys_DicType 字典定义表';

-- ----------------------------
-- Records of sys_dictype
-- ----------------------------
INSERT INTO `sys_dictype` VALUES ('1', '设备类型3', '1', 'icon-television', '444141', '1', '2016-08-08 00:00:00.000000', '1', '0');
INSERT INTO `sys_dictype` VALUES ('2', '广告类型', '2', 'icon-transmit', '', '2', '2016-08-09 00:00:00.000000', '1', '0');
INSERT INTO `sys_dictype` VALUES ('3', '区域', '3', 'icon-border_all', 'we we qwqwqwqw', '2', '2016-11-04 16:48:23.000000', '1', '0');
INSERT INTO `sys_dictype` VALUES ('4', 'aid类型', '4', 'icon-text_inverse', null, '4', '2016-11-08 11:42:41.000000', '1', '0');

-- ----------------------------
-- Table structure for sys_files
-- ----------------------------
DROP TABLE IF EXISTS `sys_files`;
CREATE TABLE `sys_files` (
  `fileid` varchar(36) NOT NULL COMMENT '主键',
  `toid` varchar(40) DEFAULT NULL COMMENT '所禹对象Id',
  `showname` varchar(100) DEFAULT NULL COMMENT '显示名称',
  `filename` varchar(150) DEFAULT NULL COMMENT '文件名',
  `sourcetable` varchar(20) DEFAULT NULL COMMENT '来源表（某个数据表）',
  `relativepath` varchar(200) DEFAULT NULL COMMENT '相对路径',
  `route` varchar(100) DEFAULT NULL COMMENT '路由',
  `suffix` varchar(10) DEFAULT NULL COMMENT '后缀名',
  `filetype` varchar(20) DEFAULT NULL COMMENT '文件属性类型（中文）',
  `addtime` timestamp NULL DEFAULT NULL COMMENT '添加时间',
  `isvalid` tinyint(5) DEFAULT NULL COMMENT '是否有效',
  `isdeleted` tinyint(5) DEFAULT NULL COMMENT '是否删除',
  PRIMARY KEY (`fileid`),
  UNIQUE KEY `sys_files_pk` (`fileid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sys_Files 文件';

-- ----------------------------
-- Records of sys_files
-- ----------------------------
INSERT INTO `sys_files` VALUES ('092dec00-4cfb-41fc-957a-e3a293ff8da4', '', 'liantu.png', '20160809055329_8739d19e-c78f-4a59-9711-146d145af078.png', 'advertise', '/advertise/20160809055329_8739d19e-c78f-4a59-9711-146d145af078.png', 'http://192.168.11.205:94/', '.png', '图片', '2016-08-09 00:00:00', '1', '0');
INSERT INTO `sys_files` VALUES ('0fd3d75f-7669-4eb3-b152-3da75222269b', '', 'QQ图片20160729094950.jpg', '20160809052405_33c5666a-b9fe-4a8f-b1e4-39dd946040d3.jpg', 'advertise', '/advertise/20160809052405_33c5666a-b9fe-4a8f-b1e4-39dd946040d3.jpg', 'http://192.168.11.205:94/', '.jpg', '图片', '2016-08-09 00:00:00', '1', '0');
INSERT INTO `sys_files` VALUES ('1adb8a06-408e-4e1b-a828-ec7adde1006c', '', 'phone_bac.jpg', '20160808055725_603968bb-bfef-4bbc-86ef-6f050ffd86ac.jpg', 'Sys_Dictionary', '\\File\\20160808055725_603968bb-bfef-4bbc-86ef-6f050ffd86ac.jpg', 'http://192.168.11.205:94/', '.jpg', '图片', '2016-08-08 00:00:00', '1', '0');
INSERT INTO `sys_files` VALUES ('1f9a10bc-cc68-4afd-865c-f7acdd57a93b', '', '弹窗效果.jpg', '20160808060352_9f706477-a14f-4abb-8a3a-350066bf14cd.jpg', 'Sys_Dictionary', '\\File\\20160808060352_9f706477-a14f-4abb-8a3a-350066bf14cd.jpg', 'http://192.168.11.205:94/', '.jpg', '图片', '2016-08-08 00:00:00', '1', '0');
INSERT INTO `sys_files` VALUES ('3b215455-897d-432b-b0f3-d5443b7f6102', 'sdsdsdsd', '护车宝LOGO1024X1024.png', '20160804171054345d53db507-76ef-4a6f-a19b-a6bde4ac5324.png', 'test', '\\File\\20160804171054345d53db507-76ef-4a6f-a19b-a6bde4ac5324.png', 'http://192.168.11.205:94/', '.png', '', '2016-08-04 00:00:00', '1', '0');
INSERT INTO `sys_files` VALUES ('426ef5f2-e03c-4a8d-8e7c-29957d0359f4', '', 'phone_bac.jpg', '20160809051741_c789a4d5-c884-4197-801d-0e94ef63bb13.jpg', 'advertise', '/File/20160809051741_c789a4d5-c884-4197-801d-0e94ef63bb13.jpg', 'http://192.168.11.205:94/', '.jpg', '图片', '2016-08-09 00:00:00', '1', '0');
INSERT INTO `sys_files` VALUES ('45872127-e5b3-4399-b6d3-26f41e0e4b01', '', '常用代码.txt', '20160803180256980653c1e0c-6a06-4fbd-a31f-e999daf8e7ad.txt', '', '\\File\\20160803180256980653c1e0c-6a06-4fbd-a31f-e999daf8e7ad.txt', 'http://192.168.3.223:82/', '.txt', '', '2016-08-03 00:00:00', '1', '0');
INSERT INTO `sys_files` VALUES ('47393824-edd4-469c-b6b1-3ce560cd4d62', '', 'QQ图片20160729094950.jpg', '20160808055817_dc370340-66b9-4a35-b5b4-559b04033943.jpg', 'Sys_Dictionary', '\\File\\20160808055817_dc370340-66b9-4a35-b5b4-559b04033943.jpg', 'http://192.168.11.205:94/', '.jpg', '图片', '2016-08-08 00:00:00', '1', '0');
INSERT INTO `sys_files` VALUES ('4a4bceb0-4ac6-4f20-bacb-3dc910922aa6', 'aa0f642b-ba23-47cc-8131-f2ace3d53b0f', 'image.png', '2016080909592312840f6f710-9b1a-4e42-bf56-44f52d42e8ca.png', 'sl_userinfo', '/File/headimg/2016080909592312840f6f710-9b1a-4e42-bf56-44f52d42e8ca.png', 'http://192.168.11.205:94/', '.png', '图片', '2016-08-08 00:00:00', '1', '0');
INSERT INTO `sys_files` VALUES ('4f964f0e-ac9c-4338-8ba7-222469d97bac', '', 'QQ图片20160729094950.jpg', '20160808060145_556966e3-5666-45d9-9171-6e3825b4f500.jpg', 'Sys_Dictionary', '\\File\\20160808060145_556966e3-5666-45d9-9171-6e3825b4f500.jpg', 'http://192.168.11.205:94/', '.jpg', '图片', '2016-08-08 00:00:00', '1', '0');
INSERT INTO `sys_files` VALUES ('5015289f-1770-4485-b231-f18a2f07ecea', '', 'QQ图片20160729094956.jpg', '20160810031428_ae234fc7-2da4-4fcc-ac01-f00eee7ef59b.jpg', 'service', '/File//service/20160810031428_ae234fc7-2da4-4fcc-ac01-f00eee7ef59b.jpg', 'http://192.168.11.205:94/', '.jpg', '图片', '2016-08-10 00:00:00', '1', '0');
INSERT INTO `sys_files` VALUES ('5489c882-cb2a-4122-b77c-520623a941c4', '', 'phone_bac.jpg', '20160810031613_11e5690c-2658-4b66-b44b-f937de861390.jpg', 'service', '/File//service/20160810031613_11e5690c-2658-4b66-b44b-f937de861390.jpg', 'http://192.168.11.205:94/', '.jpg', '图片', '2016-08-10 00:00:00', '1', '0');
INSERT INTO `sys_files` VALUES ('56e6b639-d9a8-4dd2-8f48-5b12e1b47c52', '123131232', '服务器问题回复.docx', '20160803173308016ad364bc4-e895-44b5-8d99-9a36661b8c15.docx', '', '\\File\\20160803173308016ad364bc4-e895-44b5-8d99-9a36661b8c15.docx', 'http://192.168.3.223:82/', '.docx', '', '2016-08-03 00:00:00', '1', '0');
INSERT INTO `sys_files` VALUES ('5b3ea8ae-b8fa-4cf8-8bdb-963a0881f027', '', 'QQ图片20160729094950.jpg', '20160808060703_044fc9e6-48c5-4de9-950a-480401c6a85b.jpg', 'Sys_Dictionary', '/File/20160808060703_044fc9e6-48c5-4de9-950a-480401c6a85b.jpg', 'http://192.168.11.205:94/', '.jpg', '图片', '2016-08-08 00:00:00', '1', '0');
INSERT INTO `sys_files` VALUES ('69361add-a198-4972-b0be-3da8d4170b03', '', '400X400.png', '20160809052906_a1b33d0b-5be9-47b5-b05c-dea527bb5804.png', 'advertise', '/advertise/20160809052906_a1b33d0b-5be9-47b5-b05c-dea527bb5804.png', 'http://192.168.11.205:94/', '.png', '图片', '2016-08-09 00:00:00', '1', '0');
INSERT INTO `sys_files` VALUES ('7026a84b-bb84-4774-a7f3-213e8900e5cc', '', 'QQ图片20160729094956.jpg', '20160808055923_01b5a020-5712-4c3e-a23f-d18fa79bd4e6.jpg', 'Sys_Dictionary', '\\File\\20160808055923_01b5a020-5712-4c3e-a23f-d18fa79bd4e6.jpg', 'http://192.168.11.205:94/', '.jpg', '图片', '2016-08-08 00:00:00', '1', '0');
INSERT INTO `sys_files` VALUES ('8eaa6464-13db-4533-b939-c9fcad85ed27', '', 'phone_bac.jpg', '20160803174943878ec995498-4fa3-43bc-b8a4-61c0725dc9c9.jpg', '', '\\File\\20160803174943878ec995498-4fa3-43bc-b8a4-61c0725dc9c9.jpg', 'http://192.168.3.223:82/', '.jpg', '图片', '2016-08-03 00:00:00', '1', '0');
INSERT INTO `sys_files` VALUES ('8fbd80e4-ded7-4b39-86ca-673a8cd64f86', '', '新建文本文档.txt', '201608031822265997db45704-5beb-4b24-a56d-1acda4949c57.txt', '', '\\File\\201608031822265997db45704-5beb-4b24-a56d-1acda4949c57.txt', 'http://192.168.3.223:82/', '.txt', '', '2016-08-03 00:00:00', '1', '0');
INSERT INTO `sys_files` VALUES ('9c1e8d63-3e7f-4e59-af13-bcd6adfc4a07', 'sdsdsdsd', '使用说明.png', '20160804165858562608c6a70-f7f8-4f44-8f8d-4b9f1eab102e.png', 'test', '\\File\\20160804165858562608c6a70-f7f8-4f44-8f8d-4b9f1eab102e.png', 'http://192.168.11.205:94/', '.png', '', '2016-08-04 00:00:00', '1', '0');
INSERT INTO `sys_files` VALUES ('aeb0b8bf-5c64-4561-9b9e-a48156b4da9d', '', 'phone_bac.jpg', '20160809055612_9b5dc59c-eec1-4184-a4fd-7e7bfac5c8e2.jpg', 'advertise', '/File//advertise/20160809055612_9b5dc59c-eec1-4184-a4fd-7e7bfac5c8e2.jpg', 'http://192.168.11.205:94/', '.jpg', '图片', '2016-08-09 00:00:00', '1', '0');
INSERT INTO `sys_files` VALUES ('b66def0d-0626-432b-aefe-817a9e80baca', '', 'QQ图片20160729094956.jpg', '20160809051754_760cee57-0747-4b46-bb7d-255c231d6f40.jpg', 'advertise', '/File/20160809051754_760cee57-0747-4b46-bb7d-255c231d6f40.jpg', 'http://192.168.11.205:94/', '.jpg', '图片', '2016-08-09 00:00:00', '1', '0');
INSERT INTO `sys_files` VALUES ('b80cfc0b-7eec-464e-baa2-a654b118197a', '', 'QQ图片20160824220433.png', '20160831030412_b80cfc0b-7eec-464e-baa2-a654b118197a.png', 'Sys_Dictionary', '/File//Sys_Dictionary/20160831030412_b80cfc0b-7eec-464e-baa2-a654b118197a.png', 'http://192.168.11.205:94/', '.png', '图片', '2016-08-31 00:00:00', '1', '0');
INSERT INTO `sys_files` VALUES ('c2d0c39e-7c3a-489f-9aae-de5029515ce2', 'sdsdsdsd', '新建文本文档.txt', '2016080416571461637413e3d-96cf-475c-9fa2-58ba8871c78e.txt', 'test', '\\File\\2016080416571461637413e3d-96cf-475c-9fa2-58ba8871c78e.txt', 'http://192.168.11.205:94/', '.txt', '', '2016-08-04 00:00:00', '1', '0');
INSERT INTO `sys_files` VALUES ('d1a472d2-b1e2-4b37-977c-3313f6bed3e5', 'b4c675eb-9f06-4cb8-8eaa-8a75b5058197', 'QQ图片20160729094956.jpg', '2016080518121995636b8f94c-e456-4aa7-bb8c-03c8f501a321.jpg', 'sl_userinfo', '\\File\\headimg\\2016080518121995636b8f94c-e456-4aa7-bb8c-03c8f501a321.jpg', 'http://192.168.11.205:94/', '.jpg', '图片', '2016-08-05 00:00:00', '1', '0');
INSERT INTO `sys_files` VALUES ('f1f76a6f-1de4-4366-adf1-8b315f095b52', '', 'QQ图片20160729094956.jpg', '20160809052316_ac0f2e14-e2e5-43c6-a585-4aeaec0c32ff.jpg', 'advertise', '/advertise/20160809052316_ac0f2e14-e2e5-43c6-a585-4aeaec0c32ff.jpg', 'http://192.168.11.205:94/', '.jpg', '图片', '2016-08-09 00:00:00', '1', '0');

-- ----------------------------
-- Table structure for sysitem
-- ----------------------------
DROP TABLE IF EXISTS `sysitem`;
CREATE TABLE `sysitem` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `itemtype` varchar(20) DEFAULT NULL COMMENT '类型',
  `itemvalue` varchar(100) DEFAULT NULL COMMENT '值',
  `itemname` varchar(200) DEFAULT NULL COMMENT '名称',
  `icon` varchar(100) DEFAULT NULL COMMENT '图标地址',
  `orderid` int(11) DEFAULT NULL COMMENT '排序',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `createtime` timestamp NULL DEFAULT NULL COMMENT '添加时间',
  `createman` varchar(30) DEFAULT NULL COMMENT '添加人',
  `isvalid` tinyint(5) DEFAULT NULL COMMENT '是否有效',
  `isdeleted` tinyint(5) DEFAULT NULL COMMENT '是否删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sysitem_pk` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='SysItem  系统数据字典表';

-- ----------------------------
-- Records of sysitem
-- ----------------------------
INSERT INTO `sysitem` VALUES ('1', 'RoleTypes', '1', '管理员', null, null, null, null, null, '1', '0');
INSERT INTO `sysitem` VALUES ('2', 'RoleTypes', '0', 'app用户', null, null, null, null, null, '1', '0');
INSERT INTO `sysitem` VALUES ('3', 'kk', '0', 'app用户2', null, null, null, null, null, '1', '0');

-- ----------------------------
-- Table structure for warning
-- ----------------------------
DROP TABLE IF EXISTS `warning`;
CREATE TABLE `warning` (
  `warning` longtext,
  `btc` longtext,
  `email` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of warning
-- ----------------------------
INSERT INTO `warning` VALUES ('Send 0.5 BTC to this address and go to this site http://senfgprsjvltleoq.onion/ (tor browser) to recover your database! SQL dump will be available after payment!', '1FizBzhAZifYHKw2WSqD1pizhvNoNGe5h6', 'kannyto@mai2tor.com');

-- ----------------------------
-- View structure for v_menubuttons
-- ----------------------------
DROP VIEW IF EXISTS `v_menubuttons`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `v_menubuttons` AS select `rms_menubuttons`.`manuid` AS `manuid`,`rms_menubuttons`.`orderno` AS `orderno`,`rms_buttons`.`id` AS `id`,`rms_buttons`.`buttonname` AS `buttonname`,`rms_buttons`.`remarks` AS `remarks`,`rms_buttons`.`createtime` AS `createtime`,`rms_buttons`.`modifytime` AS `modifytime`,`rms_buttons`.`valuename` AS `valuename`,`rms_menubuttons`.`id` AS `menubuttonsid`,`rms_buttons`.`functionname` AS `functionname`,`rms_buttons`.`icon` AS `icon` from (`rms_menubuttons` left join `rms_buttons` on((`rms_menubuttons`.`buttonid` = `rms_buttons`.`id`))) ;

-- ----------------------------
-- View structure for v_rms_menus
-- ----------------------------
DROP VIEW IF EXISTS `v_rms_menus`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `v_rms_menus` AS select `rms_menus`.`projectid` AS `projectid`,`rms_menus`.`companyid` AS `companyid`,`rms_menus`.`valuename` AS `valuename`,`rms_menus`.`typeid` AS `typeid`,`rms_menus`.`isshow` AS `isshow`,`rms_menus`.`isenable` AS `isenable`,`rms_menus`.`modifytime` AS `modifytime`,`rms_menus`.`createtime` AS `createtime`,`rms_menus`.`remarks` AS `remarks`,`rms_menus`.`micon` AS `micon`,`rms_menus`.`icon` AS `icon`,`rms_menus`.`url` AS `url`,`rms_menus`.`manuname` AS `manuname`,`rms_menus`.`orderno` AS `orderno`,`rms_menus`.`parentmanuid` AS `parentmanuid`,`rms_menus`.`id` AS `id`,`rms_project`.`name` AS `projectname`,`rms_menus`.`level` AS `level` from (`rms_menus` left join `rms_project` on((`rms_menus`.`projectid` = `rms_project`.`id`))) ;

-- ----------------------------
-- View structure for v_rms_project
-- ----------------------------
DROP VIEW IF EXISTS `v_rms_project`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `v_rms_project` AS select `rms_project`.`id` AS `id`,`rms_project`.`companyid` AS `companyid`,`rms_project`.`name` AS `name`,`rms_project`.`remarks` AS `remarks`,`rms_project`.`createtime` AS `createtime`,`rms_project`.`modifytime` AS `modifytime`,`rms_project`.`isvalid` AS `isvalid`,`rms_project`.`isdeleted` AS `isdeleted`,`rms_company`.`name` AS `companyname`,`rms_project`.`keyid` AS `keyid` from (`rms_project` left join `rms_company` on((`rms_project`.`companyid` = `rms_company`.`id`))) ;

-- ----------------------------
-- View structure for v_role
-- ----------------------------
DROP VIEW IF EXISTS `v_role`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `v_role` AS select `rms_role`.`id` AS `id`,`rms_role`.`rolename` AS `rolename`,`rms_role`.`remarks` AS `remarks`,`rms_role`.`createby` AS `createby`,`rms_role`.`createtime` AS `createtime`,`rms_role`.`modifyby` AS `modifyby`,`rms_role`.`modifytime` AS `modifytime`,`rms_role`.`roletypes` AS `roletypes`,`sysitem`.`itemname` AS `roletypesname`,`rms_role`.`companyid` AS `companyid`,`rms_role`.`projectid` AS `projectid`,`rms_project`.`name` AS `projectname`,`rms_role`.`jurisdiction` AS `jurisdiction` from ((`rms_role` left join `sysitem` on(((`rms_role`.`roletypes` = `sysitem`.`itemvalue`) and (`sysitem`.`itemtype` = 'RoleTypes')))) left join `rms_project` on((`rms_role`.`projectid` = `rms_project`.`id`))) ;

-- ----------------------------
-- View structure for v_rolemanubuttons
-- ----------------------------
DROP VIEW IF EXISTS `v_rolemanubuttons`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `v_rolemanubuttons` AS select `rms_rolemanubuttons`.`roleid` AS `roleid`,`rms_menubuttons`.`manuid` AS `manuid`,`rms_menubuttons`.`orderno` AS `orderno`,`rms_buttons`.`remarks` AS `remarks`,`rms_buttons`.`createtime` AS `createtime`,`rms_buttons`.`modifytime` AS `modifytime`,`rms_buttons`.`valuename` AS `valuename`,`rms_buttons`.`functionname` AS `functionname`,`rms_buttons`.`buttonname` AS `buttonname`,`rms_buttons`.`id` AS `id`,`rms_buttons`.`icon` AS `icon`,`rms_buttons`.`color` AS `color` from ((`rms_rolemanubuttons` join `rms_menubuttons` on((`rms_rolemanubuttons`.`menubuttonsid` = `rms_menubuttons`.`id`))) join `rms_buttons` on((`rms_menubuttons`.`buttonid` = `rms_buttons`.`id`))) ;

-- ----------------------------
-- View structure for v_rolemanus
-- ----------------------------
DROP VIEW IF EXISTS `v_rolemanus`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `v_rolemanus` AS select `rms_rolemanus`.`manuid` AS `manuid`,`rms_rolemanus`.`roleid` AS `roleid`,`rms_menus`.`parentmanuid` AS `parentmanuid`,`rms_menus`.`remarks` AS `remarks`,`rms_menus`.`orderno` AS `orderno`,`rms_menus`.`manuname` AS `manuname`,`rms_menus`.`url` AS `url`,`rms_menus`.`isshow` AS `isshow`,`rms_menus`.`isenable` AS `isenable`,`rms_menus`.`icon` AS `icon`,`rms_menus`.`micon` AS `micon`,`rms_menus`.`typeid` AS `typeid`,`rms_menus`.`valuename` AS `valuename`,`rms_menus`.`level` AS `level` from (`rms_menus` join `rms_rolemanus` on((`rms_menus`.`id` = `rms_rolemanus`.`manuid`))) ;

-- ----------------------------
-- View structure for v_sys_cityarea
-- ----------------------------
DROP VIEW IF EXISTS `v_sys_cityarea`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `v_sys_cityarea` AS select `sys_cityarea`.`cityareaid` AS `cityareaid`,`sys_cityarea`.`parentid` AS `parentid`,`sys_cityarea`.`tname` AS `tname`,`sys_cityarea`.`tcode` AS `tcode`,`sys_cityarea`.`areatypes` AS `areatypes`,`sys_cityarea`.`icon` AS `icon`,`sys_cityarea`.`remarks` AS `remarks`,`sys_cityarea`.`createtime` AS `createtime`,`sys_cityarea`.`updatetime` AS `updatetime`,`sys_cityarea`.`isvalid` AS `isvalid`,`sys_cityarea`.`isdeleted` AS `isdeleted`,`sysitem`.`itemname` AS `areatypesname`,`sys_cityarea`.`orderno` AS `orderno` from (`sys_cityarea` left join `sysitem` on((`sys_cityarea`.`areatypes` = `sysitem`.`itemvalue`))) where (`sysitem`.`itemtype` = 'areatypes') ;

-- ----------------------------
-- View structure for v_userrole
-- ----------------------------
DROP VIEW IF EXISTS `v_userrole`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `v_userrole` AS select `rms_user`.`id` AS `id`,`rms_user`.`loginname` AS `loginname`,`rms_user`.`truename` AS `truename`,`rms_user`.`password` AS `password`,`rms_user`.`createtime` AS `createtime`,`rms_user`.`modifytime` AS `modifytime`,`rms_user`.`departmentid` AS `departmentid`,`rms_userrole`.`roleid` AS `roleid`,`v_role`.`rolename` AS `rolename`,`rms_user`.`usertype` AS `usertype`,`rms_user`.`phone` AS `phone`,`rms_department`.`name` AS `departmentname`,`v_role`.`jurisdiction` AS `jurisdiction`,`rms_user`.`companyid` AS `companyid`,`rms_company`.`name` AS `companyname`,`v_role`.`projectname` AS `projectname` from ((((`rms_user` left join `rms_company` on((`rms_user`.`companyid` = `rms_company`.`id`))) left join `rms_department` on((`rms_user`.`departmentid` = `rms_department`.`id`))) left join `rms_userrole` on((`rms_user`.`id` = `rms_userrole`.`userid`))) left join `v_role` on((`rms_userrole`.`roleid` = `v_role`.`id`))) ;
