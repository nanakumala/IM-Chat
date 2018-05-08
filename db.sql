/*
SQLyog Ultimate v12.4.1 (64 bit)
MySQL - 10.1.30-MariaDB : Database - laravel-chat
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `chatroom` */

DROP TABLE IF EXISTS `chatroom`;

CREATE TABLE `chatroom` (
  `id` int(11) NOT NULL,
  `user1` int(11) DEFAULT NULL,
  `user2` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `chatroom` */

/*Table structure for table `det_chatroom` */

DROP TABLE IF EXISTS `det_chatroom`;

CREATE TABLE `det_chatroom` (
  `id` int(11) NOT NULL,
  `id_chatroom` int(11) DEFAULT NULL,
  `message` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `id_user` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `det_chatroom` */

/*Table structure for table `inbox` */

DROP TABLE IF EXISTS `inbox`;

CREATE TABLE `inbox` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `sender` int(10) unsigned DEFAULT NULL,
  `receiver` int(10) unsigned DEFAULT NULL,
  `message` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `inbox` */

insert  into `inbox`(`id`,`sender`,`receiver`,`message`,`created_at`,`updated_at`) values 
(1,2,3,'hy rip','2018-05-07 01:24:06','0000-00-00 00:00:00'),
(2,3,2,'jg','2018-05-07 01:38:50','0000-00-00 00:00:00'),
(3,2,3,'saklek amat','2018-05-07 01:40:27','0000-00-00 00:00:00');

/*Table structure for table `messages` */

DROP TABLE IF EXISTS `messages`;

CREATE TABLE `messages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `messages` */

insert  into `messages`(`id`,`user_id`,`message`,`created_at`,`updated_at`) values 
(1,1,'pooii','2018-04-29 15:32:47','2018-04-29 15:32:47'),
(2,1,'wqeqwe','2018-04-29 15:34:02','2018-04-29 15:34:02'),
(3,1,'oii','2018-04-29 15:47:12','2018-04-29 15:47:12'),
(4,1,'oii','2018-04-29 15:49:01','2018-04-29 15:49:01'),
(5,1,'oii','2018-04-29 15:52:47','2018-04-29 15:52:47'),
(6,1,'oii','2018-04-29 15:55:08','2018-04-29 15:55:08'),
(7,1,'oiii','2018-04-29 16:01:20','2018-04-29 16:01:20'),
(8,1,'oi','2018-04-29 16:02:18','2018-04-29 16:02:18'),
(9,1,'oii','2018-04-29 16:02:48','2018-04-29 16:02:48'),
(10,1,'wqeqwe','2018-04-29 16:05:55','2018-04-29 16:05:55'),
(11,1,'oi','2018-05-03 14:04:26','2018-05-03 14:04:26'),
(12,1,'yaa','2018-05-03 14:04:36','2018-05-03 14:04:36'),
(13,1,'iuu','2018-05-03 14:04:46','2018-05-03 14:04:46'),
(14,1,'oiii','2018-05-03 14:05:15','2018-05-03 14:05:15'),
(15,1,'asd','2018-05-03 15:07:58','2018-05-03 15:07:58'),
(16,1,'koko','2018-05-03 15:08:13','2018-05-03 15:08:13'),
(17,1,'s','2018-05-03 15:11:08','2018-05-03 15:11:08'),
(18,1,'oii','2018-05-03 15:13:57','2018-05-03 15:13:57'),
(19,2,'sip','2018-05-03 15:22:47','2018-05-03 15:22:47'),
(20,1,'scf','2018-05-03 15:22:57','2018-05-03 15:22:57'),
(21,3,'wkwkwk','2018-05-06 16:37:20','2018-05-06 16:37:20'),
(22,3,'hallo','2018-05-06 16:40:44','2018-05-06 16:40:44'),
(23,1,'tes','2018-05-06 16:40:52','2018-05-06 16:40:52');

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `migrations` */

insert  into `migrations`(`id`,`migration`,`batch`) values 
(1,'2014_10_12_000000_create_users_table',1),
(2,'2014_10_12_100000_create_password_resets_table',1),
(3,'2018_04_29_121906_create_messages_table',2);

/*Table structure for table `outbox` */

DROP TABLE IF EXISTS `outbox`;

CREATE TABLE `outbox` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sender` int(10) unsigned DEFAULT NULL,
  `receiver` int(10) unsigned DEFAULT NULL,
  `messages` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `outbox` */

insert  into `outbox`(`id`,`sender`,`receiver`,`messages`,`created_at`,`updated_at`) values 
(1,2,3,'hy rip','2018-05-07 01:38:10','0000-00-00 00:00:00'),
(2,3,2,'jg','2018-05-07 01:38:32','0000-00-00 00:00:00'),
(3,2,3,'saklek amat','2018-05-07 01:40:41','0000-00-00 00:00:00');

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
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`name`,`email`,`password`,`remember_token`,`created_at`,`updated_at`) values 
(1,'Nana','kumalanana@gmail.com','$2y$10$5rk4AwMJEYjvKRToY6MRjOb4Q4PWuFEtS606YaQ2Eu/xh/wzzdY42',NULL,'2018-04-29 14:56:39','2018-04-29 14:56:39'),
(2,'kumala','kasaku0408@gmail.com','$2y$10$wNx3ai1xtjbiUjtCYKfNY.KCRYAWEGxg6t.4GwTwEoYDGWK7JyqkW',NULL,'2018-05-03 15:10:53','2018-05-03 15:10:53'),
(3,'Urip Yogantara','uripyogantara@gmail.com','$2y$10$kOW2knsSmrzNr45JKPxEaep/HLxherAy0/G7sWk8p87Gh6J0LVWI.','9N6b6yAr8LDGQEYVR1SHepaSpE3GQaVl0O0oJhCwWUTozJYJGOqurlGFgpid','2018-05-06 16:33:00','2018-05-06 16:33:00');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
