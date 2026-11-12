package §_-88H§
{
   import §_-0Iu§.§_-4DK§;
   import §_-0uA§.§_-3YE§;
   import §_-1t9§.§_-4Wb§;
   import §_-2XO§.§_-70h§;
   import §_-6BB§.§_-1KD§;
   import §_-6BB§.§_-8BS§;
   import §_-7Hk§.§_-1U4§;
   import §_-7Wy§.§_-5iT§;
   import §_-Aq0§.§_-4n-§;
   import §_-Aq0§.§_-9db§;
   
   public class §_-1Oc§ extends §_-1U4§
   {
      private var _usersCache:Array = [];
      
      private var _friendsCache:Array = [];
      
      private var _appFriendsCache:Array = [];
      
      private var _testUsersCache:Array = [];
      
      public function §_-1Oc§()
      {
         super();
      }
      
      override public function get socialNetwork() : String
      {
         return §_-8BS§.§_-1sr§;
      }
      
      override protected function callMethod(param1:String, param2:Object, param3:Function, param4:Function) : void
      {
         if(§_-4r3§ == null || §_-4r3§ == "")
         {
            §_-3YE§.error("API URL is not set for stage adapter");
            param4(new §_-1KD§(§_-1KD§.NETWORK_ERROR,0,"API URL is not set"));
            return;
         }
         param2["method"] = param1;
         sendRequest(param2,param3,param4);
         §_-3YE§.info("StageAdapter - call " + param1 + ": " + §_-4r3§ + " with params: " + JSON.stringify(param2));
      }
      
      override protected function getTestUsers(param1:Function, param2:Function) : void
      {
         var successCallback:Function = param1;
         var errorCallback:Function = param2;
         this.callMethod("getTestUsers",{},function(param1:§_-9db§):void
         {
            var _loc2_:Object = param1.§_-6Oe§();
            _testUsersCache = _loc2_["users"];
            successCallback(_loc2_["users"]);
         },function(param1:§_-4n-§):void
         {
            errorCallback(new §_-1KD§(§_-1KD§.NETWORK_ERROR,param1.errorCode,param1.§_-5-l§));
         });
      }
      
      override public function getUsersProfiles(param1:Array, param2:Function, param3:Function) : void
      {
         var cachedProfiles:Array = null;
         var uids:Array = param1;
         var successCallback:Function = param2;
         var errorCallback:Function = param3;
         if(!_inited)
         {
            _initCallbacks.push(function():void
            {
               getUsersProfiles(uids,successCallback,errorCallback);
            });
            return;
         }
         if(this._usersCache.length > 0)
         {
            cachedProfiles = this._usersCache.filter(function(param1:Object, param2:int, param3:Array):Boolean
            {
               return uids.indexOf(param1.id) >= 0;
            });
            if(cachedProfiles.length == uids.length)
            {
               §_-3YE§.info("Using cached profiles for: " + uids.join(","));
               successCallback(cachedProfiles);
               return;
            }
         }
         this.callMethod("getProfiles",{"uids":uids.join(",")},function(param1:§_-9db§):void
         {
            var _loc3_:Object = null;
            var _loc4_:Boolean = false;
            var _loc5_:int = 0;
            var _loc2_:Array = parseProfiles(param1.§_-6Oe§());
            if(uids.length == 1 && uids.indexOf(userId) >= 0)
            {
               _userId = (_loc2_[0] as §_-4Wb§).id;
            }
            for each(_loc3_ in _loc2_)
            {
               _loc4_ = false;
               _loc5_ = 0;
               while(_loc5_ < _usersCache.length)
               {
                  if(_usersCache[_loc5_].id == _loc3_.id)
                  {
                     _usersCache[_loc5_] = _loc3_;
                     _loc4_ = true;
                     break;
                  }
                  _loc5_++;
               }
               if(!_loc4_)
               {
                  _usersCache.push(_loc3_);
               }
            }
            successCallback(_loc2_);
         },function(param1:§_-4n-§):void
         {
            errorCallback(new §_-1KD§(§_-1KD§.NETWORK_ERROR,param1.errorCode,param1.§_-5-l§));
         });
      }
      
      override public function getUserFriendProfiles(param1:Function, param2:Function) : void
      {
         var successCallback:Function = param1;
         var errorCallback:Function = param2;
         if(!_inited)
         {
            _initCallbacks.push(function():void
            {
               getUserFriendProfiles(successCallback,errorCallback);
            });
            return;
         }
         if(this._friendsCache.length > 0)
         {
            §_-3YE§.info("Using cached friends");
            successCallback(this._friendsCache);
            return;
         }
         this.callMethod("getFriends",{"user_id":userId},function(param1:§_-9db§):void
         {
            _friendsCache = parseProfiles(param1.§_-6Oe§());
            successCallback(_friendsCache);
         },function(param1:§_-4n-§):void
         {
            errorCallback(new §_-1KD§(§_-1KD§.NETWORK_ERROR,param1.errorCode,param1.§_-5-l§));
         });
      }
      
      override public function getUserAppFriendProfiles(param1:Function, param2:Function) : void
      {
         var successCallback:Function = param1;
         var errorCallback:Function = param2;
         if(!_inited)
         {
            _initCallbacks.push(function():void
            {
               getUserAppFriendProfiles(successCallback,errorCallback);
            });
            return;
         }
         if(this._appFriendsCache.length > 0)
         {
            §_-3YE§.info("Using cached app friends");
            successCallback(this._appFriendsCache);
            return;
         }
         this.callMethod("getAppFriends",{"user_id":userId},function(param1:§_-9db§):void
         {
            _appFriendsCache = parseProfiles(param1.§_-6Oe§());
            successCallback(_appFriendsCache);
         },function(param1:§_-4n-§):void
         {
            errorCallback(new §_-1KD§(§_-1KD§.NETWORK_ERROR,param1.errorCode,param1.§_-5-l§));
         });
      }
      
      override public function installApp(param1:Function, param2:Function, param3:Array = null) : void
      {
         var successCallback:Function = param1;
         var errorCallback:Function = param2;
         var permissions:Array = param3;
         this.getTestUsers(function(param1:Array):void
         {
            var panel:§_-4DK§ = null;
            var users:Array = param1;
            panel = new §_-4DK§(users,function(param1:§_-5iT§):void
            {
               var userData:* = undefined;
               var userButton:§_-5iT§ = param1;
               userData = userButton.user;
               if(userData && Boolean(userData.online))
               {
                  §_-3Go§(userData,function():void
                  {
                     init(userData.sid);
                     panel.hide();
                     successCallback();
                  });
               }
               else
               {
                  init(userData.sid);
                  panel.hide();
                  successCallback();
               }
            },function():void
            {
               callMethod("addUser",{},function(param1:§_-9db§):void
               {
                  var _loc2_:* = parseProfiles([param1.§_-6Oe§()])[0];
                  if(_loc2_ && Boolean(_loc2_.id))
                  {
                     _usersCache.push(_loc2_);
                     init(_loc2_.id);
                     panel.hide();
                     successCallback();
                  }
               },function(param1:§_-4n-§):void
               {
                  §_-3YE§.error("Failed to add new user: " + param1.§_-5-l§);
               });
            });
            panel.show();
         },function(param1:§_-1KD§):void
         {
            init(_userId);
            successCallback();
         });
      }
      
      private function §_-3Go§(param1:Object, param2:Function) : void
      {
         var _loc3_:* = "Пользователь " + param1.name + " сейчас онлайн.\nВы уверены, что хотите войти как этот пользователь?";
         var _loc4_:§_-70h§ = new §_-70h§(_loc3_,param2);
         _loc4_.show();
      }
   }
}

