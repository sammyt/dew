package uk.co.ziazoo.dew
{
  import uk.co.ziazoo.injector.IProvider;
  import uk.co.ziazoo.injector.IScope;
  
  internal class ContextScope implements IScope
  {
    private var target:Object;
    
    public function ContextScope()
    {
    }
    
    public function wrap(provider:IProvider):IScope
    {
      return this;
    }
    
    public function get requiresInjection():Boolean
    {
      return true;
    }
    
    public function get instanceCreated():Boolean
    {
      return true;
    }
    
    public function getObject():Object
    {
      return target;
    }
    
    internal function setTarget(value:Object):void
    {
      target = value;
    }
  }
}