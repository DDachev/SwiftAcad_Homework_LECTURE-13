-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema citizen_registrations
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema citizen_registrations
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `citizen_registrations` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `citizen_registrations` ;

-- -----------------------------------------------------
-- Table `citizen_registrations`.`addresses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `citizen_registrations`.`addresses` (
  `id` INT NOT NULL,
  `country` VARCHAR(20) NULL DEFAULT NULL,
  `city` VARCHAR(20) NULL DEFAULT NULL,
  `municipality` VARCHAR(20) NULL DEFAULT NULL,
  `postal_code` VARCHAR(20) NULL DEFAULT NULL,
  `street` VARCHAR(20) NULL DEFAULT NULL,
  `number` VARCHAR(20) NULL DEFAULT NULL,
  `floor` INT NULL DEFAULT NULL,
  `apartmentNo` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `citizen_registrations`.`education_types`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `citizen_registrations`.`education_types` (
  `id` INT NOT NULL,
  `name` VARCHAR(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `citizen_registrations`.`educations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `citizen_registrations`.`educations` (
  `id` INT NOT NULL,
  `type_id` INT NOT NULL,
  `institution_name` VARCHAR(20) NULL DEFAULT NULL,
  `enrollment_date` DATE NOT NULL,
  `graduation_date` DATE NULL DEFAULT NULL,
  `graduted` BIT(1) NULL DEFAULT NULL,
  `final_grade` DOUBLE NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `type_id` (`type_id` ASC),
  CONSTRAINT `educations_ibfk_1`
    FOREIGN KEY (`type_id`)
    REFERENCES `citizen_registrations`.`education_types` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `citizen_registrations`.`genders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `citizen_registrations`.`genders` (
  `id` INT NOT NULL,
  `name` VARCHAR(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `citizen_registrations`.`people`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `citizen_registrations`.`people` (
  `id` INT NOT NULL,
  `first_name` VARCHAR(20) NULL DEFAULT NULL,
  `middle_name` VARCHAR(20) NULL DEFAULT NULL,
  `last_name` VARCHAR(20) NULL DEFAULT NULL,
  `gender_id` INT NOT NULL,
  `height` SMALLINT NULL DEFAULT NULL,
  `birth_date` DATE NOT NULL,
  `current_address` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `gender_id` (`gender_id` ASC),
  INDEX `current_address` (`current_address` ASC),
  CONSTRAINT `people_ibfk_1`
    FOREIGN KEY (`gender_id`)
    REFERENCES `citizen_registrations`.`genders` (`id`),
  CONSTRAINT `people_ibfk_2`
    FOREIGN KEY (`current_address`)
    REFERENCES `citizen_registrations`.`addresses` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `citizen_registrations`.`people_addresses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `citizen_registrations`.`people_addresses` (
  `person_id` INT NOT NULL,
  `address_id` INT NOT NULL,
  INDEX `person_id` (`person_id` ASC),
  INDEX `address_id` (`address_id` ASC),
  CONSTRAINT `people_addresses_ibfk_1`
    FOREIGN KEY (`person_id`)
    REFERENCES `citizen_registrations`.`people` (`id`),
  CONSTRAINT `people_addresses_ibfk_2`
    FOREIGN KEY (`address_id`)
    REFERENCES `citizen_registrations`.`addresses` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `citizen_registrations`.`people_educations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `citizen_registrations`.`people_educations` (
  `person_id` INT NOT NULL,
  `education_id` INT NOT NULL,
  INDEX `person_id` (`person_id` ASC),
  INDEX `education_id` (`education_id` ASC),
  CONSTRAINT `people_educations_ibfk_1`
    FOREIGN KEY (`person_id`)
    REFERENCES `citizen_registrations`.`people` (`id`),
  CONSTRAINT `people_educations_ibfk_2`
    FOREIGN KEY (`education_id`)
    REFERENCES `citizen_registrations`.`educations` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
