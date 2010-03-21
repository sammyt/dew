package uk.co.ziazoo.dew
{
  import flash.utils.Dictionary;

  public class ViewMap
  {
    public var view:Class;
    public var mediator:Class;
    
    public function ViewMap(view:Class)
    {
      this.view = view;
    }
    
    public function mediateWith(mediator:Class):void
    {
      this.mediator = mediator;
    }
  }
}