requires = [
  "myApp.controllers",
  "myApp.filters",
  "myApp.services",
  "myApp.directives",
  "ui.bootstrap"
]

angular.module("myApp", requires).

config ["$routeProvider", ($routeProvider) ->
  $routeProvider
    .when "/home",
      templateUrl: "/partials/home"

    .when "/about",
      templateUrl: "/partials/about"

    .when "/demo",
      templateUrl: "/partials/demo"

    .otherwise redirectTo: "/home"
]