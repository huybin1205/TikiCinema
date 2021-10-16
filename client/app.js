(function () {
    'use strict';

    angular
        .module('TikiCinemaSystem', ['ui.router', 'ngMessages', 'ngStorage', 'ngAnimate', 'ngSanitize', 'blockUI', 'ui.bootstrap', 'toastr', 'angular-jwt', 'hl.sticky', 'angular-loading-bar', 'timer', 'ngAudio'])
        .config(config)
        .run(run);

    function config($stateProvider, $urlRouterProvider, toastrConfig) {
        // default route
        $urlRouterProvider.otherwise("/");

        // app routes
        $stateProvider
            .state('seat',{
                url: '/seat/:movieTheaterId',
                templateUrl: 'components/seat/seat.html',
                controller: 'seatCtrl'
            })
            .state('film',{
                url: '/film/:movieTheaterId',
                templateUrl: 'components/film/film.html',
                controller: 'filmCtrl'
            })
            .state('movie-theater',{
                url: '/movie-theater/:cinemaId',
                templateUrl: 'components/movie-theater/movie-theater.html',
                controller: 'movieTheaterCtrl'
            })
            .state('cinema',{
                url: '/cinema',
                templateUrl: 'components/cinema/cinema.html',
                controller: 'cinemaCtrl'
            })
            .state('login', {
                url: '/login',
                templateUrl: 'components/login/login.html',
                controller: 'loginCtrl'
            });

        angular.extend(toastrConfig, {
            autoDismiss: false,
            containerId: 'toast-container',
            maxOpened: 0,
            newestOnTop: true,
            positionClass: 'toast-bottom-right',
            preventDuplicates: false,
            preventOpenDuplicates: false,
            target: 'body'
        });
    }

    function run($rootScope, $http, $location, $localStorage) {
        // keep user logged in after page refresh
        if ($localStorage.currentUser) {
            // $http.defaults.headers.common.Authorization = 'JWT ' + $localStorage.currentUser.token;
            $http.defaults.headers.common.Authorization = $localStorage.currentUser.token;
        }

        // redirect to login page if not logged in and trying to access a restricted page
        $rootScope.$on('$locationChangeStart', function (event, next, current) {
            var publicPages = ['/login'];
            var restrictedPage = publicPages.indexOf($location.path()) === -1;
            if (restrictedPage && !$localStorage.currentUser) {
                $location.path('/login');
            }
        });
    }
})();