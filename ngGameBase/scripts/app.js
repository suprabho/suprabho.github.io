 angular
 	.module("ngGamebase", ["ngMaterial" , "angular-carousel", "ngTouch"])
 	.config(function($mdThemingProvider) {  

 		$mdThemingProvider.theme('default')
 			.primaryPalette('blue')
 			.accentPalette('red');


 	});