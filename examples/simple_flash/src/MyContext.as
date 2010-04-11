package
{
  import flash.display.DisplayObjectContainer;
  
  import simple.example.Blob;
  import simple.example.BlobMediator;
  
  import uk.co.ziazoo.dew.MediatingContext;
  
  public class MyContext extends MediatingContext
  {
    public function MyContext(container:DisplayObjectContainer)
    {
      super();
      this.container = container;
    }
    
    override public function contextCreated():void
    {
      super.contextCreated();
      mediate(Blob).through(BlobMediator);
    }
  }
}