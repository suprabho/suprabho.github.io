(function() {

	"use strict";

	angular
		.module("ngGamebase")
		.controller("baseCtrl", function($scope, $http, gamesFactory) {

			

			gamesFactory.getGames().then(function(games) {

				 $scope.games = games.data;
				 $scope.genres = getGenres($scope.games);
				 


			});

			

			function getGenres(games) {

				var genres = [];

				angular.forEach(games, function(item) 
				{
					angular.forEach(item.genres, function(genre) 
					{
						genres.push(genre); 
					});
				});  

				return   _.uniq(genres);
			  }
			
			function getCovers(games){
				
				var slides= [];

				angular.forEach(games, function(cover){

					 slides.push(cover);

				});

			}
		}); 

			

		
	 	
})();   