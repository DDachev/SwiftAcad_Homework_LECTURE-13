-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema school
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema school
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `school` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `school` ;

-- -----------------------------------------------------
-- Table `school`.`addresses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `school`.`addresses` (
  `address_id` INT NOT NULL,
  `address_country` VARCHAR(20) NULL DEFAULT NULL,
  `address_city` VARCHAR(20) NULL DEFAULT NULL,
  `address_street` VARCHAR(30) NULL DEFAULT NULL,
  `address_number` VARCHAR(10) NULL DEFAULT NULL,
  `address_floor` INT NULL DEFAULT NULL,
  `address_apartment_no` INT NULL DEFAULT NULL,
  PRIMARY KEY (`address_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `school`.`disciplines`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `school`.`disciplines` (
  `discipline_id` INT NOT NULL,
  `discipline_name` VARCHAR(30) NULL DEFAULT NULL,
  PRIMARY KEY (`discipline_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `school`.`students`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `school`.`students` (
  `student_id` INT NOT NULL,
  `student_name` VARCHAR(30) NULL DEFAULT NULL,
  `student_enrollment_date` DATE NULL DEFAULT NULL,
  `address_id` INT NULL DEFAULT NULL,
  PRIMARY KEY (`student_id`),
  UNIQUE INDEX `address_id` (`address_id` ASC),
  CONSTRAINT `students_ibfk_1`
    FOREIGN KEY (`address_id`)
    REFERENCES `school`.`addresses` (`address_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `school`.`disciplines_studied`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `school`.`disciplines_studied` (
  `discipline_id` INT NOT NULL,
  `student_id` INT NOT NULL,
  INDEX `discipline_id` (`discipline_id` ASC) ,
  INDEX `student_id` (`student_id` ASC),
  CONSTRAINT `disciplines_studied_ibfk_1`
    FOREIGN KEY (`discipline_id`)
    REFERENCES `school`.`disciplines` (`discipline_id`),
  CONSTRAINT `disciplines_studied_ibfk_2`
    FOREIGN KEY (`student_id`)
    REFERENCES `school`.`students` (`student_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `school`.`teachers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `school`.`teachers` (
  `teacher_id` INT NOT NULL,
  `teacher_name` VARCHAR(30) NULL DEFAULT NULL,
  `teacher_email` VARCHAR(30) NULL DEFAULT NULL,
  `teacher_salary` DOUBLE NULL DEFAULT NULL,
  `address_id` INT NULL DEFAULT NULL,
  PRIMARY KEY (`teacher_id`),
  UNIQUE INDEX `address_id` (`address_id` ASC),
  CONSTRAINT `teachers_ibfk_1`
    FOREIGN KEY (`address_id`)
    REFERENCES `school`.`addresses` (`address_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `school`.`disciplines_taught`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `school`.`disciplines_taught` (
  `discipline_id` INT NOT NULL,
  `teacher_id` INT NOT NULL,
  INDEX `discipline_id` (`discipline_id` ASC),
  INDEX `teacher_id` (`teacher_id` ASC),
  CONSTRAINT `disciplines_taught_ibfk_1`
    FOREIGN KEY (`discipline_id`)
    REFERENCES `school`.`disciplines` (`discipline_id`),
  CONSTRAINT `disciplines_taught_ibfk_2`
    FOREIGN KEY (`teacher_id`)
    REFERENCES `school`.`teachers` (`teacher_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
