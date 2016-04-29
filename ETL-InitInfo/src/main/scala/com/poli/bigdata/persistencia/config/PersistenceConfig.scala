package com.poli.bigdata.persistencia.config

import java.sql.DriverManager

object PersistenceConfig {

  Class.forName("com.mysql.jdbc.Driver");

  val connect = DriverManager
    .getConnection("jdbc:mysql://localhost/feedback?"
    + "user=sqluser&password=sqluserpw");

  val statement = connect.createStatement();

}
