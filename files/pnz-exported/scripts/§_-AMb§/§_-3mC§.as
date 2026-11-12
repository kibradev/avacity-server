package §_-AMb§
{
   import §_-0Uz§.§_-6v4§;
   import §_-2Y7§.§_-49b§;
   import §_-2Y7§.§_-BNe§;
   import §_-2qd§.§_-9ai§;
   import §_-39l§.§_-5t6§;
   import §_-45g§.§_-B97§;
   import §_-5Lc§.§_-8Bn§;
   import §_-5Zh§.§_-19w§;
   import §_-5Zh§.§_-x4§;
   import §_-6GW§.§_-BSm§;
   import §_-76Z§.§_-2jg§;
   import §_-7w5§.§_-6J2§;
   import §_-8tw§.§_-5-F§;
   import §_-9MY§.§_-BL4§;
   import §_-AKx§.§_-0jI§;
   import §_-AKx§.§_-2-c§;
   import §_-AKx§.§_-4OH§;
   import §_-BeZ§.§_-4Ww§;
   import §_-GM§.Context;
   import §_-yg§.§_-3Co§;
   import penzville.Application;
   
   public class §_-3mC§ extends §_-6v4§
   {
      private var §_-9L2§:Object = {};
      
      public function §_-3mC§()
      {
         super();
         §_-1-t§(§_-3Co§.BUY_ROOM,this.§_-9yX§);
      }
      
      public function §_-0NM§(param1:XML) : void
      {
         var _loc2_:XML = null;
         var _loc3_:§_-8Bn§ = null;
         if(param1 == null)
         {
            return;
         }
         for each(_loc2_ in param1.elements("location"))
         {
            _loc3_ = new §_-8Bn§();
            _loc3_.fromXML(_loc2_);
            this.§_-9L2§[_loc3_.id] = _loc3_;
         }
      }
      
      public function §_-00V§(param1:String) : §_-8Bn§
      {
         return !!this.§_-9L2§.hasOwnProperty(param1) ? this.§_-9L2§[param1] : null;
      }
      
      public function buyRoom(param1:String) : void
      {
         if(!(Context.§_-3hG§ is §_-1i1§))
         {
            return;
         }
         var _loc2_:§_-x4§ = Context.cityPlayer.clanInfo;
         if(_loc2_ == null || !§_-2jg§.§_-67i§(§_-BL4§.BUY_ROOM,_loc2_.role))
         {
            return;
         }
         var _loc3_:§_-19w§ = §_-5t6§.instance.§_-5Dg§(_loc2_.clanId);
         if(_loc3_ == null)
         {
            return;
         }
         var _loc4_:int = this.§_-2Ou§;
         if(_loc4_ > _loc3_.clanCoin)
         {
            new §_-BNe§(_loc4_ - _loc3_.clanCoin).showModal();
            return;
         }
         var _loc5_:§_-4Ww§ = new §_-4Ww§();
         _loc5_.put(§_-6J2§.§_-77f§,param1);
         §_-6gl§.sendExtMessage(§_-3Co§.BUY_ROOM,_loc5_);
      }
      
      private function get §_-2Ou§() : int
      {
         var _loc1_:§_-5-F§ = (Context.§_-3hG§ as §_-1i1§).clanLocationModel;
         return §_-5t6§.instance.§_-8jq§(_loc1_.roomList.length);
      }
      
      private function §_-9yX§(param1:§_-9ai§) : void
      {
         var roomId:String = null;
         var event:§_-9ai§ = param1;
         roomId = event.data.getString(§_-BSm§.§_-3Z1§);
         §_-4OH§.confirm(Context.§_-5o8§.message("clanLocationAwardDescription"),Context.§_-5o8§.message("campaignBuyRoomFurnitureGotoRoomConfirm"),function(param1:§_-2-c§):void
         {
            if(param1.§_-B66§.modalResult == §_-0jI§.§_-9qy§)
            {
               Context.§_-3hG§.switchRoom(roomId);
               Application.instance.dispatchEvent(new §_-B97§(§_-B97§.§_-6Z2§));
            }
         });
      }
      
      public function showBuyNewRoomDialog() : void
      {
         new §_-49b§(this.§_-2Ou§).showModal();
      }
      
      public function §_-40O§(param1:int) : Boolean
      {
         return Context.cityPlayer.clanInfo != null && Context.cityPlayer.clanInfo.clanId == param1 && §_-2jg§.§_-67i§(§_-BL4§.BUY_ROOM,Context.cityPlayer.clanInfo.role);
      }
      
      public function §_-AbV§(param1:int) : Boolean
      {
         return Context.cityPlayer.clanInfo != null && Context.cityPlayer.clanInfo.clanId == param1 && §_-2jg§.§_-67i§(§_-BL4§.EDIT_ROOM_LAYOUT,Context.cityPlayer.clanInfo.role);
      }
      
      public function §_-9Au§(param1:int) : Boolean
      {
         return Context.cityPlayer.clanInfo != null && Context.cityPlayer.clanInfo.clanId == param1 && §_-2jg§.§_-67i§(§_-BL4§.CLOSE_CLAN_LOCATION,Context.cityPlayer.clanInfo.role);
      }
      
      public function §_-3i8§() : void
      {
         if(Context.§_-3hG§ is §_-1i1§)
         {
            (Context.§_-3hG§ as §_-1i1§).§_-3i8§();
         }
      }
   }
}

