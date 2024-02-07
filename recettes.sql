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


-- Listage de la structure de la base pour recettes_laure
CREATE DATABASE IF NOT EXISTS `recettes_laure` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `recettes_laure`;

-- Listage de la structure de la table recettes_laure. categorie
CREATE TABLE IF NOT EXISTS `categorie` (
  `id_categorie` int NOT NULL AUTO_INCREMENT,
  `nom_categorie` varchar(50) NOT NULL,
  PRIMARY KEY (`id_categorie`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table recettes_laure.categorie : ~3 rows (environ)
INSERT IGNORE INTO `categorie` (`id_categorie`, `nom_categorie`) VALUES
	(1, 'entrée'),
	(2, 'plat'),
	(3, 'dessert');

-- Listage de la structure de la table recettes_laure. etape
CREATE TABLE IF NOT EXISTS `etape` (
  `id_recette` int NOT NULL,
  `id_ingredient` int DEFAULT NULL,
  `quantite` float NOT NULL DEFAULT '1',
  KEY `ingredient_fk_etape` (`id_ingredient`),
  KEY `FK_etape_recette` (`id_recette`),
  CONSTRAINT `FK_etape_recette` FOREIGN KEY (`id_recette`) REFERENCES `recette` (`id_recette`),
  CONSTRAINT `ingredient_fk_etape` FOREIGN KEY (`id_ingredient`) REFERENCES `ingredient` (`id_ingredient`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table recettes_laure.etape : ~40 rows (environ)
INSERT IGNORE INTO `etape` (`id_recette`, `id_ingredient`, `quantite`) VALUES
	(3, 8, 3),
	(3, 4, 1),
	(5, 7, 0.5),
	(5, 14, 1),
	(5, 11, 1),
	(6, 10, 0.8),
	(6, 11, 0.2),
	(7, 15, 1),
	(7, 1, 0.5),
	(7, 17, 0.5),
	(7, 9, 0.3),
	(8, 12, 1),
	(8, 13, 0.7),
	(8, 11, 4),
	(6, 1, 3),
	(7, 3, 1),
	(7, 5, 0.5),
	(1, 17, 1),
	(1, 12, 1),
	(1, 18, 0.8),
	(3, 5, 3),
	(3, 6, 1),
	(3, 9, 1),
	(4, 9, 1),
	(4, 6, 1),
	(4, 5, 3),
	(5, 2, 2),
	(9, 21, 0.5),
	(9, 20, 0.5),
	(9, 1, 0.8),
	(9, 19, 1),
	(10, 13, 1),
	(10, 2, 3),
	(10, 20, 1),
	(10, 22, 0.8),
	(12, 17, 1),
	(12, 21, 1),
	(12, 1, 1),
	(13, 6, 0.2);

-- Listage de la structure de la table recettes_laure. ingredient
CREATE TABLE IF NOT EXISTS `ingredient` (
  `id_ingredient` int NOT NULL AUTO_INCREMENT,
  `nom_ingredient` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `unite_mesure` varchar(50) NOT NULL,
  `prix` float DEFAULT NULL,
  PRIMARY KEY (`id_ingredient`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table recettes_laure.ingredient : ~22 rows (environ)
INSERT IGNORE INTO `ingredient` (`id_ingredient`, `nom_ingredient`, `unite_mesure`, `prix`) VALUES
	(1, 'poulet', 'kg', 6),
	(2, 'tomate', 'unité', 0.5),
	(3, 'poivre', 'cuillère à café', 0.2),
	(4, 'farine', 'kg', 1.5),
	(5, 'œuf', 'unité', 0.3),
	(6, 'sucre', 'kg', 2),
	(7, 'beurre', 'g', 1),
	(8, 'chocolat noir', 'g', 1.5),
	(9, 'lait', 'L', 0.8),
	(10, 'pomme de terre', 'kg', 1.2),
	(11, 'carotte', 'kg', 0.8),
	(12, 'oignon', 'unité', 1.5),
	(13, 'ail', 'g', 0.3),
	(14, 'poisson', 'kg', 8),
	(15, 'riz', 'g', 0.5),
	(16, 'citron', 'unité', 0.7),
	(17, 'crème fraîche', 'L', 1.5),
	(18, 'pates', 'kg', 1.5),
	(19, 'salade', 'kg', 3.5),
	(20, 'vinaigrette', 'ml', 3),
	(21, 'parmesan', 'kg', 15),
	(22, 'mozzarella', 'kg', 10),
	(23, 'sel', 'cuillère à café', 2.5);

-- Listage de la structure de la table recettes_laure. recette
CREATE TABLE IF NOT EXISTS `recette` (
  `id_recette` int NOT NULL AUTO_INCREMENT,
  `nom_recette` varchar(255) NOT NULL,
  `instructions` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `temp_preparation` int NOT NULL DEFAULT (0),
  `id_categorie` int NOT NULL,
  PRIMARY KEY (`id_recette`),
  KEY `FK_recette_categorie` (`id_categorie`),
  CONSTRAINT `FK_recette_categorie` FOREIGN KEY (`id_categorie`) REFERENCES `categorie` (`id_categorie`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table recettes_laure.recette : ~8 rows (environ)
INSERT IGNORE INTO `recette` (`id_recette`, `nom_recette`, `instructions`, `temp_preparation`, `id_categorie`) VALUES
	(1, 'pates aux champignons', 'Fais cuire des pâtes al dente. Pendant ce temps, fais revenir des champignons émincés dans de l\'huile d\'olive avec de l\'ail haché et du persil. Ajoute une touche de vin blanc et laisse mijoter. Mélange les pâtes cuites avec la sauce aux champignons. Saupoudre de parmesan râpé', 40, 2),
	(3, 'Mousse au chocolat maison', '1. Faire fondre le chocolat au bain-marie.\n2. Monter les blancs en neige.\n3. Mélanger délicatement le chocolat fondu aux blancs en neige.\n4. Réfrigérer pendant au moins 2 heures.', 55, 3),
	(4, 'Crème brûlée', 'Préparez l\'appareil à crème : Fouettez les jaunes d\'œufs avec le sucre jusqu\'à blanchiment.\r\nFaites chauffer la crème avec une gousse de vanille fendue et gratée.\r\nVersez la crème chaude sur le mélange œufs-sucre en fouettant.\r\n\r\nPlacez-les dans un plat à four rempli d\'eau chaude (bain-marie).\r\nCuisez au four préchauffé à 150°C pendant 40 minutes.\r\n\r\nLaissez refroidir à température ambiante.\r\n\r\nSaupoudrez de cassonade sur le dessus des crèmes.\r\nCaramélisez au chalumeau de cuisine ou sous le grill du four jusqu\'à obtenir une croûte dorée.', 55, 3),
	(5, 'Filet de poisson au citron', 'Assaisonnez les filets de poisson avec du sel et du poivre.\r\nDisposez-les dans un plat allant au four et arrosez-les de jus de citron frais.\r\nAjoutez des rondelles de citron sur le dessus des filets. Enfournez à 180°C pendant environ 20-25 minutes, jusqu\'à ce que le poisson soit cuit et tendre.\r\nServez chaud avec des quartiers de citron supplémentaires pour plus de fraîcheur, accompagné de riz ou de légumes vapeur.', 40, 2),
	(6, 'Gratin de pommes de terre', 'Épluchez et coupez les pommes de terre en fines tranches.\r\nDisposez les tranches dans un plat à gratin beurré.\r\nVersez de la crème fraîche et saupoudrez de fromage râpé.\r\nEnfournez à 180°C pendant 45 à 60 minutes.\r\nLe gratin est prêt lorsque le dessus est doré et croustillant.', 70, 2),
	(7, 'Riz au curry', 'Faites cuire du riz blanc selon les instructions sur l\'emballage.\r\nDans une casserole, chauffez de l\'huile et faites revenir des oignons et de l\'ail hachés.\r\nAjoutez du curry en poudre selon votre goût et mélangez.\r\nIncorporez le riz cuit à la préparation de curry et mélangez bien.\r\nLaissez mijoter quelques minutes pour que les saveurs se mélangent, puis servez chaud.', 25, 2),
	(8, 'Salade de carottes râpées', 'Épluchez et râpez les carottes fraîches.\r\nPréparez la vinaigrette en mélangeant de l\'huile d\'olive, du vinaigre de cidre, du sel et du poivre dans un bol.\r\nVersez la vinaigrette sur les carottes râpées.\r\nAjoutez des herbes fraîches hachées comme de la coriandre ou du persil (facultatif).\r\nMélangez bien et laissez reposer au réfrigérateur pendant au moins 30 minutes avant de servir pour que les saveurs se développent.', 15, 1),
	(9, 'Salade César', 'Mélange 2 gousses d\'ail écrasées, 2 cuillères à soupe de jus de citron, 1 cuillère à soupe de moutarde de Dijon, 2 anchois écrasés (optionnel), 1/2 tasse de mayonnaise, 1/4 tasse de parmesan râpé et poivre noir. Incorpore lentement 1/4 tasse d\'huile d\'olive pour faire la sauce César. Dispose des feuilles de laitue romaine dans un bol, ajoute des croûtons et des filets de poulet grillés si désiré. Nappe de sauce César et saupoudre de parmesan râpé.', 10, 2),
	(10, 'Tomates mozzarella', 'Tranche les tomates et la mozzarella. Alterne les tranches sur un plat. Intercalle des feuilles de basilic. Assaisonne avec de l\'huile d\'olive, du vinaigre balsamique, du sel et du poivre. ', 10, 2),
	(12, 'Pates à la carbonnara', 'Faire cuire les pâtes al dente dans de l\'eau salée.\r\nDans une poêle, faire revenir des lardons jusqu\'à ce qu\'ils soient dorés.\r\nDans un bol, mélanger des jaunes d\'œufs avec du parmesan râpé et du poivre noir.\r\nÉgoutter les pâtes et les mélanger rapidement avec les lardons.\r\nHors du feu, ajouter le mélange d\'œufs et de parmesan, en remuant rapidement pour enrober les pâtes, puis servir chaud.', 15, 2),
	(13, 'eau chaud', 'Verser de l\'eau chaude dans une tasse', 2, 1);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
