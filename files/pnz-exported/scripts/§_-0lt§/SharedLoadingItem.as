package §_-0lt§
{
   import flash.events.EventDispatcher;
   import flash.system.ApplicationDomain;
   import flash.system.LoaderContext;
   
   public class SharedLoadingItem extends EventDispatcher
   {
      private var §_-AcP§:String = null;
      
      private var §_-BqH§:LoaderContext = null;
      
      public function SharedLoadingItem(param1:String)
      {
         super();
         this.§_-AcP§ = param1;
      }
      
      public function get id() : String
      {
         return this.§_-AcP§;
      }
      
      public function get §_-52d§() : LoaderContext
      {
         if(this.§_-BqH§ == null)
         {
            this.§_-BqH§ = new LoaderContext(false,new ApplicationDomain());
            if(this.§_-BqH§.hasOwnProperty("allowLoadBytesCodeExecution"))
            {
               this.§_-BqH§["allowLoadBytesCodeExecution"] = true;
            }
         }
         return this.§_-BqH§;
      }
      
      public function load() : void
      {
      }
   }
}

