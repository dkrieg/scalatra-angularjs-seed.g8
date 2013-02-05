import com.bowlingx.sbt.plugins.Wro4jPlugin._
import Wro4jKeys._

scalaVersion := "2.10.0"

classpathTypes ~= (_ + "orbit")

seq(webSettings :_*)

seq(wro4jSettings: _*)

// Add compiled files to your war file:
(webappResources in Compile) <+= (targetFolder in generateResources in Compile)

libraryDependencies ++= Seq(
  "org.scalatra" %% "scalatra" % "2.2.0-RC3",
  "org.scalatra" %% "scalatra-scalate" % "2.2.0-RC3",
  "org.scalatra" %% "scalatra-scalatest" % "2.2.0-RC3" % "test",
  "org.scalatra" %% "scalatra-json" % "2.2.0-RC3",
  "org.scalatra" %% "scalatra-swagger"  % "2.2.0-RC3",
  "org.json4s"   %% "json4s-jackson" % "3.1.0",
  "com.wordnik" % "swagger-core_2.10.0" % "1.2.0",
  "ch.qos.logback" % "logback-classic" % "1.0.6" % "runtime",
  "org.eclipse.jetty" % "jetty-webapp" % "8.1.7.v20120910" % "test,container",
  "org.eclipse.jetty.orbit" % "javax.servlet" % "3.0.0.v201112011016" % "container;provided;test" artifacts (Artifact("javax.servlet", "jar", "jar"))
)


