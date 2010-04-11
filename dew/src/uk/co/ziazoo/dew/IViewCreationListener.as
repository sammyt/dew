package uk.co.ziazoo.dew
{
  import flash.display.DisplayObjectContainer;
  
  public interface IViewCreationListener
  {
    function get container():DisplayObjectContainer;
    function set container(value:DisplayObjectContainer):void;
    
    function startListening():void;
    function stopListening():void;
    
    function addCreationObserver(observer:ICreationObserver):void;
  }
}