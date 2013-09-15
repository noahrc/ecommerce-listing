'use strict'

angular.module('ecommerceListingApp')
  .controller 'MainCtrl', ($scope, $http) ->
    $http.get('/products/products.json').success (data) ->
    	$scope.products = data.products
