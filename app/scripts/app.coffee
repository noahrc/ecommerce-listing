'use strict'

ecomApp = angular.module('ecomApp', [])

ecomApp.config ($routeProvider) ->
    $routeProvider
    	.when '/',
    		templateUrl: 'views/products.html'
    		controller: 'ProductsCtrl'
    	.otherwise
    		redirectTo: '/'
