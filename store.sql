-- MySQL dump 10.13  Distrib 5.6.23, for Win32 (x86)
--
-- Host: localhost    Database: sombra
-- ------------------------------------------------------
-- Server version	5.6.24-log

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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'TV & Home Theater',NULL),(2,'TV',1),(3,'Home cinema',1),(4,'Photo and video',1),(5,'Digital camera',4),(6,'Action camera',4),(7,'PC, Notebook, Laptop',NULL),(8,'PC',7),(9,'Laptop',7),(10,'Notebook',7);
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
INSERT INTO `product` VALUES (1,'Sony KDL40R510C ','1',1,'new','99',789.99,'Enjoy incredible picture quality and top notch entertainment. This elegantly slim LED TV boasts Full HD 1080p for incredible detail and Edge LED backlighting for boosted contrast. Built-in Wi-Fi lets you stream HD videos from popular services like Netflix, YouTube, and more.','tv/1',2),(2,'LG 49\" Class 4K','1',1,'new','95',564.80,'Welcome to the future with the stunning picture quality of the LG 49\" Class 2160p 120 Hz Smart HDTV. This 4K Ultra HD TV boasts the unparalleled quality of 4K resolution, 4x the resolution of Full HD. An LED display offers incredibly clarity and color no matter the ambient light while ISP panel technology makes this TV screen look great from any angle. With built-in wi-fi capability, it’s easy to connect your Smart TV to the internet to access your favorite movies, TV and more from sites like HuluPlus, Netflix, and CinemaNow. ','tv/2',2),(3,'LG 42\" Class Black','1',1,'new','97',654.99,'It\'s easy to enjoy LG\'s LB5800 with Smart TV*. Enjoy instant access to the best of the Internet direct to your TV. Built-in Wi-Fi® lets you connect to your existing network so you can stream and share your movies, videos, music and pictures from compatible devices direct to your TV. MCI 120 helps keep fast moving scenes crystal clear; and Full HD 1080p, LED and Picture Wizard II, you\'re sure to enjoy the stunningly clear picture quality.','tv/3',2),(4,'LG 65\" Class LED TV','1',1,'new','98',1328.99,'The large screen LG LB5200 TV lets you see your favorite shows, movies and sports in clear Full HD 1080p. The LED edge-lighting helps keep the panel sleek and slim, all whileproviding rich color, detail and contrast. If you love action movies and games, we’ve got you covered with MCI 480 that delivers enhanced frame rates and detailed backlight scanning as well as a powerful video processing engine that helps make fast action look virtually blur free.','tv/4',2),(5,'Samsung 50\" Smart','1',1,'by','96',1544.66,'The Samsung 50\" Class 1080p 60Hz LED Smart HDTV in Black (UN50J5500AFXZA) offers the resolution of a 1080P Full HD, which is twice the standard HDTV giving you more details when viewing, gaming and more. And you\'ve finally got that smart TV you\'ve wanted that opens the gateway to more movies, shows, apps, and everything else you\'re looking for in entertainment. ','tv/5',2),(6,'LG 55\" Class Flat','0',1,'new','99',543.99,'Life is good with the LG 55\" Class 1080p 120Hz Flat Panel TV in Black (55LF6000).This 55” TV gives you a remarkable entertainment experience that transforms your home into a cinema of your very own that not only shows movies but also lets you play games and access other digital media devices. The full HD 1080p resolution of this LED TV gives you amazing brightness, clarity and color detail that brings everything to life. With an LG TV you get more out of your home viewing experience.','tv/6',2),(7,'LG 55\" Class LED TV','0',1,'new','96',445.00,'LG’s 55LN5200 delivers stunning picture quality. With LED backlighting you get amazing brightness, clarity and color detail. And Full HD 1080p has almost double the pixel resolution of standard HD so you see detail like never before.','tv/7',2),(8,'LG 24\" Class 720p','0',1,'new','97',890.99,'The LED-backlit 24LB451B Series is a great option for an HDTV to fit in a compact space.  With 1080p Full High-Definition resolution and 8 Picture Modes to choose from, this TV offers in superior picture quality with vibrant colors and far more detail than standard definition could ever provide.  LED back lighting provides a slim TV, while also delivering amazing brightness, clarity and color detail. ','tv/8',2),(9,'Toshiba 40\" Class','0',1,'','99',999.99,'A Vision of Quality, Design & Value! In a sea of large-screen television choices, the 40L1400U strikes the perfect balance delivering great picture quality and value, with a slim modern design and elegant new frame stand. Energy efficient with an LED-backlit display, the 1080p Full HD 40L1400U is equipped with Dynamic Picture Mode for maximum contrast, clarity and color saturation. ','tv/9',2),(10,'Element 40in','0',1,'new','95',760.99,'Watch TV like you want to watch TV with the Element Electronics 40” Flat Panel LED TV HD - 1080p 60 Hz. This nice, big television features 1080p with a refresh rate of 60Hz for a crisp, clear picture. The LED TV edge-lit technology gives you the colors you want for vivid action. ','tv/1',2),(11,'Element 48\" Class','1',1,'new','98',580.99,'Watch in full HD with this Element 48” LED 1080P TV which includes a 16:9 aspect ratio. This TV comes complete with a slim frame design that looks great on the wall or on a stand (included). ','tv/2',2),(12,'VIZIO 39\" Class','1',1,'new','96',588.99,'With a new modern design and brilliant picture quality, the VIZIO 39\" Class 720p 60 Hz Full-Array LED TV in Black (D39h-C0) gives you quality that is an incredible value. As part of the VIZIO D-Series, this Full-Array LED TV has backlighting that distributes light uniformly behind the screen for a superior experience. ','tv/3',2),(13,'VIZIO 32\" Class','1',1,'new','95',560.00,'Beautifully Smart! The all-new 2014 M-Series 32\" (31.50” Diag.) Full-Array LED Smart TVs have arrived. With a stunning picture, premium Smart TV, and an ultra-slim frame, these TVs are perfect for those ready to step up to a more beautiful picture. This M-Series TV features exceptional picture quality powered by Full-Array LED backlighting with 5 Active LED Zones. This means you get superior light uniformity, deeper black levels and brighter, more vivid details. ','tv/4',2),(14,'Toshiba 40\" Class','0',1,'new','96',2546.00,'Brilliant Picture Quality. Smart TV! The 40L3400U LED Smart TV combines a new, slim, modern gun metal design, easy connectivity to apps and personal content, with advanced picture quality all in a sleek, elegant package. The 40L3400U complements any room and is equipped with 1080p Full HD, a powerful new CQ Dual Core Engine for video processing and ClearScan® 120Hz technologies perfect for cinema-like entertainment and fast-pace gaming.','tv/1',2),(15,'Sharp 60\" Class','1',1,'','95',1700.99,'The LC-60LE660U is an LED Smart TV that delivers legendary AQUOS picture quality, with AquoMotion 240 Refresh Rate for precision clarity during fast-motion scenes and 4 million : 1 dynamic contrast ratio. This 60” (60 3/32” diag.) class TV features 20% more screen area than a 55” class and newly designed, super-thin, bezel.1 Working through built-in Wi-Fi, SmartCentral™ Apps lets you quickly connect to all the best apps.','tv/5',2),(16,'VIZIO 60\" Class','1',1,'new','97',2200.99,'Simply Beautiful! Introducing the all-new VIZIO P-Series Ultra HD Full-Array LED Smart TV.  With powerful Ultra HD performance and best-in-class picture quality of Full-Array LED backlight, 64 Active LED Zones, and Clear Action 960 for incomparable contrast levels, sharpest details and deepest, purest black levels, the P-Series is your crystal-clear window to an exhilarating world where picture is everything. ','tv/6',2),(17,'VIZIO 55\" Class','1',1,'nwe','98',544.99,'Simply Beautiful! Introducing the all-new VIZIO P-Series Ultra HD Full-Array LED Smart TV.  With powerful Ultra HD performance and best-in-class picture quality of Full-Array LED backlight, 64 Active LED Zones, and Clear Action 960 for incomparable contrast levels, sharpest details and deepest, purest black levels, the P-Series is your crystal-clear window to an exhilarating world where picture is everything. ','tv/7',2),(18,'VIZIO 49\" Class 4K','1',1,'new','96',1680.99,'With a new modern design and brilliant picture quality, the VIZIO 49\" Class 4K 2160p 120Hz Ultra HD Full-Array LED Smart TV - Black (M49-C1) gives you an ultra experience. As part of the VIZIO M-Series, you get powerful performance, UHD picture quality, and beautiful design. Enjoy four times the resolution of Full HD for an image that\'s hard to beat. The 2160p pixel height is twice that of 1080p meaning more detail and more enjoyment for you. ','tv/8',2),(19,'VIZIO 43\" Class','1',1,'new','96',2400.99,'With a new modern design and brilliant picture quality, the VIZIO 43\" Class 120Hz UHD Full-Array LED Smart TV - Black (M43-C1) gives you an ultra experience, Ultra HD that is. As part of the VIZIO M-Series, you get powerful performance, UHD picture quality, and beautiful design. Enjoy four times the resolution of Full HD for an image that\'s hard to beat.','tv/9',2),(20,'Sharp 80\" Class','1',1,'new','97',1900.99,'Big, bold and brainy - the LC-80LE650U is an LED Smart TV that delivers legendary AQUOS picture quality and unlimited content choices, seamless control, and instant Connectivity through SmartCentral™. The AQUOS 1080p LED Display dazzles with advanced pixel structure for the most breathtaking HD images, a 4 million: 1 dynamic contrast ratio, and a 120Hz refresh rate for precision clarity during fast-motion scenes. ','tv/1',2),(21,'VIZIO 24\" Class','1',1,'new','95',3200.99,'Introducing the all-new 2014 E-Series 24” (23.54” diag.) Edge-lit Razor LED™ Smart TV with an ultra-narrow frame, vibrant LED-lit picture, and a faster, easier-to-use Smart TV experience. ','tv/2',2),(22,'Samsung - 5 Series','1',1,'new','99',299.99,'This Samsung 5 Series HT-J5500/ZA Blu-ray home theater system includes 5 satellite speakers and a passive subwoofer. To build a complete 3D home theater system, you\'ll also need a 3D TV, 3D glasses designed for the TV and a high-speed HDMI cable.','homeCinema/1',3),(23,'Samsung - 4 Series','1',1,'new','95',199.99,'Enjoy an immersive cinematic experience with this Samsung 4 Series HT-J4500/ZA home theater system. To build a complete 3D home theater system, you\'ll also need a 3D TV, 3D glasses designed for the TV and a high-speed HDMI cable.','homeCinema/2',3),(24,'Sony - 5.1-Ch. 3D','1',1,'new','98',249.99,'Enjoy stunning visuals and lush, immersive audio with this Sony BDVE3100 1000W 5.1-channel Blu-ray home theater system. To build a complete 3D home theater system, you\'ll also need a 3D TV, 3D glasses designed for the TV and a high-speed HDMI cable.','homeCinema/3',3),(25,'Sony - 7.1-Ch. 3D','1',1,'new','97',449.99,'This Sony BDVN5200W 5.1-channel home theater system features 4K Ultra HD video upscaling for brilliant, detailed visuals. To build a complete 3D home theater system, you\'ll also need a 3D TV, 3D glasses designed for the TV and a high-speed HDMI cable.','homeCinema/4',3),(26,'Pyle - 7.1','1',1,'new','96',253.99,'This 7.1 speaker home theater system from Pyle turns your TV room into a screening room It comes with seven satellite speakers, including one center speaker, and a subwoofer, for a total of 160 watts of theater-quality sound. But it isn\'t just speakers - the PT798SBA includes a receiver with an FM radio, wireless Bluetooth audio compatibility, and gold capped AV inputs to serve as a selector between audio equipment. And you can control it all - your bass and treble settings, the input, FM frequency - using the included wireless remote. The digital VFD display is gorgeous and displays relevant information.','homeCinema/5',3),(27,'Canon EOS Rebel','1',1,'new','96',449.99,'This Canon EOS Rebel T5 DSLR camera comes with an EF-S 18-55mm f/3.5-5.6 IS II lens that enables you to capture sharp photos and video footage. A 9-point autofocus system helps you achieve a clear view of subjects and scenes.','camera/1',5),(28,'Canon  Rebel SL1','1',1,'new','98',554.99,'Small in size but enormous in performance, the EOS Rebel SL1 features a newly-designed Canon 18.0 Megapixel CMOS (APS-C) sensor and speedy Canon DIGIC 5 Image Processor, it delivers images of extraordinary quality — ideal for those stepping up from a smartphone or compact camera. An impressive ISO range of 100–12800 (expandable to H: 25600) for stills and 100–6400 (expandable to H: 12800) for video, plus up to 4.0 fps continuous shooting make this camera the go-to for any photo opportunity, even in dim lighting or when capturing fast action subjects. And Hybrid CMOS AF II delivers accurate AF tracking during Live View shooting, helping ensure your photos and movies are crisp and clear. The EOS Rebel SL1 makes amazing movies with Canon EOS Full HD Movie Mode with Movie Servo AF, working in concert with Canon STM lenses for smooth and quiet continuous AF. In addition to its Optical Viewfinder, the EOS Rebel SL1 has a bright, wide Touch Screen 3.0\" Clear View LCD monitor II, perfect for viewing a number of special scene modes and Creative Filters available in real-time display. Here is the DSLR you\'ll want to bring with you every day and ignite your imagination.','camera/2',5),(29,'Nikon - D3200 DSLR','1',1,'new','98',449.99,'Nikon D3200 DSLR Camera with 18–55mm VR Lens: Ultra quiet and powerful, great for taking candid photos. Or shoot full 1080p HD videos at up to 30 fps. Preprogrammed with auto options or choose your own settings to customize your shot, this compact camera can go anywhere with you.','camera/3',5),(30,'Nikon - D5300 DSLR','1',1,'new','97',649.99,'Nikon D5300 DSLR Camera Body: Tell beautiful stories with this camera, either through stunning photographs or with powerful videos. Instantly share them online as well as text them to friends and family using your smartphone or tablet.','camera/4',5),(31,'GoPro - HERO4','0',1,'new','98',399.99,'Capture striking 4K video in a wide array of environments using this GoPro HERO4 Silver action camera, which features a standard waterproof housing for use in up to 131\' of water. The wearable, mountable design enables versatile use.','action/1',6),(32,'GoPro - HERO HD','1',1,'new','98',129.99,'Capture striking 1080p footage in almost any environment using this GoPro HERO HD action camera, which features an integrated waterproof housing for use in up to 131\' of water. The auto low light setting automatically compensates for dim lighting.','action/2',6),(33,'Asus - Intel Core i5','1',1,'new','96',919.99,'Game on using this Asus M32ADUS032S desktop, which delivers 16GB of RAM, efficient processing and 4GB dedicated graphics to ensure rapid multitasking and lush visuals. High-speed wireless-AC technology facilitates connection to the Web.','pc/1',8),(34,'Asus - Intel Core i7','1',1,'new','96',786.99,'With built-in wireless networking, this Asus G10AJUS010S desktop makes it easy to connect to the Internet. NVIDIA GeForce GTX 970 graphics with 4GB DDR5 video memory help deliver realistic visuals for an immersive gaming experience.','pc/2',8),(35,'HP - Spectre x360','1',1,'new','99',299.99,'With a 360° hinge, this HP Spectre x360 13-4003dx 2-in-1 laptop allows you to navigate content and enjoy movies, games and streaming media on the 13.3\" high-definition touch screen in 1 of 4 modes.','laptop/1',9),(36,'HP Touch-Screen','1',1,'new','96',399.99,'Watch movies, browse Web content and more with this HP 15-r264dx laptop, which features a 15.6\" touch screen with 1366 x 768 resolution for easy navigation and clear images. The 750GB hard drive provides serviceable storage for important digital files.','notebook/2',10),(38,'testProduct','1',27,'','101',199.99,'description product',NULL,10),(39,'test product 2','0',27,'','99',545454.00,'описание продук',NULL,1),(40,'test_product','0',27,'new','103',3243443.00,'description продукта',NULL,8);
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
INSERT INTO `user` VALUES (1,'234432423','ferf4','f34f34f34f43','f4f4@fr.fr'),(2,'123456789','admin_first_name','admin_last_name','admin@email.com'),(3,'0974476766','admin_11FIRSTNAME','admin_11LASTNAME','admin_11LASTNAME@gmail.com'),(4,'123456789','admin_first_name','admin_last_name','admin@email'),(5,'123456789','admin_first_name','admin_last_name','admin@email'),(6,'123456789','admin_first_name','admin_last_name','admin@email'),(7,'123456789','admin_first_name','admin_last_name','admin@email'),(8,'123456789','admin_first_name','admin_last_name','admin@email'),(9,'123456789','admin_first_name','admin_last_name','admin@email'),(10,'123456789','admin_first_name','admin_last_name','admin@email'),(11,'123456789','admin_first_name','admin_last_name','admin@email'),(12,'123456789','admin_first_name','admin_last_name','admin@email'),(13,'123456789','admin_first_name','admin_last_name','admin@email'),(14,'123456789','admin_first_name','admin_last_name','admin@email'),(15,'0234567','a','a','admin@gmail.com'),(16,'123456789','admin_first_name','admin_last_name','admin@email'),(17,'123456789','admin_first_name','admin_last_name','admin@email'),(18,'123456789','admin_first_name','admin_last_name','admin@email'),(19,'123456789','admin_first_name','admin_last_name','admin@email'),(20,'123456789','admin_first_name','admin_last_name','admin@email'),(21,'123456789','admin_first_name','admin_last_name','admin@email'),(22,'+380974476766','Ivan','Last name','asdasdasdqd2q3d3@gmail.com'),(23,'+380974476766','admin999firatName','admin999lastName','admin999@gmail.com'),(24,'+380974476766','admin_111Name','admin_111LastName','admin_111@gmail.com'),(25,'+380974476766','userFirstName','userLastName','user@gmail.com'),(26,'+380964134544','????????','????????','mariana@gmail.com'),(27,'232131232313','admin','admin','admin@gmail.com'),(28,'0974476766','userFirstName','userLastName','user@gmail.com'),(29,'0974476766','user_test_first_name','last_name_user_test','user_test@df.com'),(30,'1234567','user','user','alina@gmail.com'),(31,'0974476766','alina','alina','alina2@gmail.com'),(32,'0974476766','alina','alina','alina3@sd.com');
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
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_authentication`
--

LOCK TABLES `user_authentication` WRITE;
/*!40000 ALTER TABLE `user_authentication` DISABLE KEYS */;
INSERT INTO `user_authentication` VALUES (1,'admin_0','$2a$10$gNvltgwY95CfDGfOHOd0j.T7l4aAjvthtmWxNlV9hYG6MTh.1Rfj2',0),(2,'admin_10','$10$gNvltgwY95CfDGfOHOd0j.T7l4aAjvthtmWxNlV9hYG6MTh.1Rfj2',0),(3,'admin_11','$10$gNvltgwY95CfDGfOHOd0j.T7l4aAjvthtmWxNlV9hYG6MTh.1Rfj2',1),(4,'admin_12','$10$gNvltgwY95CfDGfOHOd0j.T7l4aAjvthtmWxNlV9hYG6MTh.1Rfj2',1),(5,'admin_13','$10$gNvltgwY95CfDGfOHOd0j.T7l4aAjvthtmWxNlV9hYG6MTh.1Rfj2',1),(6,'admin_14','$10$gNvltgwY95CfDGfOHOd0j.T7l4aAjvthtmWxNlV9hYG6MTh.1Rfj2',1),(7,'admin_15','$10$gNvltgwY95CfDGfOHOd0j.T7l4aAjvthtmWxNlV9hYG6MTh.1Rfj2',1),(8,'admin_16','$10$gNvltgwY95CfDGfOHOd0j.T7l4aAjvthtmWxNlV9hYG6MTh.1Rfj2',1),(9,'admin_17','$10$gNvltgwY95CfDGfOHOd0j.T7l4aAjvthtmWxNlV9hYG6MTh.1Rfj2',1),(10,'admin_18','$10$gNvltgwY95CfDGfOHOd0j.T7l4aAjvthtmWxNlV9hYG6MTh.1Rfj2',1),(11,'admin_19','$10$gNvltgwY95CfDGfOHOd0j.T7l4aAjvthtmWxNlV9hYG6MTh.1Rfj2',1),(12,'admin_20','$10$gNvltgwY95CfDGfOHOd0j.T7l4aAjvthtmWxNlV9hYG6MTh.1Rfj2',1),(13,'admin_21','$10$gNvltgwY95CfDGfOHOd0j.T7l4aAjvthtmWxNlV9hYG6MTh.1Rfj2',1),(14,'admin_22','$10$gNvltgwY95CfDGfOHOd0j.T7l4aAjvthtmWxNlV9hYG6MTh.1Rfj2',1),(15,'admin_23','$10$gNvltgwY95CfDGfOHOd0j.T7l4aAjvthtmWxNlV9hYG6MTh.1Rfj2',1),(16,'admin_24','$10$gNvltgwY95CfDGfOHOd0j.T7l4aAjvthtmWxNlV9hYG6MTh.1Rfj2',1),(17,'admin_25','$10$gNvltgwY95CfDGfOHOd0j.T7l4aAjvthtmWxNlV9hYG6MTh.1Rfj2',1),(18,'admin_26','$10$gNvltgwY95CfDGfOHOd0j.T7l4aAjvthtmWxNlV9hYG6MTh.1Rfj2',1),(19,'admin_27','$10$gNvltgwY95CfDGfOHOd0j.T7l4aAjvthtmWxNlV9hYG6MTh.1Rfj2',1),(20,'admin_28','$10$gNvltgwY95CfDGfOHOd0j.T7l4aAjvthtmWxNlV9hYG6MTh.1Rfj2',1),(21,'admin_29','$10$gNvltgwY95CfDGfOHOd0j.T7l4aAjvthtmWxNlV9hYG6MTh.1Rfj2',1),(23,'admin_9999','$2a$10$yKeeMawfB1ZdaEiQvMo5Wu1QZ9ow89a1y/GfSqGENz6HBI9TEiY92',1),(24,'admin_111','$2a$10$8NQRF8Tb3JjI9FlfQE/oP.EJCLrYxJXtvXESJZS5N.KVxSSORw/uG',1),(27,'admin','$2a$10$04bP.XHXGV6FI9Cu/6G16e1IEK7pWUzTjktnxWu8e49y9txT0ZFuG',1),(28,'user','$2a$10$t8nhF65FkslmLjts8CJqFew7N41L6hRXRZ0aKiI5QeyDXGyDzkfj6',1),(29,'user_test','$2a$10$UzNX2l72CdiJTaoiWlPPm.RoKpjLTwOZ3vJCj5sTG0WSyYRLaFPWq',1),(30,'alina','$2a$10$qX1cDnv6BLR7v9EHqhhOeOXTO.2bBD9l7edyqHE4FRSJYjwGGMa9i',1),(31,'alina2','$2a$10$hPHRV2jI3/7kCBjKH.LDB.CHWpDpljoEok3rtvZuzhbSmcuwcNR/O',1),(32,'alina3','$2a$10$PAfbBlOoZWQtfpK//TNhnu.6nFy8SoOiQn.bUV67D9yRZYNXBqzz2',0);
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
INSERT INTO `user_authorization` VALUES (1,1),(2,1),(3,1),(4,1),(5,2),(6,2),(7,2),(8,2),(9,2),(10,2),(11,2),(12,2),(13,2),(14,2),(15,2),(16,2),(17,2),(18,2),(19,2),(20,2),(21,2),(22,2),(23,2),(24,2),(25,2),(26,2),(27,1),(28,2),(29,2),(30,2),(31,2),(32,2);
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

-- Dump completed on 2015-06-22 14:42:39
