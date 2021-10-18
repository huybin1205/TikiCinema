(function () {
    'use strict';

    angular
        .module('TikiCinemaSystem')
        .factory('homeService', homeService);

    homeService.$inject = ['$rootScope', '$http', '$state', '$localStorage', 'notifyService', 'jwtHelper'];
    function homeService($rootScope, $http, $state, $localStorage, notifyService, jwtHelper) {

        var service = {
            getListCinemar: getListCinemarFn
        };

        return service;

        ////////////////
        function getListCinemarFn(callback) {
            $http.get('/api/home/getListCinemar')
                .then(function (response) {
                    callback({ success: true, data: response.data});
                }).catch((err) => {
                    callback({ success: false, message: err.data.message });
                    swal(err.data.message, "", "error");
                    notifyService.error(err.data.message, 'Thông báo');
                });
        }
    }
})();