'use strict';

var app = angular.module('app', [
	'angularFileUpload',
	'app.components',
	'app.services',
	'templates'
]);

app.config(function ($httpProvider) {
	$httpProvider.defaults.headers.common['X-CSRF-Token'] = document.querySelector('meta[name="csrf-token"]').content
})


var appComponents = angular.module('app.components', []);
var appServices = angular.module('app.services', []);