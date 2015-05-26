appComponents.directive('productCount', function ($templateCache) {
	return {
		restrict  : 'E',
		replace   : true,
		template  : $templateCache.get('app/components/order/tpl/productCount.html'),
		scope     : {
			productData : '=',
			productModel: '='
		},
		controller: function ($scope) {

			$scope.productModel = {};

			$scope.productModel.count = 1;
			
			$scope.$watch('productData', function(data){
				$scope.productModel.measure = data.measure;
				$scope.productModel.origin_price = data.price; 
				$scope.productModel.total = data.measure * $scope.productModel.count;
				$scope.productModel.price = data.price * $scope.productModel.count;
				$scope.price = data.price;
			})
			

			$scope.Inc = function () {
				$scope.productModel.count += 1;
				$scope.productModel.total = $scope.productModel.measure * $scope.productModel.count;
				$scope.productModel.price = $scope.price * $scope.productModel.count;
			}

			$scope.Dec = function () {
				if ($scope.productModel.count > 1) {
					$scope.productModel.count -= 1;
				}
				$scope.productModel.total = $scope.productModel.measure * $scope.productModel.count;
				$scope.productModel.price = $scope.price * $scope.productModel.count;
			}
			
			
			$scope.ProductCount = function(){
				if ($scope.productModel.count < 1) {
					$scope.productModel.count = 1;
				}
				$scope.productModel.total = $scope.productModel.measure * $scope.productModel.count;
				$scope.productModel.price = $scope.price * $scope.productModel.count;
			}

		}
	}
});