angular.module("myApp.directives", []).directive "appVersion", ["version", (version) ->
  (scope, elm, attrs) ->
    elm.text version
    return
]