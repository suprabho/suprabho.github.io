 angular
 	.module("ngGamebase", ["ngMaterial"])
 	.config(function($mdThemingProvider) {  

 		$mdThemingProvider.theme('default')
 			.primaryPalette('blue')
 			.accentPalette('red');


 	});