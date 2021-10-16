(function () {
    'use strict';

    angular
        .module('TikiCinemaSystem')
        .controller('cinemaCtrl', cinemaCtrl);

    cinemaCtrl.$inject = ['$scope','$stateParams','$rootScope', '$localStorage', 'authService', 'notifyService', '$state', 'blockUI'];
    function cinemaCtrl($scope, $stateParams, $rootScope, $localStorage, authService, notifyService, $state, blockUI) {
        $scope.cinemaId = $stateParams.cinemaId

        initController();

        ////////////////

        function initController() {
           console.log($scope.cinemaId);
        }
    }
})();