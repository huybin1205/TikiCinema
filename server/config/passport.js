// passport.js
var _ = require('lodash');
var JwtStrategy = require('passport-jwt').Strategy;
var ExtractJwt = require('passport-jwt').ExtractJwt;
var config = require('./main');


// Setup work and export for the JWT passport strategy
module.exports = function (passport) {
  var opts = {
    jwtFromRequest: ExtractJwt.fromAuthHeader(),
    secretOrKey: config.secret
  };
  passport.use(new JwtStrategy(opts, function (jwt_payload, done) {
    var studentCode = jwt_payload.code;
    var iat = parseInt(jwt_payload.iat);
    var exp = parseInt(jwt_payload.exp);
    if (!(exp - iat) > 0) {
      console.log('token was expired');
    } else {
      console.log('has login');
    }
  }));
};