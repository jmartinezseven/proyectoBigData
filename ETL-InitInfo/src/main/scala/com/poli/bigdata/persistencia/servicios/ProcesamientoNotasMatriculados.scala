package com.poli.bigdata.persistencia.servicios

import scala.io.Codec


class ProcesamientoNotasMatriculados extends Auditable{

  def leerYProcesarMatriculados(file: String): Unit ={
    val bufferedSource = io.Source.fromFile( file )( Codec.UTF8 )

  }
}
