package
{
  import flash.display.DisplayObjectContainer;
  
  import simple.view.Message;
  
  import uk.co.ziazoo.dew.Context;
  
  public class SimpleContext extends Context
  {
    public function SimpleContext(container:DisplayObjectContainer)
    {
      super(container);
    }
    
    override public function contextCreated():void
    {
      addView(Message);
    }
  }
}