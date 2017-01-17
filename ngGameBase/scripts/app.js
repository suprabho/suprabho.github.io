 angular
 	.module("ngGamebase", ["ngMaterial" , "angular-carousel"])
 	.config(function($mdThemingProvider) {  

 		$mdThemingProvider.theme('default')
 			.primaryPalette('blue')
 			.accentPalette('red');


 	});