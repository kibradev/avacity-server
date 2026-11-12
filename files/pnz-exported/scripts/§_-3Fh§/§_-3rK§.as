package §_-3Fh§
{
   import §_-18o§.§_-8-S§;
   import §_-6EA§.§_-Cb1§;
   import §_-AKx§.§_-2-c§;
   import §_-AKx§.§_-4OH§;
   import §_-GM§.Context;
   import §_-uR§.§_-53f§;
   import flash.events.TimerEvent;
   import flash.external.ExternalInterface;
   import flash.utils.Timer;
   
   public class §_-3rK§ extends §_-53f§
   {
      public static const §_-38R§:§_-Cb1§ = new §_-Cb1§(3);
      
      public static const §_-6dW§:§_-Cb1§ = new §_-Cb1§(60);
      
      private var §_-1bH§:§_-Cb1§ = new §_-Cb1§(0);
      
      private var §_-CHu§:Timer = null;
      
      public function §_-3rK§()
      {
         super();
      }
      
      public function run() : void
      {
         this.§_-1bH§.value = §_-8-S§.§_-9zq§();
         this.§_-CHu§ = new Timer(§_-38R§.value * 1000);
         this.§_-CHu§.addEventListener(TimerEvent.TIMER,this.onTimer);
         this.§_-CHu§.start();
      }
      
      public function stop() : void
      {
         if(this.§_-CHu§ != null)
         {
            this.§_-CHu§.stop();
            this.§_-CHu§.removeEventListener(TimerEvent.TIMER,this.onTimer);
            this.§_-CHu§ = null;
         }
      }
      
      private function onTimer(param1:TimerEvent) : void
      {
         var event:TimerEvent = param1;
         var currentTime:§_-Cb1§ = new §_-Cb1§(§_-8-S§.§_-9zq§());
         var expectingTime:§_-Cb1§ = new §_-Cb1§(this.§_-1bH§.value + §_-38R§.value);
         if(Math.abs(expectingTime.value - currentTime.value) < §_-6dW§.value)
         {
            this.§_-1bH§.value = currentTime.value;
         }
         else
         {
            this.stop();
            Context.§_-CLP§.§_-21N§();
            §_-4OH§.§_-B5P§(Context.§_-5o8§.message("warning"),Context.§_-5o8§.message("tryRefreshMessage"),function(param1:§_-2-c§):void
            {
               if(ExternalInterface.available)
               {
                  ExternalInterface.call("window.location.reload();");
               }
            });
         }
      }
      
      override public function destroy() : void
      {
         if(destroyed)
         {
            return;
         }
         this.stop();
         super.destroy();
      }
   }
}

