-- MySQL dump 10.13  Distrib 8.0.34, for macos13 (arm64)
--
-- Host: 127.0.0.1    Database: kitchenia
-- ------------------------------------------------------
-- Server version	8.0.35

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
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT 'null',
  `brand` varchar(100) DEFAULT 'null',
  `price` double DEFAULT '0',
  `image` varchar(200) DEFAULT 'null',
  `category` varchar(45) NOT NULL DEFAULT 'null',
  `quantity` int DEFAULT '0',
  `description` varchar(500) DEFAULT 'null',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'10-Piece Hard Anodized Ceramic Nonstick Cookware Set','KITCHENAID',229.99,'cookware1.webp','Cookware',100,NULL),(2,'Stainless Steel 11-Piece Cookware Set','AYSHA CURRY',149.99,'cookware2.webp','Cookware',100,NULL),(3,'Cucina 12-Piece Nonstick Cookware Set','RACHAEL RAY',159.99,'cookware3.webp','Cookware',100,NULL),(4,'Cookware set','ANOLON',299.99,'cookware4.webp','Cookware',100,NULL),(5,'Signature French Oven Cerise 28cm','LE CREUSET',750,'cookware5.jpeg','Cookware',100,NULL),(6,'Combo Cooker 26cm (3L)','LOGGE CAST IRON',169,'cookware6.webp','Cookware',100,NULL),(7,'Anolon Endurance+ Skillet Triple Pack','ANOLON',149,'cookware7.webp','Cookware',100,NULL),(8,'Induction Frypan & Saute 28cm with Detachable Handle Set 2 Piece','WOOL DIAMOND',299.99,'cookware8.webp','Cookware',100,NULL),(9,'Saucepan Set 3 Piece','ESSTEELE PER VITA',269,'cookware9.webp','Cookware',100,NULL),(10,'Nonstick Bakeware Set','AYESHA CURRY',59.99,'bakeware1.webp','Bakeware',120,NULL),(11,'4-Piece Toaster Oven Baking Set','AYESHA CURRY',59.99,'bakeware2.webp','Bakeware',120,NULL),(12,'Nonstick Bakeware Set','RACHAEL RAY',89.9,'bakeware3.webp','Bakeware',120,NULL),(13,'Covered Cake Pan & Muffin Pan','RACHAEL RAY',39.99,'bakeware4.webp','Bakeware',120,NULL),(14,'Cucina 10\'x15\' Crisper Pan Set','RACHAEL RAY',24.99,'bakeware5.webp','Bakeware',120,NULL),(15,'-Piece Nonstick Cookie Pan Set','RACHAEL RAY',29.99,'bakeware6.webp','Bakeware',120,NULL),(16,'9\'x13\' Ceramic Baking Dish','RACHAEL RAY',39.99,'bakeware7.webp','Bakeware',120,NULL),(17,'Lasagna Lover Pan','RACHAEL RAY',39.99,'bakeware8.webp','Bakeware',120,NULL),(18,'Oval Baker Set','RACHAEL RAY',49.99,'bakeware9.webp','Bakeware',120,NULL),(19,'Cucina 16-Piece Dinnerware Set','RACHAEL RAY',17.99,'tabletop1.webp','Bakeware',120,NULL),(20,'Cucina 16-Piece Dinnerware Set','RACHAEL RAY',299.99,'tabletop1.webp','Tabletop',140,NULL),(21,'Dinner Set of 12','DENBY HALO SPECKLE',324,'tabletop2.webp','Tabletop',140,NULL),(22,'12-Piece Dinner Set White','CASERO ORA',159.95,'tabletop3.webp','Tabletop',140,NULL),(23,'Dinner Set Duck Egg','ECOLOGY SPECKLE',99.95,'tabletop4.jpeg','Tabletop',140,NULL),(24,'Conran 16 Piece Dinner Set','PORTMEIRION SOPHIE',355,'tabletop5.webp','Tabletop',140,NULL),(25,'Pacific Pasta Bowls 22cm (Set of 6)','ROYAL DOULTON',139,'tabletop6.webp','Tabletop',140,NULL),(26,'Pacific Cereal Bowls 16cm (Set of 6)','ROYAL DOULTON',118,'tabletop7.webp','Tabletop',140,NULL),(27,'Pacific Mugs Set 6 Piece','ROYAL DOULTON',125,'tabletop8.webp','Tabletop',140,NULL),(28,'16 Piece Pacific Lines Dinner Set','ROYAL DOULTON',38.9,'tabletop9.webp','Tabletop',140,NULL),(29,'Ceramic 21-Ounce Bacon Grease Jar','AYESHA CURRY',49.99,'accessories1.webp','Accessories',160,NULL),(30,'Stainless Steel 3-Piece Nesting Mixing Bowl Set','AYESHA CURRY',59.99,'accessories2.webp','Accessories',160,NULL),(31,'4-Piece Cooking Utensil Set','AYESHA CURRY',24.99,'accessories3.webp','Accessories',160,NULL),(32,'Tool Crock','AYESHA CURRY',59.99,'accessories4.webp','Accessories',160,NULL),(33,'4-Way Box Grater','RACHAEL RAY',49.99,'accessories5.webp','Accessories',160,NULL),(34,'6-Piece Tools Set','RACHAEL RAY',28.99,'accessories6.webp','Accessories',160,NULL),(35,'2-Piece Evoo Oil And Vinegar Bottle Set','RACHAEL RAY',69,'accessories7.webp','Accessories',160,NULL),(36,'Nesting Mixing Bowl Set','RACHAEL RAY',48,'accessories8.webp','Accessories',160,NULL),(37,'6-Piece Knife Block Set','RACHAEL RAY',119.99,'accessories9.webp','Accessories',160,NULL),(38,'Ceramic 21-Ounce Bacon Grease Jar','RACHAEL RAY',49.99,'accessories1.webp','Accessories',160,NULL);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-29 15:24:57
