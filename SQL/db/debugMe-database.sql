-- MySQL dump 10.13  Distrib 8.0.22, for Linux (x86_64)
--
-- Host: localhost    Database: debugMe
-- ------------------------------------------------------
-- Server version	8.0.22-0ubuntu0.20.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `estudiante`
--

DROP TABLE IF EXISTS `estudiante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estudiante` (
  `IDes` int NOT NULL,
  PRIMARY KEY (`IDes`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estudiante`
--

LOCK TABLES `estudiante` WRITE;
/*!40000 ALTER TABLE `estudiante` DISABLE KEYS */;
/*!40000 ALTER TABLE `estudiante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `experto`
--

DROP TABLE IF EXISTS `experto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `experto` (
  `IDex` int NOT NULL,
  PRIMARY KEY (`IDex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `experto`
--

LOCK TABLES `experto` WRITE;
/*!40000 ALTER TABLE `experto` DISABLE KEYS */;
/*!40000 ALTER TABLE `experto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expertoEn`
--

DROP TABLE IF EXISTS `expertoEn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `expertoEn` (
  `IDex` int DEFAULT NULL,
  `IDt` int DEFAULT NULL,
  KEY `IDt` (`IDt`),
  KEY `IDex` (`IDex`),
  CONSTRAINT `expertoEn_ibfk_1` FOREIGN KEY (`IDt`) REFERENCES `tecnologia` (`IDt`),
  CONSTRAINT `expertoEn_ibfk_2` FOREIGN KEY (`IDex`) REFERENCES `experto` (`IDex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expertoEn`
--

LOCK TABLES `expertoEn` WRITE;
/*!40000 ALTER TABLE `expertoEn` DISABLE KEYS */;
/*!40000 ALTER TABLE `expertoEn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pregunta`
--

DROP TABLE IF EXISTS `pregunta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pregunta` (
  `IDp` int NOT NULL,
  `titulo` varchar(50) DEFAULT NULL,
  `campo` varchar(1500) DEFAULT NULL,
  `fechahora` datetime DEFAULT NULL,
  `IDes` int DEFAULT NULL,
  `IDt` int DEFAULT NULL,
  PRIMARY KEY (`IDp`),
  KEY `IDes` (`IDes`),
  KEY `IDt` (`IDt`),
  CONSTRAINT `pregunta_ibfk_1` FOREIGN KEY (`IDes`) REFERENCES `estudiante` (`IDes`),
  CONSTRAINT `pregunta_ibfk_2` FOREIGN KEY (`IDt`) REFERENCES `tecnologia` (`IDt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pregunta`
--

LOCK TABLES `pregunta` WRITE;
/*!40000 ALTER TABLE `pregunta` DISABLE KEYS */;
/*!40000 ALTER TABLE `pregunta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `respuesta`
--

DROP TABLE IF EXISTS `respuesta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `respuesta` (
  `IDr` int NOT NULL,
  `campo` varchar(1500) DEFAULT NULL,
  `fechahora` datetime DEFAULT NULL,
  `IDp` int DEFAULT NULL,
  `IDex` int DEFAULT NULL,
  PRIMARY KEY (`IDr`),
  KEY `IDp` (`IDp`),
  KEY `IDex` (`IDex`),
  CONSTRAINT `respuesta_ibfk_1` FOREIGN KEY (`IDp`) REFERENCES `pregunta` (`IDp`),
  CONSTRAINT `respuesta_ibfk_2` FOREIGN KEY (`IDex`) REFERENCES `experto` (`IDex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `respuesta`
--

LOCK TABLES `respuesta` WRITE;
/*!40000 ALTER TABLE `respuesta` DISABLE KEYS */;
/*!40000 ALTER TABLE `respuesta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tecnologia`
--

DROP TABLE IF EXISTS `tecnologia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tecnologia` (
  `IDt` int NOT NULL,
  `nombre` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`IDt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tecnologia`
--

LOCK TABLES `tecnologia` WRITE;
/*!40000 ALTER TABLE `tecnologia` DISABLE KEYS */;
/*!40000 ALTER TABLE `tecnologia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `nombre` varchar(20) DEFAULT NULL,
  `apellido` varchar(20) DEFAULT NULL,
  `username` varchar(20) DEFAULT NULL,
  `pass` varchar(15) DEFAULT NULL,
  `email` varchar(25) DEFAULT NULL,
  `fotoLink` varchar(1050) DEFAULT NULL,
  `fnac` date DEFAULT NULL,
  `IDes` int DEFAULT NULL,
  `IDex` int DEFAULT NULL,
  KEY `IDes` (`IDes`),
  KEY `IDex` (`IDex`),
  CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`IDes`) REFERENCES `estudiante` (`IDes`),
  CONSTRAINT `usuarios_ibfk_2` FOREIGN KEY (`IDex`) REFERENCES `experto` (`IDex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `valora`
--

DROP TABLE IF EXISTS `valora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `valora` (
  `nota` tinyint DEFAULT NULL,
  `IDex` int DEFAULT NULL,
  `IDes` int DEFAULT NULL,
  `IDr` int DEFAULT NULL,
  KEY `IDex` (`IDex`),
  KEY `IDes` (`IDes`),
  KEY `IDr` (`IDr`),
  CONSTRAINT `valora_ibfk_1` FOREIGN KEY (`IDex`) REFERENCES `experto` (`IDex`),
  CONSTRAINT `valora_ibfk_2` FOREIGN KEY (`IDes`) REFERENCES `estudiante` (`IDes`),
  CONSTRAINT `valora_ibfk_3` FOREIGN KEY (`IDr`) REFERENCES `respuesta` (`IDr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `valora`
--

LOCK TABLES `valora` WRITE;
/*!40000 ALTER TABLE `valora` DISABLE KEYS */;
/*!40000 ALTER TABLE `valora` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-29 14:11:30
