package org.thingy
{
  import spark.components.Label;
  import spark.components.supportClasses.SkinnableComponent;
  
  public class MyView extends SkinnableComponent
  {
    [SkinPart]
    public var title:Label;
    
    [Inject(name="message")]
    [Bindable]
    public var message:String;
    
    public function MyView()
    {
      super();
    }
  }
}