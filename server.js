var app = require('express')();
var server = require('http').Server(app);
var io = require('socket.io')(server);
var redis = require('redis');
var users = [];
server.listen(8890);
io.on('connection', function (socket) {

    socket.join('chat room');

    socket.on('chat message', function(msg){
        io.emit('chat message', msg);
    });



    socket.on('online', function(user){
        socket.user = 'plc-'+user+'u';
        if (users.indexOf('plc-'+user+'u') === -1){
           users.push('plc-'+user+'u');
        }
        io.emit('online', JSON.stringify(users));
    });


    socket.on('disconnect', function () {
        delete users[users.indexOf(socket.user)];
        io.emit('online', JSON.stringify(users));
    });

});