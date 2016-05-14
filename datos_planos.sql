-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Table `heroku_94b598c4e735470`.`registro_linea_error`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `heroku_94b598c4e735470`.`registro_linea_error` ;

CREATE TABLE IF NOT EXISTS `heroku_94b598c4e735470`.`registro_linea_error` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `linea_registro` VARCHAR(45) NULL,
  `nombre_proceso` VARCHAR(45) NULL,
  `mensaje_error` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `heroku_94b598c4e735470`.`matriculados`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `heroku_94b598c4e735470`.`matriculados` ;

CREATE TABLE IF NOT EXISTS `heroku_94b598c4e735470`.`matriculados` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `base_codPrimiparoPoli` INT NULL,
  `base_PrimiparoPoli` VARCHAR(45) NULL,
  `base_idAnho` VARCHAR(45) NULL,
  `base_idPeriodo` INT NULL,
  `base_UsuarioAppInscripcion` VARCHAR(45) NULL,
  `base_AppInscripcion` VARCHAR(45) NULL,
  `datp_NumeroDocumento` VARCHAR(45) NULL,
  `datp_NombresCompletos` VARCHAR(45) NULL,
  `datp_Nombres` VARCHAR(45) NULL,
  `datp_Apellido1` VARCHAR(45) NULL,
  `datp_Apellido2` VARCHAR(45) NULL,
  `datp_direccionResidencia` VARCHAR(45) NULL,
  `datp_TelefonoPrincipal` VARCHAR(45) NULL,
  `datp_correoElectronico` VARCHAR(45) NULL,
  `datp_Genero` VARCHAR(45) NULL,
  `datp_Celular` VARCHAR(45) NULL,
  `datp_TipoIdentificacion` VARCHAR(45) NULL,
  `datp_idCiudad` VARCHAR(45) NULL,
  `datp_Ciudad` VARCHAR(45) NULL,
  `datp_Trabaja` TINYINT(1) NULL,
  `datp_NombreEmpresa` VARCHAR(45) NULL,
  `datp_TelefonoEmpresa` VARCHAR(45) NULL,
  `datp_DireccionEmpresa` VARCHAR(45) NULL,
  `acad_Movilidad` VARCHAR(45) NULL,
  `acad_anhoPeriodo` VARCHAR(45) NULL,
  `acad_codigoEstudiante` VARCHAR(45) NULL,
  `acad_IdJornada` INT NULL,
  `acad_Jornada` VARCHAR(45) NULL,
  `acad_idPrograma` INT NULL,
  `acad_Programa` VARCHAR(45) NULL,
  `acad_idNivel` INT NULL,
  `acad_Nivel` VARCHAR(45) NULL,
  `acad_CohorteIngreso` VARCHAR(45) NULL,
  `acad_Semestre` INT NULL,
  `acad_idSede` INT NULL,
  `acad_sede` INT NULL,
  `acad_idEstadoAcademico` VARCHAR(45) NULL,
  `acad_EstadoAcademico` INT NULL,
  `acad_consecutivoWEB` VARCHAR(45) NULL,
  `acad_Titulo` VARCHAR(45) NULL,
  `acad_idTipoSede` INT NULL,
  `acad_TipoSede` VARCHAR(45) NULL,
  `acad_idFacultad` INT NULL,
  `acad_UnidadOperativa` VARCHAR(45) NULL,
  `acad_Facultad` VARCHAR(45) NULL,
  `acad_idCSU` INT NULL,
  `acad_CSU` VARCHAR(45) NULL,
  `acad_IdTipoDeCSU` VARCHAR(45) NULL,
  `acad_TipoDeCSU` VARCHAR(45) NULL,
  `acad_ZonaDeVenta` VARCHAR(45) NULL,
  `acad_FechaOferta` DATE NULL,
  `acad_otraUniversidad` VARCHAR(45) NULL,
  `acad_Anho` INT NULL,
  `acad_SNIES` VARCHAR(45) NULL,
  `acad_UnidadOperativa` VARCHAR(45) NULL,
  `finan_numeroReciboPago` VARCHAR(45) NULL,
  `finan_valorMatricula` VARCHAR(45) NULL,
  `finan_valorOrdinario` VARCHAR(45) NULL,
  `finan_valorExtraOrdinario` VARCHAR(45) NULL,
  `finan_DiferenciaValoresMatricula` VARCHAR(45) NULL,
  `finan_PagoExtraordinario` VARCHAR(45) NULL,
  `finan_MedioPago` VARCHAR(45) NULL,
  `finan_FechaPago` DATE NULL,
  `finan_EntidadBancaria` VARCHAR(45) NULL,
  `finan_ValorPagado` VARCHAR(45) NULL,
  `finan_idEstadoFinanciero` INT NULL,
  `finan_Estadofinanciero` VARCHAR(45) NULL,
  `finan_SemanaMatricula` VARCHAR(45) NULL,
  `finana_MediaMatricula` VARCHAR(45) NULL,
  `finan_descuento` VARCHAR(45) NULL,
  `Gmail` VARCHAR(45) NULL,
  `Reintegro` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `heroku_94b598c4e735470`.`notas_p`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `heroku_94b598c4e735470`.`notas_p` ;

CREATE TABLE IF NOT EXISTS `heroku_94b598c4e735470`.`notas_p` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `IdCodigo` VARCHAR(45) NULL,
  `AnoPeriEstu` VARCHAR(45) NULL,
  `AnoPeriodo` VARCHAR(45) NULL,
  `CodigoMateria` VARCHAR(45) NULL,
  `IdGrupo` VARCHAR(45) NULL,
  `Materia` VARCHAR(45) NULL,
  `TipoNota` VARCHAR(45) NULL,
  `Nota` DOUBLE NULL,
  `Estudiante` VARCHAR(100) NULL,
  `Semestre` INT NULL,
  `Programa` VARCHAR(100) NULL,
  `Jornada` VARCHAR(45) NULL,
  `Aprobo` VARCHAR(45) NULL,
  `IdArea` VARCHAR(45) NULL,
  `Area` VARCHAR(45) NULL,
  `IdSede` INT NULL,
  `Sede` VARCHAR(45) NULL,
  `IdEstudiante` VARCHAR(45) NULL,
  `IdPrograma` INT NULL,
  `Credito` INT NULL,
  `NotaCredito` DOUBLE NULL,
  `Graduado` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `PaisMovilidad` VARCHAR(45) NULL,
  `CiudadMovilidad` VARCHAR(45) NULL,
  `UniversidadMovilidad` VARCHAR(45) NULL,
  `IdAno` VARCHAR(45) NULL,
  `IdPeriodo` INT NULL,
  `ProgramaPeriodo` VARCHAR(45) NULL,
  `Cohorte` VARCHAR(45) NULL,
  `DepartamentoAcademico` VARCHAR(45) NULL,
  `PrimiparoInstitucion` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
