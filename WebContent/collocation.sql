/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50703
Source Host           : localhost:3306
Source Database       : collocation

Target Server Type    : MYSQL
Target Server Version : 50703
File Encoding         : 65001

Date: 2015-12-21 17:49:56
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of group
-- ----------------------------
INSERT INTO `group` VALUES ('1', '网络研究室', '山西大学', '201422404012', '协同研究');
INSERT INTO `group` VALUES ('2', '协同研究', '山西大学', '201422404012', '协同开发');
INSERT INTO `group` VALUES ('3', '中文信息处理', '山西大学', 'test', '国家863项目-高考阅读题');
INSERT INTO `group` VALUES ('4', 'shuju挖掘', '山西大学', 'test', '数据研究中心');
INSERT INTO `group` VALUES ('5', '闪闪', '山西大学', '201422404012', '11111');
INSERT INTO `group` VALUES ('6', '11', '11', 'test', '11');
INSERT INTO `group` VALUES ('7', '33', '33', 'test', '33');
INSERT INTO `group` VALUES ('8', 'test', '1', 'test', '1');
INSERT INTO `group` VALUES ('9', 'qqq', 'qqqq', 'test', 'qqqqqqqq');

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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of group_user
-- ----------------------------
INSERT INTO `group_user` VALUES ('1', '1', '201422404012', '管理员');
INSERT INTO `group_user` VALUES ('3', '1', 'test', '普通用户');
INSERT INTO `group_user` VALUES ('5', '2', '201422404012', '管理员');
INSERT INTO `group_user` VALUES ('6', '3', 'test', '管理员');
INSERT INTO `group_user` VALUES ('8', '4', 'test', '管理员');
INSERT INTO `group_user` VALUES ('9', '4', '201422404012', '普通用户');
INSERT INTO `group_user` VALUES ('13', '6', 'test', '管理员');
INSERT INTO `group_user` VALUES ('17', '7', 'test', '管理员');
INSERT INTO `group_user` VALUES ('18', '5', 'test', '普通用户');
INSERT INTO `group_user` VALUES ('19', '8', 'test', '管理员');
INSERT INTO `group_user` VALUES ('20', '9', 'test', '管理员');

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of libscons
-- ----------------------------
INSERT INTO `libscons` VALUES ('2', '协作', '工作通告', '得到', 'admins', '山西大学', '2015-10-26 19:23:49', '0');
INSERT INTO `libscons` VALUES ('3', '的', '工作通告', '的', 'admins', '山西大学', '2015-10-26 19:25:37', '0');
INSERT INTO `libscons` VALUES ('4', 'aa', '工作通告', 'ww', 'admins', '山西大学', '2015-10-26 20:06:45', '0');
INSERT INTO `libscons` VALUES ('5', 'aa', '工作通告', 'aa', 'admins', '山西大学', '2015-10-26 21:02:28', '0');
INSERT INTO `libscons` VALUES ('6', 'test', '工作通告', 'fdafasf asdadfadf afsd sdf sd', 'admins', '山西大学', '2015-10-26 22:03:13', '0');
INSERT INTO `libscons` VALUES ('7', '1111', '工作通告', '<span style=\"color:#E53333;\">得到大苏打速度</span>', 'admins', '山西大学', '2015-11-09 19:16:59', '0');

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
INSERT INTO `store` VALUES ('pad:1', '{\"atext\":{\"text\":\"\\n\\n\",\"attribs\":\"|2+2\"},\"pool\":{\"numToAttrib\":{},\"nextNum\":0},\"head\":0,\"chatHead\":-1,\"publicStatus\":false,\"passwordHash\":null,\"savedRevisions\":[]}');
INSERT INTO `store` VALUES ('token2author:t.K8wFl3tUBygLD6pp3QM4', '\"a.LNnwdmqyaJtzQNSy\"');
INSERT INTO `store` VALUES ('globalAuthor:a.LNnwdmqyaJtzQNSy', '{\"colorId\":12,\"name\":null,\"timestamp\":1450690813897}');
INSERT INTO `store` VALUES ('pad2readonly:1', '\"r.eabffdf4c52a021a0c865d368627640f\"');
INSERT INTO `store` VALUES ('readonly2pad:r.eabffdf4c52a021a0c865d368627640f', '\"1\"');
INSERT INTO `store` VALUES ('pad:1:revs:0', '{\"changeset\":\"Z:1>1|1+1$\\n\",\"meta\":{\"author\":\"\",\"timestamp\":1450684381462,\"atext\":{\"text\":\"\\n\\n\",\"attribs\":\"|2+2\"}}}');
INSERT INTO `store` VALUES ('sessionstorage:uiyiANexzxW7RXLPteilyjX_zrSYbaCt', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('pad:\"+1+\"', '{\"atext\":{\"text\":\"\\n\\n\",\"attribs\":\"|2+2\"},\"pool\":{\"numToAttrib\":{\"0\":[\"author\",\"a.2dyclCKoZArslaZm\"]},\"nextNum\":1},\"head\":4,\"chatHead\":-1,\"publicStatus\":false,\"passwordHash\":null,\"savedRevisions\":[]}');
INSERT INTO `store` VALUES ('pad2readonly:\"+1+\"', '\"r.0fd84954344ef1c86fd2fa8f7211bac5\"');
INSERT INTO `store` VALUES ('readonly2pad:r.0fd84954344ef1c86fd2fa8f7211bac5', '\"\\\"+1+\\\"\"');
INSERT INTO `store` VALUES ('pad:\"+1+\":revs:0', '{\"changeset\":\"Z:1>1|1+1$\\n\",\"meta\":{\"author\":\"\",\"timestamp\":1450684413279,\"atext\":{\"text\":\"\\n\\n\",\"attribs\":\"|2+2\"}}}');
INSERT INTO `store` VALUES ('sessionstorage:T9WA5KNYQrWO40WG9jvBvA4EOhuN55CX', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:G5tjrrKV05NiNSUvnvqTeeZe_zSohUvO', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('sessionstorage:5ObU-6AqagzqgusoqhOxpllcctmEcJTT', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('token2author:t.iArkIrTL6j3MaDMx5MvU', '\"a.2dyclCKoZArslaZm\"');
INSERT INTO `store` VALUES ('globalAuthor:a.2dyclCKoZArslaZm', '{\"colorId\":31,\"name\":null,\"timestamp\":1450690821695,\"padIDs\":{\"\\\"+1+\\\"\":1}}');
INSERT INTO `store` VALUES ('sessionstorage:waeAlYOCNpsfODfLEGen5yuXnwEpBkzB', '{\"cookie\":{\"path\":\"/\",\"_expires\":null,\"originalMaxAge\":null,\"httpOnly\":true}}');
INSERT INTO `store` VALUES ('pad:\"+1+\":revs:1', '{\"changeset\":\"Z:2>1*0+1$1\",\"meta\":{\"author\":\"a.2dyclCKoZArslaZm\",\"timestamp\":1450684476479}}');
INSERT INTO `store` VALUES ('pad:\"+1+\":revs:2', '{\"changeset\":\"Z:3>1=1*0+1$1\",\"meta\":{\"author\":\"a.2dyclCKoZArslaZm\",\"timestamp\":1450684476974}}');
INSERT INTO `store` VALUES ('pad:\"+1+\":revs:3', '{\"changeset\":\"Z:4<1=1-1$\",\"meta\":{\"author\":\"a.2dyclCKoZArslaZm\",\"timestamp\":1450684480213}}');
INSERT INTO `store` VALUES ('pad:\"+1+\":revs:4', '{\"changeset\":\"Z:3<1-1$\",\"meta\":{\"author\":\"a.2dyclCKoZArslaZm\",\"timestamp\":1450684480712}}');
INSERT INTO `store` VALUES ('token2author:t.Qw2hXME7ydf422iHBLzj', '\"a.84zWwWNyl6az1jLn\"');
INSERT INTO `store` VALUES ('globalAuthor:a.84zWwWNyl6az1jLn', '{\"colorId\":7,\"name\":null,\"timestamp\":1450687612724}');
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
INSERT INTO `store` VALUES ('pad:\"+3+\"', '{\"atext\":{\"text\":\"\\n\\n\",\"attribs\":\"|2+2\"},\"pool\":{\"numToAttrib\":{},\"nextNum\":0},\"head\":0,\"chatHead\":-1,\"publicStatus\":false,\"passwordHash\":null,\"savedRevisions\":[]}');
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
INSERT INTO `store` VALUES ('pad:\"+8+\"', '{\"atext\":{\"text\":\"\\n\\n\",\"attribs\":\"|2+2\"},\"pool\":{\"numToAttrib\":{},\"nextNum\":0},\"head\":0,\"chatHead\":-1,\"publicStatus\":false,\"passwordHash\":null,\"savedRevisions\":[]}');
INSERT INTO `store` VALUES ('pad2readonly:\"+8+\"', '\"r.b595c91a9d078670e0d3ea08c489ca55\"');
INSERT INTO `store` VALUES ('readonly2pad:r.b595c91a9d078670e0d3ea08c489ca55', '\"\\\"+8+\\\"\"');
INSERT INTO `store` VALUES ('pad:\"+8+\":revs:0', '{\"changeset\":\"Z:1>1|1+1$\\n\",\"meta\":{\"author\":\"\",\"timestamp\":1450689345530,\"atext\":{\"text\":\"\\n\\n\",\"attribs\":\"|2+2\"}}}');
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
  `sex` varchar(10) DEFAULT NULL COMMENT '性别',
  `mail` varchar(30) DEFAULT NULL COMMENT '电子邮件',
  `phone` varchar(20) DEFAULT NULL COMMENT '电话',
  `fami_address` varchar(80) DEFAULT NULL COMMENT '家庭住址',
  `login_count` varchar(50) DEFAULT '' COMMENT '登陆次数',
  `login_time` datetime DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL COMMENT '所在工作状态',
  `unit` varchar(10) DEFAULT NULL COMMENT '年纪',
  `dept` varchar(255) DEFAULT NULL COMMENT '专业',
  `direction` varchar(255) DEFAULT NULL,
  `role` varchar(20) DEFAULT NULL COMMENT '角色',
  PRIMARY KEY (`ID`),
  KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admins', '96e79218965eb72c92a549dd5a330112', '管理员', null, '1', null, null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('2', 'admin', '96E79218965EB72C92A549DD5A330112', '管理员', null, '2', null, null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('3', 'test', '111111', '测试用户', '男', '1527717978@qq.com', '15513094702', '运城', '206', '2015-12-21 17:38:24', null, '山西大学', '计算机与信息技术学院', '网络安全', '负责人');
INSERT INTO `user` VALUES ('4', '201422404012', '111111', '瑞瑞', '男', '137912118@qq.com', '15513094702', '运城', '24', '2015-12-21 17:40:07', null, null, null, null, '学生');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userinfo
-- ----------------------------
INSERT INTO `userinfo` VALUES ('1', 'admins', '96e79218965eb72c92a549dd5a330112', '管理员', '山西大学', '1', null);
INSERT INTO `userinfo` VALUES ('2', 'admin', '96E79218965EB72C92A549DD5A330112', '管理员', '山西大学', '2', null);

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
