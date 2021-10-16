(function () {
    'use strict';

    angular
        .module('TikiCinemaSystem')
        .controller('cinemaCtrl', cinemaCtrl);

    cinemaCtrl.$inject = ['$scope', '$rootScope', '$localStorage', 'cinemaService', 'notifyService', '$state', 'blockUI'];
    function cinemaCtrl($scope, $rootScope, $localStorage, cinemaService, notifyService, $state, blockUI) {
        initController();
        $scope.cinemars = [];
        ////////////////

        function initController() {
            getListCinemas();
        }

        function getListCinemas() {
            cinemaService.getListCinemas(function(result) {
                $scope.cinemars = result.data;
            });
        }
    }
})();