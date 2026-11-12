package §_-4Ms§
{
   import §_-6-L§.DisplayUtils;
   import §_-uR§.§_-53f§;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class Hint extends §_-53f§
   {
      public static var container:DisplayObjectContainer = null;
      
      protected var _target:DisplayObject;
      
      private var §_-5Du§:§_-mm§;
      
      private var _delay:int = 0;
      
      private var _timer:Timer = null;
      
      private var §_-9FW§:DisplayObject;
      
      private var §_-5q8§:Boolean = false;
      
      public function Hint(param1:DisplayObject, param2:§_-mm§, param3:int = 1500)
      {
         var target:DisplayObject = param1;
         var view:§_-mm§ = param2;
         var delay:int = param3;
         super();
         this._target = target;
         this.§_-5Du§ = view;
         this._delay = delay;
         this.addTargetListeners();
         this.§_-5Du§.hint = this;
         container.addChild(this.§_-5Du§);
         target.addEventListener(Event.REMOVED_FROM_STAGE,function(param1:Event):void
         {
            destroy();
         });
      }
      
      protected function addTargetListeners() : void
      {
         this._target.addEventListener(MouseEvent.MOUSE_OVER,this.onMouseOver);
         this._target.addEventListener(MouseEvent.MOUSE_OUT,this.onMouseOut);
      }
      
      public function get target() : DisplayObject
      {
         return this._target;
      }
      
      public function get view() : §_-mm§
      {
         return this.§_-5Du§;
      }
      
      private function onMouseOver(param1:MouseEvent) : void
      {
         this.§_-69N§(DisplayObject(param1.currentTarget));
      }
      
      protected function §_-69N§(param1:DisplayObject) : void
      {
         if(this._delay == 0)
         {
            this.showView(param1);
         }
         else if(this._timer == null)
         {
            this._timer = new Timer(this._delay,1);
            this.§_-9FW§ = param1;
            this._timer.addEventListener(TimerEvent.TIMER_COMPLETE,this.onTimerComplete);
            this._timer.start();
         }
      }
      
      private function onTimerComplete(param1:TimerEvent) : void
      {
         this.showView(this.§_-9FW§);
      }
      
      protected function showView(param1:DisplayObject) : void
      {
         if(this.§_-5q8§ || this.§_-5Du§ == null)
         {
            return;
         }
         DisplayUtils.§_-6zB§(this.§_-5Du§);
         this.§_-5Du§.show(param1);
         dispatchEvent(new §_-6rM§(§_-6rM§.§_-0TW§));
      }
      
      protected function hideView(param1:DisplayObject) : void
      {
         this.§_-5Du§.hide(param1);
         dispatchEvent(new §_-6rM§(§_-6rM§.§_-8cB§));
      }
      
      private function onMouseOut(param1:MouseEvent) : void
      {
         this.hideView(DisplayObject(param1.currentTarget));
         if(this._timer != null)
         {
            this._timer.reset();
            this._timer.removeEventListener(TimerEvent.TIMER_COMPLETE,this.onTimerComplete);
            this._timer = null;
         }
      }
      
      public function get disabled() : Boolean
      {
         return this.§_-5q8§;
      }
      
      public function set disabled(param1:Boolean) : void
      {
         this.§_-5q8§ = param1;
      }
      
      override public function destroy() : void
      {
         if(_destroyed)
         {
            return;
         }
         if(this.§_-5Du§ != null)
         {
            this.§_-5Du§.destroy();
            this.§_-5Du§ = null;
         }
         if(this._target != null)
         {
            this._target.removeEventListener(MouseEvent.MOUSE_OVER,this.onMouseOver);
            this._target.removeEventListener(MouseEvent.MOUSE_OUT,this.onMouseOut);
            this._target = null;
         }
         if(this._timer != null)
         {
            this._timer.reset();
            this._timer.removeEventListener(TimerEvent.TIMER_COMPLETE,this.onTimerComplete);
            this._timer = null;
         }
         this.§_-9FW§ = null;
         super.destroy();
      }
   }
}

