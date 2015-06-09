-- MySQL dump 10.13  Distrib 5.6.17, for Win64 (x86_64)
--
-- Host: localhost    Database: sombra
-- ------------------------------------------------------
-- Server version	5.5.41

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
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'TV, Audio, Video',NULL),(2,'TV',1),(3,'Home cinema',1),(4,'Photo and video',1),(5,'Digital camera',4),(6,'Action camera',4),(7,'PC, Notebook, Laptop',NULL),(8,'PC',7),(9,'Laptop',7),(10,'Notebook',7);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `location` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES (95,'Lviv'),(96,'Kiev'),(97,'Ivano Frankovs'),(98,'Ternopil'),(99,'Odessa'),(103,'testing city');
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persistent_logins`
--

DROP TABLE IF EXISTS `persistent_logins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `persistent_logins` (
  `username` varchar(64) NOT NULL,
  `series` varchar(64) NOT NULL,
  `token` varchar(64) NOT NULL,
  `last_used` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`series`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persistent_logins`
--

LOCK TABLES `persistent_logins` WRITE;
/*!40000 ALTER TABLE `persistent_logins` DISABLE KEYS */;
/*!40000 ALTER TABLE `persistent_logins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `inStock` char(1) NOT NULL,
  `seller` int(11) NOT NULL,
  `cond` varchar(50) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `price` decimal(15,2) NOT NULL,
  `description` mediumtext,
  `img` varchar(100) DEFAULT NULL,
  `category` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'KDL-32W503A ','1',1,'new','99',7854.00,'32-�������� LED-��������� Sony KDL32W503A ���������� ����������� MHL-������, ����� ������� ����� �������� ��� ��������� �������, � ����� ����� ������ �� ���� ������, ������� ��� ������� � ������ ������ 178 �������� ������������� ����������� �������� ����������� ��� ��������� ����� ������������.\r\n\r\n��������� ����� �����������, ������������� �� ������� ����������, LED-��������� ���������� ���� � ������ �������, ����������� �������� �������������.\r\n���������: http://rozetka.com.ua/sony_kdl32w503a_black/p1237740/','tv/1',2),(2,'LG 42LB552V','1',1,'new','95',6854.00,'IPS ������\r\n������ ������������� ���� ������ � �������� ����������� LG ����������� � ������. LED ���������� LG ������������ ����� ������ �����������, ��� ���������� � ������������ � ������ ��������� ������������� IPS-������.\r\n\r\nFull HD\r\n���������� Full HD ����������� �������� �������� ����������� ��������� ������ �������������, �������� � ������������� ��������.\r\n���������: http://rozetka.com.ua/lg_42lb552v/p1559807/','tv/2',2),(3,'LG 32LB563V','1',1,'new','97',8657.00,'IPS ������\r\n������ ������������� ���� ������ � �������� ����������� LG ����������� � ������. LED ���������� LG ������������ ����� ������ �����������, ��� ���������� � ������������ � ������ ��������� ������������� IPS-������.\r\n\r\nFull HD\r\n���������� Full HD ����������� �������� �������� ����������� ��������� ������ �������������, �������� � ������������� ��������.','tv/3',2),(4,'UE32H5000 ','1',1,'new','98',32423.00,'������� ����� ���������� � ������� Full HD\r\n������� ����� ������� �������������� ������������� �� ������ � ������� �������� �����������. ��������� ����������� ���������� ���������� �� ��������� � �������� HD ������������ ��� ��������� Samsung Smart TV �������� �������� ����� �������� �� ���������� � ��� ����������� ���������� � ������������� ���� ���������� �������, ������������ �� ������. ����� ������ ����� ��������� ����������� � ������� Full HD �� �� �������� �������� ���� ������� �� ��������� � ������ � ������� ����������� ����������. �������� ��� ���� ��� �������� ����������� ���������� � ������� ������� �������� (HD �������).','tv/4',2),(5,'LG 42LB671V','1',1,'by','96',34654.00,'LG 42LB671V � ��� ��������������� 42-�������� ��������� � IPS-�������� � LED-����������, ����������� � ���������� ���������� ������.\r\n\r\n������� �����, �������� ����������� \r\n������ Cinema Screen ������ ��������� ��������� ��� ������ ���������, � ���� � ����, � ������ ������ �� ��������� � ����������� �����������.','tv/5',2),(6,'LG 32LB582V','0',1,'new','99',23568.00,'����� ���������\r\n�������� �������� ��������� ����� ���������� ������������, ��� ����������� �� ���� ���������� �� �� ���� ��� ���. � ������� LG Smart Share �� ����� ���������� ���������� � ��� ����. � ������� ����� ������� ������ LG, �� ������ ����� � ������� � �������� ������ � ����� �������������� ������������ �������� ��� ����.','tv/6',2),(7,'UE22H5600','0',1,'new','96',85646.00,'������� Clear Motion Rate ������������ ������ �������� ����������� �����������\r\n� ������� ���������� ���������� Clear Motion Rate (CMR) ���� ������� �������� �� ������ ���������� ����� ������������ � ������� ���������. ����� ������� �������� CMR �������� ����� ������ �������� � ���������� �������, ��������� ���� �� �������� ������ ������������ �� ��������� ������� � ����� action, ���������� ���������� � ������ ��������������� ��������. ��� ���������� ����� ��������� ��������� ���������� ������ � ����� ������� ��������� ���������� �����������, ������ ����������� ����������� � ����������� �������� ���������. ��� ��������, ��� �������� ������ ����� ���� � �����.','tv/7',2),(8,'UE32H4510','0',1,'new','97',426754.00,'������ ��������������� ��������� ��� ��������� ������������������\r\n��������� ������� ���������������� ���������� ������������������ ������ Smart-���������� Samsung ����������� ����������. ������� ���������, �� ����� ������������ �������. ������ ��������� �������� ������� � ������ ���������������, ������� �������������� ������������ ������� � ������� � ���������. ��������� ������� � �������� ���������� �� ������ ������ ����� �������� �������� � �������� ������ ������������ �� ���������.','tv/8',2),(9,' UE32FH4003','0',1,'','99',5432.00,'������� Clear Motion Rate ������������ ������ �������� ����������� �����������\r\n� ������� ���������� ���������� Clear Motion Rate (CMR) ���� ������� �������� �� ������ ���������� ����� ������������ � ������� ���������. ����� ������� �������� CMR �������� ����� ������ �������� � ���������� �������, ��������� ���� �� �������� ������ ������������ �� ��������� ������� � ����� action, ���������� ���������� � ������ ��������������� ��������. ��� ���������� ����� ��������� ��������� ���������� ������ � ����� ������� ��������� ���������� �����������, ������ ����������� ����������� � ����������� �������� ���������. ��� ��������, ��� �������� ������ ����� ���� � �����.','tv/9',2),(10,'LG 32LB572U','0',1,'new','95',52934.00,'IPS ������\r\n������ ������������� ���� ������ � �������� ����������� LG ����������� � ������. LED ���������� LG ������������ ����� ������ �����������, ��� ���������� � ������������ � ������ ��������� ������������� IPS-������.\r\n\r\nSmartShare\r\n�������������� � ����������� ����� ������� ��������� �� ������� ����������� �������� ������, �� ����� ���������� ����� ����������� ������� � ����� ���������, �� ��� ����������\r\n\r\n��������� �������� �������������\r\n���������� IPS ���������� �������� ������������ ����� ������� ������� ��������� ����������� � ���������� HD. IPS ������� ���������� �������� ����� ��������� �����������.','tv/1',2),(11,'LG 42LB653V','1',1,'new','98',63464.00,'��������� LG 42LB653V ����� ������������ ����������� Full HD � ������������ ��������� �����������.\r\n\r\n��� ������� ������������, ����������� ����� ��� ���������, �������� �������� �������� � ��������� ���������� ����. � ��� ��� ����� �������� ��� ����� ����� � ��� �� �� �� ������������� ������������ ������, �������� �������� �� ����������.\r\n\r\n����� ������ ������������ ������� �������� ������� ��������� ������ DVB-S2/DVB-C/DVB-T2, ��������� ����������, ������� �������� ������ ������ � ��������� �����������, � ����� ��������� MHL.','tv/2',2),(12,'UE48H4200','1',1,'new','96',42353.00,'������������ ����������� �� ��������� ����������� ����� � ������ Football Mode\r\n��� ��������� ����������� ����� � ������ Football Mode �� ��� ����� ������������� �� ��������. ������ ����� �� ���� � ��� ������ ����� ������ ����� ����, ��� ��������� ����������� � ������������ �� ������. ������ ���������� ��� ���� ���� ����������� ������ ������� ���������� �����������.','tv/3',2),(13,'UE19H4000','1',1,'new','95',43456.00,'������� Clear Motion Rate ������������ ������ �������� ����������� �����������\r\n� ������� ���������� ���������� Clear Motion Rate (CMR) ���� ������� �������� �� ������ ���������� ����� ������������ � ������� ���������. ����� ������� �������� CMR �������� ����� ������ �������� � ���������� �������, ��������� ���� �� �������� ������ ������������ �� ��������� ������� � ����� action, ���������� ���������� � ������ ��������������� ��������. ��� ���������� ����� ��������� ��������� ���������� ������ � ����� ������� ��������� ���������� �����������, ������ ����������� ����������� � ����������� �������� ���������. ��� ��������, ��� �������� ������ ����� ���� � �����.','tv/4',2),(14,'UE40H6350','0',1,'new','96',5868.00,'������� Clear Motion Rate ������������ ������ �������� ����������� �����������\r\n� ������� ���������� ���������� Clear Motion Rate (CMR) ���� ������� �������� �� ������ ���������� ����� ������������ � ������� ���������. ����� ������� �������� CMR �������� ����� ������ �������� � ���������� �������, ��������� ���� �� �������� ������ ������������ �� ��������� ������� � ����� action, ���������� ���������� � ������ ��������������� ��������. ��� ���������� ����� ��������� ��������� ���������� ������ � ����� ������� ��������� ���������� �����������, ������ ����������� ����������� � ����������� �������� ���������. ��� ��������, ��� �������� ������ ����� ���� � �����.','tv/1',2),(15,'LG 28LB450U ','1',1,'','95',53643.00,'28LB450U � ��� LED-��������� �� LG, ������� �������� ������������� �������������� ����������� � �������� ������� ���� ������������ �� ��������� �������� � ������� ������� ��������.\r\n\r\n��������������\r\n������������� �������� ��� ������ � ������������ ������������. �� ��������������� � ������������ �������������� ������� � �� ����������� ���������������� ���� ����� ������ �� ����.','tv/5',2),(16,'UE32H6400 ','1',1,'new','97',565456.00,'������� Clear Motion Rate ������������ ������ �������� ����������� �����������\r\n� ������� ���������� ���������� Clear Motion Rate (CMR) ���� ������� �������� �� ������ ���������� ����� ������������ � ������� ���������. ����� ������� �������� CMR �������� ����� ������ �������� � ���������� �������, ��������� ���� �� �������� ������ ������������ �� ��������� ������� � ����� action, ���������� ���������� � ������ ��������������� ��������. ��� ���������� ����� ��������� ��������� ���������� ������ � ����� ������� ��������� ���������� �����������, ������ ����������� ����������� � ����������� �������� ���������. ��� ��������, ��� �������� ������ ����� ���� � �����.','tv/6',2),(17,'32P1300DG ','1',1,'nwe','98',45455.00,'��� �� �� �� ������������ ��������, �����, ���� ��� �������������� ���������, ��������� Toshiba 32P1300DG � ���������� 32 ������ � ������� ��������� ����������� ��������� ��� ������ ������� � ������������ ������������ �� ���������.\r\n\r\n���������� ������ � ��������� ����� ��� �����, ������� � ��������� ������� ���������. ������� �������� HDMI �������� ��� ������� ����������� ������, ���������� ���������� ��� �������, �������������� ������. ����� ����, Toshiba 32P1300DG ����� ������������ � ��� �������, ��������� ��� � ����������.','tv/7',2),(18,'LG 32LB580U','1',1,'new','96',8547.00,'����� ���������\r\n�������� �������� ��������� ����� ���������� ������������, ��� ����������� �� ���� ���������� �� �� ���� ��� ���. � ������� LG Smart Share �� ����� ���������� ���������� � ��� ����. � ������� ����� ������� ������ LG, �� ������ ����� � ������� � �������� ������ � ����� �������������� ������������ �������� ��� ����.','tv/8',2),(19,'UE40H6410','1',1,'new','96',545656.00,'������� Clear Motion Rate ������������ ������ �������� ����������� �����������\r\n� ������� ���������� ���������� Clear Motion Rate (CMR) ���� ������� �������� �� ������ ���������� ����� ������������ � ������� ���������. ����� ������� �������� CMR �������� ����� ������ �������� � ���������� �������, ��������� ���� �� �������� ������ ������������ �� ��������� ������� � ����� action, ���������� ���������� � ������ ��������������� ��������. ��� ���������� ����� ��������� ��������� ���������� ������ � ����� ������� ��������� ���������� �����������, �������� ���������� ����������� � ���������� �������� ���������. ��� ��������, ��� �������� ������ ����� ���� � �����.','tv/9',2),(20,'LG 32LB563U','1',1,'new','97',34223.00,'IPS ������\r\n������ ������������� ���� ������ � �������� ����������� LG ����������� � ������. LED ���������� LG ������������ ����� ������ �����������, ��� ���������� � ������������ � ������ ��������� ������������� IPS-������.','tv/1',2),(21,'UE40H5203 ','1',1,'new','95',6274.00,'����� Smart-��������� Samsung � ������ ��� ����� � �������\r\n��� Smart-��������� Samsung �������� ��������������� �������� ����������� ����������, ������������� ����������, T� ��������� � ���������� ����� � ������� ������� Smart Hub. ','tv/2',2),(22,'Philips HTB4570 ','1',1,'new','99',3434.00,'Smart TV ��� ������� � ��������-������� � ��������������� �������� �� ��\r\n�������� ��������� Philips � ������������� Blu-ray �� Smart TV �������� ��� ��������� �������, � ��� ����� Net TV, SimplyShare � MyRemote. Net TV ��������� ������ � ������-�������� � ������������ �� ����� ����������, �������� � ������� ����� �� �������. ������� SimplyShare ��������� �������������� ������ � �����, � ����� ������������� ���� � ����������, �� ������� � ������. � ��� ������ ���������� Philips MyRemote ����� ������������ �������� ��� ���������� �� � �������� ������ �� ��������� ����������.','homeCinema/1',3),(23,'Philips HTL3140B ','1',1,'new','95',85445.00,'����������� ����������� �������� ���������������� ��������� ��� ��������� �� ��������� ����� ������ ������! ������ �������, �� ����� ������� �������������� � ������� �������� ������ � ��������� ��������� � ������� MP3 ����� Music iLink\r\n\r\n������� ����������� � ���������� � ���������� NFC �� Bluetooth ����� ��������.','homeCinema/2',3),(24,'LG NB4540','1',1,'new','98',453453.00,'4.1-��������� ��������\r\n�������� �� ��������� �������, � ����� ������� ������� ���������� ����������� 4.1-��������� �������. 4.1-��������� ���� ��������� 320 �� ������������ ����������� ������ ����������� �� �������������.\r\n���������������� ������ (������ 35 ��!)\r\n����������� ��������������� �� ��������� ���������� � �� ������ ��������� (������ 35 ��), ��������� ���������� ������������� ���������������� ��������� ������� 35 �� � ������� ���������� ��������.','homeCinema/3',3),(25,'Yamaha BDX-610 ','1',1,'new','97',426345.00,'5.1-��������� ������� ����������� �������� � �������������� Blu-ray\r\n������� BDX-610 ������� �� �������� ��������� 500 ��, ���� �� � ���������, � ������������ ��������� 5.1 ��������� ���������� ��������. � �������� � ������� ������������� Blu-Ray �������� ��� �� ����������� ������� ��� ����������� ����� � �����������, ����������� �� Blu-Ray �����.','homeCinema/4',3),(26,'Philips HTB5550G/51 ','1',1,'new','96',435345.00,'������ � �������� �������� ���� 1000 ��\r\n�������� ��������� Philips ��������� ���������� ���������� �������� ������ � �������. ��������� 15-�� ��������� ��-���������� � ������ ������� ���� ����� ������ � ���������� ������. ��� ����������� ������������� �������� ������ ������ ������� �������� �������������� Bass Reflex � �������� ������������, ������� � 3 ���� ������ ��������.','homeCinema/5',3),(27,'Fujifilm FinePix X-M1','1',1,'new','96',234234.00,'�������� ������� ��� � �������� ���������� ����� � ���������� ������.','camera/1',5),(28,'Sony Alpha 3500','1',1,'new','98',45235.00,'����������� Sony Alpha 3500 ������� �������� Exmor APS-C CMOS � ����������� 20.1 ����������� ������������ � ���������� ������� ����������� ����������� Bionz. ������ ��� ����������� ���������������� ����������� ������� ������.\r\n\r\n������� ������� Exmor APS HD CMOS � ����������� 20.1 ������������\r\n������� Exmor APS HD CMOS �������� ������� � ������� ������������ � ������� ���������� � � ����� �������� ������. ������� �������� ���������� �������� ��������� ���������-��������� ��������������, ����������� ������� ����, ��������� ������� �� ��������� ������������ ����������� � �������� �������������� ��������� � ������� ������������.','camera/2',5),(29,'Sony Alpha 7 28-70mm Kit','1',1,'new','98',5634.00,'���������� �� ����� ������������� ������\r\n������� ���������. ������� ������ ����������������� �������� ��������� ���������� 24.3 ��. ���������� ����� ������ � ����� � ������� ������� ��������� ��������������� � ������������ OLED � ������� �����������. ���������� ���������� ���� ��� ������ � ������� ����� ��������� � ���� 35-�� ������������� ������ �� �������� �����������.','camera/3',5),(30,'Sony Alpha 7R Body','1',1,'new','97',52343.00,'������������� ������. ��������� ������\r\n��� Sony Alpha 7R � ����� ��������� � ������ � ����* 35-�� ������������� ������ �� �������� ����������� (�������� � ��������� �� ������������) ��� ������ ������������. ������� ���������. ������� ���������� ������ ��������� ���������� 36.3 �� � ���������� ����������� ������� ������ ������. ���������� ���������� ���� � ������ �������, �� ������� �� ������ ������, ��� ������ � ����� ������.','camera/4',5),(31,'GoPro HERO4 Black Standard Edition','0',1,'new','98',34234.00,'HERO4 Black � ����� ��������� ������ GoPro, ����� ������������ ������� ������������������� � ������������, ����� ���������� Wi-Fi, �������� ������� � ���������� 4K �� ��������� 30 ������ � ������� � ����� ������ 12 �� ������.\r\n\r\n� ��� ���� ����� � ������\r\n��������� HERO4 Black � ��� ���� ������, ������� ������ � ��� ���� ���� ��� � ������-���������������. ��������� ����� ���� ����� ������ ����� � ������. ����� ������� � ���������� �������� ��� ������������� ������, � ���������� ������������ ����� �� �������� ��� � ���������� ����� �������.','action/1',6),(32,'GoPro (CHDHA-301)','1',1,'new','98',64556.00,'HERO � ��������� ������� ��� ���������� ������. ���������� 1080 ��� 30 �/� � 720 ��� 60 �/�, ������� ������� QuikCapture, SuperView � ����� Auto Low Light �������� ��� ������ ��� ��������� ����������������� �������� ������.\r\n\r\n������������� ������\r\n�������� 5 �� ����������, ����� ���������� � �������� �� Facebook ��� Instagram. ��� �������� � ������ Time Lapse, ������� ������ ������ ������ ��� �������. ��� ������, ���� ���� ������ ���������� ���-�� �� ������������ ��� ������, � ������ ������ ����������. ����� �� ������� ������� ��������� ����������. ����� �������� ���������� \"��������\" 5 ������� � ������� � ��� ����������� ��� ��� ������ ��������� ��������.','action/2',6),(33,'Everest Game 9088','1',1,'new','96',4545.00,'Everest Game 9088 � ������ ��������� ��������, ������ ������������ ������������������, ������ �������� ������� � ����������. �� ������ �������� �������� �� ���� � ����� Everest Game 9088 ������ ���������� ��� ���.\r\n\r\nEverest Game 9088 � ��� ���������� �������� ������, ��������� �� ���� ������������ �����������, ��������� ����������� � ���������������� ������� ������������� ����� ��������. ��� ������� ������� ������, ������� �������� ��������� ��������������� ����������� �������� � ������������������.\r\n\r\n������� ��������� Everest Game 9088 �� ����������� ��� ���� ������� ����� ����� ������������:\r\n\r\n���� � ������������� ����������� ����������� � ������������� ������������ ��������\r\n��������� �������� ��� ��������� Full HD Video\r\n���������� ������ � 3D ��������\r\n����������� ����� ��������� ��������� ������','pc/1',8),(34,'Everest Home 8060','1',1,'new','96',5445.00,'��������� Everest Home 8060 �� ���� ���������������� ���������� Intel Core i7 � ��������� ������� ��� ��������� �������������.\r\n\r\n������ ��������� Everest Home � ������ ���������� ���������, � ��� ���� �������� ������� ��� ����� ������������� ������������ �����. ���������� ���� ����� ������� �������� �������� ������ � ������������ ��������, ���������� �������� � ��������������� ������������, ����������� ������������ ����������� ������ � ������� ������� ����������� �������.\r\n\r\nEverest Home 8060 ������ �� ���� ����������� ����� Asus H81M-K. ������� ���������� ��������.','pc/2',8),(35,'Samsung Galaxy','1',1,'new','99',45345.00,'�������� ��� ���� ����� ��� � Samsung Galaxy Tab 3 Lite � ����� �����. ������, ��� � � ��� ����� ���������� ������, Samsung Galaxy Tab 3 Lite ���������� ����������� ����������� ��� ������ �� ����. �� ���� ��� ����� ��� �������� ������������������. Samsung Galaxy Tab 3 Lite ����� ������������ ���������, ������ � ��� ������ ���������� �� Samsung � Google.\r\n\r\n����������� � �����������\r\n������� Samsung Tab 3 Lite ��������� ��������� � ������, ��� ��� ����� ������ ����� ��� ����. ��� ������� 9.7 �� �� ������ ����� ����������������, ������� ������������ �� � ���� ������������. ������� ��������� ������, ��� ��� ����� ������ ������� � ����� � ������������ �������. �������� �� ������������, �� ������� ����� ��������, ������ ������� ������ ������� � ��� ��� ����� ��� ��������� �����.','laptop/1',9),(36,'HP 255 G3','1',1,'new','96',435345.00,'HP 255 G3 � ��������� �������, ������� �������� ������ ���������� �� �����. ���������� AMD, �������� ��� ������ � ����������� ������� � ���������� ����� ������-�����, � ������� ������ ������� HP 255 ��� ���������.\r\n\r\n������ ��� ������������� �� ����\r\n������ ������� � HP 255 �������� ��������� ������� ������ �� ����. ������� ������ ������������ �������� ������ �������� � ������� ��� ������� ������� ���, ��������������� ������ �����.','notebook/2',10),(38,'testProduct','1',27,'','101',45787.00,'�������� ������',NULL,10),(39,'test product 2','0',27,'','99',545454.00,'�������� ������',NULL,1),(40,'test_product','0',27,'new','103',3243443.00,'description ��������',NULL,8);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_location`
--

DROP TABLE IF EXISTS `product_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_location` (
  `idproduct` int(11) NOT NULL,
  `idlocation` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_location`
--

LOCK TABLES `product_location` WRITE;
/*!40000 ALTER TABLE `product_location` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'234432423','ferf4','f34f34f34f43','f4f4@fr.fr'),(2,'123456789','admin_first_name','admin_last_name','admin@email.com'),(3,'0974476766','admin_11FIRSTNAME','admin_11LASTNAME','admin_11LASTNAME@gmail.com'),(4,'123456789','admin_first_name','admin_last_name','admin@email'),(5,'123456789','admin_first_name','admin_last_name','admin@email'),(6,'123456789','admin_first_name','admin_last_name','admin@email'),(7,'123456789','admin_first_name','admin_last_name','admin@email'),(8,'123456789','admin_first_name','admin_last_name','admin@email'),(9,'123456789','admin_first_name','admin_last_name','admin@email'),(10,'123456789','admin_first_name','admin_last_name','admin@email'),(11,'123456789','admin_first_name','admin_last_name','admin@email'),(12,'123456789','admin_first_name','admin_last_name','admin@email'),(13,'123456789','admin_first_name','admin_last_name','admin@email'),(14,'123456789','admin_first_name','admin_last_name','admin@email'),(15,'0234567','a','a','admin@gmail.com'),(16,'123456789','admin_first_name','admin_last_name','admin@email'),(17,'123456789','admin_first_name','admin_last_name','admin@email'),(18,'123456789','admin_first_name','admin_last_name','admin@email'),(19,'123456789','admin_first_name','admin_last_name','admin@email'),(20,'123456789','admin_first_name','admin_last_name','admin@email'),(21,'123456789','admin_first_name','admin_last_name','admin@email'),(22,'+380974476766','Ivan','Last name','asdasdasdqd2q3d3@gmail.com'),(23,'+380974476766','admin999firatName','admin999lastName','admin999@gmail.com'),(24,'+380974476766','admin_111Name','admin_111LastName','admin_111@gmail.com'),(25,'+380974476766','userFirstName','userLastName','user@gmail.com'),(26,'+380964134544','????????','????????','mariana@gmail.com'),(27,'232131232313','admin','admin','admin@gmail.com'),(28,'0974476766','userFirstName','userLastName','user@gmail.com'),(29,'0974476766','user_test_first_name','last_name_user_test','user_test@df.com'),(30,'1234567','user','user','alina@gmail.com'),(31,'0974476766','alina','alina','alina2@gmail.com');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_authentication`
--

DROP TABLE IF EXISTS `user_authentication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_authentication` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_login` varchar(50) NOT NULL,
  `user_password` varchar(60) NOT NULL,
  `user_enable` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_name_UNIQUE` (`user_login`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_authentication`
--

LOCK TABLES `user_authentication` WRITE;
/*!40000 ALTER TABLE `user_authentication` DISABLE KEYS */;
INSERT INTO `user_authentication` VALUES (1,'admin_0','$2a$10$gNvltgwY95CfDGfOHOd0j.T7l4aAjvthtmWxNlV9hYG6MTh.1Rfj2',0),(2,'admin_10','$10$gNvltgwY95CfDGfOHOd0j.T7l4aAjvthtmWxNlV9hYG6MTh.1Rfj2',0),(3,'admin_11','$10$gNvltgwY95CfDGfOHOd0j.T7l4aAjvthtmWxNlV9hYG6MTh.1Rfj2',1),(4,'admin_12','$10$gNvltgwY95CfDGfOHOd0j.T7l4aAjvthtmWxNlV9hYG6MTh.1Rfj2',1),(5,'admin_13','$10$gNvltgwY95CfDGfOHOd0j.T7l4aAjvthtmWxNlV9hYG6MTh.1Rfj2',1),(6,'admin_14','$10$gNvltgwY95CfDGfOHOd0j.T7l4aAjvthtmWxNlV9hYG6MTh.1Rfj2',1),(7,'admin_15','$10$gNvltgwY95CfDGfOHOd0j.T7l4aAjvthtmWxNlV9hYG6MTh.1Rfj2',1),(8,'admin_16','$10$gNvltgwY95CfDGfOHOd0j.T7l4aAjvthtmWxNlV9hYG6MTh.1Rfj2',1),(9,'admin_17','$10$gNvltgwY95CfDGfOHOd0j.T7l4aAjvthtmWxNlV9hYG6MTh.1Rfj2',1),(10,'admin_18','$10$gNvltgwY95CfDGfOHOd0j.T7l4aAjvthtmWxNlV9hYG6MTh.1Rfj2',1),(11,'admin_19','$10$gNvltgwY95CfDGfOHOd0j.T7l4aAjvthtmWxNlV9hYG6MTh.1Rfj2',1),(12,'admin_20','$10$gNvltgwY95CfDGfOHOd0j.T7l4aAjvthtmWxNlV9hYG6MTh.1Rfj2',1),(13,'admin_21','$10$gNvltgwY95CfDGfOHOd0j.T7l4aAjvthtmWxNlV9hYG6MTh.1Rfj2',1),(14,'admin_22','$10$gNvltgwY95CfDGfOHOd0j.T7l4aAjvthtmWxNlV9hYG6MTh.1Rfj2',1),(15,'admin_23','$10$gNvltgwY95CfDGfOHOd0j.T7l4aAjvthtmWxNlV9hYG6MTh.1Rfj2',1),(16,'admin_24','$10$gNvltgwY95CfDGfOHOd0j.T7l4aAjvthtmWxNlV9hYG6MTh.1Rfj2',1),(17,'admin_25','$10$gNvltgwY95CfDGfOHOd0j.T7l4aAjvthtmWxNlV9hYG6MTh.1Rfj2',1),(18,'admin_26','$10$gNvltgwY95CfDGfOHOd0j.T7l4aAjvthtmWxNlV9hYG6MTh.1Rfj2',1),(19,'admin_27','$10$gNvltgwY95CfDGfOHOd0j.T7l4aAjvthtmWxNlV9hYG6MTh.1Rfj2',1),(20,'admin_28','$10$gNvltgwY95CfDGfOHOd0j.T7l4aAjvthtmWxNlV9hYG6MTh.1Rfj2',1),(21,'admin_29','$10$gNvltgwY95CfDGfOHOd0j.T7l4aAjvthtmWxNlV9hYG6MTh.1Rfj2',1),(23,'admin_9999','$2a$10$yKeeMawfB1ZdaEiQvMo5Wu1QZ9ow89a1y/GfSqGENz6HBI9TEiY92',1),(24,'admin_111','$2a$10$8NQRF8Tb3JjI9FlfQE/oP.EJCLrYxJXtvXESJZS5N.KVxSSORw/uG',1),(27,'admin','$2a$10$04bP.XHXGV6FI9Cu/6G16e1IEK7pWUzTjktnxWu8e49y9txT0ZFuG',1),(28,'user','$2a$10$t8nhF65FkslmLjts8CJqFew7N41L6hRXRZ0aKiI5QeyDXGyDzkfj6',1),(29,'user_test','$2a$10$UzNX2l72CdiJTaoiWlPPm.RoKpjLTwOZ3vJCj5sTG0WSyYRLaFPWq',1),(30,'alina','$2a$10$qX1cDnv6BLR7v9EHqhhOeOXTO.2bBD9l7edyqHE4FRSJYjwGGMa9i',1),(31,'alina2','$2a$10$hPHRV2jI3/7kCBjKH.LDB.CHWpDpljoEok3rtvZuzhbSmcuwcNR/O',1);
/*!40000 ALTER TABLE `user_authentication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_authorization`
--

DROP TABLE IF EXISTS `user_authorization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_authorization` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_authorization`
--

LOCK TABLES `user_authorization` WRITE;
/*!40000 ALTER TABLE `user_authorization` DISABLE KEYS */;
INSERT INTO `user_authorization` VALUES (1,1),(2,1),(3,1),(4,1),(5,2),(6,2),(7,2),(8,2),(9,2),(10,2),(11,2),(12,2),(13,2),(14,2),(15,2),(16,2),(17,2),(18,2),(19,2),(20,2),(21,2),(22,2),(23,2),(24,2),(25,2),(26,2),(27,1),(28,2),(29,2),(30,2),(31,2);
/*!40000 ALTER TABLE `user_authorization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `role_name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (1,'ROLE_ADMIN'),(2,'ROLE_REGULAR_USER');
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-06-07 19:19:19
