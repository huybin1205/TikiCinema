(function () {
    'use strict';

    angular
        .module('TikiCinemaSystem')
        .controller('filmCtrl', filmCtrl);

    filmCtrl.$inject = ['$scope', '$rootScope', '$stateParams', '$localStorage', 'filmService', 'notifyService', '$state', 'blockUI'];
    function filmCtrl($scope, $rootScope, $stateParams, $localStorage, filmService, notifyService, $state, blockUI) {
        $scope.cinemaId = $stateParams.cinemaId;
        initController();
        $scope.films = [];
        ////////////////

        function initController() {
            console.log($scope.cinemaId);
            getListFilms();
        }

        function getListFilms() {
            filmService.getListFilms(function (result) {
                $scope.films = result.data;
            });
        }
    }
})();