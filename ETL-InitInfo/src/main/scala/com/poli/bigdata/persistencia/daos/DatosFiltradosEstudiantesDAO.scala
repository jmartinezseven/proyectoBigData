package com.poli.bigdata.persistencia.daos

import com.poli.bigdata.persistencia.config.PersistenceConfig._
import com.poli.bigdata.persistencia.modelo.DatosFiltradosEstudiantes

class DatosFiltradosEstudiantesDAO extends DAO[DatosFiltradosEstudiantes] {
  override def insertarRegistro(entity: DatosFiltradosEstudiantes): Boolean = {
    val query = s"INSERT INTO ${DatosFiltradosEstudiantes.nombreTabla} VALUES (" +
      s"${entity.id}," +
      s"${entity.idEstudiante}," +
      s"${entity.primerNombre}," +
      s"${entity.segundoNombre}," +
      s"${entity.primerApellido}," +
      s"${entity.segundoApellido}," +
      s"${entity.fechaDeNacimiento.toDate}," +
      s"${entity.estadoCivil}," +
      s"${entity.estrato}," +
      s"${entity.becado}," +
      s"${entity.sexo}," +
      s"${entity.trabajaActualmente}," +
      s"${entity.fechaIngresoUniversidad.toDate}," +
      s"${entity.fechaGradiacionUniversidad.toDate}" +
      s")"

    val prepareStatement = connect.prepareStatement(query)
    prepareStatement.execute()
  }
}
