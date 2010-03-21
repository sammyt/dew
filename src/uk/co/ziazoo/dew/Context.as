package uk.co.ziazoo.dew
{
  import flash.display.DisplayObjectContainer;
  import flash.events.Event;
  
  import uk.co.ziazoo.injector.IInjector;
  import uk.co.ziazoo.injector.IScope;

  public class Context implements IContext
  {
    /**
     * @private
     */  
    protected var _container:DisplayObjectContainer;
    
    /**
     * scope used for views created in context
     */  
    protected var scope:ContextScope;
    
    /**
     * list of all mediated views
     */ 
    protected var maps:Array;
    
    public function Context()
    {
      maps = [];
    }
    
    /**
     * @inheritDoc
     */ 
    public function get container():DisplayObjectContainer
    {
      return _container;
    }
    
    /**
     * @inheritDoc
     */
    public function set container(value:DisplayObjectContainer):void
    {
      _container = value;
      if( value )
      {
        addContextListeners();
      }
    }
    
    protected function addContextListeners():void
    {
      container.addEventListener(Event.ADDED_TO_STAGE, onViewAdded, true);
      container.addEventListener(Event.REMOVED_FROM_STAGE, onViewRemoved, true);
    }
    
    protected function removeContextListeners():void
    {
      container.removeEventListener(Event.ADDED_TO_STAGE, onViewAdded);
      container.removeEventListener(Event.REMOVED_FROM_STAGE, onViewRemoved);
    }
    
    protected function onViewAdded(event:Event):void
    {
      scope.setTarget(event.target);
      
      for each( var map:ViewMap in maps )
      {
        if( event.target is map.view )
        {
          injectMediator(map.mediator);
          break;
        }
      }
    }
    
    protected function onViewRemoved(event:Event):void
    {
      
    }
    
    protected function injectMediator(mediatorType:Class):void
    {
      getInjector().inject(mediatorType);
    }
    
    /**
     * @inheritDoc
     */
    public function getScope():IScope
    {
      if(!scope)
      {
        scope = new ContextScope();
      }
      return scope;
    }

    /**
     * @inheritDoc
     */
    public function whenCreated(viewType:Class):ViewMap
    {
      var map:ViewMap = new ViewMap(viewType);
      maps.push(map);
      return map;
    }
    
    public function getInjector():IInjector
    {
      return null;
    }
  }
}