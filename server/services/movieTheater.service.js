// movieTheater.service.js
const DataTypes = require('sequelize');
var sequelize = require('../models/db');

/**
    * Get list MovieTheater
**/
exports.getListMovieTheatersByCinemaId = (cinemaId) => {
    return sequelize.query(`EXEC GetListMovieTheatersByCinemaId @cinemaId= ${cinemaId}`, { type: sequelize.QueryTypes.SELECT })
}

/**
    * Get MovieTheater by Id
**/
exports.getMovieTheaterById = (movieTheaterId) => {
    return sequelize.query(`EXEC GetMovieTheaterById @movieTheaterId= ${movieTheaterId}`, { type: sequelize.QueryTypes.SELECT })
}
