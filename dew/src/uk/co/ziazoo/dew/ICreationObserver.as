package uk.co.ziazoo.dew
{ 
  import flash.display.DisplayObject;

  public interface ICreationObserver
  {
    function onViewCreated(view:DisplayObject):void
  }
}