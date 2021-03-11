CREATE database user_db;

CREATE TABLE user_db.`USER` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(45) NOT NULL,
  `surname` varchar(45) NOT NULL,
  `gender` varchar(45) NOT NULL,
  `birthday` date NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE user_db.`ADDRESS` (
  `address_id` int(10) unsigned NOT NULL auto_increment,
  `work_address` varchar(255) NOT NULL,
  `home_address` varchar(255) NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`address_id`),
  FOREIGN KEY (`user_id`) REFERENCES USER (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;