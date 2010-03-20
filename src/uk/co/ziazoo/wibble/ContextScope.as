package uk.co.ziazoo.wibble
{
  import uk.co.ziazoo.injector.IProvider;
  import uk.co.ziazoo.injector.IScope;
  
  public class ContextScope implements IScope
  {
    private var context:Context;
    private var instance:Object;
    
    public function ContextScope( context:Context )
    {
      this.context = context;
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
      return context.lastTarget;
    }
  }
}