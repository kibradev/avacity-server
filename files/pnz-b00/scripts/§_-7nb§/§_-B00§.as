package §_-7nb§
{
   import §_-0Uz§.§_-3mj§;
   import §_-0c2§.§_-11E§;
   import §_-0uA§.§_-3YE§;
   import §_-1Fx§.§_-5n7§;
   import §_-1iV§.§_-BkM§;
   import §_-1ks§.§_-3Ya§;
   import §_-1ks§.§_-VC§;
   import §_-2qd§.AGSConnectEvent;
   import §_-2qd§.§_-6Qj§;
   import §_-2qd§.§_-9ai§;
   import §_-2qd§.§_-9tB§;
   import §_-3TY§.§_-6k2§;
   import §_-3ie§.§_-6SW§;
   import §_-5Cn§.§_-5lL§;
   import §_-5G6§.§_-2tc§;
   import §_-5JJ§.§_-15C§;
   import §_-5Z-§.§_-Ahc§;
   import §_-6GW§.§_-2mz§;
   import §_-6GW§.§_-87j§;
   import §_-6GW§.§_-BSm§;
   import §_-786§.§_-CRy§;
   import §_-7lY§.§_-3pq§;
   import §_-7xl§.§_-8Ks§;
   import §_-A2M§.§_-4Ba§;
   import §_-AKx§.§_-0jI§;
   import §_-AKx§.§_-2-c§;
   import §_-AKx§.§_-4OH§;
   import §_-AKx§.§_-GN§;
   import §_-AZ4§.§_-1Vi§;
   import §_-AZ4§.§_-3Lb§;
   import §_-B9N§.§_-79O§;
   import §_-Bdn§.§_-AlJ§;
   import §_-BeZ§.§_-4Ww§;
   import §_-CLv§.§_-C-X§;
   import §_-CLv§.§_-C5m§;
   import §_-CNP§.§_-9sO§;
   import §_-GM§.Context;
   import §_-GM§.§_-7VH§;
   import §_-kr§.§_-Ud§;
   import §_-qH§.§_-8uS§;
   import ags.§_-5x-§;
   import flash.events.Event;
   import flash.external.ExternalInterface;
   import penzville.Application;
   import penzville.Config;
   import penzville.§_-7tX§;
   
   public class §_-B00§ implements §_-8Ks§
   {
      
      protected var §_-34M§:§_-5n7§ = null;
      
      protected var §_-rh§:§_-VC§ = null;
      
      protected var §_-6gl§:§_-5x-§ = null;
      
      protected var §_-9yg§:Array = null;
      
      protected var _destroyed:Boolean = false;
      
      protected var §_-0oY§:§_-Ud§ = null;
      
      protected var §_-6HJ§:§_-4Ba§ = new §_-4Ba§();
      
      public function §_-B00§()
      {
         super();
      }
      
      public function init() : void
      {
         Context.§_-Bad§.§_-fz§(function():void
         {
            Context.§_-Bad§.§_-4oB§();
         });
         this.showPreloader();
         if(this.§_-9yg§ != null)
         {
            this.§_-0oY§ = new §_-Ud§(this.§_-9yg§,false);
            this.§_-0oY§.addEventListener(§_-CRy§.§_-Sf§,this.onContentLoad);
            this.§_-0oY§.load();
         }
         else
         {
            this.§_-4wj§();
         }
      }
      
      protected function showPreloader(param1:Boolean = false) : void
      {
         this.currentScreen = this.createPreloaderScreen();
      }
      
      protected function §_-81z§(param1:Array) : §_-4Ba§
      {
         if(param1.length > 0)
         {
            this.showPreloader(true);
            return this.§_-A2L§(param1);
         }
         return §_-4Ba§.resolve();
      }
      
      protected function §_-A2L§(param1:Array) : §_-4Ba§
      {
         var task:§_-4Ba§ = null;
         var listToLoad:Array = param1;
         task = new §_-4Ba§();
         var loader:§_-3pq§ = new §_-3pq§(listToLoad);
         loader.addEventListener(§_-CRy§.§_-Sf§,function(param1:§_-CRy§):void
         {
            task.resolve();
         });
         loader.addEventListener(§_-CRy§.§_-2qp§,function(param1:§_-CRy§):void
         {
            §_-4OH§.§_-B5P§(Context.§_-5o8§.message("error"),Context.§_-5o8§.message("unknownError"));
         });
         loader.addEventListener(§_-CRy§.§_-BhX§,function(param1:§_-CRy§):void
         {
            if(currentScreen is §_-15C§)
            {
               (currentScreen as §_-15C§).§_-9Tw§(param1.§_-3nI§ * 100);
            }
            else if(Config.§_-37U§ == Config.§_-20b§)
            {
               §_-7VH§.instance.§_-9bL§.§_-5-j§(param1.§_-3nI§ * 100);
            }
         });
         loader.load();
         return task;
      }
      
      protected function createPreloaderScreen() : §_-VC§
      {
         return new §_-15C§();
      }
      
      protected function §_-4wj§() : void
      {
         this.createNetClient(this.§_-C0r§);
      }
      
      protected function createNetClient(param1:Function) : void
      {
      }
      
      protected function connect() : void
      {
         var _loc1_:String = Context.§_-2BT§.adapter.userId;
         var _loc2_:§_-4Ww§ = new §_-4Ww§();
         if(§_-7tX§.§_-9Z9§)
         {
            if(§_-7tX§.§_-Bsw§)
            {
               _loc2_.put(§_-3mj§.§_-AKL§,§_-7tX§.§_-AqA§);
            }
            else
            {
               _loc2_.put(§_-3mj§.§_-BFf§,§_-7tX§.§_-AqA§);
            }
            _loc2_.put(§_-3mj§.§_-08M§,§_-7tX§.§_-4tu§);
         }
         _loc2_.put(§_-3mj§.§_-2vo§,Config.apiVersion);
         _loc2_.put(§_-3mj§.§_-BhE§,Config.version);
         _loc2_.put(§_-3mj§.§_-7Po§,§_-6k2§.§_-2pB§(Config.socialNetwork));
         _loc2_.put(§_-3mj§.§_-1fl§,§_-6k2§.§_-2pB§(Context.§_-2BT§.adapter.socialNetwork));
         this.§_-6gl§.connect(this.zoneId,_loc1_,_loc2_);
      }
      
      protected function initLocation() : void
      {
      }
      
      private function loggedIn() : Boolean
      {
         return this.§_-6gl§.zone == this.zoneId && this.§_-6gl§.loggedIn;
      }
      
      private function login() : void
      {
         this.§_-6gl§.addEventListener(§_-9tB§.§_-7Lr§,this.§_-3vM§);
         this.§_-8t4§(function(param1:String):void
         {
            §_-6gl§.§_-6Tj§(zoneId,param1);
         });
      }
      
      private function §_-8t4§(param1:Function) : void
      {
         var authClient:§_-C5m§ = null;
         var adapter:§_-9sO§ = null;
         var callback:Function = param1;
         authClient = Context.authClient;
         if(authClient.active)
         {
            if(Context.§_-2BT§.adapter is §_-9sO§)
            {
               adapter = Context.§_-2BT§.adapter as §_-9sO§;
               adapter.getAuthParams(function(param1:Object):void
               {
                  authClient.updateFlashVars(param1);
                  §_-6m0§(callback);
               });
            }
            else
            {
               this.§_-6m0§(callback);
            }
         }
         else
         {
            callback(Context.§_-2BT§.adapter.password);
         }
      }
      
      private function §_-6m0§(param1:Function) : void
      {
         var callback:Function = param1;
         var authClient:§_-C5m§ = Context.authClient;
         authClient.auth(function(param1:String):void
         {
            callback(param1);
         },function(param1:§_-C-X§):void
         {
            §_-3YE§.error("auth error: " + param1.message);
         });
      }
      
      private function §_-5lv§() : void
      {
         if(Config.§_-0nZ§)
         {
            Context.§_-CLP§.§_-0KB§();
         }
         var _loc1_:§_-5lL§ = new §_-5lL§();
         if(this.currentScreen != null)
         {
            this.currentScreen.addChild(_loc1_);
         }
         else if(this.§_-34M§ != null)
         {
            this.§_-34M§.addChild(_loc1_);
         }
         else
         {
            §_-BkM§.getStage().addChild(_loc1_);
         }
      }
      
      protected function onContentLoad(param1:§_-CRy§) : void
      {
         this.§_-0oY§.removeEventListener(§_-CRy§.§_-Sf§,this.onContentLoad);
         this.§_-0oY§ = null;
         this.§_-4wj§();
      }
      
      protected function §_-C0r§(param1:§_-5x-§) : void
      {
         this.§_-6gl§ = param1;
         if(this.§_-6gl§ == null)
         {
            return;
         }
         this.§_-6gl§.addEventListener(AGSConnectEvent.CONNECT,this.§_-1vF§);
         this.§_-6gl§.addEventListener(AGSConnectEvent.§_-3-i§,this.onConnectError);
         this.§_-6gl§.addEventListener(§_-6Qj§.§_-Bnp§,this.onDisconnect);
         this.§_-6gl§.addEventListener(§_-6Qj§.§_-84d§,this.onDisconnect);
         if(!this.§_-6gl§.connected)
         {
            this.connect();
         }
         else if(!this.loggedIn())
         {
            this.login();
         }
         else
         {
            this.initLocation();
         }
      }
      
      protected function §_-1vF§(param1:AGSConnectEvent) : void
      {
         this.login();
      }
      
      private function §_-3vM§(param1:§_-9tB§) : void
      {
         this.§_-6gl§.removeEventListener(§_-9tB§.§_-7Lr§,this.§_-3vM§);
         if(Application.instance.status == Application.§_-1Ui§)
         {
            Application.instance.status = Application.§_-9NL§;
            if(Context.settings.musicEnabled)
            {
               Context.§_-96h§.§_-2dy§();
            }
         }
         this.initLocation();
      }
      
      protected function onConnectError(param1:AGSConnectEvent) : void
      {
         var writer:§_-2tc§ = null;
         var event:AGSConnectEvent = param1;
         switch(event.errorCode)
         {
            case §_-3Lb§.§_-9wo§:
               new §_-11E§(§_-79O§.§_-5hp§(event.details)).showModal();
               break;
            case §_-3Lb§.§_-6Qm§:
               §_-4OH§.§_-B5P§(Context.§_-5o8§.message("maintenanceError1Title"),Context.§_-5o8§.message("maintenanceError1Desc"),null,false);
               this.§_-5lv§();
               break;
            case §_-3Lb§.§_-7Uf§:
               new §_-AlJ§(Context.§_-5o8§.message("maintenanceError")).showModal();
               this.§_-5lv§();
               break;
            case §_-3Lb§.§_-7E8§:
               §_-4OH§.§_-B5P§(Context.§_-5o8§.message("error"),Context.§_-5o8§.message("wrongApiVersion"),function(param1:§_-2-c§):void
               {
                  if(ExternalInterface.available)
                  {
                     ExternalInterface.call("window.location.reload(true)");
                  }
               });
               break;
            case §_-3Lb§.§_-BZU§:
               new §_-87j§().tryReconnect();
               break;
            case §_-2mz§.§_-BME§:
               §_-4OH§.§_-B5P§(Context.§_-5o8§.message("error"),Context.§_-5o8§.message("registrationSuspended"));
               this.§_-5lv§();
               break;
            case §_-2mz§.§_-9IW§:
               §_-4OH§.§_-B5P§(Context.§_-5o8§.message("wrongSocialKeyTitle"),Context.§_-5o8§.message("wrongSocialKeyDescription"),function():void
               {
                  Context.§_-1ny§.§_-1EU§(function():void
                  {
                     connect();
                  });
               });
               break;
            case §_-2mz§.§_-6vD§:
               Context.§_-1ny§.§_-1EU§(function():void
               {
                  connect();
               });
               break;
            case §_-2mz§.§_-2sN§:
               §_-4OH§.§_-B5P§(Context.§_-5o8§.message("warning"),Context.§_-5o8§.message("reloadNeeded"),function(param1:§_-2-c§):void
               {
                  if(ExternalInterface.available)
                  {
                     ExternalInterface.call("window.location.reload(true)");
                  }
                  if(Context.instance.§_-AIA§.isMobile)
                  {
                     Context.instance.§_-Bao§.logout();
                  }
               });
               break;
            case §_-2mz§.§_-5Xb§:
               Context.§_-CLP§.visitCityHouse();
               break;
            default:
               §_-3YE§.error("Couldn\'t connect to location: " + event.toString());
               this.showReconnectDialog();
               if(Config.§_-1I3§)
               {
                  writer = new §_-2tc§(Config.§_-46r§,Config.§_-C7Y§);
                  writer.§_-1CB§(event.toString());
               }
         }
      }
      
      protected function showReconnectDialog() : void
      {
         §_-4OH§.confirm(Context.§_-5o8§.message("error"),Context.§_-5o8§.message("serverConnectionError"),function(param1:§_-2-c§):void
         {
            if(param1.§_-B66§.modalResult == §_-0jI§.§_-9qy§)
            {
               §_-C3F§();
               §_-4wj§();
            }
         });
      }
      
      protected function onDisconnect(param1:§_-6Qj§) : void
      {
         var event:§_-6Qj§ = param1;
         §_-3YE§.error("Lost server connection: " + event.toString());
         if(Application.instance.status == Application.§_-APR§)
         {
            if(Context.settings.musicEnabled)
            {
               Context.§_-96h§.§_-2rW§();
            }
            return;
         }
         if(Application.instance.status == Application.§_-9NL§)
         {
            Application.instance.status = Application.§_-1Ui§;
            if(Context.settings.musicEnabled)
            {
               Context.§_-96h§.§_-2rW§();
            }
         }
         Context.§_-3hG§ = null;
         Application.instance.currentScreen = new §_-3Ya§();
         if(event.reason == §_-1Vi§.§_-9x1§)
         {
            Context.player.loaded = false;
            Context.§_-CLP§.§_-CHX§();
         }
         else if(event.reason == §_-1Vi§.CLOSE)
         {
            §_-4OH§.§_-B5P§(Context.§_-5o8§.message("error"),Context.§_-5o8§.message("maintenanceError"));
            this.§_-5lv§();
         }
         else if(event.reason == §_-1Vi§.§_-8r7§)
         {
            new §_-11E§(§_-79O§.§_-5hp§(event.details)).showModal();
         }
         else if(event.reason == §_-1Vi§.§_-71d§)
         {
            §_-4OH§.§_-B5P§(Context.§_-5o8§.message("error"),Context.§_-5o8§.message("duplicateUserSessionError"));
         }
         else if(event.reason == §_-1Vi§.§_-7dr§)
         {
            Context.§_-CLP§.§_-21N§();
            §_-4OH§.§_-B5P§(Context.§_-5o8§.message("warning"),Context.§_-5o8§.message("tryRefreshMessage"),function(param1:§_-2-c§):void
            {
               if((param1.currentTarget as §_-GN§).modalResult == §_-0jI§.§_-9qy§ && ExternalInterface.available)
               {
                  ExternalInterface.call("window.location.reload();");
               }
            });
         }
         else
         {
            new §_-AlJ§().showModal();
         }
      }
      
      public function get zoneId() : String
      {
         return null;
      }
      
      public function get locationId() : String
      {
         return null;
      }
      
      public function switchRoom(param1:String) : void
      {
      }
      
      public function set container(param1:§_-5n7§) : void
      {
         this.§_-34M§ = param1;
      }
      
      public function set currentScreen(param1:§_-VC§) : void
      {
         var screen:§_-VC§ = param1;
         if(this.§_-rh§ != null)
         {
            this.§_-rh§.destroy();
            this.§_-rh§ = null;
         }
         if(this.§_-34M§ == null)
         {
            return;
         }
         if(screen != null)
         {
            this.§_-rh§ = screen;
            this.§_-34M§.addChild(this.§_-rh§);
            this.§_-rh§.location = this;
            if(this.§_-rh§ is §_-Ahc§ && this.§_-6HJ§ != null)
            {
               §_-4Ba§.§_-2f6§(this.§_-rh§,§_-6SW§.§_-4hI§).then(function(param1:Event):void
               {
                  §_-6HJ§.resolve();
                  §_-6HJ§ = null;
               }).error(this.§_-6HJ§.reject);
            }
            this.§_-rh§.init();
         }
      }
      
      public function get currentScreen() : §_-VC§
      {
         return this.§_-rh§;
      }
      
      public function get destroyed() : Boolean
      {
         return this._destroyed;
      }
      
      public function get §_-CRa§() : §_-4Ba§
      {
         return this.§_-6HJ§;
      }
      
      protected function §_-5-J§(param1:String, param2:String, param3:String, param4:String) : void
      {
         if(this.§_-6gl§ == null)
         {
            return;
         }
         this.§_-6gl§.commandDispatcher.addEventListener(param1,this.§_-4vr§);
         var _loc5_:§_-4Ww§ = new §_-4Ww§();
         if(param4 != null)
         {
            _loc5_.put(§_-BSm§.§_-005§,param4);
         }
         if(param3 != null)
         {
            _loc5_.put(§_-BSm§.§_-56A§,param3);
         }
         if(param2 != null)
         {
            _loc5_.put(§_-BSm§.§_-3Z1§,param2);
         }
         this.§_-6gl§.sendExtMessage(param1,_loc5_);
      }
      
      private function §_-4vr§(param1:§_-9ai§) : void
      {
         var data:§_-4Ww§;
         var event:§_-9ai§ = param1;
         if(this.§_-6gl§ == null)
         {
            return;
         }
         this.§_-6gl§.commandDispatcher.removeEventListener(§_-8uS§.§_-5WP§,this.§_-4vr§);
         data = event.data;
         if(data.getBoolean(§_-BSm§.§_-ALd§,false))
         {
            §_-4OH§.§_-B5P§(Context.§_-5o8§.message("houseKickedTitle"),Context.§_-5o8§.message("eventKickedMessage"),function(param1:§_-2-c§):void
            {
               Context.§_-CLP§.visitByLocationInfo(Context.player.locationInfo,false);
            });
            return;
         }
         if(data.getBoolean(§_-BSm§.§_-7Ek§,false))
         {
            §_-4OH§.§_-B5P§(Context.§_-5o8§.message("houseLockedTitle"),Context.§_-5o8§.message("houseLockedMessage"),function(param1:§_-2-c§):void
            {
               Context.§_-CLP§.visitCityHouse();
            });
            return;
         }
         this.processRoomConnectResult(data);
      }
      
      protected function processRoomConnectResult(param1:§_-4Ww§) : void
      {
      }
      
      protected function §_-C3F§() : void
      {
         if(this.§_-6gl§ != null)
         {
            this.§_-6gl§.removeEventListener(AGSConnectEvent.CONNECT,this.§_-1vF§);
            this.§_-6gl§.removeEventListener(AGSConnectEvent.§_-3-i§,this.onConnectError);
            this.§_-6gl§.removeEventListener(§_-6Qj§.§_-Bnp§,this.onDisconnect);
            this.§_-6gl§.removeEventListener(§_-6Qj§.§_-84d§,this.onDisconnect);
            this.§_-6gl§.commandDispatcher.removeEventListener(§_-8uS§.§_-5WP§,this.§_-4vr§);
            this.§_-6gl§ = null;
         }
      }
      
      public function destroy() : void
      {
         this.§_-C3F§();
         if(this.§_-rh§ != null)
         {
            this.§_-rh§.destroy();
            this.§_-rh§ = null;
         }
         this.§_-34M§ = null;
         if(this.§_-0oY§ != null)
         {
            this.§_-0oY§.removeEventListener(§_-CRy§.§_-Sf§,this.onContentLoad);
            this.§_-0oY§ = null;
         }
         if(this.§_-6HJ§ != null)
         {
            this.§_-6HJ§.§_-Akz§();
            this.§_-6HJ§ = null;
         }
         this._destroyed = true;
      }
   }
}

