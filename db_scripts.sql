create database cafe_ordering_system;

use cafe_ordering_system;

CREATE TABLE `customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `mobile_number` varchar(50) NOT NULL,
  `table_number` varchar(50) NOT NULL,
  `log_in_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
);

CREATE TABLE `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_type` varchar(50) NOT NULL,
  `item_name` varchar(50) NOT NULL,
  `remaining` int(11) NOT NULL,
  `unit_price` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menu_uc_type_name` (`item_type`,`item_name`)
);


CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `order_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `order_status` varchar(20) NOT NULL DEFAULT 'PENDING',
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`),
  KEY `menu_id` (`menu_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`id`)
);


CREATE TABLE `ledger` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `total_price` int(11) NOT NULL,
  `payment_status` varchar(10) NOT NULL DEFAULT 'NOT PAID',
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `ledger_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`)
);


insert into menu(item_type,item_name,remaining,unit_price) values('Tea', 'Read tea', 10, 5);
insert into menu(item_type,item_name,remaining,unit_price) values('Tea', 'Green tea', 10, 10);
insert into menu(item_type,item_name,remaining,unit_price) values('Tea', 'Seven layer tea', 10, 30);

insert into menu(item_type,item_name,remaining,unit_price) values('Coffee', 'Regular coffee', 10, 20);
insert into menu(item_type,item_name,remaining,unit_price) values('Coffee', 'Cold coffee', 10, 50);

insert into menu(item_type,item_name,remaining,unit_price) values('Ice-cream', 'vanila', 10, 50);


