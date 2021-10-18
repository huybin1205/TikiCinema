// ticket.route.js
var express = require('express');
var router = express.Router();
var ticketService = require('../services/ticket.service');
var jwt = require('jsonwebtoken');
var passport = require('passport');
var config = require('../config/main');


// Bring in defined Passport Strategy
require('../config/passport')(passport);

/*
    insert ticket
*/
router.post('/insertTicket', (req, res, next) => {
    var ticket = req.body.ticket;
    var token = req.header('authorization').split(' ')[1];
    ticket.User_Id = jwt.verify(token, config.secret).result;
    ticketService.insertTicket(ticket).then(function (response) {
        res.status(200).json({status: true, message:'Đặt vé thành công',data:response});
    }).catch((err) => {
        res.status(500).json({ status: false, errors: err });
    });;
});

module.exports = router;