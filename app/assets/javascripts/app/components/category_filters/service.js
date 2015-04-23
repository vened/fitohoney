appServices.service('CategoryFilter', function ($http) {
    return {
        filters: function (category_id) {
            return $http({
                url: Routes.api_filters_path(),
                method: "get",
	            params: {category_id: category_id}
            });
        },
	    filtering: function (params) {
            return $http({
                url: Routes.api_filtering_path(),
                method: "get",
	            params: params
            });
        }
    };
});
