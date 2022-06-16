-- Installer MYSQL Server, Router, Workbench & Shell
-- Ouvrir MySQL Workbench

-- Créer la base de données

CREATE DATABASE IF NOT EXISTS cinema_booking CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

USE cinema_booking;

CREATE TABLE IF NOT EXISTS admin(
	id INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
	username VARCHAR(100) NOT NULL UNIQUE,
	password VARCHAR(255) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS user(
	id int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    	username VARCHAR(100) NOT NULL UNIQUE,
	password VARCHAR(255) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS movie_theater(
	id INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
	name VARCHAR(60) NOT NULL,
	city VARCHAR(255) NOT NULL,
	address VARCHAR(255) NOT NULL,
	zipcode INT(5) NOT NULL,
	user_id INT(11) NOT NULL,
	CONSTRAINT FK_user_id FOREIGN KEY (user_id) REFERENCES user(id)
) ENGINE=InnoDB; 
