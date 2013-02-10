requires = [
  "myApp.controllers",
  "myApp.filters",
  "myApp.services",
  "myApp.directives",
  "ui.bootstrap"
]

module = angular.module("myApp", requires)

module.config ["$routeProvider", ($routeProvider) ->
  $routeProvider
    .when "/home",
      templateUrl: "/partials/home"

    .when "/about",
      templateUrl: "/partials/about"

    .when "/demo",
      templateUrl: "/partials/demo"

    .otherwise redirectTo: "/home"
]