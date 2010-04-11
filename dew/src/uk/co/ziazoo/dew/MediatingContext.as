package uk.co.ziazoo.dew
{
  import flash.events.Event;

  public class MediatingContext extends AbstractContext 
    implements IMediatingContext
  {
    public function MediatingContext():void 
    {
      
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