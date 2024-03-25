-- MySQL dump 10.13  Distrib 8.0.36, for macos14 (x86_64)
--
-- Host: localhost    Database: petboarding
-- ------------------------------------------------------
-- Server version	8.0.25

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
-- Table structure for table `cityStateZIP`
--

DROP TABLE IF EXISTS `cityStateZIP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cityStateZIP` (
  `city` varchar(90) NOT NULL,
  `state` char(2) NOT NULL,
  `zipCode` char(5) NOT NULL,
  PRIMARY KEY (`zipCode`),
  UNIQUE KEY `zipCode` (`zipCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cityStateZIP`
--

LOCK TABLES `cityStateZIP` WRITE;
/*!40000 ALTER TABLE `cityStateZIP` DISABLE KEYS */;
INSERT INTO `cityStateZIP` VALUES ('Apopka','FL','32703'),('Christmas','FL','32709'),('Eatonville','FL','32751'),('Tangerine','FL','32777'),('Winter Park','FL','32790'),('Lockhart','FL','32810'),('Belle Isle','FL','32812'),('Sand Lake','FL','32819'),('Pine Castle','FL','32839'),('Jupiter','FL','33458'),('Windermere','FL','34786'),('Winter Garden','FL','34787');
/*!40000 ALTER TABLE `cityStateZIP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `firstName` varchar(25) NOT NULL,
  `LastName` varchar(25) NOT NULL,
  `address` varchar(90) NOT NULL,
  `zipCode` char(5) NOT NULL,
  `phone` char(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `phone` (`phone`),
  UNIQUE KEY `email` (`email`),
  KEY `zipCode` (`zipCode`),
  CONSTRAINT `client_ibfk_1` FOREIGN KEY (`zipCode`) REFERENCES `cityStateZip` (`zipCode`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (1,'Meera','White','484 Bridge St','34787','2025550166','mwhite@isp.com'),(2,'Bradlee','Esparza','7031 Gainsway St','34787','2025550173','besparza@isp.com'),(3,'Leilani','Leonard','37 Monroe Street','34787','2025550175','lleonard@isp.com'),(4,'Stefanie','Brook','7990 West Surrey St','34787','2025550179','sbrook@isp.com'),(5,'Grover','Squires','7618 Madison Court','34787','2025550180','gsquires@isp.com'),(6,'Efe','House','97 High Point Street','32839','2025550196','ehouse@isp.com'),(7,'Atticus','Atkinson','66 Harrison Dr','32839','2025550197','aatkinson@isp.com'),(8,'Michelle','Ramirez','370 Hill Field Ave','32839','2025550198','mramirez@isp.com'),(9,'Remy','Hassan','249 Devon Lane','32839','2225550199','rhassan@isp.com'),(10,'Jordana','Beck','7911 Carson Lane','32839','2025550200','jbeck@isp.com'),(11,'Igor','Prince','12 Creekside St','32777','2025550199','iprince@isp.com'),(12,'Avaya','Clarke','7771 Border Court','32777','2225550119','aclarke@isp.com'),(13,'Douglas','Guthrie','9 Wrangler Ave','32777','2225550124','dguthrie@isp.com'),(14,'Yvonne','Goodman','12 Creekside St','32790','2025550109','ygoodman@isp.com'),(15,'Dante','Mackenzie','137 Wall St','32790','2025550112','dmackenzie@isp.com'),(16,'Alysha','Rollins','411 Shirley St','32790','2025550115','arollins@isp.com'),(17,'Avaya','Gonzalez','7771 Border Court','32790','2025550119','agonzalez@isp.com'),(18,'Haniya','Kelly','6 South Sulphur Springs Street','32790','2025550121','hkelly@isp.com'),(19,'Jonathan','Kumar','25 Annadale Court','33458','2025550182','jkumar@isp.com'),(20,'Angus','Neville','9841 Smith Drive','33458','2025550187','aneville@isp.com'),(21,'Uzair','Sparrow','7999 Hall Street','33458','2025550188','usparrow@isp.com'),(22,'Amari','Currie','8411 Pleasant St','33458','2025550194','acurrie@isp.com'),(23,'Imaani','Wallace','33 Pierce Rd','33458','2025550195','iwallace@isp.com'),(24,'Nathalie','Chambers','942 New Saddle Drive','34786','2025550122','nchambers@isp.com'),(25,'Dante','Rollins','9 Wrangler Ave','34786','2025550124','drollins@isp.com'),(26,'Beverley','Mckee','7319 S. Greenview Drive','34786','2025550125','bmckee@isp.com'),(27,'Thomas','Waters','411 Shirley St','32810','2225550115','twaters@isp.com'),(28,'Haniya','Kaiser','6 South Sulphur Springs Street','32812','2225550121','hkaiser@isp.com'),(29,'Victor','Newman','942 New Saddle Drive','32812','2225550122','vnewman@isp.com'),(30,'Brian','Roberts','7319 S. Greenview Drive','32819','2225550125','broberts@isp.com'),(31,'Paris','Solis','763 West Mulberry St','32819','2025550132','psolis@isp.com'),(32,'Umaiza','Heath','545 Ohio Ave','32819','2025550135','uheath@isp.com'),(33,'Dante','Rennie','137 Wall St','32819','2225550112','drennie@isp.com'),(34,'Robin','Solis','8474 Wentworth Street','32819','2025550164','rsolis@isp.com'),(35,'Kavita','Heath','796 Hartford St','32819','2025550165','kheath@isp.com');
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `firstname` varchar(25) NOT NULL,
  `lastname` varchar(25) NOT NULL,
  `address` varchar(90) NOT NULL,
  `zipCode` char(5) NOT NULL,
  `phone` char(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `phone` (`phone`),
  UNIQUE KEY `email` (`email`),
  KEY `zipCode` (`zipCode`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`zipCode`) REFERENCES `cityStateZip` (`zipCode`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'Paris','Lindsey','763 West Mulberry St','32703','2025550132','plindsey@isp.com'),(2,'Umaiza','Melia','545 Ohio Ave','32703','2025550135','umelia@isp.com'),(3,'Nico','Prince','20 Middle River Street','32709','2025550137','nprince@isp.com'),(4,'Javan','Rennie','8112 North Country St','32709','2025550139','jrennie@isp.com'),(5,'Ali','Waters','83 Rockland Lane','32709','2025550144','awaters@isp.com'),(6,'JohnPaul','Clarke','1 Riverside Lane','32709','2025550153','jpcClarke@isp.com'),(7,'Dane','Kaiser','694 Wall Road','32709','2025550155','kdaiser@isp.com'),(8,'Hammad','Newman','9970 State Court','32751','2025550157','hnewman@isp.com'),(9,'Maha','Guthrie','54 Woodsman Drive','32751','2025550161','mguthrie@isp.com'),(10,'Tulisa','Roberts','7174 Studebaker Street','32751','2025550163','troberts@isp.com');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employeePosition`
--

DROP TABLE IF EXISTS `employeePosition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employeePosition` (
  `employeeId` int NOT NULL,
  `positionId` int NOT NULL,
  PRIMARY KEY (`employeeId`,`positionId`),
  UNIQUE KEY `employeeId` (`employeeId`),
  KEY `positionId` (`positionId`),
  CONSTRAINT `employeeposition_ibfk_1` FOREIGN KEY (`employeeId`) REFERENCES `employee` (`ID`),
  CONSTRAINT `employeeposition_ibfk_2` FOREIGN KEY (`positionId`) REFERENCES `employee` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employeePosition`
--

LOCK TABLES `employeePosition` WRITE;
/*!40000 ALTER TABLE `employeePosition` DISABLE KEYS */;
INSERT INTO `employeePosition` VALUES (1,4),(2,1),(3,9),(4,2),(5,8),(6,7),(7,5),(8,1),(9,10),(10,6);
/*!40000 ALTER TABLE `employeePosition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `petType`
--

DROP TABLE IF EXISTS `petType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `petType` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `DESCRIPTION` varchar(30) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `DESCRIPTION` (`DESCRIPTION`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `petType`
--

LOCK TABLES `petType` WRITE;
/*!40000 ALTER TABLE `petType` DISABLE KEYS */;
INSERT INTO `petType` VALUES (12,'Amphibian'),(4,'Bird'),(1,'Cat'),(2,'Dog'),(9,'Ferret'),(8,'Fish'),(7,'Guinea pig'),(13,'Hamster'),(3,'Horse'),(11,'Mouse'),(6,'Rabbit'),(10,'Rat'),(5,'Reptile'),(14,'Snake'),(15,'Turtle');
/*!40000 ALTER TABLE `petType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `position`
--

DROP TABLE IF EXISTS `position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `position` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `description` varchar(30) NOT NULL,
  `hourly` decimal(5,2) NOT NULL DEFAULT (15.00),
  PRIMARY KEY (`ID`),
  UNIQUE KEY `description` (`description`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `position`
--

LOCK TABLES `position` WRITE;
/*!40000 ALTER TABLE `position` DISABLE KEYS */;
INSERT INTO `position` VALUES (1,'Manager',60.00),(2,'Animal Trainer',50.00),(3,'Groom',25.00),(4,'Receptionist',20.00),(5,'Bather',13.00),(6,'Kennel Technician',17.50),(7,'Veterinarian',85.00),(8,'Pet Exerciser',15.00),(9,'Maintenance',32.00),(10,'Groomer',18.00);
/*!40000 ALTER TABLE `position` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-09 21:23:59
