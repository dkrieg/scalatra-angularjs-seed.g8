module = angular.module("$name;format="camel"$.filters", [])

module.filter "interpolate", ["version", (version) ->
  (text) ->
    String(text).replace /\%VERSION\%/g, version
]