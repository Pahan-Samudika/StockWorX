CREATE DATABASE  IF NOT EXISTS `stockworx` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `stockworx`;
-- MySQL dump 10.13  Distrib 8.0.34, for macos13 (x86_64)
--
-- Host: localhost    Database: stockworx
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `buyerorder`
--

DROP TABLE IF EXISTS `buyerorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `buyerorder` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `productID` varchar(255) NOT NULL,
  `productname` varchar(100) DEFAULT NULL,
  `qty` int NOT NULL,
  `cost` double NOT NULL,
  `userID` varchar(20) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `paymethod` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `approved_by` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buyerorder`
--

LOCK TABLES `buyerorder` WRITE;
/*!40000 ALTER TABLE `buyerorder` DISABLE KEYS */;
INSERT INTO `buyerorder` VALUES (27,'24','Laptop',20,6000000,'31','15/2, New Park, Kandy','2023-10-26 05:05:43','Card Payment','In Delivery','6'),(28,'25','Desktop Computer',20,4000000,'30','15/2, New Park, Kandy','2023-10-26 05:32:53','Card Payment','In Delivery','6'),(29,'24','Laptop',1000,300000000,'32','14/A, City Plaza, Colombo 15','2023-10-26 05:42:00','Card Payment','Cancelled','32'),(31,'27','Computer Monitor',20,1200000,'32','15/2, 4th Floor, City Plaza, Colombo 14','2023-10-26 05:43:37','CashOnDelivery','Approved','6'),(32,'28','Keyboard and Mouse Combo',80,1200000,'32','15/2,4th Floor, City Plaza, Colombo 15 ','2023-10-26 05:44:24','CashOnDelivery','In Delivery','6'),(33,'24','Laptop',18,5400000,'30','895/5 King Street, Kandy','2023-10-26 05:45:34','Card Payment','Pending','6'),(34,'26','Tablet',25,3750000,'30','895/5 King Street, Kandy','2023-10-26 05:45:48','CashOnDelivery','Approved','6'),(35,'27','Computer Monitor',50,3000000,'30','895/5 King Street, Kandy','2023-10-26 05:46:01','Card Payment','In Delivery','6'),(36,'25','Desktop Computer',5,1000000,'33','2356AB, Galle Road, Panadura','2023-10-26 05:46:58','Card Payment','In Delivery','6'),(37,'28','Keyboard and Mouse Combo',100,1500000,'34','2356AB, Galle Road, Panadura','2023-10-26 05:47:07','CashOnDelivery','Approved','6'),(38,'24','Laptop',25,7500000,'32','2356AB, Galle Road, Panadura','2023-10-26 05:47:30','CashOnDelivery','In Delivery','6'),(39,'24','Laptop',1,300000,'30','15/2, New Kandy Road, Malambe','2023-10-26 05:50:06','Card Payment','Pending','6'),(40,'24','Laptop',5,1500000,'27','204,Galahitiyawa,\r\nGanemulla','2023-10-26 06:01:22','CashOnDelivery','Approved','6'),(41,'24','Laptop',40,12000000,'33','78/A, Ward Place, Colombo 10','2023-10-26 06:35:11','Card Payment','In Delivery','6'),(42,'25','Desktop Computer',10,2000000,'33','78/A, Ward Place, Colombo 10','2023-10-26 06:35:24','Card Payment','Approved','6'),(43,'26','Tablet',80,12000000,'33','78/A, Ward Place, Colombo 10','2023-10-26 06:35:38','CashOnDelivery','In Delivery','6'),(44,'25','Desktop Computer',50,10000000,'34','14/D, TB Jaya Road, New Town, Matara','2023-10-26 06:36:39','Card Payment','Approved','6'),(45,'25','Desktop Computer',100,20000000,'34','14/D, TB Jaya Road, New Town, Matara','2023-10-26 06:36:50','Card Payment','In Delivery','6'),(46,'25','Desktop Computer',200,40000000,'34','14/D, TB Jaya Road, New Town, Matara','2023-10-26 06:37:02','Card Payment','In Delivery','6'),(47,'26','Tablet',5,750000,'34','14/D, TB Jaya Road, New Town, Matara','2023-10-26 06:37:15','Card Payment','Approved','6'),(48,'28','Keyboard and Mouse Combo',1,15000,'34','14/D, TB Jaya Road, New Town, Matara','2023-10-26 06:37:25','CashOnDelivery','Cancelled','6'),(49,'25','Desktop Computer',1,200000,'34','14/D, TB Jaya Road, New Town, Matara','2023-10-26 06:37:35','Card Payment','Pending','6'),(50,'24','Laptop',50,15000000,'34','14/D, TB Jaya Road, New Town, Matara','2023-10-26 06:37:45','Card Payment','In Delivery','6'),(51,'26','Tablet',1,150000,'34','14/D, TB Jaya Road, New Town, Matara','2023-10-26 06:37:55','CashOnDelivery','Rejected','6'),(52,'26','Tablet',50,7500000,'34','14/D, TB Jaya Road, New Town, Matara','2023-10-26 06:38:09','Card Payment','In Delivery','6'),(53,'25','Desktop Computer',80,16000000,'31','Block A, 4th Floor, One Galle face, Kollupitiya  ','2023-10-26 06:40:06','Card Payment','Approved','6'),(54,'28','Keyboard and Mouse Combo',50,750000,'31','Block A, 4th Floor, One Galle face, Kollupitiya  ','2023-10-26 06:40:27','Card Payment','In Delivery','6'),(65,'24','Laptop',10,4500000,'3','204,Galahitiyawa,\r\nGanemulla','2023-10-29 03:56:14','Card Payment','In Delivery','6'),(66,'26','Tablet',15,2250000,'3','204,Galahitiyawa,\r\nGanemulla','2023-10-29 03:56:27','CashOnDelivery','Cancelled','3'),(67,'52','Mouse',50,400000,'3','204,Galahitiyawa,\r\nGanemulla','2023-10-29 03:57:13','Card Payment','Pending',NULL),(68,'60','Headphones21',70,10500000,'3','204,Galahitiyawa,\r\nGanemulla','2023-10-29 03:57:38','Card Payment','Rejected','6'),(69,'51','Keyboard',80,1200000,'3','','2023-10-29 03:57:55','Card Payment','Approved','6');
/*!40000 ALTER TABLE `buyerorder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedback` (
  `id` int NOT NULL AUTO_INCREMENT,
  `msg` text,
  `user_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `feedback_ibfk_1` (`user_id`),
  CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
INSERT INTO `feedback` VALUES (73,'Great service, very satisfied with the product!',34,'2023-10-29 09:06:17'),(74,'The response time to my inquiry was impressive.',34,'2023-10-29 09:06:49'),(75,'I had an issue with the delivery, but it was resolved quickly.',3,'2023-10-29 09:07:26'),(76,'Please add more variety to your product range.',3,'2023-10-29 09:07:41'),(77,'The product quality exceeded my expectations.',31,'2023-10-29 09:08:32'),(79,'The support team was very helpful and polite.',30,'2023-10-29 11:35:25'),(80,'I encountered some issues with the checkout process. Please look into it.',30,'2023-10-29 11:38:07'),(81,'The new feature is fantastic. It has improved my workflow significantly.',33,'2023-10-29 11:39:53'),(82,'Overall, I am satisfied with the product quality and service. Thank you!',33,'2023-10-29 11:40:30');
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `quantity` varchar(45) DEFAULT NULL,
  `category` varchar(45) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `maxunits` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (24,'Laptop',450000,'150','Laptops','Powerful laptop with the latest CPU and GPU for gaming and productivity','/images/products/laptop.jpg',250),(25,'Desktop Computer',200000,'20','Desktops','High-performance desktop computer for work and gaming.','/images/products/desktop.jpg',100),(26,'Tablet',150000,'190','Tablets','Lightweight and portable tablet for on-the-go productivity.','/images/products/tablet.jpeg',200),(27,'Computer Monitor',60000,'153','Monitors','High-resolution, large computer monitor for immersive viewing.','/images/products/monitor.jpg',200),(51,'Keyboard',15000,'100','Accessories','Wireless keyboard comfortable typing and navigation.','/images/products/keyboard.jpg',300),(52,'Mouse',8000,'450','Accessories','Ergonomic wireless mouse for smooth and precise control.','/images/products/mouse.jpeg',500),(60,'Headphones',150000,'250','Accessories','Noise-canceling headphones with Bluetooth connectivity.','/images/products/Apple-AirPods-Max.jpg',600),(63,'Phone',300000,'50','Mobile','Latest model iPhone with advanced features and Face ID.','/images/products/iphone.jpeg',100);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stockorder`
--

DROP TABLE IF EXISTS `stockorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stockorder` (
  `id` int NOT NULL AUTO_INCREMENT,
  `productId` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status` varchar(255) DEFAULT NULL,
  `approved_by` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stockorder`
--

LOCK TABLES `stockorder` WRITE;
/*!40000 ALTER TABLE `stockorder` DISABLE KEYS */;
INSERT INTO `stockorder` VALUES (14,24,30,'2023-10-26 09:33:58','Rejected',6),(17,26,60,'2023-10-26 09:34:39','Approved',6),(19,28,45,'2023-10-26 09:35:37','Pending',NULL),(20,51,35,'2023-10-26 09:36:45','Approved',6),(21,58,22,'2023-10-26 09:36:52','Pending',NULL),(22,27,70,'2023-10-26 09:37:44','Pending',NULL),(23,25,60,'2023-10-26 09:37:48','Pending',NULL),(24,51,55,'2023-10-26 09:37:55','Pending',NULL);
/*!40000 ALTER TABLE `stockorder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stockrequest`
--

DROP TABLE IF EXISTS `stockrequest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stockrequest` (
  `id` int NOT NULL AUTO_INCREMENT,
  `prodId` int DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `requested_by` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stockrequest`
--

LOCK TABLES `stockrequest` WRITE;
/*!40000 ALTER TABLE `stockrequest` DISABLE KEYS */;
INSERT INTO `stockrequest` VALUES (1,24,'Low on product, please restock','2023-10-22 22:14:29','7'),(2,26,'Urgent: Out of stock for item ','2023-10-23 19:26:13','7'),(3,28,'Inventory running low on product','2023-10-23 19:27:15','7'),(4,27,'Requesting additional units of item','2023-10-23 19:27:55','7'),(5,26,'Need to replenish supplies for item','2023-10-23 19:29:40','7'),(6,24,'Running out of stock for item, reorder needed','2023-10-23 19:30:12','7'),(7,24,'Stock levels critical for product, please refill','2023-10-25 14:02:31','7'),(8,24,'Running low on item, reorder request','2023-10-25 14:04:29','7'),(9,58,'Out of stock alert for item','2023-10-26 09:35:58','7'),(10,51,'Requesting restock for product','2023-10-26 09:36:06','7');
/*!40000 ALTER TABLE `stockrequest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `role` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `phone` varchar(10) DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (3,'Buyer','Buyer','buyer@gmail.com','0332260019','buyer','b1234'),(5,'Sales Manager','SalesManager','salesmanager@gmail.com','0332260019','salesmanager','s1234'),(6,'Manager','Manager','manager@gmail.com','0332260019','manager','m1234'),(7,'Warehouse Staff','WarehouseStaff','warehouse@gmail.com','0332260019','warehouse','w1234'),(8,'Admin','Admin','admin@gmail.com','0332260019','admin','a1234'),(9,'Manufacturer','Manufacturer','manufac@gmail.com','0332260019','manufac','m1234'),(30,'Ehome Computers PVT LTD','Buyer','ehome@gmail.com','0715698123','ehome','ehome'),(31,'Next Com PVT LTD','Buyer','nextcom@gmail.com','0114789123','nextcom','nextcom'),(32,'Game Street PVT LTD','Buyer','gs@gmail.com','0114568932','gamestreet','gamestreet'),(33,'Future Tech PVT LTD','Buyer','ftpl@gmail.com','033569231','futuretech','futuretech'),(34,'A Zone Enterprices PVT LTD','Buyer','AZ2000@gmail.com','0114789456','azone','azone');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-29 18:03:49
