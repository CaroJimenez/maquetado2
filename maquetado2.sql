-- MySQL dump 10.13  Distrib 8.0.29, for macos12 (x86_64)
--
-- Host: localhost    Database: maquetado2
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `administrador`
--

DROP TABLE IF EXISTS `administrador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `administrador` (
  `id` int NOT NULL,
  `correo` varchar(45) DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `apellido1` varchar(45) DEFAULT NULL,
  `apellido2` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `correo_UNIQUE` (`correo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrador`
--

LOCK TABLES `administrador` WRITE;
/*!40000 ALTER TABLE `administrador` DISABLE KEYS */;
INSERT INTO `administrador` VALUES (1,'mike@utez.edu.mx','Mike','Moreno','Velazquez');
/*!40000 ALTER TABLE `administrador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `anio`
--

DROP TABLE IF EXISTS `anio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `anio` (
  `id` int NOT NULL,
  `nombre` varchar(4) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `anio`
--

LOCK TABLES `anio` WRITE;
/*!40000 ALTER TABLE `anio` DISABLE KEYS */;
INSERT INTO `anio` VALUES (1,'2022');
/*!40000 ALTER TABLE `anio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuatrimestre`
--

DROP TABLE IF EXISTS `cuatrimestre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cuatrimestre` (
  `id` int NOT NULL,
  `nombre` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuatrimestre`
--

LOCK TABLES `cuatrimestre` WRITE;
/*!40000 ALTER TABLE `cuatrimestre` DISABLE KEYS */;
INSERT INTO `cuatrimestre` VALUES (1,'Mayo-Agosto');
/*!40000 ALTER TABLE `cuatrimestre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `divisionAcademica`
--

DROP TABLE IF EXISTS `divisionAcademica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `divisionAcademica` (
  `id` int NOT NULL,
  `nombre` varchar(5) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_divisionAcademica_nombre` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `divisionAcademica`
--

LOCK TABLES `divisionAcademica` WRITE;
/*!40000 ALTER TABLE `divisionAcademica` DISABLE KEYS */;
INSERT INTO `divisionAcademica` VALUES (1,'DATIC');
/*!40000 ALTER TABLE `divisionAcademica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estudiante`
--

DROP TABLE IF EXISTS `estudiante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estudiante` (
  `matricula` varchar(15) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `apellido1` varchar(30) DEFAULT NULL,
  `apellido2` varchar(30) DEFAULT NULL,
  `correo` varchar(50) DEFAULT NULL,
  `fechaNacimiento` datetime DEFAULT NULL,
  `curp` varchar(19) DEFAULT NULL,
  `contrasenia` varchar(30) DEFAULT NULL,
  `idDivisionAcademica` int DEFAULT NULL,
  `idAdminEst` int DEFAULT NULL,
  `idTaller1` int DEFAULT NULL,
  `idTaller2` int DEFAULT NULL,
  `idTaller3` int DEFAULT NULL,
  PRIMARY KEY (`matricula`),
  UNIQUE KEY `curp_UNIQUE` (`curp`),
  UNIQUE KEY `correo_UNIQUE` (`correo`),
  KEY `fk_estudiante_divisionacademica` (`idDivisionAcademica`),
  KEY `fk_estudiante_administrador` (`idAdminEst`),
  CONSTRAINT `fk_estudiante_administrador` FOREIGN KEY (`idAdminEst`) REFERENCES `administrador` (`id`),
  CONSTRAINT `fk_estudiante_divisionacademica` FOREIGN KEY (`idDivisionAcademica`) REFERENCES `divisionAcademica` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estudiante`
--

LOCK TABLES `estudiante` WRITE;
/*!40000 ALTER TABLE `estudiante` DISABLE KEYS */;
INSERT INTO `estudiante` VALUES ('20213tn053','Michelle Carolina Isabel','Corcino','Jiménez','20213tn053@utez.edu.mx',NULL,'COJM031009MMSRMCA5','uno2345',1,1,123,NULL,NULL);
/*!40000 ALTER TABLE `estudiante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instructor`
--

DROP TABLE IF EXISTS `instructor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `instructor` (
  `idinstructor` int NOT NULL,
  `correo` varchar(50) DEFAULT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `apellido1` varchar(30) DEFAULT NULL,
  `apellido2` varchar(30) DEFAULT NULL,
  `curp` varchar(19) DEFAULT NULL,
  `fechaNac` datetime DEFAULT NULL,
  `contrasenia` varchar(30) DEFAULT NULL,
  `idAdminInst` int NOT NULL,
  PRIMARY KEY (`idinstructor`),
  UNIQUE KEY `curp_UNIQUE` (`curp`),
  UNIQUE KEY `correo_UNIQUE` (`correo`),
  KEY `fk_instructor_administrador` (`idAdminInst`),
  CONSTRAINT `fk_instructor_administrador` FOREIGN KEY (`idAdminInst`) REFERENCES `administrador` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instructor`
--

LOCK TABLES `instructor` WRITE;
/*!40000 ALTER TABLE `instructor` DISABLE KEYS */;
INSERT INTO `instructor` VALUES (54321,'galindo@utez.edu.mx','Ernesto','Galindo',NULL,NULL,NULL,'galindo',1);
/*!40000 ALTER TABLE `instructor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lugar`
--

DROP TABLE IF EXISTS `lugar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lugar` (
  `id` int NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `claveAdminLugar` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_lugar_administrador` (`claveAdminLugar`),
  CONSTRAINT `fk_lugar_administrador` FOREIGN KEY (`claveAdminLugar`) REFERENCES `administrador` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lugar`
--

LOCK TABLES `lugar` WRITE;
/*!40000 ALTER TABLE `lugar` DISABLE KEYS */;
INSERT INTO `lugar` VALUES (1,'Auditorio',1);
/*!40000 ALTER TABLE `lugar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lugarTaller`
--

DROP TABLE IF EXISTS `lugarTaller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lugarTaller` (
  `idTaller` int NOT NULL,
  `idLugar` int NOT NULL,
  `horario` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idTaller`,`idLugar`),
  CONSTRAINT `fk_lugarTaller_lugar` FOREIGN KEY (`idTaller`) REFERENCES `lugar` (`id`),
  CONSTRAINT `fk_lugarTaller_taller` FOREIGN KEY (`idTaller`) REFERENCES `taller` (`idTaller`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lugarTaller`
--

LOCK TABLES `lugarTaller` WRITE;
/*!40000 ALTER TABLE `lugarTaller` DISABLE KEYS */;
INSERT INTO `lugarTaller` VALUES (1,1,'12:00am','Activo');
/*!40000 ALTER TABLE `lugarTaller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taller`
--

DROP TABLE IF EXISTS `taller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taller` (
  `idTaller` int NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `tipoTaller` varchar(45) NOT NULL,
  `periodoInscripcion` datetime DEFAULT NULL,
  `periodoLiberacion` datetime DEFAULT NULL,
  `idCuatri` int DEFAULT NULL,
  `idAnio` int DEFAULT NULL,
  `idInstructor` int DEFAULT NULL,
  PRIMARY KEY (`idTaller`),
  KEY `fk_taller_anio` (`idAnio`),
  KEY `fk_taller_cuatri` (`idCuatri`),
  KEY `fk_taller_instructor` (`idInstructor`),
  CONSTRAINT `fk_taller_anio` FOREIGN KEY (`idAnio`) REFERENCES `anio` (`id`),
  CONSTRAINT `fk_taller_cuatri` FOREIGN KEY (`idCuatri`) REFERENCES `cuatrimestre` (`id`),
  CONSTRAINT `fk_taller_instructor` FOREIGN KEY (`idInstructor`) REFERENCES `instructor` (`idinstructor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taller`
--

LOCK TABLES `taller` WRITE;
/*!40000 ALTER TABLE `taller` DISABLE KEYS */;
INSERT INTO `taller` VALUES (1,'Canto','Cultural','2022-05-15 00:00:00','2022-08-15 00:00:00',1,1,54321);
/*!40000 ALTER TABLE `taller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vistaestudiantesinscritos`
--

DROP TABLE IF EXISTS `vistaestudiantesinscritos`;
/*!50001 DROP VIEW IF EXISTS `vistaestudiantesinscritos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vistaestudiantesinscritos` AS SELECT 
 1 AS `matricula`,
 1 AS `nombre`,
 1 AS `apellido1`,
 1 AS `apellido2`,
 1 AS `correo`,
 1 AS `fechaNacimiento`,
 1 AS `curp`,
 1 AS `contrasenia`,
 1 AS `idDivisionAcademica`,
 1 AS `idAdminEst`,
 1 AS `idTaller1`,
 1 AS `idTaller2`,
 1 AS `idTaller3`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vistaestudiantesinscritos`
--

/*!50001 DROP VIEW IF EXISTS `vistaestudiantesinscritos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vistaestudiantesinscritos` AS select `estudiante`.`matricula` AS `matricula`,`estudiante`.`nombre` AS `nombre`,`estudiante`.`apellido1` AS `apellido1`,`estudiante`.`apellido2` AS `apellido2`,`estudiante`.`correo` AS `correo`,`estudiante`.`fechaNacimiento` AS `fechaNacimiento`,`estudiante`.`curp` AS `curp`,`estudiante`.`contrasenia` AS `contrasenia`,`estudiante`.`idDivisionAcademica` AS `idDivisionAcademica`,`estudiante`.`idAdminEst` AS `idAdminEst`,`estudiante`.`idTaller1` AS `idTaller1`,`estudiante`.`idTaller2` AS `idTaller2`,`estudiante`.`idTaller3` AS `idTaller3` from `estudiante` where (`estudiante`.`idTaller1` = 123) */;
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

-- Dump completed on 2022-07-31 15:42:32
