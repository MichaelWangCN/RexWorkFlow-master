-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        8.0.20 - MySQL Community Server - GPL
-- 服务器操作系统:                      Win64
-- HeidiSQL 版本:                  11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- 导出 workflow 的数据库结构
CREATE DATABASE IF NOT EXISTS `workflow` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `workflow`;

-- 导出  表 workflow.cap.published 结构
CREATE TABLE IF NOT EXISTS `cap.published` (
  `Id` bigint NOT NULL,
  `Version` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `Retries` int DEFAULT NULL,
  `Added` datetime NOT NULL,
  `ExpiresAt` datetime DEFAULT NULL,
  `StatusName` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- 正在导出表  workflow.cap.published 的数据：~8 rows (大约)
/*!40000 ALTER TABLE `cap.published` DISABLE KEYS */;
INSERT INTO `cap.published` (`Id`, `Version`, `Name`, `Content`, `Retries`, `Added`, `ExpiresAt`, `StatusName`) VALUES
	(1313113127534161920, 'v1', 'WorkFlowStatusChangedOA', '{"Id":"5f7b2384c8ad804ab4d99054","Timestamp":"2020-10-05T21:45:40.728697+08:00","Content":"{\\"KeyName\\":\\"Id\\",\\"KeyValue\\":\\"11\\",\\"Status\\":0,\\"TableName\\":\\"oa_leave\\",\\"FlowTime\\":1601905541,\\"TargetName\\":\\"WorkFlowStatusChangedOA\\"}","CallbackName":null}', 0, '2020-10-05 21:45:41', NULL, 'Scheduled'),
	(1313113924925878272, 'v1', 'WorkFlowStatusChangedOA', '{"Id":"5f7b2442c8ad804ab4d99055","Timestamp":"2020-10-05T21:48:50.8366664+08:00","Content":"{\\"KeyName\\":\\"Id\\",\\"KeyValue\\":\\"11\\",\\"Status\\":1,\\"TableName\\":\\"oa_leave\\",\\"FlowTime\\":1601905731,\\"TargetName\\":\\"WorkFlowStatusChangedOA\\"}","CallbackName":null}', 0, '2020-10-05 21:48:51', NULL, 'Scheduled'),
	(1313114282809061376, 'v1', 'WorkFlowStatusChangedOA', '{"Id":"5f7b2498c8ad804ab4d99056","Timestamp":"2020-10-05T21:50:16.1628561+08:00","Content":"{\\"KeyName\\":\\"Id\\",\\"KeyValue\\":\\"10\\",\\"Status\\":0,\\"TableName\\":\\"oa_leave\\",\\"FlowTime\\":1601905816,\\"TargetName\\":\\"WorkFlowStatusChangedOA\\"}","CallbackName":null}', 0, '2020-10-05 21:50:16', NULL, 'Scheduled'),
	(1313402132528066560, 'v1', 'WorkFlowStatusChangedOA', '{"Id":"5f7c30acc8ad804ab4d99057","Timestamp":"2020-10-06T16:54:04.883786+08:00","Content":"{\\"KeyName\\":\\"Id\\",\\"KeyValue\\":\\"10\\",\\"Status\\":1,\\"TableName\\":\\"oa_leave\\",\\"FlowTime\\":1601974445,\\"TargetName\\":\\"WorkFlowStatusChangedOA\\"}","CallbackName":null}', 0, '2020-10-06 16:54:05', NULL, 'Scheduled'),
	(1313411636648964096, 'v1', 'WorkFlowStatusChangedOA', '{"Id":"5f7c3986c8ad804ab4d99058","Timestamp":"2020-10-06T17:31:50.8427576+08:00","Content":"{\\"KeyName\\":\\"Id\\",\\"KeyValue\\":\\"5\\",\\"Status\\":0,\\"TableName\\":\\"oa_leave\\",\\"FlowTime\\":1601976711,\\"TargetName\\":\\"WorkFlowStatusChangedOA\\"}","CallbackName":null}', 0, '2020-10-06 17:31:51', NULL, 'Scheduled'),
	(1313411955944550400, 'v1', 'WorkFlowStatusChangedOA', '{"Id":"5f7c39d2c8ad804ab4d99059","Timestamp":"2020-10-06T17:33:06.9682302+08:00","Content":"{\\"KeyName\\":\\"Id\\",\\"KeyValue\\":\\"12\\",\\"Status\\":0,\\"TableName\\":\\"oa_leave\\",\\"FlowTime\\":1601976787,\\"TargetName\\":\\"WorkFlowStatusChangedOA\\"}","CallbackName":null}', 0, '2020-10-06 17:33:07', NULL, 'Scheduled'),
	(1313413048686571520, 'v1', 'WorkFlowStatusChangedOA', '{"Id":"5f7c3ad7c8ad804ab4d9905a","Timestamp":"2020-10-06T17:37:27.4986803+08:00","Content":"{\\"KeyName\\":\\"Id\\",\\"KeyValue\\":\\"5\\",\\"Status\\":2,\\"TableName\\":\\"oa_leave\\",\\"FlowTime\\":1601977047,\\"TargetName\\":\\"WorkFlowStatusChangedOA\\"}","CallbackName":null}', 0, '2020-10-06 17:37:27', NULL, 'Scheduled'),
	(1313416436836954112, 'v1', 'WorkFlowStatusChangedOA', '{"Id":"5f7c3dffc8ad804ab4d9905b","Timestamp":"2020-10-06T17:50:55.2968749+08:00","Content":"{\\"KeyName\\":\\"Id\\",\\"KeyValue\\":\\"12\\",\\"Status\\":1,\\"TableName\\":\\"oa_leave\\",\\"FlowTime\\":1601977855,\\"TargetName\\":\\"WorkFlowStatusChangedOA\\"}","CallbackName":null}', 0, '2020-10-06 17:50:55', NULL, 'Scheduled');
/*!40000 ALTER TABLE `cap.published` ENABLE KEYS */;

-- 导出  表 workflow.cap.received 结构
CREATE TABLE IF NOT EXISTS `cap.received` (
  `Id` bigint NOT NULL,
  `Version` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Name` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `Retries` int DEFAULT NULL,
  `Added` datetime NOT NULL,
  `ExpiresAt` datetime DEFAULT NULL,
  `StatusName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- 正在导出表  workflow.cap.received 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `cap.received` DISABLE KEYS */;
/*!40000 ALTER TABLE `cap.received` ENABLE KEYS */;

-- 导出  表 workflow.oa_chat 结构
CREATE TABLE IF NOT EXISTS `oa_chat` (
  `Id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `Sender` bigint NOT NULL COMMENT '发送方',
  `Message` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '消息',
  `Receiver` bigint NOT NULL COMMENT '接收方',
  `CreateTime` bigint NOT NULL COMMENT '创建时间',
  `IsRead` tinyint NOT NULL DEFAULT '0' COMMENT '是否已读',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- 正在导出表  workflow.oa_chat 的数据：~5 rows (大约)
/*!40000 ALTER TABLE `oa_chat` DISABLE KEYS */;
INSERT INTO `oa_chat` (`Id`, `Sender`, `Message`, `Receiver`, `CreateTime`, `IsRead`) VALUES
	(1, 5, '你好', 1, 1560898931, 0),
	(2, 1, '你好', 5, 1560898950, 0),
	(3, 1, '123', 5, 1576624674, 0),
	(4, 5, 'asd', 1, 1576624691, 0),
	(5, 5, '哈哈', 1, 1576624705, 0);
/*!40000 ALTER TABLE `oa_chat` ENABLE KEYS */;

-- 导出  表 workflow.oa_leave 结构
CREATE TABLE IF NOT EXISTS `oa_leave` (
  `Id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `LeaveCode` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '请假编号',
  `Title` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '标题',
  `UserId` int NOT NULL COMMENT '请假人',
  `AgentId` int NOT NULL COMMENT '工作代理人',
  `LeaveType` tinyint NOT NULL COMMENT '请假类型',
  `Reason` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '请假原因',
  `Days` int NOT NULL COMMENT '请假天数',
  `StartTime` bigint NOT NULL COMMENT '开始时间',
  `EndTime` bigint NOT NULL COMMENT '结束时间',
  `CreateUserId` int NOT NULL COMMENT '创建人',
  `CreateTime` bigint NOT NULL COMMENT '创建时间',
  `FlowStatus` int DEFAULT '-1' COMMENT '流程状态',
  `FlowTime` bigint DEFAULT NULL COMMENT '流程操作时间戳',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='员工请假';

-- 正在导出表  workflow.oa_leave 的数据：~11 rows (大约)
/*!40000 ALTER TABLE `oa_leave` DISABLE KEYS */;
INSERT INTO `oa_leave` (`Id`, `LeaveCode`, `Title`, `UserId`, `AgentId`, `LeaveType`, `Reason`, `Days`, `StartTime`, `EndTime`, `CreateUserId`, `CreateTime`, `FlowStatus`, `FlowTime`) VALUES
	(1, '15604170854388', '想看看外面的世界', 0, 0, 0, '想看看外面的世界', 7, 1560441600, 1560960000, 1, 1560417085, 1, 1560417476),
	(2, '15604180604164', '测试2', 0, 0, 0, '测试', 2, 1560441600, 1560528000, 1, 1560418060, 1, 1560419404),
	(3, '15749778945106', '测试', 0, 0, 0, '12', 2, 1575043200, 1575129600, 1, 1574977894, 1, 1575243821),
	(4, '15760022217221', '测试', 0, 0, 0, '测试', 2, 1576080000, 1576166400, 1, 1576002221, 1, 1576110644),
	(5, '15766927315354', '123 测试', 0, 0, 0, '123 测试', 5, 1576771200, 1577116800, 7, 1576692731, 3, 1576693789),
	(7, '15843164815517', '123', 0, 0, 0, '123', 2, 1586966400, 1587052800, 0, 1584316481, -1, 0),
	(8, '15843165772134', '测试111', 0, 0, 0, '测试111', 2, 1584374400, 1584460800, 1, 1584316577, -1, 0),
	(9, '15843174277352', '123321', 0, 0, 0, '123123', 2, 1584288000, 1584374400, 1, 1584317427, -1, 0),
	(10, '15843174560867', '123321', 0, 0, 0, '123123测试啊啊啊', 2, 1584288000, 1584374400, 1, 1584317456, -1, 0),
	(11, '16019055395828', 'tony请假两天', 0, 0, 0, '哒哒哒哒哒哒多', 2, 1601913600, 1602000000, 1, 1601905539, -1, 0),
	(12, '16019767865252', '奕鼎通', 0, 0, 0, '家里有事情，需要进行请假', 2, 1602000000, 1602086400, 1, 1601976786, -1, 0);
/*!40000 ALTER TABLE `oa_leave` ENABLE KEYS */;

-- 导出  表 workflow.oa_mail 结构
CREATE TABLE IF NOT EXISTS `oa_mail` (
  `Id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `Title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Content` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `SendStatus` tinyint NOT NULL COMMENT '发送状态',
  `Sender` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '发送人',
  `SendMail` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '发送地址',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- 正在导出表  workflow.oa_mail 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `oa_mail` DISABLE KEYS */;
/*!40000 ALTER TABLE `oa_mail` ENABLE KEYS */;

-- 导出  表 workflow.oa_mail_config 结构
CREATE TABLE IF NOT EXISTS `oa_mail_config` (
  `Id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `Host` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '邮件服务地址',
  `Port` int NOT NULL COMMENT '端口',
  `SecureSocketOptions` tinyint NOT NULL DEFAULT '1' COMMENT 'Secure socket options.',
  `UserName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账号',
  `Password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='邮件服务配置';

-- 正在导出表  workflow.oa_mail_config 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `oa_mail_config` DISABLE KEYS */;
INSERT INTO `oa_mail_config` (`Id`, `Host`, `Port`, `SecureSocketOptions`, `UserName`, `Password`) VALUES
	(1, '	smtp.qq.com', 587, 1, '2636256005@qq.com', 'snewsyiqgyagecdd');
/*!40000 ALTER TABLE `oa_mail_config` ENABLE KEYS */;

-- 导出  表 workflow.oa_message 结构
CREATE TABLE IF NOT EXISTS `oa_message` (
  `Id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `MsgType` int NOT NULL COMMENT '消息类型',
  `FaceUserType` tinyint NOT NULL COMMENT '面向人员类型',
  `Title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '标题',
  `IsLocal` tinyint NOT NULL COMMENT '是否是本地消息',
  `IsSystem` tinyint NOT NULL DEFAULT '0' COMMENT '是否是系统自己创建消息',
  `TargetType` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '跳转方式',
  `Link` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '链接地址',
  `Content` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '消息内容',
  `IsEnable` tinyint NOT NULL COMMENT '是否立即生效',
  `StartTime` bigint DEFAULT NULL COMMENT '开始时间',
  `EndTime` bigint DEFAULT NULL COMMENT '结束时间',
  `IsExecuted` tinyint NOT NULL COMMENT '是否执行过',
  `IsDel` tinyint NOT NULL COMMENT '是否删除',
  `MakerUserId` bigint DEFAULT NULL COMMENT '编制人ID',
  `CreateUserId` bigint NOT NULL COMMENT '创建人Id',
  `CreateTime` bigint NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统消息表';

-- 正在导出表  workflow.oa_message 的数据：~17 rows (大约)
/*!40000 ALTER TABLE `oa_message` DISABLE KEYS */;
INSERT INTO `oa_message` (`Id`, `MsgType`, `FaceUserType`, `Title`, `IsLocal`, `IsSystem`, `TargetType`, `Link`, `Content`, `IsEnable`, `StartTime`, `EndTime`, `IsExecuted`, `IsDel`, `MakerUserId`, `CreateUserId`, `CreateTime`) VALUES
	(1, 1, 0, '测试', 1, 0, 'tab', NULL, '测试', 1, 0, 0, 1, 1, 0, 1, 1555213291),
	(2, 0, 0, '测试2', 1, 0, 'blank', NULL, NULL, 1, 0, 0, 1, 1, 0, 1, 1555315893),
	(4, 1, 1, '流程催办', 1, 1, 'tab', 'http://www.baidu.com', '请审批流程', 1, 0, 0, 1, 1, 1, 1, 1575238117),
	(5, 1, 1, '流程催办', 1, 1, 'tab', '', '请审批流程', 1, 0, 0, 0, 1, 1, 1, 1575239065),
	(6, 1, 1, '流程催办', 1, 1, 'tab', '/OA/Leave/Show?id=3', '请审批流程', 1, 0, 0, 0, 1, 1, 1, 1575239551),
	(7, 1, 1, '流程催办', 1, 1, 'tab', '/OA/Leave/Show?id=3', '请审批流程', 1, 0, 0, 1, 1, 1, 1, 1575239686),
	(8, 1, 1, '流程催办', 1, 1, 'tab', '/OA/Leave/Show?id=3', '请审批流程', 1, 0, 0, 0, 1, 1, 1, 1575239726),
	(9, 1, 1, '流程催办', 1, 1, 'tab', '/OA/Leave/Show?id=3', '请审批流程', 1, 0, 0, 0, 1, 1, 1, 1575239794),
	(10, 1, 1, '流程催办', 1, 1, 'tab', '/OA/Leave/Show?id=3', '请审批流程', 1, 0, 0, 0, 1, 1, 1, 1575240149),
	(11, 1, 1, '流程催办', 1, 1, 'tab', '/OA/Leave/Show?id=3', '请审批流程', 1, 0, 0, 0, 1, 1, 1, 1575240316),
	(12, 1, 1, '流程催办', 1, 1, 'tab', '/OA/Leave/Show?id=3', '请审批流程', 1, 0, 0, 1, 1, 1, 1, 1575240485),
	(13, 1, 1, '流程催办', 1, 1, 'tab', '/OA/Leave/Show?id=3', '请审批流程', 1, 0, 0, 0, 1, 1, 1, 1575241035),
	(14, 1, 1, '流程催办', 1, 1, 'tab', '/OA/Leave/Show?id=3', '请审批流程', 1, 0, 0, 0, 1, 1, 1, 1575243564),
	(15, 1, 1, '流程催办', 1, 1, 'tab', '/OA/Leave/Show?id=3', '请审批流程', 1, 0, 0, 0, 1, 1, 1, 1575243796),
	(16, 1, 1, '流程催办', 1, 1, 'tab', '/OA/Leave/Show?id=12', '请审批流程', 1, 0, 0, 0, 0, 1, 1, 1601977729),
	(17, 1, 1, '流程催办', 1, 1, 'tab', '/WF/WorkFlowInstance/Process?flowid=011980a7-0ba3-4752-964e-12d88ca5c54c&instanceid=35e4f3d7-9894-432a-839b-171ced0db50b', '请审批流程', 1, 0, 0, 0, 0, 1, 1, 1602062885),
	(18, 1, 1, '流程催办', 1, 1, 'tab', '/WF/WorkFlowInstance/Process?flowid=011980a7-0ba3-4752-964e-12d88ca5c54c&instanceid=35e4f3d7-9894-432a-839b-171ced0db50b', '请审批流程', 1, 0, 0, 0, 0, 1, 1, 1602062981),
	(19, 1, 1, '流程催办', 1, 1, 'tab', '/WF/WorkFlowInstance/Process?flowid=4e6bbeab-3d2b-4b36-b733-c2255897b201&instanceid=f9196611-56f8-43d8-a0d2-75695d4b3138', '请审批流程', 1, 0, 0, 0, 0, 1, 1, 1615372219),
	(20, 1, 1, '流程催办', 1, 1, 'tab', '/WF/WorkFlowInstance/Process?flowid=4e6bbeab-3d2b-4b36-b733-c2255897b201&instanceid=f9196611-56f8-43d8-a0d2-75695d4b3138', '请审批流程', 1, 0, 0, 0, 0, 1, 1, 1615372491),
	(21, 1, 1, '流程催办', 1, 1, 'tab', '/WF/WorkFlowInstance/Process?flowid=4e6bbeab-3d2b-4b36-b733-c2255897b201&instanceid=f9196611-56f8-43d8-a0d2-75695d4b3138', '请审批流程', 1, 0, 0, 0, 0, 1, 1, 1615373386),
	(22, 1, 1, '流程催办', 1, 1, 'tab', '/WF/WorkFlowInstance/Process?flowid=4e6bbeab-3d2b-4b36-b733-c2255897b201&instanceid=f9196611-56f8-43d8-a0d2-75695d4b3138', '请审批流程', 1, 0, 0, 0, 0, 1, 1, 1615373658),
	(23, 1, 1, '流程催办', 1, 1, 'tab', '/WF/WorkFlowInstance/Process?flowid=4e6bbeab-3d2b-4b36-b733-c2255897b201&instanceid=f9196611-56f8-43d8-a0d2-75695d4b3138', '请审批流程', 1, 0, 0, 0, 0, 1, 1, 1615374874),
	(24, 1, 1, '流程催办', 1, 1, 'tab', '/WF/WorkFlowInstance/Process?flowid=4e6bbeab-3d2b-4b36-b733-c2255897b201&instanceid=f9196611-56f8-43d8-a0d2-75695d4b3138', '请审批流程', 1, 0, 0, 0, 0, 1, 1, 1615375992),
	(25, 1, 1, '流程催办', 1, 1, 'tab', '/WF/WorkFlowInstance/Process?flowid=4e6bbeab-3d2b-4b36-b733-c2255897b201&instanceid=3a246503-54b0-4aa6-a266-136dffe7c616', '请审批流程', 1, 0, 0, 0, 0, 1, 1, 1615377073);
/*!40000 ALTER TABLE `oa_message` ENABLE KEYS */;

-- 导出  表 workflow.oa_message_user 结构
CREATE TABLE IF NOT EXISTS `oa_message_user` (
  `Id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `MessageId` bigint NOT NULL COMMENT '消息ID',
  `UserId` bigint NOT NULL COMMENT '用户ID',
  `IsRead` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否已读',
  PRIMARY KEY (`Id`) USING BTREE,
  KEY `MessageId` (`MessageId`) USING BTREE,
  CONSTRAINT `oa_message_user_ibfk_1` FOREIGN KEY (`MessageId`) REFERENCES `oa_message` (`Id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='消息用户关系表';

-- 正在导出表  workflow.oa_message_user 的数据：~16 rows (大约)
/*!40000 ALTER TABLE `oa_message_user` DISABLE KEYS */;
INSERT INTO `oa_message_user` (`Id`, `MessageId`, `UserId`, `IsRead`) VALUES
	(1, 13, 1, 1),
	(2, 14, 1, 1),
	(3, 15, 1, 1),
	(4, 1, 1, 1),
	(5, 1, 4, 0),
	(6, 1, 5, 1),
	(7, 1, 6, 1),
	(8, 1, 7, 0),
	(9, 1, 1, 1),
	(10, 1, 4, 0),
	(11, 1, 5, 1),
	(12, 1, 6, 0),
	(13, 1, 7, 0),
	(14, 16, 5, 1),
	(15, 17, 5, 1),
	(16, 18, 5, 1),
	(17, 19, 6, 0),
	(18, 20, 6, 0),
	(19, 21, 6, 0),
	(20, 22, 6, 0),
	(21, 23, 6, 1),
	(22, 24, 6, 0),
	(23, 25, 6, 0);
/*!40000 ALTER TABLE `oa_message_user` ENABLE KEYS */;

-- 导出  表 workflow.oa_work 结构
CREATE TABLE IF NOT EXISTS `oa_work` (
  `WorkId` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `WorkType` tinyint NOT NULL COMMENT '类型：1日报，2周报，3月报',
  `Content` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '已完成工作',
  `PlanContent` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '计划完成工作',
  `NeedHelpContent` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '需要协助的工作',
  `Memo` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  `IsDel` tinyint NOT NULL DEFAULT '0' COMMENT '是否删除',
  `ReportDate` bigint NOT NULL COMMENT '汇报日期',
  `CreateUserId` int NOT NULL COMMENT '创建人ID',
  `CreateTime` bigint NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`WorkId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='我的工作';

-- 正在导出表  workflow.oa_work 的数据：~2 rows (大约)
/*!40000 ALTER TABLE `oa_work` DISABLE KEYS */;
INSERT INTO `oa_work` (`WorkId`, `WorkType`, `Content`, `PlanContent`, `NeedHelpContent`, `Memo`, `IsDel`, `ReportDate`, `CreateUserId`, `CreateTime`) VALUES
	(1, 0, '123', '123', '123', NULL, 0, 0, 1, 0),
	(2, 0, NULL, NULL, NULL, NULL, 0, 0, 1, 0);
/*!40000 ALTER TABLE `oa_work` ENABLE KEYS */;

-- 导出  表 workflow.oa_workflowsql 结构
CREATE TABLE IF NOT EXISTS `oa_workflowsql` (
  `Name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '流程sql名称,必须是以oa_为开头，用于判断属于哪个系统，方便调用接口',
  `FlowSQL` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '流程SQL，执行结果必须是一行一列',
  `Param` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '参数名。以英文 , 分割',
  `SQLType` tinyint NOT NULL DEFAULT '0' COMMENT '类型，0：选人节点，必须返回的是用户ID，1：连线条件，条件通过返回的是一行一列的数据，不通过没有任何返回结果',
  `Status` int NOT NULL DEFAULT '1' COMMENT '状态',
  `Remark` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  `CreateTime` bigint NOT NULL COMMENT '创建时间',
  `CreateUserId` bigint NOT NULL COMMENT '创建人ID',
  PRIMARY KEY (`Name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用于工作流获取权限系统数据';

-- 正在导出表  workflow.oa_workflowsql 的数据：~2 rows (大约)
/*!40000 ALTER TABLE `oa_workflowsql` DISABLE KEYS */;
INSERT INTO `oa_workflowsql` (`Name`, `FlowSQL`, `Param`, `SQLType`, `Status`, `Remark`, `CreateTime`, `CreateUserId`) VALUES
	('oa_leaveLessThenThreeDays', 'SELECT ol.`Id` FROM `oa_leave` ol WHERE ol.`Days`<=3 AND ol.`CreateUserId`=@userid AND ol.`Id`=@formid', 'userid,formid', 1, 1, '请假时间小于等于三天判断', 1, 1),
	('oa_leaveMoreThenThreeDays', 'SELECT ol.`Id` FROM `oa_leave` ol WHERE ol.`Days` > 3 AND ol.`CreateUserId`=@userid AND ol.`Id`=@formid', 'userid,formid', 1, 1, '请假时间大于三天判断', 1, 1);
/*!40000 ALTER TABLE `oa_workflowsql` ENABLE KEYS */;

-- 导出  表 workflow.oa_work_reporter 结构
CREATE TABLE IF NOT EXISTS `oa_work_reporter` (
  `ReportId` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `WorkId` int NOT NULL COMMENT '工作id',
  `Reporter` int NOT NULL COMMENT '汇报人',
  `ReadDate` bigint DEFAULT NULL COMMENT '阅读时间',
  `Memo` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`ReportId`) USING BTREE,
  KEY `WorkId` (`WorkId`) USING BTREE,
  CONSTRAINT `oa_work_reporter_ibfk_1` FOREIGN KEY (`WorkId`) REFERENCES `oa_work` (`WorkId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='汇总人列表';

-- 正在导出表  workflow.oa_work_reporter 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `oa_work_reporter` DISABLE KEYS */;
/*!40000 ALTER TABLE `oa_work_reporter` ENABLE KEYS */;

-- 导出  表 workflow.sys_button 结构
CREATE TABLE IF NOT EXISTS `sys_button` (
  `ButtonId` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `ButtonName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
  `Memo` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`ButtonId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- 正在导出表  workflow.sys_button 的数据：~9 rows (大约)
/*!40000 ALTER TABLE `sys_button` DISABLE KEYS */;
INSERT INTO `sys_button` (`ButtonId`, `ButtonName`, `Memo`) VALUES
	(1, '查看', '查看'),
	(2, '新增', '新增'),
	(3, '编辑', '编辑'),
	(4, '删除', '删除'),
	(5, '打印', '打印'),
	(6, '审核', '审核'),
	(7, '作废', '作废'),
	(8, '结束', '结束'),
	(9, '扩展', '扩展');
/*!40000 ALTER TABLE `sys_button` ENABLE KEYS */;

-- 导出  表 workflow.sys_data_privileges 结构
CREATE TABLE IF NOT EXISTS `sys_data_privileges` (
  `Id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `UserId` bigint NOT NULL COMMENT '用户ID',
  `DeptId` bigint NOT NULL COMMENT '部门ID',
  `SystemId` bigint NOT NULL COMMENT '系统ID',
  PRIMARY KEY (`Id`) USING BTREE,
  KEY `UserId` (`UserId`) USING BTREE,
  KEY `DeptId` (`DeptId`) USING BTREE,
  KEY `SystemId` (`SystemId`) USING BTREE,
  CONSTRAINT `sys_data_privileges_ibfk_1` FOREIGN KEY (`UserId`) REFERENCES `sys_user` (`UserId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `sys_data_privileges_ibfk_2` FOREIGN KEY (`DeptId`) REFERENCES `sys_dept` (`DeptId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `sys_data_privileges_ibfk_3` FOREIGN KEY (`SystemId`) REFERENCES `sys_system` (`SystemId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='数据权限';

-- 正在导出表  workflow.sys_data_privileges 的数据：~4 rows (大约)
/*!40000 ALTER TABLE `sys_data_privileges` DISABLE KEYS */;
INSERT INTO `sys_data_privileges` (`Id`, `UserId`, `DeptId`, `SystemId`) VALUES
	(8, 1, 1, 1),
	(9, 1, 2, 1),
	(10, 1, 3, 1),
	(11, 1, 4, 1);
/*!40000 ALTER TABLE `sys_data_privileges` ENABLE KEYS */;

-- 导出  表 workflow.sys_dept 结构
CREATE TABLE IF NOT EXISTS `sys_dept` (
  `DeptId` bigint NOT NULL AUTO_INCREMENT COMMENT '部门ID',
  `DeptName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '部门名称',
  `DeptCode` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '部门编号',
  `ParentId` bigint NOT NULL COMMENT '父级ID',
  `Path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '路径',
  `IsDel` tinyint NOT NULL DEFAULT '0' COMMENT '是否删除',
  `Memo` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  `CreateUserId` bigint NOT NULL COMMENT '创建人id',
  `CreateTime` bigint NOT NULL COMMENT '创建时间戳',
  PRIMARY KEY (`DeptId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='部门表（作用于全部系统）';

-- 正在导出表  workflow.sys_dept 的数据：~4 rows (大约)
/*!40000 ALTER TABLE `sys_dept` DISABLE KEYS */;
INSERT INTO `sys_dept` (`DeptId`, `DeptName`, `DeptCode`, `ParentId`, `Path`, `IsDel`, `Memo`, `CreateUserId`, `CreateTime`) VALUES
	(1, 'MS软件', '001', 0, '1', 0, 'MS软件', 1, 1517812123),
	(2, '总经室', '002', 1, '1:2', 0, '总经室', 1, 1517812220),
	(3, '研发部', '003', 1, '1:3', 0, '研发部', 1, 1517814189),
	(4, '销售部', '004', 1, '1:4', 0, '销售部', 1, 1517814213);
/*!40000 ALTER TABLE `sys_dept` ENABLE KEYS */;

-- 导出  表 workflow.sys_dept_leader 结构
CREATE TABLE IF NOT EXISTS `sys_dept_leader` (
  `Id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `DeptId` bigint NOT NULL COMMENT '部门ID',
  `UserId` bigint NOT NULL COMMENT '用户ID',
  `LeaderType` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '领导类型',
  PRIMARY KEY (`Id`) USING BTREE,
  KEY `DeptId` (`DeptId`) USING BTREE,
  KEY `UserId` (`UserId`) USING BTREE,
  KEY `LeaderType` (`LeaderType`) USING BTREE,
  CONSTRAINT `sys_dept_leader_ibfk_1` FOREIGN KEY (`DeptId`) REFERENCES `sys_dept` (`DeptId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `sys_dept_leader_ibfk_2` FOREIGN KEY (`UserId`) REFERENCES `sys_user` (`UserId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `sys_dept_leader_ibfk_3` FOREIGN KEY (`LeaderType`) REFERENCES `sys_leader` (`Shorter`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='部门领导关系表';

-- 正在导出表  workflow.sys_dept_leader 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `sys_dept_leader` DISABLE KEYS */;
INSERT INTO `sys_dept_leader` (`Id`, `DeptId`, `UserId`, `LeaderType`) VALUES
	(1, 3, 1, 'bmfzr');
/*!40000 ALTER TABLE `sys_dept_leader` ENABLE KEYS */;

-- 导出  表 workflow.sys_leader 结构
CREATE TABLE IF NOT EXISTS `sys_leader` (
  `Shorter` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '缩写，公司领导应根据此字段获取',
  `LeaderName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '级别名称',
  `Remark` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`Shorter`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='公司领导类型';

-- 正在导出表  workflow.sys_leader 的数据：~3 rows (大约)
/*!40000 ALTER TABLE `sys_leader` DISABLE KEYS */;
INSERT INTO `sys_leader` (`Shorter`, `LeaderName`, `Remark`) VALUES
	('bmfjl', '部门副经理', '部门副经理'),
	('bmfzr', '部门负责人', '部门负责人/部门经理'),
	('boss', '董事长', '董事长/公司老板');
/*!40000 ALTER TABLE `sys_leader` ENABLE KEYS */;

-- 导出  表 workflow.sys_release_log 结构
CREATE TABLE IF NOT EXISTS `sys_release_log` (
  `Id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `VersionNumber` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '版本号',
  `Memo` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '描述',
  `CreateTime` bigint NOT NULL COMMENT '发布时间',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- 正在导出表  workflow.sys_release_log 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `sys_release_log` DISABLE KEYS */;
INSERT INTO `sys_release_log` (`Id`, `VersionNumber`, `Memo`, `CreateTime`) VALUES
	(1, '1', '123', 1498481230);
/*!40000 ALTER TABLE `sys_release_log` ENABLE KEYS */;

-- 导出  表 workflow.sys_resource 结构
CREATE TABLE IF NOT EXISTS `sys_resource` (
  `ResourceId` bigint NOT NULL AUTO_INCREMENT COMMENT '资源ID',
  `SystemId` bigint NOT NULL COMMENT '所属系统',
  `ResourceName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '资源名称',
  `ParentId` bigint NOT NULL DEFAULT '0' COMMENT '父级ID',
  `ResourceUrl` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '资源地址',
  `Sort` int NOT NULL COMMENT '同级排序',
  `ButtonClass` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '按钮样式',
  `Icon` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '样式图标ICON',
  `IsShow` tinyint NOT NULL COMMENT '是否显示到菜单',
  `CreateUserId` bigint NOT NULL COMMENT '创建人',
  `CreateTime` bigint NOT NULL COMMENT '创建时间戳',
  `Memo` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  `IsDel` tinyint NOT NULL DEFAULT '0' COMMENT '是否删除',
  `IsButton` tinyint NOT NULL DEFAULT '0' COMMENT '是否是按钮',
  `ButtonType` tinyint DEFAULT NULL COMMENT '按钮类型',
  `Path` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '资源路径',
  PRIMARY KEY (`ResourceId`) USING BTREE,
  KEY `ParentId` (`ParentId`) USING BTREE,
  KEY `SystemId` (`SystemId`) USING BTREE,
  CONSTRAINT `sys_resource_ibfk_1` FOREIGN KEY (`SystemId`) REFERENCES `sys_system` (`SystemId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=292 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='资源表';

-- 正在导出表  workflow.sys_resource 的数据：~164 rows (大约)
/*!40000 ALTER TABLE `sys_resource` DISABLE KEYS */;
INSERT INTO `sys_resource` (`ResourceId`, `SystemId`, `ResourceName`, `ParentId`, `ResourceUrl`, `Sort`, `ButtonClass`, `Icon`, `IsShow`, `CreateUserId`, `CreateTime`, `Memo`, `IsDel`, `IsButton`, `ButtonType`, `Path`) VALUES
	(1, 1, '系统管理', 0, '/', 1, NULL, 'fa fa-cogs', 1, 1, 1, '123', 0, 0, NULL, '1'),
	(2, 1, '菜单管理', 1, '/Sys/Resource/Index', 5, NULL, 'fa fa-bars', 1, 1, 1, NULL, 0, 0, NULL, '1:2'),
	(4, 1, '菜单管理编辑页', 2, '/Sys/Resource/Operation', 0, NULL, 'fa fa-balance-scale', 0, 1, 1, NULL, 0, 0, NULL, '2:4'),
	(48, 1, '查看', 4, NULL, 4, NULL, 'fa fa-search', 0, 0, 1503957966, NULL, 0, 1, 1, NULL),
	(49, 1, '新增', 4, NULL, 1, NULL, 'fa fa-plus', 0, 0, 1503957966, NULL, 0, 1, 2, NULL),
	(50, 1, '编辑', 4, NULL, 2, NULL, 'fa fa-edit', 0, 0, 1503957966, NULL, 0, 1, 3, NULL),
	(51, 1, '删除', 4, NULL, 3, NULL, 'fa fa-trash', 0, 0, 1503957966, NULL, 0, 1, 4, NULL),
	(53, 1, '角色管理', 1, '/Sys/Role/Index', 2, NULL, 'fa fa-group', 1, 1, 1503958727, '123', 0, 0, NULL, '1:53'),
	(54, 1, '查看', 53, NULL, 4, NULL, 'fa fa-search', 0, 0, 1503958727, NULL, 0, 1, 1, NULL),
	(55, 1, '新增', 53, NULL, 1, NULL, 'fa fa-plus', 0, 0, 1503958727, NULL, 0, 1, 2, NULL),
	(56, 1, '编辑', 53, NULL, 2, NULL, 'fa fa-edit', 0, 0, 1503958727, NULL, 0, 1, 3, NULL),
	(57, 1, '删除', 53, NULL, 3, NULL, 'fa fa-trash', 0, 0, 1503958727, NULL, 0, 1, 4, NULL),
	(58, 1, '子系统管理', 1, '/Sys/System/Index', 4, NULL, 'fa fa-cog', 1, 1, 1503958798, '123', 0, 0, NULL, '1:58'),
	(59, 1, '查看', 58, NULL, 4, NULL, 'fa fa-search', 0, 0, 1503958825, NULL, 0, 1, 1, NULL),
	(60, 1, '新增', 58, NULL, 1, NULL, 'fa fa-plus', 0, 0, 1503958825, NULL, 0, 1, 2, NULL),
	(61, 1, '编辑', 58, NULL, 2, NULL, 'fa fa-edit', 0, 0, 1503958825, NULL, 0, 1, 3, NULL),
	(62, 1, '删除', 58, NULL, 3, NULL, 'fa fa-trash', 0, 0, 1503958825, NULL, 0, 1, 4, NULL),
	(64, 1, '编辑', 2, NULL, 2, NULL, 'fa fa-edit', 0, 0, 1503958921, NULL, 0, 1, 3, NULL),
	(65, 1, '删除', 2, NULL, 3, NULL, 'fa fa-trash', 0, 0, 1503958921, NULL, 0, 1, 4, NULL),
	(66, 1, '角色编辑页', 53, '/Sys/Role/Operation', 0, NULL, NULL, 0, 1, 1503959673, NULL, 0, 0, NULL, '53:66'),
	(67, 1, '查看', 66, NULL, 4, NULL, 'fa fa-search', 0, 0, 1503959674, NULL, 0, 1, 1, NULL),
	(68, 1, '新增', 66, NULL, 1, NULL, 'fa fa-plus', 0, 0, 1503959674, NULL, 0, 1, 2, NULL),
	(69, 1, '编辑', 66, NULL, 2, NULL, 'fa fa-edit', 0, 0, 1503959674, NULL, 0, 1, 3, NULL),
	(70, 1, '删除', 66, NULL, 3, NULL, 'fa fa-trash', 0, 0, 1503959674, NULL, 0, 1, 4, NULL),
	(71, 1, '系统编辑页', 58, '/Sys/System/Operation', 0, NULL, NULL, 0, 1, 1503959721, NULL, 0, 0, NULL, '58:71'),
	(72, 1, '查看', 71, NULL, 4, NULL, 'fa fa-search', 0, 0, 1503959721, NULL, 0, 1, 1, NULL),
	(73, 1, '新增', 71, NULL, 1, NULL, 'fa fa-plus', 0, 0, 1503959721, NULL, 0, 1, 2, NULL),
	(74, 1, '编辑', 71, NULL, 2, NULL, 'fa fa-edit', 0, 0, 1503959721, NULL, 0, 1, 3, NULL),
	(75, 1, '删除', 71, NULL, 3, NULL, 'fa fa-trash', 0, 0, 1503959721, NULL, 0, 1, 4, NULL),
	(76, 1, '用户管理', 1, '/Sys/User/Index', 1, NULL, 'layui-icon layui-icon-username', 1, 1, 1503959782, NULL, 0, 0, NULL, '1:76'),
	(77, 1, '查看', 76, NULL, 4, NULL, 'fa fa-search', 0, 0, 1503959782, NULL, 0, 1, 1, NULL),
	(78, 1, '新增', 76, NULL, 1, NULL, 'fa fa-plus', 0, 0, 1503959782, NULL, 0, 1, 2, NULL),
	(79, 1, '编辑', 76, NULL, 2, NULL, 'fa fa-edit', 0, 0, 1503959782, NULL, 0, 1, 3, NULL),
	(80, 1, '删除', 76, NULL, 3, NULL, 'fa fa-trash', 0, 0, 1503959782, NULL, 0, 1, 4, NULL),
	(81, 1, '用户编辑页', 76, '/Sys/User/Operation', 0, NULL, NULL, 0, 1, 1503959818, NULL, 0, 0, NULL, '76:81'),
	(82, 1, '查看', 81, NULL, 4, NULL, 'fa fa-search', 0, 0, 1503959818, NULL, 0, 1, 1, NULL),
	(83, 1, '新增', 81, NULL, 1, NULL, 'fa fa-plus', 0, 0, 1503959818, NULL, 0, 1, 2, NULL),
	(84, 1, '编辑', 81, NULL, 2, NULL, 'fa fa-edit', 0, 0, 1503959818, NULL, 0, 1, 3, NULL),
	(85, 1, '删除', 81, NULL, 3, NULL, 'fa fa-trash', 0, 0, 1503959818, NULL, 0, 1, 4, NULL),
	(86, 1, '查看', 2, NULL, 4, NULL, 'fa fa-search', 0, 0, 1503990906, NULL, 0, 1, 1, NULL),
	(87, 1, '新增', 2, NULL, 1, NULL, 'fa fa-plus', 0, 0, 1503990906, NULL, 0, 1, 2, NULL),
	(88, 2, '工作流', 0, '/', 3, NULL, 'fa fa-sitemap', 1, 1, 1504013557, NULL, 0, 0, NULL, '88'),
	(91, 2, '流程设计', 88, '/WF/WorkFlow/Index', 3, NULL, 'fa fa-legal', 1, 1, 1504439709, '流程设计列表', 0, 0, NULL, '88:91'),
	(92, 2, '查看', 91, NULL, 4, NULL, 'fa fa-search', 0, 0, 1504439709, NULL, 0, 1, 1, NULL),
	(93, 2, '我的待办', 88, '/WF/WorkFlowInstance/TodoList', 1, NULL, 'fa fa-user', 1, 1, 1504439745, '我的待办', 0, 0, NULL, '88:93'),
	(94, 2, '审批历史', 88, '/WF/WorkFlowInstance/MyApprovalHistory', 0, NULL, 'fa fa-history', 1, 1, 1504575850, '审批历史记录', 0, 0, NULL, '88:94'),
	(95, 2, '查看', 93, NULL, 4, NULL, 'fa fa-search', 0, 0, 1504575862, NULL, 0, 1, 1, NULL),
	(96, 2, '查看', 94, NULL, 4, NULL, 'fa fa-search', 0, 0, 1504575866, NULL, 0, 1, 1, NULL),
	(97, 3, '微信管理', 0, '/', 2, NULL, 'fa fa-weixin', 1, 1, 1504576048, '微信管理', 0, 0, NULL, '97'),
	(98, 2, '流程分类', 88, '/WF/Category/Index', 4, NULL, 'fa fa-building-o', 1, 1, 1508764750, '流程分类', 0, 0, NULL, '88:98'),
	(99, 2, '查看', 98, NULL, 4, NULL, 'fa fa-search', 0, 0, 1508764750, NULL, 0, 1, 1, NULL),
	(100, 5, '行政办公', 0, '/', 2, NULL, 'fa fa-book', 1, 1, 1509884326, NULL, 0, 0, NULL, '100'),
	(142, 1, '部门管理', 1, '/Sys/Dept/Index', 3, NULL, 'fa fa-sitemap', 1, 1, 1514899755, NULL, 0, 0, NULL, '1:142'),
	(143, 1, '查看', 142, NULL, 4, NULL, 'fa fa-search', 0, 0, 1514899755, NULL, 0, 1, 1, NULL),
	(144, 1, '新增', 142, NULL, 1, NULL, 'fa fa-plus', 0, 0, 1514899755, NULL, 0, 1, 2, NULL),
	(145, 1, '编辑', 142, NULL, 2, NULL, 'fa fa-edit', 0, 0, 1514899755, NULL, 0, 1, 3, NULL),
	(146, 1, '删除', 142, NULL, 3, NULL, 'fa fa-trash', 0, 0, 1514899755, NULL, 0, 1, 4, NULL),
	(152, 1, '部门编辑页', 142, '/Sys/Dept/Operation', 1, NULL, '', 0, 1, 1514899820, NULL, 0, 0, NULL, '1:142:152'),
	(153, 1, '查看', 152, NULL, 4, NULL, 'fa fa-search', 0, 0, 1514899820, NULL, 0, 1, 1, NULL),
	(154, 1, '新增', 152, NULL, 1, NULL, 'fa fa-plus', 0, 0, 1514899820, NULL, 0, 1, 2, NULL),
	(155, 1, '编辑', 152, NULL, 2, NULL, 'fa fa-edit', 0, 0, 1514899820, NULL, 0, 1, 3, NULL),
	(156, 1, '删除', 152, NULL, 3, NULL, 'fa fa-trash', 0, 0, 1514899820, NULL, 0, 1, 4, NULL),
	(157, 1, '数据权限', 76, '/Sys/User/DataPrivileges', 2, NULL, NULL, 0, 1, 1515548644, NULL, 0, 0, NULL, '1:76:157'),
	(158, 1, '查看', 157, NULL, 4, NULL, 'fa fa-search', 0, 0, 1515548644, NULL, 0, 1, 1, NULL),
	(159, 1, '新增', 157, NULL, 1, NULL, 'fa fa-plus', 0, 0, 1515548644, NULL, 0, 1, 2, NULL),
	(160, 1, '编辑', 157, NULL, 2, NULL, 'fa fa-edit', 0, 0, 1515548644, NULL, 0, 1, 3, NULL),
	(161, 1, '删除', 157, NULL, 3, NULL, 'fa fa-trash', 0, 0, 1515548644, NULL, 0, 1, 4, NULL),
	(162, 5, '员工请假', 100, '/OA/Leave/Index', 1, NULL, 'fa fa-hand-paper-o', 1, 1, 1519985181, NULL, 0, 0, NULL, '100:162'),
	(163, 5, '查看', 162, NULL, 0, NULL, 'fa fa-search', 0, 0, 1519985181, NULL, 0, 1, 1, NULL),
	(164, 5, '新增', 162, NULL, 0, NULL, 'fa fa-plus', 0, 0, 1519985181, NULL, 0, 1, 2, NULL),
	(165, 5, '编辑', 162, NULL, 0, NULL, 'fa fa-edit', 0, 0, 1519985181, NULL, 0, 1, 3, NULL),
	(166, 5, '删除', 162, NULL, 0, NULL, 'fa fa-trash', 0, 0, 1519985181, NULL, 0, 1, 4, NULL),
	(167, 5, '员工请假编辑页', 162, '/OA/Leave/Operation', 1, NULL, 'fa fa-cc-diners-club', 0, 1, 1520040301, NULL, 0, 0, NULL, '162:167'),
	(168, 5, '查看', 167, NULL, 0, NULL, 'fa fa-search', 0, 0, 1520040301, NULL, 0, 1, 1, NULL),
	(169, 5, '新增', 167, NULL, 0, NULL, 'fa fa-plus', 0, 0, 1520040301, NULL, 0, 1, 2, NULL),
	(170, 5, '编辑', 167, NULL, 0, NULL, 'fa fa-edit', 0, 0, 1520040301, NULL, 0, 1, 3, NULL),
	(171, 5, '删除', 167, NULL, 0, NULL, 'fa fa-trash', 0, 0, 1520040301, NULL, 0, 1, 4, NULL),
	(172, 2, '新增', 91, NULL, 0, NULL, 'fa fa-plus', 0, 0, 1544438530, NULL, 0, 1, 2, NULL),
	(173, 2, '编辑', 91, NULL, 0, NULL, 'fa fa-edit', 0, 0, 1544438530, NULL, 0, 1, 3, NULL),
	(174, 2, '删除', 91, NULL, 0, NULL, 'fa fa-trash', 0, 0, 1544438530, NULL, 0, 1, 4, NULL),
	(175, 1, '调度中心', 1, '/Sys/Schedule/Index', 6, NULL, 'fa fa-joomla', 1, 1, 1545365625, NULL, 0, 0, NULL, '1:175'),
	(176, 1, '查看', 175, NULL, 0, NULL, 'fa fa-search', 0, 0, 1545365625, NULL, 0, 1, 1, NULL),
	(177, 1, '新增', 175, NULL, 0, NULL, 'fa fa-plus', 0, 0, 1545365625, NULL, 0, 1, 2, NULL),
	(178, 1, '编辑', 175, NULL, 0, NULL, 'fa fa-edit', 0, 0, 1545365625, NULL, 0, 1, 3, NULL),
	(179, 1, '删除', 175, NULL, 0, NULL, 'fa fa-trash', 0, 0, 1545365625, NULL, 0, 1, 4, NULL),
	(180, 1, '调度编辑页', 175, '/Sys/Schedule/Operation', 1, NULL, NULL, 0, 1, 1545365682, NULL, 0, 0, NULL, '1:175:180'),
	(181, 1, '查看', 180, NULL, 0, NULL, 'fa fa-search', 0, 0, 1545365682, NULL, 0, 1, 1, NULL),
	(182, 1, '新增', 180, NULL, 0, NULL, 'fa fa-plus', 0, 0, 1545365754, NULL, 0, 1, 2, NULL),
	(183, 1, '编辑', 180, NULL, 0, NULL, 'fa fa-edit', 0, 0, 1545365754, NULL, 0, 1, 3, NULL),
	(184, 1, '删除', 180, NULL, 0, NULL, 'fa fa-trash', 0, 0, 1545365754, NULL, 0, 1, 4, NULL),
	(185, 1, '日志列表', 1, '/Sys/Log/Index', 7, NULL, 'fa fa-list-alt', 1, 1, 1545902555, NULL, 0, 0, NULL, '1:185'),
	(186, 1, '查看', 185, NULL, 0, NULL, 'fa fa-search', 0, 0, 1545902555, NULL, 0, 1, 1, NULL),
	(187, 3, '规则管理', 97, '/Weixin/Rule/Index', 3, NULL, 'fa fa-hand-lizard-o', 1, 1, 1547040097, NULL, 0, 0, NULL, '97:187'),
	(188, 3, '查看', 187, NULL, 0, NULL, 'fa fa-search', 0, 0, 1547040097, NULL, 0, 1, 1, NULL),
	(189, 3, '新增', 187, NULL, 0, NULL, 'fa fa-plus', 0, 0, 1547040097, NULL, 0, 1, 2, NULL),
	(190, 3, '编辑', 187, NULL, 0, NULL, 'fa fa-edit', 0, 0, 1547040097, NULL, 0, 1, 3, NULL),
	(191, 3, '删除', 187, NULL, 0, NULL, 'fa fa-trash', 0, 0, 1547040097, NULL, 0, 1, 4, NULL),
	(192, 3, '规则编辑页', 187, '/Weixin/Rule/Operation', 1, NULL, NULL, 0, 1, 1547040143, NULL, 0, 0, NULL, '97:187:192'),
	(193, 3, '查看', 192, NULL, 0, NULL, 'fa fa-search', 0, 0, 1547040143, NULL, 0, 1, 1, NULL),
	(194, 3, '新增', 192, NULL, 0, NULL, 'fa fa-plus', 0, 0, 1547040143, NULL, 0, 1, 2, NULL),
	(195, 3, '编辑', 192, NULL, 0, NULL, 'fa fa-edit', 0, 0, 1547040143, NULL, 0, 1, 3, NULL),
	(196, 3, '删除', 192, NULL, 0, NULL, 'fa fa-trash', 0, 0, 1547040143, NULL, 0, 1, 4, NULL),
	(197, 3, '自定义菜单', 97, '/Weixin/Menu/Index', 2, NULL, 'fa fa-bars', 1, 1, 1547040193, NULL, 0, 0, NULL, '97:197'),
	(198, 3, '查看', 197, NULL, 0, NULL, 'fa fa-search', 0, 0, 1547040193, NULL, 0, 1, 1, NULL),
	(199, 3, '新增', 197, NULL, 0, NULL, 'fa fa-plus', 0, 0, 1547040193, NULL, 0, 1, 2, NULL),
	(200, 3, '编辑', 197, NULL, 0, NULL, 'fa fa-edit', 0, 0, 1547040193, NULL, 0, 1, 3, NULL),
	(201, 3, '删除', 197, NULL, 0, NULL, 'fa fa-trash', 0, 0, 1547040193, NULL, 0, 1, 4, NULL),
	(202, 3, '自定义菜单编辑页', 197, '/Weixin/Menu/Operation', 1, NULL, NULL, 0, 1, 1547040223, NULL, 0, 0, NULL, '97:197:202'),
	(203, 3, '查看', 202, NULL, 0, NULL, 'fa fa-search', 0, 0, 1547040223, NULL, 0, 1, 1, NULL),
	(204, 3, '新增', 202, NULL, 0, NULL, 'fa fa-plus', 0, 0, 1547040223, NULL, 0, 1, 2, NULL),
	(205, 3, '编辑', 202, NULL, 0, NULL, 'fa fa-edit', 0, 0, 1547040223, NULL, 0, 1, 3, NULL),
	(206, 3, '删除', 202, NULL, 0, NULL, 'fa fa-trash', 0, 0, 1547040223, NULL, 0, 1, 4, NULL),
	(223, 2, '新增', 98, NULL, 0, 'fa fa-plus', NULL, 0, 0, 1556070241, NULL, 0, 1, 2, NULL),
	(224, 2, '编辑', 98, NULL, 0, 'fa fa-edit', NULL, 0, 0, 1556070241, NULL, 0, 1, 3, NULL),
	(225, 2, '删除', 98, NULL, 0, 'fa fa-trash', NULL, 0, 0, 1556070241, NULL, 0, 1, 4, NULL),
	(226, 2, '我的流程', 88, '/WF/WorkFlowInstance/MyFlow', 2, NULL, 'fa fa-user-plus', 1, 1, 1556096263, NULL, 0, 0, NULL, '88:226'),
	(227, 2, '查看', 226, NULL, 0, 'fa fa-search', NULL, 0, 0, 1556096263, NULL, 0, 1, 1, NULL),
	(228, 2, '新增', 226, NULL, 0, 'fa fa-plus', NULL, 0, 0, 1556096263, NULL, 0, 1, 2, NULL),
	(229, 2, '编辑', 226, NULL, 0, 'fa fa-edit', NULL, 0, 0, 1556096263, NULL, 0, 1, 3, NULL),
	(230, 2, '删除', 226, NULL, 0, 'fa fa-trash', NULL, 0, 0, 1556096263, NULL, 0, 1, 4, NULL),
	(231, 2, '流程发起', 88, '/WF/WorkFlowInstance/Start', 5, NULL, 'fa fa-location-arrow', 1, 1, 1556096629, NULL, 0, 0, NULL, '88:231'),
	(232, 2, '查看', 231, NULL, 0, 'fa fa-search', NULL, 0, 0, 1556096629, NULL, 0, 1, 1, NULL),
	(236, 2, '表单设计', 88, '/WF/Form/Index', 6, NULL, 'fa fa-contao', 1, 1, 1556097850, '表单设计', 0, 0, NULL, '88:236'),
	(237, 2, '查看', 236, NULL, 0, 'fa fa-search', NULL, 0, 0, 1556097850, NULL, 0, 1, 1, NULL),
	(238, 2, '新增', 236, NULL, 0, 'fa fa-plus', NULL, 0, 0, 1556097850, NULL, 0, 1, 2, NULL),
	(239, 2, '编辑', 236, NULL, 0, 'fa fa-edit', NULL, 0, 0, 1556097850, NULL, 0, 1, 3, NULL),
	(240, 2, '删除', 236, NULL, 0, 'fa fa-trash', NULL, 0, 0, 1556097850, NULL, 0, 1, 4, NULL),
	(241, 2, '表单设计编辑页', 236, '/WF/Form/Operation', 1, NULL, NULL, 0, 1, 1556098005, NULL, 0, 0, NULL, '88:236:241'),
	(242, 2, '查看', 241, NULL, 0, 'fa fa-search', NULL, 0, 0, 1556098005, NULL, 0, 1, 1, NULL),
	(243, 2, '新增', 241, NULL, 0, 'fa fa-plus', NULL, 0, 0, 1556098005, NULL, 0, 1, 2, NULL),
	(244, 2, '编辑', 241, NULL, 0, 'fa fa-edit', NULL, 0, 0, 1556098005, NULL, 0, 1, 3, NULL),
	(245, 2, '删除', 241, NULL, 0, 'fa fa-trash', NULL, 0, 0, 1556098005, NULL, 0, 1, 4, NULL),
	(246, 2, '流程设计编辑页', 91, '/WF/WorkFlow/Operation', 1, NULL, NULL, 0, 1, 1557981722, '流程设计编辑页', 0, 0, NULL, '88:91:246'),
	(247, 2, '查看', 246, NULL, 0, 'fa fa-search', NULL, 0, 0, 1557981722, NULL, 0, 1, 1, NULL),
	(248, 2, '新增', 246, NULL, 0, 'fa fa-plus', NULL, 0, 0, 1557981722, NULL, 0, 1, 2, NULL),
	(249, 2, '编辑', 246, NULL, 0, 'fa fa-edit', NULL, 0, 0, 1557981722, NULL, 0, 1, 3, NULL),
	(250, 2, '删除', 246, NULL, 0, 'fa fa-trash', NULL, 0, 0, 1557981722, NULL, 0, 1, 4, NULL),
	(253, 5, '消息管理', 100, '/OA/Message/Index', 2, NULL, 'fa fa-envelope-o', 1, 1, 1558927920, NULL, 0, 0, NULL, '100:253'),
	(254, 5, '查看', 253, NULL, 0, 'fa fa-search', NULL, 0, 0, 1558927920, NULL, 0, 1, 1, NULL),
	(255, 5, '新增', 253, NULL, 0, 'fa fa-plus', NULL, 0, 0, 1558927920, NULL, 0, 1, 2, NULL),
	(256, 5, '编辑', 253, NULL, 0, 'fa fa-edit', NULL, 0, 0, 1558927920, NULL, 0, 1, 3, NULL),
	(257, 5, '删除', 253, NULL, 0, 'fa fa-trash', NULL, 0, 0, 1558927920, NULL, 0, 1, 4, NULL),
	(258, 5, '立即发送', 253, NULL, 0, 'fa fa-location-arrow', NULL, 0, 0, 1558927931, NULL, 0, 1, 9, NULL),
	(259, 5, '消息编辑页', 253, '/OA/Message/Operation', 1, NULL, NULL, 0, 1, 1558927982, NULL, 0, 0, NULL, '100:253:259'),
	(260, 5, '查看', 259, NULL, 0, 'fa fa-search', NULL, 0, 0, 1558927982, NULL, 0, 1, 1, NULL),
	(261, 5, '新增', 259, NULL, 0, 'fa fa-plus', NULL, 0, 0, 1558927982, NULL, 0, 1, 2, NULL),
	(262, 5, '编辑', 259, NULL, 0, 'fa fa-edit', NULL, 0, 0, 1558927982, NULL, 0, 1, 3, NULL),
	(263, 5, '删除', 259, NULL, 0, 'fa fa-trash', NULL, 0, 0, 1558927982, NULL, 0, 1, 4, NULL),
	(264, 5, '我的消息', 100, '/OA/Message/MyList', 3, NULL, 'fa fa-commenting-o', 1, 1, 1558928061, NULL, 0, 0, NULL, '100:264'),
	(265, 5, '查看', 264, NULL, 0, 'fa fa-search', NULL, 0, 0, 1558928061, NULL, 0, 1, 1, NULL),
	(266, 5, '消息明细', 264, '/OA/Message/Detail', 1, NULL, NULL, 0, 1, 1558946268, NULL, 0, 0, NULL, '100:264:266'),
	(267, 5, '查看', 266, NULL, 0, 'fa fa-search', NULL, 0, 0, 1558946268, NULL, 0, 1, 1, NULL),
	(268, 3, '公众号', 97, '/Weixin/Account/Index', 1, NULL, 'fa fa-user', 1, 1, 1560503093, '公众号列表', 0, 0, NULL, '97:268'),
	(269, 3, '查看', 268, NULL, 0, 'fa fa-search', NULL, 0, 0, 1560503093, NULL, 0, 1, 1, NULL),
	(270, 3, '新增', 268, NULL, 0, 'fa fa-plus', NULL, 0, 0, 1560503093, NULL, 0, 1, 2, NULL),
	(271, 3, '编辑', 268, NULL, 0, 'fa fa-edit', NULL, 0, 0, 1560503093, NULL, 0, 1, 3, NULL),
	(272, 3, '删除', 268, NULL, 0, 'fa fa-trash', NULL, 0, 0, 1560503093, NULL, 0, 1, 4, NULL),
	(273, 5, '内部聊天', 100, '/OA/Chat/Index', 4, NULL, 'fa fa-whatsapp', 1, 1, 1560740703, '即时通信聊天', 0, 0, NULL, '100:273'),
	(274, 5, '查看', 273, NULL, 0, 'fa fa-search', NULL, 0, 0, 1560740703, NULL, 0, 1, 1, NULL),
	(275, 1, '生成代码', 1, '/Sys/CodeBuilder/Index', 8, NULL, 'fa fa-code', 1, 1, 1571682751, NULL, 0, 0, NULL, '1:275'),
	(276, 1, '查看', 275, NULL, 0, 'fa fa-search', NULL, 0, 0, 1571682751, NULL, 0, 1, 1, NULL),
	(277, 1, 'kibana日志', 1, 'http://192.168.178.81:5601/app/kibana', 9, NULL, 'fa fa-building-o', 1, 1, 1575852343, 'kibana日志', 0, 0, NULL, '1:277'),
	(278, 2, '扩展', 246, NULL, 0, '', NULL, 0, 0, 1585541925, NULL, 0, 1, 9, NULL),
	(279, 2, '新建版本', 91, NULL, 0, '', NULL, 0, 0, 1585542298, NULL, 0, 1, 9, NULL);
/*!40000 ALTER TABLE `sys_resource` ENABLE KEYS */;

-- 导出  表 workflow.sys_role 结构
CREATE TABLE IF NOT EXISTS `sys_role` (
  `RoleId` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `SystemId` bigint NOT NULL COMMENT '所属系统',
  `RoleName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `Memo` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  `IsDel` tinyint NOT NULL DEFAULT '0' COMMENT '是否删除',
  `CreateUserId` bigint NOT NULL COMMENT '创建人ID',
  `CreateTime` bigint NOT NULL COMMENT '创建时间',
  `UpdateUserId` bigint DEFAULT NULL COMMENT '修改人',
  `UpdateTime` bigint DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`RoleId`) USING BTREE,
  KEY `SystemId` (`SystemId`) USING BTREE,
  CONSTRAINT `sys_role_ibfk_1` FOREIGN KEY (`SystemId`) REFERENCES `sys_system` (`SystemId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='角色表';

-- 正在导出表  workflow.sys_role 的数据：~7 rows (大约)
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` (`RoleId`, `SystemId`, `RoleName`, `Memo`, `IsDel`, `CreateUserId`, `CreateTime`, `UpdateUserId`, `UpdateTime`) VALUES
	(1, 1, '系统管理员', '系统管理员', 0, 0, 1497889200, NULL, NULL),
	(2, 1, '微信管理员', '微信管理员', 1, 0, 1497889200, 0, 0),
	(4, 1, '测试角色', '测试角色', 1, 1, 1499488686, NULL, NULL),
	(5, 2, '流程管理员', '流程管理员', 0, 1, 1499493280, NULL, NULL),
	(6, 5, '普通用户', '普通用户123', 0, 1, 1500956464, NULL, NULL),
	(7, 3, '微信管理员', '微信管理员', 0, 1, 1547040281, 0, 0),
	(8, 1, '系统操作员', '法法法法付', 0, 1, 1602164398, 0, 0),
	(9, 1, 'Rex', '测试', 1, 1, 1614416134, 0, 1614416411);
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;

-- 导出  表 workflow.sys_role_resource 结构
CREATE TABLE IF NOT EXISTS `sys_role_resource` (
  `Id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `RoleId` bigint NOT NULL COMMENT '角色ID',
  `ResourceId` bigint NOT NULL COMMENT '资源ID',
  `CreateTime` bigint NOT NULL COMMENT '创建时间戳',
  PRIMARY KEY (`Id`) USING BTREE,
  KEY `RoleId` (`RoleId`) USING BTREE,
  KEY `ResourceId` (`ResourceId`) USING BTREE,
  CONSTRAINT `sys_role_resource_ibfk_1` FOREIGN KEY (`RoleId`) REFERENCES `sys_role` (`RoleId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `sys_role_resource_ibfk_2` FOREIGN KEY (`ResourceId`) REFERENCES `sys_resource` (`ResourceId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=2734 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='角色资源关联表';

-- 正在导出表  workflow.sys_role_resource 的数据：~148 rows (大约)
/*!40000 ALTER TABLE `sys_role_resource` DISABLE KEYS */;
INSERT INTO `sys_role_resource` (`Id`, `RoleId`, `ResourceId`, `CreateTime`) VALUES
	(2247, 7, 97, 1560503131),
	(2248, 7, 268, 1560503131),
	(2249, 7, 269, 1560503131),
	(2250, 7, 270, 1560503131),
	(2251, 7, 271, 1560503131),
	(2252, 7, 272, 1560503131),
	(2253, 7, 197, 1560503131),
	(2254, 7, 198, 1560503131),
	(2255, 7, 199, 1560503131),
	(2256, 7, 200, 1560503131),
	(2257, 7, 201, 1560503131),
	(2258, 7, 202, 1560503131),
	(2259, 7, 203, 1560503131),
	(2260, 7, 204, 1560503131),
	(2261, 7, 205, 1560503131),
	(2262, 7, 206, 1560503131),
	(2263, 7, 187, 1560503131),
	(2264, 7, 188, 1560503131),
	(2265, 7, 189, 1560503131),
	(2266, 7, 190, 1560503131),
	(2267, 7, 191, 1560503131),
	(2268, 7, 192, 1560503131),
	(2269, 7, 193, 1560503131),
	(2270, 7, 194, 1560503131),
	(2271, 7, 195, 1560503131),
	(2272, 7, 196, 1560503131),
	(2273, 6, 100, 1560740715),
	(2274, 6, 162, 1560740715),
	(2275, 6, 163, 1560740715),
	(2276, 6, 164, 1560740715),
	(2277, 6, 165, 1560740715),
	(2278, 6, 166, 1560740715),
	(2279, 6, 167, 1560740715),
	(2280, 6, 168, 1560740715),
	(2281, 6, 169, 1560740715),
	(2282, 6, 170, 1560740715),
	(2283, 6, 171, 1560740715),
	(2284, 6, 253, 1560740715),
	(2285, 6, 254, 1560740715),
	(2286, 6, 255, 1560740715),
	(2287, 6, 256, 1560740715),
	(2288, 6, 257, 1560740715),
	(2289, 6, 258, 1560740715),
	(2290, 6, 259, 1560740715),
	(2291, 6, 260, 1560740715),
	(2292, 6, 261, 1560740715),
	(2293, 6, 262, 1560740715),
	(2294, 6, 263, 1560740715),
	(2295, 6, 264, 1560740715),
	(2296, 6, 265, 1560740715),
	(2297, 6, 266, 1560740715),
	(2298, 6, 267, 1560740715),
	(2299, 6, 273, 1560740715),
	(2300, 6, 274, 1560740715),
	(2480, 5, 88, 1585542317),
	(2481, 5, 94, 1585542318),
	(2482, 5, 96, 1585542318),
	(2483, 5, 93, 1585542318),
	(2484, 5, 95, 1585542318),
	(2485, 5, 226, 1585542318),
	(2486, 5, 227, 1585542318),
	(2487, 5, 228, 1585542318),
	(2488, 5, 229, 1585542318),
	(2489, 5, 230, 1585542318),
	(2490, 5, 91, 1585542318),
	(2491, 5, 172, 1585542318),
	(2492, 5, 173, 1585542318),
	(2493, 5, 174, 1585542318),
	(2494, 5, 279, 1585542318),
	(2495, 5, 246, 1585542318),
	(2496, 5, 247, 1585542318),
	(2497, 5, 248, 1585542318),
	(2498, 5, 249, 1585542318),
	(2499, 5, 250, 1585542318),
	(2500, 5, 92, 1585542318),
	(2501, 5, 98, 1585542318),
	(2502, 5, 223, 1585542318),
	(2503, 5, 224, 1585542318),
	(2504, 5, 225, 1585542318),
	(2505, 5, 99, 1585542318),
	(2506, 5, 231, 1585542318),
	(2507, 5, 232, 1585542318),
	(2508, 5, 236, 1585542318),
	(2509, 5, 237, 1585542318),
	(2510, 5, 238, 1585542318),
	(2511, 5, 239, 1585542318),
	(2512, 5, 240, 1585542318),
	(2513, 5, 241, 1585542318),
	(2514, 5, 242, 1585542318),
	(2515, 5, 243, 1585542318),
	(2516, 5, 244, 1585542318),
	(2517, 5, 245, 1585542318),
	(2678, 1, 1, 1614419189),
	(2679, 1, 76, 1614419189),
	(2680, 1, 81, 1614419189),
	(2681, 1, 83, 1614419189),
	(2682, 1, 84, 1614419189),
	(2683, 1, 85, 1614419189),
	(2684, 1, 82, 1614419189),
	(2685, 1, 78, 1614419189),
	(2686, 1, 79, 1614419189),
	(2687, 1, 157, 1614419189),
	(2688, 1, 159, 1614419189),
	(2689, 1, 160, 1614419189),
	(2690, 1, 161, 1614419189),
	(2691, 1, 158, 1614419189),
	(2692, 1, 80, 1614419189),
	(2693, 1, 77, 1614419189),
	(2694, 1, 53, 1614419189),
	(2695, 1, 66, 1614419189),
	(2696, 1, 68, 1614419189),
	(2697, 1, 69, 1614419189),
	(2698, 1, 70, 1614419189),
	(2699, 1, 67, 1614419189),
	(2700, 1, 55, 1614419189),
	(2701, 1, 56, 1614419189),
	(2702, 1, 57, 1614419189),
	(2703, 1, 54, 1614419189),
	(2704, 1, 142, 1614419189),
	(2705, 1, 144, 1614419189),
	(2706, 1, 152, 1614419189),
	(2707, 1, 154, 1614419189),
	(2708, 1, 155, 1614419189),
	(2709, 1, 156, 1614419189),
	(2710, 1, 153, 1614419189),
	(2711, 1, 145, 1614419189),
	(2712, 1, 146, 1614419189),
	(2713, 1, 143, 1614419189),
	(2714, 1, 58, 1614419189),
	(2715, 1, 71, 1614419189),
	(2716, 1, 73, 1614419189),
	(2717, 1, 74, 1614419189),
	(2718, 1, 75, 1614419189),
	(2719, 1, 72, 1614419189),
	(2720, 1, 60, 1614419189),
	(2721, 1, 61, 1614419189),
	(2722, 1, 62, 1614419189),
	(2723, 1, 59, 1614419189),
	(2724, 1, 2, 1614419189),
	(2725, 1, 4, 1614419189),
	(2726, 1, 49, 1614419189),
	(2727, 1, 50, 1614419189),
	(2728, 1, 51, 1614419189),
	(2729, 1, 48, 1614419189),
	(2730, 1, 87, 1614419189),
	(2731, 1, 64, 1614419189),
	(2732, 1, 65, 1614419189),
	(2733, 1, 86, 1614419189);
/*!40000 ALTER TABLE `sys_role_resource` ENABLE KEYS */;

-- 导出  表 workflow.sys_schedule 结构
CREATE TABLE IF NOT EXISTS `sys_schedule` (
  `JobId` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `JobName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务名称',
  `JobGroup` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务分组',
  `JobStatus` tinyint NOT NULL COMMENT '任务状态， 0 暂停任务；1 启用任务',
  `TriggerType` tinyint NOT NULL COMMENT '触发器类型（0、simple 1、cron）',
  `Cron` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '任务运行时间表达式',
  `AssemblyName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '任务所在DLL对应的程序集名称',
  `ClassName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '任务所在类',
  `Remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '任务描述',
  `CreateTime` datetime NOT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  `RunTimes` int NOT NULL DEFAULT '0' COMMENT '执行次数',
  `BeginTime` datetime NOT NULL COMMENT '开始时间',
  `EndTime` datetime DEFAULT NULL COMMENT '结束时间',
  `IntervalSecond` int DEFAULT NULL COMMENT '执行间隔时间, 秒为单位',
  `Url` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'job调用外部的url',
  `Status` tinyint NOT NULL DEFAULT '1' COMMENT '状态 0删除,1未删除',
  PRIMARY KEY (`JobId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- 正在导出表  workflow.sys_schedule 的数据：~2 rows (大约)
/*!40000 ALTER TABLE `sys_schedule` DISABLE KEYS */;
INSERT INTO `sys_schedule` (`JobId`, `JobName`, `JobGroup`, `JobStatus`, `TriggerType`, `Cron`, `AssemblyName`, `ClassName`, `Remark`, `CreateTime`, `UpdateTime`, `RunTimes`, `BeginTime`, `EndTime`, `IntervalSecond`, `Url`, `Status`) VALUES
	(1, '微信AccessToken自动同步任务', 'DefaultJob', 0, 0, '3 * * * * ? ', 'MsSystem.Schedule.Job', 'WxAccessTokenJob', NULL, '2019-04-17 11:05:13', NULL, 0, '2019-04-17 11:05:08', NULL, 0, NULL, 1),
	(2, '微信用户信息同步任务', 'DefaultJob', 0, 0, '0 0 0/1 * * ? ', 'MsSystem.Schedule.Job', 'WxUserInfoJob', NULL, '2019-04-17 11:05:13', NULL, 0, '2019-04-17 11:05:08', NULL, 0, NULL, 1);
/*!40000 ALTER TABLE `sys_schedule` ENABLE KEYS */;

-- 导出  表 workflow.sys_system 结构
CREATE TABLE IF NOT EXISTS `sys_system` (
  `SystemId` bigint NOT NULL AUTO_INCREMENT COMMENT '系统ID',
  `SystemName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '系统名称',
  `SystemCode` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '系统编码',
  `Memo` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  `IsDel` tinyint NOT NULL DEFAULT '0' COMMENT '是否删除',
  `Sort` int NOT NULL DEFAULT '0' COMMENT '排序',
  `CreateUserId` bigint NOT NULL COMMENT '创建人ID',
  `CreateTime` bigint DEFAULT NULL COMMENT '创建时间',
  `UpdateUserId` bigint DEFAULT NULL COMMENT '更新人',
  `UpdateTime` bigint DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`SystemId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统表';

-- 正在导出表  workflow.sys_system 的数据：~6 rows (大约)
/*!40000 ALTER TABLE `sys_system` DISABLE KEYS */;
INSERT INTO `sys_system` (`SystemId`, `SystemName`, `SystemCode`, `Memo`, `IsDel`, `Sort`, `CreateUserId`, `CreateTime`, `UpdateUserId`, `UpdateTime`) VALUES
	(1, '系统管理', 'be1c63a0-63aa-11e7-a221-f97d872f551b', '权限系统', 0, 1, 1, 1498481230, 0, 1537448282),
	(2, '工作流', 'c3cd9538-63aa-11e7-a221-f97d872f551b', '工作流', 0, 4, 1, 1498481230, 0, 1614595885),
	(3, '微信系统', 'c7526ad9-63aa-11e7-a221-f97d872f551b', '微信系统', 0, 3, 1, 1498481230, 0, 1537447638),
	(4, '系统测试', '252110d2-cb56-46c8-9dc2-64c3d7e23b21', '系统测试0000', 1, 0, 1, 1499494026, 0, 0),
	(5, '行政办公系统', 'd65fb3df-d342-41c9-ad9a-3faedbb5b0dc', '行政办公系统', 0, 2, 1, 1500955747, 0, 1537448139),
	(6, '行政办公', '8130e64e-912b-4ce5-aae5-89ba3b5d97a9', '行政办公系统', 1, 0, 1, 1509884116, NULL, NULL),
	(7, '测试2', 'e9ecb90c-6fbd-48a0-9261-31df5284db7c', 'cews2', 1, 5, 1, 1614588793, 0, 1614588883);
/*!40000 ALTER TABLE `sys_system` ENABLE KEYS */;

-- 导出  表 workflow.sys_user 结构
CREATE TABLE IF NOT EXISTS `sys_user` (
  `UserId` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `Account` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '登录账号',
  `UserName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `JobNumber` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '工号',
  `Password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `HeadImg` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '头像地址',
  `IsDel` tinyint NOT NULL DEFAULT '0' COMMENT '是否删除 1:是，0：否',
  `CreateUserId` bigint NOT NULL COMMENT '创建人ID',
  `CreateTime` bigint NOT NULL COMMENT '创建时间',
  `UpdateUserId` bigint DEFAULT NULL COMMENT '更新人',
  `UpdateTime` bigint DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`UserId`) USING BTREE,
  KEY `Account` (`Account`) USING BTREE,
  KEY `JobNumber` (`JobNumber`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户表（作用于全部系统）';

-- 正在导出表  workflow.sys_user 的数据：~19 rows (大约)
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` (`UserId`, `Account`, `UserName`, `JobNumber`, `Password`, `HeadImg`, `IsDel`, `CreateUserId`, `CreateTime`, `UpdateUserId`, `UpdateTime`) VALUES
	(1, 'Rex', '雷克斯', '20180101', '40BD001563085FC35165329EA1FF5C5ECBDBBEEF', '/uploadfile/70ca7d52-d5c2-44df-914c-8ad71075261a.png', 0, 1, 1614332540, 1, 1614332540),
	(4, '王五', '王五', '20180102', '40BD001563085FC35165329EA1FF5C5ECBDBBEEF', '/uploadfile/342bd59b-edf4-48cf-aa27-d13e5a0b70df.jpeg', 0, 0, 1614332440, 1, 1614332440),
	(5, '张三', '张三', '20180103', '40BD001563085FC35165329EA1FF5C5ECBDBBEEF', '/uploadfile/1ca449c6-24ed-4b78-a032-6005990ff707.jpeg', 0, 0, 1614332340, 1, 1614332340),
	(6, '李四', '李四', '20180104', '40BD001563085FC35165329EA1FF5C5ECBDBBEEF', '/uploadfile/342bd59b-edf4-48cf-aa27-d13e5a0b70df.jpeg', 0, 0, 1614332240, NULL, NULL),
	(7, '叶文洁', '叶文洁', '20180105', '40BD001563085FC35165329EA1FF5C5ECBDBBEEF', '/uploadfile/342bd59b-edf4-48cf-aa27-d13e5a0b70df.jpeg', 0, 0, 1499750534, 1, 1614332468),
	(8, '罗辑', '罗辑', '20180106', '40BD001563085FC35165329EA1FF5C5ECBDBBEEF', '/uploadfile/342bd59b-edf4-48cf-aa27-d13e5a0b70df.jpeg', 0, 0, 1499750544, 1, 1614332446),
	(9, '艾AA', '艾AA', '20180107', '40BD001563085FC35165329EA1FF5C5ECBDBBEEF', '/uploadfile/342bd59b-edf4-48cf-aa27-d13e5a0b70df.jpeg', 0, 0, 1499750555, 1, 1614332434),
	(10, '云天明', '云天明', '20180108', '40BD001563085FC35165329EA1FF5C5ECBDBBEEF', '/uploadfile/342bd59b-edf4-48cf-aa27-d13e5a0b70df.jpeg', 0, 0, 1499750555, 1, 1614332441),
	(11, '程心', '程心', '20180109', '40BD001563085FC35165329EA1FF5C5ECBDBBEEF', '/uploadfile/342bd59b-edf4-48cf-aa27-d13e5a0b70df.jpeg', 0, 0, 1499750583, 1, 1614332429),
	(12, '维德', '维德', '20180110', '40BD001563085FC35165329EA1FF5C5ECBDBBEEF', '/uploadfile/342bd59b-edf4-48cf-aa27-d13e5a0b70df.jpeg', 0, 0, 1499750584, 1, 1614332424),
	(13, '雷迪亚兹', '雷迪亚兹', '20180111', '40BD001563085FC35165329EA1FF5C5ECBDBBEEF', '/uploadfile/342bd59b-edf4-48cf-aa27-d13e5a0b70df.jpeg', 0, 0, 1499750592, 1, 1614332413),
	(14, '孙悟空', '齐天大圣', '20180112', '40BD001563085FC35165329EA1FF5C5ECBDBBEEF', '/uploadfile/342bd59b-edf4-48cf-aa27-d13e5a0b70df.jpeg', 0, 0, 1499750592, 1, 1614332419),
	(15, '猪八戒', '天蓬元帅', '20180113', '40BD001563085FC35165329EA1FF5C5ECBDBBEEF', '/uploadfile/342bd59b-edf4-48cf-aa27-d13e5a0b70df.jpeg', 0, 0, 1501310757, 1, 1614332406),
	(16, '沙悟净', '卷帘大将', '20180114', '40BD001563085FC35165329EA1FF5C5ECBDBBEEF', '/uploadfile/342bd59b-edf4-48cf-aa27-d13e5a0b70df.jpeg', 0, 0, 1501310765, 1, 1614332401),
	(17, '唐三藏', '金蝉子', '20180115', '40BD001563085FC35165329EA1FF5C5ECBDBBEEF', '/uploadfile/342bd59b-edf4-48cf-aa27-d13e5a0b70df.jpeg', 0, 0, 1501310778, 1, 1614332392),
	(18, '杨戬', '二郎神', '20180116', '40BD001563085FC35165329EA1FF5C5ECBDBBEEF', '/uploadfile/342bd59b-edf4-48cf-aa27-d13e5a0b70df.jpeg', 0, 0, 1501310789, 1, 1614332384),
	(19, '李靖', '托塔天王', '20180117', '40BD001563085FC35165329EA1FF5C5ECBDBBEEF', '/uploadfile/342bd59b-edf4-48cf-aa27-d13e5a0b70df.jpeg', 0, 0, 1509869141, 1, 1614332374),
	(23, 'Tom', '汤姆', '2021022599', '40BD001563085FC35165329EA1FF5C5ECBDBBEEF', NULL, 1, 0, 1614244230, NULL, NULL),
	(27, 'LiNa', '李娜', '2021022669', '40BD001563085FC35165329EA1FF5C5ECBDBBEEF', NULL, 1, 0, 1614316211, NULL, NULL);
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;

-- 导出  表 workflow.sys_user_dept 结构
CREATE TABLE IF NOT EXISTS `sys_user_dept` (
  `Id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `DeptId` bigint NOT NULL COMMENT '部门ID',
  `UserId` bigint NOT NULL COMMENT '用户ID',
  `CreateTime` bigint NOT NULL COMMENT '创建时间戳',
  PRIMARY KEY (`Id`) USING BTREE,
  KEY `DeptId` (`DeptId`) USING BTREE,
  KEY `UserId` (`UserId`) USING BTREE,
  CONSTRAINT `sys_user_dept_ibfk_1` FOREIGN KEY (`DeptId`) REFERENCES `sys_dept` (`DeptId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `sys_user_dept_ibfk_2` FOREIGN KEY (`UserId`) REFERENCES `sys_user` (`UserId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- 正在导出表  workflow.sys_user_dept 的数据：~4 rows (大约)
/*!40000 ALTER TABLE `sys_user_dept` DISABLE KEYS */;
INSERT INTO `sys_user_dept` (`Id`, `DeptId`, `UserId`, `CreateTime`) VALUES
	(4, 4, 6, 1557303745),
	(5, 3, 1, 1559469199),
	(6, 3, 4, 1559792769),
	(7, 3, 7, 1576693494),
	(9, 2, 27, 1614324454);
/*!40000 ALTER TABLE `sys_user_dept` ENABLE KEYS */;

-- 导出  表 workflow.sys_user_role 结构
CREATE TABLE IF NOT EXISTS `sys_user_role` (
  `Id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `UserId` bigint NOT NULL COMMENT '用户ID',
  `RoleId` bigint NOT NULL COMMENT '角色ID',
  `CreateTime` bigint NOT NULL COMMENT '创建时间戳',
  PRIMARY KEY (`Id`) USING BTREE,
  KEY `UserId` (`UserId`) USING BTREE,
  KEY `RoleId` (`RoleId`) USING BTREE,
  CONSTRAINT `sys_user_role_ibfk_1` FOREIGN KEY (`UserId`) REFERENCES `sys_user` (`UserId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `sys_user_role_ibfk_2` FOREIGN KEY (`RoleId`) REFERENCES `sys_role` (`RoleId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户角色关联表';

-- 正在导出表  workflow.sys_user_role 的数据：~15 rows (大约)
/*!40000 ALTER TABLE `sys_user_role` DISABLE KEYS */;
INSERT INTO `sys_user_role` (`Id`, `UserId`, `RoleId`, `CreateTime`) VALUES
	(48, 1, 5, 1547040313),
	(51, 4, 1, 1557214422),
	(52, 4, 5, 1557214422),
	(59, 7, 5, 1557909952),
	(60, 7, 6, 1557909952),
	(61, 4, 6, 1559053056),
	(62, 5, 1, 1559702623),
	(63, 5, 5, 1559702623),
	(64, 5, 6, 1559702623),
	(65, 1, 1, 1602149987),
	(66, 1, 8, 1602164436),
	(71, 27, 5, 1614317750),
	(77, 6, 1, 1615290586),
	(78, 6, 8, 1615290586),
	(79, 6, 5, 1615290586),
	(80, 6, 6, 1615290586);
/*!40000 ALTER TABLE `sys_user_role` ENABLE KEYS */;

-- 导出  表 workflow.sys_workflowsql 结构
CREATE TABLE IF NOT EXISTS `sys_workflowsql` (
  `Name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '流程sql名称,必须是以sys_为开头，用于判断属于哪个系统，方便调用接口',
  `FlowSQL` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '流程SQL，执行结果必须是一行一列',
  `Param` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '参数名。以英文 , 分割',
  `SQLType` tinyint NOT NULL DEFAULT '0' COMMENT '类型，0：选人节点，必须返回的是用户ID，1：连线条件，条件通过返回的是一行一列的数据，不通过没有任何返回结果',
  `Status` int NOT NULL DEFAULT '1' COMMENT '状态',
  `Remark` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  `CreateTime` bigint NOT NULL COMMENT '创建时间',
  `CreateUserId` bigint NOT NULL COMMENT '创建人ID',
  PRIMARY KEY (`Name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用于工作流获取权限系统数据';

-- 正在导出表  workflow.sys_workflowsql 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `sys_workflowsql` DISABLE KEYS */;
INSERT INTO `sys_workflowsql` (`Name`, `FlowSQL`, `Param`, `SQLType`, `Status`, `Remark`, `CreateTime`, `CreateUserId`) VALUES
	('sys_getdeptleader', 'SELECT DISTINCT dl.`UserId` FROM sys_user u \r\nLEFT JOIN sys_user_dept ud ON ud.`UserId`=u.`UserId`\r\nLEFT JOIN sys_dept_leader dl ON dl.`DeptId`=ud.`DeptId`\r\nWHERE u.`UserId`=@userid', 'userid', 0, 1, '权限系统，获取部门负责人', 1, 1);
/*!40000 ALTER TABLE `sys_workflowsql` ENABLE KEYS */;

-- 导出  表 workflow.wf_workflow 结构
CREATE TABLE IF NOT EXISTS `wf_workflow` (
  `FlowId` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `FlowCode` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '编码',
  `CategoryId` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类ID',
  `FormId` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '表单ID',
  `FlowName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '流程名称',
  `FlowContent` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '流程JSON',
  `FlowVersion` int NOT NULL DEFAULT '1' COMMENT '流程版本',
  `Memo` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  `IsOld` int NOT NULL DEFAULT '0' COMMENT '是否是旧版本',
  `Enable` int NOT NULL DEFAULT '1' COMMENT '是否启用',
  `CreateUserId` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `CreateTime` bigint NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`FlowId`) USING BTREE,
  KEY `CategoryId` (`CategoryId`) USING BTREE,
  KEY `FormId` (`FormId`) USING BTREE,
  CONSTRAINT `wf_workflow_ibfk_1` FOREIGN KEY (`FormId`) REFERENCES `wf_workflow_form` (`FormId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `wf_workflow_ibfk_2` FOREIGN KEY (`CategoryId`) REFERENCES `wf_workflow_category` (`Id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='工作流表';

-- 正在导出表  workflow.wf_workflow 的数据：~9 rows (大约)
/*!40000 ALTER TABLE `wf_workflow` DISABLE KEYS */;
INSERT INTO `wf_workflow` (`FlowId`, `FlowCode`, `CategoryId`, `FormId`, `FlowName`, `FlowContent`, `FlowVersion`, `Memo`, `IsOld`, `Enable`, `CreateUserId`, `CreateTime`) VALUES
	('011980a7-0ba3-4752-964e-12d88ca5c54c', '15580575818487', '9e9fc7e7-8792-40f2-97bc-8b42e583126d', '3b1ceb38-e1ee-4f15-a709-d6dd3a399c77', '员工借款', '{"title":"员工借款","nodes":[{"name":"开始","left":238,"top":29,"type":"start round mix","id":"f9104625-252a-49c8-91d4-9401509fceb5","width":26,"height":26,"alt":true,"setInfo":{}},{"name":"部门经理","left":390,"top":93,"type":"task","id":"f5cef31d-cb13-4195-86f3-7e2c96f345ee","width":104,"height":26,"alt":true,"setInfo":{"NodeDesignate":"SQL","Nodedesignatedata":{"users":[],"roles":[],"orgs":[],"sql":"sys_getdeptleader"}}},{"name":"财务总监","left":423,"top":213,"type":"task","id":"d8842622-f5e8-4336-b9cd-4383e5bcec3d","width":104,"height":26,"alt":true,"setInfo":{"NodeDesignate":"SPECIAL_USER","Nodedesignatedata":{"users":["5"],"roles":[],"orgs":[]}}},{"name":"结束","left":694,"top":273,"type":"end round","id":"38ebf6f4-5a82-4fb6-9342-94c0f95f6820","width":26,"height":26,"alt":true,"setInfo":{}}],"lines":[{"type":"tb","M":110,"from":"f9104625-252a-49c8-91d4-9401509fceb5","to":"f5cef31d-cb13-4195-86f3-7e2c96f345ee","id":"b279111d-eb6a-4d8a-86b6-135de84a732a","name":"","dash":false},{"type":"tb","M":225.5,"from":"f5cef31d-cb13-4195-86f3-7e2c96f345ee","to":"d8842622-f5e8-4336-b9cd-4383e5bcec3d","id":"596c6d67-715e-4332-809b-7a4b8ba7fa50","name":"","dash":false},{"type":"tb","M":256,"from":"d8842622-f5e8-4336-b9cd-4383e5bcec3d","to":"38ebf6f4-5a82-4fb6-9342-94c0f95f6820","id":"f3ddca8b-135b-43f6-b0bc-e42060a233af","name":"","dash":false,"alt":true}],"areas":[],"initNum":8}', 1, '测试流程', 0, 1, '1', 1558057581),
	('2b1b17c4-69ca-474b-977a-e8b1f1382e89', '15601364386520', '9e9fc7e7-8792-40f2-97bc-8b42e583126d', 'fd4a4efc-7df2-49c4-9ffc-f84db346cac7', '通知测试', '{"title":"通知测试","nodes":[{"name":"开始","left":265,"top":81,"type":"start round mix","id":"1474e4c4-d512-49aa-8681-8720b4168554","width":26,"height":26,"alt":true,"setInfo":{}},{"name":"部门负责人","left":473,"top":84,"type":"task","id":"e0080e39-b227-45c1-81d1-ca18213d80d6","width":104,"height":26,"alt":true,"setInfo":{"NodeDesignate":"SQL","Nodedesignatedata":{"users":[],"roles":[],"orgs":[],"sql":"sys_getdeptleader"}}},{"name":"wms","left":480,"top":247,"type":"view","id":"1f702b3c-b514-47f3-a761-9190e4a8e965","width":104,"height":26,"alt":true,"setInfo":{"NodeDesignate":"CREATEUSER","Nodedesignatedata":{"users":[],"roles":[],"orgs":[],"sql":""}}},{"name":"结束","left":837,"top":84,"type":"end round","id":"06941d43-5d7a-4a4f-a096-1235d493a24c","width":26,"height":26,"alt":true,"setInfo":{}}],"lines":[{"type":"sl","from":"1474e4c4-d512-49aa-8681-8720b4168554","to":"e0080e39-b227-45c1-81d1-ca18213d80d6","id":"18365384-6f16-41dc-aeb6-ce384cc11d94","name":"","dash":false},{"type":"sl","from":"e0080e39-b227-45c1-81d1-ca18213d80d6","to":"1f702b3c-b514-47f3-a761-9190e4a8e965","id":"a543a2e5-9045-4742-b974-477acdd37ffe","name":"","dash":false},{"type":"sl","from":"e0080e39-b227-45c1-81d1-ca18213d80d6","to":"06941d43-5d7a-4a4f-a096-1235d493a24c","id":"148f4d46-2ee7-405d-a2e3-270a5b6d2539","name":"","dash":false}],"areas":[],"initNum":8}', 1, '通知测试', 1, 0, '1', 1560136438),
	('477e4199-aaf0-4e21-9eed-088922a83d58', '15563796431067', '9e9fc7e7-8792-40f2-97bc-8b42e583126d', '041f7de8-dd83-4aec-a253-e181b77cc40e', '员工请假', '{"title":"员工请假","nodes":[{"name":"开始","left":67,"top":44,"type":"start round mix","id":"77825e68-4a61-43b8-9081-504088b332e6","width":26,"height":26,"alt":true,"setInfo":{}},{"name":"王五","left":438,"top":49,"type":"task","id":"5fb04da8-7113-4f80-9c91-be19db2c1a9c","width":104,"height":26,"alt":true,"setInfo":{"NodeDesignate":"SPECIAL_USER","Nodedesignatedata":{"users":["4"],"roles":[],"orgs":[],"sql":""}},"areaId":"77046665-290a-4ae1-a5cf-a69e11d41f7f"},{"name":"结束","left":809,"top":238,"type":"end round","id":"6dae3d55-04fc-4112-824f-e87542a03779","width":26,"height":26,"alt":true,"setInfo":{},"areaId":"77046665-290a-4ae1-a5cf-a69e11d41f7f"},{"name":"张三","left":778,"top":52,"type":"task","id":"634b9765-ac0e-4272-bfab-f5b260c7fde8","width":104,"height":26,"alt":true,"setInfo":{"NodeDesignate":"SPECIAL_USER","Nodedesignatedata":{"users":["5"],"roles":[],"orgs":[],"sql":""}},"areaId":"77046665-290a-4ae1-a5cf-a69e11d41f7f"},{"name":"部门负责人","left":178,"top":49,"type":"task","id":"33e53484-5b48-4210-a62c-949dd7d6dbaa","width":104,"height":26,"alt":true,"setInfo":{"NodeDesignate":"SQL","Nodedesignatedata":{"users":[],"roles":[],"orgs":[],"sql":"sys_getdeptleader"}}}],"lines":[{"type":"sl","from":"634b9765-ac0e-4272-bfab-f5b260c7fde8","to":"6dae3d55-04fc-4112-824f-e87542a03779","id":"c764f55f-125b-48e6-8f37-8f281788d960","name":"","dash":false},{"type":"sl","from":"77825e68-4a61-43b8-9081-504088b332e6","to":"33e53484-5b48-4210-a62c-949dd7d6dbaa","id":"c587ca2a-c95f-491a-b55a-a27c67df3037","name":"","dash":false},{"type":"sl","from":"33e53484-5b48-4210-a62c-949dd7d6dbaa","to":"5fb04da8-7113-4f80-9c91-be19db2c1a9c","id":"5923dd84-6010-4003-bf4c-d4ee8605e945","setInfo":{"CustomSQL":"oa_leaveMoreThenThreeDays"},"name":">3天","dash":false},{"type":"sl","from":"5fb04da8-7113-4f80-9c91-be19db2c1a9c","to":"634b9765-ac0e-4272-bfab-f5b260c7fde8","id":"0ebead88-6942-4563-aa5f-8dbd4c453fe5","name":"","dash":false},{"type":"tb","M":210.5,"from":"33e53484-5b48-4210-a62c-949dd7d6dbaa","to":"6dae3d55-04fc-4112-824f-e87542a03779","id":"ba6765a0-f21e-436a-a094-73a2b03183b1","setInfo":{"CustomSQL":"oa_leaveLessThenThreeDays"},"name":"<=3天","dash":false}],"areas":[],"initNum":22}', 1, '测试流程', 0, 1, '1', 1556379643),
	('4e6bbeab-3d2b-4b36-b733-c2255897b201', '16148621181360', '209e00ce-78a8-47b5-8b31-dad3b3649053', '3527cc21-d7b0-436a-97c9-dafe76223623', 'Rex测试', '{"title":"Rex测试","nodes":[{"name":"开始","left":119,"top":92,"type":"start round mix","id":"ca11e42e-3d98-4f70-9188-22df6f64ecf6","width":26,"height":26,"alt":true},{"name":"李四","left":321,"top":104,"type":"task","id":"43873a8d-ce59-415e-a012-1769ae2baef8","width":104,"height":26,"alt":true,"setInfo":{"NodeDesignate":"SPECIAL_USER","Nodedesignatedata":{"users":["6"],"roles":[],"orgs":[],"sql":""}}},{"name":"结束","left":606,"top":115,"type":"end round","id":"9692d513-d9ad-48af-92e3-af01abf14ba9","width":26,"height":26,"alt":true}],"lines":[{"type":"sl","from":"ca11e42e-3d98-4f70-9188-22df6f64ecf6","to":"43873a8d-ce59-415e-a012-1769ae2baef8","id":"7ce6cfb0-f315-4cd3-84b3-03c2f8c98c71","name":"","dash":false,"alt":true},{"type":"sl","from":"43873a8d-ce59-415e-a012-1769ae2baef8","to":"9692d513-d9ad-48af-92e3-af01abf14ba9","id":"1b8860c8-edf0-4952-a2b0-9342a7f98e7f","name":"","dash":false,"alt":true}],"areas":[],"initNum":6}', 0, NULL, 0, 1, '1', 1614862124),
	('524d2280-033c-4bdd-aef8-6924950b5468', '15594687698457', '9e9fc7e7-8792-40f2-97bc-8b42e583126d', '4dfacbf1-40bd-4fe0-b4fa-249713f28659', '新版测试-NEW', '{"title":"新版测试","nodes":[{"name":"开始","left":282,"top":116,"type":"start round mix","id":"5231704b-8c9f-4155-9e9d-7cdcdc9c57fe","width":26,"height":26,"alt":true,"setInfo":{}},{"name":"结束","left":955,"top":245,"type":"end round","id":"75e7fb37-1d3d-4be6-9e65-aa6ffc78bccf","width":26,"height":26,"alt":true,"setInfo":{}},{"name":"部门负责人","left":514,"top":169,"type":"task","id":"d96914cd-d85e-47b4-acdf-1b1fbecd78fc","width":104,"height":26,"alt":true,"setInfo":{"NodeDesignate":"SQL","Nodedesignatedata":{"users":[],"roles":[],"orgs":[],"sql":"sys_getdeptleader"}}}],"lines":[{"type":"sl","from":"5231704b-8c9f-4155-9e9d-7cdcdc9c57fe","to":"d96914cd-d85e-47b4-acdf-1b1fbecd78fc","id":"95aa2ed5-aaf8-410d-a858-c864ca843dfa","name":"","dash":false},{"type":"sl","from":"d96914cd-d85e-47b4-acdf-1b1fbecd78fc","to":"75e7fb37-1d3d-4be6-9e65-aa6ffc78bccf","id":"bb1567d9-0d70-44e8-a093-a0352fccc700","name":"","dash":false}],"areas":[],"initNum":6}', 2, '新版测试', 1, 0, '1', 1585627236),
	('53d07888-4e36-4e8a-b52c-33230779eded', '16022537792766', '7beb1461-a74a-4efc-8f3b-981b5e9595f3', '7fa77006-cb0c-40f0-afbe-c545127d9c41', 'tony自定义流程设计', '{"title":"tony自定义流程设计","nodes":[{"name":"开始","left":167,"top":126,"type":"start round mix","id":"4f5095e1-3188-4831-a96e-ba28649feb34","width":26,"height":26,"alt":true},{"name":"tony1","left":338,"top":135,"type":"task","id":"95d69a3f-928b-4ba5-98f5-d91d9fc570c6","width":104,"height":26,"alt":true,"setInfo":{"NodeDesignate":"SPECIAL_USER","Nodedesignatedata":{"users":["4"],"roles":[],"orgs":[],"sql":""}}},{"name":"tony2","left":621,"top":140,"type":"task","id":"aad684a0-9ee7-4603-ac46-1b32c89b9a2d","width":104,"height":26,"alt":true,"setInfo":{"NodeDesignate":"SPECIAL_USER","Nodedesignatedata":{"users":["5"],"roles":[],"orgs":[],"sql":""}}},{"name":"结束","left":872,"top":139,"type":"end round","id":"114bc01c-f00d-4043-8127-522197f955f9","width":26,"height":26,"alt":true}],"lines":[{"type":"sl","from":"95d69a3f-928b-4ba5-98f5-d91d9fc570c6","to":"aad684a0-9ee7-4603-ac46-1b32c89b9a2d","id":"ab998103-2115-40b8-b0f1-e4aeb3088f91","setInfo":{"CustomSQL":""},"name":"tony2","dash":false},{"type":"sl","from":"4f5095e1-3188-4831-a96e-ba28649feb34","to":"95d69a3f-928b-4ba5-98f5-d91d9fc570c6","id":"c4c3d2ec-5231-4c0c-a5af-40504606b1d1","setInfo":{"CustomSQL":""},"name":"tony1","dash":false},{"type":"sl","from":"aad684a0-9ee7-4603-ac46-1b32c89b9a2d","to":"114bc01c-f00d-4043-8127-522197f955f9","id":"513e9b0a-35b6-4bbf-8eb1-6ae5391ba71f","setInfo":{"CustomSQL":""},"name":"tony3","dash":false}],"areas":[],"initNum":16}', 0, 'wwwwwwwwwwwwwwww', 0, 1, '1', 1602253779),
	('7850ca8f-ae1f-4878-9023-b4ee44c3791b', '16147805642634', '4d40bb92-d22a-4d65-a9b3-45f794d090a1', '7f6801e3-4eed-4ceb-a85f-0c9bb964b8fb', 'BBC', '{"title":"BBC","nodes":[{"name":"开始","left":258,"top":158,"type":"start round mix","id":"8f923fb4-9ed0-4cee-9e66-602e668d1055","width":26,"height":26,"alt":true},{"name":"李四","left":455,"top":178,"type":"task","id":"aa14c750-cd0f-4bd8-b89e-44a8ccfa5f17","width":104,"height":26,"alt":true,"setInfo":{"NodeDesignate":"SPECIAL_USER","Nodedesignatedata":{"users":["6"],"roles":[],"orgs":[],"sql":""}}},{"name":"结束","left":696,"top":192,"type":"end round","id":"99a200c7-3ad8-45ab-af0f-59d320c6bc3c","width":26,"height":26,"alt":true}],"lines":[{"type":"sl","from":"8f923fb4-9ed0-4cee-9e66-602e668d1055","to":"aa14c750-cd0f-4bd8-b89e-44a8ccfa5f17","id":"ba40c10e-d72a-4ee3-bfc0-928c1a995b96","name":"","dash":false},{"type":"sl","from":"aa14c750-cd0f-4bd8-b89e-44a8ccfa5f17","to":"99a200c7-3ad8-45ab-af0f-59d320c6bc3c","id":"e42af179-5e15-4573-a4d4-c351e03ad011","name":"","dash":false}],"areas":[],"initNum":5}', 0, 'BBC', 1, 0, '1', 1614780568),
	('9f9ece09-d9e8-4dba-8ab2-f245abb9ec8a', '15601364386520', '9e9fc7e7-8792-40f2-97bc-8b42e583126d', 'fd4a4efc-7df2-49c4-9ffc-f84db346cac7', '通知测试-NEW', '{"title":"通知测试","nodes":[{"name":"开始","left":265,"top":81,"type":"start round mix","id":"1474e4c4-d512-49aa-8681-8720b4168554","width":26,"height":26,"alt":true,"setInfo":{}},{"name":"部门负责人","left":473,"top":84,"type":"task","id":"e0080e39-b227-45c1-81d1-ca18213d80d6","width":104,"height":26,"alt":true,"setInfo":{"NodeDesignate":"SQL","Nodedesignatedata":{"users":[],"roles":[],"orgs":[],"sql":"sys_getdeptleader"}}},{"name":"wms","left":480,"top":247,"type":"view","id":"1f702b3c-b514-47f3-a761-9190e4a8e965","width":104,"height":26,"alt":true,"setInfo":{"NodeDesignate":"CREATEUSER","Nodedesignatedata":{"users":[],"roles":[],"orgs":[],"sql":""}}},{"name":"结束","left":837,"top":84,"type":"end round","id":"06941d43-5d7a-4a4f-a096-1235d493a24c","width":26,"height":26,"alt":true,"setInfo":{}}],"lines":[{"type":"sl","from":"1474e4c4-d512-49aa-8681-8720b4168554","to":"e0080e39-b227-45c1-81d1-ca18213d80d6","id":"18365384-6f16-41dc-aeb6-ce384cc11d94","name":"","dash":false},{"type":"sl","from":"e0080e39-b227-45c1-81d1-ca18213d80d6","to":"1f702b3c-b514-47f3-a761-9190e4a8e965","id":"a543a2e5-9045-4742-b974-477acdd37ffe","name":"","dash":false},{"type":"sl","from":"e0080e39-b227-45c1-81d1-ca18213d80d6","to":"06941d43-5d7a-4a4f-a096-1235d493a24c","id":"148f4d46-2ee7-405d-a2e3-270a5b6d2539","name":"","dash":false}],"areas":[],"initNum":8}', 2, '通知测试', 0, 1, '1', 1585629901),
	('a9dd987c-f25f-4297-94be-465c5044b076', '15594687698457', '9e9fc7e7-8792-40f2-97bc-8b42e583126d', '4dfacbf1-40bd-4fe0-b4fa-249713f28659', '新版测试', '{"title":"新版测试","nodes":[{"name":"开始","left":282,"top":116,"type":"start round mix","id":"5231704b-8c9f-4155-9e9d-7cdcdc9c57fe","width":26,"height":26,"alt":true,"setInfo":{}},{"name":"结束","left":955,"top":245,"type":"end round","id":"75e7fb37-1d3d-4be6-9e65-aa6ffc78bccf","width":26,"height":26,"alt":true,"setInfo":{}},{"name":"部门负责人","left":514,"top":169,"type":"task","id":"d96914cd-d85e-47b4-acdf-1b1fbecd78fc","width":104,"height":26,"alt":true,"setInfo":{"NodeDesignate":"SQL","Nodedesignatedata":{"users":[],"roles":[],"orgs":[],"sql":"sys_getdeptleader"}}}],"lines":[{"type":"sl","from":"5231704b-8c9f-4155-9e9d-7cdcdc9c57fe","to":"d96914cd-d85e-47b4-acdf-1b1fbecd78fc","id":"95aa2ed5-aaf8-410d-a858-c864ca843dfa","name":"","dash":false},{"type":"sl","from":"d96914cd-d85e-47b4-acdf-1b1fbecd78fc","to":"75e7fb37-1d3d-4be6-9e65-aa6ffc78bccf","id":"bb1567d9-0d70-44e8-a093-a0352fccc700","name":"","dash":false}],"areas":[],"initNum":6}', 1, '新版测试', 1, 0, '1', 1559468769),
	('cc20705f-e972-466f-8cf4-0c1aae6f2d5f', '16147805642634', '4d40bb92-d22a-4d65-a9b3-45f794d090a1', '7f6801e3-4eed-4ceb-a85f-0c9bb964b8fb', 'BBC-NEW', '{"title":"BBC","nodes":[{"name":"开始","left":258,"top":158,"type":"start round mix","id":"8f923fb4-9ed0-4cee-9e66-602e668d1055","width":26,"height":26,"alt":true},{"name":"李四","left":455,"top":178,"type":"task","id":"aa14c750-cd0f-4bd8-b89e-44a8ccfa5f17","width":104,"height":26,"alt":true,"setInfo":{"NodeDesignate":"SPECIAL_USER","Nodedesignatedata":{"users":["6"],"roles":[],"orgs":[],"sql":""}}},{"name":"结束","left":696,"top":192,"type":"end round","id":"99a200c7-3ad8-45ab-af0f-59d320c6bc3c","width":26,"height":26,"alt":true}],"lines":[{"type":"sl","from":"8f923fb4-9ed0-4cee-9e66-602e668d1055","to":"aa14c750-cd0f-4bd8-b89e-44a8ccfa5f17","id":"ba40c10e-d72a-4ee3-bfc0-928c1a995b96","name":"","dash":false},{"type":"sl","from":"aa14c750-cd0f-4bd8-b89e-44a8ccfa5f17","to":"99a200c7-3ad8-45ab-af0f-59d320c6bc3c","id":"e42af179-5e15-4573-a4d4-c351e03ad011","name":"","dash":false}],"areas":[],"initNum":5}', 1, 'BBC', 0, 0, '1', 1614826398),
	('ce907471-26ce-4ae4-919c-6a6cbe1fa114', '15594687698457', '9e9fc7e7-8792-40f2-97bc-8b42e583126d', '4dfacbf1-40bd-4fe0-b4fa-249713f28659', '新版测试-NEW-NEW', '{"title":"新版测试","nodes":[{"name":"开始","left":282,"top":116,"type":"start round mix","id":"5231704b-8c9f-4155-9e9d-7cdcdc9c57fe","width":26,"height":26,"alt":true,"setInfo":{}},{"name":"结束","left":955,"top":245,"type":"end round","id":"75e7fb37-1d3d-4be6-9e65-aa6ffc78bccf","width":26,"height":26,"alt":true,"setInfo":{}},{"name":"部门负责人","left":514,"top":169,"type":"task","id":"d96914cd-d85e-47b4-acdf-1b1fbecd78fc","width":104,"height":26,"alt":true,"setInfo":{"NodeDesignate":"SQL","Nodedesignatedata":{"users":[],"roles":[],"orgs":[],"sql":"sys_getdeptleader"}}}],"lines":[{"type":"sl","from":"5231704b-8c9f-4155-9e9d-7cdcdc9c57fe","to":"d96914cd-d85e-47b4-acdf-1b1fbecd78fc","id":"95aa2ed5-aaf8-410d-a858-c864ca843dfa","name":"","dash":false},{"type":"sl","from":"d96914cd-d85e-47b4-acdf-1b1fbecd78fc","to":"75e7fb37-1d3d-4be6-9e65-aa6ffc78bccf","id":"bb1567d9-0d70-44e8-a093-a0352fccc700","name":"","dash":false}],"areas":[],"initNum":6}', 3, '新版测试', 0, 0, '1', 1585627516);
/*!40000 ALTER TABLE `wf_workflow` ENABLE KEYS */;

-- 导出  表 workflow.wf_workflowsql 结构
CREATE TABLE IF NOT EXISTS `wf_workflowsql` (
  `Name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '流程sql名称,必须是以wf_为开头，用于判断属于哪个系统，方便调用接口',
  `FlowSQL` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '流程SQL，执行结果必须是一行一列',
  `Param` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '参数名。以英文 , 分割',
  `SQLType` tinyint NOT NULL DEFAULT '0' COMMENT '类型，0：选人节点，必须返回的是用户ID，1：连线条件，条件通过返回的是一行一列的数据，不通过没有任何返回结果',
  `Status` int NOT NULL DEFAULT '1' COMMENT '状态',
  `Remark` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  `CreateTime` bigint NOT NULL COMMENT '创建时间',
  `CreateUserId` bigint NOT NULL COMMENT '创建人ID',
  PRIMARY KEY (`Name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用于工作流获取权限系统数据';

-- 正在导出表  workflow.wf_workflowsql 的数据：~2 rows (大约)
/*!40000 ALTER TABLE `wf_workflowsql` DISABLE KEYS */;
INSERT INTO `wf_workflowsql` (`Name`, `FlowSQL`, `Param`, `SQLType`, `Status`, `Remark`, `CreateTime`, `CreateUserId`) VALUES
	('wf_agree', 'SELECT 1 ', NULL, 0, 1, '同意、通过', 1, 1),
	('wf_deprecate', 'SELECT 0 ', NULL, 0, 1, '不同意、不通过', 1, 1);
/*!40000 ALTER TABLE `wf_workflowsql` ENABLE KEYS */;

-- 导出  表 workflow.wf_workflow_assign 结构
CREATE TABLE IF NOT EXISTS `wf_workflow_assign` (
  `Id` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `FlowId` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '流程id',
  `InstanceId` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '实例id',
  `NodeId` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '节点id',
  `NodeName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '节点名',
  `UserId` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '请求人id',
  `UserName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '请求人姓名',
  `AssignUserId` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '委托人id',
  `AssignUserName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '委托人姓名',
  `Content` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '委托信息',
  `CreateTime` bigint NOT NULL COMMENT '创建时间',
  `CreateUserId` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  PRIMARY KEY (`Id`) USING BTREE,
  KEY `FlowId` (`FlowId`) USING BTREE,
  KEY `InstanceId` (`InstanceId`) USING BTREE,
  CONSTRAINT `wf_workflow_assign_ibfk_1` FOREIGN KEY (`FlowId`) REFERENCES `wf_workflow` (`FlowId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `wf_workflow_assign_ibfk_2` FOREIGN KEY (`InstanceId`) REFERENCES `wf_workflow_instance` (`InstanceId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='流程委托表';

-- 正在导出表  workflow.wf_workflow_assign 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `wf_workflow_assign` DISABLE KEYS */;
/*!40000 ALTER TABLE `wf_workflow_assign` ENABLE KEYS */;

-- 导出  表 workflow.wf_workflow_category 结构
CREATE TABLE IF NOT EXISTS `wf_workflow_category` (
  `Id` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `Name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类名称',
  `ParentId` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '父级ID',
  `Memo` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  `Status` int DEFAULT '1' COMMENT '状态',
  `CreateTime` bigint NOT NULL COMMENT '创建时间',
  `CreateUserId` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='流程分类';

-- 正在导出表  workflow.wf_workflow_category 的数据：~4 rows (大约)
/*!40000 ALTER TABLE `wf_workflow_category` DISABLE KEYS */;
INSERT INTO `wf_workflow_category` (`Id`, `Name`, `ParentId`, `Memo`, `Status`, `CreateTime`, `CreateUserId`) VALUES
	('209e00ce-78a8-47b5-8b31-dad3b3649053', 'Rex', '00000000-0000-0000-0000-000000000000', '', 1, 1614861967, '1'),
	('2534a52b-3e87-4c2a-98ae-41a4f63b640c', 'tony借款流程', '00000000-0000-0000-0000-000000000000', 'tony借款流程', 1, 1602336210, '1'),
	('4d40bb92-d22a-4d65-a9b3-45f794d090a1', 'BBC', '00000000-0000-0000-0000-000000000000', 'BBC', 1, 1614779921, '1'),
	('7beb1461-a74a-4efc-8f3b-981b5e9595f3', 'tony自定义分类', '00000000-0000-0000-0000-000000000000', 'tony自定义分类', 1, 1602252421, '1'),
	('9e9fc7e7-8792-40f2-97bc-8b42e583126d', '通用流程', '00000000-0000-0000-0000-000000000000', '通用流程', 1, 1556072828, '1');
/*!40000 ALTER TABLE `wf_workflow_category` ENABLE KEYS */;

-- 导出  表 workflow.wf_workflow_form 结构
CREATE TABLE IF NOT EXISTS `wf_workflow_form` (
  `FormId` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '表单ID',
  `FormName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '表单名称',
  `FormType` int DEFAULT NULL COMMENT '表单类型',
  `Content` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '表单内容',
  `OriginalContent` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '原始表单内容',
  `FormUrl` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '表单地址',
  `CreateTime` bigint NOT NULL COMMENT '创建时间',
  `CreateUserId` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  PRIMARY KEY (`FormId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='流程表单';

-- 正在导出表  workflow.wf_workflow_form 的数据：~13 rows (大约)
/*!40000 ALTER TABLE `wf_workflow_form` DISABLE KEYS */;
INSERT INTO `wf_workflow_form` (`FormId`, `FormName`, `FormType`, `Content`, `OriginalContent`, `FormUrl`, `CreateTime`, `CreateUserId`) VALUES
	('041f7de8-dd83-4aec-a253-e181b77cc40e', '请假', 1, NULL, NULL, '/OA/Leave/Show', 1556075724, '1'),
	('1163c858-5c05-4301-8615-bb0b0b78a4a1', '123', 0, '<p>123</p>', '<p>123</p>', NULL, 1614692480, '1'),
	('18edc048-afc8-4aad-a4f8-a4c69b050f7d', '1236600', 0, '<p>236600</p>', '<p>236600</p>', NULL, 1614693480, '1'),
	('217bdbd0-f6dc-4146-942e-1a00177ede96', 'tony表单', 0, '<table class="table table-bordered"><tbody><tr><td><br></td><td><br></td><td><br></td><td><br></td></tr><tr><td><br></td><td><br></td><td><br></td><td><br></td></tr><tr><td><br></td><td><br></td><td><br></td><td><br></td></tr></tbody></table>\n                                    \n                                ', '<table class="table table-bordered"><tbody><tr><td><br></td><td><br></td><td><br></td><td><br></td></tr><tr><td><br></td><td><br></td><td><br></td><td><br></td></tr><tr><td><br></td><td><br></td><td><br></td><td><br></td></tr></tbody></table>\n                                    \n                                ', NULL, 1601905283, '1'),
	('292ac465-ec91-4a2a-9d9e-c6f1dfaf61e4', '项目审核', 1, NULL, NULL, '/333/33', 1600854047, '1'),
	('3527cc21-d7b0-436a-97c9-dafe76223623', 'Rex', 0, '<table style="border-collapse: collapse; width: 100%;" border="1">\n<tbody>\n<tr>\n<td style="width: 33.3333%;">姓名</td>\n<td style="width: 33.3333%;">性别</td>\n<td style="width: 33.3333%;">年龄</td>\n</tr>\n<tr>\n<td style="width: 33.3333%;">Rex</td>\n<td style="width: 33.3333%;">男</td>\n<td style="width: 33.3333%;">18</td>\n</tr>\n</tbody>\n</table>', '<table style="border-collapse: collapse; width: 100%;" border="1">\n<tbody>\n<tr>\n<td style="width: 33.3333%;">姓名</td>\n<td style="width: 33.3333%;">性别</td>\n<td style="width: 33.3333%;">年龄</td>\n</tr>\n<tr>\n<td style="width: 33.3333%;">Rex</td>\n<td style="width: 33.3333%;">男</td>\n<td style="width: 33.3333%;">18</td>\n</tr>\n</tbody>\n</table>', NULL, 1614862012, '1'),
	('3b1ceb38-e1ee-4f15-a709-d6dd3a399c77', '员工借款', 0, '\n                                    \n                                    \n                                    \n                                    \n	<div class="form-group">\n		<label class="col-sm-3 control-label">标题：</label>\n		<div class="col-sm-9">\n			<input name="FlowParam_1" type="text" class="form-control required">\n		</div>\n	</div>\n	<div class="form-group">\n		<label class="col-sm-3 control-label">借款金额：</label>\n		<div class="col-sm-9">\n			  <input name="FlowParam_2" type="text" class="form-control required">\n		</div>\n	</div>\n	<div class="form-group">\n		<label class="col-sm-3 control-label">借款原因：</label>\n		<div class="col-sm-9">\n			<textarea name="FlowParam_3" class="form-control required"></textarea>\n		</div>\n	</div>\n\n                                \n                                \n                                \n                                ', '\n                                    \n                                    \n                                    \n                                    \n	<div class="form-group">\n		<label class="col-sm-3 control-label">标题：</label>\n		<div class="col-sm-9">\n			<input type="text" class="form-control required">\n		</div>\n	</div>\n	<div class="form-group">\n		<label class="col-sm-3 control-label">借款金额：</label>\n		<div class="col-sm-9">\n			  <input type="text" class="form-control required">\n		</div>\n	</div>\n	<div class="form-group">\n		<label class="col-sm-3 control-label">借款原因：</label>\n		<div class="col-sm-9">\n			<textarea class="form-control required"></textarea>\n		</div>\n	</div>\n\n                                \n                                \n                                \n                                ', NULL, 1558057039, '1'),
	('4dfacbf1-40bd-4fe0-b4fa-249713f28659', '新版测试', 0, '新版测试\n                                    \n                                ', '新版测试\n                                    \n                                ', NULL, 1559466362, '1'),
	('5968e367-25de-4ec7-9b8c-24fafa54a287', 'tony借款表单', 0, '<table class="table table-bordered"><tbody><tr><td>姓名</td><td>时间</td></tr><tr><td>tony</td><td>20202-10-10</td></tr></tbody></table>\n                                    \n                                ', '<table class="table table-bordered"><tbody><tr><td>姓名</td><td>时间</td></tr><tr><td>tony</td><td>20202-10-10</td></tr></tbody></table>\n                                    \n                                ', NULL, 1602336346, '1'),
	('7f6801e3-4eed-4ceb-a85f-0c9bb964b8fb', 'BBC', 0, '<table style="border-collapse: collapse; width: 100%;" border="1">\n<tbody>\n<tr>\n<td style="width: 33.3333%;">姓名</td>\n<td style="width: 33.3333%;">性别</td>\n<td style="width: 33.3333%;">金额</td>\n</tr>\n<tr>\n<td style="width: 33.3333%;">Rex</td>\n<td style="width: 33.3333%;">男</td>\n<td style="width: 33.3333%;">1200</td>\n</tr>\n</tbody>\n</table>', '<table style="border-collapse: collapse; width: 100%;" border="1">\n<tbody>\n<tr>\n<td style="width: 33.3333%;">姓名</td>\n<td style="width: 33.3333%;">性别</td>\n<td style="width: 33.3333%;">金额</td>\n</tr>\n<tr>\n<td style="width: 33.3333%;">Rex</td>\n<td style="width: 33.3333%;">男</td>\n<td style="width: 33.3333%;">1200</td>\n</tr>\n</tbody>\n</table>', NULL, 1614779968, '1'),
	('7fa77006-cb0c-40f0-afbe-c545127d9c41', 'tony自定义表单', 0, '\n                                    <table class="table table-bordered"><tbody><tr><td>名称</td><td>次数</td><td>结尾</td></tr><tr><td>222柔柔弱弱</td><td>3333</td><td>444</td></tr></tbody></table>\n                                    \n                                \n                                ', '\n                                    <table class="table table-bordered"><tbody><tr><td>名称</td><td>次数</td><td>结尾</td></tr><tr><td>222柔柔弱弱</td><td>3333</td><td>444</td></tr></tbody></table>\n                                    \n                                \n                                ', NULL, 1602251682, '1'),
	('97781ea5-560c-4b06-a4ec-e2f772d1f93f', '项目审核', 1, NULL, NULL, NULL, 1600854031, '1'),
	('a75ae04f-798f-4fba-b478-9812e3da82f1', '777', 0, '<p>777</p>', '<p>777</p>', NULL, 1614693386, '1'),
	('fd4a4efc-7df2-49c4-9ffc-f84db346cac7', '通知测试', 0, '通知测试\n                                    \n                                ', '通知测试\n                                    \n                                ', NULL, 1560136422, '1');
/*!40000 ALTER TABLE `wf_workflow_form` ENABLE KEYS */;

-- 导出  表 workflow.wf_workflow_instance 结构
CREATE TABLE IF NOT EXISTS `wf_workflow_instance` (
  `InstanceId` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '实例ID',
  `FlowId` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '流程ID',
  `Code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '实例编号',
  `ActivityId` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '当前节点ID',
  `ActivityType` int DEFAULT NULL COMMENT '当前节点类型',
  `ActivityName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '当前节点名称',
  `PreviousId` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '上一个节点ID',
  `MakerList` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '执行人',
  `FlowContent` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '流程JSON内容',
  `FlowVersion` int NOT NULL DEFAULT '1' COMMENT '流程版本',
  `IsFinish` int DEFAULT NULL COMMENT '流程是否结束',
  `Status` int NOT NULL DEFAULT '0' COMMENT '用户操作状态',
  `CreateTime` bigint NOT NULL COMMENT '创建时间',
  `CreateUserId` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `CreateUserName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建人姓名',
  `UpdateTime` bigint NOT NULL COMMENT '实例被修改时间',
  PRIMARY KEY (`InstanceId`) USING BTREE,
  KEY `FlowId` (`FlowId`) USING BTREE,
  CONSTRAINT `wf_workflow_instance_ibfk_1` FOREIGN KEY (`FlowId`) REFERENCES `wf_workflow` (`FlowId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='流程实例';

-- 正在导出表  workflow.wf_workflow_instance 的数据：~3 rows (大约)
/*!40000 ALTER TABLE `wf_workflow_instance` DISABLE KEYS */;
INSERT INTO `wf_workflow_instance` (`InstanceId`, `FlowId`, `Code`, `ActivityId`, `ActivityType`, `ActivityName`, `PreviousId`, `MakerList`, `FlowContent`, `FlowVersion`, `IsFinish`, `Status`, `CreateTime`, `CreateUserId`, `CreateUserName`, `UpdateTime`) VALUES
	('0cb6f912-6d6f-4341-bf76-34368c50df8e', '4e6bbeab-3d2b-4b36-b733-c2255897b201', '16152902835688', '9692d513-d9ad-48af-92e3-af01abf14ba9', 4, '结束', '43873a8d-ce59-415e-a012-1769ae2baef8', '', '{"title":"Rex测试","nodes":[{"name":"开始","left":119,"top":92,"type":"start round mix","id":"ca11e42e-3d98-4f70-9188-22df6f64ecf6","width":26,"height":26,"alt":true},{"name":"李四","left":321,"top":104,"type":"task","id":"43873a8d-ce59-415e-a012-1769ae2baef8","width":104,"height":26,"alt":true,"setInfo":{"NodeDesignate":"SPECIAL_USER","Nodedesignatedata":{"users":["6"],"roles":[],"orgs":[],"sql":""}}},{"name":"结束","left":606,"top":115,"type":"end round","id":"9692d513-d9ad-48af-92e3-af01abf14ba9","width":26,"height":26,"alt":true}],"lines":[{"type":"sl","from":"ca11e42e-3d98-4f70-9188-22df6f64ecf6","to":"43873a8d-ce59-415e-a012-1769ae2baef8","id":"7ce6cfb0-f315-4cd3-84b3-03c2f8c98c71","name":"","dash":false,"alt":true},{"type":"sl","from":"43873a8d-ce59-415e-a012-1769ae2baef8","to":"9692d513-d9ad-48af-92e3-af01abf14ba9","id":"1b8860c8-edf0-4952-a2b0-9342a7f98e7f","name":"","dash":false,"alt":true}],"areas":[],"initNum":6}', 1, 1, 1, 1615290283, '1', '雷克斯', 1615294432),
	('3a246503-54b0-4aa6-a266-136dffe7c616', '4e6bbeab-3d2b-4b36-b733-c2255897b201', '16152950100201', '43873a8d-ce59-415e-a012-1769ae2baef8', 2, '李四', 'ca11e42e-3d98-4f70-9188-22df6f64ecf6', '6,', '{"title":"Rex测试","nodes":[{"name":"开始","left":119,"top":92,"type":"start round mix","id":"ca11e42e-3d98-4f70-9188-22df6f64ecf6","width":26,"height":26,"alt":true},{"name":"李四","left":321,"top":104,"type":"task","id":"43873a8d-ce59-415e-a012-1769ae2baef8","width":104,"height":26,"alt":true,"setInfo":{"NodeDesignate":"SPECIAL_USER","Nodedesignatedata":{"users":["6"],"roles":[],"orgs":[],"sql":""}}},{"name":"结束","left":606,"top":115,"type":"end round","id":"9692d513-d9ad-48af-92e3-af01abf14ba9","width":26,"height":26,"alt":true}],"lines":[{"type":"sl","from":"ca11e42e-3d98-4f70-9188-22df6f64ecf6","to":"43873a8d-ce59-415e-a012-1769ae2baef8","id":"7ce6cfb0-f315-4cd3-84b3-03c2f8c98c71","name":"","dash":false,"alt":true},{"type":"sl","from":"43873a8d-ce59-415e-a012-1769ae2baef8","to":"9692d513-d9ad-48af-92e3-af01abf14ba9","id":"1b8860c8-edf0-4952-a2b0-9342a7f98e7f","name":"","dash":false,"alt":true}],"areas":[],"initNum":6}', 1, 0, 0, 1615295010, '1', '雷克斯', 1615295011),
	('74aa9fa9-5c4e-4bf5-b08a-a9c5df6a6fbb', '4e6bbeab-3d2b-4b36-b733-c2255897b201', '16152948744828', '9692d513-d9ad-48af-92e3-af01abf14ba9', 2, '李四', '43873a8d-ce59-415e-a012-1769ae2baef8', '', '{"title":"Rex测试","nodes":[{"name":"开始","left":119,"top":92,"type":"start round mix","id":"ca11e42e-3d98-4f70-9188-22df6f64ecf6","width":26,"height":26,"alt":true},{"name":"李四","left":321,"top":104,"type":"task","id":"43873a8d-ce59-415e-a012-1769ae2baef8","width":104,"height":26,"alt":true,"setInfo":{"NodeDesignate":"SPECIAL_USER","Nodedesignatedata":{"users":["6"],"roles":[],"orgs":[],"sql":""}}},{"name":"结束","left":606,"top":115,"type":"end round","id":"9692d513-d9ad-48af-92e3-af01abf14ba9","width":26,"height":26,"alt":true}],"lines":[{"type":"sl","from":"ca11e42e-3d98-4f70-9188-22df6f64ecf6","to":"43873a8d-ce59-415e-a012-1769ae2baef8","id":"7ce6cfb0-f315-4cd3-84b3-03c2f8c98c71","name":"","dash":false,"alt":true},{"type":"sl","from":"43873a8d-ce59-415e-a012-1769ae2baef8","to":"9692d513-d9ad-48af-92e3-af01abf14ba9","id":"1b8860c8-edf0-4952-a2b0-9342a7f98e7f","name":"","dash":false,"alt":true}],"areas":[],"initNum":6}', 1, 0, 2, 1615294874, '1', '雷克斯', 1615294911),
	('f9196611-56f8-43d8-a0d2-75695d4b3138', '4e6bbeab-3d2b-4b36-b733-c2255897b201', '16152982503024', '43873a8d-ce59-415e-a012-1769ae2baef8', 2, '李四', 'ca11e42e-3d98-4f70-9188-22df6f64ecf6', '6,', '{"title":"Rex测试","nodes":[{"name":"开始","left":119,"top":92,"type":"start round mix","id":"ca11e42e-3d98-4f70-9188-22df6f64ecf6","width":26,"height":26,"alt":true},{"name":"李四","left":321,"top":104,"type":"task","id":"43873a8d-ce59-415e-a012-1769ae2baef8","width":104,"height":26,"alt":true,"setInfo":{"NodeDesignate":"SPECIAL_USER","Nodedesignatedata":{"users":["6"],"roles":[],"orgs":[],"sql":""}}},{"name":"结束","left":606,"top":115,"type":"end round","id":"9692d513-d9ad-48af-92e3-af01abf14ba9","width":26,"height":26,"alt":true}],"lines":[{"type":"sl","from":"ca11e42e-3d98-4f70-9188-22df6f64ecf6","to":"43873a8d-ce59-415e-a012-1769ae2baef8","id":"7ce6cfb0-f315-4cd3-84b3-03c2f8c98c71","name":"","dash":false,"alt":true},{"type":"sl","from":"43873a8d-ce59-415e-a012-1769ae2baef8","to":"9692d513-d9ad-48af-92e3-af01abf14ba9","id":"1b8860c8-edf0-4952-a2b0-9342a7f98e7f","name":"","dash":false,"alt":true}],"areas":[],"initNum":6}', 1, 0, 0, 1615298250, '1', '雷克斯', 1615298251);
/*!40000 ALTER TABLE `wf_workflow_instance` ENABLE KEYS */;

-- 导出  表 workflow.wf_workflow_instance_form 结构
CREATE TABLE IF NOT EXISTS `wf_workflow_instance_form` (
  `Id` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `InstanceId` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '流程实例ID',
  `FormId` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '表单ID',
  `FormContent` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '表单内容/对于表单ID',
  `FormType` int DEFAULT NULL COMMENT '表单类型',
  `FormUrl` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '表单地址',
  `FormData` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '表单数据JSON',
  `CreateUserId` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `CreateTime` bigint NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`Id`) USING BTREE,
  KEY `InstanceId` (`InstanceId`) USING BTREE,
  KEY `FormId` (`FormId`) USING BTREE,
  CONSTRAINT `wf_workflow_instance_form_ibfk_1` FOREIGN KEY (`InstanceId`) REFERENCES `wf_workflow_instance` (`InstanceId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `wf_workflow_instance_form_ibfk_2` FOREIGN KEY (`FormId`) REFERENCES `wf_workflow_form` (`FormId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='流程实例表单关联表';

-- 正在导出表  workflow.wf_workflow_instance_form 的数据：~3 rows (大约)
/*!40000 ALTER TABLE `wf_workflow_instance_form` DISABLE KEYS */;
INSERT INTO `wf_workflow_instance_form` (`Id`, `InstanceId`, `FormId`, `FormContent`, `FormType`, `FormUrl`, `FormData`, `CreateUserId`, `CreateTime`) VALUES
	('06bc4fda-2dab-4417-a9d8-fd6c6335f61b', '74aa9fa9-5c4e-4bf5-b08a-a9c5df6a6fbb', '3527cc21-d7b0-436a-97c9-dafe76223623', '<table style="border-collapse: collapse; width: 100%;" border="1">\n<tbody>\n<tr>\n<td style="width: 33.3333%;">姓名</td>\n<td style="width: 33.3333%;">性别</td>\n<td style="width: 33.3333%;">年龄</td>\n</tr>\n<tr>\n<td style="width: 33.3333%;">Rex</td>\n<td style="width: 33.3333%;">男</td>\n<td style="width: 33.3333%;">18</td>\n</tr>\n</tbody>\n</table>', 0, NULL, '{}', '1', 1615294874),
	('b14c4f1f-ecf7-4992-bb54-08726a35ad32', 'f9196611-56f8-43d8-a0d2-75695d4b3138', '3527cc21-d7b0-436a-97c9-dafe76223623', '<table style="border-collapse: collapse; width: 100%;" border="1">\n<tbody>\n<tr>\n<td style="width: 33.3333%;">姓名</td>\n<td style="width: 33.3333%;">性别</td>\n<td style="width: 33.3333%;">年龄</td>\n</tr>\n<tr>\n<td style="width: 33.3333%;">Rex</td>\n<td style="width: 33.3333%;">男</td>\n<td style="width: 33.3333%;">18</td>\n</tr>\n</tbody>\n</table>', 0, NULL, '{}', '1', 1615298250),
	('b58e29b1-df76-4714-b345-32e310fb4859', '3a246503-54b0-4aa6-a266-136dffe7c616', '3527cc21-d7b0-436a-97c9-dafe76223623', '<table style="border-collapse: collapse; width: 100%;" border="1">\n<tbody>\n<tr>\n<td style="width: 33.3333%;">姓名</td>\n<td style="width: 33.3333%;">性别</td>\n<td style="width: 33.3333%;">年龄</td>\n</tr>\n<tr>\n<td style="width: 33.3333%;">Rex</td>\n<td style="width: 33.3333%;">男</td>\n<td style="width: 33.3333%;">18</td>\n</tr>\n</tbody>\n</table>', 0, NULL, '{}', '1', 1615295010),
	('c238dd85-6fe5-400c-8631-bf5987a6eb0e', '0cb6f912-6d6f-4341-bf76-34368c50df8e', '3527cc21-d7b0-436a-97c9-dafe76223623', '<table style="border-collapse: collapse; width: 100%;" border="1">\n<tbody>\n<tr>\n<td style="width: 33.3333%;">姓名</td>\n<td style="width: 33.3333%;">性别</td>\n<td style="width: 33.3333%;">年龄</td>\n</tr>\n<tr>\n<td style="width: 33.3333%;">Rex</td>\n<td style="width: 33.3333%;">男</td>\n<td style="width: 33.3333%;">18</td>\n</tr>\n</tbody>\n</table>', 0, NULL, '{}', '1', 1615290283);
/*!40000 ALTER TABLE `wf_workflow_instance_form` ENABLE KEYS */;

-- 导出  表 workflow.wf_workflow_notice 结构
CREATE TABLE IF NOT EXISTS `wf_workflow_notice` (
  `Id` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `InstanceId` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '流程实例ID',
  `NodeId` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '通知节点ID',
  `NodeName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '通知节点名称',
  `Maker` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '执行人',
  `IsTransition` tinyint NOT NULL DEFAULT '0' COMMENT '是否已经流转过',
  `Status` tinyint NOT NULL DEFAULT '1' COMMENT '状态，退回时候用',
  `IsRead` tinyint NOT NULL DEFAULT '0' COMMENT '是否已阅',
  PRIMARY KEY (`Id`) USING BTREE,
  KEY `InstanceId` (`InstanceId`) USING BTREE,
  CONSTRAINT `wf_workflow_notice_ibfk_1` FOREIGN KEY (`InstanceId`) REFERENCES `wf_workflow_instance` (`InstanceId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='流程通知节点表';

-- 正在导出表  workflow.wf_workflow_notice 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `wf_workflow_notice` DISABLE KEYS */;
/*!40000 ALTER TABLE `wf_workflow_notice` ENABLE KEYS */;

-- 导出  表 workflow.wf_workflow_operation_history 结构
CREATE TABLE IF NOT EXISTS `wf_workflow_operation_history` (
  `OperationId` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `InstanceId` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '实例进程ID',
  `NodeId` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '节点ID',
  `NodeName` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '节点名称',
  `TransitionType` int DEFAULT NULL COMMENT '流转类型',
  `Content` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '操作内容',
  `CreateTime` bigint NOT NULL COMMENT '创建时间',
  `CreateUserId` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `CreateUserName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建人姓名',
  PRIMARY KEY (`OperationId`) USING BTREE,
  KEY `InstanceId` (`InstanceId`) USING BTREE,
  CONSTRAINT `wf_workflow_operation_history_ibfk_1` FOREIGN KEY (`InstanceId`) REFERENCES `wf_workflow_instance` (`InstanceId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='流程操作历史记录';

-- 正在导出表  workflow.wf_workflow_operation_history 的数据：~2 rows (大约)
/*!40000 ALTER TABLE `wf_workflow_operation_history` DISABLE KEYS */;
INSERT INTO `wf_workflow_operation_history` (`OperationId`, `InstanceId`, `NodeId`, `NodeName`, `TransitionType`, `Content`, `CreateTime`, `CreateUserId`, `CreateUserName`) VALUES
	('0b6f2fe8-a1f5-4f2f-ac2e-d42631a13b24', '74aa9fa9-5c4e-4bf5-b08a-a9c5df6a6fbb', 'ca11e42e-3d98-4f70-9188-22df6f64ecf6', '开始', 1, '提交流程', 1615294875, '1', '雷克斯'),
	('2aeeacc9-dbcc-459c-8dae-fd952d9b319d', '74aa9fa9-5c4e-4bf5-b08a-a9c5df6a6fbb', '43873a8d-ce59-415e-a012-1769ae2baef8', '李四', 3, '123', 1615294911, '6', '李四'),
	('398e4b89-88dd-451e-9132-a2a7b5f0ad8c', '3a246503-54b0-4aa6-a266-136dffe7c616', 'ca11e42e-3d98-4f70-9188-22df6f64ecf6', '开始', 1, '提交流程', 1615295011, '1', '雷克斯'),
	('42c55332-7729-4d58-8553-5d42bbc101d0', 'f9196611-56f8-43d8-a0d2-75695d4b3138', 'ca11e42e-3d98-4f70-9188-22df6f64ecf6', '开始', 1, '提交流程', 1615298251, '1', '雷克斯'),
	('ddef0d1b-ecee-44de-82db-fce78936a92b', '0cb6f912-6d6f-4341-bf76-34368c50df8e', 'ca11e42e-3d98-4f70-9188-22df6f64ecf6', '开始', 1, '提交流程', 1615290284, '1', '雷克斯'),
	('f2c55f79-6de2-4c44-abf0-f2de471e6ca3', '0cb6f912-6d6f-4341-bf76-34368c50df8e', '43873a8d-ce59-415e-a012-1769ae2baef8', '李四', 2, '同意！', 1615294432, '6', '李四');
/*!40000 ALTER TABLE `wf_workflow_operation_history` ENABLE KEYS */;

-- 导出  表 workflow.wf_workflow_transition_history 结构
CREATE TABLE IF NOT EXISTS `wf_workflow_transition_history` (
  `TransitionId` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `InstanceId` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '流程实例ID',
  `FromNodeId` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '开始节点Id',
  `FromNodeType` int DEFAULT NULL COMMENT '开始节点类型',
  `FromNodName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '开始节点名称',
  `ToNodeId` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '结束节点Id',
  `ToNodeType` int DEFAULT NULL COMMENT '结束节点类型',
  `ToNodeName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '结束节点名称',
  `TransitionState` int DEFAULT NULL COMMENT '转化状态',
  `IsFinish` int DEFAULT NULL COMMENT '是否结束',
  `CreateTime` bigint NOT NULL COMMENT '创建时间',
  `CreateUserId` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `CreateUserName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建人姓名',
  PRIMARY KEY (`TransitionId`) USING BTREE,
  KEY `InstanceId` (`InstanceId`) USING BTREE,
  CONSTRAINT `wf_workflow_transition_history_ibfk_1` FOREIGN KEY (`InstanceId`) REFERENCES `wf_workflow_instance` (`InstanceId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='流程流转历史表';

-- 正在导出表  workflow.wf_workflow_transition_history 的数据：~2 rows (大约)
/*!40000 ALTER TABLE `wf_workflow_transition_history` DISABLE KEYS */;
INSERT INTO `wf_workflow_transition_history` (`TransitionId`, `InstanceId`, `FromNodeId`, `FromNodeType`, `FromNodName`, `ToNodeId`, `ToNodeType`, `ToNodeName`, `TransitionState`, `IsFinish`, `CreateTime`, `CreateUserId`, `CreateUserName`) VALUES
	('1b1519a8-c8a7-44a5-bf1d-e410088e3910', '0cb6f912-6d6f-4341-bf76-34368c50df8e', 'ca11e42e-3d98-4f70-9188-22df6f64ecf6', 3, '开始', '43873a8d-ce59-415e-a012-1769ae2baef8', 2, '李四', 0, 0, 1615290284, '1', '雷克斯'),
	('6358dabf-9262-493f-b5c9-ef2141c09314', '74aa9fa9-5c4e-4bf5-b08a-a9c5df6a6fbb', 'ca11e42e-3d98-4f70-9188-22df6f64ecf6', 3, '开始', '43873a8d-ce59-415e-a012-1769ae2baef8', 2, '李四', 0, 0, 1615294875, '1', '雷克斯'),
	('7c12d3e2-6e3c-42ac-b5a4-48e8c1802ad3', 'f9196611-56f8-43d8-a0d2-75695d4b3138', 'ca11e42e-3d98-4f70-9188-22df6f64ecf6', 3, '开始', '43873a8d-ce59-415e-a012-1769ae2baef8', 2, '李四', 0, 0, 1615298251, '1', '雷克斯'),
	('98432eac-8201-4a40-a0d4-3366ef12be51', '0cb6f912-6d6f-4341-bf76-34368c50df8e', '43873a8d-ce59-415e-a012-1769ae2baef8', 2, '李四', '9692d513-d9ad-48af-92e3-af01abf14ba9', 4, '结束', 0, 1, 1615294432, '6', '李四'),
	('a2298673-fa85-40a2-aa14-81e47fe09400', '74aa9fa9-5c4e-4bf5-b08a-a9c5df6a6fbb', '43873a8d-ce59-415e-a012-1769ae2baef8', 2, '李四', '9692d513-d9ad-48af-92e3-af01abf14ba9', 4, '结束', 1, 0, 1615294911, '6', '李四'),
	('d3d2156a-1876-4ebc-a66a-f8d819380f76', '3a246503-54b0-4aa6-a266-136dffe7c616', 'ca11e42e-3d98-4f70-9188-22df6f64ecf6', 3, '开始', '43873a8d-ce59-415e-a012-1769ae2baef8', 2, '李四', 0, 0, 1615295011, '1', '雷克斯');
/*!40000 ALTER TABLE `wf_workflow_transition_history` ENABLE KEYS */;

-- 导出  表 workflow.wf_workflow_urge 结构
CREATE TABLE IF NOT EXISTS `wf_workflow_urge` (
  `Id` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `InstanceId` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '流程实例id',
  `NodeId` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '当前节点id',
  `NodeName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '节点名称',
  `Sender` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '发送人',
  `UrgeType` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '催办方式',
  `UrgeUser` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '催办人',
  `UrgeContent` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '催办信息',
  `CreateTime` bigint NOT NULL COMMENT '创建时间',
  `CreateUserId` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  PRIMARY KEY (`Id`) USING BTREE,
  KEY `InstanceId` (`InstanceId`) USING BTREE,
  CONSTRAINT `wf_workflow_urge_ibfk_1` FOREIGN KEY (`InstanceId`) REFERENCES `wf_workflow_instance` (`InstanceId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='催办记录表';

-- 正在导出表  workflow.wf_workflow_urge 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `wf_workflow_urge` DISABLE KEYS */;
INSERT INTO `wf_workflow_urge` (`Id`, `InstanceId`, `NodeId`, `NodeName`, `Sender`, `UrgeType`, `UrgeUser`, `UrgeContent`, `CreateTime`, `CreateUserId`) VALUES
	('42c41421-4540-48cf-b4bf-ca4317359d69', 'f9196611-56f8-43d8-a0d2-75695d4b3138', '43873a8d-ce59-415e-a012-1769ae2baef8', '李四', '1', '0,', '6,', '请审批流程', 1615375992, '1'),
	('b99efcf1-b1c4-4d61-a3ee-8b50b0dbbceb', 'f9196611-56f8-43d8-a0d2-75695d4b3138', '43873a8d-ce59-415e-a012-1769ae2baef8', '李四', '1', '0,', '6,', '请审批流程', 1615372218, '1'),
	('d1aa9370-73e2-4d3f-92df-6d65ce890aa2', 'f9196611-56f8-43d8-a0d2-75695d4b3138', '43873a8d-ce59-415e-a012-1769ae2baef8', '李四', '1', '0,', '6,', '请审批流程', 1615372486, '1'),
	('e4a1debc-379e-40d7-994c-f0861ffdb195', 'f9196611-56f8-43d8-a0d2-75695d4b3138', '43873a8d-ce59-415e-a012-1769ae2baef8', '李四', '1', '0,', '6,', '请审批流程', 1615373658, '1'),
	('ef7fdf48-8a3c-4b76-95ae-4437563ee311', 'f9196611-56f8-43d8-a0d2-75695d4b3138', '43873a8d-ce59-415e-a012-1769ae2baef8', '李四', '1', '0,', '6,', '请审批流程', 1615373386, '1'),
	('f0ee8025-6e90-49e2-83f5-04a335da8c41', 'f9196611-56f8-43d8-a0d2-75695d4b3138', '43873a8d-ce59-415e-a012-1769ae2baef8', '李四', '1', '0,', '6,', '请审批流程', 1615374873, '1'),
	('f36d0108-8aa8-463a-98f5-3181a12b6964', '3a246503-54b0-4aa6-a266-136dffe7c616', '43873a8d-ce59-415e-a012-1769ae2baef8', '李四', '1', '0,', '6,', '请审批流程', 1615377073, '1');
/*!40000 ALTER TABLE `wf_workflow_urge` ENABLE KEYS */;

-- 导出  表 workflow.wx_account 结构
CREATE TABLE IF NOT EXISTS `wx_account` (
  `WeixinId` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '微信原始Id',
  `AppId` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '开发者ID',
  `AppSecret` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '开发者密码',
  `WeixinName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公众号名称',
  `WeixinQRCode` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '公众号二维码地址',
  `AccessToken` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'AccessToken',
  `AccessTokenCreateTime` datetime DEFAULT NULL COMMENT 'AccessToken创建时间',
  `JsApiTicket` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'JS API临时票据',
  `JsApiTicketCreateTime` datetime DEFAULT NULL COMMENT 'JS API临时票据创建时间',
  `SubscribePageUrl` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '微信号关注引导页地址URL',
  `CreateTime` bigint NOT NULL COMMENT '创建时间',
  `Token` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '令牌',
  `EncodingAESKey` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '消息加解密密钥',
  PRIMARY KEY (`WeixinId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='公众号表';

-- 正在导出表  workflow.wx_account 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `wx_account` DISABLE KEYS */;
INSERT INTO `wx_account` (`WeixinId`, `AppId`, `AppSecret`, `WeixinName`, `WeixinQRCode`, `AccessToken`, `AccessTokenCreateTime`, `JsApiTicket`, `JsApiTicketCreateTime`, `SubscribePageUrl`, `CreateTime`, `Token`, `EncodingAESKey`) VALUES
	('gh_3f66fb647ff1', 'wxeb8c08a03de853d5', '485c8b1eeb798401c9af06798f91ec6c', '自由reading', NULL, '17_ESnucPG7Ccpi7_t7AfPIUMzUN2v9Wi2uDYlsJRyh4Ho7bivZh9AmoIkXjTXZYUKcTyP1IOo7WifJJiyjnRfAnRaDpyv0zYO4OFiSAUYLGF-pVAAV5vZcDREipUIole9JwQVmH07mOo7yKO6NUOViABALFM', '2019-01-12 10:29:53', NULL, NULL, NULL, 1546912897, 'wangmaosheng', 'w9jBowtJ9rqgzcHFFyJ0VakWDdNfknphEmFB7pocglk');
/*!40000 ALTER TABLE `wx_account` ENABLE KEYS */;

-- 导出  表 workflow.wx_account_miniprogram 结构
CREATE TABLE IF NOT EXISTS `wx_account_miniprogram` (
  `Id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `WeixinId` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '微信原始Id',
  `AppId` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'AppID(小程序ID)',
  `AppSecret` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'AppSecret(小程序密钥)',
  PRIMARY KEY (`Id`) USING BTREE,
  KEY `WeixinId` (`WeixinId`) USING BTREE,
  CONSTRAINT `wx_account_miniprogram_ibfk_1` FOREIGN KEY (`WeixinId`) REFERENCES `wx_account` (`WeixinId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- 正在导出表  workflow.wx_account_miniprogram 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `wx_account_miniprogram` DISABLE KEYS */;
INSERT INTO `wx_account_miniprogram` (`Id`, `WeixinId`, `AppId`, `AppSecret`) VALUES
	(1, 'gh_3f66fb647ff1', 'wx20a06c30c8b81e61', '6223a1e06f10ebc8ae9fe9eed65042bb');
/*!40000 ALTER TABLE `wx_account_miniprogram` ENABLE KEYS */;

-- 导出  表 workflow.wx_keyword 结构
CREATE TABLE IF NOT EXISTS `wx_keyword` (
  `Id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `RuleId` int NOT NULL COMMENT '规则表ID',
  `Keyword` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '关键字',
  `CreateTime` bigint NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`Id`) USING BTREE,
  KEY `RuleId` (`RuleId`) USING BTREE,
  CONSTRAINT `wx_keyword_ibfk_1` FOREIGN KEY (`RuleId`) REFERENCES `wx_rule` (`Id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='关键字表';

-- 正在导出表  workflow.wx_keyword 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `wx_keyword` DISABLE KEYS */;
INSERT INTO `wx_keyword` (`Id`, `RuleId`, `Keyword`, `CreateTime`) VALUES
	(1, 3, '妹子', 1560356237);
/*!40000 ALTER TABLE `wx_keyword` ENABLE KEYS */;

-- 导出  表 workflow.wx_menu 结构
CREATE TABLE IF NOT EXISTS `wx_menu` (
  `Id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `ParentId` int NOT NULL DEFAULT '0' COMMENT '父级ID',
  `Name` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单标题，不超过16个字节，子菜单不超过60个字节',
  `Type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '菜单的响应动作类型，view表示网页类型，click表示点击类型，miniprogram表示小程序类型',
  `Key` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '菜单KEY值，用于消息接口推送，不超过128字节',
  `Url` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '网页 链接，用户点击菜单可打开链接，不超过1024字节。 type为miniprogram时，不支持小程序的老版本客户端将打开本url。',
  `AppId` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '小程序的appid（仅认证公众号可配置）',
  `PagePath` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '小程序的页面路径',
  `Sort` int NOT NULL DEFAULT '0',
  `IsDel` int NOT NULL DEFAULT '0',
  `CreateTime` bigint DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='微信菜单';

-- 正在导出表  workflow.wx_menu 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `wx_menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `wx_menu` ENABLE KEYS */;

-- 导出  表 workflow.wx_miniprogram_user 结构
CREATE TABLE IF NOT EXISTS `wx_miniprogram_user` (
  `Id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `OpenId` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '小程序对应该用户的OpenId',
  `UnionId` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '微信开放平台的唯一标识符',
  `NickName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '昵称',
  `City` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户所在城市',
  `Country` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户所在国家',
  `Province` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户所在的省份',
  `Language` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '语言',
  `Gender` tinyint DEFAULT NULL COMMENT '性别',
  `AvatarUrl` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '头像',
  `CreateTime` bigint NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`OpenId`,`Id`) USING BTREE,
  KEY `Id` (`Id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='小程序用户表';

-- 正在导出表  workflow.wx_miniprogram_user 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `wx_miniprogram_user` DISABLE KEYS */;
INSERT INTO `wx_miniprogram_user` (`Id`, `OpenId`, `UnionId`, `NickName`, `City`, `Country`, `Province`, `Language`, `Gender`, `AvatarUrl`, `CreateTime`) VALUES
	(1, 'ofovX1PhIU2fMvagdO1wtJj2U8Bc', NULL, '岁月静好', 'Lianyungang', 'China', 'Jiangsu', 'zh_CN', 1, 'https://wx.qlogo.cn/mmopen/vi_32/OmJum4poEd64ibQjFZ4DWqND7OtN2ia9akuYSn9fxWrwT4PaH71mqr7ls3jdYHDlj10Oq8vS9pjw27WjebgMYWWA/132', 1555578279);
/*!40000 ALTER TABLE `wx_miniprogram_user` ENABLE KEYS */;

-- 导出  表 workflow.wx_news_response 结构
CREATE TABLE IF NOT EXISTS `wx_news_response` (
  `Id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `RuleId` int NOT NULL COMMENT '规则ID',
  `Title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '图文消息标题',
  `Description` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '图文消息描述',
  `PicUrl` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '图片链接，支持JPG、PNG格式，较好的效果为大图360*200，小图200*200',
  `Url` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '点击图文消息跳转链接',
  `Sort` int NOT NULL DEFAULT '0' COMMENT '排序',
  `IsDel` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否已删除0否，1是',
  `CreateTime` bigint NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`Id`) USING BTREE,
  KEY `RuleId` (`RuleId`) USING BTREE,
  CONSTRAINT `wx_news_response_ibfk_1` FOREIGN KEY (`RuleId`) REFERENCES `wx_rule` (`Id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='回复图文消息';

-- 正在导出表  workflow.wx_news_response 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `wx_news_response` DISABLE KEYS */;
/*!40000 ALTER TABLE `wx_news_response` ENABLE KEYS */;

-- 导出  表 workflow.wx_rule 结构
CREATE TABLE IF NOT EXISTS `wx_rule` (
  `Id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `RuleName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '规则名称',
  `RuleType` tinyint NOT NULL COMMENT '规则类型0:普通，1:未匹配到回复规则',
  `RequestMsgType` int NOT NULL COMMENT '规则类型',
  `ResponseMsgType` int NOT NULL COMMENT '响应消息类型',
  `CreateTime` bigint NOT NULL COMMENT '规则创建时间',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='响应微信消息规则';

-- 正在导出表  workflow.wx_rule 的数据：~3 rows (大约)
/*!40000 ALTER TABLE `wx_rule` DISABLE KEYS */;
INSERT INTO `wx_rule` (`Id`, `RuleName`, `RuleType`, `RequestMsgType`, `ResponseMsgType`, `CreateTime`) VALUES
	(1, '自动回复', 2, 1, 1, 1547103227),
	(2, '关注回复', 1, 8, 1, 1547112830),
	(3, '求妹子', 0, 1, 1, 1560356237);
/*!40000 ALTER TABLE `wx_rule` ENABLE KEYS */;

-- 导出  表 workflow.wx_text_response 结构
CREATE TABLE IF NOT EXISTS `wx_text_response` (
  `Id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `RuleId` int NOT NULL COMMENT '规则ID',
  `Content` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '消息内容',
  `CreateTime` bigint NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`Id`) USING BTREE,
  KEY `RuleId` (`RuleId`) USING BTREE,
  CONSTRAINT `wx_text_response_ibfk_1` FOREIGN KEY (`RuleId`) REFERENCES `wx_rule` (`Id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='文本回复';

-- 正在导出表  workflow.wx_text_response 的数据：~3 rows (大约)
/*!40000 ALTER TABLE `wx_text_response` DISABLE KEYS */;
INSERT INTO `wx_text_response` (`Id`, `RuleId`, `Content`, `CreateTime`) VALUES
	(1, 1, '亲，您发的我识别不了啊', 1547103227),
	(2, 2, '终于等到你了~~', 1547112831),
	(3, 3, '我就是', 1560356237);
/*!40000 ALTER TABLE `wx_text_response` ENABLE KEYS */;

-- 导出  表 workflow.wx_user 结构
CREATE TABLE IF NOT EXISTS `wx_user` (
  `OpenId` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户OpenId主键',
  `Subscribe` int DEFAULT NULL COMMENT '用户是否关注该公众号1：关注了，0：没关注',
  `UserName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户名',
  `NickName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '昵称',
  `Mobile` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '手机号码',
  `Sex` int DEFAULT NULL COMMENT '用户的性别，值为1时是男性，值为2时是女性，值为0时是未知',
  `City` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户所在城市',
  `Country` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户所在国家',
  `Province` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户所在的省份',
  `Headimgurl` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户头像',
  `Birthday` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '生日',
  `CreateTime` bigint NOT NULL COMMENT '创建时间',
  `IsSync` int NOT NULL DEFAULT '0' COMMENT '用户基本信息是否同步过',
  PRIMARY KEY (`OpenId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='微信用户表';

-- 正在导出表  workflow.wx_user 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `wx_user` DISABLE KEYS */;
INSERT INTO `wx_user` (`OpenId`, `Subscribe`, `UserName`, `NickName`, `Mobile`, `Sex`, `City`, `Country`, `Province`, `Headimgurl`, `Birthday`, `CreateTime`, `IsSync`) VALUES
	('ouUD4sr2rk1MT2UqTTqpGNFot-GI', 1, NULL, '不覊之士', NULL, 1, '连云港', '中国', '江苏', 'http://thirdwx.qlogo.cn/mmopen/eDicfvb2fvAYRduibVLeexKc0ZdJ67jryCbibbwWwTaypS2G5rdajCzRzq4QKbYVazuoe2Z9VTNlTzB6O6xOSep0cB24cfgPOXQ/132', NULL, 1547123099, 1);
/*!40000 ALTER TABLE `wx_user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
