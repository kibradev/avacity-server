package §_-4Q1§
{
   import §_-3hC§.§_-3-x§;
   import §_-6-L§.§_-49j§;
   import §_-673§.§_-72Y§;
   import §_-6GW§.§_-BSm§;
   import §_-7nb§.§_-6kZ§;
   import §_-BVH§.§_-0GJ§;
   import §_-BeZ§.§_-4Ww§;
   import §_-GM§.Context;
   import §_-MZ§.§_-12j§;
   import §_-MZ§.§_-7zb§;
   import §_-bm§.§_-3Fc§;
   import penzville.Application;
   import penzville.Config;
   import penzville.§_-7tX§;

   public class §_-4v6§ extends §_-6kZ§
   {

      private var §_-4OB§:§_-7zb§ = null;

      private var §_-7yn§:String = null;

      private var §_-BKC§:String = null;

      private var §_-5y6§:String = null;

      private var §_-35l§:String = null;

      private var §_-0uK§:String = null;

      private var §_-1Cg§:§_-5r8§ = null;

      public function §_-4v6§(param1:String, param2:String, param3:String, param4:String)
      {
         super();
         this.§_-4OB§ = Context.§_-BFW§.§_-4Bq§(param1);
         this.§_-7yn§ = param2;
         this.§_-BKC§ = param3;
         this.§_-0uK§ = param4;
         §_-9yg§ = Config.§_-7vO§;
         §_-49j§.merge(§_-9yg§,this.§_-4OB§.loadingContent);
      }

      override protected function createNetClient(param1:Function) : void
      {
         Context.§_-CLP§.§_-0u1§(param1,Config.outsideServer,Config.outsidePort,this.zoneId);
      }

      override protected function initLocation() : void
      {
         this.switchRoom(this.§_-7yn§);
      }

      override public function switchRoom(param1:String) : void
      {
         if(!this.§_-4Zo§(param1))
         {
            return;
         }
         this.leaveRoom();
         this.§_-5y6§ = param1;
         if(this.§_-5y6§ != null)
         {
            this.getRoom(this.§_-5y6§);
         }
      }

      private function leaveRoom() : void
      {
         if(this.§_-35l§ == null)
         {
            return;
         }
         // The outside server leaves the previous room atomically in o.gr.
         // Avoid directly touching the ancestor's obfuscated protected net
         // client here; FFDec cannot safely recompile that namespace access.
         this.§_-35l§ = null;
      }

      private function getRoom(param1:String) : void
      {
         var _loc2_:String = null;
         if(this.§_-BKC§ != null)
         {
            _loc2_ = this.§_-BKC§;
            this.§_-BKC§ = null;
         }
         §_-5-J§(§_-0GJ§.§_-5WP§,_loc2_,param1,this.§_-4OB§.id);
      }

      override protected function processRoomConnectResult(param1:§_-4Ww§) : void
      {
         super.processRoomConnectResult(param1);
         this.§_-35l§ = param1.getString(§_-BSm§.§_-3Z1§);
         var _loc2_:§_-12j§ = this.§_-4OB§.getRoom(this.§_-5y6§);
         var _loc3_:§_-3Fc§ = new §_-3Fc§(§_-3Fc§.§_-559§,this.§_-4OB§.id,this.§_-5y6§,_loc2_,this.§_-4GN§);
         Application.instance.dispatchEvent(_loc3_);
         if(!_loc3_.isDefaultPrevented())
         {
            this.§_-4GN§();
         }
      }

      private function §_-4GN§() : void
      {
         currentScreen = this.getCurrentScreen();
      }

      private function §_-4Zo§(param1:String) : Boolean
      {
         if(param1 == null)
         {
            this.leaveRoom();
            return false;
         }
         var _loc2_:§_-12j§ = this.§_-4OB§.getRoom(param1);
         if(_loc2_ == null)
         {
            return false;
         }
         if(!Context.§_-BFW§.§_-uY§(this.locationId) && _loc2_.minLevel > 0 && !Context.§_-BFW§.§_-9XJ§(_loc2_.minLevel))
         {
            Context.§_-BFW§.§_-0Y2§(_loc2_.minLevel);
            return false;
         }
         if(_loc2_.isVip && !Context.§_-BFW§.§_-Bo8§())
         {
            §_-7tX§.§_-53l§(Context.§_-5o8§.message("vipRoomTitle"),Context.§_-5o8§.message("vipRoomForbiddenMessage"));
            return false;
         }
         return true;
      }

      private function getCurrentScreen() : §_-3-x§
      {
         return §_-72Y§.§_-CYz§(this.§_-4OB§.getRoom(this.§_-5y6§),this.§_-35l§,this.§_-0uK§,§_-6gl§);
      }

      public function get §_-4BX§() : §_-5r8§
      {
         return currentScreen is §_-3-x§ ? (currentScreen as §_-3-x§).§_-4BX§ : null;
      }

      override public function get zoneId() : String
      {
         return this.§_-4OB§.zoneId;
      }

      override public function get locationId() : String
      {
         return this.§_-4OB§.id;
      }

      public function get §_-1n2§() : String
      {
         return this.§_-5y6§;
      }

      public function get layerId() : String
      {
         return this.§_-0uK§;
      }

      public function get §_-jY§() : §_-7zb§
      {
         return this.§_-4OB§;
      }

      override public function destroy() : void
      {
         if(destroyed)
         {
            return;
         }
         this.switchRoom(null);
         this.§_-4OB§ = null;
         if(this.§_-1Cg§ != null)
         {
            this.§_-1Cg§.destroy();
            this.§_-1Cg§ = null;
         }
         super.destroy();
      }
   }
}
