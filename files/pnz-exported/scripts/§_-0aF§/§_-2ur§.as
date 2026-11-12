package §_-0aF§
{
   import §_-1Fx§.§_-5n7§;
   import §_-1vM§.§_-5Nf§;
   import §_-2S7§.§_-75P§;
   import §_-4cY§.§_-8Hh§;
   import §_-6-L§.§_-49j§;
   import §_-6lk§.§_-1YC§;
   import §_-6lk§.§_-8Fe§;
   import §_-6lk§.§_-BXj§;
   import §_-AaA§.§_-5Kl§;
   import §_-Bi2§.§_-5bz§;
   import §_-Bi2§.§_-Fs§;
   import §_-ByP§.§_-0CV§;
   import §_-GM§.Context;
   import flash.text.TextField;
   
   public class §_-2ur§ extends §_-75P§
   {
      private static const WIDTH:int = 512;
      
      private static const §_-621§:int = 480;
      
      private static const §_-0h7§:int = 1;
      
      public function §_-2ur§(param1:§_-0CV§ = null)
      {
         super(param1,WIDTH,§_-621§,Context.§_-5o8§.message("goldSaleTitle"));
      }
      
      override public function init() : void
      {
         var _loc1_:TextField = null;
         var _loc2_:Array = null;
         var _loc3_:§_-5n7§ = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:§_-5Nf§ = null;
         var _loc9_:§_-8Fe§ = null;
         var _loc12_:TextField = null;
         var _loc13_:TextField = null;
         var _loc14_:§_-BXj§ = null;
         var _loc15_:Boolean = false;
         var _loc16_:§_-1YC§ = null;
         super.init();
         _loc1_ = §_-5Kl§.createTextField(0,0,Context.§_-5o8§.message("petSaleDialogDescription"),§_-5Kl§.§_-0iQ§,{
            "size":18,
            "color":16710621,
            "glowFilter":{
               "color":15301144,
               "blurX":1.5,
               "blurY":1.5,
               "strength":50,
               "quality":5,
               "alpha":1
            }
         });
         addContent(_loc1_);
         _loc1_.x = dialogWidth / 2 - _loc1_.width / 2;
         _loc1_.y = 21;
         _loc2_ = §_-49j§.§_-FR§(Context.§_-70S§.§_-0ZU§().findCategoryById(§_-8Hh§.§_-Ajv§).allChildTypes);
         _loc3_ = new §_-5n7§();
         addContent(_loc3_);
         _loc4_ = 0;
         _loc5_ = 0;
         for each(_loc6_ in _loc2_)
         {
            _loc15_ = this.§_-5q9§(_loc6_);
            _loc16_ = new §_-1YC§(_loc6_,_loc15_);
            if(_loc15_)
            {
               _loc5_++;
            }
            _loc16_.x = _loc4_;
            _loc3_.addChild(_loc16_);
            _loc4_ += _loc16_.clientWidth + 48;
         }
         _loc3_.x = dialogWidth / 2 - _loc3_.width / 2;
         _loc3_.y = dialogHeight - 415;
         var _loc7_:§_-5Nf§ = _loc2_[0] as §_-5Nf§;
         var _loc8_:int = Math.ceil((_loc7_.oldGoldPrice - _loc7_.gold) / _loc7_.oldGoldPrice * 100);
         _loc9_ = new §_-8Fe§(_loc8_);
         _loc9_.x = _loc3_.width / 2 - _loc9_.clientWidth / 2;
         _loc9_.y = -_loc9_.clientHeight / 2 + 6;
         _loc3_.addChild(_loc9_);
         var _loc10_:§_-5n7§ = new §_-5n7§();
         var _loc11_:TextField = §_-5Kl§.createTextField(0,0,Context.§_-5o8§.message("petSaleDialogDescription2"),§_-5Kl§.§_-BGn§,{"size":16});
         _loc10_.addChild(_loc11_);
         _loc12_ = §_-5Kl§.createTextField(0,0,Context.§_-5o8§.message("petSaleDialogDescription3"),§_-5Kl§.§_-BGn§,{
            "size":16,
            "color":16711680
         });
         _loc12_.x = _loc11_.width;
         _loc10_.addChild(_loc12_);
         _loc13_ = §_-5Kl§.createTextField(0,0,Context.§_-5o8§.message("petSaleDialogDescription4"),§_-5Kl§.§_-BGn§,{"size":16});
         _loc13_.x = _loc11_.width + _loc12_.width;
         _loc10_.addChild(_loc13_);
         addContent(_loc10_);
         _loc10_.x = dialogWidth / 2 - _loc10_.width / 2;
         _loc10_.y = 365;
         _loc14_ = new §_-BXj§(campaign,_loc5_);
         addContent(_loc14_);
         _loc14_.x = dialogWidth / 2 - _loc14_.clientWidth / 2;
         _loc14_.y = 408;
      }
      
      override public function canShowDialog() : Boolean
      {
         return Context.§_-3gu§.§_-AE3§(campaign.id.toString(),§_-0h7§) && Context.§_-C8W§.§_-0QE§;
      }
      
      override protected function createSkin() : §_-Fs§
      {
         return new §_-5bz§();
      }
      
      private function §_-5q9§(param1:§_-5Nf§) : Boolean
      {
         return Context.cityPlayer.§_-CY8§((param1 as §_-5Nf§).petType) || Context.cityPlayer.getFurnitureCount(param1.typeId) > 0;
      }
   }
}

