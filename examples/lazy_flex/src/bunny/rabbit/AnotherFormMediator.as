package bunny.rabbit
{
  public class AnotherFormMediator
  {
    private var form:AnotherForm;
    
    public function AnotherFormMediator(form:AnotherForm)
    {
      this.form = form;
    }
    
    [PostConstruct]
    public function created():void
    {
      trace("Created AnotherFormMediator for", form);
    }
  }
}