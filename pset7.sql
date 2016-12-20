-- MySQL dump 10.13  Distrib 5.5.49, for debian-linux-gnu (x86_64)
--
-- Host: 0.0.0.0    Database: pset7
-- ------------------------------------------------------
-- Server version	5.5.49-0ubuntu0.14.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `history`
--

DROP TABLE IF EXISTS `history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `history` (
  `user_id` int(11) NOT NULL,
  `date_time` varchar(32) NOT NULL,
  `symbol` varchar(24) NOT NULL,
  `transaction_type` varchar(16) NOT NULL,
  `shares` int(11) NOT NULL,
  `price` decimal(64,4) NOT NULL,
  `cash_involved` decimal(64,4) NOT NULL,
  KEY `date_time` (`date_time`),
  KEY `user_id` (`user_id`),
  KEY `symbol` (`symbol`),
  KEY `transaction_type` (`transaction_type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history`
--

LOCK TABLES `history` WRITE;
/*!40000 ALTER TABLE `history` DISABLE KEYS */;
INSERT INTO `history` VALUES (18,'19-Dec-2016 Monday 23:57:38','FREE','Buy',500,1.1500,575.0000),(18,'19-Dec-2016 Monday 23:58:18','FREE','Sell',500,1.1500,575.0000),(18,'19-Dec-2016 Monday 23:58:49','FREE','Buy',8000,1.1500,9200.0000),(18,'19-Dec-2016 Monday 23:59:04','GOOG','Buy',1,795.3600,795.3600),(18,'20-Dec-2016 Tuesday 00:00:01','FREE','Sell',8000,1.1500,9200.0000),(18,'20-Dec-2016 Tuesday 00:00:02','GOOG','Sell',1,795.2100,795.2100),(17,'20-Dec-2016 Tuesday 00:25:18','FB','Buy',50,119.6000,5980.0000),(17,'20-Dec-2016 Tuesday 00:25:35','AAPL','Buy',25,116.8390,2920.9750),(17,'20-Dec-2016 Tuesday 00:26:02','FREE','Buy',100,1.1500,115.0000),(17,'20-Dec-2016 Tuesday 00:26:28','FB','Sell',50,119.6300,5981.5000),(17,'20-Dec-2016 Tuesday 00:26:28','FREE','Sell',100,1.1500,115.0000),(17,'20-Dec-2016 Tuesday 00:29:23','AAPL','Sell',25,116.8500,2921.2500),(9,'20-Dec-2016 Tuesday 00:31:31','GOOG','Buy',10,795.4400,7954.4000),(9,'20-Dec-2016 Tuesday 00:31:54','FB','Buy',10,119.7572,1197.5720),(9,'20-Dec-2016 Tuesday 00:45:12','FB','Sell',10,119.7050,1197.0500),(9,'20-Dec-2016 Tuesday 00:45:13','GOOG','Sell',10,795.8100,7958.1000),(17,'20-Dec-2016 Tuesday 00:46:34','FREE','Buy',8000,1.1500,9200.0000),(17,'20-Dec-2016 Tuesday 00:46:44','AAPL','Buy',5,116.9700,584.8500),(17,'20-Dec-2016 Tuesday 00:47:17','FB','Buy',1,119.7500,119.7500),(17,'20-Dec-2016 Tuesday 01:05:23','FB','Sell',1,119.5400,119.5400),(17,'21-Dec-2016 Wednesday 00:03:43','FREE','Buy',12,1.1500,13.8000),(17,'21-Dec-2016 Wednesday 00:06:38','AAPL','Sell',5,117.1200,585.6000),(17,'21-Dec-2016 Wednesday 00:06:38','FREE','Sell',8012,1.1500,9213.8000),(17,'21-Dec-2016 Wednesday 00:07:01','FREE','Buy',10000,1.1500,11500.0000),(17,'21-Dec-2016 Wednesday 00:07:15','GOOG','Buy',10,796.3000,7963.0000),(17,'21-Dec-2016 Wednesday 00:15:19','FB','Buy',1,119.2800,119.2800),(17,'21-Dec-2016 Wednesday 00:20:16','FB','Sell',1,119.2350,119.2350),(17,'21-Dec-2016 Wednesday 00:20:17','FREE','Sell',10000,1.1500,11500.0000),(17,'21-Dec-2016 Wednesday 00:20:17','GOOG','Sell',10,796.8194,7968.1940),(17,'21-Dec-2016 Wednesday 00:20:37','FREE','Buy',15000,1.1500,17250.0000),(17,'21-Dec-2016 Wednesday 00:23:35','FREE','Sell',15000,1.1500,17250.0000),(17,'21-Dec-2016 Wednesday 00:25:08','GOOG','Buy',15,796.1100,11941.6500),(17,'21-Dec-2016 Wednesday 00:26:37','FB','Buy',2,119.1200,238.2400),(17,'21-Dec-2016 Wednesday 00:26:49','FB','Buy',1,119.1288,119.1288),(17,'21-Dec-2016 Wednesday 00:27:04','FREE','Buy',5,1.1500,5.7500),(17,'21-Dec-2016 Wednesday 00:27:16','FB','Sell',3,119.1100,357.3300),(17,'21-Dec-2016 Wednesday 00:27:17','GOOG','Sell',15,796.0100,11940.1500);
/*!40000 ALTER TABLE `history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portfolios`
--

DROP TABLE IF EXISTS `portfolios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portfolios` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `symbol` varchar(24) NOT NULL,
  `shares` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id_2` (`user_id`,`symbol`),
  UNIQUE KEY `user_id_3` (`user_id`,`symbol`),
  KEY `user_id` (`user_id`,`symbol`),
  KEY `user_id_4` (`user_id`),
  KEY `symbol` (`symbol`),
  KEY `id` (`id`),
  KEY `id_2` (`id`),
  KEY `user_id_5` (`user_id`),
  KEY `symbol_2` (`symbol`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portfolios`
--

LOCK TABLES `portfolios` WRITE;
/*!40000 ALTER TABLE `portfolios` DISABLE KEYS */;
INSERT INTO `portfolios` VALUES (44,17,'FREE',5);
/*!40000 ALTER TABLE `portfolios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL,
  `hash` varchar(255) NOT NULL,
  `cash` decimal(65,4) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'andi','$2y$10$c.e4DK7pVyLT.stmHxgAleWq4yViMmkwKz3x8XCo4b/u3r8g5OTnS',10000.0000),(2,'caesar','$2y$10$0p2dlmu6HnhzEMf9UaUIfuaQP7tFVDMxgFcVs0irhGqhOxt6hJFaa',10000.0000),(3,'eli','$2y$10$COO6EnTVrCPCEddZyWeEJeH9qPCwPkCS0jJpusNiru.XpRN6Jf7HW',10000.0000),(4,'hdan','$2y$10$o9a4ZoHqVkVHSno6j.k34.wC.qzgeQTBHiwa3rpnLq7j2PlPJHo1G',10000.0000),(5,'jason','$2y$10$ci2zwcWLJmSSqyhCnHKUF.AjoysFMvlIb1w4zfmCS7/WaOrmBnLNe',10000.0000),(6,'john','$2y$10$dy.LVhWgoxIQHAgfCStWietGdJCPjnNrxKNRs5twGcMrQvAPPIxSy',10000.0000),(7,'levatich','$2y$10$fBfk7L/QFiplffZdo6etM.096pt4Oyz2imLSp5s8HUAykdLXaz6MK',10000.0000),(8,'rob','$2y$10$3pRWcBbGdAdzdDiVVybKSeFq6C50g80zyPRAxcsh2t5UnwAkG.I.2',10000.0000),(9,'skroob','$2y$10$395b7wODm.o2N7W5UZSXXuXwrC0OtFB17w4VjPnCIn/nvv9e4XUQK',10003.1800),(10,'zamyla','$2y$10$UOaRF0LGOaeHG4oaEkfO4O7vfI34B1W23WqHr9zCpXL68hfQsS3/e',10000.0000),(17,'samy','$2y$10$PZ8COaGxxmdQdVfyiaNAWeJaSTU2dltxHw.GJJ9YeZyv9gJVoAi7m',13994.9612),(18,'sam','$2y$10$NQ4ST0.088ZrH7.XGNBfUew/zNNMrlUwFo9ubANH/dSBqizJNLkdK',9999.8500);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-12-20 19:05:17
