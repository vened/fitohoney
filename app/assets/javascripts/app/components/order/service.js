appServices.service('Order', function ($http) {
    return {
        mini_cart: function () {
            return $http({
                url: Routes.api_mini_cart_path(),
                method: "get"
            });
        },
        create: function (obj) {
            return $http({
                url: Routes.orders_path(),
                method: "POST",
                data: obj
            });
        },
        update: function (obj, order_id) {
            return $http({
                url: Routes.api_order_update_path(order_id),
                method: "PUT",
                data: obj
            });
        },
	    cart_item_destroy: function (id, product_id) {
            return $http({
                url: Routes.api_cart_item_delete_path(),
                method: "DELETE",
	            params: {item_id: id, product_id: product_id}
            });
        }
    };
});
