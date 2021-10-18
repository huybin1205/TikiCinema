(function () {
    'use strict';

    angular
        .module('TikiCinemaSystem')
        .factory('movieTheaterService', movieTheaterService);

    movieTheaterService.$inject = ['$rootScope', '$http', '$state', '$localStorage', 'notifyService', 'jwtHelper'];
    function movieTheaterService($rootScope, $http, $state, $localStorage, notifyService, jwtHelper) {

        var service = {
            getListMovieTheatersByCinemaId: getListMovieTheatersByCinemaIdFn,
            getMovieTheatersById: getMovieTheatersByIdFn,
        };

        return service;

        ////////////////
        function getListMovieTheatersByCinemaIdFn(cinemaId, callback) {
            $http.get(`/api/movie-theater/getListMovieTheatersByCinemaId/${cinemaId}`)
                .then(function (response) {
                    callback({ success: true, data: response.data});
                }).catch((err) => {
                    callback({ success: false, message: err.data.message });
                    swal(err.data.message, "", "error");
                    notifyService.error(err.data.message, 'Thông báo');
                });
        }
        function getMovieTheatersByIdFn(movieTheaterId, callback) {
            $http.get(`/api/movie-theater/getMovieTheaterById/${movieTheaterId}`)
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