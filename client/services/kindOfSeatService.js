(function () {
    'use strict';

    angular
        .module('TikiCinemaSystem')
        .factory('kindOfSeatService', kindOfSeatService);

    kindOfSeatService.$inject = ['$rootScope', '$http', '$state', '$localStorage', 'notifyService', 'jwtHelper'];
    function kindOfSeatService($rootScope, $http, $state, $localStorage, notifyService, jwtHelper) {

        var service = {
            getListKindOfSeats: getListKindOfSeatsFn
        };

        return service;

        ////////////////
        function getListKindOfSeatsFn(callback) {
            $http.get(`/api/kind-of-seat/getListKindOfSeats`)
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