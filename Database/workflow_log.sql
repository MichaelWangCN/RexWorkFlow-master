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


-- 导出 workflow_log 的数据库结构
CREATE DATABASE IF NOT EXISTS `workflow_log` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `workflow_log`;

-- 导出  表 workflow_log.log 结构
CREATE TABLE IF NOT EXISTS `log` (
  `Id` bigint NOT NULL AUTO_INCREMENT COMMENT '是多少主键',
  `Application` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '应用程序',
  `Logged` datetime(6) NOT NULL COMMENT '记录时间',
  `Level` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '日志级别',
  `Message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '消息',
  `Logger` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '日志记录开始地方',
  `Callsite` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '来源',
  `Exception` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '异常信息',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- 正在导出表  workflow_log.log 的数据：~104 rows (大约)
/*!40000 ALTER TABLE `log` DISABLE KEYS */;
INSERT INTO `log` (`Id`, `Application`, `Logged`, `Level`, `Message`, `Logger`, `Callsite`, `Exception`) VALUES
	(1, 'MsSystem.Sys.API', '2021-02-24 13:24:08.196946', 'Login', '用户名：【雷克斯】,用户ID:【1】登录成功', 'System', NULL, NULL),
	(2, 'MsSystem.Sys.API', '2021-02-24 13:50:34.177285', 'Login', '用户名：【雷克斯】,用户ID:【1】登录成功', 'System', NULL, NULL),
	(3, 'MsSystem.Sys.API', '2021-02-24 14:01:17.194792', 'Login', '用户名：【雷克斯】,用户ID:【1】登录成功', 'System', NULL, NULL),
	(4, 'MsSystem.Sys.API', '2021-02-24 15:36:08.998543', 'Login', '用户名：【雷克斯】,用户ID:【1】登录成功', 'System', NULL, NULL),
	(5, 'MsSystem.Sys.API', '2021-02-24 15:45:48.000235', 'Login', '用户名：【雷克斯】,用户ID:【1】登录成功', 'System', NULL, NULL),
	(6, 'MsSystem.Sys.API', '2021-02-24 15:53:37.706632', 'Login', '用户名：【雷克斯】,用户ID:【1】登录成功', 'System', NULL, NULL),
	(7, 'MsSystem.Sys.API', '2021-02-24 16:07:38.732135', 'Login', '用户名：【雷克斯】,用户ID:【1】登录成功', 'System', NULL, NULL),
	(8, 'MsSystem.Sys.API', '2021-02-24 16:18:23.541904', 'Login', '用户名：【雷克斯】,用户ID:【1】登录成功', 'System', NULL, NULL),
	(9, 'MsSystem.Sys.API', '2021-02-24 16:27:27.696725', 'Login', '用户名：【雷克斯】,用户ID:【1】登录成功', 'System', NULL, NULL),
	(10, 'MsSystem.Sys.API', '2021-02-24 19:28:10.237036', 'Login', '用户名：【雷克斯】,用户ID:【1】登录成功', 'System', NULL, NULL),
	(11, 'MsSystem.Sys.API', '2021-02-24 19:36:56.039316', 'Login', '用户名：【雷克斯】,用户ID:【1】登录成功', 'System', NULL, NULL),
	(12, 'MsSystem.Sys.API', '2021-02-24 21:00:59.314013', 'Login', '用户名：【雷克斯】,用户ID:【1】登录成功', 'System', NULL, NULL),
	(13, 'MsSystem.Sys.API', '2021-02-24 21:55:44.988659', 'Login', '用户名：【雷克斯】,用户ID:【1】登录成功', 'System', NULL, NULL),
	(14, 'MsSystem.Sys.API', '2021-02-25 09:06:16.354284', 'Login', '用户名：【雷克斯】,用户ID:【1】登录成功', 'System', NULL, NULL),
	(15, 'MsSystem.Sys.API', '2021-02-25 11:04:55.419993', 'Login', '用户名：【雷克斯】,用户ID:【1】登录成功', 'System', NULL, NULL),
	(16, 'MsSystem.Sys.API', '2021-02-25 11:33:26.467024', 'Login', '用户名：【雷克斯】,用户ID:【1】登录成功', 'System', NULL, NULL),
	(17, 'MsSystem.Sys.API', '2021-02-25 14:02:26.710080', 'Login', '用户名：【雷克斯】,用户ID:【1】登录成功', 'System', NULL, NULL),
	(18, 'MsSystem.Sys.API', '2021-02-25 16:45:07.866031', 'Login', '用户名：【雷克斯】,用户ID:【1】登录成功', 'System', NULL, NULL),
	(19, 'MsSystem.Sys.API', '2021-02-25 17:38:55.051257', 'Login', '用户名：【雷克斯】,用户ID:【1】登录成功', 'System', NULL, NULL),
	(20, 'MsSystem.Sys.API', '2021-02-25 20:09:49.812109', 'Login', '用户名：【雷克斯】,用户ID:【1】登录成功', 'System', NULL, NULL),
	(21, 'MsSystem.Sys.API', '2021-02-26 09:02:20.395718', 'Login', '用户名：【雷克斯】,用户ID:【1】登录成功', 'System', NULL, NULL),
	(22, 'MsSystem.Sys.API', '2021-02-26 09:52:54.829112', 'Login', '用户名：【雷克斯】,用户ID:【1】登录成功', 'System', NULL, NULL),
	(23, 'MsSystem.Sys.API', '2021-02-26 13:10:26.415573', 'Login', '用户名：【JBaBa】,用户ID:【27】登录成功', 'System', NULL, NULL),
	(24, 'MsSystem.Sys.API', '2021-02-26 13:33:19.745389', 'Login', '用户名：【雷克斯】,用户ID:【1】登录成功', 'System', NULL, NULL),
	(25, 'MsSystem.Sys.API', '2021-02-26 17:27:02.236307', 'Login', '用户名：【雷克斯】,用户ID:【1】登录成功', 'System', NULL, NULL),
	(26, 'MsSystem.Sys.API', '2021-02-26 17:48:48.822851', 'Login', '用户名：【雷克斯】,用户ID:【1】登录成功', 'System', NULL, NULL),
	(27, 'MsSystem.Sys.API', '2021-02-26 18:05:20.995827', 'Login', '用户名：【雷克斯】,用户ID:【1】登录成功', 'System', NULL, NULL),
	(28, 'MsSystem.Sys.API', '2021-02-27 14:32:45.623165', 'Login', '用户名：【雷克斯】,用户ID:【1】登录成功', 'System', NULL, NULL),
	(29, 'MsSystem.Sys.API', '2021-02-27 14:45:58.069939', 'Login', '用户名：【雷克斯】,用户ID:【1】登录成功', 'System', NULL, NULL),
	(30, 'MsSystem.Sys.API', '2021-02-27 20:17:28.595898', 'Login', '用户名：【雷克斯】,用户ID:【1】登录成功', 'System', NULL, NULL),
	(31, 'MsSystem.Sys.API', '2021-02-27 20:35:36.984280', 'Login', '用户名：【雷克斯】,用户ID:【1】登录成功', 'System', NULL, NULL),
	(32, 'MsSystem.Sys.API', '2021-02-27 20:37:47.265993', 'Login', '用户名：【雷克斯】,用户ID:【1】登录成功', 'System', NULL, NULL),
	(33, 'MsSystem.Sys.API', '2021-02-27 21:00:17.626114', 'Login', '用户名：【雷克斯】,用户ID:【1】登录成功', 'System', NULL, NULL),
	(34, 'MsSystem.Sys.API', '2021-02-27 21:45:17.787878', 'Login', '用户名：【雷克斯】,用户ID:【1】登录成功', 'System', NULL, NULL),
	(35, 'MsSystem.Sys.API', '2021-02-27 22:46:49.250882', 'Login', '用户名：【雷克斯】,用户ID:【1】登录成功', 'System', NULL, NULL),
	(36, 'MsSystem.Sys.API', '2021-02-28 13:39:05.301032', 'Login', '用户名：【雷克斯】,用户ID:【1】登录成功', 'System', NULL, NULL),
	(37, 'MsSystem.Sys.API', '2021-02-28 13:45:15.783906', 'Login', '用户名：【雷克斯】,用户ID:【1】登录成功', 'System', NULL, NULL),
	(38, 'MsSystem.Sys.API', '2021-02-28 13:52:52.461842', 'Login', '用户名：【雷克斯】,用户ID:【1】登录成功', 'System', NULL, NULL),
	(39, 'MsSystem.Sys.API', '2021-02-28 14:14:26.727904', 'Login', '用户名：【雷克斯】,用户ID:【1】登录成功', 'System', NULL, NULL),
	(40, 'MsSystem.Sys.API', '2021-02-28 15:30:10.817775', 'Login', '用户名：【雷克斯】,用户ID:【1】登录成功', 'System', NULL, NULL),
	(41, 'MsSystem.Sys.API', '2021-02-28 18:24:38.745509', 'Login', '用户名：【雷克斯】,用户ID:【1】登录成功', 'System', NULL, NULL),
	(42, 'MsSystem.Sys.API', '2021-02-28 18:41:17.483551', 'Login', '用户名：【雷克斯】,用户ID:【1】登录成功', 'System', NULL, NULL),
	(43, 'MsSystem.Sys.API', '2021-02-28 20:23:06.263668', 'Login', '用户名：【雷克斯】,用户ID:【1】登录成功', 'System', NULL, NULL),
	(44, 'MsSystem.Sys.API', '2021-03-01 09:05:48.716970', 'Login', '用户名：【雷克斯】,用户ID:【1】登录成功', 'System', NULL, NULL),
	(45, 'MsSystem.Sys.API', '2021-03-01 11:35:43.646249', 'Login', '用户名：【雷克斯】,用户ID:【1】登录成功', 'System', NULL, NULL),
	(46, 'MsSystem.Sys.API', '2021-03-01 13:12:27.926591', 'Login', '用户名：【雷克斯】,用户ID:【1】登录成功', 'System', NULL, NULL),
	(47, 'MsSystem.Sys.API', '2021-03-01 15:46:47.089899', 'Login', '用户名：【雷克斯】,用户ID:【1】登录成功', 'System', NULL, NULL),
	(48, 'MsSystem.Sys.API', '2021-03-01 18:50:55.292257', 'Login', '用户名：【雷克斯】,用户ID:【1】登录成功', 'System', NULL, NULL),
	(49, 'MsSystem.Sys.API', '2021-03-02 09:01:56.683139', 'Login', '用户名：【雷克斯】,用户ID:【1】登录成功', 'System', NULL, NULL),
	(50, 'MsSystem.Sys.API', '2021-03-02 12:44:25.704489', 'Login', '用户名：【雷克斯】,用户ID:【1】登录成功', 'System', NULL, NULL),
	(51, 'MsSystem.Sys.API', '2021-03-02 12:44:30.915612', 'Login', '用户名：【雷克斯】,用户ID:【1】登录成功', 'System', NULL, NULL),
	(52, 'MsSystem.Sys.API', '2021-03-02 12:44:41.271572', 'Login', '用户名：【雷克斯】,用户ID:【1】登录成功', 'System', NULL, NULL),
	(53, 'MsSystem.Sys.API', '2021-03-02 12:56:40.503071', 'Login', '用户名：【雷克斯】,用户ID:【1】登录成功', 'System', NULL, NULL),
	(54, 'MsSystem.Sys.API', '2021-03-02 13:43:01.799501', 'Login', '用户名：【雷克斯】,用户ID:【1】登录成功', 'System', NULL, NULL),
	(55, 'MsSystem.Sys.API', '2021-03-02 13:52:53.207751', 'Login', '用户名：【雷克斯】,用户ID:【1】登录成功', 'System', NULL, NULL),
	(56, 'MsSystem.Sys.API', '2021-03-02 14:36:01.094762', 'Login', '用户名：【雷克斯】,用户ID:【1】登录成功', 'System', NULL, NULL),
	(57, 'MsSystem.Sys.API', '2021-03-02 15:03:39.642836', 'Login', '用户名：【雷克斯】,用户ID:【1】登录成功', 'System', NULL, NULL),
	(58, 'MsSystem.Sys.API', '2021-03-02 19:23:32.621841', 'Login', '用户名：【雷克斯】,用户ID:【1】登录成功', 'System', NULL, NULL),
	(59, 'MsSystem.Sys.API', '2021-03-03 10:58:51.425879', 'Login', '用户名：【雷克斯】,用户ID:【1】登录成功', 'System', NULL, NULL),
	(60, 'MsSystem.Sys.API', '2021-03-03 11:01:22.305011', 'Login', '用户名：【雷克斯】,用户ID:【1】登录成功', 'System', NULL, NULL),
	(61, 'MsSystem.Sys.API', '2021-03-03 11:05:59.605202', 'Login', '用户名：【雷克斯】,用户ID:【1】登录成功', 'System', NULL, NULL),
	(62, 'MsSystem.Sys.API', '2021-03-03 13:04:41.998039', 'Login', '用户名：【雷克斯】,用户ID:【1】登录成功', 'System', NULL, NULL),
	(63, 'MsSystem.Sys.API', '2021-03-03 13:04:49.563090', 'Login', '用户名：【雷克斯】,用户ID:【1】登录成功', 'System', NULL, NULL),
	(64, 'MsSystem.Sys.API', '2021-03-03 13:05:01.440223', 'Login', '用户名：【雷克斯】,用户ID:【1】登录成功', 'System', NULL, NULL),
	(65, 'MsSystem.Sys.API', '2021-03-03 13:05:17.093680', 'Login', '用户名：【雷克斯】,用户ID:【1】登录成功', 'System', NULL, NULL),
	(66, 'MsSystem.Sys.API', '2021-03-03 13:06:35.502578', 'Login', '用户名：【雷克斯】,用户ID:【1】登录成功', 'System', NULL, NULL),
	(67, 'MsSystem.Sys.API', '2021-03-04 09:09:56.853560', 'Login', '用户名：【雷克斯】,用户ID:【1】登录成功', 'System', NULL, NULL),
	(68, 'MsSystem.Sys.API', '2021-03-04 10:52:04.322090', 'Login', '用户名：【雷克斯】,用户ID:【1】登录成功', 'System', NULL, NULL),
	(69, 'MsSystem.Sys.API', '2021-03-04 10:52:26.621963', 'Login', '用户名：【雷克斯】,用户ID:【1】登录成功', 'System', NULL, NULL),
	(70, 'MsSystem.Sys.API', '2021-03-04 11:15:38.221568', 'Login', '用户名：【雷克斯】,用户ID:【1】登录成功', 'System', NULL, NULL),
	(71, 'MsSystem.Sys.API', '2021-03-04 11:18:19.387584', 'Login', '用户名：【雷克斯】,用户ID:【1】登录成功', 'System', NULL, NULL),
	(72, 'MsSystem.Sys.API', '2021-03-04 11:29:18.879521', 'Login', '用户名：【雷克斯】,用户ID:【1】登录成功', 'System', NULL, NULL),
	(73, 'MsSystem.Sys.API', '2021-03-04 13:08:51.269557', 'Login', '用户名：【雷克斯】,用户ID:【1】登录成功', 'System', NULL, NULL),
	(74, 'MsSystem.Sys.API', '2021-03-04 16:28:13.332097', 'Login', '用户名：【雷克斯】,用户ID:【1】登录成功', 'System', NULL, NULL),
	(75, 'MsSystem.Sys.API', '2021-03-04 20:28:08.149260', 'Login', '用户名：【雷克斯】,用户ID:【1】登录成功', 'System', NULL, NULL),
	(76, 'MsSystem.Sys.API', '2021-03-05 16:51:45.363857', 'Login', '用户名：【雷克斯】,用户ID:【1】登录成功', 'System', NULL, NULL),
	(77, 'MsSystem.Sys.API', '2021-03-05 16:53:28.975094', 'Login', '用户名：【雷克斯】,用户ID:【1】登录成功', 'System', NULL, NULL),
	(78, 'MsSystem.Sys.API', '2021-03-05 16:53:33.487953', 'Login', '用户名：【雷克斯】,用户ID:【1】登录成功', 'System', NULL, NULL),
	(79, 'MsSystem.Sys.API', '2021-03-05 16:54:01.697322', 'Login', '用户名：【雷克斯】,用户ID:【1】登录成功', 'System', NULL, NULL),
	(80, 'MsSystem.Sys.API', '2021-03-05 16:55:32.405783', 'Login', '用户名：【雷克斯】,用户ID:【1】登录成功', 'System', NULL, NULL),
	(81, 'MsSystem.Sys.API', '2021-03-05 17:00:04.079301', 'Login', '用户名：【雷克斯】,用户ID:【1】登录成功', 'System', NULL, NULL),
	(82, 'MsSystem.Sys.API', '2021-03-09 09:09:34.186787', 'Login', '用户名：【雷克斯】,用户ID:【1】登录成功', 'System', NULL, NULL),
	(83, 'MsSystem.Sys.API', '2021-03-09 14:02:34.213321', 'Login', '用户名：【雷克斯】,用户ID:【1】登录成功', 'System', NULL, NULL),
	(84, 'MsSystem.Sys.API', '2021-03-09 18:05:28.696757', 'Login', '用户名：【雷克斯】,用户ID:【1】登录成功', 'System', NULL, NULL),
	(85, 'MsSystem.Sys.API', '2021-03-09 19:48:20.229230', 'Login', '用户名：【李四】,用户ID:【6】登录成功', 'System', NULL, NULL),
	(86, 'MsSystem.Sys.API', '2021-03-09 19:48:49.542251', 'Login', '用户名：【张三】,用户ID:【5】登录成功', 'System', NULL, NULL),
	(87, 'MsSystem.Sys.API', '2021-03-09 19:50:04.190126', 'Login', '用户名：【李四】,用户ID:【6】登录成功', 'System', NULL, NULL),
	(88, 'MsSystem.Sys.API', '2021-03-09 21:57:53.269987', 'Login', '用户名：【李四】,用户ID:【6】登录成功', 'System', NULL, NULL),
	(89, 'MsSystem.Sys.API', '2021-03-09 22:10:55.768531', 'Login', '用户名：【雷克斯】,用户ID:【1】登录成功', 'System', NULL, NULL),
	(90, 'MsSystem.Sys.API', '2021-03-10 09:35:55.686371', 'Login', '用户名：【雷克斯】,用户ID:【1】登录成功', 'System', NULL, NULL),
	(91, 'MsSystem.Sys.API', '2021-03-10 13:04:29.192464', 'Login', '用户名：【雷克斯】,用户ID:【1】登录成功', 'System', NULL, NULL),
	(92, 'MsSystem.Sys.API', '2021-03-10 13:05:42.194511', 'Login', '用户名：【李四】,用户ID:【6】登录成功', 'System', NULL, NULL),
	(93, 'MsSystem.Sys.API', '2021-03-10 13:11:09.798367', 'Login', '用户名：【李四】,用户ID:【6】登录成功', 'System', NULL, NULL),
	(94, 'MsSystem.Sys.API', '2021-03-10 16:03:34.404965', 'Login', '用户名：【雷克斯】,用户ID:【1】登录成功', 'System', NULL, NULL),
	(95, 'MsSystem.Sys.API', '2021-03-10 16:08:12.750718', 'Login', '用户名：【李四】,用户ID:【6】登录成功', 'System', NULL, NULL),
	(96, 'MsSystem.Sys.API', '2021-03-10 17:32:55.047909', 'Login', '用户名：【雷克斯】,用户ID:【1】登录成功', 'System', NULL, NULL),
	(97, 'MsSystem.Sys.API', '2021-03-10 18:49:18.775619', 'Login', '用户名：【雷克斯】,用户ID:【1】登录成功', 'System', NULL, NULL),
	(98, 'MsSystem.Sys.API', '2021-03-10 18:50:25.208701', 'Login', '用户名：【李四】,用户ID:【6】登录成功', 'System', NULL, NULL),
	(99, 'MsSystem.Sys.API', '2021-03-10 18:52:49.189572', 'Login', '用户名：【李四】,用户ID:【6】登录成功', 'System', NULL, NULL),
	(100, 'MsSystem.Sys.API', '2021-03-10 18:53:27.649417', 'Login', '用户名：【雷克斯】,用户ID:【1】登录成功', 'System', NULL, NULL),
	(101, 'MsSystem.Sys.API', '2021-03-10 19:09:22.330373', 'Login', '用户名：【李四】,用户ID:【6】登录成功', 'System', NULL, NULL),
	(102, 'MsSystem.Sys.API', '2021-03-10 19:09:42.892057', 'Login', '用户名：【雷克斯】,用户ID:【1】登录成功', 'System', NULL, NULL),
	(103, 'MsSystem.Sys.API', '2021-03-10 19:53:03.418017', 'Login', '用户名：【李四】,用户ID:【6】登录成功', 'System', NULL, NULL),
	(104, 'MsSystem.Sys.API', '2021-03-10 19:54:14.408872', 'Login', '用户名：【雷克斯】,用户ID:【1】登录成功', 'System', NULL, NULL);
/*!40000 ALTER TABLE `log` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
