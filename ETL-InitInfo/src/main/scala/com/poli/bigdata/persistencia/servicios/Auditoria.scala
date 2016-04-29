package com.poli.bigdata.persistencia.servicios


trait Auditable {

  def guardarErrorAuditoria(nombreTarea: String, lineaArchivo: Int, error: String) = {
    nombreTarea match {
      case "matriculados" => guardarErrorMatriculados(lineaArchivo, error)
      case _  => guardarErrorNotasMatriculados(lineaArchivo, error)
    }
  }

  private def guardarErrorMatriculados(lineaArchivo: Int, error: String): Unit ={

  }

  private def guardarErrorNotasMatriculados(lineaArchivo: Int, error: String): Unit ={

  }
}
