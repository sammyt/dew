package simple.example
{
  import com.gskinner.motion.GTween;
  
  import flash.display.Sprite;
  import flash.geom.Point;
  
  public class Blob extends Sprite
  {
    private var mover:GTween;
    
    public function Blob()
    {
      super();
    }
    
    [PostConstruct]
    public function init():void
    {
      mover = new GTween(this, 0.8);
    }
    
    public function repaint(colour:uint):void
    {
      graphics.clear();
      graphics.beginFill(colour);
      graphics.drawCircle(0 , 0, 20);
      graphics.endFill();
    }
    
    public function move():void
    {
      mover.proxy.x = stage.stageWidth * Math.random();
      mover.proxy.y = stage.stageHeight * Math.random();
    }
  }
}