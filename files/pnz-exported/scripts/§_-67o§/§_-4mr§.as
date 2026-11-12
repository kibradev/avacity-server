package §_-67o§
{
   import §_-03E§.§_-4WA§;
   import §_-0fi§.§_-6f3§;
   import §_-1VK§.§_-4rd§;
   import §_-1Vu§.§_-Awf§;
   import §_-2S7§.§_-75P§;
   import §_-6p3§.§_-CYP§;
   import §_-8Hp§.§_-5KD§;
   import §_-95S§.§_-9E8§;
   import §_-99s§.§_-7Tj§;
   import §_-9VF§.§_-5ab§;
   import §_-AKx§.§_-0jI§;
   import §_-AKx§.§_-2-c§;
   import §_-AKx§.§_-2BF§;
   import §_-AKx§.§_-4OH§;
   import §_-AKx§.§_-5hc§;
   import §_-BXK§.§_-6en§;
   import §_-ByP§.§_-0CV§;
   import §_-F9§.§_-6B2§;
   import §_-GM§.Context;
   
   public class §_-4mr§
   {
      private static const §_-9GA§:String = "houseStartNavigationCallId";
      
      private static const §_-1NW§:String = "_";
      
      private static const §_-2FP§:String = "[";
      
      private static const §_-9O7§:String = "]";
      
      private static const §_-2UC§:String = "\"";
      
      private var §_-4ab§:Boolean;
      
      private var §_-AMN§:String;
      
      private var _navItem:String;
      
      public function §_-4mr§()
      {
         super();
      }
      
      public function set §_-9Fw§(param1:String) : void
      {
         if(param1 == null)
         {
            return;
         }
         var _loc2_:Array = param1.split(§_-1NW§);
         if(_loc2_.length >= 1)
         {
            this.§_-AMN§ = _loc2_[0];
         }
         if(_loc2_.length >= 2)
         {
            this._navItem = _loc2_[1];
         }
      }
      
      public function §_-BiC§() : void
      {
         if(this.§_-4ab§ || this.§_-AMN§ == null || this.§_-AMN§ == "")
         {
            return;
         }
         if(this.§_-7sY§(§_-7AE§.§_-5OW§))
         {
            this.§_-4Uv§();
         }
         else if(this.§_-7sY§(§_-7AE§.EVENT))
         {
            this.§_-6Vu§();
         }
         else if(this.§_-7sY§(§_-7AE§.§_-78y§))
         {
            this.§_-3hD§();
         }
         else if(this.§_-7sY§(§_-7AE§.§_-CAM§))
         {
            this.§_-6kV§();
         }
         else if(this.§_-7sY§(§_-7AE§.§_-1nS§))
         {
            this.§_-CCT§();
         }
         this.§_-4ab§ = true;
      }
      
      private function §_-4Uv§() : void
      {
         var userId:String = this.§_-CUe§(this.§_-AMN§);
         if(userId == null || userId == "")
         {
            return;
         }
         Context.§_-3B2§.§_-BYO§([userId],§_-9GA§,function(param1:Array):void
         {
            var _loc2_:§_-5ab§ = param1[0];
            if(_loc2_ == null)
            {
               return;
            }
            showLocationRedirectDialog(_loc2_,_navItem);
         });
      }
      
      private function §_-6Vu§() : void
      {
         var eventId:String = this.§_-CUe§(this.§_-AMN§);
         if(eventId == null || eventId == "")
         {
            return;
         }
         Context.§_-5aD§.§_-1NP§(int(eventId),function(param1:§_-4WA§):void
         {
            if(param1 == null)
            {
               return;
            }
            if(!param1.active)
            {
               return;
            }
            if(!Context.§_-5aD§.§_-66Q§(param1))
            {
               return;
            }
            showEventRedirectDialog(param1);
         });
      }
      
      private function §_-3hD§() : void
      {
         var _loc1_:String = this.§_-CUe§(this.§_-AMN§);
         if(_loc1_ == null || _loc1_ == "")
         {
            return;
         }
         var _loc2_:§_-7Tj§ = Context.§_-70S§.findShopItem(_loc1_);
         if(_loc2_ == null)
         {
            return;
         }
         if(_loc2_ is §_-6f3§)
         {
            new §_-6B2§(_loc2_ as §_-6f3§).showModal();
         }
         else if(_loc2_ is §_-Awf§)
         {
            if(Context.cityPlayer.hasClothes(_loc1_) || (_loc2_ as §_-Awf§).gender != Context.cityPlayer.avatarAppearance.gender)
            {
               return;
            }
            new §_-4rd§(Context.player,_loc2_ as §_-Awf§,null).showModal();
         }
         else if(_loc2_ is §_-CYP§)
         {
            new §_-6en§(_loc2_).showModal();
         }
      }
      
      private function §_-6kV§() : void
      {
         var _loc1_:String = this.§_-CUe§(this.§_-AMN§);
         if(_loc1_ == null || _loc1_ == "")
         {
            return;
         }
         var _loc2_:String = null;
         if(this._navItem != null)
         {
            _loc2_ = this.§_-CUe§(this._navItem);
         }
         §_-9E8§.§_-08G§(_loc1_,_loc2_);
      }
      
      private function §_-CCT§() : void
      {
         var _loc3_:§_-75P§ = null;
         var _loc1_:String = this.§_-CUe§(this.§_-AMN§);
         if(_loc1_ == null || _loc1_ == "")
         {
            return;
         }
         var _loc2_:§_-0CV§ = §_-5KD§.instance.§_-0S-§(int(_loc1_));
         if(_loc2_ == null)
         {
            return;
         }
         if(§_-5KD§.instance.§_-BEg§(_loc2_))
         {
            _loc3_ = §_-5KD§.instance.§_-3TO§(_loc2_);
            if(_loc3_ == null)
            {
               return;
            }
            _loc3_.showModal();
         }
      }
      
      private function showLocationRedirectDialog(param1:§_-5ab§, param2:String) : void
      {
         var player:§_-5ab§ = param1;
         var roomId:String = param2;
         var confirmDialog:§_-2BF§ = new §_-2BF§(§_-4OH§.§continue§,Context.§_-5o8§.message("locationRedirectDialogTitle"),Context.§_-5o8§.message("locationRedirectDialogConfirm",{"avatarName":player.avatarAppearance.name}));
         confirmDialog.addEventListener(§_-2-c§.§_-41T§,function(param1:§_-2-c§):void
         {
            if(param1 != null && param1.§_-B66§ != null && param1.§_-B66§.modalResult == §_-0jI§.§_-9qy§)
            {
               Context.§_-CLP§.visitCityHouse(player.id,roomId);
            }
         });
         §_-5hc§.§_-57w§(confirmDialog);
      }
      
      private function showEventRedirectDialog(param1:§_-4WA§) : void
      {
         var cityEventInfo:§_-4WA§ = param1;
         var confirmDialog:§_-2BF§ = new §_-2BF§(§_-4OH§.§continue§,Context.§_-5o8§.message("eventRedirectDialogTitle"),Context.§_-5o8§.message("eventRedirectDialogConfirm",{"eventName":cityEventInfo.title}));
         confirmDialog.addEventListener(§_-2-c§.§_-41T§,function(param1:§_-2-c§):void
         {
            if(param1 != null && param1.§_-B66§ != null && param1.§_-B66§.modalResult == §_-0jI§.§_-9qy§)
            {
               Context.§_-5aD§.§_-4jf§(cityEventInfo);
            }
         });
         §_-5hc§.§_-57w§(confirmDialog);
      }
      
      private function §_-CUe§(param1:String) : String
      {
         var _loc2_:String = param1.indexOf(§_-2FP§) < 0 ? encodeURI(§_-2UC§) : §_-2FP§;
         var _loc3_:String = param1.indexOf(§_-9O7§) < 0 ? encodeURI(§_-2UC§) : §_-9O7§;
         var _loc4_:int = int(param1.indexOf(_loc2_));
         if(_loc4_ < 0)
         {
            return null;
         }
         var _loc5_:int = int(param1.indexOf(_loc3_,_loc4_ + _loc2_.length));
         if(_loc5_ < 0)
         {
            return null;
         }
         return param1.substr(_loc4_ + _loc2_.length,_loc5_ - (_loc4_ + _loc2_.length));
      }
      
      private function §_-7sY§(param1:String) : Boolean
      {
         return this.§_-AMN§.indexOf(param1) >= 0;
      }
   }
}

