 angular
 	.module("ngGamebase", ["ngMaterial" , "angular-carousel", "ngTouch", "angular-carousel.shifty"])
 	.config(function($mdThemingProvider) {  

 		$mdThemingProvider.theme('default')
 			.primaryPalette('blue')
 			.accentPalette('red');


 	});