package §_-uR§
{
   import §_-4WB§.§_-Bgw§;
   import §_-7xl§.§_-8Ks§;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   
   public class §_-53f§ extends EventDispatcher implements §_-4Tw§, §_-8Ks§
   {
      protected var §_-tw§:ListenerManager;
      
      protected var _destroyed:Boolean = false;
      
      public function §_-53f§(param1:IEventDispatcher = null)
      {
         super(param1);
         this.§_-tw§ = ListenerManager.§_-5hG§(this);
      }
      
      private function §_-2D8§() : void
      {
         if(this.§_-tw§ == null)
         {
            throw new §_-Bgw§("RemovableEventDispatcher destroyed");
         }
      }
      
      override public function addEventListener(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = false) : void
      {
         super.addEventListener(param1,param2,param3,param4,param5);
         this.§_-2D8§();
         this.§_-tw§.addEventListener(param1,param2,param3);
      }
      
      override public function removeEventListener(param1:String, param2:Function, param3:Boolean = false) : void
      {
         super.removeEventListener(param1,param2,param3);
         this.§_-2D8§();
         this.§_-tw§.removeEventListener(param1,param2,param3);
      }
      
      public function §_-3sy§(param1:String) : void
      {
         this.§_-2D8§();
         this.§_-tw§.§_-3sy§(param1);
      }
      
      public function §_-6qf§(param1:Function) : void
      {
         this.§_-2D8§();
         this.§_-tw§.§_-6qf§(param1);
      }
      
      public function removeEventListeners() : void
      {
         this.§_-2D8§();
         this.§_-tw§.removeEventListeners();
      }
      
      public function §_-0Qz§(param1:String = null) : uint
      {
         this.§_-2D8§();
         return this.§_-tw§.§_-0Qz§(param1);
      }
      
      public function destroy() : void
      {
         if(this._destroyed)
         {
            return;
         }
         this._destroyed = true;
         this.§_-tw§.destroy();
         this.§_-tw§ = null;
      }
      
      public function get destroyed() : Boolean
      {
         return this._destroyed;
      }
   }
}

