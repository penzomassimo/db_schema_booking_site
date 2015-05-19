-- MySQL dump 10.13  Distrib 5.5.43, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: project3
-- ------------------------------------------------------
-- Server version	5.5.43-0ubuntu0.14.04.1

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
-- Table structure for table `apartment_booking`
--

DROP TABLE IF EXISTS `apartment_booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `apartment_booking` (
  `apartment_booking_id` int(11) NOT NULL AUTO_INCREMENT,
  `apt_id` int(11) NOT NULL,
  `guest_id` int(11) NOT NULL,
  `booking_status_code` int(11) NOT NULL,
  `booking_start_date` int(11) DEFAULT NULL,
  `booking_end_date` int(11) DEFAULT NULL,
  `other_booking_details` varchar(100) NOT NULL,
  PRIMARY KEY (`apartment_booking_id`),
  KEY `apt_id` (`apt_id`),
  KEY `guest_id` (`guest_id`),
  KEY `booking_status_code` (`booking_status_code`),
  KEY `booking_start_date` (`booking_start_date`),
  KEY `booking_end_date` (`booking_end_date`),
  CONSTRAINT `apartment_booking_ibfk_1` FOREIGN KEY (`apt_id`) REFERENCES `apartments` (`apt_id`),
  CONSTRAINT `apartment_booking_ibfk_2` FOREIGN KEY (`guest_id`) REFERENCES `guests` (`guest_id`),
  CONSTRAINT `apartment_booking_ibfk_3` FOREIGN KEY (`booking_status_code`) REFERENCES `ref_booking_status` (`booking_status_code`),
  CONSTRAINT `apartment_booking_ibfk_4` FOREIGN KEY (`booking_start_date`) REFERENCES `datedim` (`date_id`),
  CONSTRAINT `apartment_booking_ibfk_5` FOREIGN KEY (`booking_end_date`) REFERENCES `datedim` (`date_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `apartment_buildings`
--

DROP TABLE IF EXISTS `apartment_buildings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `apartment_buildings` (
  `building_id` int(11) NOT NULL AUTO_INCREMENT,
  `building_short_name` varchar(100) NOT NULL,
  `building_long_name` varchar(100) NOT NULL,
  `building_description` varchar(100) NOT NULL,
  `building_address` varchar(100) NOT NULL,
  `building_manager` varchar(100) NOT NULL,
  `building_phone` int(11) NOT NULL,
  PRIMARY KEY (`building_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `apartment_facilities`
--

DROP TABLE IF EXISTS `apartment_facilities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `apartment_facilities` (
  `apt_id` int(11) NOT NULL,
  `facility_code` int(11) NOT NULL,
  KEY `apt_id` (`apt_id`),
  KEY `facility_code` (`facility_code`),
  CONSTRAINT `apartment_facilities_ibfk_1` FOREIGN KEY (`apt_id`) REFERENCES `apartments` (`apt_id`),
  CONSTRAINT `apartment_facilities_ibfk_2` FOREIGN KEY (`facility_code`) REFERENCES `ref_apartment_facilities` (`facility_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `apartments`
--

DROP TABLE IF EXISTS `apartments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `apartments` (
  `apt_id` int(11) NOT NULL AUTO_INCREMENT,
  `building_id` int(11) NOT NULL,
  `apt_type_code` int(11) NOT NULL,
  `apt_number` int(11) NOT NULL,
  `bathroom_count` int(11) NOT NULL,
  `bedroom_count` int(11) NOT NULL,
  `room_count` int(11) NOT NULL,
  `other_details` varchar(100) NOT NULL,
  PRIMARY KEY (`apt_id`),
  KEY `building_id` (`building_id`),
  KEY `apt_type_code` (`apt_type_code`),
  CONSTRAINT `apartments_ibfk_1` FOREIGN KEY (`building_id`) REFERENCES `apartment_buildings` (`building_id`),
  CONSTRAINT `apartments_ibfk_2` FOREIGN KEY (`apt_type_code`) REFERENCES `ref_apartment_types` (`apt_type_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customers` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=205 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `datedim`
--

DROP TABLE IF EXISTS `datedim`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `datedim` (
  `date_id` int(11) NOT NULL AUTO_INCREMENT,
  `fulldate` date DEFAULT NULL,
  `dayofmonth` int(11) DEFAULT NULL,
  `dayofyear` int(11) DEFAULT NULL,
  `dayofweek` int(11) DEFAULT NULL,
  `dayname` varchar(10) DEFAULT NULL,
  `monthnumber` int(11) DEFAULT NULL,
  `monthname` varchar(10) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `quarter` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`date_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1730 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `guests`
--

DROP TABLE IF EXISTS `guests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guests` (
  `guest_id` int(11) NOT NULL AUTO_INCREMENT,
  `gender_code` int(11) NOT NULL,
  `guest_firstname` varchar(100) NOT NULL,
  `guest_lastname` varchar(100) NOT NULL,
  `date_of_birth` datetime NOT NULL,
  PRIMARY KEY (`guest_id`),
  KEY `gender_code` (`gender_code`),
  CONSTRAINT `guests_ibfk_1` FOREIGN KEY (`gender_code`) REFERENCES `ref_gender` (`gender_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ref_apartment_facilities`
--

DROP TABLE IF EXISTS `ref_apartment_facilities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ref_apartment_facilities` (
  `facility_code` int(11) NOT NULL AUTO_INCREMENT,
  `facility_description` varchar(100) NOT NULL,
  PRIMARY KEY (`facility_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ref_apartment_types`
--

DROP TABLE IF EXISTS `ref_apartment_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ref_apartment_types` (
  `apt_type_code` int(11) NOT NULL AUTO_INCREMENT,
  `apt_type_description` varchar(100) NOT NULL,
  PRIMARY KEY (`apt_type_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ref_booking_status`
--

DROP TABLE IF EXISTS `ref_booking_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ref_booking_status` (
  `booking_status_code` int(11) NOT NULL AUTO_INCREMENT,
  `booking_status_description` varchar(100) NOT NULL,
  PRIMARY KEY (`booking_status_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ref_gender`
--

DROP TABLE IF EXISTS `ref_gender`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ref_gender` (
  `gender_code` int(11) NOT NULL AUTO_INCREMENT,
  `gender_description` varchar(100) NOT NULL,
  PRIMARY KEY (`gender_code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-05-19 14:17:38
