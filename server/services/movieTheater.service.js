// movieTheater.service.js
const DataTypes = require('sequelize');
var sequelize = require('../models/db');
var passport = require('passport');

/**
    * Get list MovieTheater
**/
exports.getListMovieTheatersByCinemaId = (cinemaId) => {
    return sequelize.query(`EXEC GetListMovieTheatersByCinemaId @cinemaId= ${cinemaId}`, { type: sequelize.QueryTypes.SELECT })
}
