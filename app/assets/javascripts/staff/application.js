// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require js-routes
//= require angular/angular
//= require angular-rails-templates
//= require angular-file-upload/angular-file-upload
//= require ./app
//= require_tree ./templates
//= require_tree ./directives
//= require_tree ./components
//= require bootstrap-sprockets
//= require bootstrap-wysihtml5
// require turbolinks
// require_tree .


$(document).ready(function () {

	$('.editor').each(function (i, elem) {
		$(elem).wysihtml5();
	});

})