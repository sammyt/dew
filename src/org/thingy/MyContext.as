package org.thingy
{
  import flash.events.Event;
  
  import uk.co.ziazoo.wibble.Context;
  import uk.co.ziazoo.wibble.ContextScope;
  
  public class MyContext extends Context
  {
    public function MyContext()
    {
      super();
      
      map(MyView).inScope(new ContextScope(this));
      map(String).named("message").toInstance("hello");
      
      whenCreated(MyView).mediateWith(MyMediator);
    }
  }
}