package bunny.rabbit
{
  public class SillyFormMediator
  {
    private var form:SillyForm;
    
    public function SillyFormMediator(form:SillyForm)
    {
      this.form = form;
    }
    
    [PostConstruct]
    public function created():void
    {
      trace("Created SillyFormMediator for", form);
    }
  }
}