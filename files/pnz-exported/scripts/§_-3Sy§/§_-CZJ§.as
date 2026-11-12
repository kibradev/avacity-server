package §_-3Sy§
{
   import §_-0Uz§.§_-3mj§;
   import §_-0Uz§.§_-6v4§;
   import §_-2qd§.§_-9ai§;
   import §_-39l§.§_-5t6§;
   import §_-40e§.§_-1m0§;
   import §_-45g§.§_-CKP§;
   import §_-5wm§.InventoryItem;
   import §_-5wm§.§_-BOZ§;
   import §_-62k§.§_-7Mj§;
   import §_-7f9§.§_-7Qe§;
   import §_-8sl§.§_-6t9§;
   import §_-8xR§.§_-7q1§;
   import §_-9VF§.§_-48g§;
   import §_-9VF§.§_-5ab§;
   import §_-9VF§.§_-9df§;
   import §_-AOz§.§_-2pt§;
   import §_-AOz§.§_-4aX§;
   import §_-AOz§.§_-5SV§;
   import §_-BeZ§.§_-4Ww§;
   import §_-GM§.Context;
   import penzville.Application;
   
   public class §_-CZJ§ extends §_-6v4§
   {
      public function §_-CZJ§()
      {
         super();
         §_-1-t§(§_-7Cv§.§_-CCi§,this.§_-9v0§);
         §_-1-t§(§_-7Cv§.§_-1t§,this.§_-2k6§);
         §_-1-t§(§_-7Cv§.§_-1X§,this.§_-3B1§);
         §_-1-t§(§_-6t9§.§_-8pn§,this.§_-00q§);
      }
      
      public function §_-33a§(param1:String) : void
      {
         var _loc2_:§_-4Ww§ = new §_-4Ww§();
         _loc2_.putString(§_-3Dv§.§_-6Un§,param1);
         §_-6gl§.sendExtMessage(§_-7Cv§.§_-CCi§,_loc2_);
      }
      
      public function buyFurniture(param1:String, param2:int) : void
      {
         var _loc3_:§_-4Ww§ = new §_-4Ww§();
         _loc3_.put(§_-3Dv§.§_-4Bi§,param1);
         _loc3_.put(§_-3Dv§.§_-4N8§,param2);
         §_-6gl§.sendExtMessage(§_-7Cv§.§_-1t§,_loc3_);
      }
      
      public function buyClothes(param1:Array, param2:String) : void
      {
         var _loc3_:§_-4Ww§ = new §_-4Ww§();
         _loc3_.§_-3f6§(§_-4aX§.§_-A2v§,param1);
         _loc3_.put(§_-2pt§.§_-3Fp§,param2);
         §_-6gl§.sendExtMessage(§_-6t9§.§_-24G§,_loc3_);
      }
      
      public function §_-Bvp§(param1:§_-7Mj§) : void
      {
         var _loc2_:§_-4Ww§ = new §_-4Ww§();
         _loc2_.§_-6JD§(§_-5ab§.§_-6b5§,param1);
         §_-6gl§.sendExtMessage(§_-6t9§.§_-8pn§,_loc2_);
      }
      
      private function §_-9v0§(param1:§_-9ai§) : void
      {
         var _loc3_:InventoryItem = null;
         var _loc2_:Boolean = param1.data.getBoolean(§_-3mj§.§_-2yH§);
         if(_loc2_)
         {
            _loc3_ = param1.data.§_-2jV§(§_-3Dv§.§_-eG§,InventoryItem);
            §_-5t6§.instance.§_-5Dg§(Context.cityPlayer.clanInfo.clanId).clanInventory.§_-8Po§.putItem(_loc3_);
            dispatchEvent(new §_-CKP§(§_-CKP§.§_-2R6§,_loc3_.typeId));
         }
         Context.§_-BlB§.§_-CCK§(new §_-7q1§(Context.§_-5o8§.message("buyCompleteTitle"),Context.§_-5o8§.message("buyCompleteMessage")));
      }
      
      private function §_-2k6§(param1:§_-9ai§) : void
      {
         var _loc3_:InventoryItem = null;
         var _loc2_:Boolean = param1.data.getBoolean(§_-3mj§.§_-2yH§);
         if(_loc2_)
         {
            _loc3_ = param1.data.§_-2jV§(§_-3Dv§.§_-CFn§,InventoryItem);
            if(_loc3_ != null)
            {
               §_-5t6§.instance.§_-5Dg§(Context.cityPlayer.clanInfo.clanId).clanInventory.§_-5Ml§.putItem(_loc3_);
               dispatchEvent(new §_-CKP§(§_-CKP§.§_-2R6§,_loc3_.typeId));
            }
         }
         Context.§_-BlB§.§_-CCK§(new §_-7q1§(Context.§_-5o8§.message("buyCompleteTitle"),Context.§_-5o8§.message("buyCompleteMessage")));
      }
      
      private function §_-3B1§(param1:§_-9ai§) : void
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
         Context.§_-BlB§.§_-CCK§(new §_-7q1§(Context.§_-5o8§.message("buyCompleteTitle"),Context.§_-5o8§.message("buyCompleteMessage")));
         dispatchEvent(new §_-CKP§(§_-CKP§.§_-607§));
      }
      
      private function §_-00q§(param1:§_-9ai§) : void
      {
         Context.player.avatarAppearance.fromAGSObject(param1.data.§_-ANw§(§_-5ab§.§_-6b5§));
         Application.instance.dispatchEvent(new §_-1m0§(§_-1m0§.§_-9FD§));
         if(param1.data.has(§_-5ab§.§_-0T5§))
         {
            Context.player.resources.fromAGSObject(param1.data.§_-ANw§(§_-5ab§.§_-0T5§));
            Application.instance.dispatchEvent(new §_-1m0§(§_-1m0§.§_-9FD§));
            Application.instance.dispatchEvent(new §_-1m0§(§_-1m0§.§_-CGy§));
            Application.instance.dispatchEvent(new §_-1m0§(§_-1m0§.§_-2dd§));
            Application.instance.dispatchEvent(new §_-1m0§(§_-1m0§.§_-BZg§));
         }
         if(param1.data.has(§_-7Qe§.§_-9cN§))
         {
            Context.§_-BlB§.§_-CCK§(new §_-7q1§(Context.§_-5o8§.message("buyCompleteTitle"),Context.§_-5o8§.message("buyCompleteMessage")));
         }
         dispatchEvent(new §_-CKP§(§_-CKP§.§_-1os§));
      }
   }
}

