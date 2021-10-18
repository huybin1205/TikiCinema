(function () {
    'use strict';

    angular
        .module('TikiCinemaSystem')
        .controller('seatCtrl', seatCtrl);

    seatCtrl.$inject = ['$scope', '$stateParams', '$rootScope', 'ticketService','movieTheaterService', 'kindOfSeatService', 'seatService', 'notifyService', '$state', 'blockUI'];
    function seatCtrl($scope, $stateParams, $rootScope, ticketService, movieTheaterService, kindOfSeatService, seatService, notifyService, $state, blockUI) {
        $scope.movieTheaterId = $stateParams.movieTheaterId;
        $scope.filmId = $stateParams.filmId;
        $scope.cinemaId = $stateParams.cinemaId;
        $scope.quantityBooked = 0;
        $scope.seats = [];
        $scope.kindOfSeats = [];
        $scope.quantity = 1;
        $scope.manhattan = 1;
        $scope.seatsBooked = [];
        $scope.listChange = [];

        ////////////////
        initController();
        function initController() {
            getListSeatsByMovieTheaterId($scope.movieTheaterId);
            getListKindOfSeats();
            getMovieTheatersByIdFn($scope.movieTheaterId);
        }
        function getListSeatsByMovieTheaterId(movieTheaterId) {
            seatService.getListSeatsByMovieTheaterId(movieTheaterId, function (result) {
                $scope.seats = result.data;
                $scope.seats.forEach((seat)=>{
                    if(seat.Status == 1)
                        $scope.seatsBooked.push(seat);
                });
            });
        }
        function getListKindOfSeats() {
            kindOfSeatService.getListKindOfSeats(function (result) {
                $scope.kindOfSeats = result.data;
                
            });
        }
        async function getMovieTheatersByIdFn(movieTheaterId) {
            movieTheaterService.getMovieTheatersById(movieTheaterId, await function (result) {
                $scope.movieTheaterSeleted = result.data[0];
                if ($scope.movieTheaterSeleted) {
                    $scope.horizontalSeats = initArray($scope.movieTheaterSeleted ? $scope.movieTheaterSeleted.HorizontalSeats : 0);
                    $scope.verticalSeats = initArray($scope.movieTheaterSeleted ? $scope.movieTheaterSeleted.VerticalSeats : 0);
                }
            });
        }
        $scope.getStatusSeat = function (horizontalRow, verticalRow) {
            var status = -1;
            if ($scope.seats) {
                var seat = $scope.seats.filter((seat) => {
                    return seat.HorizontalSeatRow == horizontalRow && seat.VerticalSeatRow == verticalRow && !seat.Deleted;
                });
                if (seat[0])
                    status = seat[0].Status;
            }
            return status;
        }
        $scope.getSeat = function (horizontalRow, verticalRow) {
            if ($scope.seats) {
                var seat = $scope.seats.filter((seat) => {
                    return seat.HorizontalSeatRow == horizontalRow && seat.VerticalSeatRow == verticalRow && !seat.Deleted;
                });
                if (seat[0])
                    return seat[0];
            }
        }
        $scope.addSeat = function (seat) {
            if (seat) {
                if ((seat.Status === 0 || seat.Stutus === 3) && !seat.Deleted) {
                    seat.Status = 2;
                } else if (seat.Status == 2 && !seat.Deleted) {
                    seat.Status = 0;
                }
            }
            $scope.listChange = [];
            $scope.quantityBooked = 0;
            $scope.seats.forEach((seat)=>{
                if(seat.Status === 2 || seat.Status === 3){
                    $scope.listChange.push(seat);
                    $scope.quantityBooked += seat.Price;
                }
            });
        }
        $scope.quantitySuggestion = function () {
            quantitySuggestionFn();
        }
        $scope.book = function(){
            $scope.listChange = [];
            $scope.quantityBooked = 0;
            var listId = '';
            $scope.seats.forEach((seat)=>{
                if(seat.Status === 3 || seat.Status === 2){
                    listId += seat.SeatID + '_';
                    $scope.listChange.push(seat);
                    $scope.quantityBooked += seat.Price;
                }
            });

            if($scope.listChange.length < 1){
                swal("Chưa chọn vé", "", "warning");
                return;
            }


            var ticket = {};
            ticket.Film_Id = $scope.filmId;
            ticket.Cinema_Id = $scope.cinemaId;
            ticket.GroupTicket = $scope.seats.filter((seat)=>{return seat.Status == 2}).length > 1;
            ticket.ListId = listId.substr(0, listId.length - 1);
            ticketService.insertTicket(ticket,function(result){
                $scope.seats.forEach((seat)=>{
                    if(seat.Status === 3 || seat.Status === 2){
                        listId += seat.SeatID + '_';
                        seat.Status = 1;
                    }
                });
                swal("Đặt vé thành công!", "", "success");
            });
        }
        function quantitySuggestionFn(){
            $scope.listChange.forEach((seat) => {
                seat.Status = 0;
            });
            $scope.listChange = [];
            $scope.quantityBooked = 0;
            var rowRandom = Math.floor(Math.random() * $scope.movieTheaterSeleted.HorizontalSeats);
            var colRandom = Math.floor(Math.random() * $scope.movieTheaterSeleted.VerticalSeats);
            var row = 0, col = 0;
            var matrix = fact($scope.quantity);
            var seat = $scope.getSeat(rowRandom, colRandom);
            if (seat) {
                if (seat.Status == 0) {
                    if (matrix.length == 1) {
                        row = Math.round(matrix[0] / 2);
                        col = matrix[0] - row;
                        console.log(row,col);
                        if (row > $scope.movieTheaterSeleted.HorizontalSeats ||
                            col > $scope.movieTheaterSeleted.VerticalSeats
                        ) {
                            quantitySuggestionTwo();
                            return;
                        }

                        proccessSuggestionOne(row, $scope.movieTheaterSeleted.HorizontalSeats, rowRandom, colRandom, $scope.listChange);
                        proccessSuggestionOne(col, $scope.movieTheaterSeleted.VerticalSeats, rowRandom + 1, colRandom, $scope.listChange);

                    } else if (matrix.length == 2) {
                        col = matrix[1];
                        row = matrix[0];
                        console.log(row,col);

                        if (row > $scope.movieTheaterSeleted.HorizontalSeats ||
                            col > $scope.movieTheaterSeleted.VerticalSeats
                        ) {
                            quantitySuggestionTwo();
                            return;
                        }
                        try {
                            proccessSuggestionTwo(row, col, rowRandom, colRandom, $scope.listChange);
                        } catch (err) {
                            proccessSuggestionTwo(row, col, rowRandom, colRandom, $scope.listChange);
                        }
                    } else {
                        console.log(row,col);
                        quantitySuggestionTwo();
                    }
                }
            }
            if(!isManhattanOK()){
                quantitySuggestionFn();
            }
        }
        function quantitySuggestionTwo() {
            $scope.listChange.forEach((seat) => {
                seat.Status = 0;
            });
            $scope.listChange = [];
            $scope.quantityBooked = 0;
            var flag = 0;
            for (let i = 0; i < $scope.movieTheaterSeleted.HorizontalSeats; i++) {
                for (let j = 0; j < $scope.movieTheaterSeleted.VerticalSeats; j++) {
                    var seat = $scope.getSeat(i, j);
                    if (seat) {
                        if (seat.Status == 0) {
                            seat.Status = 3;
                            $scope.listChange.push(seat);
                            $scope.quantityBooked += seat.Price;
                            flag++;
                            if (flag == $scope.quantity) {
                                return;
                            }
                        }
                    }
                }
            }
        }
        function proccessSuggestionOne(row, limit, rowRandom, colRandom, listChange) {
            listChange.forEach((seat) => {
                seat.Status = 0;
            });
            listChange = [];
            $scope.quantityBooked = 0;
            for (let i = 0; i < row; i++) {
                try {
                    if ($scope.getSeat(rowRandom, colRandom + i).Status === 0 || $scope.getSeat(rowRandom, colRandom + i).Status === 3) {
                        $scope.getSeat(rowRandom, colRandom + i).Status = 3;
                        console.log($scope.getSeat(rowRandom , colRandom + i));
                        listChange.push($scope.getSeat(rowRandom, colRandom + i));
                        $scope.quantityBooked += $scope.getSeat(rowRandom, colRandom + i).Price;
                    }
                } catch (error) {
                    colRandom -= 1;
                    if (colRandom < 1)
                        colRandom = 0;
                    i = 0;

                    proccessSuggestionOne(row, limit, rowRandom, colRandom, listChange);
                    break;
                }
            }
        }
        function proccessSuggestionTwo(row, col, rowRandom, colRandom, listChange) {
            $scope.listChange.forEach((seat) => {
                seat.Status = 0;
            });
            $scope.listChange = [];
            $scope.quantityBooked = 0;
            for (let i = 0; i < row; i++) {
                for (let j = 0; j < col; j++) {
                    if (rowRandom + i >= $scope.movieTheaterSeleted.HorizontalSeats) {
                        rowRandom -= 1;
                        if (rowRandom < 1)
                            rowRandom = 0;
                        i = j = -1;
                        proccessSuggestionTwo(row, col, rowRandom, colRandom, $scope.listChange);
                        break;
                    }
                    if (colRandom + j >= $scope.movieTheaterSeleted.VerticalSeats) {
                        colRandom -= 1;
                        if (colRandom < 1)
                            colRandom = 0;
                        i = j = -1;
                        proccessSuggestionTwo(row, col, rowRandom, colRandom, $scope.listChange);
                        break;
                    }
                    if ($scope.getSeat(rowRandom + i, colRandom + j).Status === 0 || $scope.getSeat(rowRandom + i, colRandom + j).Status === 3) {
                        $scope.getSeat(rowRandom + i, colRandom + j).Status = 3;
                        console.log($scope.getSeat(rowRandom + i, colRandom + j));
                        $scope.listChange.push($scope.getSeat(rowRandom + i, colRandom + j));
                        $scope.quantityBooked += $scope.getSeat(rowRandom +i, colRandom + j).Price;
                    }
                }
            }
        }
        function isManhattanOK(){
            $scope.listChange = $scope.seats.filter((seat)=>{return seat.Status == 3});
            $scope.listChange.forEach((seat)=>{
                var x = seat.HorizontalSeatRow;
                var y = seat.VerticalSeatRow
                $scope.seatsBooked.forEach((seatBooked)=>{
                    var z = seatBooked.HorizontalSeatRow;
                    var t = seatBooked.VerticalSeatRow
                    if(calculateManhattan(x,y,z,t) < $scope.manhattan){
                        return false;
                    }
                });
            });
            return true;
        }
        function initArray(number) {
            var array = [];
            for (let i = 0; i < number; i++) {
                array.push(i);
            }
            return array;
        }
        function fact(n) {
            var facts = [];
            if (n < 4) {
                facts.push(1);
                facts.push(n);
                return facts;
            }
            let dem;
            for (let i = 2; i <= n; i++) {
                dem = 0;
                while (n % i == 0) {
                    ++dem;
                    n /= i;
                }
                if (dem) {
                    if (dem > 1) {
                        facts.push(Math.pow(i, dem));
                    }
                    else {
                        facts.push(i);
                    }
                }
            }
            return facts;
        }
        function calculateManhattan(x1, y1, x2, y2) {
            return Math.abs(x1 - x2) + Math.abs(y1 - y2);
        }
    }
})();