-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema little_lemon_db
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema little_lemon_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `little_lemon_db` DEFAULT CHARACTER SET utf8 ;
USE `little_lemon_db` ;

-- -----------------------------------------------------
-- Table `little_lemon_db`.`Items`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon_db`.`Items` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(255) NOT NULL,
  `price` DECIMAL(5,2) NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `little_lemon_db`.`Desserts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon_db`.`Desserts` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `Description` VARCHAR(255) NOT NULL,
  `Price` DECIMAL(4,2) NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB
COMMENT = '	';


-- -----------------------------------------------------
-- Table `little_lemon_db`.`Drinks`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon_db`.`Drinks` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `Price` DECIMAL(4,2) NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `little_lemon_db`.`Department`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon_db`.`Department` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `little_lemon_db`.`Role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon_db`.`Role` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `little_lemon_db`.`Employees`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon_db`.`Employees` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `First_Name` VARCHAR(45) NOT NULL,
  `Last_Name` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  `Phone_Number` VARCHAR(45) NOT NULL,
  `Address` VARCHAR(45) NOT NULL,
  `Salary` INT NOT NULL,
  `Role_ID` INT NOT NULL,
  `Department_ID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_Employees_Role_idx` (`Role_ID` ASC) VISIBLE,
  INDEX `fk_Employees_Department1_idx` (`Department_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Employees_Role`
    FOREIGN KEY (`Role_ID`)
    REFERENCES `little_lemon_db`.`Role` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Employees_Department1`
    FOREIGN KEY (`Department_ID`)
    REFERENCES `little_lemon_db`.`Department` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `little_lemon_db`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon_db`.`Customers` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  `Phone_Number` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `little_lemon_db`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon_db`.`Orders` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `date` DATE NULL,
  `Total_Items` INT NULL,
  `Total_Cost` INT NULL,
  `Customers_ID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_Orders_Customers1_idx` (`Customers_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Orders_Customers1`
    FOREIGN KEY (`Customers_ID`)
    REFERENCES `little_lemon_db`.`Customers` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `little_lemon_db`.`Order_Details`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon_db`.`Order_Details` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Items_ID` INT NOT NULL,
  `Drinks_ID` INT NOT NULL,
  `Desserts_ID` INT NOT NULL,
  `Customers_ID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_Order_Details_Items1_idx` (`Items_ID` ASC) VISIBLE,
  INDEX `fk_Order_Details_Drinks1_idx` (`Drinks_ID` ASC) VISIBLE,
  INDEX `fk_Order_Details_Desserts1_idx` (`Desserts_ID` ASC) VISIBLE,
  INDEX `fk_Order_Details_Customers1_idx` (`Customers_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Order_Details_Items1`
    FOREIGN KEY (`Items_ID`)
    REFERENCES `little_lemon_db`.`Items` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Order_Details_Drinks1`
    FOREIGN KEY (`Drinks_ID`)
    REFERENCES `little_lemon_db`.`Drinks` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Order_Details_Desserts1`
    FOREIGN KEY (`Desserts_ID`)
    REFERENCES `little_lemon_db`.`Desserts` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Order_Details_Customers1`
    FOREIGN KEY (`Customers_ID`)
    REFERENCES `little_lemon_db`.`Customers` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `little_lemon_db`.`Addresses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon_db`.`Addresses` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `address` VARCHAR(255) NOT NULL,
  `Customers_ID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_Addresses_Customers1_idx` (`Customers_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Addresses_Customers1`
    FOREIGN KEY (`Customers_ID`)
    REFERENCES `little_lemon_db`.`Customers` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `little_lemon_db`.`Booking`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon_db`.`Booking` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `date` DATE NOT NULL,
  `Time` VARCHAR(45) NOT NULL,
  `Party_Number` INT NOT NULL,
  `Customers_ID` INT NOT NULL,
  `Employees_ID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_Booking_Customers1_idx` (`Customers_ID` ASC) VISIBLE,
  INDEX `fk_Booking_Employees1_idx` (`Employees_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Booking_Customers1`
    FOREIGN KEY (`Customers_ID`)
    REFERENCES `little_lemon_db`.`Customers` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Booking_Employees1`
    FOREIGN KEY (`Employees_ID`)
    REFERENCES `little_lemon_db`.`Employees` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `little_lemon_db`.`Delivery`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon_db`.`Delivery` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `date` DATE NULL,
  `status` TINYINT NULL,
  `Customers_ID` INT NOT NULL,
  `Employees_ID` INT NOT NULL,
  `Addresses_ID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_Delivery_Customers1_idx` (`Customers_ID` ASC) VISIBLE,
  INDEX `fk_Delivery_Employees1_idx` (`Employees_ID` ASC) VISIBLE,
  INDEX `fk_Delivery_Addresses1_idx` (`Addresses_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Delivery_Customers1`
    FOREIGN KEY (`Customers_ID`)
    REFERENCES `little_lemon_db`.`Customers` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Delivery_Employees1`
    FOREIGN KEY (`Employees_ID`)
    REFERENCES `little_lemon_db`.`Employees` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Delivery_Addresses1`
    FOREIGN KEY (`Addresses_ID`)
    REFERENCES `little_lemon_db`.`Addresses` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
