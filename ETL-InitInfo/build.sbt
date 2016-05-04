import com.typesafe.sbt.SbtScalariform.ScalariformKeys
import sbtassembly.Plugin.{PathList, MergeStrategy, AssemblyKeys}
import AssemblyKeys._
import com.typesafe.sbt.SbtStartScript
import scoverage.ScoverageSbtPlugin
import scalariform.formatter.preferences._
import spray.revolver.RevolverPlugin._

releaseSettings

assemblySettings

Seq(SbtStartScript.startScriptForClassesSettings: _*)

scalariformSettings

ScalariformKeys.preferences := ScalariformKeys.preferences.value
  .setPreference(AlignSingleLineCaseStatements, true)
  .setPreference(DoubleIndentClassDeclaration, true)
  .setPreference(PreserveDanglingCloseParenthesis, true)
  .setPreference(AlignParameters, true)
  .setPreference(CompactControlReadability, true)
  .setPreference(SpaceInsideBrackets, true)
  .setPreference(SpaceInsideParentheses, true)
  .setPreference(SpacesWithinPatternBinders, true)

name := "quiz-amapola"

organization := "com.poli.bigdata"

scalaVersion := "2.11.6"

resolvers ++= Seq(
  "Typesafe Releases"   at "http://repo.typesafe.com/typesafe/maven-releases/",
  "Spray repo"          at "http://repo.spray.io",
  "Sonatype Snapshots"  at "https://oss.sonatype.org/content/repositories/snapshots/",
  "Scalaz Bintray Repo" at "https://dl.bintray.com/scalaz/releases"
)

libraryDependencies ++= Seq( 
  "com.typesafe.akka"               %%  "akka-actor"          % "2.3.10"            withSources(),
  "io.spray"                        %%  "spray-routing"       % "1.3.3"             withSources(),
  "io.spray"                        %%  "spray-util"          % "1.3.3"             withSources(),
  "io.spray"                        %%  "spray-client"        % "1.3.3"             withSources(),
  "io.spray"                        %%  "spray-json"          % "1.3.1"             withSources(),
  "org.json4s"                      %%  "json4s-native"       % "3.2.11"            withSources(),
  "org.json4s"                      %%  "json4s-jackson"      % "3.2.11"            withSources(),
  "com.typesafe.scala-logging"      %%  "scala-logging"       % "3.1.0"             withSources(),
  "ch.qos.logback"                  %   "logback-classic"     % "1.1.3"             withSources(),
  "org.apache.httpcomponents"       %   "httpclient"          % "4.4.1"             withSources(),
  "org.scalaz"                      %%  "scalaz-core"         % "7.1.1"             withSources(),
  "org.scalaz"                      %%  "scalaz-concurrent"   % "7.1.1"             withSources(),
  "org.scalaz.stream"               %%  "scalaz-stream"       % "0.7a"              withSources(),
  "net.codingwell"                  %%  "scala-guice"         % "4.0.0-beta5"       withSources(),
  "joda-time"                       %   "joda-time"           % "2.7",
  "org.joda"                        %   "joda-convert"        % "1.7",
  "commons-discovery"               %   "commons-discovery"   % "0.2",
  "commons-logging"                 %   "commons-logging"     % "1.1.1",
  "com.typesafe.akka"               %%  "akka-testkit"        % "2.3.10"      % "test"  withSources(),
  "io.spray"                        %%  "spray-testkit"       % "1.3.1"       % "test"  withSources(),
  "org.scalatest"                   %   "scalatest_2.11"      % "2.2.4"       % "test"  withSources(),
  "org.specs2"                      %%  "specs2-core"         % "3.5"         % "test"  withSources(),
  "org.mockito"                     %   "mockito-all"         % "1.10.19"     % "test"  withSources(),
  "com.softwaremill.macwire"        %%  "macros"                              % "1.0.1" withSources(),
  "com.softwaremill.macwire"        %%  "runtime"                             % "1.0.1" withSources(),
  "mysql"                           % "mysql-connector-java"                  % "6.0.2",
  "com.google.code.gson"            % "gson"                                  % "1.7.1",
  "com.enragedginger"               %% "akka-quartz-scheduler"                % "1.5.0-akka-2.4.x",
  "ch.qos.logback"                  %  "logback-classic"                      % "1.1.7",
  "javax.mail"                      %  "mail"                                  % "1.4.1"
)

jarName in assembly := "etlInitInfo"

mainClass in assembly := Some("com.poli.bigdata.Boot")

outputPath in assembly := file("jar/etlInitInfo.jar")

test in assembly := {}

mergeStrategy in assembly <<= (mergeStrategy in assembly) {
  (old) => {
    case PathList("scala", "xml", xs @ _*) => MergeStrategy.first
    case "META-INF/log4j-provider.properties" => MergeStrategy.last
    case PathList(ps @ _*) if ps.last endsWith ".class" => MergeStrategy.first
    case x => old(x)
  }
}

scalacOptions ++= Seq(
  "-deprecation",
  "-encoding", "UTF-8",
  "-feature",                
  "-language:existentials",
  "-language:higherKinds",
  "-language:implicitConversions",
  "-language:experimental.macros",
  "-language:postfixOps",
  "-unchecked",
  "-Yno-adapted-args",       
  "-Ywarn-dead-code",
  "-Xfuture"     
)

ivyScala := ivyScala.value map { _.copy(overrideScalaVersion = true) }
