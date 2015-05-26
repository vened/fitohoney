appComponents.controller("OrderController", function ($scope, $location, $anchorScroll, Order) {

	Order.mini_cart()
		.success(function (data) {
			$scope.cartItems = data;
		});


	/**
	 * добавление товара в корзину
	 */
	$scope.addOrder = function (product_id, count, measure, origin_price) {
		var obj = {
			order: {
				product_id: product_id,
				count     : count,
				measure   : measure,
				origin_price: origin_price
			}
		}
		Order.create(obj)
			.success(function (data) {
				$scope.cartItems = data;
			})
	}

	/**
	 * удаление товара из корзины
	 * @param id
	 */
	$scope.productDestroy = function (item_id, product_id) {
		Order.cart_item_destroy(item_id, product_id)
			.success(function (data) {
				$scope.cartItems = data;
			})
	}


	$scope.gotoOrderConfirm = function (id) {
		$scope.OrderConfirm = true;
		$location.hash(id);
		$anchorScroll();
	}


	$scope.order = {};
	$scope.orderSubmit = function (order, order_id) {
		Order.update(order, order_id)
			.success(function (data) {
				$scope.cartItems = {};
				$scope.orderSuccess = data.success;
			})
	}


})