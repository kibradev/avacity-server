package §_-Bdn§
{
   import §_-3eZ§.BaseButton;
   import §_-AKx§.§_-7qo§;
   import §_-AaA§.§_-5Kl§;
   import §_-Av5§.§_-Qd§;
   import §_-GM§.Context;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   import flash.utils.Timer;
   import penzville.Application;
   
   public class §_-AlJ§ extends §_-7qo§
   {
      private var _timer:Timer = null;
      
      private var §_-4cR§:BaseButton = null;
      
      private var §_-VE§:int = 15;
      
      private var _message:String = null;
      
      public function §_-AlJ§(param1:String = null)
      {
         super(350,150,Context.§_-5o8§.message("error"));
         this._message = param1 == null ? Context.§_-5o8§.message("serverBusy") : param1;
      }
      
      override public function init() : void
      {
         var _loc1_:TextField = null;
         super.init();
         _loc1_ = §_-5Kl§.§_-Ae-§(0,0,"<p><center>" + this._message + "</center></p>");
         _loc1_.width = clientWidth;
         _loc1_.autoSize = TextFieldAutoSize.LEFT;
         _loc1_.wordWrap = true;
         addContent(_loc1_);
         clientHeight = _loc1_.height + 50;
         this.§_-4cR§ = new BaseButton(Context.§_-5o8§.message("okButtonTitle") + " (" + this.§_-VE§ + ")");
         this.§_-4cR§.x = clientWidth / 2 - this.§_-4cR§.clientWidth / 2;
         this.§_-4cR§.y = _loc1_.height + 20;
         addContent(this.§_-4cR§);
         this.§_-4cR§.addEventListener(MouseEvent.CLICK,this.§_-7sk§);
         clientHeight = _loc1_.height + 50;
         this._timer = new Timer(1000,this.§_-VE§);
         this._timer.addEventListener(TimerEvent.TIMER,this.onTimer);
         this._timer.addEventListener(TimerEvent.TIMER_COMPLETE,this.onTimerComplete);
         this._timer.start();
      }
      
      private function onTimer(param1:TimerEvent) : void
      {
         --this.§_-VE§;
         this.§_-4cR§.label = Context.§_-5o8§.message("okButtonTitle") + " (" + this.§_-VE§ + ")";
      }
      
      private function onTimerComplete(param1:TimerEvent) : void
      {
         this.connect();
         close();
      }
      
      private function §_-7sk§(param1:MouseEvent) : void
      {
         this.connect();
         close();
      }
      
      private function connect() : void
      {
         var _loc1_:§_-Qd§ = Context.player.locationInfo;
         if(_loc1_ == null)
         {
            return;
         }
         Application.instance.currentScreen = null;
         Context.player.loaded = false;
         Context.§_-CLP§.visitByLocationInfo(_loc1_,false);
      }
      
      override public function destroy() : void
      {
         if(destroyed)
         {
            return;
         }
         if(this._timer != null)
         {
            this._timer.removeEventListener(TimerEvent.TIMER_COMPLETE,this.onTimerComplete);
            this._timer.stop();
            this._timer = null;
         }
         super.destroy();
      }
   }
}

