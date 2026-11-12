package §_-4J9§
{
   import §_-1Fx§.§_-5n7§;
   import §_-2S7§.§_-75P§;
   import §_-2U3§.ResourceManager;
   import §_-3eZ§.§_-7H-§;
   import §_-8Hp§.§_-5KD§;
   import §_-95S§.§_-9E8§;
   import §_-99s§.§_-F§;
   import §_-AaA§.§_-5Kl§;
   import §_-Beo§.§_-2g1§;
   import §_-Bi2§.§_-Fs§;
   import §_-ByP§.§_-0CV§;
   import §_-C-a§.§_-3uA§;
   import §_-GM§.Context;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.filters.GlowFilter;
   import flash.text.TextField;
   
   public class §_-0B7§ extends §_-75P§
   {
      public static const MODULE_ID:String = "dzoYearly";
      
      public function §_-0B7§(param1:§_-0CV§)
      {
         super(param1,530,374,"");
      }
      
      override protected function createSkin() : §_-Fs§
      {
         return new §_-BlQ§();
      }
      
      override public function init() : void
      {
         var _loc1_:TextField = null;
         var _loc3_:TextField = null;
         super.init();
         _loc1_ = §_-5Kl§.createTextField(0,0,Context.§_-5o8§.message("salesDialogTitle"),§_-5Kl§.STYLE_DZO15_DIALOG_TITLE);
         _loc1_.x = clientWidth / 2 - _loc1_.width / 2;
         _loc1_.y = 5;
         addContent(_loc1_);
         var _loc2_:Array = _loc1_.filters;
         _loc2_.push(new GlowFilter(16775896,0.8,1.6,1.6,50,5));
         _loc1_.filters = _loc2_;
         _loc3_ = §_-5Kl§.createTextField(0,0,Context.§_-5o8§.message("salesDialogMessage"),§_-5Kl§.STYLE_DZO15_DIALOG_DESCRIPTION,{
            "size":14,
            "width":clientWidth - 20,
            "wordWrap":true
         });
         _loc3_.y = 50;
         _loc3_.x = 20;
         addContent(_loc3_);
         var _loc4_:int = 105;
         this.addButton(20,_loc4_,Context.§_-5o8§.message("furnitureShopTitle"),"Dzo2015Button1Line",this.§_-7GR§);
         _loc4_ += 90;
         this.addButton(20,_loc4_,Context.§_-5o8§.message("clothesShopTitle"),"Dzo2015Button2Line",this.§_-9oV§);
         _loc4_ += 90;
         this.addButton(20,_loc4_,Context.§_-5o8§.message("bikeAmusiment"),"Dzo2015Button3Line",this.§_-HL§);
      }
      
      private function addButton(param1:int, param2:int, param3:String, param4:String, param5:Function) : void
      {
         var buttonContainer:§_-5n7§ = null;
         var buttonBg:Sprite = null;
         var buttonTitleField:TextField = null;
         var lineAsset:Sprite = null;
         var starAsset:Sprite = null;
         var button:§_-7H-§ = null;
         var x:int = param1;
         var y:int = param2;
         var buttonTitle:String = param3;
         var lineAssetId:String = param4;
         var callback:Function = param5;
         buttonContainer = new §_-5n7§();
         buttonContainer.x = x;
         buttonContainer.y = y;
         addContent(buttonContainer);
         buttonBg = ResourceManager.createSprite("Dzo2015ButtonBg@ui");
         buttonContainer.addChild(buttonBg);
         buttonTitleField = §_-5Kl§.createTextField(0,0,buttonTitle,§_-5Kl§.STYLE_DZO15_BUTTON_TEXT);
         buttonTitleField.x = buttonBg.width / 2 - buttonTitleField.width / 2;
         buttonTitleField.y = 10;
         buttonContainer.addChild(buttonTitleField);
         lineAsset = ResourceManager.createSprite(lineAssetId + "@ui");
         lineAsset.x = buttonBg.width;
         buttonContainer.addChild(lineAsset);
         starAsset = ResourceManager.createSprite("Dzo2015StarAsset@ui");
         starAsset.x = buttonBg.width - starAsset.width / 2 - 5;
         starAsset.y = -starAsset.height / 2 + 5;
         buttonContainer.addChild(starAsset);
         button = new §_-7H-§(Context.§_-5o8§.message("buyButtonTitle"),75);
         button.x = buttonBg.width / 2 - button.clientWidth / 2;
         button.y = buttonBg.height - button.clientHeight - 10;
         button.addEventListener(MouseEvent.CLICK,function(param1:MouseEvent):void
         {
            callback();
         });
         buttonContainer.addChild(button);
      }
      
      private function §_-HL§() : void
      {
         if(!this.§case§(this.§_-0zx§))
         {
            §_-9E8§.§_-08G§(§_-F§.§_-2FW§);
         }
      }
      
      private function §_-9oV§() : void
      {
         if(!this.§case§(this.§_-2sy§))
         {
            new §_-2g1§(Context.player).showModal();
         }
      }
      
      private function §_-7GR§() : void
      {
         if(!this.§case§(this.§_-63R§))
         {
            §_-9E8§.§_-08G§(§_-F§.§_-6MQ§);
         }
      }
      
      private function §case§(param1:int) : Boolean
      {
         var _loc2_:§_-0CV§ = §_-5KD§.instance.§_-0S-§(param1);
         var _loc3_:§_-75P§ = §_-5KD§.instance.§_-3TO§(_loc2_);
         if(_loc2_ != null && _loc3_ != null && _loc3_.canShowDialog())
         {
            _loc3_.showModal();
            return true;
         }
         return false;
      }
      
      private function get §_-0zx§() : int
      {
         return this.§_-6V6§("furnitureSaleId");
      }
      
      private function get §_-2sy§() : int
      {
         return this.§_-6V6§(Context.cityPlayer.avatarAppearance.gender == §_-3uA§.§_-908§ ? "clothesBoyBundleId" : "clothesGirlBundleId");
      }
      
      private function get §_-63R§() : int
      {
         return this.§_-6V6§("furnitureBundleId");
      }
      
      private function §_-6V6§(param1:String) : int
      {
         return campaign.getItemSection(param1);
      }
      
      override public function canShowDialog() : Boolean
      {
         return true;
      }
   }
}

