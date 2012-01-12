
/*
 * GET home page.
 */

exports.index = function(req, res){
  res.render('index', { title: 'Haxenode.org', haxenode_version: 0.6, haxe_version: 2.08 })
};