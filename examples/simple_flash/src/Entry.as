package
{
  import flash.display.Sprite;
  
  import simple.example.Blob;
  
  public class Entry extends Sprite
  {
    private var context:MyContext;
    
    public function Entry()
    {
      context = new MyContext(this);
      
      for(var i :int = 0; i<10; i++)
      {
        var blob:Blob = new Blob();
        addChild(blob);
      }
    }
  }
}