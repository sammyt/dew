package uk.co.ziazoo.wibble
{
  import flash.utils.Dictionary;

  public class MediatorMapper
  {
    public var view:Class;
    public var mediator:Class;
    
    public function MediatorMapper()
    {
    }
    
    public function whenCreated(view:Class):MediatorMapper
    {
      this.view = view; 
      return this;
    }
    
    public function mediateWith(mediator:Class):void
    {
      this.mediator = mediator;
    }
  }
}