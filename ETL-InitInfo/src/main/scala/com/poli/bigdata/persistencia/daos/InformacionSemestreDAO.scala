package com.poli.bigdata.persistencia.daos

import com.poli.bigdata.persistencia.modelo.InformacionSemestreEstudiante

import com.poli.bigdata.persistencia.config.PersistenceConfig._

class InformacionSemestreDAO() extends DAO[InformacionSemestreEstudiante] {
  override def insertarRegistro(entity: InformacionSemestreEstudiante): Boolean = {
    val query = s"INSERT INTO ${InformacionSemestreEstudiante.nombreTabla} VALUES (" +
      s"${entity.id}," +
      s"${entity.idEstudiante}," +
      s"${entity.anio}," +
      s"${entity.periodo}," +
      s"${entity.materia}," +
      s"${entity.notaPrimerCorte}," +
      s"${entity.notaSegundoCorte}," +
      s"${entity.notaTercerCorte}" +
      s")"

    val prepareStatement = connect.prepareStatement(query)
    prepareStatement.execute()
  }
}
