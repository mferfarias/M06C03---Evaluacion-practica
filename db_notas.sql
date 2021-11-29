-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: db_notas
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `accion`
--

DROP TABLE IF EXISTS `accion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accion` (
  `accion_id` int NOT NULL AUTO_INCREMENT,
  `nombre_accion` varchar(50) NOT NULL,
  PRIMARY KEY (`accion_id`),
  UNIQUE KEY `nombre_accion_UNIQUE` (`nombre_accion`),
  UNIQUE KEY `accion_id_UNIQUE` (`accion_id`),
  CONSTRAINT `accion_id` FOREIGN KEY (`accion_id`) REFERENCES `accion_usuario_notas` (`accion_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `accion_usuario_notas`
--

DROP TABLE IF EXISTS `accion_usuario_notas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accion_usuario_notas` (
  `accion_usuario_id` int NOT NULL AUTO_INCREMENT,
  `usuario_id` int NOT NULL,
  `nota_id` int NOT NULL,
  `accion_id` int NOT NULL,
  PRIMARY KEY (`accion_usuario_id`),
  UNIQUE KEY `accion_usuario_id_UNIQUE` (`accion_usuario_id`),
  UNIQUE KEY `usuario_id_UNIQUE` (`usuario_id`),
  UNIQUE KEY `nota_id_UNIQUE` (`nota_id`),
  UNIQUE KEY `accion_id_UNIQUE` (`accion_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias` (
  `categoria_id` int NOT NULL AUTO_INCREMENT,
  `categoria_nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`categoria_id`),
  UNIQUE KEY `categoria_id_UNIQUE` (`categoria_id`),
  UNIQUE KEY `categoria_nombre_UNIQUE` (`categoria_nombre`),
  CONSTRAINT `categoria_id` FOREIGN KEY (`categoria_id`) REFERENCES `categorias_notas` (`categoria_notas_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categorias_notas`
--

DROP TABLE IF EXISTS `categorias_notas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias_notas` (
  `categoria_notas_id` int NOT NULL,
  `nota_id` int NOT NULL,
  `categoria_id` int NOT NULL,
  PRIMARY KEY (`categoria_notas_id`),
  UNIQUE KEY `categoria_id_UNIQUE` (`categoria_notas_id`),
  KEY `nota_id_fk` (`nota_id`),
  KEY `categoria_id_.fk` (`categoria_id`),
  CONSTRAINT `categoria_id_.fk` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`categoria_id`),
  CONSTRAINT `nota_id_fk` FOREIGN KEY (`nota_id`) REFERENCES `notas` (`nota_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `eliminar`
--

DROP TABLE IF EXISTS `eliminar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eliminar` (
  `eliminar_id` int NOT NULL AUTO_INCREMENT,
  `permiso_eliminar` varchar(2) NOT NULL,
  PRIMARY KEY (`eliminar_id`),
  UNIQUE KEY `eliminar_id_UNIQUE` (`eliminar_id`),
  UNIQUE KEY `permiso_eliminar_UNIQUE` (`permiso_eliminar`),
  CONSTRAINT `eliminar_id` FOREIGN KEY (`eliminar_id`) REFERENCES `notas` (`eliminar_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `notas`
--

DROP TABLE IF EXISTS `notas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notas` (
  `nota_id` int NOT NULL AUTO_INCREMENT,
  `nota_titulo` varchar(50) NOT NULL,
  `fecha_creacion` date NOT NULL,
  `fecha_ult_modificacion` date NOT NULL,
  `nota_descripcion` varchar(100) NOT NULL,
  `eliminar_id` int NOT NULL,
  PRIMARY KEY (`nota_id`),
  UNIQUE KEY `nota_id_UNIQUE` (`nota_id`),
  UNIQUE KEY `nota_titulo_UNIQUE` (`nota_titulo`),
  UNIQUE KEY `nota_descripcion_UNIQUE` (`nota_descripcion`),
  KEY `eliminar_id_idx` (`eliminar_id`),
  CONSTRAINT `nota_id` FOREIGN KEY (`nota_id`) REFERENCES `accion_usuario_notas` (`nota_id`),
  CONSTRAINT `nota_id_fk2` FOREIGN KEY (`nota_id`) REFERENCES `categorias_notas` (`nota_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `usuario_id` int NOT NULL AUTO_INCREMENT,
  `usuario_nombre` varchar(50) NOT NULL,
  `usuario_email` varchar(50) NOT NULL,
  PRIMARY KEY (`usuario_id`),
  UNIQUE KEY `usuario_id_UNIQUE` (`usuario_id`),
  UNIQUE KEY `usuario_email_UNIQUE` (`usuario_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-29  2:11:32
