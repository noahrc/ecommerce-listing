'use strict'

angular.module('ecommerceListingApp', [])
  .config ($routeProvider) ->
    $routeProvider
      .when '/',
        templateUrl: 'views/products.html'
        controller: 'MainCtrl'
      .otherwise
        redirectTo: '/'
