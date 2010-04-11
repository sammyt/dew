package uk.co.ziazoo.dew
{
  import flash.display.DisplayObject;
  import flash.events.Event;

  public class MediatingContext extends AbstractContext 
    implements IMediatingContext
  {
    public function MediatingContext():void 
    {
      
    }
    
    override public function onViewCreated(view:DisplayObject):void
    {
      scope.setTarget(view);
      
      for each( var map:ViewMap in maps )
      {
        if( view is map.view )
        {
          injectMediator(map.mediator);
          break;
        }
      }
    }
    
    override public function contextCreated():void
    {
      _creationListener = new AddedToStageListener();
      _creationListener.container = container;
      _creationListener.addCreationObserver(this);
      _creationListener.startListening();
    }
    
    public function configureMediators():void
    {
      
    }
    
    protected function injectMediator(mediatorType:Class):void
    {
      injector.inject(mediatorType);
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
  }
}