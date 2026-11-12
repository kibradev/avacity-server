package §_-Bef§
{
   import §_-7ps§.§_-AND§;
   import §_-7xl§.§_-5m-§;
   import §_-Btg§.§_-1s0§;
   import §_-Btg§.§_-7l7§;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class §_-7Px§ extends §_-5m-§
   {
      private var _timer:Timer = null;
      
      private var §_-Bbc§:§_-AND§ = null;
      
      public function §_-7Px§(param1:§_-AND§)
      {
         super();
         this.§_-Bbc§ = param1;
         this.init();
      }
      
      protected function init() : void
      {
         this._timer = new Timer(this.§_-Bbc§.time * 1000,1);
         this._timer.addEventListener(TimerEvent.TIMER_COMPLETE,this.onTimerComplete);
         this._timer.start();
      }
      
      private function onTimerComplete(param1:TimerEvent) : void
      {
         this.§_-7FD§();
         if(this.§_-Bbc§.onContinue != null)
         {
            if(this.§_-Bbc§.onContinue == §_-7l7§.§_-BL§)
            {
               §_-1s0§.instance.finishStep();
            }
            else
            {
               §_-1s0§.instance.§_-1pa§(this.§_-Bbc§.onContinue);
            }
         }
      }
      
      private function §_-7FD§() : void
      {
         if(this._timer == null)
         {
            return;
         }
         this._timer.stop();
         this._timer.removeEventListener(TimerEvent.TIMER_COMPLETE,this.onTimerComplete);
         this._timer = null;
      }
      
      override public function destroy() : void
      {
         if(destroyed)
         {
            return;
         }
         this.§_-7FD§();
         this.§_-Bbc§ = null;
         super.destroy();
      }
   }
}

