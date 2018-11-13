-- MySQL dump 10.13  Distrib 8.0.12, for osx10.13 (x86_64)
--
-- Host: localhost    Database: travel
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `booking_details`
--

DROP TABLE IF EXISTS `booking_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `booking_details` (
  `id` bigint(20) NOT NULL,
  `created_at` date DEFAULT NULL,
  `created_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `birth_date` datetime DEFAULT NULL,
  `first_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `identification` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `booking_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKkbcan6ybv86uappnh0qtdmvas` (`booking_id`),
  CONSTRAINT `FKkbcan6ybv86uappnh0qtdmvas` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking_details`
--

LOCK TABLES `booking_details` WRITE;
/*!40000 ALTER TABLE `booking_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `booking_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `bookings` (
  `id` bigint(20) NOT NULL,
  `created_at` date DEFAULT NULL,
  `created_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `bank_account` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `booking_time` datetime DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `first_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `grand_total` double NOT NULL,
  `last_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `total_of_ticket` int(11) NOT NULL,
  `plan_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKjebrw9c5tynujow8xcb09n3n8` (`plan_id`),
  KEY `FKeyog2oic85xg7hsu2je2lx3s6` (`user_id`),
  CONSTRAINT `FKeyog2oic85xg7hsu2je2lx3s6` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FKjebrw9c5tynujow8xcb09n3n8` FOREIGN KEY (`plan_id`) REFERENCES `plans` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings`
--

LOCK TABLES `bookings` WRITE;
/*!40000 ALTER TABLE `bookings` DISABLE KEYS */;
/*!40000 ALTER TABLE `bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flyway_schema_history`
--

DROP TABLE IF EXISTS `flyway_schema_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `flyway_schema_history` (
  `installed_rank` int(11) NOT NULL,
  `version` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `script` varchar(1000) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `checksum` int(11) DEFAULT NULL,
  `installed_by` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `installed_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `execution_time` int(11) NOT NULL,
  `success` tinyint(1) NOT NULL,
  PRIMARY KEY (`installed_rank`),
  KEY `flyway_schema_history_s_idx` (`success`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flyway_schema_history`
--

LOCK TABLES `flyway_schema_history` WRITE;
/*!40000 ALTER TABLE `flyway_schema_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `flyway_schema_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequence`
--

LOCK TABLES `hibernate_sequence` WRITE;
/*!40000 ALTER TABLE `hibernate_sequence` DISABLE KEYS */;
/*!40000 ALTER TABLE `hibernate_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `places`
--

DROP TABLE IF EXISTS `places`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `places` (
  `id` bigint(20) NOT NULL,
  `created_at` date DEFAULT NULL,
  `created_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `places`
--

LOCK TABLES `places` WRITE;
/*!40000 ALTER TABLE `places` DISABLE KEYS */;
INSERT INTO `places` VALUES (0,NULL,NULL,NULL,NULL,10.5,105.166667,'An Giang',NULL,'an-giang'),(1,NULL,NULL,NULL,NULL,10.583333,107.25,'Bà Rịa - Vũng Tàu',NULL,'ba-ria-vung-tau'),(2,NULL,NULL,NULL,NULL,22.166667,105.833333,'Bắc Kạn',NULL,'bac-kan'),(3,NULL,NULL,NULL,NULL,9.25,105.75,'Bạc Liêu',NULL,'bac-lieu'),(4,NULL,NULL,NULL,NULL,21.083333,106.166667,'Bắc Ninh',NULL,'bac-ninh'),(5,NULL,NULL,NULL,NULL,10.166667,106.5,'Bến Tre',NULL,'ben-tre'),(6,NULL,NULL,NULL,NULL,14.166667,109,'Bình Định',NULL,'binh-dinh'),(7,NULL,NULL,NULL,NULL,11.166667,106.666667,'Bình Dương',NULL,'binh-duong'),(8,NULL,NULL,NULL,NULL,11.75,106.916667,'Bình Phước',NULL,'binh-phuoc'),(9,NULL,NULL,NULL,NULL,10.933333,108.1,'Bình Thuận',NULL,'binh-thuan'),(10,NULL,NULL,NULL,NULL,9.083333,105.083333,'Cà Mau',NULL,'ca-mau'),(11,NULL,NULL,NULL,NULL,10.033333,105.783333,'Cần Thơ',NULL,'can-tho'),(12,NULL,NULL,NULL,NULL,22.666667,106,'Cao Bằng',NULL,'cao-bang'),(13,NULL,NULL,NULL,NULL,16.066667,108.233333,'Đà Nẵng',NULL,'da-nang'),(14,NULL,NULL,NULL,NULL,12.666667,108.05,'Đắk Lắk',NULL,'dak-lak'),(15,NULL,NULL,NULL,NULL,11.983333,107.7,'Đắk Nông',NULL,'dak-nong'),(16,NULL,NULL,NULL,NULL,21.383333,103.016667,'Điện Biên',NULL,'dien-bien'),(17,NULL,NULL,NULL,NULL,11.116667,107.183333,'Đồng Nai',NULL,'dong-nai'),(18,NULL,NULL,NULL,NULL,10.666667,105.666667,'Đồng Tháp',NULL,'dong-thap'),(19,NULL,NULL,NULL,NULL,13.75,108.25,'Gia Lai',NULL,'gia-lai'),(20,NULL,NULL,NULL,NULL,22.75,105,'Hà Giang',NULL,'ha-giang'),(21,NULL,NULL,NULL,NULL,20.583333,106,'Hà Nam',NULL,'ha-nam'),(22,NULL,NULL,NULL,NULL,21.028472,105.854167,'Hà Nội',NULL,'ha-noi'),(23,NULL,NULL,NULL,NULL,18.333333,105.9,'Hà Tĩnh',NULL,'ha-tinh'),(24,NULL,NULL,NULL,NULL,20.916667,106.333333,'Hải Dương',NULL,'hai-duong'),(25,NULL,NULL,NULL,NULL,20.865139,106.683833,'Hải Phòng',NULL,'hai-phong'),(26,NULL,NULL,NULL,NULL,9.783333,105.466667,'Hậu Giang',NULL,'hau-giang'),(27,NULL,NULL,NULL,NULL,10.776889,106.700806,'TP Hồ Chí Minh',NULL,'ho-chi-minh'),(28,NULL,NULL,NULL,NULL,20.333333,105.25,'Hòa Bình',NULL,'hoa-binh'),(29,NULL,NULL,NULL,NULL,20.833333,106.083333,'Hưng Yên',NULL,'hung-yen'),(30,NULL,NULL,NULL,NULL,12.25,109.2,'Khánh Hòa',NULL,'khanh-hoa'),(31,NULL,NULL,NULL,NULL,10,105.166667,'Kiên Giang',NULL,'kien-giang'),(32,NULL,NULL,NULL,NULL,14.75,107.916667,'Kon Tum',NULL,'kon-tum'),(33,NULL,NULL,NULL,NULL,22,103,'Lai Châu',NULL,'lai-chau'),(34,NULL,NULL,NULL,NULL,11.95,108.433333,'Lâm Đồng',NULL,'lam-dong'),(35,NULL,NULL,NULL,NULL,21.75,106.5,'Lạng Sơn',NULL,'lang-son'),(36,NULL,NULL,NULL,NULL,22.333333,104,'Lào Cai',NULL,'lao-cai'),(37,NULL,NULL,NULL,NULL,10.666667,106.166667,'Long An',NULL,'long-an'),(38,NULL,NULL,NULL,NULL,20.25,106.25,'Nam Định',NULL,'nam-dinh'),(39,NULL,NULL,NULL,NULL,19.333333,104.833333,'Nghệ An',NULL,'nghe-an'),(40,NULL,NULL,NULL,NULL,20.25,105.833333,'Ninh Bình',NULL,'ninh-binh'),(41,NULL,NULL,NULL,NULL,11.75,108.833333,'Ninh Thuận',NULL,'ninh-thuan'),(42,NULL,NULL,NULL,NULL,21.333333,105.166667,'Phú Thọ',NULL,'phu-tho'),(43,NULL,NULL,NULL,NULL,13.166667,109.166667,'Phú Yên',NULL,'phu-yen'),(44,NULL,NULL,NULL,NULL,17.5,106.333333,'Quảng Bình',NULL,'quang-binh'),(45,NULL,NULL,NULL,NULL,15.583333,107.916667,'Quảng Nam',NULL,'quang-nam'),(46,NULL,NULL,NULL,NULL,15,108.666667,'Quảng Ngãi',NULL,'quang-ngai'),(47,NULL,NULL,NULL,NULL,21.25,107.333333,'Quảng Ninh',NULL,'quang-ninh'),(48,NULL,NULL,NULL,NULL,16.75,107,'Quảng Trị',NULL,'quang-tri'),(49,NULL,NULL,NULL,NULL,9.666667,105.833333,'Sóc Trăng',NULL,'soc-trang'),(50,NULL,NULL,NULL,NULL,21.166667,104,'Sơn La',NULL,'son-la'),(51,NULL,NULL,NULL,NULL,11.333333,106.166667,'Tây Ninh',NULL,'tay-ninh'),(52,NULL,NULL,NULL,NULL,20.5,106.333333,'Thái Bình',NULL,'thai-binh'),(53,NULL,NULL,NULL,NULL,21.666667,105.833333,'Thái Nguyên',NULL,'thai-nguyen'),(54,NULL,NULL,NULL,NULL,20,105.5,'Thanh Hóa',NULL,'thanh-hoa'),(55,NULL,NULL,NULL,NULL,16.333333,107.583333,'Huế',NULL,'thua-thien-hue'),(56,NULL,NULL,NULL,NULL,10.416667,106.166667,'Tiền Giang',NULL,'tien-giang'),(57,NULL,NULL,NULL,NULL,9.833333,106.25,'Trà Vinh',NULL,'tra-vinh'),(58,NULL,NULL,NULL,NULL,21.666667,105.833333,'Tuyên Quang',NULL,'tuyen-quang'),(59,NULL,NULL,NULL,NULL,10.166667,106,'Vĩnh Long',NULL,'vinh-long'),(60,NULL,NULL,NULL,NULL,21.3,105.6,'Vĩnh Phúc',NULL,'vinh-phuc'),(61,NULL,NULL,NULL,NULL,21.5,104.666667,'Yên Bái',NULL,'yen-bai');
/*!40000 ALTER TABLE `places` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plans`
--

DROP TABLE IF EXISTS `plans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `plans` (
  `id` bigint(20) NOT NULL,
  `created_at` date DEFAULT NULL,
  `created_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `adult_price` double NOT NULL,
  `child_price` double NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `number_of_reserved_slot` int(11) NOT NULL,
  `number_of_slot` int(11) NOT NULL,
  `start_time` datetime DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `tour_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKl2w1i8m75l8ju87arsbgclcim` (`tour_id`),
  CONSTRAINT `FKl2w1i8m75l8ju87arsbgclcim` FOREIGN KEY (`tour_id`) REFERENCES `tours` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plans`
--

LOCK TABLES `plans` WRITE;
/*!40000 ALTER TABLE `plans` DISABLE KEYS */;
INSERT INTO `plans` VALUES (1,NULL,NULL,NULL,NULL,2000000,1000000,'DU LỊCH ĐÓN NĂM MỚI 2019 [NAM DU - HÒN CỦ TRON]',30,0,NULL,'du-lich-don-nam-moi-2019-nam-du-hon-cu-tron',67),(2,NULL,NULL,NULL,NULL,2000000,1000000,'DU LỊCH ĐÓN NĂM MỚI 2019 [NAM DU - HÒN CỦ TRON]',0,30,NULL,'du-lich-don-nam-moi-2019-nam-du-hon-cu-tron',67),(3,NULL,NULL,NULL,NULL,2000000,1000000,' DU LỊCH PHÚ QUỐC [ĐÓN NĂM MỚI 2019]',0,30,NULL,'du-lich-phu-quoc-don-nam-moi-2019',64),(4,NULL,NULL,NULL,NULL,2000000,1000000,'DU LỊCH [ĐÓN NĂM MỚI 2019] PHÚ QUỐC - BÃI SAO',0,30,NULL,'du-lich-don-nam-moi-2019-phu-quoc-bai-sao',62),(5,NULL,NULL,NULL,NULL,2000000,1000000,'DU LỊCH PHÚ QUỐC - BÃI SAO [VIETJET]',0,30,NULL,'du-lich-phu-quoc-bai-sao-vietjet',60),(6,NULL,NULL,NULL,NULL,2000000,1000000,' DU LỊCH THANH HÓA - SUỐI CÁ THẦN CẨM LƯƠNG - VƯỜN THÚ SAFARI - ĐẢO CHÈ THANH CHƯƠNG',0,30,NULL,'du-lich-thanh-hoa-suoi-ca-than-cam-luong-vuon-thu-safari-dao-che-thanh-chuong',59),(7,NULL,NULL,NULL,NULL,2000000,1000000,'DU LỊCH QUY NHƠN - KỲ CO - EO GIÓ - TUY HÒA',0,30,NULL,'du-lich-quy-nhon-ky-co-eo-gio-tuy-hoa',1),(8,NULL,NULL,NULL,NULL,2000000,1000000,'DU LỊCH TẾT NGUYÊN ĐÁN TẠI TUY HÒA- QUY NHƠN',0,30,NULL,'du-lich-tet-nguyen-dan-tai-tuy-hoa-quy-nhon',56),(9,NULL,NULL,NULL,NULL,2000000,1000000,'DU LỊCH QUY NHƠN - KỲ CO - EO GIÓ - FLC QUY NHƠN',0,30,NULL,'du-lich-quy-nhon-ky-co-eo-gio-flc-quy-nhon',54),(10,NULL,NULL,NULL,NULL,2000000,1000000,'DU LỊCH [ĐÓN NĂM MỚI 2019] ĐÀ NẴNG - HỘI AN - SUỐI KHOÁNG NÓNG NÚI THẦN TÀI - BÀ NÀ - CẦU VÀNG',0,30,NULL,'du-lich-don-nam-moi-2019-da-nang-hoi-an-suoi-khoang-nong-nui-than-tai-ba-na-cau-vang',52),(11,NULL,NULL,NULL,NULL,2000000,1000000,'DU LỊCH ĐÀ NẴNG - HỘI AN - ĐỘNG THIÊN ĐƯỜNG - HUẾ - BÀ NÀ 5 NGÀY',0,30,NULL,'du-lich-da-nang-hoi-an-dong-thien-duong-hue-ba-na-5-ngay',51),(12,NULL,NULL,NULL,NULL,2000000,1000000,'DU LỊCH HÀ NỘI - HẠ LONG - LÀO CAI - SAPA',0,30,NULL,'du-lich-ha-noi-ha-long-lao-cai-sapa',3),(13,NULL,NULL,NULL,NULL,2000000,1000000,'DU LỊCH BUÔN MA THUỘT - BUÔN ĐÔN - PELIKU - THỦY ĐIỆN IALY',0,30,NULL,'du-lich-buon-ma-thuot-buon-don-peliku-thuy-dien-ialy',42),(14,NULL,NULL,NULL,NULL,2000000,1000000,'DU LỊCH MỸ THO - CẦN THƠ - CÀ MAU - BẠC LIÊU - SÓC TRĂNG',0,30,NULL,'du-lich-my-tho-can-tho-ca-mau-bac-lieu-soc-trang',74),(15,NULL,NULL,NULL,NULL,2000000,1000000,'DU LỊCH QUY NHƠN - KỲ CO - EO GIÓ - TUY HÒA',0,30,NULL,'du-lich-quy-nhon-ky-co-eo-gio-tuy-hoa',1),(16,NULL,NULL,NULL,NULL,2000000,1000000,'DU LỊCH TẾT NGUYÊN ĐÁN TẠI HÀ NỘI - HỒ BA BỂ - BẢN GIỐC - PÁC BÓ - LẠNG SƠN (BAY VN)',0,30,NULL,'du-lich-tet-nguyen-dan-tai-ha-noi-ho-ba-be-ban-gioc-pac-bo-lang-son-bay-vn',5),(17,NULL,NULL,NULL,NULL,2000000,1000000,'DU LỊCH TẾT NGUYÊN ĐÁN TẠI PHÚ THỌ- HÀ GIANG - ĐỒNG VĂN- LŨNG CÚ - HÀ NỘI (BAY VN)',0,30,NULL,'du-lich-tet-nguyen-dan-tai-phu-tho-ha-giang-dong-van-lung-cu-ha-noi-bay-vn',4),(18,NULL,NULL,NULL,NULL,2000000,1000000,'DU LỊCH QUY NHƠN - KỲ CO - EO GIÓ - TUY HÒA',0,30,NULL,'du-lich-quy-nhon-ky-co-eo-gio-tuy-hoa',1),(19,NULL,NULL,NULL,NULL,2000000,1000000,'DU LỊCH HÀ NỘI - LÀO CAI - SAPA - HẠ LONG 5 NGÀY ',0,30,NULL,'du-lich-ha-noi-lao-cai-sapa-ha-long-5-ngay',2),(20,NULL,NULL,NULL,NULL,2000000,1000000,'DU LỊCH HÀ NỘI - LÀO CAI - SAPA - HẠ LONG 5 NGÀY ',0,30,NULL,'du-lich-ha-noi-lao-cai-sapa-ha-long-5-ngay',2),(21,NULL,NULL,NULL,NULL,2000000,1000000,'DU LỊCH HÀ NỘI - LÀO CAI - SAPA - HẠ LONG 5 NGÀY ',0,30,NULL,'du-lich-ha-noi-lao-cai-sapa-ha-long-5-ngay',2);
/*!40000 ALTER TABLE `plans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plans_places`
--

DROP TABLE IF EXISTS `plans_places`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `plans_places` (
  `plan_id` bigint(20) NOT NULL,
  `place_id` bigint(20) NOT NULL,
  PRIMARY KEY (`plan_id`,`place_id`),
  KEY `FKfcciok440nqu5qwdn67gcyrsw` (`place_id`),
  CONSTRAINT `FKfcciok440nqu5qwdn67gcyrsw` FOREIGN KEY (`place_id`) REFERENCES `places` (`id`),
  CONSTRAINT `FKnq2cs2xgf0pyapatqeq8uokv1` FOREIGN KEY (`plan_id`) REFERENCES `plans` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plans_places`
--

LOCK TABLES `plans_places` WRITE;
/*!40000 ALTER TABLE `plans_places` DISABLE KEYS */;
INSERT INTO `plans_places` VALUES (20,0),(1,1),(20,1),(19,2),(15,3),(17,4),(21,4),(7,6),(8,6),(9,6),(18,11),(16,12),(19,12),(10,13),(11,13),(12,22),(3,31),(4,31),(5,31),(16,35),(10,45),(11,45),(12,47),(6,54),(11,55);
/*!40000 ALTER TABLE `plans_places` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `roles` (
  `id` bigint(20) NOT NULL,
  `created_at` date DEFAULT NULL,
  `created_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tour_types`
--

DROP TABLE IF EXISTS `tour_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tour_types` (
  `id` bigint(20) NOT NULL,
  `created_at` date DEFAULT NULL,
  `created_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tour_types`
--

LOCK TABLES `tour_types` WRITE;
/*!40000 ALTER TABLE `tour_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `tour_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tours`
--

DROP TABLE IF EXISTS `tours`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tours` (
  `id` bigint(20) NOT NULL,
  `created_at` date DEFAULT NULL,
  `created_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `enable` bit(1) NOT NULL DEFAULT b'1',
  `file_content_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `image_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `number_of_date` int(11) NOT NULL,
  `number_of_night` int(11) NOT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `tour_type` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKkmd8j2x2ob2x4ui0ootug4au2` (`tour_type`),
  CONSTRAINT `FKkmd8j2x2ob2x4ui0ootug4au2` FOREIGN KEY (`tour_type`) REFERENCES `tour_types` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tours`
--

LOCK TABLES `tours` WRITE;
/*!40000 ALTER TABLE `tours` DISABLE KEYS */;
INSERT INTO `tours` VALUES (1,NULL,'admin',NULL,NULL,'- Tham quan và chiêm ngưỡng vẻ đẹp của Vịnh Vũng Rô  \n- Khám phá vẻ đẹp Đảo Kỳ Co - thiên đường biển đảo ở Quy Nhơn \n- Tham quan Eo Gió - một ghềnh đá quanh năm lộng gió',_binary '','du-lich-quy-nhon-ky-co-eo-gio-tuy-hoa-1.html','https://saigontourist.net/uploads/destination/TrongNuoc/QuyNhon/lighthouse-built-phu-yen-vietnam_318802580.jpg','DU LỊCH QUY NHƠN - KỲ CO - EO GIÓ - TUY HÒA',4,3,'du-lich-quy-nhon-ky-co-eo-gio-tuy-hoa',NULL),(2,NULL,'admin',NULL,NULL,'- Tham quan Quốc Tử Giám - từng là trung tâm thờ tự và giáo dục Nho học lớn nhất \n- Du ngoạn vịnh Hạ Long - một trong 7 kỳ quan thiên nhiên mới của thế giới \n- Ngắm toàn cảnh Sapa và “Nóc nhà Đông Dương” - đỉnh Fansipan tại sân mây - Tìm hiểu đời sống dân tộc thiểu số tại bản Tả Phìn',_binary '','du-lich-ha-noi-lao-cai-sapa-ha-long-5-ngay-2.html','https://www.saigontourist.net/uploads/destination/TrongNuoc/Halong/Halong-Bay-Vietnam_243530122.jpg','DU LỊCH HÀ NỘI - LÀO CAI - SAPA - HẠ LONG 5 NGÀY',5,4,'du-lich-ha-noi-lao-cai-sapa-ha-long-5-ngay',NULL),(3,NULL,'admin',NULL,NULL,'- Ngắm hồ Hoàn Kiếm, viếng đền Ngọc Sơn. \n- Du ngoạn vịnh Hạ Long - thưởng ngoạn vẻ đẹp kỳ vĩ của hang Ba Hang, các hòn Đỉnh Hương - Trống Mái (Gà Chọi) - Chó Đá. \n- Chinh phục núi Hàm Rồng, thưởng ngoạn vườn lan, vườn hoa ôn đới, vườn đào và khu vườn đá, xem biểu diễn múa hát dân gian của các dân tộc thiểu số',_binary '','du-lich-ha-noi-ha-long-lao-cai-sapa-3.html','https://www.saigontourist.net/uploads/destination/TrongNuoc/Hanoi/ba-dinh-square-hanoi.jpg','DU LỊCH HÀ NỘI - HẠ LONG - LÀO CAI - SAPA',5,4,'du-lich-ha-noi-ha-long-lao-cai-sapa',NULL),(4,NULL,'admin',NULL,NULL,'- Đến Cao nguyên đá Đồng Văn - Công viên địa chất toàn cầu. Thưởng ngoạn cảnh sắc ngoạn mục từ những “vườn đá”, “rừng đá” tai mèo giữa những dãy núi trùng điệp\n- Vượt đèo Mã Pí Lèng - một trong “Tứ đại danh đèo” của vùng núi biên viễn phía Bắc.\n- Viếng khu di tích Đền Hùng trang nghiêm trên núi Nghĩa Lĩnh.',_binary '','du-lich-tet-nguyen-dan-tai-phu-tho-ha-giang-dong-van-lung-cu-ha-noi-bay-vn-4.html','https://www.saigontourist.net/uploads/destination/TrongNuoc/mienbac/Ha-giang/dinh-thu-ho-vuong--dong-van_767226742.jpg','DU LỊCH TẾT NGUYÊN ĐÁN TẠI PHÚ THỌ- HÀ GIANG - ĐỒNG VĂN- LŨNG CÚ - HÀ NỘI (BAY VN)',6,5,'du-lich-tet-nguyen-dan-tai-phu-tho-ha-giang-dong-van-lung-cu-ha-noi-bay-vn',NULL),(5,NULL,'admin',NULL,NULL,'-  Chiêm ngưỡng cảnh sắc đầy hùng vĩ và thơ mộng của thác Bản Giốc - một trong bốn thác nước là đường biên giới tự nhiên giữa các quốc gia lớn nhất thế giới.\n-  Thăm  hồ Ba Bể - viên ngọc trong xanh giữa núi rừng Đông Bắc, thưởng ngoạn phong cảnh của một trong 100 hồ nước ngọt đẹp nhất toàn cầu.\n- Tham quan Động Tam Thanh - được mệnh danh là \"Đệ nhất bát cảnh Xứ Lạng\"',_binary '','du-lich-tet-nguyen-dan-tai-ha-noi-ho-ba-be-ban-gioc-pac-bo-lang-son-bay-vn-5.html','https://www.saigontourist.net/uploads/destination/TrongNuoc/Caobang-BacCan/Bangioc-Caobang-Vietnam_541176949.jpg','DU LỊCH TẾT NGUYÊN ĐÁN TẠI HÀ NỘI - HỒ BA BỂ - BẢN GIỐC - PÁC BÓ - LẠNG SƠN (BAY VN)',6,5,'du-lich-tet-nguyen-dan-tai-ha-noi-ho-ba-be-ban-gioc-pac-bo-lang-son-bay-vn',NULL),(6,NULL,'admin',NULL,NULL,'- Du ngoạn vịnh Hạ Long - thưởng ngoạn vẻ đẹp kỳ vĩ của các hòn Đỉnh Hương - Trống Mái (Gà Chọi) - Chó Đá. \n- Chinh phục núi Hàm Rồng, thưởng ngoạn vườn lan, vườn hoa ôn đới, vườn đào và khu vườn đá, xem biểu diễn múa hát dân gian của các dân tộc thiểu số.\n- Tham quan khu di tích Đền Hùng - một quần thể kiến trúc thâm nghiêm trên núi Nghĩa Lĩnh.',_binary '','du-lich-don-nam-moi-2019-ha-noi-sapa-lao-cai-phu-tho-6.html','https://www.saigontourist.net/uploads/destination/TrongNuoc/mienbac/Lao-cai/Hoang-Lien-Son-mountain_297883025.jpg','DU LỊCH [ĐÓN NĂM MỚI 2019] HÀ NỘI- SAPA - LÀO CAI- PHÚ THỌ',4,3,'du-lich-don-nam-moi-2019-ha-noi-sapa-lao-cai-phu-tho',NULL),(7,NULL,'admin',NULL,NULL,'- Đến Cao nguyên đá Đồng Văn - Công viên địa chất toàn cầu. Thưởng ngoạn cảnh sắc ngoạn mục từ những “vườn đá”, “rừng đá” tai mèo giữa những dãy núi trùng điệp\n- Vượt đèo Mã Pí Lèng - một trong “Tứ đại danh đèo” của vùng núi biên viễn phía Bắc\n-  Chiêm ngưỡng cảnh sắc đầy hùng vĩ và thơ mộng của thác Bản Giốc - một trong bốn thác nước là đường biên giới tự nhiên giữa các quốc gia lớn nhất thế giới\n- Đến hồ Ba Bể - viên ngọc trong xanh giữa núi rừng Đông Bắc, thưởng ngoạn phong cảnh của một trong 100 hồ nước ngọt đẹp nhất toàn cầu',_binary '','du-lich-mua-hoa-tam-giac-mach-ha-giang-dong-van-cao-bang-bac-kan-7.html','https://www.saigontourist.net/uploads/destination/TrongNuoc/Caobang-BacCan/Pac-Bo_755123716.jpg','DU LỊCH [MÙA HOA TAM GIÁC MẠCH] HÀ GIANG - ĐỒNG VĂN - CAO BẰNG - BẮC KẠN',6,5,'du-lich-mua-hoa-tam-giac-mach-ha-giang-dong-van-cao-bang-bac-kan',NULL),(8,NULL,'admin',NULL,NULL,'- Đến Cao nguyên đá Đồng Văn - Công viên địa chất toàn cầu. Thưởng ngoạn cảnh sắc ngoạn mục từ những “vườn đá”, “rừng đá” tai mèo giữa những dãy núi trùng điệp\n - Tham quan Dinh thự nhà họ Vương - dòng họ giàu có và uy quyền nhất vùng một thời \n- Viếng khu di tích Đền Hùng - nơi đất tổ thiêng liêng của dân tộc Việt Nam \n- Tham quan Văn Miếu, Quốc Tử Giám - từng là trung tâm thờ tự - giáo dục Nho học lớn nhất, đã đào tạo hàng nghìn hiền tài cho đất nước trong lịch sử',_binary '','du-lich-mua-hoa-tam-giac-mach-ha-giang-dong-van-den-hung-8.html','https://www.saigontourist.net/uploads/destination/TrongNuoc/mienbac/Ha-giang/Dong-Van-commune_727416316.jpg','DU LỊCH [MÙA HOA TAM GIÁC MẠCH] HÀ GIANG - ĐỒNG VĂN - ĐỀN HÙNG',5,4,'du-lich-mua-hoa-tam-giac-mach-ha-giang-dong-van-den-hung',NULL),(9,NULL,'admin',NULL,NULL,'- Tham quan dạo quanh, ngắm hồ Hoàn Kiếm, viếng đền Ngọc Sơn. \n- Viếng chùa Bái Đính - Khu chùa rộng nhất Việt Nam và thờ Tượng Phật bằng đồng lớn nhất Đông Nam Á. \n- Tham quan Khu du lịch Tràng An - nằm trong quần thể danh thắng được UNESCO công nhận di sản hỗn hợp đầu tiên của Việt Nam và khu vực Đông Nam Á. Đặc biệt, khám phá bối cảnh “Làng thổ dân” trong phim bom tấn Kong.\n- Du ngoạn vịnh Hạ Long, chiêm ngưỡng động Thiên Cung,các hòn Đỉnh Hương - Trống Mái (Gà Chọi) - Chó Đá.',_binary '','du-lich-ha-noi-ha-long-ninh-binh-trang-an-thoi-gian-9.html','https://www.saigontourist.net/uploads/destination/TrongNuoc/Halong/Halong-Bay-Vietnam_433429624.jpg','DU LỊCH HÀ NỘI - HẠ LONG - NINH BÌNH - TRÀNG AN THỜI GIAN:',4,3,'du-lich-ha-noi-ha-long-ninh-binh-trang-an-thoi-gian',NULL),(10,NULL,'admin',NULL,NULL,'- Tìm hiểu đời sống của dân tộc thiểu số tại bản Lao Chải - Tả Van \n- Viếng chùa Bái Đính - ngôi chùa của những kỷ lục \n- Tham quan KDL Tràng An - với hệ thống sông, suối, các hang xuyên thủy động và các dãy núi đá vôi trùng điệp \n- Viếng chùa Trấn Quốc - danh lam cổ tự được xây dựng từ thế kỷ VI \n- Du ngoạn vịnh Hạ Long - một trong 7 kỳ quan thiên nhiên mới của thế giới',_binary '','du-lich-ha-noi-lao-cai-sapa-ninh-binh-lang-tho-dan-dao-dau-lau-ha-long-10.html','https://www.saigontourist.net/uploads/destination/TrongNuoc/Halong/Ha-Long-Bay-Vietnam_415520146.jpg','DU LỊCH HÀ NỘI - LÀO CAI - SAPA - NINH BÌNH - LÀNG THỔ DÂN ĐẢO ĐẦU LÂU - HẠ LONG',6,5,'du-lich-ha-noi-lao-cai-sapa-ninh-binh-lang-tho-dan-dao-dau-lau-ha-long',NULL),(11,NULL,'admin',NULL,NULL,'- Du ngoạn vịnh Hạ Long - thưởng ngoạn vẻ đẹp kỳ vĩ của hang Ba Hang, các hòn Đỉnh Hương - Trống Mái (Gà Chọi) - Chó Đá. \n- Chinh phục núi Hàm Rồng, thưởng ngoạn vườn lan, vườn hoa ôn đới, vườn đào và khu vườn đá, xem biểu diễn múa hát dân gian của các dân tộc thiểu số.\n- Trải nghiệm cáp treo lên Chùa Hoa Yên trong quần thể Danh thắng Trúc Lâm Yên Tử.',_binary '','du-lich-tet-nguyen-dan-tai-ha-long-yen-tu-ha-noi-sapa-lao-cai-11.html','https://www.saigontourist.net/uploads/destination/TrongNuoc/Halong/Ha-Long-Bay-Vietnam_415520146.jpg','DU LỊCH TÊT NGUYÊN ĐÁN TẠI HẠ LONG - YÊN TỬ - HÀ NỘI - SAPA - LÀO CAI',5,4,'du-lich-tet-nguyen-dan-tai-ha-long-yen-tu-ha-noi-sapa-lao-cai',NULL),(12,NULL,'admin',NULL,NULL,'- Chinh phục núi Hàm Rồng, thưởng ngoạn vườn lan, vườn hoa ôn đới, vườn đào và khu vườn đá, xem biểu diễn múa hát dân gian của các dân tộc thiểu số.\n- Tham quan khu di tích Đền Hùng - một quần thể kiến trúc trang nghiêm trên núi Nghĩa Lĩnh.\n- Tham quan Quốc Tử Giám - từng là trung tâm thờ tự và giáo dục Nho học lớn nhất',_binary '','du-lich-tet-nguyen-dan-tai-ha-noi-lao-cai-sapa-den-hung-12.html','https://www.saigontourist.net/uploads/destination/TrongNuoc/mienbac/Garden-Ham-Rong-Mountain-Sapa_321223610.jpg','DU LỊCH TẾT NGUYÊN ĐÁN TẠI HÀ NỘI - LÀO CAI - SAPA - ĐỀN HÙNG',4,3,'du-lich-tet-nguyen-dan-tai-ha-noi-lao-cai-sapa-den-hung',NULL),(13,NULL,'admin',NULL,NULL,'- Tham quan dạo quanh, ngắm hồ Hoàn Kiếm, viếng đền Ngọc Sơn. \n- Viếng chùa Bái Đính - Khu chùa rộng nhất Việt Nam và thờ Tượng Phật bằng đồng lớn nhất Đông Nam Á. \n- Tham quan Khu du lịch Tràng An - nằm trong quần thể danh thắng được UNESCO công nhận di sản hỗn hợp đầu tiên của Việt Nam và khu vực Đông Nam Á. Đặc biệt, khám phá bối cảnh “Làng thổ dân” trong phim bom tấn Kong.\n- Du ngoạn vịnh Hạ Long, chiêm ngưỡng động Thiên Cung,các hòn Đỉnh Hương - Trống Mái (Gà Chọi) - Chó Đá.',_binary '','du-lich-tet-nguyen-dan-tai-ha-noi-ninh-binh-ha-long-13.html','https://www.saigontourist.net/uploads/destination/TrongNuoc/Halong/Halong-Bay-Vietnam_344233349.jpg','DU LỊCH TẾT NGUYÊN ĐÁN TẠI HÀ NỘI - NINH BÌNH - HẠ LONG',4,3,'du-lich-tet-nguyen-dan-tai-ha-noi-ninh-binh-ha-long',NULL),(14,NULL,'admin',NULL,NULL,'- Chinh phục núi Hàm Rồng, thưởng ngoạn vườn lan, vườn hoa ôn đới, vườn đào và khu vườn đá, xem biểu diễn múa hát dân gian của các dân tộc thiểu số. \n- Du ngoạn vịnh Hạ Long - thưởng ngoạn vẻ đẹp kỳ vĩ của hang Ba Hang, các hòn Đỉnh Hương - Trống Mái (Gà Chọi) - Chó Đá. \n- Viếng Lăng Bác, khu di tích Phủ Chủ Tịch.',_binary '','du-lich-tet-nguyen-dan-tai-ha-noi-lao-cai-sapa-ha-long-hai-phong-14.html','https://www.saigontourist.net/uploads/destination/TrongNuoc/Hanoi/Ba-Dinh-Square-in-Hanoi-Vietnam_428152555.jpg','DU LỊCH TẾT NGUYÊN ĐÁN TẠI HÀ NỘI - LÀO CAI - SAPA - HẠ LONG - HẢI PHÒNG',5,4,'du-lich-tet-nguyen-dan-tai-ha-noi-lao-cai-sapa-ha-long-hai-phong',NULL),(15,NULL,'admin',NULL,NULL,'- Tham quan Trấn Quốc - danh lam cổ tự được xây dựng từ thế kỷ VI\n- Ngắm toàn cảnh Sapa và “Nóc nhà Đông Dương” - đỉnh Fansipan tại sân mây \n-Thăm cột mốc 92 và cột cờ Lũng Pô nơi con sông Hồng chảy vào đất Việt.',_binary '','du-lich-tet-nguyen-dan-tai-ha-noi-lao-cai-sapa-lung-po-15.html','https://www.saigontourist.net/uploads/destination/TrongNuoc/mienbac/Lao-cai/LaoCai_LungPo_1115688728.jpg','DU LỊCH TẾT NGUYÊN ĐÁN TẠI HÀ NỘI - LÀO CAI - SAPA - LŨNG PÔ',4,3,'du-lich-tet-nguyen-dan-tai-ha-noi-lao-cai-sapa-lung-po',NULL),(16,NULL,'admin',NULL,NULL,'- Viếng chùa Bái Đính - ngôi chùa của những kỷ lục như: Khu chùa rộng nhất Việt Nam, thờ Tượng Phật bằng đồng lớn nhất Đông Nam Á v.v.. \n- Du ngoạn vịnh Hạ Long - thưởng ngoạn vẻ đẹp kỳ vĩ của hang Ba Hang, các hòn Đỉnh Hương - Trống Mái (Gà Chọi) - Chó Đá.\n - Trải nghiệm cáp treo lên Chùa Hoa Yên trong quần thể Danh thắng Trúc Lâm Yên Tử.\n-  Tham quan Khu du lịch Tràng An - nơi có cảnh quan ngoạn mục với hệ thống sông, suối đan xen nối dài chảy tràn trong các thung lũng, các hang xuyên thủy động và các dãy núi đá vôi trùng điệp.',_binary '','du-lich-tet-nguyen-dan-tai-ha-noi-ninh-binh-yen-tu-ha-long-16.html','https://www.saigontourist.net/uploads/destination/TrongNuoc/Quangninh/QuangNinh_YenTu_429807853.jpg','DU LỊCH TẾT NGUYÊN ĐÁN TẠI HÀ NỘI - NINH BÌNH - YÊN TỬ - HẠ LONG',4,3,'du-lich-tet-nguyen-dan-tai-ha-noi-ninh-binh-yen-tu-ha-long',NULL),(17,NULL,'admin',NULL,NULL,'- Chinh phục “Nóc nhà Đông Dương” - đỉnh Fansipan ở độ cao 3,143m.\n - Tham quan các di tích: bảo tàng chiến thắng Điện Biên Phủ, đồi A1, Hầm tướng De Castries, Tượng đài chiến thắng Điện Biên Phủ (đồi D1). \n- Tham quan động Pu Sam Cáp- như một kho tàng bí ẩn khổng lồ với những trầm tích kiến tạo lạ lùng nhìn vào như một bức tranh thu nhỏ toàn cảnh của vùng Tây Bắc.\n- Thăm cột mốc 92 và cột cờ Lũng Pô nơi con sông Hồng chảy vào đất Việt.',_binary '','du-lich-tet-nguyen-dan-tai-moc-chau-son-la-dien-bien-lai-chau-sapa-lao-cai-lung-po-17.html','https://www.saigontourist.net/uploads/destination/TrongNuoc/mienbac/Son-la/Dai-Yem-waterfall_750539233.jpg','DU LỊCH TẾT NGUYÊN ĐÁN TẠI MỘC CHÂU - SƠN LA - ĐIỆN BIÊN - LAI CHÂU - SAPA - LÀO CAI - LŨNG PÔ',5,4,'du-lich-tet-nguyen-dan-tai-moc-chau-son-la-dien-bien-lai-chau-sapa-lao-cai-lung-po',NULL),(18,NULL,'admin',NULL,NULL,'-  Ngắm toàn cảnh Sapa và “Nóc nhà Đông Dương” - đỉnh Fansipan tại sân mâ\n-  Du ngoạn vịnh Hạ Long - thưởng ngoạn vẻ đẹp kỳ vĩ của hang Ba Hang, các hòn Đỉnh Hương - Trống Mái (Gà Chọi) - Chó Đá.\n- Viếng khu di tích Đền Hùng - một quần thể kiến trúc trang nghiêm trên núi Nghĩa Lĩnh.',_binary '','du-lich-tet-tai-ha-long-ha-noi-sapa-lao-cai-den-hung-18.html','https://www.saigontourist.net/uploads/destination/TrongNuoc/mienbac/Phu-tho/Hung-King-Temple-Phu-Tho-Province_617054414.jpg','DU LỊCH TẾT TẠI HẠ LONG - HÀ NỘI - SAPA - LÀO CAI - ĐỀN HÙNG',5,4,'du-lich-tet-tai-ha-long-ha-noi-sapa-lao-cai-den-hung',NULL),(19,NULL,'admin',NULL,NULL,'- Chinh phục núi Hàm Rồng, thưởng ngoạn vườn lan, vườn hoa ôn đới, vườn đào và khu vườn đá, xem biểu diễn múa hát dân gian của các dân tộc thiểu số.\n- Du ngoạn vịnh Hạ Long - thưởng ngoạn vẻ đẹp kỳ vĩ của hang Ba Hang, các hòn Đỉnh Hương - Trống Mái (Gà Chọi) - Chó Đá.',_binary '','du-lich-tet-nguyen-dan-tai-ha-noi-lao-cai-sapa-ha-long-bay-vn-19.html','https://www.saigontourist.net/uploads/destination/TrongNuoc/Halong/rock-island-trong-mai.jpg','DU LỊCH TẾT NGUYÊN ĐÁN TẠI HÀ NỘI - LÀO CAI - SAPA - HẠ LONG (BAY VN)',5,4,'du-lich-tet-nguyen-dan-tai-ha-noi-lao-cai-sapa-ha-long-bay-vn',NULL),(20,NULL,'admin',NULL,NULL,'- Du ngoạn vịnh Hạ Long, chiêm ngưỡng động Thiên Cung,các hòn Đỉnh Hương - Trống Mái (Gà Chọi) - Chó Đá.\n-  Tham quan Tam Cốc, được mệnh danh với những cái tên nổi tiếng như \"vịnh Hạ Long trên cạn\" hay \"Nam thiên đệ nhị động\" là một khu du lịch trọng điểm quốc gia Việt Nam.\n- Chiêm bái chùa Ba Vàng với khung cảnh nên thơ, trữ tình mà vẫn rất linh thiêng của chốn đạo thiền nhà Phật.',_binary '','du-lich-tet-nguyen-dan-tai-ha-noi-nam-dinh-ninh-binh-ha-long-bay-vn-20.html','https://www.saigontourist.net/uploads/destination/TrongNuoc/Quangninh/ba-vang-temple-quang-ninh.jpg','DU LỊCH TẾT NGUYÊN ĐÁN TẠI HÀ NỘI - NAM ĐỊNH - NINH BÌNH - HẠ LONG (BAY VN',4,3,'du-lich-tet-nguyen-dan-tai-ha-noi-nam-dinh-ninh-binh-ha-long-bay-vn',NULL),(21,NULL,'admin',NULL,NULL,'- Tham quan khu di tích lịch sử Lam Kinh, trải nghiệm cảm giác thú vị với \" cây ổi cười\" tại Lăng vua Lê Thái Tổ. \n- Ngằm nhìn đàn cá hàng ngàn con tại suối cá thần Cẩm Lương. \n- Tham quan vườn thú Safari với nhiều loài động vật quý hiếm: tê giác, sư tử, cọp, gấu,.. tại khu du lịch sinh thái Mường Thanh Diễn Châu. \n- Thư giãn, chụp hình trong không gian xanh ngát, bạt ngàn của đảo chè Thanh Chương.',_binary '','du-lich-thanh-hoa-suoi-ca-than-cam-luong-vuon-thu-safari-dao-che-thanh-chuong-21.html','https://www.saigontourist.net/uploads/destination/TrongNuoc/Thanh%20hoa/Thanh-Hoa-Lam-Kinh_528834625.jpg','DU LỊCH THANH HÓA - SUỐI CÁ THẦN CẨM LƯƠNG - VƯỜN THÚ SAFARI - ĐẢO CHÈ THANH CHƯƠNG',4,3,'du-lich-thanh-hoa-suoi-ca-than-cam-luong-vuon-thu-safari-dao-che-thanh-chuong',NULL),(22,NULL,'admin',NULL,NULL,'- Tham quan khu di tích lịch sử Lam Kinh, trải nghiệm cảm giác thú vị với \" cây ổi cười\" tại Lăng vua Lê Thái Tổ. \n- Ngằm nhìn đàn cá hàng ngàn con tại suối cá thần Cẩm Lương. \n- Hòa mình với thiên nhiên trong lành, bình dị tại Pù Luông Retreat.\n- Lênh đênh trên dòng sông Mã hùng vĩ, thưởng thức các làn điệu dân ca Thanh Hóa, hò sông Mã,..',_binary '','du-lich-thanh-hoa-pu-luong-suoi-ca-than-cam-luong-du-thuyen-tren-song-ma-22.html','https://www.saigontourist.net/uploads/destination/TrongNuoc/Thanh%20hoa/Pu-Luong-Nature-Reserve_1131050054.jpg','DU LỊCH THANH HÓA- PÙ LUÔNG - SUỐI CÁ THẦN CẨM LƯƠNG - DU THUYỀN TRÊN SÔNG MÃ',3,2,'du-lich-thanh-hoa-pu-luong-suoi-ca-than-cam-luong-du-thuyen-tren-song-ma',NULL),(23,NULL,'admin',NULL,NULL,'-  Dạo chơi trên bờ cát trắng để gió biển thổi tung những vướng bận đời thường\n- Tham quan đồi cát vàng - ngắm nhìn những đụn cát vàng rực rỡ vào buổi sáng sớm',_binary '','du-lich-phan-thiet-mui-ne-lang-chai-xua-23.html','https://www.saigontourist.net/uploads/destination/TrongNuoc/Phanthiet/lang-chai_655972792.jpg','DU LỊCH PHAN THIẾT - MŨI NÉ - LÀNG CHÀI XƯA',2,1,'du-lich-phan-thiet-mui-ne-lang-chai-xua',NULL),(24,NULL,'admin',NULL,NULL,'- Tự do dạo chơi bên bãi tắm nước trong xanh cát trắng phẳng lì, gió biển thổi mát dịu. \n- Tham quan không gian trưng bày nghệ thuật \" Làng chài xưa\" - Tham quan đồi cát vàng với các hoạt động trượt cát thú vị. \n-  Thư giãn trong hồ bơi tắm khoáng tại Trung tâm bùn khoáng nóng Mũi Né.',_binary '','du-lich-tai-phan-thiet-mui-ne-24.html','https://www.saigontourist.net/uploads/destination/TrongNuoc/Phanthiet/Mui-Ne-sand-dune_1103353646.jpg','DU LỊCH TẠI PHAN THIẾT - MŨI NÉ',3,2,'du-lich-tai-phan-thiet-mui-ne',NULL),(25,NULL,'admin',NULL,NULL,'- Tự do dạo chơi bên bãi tắm nước trong xanh cát trắng phẳng lì, gió biển thổi mát dịu. \n- Viếng chùa Linh Sơn Trường Thọ trên núi Tà Kú với tượng phật Thích Ca nhập niết bàn dài 49m.\n-  Tham quan không gian trưng bày nghệ thuật \" Làng chài xưa\"\n- Tham quan đồi cát vàng với các hoạt động trượt cát thú v',_binary '','du-lich-phan-thiet-nui-ta-ku-doi-cat-vang-25.html','https://www.saigontourist.net/uploads/destination/TrongNuoc/Phanthiet/Ganh-Son-Beach_534032509.jpg','DU LỊCH PHAN THIẾT - NÚI TÀ KÚ - ĐỒI CÁT VÀNG',3,2,'du-lich-phan-thiet-nui-ta-ku-doi-cat-vang',NULL),(26,NULL,'admin',NULL,NULL,'- Dạo chơi trên bờ cát trắng để gió biển thổi tung những vướng bận đời thường\n- Tham quan không gian trưng bày nghệ thuật “Làng chài xưa” tái hiện lại một phần làng chài xưa của Phan Thiết - Mũi Né cách đây hơn 300 năm.',_binary '','du-lich-phan-thiet-don-nam-moi-2019-mui-ne-ta-ku-26.html','https://www.saigontourist.net/uploads/destination/TrongNuoc/Phanthiet/Mui-Ne-sand-dune_1103353646.jpg','DU LỊCH PHAN THIẾT ĐÓN NĂM MỚI 2019 [MŨI NÉ - TÀ KÚ]',1,1,'du-lich-phan-thiet-don-nam-moi-2019-mui-ne-ta-ku',NULL),(27,NULL,'admin',NULL,NULL,'- Chiêm ngưỡng vẻ đẹp của biển Cà Ná - một trong những bãi biển đẹp của miền Trung\n- Thư giãn và tắm khoáng trung tâm suối khoáng nóng I resort Nha Trang (tự túc chi phí tắm bùn các loại)\n- Tham quan dinh vua Bảo Đại - nơi vị vua cuối cùng của triều đại phong kiến Việt Nam từng sống và làm việc \n- Tham quan Thiền viện Trúc Lâm - nơi ngắm được toàn cảnh hồ Tuyền Lâm',_binary '','du-lich-nha-trang-da-lat-27.html','https://www.saigontourist.net/uploads/destination/TrongNuoc/Dalat/Truc-Lam-longstanding-ancient-works-in-Dalat-Vietnam_430980358.jpg','DU LỊCH NHA TRANG - ĐÀ LẠT',5,4,'du-lich-nha-trang-da-lat',NULL),(28,NULL,'admin',NULL,NULL,'- Chiêm ngưỡng Bãi biển cát trắng Cà Ná - một trong những bãi biển đẹp nổi tiếng của miền Trung\n- Tới khu du lịch Hòn Lao - đảo Khỉ, thư giãn, xem xiếc hoặc thử các môn thể thao bãi biển\n- Tắm biển Dốc Lết - Một trong những bãi biển êm, đẹp, nổi tiếng của tỉnh Khánh Hòa',_binary '','du-lich-nha-trang-hon-lao-doc-let-28.html','https://www.saigontourist.net/uploads/destination/TrongNuoc/Nhatrang/Hon-Chong-cape-Nha-Trang-Vietnam_521794075.jpg','DU LỊCH NHA TRANG - HÒN LAO - DỐC LẾT',4,3,'du-lich-nha-trang-hon-lao-doc-let',NULL),(29,NULL,'admin',NULL,NULL,'- Trải nghiệm các dịch vụ cao cấp tại khu nghỉ dưỡng GM bên bờ biểm Dốc Lết thơ mộng.\n- Tham gia các buổi tập dưỡng sinh hoặc yoga trong 30 phút với sự hướng dẫn của các huấn luyên viên.\n- Chăm sóc sức khỏe với các bác sỹ thăm khám, kiểm tra sức khỏe 3 lần/ ngày trong suốt quá trình nghỉ dưỡng tại GM Dốc Lế',_binary '','du-lich-cham-soc-suc-khoe-nha-trang-gm-doc-let-29.html','https://www.saigontourist.net/uploads/destination/TrongNuoc/Nhatrang/Doc-Let-beach_383171023.jpg','DU LỊCH [CHĂM SÓC SỨC KHỎE] NHA TRANG - GM DỐC LẾT',3,3,'du-lich-cham-soc-suc-khoe-nha-trang-gm-doc-let',NULL),(30,NULL,'admin',NULL,NULL,'- Chiêm ngưỡng Bãi biển cát trắng Cà Ná - một trong những bãi biển đẹp nổi tiếng của miền Trung\n- Tự do thư giãn và tắm biển tại khu du lịch Sealife Bãi Dài\n- Tháp Bảo Tích tại chùa Từ Vân được xây dựng từ những viên san hô xếp chồng lên nhau, kết hợp với vỏ ốc, vỏ sò tạo nên một không gian mang đậm phong vị biển cả.',_binary '','du-lich-nha-trang-bai-dai-i-resort-30.html','https://www.saigontourist.net/uploads/destination/TrongNuoc/Nhatrang/Ca-Na-beach_781076338.jpg','DU LỊCH NHA TRANG - BÃI DÀI - I RESORT',4,3,'du-lich-nha-trang-bai-dai-i-resort',NULL),(31,NULL,'admin',NULL,NULL,'- Tham quan thác D\'ray Nur - ngọn thác hùng vỹ của Tây Nguyên đại ngàn.\n- Chụp hình lưu niệm tại Cầu Treo và ngắm cảnh sông Sêrêpok, nhà Lào cổ hơn 120 năm tại khu du lịch Buôn Đôn. \n- Thư giãn và tắm khoáng tại trung tâm Suối khoáng nóng Iresort Nha Trang',_binary '','du-lich-tet-nguyen-dan-tai-buon-ma-thuot-nha-trang-31.html','https://www.saigontourist.net/uploads/destination/TrongNuoc/BMT/dray-nur-waterfall.jpg','DU LỊCH TẾT NGUYÊN ĐÁN TẠI BUÔN MA THUỘT - NHA TRANG',5,4,'du-lich-tet-nguyen-dan-tai-buon-ma-thuot-nha-trang',NULL),(32,NULL,'admin',NULL,NULL,'- Chiêm ngưỡng Bãi biển cát trắng Cà Ná - một trong những bãi biển đẹp nổi tiếng của miền Trung\n- Tới khu du lịch Hòn Lao - đảo Khỉ, thư giãn, xem xiếc hoặc thử các môn thể thao bãi biển\n- Tắm biển Bãi Nhũ Tiên- Một trong những bãi biển êm, đẹp, nổi tiếng của tỉnh Khánh Hòa',_binary '','du-lich-tet-nguyen-dan-tai-nha-trang-hon-lao-32.html','https://www.saigontourist.net/uploads/destination/TrongNuoc/Nhatrang/add-logo-photo-nha-trang-2.jpg','DU LỊCH TẾT NGUYÊN ĐÁN TẠI NHA TRANG - HÒN LAO',4,3,'du-lich-tet-nguyen-dan-tai-nha-trang-hon-lao',NULL),(33,NULL,'admin',NULL,NULL,'- Tham quan Hòn Lao - Đảo khỉ, một trong những khu du lịch sinh thái sinh động nhất tại Nha Trang\n- Chiêm ngưỡng Tháp Bà Ponaga, nhà Thờ Đá, mua sắm tại  chợ Đầm \n- Thăm cánh Đồng Hoa Cẩm Tú Cầu, Chùa Linh Phước.\n- Viếng Thiền viện Trúc Lâm - thiền viện lớn nhất Lâm Đồng',_binary '','du-lich-nha-trang-da-lat-don-nam-moi-2019-33.html','https://www.saigontourist.net/uploads/destination/TrongNuoc/Dalat/Cam-tu-cau_1171409227.jpg','DU LỊCH NHA TRANG - ĐÀ LẠT [ĐÓN NĂM MỚI 2019]',4,4,'du-lich-nha-trang-da-lat-don-nam-moi-2019',NULL),(34,NULL,'admin',NULL,NULL,'- Tham quan tháp bà Ponagar, Long Sơn tự, Nhà thờ đá.\n- Đắm mình trong làn nước xanh trong của đảo Điệp Sơn, trải nghiệm con đường giữa biển',_binary '','du-lich-nha-trang-diep-son-don-nam-moi-2019-34.html','https://www.saigontourist.net/uploads/destination/TrongNuoc/Nhatrang/Island-Diep-Son_469674887.jpg','DU LỊCH NHA TRANG - ĐIỆP SƠN [ĐÓN NĂM MỚI 2019]',3,3,'du-lich-nha-trang-diep-son-don-nam-moi-2019',NULL),(35,NULL,'admin',NULL,NULL,'- Tham quan thác Dambri - ngọn thác hùng vĩ tại cao nguyên Bảo Lộc \n- Tham quan Khu Du Lịch Trang Trại Rau và Hoa, nằm trải rộng cả một thung lũng với bốn bề là rau và hoa đẹp tuyệt vời \n- Chinh phục đỉnh Langbian, thác Dantala\n- Chiêm ngưỡng Thiền viện Trúc Lâm, Quảng trường Lâm Viên',_binary '','du-lich-da-lat-don-nam-moi-2019-35.html','https://www.saigontourist.net/uploads/destination/TrongNuoc/Dalat/Langbiang-dalat-vietnam_519197881.jpg','DU LỊCH ĐÀ LẠT ĐÓN NĂM MỚI 2019',3,2,'du-lich-da-lat-don-nam-moi-2019',NULL),(36,NULL,'admin',NULL,NULL,'- Tham quan thác Datanla nằm tựa mình trên đèo Prenn – một trong những cung đường đèo thơ mộng nhất Đà Lạt nằm trên quốc lộ 20, cách trung tâm thành phố khoảng 5 km về phía Nam.\n- Tham quan Khu Du Lịch Trang Trại Rau và Hoa, nằm trải rộng cả một thung lũng với bốn bề là rau và hoa đẹp tuyệt vời \n- Viếng chùa Linh Phước- ngôi chùa giữ 11 kỷ lục Việt Nam.',_binary '','du-lich-tet-nguyen-dan-tai-da-lat-trang-trai-rau-hoa-duong-ham-dieu-khac-khu-du-lich-langbiang-bay-vn-36.html','https://www.saigontourist.net/uploads/destination/TrongNuoc/Dalat/peaceful-Datanla-Waterfalls_763119436.jpg','DU LỊCH TẾT NGUYÊN ĐÁN TẠI ĐÀ LẠT - TRANG TRẠI RAU & HOA - ĐƯỜNG HẦM ĐIÊU KHẮC KHU DU LỊCH LANGBIANG (BAY VN)',3,2,'du-lich-tet-nguyen-dan-tai-da-lat-trang-trai-rau-hoa-duong-ham-dieu-khac-khu-du-lich-langbiang-bay-vn',NULL),(37,NULL,'admin',NULL,NULL,'- Tham quan thác Dambri - ngọn thác hùng vĩ tại cao nguyên Bảo Lộc \n- Tham quan Khu Du Lịch Trang Trại Rau và Hoa, nằm trải rộng cả một thung lũng với bốn bề là rau và hoa đẹp tuyệt vời \n- Viếng Linh Ẩn tự, ngôi chùa với tượng Phật Di Lặc lớn nhất tỉnh Lâm Đồng.',_binary '','du-lich-tet-nguyen-dan-tai-da-lat-trang-trai-rau-hoa-duong-ham-dieu-khac-ca-phe-me-linh-chua-linh-an-37.html','https://www.saigontourist.net/uploads/destination/TrongNuoc/Dalat/Vegetable-fields-and-Housein-highland_634336823.jpg','DU LỊCH TẾT NGUYÊN ĐÁN TẠI ĐÀ LẠT - TRANG TRẠI RAU & HOA - ĐƯỜNG HẦM ĐIÊU KHẮC- CÀ PHÊ MÊ LINH - CHÙA LINH ẨN',4,3,'du-lich-tet-nguyen-dan-tai-da-lat-trang-trai-rau-hoa-duong-ham-dieu-khac-ca-phe-me-linh-chua-linh-an',NULL),(38,NULL,'admin',NULL,NULL,'- Tham quan Khu Du Lịch Trang Trại Rau và Hoa, nằm trải rộng cả một thung lũng với bốn bề là rau và hoa đẹp tuyệt vời \n- Chụp hình lưu niệm tại Đường hầm điêu khắc đất đỏ (Đà Lạt Star) - tại hiện lịch sử Đà Lạt hơn 120 năm qua.\n- Đến khu du lịch Liang Biang tham quan Đồi Mimosa, thung lũng Trăm Năm..\n- Chiêm bái tượng Phật Di Lặc lớn nhất tỉnh Lâm Đồng tại Linh Ẩn tự bình yên bên dòng Thác Voi trắng xóa,',_binary '','du-lich-tet-nguyen-dan-tai-da-lat-trang-trai-rau-hoa-duong-ham-dieu-khac-nui-lang-biang-38.html','https://www.saigontourist.net/uploads/destination/TrongNuoc/Dalat/Domaine-de-Marie-church-Da-Lat.jpg','DU LỊCH TẾT NGUYÊN ĐÁN TẠI ĐÀ LẠT - TRANG TRẠI RAU & HOA - ĐƯỜNG HẦM ĐIÊU KHẮC- NÚI LANG BIANG',1,1,'du-lich-tet-nguyen-dan-tai-da-lat-trang-trai-rau-hoa-duong-ham-dieu-khac-nui-lang-biang',NULL),(39,NULL,'admin',NULL,NULL,'- Tham quan thác Dambri - ngọn thác hùng vĩ tại cao nguyên Bảo Lộc \n- Tham quan Khu Du Lịch Trang Trại Rau và Hoa, nằm trải rộng cả một thung lũng với bốn bề là rau và hoa đẹp tuyệt vời \n- Viếng Linh Ẩn tự, ngôi chùa với tượng Phật Di Lặc lớn nhất tỉnh Lâm Đồng. \n- Tham quan nhà máy Trà Atiso& Rượu Vang Vĩnh Tiến.',_binary '','du-lich-da-lat-trang-trai-rau-hoa-duong-ham-dieu-khac-ca-phe-me-linh-chua-linh-an-39.html','https://www.saigontourist.net/uploads/destination/TrongNuoc/Dalat/dambri-waterfall-da-lat.jpg','DU LỊCH ĐÀ LẠT - TRANG TRẠI RAU & HOA -ĐƯỜNG HẦM ĐIÊU KHẮC - CÀ PHÊ MÊ LINH - CHÙA LINH ẤN',4,3,'du-lich-da-lat-trang-trai-rau-hoa-duong-ham-dieu-khac-ca-phe-me-linh-chua-linh-an',NULL),(40,NULL,'admin',NULL,NULL,'Khám phá Swiss-Belresort Tuyền Lâm - Đà Lạt, khu nghĩ dưỡng cao cấp toạ lạc trên những đồi thông với khung cảnh lãng mạn \n- Thưởng thức trà và cà phê tại Bảo Lộc \n- Tham quan Đường hầm điêu khắc đất đỏ (Đà Lạt Star) - tái hiện lịch sử Đà Lạt qua hơn 120 năm',_binary '','du-lich-da-lat-ho-tuyen-lam-duong-ham-dieu-khac-3-ngay-40.html','https://www.saigontourist.net/uploads/destination/TrongNuoc/Dalat/tuyen-lam-lake-da-lat.jpg','DU LỊCH ĐÀ LẠT - HỒ TUYẾN LÂM - ĐƯỜNG HẦM ĐIỂU KHẮC 3 NGÀY',3,2,'du-lich-da-lat-ho-tuyen-lam-duong-ham-dieu-khac-3-ngay',NULL),(41,NULL,'admin',NULL,NULL,'- Tham quan thác D\'ray Nur - ngọn thác hùng vỹ của Tây Nguyên đại ngàn.\n- Chụp hình lưu niệm tại Cầu Treo và ngắm cảnh sông Sêrêpok, nhà Lào cổ hơn 120 năm tại khu du lịch Buôn Đôn. \n- Thư giãn và tắm khoáng tại trung tâm Suối khoáng nóng Iresort Nha Trang',_binary '','du-lich-tet-nguyen-dan-tai-buon-ma-thuot-nha-trang-41.html','https://www.saigontourist.net/uploads/destination/TrongNuoc/BMT/BMT-Cau-Treo_766431559.jpg','DU LỊCH TẾT NGUYÊN ĐÁN TẠI BUÔN MA THUỘT - NHA TRANG',5,4,'du-lich-tet-nguyen-dan-tai-buon-ma-thuot-nha-trang',NULL),(42,NULL,'admin',NULL,NULL,'- Tham quan thác D\'ray Nur - ngọn thác hùng vỹ của Tây Nguyên đại ngàn.\n- Thăm buôn làng Ê đê Ako Dhong - tìm hiểu cuộc sống cộng đồng dân tộc Ê đê\n- Nghe giới thiệu và tìm hiểu qui trình sản xuất cà phê Chồn tại Cơ sở nuôi chồn và sản xuất sản phẩm cà phê Chồn,',_binary '','du-lich-buon-ma-thuot-buon-don-peliku-thuy-dien-ialy-42.html','https://www.saigontourist.net/uploads/destination/TrongNuoc/BMT/The-Dray-Nur-Waterfall-Tay-Nguyen.jpg','DU LỊCH BUÔN MA THUỘT - BUÔN ĐÔN - PELIKU - THỦY ĐIỆN IALY',4,3,'du-lich-buon-ma-thuot-buon-don-peliku-thuy-dien-ialy',NULL),(43,NULL,'admin',NULL,NULL,'- Tham quan bán đảo Sơn Trà, ngắm cảng Tiên Sa, viếng chùa Linh Ứng Bãi Bụt - ngôi chùa lớn nhất ở thành phố Đà Nẵng, chiêm bái tượng Phật Quan Thế Âm cao nhất Việt Nam. \n- Đắm mình trong không gian cổ kính của Kinh Thành Huế. - Dạo bộ Phố cổ Hội An, tham quan các công trình tiêu biểu. \n- Tắm khoáng thư giãn tại Công viên Suối khoáng nóng Núi Thần Tài.',_binary '','du-lich-tet-nguyen-dan-tai-da-nang-suoi-khoang-nong-nui-than-tai-hoi-an-kdl-ba-na-hills-–-cau-vang-hue-43.html','https://www.saigontourist.net/uploads/destination/TrongNuoc/Hue/Hue_AnHien.jpg','DU LỊCH TẾT NGUYÊN ĐÁN TẠI ĐÀ NẴNG - SUỐI KHOÁNG NÓNG NÚI THẦN TÀI - HỘI AN KDL BÀ NÀ HILLS – CẦU VÀNG - HUẾ',4,3,'du-lich-tet-nguyen-dan-tai-da-nang-suoi-khoang-nong-nui-than-tai-hoi-an-kdl-ba-na-hills-–-cau-vang-hue',NULL),(44,NULL,'admin',NULL,NULL,'- Tham quan Phố cổ Hội An cổ kính, thơ mộng\n- Viếng chùa Thiên Mụ - ngôi chùa cổ và nổi tiếng nhất ở đất Cố đô\n- Tham quan động Thiên Đường - một trong những hang động kỳ vĩ và dài nhất thế giới\n- Tham quan Di sản Văn hóa Thế giới Kinh Thành Huế - Hoàng cung của 13 vị Vua triều Nguyễn với các công trình tiêu biểu',_binary '','du-lich-tet-nguyen-dan-tai-da-nang-–-hoi-an-–-ba-na-–-dong-thien-duong-–-hue-44.html','https://www.saigontourist.net/uploads/destination/TrongNuoc/Quangbinh/Dong-Thien-Duong_420035677.jpg','DU LỊCH TẾT NGUYÊN ĐÁN TẠI ĐÀ NẴNG – HỘI AN – BÀ NÀ – ĐỘNG THIÊN ĐƯỜNG – HUẾ',5,4,'du-lich-tet-nguyen-dan-tai-da-nang-–-hoi-an-–-ba-na-–-dong-thien-duong-–-hue',NULL),(45,NULL,'admin',NULL,NULL,'- Tham quan bán đảo Sơn Trà, ngắm cảng Tiên Sa, viếng chùa Linh Ứng Bãi Bụt - ngôi chùa lớn nhất ở thành phố Đà Nẵng, chiêm bái tượng Phật Quan Thế Âm cao nhất Việt Nam.\n- Tắm khoáng thư giãn tại các hồ tự nhiên ngoài trời, thư giãn với xông hơi khô - ướt, vui chơi tại Công viên nước của Suối Khoáng Nóng Thần Tài.\n - Thư thả dạo bộ tại Phố cổ Hội An.',_binary '','du-lich-tet-nguyen-dan-tai-da-nang-suoi-khoang-nong-nui-than-tai-–-hoi-an-kdl-ba-na-hills-45.html','https://www.saigontourist.net/uploads/destination/TrongNuoc/HoiAn/Hoi-An_603729146.jpg','DU LỊCH TẾT NGUYÊN ĐÁN TẠI ĐÀ NẴNG - SUỐI KHOÁNG NÓNG NÚI THẦN TÀI – HỘI AN - KDL BÀ NÀ HILLS',3,2,'du-lich-tet-nguyen-dan-tai-da-nang-suoi-khoang-nong-nui-than-tai-–-hoi-an-kdl-ba-na-hills',NULL),(46,NULL,'admin',NULL,NULL,'-  Dạo chơi thư giãn tại Phố cổ Hội An cổ kính, thơ mộng.\n - Đến Cù Lao Chàm đã được UNESCO công nhận là khu dự trữ sinh quyển thế giới. \n- Tham quan bán đảo Sơn Trà, ngắm cảnh cảng Tiên Sa, viếng chùa Linh Ứng Bãi Bụt - ngôi chùa lớn nhất ở thành phố Đà Nẵng, chiêm bái tượng Phật Quan Thế Âm cao nhất Việt Nam.\n- Tham quan Di sản Văn hóa Thế giới Kinh Thành Huế - Hoàng cung của 13 vị Vua triều Nguyễn với hàng loạt công trình kiến trúc đặc sắc.',_binary '','du-lich-tet-nguyen-dan-tai-da-nang-cu-lao-cham-hoi-an-kdl-ba-na-hills-cau-vang-hue-46.html','https://www.saigontourist.net/uploads/destination/TrongNuoc/HoiAn/phuc-kien-hall.jpg','DU LỊCH TẾT NGUYÊN ĐÁN TẠI ĐÀ NẴNG - CÙ LAO CHÀM - HỘI AN KDL BÀ NÀ HILLS - CẦU VÀNG - HUẾ',4,3,'du-lich-tet-nguyen-dan-tai-da-nang-cu-lao-cham-hoi-an-kdl-ba-na-hills-cau-vang-hue',NULL),(47,NULL,'admin',NULL,NULL,'- Thư giãn tại Công viên suối khoáng nóng Thần Tài với các dịch vụ: tắm bùn, tắm trà - sữa- cà phê,..\n- Vui chơi giải trí tại KDL Bà Nà, chụp hình trên Cầu Vàng đượcthiết kế độc đáo và ấn tượng như một dải lụa vàng được nâng đỡ trên đôi tay khổng lồ giữa cảnh sắc nên thơ tuyệt diệu của Bà Nà - Núi Chúa.\n- Dạo bước trong lòng Phố Cổ Hội An thơ mộng, cổ kính. \n- Tham quan Di sản Văn hóa Thế giới Kinh Thành Huế - Hoàng cung của 13 vị Vua triều Nguyễn với các công trình tiêu biểu.',_binary '','du-lich-don-nam-moi-2019-da-nang-suoi-khoang-nong-than-tai-hoi-an-ba-na-cau-vang-hue-47.html','https://www.saigontourist.net/uploads/destination/TrongNuoc/DaNang/shutterstock_1172501959.jpg','DU LỊCH [ĐÓN NĂM MỚI 2019] ĐÀ NẴNG- SUỐI KHOÁNG NÓNG THẦN TÀI - HỘI AN - BÀ NÀ - CẦU VÀNG - HUẾ',4,3,'du-lich-don-nam-moi-2019-da-nang-suoi-khoang-nong-than-tai-hoi-an-ba-na-cau-vang-hue',NULL),(48,NULL,'admin',NULL,NULL,'- Thư giãn tại Công viên suối khoáng nóng Thần Tài với các dịch vụ: tắm bùn, tắm trà - sữa- cà phê,..\n- Vui chơi giải trí tại KDL Bà Nà, chụp hình trên Cầu Vàng đượcthiết kế độc đáo và ấn tượng như một dải lụa vàng được nâng đỡ trên đôi tay khổng lồ giữa cảnh sắc nên thơ tuyệt diệu của Bà Nà - Núi Chúa.\n- Dạo bước trong lòng Phố Cổ Hội An thơ mộng, cổ kính. \n- Tham quan Di sản Văn hóa Thế giới Kinh Thành Huế - Hoàng cung của 13 vị Vua triều Nguyễn với các công trình tiêu biểu.',_binary '','du-lich-don-nam-moi-2019-da-nang-suoi-khoang-nong-than-tai-hoi-an-ba-na-cau-vang-hue-48.html','https://www.saigontourist.net/uploads/destination/TrongNuoc/HoiAn/Hoi-An_603729146.jpg','DU LỊCH [ĐÓN NĂM MỚI 2019] ĐÀ NẴNG- SUỐI KHOÁNG NÓNG THẦN TÀI - HỘI AN - BÀ NÀ - CẦU VÀNG - HUẾ',4,3,'du-lich-don-nam-moi-2019-da-nang-suoi-khoang-nong-than-tai-hoi-an-ba-na-cau-vang-hue',NULL),(49,NULL,'admin',NULL,NULL,'- Tham quan Di sản Văn hóa Thế giới Kinh Thành Huế - Hoàng cung của 13 vị Vua triều Nguyễn với các công trình tiêu biểu\n- Viếng lăng vua Khải Định - chiêm ngưỡng một công trình kết hợp hài hòa giữa kiến trúc truyền thống Huế và hiện đại của Tây phương\n- Dạo bộ tham quan Phố cổ với các công trình tiêu biểu\n- Vui chơi giải trí tại KDL Bà Nà',_binary '','du-lich-hue-da-nang-hoi-an-ba-na-4-ngay-3-dem-49.html','https://www.saigontourist.net/uploads/destination/TrongNuoc/Hue/Imperial-Hue-Vietnam_523290700.jpg','DU LỊCH HUẾ - ĐÀ NẴNG - HỘI AN - BÀ NÀ 4 NGÀY 3 ĐÊM',4,3,'du-lich-hue-da-nang-hoi-an-ba-na-4-ngay-3-dem',NULL),(50,NULL,'admin',NULL,NULL,'- Tắm khoáng thư giãn tại Công viên Suối khoáng nóng Núi Thần Tài. \n- Dạo bộ Phố cổ Hội An, tham quan các công trình tiêu biểu.\n- Đắm mình trong không gian cổ kính của Kinh Thành Huế.',_binary '','du-lich-hue-suoi-khoang-nong-than-tai-hoi-an-50.html','https://www.saigontourist.net/uploads/destination/TrongNuoc/Hue/Imperial-Enclosure_780751699.jpg','DU LỊCH HUẾ - SUỐI KHOÁNG NÓNG THẦN TÀI - HỘI AN',4,3,'du-lich-hue-suoi-khoang-nong-than-tai-hoi-an',NULL),(51,NULL,'admin',NULL,NULL,'- Viếng chùa Linh Ứng Bãi Bụt - ngôi chùa lớn nhất ở thành phố Đà Nẵng\n- Viếng chùa Thiên Mụ - ngôi chùa cổ và nổi tiếng nhất ở đất Cố đô\n- Tham quan động Thiên Đường - một trong những hang động kỳ vĩ và dài nhất thế giới\n- Tham quan Di sản Văn hóa Thế giới Kinh Thành Huế - Hoàng cung của 13 vị Vua triều Nguyễn với các công trình tiêu biểu\n- Vui chơi giải trí tại KDL Bà Nà',_binary '','du-lich-da-nang-hoi-an-dong-thien-duong-hue-ba-na-5-ngay-51.html','https://www.saigontourist.net/uploads/destination/TrongNuoc/Hue/Thien-Mu-Pagoda_467888462.jpg','DU LỊCH ĐÀ NẴNG - HỘI AN - ĐỘNG THIÊN ĐƯỜNG - HUẾ - BÀ NÀ 5 NGÀY',5,4,'du-lich-da-nang-hoi-an-dong-thien-duong-hue-ba-na-5-ngay',NULL),(52,NULL,'admin',NULL,NULL,'- Tắm khoáng thư giãn tại Công viên Suối khoáng nóng Núi Thần Tài với các dịch vụ thư giãn tại hồ tự nhiên ngoài trời, xông hơi khô- ướt, vui chơi tại công viên nước...\n- Dạo bộ Phố cổ Hội An cổ kính, thơ mộng.\n- Vui chơi giải trí tại khu du lịch Bà Nà Hills, đặc biệt chụp hình tại Cầu Vàng với thiết kế như một dải lụa mềm mại, được nâng đỡ trên đôi tay khổng lồ giữa cảnh sắc tuyệt diệu của Bà Nà - Núi Chúa.',_binary '','du-lich-don-nam-moi-2019-da-nang-hoi-an-suoi-khoang-nong-nui-than-tai-ba-na-cau-vang-52.html','https://www.saigontourist.net/uploads/destination/TrongNuoc/HoiAn/Lanterns-at-old-town-shop-in-Hoi-An-Vietnam_525841252.jpg','DU LỊCH [ĐÓN NĂM MỚI 2019] ĐÀ NẴNG - HỘI AN - SUỐI KHOÁNG NÓNG NÚI THẦN TÀI - BÀ NÀ - CẦU VÀNG',3,2,'du-lich-don-nam-moi-2019-da-nang-hoi-an-suoi-khoang-nong-nui-than-tai-ba-na-cau-vang',NULL),(53,NULL,'admin',NULL,NULL,'- Tham quan và chiêm ngưỡng vẻ đẹp của Vịnh Vũng Rô  \n- Khám phá vẻ đẹp Đảo Kỳ Co - thiên đường biển đảo ở Quy Nhơn \n- Tham quan Eo Gió - một ghềnh đá quanh năm lộng gió',_binary '','du-lich-quy-nhon-ky-co-eo-gio-tuy-hoa-53.html','https://www.saigontourist.net/uploads/destination/TrongNuoc/QuyNhon/lighthouse-built-phu-yen-vietnam_318802580.jpg','DU LỊCH QUY NHƠN - KỲ CO - EO GIÓ - TUY HÒA',4,3,'du-lich-quy-nhon-ky-co-eo-gio-tuy-hoa',NULL),(54,NULL,'admin',NULL,NULL,'- Khám phá vẻ đẹp Đảo Kỳ Co - thiên đường biển đảo ở Quy Nhơn \n- Tham quan Eo Gió - một ghềnh đá quanh năm lộng gió\n- Trải nghiệm dịch vụ cao cấp tại FLC Quy Nhơn',_binary '','du-lich-quy-nhon-ky-co-eo-gio-flc-quy-nhon-54.html','https://www.saigontourist.net/uploads/destination/TrongNuoc/QuyNhon/FLC-Quy-Nhon.jpg','DU LỊCH QUY NHƠN - KỲ CO - EO GIÓ - FLC QUY NHƠN',3,2,'du-lich-quy-nhon-ky-co-eo-gio-flc-quy-nhon',NULL),(55,NULL,'admin',NULL,NULL,'- Tham quan Bãi Môn, chụp hình tại Gành Ông - nơi từng xuất hiện trong bộ phim điện ảnh\" Tôi thấy hoa vàng trên cỏ xanh\" của Victor Vũ. \n- Viếng nhà thờ Mằng Lăng - một trong những nhà thờ cổ nhất Việt Nam, nơi lưu giữ cuốn kinh thánh bằng chữ quốc ngữ đầu tiên của Việt Nam. \n- Tham quan bãi biển Kỳ Co - được ví như Maldives của Việt Nam với làn nước trong xanh.',_binary '','du-lich-don-nam-moi-2019-tuy-hoa-quy-nhon-ky-co-eo-gio-trung-luon-55.html','https://www.saigontourist.net/uploads/destination/TrongNuoc/PhuYen/Ghenh-Da-Dia-coastline-in-Phu-Yen_734441935.jpg','DU LỊCH [ĐÓN NĂM MỚI 2019] TUY HÒA- QUY NHƠN - KỲ CO - EO GIÓ - TRUNG LƯƠN',4,3,'du-lich-don-nam-moi-2019-tuy-hoa-quy-nhon-ky-co-eo-gio-trung-luon',NULL),(56,NULL,'admin',NULL,NULL,'-  Khám phá vẻ đẹp Đảo Kỳ Co - thiên đường biển đảo ở Quy Nhơn \n- Tham quan Eo Gió - một ghềnh đá quanh năm lộng gió, thơ mộng. \n- Chụp ảnh lưu niệm tại Gành Ông - nơi có những cảnh quay đặc sắc trong bộ phim \" Tôi Thấy Hoa Vàng Trên Cỏ Xanh',_binary '','du-lich-tet-nguyen-dan-tai-tuy-hoa-quy-nhon-56.html','https://www.saigontourist.net/uploads/destination/TrongNuoc/QuyNhon/Ganh-Da-Dia_312631598.jpg','DU LỊCH TẾT NGUYÊN ĐÁN TẠI TUY HÒA- QUY NHƠN',3,4,'du-lich-tet-nguyen-dan-tai-tuy-hoa-quy-nhon',NULL),(57,NULL,'admin',NULL,NULL,'- Tham quan Bãi Môn - cảnh quan đã từng xuất hiện trong tác phẩm điện ảnh nổi tiếng “Tôi Thấy Hoa Vàng Trên Cỏ Xanh” của đạo diễn Victor Vũ\n-  Thăm Gành Đá Dĩa - chiêm ngưỡng một hiện tượng địa chất độc đáo, được hình thành cách nay hàng trăm triệu năm, ngắm vẻ đẹp hoang sơ của Đầm Ô Loan.\n- Khám phá vẻ đẹp Đảo Kỳ Co - thiên đường biển đảo ở Quy Nhơn \n- Tham quan Eo Gió - một ghềnh đá quanh năm lộng gió',_binary '','du-lich-tet-nguyen-dan-tai-tuy-hoa-bai-xep-quy-nhon-ky-co-eo-gio-kdn-trung-luong-57.html','https://www.saigontourist.net/uploads/destination/TrongNuoc/QuyNhon/eo-gio-bay.jpg','DU LỊCH TẾT NGUYÊN ĐÁN TẠI TUY HÒA - BÃI XÉP - QUY NHƠN - KỲ CO - EO GIÓ - KDN TRUNG LƯƠNG',1,1,'du-lich-tet-nguyen-dan-tai-tuy-hoa-bai-xep-quy-nhon-ky-co-eo-gio-kdn-trung-luong',NULL),(58,NULL,'admin',NULL,NULL,'- Tham quan Bãi Xép - nơi từng xuất hiện trong bộ phim điện ảnh\" Tôi thấy hoa vàng trên cỏ xanh\" của Victor Vũ. \n- Viếng nhà thờ Mằng Lăng - một trong những nhà thờ cổ nhất Việt Nam, nơi lưu giữ cuốn kinh thánh bằng chữ quốc ngữ đầu tiên của Việt Nam. \n- Tham quan bãi biển Kỳ Co - được ví như Maldives của Việt Nam với làn nước trong xanh.',_binary '','du-lich-quy-nhon-phu-yen-ganh-da-dia-nha-tho-mang-lang-bai-xep-mui-dien-eo-giao-bao-tang-quang-trung-58.html','https://www.saigontourist.net/uploads/destination/TrongNuoc/QuyNhon/beach-in-Quy-Nhon_649093831.jpg','DU LỊCH QUY NHƠN - PHÚ YÊN [GÀNH ĐÁ ĐĨA - NHÀ THỜ MẰNG LĂNG - BÃI XÉP - MŨI ĐIỆN - EO GIÁO - BẢO TÀNG QUANG TRUNG]',3,3,'du-lich-quy-nhon-phu-yen-ganh-da-dia-nha-tho-mang-lang-bai-xep-mui-dien-eo-giao-bao-tang-quang-trung',NULL),(59,NULL,'admin',NULL,NULL,'- Tham quan khu di tích lịch sử Lam Kinh, trải nghiệm cảm giác thú vị với \" cây ổi cười\" tại Lăng vua Lê Thái Tổ. \n- Ngằm nhìn đàn cá hàng ngàn con tại suối cá thần Cẩm Lương. \n- Tham quan vườn thú Safari với nhiều loài động vật quý hiếm: tê giác, sư tử, cọp, gấu,.. tại khu du lịch sinh thái Mường Thanh Diễn Châu. \n- Thư giãn, chụp hình trong không gian xanh ngát, bạt ngàn của đảo chè Thanh Chương.',_binary '','du-lich-thanh-hoa-suoi-ca-than-cam-luong-vuon-thu-safari-dao-che-thanh-chuong-59.html','https://www.saigontourist.net/uploads/destination/TrongNuoc/Thanh%20hoa/Thanh-Hoa-Lam-Kinh_528834625.jpg','DU LỊCH THANH HÓA - SUỐI CÁ THẦN CẨM LƯƠNG - VƯỜN THÚ SAFARI - ĐẢO CHÈ THANH CHƯƠNG',4,3,'du-lich-thanh-hoa-suoi-ca-than-cam-luong-vuon-thu-safari-dao-che-thanh-chuong',NULL),(60,NULL,'admin',NULL,NULL,'- Tham quan di tích nhà tù Phú Quốc \n- Viếng Thiền Viện Trúc Lâm Hộ Quốc ngôi chùa đẹp và lớn nhất đảo ngọc \n- Tắm biển Bãi Sao (hoặc bãi Ông Lang) - một trong những bãi biển đẹp nhất tại Phú Quốc \n- Chiêm ngưỡng vẻ đẹp của thắng cảnh dinh Cậu',_binary '','du-lich-phu-quoc-bai-sao-vietjet-60.html','https://www.saigontourist.net/uploads/destination/TrongNuoc/Phuquoc/snorkeling-in-phu-quoc.jpg','DU LỊCH PHÚ QUỐC - BÃI SAO [VIETJET]',3,2,'du-lich-phu-quoc-bai-sao-vietjet',NULL),(61,NULL,'admin',NULL,NULL,'- Du ngoạn trên biển, trải nghiệm cuộc sống của ngư dân, bơi lội giữa biển và ngắm san hô \n- Tắm biển Bãi Sao (hoặc bãi Ông Lang) - một trong những bãi biển đẹp nhất tại Phú Quốc',_binary '','du-lich-phu-quoc-cau-ca-ngam-san-ho-vietjet-61.html','https://www.saigontourist.net/uploads/destination/TrongNuoc/Phuquoc/Black-pepper-vines-at-the-plantation-in-Phu-Quoc.jpg','DU LỊCH PHÚ QUỐC CÂU CÁ - NGẮM SAN HÔ [VIETJET]',3,2,'du-lich-phu-quoc-cau-ca-ngam-san-ho-vietjet',NULL),(62,NULL,'admin',NULL,NULL,'- Tham quan điểm Vườn tiêu, Lò chế biến rượu Sim rừng Phú Quốc, Cơ sở nước mắm Phú Quốc\n- Vui chơi tại Khu giải trí VInpearl land, Vinpearl Safari\n- Tham quan trung tâm nuôi cấy ngọc trai Phú Quốc,viếng Thiên Viện Trúc Lâm Hộ Quốc ngôi chùa đẹp và lớn nhất đảo ngọc',_binary '','du-lich-don-nam-moi-2019-phu-quoc-bai-sao-62.html','https://www.saigontourist.net/uploads/destination/TrongNuoc/Phuquoc/Phu-Quoc-Island_1093686134.jpg','DU LỊCH [ĐÓN NĂM MỚI 2019] PHÚ QUỐC - BÃI SAO',3,2,'du-lich-don-nam-moi-2019-phu-quoc-bai-sao',NULL),(63,NULL,'admin',NULL,NULL,'- Du ngoạn trên biển, trải nghiệm cuộc sống của ngư dân, bơi lội giữa biển và ngắm san hô \n- Tắm biển Bãi Sao (hoặc bãi Ông Lang) - một trong những bãi biển đẹp nhất tại Phú Quốc',_binary '','du-lich-don-nam-moi-2019-phu-quoc-cau-ca-63.html','https://www.saigontourist.net/uploads/destination/TrongNuoc/Phuquoc/Phu-Quoc-Island-Bai-Sao-Beach-Vietnam_299278025.jpg','DU LỊCH [ĐÓN NĂM MỚI 2019] PHÚ QUỐC - CÂU CÁ',3,2,'du-lich-don-nam-moi-2019-phu-quoc-cau-ca',NULL),(64,NULL,'admin',NULL,NULL,'- Du ngoạn trên biển, trải nghiệm cuộc sống của ngư dân, bơi lội giữa biển và ngắm san hô \n- Tắm biển Bãi Sao - một trong những bãi biển đẹp nhất tại Phú Quốc',_binary '','du-lich-phu-quoc-don-nam-moi-2019-64.html','https://www.saigontourist.net/uploads/destination/TrongNuoc/Phuquoc/Phu-Quoc-Island-Bai-Sao-Beach-Vietnam_602685398.jpg','DU LỊCH PHÚ QUỐC [ĐÓN NĂM MỚI 2019]',3,2,'du-lich-phu-quoc-don-nam-moi-2019',NULL),(65,NULL,'admin',NULL,NULL,'- Tham quan Dinh Cậu, Cơ sở chế biến Ngọc Trai, Làng chài cổ Hàm Ninh,,,\n- Tham quan di tích lịch sử nhà tù Phú Quốc, xem film tư liệu và những hình ảnh biết nói, cảm nhận nỗi đau của các chiến sĩ yêu nước và sống với niềm tự hào dân tộc. Chùa Hùng Long - ngôi chùa tín ngưỡng địa phương, tọa lạc trên đồi cao,  có thể nhìn thấy toàn cảnh thị trấn, tham quan, cúng Chùa, cầu an cho người thân\n- Tắm biển Bãi Sao, khám phá khu vui chơi Vinpearl Land',_binary '','du-lich-phu-quoc-kham-pha-dao-ngoc-phu-quoc-65.html','https://www.saigontourist.net/uploads/destination/TrongNuoc/Phuquoc/phu-quoc-beach_599336339.jpg','DU LỊCH PHÚ QUỐC [KHÁM PHÁ ĐẢO NGỌC PHÚ QUỐC]',4,3,'du-lich-phu-quoc-kham-pha-dao-ngoc-phu-quoc',NULL),(66,NULL,'admin',NULL,NULL,'- Đảo Hòn Sơn (tên gọi khác là đảo Hòn Sơn Rái) nằm cách nằm giữa Hòn Tre và quần đảo Nam Du, có phong cảnh hoang sơ tự nhiên và những bãi biển dài, nước trong như ngọc.\n- Đảo thuộc xã Lại Sơn, huyện Kiên Hải, tỉnh Kiên Giang, nằm cách thành phố Rạch Giá 65 km về phía tây.\n- Đến với Hòn Sơn tham quan phong cảnh còn hoang sơ như bãi Đá Chài, bãi Xếp, bãi Thiên Tế, bãi Bàng, bãi biển dài, nước trong vắt xanh như ngọc.\n- Chụp hình tại Thác Nước từ đỉnh Yên Ngựa nhìn xuống - nơi có thể phóng tầm mắt nhìn ra toàn cảnh Hòn Sơn. \n- Tiếp tục tham quan miếu “Nam Hải Đại Tướng Quân” - miếu thờ nổi tiếng nhất của du lịch Hòn Sơn, nhà thùng sản xuất nước mắm - một làng nghề cổ truyền, lâu đời nhất Kiên Giang.\n- Viếng Chùa Phật Lớn, miếu “Bà Cố Chủ” - nơi thờ Bà Chúa Hòn rất linh thiêng được rất nhiều người dân trên đảo tin tưởng và thờ phụng..',_binary '','du-lich-don-nam-moi-2019-tai-hon-son-2-ngay-66.html','https://www.saigontourist.net/uploads/destination/TrongNuoc/kien-giang/hon-son-island_1030596607.jpg','DU LỊCH ĐÓN NĂM MỚI 2019 TẠI HÒN SƠN [2 NGÀY]',2,1,'du-lich-don-nam-moi-2019-tai-hon-son-2-ngay',NULL),(67,NULL,'admin',NULL,NULL,'- Chiêm ngưỡng vẻ đẹp của quần đảo Nam Du với Bãi Ngự, Bãi Cây Mến, Hòn Hai Bờ Đập,… cùng non xanh, nước biếc, làm say lòng người lữ khách gần xa .\n- Thỏa thích thưởng thức hải sản cháo Nhum, Cá Biển Nướng, Cầu Gai (Nhum) nướng mỡ hành và mua sắm sản vật trên đảo.',_binary '','du-lich-don-nam-moi-2019-nam-du-hon-cu-tron-67.html','https://www.saigontourist.net/uploads/destination/TrongNuoc/Mientay/beach-in-nam-du-island.jpg','DU LỊCH ĐÓN NĂM MỚI 2019 [NAM DU - HÒN CỦ TRON]',2,1,'du-lich-don-nam-moi-2019-nam-du-hon-cu-tron',NULL),(68,NULL,'admin',NULL,NULL,'- Tham quan các tỉnh miền Tây, Rừng Tràm Trà Sư, viếng Tây An cổ tự, Lăng Thoại Ngọc Hầu \n- Viếng chùa Hang, đi tham quan chợ Châu Đốc...',_binary '','du-lich-can-tho-chau-doc-ha-tien-vna-68.html','https://www.saigontourist.net/uploads/destination/TrongNuoc/Chau-doc/Tra-Su-mangrove-forest_417084736.jpg','DU LỊCH CẦN THƠ - CHÂU ĐỐC - HÀ TIÊN- VNA',4,3,'du-lich-can-tho-chau-doc-ha-tien-vna',NULL),(69,NULL,'admin',NULL,NULL,'- Miền Tây Nam Bộ là vùng đồng bằng rộng lớn với những làng quê, miệt vườn trù phú cùng những dòng sông, kênh rạch chằng chịt, bên các cù lao và rừng tràm ngập nước, mang vẻ đẹp hoang sơ. \n- Tham quan Chợ Nổi Cái Răng - một nét văn hóa rất đặc trưng thể hiện sinh hoạt cuộc sống thường ngày của người dân vùng Đồng bằng Sông Cửu Long.\n- Viếng Lăng Thoại Ngọc Hầu - danh nhân có công khai mở đất An Giang',_binary '','du-lich-tu-da-nang-ho-chi-minh-tien-giang-can-tho-chau-doc-hang-khong-viet-nam-69.html','https://www.saigontourist.net/uploads/destination/TrongNuoc/Mientay/Can%20tho/Cai-Rang-floating-market_626020430.jpg','DU LỊCH TỪ ĐÀ NẴNG [HỒ CHÍ MINH - TIỀN GIANG - CẦN THƠ - CHÂU ĐỐC ] - HÀNG KHÔNG VIỆT NAM',3,2,'du-lich-tu-da-nang-ho-chi-minh-tien-giang-can-tho-chau-doc-hang-khong-viet-nam',NULL),(70,NULL,'admin',NULL,NULL,'- Tham quan nhà cổ Huỳnh Thủy Lê - sự kết hợp hài hòa giữa kiến trúc phương Đông và phương Tây. là nguồn cảm hứng \n- Tham quan Lâm Viên Núi Cấm với Chùa Vạn Phạt Linh, Chùa Phật Lớn,...',_binary '','du-lich-tet-nguyen-dan-tai-sa-dec-chau-doc-nui-cam-70.html','https://www.saigontourist.net/uploads/destination/TrongNuoc/Mientay/Chau-doc/Ba-Chua-Xu-temple_1196148826.jpg','DU LỊCH TẾT NGUYÊN ĐÁN TẠI SA ĐÉC - CHÂU ĐỐC- NÚI CẤM',2,1,'du-lich-tet-nguyen-dan-tai-sa-dec-chau-doc-nui-cam',NULL),(71,NULL,'admin',NULL,NULL,'- Tham quan chợ nổi Cái Răng - một chợ nổi lớn của Đồng Bằng sông Cửu Long với hình thức chào hàng rất đặc biệt. \n- Trải nghiệm các hoạt động tự làm bánh dân gian: bánh khọt, bánh kẹp cuốn ... trên Cồn Sơn.\n- Tận hưởng không khí trong lành của miệt vườn sông nước Tây Đô.',_binary '','du-lich-don-nam-moi-2019-can-tho-con-son-cho-noi-cai-rang-71.html','https://www.saigontourist.net/uploads/destination/TrongNuoc/Mientay/Can%20tho/cho-noi_245508667.jpg','DU LỊCH [ĐÓN NĂM MỚI 2019] CẦN THƠ- CỒN SƠN - CHỢ NỔI CÁI RĂNG',2,1,'du-lich-don-nam-moi-2019-can-tho-con-son-cho-noi-cai-rang',NULL),(72,NULL,'admin',NULL,NULL,'- Tham quan nhà xưa Nam bộ hơn trăm năm tuổi, theo lối kiến trúc Pháp - Việt (tùy theo thủy triều) \n- Viếng Lăng Thoại Ngọc Hầu - danh nhân có công khai mở đất An Giang \n- Viếng Chùa Hang - ngôi chùa gắn liền với truyền thuyết 2 con rắn lớn biết nghe kinh Phật \n- Viếng lăng Mạc Cửu - người có công khai trấn đất Hà Tiên vào thế kỷ 18',_binary '','du-lich-tet-nguyen-dan-tai-cai-be-can-tho-chau-doc-ha-tien-72.html','https://www.saigontourist.net/uploads/destination/TrongNuoc/Mientay/tra-su-cajuput-forest-an-giang.jpg','DU LỊCH TẾT NGUYÊN ĐÁN TẠI CÁI BÈ - CẦN THƠ - CHÂU ĐỐC - HÀ TIÊN',2,1,'du-lich-tet-nguyen-dan-tai-cai-be-can-tho-chau-doc-ha-tien',NULL),(73,NULL,'admin',NULL,NULL,'- Đến Mỹ Tho thưởng thức trái cây theo mùa, nghe nhạc tài tử Nam Bộ.\n- Tham quan chợ nổi Cái Răng - một chợ nổi lớn của Đồng Bằng sông Cửu Long. \n- Tham quan Khu dinh thự Công tử Bạc Liêu, tìm hiểu cuộc đời của Hắc công tử nổi tiếng giàu có, ăn chơi',_binary '','du-lich-tet-nguyen-dan-tai-my-tho-can-tho-ca-mau-bac-lieu-soc-trang-73.html','https://www.saigontourist.net/uploads/destination/TrongNuoc/Mientay/CA-mau-Dat-mui.jpg','DU LỊCH TẾT NGUYÊN ĐÁN TẠI MỸ THO - CẦN THƠ - CÀ MAU - BẠC LIÊU - SÓC TRĂNG',4,3,'du-lich-tet-nguyen-dan-tai-my-tho-can-tho-ca-mau-bac-lieu-soc-trang',NULL),(74,NULL,'admin',NULL,NULL,'- Đến Mỹ Tho thưởng thức trái cây theo mùa, nghe nhạc tài tử Nam Bộ\n- Tham quan chợ nổi Cái Răng - một chợ nổi lớn của Đồng Bằng sông Cửu Long\n- Tham quan Khu dinh thự Công tử Bạc Liêu, tìm hiểu cuộc đời của Hắc công tử nổi tiếng giàu có, ăn chơi',_binary '','du-lich-my-tho-can-tho-ca-mau-bac-lieu-soc-trang-74.html','https://www.saigontourist.net/uploads/destination/TrongNuoc/Mientay/My-tho-Vinh-tranh-pagoda.jpg','DU LỊCH MỸ THO - CẦN THƠ - CÀ MAU - BẠC LIÊU - SÓC TRĂNG',4,3,'du-lich-my-tho-can-tho-ca-mau-bac-lieu-soc-trang',NULL);
/*!40000 ALTER TABLE `tours` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user_roles` (
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `FKh8ciramu9cc9q3qcqiv4ue8a6` (`role_id`),
  CONSTRAINT `FKh8ciramu9cc9q3qcqiv4ue8a6` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  CONSTRAINT `FKhfh9dx7w3ubf1co1vdev94g3f` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `users` (
  `id` bigint(20) NOT NULL,
  `created_at` date DEFAULT NULL,
  `created_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `bank_account` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `birth_date` datetime NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `enable` bit(1) NOT NULL,
  `first_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `gender` bit(1) NOT NULL,
  `identification` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `join_date` datetime NOT NULL,
  `last_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `passport` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `phone_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
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

-- Dump completed on 2018-11-13 11:59:43
