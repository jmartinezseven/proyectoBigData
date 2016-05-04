package com.poli.bigdata

import com.poli.bigdata.notificaciones.email.NotifiacionesCorreoServicio
import com.poli.bigdata.persistencia.daos.DatosFiltradosEstudiantesDAO
import com.poli.bigdata.tareas.ProcesamientoMatriculados
import com.typesafe.scalalogging.LazyLogging


import scala.util.{Failure, Success}

object Boot extends App with LazyLogging{

  val notificaciones = new NotifiacionesCorreoServicio()
  val procesamientoMatriculadosDAO = new DatosFiltradosEstudiantesDAO
  val procesamientoMatriculados = new ProcesamientoMatriculados(notificaciones, procesamientoMatriculadosDAO)

  val archivo = "matriculados.csv"

  procesamientoMatriculados.procesarDatosMatriculados(archivo) onComplete {
    case Success(e) =>
      logger.debug("Datos de matriculados cargados correctamente")
    case Failure(ex) =>
      logger.error("Error cargando los datos", ex)
  }
}
