// auth.service.js
const DataTypes = require('sequelize');
var sequelize = require('../models/db');
var passport = require('passport');

/**
    * Get list cinema
**/
exports.getListCinemar = () => {
    return sequelize.query(`EXEC GetListCinemar`, { type: sequelize.QueryTypes.SELECT })
}
