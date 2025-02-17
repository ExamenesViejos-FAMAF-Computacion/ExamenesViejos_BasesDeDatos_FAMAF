DROP DATABASE IF EXISTS `videogames`;
CREATE DATABASE `videogames` DEFAULT CHARACTER SET utf8mb4;

USE `videogames`;

DROP TABLE IF EXISTS `game`;
CREATE TABLE `game` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `title` VARCHAR(200) NOT NULL,
    `release_date` DATE NOT NULL,
    `price` DECIMAL(5, 2),
    CONSTRAINT gamePK PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `company`;
CREATE TABLE `company` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(200) NOT NULL,
    `address` CHAR(50) NOT NULL,
    `city` CHAR(30) NOT NULL,
    `state` CHAR(20) NOT NULL,
    CONSTRAINT companyPK PRIMARY KEY (`id`),
    CONSTRAINT companyNameSK UNIQUE (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `developers`;
CREATE TABLE `developers` (
    `game` INT NOT NULL,
    `developer` INT NOT NULL,
    CONSTRAINT developerPK PRIMARY KEY (`game`, `developer`),
    CONSTRAINT gameDeveloperFK FOREIGN KEY (`game`) REFERENCES `game` (`id`),
    CONSTRAINT developerFK FOREIGN KEY (`developer`) REFERENCES `company` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `publishers`;
CREATE TABLE `publishers` (
    `game` INT NOT NULL,
    `publisher` INT NOT NULL,
    CONSTRAINT publisherPK PRIMARY KEY (`game`, `publisher`),
    CONSTRAINT gamePublisherFK FOREIGN KEY (`game`) REFERENCES `game` (`id`),
    CONSTRAINT publisherFK FOREIGN KEY (`publisher`) REFERENCES `company` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `genre`;
CREATE TABLE `genre` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `name` CHAR(30) NOT NULL,
    CONSTRAINT genrePK PRIMARY KEY (`id`),
    CONSTRAINT genreNameSK UNIQUE (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `game_genres`;
CREATE TABLE `game_genres` (
    `game` INT NOT NULL,
    `genre` INT NOT NULL,
    CONSTRAINT game_genresPK PRIMARY KEY (`game`, `genre`),
    CONSTRAINT gameGenreFK FOREIGN KEY (`game`) REFERENCES `game` (`id`),
    CONSTRAINT genreFK FOREIGN KEY (`genre`) REFERENCES `genre` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `username` VARCHAR(100) NOT NULL,
    `credit_card` CHAR(20),
    CONSTRAINT userPK PRIMARY KEY (`id`),
    CONSTRAINT companyNameSK UNIQUE (`username`),
    CONSTRAINT creditCardUQ UNIQUE (`credit_card`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `purchase`;
CREATE TABLE `purchase` (
    `user` INT NOT NULL,
    `game` INT NOT NULL,
    `hours_played` INT,
    CONSTRAINT purchasePK PRIMARY KEY (`user`, `game`),
    CONSTRAINT userPurchaseFK FOREIGN KEY (`user`) REFERENCES `user` (`id`),
    CONSTRAINT gamePurchaseFK FOREIGN KEY (`game`) REFERENCES `game` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

