package §_-0Uz§
{
   import §_-uR§.§_-53f§;
   import ags.§_-5x-§;
   
   public class §_-6v4§ extends §_-53f§ implements §_-m3§
   {
      protected var §_-6gl§:§_-5x-§ = null;
      
      private var §_-CAm§:Object = {};
      
      public function §_-6v4§()
      {
         super();
      }
      
      public function get netClient() : §_-5x-§
      {
         return this.§_-6gl§;
      }
      
      public function set netClient(param1:§_-5x-§) : void
      {
         if(this.§_-6gl§ != null)
         {
            this.§_-7xw§();
            this.§_-6gl§ = null;
         }
         this.§_-6gl§ = param1;
         if(this.§_-6gl§ != null)
         {
            this.registerAllCallbacks();
         }
      }
      
      protected function §_-Byx§(param1:String) : void
      {
         if(this.§_-CAm§.hasOwnProperty(param1))
         {
            this.§_-3dl§(param1);
            delete this.§_-CAm§[param1];
         }
      }
      
      protected function §_-1-t§(param1:String, param2:Function) : void
      {
         this.§_-3dl§(param1);
         this.§_-CAm§[param1] = param2;
         this.§_-0sS§(param1);
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
      
      protected function registerAllCallbacks() : void
      {
         var _loc1_:String = null;
         for(_loc1_ in this.§_-CAm§)
         {
            this.§_-0sS§(_loc1_);
         }
      }
      
      override public function destroy() : void
      {
         if(destroyed)
         {
            return;
         }
         this.netClient = null;
         this.§_-CAm§ = null;
         super.destroy();
      }
   }
}

