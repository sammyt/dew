package uk.co.ziazoo.dew
{
  import flash.display.DisplayObjectContainer;
  
  import uk.co.ziazoo.command.ICommandMap;
  import uk.co.ziazoo.injector.IInjector;
  import uk.co.ziazoo.injector.IScope;
  import uk.co.ziazoo.notifier.INotifier;

  public interface IContext
  {
    /**
     * The view objects mediated view will be added to
     */ 
    function get container():DisplayObjectContainer;
    function set container(value:DisplayObjectContainer):void;
    
    function get creationListener():IViewCreationListener;
    function set creationListener(value:IViewCreationListener):void;
    
    /**
     * Get the scope of this context
     */ 
    function getScope():IScope;
    
    /**
     * Injector instance used to create mediators
     */ 
    function get injector():IInjector;
    
    /**
     * Dawns command map
     */ 
    function get commands():ICommandMap;
    
    /**
     * Dawns notifier
     */ 
    function get notifier():INotifier;
    
    /**
     * called when the contect has been setup
     */ 
    function contextCreated():void;
  }
}