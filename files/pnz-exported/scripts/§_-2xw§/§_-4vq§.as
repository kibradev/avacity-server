package §_-2xw§
{
   import flash.display.DisplayObjectContainer;
   
   public class §_-4vq§
   {
      private var §_-rh§:§_-7Gh§;
      
      private var §_-A1k§:DisplayObjectContainer;
      
      public function §_-4vq§()
      {
         super();
      }
      
      public function get currentScreen() : §_-7Gh§
      {
         return this.§_-rh§;
      }
      
      public function §_-3TJ§(param1:§_-7Gh§, param2:DisplayObjectContainer) : void
      {
         this.§_-173§();
         if(param2 == null)
         {
            if(this.§_-A1k§ == null)
            {
               throw new Error("Screen container is null");
            }
            param2 = this.§_-A1k§;
         }
         this.§_-rh§ = param1;
         param2.addChild(param1);
         param1.activate();
      }
      
      public function §_-173§() : void
      {
         if(this.§_-rh§ == null)
         {
            return;
         }
         this.§_-rh§.deactivate();
         if(this.§_-rh§.§_-A5u§)
         {
            this.§_-rh§.destroy();
         }
         if(this.§_-rh§.parent != null)
         {
            this.§_-rh§.parent.removeChild(this.§_-rh§);
         }
      }
      
      public function set §_-0Tp§(param1:DisplayObjectContainer) : void
      {
         this.§_-A1k§ = param1;
      }
   }
}

