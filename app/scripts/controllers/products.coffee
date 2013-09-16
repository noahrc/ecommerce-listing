'use strict'

angular.module('ecomApp')
  	.controller 'ProductsCtrl', ($scope, $http, $rootScope) ->
    	$http.get('/products/products.json').success (data) ->
    		for product in data.products
    			product.quantity = 1
    			product.price = if product.sale then product.salePrice else product.listPrice 
    		$scope.products = data.products

    		

