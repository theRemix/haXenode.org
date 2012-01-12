import js.Lib;
import jQuery.JQuery;

class UserScript
{
  private static inline var POP_OUT_SPEED = 100;
  private static inline var STARTING_POP_TOP = 760;
  private static inline var POP_ANIMATION_DIST = 14;
  private static inline var NAV_SCROLL_SPEED = 350;
  private static inline var NAV_SCROLL_LIMIT = 134;
  
  private var what_is_pop: JQuery; // collection
  private var what_is_list_item: JQuery; // collection 

  public inline function new()
  { 
    // "what is x" pop up descriptions
    what_is_pop = new JQuery(".what_is_pop").css({opacity:0});
    what_is_list_item = new JQuery("#whatishaxe-left ul li a");
    
    new JQuery(function():Void{
      what_is_list_item.mouseenter(show_what_is).mouseleave(close_what_is);
    });
    
    
    // scrollTo links
    new JQuery("nav a.scrollinglink").click(function(event){
      var destination = new JQuery(event.currentTarget.hash).offset().top;
      new JQuery("html:not(:animated),body:not(:animated)").animate({ scrollTop: destination-20}, NAV_SCROLL_SPEED, function(){
        Lib.window.location.hash = event.currentTarget.hash;
      });
      event.preventDefault();
      return false;
    });
    
    // nav always visible
    new JQuery(Lib.window).scroll(function(event){ 
      var nav = new JQuery('#header-container');
      var scrolltop = event.currentTarget.scrollY;
      /*untyped( console.log(scrolltop) );*/
      var pos = nav.css('position');
      if (scrolltop > NAV_SCROLL_LIMIT && nav.css('position') != 'fixed'){ 
/*        untyped( console.log(pos) );*/
        nav.css({position: 'fixed', top: '-'+NAV_SCROLL_LIMIT+'px'}); 
      }else if(scrolltop < NAV_SCROLL_LIMIT && nav.css('position') != 'absolute'){
        nav.css({position: 'absolute', top: '0px'}); 
      }
      
    });
  }

  private inline function show_what_is( event:Event ):Event
  {
    /*trace( event.target.getAttribute("id") );*/
    
    var selector = event.target.getAttribute("id")+"_pop";
    new JQuery("#"+selector).css({opacity:1, top:STARTING_POP_TOP});
    
    // close any that may not have closed on mouseleave
    var tmp:JQuery;
    what_is_pop.each(function(idx, obj){
      if(obj.id != selector){
        tmp = new JQuery("#"+obj.id);
        if(Std.parseInt(tmp.css("opacity")) > 0){
          tmp.stop().animate({opacity:0, top:(STARTING_POP_TOP+POP_ANIMATION_DIST)+"px"}, POP_OUT_SPEED);
        }
      }
    });
    
    return event;
  }
  
  private inline function close_what_is( event:Event ):Event
  {
    var selector = "#"+event.target.getAttribute("id")+"_pop";
    new JQuery(selector).stop().animate({opacity:0, top:(STARTING_POP_TOP+POP_ANIMATION_DIST)+"px"}, POP_OUT_SPEED);
    return event;
  }
  
  
  public static function main()
  {
    var u = new UserScript();
  }
}