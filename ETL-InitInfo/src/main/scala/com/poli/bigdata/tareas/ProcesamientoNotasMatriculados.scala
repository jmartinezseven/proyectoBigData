package com.poli.bigdata.tareas

import scala.io.Codec


class ProcesamientoNotasMatriculados() extends Auditable{

  def procesarNotasMatriculados(file: String): Unit ={
    val bufferedSource = io.Source.fromFile( file )( Codec.UTF8 )
  }
}
