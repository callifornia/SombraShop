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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
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
INSERT INTO `product` VALUES (1,'KDL-32W503A ','1',1,'new','99',7854.00,'32-дюймовый LED-телевизор Sony KDL32W503A оснащенный специальным MHL-портом, через который можно заряжать ваш мобильный телефон, а также иметь доступ ко всем файлам, которые там имеются и углами обзора 178 градусов предоставляет потрясающее качество изображения при просмотре любых видеороликов.\r\n\r\nБлагодаря белым светодиодам, расположенным за экраном телевизора, LED-подсветка направляет свет в нужные области, обеспечивая отличную контрастность.\r\nПодробнее: http://rozetka.com.ua/sony_kdl32w503a_black/p1237740/','tv/1',2),(2,'LG 42LB552V','1',1,'new','95',6854.00,'IPS панель\r\nСекрет превосходного угла обзора и качества телевизоров LG заключается в панели. LED телевизоры LG обеспечивают более четкое изображение, они устойчивее к воздействиям и прочны благодаря использованию IPS-панели.\r\n\r\nFull HD\r\nРазрешение Full HD гарантирует отличное качество изображения благодаря точной цветопередаче, четкости и контрастности картинки.\r\nПодробнее: http://rozetka.com.ua/lg_42lb552v/p1559807/','tv/2',2),(3,'LG 32LB563V','1',1,'new','97',8657.00,'IPS панель\r\nСекрет превосходного угла обзора и качества телевизоров LG заключается в панели. LED телевизоры LG обеспечивают более четкое изображение, они устойчивее к воздействиям и прочны благодаря использованию IPS-панели.\r\n\r\nFull HD\r\nРазрешение Full HD гарантирует отличное качество изображения благодаря точной цветопередаче, четкости и контрастности картинки.','tv/3',2),(4,'UE32H5000 ','1',1,'new','98',32423.00,'Ощутите новую реальность в формате Full HD\r\nОцените новый уровень реалистичности происходящего на экране в системе домашних развлечений. Благодаря двукратному увеличению разрешения по сравнению с обычными HD телевизорами ваш телевизор Samsung Smart TV позволит испытать новые ощущения от погружения в мир виртуальной реальности и почувствовать себя участником событий, происходящих на экране. После первых минут просмотра изображения в формате Full HD вы не захотите смотреть ваши любимые ТВ программы и фильмы в обычном стандартном разрешении. Откройте для себя всю прелесть виртуальной реальности в формате высокой четкости (HD формате).','tv/4',2),(5,'LG 42LB671V','1',1,'by','96',34654.00,'LG 42LB671V – это широкоформатный 42-дюймовый телевизор с IPS-матрицей и LED-подсветкой, заключенный в изысканный утонченный корпус.\r\n\r\nМинимум рамок, максимум изображения \r\nДизайн Cinema Screen делает телевизор идеальным для любого помещения, с угла в угол, с первой минуты до последней — потрясающее изображение.','tv/5',2),(6,'LG 32LB582V','0',1,'new','99',23568.00,'Обмен контентом\r\nСвободно делитесь контентом между различными устройствами, вне зависимости от того находитесь ли вы дома или нет. С помощью LG Smart Share вы легко объедините устройства у вас дома. С помощью вашей учетной записи LG, вы можете войти в систему и получить доступ к вашим мультимедийным развлечениям находясь вне дома.','tv/6',2),(7,'UE22H5600','0',1,'new','96',85646.00,'Функция Clear Motion Rate минимизирует эффект размытия движущегося изображения\r\nС помощью улучшенной технологии Clear Motion Rate (CMR) даже быстрое движение на экране телевизора будет отображаться с высокой четкостью. Более высокое значение CMR означает более четкую картинку в динамичных сюжетах, благодаря чему вы получите больше удовольствия от просмотра фильмов в жанре action, спортивных трансляций и прочих развлекательных программ. Эта технология стала возможной благодаря разработке панели с более высокой скоростью обновления изображения, быстры процессором изображения и технологией обратной подсветки. Это означает, что картинка теперь стала ярче и четче.','tv/7',2),(8,'UE32H4510','0',1,'new','97',426754.00,'Мощный четырехъядерный процессор для повышения производительности\r\nБлагодаря мощному четырехъядерному процессору производительность вашего Smart-телевизора Samsung значительно улучшается. Включив телевизор, вы сразу почувствуете разницу. Теперь телевизор работает быстрее в режиме многозадачности, быстрее осуществляется переключение каналов и серфинг в Интернете. Благодаря мощному и быстрому процессору вы будете меньше ждать загрузку контента и получите больше удовольствия от просмотра.','tv/8',2),(9,' UE32FH4003','0',1,'','99',5432.00,'Функция Clear Motion Rate минимизирует эффект размытия движущегося изображения\r\nС помощью улучшенной технологии Clear Motion Rate (CMR) даже быстрое движение на экране телевизора будет отображаться с высокой четкостью. Более высокое значение CMR означает более четкую картинку в динамичных сюжетах, благодаря чему вы получите больше удовольствия от просмотра фильмов в жанре action, спортивных трансляций и прочих развлекательных программ. Эта технология стала возможной благодаря разработке панели с более высокой скоростью обновления изображения, быстры процессором изображения и технологией обратной подсветки. Это означает, что картинка теперь стала ярче и четче.','tv/9',2),(10,'LG 32LB572U','0',1,'new','95',52934.00,'IPS панель\r\nСекрет превосходного угла обзора и качества телевизоров LG заключается в панели. LED телевизоры LG обеспечивают более четкое изображение, они устойчивее к воздействиям и прочны благодаря использованию IPS-панели.\r\n\r\nSmartShare\r\nПросматривайте и перемещайте файлы которые находятся на внешних устройствах хранения данных, на экран телевизора легко обмениваясь файлами с вашим планшетом, ПК или смартфоном\r\n\r\nПриродная точность цветопередачи\r\nТехнология IPS отображает наиболее реалистичные цвета каждого пикселя исходного изображения в разрешении HD. IPS дисплеи генерируют истинные цвета исходного изображения.','tv/1',2),(11,'LG 42LB653V','1',1,'new','98',63464.00,'Телевизор LG 42LB653V может похвастаться разрешением Full HD и великолепным качеством изображения.\r\n\r\nВас поразят естественные, натуральные цвета без искажений, точность передачи оттенков и плавность динамичных сцен. И все это будет доступно под любым углом – где бы вы ни расположились относительно экрана, качество картинки не пострадает.\r\n\r\nСреди прочих особенностей следует отметить наличие цифрового тюнера DVB-S2/DVB-C/DVB-T2, поддержку телетекста, наличие широкого выбора портов и вариантов подключения, а также поддержку MHL.','tv/2',2),(12,'UE48H4200','1',1,'new','96',42353.00,'Незабываемые впечатления от просмотра футбольного матча в режиме Football Mode\r\nПри просмотре футбольного матча в режиме Football Mode вы как будто присутствуете на стадионе. Зелень травы на поле и все другие цвета теперь стали ярче, что позволяет погрузиться в происходящее на экране. Мощный окружающий вас звук дает возможность полнее ощутить восхищение болельщиков.','tv/3',2),(13,'UE19H4000','1',1,'new','95',43456.00,'Функция Clear Motion Rate минимизирует эффект размытия движущегося изображения\r\nС помощью улучшенной технологии Clear Motion Rate (CMR) даже быстрое движение на экране телевизора будет отображаться с высокой четкостью. Более высокое значение CMR означает более четкую картинку в динамичных сюжетах, благодаря чему вы получите больше удовольствия от просмотра фильмов в жанре action, спортивных трансляций и прочих развлекательных программ. Эта технология стала возможной благодаря разработке панели с более высокой скоростью обновления изображения, быстры процессором изображения и технологией обратной подсветки. Это означает, что картинка теперь стала ярче и четче.','tv/4',2),(14,'UE40H6350','0',1,'new','96',5868.00,'Функция Clear Motion Rate минимизирует эффект размытия движущегося изображения\r\nС помощью улучшенной технологии Clear Motion Rate (CMR) даже быстрое движение на экране телевизора будет отображаться с высокой четкостью. Более высокое значение CMR означает более четкую картинку в динамичных сюжетах, благодаря чему вы получите больше удовольствия от просмотра фильмов в жанре action, спортивных трансляций и прочих развлекательных программ. Эта технология стала возможной благодаря разработке панели с более высокой скоростью обновления изображения, быстры процессором изображения и технологией обратной подсветки. Это означает, что картинка теперь стала ярче и четче.','tv/1',2),(15,'LG 28LB450U ','1',1,'','95',53643.00,'28LB450U — это LED-телевизор от LG, который содержит разнообразные мультимедийные развлечения и способен усилить ваше удовольствие от просмотра контента в формате высокой четкости.\r\n\r\nСтереодинамики\r\nНаслаждайтесь фильмами или играми с реалистичным стереозвуком. Не заморачивайтесь с подключением дополнительных колонок — со встроенными стереодинамиками силы звука хватит на всех.','tv/5',2),(16,'UE32H6400 ','1',1,'new','97',565456.00,'Функция Clear Motion Rate минимизирует эффект размытия движущегося изображения\r\nС помощью улучшенной технологии Clear Motion Rate (CMR) даже быстрое движение на экране телевизора будет отображаться с высокой четкостью. Более высокое значение CMR означает более четкую картинку в динамичных сюжетах, благодаря чему вы получите больше удовольствия от просмотра фильмов в жанре action, спортивных трансляций и прочих развлекательных программ. Эта технология стала возможной благодаря разработке панели с более высокой скоростью обновления изображения, быстры процессором изображения и технологией обратной подсветки. Это означает, что картинка теперь стала ярче и четче.','tv/6',2),(17,'32P1300DG ','1',1,'nwe','98',45455.00,'Что бы вы ни предпочитали смотреть, спорт, кино или документальные программы, телевизор Toshiba 32P1300DG с диагональю 32 дюймов и высоким качеством изображения обеспечит вам полный комфорт и максимальное удовольствие от просмотра.\r\n\r\nКомпактный дизайн — идеальный выбор для кухни, спальни и небольших учебных помещений. Наличие разъемов HDMI позволит без проблем насладиться играми, просмотром фотографий или фильмов, прослушиванием музыки. Кроме того, Toshiba 32P1300DG можно использовать и как монитор, подключив его к компьютеру.','tv/7',2),(18,'LG 32LB580U','1',1,'new','96',8547.00,'Обмен контентом\r\nСвободно делитесь контентом между различными устройствами, вне зависимости от того находитесь ли вы дома или нет. С помощью LG Smart Share вы легко объедините устройства у вас дома. С помощью вашей учетной записи LG, вы можете войти в систему и получить доступ к вашим мультимедийным развлечениям находясь вне дома.','tv/8',2),(19,'UE40H6410','1',1,'new','96',545656.00,'Функция Clear Motion Rate минимизирует эффект размытия движущегося изображения\r\nС помощью улучшенной технологии Clear Motion Rate (CMR) даже быстрое движение на экране телевизора будет отображаться с высокой четкостью. Более высокое значение CMR означает более четкую картинку в динамичных сюжетах, благодаря чему вы получите больше удовольствия от просмотра фильмов в жанре action, спортивных трансляций и прочих развлекательных программ. Эта технология стала возможной благодаря разработке панели с более высокой скоростью обновления изображения, быстрому процессору изображения и технологии обратной подсветки. Это означает, что картинка теперь стала ярче и четче.','tv/9',2),(20,'LG 32LB563U','1',1,'new','97',34223.00,'IPS панель\r\nСекрет превосходного угла обзора и качества телевизоров LG заключается в панели. LED телевизоры LG обеспечивают более четкое изображение, они устойчивее к воздействиям и прочны благодаря использованию IPS-панели.','tv/1',2),(21,'UE40H5203 ','1',1,'new','95',6274.00,'Новый Smart-телевизор Samsung — теперь еще проще и быстрее\r\nВаш Smart-телевизор Samsung позволит воспользоваться огромной библиотекой приложений, просматривать видеоклипы, TВ программы и социальные посты с помощью сервиса Smart Hub. ','tv/2',2),(22,'Philips HTB4570 ','1',1,'new','99',3434.00,'Smart TV для доступа к интернет-службам и мультимедийному контенту на ТВ\r\nДомашний кинотеатр Philips и проигрыватель Blu-ray со Smart TV содержат ряд передовых функций, в том числе Net TV, SimplyShare и MyRemote. Net TV открывает доступ к онлайн-ресурсам и развлечениям на вашем телевизоре, например к службам видео по запросу. Функция SimplyShare позволяет воспроизводить музыку и видео, а также просматривать фото с компьютера, не вставая с дивана. А при помощи приложения Philips MyRemote можно использовать смартфон или планшетный ПК в качестве пульта ДУ домашнего кинотеатра.','homeCinema/1',3),(23,'Philips HTL3140B ','1',1,'new','95',85445.00,'Насладитесь потрясающим объемным пространственным звучанием при просмотре ТВ благодаря всего одному кабелю! Помимо фильмов, вы также сможете воспроизводить в высоком качестве музыку с мобильных устройств в формате MP3 через Music iLink\r\n\r\nУдобное подключение к смартфонам с поддержкой NFC по Bluetooth одним касанием.','homeCinema/2',3),(24,'LG NB4540','1',1,'new','98',453453.00,'4.1-канальное звучание\r\nНесмотря на небольшие размеры, в одном корпусе удалось разместить полноценную 4.1-канальную систему. 4.1-канальный звук мощностью 320 Вт обеспечивает максимально полные впечатления от прослушивания.\r\nУльтракомпактный дизайн (высота 35 мм!)\r\nПревосходно устанавливается на основание телевизора и не мешает просмотру (высота 35 мм), благодаря применению инновационных ультракомпактных динамиков высотой 35 мм с двойным неодимовым магнитом.','homeCinema/3',3),(25,'Yamaha BDX-610 ','1',1,'new','97',426345.00,'5.1-канальная система окружающего звучания с проигрывателем Blu-ray\r\nСистема BDX-610 состоит из ресивера мощностью 500 Вт, пяти АС и сабвуфера, и обеспечивает настоящее 5.1 канальное окружающее звучание. А входящий в систему проигрыватель Blu-Ray позволит вам по достоинству оценить все великолепие звука и изображения, записанного на Blu-Ray диски.','homeCinema/4',3),(26,'Philips HTB5550G/51 ','1',1,'new','96',435345.00,'Мощный и глубокий объемный звук 1000 Вт\r\nДомашний кинотеатр Philips обеспечит невероятно насыщенное звучание музыки и фильмов. Благодаря 15-мм рупорному ВЧ-излучателю с мягким куполом звук будет четким и кристально чистым. Для максимально естественного звучания низких частот система оснащена фазоинвертором Bass Reflex с рифленой поверхностью, который в 3 раза мощнее обычного.','homeCinema/5',3),(27,'Fujifilm FinePix X-M1','1',1,'new','96',234234.00,'Качество снимков как у цифровых зеркальных камер и компактный корпус.','camera/1',5),(28,'Sony Alpha 3500','1',1,'new','98',45235.00,'Фотоаппарат Sony Alpha 3500 оснащен матрицей Exmor APS-C CMOS с разрешением 20.1 эффективных мегапикселей и невероятно быстрым процессором изображений Bionz. Вместе они гарантируют детализированное изображение каждого снимка.\r\n\r\nБольшая матрица Exmor APS HD CMOS с разрешением 20.1 мегапикселей\r\nМатрица Exmor APS HD CMOS способна снимать с высокой детализацией в высоком разрешении и с яркой палитрой цветов. Матрица обладает улучшенной функцией линейного аналогово-цифрового преобразования, понижающего уровень шума, благодаря которой вы получаете превосходные изображения в условиях недостаточного освещения с высокой детализацией.','camera/2',5),(29,'Sony Alpha 7 28-70mm Kit','1',1,'new','98',5634.00,'Переходите на режим полнокадровой съемки\r\nМеняйте объективы. Делайте снимки профессионального качества благодаря разрешению 24.3 Мп. Фиксируйте сцены быстро и четко с помощью быстрой гибридной автофокусировки и видоискателя OLED с высоким разрешением. Реализуйте творческие идеи где угодно с помощью самой маленькой в мире 35-мм полнокадровой камеры со сменными объективами.','camera/3',5),(30,'Sony Alpha 7R Body','1',1,'new','97',52343.00,'Полнокадровая съемка. Маленький корпус\r\nДля Sony Alpha 7R — самой маленькой и легкой в мире* 35-мм полнокадровой камеры со сменными объективами (объектив в комплекте не поставляется) нет ничего невозможного. Меняйте объективы. Делайте прекрасные снимки благодаря разрешению 36.3 Мп и отсутствию оптического фильтра низких частот. Реализуйте творческие идеи в полном размере, не упуская ни единой детали, где угодно и когда угодно.','camera/4',5),(31,'GoPro HERO4 Black Standard Edition','0',1,'new','98',34234.00,'HERO4 Black — самая передовая камера GoPro, может похвастаться высокой производительностью и функционалом, имеет встроенный Wi-Fi, способна снимать в разрешении 4K со скоростью 30 кадров в секунду а также делать 12 Мп снимки.\r\n\r\nВ два раза круче и мощнее\r\nПроцессор HERO4 Black в два раза мощнее, частота кадров в два раза выше чем у камеры-предшественницы. Благодаря этому ваши кадры станут четче и богаче. Новые функции и технологии облегчат вам использование камеры, а улучшенная беспроводная связь не подведет вас в управлении вашей камерой.','action/1',6),(32,'GoPro (CHDHA-301)','1',1,'new','98',64556.00,'HERO — идеальный вариант для начального уровня. Разрешение 1080 при 30 к/с и 720 при 60 к/с, удобная функция QuikCapture, SuperView и режим Auto Low Light позволят вам каждый раз достигать профессионального качества съемки.\r\n\r\nРазнообразные режимы\r\nСнимайте 5 Мп фотографии, чтобы поделиться с друзьями на Facebook или Instagram. Или снимайте в режиме Time Lapse, который делает снимки каждые пол секунды. Это удобно, если ваша камера закреплена где-то на оборудовании или одежде, а кнопка спуска недоступна. Затем вы сможете выбрать наилучшие фотографии. Режим серийной фотосъемки \"стреляет\" 5 кадрами в секунду — это пригодиться вам для съемки подвижных объектов.','action/2',6),(33,'Everest Game 9088','1',1,'new','96',4545.00,'Everest Game 9088 — только наилучшее качество, только максимальная производительность, только новейшие решения и технологии. Вы хотите получить максимум во всем — тогда Everest Game 9088 создан специально для вас.\r\n\r\nEverest Game 9088 — это компьютеры премимум класса, собранные на базе эксклюзивных компонентов, тщательно подобранных и протестированных лучшими специалистами нашей компании. Это топовый сегмент систем, который отвечает наилучшим характеристикам показателей качества и производительности.\r\n\r\nВыбирая компьютер Everest Game 9088 вы определяете для себя уровень ваших новых возможностей:\r\n\r\nигры с максимальными настройками детализации и использовании всевозможных эффектов\r\nнаилучшая картинка при просмотре Full HD Video\r\nускоренная работа с 3D графикой\r\nминимальное время обработки потоковых данных','pc/1',8),(34,'Everest Home 8060','1',1,'new','96',5445.00,'Компьютер Everest Home 8060 на базе четырехъядерного процессора Intel Core i7 — идеальный вариант для домашнего использования.\r\n\r\nКупить компьютер Everest Home — значит приобрести недорогое, и при этом надежное решение для самых разнообразных повседневных задач. Компьютеры этой серии помогут овладеть навыками работы с компьютерной техникой, различными офисными и мультимедийными приложениями, насладиться современными динамичными играми с высоким уровнем детализации графики.\r\n\r\nEverest Home 8060 собран на базе материнской платы Asus H81M-K. Оснащен оптическим приводом.','pc/2',8),(35,'Samsung Galaxy','1',1,'new','99',45345.00,'Откройте для себя новый мир с Samsung Galaxy Tab 3 Lite в ваших руках. Тоньше, уже и с еще более компактной рамкой, Samsung Galaxy Tab 3 Lite предлагает потрясающие возможности для работы на ходу. Он стал еще легче без снижения производительности. Samsung Galaxy Tab 3 Lite имеет двухъядерный процессор, камеру и еще больше приложений от Samsung и Google.\r\n\r\nСверхтонкий и сверхлегкий\r\nПланшет Samsung Tab 3 Lite настолько компактен и удобен, что его можно всегда иметь при себе. При толщине 9.7 мм он тоньше своих предшественников, поэтому пользоваться им — одно удовольствие. Планшет настолько легкий, что его очень удобно держать в руках — почувствуйте разницу. Несмотря на компактность, он оснащен емкой батареей, заряда которой хватит надолго — что еще нужно для мобильной жизни.','laptop/1',9),(36,'HP 255 G3','1',1,'new','96',435345.00,'HP 255 G3 — недорогой ноутбук, который позволит всегда оставаться на связи. Технологии AMD, средства для работы с мультимедиа помогут в выполнении любых бизнес-задач, а прочный корпус защитит HP 255 при переноске.\r\n\r\nСоздан для использования на ходу\r\nБудьте уверены — HP 255 способен выполнять срочные задачи на ходу. Прочный корпус обеспечивает надежную защиту ноутбука и придает ему деловой внешний вид, соответствующий вашему стилю.','notebook/2',10),(38,'testProduct','1',27,'','101',45787.00,'описание товара',NULL,10),(39,'test product 2','0',27,'','99',545454.00,'описание продук',NULL,1),(40,'test_product','0',27,'new','103',3243443.00,'description продукта',NULL,8);
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

-- Dump completed on 2015-06-17 16:13:02
