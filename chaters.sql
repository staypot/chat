-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.5.5-10.1.13-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win32
-- HeidiSQL Version:             8.3.0.4694
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table papersllc_db_vm3.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table papersllc_db_vm3.migrations: ~2 rows (approximately)
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_resets_table', 1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;


-- Dumping structure for table papersllc_db_vm3.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table papersllc_db_vm3.password_resets: ~0 rows (approximately)
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;


-- Dumping structure for table papersllc_db_vm3.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table papersllc_db_vm3.users: ~2 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'Rollex', 'rj@g.com', '$2y$10$s1seYj/CQcrSxE6FgvP2yuzTBEd7JEHaSN8ozYArqBx8D4d9SusIC', NULL, '2016-12-15 15:07:42', '2016-12-15 15:07:42'),
	(2, 'Rommel', 'rm@g.com', '$2y$10$s1seYj/CQcrSxE6FgvP2yuzTBEd7JEHaSN8ozYArqBx8D4d9SusIC', NULL, '2016-12-15 15:11:48', '2016-12-15 15:11:48'),
	(3, 'Marc', 'mr@g.com', '$2y$10$s1seYj/CQcrSxE6FgvP2yuzTBEd7JEHaSN8ozYArqBx8D4d9SusIC', NULL, NULL, NULL),
	(4, 'Paul', 'p@g.com', '$2y$10$s1seYj/CQcrSxE6FgvP2yuzTBEd7JEHaSN8ozYArqBx8D4d9SusIC', NULL, NULL, NULL),
	(5, 'Raf', 'rf@g.com', '$2y$10$s1seYj/CQcrSxE6FgvP2yuzTBEd7JEHaSN8ozYArqBx8D4d9SusIC', NULL, NULL, NULL),
	(6, 'Json', 'j@g.com', '$2y$10$s1seYj/CQcrSxE6FgvP2yuzTBEd7JEHaSN8ozYArqBx8D4d9SusIC', NULL, NULL, NULL),
	(7, 'Roi', 'ro@g.com', '$2y$10$s1seYj/CQcrSxE6FgvP2yuzTBEd7JEHaSN8ozYArqBx8D4d9SusIC', NULL, NULL, NULL),
	(8, 'Peter', 'pete@g.com', '$2y$10$s1seYj/CQcrSxE6FgvP2yuzTBEd7JEHaSN8ozYArqBx8D4d9SusIC', NULL, NULL, NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
