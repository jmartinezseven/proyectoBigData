package com.poli.bigdata.persistencia.modelo

import org.joda.time.DateTime

case class DatosFiltradosEstudiantes(
                                 id: Int,
                                 idEstudiante: String,
                                 primerNombre: String,
                                 segundoNombre: String,
                                 primerApellido: String,
                                 segundoApellido: String,
                                 fechaDeNacimiento: DateTime,
                                 estadoCivil: String,
                                 estrato: String,
                                 becado: Boolean,
                                 sexo: String,
                                 trabajaActualmente: Boolean,
                                 fechaIngresoUniversidad: DateTime,
                                 fechaGradiacionUniversidad: DateTime
                                 )

object DatosFiltradosEstudiantes {
  def nombreTabla = "datos_filtrados_estudiantes"
}
