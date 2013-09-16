'use strict'

angular.module('ecomApp')
  	.controller 'ProductsCtrl', ($scope, $http) ->
    	$http.get('/products/products.json').success (data) ->
    		$scope.products = data.products

