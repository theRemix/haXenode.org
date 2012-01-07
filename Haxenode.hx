import js.Node;
class Haxenode
{

  public static function main()
  {
    var express = Node.require('express');
    var routes = Node.require('./routes');

    var app = Node.module.exports = express.createServer();

    app.configure(function(){
      app.set('views', Node.__dirname + '/views');
      app.set('view engine', 'jade');
      app.use(express.bodyParser());
      app.use(express.methodOverride());
      app.use(app.router);
      app.use(untyped __js__("express.static(__dirname + '/public')"));
    });
    
    untyped __js__(
      "app.configure('development', function(){
          app.use(express.static(__dirname + '/public'));
          app.use(express.errorHandler({ dumpExceptions: true, showStack: true }));
      });

      app.configure('production', function(){
        var oneYear = 31557600000;
        app.use(express.static(__dirname + '/public', { maxAge: oneYear }));
        app.use(express.errorHandler());
      });"
    );

    // Routes

    app.get('/', routes.index);
    
    app.listen(3117);
    
    Node.console.log("Express server listening on port %d in %s mode", app.address().port, app.settings.env);
  }
}