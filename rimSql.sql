/*
SQLyog Ultimate v11.11 (32 bit)
MySQL - 5.5.30 : Database - rims
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`rims` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `rims`;

/*Table structure for table `category` */

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(45) NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `category` */

insert  into `category`(`category_id`,`category_name`) values (1,'Biscuit'),(2,'oil'),(3,'Rice'),(4,'Spices'),(5,'Tooth Paste'),(6,'Biscuit');

/*Table structure for table `company` */

DROP TABLE IF EXISTS `company`;

CREATE TABLE `company` (
  `c_id` int(11) NOT NULL,
  `company_name` varchar(45) NOT NULL,
  PRIMARY KEY (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `company` */

insert  into `company`(`c_id`,`company_name`) values (1,'Parle'),(2,'Britania'),(3,'Pantajali'),(4,'Colgate'),(5,'Parle');

/*Table structure for table `products` */

DROP TABLE IF EXISTS `products`;

CREATE TABLE `products` (
  `p_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '	',
  `pname` varchar(45) NOT NULL,
  `c_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `unit` int(11) NOT NULL,
  `unit_description` varchar(45) NOT NULL,
  `image` blob,
  `price` double DEFAULT NULL,
  PRIMARY KEY (`p_id`),
  KEY `product_companyid_idx` (`c_id`),
  KEY `product_category_idx` (`category_id`),
  CONSTRAINT `product_category` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `product_companyid` FOREIGN KEY (`c_id`) REFERENCES `company` (`c_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `products` */

insert  into `products`(`p_id`,`pname`,`c_id`,`category_id`,`unit`,`unit_description`,`image`,`price`) values (1,'ParleG',5,1,1,'1 Box contains 10 Packets',NULL,40),(2,'Tiger',2,1,1,'1 Box contains 10 Packets',NULL,45),(3,'dant_Kanti',3,5,1,'1 unit is 100 gms',NULL,35),(4,'Max_fresh',1,1,1,'1 unit is 100 gms',NULL,55);

/*Table structure for table `purchase` */

DROP TABLE IF EXISTS `purchase`;

CREATE TABLE `purchase` (
  `purchase_id` int(11) NOT NULL AUTO_INCREMENT,
  `po_no` int(11) DEFAULT NULL,
  `p_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  PRIMARY KEY (`purchase_id`),
  KEY `purchase_poid_idx` (`po_no`),
  KEY `purchase_pid_idx` (`p_id`),
  CONSTRAINT `purchase_pid` FOREIGN KEY (`p_id`) REFERENCES `products` (`p_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `purchase_poid` FOREIGN KEY (`po_no`) REFERENCES `purchaseorder` (`po_no`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

/*Data for the table `purchase` */

insert  into `purchase`(`purchase_id`,`po_no`,`p_id`,`qty`) values (1,101,1,10),(2,101,2,8),(3,102,3,50),(4,103,1,5),(5,103,2,5),(6,103,3,4),(7,118,1,10),(8,118,2,8),(9,119,1,10),(10,119,2,8),(11,121,1,10),(12,121,2,8),(13,122,1,10),(14,122,2,8),(15,123,1,10),(16,123,2,8),(17,128,4,7),(18,129,1,9),(19,130,4,15),(20,131,2,10),(21,132,3,100);

/*Table structure for table `purchaseorder` */

DROP TABLE IF EXISTS `purchaseorder`;

CREATE TABLE `purchaseorder` (
  `po_no` int(11) NOT NULL AUTO_INCREMENT,
  `u_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `ship_address` varchar(45) NOT NULL,
  `w_id` int(11) NOT NULL,
  `status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`po_no`),
  KEY `po_uid_idx` (`u_id`),
  CONSTRAINT `po_uid` FOREIGN KEY (`u_id`) REFERENCES `users` (`u_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=133 DEFAULT CHARSET=latin1;

/*Data for the table `purchaseorder` */

insert  into `purchaseorder`(`po_no`,`u_id`,`date`,`ship_address`,`w_id`,`status`) values (101,2,'2021-03-14','Kothrud, Pune',0,NULL),(102,2,'2021-03-15','Kothrud, Pune',0,NULL),(103,6,'2021-03-26','Karjat, Pune',0,NULL),(118,2,'2021-03-13','Kothrud, Pune',0,NULL),(119,2,'2021-03-13','Kothrud, Pune',0,NULL),(121,2,'2021-03-13','Kothrud, Pune',0,NULL),(122,2,'2021-03-13','Kothrud, Pune',3,NULL),(123,2,'2021-03-13','Kothrud, Pune',3,NULL),(128,2,'2021-03-28','Pune',3,NULL),(129,2,'2021-03-28','Pune',3,NULL),(130,6,'2021-03-28','karjat',3,NULL),(131,2,'2021-03-29','Pune',3,NULL),(132,2,'2021-03-30','Pune',3,NULL);

/*Table structure for table `reorderlevel` */

DROP TABLE IF EXISTS `reorderlevel`;

CREATE TABLE `reorderlevel` (
  `reorder_id` int(11) NOT NULL AUTO_INCREMENT,
  `p_id` int(11) NOT NULL,
  `reorder_level` int(11) NOT NULL,
  PRIMARY KEY (`reorder_id`),
  KEY `reorderlevel_pid_idx` (`p_id`),
  CONSTRAINT `reorderlevel_pid` FOREIGN KEY (`p_id`) REFERENCES `products` (`p_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `reorderlevel` */

insert  into `reorderlevel`(`reorder_id`,`p_id`,`reorder_level`) values (1,1,20),(2,2,3),(3,3,8);

/*Table structure for table `stock` */

DROP TABLE IF EXISTS `stock`;

CREATE TABLE `stock` (
  `s_id` int(11) NOT NULL AUTO_INCREMENT,
  `p_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `mdate` date DEFAULT NULL,
  `edate` date DEFAULT NULL,
  `order_date` date NOT NULL,
  `price` double DEFAULT NULL,
  PRIMARY KEY (`s_id`),
  KEY `stock_pid_idx` (`p_id`),
  CONSTRAINT `stockpid_pk` FOREIGN KEY (`p_id`) REFERENCES `products` (`p_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1004 DEFAULT CHARSET=latin1;

/*Data for the table `stock` */

insert  into `stock`(`s_id`,`p_id`,`qty`,`mdate`,`edate`,`order_date`,`price`) values (1001,1,8,'2021-01-05','2021-12-12','2021-03-15',400),(1002,2,5,'2021-01-05','2021-12-12','2021-03-15',360),(1003,1,5,'2021-03-29','2021-03-29','2021-03-31',600);

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `u_id` int(11) NOT NULL AUTO_INCREMENT,
  `fname` varchar(45) NOT NULL,
  `lname` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `contactno` varchar(45) NOT NULL,
  `gender` varchar(45) NOT NULL,
  `address` varchar(45) NOT NULL,
  `gst_no` varchar(45) DEFAULT NULL,
  `business_name` varchar(45) DEFAULT NULL,
  `type` varchar(45) NOT NULL,
  PRIMARY KEY (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

/*Data for the table `users` */

insert  into `users`(`u_id`,`fname`,`lname`,`email`,`password`,`contactno`,`gender`,`address`,`gst_no`,`business_name`,`type`) values (1,'Akshay','Bhujang','akshay@gamil.com','123456','7704758888','Male','Pune','22AAMPB8456M1Z3',NULL,'admin'),(2,'Awdesh','Prajapati','awdesh@gmail.com','awdesh','9850907534','Male','Pune','22AAMPB8456M1Z3','Prajapati Retailers','retailer'),(3,'Shubham','Borse','shubham@gmail.com','shubham','7385933891','Male','Pune','27CCMPB8458H2XX','Borse Wholesalers','wholesaler'),(6,'gajendra','pawane','gaju21806@gmail.com','123','5555555555','male','karjat','xxxxxxxxxxx','hhhhhhhh','retailer'),(7,'','','','','','','','','','admin'),(8,'gajendra','pawane','gaju@gmail.com','1234','7028249581','male','karjat','22AAMPB8456M1Z3','retailer','retailer');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
