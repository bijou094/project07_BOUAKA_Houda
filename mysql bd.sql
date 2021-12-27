-- MySQL Script generated by MySQL Workbench
-- Mon Dec 27 13:36:03 2021
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema projet7
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema projet7
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `projet7` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `projet7` ;

-- -----------------------------------------------------
-- Table `projet7`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projet7`.`users` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `pseudo` VARCHAR(20) NOT NULL,
  `email` VARCHAR(80) NOT NULL,
  `password` VARCHAR(225) NOT NULL,
  `firstName` VARCHAR(45) NULL DEFAULT NULL,
  `lastName` VARCHAR(45) NULL DEFAULT NULL,
  `imageUrl` VARCHAR(225) NULL DEFAULT NULL,
  `isAdmin` TINYINT(1) NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email` (`email` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 111
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `projet7`.`messages`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projet7`.`messages` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `idUser` INT UNSIGNED NULL DEFAULT NULL,
  `content` TEXT NULL DEFAULT NULL,
  `createdAt` DATETIME NULL DEFAULT NULL,
  `updatedAt` DATETIME NULL DEFAULT NULL,
  `messageUrl` VARCHAR(225) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `idUser_idx` (`idUser` ASC) VISIBLE,
  CONSTRAINT `idUser`
    FOREIGN KEY (`idUser`)
    REFERENCES `projet7`.`users` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 202
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `projet7`.`comments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projet7`.`comments` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` INT UNSIGNED NULL DEFAULT NULL,
  `messageId` INT UNSIGNED NULL DEFAULT NULL,
  `commenText` TEXT NULL DEFAULT NULL,
  `createdAt` DATETIME NULL DEFAULT NULL,
  `updatedAt` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `userId_idx` (`user_id` ASC) VISIBLE,
  INDEX `user_id_idx` (`user_id` ASC) VISIBLE,
  INDEX `messageId_idx` (`messageId` ASC) VISIBLE,
  CONSTRAINT `messageId`
    FOREIGN KEY (`messageId`)
    REFERENCES `projet7`.`messages` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `projet7`.`users` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 155
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;