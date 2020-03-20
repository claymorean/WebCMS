/*
 Navicat Premium Data Transfer

 Source Server         : Homestead
 Source Server Type    : MySQL
 Source Server Version : 50721
 Source Host           : 192.168.10.10:3306
 Source Schema         : cms

 Target Server Type    : MySQL
 Target Server Version : 50721
 File Encoding         : 65001

 Date: 20/03/2020 17:03:37
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for config
-- ----------------------------
DROP TABLE IF EXISTS `config`;
CREATE TABLE `config`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of config
-- ----------------------------
INSERT INTO `config` VALUES (1, 'web_name', '喵星科技');
INSERT INTO `config` VALUES (2, 'logo', 'assets/image/logo.png');
INSERT INTO `config` VALUES (3, 'index_type', '1');
INSERT INTO `config` VALUES (4, 'nav_type', '1');
INSERT INTO `config` VALUES (5, 'web_keywords', 'laravel,WebCMS');
INSERT INTO `config` VALUES (6, 'web_description', 'laravel,WebCMS');

-- ----------------------------
-- Table structure for images
-- ----------------------------
DROP TABLE IF EXISTS `images`;
CREATE TABLE `images`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(4) NULL DEFAULT 0 COMMENT '图片资源归属分类 1-banner',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `alt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of images
-- ----------------------------
INSERT INTO `images` VALUES (1, 1, 'http://web.cms/assets/image/banner1.png', 'banner1');
INSERT INTO `images` VALUES (2, 1, 'http://web.cms/assets/image/banner2.jpg', 'banner2');

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `parent_id` int(11) NULL DEFAULT 0,
  `route` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `order` int(255) NULL DEFAULT 1,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '1-通用 2-特殊',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES (1, '首页', 0, '/', 1, '1');
INSERT INTO `menu` VALUES (2, '解决方案', 0, '/solutions', 2, '1');
INSERT INTO `menu` VALUES (3, '产品中心', 0, '/product', 3, '1');
INSERT INTO `menu` VALUES (4, '新闻中心', 0, '/news', 4, '1');
INSERT INTO `menu` VALUES (5, '招纳贤士', 0, '/job', 5, '1');
INSERT INTO `menu` VALUES (6, '行业新闻', 4, '/industry', 1, '1');
INSERT INTO `menu` VALUES (7, '公司新闻', 4, '/company', 2, '1');
INSERT INTO `menu` VALUES (8, '技术交流', 4, '/technology', 3, '1');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户昵称',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '密码',
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `remember_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'admin', '$2y$10$z4k70Z0BCwGOtgNsxqruxu0V3l7MaAlcMhmPBC7FKAJWxysbJUvim', NULL, NULL, 'WrfF36iIe1U5xFkamGnvwyFkbhkheafGKSROVBUM2Ay9M7ReYqDcROl3wRQ6');

-- ----------------------------
-- Table structure for xycms_admin
-- ----------------------------
DROP TABLE IF EXISTS `xycms_admin`;
CREATE TABLE `xycms_admin`  (
  `adminid` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `adminname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `groupid` mediumint(8) UNSIGNED NULL DEFAULT 0,
  `super` smallint(2) UNSIGNED NULL DEFAULT 0,
  `timeline` int(10) UNSIGNED NULL DEFAULT 0,
  `flag` smallint(2) UNSIGNED NULL DEFAULT 0,
  `logintimeline` int(10) UNSIGNED NULL DEFAULT 0,
  `logintimes` int(10) UNSIGNED NULL DEFAULT 0,
  `loginip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `memo` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `extendtime` int(10) UNSIGNED NULL DEFAULT 0,
  `errorcounts` mediumint(3) UNSIGNED NULL DEFAULT 0,
  PRIMARY KEY (`adminid`) USING BTREE,
  INDEX `flag`(`flag`) USING BTREE,
  INDEX `groupid`(`groupid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xycms_admin
-- ----------------------------
INSERT INTO `xycms_admin` VALUES (1, 'admin', '658a5205c6d4079b59af338b03cb41c5', 0, 1, 1340005179, 1, 1467339132, 637, '192.168.0.1', '', 0, 0);
INSERT INTO `xycms_admin` VALUES (2, 'master', 'cb0e5888bc95167352296dee874f22ab', 2, 1, 1350106608, 1, 1469146566, 731, '192.168.0.1', '', 0, 0);

-- ----------------------------
-- Table structure for xycms_adsfigure
-- ----------------------------
DROP TABLE IF EXISTS `xycms_adsfigure`;
CREATE TABLE `xycms_adsfigure`  (
  `adsid` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `adsname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `zoneid` mediumint(8) UNSIGNED NULL DEFAULT 0,
  `uploadfiles` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `width` smallint(2) UNSIGNED NULL DEFAULT 0,
  `height` smallint(2) UNSIGNED NULL DEFAULT 0,
  `orders` mediumint(8) UNSIGNED NULL DEFAULT 0,
  `flag` smallint(2) UNSIGNED NULL DEFAULT 0,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `timeline` int(10) UNSIGNED NULL DEFAULT 0,
  PRIMARY KEY (`adsid`) USING BTREE,
  INDEX `zoneid`(`zoneid`) USING BTREE,
  INDEX `flag`(`flag`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xycms_adsfigure
-- ----------------------------
INSERT INTO `xycms_adsfigure` VALUES (2, '关键词', 1, 'data/images/banner/20121231103136_777.jpg', '', 0, 0, 5, 1, '', 1350951195);
INSERT INTO `xycms_adsfigure` VALUES (4, '祥云平台', 2, 'data/images/banner/20130104150759_213.jpg', '', 0, 0, 4, 1, '', 1357277623);
INSERT INTO `xycms_adsfigure` VALUES (9, '手机banner', 4, 'data/images/banner/20150513095759_178.jpg', '#', 0, 0, 11, 1, '', 1385518967);
INSERT INTO `xycms_adsfigure` VALUES (13, '手机banner', 4, 'data/images/banner/20150728145927_253.jpg', '', 0, 0, 12, 1, '', 1438066768);

-- ----------------------------
-- Table structure for xycms_adszone
-- ----------------------------
DROP TABLE IF EXISTS `xycms_adszone`;
CREATE TABLE `xycms_adszone`  (
  `zoneid` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `zonename` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `zonelabel` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `skinid` mediumint(8) UNSIGNED NULL DEFAULT 0,
  `orders` mediumint(8) UNSIGNED NULL DEFAULT 0,
  `flag` smallint(2) UNSIGNED NULL DEFAULT 0,
  `intro` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `width` smallint(2) UNSIGNED NULL DEFAULT 0,
  `height` smallint(2) UNSIGNED NULL DEFAULT 0,
  `slide` smallint(2) UNSIGNED NULL DEFAULT 0,
  `zonetype` smallint(2) UNSIGNED NULL DEFAULT 0,
  `timeline` int(10) UNSIGNED NULL DEFAULT 0,
  PRIMARY KEY (`zoneid`) USING BTREE,
  INDEX `skinid`(`skinid`) USING BTREE,
  INDEX `flag`(`flag`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xycms_adszone
-- ----------------------------
INSERT INTO `xycms_adszone` VALUES (1, '首页banner', '', 0, 1, 1, '', 990, 200, 1, 0, 1314244583);
INSERT INTO `xycms_adszone` VALUES (2, '内页banner', '', 0, 2, 1, '', 1000, 200, 1, 0, 1314244778);
INSERT INTO `xycms_adszone` VALUES (3, '其他广告', '', 0, 3, 1, '', 990, 200, 1, 0, 1314682240);
INSERT INTO `xycms_adszone` VALUES (4, '手机版banner图片', '', 0, 4, 1, '', 640, 300, 1, 0, 1385518663);

-- ----------------------------
-- Table structure for xycms_authgroup
-- ----------------------------
DROP TABLE IF EXISTS `xycms_authgroup`;
CREATE TABLE `xycms_authgroup`  (
  `groupid` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `groupname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `auths` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `flag` smallint(2) UNSIGNED NULL DEFAULT 0,
  `timeline` int(10) UNSIGNED NULL DEFAULT 0,
  `orders` smallint(2) UNSIGNED NULL DEFAULT 0,
  `intro` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`groupid`) USING BTREE,
  INDEX `flag`(`flag`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xycms_authgroup
-- ----------------------------
INSERT INTO `xycms_authgroup` VALUES (1, '信息录入', '', 1, 1313898288, 1, '主要给信息录入员录入数据');
INSERT INTO `xycms_authgroup` VALUES (2, '用户组', 'config,adminedit,editpass,delimitvolsit,delimitedit,adsvolist,adsadd,adsedit,adsdel,jobcatevolsit,jobcateadd,jobcateedit,jobcatedel,jobvolist,jobadd,jobedit,jobdel,pagecatevolist,pagecateadd,pagecateedit,pagecatedel,pagevolist,pageadd,pageedit,pagedel,linkvolist,linkadd,guestbookvolist,guestbookedit,guestbookdel,infocatevolist,infocateadd,infocateedit,infocatedel,infovolist,infoadd,infoedit,infodel,productcatevolist,productcateadd,productcateedit,productcatedel,productvolist,productadd,productedit,productdel,casecatevolist,casecateadd,casecateedit,casecatedel,casevolist,caseadd,caseedit,casedel,solutioncatevolist,solutioncateadd,solutioncateedit,solutioncatedel,solutionvolist,solutionadd,solutionedit,solutiondel,downloadcatevolist,downloadcateadd,downloadcateedit,downloadcatedel,downloadvolist,downloadadd,downloadedit,downloaddel', 1, 1350106370, 2, '');

-- ----------------------------
-- Table structure for xycms_case
-- ----------------------------
DROP TABLE IF EXISTS `xycms_case`;
CREATE TABLE `xycms_case`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `cid` mediumint(8) UNSIGNED NULL DEFAULT 0,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `thumbfiles` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `uploadfiles` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `timeline` int(10) UNSIGNED NULL DEFAULT 0,
  `elite` smallint(2) UNSIGNED NULL DEFAULT 0,
  `flag` smallint(2) UNSIGNED NULL DEFAULT 0,
  `hits` int(10) UNSIGNED NULL DEFAULT 0,
  `orders` mediumint(8) UNSIGNED NULL DEFAULT 0,
  `tag` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ctitle` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ckeywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cdescription` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `cateid`(`cid`) USING BTREE,
  INDEX `flag`(`flag`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xycms_case
-- ----------------------------
INSERT INTO `xycms_case` VALUES (1, 7, '案例比例（150×120）2', 'data/images/product/20150414141109_102.jpg', 'data/images/product/thumb_20150414141109_102.jpg', '<p>案例比例（150×120）</p>', 1428940800, 0, 1, 0, 5, '关键词10', '', '', '');
INSERT INTO `xycms_case` VALUES (2, 6, '案例比例（150×120）4', 'data/images/product/20150414141129_859.jpg', 'data/images/product/thumb_20150414141129_859.jpg', '<p>案例比例（150×120）</p>', 1428940800, 0, 1, 0, 2, '关键词10', '', '', '');
INSERT INTO `xycms_case` VALUES (3, 7, '案例比例（150×120）1', 'data/images/case/thumb_20160527094514_935.jpg', 'data/images/case/20160527094514_935.jpg', '<p>案例比例（150×120）</p>', 1428940800, 0, 1, 0, 8, '关键词10', '', '', '');
INSERT INTO `xycms_case` VALUES (4, 6, '案例比例（150×120）3', 'data/images/product/20150414141201_748.jpg', 'data/images/product/thumb_20150414141201_748.jpg', '<p>案例比例（150×120）</p>', 1428940800, 0, 1, 0, 4, '关键词10', '', '', '');

-- ----------------------------
-- Table structure for xycms_casecate
-- ----------------------------
DROP TABLE IF EXISTS `xycms_casecate`;
CREATE TABLE `xycms_casecate`  (
  `cid` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `cname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `word` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pathname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `parentid` mediumint(8) UNSIGNED NULL DEFAULT 0,
  `depth` mediumint(8) UNSIGNED NULL DEFAULT 0,
  `orders` mediumint(8) UNSIGNED NULL DEFAULT 0,
  `flag` smallint(2) UNSIGNED NULL DEFAULT 0,
  `intro` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `timeline` int(10) UNSIGNED NULL DEFAULT 0,
  `elite` smallint(2) UNSIGNED NULL DEFAULT 0,
  `img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `linktype` smallint(2) UNSIGNED NULL DEFAULT 1,
  `linkurl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `target` smallint(2) UNSIGNED NULL DEFAULT 1,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `keywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`cid`) USING BTREE,
  INDEX `parentid`(`parentid`) USING BTREE,
  INDEX `orders`(`orders`) USING BTREE,
  INDEX `flag`(`flag`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xycms_casecate
-- ----------------------------
INSERT INTO `xycms_casecate` VALUES (1, '一级案例', 'yjal', '', 0, 0, 1, 1, '', 1406193943, 0, '', 1, '', 1, '<p>资料整理中...<br/></p>', '', '', '');
INSERT INTO `xycms_casecate` VALUES (7, '案例展示', 'alzs3b6', '', 0, 0, 7, 1, '', 1407122131, 0, '', 1, '', 1, '', '', '', '');

-- ----------------------------
-- Table structure for xycms_config
-- ----------------------------
DROP TABLE IF EXISTS `xycms_config`;
CREATE TABLE `xycms_config`  (
  `sitename` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mtitle` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sitetitle` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `siteurl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `agent_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `agent_url` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `metadescription` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `metakeyword` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sitecopyright` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `icpcode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tjcode` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `tj_url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pcate_d` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `plist_d` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `pdetail_d` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `pdetail_page` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `bridge` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `copy` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `thumbwidth` smallint(2) UNSIGNED NULL DEFAULT 0,
  `thumbheight` smallint(2) UNSIGNED NULL DEFAULT 0,
  `watermarkflag` smallint(2) UNSIGNED NULL DEFAULT 0,
  `watermarkfile` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `watermarkpos` smallint(2) UNSIGNED NULL DEFAULT 0,
  `logoimg` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pcico` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `qr_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `newspagesize` smallint(2) UNSIGNED NULL DEFAULT 15,
  `productpagesize` smallint(2) UNSIGNED NULL DEFAULT 15,
  `jobpagesize` smallint(2) UNSIGNED NULL DEFAULT 15,
  `downpagesize` smallint(2) UNSIGNED NULL DEFAULT 15,
  `qqstatus` smallint(2) UNSIGNED NULL DEFAULT 0,
  `msgstatus` smallint(2) UNSIGNED NOT NULL,
  `open301` smallint(2) UNSIGNED NOT NULL,
  `cachstatus` smallint(2) UNSIGNED NULL DEFAULT 0,
  `cachtime` mediumint(8) UNSIGNED NULL DEFAULT 0,
  `tagcolor` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tel` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `message_tel` smallint(1) UNSIGNED NOT NULL DEFAULT 0,
  `tailword` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `front` tinyint(4) UNSIGNED NOT NULL DEFAULT 0,
  `uploadwidth` smallint(2) UNSIGNED NULL DEFAULT 0,
  `uploadheight` smallint(2) UNSIGNED NULL DEFAULT 0,
  `openpwd` smallint(2) UNSIGNED NOT NULL DEFAULT 1,
  `prodescription` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `casepagesize` smallint(2) UNSIGNED NULL DEFAULT 15,
  `ratio` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '2',
  `custom_tel` smallint(2) UNSIGNED NULL DEFAULT 0,
  `categorynumber` smallint(2) UNSIGNED NULL DEFAULT 0,
  `copynum` smallint(1) UNSIGNED NOT NULL DEFAULT 1,
  `webname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `translate` smallint(2) UNSIGNED NULL DEFAULT 0,
  `w_automatic` smallint(2) UNSIGNED NULL DEFAULT 1,
  `webimg` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  INDEX `icpcode`(`icpcode`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xycms_config
-- ----------------------------
INSERT INTO `xycms_config` VALUES ('祥云平台', '手机网站', '关键词_关键词_关键词-祥云平台', '218.4.132.130:7681', '祥云平台', 'www.cn86.cn', '苏州祥云平台信息技术有限公司是一家专业致力于为中国企业提供全方位、多层面的互联网服务运营商。公司依靠自主研发的应用软件系统，基于云计算SaaS模式，重点面向中国广大企业客户，专业提供企业互联网基础运营服务，并为企业搭建互联网一站式整合软件系统。', '关键词1,关键词2,关键词3,关键词4,关键词5,关键词6,关键词7,关键词8,关键词9,关键词10', '<script type=\"text/javascript\"> function copyURL () { var url = location.href; window.clipboardData.setData(\"Text\",url); alert(\"该网页链接地址已复制，您可以粘贴(快截键CTRL+V)在需要的地方\");  } </script>\r\n Copyright www.cn3000.cn(<a title=\"复制链接\" href=\"javascript:copyURL();\" target=\"_parent\">复制链接</a>)华企立方信息技术专业从事于 <a href=\"http://www.cn3000.cn\" target=\"_blank\">网站建设</a>,<a href=\"http://www.cn3000.cn\" target=\"_blank\">搜索引擎优化</a>,<a href=\"http://www.cn3000.cn\" target=\"_blank\">网上商城</a>.欢迎来电咨询! <br />\r\n热门搜索:网站建设方案,网站建设需要多少钱,网站建设报价&nbsp; Powered by <a href=\"http://www.cn3000.cn/\" target=\"_blank\"><span style=\"color:#0099ff;\">祥云平台</span></a>', '', '', '', '{1}{2}为你详细介绍{1}的产品分类,包括{1}下的所有产品的用途、型号、范围、图片、新闻及价格。同时我们还为您精选了{1}分类的行业资讯、价格行情、展会信息、图片资料等，在{3}等全国地区获得用户好评，欲了解更多详细信息,请点击访问!', '{1}{2}为你详细介绍{1}的内容,包括{1}的用途、型号、范围、图片、评论等,在这里你可以得知所有{1}的新闻以及目前的市场{1}价格，{1}所属产品分类是{4}，在{3}等全国地区获得用户好评，欲了解更多详细信息,请点击访问!', '本页内容为您提供{1}，{1}为{2}整理发布。', '本页内容为您提供{1}详细介绍，精选{1}信息，提供{1}优质的服务，{1}为{2}整理发布。', '', '<script>\r\ndocument.onkeydown = function(e){\r\nvar e=e||event;\r\nif (e.ctrlKey==1 && e.keyCode==67){\r\nreturn false;\r\n}\r\n}//防止ctrl+C\r\ndocument.body.oncopy = function (){return false;} //阻止复制\r\n</script>\r\n<script> document.body.onselectstart=document.body.oncontextmenu=function(){return false;};</script>', 150, 120, 0, 'watermark.png', 4, 'data/images/other/20151022161403_247.png', 'm/icon.png?1874691353', 'ico/favicon.ico?539359409', '', 20, 24, 20, 20, 1, 1, 0, 0, 1, '136ec2', '', '', 1, '价格,批发,供应商', 0, 300, 240, 1, '为你详细介绍产品中心的产品内容,包括产品中心的用途、型号、范围、图片等,在这里你可以得知所有产品中心的新闻以及最新的市场产品中心价格。', 24, '2', 0, 3, 0, '祥云平台', 0, 1, 'data/images/other/20160613113749_110.png');

-- ----------------------------
-- Table structure for xycms_delimitlabel
-- ----------------------------
DROP TABLE IF EXISTS `xycms_delimitlabel`;
CREATE TABLE `xycms_delimitlabel`  (
  `labelid` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `skinid` mediumint(8) UNSIGNED NULL DEFAULT 0,
  `labeltitle` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `labelname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `labelcontent` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `flag` smallint(2) UNSIGNED NULL DEFAULT 0,
  `timeline` int(10) UNSIGNED NULL DEFAULT 0,
  PRIMARY KEY (`labelid`) USING BTREE,
  INDEX `skinid`(`skinid`) USING BTREE,
  INDEX `flag`(`flag`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xycms_delimitlabel
-- ----------------------------
INSERT INTO `xycms_delimitlabel` VALUES (18, 1, '内页左侧联系我们', 'contact_left', '<p><span style=\"font-size:13px;font-family:宋体;color:#333333\">内页左侧联系我们</span></p>', 1, 1406600458);
INSERT INTO `xycms_delimitlabel` VALUES (19, 1, '首页公司简介', 'about', '<p style=\"line-height: 2em;\">苏州祥云平台信息技术有限公司是一家专业致力于为中国企业提供全方位、多层面的互联网服务运营商。公司依靠自主研发的应用软件系统，基于云计算SaaS模式，重点面向中国广大企业客户，专业提供企业互联网基础运营服务，并为企业搭建互联网一站式整合软件系统。\r\n\r\n公司凭借多年的互联网研发和服务经验，自2012年，祥云平台产品布局全国，现已在上海、天津、杭州、深圳、广州、佛山、苏州、青岛、南昌、西安、石家庄、贵州、保定、义乌、金华、包头等全国200余个城市设立了服务机构，成为规模庞大、实力雄厚的信息化运营服务提供商！\r\n \r\n公司现有员工100余人...</p>', 1, 1406600469);
INSERT INTO `xycms_delimitlabel` VALUES (16, 1, '技术优势', 'advantage', '<p>技术优势</p>', 1, 1406600422);
INSERT INTO `xycms_delimitlabel` VALUES (17, 1, '头部联系电话', 'top_contact', '<p><span style=\"font-size:13px;font-family:宋体;color:#333333\">头部联系电话</span></p>', 1, 1406600436);
INSERT INTO `xycms_delimitlabel` VALUES (15, 1, '底部链接导航', 'footerlink', '<p><a href=\"/\">网站首页</a> | <a href=\"/about/\">关于我们</a> | <a href=\"/product/\">产品中心</a> | <a href=\"/news/\">新闻中心</a> | <a href=\"/message/\" rel=\"nofollow\">在线留言</a>&nbsp;|&nbsp;<a href=\"/about/contact.html\">联系我们</a></p>', 1, 1406600406);
INSERT INTO `xycms_delimitlabel` VALUES (20, 1, '首页联系我们', 'contact', '', 1, 1406765913);

-- ----------------------------
-- Table structure for xycms_download
-- ----------------------------
DROP TABLE IF EXISTS `xycms_download`;
CREATE TABLE `xycms_download`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `uploadfiles` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `filesize` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `cid` mediumint(8) UNSIGNED NULL DEFAULT 0,
  `hits` int(10) UNSIGNED NULL DEFAULT 0,
  `img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `downs` int(10) UNSIGNED NULL DEFAULT 0,
  `elite` smallint(2) UNSIGNED NULL DEFAULT 0,
  `flag` smallint(2) UNSIGNED NULL DEFAULT 0,
  `dateline` int(10) UNSIGNED NULL DEFAULT 0,
  `timeline` int(10) UNSIGNED NULL DEFAULT 0,
  `tag` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `realname` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `dtitle` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `dkeywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ddescription` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `cateid`(`cid`) USING BTREE,
  INDEX `flag`(`flag`) USING BTREE,
  FULLTEXT INDEX `title`(`title`)
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for xycms_downloadcate
-- ----------------------------
DROP TABLE IF EXISTS `xycms_downloadcate`;
CREATE TABLE `xycms_downloadcate`  (
  `cid` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `cname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `parentid` mediumint(8) UNSIGNED NULL DEFAULT 0,
  `depth` mediumint(8) UNSIGNED NULL DEFAULT 0,
  `orders` mediumint(8) UNSIGNED NULL DEFAULT 0,
  `flag` smallint(2) UNSIGNED NULL DEFAULT 0,
  `intro` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `timeline` int(10) UNSIGNED NULL DEFAULT 0,
  `elite` smallint(2) UNSIGNED NULL DEFAULT 0,
  `img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `linktype` smallint(2) UNSIGNED NULL DEFAULT 1,
  `linkurl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `target` smallint(2) UNSIGNED NULL DEFAULT 1,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `keywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`cid`) USING BTREE,
  INDEX `parentid`(`parentid`) USING BTREE,
  INDEX `orders`(`orders`) USING BTREE,
  INDEX `flag`(`flag`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xycms_downloadcate
-- ----------------------------
INSERT INTO `xycms_downloadcate` VALUES (2, '下载分类', 0, 0, 1, 1, '', 1385534658, 0, '', 1, '', 1, '', '', '');

-- ----------------------------
-- Table structure for xycms_guestbook
-- ----------------------------
DROP TABLE IF EXISTS `xycms_guestbook`;
CREATE TABLE `xycms_guestbook`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `contact` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `timeline` int(10) UNSIGNED NULL DEFAULT 0,
  `ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `flag` smallint(2) UNSIGNED NULL DEFAULT 1,
  `isread` smallint(2) UNSIGNED NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for xycms_info
-- ----------------------------
DROP TABLE IF EXISTS `xycms_info`;
CREATE TABLE `xycms_info`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `cid` mediumint(8) UNSIGNED NULL DEFAULT 0,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `thumbfiles` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `uploadfiles` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `timeline` int(10) UNSIGNED NULL DEFAULT 0,
  `elite` smallint(2) UNSIGNED NULL DEFAULT 0,
  `flag` smallint(2) UNSIGNED NULL DEFAULT 0,
  `hits` int(10) UNSIGNED NULL DEFAULT 0,
  `orders` mediumint(8) UNSIGNED NULL DEFAULT 0,
  `tag` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `author` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ntitle` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `nkeywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ndescription` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `cateid`(`cid`) USING BTREE,
  INDEX `flag`(`flag`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 203 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xycms_info
-- ----------------------------
INSERT INTO `xycms_info` VALUES (172, 1, '企业需要最新的互联网技术服务', '', '', '<p>企业需要最新的互联网技术服务</p>', 1407373021, 0, 1, 7, 0, '一级分类最新', '', '', '', '');
INSERT INTO `xycms_info` VALUES (173, 1, '企业需要最新的互联网技术服务', '', '', '<p>企业需要最新的互联网技术服务</p>', 1407373026, 0, 1, 6, 0, '一级分类最新', '', '', '', '');
INSERT INTO `xycms_info` VALUES (174, 1, '企业需要最新的互联网技术服务', '', '', '<p>企业需要最新的互联网技术服务</p>', 1407373056, 0, 1, 6, 0, '一级分类最新', '', '', '', '');
INSERT INTO `xycms_info` VALUES (175, 1, '企业需要最新的互联网技术服务', '', '', '<p>企业需要最新的互联网技术服务</p>', 1407373062, 0, 1, 3, 0, '一级分类最新', '', '', '', '');
INSERT INTO `xycms_info` VALUES (176, 1, '企业需要最新的互联网技术服务', '', '', '<p>企业需要最新的互联网技术服务</p>', 1407373068, 0, 1, 6, 0, '一级分类最新', '', '', '', '');
INSERT INTO `xycms_info` VALUES (177, 1, '企业需要最新的互联网技术服务', '', '', '<p>企业需要最新的互联网技术服务</p>', 1407373072, 0, 1, 6, 0, '一级分类最新', '', '', '', '');
INSERT INTO `xycms_info` VALUES (178, 1, '企业需要最新的互联网技术服务', '', '', '<p>企业需要最新的互联网技术服务</p>', 1407373077, 0, 1, 5, 0, '一级分类最新', '', '', '', '');
INSERT INTO `xycms_info` VALUES (179, 1, '企业需要最新的互联网技术服务', '', '', '<p>企业需要最新的互联网技术服务</p>', 1407373083, 0, 1, 30, 0, '一级分类最新', '', '', '', '');
INSERT INTO `xycms_info` VALUES (187, 3, '“互联网+”代表一种新的经济形态；', '', '', '<p style=\"line-height: 200%; margin-top: 4.32pt; margin-bottom: 0pt; direction: ltr; unicode-bidi: embed; vertical-align: baseline;\"><span style=\"font-family: Calibri;\">“互联网</span><span style=\"font-family: Calibri;\">+</span><span style=\"font-family: Calibri;\">”代表一种新的经济</span><span style=\"font-family: 宋体;\">形态；</span></p><p><br/></p>', 1431500370, 0, 1, 7, 0, '一级分类最新', '', '', '', '');
INSERT INTO `xycms_info` VALUES (188, 3, '“互联网+”代表一种新的经济形态；', '', '', '<p style=\"line-height: 200%; margin-top: 4.32pt; margin-bottom: 0pt; direction: ltr; unicode-bidi: embed; vertical-align: baseline;\"><span style=\"font-family: Calibri;\">“互联网</span><span style=\"font-family: Calibri;\">+</span><span style=\"font-family: Calibri;\">”代表一种新的经济</span><span style=\"font-family: 宋体;\">形态；</span></p><p><br/></p>', 1431500375, 0, 1, 4, 0, '一级分类最新', '', '', '', '');
INSERT INTO `xycms_info` VALUES (189, 3, '“互联网+”代表一种新的经济形态；', '', '', '<p style=\"line-height: 200%; margin-top: 4.32pt; margin-bottom: 0pt; direction: ltr; unicode-bidi: embed; vertical-align: baseline;\"><span style=\"font-family: Calibri;\">“互联网</span><span style=\"font-family: Calibri;\">+</span><span style=\"font-family: Calibri;\">”代表一种新的经济</span><span style=\"font-family: 宋体;\">形态；</span></p><p><br/></p>', 1431500379, 0, 1, 5, 0, '一级分类最新', '', '', '', '');
INSERT INTO `xycms_info` VALUES (190, 3, '“互联网+”代表一种新的经济形态；', '', '', '<p style=\"line-height: 200%; margin-top: 4.32pt; margin-bottom: 0pt; direction: ltr; unicode-bidi: embed; vertical-align: baseline;\"><span style=\"font-family: Calibri;\">“互联网</span><span style=\"font-family: Calibri;\">+</span><span style=\"font-family: Calibri;\">”代表一种新的经济</span><span style=\"font-family: 宋体;\">形态；</span></p><p><br/></p>', 1431500384, 0, 1, 3, 0, '一级分类最新', '', '', '', '');
INSERT INTO `xycms_info` VALUES (191, 3, '“互联网+”代表一种新的经济形态；', '', '', '<p style=\"line-height: 200%; margin-top: 4.32pt; margin-bottom: 0pt; direction: ltr; unicode-bidi: embed; vertical-align: baseline;\"><span style=\"font-family: Calibri;\">“互联网</span><span style=\"font-family: Calibri;\">+</span><span style=\"font-family: Calibri;\">”代表一种新的经济</span><span style=\"font-family: 宋体;\">形态；</span></p><p><br/></p>', 1431500390, 0, 1, 7, 0, '一级分类最新', '', '', '', '');
INSERT INTO `xycms_info` VALUES (192, 3, '“互联网+”代表一种新的经济形态；', '', '', '<p style=\"line-height: 200%; margin-top: 4.32pt; margin-bottom: 0pt; direction: ltr; unicode-bidi: embed; vertical-align: baseline;\"><span style=\"font-family: Calibri;\">“互联网</span><span style=\"font-family: Calibri;\">+</span><span style=\"font-family: Calibri;\">”代表一种新的经济</span><span style=\"font-family: 宋体;\">形态；</span></p><p><br/></p>', 1431500399, 0, 1, 14, 0, '一级分类最新', '', '', '', '');
INSERT INTO `xycms_info` VALUES (193, 3, '“互联网+”代表一种新的经济形态；', '', '', '<p><span style=\"line-height: 200%; font-family: Calibri;\">“互联网</span><span style=\"line-height: 200%; font-family: Calibri;\">+</span><span style=\"line-height: 200%; font-family: Calibri;\">”代表一种新的经济</span><span style=\"line-height: 200%; font-family: 宋体;\">形态；</span></p><p><br/></p>', 1431500405, 0, 1, 21, 0, '一级分类最新', '', '', '', '');
INSERT INTO `xycms_info` VALUES (194, 4, '整合互联网工具，推动传统企业创新发展', '', '', '<p><span style=\"font-family: 微软雅黑;\">整合互联网工具，推动传统企业创新发展</span></p>', 1431500427, 0, 1, 3, 0, '产品分类', '', '', '', '');
INSERT INTO `xycms_info` VALUES (195, 4, '整合互联网工具，推动传统企业创新发展', '', '', '<p><span style=\"font-family: 微软雅黑;\">整合互联网工具，推动传统企业创新发展</span></p>', 1431500430, 0, 1, 12, 0, '产品分类', '', '', '', '');
INSERT INTO `xycms_info` VALUES (196, 4, '整合互联网工具，推动传统企业创新发展', '', '', '<p><span style=\"font-family: 微软雅黑;\">整合互联网工具，推动传统企业创新发展</span></p>', 1431500434, 0, 1, 7, 0, '产品分类', '', '', '', '');
INSERT INTO `xycms_info` VALUES (197, 4, '整合互联网工具，推动传统企业创新发展', '', '', '<p><span style=\"font-family: 微软雅黑;\">整合互联网工具，推动传统企业创新发展</span></p>', 1431500437, 1, 1, 7, 0, '产品分类', '', '', '', '');
INSERT INTO `xycms_info` VALUES (198, 4, '整合互联网工具，推动传统企业创新发展', '', '', '<p><span style=\"font-family: 微软雅黑;\">整合互联网工具，推动传统企业创新发展</span></p>', 1431500440, 1, 1, 13, 0, '产品分类', '', '', '', '');
INSERT INTO `xycms_info` VALUES (199, 4, '整合互联网工具，推动传统企业创新发展', '', '', '<p><span style=\"font-family: 微软雅黑;\">整合互联网工具，推动传统企业创新发展</span></p>', 1431500444, 1, 1, 10, 0, '产品分类', '', '', '', '');
INSERT INTO `xycms_info` VALUES (200, 4, '整合互联网工具，推动传统企业创新发展', '', '', '<p><span style=\"font-family: 微软雅黑;\">整合互联网工具，推动传统企业创新发展</span></p>', 1431446400, 1, 1, 17, 0, '产品分类', '', '', '', '');
INSERT INTO `xycms_info` VALUES (201, 4, '整合互联网工具，推动传统企业创新发展', '', '', '<p>整合互联网工具，推动传统企业创新发展整合互联网工具，推动传统企业创新发展整合互联网工具，推动传统企业创新发展整合互联网工具，推动传统企业创新发展整合互联网工具，推动传统企业创新发展</p><p><br/></p>', 1433088000, 1, 1, 138, 0, '整合互联网工具', '祥云平台', '3243', '343', '34');

-- ----------------------------
-- Table structure for xycms_infocate
-- ----------------------------
DROP TABLE IF EXISTS `xycms_infocate`;
CREATE TABLE `xycms_infocate`  (
  `cid` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `cname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `word` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pathname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `parentid` mediumint(8) UNSIGNED NULL DEFAULT 0,
  `depth` mediumint(8) UNSIGNED NULL DEFAULT 0,
  `orders` mediumint(8) UNSIGNED NULL DEFAULT 0,
  `flag` smallint(2) UNSIGNED NULL DEFAULT 0,
  `intro` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `timeline` int(10) UNSIGNED NULL DEFAULT 0,
  `elite` smallint(2) UNSIGNED NULL DEFAULT 0,
  `img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `linktype` smallint(2) UNSIGNED NULL DEFAULT 1,
  `linkurl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `target` smallint(2) UNSIGNED NULL DEFAULT 1,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `keywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`cid`) USING BTREE,
  INDEX `parentid`(`parentid`) USING BTREE,
  INDEX `orders`(`orders`) USING BTREE,
  INDEX `flag`(`flag`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xycms_infocate
-- ----------------------------
INSERT INTO `xycms_infocate` VALUES (1, '公司新闻', 'company', '', 0, 0, 1, 1, '', 1314323798, 0, '', 1, '', 1, '', '', '', '');
INSERT INTO `xycms_infocate` VALUES (3, '行业新闻', 'xydt', '', 0, 0, 2, 1, '行业新闻', 1374561848, 0, '', 1, '', 2, '', '', '', '');
INSERT INTO `xycms_infocate` VALUES (4, '技术知识', 'jszx30f', '', 0, 0, 3, 1, '技术知识', 1431500358, 0, '', 1, '', 1, '', '', '', '');

-- ----------------------------
-- Table structure for xycms_job
-- ----------------------------
DROP TABLE IF EXISTS `xycms_job`;
CREATE TABLE `xycms_job`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `cid` mediumint(8) UNSIGNED NULL DEFAULT 0,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `workarea` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `number` smallint(2) UNSIGNED NULL DEFAULT 0,
  `jobdescription` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `jobrequest` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `jobotherrequest` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `jobcontact` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `timeline` int(10) UNSIGNED NULL DEFAULT 0,
  `flag` smallint(2) UNSIGNED NULL DEFAULT 0,
  `hits` int(10) UNSIGNED NULL DEFAULT 0,
  `jtitle` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `jkeywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `jdescription` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `cateid`(`cid`) USING BTREE,
  INDEX `flag`(`flag`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for xycms_jobcate
-- ----------------------------
DROP TABLE IF EXISTS `xycms_jobcate`;
CREATE TABLE `xycms_jobcate`  (
  `cid` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `cname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `parentid` mediumint(8) UNSIGNED NULL DEFAULT 0,
  `depth` mediumint(8) UNSIGNED NULL DEFAULT 0,
  `orders` smallint(2) UNSIGNED NULL DEFAULT 0,
  `flag` smallint(2) UNSIGNED NULL DEFAULT 0,
  `intro` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `timeline` int(10) UNSIGNED NULL DEFAULT 0,
  `elite` smallint(2) UNSIGNED NULL DEFAULT 0,
  `img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `linktype` smallint(2) UNSIGNED NULL DEFAULT 1,
  `linkurl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `target` smallint(2) UNSIGNED NULL DEFAULT 1,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `keywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`cid`) USING BTREE,
  INDEX `parentid`(`parentid`) USING BTREE,
  INDEX `orders`(`orders`) USING BTREE,
  INDEX `flag`(`flag`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xycms_jobcate
-- ----------------------------
INSERT INTO `xycms_jobcate` VALUES (3, '招聘分类', 0, 0, 3, 1, '', 1385534675, 0, '', 1, '', 1, '', '', '');

-- ----------------------------
-- Table structure for xycms_keywords
-- ----------------------------
DROP TABLE IF EXISTS `xycms_keywords`;
CREATE TABLE `xycms_keywords`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `wname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `timeline` int(10) UNSIGNED NULL DEFAULT 0,
  `flag` smallint(2) UNSIGNED NULL DEFAULT 1,
  `word` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `uploadfiles` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `thumbfiles` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `tag` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `wtitle` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `wkeywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `wdescription` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for xycms_link
-- ----------------------------
DROP TABLE IF EXISTS `xycms_link`;
CREATE TABLE `xycms_link`  (
  `linkid` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `linktitle` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fontcolor` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `linkurl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `linktype` smallint(2) UNSIGNED NULL DEFAULT 0,
  `logoimg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `timeline` int(10) UNSIGNED NULL DEFAULT 0,
  `flag` smallint(2) UNSIGNED NULL DEFAULT 0,
  `intro` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `orders` smallint(2) UNSIGNED NULL DEFAULT 0,
  `nofollow` smallint(2) UNSIGNED NULL DEFAULT 0,
  PRIMARY KEY (`linkid`) USING BTREE,
  INDEX `flag`(`flag`) USING BTREE,
  INDEX `linktype`(`linktype`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xycms_link
-- ----------------------------
INSERT INTO `xycms_link` VALUES (2, '百度', '', 'http://www.baidu.com', 1, '', 1465177692, 1, '', 1, 0);
INSERT INTO `xycms_link` VALUES (3, '小米', '', 'http://www.mi.com', 1, '', 1465197817, 1, '', 2, 1);

-- ----------------------------
-- Table structure for xycms_log
-- ----------------------------
DROP TABLE IF EXISTS `xycms_log`;
CREATE TABLE `xycms_log`  (
  `logid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `logtype` smallint(2) UNSIGNED NULL DEFAULT 0,
  `timeline` int(10) UNSIGNED NULL DEFAULT 0,
  PRIMARY KEY (`logid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1716 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xycms_log
-- ----------------------------
INSERT INTO `xycms_log` VALUES (1, 'master', '192.168.0.1', '登录后台成功.', 1, 1431914262);
INSERT INTO `xycms_log` VALUES (2, 'master', '192.168.0.1', '登录后台成功.', 1, 1431932893);
INSERT INTO `xycms_log` VALUES (3, 'master', '192.168.0.1', '编辑产品分类成功[三级分类1545845487545]', 1, 1431932913);
INSERT INTO `xycms_log` VALUES (4, 'master', '192.168.0.1', '添加产品分类成功[水电发电示范]', 1, 1431933129);
INSERT INTO `xycms_log` VALUES (5, 'master', '192.168.0.1', '添加产品分类成功[啊发电示范]', 1, 1431933135);
INSERT INTO `xycms_log` VALUES (6, 'master', '192.168.0.1', '添加产品分类成功[啊司法所等发达]', 1, 1431933139);
INSERT INTO `xycms_log` VALUES (7, 'master', '192.168.0.1', '删除产品分类分类成功[id=14]', 1, 1431933173);
INSERT INTO `xycms_log` VALUES (8, 'master', '192.168.0.1', '删除产品分类分类成功[id=16]', 1, 1431933175);
INSERT INTO `xycms_log` VALUES (9, 'master', '192.168.0.1', '删除产品分类分类成功[id=15]', 1, 1431933177);
INSERT INTO `xycms_log` VALUES (10, 'master', '192.168.0.1', '删除产品分类分类成功[id=3]', 1, 1431933179);
INSERT INTO `xycms_log` VALUES (11, 'master', '192.168.0.1', '登录后台成功.', 1, 1431996575);
INSERT INTO `xycms_log` VALUES (12, 'master', '192.168.0.1', '注销退出后台管理.', 1, 1432003058);
INSERT INTO `xycms_log` VALUES (13, 'master', '192.168.0.1', '登录后台成功.', 1, 1432003071);
INSERT INTO `xycms_log` VALUES (14, 'master', '192.168.0.1', '登录后台成功.', 1, 1432104754);
INSERT INTO `xycms_log` VALUES (15, 'master', '192.168.0.1', '删除留言成功[id=Array]', 1, 1432106580);
INSERT INTO `xycms_log` VALUES (16, 'master', '192.168.0.1', '删除留言成功[id=Array]', 1, 1432106584);
INSERT INTO `xycms_log` VALUES (17, 'master', '192.168.0.1', '登录后台成功.', 1, 1432173589);
INSERT INTO `xycms_log` VALUES (18, 'master', '192.168.0.1', '更新站点参数设置成功', 1, 1432173604);
INSERT INTO `xycms_log` VALUES (19, 'master', '192.168.0.1', '更新站点参数设置成功', 1, 1432173649);
INSERT INTO `xycms_log` VALUES (20, 'master', '192.168.0.1', '添加资讯分类成功[二级分类]', 1, 1432178350);
INSERT INTO `xycms_log` VALUES (21, 'master', '192.168.0.1', '删除产品分类分类成功[id=5]', 1, 1432178614);
INSERT INTO `xycms_log` VALUES (22, 'master', '192.168.0.1', '登录后台成功.', 1, 1432255569);
INSERT INTO `xycms_log` VALUES (23, 'master', '192.168.0.1', '更新站点参数设置成功', 1, 1432262235);
INSERT INTO `xycms_log` VALUES (24, 'master', '192.168.0.1', '更新站点参数设置成功', 1, 1432262618);
INSERT INTO `xycms_log` VALUES (25, 'master', '192.168.0.1', '更新站点参数设置成功', 1, 1432262634);
INSERT INTO `xycms_log` VALUES (26, 'master', '192.168.0.1', '发布信息成功[sdfsdf]', 1, 1432262741);
INSERT INTO `xycms_log` VALUES (27, 'master', '192.168.0.1', '编辑信息成功[id=5]', 1, 1432262762);
INSERT INTO `xycms_log` VALUES (28, 'master', '192.168.0.1', '删除新闻成功[id=Array]', 1, 1432286221);
INSERT INTO `xycms_log` VALUES (29, 'master', '192.168.0.1', '登录后台成功.', 1, 1432344872);
INSERT INTO `xycms_log` VALUES (30, 'master', '192.168.0.1', '编辑信息成功[id=3]', 1, 1432348264);
INSERT INTO `xycms_log` VALUES (1302, 'admin', '192.168.0.1', '登陆失败超过五次，90秒后才能重新登陆！', 1, 1465863621);
INSERT INTO `xycms_log` VALUES (1301, 'admin', '192.168.0.1', '登录后台失败.', 1, 1465863612);
INSERT INTO `xycms_log` VALUES (1300, 'admin', '192.168.0.1', '登录后台失败.', 1, 1465863599);
INSERT INTO `xycms_log` VALUES (1299, 'admin', '192.168.0.1', '登录后台失败.', 1, 1465863589);
INSERT INTO `xycms_log` VALUES (1298, 'master', '192.168.0.1', '注销退出后台管理.', 1, 1465863552);
INSERT INTO `xycms_log` VALUES (1297, 'master', '192.168.0.1', '登录后台成功.', 1, 1465863375);
INSERT INTO `xycms_log` VALUES (1296, 'master', '192.168.0.1', '登陆失败超过五次，90秒后才能重新登陆！', 1, 1465863238);
INSERT INTO `xycms_log` VALUES (1295, 'master', '192.168.0.1', '登录后台失败.', 1, 1465863229);
INSERT INTO `xycms_log` VALUES (1294, 'master', '192.168.0.1', '登录后台失败.', 1, 1465863214);
INSERT INTO `xycms_log` VALUES (1293, 'master', '192.168.0.1', '登录后台失败.', 1, 1465863198);
INSERT INTO `xycms_log` VALUES (1292, 'master', '192.168.0.1', '登录后台失败.', 1, 1465863188);
INSERT INTO `xycms_log` VALUES (1291, 'master', '192.168.0.1', '更新站点参数设置成功', 1, 1465809285);
INSERT INTO `xycms_log` VALUES (1290, 'master', '192.168.0.1', '更新站点参数设置成功', 1, 1465809279);
INSERT INTO `xycms_log` VALUES (1289, 'master', '192.168.0.1', '删除新闻分类成功[cid=Array]', 1, 1465808835);
INSERT INTO `xycms_log` VALUES (1288, 'master', '192.168.0.1', '添加资讯分类成功[ceshi2]', 1, 1465808822);
INSERT INTO `xycms_log` VALUES (1287, 'master', '192.168.0.1', '添加资讯分类成功[ceshi]', 1, 1465808804);
INSERT INTO `xycms_log` VALUES (1286, 'master', '192.168.0.1', '删除产品分类成功[cid=Array]', 1, 1465803127);
INSERT INTO `xycms_log` VALUES (1285, 'master', '192.168.0.1', '删除产品分类成功[cid=Array]', 1, 1465802791);
INSERT INTO `xycms_log` VALUES (1284, 'master', '192.168.0.1', '更新站点参数设置成功', 1, 1465796478);
INSERT INTO `xycms_log` VALUES (1283, 'master', '192.168.0.1', '更新站点参数设置成功', 1, 1465789070);
INSERT INTO `xycms_log` VALUES (1282, 'master', '192.168.0.1', '更新站点参数设置成功', 1, 1465789050);
INSERT INTO `xycms_log` VALUES (1281, 'master', '192.168.0.1', '更新站点参数设置成功', 1, 1465787170);
INSERT INTO `xycms_log` VALUES (1280, 'master', '192.168.0.1', '更新站点参数设置成功', 1, 1465786971);
INSERT INTO `xycms_log` VALUES (1277, 'master', '192.168.0.1', '备份数据库成功', 1, 1465722670);
INSERT INTO `xycms_log` VALUES (1278, 'master', '192.168.0.1', '登录后台成功.', 1, 1465776760);
INSERT INTO `xycms_log` VALUES (1279, 'master', '192.168.0.1', '更新站点参数设置成功', 1, 1465786932);
INSERT INTO `xycms_log` VALUES (1324, 'master', '192.168.0.1', '登陆失败超过五次，90秒后才能重新登陆！', 1, 1465987764);
INSERT INTO `xycms_log` VALUES (1323, 'master', '192.168.0.1', '登录后台失败.', 1, 1465987754);
INSERT INTO `xycms_log` VALUES (1322, 'master', '192.168.0.1', '登录后台失败.', 1, 1465987745);
INSERT INTO `xycms_log` VALUES (1321, 'master', '192.168.0.1', '登录后台失败.', 1, 1465987736);
INSERT INTO `xycms_log` VALUES (1320, 'master', '192.168.0.1', '登录后台失败.', 1, 1465987727);
INSERT INTO `xycms_log` VALUES (1319, 'master', '192.168.0.1', '注销退出后台管理.', 1, 1465987717);
INSERT INTO `xycms_log` VALUES (1318, 'master', '192.168.0.1', '删除单页分类成功[id=Array]', 1, 1465977915);
INSERT INTO `xycms_log` VALUES (1317, 'master', '192.168.0.1', '删除概况分类成功[id=Array]', 1, 1465977902);
INSERT INTO `xycms_log` VALUES (1316, 'master', '192.168.0.1', '删除概况分类成功[id=Array]', 1, 1465977026);
INSERT INTO `xycms_log` VALUES (1315, 'master', '192.168.0.1', '添加单页成功[案例分类03]', 1, 1465976992);
INSERT INTO `xycms_log` VALUES (1314, 'master', '192.168.0.1', '添加单页成功[案例分类02]', 1, 1465976963);
INSERT INTO `xycms_log` VALUES (1313, 'master', '192.168.0.1', '添加单页成功[案例分类01]', 1, 1465976909);
INSERT INTO `xycms_log` VALUES (1312, 'master', '192.168.0.1', '添加单页分类成功[案例展示]', 1, 1465976878);
INSERT INTO `xycms_log` VALUES (1311, 'master', '192.168.0.1', '登录后台成功.', 1, 1465953347);
INSERT INTO `xycms_log` VALUES (1310, 'master', '192.168.0.1', '删除单页成功[id=Array]', 1, 1465883123);
INSERT INTO `xycms_log` VALUES (1309, 'master', '192.168.0.1', '删除单页成功[id=Array]', 1, 1465883104);
INSERT INTO `xycms_log` VALUES (1308, 'master', '192.168.0.1', '备份数据库成功', 1, 1465863772);
INSERT INTO `xycms_log` VALUES (1307, 'master', '192.168.0.1', '登录后台成功.', 1, 1465863749);
INSERT INTO `xycms_log` VALUES (1306, 'admin', '192.168.0.1', '注销退出后台管理.', 1, 1465863726);
INSERT INTO `xycms_log` VALUES (1303, 'master', '192.168.0.1', '登录后台成功.', 1, 1465863686);
INSERT INTO `xycms_log` VALUES (1304, 'master', '192.168.0.1', '注销退出后台管理.', 1, 1465863711);
INSERT INTO `xycms_log` VALUES (1305, 'admin', '192.168.0.1', '登录后台成功.', 1, 1465863723);
INSERT INTO `xycms_log` VALUES (1336, 'master', '192.168.0.1', '备份数据库成功', 1, 1466061207);
INSERT INTO `xycms_log` VALUES (1335, 'master', '192.168.0.1', '编辑产品成功[id=127]', 1, 1466057596);
INSERT INTO `xycms_log` VALUES (1334, 'master', '192.168.0.1', '编辑产品成功[id=127]', 1, 1466057390);
INSERT INTO `xycms_log` VALUES (1333, 'master', '192.168.0.1', '备份数据库成功', 1, 1466056888);
INSERT INTO `xycms_log` VALUES (1332, 'master', '192.168.0.1', '备份数据库成功', 1, 1466055697);
INSERT INTO `xycms_log` VALUES (1331, 'master', '192.168.0.1', '备份数据库成功', 1, 1466055672);
INSERT INTO `xycms_log` VALUES (1330, 'master', '192.168.0.1', '备份数据库成功', 1, 1466055545);
INSERT INTO `xycms_log` VALUES (1329, 'master', '192.168.0.1', '备份数据库成功', 1, 1466049686);
INSERT INTO `xycms_log` VALUES (1328, 'master', '192.168.0.1', '备份数据库成功', 1, 1466048642);
INSERT INTO `xycms_log` VALUES (1325, 'master', '192.168.0.1', '登录后台成功.', 1, 1465989111);
INSERT INTO `xycms_log` VALUES (1326, 'master', '192.168.0.1', '登录后台成功.', 1, 1466035891);
INSERT INTO `xycms_log` VALUES (1327, 'master', '192.168.0.1', '备份数据库成功', 1, 1466046096);
INSERT INTO `xycms_log` VALUES (1337, 'master', '192.168.0.1', '编辑产品成功[id=127]', 1, 1466069447);
INSERT INTO `xycms_log` VALUES (1338, 'master', '192.168.0.1', '编辑产品成功[id=127]', 1, 1466070266);
INSERT INTO `xycms_log` VALUES (1339, 'master', '192.168.0.1', '编辑产品成功[id=127]', 1, 1466071848);
INSERT INTO `xycms_log` VALUES (1340, 'master', '192.168.0.1', '登录后台成功.', 1, 1466124696);
INSERT INTO `xycms_log` VALUES (1341, 'master', '192.168.0.1', '更新站点设置成功', 1, 1466128649);
INSERT INTO `xycms_log` VALUES (1342, 'master', '192.168.0.1', '更新站点设置成功', 1, 1466128752);
INSERT INTO `xycms_log` VALUES (1343, 'master', '192.168.0.1', '更新站点设置成功', 1, 1466130120);
INSERT INTO `xycms_log` VALUES (1344, 'master', '192.168.0.1', '更新站点设置成功', 1, 1466130279);
INSERT INTO `xycms_log` VALUES (1345, 'master', '192.168.0.1', '更新站点SEO成功', 1, 1466134587);
INSERT INTO `xycms_log` VALUES (1346, 'master', '192.168.0.1', '更新站点SEO成功', 1, 1466135494);
INSERT INTO `xycms_log` VALUES (1347, 'master', '192.168.0.1', '更新站点SEO成功', 1, 1466135865);
INSERT INTO `xycms_log` VALUES (1348, 'master', '192.168.0.1', '更新站点SEO成功', 1, 1466142268);
INSERT INTO `xycms_log` VALUES (1349, 'master', '192.168.0.1', '更新站点SEO成功', 1, 1466143242);
INSERT INTO `xycms_log` VALUES (1350, 'master', '192.168.0.1', '更新站点SEO成功', 1, 1466144805);
INSERT INTO `xycms_log` VALUES (1351, 'master', '192.168.0.1', '更新站点SEO成功', 1, 1466144821);
INSERT INTO `xycms_log` VALUES (1352, 'master', '192.168.0.1', '删除案例分类成功[cid=Array]', 1, 1466149532);
INSERT INTO `xycms_log` VALUES (1353, 'master', '192.168.0.1', '添加资讯分类成功[三级分类]', 1, 1466149873);
INSERT INTO `xycms_log` VALUES (1354, 'master', '192.168.0.1', '删除案例分类成功[cid=Array]', 1, 1466149887);
INSERT INTO `xycms_log` VALUES (1355, 'master', '192.168.0.1', '添加资讯分类成功[二级分类]', 1, 1466150032);
INSERT INTO `xycms_log` VALUES (1356, 'master', '192.168.0.1', '登录后台成功.', 1, 1466468751);
INSERT INTO `xycms_log` VALUES (1357, 'master', '192.168.0.1', '更新关键词库配置成功', 1, 1466471292);
INSERT INTO `xycms_log` VALUES (1358, 'master', '192.168.0.1', '更新关键词库配置成功', 1, 1466471300);
INSERT INTO `xycms_log` VALUES (1359, 'master', '192.168.0.1', '备份数据库成功', 1, 1466471536);
INSERT INTO `xycms_log` VALUES (1360, 'master', '192.168.0.1', '注销退出后台管理.', 1, 1466471705);
INSERT INTO `xycms_log` VALUES (1361, 'master', '192.168.0.1', '登录后台失败.', 1, 1466471724);
INSERT INTO `xycms_log` VALUES (1362, 'master', '192.168.0.1', '登录后台失败.', 1, 1466471733);
INSERT INTO `xycms_log` VALUES (1363, 'master', '192.168.0.1', '登录后台失败.', 1, 1466471745);
INSERT INTO `xycms_log` VALUES (1364, 'master', '192.168.0.1', '登录后台失败.', 1, 1466471754);
INSERT INTO `xycms_log` VALUES (1365, 'master', '192.168.0.1', '登陆失败超过五次，90秒后才能重新登陆！', 1, 1466471774);
INSERT INTO `xycms_log` VALUES (1366, 'master', '192.168.0.1', '登录后台成功.', 1, 1466472009);
INSERT INTO `xycms_log` VALUES (1367, 'master', '192.168.0.1', '登录后台失败.', 1, 1466479983);
INSERT INTO `xycms_log` VALUES (1368, 'master', '192.168.0.1', '登录后台成功.', 1, 1466479990);
INSERT INTO `xycms_log` VALUES (1369, 'master', '192.168.0.1', '编辑产品成功[id=127]', 1, 1466480336);
INSERT INTO `xycms_log` VALUES (1370, 'master', '192.168.0.1', '发布产品成功[关键]', 1, 1466480724);
INSERT INTO `xycms_log` VALUES (1371, 'master', '192.168.0.1', '发布产品成功[阿斯达色粉斯蒂芬333]', 1, 1466480764);
INSERT INTO `xycms_log` VALUES (1372, 'master', '192.168.0.1', '发布关键词成功[阿斯达色粉斯蒂芬333]', 1, 1466480775);
INSERT INTO `xycms_log` VALUES (1373, 'master', '192.168.0.1', '删除关键词成功[id=Array]', 1, 1466480780);
INSERT INTO `xycms_log` VALUES (1374, 'master', '192.168.0.1', '发布关键词成功[阿斯达色粉斯蒂芬333]', 1, 1466480785);
INSERT INTO `xycms_log` VALUES (1375, 'master', '192.168.0.1', '更新关键词库配置成功', 1, 1466480828);
INSERT INTO `xycms_log` VALUES (1376, 'master', '192.168.0.1', '更新关键词库配置成功', 1, 1466480840);
INSERT INTO `xycms_log` VALUES (1377, 'master', '192.168.0.1', '删除产品成功[id=Array]', 1, 1466480891);
INSERT INTO `xycms_log` VALUES (1378, 'master', '192.168.0.1', '删除关键词成功[id=Array]', 1, 1466480918);
INSERT INTO `xycms_log` VALUES (1379, 'master', '192.168.0.1', '注销退出后台管理.', 1, 1466481059);
INSERT INTO `xycms_log` VALUES (1380, 'master', '192.168.0.1', '登录后台失败.', 1, 1466481074);
INSERT INTO `xycms_log` VALUES (1381, 'master', '192.168.0.1', '登录后台失败.', 1, 1466481080);
INSERT INTO `xycms_log` VALUES (1382, 'master', '192.168.0.1', '登录后台失败.', 1, 1466481087);
INSERT INTO `xycms_log` VALUES (1383, 'master', '192.168.0.1', '登录后台失败.', 1, 1466481091);
INSERT INTO `xycms_log` VALUES (1384, 'master', '192.168.0.1', '登陆失败超过五次，90秒后才能重新登陆！', 1, 1466481095);
INSERT INTO `xycms_log` VALUES (1385, 'master', '192.168.0.1', '登录后台成功.', 1, 1466481199);
INSERT INTO `xycms_log` VALUES (1386, 'master', '192.168.0.1', '更新站点参数设置成功', 1, 1466481246);
INSERT INTO `xycms_log` VALUES (1387, 'master', '192.168.0.1', '清除网站缓存成功', 1, 1466481386);
INSERT INTO `xycms_log` VALUES (1388, 'master', '192.168.0.1', '编辑产品成功[id=134]', 1, 1466487716);
INSERT INTO `xycms_log` VALUES (1389, 'master', '192.168.0.1', '编辑产品成功[id=134]', 1, 1466491972);
INSERT INTO `xycms_log` VALUES (1390, 'master', '192.168.0.1', '编辑产品成功[id=134]', 1, 1466492087);
INSERT INTO `xycms_log` VALUES (1391, 'master', '192.168.0.1', '注销退出后台管理.', 1, 1466494801);
INSERT INTO `xycms_log` VALUES (1392, 'admin', '192.168.0.1', '登录后台成功.', 1, 1466494817);
INSERT INTO `xycms_log` VALUES (1393, 'admin', '192.168.0.1', '注销退出后台管理.', 1, 1466494983);
INSERT INTO `xycms_log` VALUES (1394, 'master', '192.168.0.1', '登录后台成功.', 1, 1466494999);
INSERT INTO `xycms_log` VALUES (1395, 'master', '192.168.0.1', '注销退出后台管理.', 1, 1466495075);
INSERT INTO `xycms_log` VALUES (1396, 'admin', '192.168.0.1', '登录后台成功.', 1, 1466495114);
INSERT INTO `xycms_log` VALUES (1397, 'admin', '192.168.0.1', '注销退出后台管理.', 1, 1466495330);
INSERT INTO `xycms_log` VALUES (1398, 'master', '192.168.0.1', '登录后台成功.', 1, 1466495348);
INSERT INTO `xycms_log` VALUES (1399, 'admin', '192.168.0.1', '登录后台成功.', 1, 1466495378);
INSERT INTO `xycms_log` VALUES (1400, 'master', '192.168.0.1', '添加单页分类成功[设备中心]', 1, 1466500160);
INSERT INTO `xycms_log` VALUES (1401, 'master', '192.168.0.1', '编辑单页分类成功[id=10]', 1, 1466500359);
INSERT INTO `xycms_log` VALUES (1402, 'master', '192.168.0.1', '编辑单页分类成功[id=10]', 1, 1466500366);
INSERT INTO `xycms_log` VALUES (1403, 'master', '192.168.0.1', '登录后台成功.', 1, 1466554040);
INSERT INTO `xycms_log` VALUES (1404, 'master', '192.168.0.1', '登录后台成功.', 1, 1466554783);
INSERT INTO `xycms_log` VALUES (1405, 'master', '192.168.0.1', '编辑单页分类成功[id=10]', 1, 1466573903);
INSERT INTO `xycms_log` VALUES (1406, 'master', '192.168.0.1', '编辑单页分类成功[id=10]', 1, 1466573925);
INSERT INTO `xycms_log` VALUES (1407, 'master', '192.168.0.1', '编辑单页分类成功[id=10]', 1, 1466574496);
INSERT INTO `xycms_log` VALUES (1408, 'master', '192.168.0.1', '编辑单页分类成功[id=10]', 1, 1466574509);
INSERT INTO `xycms_log` VALUES (1409, 'master', '192.168.0.1', '登录后台成功.', 1, 1466641411);
INSERT INTO `xycms_log` VALUES (1410, 'master', '192.168.0.1', '更新站点设置成功', 1, 1466643677);
INSERT INTO `xycms_log` VALUES (1411, 'master', '192.168.0.1', '更新站点设置成功', 1, 1466644218);
INSERT INTO `xycms_log` VALUES (1412, 'master', '192.168.0.1', '更新站点设置成功', 1, 1466644231);
INSERT INTO `xycms_log` VALUES (1413, 'master', '192.168.0.1', '更新站点设置成功', 1, 1466644288);
INSERT INTO `xycms_log` VALUES (1414, 'master', '192.168.0.1', '更新站点设置成功', 1, 1466644309);
INSERT INTO `xycms_log` VALUES (1415, 'master', '192.168.0.1', '更新站点SEO成功', 1, 1466651075);
INSERT INTO `xycms_log` VALUES (1416, 'master', '192.168.0.1', '更新站点设置成功', 1, 1466651130);
INSERT INTO `xycms_log` VALUES (1417, 'master', '192.168.0.1', '登录后台成功.', 1, 1466729918);
INSERT INTO `xycms_log` VALUES (1418, 'master', '192.168.0.1', '发布产品成功[产品研发]', 1, 1466732314);
INSERT INTO `xycms_log` VALUES (1419, 'master', '192.168.0.1', '添加资讯分类成功[设备机械]', 1, 1466734551);
INSERT INTO `xycms_log` VALUES (1420, 'master', '192.168.0.1', '编辑资讯分类成功[id=10]', 1, 1466734865);
INSERT INTO `xycms_log` VALUES (1421, 'master', '192.168.0.1', '发布信息成功[测试案例]', 1, 1466738059);
INSERT INTO `xycms_log` VALUES (1422, 'master', '192.168.0.1', '编辑信息成功[id=5]', 1, 1466740440);
INSERT INTO `xycms_log` VALUES (1423, 'master', '192.168.0.1', '编辑信息成功[id=5]', 1, 1466746651);
INSERT INTO `xycms_log` VALUES (1424, 'master', '192.168.0.1', '添加单页成功[厂房设备]', 1, 1466749672);
INSERT INTO `xycms_log` VALUES (1425, 'master', '192.168.0.1', '登录后台成功.', 1, 1466750750);
INSERT INTO `xycms_log` VALUES (1426, 'master', '192.168.0.1', '发布产品成功[欠我钱]', 1, 1466750760);
INSERT INTO `xycms_log` VALUES (1427, 'master', '192.168.0.1', '发布产品成功[欠我钱]', 1, 1466750763);
INSERT INTO `xycms_log` VALUES (1428, 'master', '192.168.0.1', '发布产品成功[欠我钱]', 1, 1466750766);
INSERT INTO `xycms_log` VALUES (1429, 'master', '192.168.0.1', '发布产品成功[欠我钱]', 1, 1466750769);
INSERT INTO `xycms_log` VALUES (1430, 'master', '192.168.0.1', '发布产品成功[欠我钱]', 1, 1466750772);
INSERT INTO `xycms_log` VALUES (1431, 'master', '192.168.0.1', '发布产品成功[欠我钱]', 1, 1466750774);
INSERT INTO `xycms_log` VALUES (1432, 'master', '192.168.0.1', '发布产品成功[欠我钱]', 1, 1466750777);
INSERT INTO `xycms_log` VALUES (1433, 'master', '192.168.0.1', '发布产品成功[欠我钱]', 1, 1466750780);
INSERT INTO `xycms_log` VALUES (1434, 'master', '192.168.0.1', '发布产品成功[欠我钱]', 1, 1466750782);
INSERT INTO `xycms_log` VALUES (1435, 'master', '192.168.0.1', '发布产品成功[欠我钱]', 1, 1466750785);
INSERT INTO `xycms_log` VALUES (1436, 'master', '192.168.0.1', '发布产品成功[欠我钱]', 1, 1466750788);
INSERT INTO `xycms_log` VALUES (1437, 'master', '192.168.0.1', '发布产品成功[欠我钱]', 1, 1466750790);
INSERT INTO `xycms_log` VALUES (1438, 'master', '192.168.0.1', '发布产品成功[欠我钱]', 1, 1466750794);
INSERT INTO `xycms_log` VALUES (1439, 'master', '192.168.0.1', '编辑单页成功[id=31]', 1, 1466751965);
INSERT INTO `xycms_log` VALUES (1440, 'master', '192.168.0.1', '删除产品成功[id=Array]', 1, 1466752061);
INSERT INTO `xycms_log` VALUES (1441, 'master', '192.168.0.1', '添加资讯分类成功[SEO快报]', 1, 1466754247);
INSERT INTO `xycms_log` VALUES (1442, 'master', '192.168.0.1', '编辑资讯分类成功[id=5]', 1, 1466754532);
INSERT INTO `xycms_log` VALUES (1443, 'master', '192.168.0.1', '发布信息成功[公司新闻01]', 1, 1466755538);
INSERT INTO `xycms_log` VALUES (1444, 'master', '192.168.0.1', '编辑信息成功[id=202]', 1, 1466755972);
INSERT INTO `xycms_log` VALUES (1445, 'master', '192.168.0.1', '登录后台成功.', 1, 1466816044);
INSERT INTO `xycms_log` VALUES (1446, 'master', '192.168.0.1', '登录后台成功.', 1, 1466985970);
INSERT INTO `xycms_log` VALUES (1447, 'master', '192.168.0.1', '添加下载分类成功[下载分类2]', 1, 1466991047);
INSERT INTO `xycms_log` VALUES (1448, 'master', '192.168.0.1', '编辑下载分类成功[id=3]', 1, 1466991316);
INSERT INTO `xycms_log` VALUES (1449, 'master', '192.168.0.1', '编辑下载分类成功[id=3]', 1, 1466991904);
INSERT INTO `xycms_log` VALUES (1450, 'master', '192.168.0.1', '发布下载成功[seo手册]', 1, 1466992486);
INSERT INTO `xycms_log` VALUES (1451, 'master', '192.168.0.1', '编辑下载成功[id=2]', 1, 1466992822);
INSERT INTO `xycms_log` VALUES (1452, 'master', '192.168.0.1', '添加招聘分类成功[校园招聘]', 1, 1466993808);
INSERT INTO `xycms_log` VALUES (1453, 'master', '192.168.0.1', '编辑招聘分类成功[id=4]', 1, 1466993944);
INSERT INTO `xycms_log` VALUES (1454, 'master', '192.168.0.1', '编辑招聘信息成功[id=2]', 1, 1466994997);
INSERT INTO `xycms_log` VALUES (1455, 'master', '192.168.0.1', '更新站点设置成功', 1, 1466996044);
INSERT INTO `xycms_log` VALUES (1456, 'master', '192.168.0.1', '更新站点设置成功', 1, 1466996070);
INSERT INTO `xycms_log` VALUES (1457, 'master', '192.168.0.1', '编辑产品分类成功[产品分类]', 1, 1467007140);
INSERT INTO `xycms_log` VALUES (1458, 'master', '192.168.0.1', '编辑产品分类成功[产品分类]', 1, 1467007162);
INSERT INTO `xycms_log` VALUES (1459, 'master', '192.168.0.1', '编辑产品成功[id=135]', 1, 1467007746);
INSERT INTO `xycms_log` VALUES (1460, 'master', '192.168.0.1', '编辑产品成功[id=135]', 1, 1467009281);
INSERT INTO `xycms_log` VALUES (1461, 'master', '192.168.0.1', '编辑产品成功[id=135]', 1, 1467009411);
INSERT INTO `xycms_log` VALUES (1462, 'master', '192.168.0.1', '编辑产品成功[id=135]', 1, 1467009452);
INSERT INTO `xycms_log` VALUES (1463, 'master', '192.168.0.1', '编辑产品成功[id=127]', 1, 1467009974);
INSERT INTO `xycms_log` VALUES (1464, 'master', '192.168.0.1', '编辑产品成功[id=135]', 1, 1467011089);
INSERT INTO `xycms_log` VALUES (1465, 'master', '192.168.0.1', '编辑产品成功[id=135]', 1, 1467011112);
INSERT INTO `xycms_log` VALUES (1466, 'master', '192.168.0.1', '编辑信息成功[id=202]', 1, 1467015224);
INSERT INTO `xycms_log` VALUES (1467, 'master', '192.168.0.1', '登录后台成功.', 1, 1467072125);
INSERT INTO `xycms_log` VALUES (1468, 'master', '192.168.0.1', '编辑信息成功[id=5]', 1, 1467075093);
INSERT INTO `xycms_log` VALUES (1469, 'master', '192.168.0.1', '编辑信息成功[id=5]', 1, 1467075743);
INSERT INTO `xycms_log` VALUES (1470, 'master', '192.168.0.1', '登录后台成功.', 1, 1467085116);
INSERT INTO `xycms_log` VALUES (1471, 'master', '192.168.0.1', '清除网站缓存成功', 1, 1467100727);
INSERT INTO `xycms_log` VALUES (1472, 'master', '192.168.0.1', '设置站点缓存优化成功', 1, 1467100729);
INSERT INTO `xycms_log` VALUES (1473, 'master', '192.168.0.1', '更新站点参数设置成功', 1, 1467100851);
INSERT INTO `xycms_log` VALUES (1474, 'master', '192.168.0.1', '更新站点参数设置成功', 1, 1467100859);
INSERT INTO `xycms_log` VALUES (1475, 'master', '192.168.0.1', '更新站点参数设置成功', 1, 1467100860);
INSERT INTO `xycms_log` VALUES (1476, 'master', '192.168.0.1', '登录后台成功.', 1, 1467162065);
INSERT INTO `xycms_log` VALUES (1477, 'master', '192.168.0.1', '登录后台成功.', 1, 1467244960);
INSERT INTO `xycms_log` VALUES (1478, 'master', '192.168.0.1', '注销退出后台管理.', 1, 1467255885);
INSERT INTO `xycms_log` VALUES (1479, 'master', '192.168.0.1', '更新站点参数设置成功', 1, 1467280308);
INSERT INTO `xycms_log` VALUES (1480, 'master', '192.168.0.1', '登录后台成功.', 1, 1467337495);
INSERT INTO `xycms_log` VALUES (1481, 'master', '192.168.0.1', '注销退出后台管理.', 1, 1467339124);
INSERT INTO `xycms_log` VALUES (1482, 'admin', '192.168.0.1', '登录后台成功.', 1, 1467339132);
INSERT INTO `xycms_log` VALUES (1483, 'admin', '192.168.0.1', '注销退出后台管理.', 1, 1467339449);
INSERT INTO `xycms_log` VALUES (1484, 'master', '192.168.0.1', '登录后台失败.', 1, 1467339455);
INSERT INTO `xycms_log` VALUES (1485, 'master', '192.168.0.1', '登录后台成功.', 1, 1467339465);
INSERT INTO `xycms_log` VALUES (1486, 'master', '192.168.0.1', '添加产品分类成功[关键词3]', 1, 1467339565);
INSERT INTO `xycms_log` VALUES (1487, 'master', '192.168.0.1', '编辑产品成功[id=135]', 1, 1467339596);
INSERT INTO `xycms_log` VALUES (1488, 'master', '192.168.0.1', '编辑产品成功[id=135]', 1, 1467339619);
INSERT INTO `xycms_log` VALUES (1489, 'master', '192.168.0.1', '编辑产品成功[id=135]', 1, 1467339773);
INSERT INTO `xycms_log` VALUES (1490, 'master', '192.168.0.1', '登录后台成功.', 1, 1467342275);
INSERT INTO `xycms_log` VALUES (1491, 'master', '192.168.0.1', '登录后台成功.', 1, 1467445400);
INSERT INTO `xycms_log` VALUES (1492, 'master', '192.168.0.1', '登录后台失败.', 1, 1467446701);
INSERT INTO `xycms_log` VALUES (1493, 'master', '192.168.0.1', '登录后台成功.', 1, 1467446723);
INSERT INTO `xycms_log` VALUES (1494, 'master', '192.168.0.1', '登录后台成功.', 1, 1467590543);
INSERT INTO `xycms_log` VALUES (1495, 'master', '192.168.0.1', '登录后台成功.', 1, 1467597734);
INSERT INTO `xycms_log` VALUES (1496, 'master', '192.168.0.1', '更新关键词库配置成功', 1, 1467600167);
INSERT INTO `xycms_log` VALUES (1497, 'master', '192.168.0.1', '更新关键词库配置成功', 1, 1467600171);
INSERT INTO `xycms_log` VALUES (1498, 'master', '192.168.0.1', '更新关键词库配置成功', 1, 1467602040);
INSERT INTO `xycms_log` VALUES (1499, 'master', '192.168.0.1', '更新关键词库配置成功', 1, 1467602385);
INSERT INTO `xycms_log` VALUES (1500, 'master', '192.168.0.1', '更新关键词库配置成功', 1, 1467602449);
INSERT INTO `xycms_log` VALUES (1501, 'master', '192.168.0.1', '更新关键词库配置成功', 1, 1467602459);
INSERT INTO `xycms_log` VALUES (1502, 'master', '192.168.0.1', '编辑产品成功[id=127]', 1, 1467612988);
INSERT INTO `xycms_log` VALUES (1503, 'master', '192.168.0.1', '更新关键词库配置成功', 1, 1467613335);
INSERT INTO `xycms_log` VALUES (1504, 'master', '192.168.0.1', '更新关键词库配置成功', 1, 1467613350);
INSERT INTO `xycms_log` VALUES (1505, 'master', '192.168.0.1', '编辑产品成功[id=127]', 1, 1467614635);
INSERT INTO `xycms_log` VALUES (1506, 'master', '192.168.0.1', '编辑产品成功[id=127]', 1, 1467615138);
INSERT INTO `xycms_log` VALUES (1507, 'master', '192.168.0.1', '编辑产品成功[id=127]', 1, 1467615150);
INSERT INTO `xycms_log` VALUES (1508, 'master', '192.168.0.1', '编辑产品成功[id=127]', 1, 1467615163);
INSERT INTO `xycms_log` VALUES (1509, 'master', '192.168.0.1', '添加产品分类成功[一级测试分类]', 1, 1467619259);
INSERT INTO `xycms_log` VALUES (1510, 'master', '192.168.0.1', '编辑产品分类成功[一级测试分类]', 1, 1467619285);
INSERT INTO `xycms_log` VALUES (1511, 'master', '192.168.0.1', '编辑产品分类成功[一级测试分类]', 1, 1467619297);
INSERT INTO `xycms_log` VALUES (1512, 'master', '192.168.0.1', '登录后台成功.', 1, 1467677657);
INSERT INTO `xycms_log` VALUES (1513, 'master', '192.168.0.1', '编辑产品分类成功[产品分类]', 1, 1467682444);
INSERT INTO `xycms_log` VALUES (1514, 'master', '192.168.0.1', '编辑产品分类成功[产品分类]', 1, 1467690036);
INSERT INTO `xycms_log` VALUES (1515, 'master', '192.168.0.1', '编辑产品分类成功[上海产品分类]', 1, 1467690216);
INSERT INTO `xycms_log` VALUES (1516, 'master', '192.168.0.1', '编辑产品分类成功[产品分类]', 1, 1467690877);
INSERT INTO `xycms_log` VALUES (1517, 'master', '192.168.0.1', '编辑产品分类成功[产品分类]', 1, 1467691177);
INSERT INTO `xycms_log` VALUES (1518, 'master', '192.168.0.1', '编辑产品分类成功[产品分类]', 1, 1467691269);
INSERT INTO `xycms_log` VALUES (1519, 'master', '192.168.0.1', '编辑产品分类成功[产品分类]', 1, 1467691288);
INSERT INTO `xycms_log` VALUES (1520, 'master', '192.168.0.1', '编辑产品分类成功[产品分类]', 1, 1467691303);
INSERT INTO `xycms_log` VALUES (1521, 'master', '192.168.0.1', '编辑产品分类成功[产品分类]', 1, 1467701806);
INSERT INTO `xycms_log` VALUES (1522, 'master', '192.168.0.1', '编辑产品分类成功[产品分类]', 1, 1467701822);
INSERT INTO `xycms_log` VALUES (1523, 'master', '192.168.0.1', '编辑产品分类成功[产品分类]', 1, 1467701886);
INSERT INTO `xycms_log` VALUES (1524, 'master', '192.168.0.1', '编辑产品分类成功[产品分类]', 1, 1467707707);
INSERT INTO `xycms_log` VALUES (1525, 'master', '192.168.0.1', '编辑产品分类成功[产品分类]', 1, 1467707726);
INSERT INTO `xycms_log` VALUES (1526, 'master', '192.168.0.1', '编辑产品分类成功[产品分类]', 1, 1467707809);
INSERT INTO `xycms_log` VALUES (1527, 'master', '192.168.0.1', '编辑产品分类成功[产品分类]', 1, 1467707820);
INSERT INTO `xycms_log` VALUES (1528, 'master', '192.168.0.1', '编辑产品分类成功[产品分类]', 1, 1467707999);
INSERT INTO `xycms_log` VALUES (1529, 'master', '192.168.0.1', '编辑产品分类成功[产品分类]', 1, 1467708010);
INSERT INTO `xycms_log` VALUES (1530, 'master', '192.168.0.1', '编辑产品分类成功[产品分类]', 1, 1467708039);
INSERT INTO `xycms_log` VALUES (1531, 'master', '192.168.0.1', '登录后台成功.', 1, 1467768873);
INSERT INTO `xycms_log` VALUES (1532, 'master', '192.168.0.1', '编辑单页成功[id=27]', 1, 1467769853);
INSERT INTO `xycms_log` VALUES (1533, 'master', '192.168.0.1', '编辑单页成功[id=27]', 1, 1467769881);
INSERT INTO `xycms_log` VALUES (1534, 'master', '192.168.0.1', '编辑单页成功[id=27]', 1, 1467769911);
INSERT INTO `xycms_log` VALUES (1535, 'master', '192.168.0.1', '编辑单页成功[id=27]', 1, 1467769955);
INSERT INTO `xycms_log` VALUES (1536, 'master', '192.168.0.1', '编辑单页成功[id=1]', 1, 1467776224);
INSERT INTO `xycms_log` VALUES (1537, 'master', '192.168.0.1', '编辑单页成功[id=1]', 1, 1467776553);
INSERT INTO `xycms_log` VALUES (1538, 'master', '192.168.0.1', '编辑单页成功[id=1]', 1, 1467776652);
INSERT INTO `xycms_log` VALUES (1539, 'master', '192.168.0.1', '编辑单页成功[id=1]', 1, 1467776913);
INSERT INTO `xycms_log` VALUES (1540, 'master', '192.168.0.1', '编辑单页成功[id=27]', 1, 1467785452);
INSERT INTO `xycms_log` VALUES (1541, 'master', '192.168.0.1', '编辑产品分类成功[产品分类]', 1, 1467785482);
INSERT INTO `xycms_log` VALUES (1542, 'master', '192.168.0.1', '删除产品分类分类成功[id=15]', 1, 1467786386);
INSERT INTO `xycms_log` VALUES (1543, 'master', '192.168.0.1', '编辑产品分类成功[产品分类]', 1, 1467786991);
INSERT INTO `xycms_log` VALUES (1544, 'master', '192.168.0.1', '编辑产品分类成功[二级分类]', 1, 1467787009);
INSERT INTO `xycms_log` VALUES (1545, 'master', '192.168.0.1', '编辑产品分类成功[三级分类]', 1, 1467787033);
INSERT INTO `xycms_log` VALUES (1546, 'master', '192.168.0.1', '编辑产品分类成功[三级分类]', 1, 1467787437);
INSERT INTO `xycms_log` VALUES (1547, 'master', '192.168.0.1', '编辑产品分类成功[二级分类]', 1, 1467787477);
INSERT INTO `xycms_log` VALUES (1548, 'master', '192.168.0.1', '编辑产品分类成功[二级分类]', 1, 1467787503);
INSERT INTO `xycms_log` VALUES (1549, 'master', '192.168.0.1', '编辑资讯分类成功[id=1]', 1, 1467787529);
INSERT INTO `xycms_log` VALUES (1550, 'master', '192.168.0.1', '编辑资讯分类成功[id=1]', 1, 1467788070);
INSERT INTO `xycms_log` VALUES (1551, 'master', '192.168.0.1', '编辑资讯分类成功[id=9]', 1, 1467788096);
INSERT INTO `xycms_log` VALUES (1552, 'master', '192.168.0.1', '编辑资讯分类成功[id=9]', 1, 1467788361);
INSERT INTO `xycms_log` VALUES (1553, 'master', '192.168.0.1', '添加资讯分类成功[打发手动阀]', 1, 1467790720);
INSERT INTO `xycms_log` VALUES (1554, 'master', '192.168.0.1', '删除产品分类分类成功[id=6]', 1, 1467790746);
INSERT INTO `xycms_log` VALUES (1555, 'master', '192.168.0.1', '添加产品分类成功[zxczxc]', 1, 1467790893);
INSERT INTO `xycms_log` VALUES (1556, 'master', '192.168.0.1', '删除产品分类分类成功[id=17]', 1, 1467790904);
INSERT INTO `xycms_log` VALUES (1557, 'master', '192.168.0.1', '添加资讯分类成功[ddfsdf]', 1, 1467790920);
INSERT INTO `xycms_log` VALUES (1558, 'master', '192.168.0.1', '删除产品分类分类成功[id=11]', 1, 1467790926);
INSERT INTO `xycms_log` VALUES (1559, 'master', '192.168.0.1', '添加下载分类成功[dasdfsdf]', 1, 1467790939);
INSERT INTO `xycms_log` VALUES (1560, 'master', '192.168.0.1', '删除下载分类成功[id=Array]', 1, 1467790943);
INSERT INTO `xycms_log` VALUES (1561, 'master', '192.168.0.1', '添加招聘分类成功[rtert]', 1, 1467790967);
INSERT INTO `xycms_log` VALUES (1562, 'master', '192.168.0.1', '删除招聘分类成功[id=Array]', 1, 1467790975);
INSERT INTO `xycms_log` VALUES (1563, 'master', '192.168.0.1', '编辑资讯分类成功[id=5]', 1, 1467791099);
INSERT INTO `xycms_log` VALUES (1564, 'master', '192.168.0.1', '更新关键词库配置成功', 1, 1467791247);
INSERT INTO `xycms_log` VALUES (1565, 'master', '192.168.0.1', '更新关键词库配置成功', 1, 1467791255);
INSERT INTO `xycms_log` VALUES (1566, 'master', '192.168.0.1', '编辑资讯分类成功[id=5]', 1, 1467795248);
INSERT INTO `xycms_log` VALUES (1567, 'master', '192.168.0.1', '编辑资讯分类成功[id=5]', 1, 1467795839);
INSERT INTO `xycms_log` VALUES (1568, 'master', '192.168.0.1', '编辑资讯分类成功[id=5]', 1, 1467796018);
INSERT INTO `xycms_log` VALUES (1569, 'master', '192.168.0.1', '更新站点参数设置成功', 1, 1467797414);
INSERT INTO `xycms_log` VALUES (1570, 'master', '192.168.0.1', '登录后台成功.', 1, 1467850553);
INSERT INTO `xycms_log` VALUES (1571, 'master', '192.168.0.1', '发布关键词成功[网站优化]', 1, 1467862693);
INSERT INTO `xycms_log` VALUES (1572, 'master', '192.168.0.1', '删除关键词成功[id=Array]', 1, 1467862698);
INSERT INTO `xycms_log` VALUES (1573, 'master', '192.168.0.1', '删除关键词成功[id=Array]', 1, 1467862706);
INSERT INTO `xycms_log` VALUES (1574, 'master', '192.168.0.1', '修改关键词成功[网站优化]', 1, 1467870169);
INSERT INTO `xycms_log` VALUES (1575, 'master', '192.168.0.1', '修改关键词成功[网站优化]', 1, 1467870187);
INSERT INTO `xycms_log` VALUES (1576, 'master', '192.168.0.1', '发布关键词成功[SEO优化排名]', 1, 1467870435);
INSERT INTO `xycms_log` VALUES (1577, 'master', '192.168.0.1', '发布关键词成功[google竞价]', 1, 1467871189);
INSERT INTO `xycms_log` VALUES (1578, 'master', '192.168.0.1', '发布关键词成功[百度竞价]', 1, 1467871219);
INSERT INTO `xycms_log` VALUES (1579, 'master', '192.168.0.1', '发布关键词成功[祥云平台]', 1, 1467880572);
INSERT INTO `xycms_log` VALUES (1580, 'master', '192.168.0.1', '更新站点参数设置成功', 1, 1467882089);
INSERT INTO `xycms_log` VALUES (1581, 'master', '192.168.0.1', '更新站点参数设置成功', 1, 1467882195);
INSERT INTO `xycms_log` VALUES (1582, 'master', '192.168.0.1', '登录后台成功.', 1, 1467889563);
INSERT INTO `xycms_log` VALUES (1583, 'master', '192.168.0.1', '登录后台成功.', 1, 1467936635);
INSERT INTO `xycms_log` VALUES (1584, 'master', '192.168.0.1', '编辑产品成功[id=127]', 1, 1467938777);
INSERT INTO `xycms_log` VALUES (1585, 'master', '192.168.0.1', '更新关键词库配置成功', 1, 1467961697);
INSERT INTO `xycms_log` VALUES (1586, 'master', '192.168.0.1', '更新关键词库配置成功', 1, 1467961718);
INSERT INTO `xycms_log` VALUES (1587, 'master', '192.168.0.1', '发布下载成功[资料整理]', 1, 1467964783);
INSERT INTO `xycms_log` VALUES (1588, 'master', '192.168.0.1', '编辑下载成功[id=3]', 1, 1467971049);
INSERT INTO `xycms_log` VALUES (1589, 'master', '192.168.0.1', '删除下载成功[id=Array]', 1, 1467971061);
INSERT INTO `xycms_log` VALUES (1590, 'master', '192.168.0.1', '发布下载成功[sdfsdf]', 1, 1467971275);
INSERT INTO `xycms_log` VALUES (1591, 'master', '192.168.0.1', '编辑下载成功[id=4]', 1, 1467971292);
INSERT INTO `xycms_log` VALUES (1592, 'master', '192.168.0.1', '删除下载成功[id=Array]', 1, 1467971297);
INSERT INTO `xycms_log` VALUES (1593, 'master', '192.168.0.1', '登录后台成功.', 1, 1468028186);
INSERT INTO `xycms_log` VALUES (1594, 'master', '192.168.0.1', '更新站点设置成功', 1, 1468048913);
INSERT INTO `xycms_log` VALUES (1595, 'master', '192.168.0.1', '更新站点设置成功', 1, 1468048992);
INSERT INTO `xycms_log` VALUES (1596, 'master', '192.168.0.1', '登录后台成功.', 1, 1468200006);
INSERT INTO `xycms_log` VALUES (1597, 'master', '192.168.0.1', '登录后台成功.', 1, 1468202610);
INSERT INTO `xycms_log` VALUES (1598, 'master', '192.168.0.1', '编辑资讯分类成功[id=3]', 1, 1468202764);
INSERT INTO `xycms_log` VALUES (1599, 'master', '192.168.0.1', '编辑信息成功[id=201]', 1, 1468202845);
INSERT INTO `xycms_log` VALUES (1600, 'master', '192.168.0.1', '编辑信息成功[id=202]', 1, 1468202850);
INSERT INTO `xycms_log` VALUES (1601, 'master', '192.168.0.1', '清除网站缓存成功', 1, 1468203058);
INSERT INTO `xycms_log` VALUES (1602, 'master', '192.168.0.1', '编辑产品成功[id=135]', 1, 1468203066);
INSERT INTO `xycms_log` VALUES (1603, 'master', '192.168.0.1', '编辑产品成功[id=135]', 1, 1468203077);
INSERT INTO `xycms_log` VALUES (1604, 'master', '192.168.0.1', '编辑单页分类成功[id=9]', 1, 1468203214);
INSERT INTO `xycms_log` VALUES (1605, 'master', '192.168.0.1', '编辑资讯分类成功[id=5]', 1, 1468203238);
INSERT INTO `xycms_log` VALUES (1606, 'master', '192.168.0.1', '编辑资讯分类成功[id=5]', 1, 1468203244);
INSERT INTO `xycms_log` VALUES (1607, 'master', '192.168.0.1', '编辑资讯分类成功[id=5]', 1, 1468203295);
INSERT INTO `xycms_log` VALUES (1608, 'master', '192.168.0.1', '编辑资讯分类成功[id=5]', 1, 1468203307);
INSERT INTO `xycms_log` VALUES (1609, 'master', '192.168.0.1', '登录后台成功.', 1, 1468203601);
INSERT INTO `xycms_log` VALUES (1610, 'master', '192.168.0.1', '编辑资讯分类成功[id=3]', 1, 1468203763);
INSERT INTO `xycms_log` VALUES (1611, 'master', '192.168.0.1', '编辑资讯分类成功[id=3]', 1, 1468203809);
INSERT INTO `xycms_log` VALUES (1612, 'master', '192.168.0.1', '更新站点SEO成功', 1, 1468204125);
INSERT INTO `xycms_log` VALUES (1613, 'master', '192.168.0.1', '更新站点SEO成功', 1, 1468204167);
INSERT INTO `xycms_log` VALUES (1614, 'master', '192.168.0.1', '更新站点SEO成功', 1, 1468204202);
INSERT INTO `xycms_log` VALUES (1615, 'master', '192.168.0.1', '更新站点设置成功', 1, 1468204323);
INSERT INTO `xycms_log` VALUES (1616, 'master', '192.168.0.1', '编辑下载成功[id=2]', 1, 1468204380);
INSERT INTO `xycms_log` VALUES (1617, 'master', '192.168.0.1', '编辑招聘信息成功[id=2]', 1, 1468204394);
INSERT INTO `xycms_log` VALUES (1618, 'master', '192.168.0.1', '修改关键词成功[网站优化]', 1, 1468205144);
INSERT INTO `xycms_log` VALUES (1619, 'master', '192.168.0.1', '添加资讯分类成功[asdasd]', 1, 1468208073);
INSERT INTO `xycms_log` VALUES (1620, 'master', '192.168.0.1', '删除产品分类分类成功[id=6]', 1, 1468208164);
INSERT INTO `xycms_log` VALUES (1621, 'master', '192.168.0.1', '编辑资讯分类成功[id=3]', 1, 1468208172);
INSERT INTO `xycms_log` VALUES (1622, 'master', '192.168.0.1', '更新站点参数设置成功', 1, 1468208393);
INSERT INTO `xycms_log` VALUES (1623, 'master', '192.168.0.1', '更新站点参数设置成功', 1, 1468208405);
INSERT INTO `xycms_log` VALUES (1624, 'master', '192.168.0.1', '更新站点SEO成功', 1, 1468208730);
INSERT INTO `xycms_log` VALUES (1625, 'master', '192.168.0.1', '更新站点SEO成功', 1, 1468209419);
INSERT INTO `xycms_log` VALUES (1626, 'master', '192.168.0.1', '更新站点SEO成功', 1, 1468209462);
INSERT INTO `xycms_log` VALUES (1627, 'master', '192.168.0.1', '更新站点参数设置成功', 1, 1468217746);
INSERT INTO `xycms_log` VALUES (1628, 'master', '192.168.0.1', '更新站点参数设置成功', 1, 1468217746);
INSERT INTO `xycms_log` VALUES (1629, 'master', '192.168.0.1', '更新站点参数设置成功', 1, 1468217747);
INSERT INTO `xycms_log` VALUES (1630, 'master', '192.168.0.1', '更新站点参数设置成功', 1, 1468217748);
INSERT INTO `xycms_log` VALUES (1631, 'master', '192.168.0.1', '清除网站缓存成功', 1, 1468217755);
INSERT INTO `xycms_log` VALUES (1632, 'admin', '192.168.0.1', '注销退出后台管理.', 1, 1468218427);
INSERT INTO `xycms_log` VALUES (1633, 'master', '192.168.0.1', '登录后台成功.', 1, 1468218433);
INSERT INTO `xycms_log` VALUES (1634, 'master', '192.168.0.1', '编辑产品成功[id=135]', 1, 1468218495);
INSERT INTO `xycms_log` VALUES (1635, 'master', '192.168.0.1', '编辑产品成功[id=135]', 1, 1468218500);
INSERT INTO `xycms_log` VALUES (1636, 'master', '192.168.0.1', '发布产品成功[3323]', 1, 1468218511);
INSERT INTO `xycms_log` VALUES (1637, 'master', '192.168.0.1', '删除产品成功[id=Array]', 1, 1468218518);
INSERT INTO `xycms_log` VALUES (1638, 'master', '192.168.0.1', '删除产品成功[id=Array]', 1, 1468218520);
INSERT INTO `xycms_log` VALUES (1639, 'master', '192.168.0.1', '删除产品成功[id=Array]', 1, 1468218522);
INSERT INTO `xycms_log` VALUES (1640, 'master', '192.168.0.1', '添加客服信息成功', 1, 1468218609);
INSERT INTO `xycms_log` VALUES (1641, 'master', '192.168.0.1', '删除客服信息成功[id=Array]', 1, 1468218615);
INSERT INTO `xycms_log` VALUES (1642, 'master', '192.168.0.1', '更新关键词库配置成功', 1, 1468218616);
INSERT INTO `xycms_log` VALUES (1643, 'master', '192.168.0.1', '更新关键词库配置成功', 1, 1468218625);
INSERT INTO `xycms_log` VALUES (1644, 'master', '192.168.0.1', '更新站点参数设置成功', 1, 1468218628);
INSERT INTO `xycms_log` VALUES (1645, 'master', '192.168.0.1', '删除留言成功[id=Array]', 1, 1468218642);
INSERT INTO `xycms_log` VALUES (1646, 'master', '192.168.0.1', '发布关键词成功[asdf]', 1, 1468218697);
INSERT INTO `xycms_log` VALUES (1647, 'master', '192.168.0.1', '发布产品成功[一级分类最新一级分类最新]', 1, 1468218776);
INSERT INTO `xycms_log` VALUES (1648, 'master', '192.168.0.1', '发布产品成功[一级分类最新一级分类最新一级分类最新]', 1, 1468218780);
INSERT INTO `xycms_log` VALUES (1649, 'master', '192.168.0.1', '发布产品成功[一级分类最新2]', 1, 1468218785);
INSERT INTO `xycms_log` VALUES (1650, 'master', '192.168.0.1', '发布产品成功[一级分类最新33]', 1, 1468218789);
INSERT INTO `xycms_log` VALUES (1651, 'master', '192.168.0.1', '发布产品成功[一级分类最新3444]', 1, 1468218793);
INSERT INTO `xycms_log` VALUES (1652, 'master', '192.168.0.1', '发布产品成功[一级分类最新33贰]', 1, 1468218878);
INSERT INTO `xycms_log` VALUES (1653, 'master', '192.168.0.1', '发布产品成功[一级分类最新32332]', 1, 1468218883);
INSERT INTO `xycms_log` VALUES (1654, 'master', '192.168.0.1', '发布产品成功[一级分类343最新33贰]', 1, 1468218888);
INSERT INTO `xycms_log` VALUES (1655, 'master', '192.168.0.1', '发布产品成功[一级33分类最新33贰]', 1, 1468218893);
INSERT INTO `xycms_log` VALUES (1656, 'master', '192.168.0.1', '发布产品成功[一级3332分类最新33贰]', 1, 1468218898);
INSERT INTO `xycms_log` VALUES (1657, 'master', '192.168.0.1', '编辑产品成功[id=143]', 1, 1468218937);
INSERT INTO `xycms_log` VALUES (1658, 'master', '192.168.0.1', '编辑产品成功[id=145]', 1, 1468218944);
INSERT INTO `xycms_log` VALUES (1659, 'master', '192.168.0.1', '发布产品成功[一级分类]', 1, 1468218962);
INSERT INTO `xycms_log` VALUES (1660, 'master', '192.168.0.1', '发布产品成功[一级分类]', 1, 1468218965);
INSERT INTO `xycms_log` VALUES (1661, 'master', '192.168.0.1', '发布产品成功[一级分类3]', 1, 1468218970);
INSERT INTO `xycms_log` VALUES (1662, 'master', '192.168.0.1', '发布产品成功[一级分类334]', 1, 1468218975);
INSERT INTO `xycms_log` VALUES (1663, 'master', '192.168.0.1', '发布产品成功[一级分3类33]', 1, 1468218983);
INSERT INTO `xycms_log` VALUES (1664, 'master', '192.168.0.1', '发布产品成功[一级分类最33]', 1, 1468219017);
INSERT INTO `xycms_log` VALUES (1665, 'master', '192.168.0.1', '发布产品成功[一级3分类最3233]', 1, 1468219024);
INSERT INTO `xycms_log` VALUES (1666, 'master', '192.168.0.1', '编辑下载成功[id=2]', 1, 1468219025);
INSERT INTO `xycms_log` VALUES (1667, 'master', '192.168.0.1', '发布产品成功[一级分]', 1, 1468219042);
INSERT INTO `xycms_log` VALUES (1668, 'master', '192.168.0.1', '发布产品成功[一级分2]', 1, 1468219045);
INSERT INTO `xycms_log` VALUES (1669, 'master', '192.168.0.1', '发布产品成功[一级分类33]', 1, 1468219050);
INSERT INTO `xycms_log` VALUES (1670, 'master', '192.168.0.1', '发布产品成功[一级分44]', 1, 1468219054);
INSERT INTO `xycms_log` VALUES (1671, 'master', '192.168.0.1', '发布产品成功[一级3332分类最新33贰一级3332分类最新33贰]', 1, 1468219184);
INSERT INTO `xycms_log` VALUES (1672, 'master', '192.168.0.1', '发布产品成功[一级3332分类最新33贰323]', 1, 1468219188);
INSERT INTO `xycms_log` VALUES (1673, 'master', '192.168.0.1', '删除关键词成功[id=Array]', 1, 1468221840);
INSERT INTO `xycms_log` VALUES (1674, 'master', '192.168.0.1', '删除关键词成功[id=Array]', 1, 1468221848);
INSERT INTO `xycms_log` VALUES (1675, 'master', '192.168.0.1', '删除概况分类成功[id=Array]', 1, 1468221868);
INSERT INTO `xycms_log` VALUES (1676, 'master', '192.168.0.1', '删除单页分类成功[id=Array]', 1, 1468221874);
INSERT INTO `xycms_log` VALUES (1677, 'master', '192.168.0.1', '删除新闻成功[id=Array]', 1, 1468221955);
INSERT INTO `xycms_log` VALUES (1678, 'master', '192.168.0.1', '删除案例分类成功[cid=Array]', 1, 1468221976);
INSERT INTO `xycms_log` VALUES (1679, 'master', '192.168.0.1', '删除案例分类成功[cid=Array]', 1, 1468221984);
INSERT INTO `xycms_log` VALUES (1680, 'master', '192.168.0.1', '删除下载成功[id=Array]', 1, 1468221996);
INSERT INTO `xycms_log` VALUES (1681, 'master', '192.168.0.1', '删除下载分类成功[id=Array]', 1, 1468222016);
INSERT INTO `xycms_log` VALUES (1682, 'master', '192.168.0.1', '删除招聘信息成功[id=Array]', 1, 1468222031);
INSERT INTO `xycms_log` VALUES (1683, 'master', '192.168.0.1', '删除招聘分类成功[id=Array]', 1, 1468222075);
INSERT INTO `xycms_log` VALUES (1684, 'master', '192.168.0.1', '删除新闻成功[id=Array]', 1, 1468222163);
INSERT INTO `xycms_log` VALUES (1685, 'master', '192.168.0.1', '删除产品成功[id=Array]', 1, 1468222855);
INSERT INTO `xycms_log` VALUES (1686, 'master', '192.168.0.1', '删除产品成功[id=Array]', 1, 1468222871);
INSERT INTO `xycms_log` VALUES (1687, 'master', '192.168.0.1', '删除新闻分类成功[cid=Array]', 1, 1468222971);
INSERT INTO `xycms_log` VALUES (1688, 'master', '192.168.0.1', '登录后台成功.', 1, 1468225720);
INSERT INTO `xycms_log` VALUES (1689, 'master', '192.168.0.1', '更新关键词库配置成功', 1, 1468226120);
INSERT INTO `xycms_log` VALUES (1690, 'master', '192.168.0.1', '更新关键词库配置成功', 1, 1468226137);
INSERT INTO `xycms_log` VALUES (1691, 'master', '192.168.0.1', '发布关键词成功[dsfsdf]', 1, 1468226233);
INSERT INTO `xycms_log` VALUES (1692, 'master', '192.168.0.1', '删除关键词成功[id=Array]', 1, 1468226293);
INSERT INTO `xycms_log` VALUES (1693, 'master', '192.168.0.1', '编辑单页分类成功[id=9]', 1, 1468226586);
INSERT INTO `xycms_log` VALUES (1694, 'master', '192.168.0.1', '编辑单页分类成功[id=9]', 1, 1468226598);
INSERT INTO `xycms_log` VALUES (1695, 'master', '192.168.0.1', '编辑产品分类成功[一级测试分类]', 1, 1468226908);
INSERT INTO `xycms_log` VALUES (1696, 'master', '192.168.0.1', '登录后台成功.', 1, 1468281960);
INSERT INTO `xycms_log` VALUES (1697, 'master', '192.168.0.1', '登录后台成功.', 1, 1468460459);
INSERT INTO `xycms_log` VALUES (1698, 'master', '192.168.0.1', '登录后台成功.', 1, 1468800811);
INSERT INTO `xycms_log` VALUES (1699, 'master', '192.168.0.1', '登录后台成功.', 1, 1469146566);
INSERT INTO `xycms_log` VALUES (1700, 'master', '192.168.0.1', '添加资讯分类成功[二级分类]', 1, 1469150197);
INSERT INTO `xycms_log` VALUES (1701, 'master', '192.168.0.1', '删除产品分类分类成功[id=8]', 1, 1469150317);
INSERT INTO `xycms_log` VALUES (1702, 'master', '192.168.0.1', '添加资讯分类成功[二级分类]', 1, 1469150832);
INSERT INTO `xycms_log` VALUES (1703, 'master', '192.168.0.1', '删除产品分类分类成功[id=8]', 1, 1469151352);
INSERT INTO `xycms_log` VALUES (1704, 'master', '192.168.0.1', '编辑产品分类成功[产品分类]', 1, 1469151546);
INSERT INTO `xycms_log` VALUES (1705, 'master', '192.168.0.1', '编辑信息成功[id=201]', 1, 1469151807);
INSERT INTO `xycms_log` VALUES (1706, 'master', '192.168.0.1', '编辑信息成功[id=201]', 1, 1469159589);
INSERT INTO `xycms_log` VALUES (1707, 'master', '192.168.0.1', '编辑信息成功[id=200]', 1, 1469159615);
INSERT INTO `xycms_log` VALUES (1708, 'master', '192.168.0.1', '添加单页成功[测试案例]', 1, 1469169916);
INSERT INTO `xycms_log` VALUES (1709, 'master', '192.168.0.1', '添加单页成功[人才招聘]', 1, 1469169949);
INSERT INTO `xycms_log` VALUES (1710, 'master', '192.168.0.1', '删除单页成功[id=Array]', 1, 1469169983);
INSERT INTO `xycms_log` VALUES (1711, 'master', '192.168.0.1', '添加单页成功[士大夫士大夫]', 1, 1469171554);
INSERT INTO `xycms_log` VALUES (1712, 'master', '192.168.0.1', '删除单页成功[id=Array]', 1, 1469171570);
INSERT INTO `xycms_log` VALUES (1713, 'master', '192.168.0.1', '添加单页成功[asda是]', 1, 1469172238);
INSERT INTO `xycms_log` VALUES (1714, 'master', '192.168.0.1', '删除单页成功[id=Array]', 1, 1469172252);
INSERT INTO `xycms_log` VALUES (1715, 'master', '192.168.0.1', '更新站点参数设置成功', 1, 1469858183);

-- ----------------------------
-- Table structure for xycms_matchregion
-- ----------------------------
DROP TABLE IF EXISTS `xycms_matchregion`;
CREATE TABLE `xycms_matchregion`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `en` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `flag` tinyint(2) UNSIGNED NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xycms_matchregion
-- ----------------------------
INSERT INTO `xycms_matchregion` VALUES (2, '大连', 'dalian', 1);
INSERT INTO `xycms_matchregion` VALUES (3, '青岛', 'qingdao', 1);
INSERT INTO `xycms_matchregion` VALUES (4, '杭州', 'hangzhou', 1);
INSERT INTO `xycms_matchregion` VALUES (5, '武汉', 'wuhan', 1);
INSERT INTO `xycms_matchregion` VALUES (6, '广州', 'guangzhou', 1);
INSERT INTO `xycms_matchregion` VALUES (7, '澳门', 'aomen', 1);
INSERT INTO `xycms_matchregion` VALUES (8, '重庆', 'chongqing', 1);
INSERT INTO `xycms_matchregion` VALUES (9, '成都', 'chengdu', 1);
INSERT INTO `xycms_matchregion` VALUES (10, '西安', 'xian', 1);
INSERT INTO `xycms_matchregion` VALUES (11, '石家庄', 'shijiazhuang', 1);
INSERT INTO `xycms_matchregion` VALUES (12, '长春', 'changchun', 1);
INSERT INTO `xycms_matchregion` VALUES (13, '厦门', 'xiamen', 1);
INSERT INTO `xycms_matchregion` VALUES (14, '南昌', 'nanchang', 1);
INSERT INTO `xycms_matchregion` VALUES (15, '长沙', 'changshan', 1);
INSERT INTO `xycms_matchregion` VALUES (16, '珠海', 'zhuhai', 1);

-- ----------------------------
-- Table structure for xycms_onlinechat
-- ----------------------------
DROP TABLE IF EXISTS `xycms_onlinechat`;
CREATE TABLE `xycms_onlinechat`  (
  `onid` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ontype` smallint(2) UNSIGNED NULL DEFAULT 0,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sitetitle` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `orders` mediumint(8) UNSIGNED NULL DEFAULT 0,
  `flag` smallint(2) UNSIGNED NULL DEFAULT 0,
  `timeline` int(10) UNSIGNED NULL DEFAULT 0,
  PRIMARY KEY (`onid`) USING BTREE,
  INDEX `flag`(`flag`) USING BTREE,
  INDEX `orders`(`orders`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xycms_onlinechat
-- ----------------------------
INSERT INTO `xycms_onlinechat` VALUES (7, 1, '客户服务', '123456', '', 1, 1, 1365319412);
INSERT INTO `xycms_onlinechat` VALUES (9, 2, '淘宝旺旺', 'taobao', '', 2, 1, 1370746638);

-- ----------------------------
-- Table structure for xycms_page
-- ----------------------------
DROP TABLE IF EXISTS `xycms_page`;
CREATE TABLE `xycms_page`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `word` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cid` mediumint(8) UNSIGNED NULL DEFAULT 0,
  `linktype` smallint(2) UNSIGNED NULL DEFAULT 1,
  `linkurl` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `target` smallint(2) UNSIGNED NULL DEFAULT 1,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `flag` smallint(2) UNSIGNED NULL DEFAULT 0,
  `orders` mediumint(8) UNSIGNED NULL DEFAULT 0,
  `timeline` int(10) UNSIGNED NULL DEFAULT 0,
  `tag` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `depth` mediumint(8) UNSIGNED NULL DEFAULT 1,
  `parentid` mediumint(8) UNSIGNED NULL DEFAULT 0,
  `ptitle` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pkeywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pdescription` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `word`(`word`) USING BTREE,
  INDEX `cateid`(`cid`) USING BTREE,
  INDEX `flag`(`flag`) USING BTREE,
  INDEX `orders`(`orders`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 36 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xycms_page
-- ----------------------------
INSERT INTO `xycms_page` VALUES (1, 'company', 1, 1, '', 1, '公司简介', '<p>信息资料整理中……</p>', 1, 1, 1314267244, '', 1, 0, '', '', '');
INSERT INTO `xycms_page` VALUES (9, 'contact', 1, 1, '', 1, '联系我们', '<p>联系我们</p>', 1, 9, 1352947252, '', 1, 0, '', '', '');
INSERT INTO `xycms_page` VALUES (14, 'm_about', 9, 1, '', 1, '公司介绍', '<p>公司介绍</p>', 1, 12, 1381475370, '', 1, 0, '', '', '');
INSERT INTO `xycms_page` VALUES (17, 'm_sjdt', 9, 1, '', 1, '手机地图', '<p>手机地图</p>', 1, 15, 1382344090, '', 1, 0, '', '', '');
INSERT INTO `xycms_page` VALUES (19, 'm_lxfs', 9, 1, '', 1, '联系方式', '<p>联系我们</p>', 1, 17, 1382344114, '', 1, 0, '', '', '');
INSERT INTO `xycms_page` VALUES (27, 'ejflf1c', 1, 1, '', 1, '二级分类1', '<p>信息资料整理中……</p>', 1, 18, 1446794609, '', 2, 1, '', '', '');
INSERT INTO `xycms_page` VALUES (30, 'jjejfl37b', 1, 1, '', 1, '二级分类2', '<p>资料整理中...<br/></p>', 1, 21, 1447035067, '', 2, 1, '', '', '');
INSERT INTO `xycms_page` VALUES (32, 'csal3d3', 9, 1, '', 1, '测试案例', '', 1, 22, 1469169916, NULL, 1, 0, '', '', '');

-- ----------------------------
-- Table structure for xycms_pagecate
-- ----------------------------
DROP TABLE IF EXISTS `xycms_pagecate`;
CREATE TABLE `xycms_pagecate`  (
  `cid` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `cname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `catdir` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `parentid` mediumint(8) UNSIGNED NULL DEFAULT 0,
  `depth` smallint(2) UNSIGNED NULL DEFAULT 0,
  `orders` smallint(2) UNSIGNED NULL DEFAULT 0,
  `flag` smallint(2) UNSIGNED NULL DEFAULT 0,
  `intro` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `timeline` int(10) UNSIGNED NULL DEFAULT 0,
  `elite` smallint(2) UNSIGNED NULL DEFAULT 0,
  `linktype` smallint(2) UNSIGNED NULL DEFAULT 1,
  `linkurl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `target` smallint(2) UNSIGNED NULL DEFAULT 1,
  `state` smallint(2) UNSIGNED NULL DEFAULT 1,
  PRIMARY KEY (`cid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xycms_pagecate
-- ----------------------------
INSERT INTO `xycms_pagecate` VALUES (1, '公司概况', 'about', 0, 0, 1, 1, '', 1314262501, 0, 1, '', 1, 1);
INSERT INTO `xycms_pagecate` VALUES (9, '手机版内容', 'mobile', 0, 0, 3, 1, '', 1381377008, 0, 1, '', 1, 2);

-- ----------------------------
-- Table structure for xycms_product
-- ----------------------------
DROP TABLE IF EXISTS `xycms_product`;
CREATE TABLE `xycms_product`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `cid` mediumint(8) UNSIGNED NULL DEFAULT 0,
  `productnum` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `thumbfiles` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `uploadfiles` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `price` decimal(18, 2) UNSIGNED NULL DEFAULT 0.00,
  `hits` int(10) UNSIGNED NULL DEFAULT 0,
  `elite` smallint(2) UNSIGNED NULL DEFAULT 0,
  `isnew` smallint(2) UNSIGNED NULL DEFAULT 0,
  `flag` smallint(2) UNSIGNED NULL DEFAULT 0,
  `timeline` int(10) UNSIGNED NULL DEFAULT 0,
  `tag` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `orders` smallint(4) UNSIGNED NULL DEFAULT 0,
  `elite_orders` smallint(4) UNSIGNED NOT NULL DEFAULT 0,
  `isnew_orders` smallint(4) UNSIGNED NOT NULL DEFAULT 0,
  `front` tinyint(4) NOT NULL DEFAULT 1,
  `tail` tinyint(4) NOT NULL DEFAULT 1,
  `taggu` tinyint(11) NOT NULL DEFAULT 0,
  `extend1` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `extend2` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `extend3` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `wrext1` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `wrext2` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `wrext3` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `nagao` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `post` tinyint(4) UNSIGNED NOT NULL,
  `ptitle` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pkeywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pdescription` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `cateid`(`cid`) USING BTREE,
  INDEX `flag`(`flag`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 160 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xycms_product
-- ----------------------------
INSERT INTO `xycms_product` VALUES (124, 1, '1427180917', '产品比例（150×120）', 'data/images/product/thumb_20150324150832_914.jpg', 'data/images/product/20150324150832_914.jpg', '<p>产品比例（150×120）</p>', 0.00, 104, 0, 0, 1, 1464773078, '产品分类,产品比例（150×120）价格,产品比例（150×120）批发', 1, 3, 0, 1, 1, 1, '', '', '', '', '', '', '安徽,杭州,深圳,丽江,合肥,内蒙古,北京,山西,浙江,南京', 1, '', '', '');
INSERT INTO `xycms_product` VALUES (125, 1, '1427180932', '产品比例（150×120）', 'data/images/product/thumb_20150324150849_650.jpg', 'data/images/product/20150324150849_650.jpg', '<p>产品比例（150×120）</p>', 0.00, 41, 1, 0, 1, 1464772748, '产品分类', 2, 4, 0, 1, 1, 0, '', '', '', '', '', '', '', 3, '', '', '');
INSERT INTO `xycms_product` VALUES (126, 1, '1427180944', '产品比例（150×120）', 'data/images/product/thumb_20150324150902_353.jpg', 'data/images/product/20150324150902_353.jpg', '<p>产品比例（150×120）</p>', 0.00, 133, 1, 0, 1, 1464772739, '产品分类,产品比例（150×120）价格,产品比例（150×120）批发', 3, 2, 0, 1, 1, 0, '', '', '', '', '', '', '价格,批发,供应商', 2, '', '', '');
INSERT INTO `xycms_product` VALUES (127, 1, '1427180960', '产品比例（150×120）', 'data/images/product/thumb_20150324150918_649.jpg', 'data/images/product/20150324150918_649.jpg', '<p>产品比例（150×120）</p><p><br/></p><p><br/></p>', 0.00, 229, 1, 0, 1, 1467938777, '关键词1', 4, 1, 0, 1, 1, 1, '', '', '', '', '', '', '价格,批发,供应商', 2, '', '', '');

-- ----------------------------
-- Table structure for xycms_productcate
-- ----------------------------
DROP TABLE IF EXISTS `xycms_productcate`;
CREATE TABLE `xycms_productcate`  (
  `cid` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `cname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `word` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `parentid` mediumint(8) UNSIGNED NULL DEFAULT 0,
  `depth` mediumint(8) UNSIGNED NULL DEFAULT 0,
  `orders` smallint(2) UNSIGNED NULL DEFAULT 0,
  `flag` smallint(2) UNSIGNED NULL DEFAULT 0,
  `elite` smallint(2) UNSIGNED NULL DEFAULT 0,
  `intro` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `timeline` int(10) UNSIGNED NULL DEFAULT 0,
  `img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `linktype` smallint(2) UNSIGNED NULL DEFAULT 1,
  `linkurl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `target` smallint(2) UNSIGNED NULL DEFAULT 1,
  `front` tinyint(4) NOT NULL DEFAULT 1,
  `taggu` tinyint(4) NOT NULL DEFAULT 0,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `custom` smallint(2) UNSIGNED NULL DEFAULT 0,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `keywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `post` smallint(4) UNSIGNED NULL DEFAULT 3,
  `nagao` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`cid`) USING BTREE,
  INDEX `parentid`(`parentid`) USING BTREE,
  INDEX `orders`(`orders`) USING BTREE,
  INDEX `flag`(`flag`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xycms_productcate
-- ----------------------------
INSERT INTO `xycms_productcate` VALUES (2, '二级分类', 'ejfl593', 1, 1, 2, 0, 0, '二级分类优势：为你详细介绍产品中心的产品内容,包括产品中心的用途、型号、范围、图片等,在这里你可以得知所有产品中心的新闻以及最新的市场产品中心价格。', 1406714010, 'data/images/product/20151021094644_924.jpg', 1, '', 1, 1, 1, '<p>资料整理中...<br/></p>', 1, '', '', '', 3, '');
INSERT INTO `xycms_productcate` VALUES (1, '产品分类', 'cpfl100', 0, 0, 1, 1, 0, '一级分类优势：为你详细介绍产品中心的产品内容,包括产品中心的用途、型号、范围、图片等,在这里你可以得知所有产品中心的新闻以及最新的市场产品中心价格。', 1372752315, 'data/images/product/20151021143959_565.jpg', 1, '', 1, 1, 1, '<p>资料整理中...<br/></p>', 0, '', '', '', 2, '价格,批发,供应商');
INSERT INTO `xycms_productcate` VALUES (4, '三级分类', 'sjfl35c', 2, 2, 4, 0, 0, '三级分类优势：为你详细介绍产品中心的产品内容,包括产品中心的用途、型号、范围、图片等,在这里你可以得知所有产品中心的新闻以及最新的市场产品中心价格。', 1431414539, 'data/images/product/20151021094732_548.jpg', 1, '', 1, 1, 1, '<p>资料整理中...<br/></p>', 1, '', '', '', 3, '');
INSERT INTO `xycms_productcate` VALUES (5, '三级分类', 'sjfl045', 2, 2, 5, 0, 0, '', 1431414552, '', 1, '', 1, 1, 1, '<p>资料整理中...<br/></p>', 1, '', '', '', 3, '');
INSERT INTO `xycms_productcate` VALUES (6, '三级分类', 'sjflbc5', 2, 2, 6, 0, 0, '', 1431414563, '', 1, '', 1, 1, 1, '', 0, '', '', '', 3, '');
INSERT INTO `xycms_productcate` VALUES (7, '二级分类', 'ejfl290', 1, 1, 7, 0, 0, '二级分类优势：为你详细介绍产品中心的产品内容,包括产品中心的用途、型号、范围、图片等,在这里你可以得知所有产品中心的新闻以及最新的市场产品中心价格。', 1431414594, 'data/images/product/20151021094707_917.jpg', 1, '', 1, 1, 1, '<p>资料整理中...<br/></p>', 1, '', '', '', 3, '');
INSERT INTO `xycms_productcate` VALUES (8, '三级分类', 'sjflf22', 7, 2, 8, 0, 0, '', 1431414608, '', 1, '', 1, 1, 1, '', 0, '', '', '', 3, '');
INSERT INTO `xycms_productcate` VALUES (9, '三级分类', 'sjfle92', 7, 2, 9, 0, 0, '', 1431414635, '', 1, '', 1, 1, 1, '', 0, '', '', '', 3, '');
INSERT INTO `xycms_productcate` VALUES (14, '一级分类最新', 'yjflzxe85', 0, 0, 14, 1, 0, '一级分类优势：为你详细介绍产品中心的产品内容,包括产品中心的用途、型号、范围、图片等,在这里你可以得知所有产品中心的新闻以及最新的市场产品中心价格。', 1445390667, 'data/images/product/20151021091333_996.jpg', 1, '', 1, 1, 1, '<p style=\"text-align: center;\"><img src=\"/demonew/data/upload/image/20151021/1445390661623745.jpg\" title=\"1445390661623745.jpg\" alt=\"bb3.jpg\"/></p>', 1, '', '', '', 3, '');
INSERT INTO `xycms_productcate` VALUES (16, '一级测试分类', 'yjcsfl7e7', 0, 0, 16, 1, 0, '', 1467619259, '', 2, '/demonew/about/company.html', 1, 1, 1, '', 0, '', '', '', 2, '价格,批发,供应商');

-- ----------------------------
-- Table structure for xycms_region
-- ----------------------------
DROP TABLE IF EXISTS `xycms_region`;
CREATE TABLE `xycms_region`  (
  `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `en` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `flag` tinyint(2) UNSIGNED NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`, `en`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 85 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xycms_region
-- ----------------------------
INSERT INTO `xycms_region` VALUES (63, '江苏', 'jiangsu', 1);
INSERT INTO `xycms_region` VALUES (69, '上海', 'shanghai', 1);
INSERT INTO `xycms_region` VALUES (70, '南京', 'nanjing', 1);
INSERT INTO `xycms_region` VALUES (71, '浙江', 'zhejiang', 1);
INSERT INTO `xycms_region` VALUES (72, '山西', 'shanxi', 1);
INSERT INTO `xycms_region` VALUES (73, '北京', 'beijing', 1);
INSERT INTO `xycms_region` VALUES (74, '内蒙古', 'neimenggu', 1);
INSERT INTO `xycms_region` VALUES (75, '合肥', 'hefei', 1);
INSERT INTO `xycms_region` VALUES (76, '丽江', 'lijiang', 1);
INSERT INTO `xycms_region` VALUES (82, '深圳', 'shenzhen', 1);
INSERT INTO `xycms_region` VALUES (83, '杭州', 'hangzhou', 1);
INSERT INTO `xycms_region` VALUES (84, '安徽', 'anhui', 1);

-- ----------------------------
-- Table structure for xycms_skin
-- ----------------------------
DROP TABLE IF EXISTS `xycms_skin`;
CREATE TABLE `xycms_skin`  (
  `skinid` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `skinname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `skindir` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `skinext` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `thumbfiles` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `orders` mediumint(8) UNSIGNED NULL DEFAULT 0,
  `flag` smallint(2) UNSIGNED NULL DEFAULT 0,
  `timeline` int(10) UNSIGNED NULL DEFAULT 0,
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`skinid`) USING BTREE,
  INDEX `flag`(`flag`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xycms_skin
-- ----------------------------
INSERT INTO `xycms_skin` VALUES (1, '默认风格', 'default', 'tpl', '', 0, 1, 1313905723, '蓝色通用');

-- ----------------------------
-- Table structure for xycms_sp
-- ----------------------------
DROP TABLE IF EXISTS `xycms_sp`;
CREATE TABLE `xycms_sp`  (
  `id` mediumint(4) UNSIGNED NOT NULL AUTO_INCREMENT,
  `spname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `splabel` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `np` smallint(2) UNSIGNED NOT NULL DEFAULT 1,
  `recommend` smallint(2) UNSIGNED NULL DEFAULT 0,
  `isnew` smallint(2) UNSIGNED NULL DEFAULT 0,
  `cateid` mediumint(8) UNSIGNED NULL DEFAULT 0,
  `orders` smallint(2) UNSIGNED NULL DEFAULT 0,
  `num` mediumint(4) NULL DEFAULT 0,
  `intro` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `spname`(`spname`) USING BTREE,
  UNIQUE INDEX `splabel`(`splabel`) USING BTREE,
  INDEX `cateid`(`cateid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xycms_sp
-- ----------------------------
INSERT INTO `xycms_sp` VALUES (6, '公司新闻', 'news_company', 2, 0, 0, 1, 0, 6, '公司新闻');
INSERT INTO `xycms_sp` VALUES (19, '推荐产品', 'recommend_product', 1, 0, 0, 0, 0, 6, '');
INSERT INTO `xycms_sp` VALUES (11, '行业新闻', 'news_industry', 2, 0, 0, 3, 0, 6, '行业动态');
INSERT INTO `xycms_sp` VALUES (17, '最新新闻', 'news_laster', 2, 0, 0, 0, 0, 6, '');
INSERT INTO `xycms_sp` VALUES (18, '热销产品', 'hot_product', 1, 0, 0, 0, 0, 6, '');

-- ----------------------------
-- Table structure for xycms_tag
-- ----------------------------
DROP TABLE IF EXISTS `xycms_tag`;
CREATE TABLE `xycms_tag`  (
  `tagid` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tag` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `enabled` smallint(11) NULL DEFAULT 0,
  PRIMARY KEY (`tagid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 38 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xycms_tag
-- ----------------------------
INSERT INTO `xycms_tag` VALUES (1, '一级分类最新一级分类最新一级分类最新', 'http://218.4.132.130:85/demonew/product/138.html', 0);
INSERT INTO `xycms_tag` VALUES (2, '一级分类最新一级分类最新', 'http://218.4.132.130:85/demonew/product/137.html', 0);
INSERT INTO `xycms_tag` VALUES (3, '一级3332分类最新33贰323', 'http://218.4.132.130:85/demonew/product/159.html', 0);
INSERT INTO `xycms_tag` VALUES (4, '一级3332分类最新33贰', 'http://218.4.132.130:85/demonew/product/146.html', 0);
INSERT INTO `xycms_tag` VALUES (5, '产品比例（150×120）', 'http://218.4.132.130:85/demonew/product/124.html', 1);
INSERT INTO `xycms_tag` VALUES (6, '一级分类343最新33贰', 'http://218.4.132.130:85/demonew/product/144.html', 0);
INSERT INTO `xycms_tag` VALUES (7, '一级33分类最新33贰', 'http://218.4.132.130:85/demonew/product/145.html', 1);
INSERT INTO `xycms_tag` VALUES (8, '一级分类最新33贰', 'http://218.4.132.130:85/demonew/product/142.html', 0);
INSERT INTO `xycms_tag` VALUES (9, '一级分类最新32332', 'http://218.4.132.130:85/demonew/product/143.html', 1);
INSERT INTO `xycms_tag` VALUES (10, '一级分类最新3444', 'http://218.4.132.130:85/demonew/product/141.html', 0);
INSERT INTO `xycms_tag` VALUES (11, '一级3分类最3233', 'http://218.4.132.130:85/demonew/product/153.html', 0);
INSERT INTO `xycms_tag` VALUES (12, '一级分类最新33', 'http://218.4.132.130:85/demonew/product/140.html', 1);
INSERT INTO `xycms_tag` VALUES (13, '一级分类最新2', 'http://218.4.132.130:85/demonew/product/139.html', 1);
INSERT INTO `xycms_tag` VALUES (14, '一级测试分类', 'http://218.4.132.130:85/demonew/product/yjcsfl7e7/', 1);
INSERT INTO `xycms_tag` VALUES (15, '一级分类最新', 'http://218.4.132.130:85/demonew/product/yjflzxe85/', 1);
INSERT INTO `xycms_tag` VALUES (16, '一级分类最33', 'http://218.4.132.130:85/demonew/product/152.html', 1);
INSERT INTO `xycms_tag` VALUES (17, '一级分3类33', 'http://218.4.132.130:85/demonew/product/151.html', 1);
INSERT INTO `xycms_tag` VALUES (18, '一级分类334', 'http://218.4.132.130:85/demonew/product/150.html', 1);
INSERT INTO `xycms_tag` VALUES (19, '一级分类33', 'http://218.4.132.130:85/demonew/product/156.html', 1);
INSERT INTO `xycms_tag` VALUES (20, '一级分类3', 'http://218.4.132.130:85/demonew/product/149.html', 1);
INSERT INTO `xycms_tag` VALUES (21, '一级分类', 'http://218.4.132.130:85/demonew/product/147.html', 1);
INSERT INTO `xycms_tag` VALUES (22, '产品分类', 'http://218.4.132.130:85/demonew/product/cpfl100/', 1);
INSERT INTO `xycms_tag` VALUES (23, '三级分类', 'http://218.4.132.130:85/demonew/product/sjfl35c/', 1);
INSERT INTO `xycms_tag` VALUES (24, '二级分类', 'http://218.4.132.130:85/demonew/product/ejfl593/', 1);
INSERT INTO `xycms_tag` VALUES (25, '一级分44', 'http://218.4.132.130:85/demonew/product/157.html', 0);
INSERT INTO `xycms_tag` VALUES (26, '关键词10', 'http://218.4.132.130:85/demonew/', 1);
INSERT INTO `xycms_tag` VALUES (27, '关键词2', 'http://218.4.132.130:85/demonew/', 1);
INSERT INTO `xycms_tag` VALUES (28, '关键词3', 'http://218.4.132.130:85/demonew/', 1);
INSERT INTO `xycms_tag` VALUES (29, '关键词1', 'http://218.4.132.130:85/demonew/', 1);
INSERT INTO `xycms_tag` VALUES (30, '关键词4', 'http://218.4.132.130:85/demonew/', 1);
INSERT INTO `xycms_tag` VALUES (31, '关键词5', 'http://218.4.132.130:85/demonew/', 1);
INSERT INTO `xycms_tag` VALUES (32, '关键词6', 'http://218.4.132.130:85/demonew/', 1);
INSERT INTO `xycms_tag` VALUES (33, '关键词7', 'http://218.4.132.130:85/demonew/', 1);
INSERT INTO `xycms_tag` VALUES (34, '关键词8', 'http://218.4.132.130:85/demonew/', 1);
INSERT INTO `xycms_tag` VALUES (35, '关键词9', 'http://218.4.132.130:85/demonew/', 1);
INSERT INTO `xycms_tag` VALUES (36, '一级分2', 'http://218.4.132.130:85/demonew/product/155.html', 0);
INSERT INTO `xycms_tag` VALUES (37, '一级分', 'http://218.4.132.130:85/demonew/product/154.html', 0);

-- ----------------------------
-- Table structure for xycms_translate
-- ----------------------------
DROP TABLE IF EXISTS `xycms_translate`;
CREATE TABLE `xycms_translate`  (
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `flag` mediumint(2) UNSIGNED NULL DEFAULT 1,
  PRIMARY KEY (`name`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xycms_translate
-- ----------------------------
INSERT INTO `xycms_translate` VALUES ('[\"en\",\"de\",\"ru\",\"fra\",\"kor\",\"rom\",\"pt\",\"jp\",\"spa\",\"el\",\"cht\"]', 1);

SET FOREIGN_KEY_CHECKS = 1;
