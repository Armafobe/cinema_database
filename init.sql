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

CREATE TABLE IF NOT EXISTS movie_theater_admin(
	admin_id INT(11) NOT NULL,
	movie_theater_id INT(11) NOT NULL,
	PRIMARY KEY (admin_id, movie_theater_id),
	CONSTRAINT FK_admin_id FOREIGN KEY (admin_id) REFERENCES admin(id) ON DELETE CASCADE,
	CONSTRAINT FK_movie_theater FOREIGN KEY (movie_theater_id) REFERENCES movie_theater(id)
) ENGINE=InnoDB;
