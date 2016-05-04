package com.poli.bigdata.persistencia.daos

abstract class DAO[T] {
  def insertarRegistro(entity:T) : Boolean
}
