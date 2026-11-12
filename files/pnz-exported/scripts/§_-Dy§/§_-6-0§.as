package §_-Dy§
{
   import §_-1t9§.§_-4Wb§;
   import §_-1t9§.§_-4rn§;
   import §_-1t9§.§_-96c§;
   import §_-6BB§.§_-1KD§;
   import §_-6BB§.§_-2qC§;
   import §_-6BB§.§_-6gH§;
   import §_-6BB§.§_-8BS§;
   import §_-Aq0§.§_-4n-§;
   import §_-Aq0§.§_-9db§;
   import §_-Aq0§.§_-Bs9§;
   import flash.net.URLRequestMethod;
   
   public class §_-6-0§ extends §_-2qC§
   {
      public static const §_-7lO§:String = "refType";
      
      public static const §_-Ze§:String = "refId";
      
      private var _inited:Boolean = false;
      
      private var _initCallbacks:Array = [];
      
      private var _userProfile:§_-4Wb§ = null;
      
      private var §_-8N7§:String = "";
      
      private var §_-4UG§:String = "";
      
      private var _userApiKey:String = "";
      
      private var _jsBridge:§_-9l1§ = null;
      
      public function §_-6-0§()
      {
         super();
      }
      
      override public function configure(param1:Object, param2:§_-6gH§) : void
      {
         var options:Object = param1;
         var connector:§_-6gH§ = param2;
         super.configure(options,connector);
         if(options.hasOwnProperty(§_-7lO§))
         {
            this.§_-8N7§ = options[§_-7lO§];
         }
         if(options.hasOwnProperty(§_-Ze§))
         {
            this.§_-4UG§ = options[§_-Ze§];
         }
         this.§_-7cH§(function(param1:Array):void
         {
            if(param1.length > 0)
            {
               _userProfile = param1[0] as §_-4Wb§;
               _userId = _userProfile.id;
               _jsBridge.setUserApiKey(_userApiKey);
               init();
            }
         },function(param1:§_-1KD§):void
         {
         });
         this._jsBridge = new §_-9l1§();
         this._jsBridge.init();
      }
      
      private function init() : void
      {
         var _loc2_:Function = null;
         this._inited = true;
         var _loc1_:int = 0;
         while(_loc1_ < this._initCallbacks.length)
         {
            _loc2_ = this._initCallbacks[_loc1_];
            if(_loc2_ != null && _loc2_ is Function)
            {
               _loc2_();
            }
            _loc1_++;
         }
         this._initCallbacks = [];
      }
      
      override public function get socialNetwork() : String
      {
         return §_-8BS§.§_-8Lg§;
      }
      
      override public function isInstalled(param1:Array, param2:Function, param3:Function) : void
      {
         var permissions:Array = param1;
         var successCallback:Function = param2;
         var errorCallback:Function = param3;
         if(this._inited)
         {
            successCallback(true);
         }
         else
         {
            this._initCallbacks.push(function():void
            {
               isInstalled(permissions,successCallback,errorCallback);
            });
         }
      }
      
      override public function installApp(param1:Function, param2:Function, param3:Array = null) : void
      {
         param1();
      }
      
      override public function configureApp(param1:Array, param2:Function, param3:Function) : void
      {
         param2();
      }
      
      override public function inviteUsers(param1:Array, param2:String, param3:Function, param4:Function) : void
      {
         var ids:Array = param1;
         var message:String = param2;
         var successCallback:Function = param3;
         var errorCallback:Function = param4;
         this._jsBridge.invite(message,function(param1:int):void
         {
            if(successCallback != null)
            {
               successCallback();
            }
         });
      }
      
      override public function showPaymentBox(param1:§_-4rn§, param2:Function, param3:Function) : void
      {
         var purchase:§_-4rn§ = param1;
         var successCallback:Function = param2;
         var errorCallback:Function = param3;
         this.sendRequest({
            "method":"createTransaction",
            "productId":purchase.serviceId,
            "quantity":purchase.quantity
         },function(param1:§_-9db§):void
         {
            var json:* = undefined;
            var event:§_-9db§ = param1;
            json = event.§_-6Oe§();
            if(checkError(json,errorCallback))
            {
               _jsBridge.showModal(json["result"]["transaction"]["link"],350,400,function():void
               {
                  successCallback(json["result"]["transaction"]["id"]);
               });
            }
         },function(param1:§_-4n-§):void
         {
            errorCallback(new §_-1KD§(§_-1KD§.NETWORK_ERROR,param1.errorCode,param1.§_-5-l§));
         });
      }
      
      override public function checkPermissions(param1:Array, param2:Function, param3:Function) : void
      {
         param2();
      }
      
      override public function isAllowSocialMedia(param1:String) : Boolean
      {
         return [].indexOf(param1) >= 0;
      }
      
      override public function hasSocialFeature(param1:String) : Boolean
      {
         return [§_-0CY§].indexOf(param1) >= 0;
      }
      
      override public function prepareSocialMedia(param1:§_-96c§, param2:Function, param3:Function) : void
      {
         param2(param1);
      }
      
      override public function publishSocialMedia(param1:§_-96c§, param2:Function, param3:Function) : void
      {
         var socialMedia:§_-96c§ = param1;
         var callback:Function = param2;
         var errorCallback:Function = param3;
         this.sendRequest({
            "method":"addActivity",
            "message":socialMedia.description
         },function(param1:§_-9db§):void
         {
            var _loc2_:* = param1.§_-6Oe§();
            if(checkError(_loc2_,errorCallback))
            {
               callback();
            }
         },function(param1:§_-4n-§):void
         {
            errorCallback(new §_-1KD§(§_-1KD§.NETWORK_ERROR,param1.errorCode,param1.§_-5-l§));
         });
      }
      
      override public function get referrerType() : String
      {
         if(this.§_-8N7§ != null && this.§_-8N7§ != "")
         {
            return [REFERRER_AD,REFERRER_USER,§_-6vh§,REFERRER_CATALOG,REFERRER_GROUP,REFERRER_WALL,§_-8dJ§].indexOf(this.§_-8N7§) >= 0 ? this.§_-8N7§ : REFERRER_AD;
         }
         return "";
      }
      
      override public function get referrerId() : String
      {
         if(this.§_-4UG§ != null && this.§_-4UG§ != "")
         {
            return this.§_-4UG§;
         }
         return "";
      }
      
      private function §_-7cH§(param1:Function, param2:Function) : void
      {
         var callback:Function = param1;
         var errorCallback:Function = param2;
         this.sendRequest({"method":"getUserData"},function(param1:§_-9db§):void
         {
            var _loc2_:* = param1.§_-6Oe§();
            if(checkError(_loc2_,errorCallback))
            {
               _userApiKey = _loc2_["result"]["userApiKey"];
               callback(parseProfiles([_loc2_["result"]]));
            }
         },function(param1:§_-4n-§):void
         {
            errorCallback(new §_-1KD§(§_-1KD§.NETWORK_ERROR,param1.errorCode,param1.§_-5-l§));
         });
      }
      
      override public function getUsersProfiles(param1:Array, param2:Function, param3:Function) : void
      {
         var uids:Array = param1;
         var callback:Function = param2;
         var errorCallback:Function = param3;
         if(uids.length == 1 && uids[0] == _userId)
         {
            callback([this._userProfile]);
            return;
         }
         this.sendRequest({
            "method":"getUserData",
            "ids":uids
         },function(param1:§_-9db§):void
         {
            var _loc2_:* = param1.§_-6Oe§();
            if(checkError(_loc2_,errorCallback))
            {
               callback(parseProfiles(uids.length <= 1 ? [_loc2_["result"]] : _loc2_["result"]));
            }
         },function(param1:§_-4n-§):void
         {
            errorCallback(new §_-1KD§(§_-1KD§.NETWORK_ERROR,param1.errorCode,param1.§_-5-l§));
         });
      }
      
      override public function getUserFriendProfiles(param1:Function, param2:Function) : void
      {
         var successCallback:Function = param1;
         var errorCallback:Function = param2;
         this.sendRequest({"method":"getUserFriends"},function(param1:§_-9db§):void
         {
            var _loc2_:* = param1.§_-6Oe§();
            if(checkError(_loc2_,errorCallback))
            {
               successCallback(parseProfiles(_loc2_["result"]));
            }
         },function(param1:§_-4n-§):void
         {
            errorCallback(new §_-1KD§(§_-1KD§.NETWORK_ERROR,param1.errorCode,param1.§_-5-l§));
         });
      }
      
      override public function getUserFriendsIds(param1:Function, param2:Function) : void
      {
         var successCallback:Function = param1;
         var errorCallback:Function = param2;
         this.sendRequest({"method":"getUserFriendIds"},function(param1:§_-9db§):void
         {
            var _loc2_:* = param1.§_-6Oe§();
            if(checkError(_loc2_,errorCallback))
            {
               successCallback(_loc2_["result"]);
            }
         },function(param1:§_-4n-§):void
         {
            errorCallback(new §_-1KD§(§_-1KD§.NETWORK_ERROR,param1.errorCode,param1.§_-5-l§));
         });
      }
      
      override public function getUserAppFriendProfiles(param1:Function, param2:Function) : void
      {
         var successCallback:Function = param1;
         var errorCallback:Function = param2;
         this.sendRequest({"method":"getUserAppFriends"},function(param1:§_-9db§):void
         {
            var _loc2_:* = param1.§_-6Oe§();
            if(checkError(_loc2_,errorCallback))
            {
               successCallback(parseProfiles(_loc2_["result"]));
            }
         },function(param1:§_-4n-§):void
         {
            errorCallback(new §_-1KD§(§_-1KD§.NETWORK_ERROR,param1.errorCode,param1.§_-5-l§));
         });
      }
      
      override public function getUserAppFriendsIds(param1:Function, param2:Function) : void
      {
         var successCallback:Function = param1;
         var errorCallback:Function = param2;
         this.sendRequest({"method":"getUserAppFriendIds"},function(param1:§_-9db§):void
         {
            var _loc2_:* = param1.§_-6Oe§();
            if(checkError(_loc2_,errorCallback))
            {
               successCallback(_loc2_["result"]);
            }
         },function(param1:§_-4n-§):void
         {
            errorCallback(new §_-1KD§(§_-1KD§.NETWORK_ERROR,param1.errorCode,param1.§_-5-l§));
         });
      }
      
      override protected function sendRequest(param1:Object, param2:Function, param3:Function, param4:String = null) : void
      {
         var paramPairs:Array;
         var key:String = null;
         var parameters:Object = param1;
         var successCallback:Function = param2;
         var errorCallback:Function = param3;
         var url:String = param4;
         if(!this._inited && parameters["method"] != "getUserData")
         {
            this._initCallbacks.push(function():void
            {
               sendRequest(parameters,successCallback,errorCallback);
            });
            return;
         }
         parameters = this.§_-3xc§(parameters);
         paramPairs = [];
         for(key in parameters)
         {
            paramPairs.push(key + "=" + parameters[key]);
         }
         super.sendRequest(parameters,successCallback,errorCallback);
      }
      
      protected function §_-3xc§(param1:Object) : Object
      {
         param1["dr_auth_status"] = "ok";
         param1["dr_auth_code"] = password;
         param1["session_hash"] = secretKey;
         return param1;
      }
      
      override protected function createHTTPRequest(param1:String = null) : §_-Bs9§
      {
         var _loc2_:§_-Bs9§ = new §_-Bs9§("",null,URLRequestMethod.GET);
         _loc2_.url = §_-4r3§;
         return _loc2_;
      }
      
      protected function checkError(param1:Object, param2:Function) : Boolean
      {
         if(param1 === null)
         {
            param2(new §_-1KD§(§_-1KD§.§_-7qk§,0,"JSON parse fault"));
            return false;
         }
         if(param1.hasOwnProperty("error"))
         {
            param2(new §_-1KD§(§_-1KD§.§_-7qk§,param1["error"]["code"],param1["error"]["message"]));
            return false;
         }
         return true;
      }
      
      protected function parseProfiles(param1:Object) : Array
      {
         var _loc3_:Object = null;
         var _loc4_:§_-4Wb§ = null;
         var _loc2_:Array = [];
         for each(_loc3_ in param1)
         {
            _loc4_ = new §_-4Wb§();
            _loc4_.rawData = _loc3_;
            _loc4_.id = !!_loc3_.hasOwnProperty("uid") ? _loc3_["uid"] : "0";
            _loc4_.firstName = !!_loc3_.hasOwnProperty("name") ? _loc3_["name"] : "";
            _loc4_.lastName = !!_loc3_.hasOwnProperty("surname") ? _loc3_["surname"] : "";
            _loc4_.§_-CXL§ = !!_loc3_.hasOwnProperty("nick") ? _loc3_["nick"] : "";
            _loc4_.gender = Boolean(_loc3_.hasOwnProperty("sex")) && _loc3_["sex"] == "M" ? uint(§_-4Wb§.§_-dv§) : uint(§_-4Wb§.§_-BYe§);
            _loc4_.photoUrl = !!_loc3_.hasOwnProperty("img") ? _loc3_["img"] : "";
            _loc2_.push(_loc4_);
         }
         return _loc2_;
      }
      
      override public function getAppLink(param1:String) : String
      {
         return "https://www.draugiem.lv/applications/" + param1;
      }
   }
}

