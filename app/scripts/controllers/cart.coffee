'use strict'

angular.module('ecomApp')
    .controller 'CartCtrl', ($scope, $http) ->
    	$http.get('/cart/cart.json').success (data) ->
    		$scope.cart = data.cart
    		$scope.shippingMethods = data.cart.shippingmethods
    		$scope.selectedShippingMethod = "Ground Shipping"
    		$scope.totals = data.totals
    		$scope.items = data.items

