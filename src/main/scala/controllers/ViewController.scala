package controllers

import org.scalatra.scalate.ScalateSupport
import org.scalatra.ScalatraServlet
import grizzled.slf4j.Logger

class ViewController extends ScalatraServlet with ScalateSupport  {

  get("/") {
    contentType="text/html"
    jade("index")
  }

  get("/:page") {
    findTemplate(params("page")) map { path =>
      contentType = "text/html"
      jade(path)
    } orElse serveStaticResource() getOrElse resourceNotFound()
  }

  get("/partials/:page") {
    contentType="text/html"
    jade("/partials/%s.jade" format params("page"), "layout" -> "")
  }
}
