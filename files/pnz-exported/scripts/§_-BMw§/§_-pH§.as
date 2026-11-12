package §_-BMw§
{
   import §_-02i§.§_-AN6§;
   import §_-03E§.§_-4WA§;
   import §_-0N8§.§_-0V9§;
   import §_-0N8§.§_-24R§;
   import §_-0Uz§.§_-3mj§;
   import §_-0Uz§.§_-6v4§;
   import §_-0uA§.§_-3YE§;
   import §_-2qd§.§_-9ai§;
   import §_-3na§.§_-6Aw§;
   import §_-3na§.§_-CCU§;
   import §_-62k§.§_-7Mj§;
   import §_-6GW§.§_-BSm§;
   import §_-7Mq§.§_-3rG§;
   import §_-8UF§.§_-7wp§;
   import §_-9zI§.§_-8-d§;
   import §_-9zI§.§_-Bu9§;
   import §_-AKx§.§_-2-c§;
   import §_-AKx§.§_-4OH§;
   import §_-AaI§.§_-2CK§;
   import §_-Agf§.§_-0EF§;
   import §_-ApY§.§_-8rN§;
   import §_-Av5§.§_-Qd§;
   import §_-B9N§.§_-12e§;
   import §_-BeZ§.§_-4Ww§;
   import §_-GM§.Context;
   import §_-bm§.§_-4aT§;
   import penzville.Application;
   
   public class §_-pH§ extends §_-6v4§
   {
      private var §_-CAm§:Object = {};
      
      public function §_-pH§()
      {
         super();
         §_-1-t§(§_-BRJ§.§_-3n2§,this.§_-6Cq§);
         §_-1-t§(§_-BRJ§.§_-63Z§,this.§_-80j§);
         §_-1-t§(§_-BRJ§.§_-24-§,this.§_-1x2§);
         §_-1-t§(§_-BRJ§.§_-9MV§,this.§_-2OT§);
         §_-1-t§(§_-BRJ§.§_-0kE§,this.§_-B-D§);
         §_-1-t§(§_-BRJ§.§_-3-k§,this.§_-1gG§);
         if(this.§_-2z5§ != null)
         {
            this.§_-2z5§.addEventListener(§_-24R§.§_-8Ub§,this.§_-2qX§);
         }
         if(this.§_-3NB§ != null)
         {
            this.§_-3NB§.addEventListener(§_-6Aw§.§_-3XW§,this.§_-3d0§);
            this.§_-3NB§.addEventListener(§_-6Aw§.§_-9wo§,this.§_-40a§);
            this.§_-3NB§.addEventListener(§_-6Aw§.§_-9Z3§,this.§_-3ez§);
            this.§_-3NB§.addEventListener(§_-6Aw§.§_-5eh§,this.§_-14m§);
            this.§_-3NB§.addEventListener(§_-6Aw§.§_-0h6§,this.§_-36R§);
            this.§_-3NB§.addEventListener(§_-6Aw§.§_-915§,this.§_-Atj§);
            this.§_-3NB§.addEventListener(§_-6Aw§.§_-1jk§,this.§_-23U§);
         }
      }
      
      public function §_-4R§(param1:int, param2:int, param3:int, param4:String = null, param5:String = "") : void
      {
         if(this.§_-3NB§ != null)
         {
            this.§_-3NB§.§_-AOO§(String(param2),param3,param1,param4,param5);
         }
      }
      
      public function moderatorMessage(param1:int, param2:int, param3:String) : void
      {
         if(this.§_-2z5§ != null)
         {
            this.§_-2z5§.§_-6ew§(param3,param2,String(param1));
         }
      }
      
      public function §_-1gi§(param1:int, param2:int, param3:String = "") : void
      {
         if(this.§_-3NB§ != null)
         {
            this.§_-3NB§.§_-00t§(String(param1),param2,param3);
         }
      }
      
      public function §_-C3I§(param1:int) : void
      {
         if(this.§_-3NB§ != null)
         {
            this.§_-3NB§.§_-7C0§(String(param1));
         }
      }
      
      public function §_-4pi§(param1:String) : void
      {
         if(this.§_-3NB§ != null)
         {
            this.§_-3NB§.§_-9sI§(param1);
         }
      }
      
      public function §_-AqR§(param1:String) : void
      {
         if(this.§_-3NB§ != null)
         {
            this.§_-3NB§.§_-CYG§(param1);
         }
      }
      
      public function §_-CA6§(param1:int, param2:Function) : void
      {
         this.§_-CAm§["actions" + param1] = param2;
         var _loc3_:§_-4Ww§ = new §_-4Ww§();
         _loc3_.put(§_-74f§.§_-23-§,param1);
         §_-6gl§.sendExtMessage(§_-BRJ§.§_-63Z§,_loc3_);
      }
      
      public function §_-A-w§(param1:int, param2:String) : void
      {
         var _loc3_:§_-4Ww§ = new §_-4Ww§();
         _loc3_.put(§_-74f§.§_-23-§,param1);
         _loc3_.put(§_-7Mj§.§_-8Aa§,param2);
         §_-6gl§.sendExtMessage(§_-BRJ§.§_-AT3§,_loc3_);
      }
      
      public function §_-0Ga§() : void
      {
         var _loc1_:§_-4Ww§ = new §_-4Ww§();
         §_-6gl§.sendExtMessage(§_-BRJ§.§_-8cA§,_loc1_);
      }
      
      public function §_-5i5§(param1:String, param2:int, param3:String) : void
      {
         var _loc4_:§_-4Ww§ = new §_-4Ww§();
         _loc4_.putString(§_-74f§.§_-23-§,param1);
         _loc4_.§_-CZf§(§_-74f§.§_-A67§,param2);
         _loc4_.putString(§_-74f§.§_-8GY§,param3);
         §_-6gl§.sendExtMessage(§_-BRJ§.§_-Df§,_loc4_);
      }
      
      public function §_-Amc§(param1:String, param2:String, param3:int) : void
      {
         var _loc4_:§_-4Ww§ = new §_-4Ww§();
         _loc4_.putString(§_-74f§.§_-23-§,param1);
         _loc4_.putString(§_-3mj§.§_-2-r§,param2);
         _loc4_.§_-CZf§(§_-74f§.§_-A67§,param3);
         §_-6gl§.sendExtMessage(§_-BRJ§.§_-69W§,_loc4_);
      }
      
      public function §_-CVA§(param1:String, param2:int, param3:int) : void
      {
         var _loc4_:§_-4Ww§ = new §_-4Ww§();
         _loc4_.putString(§_-0EF§.§_-3rl§,param1);
         _loc4_.§_-CZf§(§_-0EF§.§_-7m4§,param2);
         _loc4_.§_-CZf§(§_-74f§.§_-A67§,param3);
         §_-6gl§.sendExtMessage(§_-BRJ§.§_-3tY§,_loc4_);
      }
      
      public function §_-2zP§(param1:int, param2:int) : void
      {
         var _loc3_:§_-4Ww§ = new §_-4Ww§();
         _loc3_.§_-CZf§(§_-74f§.§_-22h§,param1);
         _loc3_.§_-CZf§(§_-74f§.§_-A67§,param2);
         §_-6gl§.sendExtMessage(§_-BRJ§.§_-4qH§,_loc3_);
      }
      
      public function §_-7me§(param1:String, param2:int) : void
      {
         var _loc3_:§_-4Ww§ = new §_-4Ww§();
         _loc3_.putString(§_-3rG§.§_-6Ud§,param1);
         _loc3_.§_-CZf§(§_-74f§.§_-A67§,param2);
         §_-6gl§.sendExtMessage(§_-BRJ§.§_-BmR§,_loc3_);
      }
      
      public function §_-A2f§() : void
      {
         §_-6gl§.sendExtMessage(§_-BRJ§.§_-24-§);
      }
      
      public function §_-0JP§(param1:§_-Bu9§) : void
      {
         if(this.§_-3NB§ != null)
         {
            this.§_-3NB§.§_-0JP§(param1);
         }
      }
      
      private function §_-6Cq§(param1:§_-9ai§) : void
      {
         Context.§_-BlB§.§_-5eA§(Context.§_-5o8§.message("abuseTitle"),Context.§_-5o8§.message("abuseSendComplete"));
      }
      
      private function §_-40a§(param1:§_-6Aw§) : void
      {
         var _loc2_:§_-2CK§ = null;
         if(param1.success)
         {
            Context.§_-BlB§.§_-5eA§(Context.§_-5o8§.message("moderatorBanTitle"),Context.§_-5o8§.message("moderatorBanComplete"));
            _loc2_ = new §_-2CK§(§_-2CK§.§_-7Qi§);
            _loc2_.§_-5aN§(§_-2CK§.§_-1tE§,param1.bannedUser.userId);
            dispatchEvent(_loc2_);
         }
         else
         {
            §_-3YE§.info("ban error");
         }
      }
      
      private function §_-Atj§(param1:§_-6Aw§) : void
      {
         var _loc2_:§_-2CK§ = null;
         if(param1.success)
         {
            Context.§_-BlB§.§_-5eA§(Context.§_-5o8§.message("moderatorBanTitle"),Context.§_-5o8§.message("moderatorBanRequestComplete"));
            _loc2_ = new §_-2CK§(§_-2CK§.§_-0fj§);
            _loc2_.§_-5aN§(§_-2CK§.§_-1tE§,param1.banRequest.userId);
            dispatchEvent(_loc2_);
         }
         else
         {
            §_-3YE§.info("ban request add error");
         }
      }
      
      private function §_-2qX§(param1:§_-24R§) : void
      {
         Context.§_-BlB§.§_-5eA§(Context.§_-5o8§.message("moderatorMessage"),Context.§_-5o8§.message("moderatorMessageComplete"));
      }
      
      private function §_-3ez§(param1:§_-6Aw§) : void
      {
         var _loc2_:§_-7wp§ = null;
         if(param1.success)
         {
            Context.§_-BlB§.§_-5eA§("Chat ban","Chat banned succesfully");
            _loc2_ = new §_-7wp§(§_-7wp§.§_-9Z3§);
            _loc2_.§_-5aN§(§_-7wp§.§_-1tE§,param1.bannedChatUser.userId);
            Application.instance.dispatchEvent(_loc2_);
         }
         else
         {
            §_-3YE§.info("ban error");
         }
      }
      
      private function §_-14m§(param1:§_-6Aw§) : void
      {
         Context.§_-BlB§.§_-5eA§("Chat unban","Chat unbanned succesfully");
         var _loc2_:§_-7wp§ = new §_-7wp§(§_-7wp§.§_-5eh§);
         _loc2_.§_-5aN§(§_-7wp§.§_-1tE§,param1.userId);
         Application.instance.dispatchEvent(_loc2_);
      }
      
      private function §_-3d0§(param1:§_-6Aw§) : void
      {
         var _loc2_:§_-12e§ = param1.bannedChatUser;
         var _loc3_:Boolean = _loc2_ != null && _loc2_.§_-0RM§(Context.player.timeDelta);
         var _loc4_:§_-7wp§ = new §_-7wp§(§_-7wp§.§_-0D7§);
         _loc4_.§_-5aN§(§_-7wp§.§_-4Fr§,_loc3_);
         Application.instance.dispatchEvent(_loc4_);
      }
      
      private function §_-36R§(param1:§_-6Aw§) : void
      {
         var _loc2_:* = param1.bannedUser != null;
         var _loc3_:§_-2CK§ = new §_-2CK§(§_-2CK§.§_-6HT§);
         _loc3_.§_-5aN§(§_-2CK§.§_-4Fr§,_loc2_);
         dispatchEvent(_loc3_);
      }
      
      private function §_-80j§(param1:§_-9ai§) : void
      {
         var _loc4_:Function = null;
         var _loc2_:String = param1.data.getString(§_-3mj§.§_-9GV§);
         var _loc3_:Array = param1.data.§_-Bc6§(§_-74f§.§_-4GT§,§_-8-d§);
         if(this.§_-CAm§.hasOwnProperty("actions" + _loc2_))
         {
            _loc4_ = this.§_-CAm§["actions" + _loc2_];
            delete this.§_-CAm§["actions" + _loc2_];
            _loc4_(_loc3_);
         }
      }
      
      private function §_-2OT§(param1:§_-9ai§) : void
      {
         var _loc2_:Boolean = param1.data.getBoolean(§_-3mj§.§_-2yH§);
         var _loc3_:String = _loc2_ ? "complaintSendSuccess" : "complaintSendFail";
         Context.§_-BlB§.§_-5eA§(Context.§_-5o8§.message("complaintSendTitle"),Context.§_-5o8§.message(_loc3_));
      }
      
      private function §_-B-D§(param1:§_-9ai§) : void
      {
         var roomId:String = null;
         var event:§_-9ai§ = param1;
         roomId = event.data.getString(§_-BSm§.§_-3Z1§);
         §_-4OH§.confirm(Context.§_-5o8§.message("warning"),Context.§_-5o8§.message("callModeratorsMessage"),function(param1:§_-2-c§):void
         {
            var _loc2_:§_-Qd§ = new §_-Qd§();
            _loc2_.updateLocation(roomId);
            Context.§_-CLP§.visitByLocationInfo(_loc2_,false);
         });
      }
      
      private function §_-1gG§(param1:§_-9ai§) : void
      {
         var _loc2_:§_-4WA§ = param1.data.§_-2jV§(§_-BSm§.EVENT,§_-4WA§);
         dispatchEvent(new §_-4aT§(§_-4aT§.§_-ZE§,_loc2_));
      }
      
      private function §_-1x2§(param1:§_-9ai§) : void
      {
         var _loc2_:Array = param1.data.has(§_-74f§.§_-0Zf§) ? param1.data.§_-Bc6§(§_-74f§.§_-0Zf§,§_-8rN§) : null;
         new §_-AN6§(_loc2_).showModal();
      }
      
      private function get §_-2z5§() : §_-0V9§
      {
         return Context.§_-2ap§.getComponent(§_-0V9§);
      }
      
      private function get §_-3NB§() : §_-CCU§
      {
         return Context.§_-2ap§.getComponent(§_-CCU§);
      }
      
      private function §_-23U§(param1:§_-6Aw§) : void
      {
         var _loc2_:Boolean = param1.success;
         var _loc3_:String = param1.privilege;
         var _loc4_:§_-2CK§ = new §_-2CK§(§_-2CK§.§_-1jk§);
         _loc4_.§_-5aN§(§_-2CK§.§_-Bs0§,_loc2_);
         _loc4_.§_-5aN§(§_-2CK§.§_-C84§,_loc3_);
         dispatchEvent(_loc4_);
      }
   }
}

