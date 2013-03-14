name := "$name;format="norm"$"

organization := "$project_group_id$"

version := "$version$"

homepage := Some(url("https://github.com/$github_username$/$name;format="norm"$"))

startYear := Some($year$)

scmInfo := Some(
  ScmInfo(
    url("https://github.com/$github_username$/$name;format="norm"$"),
    "scm:git:https://github.com/$github_username$/$name;format="norm"$",
    Some("scm:git:git@github.com:$github_username$/$name;format="norm"$.git")
  )
)

scalaVersion := "2.10.0"

crossScalaVersions := Seq(
  "2.9.3-RC1",
  "2.9.2",
  "2.9.1", "2.9.1-1",
  "2.9.0", "2.9.0-1",
  "2.8.0", "2.8.1", "2.8.2"
)

scalacOptions ++= Seq(
  "-deprecation",
  "-unchecked",
  "-encoding", "UTF-8"
  // "-Xcheckinit" // for debugging only, see https://github.com/paulp/scala-faq/wiki/Initialization-Order
  // "-optimise"   // this option will slow your build
)

scalacOptions ++= Seq(
  "-Yclosure-elim",
  "-Yinline"
)

scalacOptions <++= scalaVersion map { sv =>
  if (sv startsWith "2.10") List(
    "-Xverify",
    "-Ywarn-all",
    "-feature"
    // "-language:postfixOps",
    // "-language:reflectiveCalls",
    // "-language:implicitConversions"
    // "-language:higherKinds",
    // "-language:existentials",
    // "-language:experimental.macros",
    // "-language:experimental.dynamics"
  )
  else Nil
}

javacOptions ++= Seq("-Xlint:unchecked", "-Xlint:deprecation")

classpathTypes ~= (_ + "orbit")

seq(webSettings :_*)

seq(jsSettings : _*)

(sourceDirectory in (Compile, JsKeys.js)) <<= (sourceDirectory in Compile)(_ / "coffee")

(sourceDirectory in (Test, JsKeys.js)) <<= (sourceDirectory in Test)(_ / "unit" / "coffee")

(resourceManaged in (Compile, JsKeys.js)) <<= (resourceManaged in (Compile, JsKeys.js))(_ / "js")

(resourceManaged in (Test, JsKeys.js)) <<= (resourceManaged in (Test, JsKeys.js))(_ / "unit" / "js")

(resourceGenerators in Compile) <+= (JsKeys.js in Compile)

(compile in Compile) <<= compile in Compile dependsOn (JsKeys.js in Compile)

(compile in Test) <<= compile in Test dependsOn (JsKeys.js in Test)

(JsKeys.prettyPrint in (Compile, JsKeys.js)) := true

(JsKeys.prettyPrint in (Test, JsKeys.js)) := true

(webappResources in Compile) <+= (resourceManaged in Compile)(_ / "js")

seq(lessSettings : _*)

(sourceDirectory in (Compile, LessKeys.less)) <<= (sourceDirectory in Compile)(_ / "less")

(resourceManaged in (Compile, LessKeys.less)) <<= (resourceManaged in (Compile, LessKeys.less))(_ / "css")

(resourceGenerators in Compile) <+= (LessKeys.less in Compile)

(compile in Compile) <<= compile in Compile dependsOn (LessKeys.less in Compile)

(LessKeys.prettyPrint in (Compile, LessKeys.less)) := true

(webappResources in Compile) <+= (resourceManaged in Compile)(_ / "css")

seq(jasmineSettings : _*)

appJsDir <+= resourceManaged { src => src / "main" / "js" }

appJsLibDir <+= sourceDirectory { src => src / "main" / "webapp" / "js" }

jasmineTestDir <+= resourceManaged { src => src  / "test" / "unit" / "js" }

jasmineConfFile <+= resourceManaged { src => src / "test" / "unit" / "js" / "test.dependencies.js" }

jasmineRequireJsFile <+= resourceManaged { src => src / "test" / "js-lib" / "require-2.0.6.js" }

jasmineRequireConfFile <+= resourceManaged { src => src / "test" / "unit" / "js" / "require.conf.js" }

(test in Test) <<= (test in Test) dependsOn (jasmine)

libraryDependencies ++= Seq(
  "org.scalatra" %% "scalatra" % "$scalatra_version$",
  "org.scalatra" %% "scalatra-scalate" % "$scalatra_version$",
  "org.scalatra" %% "scalatra-scalatest" % "$scalatra_version$" % "test",
  "org.scalatra" %% "scalatra-json" % "$scalatra_version$",
  "org.scalatra" %% "scalatra-swagger"  % "$scalatra_version$",
  "org.fusesource.scalamd" % "scalamd_2.10" % "1.6",
  "org.json4s"   %% "json4s-jackson" % "3.1.0",
  "com.wordnik" % "swagger-core_2.10.0" % "1.2.0",
  "ch.qos.logback" % "logback-classic" % "1.0.6" % "runtime",
  "org.eclipse.jetty" % "jetty-webapp" % "8.1.7.v20120910" % "test,container",
  "org.eclipse.jetty.orbit" % "javax.servlet" % "3.0.0.v201112011016" % "container;provided;test" artifacts (Artifact("javax.servlet", "jar", "jar"))
)

