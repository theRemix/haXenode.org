# haxenode.org

this is actually two haxe apps in one project.

## Haxenode.hx

the first is the haxenode site, main file is **Haxenode.hx** which basically just loads the express framework and hardly nothing else at all. the site is static, i just wanted to show how one would load a js libs using haxe. there is a branch called **ajaxloaded** which has a bit more interaction. in **ajaxloaded**, the page starts off almost completely empty, except for the node.js vs. haxenode example at the top, and then each click of the first 3 nav links will request a different page and load it in to it's final place. **Haxenode.hx** compiles to **haxenode.js** which is the main file that is run in the server: **env NODE_ENV=production node haxenode.js**

npm dependencies: [ express, jade ]  
haxelib dependencies: [ nodejs ]

## UserScript.hx

the second app is the front-end javascript for user interaction in browser. the main file for this is **UserScript.hx** which is compiled to public/javascripts/script.js and then included in the rendered html.

haxelib dependencies: [ jQueryExtern ]