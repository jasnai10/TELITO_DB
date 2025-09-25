CREATE DATABASE  IF NOT EXISTS `db_telito` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `db_telito`;
-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: db_telito
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `actividad_reciente`
--

DROP TABLE IF EXISTS `actividad_reciente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `actividad_reciente` (
  `id` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) DEFAULT NULL,
  `fecha` datetime(6) DEFAULT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `idUsuario` varchar(8) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKjhbck11886dpv18ldc0hlvqqj` (`idUsuario`),
  CONSTRAINT `FKjhbck11886dpv18ldc0hlvqqj` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`dni`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actividad_reciente`
--

LOCK TABLES `actividad_reciente` WRITE;
/*!40000 ALTER TABLE `actividad_reciente` DISABLE KEYS */;
/*!40000 ALTER TABLE `actividad_reciente` ENABLE KEYS */;
UNLOCK TABLES;

-- -----------------------------------------------------
-- Table `db_telito`.`adjunto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `adjunto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `adjunto` (
  `idAdjunto` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(200) NULL,
  `archivo` LONGBLOB NULL,
  `idComentario` INT NULL,
  PRIMARY KEY (`idAdjunto`),
  KEY fk_adjunto_comentario1_idx (`idComentario`),
  CONSTRAINT `fk_adjunto_comentario1` FOREIGN KEY (`idComentario`) REFERENCES `comentario` (`idComentario`)
  ) ENGINE = InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `api`
--

DROP TABLE IF EXISTS `api`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api` (
  `idAPI` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) NOT NULL,
  `descripcion` text NOT NULL,
  `fecha_creacion` timestamp NULL DEFAULT NULL,
  `endpointURL` varchar(45) NOT NULL,
  `idDominio` int NOT NULL,
  `idTag` int NOT NULL,
  PRIMARY KEY (`idAPI`),
  KEY `fk_api_dominio1_idx` (`idDominio`),
  KEY `fk_api_tag1_idx` (`idTag`),
  CONSTRAINT `fk_api_dominio1` FOREIGN KEY (`idDominio`) REFERENCES `dominio` (`idDominio`),
  CONSTRAINT `fk_api_tag1` FOREIGN KEY (`idTag`) REFERENCES `tag` (`idTag`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api`
--

LOCK TABLES `api` WRITE;
/*!40000 ALTER TABLE `api` DISABLE KEYS */;
INSERT INTO `api` VALUES (1,'API Usuarios','Permite la gestión de usuarios (registro, login, perfiles).','2025-01-10 15:00:00','/api/v1/usuarios',1,1),(2,'API Pagos','Procesamiento de pagos y facturación.','2025-02-05 17:30:00','/api/v1/pagos',2,5),(3,'API Inventario','Gestión de productos y stock en almacenes.','2025-03-15 14:15:00','/api/v1/inventario',3,2),(4,'API Notificaciones','Envía notificaciones push y correos electrónicos.','2025-04-01 19:45:00','/api/v1/notificaciones',4,1),(5,'API Analytics','Provee métricas y reportes de uso de la plataforma.','2025-04-20 13:20:00','/api/v1/analytics',5,1),(6,'API Geolocalización','Servicios de ubicación y mapas.','2025-05-10 21:00:00','/api/v1/geolocalizacion',6,1),(7,'API Chat','Provee mensajería instantánea y salas de chat en tiempo real.','2025-05-25 18:40:00','/api/v1/chat',4,3),(8,'API Reportes','Genera reportes PDF y Excel a partir de datos del sistema.','2025-06-02 14:10:00','/api/v1/reportes',5,1),(9,'API Reservas','Gestión de reservas y disponibilidad de recursos.','2025-06-10 20:25:00','/api/v1/reservas',7,1),(10,'API IoT','Monitoreo y control de dispositivos IoT en tiempo real.','2025-06-18 13:55:00','/api/v1/iot',8,4),(11,'API Traducción','Traducción automática de textos y documentos.','2025-06-25 16:35:00','/api/v1/traduccion',9,1),(12,'API Reconocimiento','Reconocimiento de imágenes y patrones.','2025-07-01 22:15:00','/api/v1/reconocimiento',10,1);
/*!40000 ALTER TABLE `api` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_has_entorno`
--

DROP TABLE IF EXISTS `api_has_entorno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_has_entorno` (
  `idAPI` int NOT NULL,
  `idEntorno` int NOT NULL,
  `url_base` varchar(255) DEFAULT NULL,
  `estado` enum('Activo','Inactivo') DEFAULT NULL,
  PRIMARY KEY (`idAPI`,`idEntorno`),
  KEY `fk_entorno_idx` (`idEntorno`),
  CONSTRAINT `fk_api` FOREIGN KEY (`idAPI`) REFERENCES `api` (`idAPI`),
  CONSTRAINT `fk_entorno` FOREIGN KEY (`idEntorno`) REFERENCES `entorno` (`idEntorno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_has_entorno`
--

LOCK TABLES `api_has_entorno` WRITE;
/*!40000 ALTER TABLE `api_has_entorno` DISABLE KEYS */;
INSERT INTO `api_has_entorno` VALUES (1,1,'https://prod.miapp.com/usuarios','Activo'),(1,2,'https://dev.miapp.com/usuarios','Activo'),(1,3,'https://qa.miapp.com/usuarios','Inactivo'),(2,1,'https://prod.miapp.com/pagos','Activo'),(2,2,'https://dev.miapp.com/pagos','Inactivo'),(2,3,'https://qa.miapp.com/pagos','Activo'),(3,1,'https://prod.miapp.com/inventario','Activo'),(3,3,'https://qa.miapp.com/inventario','Activo'),(4,1,'https://prod.miapp.com/notificaciones','Activo'),(4,2,'https://dev.miapp.com/notificaciones','Activo'),(5,1,'https://prod.miapp.com/analytics','Activo'),(5,3,'https://qa.miapp.com/analytics','Inactivo'),(6,1,'https://prod.miapp.com/geolocalizacion','Activo'),(6,2,'https://dev.miapp.com/geolocalizacion','Activo'),(6,3,'https://qa.miapp.com/geolocalizacion','Activo');
/*!40000 ALTER TABLE `api_has_entorno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auditlog`
--

DROP TABLE IF EXISTS `auditlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auditlog` (
  `idAudit` int NOT NULL AUTO_INCREMENT,
  `entidad` varchar(60) NOT NULL,
  `idEntidad` int NOT NULL,
  `accion` enum('INSERT','UPDATE','DELETE') NOT NULL,
  `cambios` json DEFAULT NULL,
  `fecha` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `idUsuario` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`idAudit`),
  KEY `idx_entidad` (`entidad`,`idEntidad`,`fecha`),
  KEY `fk_auditlog_usuario1_idx` (`idUsuario`),
  CONSTRAINT `fk_auditlog_usuario1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`dni`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditlog`
--

LOCK TABLES `auditlog` WRITE;
/*!40000 ALTER TABLE `auditlog` DISABLE KEYS */;
/*!40000 ALTER TABLE `auditlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chatbot`
--

DROP TABLE IF EXISTS `chatbot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chatbot` (
  `idChatBOT` int NOT NULL,
  `pregunta` text CHARACTER SET cp1250 COLLATE cp1250_general_ci,
  `respuesta` text,
  `fecha` timestamp NULL DEFAULT NULL,
  `estado` varchar(45) DEFAULT NULL,
  `idUsuario` char(8) NOT NULL,
  `idTicket` int DEFAULT NULL,
  PRIMARY KEY (`idChatBOT`),
  KEY `fk_ChatBOT_Ticket1_idx` (`idTicket`),
  KEY `fk_chatbot_usuario1_idx` (`idUsuario`),
  CONSTRAINT `fk_ChatBOT_Ticket1` FOREIGN KEY (`idTicket`) REFERENCES `ticket` (`idTicket`),
  CONSTRAINT `fk_chatbot_usuario1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`dni`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chatbot`
--

LOCK TABLES `chatbot` WRITE;
/*!40000 ALTER TABLE `chatbot` DISABLE KEYS */;
/*!40000 ALTER TABLE `chatbot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comentario`
--

DROP TABLE IF EXISTS `comentario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comentario` (
  `idComentario` int NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL,
  `comentario` varchar(400) NOT NULL,
  `idIssue` int NOT NULL,
  `idUsuario` char(8) NOT NULL,
  PRIMARY KEY (`idComentario`),
  KEY `fk_issue_copy1_issue1_idx` (`idIssue`),
  KEY `fk_comentario_usuario1_idx` (`idUsuario`),
  CONSTRAINT `fk_comentario_usuario1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`dni`),
  CONSTRAINT `fk_issue_copy1_issue100` FOREIGN KEY (`idIssue`) REFERENCES `issue` (`idIssue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comentario`
--

LOCK TABLES `comentario` WRITE;
/*!40000 ALTER TABLE `comentario` DISABLE KEYS */;
/*!40000 ALTER TABLE `comentario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contratoapi`
--

DROP TABLE IF EXISTS `contratoapi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contratoapi` (
  `idContratoAPI` int NOT NULL AUTO_INCREMENT,
  `formato` int NOT NULL,
  `url_documento` varchar(45) NOT NULL,
  `fecha_subida` timestamp NULL DEFAULT NULL,
  `idAPI` int NOT NULL,
  PRIMARY KEY (`idContratoAPI`),
  KEY `fk_ContratoAPI_API1_idx` (`idAPI`),
  CONSTRAINT `fk_ContratoAPI_API1` FOREIGN KEY (`idAPI`) REFERENCES `api` (`idAPI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contratoapi`
--

LOCK TABLES `contratoapi` WRITE;
/*!40000 ALTER TABLE `contratoapi` DISABLE KEYS */;
/*!40000 ALTER TABLE `contratoapi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credencialapi`
--

DROP TABLE IF EXISTS `credencialapi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `credencialapi` (
  `idCredencialAPI` int NOT NULL AUTO_INCREMENT,
  `api_key` varchar(45) NOT NULL,
  `api_secret` varchar(255) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL,
  `estado` bit(1) NOT NULL,
  `idUsuario` char(8) NOT NULL,
  `idAPI` int NOT NULL,
  PRIMARY KEY (`idCredencialAPI`),
  KEY `fk_CredencialAPI_API1_idx` (`idAPI`),
  KEY `fk_credencialapi_usuario1_idx` (`idUsuario`),
  CONSTRAINT `fk_CredencialAPI_API1` FOREIGN KEY (`idAPI`) REFERENCES `api` (`idAPI`),
  CONSTRAINT `fk_credencialapi_usuario1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`dni`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credencialapi`
--

LOCK TABLES `credencialapi` WRITE;
/*!40000 ALTER TABLE `credencialapi` DISABLE KEYS */;
INSERT INTO `credencialapi` VALUES (18,'APIKEY-8765-A1-2024',NULL,'2024-12-15 13:30:00',_binary '\0','87654321',1),(19,'APIKEY-8765-A1-2025',NULL,'2025-01-12 14:00:00',_binary '','87654321',1),(20,'APIKEY-8765-A2',NULL,'2025-02-06 15:15:00',_binary '','87654321',2),(21,'APIKEY-8765-A3',NULL,'2025-03-16 16:45:00',_binary '','87654321',3),(22,'APIKEY-8765-A4',NULL,'2025-04-02 19:50:00',_binary '\0','87654321',4),(23,'APIKEY-8765-A4-RENOV',NULL,'2025-05-01 14:10:00',_binary '','87654321',4),(24,'APIKEY-8765-A5',NULL,'2025-04-21 13:25:00',_binary '','87654321',5),(25,'APIKEY-8765-A6',NULL,'2025-05-11 21:05:00',_binary '','87654321',6),(26,'APIKEY-8765-A7',NULL,'2025-05-11 21:05:00',_binary '','87654321',7),(27,'APIKEY-1122-A1',NULL,'2025-06-02 15:00:00',_binary '','11223344',1),(28,'APIKEY-1122-A2',NULL,'2025-06-02 15:05:00',_binary '','11223344',2),(29,'APIKEY-1122-A5',NULL,'2025-06-02 15:20:00',_binary '','11223344',5),(30,'APIKEY-9988-A1',NULL,'2025-06-03 16:00:00',_binary '','99887766',1),(31,'APIKEY-9988-A3',NULL,'2025-06-03 16:10:00',_binary '','99887766',3),(32,'APIKEY-9988-A4',NULL,'2025-06-03 16:15:00',_binary '','99887766',4),(33,'APIKEY-9988-A6',NULL,'2025-06-03 16:25:00',_binary '','99887766',6);
/*!40000 ALTER TABLE `credencialapi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documentacion`
--

DROP TABLE IF EXISTS `documentacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documentacion` (
  `idDocumentacion` int NOT NULL AUTO_INCREMENT,
  `tipo` varchar(45) DEFAULT NULL,
  `contenido` json DEFAULT NULL,
  `descripcion` text,
  `fecha_creacion` timestamp NULL DEFAULT NULL,
  `idAPI` int NOT NULL,
  `idVersion` int NOT NULL,
  PRIMARY KEY (`idDocumentacion`),
  KEY `fk_Documentacion_API1_idx` (`idAPI`),
  KEY `fk_documentacion_versionapi1_idx` (`idVersion`),
  CONSTRAINT `fk_Documentacion_API1` FOREIGN KEY (`idAPI`) REFERENCES `api` (`idAPI`),
  CONSTRAINT `fk_documentacion_versionapi1` FOREIGN KEY (`idVersion`) REFERENCES `versionapi` (`idVersion`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documentacion`
--

LOCK TABLES `documentacion` WRITE;
/*!40000 ALTER TABLE `documentacion` DISABLE KEYS */;
INSERT INTO `documentacion` VALUES (1,'OpenAPI','{\"info\": {\"title\": \"API Usuarios\", \"version\": \"v2.0\", \"description\": \"Permite la gestión de usuarios: registro, login, perfiles.\"}, \"paths\": {\"/usuarios\": {\"get\": {\"summary\": \"Lista todos los usuarios\", \"responses\": {\"200\": {\"description\": \"Lista de usuarios\"}}}, \"post\": {\"summary\": \"Crea un nuevo usuario\", \"responses\": {\"201\": {\"description\": \"Usuario creado\"}}}}}, \"openapi\": \"3.0.0\"}','Documentación de la API de gestión de usuarios.','2025-06-05 14:00:00',1,2),(2,'OpenAPI','{\"info\": {\"title\": \"API Pagos\", \"version\": \"v2.1\", \"description\": \"Procesa pagos y genera facturas electrónicas.\"}, \"paths\": {\"/pagos\": {\"post\": {\"summary\": \"Procesa un pago\", \"responses\": {\"200\": {\"description\": \"Pago procesado correctamente\"}, \"400\": {\"description\": \"Error en la solicitud\"}}}}}, \"openapi\": \"3.0.0\"}','Documentación de la API de pagos y facturación.','2025-06-06 15:15:00',2,4),(3,'OpenAPI','{\"info\": {\"title\": \"API Inventario\", \"version\": \"v1.1\", \"description\": \"Gestiona productos y stock en almacenes.\"}, \"paths\": {\"/productos\": {\"get\": {\"summary\": \"Lista todos los productos\", \"responses\": {\"200\": {\"description\": \"Lista de productos\"}}}}, \"/productos/{id}\": {\"get\": {\"summary\": \"Obtiene un producto por ID\", \"responses\": {\"200\": {\"description\": \"Detalle del producto\"}, \"404\": {\"description\": \"Producto no encontrado\"}}}}}, \"openapi\": \"3.0.0\"}','Documentación de la API de inventario y stock.','2025-06-07 19:30:00',3,5),(4,'OpenAPI','{\"info\": {\"title\": \"API Chat\", \"version\": \"v1.0\", \"description\": \"Provee mensajería instantánea y salas de chat.\"}, \"paths\": {\"/mensajes\": {\"get\": {\"summary\": \"Obtiene mensajes recientes\", \"responses\": {\"200\": {\"description\": \"Lista de mensajes\"}}}, \"post\": {\"summary\": \"Envía un nuevo mensaje\", \"responses\": {\"201\": {\"description\": \"Mensaje enviado\"}}}}}, \"openapi\": \"3.0.0\"}','Documentación de la API de chat en tiempo real.','2025-06-08 16:45:00',7,10),(5,'OpenAPI','{\"info\": {\"title\": \"API Usuarios\", \"version\": \"v2.1\", \"description\": \"Gestión avanzada de usuarios.\"}, \"paths\": {\"/usuarios/{id}\": {\"get\": {\"summary\": \"Obtiene usuario por ID\", \"responses\": {\"200\": {\"description\": \"OK\"}, \"404\": {\"description\": \"No encontrado\"}}}, \"put\": {\"summary\": \"Actualiza usuario\", \"responses\": {\"200\": {\"description\": \"Actualizado\"}}}}}, \"openapi\": \"3.0.0\"}','Endpoints adicionales para API Usuarios.','2025-06-09 15:00:00',1,2),(6,'OpenAPI','{\"info\": {\"title\": \"API Pagos\", \"version\": \"v2.2\", \"description\": \"Pagos con soporte de reembolsos.\"}, \"paths\": {\"/pagos/{id}\": {\"get\": {\"summary\": \"Consulta pago\", \"responses\": {\"200\": {\"description\": \"OK\"}, \"404\": {\"description\": \"No encontrado\"}}}}, \"/pagos/{id}/reembolso\": {\"post\": {\"summary\": \"Procesa reembolso\", \"responses\": {\"200\": {\"description\": \"Reembolso exitoso\"}, \"400\": {\"description\": \"Error\"}}}}}, \"openapi\": \"3.0.0\"}','Nuevos endpoints para API Pagos.','2025-06-09 15:05:00',2,4);
/*!40000 ALTER TABLE `documentacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dominio`
--

DROP TABLE IF EXISTS `dominio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dominio` (
  `idDominio` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) NOT NULL,
  PRIMARY KEY (`idDominio`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dominio`
--

LOCK TABLES `dominio` WRITE;
/*!40000 ALTER TABLE `dominio` DISABLE KEYS */;
INSERT INTO `dominio` VALUES (1,'Seguridad'),(2,'Finanzas'),(3,'Logística'),(4,'Comunicación'),(5,'Analítica'),(6,'Geografía'),(7,'Servicios'),(8,'Tecnología'),(9,'Lenguaje'),(10,'IA');
/*!40000 ALTER TABLE `dominio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ejemploscodigo`
--

DROP TABLE IF EXISTS `ejemploscodigo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ejemploscodigo` (
  `idEjemplosCodigo` int NOT NULL,
  `lenguaje` varchar(45) DEFAULT NULL,
  `contenido` json DEFAULT NULL,
  `Documentacion_idDocumentacion` int NOT NULL,
  PRIMARY KEY (`idEjemplosCodigo`),
  KEY `fk_EjemplosCodigo_Documentacion1_idx` (`Documentacion_idDocumentacion`),
  CONSTRAINT `fk_EjemplosCodigo_Documentacion1` FOREIGN KEY (`Documentacion_idDocumentacion`) REFERENCES `documentacion` (`idDocumentacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ejemploscodigo`
--

LOCK TABLES `ejemploscodigo` WRITE;
/*!40000 ALTER TABLE `ejemploscodigo` DISABLE KEYS */;
INSERT INTO `ejemploscodigo` VALUES (1,'JavaScript','{\"code\": \"fetch(\\\"/api/usuarios\\\").then(r => r.json()).then(console.log);\"}',1),(2,'Java','{\"code\": \"HttpResponse<String> response = client.send(request, BodyHandlers.ofString());\"}',5),(3,'Python','{\"code\": \"import requests\\nrequests.post(\\\"https://api.pagos.com/pagar\\\", json={\\\"monto\\\":100})\"}',2),(4,'cURL','{\"code\": \"curl -X POST https://api.pagos.com/pagar -d \\\"monto=100\\\"\"}',6),(5,'PHP','{\"code\": \"<?php echo file_get_contents(\\\"https://api.inventario.com/items\\\"); ?>\"}',3),(6,'Go','{\"code\": \"resp, _ := http.Get(\\\"https://api.inventario.com/items\\\")\"}',3),(7,'Python','{\"code\": \"import requests\\nprint(requests.get(\\\"https://api.usuarios.com/lista\\\").json())\"}',1),(8,'JavaScript','{\"code\": \"await fetch(\\\"/api/pagos\\\", {method:\\\"POST\\\", body: JSON.stringify({monto:100})});\"}',2),(9,'Ruby','{\"code\": \"require \\\"net/http\\\"\\nputs Net::HTTP.get(URI(\\\"https://api.inventario.com/items\\\"))\"}',3);
/*!40000 ALTER TABLE `ejemploscodigo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entorno`
--

DROP TABLE IF EXISTS `entorno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entorno` (
  `idEntorno` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `descripcion` text,
  PRIMARY KEY (`idEntorno`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entorno`
--

LOCK TABLES `entorno` WRITE;
/*!40000 ALTER TABLE `entorno` DISABLE KEYS */;
INSERT INTO `entorno` VALUES (1,'Producción','Entorno principal en uso por clientes'),(2,'Desarrollo','Entorno de pruebas internas'),(3,'QA','Entorno para control de calidad');
/*!40000 ALTER TABLE `entorno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estadoapi`
--

DROP TABLE IF EXISTS `estadoapi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estadoapi` (
  `idEstado` int NOT NULL,
  `estado` varchar(25) NOT NULL,
  `idAPI` int NOT NULL,
  PRIMARY KEY (`idEstado`),
  KEY `fk_VersionAPI_API1_idx` (`idAPI`),
  CONSTRAINT `fk_VersionAPI_API10` FOREIGN KEY (`idAPI`) REFERENCES `api` (`idAPI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estadoapi`
--

LOCK TABLES `estadoapi` WRITE;
/*!40000 ALTER TABLE `estadoapi` DISABLE KEYS */;
INSERT INTO `estadoapi` VALUES (1,'Activa',1),(2,'En Mantenimiento',2),(3,'Activa',3);
/*!40000 ALTER TABLE `estadoapi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evidencia`
--

DROP TABLE IF EXISTS `evidencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `evidencia` (
  `idEvidencia` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) NOT NULL,
  `evidencia` longblob NOT NULL,
  `descripción` text,
  `idReporte` int NOT NULL,
  PRIMARY KEY (`idEvidencia`),
  KEY `fk_evidencia_reporte1_idx` (`idReporte`),
  CONSTRAINT `fk_evidencia_reporte1` FOREIGN KEY (`idReporte`) REFERENCES `reporte` (`idReporte`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evidencia`
--

LOCK TABLES `evidencia` WRITE;
/*!40000 ALTER TABLE `evidencia` DISABLE KEYS */;
/*!40000 ALTER TABLE `evidencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedback` (
  `idFeedback` int NOT NULL,
  `comentario` text NOT NULL,
  `calificacion` int NOT NULL,
  `fecha_creacion` timestamp NOT NULL,
  `idUsuario` char(8) NOT NULL,
  `idAPI` int NOT NULL,
  PRIMARY KEY (`idFeedback`),
  KEY `fk_Feedback_API1_idx` (`idAPI`),
  KEY `fk_feedback_usuario1_idx` (`idUsuario`),
  CONSTRAINT `fk_Feedback_API1` FOREIGN KEY (`idAPI`) REFERENCES `api` (`idAPI`),
  CONSTRAINT `fk_feedback_usuario1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`dni`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
INSERT INTO `feedback` VALUES (1,'Muy útil para la autenticación.',5,'2025-04-01 13:00:00','12345678',1),(2,'La integración de pagos fue sencilla.',4,'2025-04-02 14:00:00','87654321',2),(3,'La API de inventario necesita mejorar la velocidad.',3,'2025-04-03 15:00:00','11223344',3),(4,'Excelente documentación y control de accesos.',5,'2025-04-05 16:00:00','99887766',1);
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historial`
--

DROP TABLE IF EXISTS `historial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historial` (
  `idHistorial` int NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL,
  `etiqueta` varchar(25) NOT NULL,
  `descripción` varchar(200) DEFAULT NULL,
  `idIssue` int NOT NULL,
  `idReporte` int NOT NULL,
  PRIMARY KEY (`idHistorial`),
  KEY `fk_issue_copy1_issue1_idx` (`idIssue`),
  CONSTRAINT `fk_issue_copy1_issue10` FOREIGN KEY (`idIssue`) REFERENCES `issue` (`idIssue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historial`
--

LOCK TABLES `historial` WRITE;
/*!40000 ALTER TABLE `historial` DISABLE KEYS */;
/*!40000 ALTER TABLE `historial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issue`
--

DROP TABLE IF EXISTS `issue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `issue` (
  `idIssue` int NOT NULL AUTO_INCREMENT,
  `estado` varchar(25) NOT NULL DEFAULT 'Reportado',
  `descripcion` varchar(200) DEFAULT NULL,
  `idReporte` int NOT NULL,
  `fecha_creacion` timestamp NOT NULL,
  PRIMARY KEY (`idIssue`,`idReporte`),
  KEY `fk_reporte_copy1_reporte1_idx` (`idReporte`),
  CONSTRAINT `fk_reporte_copy1_reporte1` FOREIGN KEY (`idReporte`) REFERENCES `reporte` (`idReporte`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issue`
--

LOCK TABLES `issue` WRITE;
/*!40000 ALTER TABLE `issue` DISABLE KEYS */;
INSERT INTO `issue` VALUES (1,'Reportado','Límite de peticiones',1,'2025-09-12 00:00:00');
/*!40000 ALTER TABLE `issue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logapi`
--

DROP TABLE IF EXISTS `logapi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logapi` (
  `idLogAPI` int NOT NULL,
  `endpoint` varchar(200) NOT NULL,
  `estadohttp` int NOT NULL,
  `tiempoRespuestams` int NOT NULL,
  `fecha` datetime NOT NULL,
  `idAPI` int NOT NULL,
  `idUsuario` char(8) NOT NULL,
  PRIMARY KEY (`idLogAPI`),
  KEY `fk_LogAPI_API1_idx` (`idAPI`),
  KEY `fk_logapi_usuario1_idx` (`idUsuario`),
  CONSTRAINT `fk_LogAPI_API1` FOREIGN KEY (`idAPI`) REFERENCES `api` (`idAPI`),
  CONSTRAINT `fk_logapi_usuario1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`dni`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logapi`
--

LOCK TABLES `logapi` WRITE;
/*!40000 ALTER TABLE `logapi` DISABLE KEYS */;
/*!40000 ALTER TABLE `logapi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metricaapi`
--

DROP TABLE IF EXISTS `metricaapi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metricaapi` (
  `idMetrica` int NOT NULL AUTO_INCREMENT,
  `idAPI` int NOT NULL,
  `fecha` timestamp NULL DEFAULT NULL,
  `llamadas` int DEFAULT NULL,
  `errores` int DEFAULT NULL,
  `latencia_promedio` int DEFAULT NULL,
  `costo` decimal(10,2) DEFAULT NULL,
  `idEntorno` int NOT NULL,
  PRIMARY KEY (`idMetrica`),
  KEY `api_metricaAPI_fk_idx` (`idAPI`),
  KEY `entorno_metricaAPI_fk_idx` (`idEntorno`),
  CONSTRAINT `api_metricaAPI_fk` FOREIGN KEY (`idAPI`) REFERENCES `api` (`idAPI`),
  CONSTRAINT `entorno_metricaAPI_fk` FOREIGN KEY (`idEntorno`) REFERENCES `entorno` (`idEntorno`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metricaapi`
--

LOCK TABLES `metricaapi` WRITE;
/*!40000 ALTER TABLE `metricaapi` DISABLE KEYS */;
INSERT INTO `metricaapi` VALUES (1,1,'2025-09-01 05:00:00',12000,50,120,25.50,1),(2,2,'2025-09-01 05:00:00',5000,20,200,80.00,1),(3,3,'2025-09-01 05:00:00',8000,100,150,40.00,1);
/*!40000 ALTER TABLE `metricaapi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notificacion`
--

DROP TABLE IF EXISTS `notificacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notificacion` (
  `idNotificacion` int NOT NULL AUTO_INCREMENT,
  `mensaje` text NOT NULL,
  `leido` bit(1) NOT NULL,
  `fecha` timestamp NOT NULL,
  `idUsuario` char(8) NOT NULL,
  PRIMARY KEY (`idNotificacion`),
  KEY `fk_notificacion_usuario1_idx` (`idUsuario`),
  CONSTRAINT `fk_notificacion_usuario1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`dni`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notificacion`
--

LOCK TABLES `notificacion` WRITE;
/*!40000 ALTER TABLE `notificacion` DISABLE KEYS */;
INSERT INTO `notificacion` VALUES (1,'Actualización API Usuarios: Tu API ha sido actualizada a la versión v2.0.',_binary '\0','2025-06-05 14:15:00','87654321'),(2,'Alerta de seguridad: Se detectó un uso inusual de tu API Pagos en las últimas 24 horas.',_binary '','2025-06-04 23:45:00','87654321'),(3,'Expiración de credencial: Tu acceso a API Notificaciones ha caducado y requiere renovación.',_binary '\0','2025-05-15 15:30:00','87654321'),(4,'Nuevo reporte disponible: Consulta las métricas en API Analytics.',_binary '','2025-05-10 13:00:00','87654321'),(5,'Error crítico: Se ha registrado un error 500 en API Inventario.',_binary '\0','2025-04-28 19:20:00','87654321'),(6,'Hito alcanzado: Tu API Geolocalización ha recibido 10,000 solicitudes este mes.',_binary '','2025-04-15 14:50:00','87654321'),(7,'Acceso aprobado: Tu solicitud para API Pagos v2.1 (Beta) fue aceptada.',_binary '','2025-03-20 16:40:00','87654321'),(8,'Recordatorio de optimización: Revisa las métricas de API Analytics para mejorar el rendimiento.',_binary '\0','2025-03-05 12:55:00','87654321'),(9,'Renovación exitosa: Tu credencial para API Usuarios fue actualizada.',_binary '','2025-02-12 21:10:00','87654321'),(10,'Intento de acceso fallido: Se detectó un intento no autorizado en API Inventario.',_binary '\0','2025-02-02 03:15:00','87654321');
/*!40000 ALTER TABLE `notificacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organizacion`
--

DROP TABLE IF EXISTS `organizacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `organizacion` (
  `idOrganizacion` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `fecha_creacion` date NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idOrganizacion`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organizacion`
--

LOCK TABLES `organizacion` WRITE;
/*!40000 ALTER TABLE `organizacion` DISABLE KEYS */;
INSERT INTO `organizacion` VALUES (1,'Telito Solutions','2024-03-15','Empresa dedicada al desarrollo de soluciones web y móviles'),(2,'Data Insights','2024-05-10','Consultora especializada en análisis de datos y BI');
/*!40000 ALTER TABLE `organizacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proyecto`
--

DROP TABLE IF EXISTS `proyecto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proyecto` (
  `idProyecto` int NOT NULL AUTO_INCREMENT,
  `idOrganizacion` int NOT NULL,
  `dni_po_lider` char(8) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date DEFAULT NULL,
  `url_repositorio` varchar(255) DEFAULT NULL,
  `publico` tinyint(1) NOT NULL DEFAULT '1',
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idProyecto`),
  KEY `fk_proyecto_equipo1_idx` (`idOrganizacion`),
  KEY `fk_proyecto_usuario1_idx` (`dni_po_lider`),
  CONSTRAINT `fk_proyecto_equipo1` FOREIGN KEY (`idOrganizacion`) REFERENCES `organizacion` (`idOrganizacion`),
  CONSTRAINT `fk_proyecto_usuario1` FOREIGN KEY (`dni_po_lider`) REFERENCES `usuario` (`dni`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proyecto`
--

LOCK TABLES `proyecto` WRITE;
/*!40000 ALTER TABLE `proyecto` DISABLE KEYS */;
INSERT INTO `proyecto` VALUES (1,1,'55554444','Portal Clientes','Plataforma web para gestión de clientes y soporte','2025-04-01',NULL,'https://git.miapp.com/portal-clientes',1,1),(2,1,'55554444','App Móvil Ventas','Aplicación móvil para gestión de ventas y pedidos','2025-05-15',NULL,'https://git.miapp.com/app-ventas',0,1),(3,2,'66667777','Dashboard Analítico','Panel de control para visualización de métricas de negocio','2025-06-01',NULL,'https://git.miapp.com/dashboard-analitico',1,1),(4,2,'66667777','ETL Automatizado','Pipeline de extracción, transformación y carga de datos','2024-07-10','2025-01-20','https://git.miapp.com/etl-automatizado',0,0);
/*!40000 ALTER TABLE `proyecto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proyecto_has_api`
--

DROP TABLE IF EXISTS `proyecto_has_api`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proyecto_has_api` (
  `idProyecto` int NOT NULL,
  `idAPI` int NOT NULL,
  `fecha_asociacion` date NOT NULL,
  `proposito` varchar(255) DEFAULT NULL,
  `idVersion` int NOT NULL,
  `idEntorno` int NOT NULL,
  PRIMARY KEY (`idProyecto`,`idAPI`),
  KEY `fk_proyecto_has_api_proyecto1_idx` (`idProyecto`),
  KEY `fk_proyecto_has_api_versionapi1_idx` (`idVersion`),
  KEY `fk_proyecto_has_api_api1_idx` (`idAPI`),
  KEY `fk_proyecto_has_api_entorno1_idx` (`idEntorno`),
  CONSTRAINT `fk_proyecto_has_api_api1` FOREIGN KEY (`idAPI`) REFERENCES `api` (`idAPI`),
  CONSTRAINT `fk_proyecto_has_api_entorno1` FOREIGN KEY (`idEntorno`) REFERENCES `entorno` (`idEntorno`),
  CONSTRAINT `fk_proyecto_has_api_proyecto1` FOREIGN KEY (`idProyecto`) REFERENCES `proyecto` (`idProyecto`),
  CONSTRAINT `fk_proyecto_has_api_versionapi1` FOREIGN KEY (`idVersion`) REFERENCES `versionapi` (`idVersion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proyecto_has_api`
--

LOCK TABLES `proyecto_has_api` WRITE;
/*!40000 ALTER TABLE `proyecto_has_api` DISABLE KEYS */;
INSERT INTO `proyecto_has_api` VALUES (1,1,'2024-04-02','Gestión de usuarios del portal',1,1),(1,4,'2024-04-02','Notificaciones a clientes',6,1),(1,5,'2024-04-05','Métricas de uso del portal',8,3),(2,1,'2024-05-16','Autenticación de vendedores',2,2),(2,2,'2024-05-16','Procesamiento de pagos móviles',3,1),(2,6,'2024-05-18','Geolocalización de clientes',9,1),(3,5,'2024-06-02','Visualización de métricas',8,1),(3,8,'2024-06-02','Generación de reportes',11,3),(3,11,'2024-06-05','Traducción de datos',14,2),(4,12,'2024-07-11','Reconocimiento de patrones en datos',1,1);
/*!40000 ALTER TABLE `proyecto_has_api` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reporte`
--

DROP TABLE IF EXISTS `reporte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reporte` (
  `idReporte` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(200) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL,
  `API_idAPI` int NOT NULL,
  `estado` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idReporte`),
  KEY `fk_Reporte_API1_idx` (`API_idAPI`),
  CONSTRAINT `fk_Reporte_API1` FOREIGN KEY (`API_idAPI`) REFERENCES `api` (`idAPI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reporte`
--

LOCK TABLES `reporte` WRITE;
/*!40000 ALTER TABLE `reporte` DISABLE KEYS */;
INSERT INTO `reporte` VALUES (1,'Se encontró error al ejcutar esta API','2025-04-19 12:00:00',5,'Aprobado'),(2,'Se ha encontrado fallas al momento de crear credenciales','2025-05-31 01:00:00',6,'Fallido');
/*!40000 ALTER TABLE `reporte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rol` (
  `idRol` int NOT NULL AUTO_INCREMENT,
  `nombre_rol` varchar(50) NOT NULL,
  `descripcion` text NOT NULL,
  PRIMARY KEY (`idRol`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES (1,'SUPERADMIN','Super Admin'),(2,'DEV','Desarrollador'),(3,'QA','Quality Assurance'),(4,'PO','Product Owner');
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sdk`
--

DROP TABLE IF EXISTS `sdk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sdk` (
  `idSDK` int NOT NULL,
  `url_sdk` varchar(200) DEFAULT NULL,
  `idAPI` int NOT NULL,
  `versionSDK` varchar(45) DEFAULT NULL,
  `descripcion` varchar(45) NOT NULL,
  PRIMARY KEY (`idSDK`),
  KEY `fk_LiberiaAPI_API1_idx` (`idAPI`),
  CONSTRAINT `fk_LiberiaAPI_API1` FOREIGN KEY (`idAPI`) REFERENCES `api` (`idAPI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sdk`
--

LOCK TABLES `sdk` WRITE;
/*!40000 ALTER TABLE `sdk` DISABLE KEYS */;
/*!40000 ALTER TABLE `sdk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sesion`
--

DROP TABLE IF EXISTS `sesion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sesion` (
  `idSesion` int NOT NULL AUTO_INCREMENT,
  `token` varchar(255) NOT NULL,
  `tipo_autenticacion` varchar(255) NOT NULL,
  `fecha_inicio` timestamp NULL DEFAULT NULL,
  `fecha_expiracion` timestamp NULL DEFAULT NULL,
  `estado` enum('Activa','Expirada','Revocada') DEFAULT NULL,
  `idUsuario` char(8) NOT NULL,
  PRIMARY KEY (`idSesion`),
  KEY `fk_sesion_usuario1_idx` (`idUsuario`),
  CONSTRAINT `fk_sesion_usuario1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`dni`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sesion`
--

LOCK TABLES `sesion` WRITE;
/*!40000 ALTER TABLE `sesion` DISABLE KEYS */;
/*!40000 ALTER TABLE `sesion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solicitudacceso`
--

DROP TABLE IF EXISTS `solicitudacceso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `solicitudacceso` (
  `idSolicitudAcceso` int NOT NULL AUTO_INCREMENT,
  `estado` bit(1) NOT NULL,
  `fecha_solicitud` timestamp NOT NULL,
  `fecha_respuesta` timestamp NULL DEFAULT NULL,
  `nombre_proyecto` varchar(150) DEFAULT NULL,
  `descripcion_uso` text,
  `entorno` varchar(50) DEFAULT NULL,
  `callback_url` varchar(255) DEFAULT NULL,
  `idUsuario` char(8) NOT NULL,
  `idAPI` int NOT NULL,
  PRIMARY KEY (`idSolicitudAcceso`),
  KEY `fk_SolicitudAcceso_API1_idx` (`idAPI`),
  KEY `fk_solicitudacceso_usuario1_idx` (`idUsuario`),
  CONSTRAINT `fk_SolicitudAcceso_API1` FOREIGN KEY (`idAPI`) REFERENCES `api` (`idAPI`),
  CONSTRAINT `fk_solicitudacceso_usuario1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`dni`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicitudacceso`
--

LOCK TABLES `solicitudacceso` WRITE;
/*!40000 ALTER TABLE `solicitudacceso` DISABLE KEYS */;
/*!40000 ALTER TABLE `solicitudacceso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tag` (
  `idTag` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) NOT NULL,
  PRIMARY KEY (`idTag`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
INSERT INTO `tag` VALUES (1,'REST'),(2,'GraphQL'),(3,'WebSocket'),(4,'MQTT'),(5,'Eventos');
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_entity`
--

DROP TABLE IF EXISTS `test_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `test_entity` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_entity`
--

LOCK TABLES `test_entity` WRITE;
/*!40000 ALTER TABLE `test_entity` DISABLE KEYS */;
/*!40000 ALTER TABLE `test_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket` (
  `idTicket` int NOT NULL,
  `asunto` varchar(150) NOT NULL,
  `descripcion` text NOT NULL,
  `fecha_creacion` timestamp NOT NULL,
  `estado` bit(1) NOT NULL,
  `fecha_final` timestamp NULL DEFAULT NULL,
  `idUsuario` char(8) NOT NULL,
  `idAPI` int NOT NULL,
  PRIMARY KEY (`idTicket`),
  KEY `fk_Ticket_API1_idx` (`idAPI`),
  KEY `fk_ticket_usuario1_idx` (`idUsuario`),
  CONSTRAINT `fk_Ticket_API1` FOREIGN KEY (`idAPI`) REFERENCES `api` (`idAPI`),
  CONSTRAINT `fk_ticket_usuario1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`dni`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
INSERT INTO `ticket` VALUES (1,'Error en autenticación','El login en API Usuarios devuelve error 401 para credenciales válidas.','2025-06-05 14:20:00',_binary '\0',NULL,'87654321',1),(2,'Fallo en procesamiento de pagos','Transacciones en API Pagos se quedan en estado pendiente.','2025-06-04 23:50:00',_binary '','2025-06-05 16:30:00','87654321',2),(3,'Stock no actualizado','API Inventario no refleja cambios después de actualización masiva.','2025-05-15 15:40:00',_binary '\0',NULL,'87654321',3),(4,'Notificaciones duplicadas','API Notificaciones envía el mismo mensaje varias veces.','2025-05-02 19:55:00',_binary '','2025-05-03 21:10:00','87654321',4),(5,'Reporte incompleto','API Analytics omite métricas de usuarios inactivos.','2025-04-25 13:30:00',_binary '','2025-04-26 17:00:00','87654321',5),(6,'Ubicación incorrecta','API Geolocalización devuelve coordenadas erróneas en algunos dispositivos.','2025-04-15 15:00:00',_binary '\0',NULL,'87654321',6),(7,'Mensajes no entregados','API Chat no entrega mensajes cuando el usuario está desconectado.','2025-06-12 18:45:00',_binary '','2025-06-13 14:20:00','87654321',7),(8,'Error al generar PDF','API Reportes falla al exportar reportes grandes.','2025-06-14 16:15:00',_binary '\0',NULL,'87654321',8),(9,'Problema con reservas','API Reservas permite doble reserva en el mismo horario.','2025-06-10 20:30:00',_binary '','2025-06-11 15:00:00','11223344',9),(10,'Sensores sin respuesta','API IoT no recibe datos de algunos dispositivos.','2025-06-18 14:00:00',_binary '\0',NULL,'11223344',10),(11,'Traducción incorrecta','API Traducción traduce mal términos técnicos.','2025-06-25 17:00:00',_binary '','2025-06-26 13:30:00','11223344',11),(12,'Reconocimiento fallido','API Reconocimiento no identifica correctamente imágenes con baja luz.','2025-07-01 22:30:00',_binary '\0',NULL,'99887766',12),(13,'Error en login','API Usuarios rechaza credenciales válidas en entorno de pruebas.','2025-06-05 14:40:00',_binary '','2025-06-05 20:00:00','99887766',1),(14,'Pagos duplicados','API Pagos procesa dos veces la misma transacción.','2025-06-06 15:20:00',_binary '\0',NULL,'99887766',2);
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `nombre` varchar(50) NOT NULL,
  `apellido_paterno` varchar(25) NOT NULL,
  `apellido_materno` varchar(25) NOT NULL,
  `correo` varchar(150) NOT NULL,
  `contrasena` varchar(256) NOT NULL,
  `alias` varchar(45) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `dni` char(8) NOT NULL,
  `fecha_registro` timestamp NOT NULL,
  `estado` bit(1) NOT NULL,
  `idRol` int NOT NULL,
  `idOrganizacion` int DEFAULT NULL,
  PRIMARY KEY (`dni`),
  UNIQUE KEY `dni_UNIQUE` (`dni`),
  KEY `fk_Usuario_Rol_idx` (`idRol`),
  KEY `fk_usuario_equipo1_idx` (`idOrganizacion`),
  CONSTRAINT `fk_usuario_equipo1` FOREIGN KEY (`idOrganizacion`) REFERENCES `organizacion` (`idOrganizacion`),
  CONSTRAINT `fk_Usuario_Rol` FOREIGN KEY (`idRol`) REFERENCES `rol` (`idRol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES ('Luis','Torres','Martínez','qa@gmail.com','$2a$08$IHENpfDGkX8M0hNZKhdZ9eU3e1NJCGv4D.fCP2LUoWgpZF3CA2FH.','qaLuis','11223344','2025-03-01 17:00:00',_binary '',3,NULL),('Carlos','Pérez','García','admin@gmail.com','$2a$08$4NQtBasKpnOOdqEZIf9wX.qelUHa.FkY/HSKQJCsCrKSo3K4ho4eS','Sadmin','12345678','2025-01-01 15:00:00',_binary '',1,NULL),('Pedro','Gómez','Salazar','po.tel@gmail.com','$2a$08$rut1LGTnIjkqCNvBp1KVVuCCq8m5d1XB.IKqk23hsxPi1YpAXjHfW','poPedro','55554444','2025-04-01 14:00:00',_binary '',4,1),('Lucía','Rivas','Morales','po.data@gmail.com','$2a$08$rut1LGTnIjkqCNvBp1KVVuCCq8m5d1XB.IKqk23hsxPi1YpAXjHfW','poLucia','66667777','2025-04-15 14:00:00',_binary '',4,2),('Jorge','Mendoza','Paredes','dev1.tel@gmail.com','$2a$08$7AmTJUjeEKbPSvHVzgdD1.m3BS9g8BzDIxJFZxZYnVeY5RN5j7mbW','devJorge','77778888','2025-05-01 15:30:00',_binary '',2,1),('Ana','López','Ramírez','dev@gmail.com','$2a$08$7AmTJUjeEKbPSvHVzgdD1.m3BS9g8BzDIxJFZxZYnVeY5RN5j7mbW','devAna','87654321','2025-02-01 16:00:00',_binary '',2,NULL),('Sofía','Ramírez','Huamán','qa.tech@gmail.com','$2a$08$IHENpfDGkX8M0hNZKhdZ9eU3e1NJCGv4D.fCP2LUoWgpZF3CA2FH.','qaSofia','88990011','2025-05-10 14:15:00',_binary '',3,1),('Diego','Castro','Valverde','dev2.tech@gmail.com','$2a$08$7AmTJUjeEKbPSvHVzgdD1.m3BS9g8BzDIxJFZxZYnVeY5RN5j7mbW','devDiego','88990022','2025-05-10 14:20:00',_binary '',2,1),('Valeria','Paredes','Quispe','qa.data@gmail.com','$2a$08$IHENpfDGkX8M0hNZKhdZ9eU3e1NJCGv4D.fCP2LUoWgpZF3CA2FH.','qaValeria','88990033','2025-05-12 15:00:00',_binary '',3,2),('Andrés','Salinas','Moreno','dev.data@gmail.com','$2a$08$7AmTJUjeEKbPSvHVzgdD1.m3BS9g8BzDIxJFZxZYnVeY5RN5j7mbW','devAndres','88990044','2025-05-12 15:05:00',_binary '',2,2),('María','Fernández','Castillo','po@gmail.com','$2a$08$rut1LGTnIjkqCNvBp1KVVuCCq8m5d1XB.IKqk23hsxPi1YpAXjHfW','poMaria','99887766','2025-03-15 14:30:00',_binary '',4,NULL);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `versionapi`
--

DROP TABLE IF EXISTS `versionapi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `versionapi` (
  `idVersion` int NOT NULL,
  `version` varchar(45) DEFAULT NULL,
  `estado_version` varchar(45) DEFAULT NULL,
  `fecha_publicacion` timestamp NULL DEFAULT NULL,
  `idAPI` int NOT NULL,
  PRIMARY KEY (`idVersion`),
  KEY `fk_VersionAPI_API1_idx` (`idAPI`),
  CONSTRAINT `fk_VersionAPI_API1` FOREIGN KEY (`idAPI`) REFERENCES `api` (`idAPI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `versionapi`
--

LOCK TABLES `versionapi` WRITE;
/*!40000 ALTER TABLE `versionapi` DISABLE KEYS */;
INSERT INTO `versionapi` VALUES (1,'v1.0','Estable','2025-01-15 15:00:00',1),(2,'v2.0','En pruebas','2025-06-01 14:00:00',1),(3,'v1.0','Estable','2025-02-10 17:00:00',2),(4,'v1.1','Estable','2025-04-05 19:00:00',2),(5,'v1.0','Estable','2025-03-20 14:30:00',3),(6,'v1.0','Estable','2025-04-05 20:00:00',4),(7,'v1.1','En pruebas','2025-06-15 15:00:00',4),(8,'v1.0','Estable','2025-04-25 13:30:00',5),(9,'v1.0','Estable','2025-05-12 21:00:00',6),(10,'v1.0','Estable','2025-05-28 18:40:00',7),(11,'v1.0','Estable','2025-06-04 14:10:00',8),(12,'v1.0','Estable','2025-06-12 20:25:00',9),(13,'v1.0','Estable','2025-06-20 13:55:00',10),(14,'v1.0','Estable','2025-06-28 16:35:00',11),(15,'v1.0','Estable','2025-07-03 22:15:00',12);
/*!40000 ALTER TABLE `versionapi` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-09-21 21:31:01


