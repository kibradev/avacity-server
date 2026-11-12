package §_-Bmg§
{
   import §_-0yZ§.§_-aD§;
   import §_-3Mv§.§_-4T5§;
   import §_-5wm§.§_-5YM§;
   import §_-7yD§.§_-A4l§;
   import §_-91S§.§_-4DP§;
   import §_-AKx§.§_-0jI§;
   import §_-AKx§.§_-2-c§;
   import §_-Bwh§.§_-AMW§;
   import §_-Bwh§.§_-BYa§;
   import §_-GM§.Context;
   
   public class §_-8kL§
   {
      public static const §_-3u6§:String = "jacuzzi";
      
      public static const §_-6mO§:String = "fireplace";
      
      public static const §_-8ad§:String = "wardrobe";
      
      public static const §_-8TA§:String = "musicCenterAppliance";
      
      public static const §_-GG§:String = "tvAppliance";
      
      public static const §_-54w§:String = "refrigerator";
      
      public static const §_-3Ns§:String = "furnitureSit";
      
      public static const §_-yn§:String = "newYearFir";
      
      public static const §_-5wz§:String = "aquarium";
      
      public static const §_-CAf§:String = "horseAmusiment";
      
      public static const §_-7u1§:String = "computerAppliance";
      
      public static const §_-2SZ§:String = "wall";
      
      public static const §_-AX9§:String = "carAmusiment";
      
      public static const §_-2Hi§:String = "generator";
      
      public static const §_-0LS§:String = "prediction";
      
      public static const §_-7Mt§:String = "janitorRailway";
      
      public static const §_-5Qu§:String = "weldingMachine";
      
      public static const §_-2il§:String = "pumpkinPot";
      
      public static const §_-03x§:String = "tangerineTree";
      
      private var §_-CDB§:Object = {};
      
      public function §_-8kL§()
      {
         super();
      }
      
      public function configure(param1:XML) : void
      {
         var _loc2_:XML = null;
         var _loc3_:XML = null;
         var _loc4_:§_-7Iq§ = null;
         if(param1 == null)
         {
            return;
         }
         for each(_loc2_ in param1.elements("group"))
         {
            for each(_loc3_ in _loc2_.elements("action"))
            {
               _loc4_ = new §_-7Iq§();
               _loc4_.configure(_loc2_["@key"],_loc3_);
               this.§_-2zX§(_loc4_);
            }
         }
      }
      
      private function §_-2zX§(param1:§_-7Iq§) : void
      {
         this.§_-CDB§[param1.key] = param1;
      }
      
      public function §_-3sJ§(param1:String, param2:String) : §_-7Iq§
      {
         var _loc3_:String = §_-7Iq§.§_-AWY§(param1,param2);
         return !!this.§_-CDB§.hasOwnProperty(_loc3_) ? this.§_-CDB§[_loc3_] : null;
      }
      
      public function checkPossibility(param1:String, param2:String, param3:String, param4:Object, param5:Function) : void
      {
         var paymentService:§_-AMW§;
         var paymentReason:§_-aD§;
         var neededItems:Array;
         var neededItem:RoomActionNeededItem = null;
         var found:Boolean = false;
         var collection:§_-5YM§ = null;
         var rule:§_-4DP§ = null;
         var key:String = param1;
         var action:String = param2;
         var userId:String = param3;
         var tag:Object = param4;
         var callback:Function = param5;
         var descriptor:§_-7Iq§ = this.§_-3sJ§(key,action);
         if(descriptor == null)
         {
            callback();
            return;
         }
         paymentService = new §_-AMW§();
         paymentReason = new §_-aD§(§_-aD§.§_-10P§,descriptor.key);
         if(!paymentService.checkPrice(descriptor.price,paymentReason))
         {
            return;
         }
         neededItems = this.§_-B-3§(descriptor,tag);
         var _loc7_:int = 0;
         var _loc8_:* = neededItems;
         do
         {
            for each(neededItem in _loc8_)
            {
               found = false;
               for each(collection in Context.cityPlayer.inventory.§_-AKy§)
               {
                  if(§_-4T5§.getItemCount(collection,neededItem.typeId) >= neededItem.count)
                  {
                     found = true;
                     break;
                  }
               }
            }
            if(descriptor.privilege != null)
            {
               rule = Context.§_-AI9§.§_-14E§(key,descriptor.privilege);
               if(rule != null)
               {
                  rule.apply(userId,tag != null && Boolean(tag.hasOwnProperty("userName")) ? tag["userName"] : "",callback);
                  return;
               }
            }
            callback();
            return;
         }
         while(found);
         
         new §_-A4l§(neededItem,§_-BYa§.§_-9tU§("furniture:" + key)).showModal(function(param1:§_-2-c§):void
         {
            if(param1.§_-B66§.modalResult == §_-0jI§.OK)
            {
               checkPossibility(key,action,userId,tag,callback);
            }
         });
      }
      
      private function §_-B-3§(param1:§_-7Iq§, param2:Object) : Array
      {
         var _loc4_:String = null;
         var _loc5_:int = 0;
         var _loc3_:Array = [];
         if(param1.name == §_-9Bb§.§_-CZi§ && param2 != null)
         {
            _loc4_ = !!param2.hasOwnProperty("typeId") ? param2["typeId"] : null;
            if(_loc4_ == null)
            {
               _loc3_ = param1.neededItems;
            }
            else
            {
               _loc5_ = 0;
               while(_loc5_ < param1.neededItems.length)
               {
                  if((param1.neededItems[_loc5_] as RoomActionNeededItem).typeId == _loc4_)
                  {
                     _loc3_.push(param1.neededItems[_loc5_]);
                  }
                  _loc5_++;
               }
            }
         }
         else
         {
            _loc3_ = param1.neededItems;
         }
         return _loc3_;
      }
   }
}

