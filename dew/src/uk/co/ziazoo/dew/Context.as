package uk.co.ziazoo.dew
{
  import flash.display.DisplayObject;
  import flash.display.DisplayObjectContainer;
  import flash.utils.Dictionary;
  import flash.utils.getDefinitionByName;
  import flash.utils.getQualifiedClassName;

  public class Context extends AbstractContext
  {
    private var views:Dictionary;
    
    public function Context(container:DisplayObjectContainer = null)
    {
      super();
      
      views = new Dictionary();
      
      if(container)
      {
        this.container = container;
      }
    }
    
    override public function onViewCreated(view:DisplayObject):void
    {
      var type:Class = getDefinitionByName(getQualifiedClassName(view)) as Class;
      if(views[type])
      {
        injector.inject(view);
      }
    }
    
    public function addView(type:Class):void
    {
      views[type] = type;
    }
  }
}