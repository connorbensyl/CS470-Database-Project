-- MySQL dump 10.13  Distrib 8.0.22, for macos10.15 (x86_64)
--
-- Host: 127.0.0.1    Database: zoo
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `animal`
--

DROP TABLE IF EXISTS `animal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `animal` (
  `animal_id` int NOT NULL,
  `aname` varchar(20) NOT NULL,
  `sex` char(1) DEFAULT NULL,
  `age` int DEFAULT NULL,
  `acqui_way` varchar(20) DEFAULT NULL,
  `health_cond` varchar(5) DEFAULT NULL,
  `specie` varchar(20) NOT NULL,
  PRIMARY KEY (`animal_id`),
  KEY `fk_specie_sname` (`specie`),
  CONSTRAINT `fk_specie_sname` FOREIGN KEY (`specie`) REFERENCES `species` (`sname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `animal`
--

LOCK TABLES `animal` WRITE;
/*!40000 ALTER TABLE `animal` DISABLE KEYS */;
INSERT INTO `animal` VALUES (1,'Harambe','M',17,'born in zoo',NULL,'Gorilla'),(2,'Chipua','M',13,'born in zoo','Bad','Gorilla'),(3,'Zane','M',12,'born in zoo','Good','Chimpanzee'),(4,'Kaatie','M',5,'born in zoo','Soso','Greater Flamingo'),(5,'Aslan','M',18,'wild','Good','Lion'),(6,'Tamba ','M',3,'born in zoo',NULL,'Rhinoceros'),(7,'Enzi','M',10,'born in zoo',NULL,'Zebra'),(8,'Lenny','F',9,'wild','Good','Wildbeest'),(9,'Kivuli','F',17,'born in zoo','Soso','Giraffe'),(10,'Zakari','M',14,'born in zoo','Soso','Camel'),(11,'Ravi','M',2,'born in zoo','Good','Red Pnada'),(12,'Hanako','M',15,'born in zoo',NULL,'Macaque'),(13,'Aleksei ','M',10,'born in zoo','Soso','Tiger'),(14,'Quon','M',11,'born in zoo','Good','Chinese Alligator'),(15,'Takeshi','M',8,'wild','Soso','Matamata Turtle'),(16,'Ploum','F',1,'born in zoo','Good','Reticulated python'),(17,'Fubuki','F',8,'born in zoo',NULL,'Artic Fox'),(18,'Anana,','F',5,'wild','Soso','Polar Bear'),(19,'Kaskapahtew','M',11,'born in zoo',NULL,'Wolf'),(20,'Renner','F',9,'born in zoo','Good','Wolf'),(21,'Eloise','F',6,'born in zoo','Good','Wallaby'),(22,'Sprocket','F',10,'wild','Soso','Kangaroo');
/*!40000 ALTER TABLE `animal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cares_for`
--

DROP TABLE IF EXISTS `cares_for`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cares_for` (
  `emp_id` int NOT NULL,
  `ani_id` int NOT NULL,
  PRIMARY KEY (`emp_id`,`ani_id`),
  KEY `fk_ani_id_animal_id` (`ani_id`),
  CONSTRAINT `fk_ani_id_animal_id` FOREIGN KEY (`ani_id`) REFERENCES `animal` (`animal_id`),
  CONSTRAINT `fk_emp_id_for_animal` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cares_for`
--

LOCK TABLES `cares_for` WRITE;
/*!40000 ALTER TABLE `cares_for` DISABLE KEYS */;
INSERT INTO `cares_for` VALUES (1,1),(12,1),(29,1),(38,1),(1,2),(13,2),(15,2),(19,2),(24,2),(31,2),(35,2),(5,3),(9,3),(14,3),(37,3),(39,3),(30,4),(34,4),(34,5),(40,5),(41,5),(34,6),(42,6),(10,7),(28,7),(34,7),(7,8),(11,8),(34,8),(34,9),(8,10),(8,11),(19,11),(32,11),(36,11),(6,12),(8,12),(20,12),(33,12),(46,12),(7,13),(8,13),(29,13),(2,14),(17,14),(23,14),(2,15),(17,15),(22,15),(23,15),(25,15),(2,16),(17,16),(23,16),(3,17),(23,17),(27,17),(43,17),(44,17),(16,18),(21,18),(26,18),(27,18),(18,19),(47,19),(18,20),(45,20),(4,21),(23,21),(38,21),(44,21),(48,21),(50,21),(49,22),(50,22);
/*!40000 ALTER TABLE `cares_for` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `emp_id` int NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `salary` int DEFAULT NULL,
  `sex` char(1) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  PRIMARY KEY (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'John','Smith',50000,'M','2001-01-01'),(2,'Lanny','Orsay',40000,'F','1999-02-27'),(3,'Barbaraanne','Oxenham',20000,'F','1997-08-23'),(4,'Gualterio','Barraclough',45000,'F','2000-01-15'),(5,'Lancelot','Bellenger',33000,'M','1995-04-17'),(6,'Shaw','Castellet',25000,'M','1999-03-09'),(7,'Prince','Barrington',70000,'M','2002-05-10'),(8,'Ward','Aslen',50000,'M','1988-09-30'),(9,'Kendrick','Cosstick',35000,'M','2000-04-25'),(10,'Melisenda','Ledgley',45000,'F','1998-10-02'),(11,'Allianora','Gowdridge',47000,'F','1998-11-15'),(12,'Deanne','Treske',30000,'M','2001-11-01'),(13,'Aurelia','Arnaudon',23000,'M','1995-02-18'),(14,'Sutton','Elgy',15000,'M','1998-03-14'),(15,'Maddi','Dullingham',56000,'M','1994-10-01'),(16,'Margarethe','McGiff',45000,'M','2000-12-31'),(17,'Jase','Guidini',45000,'F','1980-03-20'),(18,'Keeley','Imlaw',43000,'M','1988-08-02'),(19,'Wiatt','Lewisham',55000,'M','1990-01-01'),(20,'Anallise','Nornasell',28000,'F','1991-03-17'),(21,'Livia','Aseef',45000,'F','2000-11-05'),(22,'Henriette','Shireff',36000,'F','1992-06-12'),(23,'Nicolea','Biskupiak',38000,'M','1998-10-03'),(24,'Daffy','Stradling',22000,'F','1996-06-17'),(25,'Lusa','Capstake',58000,'M','2002-04-08'),(26,'Kelbee','Grzelczyk',60000,'M','1993-01-01'),(27,'Donia','Mason',57000,'F','1990-07-15'),(28,'Hirsch','Maunders',48000,'M','1997-03-15'),(29,'Martelle','Parysiak',39000,'M','1998-12-31'),(30,'Jacki','Scapens',32000,'M','1999-11-21'),(31,'Sheelagh','Brixey',52000,'M','1996-10-11'),(32,'Kay','Alvy',48000,'M','1995-08-13'),(33,'Brannon','MacCafferty',25000,'M','1997-09-25'),(34,'Elise','Lock',40000,'F','1989-08-09'),(35,'Gnni','Corah',30000,'F','1997-07-01'),(36,'Evita','Tunder',38000,'M','1999-01-22'),(37,'Indira','Blesli',39000,'F','1998-10-02'),(38,'Stefanie','Tax',45000,'M','1993-02-14'),(39,'Melitta','Josovich',45000,'F','1994-03-10'),(40,'Arron','Arnao',38000,'M','1989-03-14'),(41,'Norris','Rignold',42000,'M','1993-06-18'),(42,'Glenda','Simms',30000,'F','1994-02-12'),(43,'Rora','Stradling',45000,'F','1997-12-03'),(44,'Nikki','Redmile',54000,'F','1998-02-13'),(45,'Malchy','Turnpenny',37000,'F','2001-05-29'),(46,'Gwenny','Ruffli',24000,'M','1988-10-12'),(47,'Dolf','McAlpin',68000,'M','1989-10-23'),(48,'Berty','Walewicz',47000,'F','1997-08-11'),(49,'Guthrie','Swanton',37000,'M','1995-10-01'),(50,'Lotty','Bremmer',36000,'F','1990-03-03');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `habitat`
--

DROP TABLE IF EXISTS `habitat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `habitat` (
  `habitat_number` int NOT NULL,
  `habitat_name` varchar(30) NOT NULL,
  `super_id` int NOT NULL,
  PRIMARY KEY (`habitat_number`),
  KEY `fk_super_id_emp_id` (`super_id`),
  CONSTRAINT `fk_super_id_emp_id` FOREIGN KEY (`super_id`) REFERENCES `employee` (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `habitat`
--

LOCK TABLES `habitat` WRITE;
/*!40000 ALTER TABLE `habitat` DISABLE KEYS */;
INSERT INTO `habitat` VALUES (1,'African Forest',1),(2,'African Grasslands',34),(3,'Asian Forest',8),(4,'Reptile Center',17),(5,'Arctic Ring of Life',27),(6,'American Grasslands',18),(7,'Australian Outback',50);
/*!40000 ALTER TABLE `habitat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `species`
--

DROP TABLE IF EXISTS `species`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `species` (
  `sname` varchar(20) NOT NULL,
  `category` varchar(10) DEFAULT NULL,
  `diet` varchar(15) DEFAULT NULL,
  `hno` int NOT NULL,
  PRIMARY KEY (`sname`),
  KEY `fk_hno_hanitat_number` (`hno`),
  CONSTRAINT `fk_hno_hanitat_number` FOREIGN KEY (`hno`) REFERENCES `habitat` (`habitat_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `species`
--

LOCK TABLES `species` WRITE;
/*!40000 ALTER TABLE `species` DISABLE KEYS */;
INSERT INTO `species` VALUES ('Artic Fox','Mammal','Carnivorous',5),('Camel','Mammal','Herbivore',3),('Chimpanzee','Primate','Omnivores',1),('Chinese Alligator','Reptile','Carnivorous',4),('Giraffe','Mammal','Herbivore',2),('Gorilla','Primate','Omnivores',1),('Greater Flamingo','Bird','Carnivorous',1),('Kangaroo','Marsupial','Herbivore',7),('Lion','Mammal','Carnivorous',2),('Macaque','Mammal','Omnivores',3),('Matamata Turtle','Reptile','Carnivorous',4),('Ostrich','Bird','Omnivores',1),('Polar Bear','Mammal','Carnivorous',5),('Red Pnada','Mammal','Herbivore',3),('Reticulated python','Reptile','Carnivorous',4),('Rhinoceros','Mammal','Herbivore',2),('Tiger','Mammal','Carnivorous',3),('Wallaby','Marsupial','Herbivore',7),('Wildbeest','Mammal','Herbivore',2),('Wolf','Mammal','Carnivorous',6),('Zebra','Mammal','Herbivore',2);
/*!40000 ALTER TABLE `species` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `works_in`
--

DROP TABLE IF EXISTS `works_in`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `works_in` (
  `emp_id` int NOT NULL,
  `hno` int NOT NULL,
  PRIMARY KEY (`emp_id`,`hno`),
  KEY `fk_hno_habitat_number` (`hno`),
  CONSTRAINT `fk_emp_id_for_habitat` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`emp_id`),
  CONSTRAINT `fk_hno_habitat_number` FOREIGN KEY (`hno`) REFERENCES `habitat` (`habitat_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `works_in`
--

LOCK TABLES `works_in` WRITE;
/*!40000 ALTER TABLE `works_in` DISABLE KEYS */;
INSERT INTO `works_in` VALUES (1,1),(5,1),(9,1),(12,1),(13,1),(14,1),(15,1),(19,1),(24,1),(29,1),(31,1),(35,1),(37,1),(38,1),(39,1),(7,2),(10,2),(11,2),(28,2),(30,2),(34,2),(40,2),(41,2),(42,2),(6,3),(7,3),(8,3),(19,3),(20,3),(29,3),(32,3),(33,3),(36,3),(46,3),(2,4),(17,4),(22,4),(23,4),(25,4),(3,5),(16,5),(21,5),(23,5),(26,5),(27,5),(43,5),(44,5),(18,6),(45,6),(47,6),(4,7),(23,7),(38,7),(44,7),(48,7),(49,7),(50,7);
/*!40000 ALTER TABLE `works_in` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-11 14:58:33
