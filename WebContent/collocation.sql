/*
Navicat MySQL Data Transfer

Source Server         : rui
Source Server Version : 50173
Source Host           : localhost:3306
Source Database       : collocation

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2016-01-27 20:32:50
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for calendar
-- ----------------------------
DROP TABLE IF EXISTS `calendar`;
CREATE TABLE `calendar` (
  `id` int(11) NOT NULL,
  `cal_title` varchar(25) NOT NULL COMMENT '日程主题',
  `starttime` varchar(255) NOT NULL,
  `endtime` datetime NOT NULL COMMENT '开始时间',
  `cal_type` varchar(15) NOT NULL COMMENT '日程类型',
  `privority` varchar(15) DEFAULT NULL COMMENT '优先级',
  `sercet` varchar(10) DEFAULT NULL COMMENT '保密级别',
  `finish` varchar(15) DEFAULT NULL COMMENT '状态',
  `awake` varchar(15) DEFAULT NULL COMMENT '提醒类型',
  `content` tinytext COMMENT '日程内容',
  `cal_writeUser` varchar(10) DEFAULT NULL COMMENT '日程填报人',
  `cal_creTime` varchar(20) DEFAULT NULL COMMENT '填报时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of calendar
-- ----------------------------

-- ----------------------------
-- Table structure for group
-- ----------------------------
DROP TABLE IF EXISTS `group`;
CREATE TABLE `group` (
  `Group_ID` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '0',
  `Group_name` varchar(500) NOT NULL COMMENT '团队名',
  `Gp_unit` varchar(200) DEFAULT NULL,
  `Group_manager` varchar(255) DEFAULT NULL COMMENT '团队管理人',
  `Gp_label` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Group_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of group
-- ----------------------------
INSERT INTO `group` VALUES ('1', '网络研究室', '山西大学', '201422404012', '协同研究');
INSERT INTO `group` VALUES ('3', '中文信息处理', '山西大学', 'test', '国家863项目-高考阅读题');
INSERT INTO `group` VALUES ('10', '数据', '山西大学', '201422404012', '大数据');
INSERT INTO `group` VALUES ('12', '图像处理', '计算机与信息技术学院', '201422404012', '温老师团队');
INSERT INTO `group` VALUES ('13', '人工智能', '太原理工大学', '201422404012', '软件学院');

-- ----------------------------
-- Table structure for group_user
-- ----------------------------
DROP TABLE IF EXISTS `group_user`;
CREATE TABLE `group_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `group_ID` int(11) unsigned NOT NULL COMMENT '0',
  `userName` varchar(255) NOT NULL,
  `role` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `group_fk` (`group_ID`),
  KEY `user_fk` (`userName`),
  CONSTRAINT `group_fk` FOREIGN KEY (`group_ID`) REFERENCES `group` (`Group_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_fk` FOREIGN KEY (`userName`) REFERENCES `user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of group_user
-- ----------------------------
INSERT INTO `group_user` VALUES ('3', '1', 'test', '普通用户');
INSERT INTO `group_user` VALUES ('6', '3', 'test', '管理员');
INSERT INTO `group_user` VALUES ('25', '10', 'test', '普通用户');
INSERT INTO `group_user` VALUES ('29', '12', 'test', '普通用户');

-- ----------------------------
-- Table structure for libscons
-- ----------------------------
DROP TABLE IF EXISTS `libscons`;
CREATE TABLE `libscons` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `contitle` varchar(200) DEFAULT NULL COMMENT '公告标题',
  `contype` varchar(20) DEFAULT NULL,
  `concont` tinytext,
  `adduser` varchar(20) DEFAULT NULL COMMENT '添加用户',
  `addpart` varchar(20) DEFAULT NULL,
  `addtime` varchar(20) DEFAULT NULL,
  `readtime` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of libscons
-- ----------------------------
INSERT INTO `libscons` VALUES ('0', '团队文档协作平台微信端即将上线啦', '工作通告', '<p>\r\n	微信端即将上线，欢迎广大合作者加入团队，共同创作，扫描下方二维码，快联系作者本人吧！\r\n</p>\r\n<p>\r\n	<img alt=\"\" src=\"/kindeditor/attached/image/20160122/20160122094552_36.jpg\" />\r\n</p>', 'admins', '山西大学', '2016-01-22 09:46:17', '34');

-- ----------------------------
-- Table structure for meetting
-- ----------------------------
DROP TABLE IF EXISTS `meetting`;
CREATE TABLE `meetting` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(20) NOT NULL COMMENT '开会标题',
  `secret` varchar(10) NOT NULL COMMENT '保密级别',
  `meet_user` varchar(15) NOT NULL COMMENT '开会人员',
  `meet_dest` varchar(20) DEFAULT NULL COMMENT '开会地点',
  `meet_time` varchar(20) DEFAULT NULL COMMENT '开会时间',
  `isCheck` varchar(10) DEFAULT NULL COMMENT '是否审批',
  `meet_advice` varchar(30) DEFAULT NULL COMMENT '处理意见',
  `meet_creUser` varchar(10) DEFAULT NULL COMMENT '会议填报人',
  `meet_creTime` varchar(20) DEFAULT NULL COMMENT '会议填报时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of meetting
-- ----------------------------

-- ----------------------------
-- Table structure for oa_jihua
-- ----------------------------
DROP TABLE IF EXISTS `oa_jihua`;
CREATE TABLE `oa_jihua` (
  `id` int(11) NOT NULL,
  `mc` varchar(50) DEFAULT NULL COMMENT '名称',
  `fw` varchar(30) DEFAULT NULL COMMENT '范围',
  `leib` varchar(30) DEFAULT NULL COMMENT '类别',
  `jibie` varchar(30) DEFAULT NULL,
  `zhuangt` varchar(15) DEFAULT NULL COMMENT '状态',
  `shij` varchar(20) DEFAULT NULL COMMENT '时间类别',
  `shit` varchar(50) DEFAULT NULL,
  `content` varchar(100) DEFAULT NULL COMMENT '内容',
  `zhi` varchar(100) DEFAULT NULL COMMENT '执行情况',
  `fj` varchar(20) DEFAULT NULL COMMENT '计划附件',
  `gl` varchar(20) DEFAULT NULL COMMENT '关联',
  `jhr` varchar(30) DEFAULT NULL COMMENT '计划人',
  `bum` varchar(20) DEFAULT NULL COMMENT '部门',
  `sp` varchar(10) DEFAULT NULL COMMENT '是否审批',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oa_jihua
-- ----------------------------
INSERT INTO `oa_jihua` VALUES ('0', null, null, '部门计划', null, null, '月计划', null, '写文档', null, null, null, 'test', '计算机与信息技术学院', null);
INSERT INTO `oa_jihua` VALUES ('1', null, null, '个人计划', null, null, '周计划', null, '做毕业设计', null, null, null, 'test', '计算机与信息技术学院', null);

-- ----------------------------
-- Table structure for store
-- ----------------------------
DROP TABLE IF EXISTS `store`;
CREATE TABLE `store` (
  `key` varchar(100) NOT NULL,
  `value` longtext NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of store
-- ----------------------------
INSERT INTO `store` VALUES ('MYSQL_MIGRATION_LEVEL', '1');
INSERT INTO `store` VALUES ('sessionstorage:2XU5x5ZfyfHLbtpagyU3t1JXvUYvJORO', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:AAd10jp_tNkNsDA9bRTSzbxskZ1NdKAN', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('pad2readonly:1', '\"r.eaf96c0553279902f36c583eea7ed753\"');
INSERT INTO `store` VALUES ('readonly2pad:r.eaf96c0553279902f36c583eea7ed753', '\"1\"');
INSERT INTO `store` VALUES ('token2author:t.K8wFl3tUBygLD6pp3QM4', '\"a.LNnwdmqyaJtzQNSy\"');
INSERT INTO `store` VALUES ('globalAuthor:a.LNnwdmqyaJtzQNSy', '{\"colorId\":\"#8fffff\",\"name\":\"ruirui\",\"timestamp\":1451312068494,\"padIDs\":{\"1\":1,\"3\":1,\"\\\"+1+\\\"\":1,\"\\\"+3+\\\"\":1}}');
INSERT INTO `store` VALUES ('pad:1:revs:0', '{\"changeset\":\"Z:1>1|1+1$\\n\",\"meta\":{\"author\":\"\",\"timestamp\":1451049016983,\"atext\":{\"text\":\"\\n\\n\",\"attribs\":\"|2+2\"}}}');
INSERT INTO `store` VALUES ('pad:1', '{\"atext\":{\"text\":\"*面向科研协作的协同编辑技术研究与实现\\n*绪论介绍\\n*第二章：关键技术\\n*第三章：协同编辑原理\\n*第四章：协同编辑技术\\n*第五章：科研协作系统实现\\n*第六章：研究展望\\n*第七章：总结\\n\\n\\n{\\\"payload\\\":[[\\\" qqqqqq\\\",\\\" \\\",\\\" \\\",\\\" \\\"]],\\\"tblId\\\":\\\"1\\\",\\\"tblClass\\\":\\\"data-tables\\\"}\\n{\\\"payload\\\":[[\\\" qqq11\\\",\\\" \\\",\\\" \\\",\\\" \\\"]],\\\"tblId\\\":\\\"1\\\",\\\"tblClass\\\":\\\"data-tables\\\"}\\n{\\\"payload\\\":[[\\\" \\\",\\\" \\\",\\\" \\\",\\\" \\\"]],\\\"tblId\\\":1,\\\"tblClass\\\":\\\"data-tables\\\",\\\"trClass\\\":\\\"alst\\\",\\\"tdClass\\\":\\\"hide-el\\\"}\\n{\\\"payload\\\":[[\\\" \\\",\\\" \\\",\\\" \\\",\\\" \\\"]],\\\"tblId\\\":1,\\\"tblClass\\\":\\\"data-tables\\\",\\\"trClass\\\":\\\"alst\\\",\\\"tdClass\\\":\\\"hide-el\\\"}\\n\",\"attribs\":\"*6*c*h*2*4+1*c*g+i*c|1+1*c*a*2*1g*4*17+1*1i*1h+4|1+1*a*2*1g*4*17+1*o|1+9*o*a*2*1g*4*17+1|1+b*a*2*1g*4*17+1|1+b*a*2*1g*4*17+1|1+d*a*2*1g*4*17+1+4*p+4|1+1*2*1g*4*17+1*e*q*16+6*c|1+1*k|2+2*k*m+f*k+1l*k*m+2*k|1+1*k*n+f*k+3*l+2*k+1f*k*n+2*k|1+1*k*n+2v*k|1+1*k*n+2v|1+1\"},\"pool\":{\"numToAttrib\":{\"0\":[\"author\",\"a.84zWwWNyl6az1jLn\"],\"1\":[\"comment\",\"c-Y6126l7mqNtjRfuN\"],\"2\":[\"insertorder\",\"first\"],\"3\":[\"list\",\"number1\"],\"4\":[\"lmkr\",\"1\"],\"5\":[\"comment\",\"c-x9PYnzhWJLAbXCOi\"],\"6\":[\"align\",\"center\"],\"7\":[\"author\",\"a.LNnwdmqyaJtzQNSy\"],\"8\":[\"align\",\"left\"],\"9\":[\"author\",\"a.2dyclCKoZArslaZm\"],\"10\":[\"heading\",\"h2\"],\"11\":[\"comment\",\"comment-deleted\"],\"12\":[\"author\",\"a.SbEYQkqWmUTpApSd\"],\"13\":[\"comment\",\"c-3wjEYGFcBwA4LfYk\"],\"14\":[\"bold\",\"true\"],\"15\":[\"list\",\"bullet1\"],\"16\":[\"comment\",\"c-veZI01hObJxSP5sV\"],\"17\":[\"heading\",\"h1\"],\"18\":[\"comment\",\"c-qpQjqFXryai6EMKZ\"],\"19\":[\"author\",\"a.Oulp16tJikXXTyQP\"],\"20\":[\"author\",\"a.p63AFTFTCLjWrpyX\"],\"21\":[\"author\",\"a.HKo4I2Mb9HVXfvWq\"],\"22\":[\"tblProp\",\"{\\\"borderWidth\\\":\\\"1\\\",\\\"cellAttrs\\\":[],\\\"width\\\":\\\"6\\\",\\\"rowAttrs\\\":{},\\\"colAttrs\\\":[],\\\"authors\\\":{\\\"a.p63AFTFTCLjWrpyX\\\":{\\\"row\\\":0,\\\"cell\\\":0,\\\"colorId\\\":\\\"#a9d979\\\"}}}\"],\"23\":[\"tblProp\",\"{\\\"borderWidth\\\":\\\"1\\\",\\\"cellAttrs\\\":[],\\\"width\\\":\\\"6\\\",\\\"rowAttrs\\\":{},\\\"colAttrs\\\":[],\\\"authors\\\":{}}\"],\"24\":[\"comment\",\"c-LgDHPxiOLREeKbwo\"],\"25\":[\"comment\",\"c-sXCEI4VGe08vs2uk\"],\"26\":[\"comment\",\"c-lW1mV1Twk2fM9wNH\"],\"27\":[\"bold\",\"\"],\"28\":[\"fs10\",\"\"],\"29\":[\"fs11\",\"true\"],\"30\":[\"fs12\",\"\"],\"31\":[\"fs13\",\"\"],\"32\":[\"fs14\",\"\"],\"33\":[\"fs15\",\"\"],\"34\":[\"fs16\",\"\"],\"35\":[\"fs17\",\"\"],\"36\":[\"fs18\",\"\"],\"37\":[\"fs19\",\"\"],\"38\":[\"fs20\",\"\"],\"39\":[\"fs8\",\"\"],\"40\":[\"fs9\",\"\"],\"41\":[\"fs11\",\"\"],\"42\":[\"fs18\",\"true\"],\"43\":[\"start\",\"1\"],\"44\":[\"start\",\"2\"],\"45\":[\"start\",\"3\"],\"46\":[\"start\",\"4\"],\"47\":[\"start\",\"5\"],\"48\":[\"start\",\"6\"],\"49\":[\"start\",\"7\"],\"50\":[\"start\",\"8\"],\"51\":[\"author\",\"\"],\"52\":[\"list\",\"indent1\"],\"53\":[\"comment\",\"c-zTffARHbciL7Naqm\"],\"54\":[\"author\",\"a.PwQZUjZNF9w2QhgQ\"]},\"nextNum\":55},\"head\":176,\"chatHead\":-1,\"publicStatus\":false,\"passwordHash\":null,\"savedRevisions\":[]}');
INSERT INTO `store` VALUES ('sessionstorage:uiyiANexzxW7RXLPteilyjX_zrSYbaCt', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('pad:\"+1+\"', '{\"atext\":{\"text\":\"*论文题目：\\n\\n\",\"attribs\":\"*3*4*8*6*7+1*3|1+6|1+1\"},\"pool\":{\"numToAttrib\":{\"0\":[\"author\",\"a.2dyclCKoZArslaZm\"],\"1\":[\"author\",\"a.HKo4I2Mb9HVXfvWq\"],\"2\":[\"author\",\"a.p63AFTFTCLjWrpyX\"],\"3\":[\"author\",\"a.LNnwdmqyaJtzQNSy\"],\"4\":[\"insertorder\",\"first\"],\"5\":[\"list\",\"bullet1\"],\"6\":[\"lmkr\",\"1\"],\"7\":[\"start\",\"1\"],\"8\":[\"list\",\"indent1\"],\"9\":[\"list\",\"number1\"],\"10\":[\"list\",\"indent2\"],\"11\":[\"bold\",\"true\"],\"12\":[\"italic\",\"true\"],\"13\":[\"underline\",\"true\"],\"14\":[\"strikethrough\",\"true\"],\"15\":[\"strikethrough\",\"\"],\"16\":[\"underline\",\"\"],\"17\":[\"italic\",\"\"],\"18\":[\"bold\",\"\"],\"19\":[\"author\",\"a.84zWwWNyl6az1jLn\"]},\"nextNum\":20},\"head\":97,\"chatHead\":2,\"publicStatus\":false,\"passwordHash\":null,\"savedRevisions\":[{\"revNum\":49,\"savedById\":\"a.LNnwdmqyaJtzQNSy\",\"label\":\"Revision 49\",\"timestamp\":1450707152973,\"id\":\"15aca8b4636d40e4fabe\"},{\"revNum\":80,\"savedById\":\"a.2dyclCKoZArslaZm\",\"label\":\"Revision 80\",\"timestamp\":1450707333179,\"id\":\"d991a9da83c854f15076\"},{\"revNum\":85,\"savedById\":\"a.LNnwdmqyaJtzQNSy\",\"label\":\"Revision 85\",\"timestamp\":1451133962494,\"id\":\"d42deef1845741f8c2ee\"}]}');
INSERT INTO `store` VALUES ('pad2readonly:\"+1+\"', '\"r.0fd84954344ef1c86fd2fa8f7211bac5\"');
INSERT INTO `store` VALUES ('readonly2pad:r.0fd84954344ef1c86fd2fa8f7211bac5', '\"\\\"+1+\\\"\"');
INSERT INTO `store` VALUES ('pad:\"+1+\":revs:0', '{\"changeset\":\"Z:1>1|1+1$\\n\",\"meta\":{\"author\":\"\",\"timestamp\":1450684413279,\"atext\":{\"text\":\"\\n\\n\",\"attribs\":\"|2+2\"}}}');
INSERT INTO `store` VALUES ('sessionstorage:T9WA5KNYQrWO40WG9jvBvA4EOhuN55CX', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:G5tjrrKV05NiNSUvnvqTeeZe_zSohUvO', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:5ObU-6AqagzqgusoqhOxpllcctmEcJTT', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('token2author:t.iArkIrTL6j3MaDMx5MvU', '\"a.2dyclCKoZArslaZm\"');
INSERT INTO `store` VALUES ('globalAuthor:a.2dyclCKoZArslaZm', '{\"colorId\":31,\"name\":null,\"timestamp\":1451181562301,\"padIDs\":{\"1\":1,\"\\\"+1+\\\"\":1}}');
INSERT INTO `store` VALUES ('sessionstorage:waeAlYOCNpsfODfLEGen5yuXnwEpBkzB', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('pad:\"+1+\":revs:1', '{\"changeset\":\"Z:2>1*0+1$1\",\"meta\":{\"author\":\"a.2dyclCKoZArslaZm\",\"timestamp\":1450684476479}}');
INSERT INTO `store` VALUES ('pad:\"+1+\":revs:2', '{\"changeset\":\"Z:3>1=1*0+1$1\",\"meta\":{\"author\":\"a.2dyclCKoZArslaZm\",\"timestamp\":1450684476974}}');
INSERT INTO `store` VALUES ('pad:\"+1+\":revs:3', '{\"changeset\":\"Z:4<1=1-1$\",\"meta\":{\"author\":\"a.2dyclCKoZArslaZm\",\"timestamp\":1450684480213}}');
INSERT INTO `store` VALUES ('pad:\"+1+\":revs:4', '{\"changeset\":\"Z:3<1-1$\",\"meta\":{\"author\":\"a.2dyclCKoZArslaZm\",\"timestamp\":1450684480712}}');
INSERT INTO `store` VALUES ('token2author:t.Qw2hXME7ydf422iHBLzj', '\"a.84zWwWNyl6az1jLn\"');
INSERT INTO `store` VALUES ('globalAuthor:a.84zWwWNyl6az1jLn', '{\"colorId\":7,\"name\":null,\"timestamp\":1451312112034,\"padIDs\":{\"1\":1,\"3\":1,\"\\\"+1+\\\"\":1,\"\\\"+11+\\\"\":1}}');
INSERT INTO `store` VALUES ('sessionstorage:cecikVlc1nv4WxFZK9XWEqeOiqUHsrbm', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:FLYIrboPVcyXx2F8ADv2TW0a6OAUrUd1', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:INXD2shyn7Pf2fqdL3Yv3r9eKXmoBGMM', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:JFOvzdn9-NR6Cs69YRfnP2BxR45ml8u8', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:9KOFIY8U8jaeLbAKEHhG_RftBjoyUJdo', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:3hoU1lBGzrkHeAJLB-JYgZ_zOO6-xQbq', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:O5WGv6ukkAM5KJT_hj-N1IuRoG-QeMmK', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:K2i3WiIIAHe8kpdEoGpVPaJehQESvPVr', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:Xqp5alrAExXdXQZnv3fHQVBQOpn2MiZH', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:nNAzlXu5k_WTpxXUhPRHz2YtYKU4pXVc', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:DKgaTmUY9EKtQGo3YHrYB-aoFWd_DCQT', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:VEmdgaKp5B7HMH9bzLjwhOT4vZvjhrcO', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:4Ibs9pB037_sqMDKH6WeHFqtnBw5sV8-', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('token2author:t.MLLyPd4hFL5o3X22EFxS', '\"a.Tf7s7MRbWhwDfoSh\"');
INSERT INTO `store` VALUES ('globalAuthor:a.Tf7s7MRbWhwDfoSh', '{\"colorId\":25,\"name\":null,\"timestamp\":1450687646224}');
INSERT INTO `store` VALUES ('sessionstorage:pizM3w86HKgrtkI8PgbAu-iS45wLhHA-', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:1GtQsJHeAQEkDq4CWYEe7qryk_BN2mD2', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:35NPgrqO-R5s4MJwioW450DNiqrhJ-NG', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:wNiUAOcywksLNFTMukX_wwhc3SmjaWhA', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:y7jS0s6ahVTghwwQ2uXxp-7LcNI_IX9F', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:h3oPkrXozuhpGiztBvWJYcrPY4UgXsBy', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:RhxZI8KXm-NwTVcbnAVqMBXgIQoFKEcd', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:gmncG1Si2ccTH56iV2ZS0UEuzwGYNHnq', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:S9uUFpLGXgHepB-44NkSqxNlLcFx4UVk', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('pad:\"+3+\"', '{\"atext\":{\"text\":\"\\n\\n{\\\"payload\\\":[[\\\" \\\",\\\" \\\",\\\" \\\",\\\" \\\",\\\" \\\",\\\" \\\"]],\\\"tblId\\\":1,\\\"tblClass\\\":\\\"data-tables\\\",\\\"trClass\\\":\\\"alst\\\",\\\"tdClass\\\":\\\"hide-el\\\"}\\n{\\\"payload\\\":[[\\\" \\\",\\\" \\\",\\\" \\\",\\\" \\\",\\\" \\\",\\\" \\\"]],\\\"tblId\\\":1,\\\"tblClass\\\":\\\"data-tables\\\",\\\"trClass\\\":\\\"alst\\\",\\\"tdClass\\\":\\\"hide-el\\\"}\\n{\\\"payload\\\":[[\\\" \\\",\\\" \\\",\\\" \\\",\\\" \\\",\\\" \\\",\\\" \\\"]],\\\"tblId\\\":1,\\\"tblClass\\\":\\\"data-tables\\\",\\\"trClass\\\":\\\"alst\\\",\\\"tdClass\\\":\\\"hide-el\\\"}\\n\",\"attribs\":\"*5|2+2*5*6+33*5|1+1*5*7+33*5|1+1*5*7+33|1+1\"},\"pool\":{\"numToAttrib\":{\"0\":[\"author\",\"a.LNnwdmqyaJtzQNSy\"],\"1\":[\"insertorder\",\"first\"],\"2\":[\"list\",\"number1\"],\"3\":[\"lmkr\",\"1\"],\"4\":[\"comment\",\"c-14wkMcW5gay455Qu\"],\"5\":[\"author\",\"a.XPlSu5ugK4iZi903\"],\"6\":[\"tblProp\",\"{\\\"borderWidth\\\":\\\"1\\\",\\\"cellAttrs\\\":[],\\\"width\\\":\\\"6\\\",\\\"rowAttrs\\\":{},\\\"colAttrs\\\":[],\\\"authors\\\":{\\\"a.XPlSu5ugK4iZi903\\\":{\\\"row\\\":0,\\\"cell\\\":0,\\\"colorId\\\":\\\"#a9b5d9\\\"}}}\"],\"7\":[\"tblProp\",\"{\\\"borderWidth\\\":\\\"1\\\",\\\"cellAttrs\\\":[],\\\"width\\\":\\\"6\\\",\\\"rowAttrs\\\":{},\\\"colAttrs\\\":[],\\\"authors\\\":{}}\"]},\"nextNum\":8},\"head\":12,\"chatHead\":-1,\"publicStatus\":false,\"passwordHash\":null,\"savedRevisions\":[{\"revNum\":5,\"savedById\":\"a.LNnwdmqyaJtzQNSy\",\"label\":\"Revision 5\",\"timestamp\":1451132758734,\"id\":\"156730340f9909ed4162\"}]}');
INSERT INTO `store` VALUES ('pad2readonly:\"+3+\"', '\"r.5b71624289ef6bf737886898ef82f1c0\"');
INSERT INTO `store` VALUES ('readonly2pad:r.5b71624289ef6bf737886898ef82f1c0', '\"\\\"+3+\\\"\"');
INSERT INTO `store` VALUES ('pad:\"+3+\":revs:0', '{\"changeset\":\"Z:1>1|1+1$\\n\",\"meta\":{\"author\":\"\",\"timestamp\":1450688299429,\"atext\":{\"text\":\"\\n\\n\",\"attribs\":\"|2+2\"}}}');
INSERT INTO `store` VALUES ('sessionstorage:rShj9V70FRFXZDpdQrHET_-We8yYjf7H', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('pad:\"+5+\"', '{\"atext\":{\"text\":\"\\n\\n\",\"attribs\":\"|2+2\"},\"pool\":{\"numToAttrib\":{},\"nextNum\":0},\"head\":0,\"chatHead\":-1,\"publicStatus\":false,\"passwordHash\":null,\"savedRevisions\":[]}');
INSERT INTO `store` VALUES ('pad2readonly:\"+5+\"', '\"r.be4fdd68c75d3165c035a3ea47616199\"');
INSERT INTO `store` VALUES ('readonly2pad:r.be4fdd68c75d3165c035a3ea47616199', '\"\\\"+5+\\\"\"');
INSERT INTO `store` VALUES ('pad:\"+5+\":revs:0', '{\"changeset\":\"Z:1>1|1+1$\\n\",\"meta\":{\"author\":\"\",\"timestamp\":1450688302147,\"atext\":{\"text\":\"\\n\\n\",\"attribs\":\"|2+2\"}}}');
INSERT INTO `store` VALUES ('sessionstorage:sfxUZo_m2LykG35OmDcSjsahyMFb0RQ4', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:VIJ5FsbemDZ2uHqr9UI3ZB3i10OsAy2d', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:ghXgXJq20M370pdq6WRyTwMmboaPjA7G', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:8yG-2t8n50wO930kkecFOV_AZUs_13tg', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:JPH2DM_JPVM8aGi9kZprtJMpMcZ2YGxh', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:aVICDvQHy2FFNu7IYbR1jmz21ky-VCp7', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:kjCDTM75tvAKIZWrMsDZsTkc95gsB29p', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:MGkQkvJB28WiJxt8CNKAl3-o5SZkP7fe', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('pad:\"+4+\"', '{\"atext\":{\"text\":\"\\n\\n\",\"attribs\":\"|2+2\"},\"pool\":{\"numToAttrib\":{},\"nextNum\":0},\"head\":0,\"chatHead\":-1,\"publicStatus\":false,\"passwordHash\":null,\"savedRevisions\":[]}');
INSERT INTO `store` VALUES ('pad2readonly:\"+4+\"', '\"r.5e0f1495608b7fbf441b690e357a5b4c\"');
INSERT INTO `store` VALUES ('readonly2pad:r.5e0f1495608b7fbf441b690e357a5b4c', '\"\\\"+4+\\\"\"');
INSERT INTO `store` VALUES ('pad:\"+4+\":revs:0', '{\"changeset\":\"Z:1>1|1+1$\\n\",\"meta\":{\"author\":\"\",\"timestamp\":1450688799117,\"atext\":{\"text\":\"\\n\\n\",\"attribs\":\"|2+2\"}}}');
INSERT INTO `store` VALUES ('sessionstorage:7mItT4XTP8RoEKT29Dmo3rnCW5KUQEIB', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:cEuTOCDAkTZBHDKuBxyQFLrDqLLJ6K4C', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:fc8fF-jMiLsPVDt1DIFVs4v9_NZMT9L4', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:3n7FMh2KJ9RTZy_EclitVr7NQQtlko1p', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:g0KsmcoKKnyPW6kX3w8XIjwyhuNl77OC', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:n7kcuwRRqUE600jCF2kW0doEAB4MYHNV', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:vQwjRkm4Nz7ww75jxNQD0F5AO1ymr2rM', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:xOe8X52URzHoFKwNS1va6jpKw3fx9kv6', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:ryVN2eDCeSgmdVU4-7ERPBIKQAafKbid', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:m_aG7q0HuP-kJMSqfelNeh3cwg9tuYlx', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:yxv9d2wWya3cOfiXmUBpQpJpP-qdhrW9', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:-XzuIe3oRQtbQRjONzuW9OZZ0jyMUvbx', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:VVp1LWQILlMRli6eXl_qJxXVdqF0n0qG', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:6pzD_3UxMIHLeYuTKhEBfEiHsqw5jNh3', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:iqYM8-sqpmDEb33ocjrDCtrBleKIUi8N', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:vGAIENInfpMDEi1D-GhRzUxOQLU_NYhy', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:tR7WJYgpWfyKtQ6YIaE1uHcOJoiKAOqj', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:U_1oKO0Mm4ipFC9esgo2vrmU44RSdN5o', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:aZ2hXuyUD-FpUFKwl__3nl9J9qGfPlnw', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:bSYgzA8iOd9_MeeIG7a8PLR98mmvdq8E', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:kFegiuFtDXyCRm6rdebso35NMsM1G315', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:8hznESRXVNwFo7xL0-mq8x6O1e4suKH1', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:4I3con8nOdYaweoNSfJpuGxlUAUL4rMa', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:VrD9oja9zVQhWlwkcZDU8weEzG79H_61', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:O0qYTL0bBo0rr223HDE5S-XO6aZfaikx', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:AopIdZSF8koAqE3sqO3Y1HyZ3zvLQ2qI', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:d7dL1B-fcH3LrxUUQUp9wgKwZzuvbONt', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:fHRpBojE5mJca_kAW3sE2GhmRLVg13gj', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:24kpvT05kFjVG0nXdsoOhP96cbd-OJEj', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:dxtjXUB6iiWYj58fpWvUD7t1ak9SXggU', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:mKjd29bGvkKO3VgCoLxBMxSTQ0So5JKj', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:EyqJdMzvJYizEUOE3p1KYGN9z6jODc-D', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:hoUcFoqexG14VfIwAFUXAjCtOlAW2b_2', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:yO2eP3R_W1V8KsLfUYesYMPdyWoHyTvY', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:sbBirwQ_nawPI1q7bTcMaYF8xfzbNekh', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('pad:\"+1+\":revs:5', '{\"changeset\":\"Z:2>1*0+1$q\",\"meta\":{\"author\":\"a.2dyclCKoZArslaZm\",\"timestamp\":1450695565119}}');
INSERT INTO `store` VALUES ('pad:\"+1+\":revs:6', '{\"changeset\":\"Z:3<1-1$\",\"meta\":{\"author\":\"a.2dyclCKoZArslaZm\",\"timestamp\":1450695569452}}');
INSERT INTO `store` VALUES ('sessionstorage:mxXNbJ3lEfcF_YSq5divL_PTQWb6kOKi', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('token2author:t.vXNLqZUL6746pbXuzt9d', '\"a.HKo4I2Mb9HVXfvWq\"');
INSERT INTO `store` VALUES ('globalAuthor:a.HKo4I2Mb9HVXfvWq', '{\"colorId\":\"#ffc7c7\",\"name\":\"201422404012\",\"timestamp\":1451302695327,\"padIDs\":{\"1\":1,\"\\\"+1+\\\"\":1}}');
INSERT INTO `store` VALUES ('sessionstorage:p6D5UpldXRwCtUm9GcK-tU6fPOArVX26', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:Cbc6cyY3YvkvACut70BidTOynjNRCN-C', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('token2author:t.SY4ugRmNsmdM3U5Mu7Dd', '\"a.p63AFTFTCLjWrpyX\"');
INSERT INTO `store` VALUES ('globalAuthor:a.p63AFTFTCLjWrpyX', '{\"colorId\":\"#a9d979\",\"name\":\"test\",\"timestamp\":1451302698075,\"padIDs\":{\"1\":1,\"\\\"+1+\\\"\":1}}');
INSERT INTO `store` VALUES ('sessionstorage:3gJiW5P-oSlyU5y-kJTXVbT6MgAJ4tFF', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('pad:\"+1+\":revs:7', '{\"changeset\":\"Z:2>2*1+2$ni\",\"meta\":{\"author\":\"a.HKo4I2Mb9HVXfvWq\",\"timestamp\":1450698769925}}');
INSERT INTO `store` VALUES ('pad:\"+1+\":revs:8', '{\"changeset\":\"Z:4>1=2*1+1$h\",\"meta\":{\"author\":\"a.HKo4I2Mb9HVXfvWq\",\"timestamp\":1450698770378}}');
INSERT INTO `store` VALUES ('pad:\"+1+\":revs:9', '{\"changeset\":\"Z:5>1=3*1+1$q\",\"meta\":{\"author\":\"a.HKo4I2Mb9HVXfvWq\",\"timestamp\":1450698772203}}');
INSERT INTO `store` VALUES ('pad:\"+1+\":revs:10', '{\"changeset\":\"Z:6>2=3*2+2$ni\",\"meta\":{\"author\":\"a.p63AFTFTCLjWrpyX\",\"timestamp\":1450698772219}}');
INSERT INTO `store` VALUES ('pad:\"+1+\":revs:11', '{\"changeset\":\"Z:8>1=6*1+1$o\",\"meta\":{\"author\":\"a.HKo4I2Mb9HVXfvWq\",\"timestamp\":1450698772702}}');
INSERT INTO `store` VALUES ('pad:\"+1+\":revs:12', '{\"changeset\":\"Z:9>3=5*2+3$zho\",\"meta\":{\"author\":\"a.p63AFTFTCLjWrpyX\",\"timestamp\":1450698773077}}');
INSERT INTO `store` VALUES ('pad:\"+1+\":revs:13', '{\"changeset\":\"Z:c>2=8*2+2$df\",\"meta\":{\"author\":\"a.p63AFTFTCLjWrpyX\",\"timestamp\":1450698774013}}');
INSERT INTO `store` VALUES ('pad:\"+1+\":revs:14', '{\"changeset\":\"Z:e>4=a*2+4$dnfl\",\"meta\":{\"author\":\"a.p63AFTFTCLjWrpyX\",\"timestamp\":1450698774481}}');
INSERT INTO `store` VALUES ('pad:\"+1+\":revs:15', '{\"changeset\":\"Z:i>6=e*2+6$dmcfld\",\"meta\":{\"author\":\"a.p63AFTFTCLjWrpyX\",\"timestamp\":1450698774964}}');
INSERT INTO `store` VALUES ('pad:\"+1+\":revs:16', '{\"changeset\":\"Z:o>2=k*2+2$fd\",\"meta\":{\"author\":\"a.p63AFTFTCLjWrpyX\",\"timestamp\":1450698777133}}');
INSERT INTO `store` VALUES ('pad:\"+1+\":revs:17', '{\"changeset\":\"Z:q>1=m*2+1$v\",\"meta\":{\"author\":\"a.p63AFTFTCLjWrpyX\",\"timestamp\":1450698777663}}');
INSERT INTO `store` VALUES ('pad:\"+1+\":revs:18', '{\"changeset\":\"Z:r>2=n*2+2$;l\",\"meta\":{\"author\":\"a.p63AFTFTCLjWrpyX\",\"timestamp\":1450698778147}}');
INSERT INTO `store` VALUES ('pad:\"+1+\":revs:19', '{\"changeset\":\"Z:t>2|1=s*2+2$jo\",\"meta\":{\"author\":\"a.p63AFTFTCLjWrpyX\",\"timestamp\":1450698781750}}');
INSERT INTO `store` VALUES ('pad:\"+1+\":revs:20', '{\"changeset\":\"Z:v>2|1=s=2*2+2$jo\",\"meta\":{\"author\":\"a.p63AFTFTCLjWrpyX\",\"timestamp\":1450698782312}}');
INSERT INTO `store` VALUES ('pad:\"+1+\":revs:21', '{\"changeset\":\"Z:x>1|1=s=4*2+1$d\",\"meta\":{\"author\":\"a.p63AFTFTCLjWrpyX\",\"timestamp\":1450698782811}}');
INSERT INTO `store` VALUES ('pad:\"+1+\":chat:0', '{\"text\":\"你好\",\"userId\":\"a.HKo4I2Mb9HVXfvWq\",\"time\":1450698800891}');
INSERT INTO `store` VALUES ('pad:\"+1+\":revs:22', '{\"changeset\":\"Z:y>1|1=s=5*2|1+1$\\n\",\"meta\":{\"author\":\"a.p63AFTFTCLjWrpyX\",\"timestamp\":1450698802030}}');
INSERT INTO `store` VALUES ('pad:\"+1+\":revs:23', '{\"changeset\":\"Z:z>2|2=y*2|2+2$\\n\\n\",\"meta\":{\"author\":\"a.p63AFTFTCLjWrpyX\",\"timestamp\":1450698802483}}');
INSERT INTO `store` VALUES ('pad:\"+1+\":revs:24', '{\"changeset\":\"Z:11>1|4=10*2|1+1$\\n\",\"meta\":{\"author\":\"a.p63AFTFTCLjWrpyX\",\"timestamp\":1450698802997}}');
INSERT INTO `store` VALUES ('pad:\"+1+\":revs:25', '{\"changeset\":\"Z:12>2|5=11*2+2$no\",\"meta\":{\"author\":\"a.p63AFTFTCLjWrpyX\",\"timestamp\":1450698803606}}');
INSERT INTO `store` VALUES ('pad:\"+1+\":revs:26', '{\"changeset\":\"Z:14>4|5=11=2*2+4$sdfm\",\"meta\":{\"author\":\"a.p63AFTFTCLjWrpyX\",\"timestamp\":1450698804074}}');
INSERT INTO `store` VALUES ('pad:\"+1+\":revs:27', '{\"changeset\":\"Z:18>2|5=11=6*2+2$s;\",\"meta\":{\"author\":\"a.p63AFTFTCLjWrpyX\",\"timestamp\":1450698804557}}');
INSERT INTO `store` VALUES ('pad:\"+1+\":revs:28', '{\"changeset\":\"Z:1a>1|5=11=8*2+1$f\",\"meta\":{\"author\":\"a.p63AFTFTCLjWrpyX\",\"timestamp\":1450698805057}}');
INSERT INTO `store` VALUES ('pad:\"+1+\":chat:1', '{\"text\":\"你好so\",\"userId\":\"a.p63AFTFTCLjWrpyX\",\"time\":1450698825243}');
INSERT INTO `store` VALUES ('pad:\"+1+\":chat:2', '{\"text\":\"nisodh\",\"userId\":\"a.p63AFTFTCLjWrpyX\",\"time\":1450698851467}');
INSERT INTO `store` VALUES ('pad:\"+1+\":revs:29', '{\"changeset\":\"Z:1b>1|5=11=9*1|1+1$\\n\",\"meta\":{\"author\":\"a.HKo4I2Mb9HVXfvWq\",\"timestamp\":1450698859579}}');
INSERT INTO `store` VALUES ('pad:\"+1+\":revs:31', '{\"changeset\":\"Z:1d<1|6=1b-1$\",\"meta\":{\"author\":\"a.HKo4I2Mb9HVXfvWq\",\"timestamp\":1450698862886}}');
INSERT INTO `store` VALUES ('pad:\"+1+\":revs:30', '{\"changeset\":\"Z:1c>1|6=1b*1+1$n\",\"meta\":{\"author\":\"a.HKo4I2Mb9HVXfvWq\",\"timestamp\":1450698862387}}');
INSERT INTO `store` VALUES ('pad:\"+1+\":revs:32', '{\"changeset\":\"Z:1c<1|5=11=9|1-1$\",\"meta\":{\"author\":\"a.HKo4I2Mb9HVXfvWq\",\"timestamp\":1450698863354}}');
INSERT INTO `store` VALUES ('pad:\"+1+\":revs:33', '{\"changeset\":\"Z:1b>2|5=11=9*1+2$你好\",\"meta\":{\"author\":\"a.HKo4I2Mb9HVXfvWq\",\"timestamp\":1450698868923}}');
INSERT INTO `store` VALUES ('sessionstorage:Od3_jc2y0zmo9OG3vzfW_TAwfrkXbdeh', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:yuTG-Hm3juoAIOowKqUg4HpKqEc_5kh2', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:KChmYJLJESHYEiGVLifnBRhkxW4_gIeB', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:18_IaSS92v5azrM57TXjQH2m8OA6qHXC', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:ff6ZRK5e7i853V6g17ozR6wtNCqIL33Z', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('pad:\"+1+\":revs:34', '{\"changeset\":\"Z:1d>2|5=11=b*3+2$df\",\"meta\":{\"author\":\"a.LNnwdmqyaJtzQNSy\",\"timestamp\":1450707078602}}');
INSERT INTO `store` VALUES ('pad:\"+1+\":revs:35', '{\"changeset\":\"Z:1f>4|5=11=d*3+4$gdfg\",\"meta\":{\"author\":\"a.LNnwdmqyaJtzQNSy\",\"timestamp\":1450707079094}}');
INSERT INTO `store` VALUES ('pad:\"+1+\":revs:36', '{\"changeset\":\"Z:1j>1|5=11=h*3+1$f\",\"meta\":{\"author\":\"a.LNnwdmqyaJtzQNSy\",\"timestamp\":1450707079599}}');
INSERT INTO `store` VALUES ('pad:\"+1+\":revs:37', '{\"changeset\":\"Z:1k>2|3=z*3+2$fg\",\"meta\":{\"author\":\"a.LNnwdmqyaJtzQNSy\",\"timestamp\":1450707087091}}');
INSERT INTO `store` VALUES ('pad:\"+1+\":revs:41', '{\"changeset\":\"Z:1v<1u|5-1c-i$\",\"meta\":{\"author\":\"a.LNnwdmqyaJtzQNSy\",\"timestamp\":1450707094576}}');
INSERT INTO `store` VALUES ('pad:\"+1+\":revs:38', '{\"changeset\":\"Z:1m>4|3=z=2*3+4$fgsf\",\"meta\":{\"author\":\"a.LNnwdmqyaJtzQNSy\",\"timestamp\":1450707087589}}');
INSERT INTO `store` VALUES ('pad:\"+1+\":revs:39', '{\"changeset\":\"Z:1q>3|3=z=6*3+3$sgf\",\"meta\":{\"author\":\"a.LNnwdmqyaJtzQNSy\",\"timestamp\":1450707088090}}');
INSERT INTO `store` VALUES ('pad:\"+1+\":revs:40', '{\"changeset\":\"Z:1t>2|3=z=9*3+2$sg\",\"meta\":{\"author\":\"a.LNnwdmqyaJtzQNSy\",\"timestamp\":1450707088591}}');
INSERT INTO `store` VALUES ('sessionstorage:AOaPvFJctcSOG0gMvG_TR0j6N-MSSAD7', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('pad:\"+1+\":revs:45', '{\"changeset\":\"Z:3<2-2$\",\"meta\":{\"author\":\"a.LNnwdmqyaJtzQNSy\",\"timestamp\":1450707142265}}');
INSERT INTO `store` VALUES ('pad:\"+1+\":revs:42', '{\"changeset\":\"Z:1>2*3+2$ji\",\"meta\":{\"author\":\"a.LNnwdmqyaJtzQNSy\",\"timestamp\":1450707140768}}');
INSERT INTO `store` VALUES ('pad:\"+1+\":revs:43', '{\"changeset\":\"Z:3>2=2*3+2$yu\",\"meta\":{\"author\":\"a.LNnwdmqyaJtzQNSy\",\"timestamp\":1450707141266}}');
INSERT INTO `store` VALUES ('pad:\"+1+\":revs:44', '{\"changeset\":\"Z:5<2=2-2$\",\"meta\":{\"author\":\"a.LNnwdmqyaJtzQNSy\",\"timestamp\":1450707141766}}');
INSERT INTO `store` VALUES ('pad:\"+1+\":revs:46', '{\"changeset\":\"Z:1>2*3+2$协同\",\"meta\":{\"author\":\"a.LNnwdmqyaJtzQNSy\",\"timestamp\":1450707145429}}');
INSERT INTO `store` VALUES ('pad:\"+1+\":revs:47', '{\"changeset\":\"Z:3>2=2*3+2$编辑\",\"meta\":{\"author\":\"a.LNnwdmqyaJtzQNSy\",\"timestamp\":1450707146657}}');
INSERT INTO `store` VALUES ('pad:\"+1+\":revs:48', '{\"changeset\":\"Z:5>2=4*3+2$技术\",\"meta\":{\"author\":\"a.LNnwdmqyaJtzQNSy\",\"timestamp\":1450707148860}}');
INSERT INTO `store` VALUES ('pad:\"+1+\":revs:49', '{\"changeset\":\"Z:7>2=6*3+2$研究\",\"meta\":{\"author\":\"a.LNnwdmqyaJtzQNSy\",\"timestamp\":1450707150175}}');
INSERT INTO `store` VALUES ('sessionstorage:Si594b6vt6RjpkvAJXRDYhwJ2LUm7dxk', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('pad:\"+1+\":revs:50', '{\"changeset\":\"Z:9>1*3*4*5*6*7+1$*\",\"meta\":{\"author\":\"a.LNnwdmqyaJtzQNSy\",\"timestamp\":1450707194645}}');
INSERT INTO `store` VALUES ('pad:\"+1+\":revs:51', '{\"changeset\":\"Z:a>0*8=1$\",\"meta\":{\"author\":\"a.LNnwdmqyaJtzQNSy\",\"timestamp\":1450707195931}}');
INSERT INTO `store` VALUES ('pad:\"+1+\":revs:52', '{\"changeset\":\"Z:a>0*9*7=1$\",\"meta\":{\"author\":\"a.LNnwdmqyaJtzQNSy\",\"timestamp\":1450707197395}}');
INSERT INTO `store` VALUES ('pad:\"+1+\":revs:53', '{\"changeset\":\"Z:a>0*8=1$\",\"meta\":{\"author\":\"a.LNnwdmqyaJtzQNSy\",\"timestamp\":1450707198074}}');
INSERT INTO `store` VALUES ('pad:\"+1+\":revs:54', '{\"changeset\":\"Z:a>0*a=1$\",\"meta\":{\"author\":\"a.LNnwdmqyaJtzQNSy\",\"timestamp\":1450707200172}}');
INSERT INTO `store` VALUES ('pad:\"+1+\":revs:55', '{\"changeset\":\"Z:a>0*8=1$\",\"meta\":{\"author\":\"a.LNnwdmqyaJtzQNSy\",\"timestamp\":1450707202109}}');
INSERT INTO `store` VALUES ('pad:\"+1+\":revs:56', '{\"changeset\":\"Z:a<1-1$\",\"meta\":{\"author\":\"a.LNnwdmqyaJtzQNSy\",\"timestamp\":1450707202609}}');
INSERT INTO `store` VALUES ('pad:\"+1+\":revs:57', '{\"changeset\":\"Z:9>0*b=8$\",\"meta\":{\"author\":\"a.LNnwdmqyaJtzQNSy\",\"timestamp\":1450707204868}}');
INSERT INTO `store` VALUES ('pad:\"+1+\":revs:58', '{\"changeset\":\"Z:9>0*c=8$\",\"meta\":{\"author\":\"a.LNnwdmqyaJtzQNSy\",\"timestamp\":1450707205809}}');
INSERT INTO `store` VALUES ('pad:\"+1+\":revs:59', '{\"changeset\":\"Z:9>0*d=8$\",\"meta\":{\"author\":\"a.LNnwdmqyaJtzQNSy\",\"timestamp\":1450707206887}}');
INSERT INTO `store` VALUES ('pad:\"+1+\":revs:60', '{\"changeset\":\"Z:9>0*e=8$\",\"meta\":{\"author\":\"a.LNnwdmqyaJtzQNSy\",\"timestamp\":1450707207871}}');
INSERT INTO `store` VALUES ('pad:\"+1+\":revs:61', '{\"changeset\":\"Z:9>0*f=8$\",\"meta\":{\"author\":\"a.LNnwdmqyaJtzQNSy\",\"timestamp\":1450707208710}}');
INSERT INTO `store` VALUES ('pad:\"+1+\":revs:62', '{\"changeset\":\"Z:9>0*g=8$\",\"meta\":{\"author\":\"a.LNnwdmqyaJtzQNSy\",\"timestamp\":1450707209377}}');
INSERT INTO `store` VALUES ('pad:\"+1+\":revs:63', '{\"changeset\":\"Z:9>0*h=8$\",\"meta\":{\"author\":\"a.LNnwdmqyaJtzQNSy\",\"timestamp\":1450707209876}}');
INSERT INTO `store` VALUES ('pad:\"+1+\":revs:64', '{\"changeset\":\"Z:9>0*i=8$\",\"meta\":{\"author\":\"a.LNnwdmqyaJtzQNSy\",\"timestamp\":1450707210376}}');
INSERT INTO `store` VALUES ('pad:\"+1+\":revs:65', '{\"changeset\":\"Z:9>1=8*0|1+1$\\n\",\"meta\":{\"author\":\"a.2dyclCKoZArslaZm\",\"timestamp\":1450707316764}}');
INSERT INTO `store` VALUES ('pad:\"+1+\":revs:68', '{\"changeset\":\"Z:e<4|1=9-4$\",\"meta\":{\"author\":\"a.2dyclCKoZArslaZm\",\"timestamp\":1450707319112}}');
INSERT INTO `store` VALUES ('pad:\"+1+\":revs:66', '{\"changeset\":\"Z:a>2|1=9*0+2$hu\",\"meta\":{\"author\":\"a.2dyclCKoZArslaZm\",\"timestamp\":1450707318113}}');
INSERT INTO `store` VALUES ('pad:\"+1+\":revs:67', '{\"changeset\":\"Z:c>2|1=9=2*0+2$na\",\"meta\":{\"author\":\"a.2dyclCKoZArslaZm\",\"timestamp\":1450707318613}}');
INSERT INTO `store` VALUES ('pad:\"+1+\":revs:72', '{\"changeset\":\"Z:b<1|1=9-1$\",\"meta\":{\"author\":\"a.2dyclCKoZArslaZm\",\"timestamp\":1450707321553}}');
INSERT INTO `store` VALUES ('pad:\"+1+\":revs:69', '{\"changeset\":\"Z:a>2|1=9*0+2$ji\",\"meta\":{\"author\":\"a.2dyclCKoZArslaZm\",\"timestamp\":1450707320053}}');
INSERT INTO `store` VALUES ('pad:\"+1+\":revs:70', '{\"changeset\":\"Z:c>1|1=9=2*0+1$n\",\"meta\":{\"author\":\"a.2dyclCKoZArslaZm\",\"timestamp\":1450707320554}}');
INSERT INTO `store` VALUES ('pad:\"+1+\":revs:71', '{\"changeset\":\"Z:d<2|1=9=1-2$\",\"meta\":{\"author\":\"a.2dyclCKoZArslaZm\",\"timestamp\":1450707321054}}');
INSERT INTO `store` VALUES ('pad:\"+1+\":revs:76', '{\"changeset\":\"Z:b<1|1=9-1$\",\"meta\":{\"author\":\"a.2dyclCKoZArslaZm\",\"timestamp\":1450707323591}}');
INSERT INTO `store` VALUES ('pad:\"+1+\":revs:73', '{\"changeset\":\"Z:a>2|1=9*0+2$ji\",\"meta\":{\"author\":\"a.2dyclCKoZArslaZm\",\"timestamp\":1450707322092}}');
INSERT INTO `store` VALUES ('pad:\"+1+\":revs:74', '{\"changeset\":\"Z:c>1|1=9=2*0+1$n\",\"meta\":{\"author\":\"a.2dyclCKoZArslaZm\",\"timestamp\":1450707322591}}');
INSERT INTO `store` VALUES ('pad:\"+1+\":revs:75', '{\"changeset\":\"Z:d<2|1=9=1-2$\",\"meta\":{\"author\":\"a.2dyclCKoZArslaZm\",\"timestamp\":1450707323091}}');
INSERT INTO `store` VALUES ('pad:\"+1+\":revs:77', '{\"changeset\":\"Z:a>2|1=9*0+2$尽情\",\"meta\":{\"author\":\"a.2dyclCKoZArslaZm\",\"timestamp\":1450707326939}}');
INSERT INTO `store` VALUES ('pad:\"+1+\":revs:78', '{\"changeset\":\"Z:c>2|1=9=2*0+2$编辑\",\"meta\":{\"author\":\"a.2dyclCKoZArslaZm\",\"timestamp\":1450707330689}}');
INSERT INTO `store` VALUES ('pad:\"+1+\":revs:79', '{\"changeset\":\"Z:e>1|1=9=4*0|1+1$\\n\",\"meta\":{\"author\":\"a.2dyclCKoZArslaZm\",\"timestamp\":1450707331673}}');
INSERT INTO `store` VALUES ('pad:\"+1+\":revs:80', '{\"changeset\":\"Z:f>1|2=e*0+1$吧\",\"meta\":{\"author\":\"a.2dyclCKoZArslaZm\",\"timestamp\":1450707332409}}');
INSERT INTO `store` VALUES ('pad:\"+1+\":revs:81', '{\"changeset\":\"Z:g<f|2-e-1$\",\"meta\":{\"author\":\"a.LNnwdmqyaJtzQNSy\",\"timestamp\":1450857088198}}');
INSERT INTO `store` VALUES ('sessionstorage:I0pzFGRAaxo4clpqsbYGfRP951lcdvMk', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:WepO1MeclFcmCSEXmtrdEk8WvUq49NSn', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:NO_jQx1v1D3oZNXeX-jpX3dgDMB3Qy_R', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:yhZjb9dFdxuJ33qrMHHe3b8isjjUdejW', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:3P3wsWpB8I-17R2qH-n5Guu1gK622Xso', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:j0AkVUH8GV8bVwa3gsnMMPchkwHCDgLE', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:dwOgaXrGQzyZrLjiaBbre1eVKFXvrFat', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:OP1JjGBCCx_rkUQtodozgZQzT9EPbfgO', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:UwpEtG5uZ1jJNj6dInq0gRRWkYVwOw26', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:VuH88bMO1KQTrEHr-_Nr8jhVEZHlo8FN', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:ZVdeyw2DWOPRdANJJgAx6a8OZzML4ADM', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:i_0g-h43ITQ0gB21adcPNYEDn1cOtsfp', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:zNRZkGrTk39qhMIoxSjULPlTGKxn4Z9h', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('pad2readonly:\"+11+\"', '\"r.f05e2902cdf6918d0caba945b7538810\"');
INSERT INTO `store` VALUES ('sessionstorage:mUnPufB6Lzbu2pW1Tu5x11WFCMfJhtxM', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('pad:\"+11+\"', '{\"atext\":{\"text\":\"*VV\\n\\n\",\"attribs\":\"*1*0*2*3+1*0+2|2+2\"},\"pool\":{\"numToAttrib\":{\"0\":[\"author\",\"a.84zWwWNyl6az1jLn\"],\"1\":[\"align\",\"center\"],\"2\":[\"insertorder\",\"first\"],\"3\":[\"lmkr\",\"1\"]},\"nextNum\":4},\"head\":2,\"chatHead\":-1,\"publicStatus\":false,\"passwordHash\":null,\"savedRevisions\":[]}');
INSERT INTO `store` VALUES ('sessionstorage:zm0ZRT-u-DIWm9JaWd3DODPJH5nLIKTT', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:Kr1DC3t-DimOMGbQcffgvvwK7pVgAc8z', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('pad:\"+11+\":revs:1', '{\"changeset\":\"Z:2>2*0+2$VV\",\"meta\":{\"author\":\"a.84zWwWNyl6az1jLn\",\"timestamp\":1451034059354}}');
INSERT INTO `store` VALUES ('readonly2pad:r.f05e2902cdf6918d0caba945b7538810', '\"\\\"+11+\\\"\"');
INSERT INTO `store` VALUES ('pad:\"+11+\":revs:0', '{\"changeset\":\"Z:1>1|1+1$\\n\",\"meta\":{\"author\":\"\",\"timestamp\":1451034042223,\"atext\":{\"text\":\"\\n\\n\",\"attribs\":\"|2+2\"}}}');
INSERT INTO `store` VALUES ('sessionstorage:xmDmqSB1aP3YMNPXZ4eM6v3M0lNUQ-bt', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:zHxYrqZIEHlQ7TtRB1cgdzc4JQr4P6Y9', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('pad:\"+11+\":revs:2', '{\"changeset\":\"Z:4>1*1*0*2*3+1$*\",\"meta\":{\"author\":\"a.84zWwWNyl6az1jLn\",\"timestamp\":1451034086493}}');
INSERT INTO `store` VALUES ('sessionstorage:qDjRKPkjemmrinqyRL8pEOliZD6N0wii', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:XKyjjqV2FbaZHqmd4YjT0D8EwTrFDQu7', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:dfYhm1Usbit6irjHSD-qItw7-BMdMi-Q', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:MICZV7j2AD2zrsfG6ADHJTpfTiXT7rDC', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:538vBiamUwsPG3OQ5RoyndBg-4Fu8nHf', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:i_6GIQ9ZSsY3iScHq3YWBVesZVRzuLCi', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true},\"user\":{\"password\":\"123456\",\"is_admin\":true,\"username\":\"admin\"}}');
INSERT INTO `store` VALUES ('sessionstorage:fk_DBUKB_ojh5VJtvoT_5zynCrnSp4OH', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:xbATFqaj-T0_-QFZKyI7lb-rsKsKVrsI', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('pad:\"+1+\":revs:82', '{\"changeset\":\"Z:1>z*j+z$http://115.24.12.3:9001/p/%22+1+%22\",\"meta\":{\"author\":\"a.84zWwWNyl6az1jLn\",\"timestamp\":1450857572956}}');
INSERT INTO `store` VALUES ('sessionstorage:Ew1uyYKR6R5aWjQZdCbgmKfAsRElBwu1', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:blfrUmfOQtF0ZQkPwWIO0SFC2efnA7MQ', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:3GEFPaAeRTyykw7I1wyD2M8dQL0JfAWG', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true},\"user\":{\"password\":\"123456\",\"is_admin\":true,\"username\":\"admin\"}}');
INSERT INTO `store` VALUES ('sessionstorage:exhR5E0_gQYLfvRrlEmadWzgW8yOtojX', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:j8VAprtVEukF3Rtf9RFwDlfD2isSmBxf', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true},\"user\":{\"password\":\"123456\",\"is_admin\":true,\"username\":\"admin\"}}');
INSERT INTO `store` VALUES ('sessionstorage:pm5lvGwrr2y7s3rOWlpEuhBmEuCXQVwO', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true},\"user\":{\"password\":\"123456\",\"is_admin\":true,\"username\":\"admin\"}}');
INSERT INTO `store` VALUES ('token2author:t.wH18JJG9e36Nhpc39nan', '\"a.vi3YmjxdiMkNjs2R\"');
INSERT INTO `store` VALUES ('globalAuthor:a.vi3YmjxdiMkNjs2R', '{\"colorId\":7,\"name\":null,\"timestamp\":1450921259378}');
INSERT INTO `store` VALUES ('sessionstorage:UPehUjYpJt-fzFLT-FxAVRmgYDY7H9mx', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true},\"user\":{\"password\":\"123456\",\"is_admin\":true,\"username\":\"admin\"}}');
INSERT INTO `store` VALUES ('sessionstorage:SClxM9Jm8PEUs9M74zLRhxI6kkkKTbZA', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:TgGP2waFw8luU6MlnCS3sItg6Ubsq3YE', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:ycDys-m-r2oc_37fJZzCna0vJ47xW0Ob', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:_md46ifAMGkY3WwqSxPVX2LWFgFwh3ee', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:nFpgITy43OggvFDjPBuoFwgALM2TJKTL', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true},\"user\":{\"password\":\"123456\",\"is_admin\":true,\"username\":\"admin\"}}');
INSERT INTO `store` VALUES ('sessionstorage:AAPGZNNNTGxNpO_7e9layifCfESliTjk', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:oLYae6oPtGcHIGYoC26VOSiOEvGBy_A8', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:fOBR2TWLGDTh5avREPFycjPnaA_laXhQ', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('pad:1:revs:1', '{\"changeset\":\"Z:2>3|1=1*0+3$凤飞飞\",\"meta\":{\"author\":\"a.84zWwWNyl6az1jLn\",\"timestamp\":1451049033796}}');
INSERT INTO `store` VALUES ('comments:1', '{\"c-Y6126l7mqNtjRfuN\":{\"author\":\"a.84zWwWNyl6az1jLn\",\"name\":\"Anonymous\",\"text\":\"凤飞飞\",\"timestamp\":1451049038376},\"c-x9PYnzhWJLAbXCOi\":{\"author\":\"a.84zWwWNyl6az1jLn\",\"name\":\"Anonymous\",\"text\":\"你好\",\"timestamp\":1451133023264},\"c-3wjEYGFcBwA4LfYk\":{\"author\":\"a.SbEYQkqWmUTpApSd\",\"name\":\"Anonymous\",\"text\":\"ninhao\",\"timestamp\":1451180602890},\"c-veZI01hObJxSP5sV\":{\"author\":\"a.84zWwWNyl6az1jLn\",\"name\":\"Anonymous\",\"text\":\"格式\",\"timestamp\":1451188877691},\"c-qpQjqFXryai6EMKZ\":{\"author\":\"a.Oulp16tJikXXTyQP\",\"name\":\"Anonymous\",\"text\":\"写好\",\"timestamp\":1451265682196},\"c-LgDHPxiOLREeKbwo\":{\"author\":\"a.HKo4I2Mb9HVXfvWq\",\"name\":\"201422404012\",\"text\":\"写的不错\",\"timestamp\":1451302237348},\"c-sXCEI4VGe08vs2uk\":{\"author\":\"a.HKo4I2Mb9HVXfvWq\",\"name\":\"201422404012\",\"text\":\"修改题目\",\"changeTo\":\"研究与展望\",\"changeFrom\":\"研究展望\\n\",\"timestamp\":1451302326242},\"c-lW1mV1Twk2fM9wNH\":{\"author\":\"a.p63AFTFTCLjWrpyX\",\"name\":\"test\",\"text\":\"字体更改\",\"changeTo\":\"大写字\",\"changeFrom\":\"第七章   总结\\n\",\"timestamp\":1451302460229},\"c-zTffARHbciL7Naqm\":{\"author\":\"a.PwQZUjZNF9w2QhgQ\",\"name\":\"Anonymous\",\"text\":\"饭店等等\",\"changeTo\":\"绪论介绍\",\"changeFrom\":\"第一章：绪论\\n\",\"timestamp\":1451304134502,\"changeAccepted\":true,\"changeReverted\":false}}');
INSERT INTO `store` VALUES ('pad:1:revs:2', '{\"changeset\":\"Z:5>0|1=1*1=3$\",\"meta\":{\"author\":\"a.84zWwWNyl6az1jLn\",\"timestamp\":1451049038433}}');
INSERT INTO `store` VALUES ('pad:1:revs:3', '{\"changeset\":\"Z:5>1|1=1=3*0*1+1$、\",\"meta\":{\"author\":\"a.84zWwWNyl6az1jLn\",\"timestamp\":1451049041553}}');
INSERT INTO `store` VALUES ('pad:1:revs:4', '{\"changeset\":\"Z:6<1|1=1=3-1$\",\"meta\":{\"author\":\"a.84zWwWNyl6az1jLn\",\"timestamp\":1451049042478}}');
INSERT INTO `store` VALUES ('pad:1:revs:5', '{\"changeset\":\"Z:5>1|1=1=3*0|1+1$\\n\",\"meta\":{\"author\":\"a.84zWwWNyl6az1jLn\",\"timestamp\":1451049042981}}');
INSERT INTO `store` VALUES ('sessionstorage:EPHMPPemnOuyT1K3O_UjwKb-Sj0JSEcw', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:3DBOai317dvxD7BVmaZjFNC1LEsAzDsJ', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:4XKe8vMtL2O9EuOqyGiizwjsTyZZ3Fmb', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:rqJxChtXf1My-xfX8Zm1tKJ4jIJTobkx', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:p1HHyMOXL76hTmFTpdck539c01aHEy8c', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:y9dcGCMbgeuYkrjb3oBzmtLRADojSiO2', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:SiE7ZwwYoAd-1ZWOwBWZx1vlBuudb6XC', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:WyghLyTl39Md551McchPPZmZ2SSljPIp', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:IcF7Ixje-riYJGD6tXjzizzoZ2mcO7d3', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('pad:1:revs:30', '{\"changeset\":\"Z:5<3=1-3$\",\"meta\":{\"author\":\"a.SbEYQkqWmUTpApSd\",\"timestamp\":1451188563928}}');
INSERT INTO `store` VALUES ('pad:1:revs:31', '{\"changeset\":\"Z:2<1-1$\",\"meta\":{\"author\":\"a.SbEYQkqWmUTpApSd\",\"timestamp\":1451188564427}}');
INSERT INTO `store` VALUES ('pad:1:revs:32', '{\"changeset\":\"Z:1>6*c+6$面向科研协作\",\"meta\":{\"author\":\"a.SbEYQkqWmUTpApSd\",\"timestamp\":1451188570121}}');
INSERT INTO `store` VALUES ('pad:1:revs:33', '{\"changeset\":\"Z:7>1=6*c+1$的\",\"meta\":{\"author\":\"a.SbEYQkqWmUTpApSd\",\"timestamp\":1451188570636}}');
INSERT INTO `store` VALUES ('pad:1:revs:34', '{\"changeset\":\"Z:8>2=7*c+2$协同\",\"meta\":{\"author\":\"a.SbEYQkqWmUTpApSd\",\"timestamp\":1451188576486}}');
INSERT INTO `store` VALUES ('pad:1:revs:36', '{\"changeset\":\"Z:d<1=b-1$\",\"meta\":{\"author\":\"a.SbEYQkqWmUTpApSd\",\"timestamp\":1451188578841}}');
INSERT INTO `store` VALUES ('pad:1:revs:35', '{\"changeset\":\"Z:a>3=9*c+3$便技术\",\"meta\":{\"author\":\"a.SbEYQkqWmUTpApSd\",\"timestamp\":1451188578342}}');
INSERT INTO `store` VALUES ('pad:1:revs:37', '{\"changeset\":\"Z:c<2=9-2$\",\"meta\":{\"author\":\"a.SbEYQkqWmUTpApSd\",\"timestamp\":1451188579356}}');
INSERT INTO `store` VALUES ('pad:1:revs:38', '{\"changeset\":\"Z:a>4=9*c+4$编辑技术\",\"meta\":{\"author\":\"a.SbEYQkqWmUTpApSd\",\"timestamp\":1451188590619}}');
INSERT INTO `store` VALUES ('pad:1:revs:39', '{\"changeset\":\"Z:e>2=d*c+2$研究\",\"meta\":{\"author\":\"a.SbEYQkqWmUTpApSd\",\"timestamp\":1451188592257}}');
INSERT INTO `store` VALUES ('pad:1:revs:40', '{\"changeset\":\"Z:g>3=f*c+3$与实现\",\"meta\":{\"author\":\"a.SbEYQkqWmUTpApSd\",\"timestamp\":1451188594644}}');
INSERT INTO `store` VALUES ('pad:1:revs:41', '{\"changeset\":\"Z:j>1=i*c|1+1$\\n\",\"meta\":{\"author\":\"a.SbEYQkqWmUTpApSd\",\"timestamp\":1451188595159}}');
INSERT INTO `store` VALUES ('pad:1:revs:42', '{\"changeset\":\"Z:k>3|1=j*c+3$第一张\",\"meta\":{\"author\":\"a.SbEYQkqWmUTpApSd\",\"timestamp\":1451188598185}}');
INSERT INTO `store` VALUES ('pad:1:revs:43', '{\"changeset\":\"Z:n<1|1=j=2-1$\",\"meta\":{\"author\":\"a.SbEYQkqWmUTpApSd\",\"timestamp\":1451188598685}}');
INSERT INTO `store` VALUES ('pad:1:revs:44', '{\"changeset\":\"Z:m>1|1=j=2*c+1$章\",\"meta\":{\"author\":\"a.SbEYQkqWmUTpApSd\",\"timestamp\":1451188600635}}');
INSERT INTO `store` VALUES ('pad:1:revs:45', '{\"changeset\":\"Z:n>1|1=j=3*c+1$：\",\"meta\":{\"author\":\"a.SbEYQkqWmUTpApSd\",\"timestamp\":1451188601134}}');
INSERT INTO `store` VALUES ('pad:1:revs:46', '{\"changeset\":\"Z:o>2|1=j=4*c+2$绪论\",\"meta\":{\"author\":\"a.SbEYQkqWmUTpApSd\",\"timestamp\":1451188605299}}');
INSERT INTO `store` VALUES ('pad:1:revs:47', '{\"changeset\":\"Z:q>1|1=j=6*c|1+1$\\n\",\"meta\":{\"author\":\"a.SbEYQkqWmUTpApSd\",\"timestamp\":1451188605814}}');
INSERT INTO `store` VALUES ('pad:1:revs:48', '{\"changeset\":\"Z:r>3|2=q*c+3$第二章\",\"meta\":{\"author\":\"a.SbEYQkqWmUTpApSd\",\"timestamp\":1451188608871}}');
INSERT INTO `store` VALUES ('pad:1:revs:49', '{\"changeset\":\"Z:u>1|2=q=3*c+1$：\",\"meta\":{\"author\":\"a.SbEYQkqWmUTpApSd\",\"timestamp\":1451188609901}}');
INSERT INTO `store` VALUES ('pad:1:revs:50', '{\"changeset\":\"Z:v>2|2=q=4*c+2$关键\",\"meta\":{\"author\":\"a.SbEYQkqWmUTpApSd\",\"timestamp\":1451188612319}}');
INSERT INTO `store` VALUES ('pad:1:revs:51', '{\"changeset\":\"Z:x>2|2=q=6*c+2$技术\",\"meta\":{\"author\":\"a.SbEYQkqWmUTpApSd\",\"timestamp\":1451188613302}}');
INSERT INTO `store` VALUES ('pad:1:revs:52', '{\"changeset\":\"Z:z>1|2=q=8*c|1+1$\\n\",\"meta\":{\"author\":\"a.SbEYQkqWmUTpApSd\",\"timestamp\":1451188614347}}');
INSERT INTO `store` VALUES ('pad:1:revs:53', '{\"changeset\":\"Z:10>3|3=z*c+3$第三章\",\"meta\":{\"author\":\"a.SbEYQkqWmUTpApSd\",\"timestamp\":1451188617155}}');
INSERT INTO `store` VALUES ('pad:1:revs:54', '{\"changeset\":\"Z:13>1|3=z=3*c+1$：\",\"meta\":{\"author\":\"a.SbEYQkqWmUTpApSd\",\"timestamp\":1451188618013}}');
INSERT INTO `store` VALUES ('pad:1:revs:55', '{\"changeset\":\"Z:14>2|3=z=4*c+2$协同\",\"meta\":{\"author\":\"a.SbEYQkqWmUTpApSd\",\"timestamp\":1451188627794}}');
INSERT INTO `store` VALUES ('pad:1:revs:56', '{\"changeset\":\"Z:16>2|3=z=6*c+2$编辑\",\"meta\":{\"author\":\"a.SbEYQkqWmUTpApSd\",\"timestamp\":1451188628746}}');
INSERT INTO `store` VALUES ('pad:1:revs:59', '{\"changeset\":\"Z:19<1|3=z=8-1$\",\"meta\":{\"author\":\"a.SbEYQkqWmUTpApSd\",\"timestamp\":1451188637669}}');
INSERT INTO `store` VALUES ('pad:1:revs:57', '{\"changeset\":\"Z:18>2|3=z=8*c+2$技术\",\"meta\":{\"author\":\"a.SbEYQkqWmUTpApSd\",\"timestamp\":1451188633816}}');
INSERT INTO `store` VALUES ('pad:1:revs:58', '{\"changeset\":\"Z:1a<1|3=z=9-1$\",\"meta\":{\"author\":\"a.SbEYQkqWmUTpApSd\",\"timestamp\":1451188637154}}');
INSERT INTO `store` VALUES ('pad:1:revs:60', '{\"changeset\":\"Z:18>2|3=z=8*c+2$原理\",\"meta\":{\"author\":\"a.SbEYQkqWmUTpApSd\",\"timestamp\":1451188640118}}');
INSERT INTO `store` VALUES ('pad:1:revs:61', '{\"changeset\":\"Z:1a>1|3=z=a*c|1+1$\\n\",\"meta\":{\"author\":\"a.SbEYQkqWmUTpApSd\",\"timestamp\":1451188642255}}');
INSERT INTO `store` VALUES ('pad:1:revs:62', '{\"changeset\":\"Z:1b>3|4=1a*c+3$第四章\",\"meta\":{\"author\":\"a.SbEYQkqWmUTpApSd\",\"timestamp\":1451188644783}}');
INSERT INTO `store` VALUES ('pad:1:revs:63', '{\"changeset\":\"Z:1e>1|4=1a=3*c+1$：\",\"meta\":{\"author\":\"a.SbEYQkqWmUTpApSd\",\"timestamp\":1451188645999}}');
INSERT INTO `store` VALUES ('pad:1:revs:64', '{\"changeset\":\"Z:1f>2|4=1a=4*c+2$协同\",\"meta\":{\"author\":\"a.SbEYQkqWmUTpApSd\",\"timestamp\":1451188647825}}');
INSERT INTO `store` VALUES ('pad:1:revs:65', '{\"changeset\":\"Z:1h>2|4=1a=6*c+2$编辑\",\"meta\":{\"author\":\"a.SbEYQkqWmUTpApSd\",\"timestamp\":1451188648917}}');
INSERT INTO `store` VALUES ('pad:1:revs:66', '{\"changeset\":\"Z:1j>2|4=1a=8*c+2$技术\",\"meta\":{\"author\":\"a.SbEYQkqWmUTpApSd\",\"timestamp\":1451188650617}}');
INSERT INTO `store` VALUES ('pad:1:revs:67', '{\"changeset\":\"Z:1l>1|4=1a=a*c|1+1$\\n\",\"meta\":{\"author\":\"a.SbEYQkqWmUTpApSd\",\"timestamp\":1451188655266}}');
INSERT INTO `store` VALUES ('pad:1:revs:68', '{\"changeset\":\"Z:1m>3|5=1l*c+3$第五章\",\"meta\":{\"author\":\"a.SbEYQkqWmUTpApSd\",\"timestamp\":1451188658027}}');
INSERT INTO `store` VALUES ('pad:1:revs:69', '{\"changeset\":\"Z:1p>1|5=1l=3*c+1$：\",\"meta\":{\"author\":\"a.SbEYQkqWmUTpApSd\",\"timestamp\":1451188659213}}');
INSERT INTO `store` VALUES ('pad:1:revs:6', '{\"changeset\":\"Z:6<5|3-6|1+1$\\n\",\"meta\":{\"author\":\"\",\"timestamp\":1451098186463}}');
INSERT INTO `store` VALUES ('pad:1:revs:7', '{\"changeset\":\"Z:1>1ps|18+1ch*2*3*4+1|1+2q*2*3*4+1|1+5*2*3*4+1|1+27*2*3*4+1|a+85$                       \\n   \\n需求书\\n   \\n简单写一下需求：\\n   \\n用户端A：适合用人群：密集聚集的人群，例如辅导机构，公司等\\n   \\n用户端B：商家，主要针对美食城应用，美食城的特点就是多档口，多经营商，\\n   \\n此平台的作用就要求将整个美食城打包放置在平台上，而不是独立档口体现。\\n   \\n我有头有一套微信订餐的源码，用php写的，基本功能已经有了，可以实现用户下单，商家打印小票配送。\\n   \\n他的问题在于是单店模式，无法实现将来规模的扩大，也就是说所有的信息发布只能发布在一个店铺中，我要求您改动的是：\\n   \\n1.需要多店模式。该套源码有初次使用短信验证的功能，这个要保留，防止恶意下单，\\n   \\n2. 实现这个功能我要引入一个“堆”的概念，我将来从成本出发，不会做散户，上段说的系统给用户的值，那么相等的值就可以把他们化成一个“堆”，例如如果将来某个公司，所有用户的地址可能写法有所区别，但是他们在设置的时候要求他们选择“堆”与“组”，“堆”就是配送点的信息，例如整个24层，而“组”就是他们的具体的部门或者班组代号。于是将来所有用户的配送位置信息要用“堆”和“组”来描述。\\n   \\n我需要根据用户所在的区域给他设定一个默认的值，这个值要有两种可修改的途径，一个是在短信验证后他自动归“堆”，另一个就是我可以在后台自己给他设置，这个值就是用来划分该用户的权限，例如他是山西大学的学生，我就只能让他看见我一个美食城的全部菜单，而不会看到距离他很远的美食城的菜单。\\n   \\n而新用户要求他自己设置新地址，后台有提示，在他之后，其他人选择地址的列表里会出现该用户曾经写出的值，也就是说，因为新的用户的注册，新的“堆“和“组”创建了。\\n   \\n\\n   \\n3美食城每个档口经营的东西种类不一样，我要求用户看到的菜单会有最基本的分类，并且是打包的，比如炒菜类，盖饭类，面食类等等（可后台自主添加）用户看到的炒菜类里面，会出现所有的档口可以做出来的菜品，但是我后台打印出小票以及结算的时候，我要能从用户点的菜品中获知哪些菜品是哪个档口提供的，例如，我在炒菜类点了，宫保鸡丁，鱼香肉丝，商家打印出来的小票（该小票用于备餐）上边会写着，宫保鸡丁来自“A档口”，鱼香肉丝来自“B档口”，结算的时候也是如此，后台要把一个用户消费30块钱的单子自动根据菜品来源记录到各个档口的账目下，这个钱也要后台分配记账。而最终给用户送到手里的小票要隐藏这些信息，只显示宫保鸡丁，鱼香肉丝的分别价格以及总价。\\n   \\n后台价格这栏要设置好利润分配：\\n   \\n例如：一份米饭成本为3元，而用户看到的是3.5元，但是后台分配到此米饭来源的窗口则依然是3元。\\n   \\n4.关于用户的订单，要求可设定收单时间，例如可在后台设置下单截止时间为上午10点30，之后用户不可选餐。这个功能是基于我将要点对点营销的模式，百度等外卖定价较高，所以它对于散户点单，任意时刻选购都是可以的，无非就是多跑一趟或者推迟时间送到，而我在10点30关闭订餐系统后，牺牲小部分用户，但是11点20左右可以将所有订单准备完毕，11点40左右一次性送到，不拖泥带水。\\n   \\n\\n   \\n很抱歉，我没有做过需求书，很尽力在描述我所有的构想，下边在从使用者描述一下所要的功能。\\n   \\n\\n   \\n下面从用户体验和商家两方面来描述一下所有功能，一个用户在每天晚上6点到第二天上午10点30之间（可后台设置）可以预定第二天午餐，还可以在订餐中附加特殊要求（不要葱蒜之类，此功能源码中有，留存），默认都是11点40送到，餐到后，用户可评论菜品质量味道，并可以把此公众号的二维码推荐转发给朋友或者朋友圈，如果有其他人根据他分享的这个二维码成功订餐（不知道现在php开发有没有在二维码中包含进去用户信息的同时还可以依然扫描出我的公众号），该用户将收到系统自动发放的代金券（后台可设）。此用户本次订餐完成。\\n   \\n商家这端，可以通过微信后台推送文档，这个功能源码有的。将来合作的商家合作范围会控制在一个美食城之内，并且我会有一个固定的档口专门与我合作，也就是说10点30分关闭订餐系统后，该档口立刻可以打印出两个票据：\\n       \\n*在本美食城订购的所有清单，并且根据之前设置的菜品来源分类，比如今天不同的用户订购了3份炒菜，那么打印出来的清单上，就会标记出这3份炒菜应该由“A”提供，那么该员工将把这些分类小票发放到对应档口。\\n*    \\n*按照“堆”和“组”分别打印出汇总的信息，例如“三人行”这个机构这个“堆”中每个“组”所点的菜品份数，这张小票就完整了。其他机构或者点的小票也是类似。    \\n*      \\n\\n   \\n    为描述生动，我形容一下具体这两张票的用处，根据上述1这个清单，将该小票撕开对应部分放到对应档口，让其准备所订购的菜品。11点时候，根据2这个清单，按照“堆”设配送框，开始向所有档口要2清单上所有列出的菜品。例如“三人行”放一个框中，所有档口走一圈，拿完“三人行”所需的，再根据“组”分别装袋，但是都还在“三人行”这个框内，此时“三人行”完成配餐，等待送货。“新东方”教育机构另用一个框，根据2这个清单继续在所有档口前边走一圈，按照2中所有菜品清单，拿全所有的配货。类似这样的循环几次，把2中固定的几个点的订单全部准备完毕。\\n   \\n\\n   \\n\\n  \\n \\n\",\"meta\":{\"author\":\"\",\"timestamp\":1451098186464}}');
INSERT INTO `store` VALUES ('sessionstorage:Fw0vIybq0d6mSzKeBqjX9A4ZtiMWwcYe', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true},\"user\":{\"password\":\"123456\",\"is_admin\":true,\"username\":\"admin\"}}');
INSERT INTO `store` VALUES ('sessionstorage:_QrQGCAyxmiXBILm4MRJRQWLqMGQ3-6q', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true},\"user\":{\"password\":\"123456\",\"is_admin\":true,\"username\":\"admin\"}}');
INSERT INTO `store` VALUES ('sessionstorage:-PG43mFJR0FaoAo4hJQQkQaKNBKZz9L5', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:r8OUusGAYM4nugH_lT0DroCbsGDmiFOd', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true},\"user\":{\"password\":\"123456\",\"is_admin\":true,\"username\":\"admin\"}}');
INSERT INTO `store` VALUES ('sessionstorage:qbuOPIqsSs_6vzZzRA7zRY-Xk2m1tD_l', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:apJKDpcaxkAhDUxCind2wneLOA-j7rXw', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:eww_ZaCCGMGDFwNZHLuoisCPzVrGVrP2', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('pad:\"+1+\":revs:83', '{\"changeset\":\"Z:10<z-z$\",\"meta\":{\"author\":\"a.LNnwdmqyaJtzQNSy\",\"timestamp\":1451131889969}}');
INSERT INTO `store` VALUES ('sessionstorage:7O7PDzZ2bpmMg5M8g04p1klLGC69s42V', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:lsc74embg_-H5vLjH1PKdVzzlvrm6Zzf', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('pad:1:revs:27', '{\"changeset\":\"Z:223<222|3q-222$\",\"meta\":{\"author\":\"a.SbEYQkqWmUTpApSd\",\"timestamp\":1451188559466}}');
INSERT INTO `store` VALUES ('pad:1:revs:18', '{\"changeset\":\"Z:1px>1|6=1a*9*a*2*4+1$*\",\"meta\":{\"author\":\"a.2dyclCKoZArslaZm\",\"timestamp\":1451177673383}}');
INSERT INTO `store` VALUES ('pad:\"+3+\":revs:1', '{\"changeset\":\"Z:2<1|2-2|1+1$\\n\",\"meta\":{\"author\":\"\",\"timestamp\":1451132016858}}');
INSERT INTO `store` VALUES ('pad:\"+3+\":revs:2', '{\"changeset\":\"Z:1>7d|a+7d$                       \\n   \\n工作地点：湖东电力、侯马北机务段，太原、太原北、侯马北车辆段，侯马北供电段等学历要求：本科及以上专业要求：电气工程及其自动化、电气工程、电路与系统等铁路电气化、供电、自动化、轨道牵引方向外语要求：无要求开始时间：2015-09-06截止时间：2015-09-20其他要求：其他：   版权所有：太原铁路局\\n  地址：山西省太原市建设北路185号  邮箱：tytljrsc@163.com  联系电话：0351-2621510  2625741\\n   \\n\\n   \\n\\n  \\n \\n\",\"meta\":{\"author\":\"\",\"timestamp\":1451132016858}}');
INSERT INTO `store` VALUES ('sessionstorage:UDi2sCRrqJlwM7yXiA1iLE0lqiHBmKXF', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:tznwk1zRt8ThbpJXsn3b5ayjC_MQiuNS', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:or9hCzHxgUQ3NDcBqW_CoQiGB317dKth', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:Sx7nj0GaTnrrrMwZ4cnUGpnSWyH5I2OA', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:NWl9uFKZnvQ5nYyXJyvGUjGpoZd5vVf2', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:Bs8M8RkpXLbCbwflDRJNuUfHDyaH7sUg', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:uGaFSKseLj_NaXkVPzk2L4C6K-Kc4zt3', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:Tg_ozIfEhDzzidb8ru16aGZAs_Kc4lAq', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:uIGkK5pMjZxrqCitT2IV9Cotaqny-KE9', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:bgkVRgapgfsVA1aOpBji0hTtsgbY82qf', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:z8E6QzJTzngvYfxc5DpgTG9-vZCWIsJm', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:bq-oSmIIgmOgsdQaFyzMBCDPNtvcVSO9', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('pad:\"+3+\":revs:3', '{\"changeset\":\"Z:7e<7d|b-7e|1+1$\\n\",\"meta\":{\"author\":\"\",\"timestamp\":1451132113268}}');
INSERT INTO `store` VALUES ('pad:\"+3+\":revs:4', '{\"changeset\":\"Z:1>pv|9+pv$                     \\n   \\n创新创业大赛项目申报表\\n   \\n项目名称：E•B&I网站构建申报类别：○技术  ○服务  ○其他项目团队名称：（个人参赛者可不填）EBI创团参赛团队姓 名性 别年 龄公 寓专业（学历）联系方式负责人孙瑞瑞男24文瀛九斋研究生，计算机科学学院15513094702成员1耿丽珠女20令德一斋本科，经济与管理学院15535370236成员2田宇婷女20文瀛十五斋本科，外国语学院15735158360毋一帆  男  19  令德九斋  本科，物理电子学院  18435164406            黄小祥  男  17  令德八斋本科，化学化工学院  18435189189项目概述：    创建一个EBI平台，即Exchange·Book&information平台，致力于同城交易图书，当天交易，当天收货，初期提供针对山西大学学生及校园周边中小型书店发布图书，及图书交易平台并兼和虚拟社区交流服务，中后期可渐扩大会员数量，面向太原市各个高校。市场前景预测与可行性分析：    1.可行性分析：技术人员具备，有山西大学平台支持，并与山西大学图书馆建立长期战略合作关系，有着技术部部长技术指导，主要针对大学生所需的考证工具书，当天即可收货，致力于同城交易，且每个人都是发布者，也是收货者，都可以进入管理端，基于山大官网端可靠性高，有着虚拟社区平台，学生可以集“交易，交流，交友，学习”于一体。    2.市场前景预测：现在消费者尤其是大学生越来越注重需求的情感化，内容的个性化，价值的过程化，动机的道德化，基于山大官网，致力于同城交易，当天收货，学生购书更加便捷，并且提供交流学习平台，可以吸引大量大学生为会员，对于商家来说，我公司提供免费发布图书信息的平台，可以减轻近年来中国“新常态”对小型公司的冲击，也可吸引大量商家入驻本公司。备注（可阐述团队实践经历及团队能力等）：   团队有着高度创业的激情，技术团队力量强大，有着校图书馆技术部部长大力支持。创业资金计算：   防病毒软件300+网上推广15000+网下推广20000=共计35300学校意见（盖章）：组委会意见（委盖章）：\\n   \\n\\n  \\n \\n\",\"meta\":{\"author\":\"\",\"timestamp\":1451132113268}}');
INSERT INTO `store` VALUES ('sessionstorage:oY8tJZkimyTaDh-Uhsz9B7_MzT8evnt9', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:ymcYUvliQ6lva34nZkGplmegR_cE-DIA', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:_u-uOe9YWnxpdaTTfzHcM4Jh2UpcVIJx', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:z8vP4oAbu9Iyv4NAABQODHF6iZQue8OR', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:QS6VUPrYp4-RYeBK2UQMPGBwQa3h4_QK', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:I0nU9aNjddfF59RWlsAhx_oyLxPgPob3', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:c2MzqDFGRQpltMxGIvVZhKgOTGX6Khag', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:IJhZLvFpfs1tZ9rmIXITEEtMPHXab--q', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:nviE6aqO83RXytyqBZZw9K_a0QbKiGTb', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:shfkmn3WN2OfR_M9WdlepdUpTLgB_gWx', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('pad:\"+1+\":revs:85', '{\"changeset\":\"Z:1pv<1pu|1n-1pu$\",\"meta\":{\"author\":\"a.LNnwdmqyaJtzQNSy\",\"timestamp\":1451133957378}}');
INSERT INTO `store` VALUES ('pad:\"+1+\":revs:86', '{\"changeset\":\"Z:1>1*3+1$l\",\"meta\":{\"author\":\"a.LNnwdmqyaJtzQNSy\",\"timestamp\":1451133966145}}');
INSERT INTO `store` VALUES ('pad:\"+1+\":revs:87', '{\"changeset\":\"Z:2>2=1*3+2$un\",\"meta\":{\"author\":\"a.LNnwdmqyaJtzQNSy\",\"timestamp\":1451133966644}}');
INSERT INTO `store` VALUES ('pad:\"+1+\":revs:88', '{\"changeset\":\"Z:4<1=2-1$\",\"meta\":{\"author\":\"a.LNnwdmqyaJtzQNSy\",\"timestamp\":1451133968750}}');
INSERT INTO `store` VALUES ('pad:\"+1+\":revs:89', '{\"changeset\":\"Z:3<2-2$\",\"meta\":{\"author\":\"a.LNnwdmqyaJtzQNSy\",\"timestamp\":1451133969249}}');
INSERT INTO `store` VALUES ('pad:\"+1+\":revs:90', '{\"changeset\":\"Z:1>2*3+2$论文\",\"meta\":{\"author\":\"a.LNnwdmqyaJtzQNSy\",\"timestamp\":1451133972135}}');
INSERT INTO `store` VALUES ('pad:\"+1+\":revs:91', '{\"changeset\":\"Z:3>2=2*3+2$题目\",\"meta\":{\"author\":\"a.LNnwdmqyaJtzQNSy\",\"timestamp\":1451133983773}}');
INSERT INTO `store` VALUES ('pad:\"+1+\":revs:92', '{\"changeset\":\"Z:5>1=4*3+1$：\",\"meta\":{\"author\":\"a.LNnwdmqyaJtzQNSy\",\"timestamp\":1451133985348}}');
INSERT INTO `store` VALUES ('pad:\"+1+\":revs:93', '{\"changeset\":\"Z:6>1=5*3|1+1$\\n\",\"meta\":{\"author\":\"a.LNnwdmqyaJtzQNSy\",\"timestamp\":1451133985848}}');
INSERT INTO `store` VALUES ('pad:\"+1+\":revs:94', '{\"changeset\":\"Z:7>1*3*4*5*6*7+1$*\",\"meta\":{\"author\":\"a.LNnwdmqyaJtzQNSy\",\"timestamp\":1451134018608}}');
INSERT INTO `store` VALUES ('pad:\"+1+\":revs:95', '{\"changeset\":\"Z:8>0*8=1$\",\"meta\":{\"author\":\"a.LNnwdmqyaJtzQNSy\",\"timestamp\":1451134019232}}');
INSERT INTO `store` VALUES ('pad:\"+1+\":revs:96', '{\"changeset\":\"Z:8>0=1*e=5$\",\"meta\":{\"author\":\"a.LNnwdmqyaJtzQNSy\",\"timestamp\":1451134020277}}');
INSERT INTO `store` VALUES ('pad:\"+1+\":revs:97', '{\"changeset\":\"Z:8>0=1*f=5$\",\"meta\":{\"author\":\"a.LNnwdmqyaJtzQNSy\",\"timestamp\":1451134020948}}');
INSERT INTO `store` VALUES ('sessionstorage:N_mV_jEmCmCCD1VmKIGo0YUtXZJwUY5T', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:eqIkZHGubaE2wWbJhcgcP9AH2Dw64lyf', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:x5gYx7QOhUxgB-Zv91l4s8QLDCVcfCxu', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:8-cQeq8LnPgbCQgsvp59jFFgvQrJ928q', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:6WCqQPk19XH3CKMLgKyafy8ngvnLVMn6', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:qurd3l1xy5sVO8twBX5CjpGRqvaFTD4U', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:Vtq6c6O_w2hf3H6OtqodODo2V5W4DN8l', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:_XS79UinAEHNs9fTSad2GgREtpU_SG4Q', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:rZkaAz8BEGeAZX48E4Ti_HT-EZnC1zL3', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:1ViseNaNj5qG38tNLrAA2tifzfypNBqt', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:UHRqYJYxS35Lky0We1qjEAx7RUME-J0O', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:OU5MUMXpIWwW0usGixXKOo7Rm5pXuJnQ', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:s49-i7TmqBraDd73LaaPNeRTVaFzYy9B', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:sPy0R531R7mJ6nOnnEai__4TizjOo0Dk', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:AN_qkx4MbmTwNlTriIIQG3Qg29d4UJR7', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:I27NhZ6t6rFuL4EM5YB0IzqcLHrQeOs6', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:9Vt7wYhPZrqkfxFlFbz4o2fMBaW5PxHL', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:8gObj_mKODwNOmyXJi6TaICwwg2b3Hv9', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('pad:3', '{\"atext\":{\"text\":\"明明是寻丽娜真漂亮！\\n\\n\",\"attribs\":\"*1*2+a*2|1+1|1+1\"},\"pool\":{\"numToAttrib\":{\"0\":[\"author\",\"a.LNnwdmqyaJtzQNSy\"],\"1\":[\"author\",\"a.84zWwWNyl6az1jLn\"],\"2\":[\"comment\",\"c-Bea03N4O18KpiMQf\"]},\"nextNum\":3},\"head\":12,\"chatHead\":-1,\"publicStatus\":false,\"passwordHash\":null,\"savedRevisions\":[]}');
INSERT INTO `store` VALUES ('pad2readonly:3', '\"r.31a81e1a8ff730c0151ae1f8e4c7d9e3\"');
INSERT INTO `store` VALUES ('readonly2pad:r.31a81e1a8ff730c0151ae1f8e4c7d9e3', '\"3\"');
INSERT INTO `store` VALUES ('pad:3:revs:0', '{\"changeset\":\"Z:1>1|1+1$\\n\",\"meta\":{\"author\":\"\",\"timestamp\":1451134896328,\"atext\":{\"text\":\"\\n\\n\",\"attribs\":\"|2+2\"}}}');
INSERT INTO `store` VALUES ('sessionstorage:uUNwxY_wVDAUeRRJ9h7j_OYfPcihZWDo', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:Mbr5I2rBMOn8xhXPhrXP4SaDCiS9sLTq', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:LTq_wT4Vk_tXOHp_3LBb_x8ewZuAjImf', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:BceuC9iHdKm1O776Fxi6FfvA3e5GxMgU', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:Ghkf6eWGoLVbvwXcKa_Hsi4YysAVwAjH', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:pp-eINm1_Ga-qAx1cD4mQQqfs37StlLi', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:0aLDlSdtli0gSKNBkVbE04BrVMRtg9JM', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:Rvh83IEEuld81BNdKnrL04lBvnJWE2rN', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('pad:\"+1+\":revs:84', '{\"changeset\":\"Z:1>1pu*3|19+1ci*3*4*9*6+1*3|1+2q*3*4*9*6+1*3|1+5*3*4*9*6+1*3|2+28*3*4*9*6+1*3|a+85$                       \\n   \\n需求书\\n   \\n简单写一下需求：\\n   \\n用户端A：适合用人群：密集聚集的人群，例如辅导机构，公司等\\n   \\n用户端B：商家，主要针对美食城应用，美食城的特点就是多档口，多经营商，\\n   \\n此平台的作用就要求将整个美食城打包放置在平台上，而不是独立档口体现。\\n   \\n我有头有一套微信订餐的源码，用php写的，基本功能已经有了，可以实现用户下单，商家打印小票配送。\\n   \\n他的问题在于是单店模式，无法实现将来规模的扩大，也就是说所有的信息发布只能发布在一个店铺中，我要求您改动的是：\\n   \\n1.需要多店模式。该套源码有初次使用短信验证的功能，这个要保留，防止恶意下单，\\n   \\n2. 实现这个功能我要引入一个“堆”的概念，我将来从成本出发，不会做散户，上段说的系统给用户的值，那么相等的值就可以把他们化成一个“堆”，例如如果将来某个公司，所有用户的地址可能写法有所区别，但是他们在设置的时候要求他们选择“堆”与“组”，“堆”就是配送点的信息，例如整个24层，而“组”就是他们的具体的部门或者班组代号。于是将来所有用户的配送位置信息要用“堆”和“组”来描述。\\n   \\n我需要根据用户所在的区域给他设定一个默认的值，这个值要有两种可修改的途径，一个是在短信验证后他自动归“堆”，另一个就是我可以在后台自己给他设置，这个值就是用来划分该用户的权限，例如他是山西大学的学生，我就只能让他看见我一个美食城的全部菜单，而不会看到距离他很远的美食城的菜单。\\n   \\n而新用户要求他自己设置新地址，后台有提示，在他之后，其他人选择地址的列表里会出现该用户曾经写出的值，也就是说，因为新的用户的注册，新的“堆“和“组”创建了。\\n   \\n\\n   \\n3美食城每个档口经营的东西种类不一样，我要求用户看到的菜单会有最基本的分类，并且是打包的，比如炒菜类，盖饭类，面食类等等（可后台自主添加）用户看到的炒菜类里面，会出现所有的档口可以做出来的菜品，但是我后台打印出小票以及结算的时候，我要能从用户点的菜品中获知哪些菜品是哪个档口提供的，例如，我在炒菜类点了，宫保鸡丁，鱼香肉丝，商家打印出来的小票（该小票用于备餐）上边会写着，宫保鸡丁来自“A档口”，鱼香肉丝来自“B档口”，结算的时候也是如此，后台要把一个用户消费30块钱的单子自动根据菜品来源记录到各个档口的账目下，这个钱也要后台分配记账。而最终给用户送到手里的小票要隐藏这些信息，只显示宫保鸡丁，鱼香肉丝的分别价格以及总价。\\n\\n   \\n后台价格这栏要设置好利润分配：\\n   \\n例如：一份米饭成本为3元，而用户看到的是3.5元，但是后台分配到此米饭来源的窗口则依然是3元。\\n   \\n4.关于用户的订单，要求可设定收单时间，例如可在后台设置下单截止时间为上午10点30，之后用户不可选餐。这个功能是基于我将要点对点营销的模式，百度等外卖定价较高，所以它对于散户点单，任意时刻选购都是可以的，无非就是多跑一趟或者推迟时间送到，而我在10点30关闭订餐系统后，牺牲小部分用户，但是11点20左右可以将所有订单准备完毕，11点40左右一次性送到，不拖泥带水。\\n   \\n\\n   \\n很抱歉，我没有做过需求书，很尽力在描述我所有的构想，下边在从使用者描述一下所要的功能。\\n   \\n\\n   \\n下面从用户体验和商家两方面来描述一下所有功能，一个用户在每天晚上6点到第二天上午10点30之间（可后台设置）可以预定第二天午餐，还可以在订餐中附加特殊要求（不要葱蒜之类，此功能源码中有，留存），默认都是11点40送到，餐到后，用户可评论菜品质量味道，并可以把此公众号的二维码推荐转发给朋友或者朋友圈，如果有其他人根据他分享的这个二维码成功订餐（不知道现在php开发有没有在二维码中包含进去用户信息的同时还可以依然扫描出我的公众号），该用户将收到系统自动发放的代金券（后台可设）。此用户本次订餐完成。\\n   \\n商家这端，可以通过微信后台推送文档，这个功能源码有的。将来合作的商家合作范围会控制在一个美食城之内，并且我会有一个固定的档口专门与我合作，也就是说10点30分关闭订餐系统后，该档口立刻可以打印出两个票据：\\n       \\n*在本美食城订购的所有清单，并且根据之前设置的菜品来源分类，比如今天不同的用户订购了3份炒菜，那么打印出来的清单上，就会标记出这3份炒菜应该由“A”提供，那么该员工将把这些分类小票发放到对应档口。\\n*    \\n*按照“堆”和“组”分别打印出汇总的信息，例如“三人行”这个机构这个“堆”中每个“组”所点的菜品份数，这张小票就完整了。其他机构或者点的小票也是类似。    \\n\\n*      \\n\\n   \\n    为描述生动，我形容一下具体这两张票的用处，根据上述1这个清单，将该小票撕开对应部分放到对应档口，让其准备所订购的菜品。11点时候，根据2这个清单，按照“堆”设配送框，开始向所有档口要2清单上所有列出的菜品。例如“三人行”放一个框中，所有档口走一圈，拿完“三人行”所需的，再根据“组”分别装袋，但是都还在“三人行”这个框内，此时“三人行”完成配餐，等待送货。“新东方”教育机构另用一个框，根据2这个清单继续在所有档口前边走一圈，按照2中所有菜品清单，拿全所有的配货。类似这样的循环几次，把2中固定的几个点的订单全部准备完毕。\\n   \\n\\n   \\n\\n  \\n \\n\",\"meta\":{\"author\":\"a.LNnwdmqyaJtzQNSy\",\"timestamp\":1451132599848}}');
INSERT INTO `store` VALUES ('sessionstorage:Uqxpq6XzToMPn9Je1NusxcWa3uRrUw_D', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:Zp61-AceyoRMgKpDB0oUFgOZgHNeW4_K', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:1-Ds6V9B5RUqbuozohPYDCkr2yZxcnbW', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:7oD6EfpGKrbta9tyZ6yyX0K1N2qnlx3m', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('pad:\"+3+\":revs:8', '{\"changeset\":\"Z:3>6=2*0+6$ghdfgh\",\"meta\":{\"author\":\"a.LNnwdmqyaJtzQNSy\",\"timestamp\":1451133805386}}');
INSERT INTO `store` VALUES ('pad:\"+3+\":revs:9', '{\"changeset\":\"Z:9>3=8*0+3$df \",\"meta\":{\"author\":\"a.LNnwdmqyaJtzQNSy\",\"timestamp\":1451133805886}}');
INSERT INTO `store` VALUES ('sessionstorage:LpIn3BA5xdnq5md_T7yhEqwoqnx6LCU7', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:bxPJE7WwhnIqG0SeTk61XRb5SpNFqc0f', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:njUmzz2r0y9ODVRHj-uh8gvZIArfGcjn', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:cg3W8_aZI_RomvVvVQ4NCeeTENH5eQM5', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:HxPxGRyZakYH2Y0zB40o1PT482uSwmHk', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:HfTlSCxrQgrN0xmACJBoepplHztQ53jp', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:kjUpCm4aJJYcj7IWPwLPSj13iZwCTP1G', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:ghmuY85kzSsjzlHKKQWVGoyJxT_wabcV', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:Ntpi6BPqRAX-8V3bdRKcrIVsJv0RqZid', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:JS0DBNskmAaiU_FrWrXwGqwWBMTxZe0S', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:VVY39huq7VnAdHbe7RFl90yB4U1qcj91', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:-FIg_O5IPSBMLq90IieRycozI6Trx9kx', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:oeDbaElBtjB15rkGZGQ9XQNm3bddOHyO', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:MZq8rbQGV6xn4tfSPSPk3fUDHHpcgVBV', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:PJtfnVIQjXhuQfRyL_DaiEJAC_Fv7bZs', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('pad:1:revs:16', '{\"changeset\":\"Z:1pw>5|7=28=3*0|1+1*8*0*2*4+1*0*5+3$\\n*需求书\",\"meta\":{\"author\":\"a.84zWwWNyl6az1jLn\",\"timestamp\":1451135729837}}');
INSERT INTO `store` VALUES ('pad:1:revs:17', '{\"changeset\":\"Z:1q1<4|2=s-4$\",\"meta\":{\"author\":\"a.84zWwWNyl6az1jLn\",\"timestamp\":1451135734517}}');
INSERT INTO `store` VALUES ('sessionstorage:vvV6N8lqpI-YoK80wwV467bLytMoo8xy', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true},\"user\":{\"password\":\"123456\",\"is_admin\":true,\"username\":\"admin\"}}');
INSERT INTO `store` VALUES ('sessionstorage:L_vBk8FcSAEJ3haQQpjayX9QnOFZhyXM', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:PyGLrJFwaZtFcRC96KLq-g9Ad53uA4rA', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:9o7rXUJ_FWMekCZIWnDBii40fdciaOBC', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:G2ce5yeY_EzCurgmek9UD0TKezEtBdBr', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:13nd1dNj18Bi3U8mZhSMXYbUKku5Bq3D', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:8bUaAkRVuC1qtdQ6tGU-yhSCG-6eKz1E', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('pad:\"+3+\":revs:5', '{\"changeset\":\"Z:pw>zz=l|4-l-oe*0|19+1bx*0*1*2*3+1*0|1+2q*0*1*2*3+1*0|1+5*0*1*2*3+1*0|2+28*0*1*2*3+1*0|5+7u$  \\n   \\n需求书\\n   \\n简单写一下需求：\\n   \\n用户端A：适合用人群：密集聚集的人群，例如辅导机构，公司等\\n   \\n用户端B：商家，主要针对美食城应用，美食城的特点就是多档口，多经营商，\\n   \\n此平台的作用就要求将整个美食城打包放置在平台上，而不是独立档口体现。\\n   \\n我有头有一套微信订餐的源码，用php写的，基本功能已经有了，可以实现用户下单，商家打印小票配送。\\n   \\n他的问题在于是单店模式，无法实现将来规模的扩大，也就是说所有的信息发布只能发布在一个店铺中，我要求您改动的是：\\n   \\n1.需要多店模式。该套源码有初次使用短信验证的功能，这个要保留，防止恶意下单，\\n   \\n2. 实现这个功能我要引入一个“堆”的概念，我将来从成本出发，不会做散户，上段说的系统给用户的值，那么相等的值就可以把他们化成一个“堆”，例如如果将来某个公司，所有用户的地址可能写法有所区别，但是他们在设置的时候要求他们选择“堆”与“组”，“堆”就是配送点的信息，例如整个24层，而“组”就是他们的具体的部门或者班组代号。于是将来所有用户的配送位置信息要用“堆”和“组”来描述。\\n   \\n我需要根据用户所在的区域给他设定一个默认的值，这个值要有两种可修改的途径，一个是在短信验证后他自动归“堆”，另一个就是我可以在后台自己给他设置，这个值就是用来划分该用户的权限，例如他是山西大学的学生，我就只能让他看见我一个美食城的全部菜单，而不会看到距离他很远的美食城的菜单。\\n   \\n而新用户要求他自己设置新地址，后台有提示，在他之后，其他人选择地址的列表里会出现该用户曾经写出的值，也就是说，因为新的用户的注册，新的“堆“和“组”创建了。\\n   \\n\\n   \\n3美食城每个档口经营的东西种类不一样，我要求用户看到的菜单会有最基本的分类，并且是打包的，比如炒菜类，盖饭类，面食类等等（可后台自主添加）用户看到的炒菜类里面，会出现所有的档口可以做出来的菜品，但是我后台打印出小票以及结算的时候，我要能从用户点的菜品中获知哪些菜品是哪个档口提供的，例如，我在炒菜类点了，宫保鸡丁，鱼香肉丝，商家打印出来的小票（该小票用于备餐）上边会写着，宫保鸡丁来自“A档口”，鱼香肉丝来自“B档口”，结算的时候也是如此，后台要把一个用户消费30块钱的单子自动根据菜品来源记录到各个档口的账目下，这个钱也要后台分配记账。而最终给用户送到手里的小票要隐藏这些信息，只显示宫保鸡丁，鱼香肉丝的分别价格以及总价。\\n\\n   \\n后台价格这栏要设置好利润分配：\\n   \\n例如：一份米饭成本为3元，而用户看到的是3.5元，但是后台分配到此米饭来源的窗口则依然是3元。\\n   \\n4.关于用户的订单，要求可设定收单时间，例如可在后台设置下单截止时间为上午10点30，之后用户不可选餐。这个功能是基于我将要点对点营销的模式，百度等外卖定价较高，所以它对于散户点单，任意时刻选购都是可以的，无非就是多跑一趟或者推迟时间送到，而我在10点30关闭订餐系统后，牺牲小部分用户，但是11点20左右可以将所有订单准备完毕，11点40左右一次性送到，不拖泥带水。\\n   \\n\\n   \\n很抱歉，我没有做过需求书，很尽力在描述我所有的构想，下边在从使用者描述一下所要的功能。\\n   \\n\\n   \\n下面从用户体验和商家两方面来描述一下所有功能，一个用户在每天晚上6点到第二天上午10点30之间（可后台设置）可以预定第二天午餐，还可以在订餐中附加特殊要求（不要葱蒜之类，此功能源码中有，留存），默认都是11点40送到，餐到后，用户可评论菜品质量味道，并可以把此公众号的二维码推荐转发给朋友或者朋友圈，如果有其他人根据他分享的这个二维码成功订餐（不知道现在php开发有没有在二维码中包含进去用户信息的同时还可以依然扫描出我的公众号），该用户将收到系统自动发放的代金券（后台可设）。此用户本次订餐完成。\\n   \\n商家这端，可以通过微信后台推送文档，这个功能源码有的。将来合作的商家合作范围会控制在一个美食城之内，并且我会有一个固定的档口专门与我合作，也就是说10点30分关闭订餐系统后，该档口立刻可以打印出两个票据：\\n       \\n*在本美食城订购的所有清单，并且根据之前设置的菜品来源分类，比如今天不同的用户订购了3份炒菜，那么打印出来的清单上，就会标记出这3份炒菜应该由“A”提供，那么该员工将把这些分类小票发放到对应档口。\\n*    \\n*按照“堆”和“组”分别打印出汇总的信息，例如“三人行”这个机构这个“堆”中每个“组”所点的菜品份数，这张小票就完整了。其他机构或者点的小票也是类似。    \\n\\n*      \\n\\n   \\n    为描述生动，我形容一下具体这两张票的用处，根据上述1这个清单，将该小票撕开对应部分放到对应档口，让其准备所订购的菜品。11点时候，根据2这个清单，按照“堆”设配送框，开始向所有档口要2清单上所有列出的菜品。例如“三人行”放一个框中，所有档口走一圈，拿完“三人行”所需的，再根据“组”分别装袋，但是都还在“三人行”这个框内，此时“三人行”完成配餐，等待送货。“新东方”教育机构另用一个框，根据2这个清单继续在所有档口前边走一圈，按照2中所有菜品清单，拿全所有的配货。类似这样的循环几次，把2中固定的几个点的订单全部准备完毕。\\n   \\n\",\"meta\":{\"author\":\"a.LNnwdmqyaJtzQNSy\",\"timestamp\":1451132758359}}');
INSERT INTO `store` VALUES ('pad:\"+3+\":revs:6', '{\"changeset\":\"Z:1pv<1pu|1n-1pu$\",\"meta\":{\"author\":\"a.LNnwdmqyaJtzQNSy\",\"timestamp\":1451133803343}}');
INSERT INTO `store` VALUES ('sessionstorage:UzJMIK1KM5_FD2h50Wr3NOxn8Zzz7Jvr', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:1Cz_49Aaevium35vzQT8EV7OmiA2mWXN', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:hCtncbNPrI-IVmJTPqSsYoOK7qGBCV5E', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:g4yWV2QQnYce6jGNPCjUnKYSTz3pC-t9', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:1-Ifu88m42p1SfdEsrkUTsti7XWNgHKr', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:auxaOVvASqJlRYAnrSP419FIVUar7tiF', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:KekrXXofXXAI12HvYZeBIaglQLqZjBzR', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:YMWpDP3TTpRT7A9uV4Zqig3qDV7Bp_KI', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:8TRXeZNWQrAVWhxt7fDjASv9SN7cEYDu', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:ywmbwGWg_epmZkHZKxgmrO16UbwoqPQB', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('pad:1:revs:29', '{\"changeset\":\"Z:3>2=2*c+2$yu\",\"meta\":{\"author\":\"a.SbEYQkqWmUTpApSd\",\"timestamp\":1451188563413}}');
INSERT INTO `store` VALUES ('pad:1:revs:8', '{\"changeset\":\"Z:1pt>0|2=s*5=3$\",\"meta\":{\"author\":\"a.84zWwWNyl6az1jLn\",\"timestamp\":1451133023451}}');
INSERT INTO `store` VALUES ('sessionstorage:x-Eak87RpiGW47p7TgbYhor5KR2OHQBa', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:xWKhPLLMo5FNbR4_MOdqQCQLX8Bf3j3m', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:-U1VFQ6mSNPwawET8JMbxgTx0DIwrdmX', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:JVYPl1Vlrg3ovE32CTViQCKF3hDcnMuI', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:1xqkoyWrtGbPD8Rxy3Kh97wPm77Fp_DH', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:H2FX6U6MAvbqWkElYJf8CJM7FFi8q-vg', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:w5SM4Cinl2yR7nGu6bXVUuXkqUFIeFhO', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:UgKzWP8pcpvKMEdZFoVGr-C14iawBYBg', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:ArUDET_im5Hs_ZYxYY-rLGhX1FpD3sOQ', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:Veonc9BKFktDyor0bBFmlVGqcEnOpxh7', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:sRndX3eScjA5iXCYL9k7v9nux3gtN-zj', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:RxN5yEOKe-ziSS6ILKE-Xe17lZgKwAlk', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:dttr4-BPO7pM8wLCitQ82Ze-3HmvYnZd', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:aDWsRWg62qSTbVzjSben9zaxTcWAqJLL', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('pad:\"+3+\":revs:7', '{\"changeset\":\"Z:1>2*0+2$hf\",\"meta\":{\"author\":\"a.LNnwdmqyaJtzQNSy\",\"timestamp\":1451133804872}}');
INSERT INTO `store` VALUES ('pad:1:revs:9', '{\"changeset\":\"Z:1pt>1|9=3b*6*7*2*4+1$*\",\"meta\":{\"author\":\"a.LNnwdmqyaJtzQNSy\",\"timestamp\":1451133724157}}');
INSERT INTO `store` VALUES ('pad:1:revs:10', '{\"changeset\":\"Z:1pu>1|c=4j*6*7*2*4+1$*\",\"meta\":{\"author\":\"a.LNnwdmqyaJtzQNSy\",\"timestamp\":1451133729227}}');
INSERT INTO `store` VALUES ('pad:1:revs:11', '{\"changeset\":\"Z:1pv>0|c=4j*6=1$\",\"meta\":{\"author\":\"a.LNnwdmqyaJtzQNSy\",\"timestamp\":1451133730366}}');
INSERT INTO `store` VALUES ('pad:1:revs:28', '{\"changeset\":\"Z:1>2*c+2$ji\",\"meta\":{\"author\":\"a.SbEYQkqWmUTpApSd\",\"timestamp\":1451188562914}}');
INSERT INTO `store` VALUES ('pad:1:revs:12', '{\"changeset\":\"Z:1pv>0|c=4j*8=1$\",\"meta\":{\"author\":\"a.LNnwdmqyaJtzQNSy\",\"timestamp\":1451133731786}}');
INSERT INTO `store` VALUES ('pad:1:revs:13', '{\"changeset\":\"Z:1pv>1|2=s*6*7*2*4+1$*\",\"meta\":{\"author\":\"a.LNnwdmqyaJtzQNSy\",\"timestamp\":1451133734890}}');
INSERT INTO `store` VALUES ('pad:1:revs:14', '{\"changeset\":\"Z:1pw>0|2=s*6=1$\",\"meta\":{\"author\":\"a.LNnwdmqyaJtzQNSy\",\"timestamp\":1451133735592}}');
INSERT INTO `store` VALUES ('pad:1:revs:15', '{\"changeset\":\"Z:1pw>0|2=s*8=1$\",\"meta\":{\"author\":\"a.LNnwdmqyaJtzQNSy\",\"timestamp\":1451133736372}}');
INSERT INTO `store` VALUES ('sessionstorage:IEOSzduUUJof0dx_dJyHgjAXcydw0K-D', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:LfhsEmX20SAD6Xlrx09yLbJ0sMOARQl4', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:KXOUfT8DGdnKA3kYu7cgEuEAqsA-nUCQ', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('pad:1大论文', '{\"atext\":{\"text\":\"\\n\\n\",\"attribs\":\"|2+2\"},\"pool\":{\"numToAttrib\":{},\"nextNum\":0},\"head\":0,\"chatHead\":-1,\"publicStatus\":false,\"passwordHash\":null,\"savedRevisions\":[]}');
INSERT INTO `store` VALUES ('pad2readonly:1大论文', '\"r.884a86b0c79b5449889a61686ac56d30\"');
INSERT INTO `store` VALUES ('readonly2pad:r.884a86b0c79b5449889a61686ac56d30', '\"1大论文\"');
INSERT INTO `store` VALUES ('pad:1大论文:revs:0', '{\"changeset\":\"Z:1>1|1+1$\\n\",\"meta\":{\"author\":\"\",\"timestamp\":1451177979685,\"atext\":{\"text\":\"\\n\\n\",\"attribs\":\"|2+2\"}}}');
INSERT INTO `store` VALUES ('sessionstorage:hfiOMClcUn5XxtWrl1BAhDhnl8EMS6uF', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:65Kl0JqyHJxWPuNoWfRrV-Dq4_2Jaf7m', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:mZg-6keOOg5ysyj3zHiRxThpOaqExKNX', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:QdCoo5wY4eHBI7NOxykWVK6PG4J1zjjA', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('token2author:t.J0awn46TyzqTy6Af1SoT', '\"a.XPlSu5ugK4iZi903\"');
INSERT INTO `store` VALUES ('globalAuthor:a.XPlSu5ugK4iZi903', '{\"colorId\":29,\"name\":null,\"timestamp\":1451179500732,\"padIDs\":{\"\\\"+3+\\\"\":1}}');
INSERT INTO `store` VALUES ('sessionstorage:HgJxONJBD9hlL34O5ZXNVigO4S1Rd_QF', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:efz90uhe2W2pAEeFDbud_GHjv4p8fc8v', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:UO3fFu11UuorRLkIjVm9bQbKFPrAoDZr', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:Lt7uzoca0pJ_wafs30m71HPkFy7zpEyt', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('comments:\"+3+\"', '{\"c-14wkMcW5gay455Qu\":{\"author\":\"a.XPlSu5ugK4iZi903\",\"name\":\"Anonymous\",\"text\":\"gg\",\"timestamp\":1451178707794}}');
INSERT INTO `store` VALUES ('pad:\"+3+\":revs:10', '{\"changeset\":\"Z:c>0*4=b$\",\"meta\":{\"author\":\"a.XPlSu5ugK4iZi903\",\"timestamp\":1451178707887}}');
INSERT INTO `store` VALUES ('sessionstorage:PR-3ACH4xZwPWi_re2Vd5A1NXHZ9XnUB', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:c4YB5Xy_l7McC_xkgeMigflwFQZmqsmL', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('pad:3:revs:1', '{\"changeset\":\"Z:2>2*0+2$ni\",\"meta\":{\"author\":\"a.LNnwdmqyaJtzQNSy\",\"timestamp\":1451178819596}}');
INSERT INTO `store` VALUES ('pad:3:revs:2', '{\"changeset\":\"Z:4>1=2*0+1$n\",\"meta\":{\"author\":\"a.LNnwdmqyaJtzQNSy\",\"timestamp\":1451178820096}}');
INSERT INTO `store` VALUES ('sessionstorage:vqx5fwQfNTFsZesAqlfZ4h-0Fs24oM72', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:OOoObrJvQ23S7uawLWJZfxs8vx6xKduS', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:O-4It4pqreGgdAZ6l37V5Idm772Xgd4x', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:-Kts1h-yjAVCe7Z_lHfoonksTGNpGnaQ', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('pad:\"+3+\":revs:11', '{\"changeset\":\"Z:c<b-b$\",\"meta\":{\"author\":\"a.XPlSu5ugK4iZi903\",\"timestamp\":1451178953489}}');
INSERT INTO `store` VALUES ('pad:\"+3+\":revs:12', '{\"changeset\":\"Z:1>9d*5|2+2*5*6+33*5|1+1*5*7+33*5|1+1*5*7+33$\\n\\n{\\\"payload\\\":[[\\\" \\\",\\\" \\\",\\\" \\\",\\\" \\\",\\\" \\\",\\\" \\\"]],\\\"tblId\\\":1,\\\"tblClass\\\":\\\"data-tables\\\",\\\"trClass\\\":\\\"alst\\\",\\\"tdClass\\\":\\\"hide-el\\\"}\\n{\\\"payload\\\":[[\\\" \\\",\\\" \\\",\\\" \\\",\\\" \\\",\\\" \\\",\\\" \\\"]],\\\"tblId\\\":1,\\\"tblClass\\\":\\\"data-tables\\\",\\\"trClass\\\":\\\"alst\\\",\\\"tdClass\\\":\\\"hide-el\\\"}\\n{\\\"payload\\\":[[\\\" \\\",\\\" \\\",\\\" \\\",\\\" \\\",\\\" \\\",\\\" \\\"]],\\\"tblId\\\":1,\\\"tblClass\\\":\\\"data-tables\\\",\\\"trClass\\\":\\\"alst\\\",\\\"tdClass\\\":\\\"hide-el\\\"}\",\"meta\":{\"author\":\"a.XPlSu5ugK4iZi903\",\"timestamp\":1451178979493}}');
INSERT INTO `store` VALUES ('sessionstorage:ySMVCH8yuhTcqKrAx8SatevkGNCp84Ul', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:khobOpdkijfxnwGeD_MEPein-ePzHttX', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:2M8zLYNcBVl12dBZa-fY_jkX7tb0Xqd-', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:hmnHjyKUjwVidjt-hnmRrtka3n4REbcy', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:RPK9BL_COKZPiBoJN-Jwp3sDEcr9Zvil', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:nNfAFr4bUbaSbHR8IquF-cO801-tYPmW', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:qhO8qd-T-7cZmaOaGy9awShW5rgX-wPZ', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:PLB6f1JmFcTq7eXSphcNrNgjWqUxZsh5', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:8IY4c8wcOXOWo25BOyqsn2t4USRxblTc', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:vyTj5tzqPHbedNDQLNlJJnY4zZPAeeGW', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:DVQHQXVK-5Os3GvJrKj7utU9_JorrCHg', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:ArYIqbb0HNOG004KMXaK0zJFLKqXNhzC', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:Nm5j1f9kT_9VWwynPlJ-YC-M7KBkWIxt', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:QAr55X9oPX8xog8bWVWjwhT4g9npsrx4', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:ApicBGZexYtWFAg2RrA3mZorB1uLEb3h', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:rN7Oa5ho7R8nGyRNXcR2UxgFpI0PtPlZ', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:usFnlK7_IVLdkJisqBUbY7eJbOuUqbNW', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:3I6pgEDwGTrNRb_zSn1C7aUSh9xmKNNd', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:jPHsA8rSfsuC76UwU7aiH5zShMLvZp39', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:-9wfX83AtMAeDGlmmMeYMeYwq5tPXirs', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:3ieRFDuqFimg4V2d-arN_OhSCWiQUqbJ', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:Jey2kFC9EIyqf3_7FmyE-Op7jaxBPwb3', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:tzVzTntsENbE4pkcEpHC2wWHOHKcpqGM', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('pad:10', '{\"atext\":{\"text\":\"\\n\\n\",\"attribs\":\"|2+2\"},\"pool\":{\"numToAttrib\":{},\"nextNum\":0},\"head\":0,\"chatHead\":-1,\"publicStatus\":false,\"passwordHash\":null,\"savedRevisions\":[]}');
INSERT INTO `store` VALUES ('pad2readonly:10', '\"r.52dc40783326b58849506a52a6a19859\"');
INSERT INTO `store` VALUES ('readonly2pad:r.52dc40783326b58849506a52a6a19859', '\"10\"');
INSERT INTO `store` VALUES ('pad:10:revs:0', '{\"changeset\":\"Z:1>1|1+1$\\n\",\"meta\":{\"author\":\"\",\"timestamp\":1451179500732,\"atext\":{\"text\":\"\\n\\n\",\"attribs\":\"|2+2\"}}}');
INSERT INTO `store` VALUES ('sessionstorage:MXQFbfRHBj-3H6zThCitVZfSX3vj_6tE', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:cR-Bl2TLm1SmgkEtWYN5drZ7RVNZ2Wny', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:VZYS-ashDQKtLOsxmBvCzK8FbP8q4LQg', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:S7SbIho5JM-MfaO7oaIcQGmqANq9PMT_', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:puoo8aRE9fDJ_vfo4W1wpRZNjNhDc3hn', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:mSU3nyvHaQzy1GHjHUp2t8eIQk6X8ICY', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:E85x3DX2zcqBs65sNi7GbCigCPQO5WDH', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:cyPUefQE8vT7vi039c0KPhRcLbM0TGn6', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('token2author:t.O6G3WwxxFR02bOiyK0hq', '\"a.SbEYQkqWmUTpApSd\"');
INSERT INTO `store` VALUES ('globalAuthor:a.SbEYQkqWmUTpApSd', '{\"colorId\":12,\"name\":null,\"timestamp\":1451189132844,\"padIDs\":{\"1\":1}}');
INSERT INTO `store` VALUES ('sessionstorage:80VLdQfxAh2lKpc_Y16VpKvY6HDwUINy', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:cGYy4_mR63mle03LCLWlE-yM6edeKBsy', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:t_s-iCCcWedldQHsP0QDPVItawtJ3RZ1', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:BIHDx_f9mWLfrMsJTowe97xgfUU16Srz', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:0tJCZ-zFol3M44ChnGDtJjbLFm-nHwwM', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:7i8q6cRlSuxPSBLfxt_C15B-44kWP5UD', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:JkwH7leSfbM51SZPZHN-ws3tuaZd_IPT', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:-_ZgWDTP2PnG9nBIFZRrbN6bK4FpLZ7_', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:m4avEAWc__Xeiau0HHTY6ugnT929e7mN', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:MnPyF496uCYo-7lqbPH1opjlUj6Kik1D', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:kr7ZE8MjTMg5dFzhukZADnaN-7h7aVTE', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:xJ_hT-9Rf39WcFoljsqBRzKJYUVpxO13', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:e-gx5yjrE4V6tc4BJEozwR8LVNNRHZyN', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:viq1FZqhMjOZvsDNHlccWC6-raPF-pRK', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:n4mAQAK0uxdexBzO6DorjPO6NjDV0WJM', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:ZgQvuLFZ7CiJgdSh_qGC3UMgx-MNkRwP', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:Alwx9BdBJeXo5a_f-B8UkPVA-vNKod3T', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:Hg9FI35Zw09msZxX3sxrObwo6LQNyhfy', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:vyyXQ8MyQfx30Feuf2M0i6rnXVL85Wg0', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:CnkY8IZVuaRgv5c4PnkE8KNR8dW6Y6b5', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:vjuhMAT2AC8qIKcNPBasNMD4P01h6G0r', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:LNX0v5TwrCD2elDJY2815_KD5ByjyEWV', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:xfvttxUcMlK3bj9qtaXWEJwf4RKUunHv', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:-CMQ5YDX1tYj5ompEStWJaBq-3TBTMDZ', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:bXrtsGws-er7JO7qXjPuFhvT4VOqzUPQ', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:m1RX-lV9obQCTk5hj8Qqf0mfbKpNAiwL', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:dQOY6jhGbhMVRdn20pjUkcQRClQsUtHD', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:gNNtQlL_NS9_CraJsoCXFwWYNkNk1k7p', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:0T05TG5TDN-BNPrT9w8ABSY6HW3ZTKIh', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:R6y6P_zHw98l__XIGwYA04lFkS-Rf2SJ', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:2aBy2dSCh-lY_C9QFLS2LdNTg-vUUdti', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:1yqyQHWynDsjjAiT1UzK1OU14JCAbyrB', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:guLNaWO0ZQWTsUvuORhahD7cwvasdtza', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:JedTnU-Ww7CVGKW-9vKfxTDW5kELBU_h', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:sOx35B13wgg1VA777SNJZzJ7Ir1Tro97', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:KvjX1quIEw_THYCbXCl8z3Mlu6GltV6o', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:gqYSZBwUug-1ggp6WkMl1lhQpFoAUjsi', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:kiHT0mJ0oxyfucGgQXfDi1dLiAIQ7Kvc', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:GMsHpXPtFzlXfki_jL2xEGFDQ0scB0pk', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:Oja0qRuhySDOdBAEn0ItFmhAWQOQLSIH', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:gzsALhhBxu0ci7AK5dO052ZIMpZkKzXV', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:VFH90NT8N3Fj0jPwneONGwdj0zEiukep', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:3-gz_3SgiEgTxl0BEFqG4oabFcFxbK03', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:cjcHMTzSStobaCgRHVDYqp45tZ3CBKdd', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:b2UdIIHqgD6DFblEbY9fAn8H0PcaoyNZ', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:OQOKrfKPwX2ZwD7eGWQwsGAAk2tZqwpq', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('pad:1:revs:19', '{\"changeset\":\"Z:1py>0|8=29=1*b=3$\",\"meta\":{\"author\":\"a.SbEYQkqWmUTpApSd\",\"timestamp\":1451180516388}}');
INSERT INTO `store` VALUES ('sessionstorage:tV_zOh3YvhFnI9-w6-oz4zbqRz9iv2zI', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:mwxTzWUgb2Dv8Mm3ECfgOyPvljzrBpYP', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:n9wc9FX9bnGP1DBs3eCLbDLfMLxwozR5', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:RC3c-hOAR-q1Amqy9XibwDN1QIF2PFKO', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('pad:1:revs:20', '{\"changeset\":\"Z:1py>1|4=x*6*c*2*4+1$*\",\"meta\":{\"author\":\"a.SbEYQkqWmUTpApSd\",\"timestamp\":1451180590504}}');
INSERT INTO `store` VALUES ('pad:1:revs:21', '{\"changeset\":\"Z:1pz>0|4=x*6=1$\",\"meta\":{\"author\":\"a.SbEYQkqWmUTpApSd\",\"timestamp\":1451180591331}}');
INSERT INTO `store` VALUES ('pad:1:revs:22', '{\"changeset\":\"Z:1pz>0|4=x*6=1$\",\"meta\":{\"author\":\"a.SbEYQkqWmUTpApSd\",\"timestamp\":1451180592204}}');
INSERT INTO `store` VALUES ('pad:1:revs:23', '{\"changeset\":\"Z:1pz>0|4=x*8=1$\",\"meta\":{\"author\":\"a.SbEYQkqWmUTpApSd\",\"timestamp\":1451180592766}}');
INSERT INTO `store` VALUES ('pad:1:revs:25', '{\"changeset\":\"Z:1pz<1py|1n-1pz|1+1$\\n\",\"meta\":{\"author\":\"\",\"timestamp\":1451188381766}}');
INSERT INTO `store` VALUES ('pad:1:revs:24', '{\"changeset\":\"Z:1pz>0|4=x=1*d=8$\",\"meta\":{\"author\":\"a.SbEYQkqWmUTpApSd\",\"timestamp\":1451180603000}}');
INSERT INTO `store` VALUES ('sessionstorage:U0439ZlW-wYPjPsXrJFOQgT-FKWKQgas', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:KkCQMCxFtV6EBcrCRb9FUuTHsMeWie1H', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:Il-Bj_c-FO7uJU67bQSu2_nWMfHgJiu-', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:smM4x0AUjEbl750Iv94qoJKxsBuRlPZh', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:-wMKxnxHfIpNlsFtS0Y03PjX1RC1sDfb', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:V7HZv5gr6zfDQND_OtII2THX_92GNLTP', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:4BFGZJTiWmv_y2PtPTf_7a53Q1VPDx5u', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:jf8U5cwmeUY0hp6UuCDua_9SM3A1sQsb', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:iwugN4lvs-2pF2rKscn8O-RSFfAuP9iX', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:4BIy65YwAN9q3XE-vhTXbNhPeP1o0DBh', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:Kd3V6EHL1OtALwMyCHEK93nm6VnknIba', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:eboDs6MMwb_HU7dIax5vIGjiMaEIgH3T', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:Ek7Ig3SctQLQ0hGGmNC4T3mqBHx7bKuj', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:IfI-hYM-exLRY1NIf8khpqumAb6B52rd', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:-6vIkp37Pc0r9MXyJ6y0vhZUv8WNPDx3', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:ZthMiPFdHw7lkbZ7HUcI3gWqN3OgfyE4', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:uzyVZ5-ihwhKDBT1aQ22vl-pC9ciiyfQ', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:m97-Ik26LhKT8EdFDx7Q0DED_HjLAeta', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:xxAQekcbAmnNn3UQvT5XfJArOWwXclbW', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:KRnPPtUBwI1k4RmqT1H8CrXl85eRTBHa', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:0RjhCuTE0-DSz2oYUEJhDvCezxnRzMIA', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:huEmZhd7yeiZHM7zIYcgksu_PF3PV4rl', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:D8szmaaCGCU1bfeCYCkoEPXnM17C9oGK', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:HTYv5MGb_IDZO5aOJ35OFkyhRIm9XneZ', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:FgM0jKC7haqARCeHPb8PSBpwhd6ra8Rt', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:l0Rila06CzYb3sbgxjHVlHtxCe6UFiU4', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:eBs9SJ7SnyaoA_mQ-Km_oK5kUiigmNAU', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:pdydgID4LI7Eaus6uHWQeblcQvaD9jva', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:i_3uFeejbhH16eFIcwmq08mszF5DaKje', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:Zhz96JM_NG30l0G4HipGa8q1TZyj_s66', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:Xa6G-n7nO9rTWKCCKMbk4thpgYkRBdF1', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:J7BU4vSj0se2UmJWCrZpYhkwbiD1P8mQ', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:MhlHUXvRgp9bB8OHuxlRDoJZ4fNViopt', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:ElieR6Su8ayds_lTMlPd2cePhWBihsk8', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:hzjduowkktsHMu8y7ST5TdiWBH2hRuvS', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:sle2CkZb9H6sMsFtVQ3ieG91CE6XqPvH', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:aUlAe8KD97raS6YbksOXjOXBtnx-WrEf', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:3gWgbtMo4HgqIyxaUuHR-fj3uM8m9_hG', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:kQfopiKC3Rhgcdgr69uhv5PO5dqL28B-', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:2CtAjtuC6kGuhTQAVeuumTOxpbspQSbm', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:hAmO8kEG50Z8PC-Q7maYdCxWf9tSNJ6M', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:1IVSa85n1Fm8EJO_C0yhJoJnjnlrBgQO', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:TLMQjSG2ax6OFCqxz7TuJUX7IGMKx2mq', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:bqomMuWpWNXkq6aAe52qW6JjWYgEnelt', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:BI707Vb9I-rCEehDtRhdeCTiVD2y9kcz', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:Sb4QORnEc79SDZdQcISKu46Xpb3fIHmk', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:fJnoGsrijeU8x00NHfrT3MuFqbHDNyFF', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:WEj_CKwhbIkwGLJVqcE5A_CZyMH1ILqN', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:0vBiPw-6RgwrIrOxZA6Ndtll0DRgUC3D', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:Rx6xZJ3BesDRxwYdv7qmLudHTxtnfhLh', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:1nM2EzvdXtI7u7Jf38TEoZcWszrhnaTA', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:pnMEyNWZR1jHTxr_DPYGyb6exPzYij6o', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:jYc3SCbKwX01bCjpQz4GgU_NnZAS0DW0', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:CzWHiPuW_7uW8H8GX8z5zjUKu0oION8e', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:lpazjAUIg0wOcvp5slDHd3E_lrunVul8', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:2LJxJ3GjN5jvbIIMYM6_P-esPwvcOcL3', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:Y0mpk5R-Mi_fRGRd5sbPb89TxQLCB56w', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:43ua1_KbOWaOfE7TeKoMDT6UEnCFFCrG', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:8UomUlVwsyTU_u92xVOSRyaNtk471kFC', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:u2-kFIpUUFz35Md_ENxf6Shv505dV9Mb', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('pad:1:revs:26', '{\"changeset\":\"Z:1>222|2+s*e+4|12+lv*2*f*4+1|1+z*2*f*4+1|1+5*2*f*4+1|1+10*2*f*4+1|1+5*2*f*4+1|1+z*2*f*4+1|1+5*2*f*4+1|1+10*2*f*4+1|1+5*2*f*4+1|1+z*2*f*4+1|1+5*2*f*4+1|1+r*2*f*4+1|1+5*2*f*4+1|1+o*2*f*4+1|1+5*2*f*4+1|1+j*2*f*4+1|1+5*2*f*4+1|1+v*2*f*4+1|25+15z$                       \\n   \\n个人简历\\n   \\n\\n   \\n☆ 姓    名：孙瑞瑞                     ☆ 性    别：男                                                                                 \\n   \\n☆姓 名：孙瑞瑞☆证件号码：142731199210216317☆性 别：男☆出生年月：1992.10☆民族：汉族☆政治面貌：共青团员☆婚姻状况：未婚☆健康状况：良☆身 高：173（CM）☆体重：60（KG）☆学历：硕士研究生☆专业：计算机技术☆研究方向：网络安全☆生源地：山西运城☆移动电话：15513094702☆电子邮箱：1527717978@qq.com☆家庭住址：山西绛县横水镇乔寺村第一居民组\\n   \\n\\n   \\n \\n   \\n起始时间结束时间毕业学校学历院系专业学习形式2007-092010-07运城盐化中学高中高211班理科全日制2010-092014-07山西大学本科软件学院计算机科学与技术全日制2014-092016-07山西大学硕士计算机与信息技术学院计算机技术全日制\\n   \\n\\n   \\n\\n   \\n\\n   \\n高级软件工程87算法设计88英语听说87信息检索88英语写作85高级操作系统91分布式数据库91网络与信息安全90数据挖掘92\\n   \\n\\n   \\n\\n   \\n\\n   \\n高等数学1(I)81高等数学1(II)100数据结构77离散数学190线性代数92C语言程序设计83概率论与数理统计100大学物理91数字逻辑于逻辑设计97JAVA93操作系统100数据库原理及应用89编译原理90计算机网络84计算机组成原理84电子技术96汇编语言程序设计90微机原理与接口技术93软件工程89计算机系统结构82毕业设计95\\n   \\n\\n   \\n\\n   \\n\\n   \\n\\n       \\n* 2012年5月荣获山西大学2011至2012学年第一学期特等奖学金\\n*    \\n* 2012年12月荣获山西大学2011至2012学年第二学期叁等奖学金\\n*    \\n* 2013年5月荣获山西大学2012至2013学年第一学期壹等奖学金\\n*    \\n* 2013年12月荣获山西大学2012至2013学年第二学期叁等奖学金\\n*    \\n* 2014年5月荣获山西大学2013至2014学年第一学期贰等奖学金\\n*    \\n* 2012年10月在山西大学获得校级“三好学生”荣誉\\n*    \\n* 2012年11月被评为年度山西省“三好学生”\\n*    \\n* 2012年10月荣获国家励志奖学金\\n*    \\n* 2014年9月荣获山西大学推免硕士研究生专项奖学金    \\n*      \\n\\n   \\n\\n   \\n\\n   \\n国家863项目-高考语文阅读智能答题项目描述：高考语文阅读题的机器自动作答，文本分词，语义相似度计算，候选句筛选扩展项目中职责：1.对文本进行主题关键词提取;2.对文本进行相似度去重;3.对文本进行重要性排序;4.对文本进行倾向性分析;5. 答案自动生成项目部分关键技术LTP分词，命名实体识别，Word2VEC开源项目使用开发语言Java\\n   \\n\\n   \\n山西大学图书馆网站建设维护项目描述：山西大学图书馆主页的开发，换书网主页的建设。 项目中职责：前台界面的修改，富文本编辑器接口的对接，HTML网页的解析项目部分关键技术前台界面HTML5+CSS+DIV， KindEditor开源框架接口的使用，java实现网页抓取ISBN图书信息 \\n   \\n\\n   \\n公司项目-资料套打及自动合成PDF技术要求项目描述：资料套打，将存贮在PDM系统中的PDF文件与条码系统中的数据报表，按关键字索引合成PDF文件，提供系统后台打印功能，制作好接口供软件调用项目中职责：实现资料按照指定格式套打，PDF文件解析，多个PDF文件合并，PDF转图片，PDF文件后台打印等功能项目部分关键技术基于pdfbox开源项目的二次开发，jar包转成dll接口供公司直接使用\\n   \\n\\n   \\n\\n   \\n\\n   \\n\\n   \\n\\n   \\n工作单位山西大学图书馆工作性质助管馆员工作部门信息技术部工作岗位软件项目开发岗工作时间2015.9.7-2016.1.24工作职责负责图书馆主页修改、业务项目开发、数据转换和各种接口软件，根据图书馆业务需求，负责各种小型软件的开发工作；负责软件开发项目方案及相关文档写作，协助做好其它基本工作。\\n   \\n\\n   \\n\\n   \\n\\n   \\n\\n   \\n实训时间2014/05 -- 2014/06实训公司山西思软科技实训分公司实训课程JAVA移动互联网实训描述为期1个多月的实训，做两个项目  1.开发银行管理系统，使用MVC模式，mysql数据库，\\n2.使用MyEclipse做个人门户网站，学习html,CSS,DIV,JS,JSP技术\\n   \\n\\n   \\n\\n   \\n\\n   \\n\\n   \\n论文题目面向科研协作的文档协同编辑技术研究与实现研究方向网络安全研究状态开发中，使用git控制版本研究概述随着信息化科研的不断发展，单用户文档编辑模式已经不能满足大量文档组织的要求,文档协同编辑为人们提供了新型快捷的文档编辑模式,可以确保用户之间快速、自由、畅通地进行文档的沟通与交流,其重要性日益突显。本文面向科研协作，重在研究在线文档的协同编辑技术，实际开发出一个文档存储与协作共享平台，科研人员可以随时随地上传分享论文，可以与其他人员共享编辑批注论文，提高科研效率。主要技术前台CSS+DIV+JSP+HTML5+开源框架（node.js+socket.io+jquery）后台Spring3.0+Struts2+hiberate3+Ajax数据库Mysql5.1\\n   \\n\\n   \\n\\n   \\n▲计算机水平：全国计算机二级（C语言）全国计算机三级（网络）\\n   \\n▲英语水平：大学英语四级431  \\n   \\n\\n   \\n\\n   \\n\\n   \\n\\n   \\n\\n   \\n\\n   \\n扎实的java开发基础，无论是Android 应用，还是web开发，都已积累了大量的项目经验，英语良好，能自主阅读理解英文开发文档。在本科担任系团总支干工事，硕士院研究生会干事，工作认真扎实。能吃苦，承受一定的工作压力，学习能力极强。性格开朗，兴趣广泛，擅长羽毛球，篮球，象棋。\\n   \\n\\n   \\n\\n  \\n \\n\",\"meta\":{\"author\":\"\",\"timestamp\":1451188381766}}');
INSERT INTO `store` VALUES ('sessionstorage:RUaT5Syb2k0lQulmrdpC3-vRovihyCcO', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:1HHgQMAeyXsnJCrLppcUIJzmAQPMEqvv', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:vT-sBNVvPX8wuRc6Qi58KfYYvYRVFWOr', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:YY7l-lFPCMB3WyAm4SQEY6uOCsqkaFT6', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:D_2XUfFohv3nI9oH-ENN4eid_4TDDeqZ', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:wxlxQKXiki1DZPemlXTMXaOkWPZIzT0b', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:yaNS2d4dD8uba-y-7OYPygIHL85qDCP4', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:lPqLiZm35zl8sZmIOp2rVRfz0WpOijRE', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:DvGJoKZ8UhdoU23EUm8A9vIbviWiVcN4', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:gLAvf66Yv-Wjcw95Z0I371cyiwdU5KjA', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:-9b865aL8EGOc7jdrEWZ9iYb_jLnPQJg', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:0vwgoD9XMZaE5-7RA3WKsa_cBtQFz6a4', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('pad:1:revs:70', '{\"changeset\":\"Z:1q>2|5=1l=4*c+2$科研\",\"meta\":{\"author\":\"a.SbEYQkqWmUTpApSd\",\"timestamp\":1451188675951}}');
INSERT INTO `store` VALUES ('pad:1:revs:71', '{\"changeset\":\"Z:1s>2|5=1l=6*c+2$协作\",\"meta\":{\"author\":\"a.SbEYQkqWmUTpApSd\",\"timestamp\":1451188677277}}');
INSERT INTO `store` VALUES ('pad:1:revs:72', '{\"changeset\":\"Z:1u>2|5=1l=8*c+2$系统\",\"meta\":{\"author\":\"a.SbEYQkqWmUTpApSd\",\"timestamp\":1451188679493}}');
INSERT INTO `store` VALUES ('pad:1:revs:74', '{\"changeset\":\"Z:1y>1|5=1l=c*c|1+1$\\n\",\"meta\":{\"author\":\"a.SbEYQkqWmUTpApSd\",\"timestamp\":1451188692924}}');
INSERT INTO `store` VALUES ('pad:1:revs:73', '{\"changeset\":\"Z:1w>2|5=1l=a*c+2$实现\",\"meta\":{\"author\":\"a.SbEYQkqWmUTpApSd\",\"timestamp\":1451188691692}}');
INSERT INTO `store` VALUES ('pad:1:revs:75', '{\"changeset\":\"Z:1z>3|6=1y*c+3$第六章\",\"meta\":{\"author\":\"a.SbEYQkqWmUTpApSd\",\"timestamp\":1451188695654}}');
INSERT INTO `store` VALUES ('pad:1:revs:76', '{\"changeset\":\"Z:22>1|6=1y=3*c+1$：\",\"meta\":{\"author\":\"a.SbEYQkqWmUTpApSd\",\"timestamp\":1451188697589}}');
INSERT INTO `store` VALUES ('pad:1:revs:77', '{\"changeset\":\"Z:23>2|6=1y=4*c+2$研究\",\"meta\":{\"author\":\"a.SbEYQkqWmUTpApSd\",\"timestamp\":1451188708150}}');
INSERT INTO `store` VALUES ('pad:1:revs:78', '{\"changeset\":\"Z:25>2|6=1y=6*c+2$展望\",\"meta\":{\"author\":\"a.SbEYQkqWmUTpApSd\",\"timestamp\":1451188711800}}');
INSERT INTO `store` VALUES ('sessionstorage:ymEsjpPhoGiKSVRPF_u_236QVh-gbJyC', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:oJesOfCRqv8BS74N-S53d6Qn2CvR4pmu', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:B_tR3ltJe8HgfRMzDDDDloK-8Y8kWqfB', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:OrW6r1CzYRGMOWSKC3tXg-txAr5r4vTt', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('pad:1:revs:79', '{\"changeset\":\"Z:27>0*g=i$\",\"meta\":{\"author\":\"a.84zWwWNyl6az1jLn\",\"timestamp\":1451188877800}}');
INSERT INTO `store` VALUES ('pad:1:revs:80', '{\"changeset\":\"Z:27>1*c*h*2*4+1$*\",\"meta\":{\"author\":\"a.SbEYQkqWmUTpApSd\",\"timestamp\":1451188896910}}');
INSERT INTO `store` VALUES ('pad:1:revs:81', '{\"changeset\":\"Z:28>0*6=1$\",\"meta\":{\"author\":\"a.SbEYQkqWmUTpApSd\",\"timestamp\":1451188899141}}');
INSERT INTO `store` VALUES ('pad:1:revs:82', '{\"changeset\":\"Z:28>6|1=k*c*a*2*4+1|1=7*c*a*2*4+1|1=9*c*a*2*4+1|1=b*c*a*2*4+1|1=b*c*a*2*4+1|1=d*c*a*2*4+1$******\",\"meta\":{\"author\":\"a.SbEYQkqWmUTpApSd\",\"timestamp\":1451188904227}}');
INSERT INTO `store` VALUES ('pad:1:revs:83', '{\"changeset\":\"Z:2e>1|6=24=9*c|1+1$\\n\",\"meta\":{\"author\":\"a.SbEYQkqWmUTpApSd\",\"timestamp\":1451188926535}}');
INSERT INTO `store` VALUES ('sessionstorage:6UzZTDA71AOZiFk_fd4af-TZ9avcg9g-', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:cIhsrjHKECUl3BTK6pgDzP-Js44sorjw', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:tBD1ZMY8zZJwFy2BqbQMwp8rlelBvMOr', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:rjcObc1pY0ejzMLYX15H78d0qtLZT5DI', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:XXrh1ccdoO_spc_TuTzseQ_vEG4wJfK7', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:Jg2ollv2fFeDTstJh07TrbNE5p_6xlw6', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:0I2888AhSkck3maMn0Kvr9WHK_0nGEdn', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:q2d2eqXDVOf_m6KVz5eZ7_e7WlnthXs7', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:HsvecIhOcnl5KlzBfUMbHOQRel3ycAHp', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true},\"user\":{\"password\":\"123456\",\"is_admin\":true,\"username\":\"admin\"}}');
INSERT INTO `store` VALUES ('token2author:t.0I4c9oyQyM7BvRoacsFK', '\"a.ZKOjkcsWEcGN37SL\"');
INSERT INTO `store` VALUES ('globalAuthor:a.ZKOjkcsWEcGN37SL', '{\"colorId\":6,\"name\":null,\"timestamp\":1451189918395}');
INSERT INTO `store` VALUES ('sessionstorage:3RN0l3rxKh8YXhUvihpC5CrLPsiro4kr', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:V2qR7KoQeZH_-IJwrNaWGXHf4yOmnrJ4', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:DNtCunoo3iFj4VdDgFV_Rf-SRygCXfgC', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:5LaUhDojFlt-wyoS-V4vPh5RFmaNjfJ5', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:DRFNsbiKmQ1DRexAd0Ldyno4ul8ihM9-', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:lKduRzFUfQAg4xOkL_4l3Kdhgve7ro2b', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:CHlnb5hglDSmnYRkkiTX634kTGXpPnRS', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:Vn9PMOrRFObHBi7B-iQhuONCOWqPQnuQ', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:xQHS2qwPwl14_QotpOIEnuzHoRRucvYY', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:enZnDimQ7pb0KXFR6GGbDqSh3WQoNpu6', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:I4kYhLdos6UDcxCh3KGalhJbD8zPgAEl', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:YNGUDxc2Q1M37-OkAi0jDWs1nzF5aq0S', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:4QDZK5obbrVW_UR2FT4lxcColGkJHjYv', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true},\"user\":{\"password\":\"123456\",\"is_admin\":true,\"username\":\"admin\"}}');
INSERT INTO `store` VALUES ('sessionstorage:qkE6XRZiJU3Mo4t2c4Zu-T-wQHZ01Lgx', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:_IiGKhetnXl9vNGisojcxmj1u70u0bXC', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:J6kbM48cf1K2UBTc7SK-7AJ5iJL9SEEs', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:hL8b3jeBo7Rc7S7OBsMtBBvdMIC6fe6Z', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:rHPdsi7ZjBrd-3k5Itr2Zpw0FelWJ0O1', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('token2author:t.VuZEiB111d7Ame7KfEGQ', '\"a.PwQZUjZNF9w2QhgQ\"');
INSERT INTO `store` VALUES ('globalAuthor:a.PwQZUjZNF9w2QhgQ', '{\"colorId\":15,\"name\":null,\"timestamp\":1451305160142,\"padIDs\":{\"1\":1}}');
INSERT INTO `store` VALUES ('sessionstorage:0F9xU_UHMvhS8GMlNQXWJ_8Y9OS3nECb', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:FbwkdMBzc4wRoWYRdxNjPO8OhpUKKKZz', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:xjD6VJxXnvZRbWCWtx9UJe6Pn1ofcZui', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:_-uNAmc-Fd_bCUeT57anGXXQ7Mh-9b9N', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:TyHKdNslHm8psISzGdEzFc61IeXa6VOP', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('token2author:t.1F07C400lDSr8VuQUkNq', '\"a.RgSOv5FXxOFo1mC8\"');
INSERT INTO `store` VALUES ('globalAuthor:a.RgSOv5FXxOFo1mC8', '{\"colorId\":5,\"name\":null,\"timestamp\":1451190276793}');
INSERT INTO `store` VALUES ('sessionstorage:x9ilkhfN-V-jQtszAdoVMot81i0Isu-O', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:GfK-LHWVWY3va9Y0zI1r449547aT0QZ7', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:WE_hEgA21qU5J8d8z2BkKNAGQO2_jOEI', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:yVpE-xK0OAJyAfvEeTxIyPTz_32JdUug', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:mcNSi6IktrRlcgLTHxxQyJg00esxEGoJ', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:Zx0Yk5QaBvwKoLlnmHv35hYa8s1CtDyF', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('token2author:t.0GRKjgB4G290jbHAfPWL', '\"a.Oulp16tJikXXTyQP\"');
INSERT INTO `store` VALUES ('globalAuthor:a.Oulp16tJikXXTyQP', '{\"colorId\":24,\"name\":null,\"timestamp\":1451265709747,\"padIDs\":{\"1\":1}}');
INSERT INTO `store` VALUES ('pad:1:revs:84', '{\"changeset\":\"Z:2f>0|2=s=1*i=8$\",\"meta\":{\"author\":\"a.Oulp16tJikXXTyQP\",\"timestamp\":1451265682321}}');
INSERT INTO `store` VALUES ('sessionstorage:QfZuggpQ-erbmBGt59T4bfwb1r1o49S1', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:jAo91sdt-iw8ynPvhEZLkcve3UZ3buw0', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:DpqGqKcNEfhizhhB8zSCEieel1wLwNoE', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:LtQpf4djA1rGV2k0wJycFdWqYNWiS8dC', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:x7JO40yLuNJ2OUbXTM5nG03-QOL_Ml1T', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:ahPDvwcKLIPQNRkHmOkQaToadLC9Ybcv', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('pad:12', '{\"atext\":{\"text\":\"\\n\\n\",\"attribs\":\"|2+2\"},\"pool\":{\"numToAttrib\":{},\"nextNum\":0},\"head\":0,\"chatHead\":-1,\"publicStatus\":false,\"passwordHash\":null,\"savedRevisions\":[]}');
INSERT INTO `store` VALUES ('token2author:t.sulVjV3iFZns85CJCHha', '\"a.inhSsE7bjMPRVWWP\"');
INSERT INTO `store` VALUES ('globalAuthor:a.inhSsE7bjMPRVWWP', '{\"colorId\":29,\"name\":null,\"timestamp\":1451301546062}');
INSERT INTO `store` VALUES ('pad2readonly:12', '\"r.a91f2842bb97b39f313a7c4ea8594131\"');
INSERT INTO `store` VALUES ('readonly2pad:r.a91f2842bb97b39f313a7c4ea8594131', '\"12\"');
INSERT INTO `store` VALUES ('pad:12:revs:0', '{\"changeset\":\"Z:1>1|1+1$\\n\",\"meta\":{\"author\":\"\",\"timestamp\":1451301533151,\"atext\":{\"text\":\"\\n\\n\",\"attribs\":\"|2+2\"}}}');
INSERT INTO `store` VALUES ('sessionstorage:HYv4iWDd2Sm1qfCg1V0qJDrbBYRZ9kEE', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:Lg7lWnfgq9i6kcutwpNKeAckI7x23-hz', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:VYU1CLEZig6K5BMP7MQUhf-iTOVWRmaf', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:LZ2CnCD6jYc0bEN3WPGjAROMSiaJiYvW', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:ifWVgsaYp6HPJJxJTLOBoj7LUl9aYbPE', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:xnZP9Ukv78J89fxmeI4NWIJ3WmAOTVKU', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:om7Nj16avsThLPmYTKh20MBp_DSJT4xb', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:fLh5wtyfzE1lTaqK5EwRidnH07n7RQai', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:XMV8C2sFMjwN2t247RBjVvEp-KnlkxLD', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:th7Vzbtp-nQKPvFWs0W86ijhxxEHE_2F', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:Mo3-o48DPRgJgZp4VB-tYr9exP9Fvn6U', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:I-buNJ6mhlktYI9Y6mlX2HkCc-HI_cT4', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:PWV6pY8Re4dpBRZNafSOZfpd5uCSInQD', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('pad:1:revs:85', '{\"changeset\":\"Z:2f>1|3=12=b*k|1+1$\\n\",\"meta\":{\"author\":\"a.p63AFTFTCLjWrpyX\",\"timestamp\":1451302063799}}');
INSERT INTO `store` VALUES ('pad:1:revs:86', '{\"changeset\":\"Z:2g>1|4=1e*k+1$ \",\"meta\":{\"author\":\"a.p63AFTFTCLjWrpyX\",\"timestamp\":1451302064455}}');
INSERT INTO `store` VALUES ('pad:1:revs:87', '{\"changeset\":\"Z:2h>2|4=1e=1*k+2$  \",\"meta\":{\"author\":\"a.p63AFTFTCLjWrpyX\",\"timestamp\":1451302064938}}');
INSERT INTO `store` VALUES ('pad:1:revs:88', '{\"changeset\":\"Z:2j>1|4=1e=3*k+1$1\",\"meta\":{\"author\":\"a.p63AFTFTCLjWrpyX\",\"timestamp\":1451302065572}}');
INSERT INTO `store` VALUES ('pad:1:revs:89', '{\"changeset\":\"Z:2k>1|3=12=b*l+1$1\",\"meta\":{\"author\":\"a.HKo4I2Mb9HVXfvWq\",\"timestamp\":1451302065712}}');
INSERT INTO `store` VALUES ('pad:1:revs:90', '{\"changeset\":\"Z:2l>1|3=12=c*l+1$1\",\"meta\":{\"author\":\"a.HKo4I2Mb9HVXfvWq\",\"timestamp\":1451302066205}}');
INSERT INTO `store` VALUES ('pad:1:revs:91', '{\"changeset\":\"Z:2m>1|3=12=d*l+1$2\",\"meta\":{\"author\":\"a.HKo4I2Mb9HVXfvWq\",\"timestamp\":1451302068795}}');
INSERT INTO `store` VALUES ('pad:1:revs:92', '{\"changeset\":\"Z:2n>1|3=12=e*l+1$2\",\"meta\":{\"author\":\"a.HKo4I2Mb9HVXfvWq\",\"timestamp\":1451302069415}}');
INSERT INTO `store` VALUES ('pad:1:revs:93', '{\"changeset\":\"Z:2o>1|4=1i=4*l+1$1\",\"meta\":{\"author\":\"a.HKo4I2Mb9HVXfvWq\",\"timestamp\":1451302084370}}');
INSERT INTO `store` VALUES ('pad:1:revs:147', '{\"changeset\":\"Z:dk<11|3=12=b-11$\",\"meta\":{\"author\":\"a.p63AFTFTCLjWrpyX\",\"timestamp\":1451302152484}}');
INSERT INTO `store` VALUES ('pad:1:revs:94', '{\"changeset\":\"Z:2p>bl|8=2o*k|2+2*k*m+2v*k|1+1*k*n+2v*k|1+1*k*n+2v*k|1+1*k*n+2v$\\n\\n{\\\"payload\\\":[[\\\" \\\",\\\" \\\",\\\" \\\",\\\" \\\"]],\\\"tblId\\\":1,\\\"tblClass\\\":\\\"data-tables\\\",\\\"trClass\\\":\\\"alst\\\",\\\"tdClass\\\":\\\"hide-el\\\"}\\n{\\\"payload\\\":[[\\\" \\\",\\\" \\\",\\\" \\\",\\\" \\\"]],\\\"tblId\\\":1,\\\"tblClass\\\":\\\"data-tables\\\",\\\"trClass\\\":\\\"alst\\\",\\\"tdClass\\\":\\\"hide-el\\\"}\\n{\\\"payload\\\":[[\\\" \\\",\\\" \\\",\\\" \\\",\\\" \\\"]],\\\"tblId\\\":1,\\\"tblClass\\\":\\\"data-tables\\\",\\\"trClass\\\":\\\"alst\\\",\\\"tdClass\\\":\\\"hide-el\\\"}\\n{\\\"payload\\\":[[\\\" \\\",\\\" \\\",\\\" \\\",\\\" \\\"]],\\\"tblId\\\":1,\\\"tblClass\\\":\\\"data-tables\\\",\\\"trClass\\\":\\\"alst\\\",\\\"tdClass\\\":\\\"hide-el\\\"}\",\"meta\":{\"author\":\"a.p63AFTFTCLjWrpyX\",\"timestamp\":1451302090628}}');
INSERT INTO `store` VALUES ('pad:1:revs:95', '{\"changeset\":\"Z:ea>1|3=12=f*l+1$1\",\"meta\":{\"author\":\"a.HKo4I2Mb9HVXfvWq\",\"timestamp\":1451302102041}}');
INSERT INTO `store` VALUES ('pad:1:revs:96', '{\"changeset\":\"Z:eb>1|3=12=g*l+1$1\",\"meta\":{\"author\":\"a.HKo4I2Mb9HVXfvWq\",\"timestamp\":1451302102540}}');
INSERT INTO `store` VALUES ('pad:1:revs:97', '{\"changeset\":\"Z:ec>1|3=12=h*l+1$1\",\"meta\":{\"author\":\"a.HKo4I2Mb9HVXfvWq\",\"timestamp\":1451302103196}}');
INSERT INTO `store` VALUES ('pad:1:revs:98', '{\"changeset\":\"Z:ed>1|3=12=i*l+1$1\",\"meta\":{\"author\":\"a.HKo4I2Mb9HVXfvWq\",\"timestamp\":1451302103693}}');
INSERT INTO `store` VALUES ('pad:1:revs:99', '{\"changeset\":\"Z:ee>1|3=12=j*l+1$1\",\"meta\":{\"author\":\"a.HKo4I2Mb9HVXfvWq\",\"timestamp\":1451302104386}}');
INSERT INTO `store` VALUES ('pad:1:revs:100', '{\"changeset\":\"Z:ef>1|3=12=k*l+1$1\",\"meta\":{\"author\":\"a.HKo4I2Mb9HVXfvWq\",\"timestamp\":1451302104900,\"atext\":{\"text\":\"*面向科研协作的协同编辑技术研究与实现\\n*第一章：绪论\\n*第二章：关键技术\\n*第三章：协同编辑原理1122111111\\n   11\\n*第四章：协同编辑技术\\n*第五章：科研协作系统实现\\n*第六章：研究展望\\n\\n\\n{\\\"payload\\\":[[\\\" \\\",\\\" \\\",\\\" \\\",\\\" \\\"]],\\\"tblId\\\":1,\\\"tblClass\\\":\\\"data-tables\\\",\\\"trClass\\\":\\\"alst\\\",\\\"tdClass\\\":\\\"hide-el\\\"}\\n{\\\"payload\\\":[[\\\" \\\",\\\" \\\",\\\" \\\",\\\" \\\"]],\\\"tblId\\\":1,\\\"tblClass\\\":\\\"data-tables\\\",\\\"trClass\\\":\\\"alst\\\",\\\"tdClass\\\":\\\"hide-el\\\"}\\n{\\\"payload\\\":[[\\\" \\\",\\\" \\\",\\\" \\\",\\\" \\\"]],\\\"tblId\\\":1,\\\"tblClass\\\":\\\"data-tables\\\",\\\"trClass\\\":\\\"alst\\\",\\\"tdClass\\\":\\\"hide-el\\\"}\\n{\\\"payload\\\":[[\\\" \\\",\\\" \\\",\\\" \\\",\\\" \\\"]],\\\"tblId\\\":1,\\\"tblClass\\\":\\\"data-tables\\\",\\\"trClass\\\":\\\"alst\\\",\\\"tdClass\\\":\\\"hide-el\\\"}\\n\",\"attribs\":\"*6*c*h*2*4+1*c*g+i*c|1+1*c*a*2*4+1*c|1+7*c*a*2*4+1*c*i+8*c|1+1*c*a*2*4+1*c+a*l+a*k|1+1*k+4*l+1*c|1+1*c*a*2*4+1*c|1+b*c*a*2*4+1*c|1+d*c*a*2*4+1*c|1+9*k|2+2*k*m+2v*k|1+1*k*n+2v*k|1+1*k*n+2v*k|1+1*k*n+2v|1+1\"}}}');
INSERT INTO `store` VALUES ('pad:1:revs:101', '{\"changeset\":\"Z:eg>2|3=12=l*l+2$11\",\"meta\":{\"author\":\"a.HKo4I2Mb9HVXfvWq\",\"timestamp\":1451302105366}}');
INSERT INTO `store` VALUES ('pad:1:revs:106', '{\"changeset\":\"Z:em>1|3=12=r*l+1$1\",\"meta\":{\"author\":\"a.HKo4I2Mb9HVXfvWq\",\"timestamp\":1451302109714}}');
INSERT INTO `store` VALUES ('pad:1:revs:102', '{\"changeset\":\"Z:ei>1|3=12=n*l+1$1\",\"meta\":{\"author\":\"a.HKo4I2Mb9HVXfvWq\",\"timestamp\":1451302106607}}');
INSERT INTO `store` VALUES ('pad:1:revs:103', '{\"changeset\":\"Z:ej>1|3=12=o*l+1$1\",\"meta\":{\"author\":\"a.HKo4I2Mb9HVXfvWq\",\"timestamp\":1451302107436}}');
INSERT INTO `store` VALUES ('pad:1:revs:104', '{\"changeset\":\"Z:ek>1|3=12=p*l+1$1\",\"meta\":{\"author\":\"a.HKo4I2Mb9HVXfvWq\",\"timestamp\":1451302107931}}');
INSERT INTO `store` VALUES ('pad:1:revs:105', '{\"changeset\":\"Z:el>1|3=12=q*l+1$1\",\"meta\":{\"author\":\"a.HKo4I2Mb9HVXfvWq\",\"timestamp\":1451302108420}}');
INSERT INTO `store` VALUES ('pad:1:revs:107', '{\"changeset\":\"Z:en<y|a=33=f-2e*k+1g$q\\\",\\\" \\\",\\\" \\\",\\\" \\\"]],\\\"tblId\\\":\\\"1\\\",\\\"tblClass\\\":\\\"data-tables\",\"meta\":{\"author\":\"a.p63AFTFTCLjWrpyX\",\"timestamp\":1451302109737}}');
INSERT INTO `store` VALUES ('pad:1:revs:108', '{\"changeset\":\"Z:dp>1|a=33=g*k+1$q\",\"meta\":{\"author\":\"a.p63AFTFTCLjWrpyX\",\"timestamp\":1451302110191}}');
INSERT INTO `store` VALUES ('pad:1:revs:109', '{\"changeset\":\"Z:dq>2|3=12=s*l+2$11\",\"meta\":{\"author\":\"a.HKo4I2Mb9HVXfvWq\",\"timestamp\":1451302110227}}');
INSERT INTO `store` VALUES ('pad:1:revs:110', '{\"changeset\":\"Z:ds>2|a=35=h*k+2$qq\",\"meta\":{\"author\":\"a.p63AFTFTCLjWrpyX\",\"timestamp\":1451302110661}}');
INSERT INTO `store` VALUES ('pad:1:revs:111', '{\"changeset\":\"Z:du>1|3=12=u*l+1$1\",\"meta\":{\"author\":\"a.HKo4I2Mb9HVXfvWq\",\"timestamp\":1451302110716}}');
INSERT INTO `store` VALUES ('pad:1:revs:112', '{\"changeset\":\"Z:dv>2|a=36=j*k+2$qq\",\"meta\":{\"author\":\"a.p63AFTFTCLjWrpyX\",\"timestamp\":1451302111145}}');
INSERT INTO `store` VALUES ('pad:1:revs:113', '{\"changeset\":\"Z:dx>1|3=12=v*l+1$1\",\"meta\":{\"author\":\"a.HKo4I2Mb9HVXfvWq\",\"timestamp\":1451302111205}}');
INSERT INTO `store` VALUES ('pad:1:revs:114', '{\"changeset\":\"Z:dy>1|3=12=w*l+1$1\",\"meta\":{\"author\":\"a.HKo4I2Mb9HVXfvWq\",\"timestamp\":1451302111783}}');
INSERT INTO `store` VALUES ('pad:1:revs:115', '{\"changeset\":\"Z:dz>1|3=12=x*l+1$1\",\"meta\":{\"author\":\"a.HKo4I2Mb9HVXfvWq\",\"timestamp\":1451302112281}}');
INSERT INTO `store` VALUES ('pad:1:revs:116', '{\"changeset\":\"Z:e0>2|3=12=y*l+2$11\",\"meta\":{\"author\":\"a.HKo4I2Mb9HVXfvWq\",\"timestamp\":1451302112778}}');
INSERT INTO `store` VALUES ('pad:1:revs:117', '{\"changeset\":\"Z:e2>1|3=12=10*l+1$1\",\"meta\":{\"author\":\"a.HKo4I2Mb9HVXfvWq\",\"timestamp\":1451302113249}}');
INSERT INTO `store` VALUES ('pad:1:revs:118', '{\"changeset\":\"Z:e3<y|b=5f=f-2e*k+1g$q\\\",\\\" \\\",\\\" \\\",\\\" \\\"]],\\\"tblId\\\":\\\"1\\\",\\\"tblClass\\\":\\\"data-tables\",\"meta\":{\"author\":\"a.p63AFTFTCLjWrpyX\",\"timestamp\":1451302114603}}');
INSERT INTO `store` VALUES ('pad:1:revs:119', '{\"changeset\":\"Z:d5>2|b=5f=g*k+2$qq\",\"meta\":{\"author\":\"a.p63AFTFTCLjWrpyX\",\"timestamp\":1451302115087}}');
INSERT INTO `store` VALUES ('pad:1:revs:120', '{\"changeset\":\"Z:d7>1|3=12=11*l+1$1\",\"meta\":{\"author\":\"a.HKo4I2Mb9HVXfvWq\",\"timestamp\":1451302118960}}');
INSERT INTO `store` VALUES ('pad:1:revs:121', '{\"changeset\":\"Z:d8>1|3=12=12*l+1$1\",\"meta\":{\"author\":\"a.HKo4I2Mb9HVXfvWq\",\"timestamp\":1451302119444}}');
INSERT INTO `store` VALUES ('pad:1:revs:122', '{\"changeset\":\"Z:d9>1|3=12=13*l+1$1\",\"meta\":{\"author\":\"a.HKo4I2Mb9HVXfvWq\",\"timestamp\":1451302119946}}');
INSERT INTO `store` VALUES ('pad:1:revs:123', '{\"changeset\":\"Z:da>1|3=12=14*l+1$1\",\"meta\":{\"author\":\"a.HKo4I2Mb9HVXfvWq\",\"timestamp\":1451302121841}}');
INSERT INTO `store` VALUES ('pad:1:revs:124', '{\"changeset\":\"Z:db>2|3=12=15*l+2$11\",\"meta\":{\"author\":\"a.HKo4I2Mb9HVXfvWq\",\"timestamp\":1451302122323}}');
INSERT INTO `store` VALUES ('pad:1:revs:125', '{\"changeset\":\"Z:dd>1|3=12=12*k+1$2\",\"meta\":{\"author\":\"a.p63AFTFTCLjWrpyX\",\"timestamp\":1451302122712}}');
INSERT INTO `store` VALUES ('pad:1:revs:126', '{\"changeset\":\"Z:de>1|3=12=18*l+1$1\",\"meta\":{\"author\":\"a.HKo4I2Mb9HVXfvWq\",\"timestamp\":1451302122797}}');
INSERT INTO `store` VALUES ('pad:1:revs:127', '{\"changeset\":\"Z:df>2|3=12=19*l+2$11\",\"meta\":{\"author\":\"a.HKo4I2Mb9HVXfvWq\",\"timestamp\":1451302123283}}');
INSERT INTO `store` VALUES ('pad:1:revs:128', '{\"changeset\":\"Z:dh>1|3=12=13*k+1$2\",\"meta\":{\"author\":\"a.p63AFTFTCLjWrpyX\",\"timestamp\":1451302123301}}');
INSERT INTO `store` VALUES ('pad:1:revs:129', '{\"changeset\":\"Z:di>1|3=12=14*k+1$2\",\"meta\":{\"author\":\"a.p63AFTFTCLjWrpyX\",\"timestamp\":1451302123770}}');
INSERT INTO `store` VALUES ('pad:1:revs:130', '{\"changeset\":\"Z:dj>2|3=12=1d*l+2$11\",\"meta\":{\"author\":\"a.HKo4I2Mb9HVXfvWq\",\"timestamp\":1451302123774}}');
INSERT INTO `store` VALUES ('pad:1:revs:131', '{\"changeset\":\"Z:dl>2|3=12=15*k+2$22\",\"meta\":{\"author\":\"a.p63AFTFTCLjWrpyX\",\"timestamp\":1451302124238}}');
INSERT INTO `store` VALUES ('pad:1:revs:132', '{\"changeset\":\"Z:dn>2|3=12=1h*l+2$11\",\"meta\":{\"author\":\"a.HKo4I2Mb9HVXfvWq\",\"timestamp\":1451302124265}}');
INSERT INTO `store` VALUES ('pad:1:revs:133', '{\"changeset\":\"Z:dp>3|3=12=17*k+3$222\",\"meta\":{\"author\":\"a.p63AFTFTCLjWrpyX\",\"timestamp\":1451302124714}}');
INSERT INTO `store` VALUES ('pad:1:revs:134', '{\"changeset\":\"Z:ds>1|3=12=1m*l+1$1\",\"meta\":{\"author\":\"a.HKo4I2Mb9HVXfvWq\",\"timestamp\":1451302124752}}');
INSERT INTO `store` VALUES ('pad:1:revs:135', '{\"changeset\":\"Z:dt>1|3=12=1a*k+1$2\",\"meta\":{\"author\":\"a.p63AFTFTCLjWrpyX\",\"timestamp\":1451302125243}}');
INSERT INTO `store` VALUES ('pad:1:revs:136', '{\"changeset\":\"Z:du>1|3=12=1o*l+1$1\",\"meta\":{\"author\":\"a.HKo4I2Mb9HVXfvWq\",\"timestamp\":1451302125297}}');
INSERT INTO `store` VALUES ('pad:1:revs:137', '{\"changeset\":\"Z:dv>1|3=12=1b*k+1$2\",\"meta\":{\"author\":\"a.p63AFTFTCLjWrpyX\",\"timestamp\":1451302125717}}');
INSERT INTO `store` VALUES ('pad:1:revs:138', '{\"changeset\":\"Z:dw>1|3=12=1c*k+1$2\",\"meta\":{\"author\":\"a.p63AFTFTCLjWrpyX\",\"timestamp\":1451302127400}}');
INSERT INTO `store` VALUES ('pad:1:revs:139', '{\"changeset\":\"Z:dx>1|3=12=1d*k+1$2\",\"meta\":{\"author\":\"a.p63AFTFTCLjWrpyX\",\"timestamp\":1451302127949}}');
INSERT INTO `store` VALUES ('pad:1:revs:146', '{\"changeset\":\"Z:dv<b|3=12=o-b$\",\"meta\":{\"author\":\"a.HKo4I2Mb9HVXfvWq\",\"timestamp\":1451302151770}}');
INSERT INTO `store` VALUES ('pad:1:revs:140', '{\"changeset\":\"Z:dy>1|b=66=i*l+1$1\",\"meta\":{\"author\":\"a.HKo4I2Mb9HVXfvWq\",\"timestamp\":1451302136312}}');
INSERT INTO `store` VALUES ('pad:1:revs:141', '{\"changeset\":\"Z:dz>1|b=66=j*l+1$1\",\"meta\":{\"author\":\"a.HKo4I2Mb9HVXfvWq\",\"timestamp\":1451302137322}}');
INSERT INTO `store` VALUES ('pad:1:revs:142', '{\"changeset\":\"Z:e0<1|3=12=1a-1$\",\"meta\":{\"author\":\"a.HKo4I2Mb9HVXfvWq\",\"timestamp\":1451302142395}}');
INSERT INTO `store` VALUES ('pad:1:revs:143', '{\"changeset\":\"Z:dz<1|3=12=19-1$\",\"meta\":{\"author\":\"a.HKo4I2Mb9HVXfvWq\",\"timestamp\":1451302143071}}');
INSERT INTO `store` VALUES ('pad:1:revs:144', '{\"changeset\":\"Z:dy<1|3=12=18-1$\",\"meta\":{\"author\":\"a.HKo4I2Mb9HVXfvWq\",\"timestamp\":1451302143560}}');
INSERT INTO `store` VALUES ('pad:1:revs:145', '{\"changeset\":\"Z:dx<2|3=12=16-2$\",\"meta\":{\"author\":\"a.HKo4I2Mb9HVXfvWq\",\"timestamp\":1451302144035}}');
INSERT INTO `store` VALUES ('pad:1:revs:148', '{\"changeset\":\"Z:cj<5|4=1e-5$\",\"meta\":{\"author\":\"a.HKo4I2Mb9HVXfvWq\",\"timestamp\":1451302160953}}');
INSERT INTO `store` VALUES ('pad:1:revs:149', '{\"changeset\":\"Z:ce<1|3=12=b|1-1$\",\"meta\":{\"author\":\"a.HKo4I2Mb9HVXfvWq\",\"timestamp\":1451302161483}}');
INSERT INTO `store` VALUES ('sessionstorage:oBOcIPl4GEleo3i8QknrH9uG0I5qs1Hc', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('pad:1:revs:150', '{\"changeset\":\"Z:cd>0|2=s=1*o|1=9*o=1$\",\"meta\":{\"author\":\"a.HKo4I2Mb9HVXfvWq\",\"timestamp\":1451302237400}}');
INSERT INTO `store` VALUES ('sessionstorage:9ZXNcdbfTAphMg_06FtpY6W68r3JRBE_', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:9Ty2zsN6OWdPqAFmQztteGjYA_AdQ9u0', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('pad:1:revs:151', '{\"changeset\":\"Z:cd>0|6=24=5*p=4$\",\"meta\":{\"author\":\"a.HKo4I2Mb9HVXfvWq\",\"timestamp\":1451302326297}}');
INSERT INTO `store` VALUES ('sessionstorage:jPcEl_jSPYo3kPEgU5xycJwPhzhi0pnd', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:RKo44VIdSG6mpiw8VncUQCoamcOZ13km', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('pad:1:revs:152', '{\"changeset\":\"Z:cd>1|6=24=9*l|1+1$\\n\",\"meta\":{\"author\":\"a.HKo4I2Mb9HVXfvWq\",\"timestamp\":1451302376798}}');
INSERT INTO `store` VALUES ('pad:1:revs:153', '{\"changeset\":\"Z:ce>3|7=2e*l+3$第七章\",\"meta\":{\"author\":\"a.HKo4I2Mb9HVXfvWq\",\"timestamp\":1451302382256}}');
INSERT INTO `store` VALUES ('pad:1:revs:154', '{\"changeset\":\"Z:ch>1|7=2e=3*l+1$ \",\"meta\":{\"author\":\"a.HKo4I2Mb9HVXfvWq\",\"timestamp\":1451302383060}}');
INSERT INTO `store` VALUES ('pad:1:revs:155', '{\"changeset\":\"Z:ci>1|7=2e=4*l+1$ \",\"meta\":{\"author\":\"a.HKo4I2Mb9HVXfvWq\",\"timestamp\":1451302383545}}');
INSERT INTO `store` VALUES ('pad:1:revs:156', '{\"changeset\":\"Z:cj>3|7=2e=5*l+3$ 总结\",\"meta\":{\"author\":\"a.HKo4I2Mb9HVXfvWq\",\"timestamp\":1451302384843}}');
INSERT INTO `store` VALUES ('pad:1:revs:158', '{\"changeset\":\"Z:cn<1|7=2e-1$\",\"meta\":{\"author\":\"a.p63AFTFTCLjWrpyX\",\"timestamp\":1451302444086}}');
INSERT INTO `store` VALUES ('pad:1:revs:157', '{\"changeset\":\"Z:cm>1|7=2e*k*h*2*4+1$*\",\"meta\":{\"author\":\"a.p63AFTFTCLjWrpyX\",\"timestamp\":1451302436128}}');
INSERT INTO `store` VALUES ('pad:1:revs:159', '{\"changeset\":\"Z:cm>0|7=2e*q=8$\",\"meta\":{\"author\":\"a.p63AFTFTCLjWrpyX\",\"timestamp\":1451302460265}}');
INSERT INTO `store` VALUES ('sessionstorage:XBFNDxV01as5jRlsO_Es81kM6yxjpBUO', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:Ex1qyHOpU32sJ9rFcHzOvt10XA6eVhA8', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('pad:1:revs:160', '{\"changeset\":\"Z:cm>0|7=2e*e=8$\",\"meta\":{\"author\":\"a.HKo4I2Mb9HVXfvWq\",\"timestamp\":1451302496089}}');
INSERT INTO `store` VALUES ('pad:1:revs:161', '{\"changeset\":\"Z:cm>0|7=2e*r=8$\",\"meta\":{\"author\":\"a.HKo4I2Mb9HVXfvWq\",\"timestamp\":1451302496545}}');
INSERT INTO `store` VALUES ('pad:1:revs:162', '{\"changeset\":\"Z:cm>0|7=2e*e=8$\",\"meta\":{\"author\":\"a.HKo4I2Mb9HVXfvWq\",\"timestamp\":1451302497044}}');
INSERT INTO `store` VALUES ('pad:1:revs:163', '{\"changeset\":\"Z:cm>0|7=2e*s*t*u*v*w*x*y*z*10*11*12*13*14=8$\",\"meta\":{\"author\":\"a.HKo4I2Mb9HVXfvWq\",\"timestamp\":1451302510167}}');
INSERT INTO `store` VALUES ('pad:1:revs:164', '{\"changeset\":\"Z:cm>0|7=2e*s*15*u*v*w*x*y*z*16*11*12*13*14=8$\",\"meta\":{\"author\":\"a.HKo4I2Mb9HVXfvWq\",\"timestamp\":1451302513449}}');
INSERT INTO `store` VALUES ('pad:1:revs:165', '{\"changeset\":\"Z:cm>0|7=2e=3-1*l*e*q*16+1$：\",\"meta\":{\"author\":\"a.HKo4I2Mb9HVXfvWq\",\"timestamp\":1451302520224}}');
INSERT INTO `store` VALUES ('pad:1:revs:166', '{\"changeset\":\"Z:cm<1|7=2e=4-1$\",\"meta\":{\"author\":\"a.HKo4I2Mb9HVXfvWq\",\"timestamp\":1451302522274}}');
INSERT INTO `store` VALUES ('pad:1:revs:167', '{\"changeset\":\"Z:cl<1|7=2e=4-1$\",\"meta\":{\"author\":\"a.HKo4I2Mb9HVXfvWq\",\"timestamp\":1451302523008}}');
INSERT INTO `store` VALUES ('pad:1:revs:168', '{\"changeset\":\"Z:ck>1|1=k*3*17=1|1=7*3*18=1|1=9*3*19=1|1=b*3*1a=1|1=b*3*1b=1|1=d*3*1c=1|1=9*l*2*3*4*1d+1$*\",\"meta\":{\"author\":\"a.HKo4I2Mb9HVXfvWq\",\"timestamp\":1451302600706}}');
INSERT INTO `store` VALUES ('pad:1:revs:169', '{\"changeset\":\"Z:cl>2|1=k*17=1|1=7*18=1|1=9*19=1|1=b*1a=1|1=b*1b=1|1=d*1c=1=8*l|1+1*l*2*3*4*1d+1|1=1*1e=1$\\n*\",\"meta\":{\"author\":\"a.HKo4I2Mb9HVXfvWq\",\"timestamp\":1451302613209}}');
INSERT INTO `store` VALUES ('pad:1:revs:170', '{\"changeset\":\"Z:cn<1|8=2g-1$\",\"meta\":{\"author\":\"a.HKo4I2Mb9HVXfvWq\",\"timestamp\":1451302617167}}');
INSERT INTO `store` VALUES ('pad:1:revs:171', '{\"changeset\":\"Z:cm>0|1=k=1*1f|7=1v*1f=6$\",\"meta\":{\"author\":\"a.HKo4I2Mb9HVXfvWq\",\"timestamp\":1451302633590}}');
INSERT INTO `store` VALUES ('sessionstorage:WpJAidvYLOSBP50yDD10P1WZEIo7CkQ_', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:ei3Oqat4ky3bek06imfQ4nF0bWmt4GT_', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:VlGRNzPwJP4UCM6lGAqLStNjPW5z4Q5H', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:-JuKFq9a5_q52_yuKhuQ8VAIUH3Za8VS', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('pad:1:revs:172', '{\"changeset\":\"Z:cm>1|1=k*3*17=1|1=7*3*18=1|1=9*3*19=1|1=b*3*1a=1|1=b*3*1b=1|1=d*3*1c=1|1=9*3*1d=1|1=1*l*2*3*4*1e+1$*\",\"meta\":{\"author\":\"a.HKo4I2Mb9HVXfvWq\",\"timestamp\":1451302687587}}');
INSERT INTO `store` VALUES ('pad:1:revs:174', '{\"changeset\":\"Z:cn<2|7=2e=1|1-1-1$\",\"meta\":{\"author\":\"a.HKo4I2Mb9HVXfvWq\",\"timestamp\":1451302695327}}');
INSERT INTO `store` VALUES ('pad:1:revs:173', '{\"changeset\":\"Z:cn>0|1=k*1g=1|1=7*1g*17=1|1=9*1g*17=1|1=b*1g*17=1|1=b*1g*17=1|1=d*1g*17=1|1=9*1g*17=1|1=1*1g*17=1$\",\"meta\":{\"author\":\"a.HKo4I2Mb9HVXfvWq\",\"timestamp\":1451302690639}}');
INSERT INTO `store` VALUES ('sessionstorage:9HV5I1N_Rvtm3sFXx6amcpx7Ch6ZGIOj', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:YuKcXl8-OWlV5fgY0vLiFOlsXpTMdSfO', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:yOskVEJ_XRiKGOmmJcVjPFZxN3ivSacK', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:F019s1JpiX4SiSXD3_W1vx8AIS0vLKI6', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:iDUDQDscIs1KitfBXfeHcwvI-xPyxhi7', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:FLZbo0G2rdDPn99ih4Y1JB5eulH5yJlP', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:pxxLIOhE-XXKLA88AH0xBSjZbiMLZ4KX', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:YYIdfcWEdnn_RSBVC-qeYzn2kJCoCuQ6', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:Fw4Ca0PlKbIthIxwzp72xCOnc_D0Ltaa', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('pad:1:revs:175', '{\"changeset\":\"Z:cl>0|1=k=1*1h=6$\",\"meta\":{\"author\":\"a.PwQZUjZNF9w2QhgQ\",\"timestamp\":1451304134706}}');
INSERT INTO `store` VALUES ('sessionstorage:WDHDkfaENuReya_t3DFwrWiH8Z1U4iss', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:qznVDKITkBmQnIWsIwkjHVY3oz12WM1F', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:G05KL2qJsO0lLKfskk9CgkJycN01wiAe', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:Ip7HQnK5XV259t1cxHLsfbWJOWUDbTt6', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('pad:1:revs:176', '{\"changeset\":\"Z:cl<2|1=k=1-6*1i*1h+4$绪论介绍\",\"meta\":{\"author\":\"a.PwQZUjZNF9w2QhgQ\",\"timestamp\":1451304186929}}');
INSERT INTO `store` VALUES ('sessionstorage:ZJVvAjYNuxvvOS9OITaP4G6hVyULJuJ-', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:CcM5FTVaHACqprvs-7sU-h7MyyfPUILe', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:ubUAdH5-V6_W3V9OcM0xWJ_5bH08i0Yt', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:sPiD1zLA3z4Hn0bo82tuPj7qAtRdsMtY', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:Szgxrj9K-vSvCYR2dMcARc2mrEjnTAdI', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:HAZD6rI8d5l4wHioWQwNSK-HMCOWCQa0', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:c1OEXYS4O9R7u_a3Y1x9ginUOHmC1dV2', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:Q5r2Mc4t13Sic2jMEEaalFVwNxkeXLPG', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:KX3Xmy4ql_N_LHFK1tgJBs2_vQBgydww', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:FsqILpALG9Z4aREBuK_u5t7BiEsIHtoo', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:SPaLAmMO14hYBrrs-sRxtj3DEuAhueRH', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:S5_vqtrdX0AjUYzb1stTV77nT3slV5Tp', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:XPy44aIBSCCI0kU2HcwEUgYUHYUvZ7Lw', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:pmk4EM7n1h106LqsZrNq6DWjkIQKZ8in', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:VfpWLf1sry2Ys4K3XlPGFXTZ8eCDfAAN', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:WXFcRrh_J4RfvqQW7biIfKE_VlSg9vN2', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:rdYXt3w1iuq-eIs6xrOyz7JtdrqPCyGb', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:Aq3SNAHlvCr8qXH4hH5pkrL6GCak2snJ', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:3t8eOJ6g54JX6ib-d6_oyzGdW2YQLHqs', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:KiwGiWGiV-9UEDP6jTUbXTFNEJkQn1Ks', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:wqdkKMfgUoTyq5lDAWrWQuzUFRqcqdTn', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:_vQx7-gR5AxKeH9a3zb9jPPvE2483DH1', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:rDM73BPrykbSAsrW89bip9kop8e3WW45', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:6Bk7F5oAvzsnQLZAK7NpTp0YWznFAArn', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:NUv6Kz2kNC0N0RzT6XOx-7fPNQRzi8PJ', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:iI-FxdGEZANEiotTI9ciethhXJejhZnJ', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:ioRzTh1eNnmfgGEyF9SqumqWzPME8C4r', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:SWotTLRdjdnp8c0bpueNIRyd6MxeB8ta', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:KjSQ8xPiz38N_rQRxkXp8iyNnFPiTrAr', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:S3BC7YOsCiwP2s5sUYjlV3YpGGMGVe7z', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:Y4pNg8tc-PmQWCmMNmdzY6zHiKgd6do9', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:PHrE8gHPxFNrD8WbIAN1JthcY3VNpQyN', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:hYvAfXuCCLYb5hABjHp4DACAWT8rMLaY', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:3spmX3lN0GeXohTPJ7fThw7xXerqA1_X', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:2RrioYj3TuYVZbmjVQ64AhY2GdsfFlLj', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:SJ6gO6PFEBntThxQUFOJaaNJgeJuVW4o', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:XizzT0Z0zSYWcHEjeuXNlH5Q73vCYOrX', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:GOWxo_sUG3K5I19YHx3jDepu0qqXyQa5', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:fVSJFLaEnlR1ezVr9AxYC-Jx_h4YbP9s', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:EPvyhSvb8VTAab0VNAkGujiVa6vI41vC', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:DJVRogcI4PNLRNNUlPvLHexDsbDwUpcZ', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:-AOyt6mDCQYX-8OG8SYAwR71ET1OgHv-', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:hR6xVJOOfciJowtDYHHUpBuDeWBMPBfS', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:K3a04yQ_nCPDBDC5-dzGr5wDmTvVYsYI', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:n7MvWu8UgpuS0ndBa1NsKqJD-s-k8GM2', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('pad:3:revs:3', '{\"changeset\":\"Z:5<1-3*1+2$那那\",\"meta\":{\"author\":\"a.84zWwWNyl6az1jLn\",\"timestamp\":1451311946517}}');
INSERT INTO `store` VALUES ('pad:3:revs:7', '{\"changeset\":\"Z:5<1=2-1$\",\"meta\":{\"author\":\"a.84zWwWNyl6az1jLn\",\"timestamp\":1451311951650}}');
INSERT INTO `store` VALUES ('pad:3:revs:4', '{\"changeset\":\"Z:4>5=2*1+5$真飘来那个\",\"meta\":{\"author\":\"a.84zWwWNyl6az1jLn\",\"timestamp\":1451311950043}}');
INSERT INTO `store` VALUES ('pad:3:revs:5', '{\"changeset\":\"Z:9<1=6-1$\",\"meta\":{\"author\":\"a.84zWwWNyl6az1jLn\",\"timestamp\":1451311950636}}');
INSERT INTO `store` VALUES ('pad:3:revs:6', '{\"changeset\":\"Z:8<3=3-3$\",\"meta\":{\"author\":\"a.84zWwWNyl6az1jLn\",\"timestamp\":1451311951151}}');
INSERT INTO `store` VALUES ('pad:3:revs:8', '{\"changeset\":\"Z:4>2=2*1+2$漂亮\",\"meta\":{\"author\":\"a.84zWwWNyl6az1jLn\",\"timestamp\":1451311959029}}');
INSERT INTO `store` VALUES ('pad:3:revs:9', '{\"changeset\":\"Z:6>1=4*1+1$！\",\"meta\":{\"author\":\"a.84zWwWNyl6az1jLn\",\"timestamp\":1451311960074}}');
INSERT INTO `store` VALUES ('pad:3:revs:10', '{\"changeset\":\"Z:7>1=2*1+1$真\",\"meta\":{\"author\":\"a.84zWwWNyl6az1jLn\",\"timestamp\":1451311962695}}');
INSERT INTO `store` VALUES ('sessionstorage:gZbBUSSnN36J_JhdG3M-_CyC_Xgl8UVf', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:13sxSUOkf0_AJ6IyNXWpp2iUDx8N3X3y', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:z7JoyAE0uCN29MsQdEIoUMImPzdwNGyG', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('comments:3', '{\"c-Bea03N4O18KpiMQf\":{\"author\":\"a.LNnwdmqyaJtzQNSy\",\"name\":\"ruirui\",\"text\":\"胡说\",\"changeTo\":\"明明是寻丽娜真漂亮\\n！\",\"changeFrom\":\"那那真漂亮！\\n\",\"timestamp\":1451312068416,\"changeAccepted\":true,\"changeReverted\":false}}');
INSERT INTO `store` VALUES ('pad:3:revs:11', '{\"changeset\":\"Z:8>0*2|1=7$\",\"meta\":{\"author\":\"a.LNnwdmqyaJtzQNSy\",\"timestamp\":1451312068510}}');
INSERT INTO `store` VALUES ('sessionstorage:yAJYgy_Z4w4W4is0D70hfv4jWxF3wsHG', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:C5PLSzzaAeAabCXRRGnEKaeD38CvSQlk', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('pad:3:revs:12', '{\"changeset\":\"Z:8>4-2*1*2+6$明明是寻丽娜\",\"meta\":{\"author\":\"a.84zWwWNyl6az1jLn\",\"timestamp\":1451312112034}}');

-- ----------------------------
-- Table structure for task
-- ----------------------------
DROP TABLE IF EXISTS `task`;
CREATE TABLE `task` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `task_name` varchar(30) NOT NULL COMMENT '任务名称',
  `task_level` varchar(15) NOT NULL COMMENT '任务级别',
  `task_status` varchar(15) DEFAULT NULL COMMENT '任务状态',
  `comple_content` varchar(100) DEFAULT NULL COMMENT '已完成情况',
  `tCreate_user` varchar(30) DEFAULT NULL COMMENT '任务提交人',
  `tExecute_user` varchar(20) DEFAULT NULL COMMENT '任务执行人',
  `task_createTime` varchar(30) NOT NULL,
  `task_completime` varchar(20) DEFAULT NULL COMMENT '任务完成时间',
  `task_content` varchar(100) NOT NULL COMMENT '任务详细内容描述',
  `task_attach` varchar(30) DEFAULT NULL COMMENT '任务附件',
  `Group_ID` varchar(20) DEFAULT NULL COMMENT '所属团队',
  `taskIsCheck` varchar(10) DEFAULT NULL COMMENT '任务是否审批',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of task
-- ----------------------------
INSERT INTO `task` VALUES ('1', '修改论文标题', '重要', '急', '90%', null, null, '2015-11-16', null, '标题太大，缩小范围', null, '1', '否');
INSERT INTO `task` VALUES ('2', '完成软件开发', '很重要', '特急', '50%', 'test', 'test/201422404012', '2015-11-16 20:41', null, '前后台开发', '', '0', '是');

-- ----------------------------
-- Table structure for task_advice
-- ----------------------------
DROP TABLE IF EXISTS `task_advice`;
CREATE TABLE `task_advice` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '意见ID',
  `advice` tinytext NOT NULL COMMENT '任务意见',
  `task_ID` varchar(20) NOT NULL COMMENT '任务ID',
  `adv_creTime` varchar(20) NOT NULL COMMENT '意见填报时间',
  `adv_creUser` varchar(255) DEFAULT NULL COMMENT '意见填报人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of task_advice
-- ----------------------------
INSERT INTO `task_advice` VALUES ('1', '进度较快', '0', '2015-11-17 8:38', 'test');

-- ----------------------------
-- Table structure for task_progress
-- ----------------------------
DROP TABLE IF EXISTS `task_progress`;
CREATE TABLE `task_progress` (
  `progress_id` int(11) NOT NULL,
  `progress` varchar(20) NOT NULL COMMENT '进度情况',
  `progress_detail` tinytext NOT NULL COMMENT '进度介绍',
  `progress_writeTime` varchar(30) NOT NULL COMMENT '进度填报时间',
  `progress_attach` varchar(30) DEFAULT NULL COMMENT '进度附件',
  `pWrite_user` varchar(30) DEFAULT NULL COMMENT '进度填写人',
  `task_ID` varchar(20) DEFAULT NULL COMMENT '任务ID',
  PRIMARY KEY (`progress_id`),
  KEY `task_ID` (`task_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of task_progress
-- ----------------------------
INSERT INTO `task_progress` VALUES ('0', '50', '已完成框架', '2015-11-16 21:08', null, 'test', '0');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户id\r\n',
  `username` varchar(20) NOT NULL COMMENT '用户名',
  `userpass` varchar(50) NOT NULL COMMENT '密码',
  `truename` varchar(10) NOT NULL COMMENT '真实姓名',
  `sex` varchar(10) DEFAULT '' COMMENT '性别',
  `mail` varchar(30) DEFAULT '' COMMENT '电子邮件',
  `phone` varchar(20) DEFAULT '' COMMENT '电话',
  `address` varchar(80) DEFAULT '' COMMENT '家庭住址',
  `login_count` varchar(50) DEFAULT '' COMMENT '登陆次数',
  `login_time` datetime DEFAULT NULL,
  `register_time` datetime DEFAULT NULL,
  `unit` varchar(10) DEFAULT '' COMMENT '年纪',
  `dept` varchar(255) DEFAULT '' COMMENT '专业',
  `direction` varchar(255) DEFAULT '',
  `isAdmin` int(20) DEFAULT '0' COMMENT '角色',
  PRIMARY KEY (`ID`),
  KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admins', '96e79218965eb72c92a549dd5a330112', '管理员', '男', '1', null, null, null, null, null, null, null, null, '1');
INSERT INTO `user` VALUES ('2', 'admin', '96E79218965EB72C92A549DD5A330112', '管理员', '女', '2', null, null, null, null, null, null, null, null, '1');
INSERT INTO `user` VALUES ('3', 'test', '111111', '测试用户', '男', '1527717978@qq.com', '12345678910', '运城', '272', '2016-01-19 00:00:00', null, '山西大学', '计算机与信息技术学院', '网络安全', '0');
INSERT INTO `user` VALUES ('18', '201422404012', '111111', '孙瑞瑞', '', '1527717978@qq.com', null, null, '1', '2016-01-02 20:20:52', '2016-01-02 00:00:00', null, null, null, '0');

-- ----------------------------
-- Table structure for userinfo
-- ----------------------------
DROP TABLE IF EXISTS `userinfo`;
CREATE TABLE `userinfo` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL,
  `userpass` varchar(50) DEFAULT NULL,
  `truename` varchar(10) DEFAULT NULL,
  `userface` varchar(20) DEFAULT NULL,
  `usernumber` varchar(10) DEFAULT NULL,
  `userpower` tinytext,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userinfo
-- ----------------------------
INSERT INTO `userinfo` VALUES ('1', 'admins', '96e79218965eb72c92a549dd5a330112', '孙瑞瑞', '山西大学', '21', '管理员');

-- ----------------------------
-- Table structure for user_log
-- ----------------------------
DROP TABLE IF EXISTS `user_log`;
CREATE TABLE `user_log` (
  `id` int(11) NOT NULL,
  `log_title` varchar(50) NOT NULL COMMENT '日志标题',
  `log_type` varchar(15) NOT NULL COMMENT '日志类型',
  `sercet` varchar(10) NOT NULL COMMENT '保密级别',
  `log_time` date NOT NULL COMMENT '日志日期',
  `content` tinytext NOT NULL COMMENT '日志内容',
  `log_writeUser` varchar(10) NOT NULL COMMENT '日志填报人',
  `log_creTime` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_log
-- ----------------------------
