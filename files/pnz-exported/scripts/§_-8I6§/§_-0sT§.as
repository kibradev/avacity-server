package §_-8I6§
{
   import §_-02i§.§_-7fR§;
   import §_-0Uz§.§_-3mj§;
   import §_-0Uz§.§_-BUw§;
   import §_-0fi§.§_-6f3§;
   import §_-0xS§.NY26RoomScreen;
   import §_-1DH§.AB26Module;
   import §_-1x4§.FacebookAdapter;
   import §_-27m§.AB26FriendRoomScreen;
   import §_-27m§.AB26RoomScreen;
   import §_-2as§.§_-0N-§;
   import §_-2qd§.§_-6Qj§;
   import §_-2qd§.§_-9ai§;
   import §_-3TY§.§_-5I8§;
   import §_-3TY§.§_-6k2§;
   import §_-3TY§.§_-6nA§;
   import §_-3VF§.§_-0nG§;
   import §_-40e§.§_-1m0§;
   import §_-4Q1§.§_-5Ia§;
   import §_-4cY§.§_-Akc§;
   import §_-52p§.§_-9d9§;
   import §_-5eM§.§_-5d-§;
   import §_-5wm§.§_-5YM§;
   import §_-66B§.NY26Module;
   import §_-6GW§.§_-BSm§;
   import §_-786§.§_-CRy§;
   import §_-7nb§.§_-6kZ§;
   import §_-7ts§.§_-3UP§;
   import §_-8LG§.HW25Module;
   import §_-8Ph§.§_-AzB§;
   import §_-8i3§.§_-2E0§;
   import §_-8i3§.§_-XJ§;
   import §_-9Fl§.§_-9H0§;
   import §_-9VF§.§_-48g§;
   import §_-9VF§.§_-5ab§;
   import §_-9xw§.§_-9BV§;
   import §_-9xw§.§_-CAc§;
   import §_-A2M§.§_-4Ba§;
   import §_-A6c§.§_-Hv§;
   import §_-AKx§.§_-0jI§;
   import §_-AKx§.§_-2-c§;
   import §_-AKx§.§_-4OH§;
   import §_-AKx§.§_-5hc§;
   import §_-Av5§.§_-6E§;
   import §_-BG-§.HW25RoomScreen;
   import §_-BeZ§.§_-4Ww§;
   import §_-Btg§.§_-1s0§;
   import §_-BxN§.§_-2O0§;
   import §_-C-a§.§_-3uA§;
   import §_-GM§.Context;
   import §_-GM§.§_-7VH§;
   import §_-PP§.§_-2Q-§;
   import §_-Uk§.§_-2H§;
   import §_-Uk§.§_-5ZD§;
   import §_-Uk§.§_-85Q§;
   import §_-Uk§.§_-A2q§;
   import §_-Uk§.§_-A6w§;
   import §_-kr§.SWFSharedManager;
   import §_-kr§.§_-2NT§;
   import §_-qH§.§_-6aI§;
   import §_-qH§.§_-8uS§;
   import adept.social.fotostrana.§_-4YB§;
   import penzville.Application;
   import penzville.Config;
   import penzville.§_-7tX§;
   
   public class §_-0sT§ extends §_-6kZ§
   {
      public static const §_-Ej§:String = "house";
      
      private var §_-5y6§:String = null;
      
      private var §_-35l§:String = null;
      
      protected var §_-7yn§:String = null;
      
      protected var §_-5so§:String = "";
      
      protected var _owner:§_-48g§ = null;
      
      protected var §_-5AQ§:Boolean = false;
      
      protected var §_-6k1§:Function = null;
      
      protected var §_-2b0§:Object = null;
      
      public function §_-0sT§(param1:String = null, param2:String = null)
      {
         super();
         this.§_-5so§ = param1;
         this.§_-7yn§ = param2;
         §_-9yg§ = Config.§_-9Fh§;
         Application.instance.addEventListener(§_-1m0§.§_-BgA§,this.§_-8zl§);
         Application.instance.addEventListener(§_-1m0§.§_-BXo§,this.§_-1ou§);
         Application.instance.addEventListener(§_-1m0§.§_-0qm§,this.§_-B6Y§);
      }
      
      public function §_-C8p§(param1:Number, param2:int) : void
      {
         §_-6gl§.commandDispatcher.addEventListener(§_-8uS§.§_-9hG§,this.§_-9XM§);
         var _loc3_:§_-4Ww§ = new §_-4Ww§();
         _loc3_.put(§_-XJ§.§_-8To§,param1);
         _loc3_.put(§_-XJ§.§_-95F§,param2);
         §_-6gl§.sendExtMessage(§_-8uS§.§_-9hG§,_loc3_);
      }
      
      public function §_-6Cu§() : void
      {
         var _loc1_:§_-4Ww§ = new §_-4Ww§();
         §_-6gl§.sendExtMessage(§_-8uS§.§_-CDj§,_loc1_);
      }
      
      override public function switchRoom(param1:String) : void
      {
         var furnitureToLoad:Array;
         var tasks:Array;
         var modulesContextTask:§_-4Ba§ = null;
         var roomId:String = param1;
         super.switchRoom(roomId);
         furnitureToLoad = [];
         if(this.§_-2b0§ != null && Boolean(this.§_-2b0§.hasOwnProperty(roomId)))
         {
            furnitureToLoad = this.§_-2b0§[roomId];
         }
         if(furnitureToLoad == null || furnitureToLoad.length == 0)
         {
            furnitureToLoad = this.§_-5Y7§(roomId);
         }
         tasks = [];
         if(furnitureToLoad.length > 0)
         {
            tasks.push(this.§_-0pA§(furnitureToLoad));
         }
         modulesContextTask = new §_-4Ba§();
         tasks.push(modulesContextTask);
         §_-0nG§.instance.loadingContent.then(function(param1:Array):void
         {
            if(param1.length == 0)
            {
               modulesContextTask.resolve();
            }
            else
            {
               §_-2NT§.§_-8wu§(param1).next(modulesContextTask);
            }
         });
         §_-4Ba§.all(tasks).then(function():void
         {
            changeRoom(roomId);
         });
      }
      
      public function §_-3i8§() : void
      {
         if(this.owner.house.initial)
         {
            this.§_-66-§(this.owner,function():void
            {
               owner.house.initial = false;
               new §_-9H0§(owner,(Context.§_-3hG§.currentScreen as §_-5ZD§).clientRoomId).showModal();
            });
            return;
         }
         new §_-9H0§(this.owner,(Context.§_-3hG§.currentScreen as §_-5ZD§).clientRoomId).showModal();
      }
      
      public function §_-66-§(param1:§_-48g§, param2:Function) : void
      {
         var _loc5_:§_-48g§ = null;
         this.§_-6k1§ = param2;
         §_-6gl§.commandDispatcher.addEventListener(§_-8uS§.§_-0NY§,this.§_-BQS§);
         var _loc3_:§_-4Ww§ = new §_-4Ww§();
         _loc3_.put(§_-6aI§.§_-9GV§,this.§_-5so§);
         _loc3_.put(§_-3mj§.§_-08M§,§_-7tX§.§_-4tu§);
         var _loc4_:Object = Context.§_-9q-§.§_-AB2§;
         if(_loc4_.hasOwnProperty(this.§_-5so§))
         {
            _loc5_ = _loc4_[this.§_-5so§];
            _loc3_.putString(§_-6aI§.§_-0Qk§,_loc5_.userInfo.socialId);
         }
         §_-6gl§.sendExtMessage(§_-8uS§.§_-0NY§,_loc3_);
      }
      
      private function changeRoom(param1:String) : void
      {
         if(this.§_-35l§ != null)
         {
            if(§_-6gl§ != null && §_-6gl§.loggedIn && Application.instance.status != Application.§_-1Ui§)
            {
               §_-6gl§.leaveRoom(this.§_-35l§);
            }
            this.§_-35l§ = null;
         }
         this.§_-5y6§ = param1;
         if(this.§_-5y6§ != null)
         {
            §_-5-J§(§_-8uS§.§_-5WP§,param1,this.§_-5so§,§_-7tX§.§_-BHJ§);
         }
      }
      
      private function §_-5Y7§(param1:String) : Array
      {
         var _loc3_:§_-2E0§ = null;
         var _loc4_:§_-Akc§ = null;
         var _loc2_:Array = [];
         if(param1 != null)
         {
            for each(_loc3_ in this._owner.house.roomList)
            {
               if(_loc3_.id == param1 || Context.cityPlayer.isTutorial)
               {
                  for each(_loc4_ in _loc3_.furnitureList)
                  {
                     _loc2_.push(_loc4_.typeId);
                  }
               }
            }
         }
         return _loc2_;
      }
      
      private function §_-B6Y§(param1:§_-1m0§) : void
      {
         if(this._owner != null && this._owner.id == Context.player.id)
         {
            this._owner.house = Context.cityPlayer.house;
         }
      }
      
      private function §_-BQS§(param1:§_-9ai§) : void
      {
         §_-6gl§.commandDispatcher.removeEventListener(§_-8uS§.§_-0NY§,this.§_-BQS§);
         this._owner = param1.data.§_-2jV§(§_-6aI§.§_-6gj§,§_-48g§);
         this._owner.house.fromAGSObject(param1.data.§_-ANw§(§_-48g§.§_-8hM§));
         Context.§_-3B2§.addPlayer(this._owner);
         if(this.§_-6k1§ != null)
         {
            this.§_-6k1§();
            this.§_-6k1§ = null;
         }
      }
      
      override protected function createNetClient(param1:Function) : void
      {
         Context.§_-CLP§.§_-0u1§(param1,Config.houseServer,Config.housePort,this.zoneId);
      }
      
      override protected function connect() : void
      {
         var _loc1_:String = Context.§_-2BT§.adapter.userId;
         var _loc2_:§_-4Ww§ = new §_-4Ww§();
         if(this.§_-2UP§)
         {
            if(§_-7tX§.§_-Bsw§)
            {
               _loc2_.put(§_-3mj§.§_-AKL§,§_-7tX§.§_-AqA§);
            }
            else
            {
               _loc2_.put(§_-3mj§.§_-BFf§,this.§_-5so§);
            }
            _loc2_.put(§_-3mj§.§_-08M§,§_-7tX§.§_-4tu§);
         }
         else
         {
            Context.player.userInfo.toAGSObject(_loc2_);
            _loc2_.put(§_-3mj§.§_-0C7§,Context.§_-2BT§.referrerType);
            _loc2_.put(§_-3mj§.§_-AZz§,Context.§_-2BT§.referrerId);
         }
         _loc2_.put(§_-3mj§.§_-2vo§,Config.apiVersion);
         _loc2_.put(§_-3mj§.§_-BBU§,§_-BUw§.§_-2MZ§);
         _loc2_.put(§_-3mj§.§_-BhE§,Config.version);
         _loc2_.put(§_-3mj§.§_-7Po§,§_-6k2§.§_-2pB§(Config.socialNetwork));
         _loc2_.put(§_-3mj§.§_-1fl§,§_-6k2§.§_-2pB§(Context.§_-2BT§.adapter.socialNetwork));
         _loc2_.put(§_-3mj§.§_-50i§,Context.§_-2BT§.adapter.unauthorizedSocialId);
         _loc2_.put(§_-3mj§.§_-07U§,this.§_-55n§);
         var _loc3_:String = Context.§_-1ny§.§_-1AR§;
         if(_loc3_ != null)
         {
            _loc2_.put(§_-3mj§.§_-8Ye§,_loc3_);
         }
         §_-6gl§.connect(§_-Ej§,_loc1_,_loc2_);
      }
      
      override protected function initLocation() : void
      {
         Context.§_-A3p§.addEventListener(§_-0N-§.§_-9FN§,this.§_-4MV§);
         Context.§_-A3p§.§_-1xy§();
      }
      
      override protected function showPreloader(param1:Boolean = false) : void
      {
         §_-7VH§.instance.§_-9bL§.showPreloader(§_-2Q-§.§_-9TZ§,param1);
      }
      
      private function §_-9Zd§() : void
      {
         Context.player.id = §_-6gl§.userId;
         if(this.§_-5so§ == null)
         {
            this.§_-5so§ = Context.player.id;
         }
         if(!Context.§_-9q-§.inited)
         {
            Context.§_-9q-§.§_-1VM§();
         }
         if(!Context.§_-AI9§.inited)
         {
            Context.§_-AI9§.init();
         }
         if(!Context.§_-AVO§.inited)
         {
            Context.§_-AVO§.init();
         }
         if(Config.§_-yO§(Context.player.userInfo.socialId) && !Context.§_-sF§.inited)
         {
            Context.§_-sF§.init();
         }
         if(!Context.§_-7Ho§.inited)
         {
            Context.§_-7Ho§.init();
         }
         §_-6gl§.commandDispatcher.addEventListener(§_-8uS§.§_-9eL§,this.§_-6Fj§);
         this.loadMyInfo();
      }
      
      protected function loadOwnerInfo() : void
      {
         §_-6gl§.commandDispatcher.addEventListener(§_-8uS§.§_-0NY§,this.§_-AXf§);
         var _loc1_:§_-4Ww§ = new §_-4Ww§();
         _loc1_.put(§_-6aI§.§_-9GV§,this.§_-5so§);
         §_-6gl§.sendExtMessage(§_-8uS§.§_-0NY§,_loc1_);
      }
      
      protected function §_-B4Y§() : String
      {
         return Context.player.avatarAppearance.gender == §_-3uA§.§_-908§ ? §_-1s0§.§_-5lA§ : §_-1s0§.§_-ARO§;
      }
      
      private function loadMyInfo() : void
      {
         §_-6gl§.commandDispatcher.addEventListener(§_-8uS§.§_-6Ts§,this.§_-AqJ§);
         var _loc1_:Date = new Date();
         var _loc2_:§_-4Ww§ = new §_-4Ww§();
         _loc2_.put(§_-3mj§.§_-1G8§,Math.round(_loc1_.getTime() / 1000));
         _loc2_.put(§_-3mj§.§_-BeL§,Context.player.loaded);
         _loc2_.put(§_-3mj§.§_-50i§,Context.§_-2BT§.adapter.unauthorizedSocialId);
         if(this.§_-2UP§)
         {
            _loc2_.put(§_-3mj§.§_-CHN§,this.§_-2UP§);
         }
         §_-6gl§.sendExtMessage(§_-8uS§.§_-6Ts§,_loc2_);
      }
      
      private function get §_-9Zl§() : Boolean
      {
         return this.§_-5so§ == Context.player.id;
      }
      
      private function goToCreateAvatarScreen() : void
      {
         Application.instance.addEventListener(§_-1m0§.§_-9FD§,this.§_-3gM§);
         Context.player.isNew = true;
         currentScreen = new §_-A6w§();
      }
      
      private function §_-7ti§(param1:§_-6E§) : void
      {
         Context.player.fromAGSObject(param1.§_-81R§);
         Context.player.loaded = true;
         Context.player.timeDelta = param1.timeDelta;
         Context.player.§_-9eC§ = param1.§_-7qD§;
         Context.§_-3W5§.init(Context.player);
         Context.§_-9h8§.init(Context.player);
         Context.§_-06H§.init(Context.cityPlayer);
         Context.§_-B4Z§.§_-2DL§();
         Context.§_-AI9§.§_-0CG§();
      }
      
      private function §_-4XO§() : void
      {
         if(!Context.player.isNew && Context.§_-3gu§.§_-5Tv§())
         {
            §_-5hc§.§_-57w§(new §_-7fR§(),false);
         }
         if(!Context.player.isNew && Context.§_-2BT§.adapter is §_-4YB§)
         {
            (Context.§_-2BT§.adapter as §_-4YB§).§_-BHM§(this.§_-472§);
         }
         if(!Context.cityPlayer.isTutorial && SWFSharedManager.isActive() && !SWFSharedManager.canUse() && !Context.cityPlayer.cityInfo.§_-1OM§ && Context.§_-3gu§.§_-Zi§())
         {
            §_-5hc§.§_-57w§(new §_-Hv§(),false);
         }
         if(!Context.player.isNew)
         {
            if(Config.§_-59E§ && Context.player.userInfo.islandLevel > 1)
            {
               Context.§_-0Q0§.§_-O8§(§_-3UP§.§_-Azu§,function(param1:§_-9d9§, param2:§_-5YM§):void
               {
                  if(param1 != null && !param1.isEmpty() || param2 != null && param2.items.length > 0)
                  {
                     §_-5hc§.§_-57w§(new §_-AzB§(param1,param2));
                  }
               });
            }
         }
         if(!Context.cityPlayer.isTutorial)
         {
            if(Config.offersAllowed && Context.cityPlayer.cityInfo.§_-0Vp§ == 0)
            {
               §_-5hc§.§_-57w§(new §_-2O0§(),false);
            }
         }
      }
      
      private function §_-5cJ§() : Boolean
      {
         if(Context.cityPlayer.isTutorial)
         {
            if(Context.cityPlayer.cityInfo.§_-3Jn§ == §_-1s0§.§_-61X§)
            {
               Context.§_-CLP§.§_-4gK§(§_-5Ia§.§_-2mD§,"cf1","tut" + Context.cityPlayer.id);
               return true;
            }
            if(Context.cityPlayer.cityInfo.§_-3Jn§ == §_-1s0§.§_-8C6§ || Context.cityPlayer.cityInfo.§_-3Jn§ == §_-1s0§.§_-3xe§)
            {
               Context.§_-CLP§.§_-4gK§(§_-5Ia§.§_-4QN§,"cl1","tut" + Context.cityPlayer.id);
               return true;
            }
         }
         return false;
      }
      
      private function §_-0pA§(param1:Array) : §_-4Ba§
      {
         var _loc3_:§_-2E0§ = null;
         var _loc4_:§_-Akc§ = null;
         var _loc5_:String = null;
         var _loc6_:§_-5d-§ = null;
         var _loc7_:String = null;
         var _loc8_:§_-6f3§ = null;
         var _loc2_:Array = [];
         if(param1.length == 0)
         {
            for each(_loc3_ in this._owner.house.roomList)
            {
               for each(_loc4_ in _loc3_.furnitureList)
               {
                  if(_loc4_.shopItem.isFileLoading)
                  {
                     _loc2_.push(_loc4_.shopItem);
                  }
               }
            }
         }
         else
         {
            for each(_loc5_ in param1)
            {
               _loc6_ = Context.§_-70S§.§_-0ZU§().findTypeById(_loc5_);
               if(_loc6_ is §_-6f3§ && (_loc6_ as §_-6f3§).isFileLoading)
               {
                  _loc2_.push(_loc6_);
               }
            }
         }
         if(§_-1s0§.instance.isTutorial())
         {
            _loc7_ = this.§_-B4Y§();
            _loc8_ = Context.§_-70S§.§_-0ZU§().findTypeById(_loc7_) as §_-6f3§;
            if(_loc8_ != null)
            {
               _loc2_.push(_loc8_);
            }
         }
         return §_-81z§(_loc2_);
      }
      
      override protected function processRoomConnectResult(param1:§_-4Ww§) : void
      {
         super.processRoomConnectResult(param1);
         this.§_-35l§ = param1.getString(§_-BSm§.§_-3Z1§);
         this.§_-6R1§();
         (currentScreen as §_-5ZD§).notifyOwnerAtHouse(this.§_-5AQ§);
      }
      
      private function §_-6R1§() : void
      {
         if(this._owner.id != Context.player.id)
         {
            if(!this.§_-31D§())
            {
               currentScreen = new §_-2H§(§_-6gl§,this.§_-5y6§,this.§_-35l§,this._owner);
            }
         }
         else if(Context.cityPlayer.isTutorial)
         {
            currentScreen = new §_-A2q§(§_-6gl§,this.§_-5y6§,this.§_-35l§,this._owner);
         }
         else if(!this.§_-3Ru§())
         {
            currentScreen = new §_-85Q§(§_-6gl§,this.§_-5y6§,this.§_-35l§,this._owner);
         }
      }
      
      private function §_-31D§() : Boolean
      {
         if(this.§_-5y6§ == AB26Module.§_-3Z1§)
         {
            currentScreen = new AB26FriendRoomScreen(§_-6gl§,this.§_-5y6§,this.§_-35l§,this._owner);
            return true;
         }
         return false;
      }
      
      private function §_-3Ru§() : Boolean
      {
         if(this.§_-5y6§ == HW25Module.§_-3Z1§)
         {
            currentScreen = new HW25RoomScreen(§_-6gl§,this.§_-5y6§,this.§_-35l§,this._owner);
            return true;
         }
         if(this.§_-5y6§ == NY26Module.§_-3Z1§)
         {
            currentScreen = new NY26RoomScreen(§_-6gl§,this.§_-5y6§,this.§_-35l§,this._owner);
            return true;
         }
         if(this.§_-5y6§ == AB26Module.§_-3Z1§)
         {
            currentScreen = new AB26RoomScreen(§_-6gl§,this.§_-5y6§,this.§_-35l§,this._owner);
            return true;
         }
         return false;
      }
      
      private function §_-4MV§(param1:§_-0N-§) : void
      {
         Context.§_-A3p§.removeEventListener(§_-0N-§.§_-9FN§,this.§_-4MV§);
         this.§_-9Zd§();
      }
      
      private function §_-6Fj§(param1:§_-9ai§) : void
      {
         this.§_-5AQ§ = param1.data.getBoolean(§_-6aI§.§_-9T8§);
         if(currentScreen is §_-5ZD§)
         {
            (currentScreen as §_-5ZD§).notifyOwnerAtHouse(this.§_-5AQ§);
         }
      }
      
      protected function §_-AXf§(param1:§_-9ai§) : void
      {
         var socialObject:Object = null;
         var event:§_-9ai§ = param1;
         §_-6gl§.commandDispatcher.removeEventListener(§_-8uS§.§_-0NY§,this.§_-AXf§);
         §_-6gl§.commandDispatcher.removeEventListener(§_-8uS§.§_-4Ec§,this.§_-AXf§);
         if(event.data.getBoolean(§_-XJ§.§_-3vz§,false))
         {
            §_-4OH§.§_-B5P§(Context.§_-5o8§.message("houseLockedForTutorialTitle"),Context.§_-5o8§.message("houseLockedForTutorialMessage"),function(param1:§_-2-c§):void
            {
               Context.§_-CLP§.visitByLocationInfo(Context.player.locationInfo,false);
            });
            return;
         }
         if(event.data.getBoolean(§_-XJ§.§_-AiR§,false))
         {
            §_-4OH§.§_-B5P§(Context.§_-5o8§.message("houseLockedTitle"),Context.§_-5o8§.message("houseLockedMessage"),function(param1:§_-2-c§):void
            {
               Context.§_-CLP§.visitCityHouse();
            });
            return;
         }
         if(event.data.getBoolean(§_-XJ§.§_-1lk§,false))
         {
            §_-4OH§.§_-B5P§(Context.§_-5o8§.message("houseKickedTitle"),Context.§_-5o8§.message("houseKickedMessage"),function(param1:§_-2-c§):void
            {
               Context.§_-CLP§.visitByLocationInfo(Context.player.locationInfo,false);
            });
            return;
         }
         if(event.data.has(§_-6aI§.§_-9T8§))
         {
            this.§_-5AQ§ = event.data.getBoolean(§_-6aI§.§_-9T8§);
         }
         this._owner = event.data.§_-2jV§(§_-6aI§.§_-6gj§,§_-48g§);
         if(event.data.has(§_-48g§.§_-8hM§))
         {
            this._owner.house.fromAGSObject(event.data.§_-ANw§(§_-48g§.§_-8hM§));
         }
         Context.§_-3B2§.addPlayer(this._owner);
         this.§_-2b0§ = event.data.has(§_-BSm§.§_-7Gn§) ? event.data.getMap(§_-BSm§.§_-7Gn§,Array) : null;
         this.switchRoom(this.§_-7yn§ == null ? §_-4Nn§.§_-AR1§ : this.§_-7yn§);
         if(Context.§_-2BT§.adapter is FacebookAdapter && Config.openGraph)
         {
            socialObject = {};
            socialObject[§_-CAc§.§_-5OW§] = §_-5I8§.replace(Config.socialGraph[§_-CAc§.§_-5OW§],{
               "uid":this.§_-5so§,
               "name":Context.player.avatarAppearance.name,
               "pname":this._owner.avatarAppearance.name,
               "action":"visit",
               "minutes":"0"
            });
            §_-6nA§.§_-4FB§(§_-9BV§.§_-BB8§,socialObject);
         }
         if(this.§_-6k1§ != null)
         {
            this.§_-6k1§();
            this.§_-6k1§ = null;
         }
      }
      
      private function §_-AqJ§(param1:§_-9ai§) : void
      {
         var info:§_-6E§;
         var event:§_-9ai§ = param1;
         if(§_-6gl§ != null)
         {
            §_-6gl§.commandDispatcher.removeEventListener(§_-8uS§.§_-6Ts§,this.§_-AqJ§);
         }
         info = new §_-6E§();
         info.fromAGSObject(event.data);
         if(!info.§_-5gv§)
         {
            if(info.§_-3GI§)
            {
               §_-4OH§.confirm(Context.§_-5o8§.message("warning"),Context.§_-5o8§.message("unauthorizedProgressDescription",{
                  "avatarLevel":info.§_-cr§.avatarLevel,
                  "avatarName":info.§_-cr§.avatarName
               }),function(param1:§_-2-c§):void
               {
                  var _loc2_:§_-4Ww§ = null;
                  if(param1.§_-B66§.modalResult == §_-0jI§.§_-9qy§)
                  {
                     §_-6gl§.commandDispatcher.addEventListener(§_-8uS§.§_-6R4§,onUnauthorizedProgressUsed);
                     _loc2_ = new §_-4Ww§();
                     _loc2_.put(§_-3mj§.§_-50i§,Context.§_-2BT§.adapter.unauthorizedSocialId);
                     §_-6gl§.sendExtMessage(§_-8uS§.§_-6R4§,_loc2_);
                  }
                  else
                  {
                     goToCreateAvatarScreen();
                  }
               });
            }
            else
            {
               this.goToCreateAvatarScreen();
            }
         }
         else
         {
            if(info.§_-65x§)
            {
               this.§_-7ti§(info);
               this.§_-4XO§();
            }
            if(this.§_-9Zl§)
            {
               if(!info.§_-65x§)
               {
                  §_-5hc§.§_-A5e§();
               }
               this._owner = Context.cityPlayer;
               if(this.§_-5cJ§())
               {
                  return;
               }
               this.switchRoom(this.§_-7yn§ == null ? §_-4Nn§.§_-AR1§ : this.§_-7yn§);
            }
            else
            {
               this.loadOwnerInfo();
            }
         }
      }
      
      private function §_-472§(param1:Boolean) : void
      {
      }
      
      private function §_-3gM§(param1:§_-1m0§) : void
      {
         var event:§_-1m0§ = param1;
         Application.instance.removeEventListener(§_-1m0§.§_-9FD§,this.§_-3gM§);
         if(currentScreen is §_-A6w§ && !(currentScreen as §_-A6w§).§_-8ZH§)
         {
            (currentScreen as §_-A6w§).addEventListener(§_-CRy§.§_-Sf§,function(param1:§_-CRy§):void
            {
               loadMyInfo();
            });
         }
         else
         {
            this.loadMyInfo();
         }
      }
      
      private function onUnauthorizedProgressUsed(param1:§_-9ai§) : void
      {
         var event:§_-9ai§ = param1;
         if(§_-6gl§ != null)
         {
            §_-6gl§.commandDispatcher.removeEventListener(§_-8uS§.§_-6R4§,this.onUnauthorizedProgressUsed);
         }
         if(§_-6gl§.connected)
         {
            §_-6gl§.addEventListener(§_-6Qj§.§_-Bnp§,function(param1:§_-6Qj§):void
            {
               Context.§_-CLP§.visitCityHouse();
            });
            §_-6gl§.disconnect();
         }
         Context.§_-CLP§.visitCityHouse();
      }
      
      private function §_-9XM§(param1:§_-9ai§) : void
      {
         var _loc2_:Object = null;
         §_-6gl§.commandDispatcher.removeEventListener(§_-8uS§.§_-9hG§,this.§_-9XM§);
         Context.player.resources.fromAGSObject(param1.data.§_-ANw§(§_-5ab§.§_-0T5§));
         Application.instance.dispatchEvent(new §_-1m0§(§_-1m0§.§_-2dd§));
         if(this.§_-9Zl§)
         {
            this._owner.house.lockTime = Context.cityPlayer.house.lockTime;
            new §_-9H0§(this.owner,(Context.§_-3hG§.currentScreen as §_-5ZD§).clientRoomId).showModal();
         }
         if(Context.§_-2BT§.adapter is FacebookAdapter && Config.openGraph)
         {
            _loc2_ = {};
            _loc2_[§_-CAc§.§_-5OW§] = §_-5I8§.replace(Config.socialGraph[§_-CAc§.§_-5OW§],{
               "uid":this.§_-5so§,
               "name":Context.player.avatarAppearance.name,
               "pname":this._owner.avatarAppearance.name,
               "action":"lock"
            });
            §_-6nA§.§_-4FB§(§_-9BV§.§_-AHZ§,_loc2_);
         }
      }
      
      private function §_-8zl§(param1:§_-1m0§) : void
      {
         var _loc2_:§_-2E0§ = param1.object as §_-2E0§;
         if(_loc2_ != null)
         {
            this.owner.house.addRoom(_loc2_);
         }
      }
      
      private function §_-1ou§(param1:§_-1m0§) : void
      {
         var _loc2_:§_-2E0§ = param1.object as §_-2E0§;
         if(_loc2_ != null)
         {
            this.owner.house.getRoom(_loc2_.id).name = _loc2_.name;
         }
      }
      
      public function get ownerId() : String
      {
         return this.§_-5so§;
      }
      
      public function get owner() : §_-48g§
      {
         return this._owner;
      }
      
      public function get §_-69T§() : Boolean
      {
         return this.§_-5AQ§;
      }
      
      protected function get §_-2UP§() : Boolean
      {
         return §_-7tX§.§_-9Z9§;
      }
      
      private function get §_-55n§() : §_-4Ww§
      {
         var _loc1_:§_-4Ww§ = new §_-4Ww§();
         Context.instance.§_-55n§.toAGSObject(_loc1_);
         return _loc1_;
      }
      
      override public function get zoneId() : String
      {
         return §_-Ej§;
      }
      
      override public function get locationId() : String
      {
         return §_-7tX§.§_-BHJ§;
      }
      
      override public function destroy() : void
      {
         if(destroyed)
         {
            return;
         }
         this.switchRoom(null);
         if(§_-6gl§ != null)
         {
            §_-6gl§.commandDispatcher.removeEventListener(§_-8uS§.§_-9eL§,this.§_-6Fj§);
            §_-6gl§.commandDispatcher.removeEventListener(§_-8uS§.§_-4Ec§,this.§_-AXf§);
            §_-6gl§.commandDispatcher.removeEventListener(§_-8uS§.§_-0NY§,this.§_-BQS§);
         }
         Application.instance.removeEventListener(§_-1m0§.§_-BgA§,this.§_-8zl§);
         Application.instance.removeEventListener(§_-1m0§.§_-BXo§,this.§_-1ou§);
         Application.instance.removeEventListener(§_-1m0§.§_-0qm§,this.§_-B6Y§);
         super.destroy();
      }
   }
}

