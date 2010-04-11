package uk.co.ziazoo.dew
{
  import flash.display.DisplayObject;
  import flash.display.DisplayObjectContainer;

  public class MediatingContext extends AbstractContext 
    implements IMediatingContext
  {
    
    /**
     * @private
     * 
     * list of all mediated views
     */ 
    protected var maps:Array;
    
    public function MediatingContext(container:DisplayObjectContainer = null):void 
    {
      if(container)
      {
        this.container = container;
      }
      maps = [];
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
    
    override protected function preContextCreated():void
    {
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