package §_-1ks§
{
   import §_-3ie§.§_-6SW§;
   import §_-6JL§.§_-B9P§;
   import §_-7nb§.§_-B00§;
   import §_-AaA§.§_-1FH§;
   import §_-GM§.Context;
   import penzville.Application;
   
   public class §_-VC§ extends §_-9nE§
   {
      private var §_-CGK§:§_-B00§ = null;
      
      private var §_-AkB§:Array = [];
      
      protected var §_-Bbw§:Boolean = false;
      
      public function §_-VC§()
      {
         super();
         Context.§_-CLP§.addEventListener(§_-B9P§.RESIZE,this.onResize);
      }
      
      override public function init() : void
      {
         super.init();
         this.dispatchInitEnd();
      }
      
      private function onResize(param1:§_-B9P§) : void
      {
         this.resize();
      }
      
      protected function resize() : void
      {
         var _loc1_:Object = null;
         for each(_loc1_ in this.§_-AkB§)
         {
            if(_loc1_ is §_-1FH§)
            {
               §_-1FH§(_loc1_).resize();
            }
         }
      }
      
      protected function pushResizableItem(param1:Object) : void
      {
         this.§_-AkB§.push(param1);
      }
      
      public function set location(param1:§_-B00§) : void
      {
         this.§_-CGK§ = param1;
      }
      
      public function get location() : §_-B00§
      {
         return this.§_-CGK§;
      }
      
      protected function dispatchInitEnd() : void
      {
         if(this.§_-Bbw§)
         {
            return;
         }
         Application.instance.dispatchEvent(new §_-6SW§(§_-6SW§.§_-73I§,this));
         dispatchEvent(new §_-6SW§(§_-6SW§.§_-73I§,this));
         this.§_-Bbw§ = true;
      }
      
      override public function destroy() : void
      {
         Context.§_-CLP§.removeEventListener(§_-B9P§.RESIZE,this.onResize);
         this.§_-CGK§ = null;
         this.§_-AkB§ = [];
         super.destroy();
      }
   }
}

