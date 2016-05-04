package com.poli.bigdata.tareas

import java.sql.SQLException

import com.poli.bigdata.notificaciones.email.{Plantillas, NotifiacionesCorreoServicio}
import com.poli.bigdata.persistencia.daos.DatosFiltradosEstudiantesDAO
import com.poli.bigdata.persistencia.modelo.DatosFiltradosEstudiantes
import com.typesafe.scalalogging.LazyLogging
import org.joda.time.DateTime

import scala.concurrent.Future
import scala.io.Codec

import scala.concurrent.ExecutionContext.Implicits.global

class ProcesamientoMatriculados(servicio: NotifiacionesCorreoServicio, matriculadosDAO: DatosFiltradosEstudiantesDAO) extends Auditable with LazyLogging{

  def procesarDatosMatriculados(file: String): Future[Unit] = {
    Future {
      val bufferedSource = io.Source.fromFile( file )( Codec.UTF8 )
      for(line <- bufferedSource.getLines()){
        val lineArray = line.split(",")
        val entidad = crearEntidadDatosMatriculados(lineArray)
        matriculadosDAO.insertarRegistro(entidad)
      }
    } recover {
      case ex:Exception =>
        guardarErrorAuditoria(Auditable.nombreProcesoMatriculados, "", ex.getMessage)
        enviarNotificacion(Auditable.nombreProcesoMatriculados, ex.getMessage)
    }
  }

  override def enviarNotificacion(proceso: String, mensaje: String): Unit = {
    val subject = "Error en procesar datos de matriculado"
    val message = parsearPlantilla(Array(proceso, mensaje))
    servicio.enviarNotificacion(
      recipient = "juanmartinez@seven4n.com",
      messageText = message,
      subject = subject
    )
  }

  private def crearEntidadDatosMatriculados(datos: Array[String]): DatosFiltradosEstudiantes = {
    DatosFiltradosEstudiantes(
      id = 1,
      idEstudiante = datos(0),
      primerNombre = datos(1),
      segundoNombre = datos(2),
      primerApellido = datos(3),
      segundoApellido = datos(4),
      fechaDeNacimiento = DateTime.parse(datos(5)),
      estadoCivil = datos(6),
      estrato = datos(7),
      becado = datos(8).toBoolean,
      sexo = datos(9),
      trabajaActualmente = datos(10).toBoolean,
      fechaIngresoUniversidad = DateTime.parse(datos(11)),
      fechaGradiacionUniversidad = DateTime.parse(datos(12))
    )
  }

  private def parsearPlantilla(parametros: Array[String]): String = {
    var message = Plantillas.notificacionError
    for(i <- 0 to parametros.length){
      message = message.replace(s"{$i}", parametros(i))
    }
    message
  }
}
