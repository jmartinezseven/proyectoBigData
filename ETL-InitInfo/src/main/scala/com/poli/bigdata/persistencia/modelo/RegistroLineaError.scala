package com.poli.bigdata.persistencia.modelo

case class RegistroLineaError(id: Int, lineaRegistro: String, nombreProceso: String, mensajeError: String)

object RegistroLineaError {
  def nombreTabla = "registro_linea_error"
}