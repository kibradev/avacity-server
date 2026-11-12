package adept.social.fotostrana
{
   import §_-0uA§.§_-3YE§;
   import §_-1t9§.§_-33z§;
   import §_-1t9§.§_-4Wb§;
   import §_-1t9§.§_-4rn§;
   import §_-1t9§.§_-7Ys§;
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
   import §_-8a5§.§_-5r1§;
   import §_-Aq0§.§_-4n-§;
   import §_-Aq0§.§_-9db§;
   import §_-Aq0§.§_-Bs9§;
   import §_-Xm§.MultipartURLLoader;
   import flash.events.ErrorEvent;
   import flash.events.Event;
   import flash.system.Security;
   import flash.utils.ByteArray;
   
   public class §_-4YB§ extends §_-2qC§
   {
      public static const §_-69A§:String = "PUBLISH TO STREAM";
      
      public static const §_-2P7§:String = "EVENTS";
      
      public static const §_-1BX§:String = "SET STATUS";
      
      public static const §_-n4§:String = "EMAIL";
      
      public static const §_-8Be§:String = "user_name,user_lastname,sex,birthday,photo_97,city_id";
      
      public static const §_-0ST§:String = "authKey";
      
      public static const §_-4zO§:String = "apiConnection";
      
      public static const §_-0AS§:String = "isAppUser";
      
      public static const §_-2Ex§:String = "sessionKey";
      
      public static const §_-BmO§:String = "apiSettings";
      
      public static const §_-1it§:String = "hasNotifications";
      
      public static const §_-AxL§:String = "passwordCallback";
      
      public static const §_-C-L§:String = "paymentCallback";
      
      public static const §_-9Pn§:String = "productImgUrl";
      
      private static const §_-Al3§:String = "custevt";
      
      private var §_-7QE§:String = "";
      
      private var _apiConnection:String = "";
      
      private var §_-9sn§:Boolean = false;
      
      private var §_-Apv§:String = "";
      
      private var §_-1vv§:int = 0;
      
      private var §_-9gd§:Boolean = false;
      
      private var §_-1Mb§:String = null;
      
      private var §_-2XV§:String = null;
      
      private var _inited:Boolean = false;
      
      private var _initCallbacks:Array = [];
      
      private var _jsBridge:FotostranaJSBridge = null;
      
      private var §_-1qo§:String = null;
      
      public function §_-4YB§()
      {
         super();
      }
      
      override public function configure(param1:Object, param2:§_-6gH§) : void
      {
         §_-6hS§ = "json";
         super.configure(param1,param2);
         if(param1.hasOwnProperty(§_-2Ex§))
         {
            this.§_-7QE§ = param1[§_-2Ex§];
         }
         if(param1.hasOwnProperty(§_-4zO§))
         {
            this._apiConnection = param1[§_-4zO§];
         }
         if(param1.hasOwnProperty(§_-0AS§))
         {
            this.§_-9sn§ = param1[§_-0AS§];
         }
         if(param1.hasOwnProperty(§_-0ST§))
         {
            this.§_-Apv§ = param1[§_-0ST§];
         }
         if(param1.hasOwnProperty(§_-BmO§))
         {
            this.§_-1vv§ = param1[§_-BmO§];
         }
         if(param1.hasOwnProperty(§_-1it§))
         {
            this.§_-9gd§ = param1[§_-1it§];
         }
         if(param1.hasOwnProperty(§_-AxL§))
         {
            this.§_-1Mb§ = param1[§_-AxL§];
         }
         if(param1.hasOwnProperty(§_-C-L§))
         {
            this.§_-2XV§ = param1[§_-C-L§];
         }
         if(param1.hasOwnProperty(§_-9Pn§))
         {
            this.§_-1qo§ = param1[§_-9Pn§];
         }
         Security.allowDomain("*");
         this._jsBridge = new FotostranaJSBridge(_appId,this._apiConnection);
         this._jsBridge.init(this.§_-9Cl§);
         if(this.§_-1Mb§ == null || this.§_-1Mb§ == "")
         {
            this._inited = true;
            dispatchEvent(new §_-8L3§(§_-8L3§.§_-As9§));
         }
         else
         {
            this.§_-8t4§();
         }
      }
      
      private function §_-9Cl§(param1:§_-1KD§) : void
      {
         §_-3YE§.error("social error: " + param1.message);
      }
      
      override public function get socialNetwork() : String
      {
         return §_-8BS§.§_-614§;
      }
      
      private function §_-8t4§() : void
      {
         var request:§_-Bs9§ = new §_-Bs9§();
         request.url = this.§_-1Mb§;
         request.§_-0fS§({
            "sessionKey":this.§_-7QE§,
            "viewerId":_userId
         });
         request.addEventListener(§_-9db§.COMPLETE,function(param1:§_-9db§):void
         {
            var _loc3_:int = 0;
            var _loc4_:Function = null;
            var _loc2_:Object = param1.§_-6Oe§();
            if(_loc2_ == null || !_loc2_.hasOwnProperty("response") || _loc2_["response"] == "error")
            {
               §_-3YE§.error("Fetch password error: " + (_loc2_ != null ? §_-6aF§.toString(_loc2_,true) : "null"));
            }
            else
            {
               dispatchEvent(new §_-8L3§(§_-8L3§.§_-As9§));
               §_-6un§ = _loc2_["response"];
               _inited = true;
               _loc3_ = 0;
               while(_loc3_ < _initCallbacks.length)
               {
                  _loc4_ = _initCallbacks[_loc3_];
                  if(_loc4_ != null && _loc4_ is Function)
                  {
                     _loc4_();
                  }
                  _loc3_++;
               }
               _initCallbacks = [];
            }
         });
         request.addEventListener(§_-4n-§.HTTP_ERROR,function(param1:§_-4n-§):void
         {
            §_-3YE§.error("Fetch password http error");
         });
         request.send();
      }
      
      override public function isInstalled(param1:Array, param2:Function, param3:Function) : void
      {
         var permissions:Array = param1;
         var successCallback:Function = param2;
         var errorCallback:Function = param3;
         if(this._inited)
         {
            successCallback(this.§_-9sn§);
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
         var _loc4_:Array = null;
         if(this.§_-9sn§)
         {
            _loc4_ = §_-49j§.clone(param3);
            this.configureApp(_loc4_,param1,param2);
         }
      }
      
      override public function configureApp(param1:Array, param2:Function, param3:Function) : void
      {
         this._jsBridge.showPermissions();
      }
      
      override public function inviteUsers(param1:Array, param2:String, param3:Function, param4:Function) : void
      {
         var ids:Array = param1;
         var message:String = param2;
         var successCallback:Function = param3;
         var errorCallback:Function = param4;
         this._jsBridge.invite(message,function(param1:int, param2:Array):void
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
         this._jsBridge.showPaymentBox(purchase.serviceName,purchase.pointsPrice / §_-2Yo§,purchase.serviceId,purchase.exchangeRate,function(param1:String):void
         {
            var item:String = param1;
            if(item != purchase.serviceId)
            {
               return;
            }
            §_-3ge§(purchase.serviceId,function(param1:String):void
            {
               successCallback(param1);
            });
         },errorCallback,this.§_-1qo§);
      }
      
      private function §_-3ge§(param1:String, param2:Function) : void
      {
         var item:String = param1;
         var callback:Function = param2;
         var request:§_-Bs9§ = new §_-Bs9§();
         request.url = this.§_-2XV§;
         request.§_-0fS§({
            "userId":_userId,
            "item":item
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
            §_-3YE§.error("Fetch password http error");
         });
         request.send();
      }
      
      public function socialRequest(param1:§_-96c§, param2:Function, param3:Function) : void
      {
         var type:int;
         var socialMedia:§_-96c§ = param1;
         var successCallback:Function = param2;
         var errorCallback:Function = param3;
         var params:String = "";
         if(socialMedia.links.links.length > 0)
         {
            params = socialMedia.links.links["url"];
         }
         type = 2;
         this._jsBridge.sendMessages(socialMedia.description,type,params,true,function(param1:String):void
         {
            if(param1 != null && param1.split(",").length > 0 && successCallback != null)
            {
               successCallback();
            }
         });
      }
      
      public function §_-BHM§(param1:Function) : void
      {
         var checkCallback:Function = param1;
         if(!this.§_-9gd§)
         {
            checkCallback(false);
            return;
         }
         this._jsBridge.notifyPopup(true,function(param1:String):void
         {
            checkCallback(param1);
         });
      }
      
      public function postUserEventOnWall(param1:String, param2:String, param3:Function, param4:Function, param5:String = null, param6:String = null, param7:Array = null) : void
      {
         var text:String = param1;
         var imgUrl:String = param2;
         var successCallback:Function = param3;
         var errorCallback:Function = param4;
         var title:String = param5;
         var callToAction:String = param6;
         var urlParams:Array = param7;
         this._jsBridge.postUserEventOnWall(text,imgUrl,function(param1:String):void
         {
            successCallback();
         },function(param1:§_-1KD§):void
         {
            errorCallback(param1);
         },title,callToAction,urlParams);
      }
      
      override public function checkPermissions(param1:Array, param2:Function, param3:Function) : void
      {
         param2(true);
      }
      
      override public function get referrerType() : String
      {
         return "";
      }
      
      override public function get referrerId() : String
      {
         return "";
      }
      
      override public function getUserLink(param1:§_-4Wb§) : String
      {
         return "http://fotostrana.ru/user/" + param1.id;
      }
      
      override public function getAppLink(param1:String) : String
      {
         return "http://fotostrana.ru/app/" + param1;
      }
      
      override public function getUsersProfiles(param1:Array, param2:Function, param3:Function) : void
      {
         var params:Object;
         var uids:Array = param1;
         var successCallback:Function = param2;
         var errorCallback:Function = param3;
         if(uids.length == 0)
         {
            successCallback([]);
            return;
         }
         params = {
            "userIds":uids.join(","),
            "fields":§_-8Be§
         };
         this.callMethod("User.getProfiles",params,function(param1:§_-9db§):void
         {
            var _loc2_:* = param1.§_-6Oe§();
            if(checkError(_loc2_,errorCallback))
            {
               successCallback(parseProfiles(_loc2_["response"]));
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
         this.getUserFriendsIds(function(param1:Array):void
         {
            getUsersProfiles(param1,successCallback,errorCallback);
         },errorCallback);
      }
      
      override public function getUserFriendsIds(param1:Function, param2:Function) : void
      {
         var successCallback:Function = param1;
         var errorCallback:Function = param2;
         this.callMethod("User.getFriends",{},function(param1:§_-9db§):void
         {
            var _loc2_:* = param1.§_-6Oe§();
            if(checkError(_loc2_,errorCallback))
            {
               successCallback(_loc2_["response"]);
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
            getUsersProfiles(param1,successCallback,errorCallback);
         },errorCallback);
      }
      
      override public function getUserAppFriendsIds(param1:Function, param2:Function) : void
      {
         var successCallback:Function = param1;
         var errorCallback:Function = param2;
         this.callMethod("User.getAppFriends",{},function(param1:§_-9db§):void
         {
            var _loc2_:* = param1.§_-6Oe§();
            if(checkError(_loc2_,errorCallback))
            {
               successCallback(_loc2_["response"]);
            }
         },function(param1:§_-4n-§):void
         {
            errorCallback(new §_-1KD§(§_-1KD§.NETWORK_ERROR,param1.errorCode,param1.§_-5-l§));
         });
      }
      
      override public function getOfferList(param1:Function, param2:Function) : void
      {
         var successCallback:Function = param1;
         var errorCallback:Function = param2;
         this.getOfferUrl(function(param1:String):void
         {
            var url:String = param1;
            var request:§_-Bs9§ = new §_-Bs9§();
            request.url = url;
            request.addEventListener(§_-9db§.COMPLETE,function(param1:§_-9db§):void
            {
               var _loc2_:* = param1.§_-6Oe§();
               if(_loc2_ === null)
               {
                  errorCallback(new §_-1KD§(§_-1KD§.§_-7qk§,0,"JSON parse fault"));
               }
               else if(!_loc2_.hasOwnProperty("Status") || _loc2_["Status"] == "Error")
               {
                  errorCallback(new §_-1KD§(§_-1KD§.§_-7qk§,0,_loc2_["Misc"]));
               }
               else
               {
                  successCallback(parseOffers(_loc2_["Offers"]));
               }
            });
            request.addEventListener(§_-4n-§.HTTP_ERROR,function(param1:§_-4n-§):void
            {
               errorCallback(new §_-1KD§(§_-1KD§.NETWORK_ERROR,param1.errorCode,param1.§_-5-l§));
            });
            request.send();
         },errorCallback);
      }
      
      private function parseOffers(param1:Object) : Array
      {
         var _loc3_:Object = null;
         var _loc2_:Array = [];
         for each(_loc3_ in param1)
         {
            _loc2_.push(this.§_-39x§(_loc3_));
         }
         return _loc2_;
      }
      
      private function §_-39x§(param1:Object) : §_-7Ys§
      {
         var _loc2_:§_-7Ys§ = new §_-7Ys§();
         _loc2_.id = !!param1.hasOwnProperty("ID") ? param1["ID"] : null;
         _loc2_.title = !!param1.hasOwnProperty("Name") ? param1["Name"] : null;
         _loc2_.description = !!param1.hasOwnProperty("Description") ? param1["Description"] : null;
         _loc2_.reward = !!param1.hasOwnProperty("VCReceive") ? param1["VCReceive"] : null;
         _loc2_.points = !!param1.hasOwnProperty("VCPayout") ? int(Math.floor(Number(param1["VCPayout"]) * §_-2Yo§)) : 0;
         _loc2_.time = !!param1.hasOwnProperty("AvgTime") ? param1["AvgTime"] : null;
         _loc2_.url = !!param1.hasOwnProperty("URL") ? param1["URL"] : null;
         _loc2_.type = !!param1.hasOwnProperty("Type") ? (int(param1["Type"]) == 0 ? §_-7Ys§.§_-3rw§ : §_-7Ys§.§_-46A§) : §_-7Ys§.§_-8wv§;
         _loc2_.imgUrl = !!param1.hasOwnProperty("Banner") ? param1["Banner"] : null;
         return _loc2_;
      }
      
      private function getOfferUrl(param1:Function, param2:Function) : void
      {
         var successCallback:Function = param1;
         var errorCallback:Function = param2;
         this.callMethod("User.getOfferUrl",{"userId":_userId},function(param1:§_-9db§):void
         {
            var _loc2_:* = param1.§_-6Oe§();
            if(checkError(_loc2_,errorCallback))
            {
               successCallback(_loc2_["response"]["url"]);
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
         this.callMethod("UsephotoExternal.albums",{"userId":_userId},function(param1:§_-9db§):void
         {
            var _loc2_:* = param1.§_-6Oe§();
            if(checkError(_loc2_,errorCallback))
            {
               successCallback(parseAlbums(_loc2_["response"]));
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
            "userId":_userId,
            "name":album.title,
            "description":album.description
         };
         this.callMethod("UsephotoExternal.addAlbum",params,function(param1:§_-9db§):void
         {
            var _loc2_:* = param1.§_-6Oe§();
            if(checkError(_loc2_,errorCallback))
            {
               album.id = _loc2_["response"];
               successCallback(album);
            }
         },function(param1:§_-4n-§):void
         {
            errorCallback(new §_-1KD§(§_-1KD§.NETWORK_ERROR,param1.errorCode,param1.§_-5-l§));
         });
      }
      
      private function parseAlbums(param1:Object) : Array
      {
         var _loc3_:Object = null;
         var _loc4_:§_-33z§ = null;
         var _loc2_:Array = [];
         for each(_loc3_ in param1)
         {
            _loc4_ = new §_-33z§();
            _loc4_.rawData = _loc3_;
            _loc4_.id = !!_loc3_.hasOwnProperty("album_id") ? _loc3_["album_id"] : null;
            _loc4_.owner = !!_loc3_.hasOwnProperty("album_user_id") ? _loc3_["album_user_id"] : null;
            _loc4_.title = !!_loc3_.hasOwnProperty("album_name") ? _loc3_["album_name"] : null;
            _loc4_.description = !!_loc3_.hasOwnProperty("album_description") ? _loc3_["album_description"] : null;
            _loc4_.thumb = !!_loc3_.hasOwnProperty("main_image_url") ? _loc3_["main_image_url"] : null;
            _loc2_.push(_loc4_);
         }
         return _loc2_;
      }
      
      override public function isAllowSocialMedia(param1:String) : Boolean
      {
         return [§_-96c§.§_-Anq§,§_-96c§.§_-9IO§,§_-96c§.§_-6SG§].indexOf(param1) >= 0;
      }
      
      override public function prepareSocialMedia(param1:§_-96c§, param2:Function, param3:Function) : void
      {
         param2(param1);
      }
      
      override public function publishSocialMedia(param1:§_-96c§, param2:Function, param3:Function) : void
      {
         if(param1.type == §_-96c§.§_-Anq§)
         {
            this.postUserEventOnWall(param1.description,param1.photoUrl,param2,param3,param1.title);
         }
         else if(param1.type == §_-96c§.§_-9IO§)
         {
            this.§_-9ZJ§(param1,param2,param3);
         }
         else if(param1.type == §_-96c§.§_-4Ir§)
         {
            this.§_-55Q§(param1,param2,param3);
         }
         else if(param1.type == §_-96c§.§_-6SG§)
         {
            this.socialRequest(param1,param2,param3);
         }
      }
      
      private function §_-9ZJ§(param1:§_-96c§, param2:Function, param3:Function) : void
      {
         var multipartUrlUploader:MultipartURLLoader;
         var secretString:String;
         var key:String = null;
         var signature:String = null;
         var socialMedia:§_-96c§ = param1;
         var successCallback:Function = param2;
         var errorCallback:Function = param3;
         var parameters:Object = {};
         parameters["method"] = "UsephotoExternal.upload";
         parameters["albumId"] = socialMedia.targetAlbumId;
         parameters["description"] = socialMedia.description;
         parameters = this.§_-3xc§(parameters);
         multipartUrlUploader = new MultipartURLLoader();
         multipartUrlUploader.§_-AhL§(socialMedia.§_-8B§,"photo.jpg","foto-img");
         secretString = _userId;
         for(key in parameters)
         {
            multipartUrlUploader.§_-2PD§(key,parameters[key]);
            secretString += key + "=" + parameters[key];
         }
         secretString += "Filename=photo.jpgUpload=Submit Query" + §_-5l3§;
         signature = MD5.hash(secretString).toLowerCase();
         multipartUrlUploader.§_-2PD§("sig",signature);
         multipartUrlUploader.addEventListener(Event.COMPLETE,function(param1:Event):void
         {
            var _loc2_:§_-5r1§ = new §_-5r1§(MultipartURLLoader(param1.currentTarget).loader.data as String);
            var _loc3_:Object = _loc2_.getValue();
            if(checkError(_loc3_,errorCallback))
            {
               successCallback();
            }
         });
         multipartUrlUploader.addEventListener(ErrorEvent.ERROR,function(param1:Event):void
         {
            errorCallback(new §_-1KD§(§_-1KD§.NETWORK_ERROR));
         });
         multipartUrlUploader.load(§_-4r3§);
      }
      
      private function §_-55Q§(param1:§_-96c§, param2:Function, param3:Function) : void
      {
         var params:Object;
         var socialMedia:§_-96c§ = param1;
         var successCallback:Function = param2;
         var errorCallback:Function = param3;
         if(connector.serverTonnel == null)
         {
            return;
         }
         params = {};
         params["userId"] = userId;
         params["sessionKey"] = this.§_-7QE§;
         params["text"] = socialMedia.description;
         params["title"] = socialMedia.title;
         params["image"] = socialMedia.photoUrl;
         params["urlParams"] = socialMedia.links != null && socialMedia.links.links.length > 0 ? socialMedia.links.links[0]["url"] : "";
         connector.serverTonnel.sendCustomCommand(§_-Al3§,params,function(param1:Object):void
         {
            if(Boolean(param1.hasOwnProperty("success")) && param1["success"] == 1)
            {
               successCallback();
            }
            else
            {
               errorCallback(new §_-1KD§(§_-1KD§.§_-7qk§,-1,!!param1.hasOwnProperty("error") ? param1["error"] : ""));
            }
         });
      }
      
      private function parseProfiles(param1:Object) : Array
      {
         var _loc3_:Object = null;
         var _loc4_:§_-4Wb§ = null;
         var _loc2_:Array = [];
         for each(_loc3_ in param1)
         {
            _loc4_ = new §_-4Wb§();
            _loc4_.rawData = _loc3_;
            _loc4_.id = !!_loc3_.hasOwnProperty("user_id") ? _loc3_["user_id"] : null;
            _loc4_.firstName = !!_loc3_.hasOwnProperty("user_name") ? §_-7uH§.§_-Bgy§(_loc3_["user_name"],50,"") : null;
            _loc4_.lastName = !!_loc3_.hasOwnProperty("user_lastname") ? §_-7uH§.§_-Bgy§(_loc3_["user_lastname"],50,"") : null;
            if(_loc3_.hasOwnProperty("sex"))
            {
               _loc4_.gender = _loc3_["sex"] == "m" ? uint(§_-4Wb§.§_-dv§) : uint(§_-4Wb§.§_-BYe§);
            }
            if(_loc3_.hasOwnProperty("birthday"))
            {
               _loc4_.birthday = this.§_-ADK§(_loc3_["birthday"]);
            }
            _loc4_.photoUrl = !!_loc3_.hasOwnProperty("photo_97") ? _loc3_["photo_97"] : null;
            _loc4_.§_-5pW§ = _loc4_.photoUrl != null;
            _loc4_.cityId = !!_loc3_.hasOwnProperty("city_id") ? uint(_loc3_["city_id"]) : 0;
            _loc2_.push(_loc4_);
         }
         return _loc2_;
      }
      
      private function §_-ADK§(param1:String) : String
      {
         var _loc3_:Date = null;
         var _loc2_:Array = param1.split("-");
         if(_loc2_.length == 3)
         {
            _loc3_ = new Date();
            _loc3_.setFullYear(_loc2_[0],_loc2_[1],_loc2_[2]);
            _loc3_.setHours(0);
            _loc3_.setMinutes(0);
            _loc3_.setSeconds(0);
            _loc3_.setMilliseconds(0);
            return String(Math.round(_loc3_.getTime() / 1000));
         }
         return "";
      }
      
      private function checkError(param1:Object, param2:Function) : Boolean
      {
         if(param1 === null)
         {
            param2(new §_-1KD§(§_-1KD§.§_-7qk§,0,"JSON parse fault"));
            return false;
         }
         if(param1.hasOwnProperty("error"))
         {
            param2(new §_-1KD§(§_-1KD§.§_-7qk§,param1["error"]["error_code"],param1["error"]["error_msg"]));
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
         param1["appId"] = _appId;
         param1["timestamp"] = Math.round(new Date().getTime() / 1000);
         param1["rand"] = Math.round(Math.random() * 999999);
         param1["format"] = 1;
         return param1;
      }
      
      override protected function sendRequest(param1:Object, param2:Function, param3:Function, param4:String = null) : void
      {
         param1 = this.§_-3xc§(param1);
         param1["sig"] = this.§_-1bO§(param1);
         super.sendRequest(param1,param2,param3);
      }
      
      protected function §_-1bO§(param1:Object, param2:Boolean = true) : String
      {
         var _loc5_:String = null;
         var _loc3_:String = _userId;
         var _loc4_:Array = [];
         for(_loc5_ in param1)
         {
            _loc4_.push(_loc5_ + "=" + param1[_loc5_]);
         }
         if(param2)
         {
            _loc4_.sort();
         }
         _loc3_ += _loc4_.join("");
         _loc3_ += §_-5l3§;
         var _loc6_:String = MD5.hash(_loc3_).toLowerCase();
         §_-3YE§.info("url: " + §_-4r3§ + "?" + _loc4_.join("&") + "&sig=" + _loc6_);
         return _loc6_;
      }
      
      private function §_-0iW§(param1:String) : String
      {
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeMultiByte(param1,"windows-1251");
         _loc2_.position = 0;
         return _loc2_.toString();
      }
   }
}

