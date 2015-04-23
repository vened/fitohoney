appComponents.directive('checkboxFilter', function ($templateCache) {
	return {
		restrict: 'E',
		replace : true,
		template: $templateCache.get('app/templates/filter_checkbox.html'),
		//scope   : {
		//	filter: '=',
		//	index: '='
		//},
		link    : function (scope, element, attributes) {
			
			scope.currentFilter = [];
			scope.selectedFilter = function(value){
				console.log(value);
			}
			
			element.find('.filter-block__header').on('click', function () {
				element.toggleClass('open');
			})
		}
	}
});