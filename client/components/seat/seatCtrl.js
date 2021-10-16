(function () {
    'use strict';

    angular
        .module('TikiCinemaSystem')
        .controller('seatCtrl', seatCtrl);

    seatCtrl.$inject = ['$scope', '$stateParams', '$rootScope', '$localStorage', 'kindOfSeatService', 'seatService', 'notifyService', '$state', 'blockUI'];
    function seatCtrl($scope, $stateParams, $rootScope, $localStorage, kindOfSeatService, seatService, notifyService, $state, blockUI) {
        $scope.movieTheaterId = 1;
        // $scope.movieTheaterId = $stateParams.movieTheaterId;
        $scope.seats = [];
        $scope.kindOfSeats = [];
        ////////////////
        initController();

        function initController() {
            if ($rootScope.movieTheaters){
                $scope.movieTheaterSeleted = $rootScope.movieTheaters.filter((movieTheater)=> {return movieTheater.Id = $scope.movieTheaterId})[0];
            }
            // console.log($scope.movieTheaterSeleted.HorizontalSeats);
            $scope.horizontalSeats = initArray($scope.movieTheaterSeleted ? $scope.movieTheaterSeleted.HorizontalSeats : 0);
            $scope.verticalSeats = initArray($scope.movieTheaterSeleted ? $scope.movieTheaterSeleted.VerticalSeats: 0);
            $scope.horizontalSeats = initArray(10);
            $scope.verticalSeats = initArray(10);
            getListSeatsByMovieTheaterId($scope.movieTheaterId);
            getListKindOfSeats();
        }

        function initArray(number){
            var array = [];
            for(let i=0;i<number; i++){
                array.push(i);
            }
            return array;
        }
        function getListSeatsByMovieTheaterId(movieTheaterId) {
            seatService.getListSeatsByMovieTheaterId(movieTheaterId, function (result) {
                $scope.seats = result.data;
            });
        }
        function getListKindOfSeats() {
            kindOfSeatService.getListKindOfSeats(function (result) {
                $scope.kindOfSeats = result.data;
            });
        }
        $scope.getStatusSeat = function(horizontalRow, verticalRow){
            var status = -1;
            if($scope.seats){
                var seat = $scope.seats.filter((seat)=>{
                    return seat.HorizontalSeatRow == horizontalRow && seat.VerticalSeatRow == verticalRow && !seat.Deleted;
                });
                if(seat[0])
                    status = seat[0].Status;
            }
            return status;
        }
        $scope.getSeat = function(horizontalRow, verticalRow){
            if($scope.seats){
                var seat = $scope.seats.filter((seat)=>{
                    return seat.HorizontalSeatRow == horizontalRow && seat.VerticalSeatRow == verticalRow && !seat.Deleted;
                });
                if(seat[0])
                    return seat[0];
            }
        }
        $scope.addSeat = function(seat){
            if(seat){
                if(seat.Status == 0 && !seat.Deleted){
                    seat.Status = 2;
                }else if(seat.Status == 2 && !seat.Deleted){
                    seat.Status = 0;
                }
            }
        }
    }
})();