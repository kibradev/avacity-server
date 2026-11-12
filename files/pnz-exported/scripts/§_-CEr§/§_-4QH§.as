package §_-CEr§
{
   import §_-04Y§.§_-14Q§;
   import §_-0Uz§.§_-6v4§;
   import §_-2Er§.§_-2AV§;
   import §_-2Er§.§_-4jL§;
   import §_-2qd§.§_-9ai§;
   import §_-40e§.§_-1m0§;
   import §_-4cY§.§_-3sw§;
   import §_-4cY§.§_-Akc§;
   import §_-4cY§.§_-B19§;
   import §_-5wm§.InventoryItem;
   import §_-5wm§.§_-BOZ§;
   import §_-6BB§.§_-8BS§;
   import §_-6GW§.§_-BSm§;
   import §_-7f9§.§_-7Qe§;
   import §_-7lY§.§_-CA5§;
   import §_-8i3§.§_-2E0§;
   import §_-8i3§.§_-XJ§;
   import §_-9VF§.§_-48g§;
   import §_-9VF§.§_-5ab§;
   import §_-9VF§.§_-9df§;
   import §_-BeZ§.§_-1e5§;
   import §_-BeZ§.§_-4Ww§;
   import §_-CF9§.§_-3t§;
   import §_-GM§.Context;
   import §_-Uk§.§_-5ZD§;
   import penzville.Application;
   
   public class §_-4QH§ extends §_-6v4§
   {
      public function §_-4QH§()
      {
         super();
         §_-1-t§(§_-0jY§.§_-CN§,this.§_-3a-§);
         §_-1-t§(§_-0jY§.BUY_ROOM,this.§_-5W0§);
         §_-1-t§(§_-0jY§.§_-18N§,this.§_-0SG§);
         §_-1-t§(§_-0jY§.§_-3Jo§,this.§_-8Vr§);
         §_-1-t§(§_-0jY§.§_-Jw§,this.§_-B-6§);
         §_-1-t§(§_-0jY§.§_-0Bs§,this.§_-3zv§);
         §_-1-t§(§_-0jY§.§_-2bl§,this.§_-5uy§);
      }
      
      private function §_-3a-§(param1:§_-9ai§) : void
      {
         var _loc2_:§_-48g§ = Context.cityPlayer;
         _loc2_.house.fromAGSObject(param1.data.§_-ANw§(§_-48g§.§_-8hM§));
         _loc2_.cityInfo.fromAGSObject(param1.data.§_-ANw§(§_-48g§.§_-Bnh§));
         Application.instance.dispatchEvent(new §_-1m0§(§_-1m0§.§_-0qm§));
         Application.instance.dispatchEvent(new §_-1m0§(§_-1m0§.§_-BZg§));
         if(Context.§_-3hG§.currentScreen is §_-5ZD§)
         {
            (Context.§_-3hG§.currentScreen as §_-5ZD§).refreshRoom();
         }
      }
      
      private function §_-0SG§(param1:§_-9ai§) : void
      {
         var _loc2_:§_-48g§ = Context.cityPlayer;
         var _loc3_:§_-2E0§ = param1.data.§_-2jV§(§_-XJ§.§_-4zy§,§_-2E0§);
         _loc2_.house.addRoom(_loc3_);
         var _loc4_:§_-3t§ = new §_-3t§();
         _loc4_.targetRoomId = _loc3_.id;
         dispatchEvent(new §_-CA5§(§_-CA5§.§_-AUP§,_loc4_));
         Application.instance.dispatchEvent(new §_-1m0§(§_-1m0§.§_-BgA§,_loc3_));
      }
      
      private function §_-5W0§(param1:§_-9ai§) : void
      {
         var _loc2_:§_-48g§ = Context.cityPlayer;
         var _loc3_:§_-2E0§ = param1.data.§_-2jV§(§_-XJ§.§_-4zy§,§_-2E0§);
         _loc2_.house.addRoom(_loc3_);
         _loc2_.resources.fromAGSObject(param1.data.§_-ANw§(§_-5ab§.§_-0T5§));
         _loc2_.cityInfo.fromAGSObject(param1.data.§_-ANw§(§_-48g§.§_-Bnh§));
         var _loc4_:int = param1.data.getInt(§_-Akc§.§_-6Ud§);
         var _loc5_:§_-3t§ = new §_-3t§();
         _loc5_.targetRoomId = _loc3_.id;
         _loc5_.objectId = _loc4_.toString();
         dispatchEvent(new §_-CA5§(§_-CA5§.§_-AUP§,_loc5_));
         Application.instance.dispatchEvent(new §_-1m0§(§_-1m0§.§_-BgA§,_loc3_));
         Application.instance.dispatchEvent(new §_-1m0§(§_-1m0§.§_-2dd§));
         Application.instance.dispatchEvent(new §_-1m0§(§_-1m0§.§_-BZg§));
      }
      
      private function §_-5uy§(param1:§_-9ai§) : void
      {
         var _loc2_:String = param1.data.getString(§_-2E0§.§_-6Ud§);
         var _loc3_:String = param1.data.getString(§_-2E0§.§_-8Aa§);
         var _loc4_:§_-2E0§ = Context.cityPlayer.house.getRoom(_loc2_);
         if(_loc4_ != null)
         {
            _loc4_.name = _loc3_;
         }
         dispatchEvent(new §_-CA5§(§_-CA5§.§_-2bl§,null,_loc3_));
         Application.instance.dispatchEvent(new §_-1m0§(§_-1m0§.§_-BXo§,_loc4_));
      }
      
      private function §_-8Vr§(param1:§_-9ai§) : void
      {
         var _loc4_:int = 0;
         var _loc5_:§_-9df§ = null;
         if(Context.§_-2BT§.adapter.socialNetwork == §_-8BS§.§_-BOa§ && !Context.cityPlayer.isTutorial)
         {
            _loc4_ = Context.cityPlayer.cityInfo.houseRating;
            _loc5_ = new §_-9df§();
            _loc5_.fromAGSObject(param1.data.§_-ANw§(§_-48g§.§_-Bnh§));
            if(_loc5_.houseRating > _loc4_)
            {
               Context.§_-sF§.§_-37Y§(_loc4_,_loc5_.houseRating);
            }
         }
         var _loc2_:§_-48g§ = Context.cityPlayer;
         _loc2_.inventory.§_-35N§(param1.data.§_-Bc6§(§_-BOZ§.§_-91R§,InventoryItem));
         var _loc3_:§_-4Ww§ = param1.data.§_-ANw§(§_-48g§.§_-8hM§);
         _loc2_.house.getRoom(_loc3_.getString(§_-2E0§.§_-6Ud§)).fromAGSObject(_loc3_);
         _loc2_.cityInfo.fromAGSObject(param1.data.§_-ANw§(§_-48g§.§_-Bnh§));
         Application.instance.dispatchEvent(new §_-1m0§(§_-1m0§.§_-CGy§));
         Application.instance.dispatchEvent(new §_-1m0§(§_-1m0§.§_-0qm§));
         Application.instance.dispatchEvent(new §_-1m0§(§_-1m0§.§_-BZg§));
      }
      
      private function §_-B-6§(param1:§_-9ai§) : void
      {
         var _loc8_:§_-48g§ = null;
         var _loc2_:§_-4Ww§ = param1.data;
         var _loc3_:§_-3sw§ = _loc2_.§_-2jV§(§_-2E0§.§_-4l5§,§_-3sw§);
         var _loc4_:String = param1.data.getString(§_-2E0§.§_-6Ud§);
         var _loc5_:§_-2E0§ = Context.cityPlayer.house.getRoom(_loc4_);
         if(_loc5_ == null || _loc5_.getFurniture(Number(_loc3_.id)) == null)
         {
            return;
         }
         var _loc6_:§_-4Ww§ = param1.data.§_-ANw§(§_-48g§.§_-Bnh§);
         if(_loc6_ != null)
         {
            _loc8_ = Context.cityPlayer;
            _loc8_.cityInfo.fromAGSObject(_loc6_);
            Application.instance.dispatchEvent(new §_-1m0§(§_-1m0§.§_-BZg§));
         }
         var _loc7_:§_-3sw§ = _loc5_.getFurniture(Number(_loc3_.id)) as §_-3sw§;
         _loc7_.items = _loc3_.items;
         Application.instance.dispatchEvent(new §_-1m0§(§_-1m0§.§_-4wQ§));
      }
      
      private function §_-3zv§(param1:§_-9ai§) : void
      {
         var _loc10_:§_-48g§ = null;
         var _loc2_:§_-4Ww§ = param1.data;
         var _loc3_:String = param1.data.getString(§_-2E0§.§_-6Ud§);
         var _loc4_:§_-4Ww§ = _loc2_.§_-ANw§(§_-2E0§.§_-4l5§);
         var _loc5_:int = _loc4_.getInt(§_-Akc§.§_-6Ud§);
         var _loc6_:Object = _loc4_.getMap(§_-4jL§.§_-Fo§,§_-2AV§);
         var _loc7_:§_-2E0§ = Context.cityPlayer.house.getRoom(_loc3_);
         if(_loc7_ == null || _loc7_.getFurniture(_loc5_) == null)
         {
            return;
         }
         var _loc8_:§_-4Ww§ = param1.data.§_-ANw§(§_-48g§.§_-Bnh§);
         if(_loc8_ != null)
         {
            _loc10_ = Context.cityPlayer;
            _loc10_.cityInfo.fromAGSObject(_loc8_);
            Application.instance.dispatchEvent(new §_-1m0§(§_-1m0§.§_-BZg§));
         }
         var _loc9_:§_-4jL§ = _loc7_.getFurniture(_loc5_) as §_-4jL§;
         _loc9_.§_-6YP§ = _loc6_;
         Application.instance.dispatchEvent(new §_-1m0§(§_-1m0§.§_-4wQ§));
      }
      
      public function buyFurniture(param1:String, param2:uint, param3:int = 1) : void
      {
         var _loc4_:§_-4Ww§ = new §_-4Ww§();
         _loc4_.put(§_-7Qe§.§_-AL1§,param1);
         _loc4_.put(§_-7Qe§.§_-15D§,param2);
         _loc4_.put(§_-7Qe§.§_-4N8§,param3);
         §_-6gl§.sendExtMessage(§_-0jY§.§_-BMa§,_loc4_);
      }
      
      public function §_-Amd§(param1:§_-3t§, param2:String, param3:String, param4:int, param5:String) : void
      {
         var _loc6_:§_-4Ww§ = new §_-4Ww§();
         var _loc7_:§_-B19§ = new §_-B19§();
         _loc7_.id = int(param1.objectId);
         _loc7_.wx = param1.wx;
         _loc7_.wy = param1.wy;
         _loc7_.wz = param1.wz;
         _loc7_.direction = param1.direction;
         _loc7_.typeId = param1.typeId;
         _loc6_.§_-6JD§(§_-0jY§.§_-6W8§,_loc7_);
         _loc6_.put(§_-2E0§.§_-8Aa§,param2);
         _loc6_.put(§_-7Qe§.§_-AL1§,param3);
         _loc6_.put(§_-7Qe§.§_-15D§,param4);
         _loc6_.put(§_-2E0§.§_-6Ud§,param5);
         §_-6gl§.sendExtMessage(§_-0jY§.§_-18N§,_loc6_);
      }
      
      public function buyRoom(param1:String, param2:String, param3:String, param4:int, param5:String) : void
      {
         var _loc6_:§_-4Ww§ = new §_-4Ww§();
         _loc6_.put(§_-Akc§.§_-6Ud§,param1);
         _loc6_.put(§_-2E0§.§_-8Aa§,param2);
         _loc6_.put(§_-7Qe§.§_-AL1§,param3);
         _loc6_.put(§_-7Qe§.§_-15D§,param4);
         _loc6_.put(§_-2E0§.§_-6Ud§,param5);
         §_-6gl§.sendExtMessage(§_-0jY§.BUY_ROOM,_loc6_);
      }
      
      public function renameRoom(param1:String, param2:String) : void
      {
         var _loc3_:§_-4Ww§ = new §_-4Ww§();
         _loc3_.put(§_-2E0§.§_-6Ud§,param1);
         _loc3_.put(§_-2E0§.§_-8Aa§,param2);
         §_-6gl§.sendExtMessage(§_-0jY§.§_-2bl§,_loc3_);
      }
      
      public function §_-5l5§(param1:Object, param2:String) : void
      {
         var _loc4_:§_-14Q§ = null;
         var _loc5_:§_-4Ww§ = null;
         var _loc3_:§_-1e5§ = new §_-1e5§();
         for each(_loc4_ in param1)
         {
            _loc3_.addObject(_loc4_);
         }
         _loc5_ = new §_-4Ww§();
         _loc5_.put(§_-2E0§.§_-4l5§,_loc3_);
         §_-6gl§.sendExtMessage(§_-0jY§.§_-3Jo§,_loc5_,param2);
      }
      
      public function §_-hI§(param1:Object, param2:String, param3:String) : void
      {
         var _loc4_:§_-4Ww§ = new §_-4Ww§();
         _loc4_.put(§_-BSm§.§_-3Z1§,param3);
         _loc4_.§_-5CI§(§_-3sw§.§_-4SZ§,param1);
         _loc4_.put(§_-Akc§.§_-6Ud§,param2);
         §_-6gl§.sendExtMessage(§_-0jY§.§_-Jw§,_loc4_,param3);
      }
      
      public function §_-5Ax§(param1:Object, param2:String, param3:String) : void
      {
         var _loc4_:§_-4Ww§ = new §_-4Ww§();
         _loc4_.put(§_-BSm§.§_-3Z1§,param3);
         _loc4_.§_-5CI§(§_-4jL§.§_-Fo§,param1);
         _loc4_.put(§_-Akc§.§_-6Ud§,param2);
         §_-6gl§.sendExtMessage(§_-0jY§.§_-0Bs§,_loc4_,param3);
      }
      
      public function §_-757§(param1:String) : void
      {
         var _loc2_:§_-4Ww§ = new §_-4Ww§();
         _loc2_.put(§_-2E0§.§_-6Ud§,param1);
         §_-6gl§.sendExtMessage(§_-0jY§.§_-CN§,_loc2_);
      }
   }
}

