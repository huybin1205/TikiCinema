(function () {
    'use strict';

    angular
        .module('TikiCinemaSystem')
        .factory('authService', authService);

    authService.$inject = ['$rootScope', '$http', '$state', '$localStorage', 'notifyService', 'jwtHelper'];
    function authService($rootScope, $http, $state, $localStorage, notifyService, jwtHelper) {

        var service = {
            login: loginFn,
            logout: logoutFn,
            regClient: regClientFn
        };

        return service;

        ////////////////
        function loginFn(username, password, callback) {
            $http.post('/api/auth/login', { username: username, password: password })
                .then(function (response) {
                    if (response.data.success) {
                        if (response.data.token) {
                            // store username and token in local storage to keep user logged in between page refreshes
                            // $localStorage.currentUser = { username: username, token: response.data.token };
                            $localStorage.currentUser = { token: response.data.token };

                            // add jwt token to auth header for all requests made by the $http service
                            // $http.defaults.headers.common.Authorization = 'Bearer ' + response.token;
                            $http.defaults.headers.common.Authorization = response.data.token;

                            // execute callback with true to indicate successful login
                            swal("Đăng nhập thành công!", "", "success");
                            callback(
                                {
                                    success: true,
                                }
                            );
                        } else {
                            swal(response.data.message, "", "error");
                            // notifyService.error(response.data.message, 'Thông báo');
                            // execute callback with false to indicate failed login
                            callback({ success: false });
                        }
                    } else {
                        swal(response.data.message, "", "error");
                        notifyService.error('', response.data.message);
                        // execute callback with false to indicate failed login
                        callback({ success: false });
                    }
                }).catch((err) => {
                    swal(err.data.message, "", "error");
                    notifyService.error(err.data.message, 'Thông báo');
                });
        }
        function logoutFn() {
            $http.post('/api/auth/logout')
                .then(function (response) {
                    // remove user from local storage and clear http auth header
                    $http.defaults.headers.common.Authorization = '';
                    delete $localStorage.currentUser;
                    // Redirect to login
                    $state.go('login');
                    swal("Đăng xuất thành công", "", "success");
                    callback({ success: true, message: response.data.message });
                }).catch((err) => {
                    console.log(err);
                    swal(err.data.message, "", "error");
                    notifyService.error(err.data.message, 'Thông báo');
                });
            $state.go('login');
        }
        // function logoutFn() {
        //     $http.defaults.headers.common.Authorization = '';
        //     delete $localStorage.currentUser;
        //     $state.go('login');
        // }
        function regClientFn(code) {
            return $localStorage.regClient = { code: code }
        }
    }
})();