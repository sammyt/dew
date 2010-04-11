package uk.co.ziazoo.dew
{ 
  import flash.display.DisplayObjectContainer;
  
  import uk.co.ziazoo.command.CommandMap;
  import uk.co.ziazoo.command.ICommandMap;
  import uk.co.ziazoo.injector.IInjector;
  import uk.co.ziazoo.injector.IScope;
  import uk.co.ziazoo.injector.impl.Injector;
  import uk.co.ziazoo.notifier.INotifier;
  import uk.co.ziazoo.notifier.Notifier;

  public class AbstractContext implements IContext 
  {
    /**
     * @private
     */  
    protected var _container:DisplayObjectContainer;
    
    /**
     * @private
     */
    protected var _injector:IInjector;
    
    /**
     * @private
     */
    protected var _commands:ICommandMap;
    
    /**
     * @private
     */
    protected var _notifier:INotifier;
    
    /**
     * @private
     * 
     * scope used for views created in context
     */  
    protected var scope:ContextScope;
    
    /**
     * @private
     * 
     * list of all mediated views
     */ 
    protected var maps:Array;
    
    /**
     * @private
     */ 
    protected var _creationListener:IViewCreationListener;
    
    public function AbstractContext()
    {
      maps = [];
      
      _injector = Injector.createInjector();
      
      _notifier = new Notifier();
      _injector.map(INotifier).toInstance(_notifier);
      
      _commands = new CommandMap(_injector, _notifier);
      _injector.map(ICommandMap).toInstance(_commands);
    }
    
    /**
     * @inheritDoc
     */ 
    public function get creationListener():IViewCreationListener
    {
      return _creationListener;
    }
    
    public function set creationListener(value:IViewCreationListener):void
    {
      _creationListener = value; 
    }
    
    /**
     * @inheritDoc
     */ 
    public function get container():DisplayObjectContainer
    {
      return _container;
    }
    
    public function set container(value:DisplayObjectContainer):void
    {
      if( _container )
      {
        return;
      }
      _container = value;
      contextCreated();
    }
    
    /**
     * @inheritDoc
     */
    public function contextCreated():void
    {
    }
    
    /**
     * @inheritDoc
     */
    public function getScope():IScope
    {
      if(!scope)
      {
        scope = new ContextScope();
      }
      return scope;
    }
    
    /**
     * @inheritDoc
     */
    public function get injector():IInjector
    {
      return _injector;
    }
    
    /**
     * @inheritDoc
     */
    public function get commands():ICommandMap
    {
      return _commands;
    }
    
    /**
     * @inheritDoc
     */
    public function get notifier():INotifier
    {
      return _notifier;
    }
  }
}