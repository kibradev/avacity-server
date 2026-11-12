package §_-0wn§
{
   import §_-0Uz§.§_-6v4§;
   import §_-0XI§.§_-7fw§;
   import §_-0uA§.§_-3YE§;
   import §_-1vM§.§_-6He§;
   import §_-2qd§.§_-9ai§;
   import §_-3Kp§.§_-cA§;
   import §_-5eM§.§_-4Z7§;
   import §_-6Pj§.§_-BsD§;
   import §_-7s3§.§_-2X1§;
   import §_-7s3§.§_-7lx§;
   import §_-8Hp§.§_-5KD§;
   import §_-99s§.§_-7Tj§;
   import §_-9VF§.§_-48g§;
   import §_-Am4§.§_-6w0§;
   import §_-Am4§.§_-Cdm§;
   import §_-BeZ§.§_-4Ww§;
   import §_-GM§.Context;
   import penzville.§_-7tX§;
   
   public class §_-1BG§ extends §_-6v4§
   {
      public static const §_-3kJ§:String = "chatDecor";
      
      public static const §_-1c-§:String = "chatDecorShop";
      
      public static const §_-7F1§:String = "stickerPack";
      
      public static const §_-A5q§:String = "common";
      
      public static const §_-lS§:String = "label";
      
      public static const §_-2gn§:String = "color";
      
      public static const §_-UA§:String = "position";
      
      public static const §_-CIX§:String = "alwaysShow";
      
      public static const §_-7JZ§:String = "titleColor";
      
      public static const §_-3CB§:String = "textColor";
      
      public static const §_-6Ma§:String = "left";
      
      public static const §_-B8Z§:String = "right";
      
      public static const §_-0lG§:String = "center";
      
      public function §_-1BG§()
      {
         super();
         §_-1-t§(§_-Cdm§.§_-7jy§,this.§_-78d§);
      }
      
      public function isActive() : Boolean
      {
         return §_-5KD§.instance.getModuleItem(§_-3kJ§) != null;
      }
      
      public function §_-Tw§() : Boolean
      {
         return §_-5KD§.instance.getModuleItem(§_-1c-§) != null;
      }
      
      public function §_-4fS§(param1:§_-2X1§, param2:Boolean, param3:Boolean, param4:Boolean) : void
      {
         if(!this.§_-Tw§())
         {
            return;
         }
         var _loc5_:§_-4Ww§ = new §_-4Ww§();
         _loc5_.§_-6JD§(§_-6w0§.§_-7n-§,param1);
         _loc5_.§_-6YJ§(§_-6w0§.§_-8va§,param2);
         _loc5_.§_-6YJ§(§_-6w0§.§_-AUh§,param3);
         _loc5_.§_-6YJ§(§_-6w0§.§_-1TT§,param4);
         §_-6gl§.sendExtMessage(§_-Cdm§.§_-7jy§,_loc5_);
      }
      
      public function §_-3dX§(param1:String) : void
      {
         var _loc2_:§_-2X1§ = Context.cityPlayer.§_-3y1§;
         _loc2_.§_-6Bm§ = param1;
         this.§_-4fS§(_loc2_,false,false,true);
      }
      
      public function §_-9uh§(param1:String) : String
      {
         if(!this.isActive())
         {
            return null;
         }
         var _loc2_:§_-48g§ = Context.§_-3B2§.§_-07a§(param1) as §_-48g§;
         if(_loc2_ == null)
         {
            return null;
         }
         var _loc3_:§_-2X1§ = _loc2_.§_-3y1§;
         if(_loc3_ == null || _loc3_.§_-9mO§ == null)
         {
            return null;
         }
         return this.§_-6Cs§(_loc3_.§_-9mO§,§_-lS§);
      }
      
      public function §_-7zZ§(param1:String) : String
      {
         var _loc2_:§_-48g§ = Context.§_-3B2§.§_-07a§(param1) as §_-48g§;
         if(_loc2_ == null)
         {
            return §_-6Ma§;
         }
         var _loc3_:§_-2X1§ = _loc2_.§_-3y1§;
         if(_loc3_ == null || _loc3_.§_-9mO§ == null)
         {
            return §_-6Ma§;
         }
         var _loc4_:String = this.§_-6Cs§(_loc3_.§_-9mO§,§_-UA§);
         return _loc4_ == null ? §_-6Ma§ : _loc4_;
      }
      
      public function §_-6GC§(param1:String) : String
      {
         if(!this.isActive())
         {
            return null;
         }
         var _loc2_:§_-48g§ = Context.§_-3B2§.§_-07a§(param1) as §_-48g§;
         if(_loc2_ == null)
         {
            return null;
         }
         var _loc3_:§_-2X1§ = _loc2_.§_-3y1§;
         if(_loc3_ == null || _loc3_.textColor == null)
         {
            return null;
         }
         return this.§_-6Cs§(_loc3_.textColor,§_-2gn§);
      }
      
      public function §_-6Cs§(param1:String, param2:String) : *
      {
         var _loc3_:§_-7Tj§ = Context.§_-70S§.findShopItem(param1);
         if(_loc3_ == null)
         {
            §_-3YE§.error("itemType is null, itemId=" + param1);
            return null;
         }
         var _loc4_:String = _loc3_.getParam(param2);
         if(_loc4_ == null)
         {
            §_-3YE§.error("itemType param " + param2 + " is null, itemId=" + param1);
         }
         return _loc4_;
      }
      
      public function §_-68d§(param1:String) : Boolean
      {
         var _loc2_:§_-7Tj§ = this.getStickerPackItem(param1);
         if(_loc2_ == null)
         {
            return false;
         }
         if(_loc2_.isVip)
         {
            if(Context.cityPlayer.§_-3k5§)
            {
               return true;
            }
            §_-7tX§.§_-53l§(Context.§_-5o8§.message("locationNeedVipTitle"),Context.§_-5o8§.message("useVipSmilesVipOnlyItemWarning"));
            return false;
         }
         return this.§_-Bc1§(_loc2_.typeId);
      }
      
      public function §_-A39§(param1:§_-7lx§) : §_-cA§
      {
         var _loc2_:§_-7Tj§ = this.getStickerPackItem(param1.§_-KT§);
         if(_loc2_ == null)
         {
            return null;
         }
         return new §_-cA§(_loc2_,param1.§_-0rK§,false);
      }
      
      public function §_-CAq§(param1:String) : Boolean
      {
         var _loc2_:§_-7Tj§ = this.getStickerPackItem(param1);
         if(_loc2_.isVip)
         {
            return Context.cityPlayer.§_-3k5§;
         }
         return this.§_-Bc1§(param1);
      }
      
      public function §_-6Ow§() : Array
      {
         var _loc3_:§_-6He§ = null;
         var _loc4_:Array = null;
         var _loc5_:§_-7Tj§ = null;
         var _loc1_:Object = Context.§_-70S§.§_-0ZU§().findCategoryById(§_-4Z7§.§_-5yN§).allChildTypes;
         var _loc2_:Object = Context.§_-70S§.§_-0ZU§().findCategoryById(§_-4Z7§.§_-25g§).allChildTypes;
         for each(_loc3_ in _loc2_)
         {
            if(_loc3_.findParentCategory(§_-1BG§.§_-7F1§))
            {
               _loc1_[_loc3_.typeId] = _loc3_;
            }
         }
         _loc4_ = [];
         for each(_loc5_ in _loc1_)
         {
            if(§_-5KD§.instance.canBuyItem(_loc5_.typeId))
            {
               if(_loc5_.isVip || this.§_-Bc1§(_loc5_.typeId))
               {
                  _loc4_.push(_loc5_);
               }
            }
         }
         _loc4_.sortOn("priority",Array.NUMERIC);
         return _loc4_;
      }
      
      public function §_-28W§() : §_-7fw§
      {
         var _loc1_:Array = this.§_-6Ow§();
         return _loc1_.length != 0 ? _loc1_[0] as §_-7fw§ : null;
      }
      
      public function §_-9SK§(param1:String) : §_-7Tj§
      {
         var _loc3_:§_-7Tj§ = null;
         var _loc2_:Array = this.§_-6Ow§();
         for each(_loc3_ in _loc2_)
         {
            if(_loc3_.typeId == param1)
            {
               return _loc3_;
            }
         }
         return null;
      }
      
      private function getStickerPackItem(param1:String) : §_-7Tj§
      {
         return Context.§_-70S§.§_-0ZU§().findCategoryById(§_-4Z7§.§_-5yN§).findTypeById(param1) as §_-7Tj§;
      }
      
      private function §_-Bc1§(param1:String) : Boolean
      {
         if(!this.isActive())
         {
            return false;
         }
         var _loc2_:§_-2X1§ = Context.cityPlayer.§_-3y1§;
         return _loc2_ != null && _loc2_.§_-6Jm§ != null && _loc2_.§_-6Jm§.indexOf(param1) != -1;
      }
      
      private function §_-78d§(param1:§_-9ai§) : void
      {
         var _loc2_:§_-BsD§ = new §_-BsD§();
         _loc2_.§_-5eA§(Context.§_-5o8§.message("chatDecorSaveModelTitle"),Context.§_-5o8§.message("chatDecorSaveModelMessage"));
      }
   }
}

