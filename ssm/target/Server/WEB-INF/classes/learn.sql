/*
Navicat MySQL Data Transfer

Source Server         : centos
Source Server Version : 50720
Source Host           : 192.168.75.137:3306
Source Database       : learn

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2017-11-26 22:29:00
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `message`
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(256) NOT NULL,
  `content` varchar(1024) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES ('15', 'somebody', 'asdfasdf');
INSERT INTO `message` VALUES ('16', 'somebody', 'asdfasfsad');
INSERT INTO `message` VALUES ('17', 'somebody', 'asdfasdf');
INSERT INTO `message` VALUES ('18', 'somebody', 'asfasfssdf');
INSERT INTO `message` VALUES ('19', 'somebody', 'asdfasdf');
INSERT INTO `message` VALUES ('20', 'somebody', 'asfdasdfasdf');
INSERT INTO `message` VALUES ('22', 'somebody', 'asdfasfd');
INSERT INTO `message` VALUES ('23', 'somebody', 'asdfasdf');
INSERT INTO `message` VALUES ('24', 'qxk', 'fasdfsadf');
INSERT INTO `message` VALUES ('25', 'qxk', 'asdfasdfasdfasdfasdfsadfasdfasdfasdfasdfasdfasdfasdfasfdasdfasdfasdfasd');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  `password` varchar(1024) NOT NULL,
  `age` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'qxk', 'bankaifuck', '24');
