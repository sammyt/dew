package uk.co.ziazoo.wibble
{
  import flash.utils.Dictionary;

  public class MediatorMapper
  {
    public var view:Class;
    public var mediator:Class;
    
    public function MediatorMapper(view:Class)
    {
      this.view = view;
    }
    
    public function mediateWith(mediator:Class):void
    {
      this.mediator = mediator;
    }
  }
}