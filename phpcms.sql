/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50540
Source Host           : localhost:3306
Source Database       : phpcms

Target Server Type    : MYSQL
Target Server Version : 50540
File Encoding         : 65001

Date: 2015-06-16 15:08:18
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `hc_admin`
-- ----------------------------
DROP TABLE IF EXISTS `hc_admin`;
CREATE TABLE `hc_admin` (
  `userid` mediumint(6) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `roleid` smallint(5) DEFAULT '0',
  `encrypt` varchar(6) DEFAULT NULL,
  `lastloginip` varchar(15) DEFAULT NULL,
  `lastlogintime` int(10) unsigned DEFAULT '0',
  `email` varchar(40) DEFAULT NULL,
  `realname` varchar(50) NOT NULL DEFAULT '',
  `card` varchar(255) NOT NULL,
  `lang` varchar(6) NOT NULL,
  PRIMARY KEY (`userid`),
  KEY `username` (`username`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hc_admin
-- ----------------------------
INSERT INTO `hc_admin` VALUES ('1', 'admin', '4fd4bf489527bb06ed821d66bdcf5626', '1', '8dmgi7', '127.0.0.1', '1434416518', 'system@hucai.com', '管理员', '', 'zh-cn');

-- ----------------------------
-- Table structure for `hc_admin_panel`
-- ----------------------------
DROP TABLE IF EXISTS `hc_admin_panel`;
CREATE TABLE `hc_admin_panel` (
  `menuid` mediumint(8) unsigned NOT NULL,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `name` char(32) DEFAULT NULL,
  `url` char(255) DEFAULT NULL,
  `datetime` int(10) unsigned DEFAULT '0',
  UNIQUE KEY `userid` (`menuid`,`userid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hc_admin_panel
-- ----------------------------

-- ----------------------------
-- Table structure for `hc_admin_role`
-- ----------------------------
DROP TABLE IF EXISTS `hc_admin_role`;
CREATE TABLE `hc_admin_role` (
  `roleid` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `rolename` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`roleid`),
  KEY `listorder` (`listorder`) USING BTREE,
  KEY `disabled` (`disabled`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hc_admin_role
-- ----------------------------
INSERT INTO `hc_admin_role` VALUES ('1', '超级管理员', '超级管理员', '0', '0');
INSERT INTO `hc_admin_role` VALUES ('2', '站点管理员', '站点管理员', '0', '0');
INSERT INTO `hc_admin_role` VALUES ('3', '运营总监', '运营总监', '1', '0');
INSERT INTO `hc_admin_role` VALUES ('4', '总编', '总编', '5', '0');
INSERT INTO `hc_admin_role` VALUES ('5', '编辑', '编辑', '1', '0');
INSERT INTO `hc_admin_role` VALUES ('7', '发布人员', '发布人员', '0', '0');

-- ----------------------------
-- Table structure for `hc_admin_role_priv`
-- ----------------------------
DROP TABLE IF EXISTS `hc_admin_role_priv`;
CREATE TABLE `hc_admin_role_priv` (
  `roleid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `m` char(20) NOT NULL,
  `c` char(20) NOT NULL,
  `a` char(20) NOT NULL,
  `data` char(30) NOT NULL DEFAULT '',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  KEY `roleid` (`roleid`,`m`,`c`,`a`,`siteid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hc_admin_role_priv
-- ----------------------------

-- ----------------------------
-- Table structure for `hc_announce`
-- ----------------------------
DROP TABLE IF EXISTS `hc_announce`;
CREATE TABLE `hc_announce` (
  `aid` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `title` char(80) NOT NULL,
  `content` text NOT NULL,
  `starttime` date NOT NULL DEFAULT '0000-00-00',
  `endtime` date NOT NULL DEFAULT '0000-00-00',
  `username` varchar(40) NOT NULL,
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  `hits` smallint(5) unsigned NOT NULL DEFAULT '0',
  `passed` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `style` char(15) NOT NULL,
  `show_template` char(30) NOT NULL,
  PRIMARY KEY (`aid`),
  KEY `siteid` (`siteid`,`passed`,`endtime`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hc_announce
-- ----------------------------

-- ----------------------------
-- Table structure for `hc_attachment`
-- ----------------------------
DROP TABLE IF EXISTS `hc_attachment`;
CREATE TABLE `hc_attachment` (
  `aid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `module` char(15) NOT NULL,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `filename` char(50) NOT NULL,
  `filepath` char(200) NOT NULL,
  `filesize` int(10) unsigned NOT NULL DEFAULT '0',
  `fileext` char(10) NOT NULL,
  `isimage` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isthumb` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `downloads` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `uploadtime` int(10) unsigned NOT NULL DEFAULT '0',
  `uploadip` char(15) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `authcode` char(32) NOT NULL,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`aid`),
  KEY `authcode` (`authcode`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hc_attachment
-- ----------------------------
INSERT INTO `hc_attachment` VALUES ('1', 'content', '0', 'logo_1.gif', '2015/0518/20150518060958983.gif', '2322', 'gif', '1', '0', '0', '1', '1431943798', '127.0.0.1', '1', '331635072e84bc9274dd28750bc95da3', '1');
INSERT INTO `hc_attachment` VALUES ('2', 'content', '6', 'baa.jpg', '2015/0518/20150518061333552.jpg', '93574', 'jpg', '1', '0', '0', '1', '1431944013', '127.0.0.1', '1', '98d3fb2078331b93c7d07126725ff1ac', '1');
INSERT INTO `hc_attachment` VALUES ('3', 'content', '0', 'logo_1.gif', '2015/0518/20150518062118493.gif', '2322', 'gif', '1', '0', '0', '1', '1431944478', '127.0.0.1', '1', 'c12bcc2a136aa5589438c38f4618959f', '1');
INSERT INTO `hc_attachment` VALUES ('4', 'content', '9', 'QQ图片20150512093510.png', '2015/0518/20150518062248914.png', '8631', 'png', '1', '0', '0', '1', '1431944568', '127.0.0.1', '1', '330ddc3bb546b6bf562ed9593b2889f2', '1');
INSERT INTO `hc_attachment` VALUES ('5', 'poster', '0', '1.jpg', '2015/0611/20150611110020522.jpg', '454620', 'jpg', '1', '0', '0', '1', '1433991620', '127.0.0.1', '1', 'a3c7799f91d41d4991e3f4242ddb0a71', '1');
INSERT INTO `hc_attachment` VALUES ('6', 'poster', '0', '1.jpg', '2015/0611/20150611110121162.jpg', '454620', 'jpg', '1', '0', '0', '1', '1433991681', '127.0.0.1', '1', 'fc7d4350dce3224c293cc137492ba69b', '1');
INSERT INTO `hc_attachment` VALUES ('8', 'content', '7', '6.jpg', '2015/0611/20150611043845537.jpg', '47616', 'jpg', '1', '0', '0', '1', '1434011925', '127.0.0.1', '1', 'ab793ce48626346e0cdb09125355a8ec', '1');
INSERT INTO `hc_attachment` VALUES ('9', 'content', '7', '7.jpg', '2015/0611/20150611050555181.jpg', '50066', 'jpg', '1', '0', '0', '1', '1434013555', '127.0.0.1', '1', 'd0e29b64c727f96454449a737d1b360d', '1');
INSERT INTO `hc_attachment` VALUES ('10', 'content', '7', '8.jpg', '2015/0611/20150611050611392.jpg', '51222', 'jpg', '1', '0', '0', '1', '1434013571', '127.0.0.1', '1', '80540df2f0cce380f9f3428982df36e6', '1');
INSERT INTO `hc_attachment` VALUES ('11', 'content', '64', '3.jpg', '2015/0612/20150612043238409.jpg', '26634', 'jpg', '1', '0', '0', '1', '1434097958', '127.0.0.1', '1', '379a757ea38c03b75961edf055750529', '1');
INSERT INTO `hc_attachment` VALUES ('12', 'content', '6', 'brand_06.jpg', '2015/0613/20150613010313340.jpg', '30432', 'jpg', '1', '0', '0', '1', '1434171793', '127.0.0.1', '1', '1b9b4fbce085b73bc02ea06131a155d4', '1');
INSERT INTO `hc_attachment` VALUES ('13', 'content', '6', 'brand_11.jpg', '2015/0613/20150613010502189.jpg', '29148', 'jpg', '1', '0', '0', '1', '1434171901', '127.0.0.1', '1', 'd305ff6e123cf9f7417e271907c92b7e', '1');
INSERT INTO `hc_attachment` VALUES ('14', 'content', '6', 'brand_03.jpg', '2015/0613/20150613010523851.jpg', '27146', 'jpg', '1', '0', '0', '1', '1434171923', '127.0.0.1', '1', '8f8941b742706c93bf4380e209360a08', '1');
INSERT INTO `hc_attachment` VALUES ('15', 'content', '0', '20150613021909294.jpg', '2015/0613/20150613021909294.jpg', '24609', 'jpg', '1', '0', '0', '0', '1434176349', '127.0.0.1', '1', 'd1470184aecb9cab896eb6c2af820221', '1');
INSERT INTO `hc_attachment` VALUES ('16', 'content', '3', 'solutions_03.jpg', '2015/0613/20150613024424990.jpg', '18694', 'jpg', '1', '0', '0', '1', '1434177864', '127.0.0.1', '1', '63c4f57784b719611fd157682c059a53', '1');
INSERT INTO `hc_attachment` VALUES ('17', 'content', '3', 'solutions_06.jpg', '2015/0613/20150613025404988.jpg', '56469', 'jpg', '1', '0', '0', '1', '1434178444', '127.0.0.1', '1', 'abf4abaa081269a76519f9b8e4ab44a2', '1');
INSERT INTO `hc_attachment` VALUES ('18', 'content', '4', 'custom_07.jpg', '2015/0613/20150613030234452.jpg', '11256', 'jpg', '1', '0', '0', '1', '1434178954', '127.0.0.1', '1', '347f76dbf1640b55a4f2000305aefd88', '1');
INSERT INTO `hc_attachment` VALUES ('19', 'content', '4', 'custom_03.jpg', '2015/0613/20150613030345997.jpg', '11225', 'jpg', '1', '0', '0', '1', '1434179025', '127.0.0.1', '1', '9d8f3808fee27297726ace3ddb286055', '1');
INSERT INTO `hc_attachment` VALUES ('20', 'content', '4', 'custom_08.jpg', '2015/0613/20150613030506932.jpg', '9691', 'jpg', '1', '0', '0', '1', '1434179106', '127.0.0.1', '1', '879382680bd139e9146d3dca0f6068df', '1');
INSERT INTO `hc_attachment` VALUES ('21', 'content', '7', 's1.jpg', '2015/0613/20150613042333263.jpg', '198081', 'jpg', '1', '0', '0', '1', '1434183813', '127.0.0.1', '1', 'feb69230fa2bb490df3a1a3716fe7374', '1');
INSERT INTO `hc_attachment` VALUES ('22', 'content', '7', 's1.jpg', '2015/0613/20150613042447930.jpg', '198081', 'jpg', '1', '0', '0', '1', '1434183887', '127.0.0.1', '1', '4ce1eae1a93bb3278ac8004016958c82', '1');
INSERT INTO `hc_attachment` VALUES ('23', 'content', '8', 'news_11.jpg', '2015/0613/20150613052418529.jpg', '14737', 'jpg', '1', '0', '0', '1', '1434187458', '127.0.0.1', '1', 'fee32b8a4f9990af5cb79909f111bc69', '1');
INSERT INTO `hc_attachment` VALUES ('24', 'content', '8', 'news_14.jpg', '2015/0613/20150613052449648.jpg', '21928', 'jpg', '1', '0', '0', '1', '1434187489', '127.0.0.1', '1', '0194c602ca53588d4861dfdc1928abca', '1');
INSERT INTO `hc_attachment` VALUES ('25', 'content', '65', 'custom_03.jpg.zip', '2015/0614/20150614080038867.zip', '11033', 'zip', '0', '0', '0', '1', '1434283238', '127.0.0.1', '1', '78d926cca918833cbacafef3953e740b', '1');
INSERT INTO `hc_attachment` VALUES ('26', 'content', '65', 'custom_03.jpg.zip', '2015/0614/20150614080111305.zip', '11033', 'zip', '0', '0', '0', '1', '1434283270', '127.0.0.1', '1', '61d09daeb6812fb68c609c4b461dd5f8', '1');
INSERT INTO `hc_attachment` VALUES ('27', 'content', '65', 'custom_03.jpg.zip', '2015/0614/20150614082316938.zip', '11033', 'zip', '0', '0', '0', '1', '1434284596', '127.0.0.1', '1', '74f9bd347b3374a30517502485cb8cfe', '1');
INSERT INTO `hc_attachment` VALUES ('28', 'content', '65', 'custom_03.jpg.zip', '2015/0614/20150614082437268.zip', '11033', 'zip', '0', '0', '0', '1', '1434284677', '127.0.0.1', '1', '452813971cb81c7a87501572fc2b7816', '1');
INSERT INTO `hc_attachment` VALUES ('29', 'content', '65', 'custom_03.jpg.zip', '2015/0614/20150614082446226.zip', '11033', 'zip', '0', '0', '0', '1', '1434284686', '127.0.0.1', '1', '5e47645e63fefb14cf80689edeff7591', '1');
INSERT INTO `hc_attachment` VALUES ('30', 'content', '9', 'news_16.jpg', '2015/0615/20150615082737236.jpg', '47840', 'jpg', '1', '0', '0', '1', '1434328057', '127.0.0.1', '1', 'a2be11b0128c5f75784950deda79e63d', '1');
INSERT INTO `hc_attachment` VALUES ('31', 'content', '9', 'news_18.jpg', '2015/0615/20150615082804336.jpg', '42239', 'jpg', '1', '0', '0', '1', '1434328084', '127.0.0.1', '1', '88a46ce9610c018f3177f284a9a5bc6c', '1');
INSERT INTO `hc_attachment` VALUES ('32', 'content', '9', 'news_18.jpg', '2015/0615/20150615082830853.jpg', '42239', 'jpg', '1', '0', '0', '1', '1434328110', '127.0.0.1', '1', '2593801427d7d3f422e5cb1153d1280a', '1');
INSERT INTO `hc_attachment` VALUES ('33', 'content', '9', 'news_22.jpg', '2015/0615/20150615082859170.jpg', '49379', 'jpg', '1', '0', '0', '1', '1434328139', '127.0.0.1', '1', 'a75bcab1e8a93cefdfa97bb01083f32a', '1');
INSERT INTO `hc_attachment` VALUES ('34', 'poster', '0', 'p02.jpg', '2015/0615/20150615015348920.jpg', '120683', 'jpg', '1', '0', '0', '1', '1434347628', '127.0.0.1', '1', '4f6aa2d425ac64ce164426d356ae59e8', '1');
INSERT INTO `hc_attachment` VALUES ('35', 'poster', '0', 'p02.jpg', '2015/0615/20150615015424501.jpg', '120683', 'jpg', '1', '0', '0', '1', '1434347664', '127.0.0.1', '1', '567f785c767cec91f74e5fb10878d2f5', '1');
INSERT INTO `hc_attachment` VALUES ('36', 'content', '16', 'products_05.jpg', '2015/0615/20150615050929543.jpg', '81387', 'jpg', '1', '0', '0', '1', '1434359367', '127.0.0.1', '1', 'aaaaf815b9c4fb7565e436dd04cdd1d4', '1');
INSERT INTO `hc_attachment` VALUES ('37', 'content', '16', 'products_info_03.jpg', '2015/0615/20150615051058576.jpg', '39563', 'jpg', '1', '0', '0', '1', '1434359457', '127.0.0.1', '1', '74755023be36f9d7b9613abf4435e838', '1');
INSERT INTO `hc_attachment` VALUES ('38', 'content', '16', 'products_info_06.jpg', '2015/0615/20150615051102951.jpg', '5558', 'jpg', '1', '0', '0', '1', '1434359460', '127.0.0.1', '1', '8f582ee589aa5cdf18537c50ed7cdeca', '1');
INSERT INTO `hc_attachment` VALUES ('39', 'content', '16', 'products_info_09.jpg', '2015/0615/20150615051105103.jpg', '6779', 'jpg', '1', '0', '0', '1', '1434359464', '127.0.0.1', '1', 'a25c95118f267d97b3e26d11169459b7', '1');
INSERT INTO `hc_attachment` VALUES ('40', 'content', '16', 'products_info_11.jpg', '2015/0615/20150615051109569.jpg', '5559', 'jpg', '1', '0', '0', '1', '1434359467', '127.0.0.1', '1', 'af2dffffeaa22a87cdf8d5d0d58d9b99', '1');
INSERT INTO `hc_attachment` VALUES ('41', 'content', '16', 'products_info_22.jpg', '2015/0615/20150615051113576.jpg', '134364', 'jpg', '1', '0', '0', '1', '1434359471', '127.0.0.1', '1', '57828854312349ebdc8105db8f44605e', '1');
INSERT INTO `hc_attachment` VALUES ('42', 'content', '16', 'products_info_26.jpg', '2015/0615/20150615051116768.jpg', '139274', 'jpg', '1', '0', '0', '1', '1434359475', '127.0.0.1', '1', '15e96ba7c6e9ee56c6325b09f01a45e4', '1');
INSERT INTO `hc_attachment` VALUES ('43', 'content', '16', 'products_info_28.jpg', '2015/0615/20150615051120206.jpg', '126395', 'jpg', '1', '0', '0', '1', '1434359478', '127.0.0.1', '1', 'bb3483aee3a82d5adb01d5c44598e419', '1');
INSERT INTO `hc_attachment` VALUES ('44', 'content', '19', 'products_07.jpg', '2015/0615/20150615052538965.jpg', '29286', 'jpg', '1', '0', '0', '1', '1434360338', '127.0.0.1', '1', '823f6edef8dd91c4cc92ad61a6f8c068', '1');
INSERT INTO `hc_attachment` VALUES ('45', 'content', '19', 'products_07.jpg', '2015/0615/20150615052607837.jpg', '29286', 'jpg', '1', '0', '0', '1', '1434360367', '127.0.0.1', '1', '0955d1e1cb287cdc58431db73613aef9', '1');
INSERT INTO `hc_attachment` VALUES ('46', 'content', '17', 'products_09.jpg', '2015/0616/20150616094956328.jpg', '13585', 'jpg', '1', '0', '0', '1', '1434419396', '127.0.0.1', '1', 'e22c049d49f25e8b30879f74591cb6ee', '1');
INSERT INTO `hc_attachment` VALUES ('47', 'content', '18', 'products_14.jpg', '2015/0616/20150616095157809.jpg', '12078', 'jpg', '1', '0', '0', '1', '1434419517', '127.0.0.1', '1', '5cbb496c2c26003dba288dd1a90adb66', '1');
INSERT INTO `hc_attachment` VALUES ('48', 'content', '17', 'products_11.jpg', '2015/0616/20150616095300407.jpg', '22547', 'jpg', '1', '0', '0', '1', '1434419580', '127.0.0.1', '1', '015a9fbaf06c9375b794fe2076f2dd49', '1');

-- ----------------------------
-- Table structure for `hc_attachment_index`
-- ----------------------------
DROP TABLE IF EXISTS `hc_attachment_index`;
CREATE TABLE `hc_attachment_index` (
  `keyid` char(30) NOT NULL,
  `aid` char(10) NOT NULL,
  KEY `keyid` (`keyid`) USING BTREE,
  KEY `aid` (`aid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hc_attachment_index
-- ----------------------------
INSERT INTO `hc_attachment_index` VALUES ('c-6-2', '1');
INSERT INTO `hc_attachment_index` VALUES ('c-6-2', '2');
INSERT INTO `hc_attachment_index` VALUES ('c-9-1', '3');
INSERT INTO `hc_attachment_index` VALUES ('c-9-1', '4');
INSERT INTO `hc_attachment_index` VALUES ('poster-11', '5');
INSERT INTO `hc_attachment_index` VALUES ('poster-12', '6');
INSERT INTO `hc_attachment_index` VALUES ('c-7-5', '8');
INSERT INTO `hc_attachment_index` VALUES ('c-7-4', '9');
INSERT INTO `hc_attachment_index` VALUES ('c-7-3', '10');
INSERT INTO `hc_attachment_index` VALUES ('c-64-7', '11');
INSERT INTO `hc_attachment_index` VALUES ('c-6-1', '12');
INSERT INTO `hc_attachment_index` VALUES ('c-6-3', '13');
INSERT INTO `hc_attachment_index` VALUES ('c-6-2', '14');
INSERT INTO `hc_attachment_index` VALUES ('c-3-9', '15');
INSERT INTO `hc_attachment_index` VALUES ('c-3-10', '16');
INSERT INTO `hc_attachment_index` VALUES ('c-3-9', '17');
INSERT INTO `hc_attachment_index` VALUES ('c-4-1', '18');
INSERT INTO `hc_attachment_index` VALUES ('c-4-1', '19');
INSERT INTO `hc_attachment_index` VALUES ('c-4-2', '18');
INSERT INTO `hc_attachment_index` VALUES ('c-4-3', '20');
INSERT INTO `hc_attachment_index` VALUES ('c-7-11', '21');
INSERT INTO `hc_attachment_index` VALUES ('c-7-12', '22');
INSERT INTO `hc_attachment_index` VALUES ('c-8-15', '23');
INSERT INTO `hc_attachment_index` VALUES ('c-8-14', '24');
INSERT INTO `hc_attachment_index` VALUES ('c-65-1', '25');
INSERT INTO `hc_attachment_index` VALUES ('c-65-2', '26');
INSERT INTO `hc_attachment_index` VALUES ('c-65-2', '27');
INSERT INTO `hc_attachment_index` VALUES ('c-65-2', '28');
INSERT INTO `hc_attachment_index` VALUES ('c-65-2', '29');
INSERT INTO `hc_attachment_index` VALUES ('c-9-16', '30');
INSERT INTO `hc_attachment_index` VALUES ('c-9-17', '31');
INSERT INTO `hc_attachment_index` VALUES ('c-9-18', '32');
INSERT INTO `hc_attachment_index` VALUES ('c-9-19', '33');
INSERT INTO `hc_attachment_index` VALUES ('poster-14', '34');
INSERT INTO `hc_attachment_index` VALUES ('poster-15', '35');
INSERT INTO `hc_attachment_index` VALUES ('c-16-2', '36');
INSERT INTO `hc_attachment_index` VALUES ('c-16-2', '37');
INSERT INTO `hc_attachment_index` VALUES ('c-16-2', '38');
INSERT INTO `hc_attachment_index` VALUES ('c-16-2', '39');
INSERT INTO `hc_attachment_index` VALUES ('c-16-2', '40');
INSERT INTO `hc_attachment_index` VALUES ('c-16-2', '41');
INSERT INTO `hc_attachment_index` VALUES ('c-16-2', '42');
INSERT INTO `hc_attachment_index` VALUES ('c-16-2', '36');
INSERT INTO `hc_attachment_index` VALUES ('c-16-2', '43');
INSERT INTO `hc_attachment_index` VALUES ('c-16-2', '42');
INSERT INTO `hc_attachment_index` VALUES ('c-16-2', '41');
INSERT INTO `hc_attachment_index` VALUES ('c-16-2', '40');
INSERT INTO `hc_attachment_index` VALUES ('c-16-2', '37');
INSERT INTO `hc_attachment_index` VALUES ('c-16-2', '38');
INSERT INTO `hc_attachment_index` VALUES ('c-16-2', '39');
INSERT INTO `hc_attachment_index` VALUES ('c-19-3', '44');
INSERT INTO `hc_attachment_index` VALUES ('c-19-3', '45');
INSERT INTO `hc_attachment_index` VALUES ('c-17-4', '46');
INSERT INTO `hc_attachment_index` VALUES ('c-18-5', '47');
INSERT INTO `hc_attachment_index` VALUES ('c-17-6', '48');

-- ----------------------------
-- Table structure for `hc_badword`
-- ----------------------------
DROP TABLE IF EXISTS `hc_badword`;
CREATE TABLE `hc_badword` (
  `badid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `badword` char(20) NOT NULL,
  `level` tinyint(5) NOT NULL DEFAULT '1',
  `replaceword` char(20) NOT NULL DEFAULT '0',
  `lastusetime` int(10) unsigned NOT NULL DEFAULT '0',
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`badid`),
  UNIQUE KEY `badword` (`badword`) USING BTREE,
  KEY `usetimes` (`replaceword`,`listorder`) USING BTREE,
  KEY `hits` (`listorder`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hc_badword
-- ----------------------------

-- ----------------------------
-- Table structure for `hc_block`
-- ----------------------------
DROP TABLE IF EXISTS `hc_block`;
CREATE TABLE `hc_block` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned DEFAULT '0',
  `name` char(50) DEFAULT NULL,
  `pos` char(30) DEFAULT NULL,
  `type` tinyint(1) DEFAULT '0',
  `data` text,
  `template` text,
  PRIMARY KEY (`id`),
  KEY `pos` (`pos`) USING BTREE,
  KEY `type` (`type`) USING BTREE,
  KEY `siteid` (`siteid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hc_block
-- ----------------------------

-- ----------------------------
-- Table structure for `hc_block_history`
-- ----------------------------
DROP TABLE IF EXISTS `hc_block_history`;
CREATE TABLE `hc_block_history` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `blockid` int(10) unsigned DEFAULT '0',
  `data` text,
  `creat_at` int(10) unsigned DEFAULT '0',
  `userid` mediumint(8) unsigned DEFAULT '0',
  `username` char(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hc_block_history
-- ----------------------------

-- ----------------------------
-- Table structure for `hc_block_priv`
-- ----------------------------
DROP TABLE IF EXISTS `hc_block_priv`;
CREATE TABLE `hc_block_priv` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `roleid` tinyint(3) unsigned DEFAULT '0',
  `siteid` smallint(5) unsigned DEFAULT '0',
  `blockid` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `blockid` (`blockid`) USING BTREE,
  KEY `roleid` (`roleid`,`siteid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hc_block_priv
-- ----------------------------

-- ----------------------------
-- Table structure for `hc_brand_activity`
-- ----------------------------
DROP TABLE IF EXISTS `hc_brand_activity`;
CREATE TABLE `hc_brand_activity` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `typeid` smallint(5) unsigned NOT NULL,
  `title` char(80) NOT NULL DEFAULT '',
  `style` char(24) NOT NULL DEFAULT '',
  `thumb` char(100) NOT NULL DEFAULT '',
  `keywords` char(40) NOT NULL DEFAULT '',
  `description` char(255) NOT NULL DEFAULT '',
  `posids` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `url` char(100) NOT NULL,
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `sysadd` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `islink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `status` (`status`,`listorder`,`id`) USING BTREE,
  KEY `listorder` (`catid`,`status`,`listorder`,`id`) USING BTREE,
  KEY `catid` (`catid`,`status`,`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hc_brand_activity
-- ----------------------------
INSERT INTO `hc_brand_activity` VALUES ('1', '6', '0', '高清呈现 永不褪色', '', 'http://www.hc.com/uploadfile/2015/0613/20150613010313340.jpg', '高清 永不', '惠普顶级数码印刷，配合原装环保油墨', '0', 'http://www.hc.com/index.php?m=content&c=index&a=show&catid=6&id=1', '0', '99', '1', '0', 'admin', '1434171704', '1434173315');
INSERT INTO `hc_brand_activity` VALUES ('2', '6', '0', '个性台历8寸竖款单面', '', 'http://www.hc.com/uploadfile/2015/0613/20150613010523851.jpg', '单面 台历 个性', '在线照片DIY定制，多款模板可选', '0', 'http://www.hc.com/index.php?m=content&c=index&a=show&catid=6&id=2', '0', '99', '1', '0', 'admin', '1434171829', '1434173301');
INSERT INTO `hc_brand_activity` VALUES ('3', '6', '0', '用自己的照片设计', '', 'http://www.hc.com/uploadfile/2015/0613/20150613010502189.jpg', '照片', '惠普顶级数码印刷，配合原装环保油墨', '0', 'http://www.hc.com/index.php?m=content&c=index&a=show&catid=6&id=3', '0', '99', '1', '0', 'admin', '1434171861', '1434173287');

-- ----------------------------
-- Table structure for `hc_brand_activity_data`
-- ----------------------------
DROP TABLE IF EXISTS `hc_brand_activity_data`;
CREATE TABLE `hc_brand_activity_data` (
  `id` mediumint(8) unsigned DEFAULT '0',
  `content` text NOT NULL,
  `readpoint` smallint(5) unsigned NOT NULL DEFAULT '0',
  `groupids_view` varchar(100) NOT NULL,
  `paginationtype` tinyint(1) NOT NULL,
  `maxcharperpage` mediumint(6) NOT NULL,
  `template` varchar(30) NOT NULL,
  `paytype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allow_comment` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `relation` varchar(255) NOT NULL DEFAULT '',
  `date_start` date DEFAULT NULL,
  `date_end` date DEFAULT NULL,
  KEY `id` (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hc_brand_activity_data
-- ----------------------------
INSERT INTO `hc_brand_activity_data` VALUES ('1', '<span style=\"color: rgb(102, 102, 102); font-family: Verdana, Geneva, sans-serif; font-size: 14px; line-height: 26px;\">惠普顶级数码印刷，配合原装环保油墨</span><span style=\"color: rgb(102, 102, 102); font-family: Verdana, Geneva, sans-serif; font-size: 14px; line-height: 26px;\">惠普顶级数码印刷，配合原装环保油墨</span><span style=\"color: rgb(102, 102, 102); font-family: Verdana, Geneva, sans-serif; font-size: 14px; line-height: 26px;\">惠普顶级数码印刷，配合原装环保油墨</span><span style=\"color: rgb(102, 102, 102); font-family: Verdana, Geneva, sans-serif; font-size: 14px; line-height: 26px;\">惠普顶级数码印刷，配合原装环保油墨</span><span style=\"color: rgb(102, 102, 102); font-family: Verdana, Geneva, sans-serif; font-size: 14px; line-height: 26px;\">惠普顶级数码印刷，配合原装环保油墨</span>', '0', '', '0', '10000', '', '0', '1', '', '2015-06-09', '2015-06-12');
INSERT INTO `hc_brand_activity_data` VALUES ('2', '<span style=\"color: rgb(102, 102, 102); font-family: Verdana, Geneva, sans-serif; font-size: 14px; line-height: 26px;\">在线照片DIY定制，多款模板可选</span><span style=\"color: rgb(102, 102, 102); font-family: Verdana, Geneva, sans-serif; font-size: 14px; line-height: 26px;\">在线照片DIY定制，多款模板可选</span><span style=\"color: rgb(102, 102, 102); font-family: Verdana, Geneva, sans-serif; font-size: 14px; line-height: 26px;\">在线照片DIY定制，多款模板可选</span><span style=\"color: rgb(102, 102, 102); font-family: Verdana, Geneva, sans-serif; font-size: 14px; line-height: 26px;\">在线照片DIY定制，多款模板可选</span><span style=\"color: rgb(102, 102, 102); font-family: Verdana, Geneva, sans-serif; font-size: 14px; line-height: 26px;\">在线照片DIY定制，多款模板可选</span><span style=\"color: rgb(102, 102, 102); font-family: Verdana, Geneva, sans-serif; font-size: 14px; line-height: 26px;\">在线照片DIY定制，多款模板可选</span>', '0', '', '0', '10000', '', '0', '1', '', '2015-06-16', '2015-06-19');
INSERT INTO `hc_brand_activity_data` VALUES ('3', '<span style=\"color: rgb(102, 102, 102); font-family: Verdana, Geneva, sans-serif; font-size: 14px; line-height: 26px;\">惠普顶级数码印刷，配合原装环保油墨</span><span style=\"color: rgb(102, 102, 102); font-family: Verdana, Geneva, sans-serif; font-size: 14px; line-height: 26px;\">惠普顶级数码印刷，配合原装环保油墨</span><span style=\"color: rgb(102, 102, 102); font-family: Verdana, Geneva, sans-serif; font-size: 14px; line-height: 26px;\">惠普顶级数码印刷，配合原装环保油墨</span><span style=\"color: rgb(102, 102, 102); font-family: Verdana, Geneva, sans-serif; font-size: 14px; line-height: 26px;\">惠普顶级数码印刷，配合原装环保油墨</span><span style=\"color: rgb(102, 102, 102); font-family: Verdana, Geneva, sans-serif; font-size: 14px; line-height: 26px;\">惠普顶级数码印刷，配合原装环保油墨</span>', '0', '', '0', '10000', '', '0', '1', '', '2015-06-09', '2015-06-23');

-- ----------------------------
-- Table structure for `hc_cache`
-- ----------------------------
DROP TABLE IF EXISTS `hc_cache`;
CREATE TABLE `hc_cache` (
  `filename` char(50) NOT NULL,
  `path` char(50) NOT NULL,
  `data` mediumtext NOT NULL,
  PRIMARY KEY (`filename`,`path`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hc_cache
-- ----------------------------
INSERT INTO `hc_cache` VALUES ('mood_program.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n  1 => \n  array (\n    1 => \n    array (\n      \'use\' => \'1\',\n      \'name\' => \'震惊\',\n      \'pic\' => \'mood/a1.gif\',\n    ),\n    2 => \n    array (\n      \'use\' => \'1\',\n      \'name\' => \'不解\',\n      \'pic\' => \'mood/a2.gif\',\n    ),\n    3 => \n    array (\n      \'use\' => \'1\',\n      \'name\' => \'愤怒\',\n      \'pic\' => \'mood/a3.gif\',\n    ),\n    4 => \n    array (\n      \'use\' => \'1\',\n      \'name\' => \'杯具\',\n      \'pic\' => \'mood/a4.gif\',\n    ),\n    5 => \n    array (\n      \'use\' => \'1\',\n      \'name\' => \'无聊\',\n      \'pic\' => \'mood/a5.gif\',\n    ),\n    6 => \n    array (\n      \'use\' => \'1\',\n      \'name\' => \'高兴\',\n      \'pic\' => \'mood/a6.gif\',\n    ),\n    7 => \n    array (\n      \'use\' => \'1\',\n      \'name\' => \'支持\',\n      \'pic\' => \'mood/a7.gif\',\n    ),\n    8 => \n    array (\n      \'use\' => \'1\',\n      \'name\' => \'超赞\',\n      \'pic\' => \'mood/a8.gif\',\n    ),\n    9 => \n    array (\n      \'use\' => NULL,\n      \'name\' => \'\',\n      \'pic\' => \'\',\n    ),\n    10 => \n    array (\n      \'use\' => NULL,\n      \'name\' => \'\',\n      \'pic\' => \'\',\n    ),\n  ),\n);\n?>');
INSERT INTO `hc_cache` VALUES ('sitelist.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n  1 => \n  array (\n    \'siteid\' => \'1\',\n    \'name\' => \'默认站点\',\n    \'dirname\' => \'\',\n    \'domain\' => \'http://www.hc.com/\',\n    \'site_title\' => \'虎彩 - 让印刷走进千家万户\',\n    \'keywords\' => \'虎彩·印艺专家，中国最具特色的创新型印艺企业，拥有亚洲规模最大的数字印刷机群。为您提供包装印刷、安全印务、个性影像、个性包装、按需出版等个性化定制服务\',\n    \'description\' => \'虎彩是全球最优秀的高端奢侈品纸包装解决方案供应商，名列中国印刷百强第九名。我们致力于让印刷走进千家万户，围绕客户的需求持续创新，为企业提供具有竞争力整体印刷解决方案，为用户提供优质的个性化定制服务，持续提升客户体验，为客户创造最大价值。虎彩人的使命正在于将千家万户的幸福、美好回忆，用先进的印刷技术和个性化印品将其永久珍藏，让其触手可及。\',\n    \'release_point\' => \'\',\n    \'default_style\' => \'hucai\',\n    \'template\' => \'hucai\',\n    \'setting\' => \'array (\n  \\\'upload_maxsize\\\' => \\\'10240\\\',\n  \\\'upload_allowext\\\' => \\\'jpg|jpeg|gif|bmp|png|doc|docx|xls|xlsx|ppt|pptx|pdf|txt|rar|zip|swf\\\',\n  \\\'watermark_enable\\\' => \\\'1\\\',\n  \\\'watermark_minwidth\\\' => \\\'300\\\',\n  \\\'watermark_minheight\\\' => \\\'300\\\',\n  \\\'watermark_img\\\' => \\\'statics/images/water//mark.png\\\',\n  \\\'watermark_pct\\\' => \\\'85\\\',\n  \\\'watermark_quality\\\' => \\\'80\\\',\n  \\\'watermark_pos\\\' => \\\'9\\\',\n)\',\n    \'uuid\' => \'d6ecd476-e199-11e4-acca-00ac488648d9\',\n    \'url\' => \'http://www.hc.com/\',\n  ),\n  2 => \n  array (\n    \'siteid\' => \'2\',\n    \'name\' => \'英文站点\',\n    \'dirname\' => \'en\',\n    \'domain\' => \'http://www.hc.com/en/\',\n    \'site_title\' => \'Hucais Printing\',\n    \'keywords\' => \'keywords\',\n    \'description\' => \'descptions\',\n    \'release_point\' => \'\',\n    \'default_style\' => \'hucai_en\',\n    \'template\' => \'hucai_en\',\n    \'setting\' => \'array (\n  \\\'upload_maxsize\\\' => \\\'2000\\\',\n  \\\'upload_allowext\\\' => \\\'jpg|jpeg|gif|bmp|png|doc|docx|xls|xlsx|ppt|pptx|pdf|txt|rar|zip|swf\\\',\n  \\\'watermark_enable\\\' => \\\'1\\\',\n  \\\'watermark_minwidth\\\' => \\\'300\\\',\n  \\\'watermark_minheight\\\' => \\\'300\\\',\n  \\\'watermark_img\\\' => \\\'http://www.hc.com/statics/images/water/mark.gif\\\',\n  \\\'watermark_pct\\\' => \\\'100\\\',\n  \\\'watermark_quality\\\' => \\\'80\\\',\n  \\\'watermark_pos\\\' => \\\'9\\\',\n)\',\n    \'uuid\' => \'\',\n    \'url\' => \'http://www.hc.com/en/\',\n  ),\n);\n?>');
INSERT INTO `hc_cache` VALUES ('modules.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n  \'admin\' => \n  array (\n    \'module\' => \'admin\',\n    \'name\' => \'admin\',\n    \'url\' => \'\',\n    \'iscore\' => \'1\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'array (\n  \\\'admin_email\\\' => \\\'623493406@qq.com\\\',\n  \\\'maxloginfailedtimes\\\' => \\\'8\\\',\n  \\\'minrefreshtime\\\' => \\\'2\\\',\n  \\\'mail_type\\\' => \\\'1\\\',\n  \\\'mail_server\\\' => \\\'smtp.qq.com\\\',\n  \\\'mail_port\\\' => \\\'25\\\',\n  \\\'category_ajax\\\' => \\\'0\\\',\n  \\\'mail_user\\\' => \\\'623493406@qq.com\\\',\n  \\\'mail_auth\\\' => \\\'1\\\',\n  \\\'mail_from\\\' => \\\'623493406@qq.com\\\',\n  \\\'mail_password\\\' => \\\'@wdz520cc\\\',\n  \\\'errorlog_size\\\' => \\\'20\\\',\n)\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-10-18\',\n    \'updatedate\' => \'2010-10-18\',\n  ),\n  \'member\' => \n  array (\n    \'module\' => \'member\',\n    \'name\' => \'会员\',\n    \'url\' => \'\',\n    \'iscore\' => \'1\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'array (\n  \\\'allowregister\\\' => \\\'1\\\',\n  \\\'choosemodel\\\' => \\\'1\\\',\n  \\\'enablemailcheck\\\' => \\\'0\\\',\n  \\\'registerverify\\\' => \\\'0\\\',\n  \\\'showapppoint\\\' => \\\'0\\\',\n  \\\'rmb_point_rate\\\' => \\\'10\\\',\n  \\\'defualtpoint\\\' => \\\'0\\\',\n  \\\'defualtamount\\\' => \\\'0\\\',\n  \\\'showregprotocol\\\' => \\\'0\\\',\n  \\\'regprotocol\\\' => \\\'		 欢迎您注册成为phpcms用户\r\n请仔细阅读下面的协议，只有接受协议才能继续进行注册。 \r\n1．服务条款的确认和接纳\r\n　　phpcms用户服务的所有权和运作权归phpcms拥有。phpcms所提供的服务将按照有关章程、服务条款和操作规则严格执行。用户通过注册程序点击“我同意” 按钮，即表示用户与phpcms达成协议并接受所有的服务条款。\r\n2． phpcms服务简介\r\n　　phpcms通过国际互联网为用户提供新闻及文章浏览、图片浏览、软件下载、网上留言和BBS论坛等服务。\r\n　　用户必须： \r\n　　1)购置设备，包括个人电脑一台、调制解调器一个及配备上网装置。 \r\n　　2)个人上网和支付与此服务有关的电话费用、网络费用。\r\n　　用户同意： \r\n　　1)提供及时、详尽及准确的个人资料。 \r\n　　2)不断更新注册资料，符合及时、详尽、准确的要求。所有原始键入的资料将引用为注册资料。 \r\n　　3)用户同意遵守《中华人民共和国保守国家秘密法》、《中华人民共和国计算机信息系统安全保护条例》、《计算机软件保护条例》等有关计算机及互联网规定的法律和法规、实施办法。在任何情况下，phpcms合理地认为用户的行为可能违反上述法律、法规，phpcms可以在任何时候，不经事先通知终止向该用户提供服务。用户应了解国际互联网的无国界性，应特别注意遵守当地所有有关的法律和法规。\r\n3． 服务条款的修改\r\n　　phpcms会不定时地修改服务条款，服务条款一旦发生变动，将会在相关页面上提示修改内容。如果您同意改动，则再一次点击“我同意”按钮。 如果您不接受，则及时取消您的用户使用服务资格。\r\n4． 服务修订\r\n　　phpcms保留随时修改或中断服务而不需知照用户的权利。phpcms行使修改或中断服务的权利，不需对用户或第三方负责。\r\n5． 用户隐私制度\r\n　　尊重用户个人隐私是phpcms的 基本政策。phpcms不会公开、编辑或透露用户的注册信息，除非有法律许可要求，或phpcms在诚信的基础上认为透露这些信息在以下三种情况是必要的： \r\n　　1)遵守有关法律规定，遵从合法服务程序。 \r\n　　2)保持维护phpcms的商标所有权。 \r\n　　3)在紧急情况下竭力维护用户个人和社会大众的隐私安全。 \r\n　　4)符合其他相关的要求。 \r\n6．用户的帐号，密码和安全性\r\n　　一旦注册成功成为phpcms用户，您将得到一个密码和帐号。如果您不保管好自己的帐号和密码安全，将对因此产生的后果负全部责任。另外，每个用户都要对其帐户中的所有活动和事件负全责。您可随时根据指示改变您的密码，也可以结束旧的帐户重开一个新帐户。用户同意若发现任何非法使用用户帐号或安全漏洞的情况，立即通知phpcms。\r\n7． 免责条款\r\n　　用户明确同意网站服务的使用由用户个人承担风险。 　　 \r\n　　phpcms不作任何类型的担保，不担保服务一定能满足用户的要求，也不担保服务不会受中断，对服务的及时性，安全性，出错发生都不作担保。用户理解并接受：任何通过phpcms服务取得的信息资料的可靠性取决于用户自己，用户自己承担所有风险和责任。 \r\n8．有限责任\r\n　　phpcms对任何直接、间接、偶然、特殊及继起的损害不负责任。\r\n9． 不提供零售和商业性服务 \r\n　　用户使用网站服务的权利是个人的。用户只能是一个单独的个体而不能是一个公司或实体商业性组织。用户承诺不经phpcms同意，不能利用网站服务进行销售或其他商业用途。\r\n10．用户责任 \r\n　　用户单独承担传输内容的责任。用户必须遵循： \r\n　　1)从中国境内向外传输技术性资料时必须符合中国有关法规。 \r\n　　2)使用网站服务不作非法用途。 \r\n　　3)不干扰或混乱网络服务。 \r\n　　4)不在论坛BBS或留言簿发表任何与政治相关的信息。 \r\n　　5)遵守所有使用网站服务的网络协议、规定、程序和惯例。\r\n　　6)不得利用本站危害国家安全、泄露国家秘密，不得侵犯国家社会集体的和公民的合法权益。\r\n　　7)不得利用本站制作、复制和传播下列信息： \r\n　　　1、煽动抗拒、破坏宪法和法律、行政法规实施的；\r\n　　　2、煽动颠覆国家政权，推翻社会主义制度的；\r\n　　　3、煽动分裂国家、破坏国家统一的；\r\n　　　4、煽动民族仇恨、民族歧视，破坏民族团结的；\r\n　　　5、捏造或者歪曲事实，散布谣言，扰乱社会秩序的；\r\n　　　6、宣扬封建迷信、淫秽、色情、赌博、暴力、凶杀、恐怖、教唆犯罪的；\r\n　　　7、公然侮辱他人或者捏造事实诽谤他人的，或者进行其他恶意攻击的；\r\n　　　8、损害国家机关信誉的；\r\n　　　9、其他违反宪法和法律行政法规的；\r\n　　　10、进行商业广告行为的。\r\n　　用户不能传输任何教唆他人构成犯罪行为的资料；不能传输长国内不利条件和涉及国家安全的资料；不能传输任何不符合当地法规、国家法律和国际法 律的资料。未经许可而非法进入其它电脑系统是禁止的。若用户的行为不符合以上的条款，phpcms将取消用户服务帐号。\r\n11．网站内容的所有权\r\n　　phpcms定义的内容包括：文字、软件、声音、相片、录象、图表；在广告中全部内容；电子邮件的全部内容；phpcms为用户提供的商业信息。所有这些内容受版权、商标、标签和其它财产所有权法律的保护。所以，用户只能在phpcms和广告商授权下才能使用这些内容，而不能擅自复制、篡改这些内容、或创造与内容有关的派生产品。\r\n12．附加信息服务\r\n　　用户在享用phpcms提供的免费服务的同时，同意接受phpcms提供的各类附加信息服务。\r\n13．解释权\r\n　　本注册协议的解释权归phpcms所有。如果其中有任何条款与国家的有关法律相抵触，则以国家法律的明文规定为准。 \\\',\n  \\\'registerverifymessage\\\' => \\\' 欢迎您注册成为phpcms用户，您的账号需要邮箱认证，点击下面链接进行认证：{click}\r\n或者将网址复制到浏览器：{url}\\\',\n  \\\'forgetpassword\\\' => \\\' phpcms密码找回，请在一小时内点击下面链接进行操作：{click}\r\n或者将网址复制到浏览器：{url}\\\',\n)\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-06\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'pay\' => \n  array (\n    \'module\' => \'pay\',\n    \'name\' => \'支付\',\n    \'url\' => \'\',\n    \'iscore\' => \'1\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-06\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'digg\' => \n  array (\n    \'module\' => \'digg\',\n    \'name\' => \'顶一下\',\n    \'url\' => \'\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-06\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'special\' => \n  array (\n    \'module\' => \'special\',\n    \'name\' => \'专题\',\n    \'url\' => \'\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-06\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'content\' => \n  array (\n    \'module\' => \'content\',\n    \'name\' => \'内容模块\',\n    \'url\' => \'\',\n    \'iscore\' => \'1\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-06\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'search\' => \n  array (\n    \'module\' => \'search\',\n    \'name\' => \'全站搜索\',\n    \'url\' => \'\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'array (\n  \\\'fulltextenble\\\' => \\\'1\\\',\n  \\\'relationenble\\\' => \\\'1\\\',\n  \\\'suggestenable\\\' => \\\'1\\\',\n  \\\'sphinxenable\\\' => \\\'0\\\',\n  \\\'sphinxhost\\\' => \\\'10.228.134.102\\\',\n  \\\'sphinxport\\\' => \\\'9312\\\',\n)\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-06\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'scan\' => \n  array (\n    \'module\' => \'scan\',\n    \'name\' => \'木马扫描\',\n    \'url\' => \'scan\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-01\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'attachment\' => \n  array (\n    \'module\' => \'attachment\',\n    \'name\' => \'附件\',\n    \'url\' => \'attachment\',\n    \'iscore\' => \'1\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-01\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'block\' => \n  array (\n    \'module\' => \'block\',\n    \'name\' => \'碎片\',\n    \'url\' => \'\',\n    \'iscore\' => \'1\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-01\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'collection\' => \n  array (\n    \'module\' => \'collection\',\n    \'name\' => \'采集模块\',\n    \'url\' => \'collection\',\n    \'iscore\' => \'1\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-01\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'dbsource\' => \n  array (\n    \'module\' => \'dbsource\',\n    \'name\' => \'数据源\',\n    \'url\' => \'\',\n    \'iscore\' => \'1\',\n    \'version\' => \'\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-01\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'template\' => \n  array (\n    \'module\' => \'template\',\n    \'name\' => \'模板风格\',\n    \'url\' => \'\',\n    \'iscore\' => \'1\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-01\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'release\' => \n  array (\n    \'module\' => \'release\',\n    \'name\' => \'发布点\',\n    \'url\' => \'\',\n    \'iscore\' => \'1\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-01\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'video\' => \n  array (\n    \'module\' => \'video\',\n    \'name\' => \'视频库\',\n    \'url\' => \'\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2012-09-28\',\n    \'updatedate\' => \'2012-09-28\',\n  ),\n  \'announce\' => \n  array (\n    \'module\' => \'announce\',\n    \'name\' => \'公告\',\n    \'url\' => \'announce/\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'公告\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2015-04-13\',\n    \'updatedate\' => \'2015-04-13\',\n  ),\n  \'link\' => \n  array (\n    \'module\' => \'link\',\n    \'name\' => \'友情链接\',\n    \'url\' => \'\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'array (\n  1 => \n  array (\n    \\\'is_post\\\' => \\\'1\\\',\n    \\\'enablecheckcode\\\' => \\\'0\\\',\n  ),\n)\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-06\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'poster\' => \n  array (\n    \'module\' => \'poster\',\n    \'name\' => \'广告模块\',\n    \'url\' => \'poster/\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'广告模块\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2015-04-13\',\n    \'updatedate\' => \'2015-04-13\',\n  ),\n  \'formguide\' => \n  array (\n    \'module\' => \'formguide\',\n    \'name\' => \'表单向导\',\n    \'url\' => \'formguide/\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'formguide\',\n    \'setting\' => \'array (\n  \\\'allowmultisubmit\\\' => \\\'1\\\',\n  \\\'interval\\\' => \\\'30\\\',\n  \\\'allowunreg\\\' => \\\'0\\\',\n  \\\'mailmessage\\\' => \\\'用户向我们提交了表单数据，赶快去看看吧。\\\',\n)\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-10-20\',\n    \'updatedate\' => \'2010-10-20\',\n  ),\n  \'wap\' => \n  array (\n    \'module\' => \'wap\',\n    \'name\' => \'手机门户\',\n    \'url\' => \'wap/\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'手机门户\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2015-04-13\',\n    \'updatedate\' => \'2015-04-13\',\n  ),\n  \'upgrade\' => \n  array (\n    \'module\' => \'upgrade\',\n    \'name\' => \'在线升级\',\n    \'url\' => \'\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2011-05-18\',\n    \'updatedate\' => \'2011-05-18\',\n  ),\n  \'tag\' => \n  array (\n    \'module\' => \'tag\',\n    \'name\' => \'标签向导\',\n    \'url\' => \'tag/\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'标签向导\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2015-04-13\',\n    \'updatedate\' => \'2015-04-13\',\n  ),\n);\n?>');
INSERT INTO `hc_cache` VALUES ('category_content.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n  55 => \'1\',\n  58 => \'1\',\n  59 => \'1\',\n  60 => \'1\',\n  61 => \'1\',\n  62 => \'1\',\n  56 => \'1\',\n  54 => \'1\',\n  53 => \'1\',\n  52 => \'1\',\n  51 => \'1\',\n  57 => \'1\',\n  2 => \'1\',\n  1 => \'1\',\n  3 => \'1\',\n  4 => \'1\',\n  5 => \'1\',\n  6 => \'1\',\n  7 => \'1\',\n  8 => \'1\',\n  9 => \'1\',\n  10 => \'1\',\n  11 => \'1\',\n  12 => \'1\',\n  13 => \'1\',\n  14 => \'1\',\n  15 => \'1\',\n  16 => \'1\',\n  17 => \'1\',\n  18 => \'1\',\n  19 => \'1\',\n  20 => \'1\',\n  21 => \'1\',\n  22 => \'1\',\n  23 => \'1\',\n  24 => \'1\',\n  25 => \'1\',\n  26 => \'1\',\n  27 => \'1\',\n  28 => \'1\',\n  29 => \'1\',\n  30 => \'1\',\n  31 => \'1\',\n  32 => \'1\',\n  33 => \'1\',\n  34 => \'1\',\n  35 => \'1\',\n  36 => \'1\',\n  37 => \'1\',\n  38 => \'1\',\n  39 => \'1\',\n  40 => \'1\',\n  41 => \'1\',\n  42 => \'1\',\n  43 => \'1\',\n  44 => \'1\',\n  45 => \'1\',\n  46 => \'1\',\n  47 => \'1\',\n  48 => \'1\',\n  49 => \'1\',\n  50 => \'1\',\n  63 => \'1\',\n  64 => \'1\',\n  65 => \'1\',\n);\n?>');
INSERT INTO `hc_cache` VALUES ('category_content_1.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n  51 => \n  array (\n    \'catid\' => \'51\',\n    \'siteid\' => \'1\',\n    \'type\' => \'2\',\n    \'modelid\' => \'0\',\n    \'parentid\' => \'35\',\n    \'arrparentid\' => \'\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'\',\n    \'catname\' => \'新闻中心\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'\',\n    \'catdir\' => \'\',\n    \'url\' => \'http://www.hc.com/index.php?m=content&c=index&a=lists&catid=2\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'array (\n  \\\'show_ruleid\\\' => \\\'\\\',\n  \\\'repeatchargedays\\\' => \\\'1\\\',\n)\',\n    \'listorder\' => \'0\',\n    \'ismenu\' => \'1\',\n    \'ishelp\' => \'0\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => NULL,\n    \'ishtml\' => NULL,\n    \'content_ishtml\' => NULL,\n    \'category_ruleid\' => NULL,\n    \'show_ruleid\' => \'\',\n    \'workflowid\' => NULL,\n    \'isdomain\' => \'0\',\n  ),\n  52 => \n  array (\n    \'catid\' => \'52\',\n    \'siteid\' => \'1\',\n    \'type\' => \'2\',\n    \'modelid\' => \'0\',\n    \'parentid\' => \'35\',\n    \'arrparentid\' => \'\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'\',\n    \'catname\' => \'品牌活动\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'\',\n    \'catdir\' => \'\',\n    \'url\' => \'http://www.hc.com#\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'array (\n  \\\'show_ruleid\\\' => \\\'\\\',\n  \\\'repeatchargedays\\\' => \\\'1\\\',\n)\',\n    \'listorder\' => \'0\',\n    \'ismenu\' => \'1\',\n    \'ishelp\' => \'0\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => NULL,\n    \'ishtml\' => NULL,\n    \'content_ishtml\' => NULL,\n    \'category_ruleid\' => NULL,\n    \'show_ruleid\' => \'\',\n    \'workflowid\' => NULL,\n    \'isdomain\' => \'0\',\n  ),\n  53 => \n  array (\n    \'catid\' => \'53\',\n    \'siteid\' => \'1\',\n    \'type\' => \'2\',\n    \'modelid\' => \'0\',\n    \'parentid\' => \'35\',\n    \'arrparentid\' => \'\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'\',\n    \'catname\' => \'下载中心\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'\',\n    \'catdir\' => \'\',\n    \'url\' => \'http://www.hc.com#\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'array (\n  \\\'show_ruleid\\\' => \\\'\\\',\n  \\\'repeatchargedays\\\' => \\\'1\\\',\n)\',\n    \'listorder\' => \'0\',\n    \'ismenu\' => \'1\',\n    \'ishelp\' => \'0\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => NULL,\n    \'ishtml\' => NULL,\n    \'content_ishtml\' => NULL,\n    \'category_ruleid\' => NULL,\n    \'show_ruleid\' => \'\',\n    \'workflowid\' => NULL,\n    \'isdomain\' => \'0\',\n  ),\n  54 => \n  array (\n    \'catid\' => \'54\',\n    \'siteid\' => \'1\',\n    \'type\' => \'2\',\n    \'modelid\' => \'0\',\n    \'parentid\' => \'35\',\n    \'arrparentid\' => \'\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'\',\n    \'catname\' => \'第三方视角\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'\',\n    \'catdir\' => \'\',\n    \'url\' => \'http://www.hc.com#\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'array (\n  \\\'show_ruleid\\\' => \\\'\\\',\n  \\\'repeatchargedays\\\' => \\\'1\\\',\n)\',\n    \'listorder\' => \'0\',\n    \'ismenu\' => \'1\',\n    \'ishelp\' => \'0\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => NULL,\n    \'ishtml\' => NULL,\n    \'content_ishtml\' => NULL,\n    \'category_ruleid\' => NULL,\n    \'show_ruleid\' => \'\',\n    \'workflowid\' => NULL,\n    \'isdomain\' => \'0\',\n  ),\n  55 => \n  array (\n    \'catid\' => \'55\',\n    \'siteid\' => \'1\',\n    \'type\' => \'2\',\n    \'modelid\' => \'0\',\n    \'parentid\' => \'35\',\n    \'arrparentid\' => \'\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'\',\n    \'catname\' => \'毕业季\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'\',\n    \'catdir\' => \'\',\n    \'url\' => \'http://www.hc.com#\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'array (\n  \\\'show_ruleid\\\' => \\\'\\\',\n  \\\'repeatchargedays\\\' => \\\'1\\\',\n)\',\n    \'listorder\' => \'0\',\n    \'ismenu\' => \'1\',\n    \'ishelp\' => \'0\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => NULL,\n    \'ishtml\' => NULL,\n    \'content_ishtml\' => NULL,\n    \'category_ruleid\' => NULL,\n    \'show_ruleid\' => \'\',\n    \'workflowid\' => NULL,\n    \'isdomain\' => \'0\',\n  ),\n  56 => \n  array (\n    \'catid\' => \'56\',\n    \'siteid\' => \'1\',\n    \'type\' => \'2\',\n    \'modelid\' => \'0\',\n    \'parentid\' => \'35\',\n    \'arrparentid\' => \'\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'\',\n    \'catname\' => \'上海婚博会\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'\',\n    \'catdir\' => \'\',\n    \'url\' => \'http://www.hc.com#\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'array (\n  \\\'show_ruleid\\\' => \\\'\\\',\n  \\\'repeatchargedays\\\' => \\\'1\\\',\n)\',\n    \'listorder\' => \'0\',\n    \'ismenu\' => \'1\',\n    \'ishelp\' => \'0\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => NULL,\n    \'ishtml\' => NULL,\n    \'content_ishtml\' => NULL,\n    \'category_ruleid\' => NULL,\n    \'show_ruleid\' => \'\',\n    \'workflowid\' => NULL,\n    \'isdomain\' => \'0\',\n  ),\n  57 => \n  array (\n    \'catid\' => \'57\',\n    \'siteid\' => \'1\',\n    \'type\' => \'2\',\n    \'modelid\' => \'0\',\n    \'parentid\' => \'36\',\n    \'arrparentid\' => \'\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'\',\n    \'catname\' => \'影像定制商城\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'\',\n    \'catdir\' => \'\',\n    \'url\' => \'http://www.hc.com#\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'array (\n  \\\'show_ruleid\\\' => \\\'\\\',\n  \\\'repeatchargedays\\\' => \\\'1\\\',\n)\',\n    \'listorder\' => \'0\',\n    \'ismenu\' => \'1\',\n    \'ishelp\' => \'0\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => NULL,\n    \'ishtml\' => NULL,\n    \'content_ishtml\' => NULL,\n    \'category_ruleid\' => NULL,\n    \'show_ruleid\' => \'\',\n    \'workflowid\' => NULL,\n    \'isdomain\' => \'0\',\n  ),\n  58 => \n  array (\n    \'catid\' => \'58\',\n    \'siteid\' => \'1\',\n    \'type\' => \'2\',\n    \'modelid\' => \'0\',\n    \'parentid\' => \'36\',\n    \'arrparentid\' => \'\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'\',\n    \'catname\' => \'搜书院\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'\',\n    \'catdir\' => \'\',\n    \'url\' => \'http://www.hc.com#\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'array (\n  \\\'show_ruleid\\\' => \\\'\\\',\n  \\\'repeatchargedays\\\' => \\\'1\\\',\n)\',\n    \'listorder\' => \'0\',\n    \'ismenu\' => \'1\',\n    \'ishelp\' => \'0\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => NULL,\n    \'ishtml\' => NULL,\n    \'content_ishtml\' => NULL,\n    \'category_ruleid\' => NULL,\n    \'show_ruleid\' => \'\',\n    \'workflowid\' => NULL,\n    \'isdomain\' => \'0\',\n  ),\n  59 => \n  array (\n    \'catid\' => \'59\',\n    \'siteid\' => \'1\',\n    \'type\' => \'2\',\n    \'modelid\' => \'0\',\n    \'parentid\' => \'36\',\n    \'arrparentid\' => \'\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'\',\n    \'catname\' => \'天猫旗舰店\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'\',\n    \'catdir\' => \'\',\n    \'url\' => \'http://www.hc.com#\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'array (\n  \\\'show_ruleid\\\' => \\\'\\\',\n  \\\'repeatchargedays\\\' => \\\'1\\\',\n)\',\n    \'listorder\' => \'0\',\n    \'ismenu\' => \'1\',\n    \'ishelp\' => \'0\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => NULL,\n    \'ishtml\' => NULL,\n    \'content_ishtml\' => NULL,\n    \'category_ruleid\' => NULL,\n    \'show_ruleid\' => \'\',\n    \'workflowid\' => NULL,\n    \'isdomain\' => \'0\',\n  ),\n  60 => \n  array (\n    \'catid\' => \'60\',\n    \'siteid\' => \'1\',\n    \'type\' => \'2\',\n    \'modelid\' => \'0\',\n    \'parentid\' => \'36\',\n    \'arrparentid\' => \'\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'\',\n    \'catname\' => \'微刊\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'\',\n    \'catdir\' => \'\',\n    \'url\' => \'http://www.hc.com#\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'array (\n  \\\'show_ruleid\\\' => \\\'\\\',\n  \\\'repeatchargedays\\\' => \\\'1\\\',\n)\',\n    \'listorder\' => \'0\',\n    \'ismenu\' => \'1\',\n    \'ishelp\' => \'0\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => NULL,\n    \'ishtml\' => NULL,\n    \'content_ishtml\' => NULL,\n    \'category_ruleid\' => NULL,\n    \'show_ruleid\' => \'\',\n    \'workflowid\' => NULL,\n    \'isdomain\' => \'0\',\n  ),\n  61 => \n  array (\n    \'catid\' => \'61\',\n    \'siteid\' => \'1\',\n    \'type\' => \'2\',\n    \'modelid\' => \'0\',\n    \'parentid\' => \'36\',\n    \'arrparentid\' => \'\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'\',\n    \'catname\' => \'视频中心\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'\',\n    \'catdir\' => \'\',\n    \'url\' => \'http://www.hc.com#\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'array (\n  \\\'show_ruleid\\\' => \\\'\\\',\n  \\\'repeatchargedays\\\' => \\\'1\\\',\n)\',\n    \'listorder\' => \'0\',\n    \'ismenu\' => \'1\',\n    \'ishelp\' => \'0\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => NULL,\n    \'ishtml\' => NULL,\n    \'content_ishtml\' => NULL,\n    \'category_ruleid\' => NULL,\n    \'show_ruleid\' => \'\',\n    \'workflowid\' => NULL,\n    \'isdomain\' => \'0\',\n  ),\n  62 => \n  array (\n    \'catid\' => \'62\',\n    \'siteid\' => \'1\',\n    \'type\' => \'2\',\n    \'modelid\' => \'0\',\n    \'parentid\' => \'36\',\n    \'arrparentid\' => \'\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'\',\n    \'catname\' => \'体验店查询\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'\',\n    \'catdir\' => \'\',\n    \'url\' => \'http://www.hc.com#\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'array (\n  \\\'show_ruleid\\\' => \\\'\\\',\n  \\\'repeatchargedays\\\' => \\\'1\\\',\n)\',\n    \'listorder\' => \'0\',\n    \'ismenu\' => \'1\',\n    \'ishelp\' => \'0\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => NULL,\n    \'ishtml\' => NULL,\n    \'content_ishtml\' => NULL,\n    \'category_ruleid\' => NULL,\n    \'show_ruleid\' => \'\',\n    \'workflowid\' => NULL,\n    \'isdomain\' => \'0\',\n  ),\n  2 => \n  array (\n    \'catid\' => \'2\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'1\',\n    \'parentid\' => \'0\',\n    \'arrparentid\' => \'0\',\n    \'child\' => \'1\',\n    \'arrchildid\' => \'2,7,8,9\',\n    \'catname\' => \'新闻中心\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'\',\n    \'catdir\' => \'news\',\n    \'url\' => \'http://www.hc.com/index.php?m=content&c=index&a=lists&catid=2\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'array (\n  \\\'workflowid\\\' => \\\'\\\',\n  \\\'ishtml\\\' => \\\'0\\\',\n  \\\'content_ishtml\\\' => \\\'0\\\',\n  \\\'create_to_html_root\\\' => \\\'0\\\',\n  \\\'template_list\\\' => \\\'hucai\\\',\n  \\\'category_template\\\' => \\\'category_news\\\',\n  \\\'list_template\\\' => \\\'list_news\\\',\n  \\\'show_template\\\' => \\\'show_news\\\',\n  \\\'meta_title\\\' => \\\'\\\',\n  \\\'meta_keywords\\\' => \\\'\\\',\n  \\\'meta_description\\\' => \\\'\\\',\n  \\\'presentpoint\\\' => \\\'1\\\',\n  \\\'defaultchargepoint\\\' => \\\'0\\\',\n  \\\'paytype\\\' => \\\'0\\\',\n  \\\'repeatchargedays\\\' => \\\'1\\\',\n  \\\'category_ruleid\\\' => \\\'6\\\',\n  \\\'show_ruleid\\\' => \\\'16\\\',\n)\',\n    \'listorder\' => \'1\',\n    \'ismenu\' => \'1\',\n    \'ishelp\' => \'0\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'xinwenzhongxin\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'0\',\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => \'0\',\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'16\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n  1 => \n  array (\n    \'catid\' => \'1\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'12\',\n    \'parentid\' => \'0\',\n    \'arrparentid\' => \'0\',\n    \'child\' => \'1\',\n    \'arrchildid\' => \'1,10,16,17,18,11,19,12,20,21,22,13,23,24,25,26,14,27,28,15,29,30,31\',\n    \'catname\' => \'印艺产品\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'\',\n    \'catdir\' => \'products\',\n    \'url\' => \'http://www.hc.com/index.php?m=content&c=index&a=lists&catid=1\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'array (\n  \\\'workflowid\\\' => \\\'\\\',\n  \\\'ishtml\\\' => \\\'0\\\',\n  \\\'content_ishtml\\\' => \\\'0\\\',\n  \\\'create_to_html_root\\\' => \\\'0\\\',\n  \\\'template_list\\\' => \\\'hucai\\\',\n  \\\'category_template\\\' => \\\'category_product\\\',\n  \\\'list_template\\\' => \\\'list_product\\\',\n  \\\'show_template\\\' => \\\'show_product\\\',\n  \\\'meta_title\\\' => \\\'\\\',\n  \\\'meta_keywords\\\' => \\\'\\\',\n  \\\'meta_description\\\' => \\\'\\\',\n  \\\'presentpoint\\\' => \\\'1\\\',\n  \\\'defaultchargepoint\\\' => \\\'0\\\',\n  \\\'paytype\\\' => \\\'0\\\',\n  \\\'repeatchargedays\\\' => \\\'1\\\',\n  \\\'category_ruleid\\\' => \\\'6\\\',\n  \\\'show_ruleid\\\' => \\\'16\\\',\n)\',\n    \'listorder\' => \'2\',\n    \'ismenu\' => \'1\',\n    \'ishelp\' => \'0\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'yinyichanpin\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'0\',\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => \'0\',\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'16\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n  3 => \n  array (\n    \'catid\' => \'3\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'1\',\n    \'parentid\' => \'0\',\n    \'arrparentid\' => \'0\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'3\',\n    \'catname\' => \'解决方案\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'\',\n    \'catdir\' => \'case\',\n    \'url\' => \'http://www.hc.com/index.php?m=content&c=index&a=lists&catid=3\',\n    \'items\' => \'2\',\n    \'hits\' => \'0\',\n    \'setting\' => \'array (\n  \\\'workflowid\\\' => \\\'\\\',\n  \\\'ishtml\\\' => \\\'0\\\',\n  \\\'content_ishtml\\\' => \\\'0\\\',\n  \\\'create_to_html_root\\\' => \\\'0\\\',\n  \\\'template_list\\\' => \\\'hucai\\\',\n  \\\'category_template\\\' => \\\'category_solutions\\\',\n  \\\'list_template\\\' => \\\'list_solutions\\\',\n  \\\'show_template\\\' => \\\'show_solutions\\\',\n  \\\'meta_title\\\' => \\\'\\\',\n  \\\'meta_keywords\\\' => \\\'\\\',\n  \\\'meta_description\\\' => \\\'\\\',\n  \\\'presentpoint\\\' => \\\'1\\\',\n  \\\'defaultchargepoint\\\' => \\\'0\\\',\n  \\\'paytype\\\' => \\\'0\\\',\n  \\\'repeatchargedays\\\' => \\\'1\\\',\n  \\\'category_ruleid\\\' => \\\'6\\\',\n  \\\'show_ruleid\\\' => \\\'16\\\',\n)\',\n    \'listorder\' => \'3\',\n    \'ismenu\' => \'1\',\n    \'ishelp\' => \'0\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'jiejuefangan\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'0\',\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => \'0\',\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'16\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n  4 => \n  array (\n    \'catid\' => \'4\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'16\',\n    \'parentid\' => \'0\',\n    \'arrparentid\' => \'0\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'4\',\n    \'catname\' => \'线上定制\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'\',\n    \'catdir\' => \'dingzhi\',\n    \'url\' => \'http://www.hc.com/html/dingzhi/\',\n    \'items\' => \'3\',\n    \'hits\' => \'0\',\n    \'setting\' => \'array (\n  \\\'workflowid\\\' => \\\'\\\',\n  \\\'ishtml\\\' => \\\'1\\\',\n  \\\'content_ishtml\\\' => \\\'1\\\',\n  \\\'create_to_html_root\\\' => \\\'0\\\',\n  \\\'template_list\\\' => \\\'hucai\\\',\n  \\\'category_template\\\' => \\\'category_custom\\\',\n  \\\'list_template\\\' => \\\'list_custom\\\',\n  \\\'show_template\\\' => \\\'show_custom\\\',\n  \\\'meta_title\\\' => \\\'\\\',\n  \\\'meta_keywords\\\' => \\\'\\\',\n  \\\'meta_description\\\' => \\\'\\\',\n  \\\'presentpoint\\\' => \\\'1\\\',\n  \\\'defaultchargepoint\\\' => \\\'0\\\',\n  \\\'paytype\\\' => \\\'0\\\',\n  \\\'repeatchargedays\\\' => \\\'1\\\',\n  \\\'category_ruleid\\\' => \\\'1\\\',\n  \\\'show_ruleid\\\' => \\\'11\\\',\n)\',\n    \'listorder\' => \'4\',\n    \'ismenu\' => \'1\',\n    \'ishelp\' => \'0\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'xianshangdingzhi\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'0\',\n    \'ishtml\' => \'1\',\n    \'content_ishtml\' => \'1\',\n    \'category_ruleid\' => \'1\',\n    \'show_ruleid\' => \'11\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n  5 => \n  array (\n    \'catid\' => \'5\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'1\',\n    \'parentid\' => \'0\',\n    \'arrparentid\' => \'0\',\n    \'child\' => \'1\',\n    \'arrchildid\' => \'5,65\',\n    \'catname\' => \'服务支持\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'\',\n    \'catdir\' => \'service\',\n    \'url\' => \'http://www.hc.com/index.php?m=content&c=index&a=lists&catid=5\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'array (\n  \\\'workflowid\\\' => \\\'\\\',\n  \\\'ishtml\\\' => \\\'0\\\',\n  \\\'content_ishtml\\\' => \\\'0\\\',\n  \\\'create_to_html_root\\\' => \\\'0\\\',\n  \\\'template_list\\\' => \\\'hucai\\\',\n  \\\'category_template\\\' => \\\'category\\\',\n  \\\'list_template\\\' => \\\'list\\\',\n  \\\'show_template\\\' => \\\'show\\\',\n  \\\'meta_title\\\' => \\\'\\\',\n  \\\'meta_keywords\\\' => \\\'\\\',\n  \\\'meta_description\\\' => \\\'\\\',\n  \\\'presentpoint\\\' => \\\'1\\\',\n  \\\'defaultchargepoint\\\' => \\\'0\\\',\n  \\\'paytype\\\' => \\\'0\\\',\n  \\\'repeatchargedays\\\' => \\\'1\\\',\n  \\\'category_ruleid\\\' => \\\'6\\\',\n  \\\'show_ruleid\\\' => \\\'16\\\',\n)\',\n    \'listorder\' => \'5\',\n    \'ismenu\' => \'1\',\n    \'ishelp\' => \'0\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'fuwuzhichi\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'0\',\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => \'0\',\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'16\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n  6 => \n  array (\n    \'catid\' => \'6\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'15\',\n    \'parentid\' => \'0\',\n    \'arrparentid\' => \'0\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'6\',\n    \'catname\' => \'品牌活动\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'\',\n    \'catdir\' => \'brand\',\n    \'url\' => \'http://www.hc.com/index.php?m=content&c=index&a=lists&catid=6\',\n    \'items\' => \'3\',\n    \'hits\' => \'0\',\n    \'setting\' => \'array (\n  \\\'workflowid\\\' => \\\'\\\',\n  \\\'ishtml\\\' => \\\'0\\\',\n  \\\'content_ishtml\\\' => \\\'1\\\',\n  \\\'create_to_html_root\\\' => \\\'0\\\',\n  \\\'template_list\\\' => \\\'hucai\\\',\n  \\\'category_template\\\' => \\\'category_brand\\\',\n  \\\'list_template\\\' => \\\'list_brand\\\',\n  \\\'show_template\\\' => \\\'show_brand\\\',\n  \\\'meta_title\\\' => \\\'\\\',\n  \\\'meta_keywords\\\' => \\\'\\\',\n  \\\'meta_description\\\' => \\\'\\\',\n  \\\'presentpoint\\\' => \\\'1\\\',\n  \\\'defaultchargepoint\\\' => \\\'0\\\',\n  \\\'paytype\\\' => \\\'0\\\',\n  \\\'repeatchargedays\\\' => \\\'1\\\',\n  \\\'category_ruleid\\\' => \\\'6\\\',\n  \\\'show_ruleid\\\' => \\\'11\\\',\n)\',\n    \'listorder\' => \'6\',\n    \'ismenu\' => \'1\',\n    \'ishelp\' => \'0\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'pinpaihuodong\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'0\',\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => \'1\',\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'11\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n  7 => \n  array (\n    \'catid\' => \'7\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'1\',\n    \'parentid\' => \'2\',\n    \'arrparentid\' => \'0,2\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'7\',\n    \'catname\' => \'行业洞察\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'news/\',\n    \'catdir\' => \'hangye\',\n    \'url\' => \'http://www.hc.com/index.php?m=content&c=index&a=lists&catid=7\',\n    \'items\' => \'5\',\n    \'hits\' => \'0\',\n    \'setting\' => \'array (\n  \\\'workflowid\\\' => \\\'\\\',\n  \\\'ishtml\\\' => \\\'0\\\',\n  \\\'content_ishtml\\\' => \\\'0\\\',\n  \\\'create_to_html_root\\\' => \\\'0\\\',\n  \\\'template_list\\\' => \\\'hucai\\\',\n  \\\'category_template\\\' => \\\'category_news\\\',\n  \\\'list_template\\\' => \\\'list_news\\\',\n  \\\'show_template\\\' => \\\'show_news\\\',\n  \\\'meta_title\\\' => \\\'\\\',\n  \\\'meta_keywords\\\' => \\\'\\\',\n  \\\'meta_description\\\' => \\\'\\\',\n  \\\'presentpoint\\\' => \\\'1\\\',\n  \\\'defaultchargepoint\\\' => \\\'0\\\',\n  \\\'paytype\\\' => \\\'0\\\',\n  \\\'repeatchargedays\\\' => \\\'1\\\',\n  \\\'category_ruleid\\\' => \\\'6\\\',\n  \\\'show_ruleid\\\' => \\\'16\\\',\n)\',\n    \'listorder\' => \'7\',\n    \'ismenu\' => \'0\',\n    \'ishelp\' => \'0\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'xingyedongcha\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'0\',\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => \'0\',\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'16\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n  8 => \n  array (\n    \'catid\' => \'8\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'1\',\n    \'parentid\' => \'2\',\n    \'arrparentid\' => \'0,2\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'8\',\n    \'catname\' => \'虎彩新闻\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'news/\',\n    \'catdir\' => \'HucaiNews\',\n    \'url\' => \'http://www.hc.com/index.php?m=content&c=index&a=lists&catid=8\',\n    \'items\' => \'4\',\n    \'hits\' => \'0\',\n    \'setting\' => \'array (\n  \\\'workflowid\\\' => \\\'\\\',\n  \\\'ishtml\\\' => \\\'0\\\',\n  \\\'content_ishtml\\\' => \\\'0\\\',\n  \\\'create_to_html_root\\\' => \\\'0\\\',\n  \\\'template_list\\\' => \\\'hucai\\\',\n  \\\'category_template\\\' => \\\'category_news\\\',\n  \\\'list_template\\\' => \\\'list_news\\\',\n  \\\'show_template\\\' => \\\'show_news\\\',\n  \\\'meta_title\\\' => \\\'\\\',\n  \\\'meta_keywords\\\' => \\\'\\\',\n  \\\'meta_description\\\' => \\\'\\\',\n  \\\'presentpoint\\\' => \\\'1\\\',\n  \\\'defaultchargepoint\\\' => \\\'0\\\',\n  \\\'paytype\\\' => \\\'0\\\',\n  \\\'repeatchargedays\\\' => \\\'1\\\',\n  \\\'category_ruleid\\\' => \\\'6\\\',\n  \\\'show_ruleid\\\' => \\\'16\\\',\n)\',\n    \'listorder\' => \'8\',\n    \'ismenu\' => \'0\',\n    \'ishelp\' => \'0\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'hucaixinwen\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'0\',\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => \'0\',\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'16\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n  9 => \n  array (\n    \'catid\' => \'9\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'1\',\n    \'parentid\' => \'2\',\n    \'arrparentid\' => \'0,2\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'9\',\n    \'catname\' => \'产品动态\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'news/\',\n    \'catdir\' => \'ProductNews\',\n    \'url\' => \'http://www.hc.com/index.php?m=content&c=index&a=lists&catid=9\',\n    \'items\' => \'4\',\n    \'hits\' => \'0\',\n    \'setting\' => \'array (\n  \\\'workflowid\\\' => \\\'\\\',\n  \\\'ishtml\\\' => \\\'0\\\',\n  \\\'content_ishtml\\\' => \\\'0\\\',\n  \\\'create_to_html_root\\\' => \\\'0\\\',\n  \\\'template_list\\\' => \\\'hucai\\\',\n  \\\'category_template\\\' => \\\'category_news\\\',\n  \\\'list_template\\\' => \\\'list_news\\\',\n  \\\'show_template\\\' => \\\'show_news\\\',\n  \\\'meta_title\\\' => \\\'\\\',\n  \\\'meta_keywords\\\' => \\\'\\\',\n  \\\'meta_description\\\' => \\\'\\\',\n  \\\'presentpoint\\\' => \\\'1\\\',\n  \\\'defaultchargepoint\\\' => \\\'0\\\',\n  \\\'paytype\\\' => \\\'0\\\',\n  \\\'repeatchargedays\\\' => \\\'1\\\',\n  \\\'category_ruleid\\\' => \\\'6\\\',\n  \\\'show_ruleid\\\' => \\\'16\\\',\n)\',\n    \'listorder\' => \'9\',\n    \'ismenu\' => \'0\',\n    \'ishelp\' => \'0\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'chanpindongtai\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'0\',\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => \'0\',\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'16\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n  10 => \n  array (\n    \'catid\' => \'10\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'12\',\n    \'parentid\' => \'1\',\n    \'arrparentid\' => \'0,1\',\n    \'child\' => \'1\',\n    \'arrchildid\' => \'10,16,17,18\',\n    \'catname\' => \'高端印品\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'products/\',\n    \'catdir\' => \'gaoduanyinpin\',\n    \'url\' => \'http://www.hc.com/index.php?m=content&c=index&a=lists&catid=10\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'array (\n  \\\'workflowid\\\' => \\\'\\\',\n  \\\'ishtml\\\' => \\\'0\\\',\n  \\\'content_ishtml\\\' => \\\'0\\\',\n  \\\'create_to_html_root\\\' => \\\'0\\\',\n  \\\'template_list\\\' => \\\'hucai\\\',\n  \\\'category_template\\\' => \\\'category_product1\\\',\n  \\\'list_template\\\' => \\\'list_product\\\',\n  \\\'show_template\\\' => \\\'show_product\\\',\n  \\\'meta_title\\\' => \\\'\\\',\n  \\\'meta_keywords\\\' => \\\'\\\',\n  \\\'meta_description\\\' => \\\'\\\',\n  \\\'presentpoint\\\' => \\\'1\\\',\n  \\\'defaultchargepoint\\\' => \\\'0\\\',\n  \\\'paytype\\\' => \\\'0\\\',\n  \\\'repeatchargedays\\\' => \\\'1\\\',\n  \\\'category_ruleid\\\' => \\\'6\\\',\n  \\\'show_ruleid\\\' => \\\'16\\\',\n)\',\n    \'listorder\' => \'10\',\n    \'ismenu\' => \'1\',\n    \'ishelp\' => \'0\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'gaoduanyinpin\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'0\',\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => \'0\',\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'16\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n  11 => \n  array (\n    \'catid\' => \'11\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'12\',\n    \'parentid\' => \'1\',\n    \'arrparentid\' => \'0,1\',\n    \'child\' => \'1\',\n    \'arrchildid\' => \'11,19\',\n    \'catname\' => \'创新印品\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'products/\',\n    \'catdir\' => \'chuangxinyinpin\',\n    \'url\' => \'http://www.hc.com/index.php?m=content&c=index&a=lists&catid=11\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'array (\n  \\\'workflowid\\\' => \\\'\\\',\n  \\\'ishtml\\\' => \\\'0\\\',\n  \\\'content_ishtml\\\' => \\\'0\\\',\n  \\\'create_to_html_root\\\' => \\\'0\\\',\n  \\\'template_list\\\' => \\\'hucai\\\',\n  \\\'category_template\\\' => \\\'category_product1\\\',\n  \\\'list_template\\\' => \\\'list_product\\\',\n  \\\'show_template\\\' => \\\'show_product\\\',\n  \\\'meta_title\\\' => \\\'\\\',\n  \\\'meta_keywords\\\' => \\\'\\\',\n  \\\'meta_description\\\' => \\\'\\\',\n  \\\'presentpoint\\\' => \\\'1\\\',\n  \\\'defaultchargepoint\\\' => \\\'0\\\',\n  \\\'paytype\\\' => \\\'0\\\',\n  \\\'repeatchargedays\\\' => \\\'1\\\',\n  \\\'category_ruleid\\\' => \\\'6\\\',\n  \\\'show_ruleid\\\' => \\\'16\\\',\n)\',\n    \'listorder\' => \'11\',\n    \'ismenu\' => \'1\',\n    \'ishelp\' => \'0\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'chuangxinyinpin\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'0\',\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => \'0\',\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'16\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n  12 => \n  array (\n    \'catid\' => \'12\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'12\',\n    \'parentid\' => \'1\',\n    \'arrparentid\' => \'0,1\',\n    \'child\' => \'1\',\n    \'arrchildid\' => \'12,20,21,22\',\n    \'catname\' => \'个性影像\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'products/\',\n    \'catdir\' => \'gexingyingxiang\',\n    \'url\' => \'http://www.hc.com/index.php?m=content&c=index&a=lists&catid=12\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'array (\n  \\\'workflowid\\\' => \\\'\\\',\n  \\\'ishtml\\\' => \\\'0\\\',\n  \\\'content_ishtml\\\' => \\\'0\\\',\n  \\\'create_to_html_root\\\' => \\\'0\\\',\n  \\\'template_list\\\' => \\\'hucai\\\',\n  \\\'category_template\\\' => \\\'category_product1\\\',\n  \\\'list_template\\\' => \\\'list_product\\\',\n  \\\'show_template\\\' => \\\'show_product\\\',\n  \\\'meta_title\\\' => \\\'\\\',\n  \\\'meta_keywords\\\' => \\\'\\\',\n  \\\'meta_description\\\' => \\\'\\\',\n  \\\'presentpoint\\\' => \\\'1\\\',\n  \\\'defaultchargepoint\\\' => \\\'0\\\',\n  \\\'paytype\\\' => \\\'0\\\',\n  \\\'repeatchargedays\\\' => \\\'1\\\',\n  \\\'category_ruleid\\\' => \\\'6\\\',\n  \\\'show_ruleid\\\' => \\\'16\\\',\n)\',\n    \'listorder\' => \'12\',\n    \'ismenu\' => \'1\',\n    \'ishelp\' => \'0\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'gexingyingxiang\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'0\',\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => \'0\',\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'16\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n  13 => \n  array (\n    \'catid\' => \'13\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'12\',\n    \'parentid\' => \'1\',\n    \'arrparentid\' => \'0,1\',\n    \'child\' => \'1\',\n    \'arrchildid\' => \'13,23,24,25,26\',\n    \'catname\' => \'个性包装\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'products/\',\n    \'catdir\' => \'gexingbaozhuang\',\n    \'url\' => \'http://www.hc.com/index.php?m=content&c=index&a=lists&catid=13\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'array (\n  \\\'workflowid\\\' => \\\'\\\',\n  \\\'ishtml\\\' => \\\'0\\\',\n  \\\'content_ishtml\\\' => \\\'0\\\',\n  \\\'create_to_html_root\\\' => \\\'0\\\',\n  \\\'template_list\\\' => \\\'hucai\\\',\n  \\\'category_template\\\' => \\\'category_product1\\\',\n  \\\'list_template\\\' => \\\'list_product\\\',\n  \\\'show_template\\\' => \\\'show_product\\\',\n  \\\'meta_title\\\' => \\\'\\\',\n  \\\'meta_keywords\\\' => \\\'\\\',\n  \\\'meta_description\\\' => \\\'\\\',\n  \\\'presentpoint\\\' => \\\'1\\\',\n  \\\'defaultchargepoint\\\' => \\\'0\\\',\n  \\\'paytype\\\' => \\\'0\\\',\n  \\\'repeatchargedays\\\' => \\\'1\\\',\n  \\\'category_ruleid\\\' => \\\'6\\\',\n  \\\'show_ruleid\\\' => \\\'16\\\',\n)\',\n    \'listorder\' => \'13\',\n    \'ismenu\' => \'1\',\n    \'ishelp\' => \'0\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'gexingbaozhuang\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'0\',\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => \'0\',\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'16\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n  14 => \n  array (\n    \'catid\' => \'14\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'12\',\n    \'parentid\' => \'1\',\n    \'arrparentid\' => \'0,1\',\n    \'child\' => \'1\',\n    \'arrchildid\' => \'14,27,28\',\n    \'catname\' => \'按需印刷\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'products/\',\n    \'catdir\' => \'anxuyinshua\',\n    \'url\' => \'http://www.hc.com/index.php?m=content&c=index&a=lists&catid=14\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'array (\n  \\\'workflowid\\\' => \\\'\\\',\n  \\\'ishtml\\\' => \\\'0\\\',\n  \\\'content_ishtml\\\' => \\\'0\\\',\n  \\\'create_to_html_root\\\' => \\\'0\\\',\n  \\\'template_list\\\' => \\\'hucai\\\',\n  \\\'category_template\\\' => \\\'category_product1\\\',\n  \\\'list_template\\\' => \\\'list_product\\\',\n  \\\'show_template\\\' => \\\'show_product\\\',\n  \\\'meta_title\\\' => \\\'\\\',\n  \\\'meta_keywords\\\' => \\\'\\\',\n  \\\'meta_description\\\' => \\\'\\\',\n  \\\'presentpoint\\\' => \\\'1\\\',\n  \\\'defaultchargepoint\\\' => \\\'0\\\',\n  \\\'paytype\\\' => \\\'0\\\',\n  \\\'repeatchargedays\\\' => \\\'1\\\',\n  \\\'category_ruleid\\\' => \\\'6\\\',\n  \\\'show_ruleid\\\' => \\\'16\\\',\n)\',\n    \'listorder\' => \'14\',\n    \'ismenu\' => \'1\',\n    \'ishelp\' => \'0\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'anxuyinshua\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'0\',\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => \'0\',\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'16\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n  15 => \n  array (\n    \'catid\' => \'15\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'12\',\n    \'parentid\' => \'1\',\n    \'arrparentid\' => \'0,1\',\n    \'child\' => \'1\',\n    \'arrchildid\' => \'15,29,30,31\',\n    \'catname\' => \'镭射防伪\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'products/\',\n    \'catdir\' => \'leishefangwei\',\n    \'url\' => \'http://www.hc.com/index.php?m=content&c=index&a=lists&catid=15\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'array (\n  \\\'workflowid\\\' => \\\'\\\',\n  \\\'ishtml\\\' => \\\'0\\\',\n  \\\'content_ishtml\\\' => \\\'0\\\',\n  \\\'create_to_html_root\\\' => \\\'0\\\',\n  \\\'template_list\\\' => \\\'hucai\\\',\n  \\\'category_template\\\' => \\\'category_product1\\\',\n  \\\'list_template\\\' => \\\'list_product\\\',\n  \\\'show_template\\\' => \\\'show_product\\\',\n  \\\'meta_title\\\' => \\\'\\\',\n  \\\'meta_keywords\\\' => \\\'\\\',\n  \\\'meta_description\\\' => \\\'\\\',\n  \\\'presentpoint\\\' => \\\'1\\\',\n  \\\'defaultchargepoint\\\' => \\\'0\\\',\n  \\\'paytype\\\' => \\\'0\\\',\n  \\\'repeatchargedays\\\' => \\\'1\\\',\n  \\\'category_ruleid\\\' => \\\'6\\\',\n  \\\'show_ruleid\\\' => \\\'16\\\',\n)\',\n    \'listorder\' => \'15\',\n    \'ismenu\' => \'1\',\n    \'ishelp\' => \'0\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'leishefangwei\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'0\',\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => \'0\',\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'16\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n  16 => \n  array (\n    \'catid\' => \'16\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'12\',\n    \'parentid\' => \'10\',\n    \'arrparentid\' => \'0,1,10\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'16\',\n    \'catname\' => \'高端烟包\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'products/gaoduanyinpin/\',\n    \'catdir\' => \'gaoduanyanbao\',\n    \'url\' => \'http://www.hc.com/index.php?m=content&c=index&a=lists&catid=16\',\n    \'items\' => \'1\',\n    \'hits\' => \'0\',\n    \'setting\' => \'array (\n  \\\'workflowid\\\' => \\\'\\\',\n  \\\'ishtml\\\' => \\\'0\\\',\n  \\\'content_ishtml\\\' => \\\'0\\\',\n  \\\'create_to_html_root\\\' => \\\'0\\\',\n  \\\'template_list\\\' => \\\'hucai\\\',\n  \\\'category_template\\\' => \\\'category_product\\\',\n  \\\'list_template\\\' => \\\'list_product\\\',\n  \\\'show_template\\\' => \\\'show_product\\\',\n  \\\'meta_title\\\' => \\\'\\\',\n  \\\'meta_keywords\\\' => \\\'\\\',\n  \\\'meta_description\\\' => \\\'\\\',\n  \\\'presentpoint\\\' => \\\'1\\\',\n  \\\'defaultchargepoint\\\' => \\\'0\\\',\n  \\\'paytype\\\' => \\\'0\\\',\n  \\\'repeatchargedays\\\' => \\\'1\\\',\n  \\\'category_ruleid\\\' => \\\'6\\\',\n  \\\'show_ruleid\\\' => \\\'16\\\',\n)\',\n    \'listorder\' => \'16\',\n    \'ismenu\' => \'1\',\n    \'ishelp\' => \'0\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'gaoduanyanbao\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'0\',\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => \'0\',\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'16\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n  17 => \n  array (\n    \'catid\' => \'17\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'12\',\n    \'parentid\' => \'10\',\n    \'arrparentid\' => \'0,1,10\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'17\',\n    \'catname\' => \'酒包\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'products/gaoduanyinpin/\',\n    \'catdir\' => \'jiubao\',\n    \'url\' => \'http://www.hc.com/index.php?m=content&c=index&a=lists&catid=17\',\n    \'items\' => \'2\',\n    \'hits\' => \'0\',\n    \'setting\' => \'array (\n  \\\'workflowid\\\' => \\\'\\\',\n  \\\'ishtml\\\' => \\\'0\\\',\n  \\\'content_ishtml\\\' => \\\'0\\\',\n  \\\'create_to_html_root\\\' => \\\'0\\\',\n  \\\'template_list\\\' => \\\'hucai\\\',\n  \\\'category_template\\\' => \\\'category_product\\\',\n  \\\'list_template\\\' => \\\'list_product\\\',\n  \\\'show_template\\\' => \\\'show_product\\\',\n  \\\'meta_title\\\' => \\\'\\\',\n  \\\'meta_keywords\\\' => \\\'\\\',\n  \\\'meta_description\\\' => \\\'\\\',\n  \\\'presentpoint\\\' => \\\'1\\\',\n  \\\'defaultchargepoint\\\' => \\\'0\\\',\n  \\\'paytype\\\' => \\\'0\\\',\n  \\\'repeatchargedays\\\' => \\\'1\\\',\n  \\\'category_ruleid\\\' => \\\'6\\\',\n  \\\'show_ruleid\\\' => \\\'16\\\',\n)\',\n    \'listorder\' => \'17\',\n    \'ismenu\' => \'1\',\n    \'ishelp\' => \'0\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'jiubao\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'0\',\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => \'0\',\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'16\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n  18 => \n  array (\n    \'catid\' => \'18\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'12\',\n    \'parentid\' => \'10\',\n    \'arrparentid\' => \'0,1,10\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'18\',\n    \'catname\' => \'礼盒\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'products/gaoduanyinpin/\',\n    \'catdir\' => \'lihe\',\n    \'url\' => \'http://www.hc.com/index.php?m=content&c=index&a=lists&catid=18\',\n    \'items\' => \'1\',\n    \'hits\' => \'0\',\n    \'setting\' => \'array (\n  \\\'workflowid\\\' => \\\'\\\',\n  \\\'ishtml\\\' => \\\'0\\\',\n  \\\'content_ishtml\\\' => \\\'0\\\',\n  \\\'create_to_html_root\\\' => \\\'0\\\',\n  \\\'template_list\\\' => \\\'hucai\\\',\n  \\\'category_template\\\' => \\\'category_product\\\',\n  \\\'list_template\\\' => \\\'list_product\\\',\n  \\\'show_template\\\' => \\\'show_product\\\',\n  \\\'meta_title\\\' => \\\'\\\',\n  \\\'meta_keywords\\\' => \\\'\\\',\n  \\\'meta_description\\\' => \\\'\\\',\n  \\\'presentpoint\\\' => \\\'1\\\',\n  \\\'defaultchargepoint\\\' => \\\'0\\\',\n  \\\'paytype\\\' => \\\'0\\\',\n  \\\'repeatchargedays\\\' => \\\'1\\\',\n  \\\'category_ruleid\\\' => \\\'6\\\',\n  \\\'show_ruleid\\\' => \\\'16\\\',\n)\',\n    \'listorder\' => \'18\',\n    \'ismenu\' => \'1\',\n    \'ishelp\' => \'0\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'lihe\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'0\',\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => \'0\',\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'16\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n  19 => \n  array (\n    \'catid\' => \'19\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'12\',\n    \'parentid\' => \'11\',\n    \'arrparentid\' => \'0,1,11\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'19\',\n    \'catname\' => \'3D印刷\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'products/chuangxinyinpin/\',\n    \'catdir\' => \'3dyinshua\',\n    \'url\' => \'http://www.hc.com/index.php?m=content&c=index&a=lists&catid=19\',\n    \'items\' => \'1\',\n    \'hits\' => \'0\',\n    \'setting\' => \'array (\n  \\\'workflowid\\\' => \\\'\\\',\n  \\\'ishtml\\\' => \\\'0\\\',\n  \\\'content_ishtml\\\' => \\\'0\\\',\n  \\\'create_to_html_root\\\' => \\\'0\\\',\n  \\\'template_list\\\' => \\\'hucai\\\',\n  \\\'category_template\\\' => \\\'category_product\\\',\n  \\\'list_template\\\' => \\\'list_product\\\',\n  \\\'show_template\\\' => \\\'show_product\\\',\n  \\\'meta_title\\\' => \\\'\\\',\n  \\\'meta_keywords\\\' => \\\'\\\',\n  \\\'meta_description\\\' => \\\'\\\',\n  \\\'presentpoint\\\' => \\\'1\\\',\n  \\\'defaultchargepoint\\\' => \\\'0\\\',\n  \\\'paytype\\\' => \\\'0\\\',\n  \\\'repeatchargedays\\\' => \\\'1\\\',\n  \\\'category_ruleid\\\' => \\\'6\\\',\n  \\\'show_ruleid\\\' => \\\'16\\\',\n)\',\n    \'listorder\' => \'19\',\n    \'ismenu\' => \'1\',\n    \'ishelp\' => \'0\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'3dyinshua\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'0\',\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => \'0\',\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'16\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n  20 => \n  array (\n    \'catid\' => \'20\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'12\',\n    \'parentid\' => \'12\',\n    \'arrparentid\' => \'0,1,12\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'20\',\n    \'catname\' => \'婚纱相册\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'products/gexingyingxiang/\',\n    \'catdir\' => \'hunshaxiangce\',\n    \'url\' => \'http://www.hc.com/index.php?m=content&c=index&a=lists&catid=20\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'array (\n  \\\'workflowid\\\' => \\\'\\\',\n  \\\'ishtml\\\' => \\\'0\\\',\n  \\\'content_ishtml\\\' => \\\'0\\\',\n  \\\'create_to_html_root\\\' => \\\'0\\\',\n  \\\'template_list\\\' => \\\'hucai\\\',\n  \\\'category_template\\\' => \\\'category_product\\\',\n  \\\'list_template\\\' => \\\'list_product\\\',\n  \\\'show_template\\\' => \\\'show_product\\\',\n  \\\'meta_title\\\' => \\\'\\\',\n  \\\'meta_keywords\\\' => \\\'\\\',\n  \\\'meta_description\\\' => \\\'\\\',\n  \\\'presentpoint\\\' => \\\'1\\\',\n  \\\'defaultchargepoint\\\' => \\\'0\\\',\n  \\\'paytype\\\' => \\\'0\\\',\n  \\\'repeatchargedays\\\' => \\\'1\\\',\n  \\\'category_ruleid\\\' => \\\'6\\\',\n  \\\'show_ruleid\\\' => \\\'16\\\',\n)\',\n    \'listorder\' => \'20\',\n    \'ismenu\' => \'1\',\n    \'ishelp\' => \'0\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'hunshaxiangce\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'0\',\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => \'0\',\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'16\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n  21 => \n  array (\n    \'catid\' => \'21\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'12\',\n    \'parentid\' => \'12\',\n    \'arrparentid\' => \'0,1,12\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'21\',\n    \'catname\' => \'个人相册\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'products/gexingyingxiang/\',\n    \'catdir\' => \'gerenxiangce\',\n    \'url\' => \'http://www.hc.com/index.php?m=content&c=index&a=lists&catid=21\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'array (\n  \\\'workflowid\\\' => \\\'\\\',\n  \\\'ishtml\\\' => \\\'0\\\',\n  \\\'content_ishtml\\\' => \\\'0\\\',\n  \\\'create_to_html_root\\\' => \\\'0\\\',\n  \\\'template_list\\\' => \\\'hucai\\\',\n  \\\'category_template\\\' => \\\'category_product\\\',\n  \\\'list_template\\\' => \\\'list_product\\\',\n  \\\'show_template\\\' => \\\'show_product\\\',\n  \\\'meta_title\\\' => \\\'\\\',\n  \\\'meta_keywords\\\' => \\\'\\\',\n  \\\'meta_description\\\' => \\\'\\\',\n  \\\'presentpoint\\\' => \\\'1\\\',\n  \\\'defaultchargepoint\\\' => \\\'0\\\',\n  \\\'paytype\\\' => \\\'0\\\',\n  \\\'repeatchargedays\\\' => \\\'1\\\',\n  \\\'category_ruleid\\\' => \\\'6\\\',\n  \\\'show_ruleid\\\' => \\\'16\\\',\n)\',\n    \'listorder\' => \'21\',\n    \'ismenu\' => \'1\',\n    \'ishelp\' => \'0\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'gerenxiangce\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'0\',\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => \'0\',\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'16\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n  22 => \n  array (\n    \'catid\' => \'22\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'12\',\n    \'parentid\' => \'12\',\n    \'arrparentid\' => \'0,1,12\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'22\',\n    \'catname\' => \'照片书\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'products/gexingyingxiang/\',\n    \'catdir\' => \'zhaopianshu\',\n    \'url\' => \'http://www.hc.com/index.php?m=content&c=index&a=lists&catid=22\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'array (\n  \\\'workflowid\\\' => \\\'\\\',\n  \\\'ishtml\\\' => \\\'0\\\',\n  \\\'content_ishtml\\\' => \\\'0\\\',\n  \\\'create_to_html_root\\\' => \\\'0\\\',\n  \\\'template_list\\\' => \\\'hucai\\\',\n  \\\'category_template\\\' => \\\'category_product\\\',\n  \\\'list_template\\\' => \\\'list_product\\\',\n  \\\'show_template\\\' => \\\'show_product\\\',\n  \\\'meta_title\\\' => \\\'\\\',\n  \\\'meta_keywords\\\' => \\\'\\\',\n  \\\'meta_description\\\' => \\\'\\\',\n  \\\'presentpoint\\\' => \\\'1\\\',\n  \\\'defaultchargepoint\\\' => \\\'0\\\',\n  \\\'paytype\\\' => \\\'0\\\',\n  \\\'repeatchargedays\\\' => \\\'1\\\',\n  \\\'category_ruleid\\\' => \\\'6\\\',\n  \\\'show_ruleid\\\' => \\\'16\\\',\n)\',\n    \'listorder\' => \'22\',\n    \'ismenu\' => \'1\',\n    \'ishelp\' => \'0\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'zhaopianshu\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'0\',\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => \'0\',\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'16\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n  23 => \n  array (\n    \'catid\' => \'23\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'12\',\n    \'parentid\' => \'13\',\n    \'arrparentid\' => \'0,1,13\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'23\',\n    \'catname\' => \'个人系列\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'products/gexingbaozhuang/\',\n    \'catdir\' => \'gerenxilie\',\n    \'url\' => \'http://www.hc.com/index.php?m=content&c=index&a=lists&catid=23\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'array (\n  \\\'workflowid\\\' => \\\'\\\',\n  \\\'ishtml\\\' => \\\'0\\\',\n  \\\'content_ishtml\\\' => \\\'0\\\',\n  \\\'create_to_html_root\\\' => \\\'0\\\',\n  \\\'template_list\\\' => \\\'hucai\\\',\n  \\\'category_template\\\' => \\\'category_product\\\',\n  \\\'list_template\\\' => \\\'list_product\\\',\n  \\\'show_template\\\' => \\\'show_product\\\',\n  \\\'meta_title\\\' => \\\'\\\',\n  \\\'meta_keywords\\\' => \\\'\\\',\n  \\\'meta_description\\\' => \\\'\\\',\n  \\\'presentpoint\\\' => \\\'1\\\',\n  \\\'defaultchargepoint\\\' => \\\'0\\\',\n  \\\'paytype\\\' => \\\'0\\\',\n  \\\'repeatchargedays\\\' => \\\'1\\\',\n  \\\'category_ruleid\\\' => \\\'6\\\',\n  \\\'show_ruleid\\\' => \\\'16\\\',\n)\',\n    \'listorder\' => \'23\',\n    \'ismenu\' => \'1\',\n    \'ishelp\' => \'0\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'gerenxilie\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'0\',\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => \'0\',\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'16\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n  24 => \n  array (\n    \'catid\' => \'24\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'12\',\n    \'parentid\' => \'13\',\n    \'arrparentid\' => \'0,1,13\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'24\',\n    \'catname\' => \'婚庆系列\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'products/gexingbaozhuang/\',\n    \'catdir\' => \'hunqingxilie\',\n    \'url\' => \'http://www.hc.com/index.php?m=content&c=index&a=lists&catid=24\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'array (\n  \\\'workflowid\\\' => \\\'\\\',\n  \\\'ishtml\\\' => \\\'0\\\',\n  \\\'content_ishtml\\\' => \\\'0\\\',\n  \\\'create_to_html_root\\\' => \\\'0\\\',\n  \\\'template_list\\\' => \\\'hucai\\\',\n  \\\'category_template\\\' => \\\'category_product\\\',\n  \\\'list_template\\\' => \\\'list_product\\\',\n  \\\'show_template\\\' => \\\'show_product\\\',\n  \\\'meta_title\\\' => \\\'\\\',\n  \\\'meta_keywords\\\' => \\\'\\\',\n  \\\'meta_description\\\' => \\\'\\\',\n  \\\'presentpoint\\\' => \\\'1\\\',\n  \\\'defaultchargepoint\\\' => \\\'0\\\',\n  \\\'paytype\\\' => \\\'0\\\',\n  \\\'repeatchargedays\\\' => \\\'1\\\',\n  \\\'category_ruleid\\\' => \\\'6\\\',\n  \\\'show_ruleid\\\' => \\\'16\\\',\n)\',\n    \'listorder\' => \'24\',\n    \'ismenu\' => \'1\',\n    \'ishelp\' => \'0\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'hunqingxilie\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'0\',\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => \'0\',\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'16\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n  25 => \n  array (\n    \'catid\' => \'25\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'12\',\n    \'parentid\' => \'13\',\n    \'arrparentid\' => \'0,1,13\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'25\',\n    \'catname\' => \'生日系列\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'products/gexingbaozhuang/\',\n    \'catdir\' => \'shengrixilie\',\n    \'url\' => \'http://www.hc.com/index.php?m=content&c=index&a=lists&catid=25\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'array (\n  \\\'workflowid\\\' => \\\'\\\',\n  \\\'ishtml\\\' => \\\'0\\\',\n  \\\'content_ishtml\\\' => \\\'0\\\',\n  \\\'create_to_html_root\\\' => \\\'0\\\',\n  \\\'template_list\\\' => \\\'hucai\\\',\n  \\\'category_template\\\' => \\\'category_product\\\',\n  \\\'list_template\\\' => \\\'list_product\\\',\n  \\\'show_template\\\' => \\\'show_product\\\',\n  \\\'meta_title\\\' => \\\'\\\',\n  \\\'meta_keywords\\\' => \\\'\\\',\n  \\\'meta_description\\\' => \\\'\\\',\n  \\\'presentpoint\\\' => \\\'1\\\',\n  \\\'defaultchargepoint\\\' => \\\'0\\\',\n  \\\'paytype\\\' => \\\'0\\\',\n  \\\'repeatchargedays\\\' => \\\'1\\\',\n  \\\'category_ruleid\\\' => \\\'6\\\',\n  \\\'show_ruleid\\\' => \\\'16\\\',\n)\',\n    \'listorder\' => \'25\',\n    \'ismenu\' => \'1\',\n    \'ishelp\' => \'0\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'shengrixilie\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'0\',\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => \'0\',\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'16\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n  26 => \n  array (\n    \'catid\' => \'26\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'12\',\n    \'parentid\' => \'13\',\n    \'arrparentid\' => \'0,1,13\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'26\',\n    \'catname\' => \'祝寿系列\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'products/gexingbaozhuang/\',\n    \'catdir\' => \'zhushouxilie\',\n    \'url\' => \'http://www.hc.com/index.php?m=content&c=index&a=lists&catid=26\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'array (\n  \\\'workflowid\\\' => \\\'\\\',\n  \\\'ishtml\\\' => \\\'0\\\',\n  \\\'content_ishtml\\\' => \\\'0\\\',\n  \\\'create_to_html_root\\\' => \\\'0\\\',\n  \\\'template_list\\\' => \\\'hucai\\\',\n  \\\'category_template\\\' => \\\'category_product\\\',\n  \\\'list_template\\\' => \\\'list_product\\\',\n  \\\'show_template\\\' => \\\'show_product\\\',\n  \\\'meta_title\\\' => \\\'\\\',\n  \\\'meta_keywords\\\' => \\\'\\\',\n  \\\'meta_description\\\' => \\\'\\\',\n  \\\'presentpoint\\\' => \\\'1\\\',\n  \\\'defaultchargepoint\\\' => \\\'0\\\',\n  \\\'paytype\\\' => \\\'0\\\',\n  \\\'repeatchargedays\\\' => \\\'1\\\',\n  \\\'category_ruleid\\\' => \\\'6\\\',\n  \\\'show_ruleid\\\' => \\\'16\\\',\n)\',\n    \'listorder\' => \'26\',\n    \'ismenu\' => \'1\',\n    \'ishelp\' => \'0\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'zhushouxilie\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'0\',\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => \'0\',\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'16\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n  27 => \n  array (\n    \'catid\' => \'27\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'12\',\n    \'parentid\' => \'14\',\n    \'arrparentid\' => \'0,1,14\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'27\',\n    \'catname\' => \'按需出版\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'products/anxuyinshua/\',\n    \'catdir\' => \'anxuchuban\',\n    \'url\' => \'http://www.hc.com/index.php?m=content&c=index&a=lists&catid=27\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'array (\n  \\\'workflowid\\\' => \\\'\\\',\n  \\\'ishtml\\\' => \\\'0\\\',\n  \\\'content_ishtml\\\' => \\\'0\\\',\n  \\\'create_to_html_root\\\' => \\\'0\\\',\n  \\\'template_list\\\' => \\\'hucai\\\',\n  \\\'category_template\\\' => \\\'category_product\\\',\n  \\\'list_template\\\' => \\\'list_product\\\',\n  \\\'show_template\\\' => \\\'show_product\\\',\n  \\\'meta_title\\\' => \\\'\\\',\n  \\\'meta_keywords\\\' => \\\'\\\',\n  \\\'meta_description\\\' => \\\'\\\',\n  \\\'presentpoint\\\' => \\\'1\\\',\n  \\\'defaultchargepoint\\\' => \\\'0\\\',\n  \\\'paytype\\\' => \\\'0\\\',\n  \\\'repeatchargedays\\\' => \\\'1\\\',\n  \\\'category_ruleid\\\' => \\\'6\\\',\n  \\\'show_ruleid\\\' => \\\'16\\\',\n)\',\n    \'listorder\' => \'27\',\n    \'ismenu\' => \'1\',\n    \'ishelp\' => \'0\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'anxuchuban\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'0\',\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => \'0\',\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'16\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n  28 => \n  array (\n    \'catid\' => \'28\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'12\',\n    \'parentid\' => \'14\',\n    \'arrparentid\' => \'0,1,14\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'28\',\n    \'catname\' => \'搜书院·让图书永不断版\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'products/anxuyinshua/\',\n    \'catdir\' => \'soushuyuanrangtushuyongbuduanb\',\n    \'url\' => \'http://www.hc.com/index.php?m=content&c=index&a=lists&catid=28\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'array (\n  \\\'workflowid\\\' => \\\'\\\',\n  \\\'ishtml\\\' => \\\'0\\\',\n  \\\'content_ishtml\\\' => \\\'0\\\',\n  \\\'create_to_html_root\\\' => \\\'0\\\',\n  \\\'template_list\\\' => \\\'hucai\\\',\n  \\\'category_template\\\' => \\\'category_product\\\',\n  \\\'list_template\\\' => \\\'list_product\\\',\n  \\\'show_template\\\' => \\\'show_product\\\',\n  \\\'meta_title\\\' => \\\'\\\',\n  \\\'meta_keywords\\\' => \\\'\\\',\n  \\\'meta_description\\\' => \\\'\\\',\n  \\\'presentpoint\\\' => \\\'1\\\',\n  \\\'defaultchargepoint\\\' => \\\'0\\\',\n  \\\'paytype\\\' => \\\'0\\\',\n  \\\'repeatchargedays\\\' => \\\'1\\\',\n  \\\'category_ruleid\\\' => \\\'6\\\',\n  \\\'show_ruleid\\\' => \\\'16\\\',\n)\',\n    \'listorder\' => \'28\',\n    \'ismenu\' => \'1\',\n    \'ishelp\' => \'0\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'soushuyuanrangtushuyongbuduanb\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'0\',\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => \'0\',\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'16\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n  29 => \n  array (\n    \'catid\' => \'29\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'12\',\n    \'parentid\' => \'15\',\n    \'arrparentid\' => \'0,1,15\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'29\',\n    \'catname\' => \'激光材料\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'products/leishefangwei/\',\n    \'catdir\' => \'jiguangcailiao\',\n    \'url\' => \'http://www.hc.com/index.php?m=content&c=index&a=lists&catid=29\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'array (\n  \\\'workflowid\\\' => \\\'\\\',\n  \\\'ishtml\\\' => \\\'0\\\',\n  \\\'content_ishtml\\\' => \\\'0\\\',\n  \\\'create_to_html_root\\\' => \\\'0\\\',\n  \\\'template_list\\\' => \\\'hucai\\\',\n  \\\'category_template\\\' => \\\'category_product\\\',\n  \\\'list_template\\\' => \\\'list_product\\\',\n  \\\'show_template\\\' => \\\'show_product\\\',\n  \\\'meta_title\\\' => \\\'\\\',\n  \\\'meta_keywords\\\' => \\\'\\\',\n  \\\'meta_description\\\' => \\\'\\\',\n  \\\'presentpoint\\\' => \\\'1\\\',\n  \\\'defaultchargepoint\\\' => \\\'0\\\',\n  \\\'paytype\\\' => \\\'0\\\',\n  \\\'repeatchargedays\\\' => \\\'1\\\',\n  \\\'category_ruleid\\\' => \\\'6\\\',\n  \\\'show_ruleid\\\' => \\\'16\\\',\n)\',\n    \'listorder\' => \'29\',\n    \'ismenu\' => \'1\',\n    \'ishelp\' => \'0\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'jiguangcailiao\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'0\',\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => \'0\',\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'16\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n  30 => \n  array (\n    \'catid\' => \'30\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'12\',\n    \'parentid\' => \'15\',\n    \'arrparentid\' => \'0,1,15\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'30\',\n    \'catname\' => \'镭射纸\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'products/leishefangwei/\',\n    \'catdir\' => \'leishezhi\',\n    \'url\' => \'http://www.hc.com/index.php?m=content&c=index&a=lists&catid=30\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'array (\n  \\\'workflowid\\\' => \\\'\\\',\n  \\\'ishtml\\\' => \\\'0\\\',\n  \\\'content_ishtml\\\' => \\\'0\\\',\n  \\\'create_to_html_root\\\' => \\\'0\\\',\n  \\\'template_list\\\' => \\\'hucai\\\',\n  \\\'category_template\\\' => \\\'category_product\\\',\n  \\\'list_template\\\' => \\\'list_product\\\',\n  \\\'show_template\\\' => \\\'show_product\\\',\n  \\\'meta_title\\\' => \\\'\\\',\n  \\\'meta_keywords\\\' => \\\'\\\',\n  \\\'meta_description\\\' => \\\'\\\',\n  \\\'presentpoint\\\' => \\\'1\\\',\n  \\\'defaultchargepoint\\\' => \\\'0\\\',\n  \\\'paytype\\\' => \\\'0\\\',\n  \\\'repeatchargedays\\\' => \\\'1\\\',\n  \\\'category_ruleid\\\' => \\\'6\\\',\n  \\\'show_ruleid\\\' => \\\'16\\\',\n)\',\n    \'listorder\' => \'30\',\n    \'ismenu\' => \'1\',\n    \'ishelp\' => \'0\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'leishezhi\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'0\',\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => \'0\',\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'16\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n  31 => \n  array (\n    \'catid\' => \'31\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'12\',\n    \'parentid\' => \'15\',\n    \'arrparentid\' => \'0,1,15\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'31\',\n    \'catname\' => \'镭射膜\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'products/leishefangwei/\',\n    \'catdir\' => \'leishemo\',\n    \'url\' => \'http://www.hc.com/index.php?m=content&c=index&a=lists&catid=31\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'array (\n  \\\'workflowid\\\' => \\\'\\\',\n  \\\'ishtml\\\' => \\\'0\\\',\n  \\\'content_ishtml\\\' => \\\'0\\\',\n  \\\'create_to_html_root\\\' => \\\'0\\\',\n  \\\'template_list\\\' => \\\'hucai\\\',\n  \\\'category_template\\\' => \\\'category_product\\\',\n  \\\'list_template\\\' => \\\'list_product\\\',\n  \\\'show_template\\\' => \\\'show_product\\\',\n  \\\'meta_title\\\' => \\\'\\\',\n  \\\'meta_keywords\\\' => \\\'\\\',\n  \\\'meta_description\\\' => \\\'\\\',\n  \\\'presentpoint\\\' => \\\'1\\\',\n  \\\'defaultchargepoint\\\' => \\\'0\\\',\n  \\\'paytype\\\' => \\\'0\\\',\n  \\\'repeatchargedays\\\' => \\\'1\\\',\n  \\\'category_ruleid\\\' => \\\'6\\\',\n  \\\'show_ruleid\\\' => \\\'16\\\',\n)\',\n    \'listorder\' => \'31\',\n    \'ismenu\' => \'1\',\n    \'ishelp\' => \'0\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'leishemo\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'0\',\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => \'0\',\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'16\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n  32 => \n  array (\n    \'catid\' => \'32\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'3\',\n    \'parentid\' => \'0\',\n    \'arrparentid\' => \'0\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'32\',\n    \'catname\' => \'首页图片轮播\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'\',\n    \'catdir\' => \'sdfds\',\n    \'url\' => \'http://www.hc.com/index.php?m=content&c=index&a=lists&catid=32\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'array (\n  \\\'workflowid\\\' => \\\'\\\',\n  \\\'ishtml\\\' => \\\'0\\\',\n  \\\'content_ishtml\\\' => \\\'0\\\',\n  \\\'create_to_html_root\\\' => \\\'0\\\',\n  \\\'template_list\\\' => \\\'hucai\\\',\n  \\\'category_template\\\' => \\\'category_picture\\\',\n  \\\'list_template\\\' => \\\'list_picture\\\',\n  \\\'show_template\\\' => \\\'show_picture\\\',\n  \\\'meta_title\\\' => \\\'\\\',\n  \\\'meta_keywords\\\' => \\\'\\\',\n  \\\'meta_description\\\' => \\\'\\\',\n  \\\'presentpoint\\\' => \\\'1\\\',\n  \\\'defaultchargepoint\\\' => \\\'0\\\',\n  \\\'paytype\\\' => \\\'0\\\',\n  \\\'repeatchargedays\\\' => \\\'1\\\',\n  \\\'category_ruleid\\\' => \\\'6\\\',\n  \\\'show_ruleid\\\' => \\\'16\\\',\n)\',\n    \'listorder\' => \'32\',\n    \'ismenu\' => \'0\',\n    \'ishelp\' => \'0\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'shouyetupianlunbo\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'0\',\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => \'0\',\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'16\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n  33 => \n  array (\n    \'catid\' => \'33\',\n    \'siteid\' => \'1\',\n    \'type\' => \'1\',\n    \'modelid\' => \'0\',\n    \'parentid\' => \'0\',\n    \'arrparentid\' => \'0\',\n    \'child\' => \'1\',\n    \'arrchildid\' => \'33,37,38,39,40,41,42,43\',\n    \'catname\' => \'关于虎彩\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'\',\n    \'catdir\' => \'AboutHucai\',\n    \'url\' => \'http://www.hc.com/index.php?m=content&c=index&a=lists&catid=33\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'array (\n  \\\'ishtml\\\' => \\\'0\\\',\n  \\\'template_list\\\' => \\\'hucai\\\',\n  \\\'page_template\\\' => \\\'page\\\',\n  \\\'meta_title\\\' => \\\'\\\',\n  \\\'meta_keywords\\\' => \\\'\\\',\n  \\\'meta_description\\\' => \\\'\\\',\n  \\\'category_ruleid\\\' => \\\'6\\\',\n  \\\'show_ruleid\\\' => \\\'\\\',\n  \\\'repeatchargedays\\\' => \\\'1\\\',\n)\',\n    \'listorder\' => \'33\',\n    \'ismenu\' => \'1\',\n    \'ishelp\' => \'1\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'guanyuhucai\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => NULL,\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => NULL,\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'\',\n    \'workflowid\' => NULL,\n    \'isdomain\' => \'0\',\n  ),\n  34 => \n  array (\n    \'catid\' => \'34\',\n    \'siteid\' => \'1\',\n    \'type\' => \'1\',\n    \'modelid\' => \'0\',\n    \'parentid\' => \'0\',\n    \'arrparentid\' => \'0\',\n    \'child\' => \'1\',\n    \'arrchildid\' => \'34,44,45,46,47,48,49,50\',\n    \'catname\' => \'按访问者\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'\',\n    \'catdir\' => \'anfangwenzhe\',\n    \'url\' => \'http://www.hc.com/index.php?m=content&c=index&a=lists&catid=34\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'array (\n  \\\'ishtml\\\' => \\\'0\\\',\n  \\\'template_list\\\' => \\\'hucai\\\',\n  \\\'page_template\\\' => \\\'page\\\',\n  \\\'meta_title\\\' => \\\'\\\',\n  \\\'meta_keywords\\\' => \\\'\\\',\n  \\\'meta_description\\\' => \\\'\\\',\n  \\\'category_ruleid\\\' => \\\'6\\\',\n  \\\'show_ruleid\\\' => \\\'\\\',\n  \\\'repeatchargedays\\\' => \\\'1\\\',\n)\',\n    \'listorder\' => \'34\',\n    \'ismenu\' => \'1\',\n    \'ishelp\' => \'1\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'anfangwenzhe\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => NULL,\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => NULL,\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'\',\n    \'workflowid\' => NULL,\n    \'isdomain\' => \'0\',\n  ),\n  35 => \n  array (\n    \'catid\' => \'35\',\n    \'siteid\' => \'1\',\n    \'type\' => \'1\',\n    \'modelid\' => \'0\',\n    \'parentid\' => \'0\',\n    \'arrparentid\' => \'0\',\n    \'child\' => \'1\',\n    \'arrchildid\' => \'35,51,52,53,54,55,56\',\n    \'catname\' => \'新闻&活动\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'\',\n    \'catdir\' => \'xinwenhuodong\',\n    \'url\' => \'http://www.hc.com/index.php?m=content&c=index&a=lists&catid=35\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'array (\n  \\\'ishtml\\\' => \\\'0\\\',\n  \\\'template_list\\\' => \\\'hucai\\\',\n  \\\'page_template\\\' => \\\'page\\\',\n  \\\'meta_title\\\' => \\\'\\\',\n  \\\'meta_keywords\\\' => \\\'\\\',\n  \\\'meta_description\\\' => \\\'\\\',\n  \\\'category_ruleid\\\' => \\\'6\\\',\n  \\\'show_ruleid\\\' => \\\'\\\',\n  \\\'repeatchargedays\\\' => \\\'1\\\',\n)\',\n    \'listorder\' => \'35\',\n    \'ismenu\' => \'1\',\n    \'ishelp\' => \'1\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'xinwen&huodong\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => NULL,\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => NULL,\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'\',\n    \'workflowid\' => NULL,\n    \'isdomain\' => \'0\',\n  ),\n  36 => \n  array (\n    \'catid\' => \'36\',\n    \'siteid\' => \'1\',\n    \'type\' => \'1\',\n    \'modelid\' => \'0\',\n    \'parentid\' => \'0\',\n    \'arrparentid\' => \'0\',\n    \'child\' => \'1\',\n    \'arrchildid\' => \'36,57,58,59,60,61,62,63\',\n    \'catname\' => \'快捷衔接\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'\',\n    \'catdir\' => \'kuaijiexianjie\',\n    \'url\' => \'http://www.hc.com/index.php?m=content&c=index&a=lists&catid=36\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'array (\n  \\\'ishtml\\\' => \\\'0\\\',\n  \\\'template_list\\\' => \\\'hucai\\\',\n  \\\'page_template\\\' => \\\'page\\\',\n  \\\'meta_title\\\' => \\\'\\\',\n  \\\'meta_keywords\\\' => \\\'\\\',\n  \\\'meta_description\\\' => \\\'\\\',\n  \\\'category_ruleid\\\' => \\\'6\\\',\n  \\\'show_ruleid\\\' => \\\'\\\',\n  \\\'repeatchargedays\\\' => \\\'1\\\',\n)\',\n    \'listorder\' => \'36\',\n    \'ismenu\' => \'1\',\n    \'ishelp\' => \'1\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'kuaijiexianjie\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => NULL,\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => NULL,\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'\',\n    \'workflowid\' => NULL,\n    \'isdomain\' => \'0\',\n  ),\n  37 => \n  array (\n    \'catid\' => \'37\',\n    \'siteid\' => \'1\',\n    \'type\' => \'1\',\n    \'modelid\' => \'0\',\n    \'parentid\' => \'33\',\n    \'arrparentid\' => \'0,33\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'37\',\n    \'catname\' => \'虎彩概况\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'AboutHucai/\',\n    \'catdir\' => \'hucaigaikuang\',\n    \'url\' => \'http://www.hc.com/index.php?m=content&c=index&a=lists&catid=37\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'array (\n  \\\'ishtml\\\' => \\\'0\\\',\n  \\\'template_list\\\' => \\\'hucai\\\',\n  \\\'page_template\\\' => \\\'page\\\',\n  \\\'meta_title\\\' => \\\'\\\',\n  \\\'meta_keywords\\\' => \\\'\\\',\n  \\\'meta_description\\\' => \\\'\\\',\n  \\\'category_ruleid\\\' => \\\'6\\\',\n  \\\'show_ruleid\\\' => \\\'\\\',\n  \\\'repeatchargedays\\\' => \\\'1\\\',\n)\',\n    \'listorder\' => \'37\',\n    \'ismenu\' => \'1\',\n    \'ishelp\' => \'0\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'hucaigaikuang\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => NULL,\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => NULL,\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'\',\n    \'workflowid\' => NULL,\n    \'isdomain\' => \'0\',\n  ),\n  38 => \n  array (\n    \'catid\' => \'38\',\n    \'siteid\' => \'1\',\n    \'type\' => \'1\',\n    \'modelid\' => \'0\',\n    \'parentid\' => \'33\',\n    \'arrparentid\' => \'0,33\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'38\',\n    \'catname\' => \'发展历程\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'AboutHucai/\',\n    \'catdir\' => \'fazhanlicheng\',\n    \'url\' => \'http://www.hc.com/index.php?m=content&c=index&a=lists&catid=38\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'array (\n  \\\'ishtml\\\' => \\\'0\\\',\n  \\\'template_list\\\' => \\\'hucai\\\',\n  \\\'page_template\\\' => \\\'page\\\',\n  \\\'meta_title\\\' => \\\'\\\',\n  \\\'meta_keywords\\\' => \\\'\\\',\n  \\\'meta_description\\\' => \\\'\\\',\n  \\\'category_ruleid\\\' => \\\'6\\\',\n  \\\'show_ruleid\\\' => \\\'\\\',\n  \\\'repeatchargedays\\\' => \\\'1\\\',\n)\',\n    \'listorder\' => \'38\',\n    \'ismenu\' => \'1\',\n    \'ishelp\' => \'0\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'fazhanlicheng\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => NULL,\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => NULL,\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'\',\n    \'workflowid\' => NULL,\n    \'isdomain\' => \'0\',\n  ),\n  39 => \n  array (\n    \'catid\' => \'39\',\n    \'siteid\' => \'1\',\n    \'type\' => \'1\',\n    \'modelid\' => \'0\',\n    \'parentid\' => \'33\',\n    \'arrparentid\' => \'0,33\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'39\',\n    \'catname\' => \'品牌战略\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'AboutHucai/\',\n    \'catdir\' => \'pinpaizhanlue\',\n    \'url\' => \'http://www.hc.com/index.php?m=content&c=index&a=lists&catid=39\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'array (\n  \\\'ishtml\\\' => \\\'0\\\',\n  \\\'template_list\\\' => \\\'hucai\\\',\n  \\\'page_template\\\' => \\\'page\\\',\n  \\\'meta_title\\\' => \\\'\\\',\n  \\\'meta_keywords\\\' => \\\'\\\',\n  \\\'meta_description\\\' => \\\'\\\',\n  \\\'category_ruleid\\\' => \\\'6\\\',\n  \\\'show_ruleid\\\' => \\\'\\\',\n  \\\'repeatchargedays\\\' => \\\'1\\\',\n)\',\n    \'listorder\' => \'39\',\n    \'ismenu\' => \'1\',\n    \'ishelp\' => \'0\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'pinpaizhanlue\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => NULL,\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => NULL,\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'\',\n    \'workflowid\' => NULL,\n    \'isdomain\' => \'0\',\n  ),\n  40 => \n  array (\n    \'catid\' => \'40\',\n    \'siteid\' => \'1\',\n    \'type\' => \'1\',\n    \'modelid\' => \'0\',\n    \'parentid\' => \'33\',\n    \'arrparentid\' => \'0,33\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'40\',\n    \'catname\' => \'企业文化\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'AboutHucai/\',\n    \'catdir\' => \'qiyewenhua\',\n    \'url\' => \'http://www.hc.com/index.php?m=content&c=index&a=lists&catid=40\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'array (\n  \\\'ishtml\\\' => \\\'0\\\',\n  \\\'template_list\\\' => \\\'hucai\\\',\n  \\\'page_template\\\' => \\\'page\\\',\n  \\\'meta_title\\\' => \\\'\\\',\n  \\\'meta_keywords\\\' => \\\'\\\',\n  \\\'meta_description\\\' => \\\'\\\',\n  \\\'category_ruleid\\\' => \\\'6\\\',\n  \\\'show_ruleid\\\' => \\\'\\\',\n  \\\'repeatchargedays\\\' => \\\'1\\\',\n)\',\n    \'listorder\' => \'40\',\n    \'ismenu\' => \'1\',\n    \'ishelp\' => \'0\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'qiyewenhua\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => NULL,\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => NULL,\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'\',\n    \'workflowid\' => NULL,\n    \'isdomain\' => \'0\',\n  ),\n  41 => \n  array (\n    \'catid\' => \'41\',\n    \'siteid\' => \'1\',\n    \'type\' => \'1\',\n    \'modelid\' => \'0\',\n    \'parentid\' => \'33\',\n    \'arrparentid\' => \'0,33\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'41\',\n    \'catname\' => \'公益&责任\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'AboutHucai/\',\n    \'catdir\' => \'gongyi&zeren\',\n    \'url\' => \'http://www.hc.com/index.php?m=content&c=index&a=lists&catid=41\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'array (\n  \\\'ishtml\\\' => \\\'0\\\',\n  \\\'template_list\\\' => \\\'hucai\\\',\n  \\\'page_template\\\' => \\\'page\\\',\n  \\\'meta_title\\\' => \\\'\\\',\n  \\\'meta_keywords\\\' => \\\'\\\',\n  \\\'meta_description\\\' => \\\'\\\',\n  \\\'category_ruleid\\\' => \\\'6\\\',\n  \\\'show_ruleid\\\' => \\\'\\\',\n  \\\'repeatchargedays\\\' => \\\'1\\\',\n)\',\n    \'listorder\' => \'41\',\n    \'ismenu\' => \'1\',\n    \'ishelp\' => \'0\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'gongyi&zeren\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => NULL,\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => NULL,\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'\',\n    \'workflowid\' => NULL,\n    \'isdomain\' => \'0\',\n  ),\n  42 => \n  array (\n    \'catid\' => \'42\',\n    \'siteid\' => \'1\',\n    \'type\' => \'1\',\n    \'modelid\' => \'0\',\n    \'parentid\' => \'33\',\n    \'arrparentid\' => \'0,33\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'42\',\n    \'catname\' => \'荣誉&资质\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'AboutHucai/\',\n    \'catdir\' => \'rongyu&zizhi\',\n    \'url\' => \'http://www.hc.com/index.php?m=content&c=index&a=lists&catid=42\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'array (\n  \\\'ishtml\\\' => \\\'0\\\',\n  \\\'template_list\\\' => \\\'hucai\\\',\n  \\\'page_template\\\' => \\\'page\\\',\n  \\\'meta_title\\\' => \\\'\\\',\n  \\\'meta_keywords\\\' => \\\'\\\',\n  \\\'meta_description\\\' => \\\'\\\',\n  \\\'category_ruleid\\\' => \\\'6\\\',\n  \\\'show_ruleid\\\' => \\\'\\\',\n  \\\'repeatchargedays\\\' => \\\'1\\\',\n)\',\n    \'listorder\' => \'42\',\n    \'ismenu\' => \'1\',\n    \'ishelp\' => \'0\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'rongyu&zizhi\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => NULL,\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => NULL,\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'\',\n    \'workflowid\' => NULL,\n    \'isdomain\' => \'0\',\n  ),\n  43 => \n  array (\n    \'catid\' => \'43\',\n    \'siteid\' => \'1\',\n    \'type\' => \'1\',\n    \'modelid\' => \'0\',\n    \'parentid\' => \'33\',\n    \'arrparentid\' => \'0,33\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'43\',\n    \'catname\' => \'创新基因\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'AboutHucai/\',\n    \'catdir\' => \'chuangxinjiyin\',\n    \'url\' => \'http://www.hc.com/index.php?m=content&c=index&a=lists&catid=43\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'array (\n  \\\'ishtml\\\' => \\\'0\\\',\n  \\\'template_list\\\' => \\\'hucai\\\',\n  \\\'page_template\\\' => \\\'page\\\',\n  \\\'meta_title\\\' => \\\'\\\',\n  \\\'meta_keywords\\\' => \\\'\\\',\n  \\\'meta_description\\\' => \\\'\\\',\n  \\\'category_ruleid\\\' => \\\'6\\\',\n  \\\'show_ruleid\\\' => \\\'\\\',\n  \\\'repeatchargedays\\\' => \\\'1\\\',\n)\',\n    \'listorder\' => \'43\',\n    \'ismenu\' => \'1\',\n    \'ishelp\' => \'0\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'chuangxinjiyin\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => NULL,\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => NULL,\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'\',\n    \'workflowid\' => NULL,\n    \'isdomain\' => \'0\',\n  ),\n  44 => \n  array (\n    \'catid\' => \'44\',\n    \'siteid\' => \'1\',\n    \'type\' => \'1\',\n    \'modelid\' => \'0\',\n    \'parentid\' => \'34\',\n    \'arrparentid\' => \'0,34\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'44\',\n    \'catname\' => \'个人用户\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'anfangwenzhe/\',\n    \'catdir\' => \'gerenyonghu\',\n    \'url\' => \'http://www.hc.com/index.php?m=content&c=index&a=lists&catid=44\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'array (\n  \\\'ishtml\\\' => \\\'0\\\',\n  \\\'template_list\\\' => \\\'hucai\\\',\n  \\\'page_template\\\' => \\\'page\\\',\n  \\\'meta_title\\\' => \\\'\\\',\n  \\\'meta_keywords\\\' => \\\'\\\',\n  \\\'meta_description\\\' => \\\'\\\',\n  \\\'category_ruleid\\\' => \\\'6\\\',\n  \\\'show_ruleid\\\' => \\\'\\\',\n  \\\'repeatchargedays\\\' => \\\'1\\\',\n)\',\n    \'listorder\' => \'44\',\n    \'ismenu\' => \'1\',\n    \'ishelp\' => \'0\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'gerenyonghu\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => NULL,\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => NULL,\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'\',\n    \'workflowid\' => NULL,\n    \'isdomain\' => \'0\',\n  ),\n  45 => \n  array (\n    \'catid\' => \'45\',\n    \'siteid\' => \'1\',\n    \'type\' => \'1\',\n    \'modelid\' => \'0\',\n    \'parentid\' => \'34\',\n    \'arrparentid\' => \'0,34\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'45\',\n    \'catname\' => \'企业用户\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'anfangwenzhe/\',\n    \'catdir\' => \'qiyeyonghu\',\n    \'url\' => \'http://www.hc.com/index.php?m=content&c=index&a=lists&catid=45\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'array (\n  \\\'ishtml\\\' => \\\'0\\\',\n  \\\'template_list\\\' => \\\'hucai\\\',\n  \\\'page_template\\\' => \\\'page\\\',\n  \\\'meta_title\\\' => \\\'\\\',\n  \\\'meta_keywords\\\' => \\\'\\\',\n  \\\'meta_description\\\' => \\\'\\\',\n  \\\'category_ruleid\\\' => \\\'6\\\',\n  \\\'show_ruleid\\\' => \\\'\\\',\n  \\\'repeatchargedays\\\' => \\\'1\\\',\n)\',\n    \'listorder\' => \'45\',\n    \'ismenu\' => \'1\',\n    \'ishelp\' => \'0\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'qiyeyonghu\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => NULL,\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => NULL,\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'\',\n    \'workflowid\' => NULL,\n    \'isdomain\' => \'0\',\n  ),\n  46 => \n  array (\n    \'catid\' => \'46\',\n    \'siteid\' => \'1\',\n    \'type\' => \'1\',\n    \'modelid\' => \'0\',\n    \'parentid\' => \'34\',\n    \'arrparentid\' => \'0,34\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'46\',\n    \'catname\' => \'合作伙伴\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'anfangwenzhe/\',\n    \'catdir\' => \'hezuohuoban\',\n    \'url\' => \'http://www.hc.com/index.php?m=content&c=index&a=lists&catid=46\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'array (\n  \\\'ishtml\\\' => \\\'0\\\',\n  \\\'template_list\\\' => \\\'hucai\\\',\n  \\\'page_template\\\' => \\\'page\\\',\n  \\\'meta_title\\\' => \\\'\\\',\n  \\\'meta_keywords\\\' => \\\'\\\',\n  \\\'meta_description\\\' => \\\'\\\',\n  \\\'category_ruleid\\\' => \\\'6\\\',\n  \\\'show_ruleid\\\' => \\\'\\\',\n  \\\'repeatchargedays\\\' => \\\'1\\\',\n)\',\n    \'listorder\' => \'46\',\n    \'ismenu\' => \'1\',\n    \'ishelp\' => \'0\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'hezuohuoban\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => NULL,\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => NULL,\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'\',\n    \'workflowid\' => NULL,\n    \'isdomain\' => \'0\',\n  ),\n  47 => \n  array (\n    \'catid\' => \'47\',\n    \'siteid\' => \'1\',\n    \'type\' => \'1\',\n    \'modelid\' => \'0\',\n    \'parentid\' => \'34\',\n    \'arrparentid\' => \'0,34\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'47\',\n    \'catname\' => \'新闻媒体\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'anfangwenzhe/\',\n    \'catdir\' => \'xinwenmeiti\',\n    \'url\' => \'http://www.hc.com/index.php?m=content&c=index&a=lists&catid=47\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'array (\n  \\\'ishtml\\\' => \\\'0\\\',\n  \\\'template_list\\\' => \\\'hucai\\\',\n  \\\'page_template\\\' => \\\'page\\\',\n  \\\'meta_title\\\' => \\\'\\\',\n  \\\'meta_keywords\\\' => \\\'\\\',\n  \\\'meta_description\\\' => \\\'\\\',\n  \\\'category_ruleid\\\' => \\\'6\\\',\n  \\\'show_ruleid\\\' => \\\'\\\',\n  \\\'repeatchargedays\\\' => \\\'1\\\',\n)\',\n    \'listorder\' => \'47\',\n    \'ismenu\' => \'1\',\n    \'ishelp\' => \'0\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'xinwenmeiti\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => NULL,\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => NULL,\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'\',\n    \'workflowid\' => NULL,\n    \'isdomain\' => \'0\',\n  ),\n  48 => \n  array (\n    \'catid\' => \'48\',\n    \'siteid\' => \'1\',\n    \'type\' => \'1\',\n    \'modelid\' => \'0\',\n    \'parentid\' => \'34\',\n    \'arrparentid\' => \'0,34\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'48\',\n    \'catname\' => \'供应商\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'anfangwenzhe/\',\n    \'catdir\' => \'gongyingshang\',\n    \'url\' => \'http://www.hc.com/index.php?m=content&c=index&a=lists&catid=48\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'array (\n  \\\'ishtml\\\' => \\\'0\\\',\n  \\\'template_list\\\' => \\\'hucai\\\',\n  \\\'page_template\\\' => \\\'page\\\',\n  \\\'meta_title\\\' => \\\'\\\',\n  \\\'meta_keywords\\\' => \\\'\\\',\n  \\\'meta_description\\\' => \\\'\\\',\n  \\\'category_ruleid\\\' => \\\'6\\\',\n  \\\'show_ruleid\\\' => \\\'\\\',\n  \\\'repeatchargedays\\\' => \\\'1\\\',\n)\',\n    \'listorder\' => \'48\',\n    \'ismenu\' => \'1\',\n    \'ishelp\' => \'0\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'gongyingshang\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => NULL,\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => NULL,\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'\',\n    \'workflowid\' => NULL,\n    \'isdomain\' => \'0\',\n  ),\n  49 => \n  array (\n    \'catid\' => \'49\',\n    \'siteid\' => \'1\',\n    \'type\' => \'1\',\n    \'modelid\' => \'0\',\n    \'parentid\' => \'34\',\n    \'arrparentid\' => \'0,34\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'49\',\n    \'catname\' => \'求职者\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'anfangwenzhe/\',\n    \'catdir\' => \'qiuzhizhe\',\n    \'url\' => \'http://www.hc.com/index.php?m=content&c=index&a=lists&catid=49\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'array (\n  \\\'ishtml\\\' => \\\'0\\\',\n  \\\'template_list\\\' => \\\'hucai\\\',\n  \\\'page_template\\\' => \\\'page\\\',\n  \\\'meta_title\\\' => \\\'\\\',\n  \\\'meta_keywords\\\' => \\\'\\\',\n  \\\'meta_description\\\' => \\\'\\\',\n  \\\'category_ruleid\\\' => \\\'6\\\',\n  \\\'show_ruleid\\\' => \\\'\\\',\n  \\\'repeatchargedays\\\' => \\\'1\\\',\n)\',\n    \'listorder\' => \'49\',\n    \'ismenu\' => \'1\',\n    \'ishelp\' => \'0\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'qiuzhizhe\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => NULL,\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => NULL,\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'\',\n    \'workflowid\' => NULL,\n    \'isdomain\' => \'0\',\n  ),\n  50 => \n  array (\n    \'catid\' => \'50\',\n    \'siteid\' => \'1\',\n    \'type\' => \'1\',\n    \'modelid\' => \'0\',\n    \'parentid\' => \'34\',\n    \'arrparentid\' => \'0,34\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'50\',\n    \'catname\' => \'员工驿站\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'anfangwenzhe/\',\n    \'catdir\' => \'yuangongzuozhan\',\n    \'url\' => \'http://www.hc.com/index.php?m=content&c=index&a=lists&catid=50\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'array (\n  \\\'ishtml\\\' => \\\'0\\\',\n  \\\'template_list\\\' => \\\'hucai\\\',\n  \\\'page_template\\\' => \\\'page\\\',\n  \\\'meta_title\\\' => \\\'\\\',\n  \\\'meta_keywords\\\' => \\\'\\\',\n  \\\'meta_description\\\' => \\\'\\\',\n  \\\'category_ruleid\\\' => \\\'6\\\',\n  \\\'show_ruleid\\\' => \\\'\\\',\n  \\\'repeatchargedays\\\' => \\\'1\\\',\n)\',\n    \'listorder\' => \'50\',\n    \'ismenu\' => \'1\',\n    \'ishelp\' => \'0\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'yuangongzuozhan\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => NULL,\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => NULL,\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'\',\n    \'workflowid\' => NULL,\n    \'isdomain\' => \'0\',\n  ),\n  63 => \n  array (\n    \'catid\' => \'63\',\n    \'siteid\' => \'1\',\n    \'type\' => \'1\',\n    \'modelid\' => \'0\',\n    \'parentid\' => \'36\',\n    \'arrparentid\' => \'0,36\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'63\',\n    \'catname\' => \'联系我们\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'kuaijiexianjie/\',\n    \'catdir\' => \'ContatctUs\',\n    \'url\' => \'http://www.hc.com/index.php?m=content&c=index&a=lists&catid=63\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'array (\n  \\\'ishtml\\\' => \\\'0\\\',\n  \\\'template_list\\\' => \\\'hucai\\\',\n  \\\'page_template\\\' => \\\'page\\\',\n  \\\'meta_title\\\' => \\\'\\\',\n  \\\'meta_keywords\\\' => \\\'\\\',\n  \\\'meta_description\\\' => \\\'\\\',\n  \\\'category_ruleid\\\' => \\\'6\\\',\n  \\\'show_ruleid\\\' => \\\'\\\',\n  \\\'repeatchargedays\\\' => \\\'1\\\',\n)\',\n    \'listorder\' => \'63\',\n    \'ismenu\' => \'1\',\n    \'ishelp\' => \'0\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'lianxiwomen\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => NULL,\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => NULL,\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'\',\n    \'workflowid\' => NULL,\n    \'isdomain\' => \'0\',\n  ),\n  64 => \n  array (\n    \'catid\' => \'64\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'1\',\n    \'parentid\' => \'0\',\n    \'arrparentid\' => \'0\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'64\',\n    \'catname\' => \'网站信息\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'\',\n    \'catdir\' => \'site\',\n    \'url\' => \'http://www.hc.com/index.php?m=content&c=index&a=lists&catid=64\',\n    \'items\' => \'1\',\n    \'hits\' => \'0\',\n    \'setting\' => \'array (\n  \\\'workflowid\\\' => \\\'\\\',\n  \\\'ishtml\\\' => \\\'0\\\',\n  \\\'content_ishtml\\\' => \\\'0\\\',\n  \\\'create_to_html_root\\\' => \\\'0\\\',\n  \\\'template_list\\\' => \\\'hucai\\\',\n  \\\'category_template\\\' => \\\'category\\\',\n  \\\'list_template\\\' => \\\'list\\\',\n  \\\'show_template\\\' => \\\'show\\\',\n  \\\'meta_title\\\' => \\\'\\\',\n  \\\'meta_keywords\\\' => \\\'\\\',\n  \\\'meta_description\\\' => \\\'\\\',\n  \\\'presentpoint\\\' => \\\'1\\\',\n  \\\'defaultchargepoint\\\' => \\\'0\\\',\n  \\\'paytype\\\' => \\\'0\\\',\n  \\\'repeatchargedays\\\' => \\\'1\\\',\n  \\\'category_ruleid\\\' => \\\'6\\\',\n  \\\'show_ruleid\\\' => \\\'16\\\',\n)\',\n    \'listorder\' => \'64\',\n    \'ismenu\' => \'0\',\n    \'ishelp\' => \'0\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'wangzhanxinxi\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'0\',\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => \'0\',\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'16\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n  65 => \n  array (\n    \'catid\' => \'65\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'2\',\n    \'parentid\' => \'5\',\n    \'arrparentid\' => \'0,5\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'65\',\n    \'catname\' => \'下载中心\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'service/\',\n    \'catdir\' => \'download\',\n    \'url\' => \'http://www.hc.com/index.php?m=content&c=index&a=lists&catid=65\',\n    \'items\' => \'2\',\n    \'hits\' => \'0\',\n    \'setting\' => \'array (\n  \\\'workflowid\\\' => \\\'\\\',\n  \\\'ishtml\\\' => \\\'0\\\',\n  \\\'content_ishtml\\\' => \\\'0\\\',\n  \\\'create_to_html_root\\\' => \\\'0\\\',\n  \\\'template_list\\\' => \\\'hucai\\\',\n  \\\'category_template\\\' => \\\'category_services_download\\\',\n  \\\'list_template\\\' => \\\'list_services_download\\\',\n  \\\'show_template\\\' => \\\'show_services_download\\\',\n  \\\'meta_title\\\' => \\\'\\\',\n  \\\'meta_keywords\\\' => \\\'\\\',\n  \\\'meta_description\\\' => \\\'\\\',\n  \\\'presentpoint\\\' => \\\'1\\\',\n  \\\'defaultchargepoint\\\' => \\\'0\\\',\n  \\\'paytype\\\' => \\\'0\\\',\n  \\\'repeatchargedays\\\' => \\\'1\\\',\n  \\\'category_ruleid\\\' => \\\'6\\\',\n  \\\'show_ruleid\\\' => \\\'16\\\',\n)\',\n    \'listorder\' => \'65\',\n    \'ismenu\' => \'0\',\n    \'ishelp\' => \'0\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'xiazaizhongxin\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'0\',\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => \'0\',\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'16\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n);\n?>');
INSERT INTO `hc_cache` VALUES ('downservers.cache.php', 'caches_commons/caches_data/', '<?php\nreturn NULL;\n?>');
INSERT INTO `hc_cache` VALUES ('badword.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n);\n?>');
INSERT INTO `hc_cache` VALUES ('ipbanned.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n);\n?>');
INSERT INTO `hc_cache` VALUES ('keylink.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n);\n?>');
INSERT INTO `hc_cache` VALUES ('position.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n  20 => \n  array (\n    \'posid\' => \'20\',\n    \'modelid\' => \'12\',\n    \'catid\' => \'1\',\n    \'name\' => \'产品首页推荐\',\n    \'maxnum\' => \'5\',\n    \'extention\' => \'\',\n    \'listorder\' => \'6\',\n    \'siteid\' => \'1\',\n    \'thumb\' => \'\',\n  ),\n  9 => \n  array (\n    \'posid\' => \'9\',\n    \'modelid\' => \'0\',\n    \'catid\' => \'64\',\n    \'name\' => \'首页“虎彩介绍”\',\n    \'maxnum\' => \'1\',\n    \'extention\' => \'\',\n    \'listorder\' => \'5\',\n    \'siteid\' => \'0\',\n    \'thumb\' => \'\',\n  ),\n  8 => \n  array (\n    \'posid\' => \'8\',\n    \'modelid\' => \'0\',\n    \'catid\' => \'2\',\n    \'name\' => \'首页新闻中心\',\n    \'maxnum\' => \'6\',\n    \'extention\' => \'\',\n    \'listorder\' => \'4\',\n    \'siteid\' => \'0\',\n    \'thumb\' => \'\',\n  ),\n  5 => \n  array (\n    \'posid\' => \'5\',\n    \'modelid\' => \'0\',\n    \'catid\' => \'0\',\n    \'name\' => \'首页滚动消息\',\n    \'maxnum\' => \'10\',\n    \'extention\' => \'\',\n    \'listorder\' => \'3\',\n    \'siteid\' => \'0\',\n    \'thumb\' => \'\',\n  ),\n  2 => \n  array (\n    \'posid\' => \'2\',\n    \'modelid\' => \'0\',\n    \'catid\' => \'2\',\n    \'name\' => \'首页视频新闻\',\n    \'maxnum\' => \'3\',\n    \'extention\' => \'\',\n    \'listorder\' => \'2\',\n    \'siteid\' => \'0\',\n    \'thumb\' => \'\',\n  ),\n  1 => \n  array (\n    \'posid\' => \'1\',\n    \'modelid\' => \'0\',\n    \'catid\' => \'2\',\n    \'name\' => \'首页图片新闻\',\n    \'maxnum\' => \'3\',\n    \'extention\' => \'\',\n    \'listorder\' => \'1\',\n    \'siteid\' => \'0\',\n    \'thumb\' => \'\',\n  ),\n  18 => \n  array (\n    \'posid\' => \'18\',\n    \'modelid\' => \'1\',\n    \'catid\' => \'2\',\n    \'name\' => \'新闻页轮播\',\n    \'maxnum\' => \'20\',\n    \'extention\' => \'\',\n    \'listorder\' => \'0\',\n    \'siteid\' => \'1\',\n    \'thumb\' => \'\',\n  ),\n  19 => \n  array (\n    \'posid\' => \'19\',\n    \'modelid\' => \'0\',\n    \'catid\' => \'0\',\n    \'name\' => \'新闻置顶\',\n    \'maxnum\' => \'20\',\n    \'extention\' => \'\',\n    \'listorder\' => \'0\',\n    \'siteid\' => \'0\',\n    \'thumb\' => \'\',\n  ),\n);\n?>');
INSERT INTO `hc_cache` VALUES ('role_siteid.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n);\n?>');
INSERT INTO `hc_cache` VALUES ('role.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n  1 => \'超级管理员\',\n  2 => \'站点管理员\',\n  3 => \'运营总监\',\n  4 => \'总编\',\n  5 => \'编辑\',\n  7 => \'发布人员\',\n);\n?>');
INSERT INTO `hc_cache` VALUES ('urlrules_detail.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n  1 => \n  array (\n    \'urlruleid\' => \'1\',\n    \'module\' => \'content\',\n    \'file\' => \'category\',\n    \'ishtml\' => \'1\',\n    \'urlrule\' => \'{$categorydir}{$catdir}/index.html|{$categorydir}{$catdir}/{$page}.html\',\n    \'example\' => \'news/china/1000.html\',\n  ),\n  6 => \n  array (\n    \'urlruleid\' => \'6\',\n    \'module\' => \'content\',\n    \'file\' => \'category\',\n    \'ishtml\' => \'0\',\n    \'urlrule\' => \'index.php?m=content&c=index&a=lists&catid={$catid}|index.php?m=content&c=index&a=lists&catid={$catid}&page={$page}\',\n    \'example\' => \'index.php?m=content&c=index&a=lists&catid=1&page=1\',\n  ),\n  11 => \n  array (\n    \'urlruleid\' => \'11\',\n    \'module\' => \'content\',\n    \'file\' => \'show\',\n    \'ishtml\' => \'1\',\n    \'urlrule\' => \'{$year}/{$catdir}_{$month}{$day}/{$id}.html|{$year}/{$catdir}_{$month}{$day}/{$id}_{$page}.html\',\n    \'example\' => \'2010/catdir_0720/1_2.html\',\n  ),\n  12 => \n  array (\n    \'urlruleid\' => \'12\',\n    \'module\' => \'content\',\n    \'file\' => \'show\',\n    \'ishtml\' => \'1\',\n    \'urlrule\' => \'{$categorydir}{$catdir}/{$year}/{$month}{$day}/{$id}.html|{$categorydir}{$catdir}/{$year}/{$month}{$day}/{$id}_{$page}.html\',\n    \'example\' => \'it/product/2010/0720/1_2.html\',\n  ),\n  16 => \n  array (\n    \'urlruleid\' => \'16\',\n    \'module\' => \'content\',\n    \'file\' => \'show\',\n    \'ishtml\' => \'0\',\n    \'urlrule\' => \'index.php?m=content&c=index&a=show&catid={$catid}&id={$id}|index.php?m=content&c=index&a=show&catid={$catid}&id={$id}&page={$page}\',\n    \'example\' => \'index.php?m=content&c=index&a=show&catid=1&id=1\',\n  ),\n  17 => \n  array (\n    \'urlruleid\' => \'17\',\n    \'module\' => \'content\',\n    \'file\' => \'show\',\n    \'ishtml\' => \'0\',\n    \'urlrule\' => \'show-{$catid}-{$id}-{$page}.html\',\n    \'example\' => \'show-1-2-1.html\',\n  ),\n  18 => \n  array (\n    \'urlruleid\' => \'18\',\n    \'module\' => \'content\',\n    \'file\' => \'show\',\n    \'ishtml\' => \'0\',\n    \'urlrule\' => \'content-{$catid}-{$id}-{$page}.html\',\n    \'example\' => \'content-1-2-1.html\',\n  ),\n  30 => \n  array (\n    \'urlruleid\' => \'30\',\n    \'module\' => \'content\',\n    \'file\' => \'category\',\n    \'ishtml\' => \'0\',\n    \'urlrule\' => \'list-{$catid}-{$page}.html\',\n    \'example\' => \'list-1-1.html\',\n  ),\n);\n?>');
INSERT INTO `hc_cache` VALUES ('urlrules.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n  1 => \'{$categorydir}{$catdir}/index.html|{$categorydir}{$catdir}/{$page}.html\',\n  6 => \'index.php?m=content&c=index&a=lists&catid={$catid}|index.php?m=content&c=index&a=lists&catid={$catid}&page={$page}\',\n  11 => \'{$year}/{$catdir}_{$month}{$day}/{$id}.html|{$year}/{$catdir}_{$month}{$day}/{$id}_{$page}.html\',\n  12 => \'{$categorydir}{$catdir}/{$year}/{$month}{$day}/{$id}.html|{$categorydir}{$catdir}/{$year}/{$month}{$day}/{$id}_{$page}.html\',\n  16 => \'index.php?m=content&c=index&a=show&catid={$catid}&id={$id}|index.php?m=content&c=index&a=show&catid={$catid}&id={$id}&page={$page}\',\n  17 => \'show-{$catid}-{$id}-{$page}.html\',\n  18 => \'content-{$catid}-{$id}-{$page}.html\',\n  30 => \'list-{$catid}-{$page}.html\',\n);\n?>');
INSERT INTO `hc_cache` VALUES ('model.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n  1 => \n  array (\n    \'modelid\' => \'1\',\n    \'siteid\' => \'1\',\n    \'name\' => \'文章模型\',\n    \'description\' => \'\',\n    \'tablename\' => \'news\',\n    \'setting\' => \'\',\n    \'addtime\' => \'0\',\n    \'items\' => \'0\',\n    \'enablesearch\' => \'1\',\n    \'disabled\' => \'0\',\n    \'default_style\' => \'default\',\n    \'category_template\' => \'category\',\n    \'list_template\' => \'list\',\n    \'show_template\' => \'show\',\n    \'js_template\' => \'\',\n    \'admin_list_template\' => \'\',\n    \'member_add_template\' => \'\',\n    \'member_list_template\' => \'\',\n    \'sort\' => \'0\',\n    \'type\' => \'0\',\n  ),\n  2 => \n  array (\n    \'modelid\' => \'2\',\n    \'siteid\' => \'1\',\n    \'name\' => \'下载模型\',\n    \'description\' => \'\',\n    \'tablename\' => \'download\',\n    \'setting\' => \'\',\n    \'addtime\' => \'0\',\n    \'items\' => \'0\',\n    \'enablesearch\' => \'1\',\n    \'disabled\' => \'0\',\n    \'default_style\' => \'default\',\n    \'category_template\' => \'category_download\',\n    \'list_template\' => \'list_download\',\n    \'show_template\' => \'show_download\',\n    \'js_template\' => \'\',\n    \'admin_list_template\' => \'\',\n    \'member_add_template\' => \'\',\n    \'member_list_template\' => \'\',\n    \'sort\' => \'0\',\n    \'type\' => \'0\',\n  ),\n  3 => \n  array (\n    \'modelid\' => \'3\',\n    \'siteid\' => \'1\',\n    \'name\' => \'图片模型\',\n    \'description\' => \'\',\n    \'tablename\' => \'picture\',\n    \'setting\' => \'\',\n    \'addtime\' => \'0\',\n    \'items\' => \'0\',\n    \'enablesearch\' => \'1\',\n    \'disabled\' => \'0\',\n    \'default_style\' => \'default\',\n    \'category_template\' => \'category_picture\',\n    \'list_template\' => \'list_picture\',\n    \'show_template\' => \'show_picture\',\n    \'js_template\' => \'\',\n    \'admin_list_template\' => \'\',\n    \'member_add_template\' => \'\',\n    \'member_list_template\' => \'\',\n    \'sort\' => \'0\',\n    \'type\' => \'0\',\n  ),\n  11 => \n  array (\n    \'modelid\' => \'11\',\n    \'siteid\' => \'1\',\n    \'name\' => \'视频模型\',\n    \'description\' => \'\',\n    \'tablename\' => \'video\',\n    \'setting\' => \'\',\n    \'addtime\' => \'0\',\n    \'items\' => \'0\',\n    \'enablesearch\' => \'1\',\n    \'disabled\' => \'0\',\n    \'default_style\' => \'default\',\n    \'category_template\' => \'category_video\',\n    \'list_template\' => \'list_video\',\n    \'show_template\' => \'show_video\',\n    \'js_template\' => \'\',\n    \'admin_list_template\' => \'\',\n    \'member_add_template\' => \'\',\n    \'member_list_template\' => \'\',\n    \'sort\' => \'0\',\n    \'type\' => \'0\',\n  ),\n  12 => \n  array (\n    \'modelid\' => \'12\',\n    \'siteid\' => \'1\',\n    \'name\' => \'产品\',\n    \'description\' => \'产品\',\n    \'tablename\' => \'product\',\n    \'setting\' => \'\',\n    \'addtime\' => \'0\',\n    \'items\' => \'0\',\n    \'enablesearch\' => \'1\',\n    \'disabled\' => \'0\',\n    \'default_style\' => \'hucai\',\n    \'category_template\' => \'category_picture\',\n    \'list_template\' => \'list_picture\',\n    \'show_template\' => \'show_picture\',\n    \'js_template\' => \'\',\n    \'admin_list_template\' => \'\',\n    \'member_add_template\' => \'\',\n    \'member_list_template\' => \'\',\n    \'sort\' => \'0\',\n    \'type\' => \'0\',\n  ),\n  16 => \n  array (\n    \'modelid\' => \'16\',\n    \'siteid\' => \'1\',\n    \'name\' => \'线上定制\',\n    \'description\' => \'线上定制\',\n    \'tablename\' => \'custom_ol\',\n    \'setting\' => \'\',\n    \'addtime\' => \'0\',\n    \'items\' => \'0\',\n    \'enablesearch\' => \'1\',\n    \'disabled\' => \'0\',\n    \'default_style\' => \'hucai\',\n    \'category_template\' => \'category_custom\',\n    \'list_template\' => \'list_custom\',\n    \'show_template\' => \'show_custom\',\n    \'js_template\' => \'\',\n    \'admin_list_template\' => \'\',\n    \'member_add_template\' => \'\',\n    \'member_list_template\' => \'\',\n    \'sort\' => \'0\',\n    \'type\' => \'0\',\n  ),\n  17 => \n  array (\n    \'modelid\' => \'17\',\n    \'siteid\' => \'1\',\n    \'name\' => \'连锁门店\',\n    \'description\' => \'影像连锁门店\',\n    \'tablename\' => \'link_store\',\n    \'setting\' => \'\',\n    \'addtime\' => \'0\',\n    \'items\' => \'0\',\n    \'enablesearch\' => \'1\',\n    \'disabled\' => \'0\',\n    \'default_style\' => \'hucai\',\n    \'category_template\' => \'category\',\n    \'list_template\' => \'list\',\n    \'show_template\' => \'show\',\n    \'js_template\' => \'\',\n    \'admin_list_template\' => \'\',\n    \'member_add_template\' => \'\',\n    \'member_list_template\' => \'\',\n    \'sort\' => \'0\',\n    \'type\' => \'0\',\n  ),\n  15 => \n  array (\n    \'modelid\' => \'15\',\n    \'siteid\' => \'1\',\n    \'name\' => \'品牌活动\',\n    \'description\' => \'品牌活动模型\',\n    \'tablename\' => \'brand_activity\',\n    \'setting\' => \'\',\n    \'addtime\' => \'0\',\n    \'items\' => \'0\',\n    \'enablesearch\' => \'1\',\n    \'disabled\' => \'0\',\n    \'default_style\' => \'hucai\',\n    \'category_template\' => \'category_brand\',\n    \'list_template\' => \'list_brand\',\n    \'show_template\' => \'show_brand\',\n    \'js_template\' => \'\',\n    \'admin_list_template\' => \'\',\n    \'member_add_template\' => \'\',\n    \'member_list_template\' => \'\',\n    \'sort\' => \'0\',\n    \'type\' => \'0\',\n  ),\n);\n?>');
INSERT INTO `hc_cache` VALUES ('type_content.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n  54 => \n  array (\n    \'typeid\' => \'54\',\n    \'siteid\' => \'1\',\n    \'module\' => \'content\',\n    \'modelid\' => \'0\',\n    \'name\' => \'照片书\',\n    \'parentid\' => \'0\',\n    \'typedir\' => \'\',\n    \'url\' => \'\',\n    \'template\' => \'\',\n    \'listorder\' => \'0\',\n    \'description\' => \'\',\n  ),\n);\n?>');
INSERT INTO `hc_cache` VALUES ('workflow_1.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n  1 => \n  array (\n    \'workflowid\' => \'1\',\n    \'siteid\' => \'1\',\n    \'steps\' => \'1\',\n    \'workname\' => \'一级审核\',\n    \'description\' => \'审核一次\',\n    \'setting\' => \'\',\n    \'flag\' => \'0\',\n  ),\n  2 => \n  array (\n    \'workflowid\' => \'2\',\n    \'siteid\' => \'1\',\n    \'steps\' => \'2\',\n    \'workname\' => \'二级审核\',\n    \'description\' => \'审核两次\',\n    \'setting\' => \'\',\n    \'flag\' => \'0\',\n  ),\n  3 => \n  array (\n    \'workflowid\' => \'3\',\n    \'siteid\' => \'1\',\n    \'steps\' => \'3\',\n    \'workname\' => \'三级审核\',\n    \'description\' => \'审核三次\',\n    \'setting\' => \'\',\n    \'flag\' => \'0\',\n  ),\n  4 => \n  array (\n    \'workflowid\' => \'4\',\n    \'siteid\' => \'1\',\n    \'steps\' => \'4\',\n    \'workname\' => \'四级审核\',\n    \'description\' => \'四级审核\',\n    \'setting\' => \'\',\n    \'flag\' => \'0\',\n  ),\n);\n?>');
INSERT INTO `hc_cache` VALUES ('member_model.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n  10 => \n  array (\n    \'modelid\' => \'10\',\n    \'siteid\' => \'1\',\n    \'name\' => \'普通会员\',\n    \'description\' => \'普通会员\',\n    \'tablename\' => \'member_detail\',\n    \'setting\' => \'\',\n    \'addtime\' => \'0\',\n    \'items\' => \'0\',\n    \'enablesearch\' => \'1\',\n    \'disabled\' => \'0\',\n    \'default_style\' => \'\',\n    \'category_template\' => \'\',\n    \'list_template\' => \'\',\n    \'show_template\' => \'\',\n    \'js_template\' => \'\',\n    \'admin_list_template\' => \'\',\n    \'member_add_template\' => \'\',\n    \'member_list_template\' => \'\',\n    \'sort\' => \'0\',\n    \'type\' => \'2\',\n  ),\n);\n?>');
INSERT INTO `hc_cache` VALUES ('vote.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n);\n?>');
INSERT INTO `hc_cache` VALUES ('link.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n  1 => \n  array (\n    \'is_post\' => \'1\',\n    \'enablecheckcode\' => \'0\',\n  ),\n);\n?>');
INSERT INTO `hc_cache` VALUES ('special.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n);\n?>');
INSERT INTO `hc_cache` VALUES ('common.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n  \'admin_email\' => \'623493406@qq.com\',\n  \'maxloginfailedtimes\' => \'8\',\n  \'minrefreshtime\' => \'2\',\n  \'mail_type\' => \'1\',\n  \'mail_server\' => \'smtp.qq.com\',\n  \'mail_port\' => \'25\',\n  \'category_ajax\' => \'0\',\n  \'mail_user\' => \'623493406@qq.com\',\n  \'mail_auth\' => \'1\',\n  \'mail_from\' => \'623493406@qq.com\',\n  \'mail_password\' => \'@wdz520cc\',\n  \'errorlog_size\' => \'20\',\n);\n?>');
INSERT INTO `hc_cache` VALUES ('category_items_1.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n  2 => \'0\',\n  3 => \'2\',\n  5 => \'0\',\n  7 => \'5\',\n  8 => \'4\',\n  9 => \'4\',\n  64 => \'1\',\n);\n?>');
INSERT INTO `hc_cache` VALUES ('category_items_2.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n  65 => \'2\',\n);\n?>');
INSERT INTO `hc_cache` VALUES ('category_items_3.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n  32 => \'0\',\n);\n?>');
INSERT INTO `hc_cache` VALUES ('category_items_11.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n);\n?>');
INSERT INTO `hc_cache` VALUES ('type_content_1.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n  54 => \n  array (\n    \'typeid\' => \'54\',\n    \'siteid\' => \'1\',\n    \'module\' => \'content\',\n    \'modelid\' => \'0\',\n    \'name\' => \'照片书\',\n    \'parentid\' => \'0\',\n    \'typedir\' => \'\',\n    \'url\' => \'\',\n    \'template\' => \'\',\n    \'listorder\' => \'0\',\n    \'description\' => \'\',\n  ),\n);\n?>');
INSERT INTO `hc_cache` VALUES ('type_.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n);\n?>');
INSERT INTO `hc_cache` VALUES ('category_items_12.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n  1 => \'0\',\n  10 => \'0\',\n  11 => \'0\',\n  12 => \'0\',\n  13 => \'0\',\n  14 => \'0\',\n  15 => \'0\',\n  16 => \'1\',\n  17 => \'2\',\n  18 => \'1\',\n  19 => \'1\',\n  20 => \'0\',\n  21 => \'0\',\n  22 => \'0\',\n  23 => \'0\',\n  24 => \'0\',\n  25 => \'0\',\n  26 => \'0\',\n  27 => \'0\',\n  28 => \'0\',\n  29 => \'0\',\n  30 => \'0\',\n  31 => \'0\',\n);\n?>');
INSERT INTO `hc_cache` VALUES ('category_items_15.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n  6 => \'3\',\n);\n?>');
INSERT INTO `hc_cache` VALUES ('category_items_16.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n  4 => \'3\',\n);\n?>');
INSERT INTO `hc_cache` VALUES ('category_items_17.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n);\n?>');

-- ----------------------------
-- Table structure for `hc_category`
-- ----------------------------
DROP TABLE IF EXISTS `hc_category`;
CREATE TABLE `hc_category` (
  `catid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `module` varchar(15) NOT NULL,
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `modelid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `parentid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `arrparentid` varchar(255) NOT NULL,
  `child` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `arrchildid` mediumtext NOT NULL,
  `catname` varchar(30) NOT NULL,
  `style` varchar(5) NOT NULL,
  `image` varchar(100) NOT NULL,
  `description` mediumtext NOT NULL,
  `parentdir` varchar(100) NOT NULL,
  `catdir` varchar(30) NOT NULL,
  `url` varchar(100) NOT NULL,
  `items` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `setting` mediumtext NOT NULL,
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ismenu` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `ishelp` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否帮助',
  `sethtml` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `letter` varchar(30) NOT NULL,
  `usable_type` varchar(255) NOT NULL,
  PRIMARY KEY (`catid`),
  KEY `module` (`module`,`parentid`,`listorder`,`catid`) USING BTREE,
  KEY `siteid` (`siteid`,`type`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hc_category
-- ----------------------------
INSERT INTO `hc_category` VALUES ('1', '1', 'content', '0', '12', '0', '0', '1', '1,10,16,17,18,11,19,12,20,21,22,13,23,24,25,26,14,27,28,15,29,30,31', '印艺产品', '', '', '', '', 'products', 'http://www.hc.com/index.php?m=content&c=index&a=lists&catid=1', '0', '0', 'array (\n  \'workflowid\' => \'\',\n  \'ishtml\' => \'0\',\n  \'content_ishtml\' => \'0\',\n  \'create_to_html_root\' => \'0\',\n  \'template_list\' => \'hucai\',\n  \'category_template\' => \'category_product\',\n  \'list_template\' => \'list_product\',\n  \'show_template\' => \'show_product\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n  \'presentpoint\' => \'1\',\n  \'defaultchargepoint\' => \'0\',\n  \'paytype\' => \'0\',\n  \'repeatchargedays\' => \'1\',\n  \'category_ruleid\' => \'6\',\n  \'show_ruleid\' => \'16\',\n)', '2', '1', '0', '0', 'yinyichanpin', '');
INSERT INTO `hc_category` VALUES ('2', '1', 'content', '0', '1', '0', '0', '1', '2,7,8,9', '新闻中心', '', '', '', '', 'news', 'http://www.hc.com/index.php?m=content&c=index&a=lists&catid=2', '0', '0', 'array (\n  \'workflowid\' => \'\',\n  \'ishtml\' => \'0\',\n  \'content_ishtml\' => \'0\',\n  \'create_to_html_root\' => \'0\',\n  \'template_list\' => \'hucai\',\n  \'category_template\' => \'category_news\',\n  \'list_template\' => \'list_news\',\n  \'show_template\' => \'show_news\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n  \'presentpoint\' => \'1\',\n  \'defaultchargepoint\' => \'0\',\n  \'paytype\' => \'0\',\n  \'repeatchargedays\' => \'1\',\n  \'category_ruleid\' => \'6\',\n  \'show_ruleid\' => \'16\',\n)', '1', '1', '0', '0', 'xinwenzhongxin', '');
INSERT INTO `hc_category` VALUES ('3', '1', 'content', '0', '1', '0', '0', '0', '3', '解决方案', '', '', '', '', 'case', 'http://www.hc.com/index.php?m=content&c=index&a=lists&catid=3', '2', '0', 'array (\n  \'workflowid\' => \'\',\n  \'ishtml\' => \'0\',\n  \'content_ishtml\' => \'0\',\n  \'create_to_html_root\' => \'0\',\n  \'template_list\' => \'hucai\',\n  \'category_template\' => \'category_solutions\',\n  \'list_template\' => \'list_solutions\',\n  \'show_template\' => \'show_solutions\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n  \'presentpoint\' => \'1\',\n  \'defaultchargepoint\' => \'0\',\n  \'paytype\' => \'0\',\n  \'repeatchargedays\' => \'1\',\n  \'category_ruleid\' => \'6\',\n  \'show_ruleid\' => \'16\',\n)', '3', '1', '0', '0', 'jiejuefangan', '');
INSERT INTO `hc_category` VALUES ('4', '1', 'content', '0', '16', '0', '0', '0', '4', '线上定制', '', '', '', '', 'dingzhi', '/html/dingzhi/', '3', '0', 'array (\n  \'workflowid\' => \'\',\n  \'ishtml\' => \'1\',\n  \'content_ishtml\' => \'1\',\n  \'create_to_html_root\' => \'0\',\n  \'template_list\' => \'hucai\',\n  \'category_template\' => \'category_custom\',\n  \'list_template\' => \'list_custom\',\n  \'show_template\' => \'show_custom\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n  \'presentpoint\' => \'1\',\n  \'defaultchargepoint\' => \'0\',\n  \'paytype\' => \'0\',\n  \'repeatchargedays\' => \'1\',\n  \'category_ruleid\' => \'1\',\n  \'show_ruleid\' => \'11\',\n)', '4', '1', '0', '0', 'xianshangdingzhi', '');
INSERT INTO `hc_category` VALUES ('5', '1', 'content', '0', '1', '0', '0', '1', '5,65', '服务支持', '', '', '', '', 'service', 'http://www.hc.com/index.php?m=content&c=index&a=lists&catid=5', '0', '0', 'array (\n  \'workflowid\' => \'\',\n  \'ishtml\' => \'0\',\n  \'content_ishtml\' => \'0\',\n  \'create_to_html_root\' => \'0\',\n  \'template_list\' => \'hucai\',\n  \'category_template\' => \'category\',\n  \'list_template\' => \'list\',\n  \'show_template\' => \'show\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n  \'presentpoint\' => \'1\',\n  \'defaultchargepoint\' => \'0\',\n  \'paytype\' => \'0\',\n  \'repeatchargedays\' => \'1\',\n  \'category_ruleid\' => \'6\',\n  \'show_ruleid\' => \'16\',\n)', '5', '1', '0', '0', 'fuwuzhichi', '');
INSERT INTO `hc_category` VALUES ('6', '1', 'content', '0', '15', '0', '0', '0', '6', '品牌活动', '', '', '', '', 'brand', 'http://www.hc.com/index.php?m=content&c=index&a=lists&catid=6', '3', '0', 'array (\n  \'workflowid\' => \'\',\n  \'ishtml\' => \'0\',\n  \'content_ishtml\' => \'1\',\n  \'create_to_html_root\' => \'0\',\n  \'template_list\' => \'hucai\',\n  \'category_template\' => \'category_brand\',\n  \'list_template\' => \'list_brand\',\n  \'show_template\' => \'show_brand\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n  \'presentpoint\' => \'1\',\n  \'defaultchargepoint\' => \'0\',\n  \'paytype\' => \'0\',\n  \'repeatchargedays\' => \'1\',\n  \'category_ruleid\' => \'6\',\n  \'show_ruleid\' => \'11\',\n)', '6', '1', '0', '0', 'pinpaihuodong', '');
INSERT INTO `hc_category` VALUES ('7', '1', 'content', '0', '1', '2', '0,2', '0', '7', '行业洞察', '', '', '', 'news/', 'hangye', 'http://www.hc.com/index.php?m=content&c=index&a=lists&catid=7', '5', '0', 'array (\n  \'workflowid\' => \'\',\n  \'ishtml\' => \'0\',\n  \'content_ishtml\' => \'0\',\n  \'create_to_html_root\' => \'0\',\n  \'template_list\' => \'hucai\',\n  \'category_template\' => \'category_news\',\n  \'list_template\' => \'list_news\',\n  \'show_template\' => \'show_news\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n  \'presentpoint\' => \'1\',\n  \'defaultchargepoint\' => \'0\',\n  \'paytype\' => \'0\',\n  \'repeatchargedays\' => \'1\',\n  \'category_ruleid\' => \'6\',\n  \'show_ruleid\' => \'16\',\n)', '7', '0', '0', '0', 'xingyedongcha', '');
INSERT INTO `hc_category` VALUES ('8', '1', 'content', '0', '1', '2', '0,2', '0', '8', '虎彩新闻', '', '', '', 'news/', 'HucaiNews', 'http://www.hc.com/index.php?m=content&c=index&a=lists&catid=8', '4', '0', 'array (\n  \'workflowid\' => \'\',\n  \'ishtml\' => \'0\',\n  \'content_ishtml\' => \'0\',\n  \'create_to_html_root\' => \'0\',\n  \'template_list\' => \'hucai\',\n  \'category_template\' => \'category_news\',\n  \'list_template\' => \'list_news\',\n  \'show_template\' => \'show_news\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n  \'presentpoint\' => \'1\',\n  \'defaultchargepoint\' => \'0\',\n  \'paytype\' => \'0\',\n  \'repeatchargedays\' => \'1\',\n  \'category_ruleid\' => \'6\',\n  \'show_ruleid\' => \'16\',\n)', '8', '0', '0', '0', 'hucaixinwen', '');
INSERT INTO `hc_category` VALUES ('9', '1', 'content', '0', '1', '2', '0,2', '0', '9', '产品动态', '', '', '', 'news/', 'ProductNews', 'http://www.hc.com/index.php?m=content&c=index&a=lists&catid=9', '4', '0', 'array (\n  \'workflowid\' => \'\',\n  \'ishtml\' => \'0\',\n  \'content_ishtml\' => \'0\',\n  \'create_to_html_root\' => \'0\',\n  \'template_list\' => \'hucai\',\n  \'category_template\' => \'category_news\',\n  \'list_template\' => \'list_news\',\n  \'show_template\' => \'show_news\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n  \'presentpoint\' => \'1\',\n  \'defaultchargepoint\' => \'0\',\n  \'paytype\' => \'0\',\n  \'repeatchargedays\' => \'1\',\n  \'category_ruleid\' => \'6\',\n  \'show_ruleid\' => \'16\',\n)', '9', '0', '0', '0', 'chanpindongtai', '');
INSERT INTO `hc_category` VALUES ('10', '1', 'content', '0', '12', '1', '0,1', '1', '10,16,17,18', '高端印品', '', '', '', 'products/', 'gaoduanyinpin', 'http://www.hc.com/index.php?m=content&c=index&a=lists&catid=10', '0', '0', 'array (\n  \'workflowid\' => \'\',\n  \'ishtml\' => \'0\',\n  \'content_ishtml\' => \'0\',\n  \'create_to_html_root\' => \'0\',\n  \'template_list\' => \'hucai\',\n  \'category_template\' => \'category_product1\',\n  \'list_template\' => \'list_product\',\n  \'show_template\' => \'show_product\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n  \'presentpoint\' => \'1\',\n  \'defaultchargepoint\' => \'0\',\n  \'paytype\' => \'0\',\n  \'repeatchargedays\' => \'1\',\n  \'category_ruleid\' => \'6\',\n  \'show_ruleid\' => \'16\',\n)', '10', '1', '0', '0', 'gaoduanyinpin', '');
INSERT INTO `hc_category` VALUES ('11', '1', 'content', '0', '12', '1', '0,1', '1', '11,19', '创新印品', '', '', '', 'products/', 'chuangxinyinpin', 'http://www.hc.com/index.php?m=content&c=index&a=lists&catid=11', '0', '0', 'array (\n  \'workflowid\' => \'\',\n  \'ishtml\' => \'0\',\n  \'content_ishtml\' => \'0\',\n  \'create_to_html_root\' => \'0\',\n  \'template_list\' => \'hucai\',\n  \'category_template\' => \'category_product1\',\n  \'list_template\' => \'list_product\',\n  \'show_template\' => \'show_product\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n  \'presentpoint\' => \'1\',\n  \'defaultchargepoint\' => \'0\',\n  \'paytype\' => \'0\',\n  \'repeatchargedays\' => \'1\',\n  \'category_ruleid\' => \'6\',\n  \'show_ruleid\' => \'16\',\n)', '11', '1', '0', '0', 'chuangxinyinpin', '');
INSERT INTO `hc_category` VALUES ('12', '1', 'content', '0', '12', '1', '0,1', '1', '12,20,21,22', '个性影像', '', '', '', 'products/', 'gexingyingxiang', 'http://www.hc.com/index.php?m=content&c=index&a=lists&catid=12', '0', '0', 'array (\n  \'workflowid\' => \'\',\n  \'ishtml\' => \'0\',\n  \'content_ishtml\' => \'0\',\n  \'create_to_html_root\' => \'0\',\n  \'template_list\' => \'hucai\',\n  \'category_template\' => \'category_product1\',\n  \'list_template\' => \'list_product\',\n  \'show_template\' => \'show_product\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n  \'presentpoint\' => \'1\',\n  \'defaultchargepoint\' => \'0\',\n  \'paytype\' => \'0\',\n  \'repeatchargedays\' => \'1\',\n  \'category_ruleid\' => \'6\',\n  \'show_ruleid\' => \'16\',\n)', '12', '1', '0', '0', 'gexingyingxiang', '');
INSERT INTO `hc_category` VALUES ('13', '1', 'content', '0', '12', '1', '0,1', '1', '13,23,24,25,26', '个性包装', '', '', '', 'products/', 'gexingbaozhuang', 'http://www.hc.com/index.php?m=content&c=index&a=lists&catid=13', '0', '0', 'array (\n  \'workflowid\' => \'\',\n  \'ishtml\' => \'0\',\n  \'content_ishtml\' => \'0\',\n  \'create_to_html_root\' => \'0\',\n  \'template_list\' => \'hucai\',\n  \'category_template\' => \'category_product1\',\n  \'list_template\' => \'list_product\',\n  \'show_template\' => \'show_product\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n  \'presentpoint\' => \'1\',\n  \'defaultchargepoint\' => \'0\',\n  \'paytype\' => \'0\',\n  \'repeatchargedays\' => \'1\',\n  \'category_ruleid\' => \'6\',\n  \'show_ruleid\' => \'16\',\n)', '13', '1', '0', '0', 'gexingbaozhuang', '');
INSERT INTO `hc_category` VALUES ('14', '1', 'content', '0', '12', '1', '0,1', '1', '14,27,28', '按需印刷', '', '', '', 'products/', 'anxuyinshua', 'http://www.hc.com/index.php?m=content&c=index&a=lists&catid=14', '0', '0', 'array (\n  \'workflowid\' => \'\',\n  \'ishtml\' => \'0\',\n  \'content_ishtml\' => \'0\',\n  \'create_to_html_root\' => \'0\',\n  \'template_list\' => \'hucai\',\n  \'category_template\' => \'category_product1\',\n  \'list_template\' => \'list_product\',\n  \'show_template\' => \'show_product\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n  \'presentpoint\' => \'1\',\n  \'defaultchargepoint\' => \'0\',\n  \'paytype\' => \'0\',\n  \'repeatchargedays\' => \'1\',\n  \'category_ruleid\' => \'6\',\n  \'show_ruleid\' => \'16\',\n)', '14', '1', '0', '0', 'anxuyinshua', '');
INSERT INTO `hc_category` VALUES ('15', '1', 'content', '0', '12', '1', '0,1', '1', '15,29,30,31', '镭射防伪', '', '', '', 'products/', 'leishefangwei', 'http://www.hc.com/index.php?m=content&c=index&a=lists&catid=15', '0', '0', 'array (\n  \'workflowid\' => \'\',\n  \'ishtml\' => \'0\',\n  \'content_ishtml\' => \'0\',\n  \'create_to_html_root\' => \'0\',\n  \'template_list\' => \'hucai\',\n  \'category_template\' => \'category_product1\',\n  \'list_template\' => \'list_product\',\n  \'show_template\' => \'show_product\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n  \'presentpoint\' => \'1\',\n  \'defaultchargepoint\' => \'0\',\n  \'paytype\' => \'0\',\n  \'repeatchargedays\' => \'1\',\n  \'category_ruleid\' => \'6\',\n  \'show_ruleid\' => \'16\',\n)', '15', '1', '0', '0', 'leishefangwei', '');
INSERT INTO `hc_category` VALUES ('16', '1', 'content', '0', '12', '10', '0,1,10', '0', '16', '高端烟包', '', '', '', 'products/gaoduanyinpin/', 'gaoduanyanbao', 'http://www.hc.com/index.php?m=content&c=index&a=lists&catid=16', '1', '0', 'array (\n  \'workflowid\' => \'\',\n  \'ishtml\' => \'0\',\n  \'content_ishtml\' => \'0\',\n  \'create_to_html_root\' => \'0\',\n  \'template_list\' => \'hucai\',\n  \'category_template\' => \'category_product\',\n  \'list_template\' => \'list_product\',\n  \'show_template\' => \'show_product\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n  \'presentpoint\' => \'1\',\n  \'defaultchargepoint\' => \'0\',\n  \'paytype\' => \'0\',\n  \'repeatchargedays\' => \'1\',\n  \'category_ruleid\' => \'6\',\n  \'show_ruleid\' => \'16\',\n)', '16', '1', '0', '0', 'gaoduanyanbao', '');
INSERT INTO `hc_category` VALUES ('17', '1', 'content', '0', '12', '10', '0,1,10', '0', '17', '酒包', '', '', '', 'products/gaoduanyinpin/', 'jiubao', 'http://www.hc.com/index.php?m=content&c=index&a=lists&catid=17', '2', '0', 'array (\n  \'workflowid\' => \'\',\n  \'ishtml\' => \'0\',\n  \'content_ishtml\' => \'0\',\n  \'create_to_html_root\' => \'0\',\n  \'template_list\' => \'hucai\',\n  \'category_template\' => \'category_product\',\n  \'list_template\' => \'list_product\',\n  \'show_template\' => \'show_product\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n  \'presentpoint\' => \'1\',\n  \'defaultchargepoint\' => \'0\',\n  \'paytype\' => \'0\',\n  \'repeatchargedays\' => \'1\',\n  \'category_ruleid\' => \'6\',\n  \'show_ruleid\' => \'16\',\n)', '17', '1', '0', '0', 'jiubao', '');
INSERT INTO `hc_category` VALUES ('18', '1', 'content', '0', '12', '10', '0,1,10', '0', '18', '礼盒', '', '', '', 'products/gaoduanyinpin/', 'lihe', 'http://www.hc.com/index.php?m=content&c=index&a=lists&catid=18', '1', '0', 'array (\n  \'workflowid\' => \'\',\n  \'ishtml\' => \'0\',\n  \'content_ishtml\' => \'0\',\n  \'create_to_html_root\' => \'0\',\n  \'template_list\' => \'hucai\',\n  \'category_template\' => \'category_product\',\n  \'list_template\' => \'list_product\',\n  \'show_template\' => \'show_product\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n  \'presentpoint\' => \'1\',\n  \'defaultchargepoint\' => \'0\',\n  \'paytype\' => \'0\',\n  \'repeatchargedays\' => \'1\',\n  \'category_ruleid\' => \'6\',\n  \'show_ruleid\' => \'16\',\n)', '18', '1', '0', '0', 'lihe', '');
INSERT INTO `hc_category` VALUES ('19', '1', 'content', '0', '12', '11', '0,1,11', '0', '19', '3D印刷', '', '', '', 'products/chuangxinyinpin/', '3dyinshua', 'http://www.hc.com/index.php?m=content&c=index&a=lists&catid=19', '1', '0', 'array (\n  \'workflowid\' => \'\',\n  \'ishtml\' => \'0\',\n  \'content_ishtml\' => \'0\',\n  \'create_to_html_root\' => \'0\',\n  \'template_list\' => \'hucai\',\n  \'category_template\' => \'category_product\',\n  \'list_template\' => \'list_product\',\n  \'show_template\' => \'show_product\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n  \'presentpoint\' => \'1\',\n  \'defaultchargepoint\' => \'0\',\n  \'paytype\' => \'0\',\n  \'repeatchargedays\' => \'1\',\n  \'category_ruleid\' => \'6\',\n  \'show_ruleid\' => \'16\',\n)', '19', '1', '0', '0', '3dyinshua', '');
INSERT INTO `hc_category` VALUES ('20', '1', 'content', '0', '12', '12', '0,1,12', '0', '20', '婚纱相册', '', '', '', 'products/gexingyingxiang/', 'hunshaxiangce', 'http://www.hc.com/index.php?m=content&c=index&a=lists&catid=20', '0', '0', 'array (\n  \'workflowid\' => \'\',\n  \'ishtml\' => \'0\',\n  \'content_ishtml\' => \'0\',\n  \'create_to_html_root\' => \'0\',\n  \'template_list\' => \'hucai\',\n  \'category_template\' => \'category_product\',\n  \'list_template\' => \'list_product\',\n  \'show_template\' => \'show_product\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n  \'presentpoint\' => \'1\',\n  \'defaultchargepoint\' => \'0\',\n  \'paytype\' => \'0\',\n  \'repeatchargedays\' => \'1\',\n  \'category_ruleid\' => \'6\',\n  \'show_ruleid\' => \'16\',\n)', '20', '1', '0', '0', 'hunshaxiangce', '');
INSERT INTO `hc_category` VALUES ('21', '1', 'content', '0', '12', '12', '0,1,12', '0', '21', '个人相册', '', '', '', 'products/gexingyingxiang/', 'gerenxiangce', 'http://www.hc.com/index.php?m=content&c=index&a=lists&catid=21', '0', '0', 'array (\n  \'workflowid\' => \'\',\n  \'ishtml\' => \'0\',\n  \'content_ishtml\' => \'0\',\n  \'create_to_html_root\' => \'0\',\n  \'template_list\' => \'hucai\',\n  \'category_template\' => \'category_product\',\n  \'list_template\' => \'list_product\',\n  \'show_template\' => \'show_product\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n  \'presentpoint\' => \'1\',\n  \'defaultchargepoint\' => \'0\',\n  \'paytype\' => \'0\',\n  \'repeatchargedays\' => \'1\',\n  \'category_ruleid\' => \'6\',\n  \'show_ruleid\' => \'16\',\n)', '21', '1', '0', '0', 'gerenxiangce', '');
INSERT INTO `hc_category` VALUES ('22', '1', 'content', '0', '12', '12', '0,1,12', '0', '22', '照片书', '', '', '', 'products/gexingyingxiang/', 'zhaopianshu', 'http://www.hc.com/index.php?m=content&c=index&a=lists&catid=22', '0', '0', 'array (\n  \'workflowid\' => \'\',\n  \'ishtml\' => \'0\',\n  \'content_ishtml\' => \'0\',\n  \'create_to_html_root\' => \'0\',\n  \'template_list\' => \'hucai\',\n  \'category_template\' => \'category_product\',\n  \'list_template\' => \'list_product\',\n  \'show_template\' => \'show_product\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n  \'presentpoint\' => \'1\',\n  \'defaultchargepoint\' => \'0\',\n  \'paytype\' => \'0\',\n  \'repeatchargedays\' => \'1\',\n  \'category_ruleid\' => \'6\',\n  \'show_ruleid\' => \'16\',\n)', '22', '1', '0', '0', 'zhaopianshu', '');
INSERT INTO `hc_category` VALUES ('23', '1', 'content', '0', '12', '13', '0,1,13', '0', '23', '个人系列', '', '', '', 'products/gexingbaozhuang/', 'gerenxilie', 'http://www.hc.com/index.php?m=content&c=index&a=lists&catid=23', '0', '0', 'array (\n  \'workflowid\' => \'\',\n  \'ishtml\' => \'0\',\n  \'content_ishtml\' => \'0\',\n  \'create_to_html_root\' => \'0\',\n  \'template_list\' => \'hucai\',\n  \'category_template\' => \'category_product\',\n  \'list_template\' => \'list_product\',\n  \'show_template\' => \'show_product\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n  \'presentpoint\' => \'1\',\n  \'defaultchargepoint\' => \'0\',\n  \'paytype\' => \'0\',\n  \'repeatchargedays\' => \'1\',\n  \'category_ruleid\' => \'6\',\n  \'show_ruleid\' => \'16\',\n)', '23', '1', '0', '0', 'gerenxilie', '');
INSERT INTO `hc_category` VALUES ('24', '1', 'content', '0', '12', '13', '0,1,13', '0', '24', '婚庆系列', '', '', '', 'products/gexingbaozhuang/', 'hunqingxilie', 'http://www.hc.com/index.php?m=content&c=index&a=lists&catid=24', '0', '0', 'array (\n  \'workflowid\' => \'\',\n  \'ishtml\' => \'0\',\n  \'content_ishtml\' => \'0\',\n  \'create_to_html_root\' => \'0\',\n  \'template_list\' => \'hucai\',\n  \'category_template\' => \'category_product\',\n  \'list_template\' => \'list_product\',\n  \'show_template\' => \'show_product\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n  \'presentpoint\' => \'1\',\n  \'defaultchargepoint\' => \'0\',\n  \'paytype\' => \'0\',\n  \'repeatchargedays\' => \'1\',\n  \'category_ruleid\' => \'6\',\n  \'show_ruleid\' => \'16\',\n)', '24', '1', '0', '0', 'hunqingxilie', '');
INSERT INTO `hc_category` VALUES ('25', '1', 'content', '0', '12', '13', '0,1,13', '0', '25', '生日系列', '', '', '', 'products/gexingbaozhuang/', 'shengrixilie', 'http://www.hc.com/index.php?m=content&c=index&a=lists&catid=25', '0', '0', 'array (\n  \'workflowid\' => \'\',\n  \'ishtml\' => \'0\',\n  \'content_ishtml\' => \'0\',\n  \'create_to_html_root\' => \'0\',\n  \'template_list\' => \'hucai\',\n  \'category_template\' => \'category_product\',\n  \'list_template\' => \'list_product\',\n  \'show_template\' => \'show_product\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n  \'presentpoint\' => \'1\',\n  \'defaultchargepoint\' => \'0\',\n  \'paytype\' => \'0\',\n  \'repeatchargedays\' => \'1\',\n  \'category_ruleid\' => \'6\',\n  \'show_ruleid\' => \'16\',\n)', '25', '1', '0', '0', 'shengrixilie', '');
INSERT INTO `hc_category` VALUES ('26', '1', 'content', '0', '12', '13', '0,1,13', '0', '26', '祝寿系列', '', '', '', 'products/gexingbaozhuang/', 'zhushouxilie', 'http://www.hc.com/index.php?m=content&c=index&a=lists&catid=26', '0', '0', 'array (\n  \'workflowid\' => \'\',\n  \'ishtml\' => \'0\',\n  \'content_ishtml\' => \'0\',\n  \'create_to_html_root\' => \'0\',\n  \'template_list\' => \'hucai\',\n  \'category_template\' => \'category_product\',\n  \'list_template\' => \'list_product\',\n  \'show_template\' => \'show_product\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n  \'presentpoint\' => \'1\',\n  \'defaultchargepoint\' => \'0\',\n  \'paytype\' => \'0\',\n  \'repeatchargedays\' => \'1\',\n  \'category_ruleid\' => \'6\',\n  \'show_ruleid\' => \'16\',\n)', '26', '1', '0', '0', 'zhushouxilie', '');
INSERT INTO `hc_category` VALUES ('27', '1', 'content', '0', '12', '14', '0,1,14', '0', '27', '按需出版', '', '', '', 'products/anxuyinshua/', 'anxuchuban', 'http://www.hc.com/index.php?m=content&c=index&a=lists&catid=27', '0', '0', 'array (\n  \'workflowid\' => \'\',\n  \'ishtml\' => \'0\',\n  \'content_ishtml\' => \'0\',\n  \'create_to_html_root\' => \'0\',\n  \'template_list\' => \'hucai\',\n  \'category_template\' => \'category_product\',\n  \'list_template\' => \'list_product\',\n  \'show_template\' => \'show_product\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n  \'presentpoint\' => \'1\',\n  \'defaultchargepoint\' => \'0\',\n  \'paytype\' => \'0\',\n  \'repeatchargedays\' => \'1\',\n  \'category_ruleid\' => \'6\',\n  \'show_ruleid\' => \'16\',\n)', '27', '1', '0', '0', 'anxuchuban', '');
INSERT INTO `hc_category` VALUES ('28', '1', 'content', '0', '12', '14', '0,1,14', '0', '28', '搜书院·让图书永不断版', '', '', '', 'products/anxuyinshua/', 'soushuyuanrangtushuyongbuduanb', 'http://www.hc.com/index.php?m=content&c=index&a=lists&catid=28', '0', '0', 'array (\n  \'workflowid\' => \'\',\n  \'ishtml\' => \'0\',\n  \'content_ishtml\' => \'0\',\n  \'create_to_html_root\' => \'0\',\n  \'template_list\' => \'hucai\',\n  \'category_template\' => \'category_product\',\n  \'list_template\' => \'list_product\',\n  \'show_template\' => \'show_product\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n  \'presentpoint\' => \'1\',\n  \'defaultchargepoint\' => \'0\',\n  \'paytype\' => \'0\',\n  \'repeatchargedays\' => \'1\',\n  \'category_ruleid\' => \'6\',\n  \'show_ruleid\' => \'16\',\n)', '28', '1', '0', '0', 'soushuyuanrangtushuyongbuduanb', '');
INSERT INTO `hc_category` VALUES ('29', '1', 'content', '0', '12', '15', '0,1,15', '0', '29', '激光材料', '', '', '', 'products/leishefangwei/', 'jiguangcailiao', 'http://www.hc.com/index.php?m=content&c=index&a=lists&catid=29', '0', '0', 'array (\n  \'workflowid\' => \'\',\n  \'ishtml\' => \'0\',\n  \'content_ishtml\' => \'0\',\n  \'create_to_html_root\' => \'0\',\n  \'template_list\' => \'hucai\',\n  \'category_template\' => \'category_product\',\n  \'list_template\' => \'list_product\',\n  \'show_template\' => \'show_product\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n  \'presentpoint\' => \'1\',\n  \'defaultchargepoint\' => \'0\',\n  \'paytype\' => \'0\',\n  \'repeatchargedays\' => \'1\',\n  \'category_ruleid\' => \'6\',\n  \'show_ruleid\' => \'16\',\n)', '29', '1', '0', '0', 'jiguangcailiao', '');
INSERT INTO `hc_category` VALUES ('30', '1', 'content', '0', '12', '15', '0,1,15', '0', '30', '镭射纸', '', '', '', 'products/leishefangwei/', 'leishezhi', 'http://www.hc.com/index.php?m=content&c=index&a=lists&catid=30', '0', '0', 'array (\n  \'workflowid\' => \'\',\n  \'ishtml\' => \'0\',\n  \'content_ishtml\' => \'0\',\n  \'create_to_html_root\' => \'0\',\n  \'template_list\' => \'hucai\',\n  \'category_template\' => \'category_product\',\n  \'list_template\' => \'list_product\',\n  \'show_template\' => \'show_product\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n  \'presentpoint\' => \'1\',\n  \'defaultchargepoint\' => \'0\',\n  \'paytype\' => \'0\',\n  \'repeatchargedays\' => \'1\',\n  \'category_ruleid\' => \'6\',\n  \'show_ruleid\' => \'16\',\n)', '30', '1', '0', '0', 'leishezhi', '');
INSERT INTO `hc_category` VALUES ('31', '1', 'content', '0', '12', '15', '0,1,15', '0', '31', '镭射膜', '', '', '', 'products/leishefangwei/', 'leishemo', 'http://www.hc.com/index.php?m=content&c=index&a=lists&catid=31', '0', '0', 'array (\n  \'workflowid\' => \'\',\n  \'ishtml\' => \'0\',\n  \'content_ishtml\' => \'0\',\n  \'create_to_html_root\' => \'0\',\n  \'template_list\' => \'hucai\',\n  \'category_template\' => \'category_product\',\n  \'list_template\' => \'list_product\',\n  \'show_template\' => \'show_product\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n  \'presentpoint\' => \'1\',\n  \'defaultchargepoint\' => \'0\',\n  \'paytype\' => \'0\',\n  \'repeatchargedays\' => \'1\',\n  \'category_ruleid\' => \'6\',\n  \'show_ruleid\' => \'16\',\n)', '31', '1', '0', '0', 'leishemo', '');
INSERT INTO `hc_category` VALUES ('32', '1', 'content', '0', '3', '0', '0', '0', '32', '首页图片轮播', '', '', '', '', 'sdfds', 'http://www.hc.com/index.php?m=content&c=index&a=lists&catid=32', '0', '0', 'array (\n  \'workflowid\' => \'\',\n  \'ishtml\' => \'0\',\n  \'content_ishtml\' => \'0\',\n  \'create_to_html_root\' => \'0\',\n  \'template_list\' => \'hucai\',\n  \'category_template\' => \'category_picture\',\n  \'list_template\' => \'list_picture\',\n  \'show_template\' => \'show_picture\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n  \'presentpoint\' => \'1\',\n  \'defaultchargepoint\' => \'0\',\n  \'paytype\' => \'0\',\n  \'repeatchargedays\' => \'1\',\n  \'category_ruleid\' => \'6\',\n  \'show_ruleid\' => \'16\',\n)', '32', '0', '0', '0', 'shouyetupianlunbo', '');
INSERT INTO `hc_category` VALUES ('33', '1', 'content', '1', '0', '0', '0', '1', '33,37,38,39,40,41,42,43', '关于虎彩', '', '', '', '', 'AboutHucai', 'http://www.hc.com/index.php?m=content&c=index&a=lists&catid=33', '0', '0', 'array (\n  \'ishtml\' => \'0\',\n  \'template_list\' => \'hucai\',\n  \'page_template\' => \'page\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n  \'category_ruleid\' => \'6\',\n  \'show_ruleid\' => \'\',\n  \'repeatchargedays\' => \'1\',\n)', '33', '1', '1', '0', 'guanyuhucai', '');
INSERT INTO `hc_category` VALUES ('34', '1', 'content', '1', '0', '0', '0', '1', '34,44,45,46,47,48,49,50', '按访问者', '', '', '', '', 'anfangwenzhe', 'http://www.hc.com/index.php?m=content&c=index&a=lists&catid=34', '0', '0', 'array (\n  \'ishtml\' => \'0\',\n  \'template_list\' => \'hucai\',\n  \'page_template\' => \'page\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n  \'category_ruleid\' => \'6\',\n  \'show_ruleid\' => \'\',\n  \'repeatchargedays\' => \'1\',\n)', '34', '1', '1', '0', 'anfangwenzhe', '');
INSERT INTO `hc_category` VALUES ('35', '1', 'content', '1', '0', '0', '0', '1', '35,51,52,53,54,55,56', '新闻&活动', '', '', '', '', 'xinwenhuodong', 'http://www.hc.com/index.php?m=content&c=index&a=lists&catid=35', '0', '0', 'array (\n  \'ishtml\' => \'0\',\n  \'template_list\' => \'hucai\',\n  \'page_template\' => \'page\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n  \'category_ruleid\' => \'6\',\n  \'show_ruleid\' => \'\',\n  \'repeatchargedays\' => \'1\',\n)', '35', '1', '1', '0', 'xinwen&huodong', '');
INSERT INTO `hc_category` VALUES ('36', '1', 'content', '1', '0', '0', '0', '1', '36,57,58,59,60,61,62,63', '快捷衔接', '', '', '', '', 'kuaijiexianjie', 'http://www.hc.com/index.php?m=content&c=index&a=lists&catid=36', '0', '0', 'array (\n  \'ishtml\' => \'0\',\n  \'template_list\' => \'hucai\',\n  \'page_template\' => \'page\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n  \'category_ruleid\' => \'6\',\n  \'show_ruleid\' => \'\',\n  \'repeatchargedays\' => \'1\',\n)', '36', '1', '1', '0', 'kuaijiexianjie', '');
INSERT INTO `hc_category` VALUES ('37', '1', 'content', '1', '0', '33', '0,33', '0', '37', '虎彩概况', '', '', '', 'AboutHucai/', 'hucaigaikuang', 'http://www.hc.com/index.php?m=content&c=index&a=lists&catid=37', '0', '0', 'array (\n  \'ishtml\' => \'0\',\n  \'template_list\' => \'hucai\',\n  \'page_template\' => \'page\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n  \'category_ruleid\' => \'6\',\n  \'show_ruleid\' => \'\',\n  \'repeatchargedays\' => \'1\',\n)', '37', '1', '0', '0', 'hucaigaikuang', '');
INSERT INTO `hc_category` VALUES ('38', '1', 'content', '1', '0', '33', '0,33', '0', '38', '发展历程', '', '', '', 'AboutHucai/', 'fazhanlicheng', 'http://www.hc.com/index.php?m=content&c=index&a=lists&catid=38', '0', '0', 'array (\n  \'ishtml\' => \'0\',\n  \'template_list\' => \'hucai\',\n  \'page_template\' => \'page\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n  \'category_ruleid\' => \'6\',\n  \'show_ruleid\' => \'\',\n  \'repeatchargedays\' => \'1\',\n)', '38', '1', '0', '0', 'fazhanlicheng', '');
INSERT INTO `hc_category` VALUES ('39', '1', 'content', '1', '0', '33', '0,33', '0', '39', '品牌战略', '', '', '', 'AboutHucai/', 'pinpaizhanlue', 'http://www.hc.com/index.php?m=content&c=index&a=lists&catid=39', '0', '0', 'array (\n  \'ishtml\' => \'0\',\n  \'template_list\' => \'hucai\',\n  \'page_template\' => \'page\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n  \'category_ruleid\' => \'6\',\n  \'show_ruleid\' => \'\',\n  \'repeatchargedays\' => \'1\',\n)', '39', '1', '0', '0', 'pinpaizhanlue', '');
INSERT INTO `hc_category` VALUES ('40', '1', 'content', '1', '0', '33', '0,33', '0', '40', '企业文化', '', '', '', 'AboutHucai/', 'qiyewenhua', 'http://www.hc.com/index.php?m=content&c=index&a=lists&catid=40', '0', '0', 'array (\n  \'ishtml\' => \'0\',\n  \'template_list\' => \'hucai\',\n  \'page_template\' => \'page\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n  \'category_ruleid\' => \'6\',\n  \'show_ruleid\' => \'\',\n  \'repeatchargedays\' => \'1\',\n)', '40', '1', '0', '0', 'qiyewenhua', '');
INSERT INTO `hc_category` VALUES ('41', '1', 'content', '1', '0', '33', '0,33', '0', '41', '公益&责任', '', '', '', 'AboutHucai/', 'gongyi&zeren', 'http://www.hc.com/index.php?m=content&c=index&a=lists&catid=41', '0', '0', 'array (\n  \'ishtml\' => \'0\',\n  \'template_list\' => \'hucai\',\n  \'page_template\' => \'page\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n  \'category_ruleid\' => \'6\',\n  \'show_ruleid\' => \'\',\n  \'repeatchargedays\' => \'1\',\n)', '41', '1', '0', '0', 'gongyi&zeren', '');
INSERT INTO `hc_category` VALUES ('42', '1', 'content', '1', '0', '33', '0,33', '0', '42', '荣誉&资质', '', '', '', 'AboutHucai/', 'rongyu&zizhi', 'http://www.hc.com/index.php?m=content&c=index&a=lists&catid=42', '0', '0', 'array (\n  \'ishtml\' => \'0\',\n  \'template_list\' => \'hucai\',\n  \'page_template\' => \'page\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n  \'category_ruleid\' => \'6\',\n  \'show_ruleid\' => \'\',\n  \'repeatchargedays\' => \'1\',\n)', '42', '1', '0', '0', 'rongyu&zizhi', '');
INSERT INTO `hc_category` VALUES ('43', '1', 'content', '1', '0', '33', '0,33', '0', '43', '创新基因', '', '', '', 'AboutHucai/', 'chuangxinjiyin', 'http://www.hc.com/index.php?m=content&c=index&a=lists&catid=43', '0', '0', 'array (\n  \'ishtml\' => \'0\',\n  \'template_list\' => \'hucai\',\n  \'page_template\' => \'page\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n  \'category_ruleid\' => \'6\',\n  \'show_ruleid\' => \'\',\n  \'repeatchargedays\' => \'1\',\n)', '43', '1', '0', '0', 'chuangxinjiyin', '');
INSERT INTO `hc_category` VALUES ('44', '1', 'content', '1', '0', '34', '0,34', '0', '44', '个人用户', '', '', '', 'anfangwenzhe/', 'gerenyonghu', 'http://www.hc.com/index.php?m=content&c=index&a=lists&catid=44', '0', '0', 'array (\n  \'ishtml\' => \'0\',\n  \'template_list\' => \'hucai\',\n  \'page_template\' => \'page\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n  \'category_ruleid\' => \'6\',\n  \'show_ruleid\' => \'\',\n  \'repeatchargedays\' => \'1\',\n)', '44', '1', '0', '0', 'gerenyonghu', '');
INSERT INTO `hc_category` VALUES ('45', '1', 'content', '1', '0', '34', '0,34', '0', '45', '企业用户', '', '', '', 'anfangwenzhe/', 'qiyeyonghu', 'http://www.hc.com/index.php?m=content&c=index&a=lists&catid=45', '0', '0', 'array (\n  \'ishtml\' => \'0\',\n  \'template_list\' => \'hucai\',\n  \'page_template\' => \'page\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n  \'category_ruleid\' => \'6\',\n  \'show_ruleid\' => \'\',\n  \'repeatchargedays\' => \'1\',\n)', '45', '1', '0', '0', 'qiyeyonghu', '');
INSERT INTO `hc_category` VALUES ('46', '1', 'content', '1', '0', '34', '0,34', '0', '46', '合作伙伴', '', '', '', 'anfangwenzhe/', 'hezuohuoban', 'http://www.hc.com/index.php?m=content&c=index&a=lists&catid=46', '0', '0', 'array (\n  \'ishtml\' => \'0\',\n  \'template_list\' => \'hucai\',\n  \'page_template\' => \'page\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n  \'category_ruleid\' => \'6\',\n  \'show_ruleid\' => \'\',\n  \'repeatchargedays\' => \'1\',\n)', '46', '1', '0', '0', 'hezuohuoban', '');
INSERT INTO `hc_category` VALUES ('47', '1', 'content', '1', '0', '34', '0,34', '0', '47', '新闻媒体', '', '', '', 'anfangwenzhe/', 'xinwenmeiti', 'http://www.hc.com/index.php?m=content&c=index&a=lists&catid=47', '0', '0', 'array (\n  \'ishtml\' => \'0\',\n  \'template_list\' => \'hucai\',\n  \'page_template\' => \'page\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n  \'category_ruleid\' => \'6\',\n  \'show_ruleid\' => \'\',\n  \'repeatchargedays\' => \'1\',\n)', '47', '1', '0', '0', 'xinwenmeiti', '');
INSERT INTO `hc_category` VALUES ('48', '1', 'content', '1', '0', '34', '0,34', '0', '48', '供应商', '', '', '', 'anfangwenzhe/', 'gongyingshang', 'http://www.hc.com/index.php?m=content&c=index&a=lists&catid=48', '0', '0', 'array (\n  \'ishtml\' => \'0\',\n  \'template_list\' => \'hucai\',\n  \'page_template\' => \'page\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n  \'category_ruleid\' => \'6\',\n  \'show_ruleid\' => \'\',\n  \'repeatchargedays\' => \'1\',\n)', '48', '1', '0', '0', 'gongyingshang', '');
INSERT INTO `hc_category` VALUES ('49', '1', 'content', '1', '0', '34', '0,34', '0', '49', '求职者', '', '', '', 'anfangwenzhe/', 'qiuzhizhe', 'http://www.hc.com/index.php?m=content&c=index&a=lists&catid=49', '0', '0', 'array (\n  \'ishtml\' => \'0\',\n  \'template_list\' => \'hucai\',\n  \'page_template\' => \'page\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n  \'category_ruleid\' => \'6\',\n  \'show_ruleid\' => \'\',\n  \'repeatchargedays\' => \'1\',\n)', '49', '1', '0', '0', 'qiuzhizhe', '');
INSERT INTO `hc_category` VALUES ('50', '1', 'content', '1', '0', '34', '0,34', '0', '50', '员工驿站', '', '', '', 'anfangwenzhe/', 'yuangongzuozhan', 'http://www.hc.com/index.php?m=content&c=index&a=lists&catid=50', '0', '0', 'array (\n  \'ishtml\' => \'0\',\n  \'template_list\' => \'hucai\',\n  \'page_template\' => \'page\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n  \'category_ruleid\' => \'6\',\n  \'show_ruleid\' => \'\',\n  \'repeatchargedays\' => \'1\',\n)', '50', '1', '0', '0', 'yuangongzuozhan', '');
INSERT INTO `hc_category` VALUES ('51', '1', 'content', '2', '0', '35', '', '0', '', '新闻中心', '', '', '', '', '', 'http://www.hc.com/index.php?m=content&c=index&a=lists&catid=2', '0', '0', 'array (\n  \'show_ruleid\' => \'\',\n  \'repeatchargedays\' => \'1\',\n)', '0', '1', '0', '0', '', '');
INSERT INTO `hc_category` VALUES ('52', '1', 'content', '2', '0', '35', '', '0', '', '品牌活动', '', '', '', '', '', '#', '0', '0', 'array (\n  \'show_ruleid\' => \'\',\n  \'repeatchargedays\' => \'1\',\n)', '0', '1', '0', '0', '', '');
INSERT INTO `hc_category` VALUES ('53', '1', 'content', '2', '0', '35', '', '0', '', '下载中心', '', '', '', '', '', '#', '0', '0', 'array (\n  \'show_ruleid\' => \'\',\n  \'repeatchargedays\' => \'1\',\n)', '0', '1', '0', '0', '', '');
INSERT INTO `hc_category` VALUES ('54', '1', 'content', '2', '0', '35', '', '0', '', '第三方视角', '', '', '', '', '', '#', '0', '0', 'array (\n  \'show_ruleid\' => \'\',\n  \'repeatchargedays\' => \'1\',\n)', '0', '1', '0', '0', '', '');
INSERT INTO `hc_category` VALUES ('55', '1', 'content', '2', '0', '35', '', '0', '', '毕业季', '', '', '', '', '', '#', '0', '0', 'array (\n  \'show_ruleid\' => \'\',\n  \'repeatchargedays\' => \'1\',\n)', '0', '1', '0', '0', '', '');
INSERT INTO `hc_category` VALUES ('56', '1', 'content', '2', '0', '35', '', '0', '', '上海婚博会', '', '', '', '', '', '#', '0', '0', 'array (\n  \'show_ruleid\' => \'\',\n  \'repeatchargedays\' => \'1\',\n)', '0', '1', '0', '0', '', '');
INSERT INTO `hc_category` VALUES ('57', '1', 'content', '2', '0', '36', '', '0', '', '影像定制商城', '', '', '', '', '', '#', '0', '0', 'array (\n  \'show_ruleid\' => \'\',\n  \'repeatchargedays\' => \'1\',\n)', '0', '1', '0', '0', '', '');
INSERT INTO `hc_category` VALUES ('58', '1', 'content', '2', '0', '36', '', '0', '', '搜书院', '', '', '', '', '', '#', '0', '0', 'array (\n  \'show_ruleid\' => \'\',\n  \'repeatchargedays\' => \'1\',\n)', '0', '1', '0', '0', '', '');
INSERT INTO `hc_category` VALUES ('59', '1', 'content', '2', '0', '36', '', '0', '', '天猫旗舰店', '', '', '', '', '', '#', '0', '0', 'array (\n  \'show_ruleid\' => \'\',\n  \'repeatchargedays\' => \'1\',\n)', '0', '1', '0', '0', '', '');
INSERT INTO `hc_category` VALUES ('60', '1', 'content', '2', '0', '36', '', '0', '', '微刊', '', '', '', '', '', '#', '0', '0', 'array (\n  \'show_ruleid\' => \'\',\n  \'repeatchargedays\' => \'1\',\n)', '0', '1', '0', '0', '', '');
INSERT INTO `hc_category` VALUES ('61', '1', 'content', '2', '0', '36', '', '0', '', '视频中心', '', '', '', '', '', '#', '0', '0', 'array (\n  \'show_ruleid\' => \'\',\n  \'repeatchargedays\' => \'1\',\n)', '0', '1', '0', '0', '', '');
INSERT INTO `hc_category` VALUES ('62', '1', 'content', '2', '0', '36', '', '0', '', '体验店查询', '', '', '', '', '', '#', '0', '0', 'array (\n  \'show_ruleid\' => \'\',\n  \'repeatchargedays\' => \'1\',\n)', '0', '1', '0', '0', '', '');
INSERT INTO `hc_category` VALUES ('63', '1', 'content', '1', '0', '36', '0,36', '0', '63', '联系我们', '', '', '', 'kuaijiexianjie/', 'ContatctUs', 'http://www.hc.com/index.php?m=content&c=index&a=lists&catid=63', '0', '0', 'array (\n  \'ishtml\' => \'0\',\n  \'template_list\' => \'hucai\',\n  \'page_template\' => \'page\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n  \'category_ruleid\' => \'6\',\n  \'show_ruleid\' => \'\',\n  \'repeatchargedays\' => \'1\',\n)', '63', '1', '0', '0', 'lianxiwomen', '');
INSERT INTO `hc_category` VALUES ('64', '1', 'content', '0', '1', '0', '0', '0', '64', '网站信息', '', '', '', '', 'site', 'http://www.hc.com/index.php?m=content&c=index&a=lists&catid=64', '1', '0', 'array (\n  \'workflowid\' => \'\',\n  \'ishtml\' => \'0\',\n  \'content_ishtml\' => \'0\',\n  \'create_to_html_root\' => \'0\',\n  \'template_list\' => \'hucai\',\n  \'category_template\' => \'category\',\n  \'list_template\' => \'list\',\n  \'show_template\' => \'show\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n  \'presentpoint\' => \'1\',\n  \'defaultchargepoint\' => \'0\',\n  \'paytype\' => \'0\',\n  \'repeatchargedays\' => \'1\',\n  \'category_ruleid\' => \'6\',\n  \'show_ruleid\' => \'16\',\n)', '64', '0', '0', '0', 'wangzhanxinxi', '');
INSERT INTO `hc_category` VALUES ('65', '1', 'content', '0', '2', '5', '0,5', '0', '65', '下载中心', '', '', '', 'service/', 'download', 'http://www.hc.com/index.php?m=content&c=index&a=lists&catid=65', '2', '0', 'array (\n  \'workflowid\' => \'\',\n  \'ishtml\' => \'0\',\n  \'content_ishtml\' => \'0\',\n  \'create_to_html_root\' => \'0\',\n  \'template_list\' => \'hucai\',\n  \'category_template\' => \'category_services_download\',\n  \'list_template\' => \'list_services_download\',\n  \'show_template\' => \'show_services_download\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n  \'presentpoint\' => \'1\',\n  \'defaultchargepoint\' => \'0\',\n  \'paytype\' => \'0\',\n  \'repeatchargedays\' => \'1\',\n  \'category_ruleid\' => \'6\',\n  \'show_ruleid\' => \'16\',\n)', '65', '0', '0', '0', 'xiazaizhongxin', '');

-- ----------------------------
-- Table structure for `hc_category_priv`
-- ----------------------------
DROP TABLE IF EXISTS `hc_category_priv`;
CREATE TABLE `hc_category_priv` (
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `roleid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `is_admin` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `action` char(30) NOT NULL,
  KEY `catid` (`catid`,`roleid`,`is_admin`,`action`) USING BTREE,
  KEY `siteid` (`siteid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hc_category_priv
-- ----------------------------

-- ----------------------------
-- Table structure for `hc_collection_content`
-- ----------------------------
DROP TABLE IF EXISTS `hc_collection_content`;
CREATE TABLE `hc_collection_content` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nodeid` int(10) unsigned NOT NULL DEFAULT '0',
  `siteid` mediumint(5) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `url` char(255) NOT NULL,
  `title` char(100) NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `nodeid` (`nodeid`,`siteid`) USING BTREE,
  KEY `status` (`status`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hc_collection_content
-- ----------------------------

-- ----------------------------
-- Table structure for `hc_collection_history`
-- ----------------------------
DROP TABLE IF EXISTS `hc_collection_history`;
CREATE TABLE `hc_collection_history` (
  `md5` char(32) NOT NULL,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`md5`,`siteid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hc_collection_history
-- ----------------------------

-- ----------------------------
-- Table structure for `hc_collection_node`
-- ----------------------------
DROP TABLE IF EXISTS `hc_collection_node`;
CREATE TABLE `hc_collection_node` (
  `nodeid` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `lastdate` int(10) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `sourcecharset` varchar(8) NOT NULL,
  `sourcetype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `urlpage` text NOT NULL,
  `pagesize_start` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `pagesize_end` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `page_base` char(255) NOT NULL,
  `par_num` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `url_contain` char(100) NOT NULL,
  `url_except` char(100) NOT NULL,
  `url_start` char(100) NOT NULL DEFAULT '',
  `url_end` char(100) NOT NULL DEFAULT '',
  `title_rule` char(100) NOT NULL,
  `title_html_rule` text NOT NULL,
  `author_rule` char(100) NOT NULL,
  `author_html_rule` text NOT NULL,
  `comeform_rule` char(100) NOT NULL,
  `comeform_html_rule` text NOT NULL,
  `time_rule` char(100) NOT NULL,
  `time_html_rule` text NOT NULL,
  `content_rule` char(100) NOT NULL,
  `content_html_rule` text NOT NULL,
  `content_page_start` char(100) NOT NULL,
  `content_page_end` char(100) NOT NULL,
  `content_page_rule` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `content_page` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `content_nextpage` char(100) NOT NULL,
  `down_attachment` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `watermark` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `coll_order` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `customize_config` text NOT NULL,
  PRIMARY KEY (`nodeid`),
  KEY `siteid` (`siteid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hc_collection_node
-- ----------------------------

-- ----------------------------
-- Table structure for `hc_collection_program`
-- ----------------------------
DROP TABLE IF EXISTS `hc_collection_program`;
CREATE TABLE `hc_collection_program` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `nodeid` int(10) unsigned NOT NULL DEFAULT '0',
  `modelid` mediumint(6) unsigned NOT NULL DEFAULT '0',
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `config` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `siteid` (`siteid`) USING BTREE,
  KEY `nodeid` (`nodeid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hc_collection_program
-- ----------------------------

-- ----------------------------
-- Table structure for `hc_content_check`
-- ----------------------------
DROP TABLE IF EXISTS `hc_content_check`;
CREATE TABLE `hc_content_check` (
  `checkid` char(15) NOT NULL,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `title` char(80) NOT NULL,
  `username` char(20) NOT NULL,
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  KEY `username` (`username`) USING BTREE,
  KEY `checkid` (`checkid`) USING BTREE,
  KEY `status` (`status`,`inputtime`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hc_content_check
-- ----------------------------

-- ----------------------------
-- Table structure for `hc_copyfrom`
-- ----------------------------
DROP TABLE IF EXISTS `hc_copyfrom`;
CREATE TABLE `hc_copyfrom` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `sitename` varchar(30) NOT NULL,
  `siteurl` varchar(100) NOT NULL,
  `thumb` varchar(100) NOT NULL,
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hc_copyfrom
-- ----------------------------

-- ----------------------------
-- Table structure for `hc_custom_ol`
-- ----------------------------
DROP TABLE IF EXISTS `hc_custom_ol`;
CREATE TABLE `hc_custom_ol` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `typeid` smallint(5) unsigned NOT NULL,
  `title` char(80) NOT NULL DEFAULT '',
  `style` char(24) NOT NULL DEFAULT '',
  `thumb` char(100) NOT NULL DEFAULT '',
  `keywords` char(40) NOT NULL DEFAULT '',
  `description` mediumtext NOT NULL,
  `posids` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `url` char(100) NOT NULL,
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `sysadd` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `islink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `status` (`status`,`listorder`,`id`) USING BTREE,
  KEY `listorder` (`catid`,`status`,`listorder`,`id`) USING BTREE,
  KEY `catid` (`catid`,`status`,`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hc_custom_ol
-- ----------------------------
INSERT INTO `hc_custom_ol` VALUES ('1', '4', '0', '天猫虎彩旗舰店', '', 'http://www.hc.com/uploadfile/2015/0613/20150613030345997.jpg', '', '虎彩天猫商城是一个致力于礼物、纪念品类的个性化定制产品开发、销售的网上商城，以专营个性化定制印刷品为核心产品。经营范围涵盖照片书、照片台历挂历、文具礼品、个性杯子、个性T恤、个性卡片、水晶饰品、家居饰品等多个个性化礼品种类。', '0', 'http://www.hc.com/html/2015/dingzhi_0613/1.html', '0', '99', '1', '0', 'admin', '1434178842', '1434179039');
INSERT INTO `hc_custom_ol` VALUES ('2', '4', '0', '虎彩影像', '', 'http://www.hc.com/uploadfile/2015/0613/20150613030234452.jpg', '', '虎彩影像商城是一个致力于礼物、纪念品类的个性化定制产品开发、销售的网上商城，其运营商为广州虎彩网络科技有限公司。\r\n虎彩平台提供了强大的在线DIY客户端，通过虎彩平台，用户可以享受一站式个性印品定制服务，并轻松将照片制作成自己喜欢的各种产品，彰显个性生活，就是如此简单。 虎彩影像依托虎彩集团强大的研发与生产制造能力，正朝着“让个性化印刷进入千家万户”的宏伟目标迈进。', '0', 'http://www.hc.com/html/2015/dingzhi_0613/2.html', '0', '99', '1', '0', 'admin', '1434179055', '1434179091');
INSERT INTO `hc_custom_ol` VALUES ('3', '4', '0', '搜书院', '', 'http://www.hc.com/uploadfile/2015/0613/20150613030506932.jpg', '', '搜书院是广州虎彩网络科技有限公司旗下的网站之一，是按需出版业务的电商平台，读者通过搜书院可以订购所需图书的POD版本，我们会用先进的数字印刷技术速印制成书，并将装帧精美的图书快递至读者手中。 POD即按需出版，是一种全新出版形式，简单地说就是一本起“印”，让图书永不断版，我们目前已与百余家出版社合作，拿到近5000种图书的版权，可以说按需出版是延续了断版书的生命，重新赋予书的活力，来搜书院“搜”你想要。', '0', 'http://www.hc.com/html/2015/dingzhi_0613/3.html', '0', '99', '1', '0', 'admin', '1434179098', '1434179166');

-- ----------------------------
-- Table structure for `hc_custom_ol_data`
-- ----------------------------
DROP TABLE IF EXISTS `hc_custom_ol_data`;
CREATE TABLE `hc_custom_ol_data` (
  `id` mediumint(8) unsigned DEFAULT '0',
  `content` text NOT NULL,
  `readpoint` smallint(5) unsigned NOT NULL DEFAULT '0',
  `groupids_view` varchar(100) NOT NULL,
  `paginationtype` tinyint(1) NOT NULL,
  `maxcharperpage` mediumint(6) NOT NULL,
  `template` varchar(30) NOT NULL,
  `paytype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allow_comment` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `relation` varchar(255) NOT NULL DEFAULT '',
  `visite_link` varchar(255) NOT NULL DEFAULT '',
  KEY `id` (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hc_custom_ol_data
-- ----------------------------
INSERT INTO `hc_custom_ol_data` VALUES ('1', '', '0', '', '0', '0', '', '0', '1', '', 'http://hucai.tmall.com/');
INSERT INTO `hc_custom_ol_data` VALUES ('2', '', '0', '', '0', '0', '', '0', '1', '', 'http://www.hucai.com/');
INSERT INTO `hc_custom_ol_data` VALUES ('3', '', '0', '', '0', '0', '', '0', '1', '', 'http://www.fbook.com.cn/');

-- ----------------------------
-- Table structure for `hc_datacall`
-- ----------------------------
DROP TABLE IF EXISTS `hc_datacall`;
CREATE TABLE `hc_datacall` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` char(40) DEFAULT NULL,
  `dis_type` tinyint(1) unsigned DEFAULT '0',
  `type` tinyint(1) DEFAULT '0',
  `module` char(20) DEFAULT NULL,
  `action` char(20) DEFAULT NULL,
  `data` text,
  `template` text,
  `cache` mediumint(8) DEFAULT NULL,
  `num` smallint(6) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `type` (`type`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hc_datacall
-- ----------------------------

-- ----------------------------
-- Table structure for `hc_dbsource`
-- ----------------------------
DROP TABLE IF EXISTS `hc_dbsource`;
CREATE TABLE `hc_dbsource` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL,
  `host` varchar(20) NOT NULL,
  `port` int(5) NOT NULL DEFAULT '3306',
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `dbname` varchar(50) NOT NULL,
  `dbtablepre` varchar(30) NOT NULL,
  `charset` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `siteid` (`siteid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hc_dbsource
-- ----------------------------

-- ----------------------------
-- Table structure for `hc_download`
-- ----------------------------
DROP TABLE IF EXISTS `hc_download`;
CREATE TABLE `hc_download` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `typeid` smallint(5) unsigned NOT NULL,
  `title` char(80) NOT NULL DEFAULT '',
  `style` char(24) NOT NULL DEFAULT '',
  `thumb` varchar(100) NOT NULL DEFAULT '',
  `keywords` char(40) NOT NULL DEFAULT '',
  `description` char(255) NOT NULL DEFAULT '',
  `posids` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `url` char(100) NOT NULL,
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `sysadd` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `islink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  `systems` varchar(100) NOT NULL DEFAULT 'Win2000/WinXP/Win2003',
  `copytype` varchar(15) NOT NULL DEFAULT '',
  `language` varchar(10) NOT NULL DEFAULT '',
  `classtype` varchar(20) NOT NULL DEFAULT '',
  `version` varchar(20) NOT NULL DEFAULT '',
  `filesize` varchar(10) NOT NULL DEFAULT 'Unkown',
  `stars` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `status` (`status`,`listorder`,`id`) USING BTREE,
  KEY `listorder` (`catid`,`status`,`listorder`,`id`) USING BTREE,
  KEY `catid` (`catid`,`status`,`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hc_download
-- ----------------------------
INSERT INTO `hc_download` VALUES ('1', '65', '0', '什么是印刷，印刷的发展史？', '', '', '发展史', 'sfsdfsdfsdfsdsdfdf', '0', 'http://www.hc.com/index.php?m=content&c=index&a=show&catid=65&id=1', '0', '99', '1', '0', 'admin', '1434283232', '1434283253', 'Win2000/WinXP/Win2003', '免费版', '英文', '', '', '未知', '');
INSERT INTO `hc_download` VALUES ('2', '65', '0', '个性台历8寸竖款单面', '', '', '单面 台历 个性', 'ss', '0', 'http://www.hc.com/index.php?m=content&c=index&a=show&catid=65&id=2', '0', '99', '1', '0', 'admin', '1434283258', '1434284699', 'Win2000/WinXP/Win2003', '免费版', '英文', '', '', '未知', '');

-- ----------------------------
-- Table structure for `hc_download_data`
-- ----------------------------
DROP TABLE IF EXISTS `hc_download_data`;
CREATE TABLE `hc_download_data` (
  `id` mediumint(8) unsigned DEFAULT '0',
  `content` text NOT NULL,
  `readpoint` smallint(5) unsigned NOT NULL DEFAULT '0',
  `groupids_view` varchar(100) NOT NULL,
  `paginationtype` tinyint(1) NOT NULL,
  `maxcharperpage` mediumint(6) NOT NULL,
  `template` varchar(30) NOT NULL,
  `paytype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `relation` varchar(255) NOT NULL DEFAULT '',
  `allow_comment` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `downfiles` mediumtext NOT NULL,
  `downfile` varchar(255) NOT NULL DEFAULT '',
  KEY `id` (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hc_download_data
-- ----------------------------
INSERT INTO `hc_download_data` VALUES ('1', 'qqqq', '0', '', '0', '0', '', '0', '', '1', 'array (\n  0 => \n  array (\n    \'fileurl\' => \'http://www.hc.com/uploadfile/2015/0614/20150614080038867.zip\',\n    \'filename\' => \'custom_03\',\n  ),\n)', '|');
INSERT INTO `hc_download_data` VALUES ('2', 'sdfsdfsdf', '0', '', '0', '0', '', '0', '', '1', 'array (\n  0 => \n  array (\n    \'fileurl\' => \'http://www.hc.com/uploadfile/2015/0614/20150614082446226.zip\',\n    \'filename\' => \'custom_03\',\n  ),\n)', '|');

-- ----------------------------
-- Table structure for `hc_downservers`
-- ----------------------------
DROP TABLE IF EXISTS `hc_downservers`;
CREATE TABLE `hc_downservers` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `sitename` varchar(100) DEFAULT NULL,
  `siteurl` varchar(255) DEFAULT NULL,
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hc_downservers
-- ----------------------------

-- ----------------------------
-- Table structure for `hc_extend_setting`
-- ----------------------------
DROP TABLE IF EXISTS `hc_extend_setting`;
CREATE TABLE `hc_extend_setting` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `key` char(30) NOT NULL,
  `data` mediumtext,
  PRIMARY KEY (`id`),
  KEY `key` (`key`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hc_extend_setting
-- ----------------------------

-- ----------------------------
-- Table structure for `hc_favorite`
-- ----------------------------
DROP TABLE IF EXISTS `hc_favorite`;
CREATE TABLE `hc_favorite` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `title` char(100) NOT NULL,
  `url` char(100) NOT NULL,
  `adddate` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hc_favorite
-- ----------------------------

-- ----------------------------
-- Table structure for `hc_hits`
-- ----------------------------
DROP TABLE IF EXISTS `hc_hits`;
CREATE TABLE `hc_hits` (
  `hitsid` char(30) NOT NULL,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `views` int(10) unsigned NOT NULL DEFAULT '0',
  `yesterdayviews` int(10) unsigned NOT NULL DEFAULT '0',
  `dayviews` int(10) unsigned NOT NULL DEFAULT '0',
  `weekviews` int(10) unsigned NOT NULL DEFAULT '0',
  `monthviews` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`hitsid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hc_hits
-- ----------------------------
INSERT INTO `hc_hits` VALUES ('c-1-1', '6', '1', '0', '1', '1', '1', '1428916788');
INSERT INTO `hc_hits` VALUES ('c-1-2', '6', '0', '0', '0', '0', '0', '1431944018');
INSERT INTO `hc_hits` VALUES ('c-12-1', '9', '0', '0', '0', '0', '0', '1431944532');
INSERT INTO `hc_hits` VALUES ('c-1-3', '7', '0', '0', '0', '0', '0', '1434010160');
INSERT INTO `hc_hits` VALUES ('c-1-4', '7', '0', '0', '0', '0', '0', '1434010279');
INSERT INTO `hc_hits` VALUES ('c-1-5', '7', '2', '0', '1', '2', '2', '1434182629');
INSERT INTO `hc_hits` VALUES ('c-1-6', '8', '1', '0', '1', '1', '1', '1434011691');
INSERT INTO `hc_hits` VALUES ('c-1-7', '64', '0', '0', '0', '0', '0', '1434096674');
INSERT INTO `hc_hits` VALUES ('c-15-1', '6', '5', '0', '1', '1', '5', '1434331233');
INSERT INTO `hc_hits` VALUES ('c-15-2', '6', '1', '0', '1', '1', '1', '1434331243');
INSERT INTO `hc_hits` VALUES ('c-15-3', '6', '0', '0', '0', '0', '0', '1434171906');
INSERT INTO `hc_hits` VALUES ('c-1-9', '3', '1', '0', '1', '1', '1', '1434177774');
INSERT INTO `hc_hits` VALUES ('c-1-10', '3', '4', '0', '4', '4', '4', '1434178674');
INSERT INTO `hc_hits` VALUES ('c-16-1', '4', '0', '0', '0', '0', '0', '1434178914');
INSERT INTO `hc_hits` VALUES ('c-16-2', '4', '0', '0', '0', '0', '0', '1434179091');
INSERT INTO `hc_hits` VALUES ('c-16-3', '4', '0', '0', '0', '0', '0', '1434179166');
INSERT INTO `hc_hits` VALUES ('c-1-11', '7', '1', '0', '1', '1', '1', '1434356618');
INSERT INTO `hc_hits` VALUES ('c-1-12', '7', '1', '0', '1', '1', '1', '1434184459');
INSERT INTO `hc_hits` VALUES ('c-1-13', '8', '0', '0', '0', '0', '0', '1434185689');
INSERT INTO `hc_hits` VALUES ('c-1-14', '8', '0', '0', '0', '0', '0', '1434185700');
INSERT INTO `hc_hits` VALUES ('c-1-15', '8', '0', '0', '0', '0', '0', '1434185712');
INSERT INTO `hc_hits` VALUES ('c-2-1', '65', '0', '0', '0', '0', '0', '1434283253');
INSERT INTO `hc_hits` VALUES ('c-2-2', '65', '0', '0', '0', '0', '0', '1434283276');
INSERT INTO `hc_hits` VALUES ('c-1-16', '9', '2', '0', '2', '2', '2', '1434328470');
INSERT INTO `hc_hits` VALUES ('c-1-17', '9', '0', '0', '0', '0', '0', '1434328087');
INSERT INTO `hc_hits` VALUES ('c-1-18', '9', '0', '0', '0', '0', '0', '1434328112');
INSERT INTO `hc_hits` VALUES ('c-1-19', '9', '0', '0', '0', '0', '0', '1434328143');
INSERT INTO `hc_hits` VALUES ('c-12-2', '16', '2', '0', '2', '2', '2', '1434437231');
INSERT INTO `hc_hits` VALUES ('c-12-3', '19', '0', '0', '0', '0', '0', '1434360377');
INSERT INTO `hc_hits` VALUES ('c-12-4', '17', '0', '0', '0', '0', '0', '1434419436');
INSERT INTO `hc_hits` VALUES ('c-12-5', '18', '0', '0', '0', '0', '0', '1434419521');
INSERT INTO `hc_hits` VALUES ('c-12-6', '17', '0', '0', '0', '0', '0', '1434419585');

-- ----------------------------
-- Table structure for `hc_ipbanned`
-- ----------------------------
DROP TABLE IF EXISTS `hc_ipbanned`;
CREATE TABLE `hc_ipbanned` (
  `ipbannedid` smallint(5) NOT NULL AUTO_INCREMENT,
  `ip` char(15) NOT NULL,
  `expires` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ipbannedid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hc_ipbanned
-- ----------------------------

-- ----------------------------
-- Table structure for `hc_keylink`
-- ----------------------------
DROP TABLE IF EXISTS `hc_keylink`;
CREATE TABLE `hc_keylink` (
  `keylinkid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `word` char(40) NOT NULL,
  `url` char(100) NOT NULL,
  PRIMARY KEY (`keylinkid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hc_keylink
-- ----------------------------

-- ----------------------------
-- Table structure for `hc_keyword`
-- ----------------------------
DROP TABLE IF EXISTS `hc_keyword`;
CREATE TABLE `hc_keyword` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `keyword` char(100) NOT NULL,
  `pinyin` char(100) NOT NULL,
  `videonum` int(11) NOT NULL DEFAULT '0',
  `searchnums` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `keyword` (`keyword`,`siteid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hc_keyword
-- ----------------------------
INSERT INTO `hc_keyword` VALUES ('1', '1', 'sdfsdf', 'sdfsdf', '2', '0');
INSERT INTO `hc_keyword` VALUES ('2', '1', '照片', 'zhaopian', '5', '0');
INSERT INTO `hc_keyword` VALUES ('3', '1', '虎彩数字印刷', 'hucaishuziyinshua', '3', '0');
INSERT INTO `hc_keyword` VALUES ('4', '1', '推广会', 'tuiguanghui', '2', '0');
INSERT INTO `hc_keyword` VALUES ('5', '1', '声音', 'shengyin', '2', '0');
INSERT INTO `hc_keyword` VALUES ('6', '1', '中国外文局', 'zhongguowaiwenju', '3', '0');
INSERT INTO `hc_keyword` VALUES ('7', '1', '仪式', 'yishi', '3', '0');
INSERT INTO `hc_keyword` VALUES ('8', '1', '战略', 'zhanlue', '3', '0');
INSERT INTO `hc_keyword` VALUES ('9', '1', '极致', 'jizhi', '1', '0');
INSERT INTO `hc_keyword` VALUES ('10', '1', '数字', 'shuzi', '1', '0');
INSERT INTO `hc_keyword` VALUES ('11', '1', '市场', 'shichang', '1', '0');
INSERT INTO `hc_keyword` VALUES ('12', '1', '虎彩介绍', 'hucaijieshao', '2', '0');
INSERT INTO `hc_keyword` VALUES ('13', '1', '适当放松放松', 'shidangfangsongfangsong', '1', '0');
INSERT INTO `hc_keyword` VALUES ('14', '1', '高清', 'gaoqing', '2', '0');
INSERT INTO `hc_keyword` VALUES ('15', '1', '永不', 'yongbu', '2', '0');
INSERT INTO `hc_keyword` VALUES ('16', '1', '单面', 'danmian', '5', '0');
INSERT INTO `hc_keyword` VALUES ('17', '1', '台历', 'taili', '5', '0');
INSERT INTO `hc_keyword` VALUES ('18', '1', '个性', 'gexing', '5', '0');
INSERT INTO `hc_keyword` VALUES ('19', '1', '包装印刷', 'baozhuangyinshua', '7', '0');
INSERT INTO `hc_keyword` VALUES ('20', '1', '整体', 'zhengti', '7', '0');
INSERT INTO `hc_keyword` VALUES ('21', '1', '解决方案', 'jiejuefangan', '7', '0');
INSERT INTO `hc_keyword` VALUES ('22', '1', '进一关于进一关于开展“迎', 'jinyiguanyujinyiguanyukaizhanying', '1', '0');
INSERT INTO `hc_keyword` VALUES ('23', '1', '新闻新闻轮播2', 'xinwenxinwenlunbo2', '2', '0');
INSERT INTO `hc_keyword` VALUES ('24', '1', '新闻虎彩新闻2', 'xinwenhucaixinwen2', '1', '0');
INSERT INTO `hc_keyword` VALUES ('25', '1', '新闻虎彩新闻3', 'xinwenhucaixinwen3', '4', '0');
INSERT INTO `hc_keyword` VALUES ('26', '1', '新闻虎彩新闻4', 'xinwenhucaixinwen4', '4', '0');
INSERT INTO `hc_keyword` VALUES ('27', '1', '发展史', 'fazhanshi', '1', '0');
INSERT INTO `hc_keyword` VALUES ('28', '1', '动态', 'dongtai', '2', '0');
INSERT INTO `hc_keyword` VALUES ('29', '1', '产品产品动态一', 'chanpinchanpindongtaiyi', '1', '0');
INSERT INTO `hc_keyword` VALUES ('30', '1', '产品产品动态二', 'chanpinchanpindongtaier', '1', '0');
INSERT INTO `hc_keyword` VALUES ('31', '1', '产品动态三', 'chanpindongtaisan', '1', '0');
INSERT INTO `hc_keyword` VALUES ('32', '1', '产品动态四', 'chanpindongtaisi', '1', '0');
INSERT INTO `hc_keyword` VALUES ('33', '1', '香烟', 'xiangyan', '2', '0');
INSERT INTO `hc_keyword` VALUES ('34', '1', '王冠', 'wangguan', '1', '0');
INSERT INTO `hc_keyword` VALUES ('35', '1', '雪茄', 'xueqie', '1', '0');
INSERT INTO `hc_keyword` VALUES ('36', '1', '人头马', 'rentouma', '2', '0');
INSERT INTO `hc_keyword` VALUES ('37', '1', '彩盒', 'caihe', '1', '0');
INSERT INTO `hc_keyword` VALUES ('38', '1', '澳洲', 'aozhou', '1', '0');
INSERT INTO `hc_keyword` VALUES ('39', '1', '品牌', 'pinpai', '1', '0');

-- ----------------------------
-- Table structure for `hc_keyword_data`
-- ----------------------------
DROP TABLE IF EXISTS `hc_keyword_data`;
CREATE TABLE `hc_keyword_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tagid` int(10) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `contentid` char(30) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tagid` (`tagid`,`siteid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hc_keyword_data
-- ----------------------------
INSERT INTO `hc_keyword_data` VALUES ('1', '1', '1', '1-1');
INSERT INTO `hc_keyword_data` VALUES ('2', '1', '1', '2-1');
INSERT INTO `hc_keyword_data` VALUES ('3', '2', '1', '1-12');
INSERT INTO `hc_keyword_data` VALUES ('4', '3', '1', '3-1');
INSERT INTO `hc_keyword_data` VALUES ('5', '4', '1', '4-1');
INSERT INTO `hc_keyword_data` VALUES ('6', '5', '1', '4-1');
INSERT INTO `hc_keyword_data` VALUES ('7', '6', '1', '5-1');
INSERT INTO `hc_keyword_data` VALUES ('8', '7', '1', '5-1');
INSERT INTO `hc_keyword_data` VALUES ('9', '8', '1', '5-1');
INSERT INTO `hc_keyword_data` VALUES ('10', '9', '1', '6-1');
INSERT INTO `hc_keyword_data` VALUES ('11', '10', '1', '6-1');
INSERT INTO `hc_keyword_data` VALUES ('12', '11', '1', '6-1');
INSERT INTO `hc_keyword_data` VALUES ('13', '12', '1', '7-1');
INSERT INTO `hc_keyword_data` VALUES ('14', '13', '1', '8-1');
INSERT INTO `hc_keyword_data` VALUES ('15', '14', '1', '1-15');
INSERT INTO `hc_keyword_data` VALUES ('16', '15', '1', '1-15');
INSERT INTO `hc_keyword_data` VALUES ('17', '16', '1', '2-15');
INSERT INTO `hc_keyword_data` VALUES ('18', '17', '1', '2-15');
INSERT INTO `hc_keyword_data` VALUES ('19', '18', '1', '2-15');
INSERT INTO `hc_keyword_data` VALUES ('20', '2', '1', '3-15');
INSERT INTO `hc_keyword_data` VALUES ('21', '19', '1', '9-1');
INSERT INTO `hc_keyword_data` VALUES ('22', '20', '1', '9-1');
INSERT INTO `hc_keyword_data` VALUES ('23', '21', '1', '9-1');
INSERT INTO `hc_keyword_data` VALUES ('24', '19', '1', '10-1');
INSERT INTO `hc_keyword_data` VALUES ('25', '20', '1', '10-1');
INSERT INTO `hc_keyword_data` VALUES ('26', '21', '1', '10-1');
INSERT INTO `hc_keyword_data` VALUES ('27', '22', '1', '11-1');
INSERT INTO `hc_keyword_data` VALUES ('28', '23', '1', '12-1');
INSERT INTO `hc_keyword_data` VALUES ('29', '24', '1', '13-1');
INSERT INTO `hc_keyword_data` VALUES ('30', '25', '1', '14-1');
INSERT INTO `hc_keyword_data` VALUES ('31', '26', '1', '15-1');
INSERT INTO `hc_keyword_data` VALUES ('32', '27', '1', '1-2');
INSERT INTO `hc_keyword_data` VALUES ('33', '16', '1', '2-2');
INSERT INTO `hc_keyword_data` VALUES ('34', '17', '1', '2-2');
INSERT INTO `hc_keyword_data` VALUES ('35', '18', '1', '2-2');
INSERT INTO `hc_keyword_data` VALUES ('36', '28', '1', '16-1');
INSERT INTO `hc_keyword_data` VALUES ('37', '29', '1', '16-1');
INSERT INTO `hc_keyword_data` VALUES ('38', '28', '1', '17-1');
INSERT INTO `hc_keyword_data` VALUES ('39', '30', '1', '17-1');
INSERT INTO `hc_keyword_data` VALUES ('40', '31', '1', '18-1');
INSERT INTO `hc_keyword_data` VALUES ('41', '32', '1', '19-1');
INSERT INTO `hc_keyword_data` VALUES ('42', '33', '1', '2-12');
INSERT INTO `hc_keyword_data` VALUES ('43', '34', '1', '3-12');
INSERT INTO `hc_keyword_data` VALUES ('44', '35', '1', '3-12');
INSERT INTO `hc_keyword_data` VALUES ('45', '36', '1', '4-12');
INSERT INTO `hc_keyword_data` VALUES ('46', '37', '1', '5-12');
INSERT INTO `hc_keyword_data` VALUES ('47', '38', '1', '6-12');
INSERT INTO `hc_keyword_data` VALUES ('48', '39', '1', '6-12');

-- ----------------------------
-- Table structure for `hc_link`
-- ----------------------------
DROP TABLE IF EXISTS `hc_link`;
CREATE TABLE `hc_link` (
  `linkid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned DEFAULT '0',
  `typeid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `linktype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `logo` varchar(255) NOT NULL DEFAULT '',
  `introduce` text NOT NULL,
  `username` varchar(30) NOT NULL DEFAULT '',
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `elite` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `passed` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`linkid`),
  KEY `typeid` (`typeid`,`passed`,`listorder`,`linkid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hc_link
-- ----------------------------
INSERT INTO `hc_link` VALUES ('3', '1', '55', '0', '红塔山', 'http://baidu.com', '', '红塔山', '红塔山', '0', '1', '1', '1434073990');
INSERT INTO `hc_link` VALUES ('4', '1', '55', '0', '白沙烟', 'http://baidu.com', '', '白沙烟', '白沙烟', '0', '1', '1', '1434074014');
INSERT INTO `hc_link` VALUES ('5', '1', '55', '0', '玉溪', 'http://baidu.com', '', '玉溪', '玉溪', '0', '1', '1', '1434074092');
INSERT INTO `hc_link` VALUES ('6', '1', '55', '0', '芙蓉王', 'http://baidu.com', '', '芙蓉王', '芙蓉王', '0', '1', '1', '1434074108');
INSERT INTO `hc_link` VALUES ('7', '1', '55', '0', '中华', 'http://baidu.com', '', '中华', '中华', '0', '1', '1', '1434074129');
INSERT INTO `hc_link` VALUES ('8', '1', '55', '0', '双喜', 'http://baidu.com', '', '双喜', '双喜', '0', '1', '1', '1434074148');
INSERT INTO `hc_link` VALUES ('9', '1', '56', '0', '广州虎彩网络科技有限公司', 'http://hucai.com', '', '广州虎彩网络科技有限公司', '广州虎彩网络科技有限公司', '0', '1', '1', '1434100468');

-- ----------------------------
-- Table structure for `hc_linkage`
-- ----------------------------
DROP TABLE IF EXISTS `hc_linkage`;
CREATE TABLE `hc_linkage` (
  `linkageid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `style` varchar(35) NOT NULL,
  `parentid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `child` tinyint(1) NOT NULL,
  `arrchildid` mediumtext NOT NULL,
  `keyid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `description` varchar(255) DEFAULT NULL,
  `setting` varchar(255) DEFAULT NULL,
  `siteid` smallint(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`linkageid`,`keyid`),
  KEY `parentid` (`parentid`,`listorder`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=3360 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hc_linkage
-- ----------------------------
INSERT INTO `hc_linkage` VALUES ('1', '中国', '1', '0', '0', '', '0', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2', '北京市', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3', '上海市', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('4', '天津市', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('5', '重庆市', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('6', '河北省', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('7', '山西省', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('8', '内蒙古', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('9', '辽宁省', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('10', '吉林省', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('11', '黑龙江省', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('12', '江苏省', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('13', '浙江省', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('14', '安徽省', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('15', '福建省', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('16', '江西省', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('17', '山东省', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('18', '河南省', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('19', '湖北省', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('20', '湖南省', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('21', '广东省', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('22', '广西', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('23', '海南省', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('24', '四川省', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('25', '贵州省', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('26', '云南省', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('27', '西藏', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('28', '陕西省', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('29', '甘肃省', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('30', '青海省', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('31', '宁夏', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('32', '新疆', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('33', '台湾省', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('34', '香港', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('35', '澳门', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('36', '东城区', '0', '2', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('37', '西城区', '0', '2', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('38', '崇文区', '0', '2', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('39', '宣武区', '0', '2', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('40', '朝阳区', '0', '2', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('41', '石景山区', '0', '2', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('42', '海淀区', '0', '2', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('43', '门头沟区', '0', '2', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('44', '房山区', '0', '2', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('45', '通州区', '0', '2', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('46', '顺义区', '0', '2', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('47', '昌平区', '0', '2', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('48', '大兴区', '0', '2', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('49', '怀柔区', '0', '2', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('50', '平谷区', '0', '2', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('51', '密云县', '0', '2', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('52', '延庆县', '0', '2', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('53', '黄浦区', '0', '3', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('54', '卢湾区', '0', '3', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('55', '徐汇区', '0', '3', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('56', '长宁区', '0', '3', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('57', '静安区', '0', '3', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('58', '普陀区', '0', '3', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('59', '闸北区', '0', '3', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('60', '虹口区', '0', '3', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('61', '杨浦区', '0', '3', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('62', '闵行区', '0', '3', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('63', '宝山区', '0', '3', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('64', '嘉定区', '0', '3', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('65', '浦东新区', '0', '3', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('66', '金山区', '0', '3', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('67', '松江区', '0', '3', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('68', '青浦区', '0', '3', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('69', '南汇区', '0', '3', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('70', '奉贤区', '0', '3', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('71', '崇明县', '0', '3', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('72', '和平区', '0', '4', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('73', '河东区', '0', '4', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('74', '河西区', '0', '4', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('75', '南开区', '0', '4', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('76', '河北区', '0', '4', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('77', '红桥区', '0', '4', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('78', '塘沽区', '0', '4', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('79', '汉沽区', '0', '4', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('80', '大港区', '0', '4', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('81', '东丽区', '0', '4', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('82', '西青区', '0', '4', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('83', '津南区', '0', '4', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('84', '北辰区', '0', '4', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('85', '武清区', '0', '4', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('86', '宝坻区', '0', '4', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('87', '宁河县', '0', '4', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('88', '静海县', '0', '4', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('89', '蓟县', '0', '4', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('90', '万州区', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('91', '涪陵区', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('92', '渝中区', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('93', '大渡口区', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('94', '江北区', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('95', '沙坪坝区', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('96', '九龙坡区', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('97', '南岸区', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('98', '北碚区', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('99', '万盛区', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('100', '双桥区', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('101', '渝北区', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('102', '巴南区', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('103', '黔江区', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('104', '长寿区', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('105', '綦江县', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('106', '潼南县', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('107', '铜梁县', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('108', '大足县', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('109', '荣昌县', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('110', '璧山县', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('111', '梁平县', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('112', '城口县', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('113', '丰都县', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('114', '垫江县', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('115', '武隆县', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('116', '忠县', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('117', '开县', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('118', '云阳县', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('119', '奉节县', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('120', '巫山县', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('121', '巫溪县', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('122', '石柱县', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('123', '秀山县', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('124', '酉阳县', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('125', '彭水县', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('126', '江津区', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('127', '合川区', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('128', '永川区', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('129', '南川区', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('130', '石家庄市', '0', '6', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('131', '唐山市', '0', '6', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('132', '秦皇岛市', '0', '6', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('133', '邯郸市', '0', '6', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('134', '邢台市', '0', '6', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('135', '保定市', '0', '6', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('136', '张家口市', '0', '6', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('137', '承德市', '0', '6', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('138', '沧州市', '0', '6', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('139', '廊坊市', '0', '6', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('140', '衡水市', '0', '6', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('141', '太原市', '0', '7', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('142', '大同市', '0', '7', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('143', '阳泉市', '0', '7', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('144', '长治市', '0', '7', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('145', '晋城市', '0', '7', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('146', '朔州市', '0', '7', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('147', '晋中市', '0', '7', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('148', '运城市', '0', '7', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('149', '忻州市', '0', '7', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('150', '临汾市', '0', '7', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('151', '吕梁市', '0', '7', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('152', '呼和浩特市', '0', '8', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('153', '包头市', '0', '8', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('154', '乌海市', '0', '8', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('155', '赤峰市', '0', '8', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('156', '通辽市', '0', '8', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('157', '鄂尔多斯市', '0', '8', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('158', '呼伦贝尔市', '0', '8', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('159', '巴彦淖尔市', '0', '8', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('160', '乌兰察布市', '0', '8', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('161', '兴安盟', '0', '8', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('162', '锡林郭勒盟', '0', '8', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('163', '阿拉善盟', '0', '8', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('164', '沈阳市', '0', '9', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('165', '大连市', '0', '9', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('166', '鞍山市', '0', '9', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('167', '抚顺市', '0', '9', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('168', '本溪市', '0', '9', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('169', '丹东市', '0', '9', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('170', '锦州市', '0', '9', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('171', '营口市', '0', '9', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('172', '阜新市', '0', '9', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('173', '辽阳市', '0', '9', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('174', '盘锦市', '0', '9', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('175', '铁岭市', '0', '9', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('176', '朝阳市', '0', '9', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('177', '葫芦岛市', '0', '9', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('178', '长春市', '0', '10', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('179', '吉林市', '0', '10', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('180', '四平市', '0', '10', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('181', '辽源市', '0', '10', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('182', '通化市', '0', '10', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('183', '白山市', '0', '10', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('184', '松原市', '0', '10', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('185', '白城市', '0', '10', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('186', '延边', '0', '10', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('187', '哈尔滨市', '0', '11', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('188', '齐齐哈尔市', '0', '11', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('189', '鸡西市', '0', '11', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('190', '鹤岗市', '0', '11', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('191', '双鸭山市', '0', '11', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('192', '大庆市', '0', '11', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('193', '伊春市', '0', '11', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('194', '佳木斯市', '0', '11', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('195', '七台河市', '0', '11', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('196', '牡丹江市', '0', '11', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('197', '黑河市', '0', '11', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('198', '绥化市', '0', '11', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('199', '大兴安岭地区', '0', '11', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('200', '南京市', '0', '12', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('201', '无锡市', '0', '12', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('202', '徐州市', '0', '12', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('203', '常州市', '0', '12', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('204', '苏州市', '0', '12', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('205', '南通市', '0', '12', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('206', '连云港市', '0', '12', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('207', '淮安市', '0', '12', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('208', '盐城市', '0', '12', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('209', '扬州市', '0', '12', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('210', '镇江市', '0', '12', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('211', '泰州市', '0', '12', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('212', '宿迁市', '0', '12', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('213', '杭州市', '0', '13', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('214', '宁波市', '0', '13', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('215', '温州市', '0', '13', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('216', '嘉兴市', '0', '13', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('217', '湖州市', '0', '13', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('218', '绍兴市', '0', '13', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('219', '金华市', '0', '13', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('220', '衢州市', '0', '13', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('221', '舟山市', '0', '13', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('222', '台州市', '0', '13', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('223', '丽水市', '0', '13', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('224', '合肥市', '0', '14', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('225', '芜湖市', '0', '14', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('226', '蚌埠市', '0', '14', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('227', '淮南市', '0', '14', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('228', '马鞍山市', '0', '14', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('229', '淮北市', '0', '14', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('230', '铜陵市', '0', '14', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('231', '安庆市', '0', '14', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('232', '黄山市', '0', '14', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('233', '滁州市', '0', '14', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('234', '阜阳市', '0', '14', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('235', '宿州市', '0', '14', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('236', '巢湖市', '0', '14', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('237', '六安市', '0', '14', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('238', '亳州市', '0', '14', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('239', '池州市', '0', '14', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('240', '宣城市', '0', '14', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('241', '福州市', '0', '15', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('242', '厦门市', '0', '15', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('243', '莆田市', '0', '15', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('244', '三明市', '0', '15', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('245', '泉州市', '0', '15', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('246', '漳州市', '0', '15', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('247', '南平市', '0', '15', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('248', '龙岩市', '0', '15', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('249', '宁德市', '0', '15', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('250', '南昌市', '0', '16', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('251', '景德镇市', '0', '16', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('252', '萍乡市', '0', '16', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('253', '九江市', '0', '16', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('254', '新余市', '0', '16', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('255', '鹰潭市', '0', '16', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('256', '赣州市', '0', '16', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('257', '吉安市', '0', '16', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('258', '宜春市', '0', '16', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('259', '抚州市', '0', '16', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('260', '上饶市', '0', '16', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('261', '济南市', '0', '17', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('262', '青岛市', '0', '17', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('263', '淄博市', '0', '17', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('264', '枣庄市', '0', '17', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('265', '东营市', '0', '17', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('266', '烟台市', '0', '17', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('267', '潍坊市', '0', '17', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('268', '济宁市', '0', '17', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('269', '泰安市', '0', '17', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('270', '威海市', '0', '17', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('271', '日照市', '0', '17', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('272', '莱芜市', '0', '17', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('273', '临沂市', '0', '17', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('274', '德州市', '0', '17', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('275', '聊城市', '0', '17', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('276', '滨州市', '0', '17', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('277', '荷泽市', '0', '17', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('278', '郑州市', '0', '18', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('279', '开封市', '0', '18', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('280', '洛阳市', '0', '18', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('281', '平顶山市', '0', '18', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('282', '安阳市', '0', '18', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('283', '鹤壁市', '0', '18', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('284', '新乡市', '0', '18', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('285', '焦作市', '0', '18', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('286', '濮阳市', '0', '18', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('287', '许昌市', '0', '18', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('288', '漯河市', '0', '18', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('289', '三门峡市', '0', '18', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('290', '南阳市', '0', '18', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('291', '商丘市', '0', '18', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('292', '信阳市', '0', '18', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('293', '周口市', '0', '18', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('294', '驻马店市', '0', '18', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('295', '武汉市', '0', '19', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('296', '黄石市', '0', '19', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('297', '十堰市', '0', '19', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('298', '宜昌市', '0', '19', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('299', '襄樊市', '0', '19', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('300', '鄂州市', '0', '19', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('301', '荆门市', '0', '19', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('302', '孝感市', '0', '19', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('303', '荆州市', '0', '19', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('304', '黄冈市', '0', '19', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('305', '咸宁市', '0', '19', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('306', '随州市', '0', '19', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('307', '恩施土家族苗族自治州', '0', '19', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('308', '仙桃市', '0', '19', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('309', '潜江市', '0', '19', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('310', '天门市', '0', '19', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('311', '神农架林区', '0', '19', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('312', '长沙市', '0', '20', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('313', '株洲市', '0', '20', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('314', '湘潭市', '0', '20', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('315', '衡阳市', '0', '20', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('316', '邵阳市', '0', '20', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('317', '岳阳市', '0', '20', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('318', '常德市', '0', '20', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('319', '张家界市', '0', '20', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('320', '益阳市', '0', '20', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('321', '郴州市', '0', '20', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('322', '永州市', '0', '20', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('323', '怀化市', '0', '20', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('324', '娄底市', '0', '20', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('325', '湘西土家族苗族自治州', '0', '20', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('326', '广州市', '0', '21', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('327', '韶关市', '0', '21', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('328', '深圳市', '0', '21', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('329', '珠海市', '0', '21', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('330', '汕头市', '0', '21', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('331', '佛山市', '0', '21', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('332', '江门市', '0', '21', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('333', '湛江市', '0', '21', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('334', '茂名市', '0', '21', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('335', '肇庆市', '0', '21', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('336', '惠州市', '0', '21', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('337', '梅州市', '0', '21', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('338', '汕尾市', '0', '21', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('339', '河源市', '0', '21', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('340', '阳江市', '0', '21', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('341', '清远市', '0', '21', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('342', '东莞市', '0', '21', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('343', '中山市', '0', '21', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('344', '潮州市', '0', '21', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('345', '揭阳市', '0', '21', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('346', '云浮市', '0', '21', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('347', '南宁市', '0', '22', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('348', '柳州市', '0', '22', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('349', '桂林市', '0', '22', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('350', '梧州市', '0', '22', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('351', '北海市', '0', '22', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('352', '防城港市', '0', '22', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('353', '钦州市', '0', '22', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('354', '贵港市', '0', '22', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('355', '玉林市', '0', '22', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('356', '百色市', '0', '22', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('357', '贺州市', '0', '22', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('358', '河池市', '0', '22', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('359', '来宾市', '0', '22', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('360', '崇左市', '0', '22', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('361', '海口市', '0', '23', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('362', '三亚市', '0', '23', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('363', '五指山市', '0', '23', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('364', '琼海市', '0', '23', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('365', '儋州市', '0', '23', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('366', '文昌市', '0', '23', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('367', '万宁市', '0', '23', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('368', '东方市', '0', '23', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('369', '定安县', '0', '23', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('370', '屯昌县', '0', '23', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('371', '澄迈县', '0', '23', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('372', '临高县', '0', '23', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('373', '白沙黎族自治县', '0', '23', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('374', '昌江黎族自治县', '0', '23', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('375', '乐东黎族自治县', '0', '23', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('376', '陵水黎族自治县', '0', '23', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('377', '保亭黎族苗族自治县', '0', '23', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('378', '琼中黎族苗族自治县', '0', '23', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('379', '西沙群岛', '0', '23', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('380', '南沙群岛', '0', '23', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('381', '中沙群岛的岛礁及其海域', '0', '23', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('382', '成都市', '0', '24', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('383', '自贡市', '0', '24', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('384', '攀枝花市', '0', '24', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('385', '泸州市', '0', '24', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('386', '德阳市', '0', '24', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('387', '绵阳市', '0', '24', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('388', '广元市', '0', '24', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('389', '遂宁市', '0', '24', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('390', '内江市', '0', '24', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('391', '乐山市', '0', '24', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('392', '南充市', '0', '24', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('393', '眉山市', '0', '24', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('394', '宜宾市', '0', '24', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('395', '广安市', '0', '24', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('396', '达州市', '0', '24', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('397', '雅安市', '0', '24', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('398', '巴中市', '0', '24', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('399', '资阳市', '0', '24', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('400', '阿坝州', '0', '24', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('401', '甘孜州', '0', '24', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('402', '凉山州', '0', '24', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('403', '贵阳市', '0', '25', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('404', '六盘水市', '0', '25', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('405', '遵义市', '0', '25', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('406', '安顺市', '0', '25', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('407', '铜仁地区', '0', '25', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('408', '黔西南州', '0', '25', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('409', '毕节地区', '0', '25', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('410', '黔东南州', '0', '25', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('411', '黔南州', '0', '25', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('412', '昆明市', '0', '26', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('413', '曲靖市', '0', '26', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('414', '玉溪市', '0', '26', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('415', '保山市', '0', '26', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('416', '昭通市', '0', '26', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('417', '丽江市', '0', '26', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('418', '思茅市', '0', '26', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('419', '临沧市', '0', '26', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('420', '楚雄州', '0', '26', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('421', '红河州', '0', '26', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('422', '文山州', '0', '26', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('423', '西双版纳', '0', '26', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('424', '大理', '0', '26', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('425', '德宏', '0', '26', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('426', '怒江', '0', '26', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('427', '迪庆', '0', '26', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('428', '拉萨市', '0', '27', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('429', '昌都', '0', '27', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('430', '山南', '0', '27', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('431', '日喀则', '0', '27', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('432', '那曲', '0', '27', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('433', '阿里', '0', '27', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('434', '林芝', '0', '27', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('435', '西安市', '0', '28', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('436', '铜川市', '0', '28', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('437', '宝鸡市', '0', '28', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('438', '咸阳市', '0', '28', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('439', '渭南市', '0', '28', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('440', '延安市', '0', '28', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('441', '汉中市', '0', '28', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('442', '榆林市', '0', '28', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('443', '安康市', '0', '28', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('444', '商洛市', '0', '28', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('445', '兰州市', '0', '29', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('446', '嘉峪关市', '0', '29', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('447', '金昌市', '0', '29', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('448', '白银市', '0', '29', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('449', '天水市', '0', '29', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('450', '武威市', '0', '29', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('451', '张掖市', '0', '29', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('452', '平凉市', '0', '29', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('453', '酒泉市', '0', '29', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('454', '庆阳市', '0', '29', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('455', '定西市', '0', '29', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('456', '陇南市', '0', '29', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('457', '临夏州', '0', '29', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('458', '甘州', '0', '29', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('459', '西宁市', '0', '30', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('460', '海东地区', '0', '30', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('461', '海州', '0', '30', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('462', '黄南州', '0', '30', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('463', '海南州', '0', '30', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('464', '果洛州', '0', '30', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('465', '玉树州', '0', '30', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('466', '海西州', '0', '30', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('467', '银川市', '0', '31', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('468', '石嘴山市', '0', '31', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('469', '吴忠市', '0', '31', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('470', '固原市', '0', '31', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('471', '中卫市', '0', '31', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('472', '乌鲁木齐市', '0', '32', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('473', '克拉玛依市', '0', '32', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('474', '吐鲁番地区', '0', '32', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('475', '哈密地区', '0', '32', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('476', '昌吉州', '0', '32', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('477', '博尔州', '0', '32', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('478', '巴音郭楞州', '0', '32', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('479', '阿克苏地区', '0', '32', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('480', '克孜勒苏柯尔克孜自治州', '0', '32', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('481', '喀什地区', '0', '32', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('482', '和田地区', '0', '32', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('483', '伊犁州', '0', '32', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('484', '塔城地区', '0', '32', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('485', '阿勒泰地区', '0', '32', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('486', '石河子市', '0', '32', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('487', '阿拉尔市', '0', '32', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('488', '图木舒克市', '0', '32', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('489', '五家渠市', '0', '32', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('490', '台北市', '0', '33', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('491', '高雄市', '0', '33', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('492', '基隆市', '0', '33', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('493', '新竹市', '0', '33', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('494', '台中市', '0', '33', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('495', '嘉义市', '0', '33', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('496', '台南市', '0', '33', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('497', '台北县', '0', '33', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('498', '桃园县', '0', '33', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('499', '新竹县', '0', '33', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('500', '苗栗县', '0', '33', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('501', '台中县', '0', '33', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('502', '彰化县', '0', '33', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('503', '南投县', '0', '33', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('504', '云林县', '0', '33', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('505', '嘉义县', '0', '33', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('506', '台南县', '0', '33', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('507', '高雄县', '0', '33', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('508', '屏东县', '0', '33', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('509', '宜兰县', '0', '33', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('510', '花莲县', '0', '33', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('511', '台东县', '0', '33', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('512', '澎湖县', '0', '33', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('513', '金门县', '0', '33', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('514', '连江县', '0', '33', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('515', '中西区', '0', '34', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('516', '东区', '0', '34', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('517', '南区', '0', '34', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('518', '湾仔区', '0', '34', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('519', '九龙城区', '0', '34', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('520', '观塘区', '0', '34', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('521', '深水埗区', '0', '34', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('522', '黄大仙区', '0', '34', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('523', '油尖旺区', '0', '34', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('524', '离岛区', '0', '34', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('525', '葵青区', '0', '34', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('526', '北区', '0', '34', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('527', '西贡区', '0', '34', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('528', '沙田区', '0', '34', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('529', '大埔区', '0', '34', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('530', '荃湾区', '0', '34', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('531', '屯门区', '0', '34', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('532', '元朗区', '0', '34', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('533', '花地玛堂区', '0', '35', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('534', '市圣安多尼堂区', '0', '35', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('535', '大堂区', '0', '35', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('536', '望德堂区', '0', '35', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('537', '风顺堂区', '0', '35', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('538', '嘉模堂区', '0', '35', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('539', '圣方济各堂区', '0', '35', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('540', '长安区', '0', '130', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('541', '桥东区', '0', '130', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('542', '桥西区', '0', '130', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('543', '新华区', '0', '130', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('544', '井陉矿区', '0', '130', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('545', '裕华区', '0', '130', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('546', '井陉县', '0', '130', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('547', '正定县', '0', '130', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('548', '栾城县', '0', '130', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('549', '行唐县', '0', '130', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('550', '灵寿县', '0', '130', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('551', '高邑县', '0', '130', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('552', '深泽县', '0', '130', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('553', '赞皇县', '0', '130', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('554', '无极县', '0', '130', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('555', '平山县', '0', '130', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('556', '元氏县', '0', '130', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('557', '赵县', '0', '130', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('558', '辛集市', '0', '130', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('559', '藁城市', '0', '130', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('560', '晋州市', '0', '130', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('561', '新乐市', '0', '130', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('562', '鹿泉市', '0', '130', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('563', '路南区', '0', '131', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('564', '路北区', '0', '131', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('565', '古冶区', '0', '131', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('566', '开平区', '0', '131', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('567', '丰南区', '0', '131', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('568', '丰润区', '0', '131', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('569', '滦县', '0', '131', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('570', '滦南县', '0', '131', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('571', '乐亭县', '0', '131', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('572', '迁西县', '0', '131', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('573', '玉田县', '0', '131', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('574', '唐海县', '0', '131', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('575', '遵化市', '0', '131', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('576', '迁安市', '0', '131', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('577', '海港区', '0', '132', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('578', '山海关区', '0', '132', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('579', '北戴河区', '0', '132', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('580', '青龙县', '0', '132', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('581', '昌黎县', '0', '132', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('582', '抚宁县', '0', '132', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('583', '卢龙县', '0', '132', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('584', '邯山区', '0', '133', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('585', '丛台区', '0', '133', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('586', '复兴区', '0', '133', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('587', '峰峰矿区', '0', '133', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('588', '邯郸县', '0', '133', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('589', '临漳县', '0', '133', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('590', '成安县', '0', '133', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('591', '大名县', '0', '133', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('592', '涉县', '0', '133', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('593', '磁县', '0', '133', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('594', '肥乡县', '0', '133', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('595', '永年县', '0', '133', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('596', '邱县', '0', '133', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('597', '鸡泽县', '0', '133', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('598', '广平县', '0', '133', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('599', '馆陶县', '0', '133', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('600', '魏县', '0', '133', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('601', '曲周县', '0', '133', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('602', '武安市', '0', '133', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('603', '桥东区', '0', '134', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('604', '桥西区', '0', '134', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('605', '邢台县', '0', '134', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('606', '临城县', '0', '134', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('607', '内丘县', '0', '134', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('608', '柏乡县', '0', '134', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('609', '隆尧县', '0', '134', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('610', '任县', '0', '134', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('611', '南和县', '0', '134', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('612', '宁晋县', '0', '134', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('613', '巨鹿县', '0', '134', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('614', '新河县', '0', '134', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('615', '广宗县', '0', '134', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('616', '平乡县', '0', '134', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('617', '威县', '0', '134', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('618', '清河县', '0', '134', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('619', '临西县', '0', '134', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('620', '南宫市', '0', '134', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('621', '沙河市', '0', '134', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('622', '新市区', '0', '135', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('623', '北市区', '0', '135', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('624', '南市区', '0', '135', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('625', '满城县', '0', '135', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('626', '清苑县', '0', '135', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('627', '涞水县', '0', '135', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('628', '阜平县', '0', '135', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('629', '徐水县', '0', '135', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('630', '定兴县', '0', '135', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('631', '唐县', '0', '135', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('632', '高阳县', '0', '135', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('633', '容城县', '0', '135', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('634', '涞源县', '0', '135', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('635', '望都县', '0', '135', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('636', '安新县', '0', '135', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('637', '易县', '0', '135', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('638', '曲阳县', '0', '135', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('639', '蠡县', '0', '135', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('640', '顺平县', '0', '135', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('641', '博野县', '0', '135', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('642', '雄县', '0', '135', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('643', '涿州市', '0', '135', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('644', '定州市', '0', '135', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('645', '安国市', '0', '135', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('646', '高碑店市', '0', '135', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('647', '桥东区', '0', '136', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('648', '桥西区', '0', '136', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('649', '宣化区', '0', '136', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('650', '下花园区', '0', '136', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('651', '宣化县', '0', '136', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('652', '张北县', '0', '136', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('653', '康保县', '0', '136', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('654', '沽源县', '0', '136', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('655', '尚义县', '0', '136', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('656', '蔚县', '0', '136', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('657', '阳原县', '0', '136', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('658', '怀安县', '0', '136', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('659', '万全县', '0', '136', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('660', '怀来县', '0', '136', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('661', '涿鹿县', '0', '136', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('662', '赤城县', '0', '136', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('663', '崇礼县', '0', '136', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('664', '双桥区', '0', '137', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('665', '双滦区', '0', '137', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('666', '鹰手营子矿区', '0', '137', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('667', '承德县', '0', '137', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('668', '兴隆县', '0', '137', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('669', '平泉县', '0', '137', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('670', '滦平县', '0', '137', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('671', '隆化县', '0', '137', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('672', '丰宁县', '0', '137', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('673', '宽城县', '0', '137', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('674', '围场县', '0', '137', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('675', '新华区', '0', '138', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('676', '运河区', '0', '138', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('677', '沧县', '0', '138', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('678', '青县', '0', '138', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('679', '东光县', '0', '138', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('680', '海兴县', '0', '138', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('681', '盐山县', '0', '138', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('682', '肃宁县', '0', '138', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('683', '南皮县', '0', '138', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('684', '吴桥县', '0', '138', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('685', '献县', '0', '138', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('686', '孟村县', '0', '138', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('687', '泊头市', '0', '138', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('688', '任丘市', '0', '138', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('689', '黄骅市', '0', '138', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('690', '河间市', '0', '138', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('691', '安次区', '0', '139', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('692', '广阳区', '0', '139', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('693', '固安县', '0', '139', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('694', '永清县', '0', '139', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('695', '香河县', '0', '139', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('696', '大城县', '0', '139', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('697', '文安县', '0', '139', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('698', '大厂县', '0', '139', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('699', '霸州市', '0', '139', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('700', '三河市', '0', '139', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('701', '桃城区', '0', '140', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('702', '枣强县', '0', '140', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('703', '武邑县', '0', '140', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('704', '武强县', '0', '140', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('705', '饶阳县', '0', '140', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('706', '安平县', '0', '140', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('707', '故城县', '0', '140', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('708', '景县', '0', '140', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('709', '阜城县', '0', '140', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('710', '冀州市', '0', '140', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('711', '深州市', '0', '140', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('712', '小店区', '0', '141', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('713', '迎泽区', '0', '141', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('714', '杏花岭区', '0', '141', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('715', '尖草坪区', '0', '141', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('716', '万柏林区', '0', '141', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('717', '晋源区', '0', '141', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('718', '清徐县', '0', '141', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('719', '阳曲县', '0', '141', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('720', '娄烦县', '0', '141', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('721', '古交市', '0', '141', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('722', '城区', '0', '142', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('723', '矿区', '0', '142', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('724', '南郊区', '0', '142', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('725', '新荣区', '0', '142', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('726', '阳高县', '0', '142', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('727', '天镇县', '0', '142', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('728', '广灵县', '0', '142', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('729', '灵丘县', '0', '142', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('730', '浑源县', '0', '142', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('731', '左云县', '0', '142', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('732', '大同县', '0', '142', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('733', '城区', '0', '143', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('734', '矿区', '0', '143', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('735', '郊区', '0', '143', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('736', '平定县', '0', '143', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('737', '盂县', '0', '143', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('738', '城区', '0', '144', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('739', '郊区', '0', '144', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('740', '长治县', '0', '144', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('741', '襄垣县', '0', '144', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('742', '屯留县', '0', '144', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('743', '平顺县', '0', '144', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('744', '黎城县', '0', '144', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('745', '壶关县', '0', '144', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('746', '长子县', '0', '144', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('747', '武乡县', '0', '144', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('748', '沁县', '0', '144', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('749', '沁源县', '0', '144', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('750', '潞城市', '0', '144', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('751', '城区', '0', '145', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('752', '沁水县', '0', '145', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('753', '阳城县', '0', '145', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('754', '陵川县', '0', '145', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('755', '泽州县', '0', '145', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('756', '高平市', '0', '145', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('757', '朔城区', '0', '146', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('758', '平鲁区', '0', '146', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('759', '山阴县', '0', '146', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('760', '应县', '0', '146', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('761', '右玉县', '0', '146', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('762', '怀仁县', '0', '146', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('763', '榆次区', '0', '147', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('764', '榆社县', '0', '147', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('765', '左权县', '0', '147', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('766', '和顺县', '0', '147', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('767', '昔阳县', '0', '147', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('768', '寿阳县', '0', '147', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('769', '太谷县', '0', '147', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('770', '祁县', '0', '147', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('771', '平遥县', '0', '147', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('772', '灵石县', '0', '147', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('773', '介休市', '0', '147', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('774', '盐湖区', '0', '148', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('775', '临猗县', '0', '148', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('776', '万荣县', '0', '148', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('777', '闻喜县', '0', '148', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('778', '稷山县', '0', '148', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('779', '新绛县', '0', '148', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('780', '绛县', '0', '148', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('781', '垣曲县', '0', '148', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('782', '夏县', '0', '148', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('783', '平陆县', '0', '148', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('784', '芮城县', '0', '148', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('785', '永济市', '0', '148', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('786', '河津市', '0', '148', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('787', '忻府区', '0', '149', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('788', '定襄县', '0', '149', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('789', '五台县', '0', '149', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('790', '代县', '0', '149', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('791', '繁峙县', '0', '149', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('792', '宁武县', '0', '149', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('793', '静乐县', '0', '149', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('794', '神池县', '0', '149', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('795', '五寨县', '0', '149', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('796', '岢岚县', '0', '149', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('797', '河曲县', '0', '149', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('798', '保德县', '0', '149', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('799', '偏关县', '0', '149', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('800', '原平市', '0', '149', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('801', '尧都区', '0', '150', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('802', '曲沃县', '0', '150', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('803', '翼城县', '0', '150', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('804', '襄汾县', '0', '150', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('805', '洪洞县', '0', '150', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('806', '古县', '0', '150', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('807', '安泽县', '0', '150', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('808', '浮山县', '0', '150', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('809', '吉县', '0', '150', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('810', '乡宁县', '0', '150', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('811', '大宁县', '0', '150', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('812', '隰县', '0', '150', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('813', '永和县', '0', '150', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('814', '蒲县', '0', '150', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('815', '汾西县', '0', '150', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('816', '侯马市', '0', '150', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('817', '霍州市', '0', '150', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('818', '离石区', '0', '151', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('819', '文水县', '0', '151', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('820', '交城县', '0', '151', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('821', '兴县', '0', '151', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('822', '临县', '0', '151', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('823', '柳林县', '0', '151', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('824', '石楼县', '0', '151', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('825', '岚县', '0', '151', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('826', '方山县', '0', '151', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('827', '中阳县', '0', '151', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('828', '交口县', '0', '151', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('829', '孝义市', '0', '151', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('830', '汾阳市', '0', '151', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('831', '新城区', '0', '152', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('832', '回民区', '0', '152', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('833', '玉泉区', '0', '152', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('834', '赛罕区', '0', '152', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('835', '土默特左旗', '0', '152', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('836', '托克托县', '0', '152', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('837', '和林格尔县', '0', '152', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('838', '清水河县', '0', '152', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('839', '武川县', '0', '152', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('840', '东河区', '0', '153', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('841', '昆都仑区', '0', '153', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('842', '青山区', '0', '153', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('843', '石拐区', '0', '153', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('844', '白云矿区', '0', '153', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('845', '九原区', '0', '153', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('846', '土默特右旗', '0', '153', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('847', '固阳县', '0', '153', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('848', '达尔罕茂明安联合旗', '0', '153', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('849', '海勃湾区', '0', '154', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('850', '海南区', '0', '154', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('851', '乌达区', '0', '154', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('852', '红山区', '0', '155', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('853', '元宝山区', '0', '155', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('854', '松山区', '0', '155', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('855', '阿鲁科尔沁旗', '0', '155', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('856', '巴林左旗', '0', '155', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('857', '巴林右旗', '0', '155', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('858', '林西县', '0', '155', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('859', '克什克腾旗', '0', '155', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('860', '翁牛特旗', '0', '155', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('861', '喀喇沁旗', '0', '155', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('862', '宁城县', '0', '155', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('863', '敖汉旗', '0', '155', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('864', '科尔沁区', '0', '156', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('865', '科尔沁左翼中旗', '0', '156', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('866', '科尔沁左翼后旗', '0', '156', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('867', '开鲁县', '0', '156', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('868', '库伦旗', '0', '156', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('869', '奈曼旗', '0', '156', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('870', '扎鲁特旗', '0', '156', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('871', '霍林郭勒市', '0', '156', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('872', '东胜区', '0', '157', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('873', '达拉特旗', '0', '157', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('874', '准格尔旗', '0', '157', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('875', '鄂托克前旗', '0', '157', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('876', '鄂托克旗', '0', '157', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('877', '杭锦旗', '0', '157', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('878', '乌审旗', '0', '157', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('879', '伊金霍洛旗', '0', '157', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('880', '海拉尔区', '0', '158', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('881', '阿荣旗', '0', '158', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('882', '莫力达瓦达斡尔族自治旗', '0', '158', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('883', '鄂伦春自治旗', '0', '158', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('884', '鄂温克族自治旗', '0', '158', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('885', '陈巴尔虎旗', '0', '158', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('886', '新巴尔虎左旗', '0', '158', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('887', '新巴尔虎右旗', '0', '158', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('888', '满洲里市', '0', '158', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('889', '牙克石市', '0', '158', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('890', '扎兰屯市', '0', '158', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('891', '额尔古纳市', '0', '158', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('892', '根河市', '0', '158', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('893', '临河区', '0', '159', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('894', '五原县', '0', '159', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('895', '磴口县', '0', '159', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('896', '乌拉特前旗', '0', '159', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('897', '乌拉特中旗', '0', '159', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('898', '乌拉特后旗', '0', '159', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('899', '杭锦后旗', '0', '159', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('900', '集宁区', '0', '160', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('901', '卓资县', '0', '160', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('902', '化德县', '0', '160', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('903', '商都县', '0', '160', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('904', '兴和县', '0', '160', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('905', '凉城县', '0', '160', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('906', '察哈尔右翼前旗', '0', '160', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('907', '察哈尔右翼中旗', '0', '160', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('908', '察哈尔右翼后旗', '0', '160', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('909', '四子王旗', '0', '160', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('910', '丰镇市', '0', '160', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('911', '乌兰浩特市', '0', '161', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('912', '阿尔山市', '0', '161', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('913', '科尔沁右翼前旗', '0', '161', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('914', '科尔沁右翼中旗', '0', '161', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('915', '扎赉特旗', '0', '161', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('916', '突泉县', '0', '161', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('917', '二连浩特市', '0', '162', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('918', '锡林浩特市', '0', '162', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('919', '阿巴嘎旗', '0', '162', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('920', '苏尼特左旗', '0', '162', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('921', '苏尼特右旗', '0', '162', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('922', '东乌珠穆沁旗', '0', '162', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('923', '西乌珠穆沁旗', '0', '162', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('924', '太仆寺旗', '0', '162', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('925', '镶黄旗', '0', '162', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('926', '正镶白旗', '0', '162', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('927', '正蓝旗', '0', '162', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('928', '多伦县', '0', '162', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('929', '阿拉善左旗', '0', '163', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('930', '阿拉善右旗', '0', '163', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('931', '额济纳旗', '0', '163', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('932', '和平区', '0', '164', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('933', '沈河区', '0', '164', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('934', '大东区', '0', '164', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('935', '皇姑区', '0', '164', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('936', '铁西区', '0', '164', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('937', '苏家屯区', '0', '164', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('938', '东陵区', '0', '164', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('939', '新城子区', '0', '164', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('940', '于洪区', '0', '164', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('941', '辽中县', '0', '164', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('942', '康平县', '0', '164', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('943', '法库县', '0', '164', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('944', '新民市', '0', '164', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('945', '中山区', '0', '165', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('946', '西岗区', '0', '165', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('947', '沙河口区', '0', '165', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('948', '甘井子区', '0', '165', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('949', '旅顺口区', '0', '165', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('950', '金州区', '0', '165', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('951', '长海县', '0', '165', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('952', '瓦房店市', '0', '165', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('953', '普兰店市', '0', '165', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('954', '庄河市', '0', '165', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('955', '铁东区', '0', '166', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('956', '铁西区', '0', '166', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('957', '立山区', '0', '166', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('958', '千山区', '0', '166', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('959', '台安县', '0', '166', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('960', '岫岩满族自治县', '0', '166', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('961', '海城市', '0', '166', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('962', '新抚区', '0', '167', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('963', '东洲区', '0', '167', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('964', '望花区', '0', '167', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('965', '顺城区', '0', '167', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('966', '抚顺县', '0', '167', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('967', '新宾满族自治县', '0', '167', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('968', '清原满族自治县', '0', '167', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('969', '平山区', '0', '168', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('970', '溪湖区', '0', '168', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('971', '明山区', '0', '168', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('972', '南芬区', '0', '168', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('973', '本溪满族自治县', '0', '168', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('974', '桓仁满族自治县', '0', '168', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('975', '元宝区', '0', '169', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('976', '振兴区', '0', '169', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('977', '振安区', '0', '169', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('978', '宽甸满族自治县', '0', '169', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('979', '东港市', '0', '169', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('980', '凤城市', '0', '169', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('981', '古塔区', '0', '170', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('982', '凌河区', '0', '170', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('983', '太和区', '0', '170', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('984', '黑山县', '0', '170', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('985', '义县', '0', '170', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('986', '凌海市', '0', '170', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('987', '北镇市', '0', '170', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('988', '站前区', '0', '171', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('989', '西市区', '0', '171', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('990', '鲅鱼圈区', '0', '171', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('991', '老边区', '0', '171', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('992', '盖州市', '0', '171', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('993', '大石桥市', '0', '171', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('994', '海州区', '0', '172', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('995', '新邱区', '0', '172', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('996', '太平区', '0', '172', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('997', '清河门区', '0', '172', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('998', '细河区', '0', '172', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('999', '阜新蒙古族自治县', '0', '172', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1000', '彰武县', '0', '172', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1001', '白塔区', '0', '173', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1002', '文圣区', '0', '173', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1003', '宏伟区', '0', '173', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1004', '弓长岭区', '0', '173', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1005', '太子河区', '0', '173', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1006', '辽阳县', '0', '173', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1007', '灯塔市', '0', '173', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1008', '双台子区', '0', '174', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1009', '兴隆台区', '0', '174', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1010', '大洼县', '0', '174', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1011', '盘山县', '0', '174', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1012', '银州区', '0', '175', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1013', '清河区', '0', '175', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1014', '铁岭县', '0', '175', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1015', '西丰县', '0', '175', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1016', '昌图县', '0', '175', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1017', '调兵山市', '0', '175', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1018', '开原市', '0', '175', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1019', '双塔区', '0', '176', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1020', '龙城区', '0', '176', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1021', '朝阳县', '0', '176', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1022', '建平县', '0', '176', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1023', '喀喇沁左翼蒙古族自治县', '0', '176', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1024', '北票市', '0', '176', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1025', '凌源市', '0', '176', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1026', '连山区', '0', '177', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1027', '龙港区', '0', '177', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1028', '南票区', '0', '177', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1029', '绥中县', '0', '177', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1030', '建昌县', '0', '177', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1031', '兴城市', '0', '177', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1032', '南关区', '0', '178', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1033', '宽城区', '0', '178', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1034', '朝阳区', '0', '178', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1035', '二道区', '0', '178', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1036', '绿园区', '0', '178', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1037', '双阳区', '0', '178', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1038', '农安县', '0', '178', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1039', '九台市', '0', '178', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1040', '榆树市', '0', '178', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1041', '德惠市', '0', '178', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1042', '昌邑区', '0', '179', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1043', '龙潭区', '0', '179', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1044', '船营区', '0', '179', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1045', '丰满区', '0', '179', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1046', '永吉县', '0', '179', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1047', '蛟河市', '0', '179', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1048', '桦甸市', '0', '179', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1049', '舒兰市', '0', '179', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1050', '磐石市', '0', '179', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1051', '铁西区', '0', '180', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1052', '铁东区', '0', '180', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1053', '梨树县', '0', '180', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1054', '伊通满族自治县', '0', '180', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1055', '公主岭市', '0', '180', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1056', '双辽市', '0', '180', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1057', '龙山区', '0', '181', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1058', '西安区', '0', '181', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1059', '东丰县', '0', '181', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1060', '东辽县', '0', '181', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1061', '东昌区', '0', '182', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1062', '二道江区', '0', '182', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1063', '通化县', '0', '182', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1064', '辉南县', '0', '182', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1065', '柳河县', '0', '182', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1066', '梅河口市', '0', '182', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1067', '集安市', '0', '182', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1068', '八道江区', '0', '183', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1069', '抚松县', '0', '183', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1070', '靖宇县', '0', '183', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1071', '长白朝鲜族自治县', '0', '183', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1072', '江源县', '0', '183', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1073', '临江市', '0', '183', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1074', '宁江区', '0', '184', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1075', '前郭尔罗斯蒙古族自治县', '0', '184', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1076', '长岭县', '0', '184', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1077', '乾安县', '0', '184', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1078', '扶余县', '0', '184', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1079', '洮北区', '0', '185', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1080', '镇赉县', '0', '185', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1081', '通榆县', '0', '185', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1082', '洮南市', '0', '185', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1083', '大安市', '0', '185', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1084', '延吉市', '0', '186', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1085', '图们市', '0', '186', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1086', '敦化市', '0', '186', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1087', '珲春市', '0', '186', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1088', '龙井市', '0', '186', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1089', '和龙市', '0', '186', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1090', '汪清县', '0', '186', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1091', '安图县', '0', '186', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1092', '道里区', '0', '187', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1093', '南岗区', '0', '187', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1094', '道外区', '0', '187', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1095', '香坊区', '0', '187', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1096', '动力区', '0', '187', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1097', '平房区', '0', '187', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1098', '松北区', '0', '187', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1099', '呼兰区', '0', '187', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1100', '依兰县', '0', '187', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1101', '方正县', '0', '187', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1102', '宾县', '0', '187', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1103', '巴彦县', '0', '187', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1104', '木兰县', '0', '187', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1105', '通河县', '0', '187', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1106', '延寿县', '0', '187', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1107', '阿城市', '0', '187', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1108', '双城市', '0', '187', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1109', '尚志市', '0', '187', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1110', '五常市', '0', '187', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1111', '龙沙区', '0', '188', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1112', '建华区', '0', '188', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1113', '铁锋区', '0', '188', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1114', '昂昂溪区', '0', '188', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1115', '富拉尔基区', '0', '188', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1116', '碾子山区', '0', '188', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1117', '梅里斯达斡尔族区', '0', '188', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1118', '龙江县', '0', '188', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1119', '依安县', '0', '188', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1120', '泰来县', '0', '188', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1121', '甘南县', '0', '188', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1122', '富裕县', '0', '188', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1123', '克山县', '0', '188', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1124', '克东县', '0', '188', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1125', '拜泉县', '0', '188', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1126', '讷河市', '0', '188', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1127', '鸡冠区', '0', '189', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1128', '恒山区', '0', '189', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1129', '滴道区', '0', '189', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1130', '梨树区', '0', '189', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1131', '城子河区', '0', '189', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1132', '麻山区', '0', '189', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1133', '鸡东县', '0', '189', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1134', '虎林市', '0', '189', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1135', '密山市', '0', '189', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1136', '向阳区', '0', '190', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1137', '工农区', '0', '190', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1138', '南山区', '0', '190', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1139', '兴安区', '0', '190', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1140', '东山区', '0', '190', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1141', '兴山区', '0', '190', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1142', '萝北县', '0', '190', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1143', '绥滨县', '0', '190', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1144', '尖山区', '0', '191', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1145', '岭东区', '0', '191', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1146', '四方台区', '0', '191', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1147', '宝山区', '0', '191', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1148', '集贤县', '0', '191', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1149', '友谊县', '0', '191', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1150', '宝清县', '0', '191', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1151', '饶河县', '0', '191', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1152', '萨尔图区', '0', '192', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1153', '龙凤区', '0', '192', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1154', '让胡路区', '0', '192', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1155', '红岗区', '0', '192', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1156', '大同区', '0', '192', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1157', '肇州县', '0', '192', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1158', '肇源县', '0', '192', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1159', '林甸县', '0', '192', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1160', '杜尔伯特蒙古族自治县', '0', '192', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1161', '伊春区', '0', '193', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1162', '南岔区', '0', '193', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1163', '友好区', '0', '193', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1164', '西林区', '0', '193', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1165', '翠峦区', '0', '193', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1166', '新青区', '0', '193', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1167', '美溪区', '0', '193', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1168', '金山屯区', '0', '193', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1169', '五营区', '0', '193', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1170', '乌马河区', '0', '193', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1171', '汤旺河区', '0', '193', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1172', '带岭区', '0', '193', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1173', '乌伊岭区', '0', '193', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1174', '红星区', '0', '193', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1175', '上甘岭区', '0', '193', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1176', '嘉荫县', '0', '193', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1177', '铁力市', '0', '193', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1178', '永红区', '0', '194', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1179', '向阳区', '0', '194', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1180', '前进区', '0', '194', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1181', '东风区', '0', '194', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1182', '郊区', '0', '194', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1183', '桦南县', '0', '194', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1184', '桦川县', '0', '194', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1185', '汤原县', '0', '194', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1186', '抚远县', '0', '194', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1187', '同江市', '0', '194', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1188', '富锦市', '0', '194', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1189', '新兴区', '0', '195', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1190', '桃山区', '0', '195', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1191', '茄子河区', '0', '195', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1192', '勃利县', '0', '195', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1193', '东安区', '0', '196', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1194', '阳明区', '0', '196', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1195', '爱民区', '0', '196', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1196', '西安区', '0', '196', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1197', '东宁县', '0', '196', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1198', '林口县', '0', '196', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1199', '绥芬河市', '0', '196', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1200', '海林市', '0', '196', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1201', '宁安市', '0', '196', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1202', '穆棱市', '0', '196', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1203', '爱辉区', '0', '197', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1204', '嫩江县', '0', '197', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1205', '逊克县', '0', '197', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1206', '孙吴县', '0', '197', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1207', '北安市', '0', '197', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1208', '五大连池市', '0', '197', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1209', '北林区', '0', '198', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1210', '望奎县', '0', '198', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1211', '兰西县', '0', '198', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1212', '青冈县', '0', '198', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1213', '庆安县', '0', '198', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1214', '明水县', '0', '198', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1215', '绥棱县', '0', '198', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1216', '安达市', '0', '198', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1217', '肇东市', '0', '198', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1218', '海伦市', '0', '198', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1219', '呼玛县', '0', '199', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1220', '塔河县', '0', '199', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1221', '漠河县', '0', '199', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1222', '玄武区', '0', '200', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1223', '白下区', '0', '200', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1224', '秦淮区', '0', '200', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1225', '建邺区', '0', '200', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1226', '鼓楼区', '0', '200', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1227', '下关区', '0', '200', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1228', '浦口区', '0', '200', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1229', '栖霞区', '0', '200', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1230', '雨花台区', '0', '200', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1231', '江宁区', '0', '200', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1232', '六合区', '0', '200', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1233', '溧水县', '0', '200', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1234', '高淳县', '0', '200', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1235', '崇安区', '0', '201', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1236', '南长区', '0', '201', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1237', '北塘区', '0', '201', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1238', '锡山区', '0', '201', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1239', '惠山区', '0', '201', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1240', '滨湖区', '0', '201', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1241', '江阴市', '0', '201', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1242', '宜兴市', '0', '201', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1243', '鼓楼区', '0', '202', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1244', '云龙区', '0', '202', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1245', '九里区', '0', '202', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1246', '贾汪区', '0', '202', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1247', '泉山区', '0', '202', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1248', '丰县', '0', '202', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1249', '沛县', '0', '202', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1250', '铜山县', '0', '202', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1251', '睢宁县', '0', '202', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1252', '新沂市', '0', '202', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1253', '邳州市', '0', '202', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1254', '天宁区', '0', '203', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1255', '钟楼区', '0', '203', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1256', '戚墅堰区', '0', '203', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1257', '新北区', '0', '203', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1258', '武进区', '0', '203', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1259', '溧阳市', '0', '203', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1260', '金坛市', '0', '203', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1261', '沧浪区', '0', '204', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1262', '平江区', '0', '204', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1263', '金阊区', '0', '204', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1264', '虎丘区', '0', '204', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1265', '吴中区', '0', '204', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1266', '相城区', '0', '204', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1267', '常熟市', '0', '204', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1268', '张家港市', '0', '204', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1269', '昆山市', '0', '204', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1270', '吴江市', '0', '204', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1271', '太仓市', '0', '204', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1272', '崇川区', '0', '205', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1273', '港闸区', '0', '205', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1274', '海安县', '0', '205', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1275', '如东县', '0', '205', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1276', '启东市', '0', '205', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1277', '如皋市', '0', '205', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1278', '通州市', '0', '205', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1279', '海门市', '0', '205', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1280', '连云区', '0', '206', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1281', '新浦区', '0', '206', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1282', '海州区', '0', '206', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1283', '赣榆县', '0', '206', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1284', '东海县', '0', '206', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1285', '灌云县', '0', '206', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1286', '灌南县', '0', '206', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1287', '清河区', '0', '207', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1288', '楚州区', '0', '207', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1289', '淮阴区', '0', '207', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1290', '清浦区', '0', '207', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1291', '涟水县', '0', '207', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1292', '洪泽县', '0', '207', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1293', '盱眙县', '0', '207', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1294', '金湖县', '0', '207', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1295', '亭湖区', '0', '208', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1296', '盐都区', '0', '208', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1297', '响水县', '0', '208', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1298', '滨海县', '0', '208', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1299', '阜宁县', '0', '208', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1300', '射阳县', '0', '208', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1301', '建湖县', '0', '208', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1302', '东台市', '0', '208', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1303', '大丰市', '0', '208', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1304', '广陵区', '0', '209', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1305', '邗江区', '0', '209', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1306', '维扬区', '0', '209', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1307', '宝应县', '0', '209', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1308', '仪征市', '0', '209', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1309', '高邮市', '0', '209', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1310', '江都市', '0', '209', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1311', '京口区', '0', '210', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1312', '润州区', '0', '210', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1313', '丹徒区', '0', '210', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1314', '丹阳市', '0', '210', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1315', '扬中市', '0', '210', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1316', '句容市', '0', '210', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1317', '海陵区', '0', '211', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1318', '高港区', '0', '211', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1319', '兴化市', '0', '211', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1320', '靖江市', '0', '211', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1321', '泰兴市', '0', '211', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1322', '姜堰市', '0', '211', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1323', '宿城区', '0', '212', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1324', '宿豫区', '0', '212', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1325', '沭阳县', '0', '212', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1326', '泗阳县', '0', '212', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1327', '泗洪县', '0', '212', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1328', '上城区', '0', '213', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1329', '下城区', '0', '213', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1330', '江干区', '0', '213', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1331', '拱墅区', '0', '213', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1332', '西湖区', '0', '213', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1333', '滨江区', '0', '213', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1334', '萧山区', '0', '213', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1335', '余杭区', '0', '213', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1336', '桐庐县', '0', '213', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1337', '淳安县', '0', '213', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1338', '建德市', '0', '213', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1339', '富阳市', '0', '213', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1340', '临安市', '0', '213', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1341', '海曙区', '0', '214', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1342', '江东区', '0', '214', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1343', '江北区', '0', '214', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1344', '北仑区', '0', '214', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1345', '镇海区', '0', '214', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1346', '鄞州区', '0', '214', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1347', '象山县', '0', '214', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1348', '宁海县', '0', '214', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1349', '余姚市', '0', '214', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1350', '慈溪市', '0', '214', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1351', '奉化市', '0', '214', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1352', '鹿城区', '0', '215', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1353', '龙湾区', '0', '215', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1354', '瓯海区', '0', '215', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1355', '洞头县', '0', '215', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1356', '永嘉县', '0', '215', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1357', '平阳县', '0', '215', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1358', '苍南县', '0', '215', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1359', '文成县', '0', '215', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1360', '泰顺县', '0', '215', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1361', '瑞安市', '0', '215', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1362', '乐清市', '0', '215', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1363', '秀城区', '0', '216', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1364', '秀洲区', '0', '216', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1365', '嘉善县', '0', '216', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1366', '海盐县', '0', '216', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1367', '海宁市', '0', '216', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1368', '平湖市', '0', '216', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1369', '桐乡市', '0', '216', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1370', '吴兴区', '0', '217', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1371', '南浔区', '0', '217', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1372', '德清县', '0', '217', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1373', '长兴县', '0', '217', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1374', '安吉县', '0', '217', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1375', '越城区', '0', '218', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1376', '绍兴县', '0', '218', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1377', '新昌县', '0', '218', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1378', '诸暨市', '0', '218', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1379', '上虞市', '0', '218', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1380', '嵊州市', '0', '218', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1381', '婺城区', '0', '219', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1382', '金东区', '0', '219', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1383', '武义县', '0', '219', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1384', '浦江县', '0', '219', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1385', '磐安县', '0', '219', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1386', '兰溪市', '0', '219', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1387', '义乌市', '0', '219', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1388', '东阳市', '0', '219', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1389', '永康市', '0', '219', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1390', '柯城区', '0', '220', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1391', '衢江区', '0', '220', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1392', '常山县', '0', '220', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1393', '开化县', '0', '220', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1394', '龙游县', '0', '220', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1395', '江山市', '0', '220', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1396', '定海区', '0', '221', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1397', '普陀区', '0', '221', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1398', '岱山县', '0', '221', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1399', '嵊泗县', '0', '221', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1400', '椒江区', '0', '222', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1401', '黄岩区', '0', '222', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1402', '路桥区', '0', '222', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1403', '玉环县', '0', '222', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1404', '三门县', '0', '222', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1405', '天台县', '0', '222', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1406', '仙居县', '0', '222', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1407', '温岭市', '0', '222', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1408', '临海市', '0', '222', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1409', '莲都区', '0', '223', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1410', '青田县', '0', '223', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1411', '缙云县', '0', '223', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1412', '遂昌县', '0', '223', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1413', '松阳县', '0', '223', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1414', '云和县', '0', '223', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1415', '庆元县', '0', '223', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1416', '景宁畲族自治县', '0', '223', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1417', '龙泉市', '0', '223', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1418', '瑶海区', '0', '224', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1419', '庐阳区', '0', '224', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1420', '蜀山区', '0', '224', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1421', '包河区', '0', '224', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1422', '长丰县', '0', '224', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1423', '肥东县', '0', '224', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1424', '肥西县', '0', '224', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1425', '镜湖区', '0', '225', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1426', '弋江区', '0', '225', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1427', '鸠江区', '0', '225', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1428', '三山区', '0', '225', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1429', '芜湖县', '0', '225', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1430', '繁昌县', '0', '225', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1431', '南陵县', '0', '225', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1432', '龙子湖区', '0', '226', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1433', '蚌山区', '0', '226', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1434', '禹会区', '0', '226', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1435', '淮上区', '0', '226', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1436', '怀远县', '0', '226', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1437', '五河县', '0', '226', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1438', '固镇县', '0', '226', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1439', '大通区', '0', '227', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1440', '田家庵区', '0', '227', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1441', '谢家集区', '0', '227', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1442', '八公山区', '0', '227', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1443', '潘集区', '0', '227', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1444', '凤台县', '0', '227', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1445', '金家庄区', '0', '228', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1446', '花山区', '0', '228', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1447', '雨山区', '0', '228', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1448', '当涂县', '0', '228', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1449', '杜集区', '0', '229', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1450', '相山区', '0', '229', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1451', '烈山区', '0', '229', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1452', '濉溪县', '0', '229', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1453', '铜官山区', '0', '230', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1454', '狮子山区', '0', '230', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1455', '郊区', '0', '230', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1456', '铜陵县', '0', '230', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1457', '迎江区', '0', '231', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1458', '大观区', '0', '231', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1459', '宜秀区', '0', '231', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1460', '怀宁县', '0', '231', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1461', '枞阳县', '0', '231', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1462', '潜山县', '0', '231', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1463', '太湖县', '0', '231', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1464', '宿松县', '0', '231', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1465', '望江县', '0', '231', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1466', '岳西县', '0', '231', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1467', '桐城市', '0', '231', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1468', '屯溪区', '0', '232', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1469', '黄山区', '0', '232', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1470', '徽州区', '0', '232', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1471', '歙县', '0', '232', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1472', '休宁县', '0', '232', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1473', '黟县', '0', '232', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1474', '祁门县', '0', '232', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1475', '琅琊区', '0', '233', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1476', '南谯区', '0', '233', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1477', '来安县', '0', '233', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1478', '全椒县', '0', '233', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1479', '定远县', '0', '233', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1480', '凤阳县', '0', '233', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1481', '天长市', '0', '233', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1482', '明光市', '0', '233', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1483', '颍州区', '0', '234', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1484', '颍东区', '0', '234', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1485', '颍泉区', '0', '234', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1486', '临泉县', '0', '234', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1487', '太和县', '0', '234', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1488', '阜南县', '0', '234', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1489', '颍上县', '0', '234', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1490', '界首市', '0', '234', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1491', '埇桥区', '0', '235', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1492', '砀山县', '0', '235', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1493', '萧县', '0', '235', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1494', '灵璧县', '0', '235', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1495', '泗县', '0', '235', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1496', '居巢区', '0', '236', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1497', '庐江县', '0', '236', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1498', '无为县', '0', '236', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1499', '含山县', '0', '236', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1500', '和县', '0', '236', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1501', '金安区', '0', '237', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1502', '裕安区', '0', '237', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1503', '寿县', '0', '237', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1504', '霍邱县', '0', '237', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1505', '舒城县', '0', '237', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1506', '金寨县', '0', '237', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1507', '霍山县', '0', '237', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1508', '谯城区', '0', '238', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1509', '涡阳县', '0', '238', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1510', '蒙城县', '0', '238', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1511', '利辛县', '0', '238', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1512', '贵池区', '0', '239', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1513', '东至县', '0', '239', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1514', '石台县', '0', '239', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1515', '青阳县', '0', '239', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1516', '宣州区', '0', '240', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1517', '郎溪县', '0', '240', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1518', '广德县', '0', '240', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1519', '泾县', '0', '240', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1520', '绩溪县', '0', '240', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1521', '旌德县', '0', '240', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1522', '宁国市', '0', '240', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1523', '鼓楼区', '0', '241', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1524', '台江区', '0', '241', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1525', '仓山区', '0', '241', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1526', '马尾区', '0', '241', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1527', '晋安区', '0', '241', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1528', '闽侯县', '0', '241', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1529', '连江县', '0', '241', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1530', '罗源县', '0', '241', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1531', '闽清县', '0', '241', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1532', '永泰县', '0', '241', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1533', '平潭县', '0', '241', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1534', '福清市', '0', '241', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1535', '长乐市', '0', '241', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1536', '思明区', '0', '242', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1537', '海沧区', '0', '242', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1538', '湖里区', '0', '242', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1539', '集美区', '0', '242', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1540', '同安区', '0', '242', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1541', '翔安区', '0', '242', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1542', '城厢区', '0', '243', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1543', '涵江区', '0', '243', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1544', '荔城区', '0', '243', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1545', '秀屿区', '0', '243', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1546', '仙游县', '0', '243', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1547', '梅列区', '0', '244', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1548', '三元区', '0', '244', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1549', '明溪县', '0', '244', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1550', '清流县', '0', '244', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1551', '宁化县', '0', '244', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1552', '大田县', '0', '244', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1553', '尤溪县', '0', '244', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1554', '沙县', '0', '244', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1555', '将乐县', '0', '244', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1556', '泰宁县', '0', '244', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1557', '建宁县', '0', '244', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1558', '永安市', '0', '244', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1559', '鲤城区', '0', '245', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1560', '丰泽区', '0', '245', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1561', '洛江区', '0', '245', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1562', '泉港区', '0', '245', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1563', '惠安县', '0', '245', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1564', '安溪县', '0', '245', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1565', '永春县', '0', '245', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1566', '德化县', '0', '245', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1567', '金门县', '0', '245', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1568', '石狮市', '0', '245', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1569', '晋江市', '0', '245', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1570', '南安市', '0', '245', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1571', '芗城区', '0', '246', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1572', '龙文区', '0', '246', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1573', '云霄县', '0', '246', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1574', '漳浦县', '0', '246', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1575', '诏安县', '0', '246', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1576', '长泰县', '0', '246', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1577', '东山县', '0', '246', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1578', '南靖县', '0', '246', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1579', '平和县', '0', '246', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1580', '华安县', '0', '246', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1581', '龙海市', '0', '246', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1582', '延平区', '0', '247', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1583', '顺昌县', '0', '247', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1584', '浦城县', '0', '247', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1585', '光泽县', '0', '247', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1586', '松溪县', '0', '247', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1587', '政和县', '0', '247', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1588', '邵武市', '0', '247', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1589', '武夷山市', '0', '247', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1590', '建瓯市', '0', '247', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1591', '建阳市', '0', '247', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1592', '新罗区', '0', '248', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1593', '长汀县', '0', '248', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1594', '永定县', '0', '248', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1595', '上杭县', '0', '248', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1596', '武平县', '0', '248', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1597', '连城县', '0', '248', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1598', '漳平市', '0', '248', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1599', '蕉城区', '0', '249', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1600', '霞浦县', '0', '249', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1601', '古田县', '0', '249', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1602', '屏南县', '0', '249', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1603', '寿宁县', '0', '249', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1604', '周宁县', '0', '249', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1605', '柘荣县', '0', '249', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1606', '福安市', '0', '249', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1607', '福鼎市', '0', '249', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1608', '东湖区', '0', '250', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1609', '西湖区', '0', '250', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1610', '青云谱区', '0', '250', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1611', '湾里区', '0', '250', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1612', '青山湖区', '0', '250', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1613', '南昌县', '0', '250', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1614', '新建县', '0', '250', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1615', '安义县', '0', '250', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1616', '进贤县', '0', '250', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1617', '昌江区', '0', '251', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1618', '珠山区', '0', '251', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1619', '浮梁县', '0', '251', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1620', '乐平市', '0', '251', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1621', '安源区', '0', '252', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1622', '湘东区', '0', '252', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1623', '莲花县', '0', '252', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1624', '上栗县', '0', '252', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1625', '芦溪县', '0', '252', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1626', '庐山区', '0', '253', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1627', '浔阳区', '0', '253', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1628', '九江县', '0', '253', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1629', '武宁县', '0', '253', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1630', '修水县', '0', '253', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1631', '永修县', '0', '253', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1632', '德安县', '0', '253', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1633', '星子县', '0', '253', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1634', '都昌县', '0', '253', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1635', '湖口县', '0', '253', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1636', '彭泽县', '0', '253', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1637', '瑞昌市', '0', '253', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1638', '渝水区', '0', '254', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1639', '分宜县', '0', '254', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1640', '月湖区', '0', '255', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1641', '余江县', '0', '255', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1642', '贵溪市', '0', '255', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1643', '章贡区', '0', '256', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1644', '赣县', '0', '256', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1645', '信丰县', '0', '256', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1646', '大余县', '0', '256', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1647', '上犹县', '0', '256', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1648', '崇义县', '0', '256', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1649', '安远县', '0', '256', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1650', '龙南县', '0', '256', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1651', '定南县', '0', '256', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1652', '全南县', '0', '256', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1653', '宁都县', '0', '256', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1654', '于都县', '0', '256', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1655', '兴国县', '0', '256', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1656', '会昌县', '0', '256', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1657', '寻乌县', '0', '256', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1658', '石城县', '0', '256', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1659', '瑞金市', '0', '256', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1660', '南康市', '0', '256', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1661', '吉州区', '0', '257', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1662', '青原区', '0', '257', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1663', '吉安县', '0', '257', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1664', '吉水县', '0', '257', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1665', '峡江县', '0', '257', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1666', '新干县', '0', '257', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1667', '永丰县', '0', '257', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1668', '泰和县', '0', '257', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1669', '遂川县', '0', '257', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1670', '万安县', '0', '257', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1671', '安福县', '0', '257', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1672', '永新县', '0', '257', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1673', '井冈山市', '0', '257', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1674', '袁州区', '0', '258', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1675', '奉新县', '0', '258', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1676', '万载县', '0', '258', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1677', '上高县', '0', '258', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1678', '宜丰县', '0', '258', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1679', '靖安县', '0', '258', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1680', '铜鼓县', '0', '258', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1681', '丰城市', '0', '258', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1682', '樟树市', '0', '258', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1683', '高安市', '0', '258', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1684', '临川区', '0', '259', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1685', '南城县', '0', '259', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1686', '黎川县', '0', '259', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1687', '南丰县', '0', '259', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1688', '崇仁县', '0', '259', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1689', '乐安县', '0', '259', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1690', '宜黄县', '0', '259', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1691', '金溪县', '0', '259', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1692', '资溪县', '0', '259', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1693', '东乡县', '0', '259', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1694', '广昌县', '0', '259', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1695', '信州区', '0', '260', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1696', '上饶县', '0', '260', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1697', '广丰县', '0', '260', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1698', '玉山县', '0', '260', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1699', '铅山县', '0', '260', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1700', '横峰县', '0', '260', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1701', '弋阳县', '0', '260', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1702', '余干县', '0', '260', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1703', '鄱阳县', '0', '260', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1704', '万年县', '0', '260', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1705', '婺源县', '0', '260', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1706', '德兴市', '0', '260', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1707', '历下区', '0', '261', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1708', '市中区', '0', '261', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1709', '槐荫区', '0', '261', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1710', '天桥区', '0', '261', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1711', '历城区', '0', '261', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1712', '长清区', '0', '261', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1713', '平阴县', '0', '261', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1714', '济阳县', '0', '261', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1715', '商河县', '0', '261', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1716', '章丘市', '0', '261', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1717', '市南区', '0', '262', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1718', '市北区', '0', '262', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1719', '四方区', '0', '262', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1720', '黄岛区', '0', '262', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1721', '崂山区', '0', '262', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1722', '李沧区', '0', '262', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1723', '城阳区', '0', '262', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1724', '胶州市', '0', '262', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1725', '即墨市', '0', '262', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1726', '平度市', '0', '262', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1727', '胶南市', '0', '262', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1728', '莱西市', '0', '262', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1729', '淄川区', '0', '263', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1730', '张店区', '0', '263', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1731', '博山区', '0', '263', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1732', '临淄区', '0', '263', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1733', '周村区', '0', '263', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1734', '桓台县', '0', '263', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1735', '高青县', '0', '263', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1736', '沂源县', '0', '263', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1737', '市中区', '0', '264', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1738', '薛城区', '0', '264', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1739', '峄城区', '0', '264', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1740', '台儿庄区', '0', '264', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1741', '山亭区', '0', '264', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1742', '滕州市', '0', '264', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1743', '东营区', '0', '265', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1744', '河口区', '0', '265', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1745', '垦利县', '0', '265', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1746', '利津县', '0', '265', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1747', '广饶县', '0', '265', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1748', '芝罘区', '0', '266', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1749', '福山区', '0', '266', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1750', '牟平区', '0', '266', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1751', '莱山区', '0', '266', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1752', '长岛县', '0', '266', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1753', '龙口市', '0', '266', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1754', '莱阳市', '0', '266', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1755', '莱州市', '0', '266', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1756', '蓬莱市', '0', '266', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1757', '招远市', '0', '266', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1758', '栖霞市', '0', '266', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1759', '海阳市', '0', '266', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1760', '潍城区', '0', '267', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1761', '寒亭区', '0', '267', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1762', '坊子区', '0', '267', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1763', '奎文区', '0', '267', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1764', '临朐县', '0', '267', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1765', '昌乐县', '0', '267', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1766', '青州市', '0', '267', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1767', '诸城市', '0', '267', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1768', '寿光市', '0', '267', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1769', '安丘市', '0', '267', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1770', '高密市', '0', '267', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1771', '昌邑市', '0', '267', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1772', '市中区', '0', '268', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1773', '任城区', '0', '268', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1774', '微山县', '0', '268', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1775', '鱼台县', '0', '268', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1776', '金乡县', '0', '268', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1777', '嘉祥县', '0', '268', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1778', '汶上县', '0', '268', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1779', '泗水县', '0', '268', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1780', '梁山县', '0', '268', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1781', '曲阜市', '0', '268', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1782', '兖州市', '0', '268', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1783', '邹城市', '0', '268', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1784', '泰山区', '0', '269', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1785', '岱岳区', '0', '269', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1786', '宁阳县', '0', '269', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1787', '东平县', '0', '269', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1788', '新泰市', '0', '269', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1789', '肥城市', '0', '269', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1790', '环翠区', '0', '270', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1791', '文登市', '0', '270', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1792', '荣成市', '0', '270', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1793', '乳山市', '0', '270', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1794', '东港区', '0', '271', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1795', '岚山区', '0', '271', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1796', '五莲县', '0', '271', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1797', '莒县', '0', '271', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1798', '莱城区', '0', '272', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1799', '钢城区', '0', '272', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1800', '兰山区', '0', '273', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1801', '罗庄区', '0', '273', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1802', '河东区', '0', '273', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1803', '沂南县', '0', '273', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1804', '郯城县', '0', '273', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1805', '沂水县', '0', '273', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1806', '苍山县', '0', '273', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1807', '费县', '0', '273', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1808', '平邑县', '0', '273', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1809', '莒南县', '0', '273', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1810', '蒙阴县', '0', '273', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1811', '临沭县', '0', '273', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1812', '德城区', '0', '274', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1813', '陵县', '0', '274', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1814', '宁津县', '0', '274', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1815', '庆云县', '0', '274', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1816', '临邑县', '0', '274', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1817', '齐河县', '0', '274', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1818', '平原县', '0', '274', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1819', '夏津县', '0', '274', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1820', '武城县', '0', '274', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1821', '乐陵市', '0', '274', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1822', '禹城市', '0', '274', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1823', '东昌府区', '0', '275', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1824', '阳谷县', '0', '275', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1825', '莘县', '0', '275', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1826', '茌平县', '0', '275', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1827', '东阿县', '0', '275', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1828', '冠县', '0', '275', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1829', '高唐县', '0', '275', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1830', '临清市', '0', '275', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1831', '滨城区', '0', '276', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1832', '惠民县', '0', '276', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1833', '阳信县', '0', '276', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1834', '无棣县', '0', '276', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1835', '沾化县', '0', '276', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1836', '博兴县', '0', '276', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1837', '邹平县', '0', '276', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1838', '牡丹区', '0', '277', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1839', '曹县', '0', '277', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1840', '单县', '0', '277', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1841', '成武县', '0', '277', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1842', '巨野县', '0', '277', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1843', '郓城县', '0', '277', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1844', '鄄城县', '0', '277', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1845', '定陶县', '0', '277', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1846', '东明县', '0', '277', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1847', '中原区', '0', '278', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1848', '二七区', '0', '278', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1849', '管城回族区', '0', '278', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1850', '金水区', '0', '278', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1851', '上街区', '0', '278', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1852', '惠济区', '0', '278', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1853', '中牟县', '0', '278', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1854', '巩义市', '0', '278', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1855', '荥阳市', '0', '278', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1856', '新密市', '0', '278', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1857', '新郑市', '0', '278', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1858', '登封市', '0', '278', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1859', '龙亭区', '0', '279', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1860', '顺河回族区', '0', '279', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1861', '鼓楼区', '0', '279', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1862', '禹王台区', '0', '279', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1863', '金明区', '0', '279', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1864', '杞县', '0', '279', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1865', '通许县', '0', '279', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1866', '尉氏县', '0', '279', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1867', '开封县', '0', '279', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1868', '兰考县', '0', '279', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1869', '老城区', '0', '280', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1870', '西工区', '0', '280', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1871', '廛河回族区', '0', '280', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1872', '涧西区', '0', '280', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1873', '吉利区', '0', '280', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1874', '洛龙区', '0', '280', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1875', '孟津县', '0', '280', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1876', '新安县', '0', '280', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1877', '栾川县', '0', '280', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1878', '嵩县', '0', '280', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1879', '汝阳县', '0', '280', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1880', '宜阳县', '0', '280', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1881', '洛宁县', '0', '280', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1882', '伊川县', '0', '280', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1883', '偃师市', '0', '280', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1884', '新华区', '0', '281', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1885', '卫东区', '0', '281', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1886', '石龙区', '0', '281', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1887', '湛河区', '0', '281', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1888', '宝丰县', '0', '281', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1889', '叶县', '0', '281', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1890', '鲁山县', '0', '281', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1891', '郏县', '0', '281', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1892', '舞钢市', '0', '281', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1893', '汝州市', '0', '281', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1894', '文峰区', '0', '282', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1895', '北关区', '0', '282', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1896', '殷都区', '0', '282', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1897', '龙安区', '0', '282', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1898', '安阳县', '0', '282', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1899', '汤阴县', '0', '282', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1900', '滑县', '0', '282', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1901', '内黄县', '0', '282', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1902', '林州市', '0', '282', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1903', '鹤山区', '0', '283', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1904', '山城区', '0', '283', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1905', '淇滨区', '0', '283', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1906', '浚县', '0', '283', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1907', '淇县', '0', '283', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1908', '红旗区', '0', '284', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1909', '卫滨区', '0', '284', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1910', '凤泉区', '0', '284', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1911', '牧野区', '0', '284', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1912', '新乡县', '0', '284', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1913', '获嘉县', '0', '284', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1914', '原阳县', '0', '284', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1915', '延津县', '0', '284', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1916', '封丘县', '0', '284', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1917', '长垣县', '0', '284', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1918', '卫辉市', '0', '284', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1919', '辉县市', '0', '284', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1920', '解放区', '0', '285', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1921', '中站区', '0', '285', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1922', '马村区', '0', '285', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1923', '山阳区', '0', '285', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1924', '修武县', '0', '285', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1925', '博爱县', '0', '285', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1926', '武陟县', '0', '285', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1927', '温县', '0', '285', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1928', '济源市', '0', '285', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1929', '沁阳市', '0', '285', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1930', '孟州市', '0', '285', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1931', '华龙区', '0', '286', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1932', '清丰县', '0', '286', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1933', '南乐县', '0', '286', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1934', '范县', '0', '286', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1935', '台前县', '0', '286', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1936', '濮阳县', '0', '286', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1937', '魏都区', '0', '287', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1938', '许昌县', '0', '287', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1939', '鄢陵县', '0', '287', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1940', '襄城县', '0', '287', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1941', '禹州市', '0', '287', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1942', '长葛市', '0', '287', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1943', '源汇区', '0', '288', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1944', '郾城区', '0', '288', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1945', '召陵区', '0', '288', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1946', '舞阳县', '0', '288', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1947', '临颍县', '0', '288', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1948', '湖滨区', '0', '289', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1949', '渑池县', '0', '289', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1950', '陕县', '0', '289', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1951', '卢氏县', '0', '289', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1952', '义马市', '0', '289', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1953', '灵宝市', '0', '289', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1954', '宛城区', '0', '290', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1955', '卧龙区', '0', '290', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1956', '南召县', '0', '290', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1957', '方城县', '0', '290', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1958', '西峡县', '0', '290', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1959', '镇平县', '0', '290', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1960', '内乡县', '0', '290', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1961', '淅川县', '0', '290', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1962', '社旗县', '0', '290', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1963', '唐河县', '0', '290', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1964', '新野县', '0', '290', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1965', '桐柏县', '0', '290', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1966', '邓州市', '0', '290', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1967', '梁园区', '0', '291', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1968', '睢阳区', '0', '291', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1969', '民权县', '0', '291', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1970', '睢县', '0', '291', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1971', '宁陵县', '0', '291', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1972', '柘城县', '0', '291', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1973', '虞城县', '0', '291', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1974', '夏邑县', '0', '291', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1975', '永城市', '0', '291', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1976', '浉河区', '0', '292', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1977', '平桥区', '0', '292', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1978', '罗山县', '0', '292', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1979', '光山县', '0', '292', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1980', '新县', '0', '292', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1981', '商城县', '0', '292', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1982', '固始县', '0', '292', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1983', '潢川县', '0', '292', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1984', '淮滨县', '0', '292', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1985', '息县', '0', '292', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1986', '川汇区', '0', '293', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1987', '扶沟县', '0', '293', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1988', '西华县', '0', '293', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1989', '商水县', '0', '293', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1990', '沈丘县', '0', '293', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1991', '郸城县', '0', '293', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1992', '淮阳县', '0', '293', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1993', '太康县', '0', '293', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1994', '鹿邑县', '0', '293', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1995', '项城市', '0', '293', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1996', '驿城区', '0', '294', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1997', '西平县', '0', '294', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1998', '上蔡县', '0', '294', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('1999', '平舆县', '0', '294', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2000', '正阳县', '0', '294', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2001', '确山县', '0', '294', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2002', '泌阳县', '0', '294', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2003', '汝南县', '0', '294', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2004', '遂平县', '0', '294', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2005', '新蔡县', '0', '294', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2006', '江岸区', '0', '295', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2007', '江汉区', '0', '295', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2008', '硚口区', '0', '295', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2009', '汉阳区', '0', '295', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2010', '武昌区', '0', '295', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2011', '青山区', '0', '295', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2012', '洪山区', '0', '295', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2013', '东西湖区', '0', '295', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2014', '汉南区', '0', '295', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2015', '蔡甸区', '0', '295', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2016', '江夏区', '0', '295', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2017', '黄陂区', '0', '295', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2018', '新洲区', '0', '295', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2019', '黄石港区', '0', '296', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2020', '西塞山区', '0', '296', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2021', '下陆区', '0', '296', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2022', '铁山区', '0', '296', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2023', '阳新县', '0', '296', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2024', '大冶市', '0', '296', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2025', '茅箭区', '0', '297', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2026', '张湾区', '0', '297', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2027', '郧县', '0', '297', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2028', '郧西县', '0', '297', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2029', '竹山县', '0', '297', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2030', '竹溪县', '0', '297', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2031', '房县', '0', '297', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2032', '丹江口市', '0', '297', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2033', '西陵区', '0', '298', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2034', '伍家岗区', '0', '298', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2035', '点军区', '0', '298', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2036', '猇亭区', '0', '298', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2037', '夷陵区', '0', '298', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2038', '远安县', '0', '298', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2039', '兴山县', '0', '298', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2040', '秭归县', '0', '298', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2041', '长阳土家族自治县', '0', '298', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2042', '五峰土家族自治县', '0', '298', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2043', '宜都市', '0', '298', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2044', '当阳市', '0', '298', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2045', '枝江市', '0', '298', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2046', '襄城区', '0', '299', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2047', '樊城区', '0', '299', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2048', '襄阳区', '0', '299', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2049', '南漳县', '0', '299', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2050', '谷城县', '0', '299', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2051', '保康县', '0', '299', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2052', '老河口市', '0', '299', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2053', '枣阳市', '0', '299', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2054', '宜城市', '0', '299', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2055', '梁子湖区', '0', '300', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2056', '华容区', '0', '300', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2057', '鄂城区', '0', '300', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2058', '东宝区', '0', '301', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2059', '掇刀区', '0', '301', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2060', '京山县', '0', '301', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2061', '沙洋县', '0', '301', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2062', '钟祥市', '0', '301', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2063', '孝南区', '0', '302', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2064', '孝昌县', '0', '302', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2065', '大悟县', '0', '302', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2066', '云梦县', '0', '302', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2067', '应城市', '0', '302', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2068', '安陆市', '0', '302', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2069', '汉川市', '0', '302', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2070', '沙市区', '0', '303', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2071', '荆州区', '0', '303', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2072', '公安县', '0', '303', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2073', '监利县', '0', '303', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2074', '江陵县', '0', '303', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2075', '石首市', '0', '303', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2076', '洪湖市', '0', '303', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2077', '松滋市', '0', '303', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2078', '黄州区', '0', '304', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2079', '团风县', '0', '304', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2080', '红安县', '0', '304', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2081', '罗田县', '0', '304', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2082', '英山县', '0', '304', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2083', '浠水县', '0', '304', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2084', '蕲春县', '0', '304', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2085', '黄梅县', '0', '304', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2086', '麻城市', '0', '304', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2087', '武穴市', '0', '304', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2088', '咸安区', '0', '305', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2089', '嘉鱼县', '0', '305', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2090', '通城县', '0', '305', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2091', '崇阳县', '0', '305', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2092', '通山县', '0', '305', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2093', '赤壁市', '0', '305', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2094', '曾都区', '0', '306', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2095', '广水市', '0', '306', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2096', '恩施市', '0', '307', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2097', '利川市', '0', '307', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2098', '建始县', '0', '307', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2099', '巴东县', '0', '307', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2100', '宣恩县', '0', '307', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2101', '咸丰县', '0', '307', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2102', '来凤县', '0', '307', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2103', '鹤峰县', '0', '307', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2104', '芙蓉区', '0', '312', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2105', '天心区', '0', '312', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2106', '岳麓区', '0', '312', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2107', '开福区', '0', '312', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2108', '雨花区', '0', '312', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2109', '长沙县', '0', '312', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2110', '望城县', '0', '312', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2111', '宁乡县', '0', '312', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2112', '浏阳市', '0', '312', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2113', '荷塘区', '0', '313', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2114', '芦淞区', '0', '313', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2115', '石峰区', '0', '313', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2116', '天元区', '0', '313', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2117', '株洲县', '0', '313', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2118', '攸县', '0', '313', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2119', '茶陵县', '0', '313', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2120', '炎陵县', '0', '313', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2121', '醴陵市', '0', '313', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2122', '雨湖区', '0', '314', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2123', '岳塘区', '0', '314', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2124', '湘潭县', '0', '314', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2125', '湘乡市', '0', '314', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2126', '韶山市', '0', '314', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2127', '珠晖区', '0', '315', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2128', '雁峰区', '0', '315', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2129', '石鼓区', '0', '315', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2130', '蒸湘区', '0', '315', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2131', '南岳区', '0', '315', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2132', '衡阳县', '0', '315', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2133', '衡南县', '0', '315', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2134', '衡山县', '0', '315', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2135', '衡东县', '0', '315', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2136', '祁东县', '0', '315', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2137', '耒阳市', '0', '315', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2138', '常宁市', '0', '315', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2139', '双清区', '0', '316', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2140', '大祥区', '0', '316', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2141', '北塔区', '0', '316', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2142', '邵东县', '0', '316', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2143', '新邵县', '0', '316', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2144', '邵阳县', '0', '316', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2145', '隆回县', '0', '316', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2146', '洞口县', '0', '316', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2147', '绥宁县', '0', '316', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2148', '新宁县', '0', '316', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2149', '城步苗族自治县', '0', '316', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2150', '武冈市', '0', '316', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2151', '岳阳楼区', '0', '317', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2152', '云溪区', '0', '317', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2153', '君山区', '0', '317', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2154', '岳阳县', '0', '317', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2155', '华容县', '0', '317', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2156', '湘阴县', '0', '317', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2157', '平江县', '0', '317', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2158', '汨罗市', '0', '317', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2159', '临湘市', '0', '317', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2160', '武陵区', '0', '318', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2161', '鼎城区', '0', '318', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2162', '安乡县', '0', '318', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2163', '汉寿县', '0', '318', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2164', '澧县', '0', '318', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2165', '临澧县', '0', '318', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2166', '桃源县', '0', '318', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2167', '石门县', '0', '318', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2168', '津市市', '0', '318', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2169', '永定区', '0', '319', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2170', '武陵源区', '0', '319', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2171', '慈利县', '0', '319', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2172', '桑植县', '0', '319', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2173', '资阳区', '0', '320', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2174', '赫山区', '0', '320', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2175', '南县', '0', '320', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2176', '桃江县', '0', '320', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2177', '安化县', '0', '320', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2178', '沅江市', '0', '320', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2179', '北湖区', '0', '321', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2180', '苏仙区', '0', '321', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2181', '桂阳县', '0', '321', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2182', '宜章县', '0', '321', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2183', '永兴县', '0', '321', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2184', '嘉禾县', '0', '321', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2185', '临武县', '0', '321', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2186', '汝城县', '0', '321', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2187', '桂东县', '0', '321', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2188', '安仁县', '0', '321', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2189', '资兴市', '0', '321', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2190', '零陵区', '0', '322', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2191', '冷水滩区', '0', '322', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2192', '祁阳县', '0', '322', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2193', '东安县', '0', '322', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2194', '双牌县', '0', '322', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2195', '道县', '0', '322', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2196', '江永县', '0', '322', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2197', '宁远县', '0', '322', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2198', '蓝山县', '0', '322', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2199', '新田县', '0', '322', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2200', '江华瑶族自治县', '0', '322', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2201', '鹤城区', '0', '323', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2202', '中方县', '0', '323', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2203', '沅陵县', '0', '323', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2204', '辰溪县', '0', '323', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2205', '溆浦县', '0', '323', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2206', '会同县', '0', '323', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2207', '麻阳苗族自治县', '0', '323', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2208', '新晃侗族自治县', '0', '323', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2209', '芷江侗族自治县', '0', '323', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2210', '靖州苗族侗族自治县', '0', '323', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2211', '通道侗族自治县', '0', '323', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2212', '洪江市', '0', '323', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2213', '娄星区', '0', '324', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2214', '双峰县', '0', '324', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2215', '新化县', '0', '324', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2216', '冷水江市', '0', '324', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2217', '涟源市', '0', '324', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2218', '吉首市', '0', '325', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2219', '泸溪县', '0', '325', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2220', '凤凰县', '0', '325', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2221', '花垣县', '0', '325', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2222', '保靖县', '0', '325', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2223', '古丈县', '0', '325', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2224', '永顺县', '0', '325', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2225', '龙山县', '0', '325', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2226', '荔湾区', '0', '326', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2227', '越秀区', '0', '326', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2228', '海珠区', '0', '326', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2229', '天河区', '0', '326', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2230', '白云区', '0', '326', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2231', '黄埔区', '0', '326', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2232', '番禺区', '0', '326', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2233', '花都区', '0', '326', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2234', '南沙区', '0', '326', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2235', '萝岗区', '0', '326', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2236', '增城市', '0', '326', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2237', '从化市', '0', '326', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2238', '武江区', '0', '327', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2239', '浈江区', '0', '327', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2240', '曲江区', '0', '327', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2241', '始兴县', '0', '327', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2242', '仁化县', '0', '327', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2243', '翁源县', '0', '327', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2244', '乳源瑶族自治县', '0', '327', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2245', '新丰县', '0', '327', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2246', '乐昌市', '0', '327', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2247', '南雄市', '0', '327', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2248', '罗湖区', '0', '328', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2249', '福田区', '0', '328', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2250', '南山区', '0', '328', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2251', '宝安区', '0', '328', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2252', '龙岗区', '0', '328', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2253', '盐田区', '0', '328', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2254', '香洲区', '0', '329', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2255', '斗门区', '0', '329', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2256', '金湾区', '0', '329', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2257', '龙湖区', '0', '330', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2258', '金平区', '0', '330', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2259', '濠江区', '0', '330', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2260', '潮阳区', '0', '330', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2261', '潮南区', '0', '330', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2262', '澄海区', '0', '330', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2263', '南澳县', '0', '330', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2264', '禅城区', '0', '331', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2265', '南海区', '0', '331', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2266', '顺德区', '0', '331', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2267', '三水区', '0', '331', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2268', '高明区', '0', '331', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2269', '蓬江区', '0', '332', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2270', '江海区', '0', '332', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2271', '新会区', '0', '332', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2272', '台山市', '0', '332', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2273', '开平市', '0', '332', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2274', '鹤山市', '0', '332', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2275', '恩平市', '0', '332', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2276', '赤坎区', '0', '333', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2277', '霞山区', '0', '333', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2278', '坡头区', '0', '333', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2279', '麻章区', '0', '333', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2280', '遂溪县', '0', '333', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2281', '徐闻县', '0', '333', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2282', '廉江市', '0', '333', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2283', '雷州市', '0', '333', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2284', '吴川市', '0', '333', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2285', '茂南区', '0', '334', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2286', '茂港区', '0', '334', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2287', '电白县', '0', '334', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2288', '高州市', '0', '334', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2289', '化州市', '0', '334', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2290', '信宜市', '0', '334', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2291', '端州区', '0', '335', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2292', '鼎湖区', '0', '335', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2293', '广宁县', '0', '335', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2294', '怀集县', '0', '335', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2295', '封开县', '0', '335', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2296', '德庆县', '0', '335', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2297', '高要市', '0', '335', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2298', '四会市', '0', '335', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2299', '惠城区', '0', '336', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2300', '惠阳区', '0', '336', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2301', '博罗县', '0', '336', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2302', '惠东县', '0', '336', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2303', '龙门县', '0', '336', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2304', '梅江区', '0', '337', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2305', '梅县', '0', '337', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2306', '大埔县', '0', '337', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2307', '丰顺县', '0', '337', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2308', '五华县', '0', '337', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2309', '平远县', '0', '337', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2310', '蕉岭县', '0', '337', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2311', '兴宁市', '0', '337', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2312', '城区', '0', '338', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2313', '海丰县', '0', '338', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2314', '陆河县', '0', '338', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2315', '陆丰市', '0', '338', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2316', '源城区', '0', '339', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2317', '紫金县', '0', '339', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2318', '龙川县', '0', '339', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2319', '连平县', '0', '339', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2320', '和平县', '0', '339', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2321', '东源县', '0', '339', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2322', '江城区', '0', '340', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2323', '阳西县', '0', '340', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2324', '阳东县', '0', '340', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2325', '阳春市', '0', '340', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2326', '清城区', '0', '341', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2327', '佛冈县', '0', '341', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2328', '阳山县', '0', '341', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2329', '连山壮族瑶族自治县', '0', '341', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2330', '连南瑶族自治县', '0', '341', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2331', '清新县', '0', '341', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2332', '英德市', '0', '341', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2333', '连州市', '0', '341', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2334', '湘桥区', '0', '344', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2335', '潮安县', '0', '344', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2336', '饶平县', '0', '344', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2337', '榕城区', '0', '345', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2338', '揭东县', '0', '345', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2339', '揭西县', '0', '345', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2340', '惠来县', '0', '345', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2341', '普宁市', '0', '345', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2342', '云城区', '0', '346', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2343', '新兴县', '0', '346', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2344', '郁南县', '0', '346', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2345', '云安县', '0', '346', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2346', '罗定市', '0', '346', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2347', '兴宁区', '0', '347', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2348', '青秀区', '0', '347', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2349', '江南区', '0', '347', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2350', '西乡塘区', '0', '347', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2351', '良庆区', '0', '347', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2352', '邕宁区', '0', '347', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2353', '武鸣县', '0', '347', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2354', '隆安县', '0', '347', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2355', '马山县', '0', '347', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2356', '上林县', '0', '347', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2357', '宾阳县', '0', '347', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2358', '横县', '0', '347', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2359', '城中区', '0', '348', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2360', '鱼峰区', '0', '348', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2361', '柳南区', '0', '348', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2362', '柳北区', '0', '348', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2363', '柳江县', '0', '348', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2364', '柳城县', '0', '348', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2365', '鹿寨县', '0', '348', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2366', '融安县', '0', '348', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2367', '融水苗族自治县', '0', '348', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2368', '三江侗族自治县', '0', '348', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2369', '秀峰区', '0', '349', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2370', '叠彩区', '0', '349', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2371', '象山区', '0', '349', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2372', '七星区', '0', '349', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2373', '雁山区', '0', '349', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2374', '阳朔县', '0', '349', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2375', '临桂县', '0', '349', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2376', '灵川县', '0', '349', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2377', '全州县', '0', '349', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2378', '兴安县', '0', '349', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2379', '永福县', '0', '349', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2380', '灌阳县', '0', '349', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2381', '龙胜各族自治县', '0', '349', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2382', '资源县', '0', '349', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2383', '平乐县', '0', '349', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2384', '荔蒲县', '0', '349', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2385', '恭城瑶族自治县', '0', '349', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2386', '万秀区', '0', '350', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2387', '蝶山区', '0', '350', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2388', '长洲区', '0', '350', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2389', '苍梧县', '0', '350', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2390', '藤县', '0', '350', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2391', '蒙山县', '0', '350', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2392', '岑溪市', '0', '350', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2393', '海城区', '0', '351', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2394', '银海区', '0', '351', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2395', '铁山港区', '0', '351', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2396', '合浦县', '0', '351', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2397', '港口区', '0', '352', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2398', '防城区', '0', '352', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2399', '上思县', '0', '352', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2400', '东兴市', '0', '352', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2401', '钦南区', '0', '353', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2402', '钦北区', '0', '353', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2403', '灵山县', '0', '353', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2404', '浦北县', '0', '353', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2405', '港北区', '0', '354', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2406', '港南区', '0', '354', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2407', '覃塘区', '0', '354', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2408', '平南县', '0', '354', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2409', '桂平市', '0', '354', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2410', '玉州区', '0', '355', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2411', '容县', '0', '355', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2412', '陆川县', '0', '355', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2413', '博白县', '0', '355', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2414', '兴业县', '0', '355', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2415', '北流市', '0', '355', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2416', '右江区', '0', '356', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2417', '田阳县', '0', '356', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2418', '田东县', '0', '356', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2419', '平果县', '0', '356', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2420', '德保县', '0', '356', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2421', '靖西县', '0', '356', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2422', '那坡县', '0', '356', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2423', '凌云县', '0', '356', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2424', '乐业县', '0', '356', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2425', '田林县', '0', '356', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2426', '西林县', '0', '356', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2427', '隆林各族自治县', '0', '356', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2428', '八步区', '0', '357', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2429', '昭平县', '0', '357', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2430', '钟山县', '0', '357', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2431', '富川瑶族自治县', '0', '357', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2432', '金城江区', '0', '358', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2433', '南丹县', '0', '358', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2434', '天峨县', '0', '358', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2435', '凤山县', '0', '358', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2436', '东兰县', '0', '358', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2437', '罗城仫佬族自治县', '0', '358', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2438', '环江毛南族自治县', '0', '358', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2439', '巴马瑶族自治县', '0', '358', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2440', '都安瑶族自治县', '0', '358', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2441', '大化瑶族自治县', '0', '358', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2442', '宜州市', '0', '358', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2443', '兴宾区', '0', '359', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2444', '忻城县', '0', '359', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2445', '象州县', '0', '359', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2446', '武宣县', '0', '359', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2447', '金秀瑶族自治县', '0', '359', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2448', '合山市', '0', '359', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2449', '江洲区', '0', '360', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2450', '扶绥县', '0', '360', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2451', '宁明县', '0', '360', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2452', '龙州县', '0', '360', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2453', '大新县', '0', '360', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2454', '天等县', '0', '360', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2455', '凭祥市', '0', '360', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2456', '秀英区', '0', '361', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2457', '龙华区', '0', '361', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2458', '琼山区', '0', '361', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2459', '美兰区', '0', '361', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2460', '锦江区', '0', '382', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2461', '青羊区', '0', '382', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2462', '金牛区', '0', '382', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2463', '武侯区', '0', '382', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2464', '成华区', '0', '382', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2465', '龙泉驿区', '0', '382', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2466', '青白江区', '0', '382', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2467', '新都区', '0', '382', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2468', '温江区', '0', '382', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2469', '金堂县', '0', '382', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2470', '双流县', '0', '382', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2471', '郫县', '0', '382', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2472', '大邑县', '0', '382', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2473', '蒲江县', '0', '382', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2474', '新津县', '0', '382', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2475', '都江堰市', '0', '382', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2476', '彭州市', '0', '382', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2477', '邛崃市', '0', '382', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2478', '崇州市', '0', '382', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2479', '自流井区', '0', '383', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2480', '贡井区', '0', '383', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2481', '大安区', '0', '383', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2482', '沿滩区', '0', '383', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2483', '荣县', '0', '383', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2484', '富顺县', '0', '383', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2485', '东区', '0', '384', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2486', '西区', '0', '384', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2487', '仁和区', '0', '384', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2488', '米易县', '0', '384', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2489', '盐边县', '0', '384', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2490', '江阳区', '0', '385', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2491', '纳溪区', '0', '385', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2492', '龙马潭区', '0', '385', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2493', '泸县', '0', '385', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2494', '合江县', '0', '385', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2495', '叙永县', '0', '385', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2496', '古蔺县', '0', '385', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2497', '旌阳区', '0', '386', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2498', '中江县', '0', '386', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2499', '罗江县', '0', '386', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2500', '广汉市', '0', '386', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2501', '什邡市', '0', '386', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2502', '绵竹市', '0', '386', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2503', '涪城区', '0', '387', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2504', '游仙区', '0', '387', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2505', '三台县', '0', '387', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2506', '盐亭县', '0', '387', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2507', '安县', '0', '387', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2508', '梓潼县', '0', '387', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2509', '北川羌族自治县', '0', '387', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2510', '平武县', '0', '387', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2511', '江油市', '0', '387', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2512', '市中区', '0', '388', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2513', '元坝区', '0', '388', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2514', '朝天区', '0', '388', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2515', '旺苍县', '0', '388', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2516', '青川县', '0', '388', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2517', '剑阁县', '0', '388', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2518', '苍溪县', '0', '388', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2519', '船山区', '0', '389', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2520', '安居区', '0', '389', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2521', '蓬溪县', '0', '389', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2522', '射洪县', '0', '389', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2523', '大英县', '0', '389', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2524', '市中区', '0', '390', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2525', '东兴区', '0', '390', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2526', '威远县', '0', '390', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2527', '资中县', '0', '390', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2528', '隆昌县', '0', '390', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2529', '市中区', '0', '391', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2530', '沙湾区', '0', '391', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2531', '五通桥区', '0', '391', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2532', '金口河区', '0', '391', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2533', '犍为县', '0', '391', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2534', '井研县', '0', '391', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2535', '夹江县', '0', '391', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2536', '沐川县', '0', '391', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2537', '峨边彝族自治县', '0', '391', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2538', '马边彝族自治县', '0', '391', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2539', '峨眉山市', '0', '391', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2540', '顺庆区', '0', '392', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2541', '高坪区', '0', '392', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2542', '嘉陵区', '0', '392', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2543', '南部县', '0', '392', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2544', '营山县', '0', '392', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2545', '蓬安县', '0', '392', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2546', '仪陇县', '0', '392', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2547', '西充县', '0', '392', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2548', '阆中市', '0', '392', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2549', '东坡区', '0', '393', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2550', '仁寿县', '0', '393', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2551', '彭山县', '0', '393', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2552', '洪雅县', '0', '393', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2553', '丹棱县', '0', '393', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2554', '青神县', '0', '393', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2555', '翠屏区', '0', '394', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2556', '宜宾县', '0', '394', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2557', '南溪县', '0', '394', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2558', '江安县', '0', '394', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2559', '长宁县', '0', '394', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2560', '高县', '0', '394', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2561', '珙县', '0', '394', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2562', '筠连县', '0', '394', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2563', '兴文县', '0', '394', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2564', '屏山县', '0', '394', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2565', '广安区', '0', '395', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2566', '岳池县', '0', '395', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2567', '武胜县', '0', '395', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2568', '邻水县', '0', '395', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2569', '华蓥市', '0', '395', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2570', '通川区', '0', '396', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2571', '达县', '0', '396', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2572', '宣汉县', '0', '396', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2573', '开江县', '0', '396', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2574', '大竹县', '0', '396', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2575', '渠县', '0', '396', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2576', '万源市', '0', '396', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2577', '雨城区', '0', '397', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2578', '名山县', '0', '397', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2579', '荥经县', '0', '397', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2580', '汉源县', '0', '397', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2581', '石棉县', '0', '397', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2582', '天全县', '0', '397', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2583', '芦山县', '0', '397', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2584', '宝兴县', '0', '397', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2585', '巴州区', '0', '398', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2586', '通江县', '0', '398', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2587', '南江县', '0', '398', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2588', '平昌县', '0', '398', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2589', '雁江区', '0', '399', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2590', '安岳县', '0', '399', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2591', '乐至县', '0', '399', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2592', '简阳市', '0', '399', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2593', '汶川县', '0', '400', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2594', '理县', '0', '400', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2595', '茂县', '0', '400', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2596', '松潘县', '0', '400', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2597', '九寨沟县', '0', '400', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2598', '金川县', '0', '400', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2599', '小金县', '0', '400', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2600', '黑水县', '0', '400', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2601', '马尔康县', '0', '400', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2602', '壤塘县', '0', '400', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2603', '阿坝县', '0', '400', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2604', '若尔盖县', '0', '400', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2605', '红原县', '0', '400', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2606', '康定县', '0', '401', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2607', '泸定县', '0', '401', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2608', '丹巴县', '0', '401', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2609', '九龙县', '0', '401', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2610', '雅江县', '0', '401', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2611', '道孚县', '0', '401', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2612', '炉霍县', '0', '401', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2613', '甘孜县', '0', '401', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2614', '新龙县', '0', '401', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2615', '德格县', '0', '401', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2616', '白玉县', '0', '401', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2617', '石渠县', '0', '401', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2618', '色达县', '0', '401', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2619', '理塘县', '0', '401', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2620', '巴塘县', '0', '401', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2621', '乡城县', '0', '401', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2622', '稻城县', '0', '401', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2623', '得荣县', '0', '401', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2624', '西昌市', '0', '402', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2625', '木里藏族自治县', '0', '402', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2626', '盐源县', '0', '402', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2627', '德昌县', '0', '402', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2628', '会理县', '0', '402', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2629', '会东县', '0', '402', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2630', '宁南县', '0', '402', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2631', '普格县', '0', '402', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2632', '布拖县', '0', '402', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2633', '金阳县', '0', '402', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2634', '昭觉县', '0', '402', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2635', '喜德县', '0', '402', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2636', '冕宁县', '0', '402', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2637', '越西县', '0', '402', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2638', '甘洛县', '0', '402', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2639', '美姑县', '0', '402', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2640', '雷波县', '0', '402', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2641', '南明区', '0', '403', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2642', '云岩区', '0', '403', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2643', '花溪区', '0', '403', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2644', '乌当区', '0', '403', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2645', '白云区', '0', '403', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2646', '小河区', '0', '403', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2647', '开阳县', '0', '403', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2648', '息烽县', '0', '403', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2649', '修文县', '0', '403', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2650', '清镇市', '0', '403', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2651', '钟山区', '0', '404', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2652', '六枝特区', '0', '404', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2653', '水城县', '0', '404', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2654', '盘县', '0', '404', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2655', '红花岗区', '0', '405', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2656', '汇川区', '0', '405', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2657', '遵义县', '0', '405', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2658', '桐梓县', '0', '405', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2659', '绥阳县', '0', '405', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2660', '正安县', '0', '405', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2661', '道真仡佬族苗族自治县', '0', '405', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2662', '务川仡佬族苗族自治县', '0', '405', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2663', '凤冈县', '0', '405', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2664', '湄潭县', '0', '405', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2665', '余庆县', '0', '405', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2666', '习水县', '0', '405', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2667', '赤水市', '0', '405', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2668', '仁怀市', '0', '405', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2669', '西秀区', '0', '406', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2670', '平坝县', '0', '406', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2671', '普定县', '0', '406', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2672', '镇宁布依族苗族自治县', '0', '406', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2673', '关岭布依族苗族自治县', '0', '406', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2674', '紫云苗族布依族自治县', '0', '406', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2675', '铜仁市', '0', '407', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2676', '江口县', '0', '407', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2677', '玉屏侗族自治县', '0', '407', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2678', '石阡县', '0', '407', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2679', '思南县', '0', '407', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2680', '印江土家族苗族自治县', '0', '407', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2681', '德江县', '0', '407', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2682', '沿河土家族自治县', '0', '407', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2683', '松桃苗族自治县', '0', '407', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2684', '万山特区', '0', '407', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2685', '兴义市', '0', '408', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2686', '兴仁县', '0', '408', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2687', '普安县', '0', '408', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2688', '晴隆县', '0', '408', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2689', '贞丰县', '0', '408', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2690', '望谟县', '0', '408', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2691', '册亨县', '0', '408', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2692', '安龙县', '0', '408', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2693', '毕节市', '0', '409', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2694', '大方县', '0', '409', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2695', '黔西县', '0', '409', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2696', '金沙县', '0', '409', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2697', '织金县', '0', '409', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2698', '纳雍县', '0', '409', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2699', '威宁彝族回族苗族自治县', '0', '409', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2700', '赫章县', '0', '409', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2701', '凯里市', '0', '410', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2702', '黄平县', '0', '410', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2703', '施秉县', '0', '410', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2704', '三穗县', '0', '410', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2705', '镇远县', '0', '410', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2706', '岑巩县', '0', '410', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2707', '天柱县', '0', '410', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2708', '锦屏县', '0', '410', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2709', '剑河县', '0', '410', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2710', '台江县', '0', '410', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2711', '黎平县', '0', '410', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2712', '榕江县', '0', '410', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2713', '从江县', '0', '410', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2714', '雷山县', '0', '410', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2715', '麻江县', '0', '410', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2716', '丹寨县', '0', '410', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2717', '都匀市', '0', '411', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2718', '福泉市', '0', '411', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2719', '荔波县', '0', '411', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2720', '贵定县', '0', '411', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2721', '瓮安县', '0', '411', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2722', '独山县', '0', '411', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2723', '平塘县', '0', '411', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2724', '罗甸县', '0', '411', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2725', '长顺县', '0', '411', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2726', '龙里县', '0', '411', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2727', '惠水县', '0', '411', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2728', '三都水族自治县', '0', '411', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2729', '五华区', '0', '412', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2730', '盘龙区', '0', '412', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2731', '官渡区', '0', '412', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2732', '西山区', '0', '412', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2733', '东川区', '0', '412', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2734', '呈贡县', '0', '412', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2735', '晋宁县', '0', '412', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2736', '富民县', '0', '412', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2737', '宜良县', '0', '412', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2738', '石林彝族自治县', '0', '412', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2739', '嵩明县', '0', '412', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2740', '禄劝彝族苗族自治县', '0', '412', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2741', '寻甸回族彝族自治县', '0', '412', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2742', '安宁市', '0', '412', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2743', '麒麟区', '0', '413', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2744', '马龙县', '0', '413', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2745', '陆良县', '0', '413', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2746', '师宗县', '0', '413', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2747', '罗平县', '0', '413', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2748', '富源县', '0', '413', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2749', '会泽县', '0', '413', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2750', '沾益县', '0', '413', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2751', '宣威市', '0', '413', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2752', '红塔区', '0', '414', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2753', '江川县', '0', '414', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2754', '澄江县', '0', '414', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2755', '通海县', '0', '414', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2756', '华宁县', '0', '414', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2757', '易门县', '0', '414', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2758', '峨山彝族自治县', '0', '414', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2759', '新平彝族傣族自治县', '0', '414', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2760', '元江哈尼族彝族傣族自治县', '0', '414', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2761', '隆阳区', '0', '415', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2762', '施甸县', '0', '415', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2763', '腾冲县', '0', '415', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2764', '龙陵县', '0', '415', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2765', '昌宁县', '0', '415', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2766', '昭阳区', '0', '416', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2767', '鲁甸县', '0', '416', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2768', '巧家县', '0', '416', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2769', '盐津县', '0', '416', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2770', '大关县', '0', '416', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2771', '永善县', '0', '416', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2772', '绥江县', '0', '416', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2773', '镇雄县', '0', '416', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2774', '彝良县', '0', '416', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2775', '威信县', '0', '416', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2776', '水富县', '0', '416', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2777', '古城区', '0', '417', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2778', '玉龙纳西族自治县', '0', '417', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2779', '永胜县', '0', '417', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2780', '华坪县', '0', '417', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2781', '宁蒗彝族自治县', '0', '417', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2782', '翠云区', '0', '418', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2783', '普洱哈尼族彝族自治县', '0', '418', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2784', '墨江哈尼族自治县', '0', '418', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2785', '景东彝族自治县', '0', '418', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2786', '景谷傣族彝族自治县', '0', '418', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2787', '镇沅彝族哈尼族拉祜族自治县', '0', '418', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2788', '江城哈尼族彝族自治县', '0', '418', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2789', '孟连傣族拉祜族佤族自治县', '0', '418', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2790', '澜沧拉祜族自治县', '0', '418', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2791', '西盟佤族自治县', '0', '418', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2792', '临翔区', '0', '419', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2793', '凤庆县', '0', '419', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2794', '云县', '0', '419', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2795', '永德县', '0', '419', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2796', '镇康县', '0', '419', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2797', '双江拉祜族佤族布朗族傣族自治县', '0', '419', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2798', '耿马傣族佤族自治县', '0', '419', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2799', '沧源佤族自治县', '0', '420', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2800', '楚雄市', '0', '420', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2801', '双柏县', '0', '420', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2802', '牟定县', '0', '420', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2803', '南华县', '0', '420', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2804', '姚安县', '0', '420', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2805', '大姚县', '0', '420', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2806', '永仁县', '0', '420', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2807', '元谋县', '0', '420', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2808', '武定县', '0', '420', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2809', '禄丰县', '0', '420', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2810', '个旧市', '0', '421', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2811', '开远市', '0', '421', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2812', '蒙自县', '0', '421', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2813', '屏边苗族自治县', '0', '421', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2814', '建水县', '0', '421', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2815', '石屏县', '0', '421', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2816', '弥勒县', '0', '421', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2817', '泸西县', '0', '421', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2818', '元阳县', '0', '421', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2819', '红河县', '0', '421', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2820', '金平苗族瑶族傣族自治县', '0', '421', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2821', '绿春县', '0', '421', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2822', '河口瑶族自治县', '0', '421', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2823', '文山县', '0', '422', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2824', '砚山县', '0', '422', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2825', '西畴县', '0', '422', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2826', '麻栗坡县', '0', '422', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2827', '马关县', '0', '422', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2828', '丘北县', '0', '422', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2829', '广南县', '0', '422', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2830', '富宁县', '0', '422', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2831', '景洪市', '0', '423', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2832', '勐海县', '0', '423', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2833', '勐腊县', '0', '423', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2834', '大理市', '0', '424', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2835', '漾濞彝族自治县', '0', '424', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2836', '祥云县', '0', '424', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2837', '宾川县', '0', '424', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2838', '弥渡县', '0', '424', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2839', '南涧彝族自治县', '0', '424', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2840', '巍山彝族回族自治县', '0', '424', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2841', '永平县', '0', '424', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2842', '云龙县', '0', '424', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2843', '洱源县', '0', '424', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2844', '剑川县', '0', '424', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2845', '鹤庆县', '0', '424', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2846', '瑞丽市', '0', '425', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2847', '潞西市', '0', '425', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2848', '梁河县', '0', '425', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2849', '盈江县', '0', '425', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2850', '陇川县', '0', '425', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2851', '泸水县', '0', '426', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2852', '福贡县', '0', '426', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2853', '贡山独龙族怒族自治县', '0', '426', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2854', '兰坪白族普米族自治县', '0', '426', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2855', '香格里拉县', '0', '427', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2856', '德钦县', '0', '427', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2857', '维西傈僳族自治县', '0', '427', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2858', '城关区', '0', '428', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2859', '林周县', '0', '428', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2860', '当雄县', '0', '428', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2861', '尼木县', '0', '428', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2862', '曲水县', '0', '428', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2863', '堆龙德庆县', '0', '428', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2864', '达孜县', '0', '428', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2865', '墨竹工卡县', '0', '428', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2866', '昌都县', '0', '429', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2867', '江达县', '0', '429', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2868', '贡觉县', '0', '429', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2869', '类乌齐县', '0', '429', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2870', '丁青县', '0', '429', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2871', '察雅县', '0', '429', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2872', '八宿县', '0', '429', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2873', '左贡县', '0', '429', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2874', '芒康县', '0', '429', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2875', '洛隆县', '0', '429', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2876', '边坝县', '0', '429', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2877', '乃东县', '0', '430', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2878', '扎囊县', '0', '430', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2879', '贡嘎县', '0', '430', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2880', '桑日县', '0', '430', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2881', '琼结县', '0', '430', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2882', '曲松县', '0', '430', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2883', '措美县', '0', '430', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2884', '洛扎县', '0', '430', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2885', '加查县', '0', '430', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2886', '隆子县', '0', '430', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2887', '错那县', '0', '430', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2888', '浪卡子县', '0', '430', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2889', '日喀则市', '0', '431', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2890', '南木林县', '0', '431', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2891', '江孜县', '0', '431', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2892', '定日县', '0', '431', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2893', '萨迦县', '0', '431', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2894', '拉孜县', '0', '431', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2895', '昂仁县', '0', '431', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2896', '谢通门县', '0', '431', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2897', '白朗县', '0', '431', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2898', '仁布县', '0', '431', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2899', '康马县', '0', '431', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2900', '定结县', '0', '431', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2901', '仲巴县', '0', '431', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2902', '亚东县', '0', '431', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2903', '吉隆县', '0', '431', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2904', '聂拉木县', '0', '431', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2905', '萨嘎县', '0', '431', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2906', '岗巴县', '0', '431', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2907', '那曲县', '0', '432', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2908', '嘉黎县', '0', '432', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2909', '比如县', '0', '432', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2910', '聂荣县', '0', '432', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2911', '安多县', '0', '432', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2912', '申扎县', '0', '432', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2913', '索县', '0', '432', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2914', '班戈县', '0', '432', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2915', '巴青县', '0', '432', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2916', '尼玛县', '0', '432', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2917', '普兰县', '0', '433', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2918', '札达县', '0', '433', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2919', '噶尔县', '0', '433', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2920', '日土县', '0', '433', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2921', '革吉县', '0', '433', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2922', '改则县', '0', '433', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2923', '措勤县', '0', '433', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2924', '林芝县', '0', '434', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2925', '工布江达县', '0', '434', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2926', '米林县', '0', '434', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2927', '墨脱县', '0', '434', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2928', '波密县', '0', '434', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2929', '察隅县', '0', '434', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2930', '朗县', '0', '434', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2931', '新城区', '0', '435', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2932', '碑林区', '0', '435', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2933', '莲湖区', '0', '435', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2934', '灞桥区', '0', '435', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2935', '未央区', '0', '435', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2936', '雁塔区', '0', '435', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2937', '阎良区', '0', '435', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2938', '临潼区', '0', '435', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2939', '长安区', '0', '435', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2940', '蓝田县', '0', '435', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2941', '周至县', '0', '435', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2942', '户县', '0', '435', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2943', '高陵县', '0', '435', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2944', '王益区', '0', '436', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2945', '印台区', '0', '436', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2946', '耀州区', '0', '436', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2947', '宜君县', '0', '436', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2948', '渭滨区', '0', '437', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2949', '金台区', '0', '437', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2950', '陈仓区', '0', '437', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2951', '凤翔县', '0', '437', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2952', '岐山县', '0', '437', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2953', '扶风县', '0', '437', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2954', '眉县', '0', '437', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2955', '陇县', '0', '437', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2956', '千阳县', '0', '437', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2957', '麟游县', '0', '437', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2958', '凤县', '0', '437', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2959', '太白县', '0', '437', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2960', '秦都区', '0', '438', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2961', '杨凌区', '0', '438', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2962', '渭城区', '0', '438', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2963', '三原县', '0', '438', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2964', '泾阳县', '0', '438', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2965', '乾县', '0', '438', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2966', '礼泉县', '0', '438', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2967', '永寿县', '0', '438', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2968', '彬县', '0', '438', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2969', '长武县', '0', '438', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2970', '旬邑县', '0', '438', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2971', '淳化县', '0', '438', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2972', '武功县', '0', '438', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2973', '兴平市', '0', '438', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2974', '临渭区', '0', '439', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2975', '华县', '0', '439', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2976', '潼关县', '0', '439', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2977', '大荔县', '0', '439', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2978', '合阳县', '0', '439', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2979', '澄城县', '0', '439', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2980', '蒲城县', '0', '439', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2981', '白水县', '0', '439', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2982', '富平县', '0', '439', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2983', '韩城市', '0', '439', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2984', '华阴市', '0', '439', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2985', '宝塔区', '0', '440', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2986', '延长县', '0', '440', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2987', '延川县', '0', '440', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2988', '子长县', '0', '440', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2989', '安塞县', '0', '440', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2990', '志丹县', '0', '440', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2991', '吴起县', '0', '440', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2992', '甘泉县', '0', '440', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2993', '富县', '0', '440', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2994', '洛川县', '0', '440', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2995', '宜川县', '0', '440', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2996', '黄龙县', '0', '440', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2997', '黄陵县', '0', '440', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2998', '汉台区', '0', '441', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('2999', '南郑县', '0', '441', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3000', '城固县', '0', '441', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3001', '洋县', '0', '441', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3002', '西乡县', '0', '441', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3003', '勉县', '0', '441', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3004', '宁强县', '0', '441', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3005', '略阳县', '0', '441', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3006', '镇巴县', '0', '441', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3007', '留坝县', '0', '441', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3008', '佛坪县', '0', '441', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3009', '榆阳区', '0', '442', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3010', '神木县', '0', '442', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3011', '府谷县', '0', '442', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3012', '横山县', '0', '442', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3013', '靖边县', '0', '442', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3014', '定边县', '0', '442', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3015', '绥德县', '0', '442', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3016', '米脂县', '0', '442', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3017', '佳县', '0', '442', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3018', '吴堡县', '0', '442', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3019', '清涧县', '0', '442', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3020', '子洲县', '0', '442', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3021', '汉滨区', '0', '443', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3022', '汉阴县', '0', '443', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3023', '石泉县', '0', '443', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3024', '宁陕县', '0', '443', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3025', '紫阳县', '0', '443', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3026', '岚皋县', '0', '443', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3027', '平利县', '0', '443', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3028', '镇坪县', '0', '443', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3029', '旬阳县', '0', '443', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3030', '白河县', '0', '443', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3031', '商州区', '0', '444', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3032', '洛南县', '0', '444', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3033', '丹凤县', '0', '444', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3034', '商南县', '0', '444', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3035', '山阳县', '0', '444', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3036', '镇安县', '0', '444', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3037', '柞水县', '0', '444', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3038', '城关区', '0', '445', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3039', '七里河区', '0', '445', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3040', '西固区', '0', '445', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3041', '安宁区', '0', '445', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3042', '红古区', '0', '445', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3043', '永登县', '0', '445', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3044', '皋兰县', '0', '445', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3045', '榆中县', '0', '445', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3046', '金川区', '0', '447', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3047', '永昌县', '0', '447', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3048', '白银区', '0', '448', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3049', '平川区', '0', '448', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3050', '靖远县', '0', '448', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3051', '会宁县', '0', '448', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3052', '景泰县', '0', '448', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3053', '秦城区', '0', '449', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3054', '北道区', '0', '449', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3055', '清水县', '0', '449', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3056', '秦安县', '0', '449', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3057', '甘谷县', '0', '449', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3058', '武山县', '0', '449', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3059', '张家川回族自治县', '0', '449', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3060', '凉州区', '0', '450', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3061', '民勤县', '0', '450', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3062', '古浪县', '0', '450', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3063', '天祝藏族自治县', '0', '450', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3064', '甘州区', '0', '451', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3065', '肃南裕固族自治县', '0', '451', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3066', '民乐县', '0', '451', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3067', '临泽县', '0', '451', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3068', '高台县', '0', '451', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3069', '山丹县', '0', '451', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3070', '崆峒区', '0', '452', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3071', '泾川县', '0', '452', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3072', '灵台县', '0', '452', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3073', '崇信县', '0', '452', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3074', '华亭县', '0', '452', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3075', '庄浪县', '0', '452', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3076', '静宁县', '0', '452', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3077', '肃州区', '0', '453', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3078', '金塔县', '0', '453', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3079', '瓜州县', '0', '453', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3080', '肃北蒙古族自治县', '0', '453', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3081', '阿克塞哈萨克族自治县', '0', '453', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3082', '玉门市', '0', '453', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3083', '敦煌市', '0', '453', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3084', '西峰区', '0', '454', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3085', '庆城县', '0', '454', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3086', '环县', '0', '454', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3087', '华池县', '0', '454', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3088', '合水县', '0', '454', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3089', '正宁县', '0', '454', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3090', '宁县', '0', '454', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3091', '镇原县', '0', '454', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3092', '安定区', '0', '455', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3093', '通渭县', '0', '455', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3094', '陇西县', '0', '455', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3095', '渭源县', '0', '455', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3096', '临洮县', '0', '455', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3097', '漳县', '0', '455', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3098', '岷县', '0', '455', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3099', '武都区', '0', '456', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3100', '成县', '0', '456', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3101', '文县', '0', '456', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3102', '宕昌县', '0', '456', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3103', '康县', '0', '456', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3104', '西和县', '0', '456', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3105', '礼县', '0', '456', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3106', '徽县', '0', '456', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3107', '两当县', '0', '456', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3108', '临夏市', '0', '457', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3109', '临夏县', '0', '457', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3110', '康乐县', '0', '457', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3111', '永靖县', '0', '457', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3112', '广河县', '0', '457', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3113', '和政县', '0', '457', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3114', '东乡族自治县', '0', '457', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3115', '积石山保安族东乡族撒拉族自治县', '0', '457', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3116', '合作市', '0', '458', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3117', '临潭县', '0', '458', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3118', '卓尼县', '0', '458', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3119', '舟曲县', '0', '458', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3120', '迭部县', '0', '458', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3121', '玛曲县', '0', '458', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3122', '碌曲县', '0', '458', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3123', '夏河县', '0', '458', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3124', '城东区', '0', '459', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3125', '城中区', '0', '459', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3126', '城西区', '0', '459', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3127', '城北区', '0', '459', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3128', '大通回族土族自治县', '0', '459', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3129', '湟中县', '0', '459', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3130', '湟源县', '0', '459', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3131', '平安县', '0', '460', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3132', '民和回族土族自治县', '0', '460', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3133', '乐都县', '0', '460', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3134', '互助土族自治县', '0', '460', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3135', '化隆回族自治县', '0', '460', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3136', '循化撒拉族自治县', '0', '460', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3137', '门源回族自治县', '0', '461', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3138', '祁连县', '0', '461', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3139', '海晏县', '0', '461', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3140', '刚察县', '0', '461', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3141', '同仁县', '0', '462', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3142', '尖扎县', '0', '462', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3143', '泽库县', '0', '462', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3144', '河南蒙古族自治县', '0', '462', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3145', '共和县', '0', '463', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3146', '同德县', '0', '463', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3147', '贵德县', '0', '463', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3148', '兴海县', '0', '463', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3149', '贵南县', '0', '463', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3150', '玛沁县', '0', '464', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3151', '班玛县', '0', '464', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3152', '甘德县', '0', '464', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3153', '达日县', '0', '464', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3154', '久治县', '0', '464', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3155', '玛多县', '0', '464', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3156', '玉树县', '0', '465', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3157', '杂多县', '0', '465', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3158', '称多县', '0', '465', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3159', '治多县', '0', '465', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3160', '囊谦县', '0', '465', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3161', '曲麻莱县', '0', '465', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3162', '格尔木市', '0', '466', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3163', '德令哈市', '0', '466', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3164', '乌兰县', '0', '466', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3165', '都兰县', '0', '466', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3166', '天峻县', '0', '466', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3167', '兴庆区', '0', '467', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3168', '西夏区', '0', '467', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3169', '金凤区', '0', '467', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3170', '永宁县', '0', '467', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3171', '贺兰县', '0', '467', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3172', '灵武市', '0', '467', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3173', '大武口区', '0', '468', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3174', '惠农区', '0', '468', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3175', '平罗县', '0', '468', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3176', '利通区', '0', '469', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3177', '盐池县', '0', '469', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3178', '同心县', '0', '469', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3179', '青铜峡市', '0', '469', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3180', '原州区', '0', '470', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3181', '西吉县', '0', '470', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3182', '隆德县', '0', '470', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3183', '泾源县', '0', '470', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3184', '彭阳县', '0', '470', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3185', '沙坡头区', '0', '471', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3186', '中宁县', '0', '471', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3187', '海原县', '0', '471', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3188', '天山区', '0', '472', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3189', '沙依巴克区', '0', '472', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3190', '新市区', '0', '472', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3191', '水磨沟区', '0', '472', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3192', '头屯河区', '0', '472', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3193', '达坂城区', '0', '472', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3194', '东山区', '0', '472', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3195', '乌鲁木齐县', '0', '472', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3196', '独山子区', '0', '473', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3197', '克拉玛依区', '0', '473', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3198', '白碱滩区', '0', '473', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3199', '乌尔禾区', '0', '473', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3200', '吐鲁番市', '0', '474', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3201', '鄯善县', '0', '474', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3202', '托克逊县', '0', '474', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3203', '哈密市', '0', '475', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3204', '巴里坤哈萨克自治县', '0', '475', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3205', '伊吾县', '0', '475', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3206', '昌吉市', '0', '476', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3207', '阜康市', '0', '476', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3208', '米泉市', '0', '476', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3209', '呼图壁县', '0', '476', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3210', '玛纳斯县', '0', '476', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3211', '奇台县', '0', '476', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3212', '吉木萨尔县', '0', '476', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3213', '木垒哈萨克自治县', '0', '476', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3214', '博乐市', '0', '477', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3215', '精河县', '0', '477', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3216', '温泉县', '0', '477', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3217', '库尔勒市', '0', '478', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3218', '轮台县', '0', '478', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3219', '尉犁县', '0', '478', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3220', '若羌县', '0', '478', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3221', '且末县', '0', '478', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3222', '焉耆回族自治县', '0', '478', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3223', '和静县', '0', '478', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3224', '和硕县', '0', '478', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3225', '博湖县', '0', '478', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3226', '阿克苏市', '0', '479', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3227', '温宿县', '0', '479', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3228', '库车县', '0', '479', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3229', '沙雅县', '0', '479', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3230', '新和县', '0', '479', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3231', '拜城县', '0', '479', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3232', '乌什县', '0', '479', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3233', '阿瓦提县', '0', '479', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3234', '柯坪县', '0', '479', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3235', '阿图什市', '0', '480', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3236', '阿克陶县', '0', '480', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3237', '阿合奇县', '0', '480', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3238', '乌恰县', '0', '480', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3239', '喀什市', '0', '481', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3240', '疏附县', '0', '481', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3241', '疏勒县', '0', '481', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3242', '英吉沙县', '0', '481', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3243', '泽普县', '0', '481', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3244', '莎车县', '0', '481', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3245', '叶城县', '0', '481', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3246', '麦盖提县', '0', '481', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3247', '岳普湖县', '0', '481', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3248', '伽师县', '0', '481', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3249', '巴楚县', '0', '481', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3250', '塔什库尔干塔吉克自治县', '0', '481', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3251', '和田市', '0', '482', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3252', '和田县', '0', '482', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3253', '墨玉县', '0', '482', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3254', '皮山县', '0', '482', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3255', '洛浦县', '0', '482', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3256', '策勒县', '0', '482', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3257', '于田县', '0', '482', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3258', '民丰县', '0', '482', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3259', '伊宁市', '0', '483', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3260', '奎屯市', '0', '483', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3261', '伊宁县', '0', '483', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3262', '察布查尔锡伯自治县', '0', '483', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3263', '霍城县', '0', '483', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3264', '巩留县', '0', '483', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3265', '新源县', '0', '483', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3266', '昭苏县', '0', '483', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3267', '特克斯县', '0', '483', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3268', '尼勒克县', '0', '483', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3269', '塔城市', '0', '484', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3270', '乌苏市', '0', '484', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3271', '额敏县', '0', '484', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3272', '沙湾县', '0', '484', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3273', '托里县', '0', '484', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3274', '裕民县', '0', '484', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3275', '和布克赛尔蒙古自治县', '0', '484', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3276', '阿勒泰市', '0', '485', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3277', '布尔津县', '0', '485', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3278', '富蕴县', '0', '485', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3279', '福海县', '0', '485', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3280', '哈巴河县', '0', '485', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3281', '青河县', '0', '485', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3282', '吉木乃县', '0', '485', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3358', '钓鱼岛', '', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `hc_linkage` VALUES ('3359', '钓鱼岛', '', '3358', '0', '', '1', '0', '', null, '0');

-- ----------------------------
-- Table structure for `hc_link_store`
-- ----------------------------
DROP TABLE IF EXISTS `hc_link_store`;
CREATE TABLE `hc_link_store` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `typeid` smallint(5) unsigned NOT NULL,
  `title` char(80) NOT NULL DEFAULT '',
  `style` char(24) NOT NULL DEFAULT '',
  `thumb` char(100) NOT NULL DEFAULT '',
  `keywords` char(40) NOT NULL DEFAULT '',
  `description` char(255) NOT NULL DEFAULT '',
  `posids` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `url` char(100) NOT NULL,
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `sysadd` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `islink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `status` (`status`,`listorder`,`id`) USING BTREE,
  KEY `listorder` (`catid`,`status`,`listorder`,`id`) USING BTREE,
  KEY `catid` (`catid`,`status`,`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hc_link_store
-- ----------------------------

-- ----------------------------
-- Table structure for `hc_link_store_data`
-- ----------------------------
DROP TABLE IF EXISTS `hc_link_store_data`;
CREATE TABLE `hc_link_store_data` (
  `id` mediumint(8) unsigned DEFAULT '0',
  `content` text NOT NULL,
  `readpoint` smallint(5) unsigned NOT NULL DEFAULT '0',
  `groupids_view` varchar(100) NOT NULL,
  `paginationtype` tinyint(1) NOT NULL,
  `maxcharperpage` mediumint(6) NOT NULL,
  `template` varchar(30) NOT NULL,
  `paytype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allow_comment` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `relation` varchar(255) NOT NULL DEFAULT '',
  KEY `id` (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hc_link_store_data
-- ----------------------------

-- ----------------------------
-- Table structure for `hc_log`
-- ----------------------------
DROP TABLE IF EXISTS `hc_log`;
CREATE TABLE `hc_log` (
  `logid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `field` varchar(15) NOT NULL,
  `value` int(10) unsigned NOT NULL DEFAULT '0',
  `module` varchar(15) NOT NULL,
  `file` varchar(20) NOT NULL,
  `action` varchar(20) NOT NULL,
  `querystring` varchar(255) NOT NULL,
  `data` mediumtext NOT NULL,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(20) NOT NULL,
  `ip` varchar(15) NOT NULL,
  `time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`logid`),
  KEY `module` (`module`,`file`,`action`) USING BTREE,
  KEY `username` (`username`,`action`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=1084 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hc_log
-- ----------------------------
INSERT INTO `hc_log` VALUES ('1', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '127.0.0.1', '2015-04-13 12:59:10');
INSERT INTO `hc_log` VALUES ('2', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '127.0.0.1', '2015-04-13 12:59:17');
INSERT INTO `hc_log` VALUES ('3', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '127.0.0.1', '2015-04-13 13:07:53');
INSERT INTO `hc_log` VALUES ('4', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '127.0.0.1', '2015-04-13 13:08:20');
INSERT INTO `hc_log` VALUES ('5', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '127.0.0.1', '2015-04-13 13:08:45');
INSERT INTO `hc_log` VALUES ('6', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=add', '', '1', 'admin', '127.0.0.1', '2015-04-13 13:09:02');
INSERT INTO `hc_log` VALUES ('7', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=add', '', '1', 'admin', '127.0.0.1', '2015-04-13 13:09:56');
INSERT INTO `hc_log` VALUES ('8', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=add', '', '1', 'admin', '127.0.0.1', '2015-04-13 13:11:54');
INSERT INTO `hc_log` VALUES ('9', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=add', '', '1', 'admin', '127.0.0.1', '2015-04-13 13:13:10');
INSERT INTO `hc_log` VALUES ('10', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '127.0.0.1', '2015-04-13 13:13:12');
INSERT INTO `hc_log` VALUES ('11', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '127.0.0.1', '2015-04-13 13:13:20');
INSERT INTO `hc_log` VALUES ('12', '', '0', 'admin', '', 'googlesitemap', '?m=admin&c=googlesitemap&a=set', '', '1', 'admin', '127.0.0.1', '2015-04-13 13:15:19');
INSERT INTO `hc_log` VALUES ('13', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2015-04-13 13:20:15');
INSERT INTO `hc_log` VALUES ('14', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '127.0.0.1', '2015-04-13 13:20:24');
INSERT INTO `hc_log` VALUES ('15', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2015-04-13 13:28:52');
INSERT INTO `hc_log` VALUES ('16', '', '0', 'admin', '', 'database', '?m=admin&c=database&a=export', '', '1', 'admin', '127.0.0.1', '2015-04-13 13:36:26');
INSERT INTO `hc_log` VALUES ('17', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2015-04-13 16:58:16');
INSERT INTO `hc_log` VALUES ('18', '', '0', 'admin', '', 'admin_manage', '?m=admin&c=admin_manage&a=edit', '', '1', 'admin', '127.0.0.1', '2015-04-13 17:00:26');
INSERT INTO `hc_log` VALUES ('19', '', '0', 'comment', '', 'comment_admin', '?m=comment&c=comment_admin&a=listinfo', '', '1', 'admin', '127.0.0.1', '2015-04-13 17:01:11');
INSERT INTO `hc_log` VALUES ('20', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2015-04-13 17:06:06');
INSERT INTO `hc_log` VALUES ('21', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2015-04-13 17:19:36');
INSERT INTO `hc_log` VALUES ('22', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2015-04-13 17:19:42');
INSERT INTO `hc_log` VALUES ('23', '', '0', 'comment', '', 'comment_admin', '?m=comment&c=comment_admin&a=listinfo', '', '1', 'admin', '127.0.0.1', '2015-04-13 17:19:59');
INSERT INTO `hc_log` VALUES ('24', '', '0', 'comment', '', 'check', '?m=comment&c=check&a=checks', '', '1', 'admin', '127.0.0.1', '2015-04-13 17:20:04');
INSERT INTO `hc_log` VALUES ('25', '', '0', 'comment', '', 'comment_admin', '?m=comment&c=comment_admin&a=listinfo', '', '1', 'admin', '127.0.0.1', '2015-04-13 17:20:36');
INSERT INTO `hc_log` VALUES ('26', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2015-04-13 17:50:59');
INSERT INTO `hc_log` VALUES ('27', '', '0', 'comment', '', 'comment_admin', '?m=comment&c=comment_admin&a=listinfo', '', '1', 'admin', '127.0.0.1', '2015-04-13 17:52:46');
INSERT INTO `hc_log` VALUES ('28', '', '0', 'comment', '', 'check', '?m=comment&c=check&a=checks', '', '1', 'admin', '127.0.0.1', '2015-04-13 17:52:48');
INSERT INTO `hc_log` VALUES ('29', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2015-04-14 13:19:50');
INSERT INTO `hc_log` VALUES ('30', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2015-04-14 13:19:56');
INSERT INTO `hc_log` VALUES ('31', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '127.0.0.1', '2015-04-14 13:20:15');
INSERT INTO `hc_log` VALUES ('32', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2015-04-27 13:34:13');
INSERT INTO `hc_log` VALUES ('33', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2015-04-27 13:34:28');
INSERT INTO `hc_log` VALUES ('34', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2015-04-27 13:36:04');
INSERT INTO `hc_log` VALUES ('35', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2015-04-27 13:36:07');
INSERT INTO `hc_log` VALUES ('36', '', '0', 'collection', '', 'node', '?m=collection&c=node&a=manage', '', '1', 'admin', '127.0.0.1', '2015-04-27 13:37:48');
INSERT INTO `hc_log` VALUES ('37', '', '0', 'collection', '', 'node', '?m=collection&c=node&a=add', '', '1', 'admin', '127.0.0.1', '2015-04-27 13:37:50');
INSERT INTO `hc_log` VALUES ('38', '', '0', 'collection', '', 'node', '?m=collection&c=node&a=manage', '', '1', 'admin', '127.0.0.1', '2015-04-27 13:37:53');
INSERT INTO `hc_log` VALUES ('39', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '127.0.0.1', '2015-05-08 13:53:22');
INSERT INTO `hc_log` VALUES ('40', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '127.0.0.1', '2015-05-08 13:53:35');
INSERT INTO `hc_log` VALUES ('41', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2015-05-08 13:54:27');
INSERT INTO `hc_log` VALUES ('42', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2015-05-08 13:54:33');
INSERT INTO `hc_log` VALUES ('43', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2015-05-08 13:54:38');
INSERT INTO `hc_log` VALUES ('44', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2015-05-08 13:57:20');
INSERT INTO `hc_log` VALUES ('45', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2015-05-08 14:01:24');
INSERT INTO `hc_log` VALUES ('46', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2015-05-08 14:43:19');
INSERT INTO `hc_log` VALUES ('47', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2015-05-08 14:43:20');
INSERT INTO `hc_log` VALUES ('48', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2015-05-08 14:43:21');
INSERT INTO `hc_log` VALUES ('49', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2015-05-08 14:43:22');
INSERT INTO `hc_log` VALUES ('50', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2015-05-08 14:43:22');
INSERT INTO `hc_log` VALUES ('51', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2015-05-08 14:43:22');
INSERT INTO `hc_log` VALUES ('52', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2015-05-08 14:44:06');
INSERT INTO `hc_log` VALUES ('53', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2015-05-08 14:44:55');
INSERT INTO `hc_log` VALUES ('54', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2015-05-08 14:45:11');
INSERT INTO `hc_log` VALUES ('55', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2015-05-08 14:46:04');
INSERT INTO `hc_log` VALUES ('56', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2015-05-08 14:47:10');
INSERT INTO `hc_log` VALUES ('57', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2015-05-08 14:48:13');
INSERT INTO `hc_log` VALUES ('58', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '1', '', '127.0.0.1', '2015-05-08 16:11:28');
INSERT INTO `hc_log` VALUES ('59', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '1', '', '127.0.0.1', '2015-05-08 16:11:35');
INSERT INTO `hc_log` VALUES ('60', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=pay_list', '', '1', 'admin', '127.0.0.1', '2015-05-08 16:23:26');
INSERT INTO `hc_log` VALUES ('61', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2015-05-08 16:23:37');
INSERT INTO `hc_log` VALUES ('62', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2015-05-08 16:23:38');
INSERT INTO `hc_log` VALUES ('63', '', '0', 'member', '', 'member_setting', '?m=member&c=member_setting&a=manage', '', '1', 'admin', '127.0.0.1', '2015-05-08 16:23:38');
INSERT INTO `hc_log` VALUES ('64', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=manage', '', '1', 'admin', '127.0.0.1', '2015-05-08 16:23:47');
INSERT INTO `hc_log` VALUES ('65', '', '0', 'member', '', 'member_model', '?m=member&c=member_model&a=manage', '', '1', 'admin', '127.0.0.1', '2015-05-08 16:23:49');
INSERT INTO `hc_log` VALUES ('66', '', '0', 'member', '', 'member_menu', '?m=member&c=member_menu&a=manage', '', '1', 'admin', '127.0.0.1', '2015-05-08 16:24:00');
INSERT INTO `hc_log` VALUES ('67', '', '0', 'admin', '', 'database', '?m=admin&c=database&a=export', '', '1', 'admin', '127.0.0.1', '2015-05-08 16:24:11');
INSERT INTO `hc_log` VALUES ('68', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2015-05-08 16:26:35');
INSERT INTO `hc_log` VALUES ('69', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2015-05-08 16:26:36');
INSERT INTO `hc_log` VALUES ('70', '', '0', 'member', '', 'member_menu', '?m=member&c=member_menu&a=manage', '', '1', 'admin', '127.0.0.1', '2015-05-08 18:03:54');
INSERT INTO `hc_log` VALUES ('71', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=pay_list', '', '1', 'admin', '127.0.0.1', '2015-05-08 18:10:20');
INSERT INTO `hc_log` VALUES ('72', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2015-05-08 18:10:34');
INSERT INTO `hc_log` VALUES ('73', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2015-05-08 18:12:36');
INSERT INTO `hc_log` VALUES ('74', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '127.0.0.1', '2015-05-08 18:25:51');
INSERT INTO `hc_log` VALUES ('75', '', '0', 'content', '', 'content', '?m=content&c=content&a=clear_data', '', '1', 'admin', '127.0.0.1', '2015-05-08 18:25:55');
INSERT INTO `hc_log` VALUES ('76', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '127.0.0.1', '2015-05-08 18:25:57');
INSERT INTO `hc_log` VALUES ('77', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'admin', '127.0.0.1', '2015-05-08 18:25:58');
INSERT INTO `hc_log` VALUES ('78', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '127.0.0.1', '2015-05-08 18:26:39');
INSERT INTO `hc_log` VALUES ('79', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2015-05-08 20:20:13');
INSERT INTO `hc_log` VALUES ('80', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2015-05-08 20:20:28');
INSERT INTO `hc_log` VALUES ('81', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=pay_list', '', '1', 'admin', '127.0.0.1', '2015-05-08 20:21:07');
INSERT INTO `hc_log` VALUES ('82', '', '0', 'content', '', 'sitemodel', '?m=content&c=sitemodel&a=add', '', '1', 'admin', '127.0.0.1', '2015-05-08 20:21:36');
INSERT INTO `hc_log` VALUES ('83', '', '0', 'content', '', 'sitemodel', '?m=content&c=sitemodel&a=edit', '', '1', 'admin', '127.0.0.1', '2015-05-08 20:21:49');
INSERT INTO `hc_log` VALUES ('84', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2015-05-15 10:57:07');
INSERT INTO `hc_log` VALUES ('85', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2015-05-15 10:57:17');
INSERT INTO `hc_log` VALUES ('86', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2015-05-18 18:02:20');
INSERT INTO `hc_log` VALUES ('87', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2015-05-18 18:02:24');
INSERT INTO `hc_log` VALUES ('88', '', '0', 'attachment', '', 'manage', '?m=attachment&c=manage&a=dir', '', '1', 'admin', '127.0.0.1', '2015-05-18 18:04:34');
INSERT INTO `hc_log` VALUES ('89', '', '0', 'attachment', '', 'manage', '?m=attachment&c=manage&a=dir', '', '1', 'admin', '127.0.0.1', '2015-05-18 18:04:34');
INSERT INTO `hc_log` VALUES ('90', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2015-05-18 18:05:17');
INSERT INTO `hc_log` VALUES ('91', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2015-05-18 18:05:17');
INSERT INTO `hc_log` VALUES ('92', '', '0', 'attachment', '', 'manage', '?m=attachment&c=manage&a=dir', '', '1', 'admin', '127.0.0.1', '2015-05-18 18:06:08');
INSERT INTO `hc_log` VALUES ('93', '', '0', 'attachment', '', 'manage', '?m=attachment&c=manage&a=dir', '', '1', 'admin', '127.0.0.1', '2015-05-18 18:06:08');
INSERT INTO `hc_log` VALUES ('94', '', '0', 'attachment', '', 'manage', '?m=attachment&c=manage&a=dir', '', '1', 'admin', '127.0.0.1', '2015-05-18 18:06:09');
INSERT INTO `hc_log` VALUES ('95', '', '0', 'attachment', '', 'manage', '?m=attachment&c=manage&a=dir', '', '1', 'admin', '127.0.0.1', '2015-05-18 18:06:09');
INSERT INTO `hc_log` VALUES ('96', '', '0', 'attachment', '', 'manage', '?m=attachment&c=manage&a=dir', '', '1', 'admin', '127.0.0.1', '2015-05-18 18:06:17');
INSERT INTO `hc_log` VALUES ('97', '', '0', 'attachment', '', 'manage', '?m=attachment&c=manage&a=dir', '', '1', 'admin', '127.0.0.1', '2015-05-18 18:06:17');
INSERT INTO `hc_log` VALUES ('98', '', '0', 'attachment', '', 'manage', '?m=attachment&c=manage&a=dir', '', '1', 'admin', '127.0.0.1', '2015-05-18 18:06:46');
INSERT INTO `hc_log` VALUES ('99', '', '0', 'attachment', '', 'manage', '?m=attachment&c=manage&a=dir', '', '1', 'admin', '127.0.0.1', '2015-05-18 18:06:46');
INSERT INTO `hc_log` VALUES ('100', '', '0', 'attachment', '', 'manage', '?m=attachment&c=manage&a=dir', '', '1', 'admin', '127.0.0.1', '2015-05-18 18:06:48');
INSERT INTO `hc_log` VALUES ('101', '', '0', 'attachment', '', 'manage', '?m=attachment&c=manage&a=dir', '', '1', 'admin', '127.0.0.1', '2015-05-18 18:06:48');
INSERT INTO `hc_log` VALUES ('102', '', '0', 'attachment', '', 'manage', '?m=attachment&c=manage&a=dir', '', '1', 'admin', '127.0.0.1', '2015-05-18 18:07:53');
INSERT INTO `hc_log` VALUES ('103', '', '0', 'attachment', '', 'manage', '?m=attachment&c=manage&a=dir', '', '1', 'admin', '127.0.0.1', '2015-05-18 18:07:53');
INSERT INTO `hc_log` VALUES ('104', '', '0', 'attachment', '', 'manage', '?m=attachment&c=manage&a=dir', '', '1', 'admin', '127.0.0.1', '2015-05-18 18:08:01');
INSERT INTO `hc_log` VALUES ('105', '', '0', 'attachment', '', 'manage', '?m=attachment&c=manage&a=dir', '', '1', 'admin', '127.0.0.1', '2015-05-18 18:08:01');
INSERT INTO `hc_log` VALUES ('106', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2015-05-18 18:09:43');
INSERT INTO `hc_log` VALUES ('107', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2015-05-18 18:09:44');
INSERT INTO `hc_log` VALUES ('108', '', '0', 'poster', '', 'space', '?m=poster&c=space&a=add', '', '1', 'admin', '127.0.0.1', '2015-05-18 18:10:51');
INSERT INTO `hc_log` VALUES ('109', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2015-05-18 18:11:17');
INSERT INTO `hc_log` VALUES ('110', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2015-05-18 18:11:17');
INSERT INTO `hc_log` VALUES ('111', '', '0', 'member', '', 'member_setting', '?m=member&c=member_setting&a=manage', '', '1', 'admin', '127.0.0.1', '2015-05-18 18:11:18');
INSERT INTO `hc_log` VALUES ('112', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2015-05-18 18:11:19');
INSERT INTO `hc_log` VALUES ('113', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2015-05-18 18:11:20');
INSERT INTO `hc_log` VALUES ('114', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2015-05-18 18:11:25');
INSERT INTO `hc_log` VALUES ('115', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2015-05-18 18:11:25');
INSERT INTO `hc_log` VALUES ('116', '', '0', 'attachment', '', 'manage', '?m=attachment&c=manage&a=dir', '', '1', 'admin', '127.0.0.1', '2015-05-18 18:12:42');
INSERT INTO `hc_log` VALUES ('117', '', '0', 'attachment', '', 'manage', '?m=attachment&c=manage&a=dir', '', '1', 'admin', '127.0.0.1', '2015-05-18 18:12:42');
INSERT INTO `hc_log` VALUES ('118', '', '0', 'attachment', '', 'manage', '?m=attachment&c=manage&a=dir', '', '1', 'admin', '127.0.0.1', '2015-05-18 18:12:44');
INSERT INTO `hc_log` VALUES ('119', '', '0', 'attachment', '', 'manage', '?m=attachment&c=manage&a=dir', '', '1', 'admin', '127.0.0.1', '2015-05-18 18:12:44');
INSERT INTO `hc_log` VALUES ('120', '', '0', 'attachment', '', 'manage', '?m=attachment&c=manage&a=dir', '', '1', 'admin', '127.0.0.1', '2015-05-18 18:12:45');
INSERT INTO `hc_log` VALUES ('121', '', '0', 'attachment', '', 'manage', '?m=attachment&c=manage&a=dir', '', '1', 'admin', '127.0.0.1', '2015-05-18 18:12:45');
INSERT INTO `hc_log` VALUES ('122', '', '0', 'attachment', '', 'manage', '?m=attachment&c=manage&a=dir', '', '1', 'admin', '127.0.0.1', '2015-05-18 18:12:46');
INSERT INTO `hc_log` VALUES ('123', '', '0', 'attachment', '', 'manage', '?m=attachment&c=manage&a=dir', '', '1', 'admin', '127.0.0.1', '2015-05-18 18:12:46');
INSERT INTO `hc_log` VALUES ('124', '', '0', 'attachment', '', 'manage', '?m=attachment&c=manage&a=dir', '', '1', 'admin', '127.0.0.1', '2015-05-18 18:12:46');
INSERT INTO `hc_log` VALUES ('125', '', '0', 'attachment', '', 'manage', '?m=attachment&c=manage&a=dir', '', '1', 'admin', '127.0.0.1', '2015-05-18 18:12:47');
INSERT INTO `hc_log` VALUES ('126', '', '0', 'attachment', '', 'manage', '?m=attachment&c=manage&a=dir', '', '1', 'admin', '127.0.0.1', '2015-05-18 18:12:48');
INSERT INTO `hc_log` VALUES ('127', '', '0', 'attachment', '', 'manage', '?m=attachment&c=manage&a=dir', '', '1', 'admin', '127.0.0.1', '2015-05-18 18:12:48');
INSERT INTO `hc_log` VALUES ('128', '', '0', 'attachment', '', 'manage', '?m=attachment&c=manage&a=dir', '', '1', 'admin', '127.0.0.1', '2015-05-18 18:12:49');
INSERT INTO `hc_log` VALUES ('129', '', '0', 'attachment', '', 'manage', '?m=attachment&c=manage&a=dir', '', '1', 'admin', '127.0.0.1', '2015-05-18 18:12:49');
INSERT INTO `hc_log` VALUES ('130', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2015-05-18 18:13:18');
INSERT INTO `hc_log` VALUES ('131', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2015-05-18 18:13:38');
INSERT INTO `hc_log` VALUES ('132', '', '0', 'attachment', '', 'manage', '?m=attachment&c=manage&a=pullic_showthumbs', '', '1', 'admin', '127.0.0.1', '2015-05-18 18:14:08');
INSERT INTO `hc_log` VALUES ('133', '', '0', 'attachment', '', 'manage', '?m=attachment&c=manage&a=pullic_showthumbs', '', '1', 'admin', '127.0.0.1', '2015-05-18 18:14:27');
INSERT INTO `hc_log` VALUES ('134', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=pay_list', '', '1', 'admin', '127.0.0.1', '2015-05-18 18:16:49');
INSERT INTO `hc_log` VALUES ('135', '', '0', 'comment', '', 'comment_admin', '?m=comment&c=comment_admin&a=listinfo', '', '1', 'admin', '127.0.0.1', '2015-05-18 18:17:42');
INSERT INTO `hc_log` VALUES ('136', '', '0', 'content', '', 'sitemodel', '?m=content&c=sitemodel&a=add', '', '1', 'admin', '127.0.0.1', '2015-05-18 18:18:15');
INSERT INTO `hc_log` VALUES ('137', '', '0', 'content', '', 'sitemodel', '?m=content&c=sitemodel&a=add', '', '1', 'admin', '127.0.0.1', '2015-05-18 18:18:51');
INSERT INTO `hc_log` VALUES ('138', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=pay_list', '', '1', 'admin', '127.0.0.1', '2015-05-18 18:19:06');
INSERT INTO `hc_log` VALUES ('139', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2015-05-18 18:19:19');
INSERT INTO `hc_log` VALUES ('140', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2015-05-18 18:19:59');
INSERT INTO `hc_log` VALUES ('141', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2015-05-18 18:19:59');
INSERT INTO `hc_log` VALUES ('142', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2015-05-18 18:20:05');
INSERT INTO `hc_log` VALUES ('143', '', '0', 'content', '', 'content', '?m=content&c=content&a=add_othors', '', '1', 'admin', '127.0.0.1', '2015-05-18 18:20:09');
INSERT INTO `hc_log` VALUES ('144', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-05-18 18:20:25');
INSERT INTO `hc_log` VALUES ('145', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-05-18 18:20:25');
INSERT INTO `hc_log` VALUES ('146', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-05-18 18:20:48');
INSERT INTO `hc_log` VALUES ('147', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-05-18 18:20:48');
INSERT INTO `hc_log` VALUES ('148', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-05-18 18:21:27');
INSERT INTO `hc_log` VALUES ('149', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2015-05-18 18:21:38');
INSERT INTO `hc_log` VALUES ('150', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2015-05-18 18:22:12');
INSERT INTO `hc_log` VALUES ('151', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2015-05-18 18:22:33');
INSERT INTO `hc_log` VALUES ('152', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2015-05-18 18:22:51');
INSERT INTO `hc_log` VALUES ('153', '', '0', 'admin', '', 'setting', '?m=admin&c=setting&a=save', '', '1', 'admin', '127.0.0.1', '2015-05-18 18:43:01');
INSERT INTO `hc_log` VALUES ('154', '', '0', 'admin', '', 'setting', '?m=admin&c=setting&a=save', '', '1', 'admin', '127.0.0.1', '2015-05-18 18:43:19');
INSERT INTO `hc_log` VALUES ('155', '', '0', 'member', '', 'member_menu', '?m=member&c=member_menu&a=manage', '', '1', 'admin', '127.0.0.1', '2015-05-18 18:43:26');
INSERT INTO `hc_log` VALUES ('156', '', '0', 'admin', '', 'database', '?m=admin&c=database&a=export', '', '1', 'admin', '127.0.0.1', '2015-05-18 18:43:38');
INSERT INTO `hc_log` VALUES ('157', '', '0', 'admin', '', 'database', '?m=admin&c=database&a=export', '', '1', 'admin', '127.0.0.1', '2015-05-18 18:43:41');
INSERT INTO `hc_log` VALUES ('158', '', '0', 'admin', '', 'googlesitemap', '?m=admin&c=googlesitemap&a=set', '', '1', 'admin', '127.0.0.1', '2015-05-18 18:43:45');
INSERT INTO `hc_log` VALUES ('159', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=pay_list', '', '1', 'admin', '127.0.0.1', '2015-05-18 18:47:57');
INSERT INTO `hc_log` VALUES ('160', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=pay_list', '', '1', 'admin', '127.0.0.1', '2015-05-18 18:49:37');
INSERT INTO `hc_log` VALUES ('161', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=pay_list', '', '1', 'admin', '127.0.0.1', '2015-05-18 18:49:47');
INSERT INTO `hc_log` VALUES ('162', '', '0', 'wap', '', 'wap_admin', '?m=wap&c=wap_admin&a=type_manage', '', '1', 'admin', '127.0.0.1', '2015-05-18 18:49:52');
INSERT INTO `hc_log` VALUES ('163', '', '0', 'wap', '', 'wap_admin', '?m=wap&c=wap_admin&a=type_manage', '', '1', 'admin', '127.0.0.1', '2015-05-18 18:49:52');
INSERT INTO `hc_log` VALUES ('164', '', '0', 'content', '', 'type_manage', '?m=content&c=type_manage&a=add', '', '1', 'admin', '127.0.0.1', '2015-05-18 18:50:37');
INSERT INTO `hc_log` VALUES ('165', '', '0', 'content', '', 'type_manage', '?m=content&c=type_manage&a=add', '', '1', 'admin', '127.0.0.1', '2015-05-18 18:50:49');
INSERT INTO `hc_log` VALUES ('166', '', '0', 'mood', '', 'mood_admin', '?m=mood&c=mood_admin&a=setting', '', '1', 'admin', '127.0.0.1', '2015-05-18 18:58:53');
INSERT INTO `hc_log` VALUES ('167', '', '0', 'mood', '', 'mood_admin', '?m=mood&c=mood_admin&a=setting', '', '1', 'admin', '127.0.0.1', '2015-05-18 18:58:53');
INSERT INTO `hc_log` VALUES ('168', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=pay_list', '', '1', 'admin', '127.0.0.1', '2015-05-18 19:02:02');
INSERT INTO `hc_log` VALUES ('169', '', '0', 'mood', '', 'mood_admin', '?m=mood&c=mood_admin&a=setting', '', '1', 'admin', '127.0.0.1', '2015-05-18 19:05:56');
INSERT INTO `hc_log` VALUES ('170', '', '0', 'mood', '', 'mood_admin', '?m=mood&c=mood_admin&a=setting', '', '1', 'admin', '127.0.0.1', '2015-05-18 19:05:56');
INSERT INTO `hc_log` VALUES ('171', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2015-05-25 11:08:06');
INSERT INTO `hc_log` VALUES ('172', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2015-05-25 11:08:17');
INSERT INTO `hc_log` VALUES ('173', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2015-05-25 11:09:25');
INSERT INTO `hc_log` VALUES ('174', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2015-05-25 11:09:26');
INSERT INTO `hc_log` VALUES ('175', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2015-05-25 11:09:40');
INSERT INTO `hc_log` VALUES ('176', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2015-05-25 11:10:30');
INSERT INTO `hc_log` VALUES ('177', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2015-05-25 11:10:30');
INSERT INTO `hc_log` VALUES ('178', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2015-05-27 15:11:38');
INSERT INTO `hc_log` VALUES ('179', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2015-05-27 15:11:44');
INSERT INTO `hc_log` VALUES ('180', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=delete', '', '1', 'admin', '127.0.0.1', '2015-05-27 15:14:23');
INSERT INTO `hc_log` VALUES ('181', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=delete', '', '1', 'admin', '127.0.0.1', '2015-05-27 15:14:27');
INSERT INTO `hc_log` VALUES ('182', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=delete', '', '1', 'admin', '127.0.0.1', '2015-05-27 15:14:32');
INSERT INTO `hc_log` VALUES ('183', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=delete', '', '1', 'admin', '127.0.0.1', '2015-05-27 15:14:36');
INSERT INTO `hc_log` VALUES ('184', '', '0', 'collection', '', 'node', '?m=collection&c=node&a=manage', '', '1', 'admin', '127.0.0.1', '2015-05-27 15:14:48');
INSERT INTO `hc_log` VALUES ('185', '', '0', 'comment', '', 'comment_admin', '?m=comment&c=comment_admin&a=listinfo', '', '1', 'admin', '127.0.0.1', '2015-05-27 15:14:49');
INSERT INTO `hc_log` VALUES ('186', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'admin', '127.0.0.1', '2015-05-27 15:14:53');
INSERT INTO `hc_log` VALUES ('187', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '127.0.0.1', '2015-05-27 15:14:56');
INSERT INTO `hc_log` VALUES ('188', '', '0', 'content', '', 'content', '?m=content&c=content&a=clear_data', '', '1', 'admin', '127.0.0.1', '2015-05-27 15:14:57');
INSERT INTO `hc_log` VALUES ('189', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-05-27 15:15:09');
INSERT INTO `hc_log` VALUES ('190', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-05-27 15:15:09');
INSERT INTO `hc_log` VALUES ('191', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-05-27 15:16:25');
INSERT INTO `hc_log` VALUES ('192', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-05-27 15:17:25');
INSERT INTO `hc_log` VALUES ('193', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-05-27 15:17:25');
INSERT INTO `hc_log` VALUES ('194', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-05-27 15:18:10');
INSERT INTO `hc_log` VALUES ('195', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-05-27 15:18:29');
INSERT INTO `hc_log` VALUES ('196', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-05-27 15:18:29');
INSERT INTO `hc_log` VALUES ('197', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-05-27 15:19:11');
INSERT INTO `hc_log` VALUES ('198', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-05-27 15:19:13');
INSERT INTO `hc_log` VALUES ('199', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-05-27 15:19:13');
INSERT INTO `hc_log` VALUES ('200', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-05-27 15:20:46');
INSERT INTO `hc_log` VALUES ('201', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-05-27 15:20:48');
INSERT INTO `hc_log` VALUES ('202', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-05-27 15:20:48');
INSERT INTO `hc_log` VALUES ('203', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '127.0.0.1', '2015-05-27 15:20:53');
INSERT INTO `hc_log` VALUES ('204', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'admin', '127.0.0.1', '2015-05-27 15:20:55');
INSERT INTO `hc_log` VALUES ('205', '', '0', 'content', '', 'content', '?m=content&c=content&a=clear_data', '', '1', 'admin', '127.0.0.1', '2015-05-27 15:20:57');
INSERT INTO `hc_log` VALUES ('206', '', '0', 'content', '', 'content', '?m=content&c=content&a=clear_data', '', '1', 'admin', '127.0.0.1', '2015-05-27 15:21:03');
INSERT INTO `hc_log` VALUES ('207', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '127.0.0.1', '2015-05-27 15:21:06');
INSERT INTO `hc_log` VALUES ('208', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '127.0.0.1', '2015-05-27 15:21:10');
INSERT INTO `hc_log` VALUES ('209', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '127.0.0.1', '2015-05-27 15:21:11');
INSERT INTO `hc_log` VALUES ('210', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '127.0.0.1', '2015-05-27 15:21:11');
INSERT INTO `hc_log` VALUES ('211', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '127.0.0.1', '2015-05-27 15:21:12');
INSERT INTO `hc_log` VALUES ('212', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '127.0.0.1', '2015-05-27 15:21:12');
INSERT INTO `hc_log` VALUES ('213', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '127.0.0.1', '2015-05-27 15:21:12');
INSERT INTO `hc_log` VALUES ('214', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '127.0.0.1', '2015-05-27 15:21:12');
INSERT INTO `hc_log` VALUES ('215', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-05-27 15:22:29');
INSERT INTO `hc_log` VALUES ('216', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-05-27 15:22:29');
INSERT INTO `hc_log` VALUES ('217', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '127.0.0.1', '2015-06-10 15:43:32');
INSERT INTO `hc_log` VALUES ('218', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '127.0.0.1', '2015-06-10 15:43:38');
INSERT INTO `hc_log` VALUES ('219', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-10 15:57:29');
INSERT INTO `hc_log` VALUES ('220', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-10 15:57:29');
INSERT INTO `hc_log` VALUES ('221', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-10 15:57:53');
INSERT INTO `hc_log` VALUES ('222', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-10 15:57:53');
INSERT INTO `hc_log` VALUES ('223', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-10 15:58:22');
INSERT INTO `hc_log` VALUES ('224', '', '0', 'collection', '', 'node', '?m=collection&c=node&a=manage', '', '1', 'admin', '127.0.0.1', '2015-06-10 15:59:34');
INSERT INTO `hc_log` VALUES ('225', '', '0', 'comment', '', 'comment_admin', '?m=comment&c=comment_admin&a=listinfo', '', '1', 'admin', '127.0.0.1', '2015-06-10 15:59:35');
INSERT INTO `hc_log` VALUES ('226', '', '0', 'collection', '', 'node', '?m=collection&c=node&a=manage', '', '1', 'admin', '127.0.0.1', '2015-06-10 15:59:35');
INSERT INTO `hc_log` VALUES ('227', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-10 15:59:51');
INSERT INTO `hc_log` VALUES ('228', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-10 15:59:51');
INSERT INTO `hc_log` VALUES ('229', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-10 16:00:21');
INSERT INTO `hc_log` VALUES ('230', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=listorder', '', '1', 'admin', '127.0.0.1', '2015-06-10 16:00:40');
INSERT INTO `hc_log` VALUES ('231', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-10 16:01:23');
INSERT INTO `hc_log` VALUES ('232', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-10 16:01:24');
INSERT INTO `hc_log` VALUES ('233', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-10 16:01:33');
INSERT INTO `hc_log` VALUES ('234', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-10 16:01:33');
INSERT INTO `hc_log` VALUES ('235', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-10 16:02:59');
INSERT INTO `hc_log` VALUES ('236', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-10 16:06:56');
INSERT INTO `hc_log` VALUES ('237', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-10 16:06:56');
INSERT INTO `hc_log` VALUES ('238', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-10 16:08:47');
INSERT INTO `hc_log` VALUES ('239', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-10 16:08:55');
INSERT INTO `hc_log` VALUES ('240', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-10 16:08:55');
INSERT INTO `hc_log` VALUES ('241', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-10 16:10:14');
INSERT INTO `hc_log` VALUES ('242', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-10 16:32:34');
INSERT INTO `hc_log` VALUES ('243', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-10 16:32:34');
INSERT INTO `hc_log` VALUES ('244', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-10 16:46:44');
INSERT INTO `hc_log` VALUES ('245', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-10 16:46:46');
INSERT INTO `hc_log` VALUES ('246', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-10 16:46:46');
INSERT INTO `hc_log` VALUES ('247', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-10 16:47:41');
INSERT INTO `hc_log` VALUES ('248', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-10 16:48:56');
INSERT INTO `hc_log` VALUES ('249', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-10 16:48:56');
INSERT INTO `hc_log` VALUES ('250', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-10 16:49:27');
INSERT INTO `hc_log` VALUES ('251', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-10 16:49:28');
INSERT INTO `hc_log` VALUES ('252', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-10 16:49:28');
INSERT INTO `hc_log` VALUES ('253', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-10 16:50:28');
INSERT INTO `hc_log` VALUES ('254', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-10 16:50:29');
INSERT INTO `hc_log` VALUES ('255', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-10 16:50:30');
INSERT INTO `hc_log` VALUES ('256', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-10 16:52:05');
INSERT INTO `hc_log` VALUES ('257', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-10 16:52:06');
INSERT INTO `hc_log` VALUES ('258', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-10 16:52:06');
INSERT INTO `hc_log` VALUES ('259', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-10 16:52:31');
INSERT INTO `hc_log` VALUES ('260', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-10 16:53:03');
INSERT INTO `hc_log` VALUES ('261', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-10 16:53:03');
INSERT INTO `hc_log` VALUES ('262', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-10 16:53:09');
INSERT INTO `hc_log` VALUES ('263', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-10 16:53:17');
INSERT INTO `hc_log` VALUES ('264', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-10 16:53:17');
INSERT INTO `hc_log` VALUES ('265', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-10 16:53:21');
INSERT INTO `hc_log` VALUES ('266', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-10 16:53:25');
INSERT INTO `hc_log` VALUES ('267', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-10 16:53:25');
INSERT INTO `hc_log` VALUES ('268', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-10 16:53:28');
INSERT INTO `hc_log` VALUES ('269', '', '0', 'collection', '', 'node', '?m=collection&c=node&a=manage', '', '1', 'admin', '127.0.0.1', '2015-06-10 16:53:54');
INSERT INTO `hc_log` VALUES ('270', '', '0', 'comment', '', 'comment_admin', '?m=comment&c=comment_admin&a=listinfo', '', '1', 'admin', '127.0.0.1', '2015-06-10 16:53:55');
INSERT INTO `hc_log` VALUES ('271', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '127.0.0.1', '2015-06-10 16:53:56');
INSERT INTO `hc_log` VALUES ('272', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '127.0.0.1', '2015-06-10 16:54:01');
INSERT INTO `hc_log` VALUES ('273', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-10 16:54:17');
INSERT INTO `hc_log` VALUES ('274', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-10 16:54:17');
INSERT INTO `hc_log` VALUES ('275', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-10 16:54:21');
INSERT INTO `hc_log` VALUES ('276', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-10 16:54:41');
INSERT INTO `hc_log` VALUES ('277', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-10 16:54:41');
INSERT INTO `hc_log` VALUES ('278', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-10 16:54:51');
INSERT INTO `hc_log` VALUES ('279', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-10 16:54:51');
INSERT INTO `hc_log` VALUES ('280', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-10 16:54:55');
INSERT INTO `hc_log` VALUES ('281', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=batch_edit', '', '1', 'admin', '127.0.0.1', '2015-06-10 16:55:04');
INSERT INTO `hc_log` VALUES ('282', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=batch_edit', '', '1', 'admin', '127.0.0.1', '2015-06-10 16:55:04');
INSERT INTO `hc_log` VALUES ('283', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=batch_edit', '', '1', 'admin', '127.0.0.1', '2015-06-10 16:55:36');
INSERT INTO `hc_log` VALUES ('284', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=batch_edit', '', '1', 'admin', '127.0.0.1', '2015-06-10 16:56:22');
INSERT INTO `hc_log` VALUES ('285', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2015-06-10 17:17:38');
INSERT INTO `hc_log` VALUES ('286', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2015-06-10 17:17:44');
INSERT INTO `hc_log` VALUES ('287', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=batch_edit', '', '1', 'admin', '127.0.0.1', '2015-06-10 17:17:54');
INSERT INTO `hc_log` VALUES ('288', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=batch_edit', '', '1', 'admin', '127.0.0.1', '2015-06-10 17:17:55');
INSERT INTO `hc_log` VALUES ('289', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=batch_edit', '', '1', 'admin', '127.0.0.1', '2015-06-10 17:18:13');
INSERT INTO `hc_log` VALUES ('290', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=batch_edit', '', '1', 'admin', '127.0.0.1', '2015-06-10 17:18:29');
INSERT INTO `hc_log` VALUES ('291', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-10 17:26:32');
INSERT INTO `hc_log` VALUES ('292', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-10 17:26:33');
INSERT INTO `hc_log` VALUES ('293', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2015-06-11 08:46:56');
INSERT INTO `hc_log` VALUES ('294', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2015-06-11 08:47:01');
INSERT INTO `hc_log` VALUES ('295', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2015-06-11 10:55:26');
INSERT INTO `hc_log` VALUES ('296', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2015-06-11 10:55:32');
INSERT INTO `hc_log` VALUES ('297', '', '0', 'poster', '', 'space', '?m=poster&c=space&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-11 10:56:19');
INSERT INTO `hc_log` VALUES ('298', '', '0', 'poster', '', 'space', '?m=poster&c=space&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-11 10:56:55');
INSERT INTO `hc_log` VALUES ('299', '', '0', 'poster', '', 'poster', '?m=poster&c=poster&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-11 10:57:00');
INSERT INTO `hc_log` VALUES ('300', '', '0', 'poster', '', 'poster', '?m=poster&c=poster&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-11 10:57:00');
INSERT INTO `hc_log` VALUES ('301', '', '0', 'poster', '', 'poster', '?m=poster&c=poster&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-11 11:00:05');
INSERT INTO `hc_log` VALUES ('302', '', '0', 'poster', '', 'poster', '?m=poster&c=poster&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-11 11:00:06');
INSERT INTO `hc_log` VALUES ('303', '', '0', 'poster', '', 'poster', '?m=poster&c=poster&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-11 11:00:42');
INSERT INTO `hc_log` VALUES ('304', '', '0', 'poster', '', 'poster', '?m=poster&c=poster&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-11 11:01:05');
INSERT INTO `hc_log` VALUES ('305', '', '0', 'poster', '', 'poster', '?m=poster&c=poster&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-11 11:01:05');
INSERT INTO `hc_log` VALUES ('306', '', '0', 'poster', '', 'poster', '?m=poster&c=poster&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-11 11:01:26');
INSERT INTO `hc_log` VALUES ('307', '', '0', 'collection', '', 'node', '?m=collection&c=node&a=manage', '', '1', 'admin', '127.0.0.1', '2015-06-11 11:11:15');
INSERT INTO `hc_log` VALUES ('308', '', '0', 'comment', '', 'comment_admin', '?m=comment&c=comment_admin&a=listinfo', '', '1', 'admin', '127.0.0.1', '2015-06-11 11:11:16');
INSERT INTO `hc_log` VALUES ('309', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '127.0.0.1', '2015-06-11 11:11:17');
INSERT INTO `hc_log` VALUES ('310', '', '0', 'content', '', 'content', '?m=content&c=content&a=clear_data', '', '1', 'admin', '127.0.0.1', '2015-06-11 11:11:20');
INSERT INTO `hc_log` VALUES ('311', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-11 11:11:51');
INSERT INTO `hc_log` VALUES ('312', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-11 11:11:51');
INSERT INTO `hc_log` VALUES ('313', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-11 11:12:36');
INSERT INTO `hc_log` VALUES ('314', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-11 11:12:44');
INSERT INTO `hc_log` VALUES ('315', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-11 11:12:44');
INSERT INTO `hc_log` VALUES ('316', '', '0', 'poster', '', 'poster', '?m=poster&c=poster&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-11 11:13:59');
INSERT INTO `hc_log` VALUES ('317', '', '0', 'poster', '', 'poster', '?m=poster&c=poster&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-11 11:13:59');
INSERT INTO `hc_log` VALUES ('318', '', '0', 'poster', '', 'poster', '?m=poster&c=poster&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-11 11:24:57');
INSERT INTO `hc_log` VALUES ('319', '', '0', 'poster', '', 'poster', '?m=poster&c=poster&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-11 11:24:58');
INSERT INTO `hc_log` VALUES ('320', '', '0', 'poster', '', 'poster', '?m=poster&c=poster&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-11 11:25:34');
INSERT INTO `hc_log` VALUES ('321', '', '0', 'poster', '', 'poster', '?m=poster&c=poster&a=delete', '', '1', 'admin', '127.0.0.1', '2015-06-11 15:31:24');
INSERT INTO `hc_log` VALUES ('322', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-11 16:04:18');
INSERT INTO `hc_log` VALUES ('323', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-11 16:08:04');
INSERT INTO `hc_log` VALUES ('324', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-11 16:08:49');
INSERT INTO `hc_log` VALUES ('325', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-11 16:09:09');
INSERT INTO `hc_log` VALUES ('326', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-11 16:09:20');
INSERT INTO `hc_log` VALUES ('327', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-11 16:09:28');
INSERT INTO `hc_log` VALUES ('328', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-11 16:09:50');
INSERT INTO `hc_log` VALUES ('329', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-11 16:10:04');
INSERT INTO `hc_log` VALUES ('330', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-11 16:10:57');
INSERT INTO `hc_log` VALUES ('331', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-11 16:11:19');
INSERT INTO `hc_log` VALUES ('332', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-11 16:11:23');
INSERT INTO `hc_log` VALUES ('333', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-11 16:11:49');
INSERT INTO `hc_log` VALUES ('334', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-11 16:12:23');
INSERT INTO `hc_log` VALUES ('335', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-11 16:12:53');
INSERT INTO `hc_log` VALUES ('336', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-11 16:12:57');
INSERT INTO `hc_log` VALUES ('337', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-11 16:12:58');
INSERT INTO `hc_log` VALUES ('338', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-11 16:19:38');
INSERT INTO `hc_log` VALUES ('339', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-11 16:20:18');
INSERT INTO `hc_log` VALUES ('340', '', '0', 'content', '', 'content', '?m=content&c=content&a=remove', '', '1', 'admin', '127.0.0.1', '2015-06-11 16:31:15');
INSERT INTO `hc_log` VALUES ('341', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-11 16:33:22');
INSERT INTO `hc_log` VALUES ('342', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-11 16:33:44');
INSERT INTO `hc_log` VALUES ('343', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-11 16:34:53');
INSERT INTO `hc_log` VALUES ('344', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-11 16:35:10');
INSERT INTO `hc_log` VALUES ('345', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-11 16:35:30');
INSERT INTO `hc_log` VALUES ('346', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-11 16:38:50');
INSERT INTO `hc_log` VALUES ('347', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-11 16:39:08');
INSERT INTO `hc_log` VALUES ('348', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-11 16:42:28');
INSERT INTO `hc_log` VALUES ('349', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-11 17:02:22');
INSERT INTO `hc_log` VALUES ('350', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-11 17:05:46');
INSERT INTO `hc_log` VALUES ('351', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-11 17:05:58');
INSERT INTO `hc_log` VALUES ('352', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-11 17:06:03');
INSERT INTO `hc_log` VALUES ('353', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-11 17:06:14');
INSERT INTO `hc_log` VALUES ('354', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-11 17:07:05');
INSERT INTO `hc_log` VALUES ('355', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2015-06-12 08:58:23');
INSERT INTO `hc_log` VALUES ('356', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2015-06-12 08:58:26');
INSERT INTO `hc_log` VALUES ('357', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-12 08:58:39');
INSERT INTO `hc_log` VALUES ('358', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-12 08:58:40');
INSERT INTO `hc_log` VALUES ('359', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-12 09:06:50');
INSERT INTO `hc_log` VALUES ('360', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-12 09:07:17');
INSERT INTO `hc_log` VALUES ('361', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-12 09:07:17');
INSERT INTO `hc_log` VALUES ('362', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-12 09:08:28');
INSERT INTO `hc_log` VALUES ('363', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-12 09:08:30');
INSERT INTO `hc_log` VALUES ('364', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-12 09:08:30');
INSERT INTO `hc_log` VALUES ('365', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-12 09:09:20');
INSERT INTO `hc_log` VALUES ('366', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-12 09:09:23');
INSERT INTO `hc_log` VALUES ('367', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-12 09:09:23');
INSERT INTO `hc_log` VALUES ('368', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-12 09:09:47');
INSERT INTO `hc_log` VALUES ('369', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-12 09:09:47');
INSERT INTO `hc_log` VALUES ('370', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-12 09:10:49');
INSERT INTO `hc_log` VALUES ('371', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-12 09:10:51');
INSERT INTO `hc_log` VALUES ('372', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-12 09:10:52');
INSERT INTO `hc_log` VALUES ('373', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-12 09:14:44');
INSERT INTO `hc_log` VALUES ('374', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-12 09:14:46');
INSERT INTO `hc_log` VALUES ('375', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-12 09:14:46');
INSERT INTO `hc_log` VALUES ('376', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-12 09:15:02');
INSERT INTO `hc_log` VALUES ('377', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-12 09:15:04');
INSERT INTO `hc_log` VALUES ('378', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-12 09:15:04');
INSERT INTO `hc_log` VALUES ('379', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-12 09:15:22');
INSERT INTO `hc_log` VALUES ('380', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-12 09:15:24');
INSERT INTO `hc_log` VALUES ('381', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-12 09:15:25');
INSERT INTO `hc_log` VALUES ('382', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-12 09:15:38');
INSERT INTO `hc_log` VALUES ('383', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-12 09:15:40');
INSERT INTO `hc_log` VALUES ('384', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-12 09:15:40');
INSERT INTO `hc_log` VALUES ('385', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-12 09:15:54');
INSERT INTO `hc_log` VALUES ('386', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-12 09:15:56');
INSERT INTO `hc_log` VALUES ('387', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-12 09:15:57');
INSERT INTO `hc_log` VALUES ('388', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-12 09:42:03');
INSERT INTO `hc_log` VALUES ('389', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-12 09:42:05');
INSERT INTO `hc_log` VALUES ('390', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-12 09:42:06');
INSERT INTO `hc_log` VALUES ('391', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-12 09:42:31');
INSERT INTO `hc_log` VALUES ('392', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-12 09:42:32');
INSERT INTO `hc_log` VALUES ('393', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-12 09:42:33');
INSERT INTO `hc_log` VALUES ('394', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-12 09:42:48');
INSERT INTO `hc_log` VALUES ('395', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-12 09:42:49');
INSERT INTO `hc_log` VALUES ('396', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-12 09:42:50');
INSERT INTO `hc_log` VALUES ('397', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-12 09:43:12');
INSERT INTO `hc_log` VALUES ('398', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-12 09:43:13');
INSERT INTO `hc_log` VALUES ('399', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-12 09:43:14');
INSERT INTO `hc_log` VALUES ('400', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-12 09:43:25');
INSERT INTO `hc_log` VALUES ('401', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-12 09:43:26');
INSERT INTO `hc_log` VALUES ('402', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-12 09:43:27');
INSERT INTO `hc_log` VALUES ('403', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-12 09:43:41');
INSERT INTO `hc_log` VALUES ('404', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-12 09:43:42');
INSERT INTO `hc_log` VALUES ('405', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-12 09:43:42');
INSERT INTO `hc_log` VALUES ('406', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-12 09:43:48');
INSERT INTO `hc_log` VALUES ('407', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-12 09:43:48');
INSERT INTO `hc_log` VALUES ('408', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-12 09:44:46');
INSERT INTO `hc_log` VALUES ('409', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-12 09:44:57');
INSERT INTO `hc_log` VALUES ('410', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-12 09:44:58');
INSERT INTO `hc_log` VALUES ('411', '', '0', 'link', '', 'link', '?m=link&c=link&a=list_type', '', '1', 'admin', '127.0.0.1', '2015-06-12 09:51:28');
INSERT INTO `hc_log` VALUES ('412', '', '0', 'link', '', 'link', '?m=link&c=link&a=list_type', '', '1', 'admin', '127.0.0.1', '2015-06-12 09:51:28');
INSERT INTO `hc_log` VALUES ('413', '', '0', 'link', '', 'link', '?m=link&c=link&a=add_type', '', '1', 'admin', '127.0.0.1', '2015-06-12 09:51:52');
INSERT INTO `hc_log` VALUES ('414', '', '0', 'link', '', 'link', '?m=link&c=link&a=add_type', '', '1', 'admin', '127.0.0.1', '2015-06-12 09:51:52');
INSERT INTO `hc_log` VALUES ('415', '', '0', 'link', '', 'link', '?m=link&c=link&a=add_type', '', '1', 'admin', '127.0.0.1', '2015-06-12 09:52:16');
INSERT INTO `hc_log` VALUES ('416', '', '0', 'link', '', 'link', '?m=link&c=link&a=add_type', '', '1', 'admin', '127.0.0.1', '2015-06-12 09:52:17');
INSERT INTO `hc_log` VALUES ('417', '', '0', 'link', '', 'link', '?m=link&c=link&a=add_type', '', '1', 'admin', '127.0.0.1', '2015-06-12 09:52:17');
INSERT INTO `hc_log` VALUES ('418', '', '0', 'link', '', 'link', '?m=link&c=link&a=delete', '', '1', 'admin', '127.0.0.1', '2015-06-12 09:52:23');
INSERT INTO `hc_log` VALUES ('419', '', '0', 'link', '', 'link', '?m=link&c=link&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-12 09:52:27');
INSERT INTO `hc_log` VALUES ('420', '', '0', 'link', '', 'link', '?m=link&c=link&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-12 09:53:10');
INSERT INTO `hc_log` VALUES ('421', '', '0', 'link', '', 'link', '?m=link&c=link&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-12 09:53:13');
INSERT INTO `hc_log` VALUES ('422', '', '0', 'link', '', 'link', '?m=link&c=link&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-12 09:53:34');
INSERT INTO `hc_log` VALUES ('423', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-12 09:54:02');
INSERT INTO `hc_log` VALUES ('424', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-12 09:54:02');
INSERT INTO `hc_log` VALUES ('425', '', '0', 'link', '', 'link', '?m=link&c=link&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-12 09:54:38');
INSERT INTO `hc_log` VALUES ('426', '', '0', 'link', '', 'link', '?m=link&c=link&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-12 09:54:52');
INSERT INTO `hc_log` VALUES ('427', '', '0', 'link', '', 'link', '?m=link&c=link&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-12 09:54:54');
INSERT INTO `hc_log` VALUES ('428', '', '0', 'link', '', 'link', '?m=link&c=link&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-12 09:55:08');
INSERT INTO `hc_log` VALUES ('429', '', '0', 'link', '', 'link', '?m=link&c=link&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-12 09:55:17');
INSERT INTO `hc_log` VALUES ('430', '', '0', 'link', '', 'link', '?m=link&c=link&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-12 09:55:29');
INSERT INTO `hc_log` VALUES ('431', '', '0', 'link', '', 'link', '?m=link&c=link&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-12 09:55:30');
INSERT INTO `hc_log` VALUES ('432', '', '0', 'link', '', 'link', '?m=link&c=link&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-12 09:55:48');
INSERT INTO `hc_log` VALUES ('433', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-12 10:01:33');
INSERT INTO `hc_log` VALUES ('434', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-12 10:01:34');
INSERT INTO `hc_log` VALUES ('435', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-12 10:02:30');
INSERT INTO `hc_log` VALUES ('436', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-12 10:02:31');
INSERT INTO `hc_log` VALUES ('437', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-12 10:05:39');
INSERT INTO `hc_log` VALUES ('438', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=delete', '', '1', 'admin', '127.0.0.1', '2015-06-12 10:06:50');
INSERT INTO `hc_log` VALUES ('439', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-12 10:07:44');
INSERT INTO `hc_log` VALUES ('440', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-12 10:07:44');
INSERT INTO `hc_log` VALUES ('441', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-12 10:09:30');
INSERT INTO `hc_log` VALUES ('442', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-12 10:09:30');
INSERT INTO `hc_log` VALUES ('443', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-12 10:12:13');
INSERT INTO `hc_log` VALUES ('444', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-12 10:12:13');
INSERT INTO `hc_log` VALUES ('445', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-12 10:18:22');
INSERT INTO `hc_log` VALUES ('446', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-12 10:18:22');
INSERT INTO `hc_log` VALUES ('447', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-12 10:19:18');
INSERT INTO `hc_log` VALUES ('448', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-12 10:19:18');
INSERT INTO `hc_log` VALUES ('449', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-12 10:20:57');
INSERT INTO `hc_log` VALUES ('450', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-12 10:20:57');
INSERT INTO `hc_log` VALUES ('451', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-12 10:21:04');
INSERT INTO `hc_log` VALUES ('452', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-12 10:21:04');
INSERT INTO `hc_log` VALUES ('453', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-12 10:22:41');
INSERT INTO `hc_log` VALUES ('454', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-12 10:22:41');
INSERT INTO `hc_log` VALUES ('455', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-12 10:24:18');
INSERT INTO `hc_log` VALUES ('456', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-12 10:24:18');
INSERT INTO `hc_log` VALUES ('457', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-12 10:24:45');
INSERT INTO `hc_log` VALUES ('458', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-12 10:24:50');
INSERT INTO `hc_log` VALUES ('459', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-12 10:24:50');
INSERT INTO `hc_log` VALUES ('460', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-12 10:24:57');
INSERT INTO `hc_log` VALUES ('461', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=batch_edit', '', '1', 'admin', '127.0.0.1', '2015-06-12 10:45:33');
INSERT INTO `hc_log` VALUES ('462', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=batch_edit', '', '1', 'admin', '127.0.0.1', '2015-06-12 10:45:33');
INSERT INTO `hc_log` VALUES ('463', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=batch_edit', '', '1', 'admin', '127.0.0.1', '2015-06-12 10:45:49');
INSERT INTO `hc_log` VALUES ('464', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=batch_edit', '', '1', 'admin', '127.0.0.1', '2015-06-12 10:45:52');
INSERT INTO `hc_log` VALUES ('465', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=batch_edit', '', '1', 'admin', '127.0.0.1', '2015-06-12 10:46:27');
INSERT INTO `hc_log` VALUES ('466', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=batch_edit', '', '1', 'admin', '127.0.0.1', '2015-06-12 10:46:29');
INSERT INTO `hc_log` VALUES ('467', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=batch_edit', '', '1', 'admin', '127.0.0.1', '2015-06-12 10:46:40');
INSERT INTO `hc_log` VALUES ('468', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=batch_edit', '', '1', 'admin', '127.0.0.1', '2015-06-12 10:46:42');
INSERT INTO `hc_log` VALUES ('469', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=batch_edit', '', '1', 'admin', '127.0.0.1', '2015-06-12 11:14:06');
INSERT INTO `hc_log` VALUES ('470', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=batch_edit', '', '1', 'admin', '127.0.0.1', '2015-06-12 11:14:09');
INSERT INTO `hc_log` VALUES ('471', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-12 11:14:53');
INSERT INTO `hc_log` VALUES ('472', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-12 11:14:53');
INSERT INTO `hc_log` VALUES ('473', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-12 11:15:53');
INSERT INTO `hc_log` VALUES ('474', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-12 11:15:53');
INSERT INTO `hc_log` VALUES ('475', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-12 11:16:03');
INSERT INTO `hc_log` VALUES ('476', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-12 11:16:03');
INSERT INTO `hc_log` VALUES ('477', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-12 11:16:15');
INSERT INTO `hc_log` VALUES ('478', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-12 11:16:16');
INSERT INTO `hc_log` VALUES ('479', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-12 11:19:20');
INSERT INTO `hc_log` VALUES ('480', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-12 11:19:21');
INSERT INTO `hc_log` VALUES ('481', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-12 11:29:40');
INSERT INTO `hc_log` VALUES ('482', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-12 11:29:42');
INSERT INTO `hc_log` VALUES ('483', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-12 14:00:04');
INSERT INTO `hc_log` VALUES ('484', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-12 14:00:04');
INSERT INTO `hc_log` VALUES ('485', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-12 14:00:13');
INSERT INTO `hc_log` VALUES ('486', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-12 14:00:13');
INSERT INTO `hc_log` VALUES ('487', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-12 14:01:49');
INSERT INTO `hc_log` VALUES ('488', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-12 14:02:01');
INSERT INTO `hc_log` VALUES ('489', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-12 14:02:01');
INSERT INTO `hc_log` VALUES ('490', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-12 14:02:03');
INSERT INTO `hc_log` VALUES ('491', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-12 14:03:10');
INSERT INTO `hc_log` VALUES ('492', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-12 14:03:12');
INSERT INTO `hc_log` VALUES ('493', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-12 14:03:19');
INSERT INTO `hc_log` VALUES ('494', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-12 14:14:15');
INSERT INTO `hc_log` VALUES ('495', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-12 14:14:16');
INSERT INTO `hc_log` VALUES ('496', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-12 14:14:26');
INSERT INTO `hc_log` VALUES ('497', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-12 14:14:35');
INSERT INTO `hc_log` VALUES ('498', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-12 14:14:35');
INSERT INTO `hc_log` VALUES ('499', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-12 15:29:00');
INSERT INTO `hc_log` VALUES ('500', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-12 15:29:00');
INSERT INTO `hc_log` VALUES ('501', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-12 15:29:04');
INSERT INTO `hc_log` VALUES ('502', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-12 15:29:15');
INSERT INTO `hc_log` VALUES ('503', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-12 15:29:15');
INSERT INTO `hc_log` VALUES ('504', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-12 15:29:23');
INSERT INTO `hc_log` VALUES ('505', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-12 15:29:30');
INSERT INTO `hc_log` VALUES ('506', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-12 15:29:30');
INSERT INTO `hc_log` VALUES ('507', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-12 15:29:33');
INSERT INTO `hc_log` VALUES ('508', '', '0', 'link', '', 'link', '?m=link&c=link&a=list_type', '', '1', 'admin', '127.0.0.1', '2015-06-12 15:32:48');
INSERT INTO `hc_log` VALUES ('509', '', '0', 'link', '', 'link', '?m=link&c=link&a=list_type', '', '1', 'admin', '127.0.0.1', '2015-06-12 15:32:48');
INSERT INTO `hc_log` VALUES ('510', '', '0', 'link', '', 'link', '?m=link&c=link&a=list_type', '', '1', 'admin', '127.0.0.1', '2015-06-12 15:36:16');
INSERT INTO `hc_log` VALUES ('511', '', '0', 'link', '', 'link', '?m=link&c=link&a=list_type', '', '1', 'admin', '127.0.0.1', '2015-06-12 15:36:16');
INSERT INTO `hc_log` VALUES ('512', '', '0', 'link', '', 'link', '?m=link&c=link&a=list_type', '', '1', 'admin', '127.0.0.1', '2015-06-12 15:36:31');
INSERT INTO `hc_log` VALUES ('513', '', '0', 'link', '', 'link', '?m=link&c=link&a=edit_type', '', '1', 'admin', '127.0.0.1', '2015-06-12 15:36:31');
INSERT INTO `hc_log` VALUES ('514', '', '0', 'link', '', 'link', '?m=link&c=link&a=edit_type', '', '1', 'admin', '127.0.0.1', '2015-06-12 15:36:35');
INSERT INTO `hc_log` VALUES ('515', '', '0', 'link', '', 'link', '?m=link&c=link&a=list_type', '', '1', 'admin', '127.0.0.1', '2015-06-12 15:36:35');
INSERT INTO `hc_log` VALUES ('516', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-12 15:47:54');
INSERT INTO `hc_log` VALUES ('517', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-12 15:47:54');
INSERT INTO `hc_log` VALUES ('518', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-12 15:49:12');
INSERT INTO `hc_log` VALUES ('519', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-12 15:49:33');
INSERT INTO `hc_log` VALUES ('520', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-12 15:49:34');
INSERT INTO `hc_log` VALUES ('521', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-12 15:49:45');
INSERT INTO `hc_log` VALUES ('522', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-12 15:49:46');
INSERT INTO `hc_log` VALUES ('523', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-12 15:50:57');
INSERT INTO `hc_log` VALUES ('524', '', '0', 'admin', '', 'position', '?m=admin&c=position&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-12 15:55:32');
INSERT INTO `hc_log` VALUES ('525', '', '0', 'admin', '', 'position', '?m=admin&c=position&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-12 15:56:11');
INSERT INTO `hc_log` VALUES ('526', '', '0', 'admin', '', 'position', '?m=admin&c=position&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-12 15:56:16');
INSERT INTO `hc_log` VALUES ('527', '', '0', 'admin', '', 'position', '?m=admin&c=position&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-12 15:56:32');
INSERT INTO `hc_log` VALUES ('528', '', '0', 'admin', '', 'position', '?m=admin&c=position&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-12 15:58:00');
INSERT INTO `hc_log` VALUES ('529', '', '0', 'admin', '', 'position', '?m=admin&c=position&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-12 15:58:18');
INSERT INTO `hc_log` VALUES ('530', '', '0', 'admin', '', 'position', '?m=admin&c=position&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-12 15:58:29');
INSERT INTO `hc_log` VALUES ('531', '', '0', 'admin', '', 'position', '?m=admin&c=position&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-12 15:58:34');
INSERT INTO `hc_log` VALUES ('532', '', '0', 'admin', '', 'position', '?m=admin&c=position&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-12 15:58:36');
INSERT INTO `hc_log` VALUES ('533', '', '0', 'admin', '', 'position', '?m=admin&c=position&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-12 15:58:40');
INSERT INTO `hc_log` VALUES ('534', '', '0', 'admin', '', 'position', '?m=admin&c=position&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-12 15:58:43');
INSERT INTO `hc_log` VALUES ('535', '', '0', 'admin', '', 'position', '?m=admin&c=position&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-12 15:59:13');
INSERT INTO `hc_log` VALUES ('536', '', '0', 'admin', '', 'position', '?m=admin&c=position&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-12 16:01:08');
INSERT INTO `hc_log` VALUES ('537', '', '0', 'admin', '', 'position', '?m=admin&c=position&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-12 16:01:43');
INSERT INTO `hc_log` VALUES ('538', '', '0', 'admin', '', 'position', '?m=admin&c=position&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-12 16:03:20');
INSERT INTO `hc_log` VALUES ('539', '', '0', 'admin', '', 'position', '?m=admin&c=position&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-12 16:04:22');
INSERT INTO `hc_log` VALUES ('540', '', '0', 'admin', '', 'position', '?m=admin&c=position&a=delete', '', '1', 'admin', '127.0.0.1', '2015-06-12 16:05:13');
INSERT INTO `hc_log` VALUES ('541', '', '0', 'admin', '', 'position', '?m=admin&c=position&a=delete', '', '1', 'admin', '127.0.0.1', '2015-06-12 16:05:18');
INSERT INTO `hc_log` VALUES ('542', '', '0', 'admin', '', 'position', '?m=admin&c=position&a=delete', '', '1', 'admin', '127.0.0.1', '2015-06-12 16:05:23');
INSERT INTO `hc_log` VALUES ('543', '', '0', 'admin', '', 'position', '?m=admin&c=position&a=delete', '', '1', 'admin', '127.0.0.1', '2015-06-12 16:05:29');
INSERT INTO `hc_log` VALUES ('544', '', '0', 'admin', '', 'position', '?m=admin&c=position&a=delete', '', '1', 'admin', '127.0.0.1', '2015-06-12 16:05:34');
INSERT INTO `hc_log` VALUES ('545', '', '0', 'admin', '', 'position', '?m=admin&c=position&a=delete', '', '1', 'admin', '127.0.0.1', '2015-06-12 16:05:39');
INSERT INTO `hc_log` VALUES ('546', '', '0', 'admin', '', 'position', '?m=admin&c=position&a=delete', '', '1', 'admin', '127.0.0.1', '2015-06-12 16:05:45');
INSERT INTO `hc_log` VALUES ('547', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-12 16:06:39');
INSERT INTO `hc_log` VALUES ('548', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-12 16:07:16');
INSERT INTO `hc_log` VALUES ('549', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-12 16:11:14');
INSERT INTO `hc_log` VALUES ('550', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-12 16:11:18');
INSERT INTO `hc_log` VALUES ('551', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-12 16:11:33');
INSERT INTO `hc_log` VALUES ('552', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-12 16:11:34');
INSERT INTO `hc_log` VALUES ('553', '', '0', 'admin', '', 'position', '?m=admin&c=position&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-12 16:11:49');
INSERT INTO `hc_log` VALUES ('554', '', '0', 'content', '', 'content', '?m=content&c=content&a=delete', '', '1', 'admin', '127.0.0.1', '2015-06-12 16:24:23');
INSERT INTO `hc_log` VALUES ('555', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-12 16:24:28');
INSERT INTO `hc_log` VALUES ('556', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2015-06-12 16:31:18');
INSERT INTO `hc_log` VALUES ('557', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2015-06-12 16:31:27');
INSERT INTO `hc_log` VALUES ('558', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-12 16:31:49');
INSERT INTO `hc_log` VALUES ('559', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-12 16:32:44');
INSERT INTO `hc_log` VALUES ('560', '', '0', 'admin', '', 'module', '?m=admin&c=module&a=uninstall', '', '1', 'admin', '127.0.0.1', '2015-06-12 16:38:19');
INSERT INTO `hc_log` VALUES ('561', '', '0', 'admin', '', 'module', '?m=admin&c=module&a=cache', '', '1', 'admin', '127.0.0.1', '2015-06-12 16:38:21');
INSERT INTO `hc_log` VALUES ('562', '', '0', 'admin', '', 'module', '?m=admin&c=module&a=uninstall', '', '1', 'admin', '127.0.0.1', '2015-06-12 16:38:51');
INSERT INTO `hc_log` VALUES ('563', '', '0', 'admin', '', 'module', '?m=admin&c=module&a=cache', '', '1', 'admin', '127.0.0.1', '2015-06-12 16:38:53');
INSERT INTO `hc_log` VALUES ('564', '', '0', 'admin', '', 'module', '?m=admin&c=module&a=uninstall', '', '1', 'admin', '127.0.0.1', '2015-06-12 16:39:09');
INSERT INTO `hc_log` VALUES ('565', '', '0', 'admin', '', 'module', '?m=admin&c=module&a=cache', '', '1', 'admin', '127.0.0.1', '2015-06-12 16:39:10');
INSERT INTO `hc_log` VALUES ('566', '', '0', 'admin', '', 'module', '?m=admin&c=module&a=uninstall', '', '1', 'admin', '127.0.0.1', '2015-06-12 16:39:32');
INSERT INTO `hc_log` VALUES ('567', '', '0', 'admin', '', 'module', '?m=admin&c=module&a=cache', '', '1', 'admin', '127.0.0.1', '2015-06-12 16:39:33');
INSERT INTO `hc_log` VALUES ('568', '', '0', 'admin', '', 'module', '?m=admin&c=module&a=uninstall', '', '1', 'admin', '127.0.0.1', '2015-06-12 16:40:20');
INSERT INTO `hc_log` VALUES ('569', '', '0', 'admin', '', 'module', '?m=admin&c=module&a=cache', '', '1', 'admin', '127.0.0.1', '2015-06-12 16:40:21');
INSERT INTO `hc_log` VALUES ('570', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=pay_list', '', '1', 'admin', '127.0.0.1', '2015-06-12 16:41:15');
INSERT INTO `hc_log` VALUES ('571', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-12 16:42:39');
INSERT INTO `hc_log` VALUES ('572', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-12 16:42:39');
INSERT INTO `hc_log` VALUES ('573', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-12 16:42:52');
INSERT INTO `hc_log` VALUES ('574', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-12 16:42:52');
INSERT INTO `hc_log` VALUES ('575', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-12 16:43:09');
INSERT INTO `hc_log` VALUES ('576', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-12 16:43:09');
INSERT INTO `hc_log` VALUES ('577', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-12 16:43:26');
INSERT INTO `hc_log` VALUES ('578', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-12 16:43:26');
INSERT INTO `hc_log` VALUES ('579', '', '0', 'link', '', 'link', '?m=link&c=link&a=setting', '', '1', 'admin', '127.0.0.1', '2015-06-12 16:44:01');
INSERT INTO `hc_log` VALUES ('580', '', '0', 'link', '', 'link', '?m=link&c=link&a=setting', '', '1', 'admin', '127.0.0.1', '2015-06-12 16:44:01');
INSERT INTO `hc_log` VALUES ('581', '', '0', 'link', '', 'link', '?m=link&c=link&a=add_type', '', '1', 'admin', '127.0.0.1', '2015-06-12 16:44:07');
INSERT INTO `hc_log` VALUES ('582', '', '0', 'link', '', 'link', '?m=link&c=link&a=add_type', '', '1', 'admin', '127.0.0.1', '2015-06-12 16:44:08');
INSERT INTO `hc_log` VALUES ('583', '', '0', 'link', '', 'link', '?m=link&c=link&a=add_type', '', '1', 'admin', '127.0.0.1', '2015-06-12 16:44:25');
INSERT INTO `hc_log` VALUES ('584', '', '0', 'link', '', 'link', '?m=link&c=link&a=add_type', '', '1', 'admin', '127.0.0.1', '2015-06-12 16:44:26');
INSERT INTO `hc_log` VALUES ('585', '', '0', 'link', '', 'link', '?m=link&c=link&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-12 16:44:36');
INSERT INTO `hc_log` VALUES ('586', '', '0', 'link', '', 'link', '?m=link&c=link&a=list_type', '', '1', 'admin', '127.0.0.1', '2015-06-12 17:13:03');
INSERT INTO `hc_log` VALUES ('587', '', '0', 'link', '', 'link', '?m=link&c=link&a=list_type', '', '1', 'admin', '127.0.0.1', '2015-06-12 17:13:03');
INSERT INTO `hc_log` VALUES ('588', '', '0', 'link', '', 'link', '?m=link&c=link&a=list_type', '', '1', 'admin', '127.0.0.1', '2015-06-12 17:13:12');
INSERT INTO `hc_log` VALUES ('589', '', '0', 'link', '', 'link', '?m=link&c=link&a=edit_type', '', '1', 'admin', '127.0.0.1', '2015-06-12 17:13:12');
INSERT INTO `hc_log` VALUES ('590', '', '0', 'link', '', 'link', '?m=link&c=link&a=edit_type', '', '1', 'admin', '127.0.0.1', '2015-06-12 17:13:28');
INSERT INTO `hc_log` VALUES ('591', '', '0', 'link', '', 'link', '?m=link&c=link&a=list_type', '', '1', 'admin', '127.0.0.1', '2015-06-12 17:13:28');
INSERT INTO `hc_log` VALUES ('592', '', '0', 'link', '', 'link', '?m=link&c=link&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-12 17:13:38');
INSERT INTO `hc_log` VALUES ('593', '', '0', 'link', '', 'link', '?m=link&c=link&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-12 17:14:28');
INSERT INTO `hc_log` VALUES ('594', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2015-06-13 11:17:13');
INSERT INTO `hc_log` VALUES ('595', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2015-06-13 11:17:13');
INSERT INTO `hc_log` VALUES ('596', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2015-06-13 11:17:19');
INSERT INTO `hc_log` VALUES ('597', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2015-06-13 12:31:16');
INSERT INTO `hc_log` VALUES ('598', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2015-06-13 12:31:22');
INSERT INTO `hc_log` VALUES ('599', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2015-06-13 12:31:30');
INSERT INTO `hc_log` VALUES ('600', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2015-06-13 12:31:47');
INSERT INTO `hc_log` VALUES ('601', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2015-06-13 12:31:57');
INSERT INTO `hc_log` VALUES ('602', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2015-06-13 12:31:57');
INSERT INTO `hc_log` VALUES ('603', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2015-06-13 12:32:28');
INSERT INTO `hc_log` VALUES ('604', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2015-06-13 12:32:53');
INSERT INTO `hc_log` VALUES ('605', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2015-06-13 12:32:56');
INSERT INTO `hc_log` VALUES ('606', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2015-06-13 12:33:38');
INSERT INTO `hc_log` VALUES ('607', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2015-06-13 12:36:25');
INSERT INTO `hc_log` VALUES ('608', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2015-06-13 12:37:12');
INSERT INTO `hc_log` VALUES ('609', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-13 12:41:08');
INSERT INTO `hc_log` VALUES ('610', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '127.0.0.1', '2015-06-13 12:48:53');
INSERT INTO `hc_log` VALUES ('611', '', '0', 'content', '', 'sitemodel', '?m=content&c=sitemodel&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-13 12:53:24');
INSERT INTO `hc_log` VALUES ('612', '', '0', 'content', '', 'sitemodel', '?m=content&c=sitemodel&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-13 12:55:20');
INSERT INTO `hc_log` VALUES ('613', '', '0', 'content', '', 'sitemodel', '?m=content&c=sitemodel&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-13 12:55:30');
INSERT INTO `hc_log` VALUES ('614', '', '0', 'content', '', 'sitemodel', '?m=content&c=sitemodel&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-13 12:56:15');
INSERT INTO `hc_log` VALUES ('615', '', '0', 'content', '', 'sitemodel', '?m=content&c=sitemodel&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-13 12:57:01');
INSERT INTO `hc_log` VALUES ('616', '', '0', 'content', '', 'sitemodel', '?m=content&c=sitemodel&a=delete', '', '1', 'admin', '127.0.0.1', '2015-06-13 12:57:09');
INSERT INTO `hc_log` VALUES ('617', '', '0', 'content', '', 'sitemodel', '?m=content&c=sitemodel&a=delete', '', '1', 'admin', '127.0.0.1', '2015-06-13 12:57:12');
INSERT INTO `hc_log` VALUES ('618', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-13 12:58:58');
INSERT INTO `hc_log` VALUES ('619', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-13 13:00:40');
INSERT INTO `hc_log` VALUES ('620', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-13 13:00:47');
INSERT INTO `hc_log` VALUES ('621', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-13 13:01:06');
INSERT INTO `hc_log` VALUES ('622', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=listorder', '', '1', 'admin', '127.0.0.1', '2015-06-13 13:01:18');
INSERT INTO `hc_log` VALUES ('623', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-13 13:01:32');
INSERT INTO `hc_log` VALUES ('624', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-13 13:01:37');
INSERT INTO `hc_log` VALUES ('625', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-13 13:01:44');
INSERT INTO `hc_log` VALUES ('626', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-13 13:03:43');
INSERT INTO `hc_log` VALUES ('627', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-13 13:03:49');
INSERT INTO `hc_log` VALUES ('628', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-13 13:03:49');
INSERT INTO `hc_log` VALUES ('629', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-13 13:04:15');
INSERT INTO `hc_log` VALUES ('630', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-13 13:04:21');
INSERT INTO `hc_log` VALUES ('631', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-13 13:05:06');
INSERT INTO `hc_log` VALUES ('632', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-13 13:05:16');
INSERT INTO `hc_log` VALUES ('633', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-13 13:05:28');
INSERT INTO `hc_log` VALUES ('634', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2015-06-13 13:14:52');
INSERT INTO `hc_log` VALUES ('635', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2015-06-13 13:14:52');
INSERT INTO `hc_log` VALUES ('636', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2015-06-13 13:14:55');
INSERT INTO `hc_log` VALUES ('637', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-13 13:15:01');
INSERT INTO `hc_log` VALUES ('638', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-13 13:15:12');
INSERT INTO `hc_log` VALUES ('639', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-13 13:15:52');
INSERT INTO `hc_log` VALUES ('640', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-13 13:16:05');
INSERT INTO `hc_log` VALUES ('641', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-13 13:27:32');
INSERT INTO `hc_log` VALUES ('642', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=listorder', '', '1', 'admin', '127.0.0.1', '2015-06-13 13:27:50');
INSERT INTO `hc_log` VALUES ('643', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-13 13:27:59');
INSERT INTO `hc_log` VALUES ('644', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-13 13:28:07');
INSERT INTO `hc_log` VALUES ('645', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-13 13:28:14');
INSERT INTO `hc_log` VALUES ('646', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-13 13:28:21');
INSERT INTO `hc_log` VALUES ('647', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-13 13:28:29');
INSERT INTO `hc_log` VALUES ('648', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-13 13:28:35');
INSERT INTO `hc_log` VALUES ('649', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-13 13:43:55');
INSERT INTO `hc_log` VALUES ('650', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-13 13:44:10');
INSERT INTO `hc_log` VALUES ('651', '', '0', 'content', '', 'sitemodel', '?m=content&c=sitemodel&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-13 13:44:21');
INSERT INTO `hc_log` VALUES ('652', '', '0', 'content', '', 'sitemodel', '?m=content&c=sitemodel&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-13 13:44:24');
INSERT INTO `hc_log` VALUES ('653', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '127.0.0.1', '2015-06-13 13:46:46');
INSERT INTO `hc_log` VALUES ('654', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2015-06-13 13:46:49');
INSERT INTO `hc_log` VALUES ('655', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2015-06-13 13:46:49');
INSERT INTO `hc_log` VALUES ('656', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2015-06-13 13:46:53');
INSERT INTO `hc_log` VALUES ('657', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2015-06-13 13:46:54');
INSERT INTO `hc_log` VALUES ('658', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2015-06-13 13:46:54');
INSERT INTO `hc_log` VALUES ('659', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2015-06-13 13:46:58');
INSERT INTO `hc_log` VALUES ('660', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-13 13:47:06');
INSERT INTO `hc_log` VALUES ('661', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '127.0.0.1', '2015-06-13 13:52:43');
INSERT INTO `hc_log` VALUES ('662', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '127.0.0.1', '2015-06-13 13:52:44');
INSERT INTO `hc_log` VALUES ('663', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '127.0.0.1', '2015-06-13 13:52:51');
INSERT INTO `hc_log` VALUES ('664', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '127.0.0.1', '2015-06-13 13:52:53');
INSERT INTO `hc_log` VALUES ('665', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '127.0.0.1', '2015-06-13 13:53:00');
INSERT INTO `hc_log` VALUES ('666', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '127.0.0.1', '2015-06-13 13:53:01');
INSERT INTO `hc_log` VALUES ('667', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '127.0.0.1', '2015-06-13 13:53:08');
INSERT INTO `hc_log` VALUES ('668', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-13 13:53:21');
INSERT INTO `hc_log` VALUES ('669', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-13 13:53:24');
INSERT INTO `hc_log` VALUES ('670', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-13 13:58:42');
INSERT INTO `hc_log` VALUES ('671', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-13 13:58:46');
INSERT INTO `hc_log` VALUES ('672', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-13 14:03:13');
INSERT INTO `hc_log` VALUES ('673', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-13 14:03:15');
INSERT INTO `hc_log` VALUES ('674', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-13 14:06:09');
INSERT INTO `hc_log` VALUES ('675', '', '0', 'content', '', 'sitemodel', '?m=content&c=sitemodel&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-13 14:07:56');
INSERT INTO `hc_log` VALUES ('676', '', '0', 'content', '', 'sitemodel', '?m=content&c=sitemodel&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-13 14:07:59');
INSERT INTO `hc_log` VALUES ('677', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-13 14:15:10');
INSERT INTO `hc_log` VALUES ('678', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-13 14:18:27');
INSERT INTO `hc_log` VALUES ('679', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-13 14:18:36');
INSERT INTO `hc_log` VALUES ('680', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-13 14:18:48');
INSERT INTO `hc_log` VALUES ('681', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-13 14:19:09');
INSERT INTO `hc_log` VALUES ('682', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-13 14:19:11');
INSERT INTO `hc_log` VALUES ('683', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-13 14:19:12');
INSERT INTO `hc_log` VALUES ('684', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-13 14:19:41');
INSERT INTO `hc_log` VALUES ('685', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-13 14:22:35');
INSERT INTO `hc_log` VALUES ('686', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2015-06-13 14:26:22');
INSERT INTO `hc_log` VALUES ('687', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2015-06-13 14:26:26');
INSERT INTO `hc_log` VALUES ('688', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2015-06-13 14:26:29');
INSERT INTO `hc_log` VALUES ('689', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-13 14:27:18');
INSERT INTO `hc_log` VALUES ('690', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-13 14:26:39');
INSERT INTO `hc_log` VALUES ('691', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-13 14:27:33');
INSERT INTO `hc_log` VALUES ('692', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-13 14:27:36');
INSERT INTO `hc_log` VALUES ('693', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-13 14:28:05');
INSERT INTO `hc_log` VALUES ('694', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-13 14:29:09');
INSERT INTO `hc_log` VALUES ('695', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-13 14:30:47');
INSERT INTO `hc_log` VALUES ('696', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-13 14:30:56');
INSERT INTO `hc_log` VALUES ('697', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-13 14:30:59');
INSERT INTO `hc_log` VALUES ('698', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-13 14:31:00');
INSERT INTO `hc_log` VALUES ('699', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-13 14:38:47');
INSERT INTO `hc_log` VALUES ('700', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-13 14:41:16');
INSERT INTO `hc_log` VALUES ('701', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-13 14:42:06');
INSERT INTO `hc_log` VALUES ('702', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-13 14:43:21');
INSERT INTO `hc_log` VALUES ('703', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-13 14:43:14');
INSERT INTO `hc_log` VALUES ('704', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-13 14:44:33');
INSERT INTO `hc_log` VALUES ('705', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-13 14:44:35');
INSERT INTO `hc_log` VALUES ('706', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-13 14:44:36');
INSERT INTO `hc_log` VALUES ('707', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-13 14:43:49');
INSERT INTO `hc_log` VALUES ('708', '', '0', 'content', '', 'sitemodel', '?m=content&c=sitemodel&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-13 14:47:04');
INSERT INTO `hc_log` VALUES ('709', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-13 14:49:23');
INSERT INTO `hc_log` VALUES ('710', '', '0', 'content', '', 'sitemodel', '?m=content&c=sitemodel&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-13 14:49:19');
INSERT INTO `hc_log` VALUES ('711', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-13 14:50:42');
INSERT INTO `hc_log` VALUES ('712', '', '0', 'content', '', 'sitemodel', '?m=content&c=sitemodel&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-13 14:50:40');
INSERT INTO `hc_log` VALUES ('713', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-13 14:50:49');
INSERT INTO `hc_log` VALUES ('714', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-13 14:51:01');
INSERT INTO `hc_log` VALUES ('715', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-13 14:51:09');
INSERT INTO `hc_log` VALUES ('716', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-13 14:51:21');
INSERT INTO `hc_log` VALUES ('717', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-13 14:52:58');
INSERT INTO `hc_log` VALUES ('718', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=disabled', '', '1', 'admin', '127.0.0.1', '2015-06-13 14:52:17');
INSERT INTO `hc_log` VALUES ('719', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=disabled', '', '1', 'admin', '127.0.0.1', '2015-06-13 14:52:33');
INSERT INTO `hc_log` VALUES ('720', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-13 14:52:42');
INSERT INTO `hc_log` VALUES ('721', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=disabled', '', '1', 'admin', '127.0.0.1', '2015-06-13 14:53:03');
INSERT INTO `hc_log` VALUES ('722', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=disabled', '', '1', 'admin', '127.0.0.1', '2015-06-13 14:53:06');
INSERT INTO `hc_log` VALUES ('723', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-13 14:53:09');
INSERT INTO `hc_log` VALUES ('724', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-13 14:54:07');
INSERT INTO `hc_log` VALUES ('725', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-13 14:54:09');
INSERT INTO `hc_log` VALUES ('726', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-13 14:54:10');
INSERT INTO `hc_log` VALUES ('727', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-13 14:54:02');
INSERT INTO `hc_log` VALUES ('728', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-13 14:54:48');
INSERT INTO `hc_log` VALUES ('729', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-13 14:54:57');
INSERT INTO `hc_log` VALUES ('730', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=disabled', '', '1', 'admin', '127.0.0.1', '2015-06-13 14:55:03');
INSERT INTO `hc_log` VALUES ('731', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=disabled', '', '1', 'admin', '127.0.0.1', '2015-06-13 14:55:08');
INSERT INTO `hc_log` VALUES ('732', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=disabled', '', '1', 'admin', '127.0.0.1', '2015-06-13 14:55:12');
INSERT INTO `hc_log` VALUES ('733', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=disabled', '', '1', 'admin', '127.0.0.1', '2015-06-13 14:55:16');
INSERT INTO `hc_log` VALUES ('734', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=disabled', '', '1', 'admin', '127.0.0.1', '2015-06-13 14:55:20');
INSERT INTO `hc_log` VALUES ('735', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=disabled', '', '1', 'admin', '127.0.0.1', '2015-06-13 14:55:24');
INSERT INTO `hc_log` VALUES ('736', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=disabled', '', '1', 'admin', '127.0.0.1', '2015-06-13 14:55:28');
INSERT INTO `hc_log` VALUES ('737', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-13 14:55:39');
INSERT INTO `hc_log` VALUES ('738', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2015-06-13 14:56:52');
INSERT INTO `hc_log` VALUES ('739', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2015-06-13 14:56:53');
INSERT INTO `hc_log` VALUES ('740', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2015-06-13 14:56:56');
INSERT INTO `hc_log` VALUES ('741', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-13 14:57:07');
INSERT INTO `hc_log` VALUES ('742', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-13 14:57:24');
INSERT INTO `hc_log` VALUES ('743', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=listorder', '', '1', 'admin', '127.0.0.1', '2015-06-13 14:57:36');
INSERT INTO `hc_log` VALUES ('744', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-13 14:57:45');
INSERT INTO `hc_log` VALUES ('745', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-13 14:58:16');
INSERT INTO `hc_log` VALUES ('746', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-13 14:58:47');
INSERT INTO `hc_log` VALUES ('747', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-13 14:59:06');
INSERT INTO `hc_log` VALUES ('748', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-13 14:59:13');
INSERT INTO `hc_log` VALUES ('749', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-13 14:59:21');
INSERT INTO `hc_log` VALUES ('750', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-13 14:59:38');
INSERT INTO `hc_log` VALUES ('751', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-13 14:59:47');
INSERT INTO `hc_log` VALUES ('752', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-13 14:59:55');
INSERT INTO `hc_log` VALUES ('753', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-13 15:00:05');
INSERT INTO `hc_log` VALUES ('754', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-13 15:00:09');
INSERT INTO `hc_log` VALUES ('755', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-13 15:00:42');
INSERT INTO `hc_log` VALUES ('756', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-13 15:01:54');
INSERT INTO `hc_log` VALUES ('757', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-13 15:02:00');
INSERT INTO `hc_log` VALUES ('758', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-13 15:02:00');
INSERT INTO `hc_log` VALUES ('759', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-13 15:03:18');
INSERT INTO `hc_log` VALUES ('760', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-13 15:03:25');
INSERT INTO `hc_log` VALUES ('761', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-13 15:03:38');
INSERT INTO `hc_log` VALUES ('762', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-13 15:03:48');
INSERT INTO `hc_log` VALUES ('763', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-13 15:03:54');
INSERT INTO `hc_log` VALUES ('764', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-13 15:03:59');
INSERT INTO `hc_log` VALUES ('765', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-13 15:04:05');
INSERT INTO `hc_log` VALUES ('766', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-13 15:04:15');
INSERT INTO `hc_log` VALUES ('767', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-13 15:04:51');
INSERT INTO `hc_log` VALUES ('768', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-13 15:04:58');
INSERT INTO `hc_log` VALUES ('769', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-13 15:06:45');
INSERT INTO `hc_log` VALUES ('770', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-13 15:06:06');
INSERT INTO `hc_log` VALUES ('771', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-13 15:07:39');
INSERT INTO `hc_log` VALUES ('772', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-13 15:07:47');
INSERT INTO `hc_log` VALUES ('773', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-13 15:07:49');
INSERT INTO `hc_log` VALUES ('774', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-13 15:07:50');
INSERT INTO `hc_log` VALUES ('775', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '127.0.0.1', '2015-06-13 15:13:46');
INSERT INTO `hc_log` VALUES ('776', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '127.0.0.1', '2015-06-13 15:13:50');
INSERT INTO `hc_log` VALUES ('777', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '127.0.0.1', '2015-06-13 15:13:52');
INSERT INTO `hc_log` VALUES ('778', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '127.0.0.1', '2015-06-13 15:13:52');
INSERT INTO `hc_log` VALUES ('779', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '127.0.0.1', '2015-06-13 15:13:53');
INSERT INTO `hc_log` VALUES ('780', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '127.0.0.1', '2015-06-13 15:14:07');
INSERT INTO `hc_log` VALUES ('781', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '127.0.0.1', '2015-06-13 15:14:08');
INSERT INTO `hc_log` VALUES ('782', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '127.0.0.1', '2015-06-13 15:14:09');
INSERT INTO `hc_log` VALUES ('783', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '127.0.0.1', '2015-06-13 15:14:10');
INSERT INTO `hc_log` VALUES ('784', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-13 15:22:20');
INSERT INTO `hc_log` VALUES ('785', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-13 15:22:46');
INSERT INTO `hc_log` VALUES ('786', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '127.0.0.1', '2015-06-13 15:22:05');
INSERT INTO `hc_log` VALUES ('787', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '127.0.0.1', '2015-06-13 15:22:07');
INSERT INTO `hc_log` VALUES ('788', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '127.0.0.1', '2015-06-13 15:22:08');
INSERT INTO `hc_log` VALUES ('789', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '127.0.0.1', '2015-06-13 15:22:09');
INSERT INTO `hc_log` VALUES ('790', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-13 15:24:49');
INSERT INTO `hc_log` VALUES ('791', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-13 15:24:53');
INSERT INTO `hc_log` VALUES ('792', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-13 15:27:58');
INSERT INTO `hc_log` VALUES ('793', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-13 15:30:20');
INSERT INTO `hc_log` VALUES ('794', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-13 15:30:34');
INSERT INTO `hc_log` VALUES ('795', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-13 15:30:56');
INSERT INTO `hc_log` VALUES ('796', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-13 15:42:04');
INSERT INTO `hc_log` VALUES ('797', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-13 15:42:40');
INSERT INTO `hc_log` VALUES ('798', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-13 15:42:45');
INSERT INTO `hc_log` VALUES ('799', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2015-06-13 15:42:21');
INSERT INTO `hc_log` VALUES ('800', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2015-06-13 15:42:22');
INSERT INTO `hc_log` VALUES ('801', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2015-06-13 15:42:22');
INSERT INTO `hc_log` VALUES ('802', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2015-06-13 15:42:25');
INSERT INTO `hc_log` VALUES ('803', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-13 15:43:14');
INSERT INTO `hc_log` VALUES ('804', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-13 15:42:34');
INSERT INTO `hc_log` VALUES ('805', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-13 15:42:41');
INSERT INTO `hc_log` VALUES ('806', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '127.0.0.1', '2015-06-13 15:42:51');
INSERT INTO `hc_log` VALUES ('807', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '127.0.0.1', '2015-06-13 15:42:55');
INSERT INTO `hc_log` VALUES ('808', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '127.0.0.1', '2015-06-13 15:42:56');
INSERT INTO `hc_log` VALUES ('809', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '127.0.0.1', '2015-06-13 15:42:57');
INSERT INTO `hc_log` VALUES ('810', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '127.0.0.1', '2015-06-13 15:42:58');
INSERT INTO `hc_log` VALUES ('811', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-13 15:44:25');
INSERT INTO `hc_log` VALUES ('812', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-13 15:57:19');
INSERT INTO `hc_log` VALUES ('813', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '127.0.0.1', '2015-06-13 16:04:27');
INSERT INTO `hc_log` VALUES ('814', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-13 16:09:02');
INSERT INTO `hc_log` VALUES ('815', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-13 16:10:57');
INSERT INTO `hc_log` VALUES ('816', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-13 16:11:16');
INSERT INTO `hc_log` VALUES ('817', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-13 16:11:37');
INSERT INTO `hc_log` VALUES ('818', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-13 16:13:22');
INSERT INTO `hc_log` VALUES ('819', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-13 16:14:05');
INSERT INTO `hc_log` VALUES ('820', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-13 16:15:16');
INSERT INTO `hc_log` VALUES ('821', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-13 16:21:03');
INSERT INTO `hc_log` VALUES ('822', '', '0', 'admin', '', 'position', '?m=admin&c=position&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-13 16:21:29');
INSERT INTO `hc_log` VALUES ('823', '', '0', 'admin', '', 'position', '?m=admin&c=position&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-13 16:22:12');
INSERT INTO `hc_log` VALUES ('824', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-13 16:22:26');
INSERT INTO `hc_log` VALUES ('825', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-13 16:22:42');
INSERT INTO `hc_log` VALUES ('826', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-13 16:23:39');
INSERT INTO `hc_log` VALUES ('827', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-13 16:23:41');
INSERT INTO `hc_log` VALUES ('828', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-13 16:23:41');
INSERT INTO `hc_log` VALUES ('829', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-13 16:23:50');
INSERT INTO `hc_log` VALUES ('830', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-13 16:23:55');
INSERT INTO `hc_log` VALUES ('831', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-13 16:24:49');
INSERT INTO `hc_log` VALUES ('832', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-13 16:24:51');
INSERT INTO `hc_log` VALUES ('833', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-13 16:24:52');
INSERT INTO `hc_log` VALUES ('834', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-13 16:28:09');
INSERT INTO `hc_log` VALUES ('835', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-13 16:28:12');
INSERT INTO `hc_log` VALUES ('836', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-13 16:28:14');
INSERT INTO `hc_log` VALUES ('837', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-13 16:28:42');
INSERT INTO `hc_log` VALUES ('838', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-13 16:33:54');
INSERT INTO `hc_log` VALUES ('839', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-13 16:34:01');
INSERT INTO `hc_log` VALUES ('840', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-13 16:54:29');
INSERT INTO `hc_log` VALUES ('841', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-13 16:54:49');
INSERT INTO `hc_log` VALUES ('842', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-13 16:54:51');
INSERT INTO `hc_log` VALUES ('843', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-13 16:54:52');
INSERT INTO `hc_log` VALUES ('844', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-13 16:55:00');
INSERT INTO `hc_log` VALUES ('845', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-13 16:55:02');
INSERT INTO `hc_log` VALUES ('846', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-13 16:55:12');
INSERT INTO `hc_log` VALUES ('847', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-13 16:55:14');
INSERT INTO `hc_log` VALUES ('848', '', '0', 'collection', '', 'node', '?m=collection&c=node&a=manage', '', '1', 'admin', '127.0.0.1', '2015-06-13 16:55:21');
INSERT INTO `hc_log` VALUES ('849', '', '0', 'collection', '', 'node', '?m=collection&c=node&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-13 16:55:24');
INSERT INTO `hc_log` VALUES ('850', '', '0', 'collection', '', 'node', '?m=collection&c=node&a=manage', '', '1', 'admin', '127.0.0.1', '2015-06-13 16:55:27');
INSERT INTO `hc_log` VALUES ('851', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-13 16:56:04');
INSERT INTO `hc_log` VALUES ('852', '', '0', 'admin', '', 'position', '?m=admin&c=position&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-13 16:58:35');
INSERT INTO `hc_log` VALUES ('853', '', '0', 'admin', '', 'position', '?m=admin&c=position&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-13 16:58:49');
INSERT INTO `hc_log` VALUES ('854', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-13 16:58:57');
INSERT INTO `hc_log` VALUES ('855', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-13 16:59:00');
INSERT INTO `hc_log` VALUES ('856', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-13 16:59:02');
INSERT INTO `hc_log` VALUES ('857', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-13 16:59:03');
INSERT INTO `hc_log` VALUES ('858', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-13 16:59:10');
INSERT INTO `hc_log` VALUES ('859', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-13 16:59:14');
INSERT INTO `hc_log` VALUES ('860', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-13 16:59:16');
INSERT INTO `hc_log` VALUES ('861', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-13 16:59:17');
INSERT INTO `hc_log` VALUES ('862', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-13 17:15:32');
INSERT INTO `hc_log` VALUES ('863', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-13 17:16:14');
INSERT INTO `hc_log` VALUES ('864', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-13 17:23:29');
INSERT INTO `hc_log` VALUES ('865', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-13 17:24:23');
INSERT INTO `hc_log` VALUES ('866', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-13 17:24:25');
INSERT INTO `hc_log` VALUES ('867', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-13 17:24:32');
INSERT INTO `hc_log` VALUES ('868', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-13 17:24:51');
INSERT INTO `hc_log` VALUES ('869', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-13 17:24:53');
INSERT INTO `hc_log` VALUES ('870', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-13 17:25:09');
INSERT INTO `hc_log` VALUES ('871', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-13 17:25:15');
INSERT INTO `hc_log` VALUES ('872', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-13 17:25:19');
INSERT INTO `hc_log` VALUES ('873', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-13 17:25:24');
INSERT INTO `hc_log` VALUES ('874', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-13 17:26:44');
INSERT INTO `hc_log` VALUES ('875', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2015-06-14 10:53:09');
INSERT INTO `hc_log` VALUES ('876', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2015-06-14 10:53:09');
INSERT INTO `hc_log` VALUES ('877', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2015-06-14 10:53:12');
INSERT INTO `hc_log` VALUES ('878', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2015-06-14 19:32:16');
INSERT INTO `hc_log` VALUES ('879', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2015-06-14 19:32:16');
INSERT INTO `hc_log` VALUES ('880', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2015-06-14 19:32:25');
INSERT INTO `hc_log` VALUES ('881', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-14 19:32:37');
INSERT INTO `hc_log` VALUES ('882', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-14 19:36:11');
INSERT INTO `hc_log` VALUES ('883', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-14 19:37:21');
INSERT INTO `hc_log` VALUES ('884', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-14 19:39:45');
INSERT INTO `hc_log` VALUES ('885', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-14 19:39:51');
INSERT INTO `hc_log` VALUES ('886', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-14 19:39:59');
INSERT INTO `hc_log` VALUES ('887', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-14 19:45:05');
INSERT INTO `hc_log` VALUES ('888', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-14 19:47:58');
INSERT INTO `hc_log` VALUES ('889', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-14 19:51:14');
INSERT INTO `hc_log` VALUES ('890', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-14 19:52:00');
INSERT INTO `hc_log` VALUES ('891', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-14 19:54:29');
INSERT INTO `hc_log` VALUES ('892', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-14 19:55:53');
INSERT INTO `hc_log` VALUES ('893', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-14 19:56:32');
INSERT INTO `hc_log` VALUES ('894', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-14 20:00:32');
INSERT INTO `hc_log` VALUES ('895', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-14 20:00:53');
INSERT INTO `hc_log` VALUES ('896', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-14 20:00:58');
INSERT INTO `hc_log` VALUES ('897', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-14 20:01:16');
INSERT INTO `hc_log` VALUES ('898', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2015-06-14 20:06:04');
INSERT INTO `hc_log` VALUES ('899', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2015-06-14 20:06:04');
INSERT INTO `hc_log` VALUES ('900', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2015-06-14 20:06:08');
INSERT INTO `hc_log` VALUES ('901', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2015-06-14 20:06:10');
INSERT INTO `hc_log` VALUES ('902', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2015-06-14 20:06:16');
INSERT INTO `hc_log` VALUES ('903', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2015-06-14 20:06:20');
INSERT INTO `hc_log` VALUES ('904', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-14 20:06:33');
INSERT INTO `hc_log` VALUES ('905', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-14 20:06:41');
INSERT INTO `hc_log` VALUES ('906', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-14 20:23:10');
INSERT INTO `hc_log` VALUES ('907', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-14 20:24:00');
INSERT INTO `hc_log` VALUES ('908', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-14 20:24:21');
INSERT INTO `hc_log` VALUES ('909', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-14 20:24:29');
INSERT INTO `hc_log` VALUES ('910', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-14 20:24:59');
INSERT INTO `hc_log` VALUES ('911', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2015-06-14 20:42:51');
INSERT INTO `hc_log` VALUES ('912', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2015-06-14 20:42:51');
INSERT INTO `hc_log` VALUES ('913', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2015-06-14 20:42:57');
INSERT INTO `hc_log` VALUES ('914', '', '0', 'dbsource', '', 'data', '?m=dbsource&c=data&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-14 20:43:13');
INSERT INTO `hc_log` VALUES ('915', '', '0', 'dbsource', '', 'data', '?m=dbsource&c=data&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-14 20:43:18');
INSERT INTO `hc_log` VALUES ('916', '', '0', 'content', '', 'sitemodel', '?m=content&c=sitemodel&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-14 20:46:16');
INSERT INTO `hc_log` VALUES ('917', '', '0', 'content', '', 'sitemodel', '?m=content&c=sitemodel&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-14 20:46:52');
INSERT INTO `hc_log` VALUES ('918', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-14 20:47:05');
INSERT INTO `hc_log` VALUES ('919', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-14 20:48:52');
INSERT INTO `hc_log` VALUES ('920', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2015-06-15 08:25:26');
INSERT INTO `hc_log` VALUES ('921', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2015-06-15 08:25:38');
INSERT INTO `hc_log` VALUES ('922', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-15 08:26:17');
INSERT INTO `hc_log` VALUES ('923', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-15 08:27:41');
INSERT INTO `hc_log` VALUES ('924', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-15 08:27:43');
INSERT INTO `hc_log` VALUES ('925', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-15 08:28:07');
INSERT INTO `hc_log` VALUES ('926', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-15 08:28:09');
INSERT INTO `hc_log` VALUES ('927', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-15 08:28:32');
INSERT INTO `hc_log` VALUES ('928', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-15 08:28:34');
INSERT INTO `hc_log` VALUES ('929', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-15 08:29:03');
INSERT INTO `hc_log` VALUES ('930', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-15 08:38:26');
INSERT INTO `hc_log` VALUES ('931', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2015-06-15 09:13:32');
INSERT INTO `hc_log` VALUES ('932', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2015-06-15 09:13:32');
INSERT INTO `hc_log` VALUES ('933', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2015-06-15 09:13:37');
INSERT INTO `hc_log` VALUES ('934', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '127.0.0.1', '2015-06-15 09:22:51');
INSERT INTO `hc_log` VALUES ('935', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '127.0.0.1', '2015-06-15 09:22:54');
INSERT INTO `hc_log` VALUES ('936', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '127.0.0.1', '2015-06-15 09:22:55');
INSERT INTO `hc_log` VALUES ('937', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '127.0.0.1', '2015-06-15 09:22:56');
INSERT INTO `hc_log` VALUES ('938', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '127.0.0.1', '2015-06-15 09:22:56');
INSERT INTO `hc_log` VALUES ('939', '', '0', 'poster', '', 'space', '?m=poster&c=space&a=delete', '', '1', 'admin', '127.0.0.1', '2015-06-15 09:25:45');
INSERT INTO `hc_log` VALUES ('940', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-15 09:28:22');
INSERT INTO `hc_log` VALUES ('941', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-15 09:28:22');
INSERT INTO `hc_log` VALUES ('942', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-15 09:31:25');
INSERT INTO `hc_log` VALUES ('943', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-15 09:31:26');
INSERT INTO `hc_log` VALUES ('944', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-15 09:32:25');
INSERT INTO `hc_log` VALUES ('945', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-15 09:32:25');
INSERT INTO `hc_log` VALUES ('946', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-15 09:34:13');
INSERT INTO `hc_log` VALUES ('947', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-15 09:34:13');
INSERT INTO `hc_log` VALUES ('948', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-15 09:36:59');
INSERT INTO `hc_log` VALUES ('949', '', '0', 'poster', '', 'space', '?m=poster&c=space&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-15 13:51:28');
INSERT INTO `hc_log` VALUES ('950', '', '0', 'poster', '', 'space', '?m=poster&c=space&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-15 13:52:35');
INSERT INTO `hc_log` VALUES ('951', '', '0', 'poster', '', 'poster', '?m=poster&c=poster&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-15 13:52:42');
INSERT INTO `hc_log` VALUES ('952', '', '0', 'poster', '', 'poster', '?m=poster&c=poster&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-15 13:52:44');
INSERT INTO `hc_log` VALUES ('953', '', '0', 'poster', '', 'poster', '?m=poster&c=poster&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-15 13:53:55');
INSERT INTO `hc_log` VALUES ('954', '', '0', 'poster', '', 'poster', '?m=poster&c=poster&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-15 13:53:59');
INSERT INTO `hc_log` VALUES ('955', '', '0', 'poster', '', 'poster', '?m=poster&c=poster&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-15 13:54:00');
INSERT INTO `hc_log` VALUES ('956', '', '0', 'poster', '', 'poster', '?m=poster&c=poster&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-15 13:54:28');
INSERT INTO `hc_log` VALUES ('957', '', '0', 'admin', '', 'position', '?m=admin&c=position&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-15 15:18:28');
INSERT INTO `hc_log` VALUES ('958', '', '0', 'admin', '', 'position', '?m=admin&c=position&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-15 15:19:37');
INSERT INTO `hc_log` VALUES ('959', '', '0', 'admin', '', 'position', '?m=admin&c=position&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-15 15:20:02');
INSERT INTO `hc_log` VALUES ('960', '', '0', 'admin', '', 'position', '?m=admin&c=position&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-15 15:20:06');
INSERT INTO `hc_log` VALUES ('961', '', '0', 'admin', '', 'position', '?m=admin&c=position&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-15 15:22:15');
INSERT INTO `hc_log` VALUES ('962', '', '0', 'admin', '', 'position', '?m=admin&c=position&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-15 15:23:19');
INSERT INTO `hc_log` VALUES ('963', '', '0', 'admin', '', 'position', '?m=admin&c=position&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-15 15:23:27');
INSERT INTO `hc_log` VALUES ('964', '', '0', 'admin', '', 'position', '?m=admin&c=position&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-15 15:23:34');
INSERT INTO `hc_log` VALUES ('965', '', '0', 'admin', '', 'position', '?m=admin&c=position&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-15 15:23:46');
INSERT INTO `hc_log` VALUES ('966', '', '0', 'admin', '', 'position', '?m=admin&c=position&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-15 15:24:02');
INSERT INTO `hc_log` VALUES ('967', '', '0', 'admin', '', 'position', '?m=admin&c=position&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-15 15:25:19');
INSERT INTO `hc_log` VALUES ('968', '', '0', 'admin', '', 'position', '?m=admin&c=position&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-15 15:25:34');
INSERT INTO `hc_log` VALUES ('969', '', '0', 'admin', '', 'position', '?m=admin&c=position&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-15 15:26:33');
INSERT INTO `hc_log` VALUES ('970', '', '0', 'admin', '', 'position', '?m=admin&c=position&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-15 15:26:44');
INSERT INTO `hc_log` VALUES ('971', '', '0', 'admin', '', 'position', '?m=admin&c=position&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-15 15:27:26');
INSERT INTO `hc_log` VALUES ('972', '', '0', 'admin', '', 'position', '?m=admin&c=position&a=delete', '', '1', 'admin', '127.0.0.1', '2015-06-15 15:31:23');
INSERT INTO `hc_log` VALUES ('973', '', '0', 'admin', '', 'position', '?m=admin&c=position&a=delete', '', '1', 'admin', '127.0.0.1', '2015-06-15 15:31:37');
INSERT INTO `hc_log` VALUES ('974', '', '0', 'admin', '', 'position', '?m=admin&c=position&a=delete', '', '1', 'admin', '127.0.0.1', '2015-06-15 15:31:53');
INSERT INTO `hc_log` VALUES ('975', '', '0', 'admin', '', 'position', '?m=admin&c=position&a=delete', '', '1', 'admin', '127.0.0.1', '2015-06-15 15:32:07');
INSERT INTO `hc_log` VALUES ('976', '', '0', 'admin', '', 'position', '?m=admin&c=position&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-15 15:32:18');
INSERT INTO `hc_log` VALUES ('977', '', '0', 'admin', '', 'position', '?m=admin&c=position&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-15 15:32:37');
INSERT INTO `hc_log` VALUES ('978', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '127.0.0.1', '2015-06-15 16:22:42');
INSERT INTO `hc_log` VALUES ('979', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '127.0.0.1', '2015-06-15 16:22:40');
INSERT INTO `hc_log` VALUES ('980', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '127.0.0.1', '2015-06-15 16:22:56');
INSERT INTO `hc_log` VALUES ('981', '', '0', 'poster', '', 'space', '?m=poster&c=space&a=poster_template', '', '1', 'admin', '127.0.0.1', '2015-06-15 16:49:43');
INSERT INTO `hc_log` VALUES ('982', '', '0', 'poster', '', 'space', '?m=poster&c=space&a=poster_template', '', '1', 'admin', '127.0.0.1', '2015-06-15 16:49:47');
INSERT INTO `hc_log` VALUES ('983', '', '0', 'special', '', 'special', '?m=special&c=special&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-15 16:51:28');
INSERT INTO `hc_log` VALUES ('984', '', '0', 'special', '', 'special', '?m=special&c=special&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-15 16:51:30');
INSERT INTO `hc_log` VALUES ('985', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-15 16:52:08');
INSERT INTO `hc_log` VALUES ('986', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-15 16:54:08');
INSERT INTO `hc_log` VALUES ('987', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-15 16:54:11');
INSERT INTO `hc_log` VALUES ('988', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-15 16:56:32');
INSERT INTO `hc_log` VALUES ('989', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=listorder', '', '1', 'admin', '127.0.0.1', '2015-06-15 16:57:37');
INSERT INTO `hc_log` VALUES ('990', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-15 17:08:08');
INSERT INTO `hc_log` VALUES ('991', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-15 17:11:43');
INSERT INTO `hc_log` VALUES ('992', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2015-06-15 17:21:51');
INSERT INTO `hc_log` VALUES ('993', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '127.0.0.1', '2015-06-15 17:21:51');
INSERT INTO `hc_log` VALUES ('994', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2015-06-15 17:21:57');
INSERT INTO `hc_log` VALUES ('995', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-15 17:22:16');
INSERT INTO `hc_log` VALUES ('996', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-15 17:22:16');
INSERT INTO `hc_log` VALUES ('997', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-15 17:22:24');
INSERT INTO `hc_log` VALUES ('998', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-15 17:22:27');
INSERT INTO `hc_log` VALUES ('999', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-15 17:22:29');
INSERT INTO `hc_log` VALUES ('1000', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-15 17:22:30');
INSERT INTO `hc_log` VALUES ('1001', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-15 17:22:49');
INSERT INTO `hc_log` VALUES ('1002', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-15 17:23:41');
INSERT INTO `hc_log` VALUES ('1003', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-15 17:23:42');
INSERT INTO `hc_log` VALUES ('1004', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-15 17:23:42');
INSERT INTO `hc_log` VALUES ('1005', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-15 17:23:43');
INSERT INTO `hc_log` VALUES ('1006', '', '0', 'content', '', 'content', '?m=content&c=content&a=add_othors', '', '1', 'admin', '127.0.0.1', '2015-06-15 17:24:32');
INSERT INTO `hc_log` VALUES ('1007', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-15 17:24:51');
INSERT INTO `hc_log` VALUES ('1008', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-15 17:24:58');
INSERT INTO `hc_log` VALUES ('1009', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-15 17:26:17');
INSERT INTO `hc_log` VALUES ('1010', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-15 17:26:35');
INSERT INTO `hc_log` VALUES ('1011', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-15 17:29:59');
INSERT INTO `hc_log` VALUES ('1012', '', '0', 'content', '', 'content', '?m=content&c=content&a=listorder', '', '1', 'admin', '127.0.0.1', '2015-06-15 17:41:28');
INSERT INTO `hc_log` VALUES ('1013', '', '0', 'content', '', 'content', '?m=content&c=content&a=listorder', '', '1', 'admin', '127.0.0.1', '2015-06-15 17:41:42');
INSERT INTO `hc_log` VALUES ('1014', '', '0', 'content', '', 'content', '?m=content&c=content&a=listorder', '', '1', 'admin', '127.0.0.1', '2015-06-15 17:41:48');
INSERT INTO `hc_log` VALUES ('1015', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2015-06-16 08:31:26');
INSERT INTO `hc_log` VALUES ('1016', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2015-06-16 09:01:58');
INSERT INTO `hc_log` VALUES ('1017', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-16 09:49:18');
INSERT INTO `hc_log` VALUES ('1018', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-16 09:50:36');
INSERT INTO `hc_log` VALUES ('1019', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-16 09:50:54');
INSERT INTO `hc_log` VALUES ('1020', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-16 09:51:00');
INSERT INTO `hc_log` VALUES ('1021', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-16 09:51:35');
INSERT INTO `hc_log` VALUES ('1022', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-16 09:52:01');
INSERT INTO `hc_log` VALUES ('1023', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-16 09:52:21');
INSERT INTO `hc_log` VALUES ('1024', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2015-06-16 09:53:05');
INSERT INTO `hc_log` VALUES ('1025', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=batch_edit', '', '1', 'admin', '127.0.0.1', '2015-06-16 11:04:53');
INSERT INTO `hc_log` VALUES ('1026', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=batch_edit', '', '1', 'admin', '127.0.0.1', '2015-06-16 11:04:53');
INSERT INTO `hc_log` VALUES ('1027', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=batch_edit', '', '1', 'admin', '127.0.0.1', '2015-06-16 11:05:02');
INSERT INTO `hc_log` VALUES ('1028', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-16 11:08:02');
INSERT INTO `hc_log` VALUES ('1029', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-16 11:08:02');
INSERT INTO `hc_log` VALUES ('1030', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-16 11:08:08');
INSERT INTO `hc_log` VALUES ('1031', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-16 11:08:08');
INSERT INTO `hc_log` VALUES ('1032', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-16 11:08:18');
INSERT INTO `hc_log` VALUES ('1033', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=batch_edit', '', '1', 'admin', '127.0.0.1', '2015-06-16 11:09:23');
INSERT INTO `hc_log` VALUES ('1034', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=batch_edit', '', '1', 'admin', '127.0.0.1', '2015-06-16 11:09:23');
INSERT INTO `hc_log` VALUES ('1035', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=batch_edit', '', '1', 'admin', '127.0.0.1', '2015-06-16 11:09:39');
INSERT INTO `hc_log` VALUES ('1036', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=batch_edit', '', '1', 'admin', '127.0.0.1', '2015-06-16 11:10:29');
INSERT INTO `hc_log` VALUES ('1037', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-16 11:10:35');
INSERT INTO `hc_log` VALUES ('1038', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-16 11:10:35');
INSERT INTO `hc_log` VALUES ('1039', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-16 11:10:58');
INSERT INTO `hc_log` VALUES ('1040', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-16 11:11:13');
INSERT INTO `hc_log` VALUES ('1041', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-16 11:11:13');
INSERT INTO `hc_log` VALUES ('1042', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=batch_edit', '', '1', 'admin', '127.0.0.1', '2015-06-16 11:11:47');
INSERT INTO `hc_log` VALUES ('1043', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=batch_edit', '', '1', 'admin', '127.0.0.1', '2015-06-16 11:11:48');
INSERT INTO `hc_log` VALUES ('1044', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=batch_edit', '', '1', 'admin', '127.0.0.1', '2015-06-16 11:11:58');
INSERT INTO `hc_log` VALUES ('1045', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=batch_edit', '', '1', 'admin', '127.0.0.1', '2015-06-16 11:11:58');
INSERT INTO `hc_log` VALUES ('1046', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=batch_edit', '', '1', 'admin', '127.0.0.1', '2015-06-16 11:12:10');
INSERT INTO `hc_log` VALUES ('1047', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-16 11:13:30');
INSERT INTO `hc_log` VALUES ('1048', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-16 11:13:30');
INSERT INTO `hc_log` VALUES ('1049', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-16 11:13:50');
INSERT INTO `hc_log` VALUES ('1050', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-16 11:13:55');
INSERT INTO `hc_log` VALUES ('1051', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-16 11:13:55');
INSERT INTO `hc_log` VALUES ('1052', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-16 11:14:00');
INSERT INTO `hc_log` VALUES ('1053', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-16 11:14:15');
INSERT INTO `hc_log` VALUES ('1054', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-16 11:14:16');
INSERT INTO `hc_log` VALUES ('1055', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-16 11:15:31');
INSERT INTO `hc_log` VALUES ('1056', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-16 11:15:31');
INSERT INTO `hc_log` VALUES ('1057', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-16 11:15:41');
INSERT INTO `hc_log` VALUES ('1058', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-16 11:15:47');
INSERT INTO `hc_log` VALUES ('1059', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-16 11:15:48');
INSERT INTO `hc_log` VALUES ('1060', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-16 11:15:52');
INSERT INTO `hc_log` VALUES ('1061', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-16 11:15:56');
INSERT INTO `hc_log` VALUES ('1062', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-16 11:15:56');
INSERT INTO `hc_log` VALUES ('1063', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-16 11:16:00');
INSERT INTO `hc_log` VALUES ('1064', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-16 11:16:06');
INSERT INTO `hc_log` VALUES ('1065', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-16 11:16:06');
INSERT INTO `hc_log` VALUES ('1066', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-16 11:16:20');
INSERT INTO `hc_log` VALUES ('1067', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-16 11:17:45');
INSERT INTO `hc_log` VALUES ('1068', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-16 11:17:45');
INSERT INTO `hc_log` VALUES ('1069', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-16 11:18:12');
INSERT INTO `hc_log` VALUES ('1070', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-16 11:18:38');
INSERT INTO `hc_log` VALUES ('1071', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-16 11:18:38');
INSERT INTO `hc_log` VALUES ('1072', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-16 11:19:41');
INSERT INTO `hc_log` VALUES ('1073', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-16 11:19:41');
INSERT INTO `hc_log` VALUES ('1074', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-16 14:07:51');
INSERT INTO `hc_log` VALUES ('1075', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-16 14:07:51');
INSERT INTO `hc_log` VALUES ('1076', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-16 14:08:09');
INSERT INTO `hc_log` VALUES ('1077', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=batch_edit', '', '1', 'admin', '127.0.0.1', '2015-06-16 14:08:43');
INSERT INTO `hc_log` VALUES ('1078', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=batch_edit', '', '1', 'admin', '127.0.0.1', '2015-06-16 14:08:44');
INSERT INTO `hc_log` VALUES ('1079', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=batch_edit', '', '1', 'admin', '127.0.0.1', '2015-06-16 14:08:55');
INSERT INTO `hc_log` VALUES ('1080', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=batch_edit', '', '1', 'admin', '127.0.0.1', '2015-06-16 14:09:13');
INSERT INTO `hc_log` VALUES ('1081', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-16 14:55:50');
INSERT INTO `hc_log` VALUES ('1082', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-16 14:59:28');
INSERT INTO `hc_log` VALUES ('1083', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', '1', 'admin', '127.0.0.1', '2015-06-16 14:59:29');

-- ----------------------------
-- Table structure for `hc_member`
-- ----------------------------
DROP TABLE IF EXISTS `hc_member`;
CREATE TABLE `hc_member` (
  `userid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `phpssouid` mediumint(8) unsigned NOT NULL,
  `username` char(20) NOT NULL DEFAULT '',
  `password` char(32) NOT NULL DEFAULT '',
  `encrypt` char(6) NOT NULL,
  `nickname` char(20) NOT NULL,
  `regdate` int(10) unsigned NOT NULL DEFAULT '0',
  `lastdate` int(10) unsigned NOT NULL DEFAULT '0',
  `regip` char(15) NOT NULL DEFAULT '',
  `lastip` char(15) NOT NULL DEFAULT '',
  `loginnum` smallint(5) unsigned NOT NULL DEFAULT '0',
  `email` char(32) NOT NULL DEFAULT '',
  `groupid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `areaid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `amount` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `point` smallint(5) unsigned NOT NULL DEFAULT '0',
  `modelid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `message` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `islock` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `vip` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `overduedate` int(10) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '1',
  `connectid` char(40) NOT NULL DEFAULT '',
  `from` char(10) NOT NULL DEFAULT '',
  `mobile` char(11) NOT NULL DEFAULT '',
  PRIMARY KEY (`userid`),
  UNIQUE KEY `username` (`username`) USING BTREE,
  KEY `email` (`email`(20)) USING BTREE,
  KEY `phpssouid` (`phpssouid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hc_member
-- ----------------------------
INSERT INTO `hc_member` VALUES ('1', '1', 'linzq0507', 'b281361a1c0e66941feda3e34663b5de', 'IMRerA', 'hello', '1428902200', '1428902200', '127.0.0.1', '', '0', 'linzq0507@163.com', '2', '0', '0.00', '0', '10', '0', '0', '0', '0', '1', '', '', '');

-- ----------------------------
-- Table structure for `hc_member_detail`
-- ----------------------------
DROP TABLE IF EXISTS `hc_member_detail`;
CREATE TABLE `hc_member_detail` (
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `birthday` date DEFAULT NULL,
  UNIQUE KEY `userid` (`userid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hc_member_detail
-- ----------------------------
INSERT INTO `hc_member_detail` VALUES ('1', '2015-04-02');

-- ----------------------------
-- Table structure for `hc_member_group`
-- ----------------------------
DROP TABLE IF EXISTS `hc_member_group`;
CREATE TABLE `hc_member_group` (
  `groupid` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(15) NOT NULL,
  `issystem` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `starnum` tinyint(2) unsigned NOT NULL,
  `point` smallint(6) unsigned NOT NULL,
  `allowmessage` smallint(5) unsigned NOT NULL DEFAULT '0',
  `allowvisit` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allowpost` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allowpostverify` tinyint(1) unsigned NOT NULL,
  `allowsearch` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allowupgrade` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `allowsendmessage` tinyint(1) unsigned NOT NULL,
  `allowpostnum` smallint(5) unsigned NOT NULL DEFAULT '0',
  `allowattachment` tinyint(1) NOT NULL,
  `price_y` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `price_m` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `price_d` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `icon` char(30) NOT NULL,
  `usernamecolor` char(7) NOT NULL,
  `description` char(100) NOT NULL,
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`groupid`),
  KEY `disabled` (`disabled`) USING BTREE,
  KEY `listorder` (`sort`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hc_member_group
-- ----------------------------
INSERT INTO `hc_member_group` VALUES ('8', '游客', '1', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0.00', '0.00', '0.00', '', '', '', '0', '0');
INSERT INTO `hc_member_group` VALUES ('2', '新手上路', '1', '1', '50', '100', '1', '1', '0', '0', '0', '1', '0', '0', '50.00', '10.00', '1.00', '', '', '', '2', '0');
INSERT INTO `hc_member_group` VALUES ('6', '注册会员', '1', '2', '100', '150', '0', '1', '0', '0', '1', '1', '0', '0', '300.00', '30.00', '1.00', '', '', '', '6', '0');
INSERT INTO `hc_member_group` VALUES ('4', '中级会员', '1', '3', '150', '500', '1', '1', '0', '1', '1', '1', '0', '0', '500.00', '60.00', '1.00', '', '', '', '4', '0');
INSERT INTO `hc_member_group` VALUES ('5', '高级会员', '1', '5', '300', '999', '1', '1', '0', '1', '1', '1', '0', '0', '360.00', '90.00', '5.00', '', '', '', '5', '0');
INSERT INTO `hc_member_group` VALUES ('1', '禁止访问', '1', '0', '0', '0', '1', '1', '0', '1', '0', '0', '0', '0', '0.00', '0.00', '0.00', '', '', '0', '0', '0');
INSERT INTO `hc_member_group` VALUES ('7', '邮件认证', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', 'images/group/vip.jpg', '#000000', '', '7', '0');

-- ----------------------------
-- Table structure for `hc_member_menu`
-- ----------------------------
DROP TABLE IF EXISTS `hc_member_menu`;
CREATE TABLE `hc_member_menu` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(40) NOT NULL DEFAULT '',
  `parentid` smallint(6) NOT NULL DEFAULT '0',
  `m` char(20) NOT NULL DEFAULT '',
  `c` char(20) NOT NULL DEFAULT '',
  `a` char(20) NOT NULL DEFAULT '',
  `data` char(100) NOT NULL DEFAULT '',
  `listorder` smallint(6) unsigned NOT NULL DEFAULT '0',
  `display` enum('1','0') NOT NULL DEFAULT '1',
  `isurl` enum('1','0') NOT NULL DEFAULT '0',
  `url` char(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `listorder` (`listorder`) USING BTREE,
  KEY `parentid` (`parentid`) USING BTREE,
  KEY `module` (`m`,`c`,`a`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hc_member_menu
-- ----------------------------

-- ----------------------------
-- Table structure for `hc_member_verify`
-- ----------------------------
DROP TABLE IF EXISTS `hc_member_verify`;
CREATE TABLE `hc_member_verify` (
  `userid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `username` char(20) NOT NULL,
  `password` char(32) NOT NULL,
  `encrypt` char(6) NOT NULL,
  `nickname` char(20) NOT NULL,
  `regdate` int(10) unsigned NOT NULL,
  `regip` char(15) NOT NULL,
  `email` char(32) NOT NULL,
  `modelid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `point` smallint(5) unsigned NOT NULL DEFAULT '0',
  `amount` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `modelinfo` char(255) NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `siteid` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `message` char(100) DEFAULT NULL,
  `mobile` char(11) NOT NULL DEFAULT '',
  PRIMARY KEY (`userid`),
  UNIQUE KEY `username` (`username`) USING BTREE,
  KEY `email` (`email`(20)) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hc_member_verify
-- ----------------------------

-- ----------------------------
-- Table structure for `hc_member_vip`
-- ----------------------------
DROP TABLE IF EXISTS `hc_member_vip`;
CREATE TABLE `hc_member_vip` (
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `userid` (`userid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hc_member_vip
-- ----------------------------

-- ----------------------------
-- Table structure for `hc_menu`
-- ----------------------------
DROP TABLE IF EXISTS `hc_menu`;
CREATE TABLE `hc_menu` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(40) NOT NULL DEFAULT '',
  `parentid` smallint(6) NOT NULL DEFAULT '0',
  `m` char(20) NOT NULL DEFAULT '',
  `c` char(20) NOT NULL DEFAULT '',
  `a` char(20) NOT NULL DEFAULT '',
  `data` char(100) NOT NULL DEFAULT '',
  `listorder` smallint(6) unsigned NOT NULL DEFAULT '0',
  `display` enum('1','0') NOT NULL DEFAULT '1',
  `project1` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `project2` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `project3` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `project4` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `project5` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `listorder` (`listorder`) USING BTREE,
  KEY `parentid` (`parentid`) USING BTREE,
  KEY `module` (`m`,`c`,`a`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=1577 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hc_menu
-- ----------------------------
INSERT INTO `hc_menu` VALUES ('1', 'sys_setting', '0', 'admin', 'setting', 'init', '', '1', '1', '0', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('2', 'module', '0', 'admin', 'module', 'init', '', '2', '1', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('872', 'sync_release_point', '873', 'release', 'index', 'init', '', '3', '1', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('4', 'content', '0', 'content', 'content', 'init', '', '4', '1', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('5', 'members', '0', 'member', 'member', 'init', '', '5', '1', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('6', 'userinterface', '0', 'template', 'style', 'init', '', '6', '1', '0', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('30', 'correlative_setting', '1', 'admin', 'admin', 'admin', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('31', 'menu_manage', '977', 'admin', 'menu', 'init', '', '8', '1', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('32', 'posid_manage', '975', 'admin', 'position', 'init', '', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('29', 'module_manage', '2', 'admin', 'module', '', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('10', 'panel', '0', 'admin', 'index', 'public_main', '', '0', '1', '0', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('35', 'menu_add', '31', 'admin', 'menu', 'add', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('826', 'template_manager', '6', '', '', '', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('54', 'admin_manage', '49', 'admin', 'admin_manage', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('43', 'category_manage', '975', 'admin', 'category', 'init', 'module=admin', '4', '1', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('42', 'add_category', '43', 'admin', 'category', 'add', 's=0', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('44', 'edit_category', '43', 'admin', 'category', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('45', 'badword_manage', '977', 'admin', 'badword', 'init', '', '10', '1', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('46', 'posid_add', '32', 'admin', 'position', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('49', 'admin_setting', '1', 'admin', '', '', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('50', 'role_manage', '49', 'admin', 'role', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('51', 'role_add', '50', 'admin', 'role', 'add', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('52', 'category_cache', '43', 'admin', 'category', 'public_cache', 'module=admin', '4', '1', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('55', 'manage_member', '5', 'member', 'member', 'manage', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('58', 'admin_add', '54', 'admin', 'admin_manage', 'add', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('59', 'model_manage', '975', 'content', 'sitemodel', 'init', '', '5', '1', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('64', 'site_management', '30', 'admin', 'site', 'init', '', '2', '1', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('81', 'member_add', '72', 'member', 'member', 'add', '', '2', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('62', 'add_model', '59', 'content', 'sitemodel', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('65', 'release_point_management', '30', 'admin', 'release_point', 'init', '', '3', '1', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('66', 'badword_export', '45', 'admin', 'badword', 'export', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('67', 'add_site', '64', 'admin', 'site', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('68', 'badword_import', '45', 'admin', 'badword', 'import', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('812', 'member_group_manage', '76', 'member', 'member_group', 'manage', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('74', 'member_verify', '55', 'member', 'member_verify', 'manage', 's=0', '3', '1', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('76', 'manage_member_group', '5', 'member', 'member_group', 'manage', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('77', 'manage_member_model', '5', 'member', 'member_model', 'manage', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('78', 'member_group_add', '812', 'member', 'member_group', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('79', 'member_model_add', '813', 'member', 'member_model', 'add', '', '1', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('80', 'member_model_import', '77', 'member', 'member_model', 'import', '', '2', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('72', 'member_manage', '55', 'member', 'member', 'manage', '', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('813', 'member_model_manage', '77', 'member', 'member_model', 'manage', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('814', 'site_edit', '64', 'admin', 'site', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('815', 'site_del', '64', 'admin', 'site', 'del', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('816', 'release_point_add', '65', 'admin', 'release_point', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('817', 'release_point_del', '65', 'admin', 'release_point', 'del', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('818', 'release_point_edit', '65', 'admin', 'release_point', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('821', 'content_publish', '4', 'content', 'content', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('822', 'content_manage', '821', 'content', 'content', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('867', 'linkage', '977', 'admin', 'linkage', 'init', '', '13', '1', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('827', 'template_style', '826', 'template', 'style', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('828', 'import_style', '827', 'template', 'style', 'import', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('831', 'template_export', '827', 'template', 'style', 'export', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('830', 'template_file', '827', 'template', 'file', 'init', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('832', 'template_onoff', '827', 'template', 'style', 'disable', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('833', 'template_updatename', '827', 'template', 'style', 'updatename', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('834', 'member_lock', '72', 'member', 'member', 'lock', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('835', 'member_unlock', '72', 'member', 'member', 'unlock', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('836', 'member_move', '72', 'member', 'member', 'move', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('837', 'member_delete', '72', 'member', 'member', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('842', 'verify_ignore', '74', 'member', 'member_verify', 'manage', 's=2', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('839', 'member_setting', '55', 'member', 'member_setting', 'manage', '', '4', '1', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('841', 'verify_pass', '74', 'member', 'member_verify', 'manage', 's=1', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('843', 'verify_delete', '74', 'member', 'member_verify', 'manage', 's=3', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('844', 'verify_deny', '74', 'member', 'member_verify', 'manage', 's=4', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('845', 'never_pass', '74', 'member', 'member_verify', 'manage', 's=5', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('846', 'template_file_list', '827', 'template', 'file', 'init', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('847', 'template_file_edit', '827', 'template', 'file', 'edit_file', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('848', 'file_add_file', '827', 'template', 'file', 'add_file', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('850', 'listorder', '76', 'member', 'member_group', 'sort', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('852', 'priv_setting', '50', 'admin', 'role', 'priv_setting', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('853', 'role_priv', '50', 'admin', 'role', 'role_priv', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('857', 'attachment_manage', '821', 'attachment', 'manage', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('868', 'special', '821', 'special', 'special', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('869', 'template_editor', '827', 'template', 'file', 'edit_file', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('870', 'template_visualization', '827', 'template', 'file', 'visualization', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('871', 'pc_tag_edit', '827', 'template', 'file', 'edit_pc_tag', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('873', 'release_manage', '4', 'release', 'html', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('874', 'type_manage', '975', 'content', 'type_manage', 'init', '', '6', '1', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('875', 'add_type', '874', 'content', 'type_manage', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('876', 'linkageadd', '867', 'admin', 'linkage', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('877', 'failure_list', '872', 'release', 'index', 'failed', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('879', 'member_search', '72', 'member', 'member', 'search', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('880', 'queue_del', '872', 'release', 'index', 'del', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('881', 'member_model_delete', '813', 'member', 'member_model', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('882', 'member_model_edit', '813', 'member', 'member_model', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('885', 'workflow', '977', 'content', 'workflow', 'init', '', '15', '1', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('888', 'add_workflow', '885', 'content', 'workflow', 'add', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('889', 'member_modelfield_add', '813', 'member', 'member_modelfield', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('890', 'member_modelfield_edit', '813', 'member', 'member_modelfield', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('891', 'member_modelfield_delete', '813', 'member', 'member_modelfield', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('892', 'member_modelfield_manage', '813', 'member', 'member_modelfield', 'manage', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('895', 'sitemodel_import', '59', 'content', 'sitemodel', 'import', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('896', 'pay', '29', 'pay', 'payment', 'pay_list', 's=3', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('897', 'payments', '896', 'pay', 'payment', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('898', 'paylist', '896', 'pay', 'payment', 'pay_list', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('899', 'add_content', '822', 'content', 'content', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('900', 'modify_deposit', '896', 'pay', 'payment', 'modify_deposit', 's=1', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('901', 'check_content', '822', 'content', 'content', 'pass', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('902', 'dbsource', '29', 'dbsource', 'data', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('905', 'create_content_html', '873', 'content', 'create_html', 'show', '', '2', '1', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('904', 'external_data_sources', '902', 'dbsource', 'dbsource_admin', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('906', 'update_urls', '873', 'content', 'create_html', 'update_urls', '', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('960', 'node_add', '957', 'collection', 'node', 'add', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('909', 'fulltext_search', '29', 'search', 'search_type', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('910', 'manage_type', '909', 'search', 'search_type', 'init', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('911', 'search_setting', '909', 'search', 'search_admin', 'setting', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('912', 'createindex', '909', 'search', 'search_admin', 'createindex', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('913', 'add_search_type', '909', 'search', 'search_type', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('914', 'database_toos', '977', 'admin', 'database', 'export', '', '6', '1', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('915', 'database_export', '914', 'admin', 'database', 'export', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('916', 'database_import', '914', 'admin', 'database', 'import', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('917', 'dbsource_add', '902', 'dbsource', 'dbsource_admin', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('918', 'dbsource_edit', '902', 'dbsource', 'dbsource_admin', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('919', 'dbsource_del', '902', 'dbsource', 'dbsource_admin', 'del', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('920', 'dbsource_data_add', '902', 'dbsource', 'data', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('921', 'dbsource_data_edit', '902', 'dbsource', 'data', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('922', 'dbsource_data_del', '902', 'dbsource', 'data', 'del', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('926', 'add_special', '868', 'special', 'special', 'add', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('927', 'edit_special', '868', 'special', 'special', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('928', 'special_list', '868', 'special', 'special', 'init', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('929', 'special_elite', '868', 'special', 'special', 'elite', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('930', 'delete_special', '868', 'special', 'special', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('931', 'badword_add', '45', 'admin', 'badword', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('932', 'badword_edit', '45', 'admin', 'badword', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('933', 'badword_delete', '45', 'admin', 'badword', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('934', 'special_listorder', '868', 'special', 'special', 'listorder', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('935', 'special_content_list', '868', 'special', 'content', 'init', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('936', 'special_content_add', '935', 'special', 'content', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('937', 'special_content_list', '935', 'special', 'content', 'init', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('938', 'special_content_edit', '935', 'special', 'content', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('939', 'special_content_delete', '935', 'special', 'content', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('940', 'special_content_listorder', '935', 'special', 'content', 'listorder', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('941', 'special_content_import', '935', 'special', 'special', 'import', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('942', 'history_version', '827', 'template', 'template_bak', 'init', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('943', 'restore_version', '827', 'template', 'template_bak', 'restore', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('944', 'del_history_version', '827', 'template', 'template_bak', 'del', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('945', 'block', '821', 'block', 'block_admin', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('946', 'block_add', '945', 'block', 'block_admin', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('950', 'block_edit', '945', 'block', 'block_admin', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('951', 'block_del', '945', 'block', 'block_admin', 'del', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('952', 'block_update', '945', 'block', 'block_admin', 'block_update', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('953', 'block_restore', '945', 'block', 'block_admin', 'history_restore', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('954', 'history_del', '945', 'block', 'block_admin', 'history_del', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('978', 'urlrule_manage', '977', 'admin', 'urlrule', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('957', 'collection_node', '821', 'collection', 'node', 'manage', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('979', 'safe_config', '30', 'admin', 'setting', 'init', '&tab=2', '11', '1', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('959', 'basic_config', '30', 'admin', 'setting', 'init', '', '10', '1', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('961', 'position_edit', '32', 'admin', 'position', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('962', 'collection_node_edit', '957', 'collection', 'node', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('963', 'collection_node_delete', '957', 'collection', 'node', 'del', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('990', 'col_url_list', '957', 'collection', 'node', 'col_url_list', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('965', 'collection_node_publish', '957', 'collection', 'node', 'publist', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('966', 'collection_node_import', '957', 'collection', 'node', 'node_import', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('967', 'collection_node_export', '957', 'collection', 'node', 'export', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('968', 'collection_node_collection_content', '957', 'collection', 'node', 'col_content', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('969', 'googlesitemap', '977', 'admin', 'googlesitemap', 'set', '', '11', '1', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('970', 'admininfo', '10', 'admin', 'admin_manage', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('971', 'editpwd', '970', 'admin', 'admin_manage', 'public_edit_pwd', '', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('972', 'editinfo', '970', 'admin', 'admin_manage', 'public_edit_info', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('973', 'keylink', '977', 'admin', 'keylink', 'init', '', '12', '1', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('974', 'add_keylink', '973', 'admin', 'keylink', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('975', 'content_settings', '4', 'content', 'content_settings', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('7', 'extend', '0', 'admin', 'extend', 'init_extend', '', '7', '1', '0', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('977', 'extend_all', '7', 'admin', 'extend_all', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('980', 'sso_config', '30', 'admin', 'setting', 'init', '&tab=3', '12', '1', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('981', 'email_config', '30', 'admin', 'setting', 'init', '&tab=4', '13', '1', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('982', 'module_manage', '29', 'admin', 'module', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('983', 'ipbanned', '977', 'admin', 'ipbanned', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('984', 'add_ipbanned', '983', 'admin', 'ipbanned', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('993', 'collection_content_import', '957', 'collection', 'node', 'import', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('991', 'copy_node', '957', 'collection', 'node', 'copy', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('992', 'content_del', '957', 'collection', 'node', 'content_del', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('989', 'downsites', '977', 'admin', 'downservers', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('994', 'import_program_add', '957', 'collection', 'node', 'import_program_add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('995', 'import_program_del', '957', 'collection', 'node', 'import_program_del', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('996', 'import_content', '957', 'collection', 'node', 'import_content', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('997', 'log', '977', 'admin', 'log', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('998', 'add_page', '43', 'admin', 'category', 'add', 's=1', '2', '1', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('999', 'add_cat_link', '43', 'admin', 'category', 'add', 's=2', '2', '1', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('1000', 'count_items', '43', 'admin', 'category', 'count_items', '', '5', '1', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('1001', 'cache_all', '977', 'admin', 'cache_all', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('1002', 'create_list_html', '873', 'content', 'create_html', 'category', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('1003', 'create_html_quick', '10', 'content', 'create_html_opt', 'index', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('1004', 'create_index', '1003', 'content', 'create_html', 'public_index', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('1005', 'scan', '977', 'scan', 'index', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('1006', 'scan_report', '1005', 'scan', 'index', 'scan_report', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('1007', 'md5_creat', '1005', 'scan', 'index', 'md5_creat', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('1008', 'album_import', '868', 'special', 'album', 'import', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('8', 'phpsso', '0', 'admin', 'phpsso', 'menu', '', '7', '0', '0', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('1011', 'edit_content', '822', 'content', 'content', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('1012', 'push_to_special', '822', 'content', 'push', 'init', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('1023', 'delete_log', '997', 'admin', 'log', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('1024', 'delete_ip', '983', 'admin', 'ipbanned', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('1026', 'delete_keylink', '973', 'admin', 'keylink', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('1027', 'edit_keylink', '973', 'admin', 'keylink', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('1034', 'operation_pass', '74', 'member', 'member_verify', 'pass', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('1035', 'operation_delete', '74', 'member', 'member_verify', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('1039', 'operation_ignore', '74', 'member', 'member_verify', 'ignore', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('1038', 'settingsave', '30', 'admin', 'setting', 'save', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('1040', 'admin_edit', '54', 'admin', 'admin_manage', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('1041', 'operation_reject', '74', 'member', 'member_verify', 'reject', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('1042', 'admin_delete', '54', 'admin', 'admin_manage', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('1043', 'card', '54', 'admin', 'admin_manage', 'card', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('1044', 'creat_card', '54', 'admin', 'admin_manage', 'creat_card', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('1045', 'remove_card', '54', 'admin', 'admin_manage', 'remove_card', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('1049', 'member_group_edit', '812', 'member', 'member_group', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('1048', 'member_edit', '72', 'member', 'member', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('1050', 'role_edit', '50', 'admin', 'role', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('1051', 'member_group_delete', '812', 'member', 'member_group', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('1052', 'member_manage', '50', 'admin', 'role', 'member_manage', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('1053', 'role_delete', '50', 'admin', 'role', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('1054', 'member_model_export', '77', 'member', 'member_model', 'export', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('1055', 'member_model_sort', '77', 'member', 'member_model', 'sort', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('1056', 'member_model_move', '77', 'member', 'member_model', 'move', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('1057', 'payment_add', '897', 'pay', 'payment', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('1058', 'payment_delete', '897', 'pay', 'payment', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('1059', 'payment_edit', '897', 'pay', 'payment', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('1060', 'spend_record', '896', 'pay', 'spend', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('1061', 'pay_stat', '896', 'pay', 'payment', 'pay_stat', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('1062', 'fields_manage', '59', 'content', 'sitemodel_field', 'init', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('1063', 'edit_model_content', '59', 'content', 'sitemodel', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('1064', 'disabled_model', '59', 'content', 'sitemodel', 'disabled', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('1065', 'delete_model', '59', 'content', 'sitemodel', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('1066', 'export_model', '59', 'content', 'sitemodel', 'export', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('1067', 'delete', '874', 'content', 'type_manage', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('1068', 'edit', '874', 'content', 'type_manage', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('1069', 'add_urlrule', '978', 'admin', 'urlrule', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('1070', 'edit_urlrule', '978', 'admin', 'urlrule', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('1071', 'delete_urlrule', '978', 'admin', 'urlrule', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('1072', 'edit_menu', '31', 'admin', 'menu', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('1073', 'delete_menu', '31', 'admin', 'menu', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('1074', 'edit_workflow', '885', 'content', 'workflow', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('1075', 'delete_workflow', '885', 'content', 'workflow', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('1076', 'creat_html', '868', 'special', 'special', 'html', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('1093', 'connect_config', '30', 'admin', 'setting', 'init', '&tab=5', '14', '1', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('1102', 'view_modelinfo', '74', 'member', 'member_verify', 'modelinfo', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('1202', 'create_special_list', '868', 'special', 'special', 'create_special_list', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('1240', 'view_memberlinfo', '72', 'member', 'member', 'memberinfo', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('1239', 'copyfrom_manage', '977', 'admin', 'copyfrom', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('1241', 'move_content', '822', 'content', 'content', 'remove', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('1242', 'poster_template', '56', 'poster', 'space', 'poster_template', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('1243', 'create_index', '873', 'content', 'create_html', 'public_index', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('1244', 'add_othors', '822', 'content', 'content', 'add_othors', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('1295', 'attachment_manager_dir', '857', 'attachment', 'manage', 'dir', '', '2', '1', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('1296', 'attachment_manager_db', '857', 'attachment', 'manage', 'init', '', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('1346', 'attachment_address_replace', '857', 'attachment', 'address', 'init', '', '3', '1', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('1347', 'attachment_address_update', '857', 'attachment', 'address', 'update', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('1348', 'delete_content', '822', 'content', 'content', 'delete', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('1349', 'member_menu_manage', '977', 'member', 'member_menu', 'manage', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('1350', 'member_menu_add', '1349', 'member', 'member_menu', 'add', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('1351', 'member_menu_edit', '1349', 'member', 'member_menu', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('1352', 'member_menu_delete', '1349', 'member', 'member_menu', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('1353', 'batch_show', '822', 'content', 'create_html', 'batch_show', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('1354', 'pay_delete', '898', 'pay', 'payment', 'pay_del', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('1355', 'pay_cancel', '898', 'pay', 'payment', 'pay_cancel', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('1356', 'discount', '898', 'pay', 'payment', 'discount', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('1360', 'category_batch_edit', '43', 'admin', 'category', 'batch_edit', '', '6', '1', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('1500', 'listorder', '822', 'content', 'content', 'listorder', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('1501', 'a_clean_data', '873', 'content', 'content', 'clear_data', '', '0', '1', '0', '0', '0', '0', '0');
INSERT INTO `hc_menu` VALUES ('1502', 'announce', '29', 'announce', 'admin_announce', 'init', 's=1', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('1503', 'announce_add', '1502', 'announce', 'admin_announce', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('1504', 'edit_announce', '1502', 'announce', 'admin_announce', 'edit', 's=1', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('1505', 'check_announce', '1502', 'announce', 'admin_announce', 'init', 's=2', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('1506', 'overdue', '1502', 'announce', 'admin_announce', 'init', 's=3', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('1507', 'del_announce', '1502', 'announce', 'admin_announce', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('1512', 'link', '29', 'link', 'link', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('1513', 'add_link', '1512', 'link', 'link', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('1514', 'edit_link', '1512', 'link', 'link', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('1515', 'delete_link', '1512', 'link', 'link', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('1516', 'link_setting', '1512', 'link', 'link', 'setting', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('1517', 'add_type', '1512', 'link', 'link', 'add_type', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('1518', 'list_type', '1512', 'link', 'link', 'list_type', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('1519', 'check_register', '1512', 'link', 'link', 'check_register', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('1535', 'poster', '29', 'poster', 'space', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('1536', 'add_space', '1535', 'poster', 'space', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('1537', 'edit_space', '1535', 'poster', 'space', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('1538', 'del_space', '1535', 'poster', 'space', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('1539', 'poster_list', '1535', 'poster', 'poster', 'init', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('1540', 'add_poster', '1535', 'poster', 'poster', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('1541', 'edit_poster', '1535', 'poster', 'poster', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('1542', 'del_poster', '1535', 'poster', 'poster', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('1543', 'poster_stat', '1535', 'poster', 'poster', 'stat', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('1544', 'poster_setting', '1535', 'poster', 'space', 'setting', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('1545', 'create_poster_js', '1535', 'poster', 'space', 'create_js', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('1546', 'poster_template', '1535', 'poster', 'space', 'poster_template', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('1547', 'formguide', '29', 'formguide', 'formguide', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('1548', 'formguide_add', '1547', 'formguide', 'formguide', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('1549', 'formguide_edit', '1547', 'formguide', 'formguide', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('1550', 'form_info_list', '1547', 'formguide', 'formguide_info', 'init', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('1551', 'formguide_disabled', '1547', 'formguide', 'formguide', 'disabled', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('1552', 'formguide_delete', '1547', 'formguide', 'formguide', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('1553', 'formguide_stat', '1547', 'formguide', 'formguide', 'stat', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('1554', 'add_public_field', '1547', 'formguide', 'formguide_field', 'add', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('1555', 'list_public_field', '1547', 'formguide', 'formguide_field', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('1556', 'module_setting', '1547', 'formguide', 'formguide', 'setting', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('1557', 'wap', '29', 'wap', 'wap_admin', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('1558', 'wap_add', '1557', 'wap', 'wap_admin', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('1559', 'wap_edit', '1557', 'wap', 'wap_admin', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('1560', 'wap_delete', '1557', 'wap', 'wap_admin', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('1561', 'wap_type_manage', '1557', 'wap', 'wap_admin', 'type_manage', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('1562', 'wap_type_edit', '1557', 'wap', 'wap_admin', 'type_edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('1563', 'wap_type_delete', '1557', 'wap', 'wap_admin', 'type_delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('1564', 'upgrade', '977', 'upgrade', 'index', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('1565', 'checkfile', '1564', 'upgrade', 'index', 'checkfile', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('1566', 'tag', '826', 'tag', 'tag', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('1567', 'add_tag', '1566', 'tag', 'tag', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('1568', 'edit_tag', '1566', 'tag', 'tag', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('1569', 'delete_tag', '1566', 'tag', 'tag', 'del', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `hc_menu` VALUES ('1570', 'tag_lists', '1566', 'tag', 'tag', 'lists', '', '0', '0', '1', '1', '1', '1', '1');

-- ----------------------------
-- Table structure for `hc_model`
-- ----------------------------
DROP TABLE IF EXISTS `hc_model`;
CREATE TABLE `hc_model` (
  `modelid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `name` char(30) NOT NULL,
  `description` char(100) NOT NULL,
  `tablename` char(20) NOT NULL,
  `setting` text NOT NULL,
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  `items` smallint(5) unsigned NOT NULL DEFAULT '0',
  `enablesearch` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `default_style` char(30) NOT NULL,
  `category_template` char(30) NOT NULL,
  `list_template` char(30) NOT NULL,
  `show_template` char(30) NOT NULL,
  `js_template` varchar(30) NOT NULL,
  `admin_list_template` char(30) NOT NULL,
  `member_add_template` varchar(30) NOT NULL,
  `member_list_template` varchar(30) NOT NULL,
  `sort` tinyint(3) NOT NULL,
  `type` tinyint(1) NOT NULL,
  PRIMARY KEY (`modelid`),
  KEY `type` (`type`,`siteid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hc_model
-- ----------------------------
INSERT INTO `hc_model` VALUES ('1', '1', '文章模型', '', 'news', '', '0', '0', '1', '0', 'default', 'category', 'list', 'show', '', '', '', '', '0', '0');
INSERT INTO `hc_model` VALUES ('2', '1', '下载模型', '', 'download', '', '0', '0', '1', '0', 'default', 'category_download', 'list_download', 'show_download', '', '', '', '', '0', '0');
INSERT INTO `hc_model` VALUES ('3', '1', '图片模型', '', 'picture', '', '0', '0', '1', '0', 'default', 'category_picture', 'list_picture', 'show_picture', '', '', '', '', '0', '0');
INSERT INTO `hc_model` VALUES ('10', '1', '普通会员', '普通会员', 'member_detail', '', '0', '0', '1', '0', '', '', '', '', '', '', '', '', '0', '2');
INSERT INTO `hc_model` VALUES ('11', '1', '视频模型', '', 'video', '', '0', '0', '1', '0', 'default', 'category_video', 'list_video', 'show_video', '', '', '', '', '0', '0');
INSERT INTO `hc_model` VALUES ('12', '1', '产品', '产品', 'product', '', '0', '0', '1', '0', 'hucai', 'category_picture', 'list_picture', 'show_picture', '', '', '', '', '0', '0');
INSERT INTO `hc_model` VALUES ('16', '1', '线上定制', '线上定制', 'custom_ol', '', '0', '0', '1', '0', 'hucai', 'category_custom', 'list_custom', 'show_custom', '', '', '', '', '0', '0');
INSERT INTO `hc_model` VALUES ('17', '1', '连锁门店', '影像连锁门店', 'link_store', '', '0', '0', '1', '0', 'hucai', 'category', 'list', 'show', '', '', '', '', '0', '0');
INSERT INTO `hc_model` VALUES ('15', '1', '品牌活动', '品牌活动模型', 'brand_activity', '', '0', '0', '1', '0', 'hucai', 'category_brand', 'list_brand', 'show_brand', '', '', '', '', '0', '0');

-- ----------------------------
-- Table structure for `hc_model_field`
-- ----------------------------
DROP TABLE IF EXISTS `hc_model_field`;
CREATE TABLE `hc_model_field` (
  `fieldid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `modelid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `field` varchar(20) NOT NULL,
  `name` varchar(30) NOT NULL,
  `tips` text NOT NULL,
  `css` varchar(30) NOT NULL,
  `minlength` int(10) unsigned NOT NULL DEFAULT '0',
  `maxlength` int(10) unsigned NOT NULL DEFAULT '0',
  `pattern` varchar(255) NOT NULL,
  `errortips` varchar(255) NOT NULL,
  `formtype` varchar(20) NOT NULL,
  `setting` mediumtext NOT NULL,
  `formattribute` varchar(255) NOT NULL,
  `unsetgroupids` varchar(255) NOT NULL,
  `unsetroleids` varchar(255) NOT NULL,
  `iscore` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `issystem` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isunique` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isbase` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `issearch` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isadd` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isfulltext` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isposition` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `listorder` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isomnipotent` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`fieldid`),
  KEY `modelid` (`modelid`,`disabled`) USING BTREE,
  KEY `field` (`field`,`modelid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=218 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hc_model_field
-- ----------------------------
INSERT INTO `hc_model_field` VALUES ('1', '1', '1', 'catid', '栏目', '', '', '1', '6', '/^[0-9]{1,6}$/', '请选择栏目', 'catid', 'array (\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', '0', '1', '0', '1', '1', '1', '0', '0', '1', '0', '0');
INSERT INTO `hc_model_field` VALUES ('2', '1', '1', 'typeid', '类别', '', '', '0', '0', '', '', 'typeid', 'array (\n  \'minnumber\' => \'\',\n  \'defaultvalue\' => \'\',\n)', '', '', '', '0', '1', '0', '1', '1', '1', '0', '0', '2', '0', '0');
INSERT INTO `hc_model_field` VALUES ('3', '1', '1', 'title', '标题', '', 'inputtitle', '1', '80', '', '请输入标题', 'title', '', '', '', '', '0', '1', '0', '1', '1', '1', '1', '1', '4', '0', '0');
INSERT INTO `hc_model_field` VALUES ('4', '1', '1', 'thumb', '缩略图', '', '', '0', '100', '', '', 'image', 'array (\n  \'size\' => \'50\',\n  \'defaultvalue\' => \'\',\n  \'show_type\' => \'1\',\n  \'upload_maxsize\' => \'1024\',\n  \'upload_allowext\' => \'jpg|jpeg|gif|png|bmp\',\n  \'watermark\' => \'0\',\n  \'isselectimage\' => \'1\',\n  \'images_width\' => \'\',\n  \'images_height\' => \'\',\n)', '', '', '', '0', '1', '0', '0', '0', '1', '0', '1', '14', '0', '0');
INSERT INTO `hc_model_field` VALUES ('5', '1', '1', 'keywords', '关键词', '多关键词之间用空格或者“,”隔开', '', '0', '40', '', '', 'keyword', 'array (\r\n  \'size\' => \'100\',\r\n  \'defaultvalue\' => \'\',\r\n)', '', '-99', '-99', '0', '1', '0', '1', '1', '1', '1', '0', '7', '0', '0');
INSERT INTO `hc_model_field` VALUES ('6', '1', '1', 'description', '摘要', '', '', '0', '255', '', '', 'textarea', 'array (\r\n  \'width\' => \'98\',\r\n  \'height\' => \'46\',\r\n  \'defaultvalue\' => \'\',\r\n  \'enablehtml\' => \'0\',\r\n)', '', '', '', '0', '1', '0', '1', '0', '1', '1', '1', '10', '0', '0');
INSERT INTO `hc_model_field` VALUES ('7', '1', '1', 'updatetime', '更新时间', '', '', '0', '0', '', '', 'datetime', 'array (\r\n  \'dateformat\' => \'int\',\r\n  \'format\' => \'Y-m-d H:i:s\',\r\n  \'defaulttype\' => \'1\',\r\n  \'defaultvalue\' => \'\',\r\n)', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '12', '0', '0');
INSERT INTO `hc_model_field` VALUES ('8', '1', '1', 'content', '内容', '<div class=\"content_attr\"><label><input name=\"add_introduce\" type=\"checkbox\"  value=\"1\" checked>是否截取内容</label><input type=\"text\" name=\"introcude_length\" value=\"200\" size=\"3\">字符至内容摘要\r\n<label><input type=\'checkbox\' name=\'auto_thumb\' value=\"1\" checked>是否获取内容第</label><input type=\"text\" name=\"auto_thumb_no\" value=\"1\" size=\"2\" class=\"\">张图片作为标题图片\r\n</div>', '', '1', '999999', '', '内容不能为空', 'editor', 'array (\n  \'toolbar\' => \'full\',\n  \'defaultvalue\' => \'\',\n  \'enablekeylink\' => \'1\',\n  \'replacenum\' => \'2\',\n  \'link_mode\' => \'0\',\n  \'enablesaveimage\' => \'1\',\n)', '', '', '', '0', '0', '0', '1', '0', '1', '1', '0', '13', '0', '0');
INSERT INTO `hc_model_field` VALUES ('9', '1', '1', 'voteid', '添加投票', '', '', '0', '0', '', '', 'omnipotent', 'array (\n  \'formtext\' => \'<input type=\\\'text\\\' name=\\\'info[voteid]\\\' id=\\\'voteid\\\' value=\\\'{FIELD_VALUE}\\\' size=\\\'3\\\'> \r\n<input type=\\\'button\\\' value=\"选择已有投票\" onclick=\"omnipotent(\\\'selectid\\\',\\\'?m=vote&c=vote&a=public_get_votelist&from_api=1\\\',\\\'选择已有投票\\\')\" class=\"button\">\r\n<input type=\\\'button\\\' value=\"新增投票\" onclick=\"omnipotent(\\\'addvote\\\',\\\'?m=vote&c=vote&a=add&from_api=1\\\',\\\'添加投票\\\',0)\" class=\"button\">\',\n  \'fieldtype\' => \'mediumint\',\n  \'minnumber\' => \'1\',\n)', '', '', '', '0', '0', '0', '1', '0', '0', '1', '0', '21', '0', '0');
INSERT INTO `hc_model_field` VALUES ('10', '1', '1', 'pages', '分页方式', '', '', '0', '0', '', '', 'pages', '', '', '-99', '-99', '0', '0', '0', '1', '0', '0', '0', '0', '16', '0', '0');
INSERT INTO `hc_model_field` VALUES ('11', '1', '1', 'inputtime', '发布时间', '', '', '0', '0', '', '', 'datetime', 'array (\n  \'fieldtype\' => \'int\',\n  \'format\' => \'Y-m-d H:i:s\',\n  \'defaulttype\' => \'0\',\n)', '', '', '', '0', '1', '0', '0', '0', '0', '0', '1', '17', '0', '0');
INSERT INTO `hc_model_field` VALUES ('12', '1', '1', 'posids', '推荐位', '', '', '0', '0', '', '', 'posid', 'array (\n  \'cols\' => \'4\',\n  \'width\' => \'125\',\n)', '', '', '', '0', '1', '0', '1', '0', '0', '0', '0', '18', '0', '0');
INSERT INTO `hc_model_field` VALUES ('13', '1', '1', 'url', 'URL', '', '', '0', '100', '', '', 'text', '', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '50', '0', '0');
INSERT INTO `hc_model_field` VALUES ('14', '1', '1', 'listorder', '排序', '', '', '0', '6', '', '', 'number', '', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '51', '0', '0');
INSERT INTO `hc_model_field` VALUES ('15', '1', '1', 'status', '状态', '', '', '0', '2', '', '', 'box', '', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '55', '0', '0');
INSERT INTO `hc_model_field` VALUES ('16', '1', '1', 'template', '内容页模板', '', '', '0', '30', '', '', 'template', 'array (\n  \'size\' => \'\',\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', '0', '0', '0', '0', '0', '0', '0', '0', '53', '0', '0');
INSERT INTO `hc_model_field` VALUES ('17', '1', '1', 'groupids_view', '阅读权限', '', '', '0', '0', '', '', 'groupid', 'array (\n  \'groupids\' => \'\',\n)', '', '', '', '0', '0', '0', '1', '0', '0', '0', '0', '19', '0', '0');
INSERT INTO `hc_model_field` VALUES ('18', '1', '1', 'readpoint', '阅读收费', '', '', '0', '5', '', '', 'readpoint', 'array (\n  \'minnumber\' => \'1\',\n  \'maxnumber\' => \'99999\',\n  \'decimaldigits\' => \'0\',\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', '0', '0', '0', '0', '0', '0', '0', '0', '55', '0', '0');
INSERT INTO `hc_model_field` VALUES ('19', '1', '1', 'relation', '相关文章', '', '', '0', '0', '', '', 'omnipotent', 'array (\n  \'formtext\' => \'<input type=\\\'hidden\\\' name=\\\'info[relation]\\\' id=\\\'relation\\\' value=\\\'{FIELD_VALUE}\\\' style=\\\'50\\\' >\r\n<ul class=\"list-dot\" id=\"relation_text\"></ul>\r\n<div>\r\n<input type=\\\'button\\\' value=\"添加相关\" onclick=\"omnipotent(\\\'selectid\\\',\\\'?m=content&c=content&a=public_relationlist&modelid={MODELID}\\\',\\\'添加相关文章\\\',1)\" class=\"button\" style=\"width:66px;\">\r\n<span class=\"edit_content\">\r\n<input type=\\\'button\\\' value=\"显示已有\" onclick=\"show_relation({MODELID},{ID})\" class=\"button\" style=\"width:66px;\">\r\n</span>\r\n</div>\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n)', '', '2,6,4,5,1,17,18,7', '', '0', '0', '0', '0', '0', '0', '1', '0', '15', '0', '0');
INSERT INTO `hc_model_field` VALUES ('20', '1', '1', 'allow_comment', '允许评论', '', '', '0', '0', '', '', 'box', 'array (\n  \'options\' => \'允许评论|1\r\n不允许评论|0\',\n  \'boxtype\' => \'radio\',\n  \'fieldtype\' => \'tinyint\',\n  \'minnumber\' => \'1\',\n  \'width\' => \'88\',\n  \'size\' => \'1\',\n  \'defaultvalue\' => \'1\',\n  \'outputtype\' => \'1\',\n  \'filtertype\' => \'0\',\n)', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '54', '0', '0');
INSERT INTO `hc_model_field` VALUES ('21', '1', '1', 'copyfrom', '来源', '', '', '0', '100', '', '', 'copyfrom', 'array (\n  \'defaultvalue\' => \'\',\n)', '', '', '', '0', '0', '0', '1', '0', '1', '0', '0', '8', '0', '0');
INSERT INTO `hc_model_field` VALUES ('80', '1', '1', 'username', '用户名', '', '', '0', '20', '', '', 'text', '', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '98', '0', '0');
INSERT INTO `hc_model_field` VALUES ('22', '2', '1', 'catid', '栏目', '', '', '1', '6', '/^[0-9]{1,6}$/', '请选择栏目', 'catid', 'array (\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', '0', '1', '0', '1', '1', '1', '0', '0', '1', '0', '0');
INSERT INTO `hc_model_field` VALUES ('23', '2', '1', 'typeid', '类别', '', '', '0', '0', '', '', 'typeid', 'array (\n  \'minnumber\' => \'\',\n  \'defaultvalue\' => \'\',\n)', '', '', '', '0', '1', '0', '1', '1', '1', '0', '0', '2', '1', '0');
INSERT INTO `hc_model_field` VALUES ('24', '2', '1', 'title', '标题', '', 'inputtitle', '1', '80', '', '请输入标题', 'title', '', '', '', '', '0', '1', '0', '1', '1', '1', '1', '1', '4', '0', '0');
INSERT INTO `hc_model_field` VALUES ('25', '2', '1', 'keywords', '关键词', '多关键词之间用空格或者“,”隔开', '', '0', '40', '', '', 'keyword', 'array (\r\n  \'size\' => \'100\',\r\n  \'defaultvalue\' => \'\',\r\n)', '', '-99', '-99', '0', '1', '0', '1', '1', '1', '1', '0', '7', '0', '0');
INSERT INTO `hc_model_field` VALUES ('26', '2', '1', 'description', '摘要', '', '', '0', '255', '', '', 'textarea', 'array (\r\n  \'width\' => \'98\',\r\n  \'height\' => \'46\',\r\n  \'defaultvalue\' => \'\',\r\n  \'enablehtml\' => \'0\',\r\n)', '', '', '', '0', '1', '0', '1', '0', '1', '1', '1', '10', '0', '0');
INSERT INTO `hc_model_field` VALUES ('27', '2', '1', 'updatetime', '更新时间', '', '', '0', '0', '', '', 'datetime', 'array (\r\n  \'dateformat\' => \'int\',\r\n  \'format\' => \'Y-m-d H:i:s\',\r\n  \'defaulttype\' => \'1\',\r\n  \'defaultvalue\' => \'\',\r\n)', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '12', '0', '0');
INSERT INTO `hc_model_field` VALUES ('28', '2', '1', 'content', '内容', '<div class=\"content_attr\"><label><input name=\"add_introduce\" type=\"checkbox\"  value=\"1\" checked>是否截取内容</label><input type=\"text\" name=\"introcude_length\" value=\"200\" size=\"3\">字符至内容摘要\r\n<label><input type=\'checkbox\' name=\'auto_thumb\' value=\"1\" checked>是否获取内容第</label><input type=\"text\" name=\"auto_thumb_no\" value=\"1\" size=\"2\" class=\"\">张图片作为标题图片\r\n</div>', '', '1', '999999', '', '内容不能为空', 'editor', 'array (\n  \'toolbar\' => \'full\',\n  \'defaultvalue\' => \'\',\n  \'enablekeylink\' => \'1\',\n  \'replacenum\' => \'2\',\n  \'link_mode\' => \'0\',\n  \'enablesaveimage\' => \'1\',\n  \'height\' => \'\',\n  \'disabled_page\' => \'1\',\n)', '', '', '', '0', '0', '0', '1', '0', '1', '1', '0', '13', '0', '0');
INSERT INTO `hc_model_field` VALUES ('29', '2', '1', 'thumb', '缩略图', '', '', '0', '100', '', '', 'image', 'array (\n  \'size\' => \'50\',\n  \'defaultvalue\' => \'\',\n  \'show_type\' => \'1\',\n  \'upload_maxsize\' => \'1024\',\n  \'upload_allowext\' => \'jpg|jpeg|gif|png|bmp\',\n  \'watermark\' => \'0\',\n  \'isselectimage\' => \'1\',\n  \'images_width\' => \'\',\n  \'images_height\' => \'\',\n)', '', '', '', '0', '1', '0', '0', '0', '1', '0', '1', '14', '0', '0');
INSERT INTO `hc_model_field` VALUES ('30', '2', '1', 'relation', '相关文章', '', '', '0', '0', '', '', 'omnipotent', 'array (\n  \'formtext\' => \'<input type=\\\'hidden\\\' name=\\\'info[relation]\\\' id=\\\'relation\\\' value=\\\'{FIELD_VALUE}\\\' style=\\\'50\\\' >\r\n<ul class=\"list-dot\" id=\"relation_text\"></ul>\r\n<div>\r\n<input type=\\\'button\\\' value=\"添加相关\" onclick=\"omnipotent(\\\'selectid\\\',\\\'?m=content&c=content&a=public_relationlist&modelid={MODELID}\\\',\\\'添加相关文章\\\',1)\" class=\"button\" style=\"width:66px;\">\r\n<span class=\"edit_content\">\r\n<input type=\\\'button\\\' value=\"显示已有\" onclick=\"show_relation({MODELID},{ID})\" class=\"button\" style=\"width:66px;\">\r\n</span>\r\n</div>\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n)', '', '2,6,4,5,1,17,18,7', '', '0', '0', '0', '0', '0', '0', '1', '0', '15', '0', '0');
INSERT INTO `hc_model_field` VALUES ('31', '2', '1', 'pages', '分页方式', '', '', '0', '0', '', '', 'pages', '', '', '-99', '-99', '0', '0', '0', '1', '0', '0', '0', '0', '16', '1', '0');
INSERT INTO `hc_model_field` VALUES ('32', '2', '1', 'inputtime', '发布时间', '', '', '0', '0', '', '', 'datetime', 'array (\n  \'fieldtype\' => \'int\',\n  \'format\' => \'Y-m-d H:i:s\',\n  \'defaulttype\' => \'0\',\n)', '', '', '', '0', '1', '0', '0', '0', '0', '0', '1', '17', '0', '0');
INSERT INTO `hc_model_field` VALUES ('33', '2', '1', 'posids', '推荐位', '', '', '0', '0', '', '', 'posid', 'array (\n  \'cols\' => \'4\',\n  \'width\' => \'125\',\n)', '', '', '', '0', '1', '0', '1', '0', '0', '0', '0', '18', '0', '0');
INSERT INTO `hc_model_field` VALUES ('34', '2', '1', 'groupids_view', '阅读权限', '', '', '0', '0', '', '', 'groupid', 'array (\n  \'groupids\' => \'\',\n)', '', '', '', '0', '0', '0', '1', '0', '0', '0', '0', '19', '0', '0');
INSERT INTO `hc_model_field` VALUES ('35', '2', '1', 'url', 'URL', '', '', '0', '100', '', '', 'text', '', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '50', '0', '0');
INSERT INTO `hc_model_field` VALUES ('36', '2', '1', 'listorder', '排序', '', '', '0', '6', '', '', 'number', '', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '51', '0', '0');
INSERT INTO `hc_model_field` VALUES ('37', '2', '1', 'template', '内容页模板', '', '', '0', '30', '', '', 'template', 'array (\n  \'size\' => \'\',\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', '0', '0', '0', '0', '0', '0', '0', '0', '53', '0', '0');
INSERT INTO `hc_model_field` VALUES ('38', '2', '1', 'allow_comment', '允许评论', '', '', '0', '0', '', '', 'box', 'array (\n  \'options\' => \'允许评论|1\r\n不允许评论|0\',\n  \'boxtype\' => \'radio\',\n  \'fieldtype\' => \'tinyint\',\n  \'minnumber\' => \'1\',\n  \'width\' => \'88\',\n  \'size\' => \'1\',\n  \'defaultvalue\' => \'1\',\n  \'outputtype\' => \'1\',\n  \'filtertype\' => \'0\',\n)', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '54', '0', '0');
INSERT INTO `hc_model_field` VALUES ('39', '2', '1', 'status', '状态', '', '', '0', '2', '', '', 'box', '', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '55', '0', '0');
INSERT INTO `hc_model_field` VALUES ('40', '2', '1', 'readpoint', '阅读收费', '', '', '0', '5', '', '', 'readpoint', 'array (\n  \'minnumber\' => \'1\',\n  \'maxnumber\' => \'99999\',\n  \'decimaldigits\' => \'0\',\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', '0', '0', '0', '0', '0', '0', '0', '0', '55', '0', '0');
INSERT INTO `hc_model_field` VALUES ('41', '2', '1', 'username', '用户名', '', '', '0', '20', '', '', 'text', '', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '98', '0', '0');
INSERT INTO `hc_model_field` VALUES ('42', '2', '1', 'downfiles', '本地下载', '', '', '0', '0', '', '', 'downfiles', 'array (\n  \'upload_allowext\' => \'rar|zip\',\n  \'isselectimage\' => \'0\',\n  \'upload_number\' => \'1\',\n  \'downloadlink\' => \'1\',\n  \'downloadtype\' => \'1\',\n)', '', '', '', '0', '0', '0', '1', '0', '1', '0', '0', '8', '0', '0');
INSERT INTO `hc_model_field` VALUES ('43', '2', '1', 'downfile', '镜像下载', '', '', '0', '0', '', '', 'downfile', 'array (\n  \'downloadlink\' => \'1\',\n  \'downloadtype\' => \'1\',\n  \'upload_allowext\' => \'rar|zip\',\n  \'isselectimage\' => \'0\',\n  \'upload_number\' => \'1\',\n)', '', '', '', '0', '0', '0', '1', '0', '1', '0', '0', '9', '0', '0');
INSERT INTO `hc_model_field` VALUES ('44', '2', '1', 'systems', '软件平台', '<select name=\'selectSystem\' onchange=\"ChangeInput(this,document.myform.systems,\'/\')\">\r\n	<option value=\'WinXP\'>WinXP</option>\r\n	<option value=\'Vista\'>Windows 7</option>\r\n	<option value=\'Win2000\'>Win2000</option>\r\n	<option value=\'Win2003\'>Win2003</option>\r\n	<option value=\'Unix\'>Unix</option>\r\n	<option value=\'Linux\'>Linux</option>\r\n	<option value=\'MacOS\'>MacOS</option>\r\n</select>', '', '0', '100', '', '', 'text', 'array (\n  \'size\' => \'50\',\n  \'defaultvalue\' => \'Win2000/WinXP/Win2003\',\n  \'ispassword\' => \'0\',\n)', '', '', '', '0', '1', '0', '1', '0', '1', '1', '0', '14', '0', '0');
INSERT INTO `hc_model_field` VALUES ('45', '2', '1', 'copytype', '软件授权形式', '', '', '0', '15', '', '', 'box', 'array (\n  \'options\' => \'免费版|免费版\r\n共享版|共享版\r\n试用版|试用版\r\n演示版|演示版\r\n注册版|注册版\r\n破解版|破解版\r\n零售版|零售版\r\nOEM版|OEM版\',\n  \'boxtype\' => \'select\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n  \'cols\' => \'5\',\n  \'width\' => \'80\',\n  \'size\' => \'1\',\n  \'default_select_value\' => \'免费版\',\n)', '', '', '', '0', '1', '0', '1', '0', '1', '0', '0', '12', '0', '0');
INSERT INTO `hc_model_field` VALUES ('46', '2', '1', 'language', '软件语言', '', '', '0', '16', '', '', 'box', 'array (\n  \'options\' => \'英文|英文\r\n简体中文|简体中文\r\n繁体中文|繁体中文\r\n简繁中文|简繁中文\r\n多国语言|多国语言\r\n其他语言|其他语言\',\n  \'boxtype\' => \'select\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n  \'cols\' => \'5\',\n  \'width\' => \'80\',\n  \'size\' => \'1\',\n  \'default_select_value\' => \'简体中文\',\n)', '', '', '', '0', '1', '0', '1', '0', '1', '0', '0', '13', '0', '0');
INSERT INTO `hc_model_field` VALUES ('47', '2', '1', 'classtype', '软件类型', '', '', '0', '20', '', '', 'box', 'array (\n  \'options\' => \'国产软件|国产软件\r\n国外软件|国外软件\r\n汉化补丁|汉化补丁\r\n程序源码|程序源码\r\n其他|其他\',\n  \'boxtype\' => \'radio\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n  \'cols\' => \'5\',\n  \'width\' => \'80\',\n  \'size\' => \'1\',\n  \'default_select_value\' => \'国产软件\',\n)', '', '', '', '0', '1', '0', '1', '0', '1', '0', '0', '17', '0', '0');
INSERT INTO `hc_model_field` VALUES ('48', '2', '1', 'version', '版本号', '', '', '0', '20', '', '', 'text', 'array (\n  \'size\' => \'10\',\n  \'defaultvalue\' => \'\',\n  \'ispassword\' => \'0\',\n)', '', '', '', '0', '1', '0', '0', '0', '1', '1', '0', '13', '0', '0');
INSERT INTO `hc_model_field` VALUES ('49', '2', '1', 'filesize', '文件大小', '', '', '0', '10', '', '', 'text', 'array (\n  \'size\' => \'10\',\n  \'defaultvalue\' => \'未知\',\n  \'ispassword\' => \'0\',\n)', '', '', '', '0', '1', '0', '0', '0', '1', '1', '0', '14', '0', '0');
INSERT INTO `hc_model_field` VALUES ('50', '2', '1', 'stars', '评分等级', '', '', '0', '20', '', '', 'box', 'array (\n  \'options\' => \'★☆☆☆☆|★☆☆☆☆\r\n★★☆☆☆|★★☆☆☆\r\n★★★☆☆|★★★☆☆\r\n★★★★☆|★★★★☆\r\n★★★★★|★★★★★\',\n  \'boxtype\' => \'radio\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n  \'cols\' => \'5\',\n  \'width\' => \'88\',\n  \'size\' => \'1\',\n  \'default_select_value\' => \'★★★☆☆\',\n)', '', '', '', '0', '1', '0', '1', '0', '1', '0', '0', '17', '0', '0');
INSERT INTO `hc_model_field` VALUES ('51', '3', '1', 'allow_comment', '允许评论', '', '', '0', '0', '', '', 'box', 'array (\n  \'options\' => \'允许评论|1\r\n不允许评论|0\',\n  \'boxtype\' => \'radio\',\n  \'fieldtype\' => \'tinyint\',\n  \'minnumber\' => \'1\',\n  \'width\' => \'88\',\n  \'size\' => \'1\',\n  \'defaultvalue\' => \'1\',\n  \'outputtype\' => \'1\',\n  \'filtertype\' => \'0\',\n)', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '54', '0', '0');
INSERT INTO `hc_model_field` VALUES ('52', '3', '1', 'template', '内容页模板', '', '', '0', '30', '', '', 'template', 'array (\n  \'size\' => \'\',\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', '0', '0', '0', '0', '0', '0', '0', '0', '53', '0', '0');
INSERT INTO `hc_model_field` VALUES ('53', '3', '1', 'url', 'URL', '', '', '0', '100', '', '', 'text', '', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '50', '0', '0');
INSERT INTO `hc_model_field` VALUES ('54', '3', '1', 'listorder', '排序', '', '', '0', '6', '', '', 'number', '', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '51', '0', '0');
INSERT INTO `hc_model_field` VALUES ('55', '3', '1', 'posids', '推荐位', '', '', '0', '0', '', '', 'posid', 'array (\n  \'cols\' => \'4\',\n  \'width\' => \'125\',\n)', '', '', '', '0', '1', '0', '1', '0', '0', '0', '0', '18', '0', '0');
INSERT INTO `hc_model_field` VALUES ('56', '3', '1', 'groupids_view', '阅读权限', '', '', '0', '0', '', '', 'groupid', 'array (\n  \'groupids\' => \'\',\n)', '', '', '', '0', '0', '0', '1', '0', '0', '0', '0', '19', '0', '0');
INSERT INTO `hc_model_field` VALUES ('57', '3', '1', 'inputtime', '发布时间', '', '', '0', '0', '', '', 'datetime', 'array (\n  \'fieldtype\' => \'int\',\n  \'format\' => \'Y-m-d H:i:s\',\n  \'defaulttype\' => \'0\',\n)', '', '', '', '0', '1', '0', '0', '0', '0', '0', '1', '17', '0', '0');
INSERT INTO `hc_model_field` VALUES ('58', '3', '1', 'pages', '分页方式', '', '', '0', '0', '', '', 'pages', '', '', '-99', '-99', '0', '0', '0', '1', '0', '0', '0', '0', '16', '0', '0');
INSERT INTO `hc_model_field` VALUES ('59', '3', '1', 'relation', '相关组图', '', '', '0', '0', '', '', 'omnipotent', 'array (\n  \'formtext\' => \'<input type=\\\'hidden\\\' name=\\\'info[relation]\\\' id=\\\'relation\\\' value=\\\'{FIELD_VALUE}\\\' style=\\\'50\\\' >\r\n<ul class=\"list-dot\" id=\"relation_text\"></ul>\r\n<div>\r\n<input type=\\\'button\\\' value=\"添加相关\" onclick=\"omnipotent(\\\'selectid\\\',\\\'?m=content&c=content&a=public_relationlist&modelid={MODELID}\\\',\\\'添加相关文章\\\',1)\" class=\"button\" style=\"width:66px;\">\r\n<span class=\"edit_content\">\r\n<input type=\\\'button\\\' value=\"显示已有\" onclick=\"show_relation({MODELID},{ID})\" class=\"button\" style=\"width:66px;\">\r\n</span>\r\n</div>\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n)', '', '2,6,4,5,1,17,18,7', '', '0', '0', '0', '0', '0', '0', '1', '0', '15', '0', '0');
INSERT INTO `hc_model_field` VALUES ('60', '3', '1', 'thumb', '缩略图', '', '', '0', '100', '', '', 'image', 'array (\n  \'size\' => \'50\',\n  \'defaultvalue\' => \'\',\n  \'show_type\' => \'1\',\n  \'upload_maxsize\' => \'1024\',\n  \'upload_allowext\' => \'jpg|jpeg|gif|png|bmp\',\n  \'watermark\' => \'0\',\n  \'isselectimage\' => \'1\',\n  \'images_width\' => \'\',\n  \'images_height\' => \'\',\n)', '', '', '', '0', '1', '0', '0', '0', '1', '0', '1', '14', '0', '0');
INSERT INTO `hc_model_field` VALUES ('61', '3', '1', 'content', '内容', '<div class=\"content_attr\"><label><input name=\"add_introduce\" type=\"checkbox\"  value=\"1\" checked>是否截取内容</label><input type=\"text\" name=\"introcude_length\" value=\"200\" size=\"3\">字符至内容摘要\r\n<label><input type=\'checkbox\' name=\'auto_thumb\' value=\"1\" checked>是否获取内容第</label><input type=\"text\" name=\"auto_thumb_no\" value=\"1\" size=\"2\" class=\"\">张图片作为标题图片\r\n</div>', '', '0', '999999', '', '', 'editor', 'array (\n  \'toolbar\' => \'full\',\n  \'defaultvalue\' => \'\',\n  \'enablekeylink\' => \'1\',\n  \'replacenum\' => \'2\',\n  \'link_mode\' => \'0\',\n  \'enablesaveimage\' => \'1\',\n  \'height\' => \'\',\n  \'disabled_page\' => \'1\',\n)', '', '', '', '0', '0', '0', '1', '0', '1', '1', '0', '13', '0', '0');
INSERT INTO `hc_model_field` VALUES ('62', '3', '1', 'updatetime', '更新时间', '', '', '0', '0', '', '', 'datetime', 'array (\r\n  \'dateformat\' => \'int\',\r\n  \'format\' => \'Y-m-d H:i:s\',\r\n  \'defaulttype\' => \'1\',\r\n  \'defaultvalue\' => \'\',\r\n)', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '12', '0', '0');
INSERT INTO `hc_model_field` VALUES ('63', '3', '1', 'description', '摘要', '', '', '0', '255', '', '', 'textarea', 'array (\r\n  \'width\' => \'98\',\r\n  \'height\' => \'46\',\r\n  \'defaultvalue\' => \'\',\r\n  \'enablehtml\' => \'0\',\r\n)', '', '', '', '0', '1', '0', '1', '0', '1', '1', '1', '10', '0', '0');
INSERT INTO `hc_model_field` VALUES ('64', '3', '1', 'title', '标题', '', 'inputtitle', '1', '80', '', '请输入标题', 'title', '', '', '', '', '0', '1', '0', '1', '1', '1', '1', '1', '4', '0', '0');
INSERT INTO `hc_model_field` VALUES ('65', '3', '1', 'keywords', '关键词', '多关键词之间用空格或者“,”隔开', '', '0', '40', '', '', 'keyword', 'array (\r\n  \'size\' => \'100\',\r\n  \'defaultvalue\' => \'\',\r\n)', '', '-99', '-99', '0', '1', '0', '1', '1', '1', '1', '0', '7', '0', '0');
INSERT INTO `hc_model_field` VALUES ('66', '3', '1', 'typeid', '类别', '', '', '0', '0', '', '', 'typeid', 'array (\n  \'minnumber\' => \'\',\n  \'defaultvalue\' => \'\',\n)', '', '', '', '0', '1', '0', '1', '1', '1', '0', '0', '2', '0', '0');
INSERT INTO `hc_model_field` VALUES ('67', '3', '1', 'catid', '栏目', '', '', '1', '6', '/^[0-9]{1,6}$/', '请选择栏目', 'catid', 'array (\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', '0', '1', '0', '1', '1', '1', '0', '0', '1', '0', '0');
INSERT INTO `hc_model_field` VALUES ('68', '3', '1', 'status', '状态', '', '', '0', '2', '', '', 'box', '', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '55', '0', '0');
INSERT INTO `hc_model_field` VALUES ('69', '3', '1', 'readpoint', '阅读收费', '', '', '0', '5', '', '', 'readpoint', 'array (\n  \'minnumber\' => \'1\',\n  \'maxnumber\' => \'99999\',\n  \'decimaldigits\' => \'0\',\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', '0', '0', '0', '0', '0', '0', '0', '0', '55', '0', '0');
INSERT INTO `hc_model_field` VALUES ('70', '3', '1', 'username', '用户名', '', '', '0', '20', '', '', 'text', '', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '98', '0', '0');
INSERT INTO `hc_model_field` VALUES ('71', '3', '1', 'pictureurls', '组图', '', '', '0', '0', '', '', 'images', 'array (\n  \'upload_allowext\' => \'gif|jpg|jpeg|png|bmp\',\n  \'isselectimage\' => \'1\',\n  \'upload_number\' => \'50\',\n)', '', '', '', '0', '0', '0', '1', '0', '1', '0', '0', '15', '0', '0');
INSERT INTO `hc_model_field` VALUES ('72', '3', '1', 'copyfrom', '来源', '', '', '0', '0', '', '', 'copyfrom', 'array (\n  \'defaultvalue\' => \'\',\n)', '', '', '', '0', '0', '0', '1', '0', '1', '0', '0', '8', '0', '0');
INSERT INTO `hc_model_field` VALUES ('73', '1', '1', 'islink', '转向链接', '', '', '0', '0', '', '', 'islink', '', '', '', '', '0', '1', '0', '0', '0', '1', '0', '0', '30', '0', '0');
INSERT INTO `hc_model_field` VALUES ('74', '2', '1', 'islink', '转向链接', '', '', '0', '0', '', '', 'islink', '', '', '', '', '0', '1', '0', '0', '0', '1', '0', '0', '30', '0', '0');
INSERT INTO `hc_model_field` VALUES ('75', '3', '1', 'islink', '转向链接', '', '', '0', '0', '', '', 'islink', '', '', '', '', '0', '1', '0', '0', '0', '1', '0', '0', '30', '0', '0');
INSERT INTO `hc_model_field` VALUES ('83', '10', '1', 'birthday', '生日', '', '', '0', '0', '', '生日格式错误', 'datetime', 'array (\n  \'fieldtype\' => \'date\',\n  \'format\' => \'Y-m-d\',\n  \'defaulttype\' => \'0\',\n)', '', '', '', '0', '0', '0', '0', '0', '1', '1', '0', '0', '0', '0');
INSERT INTO `hc_model_field` VALUES ('84', '11', '1', 'catid', '栏目', '', '', '1', '6', '/^[0-9]{1,6}$/', '请选择栏目', 'catid', 'array (\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', '0', '1', '0', '1', '1', '1', '0', '0', '1', '0', '0');
INSERT INTO `hc_model_field` VALUES ('85', '11', '1', 'typeid', '类别', '', '', '0', '0', '', '', 'typeid', 'array (\n  \'minnumber\' => \'\',\n  \'defaultvalue\' => \'\',\n)', '', '', '', '0', '1', '0', '1', '1', '1', '0', '0', '2', '0', '0');
INSERT INTO `hc_model_field` VALUES ('86', '11', '1', 'title', '标题', '', 'inputtitle', '1', '80', '', '请输入标题', 'title', 'array (\n)', '', '', '', '0', '1', '0', '1', '1', '1', '1', '1', '4', '0', '0');
INSERT INTO `hc_model_field` VALUES ('87', '11', '1', 'keywords', '关键词', '多关键词之间用空格或者“,”隔开', '', '0', '40', '', '', 'keyword', 'array (\n  \'size\' => \'100\',\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', '0', '1', '0', '1', '1', '1', '1', '0', '7', '0', '0');
INSERT INTO `hc_model_field` VALUES ('88', '11', '1', 'description', '摘要', '', '', '0', '255', '', '', 'textarea', 'array (\n  \'width\' => \'98\',\n  \'height\' => \'46\',\n  \'defaultvalue\' => \'\',\n  \'enablehtml\' => \'0\',\n)', '', '', '', '0', '1', '0', '1', '0', '1', '1', '1', '10', '0', '0');
INSERT INTO `hc_model_field` VALUES ('89', '11', '1', 'updatetime', '更新时间', '', '', '0', '0', '', '', 'datetime', 'array (\n  \'dateformat\' => \'int\',\n  \'format\' => \'Y-m-d H:i:s\',\n  \'defaulttype\' => \'1\',\n  \'defaultvalue\' => \'\',\n)', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '12', '0', '0');
INSERT INTO `hc_model_field` VALUES ('90', '11', '1', 'content', '内容', '<div class=\"content_attr\"><label><input name=\"add_introduce\" type=\"checkbox\"  value=\"1\" checked>是否截取内容</label><input type=\"text\" name=\"introcude_length\" value=\"200\" size=\"3\">字符至内容摘要\r\n<label><input type=\'checkbox\' name=\'auto_thumb\' value=\"1\" checked>是否获取内容第</label><input type=\"text\" name=\"auto_thumb_no\" value=\"1\" size=\"2\" class=\"\">张图片作为标题图片\r\n</div>', '', '0', '999999', '', '内容不能为空', 'editor', 'array (\n  \'toolbar\' => \'full\',\n  \'defaultvalue\' => \'\',\n  \'enablekeylink\' => \'1\',\n  \'replacenum\' => \'2\',\n  \'link_mode\' => \'0\',\n  \'enablesaveimage\' => \'1\',\n  \'height\' => \'\',\n  \'disabled_page\' => \'0\',\n)', '', '', '', '0', '0', '0', '1', '0', '1', '1', '0', '13', '0', '0');
INSERT INTO `hc_model_field` VALUES ('91', '11', '1', 'thumb', '缩略图', '', '', '0', '100', '', '', 'image', 'array (\n  \'size\' => \'50\',\n  \'defaultvalue\' => \'\',\n  \'show_type\' => \'1\',\n  \'upload_maxsize\' => \'1024\',\n  \'upload_allowext\' => \'jpg|jpeg|gif|png|bmp\',\n  \'watermark\' => \'0\',\n  \'isselectimage\' => \'1\',\n  \'images_width\' => \'\',\n  \'images_height\' => \'\',\n)', '', '', '', '0', '1', '0', '0', '0', '1', '0', '1', '14', '0', '0');
INSERT INTO `hc_model_field` VALUES ('92', '11', '1', 'relation', '相关文章', '', '', '0', '0', '', '', 'omnipotent', 'array (\n  \'formtext\' => \'<input type=\\\'hidden\\\' name=\\\'info[relation]\\\' id=\\\'relation\\\' value=\\\'{FIELD_VALUE}\\\' style=\\\'50\\\' >\r\n<ul class=\"list-dot\" id=\"relation_text\"></ul>\r\n<div>\r\n<input type=\\\'button\\\' value=\"添加相关\" onclick=\"omnipotent(\\\'selectid\\\',\\\'?m=content&c=content&a=public_relationlist&modelid={MODELID}\\\',\\\'添加相关文章\\\',1)\" class=\"button\" style=\"width:66px;\">\r\n<span class=\"edit_content\">\r\n<input type=\\\'button\\\' value=\"显示已有\" onclick=\"show_relation({MODELID},{ID})\" class=\"button\" style=\"width:66px;\">\r\n</span>\r\n</div>\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n)', '', '2,6,4,5,1,17,18,7', '', '0', '0', '0', '0', '0', '0', '1', '0', '15', '0', '0');
INSERT INTO `hc_model_field` VALUES ('93', '11', '1', 'pages', '分页方式', '', '', '0', '0', '', '', 'pages', 'array (\n)', '', '-99', '-99', '0', '0', '0', '1', '0', '0', '0', '0', '16', '0', '0');
INSERT INTO `hc_model_field` VALUES ('94', '11', '1', 'inputtime', '发布时间', '', '', '0', '0', '', '', 'datetime', 'array (\n  \'fieldtype\' => \'int\',\n  \'format\' => \'Y-m-d H:i:s\',\n  \'defaulttype\' => \'0\',\n)', '', '', '', '0', '1', '0', '0', '0', '0', '0', '1', '17', '0', '0');
INSERT INTO `hc_model_field` VALUES ('95', '11', '1', 'posids', '推荐位', '', '', '0', '0', '', '', 'posid', 'array (\n  \'cols\' => \'4\',\n  \'width\' => \'125\',\n)', '', '', '', '0', '1', '0', '1', '0', '0', '0', '0', '18', '0', '0');
INSERT INTO `hc_model_field` VALUES ('96', '11', '1', 'groupids_view', '阅读权限', '', '', '0', '100', '', '', 'groupid', 'array (\n  \'groupids\' => \'\',\n)', '', '', '', '0', '0', '0', '1', '0', '0', '0', '0', '19', '0', '0');
INSERT INTO `hc_model_field` VALUES ('97', '11', '1', 'url', 'URL', '', '', '0', '100', '', '', 'text', 'array (\n)', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '50', '0', '0');
INSERT INTO `hc_model_field` VALUES ('98', '11', '1', 'listorder', '排序', '', '', '0', '6', '', '', 'number', 'array (\n)', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '51', '0', '0');
INSERT INTO `hc_model_field` VALUES ('99', '11', '1', 'template', '内容页模板', '', '', '0', '30', '', '', 'template', 'array (\n  \'size\' => \'\',\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', '0', '0', '0', '0', '0', '0', '0', '0', '53', '0', '0');
INSERT INTO `hc_model_field` VALUES ('100', '11', '1', 'allow_comment', '允许评论', '', '', '0', '0', '', '', 'box', 'array (\n  \'options\' => \'允许评论|1\r\n不允许评论|0\',\n  \'boxtype\' => \'radio\',\n  \'fieldtype\' => \'tinyint\',\n  \'minnumber\' => \'1\',\n  \'width\' => \'88\',\n  \'size\' => \'1\',\n  \'defaultvalue\' => \'1\',\n  \'outputtype\' => \'0\',\n)', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '54', '0', '0');
INSERT INTO `hc_model_field` VALUES ('101', '11', '1', 'status', '状态', '', '', '0', '2', '', '', 'box', 'array (\n)', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '55', '0', '0');
INSERT INTO `hc_model_field` VALUES ('102', '11', '1', 'readpoint', '阅读收费', '', '', '0', '5', '', '', 'readpoint', 'array (\n  \'minnumber\' => \'1\',\n  \'maxnumber\' => \'99999\',\n  \'decimaldigits\' => \'0\',\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', '0', '0', '0', '0', '0', '0', '0', '0', '55', '0', '0');
INSERT INTO `hc_model_field` VALUES ('103', '11', '1', 'username', '用户名', '', '', '0', '20', '', '', 'text', 'array (\n)', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '98', '0', '0');
INSERT INTO `hc_model_field` VALUES ('104', '11', '1', 'islink', '转向链接', '', '', '0', '0', '', '', 'islink', 'array (\n)', '', '', '', '0', '1', '0', '1', '0', '1', '0', '0', '20', '0', '0');
INSERT INTO `hc_model_field` VALUES ('105', '11', '1', 'video', '视频上传', '', '', '0', '0', '', '', 'video', 'array (\n  \'upload_allowext\' => \'flv|rm|mp4|rmv\',\n)', '', '', '', '0', '0', '0', '1', '0', '1', '0', '0', '8', '0', '0');
INSERT INTO `hc_model_field` VALUES ('106', '11', '1', 'vision', '画质', '', '', '0', '0', '', '', 'box', 'array (\n  \'options\' => \'高清|1\r\n普通|2\',\n  \'boxtype\' => \'select\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n  \'width\' => \'80\',\n  \'size\' => \'1\',\n  \'defaultvalue\' => \'0\',\n  \'outputtype\' => \'1\',\n  \'filtertype\' => \'1\',\n)', '', '', '', '0', '1', '0', '1', '0', '1', '0', '0', '9', '0', '0');
INSERT INTO `hc_model_field` VALUES ('107', '11', '1', 'video_category', '视频分类', '', '', '0', '0', '', '', 'box', 'array (\n  \'options\' => \'喜剧|1\r\n爱情|2\r\n科幻|3\r\n剧情|4\r\n动作|5\r\n伦理|6\',\n  \'boxtype\' => \'select\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n  \'width\' => \'80\',\n  \'size\' => \'1\',\n  \'defaultvalue\' => \'1\',\n  \'outputtype\' => \'1\',\n  \'filtertype\' => \'1\',\n)', '', '', '', '0', '1', '0', '1', '0', '1', '0', '0', '9', '0', '0');
INSERT INTO `hc_model_field` VALUES ('108', '12', '1', 'catid', '栏目', '', '', '1', '6', '/^[0-9]{1,6}$/', '请选择栏目', 'catid', 'array (\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', '0', '1', '0', '1', '1', '1', '0', '0', '1', '0', '0');
INSERT INTO `hc_model_field` VALUES ('109', '12', '1', 'typeid', '类别', '', '', '0', '0', '', '', 'typeid', 'array (\n  \'minnumber\' => \'\',\n  \'defaultvalue\' => \'\',\n)', '', '', '', '0', '1', '0', '1', '1', '1', '0', '0', '2', '0', '0');
INSERT INTO `hc_model_field` VALUES ('110', '12', '1', 'title', '标题', '', 'inputtitle', '1', '80', '', '请输入标题', 'title', '', '', '', '', '0', '1', '0', '1', '1', '1', '1', '1', '4', '0', '0');
INSERT INTO `hc_model_field` VALUES ('111', '12', '1', 'keywords', '关键词', '多关键词之间用空格或者“,”隔开', '', '0', '40', '', '', 'keyword', 'array (\r\n  \'size\' => \'100\',\r\n  \'defaultvalue\' => \'\',\r\n)', '', '-99', '-99', '0', '1', '0', '1', '1', '1', '1', '0', '7', '0', '0');
INSERT INTO `hc_model_field` VALUES ('112', '12', '1', 'description', '摘要', '', '', '0', '255', '', '', 'textarea', 'array (\r\n  \'width\' => \'98\',\r\n  \'height\' => \'46\',\r\n  \'defaultvalue\' => \'\',\r\n  \'enablehtml\' => \'0\',\r\n)', '', '', '', '0', '1', '0', '1', '0', '1', '1', '1', '10', '0', '0');
INSERT INTO `hc_model_field` VALUES ('113', '12', '1', 'updatetime', '更新时间', '', '', '0', '0', '', '', 'datetime', 'array (\r\n  \'dateformat\' => \'int\',\r\n  \'format\' => \'Y-m-d H:i:s\',\r\n  \'defaulttype\' => \'1\',\r\n  \'defaultvalue\' => \'\',\r\n)', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '12', '0', '0');
INSERT INTO `hc_model_field` VALUES ('114', '12', '1', 'content', '内容', '<div class=\"content_attr\"><label><input name=\"add_introduce\" type=\"checkbox\"  value=\"1\" checked>是否截取内容</label><input type=\"text\" name=\"introcude_length\" value=\"200\" size=\"3\">字符至内容摘要\r\n<label><input type=\'checkbox\' name=\'auto_thumb\' value=\"1\" checked>是否获取内容第</label><input type=\"text\" name=\"auto_thumb_no\" value=\"1\" size=\"2\" class=\"\">张图片作为标题图片\r\n</div>', '', '1', '999999', '', '内容不能为空', 'editor', 'array (\n  \'toolbar\' => \'full\',\n  \'defaultvalue\' => \'\',\n  \'enablekeylink\' => \'1\',\n  \'replacenum\' => \'2\',\n  \'link_mode\' => \'0\',\n  \'enablesaveimage\' => \'1\',\n)', '', '', '', '0', '0', '0', '1', '0', '1', '1', '0', '13', '0', '0');
INSERT INTO `hc_model_field` VALUES ('115', '12', '1', 'thumb', '缩略图', '', '', '0', '100', '', '', 'image', 'array (\n  \'size\' => \'50\',\n  \'defaultvalue\' => \'\',\n  \'show_type\' => \'1\',\n  \'upload_maxsize\' => \'1024\',\n  \'upload_allowext\' => \'jpg|jpeg|gif|png|bmp\',\n  \'watermark\' => \'0\',\n  \'isselectimage\' => \'1\',\n  \'images_width\' => \'\',\n  \'images_height\' => \'\',\n)', '', '', '', '0', '1', '0', '0', '0', '1', '0', '1', '14', '0', '0');
INSERT INTO `hc_model_field` VALUES ('116', '12', '1', 'relation', '相关文章', '', '', '0', '0', '', '', 'omnipotent', 'array (\n  \'formtext\' => \'<input type=\\\'hidden\\\' name=\\\'info[relation]\\\' id=\\\'relation\\\' value=\\\'{FIELD_VALUE}\\\' style=\\\'50\\\' >\r\n<ul class=\"list-dot\" id=\"relation_text\"></ul>\r\n<div>\r\n<input type=\\\'button\\\' value=\"添加相关\" onclick=\"omnipotent(\\\'selectid\\\',\\\'?m=content&c=content&a=public_relationlist&modelid={MODELID}\\\',\\\'添加相关文章\\\',1)\" class=\"button\" style=\"width:66px;\">\r\n<span class=\"edit_content\">\r\n<input type=\\\'button\\\' value=\"显示已有\" onclick=\"show_relation({MODELID},{ID})\" class=\"button\" style=\"width:66px;\">\r\n</span>\r\n</div>\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n)', '', '2,6,4,5,1,17,18,7', '', '0', '0', '0', '0', '0', '0', '1', '0', '15', '0', '0');
INSERT INTO `hc_model_field` VALUES ('117', '12', '1', 'pages', '分页方式', '', '', '0', '0', '', '', 'pages', '', '', '-99', '-99', '0', '0', '0', '1', '0', '0', '0', '0', '16', '0', '0');
INSERT INTO `hc_model_field` VALUES ('118', '12', '1', 'inputtime', '发布时间', '', '', '0', '0', '', '', 'datetime', 'array (\n  \'fieldtype\' => \'int\',\n  \'format\' => \'Y-m-d H:i:s\',\n  \'defaulttype\' => \'0\',\n)', '', '', '', '0', '1', '0', '0', '0', '0', '0', '1', '17', '0', '0');
INSERT INTO `hc_model_field` VALUES ('119', '12', '1', 'posids', '推荐位', '', '', '0', '0', '', '', 'posid', 'array (\n  \'cols\' => \'4\',\n  \'width\' => \'125\',\n)', '', '', '', '0', '1', '0', '1', '0', '0', '0', '0', '18', '0', '0');
INSERT INTO `hc_model_field` VALUES ('120', '12', '1', 'groupids_view', '阅读权限', '', '', '0', '100', '', '', 'groupid', 'array (\n  \'groupids\' => \'\',\n)', '', '', '', '0', '0', '0', '1', '0', '0', '0', '0', '19', '0', '0');
INSERT INTO `hc_model_field` VALUES ('121', '12', '1', 'url', 'URL', '', '', '0', '100', '', '', 'text', '', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '50', '0', '0');
INSERT INTO `hc_model_field` VALUES ('122', '12', '1', 'listorder', '排序', '', '', '0', '6', '', '', 'number', '', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '51', '0', '0');
INSERT INTO `hc_model_field` VALUES ('123', '12', '1', 'template', '内容页模板', '', '', '0', '30', '', '', 'template', 'array (\n  \'size\' => \'\',\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', '0', '0', '0', '0', '0', '0', '0', '0', '53', '0', '0');
INSERT INTO `hc_model_field` VALUES ('124', '12', '1', 'allow_comment', '允许评论', '', '', '0', '0', '', '', 'box', 'array (\n  \'options\' => \'允许评论|1\r\n不允许评论|0\',\n  \'boxtype\' => \'radio\',\n  \'fieldtype\' => \'tinyint\',\n  \'minnumber\' => \'1\',\n  \'width\' => \'88\',\n  \'size\' => \'1\',\n  \'defaultvalue\' => \'1\',\n  \'outputtype\' => \'0\',\n)', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '54', '0', '0');
INSERT INTO `hc_model_field` VALUES ('125', '12', '1', 'status', '状态', '', '', '0', '2', '', '', 'box', '', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '55', '0', '0');
INSERT INTO `hc_model_field` VALUES ('126', '12', '1', 'readpoint', '阅读收费', '', '', '0', '5', '', '', 'readpoint', 'array (\n  \'minnumber\' => \'1\',\n  \'maxnumber\' => \'99999\',\n  \'decimaldigits\' => \'0\',\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', '0', '0', '0', '0', '0', '0', '0', '0', '55', '0', '0');
INSERT INTO `hc_model_field` VALUES ('127', '12', '1', 'username', '用户名', '', '', '0', '20', '', '', 'text', '', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '98', '0', '0');
INSERT INTO `hc_model_field` VALUES ('128', '12', '1', 'islink', '转向链接', '', '', '0', '0', '', '', 'islink', '', '', '', '', '0', '1', '0', '1', '0', '1', '0', '0', '20', '0', '0');
INSERT INTO `hc_model_field` VALUES ('188', '16', '1', 'listorder', '排序', '', '', '0', '6', '', '', 'number', '', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '51', '0', '0');
INSERT INTO `hc_model_field` VALUES ('189', '16', '1', 'template', '内容页模板', '', '', '0', '30', '', '', 'template', 'array (\n  \'size\' => \'\',\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', '0', '0', '0', '0', '0', '0', '0', '0', '53', '0', '0');
INSERT INTO `hc_model_field` VALUES ('187', '16', '1', 'url', 'URL', '', '', '0', '100', '', '', 'text', '', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '50', '0', '0');
INSERT INTO `hc_model_field` VALUES ('186', '16', '1', 'groupids_view', '阅读权限', '', '', '0', '100', '', '', 'groupid', 'array (\n  \'groupids\' => \'\',\n)', '', '', '', '0', '0', '0', '1', '0', '0', '0', '0', '19', '1', '0');
INSERT INTO `hc_model_field` VALUES ('185', '16', '1', 'posids', '推荐位', '', '', '0', '0', '', '', 'posid', 'array (\n  \'cols\' => \'4\',\n  \'width\' => \'125\',\n)', '', '', '', '0', '1', '0', '1', '0', '0', '0', '0', '18', '1', '0');
INSERT INTO `hc_model_field` VALUES ('183', '16', '1', 'pages', '分页方式', '', '', '0', '0', '', '', 'pages', '', '', '-99', '-99', '0', '0', '0', '1', '0', '0', '0', '0', '16', '1', '0');
INSERT INTO `hc_model_field` VALUES ('184', '16', '1', 'inputtime', '发布时间', '', '', '0', '0', '', '', 'datetime', 'array (\n  \'fieldtype\' => \'int\',\n  \'format\' => \'Y-m-d H:i:s\',\n  \'defaulttype\' => \'0\',\n)', '', '', '', '0', '1', '0', '0', '0', '0', '0', '1', '17', '0', '0');
INSERT INTO `hc_model_field` VALUES ('182', '16', '1', 'relation', '相关文章', '', '', '0', '0', '', '', 'omnipotent', 'array (\n  \'formtext\' => \'<input type=\\\'hidden\\\' name=\\\'info[relation]\\\' id=\\\'relation\\\' value=\\\'{FIELD_VALUE}\\\' style=\\\'50\\\' >\r\n<ul class=\"list-dot\" id=\"relation_text\"></ul>\r\n<div>\r\n<input type=\\\'button\\\' value=\"添加相关\" onclick=\"omnipotent(\\\'selectid\\\',\\\'?m=content&c=content&a=public_relationlist&modelid={MODELID}\\\',\\\'添加相关文章\\\',1)\" class=\"button\" style=\"width:66px;\">\r\n<span class=\"edit_content\">\r\n<input type=\\\'button\\\' value=\"显示已有\" onclick=\"show_relation({MODELID},{ID})\" class=\"button\" style=\"width:66px;\">\r\n</span>\r\n</div>\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n)', '', '2,6,4,5,1,17,18,7', '', '0', '0', '0', '0', '0', '0', '1', '0', '15', '1', '0');
INSERT INTO `hc_model_field` VALUES ('181', '16', '1', 'thumb', '缩略图', '', '', '0', '100', '', '', 'image', 'array (\n  \'size\' => \'50\',\n  \'defaultvalue\' => \'\',\n  \'show_type\' => \'1\',\n  \'upload_maxsize\' => \'1024\',\n  \'upload_allowext\' => \'jpg|jpeg|gif|png|bmp\',\n  \'watermark\' => \'0\',\n  \'isselectimage\' => \'1\',\n  \'images_width\' => \'\',\n  \'images_height\' => \'\',\n)', '', '', '', '0', '1', '0', '0', '0', '1', '0', '1', '14', '0', '0');
INSERT INTO `hc_model_field` VALUES ('180', '16', '1', 'content', '内容', '<div class=\"content_attr\"><label><input name=\"add_introduce\" type=\"checkbox\"  value=\"1\" checked>是否截取内容</label><input type=\"text\" name=\"introcude_length\" value=\"200\" size=\"3\">字符至内容摘要\r\n<label><input type=\'checkbox\' name=\'auto_thumb\' value=\"1\" checked>是否获取内容第</label><input type=\"text\" name=\"auto_thumb_no\" value=\"1\" size=\"2\" class=\"\">张图片作为标题图片\r\n</div>', '', '1', '999999', '', '内容不能为空', 'editor', 'array (\n  \'toolbar\' => \'full\',\n  \'defaultvalue\' => \'\',\n  \'enablekeylink\' => \'1\',\n  \'replacenum\' => \'2\',\n  \'link_mode\' => \'0\',\n  \'enablesaveimage\' => \'1\',\n)', '', '', '', '0', '0', '0', '1', '0', '1', '1', '0', '13', '1', '0');
INSERT INTO `hc_model_field` VALUES ('179', '16', '1', 'updatetime', '更新时间', '', '', '0', '0', '', '', 'datetime', 'array (\r\n  \'dateformat\' => \'int\',\r\n  \'format\' => \'Y-m-d H:i:s\',\r\n  \'defaulttype\' => \'1\',\r\n  \'defaultvalue\' => \'\',\r\n)', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '12', '0', '0');
INSERT INTO `hc_model_field` VALUES ('178', '16', '1', 'description', '摘要', '', '', '0', '600', '', '', 'textarea', 'array (\n  \'width\' => \'98\',\n  \'height\' => \'60\',\n  \'defaultvalue\' => \'\',\n  \'enablehtml\' => \'0\',\n)', '', '', '', '0', '1', '0', '1', '0', '1', '1', '1', '10', '0', '0');
INSERT INTO `hc_model_field` VALUES ('177', '16', '1', 'keywords', '关键词', '多关键词之间用空格或者“,”隔开', '', '0', '40', '', '', 'keyword', 'array (\r\n  \'size\' => \'100\',\r\n  \'defaultvalue\' => \'\',\r\n)', '', '-99', '-99', '0', '1', '0', '1', '1', '1', '1', '0', '7', '1', '0');
INSERT INTO `hc_model_field` VALUES ('176', '16', '1', 'title', '标题', '', 'inputtitle', '1', '80', '', '请输入标题', 'title', '', '', '', '', '0', '1', '0', '1', '1', '1', '1', '1', '4', '0', '0');
INSERT INTO `hc_model_field` VALUES ('174', '16', '1', 'catid', '栏目', '', '', '1', '6', '/^[0-9]{1,6}$/', '请选择栏目', 'catid', 'array (\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', '0', '1', '0', '1', '1', '1', '0', '0', '1', '0', '0');
INSERT INTO `hc_model_field` VALUES ('175', '16', '1', 'typeid', '类别', '', '', '0', '0', '', '', 'typeid', 'array (\n  \'minnumber\' => \'\',\n  \'defaultvalue\' => \'\',\n)', '', '', '', '0', '1', '0', '1', '1', '1', '0', '0', '2', '0', '0');
INSERT INTO `hc_model_field` VALUES ('173', '15', '1', 'date_end', '活动结束日期', '', '', '0', '0', '', '', 'datetime', 'array (\n  \'fieldtype\' => \'date\',\n  \'format\' => \'Y-m-d Ah:i:s\',\n  \'defaulttype\' => \'0\',\n)', '', '', '', '0', '0', '0', '1', '0', '0', '0', '0', '101', '0', '0');
INSERT INTO `hc_model_field` VALUES ('172', '15', '1', 'date_start', '活动开始日期', '', '', '0', '0', '', '', 'datetime', 'array (\n  \'fieldtype\' => \'date\',\n  \'format\' => \'Y-m-d Ah:i:s\',\n  \'defaulttype\' => \'0\',\n)', '', '', '', '0', '0', '0', '1', '0', '0', '0', '0', '100', '0', '0');
INSERT INTO `hc_model_field` VALUES ('151', '15', '1', 'catid', '栏目', '', '', '1', '6', '/^[0-9]{1,6}$/', '请选择栏目', 'catid', 'array (\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', '0', '1', '0', '1', '1', '1', '0', '0', '1', '0', '0');
INSERT INTO `hc_model_field` VALUES ('152', '15', '1', 'typeid', '类别', '', '', '0', '0', '', '', 'typeid', 'array (\n  \'minnumber\' => \'\',\n  \'defaultvalue\' => \'\',\n)', '', '', '', '0', '1', '0', '1', '1', '1', '0', '0', '2', '0', '0');
INSERT INTO `hc_model_field` VALUES ('153', '15', '1', 'title', '标题', '', 'inputtitle', '1', '80', '', '请输入标题', 'title', '', '', '', '', '0', '1', '0', '1', '1', '1', '1', '1', '4', '0', '0');
INSERT INTO `hc_model_field` VALUES ('154', '15', '1', 'keywords', '关键词', '多关键词之间用空格或者“,”隔开', '', '0', '40', '', '', 'keyword', 'array (\r\n  \'size\' => \'100\',\r\n  \'defaultvalue\' => \'\',\r\n)', '', '-99', '-99', '0', '1', '0', '1', '1', '1', '1', '0', '7', '0', '0');
INSERT INTO `hc_model_field` VALUES ('155', '15', '1', 'description', '摘要', '', '', '0', '255', '', '', 'textarea', 'array (\r\n  \'width\' => \'98\',\r\n  \'height\' => \'46\',\r\n  \'defaultvalue\' => \'\',\r\n  \'enablehtml\' => \'0\',\r\n)', '', '', '', '0', '1', '0', '1', '0', '1', '1', '1', '10', '0', '0');
INSERT INTO `hc_model_field` VALUES ('156', '15', '1', 'updatetime', '更新时间', '', '', '0', '0', '', '', 'datetime', 'array (\r\n  \'dateformat\' => \'int\',\r\n  \'format\' => \'Y-m-d H:i:s\',\r\n  \'defaulttype\' => \'1\',\r\n  \'defaultvalue\' => \'\',\r\n)', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '12', '0', '0');
INSERT INTO `hc_model_field` VALUES ('157', '15', '1', 'content', '内容', '<div class=\"content_attr\"><label><input name=\"add_introduce\" type=\"checkbox\"  value=\"1\" checked>是否截取内容</label><input type=\"text\" name=\"introcude_length\" value=\"200\" size=\"3\">字符至内容摘要\r\n<label><input type=\'checkbox\' name=\'auto_thumb\' value=\"1\" checked>是否获取内容第</label><input type=\"text\" name=\"auto_thumb_no\" value=\"1\" size=\"2\" class=\"\">张图片作为标题图片\r\n</div>', '', '1', '999999', '', '内容不能为空', 'editor', 'array (\n  \'toolbar\' => \'full\',\n  \'defaultvalue\' => \'\',\n  \'enablekeylink\' => \'1\',\n  \'replacenum\' => \'2\',\n  \'link_mode\' => \'0\',\n  \'enablesaveimage\' => \'1\',\n)', '', '', '', '0', '0', '0', '1', '0', '1', '1', '0', '13', '0', '0');
INSERT INTO `hc_model_field` VALUES ('158', '15', '1', 'thumb', '缩略图', '', '', '0', '100', '', '', 'image', 'array (\n  \'size\' => \'50\',\n  \'defaultvalue\' => \'\',\n  \'show_type\' => \'1\',\n  \'upload_maxsize\' => \'1024\',\n  \'upload_allowext\' => \'jpg|jpeg|gif|png|bmp\',\n  \'watermark\' => \'0\',\n  \'isselectimage\' => \'1\',\n  \'images_width\' => \'\',\n  \'images_height\' => \'\',\n)', '', '', '', '0', '1', '0', '0', '0', '1', '0', '1', '14', '0', '0');
INSERT INTO `hc_model_field` VALUES ('159', '15', '1', 'relation', '相关文章', '', '', '0', '0', '', '', 'omnipotent', 'array (\n  \'formtext\' => \'<input type=\\\'hidden\\\' name=\\\'info[relation]\\\' id=\\\'relation\\\' value=\\\'{FIELD_VALUE}\\\' style=\\\'50\\\' >\r\n<ul class=\"list-dot\" id=\"relation_text\"></ul>\r\n<div>\r\n<input type=\\\'button\\\' value=\"添加相关\" onclick=\"omnipotent(\\\'selectid\\\',\\\'?m=content&c=content&a=public_relationlist&modelid={MODELID}\\\',\\\'添加相关文章\\\',1)\" class=\"button\" style=\"width:66px;\">\r\n<span class=\"edit_content\">\r\n<input type=\\\'button\\\' value=\"显示已有\" onclick=\"show_relation({MODELID},{ID})\" class=\"button\" style=\"width:66px;\">\r\n</span>\r\n</div>\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n)', '', '2,6,4,5,1,17,18,7', '', '0', '0', '0', '0', '0', '0', '1', '0', '15', '0', '0');
INSERT INTO `hc_model_field` VALUES ('160', '15', '1', 'pages', '分页方式', '', '', '0', '0', '', '', 'pages', '', '', '-99', '-99', '0', '0', '0', '1', '0', '0', '0', '0', '16', '0', '0');
INSERT INTO `hc_model_field` VALUES ('161', '15', '1', 'inputtime', '发布时间', '', '', '0', '0', '', '', 'datetime', 'array (\n  \'fieldtype\' => \'int\',\n  \'format\' => \'Y-m-d H:i:s\',\n  \'defaulttype\' => \'0\',\n)', '', '', '', '0', '1', '0', '0', '0', '0', '0', '1', '17', '0', '0');
INSERT INTO `hc_model_field` VALUES ('162', '15', '1', 'posids', '推荐位', '', '', '0', '0', '', '', 'posid', 'array (\n  \'cols\' => \'4\',\n  \'width\' => \'125\',\n)', '', '', '', '0', '1', '0', '1', '0', '0', '0', '0', '18', '0', '0');
INSERT INTO `hc_model_field` VALUES ('163', '15', '1', 'groupids_view', '阅读权限', '', '', '0', '100', '', '', 'groupid', 'array (\n  \'groupids\' => \'\',\n)', '', '', '', '0', '0', '0', '1', '0', '0', '0', '0', '19', '0', '0');
INSERT INTO `hc_model_field` VALUES ('164', '15', '1', 'url', 'URL', '', '', '0', '100', '', '', 'text', '', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '50', '0', '0');
INSERT INTO `hc_model_field` VALUES ('165', '15', '1', 'listorder', '排序', '', '', '0', '6', '', '', 'number', '', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '51', '0', '0');
INSERT INTO `hc_model_field` VALUES ('166', '15', '1', 'template', '内容页模板', '', '', '0', '30', '', '', 'template', 'array (\n  \'size\' => \'\',\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', '0', '0', '0', '0', '0', '0', '0', '0', '53', '0', '0');
INSERT INTO `hc_model_field` VALUES ('167', '15', '1', 'allow_comment', '允许评论', '', '', '0', '0', '', '', 'box', 'array (\n  \'options\' => \'允许评论|1\r\n不允许评论|0\',\n  \'boxtype\' => \'radio\',\n  \'fieldtype\' => \'tinyint\',\n  \'minnumber\' => \'1\',\n  \'width\' => \'88\',\n  \'size\' => \'1\',\n  \'defaultvalue\' => \'1\',\n  \'outputtype\' => \'0\',\n)', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '54', '0', '0');
INSERT INTO `hc_model_field` VALUES ('168', '15', '1', 'status', '状态', '', '', '0', '2', '', '', 'box', '', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '55', '0', '0');
INSERT INTO `hc_model_field` VALUES ('169', '15', '1', 'readpoint', '阅读收费', '', '', '0', '5', '', '', 'readpoint', 'array (\n  \'minnumber\' => \'1\',\n  \'maxnumber\' => \'99999\',\n  \'decimaldigits\' => \'0\',\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', '0', '0', '0', '0', '0', '0', '0', '0', '55', '0', '0');
INSERT INTO `hc_model_field` VALUES ('170', '15', '1', 'username', '用户名', '', '', '0', '20', '', '', 'text', '', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '98', '0', '0');
INSERT INTO `hc_model_field` VALUES ('171', '15', '1', 'islink', '转向链接', '', '', '0', '0', '', '', 'islink', '', '', '', '', '0', '1', '0', '1', '0', '1', '0', '0', '20', '0', '0');
INSERT INTO `hc_model_field` VALUES ('190', '16', '1', 'allow_comment', '允许评论', '', '', '0', '0', '', '', 'box', 'array (\n  \'options\' => \'允许评论|1\r\n不允许评论|0\',\n  \'boxtype\' => \'radio\',\n  \'fieldtype\' => \'tinyint\',\n  \'minnumber\' => \'1\',\n  \'width\' => \'88\',\n  \'size\' => \'1\',\n  \'defaultvalue\' => \'1\',\n  \'outputtype\' => \'0\',\n)', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '54', '1', '0');
INSERT INTO `hc_model_field` VALUES ('191', '16', '1', 'status', '状态', '', '', '0', '2', '', '', 'box', '', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '55', '0', '0');
INSERT INTO `hc_model_field` VALUES ('192', '16', '1', 'readpoint', '阅读收费', '', '', '0', '5', '', '', 'readpoint', 'array (\n  \'minnumber\' => \'1\',\n  \'maxnumber\' => \'99999\',\n  \'decimaldigits\' => \'0\',\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', '0', '0', '0', '0', '0', '0', '0', '0', '55', '1', '0');
INSERT INTO `hc_model_field` VALUES ('193', '16', '1', 'username', '用户名', '', '', '0', '20', '', '', 'text', '', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '98', '0', '0');
INSERT INTO `hc_model_field` VALUES ('194', '16', '1', 'islink', '转向链接', '', '', '0', '0', '', '', 'islink', '', '', '', '', '0', '1', '0', '1', '0', '1', '0', '0', '20', '1', '0');
INSERT INTO `hc_model_field` VALUES ('195', '16', '1', 'visite_link', '访问链接', '', '', '0', '0', '/^http:\\/\\//', '请输入正确的访问链接，如：http://www.hucais.com/', 'text', 'array (\n  \'size\' => \'80\',\n  \'defaultvalue\' => \'\',\n  \'ispassword\' => \'0\',\n)', '', '', '', '0', '0', '0', '1', '0', '0', '0', '0', '100', '0', '0');
INSERT INTO `hc_model_field` VALUES ('196', '17', '1', 'catid', '栏目', '', '', '1', '6', '/^[0-9]{1,6}$/', '请选择栏目', 'catid', 'array (\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', '0', '1', '0', '1', '1', '1', '0', '0', '1', '0', '0');
INSERT INTO `hc_model_field` VALUES ('197', '17', '1', 'typeid', '类别', '', '', '0', '0', '', '', 'typeid', 'array (\n  \'minnumber\' => \'\',\n  \'defaultvalue\' => \'\',\n)', '', '', '', '0', '1', '0', '1', '1', '1', '0', '0', '2', '0', '0');
INSERT INTO `hc_model_field` VALUES ('198', '17', '1', 'title', '标题', '', 'inputtitle', '1', '80', '', '请输入标题', 'title', '', '', '', '', '0', '1', '0', '1', '1', '1', '1', '1', '4', '0', '0');
INSERT INTO `hc_model_field` VALUES ('199', '17', '1', 'keywords', '关键词', '多关键词之间用空格或者“,”隔开', '', '0', '40', '', '', 'keyword', 'array (\r\n  \'size\' => \'100\',\r\n  \'defaultvalue\' => \'\',\r\n)', '', '-99', '-99', '0', '1', '0', '1', '1', '1', '1', '0', '7', '0', '0');
INSERT INTO `hc_model_field` VALUES ('200', '17', '1', 'description', '摘要', '', '', '0', '255', '', '', 'textarea', 'array (\r\n  \'width\' => \'98\',\r\n  \'height\' => \'46\',\r\n  \'defaultvalue\' => \'\',\r\n  \'enablehtml\' => \'0\',\r\n)', '', '', '', '0', '1', '0', '1', '0', '1', '1', '1', '10', '0', '0');
INSERT INTO `hc_model_field` VALUES ('201', '17', '1', 'updatetime', '更新时间', '', '', '0', '0', '', '', 'datetime', 'array (\r\n  \'dateformat\' => \'int\',\r\n  \'format\' => \'Y-m-d H:i:s\',\r\n  \'defaulttype\' => \'1\',\r\n  \'defaultvalue\' => \'\',\r\n)', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '12', '0', '0');
INSERT INTO `hc_model_field` VALUES ('202', '17', '1', 'content', '内容', '<div class=\"content_attr\"><label><input name=\"add_introduce\" type=\"checkbox\"  value=\"1\" checked>是否截取内容</label><input type=\"text\" name=\"introcude_length\" value=\"200\" size=\"3\">字符至内容摘要\r\n<label><input type=\'checkbox\' name=\'auto_thumb\' value=\"1\" checked>是否获取内容第</label><input type=\"text\" name=\"auto_thumb_no\" value=\"1\" size=\"2\" class=\"\">张图片作为标题图片\r\n</div>', '', '1', '999999', '', '内容不能为空', 'editor', 'array (\n  \'toolbar\' => \'full\',\n  \'defaultvalue\' => \'\',\n  \'enablekeylink\' => \'1\',\n  \'replacenum\' => \'2\',\n  \'link_mode\' => \'0\',\n  \'enablesaveimage\' => \'1\',\n)', '', '', '', '0', '0', '0', '1', '0', '1', '1', '0', '13', '0', '0');
INSERT INTO `hc_model_field` VALUES ('203', '17', '1', 'thumb', '缩略图', '', '', '0', '100', '', '', 'image', 'array (\n  \'size\' => \'50\',\n  \'defaultvalue\' => \'\',\n  \'show_type\' => \'1\',\n  \'upload_maxsize\' => \'1024\',\n  \'upload_allowext\' => \'jpg|jpeg|gif|png|bmp\',\n  \'watermark\' => \'0\',\n  \'isselectimage\' => \'1\',\n  \'images_width\' => \'\',\n  \'images_height\' => \'\',\n)', '', '', '', '0', '1', '0', '0', '0', '1', '0', '1', '14', '0', '0');
INSERT INTO `hc_model_field` VALUES ('204', '17', '1', 'relation', '相关文章', '', '', '0', '0', '', '', 'omnipotent', 'array (\n  \'formtext\' => \'<input type=\\\'hidden\\\' name=\\\'info[relation]\\\' id=\\\'relation\\\' value=\\\'{FIELD_VALUE}\\\' style=\\\'50\\\' >\r\n<ul class=\"list-dot\" id=\"relation_text\"></ul>\r\n<div>\r\n<input type=\\\'button\\\' value=\"添加相关\" onclick=\"omnipotent(\\\'selectid\\\',\\\'?m=content&c=content&a=public_relationlist&modelid={MODELID}\\\',\\\'添加相关文章\\\',1)\" class=\"button\" style=\"width:66px;\">\r\n<span class=\"edit_content\">\r\n<input type=\\\'button\\\' value=\"显示已有\" onclick=\"show_relation({MODELID},{ID})\" class=\"button\" style=\"width:66px;\">\r\n</span>\r\n</div>\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n)', '', '2,6,4,5,1,17,18,7', '', '0', '0', '0', '0', '0', '0', '1', '0', '15', '0', '0');
INSERT INTO `hc_model_field` VALUES ('205', '17', '1', 'pages', '分页方式', '', '', '0', '0', '', '', 'pages', '', '', '-99', '-99', '0', '0', '0', '1', '0', '0', '0', '0', '16', '0', '0');
INSERT INTO `hc_model_field` VALUES ('206', '17', '1', 'inputtime', '发布时间', '', '', '0', '0', '', '', 'datetime', 'array (\n  \'fieldtype\' => \'int\',\n  \'format\' => \'Y-m-d H:i:s\',\n  \'defaulttype\' => \'0\',\n)', '', '', '', '0', '1', '0', '0', '0', '0', '0', '1', '17', '0', '0');
INSERT INTO `hc_model_field` VALUES ('207', '17', '1', 'posids', '推荐位', '', '', '0', '0', '', '', 'posid', 'array (\n  \'cols\' => \'4\',\n  \'width\' => \'125\',\n)', '', '', '', '0', '1', '0', '1', '0', '0', '0', '0', '18', '0', '0');
INSERT INTO `hc_model_field` VALUES ('208', '17', '1', 'groupids_view', '阅读权限', '', '', '0', '100', '', '', 'groupid', 'array (\n  \'groupids\' => \'\',\n)', '', '', '', '0', '0', '0', '1', '0', '0', '0', '0', '19', '0', '0');
INSERT INTO `hc_model_field` VALUES ('209', '17', '1', 'url', 'URL', '', '', '0', '100', '', '', 'text', '', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '50', '0', '0');
INSERT INTO `hc_model_field` VALUES ('210', '17', '1', 'listorder', '排序', '', '', '0', '6', '', '', 'number', '', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '51', '0', '0');
INSERT INTO `hc_model_field` VALUES ('211', '17', '1', 'template', '内容页模板', '', '', '0', '30', '', '', 'template', 'array (\n  \'size\' => \'\',\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', '0', '0', '0', '0', '0', '0', '0', '0', '53', '0', '0');
INSERT INTO `hc_model_field` VALUES ('212', '17', '1', 'allow_comment', '允许评论', '', '', '0', '0', '', '', 'box', 'array (\n  \'options\' => \'允许评论|1\r\n不允许评论|0\',\n  \'boxtype\' => \'radio\',\n  \'fieldtype\' => \'tinyint\',\n  \'minnumber\' => \'1\',\n  \'width\' => \'88\',\n  \'size\' => \'1\',\n  \'defaultvalue\' => \'1\',\n  \'outputtype\' => \'0\',\n)', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '54', '0', '0');
INSERT INTO `hc_model_field` VALUES ('213', '17', '1', 'status', '状态', '', '', '0', '2', '', '', 'box', '', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '55', '0', '0');
INSERT INTO `hc_model_field` VALUES ('214', '17', '1', 'readpoint', '阅读收费', '', '', '0', '5', '', '', 'readpoint', 'array (\n  \'minnumber\' => \'1\',\n  \'maxnumber\' => \'99999\',\n  \'decimaldigits\' => \'0\',\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', '0', '0', '0', '0', '0', '0', '0', '0', '55', '0', '0');
INSERT INTO `hc_model_field` VALUES ('215', '17', '1', 'username', '用户名', '', '', '0', '20', '', '', 'text', '', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '98', '0', '0');
INSERT INTO `hc_model_field` VALUES ('216', '17', '1', 'islink', '转向链接', '', '', '0', '0', '', '', 'islink', '', '', '', '', '0', '1', '0', '1', '0', '1', '0', '0', '20', '0', '0');
INSERT INTO `hc_model_field` VALUES ('217', '12', '1', 'images', '商品图片', '', '', '0', '500', '', '', 'images', 'array (\n  \'upload_allowext\' => \'gif|jpg|jpeg|png|bmp\',\n  \'isselectimage\' => \'1\',\n  \'upload_number\' => \'10\',\n)', '', '', '', '0', '0', '0', '1', '0', '0', '0', '0', '14', '0', '0');

-- ----------------------------
-- Table structure for `hc_module`
-- ----------------------------
DROP TABLE IF EXISTS `hc_module`;
CREATE TABLE `hc_module` (
  `module` varchar(15) NOT NULL,
  `name` varchar(20) NOT NULL,
  `url` varchar(50) NOT NULL,
  `iscore` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `version` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL,
  `setting` mediumtext NOT NULL,
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `installdate` date NOT NULL DEFAULT '0000-00-00',
  `updatedate` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`module`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hc_module
-- ----------------------------
INSERT INTO `hc_module` VALUES ('admin', 'admin', '', '1', '1.0', '', 'array (\n  \'admin_email\' => \'623493406@qq.com\',\n  \'maxloginfailedtimes\' => \'8\',\n  \'minrefreshtime\' => \'2\',\n  \'mail_type\' => \'1\',\n  \'mail_server\' => \'smtp.qq.com\',\n  \'mail_port\' => \'25\',\n  \'category_ajax\' => \'0\',\n  \'mail_user\' => \'623493406@qq.com\',\n  \'mail_auth\' => \'1\',\n  \'mail_from\' => \'623493406@qq.com\',\n  \'mail_password\' => \'@wdz520cc\',\n  \'errorlog_size\' => \'20\',\n)', '0', '0', '2010-10-18', '2010-10-18');
INSERT INTO `hc_module` VALUES ('member', '会员', '', '1', '1.0', '', 'array (\n  \'allowregister\' => \'1\',\n  \'choosemodel\' => \'1\',\n  \'enablemailcheck\' => \'0\',\n  \'registerverify\' => \'0\',\n  \'showapppoint\' => \'0\',\n  \'rmb_point_rate\' => \'10\',\n  \'defualtpoint\' => \'0\',\n  \'defualtamount\' => \'0\',\n  \'showregprotocol\' => \'0\',\n  \'regprotocol\' => \'		 欢迎您注册成为phpcms用户\r\n请仔细阅读下面的协议，只有接受协议才能继续进行注册。 \r\n1．服务条款的确认和接纳\r\n　　phpcms用户服务的所有权和运作权归phpcms拥有。phpcms所提供的服务将按照有关章程、服务条款和操作规则严格执行。用户通过注册程序点击“我同意” 按钮，即表示用户与phpcms达成协议并接受所有的服务条款。\r\n2． phpcms服务简介\r\n　　phpcms通过国际互联网为用户提供新闻及文章浏览、图片浏览、软件下载、网上留言和BBS论坛等服务。\r\n　　用户必须： \r\n　　1)购置设备，包括个人电脑一台、调制解调器一个及配备上网装置。 \r\n　　2)个人上网和支付与此服务有关的电话费用、网络费用。\r\n　　用户同意： \r\n　　1)提供及时、详尽及准确的个人资料。 \r\n　　2)不断更新注册资料，符合及时、详尽、准确的要求。所有原始键入的资料将引用为注册资料。 \r\n　　3)用户同意遵守《中华人民共和国保守国家秘密法》、《中华人民共和国计算机信息系统安全保护条例》、《计算机软件保护条例》等有关计算机及互联网规定的法律和法规、实施办法。在任何情况下，phpcms合理地认为用户的行为可能违反上述法律、法规，phpcms可以在任何时候，不经事先通知终止向该用户提供服务。用户应了解国际互联网的无国界性，应特别注意遵守当地所有有关的法律和法规。\r\n3． 服务条款的修改\r\n　　phpcms会不定时地修改服务条款，服务条款一旦发生变动，将会在相关页面上提示修改内容。如果您同意改动，则再一次点击“我同意”按钮。 如果您不接受，则及时取消您的用户使用服务资格。\r\n4． 服务修订\r\n　　phpcms保留随时修改或中断服务而不需知照用户的权利。phpcms行使修改或中断服务的权利，不需对用户或第三方负责。\r\n5． 用户隐私制度\r\n　　尊重用户个人隐私是phpcms的 基本政策。phpcms不会公开、编辑或透露用户的注册信息，除非有法律许可要求，或phpcms在诚信的基础上认为透露这些信息在以下三种情况是必要的： \r\n　　1)遵守有关法律规定，遵从合法服务程序。 \r\n　　2)保持维护phpcms的商标所有权。 \r\n　　3)在紧急情况下竭力维护用户个人和社会大众的隐私安全。 \r\n　　4)符合其他相关的要求。 \r\n6．用户的帐号，密码和安全性\r\n　　一旦注册成功成为phpcms用户，您将得到一个密码和帐号。如果您不保管好自己的帐号和密码安全，将对因此产生的后果负全部责任。另外，每个用户都要对其帐户中的所有活动和事件负全责。您可随时根据指示改变您的密码，也可以结束旧的帐户重开一个新帐户。用户同意若发现任何非法使用用户帐号或安全漏洞的情况，立即通知phpcms。\r\n7． 免责条款\r\n　　用户明确同意网站服务的使用由用户个人承担风险。 　　 \r\n　　phpcms不作任何类型的担保，不担保服务一定能满足用户的要求，也不担保服务不会受中断，对服务的及时性，安全性，出错发生都不作担保。用户理解并接受：任何通过phpcms服务取得的信息资料的可靠性取决于用户自己，用户自己承担所有风险和责任。 \r\n8．有限责任\r\n　　phpcms对任何直接、间接、偶然、特殊及继起的损害不负责任。\r\n9． 不提供零售和商业性服务 \r\n　　用户使用网站服务的权利是个人的。用户只能是一个单独的个体而不能是一个公司或实体商业性组织。用户承诺不经phpcms同意，不能利用网站服务进行销售或其他商业用途。\r\n10．用户责任 \r\n　　用户单独承担传输内容的责任。用户必须遵循： \r\n　　1)从中国境内向外传输技术性资料时必须符合中国有关法规。 \r\n　　2)使用网站服务不作非法用途。 \r\n　　3)不干扰或混乱网络服务。 \r\n　　4)不在论坛BBS或留言簿发表任何与政治相关的信息。 \r\n　　5)遵守所有使用网站服务的网络协议、规定、程序和惯例。\r\n　　6)不得利用本站危害国家安全、泄露国家秘密，不得侵犯国家社会集体的和公民的合法权益。\r\n　　7)不得利用本站制作、复制和传播下列信息： \r\n　　　1、煽动抗拒、破坏宪法和法律、行政法规实施的；\r\n　　　2、煽动颠覆国家政权，推翻社会主义制度的；\r\n　　　3、煽动分裂国家、破坏国家统一的；\r\n　　　4、煽动民族仇恨、民族歧视，破坏民族团结的；\r\n　　　5、捏造或者歪曲事实，散布谣言，扰乱社会秩序的；\r\n　　　6、宣扬封建迷信、淫秽、色情、赌博、暴力、凶杀、恐怖、教唆犯罪的；\r\n　　　7、公然侮辱他人或者捏造事实诽谤他人的，或者进行其他恶意攻击的；\r\n　　　8、损害国家机关信誉的；\r\n　　　9、其他违反宪法和法律行政法规的；\r\n　　　10、进行商业广告行为的。\r\n　　用户不能传输任何教唆他人构成犯罪行为的资料；不能传输长国内不利条件和涉及国家安全的资料；不能传输任何不符合当地法规、国家法律和国际法 律的资料。未经许可而非法进入其它电脑系统是禁止的。若用户的行为不符合以上的条款，phpcms将取消用户服务帐号。\r\n11．网站内容的所有权\r\n　　phpcms定义的内容包括：文字、软件、声音、相片、录象、图表；在广告中全部内容；电子邮件的全部内容；phpcms为用户提供的商业信息。所有这些内容受版权、商标、标签和其它财产所有权法律的保护。所以，用户只能在phpcms和广告商授权下才能使用这些内容，而不能擅自复制、篡改这些内容、或创造与内容有关的派生产品。\r\n12．附加信息服务\r\n　　用户在享用phpcms提供的免费服务的同时，同意接受phpcms提供的各类附加信息服务。\r\n13．解释权\r\n　　本注册协议的解释权归phpcms所有。如果其中有任何条款与国家的有关法律相抵触，则以国家法律的明文规定为准。 \',\n  \'registerverifymessage\' => \' 欢迎您注册成为phpcms用户，您的账号需要邮箱认证，点击下面链接进行认证：{click}\r\n或者将网址复制到浏览器：{url}\',\n  \'forgetpassword\' => \' phpcms密码找回，请在一小时内点击下面链接进行操作：{click}\r\n或者将网址复制到浏览器：{url}\',\n)', '0', '0', '2010-09-06', '2010-09-06');
INSERT INTO `hc_module` VALUES ('pay', '支付', '', '1', '1.0', '', '', '0', '0', '2010-09-06', '2010-09-06');
INSERT INTO `hc_module` VALUES ('digg', '顶一下', '', '0', '1.0', '', '', '0', '0', '2010-09-06', '2010-09-06');
INSERT INTO `hc_module` VALUES ('special', '专题', '', '0', '1.0', '', '', '0', '0', '2010-09-06', '2010-09-06');
INSERT INTO `hc_module` VALUES ('content', '内容模块', '', '1', '1.0', '', '', '0', '0', '2010-09-06', '2010-09-06');
INSERT INTO `hc_module` VALUES ('search', '全站搜索', '', '0', '1.0', '', 'array (\n  \'fulltextenble\' => \'1\',\n  \'relationenble\' => \'1\',\n  \'suggestenable\' => \'1\',\n  \'sphinxenable\' => \'0\',\n  \'sphinxhost\' => \'10.228.134.102\',\n  \'sphinxport\' => \'9312\',\n)', '0', '0', '2010-09-06', '2010-09-06');
INSERT INTO `hc_module` VALUES ('scan', '木马扫描', 'scan', '0', '1.0', '', '', '0', '0', '2010-09-01', '2010-09-06');
INSERT INTO `hc_module` VALUES ('attachment', '附件', 'attachment', '1', '1.0', '', '', '0', '0', '2010-09-01', '2010-09-06');
INSERT INTO `hc_module` VALUES ('block', '碎片', '', '1', '1.0', '', '', '0', '0', '2010-09-01', '2010-09-06');
INSERT INTO `hc_module` VALUES ('collection', '采集模块', 'collection', '1', '1.0', '', '', '0', '0', '2010-09-01', '2010-09-06');
INSERT INTO `hc_module` VALUES ('dbsource', '数据源', '', '1', '', '', '', '0', '0', '2010-09-01', '2010-09-06');
INSERT INTO `hc_module` VALUES ('template', '模板风格', '', '1', '1.0', '', '', '0', '0', '2010-09-01', '2010-09-06');
INSERT INTO `hc_module` VALUES ('release', '发布点', '', '1', '1.0', '', '', '0', '0', '2010-09-01', '2010-09-06');
INSERT INTO `hc_module` VALUES ('video', '视频库', '', '0', '1.0', '', '', '0', '0', '2012-09-28', '2012-09-28');
INSERT INTO `hc_module` VALUES ('announce', '公告', 'announce/', '0', '1.0', '公告', '', '0', '0', '2015-04-13', '2015-04-13');
INSERT INTO `hc_module` VALUES ('link', '友情链接', '', '0', '1.0', '', 'array (\n  1 => \n  array (\n    \'is_post\' => \'1\',\n    \'enablecheckcode\' => \'0\',\n  ),\n)', '0', '0', '2010-09-06', '2010-09-06');
INSERT INTO `hc_module` VALUES ('poster', '广告模块', 'poster/', '0', '1.0', '广告模块', '', '0', '0', '2015-04-13', '2015-04-13');
INSERT INTO `hc_module` VALUES ('formguide', '表单向导', 'formguide/', '0', '1.0', 'formguide', 'array (\n  \'allowmultisubmit\' => \'1\',\n  \'interval\' => \'30\',\n  \'allowunreg\' => \'0\',\n  \'mailmessage\' => \'用户向我们提交了表单数据，赶快去看看吧。\',\n)', '0', '0', '2010-10-20', '2010-10-20');
INSERT INTO `hc_module` VALUES ('wap', '手机门户', 'wap/', '0', '1.0', '手机门户', '', '0', '0', '2015-04-13', '2015-04-13');
INSERT INTO `hc_module` VALUES ('upgrade', '在线升级', '', '0', '1.0', '', '', '0', '0', '2011-05-18', '2011-05-18');
INSERT INTO `hc_module` VALUES ('tag', '标签向导', 'tag/', '0', '1.0', '标签向导', '', '0', '0', '2015-04-13', '2015-04-13');

-- ----------------------------
-- Table structure for `hc_news`
-- ----------------------------
DROP TABLE IF EXISTS `hc_news`;
CREATE TABLE `hc_news` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `typeid` smallint(5) unsigned NOT NULL,
  `title` varchar(80) NOT NULL DEFAULT '',
  `style` char(24) NOT NULL DEFAULT '',
  `thumb` varchar(100) NOT NULL DEFAULT '',
  `keywords` char(40) NOT NULL DEFAULT '',
  `description` mediumtext NOT NULL,
  `posids` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `url` char(100) NOT NULL,
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `sysadd` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `islink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `status` (`status`,`listorder`,`id`) USING BTREE,
  KEY `listorder` (`catid`,`status`,`listorder`,`id`) USING BTREE,
  KEY `catid` (`catid`,`status`,`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hc_news
-- ----------------------------
INSERT INTO `hc_news` VALUES ('4', '7', '0', '来自虎彩按需服务推广会上的声音', '', 'http://www.hc.com/uploadfile/2015/0611/20150611050555181.jpg', '推广会 声音', '来自虎彩按需服务推广会上的声音来自虎彩按需服务推广会上的声音', '1', 'http://www.hc.com/index.php?m=content&c=index&a=show&catid=7&id=4', '0', '99', '1', '0', 'admin', '1434010257', '1434013558');
INSERT INTO `hc_news` VALUES ('3', '7', '0', '虎彩数字印刷业务覆盖华北华东华南', '', 'http://www.hc.com/uploadfile/2015/0611/20150611050611392.jpg', '虎彩数字印刷', '虎彩数字印刷业务覆盖华北华东华南虎彩数字印刷业务覆盖华北华东华南', '1', 'http://www.hc.com/index.php?m=content&c=index&a=show&catid=7&id=3', '0', '99', '1', '0', 'admin', '1434010084', '1434013574');
INSERT INTO `hc_news` VALUES ('5', '7', '0', '中国外文局与虎彩集团举行战略合作签约仪式(图)', '', 'http://www.hc.com/uploadfile/2015/0611/20150611043845537.jpg', '中国外文局 仪式 战略', '中国外文局与虎彩集团举行战略合作签约仪式(图)中国外文局与虎彩集团举行战略合作签约仪式(图)', '1', 'http://www.hc.com/index.php?m=content&c=index&a=show&catid=7&id=5', '0', '99', '1', '0', 'admin', '1434010309', '1434011930');
INSERT INTO `hc_news` VALUES ('6', '8', '0', '虎彩引爆按需出版市场，致力将数字印刷做到极致，引', '', '', '极致 数字 市场', '虎彩引爆按需出版市场，致力将数字印刷做到极致，引虎彩引爆按需出版市场，致力将数字印刷做到极致，引虎彩引爆按需出版市场，致力将数字印刷做到极致，引', '1', 'http://www.hc.com/index.php?m=content&c=index&a=show&catid=8&id=6', '0', '99', '1', '0', 'admin', '1434010778', '1434010818');
INSERT INTO `hc_news` VALUES ('7', '64', '0', '虎彩介绍', '', 'http://www.hc.com/uploadfile/2015/0612/20150612043238409.jpg', '虎彩介绍', '虎彩印艺股份有限公司成立于1988年，是一家以包装产品的开发、设计、印刷为核心的高新技术企业，中国最优秀的高端奢侈品纸包装供应商，名列中国印刷百强第九名。', '1', 'http://www.hc.com/index.php?m=content&c=index&a=show&catid=64&id=7', '0', '99', '1', '0', 'admin', '1434096436', '1434097964');
INSERT INTO `hc_news` VALUES ('9', '3', '0', '我的方案2', '', 'http://www.hc.com/uploadfile/2015/0613/20150613025404988.jpg', '包装印刷 整体 解决方案', '虎彩印艺业务领域涵盖国内烟、酒、茶、手机、化妆品、牙膏，等众多知名品牌。制造了行业70%以上中高端异型包装。作为中国最顶尖的包装服务商，全球高端包装产品策源地，虎彩印艺具备行', '0', 'http://www.hc.com/index.php?m=content&c=index&a=show&catid=3&id=9', '0', '99', '1', '0', 'admin', '1434176328', '1434178447');
INSERT INTO `hc_news` VALUES ('10', '3', '0', '我的方案', '', 'http://www.hc.com/uploadfile/2015/0613/20150613024424990.jpg', '包装印刷 整体 解决方案', '艺业务领域涵盖国内烟sdfsdfsdfsdf牙膏，等众多知名品牌。制造了行业70%以上中高端异型包装。作为中国最顶尖的包装服务商，全球高端包装产品策源地，虎彩印艺具备行业无法', '0', 'http://www.hc.com/index.php?m=content&c=index&a=show&catid=3&id=10', '0', '99', '1', '0', 'admin', '1434176352', '1434179267');
INSERT INTO `hc_news` VALUES ('11', '7', '0', '关于进一关于开展“迎接挑战、学质', '', 'http://www.hc.com/uploadfile/2015/0613/20150613042333263.jpg', '进一关于进一关于开展“迎', '关于进一关于开展“迎接挑战、学质', '1', 'http://www.hc.com/index.php?m=content&c=index&a=show&catid=7&id=11', '0', '99', '1', '0', 'admin', '1434183762', '1434183819');
INSERT INTO `hc_news` VALUES ('12', '7', '0', '新闻轮播2', '', 'http://www.hc.com/uploadfile/2015/0613/20150613042447930.jpg', '新闻新闻轮播2', '新闻轮播2', '1', 'http://www.hc.com/index.php?m=content&c=index&a=show&catid=7&id=12', '0', '99', '1', '0', 'admin', '1434183835', '1434184092');
INSERT INTO `hc_news` VALUES ('13', '8', '0', '虎彩新闻2', '', '', '新闻虎彩新闻2', '虎彩新闻2', '0', 'http://www.hc.com/index.php?m=content&c=index&a=show&catid=8&id=13', '0', '99', '1', '0', 'admin', '1434185669', '1434185689');
INSERT INTO `hc_news` VALUES ('14', '8', '0', '虎彩新闻3虎彩新闻3虎彩新闻3', '', 'http://www.hc.com/uploadfile/2015/0613/20150613052449648.jpg', '新闻虎彩新闻3', '虎彩新闻3', '1', 'http://www.hc.com/index.php?m=content&c=index&a=show&catid=8&id=14', '0', '99', '1', '0', 'admin', '1434185692', '1434187524');
INSERT INTO `hc_news` VALUES ('15', '8', '0', '虎彩新闻4虎彩新闻4虎彩新闻4虎彩新闻4', '', 'http://www.hc.com/uploadfile/2015/0613/20150613052418529.jpg', '新闻虎彩新闻4', '虎彩新闻4', '1', 'http://www.hc.com/index.php?m=content&c=index&a=show&catid=8&id=15', '0', '99', '1', '0', 'admin', '1434185702', '1434187515');
INSERT INTO `hc_news` VALUES ('16', '9', '0', '产品动态一', '', 'http://www.hc.com/uploadfile/2015/0615/20150615082737236.jpg', '动态 产品产品动态一', '产品动态一', '0', 'http://www.hc.com/index.php?m=content&c=index&a=show&catid=9&id=16', '0', '99', '1', '0', 'admin', '1434327977', '1434328061');
INSERT INTO `hc_news` VALUES ('17', '9', '0', '产品动态二', '', 'http://www.hc.com/uploadfile/2015/0615/20150615082804336.jpg', '动态 产品产品动态二', '产品动态二', '0', 'http://www.hc.com/index.php?m=content&c=index&a=show&catid=9&id=17', '0', '99', '1', '0', 'admin', '1434328063', '1434328087');
INSERT INTO `hc_news` VALUES ('18', '9', '0', '产品动态三', '', 'http://www.hc.com/uploadfile/2015/0615/20150615082830853.jpg', '产品动态三', '产品动态三产品动态三产品动态三产品动态三产品动态三产品动态三产品动态三产品动态三产品动态三产品动态三产品动态三产品动态三产品动态三', '0', 'http://www.hc.com/index.php?m=content&c=index&a=show&catid=9&id=18', '0', '99', '1', '0', 'admin', '1434328089', '1434328112');
INSERT INTO `hc_news` VALUES ('19', '9', '0', '产品动态四', '', 'http://www.hc.com/uploadfile/2015/0615/20150615082859170.jpg', '产品动态四', '产品动态四产品动态四产品动态四产品动态四', '0', 'http://www.hc.com/index.php?m=content&c=index&a=show&catid=9&id=19', '0', '99', '1', '0', 'admin', '1434328114', '1434328143');

-- ----------------------------
-- Table structure for `hc_news_data`
-- ----------------------------
DROP TABLE IF EXISTS `hc_news_data`;
CREATE TABLE `hc_news_data` (
  `id` mediumint(8) unsigned DEFAULT '0',
  `content` mediumtext NOT NULL,
  `readpoint` smallint(5) unsigned NOT NULL DEFAULT '0',
  `groupids_view` varchar(100) NOT NULL,
  `paginationtype` tinyint(1) NOT NULL,
  `maxcharperpage` mediumint(6) NOT NULL,
  `template` varchar(30) NOT NULL,
  `paytype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `relation` varchar(255) NOT NULL DEFAULT '',
  `voteid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `allow_comment` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `copyfrom` varchar(100) NOT NULL DEFAULT '',
  KEY `id` (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hc_news_data
-- ----------------------------
INSERT INTO `hc_news_data` VALUES ('3', '<a>虎彩数字印刷业务覆盖华北华东华南</a><a>虎彩数字印刷业务覆盖华北华东华南</a><a>虎彩数字印刷业务覆盖华北华东华南</a><a>虎彩数字印刷业务覆盖华北华东华南</a><a>虎彩数字印刷业务覆盖华北华东华南</a><a>虎彩数字印刷业务覆盖华北华东华南</a>', '0', '', '0', '10000', '', '0', '', '0', '1', '|0');
INSERT INTO `hc_news_data` VALUES ('4', '<a>来自虎彩按需服务推广会上的声音</a><a>来自虎彩按需服务推广会上的声音</a><a>来自虎彩按需服务推广会上的声音</a><a>来自虎彩按需服务推广会上的声音</a>', '0', '', '0', '10000', '', '0', '', '0', '1', '|0');
INSERT INTO `hc_news_data` VALUES ('5', '<a>中国外文局与虎彩集团举行战略合作签约仪式(图)</a><a>中国外文局与虎彩集团举行战略合作签约仪式(图)</a><a>中国外文局与虎彩集团举行战略合作签约仪式(图)</a><a>中国外文局与虎彩集团举行战略合作签约仪式(图)</a><a>中国外文局与虎彩集团举行战略合作签约仪式(图)</a><a>中国外文局与虎彩集团举行战略合作签约仪式(图)</a><a>中国外文局与虎彩集团举行战略合作签约仪式(图)</a><a>中国外文局与虎彩集团举行战略合作签约仪式(图)</a>', '0', '', '0', '10000', '', '0', '', '0', '1', '|0');
INSERT INTO `hc_news_data` VALUES ('6', '虎彩引爆按需出版市场，致力将数字印刷做到极致，引虎彩引爆按需出版市场，致力将数字印刷做到极致，引虎彩引爆按需出版市场，致力将数字印刷做到极致，引虎彩引爆按需出版市场，致力将数字印刷做到极致，引虎彩引爆按需出版市场，致力将数字印刷做到极致，引虎彩引爆按需出版市场，致力将数字印刷做到极致，引<br />\r\n', '0', '', '0', '10000', '', '0', '', '0', '1', '|0');
INSERT INTO `hc_news_data` VALUES ('7', '<span>虎彩印艺股份有限公司成立于1988年，是一家以包装产品的开发、设计、印刷为核心的高新技术企业，中国最优秀的高端奢侈品纸包装供应商，名列中国印刷百强第九名。<span>虎彩印艺股份有限公司成立于1988年，是一家以包装产品的开发、设计、印刷为核心的高新技术企业，中国最优秀的高端奢侈品纸包装供应商，名列中国印刷百强第九名。<span>虎彩印艺股份有限公司成立于1988年，是一家以包装产品的开发、设计、印刷为核心的高新技术企业，中国最优秀的高端奢侈品纸包装供应商，名列中国印刷百强第九名。</span></span></span>', '0', '', '0', '10000', '', '0', '', '0', '1', '|0');
INSERT INTO `hc_news_data` VALUES ('9', '<strong style=\"color: rgb(0, 0, 0); font-family: Verdana, Geneva, sans-serif; font-size: 14px; line-height: 30px; margin: 0px; padding: 0px;\">彩印艺【全球中高端产品包装策源地】</strong>\r\n<p style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: Verdana, Geneva, sans-serif; font-size: 14px; line-height: 30px;\">虎彩印艺业务领域涵盖国内烟、酒、茶、手机、化妆品、牙膏，等众多知名品牌。制造了行业70%以上中高端异型包装。作为中国最顶尖的包装服务商，全球高端包装产品策源地，虎彩印艺具备行业无法比拟的优势。</p>\r\n<p style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: Verdana, Geneva, sans-serif; font-size: 14px; line-height: 30px;\"><strong style=\"margin: 0px; padding: 0px;\">业务领域:</strong><br style=\"margin: 0px; padding: 0px;\" />\r\n1、中高档烟包、酒包、手机盒、化妆品包装等。<br style=\"margin: 0px; padding: 0px;\" />\r\n2、大型企业的规模化包装配套<br style=\"margin: 0px; padding: 0px;\" />\r\n3、复膜卡、镀铝膜、镭射膜、冷烫膜、金银卡纸</p>\r\n<p style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: Verdana, Geneva, sans-serif; font-size: 14px; line-height: 30px;\"><strong style=\"margin: 0px; padding: 0px;\">一站式服务:</strong></p>\r\n<p style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: Verdana, Geneva, sans-serif; font-size: 14px; line-height: 30px;\">一站式服务：策略沟通+研发设计+材料采购+样品制作+批量生产+包装组装+物流配送，根据客户个性化需求，提供具有综合优势的印刷整体解决方案。</p>\r\n<p style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: Verdana, Geneva, sans-serif; font-size: 14px; line-height: 30px;\"><img src=\"http://www.hc.com/uploadfile/2015/0613/20150613021909294.jpg\" style=\"margin: 0px; padding: 0px; max-width: 100%; height: auto;\" /></p>\r\n<p style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: Verdana, Geneva, sans-serif; font-size: 14px; line-height: 30px;\"><strong style=\"margin: 0px; padding: 0px;\">三大核心价值:</strong></p>\r\n<p style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: Verdana, Geneva, sans-serif; font-size: 14px; line-height: 30px;\">从专注企业价值到聚焦客户价值的战略转变，实现供应商向业务伙伴的角色转换。<br style=\"margin: 0px; padding: 0px;\" />\r\n成本：在客户成本预算范围内，提供高性价比（产品供应、质量及优质</p>\r\n', '0', '', '0', '10000', '', '0', '', '0', '1', '|0');
INSERT INTO `hc_news_data` VALUES ('10', '<font color=\"#000000\" face=\"Verdana, Geneva, sans-serif\"><span style=\"font-size: 14px; line-height: 30px;\"><b>你好：</b></span></font><br />\r\n<p style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: Verdana, Geneva, sans-serif; font-size: 14px; line-height: 30px;\">* 五位一体的产品开发体系，为客户提供创新的印刷解决方案。<br style=\"margin: 0px; padding: 0px;\" />\r\n* 虎彩激光材料科技有限公司，为客户在原材料环节，提供个性化装饰、防伪、环保的专属订制服务<br style=\"margin: 0px; padding: 0px;\" />\r\n* 柔性生产，灵活满足客户订单数量、交期、产品（服务）变化的弹性需求。<br style=\"margin: 0px; padding: 0px;\" />\r\n* TPM现场改善及工程管理体系<br style=\"margin: 0px; padding: 0px;\" />\r\n* 项目经理制，&ldquo;一对一&rdquo;专属服务<br style=\"margin: 0px; padding: 0px;\" />\r\n* 食品级包装印刷生产线<br style=\"margin: 0px; padding: 0px;\" />\r\n* 全球范围内高端客户印刷配套服务能力<br style=\"margin: 0px; padding: 0px;\" />\r\n* 通过ISO 9001、ISO 14001、ISO 18001、SA8000、HACCP、RoHS、BRC等认证<br style=\"margin: 0px; padding: 0px;\" />\r\n* 增值服务：提供完善的包装产品组合及相关配套组装服务，提供库存管理服务，物流配送&hellip;&hellip;</p>\r\n<br style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: Verdana, Geneva, sans-serif; font-size: 14px; line-height: 30px;\" />\r\n<p style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: Verdana, Geneva, sans-serif; font-size: 14px; line-height: 30px;\">虎彩优势一览：因为专业，所以卓越；因为卓越，所以超越。</p>\r\n<p style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: Verdana, Geneva, sans-serif; font-size: 14px; line-height: 30px;\"><strong style=\"margin: 0px; padding: 0px;\">1、研发优势</strong>：虎彩拥有业界最具规模的烟包、酒包、化妆品包装、手机包装等大研发平台。涵盖产品策划、平面设计、盒型设计、工艺设计、产品实现全价值链环节。一体化服务方式：包装设计：成立印刷行业首家设计部策划师、包装设计师、结构设计师工艺研发：全产业链的技术研发材料工程师、研发工程师、打样工艺师、打样机台、白样组&nbsp;。</p>\r\n<p style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: Verdana, Geneva, sans-serif; font-size: 14px; line-height: 30px;\"><strong style=\"margin: 0px; padding: 0px;\">2、精致手工</strong>：虎彩手工车间由2000人组成，拥有业界最具规模的中高端包装产能。通过设备的自动化改造、导入TPM现场改善等技术和流程措施，规模化精致手工优势已成为虎彩高端烟包领域的核心竞争力之一。</p>\r\n<p style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: Verdana, Geneva, sans-serif; font-size: 14px; line-height: 30px;\"><strong style=\"margin: 0px; padding: 0px;\">3、数字印刷</strong>:虎彩拥有亚洲最大的数码机群，在业界率先引进HP&nbsp;T300和T350数码机，单位印速高达122米/分钟和145米/分钟。可完成为客户提供优质、高效的个性化按需印刷服务。单张起印反应快，可达成当天打样、看样、取样内容修改快速便捷，缩短客户时间成本。</p>\r\n<p style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: Verdana, Geneva, sans-serif; font-size: 14px; line-height: 30px;\"><strong style=\"margin: 0px; padding: 0px;\">4、设备优势</strong>：虎彩有业界最顶级的印刷生产设备，而且不断更新，以应对包装行业的不断变化和满足客户的需求。而且能根据客户设计需求的随时变化，以最快速的反应完成修改。&nbsp;</p>\r\n<p style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: Verdana, Geneva, sans-serif; font-size: 14px; line-height: 30px;\"><strong style=\"margin: 0px; padding: 0px;\">5、技术优势</strong>：虎彩致力于差异化工艺技术研发，是亚洲第一家将冷烫技术运用于产品包装的印刷企业。是先烫后印、冷烫等差异化工艺技术的创领者。</p>\r\n<p style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: Verdana, Geneva, sans-serif; font-size: 14px; line-height: 30px;\"><strong style=\"margin: 0px; padding: 0px;\">6、数字化优势</strong>：虎彩通过数字信息平台进行高效率、全程化管理，与客户实现基于数字信息共享的战略价值共赢。</p>\r\n<p style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: Verdana, Geneva, sans-serif; font-size: 14px; line-height: 30px;\"><strong style=\"margin: 0px; padding: 0px;\">7、品质优势</strong>：虎彩秉承&ldquo;员工素质高，凡事做最好，</p>\r\n', '0', '', '0', '10000', '', '0', '', '0', '1', '|0');
INSERT INTO `hc_news_data` VALUES ('11', '<span class=\"shadow\"><a href=\"file:///D:/phpStudy/WWW/hucai/hc/news.html#\" target=\"_blank\">关于进一关于开展&ldquo;迎接挑战、学质</a></span><span class=\"shadow\"><a href=\"file:///D:/phpStudy/WWW/hucai/hc/news.html#\" target=\"_blank\">关于进一关于开展&ldquo;迎接挑战、学质</a></span><span class=\"shadow\"><a href=\"file:///D:/phpStudy/WWW/hucai/hc/news.html#\" target=\"_blank\">关于进一关于开展&ldquo;迎接挑战、学质</a></span><span class=\"shadow\"><a href=\"file:///D:/phpStudy/WWW/hucai/hc/news.html#\" target=\"_blank\">关于进一关于开展&ldquo;迎接挑战、学质</a></span><span class=\"shadow\"><a href=\"file:///D:/phpStudy/WWW/hucai/hc/news.html#\" target=\"_blank\">关于进一关于开展&ldquo;迎接挑战、学质</a></span><span class=\"shadow\"><a href=\"file:///D:/phpStudy/WWW/hucai/hc/news.html#\" target=\"_blank\">关于进一关于开展&ldquo;迎接挑战、学质</a></span><span class=\"shadow\"><a href=\"file:///D:/phpStudy/WWW/hucai/hc/news.html#\" target=\"_blank\">关于进一关于开展&ldquo;迎接挑战、学质</a></span><span class=\"shadow\"><a href=\"file:///D:/phpStudy/WWW/hucai/hc/news.html#\" target=\"_blank\">关于进一关于开展&ldquo;迎接挑战、学质</a></span><span class=\"shadow\"><a href=\"file:///D:/phpStudy/WWW/hucai/hc/news.html#\" target=\"_blank\">关于进一关于开展&ldquo;迎接挑战、学质</a></span><span class=\"shadow\"><a href=\"file:///D:/phpStudy/WWW/hucai/hc/news.html#\" target=\"_blank\">关于进一关于开展&ldquo;迎接挑战、学质</a></span><span class=\"shadow\"><a href=\"file:///D:/phpStudy/WWW/hucai/hc/news.html#\" target=\"_blank\">关于进一关于开展&ldquo;迎接挑战、学质</a></span><span class=\"shadow\"><a href=\"file:///D:/phpStudy/WWW/hucai/hc/news.html#\" target=\"_blank\">关于进一关于开展&ldquo;迎接挑战、学质</a></span>', '0', '', '0', '10000', '', '0', '', '0', '1', '|0');
INSERT INTO `hc_news_data` VALUES ('12', '新闻轮播2新闻轮播2新闻轮播2新闻轮播2新闻轮播2新闻轮播2新闻轮播2新闻轮播2新闻轮播2新闻轮播2新闻轮播2新闻轮播2新闻轮播2新闻轮播2新闻轮播2新闻轮播2新闻轮播2新闻轮播2新闻轮播2新闻轮播2新闻轮播2新闻轮播2新闻轮播2新闻轮播2新闻轮播2新闻轮播2新闻轮播2新闻轮播2新闻轮播2新闻轮播2新闻轮播2新闻轮播2新闻轮播2新闻轮播2新闻轮播2新闻轮播2新闻轮播2新闻轮播2新闻轮播2新闻轮播2新闻轮播2新闻轮播2新闻轮播2新闻轮播2新闻轮播2新闻轮播2新闻轮播2新闻轮播2新闻轮播2新闻轮播2新闻轮播2新闻轮播2新闻轮播2新闻轮播2新闻轮播2新闻轮播2新闻轮播2新闻轮播2新闻轮播2新闻轮播2新闻轮播2新闻轮播2新闻轮播2新闻轮播2新闻轮播2新闻轮播2新闻轮播2新闻轮播2新闻轮播2新闻轮播2新闻轮播2新闻轮播2新闻轮播2新闻轮播2新闻轮播2新闻轮播2新闻轮播2新闻轮播2新闻轮播2新闻轮播2新闻轮播2新闻轮播2新闻轮播2新闻轮播2新闻轮播2新闻轮播2新闻轮播2', '0', '', '0', '10000', '', '0', '', '0', '1', '|0');
INSERT INTO `hc_news_data` VALUES ('13', '虎彩新闻2虎彩新闻2虎彩新闻2虎彩新闻2虎彩新闻2虎彩新闻2虎彩新闻2虎彩新闻2虎彩新闻2虎彩新闻2虎彩新闻2虎彩新闻2虎彩新闻2虎彩新闻2虎彩新闻2虎彩新闻2虎彩新闻2虎彩新闻2虎彩新闻2虎彩新闻2虎彩新闻2虎彩新闻2虎彩新闻2虎彩新闻2虎彩新闻2虎彩新闻2虎彩新闻2虎彩新闻2虎彩新闻2虎彩新闻2虎彩新闻2虎彩新闻2虎彩新闻2虎彩新闻2虎彩新闻2虎彩新闻2', '0', '', '0', '10000', '', '0', '', '0', '1', '虎彩新闻2|0');
INSERT INTO `hc_news_data` VALUES ('14', '虎彩新闻3虎彩新闻3虎彩新闻3虎彩新闻3虎彩新闻3虎彩新闻3虎彩新闻3虎彩新闻3虎彩新闻3虎彩新闻3虎彩新闻3虎彩新闻3虎彩新闻3虎彩新闻3虎彩新闻3虎彩新闻3虎彩新闻3虎彩新闻3虎彩新闻3虎彩新闻3虎彩新闻3虎彩新闻3虎彩新闻3虎彩新闻3虎彩新闻3虎彩新闻3虎彩新闻3虎彩新闻3虎彩新闻3虎彩新闻3', '0', '', '0', '10000', '', '0', '', '0', '1', '虎彩新闻3|0');
INSERT INTO `hc_news_data` VALUES ('15', '虎彩新闻4虎彩新闻4虎彩新闻4虎彩新闻4虎彩新闻4虎彩新闻4虎彩新闻4虎彩新闻4虎彩新闻4虎彩新闻4虎彩新闻4虎彩新闻4虎彩新闻4虎彩新闻4虎彩新闻4虎彩新闻4虎彩新闻4虎彩新闻4虎彩新闻4虎彩新闻4虎彩新闻4虎彩新闻4虎彩新闻4虎彩新闻4虎彩新闻4虎彩新闻4虎彩新闻4', '0', '', '0', '10000', '', '0', '', '0', '1', '虎彩新闻4|0');
INSERT INTO `hc_news_data` VALUES ('16', '产品动态一产品动态一产品动态一产品动态一产品动态一产品动态一产品动态一', '0', '', '0', '10000', '', '0', '', '0', '1', '|0');
INSERT INTO `hc_news_data` VALUES ('17', '产品动态二产品动态二产品动态二产品动态二产品动态二产品动态二产品动态二产品动态二产品动态二产品动态二产品动态二产品动态二产品动态二产品动态二产品动态二', '0', '', '0', '10000', '', '0', '', '0', '1', '|0');
INSERT INTO `hc_news_data` VALUES ('18', '产品动态三产品动态三产品动态三产品动态三产品动态三产品动态三产品动态三产品动态三产品动态三产品动态三产品动态三产品动态三产品动态三', '0', '', '0', '10000', '', '0', '', '0', '1', '|0');
INSERT INTO `hc_news_data` VALUES ('19', '产品动态四产品动态四产品动态四产品动态四产品动态四产品动态四产品动态四产品动态四产品动态四产品动态四产品动态四产品动态四产品动态四产品动态四产品动态四产品动态四产品动态四产品动态四产品动态四产品动态四产品动态四产品动态四产品动态四产品动态四', '0', '', '0', '10000', '', '0', '', '0', '1', '|0');

-- ----------------------------
-- Table structure for `hc_page`
-- ----------------------------
DROP TABLE IF EXISTS `hc_page`;
CREATE TABLE `hc_page` (
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `title` varchar(160) NOT NULL,
  `style` varchar(24) NOT NULL,
  `keywords` varchar(40) NOT NULL,
  `content` text NOT NULL,
  `template` varchar(30) NOT NULL,
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  KEY `catid` (`catid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hc_page
-- ----------------------------

-- ----------------------------
-- Table structure for `hc_pay_account`
-- ----------------------------
DROP TABLE IF EXISTS `hc_pay_account`;
CREATE TABLE `hc_pay_account` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `trade_sn` char(50) NOT NULL,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `contactname` char(50) NOT NULL,
  `email` char(40) NOT NULL,
  `telephone` char(20) NOT NULL,
  `discount` float(8,2) NOT NULL DEFAULT '0.00',
  `money` char(8) NOT NULL,
  `quantity` int(8) unsigned NOT NULL DEFAULT '1',
  `addtime` int(10) NOT NULL DEFAULT '0',
  `paytime` int(10) NOT NULL DEFAULT '0',
  `usernote` char(255) NOT NULL,
  `pay_id` tinyint(3) NOT NULL,
  `pay_type` enum('offline','recharge','selfincome','online') NOT NULL DEFAULT 'recharge',
  `payment` char(90) NOT NULL,
  `type` tinyint(3) NOT NULL DEFAULT '1',
  `ip` char(15) NOT NULL DEFAULT '0.0.0.0',
  `status` enum('succ','failed','error','progress','timeout','cancel','waitting','unpay') NOT NULL DEFAULT 'unpay',
  `adminnote` char(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `status` (`status`) USING BTREE,
  KEY `userid` (`userid`) USING BTREE,
  KEY `trade_sn` (`trade_sn`,`money`,`status`,`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hc_pay_account
-- ----------------------------

-- ----------------------------
-- Table structure for `hc_pay_payment`
-- ----------------------------
DROP TABLE IF EXISTS `hc_pay_payment`;
CREATE TABLE `hc_pay_payment` (
  `pay_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) NOT NULL,
  `pay_name` varchar(120) NOT NULL,
  `pay_code` varchar(20) NOT NULL,
  `pay_desc` text NOT NULL,
  `pay_method` tinyint(1) DEFAULT NULL,
  `pay_fee` varchar(10) NOT NULL,
  `config` text NOT NULL,
  `is_cod` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_online` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `pay_order` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `author` varchar(100) NOT NULL,
  `website` varchar(100) NOT NULL,
  `version` varchar(20) NOT NULL,
  PRIMARY KEY (`pay_id`),
  KEY `pay_code` (`pay_code`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hc_pay_payment
-- ----------------------------

-- ----------------------------
-- Table structure for `hc_pay_spend`
-- ----------------------------
DROP TABLE IF EXISTS `hc_pay_spend`;
CREATE TABLE `hc_pay_spend` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `creat_at` int(10) unsigned NOT NULL DEFAULT '0',
  `userid` int(10) unsigned NOT NULL DEFAULT '0',
  `username` varchar(20) NOT NULL,
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `logo` varchar(20) NOT NULL,
  `value` int(5) NOT NULL,
  `op_userid` int(10) unsigned NOT NULL DEFAULT '0',
  `op_username` char(20) NOT NULL,
  `msg` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `type` (`type`) USING BTREE,
  KEY `creat_at` (`creat_at`) USING BTREE,
  KEY `logo` (`logo`) USING BTREE,
  KEY `userid` (`userid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hc_pay_spend
-- ----------------------------

-- ----------------------------
-- Table structure for `hc_picture`
-- ----------------------------
DROP TABLE IF EXISTS `hc_picture`;
CREATE TABLE `hc_picture` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `typeid` smallint(5) unsigned NOT NULL,
  `title` char(80) NOT NULL DEFAULT '',
  `style` char(24) NOT NULL DEFAULT '',
  `thumb` char(100) NOT NULL DEFAULT '',
  `keywords` char(40) NOT NULL DEFAULT '',
  `description` char(255) NOT NULL DEFAULT '',
  `posids` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `url` char(100) NOT NULL,
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `sysadd` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `islink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `status` (`status`,`listorder`,`id`) USING BTREE,
  KEY `listorder` (`catid`,`status`,`listorder`,`id`) USING BTREE,
  KEY `catid` (`catid`,`status`,`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hc_picture
-- ----------------------------

-- ----------------------------
-- Table structure for `hc_picture_data`
-- ----------------------------
DROP TABLE IF EXISTS `hc_picture_data`;
CREATE TABLE `hc_picture_data` (
  `id` mediumint(8) unsigned DEFAULT '0',
  `content` text NOT NULL,
  `readpoint` smallint(5) unsigned NOT NULL DEFAULT '0',
  `groupids_view` varchar(100) NOT NULL,
  `paginationtype` tinyint(1) NOT NULL,
  `maxcharperpage` mediumint(6) NOT NULL,
  `template` varchar(30) NOT NULL,
  `paytype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `relation` varchar(255) NOT NULL DEFAULT '',
  `pictureurls` mediumtext NOT NULL,
  `copyfrom` varchar(255) NOT NULL DEFAULT '',
  `allow_comment` tinyint(1) unsigned NOT NULL DEFAULT '1',
  KEY `id` (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hc_picture_data
-- ----------------------------

-- ----------------------------
-- Table structure for `hc_position`
-- ----------------------------
DROP TABLE IF EXISTS `hc_position`;
CREATE TABLE `hc_position` (
  `posid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `modelid` smallint(5) unsigned DEFAULT '0',
  `catid` smallint(5) unsigned DEFAULT '0',
  `name` char(30) NOT NULL DEFAULT '',
  `maxnum` smallint(5) NOT NULL DEFAULT '20',
  `extention` char(100) DEFAULT NULL,
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `thumb` varchar(150) NOT NULL DEFAULT '',
  PRIMARY KEY (`posid`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hc_position
-- ----------------------------
INSERT INTO `hc_position` VALUES ('1', '0', '2', '首页图片新闻', '3', '', '1', '0', '');
INSERT INTO `hc_position` VALUES ('2', '0', '2', '首页视频新闻', '3', '', '2', '0', '');
INSERT INTO `hc_position` VALUES ('5', '0', '0', '首页滚动消息', '10', '', '3', '0', '');
INSERT INTO `hc_position` VALUES ('8', '0', '2', '首页新闻中心', '6', '', '4', '0', '');
INSERT INTO `hc_position` VALUES ('9', '0', '64', '首页“虎彩介绍”', '1', '', '5', '0', '');
INSERT INTO `hc_position` VALUES ('18', '1', '2', '新闻页轮播', '20', '', '0', '1', '');
INSERT INTO `hc_position` VALUES ('19', '0', '0', '新闻置顶', '20', '', '0', '0', '');
INSERT INTO `hc_position` VALUES ('20', '12', '1', '产品首页推荐', '5', '', '6', '1', '');

-- ----------------------------
-- Table structure for `hc_position_data`
-- ----------------------------
DROP TABLE IF EXISTS `hc_position_data`;
CREATE TABLE `hc_position_data` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `posid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `module` char(20) DEFAULT NULL,
  `modelid` smallint(6) unsigned DEFAULT '0',
  `thumb` tinyint(1) NOT NULL DEFAULT '0',
  `data` mediumtext,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '1',
  `listorder` mediumint(8) DEFAULT '0',
  `expiration` int(10) NOT NULL,
  `extention` char(30) DEFAULT NULL,
  `synedit` tinyint(1) DEFAULT '0',
  KEY `posid` (`posid`) USING BTREE,
  KEY `listorder` (`listorder`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hc_position_data
-- ----------------------------
INSERT INTO `hc_position_data` VALUES ('3', '7', '2', 'content', '1', '1', 'array (\n  \'title\' => \'虎彩数字印刷业务覆盖华北华东华南\',\n  \'description\' => \'虎彩数字印刷业务覆盖华北华东华南虎彩数字印刷业务覆盖华北华东华南\',\n  \'thumb\' => \'http://www.hc.com/uploadfile/2015/0611/20150611050611392.jpg\',\n  \'inputtime\' => \'1434010084\',\n  \'style\' => \'\',\n)', '1', '3', '0', null, '0');
INSERT INTO `hc_position_data` VALUES ('3', '7', '12', 'content', '1', '1', 'array (\n  \'title\' => \'虎彩数字印刷业务覆盖华北华东华南\',\n  \'description\' => \'虎彩数字印刷业务覆盖华北华东华南虎彩数字印刷业务覆盖华北华东华南\',\n  \'thumb\' => \'http://www.hc.com/uploadfile/2015/0611/20150611050611392.jpg\',\n  \'inputtime\' => \'1434010084\',\n  \'style\' => \'\',\n)', '1', '3', '0', null, '0');
INSERT INTO `hc_position_data` VALUES ('4', '7', '2', 'content', '1', '1', 'array (\n  \'title\' => \'来自虎彩按需服务推广会上的声音\',\n  \'description\' => \'来自虎彩按需服务推广会上的声音来自虎彩按需服务推广会上的声音\',\n  \'thumb\' => \'http://www.hc.com/uploadfile/2015/0611/20150611050555181.jpg\',\n  \'inputtime\' => \'1434010257\',\n  \'style\' => \'\',\n)', '1', '4', '0', null, '0');
INSERT INTO `hc_position_data` VALUES ('4', '7', '12', 'content', '1', '1', 'array (\n  \'title\' => \'来自虎彩按需服务推广会上的声音\',\n  \'description\' => \'来自虎彩按需服务推广会上的声音来自虎彩按需服务推广会上的声音\',\n  \'thumb\' => \'http://www.hc.com/uploadfile/2015/0611/20150611050555181.jpg\',\n  \'inputtime\' => \'1434010257\',\n  \'style\' => \'\',\n)', '1', '4', '0', null, '0');
INSERT INTO `hc_position_data` VALUES ('5', '7', '2', 'content', '1', '1', 'array (\n  \'title\' => \'中国外文局与虎彩集团举行战略合作签约仪式(图)\',\n  \'description\' => \'中国外文局与虎彩集团举行战略合作签约仪式(图)中国外文局与虎彩集团举行战略合作签约仪式(图)\',\n  \'thumb\' => \'http://www.hc.com/uploadfile/2015/0611/20150611043845537.jpg\',\n  \'inputtime\' => \'1434010309\',\n  \'style\' => \'\',\n)', '1', '5', '0', null, '0');
INSERT INTO `hc_position_data` VALUES ('5', '7', '12', 'content', '1', '1', 'array (\n  \'title\' => \'中国外文局与虎彩集团举行战略合作签约仪式(图)\',\n  \'description\' => \'中国外文局与虎彩集团举行战略合作签约仪式(图)中国外文局与虎彩集团举行战略合作签约仪式(图)\',\n  \'thumb\' => \'http://www.hc.com/uploadfile/2015/0611/20150611043845537.jpg\',\n  \'inputtime\' => \'1434010309\',\n  \'style\' => \'\',\n)', '1', '5', '0', null, '0');
INSERT INTO `hc_position_data` VALUES ('6', '8', '9', 'content', '1', '0', 'array (\n  \'title\' => \'虎彩引爆按需出版市场，致力将数字印刷做到极致，引\',\n  \'description\' => \'虎彩引爆按需出版市场，致力将数字印刷做到极致，引虎彩引爆按需出版市场，致力将数字印刷做到极致，引虎彩引爆按需出版市场，致力将数字印刷做到极致，引\',\n  \'thumb\' => \'\',\n  \'inputtime\' => \'1434010778\',\n)', '1', '6', '0', null, '0');
INSERT INTO `hc_position_data` VALUES ('5', '7', '9', 'content', '1', '1', 'array (\n  \'title\' => \'中国外文局与虎彩集团举行战略合作签约仪式(图)\',\n  \'description\' => \'中国外文局与虎彩集团举行战略合作签约仪式(图)中国外文局与虎彩集团举行战略合作签约仪式(图)\',\n  \'thumb\' => \'http://www.hc.com/uploadfile/2015/0611/20150611043845537.jpg\',\n  \'inputtime\' => \'1434010309\',\n  \'style\' => \'\',\n)', '1', '5', '0', null, '0');
INSERT INTO `hc_position_data` VALUES ('4', '7', '9', 'content', '1', '1', 'array (\n  \'title\' => \'来自虎彩按需服务推广会上的声音\',\n  \'description\' => \'来自虎彩按需服务推广会上的声音来自虎彩按需服务推广会上的声音\',\n  \'thumb\' => \'http://www.hc.com/uploadfile/2015/0611/20150611050555181.jpg\',\n  \'inputtime\' => \'1434010257\',\n  \'style\' => \'\',\n)', '1', '4', '0', null, '0');
INSERT INTO `hc_position_data` VALUES ('3', '7', '9', 'content', '1', '1', 'array (\n  \'title\' => \'虎彩数字印刷业务覆盖华北华东华南\',\n  \'description\' => \'虎彩数字印刷业务覆盖华北华东华南虎彩数字印刷业务覆盖华北华东华南\',\n  \'thumb\' => \'http://www.hc.com/uploadfile/2015/0611/20150611050611392.jpg\',\n  \'inputtime\' => \'1434010084\',\n  \'style\' => \'\',\n)', '1', '3', '0', null, '0');
INSERT INTO `hc_position_data` VALUES ('5', '7', '1', 'content', '1', '1', 'array (\n  \'title\' => \'中国外文局与虎彩集团举行战略合作签约仪式(图)\',\n  \'description\' => \'中国外文局与虎彩集团举行战略合作签约仪式(图)中国外文局与虎彩集团举行战略合作签约仪式(图)\',\n  \'thumb\' => \'http://www.hc.com/uploadfile/2015/0611/20150611043845537.jpg\',\n  \'inputtime\' => \'1434010309\',\n  \'style\' => \'\',\n)', '1', '5', '0', null, '0');
INSERT INTO `hc_position_data` VALUES ('4', '7', '1', 'content', '1', '1', 'array (\n  \'title\' => \'来自虎彩按需服务推广会上的声音\',\n  \'description\' => \'来自虎彩按需服务推广会上的声音来自虎彩按需服务推广会上的声音\',\n  \'thumb\' => \'http://www.hc.com/uploadfile/2015/0611/20150611050555181.jpg\',\n  \'inputtime\' => \'1434010257\',\n  \'style\' => \'\',\n)', '1', '4', '0', null, '0');
INSERT INTO `hc_position_data` VALUES ('3', '7', '1', 'content', '1', '1', 'array (\n  \'title\' => \'虎彩数字印刷业务覆盖华北华东华南\',\n  \'description\' => \'虎彩数字印刷业务覆盖华北华东华南虎彩数字印刷业务覆盖华北华东华南\',\n  \'thumb\' => \'http://www.hc.com/uploadfile/2015/0611/20150611050611392.jpg\',\n  \'inputtime\' => \'1434010084\',\n  \'style\' => \'\',\n)', '1', '3', '0', null, '0');
INSERT INTO `hc_position_data` VALUES ('5', '7', '8', 'content', '1', '1', 'array (\n  \'title\' => \'中国外文局与虎彩集团举行战略合作签约仪式(图)\',\n  \'description\' => \'中国外文局与虎彩集团举行战略合作签约仪式(图)中国外文局与虎彩集团举行战略合作签约仪式(图)\',\n  \'thumb\' => \'http://www.hc.com/uploadfile/2015/0611/20150611043845537.jpg\',\n  \'inputtime\' => \'1434010309\',\n  \'style\' => \'\',\n)', '1', '5', '0', null, '0');
INSERT INTO `hc_position_data` VALUES ('4', '7', '8', 'content', '1', '1', 'array (\n  \'title\' => \'来自虎彩按需服务推广会上的声音\',\n  \'description\' => \'来自虎彩按需服务推广会上的声音来自虎彩按需服务推广会上的声音\',\n  \'thumb\' => \'http://www.hc.com/uploadfile/2015/0611/20150611050555181.jpg\',\n  \'inputtime\' => \'1434010257\',\n  \'style\' => \'\',\n)', '1', '4', '0', null, '0');
INSERT INTO `hc_position_data` VALUES ('3', '7', '8', 'content', '1', '1', 'array (\n  \'title\' => \'虎彩数字印刷业务覆盖华北华东华南\',\n  \'description\' => \'虎彩数字印刷业务覆盖华北华东华南虎彩数字印刷业务覆盖华北华东华南\',\n  \'thumb\' => \'http://www.hc.com/uploadfile/2015/0611/20150611050611392.jpg\',\n  \'inputtime\' => \'1434010084\',\n  \'style\' => \'\',\n)', '1', '3', '0', null, '0');
INSERT INTO `hc_position_data` VALUES ('5', '7', '5', 'content', '1', '1', 'array (\n  \'title\' => \'中国外文局与虎彩集团举行战略合作签约仪式(图)\',\n  \'description\' => \'中国外文局与虎彩集团举行战略合作签约仪式(图)中国外文局与虎彩集团举行战略合作签约仪式(图)\',\n  \'thumb\' => \'http://www.hc.com/uploadfile/2015/0611/20150611043845537.jpg\',\n  \'inputtime\' => \'1434010309\',\n  \'style\' => \'\',\n)', '1', '5', '0', null, '0');
INSERT INTO `hc_position_data` VALUES ('4', '7', '5', 'content', '1', '1', 'array (\n  \'title\' => \'来自虎彩按需服务推广会上的声音\',\n  \'description\' => \'来自虎彩按需服务推广会上的声音来自虎彩按需服务推广会上的声音\',\n  \'thumb\' => \'http://www.hc.com/uploadfile/2015/0611/20150611050555181.jpg\',\n  \'inputtime\' => \'1434010257\',\n  \'style\' => \'\',\n)', '1', '4', '0', null, '0');
INSERT INTO `hc_position_data` VALUES ('3', '7', '5', 'content', '1', '1', 'array (\n  \'title\' => \'虎彩数字印刷业务覆盖华北华东华南\',\n  \'description\' => \'虎彩数字印刷业务覆盖华北华东华南虎彩数字印刷业务覆盖华北华东华南\',\n  \'thumb\' => \'http://www.hc.com/uploadfile/2015/0611/20150611050611392.jpg\',\n  \'inputtime\' => \'1434010084\',\n  \'style\' => \'\',\n)', '1', '3', '0', null, '0');
INSERT INTO `hc_position_data` VALUES ('7', '64', '9', 'content', '1', '1', 'array (\n  \'title\' => \'虎彩介绍\',\n  \'description\' => \'虎彩印艺股份有限公司成立于1988年，是一家以包装产品的开发、设计、印刷为核心的高新技术企业，中国最优秀的高端奢侈品纸包装供应商，名列中国印刷百强第九名。\',\n  \'thumb\' => \'http://www.hc.com/uploadfile/2015/0612/20150612043238409.jpg\',\n  \'inputtime\' => \'1434096436\',\n  \'style\' => \'\',\n)', '1', '7', '0', null, '0');
INSERT INTO `hc_position_data` VALUES ('11', '7', '18', 'content', '1', '1', 'array (\n  \'title\' => \'关于进一关于开展“迎接挑战、学质\',\n  \'description\' => \'关于进一关于开展“迎接挑战、学质\',\n  \'thumb\' => \'http://www.hc.com/uploadfile/2015/0613/20150613042333263.jpg\',\n  \'inputtime\' => \'1434183762\',\n)', '1', '11', '0', null, '0');
INSERT INTO `hc_position_data` VALUES ('12', '7', '18', 'content', '1', '1', 'array (\n  \'title\' => \'新闻轮播2\',\n  \'description\' => \'新闻轮播2\',\n  \'thumb\' => \'http://www.hc.com/uploadfile/2015/0613/20150613042447930.jpg\',\n  \'inputtime\' => \'1434183835\',\n  \'style\' => \'\',\n)', '1', '12', '0', null, '0');
INSERT INTO `hc_position_data` VALUES ('15', '8', '19', 'content', '1', '1', 'array (\n  \'title\' => \'虎彩新闻4虎彩新闻4虎彩新闻4虎彩新闻4\',\n  \'description\' => \'虎彩新闻4\',\n  \'thumb\' => \'http://www.hc.com/uploadfile/2015/0613/20150613052418529.jpg\',\n  \'inputtime\' => \'1434185702\',\n  \'style\' => \'\',\n)', '1', '15', '0', null, '0');
INSERT INTO `hc_position_data` VALUES ('14', '8', '19', 'content', '1', '1', 'array (\n  \'title\' => \'虎彩新闻3虎彩新闻3虎彩新闻3\',\n  \'description\' => \'虎彩新闻3\',\n  \'thumb\' => \'http://www.hc.com/uploadfile/2015/0613/20150613052449648.jpg\',\n  \'inputtime\' => \'1434185692\',\n  \'style\' => \'\',\n)', '1', '14', '0', null, '0');
INSERT INTO `hc_position_data` VALUES ('3', '19', '20', 'content', '12', '1', 'array (\n  \'title\' => \'王冠雪茄\',\n  \'description\' => \'适当放松的放松的放松\',\n  \'thumb\' => \'http://www.hc.com/uploadfile/2015/0615/20150615052538965.jpg\',\n  \'inputtime\' => \'1434360298\',\n)', '1', '3', '0', null, '0');
INSERT INTO `hc_position_data` VALUES ('2', '16', '20', 'content', '12', '1', 'array (\n  \'title\' => \'大重九香烟\',\n  \'description\' => \'sdfsdfsdfsfsfsdfsdfsdf对方斯蒂芬斯蒂芬森\',\n  \'thumb\' => \'http://www.hc.com/uploadfile/2015/0615/20150615050929543.jpg\',\n  \'inputtime\' => \'1434360169\',\n  \'style\' => \'\',\n)', '1', '2', '0', null, '0');
INSERT INTO `hc_position_data` VALUES ('4', '17', '20', 'content', '12', '1', 'array (\n  \'title\' => \'人头马XO\',\n  \'description\' => \'电风扇电风扇电风扇电风扇电风扇斯蒂芬森\',\n  \'thumb\' => \'http://www.hc.com/uploadfile/2015/0616/20150616094956328.jpg\',\n  \'inputtime\' => \'1434419358\',\n  \'style\' => \'\',\n)', '1', '4', '0', null, '0');
INSERT INTO `hc_position_data` VALUES ('5', '18', '20', 'content', '12', '1', 'array (\n  \'title\' => \'彩盒\',\n  \'description\' => \'第三方斯蒂芬斯蒂芬斯蒂芬森的\',\n  \'thumb\' => \'http://www.hc.com/uploadfile/2015/0616/20150616095157809.jpg\',\n  \'inputtime\' => \'1434419495\',\n)', '1', '5', '0', null, '0');
INSERT INTO `hc_position_data` VALUES ('6', '17', '20', 'content', '12', '1', 'array (\n  \'title\' => \'澳洲闻名品牌\',\n  \'description\' => \'适当放松的放松的放松\',\n  \'thumb\' => \'http://www.hc.com/uploadfile/2015/0616/20150616095300407.jpg\',\n  \'inputtime\' => \'1434419541\',\n)', '1', '6', '0', null, '0');

-- ----------------------------
-- Table structure for `hc_poster`
-- ----------------------------
DROP TABLE IF EXISTS `hc_poster`;
CREATE TABLE `hc_poster` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `name` varchar(40) NOT NULL,
  `spaceid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `type` varchar(10) NOT NULL,
  `setting` text NOT NULL,
  `startdate` int(10) unsigned NOT NULL DEFAULT '0',
  `enddate` int(10) unsigned NOT NULL DEFAULT '0',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  `hits` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `clicks` smallint(5) unsigned NOT NULL DEFAULT '0',
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `spaceid` (`spaceid`,`siteid`,`disabled`,`listorder`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hc_poster
-- ----------------------------
INSERT INTO `hc_poster` VALUES ('15', '1', '产品广告2', '12', 'images', 'array (\n  1 => \n  array (\n    \'linkurl\' => \'http://baidu.com\',\n    \'imageurl\' => \'http://www.hc.com/uploadfile/2015/0615/20150615015424501.jpg\',\n    \'alt\' => \'\',\n  ),\n)', '1434347640', '1436939640', '1434347668', '0', '2', '0', '0');
INSERT INTO `hc_poster` VALUES ('14', '1', '产品广告1', '12', 'images', 'array (\n  1 => \n  array (\n    \'linkurl\' => \'http://baidu.com\',\n    \'imageurl\' => \'http://www.hc.com/uploadfile/2015/0615/20150615015348920.jpg\',\n    \'alt\' => \'\',\n  ),\n)', '1434347564', '1436939564', '1434347635', '0', '0', '0', '0');
INSERT INTO `hc_poster` VALUES ('11', '1', '测试广告', '11', 'images', 'array (\n  1 => \n  array (\n    \'linkurl\' => \'\',\n    \'imageurl\' => \'http://www.hc.com/uploadfile/2015/0611/20150611110020522.jpg\',\n    \'alt\' => \'\',\n  ),\n)', '1433991606', '1436583606', '1433991642', '0', '22', '0', '0');
INSERT INTO `hc_poster` VALUES ('12', '1', '测试广告2', '11', 'images', 'array (\n  1 => \n  array (\n    \'linkurl\' => \'\',\n    \'imageurl\' => \'http://www.hc.com/uploadfile/2015/0611/20150611110121162.jpg\',\n    \'alt\' => \'\',\n  ),\n)', '1433991665', '1436583665', '1433991686', '0', '28', '0', '0');

-- ----------------------------
-- Table structure for `hc_poster_201504`
-- ----------------------------
DROP TABLE IF EXISTS `hc_poster_201504`;
CREATE TABLE `hc_poster_201504` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `spaceid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `area` char(40) NOT NULL,
  `ip` char(15) NOT NULL,
  `referer` char(120) NOT NULL,
  `clicktime` int(10) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`,`type`,`ip`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hc_poster_201504
-- ----------------------------

-- ----------------------------
-- Table structure for `hc_poster_201505`
-- ----------------------------
DROP TABLE IF EXISTS `hc_poster_201505`;
CREATE TABLE `hc_poster_201505` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `spaceid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `area` char(40) NOT NULL,
  `ip` char(15) NOT NULL,
  `referer` char(120) NOT NULL,
  `clicktime` int(10) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`,`type`,`ip`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hc_poster_201505
-- ----------------------------

-- ----------------------------
-- Table structure for `hc_poster_201506`
-- ----------------------------
DROP TABLE IF EXISTS `hc_poster_201506`;
CREATE TABLE `hc_poster_201506` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `spaceid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `area` char(40) NOT NULL,
  `ip` char(15) NOT NULL,
  `referer` char(120) NOT NULL,
  `clicktime` int(10) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`,`type`,`ip`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=119 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hc_poster_201506
-- ----------------------------
INSERT INTO `hc_poster_201506` VALUES ('1', '13', '1', '0', '', 'LAN', '127.0.0.1', '', '1434006499', '1');
INSERT INTO `hc_poster_201506` VALUES ('2', '13', '1', '0', '', 'LAN', '127.0.0.1', 'http://www.hc.com/index.php', '1434006499', '1');
INSERT INTO `hc_poster_201506` VALUES ('3', '13', '1', '0', '', 'LAN', '127.0.0.1', 'http://www.hc.com/index.php', '1434006499', '1');
INSERT INTO `hc_poster_201506` VALUES ('4', '13', '1', '0', '', 'LAN', '127.0.0.1', 'http://www.hc.com/index.php', '1434006499', '1');
INSERT INTO `hc_poster_201506` VALUES ('5', '13', '1', '0', '', 'LAN', '127.0.0.1', 'http://www.hc.com/index.php', '1434006499', '1');
INSERT INTO `hc_poster_201506` VALUES ('6', '13', '1', '0', '', 'LAN', '127.0.0.1', 'http://www.hc.com/index.php', '1434006499', '1');
INSERT INTO `hc_poster_201506` VALUES ('7', '13', '1', '0', '', 'LAN', '127.0.0.1', 'http://www.hc.com/index.php', '1434006499', '1');
INSERT INTO `hc_poster_201506` VALUES ('8', '13', '1', '0', '', 'LAN', '127.0.0.1', 'http://www.hc.com/index.php', '1434006499', '1');
INSERT INTO `hc_poster_201506` VALUES ('9', '13', '1', '0', '', 'LAN', '127.0.0.1', 'http://www.hc.com/index.php', '1434006499', '1');
INSERT INTO `hc_poster_201506` VALUES ('10', '13', '1', '0', '', 'LAN', '127.0.0.1', 'http://www.hc.com/index.php', '1434006499', '1');
INSERT INTO `hc_poster_201506` VALUES ('11', '13', '1', '0', '', 'LAN', '127.0.0.1', 'http://www.hc.com/index.php', '1434006499', '1');
INSERT INTO `hc_poster_201506` VALUES ('12', '13', '1', '0', '', 'LAN', '127.0.0.1', 'http://www.hc.com/index.php', '1434006499', '1');
INSERT INTO `hc_poster_201506` VALUES ('13', '13', '1', '0', '', 'LAN', '127.0.0.1', 'http://www.hc.com/index.php', '1434006499', '1');
INSERT INTO `hc_poster_201506` VALUES ('14', '13', '1', '0', '', 'LAN', '127.0.0.1', 'http://www.hc.com/index.php', '1434006499', '1');
INSERT INTO `hc_poster_201506` VALUES ('15', '13', '1', '0', '', 'LAN', '127.0.0.1', 'http://www.hc.com/index.php', '1434006499', '1');
INSERT INTO `hc_poster_201506` VALUES ('16', '13', '1', '0', '', 'LAN', '127.0.0.1', 'http://www.hc.com/index.php', '1434006499', '1');
INSERT INTO `hc_poster_201506` VALUES ('17', '13', '1', '0', '', 'LAN', '127.0.0.1', 'http://www.hc.com/index.php', '1434006499', '1');
INSERT INTO `hc_poster_201506` VALUES ('18', '13', '1', '0', '', 'LAN', '127.0.0.1', 'http://www.hc.com/index.php', '1434006499', '1');
INSERT INTO `hc_poster_201506` VALUES ('19', '13', '1', '0', '', 'LAN', '127.0.0.1', 'http://www.hc.com/index.php', '1434006499', '1');
INSERT INTO `hc_poster_201506` VALUES ('20', '13', '1', '0', '', 'LAN', '127.0.0.1', 'http://www.hc.com/index.php', '1434006499', '1');
INSERT INTO `hc_poster_201506` VALUES ('21', '13', '1', '0', '', 'LAN', '127.0.0.1', 'http://www.hc.com/index.php', '1434006499', '1');
INSERT INTO `hc_poster_201506` VALUES ('22', '13', '1', '0', '', 'LAN', '127.0.0.1', 'http://www.hc.com/index.php', '1434006499', '1');
INSERT INTO `hc_poster_201506` VALUES ('23', '13', '1', '0', '', 'LAN', '127.0.0.1', '', '1434006507', '1');
INSERT INTO `hc_poster_201506` VALUES ('24', '13', '1', '0', '', 'LAN', '127.0.0.1', 'http://www.hc.com/index.php', '1434006507', '1');
INSERT INTO `hc_poster_201506` VALUES ('25', '13', '1', '0', '', 'LAN', '127.0.0.1', 'http://www.hc.com/index.php', '1434006507', '1');
INSERT INTO `hc_poster_201506` VALUES ('26', '13', '1', '0', '', 'LAN', '127.0.0.1', 'http://www.hc.com/index.php', '1434006507', '1');
INSERT INTO `hc_poster_201506` VALUES ('27', '13', '1', '0', '', 'LAN', '127.0.0.1', 'http://www.hc.com/index.php', '1434006507', '1');
INSERT INTO `hc_poster_201506` VALUES ('28', '13', '1', '0', '', 'LAN', '127.0.0.1', 'http://www.hc.com/index.php', '1434006507', '1');
INSERT INTO `hc_poster_201506` VALUES ('29', '13', '1', '0', '', 'LAN', '127.0.0.1', 'http://www.hc.com/index.php', '1434006507', '1');
INSERT INTO `hc_poster_201506` VALUES ('30', '13', '1', '0', '', 'LAN', '127.0.0.1', 'http://www.hc.com/index.php', '1434006507', '1');
INSERT INTO `hc_poster_201506` VALUES ('31', '13', '1', '0', '', 'LAN', '127.0.0.1', 'http://www.hc.com/index.php', '1434006507', '1');
INSERT INTO `hc_poster_201506` VALUES ('32', '13', '1', '0', '', 'LAN', '127.0.0.1', 'http://www.hc.com/index.php', '1434006507', '1');
INSERT INTO `hc_poster_201506` VALUES ('33', '13', '1', '0', '', 'LAN', '127.0.0.1', 'http://www.hc.com/index.php', '1434006507', '1');
INSERT INTO `hc_poster_201506` VALUES ('34', '13', '1', '0', '', 'LAN', '127.0.0.1', 'http://www.hc.com/index.php', '1434006507', '1');
INSERT INTO `hc_poster_201506` VALUES ('35', '13', '1', '0', '', 'LAN', '127.0.0.1', 'http://www.hc.com/index.php', '1434006507', '1');
INSERT INTO `hc_poster_201506` VALUES ('36', '13', '1', '0', '', 'LAN', '127.0.0.1', 'http://www.hc.com/index.php', '1434006507', '1');
INSERT INTO `hc_poster_201506` VALUES ('37', '13', '1', '0', '', 'LAN', '127.0.0.1', 'http://www.hc.com/index.php', '1434006507', '1');
INSERT INTO `hc_poster_201506` VALUES ('38', '13', '1', '0', '', 'LAN', '127.0.0.1', 'http://www.hc.com/index.php', '1434006507', '1');
INSERT INTO `hc_poster_201506` VALUES ('39', '13', '1', '0', '', 'LAN', '127.0.0.1', 'http://www.hc.com/index.php', '1434006507', '1');
INSERT INTO `hc_poster_201506` VALUES ('40', '13', '1', '0', '', 'LAN', '127.0.0.1', 'http://www.hc.com/index.php', '1434006507', '1');
INSERT INTO `hc_poster_201506` VALUES ('41', '13', '1', '0', '', 'LAN', '127.0.0.1', 'http://www.hc.com/index.php', '1434006507', '1');
INSERT INTO `hc_poster_201506` VALUES ('42', '13', '1', '0', '', 'LAN', '127.0.0.1', 'http://www.hc.com/index.php', '1434006507', '1');
INSERT INTO `hc_poster_201506` VALUES ('43', '13', '1', '0', '', 'LAN', '127.0.0.1', 'http://www.hc.com/index.php', '1434006507', '1');
INSERT INTO `hc_poster_201506` VALUES ('44', '13', '1', '0', '', 'LAN', '127.0.0.1', 'http://www.hc.com/index.php', '1434006507', '1');
INSERT INTO `hc_poster_201506` VALUES ('45', '13', '1', '0', '', 'LAN', '127.0.0.1', '', '1434007003', '1');
INSERT INTO `hc_poster_201506` VALUES ('46', '13', '1', '0', '', 'LAN', '127.0.0.1', 'http://www.hc.com/index.php', '1434007003', '1');
INSERT INTO `hc_poster_201506` VALUES ('47', '13', '1', '0', '', 'LAN', '127.0.0.1', 'http://www.hc.com/index.php', '1434007003', '1');
INSERT INTO `hc_poster_201506` VALUES ('48', '13', '1', '0', '', 'LAN', '127.0.0.1', 'http://www.hc.com/index.php', '1434007003', '1');
INSERT INTO `hc_poster_201506` VALUES ('49', '13', '1', '0', '', 'LAN', '127.0.0.1', 'http://www.hc.com/index.php', '1434007003', '1');
INSERT INTO `hc_poster_201506` VALUES ('50', '13', '1', '0', '', 'LAN', '127.0.0.1', 'http://www.hc.com/index.php', '1434007003', '1');
INSERT INTO `hc_poster_201506` VALUES ('51', '13', '1', '0', '', 'LAN', '127.0.0.1', 'http://www.hc.com/index.php', '1434007003', '1');
INSERT INTO `hc_poster_201506` VALUES ('52', '13', '1', '0', '', 'LAN', '127.0.0.1', 'http://www.hc.com/index.php', '1434007003', '1');
INSERT INTO `hc_poster_201506` VALUES ('53', '13', '1', '0', '', 'LAN', '127.0.0.1', 'http://www.hc.com/index.php', '1434007003', '1');
INSERT INTO `hc_poster_201506` VALUES ('54', '13', '1', '0', '', 'LAN', '127.0.0.1', 'http://www.hc.com/index.php', '1434007003', '1');
INSERT INTO `hc_poster_201506` VALUES ('55', '13', '1', '0', '', 'LAN', '127.0.0.1', 'http://www.hc.com/index.php', '1434007003', '1');
INSERT INTO `hc_poster_201506` VALUES ('56', '13', '1', '0', '', 'LAN', '127.0.0.1', 'http://www.hc.com/index.php', '1434007003', '1');
INSERT INTO `hc_poster_201506` VALUES ('57', '13', '1', '0', '', 'LAN', '127.0.0.1', 'http://www.hc.com/index.php', '1434007003', '1');
INSERT INTO `hc_poster_201506` VALUES ('58', '13', '1', '0', '', 'LAN', '127.0.0.1', 'http://www.hc.com/index.php', '1434007003', '1');
INSERT INTO `hc_poster_201506` VALUES ('59', '13', '1', '0', '', 'LAN', '127.0.0.1', 'http://www.hc.com/index.php', '1434007004', '1');
INSERT INTO `hc_poster_201506` VALUES ('60', '13', '1', '0', '', 'LAN', '127.0.0.1', 'http://www.hc.com/index.php', '1434007004', '1');
INSERT INTO `hc_poster_201506` VALUES ('61', '13', '1', '0', '', 'LAN', '127.0.0.1', 'http://www.hc.com/index.php', '1434007004', '1');
INSERT INTO `hc_poster_201506` VALUES ('62', '13', '1', '0', '', 'LAN', '127.0.0.1', 'http://www.hc.com/index.php', '1434007004', '1');
INSERT INTO `hc_poster_201506` VALUES ('63', '13', '1', '0', '', 'LAN', '127.0.0.1', 'http://www.hc.com/index.php', '1434007004', '1');
INSERT INTO `hc_poster_201506` VALUES ('64', '13', '1', '0', '', 'LAN', '127.0.0.1', 'http://www.hc.com/index.php', '1434007004', '1');
INSERT INTO `hc_poster_201506` VALUES ('65', '13', '1', '0', '', 'LAN', '127.0.0.1', 'http://www.hc.com/index.php', '1434007004', '1');
INSERT INTO `hc_poster_201506` VALUES ('66', '13', '1', '0', '', 'LAN', '127.0.0.1', 'http://www.hc.com/index.php', '1434007004', '1');
INSERT INTO `hc_poster_201506` VALUES ('67', '12', '1', '0', '', 'LAN', '127.0.0.1', '', '1434008994', '1');
INSERT INTO `hc_poster_201506` VALUES ('68', '12', '1', '0', '', 'LAN', '127.0.0.1', 'http://www.hc.com/index.php', '1434008994', '1');
INSERT INTO `hc_poster_201506` VALUES ('69', '12', '1', '0', '', 'LAN', '127.0.0.1', 'http://www.hc.com/index.php', '1434008994', '1');
INSERT INTO `hc_poster_201506` VALUES ('70', '12', '1', '0', '', 'LAN', '127.0.0.1', 'http://www.hc.com/index.php', '1434008994', '1');
INSERT INTO `hc_poster_201506` VALUES ('71', '12', '1', '0', '', 'LAN', '127.0.0.1', 'http://www.hc.com/index.php', '1434008994', '1');
INSERT INTO `hc_poster_201506` VALUES ('72', '12', '1', '0', '', 'LAN', '127.0.0.1', 'http://www.hc.com/index.php', '1434008994', '1');
INSERT INTO `hc_poster_201506` VALUES ('73', '12', '1', '0', '', 'LAN', '127.0.0.1', '', '1434008995', '1');
INSERT INTO `hc_poster_201506` VALUES ('74', '12', '1', '0', '', 'LAN', '127.0.0.1', 'http://www.hc.com/index.php', '1434008995', '1');
INSERT INTO `hc_poster_201506` VALUES ('75', '12', '1', '0', '', 'LAN', '127.0.0.1', 'http://www.hc.com/index.php', '1434008995', '1');
INSERT INTO `hc_poster_201506` VALUES ('76', '12', '1', '0', '', 'LAN', '127.0.0.1', 'http://www.hc.com/index.php', '1434008995', '1');
INSERT INTO `hc_poster_201506` VALUES ('77', '12', '1', '0', '', 'LAN', '127.0.0.1', 'http://www.hc.com/index.php', '1434008995', '1');
INSERT INTO `hc_poster_201506` VALUES ('78', '12', '1', '0', '', 'LAN', '127.0.0.1', 'http://www.hc.com/index.php', '1434008995', '1');
INSERT INTO `hc_poster_201506` VALUES ('79', '12', '1', '0', '', 'LAN', '127.0.0.1', 'http://www.hc.com/index.php', '1434008995', '1');
INSERT INTO `hc_poster_201506` VALUES ('80', '12', '1', '0', '', 'LAN', '127.0.0.1', 'http://www.hc.com/index.php', '1434008995', '1');
INSERT INTO `hc_poster_201506` VALUES ('81', '12', '1', '0', '', 'LAN', '127.0.0.1', 'http://www.hc.com/index.php', '1434008995', '1');
INSERT INTO `hc_poster_201506` VALUES ('82', '12', '1', '0', '', 'LAN', '127.0.0.1', 'http://www.hc.com/index.php', '1434008995', '1');
INSERT INTO `hc_poster_201506` VALUES ('83', '12', '1', '0', '', 'LAN', '127.0.0.1', 'http://www.hc.com/index.php', '1434008995', '1');
INSERT INTO `hc_poster_201506` VALUES ('84', '12', '1', '0', '', 'LAN', '127.0.0.1', 'http://www.hc.com/index.php', '1434008995', '1');
INSERT INTO `hc_poster_201506` VALUES ('85', '12', '1', '0', '', 'LAN', '127.0.0.1', 'http://www.hc.com/index.php', '1434008995', '1');
INSERT INTO `hc_poster_201506` VALUES ('86', '12', '1', '0', '', 'LAN', '127.0.0.1', 'http://www.hc.com/index.php', '1434008996', '1');
INSERT INTO `hc_poster_201506` VALUES ('87', '12', '1', '0', '', 'LAN', '127.0.0.1', 'http://www.hc.com/index.php', '1434008996', '1');
INSERT INTO `hc_poster_201506` VALUES ('88', '12', '1', '0', '', 'LAN', '127.0.0.1', 'http://www.hc.com/index.php', '1434008996', '1');
INSERT INTO `hc_poster_201506` VALUES ('89', '12', '1', '0', '', 'LAN', '127.0.0.1', 'http://www.hc.com/index.php', '1434008996', '1');
INSERT INTO `hc_poster_201506` VALUES ('90', '12', '1', '0', '', 'LAN', '127.0.0.1', 'http://www.hc.com/index.php', '1434008996', '1');
INSERT INTO `hc_poster_201506` VALUES ('91', '12', '1', '0', '', 'LAN', '127.0.0.1', 'http://www.hc.com/index.php', '1434008996', '1');
INSERT INTO `hc_poster_201506` VALUES ('92', '12', '1', '0', '', 'LAN', '127.0.0.1', 'http://www.hc.com/index.php', '1434008996', '1');
INSERT INTO `hc_poster_201506` VALUES ('93', '12', '1', '0', '', 'LAN', '127.0.0.1', 'http://www.hc.com/index.php', '1434008996', '1');
INSERT INTO `hc_poster_201506` VALUES ('94', '12', '1', '0', '', 'LAN', '127.0.0.1', 'http://www.hc.com/index.php', '1434008996', '1');
INSERT INTO `hc_poster_201506` VALUES ('95', '11', '1', '0', '', 'LAN', '127.0.0.1', '', '1434009119', '1');
INSERT INTO `hc_poster_201506` VALUES ('96', '11', '1', '0', '', 'LAN', '127.0.0.1', 'http://www.hc.com/index.php', '1434009119', '1');
INSERT INTO `hc_poster_201506` VALUES ('97', '11', '1', '0', '', 'LAN', '127.0.0.1', 'http://www.hc.com/index.php', '1434009119', '1');
INSERT INTO `hc_poster_201506` VALUES ('98', '11', '1', '0', '', 'LAN', '127.0.0.1', 'http://www.hc.com/index.php', '1434009119', '1');
INSERT INTO `hc_poster_201506` VALUES ('99', '11', '1', '0', '', 'LAN', '127.0.0.1', 'http://www.hc.com/index.php', '1434009119', '1');
INSERT INTO `hc_poster_201506` VALUES ('100', '11', '1', '0', '', 'LAN', '127.0.0.1', 'http://www.hc.com/index.php', '1434009119', '1');
INSERT INTO `hc_poster_201506` VALUES ('101', '11', '1', '0', '', 'LAN', '127.0.0.1', 'http://www.hc.com/index.php', '1434009119', '1');
INSERT INTO `hc_poster_201506` VALUES ('102', '11', '1', '0', '', 'LAN', '127.0.0.1', 'http://www.hc.com/index.php', '1434009119', '1');
INSERT INTO `hc_poster_201506` VALUES ('103', '11', '1', '0', '', 'LAN', '127.0.0.1', 'http://www.hc.com/index.php', '1434009119', '1');
INSERT INTO `hc_poster_201506` VALUES ('104', '11', '1', '0', '', 'LAN', '127.0.0.1', 'http://www.hc.com/index.php', '1434009119', '1');
INSERT INTO `hc_poster_201506` VALUES ('105', '11', '1', '0', '', 'LAN', '127.0.0.1', 'http://www.hc.com/index.php', '1434009119', '1');
INSERT INTO `hc_poster_201506` VALUES ('106', '11', '1', '0', '', 'LAN', '127.0.0.1', 'http://www.hc.com/index.php', '1434009119', '1');
INSERT INTO `hc_poster_201506` VALUES ('107', '11', '1', '0', '', 'LAN', '127.0.0.1', 'http://www.hc.com/index.php', '1434009120', '1');
INSERT INTO `hc_poster_201506` VALUES ('108', '11', '1', '0', '', 'LAN', '127.0.0.1', 'http://www.hc.com/index.php', '1434009120', '1');
INSERT INTO `hc_poster_201506` VALUES ('109', '11', '1', '0', '', 'LAN', '127.0.0.1', 'http://www.hc.com/index.php', '1434009120', '1');
INSERT INTO `hc_poster_201506` VALUES ('110', '11', '1', '0', '', 'LAN', '127.0.0.1', 'http://www.hc.com/index.php', '1434009120', '1');
INSERT INTO `hc_poster_201506` VALUES ('111', '11', '1', '0', '', 'LAN', '127.0.0.1', 'http://www.hc.com/index.php', '1434009120', '1');
INSERT INTO `hc_poster_201506` VALUES ('112', '11', '1', '0', '', 'LAN', '127.0.0.1', 'http://www.hc.com/index.php', '1434009120', '1');
INSERT INTO `hc_poster_201506` VALUES ('113', '11', '1', '0', '', 'LAN', '127.0.0.1', 'http://www.hc.com/index.php', '1434009120', '1');
INSERT INTO `hc_poster_201506` VALUES ('114', '11', '1', '0', '', 'LAN', '127.0.0.1', 'http://www.hc.com/index.php', '1434009120', '1');
INSERT INTO `hc_poster_201506` VALUES ('115', '11', '1', '0', '', 'LAN', '127.0.0.1', 'http://www.hc.com/index.php', '1434009120', '1');
INSERT INTO `hc_poster_201506` VALUES ('116', '11', '1', '0', '', 'LAN', '127.0.0.1', 'http://www.hc.com/index.php', '1434009120', '1');
INSERT INTO `hc_poster_201506` VALUES ('117', '15', '1', '0', '', 'LAN', '127.0.0.1', '', '1434423086', '1');
INSERT INTO `hc_poster_201506` VALUES ('118', '15', '1', '0', '', 'LAN', '127.0.0.1', 'http://www.hc.com/index.php?m=content&c=index&a=lists&catid=1', '1434423086', '1');

-- ----------------------------
-- Table structure for `hc_poster_space`
-- ----------------------------
DROP TABLE IF EXISTS `hc_poster_space`;
CREATE TABLE `hc_poster_space` (
  `spaceid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `name` char(50) NOT NULL,
  `type` char(30) NOT NULL,
  `path` char(40) NOT NULL,
  `width` smallint(4) unsigned NOT NULL DEFAULT '0',
  `height` smallint(4) unsigned NOT NULL DEFAULT '0',
  `setting` char(100) NOT NULL,
  `description` char(100) NOT NULL,
  `items` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`spaceid`),
  KEY `disabled` (`disabled`,`siteid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hc_poster_space
-- ----------------------------
INSERT INTO `hc_poster_space` VALUES ('12', '1', '产品首页轮播图', 'imagechange', 'poster_js/12.js', '1920', '400', 'array (\n  \'paddleft\' => \'\',\n  \'paddtop\' => \'\',\n)', '', '2', '0');
INSERT INTO `hc_poster_space` VALUES ('11', '1', '首页图片轮播', 'imagechange', 'poster_js/11.js', '1920', '540', 'array (\n  \'paddleft\' => \'\',\n  \'paddtop\' => \'\',\n)', '', '2', '0');

-- ----------------------------
-- Table structure for `hc_product`
-- ----------------------------
DROP TABLE IF EXISTS `hc_product`;
CREATE TABLE `hc_product` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `typeid` smallint(5) unsigned NOT NULL,
  `title` char(80) NOT NULL DEFAULT '',
  `style` char(24) NOT NULL DEFAULT '',
  `thumb` char(100) NOT NULL DEFAULT '',
  `keywords` char(40) NOT NULL DEFAULT '',
  `description` char(255) NOT NULL DEFAULT '',
  `posids` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `url` char(100) NOT NULL,
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `sysadd` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `islink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `status` (`status`,`listorder`,`id`) USING BTREE,
  KEY `listorder` (`catid`,`status`,`listorder`,`id`) USING BTREE,
  KEY `catid` (`catid`,`status`,`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hc_product
-- ----------------------------
INSERT INTO `hc_product` VALUES ('2', '16', '0', '大重九香烟', '', 'http://www.hc.com/uploadfile/2015/0615/20150615050929543.jpg', '香烟', 'sdfsdfsdfsfsfsdfsdfsdf对方斯蒂芬斯蒂芬森', '1', 'http://www.hc.com/index.php?m=content&c=index&a=show&catid=16&id=2', '1', '99', '1', '0', 'admin', '1434360169', '1434360599');
INSERT INTO `hc_product` VALUES ('3', '19', '0', '王冠雪茄', '', 'http://www.hc.com/uploadfile/2015/0615/20150615052538965.jpg', '王冠 雪茄', '适当放松的放松的放松', '1', 'http://www.hc.com/index.php?m=content&c=index&a=show&catid=19&id=3', '2', '99', '1', '0', 'admin', '1434360298', '1434360377');
INSERT INTO `hc_product` VALUES ('4', '17', '0', '人头马XO', '', 'http://www.hc.com/uploadfile/2015/0616/20150616094956328.jpg', '人头马', '电风扇电风扇电风扇电风扇电风扇斯蒂芬森', '1', 'http://www.hc.com/index.php?m=content&c=index&a=show&catid=17&id=4', '0', '99', '1', '0', 'admin', '1434419358', '1434419460');
INSERT INTO `hc_product` VALUES ('5', '18', '0', '彩盒', '', 'http://www.hc.com/uploadfile/2015/0616/20150616095157809.jpg', '彩盒', '第三方斯蒂芬斯蒂芬斯蒂芬森的', '1', 'http://www.hc.com/index.php?m=content&c=index&a=show&catid=18&id=5', '0', '99', '1', '0', 'admin', '1434419495', '1434419521');
INSERT INTO `hc_product` VALUES ('6', '17', '0', '澳洲闻名品牌', '', 'http://www.hc.com/uploadfile/2015/0616/20150616095300407.jpg', '澳洲 品牌', '适当放松的放松的放松', '1', 'http://www.hc.com/index.php?m=content&c=index&a=show&catid=17&id=6', '0', '99', '1', '0', 'admin', '1434419541', '1434419585');

-- ----------------------------
-- Table structure for `hc_product_data`
-- ----------------------------
DROP TABLE IF EXISTS `hc_product_data`;
CREATE TABLE `hc_product_data` (
  `id` mediumint(8) unsigned DEFAULT '0',
  `content` text NOT NULL,
  `readpoint` smallint(5) unsigned NOT NULL DEFAULT '0',
  `groupids_view` varchar(100) NOT NULL,
  `paginationtype` tinyint(1) NOT NULL,
  `maxcharperpage` mediumint(6) NOT NULL,
  `template` varchar(30) NOT NULL,
  `paytype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allow_comment` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `relation` varchar(255) NOT NULL DEFAULT '',
  `images` mediumtext NOT NULL,
  KEY `id` (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hc_product_data
-- ----------------------------
INSERT INTO `hc_product_data` VALUES ('2', 'sdfsdfsdfsfsfsdfsdfsdf对方斯蒂芬斯蒂芬森', '0', '', '0', '10000', '', '0', '1', '', 'array (\n  0 => \n  array (\n    \'url\' => \'http://www.hc.com/uploadfile/2015/0615/20150615051120206.jpg\',\n    \'alt\' => \'products_info_28\',\n  ),\n  1 => \n  array (\n    \'url\' => \'http://www.hc.com/uploadfile/2015/0615/20150615051116768.jpg\',\n    \'alt\' => \'products_info_26\',\n  ),\n  2 => \n  array (\n    \'url\' => \'http://www.hc.com/uploadfile/2015/0615/20150615051113576.jpg\',\n    \'alt\' => \'products_info_22\',\n  ),\n  3 => \n  array (\n    \'url\' => \'http://www.hc.com/uploadfile/2015/0615/20150615051109569.jpg\',\n    \'alt\' => \'products_info_11\',\n  ),\n  4 => \n  array (\n    \'url\' => \'http://www.hc.com/uploadfile/2015/0615/20150615051058576.jpg\',\n    \'alt\' => \'products_info_03\',\n  ),\n  5 => \n  array (\n    \'url\' => \'http://www.hc.com/uploadfile/2015/0615/20150615051102951.jpg\',\n    \'alt\' => \'products_info_06\',\n  ),\n  6 => \n  array (\n    \'url\' => \'http://www.hc.com/uploadfile/2015/0615/20150615051105103.jpg\',\n    \'alt\' => \'products_info_09\',\n  ),\n)');
INSERT INTO `hc_product_data` VALUES ('3', '斯蒂芬斯蒂芬斯蒂芬森的', '0', '', '0', '10000', '', '0', '1', '', 'array (\n  0 => \n  array (\n    \'url\' => \'http://www.hc.com/uploadfile/2015/0615/20150615052607837.jpg\',\n    \'alt\' => \'products_07\',\n  ),\n)');
INSERT INTO `hc_product_data` VALUES ('4', '电风扇电风扇电风扇电风扇电风扇斯蒂芬森', '0', '', '0', '10000', '', '0', '1', '', 'array (\n)');
INSERT INTO `hc_product_data` VALUES ('5', '第三方斯蒂芬斯蒂芬斯蒂芬森的', '0', '', '0', '10000', '', '0', '1', '', 'array (\n)');
INSERT INTO `hc_product_data` VALUES ('6', '适当放松的放松的放松', '0', '', '0', '10000', '', '0', '1', '', 'array (\n)');

-- ----------------------------
-- Table structure for `hc_queue`
-- ----------------------------
DROP TABLE IF EXISTS `hc_queue`;
CREATE TABLE `hc_queue` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `type` char(5) DEFAULT NULL,
  `siteid` smallint(5) unsigned DEFAULT '0',
  `path` varchar(100) DEFAULT NULL,
  `status1` tinyint(1) DEFAULT '0',
  `status2` tinyint(1) DEFAULT '0',
  `status3` tinyint(1) DEFAULT '0',
  `status4` tinyint(1) DEFAULT '0',
  `times` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `siteid` (`siteid`) USING BTREE,
  KEY `times` (`times`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hc_queue
-- ----------------------------

-- ----------------------------
-- Table structure for `hc_release_point`
-- ----------------------------
DROP TABLE IF EXISTS `hc_release_point`;
CREATE TABLE `hc_release_point` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `host` varchar(100) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `port` varchar(10) DEFAULT '21',
  `pasv` tinyint(1) DEFAULT '0',
  `ssl` tinyint(1) DEFAULT '0',
  `path` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hc_release_point
-- ----------------------------

-- ----------------------------
-- Table structure for `hc_search`
-- ----------------------------
DROP TABLE IF EXISTS `hc_search`;
CREATE TABLE `hc_search` (
  `searchid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `typeid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `adddate` int(10) unsigned NOT NULL,
  `data` text NOT NULL,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`searchid`),
  KEY `typeid` (`typeid`,`id`) USING BTREE,
  KEY `siteid` (`siteid`) USING BTREE,
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hc_search
-- ----------------------------
INSERT INTO `hc_search` VALUES ('1', '1', '1', '1428916776', 'sdfsdf sdfsdf ', '1');
INSERT INTO `hc_search` VALUES ('2', '1', '2', '1431943998', 'sdfsdf sdfsdf ', '1');
INSERT INTO `hc_search` VALUES ('3', '53', '1', '1431944498', '精装照片书12寸数款 照片 照片 身份 第三方 水电 精装', '1');
INSERT INTO `hc_search` VALUES ('4', '1', '3', '1434010084', '虎彩数字印刷业务覆盖华北华东华南 虎彩数字印刷 数字 印刷 业务 覆盖', '1');
INSERT INTO `hc_search` VALUES ('5', '1', '4', '1434010257', '来自虎彩按需服务推广会上的声音 推广会 声音 声音 推广 服务 会上 来自', '1');
INSERT INTO `hc_search` VALUES ('6', '1', '5', '1434010309', '中国外文局与虎彩集团举行战略合作签约仪式(图) 中国外文局 仪式 战略 国外 仪式 签约 战略合作 举行 集团 战略', '1');
INSERT INTO `hc_search` VALUES ('7', '1', '6', '1434010778', '虎彩引爆按需出版市场，致力将数字印刷做到极致，引 极致 数字 市场 市场 数字 印刷 做到 致力 出版', '1');
INSERT INTO `hc_search` VALUES ('8', '1', '7', '1434096436', '虎彩介绍 虎彩介绍 包装 印刷 高端 优秀 高新技术企业 供应商 百强 名列 股份有限公司 核心 一家 成立 产品的 开发 设计 介绍', '1');
INSERT INTO `hc_search` VALUES ('10', '58', '1', '1434171704', '高清呈现 永不褪色 高清 永不 印刷 原装 环保 数码 配合 顶级 惠普 永不 高清 呈现', '1');
INSERT INTO `hc_search` VALUES ('11', '58', '2', '1434171829', '个性台历8寸竖款单面 单面 台历 个性 模板 照片 定制 在线 个性', '1');
INSERT INTO `hc_search` VALUES ('12', '58', '3', '1434171861', '用自己的照片设计 照片 印刷 原装 环保 数码 配合 顶级 惠普 照片 自己 设计', '1');
INSERT INTO `hc_search` VALUES ('13', '1', '9', '1434176328', '我的方案2 包装印刷 整体 解决方案 包装 高端 化妆品 手机 行业 客户 价值 产品 全球 提供 整体 服务 成本 解决方案 企业 优势 知名品牌 众多 制造 具备 顶尖 服务商 作为 国内 涵盖 以上 核心 聚焦 专注 三大 战略 伙伴 性价比 范围 供应 质量 优质 预算 转换 供应商 实现 业务 角色 转变 规模化 金银 配套 策略 沟通 研发 的方案 大型 无法 设计 材料 个性化 根据 需求 具有 综合 组装 采购 制作 批量 生产 印刷', '1');
INSERT INTO `hc_search` VALUES ('14', '1', '10', '1434176352', '我的方案 包装印刷 整体 解决方案 客户 包装 优势 印刷 服务 研发 高端 产品 提供 业界 技术 手工 通过 数字 行业 拥有 变化 设计 需求 工艺 不断 而且 信息 满足 改善 现场 因为 反应 精致 工程师 包装设计 平台 实现 设备 成为 快速 卓越 修改 规模 数码 分钟 所以 环节 材料 解决方案 涵盖 个性化 内容 单位 引进 高达 高效 达成 优质 率先 众多 当天 制造 自动化 改造 导入 以上 作为 车间 组成 流程 措施 之一 最大 核心竞争力 领域 规模化 知名品牌 成本 管理 基于 共享 全程 高效率 数字化 进行 战略 价值 素质 最好 员工 秉承 品质 企业 顶级 生产设备 顶尖 时间 便捷 缩短 更新 以应对 整体 第一 运用 致力于 完成 根据 随时 国内 全球 科技 全球范围内 能力 认证 增值服务 组装 库存 配套 相关 完善 组合 生产线 食品 数量 防伪 弹性 订单 环保 生产 灵活 装饰 原材料 有限公司 经理 项目 工程 管理体系 的方案 一体化 方式 具备 无法 平面设计 成立 印刷行业 样机 全产业链 策划 专业 产品开发 一体 体系 一览 激光 创新 超越 化妆品 手机 你好 服务商', '1');
INSERT INTO `hc_search` VALUES ('15', '59', '1', '1434178842', '天猫虎彩旗舰店  个性化 个性 照片 礼品 定制 文具 种类 多个 饰品 涵盖 卡片 水晶 产品 礼物 致力于 一个 商城 产品开发 销售 核心 旗舰 专营 网上商城', '1');
INSERT INTO `hc_search` VALUES ('16', '59', '2', '1434179055', '虎彩影像  影像 个性化 强大 平台 定制 个性 就是 照片 如此 各种 制作 喜欢 自己 产品 依托 进入 目标 迈进 印刷 集团 轻松 研发 能力 简单 享受 销售 网上商城 运营商 广州 产品开发 商城 一个 致力于 礼物 网络 科技 通过 用户 可以 客户端 有限公司 提供 在线 服务', '1');
INSERT INTO `hc_search` VALUES ('17', '59', '3', '1434179098', '搜书院  图书 出版 我们 读者 可以 目前 不断 手中 全新 形式 简单 就是 合作 重新 赋予 活力 想要 生命 快递 拿到 版权 延续了 出版社 印刷 网站 之一 业务 旗下 有限公司 广州 网络 科技 平台 通过 技术 数字 先进 订购 版本 美的', '1');
INSERT INTO `hc_search` VALUES ('18', '1', '11', '1434183762', '关于进一关于开展“迎接挑战、学质 进一关于进一关于开展“迎 关于 开展 挑战 迎接', '1');
INSERT INTO `hc_search` VALUES ('19', '1', '12', '1434183835', '新闻轮播2 新闻新闻轮播2 新闻', '1');
INSERT INTO `hc_search` VALUES ('20', '1', '13', '1434185669', '虎彩新闻2 新闻虎彩新闻2 新闻', '1');
INSERT INTO `hc_search` VALUES ('21', '1', '14', '1434185692', '虎彩新闻3虎彩新闻3虎彩新闻3 新闻虎彩新闻3 新闻', '1');
INSERT INTO `hc_search` VALUES ('22', '1', '15', '1434185702', '虎彩新闻4虎彩新闻4虎彩新闻4虎彩新闻4 新闻虎彩新闻4 新闻', '1');
INSERT INTO `hc_search` VALUES ('23', '2', '1', '1434283232', '什么是印刷，印刷的发展史？ 发展史 印刷 未知 发展史 的发展', '1');
INSERT INTO `hc_search` VALUES ('24', '2', '2', '1434283258', '个性台历8寸竖款单面 单面 台历 个性 个性 未知', '1');
INSERT INTO `hc_search` VALUES ('25', '1', '16', '1434327977', '产品动态一 动态 产品产品动态一 动态 产品', '1');
INSERT INTO `hc_search` VALUES ('26', '1', '17', '1434328063', '产品动态二 动态 产品产品动态二 动态 产品', '1');
INSERT INTO `hc_search` VALUES ('27', '1', '18', '1434328089', '产品动态三 产品动态三 动态 产品', '1');
INSERT INTO `hc_search` VALUES ('28', '1', '19', '1434328114', '产品动态四 产品动态四 动态 产品', '1');
INSERT INTO `hc_search` VALUES ('29', '53', '2', '1434360169', '大重九香烟 香烟 对方', '1');
INSERT INTO `hc_search` VALUES ('30', '53', '3', '1434360298', '王冠雪茄 王冠 雪茄 放松 适当', '1');
INSERT INTO `hc_search` VALUES ('31', '53', '4', '1434419358', '人头马XO 人头马 ', '1');
INSERT INTO `hc_search` VALUES ('32', '53', '5', '1434419495', '彩盒 彩盒 第三方', '1');
INSERT INTO `hc_search` VALUES ('33', '53', '6', '1434419541', '澳洲闻名品牌 澳洲 品牌 放松 适当 品牌', '1');

-- ----------------------------
-- Table structure for `hc_search_keyword`
-- ----------------------------
DROP TABLE IF EXISTS `hc_search_keyword`;
CREATE TABLE `hc_search_keyword` (
  `keyword` char(20) NOT NULL,
  `pinyin` char(20) NOT NULL,
  `searchnums` int(10) unsigned NOT NULL,
  `data` char(20) NOT NULL,
  UNIQUE KEY `keyword` (`keyword`) USING BTREE,
  UNIQUE KEY `pinyin` (`pinyin`) USING BTREE,
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hc_search_keyword
-- ----------------------------

-- ----------------------------
-- Table structure for `hc_session`
-- ----------------------------
DROP TABLE IF EXISTS `hc_session`;
CREATE TABLE `hc_session` (
  `sessionid` char(32) NOT NULL,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ip` char(15) NOT NULL,
  `lastvisit` int(10) unsigned NOT NULL DEFAULT '0',
  `roleid` tinyint(3) unsigned DEFAULT '0',
  `groupid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `m` char(20) NOT NULL,
  `c` char(20) NOT NULL,
  `a` char(20) NOT NULL,
  `data` char(255) NOT NULL,
  PRIMARY KEY (`sessionid`),
  KEY `lastvisit` (`lastvisit`) USING HASH
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hc_session
-- ----------------------------
INSERT INTO `hc_session` VALUES ('lafdpi5su24ru61pv9f85ssg72', '1', '127.0.0.1', '1434438440', '1', '0', 'admin', 'index', 'public_session_life', 'code|s:0:\"\";userid|s:1:\"1\";roleid|s:1:\"1\";pc_hash|s:6:\"saMm4W\";lock_screen|i:0;');

-- ----------------------------
-- Table structure for `hc_site`
-- ----------------------------
DROP TABLE IF EXISTS `hc_site`;
CREATE TABLE `hc_site` (
  `siteid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(30) DEFAULT '',
  `dirname` char(255) DEFAULT '',
  `domain` char(255) DEFAULT '',
  `site_title` char(255) DEFAULT '',
  `keywords` char(255) DEFAULT '',
  `description` char(255) DEFAULT '',
  `release_point` text,
  `default_style` char(50) DEFAULT NULL,
  `template` text,
  `setting` mediumtext,
  `uuid` char(40) DEFAULT '',
  PRIMARY KEY (`siteid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hc_site
-- ----------------------------
INSERT INTO `hc_site` VALUES ('1', '默认站点', '', 'http://www.hc.com/', '虎彩 - 让印刷走进千家万户', '虎彩·印艺专家，中国最具特色的创新型印艺企业，拥有亚洲规模最大的数字印刷机群。为您提供包装印刷、安全印务、个性影像、个性包装、按需出版等个性化定制服务', '虎彩是全球最优秀的高端奢侈品纸包装解决方案供应商，名列中国印刷百强第九名。我们致力于让印刷走进千家万户，围绕客户的需求持续创新，为企业提供具有竞争力整体印刷解决方案，为用户提供优质的个性化定制服务，持续提升客户体验，为客户创造最大价值。虎彩人的使命正在于将千家万户的幸福、美好回忆，用先进的印刷技术和个性化印品将其永久珍藏，让其触手可及。', '', 'hucai', 'hucai', 'array (\n  \'upload_maxsize\' => \'10240\',\n  \'upload_allowext\' => \'jpg|jpeg|gif|bmp|png|doc|docx|xls|xlsx|ppt|pptx|pdf|txt|rar|zip|swf\',\n  \'watermark_enable\' => \'1\',\n  \'watermark_minwidth\' => \'300\',\n  \'watermark_minheight\' => \'300\',\n  \'watermark_img\' => \'statics/images/water//mark.png\',\n  \'watermark_pct\' => \'85\',\n  \'watermark_quality\' => \'80\',\n  \'watermark_pos\' => \'9\',\n)', 'd6ecd476-e199-11e4-acca-00ac488648d9');
INSERT INTO `hc_site` VALUES ('2', '英文站点', 'en', 'http://www.hc.com/en/', 'Hucais Printing', 'keywords', 'descptions', '', 'hucai_en', 'hucai_en', 'array (\n  \'upload_maxsize\' => \'2000\',\n  \'upload_allowext\' => \'jpg|jpeg|gif|bmp|png|doc|docx|xls|xlsx|ppt|pptx|pdf|txt|rar|zip|swf\',\n  \'watermark_enable\' => \'1\',\n  \'watermark_minwidth\' => \'300\',\n  \'watermark_minheight\' => \'300\',\n  \'watermark_img\' => \'http://www.hc.com/statics/images/water/mark.gif\',\n  \'watermark_pct\' => \'100\',\n  \'watermark_quality\' => \'80\',\n  \'watermark_pos\' => \'9\',\n)', '');

-- ----------------------------
-- Table structure for `hc_special`
-- ----------------------------
DROP TABLE IF EXISTS `hc_special`;
CREATE TABLE `hc_special` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `aid` int(10) unsigned NOT NULL DEFAULT '0',
  `title` char(60) NOT NULL,
  `typeids` char(100) NOT NULL,
  `thumb` char(100) NOT NULL,
  `banner` char(100) NOT NULL,
  `description` char(255) NOT NULL,
  `url` char(100) NOT NULL,
  `ishtml` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ispage` tinyint(1) unsigned NOT NULL,
  `filename` char(40) NOT NULL,
  `pics` char(100) NOT NULL,
  `voteid` char(60) NOT NULL,
  `style` char(20) NOT NULL,
  `index_template` char(40) NOT NULL,
  `list_template` char(40) NOT NULL,
  `show_template` char(60) NOT NULL,
  `css` text NOT NULL,
  `username` char(40) NOT NULL,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0',
  `listorder` smallint(5) unsigned NOT NULL,
  `elite` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isvideo` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `disabled` (`disabled`,`siteid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hc_special
-- ----------------------------

-- ----------------------------
-- Table structure for `hc_special_content`
-- ----------------------------
DROP TABLE IF EXISTS `hc_special_content`;
CREATE TABLE `hc_special_content` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `specialid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `title` char(80) NOT NULL,
  `style` char(24) NOT NULL,
  `typeid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `thumb` char(100) NOT NULL,
  `keywords` char(40) NOT NULL,
  `description` char(255) NOT NULL,
  `url` char(100) NOT NULL,
  `curl` char(15) NOT NULL,
  `listorder` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  `searchid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `islink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isdata` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `videoid` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `specialid` (`specialid`,`typeid`,`isdata`) USING BTREE,
  KEY `typeid` (`typeid`,`isdata`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hc_special_content
-- ----------------------------

-- ----------------------------
-- Table structure for `hc_special_c_data`
-- ----------------------------
DROP TABLE IF EXISTS `hc_special_c_data`;
CREATE TABLE `hc_special_c_data` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `author` varchar(40) NOT NULL,
  `content` text NOT NULL,
  `paginationtype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `maxcharperpage` mediumint(6) unsigned NOT NULL DEFAULT '0',
  `style` char(20) NOT NULL,
  `show_template` varchar(30) NOT NULL,
  UNIQUE KEY `id` (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hc_special_c_data
-- ----------------------------

-- ----------------------------
-- Table structure for `hc_sphinx_counter`
-- ----------------------------
DROP TABLE IF EXISTS `hc_sphinx_counter`;
CREATE TABLE `hc_sphinx_counter` (
  `counter_id` int(11) unsigned NOT NULL,
  `max_doc_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`counter_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hc_sphinx_counter
-- ----------------------------

-- ----------------------------
-- Table structure for `hc_sso_admin`
-- ----------------------------
DROP TABLE IF EXISTS `hc_sso_admin`;
CREATE TABLE `hc_sso_admin` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `username` char(20) NOT NULL,
  `password` char(32) NOT NULL,
  `encrypt` char(6) DEFAULT NULL,
  `issuper` tinyint(1) DEFAULT '0',
  `lastlogin` int(10) DEFAULT NULL,
  `ip` char(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hc_sso_admin
-- ----------------------------
INSERT INTO `hc_sso_admin` VALUES ('1', 'admin', '52bf89be5f1da5e5b8b9e5fff8e7412b', 'VMvNWI', '1', '0', '');

-- ----------------------------
-- Table structure for `hc_sso_applications`
-- ----------------------------
DROP TABLE IF EXISTS `hc_sso_applications`;
CREATE TABLE `hc_sso_applications` (
  `appid` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `type` char(16) NOT NULL DEFAULT '',
  `name` char(20) NOT NULL DEFAULT '',
  `url` char(255) NOT NULL DEFAULT '',
  `authkey` char(255) NOT NULL DEFAULT '',
  `ip` char(15) NOT NULL DEFAULT '',
  `apifilename` char(30) NOT NULL DEFAULT 'phpsso.php',
  `charset` char(8) NOT NULL DEFAULT '',
  `synlogin` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`appid`),
  KEY `synlogin` (`synlogin`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hc_sso_applications
-- ----------------------------
INSERT INTO `hc_sso_applications` VALUES ('1', 'phpcms_v9', 'phpcms v9', 'http://www.hc.com/', '29iRIqgso9Sl2RM5ZwhvD16x5xVWg9pu', '', 'api.php?op=phpsso', 'utf-8', '1');

-- ----------------------------
-- Table structure for `hc_sso_members`
-- ----------------------------
DROP TABLE IF EXISTS `hc_sso_members`;
CREATE TABLE `hc_sso_members` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` char(20) NOT NULL DEFAULT '',
  `password` char(32) NOT NULL DEFAULT '',
  `random` char(8) NOT NULL DEFAULT '',
  `email` char(32) NOT NULL DEFAULT '',
  `regip` char(15) NOT NULL DEFAULT '',
  `regdate` int(10) unsigned NOT NULL DEFAULT '0',
  `lastip` char(15) NOT NULL DEFAULT '0',
  `lastdate` int(10) unsigned NOT NULL DEFAULT '0',
  `appname` char(15) NOT NULL,
  `type` enum('app','connect') DEFAULT NULL,
  `avatar` tinyint(1) NOT NULL DEFAULT '0',
  `ucuserid` mediumint(8) unsigned DEFAULT '0',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `username` (`username`) USING BTREE,
  KEY `email` (`email`) USING BTREE,
  KEY `ucuserid` (`ucuserid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hc_sso_members
-- ----------------------------
INSERT INTO `hc_sso_members` VALUES ('1', 'linzq0507', 'b281361a1c0e66941feda3e34663b5de', 'IMRerA', 'linzq0507@163.com', '127.0.0.1', '1428902200', '0', '1428902200', 'phpcms v9', 'app', '0', '0');

-- ----------------------------
-- Table structure for `hc_sso_messagequeue`
-- ----------------------------
DROP TABLE IF EXISTS `hc_sso_messagequeue`;
CREATE TABLE `hc_sso_messagequeue` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `operation` char(32) NOT NULL,
  `succeed` tinyint(1) NOT NULL DEFAULT '0',
  `totalnum` smallint(6) unsigned NOT NULL DEFAULT '0',
  `noticedata` mediumtext NOT NULL,
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `appstatus` mediumtext,
  PRIMARY KEY (`id`),
  KEY `dateline` (`dateline`) USING BTREE,
  KEY `succeed` (`succeed`,`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hc_sso_messagequeue
-- ----------------------------
INSERT INTO `hc_sso_messagequeue` VALUES ('1', 'member_add', '0', '1', 'array (\n  \'username\' => \'linzq0507\',\n  \'password\' => \'b281361a1c0e66941feda3e34663b5de\',\n  \'email\' => \'linzq0507@163.com\',\n  \'regip\' => \'127.0.0.1\',\n  \'regdate\' => \'1428902200\',\n  \'lastdate\' => \'1428902200\',\n  \'appname\' => \'phpcms v9\',\n  \'type\' => \'app\',\n  \'random\' => \'IMRerA\',\n  \'ucuserid\' => \'0\',\n  \'uid\' => \'1\',\n  \'action\' => \'member_add\',\n)', '1428902200', '{\"1\":1}');

-- ----------------------------
-- Table structure for `hc_sso_session`
-- ----------------------------
DROP TABLE IF EXISTS `hc_sso_session`;
CREATE TABLE `hc_sso_session` (
  `sessionid` char(32) NOT NULL,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ip` char(15) NOT NULL,
  `lastvisit` int(10) unsigned NOT NULL DEFAULT '0',
  `roleid` tinyint(3) unsigned DEFAULT '0',
  `groupid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `m` char(20) NOT NULL,
  `c` char(20) NOT NULL,
  `a` char(20) NOT NULL,
  `data` char(255) NOT NULL,
  PRIMARY KEY (`sessionid`),
  KEY `lastvisit` (`lastvisit`) USING HASH
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hc_sso_session
-- ----------------------------

-- ----------------------------
-- Table structure for `hc_sso_settings`
-- ----------------------------
DROP TABLE IF EXISTS `hc_sso_settings`;
CREATE TABLE `hc_sso_settings` (
  `name` varchar(32) NOT NULL DEFAULT '',
  `data` text NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hc_sso_settings
-- ----------------------------
INSERT INTO `hc_sso_settings` VALUES ('denyemail', '');
INSERT INTO `hc_sso_settings` VALUES ('denyusername', '');
INSERT INTO `hc_sso_settings` VALUES ('creditrate', '');
INSERT INTO `hc_sso_settings` VALUES ('sp4', '');
INSERT INTO `hc_sso_settings` VALUES ('ucenter', '');

-- ----------------------------
-- Table structure for `hc_tag`
-- ----------------------------
DROP TABLE IF EXISTS `hc_tag`;
CREATE TABLE `hc_tag` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `tag` text NOT NULL,
  `name` char(40) NOT NULL,
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `module` char(20) NOT NULL,
  `action` char(20) NOT NULL,
  `data` text NOT NULL,
  `page` char(15) NOT NULL,
  `return` char(20) NOT NULL,
  `cache` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `num` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hc_tag
-- ----------------------------

-- ----------------------------
-- Table structure for `hc_template_bak`
-- ----------------------------
DROP TABLE IF EXISTS `hc_template_bak`;
CREATE TABLE `hc_template_bak` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `creat_at` int(10) unsigned DEFAULT '0',
  `fileid` char(50) DEFAULT NULL,
  `userid` mediumint(8) DEFAULT NULL,
  `username` char(20) DEFAULT NULL,
  `template` text,
  PRIMARY KEY (`id`),
  KEY `fileid` (`fileid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hc_template_bak
-- ----------------------------

-- ----------------------------
-- Table structure for `hc_times`
-- ----------------------------
DROP TABLE IF EXISTS `hc_times`;
CREATE TABLE `hc_times` (
  `username` char(40) NOT NULL,
  `ip` char(15) NOT NULL,
  `logintime` int(10) unsigned NOT NULL DEFAULT '0',
  `isadmin` tinyint(1) NOT NULL DEFAULT '0',
  `times` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`username`,`isadmin`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hc_times
-- ----------------------------

-- ----------------------------
-- Table structure for `hc_type`
-- ----------------------------
DROP TABLE IF EXISTS `hc_type`;
CREATE TABLE `hc_type` (
  `typeid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `module` char(15) NOT NULL,
  `modelid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `name` char(30) NOT NULL,
  `parentid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `typedir` char(20) NOT NULL,
  `url` char(100) NOT NULL,
  `template` char(30) NOT NULL,
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`typeid`),
  KEY `module` (`module`,`parentid`,`siteid`,`listorder`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hc_type
-- ----------------------------
INSERT INTO `hc_type` VALUES ('52', '1', 'search', '0', '专题', '0', 'special', '', '', '4', '专题');
INSERT INTO `hc_type` VALUES ('1', '1', 'search', '1', '新闻', '0', '', '', '', '1', '新闻模型搜索');
INSERT INTO `hc_type` VALUES ('2', '1', 'search', '2', '下载', '0', '', '', '', '3', '下载模型搜索');
INSERT INTO `hc_type` VALUES ('3', '1', 'search', '3', '图片', '0', '', '', '', '2', '图片模型搜索');
INSERT INTO `hc_type` VALUES ('53', '1', 'search', '12', '产品', '0', '', '', '', '0', '');
INSERT INTO `hc_type` VALUES ('54', '1', 'content', '0', '照片书', '0', '', '', '', '0', '');
INSERT INTO `hc_type` VALUES ('55', '1', 'link', '0', '服务品牌', '0', '', '', '', '1', '服务品牌');
INSERT INTO `hc_type` VALUES ('56', '1', 'link', '0', '旗下企业', '0', '', '', '', '2', '旗下企业');
INSERT INTO `hc_type` VALUES ('59', '1', 'search', '16', '线上定制', '0', '', '', '', '0', '');
INSERT INTO `hc_type` VALUES ('58', '1', 'search', '15', '品牌活动模型', '0', '', '', '', '0', '');
INSERT INTO `hc_type` VALUES ('60', '1', 'search', '17', '连锁门店', '0', '', '', '', '0', '');

-- ----------------------------
-- Table structure for `hc_urlrule`
-- ----------------------------
DROP TABLE IF EXISTS `hc_urlrule`;
CREATE TABLE `hc_urlrule` (
  `urlruleid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `module` varchar(15) NOT NULL,
  `file` varchar(20) NOT NULL,
  `ishtml` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `urlrule` varchar(255) NOT NULL,
  `example` varchar(255) NOT NULL,
  PRIMARY KEY (`urlruleid`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hc_urlrule
-- ----------------------------
INSERT INTO `hc_urlrule` VALUES ('1', 'content', 'category', '1', '{$categorydir}{$catdir}/index.html|{$categorydir}{$catdir}/{$page}.html', 'news/china/1000.html');
INSERT INTO `hc_urlrule` VALUES ('6', 'content', 'category', '0', 'index.php?m=content&c=index&a=lists&catid={$catid}|index.php?m=content&c=index&a=lists&catid={$catid}&page={$page}', 'index.php?m=content&c=index&a=lists&catid=1&page=1');
INSERT INTO `hc_urlrule` VALUES ('11', 'content', 'show', '1', '{$year}/{$catdir}_{$month}{$day}/{$id}.html|{$year}/{$catdir}_{$month}{$day}/{$id}_{$page}.html', '2010/catdir_0720/1_2.html');
INSERT INTO `hc_urlrule` VALUES ('12', 'content', 'show', '1', '{$categorydir}{$catdir}/{$year}/{$month}{$day}/{$id}.html|{$categorydir}{$catdir}/{$year}/{$month}{$day}/{$id}_{$page}.html', 'it/product/2010/0720/1_2.html');
INSERT INTO `hc_urlrule` VALUES ('16', 'content', 'show', '0', 'index.php?m=content&c=index&a=show&catid={$catid}&id={$id}|index.php?m=content&c=index&a=show&catid={$catid}&id={$id}&page={$page}', 'index.php?m=content&c=index&a=show&catid=1&id=1');
INSERT INTO `hc_urlrule` VALUES ('17', 'content', 'show', '0', 'show-{$catid}-{$id}-{$page}.html', 'show-1-2-1.html');
INSERT INTO `hc_urlrule` VALUES ('18', 'content', 'show', '0', 'content-{$catid}-{$id}-{$page}.html', 'content-1-2-1.html');
INSERT INTO `hc_urlrule` VALUES ('30', 'content', 'category', '0', 'list-{$catid}-{$page}.html', 'list-1-1.html');

-- ----------------------------
-- Table structure for `hc_video`
-- ----------------------------
DROP TABLE IF EXISTS `hc_video`;
CREATE TABLE `hc_video` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `typeid` smallint(5) unsigned NOT NULL,
  `title` char(80) NOT NULL DEFAULT '',
  `style` char(24) NOT NULL DEFAULT '',
  `thumb` char(100) NOT NULL DEFAULT '',
  `keywords` char(40) NOT NULL DEFAULT '',
  `description` char(255) NOT NULL DEFAULT '',
  `posids` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `url` char(100) NOT NULL,
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `sysadd` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `islink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  `vision` varchar(255) NOT NULL DEFAULT '',
  `video_category` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `status` (`status`,`listorder`,`id`) USING BTREE,
  KEY `listorder` (`catid`,`status`,`listorder`,`id`) USING BTREE,
  KEY `catid` (`catid`,`status`,`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hc_video
-- ----------------------------

-- ----------------------------
-- Table structure for `hc_video_content`
-- ----------------------------
DROP TABLE IF EXISTS `hc_video_content`;
CREATE TABLE `hc_video_content` (
  `contentid` int(10) unsigned NOT NULL DEFAULT '0',
  `modelid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `videoid` int(10) unsigned NOT NULL DEFAULT '0',
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  KEY `videoid` (`videoid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hc_video_content
-- ----------------------------

-- ----------------------------
-- Table structure for `hc_video_data`
-- ----------------------------
DROP TABLE IF EXISTS `hc_video_data`;
CREATE TABLE `hc_video_data` (
  `id` mediumint(8) unsigned DEFAULT '0',
  `content` text NOT NULL,
  `readpoint` smallint(5) unsigned NOT NULL DEFAULT '0',
  `groupids_view` varchar(100) NOT NULL,
  `paginationtype` tinyint(1) NOT NULL,
  `maxcharperpage` mediumint(6) NOT NULL,
  `template` varchar(30) NOT NULL,
  `paytype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allow_comment` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `relation` varchar(255) NOT NULL DEFAULT '',
  `video` tinyint(3) unsigned NOT NULL DEFAULT '0',
  KEY `id` (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hc_video_data
-- ----------------------------

-- ----------------------------
-- Table structure for `hc_video_store`
-- ----------------------------
DROP TABLE IF EXISTS `hc_video_store`;
CREATE TABLE `hc_video_store` (
  `videoid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` char(60) NOT NULL,
  `vid` char(40) NOT NULL,
  `keywords` char(40) NOT NULL,
  `description` char(255) NOT NULL,
  `status` tinyint(3) NOT NULL DEFAULT '0',
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `picpath` char(120) NOT NULL,
  `size` char(20) NOT NULL,
  `timelen` mediumint(9) NOT NULL DEFAULT '0',
  `userupload` tinyint(1) NOT NULL DEFAULT '0',
  `channelid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`videoid`),
  KEY `videoid` (`videoid`,`status`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hc_video_store
-- ----------------------------

-- ----------------------------
-- Table structure for `hc_wap`
-- ----------------------------
DROP TABLE IF EXISTS `hc_wap`;
CREATE TABLE `hc_wap` (
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '1',
  `sitename` char(30) NOT NULL,
  `logo` char(100) DEFAULT NULL,
  `domain` varchar(100) DEFAULT NULL,
  `setting` mediumtext,
  `status` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`siteid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hc_wap
-- ----------------------------
INSERT INTO `hc_wap` VALUES ('1', 'PHPCMS手机门户', '/statics/images/wap/wlogo.gif', '', 'array (\n  \'listnum\' => \'10\',\n  \'thumb_w\' => \'220\',\n  \'thumb_h\' => \'0\',\n  \'c_num\' => \'1000\',\n  \'index_template\' => \'index\',\n  \'category_template\' => \'category\',\n  \'list_template\' => \'list\',\n  \'show_template\' => \'show\',\n)', '0');

-- ----------------------------
-- Table structure for `hc_wap_type`
-- ----------------------------
DROP TABLE IF EXISTS `hc_wap_type`;
CREATE TABLE `hc_wap_type` (
  `typeid` smallint(5) NOT NULL AUTO_INCREMENT,
  `cat` smallint(5) NOT NULL,
  `parentid` smallint(5) NOT NULL,
  `typename` varchar(30) NOT NULL,
  `siteid` smallint(5) NOT NULL,
  `listorder` smallint(5) DEFAULT '0',
  PRIMARY KEY (`typeid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hc_wap_type
-- ----------------------------

-- ----------------------------
-- Table structure for `hc_workflow`
-- ----------------------------
DROP TABLE IF EXISTS `hc_workflow`;
CREATE TABLE `hc_workflow` (
  `workflowid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `steps` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `workname` varchar(20) NOT NULL,
  `description` varchar(255) NOT NULL,
  `setting` text NOT NULL,
  `flag` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`workflowid`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hc_workflow
-- ----------------------------
INSERT INTO `hc_workflow` VALUES ('1', '1', '1', '一级审核', '审核一次', '', '0');
INSERT INTO `hc_workflow` VALUES ('2', '1', '2', '二级审核', '审核两次', '', '0');
INSERT INTO `hc_workflow` VALUES ('3', '1', '3', '三级审核', '审核三次', '', '0');
INSERT INTO `hc_workflow` VALUES ('4', '1', '4', '四级审核', '四级审核', '', '0');
