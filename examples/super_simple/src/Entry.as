package
{
  import flash.display.Sprite;
  
  import simple.view.Message;
  
  public class Entry extends Sprite
  {
    private var context:SimpleContext;
    
    public function Entry()
    {
      context = new SimpleContext(this);
      
      var messages:Array = ["hello", "woo", "wibble", "hoohumm"];
      
      for each(var msg:String in messages)
      {
        var message:Message = new Message();
        message.setText(msg);
        message.x = Math.random() * stage.stageWidth;
        message.y = Math.random() * stage.stageHeight;
        
        addChild(message);
      }
    }
  }
}