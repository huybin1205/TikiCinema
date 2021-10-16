(function () {
    'use strict';

    angular
        .module('TikiCinemaSystem')
        .controller('homeCtrl', homeCtrl);

    homeCtrl.$inject = ['$scope', '$rootScope', '$localStorage', 'homeService', 'notifyService', '$state', 'blockUI'];
    function homeCtrl($scope, $rootScope, $localStorage, homeService, notifyService, $state, blockUI) {
        initController();
        $scope.cinemars = [];
        ////////////////

        function initController() {
            getListCinemar();
        }

        function getListCinemar() {
            homeService.getListCinemar(function(result) {
                $scope.cinemars = result.data;
            });
        }
    }
})();