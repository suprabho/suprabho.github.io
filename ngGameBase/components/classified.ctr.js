(function() {

	"use strict";

	angular
		.module("ngGamebase")
		.controller("baseCtrl", function($scope, $http, gamesFactory) {

			gamesFactory.getGames().then(function(games) {

				 $scope.games = games.data;

			});

			
		}); 

	 	
})();   