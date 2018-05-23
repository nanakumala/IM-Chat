/*
SQLyog Ultimate v11.33 (64 bit)
MySQL - 10.1.24-MariaDB : Database - laravel-chat
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`laravel-chat` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `laravel-chat`;

/*Table structure for table `chatroom` */

DROP TABLE IF EXISTS `chatroom`;

CREATE TABLE `chatroom` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user1` int(11) DEFAULT NULL,
  `user2` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `chatroom` */

insert  into `chatroom`(`id`,`user1`,`user2`,`created_at`,`updated_at`) values (1,4,1,'2018-05-08 15:01:23','2018-05-08 15:01:23'),(2,4,2,'2018-05-08 15:03:21','2018-05-08 15:03:21'),(3,4,3,'2018-05-08 15:03:24','2018-05-08 15:03:24'),(4,1,3,'2018-05-08 16:34:52','2018-05-08 16:34:52'),(5,1,2,'2018-05-08 16:34:54','2018-05-08 16:34:54'),(6,1,5,'2018-05-22 16:18:58','2018-05-22 16:18:58'),(7,6,8,'2018-05-22 17:49:23','2018-05-22 17:49:23');

/*Table structure for table `det_chatroom` */

DROP TABLE IF EXISTS `det_chatroom`;

CREATE TABLE `det_chatroom` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_chatroom` int(11) DEFAULT NULL,
  `message` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;

/*Data for the table `det_chatroom` */

insert  into `det_chatroom`(`id`,`id_chatroom`,`message`,`created_at`,`updated_at`,`user_id`) values (5,1,'heyy','2018-05-08 15:15:57','2018-05-08 15:15:57',4),(12,1,'oi','2018-05-08 15:31:25','2018-05-08 15:31:25',4),(13,1,'oi','2018-05-08 15:31:53','2018-05-08 15:31:53',4),(14,1,'oi','2018-05-08 15:38:11','2018-05-08 15:38:11',1),(15,1,'kampret','2018-05-08 15:38:32','2018-05-08 15:38:32',1),(16,1,'kenapa coy ?','2018-05-08 15:38:38','2018-05-08 15:38:38',4),(17,1,'gpp kok coy','2018-05-08 15:38:47','2018-05-08 15:38:47',1),(18,1,'kenapa ?','2018-05-08 15:42:03','2018-05-08 15:42:03',4),(19,1,'gpp kok','2018-05-08 15:42:15','2018-05-08 15:42:15',1),(20,1,'wee buduh','2018-05-08 15:43:08','2018-05-08 15:43:08',4),(21,1,'oiii','2018-05-08 15:45:21','2018-05-08 15:45:21',4),(22,1,'oii','2018-05-08 15:46:19','2018-05-08 15:46:19',4),(23,1,'wkwk','2018-05-08 15:47:02','2018-05-08 15:47:02',4),(24,1,'wkwk','2018-05-08 15:48:17','2018-05-08 15:48:17',4),(25,NULL,'wkwk','2018-05-08 16:11:31','2018-05-08 16:11:31',4),(26,NULL,'hy na','2018-05-08 16:29:15','2018-05-08 16:29:15',4),(27,NULL,'oit','2018-05-08 16:29:30','2018-05-08 16:29:30',1),(28,NULL,'oi','2018-05-08 16:29:59','2018-05-08 16:29:59',4),(29,NULL,'kampret','2018-05-08 16:30:17','2018-05-08 16:30:17',1),(30,1,'oi','2018-05-08 16:32:14','2018-05-08 16:32:14',4),(31,1,'kampret','2018-05-08 16:32:21','2018-05-08 16:32:21',1),(32,1,'oi','2018-05-08 16:33:15','2018-05-08 16:33:15',1),(33,1,'kenapa gan ?','2018-05-08 16:33:24','2018-05-08 16:33:24',1),(34,1,'kenapa ?','2018-05-08 16:33:59','2018-05-08 16:33:59',1),(35,1,'ape teh nani ?','2018-05-08 16:34:05','2018-05-08 16:34:05',4);

/*Table structure for table `inbox` */

DROP TABLE IF EXISTS `inbox`;

CREATE TABLE `inbox` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `sender` int(10) unsigned DEFAULT NULL,
  `receiver` int(10) unsigned DEFAULT NULL,
  `id_chatroom` int(11) DEFAULT NULL,
  `messages` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `flag` enum('inbox') DEFAULT 'inbox',
  `status` enum('just_arrived','done') DEFAULT 'just_arrived',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;

/*Data for the table `inbox` */

insert  into `inbox`(`id`,`sender`,`receiver`,`id_chatroom`,`messages`,`created_at`,`updated_at`,`flag`,`status`) values (33,6,8,7,'hey','2018-05-23 02:20:21','2018-05-22 18:20:20','inbox','done'),(34,8,6,7,'Hey Juga Bro','2018-05-23 02:20:21','2018-05-22 18:20:21','inbox','done'),(35,6,8,7,'kamu siapa ?','2018-05-23 02:21:37','2018-05-22 18:21:29','inbox','done'),(36,8,6,7,'Aku Nana Bot, Salam Kenal','2018-05-23 02:21:37','2018-05-22 18:21:32','inbox','done');

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `migrations` */

insert  into `migrations`(`id`,`migration`,`batch`) values (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2018_04_29_121906_create_messages_table',2);

/*Table structure for table `outbox` */

DROP TABLE IF EXISTS `outbox`;

CREATE TABLE `outbox` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sender` int(10) unsigned DEFAULT NULL,
  `receiver` int(10) unsigned DEFAULT NULL,
  `id_chatroom` int(11) DEFAULT NULL,
  `messages` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `flag` enum('outbox') DEFAULT 'outbox',
  `status` enum('just_arrived','done') DEFAULT 'just_arrived',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;

/*Data for the table `outbox` */

insert  into `outbox`(`id`,`sender`,`receiver`,`id_chatroom`,`messages`,`created_at`,`updated_at`,`flag`,`status`) values (33,6,8,7,'hey','2018-05-23 02:20:21','2018-05-22 18:20:20','outbox','done'),(34,8,6,7,'Hey Juga Bro','2018-05-23 02:20:21','2018-05-22 18:20:21','outbox','done'),(35,6,8,7,'kamu siapa ?','2018-05-23 02:21:37','2018-05-22 18:21:29','outbox','done'),(36,8,6,7,'Aku Nana Bot, Salam Kenal','2018-05-23 02:21:37','2018-05-22 18:21:32','outbox','done');

/*Table structure for table `password_resets` */

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `password_resets` */

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `type` enum('human','bot') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`name`,`email`,`password`,`remember_token`,`created_at`,`updated_at`,`type`) values (6,'I PUTU WAHYU','wahyu.permadi1725@gmail.com','$2y$10$XlwZ9LHBgCCZkEREJfpHZuzblKqUH2M/liKlwTOFdelVss6sX0Pc.',NULL,'2018-05-22 17:45:37','2018-05-22 17:45:37',NULL),(7,'NANA KUMALI','nana@gmail.com','$2y$10$XlwZ9LHBgCCZkEREJfpHZuzblKqUH2M/liKlwTOFdelVss6sX0Pc.',NULL,NULL,NULL,NULL),(8,'nanaBOT','','',NULL,NULL,NULL,'bot');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
