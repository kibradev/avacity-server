package §_-uu§
{
   import §_-0CA§.§_-59p§;
   import §_-18o§.§_-8-S§;
   import §_-2U3§.ResourceManager;
   import §_-3eZ§.§_-BCG§;
   import §_-4Ms§.Hint;
   import §_-4Ms§.§_-5VT§;
   import §_-4Ms§.§_-9p3§;
   import §_-6BB§.§_-8BS§;
   import §_-8Hp§.§_-5KD§;
   import §_-AaA§.§_-5Kl§;
   import §_-BxN§.§_-8RV§;
   import §_-ByP§.§_-0CV§;
   import §_-GM§.Context;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.text.TextField;
   import flash.utils.Timer;
   
   public class §_-1-v§ extends §_-BCG§
   {
      private var §_-1WA§:Hint;
      
      private var §_-6HM§:§_-0CV§ = null;
      
      private var _icon:MovieClip = null;
      
      private var §_-4fX§:String = null;
      
      private var §_-6rG§:TextField = null;
      
      private var §_-0D5§:MovieClip = null;
      
      private var _timer:Timer = null;
      
      private var §_-0hO§:int = 0;
      
      private var §_-22c§:Boolean = false;
      
      public function §_-1-v§(param1:Boolean = false)
      {
         this.§_-4DW§();
         super(this._icon);
         this.drawHint();
         this.§_-1wQ§();
         this.§_-22c§ = param1;
         this.§_-0D5§.x = §_-0Nm§.x - §_-0Nm§.width / 2 + 2;
         this.§_-0D5§.y = §_-0Nm§.y + §_-0Nm§.height + 1;
         this.addChild(this.§_-0D5§);
      }
      
      override protected function onClick(param1:MouseEvent) : void
      {
         super.onClick(param1);
         if(this.§_-22c§)
         {
            new §_-8RV§().showModal();
         }
         else
         {
            §_-5KD§.instance.§_-0po§(this.§_-6HM§.getItemSection(§_-59p§.§_-8FU§)).showModal();
         }
      }
      
      private function §_-4DW§() : void
      {
         var _loc2_:§_-0CV§ = null;
         this._icon = new MovieClip();
         var _loc1_:Array = §_-5KD§.instance.§_-VL§;
         for each(_loc2_ in _loc1_)
         {
            if(_loc2_.getItem(§_-59p§.§_-7H5§))
            {
               this.§_-6HM§ = _loc2_;
               this._icon = ResourceManager.createMovieClip("vkSaleStickerLeftIcon@ui");
               this.§_-4fX§ = Context.§_-5o8§.message("vkSalesDayTitle");
            }
            else if(_loc2_.getItem(§_-59p§.§_-5SA§))
            {
               this.§_-6HM§ = _loc2_;
               this._icon = ResourceManager.createMovieClip("okGameFridayLeftIcon@ui");
               this.§_-4fX§ = Context.§_-5o8§.message("okGameFridayTitle");
            }
         }
      }
      
      private function §_-1wQ§() : void
      {
         this.§_-0D5§ = ResourceManager.createMovieClip("saleTimerBackgroundIcon@ui");
         var _loc1_:Number = this.§_-6HM§.endDate.getTime() - Context.cityPlayer.timeDelta * 1000 - new Date().getTime();
         this.§_-6rG§ = §_-5Kl§.createTextField(0,0,§_-8-S§.§_-2Xf§(_loc1_),§_-5Kl§.§_-B-C§,{
            "color":6455303,
            "size":14
         });
         this.§_-6rG§.x = this.§_-0D5§.width / 2 - this.§_-6rG§.width / 2 + 3;
         this.§_-0D5§.addChild(this.§_-6rG§);
         this._timer = new Timer(60000);
         this._timer.addEventListener(TimerEvent.TIMER,this.onTimer);
         this._timer.start();
         if(Context.§_-2BT§.adapter.socialNetwork == §_-8BS§.§_-BS7§)
         {
            this.§_-0hO§ = §_-0Nm§.width / 2 + 5;
         }
         else if(Context.§_-2BT§.adapter.socialNetwork == §_-8BS§.§_-Uu§)
         {
            this.§_-0hO§ = §_-0Nm§.width / 2 - 3;
         }
      }
      
      private function onTimer(param1:TimerEvent) : void
      {
         this.§_-6rG§.text = §_-8-S§.§_-2Xf§(this.§_-6HM§.endDate.getTime() - Context.cityPlayer.timeDelta * 1000 - new Date().getTime());
      }
      
      private function drawHint() : void
      {
         this.§_-1WA§ = §_-5VT§.§_-A8N§(this,this.§_-4fX§,§_-9p3§.E);
      }
      
      override public function destroy() : void
      {
         if(destroyed)
         {
            return;
         }
         if(this.§_-1WA§ != null)
         {
            this.§_-1WA§.destroy();
            this.§_-1WA§ = null;
         }
         if(this._timer != null)
         {
            this._timer.stop();
            this._timer.removeEventListener(TimerEvent.TIMER,this.onTimer);
            this._timer = null;
         }
         super.destroy();
      }
   }
}

