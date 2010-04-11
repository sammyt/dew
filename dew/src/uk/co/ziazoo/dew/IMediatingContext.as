package uk.co.ziazoo.dew
{ 
  public interface IMediatingContext extends IContext
  {
    /**
     * DSL to map views to their mediators
     */ 
    function mediate(viewType:Class):ViewMap;
    
    /**
     * override this function and setup contexts mediators
     */ 
    function configureMediators():void;
  }
}