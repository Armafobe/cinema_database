-- Connexion au serveur SQL

mysql -h localhost:8889 -u root -p root

-- Création la base de données en encodage utf8

CREATE DATABASE IF NOT EXISTS cinema_booking CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

-- Précision d'utiliser la base de données cinema_booking précédemment créée

USE cinema_booking;

-- Création des tables

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
	name VARCHAR(100) NOT NULL,
	synopsis TEXT NOT NULL,
	running_time INT(3) NOT NULL,
	genre VARCHAR(60) NOT NULL,
	rating VARCHAR(20)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS movie_session (
	id INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
	date DATE NOT NULL,
	time TIME NOT NULL,
	movie_id INT(11),
	movie_room_id INT(11),
	CONSTRAINT FK_movie_id FOREIGN KEY (movie_id) REFERENCES movie(id)
	CONSTRAINT FK_movie_room_id FOREIGN KEY (movie_room_id) REFERENCES movie_rom(id)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS payment (
	id INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
	type VARCHAR(30) NOT NULL,
	price DECIMAL(4, 2) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS customer (
	id INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
	lastname VARCHAR(60) NOT NULL,
	firstname VARCHAR(60) NOT NULL,
	username VARCHAR(60) UNIQUE,
	password CHAR(255) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS booking (
	id INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
	booking_date DATETIME NOT NULL,
	payment_type VARCHAR(20) NOT NULL,
	payment_date DATETIME NOT NULL,
	movie_session_id INT(11) NOT NULL,
	payment_id INT(11) NOT NULL,
	customer_id INT(11) NOT NULL,
	CONSTRAINT FK_movie_session_id FOREIGN KEY (movie_session_id) REFERENCES movie_session(id),
	CONSTRAINT FK_payment_id FOREIGN KEY (payment_id) REFERENCES payment(id),
	CONSTRAINT FK_customer_id FOREIGN KEY (customer_id) REFERENCES customer(id)
) ENGINE=InnoDB;
