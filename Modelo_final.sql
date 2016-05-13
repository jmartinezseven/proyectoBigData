-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema heroku_363d731a3c8dc48
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema heroku_363d731a3c8dc48
-- -----------------------------------------------------

-- Table `heroku_363d731a3c8dc48`.`estudiante`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `heroku_363d731a3c8dc48`.`estudiante` ;

CREATE TABLE IF NOT EXISTS `heroku_363d731a3c8dc48`.`estudiante` (
  `codigo` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  `fecha_nacimiento` DATE NOT NULL,
  `sexo` CHAR(1) NOT NULL,
  `estrato` SMALLINT(1) NOT NULL,
  `estado_civil` CHAR(1) NULL,
  `tiene_beca` TINYINT(1) NOT NULL,
  `fecha_ingreso` DATE NOT NULL,
  `graduado` TINYINT(1) NOT NULL,
  `convenio_univesitario` TINYINT(1) NULL,
  `trabaja` TINYINT(1) NOT NULL,
  PRIMARY KEY (`codigo`),
  UNIQUE INDEX `codigo_UNIQUE` (`codigo` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `heroku_363d731a3c8dc48`.`Semestre`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `heroku_363d731a3c8dc48`.`Semestre` ;

CREATE TABLE IF NOT EXISTS `heroku_363d731a3c8dc48`.`Semestre` (
  `id_semestre` INT NOT NULL AUTO_INCREMENT,
  `Anno` VARCHAR(4) NOT NULL,
  `periodo` SMALLINT(4) NOT NULL,
  `cant_estudiantes` INT NOT NULL,
  PRIMARY KEY (`id_semestre`),
  UNIQUE INDEX `id_semestre_UNIQUE` (`id_semestre` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `heroku_363d731a3c8dc48`.`semestres_por_estudiante`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `heroku_363d731a3c8dc48`.`semestres_por_estudiante` ;

CREATE TABLE IF NOT EXISTS `heroku_363d731a3c8dc48`.`semestres_por_estudiante` (
  `id_semestre_por_estudiante` INT NOT NULL AUTO_INCREMENT,
  `codigo_estudiante` INT NOT NULL,
  `id_semestre` INT NOT NULL,
  `estudiante_codigo` INT NOT NULL,
  `Semestre_id_semestre` INT NOT NULL,
  PRIMARY KEY (`codigo_estudiante`, `id_semestre`, `estudiante_codigo`, `Semestre_id_semestre`),
  INDEX `fk_semestres_por_estudiante_estudiante_idx` (`estudiante_codigo` ASC),
  INDEX `fk_semestres_por_estudiante_Semestre1_idx` (`Semestre_id_semestre` ASC),
  UNIQUE INDEX `id_semestre_por_estudiante_UNIQUE` (`id_semestre_por_estudiante` ASC),
  CONSTRAINT `fk_semestres_por_estudiante_estudiante`
    FOREIGN KEY (`estudiante_codigo`)
    REFERENCES `heroku_363d731a3c8dc48`.`estudiante` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_semestres_por_estudiante_Semestre1`
    FOREIGN KEY (`Semestre_id_semestre`)
    REFERENCES `heroku_363d731a3c8dc48`.`Semestre` (`id_semestre`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `heroku_363d731a3c8dc48`.`Materia`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `heroku_363d731a3c8dc48`.`Materia` ;

CREATE TABLE IF NOT EXISTS `heroku_363d731a3c8dc48`.`Materia` (
  `idMateria` INT NOT NULL AUTO_INCREMENT,
  `nombre_materia` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idMateria`))
ENGINE = InnoDB
COMMENT = '			';


-- -----------------------------------------------------
-- Table `heroku_363d731a3c8dc48`.`materia_por_semestre_estudiante`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `heroku_363d731a3c8dc48`.`materia_por_semestre_estudiante` ;

CREATE TABLE IF NOT EXISTS `heroku_363d731a3c8dc48`.`materia_por_semestre_estudiante` (
  `id_materia_por_semestre_estudiante` INT NOT NULL AUTO_INCREMENT,
  `id_materia` INT NOT NULL,
  `id_semestre_por_estudiante` INT NOT NULL,
  `nota_corte_uno` DOUBLE NULL,
  `nota_corte_dos` DOUBLE NULL,
  `nota_corte_tres` DOUBLE NULL,
  `nota_definitiva` DOUBLE NULL,
  `Materia_idMateria` INT NOT NULL,
  `semestres_por_estudiante_codigo_estudiante` INT NOT NULL,
  `semestres_por_estudiante_id_semestre` INT NOT NULL,
  `semestres_por_estudiante_estudiante_codigo` INT NOT NULL,
  `semestres_por_estudiante_Semestre_id_semestre` INT NOT NULL,
  PRIMARY KEY (`id_materia`, `id_semestre_por_estudiante`),
  UNIQUE INDEX `id_materia_por_semestre_estudiante_UNIQUE` (`id_materia_por_semestre_estudiante` ASC),
  INDEX `fk_materia_por_semestre_estudiante_Materia1_idx` (`Materia_idMateria` ASC),
  INDEX `fk_materia_por_semestre_estudiante_semestres_por_estudiante_idx` (`semestres_por_estudiante_codigo_estudiante` ASC, `semestres_por_estudiante_id_semestre` ASC, `semestres_por_estudiante_estudiante_codigo` ASC, `semestres_por_estudiante_Semestre_id_semestre` ASC),
  CONSTRAINT `fk_materia_por_semestre_estudiante_Materia1`
    FOREIGN KEY (`Materia_idMateria`)
    REFERENCES `heroku_363d731a3c8dc48`.`Materia` (`idMateria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_materia_por_semestre_estudiante_semestres_por_estudiante1`
    FOREIGN KEY (`semestres_por_estudiante_codigo_estudiante` , `semestres_por_estudiante_id_semestre` , `semestres_por_estudiante_estudiante_codigo` , `semestres_por_estudiante_Semestre_id_semestre`)
    REFERENCES `heroku_363d731a3c8dc48`.`semestres_por_estudiante` (`codigo_estudiante` , `id_semestre` , `estudiante_codigo` , `Semestre_id_semestre`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
