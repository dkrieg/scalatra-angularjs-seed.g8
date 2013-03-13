module = angular.module("$name;format="camel"$.directives", [])

module.directive "appVersion", ["version", (version) ->
  (scope, elm, attrs) ->
    elm.text version
]