package §_-B2D§
{
   import §_-0CA§.§_-BsT§;
   import §_-0fi§.§_-6f3§;
   import §_-1Fx§.§_-5n7§;
   import §_-2S7§.§_-75P§;
   import §_-2U3§.ResourceManager;
   import §_-3ft§.§_-BuJ§;
   import §_-40e§.§_-1m0§;
   import §_-6ES§.§_-ho§;
   import §_-AaA§.§_-5Kl§;
   import §_-Az6§.§_-0od§;
   import §_-Bi2§.§_-Fs§;
   import §_-ByP§.§_-0CV§;
   import §_-ByP§.§_-A7b§;
   import §_-GM§.Context;
   import §_-on§.§_-2P5§;
   import flash.display.MovieClip;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormatAlign;
   import penzville.Application;
   
   public class §_-7Wz§ extends §_-75P§
   {
      private static const §_-r-§:int = 670;
      
      private static const §_-83j§:int = 530;
      
      private static const §_-5Ef§:int = 330;
      
      private static const §_-5er§:int = 16;
      
      private var _infoPanel:§_-5n7§;
      
      private var §_-6eo§:§_-0od§;
      
      private var §_-7uO§:Array = [];
      
      public function §_-7Wz§(param1:§_-0CV§)
      {
         super(param1,§_-r-§,§_-83j§,Context.§_-5o8§.message(this.§_-0Li§(param1)));
      }
      
      override public function init() : void
      {
         super.init();
         this.createInfoPanel();
         Application.instance.addEventListener(§_-1m0§.§_-CGy§,this.onInventoryChanged);
      }
      
      private function createInfoPanel() : void
      {
         this._infoPanel = new §_-5n7§();
         var _loc1_:MovieClip = ResourceManager.createMovieClip("FurnitureCampaignDialogPanelBg@ui");
         this._infoPanel.addChild(_loc1_);
         this.§_-4h3§();
         this.addPagingBox();
         this.§_-7Z3§(_loc1_);
         this._infoPanel.x = clientWidth / 2 - this._infoPanel.width / 2 + 15;
         this._infoPanel.y = 48;
         addChild(this._infoPanel);
      }
      
      private function §_-4h3§() : void
      {
         var _loc1_:§_-2P5§ = null;
         _loc1_ = new §_-2P5§(campaign.endDate.time / 1000);
         _loc1_.x = 60;
         _loc1_.y = -5;
         this._infoPanel.addChild(_loc1_);
      }
      
      private function §_-7Z3§(param1:MovieClip) : void
      {
         var _loc2_:TextField = null;
         _loc2_ = §_-5Kl§.createTextField(0,0,Context.§_-5o8§.message(this.dialogDescription),§_-5Kl§.§_-0iQ§,{
            "size":§_-5er§,
            "wordWrap":true,
            "autoSize":TextFieldAutoSize.CENTER,
            "align":TextFormatAlign.CENTER,
            "width":§_-5Ef§
         });
         _loc2_.x = param1.width / 2 - _loc2_.width / 2;
         _loc2_.y = 20;
         this._infoPanel.addChild(_loc2_);
      }
      
      protected function addPagingBox() : void
      {
         this.§_-6eo§ = this.createPagingBox();
         this.§_-6eo§.x = 14;
         this.§_-6eo§.y = 121;
         this.§_-6eo§.addEventListener(§_-BuJ§.§_-9af§,this.onCaseClick);
         this.§_-6eo§.setItems(this.getItems());
         this._infoPanel.addChild(this.§_-6eo§);
      }
      
      protected function createPagingBox() : §_-0od§
      {
         return new §_-ho§(4,420,3,360);
      }
      
      protected function onCaseClick(param1:§_-BuJ§) : void
      {
         var _loc2_:Object = param1.tag;
         if(_loc2_ == null || !(_loc2_ is §_-6f3§))
         {
            return;
         }
         new §_-3O5§(_loc2_ as §_-6f3§,this.§_-7uO§).showModal();
      }
      
      private function §_-0Li§(param1:§_-0CV§) : String
      {
         return §_-BsT§.§_-8DF§(param1.type) ? "saleItemsDialogTitle" : "newItemsDialogTitle";
      }
      
      private function get dialogDescription() : String
      {
         return this.§_-8DF§ ? "saleItemsDialogMessage" : "newItemsDialogMessage";
      }
      
      private function get §_-8DF§() : Boolean
      {
         return Boolean(campaign) && §_-BsT§.§_-8DF§(campaign.type);
      }
      
      private function getItems() : Array
      {
         var _loc2_:§_-A7b§ = null;
         var _loc3_:§_-6f3§ = null;
         var _loc1_:Array = [];
         if(campaign.campaignItemList)
         {
            for each(_loc2_ in campaign.campaignItemList)
            {
               if(this.validateItem(_loc2_))
               {
                  _loc3_ = Context.§_-70S§.§_-0ZU§().findTypeById(_loc2_.typeId) as §_-6f3§;
                  _loc1_.push(_loc3_);
               }
            }
            this.§_-7uO§ = _loc1_;
         }
         return _loc1_;
      }
      
      override protected function validateItem(param1:§_-A7b§) : Boolean
      {
         var _loc2_:§_-6f3§ = Context.§_-70S§.§_-0ZU§().findTypeById(param1.typeId) as §_-6f3§;
         if(_loc2_ == null || !_loc2_.canBuy)
         {
            return false;
         }
         return Context.cityPlayer.getFurnitureCount(_loc2_.typeId) < _loc2_.buyCount;
      }
      
      override public function canShowDialog() : Boolean
      {
         var _loc1_:§_-A7b§ = null;
         if(!campaign.campaignItemList)
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
      
      override protected function createSkin() : §_-Fs§
      {
         return new §_-9FF§();
      }
      
      private function onInventoryChanged(param1:§_-1m0§) : void
      {
         if(this.§_-6eo§ == null)
         {
            return;
         }
         var _loc2_:Array = this.getItems();
         this.§_-6eo§.setItems(_loc2_);
         if(_loc2_.length == 0)
         {
            close();
         }
      }
      
      override public function destroy() : void
      {
         if(destroyed)
         {
            return;
         }
         Application.instance.removeEventListener(§_-1m0§.§_-CGy§,this.onInventoryChanged);
         if(this.§_-6eo§ != null)
         {
            this.§_-6eo§.removeEventListener(§_-BuJ§.§_-9af§,this.onCaseClick);
            this.§_-6eo§.destroy();
            this.§_-6eo§ = null;
         }
         if(this._infoPanel != null)
         {
            this._infoPanel.destroy();
            this._infoPanel = null;
         }
         super.destroy();
      }
   }
}

