(function () {
    'use strict';

    angular
        .module('TikiCinemaSystem')
        .factory('cinemaService', cinemaService);

    cinemaService.$inject = ['$rootScope', '$http', '$state', '$localStorage', 'notifyService', 'jwtHelper'];
    function cinemaService($rootScope, $http, $state, $localStorage, notifyService, jwtHelper) {

        var service = {
            getListCinemas: getListCinemasFn
        };

        return service;

        ////////////////
        function getListCinemasFn(callback) {
            $http.get('/api/cinema/getListCinemas')
                .then(function (response) {
                    callback({ success: true, data: response.data});
                }).catch((err) => {
                    callback({ success: false, message: err.data.message });
                    notifyService.error(err.data.message, 'Thông báo');
                });
        }
    }
})();