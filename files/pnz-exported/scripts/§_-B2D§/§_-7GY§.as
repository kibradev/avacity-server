package §_-B2D§
{
   import §_-0yZ§.§_-aD§;
   import §_-1Fx§.§_-5n7§;
   import §_-2S7§.§_-75P§;
   import §_-2U3§.ResourceManager;
   import §_-3VF§.§_-0nG§;
   import §_-3VF§.§_-6G§;
   import §_-8Hp§.§_-5KD§;
   import §_-AFi§.§_-29-§;
   import §_-AaA§.§_-5Kl§;
   import §_-B6f§.§_-7wF§;
   import §_-BBR§.§_-8iA§;
   import §_-Bi2§.§_-Fs§;
   import §_-Bwh§.§_-AMW§;
   import §_-ByP§.§_-0CV§;
   import §_-C-a§.§_-3uA§;
   import §_-CNo§.§_-4Fx§;
   import §_-GM§.Context;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   public class §_-7GY§ extends §_-75P§
   {
      private var §_-306§:Sprite = null;
      
      private var §_-8aB§:Sprite = null;
      
      private var §_-AmN§:TextField = null;
      
      private var §_-8HB§:§_-aD§ = null;
      
      protected var §_-8qj§:TextField;
      
      private var §_-5di§:Sprite;
      
      protected var §_-AaX§:§_-5n7§;
      
      public function §_-7GY§(param1:§_-0CV§, param2:§_-aD§ = null)
      {
         super(param1,550,425,Context.§_-5o8§.message("saleOffersTitle"));
         this.§_-8HB§ = param2;
      }
      
      private static function §_-4Qw§() : §_-29-§
      {
         var _loc1_:§_-6G§ = null;
         for each(_loc1_ in §_-0nG§.instance.§_-2bV§())
         {
            if(_loc1_.inited && _loc1_.isActive() && _loc1_ is §_-29-§)
            {
               return _loc1_ as §_-29-§;
            }
         }
         return null;
      }
      
      override public function init() : void
      {
         super.init();
         this.§_-5di§ = ResourceManager.createSprite("OfferDialogTop@ui");
         this.§_-5Iu§();
         addContentOverlay(this.§_-5di§);
         this.§_-AaX§ = new §_-5n7§();
         addContent(this.§_-AaX§);
         this.fillPacks();
         clientWidth = Math.max(this.minDialogWidth,this.§_-AaX§.width + 190);
         this.§_-306§ = Context.player.avatarAppearance.gender == §_-3uA§.§_-908§ ? ResourceManager.createSprite("OfferGirlFroggy@ui") : ResourceManager.createSprite("OfferBoyFroggy@ui");
         this.§_-306§.x = 0;
         this.§_-306§.y = clientHeight - this.§_-306§.height;
         addContent(this.§_-306§);
         this.§_-8aB§ = ResourceManager.createSprite("OfferMessageHintAsset@ui");
         this.§_-8aB§.x = -60;
         this.§_-8aB§.y = 55;
         addContentOverlay(this.§_-8aB§);
         this.§_-AmN§ = §_-5Kl§.createTextField(0,0,Context.§_-5o8§.message("saleOffersMessage"),§_-5Kl§.§_-BGn§,{
            "size":13,
            "color":4342595,
            "wordWrap":true,
            "width":this.§_-8aB§.width - 20
         });
         this.§_-AmN§.x = 10;
         this.§_-AmN§.y = 12;
         this.§_-8aB§.addChild(this.§_-AmN§);
         this.updatePositions();
         if(§_-5KD§.instance.§_-AXw§(campaign.id) != null)
         {
            §_-CQV§(150,13,false);
         }
      }
      
      private function §_-5Iu§() : void
      {
         if(this.§_-5di§ == null)
         {
            return;
         }
         this.§_-5di§.x = dialogWidth / 2 - this.§_-5di§.width / 2;
         this.§_-5di§.y = -this.§_-5di§.height + 50;
      }
      
      private function fillPacks() : void
      {
         var _loc1_:int = 0;
         var _loc2_:§_-7wF§ = null;
         var _loc3_:§_-4Fx§ = null;
         _loc1_ = 0;
         for each(_loc2_ in this.getPackages())
         {
            if(this.validatePack(_loc2_))
            {
               _loc3_ = new §_-4Fx§(_loc2_);
               _loc3_.x = _loc1_;
               _loc3_.y = 20;
               this.§_-AaX§.addChild(_loc3_);
               _loc3_.addEventListener(MouseEvent.CLICK,this.§_-Bqb§);
               _loc1_ += _loc3_.clientWidth + 10;
            }
         }
      }
      
      private function getPackages() : Array
      {
         return Context.§_-2hc§.§_-8HW§;
      }
      
      private function §_-Bqb§(param1:MouseEvent) : void
      {
         var _loc2_:§_-4Fx§ = param1.currentTarget as §_-4Fx§;
         var _loc3_:§_-AMW§ = new §_-AMW§();
         _loc3_.§_-9k0§(_loc2_.§_-0l4§,1,this.§_-8HB§);
         if(§_-8iA§.§_-9OU§ != null)
         {
            §_-8iA§.§_-9OU§.§_-9xF§(this.§_-8HB§ != null ? §_-aD§.§_-9d-§(this.§_-8HB§.service) : null);
         }
         close();
      }
      
      private function get minDialogWidth() : int
      {
         return 450;
      }
      
      protected function updatePositions() : void
      {
         this.§_-5Iu§();
         this.updateTitleTextFieldPos();
         this.placePackContainer();
      }
      
      protected function placePackContainer() : void
      {
         this.§_-AaX§.x = clientWidth / 2 + this.§_-306§.width / 2 - this.§_-AaX§.width / 2;
         this.§_-AaX§.y = 100;
      }
      
      protected function updateTitleTextFieldPos() : void
      {
         §_-8y0§.x = clientWidth / 2 - §_-8y0§.width / 2 - 20;
         §_-8y0§.y = 85;
      }
      
      protected function validatePack(param1:§_-7wF§) : Boolean
      {
         return true;
      }
      
      override public function canShowDialog() : Boolean
      {
         return this.getPackages().length > 0;
      }
      
      override protected function createSkin() : §_-Fs§
      {
         return new §_-CCa§();
      }
   }
}

