import sbt._

object plugins extends Build {

  lazy val plugins = Project("plugins", file("."))
    .dependsOn(uri("git://github.com/guardian/sbt-jasmine-plugin.git#0.8"))
}
