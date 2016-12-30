(function(){

	"use strict";

	angular
		.module("ngGamebase")
		.factory("gamesFactory", function($http){

			function getGames(){
				return $http.get('data/data.json')

			}

			return {
				getGames: getGames
			}

		})

})();