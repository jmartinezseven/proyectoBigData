-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';


-- -----------------------------------------------------
-- Table `heroku_363d731a3c8dc48`.`estudiante`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `heroku_363d731a3c8dc48`.`estudiante` ;

CREATE TABLE IF NOT EXISTS `heroku_363d731a3c8dc48`.`estudiante` (
  `codigo` VARCHAR(45) NOT NULL,
  `nombre` VARCHAR(100) NULL,
  `sexo` CHAR(1) NULL,
  `graduado` TINYINT(1) NULL,
  `convenio_univesitario` TINYINT(1) NULL,
  `trabaja` TINYINT(1) NULL,
  `legal_id_estudiante` VARCHAR(45) NULL,
  `tipo_legal_id` VARCHAR(5) NULL,
  `jornada` VARCHAR(45) NULL,
  `anno_periodo_ing` VARCHAR(5) NULL,
  PRIMARY KEY (`codigo`),
  UNIQUE INDEX `codigo_UNIQUE` (`codigo` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `heroku_363d731a3c8dc48`.`Semestre`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `heroku_363d731a3c8dc48`.`Semestre` ;

CREATE TABLE IF NOT EXISTS `heroku_363d731a3c8dc48`.`Semestre` (
  `id_semestre` VARCHAR(6) NOT NULL,
  `Anno` VARCHAR(4) NOT NULL,
  `periodo` SMALLINT(4) NOT NULL,
  `cant_estudiantes` INT NOT NULL,
  PRIMARY KEY (`id_semestre`),
  UNIQUE INDEX `id_semestre_UNIQUE` (`id_semestre` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `heroku_363d731a3c8dc48`.`Materia`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `heroku_363d731a3c8dc48`.`Materia` ;

CREATE TABLE IF NOT EXISTS `heroku_363d731a3c8dc48`.`Materia` (
  `idMateria` VARCHAR(10) NOT NULL,
  `nombre_materia` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`idMateria`))
ENGINE = InnoDB
COMMENT = '			';


-- -----------------------------------------------------
-- Table `heroku_363d731a3c8dc48`.`materia_por_semestre_estudiante`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `heroku_363d731a3c8dc48`.`materia_por_semestre_estudiante` ;

CREATE TABLE IF NOT EXISTS `heroku_363d731a3c8dc48`.`materia_por_semestre_estudiante` (
  `id_materia` VARCHAR(10) NOT NULL,
  `id_semestre` VARCHAR(6) NOT NULL,
  `id_estudiante` VARCHAR(45) NOT NULL,
  `nota_definitiva` DOUBLE NULL,
  `estudiante_codigo` VARCHAR(45) NOT NULL,
  `Semestre_id_semestre` VARCHAR(6) NOT NULL,
  `Materia_idMateria` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`id_materia`, `id_semestre`, `id_estudiante`),
  INDEX `fk_materia_por_semestre_estudiante_estudiante_idx` (`estudiante_codigo` ASC),
  INDEX `fk_materia_por_semestre_estudiante_Semestre1_idx` (`Semestre_id_semestre` ASC),
  INDEX `fk_materia_por_semestre_estudiante_Materia1_idx` (`Materia_idMateria` ASC),
  CONSTRAINT `fk_materia_por_semestre_estudiante_estudiante`
    FOREIGN KEY (`estudiante_codigo`)
    REFERENCES `heroku_363d731a3c8dc48`.`estudiante` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_materia_por_semestre_estudiante_Semestre1`
    FOREIGN KEY (`Semestre_id_semestre`)
    REFERENCES `heroku_363d731a3c8dc48`.`Semestre` (`id_semestre`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_materia_por_semestre_estudiante_Materia1`
    FOREIGN KEY (`Materia_idMateria`)
    REFERENCES `heroku_363d731a3c8dc48`.`Materia` (`idMateria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
