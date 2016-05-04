package com.poli.bigdata.notificaciones.email

import javax.mail.Message
import javax.mail.internet.{InternetAddress, MimeMessage}

import com.poli.bigdata.notificaciones.config.ConfiguracionEmail._

class NotifiacionesCorreoServicio {

  def enviarNotificacion(recipient: String, subject: String, messageText: String): Unit = {
    val message = new MimeMessage(session);
    message.setFrom(new InternetAddress("chebbymar@gmail.com"));
    message.addRecipient(Message.RecipientType.TO, new InternetAddress(recipient));
    message.setSubject(subject);
    message.setText(messageText);

    val t = session.getTransport("smtp");
    t.connect("chebbymar@gmail.com", "Samantha26");
    t.sendMessage(message, message.getAllRecipients());
    t.close()
  }

}
