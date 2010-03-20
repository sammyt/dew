package uk.co.ziazoo.wibble
{
  import flash.display.DisplayObjectContainer;
  import flash.events.Event;
  import flash.utils.Dictionary;
  
  import uk.co.ziazoo.injector.IInjector;
  import uk.co.ziazoo.injector.IMappingBuilder;
  import uk.co.ziazoo.injector.impl.Injector;
  import uk.co.ziazoo.notifier.INotificationBus;
  import uk.co.ziazoo.notifier.NotificationBus;

  public class Context
  {
    public var lastTarget:Object;
    
    protected var injector:IInjector;
    protected var maps:Array;
    protected var container:DisplayObjectContainer;
    
    public function Context()
    {
      injector = Injector.createInjector();
      maps = [];
    }
    
    public function set view( value:DisplayObjectContainer ):void
    {
      if( value )
      {
        container = value;
        container.addEventListener(Event.ADDED_TO_STAGE, onAdded, true );
      }
    }
    
    public function get view():DisplayObjectContainer
    {
      return container;
    }
    
    protected function onAdded( event:Event ):void
    {
      lastTarget = event.target;
      
      for each( var mapper:MediatorMapper in maps )
      {
        if( lastTarget is mapper.view )
        {
          injector.inject(mapper.mediator);
        }
      }
    }
    
    protected function map(type:Class):IMappingBuilder
    {
      return injector.map(type);
    }
    
    protected function whenCreated(view:Class):MediatorMapper
    {
      var mapper:MediatorMapper = new MediatorMapper(view);
      maps.push( mapper );
      return mapper;
    }
  }
}