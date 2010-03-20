package org.thingy
{
  import flash.events.MouseEvent;

  public class MyMediator
  {
    private var view:MyView;
    
    public function MyMediator(view:MyView)
    {
      this.view = view;
    }
    
    [PostConstruct]
    public function created():void
    {
    }
  }
}