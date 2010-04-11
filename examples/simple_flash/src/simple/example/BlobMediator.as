package simple.example
{
  import uk.co.ziazoo.notifier.INotifier;

  public class BlobMediator
  {
    private var blob:Blob;
    private var notifier:INotifier;
    
    public function BlobMediator(blob:Blob, notifier:INotifier)
    {
      this.blob = blob;
      this.notifier = notifier;
    }
    
    [PostConstruct]
    public function setUp():void
    {
      notifier.add(Shuffle, 
        function(payload:Shuffle):void
        {
          blob.repaint(Math.random() * 0xffffff);
          blob.move();
        });
    }
  }
}