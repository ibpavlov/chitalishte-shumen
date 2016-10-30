-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.7.9 - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             8.0.0.4396
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table chsh-dev.articles
CREATE TABLE IF NOT EXISTS `articles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ident` varchar(20) DEFAULT NULL,
  `parent_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) DEFAULT NULL,
  `subtitle` varchar(255) DEFAULT NULL,
  `body` longtext,
  `date_added` datetime DEFAULT NULL,
  `date_last_edit` datetime DEFAULT NULL,
  `date_deleted` datetime DEFAULT NULL,
  `status` enum('inactive','active','archive','delete') DEFAULT 'active',
  `type` enum('news','event','gallery','page') DEFAULT 'page',
  `creator_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `version` bigint(20) unsigned NOT NULL DEFAULT '0',
  `version_parent_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- Dumping data for table chsh-dev.articles: ~5 rows (approximately)
/*!40000 ALTER TABLE `articles` DISABLE KEYS */;
INSERT INTO `articles` (`id`, `ident`, `parent_id`, `object_id`, `title`, `subtitle`, `body`, `date_added`, `date_last_edit`, `date_deleted`, `status`, `type`, `creator_id`, `version`, `version_parent_id`) VALUES
	(1, 'home', 0, 0, 'Добре дошли', 'В нашата социална страница', 'Тук можете да намерите...', '2016-10-29 09:14:16', '2016-10-30 12:35:18', NULL, 'active', 'page', 1, 0, 0),
	(2, 'home', 0, 0, 'Добре дошли', 'В нашата социална страница', 'Тук можете да намерите пълна информацията за нуждата от доброволци за читалищата в района на град Шумен.', '0000-00-00 00:00:00', '2016-10-29 13:10:30', NULL, 'active', 'page', 2, 1, 1),
	(3, '2-home', 0, 2, 'Добре дошли 2', 'В нашата социална страница', 'Тук можете да намерите...', '2016-10-29 09:14:16', NULL, NULL, 'active', 'page', 1, 0, 0),
	(4, '1-home', 0, 1, 'Добре дошли 1', 'В нашата социална страница', 'Тук можете да намерите...', '2016-10-29 09:14:16', NULL, NULL, 'active', 'page', 1, 0, 0),
	(5, '3-home', 0, 3, 'Добре дошли 3', 'В нашата социална страница', 'Тук можете да намерите...', '2016-10-29 09:14:16', NULL, NULL, 'active', 'page', 1, 0, 0),
	(6, 'news-3', 5, 3, 'Нова платформа', 'Откритие на века. Трябва да видите за да повярвате', 'Колкото повече четете за това, толкова повече ще се зарибите', '2016-10-29 09:14:16', NULL, NULL, 'active', 'news', 1, 0, 0),
	(7, '1-home', 0, 0, 'История', '', 'Народно читалище “Добри Войников -1856” в град Шумен е основано през пролетта на 1856 г. от Сава Доброплодни и има 155 - годишна история. Заедно с читалищата в Свищов и Лом, то слага началото на читалищното дело в България.', '2016-10-30 13:54:27', '2016-10-30 13:54:27', NULL, 'active', 'page', 2, 1, 0),
	(8, 'event-2016', 4, 1, 'ЕСЕННИ ШУМЕНСКИ ВЕЧЕРИ 2016', 'IV международен фестивал на популярната песен', 'От 30.09.2016 г. до 02.10.2016 г. в НЧ&#34;Добри Войников- 1856&#34; се проведе IV международен фестивал на популярната песен &#34;ЕСЕННИ ШУМЕНСКИ ВЕЧЕРИ&#34;', '2016-10-30 14:58:44', '2016-10-30 14:58:44', NULL, 'active', 'event', 2, 0, 0),
	(9, 'news-12', 4, 1, 'Набираме доброволци ', 'Есенно почистване на салона', 'Който желае да помогне в нашата последна инициатива е добре дошъл. Все още не е ясно кога, затова моля оставете коментар ако проявявате интерес.', '2016-10-30 15:01:39', '2016-10-30 15:01:39', NULL, 'active', 'news', 2, 0, 0),
	(10, 'news-interview', 4, 1, 'Интервю с Александър Донев за &#34;Кино в Длан&#34;', 'Интервюто с кинокритика Александър Донев за фестивала...', 'Интервюто с кинокритика Александър Донев за фестивала на мобилното кино &#34;Кино в Длан&#34;, който се провежда за втора поредна година в НЧ&#34;Добри Войников-1856&#34; можете да гледате на адрес: \r\nhttp://imedia.bnt.bg/predavanyia/denyat-zapochva-s-kultura/festival-na-mobilnoto-kino-kino-v-dlan?609551', '2016-10-30 15:05:42', '2016-10-30 15:05:42', NULL, 'active', 'news', 2, 0, 0);
/*!40000 ALTER TABLE `articles` ENABLE KEYS */;


-- Dumping structure for table chsh-dev.comments
CREATE TABLE IF NOT EXISTS `comments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `article_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `creator_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `date_added` datetime DEFAULT NULL,
  `body` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- Dumping data for table chsh-dev.comments: ~5 rows (approximately)
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` (`id`, `article_id`, `creator_id`, `date_added`, `body`) VALUES
	(1, 1, 1, '2016-10-29 12:15:42', 'Яката статия!'),
	(2, 1, 1, '2016-10-29 13:00:03', 'Първи!'),
	(9, 1, 8, '2016-10-29 16:05:59', 'Трети'),
	(10, 1, 8, '2016-10-29 16:06:14', 'Трети'),
	(11, 1, 9, '2016-10-29 16:06:36', 'Пети'),
	(12, 5, 8, '2016-10-29 16:44:46', 'test');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;


-- Dumping structure for table chsh-dev.images
CREATE TABLE IF NOT EXISTS `images` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `article_id` bigint(20) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `creator_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Dumping data for table chsh-dev.images: 1 rows
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
INSERT INTO `images` (`id`, `article_id`, `path`, `title`, `date_added`, `creator_id`) VALUES
	(1, 5, 'uploads/boqn-penev.jpg', 'Снимкка', '2016-10-29 18:54:57', 2),
	(2, 5, 'uploads/boqn-penev.jpg', 'Снимкка', '2016-10-29 18:54:57', 2),
	(3, 5, 'uploads/boqn-penev.jpg', 'Снимкка', '2016-10-29 18:54:57', 2);
/*!40000 ALTER TABLE `images` ENABLE KEYS */;


-- Dumping structure for table chsh-dev.objects
CREATE TABLE IF NOT EXISTS `objects` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `description` text,
  `image` varchar(255) DEFAULT NULL,
  `lang` decimal(8,5) NOT NULL DEFAULT '0.00000',
  `long` decimal(8,5) NOT NULL DEFAULT '0.00000',
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Dumping data for table chsh-dev.objects: ~3 rows (approximately)
/*!40000 ALTER TABLE `objects` DISABLE KEYS */;
INSERT INTO `objects` (`id`, `name`, `description`, `image`, `lang`, `long`, `user_id`, `date_added`) VALUES
	(1, 'Народно читалище "Добри Войников-1856"', 'Народно читалище “Добри Войников -1856” в град Шумен е основано през пролетта на 1856 г. от Сава Доброплодни и има 155 - годишна история. Заедно с читалищата в Свищов и Лом, то слага началото на читалищното дело в България.', 'uploads/view-pic-l.jpg', 43.27160, 26.91722, 2, NULL),
	(2, 'Народно читалище „Боян Пенев 1949“', 'Читалище “Боян Пенев” е регистрирано по Закона за народните читалища и е пререгистрирано по Закона за юридическите лица с нестопанска цел. Регистрирано е в Министерството на културата под №12.', 'uploads/boqn-penev.jpg', 43.27530, 26.95294, 2, NULL),
	(3, 'Читалище "Напредък"', 'Читалище Напредък е действащо читалище, регистрирано под номер 28 в Министерство на Културата на Република България', NULL, 43.27123, 26.92985, 2, NULL);
/*!40000 ALTER TABLE `objects` ENABLE KEYS */;


-- Dumping structure for table chsh-dev.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `type` enum('user','local_admin','administrator') NOT NULL DEFAULT 'user',
  `date_added` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- Dumping data for table chsh-dev.users: ~4 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `email`, `password`, `first_name`, `last_name`, `active`, `type`, `date_added`) VALUES
	(1, 'danail.karadaliev@gmail.com', NULL, 'Данаил', 'Карадалиев', 1, 'user', NULL),
	(2, 'ibpavlov@gmail.com', NULL, 'Ивелин', 'Павлов', 1, 'local_admin', NULL),
	(8, 'ipavlov@objectsystems.com', NULL, NULL, NULL, 1, 'user', NULL),
	(9, 'Email@email.com', NULL, NULL, NULL, 1, 'user', NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
