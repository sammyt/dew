package
{
  import flash.display.Sprite;
  import flash.utils.setInterval;
  
  import simple.example.Blob;
  import simple.example.Shuffle;
  
  import uk.co.ziazoo.notifier.INotifier;
  
  public class Entry extends Sprite
  {
    private var context:MyContext;
    private var notifier:INotifier;
    
    public function Entry()
    {
      // create context for this application
      context = new MyContext(this);
      
      // get a reference to the notifier
      notifier = context.notifier;
      
      // create some mediated blobs
      for(var i :int = 0; i<10; i++)
      {
        var blob:Blob = new Blob();
        addChild(blob);
      }
      
      // do the shuffle
      setInterval(
        function():void
        {
          notifier.trigger(new Shuffle());
        }, 
        1100);
    }
  }
}