(function () {
    'use strict';

    angular
        .module('TikiCinemaSystem')
        .factory('seatService', seatService);

    seatService.$inject = ['$rootScope', '$http', '$state', '$localStorage', 'notifyService', 'jwtHelper'];
    function seatService($rootScope, $http, $state, $localStorage, notifyService, jwtHelper) {

        var service = {
            getListSeatsByMovieTheaterId: getListSeatsByMovieTheaterIdFn
        };

        return service;

        ////////////////
        function getListSeatsByMovieTheaterIdFn(movieTheaterId, callback) {
            $http.get(`/api/seat/getListSeatsByMovieTheaterId/${movieTheaterId}`)
                .then(function (response) {
                    callback({ success: true, data: response.data});
                }).catch((err) => {
                    callback({ success: false, message: err.data.message });
                    notifyService.error(err.data.message, 'Thông báo');
                });
        }
    }
})();