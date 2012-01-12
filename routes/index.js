
/*
 * GET home page.
 */

exports.index = function(req, res){
  res.render('index', { title: 'Haxenode.org', haxenode_version: 0.6, haxe_version: 2.08 });
};

exports.what = function(req, res){
  res.render('what', { layout: false });
};

exports.why = function(req, res){
  res.render('why', { layout: false });
};

exports.download = function(req, res){
  res.render('download', { layout: false });
};

exports.installation = function(req, res){
  res.render('installation', { layout: false });
};
