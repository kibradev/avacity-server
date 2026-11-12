package §_-B2D§
{
   import §_-0-d§.§_-Wj§;
   import §_-0fi§.§_-6f3§;
   import §_-0yZ§.§_-aD§;
   import §_-18o§.§_-4jN§;
   import §_-1Fx§.§_-5n7§;
   import §_-1Vu§.§_-Awf§;
   import §_-2S7§.§_-75P§;
   import §_-2U3§.ResourceManager;
   import §_-3eZ§.BaseButton;
   import §_-3eZ§.§_-B39§;
   import §_-40e§.§_-1m0§;
   import §_-52p§.§_-25R§;
   import §_-8Hp§.§_-5KD§;
   import §_-8xR§.§_-7q1§;
   import §_-95S§.§_-9E8§;
   import §_-99s§.§_-7Tj§;
   import §_-AaA§.§_-5Kl§;
   import §_-Az6§.§_-4ZF§;
   import §_-Az6§.§_-68T§;
   import §_-Az6§.§_-C2d§;
   import §_-Bwh§.§_-AMW§;
   import §_-ByP§.§_-0CV§;
   import §_-ByP§.§_-A7b§;
   import §_-GM§.Context;
   import §_-zA§.§_-9ic§;
   import flash.display.MovieClip;
   import flash.display.Shape;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   import penzville.Application;
   
   public class §_-7fr§ extends §_-75P§
   {
      private static const §_-2qm§:int = 9;
      
      private var §_-0M4§:§_-25R§ = new §_-25R§();
      
      private var §_-1TH§:§_-25R§ = new §_-25R§();
      
      private var §_-35X§:int = 0;
      
      private var _items:Array = [];
      
      public function §_-7fr§(param1:§_-0CV§)
      {
         super(param1,494,300,Context.§_-5o8§.message("newBundleDialogTitle"));
      }
      
      override public function init() : void
      {
         var _loc1_:MovieClip = null;
         var _loc2_:§_-B39§ = null;
         var _loc3_:BaseButton = null;
         super.init();
         _loc1_ = ResourceManager.createMovieClip("CampaignBundle@ui");
         _loc1_.x = 55;
         _loc1_.y = 12;
         addContentOverlay(_loc1_);
         this.renderItems();
         this.§_-9B8§();
         this.§_-ByC§();
         clientHeight = §_-54q§ + 10;
         _loc2_ = new §_-B39§(Context.§_-5o8§.message("buyButtonTitle"));
         _loc2_.addEventListener(MouseEvent.CLICK,this.onBuyClick);
         _loc2_.x = 45 + clientWidth / 2 - _loc2_.width - _loc2_.width * 0.1;
         _loc2_.y = dialogHeight - _loc2_.height * 0.75;
         addContentOverlay(_loc2_);
         _loc3_ = new BaseButton(Context.§_-5o8§.message("closeButtonTitle"));
         _loc3_.addEventListener(MouseEvent.CLICK,onCloseClick);
         _loc3_.x = 45 + clientWidth / 2 + _loc3_.width * 0.1;
         _loc3_.y = dialogHeight - _loc3_.height * 0.75;
         addContentOverlay(_loc3_);
      }
      
      private function §_-Byj§() : Array
      {
         var _loc2_:§_-A7b§ = null;
         var _loc3_:Array = null;
         var _loc4_:§_-7Tj§ = null;
         var _loc1_:Array = [];
         if(campaign.campaignItemList != null)
         {
            for each(_loc2_ in campaign.campaignItemList)
            {
               if(this.validateItem(_loc2_))
               {
                  _loc1_.push(_loc2_);
                  _loc3_ = _loc2_.typeId.split(":");
                  _loc4_ = Context.§_-70S§.§_-0ZU§().findTypeById(_loc3_[0]) as §_-7Tj§;
                  this.§_-0M4§.gold += _loc2_.gold;
                  this.§_-0M4§.silver += _loc2_.silver;
                  this.§_-1TH§.gold += _loc4_.gold;
                  this.§_-1TH§.silver += _loc4_.silver;
                  if(_loc4_ is §_-6f3§)
                  {
                     this.§_-35X§ += (_loc4_ as §_-6f3§).rating;
                  }
               }
            }
         }
         return _loc1_;
      }
      
      private function renderItems() : void
      {
         var _loc5_:* = false;
         var _loc8_:§_-C2d§ = null;
         var _loc9_:§_-A7b§ = null;
         var _loc10_:Shape = null;
         var _loc11_:§_-Wj§ = null;
         var _loc12_:§_-68T§ = null;
         var _loc1_:int = 105;
         var _loc2_:int = 105;
         var _loc3_:int = 10;
         var _loc4_:int = 10;
         §_-54q§ += 60;
         this._items = this.§_-Byj§();
         _loc5_ = this._items.length > §_-2qm§;
         var _loc6_:int = _loc5_ ? (_loc2_ + _loc4_) * 3 : int(Math.ceil(this._items.length / 3) * (_loc2_ + _loc4_));
         var _loc7_:int = this._items.length > 3 ? _loc1_ * 3 + _loc3_ * 2 : int(_loc1_ * this._items.length + _loc3_ * (this._items.length - 1));
         _loc8_ = new §_-C2d§(_loc7_,_loc6_,_loc5_ ? §_-C2d§.DIRECTION_VERTICAL : §_-C2d§.DIRECTION_HORIZONTAL,_loc3_,_loc4_);
         for each(_loc9_ in this._items)
         {
            _loc11_ = new §_-Wj§(_loc9_);
            _loc8_.addItem(_loc11_);
         }
         _loc10_ = this.§_-8B8§(_loc7_ + 40,_loc6_ + 40);
         _loc10_.x = clientWidth / 2 - _loc10_.width / 2;
         _loc10_.y = §_-54q§ - 10;
         addContent(_loc10_);
         if(_loc5_)
         {
            _loc12_ = new §_-68T§(_loc7_,_loc6_,§_-4ZF§.DIRECTION_HORIZONTAL,_loc1_ + _loc3_);
            _loc12_.x = clientWidth / 2 - _loc7_ / 2;
            _loc12_.y = §_-54q§;
            addContent(_loc12_);
            _loc12_.addContent(_loc8_);
         }
         else
         {
            _loc8_.x = clientWidth / 2 - _loc7_ / 2;
            _loc8_.y = §_-54q§;
            addContent(_loc8_);
         }
         this.§_-52P§();
         §_-54q§ += _loc10_.height;
      }
      
      private function §_-8B8§(param1:int, param2:int) : Shape
      {
         var _loc3_:Shape = new Shape();
         _loc3_.graphics.beginFill(14806415);
         _loc3_.graphics.lineStyle(3,15974155);
         _loc3_.graphics.drawRoundRect(0,0,param1,param2,20,20);
         _loc3_.graphics.endFill();
         return _loc3_;
      }
      
      private function §_-52P§() : void
      {
         var _loc1_:MovieClip = null;
         var _loc2_:MovieClip = null;
         if(this.§_-35X§ <= 0)
         {
            return;
         }
         _loc1_ = ResourceManager.createMovieClip("CampaignBundleHeaderRating@ui");
         _loc1_.x = clientWidth / 2 - _loc1_.width / 2;
         _loc1_.y = §_-54q§ - _loc1_.height - 11;
         _loc2_ = ResourceManager.createMovieClip("HouseRatingBigIcon@ui");
         _loc2_.x = Math.round(_loc1_.width / 2);
         _loc2_.y = 19;
         var _loc3_:TextField = §_-5Kl§.createTextField(0,0,"+" + String(this.§_-35X§),§_-5Kl§.§_-8sp§,{
            "size":18,
            "glowFilter":{
               "color":4752925,
               "blurX":1.3,
               "blurY":1.3,
               "strength":50,
               "quality":5,
               "alpha":1
            }
         });
         _loc3_.x = _loc1_.width / 2 - _loc3_.width / 2 - 2;
         _loc3_.y = _loc1_.height / 2 + 2;
         _loc1_.addChild(_loc2_);
         _loc1_.addChild(_loc3_);
         addContent(_loc1_);
      }
      
      private function §_-9B8§() : void
      {
         var _loc1_:MovieClip = null;
         var _loc2_:§_-5n7§ = null;
         _loc1_ = ResourceManager.createMovieClip("CampaignBundleRibbon@ui");
         _loc1_.x = clientWidth / 2 - _loc1_.width / 2;
         _loc1_.y = §_-54q§ - _loc1_.height / 2 - 10;
         _loc2_ = null;
         if(this.§_-0M4§.silver > 0)
         {
            _loc2_ = this.§_-2Fa§(String(this.§_-0M4§.silver),"SilverCoinMedium");
            _loc2_.x = _loc1_.width / 2 - _loc2_.width / 2;
            _loc2_.y = 18;
            _loc1_.addChild(_loc2_);
         }
         var _loc3_:§_-5n7§ = null;
         if(this.§_-0M4§.gold > 0)
         {
            _loc3_ = this.§_-2Fa§(String(this.§_-0M4§.gold),"GoldCoinMedium");
            _loc3_.x = _loc1_.width / 2 - _loc3_.width / 2;
            _loc3_.y = 18;
            _loc1_.addChild(_loc3_);
            if(_loc2_ != null)
            {
               _loc2_.x = _loc1_.width / 2 - (_loc2_.width + _loc3_.width + 10) / 2;
               _loc3_.x = _loc2_.x + _loc2_.width + 10;
            }
         }
         addContent(_loc1_);
         §_-54q§ += _loc1_.height / 2;
      }
      
      private function §_-2Fa§(param1:String, param2:String) : §_-5n7§
      {
         var _loc4_:TextField = null;
         var _loc5_:MovieClip = null;
         var _loc3_:§_-5n7§ = new §_-5n7§();
         _loc4_ = §_-5Kl§.createTextField(0,0,param1,§_-5Kl§.§_-4Jj§);
         _loc5_ = ResourceManager.createMovieClip(param2 + "@ui");
         _loc5_.y = _loc4_.y - 1;
         _loc5_.x = _loc4_.x + _loc4_.width - 6;
         _loc3_.addChild(_loc5_);
         _loc3_.addChild(_loc4_);
         return _loc3_;
      }
      
      private function §_-ByC§() : void
      {
         var _loc1_:§_-5n7§ = new §_-5n7§();
         var _loc2_:TextField = §_-5Kl§.createTextField(0,0,Context.§_-5o8§.message("dailySaleItemOldPrice",{"price":""}),§_-5Kl§.§_-4Jj§,{"size":14});
         _loc1_.addChild(_loc2_);
         var _loc3_:§_-5n7§ = null;
         if(this.§_-1TH§.silver > 0)
         {
            _loc3_ = this.§_-6b2§(String(this.§_-1TH§.silver),§_-9ic§.§_-Se§);
            _loc3_.x = _loc2_.width + 2;
            _loc3_.y = 0;
            _loc1_.addChild(_loc3_);
         }
         var _loc4_:§_-5n7§ = null;
         if(this.§_-1TH§.gold > 0)
         {
            _loc4_ = this.§_-6b2§(String(this.§_-1TH§.gold),§_-9ic§.§_-2qq§);
            _loc4_.x = _loc2_.width + 2;
            _loc4_.y = 0;
            _loc1_.addChild(_loc4_);
            if(_loc3_ != null)
            {
               _loc4_.x = _loc2_.width + _loc3_.width + 5;
            }
         }
         _loc1_.x = clientWidth / 2 - _loc1_.width / 2;
         _loc1_.y = §_-54q§ - _loc1_.height / 2;
         addContent(_loc1_);
         §_-54q§ += _loc1_.height;
      }
      
      private function §_-6b2§(param1:String, param2:String) : §_-5n7§
      {
         var _loc3_:§_-5n7§ = new §_-5n7§();
         var _loc4_:TextField = §_-5Kl§.createTextField(0,0,param1,§_-5Kl§.§_-4Jj§,{"size":14});
         var _loc5_:§_-9ic§ = new §_-9ic§(param2);
         _loc5_.y = _loc4_.height / 2;
         _loc5_.x = _loc4_.width + 10;
         _loc3_.addChild(_loc5_);
         _loc3_.addChild(_loc4_);
         return _loc3_;
      }
      
      private function onBuyClick(param1:MouseEvent) : void
      {
         var _loc3_:§_-A7b§ = null;
         var _loc4_:Array = null;
         var _loc5_:§_-7Tj§ = null;
         var _loc2_:§_-AMW§ = new §_-AMW§();
         if(!_loc2_.checkPrice(this.§_-0M4§,§_-6To§(§_-aD§.REASON_BUY_BUNDLE)))
         {
            return;
         }
         for each(_loc3_ in this._items)
         {
            _loc4_ = _loc3_.typeId.split(":");
            _loc5_ = Context.§_-70S§.§_-0ZU§().findTypeById(_loc4_[0]) as §_-7Tj§;
            if(!§_-9E8§.validateItem(_loc5_,Context.cityPlayer))
            {
               return;
            }
         }
         Application.instance.addEventListener(§_-1m0§.§_-CGy§,this.onBuyComplete);
         §_-5KD§.instance.§_-3P4§(campaign.id);
      }
      
      private function onBuyComplete(param1:§_-1m0§) : void
      {
         Application.instance.removeEventListener(§_-1m0§.§_-CGy§,this.onBuyComplete);
         §_-4jN§.play(§_-4jN§.§_-04j§);
         Context.§_-BlB§.§_-CCK§(new §_-7q1§(Context.§_-5o8§.message("newBundleNotificationTitle"),Context.§_-5o8§.message("newBundleNotificationMessage")));
         close();
      }
      
      override public function canShowDialog() : Boolean
      {
         var _loc1_:§_-A7b§ = null;
         for each(_loc1_ in campaign.campaignItemList)
         {
            if(this.validateItem(_loc1_))
            {
               return true;
            }
         }
         return false;
      }
      
      override protected function validateItem(param1:§_-A7b§) : Boolean
      {
         var _loc4_:§_-Awf§ = null;
         var _loc5_:String = null;
         var _loc2_:Array = param1.typeId.split(":");
         var _loc3_:§_-7Tj§ = Context.§_-70S§.§_-0ZU§().findTypeById(_loc2_[0]) as §_-7Tj§;
         if(_loc3_ == null || !_loc3_.canBuy)
         {
            return false;
         }
         if(_loc3_ is §_-Awf§)
         {
            _loc4_ = _loc3_ as §_-Awf§;
            _loc5_ = _loc2_.length > 1 ? _loc2_[1] : null;
            return _loc4_.gender == Context.cityPlayer.avatarAppearance.gender && !Context.cityPlayer.§_-2dL§(_loc4_.typeId,_loc5_);
         }
         return true;
      }
   }
}

