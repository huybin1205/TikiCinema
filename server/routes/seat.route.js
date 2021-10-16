// home.route.js
var express = require('express');
var router = express.Router();
var seatService = require('../services/seat.service');
var passport = require('passport');

// Bring in defined Passport Strategy
require('../config/passport')(passport);

/*
    Get list Seats by Movie theater
*/
router.get('/getListSeatsByMovieTheaterId/:movieTheaterId', (req, res, next) => {
    var movieTheaterId = req.params.movieTheaterId;
    seatService.getListSeatsByMovieTheaterId(movieTheaterId).then(function(response) {
        res.status(200).json(response);
    }).catch((err) => {
        res.status(500).json({status:false, message: 'Có lỗi xảy ra khi lấy danh sách ghế ngồi',errors:err});
    });;
});

module.exports = router;