/*
Navicat MySQL Data Transfer

Source Server         : local mysql
Source Server Version : 50723
Source Host           : localhost:3306
Source Database       : sso_sysdb

Target Server Type    : MYSQL
Target Server Version : 50723
File Encoding         : 65001

Date: 2018-10-25 23:07:09
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
  `icon` varchar(20) DEFAULT NULL COMMENT '图标',
  `functionname` varchar(20) DEFAULT NULL COMMENT '方法名',
  `remarks` varchar(200) DEFAULT NULL COMMENT '备注',
  `createtime` datetime DEFAULT NULL COMMENT '添加时间',
  `modifytime` datetime DEFAULT NULL COMMENT '更新时间',
  `color` varchar(20) DEFAULT NULL COMMENT '颜色',
  `del_flag` tinyint(4) DEFAULT NULL COMMENT '是否删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='rms_buttons按钮';

-- ----------------------------
-- Records of rms_buttons
-- ----------------------------
INSERT INTO `rms_buttons` VALUES ('1', '3', '删除', 'delBtn', 'icon-delete', 'del', null, '2016-07-27 00:00:00', '2018-10-23 08:50:48', null, '0');
INSERT INTO `rms_buttons` VALUES ('2', '4', '查看', 'detailsBtn', 'icon-zoom', 'showInfo', null, null, '2018-10-23 08:56:14', null, '0');
INSERT INTO `rms_buttons` VALUES ('3', '1', '添加', 'addBtn', 'icon-add', 'addInfo', ' \r\n添加数据 ', null, '2018-10-23 08:50:10', null, '0');
INSERT INTO `rms_buttons` VALUES ('4', '5', '搜索', 'divSearh', 'icon-search', 'search', null, '2016-07-27 00:00:00', '2018-10-23 08:57:41', null, '0');
INSERT INTO `rms_buttons` VALUES ('5', '2', '修改', 'editBtn', 'icon-edit', 'editInfo', '434', null, '2018-10-23 08:50:19', null, '0');
INSERT INTO `rms_buttons` VALUES ('9', '7', '更新', 'reflashBtn', 'icon-disk_download', 'reflashOP', null, '2016-09-01 14:05:12', '2018-10-23 08:57:25', null, '0');
INSERT INTO `rms_buttons` VALUES ('10', '4', '导入', 'importBtn', 'icon-table_add', 'import', null, '2016-09-09 13:52:47', '2018-10-23 08:51:07', null, '0');

-- ----------------------------
-- Table structure for rms_company
-- ----------------------------
DROP TABLE IF EXISTS `rms_company`;
CREATE TABLE `rms_company` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `orderno` int(11) DEFAULT NULL COMMENT '排序',
  `name` varchar(20) DEFAULT NULL COMMENT '名称',
  `remarks` varchar(200) DEFAULT NULL COMMENT '备注',
  `createtime` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '添加时间',
  `modifytime` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '更新时间',
  `del_flag` tinyint(4) DEFAULT NULL COMMENT '是否删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='rms_company 公司';

-- ----------------------------
-- Records of rms_company
-- ----------------------------
INSERT INTO `rms_company` VALUES ('1', '1', '城基生态', '2', '1970-01-01 08:00:01', '1970-01-01 08:00:01', '0');

-- ----------------------------
-- Table structure for rms_department
-- ----------------------------
DROP TABLE IF EXISTS `rms_department`;
CREATE TABLE `rms_department` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `parentid` int(36) DEFAULT NULL COMMENT '上级Id',
  `companyid` int(11) DEFAULT NULL COMMENT '公司id',
  `orderno` int(11) DEFAULT NULL COMMENT '排序',
  `name` varchar(20) DEFAULT NULL COMMENT '名称',
  `icon` varchar(20) DEFAULT NULL COMMENT '图标',
  `remarks` varchar(200) DEFAULT NULL COMMENT '备注',
  `createtime` datetime DEFAULT NULL COMMENT '添加时间',
  `modifytime` datetime DEFAULT NULL COMMENT '更新时间',
  `del_flag` tinyint(4) DEFAULT NULL COMMENT '是否删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='rms_department部门';

-- ----------------------------
-- Records of rms_department
-- ----------------------------
INSERT INTO `rms_department` VALUES ('1', '0', '1', '0', '研发部', 'icon-coins', '我可以', null, '2018-10-25 21:54:38', '0');

-- ----------------------------
-- Table structure for rms_permission
-- ----------------------------
DROP TABLE IF EXISTS `rms_permission`;
CREATE TABLE `rms_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `parentid` int(11) DEFAULT NULL COMMENT '上级Id',
  `orderno` int(11) DEFAULT NULL COMMENT '排序',
  `pname` varchar(20) DEFAULT NULL COMMENT '名称',
  `typeid` smallint(6) DEFAULT NULL COMMENT '类型(0菜单，1按钮)',
  `url` varchar(200) DEFAULT NULL COMMENT '跳转地址(或方法名)',
  `pcode` varchar(32) DEFAULT NULL COMMENT '权限标识符',
  `icon` varchar(200) DEFAULT NULL COMMENT '图标',
  `color` varchar(200) DEFAULT NULL COMMENT '颜色',
  `createtime` datetime DEFAULT NULL COMMENT '添加时间',
  `modifytime` datetime DEFAULT NULL COMMENT '更新时间',
  `del_flag` tinyint(4) DEFAULT NULL COMMENT '是否删除',
  `show_flag` tinyint(4) DEFAULT NULL COMMENT '是否显示',
  `companyid` int(11) DEFAULT NULL COMMENT '公司id',
  `projectid` int(11) DEFAULT NULL COMMENT '项目id',
  `remarks` varchar(200) DEFAULT NULL COMMENT '备注',
  `buttonid` int(255) DEFAULT NULL COMMENT '按钮id',
  `level` int(11) DEFAULT NULL COMMENT '等级',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8 COMMENT='rms_permission权限(菜单和按钮，最底级为按钮)';

-- ----------------------------
-- Records of rms_permission
-- ----------------------------
INSERT INTO `rms_permission` VALUES ('1', '0', '0', '权限管理', '0', 'syspermission', 'syspermission', 'icon-asterisk_orange', null, '2018-10-25 17:52:09', '2018-10-25 17:52:09', '1', '1', '1', '1', null, '0', '0');
INSERT INTO `rms_permission` VALUES ('2', '1', '1', '用户管理', '0', 'user', 'user', 'icon-user_earth', null, '2018-10-25 17:52:55', '2018-10-25 17:53:06', '0', '0', '1', '1', null, '0', '1');
INSERT INTO `rms_permission` VALUES ('4', '2', '2', '修改', '1', 'editInfo', 'user:editInfo', 'icon-edit', null, '2018-10-25 17:56:49', '2018-10-25 17:56:49', '0', '0', '1', '1', '434', '5', '2');
INSERT INTO `rms_permission` VALUES ('9', '0', '0', '基础数据', '0', 'sysset', 'sysset', 'icon-sport_golf_practice', null, '2018-10-25 20:45:33', '2018-10-25 21:00:40', '0', '0', '1', '1', null, '0', '0');
INSERT INTO `rms_permission` VALUES ('10', '9', '2', '数据词典', '0', 'dictionary', 'dictionary', 'icon-text_rotate_0', null, '2018-10-25 21:07:57', '2018-10-25 21:07:57', '1', '1', '1', '1', null, '0', '1');
INSERT INTO `rms_permission` VALUES ('11', '9', '1', '字典类型', '0', 'dictype', 'dictype', 'icon-text_superscript', null, '2018-10-25 21:08:40', '2018-10-25 21:08:40', '1', '1', '1', '1', null, '0', '1');
INSERT INTO `rms_permission` VALUES ('12', '9', '3', '公司管理', '0', 'company', 'company', 'icon-plugin', null, '2018-10-25 21:09:47', '2018-10-25 21:09:47', '1', '1', '1', '1', null, '0', '1');
INSERT INTO `rms_permission` VALUES ('13', '9', '4', '项目管理', '0', 'project', 'project', 'icon-transmit', null, '2018-10-25 21:10:27', '2018-10-25 21:10:27', '1', '1', '1', '1', null, '0', '1');
INSERT INTO `rms_permission` VALUES ('14', '1', '2', '角色管理', '0', 'role', 'role', 'icon-key', null, '2018-10-25 21:11:20', '2018-10-25 21:16:17', '0', '0', '1', '1', null, '0', '1');
INSERT INTO `rms_permission` VALUES ('15', '9', '6', '菜单管理', '0', 'permission', 'permission', 'icon-shape_square', null, '2018-10-25 21:13:31', '2018-10-25 21:14:43', '0', '0', '1', '1', null, '0', '1');
INSERT INTO `rms_permission` VALUES ('16', '9', '5', '按钮管理', '0', 'button', 'button', 'icon-stop', null, '2018-10-25 21:14:37', '2018-10-25 21:14:37', '1', '1', '1', '1', null, '0', '1');
INSERT INTO `rms_permission` VALUES ('17', '1', '0', '部门组织', '0', 'department', 'department', 'icon-group', null, '2018-10-25 21:16:02', '2018-10-25 21:16:02', '1', '1', '1', '1', null, '0', '1');
INSERT INTO `rms_permission` VALUES ('18', '17', '0', '添加', '1', 'addInfo', 'department:addInfo', 'icon-add', null, '2018-10-25 21:16:31', '2018-10-25 21:16:31', '0', '1', '1', '1', ' \r\n添加数据 ', '3', '2');
INSERT INTO `rms_permission` VALUES ('19', '17', '3', '搜索', '1', 'search', 'department:search', 'icon-search', null, '2018-10-25 21:16:31', '2018-10-25 21:16:31', '0', '1', '1', '1', null, '4', '2');
INSERT INTO `rms_permission` VALUES ('20', '17', '2', '删除', '1', 'del', 'department:del', 'icon-delete', null, '2018-10-25 21:16:31', '2018-10-25 21:16:31', '0', '1', '1', '1', null, '1', '2');
INSERT INTO `rms_permission` VALUES ('21', '17', '1', '修改', '1', 'editInfo', 'department:editInfo', 'icon-edit', null, '2018-10-25 21:16:31', '2018-10-25 21:16:31', '0', '1', '1', '1', '434', '5', '2');
INSERT INTO `rms_permission` VALUES ('22', '2', '1', '删除', '1', 'del', 'user:del', 'icon-delete', null, '2018-10-25 21:38:00', '2018-10-25 21:38:00', '0', '1', '1', '1', null, '1', '2');
INSERT INTO `rms_permission` VALUES ('23', '2', '0', '添加', '1', 'addInfo', 'user:addInfo', 'icon-add', null, '2018-10-25 21:38:00', '2018-10-25 21:38:00', '0', '1', '1', '1', ' \r\n添加数据 ', '3', '2');
INSERT INTO `rms_permission` VALUES ('24', '2', '3', '搜索', '1', 'search', 'user:search', 'icon-search', null, '2018-10-25 21:38:00', '2018-10-25 21:38:00', '0', '1', '1', '1', null, '4', '2');
INSERT INTO `rms_permission` VALUES ('25', '14', '2', '删除', '1', 'del', 'role:del', 'icon-delete', null, '2018-10-25 21:38:26', '2018-10-25 21:38:26', '0', '1', '1', '1', null, '1', '2');
INSERT INTO `rms_permission` VALUES ('26', '14', '3', '更新', '1', 'reflashOP', 'role:reflashOP', 'icon-disk_download', null, '2018-10-25 21:38:26', '2018-10-25 21:38:26', '0', '1', '1', '1', null, '9', '2');
INSERT INTO `rms_permission` VALUES ('27', '14', '0', '添加', '1', 'addInfo', 'role:addInfo', 'icon-add', null, '2018-10-25 21:38:26', '2018-10-25 21:38:26', '0', '1', '1', '1', ' \r\n添加数据 ', '3', '2');
INSERT INTO `rms_permission` VALUES ('28', '14', '1', '修改', '1', 'editInfo', 'role:editInfo', 'icon-edit', null, '2018-10-25 21:38:26', '2018-10-25 21:38:26', '0', '1', '1', '1', '434', '5', '2');
INSERT INTO `rms_permission` VALUES ('29', '11', '2', '删除', '1', 'del', 'dictype:del', 'icon-delete', null, '2018-10-25 21:38:46', '2018-10-25 21:38:46', '0', '1', '1', '1', null, '1', '2');
INSERT INTO `rms_permission` VALUES ('30', '11', '0', '添加', '1', 'addInfo', 'dictype:addInfo', 'icon-add', null, '2018-10-25 21:38:46', '2018-10-25 21:38:46', '0', '1', '1', '1', ' \r\n添加数据 ', '3', '2');
INSERT INTO `rms_permission` VALUES ('31', '11', '3', '搜索', '1', 'search', 'dictype:search', 'icon-search', null, '2018-10-25 21:38:46', '2018-10-25 21:38:46', '0', '1', '1', '1', null, '4', '2');
INSERT INTO `rms_permission` VALUES ('32', '11', '1', '修改', '1', 'editInfo', 'dictype:editInfo', 'icon-edit', null, '2018-10-25 21:38:46', '2018-10-25 21:38:46', '0', '1', '1', '1', '434', '5', '2');
INSERT INTO `rms_permission` VALUES ('33', '10', '1', '修改', '1', 'editInfo', 'dictionary:editInfo', 'icon-edit', null, '2018-10-25 21:38:59', '2018-10-25 21:38:59', '0', '1', '1', '1', '434', '5', '2');
INSERT INTO `rms_permission` VALUES ('34', '10', '0', '添加', '1', 'addInfo', 'dictionary:addInfo', 'icon-add', null, '2018-10-25 21:38:59', '2018-10-25 21:38:59', '0', '1', '1', '1', ' \r\n添加数据 ', '3', '2');
INSERT INTO `rms_permission` VALUES ('35', '10', '2', '删除', '1', 'del', 'dictionary:del', 'icon-delete', null, '2018-10-25 21:38:59', '2018-10-25 21:38:59', '0', '1', '1', '1', null, '1', '2');
INSERT INTO `rms_permission` VALUES ('36', '10', '3', '搜索', '1', 'search', 'dictionary:search', 'icon-search', null, '2018-10-25 21:38:59', '2018-10-25 21:38:59', '0', '1', '1', '1', null, '4', '2');
INSERT INTO `rms_permission` VALUES ('37', '12', '1', '修改', '1', 'editInfo', 'company:editInfo', 'icon-edit', null, '2018-10-25 21:39:06', '2018-10-25 21:39:06', '0', '1', '1', '1', '434', '5', '2');
INSERT INTO `rms_permission` VALUES ('38', '12', '2', '删除', '1', 'del', 'company:del', 'icon-delete', null, '2018-10-25 21:39:06', '2018-10-25 21:39:06', '0', '1', '1', '1', null, '1', '2');
INSERT INTO `rms_permission` VALUES ('39', '12', '3', '搜索', '1', 'search', 'company:search', 'icon-search', null, '2018-10-25 21:39:06', '2018-10-25 21:39:06', '0', '1', '1', '1', null, '4', '2');
INSERT INTO `rms_permission` VALUES ('40', '12', '0', '添加', '1', 'addInfo', 'company:addInfo', 'icon-add', null, '2018-10-25 21:39:06', '2018-10-25 21:39:06', '0', '1', '1', '1', ' \r\n添加数据 ', '3', '2');
INSERT INTO `rms_permission` VALUES ('41', '13', '2', '删除', '1', 'del', 'project:del', 'icon-delete', null, '2018-10-25 21:39:24', '2018-10-25 21:39:24', '0', '1', '1', '1', null, '1', '2');
INSERT INTO `rms_permission` VALUES ('42', '13', '1', '修改', '1', 'editInfo', 'project:editInfo', 'icon-edit', null, '2018-10-25 21:39:24', '2018-10-25 21:39:24', '0', '1', '1', '1', '434', '5', '2');
INSERT INTO `rms_permission` VALUES ('43', '13', '3', '搜索', '1', 'search', 'project:search', 'icon-search', null, '2018-10-25 21:39:24', '2018-10-25 21:39:24', '0', '1', '1', '1', null, '4', '2');
INSERT INTO `rms_permission` VALUES ('44', '13', '0', '添加', '1', 'addInfo', 'project:addInfo', 'icon-add', null, '2018-10-25 21:39:24', '2018-10-25 21:39:24', '0', '1', '1', '1', ' \r\n添加数据 ', '3', '2');
INSERT INTO `rms_permission` VALUES ('45', '16', '1', '修改', '1', 'editInfo', 'button:editInfo', 'icon-edit', null, '2018-10-25 21:39:32', '2018-10-25 21:39:32', '0', '1', '1', '1', '434', '5', '2');
INSERT INTO `rms_permission` VALUES ('46', '16', '3', '搜索', '1', 'search', 'button:search', 'icon-search', null, '2018-10-25 21:39:32', '2018-10-25 21:39:32', '0', '1', '1', '1', null, '4', '2');
INSERT INTO `rms_permission` VALUES ('47', '16', '2', '删除', '1', 'del', 'button:del', 'icon-delete', null, '2018-10-25 21:39:32', '2018-10-25 21:39:32', '0', '1', '1', '1', null, '1', '2');
INSERT INTO `rms_permission` VALUES ('48', '16', '0', '添加', '1', 'addInfo', 'button:addInfo', 'icon-add', null, '2018-10-25 21:39:32', '2018-10-25 21:39:32', '0', '1', '1', '1', ' \r\n添加数据 ', '3', '2');
INSERT INTO `rms_permission` VALUES ('49', '15', '0', '添加', '1', 'addInfo', 'permission:addInfo', 'icon-add', null, '2018-10-25 21:39:44', '2018-10-25 21:39:44', '0', '1', '1', '1', ' \r\n添加数据 ', '3', '2');
INSERT INTO `rms_permission` VALUES ('50', '15', '1', '修改', '1', 'editInfo', 'permission:editInfo', 'icon-edit', null, '2018-10-25 21:39:44', '2018-10-25 21:39:44', '0', '1', '1', '1', '434', '5', '2');
INSERT INTO `rms_permission` VALUES ('51', '15', '3', '搜索', '1', 'search', 'permission:search', 'icon-search', null, '2018-10-25 21:39:44', '2018-10-25 21:39:44', '0', '1', '1', '1', null, '4', '2');
INSERT INTO `rms_permission` VALUES ('52', '15', '2', '删除', '1', 'del', 'permission:del', 'icon-delete', null, '2018-10-25 21:39:44', '2018-10-25 21:39:44', '0', '1', '1', '1', null, '1', '2');

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
  `createtime` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '添加时间',
  `modifytime` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '更新时间',
  `del_flag` tinyint(4) DEFAULT NULL COMMENT '是否删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='rms_project 项目';

-- ----------------------------
-- Records of rms_project
-- ----------------------------
INSERT INTO `rms_project` VALUES ('1', '1', null, '权限管理系统', '1', '1970-01-01 08:00:01', '2018-10-25 21:58:32', '0');

-- ----------------------------
-- Table structure for rms_role
-- ----------------------------
DROP TABLE IF EXISTS `rms_role`;
CREATE TABLE `rms_role` (
  `id` varchar(36) NOT NULL COMMENT '主键',
  `companyid` int(11) DEFAULT NULL COMMENT '公司id',
  `projectid` int(11) DEFAULT NULL COMMENT '项目id',
  `rolename` varchar(30) DEFAULT NULL COMMENT '角色名称',
  `remarks` varchar(30) DEFAULT NULL COMMENT '备注',
  `createby` varchar(20) DEFAULT NULL COMMENT '创建人',
  `modifyby` varchar(40) DEFAULT NULL COMMENT '修改人',
  `createtime` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '添加时间',
  `modifytime` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '修改时间',
  `roletypes` int(11) DEFAULT NULL COMMENT '角色类型',
  `jurisdiction` text COMMENT '权限',
  `del_flag` tinyint(4) DEFAULT NULL COMMENT '是否删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='rms_role角色';

-- ----------------------------
-- Records of rms_role
-- ----------------------------
INSERT INTO `rms_role` VALUES ('54948978-f463-4cf8-9578-f120e253dd05', '1', '1', '新测试', '222222', null, 'admin', '2018-10-25 18:00:06', '2018-10-25 18:00:10', '1', '{\"button\":{\"manuinfo\":{\"id\":16,\"parentid\":9,\"orderno\":5,\"pname\":\"按钮管理\",\"typeid\":0,\"url\":\"button\",\"pcode\":\"button\",\"icon\":\"icon-stop\",\"createtime\":\"2018-10-25 21:14:37\",\"modifytime\":\"2018-10-25 21:14:37\",\"del_flag\":false,\"show_flag\":false,\"companyid\":1,\"projectid\":1,\"buttonid\":0,\"level\":1},\"havebuttonsD\":[{\"id\":48,\"parentid\":16,\"orderno\":0,\"pname\":\"添加\",\"typeid\":1,\"url\":\"addInfo\",\"pcode\":\"button:addInfo\",\"icon\":\"icon-add\",\"createtime\":\"2018-10-25 21:39:32\",\"modifytime\":\"2018-10-25 21:39:32\",\"del_flag\":false,\"show_flag\":false,\"companyid\":1,\"projectid\":1,\"remarks\":\" \\r\\n添加数据 \",\"buttonid\":3,\"level\":2},{\"id\":45,\"parentid\":16,\"orderno\":1,\"pname\":\"修改\",\"typeid\":1,\"url\":\"editInfo\",\"pcode\":\"button:editInfo\",\"icon\":\"icon-edit\",\"createtime\":\"2018-10-25 21:39:32\",\"modifytime\":\"2018-10-25 21:39:32\",\"del_flag\":false,\"show_flag\":false,\"companyid\":1,\"projectid\":1,\"remarks\":\"434\",\"buttonid\":5,\"level\":2},{\"id\":47,\"parentid\":16,\"orderno\":2,\"pname\":\"删除\",\"typeid\":1,\"url\":\"del\",\"pcode\":\"button:del\",\"icon\":\"icon-delete\",\"createtime\":\"2018-10-25 21:39:32\",\"modifytime\":\"2018-10-25 21:39:32\",\"del_flag\":false,\"show_flag\":false,\"companyid\":1,\"projectid\":1,\"buttonid\":1,\"level\":2},{\"id\":46,\"parentid\":16,\"orderno\":3,\"pname\":\"搜索\",\"typeid\":1,\"url\":\"search\",\"pcode\":\"button:search\",\"icon\":\"icon-search\",\"createtime\":\"2018-10-25 21:39:32\",\"modifytime\":\"2018-10-25 21:39:32\",\"del_flag\":false,\"show_flag\":false,\"companyid\":1,\"projectid\":1,\"buttonid\":4,\"level\":2}]},\"company\":{\"manuinfo\":{\"id\":12,\"parentid\":9,\"orderno\":3,\"pname\":\"公司管理\",\"typeid\":0,\"url\":\"company\",\"pcode\":\"company\",\"icon\":\"icon-plugin\",\"createtime\":\"2018-10-25 21:09:47\",\"modifytime\":\"2018-10-25 21:09:47\",\"del_flag\":false,\"show_flag\":false,\"companyid\":1,\"projectid\":1,\"buttonid\":0,\"level\":1},\"havebuttonsD\":[{\"id\":40,\"parentid\":12,\"orderno\":0,\"pname\":\"添加\",\"typeid\":1,\"url\":\"addInfo\",\"pcode\":\"company:addInfo\",\"icon\":\"icon-add\",\"createtime\":\"2018-10-25 21:39:06\",\"modifytime\":\"2018-10-25 21:39:06\",\"del_flag\":false,\"show_flag\":false,\"companyid\":1,\"projectid\":1,\"remarks\":\" \\r\\n添加数据 \",\"buttonid\":3,\"level\":2},{\"id\":37,\"parentid\":12,\"orderno\":1,\"pname\":\"修改\",\"typeid\":1,\"url\":\"editInfo\",\"pcode\":\"company:editInfo\",\"icon\":\"icon-edit\",\"createtime\":\"2018-10-25 21:39:06\",\"modifytime\":\"2018-10-25 21:39:06\",\"del_flag\":false,\"show_flag\":false,\"companyid\":1,\"projectid\":1,\"remarks\":\"434\",\"buttonid\":5,\"level\":2},{\"id\":38,\"parentid\":12,\"orderno\":2,\"pname\":\"删除\",\"typeid\":1,\"url\":\"del\",\"pcode\":\"company:del\",\"icon\":\"icon-delete\",\"createtime\":\"2018-10-25 21:39:06\",\"modifytime\":\"2018-10-25 21:39:06\",\"del_flag\":false,\"show_flag\":false,\"companyid\":1,\"projectid\":1,\"buttonid\":1,\"level\":2},{\"id\":39,\"parentid\":12,\"orderno\":3,\"pname\":\"搜索\",\"typeid\":1,\"url\":\"search\",\"pcode\":\"company:search\",\"icon\":\"icon-search\",\"createtime\":\"2018-10-25 21:39:06\",\"modifytime\":\"2018-10-25 21:39:06\",\"del_flag\":false,\"show_flag\":false,\"companyid\":1,\"projectid\":1,\"buttonid\":4,\"level\":2}]},\"department\":{\"manuinfo\":{\"id\":17,\"parentid\":1,\"orderno\":0,\"pname\":\"部门组织\",\"typeid\":0,\"url\":\"department\",\"pcode\":\"department\",\"icon\":\"icon-group\",\"createtime\":\"2018-10-25 21:16:02\",\"modifytime\":\"2018-10-25 21:16:02\",\"del_flag\":false,\"show_flag\":false,\"companyid\":1,\"projectid\":1,\"buttonid\":0,\"level\":1},\"havebuttonsD\":[{\"id\":18,\"parentid\":17,\"orderno\":0,\"pname\":\"添加\",\"typeid\":1,\"url\":\"addInfo\",\"pcode\":\"department:addInfo\",\"icon\":\"icon-add\",\"createtime\":\"2018-10-25 21:16:31\",\"modifytime\":\"2018-10-25 21:16:31\",\"del_flag\":false,\"show_flag\":false,\"companyid\":1,\"projectid\":1,\"remarks\":\" \\r\\n添加数据 \",\"buttonid\":3,\"level\":2},{\"id\":21,\"parentid\":17,\"orderno\":1,\"pname\":\"修改\",\"typeid\":1,\"url\":\"editInfo\",\"pcode\":\"department:editInfo\",\"icon\":\"icon-edit\",\"createtime\":\"2018-10-25 21:16:31\",\"modifytime\":\"2018-10-25 21:16:31\",\"del_flag\":false,\"show_flag\":false,\"companyid\":1,\"projectid\":1,\"remarks\":\"434\",\"buttonid\":5,\"level\":2},{\"id\":20,\"parentid\":17,\"orderno\":2,\"pname\":\"删除\",\"typeid\":1,\"url\":\"del\",\"pcode\":\"department:del\",\"icon\":\"icon-delete\",\"createtime\":\"2018-10-25 21:16:31\",\"modifytime\":\"2018-10-25 21:16:31\",\"del_flag\":false,\"show_flag\":false,\"companyid\":1,\"projectid\":1,\"buttonid\":1,\"level\":2},{\"id\":19,\"parentid\":17,\"orderno\":3,\"pname\":\"搜索\",\"typeid\":1,\"url\":\"search\",\"pcode\":\"department:search\",\"icon\":\"icon-search\",\"createtime\":\"2018-10-25 21:16:31\",\"modifytime\":\"2018-10-25 21:16:31\",\"del_flag\":false,\"show_flag\":false,\"companyid\":1,\"projectid\":1,\"buttonid\":4,\"level\":2}]},\"dictionary\":{\"manuinfo\":{\"id\":10,\"parentid\":9,\"orderno\":2,\"pname\":\"数据词典\",\"typeid\":0,\"url\":\"dictionary\",\"pcode\":\"dictionary\",\"icon\":\"icon-text_rotate_0\",\"createtime\":\"2018-10-25 21:07:57\",\"modifytime\":\"2018-10-25 21:07:57\",\"del_flag\":false,\"show_flag\":false,\"companyid\":1,\"projectid\":1,\"buttonid\":0,\"level\":1},\"havebuttonsD\":[{\"id\":34,\"parentid\":10,\"orderno\":0,\"pname\":\"添加\",\"typeid\":1,\"url\":\"addInfo\",\"pcode\":\"dictionary:addInfo\",\"icon\":\"icon-add\",\"createtime\":\"2018-10-25 21:38:59\",\"modifytime\":\"2018-10-25 21:38:59\",\"del_flag\":false,\"show_flag\":false,\"companyid\":1,\"projectid\":1,\"remarks\":\" \\r\\n添加数据 \",\"buttonid\":3,\"level\":2},{\"id\":33,\"parentid\":10,\"orderno\":1,\"pname\":\"修改\",\"typeid\":1,\"url\":\"editInfo\",\"pcode\":\"dictionary:editInfo\",\"icon\":\"icon-edit\",\"createtime\":\"2018-10-25 21:38:59\",\"modifytime\":\"2018-10-25 21:38:59\",\"del_flag\":false,\"show_flag\":false,\"companyid\":1,\"projectid\":1,\"remarks\":\"434\",\"buttonid\":5,\"level\":2},{\"id\":35,\"parentid\":10,\"orderno\":2,\"pname\":\"删除\",\"typeid\":1,\"url\":\"del\",\"pcode\":\"dictionary:del\",\"icon\":\"icon-delete\",\"createtime\":\"2018-10-25 21:38:59\",\"modifytime\":\"2018-10-25 21:38:59\",\"del_flag\":false,\"show_flag\":false,\"companyid\":1,\"projectid\":1,\"buttonid\":1,\"level\":2},{\"id\":36,\"parentid\":10,\"orderno\":3,\"pname\":\"搜索\",\"typeid\":1,\"url\":\"search\",\"pcode\":\"dictionary:search\",\"icon\":\"icon-search\",\"createtime\":\"2018-10-25 21:38:59\",\"modifytime\":\"2018-10-25 21:38:59\",\"del_flag\":false,\"show_flag\":false,\"companyid\":1,\"projectid\":1,\"buttonid\":4,\"level\":2}]},\"dictype\":{\"manuinfo\":{\"id\":11,\"parentid\":9,\"orderno\":1,\"pname\":\"字典类型\",\"typeid\":0,\"url\":\"dictype\",\"pcode\":\"dictype\",\"icon\":\"icon-text_superscript\",\"createtime\":\"2018-10-25 21:08:40\",\"modifytime\":\"2018-10-25 21:08:40\",\"del_flag\":false,\"show_flag\":false,\"companyid\":1,\"projectid\":1,\"buttonid\":0,\"level\":1},\"havebuttonsD\":[{\"id\":30,\"parentid\":11,\"orderno\":0,\"pname\":\"添加\",\"typeid\":1,\"url\":\"addInfo\",\"pcode\":\"dictype:addInfo\",\"icon\":\"icon-add\",\"createtime\":\"2018-10-25 21:38:46\",\"modifytime\":\"2018-10-25 21:38:46\",\"del_flag\":false,\"show_flag\":false,\"companyid\":1,\"projectid\":1,\"remarks\":\" \\r\\n添加数据 \",\"buttonid\":3,\"level\":2},{\"id\":32,\"parentid\":11,\"orderno\":1,\"pname\":\"修改\",\"typeid\":1,\"url\":\"editInfo\",\"pcode\":\"dictype:editInfo\",\"icon\":\"icon-edit\",\"createtime\":\"2018-10-25 21:38:46\",\"modifytime\":\"2018-10-25 21:38:46\",\"del_flag\":false,\"show_flag\":false,\"companyid\":1,\"projectid\":1,\"remarks\":\"434\",\"buttonid\":5,\"level\":2},{\"id\":29,\"parentid\":11,\"orderno\":2,\"pname\":\"删除\",\"typeid\":1,\"url\":\"del\",\"pcode\":\"dictype:del\",\"icon\":\"icon-delete\",\"createtime\":\"2018-10-25 21:38:46\",\"modifytime\":\"2018-10-25 21:38:46\",\"del_flag\":false,\"show_flag\":false,\"companyid\":1,\"projectid\":1,\"buttonid\":1,\"level\":2},{\"id\":31,\"parentid\":11,\"orderno\":3,\"pname\":\"搜索\",\"typeid\":1,\"url\":\"search\",\"pcode\":\"dictype:search\",\"icon\":\"icon-search\",\"createtime\":\"2018-10-25 21:38:46\",\"modifytime\":\"2018-10-25 21:38:46\",\"del_flag\":false,\"show_flag\":false,\"companyid\":1,\"projectid\":1,\"buttonid\":4,\"level\":2}]},\"permission\":{\"manuinfo\":{\"id\":15,\"parentid\":9,\"orderno\":6,\"pname\":\"菜单管理\",\"typeid\":0,\"url\":\"permission\",\"pcode\":\"permission\",\"icon\":\"icon-shape_square\",\"createtime\":\"2018-10-25 21:13:31\",\"modifytime\":\"2018-10-25 21:14:43\",\"del_flag\":false,\"show_flag\":false,\"companyid\":1,\"projectid\":1,\"buttonid\":0,\"level\":1},\"havebuttonsD\":[{\"id\":49,\"parentid\":15,\"orderno\":0,\"pname\":\"添加\",\"typeid\":1,\"url\":\"addInfo\",\"pcode\":\"permission:addInfo\",\"icon\":\"icon-add\",\"createtime\":\"2018-10-25 21:39:44\",\"modifytime\":\"2018-10-25 21:39:44\",\"del_flag\":false,\"show_flag\":false,\"companyid\":1,\"projectid\":1,\"remarks\":\" \\r\\n添加数据 \",\"buttonid\":3,\"level\":2},{\"id\":50,\"parentid\":15,\"orderno\":1,\"pname\":\"修改\",\"typeid\":1,\"url\":\"editInfo\",\"pcode\":\"permission:editInfo\",\"icon\":\"icon-edit\",\"createtime\":\"2018-10-25 21:39:44\",\"modifytime\":\"2018-10-25 21:39:44\",\"del_flag\":false,\"show_flag\":false,\"companyid\":1,\"projectid\":1,\"remarks\":\"434\",\"buttonid\":5,\"level\":2},{\"id\":52,\"parentid\":15,\"orderno\":2,\"pname\":\"删除\",\"typeid\":1,\"url\":\"del\",\"pcode\":\"permission:del\",\"icon\":\"icon-delete\",\"createtime\":\"2018-10-25 21:39:44\",\"modifytime\":\"2018-10-25 21:39:44\",\"del_flag\":false,\"show_flag\":false,\"companyid\":1,\"projectid\":1,\"buttonid\":1,\"level\":2},{\"id\":51,\"parentid\":15,\"orderno\":3,\"pname\":\"搜索\",\"typeid\":1,\"url\":\"search\",\"pcode\":\"permission:search\",\"icon\":\"icon-search\",\"createtime\":\"2018-10-25 21:39:44\",\"modifytime\":\"2018-10-25 21:39:44\",\"del_flag\":false,\"show_flag\":false,\"companyid\":1,\"projectid\":1,\"buttonid\":4,\"level\":2}]},\"project\":{\"manuinfo\":{\"id\":13,\"parentid\":9,\"orderno\":4,\"pname\":\"项目管理\",\"typeid\":0,\"url\":\"project\",\"pcode\":\"project\",\"icon\":\"icon-transmit\",\"createtime\":\"2018-10-25 21:10:27\",\"modifytime\":\"2018-10-25 21:10:27\",\"del_flag\":false,\"show_flag\":false,\"companyid\":1,\"projectid\":1,\"buttonid\":0,\"level\":1},\"havebuttonsD\":[{\"id\":44,\"parentid\":13,\"orderno\":0,\"pname\":\"添加\",\"typeid\":1,\"url\":\"addInfo\",\"pcode\":\"project:addInfo\",\"icon\":\"icon-add\",\"createtime\":\"2018-10-25 21:39:24\",\"modifytime\":\"2018-10-25 21:39:24\",\"del_flag\":false,\"show_flag\":false,\"companyid\":1,\"projectid\":1,\"remarks\":\" \\r\\n添加数据 \",\"buttonid\":3,\"level\":2},{\"id\":42,\"parentid\":13,\"orderno\":1,\"pname\":\"修改\",\"typeid\":1,\"url\":\"editInfo\",\"pcode\":\"project:editInfo\",\"icon\":\"icon-edit\",\"createtime\":\"2018-10-25 21:39:24\",\"modifytime\":\"2018-10-25 21:39:24\",\"del_flag\":false,\"show_flag\":false,\"companyid\":1,\"projectid\":1,\"remarks\":\"434\",\"buttonid\":5,\"level\":2},{\"id\":41,\"parentid\":13,\"orderno\":2,\"pname\":\"删除\",\"typeid\":1,\"url\":\"del\",\"pcode\":\"project:del\",\"icon\":\"icon-delete\",\"createtime\":\"2018-10-25 21:39:24\",\"modifytime\":\"2018-10-25 21:39:24\",\"del_flag\":false,\"show_flag\":false,\"companyid\":1,\"projectid\":1,\"buttonid\":1,\"level\":2},{\"id\":43,\"parentid\":13,\"orderno\":3,\"pname\":\"搜索\",\"typeid\":1,\"url\":\"search\",\"pcode\":\"project:search\",\"icon\":\"icon-search\",\"createtime\":\"2018-10-25 21:39:24\",\"modifytime\":\"2018-10-25 21:39:24\",\"del_flag\":false,\"show_flag\":false,\"companyid\":1,\"projectid\":1,\"buttonid\":4,\"level\":2}]},\"role\":{\"manuinfo\":{\"id\":14,\"parentid\":1,\"orderno\":2,\"pname\":\"角色管理\",\"typeid\":0,\"url\":\"role\",\"pcode\":\"role\",\"icon\":\"icon-key\",\"createtime\":\"2018-10-25 21:11:20\",\"modifytime\":\"2018-10-25 21:16:17\",\"del_flag\":false,\"show_flag\":false,\"companyid\":1,\"projectid\":1,\"buttonid\":0,\"level\":1},\"havebuttonsD\":[{\"id\":27,\"parentid\":14,\"orderno\":0,\"pname\":\"添加\",\"typeid\":1,\"url\":\"addInfo\",\"pcode\":\"role:addInfo\",\"icon\":\"icon-add\",\"createtime\":\"2018-10-25 21:38:26\",\"modifytime\":\"2018-10-25 21:38:26\",\"del_flag\":false,\"show_flag\":false,\"companyid\":1,\"projectid\":1,\"remarks\":\" \\r\\n添加数据 \",\"buttonid\":3,\"level\":2},{\"id\":28,\"parentid\":14,\"orderno\":1,\"pname\":\"修改\",\"typeid\":1,\"url\":\"editInfo\",\"pcode\":\"role:editInfo\",\"icon\":\"icon-edit\",\"createtime\":\"2018-10-25 21:38:26\",\"modifytime\":\"2018-10-25 21:38:26\",\"del_flag\":false,\"show_flag\":false,\"companyid\":1,\"projectid\":1,\"remarks\":\"434\",\"buttonid\":5,\"level\":2},{\"id\":25,\"parentid\":14,\"orderno\":2,\"pname\":\"删除\",\"typeid\":1,\"url\":\"del\",\"pcode\":\"role:del\",\"icon\":\"icon-delete\",\"createtime\":\"2018-10-25 21:38:26\",\"modifytime\":\"2018-10-25 21:38:26\",\"del_flag\":false,\"show_flag\":false,\"companyid\":1,\"projectid\":1,\"buttonid\":1,\"level\":2},{\"id\":26,\"parentid\":14,\"orderno\":3,\"pname\":\"更新\",\"typeid\":1,\"url\":\"reflashOP\",\"pcode\":\"role:reflashOP\",\"icon\":\"icon-disk_download\",\"createtime\":\"2018-10-25 21:38:26\",\"modifytime\":\"2018-10-25 21:38:26\",\"del_flag\":false,\"show_flag\":false,\"companyid\":1,\"projectid\":1,\"buttonid\":9,\"level\":2}]},\"sysset\":{\"manuinfo\":{\"id\":9,\"parentid\":0,\"orderno\":0,\"pname\":\"基础数据\",\"typeid\":0,\"url\":\"sysset\",\"pcode\":\"sysset\",\"icon\":\"icon-sport_golf_practice\",\"createtime\":\"2018-10-25 20:45:33\",\"modifytime\":\"2018-10-25 21:00:40\",\"del_flag\":false,\"show_flag\":false,\"companyid\":1,\"projectid\":1,\"buttonid\":0,\"level\":0},\"havebuttonsD\":[]},\"user\":{\"manuinfo\":{\"id\":2,\"parentid\":1,\"orderno\":1,\"pname\":\"用户管理\",\"typeid\":0,\"url\":\"user\",\"pcode\":\"user\",\"icon\":\"icon-user_earth\",\"createtime\":\"2018-10-25 17:52:55\",\"modifytime\":\"2018-10-25 17:53:06\",\"del_flag\":false,\"show_flag\":false,\"companyid\":1,\"projectid\":1,\"buttonid\":0,\"level\":1},\"havebuttonsD\":[{\"id\":23,\"parentid\":2,\"orderno\":0,\"pname\":\"添加\",\"typeid\":1,\"url\":\"addInfo\",\"pcode\":\"user:addInfo\",\"icon\":\"icon-add\",\"createtime\":\"2018-10-25 21:38:00\",\"modifytime\":\"2018-10-25 21:38:00\",\"del_flag\":false,\"show_flag\":false,\"companyid\":1,\"projectid\":1,\"remarks\":\" \\r\\n添加数据 \",\"buttonid\":3,\"level\":2},{\"id\":22,\"parentid\":2,\"orderno\":1,\"pname\":\"删除\",\"typeid\":1,\"url\":\"del\",\"pcode\":\"user:del\",\"icon\":\"icon-delete\",\"createtime\":\"2018-10-25 21:38:00\",\"modifytime\":\"2018-10-25 21:38:00\",\"del_flag\":false,\"show_flag\":false,\"companyid\":1,\"projectid\":1,\"buttonid\":1,\"level\":2},{\"id\":4,\"parentid\":2,\"orderno\":2,\"pname\":\"修改\",\"typeid\":1,\"url\":\"editInfo\",\"pcode\":\"user:editInfo\",\"icon\":\"icon-edit\",\"createtime\":\"2018-10-25 17:56:49\",\"modifytime\":\"2018-10-25 17:56:49\",\"del_flag\":false,\"show_flag\":false,\"companyid\":1,\"projectid\":1,\"remarks\":\"434\",\"buttonid\":5,\"level\":2},{\"id\":24,\"parentid\":2,\"orderno\":3,\"pname\":\"搜索\",\"typeid\":1,\"url\":\"search\",\"pcode\":\"user:search\",\"icon\":\"icon-search\",\"createtime\":\"2018-10-25 21:38:00\",\"modifytime\":\"2018-10-25 21:38:00\",\"del_flag\":false,\"show_flag\":false,\"companyid\":1,\"projectid\":1,\"buttonid\":4,\"level\":2}]}}', '0');
INSERT INTO `rms_role` VALUES ('8d17e9ae-778c-4489-b3e6-69990a226c20', '1', '1', '系统开发员', null, null, null, '1970-01-01 08:00:01', '1970-01-01 08:00:01', '1', '{\"button\":{\"manuinfo\":{\"id\":16,\"parentid\":9,\"orderno\":5,\"pname\":\"按钮管理\",\"typeid\":0,\"url\":\"button\",\"pcode\":\"button\",\"icon\":\"icon-stop\",\"createtime\":\"2018-10-25 21:14:37\",\"modifytime\":\"2018-10-25 21:14:37\",\"del_flag\":false,\"show_flag\":false,\"companyid\":1,\"projectid\":1,\"buttonid\":0,\"level\":1},\"havebuttonsD\":[{\"id\":48,\"parentid\":16,\"orderno\":0,\"pname\":\"添加\",\"typeid\":1,\"url\":\"addInfo\",\"pcode\":\"button:addInfo\",\"icon\":\"icon-add\",\"createtime\":\"2018-10-25 21:39:32\",\"modifytime\":\"2018-10-25 21:39:32\",\"del_flag\":false,\"show_flag\":false,\"companyid\":1,\"projectid\":1,\"remarks\":\" \\r\\n添加数据 \",\"buttonid\":3,\"level\":2},{\"id\":45,\"parentid\":16,\"orderno\":1,\"pname\":\"修改\",\"typeid\":1,\"url\":\"editInfo\",\"pcode\":\"button:editInfo\",\"icon\":\"icon-edit\",\"createtime\":\"2018-10-25 21:39:32\",\"modifytime\":\"2018-10-25 21:39:32\",\"del_flag\":false,\"show_flag\":false,\"companyid\":1,\"projectid\":1,\"remarks\":\"434\",\"buttonid\":5,\"level\":2},{\"id\":47,\"parentid\":16,\"orderno\":2,\"pname\":\"删除\",\"typeid\":1,\"url\":\"del\",\"pcode\":\"button:del\",\"icon\":\"icon-delete\",\"createtime\":\"2018-10-25 21:39:32\",\"modifytime\":\"2018-10-25 21:39:32\",\"del_flag\":false,\"show_flag\":false,\"companyid\":1,\"projectid\":1,\"buttonid\":1,\"level\":2},{\"id\":46,\"parentid\":16,\"orderno\":3,\"pname\":\"搜索\",\"typeid\":1,\"url\":\"search\",\"pcode\":\"button:search\",\"icon\":\"icon-search\",\"createtime\":\"2018-10-25 21:39:32\",\"modifytime\":\"2018-10-25 21:39:32\",\"del_flag\":false,\"show_flag\":false,\"companyid\":1,\"projectid\":1,\"buttonid\":4,\"level\":2}]},\"company\":{\"manuinfo\":{\"id\":12,\"parentid\":9,\"orderno\":3,\"pname\":\"公司管理\",\"typeid\":0,\"url\":\"company\",\"pcode\":\"company\",\"icon\":\"icon-plugin\",\"createtime\":\"2018-10-25 21:09:47\",\"modifytime\":\"2018-10-25 21:09:47\",\"del_flag\":false,\"show_flag\":false,\"companyid\":1,\"projectid\":1,\"buttonid\":0,\"level\":1},\"havebuttonsD\":[{\"id\":40,\"parentid\":12,\"orderno\":0,\"pname\":\"添加\",\"typeid\":1,\"url\":\"addInfo\",\"pcode\":\"company:addInfo\",\"icon\":\"icon-add\",\"createtime\":\"2018-10-25 21:39:06\",\"modifytime\":\"2018-10-25 21:39:06\",\"del_flag\":false,\"show_flag\":false,\"companyid\":1,\"projectid\":1,\"remarks\":\" \\r\\n添加数据 \",\"buttonid\":3,\"level\":2},{\"id\":37,\"parentid\":12,\"orderno\":1,\"pname\":\"修改\",\"typeid\":1,\"url\":\"editInfo\",\"pcode\":\"company:editInfo\",\"icon\":\"icon-edit\",\"createtime\":\"2018-10-25 21:39:06\",\"modifytime\":\"2018-10-25 21:39:06\",\"del_flag\":false,\"show_flag\":false,\"companyid\":1,\"projectid\":1,\"remarks\":\"434\",\"buttonid\":5,\"level\":2},{\"id\":38,\"parentid\":12,\"orderno\":2,\"pname\":\"删除\",\"typeid\":1,\"url\":\"del\",\"pcode\":\"company:del\",\"icon\":\"icon-delete\",\"createtime\":\"2018-10-25 21:39:06\",\"modifytime\":\"2018-10-25 21:39:06\",\"del_flag\":false,\"show_flag\":false,\"companyid\":1,\"projectid\":1,\"buttonid\":1,\"level\":2},{\"id\":39,\"parentid\":12,\"orderno\":3,\"pname\":\"搜索\",\"typeid\":1,\"url\":\"search\",\"pcode\":\"company:search\",\"icon\":\"icon-search\",\"createtime\":\"2018-10-25 21:39:06\",\"modifytime\":\"2018-10-25 21:39:06\",\"del_flag\":false,\"show_flag\":false,\"companyid\":1,\"projectid\":1,\"buttonid\":4,\"level\":2}]},\"department\":{\"manuinfo\":{\"id\":17,\"parentid\":1,\"orderno\":0,\"pname\":\"部门组织\",\"typeid\":0,\"url\":\"department\",\"pcode\":\"department\",\"icon\":\"icon-group\",\"createtime\":\"2018-10-25 21:16:02\",\"modifytime\":\"2018-10-25 21:16:02\",\"del_flag\":false,\"show_flag\":false,\"companyid\":1,\"projectid\":1,\"buttonid\":0,\"level\":1},\"havebuttonsD\":[{\"id\":18,\"parentid\":17,\"orderno\":0,\"pname\":\"添加\",\"typeid\":1,\"url\":\"addInfo\",\"pcode\":\"department:addInfo\",\"icon\":\"icon-add\",\"createtime\":\"2018-10-25 21:16:31\",\"modifytime\":\"2018-10-25 21:16:31\",\"del_flag\":false,\"show_flag\":false,\"companyid\":1,\"projectid\":1,\"remarks\":\" \\r\\n添加数据 \",\"buttonid\":3,\"level\":2},{\"id\":21,\"parentid\":17,\"orderno\":1,\"pname\":\"修改\",\"typeid\":1,\"url\":\"editInfo\",\"pcode\":\"department:editInfo\",\"icon\":\"icon-edit\",\"createtime\":\"2018-10-25 21:16:31\",\"modifytime\":\"2018-10-25 21:16:31\",\"del_flag\":false,\"show_flag\":false,\"companyid\":1,\"projectid\":1,\"remarks\":\"434\",\"buttonid\":5,\"level\":2},{\"id\":20,\"parentid\":17,\"orderno\":2,\"pname\":\"删除\",\"typeid\":1,\"url\":\"del\",\"pcode\":\"department:del\",\"icon\":\"icon-delete\",\"createtime\":\"2018-10-25 21:16:31\",\"modifytime\":\"2018-10-25 21:16:31\",\"del_flag\":false,\"show_flag\":false,\"companyid\":1,\"projectid\":1,\"buttonid\":1,\"level\":2},{\"id\":19,\"parentid\":17,\"orderno\":3,\"pname\":\"搜索\",\"typeid\":1,\"url\":\"search\",\"pcode\":\"department:search\",\"icon\":\"icon-search\",\"createtime\":\"2018-10-25 21:16:31\",\"modifytime\":\"2018-10-25 21:16:31\",\"del_flag\":false,\"show_flag\":false,\"companyid\":1,\"projectid\":1,\"buttonid\":4,\"level\":2}]},\"dictionary\":{\"manuinfo\":{\"id\":10,\"parentid\":9,\"orderno\":2,\"pname\":\"数据词典\",\"typeid\":0,\"url\":\"dictionary\",\"pcode\":\"dictionary\",\"icon\":\"icon-text_rotate_0\",\"createtime\":\"2018-10-25 21:07:57\",\"modifytime\":\"2018-10-25 21:07:57\",\"del_flag\":false,\"show_flag\":false,\"companyid\":1,\"projectid\":1,\"buttonid\":0,\"level\":1},\"havebuttonsD\":[{\"id\":34,\"parentid\":10,\"orderno\":0,\"pname\":\"添加\",\"typeid\":1,\"url\":\"addInfo\",\"pcode\":\"dictionary:addInfo\",\"icon\":\"icon-add\",\"createtime\":\"2018-10-25 21:38:59\",\"modifytime\":\"2018-10-25 21:38:59\",\"del_flag\":false,\"show_flag\":false,\"companyid\":1,\"projectid\":1,\"remarks\":\" \\r\\n添加数据 \",\"buttonid\":3,\"level\":2},{\"id\":33,\"parentid\":10,\"orderno\":1,\"pname\":\"修改\",\"typeid\":1,\"url\":\"editInfo\",\"pcode\":\"dictionary:editInfo\",\"icon\":\"icon-edit\",\"createtime\":\"2018-10-25 21:38:59\",\"modifytime\":\"2018-10-25 21:38:59\",\"del_flag\":false,\"show_flag\":false,\"companyid\":1,\"projectid\":1,\"remarks\":\"434\",\"buttonid\":5,\"level\":2},{\"id\":35,\"parentid\":10,\"orderno\":2,\"pname\":\"删除\",\"typeid\":1,\"url\":\"del\",\"pcode\":\"dictionary:del\",\"icon\":\"icon-delete\",\"createtime\":\"2018-10-25 21:38:59\",\"modifytime\":\"2018-10-25 21:38:59\",\"del_flag\":false,\"show_flag\":false,\"companyid\":1,\"projectid\":1,\"buttonid\":1,\"level\":2},{\"id\":36,\"parentid\":10,\"orderno\":3,\"pname\":\"搜索\",\"typeid\":1,\"url\":\"search\",\"pcode\":\"dictionary:search\",\"icon\":\"icon-search\",\"createtime\":\"2018-10-25 21:38:59\",\"modifytime\":\"2018-10-25 21:38:59\",\"del_flag\":false,\"show_flag\":false,\"companyid\":1,\"projectid\":1,\"buttonid\":4,\"level\":2}]},\"dictype\":{\"manuinfo\":{\"id\":11,\"parentid\":9,\"orderno\":1,\"pname\":\"字典类型\",\"typeid\":0,\"url\":\"dictype\",\"pcode\":\"dictype\",\"icon\":\"icon-text_superscript\",\"createtime\":\"2018-10-25 21:08:40\",\"modifytime\":\"2018-10-25 21:08:40\",\"del_flag\":false,\"show_flag\":false,\"companyid\":1,\"projectid\":1,\"buttonid\":0,\"level\":1},\"havebuttonsD\":[{\"id\":30,\"parentid\":11,\"orderno\":0,\"pname\":\"添加\",\"typeid\":1,\"url\":\"addInfo\",\"pcode\":\"dictype:addInfo\",\"icon\":\"icon-add\",\"createtime\":\"2018-10-25 21:38:46\",\"modifytime\":\"2018-10-25 21:38:46\",\"del_flag\":false,\"show_flag\":false,\"companyid\":1,\"projectid\":1,\"remarks\":\" \\r\\n添加数据 \",\"buttonid\":3,\"level\":2},{\"id\":32,\"parentid\":11,\"orderno\":1,\"pname\":\"修改\",\"typeid\":1,\"url\":\"editInfo\",\"pcode\":\"dictype:editInfo\",\"icon\":\"icon-edit\",\"createtime\":\"2018-10-25 21:38:46\",\"modifytime\":\"2018-10-25 21:38:46\",\"del_flag\":false,\"show_flag\":false,\"companyid\":1,\"projectid\":1,\"remarks\":\"434\",\"buttonid\":5,\"level\":2},{\"id\":29,\"parentid\":11,\"orderno\":2,\"pname\":\"删除\",\"typeid\":1,\"url\":\"del\",\"pcode\":\"dictype:del\",\"icon\":\"icon-delete\",\"createtime\":\"2018-10-25 21:38:46\",\"modifytime\":\"2018-10-25 21:38:46\",\"del_flag\":false,\"show_flag\":false,\"companyid\":1,\"projectid\":1,\"buttonid\":1,\"level\":2},{\"id\":31,\"parentid\":11,\"orderno\":3,\"pname\":\"搜索\",\"typeid\":1,\"url\":\"search\",\"pcode\":\"dictype:search\",\"icon\":\"icon-search\",\"createtime\":\"2018-10-25 21:38:46\",\"modifytime\":\"2018-10-25 21:38:46\",\"del_flag\":false,\"show_flag\":false,\"companyid\":1,\"projectid\":1,\"buttonid\":4,\"level\":2}]},\"permission\":{\"manuinfo\":{\"id\":15,\"parentid\":9,\"orderno\":6,\"pname\":\"菜单管理\",\"typeid\":0,\"url\":\"permission\",\"pcode\":\"permission\",\"icon\":\"icon-shape_square\",\"createtime\":\"2018-10-25 21:13:31\",\"modifytime\":\"2018-10-25 21:14:43\",\"del_flag\":false,\"show_flag\":false,\"companyid\":1,\"projectid\":1,\"buttonid\":0,\"level\":1},\"havebuttonsD\":[{\"id\":49,\"parentid\":15,\"orderno\":0,\"pname\":\"添加\",\"typeid\":1,\"url\":\"addInfo\",\"pcode\":\"permission:addInfo\",\"icon\":\"icon-add\",\"createtime\":\"2018-10-25 21:39:44\",\"modifytime\":\"2018-10-25 21:39:44\",\"del_flag\":false,\"show_flag\":false,\"companyid\":1,\"projectid\":1,\"remarks\":\" \\r\\n添加数据 \",\"buttonid\":3,\"level\":2},{\"id\":50,\"parentid\":15,\"orderno\":1,\"pname\":\"修改\",\"typeid\":1,\"url\":\"editInfo\",\"pcode\":\"permission:editInfo\",\"icon\":\"icon-edit\",\"createtime\":\"2018-10-25 21:39:44\",\"modifytime\":\"2018-10-25 21:39:44\",\"del_flag\":false,\"show_flag\":false,\"companyid\":1,\"projectid\":1,\"remarks\":\"434\",\"buttonid\":5,\"level\":2},{\"id\":52,\"parentid\":15,\"orderno\":2,\"pname\":\"删除\",\"typeid\":1,\"url\":\"del\",\"pcode\":\"permission:del\",\"icon\":\"icon-delete\",\"createtime\":\"2018-10-25 21:39:44\",\"modifytime\":\"2018-10-25 21:39:44\",\"del_flag\":false,\"show_flag\":false,\"companyid\":1,\"projectid\":1,\"buttonid\":1,\"level\":2},{\"id\":51,\"parentid\":15,\"orderno\":3,\"pname\":\"搜索\",\"typeid\":1,\"url\":\"search\",\"pcode\":\"permission:search\",\"icon\":\"icon-search\",\"createtime\":\"2018-10-25 21:39:44\",\"modifytime\":\"2018-10-25 21:39:44\",\"del_flag\":false,\"show_flag\":false,\"companyid\":1,\"projectid\":1,\"buttonid\":4,\"level\":2}]},\"project\":{\"manuinfo\":{\"id\":13,\"parentid\":9,\"orderno\":4,\"pname\":\"项目管理\",\"typeid\":0,\"url\":\"project\",\"pcode\":\"project\",\"icon\":\"icon-transmit\",\"createtime\":\"2018-10-25 21:10:27\",\"modifytime\":\"2018-10-25 21:10:27\",\"del_flag\":false,\"show_flag\":false,\"companyid\":1,\"projectid\":1,\"buttonid\":0,\"level\":1},\"havebuttonsD\":[{\"id\":44,\"parentid\":13,\"orderno\":0,\"pname\":\"添加\",\"typeid\":1,\"url\":\"addInfo\",\"pcode\":\"project:addInfo\",\"icon\":\"icon-add\",\"createtime\":\"2018-10-25 21:39:24\",\"modifytime\":\"2018-10-25 21:39:24\",\"del_flag\":false,\"show_flag\":false,\"companyid\":1,\"projectid\":1,\"remarks\":\" \\r\\n添加数据 \",\"buttonid\":3,\"level\":2},{\"id\":42,\"parentid\":13,\"orderno\":1,\"pname\":\"修改\",\"typeid\":1,\"url\":\"editInfo\",\"pcode\":\"project:editInfo\",\"icon\":\"icon-edit\",\"createtime\":\"2018-10-25 21:39:24\",\"modifytime\":\"2018-10-25 21:39:24\",\"del_flag\":false,\"show_flag\":false,\"companyid\":1,\"projectid\":1,\"remarks\":\"434\",\"buttonid\":5,\"level\":2},{\"id\":41,\"parentid\":13,\"orderno\":2,\"pname\":\"删除\",\"typeid\":1,\"url\":\"del\",\"pcode\":\"project:del\",\"icon\":\"icon-delete\",\"createtime\":\"2018-10-25 21:39:24\",\"modifytime\":\"2018-10-25 21:39:24\",\"del_flag\":false,\"show_flag\":false,\"companyid\":1,\"projectid\":1,\"buttonid\":1,\"level\":2},{\"id\":43,\"parentid\":13,\"orderno\":3,\"pname\":\"搜索\",\"typeid\":1,\"url\":\"search\",\"pcode\":\"project:search\",\"icon\":\"icon-search\",\"createtime\":\"2018-10-25 21:39:24\",\"modifytime\":\"2018-10-25 21:39:24\",\"del_flag\":false,\"show_flag\":false,\"companyid\":1,\"projectid\":1,\"buttonid\":4,\"level\":2}]},\"role\":{\"manuinfo\":{\"id\":14,\"parentid\":1,\"orderno\":2,\"pname\":\"角色管理\",\"typeid\":0,\"url\":\"role\",\"pcode\":\"role\",\"icon\":\"icon-key\",\"createtime\":\"2018-10-25 21:11:20\",\"modifytime\":\"2018-10-25 21:16:17\",\"del_flag\":false,\"show_flag\":false,\"companyid\":1,\"projectid\":1,\"buttonid\":0,\"level\":1},\"havebuttonsD\":[{\"id\":27,\"parentid\":14,\"orderno\":0,\"pname\":\"添加\",\"typeid\":1,\"url\":\"addInfo\",\"pcode\":\"role:addInfo\",\"icon\":\"icon-add\",\"createtime\":\"2018-10-25 21:38:26\",\"modifytime\":\"2018-10-25 21:38:26\",\"del_flag\":false,\"show_flag\":false,\"companyid\":1,\"projectid\":1,\"remarks\":\" \\r\\n添加数据 \",\"buttonid\":3,\"level\":2},{\"id\":28,\"parentid\":14,\"orderno\":1,\"pname\":\"修改\",\"typeid\":1,\"url\":\"editInfo\",\"pcode\":\"role:editInfo\",\"icon\":\"icon-edit\",\"createtime\":\"2018-10-25 21:38:26\",\"modifytime\":\"2018-10-25 21:38:26\",\"del_flag\":false,\"show_flag\":false,\"companyid\":1,\"projectid\":1,\"remarks\":\"434\",\"buttonid\":5,\"level\":2},{\"id\":25,\"parentid\":14,\"orderno\":2,\"pname\":\"删除\",\"typeid\":1,\"url\":\"del\",\"pcode\":\"role:del\",\"icon\":\"icon-delete\",\"createtime\":\"2018-10-25 21:38:26\",\"modifytime\":\"2018-10-25 21:38:26\",\"del_flag\":false,\"show_flag\":false,\"companyid\":1,\"projectid\":1,\"buttonid\":1,\"level\":2},{\"id\":26,\"parentid\":14,\"orderno\":3,\"pname\":\"更新\",\"typeid\":1,\"url\":\"reflashOP\",\"pcode\":\"role:reflashOP\",\"icon\":\"icon-disk_download\",\"createtime\":\"2018-10-25 21:38:26\",\"modifytime\":\"2018-10-25 21:38:26\",\"del_flag\":false,\"show_flag\":false,\"companyid\":1,\"projectid\":1,\"buttonid\":9,\"level\":2}]},\"syspermission\":{\"manuinfo\":{\"id\":1,\"parentid\":0,\"orderno\":0,\"pname\":\"权限管理\",\"typeid\":0,\"url\":\"syspermission\",\"pcode\":\"syspermission\",\"icon\":\"icon-asterisk_orange\",\"createtime\":\"2018-10-25 17:52:09\",\"modifytime\":\"2018-10-25 17:52:09\",\"del_flag\":false,\"show_flag\":false,\"companyid\":1,\"projectid\":1,\"buttonid\":0,\"level\":0},\"havebuttonsD\":[]},\"sysset\":{\"manuinfo\":{\"id\":9,\"parentid\":0,\"orderno\":0,\"pname\":\"基础数据\",\"typeid\":0,\"url\":\"sysset\",\"pcode\":\"sysset\",\"icon\":\"icon-sport_golf_practice\",\"createtime\":\"2018-10-25 20:45:33\",\"modifytime\":\"2018-10-25 21:00:40\",\"del_flag\":false,\"show_flag\":false,\"companyid\":1,\"projectid\":1,\"buttonid\":0,\"level\":0},\"havebuttonsD\":[]},\"user\":{\"manuinfo\":{\"id\":2,\"parentid\":1,\"orderno\":1,\"pname\":\"用户管理\",\"typeid\":0,\"url\":\"user\",\"pcode\":\"user\",\"icon\":\"icon-user_earth\",\"createtime\":\"2018-10-25 17:52:55\",\"modifytime\":\"2018-10-25 17:53:06\",\"del_flag\":false,\"show_flag\":false,\"companyid\":1,\"projectid\":1,\"buttonid\":0,\"level\":1},\"havebuttonsD\":[{\"id\":23,\"parentid\":2,\"orderno\":0,\"pname\":\"添加\",\"typeid\":1,\"url\":\"addInfo\",\"pcode\":\"user:addInfo\",\"icon\":\"icon-add\",\"createtime\":\"2018-10-25 21:38:00\",\"modifytime\":\"2018-10-25 21:38:00\",\"del_flag\":false,\"show_flag\":false,\"companyid\":1,\"projectid\":1,\"remarks\":\" \\r\\n添加数据 \",\"buttonid\":3,\"level\":2},{\"id\":22,\"parentid\":2,\"orderno\":1,\"pname\":\"删除\",\"typeid\":1,\"url\":\"del\",\"pcode\":\"user:del\",\"icon\":\"icon-delete\",\"createtime\":\"2018-10-25 21:38:00\",\"modifytime\":\"2018-10-25 21:38:00\",\"del_flag\":false,\"show_flag\":false,\"companyid\":1,\"projectid\":1,\"buttonid\":1,\"level\":2},{\"id\":4,\"parentid\":2,\"orderno\":2,\"pname\":\"修改\",\"typeid\":1,\"url\":\"editInfo\",\"pcode\":\"user:editInfo\",\"icon\":\"icon-edit\",\"createtime\":\"2018-10-25 17:56:49\",\"modifytime\":\"2018-10-25 17:56:49\",\"del_flag\":false,\"show_flag\":false,\"companyid\":1,\"projectid\":1,\"remarks\":\"434\",\"buttonid\":5,\"level\":2},{\"id\":24,\"parentid\":2,\"orderno\":3,\"pname\":\"搜索\",\"typeid\":1,\"url\":\"search\",\"pcode\":\"user:search\",\"icon\":\"icon-search\",\"createtime\":\"2018-10-25 21:38:00\",\"modifytime\":\"2018-10-25 21:38:00\",\"del_flag\":false,\"show_flag\":false,\"companyid\":1,\"projectid\":1,\"buttonid\":4,\"level\":2}]}}', '0');

-- ----------------------------
-- Table structure for rms_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `rms_role_permission`;
CREATE TABLE `rms_role_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `roleid` varchar(36) DEFAULT NULL COMMENT '角色的Id',
  `permissionid` int(11) DEFAULT NULL COMMENT '菜单的Id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=149 DEFAULT CHARSET=utf8 COMMENT='rms_role_permission角色权限';

-- ----------------------------
-- Records of rms_role_permission
-- ----------------------------
INSERT INTO `rms_role_permission` VALUES ('55', '8d17e9ae-778c-4489-b3e6-69990a226c20', '1');
INSERT INTO `rms_role_permission` VALUES ('56', '8d17e9ae-778c-4489-b3e6-69990a226c20', '2');
INSERT INTO `rms_role_permission` VALUES ('57', '8d17e9ae-778c-4489-b3e6-69990a226c20', '14');
INSERT INTO `rms_role_permission` VALUES ('58', '8d17e9ae-778c-4489-b3e6-69990a226c20', '17');
INSERT INTO `rms_role_permission` VALUES ('59', '8d17e9ae-778c-4489-b3e6-69990a226c20', '9');
INSERT INTO `rms_role_permission` VALUES ('60', '8d17e9ae-778c-4489-b3e6-69990a226c20', '10');
INSERT INTO `rms_role_permission` VALUES ('61', '8d17e9ae-778c-4489-b3e6-69990a226c20', '11');
INSERT INTO `rms_role_permission` VALUES ('62', '8d17e9ae-778c-4489-b3e6-69990a226c20', '12');
INSERT INTO `rms_role_permission` VALUES ('63', '8d17e9ae-778c-4489-b3e6-69990a226c20', '13');
INSERT INTO `rms_role_permission` VALUES ('64', '8d17e9ae-778c-4489-b3e6-69990a226c20', '15');
INSERT INTO `rms_role_permission` VALUES ('65', '8d17e9ae-778c-4489-b3e6-69990a226c20', '16');
INSERT INTO `rms_role_permission` VALUES ('66', '8d17e9ae-778c-4489-b3e6-69990a226c20', '22');
INSERT INTO `rms_role_permission` VALUES ('67', '8d17e9ae-778c-4489-b3e6-69990a226c20', '23');
INSERT INTO `rms_role_permission` VALUES ('68', '8d17e9ae-778c-4489-b3e6-69990a226c20', '24');
INSERT INTO `rms_role_permission` VALUES ('69', '8d17e9ae-778c-4489-b3e6-69990a226c20', '4');
INSERT INTO `rms_role_permission` VALUES ('70', '8d17e9ae-778c-4489-b3e6-69990a226c20', '25');
INSERT INTO `rms_role_permission` VALUES ('71', '8d17e9ae-778c-4489-b3e6-69990a226c20', '27');
INSERT INTO `rms_role_permission` VALUES ('72', '8d17e9ae-778c-4489-b3e6-69990a226c20', '28');
INSERT INTO `rms_role_permission` VALUES ('73', '8d17e9ae-778c-4489-b3e6-69990a226c20', '26');
INSERT INTO `rms_role_permission` VALUES ('74', '8d17e9ae-778c-4489-b3e6-69990a226c20', '20');
INSERT INTO `rms_role_permission` VALUES ('75', '8d17e9ae-778c-4489-b3e6-69990a226c20', '18');
INSERT INTO `rms_role_permission` VALUES ('76', '8d17e9ae-778c-4489-b3e6-69990a226c20', '19');
INSERT INTO `rms_role_permission` VALUES ('77', '8d17e9ae-778c-4489-b3e6-69990a226c20', '21');
INSERT INTO `rms_role_permission` VALUES ('78', '8d17e9ae-778c-4489-b3e6-69990a226c20', '35');
INSERT INTO `rms_role_permission` VALUES ('79', '8d17e9ae-778c-4489-b3e6-69990a226c20', '34');
INSERT INTO `rms_role_permission` VALUES ('80', '8d17e9ae-778c-4489-b3e6-69990a226c20', '36');
INSERT INTO `rms_role_permission` VALUES ('81', '8d17e9ae-778c-4489-b3e6-69990a226c20', '33');
INSERT INTO `rms_role_permission` VALUES ('82', '8d17e9ae-778c-4489-b3e6-69990a226c20', '29');
INSERT INTO `rms_role_permission` VALUES ('83', '8d17e9ae-778c-4489-b3e6-69990a226c20', '30');
INSERT INTO `rms_role_permission` VALUES ('84', '8d17e9ae-778c-4489-b3e6-69990a226c20', '31');
INSERT INTO `rms_role_permission` VALUES ('85', '8d17e9ae-778c-4489-b3e6-69990a226c20', '32');
INSERT INTO `rms_role_permission` VALUES ('86', '8d17e9ae-778c-4489-b3e6-69990a226c20', '38');
INSERT INTO `rms_role_permission` VALUES ('87', '8d17e9ae-778c-4489-b3e6-69990a226c20', '40');
INSERT INTO `rms_role_permission` VALUES ('88', '8d17e9ae-778c-4489-b3e6-69990a226c20', '39');
INSERT INTO `rms_role_permission` VALUES ('89', '8d17e9ae-778c-4489-b3e6-69990a226c20', '37');
INSERT INTO `rms_role_permission` VALUES ('90', '8d17e9ae-778c-4489-b3e6-69990a226c20', '41');
INSERT INTO `rms_role_permission` VALUES ('91', '8d17e9ae-778c-4489-b3e6-69990a226c20', '44');
INSERT INTO `rms_role_permission` VALUES ('92', '8d17e9ae-778c-4489-b3e6-69990a226c20', '43');
INSERT INTO `rms_role_permission` VALUES ('93', '8d17e9ae-778c-4489-b3e6-69990a226c20', '42');
INSERT INTO `rms_role_permission` VALUES ('94', '8d17e9ae-778c-4489-b3e6-69990a226c20', '52');
INSERT INTO `rms_role_permission` VALUES ('95', '8d17e9ae-778c-4489-b3e6-69990a226c20', '49');
INSERT INTO `rms_role_permission` VALUES ('96', '8d17e9ae-778c-4489-b3e6-69990a226c20', '51');
INSERT INTO `rms_role_permission` VALUES ('97', '8d17e9ae-778c-4489-b3e6-69990a226c20', '50');
INSERT INTO `rms_role_permission` VALUES ('98', '8d17e9ae-778c-4489-b3e6-69990a226c20', '47');
INSERT INTO `rms_role_permission` VALUES ('99', '8d17e9ae-778c-4489-b3e6-69990a226c20', '48');
INSERT INTO `rms_role_permission` VALUES ('100', '8d17e9ae-778c-4489-b3e6-69990a226c20', '46');
INSERT INTO `rms_role_permission` VALUES ('101', '8d17e9ae-778c-4489-b3e6-69990a226c20', '45');
INSERT INTO `rms_role_permission` VALUES ('102', '54948978-f463-4cf8-9578-f120e253dd05', '1');
INSERT INTO `rms_role_permission` VALUES ('103', '54948978-f463-4cf8-9578-f120e253dd05', '2');
INSERT INTO `rms_role_permission` VALUES ('104', '54948978-f463-4cf8-9578-f120e253dd05', '14');
INSERT INTO `rms_role_permission` VALUES ('105', '54948978-f463-4cf8-9578-f120e253dd05', '17');
INSERT INTO `rms_role_permission` VALUES ('106', '54948978-f463-4cf8-9578-f120e253dd05', '9');
INSERT INTO `rms_role_permission` VALUES ('107', '54948978-f463-4cf8-9578-f120e253dd05', '10');
INSERT INTO `rms_role_permission` VALUES ('108', '54948978-f463-4cf8-9578-f120e253dd05', '11');
INSERT INTO `rms_role_permission` VALUES ('109', '54948978-f463-4cf8-9578-f120e253dd05', '12');
INSERT INTO `rms_role_permission` VALUES ('110', '54948978-f463-4cf8-9578-f120e253dd05', '13');
INSERT INTO `rms_role_permission` VALUES ('111', '54948978-f463-4cf8-9578-f120e253dd05', '15');
INSERT INTO `rms_role_permission` VALUES ('112', '54948978-f463-4cf8-9578-f120e253dd05', '16');
INSERT INTO `rms_role_permission` VALUES ('113', '54948978-f463-4cf8-9578-f120e253dd05', '22');
INSERT INTO `rms_role_permission` VALUES ('114', '54948978-f463-4cf8-9578-f120e253dd05', '23');
INSERT INTO `rms_role_permission` VALUES ('115', '54948978-f463-4cf8-9578-f120e253dd05', '24');
INSERT INTO `rms_role_permission` VALUES ('116', '54948978-f463-4cf8-9578-f120e253dd05', '4');
INSERT INTO `rms_role_permission` VALUES ('117', '54948978-f463-4cf8-9578-f120e253dd05', '25');
INSERT INTO `rms_role_permission` VALUES ('118', '54948978-f463-4cf8-9578-f120e253dd05', '27');
INSERT INTO `rms_role_permission` VALUES ('119', '54948978-f463-4cf8-9578-f120e253dd05', '28');
INSERT INTO `rms_role_permission` VALUES ('120', '54948978-f463-4cf8-9578-f120e253dd05', '26');
INSERT INTO `rms_role_permission` VALUES ('121', '54948978-f463-4cf8-9578-f120e253dd05', '20');
INSERT INTO `rms_role_permission` VALUES ('122', '54948978-f463-4cf8-9578-f120e253dd05', '18');
INSERT INTO `rms_role_permission` VALUES ('123', '54948978-f463-4cf8-9578-f120e253dd05', '19');
INSERT INTO `rms_role_permission` VALUES ('124', '54948978-f463-4cf8-9578-f120e253dd05', '21');
INSERT INTO `rms_role_permission` VALUES ('125', '54948978-f463-4cf8-9578-f120e253dd05', '35');
INSERT INTO `rms_role_permission` VALUES ('126', '54948978-f463-4cf8-9578-f120e253dd05', '34');
INSERT INTO `rms_role_permission` VALUES ('127', '54948978-f463-4cf8-9578-f120e253dd05', '36');
INSERT INTO `rms_role_permission` VALUES ('128', '54948978-f463-4cf8-9578-f120e253dd05', '33');
INSERT INTO `rms_role_permission` VALUES ('129', '54948978-f463-4cf8-9578-f120e253dd05', '29');
INSERT INTO `rms_role_permission` VALUES ('130', '54948978-f463-4cf8-9578-f120e253dd05', '30');
INSERT INTO `rms_role_permission` VALUES ('131', '54948978-f463-4cf8-9578-f120e253dd05', '31');
INSERT INTO `rms_role_permission` VALUES ('132', '54948978-f463-4cf8-9578-f120e253dd05', '32');
INSERT INTO `rms_role_permission` VALUES ('133', '54948978-f463-4cf8-9578-f120e253dd05', '38');
INSERT INTO `rms_role_permission` VALUES ('134', '54948978-f463-4cf8-9578-f120e253dd05', '40');
INSERT INTO `rms_role_permission` VALUES ('135', '54948978-f463-4cf8-9578-f120e253dd05', '39');
INSERT INTO `rms_role_permission` VALUES ('136', '54948978-f463-4cf8-9578-f120e253dd05', '37');
INSERT INTO `rms_role_permission` VALUES ('137', '54948978-f463-4cf8-9578-f120e253dd05', '41');
INSERT INTO `rms_role_permission` VALUES ('138', '54948978-f463-4cf8-9578-f120e253dd05', '44');
INSERT INTO `rms_role_permission` VALUES ('139', '54948978-f463-4cf8-9578-f120e253dd05', '43');
INSERT INTO `rms_role_permission` VALUES ('140', '54948978-f463-4cf8-9578-f120e253dd05', '42');
INSERT INTO `rms_role_permission` VALUES ('141', '54948978-f463-4cf8-9578-f120e253dd05', '52');
INSERT INTO `rms_role_permission` VALUES ('142', '54948978-f463-4cf8-9578-f120e253dd05', '49');
INSERT INTO `rms_role_permission` VALUES ('143', '54948978-f463-4cf8-9578-f120e253dd05', '51');
INSERT INTO `rms_role_permission` VALUES ('144', '54948978-f463-4cf8-9578-f120e253dd05', '50');
INSERT INTO `rms_role_permission` VALUES ('145', '54948978-f463-4cf8-9578-f120e253dd05', '47');
INSERT INTO `rms_role_permission` VALUES ('146', '54948978-f463-4cf8-9578-f120e253dd05', '48');
INSERT INTO `rms_role_permission` VALUES ('147', '54948978-f463-4cf8-9578-f120e253dd05', '46');
INSERT INTO `rms_role_permission` VALUES ('148', '54948978-f463-4cf8-9578-f120e253dd05', '45');

-- ----------------------------
-- Table structure for rms_user
-- ----------------------------
DROP TABLE IF EXISTS `rms_user`;
CREATE TABLE `rms_user` (
  `id` varchar(36) NOT NULL COMMENT '主键',
  `companyid` int(11) DEFAULT NULL COMMENT '公司id',
  `departmentid` int(11) DEFAULT NULL COMMENT '部门主键',
  `loginname` varchar(30) DEFAULT NULL COMMENT '登录名',
  `truename` varchar(20) DEFAULT NULL COMMENT '姓名',
  `password` varchar(40) DEFAULT NULL COMMENT '密码',
  `createtime` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '添加时间',
  `modifytime` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '修改时间',
  `usertype` int(11) DEFAULT NULL COMMENT '用户类型',
  `phone` varchar(20) DEFAULT NULL COMMENT '电话',
  `del_flag` tinyint(4) DEFAULT NULL COMMENT '是否删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='rms_user系统用户';

-- ----------------------------
-- Records of rms_user
-- ----------------------------
INSERT INTO `rms_user` VALUES ('8ab63adb-2bb6-468f-84ad-df71221262e5', '1', '1', 'admin', '1', '123456', '1970-01-01 08:00:01', '1970-01-01 08:00:01', '0', '0', '0');
INSERT INTO `rms_user` VALUES ('9022a59a-dec3-4cd0-ba0e-ec23dbf8b2ad', '1', '1', 'lulu', '小风', '123456', '2018-10-25 21:55:06', '2018-10-25 21:55:06', '0', null, '0');

-- ----------------------------
-- Table structure for rms_userrole
-- ----------------------------
DROP TABLE IF EXISTS `rms_userrole`;
CREATE TABLE `rms_userrole` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` varchar(36) DEFAULT NULL COMMENT '用户的Id',
  `roleid` varchar(36) DEFAULT NULL COMMENT '角色的Id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='rms_userrole用户所属角色表';

-- ----------------------------
-- Records of rms_userrole
-- ----------------------------
INSERT INTO `rms_userrole` VALUES ('1', '8ab63adb-2bb6-468f-84ad-df71221262e5', '8d17e9ae-778c-4489-b3e6-69990a226c20');
INSERT INTO `rms_userrole` VALUES ('2', '9022a59a-dec3-4cd0-ba0e-ec23dbf8b2ad', '54948978-f463-4cf8-9578-f120e253dd05');

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
  `createtime` datetime DEFAULT NULL COMMENT '添加时间',
  `createman` varchar(30) DEFAULT NULL COMMENT '添加人',
  `del_flag` tinyint(4) DEFAULT NULL COMMENT '是否删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='sysitem  系统数据字典表';

-- ----------------------------
-- Records of sysitem
-- ----------------------------
INSERT INTO `sysitem` VALUES ('1', 'RoleTypes', '1', '管理员', null, null, null, null, null, '0');
INSERT INTO `sysitem` VALUES ('2', 'RoleTypes', '0', 'app用户', null, null, null, null, null, '0');

-- ----------------------------
-- Table structure for sys_dictionary
-- ----------------------------
DROP TABLE IF EXISTS `sys_dictionary`;
CREATE TABLE `sys_dictionary` (
  `dicid` int(11) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dictypeid` int(11) DEFAULT NULL COMMENT '字典组（类型）',
  `parentid` int(11) DEFAULT NULL COMMENT '上级Id',
  `dicname` varchar(30) DEFAULT NULL COMMENT '字典名称',
  `dicno` varchar(20) DEFAULT NULL COMMENT '字典类型编号',
  `icon` varchar(200) DEFAULT NULL COMMENT '图标',
  `remarks` varchar(100) DEFAULT NULL COMMENT '备注',
  `orderid` int(11) DEFAULT NULL COMMENT '排序号',
  `createtime` datetime DEFAULT NULL COMMENT '添加时间',
  `del_flag` tinyint(4) DEFAULT NULL COMMENT '是否删除',
  PRIMARY KEY (`dicid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='sys_dictionary 字典值表';

-- ----------------------------
-- Records of sys_dictionary
-- ----------------------------
INSERT INTO `sys_dictionary` VALUES ('1', '1', '0', 'ios 老人通', '2', 'icon-bullet_shape', '41212', '5', '2018-10-25 21:57:51', '0');

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
  `createtime` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '添加时间',
  `del_flag` tinyint(4) DEFAULT NULL COMMENT '是否删除',
  PRIMARY KEY (`dictypeid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='sys_dictype 字典定义表';

-- ----------------------------
-- Records of sys_dictype
-- ----------------------------
INSERT INTO `sys_dictype` VALUES ('1', 'app类型', '01', 'icon-brick', '2', '3', '2018-10-25 21:55:33', '0');

-- ----------------------------
-- Table structure for sys_files
-- ----------------------------
DROP TABLE IF EXISTS `sys_files`;
CREATE TABLE `sys_files` (
  `fileid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `toid` varchar(40) DEFAULT NULL COMMENT '所禹对象Id',
  `showname` varchar(100) DEFAULT NULL COMMENT '显示名称',
  `filename` varchar(150) DEFAULT NULL COMMENT '文件名',
  `sourcetable` varchar(20) DEFAULT NULL COMMENT '来源表（某个数据表）',
  `relativepath` varchar(200) DEFAULT NULL COMMENT '相对路径',
  `route` varchar(100) DEFAULT NULL COMMENT '路由',
  `suffix` varchar(10) DEFAULT NULL COMMENT '后缀名',
  `filetype` varchar(20) DEFAULT NULL COMMENT '文件属性类型（中文）',
  `addtime` datetime DEFAULT NULL COMMENT '添加时间',
  `del_flag` tinyint(4) DEFAULT NULL COMMENT '是否删除',
  PRIMARY KEY (`fileid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='sys_files 文件';

-- ----------------------------
-- Records of sys_files
-- ----------------------------

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `oname` varchar(20) DEFAULT NULL COMMENT '操作名称',
  `ocontent` varchar(30) DEFAULT NULL COMMENT '操作内容',
  `url` varchar(100) DEFAULT NULL COMMENT '操作地址',
  `people_id` varchar(36) DEFAULT NULL COMMENT '操人id',
  `people_name` varchar(10) DEFAULT NULL COMMENT '操作人名称',
  `permission` varchar(20) DEFAULT NULL COMMENT '操作权限',
  `ip` varchar(20) DEFAULT NULL COMMENT 'ip',
  `createtime` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '添加时间',
  `del_flag` tinyint(4) DEFAULT NULL COMMENT '是否删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='sys_log操作日志';

-- ----------------------------
-- Records of sys_log
-- ----------------------------

-- ----------------------------
-- View structure for v_permission
-- ----------------------------
DROP VIEW IF EXISTS `v_permission`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_permission` AS select `rms_permission`.`id` AS `id`,`rms_permission`.`parentid` AS `parentid`,`rms_permission`.`orderno` AS `orderno`,`rms_permission`.`pname` AS `pname`,`rms_permission`.`typeid` AS `typeid`,`rms_permission`.`url` AS `url`,`rms_permission`.`pcode` AS `pcode`,`rms_permission`.`icon` AS `icon`,`rms_permission`.`color` AS `color`,`rms_permission`.`createtime` AS `createtime`,`rms_permission`.`modifytime` AS `modifytime`,`rms_permission`.`del_flag` AS `del_flag`,`rms_permission`.`show_flag` AS `show_flag`,`rms_permission`.`companyid` AS `companyid`,`rms_permission`.`projectid` AS `projectid`,`rms_permission`.`remarks` AS `remarks`,`rms_project`.`name` AS `projectname` from (`rms_permission` left join `rms_project` on((`rms_permission`.`projectid` = `rms_project`.`id`))) ;

-- ----------------------------
-- View structure for v_project
-- ----------------------------
DROP VIEW IF EXISTS `v_project`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_project` AS select `rms_project`.`id` AS `id`,`rms_project`.`companyid` AS `companyid`,`rms_project`.`keyid` AS `keyid`,`rms_project`.`name` AS `name`,`rms_project`.`remarks` AS `remarks`,`rms_project`.`createtime` AS `createtime`,`rms_project`.`modifytime` AS `modifytime`,`rms_project`.`del_flag` AS `del_flag`,`rms_company`.`name` AS `companyname` from (`rms_project` left join `rms_company` on((`rms_project`.`companyid` = `rms_company`.`id`))) ;

-- ----------------------------
-- View structure for v_role
-- ----------------------------
DROP VIEW IF EXISTS `v_role`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_role` AS select `rms_role`.`id` AS `id`,`rms_role`.`companyid` AS `companyid`,`rms_role`.`projectid` AS `projectid`,`rms_role`.`rolename` AS `rolename`,`rms_role`.`remarks` AS `remarks`,`rms_role`.`createby` AS `createby`,`rms_role`.`modifyby` AS `modifyby`,`rms_role`.`createtime` AS `createtime`,`rms_role`.`modifytime` AS `modifytime`,`rms_role`.`roletypes` AS `roletypes`,`rms_role`.`jurisdiction` AS `jurisdiction`,`rms_role`.`del_flag` AS `del_flag`,`sysitem`.`itemname` AS `roletypesname`,`rms_project`.`name` AS `projectname` from ((`rms_role` left join `sysitem` on((`rms_role`.`roletypes` = `sysitem`.`itemvalue`))) left join `rms_project` on((`rms_role`.`projectid` = `rms_project`.`id`))) where (`sysitem`.`itemtype` = 'RoleTypes') ;

-- ----------------------------
-- View structure for v_role_permission
-- ----------------------------
DROP VIEW IF EXISTS `v_role_permission`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_role_permission` AS select `rms_permission`.`id` AS `id`,`rms_permission`.`parentid` AS `parentid`,`rms_permission`.`orderno` AS `orderno`,`rms_permission`.`pname` AS `pname`,`rms_permission`.`typeid` AS `typeid`,`rms_permission`.`url` AS `url`,`rms_permission`.`pcode` AS `pcode`,`rms_permission`.`icon` AS `icon`,`rms_permission`.`color` AS `color`,`rms_permission`.`del_flag` AS `del_flag`,`rms_permission`.`show_flag` AS `show_flag`,`rms_permission`.`remarks` AS `remarks`,`rms_role_permission`.`roleid` AS `roleid` from (`rms_permission` join `rms_role_permission` on((`rms_permission`.`id` = `rms_role_permission`.`permissionid`))) ;

-- ----------------------------
-- View structure for v_user_role
-- ----------------------------
DROP VIEW IF EXISTS `v_user_role`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_user_role` AS select `rms_userrole`.`roleid` AS `roleid`,`v_role`.`rolename` AS `rolename`,`rms_department`.`name` AS `departmentname`,`rms_company`.`name` AS `companyname`,`v_role`.`projectname` AS `projectname`,`rms_user`.`id` AS `id`,`rms_user`.`companyid` AS `companyid`,`rms_user`.`departmentid` AS `departmentid`,`rms_user`.`loginname` AS `loginname`,`rms_user`.`truename` AS `truename`,`rms_user`.`password` AS `password`,`rms_user`.`createtime` AS `createtime`,`rms_user`.`modifytime` AS `modifytime`,`rms_user`.`usertype` AS `usertype`,`rms_user`.`phone` AS `phone`,`rms_user`.`del_flag` AS `del_flag`,`v_role`.`jurisdiction` AS `jurisdiction` from ((((`rms_user` left join `rms_company` on((`rms_user`.`companyid` = `rms_company`.`id`))) left join `rms_department` on((`rms_user`.`departmentid` = `rms_department`.`id`))) left join `rms_userrole` on((`rms_user`.`id` = `rms_userrole`.`userid`))) left join `v_role` on((`rms_userrole`.`roleid` = `v_role`.`id`))) ;
