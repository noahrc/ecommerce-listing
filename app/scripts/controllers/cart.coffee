'use strict'

angular.module('ecomApp')
    .controller 'CartCtrl', ($scope, $http, $rootScope) ->
    	$http.get('/cart/cart.json').success (data) ->
    		$scope.cart = data.cart
    		$scope.shippingMethods = data.cart.shippingmethods
    		$scope.selectedShippingMethod = undefined
    		$scope.totals = data.cart.totals
    		$scope.items = data.cart.items
    		$scope.itemCount = 0

    	$rootScope.addToCart = (e, product)->
    		e.preventDefault()
    		product.quantityPrice = product.quantity * product.price
    		$scope.itemCount += product.quantity
    		$scope.items.push product
    		$scope.cart.totals.subtotal += product.quantityPrice
    		unless $scope.selectedShippingMethod?
    			$scope.selectedShippingMethod = "Ground Shipping"
    		$scope.updateShipping()
    		

    	$rootScope.updateQuantity = (e) ->
    		e.preventDefault()

    	$scope.removeFromCart = (e, item) ->
    		e.preventDefault()
    		$scope.itemCount -= item.quantity
    		i = $scope.items.indexOf(item)
    		$scope.items.splice(i,1)
    		$scope.cart.totals.subtotal -= item.quantityPrice
    		$scope.updateShipping()

    	$scope.updateShipping = (e) ->
    		if $scope.cart.totals.subtotal > 500
    			$scope.cart.totals.shipping = 0 
    		else
    			$scope.cart.totals.shipping = parseFloat($scope.shippingMethods[$scope.selectedShippingMethod].price)

