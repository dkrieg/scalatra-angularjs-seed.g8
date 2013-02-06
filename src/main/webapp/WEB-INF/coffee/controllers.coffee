@MenuCtrl = ($scope) ->
  menus = $scope.menus = [
    {selected: true, title: "Home", href: "/#/home"},
    {selected: false, title: "About", href: "/#/about"},
    {selected: false, title: "Demo", href: "/#/demo"}
  ]

  $scope.click = (menu) ->
    angular.forEach(menus, (m) -> m.selected = false;return)
    menu.selected = true
    return

  return