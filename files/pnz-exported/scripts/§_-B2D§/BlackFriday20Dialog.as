package §_-B2D§
{
   import §_-18o§.§_-8-S§;
   import §_-1Fx§.§_-5n7§;
   import §_-2S7§.§_-75P§;
   import §_-2U3§.ResourceManager;
   import §_-3eZ§.§_-2UU§;
   import §_-4cY§.§_-8Hh§;
   import §_-6EN§.§_-BjY§;
   import §_-95S§.§_-9E8§;
   import §_-99s§.§_-F§;
   import §_-AaA§.§_-5Kl§;
   import §_-Beo§.§_-2g1§;
   import §_-Bi2§.§_-Fs§;
   import §_-BxN§.§_-6wa§;
   import §_-BxN§.§_-8RV§;
   import §_-ByP§.§_-0CV§;
   import §_-GM§.Context;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.text.TextField;
   import flash.text.TextFormatAlign;
   import flash.utils.Timer;
   
   public class BlackFriday20Dialog extends §_-75P§
   {
      private static const WIDTH:int = 562;
      
      private static const §_-621§:int = 510;
      
      private static const §_-6Bw§:String = "clothes";
      
      private static const §_-ALX§:String = "furniture";
      
      private static const §_-6wo§:String = "ruby";
      
      private static const §_-0Sm§:String = "gold";
      
      private static const §_-46B§:String = "tech";
      
      private static const §_-4Eu§:String = "vip";
      
      private static const §_-0sf§:int = 470;
      
      private static const §_-B2s§:int = 40;
      
      private static const §_-C14§:int = 45;
      
      private static const §_-9qU§:int = 3;
      
      private static const §_-5wU§:int = 43;
      
      private static const §_-78U§:int = 221;
      
      private static const §_-ArJ§:int = 391;
      
      private static const §_-0AV§:int = 128;
      
      private static const §_-35s§:int = 195;
      
      private static const §_-7V0§:int = 261;
      
      private static const §_-A6I§:int = 244;
      
      private static const §_-6Yx§:int = 95;
      
      private static const §_-24e§:int = 65;
      
      private var §_-CPC§:§_-2UU§ = null;
      
      private var §_-5Bu§:§_-2UU§ = null;
      
      private var §_-4Cz§:§_-2UU§ = null;
      
      private var §_-9Dw§:§_-2UU§ = null;
      
      private var §_-2HW§:§_-2UU§ = null;
      
      private var §_-6-1§:§_-2UU§ = null;
      
      private var §_-8Fa§:TextField = null;
      
      private var _timer:Timer = null;
      
      public function BlackFriday20Dialog(param1:§_-0CV§)
      {
         super(param1,WIDTH,§_-621§,Context.§_-5o8§.message("blackFridayDialogTitle"));
      }
      
      override public function init() : void
      {
         super.init();
         this.drawDescription();
         this.§_-Ik§();
         this.drawPanels();
      }
      
      private function §_-7qT§(param1:MouseEvent) : void
      {
         new §_-2g1§(Context.player,§_-BjY§.§_-17-§).showModal();
         close();
      }
      
      private function §_-53L§(param1:MouseEvent) : void
      {
         §_-9E8§.§_-08G§(§_-F§.§_-6MQ§,§_-8Hh§.§_-1t6§);
         close();
      }
      
      private function §_-ACr§(param1:MouseEvent) : void
      {
         new §_-6wa§().showModal();
         close();
      }
      
      private function §_-9KM§(param1:MouseEvent) : void
      {
         new §_-8RV§().showModal();
         close();
      }
      
      private function §_-3VE§(param1:MouseEvent) : void
      {
         §_-9E8§.§_-08G§(§_-F§.§_-2FW§,§_-8Hh§.§_-1t6§);
         close();
      }
      
      private function §_-9W9§(param1:MouseEvent) : void
      {
         Context.§_-06H§.§_-74§(Context.cityPlayer.id);
         close();
      }
      
      private function drawDescription() : void
      {
         var _loc1_:TextField = null;
         _loc1_ = §_-5Kl§.createTextField(0,0,Context.§_-5o8§.message("blackFridayDescription"),§_-5Kl§.§_-0iQ§,{
            "size":14,
            "color":16777215,
            "width":§_-0sf§,
            "wordWrap":true,
            "align":TextFormatAlign.CENTER,
            "leading":5,
            "glowFilter":{
               "color":535097,
               "blurX":1.5,
               "blurY":1.5,
               "strength":50,
               "quality":5,
               "alpha":1
            }
         });
         _loc1_.x = WIDTH / 2 - _loc1_.width / 2;
         _loc1_.y = §_-B2s§;
         addChild(_loc1_);
      }
      
      private function §_-Ik§() : void
      {
         var _loc1_:int = 0;
         var _loc2_:§_-5n7§ = null;
         _loc1_ = campaign.endDate.time / 1000 - §_-8-S§.§_-9zq§();
         if(campaign.endDate.time == 0 || _loc1_ <= 0)
         {
            return;
         }
         _loc2_ = new §_-5n7§();
         _loc2_.x = §_-A6I§;
         _loc2_.y = §_-6Yx§;
         var _loc3_:MovieClip = ResourceManager.createMovieClip("BlackFridayTimer@ui");
         _loc2_.addChild(_loc3_);
         var _loc4_:int = _loc1_ / §_-8-S§.§_-4PC§;
         var _loc5_:String = "";
         if(_loc4_ >= 1)
         {
            _loc5_ = _loc4_.toString() + " " + Context.§_-5o8§.plural("days",_loc4_);
         }
         else
         {
            _loc5_ = §_-8-S§.getLeftTimeAsString2(_loc1_ * 1000);
            this.§_-1z9§();
         }
         this.§_-8Fa§ = §_-5Kl§.createTextField(0,10,_loc5_,§_-5Kl§.§_-0iQ§,{
            "size":14,
            "color":16777215
         });
         this.§_-8Fa§.x = §_-24e§ - this.§_-8Fa§.width / 2;
         _loc2_.addChild(this.§_-8Fa§);
         addChild(_loc2_);
      }
      
      private function drawPanels() : void
      {
         var _loc1_:§_-5n7§ = null;
         var _loc2_:§_-5n7§ = null;
         var _loc3_:§_-5n7§ = null;
         var _loc5_:§_-5n7§ = null;
         _loc1_ = new §_-5n7§();
         _loc1_.addChild(this.§_-4bb§(§_-6Bw§));
         this.§_-CPC§ = new §_-2UU§(Context.§_-5o8§.message("buyButtonTitle"));
         this.§_-CPC§.addEventListener(MouseEvent.CLICK,this.§_-7qT§);
         this.§_-CPC§.x = _loc1_.width / 2 - this.§_-CPC§.width / 2 + §_-9qU§;
         this.§_-CPC§.y = §_-C14§;
         _loc1_.addChild(this.§_-CPC§);
         _loc1_.x = §_-5wU§;
         _loc1_.y = §_-0AV§;
         addChild(_loc1_);
         _loc2_ = new §_-5n7§();
         _loc2_.addChild(this.§_-4bb§(§_-ALX§));
         this.§_-5Bu§ = new §_-2UU§(Context.§_-5o8§.message("buyButtonTitle"));
         this.§_-5Bu§.addEventListener(MouseEvent.CLICK,this.§_-53L§);
         this.§_-5Bu§.x = _loc2_.width / 2 - this.§_-5Bu§.width / 2 + §_-9qU§;
         this.§_-5Bu§.y = §_-C14§;
         _loc2_.addChild(this.§_-5Bu§);
         _loc2_.x = §_-5wU§;
         _loc2_.y = §_-7V0§;
         addChild(_loc2_);
         _loc3_ = new §_-5n7§();
         _loc3_.addChild(this.§_-4bb§(§_-0Sm§));
         this.§_-9Dw§ = new §_-2UU§(Context.§_-5o8§.message("buyButtonTitle"));
         this.§_-9Dw§.addEventListener(MouseEvent.CLICK,this.§_-9KM§);
         this.§_-9Dw§.x = _loc3_.width / 2 - this.§_-9Dw§.width / 2 + §_-9qU§;
         this.§_-9Dw§.y = §_-C14§;
         _loc3_.addChild(this.§_-9Dw§);
         _loc3_.x = §_-78U§;
         _loc3_.y = §_-35s§;
         addChild(_loc3_);
         var _loc4_:§_-5n7§ = new §_-5n7§();
         _loc4_.addChild(this.§_-4bb§(§_-46B§));
         this.§_-2HW§ = new §_-2UU§(Context.§_-5o8§.message("buyButtonTitle"));
         this.§_-2HW§.addEventListener(MouseEvent.CLICK,this.§_-3VE§);
         this.§_-2HW§.x = _loc4_.width / 2 - this.§_-2HW§.width / 2 + §_-9qU§;
         this.§_-2HW§.y = §_-C14§;
         _loc4_.addChild(this.§_-2HW§);
         _loc4_.x = §_-ArJ§;
         _loc4_.y = §_-0AV§;
         addChild(_loc4_);
         _loc5_ = new §_-5n7§();
         _loc5_.addChild(this.§_-4bb§(§_-4Eu§));
         this.§_-6-1§ = new §_-2UU§(Context.§_-5o8§.message("buyButtonTitle"));
         this.§_-6-1§.addEventListener(MouseEvent.CLICK,this.§_-9W9§);
         this.§_-6-1§.x = _loc5_.width / 2 - this.§_-6-1§.width / 2 + §_-9qU§;
         this.§_-6-1§.y = §_-C14§;
         _loc5_.addChild(this.§_-6-1§);
         _loc5_.x = §_-ArJ§;
         _loc5_.y = §_-7V0§;
         addChild(_loc5_);
      }
      
      private function §_-4bb§(param1:String) : MovieClip
      {
         var _loc2_:MovieClip = ResourceManager.createMovieClip("BlackFridaySalePanel@ui");
         _loc2_.gotoAndStop(param1);
         return _loc2_;
      }
      
      override protected function createSkin() : §_-Fs§
      {
         return new BlackFriday20DialogSkin();
      }
      
      override public function canShowDialog() : Boolean
      {
         return true;
      }
      
      private function §_-1z9§() : void
      {
         this._timer = new Timer(60000);
         this._timer.addEventListener(TimerEvent.TIMER,this.onTimer);
         this._timer.start();
      }
      
      private function onTimer(param1:TimerEvent) : void
      {
         var _loc2_:int = campaign.endDate.time / 1000 - §_-8-S§.§_-9zq§();
         if(_loc2_ <= 0)
         {
            return;
         }
         this.§_-8Fa§.text = §_-8-S§.getLeftTimeAsString2(_loc2_ * 1000);
      }
      
      override public function destroy() : void
      {
         if(destroyed)
         {
            return;
         }
         if(this._timer != null)
         {
            this._timer.stop();
            this._timer.removeEventListener(TimerEvent.TIMER_COMPLETE,this.onTimer);
            this._timer = null;
         }
         if(this.§_-CPC§ != null)
         {
            this.§_-CPC§.removeEventListener(MouseEvent.CLICK,this.§_-7qT§);
            this.§_-CPC§ = null;
         }
         if(this.§_-5Bu§ != null)
         {
            this.§_-5Bu§.removeEventListener(MouseEvent.CLICK,this.§_-53L§);
            this.§_-5Bu§ = null;
         }
         if(this.§_-4Cz§ != null)
         {
            this.§_-4Cz§.removeEventListener(MouseEvent.CLICK,this.§_-ACr§);
            this.§_-4Cz§ = null;
         }
         if(this.§_-9Dw§ != null)
         {
            this.§_-9Dw§.removeEventListener(MouseEvent.CLICK,this.§_-9KM§);
            this.§_-9Dw§ = null;
         }
         if(this.§_-2HW§ != null)
         {
            this.§_-2HW§.removeEventListener(MouseEvent.CLICK,this.§_-3VE§);
            this.§_-2HW§ = null;
         }
         if(this.§_-6-1§ != null)
         {
            this.§_-6-1§.removeEventListener(MouseEvent.CLICK,this.§_-9W9§);
            this.§_-6-1§ = null;
         }
         super.destroy();
      }
   }
}

