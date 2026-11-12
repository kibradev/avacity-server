package §_-0kB§
{
   import §_-7xl§.§_-8Ks§;
   import §_-BeZ§.§_-4Ww§;
   import ags.§_-5x-§;
   import flash.events.EventDispatcher;
   
   public class §_-4w1§ extends EventDispatcher implements §_-8Ks§
   {
      protected var _destroyed:Boolean;
      
      protected var §_-6gl§:§_-5x-§;
      
      protected var §_-34M§:§_-4H0§;
      
      private var §_-CAm§:Object = {};
      
      public function §_-4w1§()
      {
         super();
      }
      
      public function init(param1:§_-4H0§) : void
      {
         this.§_-34M§ = param1;
      }
      
      public function destroy() : void
      {
         if(this._destroyed)
         {
            return;
         }
         this.netClient = null;
         this.§_-CAm§ = null;
         this._destroyed = true;
      }
      
      public function get destroyed() : Boolean
      {
         return this._destroyed;
      }
      
      public function set netClient(param1:§_-5x-§) : void
      {
         if(this.§_-6gl§ != null)
         {
            this.§_-7xw§();
         }
         this.§_-6gl§ = param1;
         if(this.§_-6gl§ != null)
         {
            this.registerAllCallbacks();
         }
      }
      
      protected function §_-yx§(param1:String, param2:Function) : void
      {
         this.§_-3dl§(param1);
         this.§_-CAm§[param1] = param2;
         this.§_-0sS§(param1);
      }
      
      protected function §_-4eO§(param1:String, param2:Function) : void
      {
         if(this.§_-CAm§.hasOwnProperty(param1))
         {
            this.§_-3dl§(param1);
            delete this.§_-CAm§[param1];
         }
      }
      
      protected function send(param1:String, param2:§_-4Ww§ = null, param3:String = null) : void
      {
         if(this.§_-6gl§ != null)
         {
            this.§_-6gl§.sendExtMessage(param1,param2,param3);
         }
      }
      
      private function §_-3dl§(param1:String) : void
      {
         if(this.§_-6gl§ != null && Boolean(this.§_-CAm§.hasOwnProperty(param1)))
         {
            this.§_-6gl§.commandDispatcher.removeEventListener(param1,this.§_-CAm§[param1]);
         }
      }
      
      private function §_-0sS§(param1:String) : void
      {
         if(this.§_-6gl§ != null && Boolean(this.§_-CAm§.hasOwnProperty(param1)))
         {
            this.§_-6gl§.commandDispatcher.addEventListener(param1,this.§_-CAm§[param1]);
         }
      }
      
      private function §_-7xw§() : void
      {
         var _loc1_:String = null;
         for(_loc1_ in this.§_-CAm§)
         {
            this.§_-3dl§(_loc1_);
         }
      }
      
      private function registerAllCallbacks() : void
      {
         var _loc1_:String = null;
         for(_loc1_ in this.§_-CAm§)
         {
            this.§_-0sS§(_loc1_);
         }
      }
   }
}

