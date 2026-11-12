package §_-6Qn§
{
   import §_-2S7§.§_-75P§;
   import §_-2U3§.ResourceManager;
   import §_-3eZ§.BaseButton;
   import §_-AaA§.§_-5Kl§;
   import §_-Bi2§.§_-0sd§;
   import §_-Bi2§.§_-Fs§;
   import §_-ByP§.§_-0CV§;
   import §_-GM§.Context;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   import flash.text.TextFormatAlign;
   
   public class §_-3X1§ extends §_-75P§
   {
      private var §_-B4H§:BaseButton;
      
      public function §_-3X1§(param1:§_-0CV§)
      {
         super(param1,300,200,Context.§_-5o8§.message("buyVipDialogTitle"));
      }
      
      override protected function createSkin() : §_-Fs§
      {
         return new §_-0sd§();
      }
      
      override public function init() : void
      {
         var _loc2_:MovieClip = null;
         var _loc3_:Sprite = null;
         var _loc4_:int = 0;
         super.init();
         var _loc1_:int = (clientWidth + _skin.clientBounds.left + _skin.clientBounds.right) / 2;
         _loc2_ = ResourceManager.createMovieClip("VipCard@ui");
         _loc2_.x = _loc1_ - _loc2_.width / 2;
         _loc2_.y = _skin.clientBounds.top - 10;
         addContentOverlay(_loc2_);
         _loc2_.gotoAndStop("buy");
         _loc3_ = ResourceManager.createSprite("VipSaleAsset@ui");
         _loc3_.x = _loc2_.x - 7;
         _loc3_.y = _loc2_.y + _loc2_.height / 2 - _loc3_.height / 2 - 20;
         addContentOverlay(_loc3_);
         _loc4_ = 130;
         var _loc5_:TextField = §_-5Kl§.createTextField(10,_loc4_,Context.§_-5o8§.message("vipSaleInfo"),§_-5Kl§.§_-0iQ§,{
            "align":TextFormatAlign.CENTER,
            "width":clientWidth - 20,
            "wordWrap":true,
            "multiline":true
         });
         addContent(_loc5_);
         _loc4_ += _loc5_.height + 10;
         this.§_-B4H§ = new BaseButton(Context.§_-5o8§.message("buyButtonTitle"));
         this.§_-B4H§.x = clientWidth / 2 - this.§_-B4H§.clientWidth / 2;
         this.§_-B4H§.y = _loc4_;
         this.§_-B4H§.addEventListener(MouseEvent.CLICK,this.onBuyClick);
         addContent(this.§_-B4H§);
         _loc4_ += this.§_-B4H§.clientHeight;
         clientHeight = _loc4_;
      }
      
      override public function canShowDialog() : Boolean
      {
         return campaign.hasItems();
      }
      
      override public function destroy() : void
      {
         if(destroyed)
         {
            return;
         }
         if(this.§_-B4H§ != null)
         {
            this.§_-B4H§.removeEventListener(MouseEvent.CLICK,this.onBuyClick);
         }
         super.destroy();
      }
      
      private function onBuyClick(param1:MouseEvent) : void
      {
         Context.§_-06H§.§_-74§(Context.cityPlayer.id);
         close();
      }
   }
}

