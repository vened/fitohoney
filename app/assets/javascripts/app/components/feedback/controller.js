angular.module('app.components', []).controller("FeedbackController", function ($scope, Feedback) {

	$scope.feedback = {};
	$scope.feedback.name = '';
	$scope.feedback.phone = '';
	$scope.feedback.email = '';
	$scope.feedback.note = '';

	$scope.submit = function (obj) {
		$scope.errors = null;
		$scope.success = null;
		Feedback.create(obj)
			.success(function (data) {
				$scope.success = data.success;
			})
			.error(function (data) {
				$scope.errors = data;
			})
	}


	$scope.reload = function () {
		$scope.errors = null;
		$scope.success = null;
		$scope.feedback = {};
		$scope.feedback.name = '';
		$scope.feedback.phone = '';
		$scope.feedback.email = '';
		$scope.feedback.note = '';
	}

})