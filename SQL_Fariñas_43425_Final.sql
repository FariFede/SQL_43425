CREATE DATABASE  IF NOT EXISTS `consultorio_SQL_Fariñas_43425` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `consultorio_SQL_Fariñas_43425`;
-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: consultorio
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `consulta_virtual`
--

DROP TABLE IF EXISTS `consulta_virtual`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `consulta_virtual` (
  `consulta_virtual_id` varchar(10) NOT NULL,
  `horario` datetime(6) NOT NULL,
  `doctor_id` varchar(10) NOT NULL,
  `especialidad_id` varchar(10) NOT NULL,
  `paciente_id` varchar(10) NOT NULL,
  PRIMARY KEY (`consulta_virtual_id`),
  UNIQUE KEY `consulta_virtual_id_UNIQUE` (`consulta_virtual_id`),
  KEY `doctor_cv_id_idx` (`doctor_id`),
  KEY `paciente_cv_id_idx` (`paciente_id`),
  KEY `especialidad_cv_id_idx` (`especialidad_id`),
  CONSTRAINT `doctor_cv_id` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`doctor_id`),
  CONSTRAINT `especialidad_cv_id` FOREIGN KEY (`especialidad_id`) REFERENCES `especialidades` (`especialidad_id`),
  CONSTRAINT `paciente_cv_id` FOREIGN KEY (`paciente_id`) REFERENCES `pacientes` (`paciente_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consulta_virtual`
--

LOCK TABLES `consulta_virtual` WRITE;
/*!40000 ALTER TABLE `consulta_virtual` DISABLE KEYS */;
INSERT INTO `consulta_virtual` VALUES ('4qG2v7hFzJ','2023-07-10 16:59:03.000000','fEm5JKcZBz','1NdlrGSQZj','2E34F5G6H7'),('5UpHa1OmjG','2023-02-09 10:25:59.000000','H4mYtAzXe1','1qW9NmYfiM','3I45J6K7L8'),('7bxeM1zDoC','2023-12-19 15:08:29.000000','Kc2Nmw4Hz9','dK3RG1uIvc','4M56N7O8P9'),('dGS90iU13M','2023-05-11 02:49:43.000000','ksj5dbziE2','M5v3dtCkrH','5Q67R8S9T1'),('E2hQFpB4Ad','2023-08-15 19:54:48.000000','LuN1Inm7Tl','S0U1oCHc3Z','6U78V9W0X1'),('hDoK96m0Zf','2023-06-28 10:39:27.000000','M43eTnNbDo','xEtG2laUg7','7Y89Z0A1B2'),('ijUOhCBNms','2023-09-27 07:36:31.000000','nYTjhbIDcf','XnNvpEqtQr','8C0D1E2F3G'),('L7WHSfdmF6','2023-08-29 07:01:34.000000','o5t6xN0sJr','y1q47NmzDh','9feb230f38'),('n2WjSD8Pek','2023-06-04 01:20:33.000000','Xpo2WcMEh5','S0U1oCHc3Z','9H2I3J4K5L'),('RkAuX3n2oE','2023-07-30 17:16:50.000000','yP1pLOKqRA','1qW9NmYfiM','AA19IU002Q');
/*!40000 ALTER TABLE `consulta_virtual` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `ValidarHorarioCv` BEFORE INSERT ON `consulta_virtual` FOR EACH ROW BEGIN
    IF NEW.horario < '09:00:00' OR NEW.horario > '19:00:00' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El horario de la consulta virtual está fuera de la franja de atención';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `doctor`
--

DROP TABLE IF EXISTS `doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor` (
  `doctor_id` varchar(10) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `especialidad_id` varchar(10) NOT NULL,
  `obra_social_id` varchar(10) NOT NULL,
  `nombre_doctor` tinytext NOT NULL,
  PRIMARY KEY (`doctor_id`),
  UNIQUE KEY `doctor_id_UNIQUE` (`doctor_id`),
  KEY `obra_social_dr_id_idx` (`obra_social_id`),
  KEY `especialidad_dr_id_idx` (`especialidad_id`),
  CONSTRAINT `especialidad_dr_id` FOREIGN KEY (`especialidad_id`) REFERENCES `especialidades` (`especialidad_id`),
  CONSTRAINT `obra_social_dr_id` FOREIGN KEY (`obra_social_id`) REFERENCES `obra_social` (`obra_social_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor`
--

LOCK TABLES `doctor` WRITE;
/*!40000 ALTER TABLE `doctor` DISABLE KEYS */;
INSERT INTO `doctor` VALUES ('fEm5JKcZBz','1145203361','1NdlrGSQZj','QlYf4eExKr','Dr. Juan González'),('H4mYtAzXe1','1145203354','1qW9NmYfiM','QlYf4eExKr','Dra. Sofía Vargas'),('Kc2Nmw4Hz9','1145203360','dK3RG1uIvc','QlYf4eExKr','Dra. María Echeandía'),('ksj5dbziE2','1145203352','M5v3dtCkrH','QlYf4eExKr','Dra. Valentina Torres'),('LuN1Inm7Tl','1145203353','S0U1oCHc3Z','U0tsnEecIk','Dr. Alejandro Gómez'),('M43eTnNbDo','1145203357','xEtG2laUg7','U0tsnEecIk','Dr. Carlos Fernández'),('nYTjhbIDcf','1145203355','XnNvpEqtQr','N2GnK6IRJf','Dr. Martín Medina'),('o5t6xN0sJr','1145203359','y1q47NmzDh','N2GnK6IRJf','Dr. José López'),('Xpo2WcMEh5','1145203356','S0U1oCHc3Z','9bvq7mjLSo','Dra. Laura Ramírez'),('yP1pLOKqRA','1145203358','1qW9NmYfiM','8MzN7im5Pd','Dra. Ana Rodríguez');
/*!40000 ALTER TABLE `doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleados` (
  `empleado_id` varchar(10) NOT NULL,
  `nombre_empleado` tinytext NOT NULL,
  `legajo` int NOT NULL,
  `mail` varchar(50) NOT NULL,
  `edad` int NOT NULL,
  `puesto` varchar(50) NOT NULL,
  PRIMARY KEY (`empleado_id`),
  UNIQUE KEY `empleado_id_UNIQUE` (`empleado_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` VALUES ('00840a1525','Omar Shakira',0,'omar.shakira@consultoriosql.com',48,'Responsable de infraestructura'),('22b45a7e17','Javier Surunga',5,'javier.surunga@consultoriosql.com',39,'Maestranza'),('5931ce6686','Daniela Galarza',1,'daniela.galarza@consultoriosql.com',35,'Recepcionista'),('5a5e300f3c','Leandro Lagos',4,'leandro.lagos@consultoriosql.com',46,'Seguridad'),('5bd3390fcd','Carlos Jolibois',6,'carlos.jolibois@consultoriosql.com',40,'Maestranza'),('cc8d0af5e7','Juliana Esquivel',3,'juliana.esquivel@consultoriosql.com',23,'Responsable de maestranza'),('ee3f9d4237','Ignacio Álvarez Gómez',2,'ignacio.gomez@consultoriosql.com',32,'Recepcionista');
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `especialidades`
--

DROP TABLE IF EXISTS `especialidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `especialidades` (
  `especialidad_id` varchar(10) NOT NULL,
  `nombre_especialidad` tinytext NOT NULL,
  PRIMARY KEY (`especialidad_id`),
  UNIQUE KEY `especialidad_id_UNIQUE` (`especialidad_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `especialidades`
--

LOCK TABLES `especialidades` WRITE;
/*!40000 ALTER TABLE `especialidades` DISABLE KEYS */;
INSERT INTO `especialidades` VALUES ('1NdlrGSQZj','Traumatólogo'),('1qW9NmYfiM','Neumonólogo'),('dK3RG1uIvc','Psicólogo'),('M5v3dtCkrH','Pediatra'),('S0U1oCHc3Z','Cardiólogo'),('xEtG2laUg7','Gastroenterólogo'),('XnNvpEqtQr','Otorrinolaringólogo'),('y1q47NmzDh','Oftalmólogo');
/*!40000 ALTER TABLE `especialidades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historia_clinica`
--

DROP TABLE IF EXISTS `historia_clinica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historia_clinica` (
  `historia_id` varchar(10) NOT NULL,
  `patologia` tinytext NOT NULL,
  `tratamiento_id` varchar(10) NOT NULL,
  `doctor_id` varchar(10) NOT NULL,
  `fecha` datetime(6) NOT NULL,
  `paciente_id` varchar(10) NOT NULL,
  PRIMARY KEY (`historia_id`),
  UNIQUE KEY `historia_id_UNIQUE` (`historia_id`),
  KEY `doctor_hc_id_idx` (`doctor_id`),
  KEY `paciente_hc_id_idx` (`paciente_id`),
  KEY `tratamiento_hc_id_idx` (`tratamiento_id`),
  CONSTRAINT `doctor_hc_id` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`doctor_id`),
  CONSTRAINT `paciente_hc_id` FOREIGN KEY (`paciente_id`) REFERENCES `pacientes` (`paciente_id`),
  CONSTRAINT `tratamiento_hc_id` FOREIGN KEY (`tratamiento_id`) REFERENCES `tratamientos` (`tratamiento_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historia_clinica`
--

LOCK TABLES `historia_clinica` WRITE;
/*!40000 ALTER TABLE `historia_clinica` DISABLE KEYS */;
INSERT INTO `historia_clinica` VALUES ('0M1N2O3P47','Dolor de muela','7kSJ13bwK6','ksj5dbziE2','2023-07-08 09:10:50.000000','2E34F5G6H7'),('1A23B4C5DA','Desgarro en el aductor','8ZfYiUKc2T','fEm5JKcZBz','2023-07-24 17:30:45.000000','3I45J6K7L8'),('2E34F5G6HK','Diarrea y vómitos','8ZfYiUKc2T','M43eTnNbDo','2023-07-24 18:20:57.000000','6U78V9W0X1'),('3I45J6K7L9','Gripe','x0h5pvXrZu','H4mYtAzXe1','2023-07-22 16:10:50.000000','4M56N7O8P9'),('4M56N7O8P1','Stress','Tc2Wqd1UnS','Kc2Nmw4Hz9','2023-07-20 15:10:50.000000','5Q67R8S9T1'),('5Q67R8S9T2','Dolor en la garganta','HsYtNm54rZ','H4mYtAzXe1','2023-07-12 14:10:50.000000','2E34F5G6H7'),('6U78V9W0X3','Contusión en la cabeza','7kSJ13bwK6','fEm5JKcZBz','2023-07-16 12:10:50.000000','3I45J6K7L8'),('7Y89Z0A1B4','Esguince de tobillo','YmVilwADcH','fEm5JKcZBz','2023-07-14 11:10:50.000000','4M56N7O8P9'),('8C0D1E2F35','Irritación en la córnea','GJ4PIaXNzl','o5t6xN0sJr','2023-07-10 10:10:50.000000','8C0D1E2F3G'),('9H2I3J4K56','Faringitis','HsYtNm54rZ','H4mYtAzXe1','2023-07-07 10:10:50.000000','2E34F5G6H7');
/*!40000 ALTER TABLE `historia_clinica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `nombre_paciente`
--

DROP TABLE IF EXISTS `nombre_paciente`;
/*!50001 DROP VIEW IF EXISTS `nombre_paciente`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `nombre_paciente` AS SELECT 
 1 AS `paciente_id`,
 1 AS `nombre_paciente`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `obra_social`
--

DROP TABLE IF EXISTS `obra_social`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `obra_social` (
  `obra_social_id` varchar(10) NOT NULL,
  `nombre_obra_social` tinytext NOT NULL,
  `abreviacion` tinytext NOT NULL,
  PRIMARY KEY (`obra_social_id`),
  UNIQUE KEY `obra_social_id_UNIQUE` (`obra_social_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `obra_social`
--

LOCK TABLES `obra_social` WRITE;
/*!40000 ALTER TABLE `obra_social` DISABLE KEYS */;
INSERT INTO `obra_social` VALUES ('8MzN7im5Pd','OMINT','OMINT'),('9bvq7mjLSo','PAMI','PAMI'),('N2GnK6IRJf','Swiss Medical','Swiss'),('QlYf4eExKr','OSDE','OSDE'),('U0tsnEecIk','Galeno','Galeno');
/*!40000 ALTER TABLE `obra_social` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pacientes`
--

DROP TABLE IF EXISTS `pacientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pacientes` (
  `paciente_id` varchar(10) NOT NULL,
  `nombre_paciente` varchar(50) NOT NULL,
  `mail` varchar(30) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `obra_social_id` varchar(10) NOT NULL,
  `edad` int NOT NULL,
  `plan_id` varchar(10) NOT NULL,
  PRIMARY KEY (`paciente_id`),
  UNIQUE KEY `paciente_id_UNIQUE` (`paciente_id`),
  KEY `obra_social_pac_id_idx` (`obra_social_id`),
  KEY `plan_pac_id_idx` (`plan_id`),
  CONSTRAINT `obra_social_pac_id` FOREIGN KEY (`obra_social_id`) REFERENCES `obra_social` (`obra_social_id`),
  CONSTRAINT `plan_pac_id` FOREIGN KEY (`plan_id`) REFERENCES `planes` (`plan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pacientes`
--

LOCK TABLES `pacientes` WRITE;
/*!40000 ALTER TABLE `pacientes` DISABLE KEYS */;
INSERT INTO `pacientes` VALUES ('2E34F5G6H7','María González','maria.gonzalez@gmail.com','1144218707','QlYf4eExKr',45,'JNBF8pXcLz'),('3I45J6K7L8','José Rodríguez','jose.rodriguez@outlook.com','1130208574','QlYf4eExKr',27,'4aInPf1G6U'),('4M56N7O8P9','Ana López','ana.lopez@yahoo.com','1196563221','QlYf4eExKr',53,'Np7T13SE4U'),('5Q67R8S9T1','Carlos Ramírez','carlos.ramirez@hotmail.com','1140398074','QlYf4eExKr',41,'JNBF8pXcLz'),('6U78V9W0X1','Laura Fernández','laura.fernandez@gmail.com','1190324474','U0tsnEecIk',38,'9CvzUjwmFG'),('7Y89Z0A1B2','Martín Vargas','martin.vargas@gmail.com','1123954703','U0tsnEecIk',29,'4aInPf1G6U'),('8C0D1E2F3G','Sofía Medina','sofia.medina@hotmail.com','1140098021','N2GnK6IRJf',50,'Np7T13SE4U'),('9feb230f38','Guido Palacios','guidop@gmail.com','1162998080','N2GnK6IRJf',33,'9CvzUjwmFG'),('9H2I3J4K5L','Alejandro Torres','alejandro.torres@yahoo.com','1139997494','9bvq7mjLSo',36,'JNBF8pXcLz'),('AA19IU002Q','Donato Romano','donaroma@gmail.com','1196123615','8MzN7im5Pd',51,'Np7T13SE4U');
/*!40000 ALTER TABLE `pacientes` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `replicar_ultimos_pacientes` AFTER INSERT ON `pacientes` FOR EACH ROW INSERT INTO `ultimos_pacientes` (ultimo_paciente_id, nombre_paciente, mail, telefono, edad) VALUES (NEW.paciente_id, NEW.nombre_paciente, NEW.mail, NEW.telefono, NEW.edad) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `planes`
--

DROP TABLE IF EXISTS `planes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `planes` (
  `plan_id` varchar(10) NOT NULL,
  `nombre_plan` tinytext NOT NULL,
  `nombre_alternativo` tinytext NOT NULL,
  PRIMARY KEY (`plan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `planes`
--

LOCK TABLES `planes` WRITE;
/*!40000 ALTER TABLE `planes` DISABLE KEYS */;
INSERT INTO `planes` VALUES ('4aInPf1G6U','Basico','100'),('9CvzUjwmFG','Estandar','200'),('JNBF8pXcLz','Avanzado','300'),('Np7T13SE4U','Full','400');
/*!40000 ALTER TABLE `planes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salas_atencion_por_turno`
--

DROP TABLE IF EXISTS `salas_atencion_por_turno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salas_atencion_por_turno` (
  `saxt_id` varchar(10) NOT NULL,
  `turno_id` varchar(10) NOT NULL,
  `sala_atencion_id` varchar(45) NOT NULL,
  PRIMARY KEY (`saxt_id`),
  KEY `turno_saxt_id_idx` (`turno_id`),
  KEY `sde_saxt_id_idx` (`sala_atencion_id`),
  CONSTRAINT `sde_saxt_id` FOREIGN KEY (`sala_atencion_id`) REFERENCES `salas_de_atencion` (`sala_atencion_id`),
  CONSTRAINT `turno_saxt_id` FOREIGN KEY (`turno_id`) REFERENCES `turno` (`turno_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salas_atencion_por_turno`
--

LOCK TABLES `salas_atencion_por_turno` WRITE;
/*!40000 ALTER TABLE `salas_atencion_por_turno` DISABLE KEYS */;
INSERT INTO `salas_atencion_por_turno` VALUES ('28458f4d71','9gmVLJcKFv','hLTVuXqr3e'),('3603c77867','G7hSWK9vuf','hLTVuXqr3e'),('639ca9e35f','eMh3d4Kf2J','43dGpIxChv'),('67e4e2158d','vDjHN26Knl','hLTVuXqr3e'),('bdf7c503ca','TFMQo48s6B','hLTVuXqr3e'),('ca8f69b48f','5CpU98bl4d','hLTVuXqr3e'),('d6ee1d6ffb','6ElgAaVRPH','hLTVuXqr3e'),('fac8801f7b','R3SX4ldwhm','hLTVuXqr3e');
/*!40000 ALTER TABLE `salas_atencion_por_turno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salas_de_atencion`
--

DROP TABLE IF EXISTS `salas_de_atencion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salas_de_atencion` (
  `sala_atencion_id` varchar(10) NOT NULL,
  `nombre_sala` tinytext NOT NULL,
  `ubicacion` varchar(2) NOT NULL,
  `elementos` text NOT NULL,
  `disponibilidad` tinyint(1) NOT NULL,
  PRIMARY KEY (`sala_atencion_id`),
  UNIQUE KEY `sala_atencion_id_UNIQUE` (`sala_atencion_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salas_de_atencion`
--

LOCK TABLES `salas_de_atencion` WRITE;
/*!40000 ALTER TABLE `salas_de_atencion` DISABLE KEYS */;
INSERT INTO `salas_de_atencion` VALUES ('0gUe3fqzDK','Recepción','PB','Impresora, notebooks, lapiceras',1),('1VTYwzHF7s','Laboratorio','1P','Jeringas, etiquetadoras, centrifugadoras',1),('43dGpIxChv','Cirugía','3P','Respiradores, camas, sueros',1),('hLTVuXqr3e','Consultorio','2P','Notebooks, lapiceras, estetoscopios',1);
/*!40000 ALTER TABLE `salas_de_atencion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salas_de_espera`
--

DROP TABLE IF EXISTS `salas_de_espera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salas_de_espera` (
  `sala_espera_id` varchar(10) NOT NULL,
  `nombre_sala` tinytext NOT NULL,
  `ubicacion` varchar(2) NOT NULL,
  `cantidad_sillas` int NOT NULL,
  `acceso_discapacitados` tinyint(1) NOT NULL,
  `disponibilidad` tinyint(1) NOT NULL,
  PRIMARY KEY (`sala_espera_id`),
  UNIQUE KEY `sala_espera_id_UNIQUE` (`sala_espera_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salas_de_espera`
--

LOCK TABLES `salas_de_espera` WRITE;
/*!40000 ALTER TABLE `salas_de_espera` DISABLE KEYS */;
INSERT INTO `salas_de_espera` VALUES ('A3bGk7H1pW','SE Recep','PB',40,1,1),('E4sYvZ0oN2','SE Cir','3P',15,1,1),('L6dPqF8zK1','SE Cons','2P',25,1,1),('X9rM2nV5cT','SE Lab','1P',25,1,1);
/*!40000 ALTER TABLE `salas_de_espera` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tratamientos`
--

DROP TABLE IF EXISTS `tratamientos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tratamientos` (
  `tratamiento_id` varchar(10) NOT NULL,
  `nombre_tratamiento` tinytext NOT NULL,
  `especialidad_id` varchar(10) NOT NULL,
  `costo` decimal(7,2) NOT NULL,
  PRIMARY KEY (`tratamiento_id`),
  UNIQUE KEY `tratamiento_id_UNIQUE` (`tratamiento_id`),
  KEY `especialidad_alc_id_idx` (`especialidad_id`),
  CONSTRAINT `especialidad_alc_id` FOREIGN KEY (`especialidad_id`) REFERENCES `especialidades` (`especialidad_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tratamientos`
--

LOCK TABLES `tratamientos` WRITE;
/*!40000 ALTER TABLE `tratamientos` DISABLE KEYS */;
INSERT INTO `tratamientos` VALUES ('7kSJ13bwK6','Paracetamol y antiinflamatorios','M5v3dtCkrH',2000.00),('8ZfYiUKc2T','Reliberan y suplementos dietéticos','xEtG2laUg7',3000.00),('GJ4PIaXNzl','Gotas descongestivas','y1q47NmzDh',1500.00),('HsYtNm54rZ','Cirugía de amigdalas','XnNvpEqtQr',50000.00),('nRvDc8Ha5L','Kinesiología','1NdlrGSQZj',20000.00),('Tc2Wqd1UnS','Diazepam','dK3RG1uIvc',2000.00),('x0h5pvXrZu','Amoxilina y spray salino','1qW9NmYfiM',2000.00),('YmVilwADcH','Diclofenac','1NdlrGSQZj',1500.00);
/*!40000 ALTER TABLE `tratamientos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tratamientos_por_paciente`
--

DROP TABLE IF EXISTS `tratamientos_por_paciente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tratamientos_por_paciente` (
  `txp_id` varchar(10) NOT NULL,
  `paciente_id` varchar(10) NOT NULL,
  `tratamiento_id` varchar(10) NOT NULL,
  `obra_social_id` varchar(10) NOT NULL,
  `plan_id` varchar(10) NOT NULL,
  `bonificacion` decimal(4,2) DEFAULT NULL,
  PRIMARY KEY (`txp_id`),
  KEY `paciente_txp_id_idx` (`paciente_id`),
  KEY `tratamiento_txp_id_idx` (`tratamiento_id`),
  KEY `os_txp_id_idx` (`obra_social_id`),
  KEY `plan_txp_id_idx` (`plan_id`),
  CONSTRAINT `os_txp_id` FOREIGN KEY (`obra_social_id`) REFERENCES `obra_social` (`obra_social_id`),
  CONSTRAINT `paciente_txp_id` FOREIGN KEY (`paciente_id`) REFERENCES `pacientes` (`paciente_id`),
  CONSTRAINT `plan_txp_id` FOREIGN KEY (`plan_id`) REFERENCES `planes` (`plan_id`),
  CONSTRAINT `tratamiento_txp_id` FOREIGN KEY (`tratamiento_id`) REFERENCES `tratamientos` (`tratamiento_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tratamientos_por_paciente`
--

LOCK TABLES `tratamientos_por_paciente` WRITE;
/*!40000 ALTER TABLE `tratamientos_por_paciente` DISABLE KEYS */;
INSERT INTO `tratamientos_por_paciente` VALUES ('9c7f9afa4b','2E34F5G6H7','GJ4PIaXNzl','QlYf4eExKr','JNBF8pXcLz',45.00),('9c7f9bf04b','3I45J6K7L8','nRvDc8Ha5L','QlYf4eExKr','4aInPf1G6U',15.00),('9c7f9c064b','4M56N7O8P9','Tc2Wqd1UnS','QlYf4eExKr','Np7T13SE4U',60.00),('9c7f9c1a4b','5Q67R8S9T1','x0h5pvXrZu','QlYf4eExKr','JNBF8pXcLz',45.00),('9c7f9c2b4b','6U78V9W0X1','YmVilwADcH','U0tsnEecIk','9CvzUjwmFG',30.00),('a25fe28dd6','6U78V9W0X1','YmVilwADcH','U0tsnEecIk','9CvzUjwmFG',30.00);
/*!40000 ALTER TABLE `tratamientos_por_paciente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `turno`
--

DROP TABLE IF EXISTS `turno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `turno` (
  `turno_id` varchar(10) NOT NULL,
  `fecha` datetime(6) NOT NULL,
  `horario` datetime(6) NOT NULL,
  `doctor_id` varchar(10) NOT NULL,
  `especialidad_id` varchar(10) NOT NULL,
  `paciente_id` varchar(10) NOT NULL,
  PRIMARY KEY (`turno_id`),
  UNIQUE KEY `turno_id_UNIQUE` (`turno_id`),
  KEY `doctor_tur_id_idx` (`doctor_id`),
  KEY `especialidad_tur_id_idx` (`especialidad_id`),
  KEY `paciente_tur_id_idx` (`paciente_id`),
  CONSTRAINT `doctor_tur_id` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`doctor_id`),
  CONSTRAINT `especialidad_tur_id` FOREIGN KEY (`especialidad_id`) REFERENCES `especialidades` (`especialidad_id`),
  CONSTRAINT `paciente_tur_id` FOREIGN KEY (`paciente_id`) REFERENCES `pacientes` (`paciente_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `turno`
--

LOCK TABLES `turno` WRITE;
/*!40000 ALTER TABLE `turno` DISABLE KEYS */;
INSERT INTO `turno` VALUES ('5CpU98bl4d','2023-09-07 17:38:14.000000','2023-08-10 07:01:34.000000','fEm5JKcZBz','1NdlrGSQZj','2E34F5G6H7'),('6ElgAaVRPH','2023-05-26 01:34:50.000000','2023-07-13 16:59:03.000000','H4mYtAzXe1','1qW9NmYfiM','3I45J6K7L8'),('9gmVLJcKFv','2023-03-20 07:23:04.000000','2023-07-31 17:16:50.000000','Kc2Nmw4Hz9','dK3RG1uIvc','4M56N7O8P9'),('eMh3d4Kf2J','2023-02-25 14:59:11.000000','2023-06-16 10:39:27.000000','ksj5dbziE2','M5v3dtCkrH','5Q67R8S9T1'),('G7hSWK9vuf','2023-03-04 15:45:25.000000','2023-08-20 19:54:48.000000','LuN1Inm7Tl','S0U1oCHc3Z','6U78V9W0X1'),('R3SX4ldwhm','2023-06-19 06:17:22.000000','2023-05-10 02:49:43.000000','M43eTnNbDo','xEtG2laUg7','7Y89Z0A1B2'),('TFMQo48s6B','2023-09-24 18:41:37.000000','2023-02-05 10:25:59.000000','nYTjhbIDcf','XnNvpEqtQr','8C0D1E2F3G'),('vDjHN26Knl','2023-12-29 19:50:02.000000','2023-09-15 07:36:31.000000','o5t6xN0sJr','y1q47NmzDh','9feb230f38');
/*!40000 ALTER TABLE `turno` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `ValidarHorarioTurno` BEFORE INSERT ON `turno` FOR EACH ROW BEGIN
    IF NEW.horario < '09:00:00' OR NEW.horario > '19:00:00' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El horario del turno está fuera de la franja de atención';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `ultimos_pacientes`
--

DROP TABLE IF EXISTS `ultimos_pacientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ultimos_pacientes` (
  `ultimo_paciente_id` varchar(10) NOT NULL,
  `nombre_paciente` varchar(50) NOT NULL,
  `mail` varchar(30) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `obra_social_id` varchar(10) NOT NULL,
  `edad` int NOT NULL,
  PRIMARY KEY (`ultimo_paciente_id`),
  UNIQUE KEY `ultimo_paciente_id_UNIQUE` (`ultimo_paciente_id`),
  KEY `obra_social_pac_id_idx` (`obra_social_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ultimos_pacientes`
--

LOCK TABLES `ultimos_pacientes` WRITE;
/*!40000 ALTER TABLE `ultimos_pacientes` DISABLE KEYS */;
INSERT INTO `ultimos_pacientes` VALUES ('9feb230f38','Guido Palacios','guidop@gmail.com','1162998080','N2GnK6IRJf',33),('9H2I3J4K5L','Alejandro Torres','alejandro.torres@yahoo.com','1139997494','9bvq7mjLSo',36),('AA19IU002Q','Donato Romano','donaroma@gmail.com','1196123615','8MzN7im5Pd',51);
/*!40000 ALTER TABLE `ultimos_pacientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vista_doctores_por_especialidad`
--

DROP TABLE IF EXISTS `vista_doctores_por_especialidad`;
/*!50001 DROP VIEW IF EXISTS `vista_doctores_por_especialidad`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_doctores_por_especialidad` AS SELECT 
 1 AS `nombre_doctor`,
 1 AS `especialidad_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_nombre_doctor_por_cv`
--

DROP TABLE IF EXISTS `vista_nombre_doctor_por_cv`;
/*!50001 DROP VIEW IF EXISTS `vista_nombre_doctor_por_cv`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_nombre_doctor_por_cv` AS SELECT 
 1 AS `consulta_virtual_id`,
 1 AS `nombre_doctor`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_nombre_doctor_por_historia`
--

DROP TABLE IF EXISTS `vista_nombre_doctor_por_historia`;
/*!50001 DROP VIEW IF EXISTS `vista_nombre_doctor_por_historia`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_nombre_doctor_por_historia` AS SELECT 
 1 AS `historia_id`,
 1 AS `nombre_doctor`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_nombre_doctor_por_turno`
--

DROP TABLE IF EXISTS `vista_nombre_doctor_por_turno`;
/*!50001 DROP VIEW IF EXISTS `vista_nombre_doctor_por_turno`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_nombre_doctor_por_turno` AS SELECT 
 1 AS `turno_id`,
 1 AS `nombre_doctor`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_nombre_paciente_por_cv`
--

DROP TABLE IF EXISTS `vista_nombre_paciente_por_cv`;
/*!50001 DROP VIEW IF EXISTS `vista_nombre_paciente_por_cv`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_nombre_paciente_por_cv` AS SELECT 
 1 AS `consulta_virtual_id`,
 1 AS `nombre_paciente`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_nombre_paciente_por_historia`
--

DROP TABLE IF EXISTS `vista_nombre_paciente_por_historia`;
/*!50001 DROP VIEW IF EXISTS `vista_nombre_paciente_por_historia`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_nombre_paciente_por_historia` AS SELECT 
 1 AS `historia_id`,
 1 AS `nombre_paciente`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_nombre_paciente_por_turno`
--

DROP TABLE IF EXISTS `vista_nombre_paciente_por_turno`;
/*!50001 DROP VIEW IF EXISTS `vista_nombre_paciente_por_turno`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_nombre_paciente_por_turno` AS SELECT 
 1 AS `turno_id`,
 1 AS `nombre_paciente`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_pacientes_por_obra_social`
--

DROP TABLE IF EXISTS `vista_pacientes_por_obra_social`;
/*!50001 DROP VIEW IF EXISTS `vista_pacientes_por_obra_social`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_pacientes_por_obra_social` AS SELECT 
 1 AS `nombre_paciente`,
 1 AS `obra_social_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_tratamientos_por_paciente_id`
--

DROP TABLE IF EXISTS `vista_tratamientos_por_paciente_id`;
/*!50001 DROP VIEW IF EXISTS `vista_tratamientos_por_paciente_id`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_tratamientos_por_paciente_id` AS SELECT 
 1 AS `paciente_id`,
 1 AS `nombre_paciente`,
 1 AS `nombre_tratamiento`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'consultorio'
--

--
-- Dumping routines for database 'consultorio'
--
/*!50003 DROP FUNCTION IF EXISTS `calcular_bonificacion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `calcular_bonificacion`(plan_id VARCHAR(10)) RETURNS decimal(4,2)
    DETERMINISTIC
BEGIN
    DECLARE bonificacion DECIMAL(4,2);
    
    -- Asignamos la bonificación según el plan_id
    CASE plan_id
        WHEN '4aInPf1G6U' THEN -- Basico
            SET bonificacion = 15.00;
        WHEN '9CvzUjwmFG' THEN -- Estandar
            SET bonificacion = 30.00;
        WHEN 'JNBF8pXcLz' THEN -- Avanzado
            SET bonificacion = 45.00;
        WHEN 'Np7T13SE4U' THEN -- Full
            SET bonificacion = 60.00;
        ELSE
            SET bonificacion = 0.00; -- Valor predeterminado en caso de que el plan_id no coincida con los anteriores
    END CASE;
    
    RETURN bonificacion;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `calcular_costo_final` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `calcular_costo_final`(
    costo DECIMAL(6,2),
    bonificacion DECIMAL(4,2)
) RETURNS decimal(10,2)
    DETERMINISTIC
BEGIN
    DECLARE costo_final DECIMAL(10,2);

    -- Multiplicamos el costo por la bonificación (dividida por 100)
    SET costo_final = costo * (bonificacion / 100.00);

    RETURN costo_final;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `obtener_sala_ubicacion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `obtener_sala_ubicacion`(sala_atencion_id_var VARCHAR(10)) RETURNS tinytext CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    DECLARE nombre_sala_var TINYTEXT;
    DECLARE ubicacion_var VARCHAR(2);
    DECLARE sala_ubicacion TINYTEXT;
    
    SELECT nombre_sala, ubicacion INTO nombre_sala_var, ubicacion_var FROM salas_de_atencion WHERE sala_atencion_id = sala_atencion_id_var;
    
    SET sala_ubicacion = CONCAT(nombre_sala_var, ' ', ubicacion_var);
    
    RETURN sala_ubicacion;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertarCv` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarCv`(
		/* Defino variables de mi tabla "consulta_virtual" */
    IN horario DATETIME(6),
    IN doctor_id VARCHAR(10),
    IN especialidad_id VARCHAR(10),
    IN paciente_id VARCHAR(10)
)
BEGIN
    DECLARE v_cv_id VARCHAR(10);
	DECLARE v_obra_social_doctor VARCHAR(10);
    DECLARE v_obra_social_paciente VARCHAR(10);
    
    SET v_cv_id = SUBSTRING(MD5(RAND()), 1, 10); -- Genero codigo alfanumerico VARCHAR(10)


/* Obtengo la obra social del doctor */
    SELECT obra_social_id INTO v_obra_social_doctor
    FROM doctor
    WHERE doctor_id = doctor_id;

/* Obtengo la obra social del paciente */
    SELECT obra_social_id INTO v_obra_social_paciente
    FROM pacientes
    WHERE paciente_id = paciente_id;

/* Verifico si las obras sociales coinciden */
    IF v_obra_social_doctor <> v_obra_social_paciente THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El doctor no atiende esa obra social';


/* Verifico si el horario ya existe para el mismo doctor_id en alguna consulta virtual o turno */
    IF EXISTS (
        SELECT 1 FROM consulta_virtual
        WHERE doctor_id = doctor_id AND horario = horario
    ) OR EXISTS (
        SELECT 1 FROM turno
        WHERE doctor_id = doctor_id AND horario = horario
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El horario ya está ocupado para el mismo doctor en alguna consulta virtual o turno';
        
/* Verifico si el horario ya existe para el mismo paciente_id en alguna consulta virtual o turno */
    ELSEIF EXISTS (
        SELECT 1 FROM consulta_virtual
        WHERE paciente_id = paciente_id AND horario = horario
    ) OR EXISTS (
        SELECT 1 FROM turno
        WHERE paciente_id = paciente_id AND horario = horario
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El horario ya está ocupado para el mismo paciente en alguna consulta virtual o turno';
    ELSE


	/* Procedo al INSERT */
		INSERT INTO consulta_virtual (cv_id, horario, doctor_id, especialidad_id, paciente_id)
		VALUES (v_cv_id, horario, doctor_id, especialidad_id, paciente_id);
    END IF;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertarDoctor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarDoctor`(
    IN nombre_doctor VARCHAR(50),
    IN telefono VARCHAR(20),
	IN especialidad_id VARCHAR(10),
    IN obra_social_id VARCHAR(10)
)
BEGIN
    DECLARE v_doctor_id VARCHAR(10);
    SET v_doctor_id = SUBSTRING(MD5(RAND()), 1, 10); -- Generar código alfanumérico de 10 dígitos

    INSERT INTO doctor (doctor_id, nombre_doctor, telefono, especialidad_id, obra_social_id)
    VALUES (v_doctor_id, nombre_doctor, telefono, especialidad_id, obra_social_id);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertarEmpleado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarEmpleado`(
    IN nombre_empleado VARCHAR(50),
    IN mail VARCHAR(50),
    IN edad INT,
    IN puesto VARCHAR(50)
)
BEGIN
    DECLARE v_empleado_id VARCHAR(10);
    DECLARE v_legajo_id INT;
    
    SET v_empleado_id = SUBSTRING(MD5(RAND()), 1, 10); -- Generar código alfanumérico de 10 dígitos
    
    SELECT IFNULL(MAX(legajo), 0) + 1 INTO v_legajo_id FROM empleados;  -- Obtener el siguiente valor de legajo autoincremental, o bien empieza por 1.

    INSERT INTO empleados (empleado_id, nombre_empleado, legajo, mail, edad, puesto)
    VALUES (v_empleado_id, nombre_empleado, v_legajo_id, mail, edad, puesto);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertarHc` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarHc`(
		/* Defino variables de mi tabla "historia_clinica" */
    IN patologia TINYTEXT,
    IN tratamiento_id VARCHAR(10),
    IN doctor_id VARCHAR(10),
    IN fecha DATETIME(6),
    IN paciente_id VARCHAR(10)
)
BEGIN
    DECLARE v_hc_id VARCHAR(10);
    SET v_hc_id = SUBSTRING(MD5(RAND()), 1, 10); -- Genero codigo alfanumerico VARCHAR(10)

		/* Procedo al INSERT */
    INSERT INTO historia_clinica (patologia, tratamiento_id, doctor_id, fecha, paciente_id)
    VALUES (v_hc_id, patologia, tratamiento_id, doctor_id, fecha, paciente_id);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertarPaciente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarPaciente`(
    IN nombre_paciente VARCHAR(50),
    IN mail VARCHAR(30),
    IN telefono VARCHAR(20),
    IN obra_social_id VARCHAR(10),
    IN edad INT
)
BEGIN
    DECLARE v_paciente_id VARCHAR(10);
    SET v_paciente_id = SUBSTRING(MD5(RAND()), 1, 10); -- Generar código alfanumérico de 10 dígitos

    INSERT INTO pacientes (paciente_id, nombre_paciente, mail, telefono, obra_social_id, edad)
    VALUES (v_paciente_id, nombre_paciente, mail, telefono, obra_social_id, edad);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertarSaxt` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarSaxt`(
    IN turno_id VARCHAR(10),
    IN sala_atencion_id VARCHAR(10)
)
BEGIN
    DECLARE v_saxt_id VARCHAR(10);
    
    SET v_saxt_id = SUBSTRING(MD5(RAND()), 1, 10); -- Genero codigo alfanumerico VARCHAR(10)
    
    -- Realiza el INSERT en la tabla
    INSERT INTO salas_atencion_por_turno (saxt_id, turno_id, sala_atencion_id)
    VALUES (v_saxt_id, turno_id, sala_atencion_id);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertarTurno` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarTurno`(
		/* Defino variables de mi tabla "turno" */
    IN fecha DATETIME(6),
    IN horario DATETIME(6),
    IN doctor_id VARCHAR(10),
    IN especialidad_id VARCHAR(10),
    IN paciente_id VARCHAR(10)
)
BEGIN
    DECLARE v_turno_id VARCHAR(10);
	DECLARE v_obra_social_doctor VARCHAR(10);
    DECLARE v_obra_social_paciente VARCHAR(10);
    
    SET v_turno_id = SUBSTRING(MD5(RAND()), 1, 10); -- Genero codigo alfanumerico VARCHAR(10)

/* Obtengo la obra social del doctor */
    SELECT obra_social_id INTO v_obra_social_doctor
    FROM doctor
    WHERE doctor_id = doctor_id;

/* Obtengo la obra social del paciente */
    SELECT obra_social_id INTO v_obra_social_paciente
    FROM pacientes
    WHERE paciente_id = paciente_id;

/* Verifico si las obras sociales coinciden */
    IF v_obra_social_doctor <> v_obra_social_paciente THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El doctor no atiende esa obra social';

/* Verifico si el horario ya existe para el mismo doctor_id en alguna consulta virtual o turno */
    IF EXISTS (
        SELECT 1 FROM consulta_virtual
        WHERE doctor_id = doctor_id AND horario = horario
    ) OR EXISTS (
        SELECT 1 FROM turno
        WHERE doctor_id = doctor_id AND horario = horario
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El horario ya está ocupado para el mismo doctor en alguna consulta virtual o turno';
        
/* Verifico si el horario ya existe para el mismo paciente_id en alguna consulta virtual o turno */
    ELSEIF EXISTS (
        SELECT 1 FROM consulta_virtual
        WHERE paciente_id = paciente_id AND horario = horario
    ) OR EXISTS (
        SELECT 1 FROM turno
        WHERE paciente_id = paciente_id AND horario = horario
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El horario ya está ocupado para el mismo paciente en alguna consulta virtual o turno';
    ELSE
    
		/* Procedo al INSERT si está todo bien */
		INSERT INTO turno (turno_id, fecha, horario, doctor_id, especialidad_id, paciente_id)
		VALUES (v_turno_id, fecha, horario, doctor_id, especialidad_id, paciente_id);
	END IF;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertarTxp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarTxp`(
    IN paciente_id VARCHAR(10),
    IN tratamiento_id VARCHAR(10),
    IN obra_social_id VARCHAR(10),
    IN plan_id VARCHAR(10)
)
BEGIN
    DECLARE v_txp_id VARCHAR(10);
    DECLARE v_bonificacion DECIMAL(4,2);
    
    SET v_txp_id = SUBSTRING(MD5(RAND()), 1, 10); -- Genero codigo alfanumerico VARCHAR(10)
    
    -- Llama a la función de bonificación para calcularla
    SET v_bonificacion = calcular_bonificacion(plan_id);
    
    -- Realiza el INSERT en la tabla
    INSERT INTO tratamientos_por_paciente (paciente_id, tratamiento_id, obra_social_id, plan_id, bonificacion)
    VALUES (v_txp_id, paciente_id, tratamiento_id, obra_social_id, plan_id, v_bonificacion);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `OrdenarDatos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `OrdenarDatos`(
    IN tabla_sel VARCHAR(255),
    IN columna_sel VARCHAR(255),
    IN orden VARCHAR(10)
)
BEGIN
    SET @sql = CONCAT('SELECT * FROM ', tabla_sel, ' ORDER BY ', columna_sel, ' ', orden);
    PREPARE stmt FROM @sql;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `nombre_paciente`
--

/*!50001 DROP VIEW IF EXISTS `nombre_paciente`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `nombre_paciente` AS select `pacientes`.`paciente_id` AS `paciente_id`,`pacientes`.`nombre_paciente` AS `nombre_paciente` from `pacientes` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_doctores_por_especialidad`
--

/*!50001 DROP VIEW IF EXISTS `vista_doctores_por_especialidad`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_doctores_por_especialidad` AS select `d`.`nombre_doctor` AS `nombre_doctor`,`e`.`especialidad_id` AS `especialidad_id` from (`doctor` `d` join `especialidades` `e` on((`d`.`especialidad_id` = `e`.`especialidad_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_nombre_doctor_por_cv`
--

/*!50001 DROP VIEW IF EXISTS `vista_nombre_doctor_por_cv`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_nombre_doctor_por_cv` AS select `cv`.`consulta_virtual_id` AS `consulta_virtual_id`,`d`.`nombre_doctor` AS `nombre_doctor` from (`consulta_virtual` `cv` join `doctor` `d` on((`cv`.`doctor_id` = `d`.`doctor_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_nombre_doctor_por_historia`
--

/*!50001 DROP VIEW IF EXISTS `vista_nombre_doctor_por_historia`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_nombre_doctor_por_historia` AS select `hc`.`historia_id` AS `historia_id`,`d`.`nombre_doctor` AS `nombre_doctor` from (`historia_clinica` `hc` join `doctor` `d` on((`hc`.`doctor_id` = `d`.`doctor_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_nombre_doctor_por_turno`
--

/*!50001 DROP VIEW IF EXISTS `vista_nombre_doctor_por_turno`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_nombre_doctor_por_turno` AS select `tur`.`turno_id` AS `turno_id`,`d`.`nombre_doctor` AS `nombre_doctor` from (`turno` `tur` join `doctor` `d` on((`tur`.`doctor_id` = `d`.`doctor_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_nombre_paciente_por_cv`
--

/*!50001 DROP VIEW IF EXISTS `vista_nombre_paciente_por_cv`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_nombre_paciente_por_cv` AS select `cv`.`consulta_virtual_id` AS `consulta_virtual_id`,`p`.`nombre_paciente` AS `nombre_paciente` from (`consulta_virtual` `cv` join `pacientes` `p` on((`cv`.`paciente_id` = `p`.`paciente_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_nombre_paciente_por_historia`
--

/*!50001 DROP VIEW IF EXISTS `vista_nombre_paciente_por_historia`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_nombre_paciente_por_historia` AS select `hc`.`historia_id` AS `historia_id`,`p`.`nombre_paciente` AS `nombre_paciente` from (`historia_clinica` `hc` join `pacientes` `p` on((`hc`.`paciente_id` = `p`.`paciente_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_nombre_paciente_por_turno`
--

/*!50001 DROP VIEW IF EXISTS `vista_nombre_paciente_por_turno`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_nombre_paciente_por_turno` AS select `tur`.`turno_id` AS `turno_id`,`p`.`nombre_paciente` AS `nombre_paciente` from (`turno` `tur` join `pacientes` `p` on((`tur`.`paciente_id` = `p`.`paciente_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_pacientes_por_obra_social`
--

/*!50001 DROP VIEW IF EXISTS `vista_pacientes_por_obra_social`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_pacientes_por_obra_social` AS select `p`.`nombre_paciente` AS `nombre_paciente`,`os`.`obra_social_id` AS `obra_social_id` from (`pacientes` `p` join `obra_social` `os` on((`p`.`obra_social_id` = `os`.`obra_social_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_tratamientos_por_paciente_id`
--

/*!50001 DROP VIEW IF EXISTS `vista_tratamientos_por_paciente_id`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_tratamientos_por_paciente_id` AS select `p`.`paciente_id` AS `paciente_id`,`p`.`nombre_paciente` AS `nombre_paciente`,`t`.`nombre_tratamiento` AS `nombre_tratamiento` from ((`pacientes` `p` join `tratamientos_por_paciente` `tpp` on((`p`.`paciente_id` = `tpp`.`paciente_id`))) join `tratamientos` `t` on((`tpp`.`tratamiento_id` = `t`.`tratamiento_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;


