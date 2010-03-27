package uk.co.ziazoo.dew
{
  import flash.display.DisplayObjectContainer;
  
  import uk.co.ziazoo.command.ICommandMap;
  import uk.co.ziazoo.injector.IInjector;
  import uk.co.ziazoo.injector.IScope;
  import uk.co.ziazoo.notifier.INotificationBus;

  public interface IContext
  {
    /**
     * The view objects mediated view will be added to
     */ 
    function get container():DisplayObjectContainer;
    function set container(value:DisplayObjectContainer):void;
    
    /**
     * The scope used to by the injector for the views
     */ 
    function getScope():IScope;
    
    /**
     * DSL to map views to their mediators
     */ 
    function mediate(viewType:Class):ViewMap;
    
    /**
     * Injector instance used to create mediators
     */ 
    function get injector():IInjector;
    
    function get commands():ICommandMap;
    
    function get bus():INotificationBus;
    
    /**
     * override this function and setup contexts mediators
     */ 
    function configureMediators():void;
    
    function configureCommands():void
  }
}