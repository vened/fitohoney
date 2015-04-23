'use strict';

var app = angular.module('app', [
    'appComponents',
    'appServices',
    'templates',
    'ngAnimate',
    'ui.utils'
]);

app.config(function ($httpProvider) {
    $httpProvider.defaults.headers.common['X-CSRF-Token'] = document.querySelector('meta[name="csrf-token"]').content
});

var appComponents = angular.module('appComponents', []);
var appServices = angular.module('appServices', []);


$(document).on('ready page:load', function () {
    var ngApp = $(".application-ng");
    angular.bootstrap(ngApp, ['app']);
})
