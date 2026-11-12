package §_-7Hk§
{
   import §_-0Iu§.§_-4DK§;
   import §_-0uA§.§_-3YE§;
   import §_-1iV§.§_-BkM§;
   import §_-1t9§.§_-4Wb§;
   import §_-1t9§.§_-4rn§;
   import §_-1t9§.§_-7Ys§;
   import §_-1t9§.§_-7ba§;
   import §_-1t9§.§_-96c§;
   import §_-6-L§.§_-6aF§;
   import §_-6-L§.§_-CTu§;
   import §_-6BB§.§_-1KD§;
   import §_-6BB§.§_-2qC§;
   import §_-6BB§.§_-6gH§;
   import §_-6BB§.§_-8BS§;
   import §_-6BB§.§_-8L3§;
   import §_-7Wy§.§_-5iT§;
   import §_-Aq0§.§_-4n-§;
   import §_-Aq0§.§_-9db§;
   import §_-Aq0§.§_-Bs9§;
   
   public class §_-1U4§ extends §_-2qC§
   {
      public static const §_-C-L§:String = "paymentCallback";
      
      public static const §_-0C7§:String = "referrerType";
      
      public static const §_-AZz§:String = "referrerId";
      
      private var §_-2XV§:String = null;
      
      private var §_-AXF§:String;
      
      private var §_-Ht§:String;
      
      protected var _inited:Boolean = false;
      
      protected var _initCallbacks:Array = [];
      
      public function §_-1U4§()
      {
         super();
      }
      
      override public function configure(param1:Object, param2:§_-6gH§) : void
      {
         super.configure(param1,param2);
         if(param1.hasOwnProperty(§_-C-L§))
         {
            this.§_-2XV§ = param1[§_-C-L§];
         }
         if(param1.hasOwnProperty(§_-0C7§))
         {
            this.§_-Ht§ = param1[§_-0C7§];
         }
         if(param1.hasOwnProperty(§_-AZz§))
         {
            this.§_-AXF§ = param1[§_-AZz§];
         }
      }
      
      override public function get socialNetwork() : String
      {
         return §_-8BS§.§_-BTG§;
      }
      
      protected function init(param1:String) : void
      {
         var initCallback:Function = null;
         var uid:String = param1;
         this.callMethod("getAuthorisedUserId",{},function(param1:§_-9db§):void
         {
            §_-AW9§ = param1.§_-6Oe§()["uid"];
         },function(param1:§_-4n-§):void
         {
         });
         this._inited = true;
         _userId = uid;
         for each(initCallback in this._initCallbacks)
         {
            initCallback();
         }
         this._initCallbacks = [];
         dispatchEvent(new §_-8L3§(§_-8L3§.§_-As9§));
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
               init(param1.user.sid);
               panel.hide();
               successCallback();
            },null);
            panel.show();
         },function(param1:§_-1KD§):void
         {
            init(_userId);
            successCallback();
         });
      }
      
      override public function configureApp(param1:Array, param2:Function, param3:Function) : void
      {
         trace("Внимание!","Разрешите все настройки.");
      }
      
      override public function inviteUsers(param1:Array, param2:String, param3:Function, param4:Function) : void
      {
         trace("Внимание!","Пригласите друзей.");
      }
      
      override public function showPaymentBox(param1:§_-4rn§, param2:Function, param3:Function) : void
      {
         var purchase:§_-4rn§ = param1;
         var successCallback:Function = param2;
         var errorCallback:Function = param3;
         this.§_-3ge§(purchase.serviceId,purchase.quantity,function(param1:String):void
         {
            successCallback(param1);
         });
      }
      
      private function §_-3ge§(param1:String, param2:int, param3:Function) : void
      {
         var productId:String = param1;
         var quantity:int = param2;
         var callback:Function = param3;
         var request:§_-Bs9§ = new §_-Bs9§();
         request.url = this.§_-2XV§;
         request.§_-0fS§({
            "userId":_userId,
            "productId":productId,
            "quantity":quantity,
            "socialNetwork":this.socialNetwork
         });
         request.addEventListener(§_-9db§.COMPLETE,function(param1:§_-9db§):void
         {
            var _loc2_:Object = param1.§_-6Oe§();
            if(_loc2_ == null || !_loc2_.hasOwnProperty("response") || _loc2_["response"] == "error")
            {
               §_-3YE§.error("Create transaction error: " + (_loc2_ != null ? §_-6aF§.toString(_loc2_,true) : "null"));
            }
            else
            {
               callback(_loc2_["response"]);
            }
         });
         request.addEventListener(§_-4n-§.HTTP_ERROR,function(param1:§_-4n-§):void
         {
            §_-3YE§.error("http error" + param1.errorCode);
         });
         request.send();
      }
      
      override public function isInstalled(param1:Array, param2:Function, param3:Function) : void
      {
         param2(§_-BkM§.§_-n1§() == null || this._inited);
      }
      
      override public function checkPermissions(param1:Array, param2:Function, param3:Function) : void
      {
         param2(false);
      }
      
      override public function get referrerType() : String
      {
         return this.§_-Ht§;
      }
      
      override public function get referrerId() : String
      {
         return this.§_-AXF§;
      }
      
      override public function getUserLink(param1:§_-4Wb§) : String
      {
         return "http://local/" + param1.id;
      }
      
      override public function get unauthorizedSocialId() : String
      {
         return §_-AW9§;
      }
      
      override public function isAllowSocialMedia(param1:String) : Boolean
      {
         return true;
      }
      
      protected function getTestUsers(param1:Function, param2:Function) : void
      {
         var successCallback:Function = param1;
         var errorCallback:Function = param2;
         this.callMethod("getTestUsers",{},function(param1:§_-9db§):void
         {
            successCallback(param1.§_-6Oe§()["users"]);
         },function(param1:§_-4n-§):void
         {
            errorCallback(new §_-1KD§(§_-1KD§.NETWORK_ERROR,param1.errorCode,param1.§_-5-l§));
         });
      }
      
      override public function getUsersProfiles(param1:Array, param2:Function, param3:Function) : void
      {
         var uids:Array = param1;
         var successCallback:Function = param2;
         var errorCallback:Function = param3;
         if(!this._inited)
         {
            this._initCallbacks.push(function():void
            {
               getUsersProfiles(uids,successCallback,errorCallback);
            });
            return;
         }
         this.callMethod("getProfiles",{"uids":uids.join(",")},function(param1:§_-9db§):void
         {
            var _loc2_:Array = parseProfiles(param1.§_-6Oe§());
            if(uids.length == 1 && uids.indexOf(userId) >= 0)
            {
               _userId = (_loc2_[0] as §_-4Wb§).id;
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
         if(!this._inited)
         {
            this._initCallbacks.push(function():void
            {
               getUserFriendProfiles(successCallback,errorCallback);
            });
            return;
         }
         this.callMethod("getFriends",{},function(param1:§_-9db§):void
         {
            successCallback(parseProfiles(param1.§_-6Oe§()));
         },function(param1:§_-4n-§):void
         {
            errorCallback(new §_-1KD§(§_-1KD§.NETWORK_ERROR,param1.errorCode,param1.§_-5-l§));
         });
      }
      
      override public function getUserAppFriendProfiles(param1:Function, param2:Function) : void
      {
         var successCallback:Function = param1;
         var errorCallback:Function = param2;
         if(!this._inited)
         {
            this._initCallbacks.push(function():void
            {
               getUserAppFriendProfiles(successCallback,errorCallback);
            });
            return;
         }
         this.callMethod("getAppFriends",{},function(param1:§_-9db§):void
         {
            successCallback(parseProfiles(param1.§_-6Oe§()));
         },function(param1:§_-4n-§):void
         {
            errorCallback(new §_-1KD§(§_-1KD§.NETWORK_ERROR,param1.errorCode,param1.§_-5-l§));
         });
      }
      
      override public function getUserGroupList(param1:Function, param2:Function) : void
      {
         var successCallback:Function = param1;
         var errorCallback:Function = param2;
         this.callMethod("getUserGroups",{"sid":_userId},function(param1:§_-9db§):void
         {
            successCallback(§_-ex§(param1.§_-6Oe§()));
         },function(param1:§_-4n-§):void
         {
            errorCallback(new §_-1KD§(§_-1KD§.NETWORK_ERROR,param1.errorCode,param1.§_-5-l§));
         });
      }
      
      override public function isGroupMember(param1:String, param2:String, param3:Function, param4:Function) : void
      {
         var userId:String = param1;
         var groupId:String = param2;
         var successCallback:Function = param3;
         var errorCallback:Function = param4;
         this.callMethod("isGroupMember",{
            "user_id":userId,
            "group_id":groupId
         },function(param1:§_-9db§):void
         {
            successCallback(param1.§_-6Oe§()["member"] == 1);
         },function(param1:§_-4n-§):void
         {
            errorCallback(new §_-1KD§(§_-1KD§.NETWORK_ERROR,param1.errorCode,param1.§_-5-l§));
         });
      }
      
      override public function getOfferList(param1:Function, param2:Function) : void
      {
         var _loc5_:§_-7Ys§ = null;
         var _loc3_:Array = [];
         var _loc4_:int = 0;
         while(_loc4_ < 3)
         {
            _loc5_ = new §_-7Ys§();
            _loc5_.id = String(_loc4_);
            _loc5_.title = "#offer" + _loc4_ + "Title";
            _loc5_.description = "#offer" + _loc4_ + "Description";
            _loc5_.reward = "#offer" + _loc4_ + "Reward";
            _loc5_.url = §_-4r3§ + "#offer" + _loc4_;
            _loc5_.points = _loc4_ * 100 + 100;
            _loc5_.time = "#offer" + _loc4_ + "Time";
            _loc3_.push(_loc5_);
            _loc4_++;
         }
         param1(_loc3_);
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
            _loc4_.photoUrl = !!_loc3_.hasOwnProperty("photo") ? _loc3_["photo"] : "http://vkontakte.ru/images/question_b.gif";
            _loc4_.§_-5pW§ = true;
            _loc4_.id = !!_loc3_.hasOwnProperty("id") ? _loc3_["id"] : "0";
            _loc4_.firstName = !!_loc3_.hasOwnProperty("firstName") ? _loc3_["firstName"] : "";
            _loc4_.lastName = !!_loc3_.hasOwnProperty("lastName") ? _loc3_["lastName"] : "";
            _loc4_.birthday = !!_loc3_.hasOwnProperty("birthday") ? _loc3_["birthday"] : "";
            _loc4_.§_-Bgn§ = !!_loc3_.hasOwnProperty("birthday") ? int(_loc3_["birthday"]) : 0;
            _loc4_.cityName = !!_loc3_.hasOwnProperty("cityName") ? _loc3_["cityName"] : "";
            _loc4_.countryName = !!_loc3_.hasOwnProperty("countryName") ? _loc3_["countryName"] : "";
            _loc4_.gender = !!_loc3_.hasOwnProperty("gender") ? uint(int(_loc3_["gender"])) : uint(§_-4Wb§.§_-2xx§);
            _loc2_.push(_loc4_);
         }
         return _loc2_;
      }
      
      protected function §_-ex§(param1:Object) : Array
      {
         var _loc3_:Object = null;
         var _loc4_:§_-7ba§ = null;
         var _loc2_:Array = [];
         for each(_loc3_ in param1)
         {
            _loc4_ = new §_-7ba§();
            _loc4_.rawData = _loc3_;
            _loc4_.id = !!_loc3_.hasOwnProperty("id") ? _loc3_["id"] : "0";
            _loc4_.name = !!_loc3_.hasOwnProperty("name") ? _loc3_["name"] : "";
            _loc2_.push(_loc4_);
         }
         return _loc2_;
      }
      
      protected function callMethod(param1:String, param2:Object, param3:Function, param4:Function) : void
      {
         param2["method"] = param1;
         param2["user_id"] = _userId;
         this.sendRequest(param2,param3,param4);
      }
      
      override protected function sendRequest(param1:Object, param2:Function, param3:Function, param4:String = null) : void
      {
         var _loc6_:String = null;
         var _loc5_:String = "";
         for(_loc6_ in param1)
         {
            _loc5_ += _loc6_ + "=" + param1[_loc6_] + "&";
         }
         §_-3YE§.info(§_-4r3§ + "?" + _loc5_);
         super.sendRequest(param1,param2,param3);
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
         if(socialMedia.type == §_-96c§.§_-0B0§)
         {
            try
            {
               §_-CTu§.§_-bv§(socialMedia.photo,socialMedia.fileName);
            }
            catch(e:Error)
            {
               errorCallback(new §_-1KD§(§_-1KD§.§_-7PF§,-1,e.message));
               return;
            }
         }
         callback();
      }
      
      override public function getAppLink(param1:String) : String
      {
         return "";
      }
      
      override public function hasSocialFeature(param1:String) : Boolean
      {
         return true;
      }
   }
}

