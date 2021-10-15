(function () {
    'use strict';

    angular
        .module('ExaminationSystem')
        .factory('authService', authService);

    authService.$inject = ['$rootScope', '$http', '$state', '$localStorage', 'notifyService', 'jwtHelper'];
    function authService($rootScope, $http, $state, $localStorage, notifyService, jwtHelper) {

        var service = {
            login: loginFn,
            // loggedIn: loggedInFn,
            logout: logoutFn,
            // signOut: signOutFn,
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
                            notifyService.success('Đăng nhập thành công');
                            callback(
                                {
                                    success: true,
                                }
                            );
                        } else {
                            notifyService.error(response.data.message, 'Thông báo');
                            // execute callback with false to indicate failed login
                            callback({ success: false });
                        }
                    } else {
                        notifyService.error('', response.data.message);
                        // execute callback with false to indicate failed login
                        callback({ success: false });
                    }
                }).catch((err) => {
                    notifyService.error(err.data.message, 'Thông báo');
                });
        }
        // function loggedInFn(callback) {
        //     // Check existing token or token is expired
        //     if (jwtHelper.isTokenExpired($localStorage.currentUser.token) || !$localStorage.currentUser || $localStorage.currentUser == null) {
        //         /* Case: Token isn't exist
        //         => Logout */
        //         logoutFn();
        //     } else {
        //         // Case: Token is exist
        //         $http.get('/api/auth/loggedin')
        //             .then(function (response) {
        //                 if (response.status == 500) {
        //                     logoutFn();
        //                 } else {
        //                     if (response.data) {
        //                         // Result: Infor shift and student
        //                         $rootScope.info = response.data;
        //                         callback(true);
        //                     } else {
        //                         callback(false);
        //                     }
        //                 }
        //             }).catch((err) => {
        //                 if (err.status == 500) {
        //                     notifyService.error('', 'Hệ thống đang gặp trục trặc');
        //                     logoutFn();
        //                 }
        //             });
        //     }
        // }
        function logoutFn() {
            // remove user from local storage and clear http auth header
            $http.defaults.headers.common.Authorization = '';
            delete $localStorage.currentUser;
            // Redirect to login
            $state.go('login');
        }
        // function signOutFn(shiftSubjectId, questionSheetId, studentId, callback) {
        //     return $http.post('/api/auth/logout', {
        //         shiftSubjectId: shiftSubjectId,
        //         questionSheetId: questionSheetId,
        //         studentId: studentId
        //     }).then(function (response) {
        //         if (response.data == true) {
        //             callback(true);
        //             notifyService.success('Đăng xuất thành công', 'Thông báo');
        //         } else {
        //             callback(false);
        //         }
        //     }).catch(function (error) {
        //         console.error(error);
        //     });
        // }
        function regClientFn(code) {
            return $localStorage.regClient = { code: code }
        }
    }
})();