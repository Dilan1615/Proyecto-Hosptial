/*!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.6.18-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: Hospital
-- ------------------------------------------------------
-- Server version	10.6.18-MariaDB-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Cita`
--

DROP TABLE IF EXISTS `Cita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cita` (
  `idCita` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `motivo` text NOT NULL,
  `hora` time NOT NULL,
  `idPaciente` int(11) DEFAULT NULL,
  `idSala` int(11) DEFAULT NULL,
  PRIMARY KEY (`idCita`),
  KEY `idPaciente` (`idPaciente`),
  KEY `idSala` (`idSala`),
  CONSTRAINT `Cita_ibfk_1` FOREIGN KEY (`idPaciente`) REFERENCES `Paciente` (`idPaciente`),
  CONSTRAINT `Cita_ibfk_2` FOREIGN KEY (`idSala`) REFERENCES `Sala` (`idSala`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cita`
--

LOCK TABLES `Cita` WRITE;
/*!40000 ALTER TABLE `Cita` DISABLE KEYS */;
INSERT INTO `Cita` VALUES (1,'2024-02-10','Consulta general','10:30:00',1,1),(2,'2024-02-11','Chequeo de rutina','14:00:00',2,2),(3,'2024-02-12','Control pediátrico','09:00:00',3,3),(4,'2024-02-13','Revisión postoperatoria','16:00:00',4,4),(5,'2024-02-14','Examen de laboratorio','11:00:00',5,5),(6,'2025-05-15','Consulta de emergencia','10:00:00',1,1),(7,'2025-08-20','Revisión médica','11:00:00',2,3),(8,'2025-12-10','Chequeo general','09:00:00',3,3);
/*!40000 ALTER TABLE `Cita` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Enfermero`
--

DROP TABLE IF EXISTS `Enfermero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Enfermero` (
  `idEnfermero` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  `apellido` varchar(30) NOT NULL,
  `turno` varchar(20) DEFAULT NULL,
  `idSala` int(11) DEFAULT NULL,
  PRIMARY KEY (`idEnfermero`),
  KEY `idSala` (`idSala`),
  CONSTRAINT `Enfermero_ibfk_1` FOREIGN KEY (`idSala`) REFERENCES `Sala` (`idSala`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Enfermero`
--

LOCK TABLES `Enfermero` WRITE;
/*!40000 ALTER TABLE `Enfermero` DISABLE KEYS */;
INSERT INTO `Enfermero` VALUES (1,'Luis','Fernandez','Nocturno',1),(2,'Sofia','Ramirez','Diurno',2),(3,'Marcos','Vega','Nocturno',3),(4,'Laura','Gonzalez','Diurno',4),(5,'Ricardo2','Ortega','Nocturno',5),(6,'Luisa','Gonzales','Vespertino',2);
/*!40000 ALTER TABLE `Enfermero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Factura`
--

DROP TABLE IF EXISTS `Factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Factura` (
  `idFactura` int(11) NOT NULL AUTO_INCREMENT,
  `monto` decimal(10,0) NOT NULL,
  `fecha` date NOT NULL,
  `estado` varchar(20) DEFAULT NULL,
  `idCita` int(11) DEFAULT NULL,
  PRIMARY KEY (`idFactura`),
  KEY `idCita` (`idCita`),
  CONSTRAINT `Factura_ibfk_1` FOREIGN KEY (`idCita`) REFERENCES `Cita` (`idCita`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Factura`
--

LOCK TABLES `Factura` WRITE;
/*!40000 ALTER TABLE `Factura` DISABLE KEYS */;
/*!40000 ALTER TABLE `Factura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HistorialMedico`
--

DROP TABLE IF EXISTS `HistorialMedico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `HistorialMedico` (
  `idHistorial` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date DEFAULT NULL,
  `diagnostico` text NOT NULL,
  `observaciones` text NOT NULL,
  `idPaciente` int(11) DEFAULT NULL,
  PRIMARY KEY (`idHistorial`),
  KEY `idPaciente` (`idPaciente`),
  CONSTRAINT `HistorialMedico_ibfk_1` FOREIGN KEY (`idPaciente`) REFERENCES `Paciente` (`idPaciente`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HistorialMedico`
--

LOCK TABLES `HistorialMedico` WRITE;
/*!40000 ALTER TABLE `HistorialMedico` DISABLE KEYS */;
INSERT INTO `HistorialMedico` VALUES (1,'2024-01-15','Hipertensión','Requiere control periódico',1),(2,'2024-01-20','Alergia estacional','Uso de antihistamínicos',2),(3,'2024-01-25','Migraña crónica','Tratamiento con analgésicos',3),(4,'2024-01-30','Fractura de brazo','Uso de férula y rehabilitación',4),(5,'2024-02-05','Diabetes','Control de azúcar en sangre',5),(6,'2024-01-15','Hipertensión','Requiere control periódico',1),(7,'2024-01-20','Alergia estacional','Uso de antihistamínicos',2),(8,'2024-01-25','Migraña crónica','Tratamiento con analgésicos',3),(9,'2024-01-15','Hipertensión','Requiere control periódico',1),(10,'2024-01-20','Alergia estacional','Uso de antihistamínicos',2),(11,'2024-01-25','Migraña crónica','Tratamiento con analgésicos',3);
/*!40000 ALTER TABLE `HistorialMedico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Medicamento`
--

DROP TABLE IF EXISTS `Medicamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Medicamento` (
  `idMedicamento` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  `idTratamiento` int(11) DEFAULT NULL,
  PRIMARY KEY (`idMedicamento`),
  KEY `idTratamiento` (`idTratamiento`),
  CONSTRAINT `Medicamento_ibfk_1` FOREIGN KEY (`idTratamiento`) REFERENCES `Tratamiento` (`idTratamiento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Medicamento`
--

LOCK TABLES `Medicamento` WRITE;
/*!40000 ALTER TABLE `Medicamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `Medicamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Medico`
--

DROP TABLE IF EXISTS `Medico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Medico` (
  `idMedico` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  `apellido` varchar(30) NOT NULL,
  `especialidad` varchar(20) NOT NULL,
  `correo` varchar(30) DEFAULT NULL,
  `idCita` int(11) DEFAULT NULL,
  PRIMARY KEY (`idMedico`),
  UNIQUE KEY `correo` (`correo`),
  KEY `idCita` (`idCita`),
  CONSTRAINT `Medico_ibfk_1` FOREIGN KEY (`idCita`) REFERENCES `Cita` (`idCita`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Medico`
--

LOCK TABLES `Medico` WRITE;
/*!40000 ALTER TABLE `Medico` DISABLE KEYS */;
INSERT INTO `Medico` VALUES (1,'Carlos','Hernandez','Cardiología','carlos.hernandez@hospital.com',1),(2,'Elena','Vega','Pediatría','elena.vega@hospital.com',2),(3,'Raúl','Torres','Neurología','raul.torres@hospital.com',3),(4,'Diana','Martinez','Traumatología','diana.martinez@hospital.com',4),(5,'Fernando','Castro','Dermatología','fernando.castro@hospital.com',5);
/*!40000 ALTER TABLE `Medico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Paciente`
--

DROP TABLE IF EXISTS `Paciente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Paciente` (
  `idPaciente` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  `apellido` varchar(30) NOT NULL,
  `direccionCasa` text DEFAULT NULL,
  `direccionCalle` text,
  `direccionCiudad` text,
  PRIMARY KEY (`idPaciente`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Paciente`
--

LOCK TABLES `Paciente` WRITE;
/*!40000 ALTER TABLE `Paciente` DISABLE KEYS */;
INSERT INTO `Paciente` VALUES (1,'Juan','Perez','Av. Central 123','Los Pinos','Quito'),(2,'Maria','Lopez','Calle 45','La Floresta','Guayaquil'),(3,'Carlos','Gomez','Mz 12, Villa 8','Kennedy','Cuenca'),(4,'Ana','Martinez','Sector Sur','Los Sauces','Loja'),(5,'Pedro','Ramirez','Calle 10','Miraflores','Ambato'),(12,'Dilan','Chamba','12 de octubre','12 de octubre','Lojita'),(13,'Dilan','Chamba','12 de octubre','12 de octubre','12 de octubre');
/*!40000 ALTER TABLE `Paciente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `PacientesEmergencia2025`
--

DROP TABLE IF EXISTS `PacientesEmergencia2025`;
/*!50001 DROP VIEW IF EXISTS `PacientesEmergencia2025`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `PacientesEmergencia2025` AS SELECT
 1 AS `nombre`,
  1 AS `apellido`,
  1 AS `fecha`,
  1 AS `nombre_enfermero`,
  1 AS `apellido_enfermero`,
  1 AS `turno` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `PacientesEmergencia2025Nocturno`
--

DROP TABLE IF EXISTS `PacientesEmergencia2025Nocturno`;
/*!50001 DROP VIEW IF EXISTS `PacientesEmergencia2025Nocturno`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `PacientesEmergencia2025Nocturno` AS SELECT
 1 AS `nombre`,
  1 AS `apellido`,
  1 AS `fecha`,
  1 AS `nombre_enfermero`,
  1 AS `apellido_enfermero`,
  1 AS `turno` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Sala`
--

DROP TABLE IF EXISTS `Sala`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Sala` (
  `idSala` int(11) NOT NULL AUTO_INCREMENT,
  `tipoSala` varchar(20) NOT NULL,
  `capacidad` int(11) NOT NULL,
  PRIMARY KEY (`idSala`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Sala`
--

LOCK TABLES `Sala` WRITE;
/*!40000 ALTER TABLE `Sala` DISABLE KEYS */;
INSERT INTO `Sala` VALUES (1,'Emergencia',10),(2,'Cirugía',5),(3,'Pediatría',8),(4,'UCI',3),(5,'Laboratorio',6);
/*!40000 ALTER TABLE `Sala` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Telefono`
--

DROP TABLE IF EXISTS `Telefono`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Telefono` (
  `idTelefono` int(11) NOT NULL AUTO_INCREMENT,
  `numero` varchar(10) DEFAULT NULL,
  `idPaciente` int(11) DEFAULT NULL,
  PRIMARY KEY (`idTelefono`),
  KEY `idPaciente` (`idPaciente`),
  CONSTRAINT `Telefono_ibfk_1` FOREIGN KEY (`idPaciente`) REFERENCES `Paciente` (`idPaciente`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Telefono`
--

LOCK TABLES `Telefono` WRITE;
/*!40000 ALTER TABLE `Telefono` DISABLE KEYS */;
INSERT INTO `Telefono` VALUES (1,'0987654321',1),(2,'0998765432',2),(3,'0976543210',3),(4,'0965432109',4),(5,'0954321098',5);
/*!40000 ALTER TABLE `Telefono` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tratamiento`
--

DROP TABLE IF EXISTS `Tratamiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tratamiento` (
  `idTratamiento` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  `descripcion` text NOT NULL,
  `duracion` varchar(20) NOT NULL,
  `medicamento` text NOT NULL,
  `idHistorial` int(11) DEFAULT NULL,
  PRIMARY KEY (`idTratamiento`),
  KEY `idHistorial` (`idHistorial`),
  CONSTRAINT `Tratamiento_ibfk_1` FOREIGN KEY (`idHistorial`) REFERENCES `HistorialMedico` (`idHistorial`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tratamiento`
--

LOCK TABLES `Tratamiento` WRITE;
/*!40000 ALTER TABLE `Tratamiento` DISABLE KEYS */;
INSERT INTO `Tratamiento` VALUES (1,'Tratamiento para hipertensión','Control de presión arterial','8','Losartán',1),(2,'Tratamiento para alergia','Reducción de síntomas','10','Loratadina',2),(3,'Tratamiento para migraña','Reducción de episodios','12','Sumatriptán',3),(4,'Tratamiento para fractura','Inmovilización y terapia','15','Férula y analgésicos',4),(5,'Tratamiento para diabetes','Control de glucosa','2','Metformina',5);
/*!40000 ALTER TABLE `Tratamiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `ejemplo3`
--

DROP TABLE IF EXISTS `ejemplo3`;
/*!50001 DROP VIEW IF EXISTS `ejemplo3`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `ejemplo3` AS SELECT
 1 AS `nombre`,
  1 AS `apellido` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `ejemplo4`
--

DROP TABLE IF EXISTS `ejemplo4`;
/*!50001 DROP VIEW IF EXISTS `ejemplo4`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `ejemplo4` AS SELECT
 1 AS `nombre`,
  1 AS `apellido` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `ejemplo_2`
--

DROP TABLE IF EXISTS `ejemplo_2`;
/*!50001 DROP VIEW IF EXISTS `ejemplo_2`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `ejemplo_2` AS SELECT
 1 AS `nombre`,
  1 AS `apellido`,
  1 AS `numero` */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `PacientesEmergencia2025`
--

/*!50001 DROP VIEW IF EXISTS `PacientesEmergencia2025`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`dilan`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `PacientesEmergencia2025` AS select `P`.`nombre` AS `nombre`,`P`.`apellido` AS `apellido`,`C`.`fecha` AS `fecha`,`E`.`nombre` AS `nombre_enfermero`,`E`.`apellido` AS `apellido_enfermero`,`E`.`turno` AS `turno` from (((`Paciente` `P` join `Cita` `C` on(`P`.`idPaciente` = `C`.`idPaciente`)) join `Sala` `S` on(`C`.`idSala` = `S`.`idSala`)) join `Enfermero` `E` on(`E`.`idSala` = `S`.`idSala`)) where `S`.`tipoSala` = 'Emergencia' and `C`.`fecha` between '2025-01-01' and '2025-12-31' and `E`.`turno` = 'Diurno' */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `PacientesEmergencia2025Nocturno`
--

/*!50001 DROP VIEW IF EXISTS `PacientesEmergencia2025Nocturno`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`dilan`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `PacientesEmergencia2025Nocturno` AS select `P`.`nombre` AS `nombre`,`P`.`apellido` AS `apellido`,`C`.`fecha` AS `fecha`,`E`.`nombre` AS `nombre_enfermero`,`E`.`apellido` AS `apellido_enfermero`,`E`.`turno` AS `turno` from (((`Paciente` `P` join `Cita` `C` on(`P`.`idPaciente` = `C`.`idPaciente`)) join `Sala` `S` on(`C`.`idSala` = `S`.`idSala`)) join `Enfermero` `E` on(`E`.`idSala` = `S`.`idSala`)) where `S`.`tipoSala` = 'Emergencia' and `C`.`fecha` between '2025-01-01' and '2025-12-31' and `E`.`turno` = 'Nocturno' */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `ejemplo3`
--

/*!50001 DROP VIEW IF EXISTS `ejemplo3`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`dilan`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `ejemplo3` AS select `E`.`nombre` AS `nombre`,`E`.`apellido` AS `apellido` from (`Enfermero` `E` join `Sala` `S` on(`E`.`idSala` = `S`.`idSala`)) where `S`.`capacidad` < 5 and `E`.`turno` = 'Diurno' */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `ejemplo4`
--

/*!50001 DROP VIEW IF EXISTS `ejemplo4`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`dilan`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `ejemplo4` AS select `P`.`nombre` AS `nombre`,`P`.`apellido` AS `apellido` from ((`Paciente` `P` join (select `H`.`idPaciente` AS `idPaciente`,`C`.`idSala` AS `idSala` from (`HistorialMedico` `H` join `Cita` `C` on(`H`.`idPaciente` = `C`.`idPaciente`)) where `H`.`diagnostico` = 'Hipertensión') `subquery` on(`P`.`idPaciente` = `subquery`.`idPaciente`)) join `Sala` `S` on(`subquery`.`idSala` = `S`.`idSala`)) where `S`.`tipoSala` = 'Emergencia' */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `ejemplo_2`
--

/*!50001 DROP VIEW IF EXISTS `ejemplo_2`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`dilan`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `ejemplo_2` AS select `P`.`nombre` AS `nombre`,`P`.`apellido` AS `apellido`,`T`.`numero` AS `numero` from (((`Paciente` `P` join `HistorialMedico` `H` on(`P`.`idPaciente` = `H`.`idPaciente`)) join `Tratamiento` `TR` on(`H`.`idHistorial` = `TR`.`idHistorial`)) join `Telefono` `T` on(`P`.`idPaciente` = `T`.`idPaciente`)) where `TR`.`medicamento` like '%Metformina%' */;
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

-- Dump completed on 2025-02-10 11:25:11
