var _ = require('lodash');

module.exports = (io) => {
    io.on('connection', (socket) => {
        // console.log('a user connected: ' + socket.id);
        // socket.on('disconnect', function () {
        //     console.log(socket.name + ' has disconnected from the server.' + socket.id);
        // });
    });
}