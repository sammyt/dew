package simple.example
{
  import flash.display.Sprite;
  
  public class Blob extends Sprite
  {
    public function Blob()
    {
      super();
    }
    
    public function repaint(colour:uint):void
    {
      graphics.clear();
      graphics.beginFill(colour);
      graphics.drawCircle(0 , 0, 20);
      graphics.endFill();
    }
  }
}