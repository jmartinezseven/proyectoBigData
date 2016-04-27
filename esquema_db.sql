SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';


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


DROP TABLE IF EXISTS `heroku_363d731a3c8dc48`.`Semestre` ;

CREATE TABLE IF NOT EXISTS `heroku_363d731a3c8dc48`.`Semestre` (
  `id_semestre` INT NOT NULL AUTO_INCREMENT,
  `Anio` VARCHAR(4) NOT NULL,
  `periodo` SMALLINT(4) NOT NULL,
  `estudiante_codigo` INT NOT NULL,
  `promedio_estudiante_semestre` DOUBLE NULL,
  PRIMARY KEY (`id_semestre`, `estudiante_codigo`),
  UNIQUE INDEX `id_semestre_UNIQUE` (`id_semestre` ASC),
  INDEX `fk_Semestre_estudiante_idx` (`estudiante_codigo` ASC),
  CONSTRAINT `fk_Semestre_estudiante`
    FOREIGN KEY (`estudiante_codigo`)
    REFERENCES `heroku_363d731a3c8dc48`.`estudiante` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


DROP TABLE IF EXISTS `heroku_363d731a3c8dc48`.`Materias` ;

CREATE TABLE IF NOT EXISTS `heroku_363d731a3c8dc48`.`Materias` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre_materia` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


DROP TABLE IF EXISTS `heroku_363d731a3c8dc48`.`materias_por_semestre` ;

CREATE TABLE IF NOT EXISTS `heroku_363d731a3c8dc48`.`materias_por_semestre` (
  `id_semestre` INT NOT NULL,
  `id_estudiante` INT NOT NULL,
  `id_materia` INT NOT NULL,
  `nota_primer_corte` DOUBLE NULL,
  `nota_segundo_corte` DOUBLE NULL,
  `nota_tercer_corte` DOUBLE NULL,
  `nota_definitiva` DOUBLE NULL,
  PRIMARY KEY (`id_semestre`, `id_estudiante`, `id_materia`),
  INDEX `fk_Semestre_has_Materias_Materias1_idx` (`id_materia` ASC),
  INDEX `fk_Semestre_has_Materias_Semestre1_idx` (`id_semestre` ASC, `id_estudiante` ASC),
  CONSTRAINT `fk_Semestre_has_Materias_Semestre1`
    FOREIGN KEY (`id_semestre` , `id_estudiante`)
    REFERENCES `heroku_363d731a3c8dc48`.`Semestre` (`id_semestre` , `estudiante_codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Semestre_has_Materias_Materias1`
    FOREIGN KEY (`id_materia`)
    REFERENCES `heroku_363d731a3c8dc48`.`Materias` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
