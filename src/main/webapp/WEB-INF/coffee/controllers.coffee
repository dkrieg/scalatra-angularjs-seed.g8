module = angular.module("myApp.controllers", [])

class MenuCtrl
  @$inject = ["$scope"]
  constructor: ($scope) ->
    @menus = $scope.menus = [
      {selected: true, title: "Home", href: "/#/home"},
      {selected: false, title: "About", href: "/#/about"},
      {selected: false, title: "Demo", href: "/#/demo"}
    ]

    $scope.click = @click

  click: (menu) ->
    angular.forEach(@menus, (m) -> m.selected = false;return)
    menu.selected = true

class AccordionDemoCtrl
  @$inject = ["$scope"]
  constructor: ($scope) ->
    $scope.oneAtATime = @oneAtATime
    $scope.groups = @groups
    $scope.items = @items
    $scope.addItem = @addItem

  oneAtATime: true

  groups:  [
      {title: "Dynamic Group Header - 1", content: "Dynamic Group Body - 1"},
      {title: "Dynamic Group Header - 2", content: "Dynamic Group Body - 2"}
    ]

  items: ['Item 1', 'Item 2', 'Item 3']

  addItem: ->
    newItemNo = @items.length + 1
    @items push "Item #{newItemNo}"

class AlertDemoCtrl
  @$inject = ["$scope"]
  constructor: ($scope) ->
    _.extend($scope, @)

  alerts: [
    {type: 'error', msg: 'Oh snap! Change a few things up and try submitting again.'},
    {type: 'success', msg: 'Well done! You successfully read this important alert message.'}
  ]

  addAlert: ->
    num = @alerts.length + 1
    @alerts.push {msg: "Alert number #{num}"}

  closeAlert: (index) ->
    @alerts.splice index, 1

class CarouselDemoCtrl
  @$inject = ["$scope"]
  constructor: ($scope) ->
    _.extend($scope, @)

  myInterval: 5000

  slides: [
    {image: 'http://placekitten.com/200/200',text: 'Kitten.'},
    {image: 'http://placekitten.com/225/200',text: 'Kitty!'},
    {image: 'http://placekitten.com/250/200',text: 'Cat.'},
    {image: 'http://placekitten.com/275/200',text: 'Feline!'}
  ]

  addSlide: ->
    @slides.push {
    image: 'http://placekitten.com/'+(200+25*Math.floor(Math.random()*4))+'/200',
    text: ['More','Extra','Lots of','Surplus'][Math.floor(Math.random()*4)] + ' ' +
          ['Cats', 'Kittys', 'Felines', 'Cutes'][Math.floor(Math.random()*4)]
    }


class DialogDemoCtrl
  @$inject = ["$scope", "$dialog"]
  constructor: ($scope, $dialog) ->
    title = 'This is a message box'
    msg = 'This is the content of the message box'
    btns = [{result:'cancel', label: 'Cancel'}, {result:'ok', label: 'OK', cssClass: 'btn-primary'}]

    @dialog = $dialog.dialog(@opts)
    @messageBox = $dialog.messageBox(title, msg, btns)
    _.extend($scope, @)

  opts:
    backdrop: true,
    keyboard: true,
    backdropClick: true,
    templateUrl: '/partials/testDialog',
    controller: 'TestDialogCtrl'

  openDialog: ->
    @dialog.open().then (results) ->
      if results then alert "dialog closed with result: #{results}"

  openMessageBox: ->
    @messageBox.open().then (results) ->
      if results then alert "messagebox closed with result: #{results}"


class TestDialogCtrl
  constructor: ($scope, dialog) ->
    @dialog = dialog
    _.extend($scope, @)

  close: (result) ->
    @dialog.close(result)


module.controller "MenuCtrl", MenuCtrl
module.controller "AccordionDemoCtrl", AccordionDemoCtrl
module.controller "AlertDemoCtrl", AlertDemoCtrl
module.controller "CarouselDemoCtrl", CarouselDemoCtrl
module.controller "DialogDemoCtrl", DialogDemoCtrl
module.controller "TestDialogCtrl", TestDialogCtrl