package penzville
{
   import §_-02i§.§_-3b-§;
   import §_-0O4§.§_-4uD§;
   import §_-0Uz§.§_-m3§;
   import §_-0uA§.§_-3YE§;
   import §_-18o§.§_-9qP§;
   import §_-1iV§.§_-BkM§;
   import §_-1ks§.§_-3Ya§;
   import §_-1ks§.§_-Eb§;
   import §_-1ks§.§_-VC§;
   import §_-1t9§.§_-4Wb§;
   import §_-2qd§.§_-6Qj§;
   import §_-39l§.§_-5t6§;
   import §_-3Fh§.§_-Cj§;
   import §_-3TY§.§_-58T§;
   import §_-45g§.§_-B97§;
   import §_-4Q1§.§_-4v6§;
   import §_-4Q1§.§_-5Ia§;
   import §_-5Es§.§_-8vz§;
   import §_-5JJ§.§_-15C§;
   import §_-5Lc§.§_-8Bn§;
   import §_-5pM§.§_-1cq§;
   import §_-6IV§.§_-6mj§;
   import §_-6IV§.§_-8ac§;
   import §_-6JL§.§_-B9P§;
   import §_-8I6§.§_-004§;
   import §_-8I6§.§_-0sT§;
   import §_-8tP§.§_-3bu§;
   import §_-A2M§.§_-4Ba§;
   import §_-AKx§.§_-0jI§;
   import §_-AKx§.§_-2-c§;
   import §_-AKx§.§_-4OH§;
   import §_-AMb§.§_-1i1§;
   import §_-AaA§.§_-7AJ§;
   import §_-AaA§.§_-Bg7§;
   import §_-Av5§.§_-Qd§;
   import §_-Azn§.§_-1LL§;
   import §_-CKK§.§_-a2§;
   import §_-GM§.Context;
   import §_-GM§.§_-7VH§;
   import §_-MZ§.§_-12j§;
   import §_-MZ§.§_-7zb§;
   import §_-ny§.§_-69X§;
   import §_-uR§.§_-53f§;
   import ags.§_-5x-§;
   import flash.display.Stage;
   import flash.display.StageDisplayState;
   import flash.display.StageScaleMode;
   import flash.events.Event;
   import flash.events.FullScreenEvent;
   import flash.events.KeyboardEvent;
   import flash.net.URLRequest;
   import flash.net.navigateToURL;
   import flash.text.TextField;
   import flash.ui.Keyboard;
   
   public class §_-7tX§ extends §_-53f§
   {
      public static const §_-BHJ§:String = "house";
      
      public static const §_-32l§:String = "outside";
      
      public static const §_-3wQ§:String = "work";
      
      public static const §_-5ii§:String = "clan";
      
      public static const §_-5Tg§:String = "school";
      
      public static const §_-8OX§:String = "schoolYandex";
      
      private static const §_-4P1§:String = "farm";
      
      private static const §_-6XF§:String = "beach";
      
      public static const §_-6x6§:String = "clothesShop";
      
      public static const §_-3Jf§:String = "furnitureShop";
      
      public static var §_-9Z9§:Boolean = false;
      
      public static var §_-Bsw§:Boolean = false;
      
      public static var §_-AqA§:String = null;
      
      public static var §_-4tu§:int = 0;
      
      private var §_-6gl§:§_-5x-§ = null;
      
      private var §_-55V§:Array = [];
      
      private var §_-0gj§:§_-Cj§ = null;
      
      public function §_-7tX§()
      {
         super();
         var _loc1_:Stage = §_-BkM§.getStage();
         _loc1_.addEventListener(FullScreenEvent.FULL_SCREEN,this.§_-C6G§);
         _loc1_.addEventListener(Event.RESIZE,this.onResize);
         _loc1_.stageFocusRect = false;
         _loc1_.addEventListener(KeyboardEvent.KEY_DOWN,this.§_-aQ§);
      }
      
      public static function §_-53l§(param1:String, param2:String, param3:Function = null) : void
      {
         var title:String = param1;
         var message:String = param2;
         var callback:Function = param3;
         §_-4OH§.confirm(title,message,function(param1:§_-2-c§):void
         {
            var evt:§_-2-c§ = param1;
            if(evt.§_-B66§.modalResult == §_-0jI§.§_-9qy§)
            {
               Context.§_-06H§.§_-74§(Context.cityPlayer.id,function(param1:§_-2-c§):void
               {
                  if(callback != null)
                  {
                     callback();
                  }
               });
            }
         });
      }
      
      public function §_-1az§(param1:String, param2:int, param3:Boolean = false) : void
      {
         var userId:String = param1;
         var socialNetworkId:int = param2;
         var isSocial:Boolean = param3;
         §_-9Z9§ = true;
         §_-Bsw§ = isSocial;
         §_-AqA§ = userId;
         §_-4tu§ = socialNetworkId;
         if(this.§_-6gl§.connected)
         {
            this.§_-6gl§.addEventListener(§_-6Qj§.§_-Bnp§,function(param1:§_-6Qj§):void
            {
               removeNetClient();
            });
            this.§_-6gl§.disconnect();
         }
         Context.§_-3hG§ = new §_-3bu§(isSocial ? null : userId);
      }
      
      public function §_-2Tn§(param1:String, param2:int, param3:Boolean = false) : void
      {
         var userId:String = param1;
         var socialNetworkId:int = param2;
         var isSocial:Boolean = param3;
         §_-9Z9§ = true;
         §_-Bsw§ = isSocial;
         §_-AqA§ = userId;
         §_-4tu§ = socialNetworkId;
         if(this.§_-6gl§.connected)
         {
            this.§_-6gl§.addEventListener(§_-6Qj§.§_-Bnp§,function(param1:§_-6Qj§):void
            {
               removeNetClient();
            });
            this.§_-6gl§.disconnect();
         }
         Context.§_-3hG§ = new §_-0sT§(isSocial ? null : userId,null);
      }
      
      public function visitCityHouse(param1:String = null, param2:String = null) : §_-4Ba§
      {
         return this.§_-6RQ§(§_-BHJ§,param1,param2);
      }
      
      public function §_-7hL§(param1:String = null, param2:String = null) : void
      {
         var _loc3_:Object = null;
         if(Config.§_-37U§ != Config.§_-20b§ && !Config.disableExternalLinks)
         {
            _loc3_ = §_-58T§.§_-6oG§(Config.§_-20b§);
            navigateToURL(new URLRequest(_loc3_["url"]),"_top");
            return;
         }
         Context.§_-3hG§ = new §_-004§(param1,param2);
      }
      
      public function §_-4gK§(param1:String, param2:String, param3:String = null, param4:String = null) : §_-4Ba§
      {
         if(!Config.§_-6pE§(param1,Context.player.userInfo.socialId))
         {
            return §_-4Ba§.reject();
         }
         return this.§_-6RQ§(param1,param2,param3,param4);
      }
      
      public function §_-CBJ§(param1:int, param2:String = null) : void
      {
         if(§_-5t6§.instance.§_-0Ld§(param1,Context.cityPlayer.id))
         {
            §_-4OH§.§_-B5P§(Context.§_-5o8§.message("warning"),Context.§_-5o8§.message("bannedClanDescriptionInline"));
            return;
         }
         var _loc3_:String = Context.§_-Bd7§.§_-00V§(§_-8Bn§.§_-5F-§).§_-6bS§;
         if(Context.player.§_-3yo§(_loc3_))
         {
            Application.instance.dispatchEvent(new §_-B97§(§_-B97§.§_-6Z2§));
            Context.§_-3hG§ = new §_-1i1§(String(param1),param2,null);
         }
         else
         {
            §_-69X§.§_-2z8§(_loc3_,true);
         }
      }
      
      public function gotoWork(param1:String) : §_-4Ba§
      {
         var workId:String = param1;
         return this.§_-CHx§(workId).then(function():void
         {
            Context.§_-3hG§ = new §_-8ac§(workId);
         });
      }
      
      public function §_-CHx§(param1:String) : §_-4Ba§
      {
         var task:§_-4Ba§ = null;
         var workId:String = param1;
         task = new §_-4Ba§();
         if(workId != §_-6mj§.§_-7G5§)
         {
            task.resolve();
         }
         else if(!Context.player.§_-3yo§(§_-69X§.§_-3IG§))
         {
            §_-69X§.§_-2z8§(§_-69X§.§_-3IG§);
            task.reject();
         }
         else if(!Context.cityPlayer.§_-BjJ§.§_-86Q§)
         {
            new §_-1cq§().showModal(function(param1:§_-2-c§):void
            {
               var _loc2_:String = null;
               if(param1.§_-B66§.modalResult == §_-0jI§.§_-9qy§)
               {
                  task.resolve();
               }
               else
               {
                  _loc2_ = §_-9qP§.§_-1XF§(§_-9qP§.§_-BdQ§,§_-9qP§.§_-95C§);
                  §_-9qP§.§_-9uJ§(_loc2_);
                  task.reject();
               }
            });
         }
         else
         {
            task.resolve();
         }
         return task;
      }
      
      private function §_-6RQ§(param1:String, param2:String, param3:String = null, param4:String = null) : §_-4Ba§
      {
         var _loc7_:Object = null;
         if(Config.§_-37U§ != Config.§_-20b§ && !Config.disableExternalLinks)
         {
            _loc7_ = §_-58T§.§_-6oG§(Config.§_-20b§);
            navigateToURL(new URLRequest(_loc7_["url"]),"_top");
            return §_-4Ba§.reject(false);
         }
         if(param1 == §_-BHJ§ || param1 == "")
         {
            Context.§_-3hG§ = new §_-0sT§(param2,param3);
            return Context.§_-3hG§.§_-CRa§;
         }
         var _loc5_:§_-7zb§ = Context.§_-BFW§.§_-4Bq§(param1);
         if(_loc5_ == null)
         {
            return §_-4Ba§.reject();
         }
         var _loc6_:§_-12j§ = _loc5_.getRoom(param2);
         if(_loc6_.isVip && !Context.§_-BFW§.§_-Bo8§())
         {
            §_-53l§(Context.§_-5o8§.message("vipRoomTitle"),Context.§_-5o8§.message("vipRoomForbiddenMessage"));
            return §_-4Ba§.reject(false);
         }
         if(!Context.§_-BFW§.§_-uY§(param1) && _loc6_.minLevel > 0 && !Context.§_-BFW§.§_-9XJ§(_loc6_.minLevel))
         {
            Context.§_-BFW§.§_-0Y2§(_loc6_.minLevel);
            return §_-4Ba§.reject(false);
         }
         if(Context.player.§_-3yo§(_loc6_.§_-6bS§))
         {
            if(this.§_-0Nh§(param1,_loc6_.roomId,param3) && Context.player.loaded)
            {
               if(Context.§_-3hG§ != null && Context.§_-3hG§.currentScreen is §_-1LL§ && !this.§_-3sm§(param4))
               {
                  return (Context.§_-3hG§.currentScreen as §_-1LL§).§_-2bA§(param4);
               }
               return §_-4Ba§.resolve();
            }
            Context.§_-3hG§ = new §_-4v6§(param1,param2,param3,param4);
            return Context.§_-3hG§.§_-CRa§;
         }
         §_-69X§.§_-2z8§(_loc6_.§_-6bS§,true);
         return §_-4Ba§.reject(false);
      }
      
      public function playGame(param1:String) : void
      {
         var _loc2_:Object = null;
         switch(param1)
         {
            case §_-4P1§:
               if(Config.§_-37U§ != Config.§_-1do§ && !Config.disableExternalLinks)
               {
                  _loc2_ = §_-58T§.§_-6oG§(Config.§_-1do§);
                  navigateToURL(new URLRequest(_loc2_["url"]),"_top");
               }
               else
               {
                  this.visitIslandLocation(§_-4P1§);
               }
         }
      }
      
      public function §_-1G1§(param1:String) : void
      {
         this.visitIslandLocation(§_-4P1§,param1);
      }
      
      public function visitIslandLocation(param1:String = null, param2:String = null, param3:String = null) : §_-4Ba§
      {
         var _loc4_:Object = null;
         if(Config.§_-37U§ != Config.§_-1do§ && !Config.disableExternalLinks)
         {
            _loc4_ = §_-58T§.§_-6oG§(Config.§_-1do§);
            navigateToURL(new URLRequest(_loc4_["url"]),"_top");
         }
         else
         {
            if(param1 == null)
            {
               param1 = §_-4P1§;
            }
            if(param1 == §_-4P1§)
            {
               if(Context.§_-3hG§ is §_-3bu§)
               {
                  if((Context.§_-3hG§ as §_-3bu§).ownerId != param2)
                  {
                     (Context.§_-3hG§ as §_-3bu§).§_-5yX§(param2);
                  }
               }
               else
               {
                  Context.§_-3hG§ = new §_-3bu§(param2);
               }
            }
            else
            {
               Context.§_-3hG§ = new §_-4uD§(param1,param2,param3);
            }
         }
         return §_-4Ba§.resolve();
      }
      
      public function §_-AF2§() : void
      {
         this.playGame(§_-4P1§);
      }
      
      public function §_-CHX§(param1:String = "", param2:String = "") : void
      {
         var title:String = param1;
         var message:String = param2;
         Context.§_-3hG§ = null;
         §_-Bg7§.instance.hideAll();
         Application.instance.currentScreen = new §_-3Ya§();
         this.§_-CCZ§(false);
         if(this.§_-6gl§.connected)
         {
            this.§_-6gl§.addEventListener(§_-6Qj§.§_-Bnp§,function(param1:§_-6Qj§):void
            {
               removeNetClient();
            });
            this.§_-6gl§.disconnect();
         }
         title = title == "" ? Context.§_-5o8§.message("lagReconnectTitle") : title;
         message = message == "" ? Context.§_-5o8§.message("lagReconnectMessage") : message;
         §_-4OH§.§_-B5P§(title,message,function(param1:§_-2-c§):void
         {
            var event:§_-2-c§ = param1;
            var locationInfo:§_-Qd§ = Context.player.locationInfo;
            Context.player.loaded = false;
            if(locationInfo != null)
            {
               Application.instance.currentScreen = null;
               Context.player.locationInfo = null;
               visitByLocationInfo(locationInfo,false).then(function():void
               {
                  Context.player.loaded = true;
               }).error(function():void
               {
                  §_-9qP§.gotoHome();
               });
            }
         });
      }
      
      public function §_-5bw§(param1:§_-4Wb§) : void
      {
         var userProfile:§_-4Wb§ = param1;
         if(userProfile == null)
         {
            return;
         }
         try
         {
            Context.§_-2BT§.navigateToUser(userProfile);
         }
         catch(e:Error)
         {
            §_-3YE§.info("I`ve tryed to visit user with id " + userProfile.id + " page. And this makes error. Your`s GameManager.");
         }
      }
      
      public function visitByLocationInfo(param1:§_-Qd§, param2:Boolean) : §_-4Ba§
      {
         var task:§_-4Ba§ = null;
         var confirmTask:§_-4Ba§ = null;
         var locationInfo:§_-Qd§ = param1;
         var confirm:Boolean = param2;
         task = new §_-4Ba§();
         switch(locationInfo.zone)
         {
            case §_-7tX§.§_-BHJ§:
               if(confirm && Config.§_-37U§ != Config.§_-20b§)
               {
                  §_-4OH§.confirm(Context.§_-5o8§.message("followFriendCityTitle"),Context.§_-5o8§.message("followFriendCityMessage"),function(param1:§_-2-c§):void
                  {
                     if(param1.§_-B66§.modalResult == §_-0jI§.§_-9qy§)
                     {
                        visitCityHouse(locationInfo.group,locationInfo.room).next(task);
                     }
                  });
                  break;
               }
               return this.visitCityHouse(locationInfo.group,locationInfo.room);
               break;
            case §_-7tX§.§_-3wQ§:
               if(!this.§_-0Nh§(locationInfo.zone,locationInfo.group,locationInfo.room,locationInfo.actionTag))
               {
                  confirmTask = confirm ? §_-4OH§.confirmTask(Context.§_-5o8§.message("followFriendWorkTitle"),Context.§_-5o8§.message("followFriendWorkMessage")) : §_-4Ba§.resolve();
                  return §_-4Ba§.sequence([confirmTask,function():§_-4Ba§
                  {
                     return gotoWork(locationInfo.group);
                  }]);
               }
               return this.gotoWork(locationInfo.group);
               break;
            case §_-7tX§.§_-4P1§:
            case §_-7tX§.§_-6XF§:
               if(confirm && Config.§_-37U§ != Config.§_-1do§)
               {
                  §_-4OH§.confirm(Context.§_-5o8§.message("followFriendIslandTitle"),Context.§_-5o8§.message("followFriendIslandMessage"),function(param1:§_-2-c§):void
                  {
                     if(param1.§_-B66§.modalResult == §_-0jI§.§_-9qy§)
                     {
                        visitIslandLocation(locationInfo.zone,locationInfo.group,locationInfo.room).next(task);
                     }
                  });
                  break;
               }
               return this.visitIslandLocation(locationInfo.zone,locationInfo.group,locationInfo.room);
               break;
            case §_-5Ia§.§_-8vl§:
               return this.§_-9vC§(locationInfo,confirm);
            case §_-5Ia§.§_-C12§:
               if(!this.§_-0Nh§(locationInfo.zone,locationInfo.group,locationInfo.room,locationInfo.actionTag))
               {
                  §_-4OH§.confirm(Context.§_-5o8§.message("podiumTitle"),Context.§_-5o8§.message("podiumFollowFriendMessage"),function(param1:§_-2-c§):void
                  {
                     if(param1.§_-B66§.modalResult == §_-0jI§.§_-9qy§)
                     {
                        Context.§_-9wO§.§_-3XC§(locationInfo).next(task);
                     }
                  });
                  break;
               }
               return this.visitCityHouse();
               break;
            case §_-7tX§.§_-5ii§:
               if(!this.§_-0Nh§(locationInfo.zone,locationInfo.group,locationInfo.room,locationInfo.actionTag))
               {
                  return this.visitCityHouse();
               }
               Context.§_-3hG§ = new §_-1i1§(locationInfo.group,locationInfo.room,null);
               task.resolve();
            default:
               if(!this.§_-0Nh§(locationInfo.zone,locationInfo.group,locationInfo.room) || !Context.player.loaded)
               {
                  return this.§_-4gK§(locationInfo.zone,locationInfo.group,locationInfo.room,locationInfo.layerId);
               }
               break;
         }
         return task;
      }
      
      public function §_-9vC§(param1:§_-Qd§, param2:Boolean, param3:int = 0) : §_-4Ba§
      {
         var confirmTask:§_-4Ba§;
         var locationInfo:§_-Qd§ = param1;
         var confirm:Boolean = param2;
         var carId:int = param3;
         if(this.§_-0Nh§(locationInfo.zone,locationInfo.group,locationInfo.room,locationInfo.layerId))
         {
            return §_-4Ba§.reject();
         }
         confirmTask = !confirm ? §_-4Ba§.resolve() : §_-4OH§.confirmTask(Context.§_-5o8§.message("followFriendCanyonTitle"),Context.§_-5o8§.message("followFriendCanyonMessage"));
         return §_-4Ba§.sequence([confirmTask,function():§_-4Ba§
         {
            if(!Context.§_-9wO§.netClient.connected)
            {
               return §_-9qP§.gotoHome();
            }
            return §_-4Ba§.resolve();
         },function():void
         {
            Context.§_-9wO§.§_-Bpv§(locationInfo.group,carId,null,locationInfo.layerId,locationInfo.room);
         }]);
      }
      
      public function §_-0Nh§(param1:String, param2:String, param3:String, param4:String = null) : Boolean
      {
         if(param3 != null && param3.indexOf("tut") >= 0)
         {
            return false;
         }
         var _loc5_:§_-Qd§ = Context.player.locationInfo;
         if(param1 == §_-5Ia§.§_-8vl§ && param4 != null)
         {
            if(param3 == null)
            {
               return _loc5_.zone == param1 && _loc5_.group == param2;
            }
            return _loc5_.zone == param1 && _loc5_.group == param2 && _loc5_.room == param3;
         }
         if(param1 == §_-7tX§.§_-3wQ§)
         {
            return _loc5_.group == param2 && _loc5_.room == param3;
         }
         if(param3 != null)
         {
            return _loc5_.room == param3;
         }
         return _loc5_.zone == param1 && _loc5_.group == param2;
      }
      
      public function §_-3sm§(param1:String) : Boolean
      {
         if(param1 != null && Context.§_-3hG§.currentScreen is §_-1LL§)
         {
            return (Context.§_-3hG§.currentScreen as §_-1LL§).§_-7s4§ == param1;
         }
         return true;
      }
      
      public function §_-0KB§() : Boolean
      {
         if(§_-BkM§.getStage().displayState == StageDisplayState.NORMAL)
         {
            §_-BkM§.getStage().displayState = Config.§_-0WN§ ? StageDisplayState.FULL_SCREEN_INTERACTIVE : StageDisplayState.FULL_SCREEN;
         }
         else
         {
            §_-BkM§.getStage().displayState = StageDisplayState.NORMAL;
         }
         return this.§_-8vQ§;
      }
      
      public function get §_-8vQ§() : Boolean
      {
         return §_-BkM§.getStage().displayState == StageDisplayState.FULL_SCREEN || §_-BkM§.getStage().displayState == StageDisplayState.FULL_SCREEN_INTERACTIVE;
      }
      
      private function §_-C6G§(param1:FullScreenEvent) : void
      {
         if(param1.fullScreen)
         {
            Config.§_-50z§ = §_-BkM§.getStage().fullScreenWidth / Config.§_-C6c§;
            Config.§_-6Z0§ = §_-BkM§.getStage().fullScreenHeight / Config.§_-C6c§;
         }
         else
         {
            Config.§_-50z§ = Config.§_-26H§ / Config.§_-C6c§;
            Config.§_-6Z0§ = Config.§_-8Gx§ / Config.§_-C6c§;
         }
         Config.§_-0nZ§ = param1.fullScreen;
         dispatchEvent(new §_-B9P§(§_-B9P§.RESIZE,Config.§_-0nZ§));
      }
      
      private function onResize(param1:Event) : void
      {
         Config.§_-ApK§ = Config.§_-50z§ = §_-BkM§.getStage().stageWidth / Config.§_-C6c§;
         Config.§_-AoU§ = Config.§_-6Z0§ = §_-BkM§.getStage().stageHeight / Config.§_-C6c§;
         dispatchEvent(new §_-B9P§(§_-B9P§.RESIZE,Config.§_-0nZ§));
      }
      
      private function §_-aQ§(param1:KeyboardEvent) : void
      {
         var _loc2_:§_-7AJ§ = null;
         var _loc3_:Stage = null;
         var _loc4_:§_-Eb§ = null;
         if(param1.keyCode == Keyboard.F2)
         {
            this.onResize(param1);
         }
         if(param1.keyCode == Keyboard.F3)
         {
            _loc3_ = §_-BkM§.getStage();
            if(_loc3_.scaleMode == StageScaleMode.NO_SCALE)
            {
               _loc3_.scaleMode = StageScaleMode.SHOW_ALL;
               this.onResize(param1);
            }
            else
            {
               _loc3_.scaleMode = StageScaleMode.NO_SCALE;
               this.onResize(param1);
            }
         }
         if(param1.keyCode == Keyboard.F4)
         {
            if(Context.§_-3hG§ != null)
            {
               _loc4_ = Context.§_-3hG§.currentScreen as §_-Eb§;
               if(_loc4_ != null && _loc4_.§_-6g8§ != null && _loc4_.§_-6g8§.uiLayer != null)
               {
                  _loc4_.§_-6g8§.uiLayer.visible = !_loc4_.§_-6g8§.uiLayer.visible;
               }
            }
         }
         if(param1.keyCode == Keyboard.F6)
         {
            Config.§_-C6c§ -= 0.05;
            if(Config.§_-C6c§ <= 0.05)
            {
               Config.§_-C6c§ = 0.05;
            }
            _loc2_ = this.uiLayout;
            _loc2_.scaleX = Config.§_-C6c§;
            _loc2_.scaleY = Config.§_-C6c§;
            this.onResize(param1);
         }
         if(param1.keyCode == Keyboard.F7)
         {
            Config.§_-C6c§ += 0.05;
            _loc2_ = this.uiLayout;
            _loc2_.scaleX = Config.§_-C6c§;
            _loc2_.scaleY = Config.§_-C6c§;
            this.onResize(param1);
         }
         if(param1.keyCode == Keyboard.F8)
         {
            Config.§_-C6c§ = 1;
            _loc2_ = this.uiLayout;
            _loc2_.scaleX = Config.§_-C6c§;
            _loc2_.scaleY = Config.§_-C6c§;
            this.onResize(param1);
         }
         if(param1.keyCode == Keyboard.F9)
         {
            if(this.§_-0gj§ == null)
            {
               this.§_-0gj§ = new §_-Cj§();
               _loc2_ = this.uiLayout;
               _loc2_.addChild(this.§_-0gj§);
            }
            else
            {
               this.§_-0gj§.destroy();
               this.§_-0gj§ = null;
            }
         }
         if(param1.ctrlKey && param1.keyCode == Keyboard.P && Config.§_-37U§ == Config.§_-20b§)
         {
            if(§_-BkM§.getStage().focus is TextField)
            {
               return;
            }
            this.§_-BRx§();
         }
      }
      
      private function §_-BRx§() : void
      {
         var stage:Stage = null;
         var open:Function = null;
         stage = §_-BkM§.getStage();
         open = function(param1:Event):void
         {
            stage.removeEventListener(Event.ENTER_FRAME,open);
            new §_-3b-§().showModal();
         };
         stage.addEventListener(Event.ENTER_FRAME,open);
      }
      
      public function §_-0u1§(param1:Function, param2:String = null, param3:int = 0, param4:String = null) : void
      {
         var disconnectFunction:Function = null;
         var logoutFunction:Function = null;
         var callback:Function = param1;
         var host:String = param2;
         var port:int = param3;
         var zoneId:String = param4;
         if(Application.instance.status == Application.§_-APR§)
         {
            callback(null);
            return;
         }
         if(this.§_-6gl§ == null)
         {
            this.§_-6gl§ = this.createNetClient(host,port);
            callback(this.§_-6gl§);
            return;
         }
         if(this.§_-6gl§.host == host && this.§_-6gl§.port == port && this.§_-6gl§.connected)
         {
            if(this.§_-6gl§.zone != zoneId)
            {
               logoutFunction = function(param1:§_-6Qj§):void
               {
                  §_-6gl§.removeEventListener(§_-6Qj§.§_-84d§,logoutFunction);
                  callback(§_-6gl§);
               };
               this.§_-6gl§.addEventListener(§_-6Qj§.§_-84d§,logoutFunction);
               this.§_-6gl§.logout();
            }
            else
            {
               callback(this.§_-6gl§);
            }
            return;
         }
         if(!this.§_-6gl§.connected)
         {
            this.removeNetClient();
            this.§_-6gl§ = this.createNetClient(host,port);
            callback(this.§_-6gl§);
            return;
         }
         disconnectFunction = function(param1:§_-6Qj§):void
         {
            §_-6gl§.removeEventListener(§_-6Qj§.§_-Bnp§,disconnectFunction);
            removeNetClient();
            §_-6gl§ = createNetClient(host,port);
            callback(§_-6gl§);
         };
         this.§_-6gl§.addEventListener(§_-6Qj§.§_-Bnp§,disconnectFunction);
         this.§_-6gl§.disconnect();
      }
      
      public function §_-21N§() : void
      {
         §_-Bg7§.instance.hideAll();
         this.§_-CCZ§();
         Application.instance.status = Application.§_-APR§;
         if(this.§_-6gl§ != null && this.§_-6gl§.connected)
         {
            this.§_-6gl§.disconnect();
         }
      }
      
      private function §_-CCZ§(param1:Boolean = true) : void
      {
         if(Config.§_-37U§ == Config.§_-20b§)
         {
            Application.instance.currentScreen = new §_-VC§();
            §_-7VH§.instance.§_-9bL§.showPreloader();
         }
         else if(param1)
         {
            Application.instance.currentScreen = new §_-15C§();
         }
      }
      
      public function §_-2ys§(param1:§_-m3§) : void
      {
         this.§_-55V§.push(param1);
      }
      
      public function §_-3Qg§(param1:§_-m3§) : void
      {
      }
      
      private function createNetClient(param1:String, param2:int) : §_-5x-§
      {
         var _loc4_:§_-m3§ = null;
         var _loc3_:§_-5x-§ = new §_-5x-§(param1,param2,Config.§_-CXX§);
         §_-a2§.§_-1z6§(_loc3_);
         if(Config.production)
         {
         }
         for each(_loc4_ in this.§_-55V§)
         {
            _loc4_.netClient = _loc3_;
         }
         return _loc3_;
      }
      
      private function removeNetClient() : void
      {
         var _loc1_:§_-m3§ = null;
         for each(_loc1_ in this.§_-55V§)
         {
            _loc1_.netClient = null;
         }
         this.§_-6gl§.destroy();
         this.§_-6gl§ = null;
      }
      
      private function get uiLayout() : §_-7AJ§
      {
         if(Config.§_-37U§ == Config.§_-20b§)
         {
            return §_-7VH§.instance.uiLayout;
         }
         return §_-8vz§.instance.uiLayout;
      }
   }
}

