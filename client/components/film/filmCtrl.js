(function () {
    'use strict';

    angular
        .module('TikiCinemaSystem')
        .controller('filmCtrl', filmCtrl);

    filmCtrl.$inject = ['$scope', '$rootScope', '$localStorage', 'cinemaService', 'notifyService', '$state', 'blockUI'];
    function filmCtrl($scope, $rootScope, $localStorage, cinemaService, notifyService, $state, blockUI) {
        initController();
        $scope.cinemars = [];
        ////////////////

        function initController() {
            console.log(1);
            // getListCinemas();
        }

        // function getListCinemas() {
        //     cinemaService.getListCinemas(function(result) {
        //         $scope.cinemars = result.data;
        //     });
        // }
    }
})();