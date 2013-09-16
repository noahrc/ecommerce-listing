'use strict'

angular.module('ecomApp')
    .controller 'CartCtrl', ($scope, $http, $rootScope) ->
    	$http.get('/cart/cart.json').success (data) ->
    		$scope.cart = data.cart
    		$scope.shippingMethods = data.cart.shippingmethods
    		$scope.selectedShippingMethod = "Ground Shipping" 
    		$scope.totals = data.cart.totals
    		$scope.items = data.cart.items
    		$scope.itemCount = 0

    	$rootScope.addToCart = (e, product)->
    		e.preventDefault()
    		product.quantityPrice = product.quantity * product.price
    		$scope.itemCount += product.quantity
    		$scope.items.push product
    		$scope.cart.totals.subtotal += product.quantityPrice

    	$rootScope.updateQuantity = (e) ->
    		e.preventDefault()

    	$rootScope.removeFromCart = (e, item) ->
    		e.preventDefault()
    		$scope.itemCount -= item.quantity
    		i = $scope.items.indexOf(item)
    		if i?
    			$scope.items.splice(i,1)
    		$scope.cart.totals.subtotal -= item.quantityPrice

