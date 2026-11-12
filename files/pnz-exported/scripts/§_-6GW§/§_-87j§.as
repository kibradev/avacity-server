package §_-6GW§
{
   import §_-AKx§.§_-4OH§;
   import §_-AKx§.§_-GN§;
   import §_-GM§.Context;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class §_-87j§
   {
      private static const §_-7I§:int = 3;
      
      private static const §_-4QK§:Number = 3000;
      
      protected var §_-BlN§:int = 0;
      
      public function §_-87j§()
      {
         super();
      }
      
      public function tryReconnect() : void
      {
         if(this.§_-BlN§ >= §_-7I§)
         {
            §_-4OH§.§_-B5P§(Context.§_-5o8§.message("error"),Context.§_-5o8§.message("tryReconnectError"));
            return;
         }
         this.§_-3au§();
      }
      
      private function §_-3au§() : void
      {
         var dialog:§_-GN§ = null;
         var timer:Timer = null;
         var onTimer:Function = null;
         dialog = §_-4OH§.§_-B5P§(Context.§_-5o8§.message("warning"),Context.§_-5o8§.message("reconnectWarningMessage"));
         timer = new Timer(§_-4QK§);
         onTimer = function(param1:TimerEvent):void
         {
            timer.stop();
            timer.removeEventListener(TimerEvent.TIMER,onTimer);
            timer = null;
            onTimer = null;
            if(dialog != null)
            {
               dialog.close();
               dialog = null;
            }
            visitHouse();
         };
         timer.addEventListener(TimerEvent.TIMER,onTimer);
         timer.start();
      }
      
      protected function visitHouse() : void
      {
         Context.§_-CLP§.visitCityHouse();
         ++this.§_-BlN§;
      }
   }
}

