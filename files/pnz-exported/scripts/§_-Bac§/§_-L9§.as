package §_-Bac§
{
   import §_-3eZ§.§_-BCG§;
   import §_-AKx§.§_-7qo§;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class §_-L9§ extends §_-7qo§
   {
      public static const §_-V§:uint = 3000;
      
      private var _timer:Timer = null;
      
      private var _buttons:Array = [];
      
      public function §_-L9§(param1:int = 400, param2:int = 300, param3:String = null, param4:Boolean = true, param5:Boolean = true, param6:Boolean = true)
      {
         super(param1,param2,param3,param4,param5,param6);
      }
      
      protected function lockButton(param1:§_-BCG§, param2:int = 0) : void
      {
         if(this._timer == null)
         {
            this.§_-lx§();
            this._timer = new Timer(param2 == 0 ? §_-V§ : param2);
            this._timer.addEventListener(TimerEvent.TIMER,this.onTimer);
            this._timer.start();
         }
         param1.disabled = true;
         this._buttons.push(param1);
      }
      
      private function onTimer(param1:TimerEvent) : void
      {
         this.§_-6jg§();
         this.§_-lx§();
      }
      
      public function §_-6jg§() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this._buttons.length)
         {
            (this._buttons[_loc1_] as §_-BCG§).disabled = false;
            _loc1_++;
         }
         this._buttons = [];
      }
      
      private function §_-lx§() : void
      {
         if(this._timer != null)
         {
            this._timer.removeEventListener(TimerEvent.TIMER,this.onTimer);
            this._timer.stop();
         }
         this._timer = null;
      }
      
      override public function destroy() : void
      {
         if(destroyed)
         {
            return;
         }
         this.§_-lx§();
         super.destroy();
      }
   }
}

