// auth.route.js
var express = require('express');
var router = express.Router();
var _ = require('lodash');
var jwt = require('jsonwebtoken');
var config = require('../config/main');
var authService = require('../services/auth.service');
var passport = require('passport');
var md5 = require('md5');

// Set up middleware
var requireAuth = authService.requireAuth();

// Bring in defined Passport Strategy
require('../config/passport')(passport);

// router.get('/loggedin', requireAuth, (req, res, next) => {
//     // console.log("Route auth: " + req.user.ShiftSubjectId + req.user.QuestionSheetId + " StudentId: " + req.user.StudentId);
//     authService.loginSuccess(req.user.ShiftSubjectId, req.user.QuestionSheetId, req.user.StudentId)
//         .then((data) => {
//             res.status(200).send(req.user);
//         })
//         .catch((err) => {
//             res.sendStatus(404);
//         });
//     // req.on('error', function(e){
//     //     console.log('client closed unexpectedly');
//     // })
//     // req.on('end', function(){
//     //     console.log('client ended normally');
//     // })
// });

router.post('/login', (req, res, next) => {
    // Receive username and password from view client input
    var username = req.body.username;
    var password = md5(req.body.password);
    // Check equal between username and password
    // Case: username equal password
    // Check exist user with username
    authService.checkLogin(username, password)
        .then((data) => {
            if (_.isEmpty(data[0])) {
                // Case: Not exist user
                res.status(404).json({message:'Tên đăng nhập hoặc mật khẩu không đúng'});
            } else {
                // Case: Exist user
                authService.checkUserHasLogin(data[0].Id)
                    .then((data) => {
                        if (!data[0].Status) {
                            res.status(200).json({success: true, message: 'Tài khoản này đang được đăng nhập'});
                        } else {
                            // Return token to client
                            // data: username
                            const token = jwt.sign({ data: data[0].Id }, config.secret, {
                                expiresIn: 86400 // 24h in seconds,
                            });
                            res.status(200).json({ success: true, token: 'JWT ' + token});
                        }
                });
            }
        }).catch((err)=>{
            res.status(500).json({ success:false, message: err})
        });
});

// router.post('/logout', requireAuth, (req, res, next) => {
//     var shiftSubjectId = req.user.ShiftSubjectId;
//     var questionSheetId = req.user.QuestionSheetId;
//     var studentId = req.user.StudentId;
//     //console.log(studentId);
//     authService.logout(shiftSubjectId, questionSheetId, studentId)
//         .then(function (response) {
//             req.logOut();
//             res.status(200).send(true);
//             localStorage.removeItem("ngStorage-currentUser");
//         })
//         .catch((err) => {
//             res.status(404).send(false);
//             return;
//         });
// });

module.exports = router;