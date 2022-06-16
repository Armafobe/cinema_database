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

CREATE TABLE IF NOT EXISTS movie_room(
	id INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
	movie_room_number INT(1) NOT NULL,
	seats INT(3) NOT NULL,
	movie_theater_id INT(11) NOT NULL,
	CONSTRAINT FK_movie_theater_admin FOREIGN KEY (movie_theater_id) REFERENCES movie_theater(id)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS movie (
	id INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR(100),
    synopsis TEXT,
    running_time INT(3),
    genre VARCHAR(20),
    rating VARCHAR(20)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS movie_session (
	id INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    date DATE,
    time TIME,
    movie_id INT(11),
    CONSTRAINT FK_movie_id FOREIGN KEY (movie_id) REFERENCES movie(id)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS movie_room_session (
	movie_room_id INT(11) NOT NULL,
    movie_session_id INT(11) NOT NULL,
    PRIMARY KEY (movie_room_id, movie_session_id),
    CONSTRAINT FK_movie_room_id FOREIGN KEY (movie_room_id) REFERENCES movie_room(id) ON DELETE CASCADE,
    CONSTRAINT FK_movie_session_id FOREIGN KEY (movie_session_id) REFERENCES movie_session(id)
) ENGINE=InnoDB;
