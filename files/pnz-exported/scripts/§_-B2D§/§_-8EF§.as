package §_-B2D§
{
   import §_-0-d§.§_-2jb§;
   import §_-0CA§.§_-01h§;
   import §_-0XH§.§_-8dk§;
   import §_-0yZ§.§_-aD§;
   import §_-1Fx§.§_-5n7§;
   import §_-2S7§.§_-75P§;
   import §_-2U3§.ResourceManager;
   import §_-3eZ§.BaseButton;
   import §_-40e§.§_-1m0§;
   import §_-4Q1§.§_-5Ia§;
   import §_-52p§.§_-25R§;
   import §_-5Us§.§_-1Dh§;
   import §_-5Us§.§_-AyA§;
   import §_-62k§.§_-2oh§;
   import §_-6EN§.§_-BjY§;
   import §_-6JL§.§_-B9P§;
   import §_-9VF§.§_-5ab§;
   import §_-AWc§.§_-1aX§;
   import §_-AaA§.§_-5Kl§;
   import §_-AaA§.§_-EP§;
   import §_-Az6§.§_-4ZF§;
   import §_-Az6§.§_-68T§;
   import §_-Az6§.§_-C2d§;
   import §_-Bwh§.§_-AMW§;
   import §_-ByP§.§_-0CV§;
   import §_-ByP§.§_-A7b§;
   import §_-COu§.§_-6CP§;
   import §_-GM§.Context;
   import §_-MZ§.§_-7zb§;
   import §_-zA§.§_-9ic§;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.text.TextField;
   import flash.utils.Timer;
   import penzville.Application;
   
   public class §_-8EF§ extends §_-75P§
   {
      private static const §_-CYb§:int = 2;
      
      private static const §_-2jR§:int = 3;
      
      private static const §_-7Q7§:int = 50;
      
      private static const §_-4Pd§:int = 75;
      
      private static const §_-BAH§:int = 84;
      
      private static const §_-6R9§:int = 115;
      
      private static const §_-0rN§:int = 382;
      
      private static const §_-6Ce§:Number = 0.35;
      
      private static const §_-1RW§:Number = 0.75;
      
      private static const §_-55A§:int = 3;
      
      private static const §_-3XX§:int = 2000;
      
      private var _buttons:Array = [];
      
      private var _timer:Timer = null;
      
      private var _player:§_-5ab§ = null;
      
      private var §_-34§:§_-1aX§ = null;
      
      private var §_-7ys§:§_-5n7§ = null;
      
      private var _colorSelect:§_-6CP§ = null;
      
      private var §_-B4H§:BaseButton = null;
      
      private var §_-4ng§:BaseButton = null;
      
      private var §_-BWZ§:§_-C2d§ = null;
      
      private var _scrollBox:§_-68T§ = null;
      
      private var §_-4hN§:int = 0;
      
      private var §_-0lf§:Array = [];
      
      public function §_-8EF§(param1:§_-0CV§)
      {
         super(param1,494,490,Context.§_-5o8§.message("newHairsDialogTitle"));
      }
      
      override public function init() : void
      {
         var _loc1_:MovieClip = null;
         super.init();
         _loc1_ = ResourceManager.createMovieClip("CampaignClothes@ui");
         _loc1_.x = 55;
         _loc1_.y = 12;
         addContentOverlay(_loc1_);
         var _loc2_:TextField = §_-5Kl§.createTextField(120,0,Context.§_-5o8§.message("newAppearanceDialogMessage"),§_-5Kl§.§_-0iQ§,{
            "width":clientWidth - 140,
            "wordWrap":true
         });
         addContent(_loc2_);
         this.renderTileList();
         this.§_-iO§();
         this.§_-4ng§ = new BaseButton(Context.§_-5o8§.message("closeButtonTitle"));
         this.§_-4ng§.addEventListener(MouseEvent.CLICK,onCloseClick);
         this.§_-4ng§.x = dialogWidth / 2 - this.§_-4ng§.width * §_-6Ce§;
         this.§_-4ng§.y = dialogHeight - this.§_-4ng§.height * §_-1RW§;
         addContentOverlay(this.§_-4ng§);
      }
      
      private function §_-80y§(param1:§_-B9P§) : void
      {
         var _loc5_:§_-2jb§ = null;
         var _loc6_:Array = null;
         var _loc7_:Boolean = false;
         var _loc8_:§_-1Dh§ = null;
         var _loc2_:§_-2jb§ = param1.value as §_-2jb§;
         var _loc3_:int = 0;
         var _loc4_:int = 1;
         if(_loc2_.selected)
         {
            _loc3_ = Context.player.avatarAppearance.getPartTypeByCategory(_loc2_.item.category.id);
            _loc4_ = Context.player.avatarAppearance.getColorIndexByCategory(_loc2_.item.category.id);
            this._colorSelect.visible = false;
         }
         else
         {
            for each(_loc5_ in this._buttons)
            {
               if(_loc5_.item.category.id == _loc2_.item.category.id)
               {
                  _loc5_.selected = false;
               }
            }
            this.§_-4hN§ = _loc2_.item.category.id;
            _loc3_ = int(_loc2_.item.id);
            _loc4_ = this.§_-19i§(_loc2_.item.category.id);
            this._colorSelect.visible = true;
         }
         _loc2_.selected = !_loc2_.selected;
         if(this._colorSelect.visible)
         {
            _loc6_ = _loc2_.item.visagistLevel > 0 ? Context.§_-6vd§.§_-BeD§(_loc2_.item.category.id,Context.player.avatarAppearance.gender) : Context.§_-6vd§.§_-C85§(_loc2_.item.category.id,Context.player.avatarAppearance.gender,_loc2_.item.§_-7Eh§);
            this._colorSelect.updateColors(_loc6_,Context.player.avatarAppearance.getColorIndexByCategory(_loc2_.item.category.id));
            _loc7_ = false;
            for each(_loc8_ in _loc6_)
            {
               if(_loc8_.index == _loc4_)
               {
                  _loc7_ = true;
                  break;
               }
            }
            if(!_loc7_)
            {
               _loc4_ = 1;
            }
            if(this._colorSelect.§_-9vz§ > 4)
            {
               this._colorSelect.x = this.§_-34§.x - this._colorSelect.width / 2;
            }
            else
            {
               this._colorSelect.x = this.§_-34§.x - 25;
            }
            this._colorSelect.y = §_-BAH§ - this._colorSelect.height / 2;
         }
         this._player.avatarAppearance.setPartTypeByCategory(_loc2_.item.category.id,_loc3_);
         this._player.avatarAppearance.setColorIndexByCategory(_loc2_.item.category.id,_loc4_);
         this.§_-34§.updatePlayer(this._player);
         this.§_-AY§(this.§_-8rL§());
      }
      
      private function §_-00k§(param1:§_-8dk§) : void
      {
         if(!(param1.tag is §_-1Dh§))
         {
            return;
         }
         var _loc2_:§_-1Dh§ = param1.tag as §_-1Dh§;
         this._player.avatarAppearance.setColorIndexByCategory(this.§_-4hN§,_loc2_.index);
         this.§_-34§.updatePlayer(this._player);
         this.§_-CAF§(this.§_-4hN§,_loc2_.index);
      }
      
      private function onBuyButtonClick(param1:MouseEvent) : void
      {
         var _loc3_:§_-2jb§ = null;
         this.§_-6Hu§();
         if(Context.§_-2m2§ == null)
         {
            return;
         }
         var _loc2_:§_-AyA§ = null;
         for each(_loc3_ in this._buttons)
         {
            if(_loc3_.selected)
            {
               _loc2_ = _loc3_.item;
               break;
            }
         }
         if(_loc2_ == null)
         {
            return;
         }
         var _loc4_:§_-aD§ = new §_-aD§(_loc2_.§_-7Eh§ ? §_-aD§.§_-1p6§ : §_-aD§.§_-1td§);
         var _loc5_:§_-AMW§ = new §_-AMW§();
         var _loc6_:§_-25R§ = new §_-25R§(_loc2_.gold,_loc2_.silver);
         if(_loc6_.isEmpty() || !_loc5_.checkPrice(_loc6_,_loc4_))
         {
            return;
         }
         Context.player.avatarAppearance = this._player.avatarAppearance;
         Application.instance.addEventListener(§_-1m0§.§_-9FD§,this.onAvatarChanged);
         Context.§_-2m2§.saveAvatarAppearance(this._player.avatarAppearance);
      }
      
      private function onAvatarChanged(param1:§_-1m0§) : void
      {
         close();
         new §_-8EF§(campaign).showModal();
      }
      
      private function §_-8sy§(param1:TimerEvent) : void
      {
         var _loc2_:§_-2jb§ = null;
         this.§_-lx§();
         for each(_loc2_ in this._buttons)
         {
            if(_loc2_.selected)
            {
               this.§_-B4H§.disabled = false;
               break;
            }
         }
      }
      
      private function §_-6Hu§() : void
      {
         this.§_-lx§();
         this._timer = new Timer(§_-3XX§);
         this._timer.addEventListener(TimerEvent.TIMER,this.§_-8sy§);
         this._timer.start();
         this.§_-B4H§.disabled = true;
      }
      
      private function §_-lx§() : void
      {
         if(this._timer == null)
         {
            return;
         }
         this._timer.removeEventListener(TimerEvent.TIMER,this.§_-8sy§);
         this._timer.stop();
         this._timer = null;
      }
      
      private function renderTileList() : void
      {
         var _loc5_:§_-AyA§ = null;
         var _loc6_:§_-2jb§ = null;
         var _loc1_:Array = this.getItems();
         var _loc2_:* = _loc1_.length > §_-CYb§ * §_-2jR§;
         var _loc3_:int = §_-2jb§.§_-621§ * §_-2jR§;
         var _loc4_:int = §_-2jb§.WIDTH * §_-CYb§ + §_-55A§;
         this.§_-BWZ§ = new §_-C2d§(_loc4_,_loc3_,§_-C2d§.DIRECTION_VERTICAL,§_-55A§);
         for each(_loc5_ in _loc1_)
         {
            _loc6_ = new §_-2jb§(_loc5_);
            _loc6_.addEventListener(§_-B9P§.SELECTED,this.§_-80y§);
            this._buttons.push(_loc6_);
            this.§_-BWZ§.addItem(_loc6_);
         }
         if(_loc2_)
         {
            this._scrollBox = new §_-68T§(_loc4_,_loc3_ + 10,§_-4ZF§.DIRECTION_HORIZONTAL,§_-2jb§.WIDTH + §_-55A§);
            this._scrollBox.x = §_-7Q7§;
            this._scrollBox.y = §_-4Pd§ - this._scrollBox.height / 2;
            addContent(this._scrollBox);
            this._scrollBox.addContent(this.§_-BWZ§);
            §_-54q§ += this._scrollBox.y + this._scrollBox.height;
         }
         else
         {
            if(_loc1_.length <= §_-2jR§)
            {
               this.§_-BWZ§.x = §_-7Q7§ + §_-2jb§.WIDTH / §_-CYb§;
            }
            else
            {
               this.§_-BWZ§.x = §_-7Q7§;
            }
            if(_loc1_.length < §_-2jR§)
            {
               this.§_-BWZ§.y = §_-4Pd§ * (§_-2jR§ - _loc1_.length + 1);
            }
            else
            {
               this.§_-BWZ§.y = §_-4Pd§ - this.§_-BWZ§.height / 2;
            }
            addContent(this.§_-BWZ§);
            §_-54q§ += this.§_-BWZ§.y + this.§_-BWZ§.height;
         }
      }
      
      private function §_-6kt§() : void
      {
         var _loc1_:§_-2jb§ = null;
         if(this._buttons != null)
         {
            for each(_loc1_ in this._buttons)
            {
               if(_loc1_ != null)
               {
                  _loc1_.removeEventListener(§_-B9P§.SELECTED,this.§_-80y§);
                  _loc1_.destroy();
                  _loc1_ = null;
               }
            }
            this._buttons = null;
         }
         if(this.§_-BWZ§ != null)
         {
            this.§_-BWZ§.destroy();
            this.§_-BWZ§ = null;
         }
         if(this._scrollBox != null)
         {
            this._scrollBox.destroy();
            this._scrollBox = null;
         }
      }
      
      private function §_-iO§() : void
      {
         this._player = Context.player.cloneFast();
         this._player.avatarClothes.removeClothesByCategory(§_-BjY§.§_-AJh§);
         this._player.avatarClothes.removeClothesByCategory(§_-BjY§.§_-3tZ§);
         this.§_-34§ = new §_-1aX§(this._player,true);
         this.§_-34§.updateAvatar();
         this.§_-34§.x = clientWidth - §_-6R9§ - 10;
         this.§_-34§.y = §_-0rN§;
         addContent(this.§_-34§);
         this._colorSelect = new §_-6CP§(9,11,6,true,14);
         this._colorSelect.x = §_-6R9§ + this._colorSelect.width / 2;
         this._colorSelect.y = §_-BAH§ - this._colorSelect.height / 2;
         this._colorSelect.addEventListener(§_-8dk§.§_-NP§,this.§_-00k§);
         this._colorSelect.visible = false;
         addContent(this._colorSelect);
         this.§_-B4H§ = new BaseButton(Context.§_-5o8§.message("buyButtonTitle"));
         this.§_-B4H§.disabled = true;
         this.§_-B4H§.x = this.§_-34§.x - this.§_-B4H§.width / 2;
         this.§_-B4H§.y = this.§_-34§.y + 60;
         this.§_-B4H§.addEventListener(MouseEvent.CLICK,this.onBuyButtonClick);
         addContent(this.§_-B4H§);
      }
      
      private function getItems() : Array
      {
         var _loc2_:§_-A7b§ = null;
         var _loc1_:Array = [];
         if(campaign.campaignItemList == null)
         {
            return _loc1_;
         }
         for each(_loc2_ in campaign.campaignItemList)
         {
            if(_loc2_ != null)
            {
               if(this.validateItem(_loc2_))
               {
                  _loc1_.push(this.getAppearanceItem(_loc2_));
               }
            }
         }
         return _loc1_;
      }
      
      private function §_-AY§(param1:§_-25R§) : void
      {
         var _loc3_:§_-EP§ = null;
         var _loc4_:§_-EP§ = null;
         this.§_-Atu§();
         if(param1.isEmpty())
         {
            this.§_-B4H§.disabled = true;
            return;
         }
         if(this.§_-7ys§ == null)
         {
            this.§_-7ys§ = new §_-5n7§();
            addContent(this.§_-7ys§);
         }
         var _loc2_:int = 0;
         if(param1.silver > 0)
         {
            _loc3_ = new §_-EP§(param1.silver,§_-9ic§.§_-Se§);
            _loc3_.x = _loc2_;
            _loc3_.y = 0;
            this.§_-7ys§.addChild(_loc3_);
            _loc2_ += _loc3_.width;
         }
         if(param1.gold > 0)
         {
            _loc4_ = new §_-EP§(param1.gold,§_-9ic§.§_-2qq§);
            _loc4_.x = _loc2_;
            _loc4_.y = 0;
            this.§_-7ys§.addChild(_loc4_);
         }
         this.§_-7ys§.x = this.§_-34§.x - this.§_-7ys§.width / 2;
         this.§_-7ys§.y = this.§_-34§.y + 30;
         this.§_-B4H§.disabled = false;
      }
      
      private function §_-Atu§() : void
      {
         if(this.§_-7ys§ == null)
         {
            return;
         }
         this.§_-7ys§.removeAllChildren(true,false);
      }
      
      private function §_-CAF§(param1:int, param2:int) : void
      {
         var _loc4_:Object = null;
         var _loc5_:int = 0;
         var _loc3_:Boolean = false;
         for each(_loc4_ in this.§_-0lf§)
         {
            _loc5_ = _loc4_["category"] as int;
            if(_loc5_ == param1)
            {
               _loc3_ = true;
               _loc4_["color"] = param2;
               break;
            }
         }
         if(_loc3_)
         {
            return;
         }
         this.§_-0lf§.push({
            "category":param1,
            "color":param2
         });
      }
      
      private function §_-19i§(param1:int) : int
      {
         var _loc2_:Object = null;
         var _loc3_:int = 0;
         for each(_loc2_ in this.§_-0lf§)
         {
            _loc3_ = _loc2_["category"] as int;
            if(_loc3_ == param1)
            {
               return _loc2_["color"] as int;
            }
         }
         return 1;
      }
      
      override protected function validateItem(param1:§_-A7b§) : Boolean
      {
         var _loc3_:§_-7zb§ = null;
         var _loc2_:§_-AyA§ = this.getAppearanceItem(param1);
         if(_loc2_ == null)
         {
            return false;
         }
         if(!_loc2_.canBuy)
         {
            return false;
         }
         if(_loc2_.§_-9KE§)
         {
            return false;
         }
         if(_loc2_.§_-7Eh§)
         {
            _loc3_ = Context.§_-BFW§.§_-4Bq§(§_-5Ia§.§_-7kN§);
            if(_loc3_ == null || _loc3_.§_-ML§ == null || Context.cityPlayer.cityInfo.level < _loc3_.§_-ML§.minLevel)
            {
               return false;
            }
         }
         if(_loc2_.§_-AvQ§ && !Context.cityPlayer.cityInfo.§_-4oU§)
         {
            return false;
         }
         if(Context.player.avatarAppearance.getPartItemByCategory(§_-01h§.§_-6NE§(param1.section)).kind == _loc2_.kind)
         {
            return false;
         }
         if(_loc2_.gender != Context.player.avatarAppearance.gender)
         {
            return false;
         }
         return true;
      }
      
      override public function canShowDialog() : Boolean
      {
         var _loc1_:§_-A7b§ = null;
         if(campaign.campaignItemList == null)
         {
            return false;
         }
         for each(_loc1_ in campaign.campaignItemList)
         {
            if(this.validateItem(_loc1_))
            {
               return true;
            }
         }
         return false;
      }
      
      private function getAppearanceItem(param1:§_-A7b§) : §_-AyA§
      {
         var _loc2_:int = §_-01h§.§_-6NE§(param1.section);
         var _loc3_:§_-2oh§ = Context.§_-6vd§.getCategory(_loc2_,Context.player.avatarAppearance.gender);
         if(_loc3_ == null)
         {
            return null;
         }
         return _loc3_.getItem(int(param1.typeId));
      }
      
      private function §_-8rL§() : §_-25R§
      {
         var _loc2_:§_-2jb§ = null;
         var _loc1_:§_-25R§ = new §_-25R§();
         for each(_loc2_ in this._buttons)
         {
            if(_loc2_.selected)
            {
               _loc1_.gold += _loc2_.item.gold;
               _loc1_.silver += _loc2_.item.silver;
            }
         }
         return _loc1_;
      }
      
      override public function destroy() : void
      {
         if(destroyed)
         {
            return;
         }
         this.§_-6kt§();
         if(this.§_-B4H§ != null)
         {
            this.§_-B4H§.removeEventListener(MouseEvent.CLICK,this.onBuyButtonClick);
            this.§_-B4H§.destroy();
            this.§_-B4H§ = null;
         }
         if(this.§_-4ng§ != null)
         {
            this.§_-4ng§.removeEventListener(MouseEvent.CLICK,onCloseClick);
            this.§_-4ng§.destroy();
            this.§_-4ng§ = null;
         }
         if(this._colorSelect != null)
         {
            this._colorSelect.removeEventListener(§_-8dk§.§_-NP§,this.§_-00k§);
            this._colorSelect.destroy();
            this._colorSelect = null;
         }
         if(this._timer != null)
         {
            this._timer.removeEventListener(TimerEvent.TIMER_COMPLETE,this.§_-8sy§);
            this._timer = null;
         }
         if(this.§_-7ys§ != null)
         {
            this.§_-7ys§.destroy();
            this.§_-7ys§ = null;
         }
         this._player = null;
         this.§_-0lf§ = null;
         Application.instance.removeEventListener(§_-1m0§.§_-9FD§,this.onAvatarChanged);
         super.destroy();
      }
   }
}

