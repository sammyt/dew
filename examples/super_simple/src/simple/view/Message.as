package simple.view
{
  import flash.display.Sprite;
  import flash.text.TextField;
  
  import uk.co.ziazoo.notifier.INotifier;
  
  public class Message extends Sprite
  {
    private var textField:TextField;
    
    public var msg:String = "";
    
    [Inject]
    public var notifier:INotifier;
    
    public function Message()
    {
    }
    
    public function setText(value:String):void
    {
      this.msg = value;
    }
    
    [PostConstruct]
    public function setUp():void
    {
      textField = new TextField();
      textField.text = msg;
      addChild(textField);
    }
  }
}