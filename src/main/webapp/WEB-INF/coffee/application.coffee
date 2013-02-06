angular.module("myApp", ["myApp.filters", "myApp.services", "myApp.directives"]).config ["$routeProvider", ($routeProvider) ->
  $routeProvider.when "/home",
    templateUrl: "/partials/home"

  $routeProvider.when "/about",
    templateUrl: "/partials/about"

  $routeProvider.when "/demo",
    templateUrl: "/partials/demo"

  $routeProvider.otherwise redirectTo: "/home"

  return
]