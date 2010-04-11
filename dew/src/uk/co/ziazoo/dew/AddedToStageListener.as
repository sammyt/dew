package uk.co.ziazoo.dew
{
  import flash.display.DisplayObjectContainer;
  import flash.events.Event;
  
  public class AddedToStageListener implements IViewCreationListener
  {
    private var observers:Array;
    private var _container:DisplayObjectContainer;
    
  	public function AddedToStageListener()
  	{
  	  observers = [];
  	}
  	
  	public function get container():DisplayObjectContainer
  	{
  	  return _container;
  	}
  	
    public function set container(value:DisplayObjectContainer):void
    {
      _container = value;
    }
    
    public function startListening():void
    {
      container.addEventListener(Event.ADDED_TO_STAGE, onViewAdded, true);
      container.addEventListener(Event.REMOVED_FROM_STAGE, onViewRemoved, true);
    }
    
    public function stopListening():void
    {
      container.removeEventListener(Event.ADDED_TO_STAGE, onViewAdded);
      container.removeEventListener(Event.REMOVED_FROM_STAGE, onViewRemoved);
    }
    
    public function addCreationObserver(observer:ICreationObserver):void
    {
      observers.push(observer);
    }
    
    private function onViewAdded(event:Event):void
    {
    }
    
    private function onViewRemoved(event:Event):void
    { 
    }
  }
}

