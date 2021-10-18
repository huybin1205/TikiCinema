(function () {
    'use strict';

    angular
        .module('TikiCinemaSystem')
        .factory('filmService', filmService);

    filmService.$inject = ['$rootScope', '$http', '$state', '$localStorage', 'notifyService', 'jwtHelper'];
    function filmService($rootScope, $http, $state, $localStorage, notifyService, jwtHelper) {

        var service = {
            getListFilms: getListFilmsFn
        };

        return service;

        ////////////////
        function getListFilmsFn(callback) {
            $http.get('/api/film/getListFilms')
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