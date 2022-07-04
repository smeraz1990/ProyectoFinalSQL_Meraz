CREATE DATABASE  IF NOT EXISTS `laboratorio_model` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `laboratorio_model`;
-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: laboratorio_model
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `bitacoraeventos`
--

DROP TABLE IF EXISTS `bitacoraeventos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bitacoraeventos` (
  `usuarioID` int DEFAULT NULL,
  `cambios_text` varchar(250) DEFAULT NULL,
  `fecha_Cambio` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Se guardan los cambios realizados en el sistema de BD';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bitacoraeventos`
--

LOCK TABLES `bitacoraeventos` WRITE;
/*!40000 ALTER TABLE `bitacoraeventos` DISABLE KEYS */;
INSERT INTO `bitacoraeventos` VALUES (8,'Se modifico el registro: old nombre:Amiraold apellido:De Lunaold pasword:1013deluna','2022-05-23 15:02:17'),(8,'Se modifico el registro:  old nombre: Morena old apellido: De Luna old pasword: CambioTrigger','2022-05-23 15:04:03'),(1,'Se modifico el registro:  old nombre: Simon old apellido: Meraz old pasword: sd1957080890','2022-05-30 12:08:11');
/*!40000 ALTER TABLE `bitacoraeventos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ciudad`
--

DROP TABLE IF EXISTS `ciudad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ciudad` (
  `CiudadID` int NOT NULL AUTO_INCREMENT,
  `Ciudad` varchar(50) NOT NULL,
  `EstadoID` int NOT NULL,
  PRIMARY KEY (`CiudadID`),
  KEY `fk_estadoid_ciudad_idx` (`EstadoID`),
  CONSTRAINT `fk_estadoid_ciudad` FOREIGN KEY (`EstadoID`) REFERENCES `estado` (`EstadoID`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Contiene Ciudades';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ciudad`
--

LOCK TABLES `ciudad` WRITE;
/*!40000 ALTER TABLE `ciudad` DISABLE KEYS */;
INSERT INTO `ciudad` VALUES (1,'Aguascalientes',1),(2,'No Registrado',1),(3,'BENITO JUAREZ',1),(4,'Ensenada',2),(5,'Mexicali',2),(6,'Playas de Rosarito',2),(7,'Tecate',2),(8,'Tijuana',2),(9,'Comondú',3),(10,'La Paz',3),(11,'Loreto',3),(12,'Los Cabos',3),(13,'Mulegé',3),(14,'Canatlán',10),(15,'Canelas',10),(16,'Coneto de Comonfort',10),(17,'Cuencamé',10),(18,'Durango',10),(19,'Nogales',13),(20,'Nueva Ciudad',1);
/*!40000 ALTER TABLE `ciudad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `datosusuarios`
--

DROP TABLE IF EXISTS `datosusuarios`;
/*!50001 DROP VIEW IF EXISTS `datosusuarios`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `datosusuarios` AS SELECT 
 1 AS `Nombre`,
 1 AS `usuario`,
 1 AS `Password`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `detalleestudios`
--

DROP TABLE IF EXISTS `detalleestudios`;
/*!50001 DROP VIEW IF EXISTS `detalleestudios`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `detalleestudios` AS SELECT 
 1 AS `Usuario`,
 1 AS `NomPaciente`,
 1 AS `FechaSolicitud`,
 1 AS `FechaResultado`,
 1 AS `FechaEntrega`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `detalleestudiosporusuarios`
--

DROP TABLE IF EXISTS `detalleestudiosporusuarios`;
/*!50001 DROP VIEW IF EXISTS `detalleestudiosporusuarios`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `detalleestudiosporusuarios` AS SELECT 
 1 AS `SolicitudID`,
 1 AS `Usuario`,
 1 AS `FechaSolicitud`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `detallesolicitud`
--

DROP TABLE IF EXISTS `detallesolicitud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detallesolicitud` (
  `DetalleID` int NOT NULL AUTO_INCREMENT,
  `SolicitudID` int NOT NULL,
  `EstudioID` int NOT NULL,
  `TipoResultadoID` int NOT NULL,
  `Comentarios` varchar(300) DEFAULT NULL,
  `FechaResultado` date DEFAULT NULL,
  PRIMARY KEY (`DetalleID`),
  KEY `fk_estudioid_idx` (`EstudioID`),
  KEY `fk_solicitudid` (`SolicitudID`),
  KEY `fk_tipoResultado_idx` (`TipoResultadoID`),
  CONSTRAINT `fk_estudioid` FOREIGN KEY (`EstudioID`) REFERENCES `estudios` (`EstudioID`),
  CONSTRAINT `fk_solicitudid` FOREIGN KEY (`SolicitudID`) REFERENCES `solicitudestudio` (`SolicitudID`),
  CONSTRAINT `fk_tipoResultado` FOREIGN KEY (`TipoResultadoID`) REFERENCES `tiporesultados` (`TipoResultadoID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Contiene el detalle de la solicitud con estudios';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detallesolicitud`
--

LOCK TABLES `detallesolicitud` WRITE;
/*!40000 ALTER TABLE `detallesolicitud` DISABLE KEYS */;
INSERT INTO `detallesolicitud` VALUES (1,1,1,1,'PruebaComent',NULL),(2,1,2,1,NULL,NULL),(3,2,2,1,'Prueba',NULL),(4,3,3,3,NULL,NULL),(5,2,5,2,NULL,NULL),(6,6,1,1,NULL,NULL),(7,4,2,2,NULL,'2022-05-09');
/*!40000 ALTER TABLE `detallesolicitud` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado`
--

DROP TABLE IF EXISTS `estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estado` (
  `EstadoID` int NOT NULL AUTO_INCREMENT,
  `Estado` varchar(50) NOT NULL,
  `PaisID` int NOT NULL,
  PRIMARY KEY (`EstadoID`),
  UNIQUE KEY `EstadoID_UNIQUE` (`EstadoID`),
  KEY `fk_paisid_idx` (`PaisID`),
  CONSTRAINT `fk_paisid` FOREIGN KEY (`PaisID`) REFERENCES `pais` (`PaisID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado`
--

LOCK TABLES `estado` WRITE;
/*!40000 ALTER TABLE `estado` DISABLE KEYS */;
INSERT INTO `estado` VALUES (1,'Aguascalientes',1),(2,'Baja California Norte',1),(3,'Baja California Sur',1),(4,'Campeche',1),(5,'Chiapas',1),(6,'Chihuahua',1),(7,'Coahuila de Zaragoza',1),(8,'Colima',1),(9,'Ciudad de México',1),(10,'Durango',1),(11,'Alabama',2),(12,'Alaska',2),(13,'Arizona',2),(14,'Arkansas',2),(15,'California',2),(16,'Colorado',2);
/*!40000 ALTER TABLE `estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estudios`
--

DROP TABLE IF EXISTS `estudios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estudios` (
  `EstudioID` int NOT NULL AUTO_INCREMENT,
  `NombreEstudio` varchar(100) NOT NULL,
  `TipoTomaMuestraID` int NOT NULL,
  `Activo` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`EstudioID`),
  KEY `fk_tipotomamiestraid_tipotoma_idx` (`TipoTomaMuestraID`),
  CONSTRAINT `fk_tipotomamiestraid_tipotoma` FOREIGN KEY (`TipoTomaMuestraID`) REFERENCES `tipotomamuestra` (`TipoTomaMuestraID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Contiene los estudios que realiza el laboratorio';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estudios`
--

LOCK TABLES `estudios` WRITE;
/*!40000 ALTER TABLE `estudios` DISABLE KEYS */;
INSERT INTO `estudios` VALUES (1,'Covid',1,_binary ''),(2,'Tamiz 76',3,_binary ''),(3,'Tamiz 69',2,_binary ''),(4,'VIH',1,_binary ''),(5,'Tamiz 61',1,_binary '');
/*!40000 ALTER TABLE `estudios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `estudiosporusuario`
--

DROP TABLE IF EXISTS `estudiosporusuario`;
/*!50001 DROP VIEW IF EXISTS `estudiosporusuario`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `estudiosporusuario` AS SELECT 
 1 AS `Usuario`,
 1 AS `numeroEstudiosRealizados`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `pacientes_logs`
--

DROP TABLE IF EXISTS `pacientes_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pacientes_logs` (
  `pacienteID` int NOT NULL,
  `Accion_desc` varchar(250) DEFAULT NULL,
  `fecha_log` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Se guardan los eventos generados en la tabla pacientes';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pacientes_logs`
--

LOCK TABLES `pacientes_logs` WRITE;
/*!40000 ALTER TABLE `pacientes_logs` DISABLE KEYS */;
INSERT INTO `pacientes_logs` VALUES (11,'Se agrego el paciente: 11','2022-05-23 17:24:08'),(11,'Se elimino el paciente: 11','2022-05-23 18:41:24');
/*!40000 ALTER TABLE `pacientes_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `pacientesestado`
--

DROP TABLE IF EXISTS `pacientesestado`;
/*!50001 DROP VIEW IF EXISTS `pacientesestado`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `pacientesestado` AS SELECT 
 1 AS `pacienteid`,
 1 AS `NomPaciente`,
 1 AS `direccion`,
 1 AS `pais`,
 1 AS `estado`,
 1 AS `ciudad`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `pacienteslab`
--

DROP TABLE IF EXISTS `pacienteslab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pacienteslab` (
  `PacienteID` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) NOT NULL,
  `ApellidoPaterno` varchar(50) NOT NULL,
  `ApellidoMaterno` varchar(50) NOT NULL,
  `FechaRegistro` date NOT NULL DEFAULT (curdate()),
  `FechaNacimiento` date NOT NULL,
  `Direccion` varchar(100) NOT NULL,
  `CiudadID` int NOT NULL,
  PRIMARY KEY (`PacienteID`),
  KEY `fk_ciudadID_paciente_idx` (`CiudadID`),
  CONSTRAINT `fk_ciudad_pacientes` FOREIGN KEY (`CiudadID`) REFERENCES `ciudad` (`CiudadID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pacienteslab`
--

LOCK TABLES `pacienteslab` WRITE;
/*!40000 ALTER TABLE `pacienteslab` DISABLE KEYS */;
INSERT INTO `pacienteslab` VALUES (1,'Patricia','Lopez','Zamora','2021-04-01','1970-04-23','Burocratas 105',1),(2,'Carmen','Ibarra','Morte','2021-05-01','1980-04-23','teresa calcuta 504',1),(3,'Diana','Sanchez','Guereca','2021-04-21','1938-04-23','cerro de las mitras 2411',4),(4,'Roberto','Martinez','Martinez','2022-01-01','1990-04-23','valle del malpais 105',4),(5,'Carlos','Martinez','Lopez','2020-09-15','1990-04-23','valle del guadiana 150',4),(6,'Karina','Cereceres','Garcia','2019-08-20','1995-04-23','josefa jimenez 258',15),(7,'Gabriela','Cereceres','Garcia','2022-10-19','1998-04-23','Burocratas 111',13),(8,'Francisco','Ontiveros','Arreola','2021-06-14','1990-04-23','Burocratas 105',13),(9,'Maria','Eugenia','Mares','2020-04-08','2000-04-23','teresa calcuta 504',6),(10,'Ignacio','Orozco','Perez','2020-07-13','2002-04-23','cerro de las mitras 2411',11);
/*!40000 ALTER TABLE `pacienteslab` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Insert_Pacientes` AFTER INSERT ON `pacienteslab` FOR EACH ROW begin
		insert into pacientes_logs values (new.pacienteid,concat('Se agrego el paciente: ', new.pacienteid),current_timestamp());
	end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `delete_usuarios` BEFORE DELETE ON `pacienteslab` FOR EACH ROW begin
		insert into pacientes_logs values (old.pacienteid,concat('Se elimino el paciente: ', old.pacienteid),current_timestamp());
	end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `pais`
--

DROP TABLE IF EXISTS `pais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pais` (
  `PaisID` int NOT NULL AUTO_INCREMENT,
  `Pais` varchar(50) NOT NULL,
  PRIMARY KEY (`PaisID`),
  UNIQUE KEY `PaisID_UNIQUE` (`PaisID`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pais`
--

LOCK TABLES `pais` WRITE;
/*!40000 ALTER TABLE `pais` DISABLE KEYS */;
INSERT INTO `pais` VALUES (1,'México'),(2,'Estados Unidos de América'),(3,'Colombia'),(4,'Portugal'),(5,'España'),(6,'Alemania'),(7,'India'),(8,'Austria'),(9,'Australia'),(10,'Nueva Zelanda'),(27,'Marruecos'),(28,'Honduras'),(29,'Nicaragua'),(30,'Chile'),(31,'Brasil'),(32,'Nigeria'),(33,'Venezuela'),(34,'Egipto');
/*!40000 ALTER TABLE `pais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solicitudestudio`
--

DROP TABLE IF EXISTS `solicitudestudio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `solicitudestudio` (
  `SolicitudID` int NOT NULL AUTO_INCREMENT,
  `UsuarioID` int NOT NULL,
  `PacienteID` int NOT NULL,
  `FechaSolicitud` date NOT NULL DEFAULT (curdate()),
  `FechaEntrega` date DEFAULT NULL,
  `SolicitudFinalizada` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`SolicitudID`),
  KEY `fk_usuarioid_usuario_idx` (`UsuarioID`),
  KEY `fk_pacienteid` (`PacienteID`),
  CONSTRAINT `fk_pacienteid` FOREIGN KEY (`PacienteID`) REFERENCES `pacienteslab` (`PacienteID`),
  CONSTRAINT `fk_usuarioid_usuario` FOREIGN KEY (`UsuarioID`) REFERENCES `usuarios` (`UsuarioID`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicitudestudio`
--

LOCK TABLES `solicitudestudio` WRITE;
/*!40000 ALTER TABLE `solicitudestudio` DISABLE KEYS */;
INSERT INTO `solicitudestudio` VALUES (1,1,3,'2022-05-09',NULL,_binary '\0'),(2,1,1,'2022-05-08','2022-05-09',_binary ''),(3,5,5,'2022-03-08','2022-05-01',_binary ''),(4,8,7,'2022-03-08',NULL,_binary '\0'),(5,9,6,'2022-03-08',NULL,_binary '\0'),(6,3,2,'2022-03-08',NULL,_binary '\0');
/*!40000 ALTER TABLE `solicitudestudio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tiporesultados`
--

DROP TABLE IF EXISTS `tiporesultados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tiporesultados` (
  `TipoResultadoID` int NOT NULL AUTO_INCREMENT,
  `TipoResultado` varchar(50) NOT NULL,
  PRIMARY KEY (`TipoResultadoID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Contiene los tipos de resultados posibles\n';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tiporesultados`
--

LOCK TABLES `tiporesultados` WRITE;
/*!40000 ALTER TABLE `tiporesultados` DISABLE KEYS */;
INSERT INTO `tiporesultados` VALUES (1,'Positivo'),(2,'Negativo'),(3,'Repeticion'),(4,'Descartado');
/*!40000 ALTER TABLE `tiporesultados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipotomamuestra`
--

DROP TABLE IF EXISTS `tipotomamuestra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipotomamuestra` (
  `TipoTomaMuestraID` int NOT NULL AUTO_INCREMENT,
  `TipoTomaMuestra` varchar(50) NOT NULL,
  PRIMARY KEY (`TipoTomaMuestraID`),
  UNIQUE KEY `TipoTomaMuestraID_UNIQUE` (`TipoTomaMuestraID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Contiene Tipo de muesta\n';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipotomamuestra`
--

LOCK TABLES `tipotomamuestra` WRITE;
/*!40000 ALTER TABLE `tipotomamuestra` DISABLE KEYS */;
INSERT INTO `tipotomamuestra` VALUES (1,'Sangre'),(2,'Raspado nasofaríngeo'),(3,'Saliva'),(4,'Cabello'),(5,'Orina en colector estéril');
/*!40000 ALTER TABLE `tipotomamuestra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `UsuarioID` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) NOT NULL,
  `ApellidoPaterno` varchar(50) NOT NULL,
  `FechaIngreso` date NOT NULL,
  `Usuario` varchar(20) NOT NULL,
  `Password` varchar(20) NOT NULL,
  `Activo` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`UsuarioID`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Saymonmod','Meraz','2015-04-10','smeraz','sd1957080890',_binary ''),(2,'Hector','Cruz','2015-05-03','hcruz','1!monedasy+G',_binary ''),(3,'Carlos Alberto','Arroyo','2018-06-05','carroyo','Abadol117',_binary ''),(4,'Arturo','Nuñez','2017-01-01','anunez','anunez04.',_binary ''),(5,'Roberto','Arriaga','2016-07-22','rarriaga','chupamilto81',_binary ''),(6,'Iván de Jesús','López','2020-07-09','ilopez.gk','r7b;R{{d{80SRDnS%2cI',_binary '\0'),(7,'Karla','Rocha','2021-09-30','krocha','frida1313',_binary ''),(8,'Morena','De Luna','2018-09-06','adeluna','CambioTrigger',_binary ''),(9,'Synertix','Contadores','2021-09-05','uSynertix','12345abcde',_binary '\0'),(10,'Georgina','Esparza','2020-05-16','gk.gina','260octavio',_binary ''),(11,'Prueba','ApellidoPrueba','2022-05-18','Prueba','pasprueba',_binary ''),(12,'Prueba','ApellidoPrueba','2022-05-10','PruebaUsuario','pasprueba',_binary ''),(13,'Prueba','ApellidoPrueba','2022-05-10','PruebaUsuario','pasprueba',_binary ''),(14,'Nuevo','NuevoApellido','2022-05-23','nuevo_usuario','',_binary ''),(15,'Nuevo','NuevoApellido','2022-05-23','nuevo_usuario','',_binary ''),(16,'Nuevo','NuevoApellido','2022-05-23','asdasd','aa',_binary '');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `insert_usuarios` BEFORE INSERT ON `usuarios` FOR EACH ROW begin
	declare msg_error varchar(250);
    if(new.usuario = "") then
		set msg_error = 'El usuario no puede ser vacio';
        signal sqlstate '45000' set message_text = msg_error;
	elseif (new.password = "") then
		set msg_error = 'El password no puede ser vacio';
        signal sqlstate '45000' set message_text = msg_error;
	end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `au_usuarios` AFTER UPDATE ON `usuarios` FOR EACH ROW begin
	insert into bitacoraeventos values (new.usuarioid,concat('Se modifico el registro: ', ' old nombre: ', old.nombre,' old apellido: ', old.apellidoPaterno, ' old pasword: ', old.password),current_timestamp());
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping events for database 'laboratorio_model'
--

--
-- Dumping routines for database 'laboratorio_model'
--
/*!50003 DROP FUNCTION IF EXISTS `areaTriangulo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `areaTriangulo`(base float, altura float) RETURNS float
    DETERMINISTIC
BEGIN
	DECLARE resultadoarea float;
    set resultadoarea = ((base * altura) / 2);
    RETURN resultadoarea;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `EstudiosPorUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `EstudiosPorUsuario`(usuarioID int) RETURNS varchar(500) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
DECLARE DatosEstudios varchar(500);
 SELECT 
        `laboratorio_model`.`usuarios`.`Usuario` AS `Usuario`,
        CONCAT(`p`.`Nombre`,
                ' ',
                `p`.`ApellidoPaterno`,
                ' ',
                `p`.`ApellidoMaterno`) AS `NomPaciente`,
        `sol`.`FechaSolicitud` AS `FechaSolicitud`,
        `detsol`.`FechaResultado` AS `FechaResultado`,
        `sol`.`FechaEntrega` AS `FechaEntrega` into DatosEstudios
    FROM
        (((`laboratorio_model`.`usuarios`
        JOIN `laboratorio_model`.`solicitudestudio` `sol` ON ((`laboratorio_model`.`usuarios`.`UsuarioID` = `sol`.`UsuarioID`)))
        JOIN `laboratorio_model`.`detallesolicitud` `detsol` ON ((`sol`.`SolicitudID` = `detsol`.`SolicitudID`)))
        JOIN `laboratorio_model`.`pacienteslab` `p` ON ((`sol`.`PacienteID` = `p`.`PacienteID`)))
        where usuarios.usuarioid = usuarioID; 

RETURN DatosEstudios;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `NumeroEstudiosPorUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `NumeroEstudiosPorUsuario`(UsuarioID INT) RETURNS int
    READS SQL DATA
BEGIN
	DECLARE NumeroEstudios INT;
    SELECT 
        COUNT(`detallesolicitud`.`DetalleID`) AS `numeroEstudiosRealizados` into NumeroEstudios
    FROM
        ((`solicitudestudio`
        JOIN `detallesolicitud` ON ((`solicitudestudio`.`SolicitudID` = `detallesolicitud`.`SolicitudID`)))
        JOIN `usuarios` ON ((`solicitudestudio`.`UsuarioID` = `usuarios`.`UsuarioID`)))
        where usuarios.usuarioID = UsuarioID
    GROUP BY `usuarios`.`Usuario`;
    RETURN NumeroEstudios;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `NumeroPacientesPorPais` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `NumeroPacientesPorPais`(PaisID INT) RETURNS int
    DETERMINISTIC
BEGIN
	DECLARE NumeroEstudiosPais INT;
	SELECT 
        count(pacienteid) as NumeroPacientes into NumeroEstudiosPais
    FROM
        (((`laboratorio_model`.`pacienteslab`
        JOIN `laboratorio_model`.`ciudad` ON ((`laboratorio_model`.`pacienteslab`.`CiudadID` = `laboratorio_model`.`ciudad`.`CiudadID`)))
        JOIN `laboratorio_model`.`estado` ON ((`laboratorio_model`.`ciudad`.`EstadoID` = `laboratorio_model`.`estado`.`EstadoID`)))
        JOIN `laboratorio_model`.`pais` ON ((`laboratorio_model`.`estado`.`PaisID` = `laboratorio_model`.`pais`.`PaisID`)))
        where pais.paisid = PaisID
        group by pais.pais;
    RETURN NumeroEstudiosPais;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Usuarios_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Usuarios_delete`(usuarioid int)
begin
	delete from laboratorio_model.usuarios
    where usuarioid = usuarioid;
    call Usuarios_Orden('usuarioid',2);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Usuarios_Insert` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Usuarios_Insert`(Nombre varchar(50), apellido varchar(50), fechaI date, usuario varchar(20), password varchar(20))
begin
	insert into laboratorio_model.usuarios(nombre, apellidoPaterno, fechaIngreso, usuario, password) values (nombre, apellido, fechaI, usuario, password);
    call Usuarios_Orden('usuarioid',2);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Usuarios_Orden` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Usuarios_Orden`(columnorder varchar(100), orden int)
begin
	declare qry_select varchar(100);
    declare qry_order_by varchar(100);
    declare qry_to_execute varchar (200);
    
    set qry_select = 'Select * from laboratorio_model.usuarios';
    
    if orden = 1 then
		set qry_order_by = 'asc';
	else
        set qry_order_by = 'desc';
	end if;
    
	if columnorder = '' then
		select 'La columna no puede ser vacia';
	else
		select concat(qry_Select, ' order by ', columnorder, '  ', qry_order_by) into qry_to_execute;
        set @smtmt = qry_to_execute;
        
        prepare ejecutar from @smtmt;
        
        execute ejecutar;
        deallocate prepare ejecutar;
	end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `datosusuarios`
--

/*!50001 DROP VIEW IF EXISTS `datosusuarios`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `datosusuarios` AS select ((`usuarios`.`Nombre` + ' ') + `usuarios`.`ApellidoPaterno`) AS `Nombre`,`usuarios`.`Usuario` AS `usuario`,`usuarios`.`Password` AS `Password` from `usuarios` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `detalleestudios`
--

/*!50001 DROP VIEW IF EXISTS `detalleestudios`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `detalleestudios` AS select `usuarios`.`Usuario` AS `Usuario`,concat(`p`.`Nombre`,' ',`p`.`ApellidoPaterno`,' ',`p`.`ApellidoMaterno`) AS `NomPaciente`,`sol`.`FechaSolicitud` AS `FechaSolicitud`,`detsol`.`FechaResultado` AS `FechaResultado`,`sol`.`FechaEntrega` AS `FechaEntrega` from (((`usuarios` join `solicitudestudio` `sol` on((`usuarios`.`UsuarioID` = `sol`.`UsuarioID`))) join `detallesolicitud` `detsol` on((`sol`.`SolicitudID` = `detsol`.`SolicitudID`))) join `pacienteslab` `p` on((`sol`.`PacienteID` = `p`.`PacienteID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `detalleestudiosporusuarios`
--

/*!50001 DROP VIEW IF EXISTS `detalleestudiosporusuarios`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `detalleestudiosporusuarios` AS select `solicitudestudio`.`SolicitudID` AS `SolicitudID`,`usuarios`.`Usuario` AS `Usuario`,`solicitudestudio`.`FechaSolicitud` AS `FechaSolicitud` from (`usuarios` join `solicitudestudio` on((`usuarios`.`UsuarioID` = `solicitudestudio`.`UsuarioID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `estudiosporusuario`
--

/*!50001 DROP VIEW IF EXISTS `estudiosporusuario`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `estudiosporusuario` AS select `usuarios`.`Usuario` AS `Usuario`,count(`detallesolicitud`.`DetalleID`) AS `numeroEstudiosRealizados` from ((`solicitudestudio` join `detallesolicitud` on((`solicitudestudio`.`SolicitudID` = `detallesolicitud`.`SolicitudID`))) join `usuarios` on((`solicitudestudio`.`UsuarioID` = `usuarios`.`UsuarioID`))) group by `usuarios`.`Usuario` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `pacientesestado`
--

/*!50001 DROP VIEW IF EXISTS `pacientesestado`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `pacientesestado` AS select `pacienteslab`.`PacienteID` AS `pacienteid`,concat(`pacienteslab`.`Nombre`,' ',`pacienteslab`.`ApellidoPaterno`,' ',`pacienteslab`.`ApellidoMaterno`) AS `NomPaciente`,`pacienteslab`.`Direccion` AS `direccion`,`pais`.`Pais` AS `pais`,`estado`.`Estado` AS `estado`,`ciudad`.`Ciudad` AS `ciudad` from (((`pacienteslab` join `ciudad` on((`pacienteslab`.`CiudadID` = `ciudad`.`CiudadID`))) join `estado` on((`ciudad`.`EstadoID` = `estado`.`EstadoID`))) join `pais` on((`estado`.`PaisID` = `pais`.`PaisID`))) */;
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

-- Dump completed on 2022-07-04 12:58:47
