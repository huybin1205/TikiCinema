(function () {
    'use strict';

    angular
        .module('TikiCinemaSystem')
        .factory('seatConstants', seatConstants);

    // seatConstants.$inject = ['$rootScope', '$http', '$state', '$localStorage', 'notifyService', 'jwtHelper'];
    function seatConstants() {

        var service = {
            getStatus: getStatusFn
        };

        return service;

        ////////////////
        function getStatusFn(status) {
            
        }
    }
})();