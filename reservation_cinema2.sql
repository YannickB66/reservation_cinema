-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: localhost    Database: reservation_cinema2
-- ------------------------------------------------------
-- Server version	8.0.25

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cinema`
--

DROP TABLE IF EXISTS `cinema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cinema` (
  `Id_Cinema` int NOT NULL AUTO_INCREMENT,
  `Adresse` varchar(100) NOT NULL,
  PRIMARY KEY (`Id_Cinema`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cinema`
--

LOCK TABLES `cinema` WRITE;
/*!40000 ALTER TABLE `cinema` DISABLE KEYS */;
INSERT INTO `cinema` VALUES (1,'7 rue jean Jeunet - Villelongue'),(2,'18 rue du moulin - Coustouges');
/*!40000 ALTER TABLE `cinema` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `film`
--

DROP TABLE IF EXISTS `film`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `film` (
  `Id_Film` int NOT NULL AUTO_INCREMENT,
  `Titre` varchar(50) NOT NULL,
  PRIMARY KEY (`Id_Film`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `film`
--

LOCK TABLES `film` WRITE;
/*!40000 ALTER TABLE `film` DISABLE KEYS */;
INSERT INTO `film` VALUES (1,'Kaamelott - Premier volet'),(2,'La Fine fleur'),(3,'Benedetta'),(4,'Black Widow'),(5,'Le Sens de la famille'),(6,'Pierre Lapin 2'),(7,'S.O.S. Fantômes : L\'Héritage');
/*!40000 ALTER TABLE `film` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salles`
--

DROP TABLE IF EXISTS `salles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salles` (
  `id_salle` int NOT NULL AUTO_INCREMENT,
  `numero_salle` int NOT NULL,
  `nb_place` int NOT NULL,
  `id_cinema` int DEFAULT NULL,
  PRIMARY KEY (`id_salle`),
  KEY `id_cinema` (`id_cinema`),
  CONSTRAINT `salles_ibfk_1` FOREIGN KEY (`id_cinema`) REFERENCES `cinema` (`Id_Cinema`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salles`
--

LOCK TABLES `salles` WRITE;
/*!40000 ALTER TABLE `salles` DISABLE KEYS */;
INSERT INTO `salles` VALUES (1,101,215,1),(2,102,215,1),(3,103,74,1),(4,1,78,2),(5,2,78,2),(6,3,119,2),(7,104,215,1);
/*!40000 ALTER TABLE `salles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seances`
--

DROP TABLE IF EXISTS `seances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seances` (
  `Id_seance` int NOT NULL AUTO_INCREMENT,
  `horaire` datetime NOT NULL,
  `Id_Film` int NOT NULL,
  `Id_Salle` int NOT NULL,
  PRIMARY KEY (`Id_seance`),
  KEY `Id_Film` (`Id_Film`),
  KEY `Id_Salle` (`Id_Salle`),
  CONSTRAINT `seances_ibfk_1` FOREIGN KEY (`Id_Film`) REFERENCES `film` (`Id_Film`),
  CONSTRAINT `seances_ibfk_2` FOREIGN KEY (`Id_Salle`) REFERENCES `salles` (`id_salle`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seances`
--

LOCK TABLES `seances` WRITE;
/*!40000 ALTER TABLE `seances` DISABLE KEYS */;
INSERT INTO `seances` VALUES (1,'2021-07-06 14:00:00',1,1),(2,'2021-07-06 16:00:00',1,1),(3,'2021-07-06 18:00:00',1,1),(4,'2021-07-06 14:00:00',2,2),(5,'2021-07-06 18:00:00',1,1),(6,'2021-07-06 14:00:00',2,2),(7,'2021-07-06 16:00:00',2,2),(8,'2021-07-06 18:00:00',2,2),(9,'2021-07-06 14:00:00',3,3),(10,'2021-07-06 16:00:00',3,3),(11,'2021-07-06 18:00:00',3,3),(12,'2021-07-06 14:00:00',4,4),(13,'2021-07-06 16:00:00',4,4),(14,'2021-07-06 18:00:00',4,4),(15,'2021-07-06 14:00:00',5,5),(16,'2021-07-06 16:00:00',5,5),(17,'2021-07-06 18:00:00',5,5);
/*!40000 ALTER TABLE `seances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket` (
  `UUID_reservation` char(56) DEFAULT NULL,
  `tarif` char(50) NOT NULL,
  `paiement_en_ligne` tinyint(1) NOT NULL,
  `id_seance` int NOT NULL,
  KEY `id_seance` (`id_seance`),
  CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`id_seance`) REFERENCES `seances` (`Id_seance`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
INSERT INTO `ticket` VALUES ('75e6d699-d9cc-11eb-ace2-f46d0445eb18','plein tarif',1,1),('75e6db05-d9cc-11eb-ace2-f46d0445eb18','etudiant',0,6),('75e6dc07-d9cc-11eb-ace2-f46d0445eb18','moins de 14 ans',0,7),('75e6dcb2-d9cc-11eb-ace2-f46d0445eb18','plein tarif',1,1);
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-30 19:57:26
