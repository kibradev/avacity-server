package §_-B2D§
{
   import §_-0CA§.§_-6Jc§;
   import §_-0fi§.§_-6f3§;
   import §_-0uA§.§_-3YE§;
   import §_-0yZ§.§_-aD§;
   import §_-1Fx§.§_-5n7§;
   import §_-2S7§.§_-75P§;
   import §_-2U3§.ResourceManager;
   import §_-3eZ§.BaseButton;
   import §_-3eZ§.§_-B39§;
   import §_-3eZ§.§_-BCG§;
   import §_-3eZ§.§_-CVw§;
   import §_-52p§.§_-25R§;
   import §_-6-L§.DisplayUtils;
   import §_-8Hp§.§_-5KD§;
   import §_-8i3§.§_-2E0§;
   import §_-AKx§.§_-0jI§;
   import §_-AKx§.§_-2-c§;
   import §_-AKx§.§_-4OH§;
   import §_-AaA§.§_-5Kl§;
   import §_-Bwh§.§_-AMW§;
   import §_-ByP§.§_-0CV§;
   import §_-ByP§.§_-A7b§;
   import §_-GM§.Context;
   import flash.display.DisplayObject;
   import flash.display.Loader;
   import flash.display.LoaderInfo;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.AsyncErrorEvent;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.MouseEvent;
   import flash.events.SecurityErrorEvent;
   import flash.geom.Rectangle;
   import flash.net.URLRequest;
   import flash.system.ApplicationDomain;
   import flash.system.LoaderContext;
   import flash.text.TextField;
   import flash.text.TextFormatAlign;
   
   public class §_-14h§ extends §_-75P§
   {
      private static const §_-9mg§:int = 454;
      
      private static const §_-Aaf§:int = 340;
      
      private var §_-XD§:Loader = null;
      
      private var §_-63v§:DisplayObject = null;
      
      private var §_-8s9§:Sprite = null;
      
      private var §_-AG7§:TextField = null;
      
      private var §_-vi§:Object = null;
      
      public function §_-14h§(param1:§_-0CV§)
      {
         super(param1,494,530,Context.§_-5o8§.message("campaignBuyRoomFurnitureTitle"),"");
         this.§_-vi§ = Context.§_-6fU§.§_-0CD§(this.§_-5b2§());
      }
      
      override public function init() : void
      {
         var bags:MovieClip = null;
         var itemsButton:§_-BCG§ = null;
         var buyButton:§_-B39§ = null;
         var closeDialogButton:BaseButton = null;
         super.init();
         bags = ResourceManager.createMovieClip("CampaignBundle@ui");
         bags.x = 55;
         bags.y = 12;
         addContentOverlay(bags);
         this.§_-AG7§ = §_-5Kl§.createTextField(114,0,Context.§_-5o8§.message("campaignBuyRoomFurnitureMessage"),§_-5Kl§.§_-0iQ§,{
            "width":clientWidth - 154,
            "wordWrap":true,
            "align":TextFormatAlign.CENTER
         });
         addContent(this.§_-AG7§);
         §_-54q§ = 114;
         this.§_-52P§();
         §_-54q§ = 105;
         this.§_-8s9§ = this.§_-3Uv§();
         this.§_-8s9§.y = §_-54q§;
         this.§_-8s9§.x = clientWidth / 2 - this.§_-8s9§.width / 2;
         addContent(this.§_-8s9§);
         try
         {
            this.§_-XD§ = new Loader();
            this.§_-XD§.contentLoaderInfo.addEventListener(Event.COMPLETE,this.§_-0BW§);
            this.§_-XD§.addEventListener(AsyncErrorEvent.ASYNC_ERROR,this.§_-6TK§);
            this.§_-XD§.addEventListener(IOErrorEvent.IO_ERROR,this.§_-8hg§);
            this.§_-XD§.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onSecurityError);
            this.§_-XD§.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,this.§_-8hg§);
            this.§_-XD§.contentLoaderInfo.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onSecurityError);
            this.§_-XD§.load(new URLRequest(campaign.imageUrl),new LoaderContext(true,ApplicationDomain.currentDomain));
         }
         catch(e:Error)
         {
            §_-3YE§.§_-7aK§("***IOErrorEvent*** Couldn\'t load imageUrl " + campaign.imageUrl);
            close();
         }
         §_-54q§ += §_-Aaf§;
         this.§_-9B8§();
         itemsButton = new §_-CVw§(Context.§_-5o8§.message("campaignBuyRoomFurnitureItemListButtonLabel"),110);
         itemsButton.x = this.§_-8s9§.x + this.§_-8s9§.width - itemsButton.width - 15;
         itemsButton.y = this.§_-8s9§.y + 15;
         itemsButton.addEventListener(MouseEvent.CLICK,this.§_-2ou§);
         addContent(itemsButton);
         buyButton = new §_-B39§(Context.§_-5o8§.message("buyButtonTitle"));
         buyButton.addEventListener(MouseEvent.CLICK,this.§_-7Cc§);
         buyButton.x = 45 + clientWidth / 2 - buyButton.width - buyButton.width * 0.1;
         buyButton.y = dialogHeight - buyButton.height * 0.75;
         addContentOverlay(buyButton);
         closeDialogButton = new BaseButton(Context.§_-5o8§.message("closeButtonTitle"));
         closeDialogButton.addEventListener(MouseEvent.CLICK,onCloseClick);
         closeDialogButton.x = 45 + clientWidth / 2 + closeDialogButton.width * 0.1;
         closeDialogButton.y = dialogHeight - closeDialogButton.height * 0.75;
         addContentOverlay(closeDialogButton);
      }
      
      private function §_-2ou§(param1:MouseEvent) : void
      {
         if(this.§_-vi§ != null)
         {
            new §_-0Ne§(this.§_-vi§).showModal();
         }
      }
      
      private function §_-9B8§() : void
      {
         var _loc1_:MovieClip = null;
         var _loc2_:TextField = null;
         var _loc3_:§_-5n7§ = null;
         var _loc5_:§_-5n7§ = null;
         _loc1_ = ResourceManager.createMovieClip("CampaignBundleRibbon@ui");
         _loc1_.x = clientWidth / 2 - _loc1_.width / 2;
         _loc1_.y = §_-54q§ - _loc1_.height / 2 + 10;
         addContent(_loc1_);
         _loc2_ = §_-5Kl§.createTextField(0,_loc1_.y - 35,Context.§_-5o8§.message("campaignBuyRoomFurnitureLabel"),§_-5Kl§.§_-8sp§,{
            "size":20,
            "color":15717946
         });
         _loc2_.x = clientWidth / 2 - _loc2_.width / 2;
         addContent(_loc2_);
         _loc3_ = null;
         var _loc4_:§_-25R§ = this.§_-0ez§();
         if(_loc4_.silver > 0)
         {
            _loc3_ = this.§_-2Fa§(String(_loc4_.silver),"SilverCoinMedium");
            _loc3_.x = _loc1_.width / 2 - _loc3_.width / 2;
            _loc3_.y = 18;
            _loc1_.addChild(_loc3_);
         }
         _loc5_ = null;
         if(_loc4_.gold > 0)
         {
            _loc5_ = this.§_-2Fa§(String(_loc4_.gold),"GoldCoinMedium");
            _loc5_.x = _loc1_.width / 2 - _loc5_.width / 2;
            _loc5_.y = 18;
            _loc1_.addChild(_loc5_);
            if(_loc3_ != null)
            {
               _loc3_.x = _loc1_.width / 2 - (_loc3_.width + _loc5_.width + 10) / 2;
               _loc5_.x = _loc3_.x + _loc3_.width + 10;
            }
         }
         §_-54q§ += _loc1_.height / 2;
      }
      
      private function §_-52P§() : void
      {
         var _loc1_:int = 0;
         var _loc2_:MovieClip = null;
         var _loc3_:MovieClip = null;
         _loc1_ = this.getRating(this.§_-vi§);
         if(_loc1_ <= 0)
         {
            return;
         }
         _loc2_ = ResourceManager.createMovieClip("CampaignBundleHeaderRating@ui");
         _loc2_.x = clientWidth / 2 - _loc2_.width / 2;
         _loc2_.y = §_-54q§ - _loc2_.height - 11;
         _loc3_ = ResourceManager.createMovieClip("HouseRatingBigIcon@ui");
         _loc3_.x = Math.round(_loc2_.width / 2);
         _loc3_.y = 19;
         var _loc4_:TextField = §_-5Kl§.createTextField(0,0,"+" + String(_loc1_),§_-5Kl§.§_-8sp§,{
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
         _loc4_.x = _loc2_.width / 2 - _loc4_.width / 2 - 2;
         _loc4_.y = _loc2_.height / 2 + 2;
         _loc2_.addChild(_loc3_);
         _loc2_.addChild(_loc4_);
         addContent(_loc2_);
      }
      
      private function getRating(param1:Object) : int
      {
         var _loc4_:String = null;
         var _loc2_:int = 0;
         var _loc3_:§_-6f3§ = null;
         for(_loc4_ in param1)
         {
            _loc3_ = Context.§_-70S§.§_-0ZU§().findTypeById(_loc4_) as §_-6f3§;
            _loc2_ += _loc3_.rating * param1[_loc4_];
         }
         return _loc2_;
      }
      
      private function §_-2Fa§(param1:String, param2:String) : §_-5n7§
      {
         var _loc3_:§_-5n7§ = null;
         _loc3_ = new §_-5n7§();
         var _loc4_:TextField = §_-5Kl§.createTextField(0,0,param1,§_-5Kl§.§_-4Jj§);
         var _loc5_:MovieClip = ResourceManager.createMovieClip(param2 + "@ui");
         _loc5_.y = _loc4_.y - 1;
         _loc5_.x = _loc4_.x + _loc4_.width - 6;
         _loc3_.addChild(_loc5_);
         _loc3_.addChild(_loc4_);
         return _loc3_;
      }
      
      private function §_-0ez§() : §_-25R§
      {
         var _loc2_:§_-A7b§ = null;
         var _loc1_:§_-25R§ = new §_-25R§();
         for each(_loc2_ in campaign.campaignItemList)
         {
            if(_loc2_.section == §_-6Jc§.ROOM_FURNITURE_DESIGN_SECTION)
            {
               _loc1_.gold = _loc2_.gold;
               _loc1_.silver = _loc2_.silver;
            }
         }
         if(_loc1_.isEmpty())
         {
            _loc1_ = this.§_-CFc§(this.§_-vi§);
         }
         return _loc1_;
      }
      
      private function §_-CFc§(param1:Object) : §_-25R§
      {
         var _loc4_:String = null;
         var _loc2_:§_-25R§ = new §_-25R§();
         var _loc3_:§_-6f3§ = null;
         for(_loc4_ in param1)
         {
            _loc3_ = Context.§_-70S§.§_-0ZU§().findTypeById(_loc4_) as §_-6f3§;
            _loc2_.add(_loc3_.getPrice(§_-AMW§.§_-85a§).mult(param1[_loc4_]));
         }
         return _loc2_;
      }
      
      private function §_-7Cc§(param1:MouseEvent) : void
      {
         this.§_-5C2§();
      }
      
      private function §_-5C2§() : void
      {
         var paymentService:§_-AMW§;
         var price:§_-25R§;
         var paymentReason:§_-aD§ = new §_-aD§(§_-aD§.§_-264§,this.§_-5b2§());
         paymentReason.context = context;
         paymentService = new §_-AMW§();
         price = this.§_-0ez§();
         if(price.isEmpty() || !paymentService.checkPrice(price,paymentReason))
         {
            return;
         }
         if(this.§_-BUN§())
         {
            return;
         }
         §_-4OH§.confirm(Context.§_-5o8§.message("campaignBuyRoomFurnitureConfirmTitle"),Context.§_-5o8§.message("campaignBuyRoomFurnitureConfirmMessage"),function(param1:§_-2-c§):void
         {
            if(param1.§_-B66§.modalResult == §_-0jI§.§_-9qy§)
            {
               §_-5KD§.instance.§_-71J§(campaign.id);
               close();
            }
         });
      }
      
      private function §_-0BW§(param1:Event) : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         this.§_-63v§ = (param1.target as LoaderInfo).loader;
         if(this.§_-63v§ != null)
         {
            _loc2_ = §_-9mg§ / this.§_-63v§.width;
            _loc3_ = §_-Aaf§ / this.§_-63v§.height;
            _loc4_ = _loc2_ > _loc3_ ? _loc3_ : _loc2_;
            this.§_-63v§.width *= _loc4_;
            this.§_-63v§.height *= _loc4_;
            this.§_-63v§.x = 3 + §_-9mg§ / 2 - this.§_-63v§.width / 2;
            this.§_-63v§.y = 3 + §_-Aaf§ / 2 - this.§_-63v§.height / 2;
            (this.§_-8s9§.getChildByName("containerSprite") as MovieClip).addChild(this.§_-63v§);
            DisplayUtils.§_-36C§(§_-8RM§);
            this.§_-7Zy§();
         }
         else
         {
            close();
         }
      }
      
      private function §_-3Uv§() : Sprite
      {
         var _loc1_:Sprite = new Sprite();
         _loc1_.graphics.lineStyle(4,8625920);
         _loc1_.graphics.drawRoundRect(0,0,§_-9mg§ + 2,§_-Aaf§ + 2,8);
         var _loc2_:MovieClip = new MovieClip();
         _loc2_.x = -1;
         _loc2_.y = -1;
         _loc2_.name = "containerSprite";
         _loc2_.scrollRect = new Rectangle(0,0,§_-9mg§ + 1,§_-Aaf§ + 1);
         _loc1_.addChild(_loc2_);
         return _loc1_;
      }
      
      private function onSecurityError(param1:SecurityErrorEvent) : void
      {
         §_-3YE§.§_-7aK§("***SecurityErrorEvent*** Couldn\'t load imageUrl " + param1.text);
         close();
      }
      
      private function §_-6TK§(param1:AsyncErrorEvent) : void
      {
         §_-3YE§.§_-7aK§("***AsyncErrorEvent*** Couldn\'t load imageUrl " + param1.text);
         close();
      }
      
      private function §_-8hg§(param1:IOErrorEvent) : void
      {
         §_-3YE§.§_-7aK§("***IOErrorEvent*** Couldn\'t load imageUrl " + param1.text);
         close();
      }
      
      override public function destroy() : void
      {
         if(this.§_-XD§ != null)
         {
            this.§_-XD§.contentLoaderInfo.removeEventListener(Event.COMPLETE,this.§_-0BW§);
            this.§_-XD§.removeEventListener(AsyncErrorEvent.ASYNC_ERROR,this.§_-6TK§);
            this.§_-XD§.removeEventListener(IOErrorEvent.IO_ERROR,this.§_-8hg§);
            this.§_-XD§.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onSecurityError);
            this.§_-XD§.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR,this.§_-8hg§);
            this.§_-XD§.contentLoaderInfo.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onSecurityError);
         }
         super.destroy();
      }
      
      override public function canShowDialog() : Boolean
      {
         return !this.§_-BUN§();
      }
      
      private function §_-BUN§() : Boolean
      {
         var _loc1_:int = this.§_-5GN§();
         return _loc1_ > 0 && this.§_-3SP§(this.§_-5b2§()) >= _loc1_;
      }
      
      private function §_-5GN§() : int
      {
         var _loc1_:String = this.§_-BCy§();
         if(_loc1_ == null)
         {
            return 0;
         }
         var _loc2_:Object = §_-6Jc§.§_-ABk§(_loc1_);
         var _loc3_:Object = §_-6Jc§.§_-6qD§(_loc2_,§_-6Jc§.§_-A6b§);
         return _loc3_ != null ? int(_loc3_) : 0;
      }
      
      private function §_-BCy§() : String
      {
         var _loc1_:§_-A7b§ = null;
         for each(_loc1_ in campaign.campaignItemList)
         {
            if(_loc1_.section == §_-6Jc§.ROOM_FURNITURE_DESIGN_PARAMS_SECTION)
            {
               return _loc1_.typeId;
            }
         }
         return null;
      }
      
      private function §_-5b2§() : String
      {
         var _loc1_:§_-A7b§ = null;
         for each(_loc1_ in campaign.campaignItemList)
         {
            if(_loc1_.section == §_-6Jc§.ROOM_FURNITURE_DESIGN_SECTION)
            {
               return _loc1_.typeId;
            }
         }
         return null;
      }
      
      private function §_-3SP§(param1:String) : int
      {
         var _loc3_:§_-2E0§ = null;
         var _loc2_:int = 0;
         for each(_loc3_ in Context.cityPlayer.house.roomList)
         {
            if(_loc3_.id.indexOf(param1) >= 0)
            {
               _loc2_++;
            }
         }
         return _loc2_;
      }
   }
}

