var express = require('express');
var reactViews = require('express-react-views');

var app = express();
var port = process.env.PORT || 8080;

app.disable("x-powered-by");
app.set('view engine', 'js');

app.engine('js', reactViews.createEngine({
  jsx: {
    extension: '.js'
  }
}));

app.use(express.static(__dirname + '/public'));

app.get('*', function (req, res) {
  var initialState = {

  };
  res.render('index', { data: initialState });
});

app.listen(port, function () {
  console.log('Listening on port ' + port);
});
