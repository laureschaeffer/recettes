-- --------------------------------------------------------
-- Hôte:                         127.0.0.1
-- Version du serveur:           8.0.30 - MySQL Community Server - GPL
-- SE du serveur:                Win64
-- HeidiSQL Version:             12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Listage de la structure de la base pour recettes
CREATE DATABASE IF NOT EXISTS `recettes_laure` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `recettes_laure`;

-- Listage de la structure de la table recettes. categorie
CREATE TABLE IF NOT EXISTS `categorie` (
  `id_categorie` int NOT NULL AUTO_INCREMENT,
  `nom_categorie` varchar(50) NOT NULL,
  PRIMARY KEY (`id_categorie`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table recettes.categorie : ~0 rows (environ)
INSERT INTO `categorie` (`id_categorie`, `nom_categorie`) VALUES
	(1, 'entrée'),
	(2, 'plat'),
	(3, 'dessert');

-- Listage de la structure de la table recettes. etape
CREATE TABLE IF NOT EXISTS `etape` (
  `id_recette` int NOT NULL,
  `id_ingredient` int NOT NULL,
  `quantite` float NOT NULL DEFAULT '1',
  KEY `ingredient_fk_etape` (`id_ingredient`),
  KEY `FK_etape_recette` (`id_recette`),
  CONSTRAINT `FK_etape_recette` FOREIGN KEY (`id_recette`) REFERENCES `recette` (`id_recette`),
  CONSTRAINT `ingredient_fk_etape` FOREIGN KEY (`id_ingredient`) REFERENCES `ingredient` (`id_ingredient`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table recettes.etape : ~0 rows (environ)

-- Listage de la structure de la table recettes. ingredient
CREATE TABLE IF NOT EXISTS `ingredient` (
  `id_ingredient` int NOT NULL AUTO_INCREMENT,
  `nom_ingredient` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `unite_mesure` varchar(50) NOT NULL,
  `prix` float DEFAULT NULL,
  PRIMARY KEY (`id_ingredient`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table recettes.ingredient : ~0 rows (environ)
INSERT INTO `ingredient` (`id_ingredient`, `nom_ingredient`, `unite_mesure`, `prix`) VALUES
	(1, 'poulet', 'kg', 6);

-- Listage de la structure de la table recettes. recette
CREATE TABLE IF NOT EXISTS `recette` (
  `id_recette` int NOT NULL AUTO_INCREMENT,
  `nom_recette` varchar(255) NOT NULL,
  `instructions` text NOT NULL,
  `temp_preparation` int NOT NULL DEFAULT (0),
  `id_categorie` int NOT NULL,
  PRIMARY KEY (`id_recette`),
  KEY `FK_recette_categorie` (`id_categorie`),
  CONSTRAINT `FK_recette_categorie` FOREIGN KEY (`id_categorie`) REFERENCES `categorie` (`id_categorie`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table recettes.recette : ~1 rows (environ)


/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
