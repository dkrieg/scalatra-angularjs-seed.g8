angular.module("myApp", ["myApp.filters", "myApp.services", "myApp.directives"]).config ["$routeProvider", ($routeProvider) ->
  $routeProvider.when "/view1",
    templateUrl: "app/partials/partial1"
    controller: MyCtrl1

  $routeProvider.when "/view2",
    templateUrl: "app/partials/partial2"
    controller: MyCtrl2

  $routeProvider.otherwise redirectTo: "/view1"

  return
]