package §_-7nb§
{
   import §_-0Uz§.§_-6v4§;
   import §_-2qd§.§_-9ai§;
   import §_-4J6§.§_-92v§;
   import §_-4Q1§.§_-5Ia§;
   import §_-6GW§.§_-7jB§;
   import §_-6GW§.§_-BSm§;
   import §_-95S§.§_-9E8§;
   import §_-99s§.§_-F§;
   import §_-9Zv§.§_-7oJ§;
   import §_-A2M§.§_-4Ba§;
   import §_-AKx§.§_-0jI§;
   import §_-AKx§.§_-2-c§;
   import §_-AKx§.§_-4OH§;
   import §_-Av5§.§_-Qd§;
   import §_-Azn§.§_-1LL§;
   import §_-BVV§.§_-9ck§;
   import §_-BeZ§.§_-1e5§;
   import §_-BeZ§.§_-4Ww§;
   import §_-CUD§.§_-6z5§;
   import §_-CUD§.§_-BDT§;
   import §_-GM§.Context;
   import §_-Uk§.§_-85Q§;
   
   public class §_-BVM§ extends §_-6v4§
   {
      public static const §_-7OI§:String = "canyon";
      
      public static const §_-7BC§:String = "podium";
      
      private var §_-BS3§:§_-4Ba§;
      
      public function §_-BVM§()
      {
         super();
         §_-1-t§(§_-7jB§.§_-2kM§,this.§_-6P-§);
         §_-1-t§(§_-7jB§.§_-8Ws§,this.§_-6zg§);
         §_-1-t§(§_-7jB§.§_-00z§,this.§_-0VM§);
      }
      
      public function §_-CIN§(param1:§_-9ck§) : void
      {
         var _loc2_:§_-4Ww§ = new §_-4Ww§();
         _loc2_.putString(§_-BSm§.§_-005§,param1.locationId);
         _loc2_.putString(§_-BSm§.§_-56A§,param1.groupId);
         _loc2_.putString(§_-BSm§.§_-3Z1§,param1.roomId);
         _loc2_.§_-CZf§(§_-7jB§.§_-BmU§,param1.role);
         _loc2_.§_-6YJ§(§_-7jB§.§_-9dd§,param1.isEvent);
         §_-6gl§.sendExtMessage(§_-7jB§.§_-8Ws§,_loc2_);
      }
      
      public function §_-AuX§(param1:String, param2:Boolean = false) : void
      {
         if(param1 == null)
         {
            return;
         }
         var _loc3_:Array = param1.split("_");
         if(_loc3_.length < 3)
         {
            return;
         }
         var _loc4_:§_-4Ww§ = new §_-4Ww§();
         _loc4_.putString(§_-BSm§.§_-005§,_loc3_[0]);
         _loc4_.putString(§_-BSm§.§_-56A§,_loc3_[1]);
         _loc4_.putString(§_-BSm§.§_-3Z1§,_loc3_[2]);
         _loc4_.§_-6YJ§(§_-7jB§.§_-9dd§,param2);
         §_-6gl§.sendExtMessage(§_-7jB§.§_-00z§,_loc4_);
      }
      
      public function §_-3XC§(param1:§_-Qd§) : §_-4Ba§
      {
         if(param1 == null)
         {
            return §_-4Ba§.reject();
         }
         this.§_-AuX§(param1.zone + "_" + param1.group + "_" + param1.room);
         return §_-4Ba§.resolve();
      }
      
      public function §_-Bpv§(param1:String, param2:int = 0, param3:Array = null, param4:String = null, param5:String = null) : §_-4Ba§
      {
         var task:§_-4Ba§ = null;
         var groupId:String = param1;
         var carId:int = param2;
         var invitePlayerIds:Array = param3;
         var layerId:String = param4;
         var roomId:String = param5;
         if(Context.§_-CLP§.§_-0Nh§(§_-5Ia§.§_-8vl§,groupId,roomId,layerId))
         {
            if(Context.§_-3hG§ != null)
            {
               return (Context.§_-3hG§.currentScreen as §_-1LL§).§_-2bA§(layerId);
            }
            Context.§_-CLP§.visitCityHouse();
            return §_-4Ba§.reject();
         }
         task = new §_-4Ba§();
         §_-4Ba§.sequence([carId > 0 ? §_-4Ba§.resolve(carId) : this.§_-7ox§,function(param1:int):void
         {
            Context.§_-9wO§.§_-14U§(§_-5Ia§.§_-8vl§,groupId,param1,invitePlayerIds,layerId,task,roomId);
         }]);
         return task;
      }
      
      private function §_-6P-§(param1:§_-9ai§) : void
      {
         var _loc2_:Boolean = param1.data.getBoolean(§_-7jB§.§_-Bs0§);
         if(!_loc2_)
         {
            §_-4OH§.§_-B5P§(Context.§_-5o8§.message("warning"),Context.§_-5o8§.message("accessLocationWarning"));
            return;
         }
         var _loc3_:String = param1.data.getString(§_-7jB§.§_-31c§);
         var _loc4_:Array = _loc3_.split("_");
         if(_loc4_.length < 3)
         {
            §_-4OH§.§_-B5P§(Context.§_-5o8§.message("warning"),Context.§_-5o8§.message("accessLocationWarning"));
            return;
         }
         var _loc5_:§_-4Ba§ = Context.§_-CLP§.§_-4gK§(_loc4_[0],_loc4_[1],_loc4_[2],_loc4_.length > 3 ? _loc4_[3] : null);
         if(this.§_-BS3§ != null)
         {
            _loc5_.next(this.§_-BS3§);
            this.§_-BS3§ = null;
         }
      }
      
      private function §_-6zg§(param1:§_-9ai§) : void
      {
         var _loc2_:Boolean = param1.data.getBoolean(§_-7jB§.§_-Bs0§);
         if(!_loc2_)
         {
            §_-4OH§.§_-B5P§(Context.§_-5o8§.message("warning"),Context.§_-5o8§.message("accessLocationWarning"));
            return;
         }
         var _loc3_:String = param1.data.getString(§_-7jB§.§_-31c§);
         var _loc4_:Array = _loc3_.split("_");
         if(_loc4_.length < 3)
         {
            §_-4OH§.§_-B5P§(Context.§_-5o8§.message("warning"),Context.§_-5o8§.message("accessLocationWarning"));
            return;
         }
         Context.§_-CLP§.§_-4gK§(_loc4_[0],_loc4_[1],_loc4_[2],_loc4_.length > 3 ? _loc4_[3] : null);
      }
      
      private function §_-0VM§(param1:§_-9ai§) : void
      {
         var fullRoomId:String;
         var isEvent:Boolean;
         var roomIdArray:Array;
         var roles:Array;
         var event:§_-9ai§ = param1;
         var success:Boolean = event.data.getBoolean(§_-7jB§.§_-Bs0§);
         if(!success)
         {
            §_-4OH§.confirm(Context.§_-5o8§.message("podiumTitle"),Context.§_-5o8§.message("podiumNotSuccessFollowFriendMessage"),function(param1:§_-2-c§):void
            {
               if(param1.§_-B66§.modalResult == §_-0jI§.§_-9qy§)
               {
                  new §_-7oJ§().showModal();
               }
            });
            return;
         }
         fullRoomId = event.data.getString(§_-7jB§.§_-31c§);
         isEvent = event.data.getBoolean(§_-7jB§.§_-9dd§);
         roomIdArray = fullRoomId.split("_");
         if(roomIdArray.length < 3)
         {
            §_-4OH§.§_-B5P§(Context.§_-5o8§.message("warning"),Context.§_-5o8§.message("accessLocationWarning"));
            return;
         }
         roles = event.data.§_-Bc6§(§_-92v§.§_-CQm§,int);
         new §_-7oJ§(fullRoomId,roles,isEvent).showModal();
      }
      
      public function §_-14U§(param1:String, param2:String, param3:int, param4:Array = null, param5:String = null, param6:§_-4Ba§ = null, param7:String = null) : void
      {
         var _loc8_:§_-4Ww§ = new §_-4Ww§();
         _loc8_.putString(§_-BSm§.§_-005§,param1);
         _loc8_.putString(§_-BSm§.§_-56A§,param2);
         _loc8_.putString("layid",param5);
         _loc8_.putString(§_-BSm§.§_-3Z1§,param7);
         _loc8_.§_-CZf§("cid",param3);
         if(param4 != null)
         {
            _loc8_.§_-C21§("iids",new §_-1e5§(param4));
         }
         this.§_-BS3§ = param6;
         §_-6gl§.sendExtMessage(§_-7jB§.§_-2kM§,_loc8_);
      }
      
      public function §_-7ox§() : §_-4Ba§
      {
         var task:§_-4Ba§ = null;
         if(!§_-BDT§.§_-9Hc§())
         {
            new §_-6z5§().showModal(function(param1:§_-2-c§):void
            {
               if(param1.§_-B66§.modalResult == §_-0jI§.§_-9qy§)
               {
                  §_-9E8§.§_-08G§(§_-F§.§_-2FW§);
               }
            });
            return §_-4Ba§.reject();
         }
         if(!§_-BDT§.§_-99§() && !(Context.§_-3hG§.currentScreen is §_-85Q§))
         {
            new §_-6z5§(true).showModal(function(param1:§_-2-c§):void
            {
               if(param1.§_-B66§.modalResult == §_-0jI§.§_-9qy§)
               {
                  Context.§_-CLP§.visitCityHouse();
               }
            });
            return §_-4Ba§.reject();
         }
         if(§_-BDT§.§_-2Pe§().length == 1)
         {
            return §_-4Ba§.resolve(§_-BDT§.§_-2Pe§()[0]);
         }
         task = new §_-4Ba§();
         new §_-BDT§().showModal(function(param1:§_-2-c§):void
         {
            var _loc2_:int = 0;
            if(param1.§_-B66§.modalResult == §_-0jI§.§_-9qy§)
            {
               _loc2_ = (param1.§_-B66§ as §_-BDT§).§_-7KD§;
               if(_loc2_ > 0)
               {
                  task.resolve(_loc2_);
               }
            }
         });
         return task;
      }
   }
}

