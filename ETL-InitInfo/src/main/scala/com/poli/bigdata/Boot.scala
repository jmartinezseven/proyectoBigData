package com.poli.bigdata

import akka.actor.ActorSystem
import akka.io.IO
import akka.util.Timeout
import spray.can.Http
import akka.pattern.ask
import scala.concurrent.duration._

object Boot extends App {

  implicit val timeout = Timeout( 50.seconds )

  implicit val system = ActorSystem( "ETL-InitData" )
//  val orchestrator = system.actorOf( QuizServiceActor.props, "quiz-amapola-service" )
//  val host = "0.0.0.0"
//  val port = Option( System.getenv( "PORT" ) ).getOrElse( "8080" )
//  IO( Http ) ? Http.Bind( orchestrator, interface = host, port = port.toInt )
}
