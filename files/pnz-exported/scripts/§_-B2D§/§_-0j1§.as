package §_-B2D§
{
   import §_-0-d§.§_-1Z9§;
   import §_-18o§.§_-4jN§;
   import §_-1Vu§.§_-Awf§;
   import §_-2S7§.§_-4Bb§;
   import §_-2S7§.§_-75P§;
   import §_-2U3§.ResourceManager;
   import §_-3eZ§.BaseButton;
   import §_-40e§.§_-1m0§;
   import §_-6-L§.§_-49j§;
   import §_-6JL§.§_-B9P§;
   import §_-8Hp§.§_-5KD§;
   import §_-8xR§.§_-7q1§;
   import §_-AaA§.§_-5Kl§;
   import §_-Az6§.§_-4ZF§;
   import §_-Az6§.§_-68T§;
   import §_-Az6§.§_-C2d§;
   import §_-Bi2§.§_-Fs§;
   import §_-ByP§.§_-0CV§;
   import §_-ByP§.§_-A7b§;
   import §_-GM§.Context;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   import penzville.Application;
   
   public class §_-0j1§ extends §_-75P§
   {
      private static const §_-2qm§:int = 2;
      
      private static const §_-AbJ§:int = 40;
      
      protected var _heightItem:int = 390;
      
      private var §_-IN§:int = 0;
      
      private var §_-BWZ§:§_-C2d§ = null;
      
      private var §_-8mN§:§_-68T§ = null;
      
      public function §_-0j1§(param1:§_-0CV§)
      {
         super(param1,494,300,Context.§_-5o8§.message("salesDialogTitle"));
      }
      
      public function get tileList() : §_-C2d§
      {
         return this.§_-BWZ§;
      }
      
      override protected function createSkin() : §_-Fs§
      {
         return new §_-4Bb§(true);
      }
      
      override public function init() : void
      {
         var _loc1_:MovieClip = null;
         var _loc3_:BaseButton = null;
         _loc1_ = ResourceManager.createMovieClip("CampaignClothes@ui");
         _loc1_.x = 55;
         _loc1_.y = 12;
         addContentOverlay(_loc1_);
         var _loc2_:TextField = §_-5Kl§.createTextField(120,0,Context.§_-5o8§.message("newSuitBundleDialogMessage"),§_-5Kl§.§_-0iQ§,{
            "width":clientWidth - 140,
            "wordWrap":true
         });
         addContent(_loc2_);
         this.renderItems();
         clientHeight = §_-54q§ + 20;
         _loc3_ = new BaseButton(Context.§_-5o8§.message("closeButtonTitle"));
         _loc3_.addEventListener(MouseEvent.CLICK,onCloseClick);
         _loc3_.x = dialogWidth / 2 - _loc3_.width * 0.35;
         _loc3_.y = dialogHeight - _loc3_.height * 0.75;
         addContentOverlay(_loc3_);
      }
      
      protected function renderItems() : void
      {
         this.§_-6kt§();
         var _loc1_:int = 200;
         var _loc2_:Array = this.§_-Byj§();
         var _loc3_:* = _loc2_.length > §_-2qm§;
         var _loc4_:int = this._heightItem;
         var _loc5_:int = _loc2_.length > 2 ? _loc1_ * 2 : int(_loc1_ * _loc2_.length);
         this.§_-BWZ§ = new §_-C2d§(_loc5_,_loc4_,§_-C2d§.DIRECTION_VERTICAL);
         this.§_-9cs§(_loc2_);
         if(_loc3_)
         {
            this.§_-8mN§ = new §_-68T§(_loc5_,_loc4_,§_-4ZF§.DIRECTION_HORIZONTAL,_loc1_);
            this.§_-8mN§.x = clientWidth / 2 - _loc5_ / 2;
            this.§_-8mN§.y = §_-AbJ§;
            addContent(this.§_-8mN§);
            this.§_-8mN§.addContent(this.§_-BWZ§);
         }
         else
         {
            this.§_-BWZ§.x = clientWidth / 2 - _loc5_ / 2;
            this.§_-BWZ§.y = §_-AbJ§;
            addContent(this.§_-BWZ§);
         }
         §_-54q§ = §_-AbJ§ + _loc4_;
      }
      
      protected function §_-6kt§() : void
      {
         if(this.§_-BWZ§ != null)
         {
            this.§_-BWZ§.removeAllChildren();
            this.§_-BWZ§.destroy();
            this.§_-BWZ§ = null;
         }
         if(this.§_-8mN§ != null)
         {
            this.§_-8mN§.removeAllChildren();
            this.§_-8mN§.destroy();
            this.§_-8mN§ = null;
         }
      }
      
      protected function onInventoryChanged(param1:§_-1m0§) : void
      {
         Application.instance.removeEventListener(§_-1m0§.§_-CGy§,this.onInventoryChanged);
         §_-4jN§.play(§_-4jN§.§_-04j§);
         Context.§_-BlB§.§_-CCK§(new §_-7q1§(Context.§_-5o8§.message("newBundleNotificationTitle"),Context.§_-5o8§.message("buyCompleteMessage")));
         if(!this.canShowDialog())
         {
            close();
            return;
         }
         this.renderItems();
      }
      
      protected function §_-Byj§() : Array
      {
         var _loc4_:Array = null;
         var _loc5_:§_-A7b§ = null;
         var _loc6_:Array = null;
         var _loc7_:String = null;
         var _loc8_:Boolean = false;
         var _loc9_:Boolean = false;
         var _loc10_:Object = null;
         var _loc1_:Object = {};
         var _loc2_:int = 0;
         while(_loc2_ < campaign.campaignItemList.length)
         {
            _loc5_ = campaign.campaignItemList[_loc2_];
            if(this.validateItem(_loc5_))
            {
               _loc6_ = _loc5_.typeId.split(":");
               _loc7_ = _loc6_.length > 1 ? _loc6_[1] : null;
               _loc8_ = Context.cityPlayer.§_-2dL§(_loc6_[0],_loc7_);
               if(_loc1_.hasOwnProperty(String(_loc5_.section)))
               {
                  §_-49j§.merge(_loc1_[_loc5_.section],[{
                     "typeId":_loc5_.typeId,
                     "gold":(!_loc8_ ? _loc5_.gold : 0),
                     "silver":(!_loc8_ ? _loc5_.silver : 0),
                     "section":_loc5_.section
                  }]);
               }
               else
               {
                  _loc1_[_loc5_.section] = [{
                     "typeId":_loc5_.typeId,
                     "gold":(!_loc8_ ? _loc5_.gold : 0),
                     "silver":(!_loc8_ ? _loc5_.silver : 0),
                     "section":_loc5_.section
                  }];
               }
            }
            _loc2_++;
         }
         var _loc3_:Array = [];
         for each(_loc4_ in _loc1_)
         {
            _loc9_ = false;
            for each(_loc10_ in _loc4_)
            {
               if(_loc10_["gold"] > 0 || _loc10_["silver"] > 0)
               {
                  _loc9_ = true;
                  break;
               }
            }
            if(_loc9_)
            {
               _loc3_.push(_loc4_);
            }
         }
         return _loc3_;
      }
      
      protected function §_-9cs§(param1:Array) : void
      {
         var _loc2_:Array = null;
         var _loc3_:§_-1Z9§ = null;
         for each(_loc2_ in param1)
         {
            _loc3_ = new §_-1Z9§(_loc2_,context,200,this._heightItem);
            _loc3_.addEventListener(§_-B9P§.SELECTED,this.onSelected);
            this.tileList.addItem(_loc3_);
         }
      }
      
      protected function onSelected(param1:§_-B9P§) : void
      {
         var _loc2_:Object = param1.value;
         if(!_loc2_.hasOwnProperty("section"))
         {
            return;
         }
         this.§_-IN§ = _loc2_["section"];
         Application.instance.addEventListener(§_-1m0§.§_-CGy§,this.onInventoryChanged);
         §_-5KD§.instance.§_-2f1§(campaign.id,_loc2_["section"]);
      }
      
      override protected function validateItem(param1:§_-A7b§) : Boolean
      {
         var _loc2_:Array = param1.typeId.split(":");
         var _loc3_:§_-Awf§ = Context.§_-70S§.§_-0ZU§().findTypeById(_loc2_[0]) as §_-Awf§;
         return _loc3_ != null && _loc3_.canBuy && _loc3_.gender == Context.cityPlayer.avatarAppearance.gender;
      }
      
      override public function canShowDialog() : Boolean
      {
         var _loc1_:§_-A7b§ = null;
         var _loc2_:Array = null;
         var _loc3_:String = null;
         for each(_loc1_ in campaign.campaignItemList)
         {
            if(this.validateItem(_loc1_))
            {
               _loc2_ = _loc1_.typeId.split(":");
               _loc3_ = _loc2_.length > 1 ? _loc2_[1] : null;
               if(!Context.cityPlayer.§_-2dL§(_loc2_[0],_loc3_))
               {
                  return true;
               }
            }
         }
         return false;
      }
   }
}

