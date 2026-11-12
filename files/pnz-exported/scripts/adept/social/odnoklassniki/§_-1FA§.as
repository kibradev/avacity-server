package adept.social.odnoklassniki
{
   import §_-0uA§.§_-3YE§;
   import §_-1t9§.§_-33z§;
   import §_-1t9§.§_-4Wb§;
   import §_-1t9§.§_-4rn§;
   import §_-1t9§.§_-96c§;
   import §_-5Kp§.MD5;
   import §_-6-L§.§_-49j§;
   import §_-6-L§.§_-6aF§;
   import §_-6-L§.§_-7uH§;
   import §_-6BB§.§_-1KD§;
   import §_-6BB§.§_-2qC§;
   import §_-6BB§.§_-6gH§;
   import §_-6BB§.§_-8BS§;
   import §_-6BB§.§_-8L3§;
   import §_-8a5§.§_-2IQ§;
   import §_-8a5§.§_-5r1§;
   import §_-Aq0§.§_-4n-§;
   import §_-Aq0§.§_-9db§;
   import §_-Aq0§.§_-Bs9§;
   import §_-Xm§.MultipartURLLoader;
   import com.api.forticom.ApiCallbackEvent;
   import com.api.forticom.ForticomAPI;
   import flash.events.ErrorEvent;
   import flash.events.Event;
   import flash.net.URLRequest;
   import flash.net.navigateToURL;
   import flash.system.Security;
   
   public class §_-1FA§ extends §_-2qC§
   {
      public static const §_-69A§:String = "PUBLISH TO STREAM";
      
      public static const §_-2P7§:String = "EVENTS";
      
      public static const §_-1BX§:String = "SET STATUS";
      
      public static const §_-n4§:String = "EMAIL";
      
      public static const §_-8Be§:String = "uid,first_name,last_name,name,url_profile,gender,birthday,pic_1,pic_2,pic_3,pic_4,location";
      
      public static const §_-0qB§:String = "ok";
      
      public static const §_-2Ry§:String = "RUR";
      
      public static const §_-7YR§:String = "USER_TO_USER";
      
      public static const §_-3Nt§:String = "APP_TO_USER";
      
      public static const §_-2Ex§:String = "sessionKey";
      
      public static const §_-0rI§:String = "refplace";
      
      public static const §_-0mp§:String = "referer";
      
      public static const §_-9sU§:String = "adId";
      
      public static const §_-4zO§:String = "apiConnection";
      
      public static const §_-9Fv§:String = "isInstalled";
      
      public static const §_-82c§:String = "sessionSecretKey";
      
      public static const §_-7rQ§:String = "currency";
      
      public static const §_-1x6§:String = "isIFrame";
      
      public static const §_-AxL§:String = "passwordCallback";
      
      public static const §_-AwF§:String = "ipGeoLocation";
      
      public static const §_-089§:String = "app_url";
      
      private static const §_-2y4§:String = "PUBLIC";
      
      private static const §_-2uz§:String = "FRIENDS";
      
      private static const §_-340§:String = "http://api.odnoklassniki.ru/";
      
      private var §_-7QE§:String = "";
      
      private var §_-AXV§:String = "";
      
      private var §_-ye§:String = "";
      
      private var §_-3NA§:String = "";
      
      private var _apiConnection:String = "";
      
      private var _isInstalled:Boolean = false;
      
      private var §_-7ZV§:String = "";
      
      private var §_-90d§:String = "ok";
      
      private var §_-5xr§:Boolean = false;
      
      private var §_-1Mb§:String = null;
      
      private var §_-lu§:String = null;
      
      private var §_-1V8§:Boolean = false;
      
      private var §_-2GB§:Array = [];
      
      private var _jsBridge:OdnoklassnikiJSBridge = null;
      
      private var §_-BIj§:Function = null;
      
      private var §_-2XV§:Function = null;
      
      private var §_-3JG§:Function = null;
      
      private var §_-Aus§:Function = null;
      
      private var §_-1yR§:Function = null;
      
      private var §_-7yk§:Function = null;
      
      private var §_-Bzn§:Function = null;
      
      private var §_-7Pk§:Function = null;
      
      private var §_-jP§:Function = null;
      
      private var §_-ANy§:Function = null;
      
      private var §_-4aS§:Object = null;
      
      private var §_-Hd§:String = null;
      
      public function §_-1FA§()
      {
         super();
      }
      
      override public function configure(param1:Object, param2:§_-6gH§) : void
      {
         var options:Object = param1;
         var connector:§_-6gH§ = param2;
         §_-6hS§ = "json";
         super.configure(options,connector);
         if(options.hasOwnProperty(§_-2Ex§))
         {
            this.§_-7QE§ = options[§_-2Ex§];
         }
         if(options.hasOwnProperty(§_-0rI§))
         {
            this.§_-AXV§ = options[§_-0rI§];
         }
         if(options.hasOwnProperty(§_-0mp§))
         {
            this.§_-ye§ = options[§_-0mp§];
         }
         if(options.hasOwnProperty(§_-9sU§))
         {
            this.§_-3NA§ = options[§_-9sU§];
         }
         if(options.hasOwnProperty(§_-4zO§))
         {
            this._apiConnection = options[§_-4zO§];
         }
         if(options.hasOwnProperty(§_-9Fv§))
         {
            this._isInstalled = options[§_-9Fv§];
         }
         if(options.hasOwnProperty(§_-82c§))
         {
            this.§_-7ZV§ = options[§_-82c§];
         }
         if(options.hasOwnProperty(§_-7rQ§))
         {
            this.§_-90d§ = options[§_-7rQ§];
         }
         if(options.hasOwnProperty(§_-1x6§))
         {
            this.§_-5xr§ = options[§_-1x6§];
         }
         if(options.hasOwnProperty(§_-AxL§))
         {
            this.§_-1Mb§ = options[§_-AxL§];
         }
         if(options.hasOwnProperty(§_-AwF§))
         {
            this.§_-lu§ = options[§_-AwF§];
         }
         if(options.hasOwnProperty(§_-089§))
         {
            this.§_-Hd§ = options[§_-089§];
         }
         if(this.§_-5xr§)
         {
            Security.allowDomain("*");
            this._jsBridge = new OdnoklassnikiJSBridge(§_-4r3§,this._apiConnection);
            this._jsBridge.addEventListener(§_-1KD§.§_-9cu§,this.onSocialError);
            this._jsBridge.addEventListener(ApiCallbackEvent.CALL_BACK,this.§_-5iE§);
            this._jsBridge.init(this.§_-AZC§);
         }
         else
         {
            try
            {
               ForticomAPI.addEventListener(ForticomAPI.CONNECTED,this.§_-BOs§);
               ForticomAPI.connection = this._apiConnection;
               ForticomAPI.addEventListener(ApiCallbackEvent.CALL_BACK,this.§_-5iE§);
            }
            catch(e:Error)
            {
               §_-3YE§.§_-7aK§("Couldn\'t init app");
            }
         }
      }
      
      private function §_-AZC§() : void
      {
         §_-4r3§ += "fb.do";
         this.handleApiInited();
      }
      
      override public function createNavigationLink(param1:String, param2:String, param3:String, param4:String) : String
      {
         var _loc5_:* = this.getAppLink(param1) + §_-AYW§ + §_-9P9§ + §_-2Yt§ + param2 + "\"" + param3 + "\"";
         if(param4 != null)
         {
            _loc5_ += §_-06E§ + param4;
         }
         return _loc5_;
      }
      
      private function onSocialError(param1:§_-1KD§) : void
      {
         §_-3YE§.error("social error: " + param1.message);
      }
      
      private function §_-BOs§(param1:Event) : void
      {
         this.handleApiInited();
      }
      
      private function handleApiInited() : void
      {
         var _loc1_:Function = null;
         if(this.§_-1Mb§ != null && this.§_-1Mb§ != "" && §_-6un§ == null)
         {
            this.§_-8t4§();
            return;
         }
         this.§_-1V8§ = true;
         §_-3YE§.info("Forticom API initialized.");
         for each(_loc1_ in this.§_-2GB§)
         {
            _loc1_();
         }
         this.§_-2GB§ = [];
         dispatchEvent(new §_-8L3§(§_-8L3§.§_-As9§));
      }
      
      private function §_-8t4§() : void
      {
         var request:§_-Bs9§ = new §_-Bs9§();
         request.url = this.§_-1Mb§;
         request.§_-0fS§({
            "sk":this.§_-7QE§,
            "ssk":this.§_-7ZV§,
            "id":_userId
         });
         request.addEventListener(§_-9db§.COMPLETE,function(param1:§_-9db§):void
         {
            var _loc2_:Object = param1.§_-6Oe§();
            if(_loc2_ == null || !_loc2_.hasOwnProperty("response") || _loc2_["response"] == "error")
            {
               §_-3YE§.error("Fetch password error: " + (_loc2_ != null ? §_-6aF§.toString(_loc2_,true) : "null"));
            }
            else
            {
               §_-6un§ = _loc2_["response"];
               if(§_-6un§ != null)
               {
                  handleApiInited();
               }
            }
         });
         request.addEventListener(§_-4n-§.HTTP_ERROR,function(param1:§_-4n-§):void
         {
            §_-3YE§.error("Fetch password http error");
         });
         request.send();
      }
      
      private function §_-5iE§(param1:ApiCallbackEvent) : void
      {
         var _loc2_:Function = null;
         switch(param1.method)
         {
            case "showPayment":
               _loc2_ = this.§_-2XV§;
               this.§_-2XV§ = null;
               if(_loc2_ != null && param1.result == "ok")
               {
                  _loc2_(null);
               }
               _loc2_ = null;
               break;
            case "showPermissions":
               _loc2_ = this.§_-BIj§;
               this.§_-BIj§ = null;
               if(_loc2_ != null && param1.result == "ok")
               {
                  _loc2_();
               }
               _loc2_ = null;
               break;
            case "showConfirmation":
               if(this.§_-4aS§ != null)
               {
                  if(param1.result == "ok")
                  {
                     this.streamPublish(this.§_-4aS§["message"],this.§_-4aS§["attachment"],!!this.§_-4aS§.hasOwnProperty("action_links") ? this.§_-4aS§["action_links"] : "",param1.data,this.§_-4aS§["call_id"],this.§_-3JG§,this.§_-Aus§);
                  }
                  else if(this.§_-Aus§ != null)
                  {
                     this.§_-Aus§(new §_-1KD§(§_-1KD§.§_-9cu§));
                  }
               }
               this.§_-4aS§ = null;
               break;
            case "postMediatopic":
               if(param1.result == "ok" && this.§_-3JG§ != null)
               {
                  this.§_-3JG§();
               }
               else if(this.§_-Aus§ != null)
               {
                  this.§_-Aus§(new §_-1KD§(§_-1KD§.§_-9cu§));
               }
               break;
            case "prepareMidroll":
               if(param1.data == "ready" && param1.result == "ok")
               {
                  if(this.§_-1yR§ != null)
                  {
                     this.§_-1yR§();
                  }
               }
               else if(this.§_-7yk§ != null)
               {
                  this.§_-7yk§(param1.data);
               }
               this.§_-1yR§ = null;
               this.§_-7yk§ = null;
               break;
            case "showMidroll":
               if(param1.data == "complete" && param1.result == "ok")
               {
                  if(this.§_-Bzn§ != null)
                  {
                     this.§_-Bzn§();
                  }
               }
               else if(this.§_-7Pk§ != null)
               {
                  this.§_-7Pk§(param1.data);
               }
               this.§_-Bzn§ = null;
               this.§_-7Pk§ = null;
               break;
            case "showNotification":
               if(param1.result == "ok")
               {
                  if(this.§_-jP§ != null)
                  {
                     this.§_-jP§();
                  }
               }
               else if(this.§_-ANy§ != null)
               {
                  this.§_-ANy§(param1.data);
               }
               this.§_-jP§ = null;
               this.§_-ANy§ = null;
         }
      }
      
      override public function get socialNetwork() : String
      {
         return §_-8BS§.§_-Uu§;
      }
      
      public function get ipGeoLocation() : String
      {
         return this.§_-lu§;
      }
      
      override public function installApp(param1:Function, param2:Function, param3:Array = null) : void
      {
         var newPermissions:Array = null;
         var successCallback:Function = param1;
         var errorCallback:Function = param2;
         var permissions:Array = param3;
         if(!this.§_-1V8§)
         {
            this.§_-2GB§.push(function():void
            {
               installApp(successCallback,errorCallback,permissions);
            });
            return;
         }
         if(this._isInstalled)
         {
            newPermissions = §_-49j§.clone(permissions);
            this.configureApp(newPermissions,successCallback,errorCallback);
         }
      }
      
      override public function configureApp(param1:Array, param2:Function, param3:Function) : void
      {
         if(!this.§_-1V8§)
         {
            return;
         }
         this.§_-BIj§ = param2;
         if(this.§_-5xr§)
         {
            this._jsBridge.showPermissions(this.§_-0oL§(param1));
         }
         else
         {
            ForticomAPI.showPermissions(this.§_-0oL§(param1));
         }
      }
      
      override public function inviteUsers(param1:Array, param2:String, param3:Function, param4:Function) : void
      {
         var _loc5_:Array = null;
         if(!this.§_-1V8§)
         {
            return;
         }
         if(this.§_-5xr§)
         {
            _loc5_ = param1 == null ? [] : param1.slice(0,5);
            this._jsBridge.invite(param2,_loc5_,param3);
         }
         else
         {
            ForticomAPI.showInvite();
         }
      }
      
      override public function showPaymentBox(param1:§_-4rn§, param2:Function, param3:Function) : void
      {
         if(!this.§_-1V8§)
         {
            return;
         }
         this.§_-2XV§ = param2;
         if(this.§_-5xr§)
         {
            this._jsBridge.showPaymentBox(param1.serviceName,param1.description,param1.serviceId,Math.ceil(param1.pointsPrice / §_-2Yo§),null,null,this.§_-90d§,"true");
         }
         else
         {
            ForticomAPI.showPayment(param1.serviceName,param1.description,param1.serviceId,Math.ceil(param1.pointsPrice / §_-2Yo§),null,null,this.§_-90d§,"true");
         }
      }
      
      override public function isInstalled(param1:Array, param2:Function, param3:Function) : void
      {
         var permissions:Array = param1;
         var successCallback:Function = param2;
         var errorCallback:Function = param3;
         if(!this.§_-1V8§)
         {
            this.§_-2GB§.push(function():void
            {
               isInstalled(permissions,successCallback,errorCallback);
            });
            return;
         }
         if(this._isInstalled && permissions.length == 0)
         {
            successCallback(true);
            return;
         }
         this.checkPermissions(permissions,successCallback,errorCallback);
      }
      
      private function §_-0oL§(param1:Array) : Array
      {
         var _loc3_:String = null;
         var _loc2_:Array = [];
         for each(_loc3_ in param1)
         {
            switch(_loc3_)
            {
               case §_-2qC§.PERMISSION_NOTIFY:
                  _loc2_.push(§_-2P7§);
                  break;
               case §_-2qC§.PERMISSION_STATUS:
                  _loc2_.push(§_-1BX§);
                  break;
               case §_-2qC§.PERMISSION_EMAIL:
                  _loc2_.push(§_-n4§);
                  break;
            }
         }
         return _loc2_;
      }
      
      override public function checkPermissions(param1:Array, param2:Function, param3:Function) : void
      {
         var _loc4_:Array = this.§_-0oL§(param1);
         if(_loc4_.length == 0)
         {
            param2(true);
            return;
         }
         this._checkPermissions(§_-49j§.clone(_loc4_),param2,param3);
      }
      
      private function _checkPermissions(param1:Array, param2:Function, param3:Function) : void
      {
         var leftPermissions:Array = param1;
         var successCallback:Function = param2;
         var errorCallback:Function = param3;
         var permission:String = leftPermissions.shift();
         if(this.§_-5xr§)
         {
            successCallback(true);
         }
         else
         {
            this.hasAppPermission(permission,function(param1:Boolean):void
            {
               if(!param1)
               {
                  successCallback(false);
                  return;
               }
               if(leftPermissions.length == 0)
               {
                  successCallback(true);
               }
               else
               {
                  _checkPermissions(leftPermissions,successCallback,errorCallback);
               }
            },errorCallback);
         }
      }
      
      override public function get referrerType() : String
      {
         if(this.§_-3NA§ != null && this.§_-3NA§ != "")
         {
            return §_-2qC§.REFERRER_AD;
         }
         switch(this.§_-AXV§)
         {
            case "friend_invitation":
               return §_-2qC§.REFERRER_USER;
            case "friend_feed":
            case "internal_object_app_ref":
               return §_-2qC§.REFERRER_WALL;
            case "catalog":
               return §_-2qC§.REFERRER_CATALOG;
            case "banner":
               return §_-2qC§.REFERRER_AD;
            default:
               return "";
         }
      }
      
      override public function get referrerId() : String
      {
         return this.§_-3NA§ != null && this.§_-3NA§ != "" ? this.§_-3NA§ : this.§_-ye§;
      }
      
      override public function navigateToApplication(param1:String) : void
      {
         navigateToURL(new URLRequest("https://ok.ru/game/" + param1),"_blank");
      }
      
      override public function getUserLink(param1:§_-4Wb§) : String
      {
         return "https://ok.ru/profile/" + param1.id;
      }
      
      override public function getAppLink(param1:String) : String
      {
         return this.§_-Hd§;
      }
      
      override public function getUsersProfiles(param1:Array, param2:Function, param3:Function) : void
      {
         new §_-nw§(this).fetch(param1,param2,param3);
      }
      
      override public function getUserFriendProfiles(param1:Function, param2:Function) : void
      {
         var successCallback:Function = param1;
         var errorCallback:Function = param2;
         this.getUserFriendsIds(function(param1:Array):void
         {
            if(param1.length == 0)
            {
               successCallback([]);
            }
            getUsersProfiles(param1,successCallback,errorCallback);
         },errorCallback);
      }
      
      override public function getUserFriendsIds(param1:Function, param2:Function) : void
      {
         var successCallback:Function = param1;
         var errorCallback:Function = param2;
         this.callMethod("friends.get",{},function(param1:§_-9db§):void
         {
            var _loc2_:* = param1.§_-6Oe§();
            if(checkError(_loc2_,errorCallback))
            {
               successCallback(_loc2_);
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
         this.getUserAppFriendsIds(function(param1:Array):void
         {
            if(param1.length == 0)
            {
               successCallback([]);
            }
            getUsersProfiles(param1,successCallback,errorCallback);
         },errorCallback);
      }
      
      override public function getUserAppFriendsIds(param1:Function, param2:Function) : void
      {
         var successCallback:Function = param1;
         var errorCallback:Function = param2;
         this.callMethod("friends.getAppUsers",{},function(param1:§_-9db§):void
         {
            var _loc2_:* = param1.§_-6Oe§();
            if(checkError(_loc2_,errorCallback))
            {
               successCallback(_loc2_["uids"]);
            }
         },function(param1:§_-4n-§):void
         {
            errorCallback(new §_-1KD§(§_-1KD§.NETWORK_ERROR,param1.errorCode,param1.§_-5-l§));
         });
      }
      
      override public function getUserGroupList(param1:Function, param2:Function) : void
      {
         param1([]);
      }
      
      override public function getOfferList(param1:Function, param2:Function) : void
      {
         param1([]);
      }
      
      private function streamPublish(param1:String, param2:String, param3:String, param4:String, param5:String, param6:Function, param7:Function) : void
      {
         var params:Object;
         var message:String = param1;
         var attachment:String = param2;
         var actionLinks:String = param3;
         var reSig:String = param4;
         var callId:String = param5;
         var successCallback:Function = param6;
         var errorCallback:Function = param7;
         if(!this._isInstalled)
         {
            return;
         }
         params = {
            "message":message,
            "attachment":attachment,
            "resig":reSig,
            "call_id":callId
         };
         if(actionLinks != "")
         {
            params["action_links"] = actionLinks;
         }
         this.callMethod("stream.publish",params,function(param1:§_-9db§):void
         {
            var _loc2_:* = param1.§_-6Oe§();
            if(checkError(_loc2_,errorCallback))
            {
               successCallback();
            }
         },function(param1:§_-4n-§):void
         {
            errorCallback(new §_-1KD§(§_-1KD§.NETWORK_ERROR,param1.errorCode,param1.§_-5-l§));
         });
      }
      
      override public function isAllowSocialMedia(param1:String) : Boolean
      {
         return [§_-96c§.§_-Anq§,§_-96c§.§_-Aqf§,§_-96c§.§_-6SG§,§_-96c§.§_-9IO§].indexOf(param1) >= 0;
      }
      
      override public function prepareSocialMedia(param1:§_-96c§, param2:Function, param3:Function) : void
      {
         var socialMedia:§_-96c§ = param1;
         var callback:Function = param2;
         var errorCallback:Function = param3;
         if(socialMedia.type == §_-96c§.§_-9IO§)
         {
            this.§_-AUD§(socialMedia,function(param1:String):void
            {
               socialMedia.uploadServer = param1;
               callback(socialMedia);
            },errorCallback);
         }
         else
         {
            callback(socialMedia);
         }
      }
      
      override public function publishSocialMedia(param1:§_-96c§, param2:Function, param3:Function) : void
      {
         switch(param1.type)
         {
            case §_-96c§.§_-Aqf§:
               this.notify(param1.targetUserId,param1.description,param2,param3);
               return;
            case §_-96c§.§_-6SG§:
               this.§_-jP§ = param2;
               this.§_-ANy§ = param3;
               this.showNotification(param1.description,param1.targetUserId);
               return;
            case §_-96c§.§_-9IO§:
               this.postToAlbum(param1,param2,param3);
               return;
            default:
               if(userId != _userId)
               {
                  return;
               }
               this.§_-3JG§ = param2;
               this.§_-Aus§ = param3;
               this.postMediatopic(param1);
               return;
         }
      }
      
      private function §_-1cO§(param1:§_-96c§) : void
      {
         var _loc5_:Array = null;
         var _loc6_:Object = null;
         var _loc7_:String = null;
         param1.description = §_-7uH§.§_-Bgy§(param1.description,100);
         var _loc2_:Object = {
            "caption":param1.description,
            "media":[{
               "src":param1.photoUrl,
               "type":"image"
            }]
         };
         var _loc3_:String = new §_-2IQ§(_loc2_).getString();
         var _loc4_:Object = {
            "method":"stream.publish",
            "message":param1.title,
            "attachment":_loc3_,
            "call_id":Math.round(Math.random() * 1000000)
         };
         if(param1.links != null && param1.links.links.length > 0)
         {
            _loc5_ = [];
            for each(_loc6_ in param1.links.links)
            {
               _loc5_.push({
                  "text":_loc6_["title"],
                  "href":_loc6_["url"]
               });
            }
            _loc7_ = new §_-2IQ§(_loc5_).getString();
            _loc4_["action_links"] = _loc7_;
         }
         _loc4_ = this.§_-3xc§(_loc4_);
         _loc4_["sig"] = this.§_-1bO§(_loc4_);
         this.§_-4aS§ = _loc4_;
         if(this.§_-5xr§)
         {
            this._jsBridge.showConfirmation("stream.publish",param1.confirm,_loc4_["sig"]);
         }
         else
         {
            ForticomAPI.showConfirmation("stream.publish",param1.confirm,_loc4_["sig"]);
         }
      }
      
      private function postMediatopic(param1:§_-96c§) : void
      {
         var _loc4_:Object = null;
         var _loc5_:String = null;
         var _loc6_:String = null;
         var _loc7_:String = null;
         var _loc2_:Object = {
            "type":"app",
            "images":[{
               "url":param1.photoUrl,
               "title":param1.title
            }]
         };
         if(param1.links != null && param1.links.links.length > 0)
         {
            _loc4_ = param1.links.links[0];
            _loc5_ = _loc4_["title"] as String;
            _loc6_ = _loc4_["url"] as String;
            _loc7_ = _loc6_.substr(_loc6_.indexOf("?"));
            _loc2_["actions"] = [{
               "text":_loc5_,
               "mark":_loc7_
            }];
            (_loc2_["images"] as Array)[0]["mark"] = _loc7_;
         }
         var _loc3_:Object = {"media":[{
            "type":"text",
            "text":param1.description
         },_loc2_,{
            "type":"app-ref",
            "appId":_appId
         }]};
         this._jsBridge.postMediatopic(_loc3_);
      }
      
      private function §_-AUD§(param1:§_-96c§, param2:Function, param3:Function) : void
      {
         var socialMedia:§_-96c§ = param1;
         var callback:Function = param2;
         var errorCallback:Function = param3;
         var params:Object = {};
         if(socialMedia.targetAlbumId != null)
         {
            params["aid"] = socialMedia.targetAlbumId;
         }
         this.callMethod("photosV2.getUploadUrl",params,function(param1:§_-9db§):void
         {
            var _loc2_:* = param1.§_-6Oe§();
            if(checkError(_loc2_,errorCallback))
            {
               callback(_loc2_["upload_url"]);
            }
         },function(param1:§_-4n-§):void
         {
            errorCallback(new §_-1KD§(§_-1KD§.NETWORK_ERROR,param1.errorCode,param1.§_-5-l§));
         });
      }
      
      private function postToAlbum(param1:§_-96c§, param2:Function, param3:Function) : void
      {
         var socialMedia:§_-96c§ = param1;
         var callback:Function = param2;
         var errorCallback:Function = param3;
         var multipartUrlUploader:MultipartURLLoader = new MultipartURLLoader();
         multipartUrlUploader.§_-AhL§(socialMedia.§_-8B§,"photo.jpg","pic1");
         multipartUrlUploader.addEventListener(Event.COMPLETE,function(param1:Event):void
         {
            var _loc4_:String = null;
            var _loc2_:§_-5r1§ = new §_-5r1§(MultipartURLLoader(param1.currentTarget).loader.data as String);
            var _loc3_:Object = _loc2_.getValue();
            if(checkError(_loc3_,errorCallback))
            {
               for(_loc4_ in _loc3_["photos"])
               {
                  submitPhotoPost(socialMedia,_loc4_,_loc3_["photos"][_loc4_]["token"] as String,callback,errorCallback);
               }
            }
         });
         multipartUrlUploader.addEventListener(ErrorEvent.ERROR,function(param1:Event):void
         {
            errorCallback(new §_-1KD§(§_-1KD§.NETWORK_ERROR));
         });
         multipartUrlUploader.load(socialMedia.uploadServer);
      }
      
      private function submitPhotoPost(param1:§_-96c§, param2:String, param3:String, param4:Function, param5:Function) : void
      {
         var socialMedia:§_-96c§ = param1;
         var photoId:String = param2;
         var token:String = param3;
         var callback:Function = param4;
         var errorCallback:Function = param5;
         var params:Object = {
            "photo_id":photoId,
            "token":token,
            "comment":socialMedia.description
         };
         this.callMethod("photosV2.commit",params,function(param1:§_-9db§):void
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
      
      private function showNotification(param1:String, param2:String) : void
      {
         this._jsBridge.showNotification(param1,param2);
      }
      
      private function notify(param1:String, param2:String, param3:Function, param4:Function) : void
      {
         var userId:String = param1;
         var message:String = param2;
         var successCallback:Function = param3;
         var errorCallback:Function = param4;
         var params:Object = {
            "to_uids":userId,
            "notification":message,
            "type":§_-3Nt§
         };
         this.callMethod("notifications.send",params,function(param1:§_-9db§):void
         {
            var _loc2_:* = param1.§_-6Oe§();
            if(checkError(_loc2_,errorCallback))
            {
               successCallback();
            }
         },function(param1:§_-4n-§):void
         {
            errorCallback(new §_-1KD§(§_-1KD§.NETWORK_ERROR,param1.errorCode,param1.§_-5-l§));
         });
      }
      
      protected function hasAppPermission(param1:String, param2:Function, param3:Function) : void
      {
         var permission:String = param1;
         var successCallback:Function = param2;
         var errorCallback:Function = param3;
         this.callMethod("users.hasAppPermission",{"ext_perm":permission},function(param1:§_-9db§):void
         {
            var _loc2_:* = param1.§_-6Oe§();
            if(checkError(_loc2_,errorCallback))
            {
               successCallback(Boolean(_loc2_));
            }
         },function(param1:§_-4n-§):void
         {
            errorCallback(new §_-1KD§(§_-1KD§.NETWORK_ERROR,param1.errorCode,param1.§_-5-l§));
         });
      }
      
      override public function getPhotoAlbums(param1:Function, param2:Function) : void
      {
         var successCallback:Function = param1;
         var errorCallback:Function = param2;
         this.callMethod("photos.getAlbums",{},function(param1:§_-9db§):void
         {
            var _loc2_:* = param1.§_-6Oe§();
            if(checkError(_loc2_,errorCallback))
            {
               successCallback(parseAlbums(_loc2_["albums"]));
            }
         },function(param1:§_-4n-§):void
         {
            errorCallback(new §_-1KD§(§_-1KD§.NETWORK_ERROR,param1.errorCode,param1.§_-5-l§));
         });
      }
      
      override public function createPhotoAlbum(param1:§_-33z§, param2:Function, param3:Function) : void
      {
         var album:§_-33z§ = param1;
         var successCallback:Function = param2;
         var errorCallback:Function = param3;
         var params:Object = {
            "title":album.title,
            "type":§_-2y4§,
            "description":album.description
         };
         this.callMethod("photos.createAlbum",params,function(param1:§_-9db§):void
         {
            var _loc2_:* = param1.§_-6Oe§();
            if(checkError(_loc2_,errorCallback))
            {
               album.id = _loc2_ as String;
               successCallback(album);
            }
         },function(param1:§_-4n-§):void
         {
            errorCallback(new §_-1KD§(§_-1KD§.NETWORK_ERROR,param1.errorCode,param1.§_-5-l§));
         });
      }
      
      protected function parseAlbums(param1:Object) : Array
      {
         var _loc3_:Object = null;
         var _loc4_:§_-33z§ = null;
         var _loc2_:Array = [];
         var _loc5_:int = 0;
         var _loc6_:* = param1;
         for(; §§hasnext(_loc6_,_loc5_); _loc2_.push(_loc4_))
         {
            _loc3_ = §§nextvalue(_loc5_,_loc6_);
            _loc4_ = new §_-33z§();
            _loc4_.rawData = _loc3_;
            _loc4_.id = !!_loc3_.hasOwnProperty("aid") ? _loc3_["aid"] : "0";
            _loc4_.owner = !!_loc3_.hasOwnProperty("user_id") ? _loc3_["user_id"] : "0";
            _loc4_.title = !!_loc3_.hasOwnProperty("title") ? _loc3_["title"] : "";
            _loc4_.description = !!_loc3_.hasOwnProperty("description") ? _loc3_["description"] : "";
            if(!_loc3_.hasOwnProperty("type"))
            {
               continue;
            }
            switch(_loc3_["type"])
            {
               case §_-2y4§:
                  _loc4_.privacy = §_-8TU§;
                  break;
               case §_-2uz§:
                  _loc4_.privacy = §_-A31§;
                  break;
               default:
                  _loc4_.privacy = §_-8TU§;
                  break;
            }
         }
         return _loc2_;
      }
      
      public function checkError(param1:Object, param2:Function) : Boolean
      {
         if(param1 === null)
         {
            param2(new §_-1KD§(§_-1KD§.§_-7qk§,0,"JSON parse fault"));
            return false;
         }
         if(param1.hasOwnProperty("error_code"))
         {
            param2(new §_-1KD§(§_-1KD§.§_-7qk§,param1["error_code"],param1["error_msg"]));
            return false;
         }
         return true;
      }
      
      public function callMethod(param1:String, param2:Object, param3:Function, param4:Function) : void
      {
         param2["method"] = param1;
         this.sendRequest(param2,param3,param4);
      }
      
      protected function §_-3xc§(param1:Object) : Object
      {
         param1["format"] = §_-6hS§;
         param1["application_key"] = §_-5l3§;
         param1["call_id"] = !!param1.hasOwnProperty("call_id") ? param1["call_id"] : Math.round(Math.random() * 1000000);
         param1["session_key"] = this.§_-7QE§;
         return param1;
      }
      
      override protected function sendRequest(param1:Object, param2:Function, param3:Function, param4:String = null) : void
      {
         var parameters:Object = param1;
         var successCallback:Function = param2;
         var errorCallback:Function = param3;
         var urlOverride:String = param4;
         if(!this.§_-1V8§)
         {
            this.§_-2GB§.push(function():void
            {
               sendRequest(parameters,successCallback,errorCallback);
            });
            return;
         }
         parameters = this.§_-3xc§(parameters);
         parameters["sig"] = this.§_-1bO§(parameters);
         super.sendRequest(parameters,successCallback,errorCallback);
      }
      
      protected function §_-1bO§(param1:Object) : String
      {
         var _loc5_:String = null;
         var _loc6_:int = 0;
         var _loc2_:String = "";
         var _loc3_:* = §_-4r3§ + "?";
         var _loc4_:Array = [];
         for(_loc5_ in param1)
         {
            if(_loc5_ != "resig")
            {
               _loc3_ += _loc5_ + "=" + param1[_loc5_] + "&";
               _loc4_.push(_loc5_ + "=" + param1[_loc5_]);
            }
         }
         _loc4_.sort();
         _loc6_ = 0;
         while(_loc6_ < _loc4_.length)
         {
            _loc2_ += _loc4_[_loc6_];
            _loc6_++;
         }
         _loc2_ += this.§_-7ZV§;
         §_-3YE§.info("url: " + _loc3_ + "sig=" + MD5.hash(_loc2_).toLowerCase());
         return MD5.hash(_loc2_).toLowerCase();
      }
      
      public function prepareMidroll(param1:Function, param2:Function) : void
      {
         if(this.§_-5xr§)
         {
            this.§_-1yR§ = param1;
            this.§_-7yk§ = param2;
            this._jsBridge.prepareMidroll();
         }
      }
      
      public function showMidroll(param1:Function, param2:Function) : void
      {
         if(this.§_-5xr§)
         {
            this.§_-Bzn§ = param1;
            this.§_-7Pk§ = param2;
            this._jsBridge.showMidroll();
         }
      }
      
      override public function hasSocialFeature(param1:String) : Boolean
      {
         return [§_-0CY§,§_-35K§].indexOf(param1) >= 0;
      }
   }
}

