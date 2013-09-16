(function(){"use strict";var a;a=angular.module("ecomApp",[]),a.config(["$routeProvider",function(a){return a.when("/",{templateUrl:"views/products.html",controller:"ProductsCtrl"}).otherwise({redirectTo:"/"})}])}).call(this),function(){"use strict";angular.module("ecomApp").controller("ProductsCtrl",["$scope","$http","$rootScope",function(a,b){return b.get("/products/products.json").success(function(b){var c,d,e,f;for(f=b.products,d=0,e=f.length;e>d;d++)c=f[d],c.quantity=1,c.price=c.sale?c.salePrice:c.listPrice;return a.products=b.products})}])}.call(this),function(){"use strict";angular.module("ecomApp").controller("CartCtrl",["$scope","$http","$rootScope",function(a,b,c){return b.get("/cart/cart.json").success(function(b){return a.cart=b.cart,a.shippingMethods=b.cart.shippingmethods,a.selectedShippingMethod=void 0,a.totals=b.cart.totals,a.items=b.cart.items,a.itemCount=0}),c.addToCart=function(b,c){return b.preventDefault(),c.quantityPrice=c.quantity*c.price,a.itemCount+=c.quantity,a.items.push(c),a.cart.totals.subtotal+=c.quantityPrice,null==a.selectedShippingMethod&&(a.selectedShippingMethod="Ground Shipping"),a.updateShipping()},c.updateQuantity=function(a){return a.preventDefault()},a.removeFromCart=function(b,c){var d;return b.preventDefault(),a.itemCount-=c.quantity,d=a.items.indexOf(c),a.items.splice(d,1),a.cart.totals.subtotal-=c.quantityPrice,a.updateShipping()},a.updateShipping=function(){return a.cart.totals.shipping=a.cart.totals.subtotal>500?0:parseFloat(a.shippingMethods[a.selectedShippingMethod].price)}}])}.call(this);