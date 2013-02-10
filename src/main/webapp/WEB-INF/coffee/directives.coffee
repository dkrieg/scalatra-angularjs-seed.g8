module = angular.module("myApp.directives", [])

module.directive "appVersion", ["version", (version) ->
  (scope, elm, attrs) ->
    elm.text version
]