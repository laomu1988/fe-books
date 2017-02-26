var express = require('express');
var app = new express();

app.use(express.static(__dirname + '/books'));
app.use('/fe-books/', express.static(__dirname + '/books/'));

app.listen(4000, function(err) {
    if (!err) {
        console.log('Start Server At   http://localhost:4000/');
    } else {
        console.log('Err:', err);
    }
});
