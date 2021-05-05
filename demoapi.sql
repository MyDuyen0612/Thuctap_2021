-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 05, 2021 at 01:53 PM
-- Server version: 8.0.21
-- PHP Version: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `demoapi`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `category_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `url`, `created_at`, `updated_at`) VALUES
(1, 'Áo thun', 'ao-thun', '2021-04-29 07:43:20', '2021-04-29 07:43:20'),
(2, 'Áo sơ mi', 'ao-so-mi', '2021-04-29 07:43:40', '2021-04-29 07:43:40'),
(3, 'Áo khoác', 'ao-khoac', '2021-04-30 03:14:04', '2021-04-30 03:14:04'),
(4, 'Quần short', 'quan-short', '2021-04-30 03:16:02', '2021-04-30 03:16:02'),
(5, 'Quần jogger', 'quan-jogger', '2021-04-30 07:17:52', '2021-04-30 07:17:52');

-- --------------------------------------------------------

--
-- Table structure for table `color`
--

DROP TABLE IF EXISTS `color`;
CREATE TABLE IF NOT EXISTS `color` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `urlimg` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `color_product_id_foreign` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `color`
--

INSERT INTO `color` (`id`, `name`, `code`, `image`, `urlimg`, `created_at`, `updated_at`, `product_id`) VALUES
(1, 'Xanh', '#2492c2', 'ao-somi-m2sxanh.jpg', 'http://127.0.0.1:8000/image/product/ao-somi-m2sxanh.jpg', '2021-04-30 03:11:33', '2021-04-30 03:11:33', 1),
(2, 'Xanh', '#5deed6', 'ao-somi-m2smxanh.jpg', 'http://127.0.0.1:8000/image/product/ao-somi-m2smxanh.jpg', '2021-04-30 03:12:19', '2021-04-30 03:12:19', 2),
(3, 'Đen', '#000000', 'ao-thun-u1den.gif', 'http://127.0.0.1:8000/image/product/ao-thun-u1den.gif', '2021-04-30 03:13:39', '2021-04-30 03:13:39', 3),
(4, 'Trắng', '#fcfcfc', 'ao-thun-u1trang.gif', 'http://127.0.0.1:8000/image/product/ao-thun-u1trang.gif', '2021-04-30 03:13:39', '2021-04-30 03:13:39', 3),
(5, 'Đen', '#000000', 'ao-khoac-ttden.jpg', 'http://127.0.0.1:8000/image/product/ao-khoac-ttden.jpg', '2021-04-30 03:15:37', '2021-04-30 03:15:37', 4),
(7, 'Trắng', '#f7f3f3', 'quan-short-m2sthtrang.jpg', 'http://127.0.0.1:8000/image/product/quan-short-m2sthtrang.jpg', '2021-04-30 03:19:17', '2021-04-30 03:19:17', 6),
(8, 'Đen', '#000000', 'quan-short-m2sthden.jpg', 'http://127.0.0.1:8000/image/product/quan-short-m2sthden.jpg', '2021-04-30 03:19:18', '2021-04-30 03:19:18', 6),
(9, 'Đen', '#000000', 'quan-jogger-m1qden.jpg', 'http://127.0.0.1:8000/image/product/quan-jogger-m1qden.jpg', '2021-04-30 07:19:14', '2021-04-30 07:19:14', 7),
(10, 'Xanh đen', '#0a3816', 'quan-jogger-m1qxanh-den.jpg', 'http://127.0.0.1:8000/image/product/quan-jogger-m1qxanh-den.jpg', '2021-04-30 07:19:14', '2021-04-30 07:19:14', 7);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

DROP TABLE IF EXISTS `invoice`;
CREATE TABLE IF NOT EXISTS `invoice` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `create_by` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `update_by` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoice_user_id_foreign` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoicedetails`
--

DROP TABLE IF EXISTS `invoicedetails`;
CREATE TABLE IF NOT EXISTS `invoicedetails` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `total` bigint NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` bigint NOT NULL,
  `invoice_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoicedetails_product_id_foreign` (`product_id`),
  KEY `invoicedetails_invoice_id_foreign` (`invoice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(4, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(6, '2016_06_01_000004_create_oauth_clients_table', 1),
(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(8, '2019_08_19_000000_create_failed_jobs_table', 1),
(9, '2021_04_11_052112_create_product_table', 1),
(10, '2021_04_11_053428_create_size_table', 1),
(11, '2021_04_11_053505_create_color_table', 1),
(12, '2021_04_11_054819_create_category_table', 1),
(13, '2021_04_28_010511_create_invoice_table', 1),
(14, '2021_04_28_010623_create_invoicedetails_table', 1),
(15, '2021_04_28_010803_create_references', 1),
(16, '2021_04_29_141651_create_category_product_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

DROP TABLE IF EXISTS `oauth_access_tokens`;
CREATE TABLE IF NOT EXISTS `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `client_id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('f5345e5df92edee1be0c8179f554369da2013b3e8c4821c7f0df143cdac2cd5ad14ce20d454871c8', 1, 1, 'Laravel password', '[]', 0, '2021-04-29 07:44:59', '2021-04-29 07:44:59', '2021-10-29 14:44:59'),
('7ec28ab8e630d4869beb962c08972596692ef1d4cd3728a613b31e51c873d3ff774c8dd919da8baf', 1, 1, 'Laravel password', '[]', 0, '2021-05-05 00:43:22', '2021-05-05 00:43:22', '2021-11-05 07:43:18');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

DROP TABLE IF EXISTS `oauth_auth_codes`;
CREATE TABLE IF NOT EXISTS `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `client_id` bigint UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_auth_codes_user_id_index` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

DROP TABLE IF EXISTS `oauth_clients`;
CREATE TABLE IF NOT EXISTS `oauth_clients` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', '7n44rTjLZwWaG3RMN37FpfN9EnwTVlAZbeb1vVg0', NULL, 'http://localhost', 1, 0, 0, '2021-04-29 07:44:42', '2021-04-29 07:44:42'),
(2, NULL, 'Laravel Password Grant Client', 'TkfNOGTYkWJWi638bDi1OU1mL0B4ucgdGV4PKsWA', 'users', 'http://localhost', 0, 1, 0, '2021-04-29 07:44:42', '2021-04-29 07:44:42');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

DROP TABLE IF EXISTS `oauth_personal_access_clients`;
CREATE TABLE IF NOT EXISTS `oauth_personal_access_clients` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `client_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2021-04-29 07:44:42', '2021-04-29 07:44:42');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

DROP TABLE IF EXISTS `oauth_refresh_tokens`;
CREATE TABLE IF NOT EXISTS `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int NOT NULL,
  `describe` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `category_id` bigint UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_name_unique` (`name`),
  KEY `product_category_id_foreign` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `price`, `describe`, `url`, `status`, `created_at`, `updated_at`, `category_id`) VALUES
(1, 'ÁO SOMI M2S', 200000, 'Sang trọng, thời trang và phong cách.', 'ao-somi-m2s', 'Đang bán', '2021-04-30 03:11:33', '2021-04-30 03:11:33', 2),
(2, 'ÁO SOMI M2SM', 300000, 'Sang trọng, thời trang và phong cách.', 'ao-somi-m2sm', 'Đang bán', '2021-04-30 03:12:19', '2021-04-30 03:12:19', 2),
(3, 'ÁO THUN U1', 200000, 'Sang trọng, thời trang và phong cách.', 'ao-thun-u1', 'Đang bán', '2021-04-30 03:13:39', '2021-04-30 03:13:39', 1),
(4, 'ÁO KHOÁC TT', 400000, 'Sang trọng, thời trang và phong cách.', 'ao-khoac-tt', 'Đang bán', '2021-04-30 03:15:37', '2021-04-30 03:15:37', 3),
(6, 'QUẦN SHORT M2STH', 190000, 'Sang trọng, thời trang và phong cách.', 'quan-short-m2sth', 'Đang bán', '2021-04-30 03:19:17', '2021-04-30 03:19:17', 4),
(7, 'QUẦN JOGGER M1Q', 200000, 'Sang trọng, thời trang và phong cách.', 'quan-jogger-m1q', 'Đang bán', '2021-04-30 07:19:14', '2021-04-30 07:19:14', 5);

-- --------------------------------------------------------

--
-- Table structure for table `size`
--

DROP TABLE IF EXISTS `size`;
CREATE TABLE IF NOT EXISTS `size` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `color_id` bigint UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `size_color_id_foreign` (`color_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `size`
--

INSERT INTO `size` (`id`, `name`, `amount`, `created_at`, `updated_at`, `color_id`) VALUES
(1, 'M', 12, '2021-04-30 03:11:33', '2021-04-30 03:11:33', 1),
(2, 'L', 12, '2021-04-30 03:11:33', '2021-04-30 03:11:33', 1),
(3, 'M', 12, '2021-04-30 03:12:19', '2021-04-30 03:12:19', 2),
(4, 'L', 12, '2021-04-30 03:12:19', '2021-04-30 03:12:19', 2),
(5, 'M', 12, '2021-04-30 03:13:39', '2021-04-30 03:13:39', 3),
(6, 'L', 12, '2021-04-30 03:13:39', '2021-04-30 03:13:39', 3),
(7, 'XL', 12, '2021-04-30 03:13:39', '2021-04-30 03:13:39', 3),
(8, 'M', 12, '2021-04-30 03:13:39', '2021-04-30 03:13:39', 4),
(9, 'L', 12, '2021-04-30 03:13:39', '2021-04-30 03:13:39', 4),
(10, 'XL', 12, '2021-04-30 03:13:39', '2021-04-30 03:13:39', 4),
(11, 'L', 12, '2021-04-30 03:15:37', '2021-04-30 03:15:37', 5),
(14, 'M', 12, '2021-04-30 03:19:17', '2021-04-30 03:19:17', 7),
(15, 'L', 12, '2021-04-30 03:19:17', '2021-04-30 03:19:17', 7),
(16, 'M', 12, '2021-04-30 03:19:18', '2021-04-30 03:19:18', 8),
(17, 'L', 12, '2021-04-30 03:19:18', '2021-04-30 03:19:18', 8),
(18, 'M', 12, '2021-04-30 07:19:14', '2021-04-30 07:19:14', 9),
(19, 'L', 12, '2021-04-30 07:19:14', '2021-04-30 07:19:14', 9),
(20, 'L', 12, '2021-04-30 07:19:14', '2021-04-30 07:19:14', 10),
(21, 'XL', 12, '2021-04-30 07:19:14', '2021-04-30 07:19:14', 10);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `active`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Mỹ Duyên', 'myduyen0612@gmail.com', NULL, '$2y$10$kifBaAgxbv16yocroEtx6.uaP48QMXCmj.PFhfOCv5c32EkSrVGMa', 1, NULL, '2021-04-29 07:44:14', '2021-04-29 07:44:14');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `color`
--
ALTER TABLE `color`
  ADD CONSTRAINT `color_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

--
-- Constraints for table `invoice`
--
ALTER TABLE `invoice`
  ADD CONSTRAINT `invoice_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `invoicedetails`
--
ALTER TABLE `invoicedetails`
  ADD CONSTRAINT `invoicedetails_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoice` (`id`),
  ADD CONSTRAINT `invoicedetails_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);

--
-- Constraints for table `size`
--
ALTER TABLE `size`
  ADD CONSTRAINT `size_color_id_foreign` FOREIGN KEY (`color_id`) REFERENCES `color` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
