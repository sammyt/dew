package bunny.rabbit
{
  import uk.co.ziazoo.dew.MediatingContext;
  
  public class LazyFlexContext extends MediatingContext
  {
    public function LazyFlexContext()
    {
      super();
    }
    
    override public function configureMediators():void
    {
      mediate(SillyForm).through(SillyFormMediator);
      mediate(SlideOne).through(SlideOneMediator);
      mediate(AnotherForm).through(AnotherFormMediator);
    }
  }
}