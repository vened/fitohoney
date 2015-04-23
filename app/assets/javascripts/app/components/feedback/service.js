angular.module('app.services', []).service('Feedback', function ($http) {
	return {
		create: function (obj) {
			return $http({
				url   : "/feedbacks.json",
				method: "POST",
				data  : obj
			});
		},
		index : function (params) {
			return $http({
				url   : "http://www.micex.ru/issrpc/marketdata/stock/index/daily/short/result_2015_03_09.json",
				method: "GET",
				params: params
			})
		}
	}
})