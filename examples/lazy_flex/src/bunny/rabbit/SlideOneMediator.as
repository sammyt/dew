package bunny.rabbit
{
  import uk.co.ziazoo.notifier.INotifier;

  public class SlideOneMediator
  {
    private var slide:SlideOne;
    private var notifier:INotifier;
    
    public function SlideOneMediator(slide:SlideOne, notifier:INotifier)
    {
      this.slide = slide;
      this.notifier = notifier;
    }
    
    [PostConstruct]
    public function setUp():void
    {
      trace("Created SlideOneMediator for", slide);
    }
  }
}