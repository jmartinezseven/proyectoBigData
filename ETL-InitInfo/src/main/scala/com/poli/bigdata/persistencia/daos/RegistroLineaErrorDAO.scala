package com.poli.bigdata.persistencia.daos

import com.poli.bigdata.persistencia.config.PersistenceConfig._
import com.poli.bigdata.persistencia.modelo.RegistroLineaError

class RegistroLineaErrorDAO extends DAO[RegistroLineaError]{
  override def insertarRegistro(entity: RegistroLineaError): Boolean = {
    val query = s"INSERT INTO ${RegistroLineaError.nombreTabla} VALUES (" +
      s"${entity.id}," +
      s"${entity.lineaRegistro}," +
      s"${entity.nombreProceso}" +
      s")"

    val prepareStatement = connect.prepareStatement(query)
    prepareStatement.execute()
  }
}
