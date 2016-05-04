package com.poli.bigdata.persistencia.modelo

case class InformacionSemestreEstudiante(
                                     id: Int,
                                     idEstudiante: Int,
                                     anio: String,
                                     periodo: String,
                                     materia: String,
                                     notaPrimerCorte: Double,
                                     notaSegundoCorte: Double,
                                     notaTercerCorte: Double
                                     )

object InformacionSemestreEstudiante {
  def nombreTabla = "informaciom_semestre_estudiante"
}
