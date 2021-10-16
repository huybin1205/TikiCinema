// cinema.service.js
const DataTypes = require('sequelize');
var sequelize = require('../models/db');
var passport = require('passport');

/**
    * Get list Seats by MovieTheaterId
**/
exports.getListSeatsByMovieTheaterId = (movieTheaterId) => {
    return sequelize.query(`EXEC GetListSeatsByMovieTheaterId @movieTheaterId=${movieTheaterId}`, { type: sequelize.QueryTypes.SELECT })
}
