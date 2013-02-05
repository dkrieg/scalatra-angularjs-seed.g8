angular.module("myApp.filters", []).filter "interpolate", ["version", (version) ->
  (text) ->
    String(text).replace /\%VERSION\%/g, version
]