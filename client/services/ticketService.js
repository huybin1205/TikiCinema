(function () {
    'use strict';

    angular
        .module('TikiCinemaSystem')
        .factory('ticketService', ticketService);

    ticketService.$inject = ['$rootScope', '$http', '$state', '$localStorage', 'notifyService', 'jwtHelper'];
    function ticketService($rootScope, $http, $state, $localStorage, notifyService, jwtHelper) {

        var service = {
            insertTicket: insertTicketFn
        };

        return service;

        ////////////////
        function insertTicketFn(ticket,callback) {
            $http.post('/api/ticket/insertTicket',{ticket})
                .then(function (response) {
                    callback({ success: true, data: response.data});
                }).catch((err) => {
                    callback({ success: false, message: err.data.message });
                    swal("Đặt vé thất bại!", "", "error");
                });
        }
    }
})();