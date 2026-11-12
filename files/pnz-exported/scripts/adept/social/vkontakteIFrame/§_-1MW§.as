package adept.social.vkontakteIFrame
{
   import §_-1t9§.§_-33z§;
   import §_-1t9§.§_-4Wb§;
   import §_-1t9§.§_-4rn§;
   import §_-1t9§.§_-7ba§;
   import §_-1t9§.§_-96c§;
   import §_-6BB§.§_-1KD§;
   import §_-6BB§.§_-2qC§;
   import §_-6BB§.§_-6gH§;
   import §_-6BB§.§_-8BS§;
   import §_-6BB§.§_-8L3§;
   import §_-8a5§.§_-5r1§;
   import §_-Aq0§.§_-4n-§;
   import §_-Aq0§.§_-9db§;
   import §_-Xm§.MultipartURLLoader;
   import flash.events.ErrorEvent;
   import flash.events.Event;
   import flash.net.URLRequest;
   import flash.net.navigateToURL;
   
   public class §_-1MW§ extends §_-2qC§
   {
      public static const §_-471§:uint = 1;
      
      public static const §_-2dF§:uint = 2;
      
      public static const §_-0bM§:uint = 4;
      
      public static const §_-6jv§:String = "testMode";
      
      public static const §_-Bkt§:String = "sid";
      
      public static const §_-0AS§:String = "isAppUser";
      
      public static const §_-7J5§:String = "settings";
      
      public static const §_-wH§:String = "referrer";
      
      public static const §_-3rl§:String = "ownerId";
      
      public static const §_-4pK§:String = "access_token";
      
      private static const §_-ASH§:String = "group";
      
      public static const §_-3yx§:String = "#";
      
      public static const §_-sj§:String = "-";
      
      protected static const §_-8Be§:String = "first_name,last_name,nickname,sex,bdate,city,country,timezone,photo,photo_medium,photo_big,has_mobile,rate";
      
      private static const §_-K-§:Object = {
         1:"RU",
         2:"UA",
         3:"BY",
         4:"KZ",
         5:"AZ",
         6:"AM",
         7:"GE",
         8:"IL",
         9:"US",
         10:"CA",
         12:"LV",
         13:"LT",
         14:"EE",
         15:"MD"
      };
      
      protected var §_-6dO§:Boolean = false;
      
      protected var _sid:String = "";
      
      protected var §_-9sn§:Boolean = false;
      
      protected var §_-57E§:int = 0;
      
      protected var §_-7ZX§:String = null;
      
      protected var §_-5so§:String = null;
      
      protected var §_-4hn§:int = 0;
      
      protected var _userProfile:§_-4Wb§ = null;
      
      protected var §_-0dO§:String = null;
      
      private var _jsBridge:VkontakteJSBridge = null;
      
      private var _initCallbacks:Array = [];
      
      public function §_-1MW§()
      {
         super();
      }
      
      override public function configure(param1:Object, param2:§_-6gH§) : void
      {
         §_-9Kq§ = "5.131";
         §_-6hS§ = "JSON";
         super.configure(param1,param2);
         §_-4r3§ = "https://api.vk.ru/method";
         if(param1.hasOwnProperty(§_-6jv§))
         {
            this.§_-6dO§ = param1[§_-6jv§];
         }
         if(param1.hasOwnProperty(§_-Bkt§))
         {
            this._sid = param1[§_-Bkt§];
         }
         if(param1.hasOwnProperty(§_-0AS§))
         {
            this.§_-9sn§ = param1[§_-0AS§];
         }
         if(param1.hasOwnProperty(§_-7J5§))
         {
            this.§_-57E§ = param1[§_-7J5§];
         }
         if(param1.hasOwnProperty(§_-wH§))
         {
            this.§_-7ZX§ = param1[§_-wH§];
         }
         if(param1.hasOwnProperty(§_-3rl§))
         {
            this.§_-5so§ = param1[§_-3rl§];
         }
         if(param1.hasOwnProperty(§_-ASH§))
         {
            this.§_-4hn§ = param1[§_-ASH§];
         }
         if(param1.hasOwnProperty(§_-4pK§))
         {
            this.§_-0dO§ = param1[§_-4pK§];
         }
         this._jsBridge = new VkontakteJSBridge();
         this._jsBridge.init(this.§_-ANT§,§_-9Kq§);
      }
      
      private function §_-ANT§() : void
      {
         this.init();
      }
      
      private function init() : void
      {
         var _loc1_:Function = null;
         for each(_loc1_ in this._initCallbacks)
         {
            _loc1_();
         }
         this._initCallbacks = [];
         dispatchEvent(new §_-8L3§(§_-8L3§.§_-As9§));
      }
      
      override public function get socialNetwork() : String
      {
         return §_-8BS§.§_-BS7§;
      }
      
      override public function installApp(param1:Function, param2:Function, param3:Array = null) : void
      {
         var settings:uint = 0;
         var successCallback:Function = param1;
         var errorCallback:Function = param2;
         var permissions:Array = param3;
         if(!this._jsBridge.inited)
         {
            errorCallback(new §_-1KD§(§_-1KD§.§_-79y§));
            return;
         }
         settings = permissions != null ? this.§_-8kd§(permissions) : 0;
         if(this.§_-9sn§ && settings != 0 && (this.§_-57E§ & settings) == settings)
         {
            successCallback();
            return;
         }
         if(this.§_-9sn§ && settings != 0 && (this.§_-57E§ & settings) != settings)
         {
            this.configureApp(permissions,successCallback,errorCallback);
            return;
         }
         this._jsBridge.showInstallBox(function():void
         {
            §_-9sn§ = true;
            if(settings != 0 && (§_-57E§ & settings) != settings)
            {
               configureApp(permissions,successCallback,errorCallback);
            }
            else
            {
               successCallback();
            }
         });
      }
      
      override public function configureApp(param1:Array, param2:Function, param3:Function) : void
      {
         var permissions:Array = param1;
         var successCallback:Function = param2;
         var errorCallback:Function = param3;
         if(!this._jsBridge.inited)
         {
            errorCallback(new §_-1KD§(§_-1KD§.§_-79y§));
            return;
         }
         this._jsBridge.showSettingsBox(this.§_-8kd§(permissions),function(param1:uint):void
         {
            §_-57E§ = param1;
            successCallback();
         });
      }
      
      override public function inviteUsers(param1:Array, param2:String, param3:Function, param4:Function) : void
      {
         if(!this._jsBridge.inited)
         {
            param4(new §_-1KD§(§_-1KD§.§_-79y§));
            return;
         }
         this._jsBridge.showInviteBox();
      }
      
      override public function showPaymentBox(param1:§_-4rn§, param2:Function, param3:Function) : void
      {
         var purchase:§_-4rn§ = param1;
         var successCallback:Function = param2;
         var errorCallback:Function = param3;
         if(!this._jsBridge.inited)
         {
            errorCallback(new §_-1KD§(§_-1KD§.§_-79y§,0,"Api not ready"));
            return;
         }
         this._jsBridge.showPaymentBox(purchase.serviceId,function(param1:uint):void
         {
            successCallback(param1);
         },errorCallback);
      }
      
      public function §_-41W§(param1:String, param2:Function, param3:Function) : void
      {
         var transactionId:String = param1;
         var successCallback:Function = param2;
         var errorCallback:Function = param3;
         if(!this._jsBridge.inited)
         {
            errorCallback(new §_-1KD§(§_-1KD§.§_-79y§,0,"Api not ready"));
            return;
         }
         this._jsBridge.§_-41W§(transactionId,function(param1:uint):void
         {
            successCallback(param1);
         },errorCallback);
      }
      
      override public function isInstalled(param1:Array, param2:Function, param3:Function) : void
      {
         var settings:int;
         var permissions:Array = param1;
         var successCallback:Function = param2;
         var errorCallback:Function = param3;
         if(!this._jsBridge.inited)
         {
            this._initCallbacks.push(function():void
            {
               isInstalled(permissions,successCallback,errorCallback);
            });
            return;
         }
         if(permissions.length == 0)
         {
            successCallback(this.§_-9sn§);
            return;
         }
         settings = int(this.§_-8kd§(permissions));
         successCallback(this.§_-9sn§ && (this.§_-57E§ & settings) == settings);
      }
      
      override public function checkPermissions(param1:Array, param2:Function, param3:Function) : void
      {
         var permissions:Array = param1;
         var successCallback:Function = param2;
         var errorCallback:Function = param3;
         var settings:uint = this.§_-8kd§(permissions);
         if((this.§_-57E§ & settings) != settings)
         {
            this.configureApp(permissions,function():void
            {
               successCallback(true);
            },function():void
            {
               successCallback(false);
            });
            return;
         }
         successCallback(true);
      }
      
      private function §_-8kd§(param1:Array) : uint
      {
         var _loc3_:String = null;
         var _loc2_:uint = 0;
         for each(_loc3_ in param1)
         {
            switch(_loc3_)
            {
               case §_-2qC§.PERMISSION_FRIENDS:
                  _loc2_ += §_-2dF§;
                  break;
               case §_-2qC§.PERMISSION_PHOTO:
                  _loc2_ += §_-0bM§;
                  break;
            }
         }
         return _loc2_;
      }
      
      private function §_-CGc§(param1:uint) : Array
      {
         var _loc2_:Array = [];
         if((param1 & §_-471§) == §_-471§)
         {
            _loc2_.push(§_-2qC§.PERMISSION_NOTIFY);
         }
         if((param1 & §_-2dF§) == §_-2dF§)
         {
            _loc2_.push(§_-2qC§.PERMISSION_FRIENDS);
         }
         if((param1 & §_-0bM§) == §_-0bM§)
         {
            _loc2_.push(§_-2qC§.PERMISSION_PHOTO);
         }
         return _loc2_;
      }
      
      override public function get referrerType() : String
      {
         if(this.§_-7ZX§ == null || this.§_-7ZX§ == "")
         {
            return this.§_-5so§ == _userId ? "" : §_-2qC§.REFERRER_USER;
         }
         if(this.§_-7ZX§.toLowerCase().indexOf("request") != -1)
         {
            return §_-2qC§.REFERRER_USER;
         }
         if(this.§_-7ZX§.toLowerCase().indexOf("notification") != -1)
         {
            return §_-2qC§.REFERRER_NOTIFICATION;
         }
         if(this.§_-7ZX§.toLowerCase().indexOf("ad_") == 0)
         {
            if(this.§_-7ZX§.toLowerCase().indexOf("wall-") != -1)
            {
               return §_-2qC§.REFERRER_WALL;
            }
            return §_-2qC§.REFERRER_AD;
         }
         if(this.§_-7ZX§.toLowerCase().indexOf("group") == 0)
         {
            return §_-2qC§.REFERRER_GROUP;
         }
         if(this.§_-7ZX§.toLowerCase().indexOf("wall-") != -1)
         {
            return §_-2qC§.REFERRER_WALL;
         }
         if(this.§_-7ZX§.toLowerCase().indexOf("action_") != -1)
         {
            return §_-2qC§.REFERRER_ACTION;
         }
         return this.§_-7ZX§;
      }
      
      override public function get referrerId() : String
      {
         if(this.referrerType == §_-2qC§.REFERRER_USER)
         {
            return this.§_-5so§;
         }
         if(this.referrerType == §_-2qC§.REFERRER_WALL)
         {
            return this.§_-7ZX§.substring(this.§_-7ZX§.indexOf("wall-") + 5);
         }
         if(this.referrerType == §_-2qC§.REFERRER_AD)
         {
            return this.§_-7ZX§.substring(this.§_-7ZX§.indexOf("_") + 1);
         }
         if(this.referrerType == §_-2qC§.REFERRER_GROUP)
         {
            return String(this.§_-4hn§);
         }
         if(this.referrerType == §_-2qC§.REFERRER_ACTION)
         {
            return this.§_-7ZX§.substring(this.§_-7ZX§.indexOf("_") + 1);
         }
         return "";
      }
      
      override public function navigateToGroup(param1:String) : void
      {
         navigateToURL(new URLRequest("http://vk.ru/club" + param1),"_blank");
      }
      
      override public function getUserLink(param1:§_-4Wb§) : String
      {
         return "http://vk.ru/id" + param1.id;
      }
      
      override public function getAppLink(param1:String) : String
      {
         return "http://vk.ru/app" + param1;
      }
      
      public function socialRequest(param1:§_-96c§, param2:Function, param3:Function) : void
      {
         var socialMedia:§_-96c§ = param1;
         var successCallback:Function = param2;
         var errorCallback:Function = param3;
         this._jsBridge.showRequestBox(socialMedia.targetUserId,socialMedia.description,socialMedia.id,successCallback,function(param1:Boolean):void
         {
            if(param1)
            {
               errorCallback(new §_-1KD§(§_-1KD§.§_-9cu§,-1,"Cancel user request"));
            }
            else
            {
               errorCallback(new §_-1KD§(§_-1KD§.§_-7qk§,-1,"Error user request"));
            }
         });
      }
      
      override public function createNavigationLink(param1:String, param2:String, param3:String, param4:String) : String
      {
         var _loc5_:* = this.getAppLink(param1) + §_-3yx§ + §_-9P9§ + §_-sj§ + param2 + "[" + param3 + "]";
         if(param4 != null)
         {
            _loc5_ += §_-06E§ + param4;
         }
         return _loc5_;
      }
      
      override public function isAllowSocialMedia(param1:String) : Boolean
      {
         return [§_-96c§.§_-9IO§,§_-96c§.§_-6SG§].indexOf(param1) >= 0;
      }
      
      override public function prepareSocialMedia(param1:§_-96c§, param2:Function, param3:Function) : void
      {
         var socialMedia:§_-96c§ = param1;
         var callback:Function = param2;
         var errorCallback:Function = param3;
         if(socialMedia.type == "")
         {
            errorCallback(new §_-1KD§(§_-1KD§.§_-7qk§,-1,"Social media type not defined"));
            return;
         }
         switch(socialMedia.type)
         {
            case §_-96c§.§_-6SG§:
               callback(socialMedia);
               break;
            case §_-96c§.§_-9IO§:
               if(socialMedia.targetAlbumId == "")
               {
                  errorCallback(new §_-1KD§(§_-1KD§.§_-7qk§,-1,"Wrong albums id"));
                  break;
               }
               this.getUploadPhotoServer(socialMedia.targetAlbumId,function(param1:Object):void
               {
                  if(param1.hasOwnProperty("upload_url"))
                  {
                     socialMedia.uploadServer = param1["upload_url"];
                     callback(socialMedia);
                  }
                  else
                  {
                     errorCallback(new §_-1KD§(§_-1KD§.§_-7qk§,-1,"Upload url not found"));
                  }
               },errorCallback);
               break;
         }
      }
      
      override public function publishSocialMedia(param1:§_-96c§, param2:Function, param3:Function) : void
      {
         var multipartUrlUploader:MultipartURLLoader;
         var socialMedia:§_-96c§ = param1;
         var callback:Function = param2;
         var errorCallback:Function = param3;
         if(socialMedia.type == §_-96c§.§_-6SG§)
         {
            this.socialRequest(socialMedia,callback,errorCallback);
            return;
         }
         if(socialMedia.uploadServer == null)
         {
            errorCallback(new §_-1KD§(§_-1KD§.§_-7qk§,-1,"Upload server is null"));
            return;
         }
         multipartUrlUploader = new MultipartURLLoader();
         multipartUrlUploader.§_-AhL§(socialMedia.§_-8B§,"photo.jpg","file1");
         multipartUrlUploader.addEventListener(Event.COMPLETE,function(param1:Event):void
         {
            var decoder:§_-5r1§ = null;
            var response:Object = null;
            var server:String = null;
            var photosList:String = null;
            var aid:String = null;
            var hash:String = null;
            var event:Event = param1;
            try
            {
               decoder = new §_-5r1§(MultipartURLLoader(event.currentTarget).loader.data as String);
               response = decoder.getValue();
               server = !!response.hasOwnProperty("server") ? response["server"] : "";
               photosList = !!response.hasOwnProperty("photos_list") ? response["photos_list"] : "";
               aid = !!response.hasOwnProperty("aid") ? response["aid"] : "";
               hash = !!response.hasOwnProperty("hash") ? response["hash"] : "";
               if(socialMedia.type == §_-96c§.§_-9IO§)
               {
                  if(server.length == 0 || photosList.length == 0 || aid.length == 0 || hash.length == 0)
                  {
                     errorCallback(new §_-1KD§(§_-1KD§.NETWORK_ERROR,0,"Album post error:" + " server.length:" + server.length + " photosList.length:" + photosList.length + " aid.length:" + aid.length + " hash.length:" + hash.length));
                     return;
                  }
                  §_-9TP§(aid,server,photosList,hash,socialMedia.description,callback,errorCallback);
               }
            }
            catch(error:Error)
            {
               errorCallback(new §_-1KD§(§_-1KD§.NETWORK_ERROR,error.errorID,error.message));
            }
         });
         multipartUrlUploader.addEventListener(ErrorEvent.ERROR,function(param1:ErrorEvent):void
         {
            errorCallback(new §_-1KD§(§_-1KD§.NETWORK_ERROR,param1.errorID,param1.toString()));
         });
         multipartUrlUploader.load(socialMedia.uploadServer);
      }
      
      private function §_-9TP§(param1:String, param2:String, param3:String, param4:String, param5:String, param6:Function, param7:Function) : void
      {
         var albumId:String = param1;
         var server:String = param2;
         var photos_list:String = param3;
         var hash:String = param4;
         var description:String = param5;
         var successCallback:Function = param6;
         var errorCallback:Function = param7;
         var params:Object = {
            "album_id":albumId,
            "server":server,
            "photos_list":photos_list,
            "hash":hash,
            "caption":description
         };
         this.callMethod("photos.save",params,function(param1:§_-9db§):void
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
      
      private function saveWallPhoto(param1:String, param2:String, param3:String, param4:String, param5:String, param6:String, param7:Function, param8:Function) : void
      {
         var server:String = param1;
         var photo:String = param2;
         var hash:String = param3;
         var wallId:String = param4;
         var message:String = param5;
         var link:String = param6;
         var successCallback:Function = param7;
         var errorCallback:Function = param8;
         var photoParams:Object = {
            "server":server,
            "photo":photo,
            "hash":hash
         };
         if(wallId != _userId)
         {
            photoParams["user_id"] = wallId;
         }
         this.callMethod("photos.saveWallPhoto",photoParams,function(param1:§_-9db§):void
         {
            var params:Object = null;
            var event:§_-9db§ = param1;
            var photoJson:* = event.§_-6Oe§();
            if(checkError(photoJson,errorCallback))
            {
               if(link == null)
               {
                  link = getAppLink(appId);
               }
               params = {
                  "attachments":"photo" + wallId + "_" + photoJson["response"][0]["id"] + "," + link,
                  "owner_id":wallId,
                  "message":message
               };
               _jsBridge.callApiMethod("wall.post",params,function(param1:Object):void
               {
                  successCallback();
               },function(param1:Object):void
               {
                  if(!checkError(param1,errorCallback))
                  {
                     return;
                  }
               });
            }
         },function(param1:§_-4n-§):void
         {
            errorCallback(new §_-1KD§(§_-1KD§.NETWORK_ERROR,param1.errorCode,param1.§_-5-l§));
         });
      }
      
      public function §_-BeH§(param1:String, param2:Function, param3:Function) : void
      {
         var link:String = param1;
         var successCallback:Function = param2;
         var errorCallback:Function = param3;
         this._jsBridge.callApiMethod("leads.metricHit",{"data":link},function(param1:Object):void
         {
            successCallback();
         },function(param1:Object):void
         {
            if(!checkError(param1,errorCallback))
            {
               return;
            }
         });
      }
      
      public function getWallUploadServer(param1:Function, param2:Function) : void
      {
         var successCallback:Function = param1;
         var errorCallback:Function = param2;
         this.checkPermissions([§_-2qC§.PERMISSION_PHOTO],function(param1:Boolean):void
         {
            var result:Boolean = param1;
            if(result)
            {
               callMethod("photos.getWallUploadServer",{},function(param1:§_-9db§):void
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
         },errorCallback);
      }
      
      override public function getUploadPhotoServer(param1:String, param2:Function, param3:Function) : void
      {
         var albumId:String = param1;
         var successCallback:Function = param2;
         var errorCallback:Function = param3;
         this.checkPermissions([§_-2qC§.PERMISSION_PHOTO],function(param1:Boolean):void
         {
            var params:Object = null;
            var result:Boolean = param1;
            if(result)
            {
               params = {"album_id":albumId};
               callMethod("photos.getUploadServer",params,function(param1:§_-9db§):void
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
         },errorCallback);
      }
      
      override public function createPhotoAlbum(param1:§_-33z§, param2:Function, param3:Function) : void
      {
         var album:§_-33z§ = param1;
         var successCallback:Function = param2;
         var errorCallback:Function = param3;
         var params:Object = {
            "title":album.title,
            "description":album.description
         };
         this.callMethod("photos.createAlbum",params,function(param1:§_-9db§):void
         {
            var _loc2_:* = param1.§_-6Oe§();
            if(checkError(_loc2_,errorCallback))
            {
               successCallback(parseAlbums([_loc2_["response"]])[0]);
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
         this.checkPermissions([§_-2qC§.PERMISSION_PHOTO],function(param1:Boolean):void
         {
            var result:Boolean = param1;
            if(result)
            {
               callMethod("photos.getAlbums",{},function(param1:§_-9db§):void
               {
                  var _loc2_:* = param1.§_-6Oe§();
                  if(checkError(_loc2_,errorCallback))
                  {
                     successCallback(parseAlbums(_loc2_["response"]["items"]));
                  }
               },function(param1:§_-4n-§):void
               {
                  errorCallback(new §_-1KD§(§_-1KD§.NETWORK_ERROR,param1.errorCode,param1.§_-5-l§));
               });
            }
         },errorCallback);
      }
      
      protected function parseAlbums(param1:Object) : Array
      {
         var _loc3_:Object = null;
         var _loc4_:§_-33z§ = null;
         var _loc2_:Array = [];
         for each(_loc3_ in param1)
         {
            _loc4_ = new §_-33z§();
            _loc4_.rawData = _loc3_;
            _loc4_.id = !!_loc3_.hasOwnProperty("id") ? _loc3_["id"] : "0";
            _loc4_.title = !!_loc3_.hasOwnProperty("title") ? _loc3_["title"] : "";
            _loc4_.description = !!_loc3_.hasOwnProperty("description") ? _loc3_["description"] : "";
            _loc4_.owner = !!_loc3_.hasOwnProperty("owner_id") ? _loc3_["owner_id"] : "";
            _loc2_.push(_loc4_);
         }
         return _loc2_;
      }
      
      override public function getUsersProfiles(param1:Array, param2:Function, param3:Function) : void
      {
         var uids:Array = param1;
         var successCallback:Function = param2;
         var errorCallback:Function = param3;
         var params:Object = {
            "user_ids":uids.join(","),
            "fields":§_-8Be§
         };
         this.callMethod("users.get",params,function(param1:§_-9db§):void
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
         var params:Object = {"fields":§_-8Be§};
         this.callMethod("friends.get",params,function(param1:§_-9db§):void
         {
            var _loc2_:* = param1.§_-6Oe§();
            if(checkError(_loc2_,errorCallback))
            {
               successCallback(parseProfiles(_loc2_["response"]["items"] as Array));
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
         this.callMethod("friends.get",{},function(param1:§_-9db§):void
         {
            var _loc2_:* = param1.§_-6Oe§();
            if(checkError(_loc2_,errorCallback))
            {
               successCallback(_loc2_["response"] as Array);
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
            var userIds:Array = param1;
            callMethod("users.get",{
               "user_ids":userIds.join(","),
               "fields":§_-8Be§
            },function(param1:§_-9db§):void
            {
               var _loc2_:* = param1.§_-6Oe§();
               if(checkError(_loc2_,errorCallback))
               {
                  successCallback(parseProfiles(_loc2_["response"] as Array));
               }
            },function(param1:§_-4n-§):void
            {
               errorCallback(new §_-1KD§(§_-1KD§.NETWORK_ERROR,param1.errorCode,param1.§_-5-l§));
            });
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
               successCallback(_loc2_["response"] as Array);
            }
         },function(param1:§_-4n-§):void
         {
            errorCallback(new §_-1KD§(§_-1KD§.NETWORK_ERROR,param1.errorCode,param1.§_-5-l§));
         });
      }
      
      override public function getUserGroupList(param1:Function, param2:Function) : void
      {
         var successCallback:Function = param1;
         var errorCallback:Function = param2;
         var params:Object = {"extended":1};
         this.callMethod("groups.get",params,function(param1:§_-9db§):void
         {
            var _loc2_:* = param1.§_-6Oe§();
            if(checkError(_loc2_,errorCallback))
            {
               successCallback(§_-ex§(_loc2_["response"]["items"]));
            }
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
         var params:Object = {
            "user_id":userId,
            "group_id":groupId,
            "extended":1
         };
         this.callMethod("groups.isMember",params,function(param1:§_-9db§):void
         {
            var _loc3_:Object = null;
            var _loc2_:* = param1.§_-6Oe§();
            if(checkError(_loc2_,errorCallback))
            {
               _loc3_ = _loc2_["response"];
               successCallback(_loc3_.hasOwnProperty("member") && _loc3_["member"] == 1);
            }
         },function(param1:§_-4n-§):void
         {
            errorCallback(new §_-1KD§(§_-1KD§.NETWORK_ERROR,param1.errorCode,param1.§_-5-l§));
         });
      }
      
      public function §_-8lD§(param1:String, param2:String, param3:int, param4:Function, param5:Function) : void
      {
         var userId:String = param1;
         var postId:String = param2;
         var count:int = param3;
         var successCallback:Function = param4;
         var errorCallback:Function = param5;
         var params:Object = {
            "owner_id":userId,
            "count":count,
            "extended":1
         };
         this.callMethod("wall.get",params,function(param1:§_-9db§):void
         {
            var _loc3_:Object = null;
            var _loc4_:Object = null;
            var _loc5_:Object = null;
            var _loc6_:String = null;
            var _loc2_:* = param1.§_-6Oe§();
            if(checkError(_loc2_,errorCallback))
            {
               _loc3_ = _loc2_["response"];
               for each(_loc4_ in _loc3_["items"])
               {
                  if(_loc4_.hasOwnProperty("copy_history"))
                  {
                     for each(_loc5_ in _loc4_["copy_history"])
                     {
                        if(!(!_loc5_.hasOwnProperty("owner_id") || !_loc5_.hasOwnProperty("id")))
                        {
                           _loc6_ = _loc5_["owner_id"] + "_" + _loc5_["id"];
                           if(_loc6_ == postId)
                           {
                              successCallback(true);
                              return;
                           }
                        }
                     }
                  }
               }
               successCallback(false);
            }
         },function(param1:§_-4n-§):void
         {
            errorCallback(new §_-1KD§(§_-1KD§.NETWORK_ERROR,param1.errorCode,param1.§_-5-l§));
         });
      }
      
      override public function getOfferList(param1:Function, param2:Function) : void
      {
         param1([]);
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
            _loc4_.photoUrl = !!_loc3_.hasOwnProperty("photo_medium") ? _loc3_["photo_medium"] : "";
            _loc4_.§_-3oo§ = !!_loc3_.hasOwnProperty("photo_big") ? _loc3_["photo_big"] : "";
            _loc4_.§_-7uv§ = !!_loc3_.hasOwnProperty("photo") ? _loc3_["photo"] : "";
            if(_loc4_.photoUrl.indexOf("http://") == -1 && _loc4_.photoUrl.indexOf("https://") == -1 || (_loc4_.photoUrl == "http://vk.ru/images/deactivated_b.gif" || _loc4_.photoUrl == "https://vk.ru/images/deactivated_b.gif"))
            {
               _loc4_.photoUrl = "";
               _loc4_.§_-5pW§ = false;
            }
            else
            {
               _loc4_.§_-5pW§ = true;
            }
            _loc4_.id = !!_loc3_.hasOwnProperty("id") ? _loc3_["id"] : "0";
            _loc4_.firstName = !!_loc3_.hasOwnProperty("first_name") ? _loc3_["first_name"] : "";
            _loc4_.lastName = !!_loc3_.hasOwnProperty("last_name") ? _loc3_["last_name"] : "";
            _loc4_.§_-CXL§ = !!_loc3_.hasOwnProperty("nick_name") ? _loc3_["nick_name"] : "";
            if(_loc3_.hasOwnProperty("bdate"))
            {
               _loc4_.birthday = this.§_-ADK§(_loc3_["bdate"]);
            }
            _loc4_.cityId = !!_loc3_.hasOwnProperty("city") ? uint(_loc3_["city"]) : 0;
            _loc4_.§_-B1w§ = !!_loc3_.hasOwnProperty("country") ? uint(_loc3_["country"]) : 0;
            _loc4_.countryName = this.§_-4dp§(_loc4_.§_-B1w§);
            if(Boolean(_loc3_.hasOwnProperty("sex")) && parseInt(_loc3_["sex"]) != 0)
            {
               _loc4_.gender = parseInt(_loc3_["sex"]) == 2 ? uint(§_-4Wb§.§_-dv§) : uint(§_-4Wb§.§_-BYe§);
            }
            _loc2_.push(_loc4_);
            if(_loc4_.id == _userId)
            {
               this._userProfile = _loc4_;
            }
         }
         return _loc2_;
      }
      
      private function §_-4dp§(param1:uint) : String
      {
         if(!§_-K-§.hasOwnProperty(param1.toString()))
         {
            return "OH";
         }
         return §_-K-§[param1];
      }
      
      private function §_-ADK§(param1:String) : String
      {
         var _loc3_:Date = null;
         var _loc2_:Array = param1.split(".");
         if(_loc2_.length == 3)
         {
            _loc3_ = new Date();
            _loc3_.setFullYear(_loc2_[2],_loc2_[1],_loc2_[0]);
            _loc3_.setHours(0);
            _loc3_.setMinutes(0);
            _loc3_.setSeconds(0);
            _loc3_.setMilliseconds(0);
            return String(Math.round(_loc3_.getTime() / 1000));
         }
         return "";
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
      
      public function get userProfile() : §_-4Wb§
      {
         return this._userProfile;
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
            param2(new §_-1KD§(§_-1KD§.§_-7qk§,param1["error"]["error_code"],param1["error"]["error_msg"]));
            return false;
         }
         return true;
      }
      
      protected function callMethod(param1:String, param2:Object, param3:Function, param4:Function) : void
      {
         var _loc5_:String = §_-4r3§ + "/" + param1;
         this.sendRequest(param2,param3,param4,_loc5_);
      }
      
      protected function §_-3xc§(param1:Object) : Object
      {
         param1["v"] = §_-9Kq§;
         param1[§_-4pK§] = this.§_-0dO§;
         return param1;
      }
      
      override protected function sendRequest(param1:Object, param2:Function, param3:Function, param4:String = null) : void
      {
         param1 = this.§_-3xc§(param1);
         super.sendRequest(param1,param2,param3,param4);
      }
      
      override public function hasSocialFeature(param1:String) : Boolean
      {
         return [§_-0CY§].indexOf(param1) >= 0;
      }
   }
}

