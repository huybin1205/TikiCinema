(function () {
    'use strict';

    angular
        .module('TikiCinemaSystem')
        .controller('loginCtrl', loginCtrl);

    loginCtrl.$inject = ['$scope','$rootScope', '$localStorage', 'authService', 'notifyService', '$state', 'blockUI'];
    function loginCtrl($scope, $rootScope, $localStorage, authService, notifyService, $state, blockUI) {
        $scope.login = login;

        initController();

        ////////////////

        function initController() {
            // check login status
            if ($localStorage.currentUser) {
                $state.go('home');
            } else {
                // reset login status
                authService.logout();
            }
        }
        function login() {
            authService.login($scope.username, $scope.password, function (result) {
                console.log(result);
                if (result.success === true) {
                    $rootScope.username = $scope.username;
                }
            });
        };

    }
})();