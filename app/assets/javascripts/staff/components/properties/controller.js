appComponents.controller("PropertiesController", function ($scope, Property) {


    /**
     * получение и показ всех свойств
     * @param product_id
     */
    $scope.allProperty = function (product_id) {
        Property.all(product_id)
            .success(function (data) {
                $scope.properties = data;
            })
    }


    /**
     * сохранение свойства в БД
     * @param obj
     */
    $scope.property = null;
    $scope.propertyForm = false;
    $scope.newProperty = function () {
        $scope.propertyForm = true;
    };
    $scope.createProperty = function (obj, product_id) {
        Property.create(obj)
            .success(function (data) {
                $scope.allProperty(product_id);
                $scope.property = null;
                $scope.propertyForm = false;
            })
    }


    /**
     * destroy property
     */
    $scope.destroyProperty = function (property_id, product_id) {
        Property.destroy(property_id, product_id)
            .success(function (data) {
                $scope.allProperty(product_id);
            })
    }

})