/*
Navicat MySQL Data Transfer

Source Server         : hulitong
Source Server Version : 80012
Source Host           : localhost:3306
Source Database       : maque

Target Server Type    : MYSQL
Target Server Version : 80012
File Encoding         : 65001

Date: 2019-10-24 20:53:21
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for mq_role
-- ----------------------------
DROP TABLE IF EXISTS `mq_role`;
CREATE TABLE `mq_role` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `rolename` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `rolenote` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `orderlist` int(1) DEFAULT '1' COMMENT '排序',
  `create_time` int(20) DEFAULT '0' COMMENT '创建时间',
  `update_time` int(20) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mq_role
-- ----------------------------
INSERT INTO `mq_role` VALUES ('1', '超级管理员', '老大哥，大BOSS', '1', '0', '0');
INSERT INTO `mq_role` VALUES ('2', '产品管理员', '对产品的上架、下架，以及商品的属性的修改', '1', '0', '0');
INSERT INTO `mq_role` VALUES ('3', '文章管理员', '内部邮件、提示信息、自己文章的发布，修改等权限', '1', '0', '0');
INSERT INTO `mq_role` VALUES ('4', '普通管理员', '基本维护', '1', '0', '0');

-- ----------------------------
-- Table structure for mq_roots
-- ----------------------------
DROP TABLE IF EXISTS `mq_roots`;
CREATE TABLE `mq_roots` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL DEFAULT '',
  `pwd` varchar(50) NOT NULL DEFAULT '',
  `nicename` varchar(10) NOT NULL DEFAULT '',
  `email` varchar(50) NOT NULL DEFAULT '',
  `tel` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'tel',
  `img` varchar(200) NOT NULL DEFAULT '',
  `admin_level` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `last_login_ip` varchar(200) NOT NULL DEFAULT '',
  `last_login_time` int(30) unsigned NOT NULL DEFAULT '0',
  `listorder` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `email` (`email`),
  KEY `iphone_tel` (`tel`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mq_roots
-- ----------------------------
INSERT INTO `mq_roots` VALUES ('13', 'hulitong', '112233hu', '胡萝卜你好', '785022207@qq.com', '17647360621', '', '0', '127.0.0.1', '1571204905', '0', '1', '1571204905', '0');
INSERT INTO `mq_roots` VALUES ('14', 'hlt', 'root', 'helloword', '2017885582@qq.com', '13333333333', '', '0', '127.0.0.1', '1571205013', '0', '0', '1571205013', '0');
INSERT INTO `mq_roots` VALUES ('15', 'test', 'admin', '测试账号', '222@aliyun.com', '13333333333', '', '0', '127.0.0.1', '1571205108', '0', '0', '1571205108', '0');
INSERT INTO `mq_roots` VALUES ('17', 'qqqq', 'qqqqqq', 'qqqqq', '785022207@qq.com', '17647360621', '', '0', '127.0.0.1', '1571208351', '0', '0', '1571208351', '1571208351');
INSERT INTO `mq_roots` VALUES ('18', 'lihui', 'ad', 'helloworld', '785022207@qq.com', '17647360621', '', '0', '127.0.0.1', '1571208782', '0', '0', '1571208782', '1571208782');
INSERT INTO `mq_roots` VALUES ('19', 'admin', 'asd', 'asd', '785022207@qq.com', '17647360621', '', '0', '127.0.0.1', '1571208931', '0', '0', '1571208931', '0');
INSERT INTO `mq_roots` VALUES ('20', 'home', 'asd', 'asd', 'asd@qq.com', '1333333333', '', '0', '127.0.0.1', '1571215682', '0', '0', '0', '0');
