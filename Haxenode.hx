import js.Node;
class Haxenode
{

  private static inline var ENV_DEVELOPMENT = 'development'; // app.settings.env
  private static inline var ENV_PRODUCTION = 'production'; 
  private static inline var SERVER_LISTEN = 3117; // app.address().port

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
      app.use(Reflect.callMethod(express,Reflect.field(express,"static"), [(Node.__dirname + '/public')])); // Reflection for reserved word 'static'
    });

    Reflect.callMethod(app,app.configure,[ENV_DEVELOPMENT, function(){ // Reflection for ...rest params of app.configure
        app.use(Reflect.callMethod(express,Reflect.field(express,"static"), [(Node.__dirname + '/public')]));
        app.use(express.errorHandler({ dumpExceptions: true, showStack: true }));
    }]);
    Reflect.callMethod(app,app.configure,[ENV_PRODUCTION, function(){
        app.use(Reflect.callMethod(express,Reflect.field(express,"static"), [Node.__dirname + '/public', { maxAge: 31557600000 }]));
        app.use(express.errorHandler(null));
    }]);

    // Routes

    app.get('/', routes.index);
    
    app.listen(SERVER_LISTEN);
    
    Node.console.log("Express server listening on port %d in %s mode", app.address().port, app.settings.env);
  }
  
}