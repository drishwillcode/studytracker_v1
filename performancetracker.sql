-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: performance_tracker
-- ------------------------------------------------------
-- Server version	8.0.42

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
-- Table structure for table `chapters`
--

DROP TABLE IF EXISTS `chapters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chapters` (
  `CH_NO` int NOT NULL,
  `CH_NAME` varchar(60) NOT NULL,
  `SUBJECT` varchar(20) DEFAULT NULL,
  `STATUS` varchar(20) DEFAULT 'PENDING',
  `CH_CLASS` int DEFAULT NULL,
  PRIMARY KEY (`CH_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chapters`
--

LOCK TABLES `chapters` WRITE;
/*!40000 ALTER TABLE `chapters` DISABLE KEYS */;
INSERT INTO `chapters` VALUES (1,'units and measurement','physics','PENDING',11),(2,'vectors','physics','PENDING',11),(3,'kinematics','physics','IN PROGRESS',11),(4,'laws of motion','physics','IN PROGRESS',11),(5,'work,energy,power','physics','IN PROGRESS',11),(6,'rotational motion','physics','IN PROGRESS',11),(7,'gravitation','physics','IN PROGRESS',11),(8,'solids','physics','in progress',11),(9,'fluid mechanics','physics','PENDING',11),(10,'shm','physics','in progress',11),(11,'waves','physics','PENDING',11),(12,'thermodynamics','physics','PENDING',11),(13,'electrostatics','physics','FINISHED',11),(14,'current electricity','physics','FINISHED',12),(15,'magnetism','physics','FINISHED',12),(16,'EMI','physics','FINISHED',12),(17,'AC','physics','FINISHED',12),(18,'electromagnetic waves','physics','FINISHED',12),(19,'ray optics','physics','PENDING',12),(20,'wave optics','physics','PENDING',12),(21,'modern physics','physics','PENDING',12),(22,'semiconductors','physics','PENDING',12),(23,'sets','mathematics','PENDING',11),(24,'relations functions','mathematics','PENDING',11),(25,'trigonometric functions','mathematics','PENDING',11),(26,'complex numbers','mathematics','PENDING',11),(27,'quadratic equations','mathematics','PENDING',11),(28,'linear inequalities','mathematics','PENDING',11),(29,'permutation and combination','mathematics','PENDING',11),(30,'binominal theorem','mathematics','PENDING',11),(31,'sequesnce and series','mathematics','PENDING',11),(32,'straight lines','mathematics','PENDING',11),(33,'conic sections','mathematics','PENDING',11),(34,'statistics','mathematics','PENDING',11),(35,'probability','mathematics','PENDING',11),(36,'limits','mathematics','PENDING',11),(37,'inverse trigonometric functions','mathematics','PENDING',12),(38,'matrices','mathematics','PENDING',12),(39,'determinants','mathematics','PENDING',12),(40,'continuity and differentiability','mathematics','PENDING',12),(41,'application of derivatives','mathematics','PENDING',12),(42,'integrals(indefinite)','mathematics','PENDING',12),(43,'integrals(indefenite)','mathematics','PENDING',12),(44,'applications of integration','mathematics','PENDING',12),(45,'differential equations','mathematics','PENDING',12),(46,'vectors','mathematics','PENDING',12),(47,'3-D geometry','mathematics','PENDING',12),(48,'linear programming','mathematics','PENDING',12),(49,'some basic concepts of chemistry','chemistry','PENDING',11),(50,'structure of atom','chemistry','PENDING',11),(51,'periodic properties','chemistry','PENDING',11),(52,'states of matter','chemistry','PENDING',11),(53,'thermodynamics','chemistry','PENDING',11),(54,'equilibrium','chemistry','FINISHED',11),(55,'redox reactions','chemistry','FINISHED',11),(56,'hydrogen','chemistry','FINISHED',11),(57,'s-block elements','chemistry','PENDING',11),(58,'p-block elements(grp 13-14)','chemistry','PENDING',11),(59,'general organic chemistry','chemistry','PENDING',11),(60,'hydrocarbons','chemistry','PENDING',11),(61,'environmental chemistry','chemistry','PENDING',11),(62,'solid state','chemistry','PENDING',12),(63,'solutions','chemistry','FINISHED',12),(64,'electrochemistry','chemistry','FINISHED',12),(65,'chemical kinetics','chemistry','FINISHED',12),(66,'surface chemistry','chemistry','PENDING',12),(67,'p-block elements(grps 15-18)','chemistry','FINISHED',12),(68,'d-block elements','chemistry','PENDING',12),(69,'f-block elements','chemistry','PENDING',12),(70,'coordination compounds','chemistry','PENDING',12),(71,'haloalkanes-haloarenes','chemistry','in progress',12),(72,'alchohol,phenol,ether','chemistry','in progress',12),(73,'aldehyde, ketone,carboxylic acids','chemistry','in progress',12),(74,'amines','chemistry','in progress',12),(75,'biomolecules','chemistry','in progress',12),(76,'polymers','chemistry','PENDING',12),(77,'chemistry in everyday life','chemistry','PENDING',12),(78,'practical organic chemistry','chemistry','PENDING',12);
/*!40000 ALTER TABLE `chapters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_info`
--

DROP TABLE IF EXISTS `exam_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_info` (
  `exam_no` int NOT NULL,
  `exam_name` varchar(75) NOT NULL,
  `exam_date` date DEFAULT NULL,
  PRIMARY KEY (`exam_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_info`
--

LOCK TABLES `exam_info` WRITE;
/*!40000 ALTER TABLE `exam_info` DISABLE KEYS */;
INSERT INTO `exam_info` VALUES (1,'jee main','2026-01-22'),(2,'jee advanced','2026-05-15');
/*!40000 ALTER TABLE `exam_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_scores`
--

DROP TABLE IF EXISTS `test_scores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `test_scores` (
  `test_no` int NOT NULL AUTO_INCREMENT,
  `test_name` varchar(60) NOT NULL,
  `ttl_marks` int DEFAULT NULL,
  `ttl_score` int DEFAULT NULL,
  `phy_score` int DEFAULT NULL,
  `math_score` int DEFAULT NULL,
  `chem_score` int DEFAULT NULL,
  `percentage` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`test_no`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_scores`
--

LOCK TABLES `test_scores` WRITE;
/*!40000 ALTER TABLE `test_scores` DISABLE KEYS */;
INSERT INTO `test_scores` VALUES (11,'jee main mock 1',300,178,78,45,55,59),(12,'jee main mock 2',300,180,80,50,50,60),(13,'jee main mock 3',300,176,78,56,42,59),(14,'jee main mock 4',300,220,80,70,70,73);
/*!40000 ALTER TABLE `test_scores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_name`
--

DROP TABLE IF EXISTS `user_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_name` (
  `name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_name`
--

LOCK TABLES `user_name` WRITE;
/*!40000 ALTER TABLE `user_name` DISABLE KEYS */;
INSERT INTO `user_name` VALUES ('DRISHTI');
/*!40000 ALTER TABLE `user_name` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-30 22:05:21
