-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema jskola
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `jskola` ;

-- -----------------------------------------------------
-- Schema jskola
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `jskola` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_czech_ci ;
USE `jskola` ;

-- -----------------------------------------------------
-- Table `jskola`.`tridy`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `jskola`.`tridy` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `rocnik` INT(1) UNSIGNED NOT NULL,
  `oznaceni` CHAR(2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `uq_trida` (`rocnik` ASC, `oznaceni` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `jskola`.`zaci`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `jskola`.`zaci` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `jmeno` VARCHAR(45) NOT NULL,
  `prijmeni` VARCHAR(45) NOT NULL,
  `rodneCislo` CHAR(10) NOT NULL,
  `trida` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `rodneCislo_UNIQUE` (`rodneCislo` ASC),
  INDEX `fk_zaci_tridy1_idx` (`trida` ASC),
  CONSTRAINT `fk_zaci_tridy1`
    FOREIGN KEY (`trida`)
    REFERENCES `tridy` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `jskola`.`skupiny`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `jskola`.`skupiny` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `trida` INT UNSIGNED NOT NULL,
  `oznaceni` CHAR(3) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_skupiny_tridy_idx` (`trida` ASC),
  UNIQUE INDEX `uq_skupina` (`trida` ASC, `oznaceni` ASC),
  CONSTRAINT `fk_skupiny_tridy`
    FOREIGN KEY (`trida`)
    REFERENCES `tridy` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `jskola`.`zaciSkupiny`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `jskola`.`zaciSkupiny` (
  `zak` INT UNSIGNED NOT NULL,
  `skupina` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`zak`, `skupina`),
  INDEX `fk_zaci_has_skupiny_skupiny1_idx` (`skupina` ASC),
  INDEX `fk_zaci_has_skupiny_zaci1_idx` (`zak` ASC),
  CONSTRAINT `fk_zaci_has_skupiny_zaci1`
    FOREIGN KEY (`zak`)
    REFERENCES `zaci` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_zaci_has_skupiny_skupiny1`
    FOREIGN KEY (`skupina`)
    REFERENCES `skupiny` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
