package §_-B2D§
{
   import §_-0-d§.§_-3Wh§;
   import §_-0CA§.§_-BsT§;
   import §_-0XH§.§_-8dk§;
   import §_-0yZ§.§_-aD§;
   import §_-1Fx§.§_-5n7§;
   import §_-1Vu§.ClothesSetItem;
   import §_-1Vu§.§_-Awf§;
   import §_-2S7§.§_-75P§;
   import §_-2U3§.ResourceManager;
   import §_-3eZ§.§_-7Oo§;
   import §_-3eZ§.§_-BCG§;
   import §_-3eZ§.§_-Bab§;
   import §_-3ft§.§_-BuJ§;
   import §_-40e§.§_-1m0§;
   import §_-52p§.§_-8jF§;
   import §_-5Us§.§_-1Dh§;
   import §_-6EN§.§_-BjY§;
   import §_-8xR§.§_-7q1§;
   import §_-95S§.§_-9E8§;
   import §_-99s§.§_-7Tj§;
   import §_-9VF§.§_-48g§;
   import §_-AKx§.§_-5Nu§;
   import §_-AOz§.AvatarClothesItem;
   import §_-AOz§.§_-4aX§;
   import §_-AWc§.§_-1aX§;
   import §_-AaA§.§_-5Kl§;
   import §_-Az6§.§_-0od§;
   import §_-Bi2§.§_-Fs§;
   import §_-Bwh§.§_-AMW§;
   import §_-ByP§.§_-0CV§;
   import §_-ByP§.§_-A7b§;
   import §_-COu§.§_-6CP§;
   import §_-Cc8§.§_-Az0§;
   import §_-GM§.Context;
   import §_-on§.§_-2P5§;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormatAlign;
   import penzville.Application;
   
   public class §_-67s§ extends §_-75P§ implements §_-5Nu§
   {
      private static const §_-r-§:int = 698;
      
      private static const §_-83j§:int = 505;
      
      private static const §_-1gb§:int = 262;
      
      private static const §_-3Et§:int = 385;
      
      private static const §_-8WH§:int = 405;
      
      private static const §_-3eO§:int = 50;
      
      private static const §_-3uL§:int = 30;
      
      private static const §_-8k8§:int = 70;
      
      private static const §_-7oR§:int = 105;
      
      private static const COLOR_SELECT_PANEL_X_POSITION:int = 50;
      
      private static const COLOR_SELECT_PANEL_Y_POSITION:int = 10;
      
      private static const §_-0Pf§:int = 20;
      
      private var §_-BHt§:§_-4aX§ = null;
      
      private var §_-34§:§_-1aX§ = null;
      
      private var _infoPanel:§_-5n7§ = null;
      
      private var _colorSelect:§_-6CP§ = null;
      
      private var §_-6eo§:§_-0od§ = null;
      
      private var §_-B4H§:§_-7Oo§ = null;
      
      private var _selectedItem:Object = null;
      
      private var §_-AaZ§:Array = null;
      
      private var §_-5Ji§:TextField = null;
      
      private var §_-Bvw§:int = 0;
      
      private var §_-SA§:§_-BCG§ = null;
      
      private var §_-682§:§_-BCG§ = null;
      
      public function §_-67s§(param1:§_-0CV§)
      {
         super(param1,§_-r-§,§_-83j§,Context.§_-5o8§.message(this.§_-0Li§(param1)));
      }
      
      override public function init() : void
      {
         super.init();
         if(this.§_-A7L§)
         {
            this.createButtons();
         }
         this.createAvatarView();
         this.createInfoPanel();
      }
      
      public function get §_-BsP§() : Point
      {
         return new Point(0,§_-0Pf§);
      }
      
      private function createButtons() : void
      {
         if(this.clothesSets.length == 1)
         {
            return;
         }
         this.§_-SA§ = new §_-BCG§(ResourceManager.createMovieClip("ShoppingCartLeftArrowAsset@ui"));
         this.§_-SA§.x = 168;
         this.§_-SA§.y = 270;
         this.§_-SA§.disabled = this.§_-Bvw§ <= 0;
         this.§_-SA§.addEventListener(MouseEvent.CLICK,this.§_-AHH§);
         addChild(this.§_-SA§);
         this.§_-682§ = new §_-BCG§(ResourceManager.createMovieClip("ShoppingCartRightArrowAsset@ui"));
         this.§_-682§.x = 355;
         this.§_-682§.y = 270;
         this.§_-682§.disabled = this.§_-Bvw§ >= this.clothesSets.length - 1;
         this.§_-682§.addEventListener(MouseEvent.CLICK,this.§_-3kQ§);
         addChild(this.§_-682§);
      }
      
      private function §_-AHH§(param1:MouseEvent) : void
      {
         if(this.§_-Bvw§ > 0)
         {
            --this.§_-Bvw§;
         }
         this.update();
      }
      
      private function §_-3kQ§(param1:MouseEvent) : void
      {
         if(this.§_-Bvw§ < this.clothesSets.length - 1)
         {
            ++this.§_-Bvw§;
         }
         this.update();
      }
      
      private function update() : void
      {
         this.§_-ApI§();
         if(this.§_-SA§ != null && this.§_-682§ != null)
         {
            this.§_-SA§.disabled = this.§_-Bvw§ <= 0;
            this.§_-682§.disabled = this.§_-Bvw§ >= this.clothesSets.length - 1;
         }
         this.§_-6vZ§();
      }
      
      private function createAvatarView() : void
      {
         var _loc1_:§_-5n7§ = null;
         this.§_-BHt§ = Context.player.avatarClothes.clone();
         this.§_-34§ = new §_-97t§(Context.player,true,null,false);
         this.§_-34§.updateAvatar();
         this.§_-34§.x = §_-1gb§;
         this.§_-34§.y = §_-3Et§;
         _loc1_ = new §_-5n7§();
         var _loc2_:MovieClip = ResourceManager.createMovieClip("ClothesCampaignDialogRatingIcon@ui");
         _loc1_.addChild(_loc2_);
         this.§_-5Ji§ = §_-5Kl§.createTextField(0,0,"+" + this.§_-5Kj§.toString(),§_-5Kl§.§_-0iQ§,{
            "size":12,
            "color":15717946,
            "glowFilter":{
               "color":11471373,
               "blurX":1.3,
               "blurY":1.3,
               "strength":50,
               "quality":5,
               "alpha":1
            }
         });
         this.§_-5Ji§.x = _loc2_.width / 2 - this.§_-5Ji§.width / 2;
         this.§_-5Ji§.y = 22;
         _loc1_.addChild(this.§_-5Ji§);
         _loc1_.x = 50;
         _loc1_.y = -80;
         this.§_-34§.addChild(_loc1_);
         addContent(this.§_-34§);
      }
      
      private function createInfoPanel() : void
      {
         if(this._infoPanel != null)
         {
            removeChild(this._infoPanel);
            this._infoPanel = null;
         }
         if(this.§_-B4H§ != null)
         {
            this.§_-B4H§.removeEventListeners();
            this.§_-B4H§ = null;
         }
         if(this.§_-A7L§)
         {
            this.§_-ApI§();
         }
         else
         {
            this.§_-8hX§();
         }
      }
      
      private function §_-ApI§() : void
      {
         var _loc2_:TextField = null;
         var _loc3_:TextField = null;
         var _loc6_:§_-Awf§ = null;
         var _loc7_:§_-2P5§ = null;
         var _loc8_:TextField = null;
         var _loc9_:MovieClip = null;
         var _loc10_:TextField = null;
         var _loc11_:MovieClip = null;
         var _loc12_:§_-5n7§ = null;
         this._selectedItem = this.clothesSets[this.§_-Bvw§];
         this.§_-6vZ§();
         if(this.§_-34§ != null)
         {
            this.§_-34§.avatarClothes.clearClothes();
            for each(_loc6_ in (this._selectedItem as ClothesSetItem).clothesItems)
            {
               this.§_-34§.avatarClothes.clothe(_loc6_,"10");
            }
            this.§_-34§.updateAvatar();
         }
         if(this._infoPanel != null)
         {
            this._infoPanel.destroy();
            this._infoPanel = null;
         }
         this._infoPanel = new §_-5n7§();
         var _loc1_:MovieClip = ResourceManager.createMovieClip("ClothesCampaignDialogPanelBg2@ui");
         this._infoPanel.addChild(_loc1_);
         if(this.§_-8DF§)
         {
            _loc7_ = new §_-2P5§(campaign.clientEndDate);
            _loc7_.x = 70;
            _loc7_.y = 20;
            this._infoPanel.addChild(_loc7_);
         }
         _loc2_ = §_-5Kl§.createTextField(0,0,Context.§_-5o8§.message(this.dialogDescription),§_-5Kl§.§_-0iQ§,{
            "size":14,
            "wordWrap":true,
            "autoSize":TextFieldAutoSize.CENTER,
            "align":TextFormatAlign.CENTER,
            "width":_loc1_.width - 20
         });
         _loc2_.x = _loc1_.width / 2 - _loc2_.width / 2;
         _loc2_.y = 50;
         this._infoPanel.addChild(_loc2_);
         _loc3_ = §_-5Kl§.createTextField(0,0,Context.§_-5o8§.message(this.§_-A00§),§_-5Kl§.§_-Ce3§,{
            "size":14,
            "color":16774331,
            "dropShadowFilter":{"alpha":0},
            "glowFilter":{
               "color":13860398,
               "blurX":1.3,
               "blurY":1.3,
               "strength":50,
               "quality":5,
               "alpha":1
            }
         });
         _loc3_.x = _loc1_.width / 2 - _loc3_.width / 2;
         _loc3_.y = 175;
         this._infoPanel.addChild(_loc3_);
         var _loc4_:§_-5n7§ = new §_-5n7§();
         var _loc5_:int = 0;
         if(this.§_-6GT§ != null && (this.§_-6GT§.gold > 0 || this.§_-6GT§.silver > 0))
         {
            if(this.§_-6GT§.gold > 0)
            {
               _loc8_ = §_-5Kl§.createTextField(0,0,this.§_-6GT§.gold.toString(),§_-5Kl§.§_-Ce3§,{
                  "size":16,
                  "dropShadowFilter":{"alpha":0},
                  "glowFilter":{
                     "color":13860398,
                     "blurX":1.3,
                     "blurY":1.3,
                     "strength":50,
                     "quality":5,
                     "alpha":1
                  }
               });
               _loc4_.addChild(_loc8_);
               _loc9_ = ResourceManager.createMovieClip(§_-Az0§.§_-7mB§(§_-Az0§.§_-9Tu§) + "@ui");
               _loc9_.x = _loc8_.width + 5;
               _loc9_.y = _loc8_.height / 2 - _loc9_.height / 2;
               _loc4_.addChild(_loc9_);
               _loc5_ = _loc9_.x + _loc9_.height + 5;
            }
            if(this.§_-6GT§.silver > 0)
            {
               _loc10_ = §_-5Kl§.createTextField(0,0,this.§_-6GT§.silver.toString(),§_-5Kl§.§_-Ce3§,{
                  "size":16,
                  "dropShadowFilter":{"alpha":0},
                  "glowFilter":{
                     "color":13860398,
                     "blurX":1.3,
                     "blurY":1.3,
                     "strength":50,
                     "quality":5,
                     "alpha":1
                  }
               });
               _loc4_.addChild(_loc10_);
               _loc10_.x = _loc5_;
               _loc11_ = ResourceManager.createMovieClip(§_-Az0§.§_-7mB§(§_-Az0§.§_-2l§) + "@ui");
               _loc11_.x = _loc10_.x + _loc10_.width + 5;
               _loc11_.y = _loc10_.height / 2 - _loc11_.height / 2;
               _loc4_.addChild(_loc11_);
            }
         }
         _loc4_.x = _loc1_.width / 2 - _loc4_.width / 2;
         _loc4_.y = _loc3_.y + _loc3_.height + 15;
         this._infoPanel.addChild(_loc4_);
         this.§_-B4H§ = new §_-7Oo§(Context.§_-5o8§.message("buyButtonTitle"));
         this.§_-B4H§.x = _loc1_.width / 2 - this.§_-B4H§.width / 2;
         this.§_-B4H§.y = _loc1_.height - this.§_-B4H§.height;
         this.§_-B4H§.addEventListener(MouseEvent.CLICK,this.onBuyButtonClick);
         this._infoPanel.addChild(this.§_-B4H§);
         if(this.§_-8DF§)
         {
            _loc12_ = this.§_-8D8§();
            _loc12_.x = this.§_-B4H§.x + this.§_-B4H§.width - 10;
            _loc12_.y = this.§_-B4H§.y + this.§_-B4H§.height / 2 - _loc12_.height / 2;
            this._infoPanel.addChild(_loc12_);
         }
         this._infoPanel.x = §_-8WH§;
         this._infoPanel.y = §_-3eO§;
         addChild(this._infoPanel);
      }
      
      private function §_-8D8§() : §_-5n7§
      {
         var _loc4_:TextField = null;
         if(this.§_-9EF§ == null)
         {
            return new §_-5n7§();
         }
         var _loc1_:§_-5n7§ = new §_-5n7§();
         var _loc2_:MovieClip = ResourceManager.createMovieClip("ClothesCampaignDialogDiscountIcon@ui");
         var _loc3_:MovieClip = _loc2_.getChildByName("discount") as MovieClip;
         if(_loc3_ != null)
         {
            _loc4_ = §_-5Kl§.createTextField(0,0,this.§_-9EF§,§_-5Kl§.§_-0iQ§,{
               "color":16777215,
               "glowFilter":{
                  "color":9371648,
                  "blurX":1.3,
                  "blurY":1.3,
                  "strength":50,
                  "quality":5,
                  "alpha":1
               }
            });
            _loc3_.addChild(_loc4_);
         }
         _loc1_.addChild(_loc2_);
         return _loc1_;
      }
      
      private function get §_-9EF§() : String
      {
         var _loc1_:§_-A7b§ = null;
         var _loc2_:Array = null;
         for each(_loc1_ in campaign.campaignItemList)
         {
            _loc2_ = _loc1_.typeId.split(":");
            if(_loc2_[0] != null && _loc2_[0] == "discount")
            {
               return "-" + (_loc2_[1] as String) + "%";
            }
         }
         return null;
      }
      
      private function §_-8hX§() : void
      {
         var _loc2_:§_-2P5§ = null;
         var _loc3_:§_-5n7§ = null;
         this._infoPanel = new §_-5n7§();
         var _loc1_:MovieClip = ResourceManager.createMovieClip("ClothesCampaignDialogPanelBg@ui");
         this._infoPanel.addChild(_loc1_);
         if(this.§_-8DF§)
         {
            _loc2_ = new §_-2P5§(campaign.clientEndDate);
            _loc2_.x = 70;
            _loc2_.y = -10;
            this._infoPanel.addChild(_loc2_);
         }
         if(this.§_-AkD§)
         {
            this.addColorSelectPanel();
         }
         this.addPagingBox();
         this.§_-B4H§ = new §_-Bab§(this.§_-6GT§);
         this.§_-B4H§.x = _loc1_.width / 2 - this.§_-B4H§.width / 2;
         this.§_-B4H§.y = _loc1_.height - this.§_-B4H§.height - 20;
         this.§_-B4H§.addEventListener(MouseEvent.CLICK,this.onBuyButtonClick);
         this._infoPanel.addChild(this.§_-B4H§);
         if(this.§_-8DF§)
         {
            _loc3_ = this.§_-8D8§();
            _loc3_.x = this.§_-B4H§.x + this.§_-B4H§.width;
            _loc3_.y = this.§_-B4H§.y + this.§_-B4H§.height / 2 - _loc3_.height / 2;
            this._infoPanel.addChild(_loc3_);
         }
         this._infoPanel.x = §_-8WH§;
         this._infoPanel.y = §_-3eO§;
         addChild(this._infoPanel);
      }
      
      protected function addPagingBox() : void
      {
         this.§_-6eo§ = this.createPagingBox();
         this.§_-6eo§.x = §_-3uL§;
         this.§_-6eo§.y = this.§_-AkD§ ? §_-7oR§ : §_-8k8§;
         this.§_-6eo§.addEventListener(§_-BuJ§.§_-9af§,this.onCaseClick);
         this.§_-6eo§.setItems(this.getCurrentCaseList());
         this._infoPanel.addChild(this.§_-6eo§);
      }
      
      protected function createPagingBox() : §_-0od§
      {
         return new §_-A92§(this.§_-AkD§);
      }
      
      protected function createSpot(param1:Array) : §_-5n7§
      {
         var _loc2_:AvatarClothesItem = param1[0] as AvatarClothesItem;
         var _loc3_:§_-3Wh§ = new §_-3Wh§(_loc2_);
         _loc3_.init();
         _loc3_.selected = param1[1] != null ? Boolean(param1[1]) : false;
         return _loc3_;
      }
      
      private function addColorSelectPanel() : void
      {
         this._colorSelect = new §_-6CP§(10);
         this._colorSelect.x = COLOR_SELECT_PANEL_X_POSITION;
         this._colorSelect.y = COLOR_SELECT_PANEL_Y_POSITION;
         this._colorSelect.addEventListener(§_-8dk§.§_-NP§,this.onColorSelect);
         this._colorSelect.updateColors(Context.§_-Amy§.§_-CKw§());
         this._colorSelect.visible = this.§_-AkD§;
         this._infoPanel.addChild(this._colorSelect);
      }
      
      private function get §_-6GT§() : §_-8jF§
      {
         var _loc2_:§_-Awf§ = null;
         var _loc1_:§_-8jF§ = new §_-8jF§();
         if(this.§_-AaZ§ != null && this.§_-AaZ§.length != 0)
         {
            for each(_loc2_ in this.§_-AaZ§)
            {
               _loc1_.add(_loc2_.§_-6GT§);
            }
         }
         if(this.§_-A7L§)
         {
            return this.clothesSetPrice;
         }
         return _loc1_;
      }
      
      private function §_-0Li§(param1:§_-0CV§) : String
      {
         if(§_-BsT§.§_-8DF§(param1.type))
         {
            return "saleCollection1Label";
         }
         return "newClothesLabel";
      }
      
      private function get dialogDescription() : String
      {
         if(this.§_-8DF§)
         {
            return "clothesCampaignDescriptionSaleLabel";
         }
         return "clothesCampaignDescriptionNewLabel";
      }
      
      private function get §_-A00§() : String
      {
         if(this._selectedItem != null && this._selectedItem is ClothesSetItem)
         {
            return (this._selectedItem as ClothesSetItem).localizedLabel;
         }
         return "";
      }
      
      private function get clothesSetPrice() : §_-8jF§
      {
         if(this._selectedItem != null && this._selectedItem is ClothesSetItem)
         {
            return new §_-8jF§((this._selectedItem as ClothesSetItem).goldPrice,(this._selectedItem as ClothesSetItem).silverPrice);
         }
         return new §_-8jF§();
      }
      
      private function get clothesSetRating() : int
      {
         if(this._selectedItem != null && this._selectedItem is ClothesSetItem)
         {
            return (this._selectedItem as ClothesSetItem).rating;
         }
         return 0;
      }
      
      private function getCurrentCaseList() : Array
      {
         var _loc2_:§_-A7b§ = null;
         var _loc1_:Array = [];
         if(campaign.campaignItemList != null)
         {
            for each(_loc2_ in campaign.campaignItemList)
            {
               if(_loc2_ != null)
               {
                  if(this.validateItem(_loc2_))
                  {
                     _loc1_.push(this.§_-979§(_loc2_));
                  }
                  if(this.§_-2v4§(_loc2_) != null)
                  {
                     _loc1_.push(this.§_-2v4§(_loc2_));
                  }
               }
            }
         }
         return _loc1_;
      }
      
      override protected function validateItem(param1:§_-A7b§) : Boolean
      {
         var _loc2_:AvatarClothesItem = this.§_-979§(param1);
         if(_loc2_ == null)
         {
            return false;
         }
         return this.validateClothesItem(_loc2_);
      }
      
      private function validateClothesItem(param1:AvatarClothesItem) : Boolean
      {
         var _loc2_:* = false;
         if(param1.clothesItem.isColored)
         {
            _loc2_ = Context.cityPlayer.§_-3jv§(param1.typeId) >= Context.§_-Amy§.§_-9vz§;
         }
         else
         {
            _loc2_ = Context.cityPlayer.hasClothes(param1.typeId);
         }
         return !_loc2_ && param1.clothesItem.canBuy && param1.clothesItem.gender == Context.cityPlayer.avatarAppearance.gender;
      }
      
      private function §_-979§(param1:§_-A7b§) : AvatarClothesItem
      {
         var _loc2_:Array = param1.typeId.split(":");
         var _loc3_:§_-Awf§ = Context.§_-70S§.§_-0ZU§().findTypeById(_loc2_[0]) as §_-Awf§;
         if(_loc3_ == null)
         {
            return null;
         }
         var _loc4_:AvatarClothesItem = new AvatarClothesItem();
         _loc4_.fromClothesItem(_loc3_);
         _loc4_.colorId = _loc2_.length > 1 ? _loc2_[1] : AvatarClothesItem.§_-BnS§;
         return _loc4_;
      }
      
      private function §_-2v4§(param1:§_-A7b§) : ClothesSetItem
      {
         var _loc2_:Array = param1.typeId.split(":");
         var _loc3_:ClothesSetItem = Context.§_-Amy§.§_-7j3§(_loc2_[0]);
         if(_loc3_ == null)
         {
            return null;
         }
         return _loc3_;
      }
      
      private function onCaseClick(param1:§_-BuJ§) : void
      {
         var _loc4_:Object = null;
         var _loc5_:int = 0;
         var _loc6_:Array = null;
         var _loc2_:§_-Awf§ = param1.tag as §_-Awf§;
         if(this.§_-AaZ§ == null)
         {
            this.§_-AaZ§ = [];
         }
         var _loc3_:* = false;
         for each(_loc4_ in this.§_-AaZ§)
         {
            if((_loc4_ as §_-Awf§).intersect(_loc2_))
            {
               this.§_-AaZ§.splice(this.§_-AaZ§.indexOf(_loc4_),1);
               _loc3_ = _loc2_.typeId == (_loc4_ as §_-Awf§).typeId;
            }
         }
         if(this.§_-AaZ§.indexOf(_loc2_) >= 0)
         {
            this.§_-AaZ§.splice(this.§_-AaZ§.indexOf(_loc2_),1);
         }
         else if(!_loc3_)
         {
            this.§_-AaZ§.push(_loc2_);
         }
         if(this.§_-AaZ§.length > 0)
         {
            this._selectedItem = this.§_-AaZ§[this.§_-AaZ§.length - 1];
         }
         else
         {
            this._selectedItem = null;
         }
         if(_loc2_.isColored)
         {
            _loc5_ = 0;
            if(this._colorSelect != null)
            {
               _loc6_ = [];
               if(_loc2_ != null && this._selectedItem != null && _loc2_ == this._selectedItem)
               {
                  _loc6_ = Context.cityPlayer.§_-299§(_loc2_ as §_-7Tj§);
                  _loc5_ = Context.cityPlayer.§_-0nO§(_loc2_ as §_-7Tj§);
               }
               this._colorSelect.updateColors(Context.§_-Amy§.§_-CKw§(),_loc5_,_loc6_);
            }
            if(this.§_-34§.avatarClothes.hasClothesItem(_loc2_.typeId,_loc5_ > 0 ? _loc5_.toString() : null))
            {
               this.§_-7nG§(_loc2_);
            }
            else
            {
               this.§_-34§.avatarClothes.clothe(_loc2_,_loc5_.toString());
            }
         }
         else if(this.§_-34§.avatarClothes.hasClothes(_loc2_.typeId))
         {
            this.§_-7nG§(_loc2_);
         }
         else
         {
            this.§_-34§.avatarClothes.clothe(_loc2_,"0");
         }
         this.§_-34§.updateAvatar();
         this.§_-6vZ§();
         this.updateSelection();
      }
      
      private function onColorSelect(param1:§_-8dk§) : void
      {
         if(this._selectedItem != null)
         {
            this.§_-34§.avatarClothes.clothe(this._selectedItem as §_-Awf§,String((param1.tag as §_-1Dh§).index));
            this.§_-34§.updateAvatar();
         }
      }
      
      private function onBuyButtonClick(param1:MouseEvent) : void
      {
         var _loc6_:Object = null;
         var _loc9_:AvatarClothesItem = null;
         var _loc10_:AvatarClothesItem = null;
         if(Context.cityPlayer == null)
         {
            return;
         }
         var _loc2_:§_-8jF§ = this.§_-6GT§;
         if(_loc2_.isEmpty())
         {
            return;
         }
         var _loc3_:§_-aD§ = new §_-aD§(§_-aD§.REASON_BUY_CLOTHES_ITEMS);
         var _loc4_:§_-AMW§ = new §_-AMW§();
         if(!_loc4_.checkPrice(_loc2_,_loc3_))
         {
            return;
         }
         var _loc5_:Array = this.getCurrentCaseList();
         for each(_loc6_ in _loc5_)
         {
            if(_loc6_ is AvatarClothesItem)
            {
               if(this.§_-3br§(_loc6_ as AvatarClothesItem))
               {
                  _loc10_ = _loc6_ as AvatarClothesItem;
                  if(!Context.cityPlayer.§_-2dL§(_loc10_.typeId,_loc10_.colorId) && !§_-9E8§.validateItem(_loc10_.clothesItem,Context.cityPlayer))
                  {
                     return;
                  }
               }
            }
         }
         if(Context.§_-2m2§ == null)
         {
            return;
         }
         var _loc7_:Array = [];
         var _loc8_:Array = [];
         for each(_loc9_ in this.§_-34§.avatarClothes.getClothes())
         {
            if(!(_loc9_.clothesItem.findParentCategory(§_-BjY§.§_-9kD§) != null || Boolean(_loc9_.clothesItem.findParentCategory(§_-BjY§.§_-4Ny§))))
            {
               _loc7_.push(_loc9_);
               if(!Context.cityPlayer.§_-2dL§(_loc9_.typeId,_loc9_.colorId))
               {
                  _loc8_.push(_loc9_);
               }
            }
         }
         if(this.§_-b7§(_loc8_) && !Context.cityPlayer.§_-3k5§)
         {
            Context.§_-06H§.§_-74§(Context.cityPlayer.id);
            return;
         }
         Application.instance.addEventListener(§_-1m0§.§_-9FD§,this.onBuyComplete);
         Context.§_-2m2§.§_-6Pq§(_loc7_,(Context.player as §_-48g§).clothesCollections.currentCollectionType);
      }
      
      private function §_-3br§(param1:AvatarClothesItem) : Boolean
      {
         var _loc2_:§_-Awf§ = null;
         for each(_loc2_ in this.§_-AaZ§)
         {
            if(param1.typeId == _loc2_.typeId)
            {
               return true;
            }
         }
         return false;
      }
      
      private function §_-b7§(param1:Array) : Boolean
      {
         var _loc2_:AvatarClothesItem = null;
         for each(_loc2_ in param1)
         {
            if(_loc2_.clothesItem.isVip)
            {
               return true;
            }
         }
         return false;
      }
      
      private function onBuyComplete(param1:§_-1m0§) : void
      {
         Application.instance.removeEventListener(§_-1m0§.§_-9FD§,this.onBuyComplete);
         Context.§_-BlB§.§_-CCK§(new §_-7q1§(Context.§_-5o8§.message("buyCompleteTitle"),Context.§_-5o8§.message("buyCompleteMessage")));
         close();
      }
      
      private function §_-6vZ§() : void
      {
         if(this.§_-B4H§ is §_-Bab§)
         {
            (this.§_-B4H§ as §_-Bab§).price = this.§_-6GT§;
         }
         if(this.§_-5Ji§ != null)
         {
            this.§_-5Ji§.text = "+" + this.§_-5Kj§.toString();
            this.§_-5Ji§.x = 25 - this.§_-5Ji§.width / 2;
         }
      }
      
      private function updateSelection() : void
      {
         this.§_-6eo§.setSelectedSpots(this.§_-AaZ§);
      }
      
      private function §_-7nG§(param1:§_-Awf§) : void
      {
         var _loc2_:AvatarClothesItem = null;
         var _loc3_:Boolean = false;
         var _loc4_:AvatarClothesItem = null;
         this.§_-34§.avatarClothes.takeoff(param1);
         for each(_loc2_ in this.§_-BHt§.getClothes())
         {
            if(_loc2_.clothesItem.intersect(param1))
            {
               _loc3_ = false;
               for each(_loc4_ in this.§_-34§.avatarClothes.getClothes())
               {
                  if(!(_loc2_.typeId == _loc4_.typeId || !_loc4_.clothesItem.intersect(_loc2_.clothesItem)))
                  {
                     _loc3_ = true;
                  }
               }
               if(!_loc3_)
               {
                  this.§_-34§.avatarClothes.clothe(_loc2_.clothesItem,_loc2_.colorId);
               }
            }
         }
      }
      
      private function §_-3Ls§(param1:String) : AvatarClothesItem
      {
         var _loc2_:AvatarClothesItem = null;
         for each(_loc2_ in this.§_-BHt§.getClothes())
         {
            if(_loc2_.typeId == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      private function get §_-A7L§() : Boolean
      {
         var _loc1_:§_-A7b§ = null;
         for each(_loc1_ in campaign.campaignItemList)
         {
            if(this.§_-2v4§(_loc1_) != null)
            {
               return true;
            }
         }
         return false;
      }
      
      private function get clothesSets() : Array
      {
         var _loc2_:§_-A7b§ = null;
         var _loc3_:ClothesSetItem = null;
         var _loc1_:Array = [];
         for each(_loc2_ in campaign.campaignItemList)
         {
            _loc3_ = this.§_-2v4§(_loc2_);
            if(_loc3_ != null && _loc3_.gender == Context.cityPlayer.avatarAppearance.gender && !this.§_-3u1§(_loc3_))
            {
               _loc1_.push(_loc3_);
            }
         }
         return _loc1_;
      }
      
      private function §_-3u1§(param1:ClothesSetItem) : Boolean
      {
         var _loc3_:§_-Awf§ = null;
         var _loc2_:Boolean = true;
         for each(_loc3_ in param1.clothesItems)
         {
            if(!Context.player.hasClothes(_loc3_.typeId))
            {
               _loc2_ = false;
               break;
            }
         }
         return _loc2_;
      }
      
      private function get §_-8DF§() : Boolean
      {
         if(campaign == null)
         {
            return false;
         }
         return §_-BsT§.§_-8DF§(campaign.type);
      }
      
      private function get §_-AkD§() : Boolean
      {
         var _loc1_:AvatarClothesItem = null;
         for each(_loc1_ in this.getCurrentCaseList())
         {
            if(_loc1_.clothesItem.isColored)
            {
               return true;
            }
         }
         return false;
      }
      
      private function get §_-5Kj§() : int
      {
         var _loc2_:§_-Awf§ = null;
         var _loc1_:int = 0;
         if(this.§_-AaZ§ != null && this.§_-AaZ§.length != 0)
         {
            for each(_loc2_ in this.§_-AaZ§)
            {
               _loc1_ += _loc2_.rating;
            }
         }
         if(this.§_-A7L§)
         {
            return this.clothesSetRating;
         }
         return _loc1_;
      }
      
      override public function canShowDialog() : Boolean
      {
         var _loc2_:Array = null;
         var _loc3_:ClothesSetItem = null;
         var _loc4_:String = null;
         var _loc5_:§_-A7b§ = null;
         var _loc1_:Boolean = false;
         if(this.§_-A7L§)
         {
            _loc2_ = this.getItems();
            if(_loc2_.length != 0)
            {
               for each(_loc3_ in _loc2_)
               {
                  for each(_loc4_ in _loc3_.items)
                  {
                     if(!Context.cityPlayer.hasClothes(_loc4_))
                     {
                        _loc1_ = true;
                        break;
                     }
                  }
               }
            }
         }
         else
         {
            for each(_loc5_ in campaign.campaignItemList)
            {
               if(!(_loc5_.typeId.indexOf("discount") >= 0 || _loc5_.typeId.indexOf("icon") >= 0))
               {
                  if(this.validateItem(_loc5_))
                  {
                     _loc1_ = true;
                  }
               }
            }
         }
         return _loc1_;
      }
      
      protected function getItems() : Array
      {
         var _loc2_:§_-A7b§ = null;
         var _loc3_:ClothesSetItem = null;
         var _loc1_:Array = [];
         for each(_loc2_ in campaign.campaignItemList)
         {
            _loc3_ = this.§_-5nF§(_loc2_);
            if(_loc3_ != null)
            {
               if(this.§_-2Gb§(_loc3_) && _loc1_.indexOf(_loc3_) == -1)
               {
                  _loc1_.push(_loc3_);
               }
            }
         }
         return _loc1_;
      }
      
      private function §_-5nF§(param1:§_-A7b§) : ClothesSetItem
      {
         var _loc5_:ClothesSetItem = null;
         var _loc2_:String = param1.typeId.split(":")[0];
         var _loc3_:ClothesSetItem = Context.§_-Amy§.§_-7j3§(_loc2_);
         if(_loc3_ != null)
         {
            return _loc3_;
         }
         var _loc4_:§_-Awf§ = Context.§_-70S§.§_-0ZU§().findTypeById(_loc2_) as §_-Awf§;
         if(_loc4_ == null)
         {
            return null;
         }
         for each(_loc5_ in Context.§_-Amy§.clothesSets)
         {
            if(_loc5_.hasItem(_loc4_.typeId))
            {
               return _loc5_;
            }
         }
         return null;
      }
      
      private function §_-2Gb§(param1:ClothesSetItem) : Boolean
      {
         if(param1.§_-AvQ§ && Context.cityPlayer != null && !Context.cityPlayer.cityInfo.§_-4oU§)
         {
            return false;
         }
         return param1.§_-8ya§(Context.player) && !param1.§_-wn§ && param1.§_-BnD§ && param1.gender == Context.player.avatarAppearance.gender && param1.canBuy;
      }
      
      override protected function createSkin() : §_-Fs§
      {
         return new §_-1P4§();
      }
   }
}

