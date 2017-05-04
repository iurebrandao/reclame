-- MySQL dump 10.13  Distrib 5.7.18, for Linux (x86_64)
--
-- Host: localhost    Database: bd_reclame
-- ------------------------------------------------------
-- Server version	5.7.18-0ubuntu0.16.04.1

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (2,'Administrador'),(1,'Usuário Comum');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
INSERT INTO `auth_group_permissions` VALUES (1,2,1),(2,2,2),(3,2,3),(4,2,4),(5,2,5),(6,2,6),(7,2,7),(8,2,8),(9,2,9),(10,2,10),(11,2,11),(12,2,12),(13,2,13),(14,2,14),(15,2,15),(16,2,16),(17,2,17),(18,2,18),(19,2,19),(20,2,20),(21,2,21),(22,2,22),(23,2,23),(24,2,24),(25,2,25),(26,2,26),(27,2,27),(28,2,28),(29,2,29),(30,2,30),(31,2,31),(32,2,32),(33,2,33),(34,2,34),(35,2,35),(36,2,36);
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add Usuário',1,'add_usuario'),(2,'Can change Usuário',1,'change_usuario'),(3,'Can delete Usuário',1,'delete_usuario'),(4,'Can add Tema',3,'add_tema'),(5,'Can change Tema',3,'change_tema'),(6,'Can delete Tema',3,'delete_tema'),(7,'Can add Problema',4,'add_problema'),(8,'Can change Problema',4,'change_problema'),(9,'Can delete Problema',4,'delete_problema'),(10,'Can add Cidade',5,'add_cidade'),(11,'Can change Cidade',5,'change_cidade'),(12,'Can delete Cidade',5,'delete_cidade'),(13,'Can add Reclamação',6,'add_reclamacao'),(14,'Can change Reclamação',6,'change_reclamacao'),(15,'Can delete Reclamação',6,'delete_reclamacao'),(16,'Can add Ambiente',7,'add_ambiente'),(17,'Can change Ambiente',7,'change_ambiente'),(18,'Can delete Ambiente',7,'delete_ambiente'),(19,'Can add log entry',8,'add_logentry'),(20,'Can change log entry',8,'change_logentry'),(21,'Can delete log entry',8,'delete_logentry'),(22,'Can add permission',9,'add_permission'),(23,'Can change permission',9,'change_permission'),(24,'Can delete permission',9,'delete_permission'),(25,'Can add group',2,'add_group'),(26,'Can change group',2,'change_group'),(27,'Can delete group',2,'delete_group'),(28,'Can add user',10,'add_user'),(29,'Can change user',10,'change_user'),(30,'Can delete user',10,'delete_user'),(31,'Can add content type',11,'add_contenttype'),(32,'Can change content type',11,'change_contenttype'),(33,'Can delete content type',11,'delete_contenttype'),(34,'Can add session',12,'add_session'),(35,'Can change session',12,'change_session'),(36,'Can delete session',12,'delete_session');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$30000$Fp6omD9m5HMF$jokzDS5mNwlv0EBN7aMLcbdB5gjTO+qD836MzG/5/Zc=','2017-05-04 17:35:54.262073',1,'iure','','','iure@gmail.com',1,1,'2017-05-04 15:32:00.883340'),(2,'pbkdf2_sha256$30000$iw6ykXrXKpWb$jEUtbHwJzunZzr0+DDSdu1b40iBKWEBHyHszw40rROE=','2017-05-04 17:34:41.572023',1,'victor','','','victor@gmail.com',1,1,'2017-05-04 15:43:20.242207'),(3,'pbkdf2_sha256$30000$cmLDgLIcVzaX$1QJIXrttwnuBUKcFHz3OHJUZ5EY7rVa5iIa84sDl+nc=','2017-05-04 17:28:57.444501',0,'joao','','','joao@gmail.com',0,1,'2017-05-04 17:07:06.945410');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
INSERT INTO `auth_user_groups` VALUES (1,2,2),(2,3,1);
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2017-05-04 15:41:29.042904','2','Administrador',1,'[{\"added\": {}}]',2,1),(2,'2017-05-04 15:43:20.476039','2','Victor',1,'[{\"added\": {}}]',1,1),(3,'2017-05-04 17:09:24.327935','1','Taguatinga',1,'[{\"added\": {}}]',5,1),(4,'2017-05-04 17:10:28.764761','2','Ceilândia',1,'[{\"added\": {}}]',5,1),(5,'2017-05-04 17:11:26.072331','3','Samambaia Sul',1,'[{\"added\": {}}]',5,1),(6,'2017-05-04 17:12:32.700242','1','Escolar',1,'[{\"added\": {}}]',7,1),(7,'2017-05-04 17:12:36.824244','2','Universitário',1,'[{\"added\": {}}]',7,1),(8,'2017-05-04 17:12:50.382719','1','Infraestrutura',1,'[{\"added\": {}}]',4,1),(9,'2017-05-04 17:12:53.847104','2','Falta de verba',1,'[{\"added\": {}}]',4,1),(10,'2017-05-04 17:13:02.845449','1','Educação',1,'[{\"added\": {}}]',3,1),(11,'2017-05-04 17:33:20.524629','3','Falta de verba para livros da faculdade',2,'[{\"changed\": {\"fields\": [\"usuario\"]}}]',6,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (8,'admin','logentry'),(2,'auth','group'),(9,'auth','permission'),(10,'auth','user'),(11,'contenttypes','contenttype'),(7,'reclamacao','ambiente'),(5,'reclamacao','cidade'),(4,'reclamacao','problema'),(6,'reclamacao','reclamacao'),(3,'reclamacao','tema'),(12,'sessions','session'),(1,'usuario','usuario');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2017-05-04 15:30:44.588987'),(2,'auth','0001_initial','2017-05-04 15:30:52.195972'),(3,'admin','0001_initial','2017-05-04 15:30:53.834085'),(4,'admin','0002_logentry_remove_auto_add','2017-05-04 15:30:53.947243'),(5,'contenttypes','0002_remove_content_type_name','2017-05-04 15:30:54.933970'),(6,'auth','0002_alter_permission_name_max_length','2017-05-04 15:30:55.046840'),(7,'auth','0003_alter_user_email_max_length','2017-05-04 15:30:55.267124'),(8,'auth','0004_alter_user_username_opts','2017-05-04 15:30:55.313833'),(9,'auth','0005_alter_user_last_login_null','2017-05-04 15:30:56.143764'),(10,'auth','0006_require_contenttypes_0002','2017-05-04 15:30:56.177359'),(11,'auth','0007_alter_validators_add_error_messages','2017-05-04 15:30:56.230608'),(12,'auth','0008_alter_user_username_max_length','2017-05-04 15:30:56.846739'),(13,'usuario','0001_initial','2017-05-04 15:30:57.209651'),(14,'usuario','0002_auto_20170428_1557','2017-05-04 15:30:57.343625'),(15,'usuario','0003_usuario_grupo_usuario','2017-05-04 15:32:56.194654'),(16,'usuario','0004_auto_20170502_2126','2017-05-04 15:32:57.744631'),(17,'usuario','0005_usuario_username','2017-05-04 15:32:58.553732'),(18,'reclamacao','0001_initial','2017-05-04 15:33:05.049328'),(19,'reclamacao','0002_auto_20170504_0059','2017-05-04 15:33:10.263246'),(20,'reclamacao','0003_auto_20170504_0120','2017-05-04 15:33:10.362637'),(21,'sessions','0001_initial','2017-05-04 15:33:11.094863'),(22,'usuario','0006_remove_usuario_rg','2017-05-04 15:33:11.758573'),(23,'usuario','0007_auto_20170504_1237','2017-05-04 15:37:48.764779'),(24,'usuario','0007_auto_20170504_1240','2017-05-04 15:40:39.852728');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('kcio2zic2eks8v3u3xk7hzf7si355n9p','NGZmNTZlNGY3N2YzMmRmMjg4ZjI3ZDIyZDEwNDJjMTRmYmQwMzg2OTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNmIzN2Q0ZTNlMzE2ZmMzYzRhMDhjZTEwNWMxZWMzN2E0OGJiMmQ5NCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2017-05-18 17:35:54.296171');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reclamacao_ambiente`
--

DROP TABLE IF EXISTS `reclamacao_ambiente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reclamacao_ambiente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ambiente` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reclamacao_ambiente`
--

LOCK TABLES `reclamacao_ambiente` WRITE;
/*!40000 ALTER TABLE `reclamacao_ambiente` DISABLE KEYS */;
INSERT INTO `reclamacao_ambiente` VALUES (1,'Escolar'),(2,'Universitário');
/*!40000 ALTER TABLE `reclamacao_ambiente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reclamacao_cidade`
--

DROP TABLE IF EXISTS `reclamacao_cidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reclamacao_cidade` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(200) NOT NULL,
  `longitude` double NOT NULL,
  `latitude` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reclamacao_cidade`
--

LOCK TABLES `reclamacao_cidade` WRITE;
/*!40000 ALTER TABLE `reclamacao_cidade` DISABLE KEYS */;
INSERT INTO `reclamacao_cidade` VALUES (1,'Taguatinga',-48.0794078,-15.8076275),(2,'Ceilândia',-48.1163981,-15.8215045),(3,'Samambaia Sul',-48.2201119,-15.8924231);
/*!40000 ALTER TABLE `reclamacao_cidade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reclamacao_problema`
--

DROP TABLE IF EXISTS `reclamacao_problema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reclamacao_problema` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `problema` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reclamacao_problema`
--

LOCK TABLES `reclamacao_problema` WRITE;
/*!40000 ALTER TABLE `reclamacao_problema` DISABLE KEYS */;
INSERT INTO `reclamacao_problema` VALUES (1,'Infraestrutura'),(2,'Falta de verba');
/*!40000 ALTER TABLE `reclamacao_problema` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reclamacao_reclamacao`
--

DROP TABLE IF EXISTS `reclamacao_reclamacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reclamacao_reclamacao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` longtext NOT NULL,
  `ambiente_id` int(11) NOT NULL,
  `cidade_id` int(11) NOT NULL,
  `problema_id` int(11) NOT NULL,
  `tema_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `reclamacao_reclamacao_64c6c4da` (`tema_id`),
  KEY `reclamacao_reclamacao_76a74f43` (`usuario_id`),
  KEY `reclamacao_reclam_ambiente_id_b6e0df28_fk_reclamacao_ambiente_id` (`ambiente_id`),
  KEY `reclamacao_reclamacao_cidade_id_ccc29fed_fk_reclamacao_cidade_id` (`cidade_id`),
  KEY `reclamacao_reclam_problema_id_f3d07144_fk_reclamacao_problema_id` (`problema_id`),
  CONSTRAINT `reclamacao_reclam_ambiente_id_b6e0df28_fk_reclamacao_ambiente_id` FOREIGN KEY (`ambiente_id`) REFERENCES `reclamacao_ambiente` (`id`),
  CONSTRAINT `reclamacao_reclam_problema_id_f3d07144_fk_reclamacao_problema_id` FOREIGN KEY (`problema_id`) REFERENCES `reclamacao_problema` (`id`),
  CONSTRAINT `reclamacao_reclamacao_cidade_id_ccc29fed_fk_reclamacao_cidade_id` FOREIGN KEY (`cidade_id`) REFERENCES `reclamacao_cidade` (`id`),
  CONSTRAINT `reclamacao_reclamacao_tema_id_0eb03c18_fk_reclamacao_tema_id` FOREIGN KEY (`tema_id`) REFERENCES `reclamacao_tema` (`id`),
  CONSTRAINT `reclamacao_reclamacao_usuario_id_95fc1d13_fk_usuario_usuario_ID` FOREIGN KEY (`usuario_id`) REFERENCES `usuario_usuario` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reclamacao_reclamacao`
--

LOCK TABLES `reclamacao_reclamacao` WRITE;
/*!40000 ALTER TABLE `reclamacao_reclamacao` DISABLE KEYS */;
INSERT INTO `reclamacao_reclamacao` VALUES (1,'Problema na sala de aula',1,1,1,1,1),(2,'Falta de verba para lanches na escola',1,3,2,1,3),(3,'Falta de verba para livros da faculdade',2,2,2,1,3);
/*!40000 ALTER TABLE `reclamacao_reclamacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reclamacao_tema`
--

DROP TABLE IF EXISTS `reclamacao_tema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reclamacao_tema` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tema` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reclamacao_tema`
--

LOCK TABLES `reclamacao_tema` WRITE;
/*!40000 ALTER TABLE `reclamacao_tema` DISABLE KEYS */;
INSERT INTO `reclamacao_tema` VALUES (1,'Educação');
/*!40000 ALTER TABLE `reclamacao_tema` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_usuario`
--

DROP TABLE IF EXISTS `usuario_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario_usuario` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `CPF` varchar(15) NOT NULL,
  `sexo` varchar(1) NOT NULL,
  `email` varchar(254) NOT NULL,
  `senha` varchar(128) NOT NULL,
  `data_nasc` date NOT NULL,
  `grupo_usuario_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `username` varchar(45) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `CPF` (`CPF`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `user_id` (`user_id`),
  UNIQUE KEY `username` (`username`),
  KEY `usuario_usuario_a731dc66` (`grupo_usuario_id`),
  CONSTRAINT `usuario_usuario_grupo_usuario_id_78f12bf3_fk_auth_group_id` FOREIGN KEY (`grupo_usuario_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `usuario_usuario_user_id_8c646d4a_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_usuario`
--

LOCK TABLES `usuario_usuario` WRITE;
/*!40000 ALTER TABLE `usuario_usuario` DISABLE KEYS */;
INSERT INTO `usuario_usuario` VALUES (1,'Iure','00000000','M','iure@gmail.com','reclame','1996-06-18',2,1,'iure'),(2,'Victor','000000000000001','M','victor@gmail.com','sadIODOAS@(*@!(@!*#DSAUHAS','2000-01-01',2,2,'victor'),(3,'Joao','000.000.000-22','M','joao@gmail.com','sadIODOAS@(*@!(@!*#DSAUHAS','1984-06-01',1,3,'joao');
/*!40000 ALTER TABLE `usuario_usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-05-04 14:38:12
