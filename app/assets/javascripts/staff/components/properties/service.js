appServices.service('Property', function ($http) {
    return {
        all: function (product_id) {
            return $http({
                url: Routes.staff_api_properties_product_path(product_id),
                method: "get"
            });
        },
        create: function (obj) {
            return $http({
                url: Routes.staff_api_properties_path(),
                method: "POST",
                data: obj
            });
        },
        destroy: function (property_id, product_id) {
            return $http({
                url: Routes.staff_api_property_destroy_path(property_id, product_id),
                method: "DELETE"
            });
        }
    };
});
