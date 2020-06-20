/*
 Navicat Premium Data Transfer

 Source Server         : BUCHIK
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:3306
 Source Schema         : db_praktikum_prognet_clone_aldi

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 21/06/2020 01:09:11
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin_notifications
-- ----------------------------
DROP TABLE IF EXISTS `admin_notifications`;
CREATE TABLE `admin_notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` int(10) unsigned NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `seller_notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`),
  KEY `notifiable_id` (`notifiable_id`),
  CONSTRAINT `admin_notifications_ibfk_1` FOREIGN KEY (`notifiable_id`) REFERENCES `admins` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_notifications
-- ----------------------------
BEGIN;
INSERT INTO `admin_notifications` VALUES ('9a5c4b91-e7de-4066-b812-302d82334376', 'App\\Notifications\\AdminNotification', 'App\\Admin', 8, '<a class=\'dropdown-item\' href=\'/admin/order/cek/57\' id=\'\'><div class=\'item-content flex-grow\'><h6 class=\'ellipsis font-weight-normal\'>Buchik</h6><p class=\'font-weight-light small-text text-muted mb-0\'>User Mengupload Bukti Pembayaran</p></div></a>', NULL, '2020-06-20 07:48:51', '2020-06-20 07:48:51');
COMMIT;

-- ----------------------------
-- Table structure for admins
-- ----------------------------
DROP TABLE IF EXISTS `admins`;
CREATE TABLE `admins` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `profile_image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sellers_email_unique` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admins
-- ----------------------------
BEGIN;
INSERT INTO `admins` VALUES (1, 'FireRex', '$2y$10$YbdKuEE8yZWHUFZHpwnSLO0xDESaq0yocJjzOQgIIeEy1eCA9VlXC', 'I Gede Aldi Wahyudi', '1559280824574.jpg', '083119889927', NULL, '2020-03-11 09:41:56', '2020-03-11 09:41:56');
INSERT INTO `admins` VALUES (2, 'Ayam', '$2y$10$hDFJ6VS7soeVJ5jdCmwLwOo4ooBvNQ6WMObeNrlgExgXWLZEWzlYa', 'Arya Putra', 'image/profile default.jpg', '0899999999', NULL, '2020-03-11 11:13:26', '2020-03-11 11:13:26');
INSERT INTO `admins` VALUES (3, 'Coba', 'testing12', '', '', '', NULL, NULL, NULL);
INSERT INTO `admins` VALUES (5, 'Aldi', '$2y$10$ZFUw/fQDEANFpHKtGJS/FOrpGrK0oabr4fjyyZOl80csZcN6B3sj2', 'I Gede Aldi Wahyudi', 'image/profile default.jpg', '086671626169', NULL, '2020-03-13 11:23:13', '2020-03-13 11:23:13');
INSERT INTO `admins` VALUES (6, 'Buchik', '$2y$10$7hP036jUIA27ShQ7/AUbF.9qAOVhMfRNZMUeMnRsQ4F7NK36X6cOy', 'Buchik Adhi Pratama', 'image/profile default.jpg', '08123456', NULL, '2020-03-13 11:50:08', '2020-03-13 11:50:08');
INSERT INTO `admins` VALUES (8, 'FireRexx', '$2y$10$xyIA0UQJssFgwu9H5cLe.O8RF5Z5uCNtP7Eg8/xz4kLH6KV4vkTx2', 'I Gede Aldi Wahyudi', 'image/profile default.jpg', '083119889921', NULL, '2020-03-16 10:25:17', '2020-03-16 10:25:17');
INSERT INTO `admins` VALUES (9, 'Buchik', '$2y$10$ANHfh2wFJHZj01hRafF/aOl7whbg0EomNw5dxSTiKUrapVHWYpSu2', 'Buchik Adhi Pratama', 'image/profile default.jpg', '081337572288', NULL, '2020-06-19 09:40:35', '2020-06-19 09:40:35');
COMMIT;

-- ----------------------------
-- Table structure for carts
-- ----------------------------
DROP TABLE IF EXISTS `carts`;
CREATE TABLE `carts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `qty` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `status` enum('checkedout','notyet','cancelled','sold') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `carts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `carts_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of carts
-- ----------------------------
BEGIN;
INSERT INTO `carts` VALUES (1, 18, 25, 3, '2020-06-16 12:39:08', '2020-06-18 15:58:31', NULL, 'sold');
INSERT INTO `carts` VALUES (2, 18, 26, 1, '2020-06-16 13:12:24', '2020-06-18 15:58:31', NULL, 'sold');
INSERT INTO `carts` VALUES (3, 18, 26, 1, '2020-06-18 12:51:51', '2020-06-18 15:58:31', NULL, 'sold');
INSERT INTO `carts` VALUES (4, 18, 25, 2, '2020-06-18 13:27:49', '2020-06-18 15:58:31', NULL, 'sold');
INSERT INTO `carts` VALUES (5, 18, 25, 2, '2020-06-18 15:16:44', '2020-06-18 15:58:31', NULL, 'sold');
INSERT INTO `carts` VALUES (6, 18, 25, 2, '2020-06-18 16:03:14', '2020-06-18 16:03:51', NULL, 'sold');
INSERT INTO `carts` VALUES (7, 18, 26, 1, '2020-06-18 16:36:53', '2020-06-18 16:37:27', NULL, 'sold');
INSERT INTO `carts` VALUES (8, 39, 25, 1, '2020-06-19 09:47:13', '2020-06-19 09:48:17', NULL, 'sold');
INSERT INTO `carts` VALUES (9, 39, 26, 1, '2020-06-19 10:13:09', '2020-06-19 10:18:03', NULL, 'sold');
INSERT INTO `carts` VALUES (10, 39, 26, 3, '2020-06-19 10:25:07', '2020-06-19 10:27:28', NULL, 'sold');
INSERT INTO `carts` VALUES (11, 18, 26, 4, '2020-06-19 10:42:12', '2020-06-19 10:43:00', NULL, 'sold');
INSERT INTO `carts` VALUES (12, 18, 35, 1, '2020-06-19 13:41:18', '2020-06-19 14:19:36', NULL, 'sold');
INSERT INTO `carts` VALUES (13, 18, 35, 1, '2020-06-19 13:41:22', '2020-06-19 13:43:28', NULL, 'sold');
INSERT INTO `carts` VALUES (14, 18, 28, 1, '2020-06-19 14:18:07', '2020-06-19 14:19:36', NULL, 'sold');
INSERT INTO `carts` VALUES (15, 18, 35, 1, '2020-06-19 15:00:57', '2020-06-19 15:59:57', NULL, 'sold');
INSERT INTO `carts` VALUES (16, 18, 35, 1, '2020-06-19 15:01:09', '2020-06-19 15:55:29', NULL, 'sold');
INSERT INTO `carts` VALUES (17, 18, 27, 1, '2020-06-19 15:01:22', '2020-06-19 15:59:57', NULL, 'sold');
INSERT INTO `carts` VALUES (18, 18, 35, 1, '2020-06-19 15:54:28', '2020-06-19 15:55:29', NULL, 'sold');
INSERT INTO `carts` VALUES (19, 18, 26, 1, '2020-06-19 15:59:15', '2020-06-19 15:59:57', NULL, 'sold');
INSERT INTO `carts` VALUES (20, 18, 27, 1, '2020-06-19 17:39:24', '2020-06-19 17:39:54', NULL, 'sold');
INSERT INTO `carts` VALUES (21, 18, 26, 1, '2020-06-20 02:38:21', '2020-06-20 02:39:01', NULL, 'sold');
INSERT INTO `carts` VALUES (22, 18, 26, 3, '2020-06-20 02:58:00', '2020-06-20 02:58:35', NULL, 'sold');
INSERT INTO `carts` VALUES (23, 18, 26, 4, '2020-06-20 03:09:46', '2020-06-20 03:10:24', NULL, 'sold');
INSERT INTO `carts` VALUES (24, 18, 26, 1, '2020-06-20 03:40:46', '2020-06-20 03:41:12', NULL, 'sold');
INSERT INTO `carts` VALUES (25, 18, 26, 1, '2020-06-20 06:23:59', '2020-06-20 06:25:35', NULL, 'sold');
INSERT INTO `carts` VALUES (26, 18, 35, 3, '2020-06-20 06:41:29', '2020-06-20 06:43:32', NULL, 'sold');
INSERT INTO `carts` VALUES (27, 18, 27, 1, '2020-06-20 06:53:48', '2020-06-20 06:54:11', NULL, 'sold');
INSERT INTO `carts` VALUES (28, 18, 25, 1, '2020-06-20 06:58:49', '2020-06-20 06:59:22', NULL, 'sold');
INSERT INTO `carts` VALUES (29, 18, 28, 1, '2020-06-20 07:23:33', '2020-06-20 07:24:12', NULL, 'sold');
INSERT INTO `carts` VALUES (30, 18, 31, 1, '2020-06-20 08:02:04', '2020-06-20 08:02:33', NULL, 'sold');
INSERT INTO `carts` VALUES (31, 18, 27, 1, '2020-06-20 08:22:37', '2020-06-20 08:27:59', NULL, 'sold');
INSERT INTO `carts` VALUES (32, 18, 26, 1, '2020-06-20 11:13:28', '2020-06-20 11:15:18', NULL, 'sold');
INSERT INTO `carts` VALUES (33, 18, 30, 2, '2020-06-20 11:13:43', '2020-06-20 11:15:18', NULL, 'sold');
INSERT INTO `carts` VALUES (34, 40, 29, 2, '2020-06-20 14:06:13', '2020-06-20 14:06:33', NULL, 'checkedout');
INSERT INTO `carts` VALUES (35, 18, 29, 2, '2020-06-20 14:34:21', '2020-06-20 14:36:32', NULL, 'sold');
INSERT INTO `carts` VALUES (36, 18, 28, 2, '2020-06-20 14:34:33', '2020-06-20 14:36:32', NULL, 'sold');
INSERT INTO `carts` VALUES (37, 18, 30, 1, '2020-06-20 14:35:57', '2020-06-20 14:36:32', NULL, 'sold');
INSERT INTO `carts` VALUES (38, 18, 28, 1, '2020-06-20 15:01:43', '2020-06-20 15:02:39', NULL, 'sold');
COMMIT;

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of categories
-- ----------------------------
BEGIN;
INSERT INTO `categories` VALUES (1, 'Baju', '2020-03-17 02:12:43', '2020-03-17 02:12:43', NULL);
INSERT INTO `categories` VALUES (2, 'Celana', '2020-03-17 03:39:14', '2020-03-17 03:39:14', NULL);
INSERT INTO `categories` VALUES (3, 'Topi', '2020-03-17 04:09:23', '2020-03-17 04:09:23', NULL);
INSERT INTO `categories` VALUES (4, 'Kolor', '2020-03-30 13:58:33', '2020-06-06 03:25:50', '2020-06-06 03:25:50');
INSERT INTO `categories` VALUES (5, 'Dress', '2020-04-12 03:34:10', '2020-04-12 03:34:10', NULL);
INSERT INTO `categories` VALUES (6, 'Sepatu', '2020-04-27 13:33:26', '2020-04-27 13:33:26', NULL);
INSERT INTO `categories` VALUES (7, 'Tas', '2020-04-27 13:59:18', '2020-04-27 13:59:18', NULL);
INSERT INTO `categories` VALUES (8, 'Aksesoris', '2020-05-03 15:14:14', '2020-05-03 15:14:14', NULL);
INSERT INTO `categories` VALUES (9, 'Jaket', '2020-05-03 15:14:28', '2020-05-03 15:14:28', NULL);
INSERT INTO `categories` VALUES (10, 'Celana Dalam', '2020-06-06 03:25:28', '2020-06-06 03:25:28', NULL);
INSERT INTO `categories` VALUES (11, 'Sandal', '2020-06-18 10:54:36', '2020-06-20 16:31:00', '2020-06-20 16:31:00');
COMMIT;

-- ----------------------------
-- Table structure for cities
-- ----------------------------
DROP TABLE IF EXISTS `cities`;
CREATE TABLE `cities` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `province_id` int(10) unsigned NOT NULL,
  `city_id` int(10) unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=502 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of cities
-- ----------------------------
BEGIN;
INSERT INTO `cities` VALUES (1, 1, 17, 'Badung', '2020-05-01 01:20:36', '2020-05-01 01:20:36');
INSERT INTO `cities` VALUES (2, 1, 32, 'Bangli', '2020-05-01 01:20:36', '2020-05-01 01:20:36');
INSERT INTO `cities` VALUES (3, 1, 94, 'Buleleng', '2020-05-01 01:20:36', '2020-05-01 01:20:36');
INSERT INTO `cities` VALUES (4, 1, 114, 'Denpasar', '2020-05-01 01:20:36', '2020-05-01 01:20:36');
INSERT INTO `cities` VALUES (5, 1, 128, 'Gianyar', '2020-05-01 01:20:36', '2020-05-01 01:20:36');
INSERT INTO `cities` VALUES (6, 1, 161, 'Jembrana', '2020-05-01 01:20:36', '2020-05-01 01:20:36');
INSERT INTO `cities` VALUES (7, 1, 170, 'Karangasem', '2020-05-01 01:20:36', '2020-05-01 01:20:36');
INSERT INTO `cities` VALUES (8, 1, 197, 'Klungkung', '2020-05-01 01:20:36', '2020-05-01 01:20:36');
INSERT INTO `cities` VALUES (9, 1, 447, 'Tabanan', '2020-05-01 01:20:36', '2020-05-01 01:20:36');
INSERT INTO `cities` VALUES (10, 2, 27, 'Bangka', '2020-05-01 01:20:37', '2020-05-01 01:20:37');
INSERT INTO `cities` VALUES (11, 2, 28, 'Bangka Barat', '2020-05-01 01:20:37', '2020-05-01 01:20:37');
INSERT INTO `cities` VALUES (12, 2, 29, 'Bangka Selatan', '2020-05-01 01:20:37', '2020-05-01 01:20:37');
INSERT INTO `cities` VALUES (13, 2, 30, 'Bangka Tengah', '2020-05-01 01:20:37', '2020-05-01 01:20:37');
INSERT INTO `cities` VALUES (14, 2, 56, 'Belitung', '2020-05-01 01:20:37', '2020-05-01 01:20:37');
INSERT INTO `cities` VALUES (15, 2, 57, 'Belitung Timur', '2020-05-01 01:20:37', '2020-05-01 01:20:37');
INSERT INTO `cities` VALUES (16, 2, 334, 'Pangkal Pinang', '2020-05-01 01:20:37', '2020-05-01 01:20:37');
INSERT INTO `cities` VALUES (17, 3, 106, 'Cilegon', '2020-05-01 01:20:38', '2020-05-01 01:20:38');
INSERT INTO `cities` VALUES (18, 3, 232, 'Lebak', '2020-05-01 01:20:38', '2020-05-01 01:20:38');
INSERT INTO `cities` VALUES (19, 3, 331, 'Pandeglang', '2020-05-01 01:20:38', '2020-05-01 01:20:38');
INSERT INTO `cities` VALUES (20, 3, 402, 'Serang', '2020-05-01 01:20:38', '2020-05-01 01:20:38');
INSERT INTO `cities` VALUES (21, 3, 403, 'Serang', '2020-05-01 01:20:38', '2020-05-01 01:20:38');
INSERT INTO `cities` VALUES (22, 3, 455, 'Tangerang', '2020-05-01 01:20:38', '2020-05-01 01:20:38');
INSERT INTO `cities` VALUES (23, 3, 456, 'Tangerang', '2020-05-01 01:20:38', '2020-05-01 01:20:38');
INSERT INTO `cities` VALUES (24, 3, 457, 'Tangerang Selatan', '2020-05-01 01:20:38', '2020-05-01 01:20:38');
INSERT INTO `cities` VALUES (25, 4, 62, 'Bengkulu', '2020-05-01 01:20:38', '2020-05-01 01:20:38');
INSERT INTO `cities` VALUES (26, 4, 63, 'Bengkulu Selatan', '2020-05-01 01:20:38', '2020-05-01 01:20:38');
INSERT INTO `cities` VALUES (27, 4, 64, 'Bengkulu Tengah', '2020-05-01 01:20:38', '2020-05-01 01:20:38');
INSERT INTO `cities` VALUES (28, 4, 65, 'Bengkulu Utara', '2020-05-01 01:20:38', '2020-05-01 01:20:38');
INSERT INTO `cities` VALUES (29, 4, 175, 'Kaur', '2020-05-01 01:20:38', '2020-05-01 01:20:38');
INSERT INTO `cities` VALUES (30, 4, 183, 'Kepahiang', '2020-05-01 01:20:38', '2020-05-01 01:20:38');
INSERT INTO `cities` VALUES (31, 4, 233, 'Lebong', '2020-05-01 01:20:38', '2020-05-01 01:20:38');
INSERT INTO `cities` VALUES (32, 4, 294, 'Muko Muko', '2020-05-01 01:20:38', '2020-05-01 01:20:38');
INSERT INTO `cities` VALUES (33, 4, 379, 'Rejang Lebong', '2020-05-01 01:20:38', '2020-05-01 01:20:38');
INSERT INTO `cities` VALUES (34, 4, 397, 'Seluma', '2020-05-01 01:20:38', '2020-05-01 01:20:38');
INSERT INTO `cities` VALUES (35, 5, 39, 'Bantul', '2020-05-01 01:20:39', '2020-05-01 01:20:39');
INSERT INTO `cities` VALUES (36, 5, 135, 'Gunung Kidul', '2020-05-01 01:20:39', '2020-05-01 01:20:39');
INSERT INTO `cities` VALUES (37, 5, 210, 'Kulon Progo', '2020-05-01 01:20:39', '2020-05-01 01:20:39');
INSERT INTO `cities` VALUES (38, 5, 419, 'Sleman', '2020-05-01 01:20:39', '2020-05-01 01:20:39');
INSERT INTO `cities` VALUES (39, 5, 501, 'Yogyakarta', '2020-05-01 01:20:39', '2020-05-01 01:20:39');
INSERT INTO `cities` VALUES (40, 6, 151, 'Jakarta Barat', '2020-05-01 01:20:40', '2020-05-01 01:20:40');
INSERT INTO `cities` VALUES (41, 6, 152, 'Jakarta Pusat', '2020-05-01 01:20:40', '2020-05-01 01:20:40');
INSERT INTO `cities` VALUES (42, 6, 153, 'Jakarta Selatan', '2020-05-01 01:20:40', '2020-05-01 01:20:40');
INSERT INTO `cities` VALUES (43, 6, 154, 'Jakarta Timur', '2020-05-01 01:20:40', '2020-05-01 01:20:40');
INSERT INTO `cities` VALUES (44, 6, 155, 'Jakarta Utara', '2020-05-01 01:20:40', '2020-05-01 01:20:40');
INSERT INTO `cities` VALUES (45, 6, 189, 'Kepulauan Seribu', '2020-05-01 01:20:40', '2020-05-01 01:20:40');
INSERT INTO `cities` VALUES (46, 7, 77, 'Boalemo', '2020-05-01 01:20:40', '2020-05-01 01:20:40');
INSERT INTO `cities` VALUES (47, 7, 88, 'Bone Bolango', '2020-05-01 01:20:40', '2020-05-01 01:20:40');
INSERT INTO `cities` VALUES (48, 7, 129, 'Gorontalo', '2020-05-01 01:20:40', '2020-05-01 01:20:40');
INSERT INTO `cities` VALUES (49, 7, 130, 'Gorontalo', '2020-05-01 01:20:40', '2020-05-01 01:20:40');
INSERT INTO `cities` VALUES (50, 7, 131, 'Gorontalo Utara', '2020-05-01 01:20:40', '2020-05-01 01:20:40');
INSERT INTO `cities` VALUES (51, 7, 361, 'Pohuwato', '2020-05-01 01:20:40', '2020-05-01 01:20:40');
INSERT INTO `cities` VALUES (52, 8, 50, 'Batang Hari', '2020-05-01 01:20:40', '2020-05-01 01:20:40');
INSERT INTO `cities` VALUES (53, 8, 97, 'Bungo', '2020-05-01 01:20:40', '2020-05-01 01:20:40');
INSERT INTO `cities` VALUES (54, 8, 156, 'Jambi', '2020-05-01 01:20:40', '2020-05-01 01:20:40');
INSERT INTO `cities` VALUES (55, 8, 194, 'Kerinci', '2020-05-01 01:20:40', '2020-05-01 01:20:40');
INSERT INTO `cities` VALUES (56, 8, 280, 'Merangin', '2020-05-01 01:20:40', '2020-05-01 01:20:40');
INSERT INTO `cities` VALUES (57, 8, 293, 'Muaro Jambi', '2020-05-01 01:20:40', '2020-05-01 01:20:40');
INSERT INTO `cities` VALUES (58, 8, 393, 'Sarolangun', '2020-05-01 01:20:40', '2020-05-01 01:20:40');
INSERT INTO `cities` VALUES (59, 8, 442, 'Sungaipenuh', '2020-05-01 01:20:40', '2020-05-01 01:20:40');
INSERT INTO `cities` VALUES (60, 8, 460, 'Tanjung Jabung Barat', '2020-05-01 01:20:40', '2020-05-01 01:20:40');
INSERT INTO `cities` VALUES (61, 8, 461, 'Tanjung Jabung Timur', '2020-05-01 01:20:40', '2020-05-01 01:20:40');
INSERT INTO `cities` VALUES (62, 8, 471, 'Tebo', '2020-05-01 01:20:40', '2020-05-01 01:20:40');
INSERT INTO `cities` VALUES (63, 9, 22, 'Bandung', '2020-05-01 01:20:43', '2020-05-01 01:20:43');
INSERT INTO `cities` VALUES (64, 9, 23, 'Bandung', '2020-05-01 01:20:43', '2020-05-01 01:20:43');
INSERT INTO `cities` VALUES (65, 9, 24, 'Bandung Barat', '2020-05-01 01:20:43', '2020-05-01 01:20:43');
INSERT INTO `cities` VALUES (66, 9, 34, 'Banjar', '2020-05-01 01:20:43', '2020-05-01 01:20:43');
INSERT INTO `cities` VALUES (67, 9, 54, 'Bekasi', '2020-05-01 01:20:43', '2020-05-01 01:20:43');
INSERT INTO `cities` VALUES (68, 9, 55, 'Bekasi', '2020-05-01 01:20:43', '2020-05-01 01:20:43');
INSERT INTO `cities` VALUES (69, 9, 78, 'Bogor', '2020-05-01 01:20:43', '2020-05-01 01:20:43');
INSERT INTO `cities` VALUES (70, 9, 79, 'Bogor', '2020-05-01 01:20:43', '2020-05-01 01:20:43');
INSERT INTO `cities` VALUES (71, 9, 103, 'Ciamis', '2020-05-01 01:20:43', '2020-05-01 01:20:43');
INSERT INTO `cities` VALUES (72, 9, 104, 'Cianjur', '2020-05-01 01:20:43', '2020-05-01 01:20:43');
INSERT INTO `cities` VALUES (73, 9, 107, 'Cimahi', '2020-05-01 01:20:43', '2020-05-01 01:20:43');
INSERT INTO `cities` VALUES (74, 9, 108, 'Cirebon', '2020-05-01 01:20:43', '2020-05-01 01:20:43');
INSERT INTO `cities` VALUES (75, 9, 109, 'Cirebon', '2020-05-01 01:20:43', '2020-05-01 01:20:43');
INSERT INTO `cities` VALUES (76, 9, 115, 'Depok', '2020-05-01 01:20:43', '2020-05-01 01:20:43');
INSERT INTO `cities` VALUES (77, 9, 126, 'Garut', '2020-05-01 01:20:43', '2020-05-01 01:20:43');
INSERT INTO `cities` VALUES (78, 9, 149, 'Indramayu', '2020-05-01 01:20:43', '2020-05-01 01:20:43');
INSERT INTO `cities` VALUES (79, 9, 171, 'Karawang', '2020-05-01 01:20:43', '2020-05-01 01:20:43');
INSERT INTO `cities` VALUES (80, 9, 211, 'Kuningan', '2020-05-01 01:20:43', '2020-05-01 01:20:43');
INSERT INTO `cities` VALUES (81, 9, 252, 'Majalengka', '2020-05-01 01:20:43', '2020-05-01 01:20:43');
INSERT INTO `cities` VALUES (82, 9, 332, 'Pangandaran', '2020-05-01 01:20:43', '2020-05-01 01:20:43');
INSERT INTO `cities` VALUES (83, 9, 376, 'Purwakarta', '2020-05-01 01:20:43', '2020-05-01 01:20:43');
INSERT INTO `cities` VALUES (84, 9, 428, 'Subang', '2020-05-01 01:20:43', '2020-05-01 01:20:43');
INSERT INTO `cities` VALUES (85, 9, 430, 'Sukabumi', '2020-05-01 01:20:43', '2020-05-01 01:20:43');
INSERT INTO `cities` VALUES (86, 9, 431, 'Sukabumi', '2020-05-01 01:20:43', '2020-05-01 01:20:43');
INSERT INTO `cities` VALUES (87, 9, 440, 'Sumedang', '2020-05-01 01:20:43', '2020-05-01 01:20:43');
INSERT INTO `cities` VALUES (88, 9, 468, 'Tasikmalaya', '2020-05-01 01:20:43', '2020-05-01 01:20:43');
INSERT INTO `cities` VALUES (89, 9, 469, 'Tasikmalaya', '2020-05-01 01:20:43', '2020-05-01 01:20:43');
INSERT INTO `cities` VALUES (90, 10, 37, 'Banjarnegara', '2020-05-01 01:20:43', '2020-05-01 01:20:43');
INSERT INTO `cities` VALUES (91, 10, 41, 'Banyumas', '2020-05-01 01:20:43', '2020-05-01 01:20:43');
INSERT INTO `cities` VALUES (92, 10, 49, 'Batang', '2020-05-01 01:20:43', '2020-05-01 01:20:43');
INSERT INTO `cities` VALUES (93, 10, 76, 'Blora', '2020-05-01 01:20:43', '2020-05-01 01:20:43');
INSERT INTO `cities` VALUES (94, 10, 91, 'Boyolali', '2020-05-01 01:20:43', '2020-05-01 01:20:43');
INSERT INTO `cities` VALUES (95, 10, 92, 'Brebes', '2020-05-01 01:20:43', '2020-05-01 01:20:43');
INSERT INTO `cities` VALUES (96, 10, 105, 'Cilacap', '2020-05-01 01:20:43', '2020-05-01 01:20:43');
INSERT INTO `cities` VALUES (97, 10, 113, 'Demak', '2020-05-01 01:20:43', '2020-05-01 01:20:43');
INSERT INTO `cities` VALUES (98, 10, 134, 'Grobogan', '2020-05-01 01:20:43', '2020-05-01 01:20:43');
INSERT INTO `cities` VALUES (99, 10, 163, 'Jepara', '2020-05-01 01:20:43', '2020-05-01 01:20:43');
INSERT INTO `cities` VALUES (100, 10, 169, 'Karanganyar', '2020-05-01 01:20:43', '2020-05-01 01:20:43');
INSERT INTO `cities` VALUES (101, 10, 177, 'Kebumen', '2020-05-01 01:20:43', '2020-05-01 01:20:43');
INSERT INTO `cities` VALUES (102, 10, 181, 'Kendal', '2020-05-01 01:20:43', '2020-05-01 01:20:43');
INSERT INTO `cities` VALUES (103, 10, 196, 'Klaten', '2020-05-01 01:20:43', '2020-05-01 01:20:43');
INSERT INTO `cities` VALUES (104, 10, 209, 'Kudus', '2020-05-01 01:20:43', '2020-05-01 01:20:43');
INSERT INTO `cities` VALUES (105, 10, 249, 'Magelang', '2020-05-01 01:20:43', '2020-05-01 01:20:43');
INSERT INTO `cities` VALUES (106, 10, 250, 'Magelang', '2020-05-01 01:20:43', '2020-05-01 01:20:43');
INSERT INTO `cities` VALUES (107, 10, 344, 'Pati', '2020-05-01 01:20:43', '2020-05-01 01:20:43');
INSERT INTO `cities` VALUES (108, 10, 348, 'Pekalongan', '2020-05-01 01:20:43', '2020-05-01 01:20:43');
INSERT INTO `cities` VALUES (109, 10, 349, 'Pekalongan', '2020-05-01 01:20:43', '2020-05-01 01:20:43');
INSERT INTO `cities` VALUES (110, 10, 352, 'Pemalang', '2020-05-01 01:20:43', '2020-05-01 01:20:43');
INSERT INTO `cities` VALUES (111, 10, 375, 'Purbalingga', '2020-05-01 01:20:43', '2020-05-01 01:20:43');
INSERT INTO `cities` VALUES (112, 10, 377, 'Purworejo', '2020-05-01 01:20:43', '2020-05-01 01:20:43');
INSERT INTO `cities` VALUES (113, 10, 380, 'Rembang', '2020-05-01 01:20:43', '2020-05-01 01:20:43');
INSERT INTO `cities` VALUES (114, 10, 386, 'Salatiga', '2020-05-01 01:20:43', '2020-05-01 01:20:43');
INSERT INTO `cities` VALUES (115, 10, 398, 'Semarang', '2020-05-01 01:20:43', '2020-05-01 01:20:43');
INSERT INTO `cities` VALUES (116, 10, 399, 'Semarang', '2020-05-01 01:20:43', '2020-05-01 01:20:43');
INSERT INTO `cities` VALUES (117, 10, 427, 'Sragen', '2020-05-01 01:20:43', '2020-05-01 01:20:43');
INSERT INTO `cities` VALUES (118, 10, 433, 'Sukoharjo', '2020-05-01 01:20:43', '2020-05-01 01:20:43');
INSERT INTO `cities` VALUES (119, 10, 445, 'Surakarta (Solo)', '2020-05-01 01:20:43', '2020-05-01 01:20:43');
INSERT INTO `cities` VALUES (120, 10, 472, 'Tegal', '2020-05-01 01:20:43', '2020-05-01 01:20:43');
INSERT INTO `cities` VALUES (121, 10, 473, 'Tegal', '2020-05-01 01:20:43', '2020-05-01 01:20:43');
INSERT INTO `cities` VALUES (122, 10, 476, 'Temanggung', '2020-05-01 01:20:43', '2020-05-01 01:20:43');
INSERT INTO `cities` VALUES (123, 10, 497, 'Wonogiri', '2020-05-01 01:20:43', '2020-05-01 01:20:43');
INSERT INTO `cities` VALUES (124, 10, 498, 'Wonosobo', '2020-05-01 01:20:43', '2020-05-01 01:20:43');
INSERT INTO `cities` VALUES (125, 11, 31, 'Bangkalan', '2020-05-01 01:20:44', '2020-05-01 01:20:44');
INSERT INTO `cities` VALUES (126, 11, 42, 'Banyuwangi', '2020-05-01 01:20:44', '2020-05-01 01:20:44');
INSERT INTO `cities` VALUES (127, 11, 51, 'Batu', '2020-05-01 01:20:44', '2020-05-01 01:20:44');
INSERT INTO `cities` VALUES (128, 11, 74, 'Blitar', '2020-05-01 01:20:44', '2020-05-01 01:20:44');
INSERT INTO `cities` VALUES (129, 11, 75, 'Blitar', '2020-05-01 01:20:44', '2020-05-01 01:20:44');
INSERT INTO `cities` VALUES (130, 11, 80, 'Bojonegoro', '2020-05-01 01:20:44', '2020-05-01 01:20:44');
INSERT INTO `cities` VALUES (131, 11, 86, 'Bondowoso', '2020-05-01 01:20:44', '2020-05-01 01:20:44');
INSERT INTO `cities` VALUES (132, 11, 133, 'Gresik', '2020-05-01 01:20:44', '2020-05-01 01:20:44');
INSERT INTO `cities` VALUES (133, 11, 160, 'Jember', '2020-05-01 01:20:44', '2020-05-01 01:20:44');
INSERT INTO `cities` VALUES (134, 11, 164, 'Jombang', '2020-05-01 01:20:44', '2020-05-01 01:20:44');
INSERT INTO `cities` VALUES (135, 11, 178, 'Kediri', '2020-05-01 01:20:44', '2020-05-01 01:20:44');
INSERT INTO `cities` VALUES (136, 11, 179, 'Kediri', '2020-05-01 01:20:44', '2020-05-01 01:20:44');
INSERT INTO `cities` VALUES (137, 11, 222, 'Lamongan', '2020-05-01 01:20:44', '2020-05-01 01:20:44');
INSERT INTO `cities` VALUES (138, 11, 243, 'Lumajang', '2020-05-01 01:20:44', '2020-05-01 01:20:44');
INSERT INTO `cities` VALUES (139, 11, 247, 'Madiun', '2020-05-01 01:20:44', '2020-05-01 01:20:44');
INSERT INTO `cities` VALUES (140, 11, 248, 'Madiun', '2020-05-01 01:20:44', '2020-05-01 01:20:44');
INSERT INTO `cities` VALUES (141, 11, 251, 'Magetan', '2020-05-01 01:20:44', '2020-05-01 01:20:44');
INSERT INTO `cities` VALUES (142, 11, 255, 'Malang', '2020-05-01 01:20:44', '2020-05-01 01:20:44');
INSERT INTO `cities` VALUES (143, 11, 256, 'Malang', '2020-05-01 01:20:44', '2020-05-01 01:20:44');
INSERT INTO `cities` VALUES (144, 11, 289, 'Mojokerto', '2020-05-01 01:20:44', '2020-05-01 01:20:44');
INSERT INTO `cities` VALUES (145, 11, 290, 'Mojokerto', '2020-05-01 01:20:44', '2020-05-01 01:20:44');
INSERT INTO `cities` VALUES (146, 11, 305, 'Nganjuk', '2020-05-01 01:20:44', '2020-05-01 01:20:44');
INSERT INTO `cities` VALUES (147, 11, 306, 'Ngawi', '2020-05-01 01:20:44', '2020-05-01 01:20:44');
INSERT INTO `cities` VALUES (148, 11, 317, 'Pacitan', '2020-05-01 01:20:44', '2020-05-01 01:20:44');
INSERT INTO `cities` VALUES (149, 11, 330, 'Pamekasan', '2020-05-01 01:20:44', '2020-05-01 01:20:44');
INSERT INTO `cities` VALUES (150, 11, 342, 'Pasuruan', '2020-05-01 01:20:44', '2020-05-01 01:20:44');
INSERT INTO `cities` VALUES (151, 11, 343, 'Pasuruan', '2020-05-01 01:20:44', '2020-05-01 01:20:44');
INSERT INTO `cities` VALUES (152, 11, 363, 'Ponorogo', '2020-05-01 01:20:44', '2020-05-01 01:20:44');
INSERT INTO `cities` VALUES (153, 11, 369, 'Probolinggo', '2020-05-01 01:20:44', '2020-05-01 01:20:44');
INSERT INTO `cities` VALUES (154, 11, 370, 'Probolinggo', '2020-05-01 01:20:44', '2020-05-01 01:20:44');
INSERT INTO `cities` VALUES (155, 11, 390, 'Sampang', '2020-05-01 01:20:44', '2020-05-01 01:20:44');
INSERT INTO `cities` VALUES (156, 11, 409, 'Sidoarjo', '2020-05-01 01:20:44', '2020-05-01 01:20:44');
INSERT INTO `cities` VALUES (157, 11, 418, 'Situbondo', '2020-05-01 01:20:44', '2020-05-01 01:20:44');
INSERT INTO `cities` VALUES (158, 11, 441, 'Sumenep', '2020-05-01 01:20:44', '2020-05-01 01:20:44');
INSERT INTO `cities` VALUES (159, 11, 444, 'Surabaya', '2020-05-01 01:20:44', '2020-05-01 01:20:44');
INSERT INTO `cities` VALUES (160, 11, 487, 'Trenggalek', '2020-05-01 01:20:44', '2020-05-01 01:20:44');
INSERT INTO `cities` VALUES (161, 11, 489, 'Tuban', '2020-05-01 01:20:44', '2020-05-01 01:20:44');
INSERT INTO `cities` VALUES (162, 11, 492, 'Tulungagung', '2020-05-01 01:20:44', '2020-05-01 01:20:44');
INSERT INTO `cities` VALUES (163, 12, 61, 'Bengkayang', '2020-05-01 01:20:44', '2020-05-01 01:20:44');
INSERT INTO `cities` VALUES (164, 12, 168, 'Kapuas Hulu', '2020-05-01 01:20:44', '2020-05-01 01:20:44');
INSERT INTO `cities` VALUES (165, 12, 176, 'Kayong Utara', '2020-05-01 01:20:44', '2020-05-01 01:20:44');
INSERT INTO `cities` VALUES (166, 12, 195, 'Ketapang', '2020-05-01 01:20:44', '2020-05-01 01:20:44');
INSERT INTO `cities` VALUES (167, 12, 208, 'Kubu Raya', '2020-05-01 01:20:44', '2020-05-01 01:20:44');
INSERT INTO `cities` VALUES (168, 12, 228, 'Landak', '2020-05-01 01:20:44', '2020-05-01 01:20:44');
INSERT INTO `cities` VALUES (169, 12, 279, 'Melawi', '2020-05-01 01:20:44', '2020-05-01 01:20:44');
INSERT INTO `cities` VALUES (170, 12, 364, 'Pontianak', '2020-05-01 01:20:44', '2020-05-01 01:20:44');
INSERT INTO `cities` VALUES (171, 12, 365, 'Pontianak', '2020-05-01 01:20:44', '2020-05-01 01:20:44');
INSERT INTO `cities` VALUES (172, 12, 388, 'Sambas', '2020-05-01 01:20:44', '2020-05-01 01:20:44');
INSERT INTO `cities` VALUES (173, 12, 391, 'Sanggau', '2020-05-01 01:20:44', '2020-05-01 01:20:44');
INSERT INTO `cities` VALUES (174, 12, 395, 'Sekadau', '2020-05-01 01:20:44', '2020-05-01 01:20:44');
INSERT INTO `cities` VALUES (175, 12, 415, 'Singkawang', '2020-05-01 01:20:44', '2020-05-01 01:20:44');
INSERT INTO `cities` VALUES (176, 12, 417, 'Sintang', '2020-05-01 01:20:44', '2020-05-01 01:20:44');
INSERT INTO `cities` VALUES (177, 13, 18, 'Balangan', '2020-05-01 01:20:45', '2020-05-01 01:20:45');
INSERT INTO `cities` VALUES (178, 13, 33, 'Banjar', '2020-05-01 01:20:45', '2020-05-01 01:20:45');
INSERT INTO `cities` VALUES (179, 13, 35, 'Banjarbaru', '2020-05-01 01:20:45', '2020-05-01 01:20:45');
INSERT INTO `cities` VALUES (180, 13, 36, 'Banjarmasin', '2020-05-01 01:20:45', '2020-05-01 01:20:45');
INSERT INTO `cities` VALUES (181, 13, 43, 'Barito Kuala', '2020-05-01 01:20:45', '2020-05-01 01:20:45');
INSERT INTO `cities` VALUES (182, 13, 143, 'Hulu Sungai Selatan', '2020-05-01 01:20:45', '2020-05-01 01:20:45');
INSERT INTO `cities` VALUES (183, 13, 144, 'Hulu Sungai Tengah', '2020-05-01 01:20:45', '2020-05-01 01:20:45');
INSERT INTO `cities` VALUES (184, 13, 145, 'Hulu Sungai Utara', '2020-05-01 01:20:45', '2020-05-01 01:20:45');
INSERT INTO `cities` VALUES (185, 13, 203, 'Kotabaru', '2020-05-01 01:20:45', '2020-05-01 01:20:45');
INSERT INTO `cities` VALUES (186, 13, 446, 'Tabalong', '2020-05-01 01:20:45', '2020-05-01 01:20:45');
INSERT INTO `cities` VALUES (187, 13, 452, 'Tanah Bumbu', '2020-05-01 01:20:45', '2020-05-01 01:20:45');
INSERT INTO `cities` VALUES (188, 13, 454, 'Tanah Laut', '2020-05-01 01:20:45', '2020-05-01 01:20:45');
INSERT INTO `cities` VALUES (189, 13, 466, 'Tapin', '2020-05-01 01:20:45', '2020-05-01 01:20:45');
INSERT INTO `cities` VALUES (190, 14, 44, 'Barito Selatan', '2020-05-01 01:20:45', '2020-05-01 01:20:45');
INSERT INTO `cities` VALUES (191, 14, 45, 'Barito Timur', '2020-05-01 01:20:45', '2020-05-01 01:20:45');
INSERT INTO `cities` VALUES (192, 14, 46, 'Barito Utara', '2020-05-01 01:20:45', '2020-05-01 01:20:45');
INSERT INTO `cities` VALUES (193, 14, 136, 'Gunung Mas', '2020-05-01 01:20:45', '2020-05-01 01:20:45');
INSERT INTO `cities` VALUES (194, 14, 167, 'Kapuas', '2020-05-01 01:20:45', '2020-05-01 01:20:45');
INSERT INTO `cities` VALUES (195, 14, 174, 'Katingan', '2020-05-01 01:20:45', '2020-05-01 01:20:45');
INSERT INTO `cities` VALUES (196, 14, 205, 'Kotawaringin Barat', '2020-05-01 01:20:45', '2020-05-01 01:20:45');
INSERT INTO `cities` VALUES (197, 14, 206, 'Kotawaringin Timur', '2020-05-01 01:20:45', '2020-05-01 01:20:45');
INSERT INTO `cities` VALUES (198, 14, 221, 'Lamandau', '2020-05-01 01:20:45', '2020-05-01 01:20:45');
INSERT INTO `cities` VALUES (199, 14, 296, 'Murung Raya', '2020-05-01 01:20:45', '2020-05-01 01:20:45');
INSERT INTO `cities` VALUES (200, 14, 326, 'Palangka Raya', '2020-05-01 01:20:45', '2020-05-01 01:20:45');
INSERT INTO `cities` VALUES (201, 14, 371, 'Pulang Pisau', '2020-05-01 01:20:45', '2020-05-01 01:20:45');
INSERT INTO `cities` VALUES (202, 14, 405, 'Seruyan', '2020-05-01 01:20:45', '2020-05-01 01:20:45');
INSERT INTO `cities` VALUES (203, 14, 432, 'Sukamara', '2020-05-01 01:20:45', '2020-05-01 01:20:45');
INSERT INTO `cities` VALUES (204, 15, 19, 'Balikpapan', '2020-05-01 01:20:46', '2020-05-01 01:20:46');
INSERT INTO `cities` VALUES (205, 15, 66, 'Berau', '2020-05-01 01:20:46', '2020-05-01 01:20:46');
INSERT INTO `cities` VALUES (206, 15, 89, 'Bontang', '2020-05-01 01:20:46', '2020-05-01 01:20:46');
INSERT INTO `cities` VALUES (207, 15, 214, 'Kutai Barat', '2020-05-01 01:20:46', '2020-05-01 01:20:46');
INSERT INTO `cities` VALUES (208, 15, 215, 'Kutai Kartanegara', '2020-05-01 01:20:46', '2020-05-01 01:20:46');
INSERT INTO `cities` VALUES (209, 15, 216, 'Kutai Timur', '2020-05-01 01:20:46', '2020-05-01 01:20:46');
INSERT INTO `cities` VALUES (210, 15, 341, 'Paser', '2020-05-01 01:20:46', '2020-05-01 01:20:46');
INSERT INTO `cities` VALUES (211, 15, 354, 'Penajam Paser Utara', '2020-05-01 01:20:46', '2020-05-01 01:20:46');
INSERT INTO `cities` VALUES (212, 15, 387, 'Samarinda', '2020-05-01 01:20:46', '2020-05-01 01:20:46');
INSERT INTO `cities` VALUES (213, 16, 96, 'Bulungan (Bulongan)', '2020-05-01 01:20:46', '2020-05-01 01:20:46');
INSERT INTO `cities` VALUES (214, 16, 257, 'Malinau', '2020-05-01 01:20:46', '2020-05-01 01:20:46');
INSERT INTO `cities` VALUES (215, 16, 311, 'Nunukan', '2020-05-01 01:20:46', '2020-05-01 01:20:46');
INSERT INTO `cities` VALUES (216, 16, 450, 'Tana Tidung', '2020-05-01 01:20:46', '2020-05-01 01:20:46');
INSERT INTO `cities` VALUES (217, 16, 467, 'Tarakan', '2020-05-01 01:20:46', '2020-05-01 01:20:46');
INSERT INTO `cities` VALUES (218, 17, 48, 'Batam', '2020-05-01 01:20:46', '2020-05-01 01:20:46');
INSERT INTO `cities` VALUES (219, 17, 71, 'Bintan', '2020-05-01 01:20:46', '2020-05-01 01:20:46');
INSERT INTO `cities` VALUES (220, 17, 172, 'Karimun', '2020-05-01 01:20:46', '2020-05-01 01:20:46');
INSERT INTO `cities` VALUES (221, 17, 184, 'Kepulauan Anambas', '2020-05-01 01:20:46', '2020-05-01 01:20:46');
INSERT INTO `cities` VALUES (222, 17, 237, 'Lingga', '2020-05-01 01:20:46', '2020-05-01 01:20:46');
INSERT INTO `cities` VALUES (223, 17, 302, 'Natuna', '2020-05-01 01:20:46', '2020-05-01 01:20:46');
INSERT INTO `cities` VALUES (224, 17, 462, 'Tanjung Pinang', '2020-05-01 01:20:46', '2020-05-01 01:20:46');
INSERT INTO `cities` VALUES (225, 18, 21, 'Bandar Lampung', '2020-05-01 01:20:47', '2020-05-01 01:20:47');
INSERT INTO `cities` VALUES (226, 18, 223, 'Lampung Barat', '2020-05-01 01:20:47', '2020-05-01 01:20:47');
INSERT INTO `cities` VALUES (227, 18, 224, 'Lampung Selatan', '2020-05-01 01:20:47', '2020-05-01 01:20:47');
INSERT INTO `cities` VALUES (228, 18, 225, 'Lampung Tengah', '2020-05-01 01:20:47', '2020-05-01 01:20:47');
INSERT INTO `cities` VALUES (229, 18, 226, 'Lampung Timur', '2020-05-01 01:20:47', '2020-05-01 01:20:47');
INSERT INTO `cities` VALUES (230, 18, 227, 'Lampung Utara', '2020-05-01 01:20:47', '2020-05-01 01:20:47');
INSERT INTO `cities` VALUES (231, 18, 282, 'Mesuji', '2020-05-01 01:20:47', '2020-05-01 01:20:47');
INSERT INTO `cities` VALUES (232, 18, 283, 'Metro', '2020-05-01 01:20:47', '2020-05-01 01:20:47');
INSERT INTO `cities` VALUES (233, 18, 355, 'Pesawaran', '2020-05-01 01:20:47', '2020-05-01 01:20:47');
INSERT INTO `cities` VALUES (234, 18, 356, 'Pesisir Barat', '2020-05-01 01:20:47', '2020-05-01 01:20:47');
INSERT INTO `cities` VALUES (235, 18, 368, 'Pringsewu', '2020-05-01 01:20:47', '2020-05-01 01:20:47');
INSERT INTO `cities` VALUES (236, 18, 458, 'Tanggamus', '2020-05-01 01:20:47', '2020-05-01 01:20:47');
INSERT INTO `cities` VALUES (237, 18, 490, 'Tulang Bawang', '2020-05-01 01:20:47', '2020-05-01 01:20:47');
INSERT INTO `cities` VALUES (238, 18, 491, 'Tulang Bawang Barat', '2020-05-01 01:20:47', '2020-05-01 01:20:47');
INSERT INTO `cities` VALUES (239, 18, 496, 'Way Kanan', '2020-05-01 01:20:47', '2020-05-01 01:20:47');
INSERT INTO `cities` VALUES (240, 19, 14, 'Ambon', '2020-05-01 01:20:47', '2020-05-01 01:20:47');
INSERT INTO `cities` VALUES (241, 19, 99, 'Buru', '2020-05-01 01:20:47', '2020-05-01 01:20:47');
INSERT INTO `cities` VALUES (242, 19, 100, 'Buru Selatan', '2020-05-01 01:20:47', '2020-05-01 01:20:47');
INSERT INTO `cities` VALUES (243, 19, 185, 'Kepulauan Aru', '2020-05-01 01:20:47', '2020-05-01 01:20:47');
INSERT INTO `cities` VALUES (244, 19, 258, 'Maluku Barat Daya', '2020-05-01 01:20:47', '2020-05-01 01:20:47');
INSERT INTO `cities` VALUES (245, 19, 259, 'Maluku Tengah', '2020-05-01 01:20:47', '2020-05-01 01:20:47');
INSERT INTO `cities` VALUES (246, 19, 260, 'Maluku Tenggara', '2020-05-01 01:20:47', '2020-05-01 01:20:47');
INSERT INTO `cities` VALUES (247, 19, 261, 'Maluku Tenggara Barat', '2020-05-01 01:20:47', '2020-05-01 01:20:47');
INSERT INTO `cities` VALUES (248, 19, 400, 'Seram Bagian Barat', '2020-05-01 01:20:47', '2020-05-01 01:20:47');
INSERT INTO `cities` VALUES (249, 19, 401, 'Seram Bagian Timur', '2020-05-01 01:20:47', '2020-05-01 01:20:47');
INSERT INTO `cities` VALUES (250, 19, 488, 'Tual', '2020-05-01 01:20:47', '2020-05-01 01:20:47');
INSERT INTO `cities` VALUES (251, 20, 138, 'Halmahera Barat', '2020-05-01 01:20:47', '2020-05-01 01:20:47');
INSERT INTO `cities` VALUES (252, 20, 139, 'Halmahera Selatan', '2020-05-01 01:20:47', '2020-05-01 01:20:47');
INSERT INTO `cities` VALUES (253, 20, 140, 'Halmahera Tengah', '2020-05-01 01:20:47', '2020-05-01 01:20:47');
INSERT INTO `cities` VALUES (254, 20, 141, 'Halmahera Timur', '2020-05-01 01:20:47', '2020-05-01 01:20:47');
INSERT INTO `cities` VALUES (255, 20, 142, 'Halmahera Utara', '2020-05-01 01:20:47', '2020-05-01 01:20:47');
INSERT INTO `cities` VALUES (256, 20, 191, 'Kepulauan Sula', '2020-05-01 01:20:47', '2020-05-01 01:20:47');
INSERT INTO `cities` VALUES (257, 20, 372, 'Pulau Morotai', '2020-05-01 01:20:47', '2020-05-01 01:20:47');
INSERT INTO `cities` VALUES (258, 20, 477, 'Ternate', '2020-05-01 01:20:47', '2020-05-01 01:20:47');
INSERT INTO `cities` VALUES (259, 20, 478, 'Tidore Kepulauan', '2020-05-01 01:20:47', '2020-05-01 01:20:47');
INSERT INTO `cities` VALUES (260, 21, 1, 'Aceh Barat', '2020-05-01 01:20:48', '2020-05-01 01:20:48');
INSERT INTO `cities` VALUES (261, 21, 2, 'Aceh Barat Daya', '2020-05-01 01:20:48', '2020-05-01 01:20:48');
INSERT INTO `cities` VALUES (262, 21, 3, 'Aceh Besar', '2020-05-01 01:20:48', '2020-05-01 01:20:48');
INSERT INTO `cities` VALUES (263, 21, 4, 'Aceh Jaya', '2020-05-01 01:20:48', '2020-05-01 01:20:48');
INSERT INTO `cities` VALUES (264, 21, 5, 'Aceh Selatan', '2020-05-01 01:20:48', '2020-05-01 01:20:48');
INSERT INTO `cities` VALUES (265, 21, 6, 'Aceh Singkil', '2020-05-01 01:20:48', '2020-05-01 01:20:48');
INSERT INTO `cities` VALUES (266, 21, 7, 'Aceh Tamiang', '2020-05-01 01:20:48', '2020-05-01 01:20:48');
INSERT INTO `cities` VALUES (267, 21, 8, 'Aceh Tengah', '2020-05-01 01:20:48', '2020-05-01 01:20:48');
INSERT INTO `cities` VALUES (268, 21, 9, 'Aceh Tenggara', '2020-05-01 01:20:48', '2020-05-01 01:20:48');
INSERT INTO `cities` VALUES (269, 21, 10, 'Aceh Timur', '2020-05-01 01:20:48', '2020-05-01 01:20:48');
INSERT INTO `cities` VALUES (270, 21, 11, 'Aceh Utara', '2020-05-01 01:20:48', '2020-05-01 01:20:48');
INSERT INTO `cities` VALUES (271, 21, 20, 'Banda Aceh', '2020-05-01 01:20:48', '2020-05-01 01:20:48');
INSERT INTO `cities` VALUES (272, 21, 59, 'Bener Meriah', '2020-05-01 01:20:48', '2020-05-01 01:20:48');
INSERT INTO `cities` VALUES (273, 21, 72, 'Bireuen', '2020-05-01 01:20:48', '2020-05-01 01:20:48');
INSERT INTO `cities` VALUES (274, 21, 127, 'Gayo Lues', '2020-05-01 01:20:48', '2020-05-01 01:20:48');
INSERT INTO `cities` VALUES (275, 21, 230, 'Langsa', '2020-05-01 01:20:48', '2020-05-01 01:20:48');
INSERT INTO `cities` VALUES (276, 21, 235, 'Lhokseumawe', '2020-05-01 01:20:48', '2020-05-01 01:20:48');
INSERT INTO `cities` VALUES (277, 21, 300, 'Nagan Raya', '2020-05-01 01:20:48', '2020-05-01 01:20:48');
INSERT INTO `cities` VALUES (278, 21, 358, 'Pidie', '2020-05-01 01:20:48', '2020-05-01 01:20:48');
INSERT INTO `cities` VALUES (279, 21, 359, 'Pidie Jaya', '2020-05-01 01:20:48', '2020-05-01 01:20:48');
INSERT INTO `cities` VALUES (280, 21, 384, 'Sabang', '2020-05-01 01:20:48', '2020-05-01 01:20:48');
INSERT INTO `cities` VALUES (281, 21, 414, 'Simeulue', '2020-05-01 01:20:48', '2020-05-01 01:20:48');
INSERT INTO `cities` VALUES (282, 21, 429, 'Subulussalam', '2020-05-01 01:20:48', '2020-05-01 01:20:48');
INSERT INTO `cities` VALUES (283, 22, 68, 'Bima', '2020-05-01 01:20:48', '2020-05-01 01:20:48');
INSERT INTO `cities` VALUES (284, 22, 69, 'Bima', '2020-05-01 01:20:48', '2020-05-01 01:20:48');
INSERT INTO `cities` VALUES (285, 22, 118, 'Dompu', '2020-05-01 01:20:48', '2020-05-01 01:20:48');
INSERT INTO `cities` VALUES (286, 22, 238, 'Lombok Barat', '2020-05-01 01:20:48', '2020-05-01 01:20:48');
INSERT INTO `cities` VALUES (287, 22, 239, 'Lombok Tengah', '2020-05-01 01:20:48', '2020-05-01 01:20:48');
INSERT INTO `cities` VALUES (288, 22, 240, 'Lombok Timur', '2020-05-01 01:20:48', '2020-05-01 01:20:48');
INSERT INTO `cities` VALUES (289, 22, 241, 'Lombok Utara', '2020-05-01 01:20:48', '2020-05-01 01:20:48');
INSERT INTO `cities` VALUES (290, 22, 276, 'Mataram', '2020-05-01 01:20:48', '2020-05-01 01:20:48');
INSERT INTO `cities` VALUES (291, 22, 438, 'Sumbawa', '2020-05-01 01:20:48', '2020-05-01 01:20:48');
INSERT INTO `cities` VALUES (292, 22, 439, 'Sumbawa Barat', '2020-05-01 01:20:48', '2020-05-01 01:20:48');
INSERT INTO `cities` VALUES (293, 23, 13, 'Alor', '2020-05-01 01:20:49', '2020-05-01 01:20:49');
INSERT INTO `cities` VALUES (294, 23, 58, 'Belu', '2020-05-01 01:20:49', '2020-05-01 01:20:49');
INSERT INTO `cities` VALUES (295, 23, 122, 'Ende', '2020-05-01 01:20:49', '2020-05-01 01:20:49');
INSERT INTO `cities` VALUES (296, 23, 125, 'Flores Timur', '2020-05-01 01:20:49', '2020-05-01 01:20:49');
INSERT INTO `cities` VALUES (297, 23, 212, 'Kupang', '2020-05-01 01:20:49', '2020-05-01 01:20:49');
INSERT INTO `cities` VALUES (298, 23, 213, 'Kupang', '2020-05-01 01:20:49', '2020-05-01 01:20:49');
INSERT INTO `cities` VALUES (299, 23, 234, 'Lembata', '2020-05-01 01:20:49', '2020-05-01 01:20:49');
INSERT INTO `cities` VALUES (300, 23, 269, 'Manggarai', '2020-05-01 01:20:49', '2020-05-01 01:20:49');
INSERT INTO `cities` VALUES (301, 23, 270, 'Manggarai Barat', '2020-05-01 01:20:49', '2020-05-01 01:20:49');
INSERT INTO `cities` VALUES (302, 23, 271, 'Manggarai Timur', '2020-05-01 01:20:49', '2020-05-01 01:20:49');
INSERT INTO `cities` VALUES (303, 23, 301, 'Nagekeo', '2020-05-01 01:20:49', '2020-05-01 01:20:49');
INSERT INTO `cities` VALUES (304, 23, 304, 'Ngada', '2020-05-01 01:20:49', '2020-05-01 01:20:49');
INSERT INTO `cities` VALUES (305, 23, 383, 'Rote Ndao', '2020-05-01 01:20:49', '2020-05-01 01:20:49');
INSERT INTO `cities` VALUES (306, 23, 385, 'Sabu Raijua', '2020-05-01 01:20:49', '2020-05-01 01:20:49');
INSERT INTO `cities` VALUES (307, 23, 412, 'Sikka', '2020-05-01 01:20:49', '2020-05-01 01:20:49');
INSERT INTO `cities` VALUES (308, 23, 434, 'Sumba Barat', '2020-05-01 01:20:49', '2020-05-01 01:20:49');
INSERT INTO `cities` VALUES (309, 23, 435, 'Sumba Barat Daya', '2020-05-01 01:20:49', '2020-05-01 01:20:49');
INSERT INTO `cities` VALUES (310, 23, 436, 'Sumba Tengah', '2020-05-01 01:20:49', '2020-05-01 01:20:49');
INSERT INTO `cities` VALUES (311, 23, 437, 'Sumba Timur', '2020-05-01 01:20:49', '2020-05-01 01:20:49');
INSERT INTO `cities` VALUES (312, 23, 479, 'Timor Tengah Selatan', '2020-05-01 01:20:49', '2020-05-01 01:20:49');
INSERT INTO `cities` VALUES (313, 23, 480, 'Timor Tengah Utara', '2020-05-01 01:20:49', '2020-05-01 01:20:49');
INSERT INTO `cities` VALUES (314, 24, 16, 'Asmat', '2020-05-01 01:20:51', '2020-05-01 01:20:51');
INSERT INTO `cities` VALUES (315, 24, 67, 'Biak Numfor', '2020-05-01 01:20:51', '2020-05-01 01:20:51');
INSERT INTO `cities` VALUES (316, 24, 90, 'Boven Digoel', '2020-05-01 01:20:51', '2020-05-01 01:20:51');
INSERT INTO `cities` VALUES (317, 24, 111, 'Deiyai (Deliyai)', '2020-05-01 01:20:51', '2020-05-01 01:20:51');
INSERT INTO `cities` VALUES (318, 24, 117, 'Dogiyai', '2020-05-01 01:20:51', '2020-05-01 01:20:51');
INSERT INTO `cities` VALUES (319, 24, 150, 'Intan Jaya', '2020-05-01 01:20:51', '2020-05-01 01:20:51');
INSERT INTO `cities` VALUES (320, 24, 157, 'Jayapura', '2020-05-01 01:20:51', '2020-05-01 01:20:51');
INSERT INTO `cities` VALUES (321, 24, 158, 'Jayapura', '2020-05-01 01:20:51', '2020-05-01 01:20:51');
INSERT INTO `cities` VALUES (322, 24, 159, 'Jayawijaya', '2020-05-01 01:20:51', '2020-05-01 01:20:51');
INSERT INTO `cities` VALUES (323, 24, 180, 'Keerom', '2020-05-01 01:20:51', '2020-05-01 01:20:51');
INSERT INTO `cities` VALUES (324, 24, 193, 'Kepulauan Yapen (Yapen Waropen)', '2020-05-01 01:20:51', '2020-05-01 01:20:51');
INSERT INTO `cities` VALUES (325, 24, 231, 'Lanny Jaya', '2020-05-01 01:20:51', '2020-05-01 01:20:51');
INSERT INTO `cities` VALUES (326, 24, 263, 'Mamberamo Raya', '2020-05-01 01:20:51', '2020-05-01 01:20:51');
INSERT INTO `cities` VALUES (327, 24, 264, 'Mamberamo Tengah', '2020-05-01 01:20:51', '2020-05-01 01:20:51');
INSERT INTO `cities` VALUES (328, 24, 274, 'Mappi', '2020-05-01 01:20:51', '2020-05-01 01:20:51');
INSERT INTO `cities` VALUES (329, 24, 281, 'Merauke', '2020-05-01 01:20:51', '2020-05-01 01:20:51');
INSERT INTO `cities` VALUES (330, 24, 284, 'Mimika', '2020-05-01 01:20:51', '2020-05-01 01:20:51');
INSERT INTO `cities` VALUES (331, 24, 299, 'Nabire', '2020-05-01 01:20:51', '2020-05-01 01:20:51');
INSERT INTO `cities` VALUES (332, 24, 303, 'Nduga', '2020-05-01 01:20:51', '2020-05-01 01:20:51');
INSERT INTO `cities` VALUES (333, 24, 335, 'Paniai', '2020-05-01 01:20:51', '2020-05-01 01:20:51');
INSERT INTO `cities` VALUES (334, 24, 347, 'Pegunungan Bintang', '2020-05-01 01:20:51', '2020-05-01 01:20:51');
INSERT INTO `cities` VALUES (335, 24, 373, 'Puncak', '2020-05-01 01:20:51', '2020-05-01 01:20:51');
INSERT INTO `cities` VALUES (336, 24, 374, 'Puncak Jaya', '2020-05-01 01:20:51', '2020-05-01 01:20:51');
INSERT INTO `cities` VALUES (337, 24, 392, 'Sarmi', '2020-05-01 01:20:51', '2020-05-01 01:20:51');
INSERT INTO `cities` VALUES (338, 24, 443, 'Supiori', '2020-05-01 01:20:51', '2020-05-01 01:20:51');
INSERT INTO `cities` VALUES (339, 24, 484, 'Tolikara', '2020-05-01 01:20:51', '2020-05-01 01:20:51');
INSERT INTO `cities` VALUES (340, 24, 495, 'Waropen', '2020-05-01 01:20:51', '2020-05-01 01:20:51');
INSERT INTO `cities` VALUES (341, 24, 499, 'Yahukimo', '2020-05-01 01:20:51', '2020-05-01 01:20:51');
INSERT INTO `cities` VALUES (342, 24, 500, 'Yalimo', '2020-05-01 01:20:51', '2020-05-01 01:20:51');
INSERT INTO `cities` VALUES (343, 25, 124, 'Fakfak', '2020-05-01 01:20:52', '2020-05-01 01:20:52');
INSERT INTO `cities` VALUES (344, 25, 165, 'Kaimana', '2020-05-01 01:20:52', '2020-05-01 01:20:52');
INSERT INTO `cities` VALUES (345, 25, 272, 'Manokwari', '2020-05-01 01:20:52', '2020-05-01 01:20:52');
INSERT INTO `cities` VALUES (346, 25, 273, 'Manokwari Selatan', '2020-05-01 01:20:52', '2020-05-01 01:20:52');
INSERT INTO `cities` VALUES (347, 25, 277, 'Maybrat', '2020-05-01 01:20:52', '2020-05-01 01:20:52');
INSERT INTO `cities` VALUES (348, 25, 346, 'Pegunungan Arfak', '2020-05-01 01:20:52', '2020-05-01 01:20:52');
INSERT INTO `cities` VALUES (349, 25, 378, 'Raja Ampat', '2020-05-01 01:20:52', '2020-05-01 01:20:52');
INSERT INTO `cities` VALUES (350, 25, 424, 'Sorong', '2020-05-01 01:20:52', '2020-05-01 01:20:52');
INSERT INTO `cities` VALUES (351, 25, 425, 'Sorong', '2020-05-01 01:20:52', '2020-05-01 01:20:52');
INSERT INTO `cities` VALUES (352, 25, 426, 'Sorong Selatan', '2020-05-01 01:20:52', '2020-05-01 01:20:52');
INSERT INTO `cities` VALUES (353, 25, 449, 'Tambrauw', '2020-05-01 01:20:52', '2020-05-01 01:20:52');
INSERT INTO `cities` VALUES (354, 25, 474, 'Teluk Bintuni', '2020-05-01 01:20:52', '2020-05-01 01:20:52');
INSERT INTO `cities` VALUES (355, 25, 475, 'Teluk Wondama', '2020-05-01 01:20:52', '2020-05-01 01:20:52');
INSERT INTO `cities` VALUES (356, 26, 60, 'Bengkalis', '2020-05-01 01:20:53', '2020-05-01 01:20:53');
INSERT INTO `cities` VALUES (357, 26, 120, 'Dumai', '2020-05-01 01:20:53', '2020-05-01 01:20:53');
INSERT INTO `cities` VALUES (358, 26, 147, 'Indragiri Hilir', '2020-05-01 01:20:53', '2020-05-01 01:20:53');
INSERT INTO `cities` VALUES (359, 26, 148, 'Indragiri Hulu', '2020-05-01 01:20:53', '2020-05-01 01:20:53');
INSERT INTO `cities` VALUES (360, 26, 166, 'Kampar', '2020-05-01 01:20:53', '2020-05-01 01:20:53');
INSERT INTO `cities` VALUES (361, 26, 187, 'Kepulauan Meranti', '2020-05-01 01:20:53', '2020-05-01 01:20:53');
INSERT INTO `cities` VALUES (362, 26, 207, 'Kuantan Singingi', '2020-05-01 01:20:53', '2020-05-01 01:20:53');
INSERT INTO `cities` VALUES (363, 26, 350, 'Pekanbaru', '2020-05-01 01:20:53', '2020-05-01 01:20:53');
INSERT INTO `cities` VALUES (364, 26, 351, 'Pelalawan', '2020-05-01 01:20:53', '2020-05-01 01:20:53');
INSERT INTO `cities` VALUES (365, 26, 381, 'Rokan Hilir', '2020-05-01 01:20:53', '2020-05-01 01:20:53');
INSERT INTO `cities` VALUES (366, 26, 382, 'Rokan Hulu', '2020-05-01 01:20:53', '2020-05-01 01:20:53');
INSERT INTO `cities` VALUES (367, 26, 406, 'Siak', '2020-05-01 01:20:53', '2020-05-01 01:20:53');
INSERT INTO `cities` VALUES (368, 27, 253, 'Majene', '2020-05-01 01:20:53', '2020-05-01 01:20:53');
INSERT INTO `cities` VALUES (369, 27, 262, 'Mamasa', '2020-05-01 01:20:53', '2020-05-01 01:20:53');
INSERT INTO `cities` VALUES (370, 27, 265, 'Mamuju', '2020-05-01 01:20:53', '2020-05-01 01:20:53');
INSERT INTO `cities` VALUES (371, 27, 266, 'Mamuju Utara', '2020-05-01 01:20:53', '2020-05-01 01:20:53');
INSERT INTO `cities` VALUES (372, 27, 362, 'Polewali Mandar', '2020-05-01 01:20:53', '2020-05-01 01:20:53');
INSERT INTO `cities` VALUES (373, 28, 38, 'Bantaeng', '2020-05-01 01:20:54', '2020-05-01 01:20:54');
INSERT INTO `cities` VALUES (374, 28, 47, 'Barru', '2020-05-01 01:20:54', '2020-05-01 01:20:54');
INSERT INTO `cities` VALUES (375, 28, 87, 'Bone', '2020-05-01 01:20:54', '2020-05-01 01:20:54');
INSERT INTO `cities` VALUES (376, 28, 95, 'Bulukumba', '2020-05-01 01:20:54', '2020-05-01 01:20:54');
INSERT INTO `cities` VALUES (377, 28, 123, 'Enrekang', '2020-05-01 01:20:54', '2020-05-01 01:20:54');
INSERT INTO `cities` VALUES (378, 28, 132, 'Gowa', '2020-05-01 01:20:54', '2020-05-01 01:20:54');
INSERT INTO `cities` VALUES (379, 28, 162, 'Jeneponto', '2020-05-01 01:20:54', '2020-05-01 01:20:54');
INSERT INTO `cities` VALUES (380, 28, 244, 'Luwu', '2020-05-01 01:20:54', '2020-05-01 01:20:54');
INSERT INTO `cities` VALUES (381, 28, 245, 'Luwu Timur', '2020-05-01 01:20:54', '2020-05-01 01:20:54');
INSERT INTO `cities` VALUES (382, 28, 246, 'Luwu Utara', '2020-05-01 01:20:54', '2020-05-01 01:20:54');
INSERT INTO `cities` VALUES (383, 28, 254, 'Makassar', '2020-05-01 01:20:54', '2020-05-01 01:20:54');
INSERT INTO `cities` VALUES (384, 28, 275, 'Maros', '2020-05-01 01:20:54', '2020-05-01 01:20:54');
INSERT INTO `cities` VALUES (385, 28, 328, 'Palopo', '2020-05-01 01:20:54', '2020-05-01 01:20:54');
INSERT INTO `cities` VALUES (386, 28, 333, 'Pangkajene Kepulauan', '2020-05-01 01:20:54', '2020-05-01 01:20:54');
INSERT INTO `cities` VALUES (387, 28, 336, 'Parepare', '2020-05-01 01:20:54', '2020-05-01 01:20:54');
INSERT INTO `cities` VALUES (388, 28, 360, 'Pinrang', '2020-05-01 01:20:54', '2020-05-01 01:20:54');
INSERT INTO `cities` VALUES (389, 28, 396, 'Selayar (Kepulauan Selayar)', '2020-05-01 01:20:54', '2020-05-01 01:20:54');
INSERT INTO `cities` VALUES (390, 28, 408, 'Sidenreng Rappang/Rapang', '2020-05-01 01:20:54', '2020-05-01 01:20:54');
INSERT INTO `cities` VALUES (391, 28, 416, 'Sinjai', '2020-05-01 01:20:54', '2020-05-01 01:20:54');
INSERT INTO `cities` VALUES (392, 28, 423, 'Soppeng', '2020-05-01 01:20:54', '2020-05-01 01:20:54');
INSERT INTO `cities` VALUES (393, 28, 448, 'Takalar', '2020-05-01 01:20:54', '2020-05-01 01:20:54');
INSERT INTO `cities` VALUES (394, 28, 451, 'Tana Toraja', '2020-05-01 01:20:54', '2020-05-01 01:20:54');
INSERT INTO `cities` VALUES (395, 28, 486, 'Toraja Utara', '2020-05-01 01:20:54', '2020-05-01 01:20:54');
INSERT INTO `cities` VALUES (396, 28, 493, 'Wajo', '2020-05-01 01:20:54', '2020-05-01 01:20:54');
INSERT INTO `cities` VALUES (397, 29, 25, 'Banggai', '2020-05-01 01:20:55', '2020-05-01 01:20:55');
INSERT INTO `cities` VALUES (398, 29, 26, 'Banggai Kepulauan', '2020-05-01 01:20:55', '2020-05-01 01:20:55');
INSERT INTO `cities` VALUES (399, 29, 98, 'Buol', '2020-05-01 01:20:55', '2020-05-01 01:20:55');
INSERT INTO `cities` VALUES (400, 29, 119, 'Donggala', '2020-05-01 01:20:55', '2020-05-01 01:20:55');
INSERT INTO `cities` VALUES (401, 29, 291, 'Morowali', '2020-05-01 01:20:55', '2020-05-01 01:20:55');
INSERT INTO `cities` VALUES (402, 29, 329, 'Palu', '2020-05-01 01:20:55', '2020-05-01 01:20:55');
INSERT INTO `cities` VALUES (403, 29, 338, 'Parigi Moutong', '2020-05-01 01:20:55', '2020-05-01 01:20:55');
INSERT INTO `cities` VALUES (404, 29, 366, 'Poso', '2020-05-01 01:20:55', '2020-05-01 01:20:55');
INSERT INTO `cities` VALUES (405, 29, 410, 'Sigi', '2020-05-01 01:20:55', '2020-05-01 01:20:55');
INSERT INTO `cities` VALUES (406, 29, 482, 'Tojo Una-Una', '2020-05-01 01:20:55', '2020-05-01 01:20:55');
INSERT INTO `cities` VALUES (407, 29, 483, 'Toli-Toli', '2020-05-01 01:20:55', '2020-05-01 01:20:55');
INSERT INTO `cities` VALUES (408, 30, 53, 'Bau-Bau', '2020-05-01 01:20:55', '2020-05-01 01:20:55');
INSERT INTO `cities` VALUES (409, 30, 85, 'Bombana', '2020-05-01 01:20:55', '2020-05-01 01:20:55');
INSERT INTO `cities` VALUES (410, 30, 101, 'Buton', '2020-05-01 01:20:55', '2020-05-01 01:20:55');
INSERT INTO `cities` VALUES (411, 30, 102, 'Buton Utara', '2020-05-01 01:20:55', '2020-05-01 01:20:55');
INSERT INTO `cities` VALUES (412, 30, 182, 'Kendari', '2020-05-01 01:20:55', '2020-05-01 01:20:55');
INSERT INTO `cities` VALUES (413, 30, 198, 'Kolaka', '2020-05-01 01:20:55', '2020-05-01 01:20:55');
INSERT INTO `cities` VALUES (414, 30, 199, 'Kolaka Utara', '2020-05-01 01:20:55', '2020-05-01 01:20:55');
INSERT INTO `cities` VALUES (415, 30, 200, 'Konawe', '2020-05-01 01:20:55', '2020-05-01 01:20:55');
INSERT INTO `cities` VALUES (416, 30, 201, 'Konawe Selatan', '2020-05-01 01:20:55', '2020-05-01 01:20:55');
INSERT INTO `cities` VALUES (417, 30, 202, 'Konawe Utara', '2020-05-01 01:20:55', '2020-05-01 01:20:55');
INSERT INTO `cities` VALUES (418, 30, 295, 'Muna', '2020-05-01 01:20:55', '2020-05-01 01:20:55');
INSERT INTO `cities` VALUES (419, 30, 494, 'Wakatobi', '2020-05-01 01:20:55', '2020-05-01 01:20:55');
INSERT INTO `cities` VALUES (420, 31, 73, 'Bitung', '2020-05-01 01:20:56', '2020-05-01 01:20:56');
INSERT INTO `cities` VALUES (421, 31, 81, 'Bolaang Mongondow (Bolmong)', '2020-05-01 01:20:56', '2020-05-01 01:20:56');
INSERT INTO `cities` VALUES (422, 31, 82, 'Bolaang Mongondow Selatan', '2020-05-01 01:20:56', '2020-05-01 01:20:56');
INSERT INTO `cities` VALUES (423, 31, 83, 'Bolaang Mongondow Timur', '2020-05-01 01:20:56', '2020-05-01 01:20:56');
INSERT INTO `cities` VALUES (424, 31, 84, 'Bolaang Mongondow Utara', '2020-05-01 01:20:56', '2020-05-01 01:20:56');
INSERT INTO `cities` VALUES (425, 31, 188, 'Kepulauan Sangihe', '2020-05-01 01:20:56', '2020-05-01 01:20:56');
INSERT INTO `cities` VALUES (426, 31, 190, 'Kepulauan Siau Tagulandang Biaro (Sitaro)', '2020-05-01 01:20:56', '2020-05-01 01:20:56');
INSERT INTO `cities` VALUES (427, 31, 192, 'Kepulauan Talaud', '2020-05-01 01:20:56', '2020-05-01 01:20:56');
INSERT INTO `cities` VALUES (428, 31, 204, 'Kotamobagu', '2020-05-01 01:20:56', '2020-05-01 01:20:56');
INSERT INTO `cities` VALUES (429, 31, 267, 'Manado', '2020-05-01 01:20:56', '2020-05-01 01:20:56');
INSERT INTO `cities` VALUES (430, 31, 285, 'Minahasa', '2020-05-01 01:20:56', '2020-05-01 01:20:56');
INSERT INTO `cities` VALUES (431, 31, 286, 'Minahasa Selatan', '2020-05-01 01:20:56', '2020-05-01 01:20:56');
INSERT INTO `cities` VALUES (432, 31, 287, 'Minahasa Tenggara', '2020-05-01 01:20:56', '2020-05-01 01:20:56');
INSERT INTO `cities` VALUES (433, 31, 288, 'Minahasa Utara', '2020-05-01 01:20:56', '2020-05-01 01:20:56');
INSERT INTO `cities` VALUES (434, 31, 485, 'Tomohon', '2020-05-01 01:20:56', '2020-05-01 01:20:56');
INSERT INTO `cities` VALUES (435, 32, 12, 'Agam', '2020-05-01 01:20:56', '2020-05-01 01:20:56');
INSERT INTO `cities` VALUES (436, 32, 93, 'Bukittinggi', '2020-05-01 01:20:56', '2020-05-01 01:20:56');
INSERT INTO `cities` VALUES (437, 32, 116, 'Dharmasraya', '2020-05-01 01:20:56', '2020-05-01 01:20:56');
INSERT INTO `cities` VALUES (438, 32, 186, 'Kepulauan Mentawai', '2020-05-01 01:20:56', '2020-05-01 01:20:56');
INSERT INTO `cities` VALUES (439, 32, 236, 'Lima Puluh Koto/Kota', '2020-05-01 01:20:56', '2020-05-01 01:20:56');
INSERT INTO `cities` VALUES (440, 32, 318, 'Padang', '2020-05-01 01:20:56', '2020-05-01 01:20:56');
INSERT INTO `cities` VALUES (441, 32, 321, 'Padang Panjang', '2020-05-01 01:20:56', '2020-05-01 01:20:56');
INSERT INTO `cities` VALUES (442, 32, 322, 'Padang Pariaman', '2020-05-01 01:20:56', '2020-05-01 01:20:56');
INSERT INTO `cities` VALUES (443, 32, 337, 'Pariaman', '2020-05-01 01:20:56', '2020-05-01 01:20:56');
INSERT INTO `cities` VALUES (444, 32, 339, 'Pasaman', '2020-05-01 01:20:56', '2020-05-01 01:20:56');
INSERT INTO `cities` VALUES (445, 32, 340, 'Pasaman Barat', '2020-05-01 01:20:56', '2020-05-01 01:20:56');
INSERT INTO `cities` VALUES (446, 32, 345, 'Payakumbuh', '2020-05-01 01:20:56', '2020-05-01 01:20:56');
INSERT INTO `cities` VALUES (447, 32, 357, 'Pesisir Selatan', '2020-05-01 01:20:56', '2020-05-01 01:20:56');
INSERT INTO `cities` VALUES (448, 32, 394, 'Sawah Lunto', '2020-05-01 01:20:56', '2020-05-01 01:20:56');
INSERT INTO `cities` VALUES (449, 32, 411, 'Sijunjung (Sawah Lunto Sijunjung)', '2020-05-01 01:20:56', '2020-05-01 01:20:56');
INSERT INTO `cities` VALUES (450, 32, 420, 'Solok', '2020-05-01 01:20:56', '2020-05-01 01:20:56');
INSERT INTO `cities` VALUES (451, 32, 421, 'Solok', '2020-05-01 01:20:56', '2020-05-01 01:20:56');
INSERT INTO `cities` VALUES (452, 32, 422, 'Solok Selatan', '2020-05-01 01:20:56', '2020-05-01 01:20:56');
INSERT INTO `cities` VALUES (453, 32, 453, 'Tanah Datar', '2020-05-01 01:20:56', '2020-05-01 01:20:56');
INSERT INTO `cities` VALUES (454, 33, 40, 'Banyuasin', '2020-05-01 01:20:56', '2020-05-01 01:20:56');
INSERT INTO `cities` VALUES (455, 33, 121, 'Empat Lawang', '2020-05-01 01:20:56', '2020-05-01 01:20:56');
INSERT INTO `cities` VALUES (456, 33, 220, 'Lahat', '2020-05-01 01:20:56', '2020-05-01 01:20:56');
INSERT INTO `cities` VALUES (457, 33, 242, 'Lubuk Linggau', '2020-05-01 01:20:56', '2020-05-01 01:20:56');
INSERT INTO `cities` VALUES (458, 33, 292, 'Muara Enim', '2020-05-01 01:20:56', '2020-05-01 01:20:56');
INSERT INTO `cities` VALUES (459, 33, 297, 'Musi Banyuasin', '2020-05-01 01:20:56', '2020-05-01 01:20:56');
INSERT INTO `cities` VALUES (460, 33, 298, 'Musi Rawas', '2020-05-01 01:20:56', '2020-05-01 01:20:56');
INSERT INTO `cities` VALUES (461, 33, 312, 'Ogan Ilir', '2020-05-01 01:20:56', '2020-05-01 01:20:56');
INSERT INTO `cities` VALUES (462, 33, 313, 'Ogan Komering Ilir', '2020-05-01 01:20:56', '2020-05-01 01:20:56');
INSERT INTO `cities` VALUES (463, 33, 314, 'Ogan Komering Ulu', '2020-05-01 01:20:56', '2020-05-01 01:20:56');
INSERT INTO `cities` VALUES (464, 33, 315, 'Ogan Komering Ulu Selatan', '2020-05-01 01:20:56', '2020-05-01 01:20:56');
INSERT INTO `cities` VALUES (465, 33, 316, 'Ogan Komering Ulu Timur', '2020-05-01 01:20:56', '2020-05-01 01:20:56');
INSERT INTO `cities` VALUES (466, 33, 324, 'Pagar Alam', '2020-05-01 01:20:56', '2020-05-01 01:20:56');
INSERT INTO `cities` VALUES (467, 33, 327, 'Palembang', '2020-05-01 01:20:56', '2020-05-01 01:20:56');
INSERT INTO `cities` VALUES (468, 33, 367, 'Prabumulih', '2020-05-01 01:20:56', '2020-05-01 01:20:56');
INSERT INTO `cities` VALUES (469, 34, 15, 'Asahan', '2020-05-01 01:20:57', '2020-05-01 01:20:57');
INSERT INTO `cities` VALUES (470, 34, 52, 'Batu Bara', '2020-05-01 01:20:57', '2020-05-01 01:20:57');
INSERT INTO `cities` VALUES (471, 34, 70, 'Binjai', '2020-05-01 01:20:57', '2020-05-01 01:20:57');
INSERT INTO `cities` VALUES (472, 34, 110, 'Dairi', '2020-05-01 01:20:57', '2020-05-01 01:20:57');
INSERT INTO `cities` VALUES (473, 34, 112, 'Deli Serdang', '2020-05-01 01:20:57', '2020-05-01 01:20:57');
INSERT INTO `cities` VALUES (474, 34, 137, 'Gunungsitoli', '2020-05-01 01:20:57', '2020-05-01 01:20:57');
INSERT INTO `cities` VALUES (475, 34, 146, 'Humbang Hasundutan', '2020-05-01 01:20:57', '2020-05-01 01:20:57');
INSERT INTO `cities` VALUES (476, 34, 173, 'Karo', '2020-05-01 01:20:57', '2020-05-01 01:20:57');
INSERT INTO `cities` VALUES (477, 34, 217, 'Labuhan Batu', '2020-05-01 01:20:57', '2020-05-01 01:20:57');
INSERT INTO `cities` VALUES (478, 34, 218, 'Labuhan Batu Selatan', '2020-05-01 01:20:57', '2020-05-01 01:20:57');
INSERT INTO `cities` VALUES (479, 34, 219, 'Labuhan Batu Utara', '2020-05-01 01:20:57', '2020-05-01 01:20:57');
INSERT INTO `cities` VALUES (480, 34, 229, 'Langkat', '2020-05-01 01:20:57', '2020-05-01 01:20:57');
INSERT INTO `cities` VALUES (481, 34, 268, 'Mandailing Natal', '2020-05-01 01:20:57', '2020-05-01 01:20:57');
INSERT INTO `cities` VALUES (482, 34, 278, 'Medan', '2020-05-01 01:20:57', '2020-05-01 01:20:57');
INSERT INTO `cities` VALUES (483, 34, 307, 'Nias', '2020-05-01 01:20:57', '2020-05-01 01:20:57');
INSERT INTO `cities` VALUES (484, 34, 308, 'Nias Barat', '2020-05-01 01:20:57', '2020-05-01 01:20:57');
INSERT INTO `cities` VALUES (485, 34, 309, 'Nias Selatan', '2020-05-01 01:20:57', '2020-05-01 01:20:57');
INSERT INTO `cities` VALUES (486, 34, 310, 'Nias Utara', '2020-05-01 01:20:57', '2020-05-01 01:20:57');
INSERT INTO `cities` VALUES (487, 34, 319, 'Padang Lawas', '2020-05-01 01:20:57', '2020-05-01 01:20:57');
INSERT INTO `cities` VALUES (488, 34, 320, 'Padang Lawas Utara', '2020-05-01 01:20:57', '2020-05-01 01:20:57');
INSERT INTO `cities` VALUES (489, 34, 323, 'Padang Sidempuan', '2020-05-01 01:20:57', '2020-05-01 01:20:57');
INSERT INTO `cities` VALUES (490, 34, 325, 'Pakpak Bharat', '2020-05-01 01:20:57', '2020-05-01 01:20:57');
INSERT INTO `cities` VALUES (491, 34, 353, 'Pematang Siantar', '2020-05-01 01:20:57', '2020-05-01 01:20:57');
INSERT INTO `cities` VALUES (492, 34, 389, 'Samosir', '2020-05-01 01:20:57', '2020-05-01 01:20:57');
INSERT INTO `cities` VALUES (493, 34, 404, 'Serdang Bedagai', '2020-05-01 01:20:57', '2020-05-01 01:20:57');
INSERT INTO `cities` VALUES (494, 34, 407, 'Sibolga', '2020-05-01 01:20:57', '2020-05-01 01:20:57');
INSERT INTO `cities` VALUES (495, 34, 413, 'Simalungun', '2020-05-01 01:20:57', '2020-05-01 01:20:57');
INSERT INTO `cities` VALUES (496, 34, 459, 'Tanjung Balai', '2020-05-01 01:20:57', '2020-05-01 01:20:57');
INSERT INTO `cities` VALUES (497, 34, 463, 'Tapanuli Selatan', '2020-05-01 01:20:57', '2020-05-01 01:20:57');
INSERT INTO `cities` VALUES (498, 34, 464, 'Tapanuli Tengah', '2020-05-01 01:20:57', '2020-05-01 01:20:57');
INSERT INTO `cities` VALUES (499, 34, 465, 'Tapanuli Utara', '2020-05-01 01:20:57', '2020-05-01 01:20:57');
INSERT INTO `cities` VALUES (500, 34, 470, 'Tebing Tinggi', '2020-05-01 01:20:57', '2020-05-01 01:20:57');
INSERT INTO `cities` VALUES (501, 34, 481, 'Toba Samosir', '2020-05-01 01:20:57', '2020-05-01 01:20:57');
COMMIT;

-- ----------------------------
-- Table structure for couriers
-- ----------------------------
DROP TABLE IF EXISTS `couriers`;
CREATE TABLE `couriers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of couriers
-- ----------------------------
BEGIN;
INSERT INTO `couriers` VALUES (1, 'jne', 'JNE', NULL, NULL);
INSERT INTO `couriers` VALUES (2, 'pos', 'POS', NULL, NULL);
INSERT INTO `couriers` VALUES (3, 'tiki', 'TIKI', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for discounts
-- ----------------------------
DROP TABLE IF EXISTS `discounts`;
CREATE TABLE `discounts` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `id_product` int(10) unsigned DEFAULT NULL,
  `percentage` int(3) DEFAULT NULL,
  `start` date DEFAULT NULL,
  `end` date DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_product` (`id_product`),
  CONSTRAINT `discounts_ibfk_1` FOREIGN KEY (`id_product`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of discounts
-- ----------------------------
BEGIN;
INSERT INTO `discounts` VALUES (1, 25, 10, '2020-04-29', '2020-05-08', NULL, NULL, NULL);
INSERT INTO `discounts` VALUES (2, 28, 30, '2020-04-14', '2020-04-29', NULL, '2020-04-29 23:55:28', '2020-04-29 23:55:28');
INSERT INTO `discounts` VALUES (3, 28, 15, '2020-04-30', '2020-05-06', NULL, '2020-04-30 00:02:52', '2020-04-30 06:00:46');
INSERT INTO `discounts` VALUES (4, 36, 30, '2020-06-12', '2020-06-18', NULL, '2020-06-06 03:24:19', '2020-06-06 03:24:44');
COMMIT;

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of migrations
-- ----------------------------
BEGIN;
INSERT INTO `migrations` VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (2, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `migrations` VALUES (3, '2019_02_15_123603_create_admins_table', 1);
INSERT INTO `migrations` VALUES (4, '2019_02_15_123744_create_sellers_table', 1);
INSERT INTO `migrations` VALUES (5, '2019_02_15_125445_create_products_table', 1);
INSERT INTO `migrations` VALUES (6, '2019_02_15_130341_create_product_images_table', 1);
INSERT INTO `migrations` VALUES (7, '2019_02_15_131114_create_transactions_table', 1);
INSERT INTO `migrations` VALUES (8, '2019_02_15_131132_create_transaction_details_table', 1);
INSERT INTO `migrations` VALUES (9, '2019_02_15_132352_create_product_categories_table', 1);
INSERT INTO `migrations` VALUES (10, '2019_02_15_132701_create_carts_table', 1);
INSERT INTO `migrations` VALUES (11, '2019_02_15_134220_create_wishlists_table', 1);
INSERT INTO `migrations` VALUES (12, '2019_02_16_044815_create_rates_table', 1);
INSERT INTO `migrations` VALUES (13, '2019_02_16_045411_create_product_reviews_table', 1);
INSERT INTO `migrations` VALUES (14, '2019_02_16_062504_create_qna_products_table', 1);
INSERT INTO `migrations` VALUES (15, '2019_02_16_063238_create_shopping_voucers_table', 1);
INSERT INTO `migrations` VALUES (16, '2019_02_16_064643_create_couriers_table', 1);
INSERT INTO `migrations` VALUES (17, '2019_02_16_102028_create_notifications_table', 1);
INSERT INTO `migrations` VALUES (18, '2019_02_16_103007_create_seller_notifications_table', 1);
INSERT INTO `migrations` VALUES (19, '2019_02_16_103024_create_user_notifications_table', 1);
INSERT INTO `migrations` VALUES (23, '2020_05_01_003237_create_provinces_table', 2);
INSERT INTO `migrations` VALUES (24, '2020_05_01_003304_create_cities_table', 2);
INSERT INTO `migrations` VALUES (25, '2020_05_01_003935_create_couriers_table', 2);
INSERT INTO `migrations` VALUES (26, '2020_05_20_021858_create_notifications_table', 3);
COMMIT;

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of password_resets
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for product_category_details
-- ----------------------------
DROP TABLE IF EXISTS `product_category_details`;
CREATE TABLE `product_category_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `category_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `product_category_details_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `product_category_details_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of product_category_details
-- ----------------------------
BEGIN;
INSERT INTO `product_category_details` VALUES (1, 25, 1, '2020-04-27 12:32:34', '2020-04-27 12:32:34', NULL);
INSERT INTO `product_category_details` VALUES (2, 26, 1, '2020-04-27 12:49:31', '2020-04-27 12:49:31', NULL);
INSERT INTO `product_category_details` VALUES (3, 27, 6, '2020-04-27 13:35:25', '2020-04-27 13:35:25', NULL);
INSERT INTO `product_category_details` VALUES (4, 28, 7, '2020-04-27 14:00:53', '2020-04-27 14:00:53', NULL);
INSERT INTO `product_category_details` VALUES (5, 29, 6, '2020-05-03 14:53:21', '2020-05-03 14:53:21', NULL);
INSERT INTO `product_category_details` VALUES (6, 30, 5, '2020-05-03 14:59:26', '2020-05-03 14:59:26', NULL);
INSERT INTO `product_category_details` VALUES (7, 31, 7, '2020-05-03 15:01:59', '2020-05-03 15:01:59', NULL);
INSERT INTO `product_category_details` VALUES (8, 32, 1, '2020-05-03 15:04:21', '2020-05-03 15:04:21', NULL);
INSERT INTO `product_category_details` VALUES (9, 33, 2, '2020-05-03 15:10:16', '2020-05-03 15:10:16', NULL);
INSERT INTO `product_category_details` VALUES (10, 34, 1, '2020-05-03 23:19:25', '2020-05-03 15:19:25', '2020-05-03 15:19:25');
INSERT INTO `product_category_details` VALUES (11, 35, 1, '2020-05-03 23:15:43', '2020-05-03 15:15:43', '2020-05-03 15:15:43');
INSERT INTO `product_category_details` VALUES (12, 35, 8, '2020-05-03 15:15:58', '2020-05-03 15:15:58', NULL);
INSERT INTO `product_category_details` VALUES (13, 34, 9, '2020-05-03 15:19:59', '2020-05-03 15:19:59', NULL);
INSERT INTO `product_category_details` VALUES (14, 36, 1, '2020-06-06 03:22:59', '2020-06-06 03:22:59', NULL);
INSERT INTO `product_category_details` VALUES (15, 36, 4, '2020-06-06 03:22:59', '2020-06-06 03:22:59', NULL);
INSERT INTO `product_category_details` VALUES (16, 36, 8, '2020-06-06 03:22:59', '2020-06-06 03:22:59', NULL);
COMMIT;

-- ----------------------------
-- Table structure for product_images
-- ----------------------------
DROP TABLE IF EXISTS `product_images`;
CREATE TABLE `product_images` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `image_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `product_images_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of product_images
-- ----------------------------
BEGIN;
INSERT INTO `product_images` VALUES (1, 25, '1587990795_photo-of-standing-man-posing-with-basketball-hoop-in-the-2513547.jpg', NULL, NULL);
INSERT INTO `product_images` VALUES (2, 26, '1587991784_photo-of-standing-man-posing-while-looking-down-2560894.jpg', NULL, NULL);
INSERT INTO `product_images` VALUES (3, 27, '1587994537_close-up-photo-of-adidas-shoes-1661470.jpg', NULL, NULL);
INSERT INTO `product_images` VALUES (4, 28, '1587996065_person-holding-black-backpack-3731256.jpg', NULL, NULL);
INSERT INTO `product_images` VALUES (5, 28, '1588004576_photo-of-person-carrying-backpack-2452345.jpg', NULL, NULL);
INSERT INTO `product_images` VALUES (6, 29, '1588517635_photo-of-person-wearing-yellow-converse-shoes-3596282.jpg', NULL, NULL);
INSERT INTO `product_images` VALUES (7, 29, '1588517635_white-converse-all-star-high-top-sneakers-3987393.jpg', NULL, NULL);
INSERT INTO `product_images` VALUES (8, 30, '1588517991_woman-wearing-red-dress-standing-on-staircase-1755428.jpg', NULL, NULL);
INSERT INTO `product_images` VALUES (9, 31, '1588518143_boy-in-brown-hoodie-carrying-red-backpack-while-walking-on-207697.jpg', NULL, NULL);
INSERT INTO `product_images` VALUES (10, 32, '1588518278_boy-running-during-sunset-1416736.jpg', NULL, NULL);
INSERT INTO `product_images` VALUES (11, 33, '1588518637_blue-denim-bottoms-1082526.jpg', NULL, NULL);
INSERT INTO `product_images` VALUES (12, 33, '1588518637_woman-leaning-on-railing-2068349.jpg', NULL, NULL);
INSERT INTO `product_images` VALUES (13, 34, '1588518724_boy-wearing-red-brown-and-white-stripe-sweater-running-photo-1104007.jpg', NULL, NULL);
INSERT INTO `product_images` VALUES (14, 35, '1588518831_photo-of-person-holding-eyeglasses-1068866.jpg', NULL, NULL);
INSERT INTO `product_images` VALUES (15, 36, '1591413790_man-wearing-black-hoodie-carries-black-and-gray-backpacker-732632.jpg', NULL, NULL);
INSERT INTO `product_images` VALUES (16, 37, '1592662354_.jpeg', '2020-06-20 14:12:34', '2020-06-20 14:12:34');
INSERT INTO `product_images` VALUES (17, 38, '1592662448_.jpeg', '2020-06-20 14:14:08', '2020-06-20 14:14:08');
COMMIT;

-- ----------------------------
-- Table structure for product_reviews
-- ----------------------------
DROP TABLE IF EXISTS `product_reviews`;
CREATE TABLE `product_reviews` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `transaction_id` int(10) DEFAULT NULL,
  `rate` int(1) NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `rate_id` (`rate`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `product_reviews_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `product_reviews_ibfk_3` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of product_reviews
-- ----------------------------
BEGIN;
INSERT INTO `product_reviews` VALUES (1, 35, 18, 17, 5, 'Kurang Banyak Gan!', NULL, NULL);
INSERT INTO `product_reviews` VALUES (2, 35, 15, 16, 5, 'AYAM', NULL, NULL);
INSERT INTO `product_reviews` VALUES (3, 28, 18, 15, 5, 'Barangnya Bagus', '2020-05-14 16:08:00', '2020-05-14 16:08:00');
INSERT INTO `product_reviews` VALUES (4, 35, 17, 99, 5, 'Mantap Gan', '2020-05-15 10:18:04', NULL);
INSERT INTO `product_reviews` VALUES (5, 28, 18, 14, 4, 'Barangnya Bagus', '2020-05-15 02:43:28', '2020-05-15 02:43:28');
INSERT INTO `product_reviews` VALUES (6, 35, 18, 18, 4, 'Barangnya Bagus saya suka', '2020-05-15 03:26:11', '2020-05-15 03:26:11');
INSERT INTO `product_reviews` VALUES (7, 30, 18, 18, 5, 'Berasa jadi Putri', '2020-05-15 03:26:38', '2020-05-15 03:26:38');
INSERT INTO `product_reviews` VALUES (8, 33, 18, 23, 3, 'ketat', '2020-05-20 16:01:33', '2020-05-20 16:01:33');
INSERT INTO `product_reviews` VALUES (9, 34, 18, 24, 3, 'hangat', '2020-05-21 01:37:13', '2020-05-21 01:37:13');
INSERT INTO `product_reviews` VALUES (10, 35, 18, 27, 4, 'Barangnya Bagus', '2020-06-01 01:43:00', '2020-06-01 01:43:00');
INSERT INTO `product_reviews` VALUES (11, 33, 18, 28, 4, 'Barangnya Bagus', '2020-06-01 13:46:32', '2020-06-01 13:46:32');
INSERT INTO `product_reviews` VALUES (12, 35, 18, 46, 5, 'mantap', '2020-06-19 15:58:13', '2020-06-19 15:58:13');
INSERT INTO `product_reviews` VALUES (13, 35, 18, 47, 5, 'mantap', '2020-06-19 16:09:57', '2020-06-19 16:09:57');
INSERT INTO `product_reviews` VALUES (14, 27, 18, 47, 2, 'mantap', '2020-06-19 16:10:36', '2020-06-19 16:10:36');
INSERT INTO `product_reviews` VALUES (15, 26, 18, 47, 3, 'mantap', '2020-06-19 16:10:44', '2020-06-19 16:10:44');
INSERT INTO `product_reviews` VALUES (16, 29, 18, 65, 4, 'mantap', '2020-06-20 14:55:20', '2020-06-20 14:55:20');
INSERT INTO `product_reviews` VALUES (17, 28, 18, 65, 4, 'mantap', '2020-06-20 15:00:02', '2020-06-20 15:00:02');
INSERT INTO `product_reviews` VALUES (18, 28, 18, 66, 1, 'barangnya bagus', '2020-06-20 15:05:47', '2020-06-20 15:05:47');
COMMIT;

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_rate` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `stock` int(10) DEFAULT NULL,
  `weight` int(3) DEFAULT NULL,
  `category` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of products
-- ----------------------------
BEGIN;
INSERT INTO `products` VALUES (25, 'Baju Kaos Abu', 60000, 'Lembut, sedia segala ukuran', 4.5, '2020-04-27 12:32:34', '2020-04-27 12:32:34', NULL, 10, 200, 'Pria');
INSERT INTO `products` VALUES (26, 'Baju Kaos Pac Man', 120000, 'Sedia Segala Ukuran, Bahan Lembut', 3, '2020-04-27 12:49:31', '2020-06-20 11:18:14', NULL, 2, 200, 'Pria');
INSERT INTO `products` VALUES (27, 'Sepatu Adidas Super Star', 1500000, 'Sepatu Ori, Size 40-50', 2, '2020-04-27 13:35:25', '2020-06-19 16:10:36', NULL, 11, 200, 'Wanita');
INSERT INTO `products` VALUES (28, 'Tas Hitam Cewek Standart', 200000, 'Ringan dan Kuat', 3.5, '2020-04-27 14:00:53', '2020-06-20 15:05:47', NULL, 8, 100, 'Wanita');
INSERT INTO `products` VALUES (29, 'Sepatu Converse', 2000000, 'Orsinil, ukuran 40-45, Nyaman di pakai', 4, '2020-05-03 14:53:21', '2020-06-20 14:55:20', NULL, 8, 1200, 'Wanita');
INSERT INTO `products` VALUES (30, 'Dress Merah Kain', 500000, 'Bahan Kain Sateen, Nyaman di pakai dan tidak panas.', 5, '2020-05-03 14:59:26', '2020-06-20 14:38:56', NULL, 8, 1200, 'Wanita');
INSERT INTO `products` VALUES (31, 'Tas Ransel Anak-anak Sedang', 100000, 'Ringan dan Kuat, Nyaman digunakan oleh anak kecil.', 0, '2020-05-03 15:01:59', '2020-05-25 06:00:24', NULL, 17, 700, 'Anak-Anak');
INSERT INTO `products` VALUES (32, 'Kemeja Anak Kotak-Kotak', 70000, 'Kain Katun, SIze : s, m, l, xl, xxl.', 0, '2020-05-03 15:04:21', '2020-05-03 15:04:21', NULL, 36, 500, 'Anak-Anak');
INSERT INTO `products` VALUES (33, 'Jeans Cewek', 150000, 'Bahan Kuat, Size : M dan L', 3.5, '2020-05-03 15:10:16', '2020-06-01 13:46:32', NULL, 4, 1800, 'Wanita');
INSERT INTO `products` VALUES (34, 'Sweater Anak', 80000, 'Menghangatkan badan, kain lembut.', 3, '2020-05-03 15:11:49', '2020-06-06 03:22:00', NULL, 10, 700, 'Anak-Anak');
INSERT INTO `products` VALUES (35, 'Kacamata Biasa Cowok Stylist', 175000, 'Bisa Buat Kamu makin Ganteng, tidak untuk orang minus atau plus.', 4.7143, '2020-05-03 15:13:37', '2020-06-19 16:09:57', NULL, -1, 200, 'Pria');
INSERT INTO `products` VALUES (36, 'Baju Renang', 150000, 'Anti Lecet', 0, '2020-06-06 03:22:59', '2020-06-06 03:30:20', '2020-06-06 03:30:20', 10, 1, 'Pria');
INSERT INTO `products` VALUES (37, 'Baju Kaos', 150000, 'kain lembut', 3, '2020-06-20 14:12:34', '2020-06-20 14:31:11', '2020-06-20 14:31:11', 100, 200, NULL);
INSERT INTO `products` VALUES (38, 'Baju Kaos Lama', 250000, 'kain kasar', 5, '2020-06-20 14:14:08', '2020-06-20 14:22:46', '2020-06-20 14:22:46', 99, 1000, NULL);
COMMIT;

-- ----------------------------
-- Table structure for provinces
-- ----------------------------
DROP TABLE IF EXISTS `provinces`;
CREATE TABLE `provinces` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `province_id` int(10) unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of provinces
-- ----------------------------
BEGIN;
INSERT INTO `provinces` VALUES (1, 1, 'Bali', '2020-05-01 01:20:35', '2020-05-01 01:20:35');
INSERT INTO `provinces` VALUES (2, 2, 'Bangka Belitung', '2020-05-01 01:20:36', '2020-05-01 01:20:36');
INSERT INTO `provinces` VALUES (3, 3, 'Banten', '2020-05-01 01:20:37', '2020-05-01 01:20:37');
INSERT INTO `provinces` VALUES (4, 4, 'Bengkulu', '2020-05-01 01:20:38', '2020-05-01 01:20:38');
INSERT INTO `provinces` VALUES (5, 5, 'DI Yogyakarta', '2020-05-01 01:20:38', '2020-05-01 01:20:38');
INSERT INTO `provinces` VALUES (6, 6, 'DKI Jakarta', '2020-05-01 01:20:39', '2020-05-01 01:20:39');
INSERT INTO `provinces` VALUES (7, 7, 'Gorontalo', '2020-05-01 01:20:40', '2020-05-01 01:20:40');
INSERT INTO `provinces` VALUES (8, 8, 'Jambi', '2020-05-01 01:20:40', '2020-05-01 01:20:40');
INSERT INTO `provinces` VALUES (9, 9, 'Jawa Barat', '2020-05-01 01:20:40', '2020-05-01 01:20:40');
INSERT INTO `provinces` VALUES (10, 10, 'Jawa Tengah', '2020-05-01 01:20:43', '2020-05-01 01:20:43');
INSERT INTO `provinces` VALUES (11, 11, 'Jawa Timur', '2020-05-01 01:20:43', '2020-05-01 01:20:43');
INSERT INTO `provinces` VALUES (12, 12, 'Kalimantan Barat', '2020-05-01 01:20:44', '2020-05-01 01:20:44');
INSERT INTO `provinces` VALUES (13, 13, 'Kalimantan Selatan', '2020-05-01 01:20:44', '2020-05-01 01:20:44');
INSERT INTO `provinces` VALUES (14, 14, 'Kalimantan Tengah', '2020-05-01 01:20:45', '2020-05-01 01:20:45');
INSERT INTO `provinces` VALUES (15, 15, 'Kalimantan Timur', '2020-05-01 01:20:45', '2020-05-01 01:20:45');
INSERT INTO `provinces` VALUES (16, 16, 'Kalimantan Utara', '2020-05-01 01:20:46', '2020-05-01 01:20:46');
INSERT INTO `provinces` VALUES (17, 17, 'Kepulauan Riau', '2020-05-01 01:20:46', '2020-05-01 01:20:46');
INSERT INTO `provinces` VALUES (18, 18, 'Lampung', '2020-05-01 01:20:46', '2020-05-01 01:20:46');
INSERT INTO `provinces` VALUES (19, 19, 'Maluku', '2020-05-01 01:20:47', '2020-05-01 01:20:47');
INSERT INTO `provinces` VALUES (20, 20, 'Maluku Utara', '2020-05-01 01:20:47', '2020-05-01 01:20:47');
INSERT INTO `provinces` VALUES (21, 21, 'Nanggroe Aceh Darussalam (NAD)', '2020-05-01 01:20:47', '2020-05-01 01:20:47');
INSERT INTO `provinces` VALUES (22, 22, 'Nusa Tenggara Barat (NTB)', '2020-05-01 01:20:48', '2020-05-01 01:20:48');
INSERT INTO `provinces` VALUES (23, 23, 'Nusa Tenggara Timur (NTT)', '2020-05-01 01:20:48', '2020-05-01 01:20:48');
INSERT INTO `provinces` VALUES (24, 24, 'Papua', '2020-05-01 01:20:49', '2020-05-01 01:20:49');
INSERT INTO `provinces` VALUES (25, 25, 'Papua Barat', '2020-05-01 01:20:51', '2020-05-01 01:20:51');
INSERT INTO `provinces` VALUES (26, 26, 'Riau', '2020-05-01 01:20:52', '2020-05-01 01:20:52');
INSERT INTO `provinces` VALUES (27, 27, 'Sulawesi Barat', '2020-05-01 01:20:53', '2020-05-01 01:20:53');
INSERT INTO `provinces` VALUES (28, 28, 'Sulawesi Selatan', '2020-05-01 01:20:53', '2020-05-01 01:20:53');
INSERT INTO `provinces` VALUES (29, 29, 'Sulawesi Tengah', '2020-05-01 01:20:54', '2020-05-01 01:20:54');
INSERT INTO `provinces` VALUES (30, 30, 'Sulawesi Tenggara', '2020-05-01 01:20:55', '2020-05-01 01:20:55');
INSERT INTO `provinces` VALUES (31, 31, 'Sulawesi Utara', '2020-05-01 01:20:55', '2020-05-01 01:20:55');
INSERT INTO `provinces` VALUES (32, 32, 'Sumatera Barat', '2020-05-01 01:20:56', '2020-05-01 01:20:56');
INSERT INTO `provinces` VALUES (33, 33, 'Sumatera Selatan', '2020-05-01 01:20:56', '2020-05-01 01:20:56');
INSERT INTO `provinces` VALUES (34, 34, 'Sumatera Utara', '2020-05-01 01:20:56', '2020-05-01 01:20:56');
COMMIT;

-- ----------------------------
-- Table structure for response
-- ----------------------------
DROP TABLE IF EXISTS `response`;
CREATE TABLE `response` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `review_id` int(10) unsigned NOT NULL,
  `admin_id` int(10) unsigned NOT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `review_id` (`review_id`),
  KEY `admin_id` (`admin_id`),
  CONSTRAINT `response_ibfk_1` FOREIGN KEY (`review_id`) REFERENCES `product_reviews` (`id`),
  CONSTRAINT `response_ibfk_2` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of response
-- ----------------------------
BEGIN;
INSERT INTO `response` VALUES (1, 1, 8, 'Makanya jangan Miskin Bos!!', '2020-05-14 22:15:07', '0000-00-00 00:00:00');
INSERT INTO `response` VALUES (2, 2, 8, 'Terkejut gan?', '2020-05-14 22:40:41', '0000-00-00 00:00:00');
INSERT INTO `response` VALUES (3, 4, 8, 'ya dungs', '2020-05-15 02:23:54', '2020-05-15 02:23:54');
INSERT INTO `response` VALUES (4, 4, 8, 'mulung sana gan', '2020-05-15 02:24:11', '2020-05-15 02:24:11');
INSERT INTO `response` VALUES (5, 4, 8, 'lol', '2020-05-15 02:25:40', '2020-05-15 02:25:40');
INSERT INTO `response` VALUES (6, 2, 8, 'bali gan', '2020-05-15 02:33:48', '2020-05-15 02:33:48');
INSERT INTO `response` VALUES (7, 6, 8, 'Order Lagi Gan', '2020-05-20 04:48:07', '2020-05-20 04:48:07');
INSERT INTO `response` VALUES (8, 6, 8, 'Order Lagi Gan', '2020-05-20 04:48:59', '2020-05-20 04:48:59');
INSERT INTO `response` VALUES (9, 1, 8, 'ya dungs', '2020-05-20 04:49:33', '2020-05-20 04:49:33');
INSERT INTO `response` VALUES (10, 1, 8, 'test', '2020-05-20 04:54:45', '2020-05-20 04:54:45');
INSERT INTO `response` VALUES (11, 2, 8, 'lol', '2020-05-20 04:59:03', '2020-05-20 04:59:03');
INSERT INTO `response` VALUES (12, 1, 8, 'cek', '2020-05-20 05:01:30', '2020-05-20 05:01:30');
INSERT INTO `response` VALUES (13, 7, 6, 'ah masa?', '2020-05-20 05:10:14', '2020-05-20 05:10:14');
INSERT INTO `response` VALUES (14, 7, 6, 'ah masa?', '2020-05-20 05:11:06', '2020-05-20 05:11:06');
INSERT INTO `response` VALUES (15, 6, 6, 'nice', '2020-05-20 05:31:09', '2020-05-20 05:31:09');
INSERT INTO `response` VALUES (16, 1, 6, 'cok', '2020-05-20 05:34:52', '2020-05-20 05:34:52');
INSERT INTO `response` VALUES (17, 1, 6, 'cok', '2020-05-20 05:38:18', '2020-05-20 05:38:18');
INSERT INTO `response` VALUES (18, 1, 6, 'Barangnya Bagus', '2020-05-20 05:38:36', '2020-05-20 05:38:36');
INSERT INTO `response` VALUES (19, 2, 6, 'bebek', '2020-05-20 05:40:19', '2020-05-20 05:40:19');
INSERT INTO `response` VALUES (20, 10, 8, 'ashiap bosku', '2020-06-01 01:44:13', '2020-06-01 01:44:13');
INSERT INTO `response` VALUES (21, 11, 6, 'siap gan', '2020-06-01 13:48:29', '2020-06-01 13:48:29');
COMMIT;

-- ----------------------------
-- Table structure for transaction_details
-- ----------------------------
DROP TABLE IF EXISTS `transaction_details`;
CREATE TABLE `transaction_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `transaction_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `qty` int(11) NOT NULL,
  `discount` int(3) DEFAULT NULL,
  `selling_price` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_transaction` (`transaction_id`),
  KEY `id_product` (`product_id`),
  CONSTRAINT `transaction_details_ibfk_1` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`),
  CONSTRAINT `transaction_details_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of transaction_details
-- ----------------------------
BEGIN;
INSERT INTO `transaction_details` VALUES (1, 9, 28, 2, 0, 200000, '2020-05-01 12:54:17', '2020-05-01 12:54:17');
INSERT INTO `transaction_details` VALUES (2, 9, 26, 1, 0, 120000, '2020-05-01 12:54:17', '2020-05-01 12:54:17');
INSERT INTO `transaction_details` VALUES (3, 9, 27, 1, 0, 1500000, '2020-05-01 12:54:17', '2020-05-01 12:54:17');
INSERT INTO `transaction_details` VALUES (4, 9, 25, 1, 0, 60000, '2020-05-01 12:54:17', '2020-05-01 12:54:17');
INSERT INTO `transaction_details` VALUES (5, 14, 28, 1, 0, 200000, '2020-05-03 07:20:20', '2020-05-03 07:20:20');
INSERT INTO `transaction_details` VALUES (6, 15, 28, 1, 15, 200000, '2020-05-03 07:31:46', '2020-05-03 07:31:46');
INSERT INTO `transaction_details` VALUES (7, 16, 35, 1, 0, 175000, '2020-05-05 13:15:32', '2020-05-05 13:15:32');
INSERT INTO `transaction_details` VALUES (8, 17, 35, 2, 0, 175000, '2020-05-12 03:11:53', '2020-05-12 03:11:53');
INSERT INTO `transaction_details` VALUES (9, 18, 35, 1, 0, 175000, '2020-05-15 03:24:28', '2020-05-15 03:24:28');
INSERT INTO `transaction_details` VALUES (10, 18, 30, 1, 0, 500000, '2020-05-15 03:24:28', '2020-05-15 03:24:28');
INSERT INTO `transaction_details` VALUES (11, 19, 31, 1, 0, 100000, '2020-05-17 03:29:30', '2020-05-17 03:29:30');
INSERT INTO `transaction_details` VALUES (12, 21, 33, 2, 0, 150000, '2020-05-20 05:07:18', '2020-05-20 05:07:18');
INSERT INTO `transaction_details` VALUES (13, 21, 31, 1, 0, 100000, '2020-05-20 05:07:18', '2020-05-20 05:07:18');
INSERT INTO `transaction_details` VALUES (14, 23, 33, 1, 0, 150000, '2020-05-20 16:00:36', '2020-05-20 16:00:36');
INSERT INTO `transaction_details` VALUES (15, 24, 34, 1, 0, 80000, '2020-05-21 01:36:28', '2020-05-21 01:36:28');
INSERT INTO `transaction_details` VALUES (16, 27, 35, 1, 0, 175000, '2020-05-30 06:20:07', '2020-05-30 06:20:07');
INSERT INTO `transaction_details` VALUES (17, 28, 33, 2, 0, 150000, '2020-06-01 13:37:34', '2020-06-01 13:37:34');
INSERT INTO `transaction_details` VALUES (18, 29, 34, 2, 0, 80000, '2020-06-06 03:19:56', '2020-06-06 03:19:56');
INSERT INTO `transaction_details` VALUES (19, 32, 25, 3, 0, 60000, '2020-06-18 15:58:31', '2020-06-18 15:58:31');
INSERT INTO `transaction_details` VALUES (20, 32, 26, 1, 0, 120000, '2020-06-18 15:58:31', '2020-06-18 15:58:31');
INSERT INTO `transaction_details` VALUES (21, 32, 26, 1, 0, 120000, '2020-06-18 15:58:31', '2020-06-18 15:58:31');
INSERT INTO `transaction_details` VALUES (22, 32, 25, 2, 0, 60000, '2020-06-18 15:58:31', '2020-06-18 15:58:31');
INSERT INTO `transaction_details` VALUES (23, 32, 25, 2, 0, 60000, '2020-06-18 15:58:31', '2020-06-18 15:58:31');
INSERT INTO `transaction_details` VALUES (24, 35, 25, 2, 0, 60000, '2020-06-18 16:03:51', '2020-06-18 16:03:51');
INSERT INTO `transaction_details` VALUES (25, 38, 26, 1, 0, 120000, '2020-06-18 16:37:27', '2020-06-18 16:37:27');
INSERT INTO `transaction_details` VALUES (26, 40, 25, 1, 0, 60000, '2020-06-19 09:48:17', '2020-06-19 09:48:17');
INSERT INTO `transaction_details` VALUES (27, 41, 26, 1, 0, 120000, '2020-06-19 10:18:03', '2020-06-19 10:18:03');
INSERT INTO `transaction_details` VALUES (28, 42, 26, 3, 0, 120000, '2020-06-19 10:27:28', '2020-06-19 10:27:28');
INSERT INTO `transaction_details` VALUES (29, 43, 26, 4, 0, 120000, '2020-06-19 10:43:00', '2020-06-19 10:43:00');
INSERT INTO `transaction_details` VALUES (30, 44, 35, 1, 0, 175000, '2020-06-19 13:43:28', '2020-06-19 13:43:28');
INSERT INTO `transaction_details` VALUES (31, 45, 35, 1, 0, 175000, '2020-06-19 14:19:36', '2020-06-19 14:19:36');
INSERT INTO `transaction_details` VALUES (32, 45, 28, 1, 0, 200000, '2020-06-19 14:19:36', '2020-06-19 14:19:36');
INSERT INTO `transaction_details` VALUES (33, 46, 35, 1, 0, 175000, '2020-06-19 15:55:29', '2020-06-19 15:55:29');
INSERT INTO `transaction_details` VALUES (34, 46, 35, 1, 0, 175000, '2020-06-19 15:55:29', '2020-06-19 15:55:29');
INSERT INTO `transaction_details` VALUES (35, 47, 35, 1, 0, 175000, '2020-06-19 15:59:57', '2020-06-19 15:59:57');
INSERT INTO `transaction_details` VALUES (36, 47, 27, 1, 0, 1500000, '2020-06-19 15:59:57', '2020-06-19 15:59:57');
INSERT INTO `transaction_details` VALUES (37, 47, 26, 1, 0, 120000, '2020-06-19 15:59:57', '2020-06-19 15:59:57');
INSERT INTO `transaction_details` VALUES (38, 48, 27, 1, 0, 1500000, '2020-06-19 17:39:54', '2020-06-19 17:39:54');
INSERT INTO `transaction_details` VALUES (39, 49, 26, 1, 0, 120000, '2020-06-20 02:39:01', '2020-06-20 02:39:01');
INSERT INTO `transaction_details` VALUES (40, 50, 26, 3, 0, 120000, '2020-06-20 02:58:35', '2020-06-20 02:58:35');
INSERT INTO `transaction_details` VALUES (41, 51, 26, 4, 0, 120000, '2020-06-20 03:10:24', '2020-06-20 03:10:24');
INSERT INTO `transaction_details` VALUES (42, 52, 26, 1, 0, 120000, '2020-06-20 03:41:12', '2020-06-20 03:41:12');
INSERT INTO `transaction_details` VALUES (43, 53, 26, 1, 0, 120000, '2020-06-20 06:25:35', '2020-06-20 06:25:35');
INSERT INTO `transaction_details` VALUES (44, 54, 35, 3, 0, 175000, '2020-06-20 06:43:32', '2020-06-20 06:43:32');
INSERT INTO `transaction_details` VALUES (45, 55, 27, 1, 0, 1500000, '2020-06-20 06:54:11', '2020-06-20 06:54:11');
INSERT INTO `transaction_details` VALUES (46, 56, 25, 1, 0, 60000, '2020-06-20 06:59:22', '2020-06-20 06:59:22');
INSERT INTO `transaction_details` VALUES (47, 57, 28, 1, 0, 200000, '2020-06-20 07:24:12', '2020-06-20 07:24:12');
INSERT INTO `transaction_details` VALUES (48, 58, 31, 1, 0, 100000, '2020-06-20 08:02:33', '2020-06-20 08:02:33');
INSERT INTO `transaction_details` VALUES (49, 63, 27, 1, 0, 1500000, '2020-06-20 08:27:59', '2020-06-20 08:27:59');
INSERT INTO `transaction_details` VALUES (50, 64, 26, 1, 0, 120000, '2020-06-20 11:15:18', '2020-06-20 11:15:18');
INSERT INTO `transaction_details` VALUES (51, 64, 30, 2, 0, 500000, '2020-06-20 11:15:18', '2020-06-20 11:15:18');
INSERT INTO `transaction_details` VALUES (52, 65, 29, 2, 0, 2000000, '2020-06-20 14:36:32', '2020-06-20 14:36:32');
INSERT INTO `transaction_details` VALUES (53, 65, 28, 2, 0, 200000, '2020-06-20 14:36:32', '2020-06-20 14:36:32');
INSERT INTO `transaction_details` VALUES (54, 65, 30, 1, 0, 500000, '2020-06-20 14:36:32', '2020-06-20 14:36:32');
INSERT INTO `transaction_details` VALUES (55, 66, 28, 1, 0, 200000, '2020-06-20 15:02:39', '2020-06-20 15:02:39');
COMMIT;

-- ----------------------------
-- Table structure for transactions
-- ----------------------------
DROP TABLE IF EXISTS `transactions`;
CREATE TABLE `transactions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `timeout` datetime NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `regency` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `province` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total` double(12,2) NOT NULL,
  `shipping_cost` double(12,2) NOT NULL,
  `sub_total` double(12,2) NOT NULL,
  `user_id` int(20) unsigned NOT NULL,
  `courier_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `proof_of_payment` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` enum('unverified','verified','delivered','success','expired','canceled') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `courier_id` (`courier_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `transactions_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of transactions
-- ----------------------------
BEGIN;
INSERT INTO `transactions` VALUES (9, '2020-05-03 12:18:10', 'Jln Bisma no 6', 'Denpasar', 'Bali', 2025000.00, 11000.00, 2014000.00, 18, 'jne', 'belum dibayar', '2020-05-01 12:54:17', '2020-05-01 12:54:17', 'expired');
INSERT INTO `transactions` VALUES (10, '2020-05-03 12:18:16', 'Jln Bisma no 6', 'Gianyar', 'Bali', 131000.00, 11000.00, 120000.00, 18, 'jne', 'belum dibayar', '2020-05-01 14:33:55', '2020-05-01 14:33:55', 'expired');
INSERT INTO `transactions` VALUES (11, '2020-05-03 12:27:38', 'Jln Bisma no 6', 'Bangli', 'Bali', 4511000.00, 11000.00, 4500000.00, 18, 'jne', 'belum dibayar', '2020-05-01 18:05:18', '2020-05-01 18:05:18', 'success');
INSERT INTO `transactions` VALUES (14, '2020-05-04 16:20:19', 'Jln Bisma no 6', 'Jembrana', 'Bali', 181000.00, 11000.00, 170000.00, 18, 'jne', 'belum dibayar', '2020-05-03 07:20:20', '2020-05-05 13:01:03', 'success');
INSERT INTO `transactions` VALUES (15, '2020-05-04 15:31:46', 'Jln Bisma no 6', 'Buleleng', 'Bali', 184000.00, 14000.00, 170000.00, 18, 'tiki', 'belum dibayar', '2020-05-03 07:31:46', '2020-05-05 12:45:15', 'success');
INSERT INTO `transactions` VALUES (16, '2020-05-06 21:15:32', 'Jln Bisma no 6', 'Denpasar', 'Bali', 186000.00, 11000.00, 175000.00, 18, 'jne', '1588685653_boy-wearing-red-brown-and-white-stripe-sweater-running-photo-1104007.jpg', '2020-05-05 13:15:32', '2020-05-12 03:02:59', 'success');
INSERT INTO `transactions` VALUES (17, '2020-05-13 11:11:53', 'Jln Bisma no 6', 'Kediri', 'Jawa Timur', 369000.00, 19000.00, 350000.00, 18, 'jne', 'belum dibayar', '2020-05-12 03:11:53', '2020-05-12 03:13:30', 'success');
INSERT INTO `transactions` VALUES (18, '2020-05-17 11:31:11', 'jln. Slat Tiga', 'Jambi', 'Jambi', 757000.00, 82000.00, 675000.00, 18, 'jne', '1589513113_man-wearing-black-hoodie-carries-black-and-gray-backpacker-732632.jpg', '2020-05-15 03:24:28', '2020-05-21 01:35:15', 'success');
INSERT INTO `transactions` VALUES (19, '2020-05-17 11:32:40', 'jln. Slat Tiga', 'Denpasar', 'Bali', 111000.00, 11000.00, 100000.00, 18, 'jne', 'belum dibayar', '2020-05-17 03:29:30', '2020-05-25 06:00:23', 'delivered');
INSERT INTO `transactions` VALUES (20, '2020-05-21 13:05:46', 'jln. Slat Tiga', 'Pandeglang', 'Banten', 478000.00, 78000.00, 400000.00, 18, 'jne', 'belum dibayar', '2020-05-20 05:05:46', '2020-05-20 05:05:46', 'unverified');
INSERT INTO `transactions` VALUES (21, '2020-05-21 13:07:17', 'jln. Slat Tiga', 'Pandeglang', 'Banten', 478000.00, 78000.00, 400000.00, 18, 'jne', 'belum dibayar', '2020-05-20 05:07:17', '2020-05-20 05:07:17', 'unverified');
INSERT INTO `transactions` VALUES (22, '2020-05-21 23:58:42', 'jln. Slat Tiga', 'Denpasar', 'Bali', 172000.00, 22000.00, 150000.00, 18, 'jne', 'belum dibayar', '2020-05-20 15:58:42', '2020-05-21 01:34:17', 'success');
INSERT INTO `transactions` VALUES (23, '2020-05-22 00:00:36', 'jln. Slat Tiga', 'Denpasar', 'Bali', 172000.00, 22000.00, 150000.00, 18, 'jne', 'belum dibayar', '2020-05-20 16:00:36', '2020-05-21 01:33:37', 'success');
INSERT INTO `transactions` VALUES (24, '2020-05-22 09:36:28', 'jln. Slat Tiga', 'Belitung Timur', 'Bangka Belitung', 136000.00, 56000.00, 80000.00, 18, 'jne', 'belum dibayar', '2020-05-21 01:36:28', '2020-05-21 01:36:58', 'success');
INSERT INTO `transactions` VALUES (26, '2020-06-01 08:22:35', '', '', '', 1000000.00, 0.00, 0.00, 13, 'jne', NULL, '2020-06-01 08:22:09', NULL, 'success');
INSERT INTO `transactions` VALUES (27, '2020-05-31 14:20:06', 'jln. Slat Tiga', 'Serang', 'Banten', 209000.00, 34000.00, 175000.00, 18, 'jne', 'belum dibayar', '2020-05-30 06:20:06', '2020-06-01 01:42:42', 'success');
INSERT INTO `transactions` VALUES (28, '2020-06-02 21:37:34', 'jln. Slat Tiga', 'Denpasar', 'Bali', 324000.00, 24000.00, 300000.00, 18, 'jne', '1591018751_boy-in-brown-hoodie-carrying-red-backpack-while-walking-on-207697.jpg', '2020-06-01 13:37:34', '2020-06-01 13:46:17', 'success');
INSERT INTO `transactions` VALUES (29, '2020-06-07 11:19:56', 'jln. Slat Tiga', 'Denpasar', 'Bali', 178000.00, 18000.00, 160000.00, 18, 'jne', '1591413645_337743.jpg', '2020-06-06 03:19:56', '2020-06-18 16:49:49', 'canceled');
INSERT INTO `transactions` VALUES (30, '2020-06-19 23:57:08', 'dalung', 'Bangka Tengah', 'Bangka Belitung', 708000.00, 48000.00, 660000.00, 18, 'jne', 'belum dibayar', '2020-06-18 15:57:08', '2020-06-18 15:57:08', 'unverified');
INSERT INTO `transactions` VALUES (31, '2020-06-19 23:57:44', 'dalung', 'Bangka Tengah', 'Bangka Belitung', 708000.00, 48000.00, 660000.00, 18, 'jne', 'belum dibayar', '2020-06-18 15:57:44', '2020-06-18 15:57:44', 'unverified');
INSERT INTO `transactions` VALUES (32, '2020-06-19 23:58:31', 'dalung', 'Bangka Tengah', 'Bangka Belitung', 708000.00, 48000.00, 660000.00, 18, 'jne', 'belum dibayar', '2020-06-18 15:58:31', '2020-06-18 15:58:31', 'unverified');
INSERT INTO `transactions` VALUES (33, '2020-06-19 23:59:55', 'dalung', 'Bengkulu Tengah', 'Bengkulu', 713000.00, 53000.00, 660000.00, 18, 'tiki', 'belum dibayar', '2020-06-18 15:59:55', '2020-06-18 15:59:55', 'unverified');
INSERT INTO `transactions` VALUES (34, '2020-06-20 00:00:52', 'dalung', 'Cilegon', 'Banten', 687500.00, 27500.00, 660000.00, 18, 'pos', 'belum dibayar', '2020-06-18 16:00:52', '2020-06-20 05:37:06', 'verified');
INSERT INTO `transactions` VALUES (35, '2020-06-20 00:03:51', 'dalung', 'Bangka Barat', 'Bangka Belitung', 168000.00, 48000.00, 120000.00, 18, 'jne', '1592574021_Adhi Pratama.jpg', '2020-06-18 16:03:51', '2020-06-19 13:40:21', 'unverified');
INSERT INTO `transactions` VALUES (36, '2020-06-20 00:10:39', 'dalung', 'Bengkulu Tengah', 'Bengkulu', 166000.00, 46000.00, 120000.00, 18, 'pos', 'belum dibayar', '2020-06-18 16:10:39', '2020-06-18 16:10:39', 'unverified');
INSERT INTO `transactions` VALUES (37, '2020-06-20 00:11:38', 'dalung', 'Cilegon', 'Banten', 143000.00, 23000.00, 120000.00, 18, 'jne', '1592497672_S__38158338.jpg', '2020-06-18 16:11:38', '2020-06-18 18:58:23', 'delivered');
INSERT INTO `transactions` VALUES (38, '2020-06-20 00:37:27', 'dalung', 'Bangka Barat', 'Bangka Belitung', 175000.00, 55000.00, 120000.00, 18, 'jne', 'belum dibayar', '2020-06-18 16:37:27', '2020-06-18 18:57:43', 'canceled');
INSERT INTO `transactions` VALUES (39, '2020-06-20 00:38:35', 'dalung', 'Bangli', 'Bali', 132000.00, 12000.00, 120000.00, 18, 'tiki', '1592498333_S__38158338.jpg', '2020-06-18 16:38:35', '2020-06-18 16:49:39', 'verified');
INSERT INTO `transactions` VALUES (40, '2020-06-20 17:48:17', 'dalung', 'Denpasar', 'Bali', 71000.00, 11000.00, 60000.00, 39, 'jne', '1592562555_S__38158338.jpg', '2020-06-19 09:48:17', '2020-06-19 10:29:15', 'unverified');
INSERT INTO `transactions` VALUES (41, '2020-06-20 18:18:03', 'dalung', 'Denpasar', 'Bali', 128500.00, 8500.00, 120000.00, 39, 'pos', 'belum dibayar', '2020-06-19 10:18:03', '2020-06-20 05:40:43', 'delivered');
INSERT INTO `transactions` VALUES (42, '2020-06-20 18:27:28', 'dalung', 'Denpasar', 'Bali', 372000.00, 12000.00, 360000.00, 39, 'jne', 'belum dibayar', '2020-06-19 10:27:28', '2020-06-19 10:32:33', 'verified');
INSERT INTO `transactions` VALUES (43, '2020-06-20 18:43:00', 'dalung', 'Manokwari Selatan', 'Papua Barat', 635000.00, 155000.00, 480000.00, 18, 'jne', '1592571706_S__38158338.jpg', '2020-06-19 10:43:00', '2020-06-19 13:38:04', 'success');
INSERT INTO `transactions` VALUES (44, '2020-06-20 21:43:28', 'dalung', 'Jakarta Selatan', 'DKI Jakarta', 197000.00, 22000.00, 175000.00, 18, 'jne', '1592574233_Adhi Pratama.jpg', '2020-06-19 13:43:28', '2020-06-19 14:12:51', 'success');
INSERT INTO `transactions` VALUES (45, '2020-06-20 22:19:36', 'dalung', 'Mamberamo Tengah', 'Papua', 506000.00, 131000.00, 375000.00, 18, 'jne', 'belum dibayar', '2020-06-19 14:19:36', '2020-06-19 14:57:31', 'canceled');
INSERT INTO `transactions` VALUES (46, '2020-06-20 23:55:29', 'dalung', 'Mamuju', 'Sulawesi Barat', 393000.00, 43000.00, 350000.00, 18, 'jne', '1592582728_S__38158338.jpg', '2020-06-19 15:55:29', '2020-06-20 03:28:15', 'unverified');
INSERT INTO `transactions` VALUES (47, '2020-06-20 23:59:57', 'dalung', 'Biak Numfor', 'Papua', 1917000.00, 122000.00, 1795000.00, 18, 'jne', '1592582413_S__38158338.jpg', '2020-06-19 15:59:57', '2020-06-19 16:06:27', 'success');
INSERT INTO `transactions` VALUES (48, '2020-06-21 01:39:54', 'dalung', 'Bengkulu Tengah', 'Bengkulu', 1546000.00, 46000.00, 1500000.00, 18, 'pos', 'belum dibayar', '2020-06-19 17:39:54', '2020-06-20 05:32:16', 'verified');
INSERT INTO `transactions` VALUES (49, '2020-06-21 10:39:01', 'dalung', 'Denpasar', 'Bali', 132000.00, 12000.00, 120000.00, 18, 'tiki', '1592620912_S__38158338.jpg', '2020-06-20 02:39:01', '2020-06-20 03:24:40', 'canceled');
INSERT INTO `transactions` VALUES (50, '2020-06-21 10:58:35', 'dalung', 'Tana Tidung', 'Kalimantan Utara', 429000.00, 69000.00, 360000.00, 18, 'jne', '1592621929_S__38158338.jpg', '2020-06-20 02:58:35', '2020-06-20 03:14:30', 'delivered');
INSERT INTO `transactions` VALUES (51, '2020-06-21 11:10:24', 'dalung', 'Bengkulu Utara', 'Bengkulu', 532000.00, 52000.00, 480000.00, 18, 'jne', '1592622639_S__38158338.jpg', '2020-06-20 03:10:24', '2020-06-20 03:19:19', 'canceled');
INSERT INTO `transactions` VALUES (52, '2020-06-21 11:41:12', 'dalung', 'Serang', 'Banten', 147500.00, 27500.00, 120000.00, 18, 'pos', '1592624488_S__38158338.jpg', '2020-06-20 03:41:12', '2020-06-20 04:08:36', 'delivered');
INSERT INTO `transactions` VALUES (53, '2020-06-21 14:25:35', 'dalung', 'Bangka Selatan', 'Bangka Belitung', 167000.00, 47000.00, 120000.00, 18, 'pos', '1592634404_S__38158338.jpg', '2020-06-20 06:25:35', '2020-06-20 06:26:44', 'unverified');
INSERT INTO `transactions` VALUES (54, '2020-06-21 14:43:32', 'dalung', 'Banjarbaru', 'Kalimantan Selatan', 566000.00, 41000.00, 525000.00, 18, 'jne', '1592635449_List Lagu Galau Indonesia - List Lagu Galau Indonesia.jpeg', '2020-06-20 06:43:32', '2020-06-20 06:44:09', 'unverified');
INSERT INTO `transactions` VALUES (55, '2020-06-21 14:54:11', 'dalung', 'Bangka Barat', 'Bangka Belitung', 1548000.00, 48000.00, 1500000.00, 18, 'jne', 'belum dibayar', '2020-06-20 06:54:11', '2020-06-20 06:54:11', 'unverified');
INSERT INTO `transactions` VALUES (56, '2020-06-21 14:59:22', 'dalung', 'Denpasar', 'Bali', 60000.00, 0.00, 60000.00, 18, 'jne', '1592636536_messageImage_1590838352444.jpg', '2020-06-20 06:59:22', '2020-06-20 07:02:16', 'unverified');
INSERT INTO `transactions` VALUES (57, '2020-06-21 15:24:12', 'dalung', 'Karangasem', 'Bali', 212000.00, 12000.00, 200000.00, 18, 'jne', '1592640519_messageImage_1590838352444.jpg', '2020-06-20 07:24:12', '2020-06-20 09:18:55', 'delivered');
INSERT INTO `transactions` VALUES (58, '2020-06-21 16:02:33', 'dalung', 'Cilegon', 'Banten', 100000.00, 0.00, 100000.00, 18, 'jne', '1592640183_messageImage_1590838352444.jpg', '2020-06-20 08:02:33', '2020-06-20 08:03:03', 'unverified');
INSERT INTO `transactions` VALUES (59, '2020-06-21 16:23:02', 'dalung', 'Bangka Barat', 'Bangka Belitung', 1548000.00, 48000.00, 1500000.00, 18, 'jne', 'belum dibayar', '2020-06-20 08:23:02', '2020-06-20 08:23:02', 'unverified');
INSERT INTO `transactions` VALUES (60, '2020-06-21 16:23:30', 'dalung', 'Bangka Barat', 'Bangka Belitung', 1548000.00, 48000.00, 1500000.00, 18, 'jne', 'belum dibayar', '2020-06-20 08:23:30', '2020-06-20 08:23:30', 'unverified');
INSERT INTO `transactions` VALUES (61, '2020-06-21 16:24:27', 'dalung', 'Bangka Barat', 'Bangka Belitung', 1548000.00, 48000.00, 1500000.00, 18, 'jne', 'belum dibayar', '2020-06-20 08:24:27', '2020-06-20 08:24:27', 'unverified');
INSERT INTO `transactions` VALUES (62, '2020-06-21 16:25:27', 'dalung', 'Bangka Barat', 'Bangka Belitung', 1548000.00, 48000.00, 1500000.00, 18, 'jne', 'belum dibayar', '2020-06-20 08:25:27', '2020-06-20 09:17:16', 'delivered');
INSERT INTO `transactions` VALUES (63, '2020-06-21 16:27:59', 'dalung', 'Bangka Barat', 'Bangka Belitung', 1548000.00, 48000.00, 1500000.00, 18, 'jne', 'belum dibayar', '2020-06-20 08:27:59', '2020-06-20 09:14:17', 'delivered');
INSERT INTO `transactions` VALUES (64, '2020-06-21 19:15:18', 'dalung', 'Sidoarjo', 'Jawa Timur', 1158000.00, 38000.00, 1120000.00, 18, 'jne', '1592651740_messageImage_1590838352444.jpg', '2020-06-20 11:15:18', '2020-06-20 11:19:05', 'success');
INSERT INTO `transactions` VALUES (65, '2020-06-21 22:36:32', 'dalung', 'Bangka Selatan', 'Bangka Belitung', 5044000.00, 144000.00, 4900000.00, 18, 'jne', '1592663821_S__38158338.jpg', '2020-06-20 14:36:32', '2020-06-20 14:40:13', 'success');
INSERT INTO `transactions` VALUES (66, '2020-06-21 23:02:39', 'dalung', 'Bangli', 'Bali', 211000.00, 11000.00, 200000.00, 18, 'jne', '1592665436_S__38158338.jpg', '2020-06-20 15:02:39', '2020-06-20 15:05:32', 'success');
COMMIT;

-- ----------------------------
-- Table structure for user_notifications
-- ----------------------------
DROP TABLE IF EXISTS `user_notifications`;
CREATE TABLE `user_notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` int(11) unsigned NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`),
  KEY `notifiable_id` (`notifiable_id`),
  CONSTRAINT `user_notifications_ibfk_1` FOREIGN KEY (`notifiable_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of user_notifications
-- ----------------------------
BEGIN;
INSERT INTO `user_notifications` VALUES ('1da053b2-d297-4346-9871-161757b95351', 'App\\Notifications\\UserNotification', 'App\\User', 18, '<a href =\'/users/invoice/65\'>Status Transaksimu dengan id 65 telah diupdate</a>', NULL, '2020-06-20 14:38:56', '2020-06-20 14:38:56');
INSERT INTO `user_notifications` VALUES ('7bc56540-70df-43a3-a6d7-6110573fb6e6', 'App\\Notifications\\UserNotification', 'App\\User', 18, '<a href =\'/users/invoice/64\'>Status Transaksimu dengan id 64 telah diupdate</a>', NULL, '2020-06-20 11:18:14', '2020-06-20 11:18:14');
INSERT INTO `user_notifications` VALUES ('81bd7e6e-5309-432a-8831-d720b84e18f3', 'App\\Notifications\\UserNotification', 'App\\User', 18, '<a href =\'/users/invoice/66\'>Status Transaksimu dengan id 66 telah diupdate</a>', NULL, '2020-06-20 15:04:40', '2020-06-20 15:04:40');
INSERT INTO `user_notifications` VALUES ('ca14acb4-3ba9-4c51-a28b-23718e1463dc', 'App\\Notifications\\UserNotification', 'App\\User', 18, '<a href =\'/users/invoice/57\'>Status Transaksimu dengan id 57 telah diupdate</a>', NULL, '2020-06-20 09:18:55', '2020-06-20 09:18:55');
COMMIT;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `profile_image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
BEGIN;
INSERT INTO `users` VALUES (13, 'jack', 'jack12345@gmail.com', 'image/profile default.jpg', 'belum verif', NULL, '$2y$10$3sTVBm0G2c1bZOSMUkLwTuDvRei1BY3jWAeMDcpMpg9SnFnTJ7Uxi', NULL, '2020-03-29 12:18:27', '2020-03-29 12:18:27');
INSERT INTO `users` VALUES (14, 'I Gede Aldi Wahyudi', 'aldirelover@gmail.com', 'image/profile default.jpg', 'belum verif', '2020-03-29 15:50:08', '$2y$10$9b8T.L4pz0QHNJYjaKEUT.iFvDSra428TwJXK/x1axXzImzMBF3I6', NULL, '2020-03-29 12:19:07', '2020-03-29 15:50:08');
INSERT INTO `users` VALUES (15, 'Arya Putra', 'ayam@gmail.com', 'image/profile default.jpg', 'belum verif', NULL, '$2y$10$m77py1VBZfKaFEM1Lxhqyu6cpdFYs7Kygi2gDXDI5c6abR7ZlbjcG', NULL, '2020-03-29 12:35:08', '2020-03-29 12:35:08');
INSERT INTO `users` VALUES (16, 'I Gede Aldi Wahyudi', 'aldi@gmail.com', 'default image', '0', '2020-03-29 13:22:28', '$2y$10$pyhxIbHuOO9NlqOBJifPa.WOzneKRw/VZTQZ0tQ95REF6J7oPO.2a', NULL, '2020-03-29 13:21:49', '2020-03-29 13:22:28');
INSERT INTO `users` VALUES (17, 'widiana', 'widiana@me.com', 'default image', '0', '2020-03-30 13:34:45', '$2y$10$LCd4EeRyPH9mYCDt8B3xAe.jvHSL.yFVj5DgwwI6dUEu1QGfc0g6C', NULL, '2020-03-30 13:32:44', '2020-03-30 13:34:45');
INSERT INTO `users` VALUES (18, 'Buchik', 'buchik@gmail.com', 'assets/User/images/avds_small.jpg', 'Sudah Terdaftar', '2020-04-23 11:49:04', '$2y$10$ykcYlaPlO5VNnVN.4rqgIexni8VIpgUaArhE6mziQ0HKVillaeS7e', NULL, '2020-04-23 11:46:35', '2020-04-23 11:49:04');
INSERT INTO `users` VALUES (19, 'Jack Muller', 'jackmuller@gmail.com', 'assets/User/images/avds_small.jpg', 'Sudah Terdaftar', '2020-05-30 06:51:35', '$2y$10$uTcR6Ml3Fauo3BCas792p.PN.Rqh38eKx.E4l8BfVEucsdFhTJiS2', NULL, '2020-05-30 06:45:59', '2020-05-30 06:51:35');
INSERT INTO `users` VALUES (20, 'Vigor', 'vigor@gmail.com', 'assets/User/images/avds_small.jpg', 'Sudah Terdaftar', '2020-06-01 01:39:34', '$2y$10$kAsWEyiZANEElXfoP3ulPOL.CCcTz89TzGc83GKyVbJnj8HTeF6/.', NULL, '2020-06-01 01:38:50', '2020-06-01 01:39:34');
INSERT INTO `users` VALUES (21, 'lolita', 'loli@gmail.com', 'assets/User/images/avds_small.jpg', 'Sudah Terdaftar', '2020-06-05 14:19:08', '$2y$10$VIoVn3zVQTWoNGkRbmH2m.2cgYOIIrbl3F0nBFu3bx4VJPUNdqigq', NULL, '2020-06-05 14:17:19', '2020-06-05 14:19:08');
INSERT INTO `users` VALUES (22, 'Lennia', 'lennia@gmail.com', 'assets/User/images/avds_small.jpg', 'Sudah Terdaftar', '2020-06-05 14:27:52', '$2y$10$hK/deuLxJ1MYnmnMFun1/eZ7burlu1XhfumOif67RsnloMQfWU7mW', NULL, '2020-06-05 14:27:36', '2020-06-05 14:27:52');
INSERT INTO `users` VALUES (23, 'test1', 'test1@gmail.com', 'assets/User/images/avds_small.jpg', 'Sudah Terdaftar', '2020-06-05 14:30:59', '$2y$10$phgWl4/tWHq4Ik5GESdHGuH94HeBCyUZCE0tmmlwGQPt.YMuxZ.Di', NULL, '2020-06-05 14:30:09', '2020-06-05 14:30:59');
INSERT INTO `users` VALUES (24, 'test2', 'test2@gmail.com', 'assets/User/images/avds_small.jpg', 'Sudah Terdaftar', NULL, '$2y$10$MFEXqgeKhIdaCPygItGQQ.vPJkj594yFBKEdyYV9/utPAD/ywCUIy', NULL, '2020-06-05 14:33:38', '2020-06-05 14:33:38');
INSERT INTO `users` VALUES (25, 'test3', 'test3@gmail.com', 'assets/User/images/avds_small.jpg', 'Sudah Terdaftar', NULL, '$2y$10$jxJBVK6.LZu09B2n1Q28mecWvIfPqfaEu9TJvY3BV7zVUtlr6IEk2', NULL, '2020-06-05 14:35:14', '2020-06-05 14:35:14');
INSERT INTO `users` VALUES (26, 'test4', 'test4@gmail.com', 'assets/User/images/avds_small.jpg', 'Sudah Terdaftar', NULL, '$2y$10$rqxhcy3kUqGAHGal6N0EVO4Cavn892FiXSu4ZDGbqA1seaLi2TH86', NULL, '2020-06-05 14:36:40', '2020-06-05 14:36:40');
INSERT INTO `users` VALUES (27, 'test5', 'test5@gmail.com', 'assets/User/images/avds_small.jpg', 'Sudah Terdaftar', NULL, '$2y$10$xKGglcE/Li37ZV.b4X9RSOl84gd7p4m11lYkRMFVGO0tfHi7x2.zq', NULL, '2020-06-05 14:37:40', '2020-06-05 14:37:40');
INSERT INTO `users` VALUES (28, 'I Gede Aldi Wahyudi', 'test6@gmail.com', 'assets/User/images/avds_small.jpg', 'Sudah Terdaftar', NULL, '$2y$10$XTX8WDq0LyXgMh6YUxgvzuRj9907QGgDtjTon.UK.GO4sdQsaVlmC', NULL, '2020-06-05 14:40:24', '2020-06-05 14:40:24');
INSERT INTO `users` VALUES (29, 'I Gede Aldi Wahyudi', 'test7@gmail.com', 'assets/User/images/avds_small.jpg', 'Sudah Terdaftar', NULL, '$2y$10$8Rdl4.eytMfk5EIXYP9IVelCXDC2AgCXtr2Tami.mnqkEjL0qREzm', NULL, '2020-06-05 14:42:38', '2020-06-05 14:42:38');
INSERT INTO `users` VALUES (30, 'I Gede Aldi Wahyudi', 'test8@gmail.com', 'assets/User/images/avds_small.jpg', 'Sudah Terdaftar', '2020-06-05 14:45:40', '$2y$10$UZM7tnHDG1VXlJhDPZeDAuXDkJv6Ny1zT4Qd3Ngpti.NNIFLYHlBS', NULL, '2020-06-05 14:45:25', '2020-06-05 14:45:41');
INSERT INTO `users` VALUES (31, 'I Gede Aldi Wahyudi', 'test9@gmail.com', 'assets/User/images/avds_small.jpg', 'Sudah Terdaftar', '2020-06-05 14:47:17', '$2y$10$lYJ1pRqaerDnzu8ObZeXEenrj/S0bauwxOquXP0rkR4CthJ1DxFAK', NULL, '2020-06-05 14:47:05', '2020-06-05 14:47:17');
INSERT INTO `users` VALUES (32, 'I Gede Aldi Wahyudi', 'test11@gmail.com', 'assets/User/images/avds_small.jpg', 'Sudah Terdaftar', '2020-06-05 14:51:37', '$2y$10$dgnhTjgojCfZ.1riG1G37OxfX7iWiGZhRPKEpdbe6Z8aftEgdGTfy', NULL, '2020-06-05 14:51:21', '2020-06-05 14:51:37');
INSERT INTO `users` VALUES (33, 'I Gede Aldi Wahyudi', 'test12@gmail.com', 'assets/User/images/avds_small.jpg', 'Sudah Terdaftar', '2020-06-05 14:54:24', '$2y$10$bf6vwaiHkqj53LNxBng1quHspI.pC/eX8bAeDnFfGGD7E4vChWE16', NULL, '2020-06-05 14:54:12', '2020-06-05 14:54:24');
INSERT INTO `users` VALUES (34, 'I Gede Aldi Wahyudi', 'test13@gmail.com', 'assets/User/images/avds_small.jpg', 'Sudah Terdaftar', '2020-06-05 14:56:56', '$2y$10$l9IxvOQOpk.mP3uStl/coen5FUnPZutJ/shIp20unhZY/KzTVBH2u', NULL, '2020-06-05 14:56:43', '2020-06-05 14:56:56');
INSERT INTO `users` VALUES (35, 'I Gede Aldi Wahyudi', 'test16@gmail.com', 'assets/User/images/avds_small.jpg', 'Sudah Terdaftar', '2020-06-05 15:04:02', '$2y$10$KsQ7d8cRZ9JyRKK3d47Nv.w8Aj/poq9MXdOo7DJSyy0MiIgVKiMoa', NULL, '2020-06-05 15:03:50', '2020-06-05 15:04:02');
INSERT INTO `users` VALUES (36, 'I Gede Aldi Wahyudi', 'putradarma1111@gmail.com', 'assets/User/images/avds_small.jpg', 'Sudah Terdaftar', '2020-06-05 15:06:06', '$2y$10$rzyOQ34pqzDZZg0kb4Ii6uQrmhn14JeTvlyvmQ5PgOqJxqgdCcAjO', NULL, '2020-06-05 15:05:52', '2020-06-05 15:06:06');
INSERT INTO `users` VALUES (37, 'I Gede Aldi Wahyudi', 'test17@gmail.com', 'assets/User/images/avds_small.jpg', 'Sudah Terdaftar', '2020-06-05 15:08:01', '$2y$10$3sDFK5yt2OfmYhBNsSpFuuKVvwhStup4zsmtO83pBrk2jR34cMSC.', NULL, '2020-06-05 15:07:48', '2020-06-05 15:08:01');
INSERT INTO `users` VALUES (38, 'jack', 'test18@gmail.com', 'assets/User/images/avds_small.jpg', 'Sudah Terdaftar', '2020-06-05 15:12:03', '$2y$10$AgLu.RjupPEOA7J6D5kxOOW3q84kUukltSxunDel3fT0M5WlFsrv6', NULL, '2020-06-05 15:11:50', '2020-06-05 15:12:03');
INSERT INTO `users` VALUES (39, 'Buchik', 'buchik.adhi@student.unud.ac.id', 'assets/User/images/avds_small.jpg', 'Sudah Terdaftar', NULL, '$2y$10$ORxMLVSjiyUi58T9FKHvVeaAJs7poJJMi3hSg3NWyz7iojC51ttSW', NULL, '2020-06-19 08:57:25', '2020-06-19 08:57:25');
INSERT INTO `users` VALUES (40, 'Try Wiguna', 'trywiguna@gmail.com', 'kosong', 'Active', NULL, '$2y$10$a76hQVZjz7HIzM1YnYQsXu24/rbiu6/.gt1NVcHiN0FfXmt0Dk2.q', NULL, '2020-06-20 14:05:53', '2020-06-20 14:05:53');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
