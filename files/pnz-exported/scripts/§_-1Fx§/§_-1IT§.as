package §_-1Fx§
{
   import §_-6-L§.DisplayUtils;
   import §_-7xl§.§_-8Ks§;
   import §_-uR§.ListenerManager;
   import §_-uR§.§_-4Tw§;
   import flash.display.Shape;
   
   public class §_-1IT§ extends Shape implements §_-8Ks§, §_-4Tw§
   {
      protected var _destroyed:Boolean = false;
      
      protected var §_-tw§:ListenerManager;
      
      public function §_-1IT§()
      {
         super();
         this.§_-tw§ = ListenerManager.§_-5hG§(this);
      }
      
      public function removeChildren(param1:Boolean = false, param2:Boolean = false) : void
      {
         DisplayUtils.removeChildren(this,param1,param2);
      }
      
      public function §_-oj§(param1:Boolean = false, param2:Boolean = false) : void
      {
         this.removeChildren(param1,param2);
         this.destroy();
      }
      
      public function §_-5BF§() : void
      {
         this.§_-oj§(true,true);
      }
      
      override public function addEventListener(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = false) : void
      {
         super.addEventListener(param1,param2,param3,param4,param5);
         this.§_-tw§.addEventListener(param1,param2,param3);
      }
      
      override public function removeEventListener(param1:String, param2:Function, param3:Boolean = false) : void
      {
         super.removeEventListener(param1,param2,param3);
         this.§_-tw§.removeEventListener(param1,param2,param3);
      }
      
      public function §_-3sy§(param1:String) : void
      {
         this.§_-tw§.§_-3sy§(param1);
      }
      
      public function §_-6qf§(param1:Function) : void
      {
         this.§_-tw§.§_-6qf§(param1);
      }
      
      public function removeEventListeners() : void
      {
         this.§_-tw§.removeEventListeners();
      }
      
      public function §_-0Qz§(param1:String = null) : uint
      {
         return this.§_-tw§.§_-0Qz§(param1);
      }
      
      public function destroy() : void
      {
         if(this._destroyed)
         {
            return;
         }
         this.§_-tw§.destroy();
         this._destroyed = true;
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      public function get destroyed() : Boolean
      {
         return this._destroyed;
      }
   }
}

