package uk.co.ziazoo.dew
{
  import flash.display.DisplayObjectContainer;
  import flash.events.Event;
  
  import uk.co.ziazoo.command.CommandMap;
  import uk.co.ziazoo.command.ICommandMap;
  import uk.co.ziazoo.injector.IInjector;
  import uk.co.ziazoo.injector.IScope;
  import uk.co.ziazoo.injector.impl.Injector;
  import uk.co.ziazoo.notifier.INotificationBus;
  import uk.co.ziazoo.notifier.NotificationBus;

  public class Context implements IContext
  {
    /**
     * @private
     */  
    protected var _container:DisplayObjectContainer;
    
    private var _injector:IInjector;
    private var _commands:ICommandMap;
    private var _bus:INotificationBus;
    
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

      _injector = Injector.createInjector();
      
      _bus = new NotificationBus();
      _injector.map(INotificationBus).toInstance(_bus);
      
      _commands = new CommandMap(_injector, _bus);
      injector.map(ICommandMap).toInstance(_commands);
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
      if( _container )
      {
        return;
      }
      _container = value;
      
      addContextListeners();
      configureMediators();
      configureCommands();
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
    
    public function configureMediators():void
    {
      
    }
    
    public function configureCommands():void
    {
      
    }
    
    protected function onViewRemoved(event:Event):void
    {
      
    }
    
    protected function injectMediator(mediatorType:Class):void
    {
      injector.inject(mediatorType);
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
    public function mediate(viewType:Class):ViewMap
    {
      var map:ViewMap = new ViewMap(viewType);
      maps.push(map);
      
      injector.map(viewType).inScope(getScope());
      
      return map;
    }
    
    public function get injector():IInjector
    {
      return _injector;
    }
    
    public function get commands():ICommandMap
    {
      return _commands;
    }
    
    public function get bus():INotificationBus
    {
      return _bus;
    }
  }
}