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

-- Dumping structure for table roroipapel.user_group
CREATE TABLE IF NOT EXISTS `user_group` (
  `group_id` int(11) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(200) DEFAULT NULL,
  `permission` longtext,
  `group_code` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Dumping data for table roroipapel.user_group: ~5 rows (approximately)
/*!40000 ALTER TABLE `user_group` DISABLE KEYS */;
INSERT IGNORE INTO `user_group` (`group_id`, `group_name`, `permission`, `group_code`) VALUES
	(1, 'LAUSD SEPA', '{"cases":[{"case_id":1,"case_name":"General Consultation","locations_with_approval":[1,2,11,12],"location_without_approval":[3,4,5,6,7,8,9,10]},{"case_id":2,"case_name":"Naturalization","locations_with_approval":[1,2,11,12],"location_without_approval":[3,4,5,6,7,8,9,10]},{"case_id":3,"case_name":"Unaccompanied Child","locations_with_approval":[1,2,4,5,6,7,8,9,10],"location_without_approval":[]}],"modules":["events_create"]}', 'SEPA'),
	(2, 'Public Defender', '{"cases":[{"case_id":2,"case_name":"Naturalization","locations_with_approval":[1,2,11,12],"location_without_approval":[3,4,5,6,7,8,9,10]},{"case_id":3,"case_name":"Unaccompanied Child","locations_with_approval":[1,2,4,5,6,7,8,9,10],"location_without_approval":[]}],"location_with_approval":[12,2],"location_without_approval":[3,4],"modules":["events_create"]}', 'LCPD'),
	(3, 'Health', '{"cases":[{"case_id":1,"case_name":"General Consultation","locations_with_approval":[],"location_without_approval":[]},{"case_id":2,"case_name":"Naturalization","locations_with_approval":[],"location_without_approval":[]},{"case_id":3,"case_name":"Unaccompanied Child","locations_with_approval":[],"location_without_approval":[]}],"modules":["events_create"]}', 'HEALTH'),
	(4, 'Housing', '{"cases":[{"case_id":1,"case_name":"General Consultation","locations_with_approval":[],"location_without_approval":[]},{"case_id":2,"case_name":"Naturalization","locations_with_approval":[],"location_without_approval":[]},{"case_id":3,"case_name":"Unaccompanied Child","locations_with_approval":[],"location_without_approval":[]}],"modules":["events_create"]}', 'HOUSING'),
	(5, 'Test', '{"cases":[{"case_id":1,"case_name":"General Consultation","locations_with_approval":[],"location_without_approval":[]},{"case_id":2,"case_name":"Naturalization","locations_with_approval":[],"location_without_approval":[]},{"case_id":3,"case_name":"Unaccompanied Child","locations_with_approval":[],"location_without_approval":[]}],"modules":["events_create"]}', 'TEST');
/*!40000 ALTER TABLE `user_group` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
