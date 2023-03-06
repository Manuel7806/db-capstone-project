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
-- Table `little_lemon_db`.`customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon_db`.`customers` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `contact_number` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `little_lemon_db`.`item_types`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon_db`.`item_types` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `little_lemon_db`.`items`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon_db`.`items` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `quantity` INT NOT NULL,
  `price` DECIMAL(5,2) NOT NULL,
  `item_types_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_items_item_types1_idx` (`item_types_id` ASC) VISIBLE,
  CONSTRAINT `fk_items_item_types1`
    FOREIGN KEY (`item_types_id`)
    REFERENCES `little_lemon_db`.`item_types` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `little_lemon_db`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon_db`.`orders` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `date` DATE NOT NULL,
  `quantity` INT NOT NULL,
  `cost` DECIMAL(5,2) NOT NULL,
  `customers_id` INT NOT NULL,
  `items_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_orders_customers_idx` (`customers_id` ASC) VISIBLE,
  INDEX `fk_orders_items1_idx` (`items_id` ASC) VISIBLE,
  CONSTRAINT `fk_orders_customers`
    FOREIGN KEY (`customers_id`)
    REFERENCES `little_lemon_db`.`customers` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_orders_items1`
    FOREIGN KEY (`items_id`)
    REFERENCES `little_lemon_db`.`items` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `little_lemon_db`.`menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon_db`.`menu` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `items_id` INT NOT NULL,
  `item_types_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_menu_items1_idx` (`items_id` ASC) VISIBLE,
  INDEX `fk_menu_item_types1_idx` (`item_types_id` ASC) VISIBLE,
  CONSTRAINT `fk_menu_items1`
    FOREIGN KEY (`items_id`)
    REFERENCES `little_lemon_db`.`items` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_menu_item_types1`
    FOREIGN KEY (`item_types_id`)
    REFERENCES `little_lemon_db`.`item_types` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `little_lemon_db`.`roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon_db`.`roles` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `little_lemon_db`.`employees`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon_db`.`employees` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `contact_number` VARCHAR(45) NOT NULL,
  `address` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NULL,
  `hire_date` DATE NOT NULL,
  `salary` DECIMAL(8,2) NOT NULL,
  `roles_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_employees_roles1_idx` (`roles_id` ASC) VISIBLE,
  CONSTRAINT `fk_employees_roles1`
    FOREIGN KEY (`roles_id`)
    REFERENCES `little_lemon_db`.`roles` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `little_lemon_db`.`bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon_db`.`bookings` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `date` DATE NOT NULL,
  `party` INT NOT NULL,
  `customers_id` INT NOT NULL,
  `employees_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_bookings_customers1_idx` (`customers_id` ASC) VISIBLE,
  INDEX `fk_bookings_employees1_idx` (`employees_id` ASC) VISIBLE,
  CONSTRAINT `fk_bookings_customers1`
    FOREIGN KEY (`customers_id`)
    REFERENCES `little_lemon_db`.`customers` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_bookings_employees1`
    FOREIGN KEY (`employees_id`)
    REFERENCES `little_lemon_db`.`employees` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `little_lemon_db`.`addresses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon_db`.`addresses` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `address` VARCHAR(45) NOT NULL,
  `customers_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_addresses_customers1_idx` (`customers_id` ASC) VISIBLE,
  CONSTRAINT `fk_addresses_customers1`
    FOREIGN KEY (`customers_id`)
    REFERENCES `little_lemon_db`.`customers` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `little_lemon_db`.`deliveries`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon_db`.`deliveries` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `delivery_date` DATE NULL,
  `status` TINYINT NOT NULL,
  `orders_id` INT NOT NULL,
  `employees_id` INT NOT NULL,
  `addresses_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_deliveries_orders1_idx` (`orders_id` ASC) VISIBLE,
  INDEX `fk_deliveries_employees1_idx` (`employees_id` ASC) VISIBLE,
  INDEX `fk_deliveries_addresses1_idx` (`addresses_id` ASC) VISIBLE,
  CONSTRAINT `fk_deliveries_orders1`
    FOREIGN KEY (`orders_id`)
    REFERENCES `little_lemon_db`.`orders` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_deliveries_employees1`
    FOREIGN KEY (`employees_id`)
    REFERENCES `little_lemon_db`.`employees` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_deliveries_addresses1`
    FOREIGN KEY (`addresses_id`)
    REFERENCES `little_lemon_db`.`addresses` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
