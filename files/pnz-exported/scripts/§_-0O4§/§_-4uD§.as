package §_-0O4§
{
   import §_-0Uz§.§_-3mj§;
   import §_-1i8§.§_-4LS§;
   import §_-2qd§.§_-9ai§;
   import §_-2uU§.§_-5Kh§;
   import §_-3TY§.§_-6k2§;
   import §_-5Es§.§_-5hE§;
   import §_-6-L§.§_-49j§;
   import §_-6BB§.§_-8BS§;
   import §_-6GW§.§_-BSm§;
   import §_-786§.§_-CRy§;
   import §_-7nb§.§_-B00§;
   import §_-9VF§.§_-3yI§;
   import §_-AKx§.§_-0jI§;
   import §_-AKx§.§_-2-c§;
   import §_-AKx§.§_-4OH§;
   import §_-BeZ§.§_-4Ww§;
   import §_-GM§.Context;
   import §_-MZ§.§_-12j§;
   import §_-MZ§.§_-7zb§;
   import §_-kr§.§_-Ud§;
   import penzville.Application;
   import penzville.Config;
   
   public class §_-4uD§ extends §_-B00§
   {
      private var §_-4OB§:§_-7zb§ = null;
      
      private var §_-7yn§:String = null;
      
      private var §_-BKC§:String = null;
      
      private var §_-5y6§:String = null;
      
      private var §_-35l§:String = null;
      
      public function §_-4uD§(param1:String, param2:String, param3:String = null)
      {
         super();
         this.§_-4OB§ = Context.§_-BFW§.§_-4Bq§(param1);
         this.§_-7yn§ = param2;
         this.§_-BKC§ = param3;
         §_-9yg§ = [];
         §_-49j§.merge(§_-9yg§,this.§_-4OB§.loadingContent);
      }
      
      override public function init() : void
      {
         Context.§_-Bad§.§_-fz§(function():void
         {
            Context.§_-Bad§.§_-4oB§();
         });
         currentScreen = createPreloaderScreen();
         if(§_-9yg§ != null)
         {
            §_-0oY§ = new §_-Ud§(§_-9yg§,false);
            §_-0oY§.addEventListener(§_-CRy§.§_-Sf§,onContentLoad);
            §_-0oY§.load();
         }
         else
         {
            §_-4wj§();
         }
         Context.§_-96h§.volume = 0.5;
      }
      
      override protected function createNetClient(param1:Function) : void
      {
         Context.§_-CLP§.§_-0u1§(param1,Config.outsideServer,Config.outsidePort,this.zoneId);
      }
      
      override protected function connect() : void
      {
         var _loc1_:String = Context.§_-2BT§.adapter.userId;
         var _loc2_:§_-4Ww§ = new §_-4Ww§();
         Context.player.userInfo.toAGSObject(_loc2_);
         if(Context.§_-2BT§.adapter.socialNetwork == §_-8BS§.§_-Boi§)
         {
            _loc2_.remove(§_-3yI§.§_-50S§);
            _loc2_.remove(§_-3yI§.§_-20Y§);
            _loc2_.remove(§_-3yI§.§_-1sW§);
            _loc2_.remove(§_-3yI§.§_-2K5§);
            _loc2_.remove(§_-3yI§.§_-1ne§);
         }
         _loc2_.put(§_-3mj§.§_-0C7§,Context.§_-2BT§.referrerType);
         _loc2_.put(§_-3mj§.§_-AZz§,Context.§_-2BT§.referrerId);
         _loc2_.put(§_-3mj§.§_-BhE§,Config.version);
         _loc2_.put(§_-3mj§.§_-2vo§,Config.apiVersion);
         _loc2_.put(§_-3mj§.§_-7Po§,§_-6k2§.§_-2pB§(Config.socialNetwork));
         _loc2_.put(§_-3mj§.§_-1fl§,§_-6k2§.§_-2pB§(Context.§_-2BT§.adapter.socialNetwork));
         §_-6gl§.connect(this.zoneId,_loc1_,_loc2_);
      }
      
      override protected function initLocation() : void
      {
         this.switchRoom(this.§_-7yn§);
      }
      
      override public function switchRoom(param1:String) : void
      {
         if(this.§_-35l§ != null)
         {
            if(Application.instance.status != Application.§_-1Ui§)
            {
               §_-6gl§.leaveRoom(this.§_-35l§);
            }
            this.§_-35l§ = null;
         }
         this.§_-5y6§ = param1;
         if(this.§_-5y6§ != null)
         {
            this.getRoom(this.§_-5y6§);
         }
      }
      
      private function getRoom(param1:String) : void
      {
         var params:§_-4Ww§;
         var roomId:String = param1;
         var room:§_-12j§ = this.§_-4OB§.getRoom(this.§_-7yn§);
         if(room != null && room.minLevel > 0 && §_-5hE§.§_-25G§.§_-1p4§.level < room.minLevel)
         {
            §_-4OH§.§_-B5P§(Context.§_-5o8§.message("locationLevelTitle"),Context.§_-5o8§.message("locationLevelWarning",{"level":room.minLevel}),function(param1:§_-2-c§):void
            {
               Context.§_-CLP§.visitByLocationInfo(Context.player.locationInfo,false);
            });
            return;
         }
         if(room != null && room.isVip && !§_-5hE§.§_-25G§.§_-1p4§.isVip)
         {
            §_-4OH§.confirm(Context.§_-5o8§.message("locationNeedVipTitle"),Context.§_-5o8§.message("locationNeedVipWarning"),function(param1:§_-2-c§):void
            {
               if(param1.§_-B66§.modalResult != §_-0jI§.§_-9qy§)
               {
                  Context.§_-CLP§.visitByLocationInfo(Context.player.locationInfo,false);
               }
            });
            return;
         }
         §_-6gl§.commandDispatcher.addEventListener(§_-4LS§.§_-4gk§,this.§_-2D7§);
         params = new §_-4Ww§();
         params.put(§_-BSm§.§_-005§,this.§_-4OB§.id);
         params.put(§_-BSm§.§_-56A§,roomId);
         if(this.§_-BKC§ != null)
         {
            params.put(§_-BSm§.§_-3Z1§,this.§_-BKC§);
            this.§_-BKC§ = null;
         }
         §_-6gl§.sendExtMessage(§_-4LS§.§_-4gk§,params);
      }
      
      protected function §_-2D7§(param1:§_-9ai§) : void
      {
         §_-6gl§.commandDispatcher.removeEventListener(§_-4LS§.§_-4gk§,this.§_-2D7§);
         this.§_-35l§ = param1.data.getString(§_-BSm§.§_-3Z1§);
         currentScreen = new §_-5Kh§(this.§_-35l§,§_-6gl§,this.§_-4OB§.getRoom(this.§_-5y6§));
      }
      
      override public function get zoneId() : String
      {
         return this.§_-4OB§.zoneId;
      }
      
      override public function get locationId() : String
      {
         return this.§_-4OB§.id;
      }
      
      override public function destroy() : void
      {
         if(destroyed)
         {
            return;
         }
         this.switchRoom(null);
         super.destroy();
      }
   }
}

