// movieTheater.route.js
var express = require('express');
var router = express.Router();
var movieTheaterService = require('../services/movieTheater.service');
var passport = require('passport');

// Bring in defined Passport Strategy
require('../config/passport')(passport);

/*
    Get list MovieTheaters by CinemaId
*/
router.get('/getListMovieTheatersByCinemaId/:cinemaId', (req, res, next) => {
    var cinemaId = req.params.cinemaId;
    movieTheaterService.getListMovieTheatersByCinemaId(cinemaId).then(function(response) {
        res.status(200).json(response);
    }).catch((err) => {
        res.status(500).json({status:false, message: 'Có lỗi xảy ra khi lấy danh sách rạp',errors:err});
    });;
});
/*
    Get MovieTheater by Id
*/
router.get('/getMovieTheaterById/:movieTheaterId', (req, res, next) => {
    var movieTheaterId = req.params.movieTheaterId;
    movieTheaterService.getMovieTheaterById(movieTheaterId).then(function(response) {
        res.status(200).json(response);
    }).catch((err) => {
        res.status(500).json({status:false, message: `Có lỗi xảy ra khi rạp số ${movieTheaterId}`,errors:err});
    });;
});

module.exports = router;