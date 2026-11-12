package §_-B2D§
{
   import §_-0-d§.§_-0KF§;
   import §_-0CA§.§_-CU6§;
   import §_-0yZ§.§_-aD§;
   import §_-2S7§.§_-4Bb§;
   import §_-2S7§.§_-75P§;
   import §_-2U3§.ResourceManager;
   import §_-3eZ§.BaseButton;
   import §_-40e§.§_-1m0§;
   import §_-5Us§.§_-2o6§;
   import §_-5Us§.§_-AyA§;
   import §_-6JL§.§_-B9P§;
   import §_-AaA§.§_-5Kl§;
   import §_-Az6§.§_-4ZF§;
   import §_-Az6§.§_-68T§;
   import §_-Az6§.§_-C2d§;
   import §_-Bi2§.§_-Fs§;
   import §_-Bwh§.§_-AMW§;
   import §_-ByP§.§_-0CV§;
   import §_-ByP§.§_-A7b§;
   import §_-GM§.Context;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   import penzville.Application;
   
   public class §_-CYu§ extends §_-75P§
   {
      private static const §_-2qm§:int = 2;
      
      private static const §_-AbJ§:int = 60;
      
      private var §_-BWZ§:§_-C2d§;
      
      private var §_-8mN§:§_-68T§ = null;
      
      public function §_-CYu§(param1:§_-0CV§)
      {
         super(param1,494,300,Context.§_-5o8§.message("newHairsDialogTitle"));
      }
      
      override protected function createSkin() : §_-Fs§
      {
         return new §_-4Bb§(true);
      }
      
      override public function init() : void
      {
         var _loc1_:MovieClip = null;
         var _loc3_:BaseButton = null;
         super.init();
         _loc1_ = ResourceManager.createMovieClip("CampaignClothes@ui");
         _loc1_.x = 55;
         _loc1_.y = 12;
         addContentOverlay(_loc1_);
         var _loc2_:TextField = §_-5Kl§.createTextField(120,0,Context.§_-5o8§.message("newHairsDialogMessage"),§_-5Kl§.§_-0iQ§,{
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
      
      private function renderItems() : void
      {
         this.§_-6kt§();
         var _loc1_:int = 200;
         var _loc2_:int = 350;
         var _loc3_:Array = this.§_-Byj§();
         var _loc4_:* = _loc3_.length > §_-2qm§;
         var _loc5_:int = _loc2_;
         var _loc6_:int = _loc3_.length > 2 ? _loc1_ * 2 : int(_loc1_ * _loc3_.length);
         this.§_-BWZ§ = new §_-C2d§(_loc6_,_loc5_,§_-C2d§.DIRECTION_VERTICAL);
         this.§_-9cs§(_loc3_);
         if(_loc4_)
         {
            this.§_-8mN§ = new §_-68T§(_loc6_,_loc5_,§_-4ZF§.DIRECTION_HORIZONTAL,_loc1_);
            this.§_-8mN§.x = clientWidth / 2 - _loc6_ / 2;
            this.§_-8mN§.y = §_-AbJ§;
            addContent(this.§_-8mN§);
            this.§_-8mN§.addContent(this.§_-BWZ§);
         }
         else
         {
            this.§_-BWZ§.x = clientWidth / 2 - _loc6_ / 2;
            this.§_-BWZ§.y = §_-AbJ§;
            addContent(this.§_-BWZ§);
         }
         §_-54q§ = §_-AbJ§ + _loc5_;
      }
      
      private function §_-Byj§() : Array
      {
         var _loc2_:§_-A7b§ = null;
         var _loc1_:Array = [];
         for each(_loc2_ in campaign.campaignItemList)
         {
            if(this.validateItem(_loc2_))
            {
               switch(_loc2_.section)
               {
                  case §_-CU6§.HAIR:
                     _loc1_.push(Context.§_-6vd§.getCategory(§_-2o6§.HAIR,Context.cityPlayer.avatarAppearance.gender).getItem(int(_loc2_.typeId)));
                     break;
                  case §_-CU6§.BEARD:
                     _loc1_.push(Context.§_-6vd§.getCategory(§_-2o6§.BEARD,Context.cityPlayer.avatarAppearance.gender).getItem(int(_loc2_.typeId)));
               }
            }
         }
         return _loc1_;
      }
      
      private function §_-9cs§(param1:Array) : void
      {
         var _loc2_:§_-AyA§ = null;
         var _loc3_:§_-0KF§ = null;
         for each(_loc2_ in param1)
         {
            _loc3_ = new §_-0KF§(_loc2_);
            _loc3_.addEventListener(§_-B9P§.SELECTED,this.onSelected);
            this.§_-BWZ§.addItem(_loc3_);
         }
      }
      
      private function onSelected(param1:§_-B9P§) : void
      {
         var _loc2_:§_-AyA§ = param1.value as §_-AyA§;
         var _loc3_:§_-aD§ = new §_-aD§(_loc2_.§_-7Eh§ ? §_-aD§.§_-1p6§ : §_-aD§.§_-1td§);
         _loc3_.context = context;
         var _loc4_:§_-AMW§ = new §_-AMW§();
         if(_loc2_.price != null && !_loc2_.price.isEmpty() && !_loc4_.checkPrice(_loc2_.price,_loc3_))
         {
            return;
         }
         if(_loc2_.category.id == §_-2o6§.HAIR)
         {
            Context.player.avatarAppearance.§_-5ES§ = _loc2_.id;
         }
         if(_loc2_.category.id == §_-2o6§.BEARD)
         {
            Context.player.avatarAppearance.§_-2Q2§ = _loc2_.id;
         }
         Application.instance.addEventListener(§_-1m0§.§_-9FD§,this.§_-9jD§);
         Context.§_-2m2§.saveAvatarAppearance(Context.player.avatarAppearance);
      }
      
      private function §_-9jD§(param1:§_-1m0§) : void
      {
         Application.instance.removeEventListener(§_-1m0§.§_-9FD§,this.§_-9jD§);
         if(!this.canShowDialog())
         {
            close();
            return;
         }
         this.renderItems();
      }
      
      private function §_-6kt§() : void
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
      
      override public function destroy() : void
      {
         if(destroyed)
         {
            return;
         }
         this.§_-6kt§();
         super.destroy();
      }
      
      override protected function validateItem(param1:§_-A7b§) : Boolean
      {
         var _loc2_:§_-AyA§ = null;
         switch(param1.section)
         {
            case §_-CU6§.HAIR:
               _loc2_ = Context.§_-6vd§.getCategory(§_-2o6§.HAIR,Context.cityPlayer.avatarAppearance.gender).getItem(int(param1.typeId));
               if(_loc2_ != null && _loc2_.canBuy && !_loc2_.§_-wn§ && _loc2_.kind != Context.cityPlayer.avatarAppearance.hairsItem.kind)
               {
                  return true;
               }
               break;
            case §_-CU6§.BEARD:
               _loc2_ = Context.§_-6vd§.getCategory(§_-2o6§.BEARD,Context.cityPlayer.avatarAppearance.gender).getItem(int(param1.typeId));
               if(_loc2_ != null && _loc2_.canBuy && !_loc2_.§_-wn§ && _loc2_.kind != Context.cityPlayer.avatarAppearance.beardItem.kind)
               {
                  return true;
               }
               break;
         }
         return false;
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
   }
}

