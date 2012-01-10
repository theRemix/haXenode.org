
/*
 * GET home page.
 */

exports.index = function(req, res){
  res.render('index', { title: 'Haxenode.org', haxenode_version: 0.6 })
};