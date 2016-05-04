package com.poli.bigdata.notificaciones.config

import java.util.Properties
import javax.mail.Session;


object ConfiguracionEmail {

  val props = new Properties();
  props.setProperty("mail.smtp.host", "smtp.gmail.com");
  props.setProperty("mail.smtp.starttls.enable", "true");
  props.setProperty("mail.smtp.port","587");
  props.setProperty("mail.smtp.user", "chebbymar@gmail.com");
  props.setProperty("mail.smtp.auth", "true");

  // Preparamos la sesion
  val session = Session.getDefaultInstance(props);

}
