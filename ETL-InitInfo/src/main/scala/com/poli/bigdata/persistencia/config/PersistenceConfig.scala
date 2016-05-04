package com.poli.bigdata.persistencia.config

import java.sql.{Statement, DriverManager}

object PersistenceConfig {

  Class.forName("com.mysql.jdbc.Driver");

  val connect = DriverManager
    .getConnection("mysql://bfd0a3a906a8e3:9b47547f@us-cdbr-iron-east-03.cleardb.net/heroku_94b598c4e735470?reconnect=true");

  val statement = connect.createStatement();

}
