package §_-8sl§
{
   import §_-0Uz§.§_-3mj§;
   import §_-0Uz§.§_-6v4§;
   import §_-2qd§.§_-9ai§;
   import §_-40e§.§_-1m0§;
   import §_-5wm§.InventoryItem;
   import §_-5wm§.§_-BOZ§;
   import §_-62k§.§_-7Mj§;
   import §_-7f9§.§_-7Qe§;
   import §_-9VF§.§_-48g§;
   import §_-9VF§.§_-5ab§;
   import §_-9VF§.§_-9df§;
   import §_-AKx§.§_-4OH§;
   import §_-AOz§.AvatarClothesItem;
   import §_-AOz§.§_-2pt§;
   import §_-AOz§.§_-4aX§;
   import §_-AOz§.§_-5SV§;
   import §_-BeZ§.§_-4Ww§;
   import §_-GM§.Context;
   import penzville.Application;
   
   public class §_-5QW§ extends §_-6v4§
   {
      public static const §_-4qb§:int = 50;
      
      public function §_-5QW§()
      {
         super();
         §_-1-t§(§_-6t9§.§_-8pn§,this.§_-0A7§);
         §_-1-t§(§_-6t9§.§_-4f2§,this.§_-0ng§);
         §_-1-t§(§_-6t9§.§_-96y§,this.§_-0ng§);
         §_-1-t§(§_-6t9§.§_-24G§,this.§_-8Am§);
         §_-1-t§(§_-6t9§.§_-AQO§,this.§_-0ng§);
         §_-1-t§(§_-6t9§.§_-9Hl§,this.§_-2kI§);
         §_-1-t§(§_-6t9§.§_-4rq§,this.§_-7kY§);
         §_-1-t§(§_-6t9§.§_-3Ge§,this.§_-BMF§);
         §_-1-t§(§_-6t9§.RENAME_AVATAR,this.§_-2HY§);
         §_-1-t§(§_-6t9§.§_-Ls§,this.§_-4-G§);
         §_-1-t§(§_-6t9§.§_-4NW§,this.§_-0rR§);
      }
      
      private function §_-2HY§(param1:§_-9ai§) : void
      {
         Context.player.avatarAppearance.name = param1.data.getString(§_-3mj§.§_-2-r§);
         var _loc2_:§_-5ab§ = Context.§_-3B2§.§_-07a§(Context.player.id);
         var _loc3_:String = param1.data.getString(§_-3mj§.§_-2-r§);
         if(_loc2_ != null)
         {
            _loc2_.avatarAppearance.name = _loc3_;
         }
         Application.instance.dispatchEvent(new §_-1m0§(§_-1m0§.§_-9FD§,_loc3_));
         if(param1.data.has(§_-5ab§.§_-0T5§))
         {
            Context.player.resources.fromAGSObject(param1.data.§_-ANw§(§_-5ab§.§_-0T5§));
            Application.instance.dispatchEvent(new §_-1m0§(§_-1m0§.§_-2dd§));
         }
      }
      
      private function §_-0A7§(param1:§_-9ai§) : void
      {
         Context.player.avatarAppearance.fromAGSObject(param1.data.§_-ANw§(§_-5ab§.§_-6b5§));
         Application.instance.dispatchEvent(new §_-1m0§(§_-1m0§.§_-9FD§));
         if(param1.data.has(§_-5ab§.§_-0T5§))
         {
            Context.player.resources.fromAGSObject(param1.data.§_-ANw§(§_-5ab§.§_-0T5§));
            Application.instance.dispatchEvent(new §_-1m0§(§_-1m0§.§_-2dd§));
         }
      }
      
      protected function §_-0ng§(param1:§_-9ai§) : void
      {
         var _loc3_:Boolean = false;
         var _loc2_:§_-48g§ = Context.cityPlayer;
         _loc2_.avatarClothes.fromAGSObject(param1.data.§_-ANw§(§_-5ab§.§_-7J0§));
         _loc2_.inventory.§_-35N§(param1.data.§_-Bc6§(§_-BOZ§.§_-91R§,InventoryItem));
         _loc2_.resources.fromAGSObject(param1.data.§_-ANw§(§_-5ab§.§_-0T5§));
         _loc2_.cityInfo.clothesRating = param1.data.getInt(§_-9df§.§_-0aP§);
         _loc3_ = param1.data.getBoolean(§_-7Qe§.§_-7P§);
         var _loc4_:§_-2pt§ = param1.data.§_-2jV§(§_-5SV§.§_-9tA§,§_-2pt§);
         _loc2_.clothesCollections.currentCollectionType = _loc4_.type;
         _loc2_.clothesCollections.§_-1y5§(_loc4_);
         Application.instance.dispatchEvent(new §_-1m0§(§_-1m0§.§_-9FD§));
         Application.instance.dispatchEvent(new §_-1m0§(§_-1m0§.§_-CGy§));
         Application.instance.dispatchEvent(new §_-1m0§(§_-1m0§.§_-2dd§));
         Application.instance.dispatchEvent(new §_-1m0§(§_-1m0§.§_-BZg§));
         if(_loc3_)
         {
            this.§_-34v§();
         }
      }
      
      protected function §_-8Am§(param1:§_-9ai§) : void
      {
         var _loc2_:§_-48g§ = Context.cityPlayer;
         _loc2_.avatarClothes.fromAGSObject(param1.data.§_-ANw§(§_-5ab§.§_-7J0§));
         _loc2_.inventory.§_-35N§(param1.data.§_-Bc6§(§_-BOZ§.§_-91R§,InventoryItem));
         _loc2_.resources.fromAGSObject(param1.data.§_-ANw§(§_-5ab§.§_-0T5§));
         _loc2_.cityInfo.clothesRating = param1.data.getInt(§_-9df§.§_-0aP§);
         var _loc3_:Boolean = param1.data.getBoolean(§_-7Qe§.§_-7P§);
         var _loc4_:§_-2pt§ = param1.data.§_-2jV§(§_-5SV§.§_-9tA§,§_-2pt§);
         _loc2_.clothesCollections.currentCollectionType = _loc4_.type;
         _loc2_.clothesCollections.§_-1y5§(_loc4_);
         Application.instance.dispatchEvent(new §_-1m0§(§_-1m0§.§_-9FD§));
         Application.instance.dispatchEvent(new §_-1m0§(§_-1m0§.§_-CGy§));
         Application.instance.dispatchEvent(new §_-1m0§(§_-1m0§.§_-2dd§));
         Application.instance.dispatchEvent(new §_-1m0§(§_-1m0§.§_-BZg§));
         if(_loc3_)
         {
            this.§_-34v§();
         }
      }
      
      private function §_-34v§() : void
      {
         §_-4OH§.§_-B5P§(Context.§_-5o8§.message("warning"),Context.§_-5o8§.message("wrongDressCodeAlert"));
      }
      
      protected function §_-2kI§(param1:§_-9ai§) : void
      {
         var _loc2_:§_-48g§ = Context.cityPlayer;
         _loc2_.avatarClothes.fromAGSObject(param1.data.§_-ANw§(§_-5ab§.§_-7J0§));
         _loc2_.inventory.§_-35N§(param1.data.§_-Bc6§(§_-BOZ§.§_-91R§,InventoryItem));
         _loc2_.resources.fromAGSObject(param1.data.§_-ANw§(§_-5ab§.§_-0T5§));
         _loc2_.cityInfo.clothesRating = param1.data.getInt(§_-9df§.§_-0aP§);
         var _loc3_:§_-2pt§ = param1.data.§_-2jV§(§_-5SV§.§_-9tA§,§_-2pt§);
         _loc2_.clothesCollections.currentCollectionType = _loc3_.type;
         _loc2_.clothesCollections.§_-1y5§(_loc3_);
         Application.instance.dispatchEvent(new §_-1m0§(§_-1m0§.§_-9FD§));
         Application.instance.dispatchEvent(new §_-1m0§(§_-1m0§.§_-CGy§));
         Application.instance.dispatchEvent(new §_-1m0§(§_-1m0§.§_-2dd§));
         Application.instance.dispatchEvent(new §_-1m0§(§_-1m0§.§_-BZg§));
      }
      
      protected function §_-7kY§(param1:§_-9ai§) : void
      {
         var _loc2_:§_-48g§ = Context.cityPlayer;
         _loc2_.avatarClothes.fromAGSObject(param1.data.§_-ANw§(§_-5ab§.§_-7J0§));
         _loc2_.inventory.§_-35N§(param1.data.§_-Bc6§(§_-BOZ§.§_-91R§,InventoryItem));
         _loc2_.resources.fromAGSObject(param1.data.§_-ANw§(§_-5ab§.§_-0T5§));
         _loc2_.cityInfo.clothesRating = param1.data.getInt(§_-9df§.§_-0aP§);
         var _loc3_:§_-2pt§ = param1.data.§_-2jV§(§_-5SV§.§_-9tA§,§_-2pt§);
         _loc2_.clothesCollections.currentCollectionType = _loc3_.type;
         _loc2_.clothesCollections.§_-1y5§(_loc3_);
         Application.instance.dispatchEvent(new §_-1m0§(§_-1m0§.§_-9FD§));
         Application.instance.dispatchEvent(new §_-1m0§(§_-1m0§.§_-CGy§));
         Application.instance.dispatchEvent(new §_-1m0§(§_-1m0§.§_-2dd§));
         Application.instance.dispatchEvent(new §_-1m0§(§_-1m0§.§_-BZg§));
      }
      
      protected function §_-BMF§(param1:§_-9ai§) : void
      {
         var _loc2_:§_-48g§ = Context.cityPlayer;
         _loc2_.avatarClothes.fromAGSObject(param1.data.§_-ANw§(§_-5ab§.§_-7J0§));
         _loc2_.inventory.§_-35N§(param1.data.§_-Bc6§(§_-BOZ§.§_-91R§,InventoryItem));
         var _loc3_:§_-2pt§ = param1.data.§_-2jV§(§_-5SV§.§_-9tA§,§_-2pt§);
         _loc2_.clothesCollections.currentCollectionType = _loc3_.type;
         _loc2_.clothesCollections.§_-1y5§(_loc3_);
         Application.instance.dispatchEvent(new §_-1m0§(§_-1m0§.§_-3bw§));
         Application.instance.dispatchEvent(new §_-1m0§(§_-1m0§.§_-CGy§));
      }
      
      protected function §_-4-G§(param1:§_-9ai§) : void
      {
         var _loc2_:§_-48g§ = Context.cityPlayer;
         _loc2_.avatarClothes.fromAGSObject(param1.data.§_-ANw§(§_-5ab§.§_-7J0§));
         _loc2_.inventory.§_-35N§(param1.data.§_-Bc6§(§_-BOZ§.§_-91R§,InventoryItem));
         _loc2_.cityInfo.clothesRating = param1.data.getInt(§_-9df§.§_-0aP§);
         var _loc3_:§_-2pt§ = param1.data.§_-2jV§(§_-5SV§.§_-9tA§,§_-2pt§);
         _loc2_.clothesCollections.currentCollectionType = _loc3_.type;
         _loc2_.clothesCollections.§_-1y5§(_loc3_);
         Application.instance.dispatchEvent(new §_-1m0§(§_-1m0§.§_-9FD§));
         Application.instance.dispatchEvent(new §_-1m0§(§_-1m0§.§_-CGy§));
         Application.instance.dispatchEvent(new §_-1m0§(§_-1m0§.§_-BZg§));
      }
      
      protected function §_-0rR§(param1:§_-9ai§) : void
      {
         var _loc2_:§_-48g§ = param1.data.§_-2jV§(§_-3mj§.§_-6gj§,§_-48g§);
         if(_loc2_ == null)
         {
            return;
         }
         Context.§_-BlB§.§_-0bV§(_loc2_);
      }
      
      public function saveAvatarAppearance(param1:§_-7Mj§) : void
      {
         var _loc2_:§_-4Ww§ = new §_-4Ww§();
         _loc2_.§_-6JD§(§_-5ab§.§_-6b5§,param1);
         §_-6gl§.sendExtMessage(§_-6t9§.§_-8pn§,_loc2_);
      }
      
      public function §_-08v§(param1:String, param2:uint, param3:String) : void
      {
         var _loc4_:§_-4Ww§ = new §_-4Ww§();
         _loc4_.put(§_-7Qe§.§_-AL1§,param1);
         _loc4_.put(§_-7Qe§.§_-15D§,param2);
         _loc4_.put(§_-2pt§.§_-3Fp§,param3);
         §_-6gl§.sendExtMessage(§_-6t9§.§_-AQO§,_loc4_);
      }
      
      public function §_-6Pq§(param1:Array, param2:String) : void
      {
         var _loc3_:§_-4Ww§ = new §_-4Ww§();
         _loc3_.§_-3f6§(§_-4aX§.§_-A2v§,param1);
         _loc3_.put(§_-2pt§.§_-3Fp§,param2);
         §_-6gl§.sendExtMessage(§_-6t9§.§_-96y§,_loc3_);
      }
      
      public function §_-3Qj§(param1:String, param2:uint, param3:Array, param4:String) : void
      {
         var _loc5_:§_-4Ww§ = new §_-4Ww§();
         _loc5_.put(§_-7Qe§.§_-AL1§,param1);
         _loc5_.put(§_-7Qe§.§_-15D§,param2);
         _loc5_.§_-3f6§(§_-4aX§.§_-A2v§,param3);
         _loc5_.put(§_-2pt§.§_-3Fp§,param4);
         §_-6gl§.sendExtMessage(§_-6t9§.§_-4f2§,_loc5_);
      }
      
      public function §_-53Y§(param1:Array, param2:String, param3:Array = null) : void
      {
         var _loc4_:§_-4Ww§ = new §_-4Ww§();
         _loc4_.§_-3f6§(§_-4aX§.§_-A2v§,param1);
         _loc4_.put(§_-2pt§.§_-3Fp§,param2);
         _loc4_.§_-3f6§(§_-4aX§.§_-4EX§,param3);
         §_-6gl§.sendExtMessage(§_-6t9§.§_-24G§,_loc4_);
      }
      
      public function buyAnotherAvatarClothes(param1:Array, param2:String) : void
      {
         var _loc3_:§_-4Ww§ = new §_-4Ww§();
         _loc3_.§_-3f6§(§_-4aX§.§_-A2v§,param1);
         _loc3_.put(§_-2pt§.§_-3Fp§,param2);
         §_-6gl§.sendExtMessage(§_-6t9§.§_-9Hl§,_loc3_);
      }
      
      public function buyPodiumClothes(param1:Array, param2:String) : void
      {
         var _loc3_:§_-4Ww§ = new §_-4Ww§();
         _loc3_.§_-3f6§(§_-4aX§.§_-A2v§,param1);
         _loc3_.put(§_-2pt§.§_-3Fp§,param2);
         §_-6gl§.sendExtMessage(§_-6t9§.§_-4rq§,_loc3_);
      }
      
      public function wearClothes(param1:Array, param2:String) : void
      {
         var _loc3_:§_-4Ww§ = new §_-4Ww§();
         _loc3_.§_-3f6§(§_-4aX§.§_-A2v§,param1);
         _loc3_.put(§_-2pt§.§_-3Fp§,param2);
         §_-6gl§.sendExtMessage(§_-6t9§.§_-3Ge§,_loc3_);
      }
      
      public function renameAvatar(param1:String) : void
      {
         var _loc2_:§_-4Ww§ = new §_-4Ww§();
         _loc2_.put(§_-3mj§.§_-2-r§,param1);
         §_-6gl§.sendExtMessage(§_-6t9§.RENAME_AVATAR,_loc2_);
      }
      
      public function §_-766§(param1:AvatarClothesItem, param2:String) : void
      {
         var _loc3_:§_-4Ww§ = new §_-4Ww§();
         _loc3_.§_-6JD§(AvatarClothesItem.§_-3eX§,param1);
         _loc3_.put(§_-2pt§.§_-3Fp§,param2);
         §_-6gl§.sendExtMessage(§_-6t9§.§_-Ls§,_loc3_);
      }
   }
}

