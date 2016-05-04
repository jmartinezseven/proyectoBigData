package com.poli.bigdata.tareas

import com.poli.bigdata.persistencia.daos.RegistroLineaErrorDAO
import com.poli.bigdata.persistencia.modelo.RegistroLineaError


trait Auditable {

  val dao = Auditable.darInstanciaRegistroLineaErrorDAO()

  def guardarErrorAuditoria(nombreTarea: String, lineaArchivo: String, error: String) = {
    nombreTarea match {
      case Auditable.nombreProcesoMatriculados => guardarErrorMatriculados(lineaArchivo, error)
      case _  => guardarErrorNotasMatriculados(lineaArchivo, error)
    }
  }

  private def guardarErrorMatriculados(lineaArchivo: String, error: String): Unit ={
    val entidad = RegistroLineaError(
      id = 1,
      lineaRegistro = lineaArchivo,
      nombreProceso = Auditable.nombreProcesoMatriculados,
      error
    )
    dao.insertarRegistro(entidad)
  }

  private def guardarErrorNotasMatriculados(lineaArchivo: String, error: String): Unit ={
    val entidad = RegistroLineaError(
      id = 1,
      lineaRegistro = lineaArchivo,
      nombreProceso = Auditable.nombreProcesoNotasMatriculados,
      error
    )
    dao.insertarRegistro(entidad)
  }

  def enviarNotificacion(proceso: String, mensaje: String)

}

object Auditable {
  def darInstanciaRegistroLineaErrorDAO() = new RegistroLineaErrorDAO
  val nombreProcesoMatriculados = "matriculados"
  val nombreProcesoNotasMatriculados = "notas_matriculados"
}
