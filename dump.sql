-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: contraloria_municipal
-- ------------------------------------------------------
-- Server version	8.0.42

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
-- Table structure for table `REMTySprotesta_categoria`
--

DROP TABLE IF EXISTS `REMTySprotesta_categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REMTySprotesta_categoria` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `descripcion` longtext NOT NULL,
  `activo` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REMTySprotesta_categoria`
--

LOCK TABLES `REMTySprotesta_categoria` WRITE;
/*!40000 ALTER TABLE `REMTySprotesta_categoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `REMTySprotesta_categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REMTySprotesta_registrocontraloria`
--

DROP TABLE IF EXISTS `REMTySprotesta_registrocontraloria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REMTySprotesta_registrocontraloria` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre` longtext NOT NULL,
  `descripcion` longtext NOT NULL,
  `estatus` varchar(50) NOT NULL,
  `fecha_creacion` datetime(6) NOT NULL,
  `fecha_modificacion` datetime(6) NOT NULL,
  `creado_por_id` int DEFAULT NULL,
  `modificado_por_id` int DEFAULT NULL,
  `activo` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `REMTySprotesta_registrocontraloria_creado_por_id_e73d15f1` (`creado_por_id`),
  KEY `REMTySprotesta_registrocontraloria_modificado_por_id_b2c27a0c` (`modificado_por_id`),
  CONSTRAINT `REMTySprotesta_regis_creado_por_id_e73d15f1_fk_auth_user` FOREIGN KEY (`creado_por_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `REMTySprotesta_regis_modificado_por_id_b2c27a0c_fk_auth_user` FOREIGN KEY (`modificado_por_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REMTySprotesta_registrocontraloria`
--

LOCK TABLES `REMTySprotesta_registrocontraloria` WRITE;
/*!40000 ALTER TABLE `REMTySprotesta_registrocontraloria` DISABLE KEYS */;
/*!40000 ALTER TABLE `REMTySprotesta_registrocontraloria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auditoria_registros`
--

DROP TABLE IF EXISTS `auditoria_registros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auditoria_registros` (
  `id` int NOT NULL AUTO_INCREMENT,
  `registro_id` int NOT NULL,
  `accion` enum('CREATE','UPDATE','DELETE') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `datos_anteriores` json DEFAULT NULL,
  `datos_nuevos` json DEFAULT NULL,
  `usuario` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fecha_accion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_registro_id` (`registro_id`),
  KEY `idx_fecha_accion` (`fecha_accion`),
  CONSTRAINT `auditoria_registros_ibfk_1` FOREIGN KEY (`registro_id`) REFERENCES `registros_contraloria` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditoria_registros`
--

LOCK TABLES `auditoria_registros` WRITE;
/*!40000 ALTER TABLE `auditoria_registros` DISABLE KEYS */;
/*!40000 ALTER TABLE `auditoria_registros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `activo` tinyint(1) DEFAULT '1',
  `fecha_creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,'Denuncias Ciudadanas','Registros relacionados con denuncias de la ciudadanía',1,'2025-05-25 00:37:48'),(2,'Control Interno','Procesos de control interno municipal',1,'2025-05-25 00:37:48'),(3,'Transparencia','Registros de transparencia y acceso a la información',1,'2025-05-25 00:37:48'),(4,'Auditorías','Procesos de auditoría municipal',1,'2025-05-25 00:37:48');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `object_repr` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2025-05-25 21:36:37.018032'),(2,'auth','0001_initial','2025-05-25 21:36:37.308420'),(3,'admin','0001_initial','2025-05-25 21:36:37.379086'),(4,'admin','0002_logentry_remove_auto_add','2025-05-25 21:36:37.384109'),(5,'admin','0003_logentry_add_action_flag_choices','2025-05-25 21:36:37.388913'),(6,'contenttypes','0002_remove_content_type_name','2025-05-25 21:36:37.432986'),(7,'auth','0002_alter_permission_name_max_length','2025-05-25 21:36:37.464558'),(8,'auth','0003_alter_user_email_max_length','2025-05-25 21:36:37.483049'),(9,'auth','0004_alter_user_username_opts','2025-05-25 21:36:37.488903'),(10,'auth','0005_alter_user_last_login_null','2025-05-25 21:36:37.519637'),(11,'auth','0006_require_contenttypes_0002','2025-05-25 21:36:37.521297'),(12,'auth','0007_alter_validators_add_error_messages','2025-05-25 21:36:37.526027'),(13,'auth','0008_alter_user_username_max_length','2025-05-25 21:36:37.561071'),(14,'auth','0009_alter_user_last_name_max_length','2025-05-25 21:36:37.594699'),(15,'auth','0010_alter_group_name_max_length','2025-05-25 21:36:37.609684'),(16,'auth','0011_update_proxy_permissions','2025-05-25 21:36:37.615273'),(17,'auth','0012_alter_user_first_name_max_length','2025-05-25 21:36:37.651509'),(18,'sessions','0001_initial','2025-05-25 21:36:37.672039'),(19,'REMTySprotesta','0001_initial','2025-05-26 17:55:39.033876');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registro_categorias`
--

DROP TABLE IF EXISTS `registro_categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registro_categorias` (
  `id` int NOT NULL AUTO_INCREMENT,
  `registro_id` int NOT NULL,
  `categoria_id` int NOT NULL,
  `fecha_asignacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_registro_categoria` (`registro_id`,`categoria_id`),
  KEY `categoria_id` (`categoria_id`),
  CONSTRAINT `registro_categorias_ibfk_1` FOREIGN KEY (`registro_id`) REFERENCES `registros_contraloria` (`id`) ON DELETE CASCADE,
  CONSTRAINT `registro_categorias_ibfk_2` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registro_categorias`
--

LOCK TABLES `registro_categorias` WRITE;
/*!40000 ALTER TABLE `registro_categorias` DISABLE KEYS */;
INSERT INTO `registro_categorias` VALUES (1,7,1,'2025-05-25 00:37:48');
/*!40000 ALTER TABLE `registro_categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registros_atencion_ciudadana`
--

DROP TABLE IF EXISTS `registros_atencion_ciudadana`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registros_atencion_ciudadana` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `descripcion` text,
  `estatus` varchar(50) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `fecha_modificacion` datetime DEFAULT NULL,
  `creado_por` varchar(100) DEFAULT NULL,
  `modificado_por` varchar(100) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registros_atencion_ciudadana`
--

LOCK TABLES `registros_atencion_ciudadana` WRITE;
/*!40000 ALTER TABLE `registros_atencion_ciudadana` DISABLE KEYS */;
INSERT INTO `registros_atencion_ciudadana` VALUES (4,'ATENCIÓN CIUDADANA EN MÓDULO PRESENCIAL, ATENCIÓN TELEFÓNICA, APP MÓVIL O PÁGINA WEB','Se brinda atención a diversas solicitudes de servicios que realiza la ciudadanía a través de la aplicación móvil denominada Atizapán te escucha, vía web, presencial en el módulo de atención ciudadana y en el miércoles ciudadano, así como atención telefónica; de igual forma se realiza la canalización al área correspondiente, y se da el seguimiento para la pronta respuesta al ciudadano.','PUBLICADO',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `registros_atencion_ciudadana` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registros_contraloria`
--

DROP TABLE IF EXISTS `registros_contraloria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registros_contraloria` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `estatus` enum('PUBLICADO','BORRADOR','REVISION','ARCHIVADO') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'BORRADOR',
  `fecha_creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_modificacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `creado_por` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modificado_por` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activo` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_estatus` (`estatus`),
  KEY `idx_fecha_creacion` (`fecha_creacion`),
  KEY `idx_activo` (`activo`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registros_contraloria`
--

LOCK TABLES `registros_contraloria` WRITE;
/*!40000 ALTER TABLE `registros_contraloria` DISABLE KEYS */;
INSERT INTO `registros_contraloria` VALUES (7,'Denuncia Ciudadana por escrito, vía telefónica, presencial y en línea ante el Órgano Interno de Control Municipal (Subdirección Investigadora)','Recibir, tramitar, integrar, investigar y dar seguimiento de las denuncias en contra de servidores públicos municipales y/o particulares en situaciones previstas en la normatividad aplicable, por acciones y/u omisiones cometidas en el ejercicio de sus funciones como servidores públicos y/o prestadores de algún servicio.','PUBLICADO','2025-05-25 00:37:47','2025-05-27 00:27:07','Sistema',NULL,1);
/*!40000 ALTER TABLE `registros_contraloria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registros_derechos_humanos`
--

DROP TABLE IF EXISTS `registros_derechos_humanos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registros_derechos_humanos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `descripcion` text,
  `estatus` varchar(50) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `fecha_modificacion` datetime DEFAULT NULL,
  `creado_por` varchar(100) DEFAULT NULL,
  `modificado_por` varchar(100) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=284 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registros_derechos_humanos`
--

LOCK TABLES `registros_derechos_humanos` WRITE;
/*!40000 ALTER TABLE `registros_derechos_humanos` DISABLE KEYS */;
INSERT INTO `registros_derechos_humanos` VALUES (1,'nosep','lol','PUBLICADO','2025-05-24 18:38:48','2025-05-29 16:41:49','Sistema',NULL,0),(2,'nose','tampco','PUBLICADO','2025-05-24 18:38:48','2025-05-29 16:41:49','Sistema',NULL,1),(166,'Teatro Guiñol, se realiza de forma personal, por escrito o vía telefónica y es otorgada por el área de Diversidad y Grupos de situación de Vulnerabilidad','Consiste en llevar a cabo una representación teatral con títeres en escuelas de los niveles de primaria y secundaria, con el tema derechos de las niñas y los niños, que puede ser vista por infantes a partir de 5 años hasta adolescentes.','PUBLICADO',NULL,NULL,NULL,NULL,NULL),(172,'Platicas preventivas con temas de interés social y Derechos Humanos; se realiza de manera personal y vía telefónica, este servicio es otorgado por la Coordinación de Investigación y Políticas Publicas.','Se imparten platicas tanto a padres de familia como a servidores públicos, personal docente y administrativo para fomentar que se lleve una vida digna y prevenir existan riegos entre la población mas vulnerable .','PUBLICADO',NULL,NULL,NULL,NULL,NULL),(173,'Platicas Informativas con temas alusivos a los Derechos Humanos; se realiza de manera escrita y vía telefónica, este servicio lo proporciona la Coordinación de Investigación y Políticas Públicas.','Consiste en impartir platicas en escuelas primarias, secundarias, nivel medio superior y/o universidades, a  padres de familia, personal docente, administrativo y servidores públicos para prevenir la violación a sus derechos entre la población como un derecho humano, a través de información oportuna;  platicas informativas que fomenten una vida digna y sin riesgos como derecho humano entre la población más vulnerable y prevenir los mismos entre los menores como derecho humano (redes sociales, prevención de abuso sexual, entre otros).','PUBLICADO',NULL,NULL,NULL,NULL,NULL),(270,'Queja en contra de autoridades o servidores públicos por presuntas violaciones a Derechos Humanos, se realiza de forma personal y es otorgada por el área de Orientación y Quejas.','Consiste en recibir las quejas de los ciudadanos por haberse cometido en su contra presuntas violaciones a sus derechos humanos realizadas por servidores públicos municipales o estatales para así ser remitidas a la visitaduría correspondiente y ellos le den el seguimiento correspondiente.','PUBLICADO',NULL,NULL,NULL,NULL,NULL),(283,'Asesoría Jurídica se realiza de manera personal, por vía telefónica y lo otorga el área de Orientación y Quejas.','Consiste en brindar asesoría jurídica en las diversas ramas del derecho, a personas que así lo soliciten, brindando prioridad a las personas que se encuentren en situación de vulnerabilidad y/o discriminación, ya sea de manera personal o telefónica.','PUBLICADO',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `registros_derechos_humanos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registros_desarrollo_economico`
--

DROP TABLE IF EXISTS `registros_desarrollo_economico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registros_desarrollo_economico` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `descripcion` text,
  `estatus` varchar(50) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `fecha_modificacion` datetime DEFAULT NULL,
  `creado_por` varchar(100) DEFAULT NULL,
  `modificado_por` varchar(100) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registros_desarrollo_economico`
--

LOCK TABLES `registros_desarrollo_economico` WRITE;
/*!40000 ALTER TABLE `registros_desarrollo_economico` DISABLE KEYS */;
/*!40000 ALTER TABLE `registros_desarrollo_economico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registros_desarrollo_social`
--

DROP TABLE IF EXISTS `registros_desarrollo_social`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registros_desarrollo_social` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `descripcion` text,
  `estatus` varchar(50) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `fecha_modificacion` datetime DEFAULT NULL,
  `creado_por` varchar(100) DEFAULT NULL,
  `modificado_por` varchar(100) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=334 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registros_desarrollo_social`
--

LOCK TABLES `registros_desarrollo_social` WRITE;
/*!40000 ALTER TABLE `registros_desarrollo_social` DISABLE KEYS */;
INSERT INTO `registros_desarrollo_social` VALUES (8,'Apoyo a deportistas destacados, se realiza por escrito y es otorgado a través de la Subdirección del Deporte.','Consiste en evaluar y dar seguimiento a deportistas del municipio para que con base al mérito deportivo se determine el monto y/o tipo de apoyo a entregar.','PUBLICADO',NULL,NULL,NULL,NULL,NULL),(9,'Donación de material deportivo y/o uniformes deportivos, se solicita por escrito y lo otorga la Subdirección de Deporte.','Consiste en atender la solicitud de donación de material deportivo a personas físicas, morales e instituciones públicas, así como a equipos independientes o pertenecientes a una liga o asociación que de alguna manera realicen o quieran realizar actividad física o deportiva teniendo como principal objetivó impulsar la práctica deportiva.','PUBLICADO',NULL,NULL,NULL,NULL,NULL),(10,'Planeación y coordinación de eventos especiales, se solicita por escrito y lo otorga la Subdirección de Deporte.','Consiste en llevar a cabo eventos especiales de diferentes disciplinas, dirigidas a niños, niñas, adolescentes, adultos, adultos mayores y personas con discapacidad, con la finalidad de fomentar el deporte entre la población Atizapense; con la participación de los sectores social y privado a través de la Subdirección del Deporte para que en su conjunto fomenten la promoción y desarrollo de la Cultura Física y Deporte.','PUBLICADO',NULL,NULL,NULL,NULL,NULL),(11,'Inscripción para actividades, cursos y talleres, se realiza de manera presencial y lo otorga la Subdirección de Concertación Social.','Consiste en llevar a cabo actividades, cursos y talleres tales como terapia psicológica, meditación, zumba, yoga, curso de uñas, regularización escolar, lima lama, video y actuación, zumba kids, guitarra, curso de barbería, curso de comida internacional, curso de panadería, curso de masaje, curso de baile de salón, arte para niños, kínder yoga, danza árabe, taller de lectura y escritura, cuidado de la piel y maquillaje en los espacios públicos conocidos como módulos PREP.','PUBLICADO',NULL,NULL,NULL,NULL,NULL),(12,'Talleres Culturales, se realiza de manera presencial y son impartidos en la Subdirección de Cultura.','Consiste en la impartición de talleres, clases, cursos y diversas actividades relacionadas con la cultura y el arte, tales como pintura, dibujo, ajedrez, danza folclórica y piano en las instalaciones designadas para ello.','PUBLICADO',NULL,NULL,NULL,NULL,NULL),(13,'Talleres Musicales, se realiza de manera presencial y son impartidos en la Subdirección de Cultura (Casa de música).','Consiste en impartir talleres en las instalaciones de la casa de música con la finalidad de fomentar la cultura y el arte en la población atizapense, con clases de violín, viola, contrabajo, piano, canto, guitarra, trompeta y cello.','PUBLICADO',NULL,NULL,NULL,NULL,NULL),(14,'Uso del Centro Municipal de Cultura y Arte, se solicita por escrito y lo otorga la Subdirección de Cultura.','Consiste en prestar las instalaciones del Centro Municipal de Cultura y Arte a personas físicas, jurídicas colectivas o instituciones públicas, privadas y/o religiosas, para la realización de eventos con fines Culturales, Artísticos y Recreativos con el propósito de fomentar la cultura entre la población Atizapense.','PUBLICADO',NULL,NULL,NULL,NULL,NULL),(15,'Uso de las instalaciones del Teatro Zaragoza, se realiza por escrito y lo otorga la Subdirección de Cultura','Consiste en prestar las instalaciones del Teatro Zaragoza a personas físicas, jurídicas, colectivas, instituciones públicas, privadas y/o religiosas para fines culturales, artísticos y recreativos, con la finalidad de fomentar la cultura entre la población.','PUBLICADO',NULL,NULL,NULL,NULL,NULL),(16,'Uso y Aprovechamiento de las Instalaciones Deportivas Municipales para la realización de actividades deportivas o recreativas, se realiza por escrito y lo otorga la Subdirección de Deporte.','Consiste en llevar a cabo competencias deportivas en diferentes disciplinas, dirigidas a niños, niñas, adolescentes, adultos, adultos mayores y personas con discapacidad, con la finalidad de fomentar el deporte entre la población Atizapense; con la participación de los sectores social y privado a través de la Subdirección del Deporte para que en su conjunto fomenten la promoción y desarrollo de la Cultura Física y Deporte.','PUBLICADO',NULL,NULL,NULL,NULL,NULL),(30,'Becas Escolares Municipales, se realiza en línea por el departamento de Becas a través de la Subdirección de Educación.','El Programa Municipal de Becas Escolares, impulsado por el H. Ayuntamiento de Atizapán de Zaragoza, está dirigido a estudiantes que se encuentren cursando la educación básica (primaria y secundaria), media superior y superior (licenciatura) en el sector público y que, por diferentes motivos, como factores económicos o algún tipo de discapacidad, se encuentren en situación de vulnerabilidad para continuar o concluir con su educación. Asimismo, se busca reconocer e incentivar a aquellos estudiantes que presenten un desempeño académico sobresaliente.El programa se ejercerá en tres vertientes; vulnerabilidad económica, excelencia académica y diferentes discapacidades. Buscando con esto disminuir las carencias económicas de las familias Atizapenses.','PUBLICADO',NULL,NULL,NULL,NULL,NULL),(31,'Credencialización para préstamo de libros a domicilio, que se realiza de manera presencial en las diferentes Bibliotecas municipales.','Consiste en expedir al usuario de bibliotecas una credencial para solicitar en préstamo los libros de su interés','PUBLICADO',NULL,NULL,NULL,NULL,NULL),(32,'Preparatoria Abierta, es un trámite que se realiza de manera presencial por la Subdirección de Educación.','Consiste en registrar y dar seguimiento a todo el personal interesado en iniciar, continuar o concluir sus estudios a nivel bachillerato dándoles la facilidad de recibir orientación y asesorías para que fortalezcan su proceso de estudios y aprendizaje para que a su vez puedan solicitar un examen académico con base al plan de estudios elegidos en la oficina de preparatoria abierta.','PUBLICADO',NULL,NULL,NULL,NULL,NULL),(33,'Préstamo de libros a domicilio que el servicio es de manera presencial en las distintas Biblioteca s municipales.','Consiste en autorizar al usuario llevar fuera de la biblioteca algún libro de su interés','PUBLICADO',NULL,NULL,NULL,NULL,NULL),(34,'Préstamo de libros en bibliotecas públicas es un servicio que se realiza de manera presencial en las distintas Bibliotecas Municipales','Consiste en atender de forma gratuita a toda persona que solicite la consulta o préstamo del acervo que tienen las bibliotecas públicas municipales.','PUBLICADO',NULL,NULL,NULL,NULL,NULL),(35,'Visitas guiadas en la biblioteca pública, es un servicio que se realiza de manera presencial en las distintas Bibliotecas Municipales.','Consiste en realizar un recorrido para una persona o a un grupo de personas, por las instalaciones de la biblioteca municipal, explicando de manera sencilla los servicios que se ofrecen, sus características, los requisitos para su uso y el horario de servicio.','PUBLICADO',NULL,NULL,NULL,NULL,NULL),(331,'Expedición de beca de natación, se solicita por escrito y lo otorga la Dirección de Desarrollo Social.','Expedición de beca de natación, se solicita por escrito y lo otorga la Dirección de Desarrollo Social.','PUBLICADO',NULL,NULL,NULL,NULL,NULL),(332,'Uso y Aprovechamiento de los Sanitarios en las Instalaciones Deportivas Municipales, se realiza por escrito y lo otorga la Subdirección de Deporte.','Consiste en la prestación de los sanitarios dentro de las Instalaciones Deportivas Municipales para el uso y aprovechamiento de las mismas.','PUBLICADO',NULL,NULL,NULL,NULL,NULL),(333,'Uso y Aprovechamiento de las Instalaciones Deportivas Municipales para la realización de eventos o torneos de liga, se realiza por escrito y lo otorga la Subdirección de Deporte.','Consiste en llevar a cabo competencias deportivas en diferentes disciplinas, dirigidas a niños, niñas, adolescentes, adultos, adultos mayores y personas con discapacidad, con la finalidad de fomentar el deporte entre la población Atizapense; con la participación de los sectores social y privado a través de la Subdirección del Deporte para que en su conjunto fomenten la promoción y desarrollo de la Cultura Física y Deporte.','PUBLICADO',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `registros_desarrollo_social` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registros_dif_municipal`
--

DROP TABLE IF EXISTS `registros_dif_municipal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registros_dif_municipal` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `descripcion` text,
  `estatus` varchar(50) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `fecha_modificacion` datetime DEFAULT NULL,
  `creado_por` varchar(100) DEFAULT NULL,
  `modificado_por` varchar(100) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=178 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registros_dif_municipal`
--

LOCK TABLES `registros_dif_municipal` WRITE;
/*!40000 ALTER TABLE `registros_dif_municipal` DISABLE KEYS */;
INSERT INTO `registros_dif_municipal` VALUES (62,'Asesoría Jurídica en Materia Familiar de forma presencial que otorga la Procuraduría Municipal de Niños, Niñas y Adolescentes.','Consiste en proporcionar asesoría jurídica a los habitantes del Municipio de Atizapán de Zaragoza, sobre asuntos en materia familiar, por lo que dependiendo del tema concreto se determina sí se inicia un juicio o se procede a un convenio extrajudicial.','PUBLICADO',NULL,NULL,NULL,NULL,NULL),(63,'Consulta Médica en Unidades Móviles de forma presencial que otorga la Subdirección Médica.','Consiste en otorgar Consulta Médica de Primer Nivel en Unidades Móviles en el territorio Municipal a la población que se encuentra en estado de vulnerabilidad.','PUBLICADO',NULL,NULL,NULL,NULL,NULL),(64,'Taller de Escuela para Padres de forma presencial que otorga la Subdirección de Asistencia Social.','Consiste en otorgar a instituciones educativas públicas y privadas del Municipio pláticas, talleres y conferencias, dirigidas a madres y padres de familia a fin de mejorar la calidad de vida de sus integrantes a través de acciones preventivas educativas del programa “Escuela para Padres”, dando seguimiento a casos de Juzgados.','PUBLICADO',NULL,NULL,NULL,NULL,NULL),(65,'Pláticas, Talleres o Terapias Psicológicas de Fomento a la Integración Familiar de forma presencial que otorgar la Procuraduría Municipal de Niñas, Niños y Adolescentes.','Consiste en impartir pláticas y talleres de fomento a la integración familiar en instalaciones establecidas en el territorio Municipal, a núcleos familiares para mejorar la calidad de vida de todos sus integrantes, aportando conocimientos sobre las relaciones de pareja y como ejercer una maternidad y paternidad que conduzcan a impulsar relaciones más afectivas, estrechas y flexibles hacia los hijos para ayudarlos a concretar sus proyectos en los diferentes aspectos de la vida.','PUBLICADO',NULL,NULL,NULL,NULL,NULL),(94,'Convenio Extrajudicial en Materia Familiar de forma presencial que otorga la Procuraduría Municipal de Niñas, Niños y Adolescentes.','Consiste en elaborar un convenio conforme al acuerdo de voluntades de las partes involucradas, para resolver un conflicto entre particulares en materia familiar respecto a la Guarda y Custodia, Pensión Alimenticia y/o Régimen de Visitas, vigilando el interés superior del menor.','PUBLICADO',NULL,NULL,NULL,NULL,NULL),(95,'Entrega de Desayunos del programa Alimentación Escolar para el Bienestar de forma presencial que otorga la Subdirección de Asistencia Social.','El Programa de Desarrollo Social “Alimentación Escolar para el Bienestar” tiene como propósito favorecer el acceso y consumo de alimentos nutritivos e inocuos a la población de atención prioritaria, que asiste a planteles públicos del Sistema Educativo del Estado de México, mediante la entrega de Desayunos Escolares Fríos o Calientes, diseñados con base en Criterios de Calidad Nutricia e inocuidad, con pertinencia cultural, acompañados de acciones de Orientación y Educación Alimentaria que incentiven la compra de productos locales a pequeños productores o pequeños comercios, así como que promuevan la agricultura familiar y sostenible, contribuyendo a un estado de nutrición adecuado.','PUBLICADO',NULL,NULL,NULL,NULL,NULL),(97,'Servicio de Estancias Infantiles de forma presencial que otorga la Subdirección de Asistencia Social.','Consiste en brindar el servicio de Guarda y Estancia a los hijos de madres y padres trabajadores que cumplan con un rango de edad de 3 meses a 3 años, proporcionándoles la debida estimulación integral, a través de ejercicios de motricidad fina, motricidad gruesa, lenguaje social y conocimiento, reforzando su conducta y educación a través de Escuela para Padres.','PUBLICADO',NULL,NULL,NULL,NULL,NULL),(99,'Estudio Socioeconómico de forma presencial que otorga por la Procuraduría Municipal de Niños, Niñas y Adolescentes.','Consiste en tramitar en el área de trabajo social, un estudio socioeconómico que acredite ante una institución pública o privada los ingresos o situación económica y social de un ciudadano.','PUBLICADO',NULL,NULL,NULL,NULL,NULL),(107,'Pláticas y Talleres de Psicología de forma presencial que otorga la Procuraduría Municipal de Niñas, Niños y Adolescentes.','Consiste en impartir pláticas y talleres encaminados a la promoción de la salud mental y la prevención de riesgos psicoemocionales, dirigidos a instituciones públicas; escuelas, hospitales que se encuentren dentro del municipio de Atizapán de Zaragoza, con una temática sobre la prevención de adicciones, explotación sexual infantil, salud mental, depresión, equidad de género, embarazo adolescente, conductas de riesgo en la adolescencia y derechos de las niñas, niños y adolescentes.','PUBLICADO',NULL,NULL,NULL,NULL,NULL),(177,'Atención Psicológica de forma presencial que otorga la Procuraduría Municipal de Protección de Niñas, Niños y Adolescentes.','Consiste en brindar atención psicológica a la población que así los solicite, puede ser de forma individual, en pareja o familiar, con la intención de restablecer el bienestar emocional; el servicio se ofrece en las oficinas centrales o en las unidades establecidas dentro del territorio Municipal.','PUBLICADO',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `registros_dif_municipal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registros_direccion_administracion`
--

DROP TABLE IF EXISTS `registros_direccion_administracion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registros_direccion_administracion` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `descripcion` text,
  `estatus` varchar(50) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `fecha_modificacion` datetime DEFAULT NULL,
  `creado_por` varchar(100) DEFAULT NULL,
  `modificado_por` varchar(100) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registros_direccion_administracion`
--

LOCK TABLES `registros_direccion_administracion` WRITE;
/*!40000 ALTER TABLE `registros_direccion_administracion` DISABLE KEYS */;
INSERT INTO `registros_direccion_administracion` VALUES (6,'Obtención de \"Cédula de Proveedor de Bienes y/o Prestador de Servicios\", Trámite que se realiza de forma Presencial, otorgada por la subdirección de Recursos Materiales','Registro en el catálogo de proveedores de bienes  y   prestadores de servicios.','PUBLICADO',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `registros_direccion_administracion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registros_direccion_juventud`
--

DROP TABLE IF EXISTS `registros_direccion_juventud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registros_direccion_juventud` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `descripcion` text,
  `estatus` varchar(50) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `fecha_modificacion` datetime DEFAULT NULL,
  `creado_por` varchar(100) DEFAULT NULL,
  `modificado_por` varchar(100) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=276 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registros_direccion_juventud`
--

LOCK TABLES `registros_direccion_juventud` WRITE;
/*!40000 ALTER TABLE `registros_direccion_juventud` DISABLE KEYS */;
INSERT INTO `registros_direccion_juventud` VALUES (271,'Cursos y Talleres gratuitos para jóvenes de 12 a 29 años de edad del Municipio de Atizapán de Zaragoza que otorga la Dirección de la Juventud a través del Departamento de Vinculación y Fortalecimiento Juvenil.','La Dirección de la Juventud ofrece cursos y talleres en los que los jóvenes atizapenses puedan desarrollar y fortalecer sus conocimientos y habilidades a través de su participación y hacer un mejor uso y aprovechamiento del tiempo libre, mejorando su calidad de vida.  Los cursos actualmente son Dibujo y Pintura, Inglés, Karate, Tai-Chi, Barbería y COMIPEMS.','PUBLICADO',NULL,NULL,NULL,NULL,NULL),(274,'Giras de servicio “Por un Mejor Futuro” que coordina y realiza la Dirección de la Juventud a través del Departamento de Vinculación y Fortalecimiento Juvenil.','La Dirección de la Juventud coordina y realiza la vinculación con las instancias gubernamentales de los tres niveles (Federal, Estatal y Municipal), así como,  asociaciones civiles, empresas e instituciones educativas para acercar sus trámites y servicios a las juventudes atizapenses.','PUBLICADO',NULL,NULL,NULL,NULL,NULL),(275,'Pláticas en Instituciones Públicas Educativas en el Municipio de Atizapán  de Zaragoza que imparte la Dirección de la Juventud a través del Departamento de Programas y Política Juvenil','La Dirección de la Juventud realiza pláticas informativas sobre sexualidad, prevención del embarazo y las enfermedades de transmisión sexual, CiberBulying, violencia en el noviazgo y prevención de adiciones  en las Instituciones Públicas dentro del territorio municipal, con el objetivo de propiciar el libre desarrollo psicosocial y psicosexual de las juventudes atizapenses.','PUBLICADO',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `registros_direccion_juventud` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registros_direccion_mujeres`
--

DROP TABLE IF EXISTS `registros_direccion_mujeres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registros_direccion_mujeres` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `descripcion` text,
  `estatus` varchar(50) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `fecha_modificacion` datetime DEFAULT NULL,
  `creado_por` varchar(100) DEFAULT NULL,
  `modificado_por` varchar(100) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registros_direccion_mujeres`
--

LOCK TABLES `registros_direccion_mujeres` WRITE;
/*!40000 ALTER TABLE `registros_direccion_mujeres` DISABLE KEYS */;
INSERT INTO `registros_direccion_mujeres` VALUES (46,'Asesoría Jurídica, se realiza de manera presencial y vía telefónica;  es otorgado por el Departamento de Gestión y Atención a la Mujer','Consiste en brindar atención y asesoría jurídica a las ciudadanas que requieran certeza jurídica sobre actos o hechos respecto a  la interpretación y aplicación de las leyes en cualquiera de sus materias, con la finalidad de atender las necesidades de las mujeres del municipio.','PUBLICADO',NULL,NULL,NULL,NULL,NULL),(47,'Atención psicológica, se realiza de manera presencial y es otorgado por el Departamento de Gestión y Atención a la Mujer','Consiste en brindar el servicio de psicología a las ciudadanas que se acerquen solicitando el servicio, ya sea en temas familiares, de mujeres en situación de violencia o algún otro que requiera de atención psicológica dentro de las instalaciones del Instituto de la Mujer.','PUBLICADO',NULL,NULL,NULL,NULL,NULL),(49,'Bolsa de empleo a las ciudadanas por conducto de la Dirección de las Mujeres, se realiza de manera presencial y vía telefónica; es otorgado por el Departamento de Apoyo a Emprendedoras','Consiste en canalizar a las ciudadanas que buscan una oportunidad de empleo, a las empresas que proporcionan las vacantes existentes dentro de la misma.','PUBLICADO',NULL,NULL,NULL,NULL,NULL),(50,'Capacitación de Género, se realiza por vía telefónica y mediante un escrito; es otorgado por el Departamento de Programas Institucionales','Consiste en capacitar a las personas de instituciones gubernamentales y no gubernamentales en perspectiva de género. En oficinas públicas, empresas y escuelas del territorio municipal.','PUBLICADO',NULL,NULL,NULL,NULL,NULL),(51,'Pláticas para prevenir la violencia, se realiza por vía telefónica y mediante un escrito; es otorgado por el Departamento de Programas Institucionales','Consiste en brindar pláticas en las instituciones educativas de todos los niveles para prevenir la violencia.','PUBLICADO',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `registros_direccion_mujeres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registros_juridico_consultivo`
--

DROP TABLE IF EXISTS `registros_juridico_consultivo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registros_juridico_consultivo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `descripcion` text,
  `estatus` varchar(50) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `fecha_modificacion` datetime DEFAULT NULL,
  `creado_por` varchar(100) DEFAULT NULL,
  `modificado_por` varchar(100) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=145 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registros_juridico_consultivo`
--

LOCK TABLES `registros_juridico_consultivo` WRITE;
/*!40000 ALTER TABLE `registros_juridico_consultivo` DISABLE KEYS */;
INSERT INTO `registros_juridico_consultivo` VALUES (54,'Acreditación del Concubinato, de forma presencial y lo otorga la Coordinación de Bufete Jurídico.','Consiste en patrocinar el procedimiento que se tramita ante un Juez del Orden Familiar, con la finalidad de acreditar el concubinato, esto es, demostrar que un hombre y una mujer vivieron juntos durante cierto tiempo sin que existiera un vínculo matrimonial entre ello, adquiriendo ambos, derechos y obligaciones.','PUBLICADO',NULL,NULL,NULL,NULL,NULL),(55,'Asesoría Jurídica a la Población,  de forma presencial y lo otorga la Coordinación de Bufete Jurídico.','Consiste en ofrecer asistencia técnica jurídica a la población que acude a la Dirección Jurídica y Consultiva, con el fin de dar un asesoramiento legal, emitiendo una opinión profesional con relación a una situación concreta y particular.','PUBLICADO',NULL,NULL,NULL,NULL,NULL),(56,'Denuncia de Violencia Familiar ante el Juez de Primera Instancia,  de forma presencial y lo otorga la Coordinación de Bufete Jurídico.','Consiste en patrocinar la demanda de la persona que sufre violencia por parte de alguno de los integrantes del grupo familiar, de estos hechos ante el Juez de 1° Instancia.','PUBLICADO',NULL,NULL,NULL,NULL,NULL),(57,'Dependencia Económica, de forma presencial y lo otorga la Coordinación de Bufete Jurídico.','Consiste en patrocinar el procedimiento que se tramita ante un Juez del Orden Familiar, con la finalidad de demostrar la dependencia económica a efecto de acreditar que los hijos, padres, esposos o concubinos dependen económicamente de otra persona.','PUBLICADO',NULL,NULL,NULL,NULL,NULL),(58,'Divorcio Incausado, de forma presencial y lo otorga la Coordinación de Bufete Jurídico.','Consiste en patrocinar el procedimiento que se tramita ante un Juez del Orden Familiar, a efecto de disolver el Matrimonio y dejar a los cónyuges en aptitud de contraer otro; lo puede tramitar cualquiera de los cónyuges sin que exista la necesidad de señalar la razón que lo motiva.','PUBLICADO',NULL,NULL,NULL,NULL,NULL),(59,'Divorcio por Mutuo Consentimiento, de forma presencial y lo otorga la Coordinación de Bufete Jurídico.','Consiste en patrocinar el procedimiento que se tramita ante un Juez del Orden Familiar, a efecto de disolver de forma voluntaria el Matrimonio y deja a los cónyuges en aptitud de contraer otro.','PUBLICADO',NULL,NULL,NULL,NULL,NULL),(60,'Guardia y Custodia, de forma presencial y lo otorga la Coordinación de Bufete Jurídico.','Consiste en patrocinar el procedimiento que se tramita ante un Juez del Orden Familiar, con el fin de obtener legalmente la guardia y custodia del menor o menores hijos, una vez disuelto el vínculo matrimonial o en su caso dentro del matrimonio o concubinato.','PUBLICADO',NULL,NULL,NULL,NULL,NULL),(61,'Identidad de Persona, de forma presencial y lo otorga la Coordinación de Bufete Jurídico.','Consiste en patrocinar el procedimiento que se tramita ante un Juez del Orden Familiar, con el fin de demostrar que una persona que tiene diversos nombres apellidos o letras en su documentación es la misma persona.','PUBLICADO',NULL,NULL,NULL,NULL,NULL),(139,'Rectificación de Acta del Estado Civil, de forma presencial y lo otorga la Coordinación de Bufete Jurídico.','Consiste en patrocinar el procedimiento que se tramita ante un Juez del Orden Familiar, con el fin de corregir la omisión o error de un Acta del Estado Civil.','PUBLICADO',NULL,NULL,NULL,NULL,NULL),(141,'Pensión Alimenticia, de forma presencial y lo otorga la Coordinación de Bufete Jurídico.','Consiste en patrocinar el procedimiento que se tramita ante un Juez del Orden Familiar, con el fin de obtener una cantidad en dinero para la manutención de los hijos menores o que siendo mayores de edad, se dediquen al estudio, los discapacitados, los adultos mayores, así como el cónyuge o concubina que se haya dedicado preponderantemente a las labores del hogar.','PUBLICADO',NULL,NULL,NULL,NULL,NULL),(142,'Sucesión Intestamentaría  de Tramitación Especial, de forma presencial y lo otorga la Coordinación de Bufete Jurídico.','Consiste en patrocinar el procedimiento que se tramita ante un Juez del Orden Familiar, cuando no se dejó disposición testamentaria alguna y no existe conflicto entre los herederos.','PUBLICADO',NULL,NULL,NULL,NULL,NULL),(143,'Sucesión Testamentaríal, de forma presencial y lo otorga la Coordinación de Bufete Jurídico.','Consiste en patrocinar el procedimiento que se tramita ante un Juez del Orden Familiar, cuando existe disposición testamentaria.','PUBLICADO',NULL,NULL,NULL,NULL,NULL),(144,'Trámite de Testamento, de forma presencial y lo otorga la Coordinación de Bufete Jurídico.','Consiste en brindar la asesoría a la ciudadanía en general a efecto de  que  realicen su testamento, fomentando así una cultura de prevención, certeza y seguridad jurídica de sus bienes.','PUBLICADO',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `registros_juridico_consultivo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registros_obras_publicas`
--

DROP TABLE IF EXISTS `registros_obras_publicas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registros_obras_publicas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `descripcion` text,
  `estatus` varchar(50) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `fecha_modificacion` datetime DEFAULT NULL,
  `creado_por` varchar(100) DEFAULT NULL,
  `modificado_por` varchar(100) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=138 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registros_obras_publicas`
--

LOCK TABLES `registros_obras_publicas` WRITE;
/*!40000 ALTER TABLE `registros_obras_publicas` DISABLE KEYS */;
INSERT INTO `registros_obras_publicas` VALUES (66,'Aviso de modificación a la información en el catálogo de contratistas, trámite que se realizar de manera escrita, presencial y lo otorga la Subdirección de Gestión y  Control.','Dar aviso de la modificación de la información de razón social y domicilio que presenten las personas inscritas en el catálogo de contratistas.','PUBLICADO',NULL,NULL,NULL,NULL,NULL),(67,'Inscripción en el Catálogo de Contratistas del Municipio de Atizapán de Zaragoza, trámite que se realiza de manera escrita, presencial y lo otorga la Subdirección de Gestión y Control.','Consiste en realizar la inscripción al catálogo de contratistas de los solicitantes que deseen participar en los procedimientos de contratación de obra pública mediante invitación restringida, adjudicación directa o licitación pública, que lleve a cabo el Ayuntamiento de Atizapán de Zaragoza','PUBLICADO',NULL,NULL,NULL,NULL,NULL),(127,'Visto Bueno para instalaciones subterráneas y/o aéreas en la vía pública, trámite que se realiza de manera escrita, presencial y lo otorga la Subdirección de Obras de Equipamiento Urbano.','Consiste en solicitar el visto bueno para instalaciones y así obtener la autorización correspondiente para la utilización del subsuelo y del espacio aéreo en la vía pública.','PUBLICADO',NULL,NULL,NULL,NULL,NULL),(136,'Revalidación del Registro de Inscripción en el Catálogo de Contratistas, trámite que se realiza de manera escrita, presencial y lo otorga la Subdirección de Gestión y Control.','Consiste en revalidar el registro de inscripción el en catálogo de contratistas para participar como contratistas de obras públicas y servicios mediante procedimientos de invitación restringida, adjudicación directa o licitación Pública, que lleve a cabo el Ayuntamiento de Atizapán de Zaragoza.','PUBLICADO',NULL,NULL,NULL,NULL,NULL),(137,'Apoyo 50/50, trámite que se realiza de manera escrita, presencial y lo otorga la subdirección de Movilidad e Infraestructura Urbana.','Consiste en proporcionar materiales para la construcción de banquetas, guarniciones y pavimento, a la población que así lo requiera dentro del territorio municipal, siempre que estén dispuestos a proporcionar la mano de obra, previo dictamen de factibilidad emitido por la Dirección General de Obras Públicas.','PUBLICADO',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `registros_obras_publicas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registros_ordenamiento_territorial`
--

DROP TABLE IF EXISTS `registros_ordenamiento_territorial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registros_ordenamiento_territorial` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `descripcion` text,
  `estatus` varchar(50) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `fecha_modificacion` datetime DEFAULT NULL,
  `creado_por` varchar(100) DEFAULT NULL,
  `modificado_por` varchar(100) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registros_ordenamiento_territorial`
--

LOCK TABLES `registros_ordenamiento_territorial` WRITE;
/*!40000 ALTER TABLE `registros_ordenamiento_territorial` DISABLE KEYS */;
/*!40000 ALTER TABLE `registros_ordenamiento_territorial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registros_primera_sindicatura`
--

DROP TABLE IF EXISTS `registros_primera_sindicatura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registros_primera_sindicatura` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `descripcion` text,
  `estatus` varchar(50) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `fecha_modificacion` datetime DEFAULT NULL,
  `creado_por` varchar(100) DEFAULT NULL,
  `modificado_por` varchar(100) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registros_primera_sindicatura`
--

LOCK TABLES `registros_primera_sindicatura` WRITE;
/*!40000 ALTER TABLE `registros_primera_sindicatura` DISABLE KEYS */;
INSERT INTO `registros_primera_sindicatura` VALUES (52,'PROCEDIMIENTO DE ARBITRAJE EN FORMA PRESENCIAL QUE SUBSTANCIA LA PRIMERA SINDICATURA','PROCEDIMIENTO QUE RESUELVE LAS CONTROVERSIAS QUE SE SUSCITEN CON MOTIVO DEL INCUMPLIMIENTO DE LAS OBLIGACIONES POR PARTE DE LOS CONDÓMINOS, DE LOS ADMINISTRADORES O DEL COMITÉ DE ADMINISTRACIÓN; O POR VIOLACIONES AL REGLAMENTO GENERAL DEL CONDOMINIO O AL ACTA CONSTITUTIVA DEL CONDOMINIO.','PUBLICADO',NULL,NULL,NULL,NULL,NULL),(53,'RECURSO ADMINISTRATIVO DE INCONFORMIDAD DE FORMA PRESENCIAL QUE SUBSTANCIA LA PRIMER SINDICATURA.','UN PROCEDIMIENTO ADMINISTRATIVO CONTRA LOS ACTOS Y RESOLUCIONES DE LAS AUTORIDADES ADMINISTRATIVAS Y FISCALES. UN MEDIO DE IMPUGNACIÓN QUE PUEDE AGOTARSE PREVIO AL JUICIO CONTENCIOSO ADMINISTRATIVO.','PUBLICADO',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `registros_primera_sindicatura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registros_proteccion_civil`
--

DROP TABLE IF EXISTS `registros_proteccion_civil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registros_proteccion_civil` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `descripcion` text,
  `estatus` varchar(50) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `fecha_modificacion` datetime DEFAULT NULL,
  `creado_por` varchar(100) DEFAULT NULL,
  `modificado_por` varchar(100) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registros_proteccion_civil`
--

LOCK TABLES `registros_proteccion_civil` WRITE;
/*!40000 ALTER TABLE `registros_proteccion_civil` DISABLE KEYS */;
/*!40000 ALTER TABLE `registros_proteccion_civil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registros_sapasa`
--

DROP TABLE IF EXISTS `registros_sapasa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registros_sapasa` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `descripcion` text,
  `estatus` varchar(50) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `fecha_modificacion` datetime DEFAULT NULL,
  `creado_por` varchar(100) DEFAULT NULL,
  `modificado_por` varchar(100) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=320 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registros_sapasa`
--

LOCK TABLES `registros_sapasa` WRITE;
/*!40000 ALTER TABLE `registros_sapasa` DISABLE KEYS */;
INSERT INTO `registros_sapasa` VALUES (71,'Aclaración de Consumo de Agua Potable, en forma Presencial, que se realiza en el Departamento de Atención a Usuarios del Organismo.','Consiste en la solicitud del ciudadano para verificar, revisar y en su caso, adecuar el consumo del servicio de agua a través del análisis de la cuenta que el usuario tenga registrada en el Sistema del Organismo.','PUBLICADO',NULL,NULL,NULL,NULL,1),(72,'Baja del Padrón por Duplicidad, de forma presencial que realiza la Subdirección de Comercialización del Organismo','Consiste en dar de Baja del Padrón de Usuarios del Organismo Público conocido como S.A.P.A.S.A, los contratos de un mismo predio que se encuentren con doble y hasta triple registro es decir: mismo domicilio, número de manzana, lote y clave catastral.','PUBLICADO',NULL,NULL,NULL,NULL,1),(224,'Solicitud de cambio de material, de forma presencial, que realiza el Departamento de Agua Potable del Organismo.','Consiste en el cambio de material de un punto de conexión entre la red de distribución y la infraestructura domiciliaria del usuario para la prestación del servicio de agua potable.','PUBLICADO',NULL,NULL,NULL,NULL,1),(225,'Alta o Baja de derivación para uso Doméstico y no Doméstico, de forma presencial que realiza la Subdirección de Comercialización del Organismo.','Consiste en dar de Alta una o más derivaciones a solicitud del usuario, cuando se requiera suministrar de forma individual a través de su toma, a una o más viviendas o locales comerciales, que se ubiquen en el mismo predio donde se localiza la toma principal y no se cuente con división de suelo y no cuente con adeudo la toma principal. Consiste en dar de Baja una o más derivaciones a solicitud del usuario, cuando la vivienda o establecimiento no cuente con infraestructura hidráulica al interior de éste o también cuando se subdivida legalmente el predio.','PUBLICADO',NULL,NULL,NULL,NULL,1),(226,'Convenio para Pago de Agua a plazos, en forma presencial que realiza el Departamento de Ejecución Fiscal del Organismo','Consiste en la solicitud por la cual el usuario que no se encuentra al corriente en el pago de agua, pueda realizar su pago de agua en parcialidades suscribiendo un convenio; toda vez que el usuario no pueda pagar el adeudo en una sola exhibición.','PUBLICADO',NULL,NULL,NULL,NULL,1),(227,'Solicitud de Bonificación del 38% en el pago de derechos, en forma presencial que aplica el Departamento de Atención a Usuarios del Organismo.','Consiste en la aplicación del beneficio de la bonificación del 38% en el pago de los derechos por el suministro de agua potable, drenaje y alcantarillado, recepción de los caudales de aguas residuales para el tratamiento o manejo y conducción en los supuestos de: pensionados, jubilados, huérfanos menores de 18 años, personas discapacitadas, adultos mayores, viudas o viudos sin ingresos fijos, madres solteras sin ingresos fijos y aquellas personas físicas cuya percepción no rebase tres salarios mínimos generales del área geográfica que corresponda.','PUBLICADO',NULL,NULL,NULL,NULL,1),(228,'Cambio de nombre, razón social o corrección de datos, en forma presencial que realiza el Departamento de Liquidaciones y Padrón en el Organismo.','Consiste en la solicitud del usuario para corregir o actualizar sus datos en el Sistema Comercial del Organismo como son: el Nombre, Razón Social o algún dato personal relevante.','PUBLICADO',NULL,NULL,NULL,NULL,1),(229,'Cancelación de Toma de Agua y del Contrato, de forma presencial que realiza la Subdirección de Comercialización del Organismo','Consiste en dar de baja en el Padrón de Usuarios una cuenta y un contrato en el caso de: Autorización y Fusión de predio inexistente de infraestructura hidráulica o a petición del Usuario.','PUBLICADO',NULL,NULL,NULL,NULL,1),(230,'Constancia de no prestación de servicios de forma presencial que emite la Subdirección de Comercialización del Organismo.','Consiste en la expedición al usuario de un documento en el que haga constar la inexistencia de red hidráulica y sanitaria en su predio, una vez realizadas las inspecciones que lleve a cabo el Organismo.','PUBLICADO',NULL,NULL,NULL,NULL,1),(231,'Expedición del Dictamen de Factibilidad de Servicios, de forma presencial que se tramita en la Unidad de Factibilidades del Organismo.','Consiste en realizar la solicitud para la obtención del Dictamen de Factibilidad por la que se determina que se cuenta con una fuente de abastecimiento de agua que hace material y jurídicamente viable la prestación del servicio de agua potable, así como la infraestructura adecuada para los servicios de drenaje, para los nuevos desarrollos inmobiliarios que se pretenden realizar en el municipio de Atizapán de Zaragoza.','PUBLICADO',NULL,NULL,NULL,NULL,1),(233,'Contratación de Toma y/o Drenaje, de forma presencial que realiza el Departamento de Liquidaciones y Padrón del Organismo.','Consiste en registrar en el Padrón de Usuarios la contratación de los servicios, asignándole un número de contrato.','PUBLICADO',NULL,NULL,NULL,NULL,1),(234,'Copia Simple de Documentos del Expediente del Usuario, en forma presencial, que entrega el Departamento de Liquidaciones y Padrón del Organismo.','Consiste en otorgar al usuario una copia simple de los documentos disponibles en el archivo de usuarios o sistema comercial a través del Departamento de Liquidaciones y Padrón.','PUBLICADO',NULL,NULL,NULL,NULL,1),(235,'Solicitud de inspección para efecto de aclaración de consumo u otro trámite, en forma presencial que agenda el Departamento de Atención a Usuarios del Organismo.','Consiste en la solicitud del ciudadano a fin de determinar las condiciones físicas del predio, tipo de uso (doméstico, comercial o público), si tiene una o más viviendas, si cuenta con instalaciones hidráulicas, etc., para la continuidad de los trámites relacionados.','PUBLICADO',NULL,NULL,NULL,NULL,1),(236,'Pago por el consumo de agua en forma presencial y vía internet que otorga el Departamento de Caja General del Organismo.','Consiste en realizar la recepción del pago de agua que realiza el usuario por el consumo del agua correspondiente al bimestre corriente o bimestres anteriores.','PUBLICADO',NULL,NULL,NULL,NULL,1),(237,'Restablecimiento de Servicio de Agua Potable, de forma presencial que ejecuta el Departamento de Ejecución Fiscal del Organismo.','Consiste en restablecer el Servicio de Agua Potable al usuario una vez que hayan sido cubiertos los créditos fiscales a su cargo, subsanadas las irregularidades y cubiertos los gastos originados por motivo de la restricción.','PUBLICADO',NULL,NULL,NULL,NULL,1),(238,'Certificación de Pago de Derechos de Agua Municipales, en forma presencial, que realiza el Departamento de Liquidaciones y Padrón del Organismo.','Consiste en otorgar al usuario un documento que verifique que no existen adeudos por los servicios de agua potable y drenaje.','PUBLICADO',NULL,NULL,NULL,NULL,1),(239,'Presentación de documentos en forma presencial a través de la Unidad de Oficialía de Partes del Organismo.','Consiste en la presentación documental ante la ventanilla de la Unidad de Oficialía de Partes del Organismo para atender peticiones, solicitudes o trámites competentes al Organismo.','PUBLICADO',NULL,NULL,NULL,NULL,1),(240,'Instalación de toma domiciliaria de agua, en forma presencial que realiza el Departamento de Agua Potable del Organismo.','Consiste en la instalación de toma domiciliaria de agua a personas físicas, jurídico colectivas e Instituciones públicas dentro del territorio municipal de un punto de conexión entre la red de distribución y conducción a la infraestructura domiciliaria del predio.','PUBLICADO',NULL,NULL,NULL,NULL,1),(241,'Solicitud de reinstalación de toma domiciliaria de agua, de forma presencial que realiza el Departamento de Agua Potable del Organismo.','Consiste en la solicitud del usuario para reinstalar la infraestructura hidráulica, por una causa distinta a la suspensión por falta de pago de servicio de agua.','PUBLICADO',NULL,NULL,NULL,NULL,1),(242,'Solicitud de reubicación de toma domiciliaria de agua, de forma presencial que realiza el Departamento de Agua Potable del Organismo.','Consiste en la modificación de un punto de conexión entre la red de distribución y la infraestructura domiciliaria del usuario para la prestación del servicio de agua potable a otro punto distinto del mismo domicilio.','PUBLICADO',NULL,NULL,NULL,NULL,1),(243,'Solicitud para conexión de descarga domiciliaria, en forma presencial, vía telefónica o en línea que realiza el Departamento de Drenaje, Alcantarillado, Conservación y Mantenimiento del Organismo.','Consiste en realizar una visita al sitio donde se requiere la conexión de la descarga para determinar si es factible o no la conexión, determinando las características de esta, como son: diámetro de tubería, longitud, profundidad, ancho y existencia de infraestructura sanitaria.','PUBLICADO',NULL,NULL,NULL,NULL,1),(244,'Reparación o Reubicación de descarga de drenaje domiciliaria en forma presencial, vía telefónica o en línea que realiza el Departamento de Drenaje, Alcantarillado, Conservación y Mantenimiento del Organismo.','Consiste en atender la solicitud para la reparación o reubicación de descarga sanitaria de acuerdo a la infraestructura sanitaria municipal.','PUBLICADO',NULL,NULL,NULL,NULL,1),(245,'Solicitud de Atención para la reparación de Fugas de agua potable, vía telefónica, en línea o por whatsapp que realiza el Departamento de Agua Potable del Organismo.','Consiste en la atención inmediata a fin de iniciar la reparación de fugas de agua potable en las líneas de conducción primaria y/o secundaria dentro del territorio municipal.','PUBLICADO',NULL,NULL,NULL,NULL,1),(246,'Reporte por Falta de Suministro o Toma tapada, vía Internet, telefónica o de manera presencial que se realiza ante el Departamento de Agua Potable del Organismo.','Consiste en que personal del Departamento de Agua Potable acuda al domicilio para reabastecer y/o restablecer el servicio de suministro de agua potable, subsanadas las irregularidades en las líneas de distribución como pudieran ser taponamientos y/o fugas que ocasionen la falta de suministro en los predios, una vez que hayan sido cubiertos los créditos fiscales a cargo del usuario.','PUBLICADO',NULL,NULL,NULL,NULL,1),(247,'Solicitud de Abastecimiento de Agua en Pipas por Contingencia, vía telefónica o en línea canalizada a la Unidad de Venta de Agua Potable y Agua Tratada en Pipas del Organismo para seguimiento.','Consiste en la distribución de agua potable para consumo de la población, suministrada en pipas del Organismo en las colonias afectadas por falta de suministro.','PUBLICADO',NULL,NULL,NULL,NULL,1),(248,'Solicitud para revisión de medidor, en forma presencial, que agenda el Departamento de Atención a Usuarios del Organismo.','Consiste en la solicitud del usuario para que el Organismo lleve a cabo una revisión de las condiciones físicas y mecánicas del aparato medidor a fin de determinar si su funcionamiento es el correcto o si presenta alguna anomalía que amerite el reemplazarlo.','PUBLICADO',NULL,NULL,NULL,NULL,1),(249,'Solicitud de instalación o reemplazo de Medidor de Agua Potable, de forma presencial que agenda el Departamento de Atención a Usuarios del Organismo.','Consiste en la petición del usuario para la instalación o reemplazo de un medidor de agua, que se efectúa una vez realizado el pago de medidor.','PUBLICADO',NULL,NULL,NULL,NULL,1),(250,'Solicitud para Registro de Medidor, de forma presencial, que agenda el Departamento de Atención a Usuarios del Organismo.','Consiste en registrar en el Sistema Comercial del Organismo el número de serie de un aparato medidor de agua adquirido por el usuario de manera particular; para que se pueda realizar la lectura de consumos correspondiente.','PUBLICADO',NULL,NULL,NULL,NULL,1),(253,'Solicitud de audiencia ciudadana con el director general, en forma presencial o vía telefónica, que otorga la Dirección General del Organismo.','Es la solicitud de un ciudadano o usuario que requiera una audiencia con el director general, con el fin de dar solución definitiva a una problemática; que por su naturaleza no haya sido posible resolver por las diversas áreas de este Organismo.','PUBLICADO',NULL,NULL,NULL,NULL,1),(254,'Copia Certificada de Documentos, de forma presencial, que emite la Dirección General del Organismo.','Consiste en otorgar documentos que obran en poder del Organismo, los cuales fueron emitidos o se encuentran en su archivo como resultado del uso de atribuciones legales; al usuario o solicitante que acredite el interés jurídico o legítimo, individual o colectivo, respecto de un acto o procedimiento administrativo.','PUBLICADO',NULL,NULL,NULL,NULL,1),(255,'Inscripción al Catálogo de Proveedores y Prestadores de Servicios de S.A.P.A.S.A. en forma presencial que realiza el Departamento de Adquisiciones del Organismo.','Consiste en la solicitud de inscripción al Catálogo de Proveedores y Prestadores de Servicios, para ser considerados en los procedimientos de cotización y/o adquisición de bienes y/o arrendamientos y/o prestación de servicios de SAPASA.','PUBLICADO',NULL,NULL,NULL,NULL,1),(256,'Solicitud de información a S.A.P.A.S.A. vía Sistema de Acceso a la Información Mexiquense (SAIMEX) o en forma presencial ante la Unidad de Transparencia y Acceso a la Información Pública del Organismo.','Consiste en la entrega de información pública que genere el S.A.P.A.S.A. que requiera el ciudadano a través del SAIMEX.','PUBLICADO',NULL,NULL,NULL,NULL,1),(257,'Solicitud de Acceso, Rectificación, Cancelación y Oposición del Estado de México (SARCOEM), en forma presencial, escrita o vía Internet, ante la Unidad de Transparencia y Acceso a la Información Pública del Organismo.','Atender las solicitudes de información escrita o a través del sistema (SARCOEM) que deberá realizar el titular de datos personales o su representante legal para solicitar Acceso, Rectificación, Cancelación u Oposición al tratamiento de sus datos personales en Posesión de Sujetos Obligados del Estado de México y Municipios.','PUBLICADO',NULL,NULL,NULL,NULL,1),(258,'Servicio de Bacheo por Reparación de Fugas de Agua Potable, en forma presencial, vía telefónica o en línea, que realiza el Departamento de Drenaje, Alcantarillado, Conservación y Mantenimiento del Organismo.','Consiste en la reparación de la carpeta asfáltica a base de concreto hidráulico o mezcla asfáltica en avenidas y calles del municipio, derivada de reparaciones por fugas de agua potable y/o infraestructura hidrosanitaria.','PUBLICADO',NULL,NULL,NULL,NULL,1),(259,'Cambio de Brocal, Coladeras o Rejillas, en forma presencial, vía telefónica o en línea que realiza el Departamento de Drenaje, Alcantarillado, Conservación y Mantenimiento del Organismo.','Consiste en la solicitud del usuario para llevar a cabo la instalación y colocación de un brocal, coladera o rejilla, en los casos de ruptura, deterioro o no exista en el lugar lo solicitado.','PUBLICADO',NULL,NULL,NULL,NULL,1),(260,'Limpieza y Deshierbe de Causas, Ríos y Barrancas, en forma presencial, vía telefónica o en línea que realiza el Departamento de Drenaje, Alcantarillado, Conservación y Mantenimiento del Organismo.','Consiste en brindar el servicio de limpieza, retiro de basura y deshierbe en los Causas, Ríos y Barrancas para dar mayor fluidez a las aguas residuales y en consecuencia evitar inundaciones.','PUBLICADO',NULL,NULL,NULL,NULL,1),(261,'Limpieza y Desazolve de la Red Sanitaria Municipal, en forma presencial, vía telefónica o en línea que realiza el Departamento de Drenaje, Alcantarillado, Conservación y Mantenimiento del Organismo.','Consiste en brindar el servicio de limpieza y desazolve de la red sanitaria municipal, mediante el uso de equipo de presión y succión para la extracción de residuos sólidos (azolve), a fin de dar libre paso a las líneas de agua pluvial y residual.','PUBLICADO',NULL,NULL,NULL,NULL,1),(262,'Reparación de Red de Drenaje Pluvial y Sanitario Municipal, en forma presencial, vía telefónica o en línea, que realiza el Departamento de Drenaje, Alcantarillado, Conservación y Mantenimiento del Organismo.','Consiste en la realización de trabajos de reparación (rehabilitación) en las Redes de Drenaje Pluvial y Sanitario Municipal, en los cuales existan daños, filtraciones y derrames.','PUBLICADO',NULL,NULL,NULL,NULL,1),(263,'Denuncia Ciudadana por la comisión de faltas administrativas, en forma presencial, por escrito, vía telefónica o correo electrónico que recibe la Unidad Especializada de Investigación del Organismo.','Consiste en la recepción de una denuncia en contra de algún servidor público de S.A.P.A.S.A. derivado de la acción u omisión de sus funciones o atribuciones, misma que podrá ser presentada por personas físicas, jurídicas o instituciones públicas.','PUBLICADO',NULL,NULL,NULL,NULL,1),(264,'Expedición de factura por pago en ventanilla bancaria o transferencia electrónica, vía presencial y telefónica que otorga el Departamento de Caja General del Organismo.','Consiste en la expedición y entrega al usuario de su factura como comprobante fiscal para los fines legales que se requiera, derivado de un pago de derechos a través de una ventanilla de sucursal o por transferencia electrónica bancaria.','PUBLICADO',NULL,NULL,NULL,NULL,1),(265,'Venta de vales de Agua Potable y Agua Tratada a Distribuidores en Pipa, de forma presencial que realiza la Subdirección Comercial del Organismo','Consiste en la prestación del servicio de venta de agua potable y agua tratada, dentro de los límites territoriales municipales, a propietarios de camiones tipo cisterna, que se encuentran registrados en la red de distribuidores del Organismo.','PUBLICADO',NULL,NULL,NULL,NULL,1),(266,'Inscripción al Catálogo de Contratistas de S.A.P.A.S.A., en forma presencial que realiza el Departamento de Adquisiciones del Organismo.','Consiste en la solicitud de inscripción en el Catálogo de Contratistas, para con ello ser considerados en los procedimientos de cotización y/o adquisición de bienes y/o arrendamientos y/o prestación de servicios de SAPASA.','PUBLICADO',NULL,NULL,NULL,NULL,1),(312,'Venta de Agua Tratada, en forma presencial, que realiza la Subdirección Comercial del Organismo.','Consiste en la prestación del servicio de venta de agua tratada dentro de los límites territoriales municipales para uso general, riego de jardines y áreas verdes o uso industrial.','PUBLICADO',NULL,NULL,NULL,NULL,1),(319,'Expedición o renovación del permiso de distribución de Agua Potable y Agua Tratada a Distribuidores en Pipa, de forma presencial que realiza la Subdirección Comercial del Organismo','Consiste en otorgar un permiso de distribución de agua potable y/o tratada a través de pipa, que autoriza al Organismo Operador S.A.P.A.S.A. para su distribución y/o comercialización en el territorio municipal.','PUBLICADO',NULL,NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `registros_sapasa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registros_secretaria_ayuntamiento`
--

DROP TABLE IF EXISTS `registros_secretaria_ayuntamiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registros_secretaria_ayuntamiento` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `descripcion` text,
  `estatus` varchar(50) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `fecha_modificacion` datetime DEFAULT NULL,
  `creado_por` varchar(100) DEFAULT NULL,
  `modificado_por` varchar(100) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=219 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registros_secretaria_ayuntamiento`
--

LOCK TABLES `registros_secretaria_ayuntamiento` WRITE;
/*!40000 ALTER TABLE `registros_secretaria_ayuntamiento` DISABLE KEYS */;
INSERT INTO `registros_secretaria_ayuntamiento` VALUES (73,'Autorización del Libro de Actas del Régimen Condominal, se realiza de manera presencial, escrita y lo otorga la Secretaría del Ayuntamiento.','Consiste en autorizar el libro de actas de la mesa directiva de la asociación de condóminos.','PUBLICADO',NULL,NULL,NULL,NULL,1),(182,'Constancia Domiciliaria, se realiza de manera presencial y lo otorga el Departamento de Constancias de Vecindad e Identidad.','Consiste en otorgar al ciudadano por parte del área de Constancias de Vecindad e Identidad de la Secretaría del Ayuntamiento de Atizapán de Zaragoza, una constancia oficial que demuestre que el solicitante reside en el Municipio de Atizapán de Zaragoza.','PUBLICADO',NULL,NULL,NULL,NULL,1),(188,'Constancia de identidad, se realiza de manera presencial y lo otorga el Departamento de constancias de vecindad e identidad.','Consiste en otorgar al Ciudadano por parte del Departamento de Constancias de Vecindad e Identidad de la Secretaría del Ayuntamiento de Atizapán de Zaragoza, una constancia que acredite la identidad del ciudadano.','PUBLICADO',NULL,NULL,NULL,NULL,1),(190,'Expedición de copias certificadas, se realiza de manera presencial, escrita y las otorga el Departamento de Actas, Acuerdos y Certificaciones.','Consiste en hacer constar que una copia fotostática, es reproducción fiel y exacta del documento original que obra en los archivos de las Dependencias de la Administración Pública Municipal.','PUBLICADO',NULL,NULL,NULL,NULL,1),(191,'Constancia de no propiedad municipal, se realiza de manera presencial, escrita y la otorga la Subsecretaría de Patrimonio Municipal.','Consiste en expedir un documento a través del Departamento de Bienes Inmuebles, dependientes de la Subsecretaría de Patrimonio Municipal, respecto de los Bienes Inmuebles que no forman parte del Patrimonio Municipal.','PUBLICADO',NULL,NULL,NULL,NULL,1),(199,'Trámite de Cartilla de Identidad del Servicio Militar Nacional, se realiza de manera presencial y lo otorga la Junta Municipal de Reclutamiento.','Consiste en realizar el trámite para la obtención de la Cartilla de Identidad del Servicio Militar Nacional para los ciudadanos atizapenses mayores de edad en las oficinas de la Junta Municipal de Reclutamiento.','PUBLICADO',NULL,NULL,NULL,NULL,1),(201,'Presentación de escritos: Oficialía Común de Partes, se realiza de manera presencial y escrita y lo otorga la Oficialía Común de Partes.','RECIBIR, CLASIFICAR Y CANALIZAR LAS PETICIONES Y/O PROMOCIONES DIRIGIDAS A LAS DEPENDENCIAS O ÁREAS ADMINISTRATIVAS DEL H. AYUNTAMIENTO DE ATIZAPÁN DE ZARAGOZA','PUBLICADO',NULL,NULL,NULL,NULL,1),(202,'Actas informativas, se realiza de manera presencial y lo otorga el Juzgado Cívico Municipal.','Consiste en emitir una constancia documental en la que el Juez Cívico hace constar un hecho determinado entre los que se encuentran; Extravío de Documentos Oficiales, factura de vehículo, tarjeta de circulación, tarjetón de registro federal de vehículos, factura de motor, placa metálica de circulación, chip te catalizador, credencial o gafete de trabajo presentando último recibo de pago, licencia para conducir, pasaporte, facturas, recibos, vales y contra recibos, certificado de alumbramiento, boleta de empeño, Salida de Domicilio en donde se cohabita en matrimonio o con su pareja en unión libre, Modo Honesto de Vivir, Dependencia Económica, ausencia permanente o cambio de beneficiarios de programas sociales.','PUBLICADO',NULL,NULL,NULL,NULL,1),(203,'Entrega de menor en cumplimiento a lo ordenado por un Juez en Materia Familiar, se realiza de manera presencial, por sentencia judicial y lo otorga el Juzgado Cívico Municipal.','Consiste en emitir una constancia documental en la que el Juez Cívico, hace constar un hecho determinado entre los que se encuentran; Entrega de menor ordenado por acuerdo de la autoridad jurisdiccional, en la cual se asienta las circunstancias en la cuales se lleva a cabo la entrega de menor entre progenitores, Tutores o quien ejerza la patria potestad en diferentes horarios de acuerdo a lo ordenado por el Juzgado correspondiente.','PUBLICADO',NULL,NULL,NULL,NULL,1),(204,'Invitación a la ciudadanía para llevar a cabo Sesión de Mediación-Conciliación para dirimir un conflicto, se realiza de manera presencial, verbal, escrita y la otorga el Centro de Mediación Municipal.','Consiste en iniciar un procedimiento de mediación conciliación, ya sea de carácter vecinal, comunitaria, familiar, escolar y/o social, a través de los mecanismos alternativos para la solución de controversias.','PUBLICADO',NULL,NULL,NULL,NULL,1),(205,'Procedimiento Arbitral en Accidente de Tránsito Terrestre, se realiza de manera presencial y lo otorga el Juzgado Cívico Municipal.','Consiste en iniciar un procedimiento arbitral por motivo de un accidente de tránsito terrestre en su modalidad de choque, siempre y cuando los conductores involucrados no lleguen a un acuerdo en cuanto a la responsabilidad y reparación del daño.','PUBLICADO',NULL,NULL,NULL,NULL,1),(206,'Acta de Matrimonio, se realiza de manera presencial y lo otorgan las Oficialías del Registro Civil.','Consiste en registrar y expedir las actas de matrimonio, por medio de la cual dos personas de manera libre y voluntaria, deciden compartir un estado de vida para la búsqueda de su realización personal y conyugal, bajo las formalidades y solemnidades.','PUBLICADO',NULL,NULL,NULL,NULL,1),(207,'Copia Certificada del Acta de Registro Civil, se realiza de manera presencial y lo otorgan las Oficialías del Registro Civil.','Consiste en la Expedición de Copias Certificadas del Registro Civil, en papel seguridad, relativa a las Actas de Nacimiento, Reconocimiento de hijos, Adopción, Matrimonio, Divorcio y Defunción.','PUBLICADO',NULL,NULL,NULL,NULL,1),(213,'Orden de Inhumación a Cremación Por Muerte de Ser Humano No Viable, se realiza de manera presencial y lo otorgan las Oficialías del Registro Civil.','Consiste en expedir y registrar en la oficialía del registro civil la orden de inhumación o cremación por muerte de ser humano no viable.','PUBLICADO',NULL,NULL,NULL,NULL,1),(214,'Orden de Inhumación o Cremación Por Muerte Fetal, se realiza de manera presencial y otorgan las Oficialías de Registro Civil.','Consiste en expedir y registrar en la oficialía del registro civil la orden de inhumación o cremación por muerte fetal.','PUBLICADO',NULL,NULL,NULL,NULL,1),(215,'Registro de Reconocimiento de hijo, se realiza de manera presencial y lo otorgan las Oficialías del Registro Civil.','Consiste en expedir un acta de reconocimiento de hijo(a), se efectuará en la misma oficialía donde se registró el nacimiento.','PUBLICADO',NULL,NULL,NULL,NULL,1),(216,'Registro Extemporáneo de Defunción, se realiza de manera presencial y lo otorgan las Oficialías del Registro Civil.','Consiste en expedir y registrar las actas de defunción extemporáneas en la Oficialía del Registro Civil.','PUBLICADO',NULL,NULL,NULL,NULL,1),(217,'Registro de Adopción, se realiza de manera presencial y lo otorgan las Oficialías del Registro Civil.','Consiste en registrar y expedir el acta de Nacimiento, a personas adoptadas, cuya resolución definitiva autorice la adopción.','PUBLICADO',NULL,NULL,NULL,NULL,1),(218,'Registro de Divorcio Administrativo, se realiza de manera presencial y lo otorgan las Oficialías del Registro Civil.','Consiste en levantar el acta de divorcio administrativo y realizar en el acta de matrimonio la anotación marginal cuando ambos cónyuges convengan en divorciarse, no tengan hijos menores de edad o mayores sujetos a tutela y hubieren liquidado la sociedad conyugal si la hubiera.','PUBLICADO',NULL,NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `registros_secretaria_ayuntamiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registros_seguridad_publica`
--

DROP TABLE IF EXISTS `registros_seguridad_publica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registros_seguridad_publica` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `descripcion` text,
  `estatus` varchar(50) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `fecha_modificacion` datetime DEFAULT NULL,
  `creado_por` varchar(100) DEFAULT NULL,
  `modificado_por` varchar(100) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registros_seguridad_publica`
--

LOCK TABLES `registros_seguridad_publica` WRITE;
/*!40000 ALTER TABLE `registros_seguridad_publica` DISABLE KEYS */;
INSERT INTO `registros_seguridad_publica` VALUES (17,'Célula de Búsqueda y Localización de Personas Extraviadas, Ausentes y/o no Localizadas','Consiste en brindarles asesoría y acompañamiento a los familiares en la búsqueda de personas no localizadas, ausentes o no localizadas iniciando con la denuncia en el Ministerio Público por desaparición.','PUBLICADO',NULL,NULL,NULL,NULL,NULL),(18,'Atención Psicológica a Personas Víctimas de Violencia Familiar y/o de Género. Se realiza de manera presencial y lo otorga la Subdirección de Prevención del Delito y Búsqueda de Personas','Consiste en brindar apoyo psicológico profesional a personas que han sido víctimas de violencia familiar y/o de género, a través de 6 sesiones psicológicas en las oficinas de prevención del delito y de manera online, a efecto de que se ajuste a las necesidades de la población Atizapense.','PUBLICADO',NULL,NULL,NULL,NULL,NULL),(19,'Talleres con Temáticas de Autoestima y Vida Libre de Violencia. Se realiza de manera escrita y lo otorga la Subdirección de Prevención del Delito y Búsqueda de Personas','Consiste en impartir talleres de prevención de violencia en el entorno familiar y escolar, en instituciones educativas, empresas y en las Comunidades del municipio de manera online o presencial, a efecto de que se ajuste a las necesidades de la población Atizapense.','PUBLICADO',NULL,NULL,NULL,NULL,NULL),(20,'Asesoría y Acompañamiento a Víctimas de Violencia de Género (Policía de Género). Se realiza de manera presencial y lo otorga la Subdirección de Prevención del Delito y Búsqueda de Personas.','Consiste en Asesorar y salvaguardar los derechos de la víctima u ofendido con base al Protocolo de Actuación Policial (Detención, Identificación, Intervención, Atención y Protección).','PUBLICADO',NULL,NULL,NULL,NULL,NULL),(21,'Atención de Peticiones para reforzamiento de la Seguridad. Se realiza de manera presencial y lo otorga la Subdirección Operativa','Consiste en brindar atención a todas las peticiones realizadas por la ciudadanía dentro del Municipio de Atizapán de Zaragoza para el reforzamiento de la Seguridad y la implementación de operativos','PUBLICADO',NULL,NULL,NULL,NULL,NULL),(22,'Instalación de Panel de Emergencia, se realiza de manera escrita y lo otorga la Subdirección de Inteligencia Municipal','Consiste en instalar un dispositivo electrónico que contiene un comunicador digital preparado para transmitir emergencias por línea telefónica. Posee tres teclas de emergencia: 1) de pánico, para cuestiones de seguridad. 2) médica para emergencias médicas, para cuestiones relacionadas con incidentes de emergencia médicas. 3) bomberos, para cuestiones relacionadas con incidentes de emergencia relacionadas con elementos del h. cuerpo de bomberos. Al presionar cualquier botón durante 3 segundos, se emitirá una alerta inmediata al centro de control, comando, cómputo y comunicaciones (c4), desde donde se coordinará y se accionará la respuesta necesaria para el tipo de alerta requerida.','PUBLICADO',NULL,NULL,NULL,NULL,NULL),(23,'Pago de Infracciones de Tránsito, se realizan de manera presencial y lo otorga la Subdirección de Seguridad Vial','Consiste en realizar el pago al haber recibido una boleta de infracción, por una falta al Reglamento de Tránsito del Estado de México.','PUBLICADO',NULL,NULL,NULL,NULL,NULL),(24,'Platicas de Prevención del Delito en Centros Educativos. Se realiza de manera escrita y lo otorga la Subdirección de Prevención del Delito y Búsqueda de Personas','Consiste en impartir pláticas de Prevención del Delito a jóvenes en las Instituciones Educativas del Municipio de Atizapán de Zaragoza, con la finalidad de concientizar y sensibilizar a los alumnos de los diferentes niveles educativos sobre el tema delictivo.','PUBLICADO',NULL,NULL,NULL,NULL,NULL),(25,'Platicas de Prevención Vecinales y Difusión de los Servicios de la Dirección. Se realiza de manera telefónica y lo otorga la Subdirección de Prevención del Delito y Búsqueda de Personas.','Consiste en realizar reuniones y el acercamiento de la Dirección de Seguridad Pública y Tránsito Municipal a la ciudadanía Atizapense, en las diferentes colonias del Municipio de Atizapán de Zaragoza para difundir los programas de la Dirección y lograr réplicas de información y fortalecer la Seguridad Pública.','PUBLICADO',NULL,NULL,NULL,NULL,NULL),(26,'Programa de Integración Social y Familiar. Se realiza de manera presencial y escrita y lo otorga la Subdirección de Prevención del Delito y Búsqueda de Personas.','Consiste en realizar actividades dinámicas en espacios abiertos públicos, parques, jardines de las diferentes comunidades del Municipio con temas como: juegos de mesa, bisutería y dibujo con el fin de fomentar los valores.','PUBLICADO',NULL,NULL,NULL,NULL,NULL),(27,'Programa \"Mi Escuela Segura\". Se realiza de manera escrita y lo otorga la Subdirección de Prevención del Delito y Búsqueda de Personas.','Consiste en llevar a cabo operativos en escuelas (primarias, secundarias y preparatorias) con la finalidad de identificar objetos no permitidos conforme a la regularización Federal, Estatal y Municipal, en aras de procurar un entorno libre del consumo de alcohol, drogas y de conductas antisociales que afecten la integridad y el sano desarrollo de los estudiantes, promoviendo la participación de padres de familia, alumnos, personal docente y administrativo de las instituciones.','PUBLICADO',NULL,NULL,NULL,NULL,NULL),(28,'Recepción de quejas y denuncias en contra de integrantes de la Dirección de Seguridad Pública y Tránsito Municipal de Atizapán de Zaragoza, Estado de México, se realiza de manera presencial y lo otorga el Área de Asuntos Internos.','Consistente en recibir quejas y denuncias en contra de integrantes de la Dirección  de Seguridad Pública y Tránsito Municipal de este H. Ayuntamiento mismas que se realizan en la Unidad de Asuntos Internos perteneciente de la Dirección de Seguridad Pública y Tránsito Municipal de este H. Ayuntamiento, derivadas de conductas que pueden ser acciones u omisiones que presuman responsabilidad o conductas indebidas en contra de la ciudadanía o bien en contra de otros elementos de esta corporación policial.','PUBLICADO',NULL,NULL,NULL,NULL,NULL),(29,'Contrato de prestación de Servicios de Vigilancia Especial Remunerada y lo otorga la Subdirección de Servicios de Vigilancia Especial.','Consiste en celebrar un contrato para la prestación de Unidad de Servicios Facultativos (Vigilancia Especial Remunerada), con Personas Físicas o Jurídico Colectivas, que deseen tener un servicio de seguridad adicional a la pública.','PUBLICADO',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `registros_seguridad_publica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registros_servicios_publicos`
--

DROP TABLE IF EXISTS `registros_servicios_publicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registros_servicios_publicos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(500) DEFAULT NULL,
  `descripcion` text,
  `estatus` varchar(50) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `fecha_modificacion` datetime DEFAULT NULL,
  `creado_por` varchar(100) DEFAULT NULL,
  `modificado_por` varchar(100) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=213 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registros_servicios_publicos`
--

LOCK TABLES `registros_servicios_publicos` WRITE;
/*!40000 ALTER TABLE `registros_servicios_publicos` DISABLE KEYS */;
INSERT INTO `registros_servicios_publicos` VALUES (75,'Barrido en vías primarias del Municipio, vía telefónica, de forma presencial, por escrito y/o en línea que otorga el área de la Subdirección de Limpia y Transporte.','Consiste en realizar el barrido mecánico o manual de las avenidas principales, camellones y plazas públicas, para crear un ambiente limpio y preservar la imagen urbana del municipio','PUBLICADO',NULL,NULL,NULL,NULL,NULL),(76,'Exhumaciones de forma presencial que otorga el área de Departamento de Panteones.','Consiste en autorizar al usuario los servicios de los panteones (propiedad municipal) para llevar a cabo la exhumación','PUBLICADO',NULL,NULL,NULL,NULL,NULL),(86,'Recolección de basura en el Territorio Municipal, calle por calle de a cuerdo a un rutero establecido, así como en industrias, comercios y prestadores de servicio, vía telefónica, en forma presencial, por escrito y/o en línea, que otorga el área de la Subdirección de Limpia y Transporte.','Consiste en realizar la recolección de basura en el territorio municipal, calle por calle de acuerdo a un rutero establecido, así como en industrias, comercios y prestadores de servicio.','PUBLICADO',NULL,NULL,NULL,NULL,NULL),(135,'Nombramiento o cambio de titular de fosa, en forma presencial que otorga el área de Departamento de Panteones.','Consiste en brindar atención al usuario de los servicios de Panteones (propiedad municipal), para realizar la Cesión de Derechos de su Fosa u Osario','PUBLICADO',NULL,NULL,NULL,NULL,NULL),(140,'Recolección de animales muertos, en forma presencial, vía telefónica y/o en línea que otorga el área de la Subdirección de Limpia y Transporte..','Consiste en realizar el levantamiento de animales muertos como son: perros, gatos, gallinas etc., que se ubiquen en avenidas, calles, casas, departamentos, mercados municipales, etc. Del territorio municipal','PUBLICADO',NULL,NULL,NULL,NULL,NULL),(145,'Recolección de muebles y llantas, vía telefónica, de forma presencial, por escrito y/o en línea que otorga el área de la Subdirección de Limpia y Transporte.','Consiste en realizar el servicio de recolección de muebles viejos y de llantas','PUBLICADO',NULL,NULL,NULL,NULL,NULL),(178,'Colocación de postes  de Alumbrado Público, solicitud por escrito que otorga el área de la Subdirección de Alumbrado Público.','Consiste en proporcionar el soporte básico para la ampliación del sistema de alumbrado público (postes metálicos) dentro del territorio municipal','PUBLICADO',NULL,NULL,NULL,NULL,NULL),(179,'Mantenimiento a instalación eléctrica en Centros Educativos Públicos, por escrito que otorga el área de la Subdirección de Alumbrado Público.','Consiste en proporcionar el mantenimiento, así como la revisión y reparación de la instalación eléctrica en los centros educativos  ubicados en el territorio municipal','PUBLICADO',NULL,NULL,NULL,NULL,NULL),(180,'Mantenimiento a postes de alumbrado público, vía telefónica, en forma presencial, por escrito y/o en línea que otorga el área de la Subdirección de Alumbrado Público.','Consiste en retirar la propaganda de la red de alumbrado público municipal y llevar a cabo la soldadura de los postes, con la finalidad de incrementar la vida útil de la infraestructura y mejorar la imagen urbana','PUBLICADO',NULL,NULL,NULL,NULL,NULL),(183,'Colocación de luminarias, solicitud por escrito que otorga el área de la Subdirección de Alumbrado Público.','Consiste en realizar la colocación de luminarias en calles, avenidas, andadores, parques y espacios deportivos (donde no se cuenta o exista luminaria) dentro del territorio municipal.','PUBLICADO',NULL,NULL,NULL,NULL,NULL),(184,'Reparación de luminarias, vía telefónica, de forma presencial, por escrito y/o en línea que otorga el área de la Subdirección de Alumbrado Público.','Consiste en la realizar la reparación de luminarias del alumbrado público en calles, avenidas, andadores, parques y espacios deportivos dentro del territorio municipal','PUBLICADO',NULL,NULL,NULL,NULL,NULL),(185,'Autorización para la construcción y/o colocación de metro cuadrado de lapida, jardinera y monumento, construcción interna y remodelación de fosas de forma presencial que otorga el área de Departamento de Panteones.','Consiste en atender las solicitudes del usuario de los servicios de panteones (propiedad municipal), para otorgar el permiso de construcción o remodelación de fosas realizadas por su cuenta y supervisadas por el encargado del panteón municipal, en un lapso no mayor a 30 días naturales a partir de la fecha expedida.','PUBLICADO',NULL,NULL,NULL,NULL,NULL),(186,'Inhumación de forma personal que otorga el área del Departamento de Panteones','Consiste en brindar otorgar permiso de apertura de fosa y de inhumación.','PUBLICADO',NULL,NULL,NULL,NULL,NULL),(187,'Pago de refrendo y mantenimiento anual, de forma presencial que otorga el área de Departamento de Panteones','Consiste en realizar el cobro por concepto de refrendo anual por los servicios de panteones (propiedad municipal)','PUBLICADO',NULL,NULL,NULL,NULL,NULL),(189,'Encalado de árboles, vía telefónica, de forma presencial y escrita que otorga el área de la Subdirección de Atizaparques.','Consiste en realizar el encalado del arbolado ubicado en camellones, avenidas principales, áreas verdes y deportivas municipales','PUBLICADO',NULL,NULL,NULL,NULL,NULL),(193,'Encalado de bardas, vía telefónica, de forma presencial, escrita, que otorga el área de la Subdirección de Atizaparques.','Consiste en realizar el encalado de bardas dentro del territorio municipal, para el mejoramiento de la imagen urbana','PUBLICADO',NULL,NULL,NULL,NULL,NULL),(194,'Mantenimiento a gimnasios al aire libre, por escrito que otorga el área de la Subdirección de Atizaparques.','Consiste en realizar el mantenimiento a los gimnasios al aire libre, ubicados dentro del territorio municipal, con la finalidad de fomentar las actividades recreativas y deportivas de la niñez y la juventud','PUBLICADO',NULL,NULL,NULL,NULL,NULL),(195,'Mantenimiento de juegos infantiles, de forma escrita que otorga el área de la Subdirección de Atizaparques.','Consiste en Realizar el Mantenimiento de los Juegos Infantiles Ubicados Dentro del Territorio Municipal, con la Finalidad de Fomentar las Actividades Recreativas y Deportivas de la Niñez atizapense.','PUBLICADO',NULL,NULL,NULL,NULL,NULL),(200,'Poda de Árboles, por escrito que otorga el área de la Subdirección de Atizaparques.','Consiste en Podar Arboles ubicados en Parques, Deportivos, Banquetas, Camellones, y Avenidas Principales del Territorio Municipal que obstruyan la visibilidad de señalamientos,  que tengan contacto con cables de energía eléctrica o que generen riesgo para la comunidad Atizapense','PUBLICADO',NULL,NULL,NULL,NULL,NULL),(208,'Seccionar árboles derribados, de forma escrita que otorga el área de la Subdirección de Atizaparques.','Consiste en seccionar árboles derribados (por fenómenos naturales como lluvias y aires fuertes), ubicados en banquetas, parques, deportivos, camellones y avenidas principales del territorio municipal, con la finalidad de evitar accidentes o riesgos.','PUBLICADO',NULL,NULL,NULL,NULL,NULL),(209,'Corte de pasto  (Mantenimiento de las áreas verdes municipales), vía telefónica, de forma presencial, por escrito y/o en línea que otorga el área de la Subdirección de Atizaparques.','Consiste en realizar el mantenimiento de las áreas verdes (parques, jardines, camellones, áreas recreativas y deportivas) en el territorio municipal y preservar la buena imagen urbana','PUBLICADO',NULL,NULL,NULL,NULL,NULL),(210,'Recolección de Ramas y Pasto, vía telefónica, de forma presencial, escrita y/o en línea que otorga el área de la Subdirección de Atizaparques.','Consiste en realizar la recolección de ramas y pasto producto del mantenimiento de las áreas verdes municipales, así como los generados por la poda de árboles','PUBLICADO',NULL,NULL,NULL,NULL,NULL),(212,'Riego de avenidas, camellones y áreas verdes municipales, vía telefónica, de forma presencial, escrita y/o en línea que otorga el área de la Subdirección de Atizaparques.','Consiste en realizar el riego con agua tratada en: camellones, avenidas primarias y áreas verdes municipales, con  el fin de mejorar la imagen urbana del territorio municipal','PUBLICADO',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `registros_servicios_publicos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registros_tesoreria_municipal`
--

DROP TABLE IF EXISTS `registros_tesoreria_municipal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registros_tesoreria_municipal` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `descripcion` text,
  `estatus` varchar(50) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `fecha_modificacion` datetime DEFAULT NULL,
  `creado_por` varchar(100) DEFAULT NULL,
  `modificado_por` varchar(100) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registros_tesoreria_municipal`
--

LOCK TABLES `registros_tesoreria_municipal` WRITE;
/*!40000 ALTER TABLE `registros_tesoreria_municipal` DISABLE KEYS */;
INSERT INTO `registros_tesoreria_municipal` VALUES (79,'Corrección de datos en documentos que obran en los registros de la Tesorería Municipal aportados por el Contribuyente, trámite presencial y lo otorga el Departamento de Impuestos Inmobiliarios','Consiste en realizar la modificación de datos del interesado en los registros que obran en la Tesorería Municipal respecto del nombre del titular del inmueble, a efecto de verse reflejados en los recibos y certificados que se emiten derivado de los servicios prestados por la dependencia, con base en la documentación aportada por el Contribuyente.','PUBLICADO',NULL,NULL,NULL,NULL,NULL),(82,'Solicitud de Copias Simples, tramite presencial y lo otorga el Departamento de Impuestos Inmobiliarios','Consiste en que los contribuyentes, en ejercicio de su derecho a la Información Pública, obtengan copias simples de los documentos que obran en el archivo de esta Tesorería, los cuales serán emitidos por el área de Impuestos Inmobiliarios, para lo cual deberán acreditar fehacientemente su interés jurídico.','PUBLICADO',NULL,NULL,NULL,NULL,NULL),(83,'Actualización catastral por Subdivisión y/o Fusión, Lotificación y Re lotificación,  Se realiza de manera presencial y lo otorga el Departamento de Catastro.','Cuando el contribuyente previa autorización emitida por la autoridad competente realice una subdivisión, Fusión, Lotificación y Relotificación, se llevará a cabo la actualización catastral siguiendo los Lineamientos establecidos en el Manual Catastral y en términos de lo que establece el Código Financiero del Estado de México y Municipios.','PUBLICADO',NULL,NULL,NULL,NULL,NULL),(84,'Certificación que de pago actualizado de Impuesto Predial, trámite presencial y lo otorga el Departamento de Impuestos Inmobiliarios','Consiste en la emisión del documento que acredita que el inmueble de interés del solicitante se encuentra regularizado respecto a sus obligaciones impositivas conforme a los lineamientos establecidos en el Manual Catastral y en términos de los que establece el Código Financiero del Estado de México y Municipios.','PUBLICADO',NULL,NULL,NULL,NULL,NULL),(85,'Certificación de Aportación de Mejoras, trámite presencial, lo otorga el Departamento de Impuestos Inmobiliarios.','Consiste en la emisión del documento que acredita que el inmueble de interés del solicitante se encuentra regularizado respecto a sus obligaciones impositivas conforme a los lineamientos establecidos en el Manual Catastral y en términos de lo que establece el Código Financiero del Estado de México y Municipios.','PUBLICADO',NULL,NULL,NULL,NULL,NULL),(87,'Pago de Impuesto Predial ante la Tesorería Municipal, presencial o en línea.','Consiste en que las personas físicas y jurídicas colectivas que sean propietarias o poseedoras, de inmuebles en el territorio municipal, realicen el pago del Impuesto Predial.','PUBLICADO',NULL,NULL,NULL,NULL,NULL),(88,'Impuesto Sobre Adquisición de Inmuebles y Otras Operaciones Traslativas de Dominio de Inmuebles','Consiste en recibir el pago del impuesto de las personas físicas y jurídicas colectivas, que adquieran inmuebles ubicados en el Municipio.','PUBLICADO',NULL,NULL,NULL,NULL,NULL),(89,'Actualización al Padrón Catastral derivado de cambios técnicos y administrativos','Cuando el contribuyente requiera una actualización de los datos del inmueble inscrito en el Padrón Catastral para contribuir o definir con exactitud las características cualitativas y cuantitativas del predio existente en el Municipio, plenamente identificado con la clave catastral','PUBLICADO',NULL,NULL,NULL,NULL,NULL),(90,'Altas, Bajas y Modificación a la Construcción, Se realiza de manera presencial y lo otorga el Departamento de Catastro.','Cuando el contribuyente requiera una actualización de la superficie de construcción del inmueble inscrito en el Padrón Catastral para contribuir con exactitud las características cualitativas y cuantitativas del predio existente en el Municipio, plenamente identificado con la clave catastral.','PUBLICADO',NULL,NULL,NULL,NULL,NULL),(98,'Asignación, Baja y Reasignación de Clave Catastral, mediante Manifestación Catastral, Se realiza de manera presencial y lo otorga el Departamento de Catastro.','Consiste en efectuar la actualización de datos técnicos del inmueble de interés del contribuyente, mediante la asignación, baja y reasignación de clave catastral cuando conste de por medio una manifestación catastral.','PUBLICADO',NULL,NULL,NULL,NULL,NULL),(101,'Constancia de Identidad Catastral, Se realiza de manera presencial y lo otorga el Departamento de Catastro.','Consiste en la expedición del documento que manifieste las características, así como la clave catastral, superficie, domicilio, y nombre del propietario del predio a interés del contribuyente.','PUBLICADO',NULL,NULL,NULL,NULL,NULL),(103,'Certificado de Clave y Valor Catastral, Se realiza de manera presencial y lo otorga el Departamento de Catastro.','Otorgar al contribuyente el certificado de clave y valor catastral, mediante el cual pueda acreditar o dar fe de los datos contenidos en el registro alfanumérico del Inventario Analítico de los bienes inmuebles ubicados en el territorio del municipio de Atizapán de Zaragoza.','PUBLICADO',NULL,NULL,NULL,NULL,NULL),(104,'Certificación de Plano Manzanero, Se realiza de manera presencial y lo otorga el Departamento de Catastro.','Consiste en la expedición del documento donde se especifica la ubicación, medidas, superficie de terreno, así como su delimitación con referencia a la clave catastral y en atención a los Lineamientos establecidos en el Manual Catastral y en términos de los que establece el Código Financiero del Estado de México y Municipios.','PUBLICADO',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `registros_tesoreria_municipal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registros_transparencia`
--

DROP TABLE IF EXISTS `registros_transparencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registros_transparencia` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `descripcion` text,
  `estatus` varchar(50) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `fecha_modificacion` datetime DEFAULT NULL,
  `creado_por` varchar(100) DEFAULT NULL,
  `modificado_por` varchar(100) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registros_transparencia`
--

LOCK TABLES `registros_transparencia` WRITE;
/*!40000 ALTER TABLE `registros_transparencia` DISABLE KEYS */;
INSERT INTO `registros_transparencia` VALUES (43,'Información Pública de Oficio Mexiquense (IPOMEX), se realiza en línea y es otorgada por la Unidad de Transparencia y Acceso a la Información','Obtener información generada por el Ayuntamiento de Atizapán de Zaragoza, publicada en la plataforma de Información Pública de Oficio (IPOMEX).','PUBLICADO',NULL,NULL,NULL,NULL,NULL),(44,'Sistema de Acceso a la Información Mexiquense (SAIMEX). Se realiza de manera Presencial y  en línea, es otorgada por la Unidad de Transparencia y Acceso a la Información','Este trámite permite a los ciudadanos solicitar información pública a través del Sistema de Acceso a la Información Mexiquense (SAIMEX).','PUBLICADO',NULL,NULL,NULL,NULL,NULL),(45,'Sistema de Acceso, Rectificación, Cancelación y Oposición de Datos Personales del Estado de México (SARCOEM).  Se realiza de manera Presencial y en línea, es otorgada por la Unidad de Transparencia y Acceso a la Información.','El trámite consiste en el ejercicio del derecho de Acceso, Rectificación, Cancelación y Oposición de Datos Personales por parte de la ciudadanía o sus representantes legales, a través del sistema \"SARCOEM\".','PUBLICADO',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `registros_transparencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registros_vinculacion_ciudadana`
--

DROP TABLE IF EXISTS `registros_vinculacion_ciudadana`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registros_vinculacion_ciudadana` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `descripcion` text,
  `estatus` varchar(50) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `fecha_modificacion` datetime DEFAULT NULL,
  `creado_por` varchar(100) DEFAULT NULL,
  `modificado_por` varchar(100) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=331 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registros_vinculacion_ciudadana`
--

LOCK TABLES `registros_vinculacion_ciudadana` WRITE;
/*!40000 ALTER TABLE `registros_vinculacion_ciudadana` DISABLE KEYS */;
INSERT INTO `registros_vinculacion_ciudadana` VALUES (320,'ASESORÍA Y CAPACITACIÓN PARA CONSEJOS DE PARTICIPACIÓN CIUDADANA, PRESENCIAL Y POR ESCRITO Y ES OTORGADO POR LA SUDIRECCIÓN DE COPACIS','Se brinda asesorías sobre atribuciones y facultades; así como, sobre reglamentación vigente en la entidad.','PUBLICADO',NULL,NULL,NULL,NULL,NULL),(330,'ASESORÍA A LA CIUDADANÍA, SOBRE LOS SERVICIOS QUE PRESTA LA ADMINISTRACIÓN PÚBLICA MUNICIPAL DE FORMA PRESENCIAL Y ES OTORGADO POR LA SUBDIRECCIÓN DE COPACIS','Se brinda asesorías sobre atribuciones y facultades de los COPACIS y Direcciones; así como, sobre reglamentación vigente en la entidad aplicables a las áreas de la Administración Municipal.','PUBLICADO',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `registros_vinculacion_ciudadana` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password_hash` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre_completo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rol` enum('ADMIN','EDITOR','VIEWER') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'VIEWER',
  `activo` tinyint(1) DEFAULT '1',
  `ultimo_acceso` timestamp NULL DEFAULT NULL,
  `fecha_creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_modificacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'admin','admin@atizapan.gob.mx','$2b$10$example_hash_here','Administrador del Sistema','ADMIN',1,NULL,'2025-05-25 00:37:48','2025-05-25 00:37:48');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vista_registros_completa`
--

DROP TABLE IF EXISTS `vista_registros_completa`;
/*!50001 DROP VIEW IF EXISTS `vista_registros_completa`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_registros_completa` AS SELECT 
 1 AS `id`,
 1 AS `nombre`,
 1 AS `descripcion`,
 1 AS `estatus`,
 1 AS `fecha_creacion`,
 1 AS `fecha_modificacion`,
 1 AS `creado_por`,
 1 AS `categorias`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'contraloria_municipal'
--

--
-- Dumping routines for database 'contraloria_municipal'
--
/*!50003 DROP FUNCTION IF EXISTS `ContarRegistros` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `ContarRegistros`(
    search_term VARCHAR(255),
    status_filter VARCHAR(50)
) RETURNS int
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE total_count INT;
    
    SELECT COUNT(*) INTO total_count
    FROM registros_contraloria r
    WHERE r.activo = TRUE
    AND (
        search_term IS NULL 
        OR search_term = '' 
        OR r.nombre LIKE CONCAT('%', search_term, '%')
        OR r.descripcion LIKE CONCAT('%', search_term, '%')
    )
    AND (
        status_filter IS NULL 
        OR status_filter = '' 
        OR r.estatus = status_filter
    );
    
    RETURN total_count;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `BuscarRegistros` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `BuscarRegistros`(
    IN search_term VARCHAR(255),
    IN status_filter VARCHAR(50),
    IN limit_count INT,
    IN offset_count INT
)
BEGIN
    SELECT * FROM (
        SELECT 
            r.id,
            r.nombre,
            r.descripcion,
            r.estatus,
            r.fecha_creacion,
            r.fecha_modificacion
        FROM registros_contraloria r
        WHERE r.activo = TRUE
        AND (
            search_term IS NULL 
            OR search_term = '' 
            OR r.nombre LIKE CONCAT('%', search_term, '%')
            OR r.descripcion LIKE CONCAT('%', search_term, '%')
        )
        AND (
            status_filter IS NULL 
            OR status_filter = '' 
            OR r.estatus = status_filter
        )
        ORDER BY r.fecha_modificacion DESC
    ) AS filtered_results
    LIMIT limit_count OFFSET offset_count;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vista_registros_completa`
--

/*!50001 DROP VIEW IF EXISTS `vista_registros_completa`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_registros_completa` AS select `r`.`id` AS `id`,`r`.`nombre` AS `nombre`,`r`.`descripcion` AS `descripcion`,`r`.`estatus` AS `estatus`,`r`.`fecha_creacion` AS `fecha_creacion`,`r`.`fecha_modificacion` AS `fecha_modificacion`,`r`.`creado_por` AS `creado_por`,group_concat(`c`.`nombre` separator ', ') AS `categorias` from ((`registros_contraloria` `r` left join `registro_categorias` `rc` on((`r`.`id` = `rc`.`registro_id`))) left join `categorias` `c` on((`rc`.`categoria_id` = `c`.`id`))) where (`r`.`activo` = true) group by `r`.`id`,`r`.`nombre`,`r`.`descripcion`,`r`.`estatus`,`r`.`fecha_creacion`,`r`.`fecha_modificacion`,`r`.`creado_por` */;
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

-- Dump completed on 2025-05-26 18:42:35
