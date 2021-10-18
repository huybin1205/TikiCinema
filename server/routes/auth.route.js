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
                    .then((result) => {
                        if (!result[0].Status) {
                            res.status(200).json({success: true, message: 'Tài khoản này đang được đăng nhập'});
                        } else {
                            // Return token to client
                            // result: username
                            const token = jwt.sign({ result: data[0].Id }, config.secret, {
                                expiresIn: 86400 // 24h in seconds,
                            });
                            res.status(200).json({ success: true, token: 'JWT ' + token,Id: data[0].Id});
                        }
                });
            }
        }).catch((err)=>{
            res.status(500).json({ success:false, message: err})
        });
});

router.post('/logout', (req, res, next) => {
    var token = req.header('authorization').split(' ')[1];
    userId = jwt.verify(token, config.secret).result;
    authService.logout(userId)
        .then(function (response) {
            res.status(200).json({status: true, message: 'Đẵng xuất thành công'});
        })
        .catch((err) => {
            res.status(404).json({status:false,message:'Có lỗi',error: err});
            return;
        });
});

module.exports = router;