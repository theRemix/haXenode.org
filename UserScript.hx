import js.Lib;
import jQuery.JQuery;

class UserScript
{
  private static inline var POP_SHOW_SPEED = 100;
  private static inline var STARTING_POP_TOP = 760;
  private static inline var POP_ANIMATION_DIST = 14;

  private var what_is_pop: JQuery; // collection
  private var what_is_list_item: JQuery; // collection 

  public inline function new()
  { 
    what_is_pop = new JQuery(".what_is_pop").css({opacity:0});
    what_is_list_item = new JQuery("#whatishaxe-left ul li");
    
    new JQuery(function():Void{
      what_is_list_item.mouseenter(show_what_is).mouseleave(close_what_is);
    });
  }

  private inline function show_what_is( event:Event ):Event
  {
    /*trace( event.target.getAttribute("id") );*/
    what_is_pop.stop().animate({opacity:0, top:(STARTING_POP_TOP+POP_ANIMATION_DIST)+"px"},POP_SHOW_SPEED);
    new JQuery("#"+event.target.getAttribute("id")+"_pop").stop().css(
        {top:(STARTING_POP_TOP-POP_ANIMATION_DIST)+"px"}
      ).animate(
        {opacity:1, top:(STARTING_POP_TOP)+"px"},POP_SHOW_SPEED
      );
    return event;
  }
  
  private inline function close_what_is( event:Event ):Event
  {
    new JQuery("#"+event.target.getAttribute("id")+"_pop").stop().animate(
      {opacity:0, top:(STARTING_POP_TOP+POP_ANIMATION_DIST)+"px"},POP_SHOW_SPEED
    );
    return event;
  }
  
  
  public static function main()
  {
    var u = new UserScript();
  }
}