package §_-4Q1§
{
   import §_-3hC§.§_-3-x§;
   import §_-3ie§.§_-6SW§;
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
   import flash.text.TextField;

   public class §_-4v6§ extends §_-6kZ§
   {

      private var §_-4OB§:§_-7zb§ = null;

      private var §_-7yn§:String = null;

      private var §_-BKC§:String = null;

      private var §_-5y6§:String = null;

      private var §_-35l§:String = null;

      private var §_-0uK§:String = null;

      private var §_-1Cg§:§_-5r8§ = null;

      private static var §_-CHTDBG_TF§:TextField = null;

      private static function §_-chtdbgLog§(param1:String) : void
      {
         try
         {
            if(§_-CHTDBG_TF§ == null)
            {
               §_-CHTDBG_TF§ = new TextField();
               §_-CHTDBG_TF§.width = 620;
               §_-CHTDBG_TF§.height = 400;
               §_-CHTDBG_TF§.x = 655;
               §_-CHTDBG_TF§.y = 5;
               §_-CHTDBG_TF§.multiline = true;
               §_-CHTDBG_TF§.wordWrap = true;
               §_-CHTDBG_TF§.background = true;
               §_-CHTDBG_TF§.backgroundColor = 0;
               §_-CHTDBG_TF§.textColor = 65280;
               §_-CHTDBG_TF§.mouseEnabled = false;
               §_-CHTDBG_TF§.selectable = false;
               Application.instance.stage.addChild(§_-CHTDBG_TF§);
            }
            Application.instance.stage.setChildIndex(§_-CHTDBG_TF§,Application.instance.stage.numChildren - 1);
            §_-CHTDBG_TF§.appendText(param1 + "\n");
            if(§_-CHTDBG_TF§.numLines > 26)
            {
               §_-CHTDBG_TF§.text = §_-CHTDBG_TF§.text.split("\n").slice(-26).join("\n");
            }
         }
         catch(e:Error)
         {
         }
      }

      public function §_-4v6§(param1:String, param2:String, param3:String, param4:String)
      {
         super();
         §_-4v6§.§_-chtdbgLog§("CTOR locId=" + param1 + " defaultRoom=" + param2);
         try
         {
            this.§_-4OB§ = Context.§_-BFW§.§_-4Bq§(param1);
            §_-4v6§.§_-chtdbgLog§("CTOR §_-4OB§(location)=" + this.§_-4OB§);
            this.§_-7yn§ = param2;
            this.§_-BKC§ = param3;
            this.§_-0uK§ = param4;
            §_-9yg§ = Config.§_-7vO§;
            §_-4v6§.§_-chtdbgLog§("CTOR loadingContent=" + this.§_-4OB§.loadingContent);
            §_-49j§.merge(§_-9yg§,this.§_-4OB§.loadingContent);
            §_-4v6§.§_-chtdbgLog§("CTOR OK, merged loadingContent");
         }
         catch(e:Error)
         {
            §_-4v6§.§_-chtdbgLog§("CTOR CRASH: " + e.message + "\n" + e.getStackTrace());
         }
      }

      override protected function createNetClient(param1:Function) : void
      {
         §_-4v6§.§_-chtdbgLog§("createNetClient zoneId=" + this.zoneId + " server=" + Config.outsideServer + ":" + Config.outsidePort);
         Context.§_-CLP§.§_-0u1§(param1,Config.outsideServer,Config.outsidePort,this.zoneId);
      }

      override protected function initLocation() : void
      {
         §_-4v6§.§_-chtdbgLog§("initLocation -> switchRoom(" + this.§_-7yn§ + ")");
         this.switchRoom(this.§_-7yn§);
      }

      override public function switchRoom(param1:String) : void
      {
         §_-4v6§.§_-chtdbgLog§("switchRoom(" + param1 + ") called");
         if(!this.§_-4Zo§(param1))
         {
            §_-4v6§.§_-chtdbgLog§("switchRoom: §_-4Zo§ validation returned false, ABORTING");
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
         if(Application.instance.status != Application.§_-1Ui§)
         {
            §_-6gl§.leaveRoom(this.§_-35l§);
         }
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
         §_-4v6§.§_-chtdbgLog§("getRoom: sending o.gr rid=" + _loc2_ + " gid=" + param1 + " lid=" + this.§_-4OB§.id);
         §_-5-J§(§_-0GJ§.§_-5WP§,_loc2_,param1,this.§_-4OB§.id);
      }

      override protected function processRoomConnectResult(param1:§_-4Ww§) : void
      {
         §_-4v6§.§_-chtdbgLog§("processRoomConnectResult RECEIVED from server!");
         try
         {
            super.processRoomConnectResult(param1);
            §_-4v6§.§_-chtdbgLog§("super.processRoomConnectResult OK");
         }
         catch(e:Error)
         {
            §_-4v6§.§_-chtdbgLog§("super.processRoomConnectResult CRASH: " + e.message + "\n" + e.getStackTrace());
         }
         this.§_-35l§ = param1.getString(§_-BSm§.§_-3Z1§);
         §_-4v6§.§_-chtdbgLog§("clientRoomId=" + this.§_-35l§ + " wantedRoom=" + this.§_-5y6§);
         var _loc2_:§_-12j§ = this.§_-4OB§.getRoom(this.§_-5y6§);
         §_-4v6§.§_-chtdbgLog§("room(§_-12j§)=" + _loc2_);
         var _loc3_:§_-3Fc§ = new §_-3Fc§(§_-3Fc§.§_-559§,this.§_-4OB§.id,this.§_-5y6§,_loc2_,this.§_-4GN§);
         Application.instance.dispatchEvent(_loc3_);
         §_-4v6§.§_-chtdbgLog§("isDefaultPrevented=" + _loc3_.isDefaultPrevented());
         if(!_loc3_.isDefaultPrevented())
         {
            this.§_-4GN§();
         }
      }

      private function §_-4GN§() : void
      {
         §_-4v6§.§_-chtdbgLog§("§_-4GN§: getCurrentScreen() starting");
         try
         {
            var _loc1_:§_-3-x§ = this.getCurrentScreen();
            §_-4v6§.§_-chtdbgLog§("§_-4GN§: getCurrentScreen() OK -> " + _loc1_);
            currentScreen = _loc1_;
            §_-4v6§.§_-chtdbgLog§("§_-4GN§: currentScreen assigned OK");
            _loc1_.addEventListener(§_-6SW§.§_-CDg§,function(param1:§_-6SW§):void
            {
               §_-4v6§.§_-chtdbgLog§("screen: getRoomInfo event (room data OK)");
            });
            _loc1_.addEventListener(§_-6SW§.§_-4hI§,function(param1:§_-6SW§):void
            {
               §_-4v6§.§_-chtdbgLog§("screen: avatarsLoaded -> loading should end");
            });
         }
         catch(e:Error)
         {
            §_-4v6§.§_-chtdbgLog§("§_-4GN§ CRASH: " + e.message + "\n" + e.getStackTrace());
         }
      }

      private function §_-4Zo§(param1:String) : Boolean
      {
         if(param1 == null)
         {
            this.leaveRoom();
            return false;
         }
         if(this.§_-4OB§ == null)
         {
            §_-4v6§.§_-chtdbgLog§("§_-4Zo§: this.§_-4OB§ (location) is NULL, would crash on getRoom below!");
         }
         var _loc2_:§_-12j§ = this.§_-4OB§.getRoom(param1);
         if(_loc2_ == null)
         {
            §_-4v6§.§_-chtdbgLog§("§_-4Zo§: getRoom(" + param1 + ") returned null -> abort");
            return false;
         }
         if(!Context.§_-BFW§.§_-uY§(this.locationId) && _loc2_.minLevel > 0 && !Context.§_-BFW§.§_-9XJ§(_loc2_.minLevel))
         {
            §_-4v6§.§_-chtdbgLog§("§_-4Zo§: minLevel block");
            Context.§_-BFW§.§_-0Y2§(_loc2_.minLevel);
            return false;
         }
         if(_loc2_.isVip && !Context.§_-BFW§.§_-Bo8§())
         {
            §_-4v6§.§_-chtdbgLog§("§_-4Zo§: VIP block");
            §_-7tX§.§_-53l§(Context.§_-5o8§.message("vipRoomTitle"),Context.§_-5o8§.message("vipRoomForbiddenMessage"));
            return false;
         }
         §_-4v6§.§_-chtdbgLog§("§_-4Zo§: validation OK");
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
