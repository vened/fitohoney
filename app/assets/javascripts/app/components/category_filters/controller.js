appComponents.controller("FilterController", function ($scope, $location, $timeout, CategoryFilter) {


    $scope.serverProductsShow = true;
    $scope.params = {filter: {}};

    $scope.initFilter = function (category_id) {
        CategoryFilter.filters(category_id)
            .success(function (data) {
                $scope.filters = data;
            })
    }

    $scope.searchStart = function (search) {
        $scope.productsShow = false;
        $scope.serverProductsShow = false;
        CategoryFilter.filtering(search)
            .success(function (data) {
                $scope.searchResult = data;
                $scope.productsShow = true;
            })
    }

    $scope.resetFilter = function () {
        $scope.params = {filter: {}};
        $scope.productsShow = false;
        $scope.serverProductsShow = true;
    }

})