(function () {
    'use strict';

    angular
        .module('TikiCinemaSystem')
        .controller('movieTheaterCtrl', movieTheaterCtrl);

    movieTheaterCtrl.$inject = ['$scope','$stateParams', '$rootScope', '$localStorage', 'movieTheaterService', 'notifyService', '$state', 'blockUI'];
    function movieTheaterCtrl($scope, $stateParams,$rootScope, $localStorage, movieTheaterService, notifyService, $state, blockUI) {
        $scope.cinemaId = $stateParams.cinemaId;
        $scope.movieTheaters = [];
        initController();
        ////////////////

        function initController() {
            getListMovieTheater($scope.cinemaId);
        }

        function getListMovieTheater(cinemaId) {
            movieTheaterService.getListMovieTheatersByCinemaId(cinemaId,function(result) {
                $scope.movieTheaters = result.data;
                $rootScope.movieTheaters = result.data;
                console.log($scope.movieTheaters);
            });
        }
    }
})();