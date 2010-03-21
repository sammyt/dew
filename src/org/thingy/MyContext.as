package org.thingy
{
  import uk.co.ziazoo.dew.Context;
  import uk.co.ziazoo.dew.ContextScope;
  import uk.co.ziazoo.injector.IInjector;
  import uk.co.ziazoo.injector.IMappingBuilder;
  import uk.co.ziazoo.injector.impl.Injector;
  
  public class MyContext extends Context
  {
    private var injector:IInjector;
    
    public function MyContext()
    {
      super();
      
      map(MyView).inScope(getScope());
      map(String).named("message").toInstance("hello");
      
      whenCreated(MyView).mediateWith(MyMediator);
    }
    
    override public function getInjector():IInjector
    {
      if( !injector )
      {
        injector = Injector.createInjector();
      }
      return injector;
    }
    
    private function map(type:Class):IMappingBuilder
    {
      return getInjector().map(type);
    }
  }
}