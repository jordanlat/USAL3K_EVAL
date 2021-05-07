-- --------------------------------------------------------
-- Hôte :                        localhost
-- Version du serveur:           5.7.24 - MySQL Community Server (GPL)
-- SE du serveur:                Win64
-- HeidiSQL Version:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Listage de la structure de la base pour leg_store
CREATE DATABASE IF NOT EXISTS `leg_store` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `leg_store`;

-- Listage de la structure de la table leg_store. doctrine_migration_versions
CREATE TABLE IF NOT EXISTS `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Listage des données de la table leg_store.doctrine_migration_versions : ~1 rows (environ)
/*!40000 ALTER TABLE `doctrine_migration_versions` DISABLE KEYS */;
INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
	('DoctrineMigrations\\Version20210507085636', '2021-05-07 08:56:42', 324);
/*!40000 ALTER TABLE `doctrine_migration_versions` ENABLE KEYS */;

-- Listage de la structure de la table leg_store. sales
CREATE TABLE IF NOT EXISTS `sales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `variety_id` int(11) DEFAULT NULL,
  `dateadd` date DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `unitprice` decimal(5,2) DEFAULT NULL,
  `active` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_6B81704478C2BC47` (`variety_id`),
  CONSTRAINT `FK_6B81704478C2BC47` FOREIGN KEY (`variety_id`) REFERENCES `varieties` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table leg_store.sales : ~0 rows (environ)
/*!40000 ALTER TABLE `sales` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales` ENABLE KEYS */;

-- Listage de la structure de la table leg_store. varieties
CREATE TABLE IF NOT EXISTS `varieties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vegetable_id` int(11) DEFAULT NULL,
  `variety` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color1` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color2` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color3` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_EF211793D33F4D6` (`vegetable_id`),
  CONSTRAINT `FK_EF211793D33F4D6` FOREIGN KEY (`vegetable_id`) REFERENCES `vegetables` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table leg_store.varieties : ~6 rows (environ)
/*!40000 ALTER TABLE `varieties` DISABLE KEYS */;
INSERT INTO `varieties` (`id`, `vegetable_id`, `variety`, `color1`, `color2`, `color3`) VALUES
	(2, NULL, 'fruit', 'rouge', 'jaune', 'vert'),
	(3, NULL, 'racine', 'vert', 'jaune', 'orange'),
	(4, NULL, 'racine', 'vert', 'jaune', 'orange'),
	(5, NULL, 'racine', 'vert', 'jaune', 'orange'),
	(6, NULL, 'racine', 'vert', 'jaune', 'orange'),
	(7, NULL, 'racine', 'vert', 'jaune', 'orange');
/*!40000 ALTER TABLE `varieties` ENABLE KEYS */;

-- Listage de la structure de la table leg_store. vegetables
CREATE TABLE IF NOT EXISTS `vegetables` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lifetime` int(11) DEFAULT NULL,
  `fresh` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table leg_store.vegetables : ~2 rows (environ)
/*!40000 ALTER TABLE `vegetables` DISABLE KEYS */;
INSERT INTO `vegetables` (`id`, `name`, `lifetime`, `fresh`) VALUES
	(1, 'patate', 2, 0),
	(3, 'fraise', 3, 0);
/*!40000 ALTER TABLE `vegetables` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
