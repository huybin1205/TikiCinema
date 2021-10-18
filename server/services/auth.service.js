// auth.service.js
const DataTypes = require('sequelize');
var sequelize = require('../models/db');
var passport = require('passport');

 /**
     * Check login
     * @param {*string} username 
     * @param {*string} password 
     */
exports.checkLogin = (username, password) => {
    return sequelize.query(`EXEC CheckLogin @username= '${username}', @password = '${password}'`, { type: sequelize.QueryTypes.SELECT })
}

/**
     * Check user has login
     * @param {*int} id 
     */
  exports.checkUserHasLogin = (id) => {
    return sequelize.query(`EXEC CheckUserHasLogin @id= ${id}`, { type: sequelize.QueryTypes.SELECT })
}

/**
     * Logout
     * @param {*int} id 
     */
 exports.logout = (id) => {
    return sequelize.query(`EXEC Logout @id= ${id}`, { type: sequelize.QueryTypes.SELECT })
}


/**
 * authorize route
 */
exports.requireAuth = () => {
    return passport.authenticate('jwt', { session: false });
}

