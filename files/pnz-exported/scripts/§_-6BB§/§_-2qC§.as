package §_-6BB§
{
   import §_-1t9§.§_-33z§;
   import §_-1t9§.§_-4Wb§;
   import §_-1t9§.§_-4rn§;
   import §_-1t9§.§_-96c§;
   import §_-Aq0§.§_-4n-§;
   import §_-Aq0§.§_-9db§;
   import §_-Aq0§.§_-Bs9§;
   import flash.events.EventDispatcher;
   import flash.net.URLRequest;
   import flash.net.navigateToURL;
   
   public class §_-2qC§ extends EventDispatcher
   {
      public static const PERMISSION_NOTIFY:String = "notify";
      
      public static const PERMISSION_FRIENDS:String = "friends";
      
      public static const PERMISSION_PUBLISH:String = "publish";
      
      public static const PERMISSION_STATUS:String = "status";
      
      public static const PERMISSION_EMAIL:String = "email";
      
      public static const PERMISSION_PHOTO:String = "photo";
      
      public static const §_-wH§:String = "referrer";
      
      public static const §_-3rl§:String = "ownerId";
      
      public static const REFERRER_WALL:String = "wall";
      
      public static const REFERRER_USER:String = "user";
      
      public static const REFERRER_GROUP:String = "group";
      
      public static const REFERRER_AD:String = "ad";
      
      public static const REFERRER_NOTIFICATION:String = "notification";
      
      public static const REFERRER_ACTION:String = "action";
      
      public static const §_-6vh§:String = "app";
      
      public static const REFERRER_CATALOG:String = "catalog";
      
      public static const §_-8dJ§:String = "offer";
      
      public static const API_URL:String = "apiUrl";
      
      public static const §_-2vo§:String = "apiVersion";
      
      public static const §_-9GV§:String = "userId";
      
      public static const §_-3dd§:String = "secretKey";
      
      public static const §_-9S4§:String = "format";
      
      public static const §_-9Gf§:String = "appId";
      
      public static const §_-4Yz§:String = "pointsRate";
      
      public static const §_-1Xh§:String = "password";
      
      public static const AUTH_URL:String = "authUrl";
      
      public static const §_-2FI§:String = "JSON";
      
      public static const §_-jM§:String = "XML";
      
      public static const §_-8TU§:String = "albumForAll";
      
      public static const §_-A31§:String = "albumForFriends";
      
      public static const §_-45p§:String = "albumClosed";
      
      public static const §_-AYW§:String = "?";
      
      public static const §_-9P9§:String = "nav";
      
      public static const §_-2Yt§:String = "=";
      
      public static const §_-06E§:String = "_";
      
      public static const §_-0CY§:String = "canInvite";
      
      public static const §_-35K§:String = "canInviteById";
      
      protected var §_-4r3§:String = null;
      
      protected var §_-9Kq§:String = null;
      
      protected var _userId:String = null;
      
      protected var §_-5l3§:String = null;
      
      protected var §_-6hS§:String = "JSON";
      
      protected var _appId:String = null;
      
      protected var §_-2Yo§:Number = 10;
      
      protected var §_-6un§:String = null;
      
      protected var §_-AW9§:String;
      
      private var §_-0PK§:String;
      
      private var §_-3BJ§:§_-6gH§ = null;
      
      public function §_-2qC§()
      {
         super();
      }
      
      public function configure(param1:Object, param2:§_-6gH§) : void
      {
         if(param1.hasOwnProperty(API_URL))
         {
            this.§_-4r3§ = param1[API_URL];
         }
         if(param1.hasOwnProperty(§_-9GV§))
         {
            this._userId = param1[§_-9GV§];
         }
         if(param1.hasOwnProperty(§_-2vo§))
         {
            this.§_-9Kq§ = param1[§_-2vo§];
         }
         if(param1.hasOwnProperty(§_-3dd§))
         {
            this.§_-5l3§ = param1[§_-3dd§];
         }
         if(param1.hasOwnProperty(§_-9S4§))
         {
            this.§_-6hS§ = param1[§_-9S4§];
         }
         if(param1.hasOwnProperty(§_-9Gf§))
         {
            this._appId = param1[§_-9Gf§];
         }
         if(param1.hasOwnProperty(§_-4Yz§))
         {
            this.§_-2Yo§ = param1[§_-4Yz§];
         }
         if(param1.hasOwnProperty(§_-1Xh§))
         {
            this.§_-6un§ = param1[§_-1Xh§];
         }
         if(param1.hasOwnProperty(AUTH_URL))
         {
            this.§_-0PK§ = param1[AUTH_URL];
         }
         this.§_-3BJ§ = param2;
      }
      
      public function get socialNetwork() : String
      {
         throw new Error("Undefined social network");
      }
      
      public function get password() : String
      {
         return this.§_-6un§;
      }
      
      public function get unauthorizedSocialId() : String
      {
         return this.§_-AW9§;
      }
      
      public function get authUrl() : String
      {
         return this.§_-0PK§;
      }
      
      public function installApp(param1:Function, param2:Function, param3:Array = null) : void
      {
      }
      
      public function configureApp(param1:Array, param2:Function, param3:Function) : void
      {
      }
      
      public function inviteUsers(param1:Array, param2:String, param3:Function, param4:Function) : void
      {
      }
      
      public function showPaymentBox(param1:§_-4rn§, param2:Function, param3:Function) : void
      {
      }
      
      public function checkPermissions(param1:Array, param2:Function, param3:Function) : void
      {
      }
      
      public function findNearestPointPrice(param1:uint) : uint
      {
         return param1;
      }
      
      public function isInstalled(param1:Array, param2:Function, param3:Function) : void
      {
         param2(false);
      }
      
      public function get referrerType() : String
      {
         return null;
      }
      
      public function get referrerId() : String
      {
         return null;
      }
      
      public function navigateToUser(param1:§_-4Wb§) : void
      {
         navigateToURL(new URLRequest(this.getUserLink(param1)),"_blank");
      }
      
      public function navigateToGroup(param1:String) : void
      {
      }
      
      public function navigateToApplication(param1:String) : void
      {
         navigateToURL(new URLRequest(this.getAppLink(param1)),"_blank");
      }
      
      public function getUserLink(param1:§_-4Wb§) : String
      {
         return null;
      }
      
      public function getAppLink(param1:String) : String
      {
         return null;
      }
      
      public function createNavigationLink(param1:String, param2:String, param3:String, param4:String) : String
      {
         var _loc5_:* = this.getAppLink(param1) + §_-AYW§ + §_-9P9§ + §_-2Yt§ + param2 + "[" + param3 + "]";
         if(param4 != null)
         {
            _loc5_ += §_-06E§ + param4;
         }
         return _loc5_;
      }
      
      public function isAllowSocialMedia(param1:String) : Boolean
      {
         return true;
      }
      
      public function §_-A9A§() : Boolean
      {
         return false;
      }
      
      public function §_-5Ki§(param1:String) : String
      {
         return null;
      }
      
      public function hasSocialFeature(param1:String) : Boolean
      {
         return false;
      }
      
      public function prepareSocialMedia(param1:§_-96c§, param2:Function, param3:Function) : void
      {
      }
      
      public function publishSocialMedia(param1:§_-96c§, param2:Function, param3:Function) : void
      {
      }
      
      public function getUsersProfiles(param1:Array, param2:Function, param3:Function) : void
      {
      }
      
      public function getUserFriendProfiles(param1:Function, param2:Function) : void
      {
      }
      
      public function getUserFriendsIds(param1:Function, param2:Function) : void
      {
      }
      
      public function getUserAppFriendProfiles(param1:Function, param2:Function) : void
      {
      }
      
      public function getUserAppFriendsIds(param1:Function, param2:Function) : void
      {
      }
      
      public function getUserGroupList(param1:Function, param2:Function) : void
      {
      }
      
      public function isGroupMember(param1:String, param2:String, param3:Function, param4:Function) : void
      {
      }
      
      public function getOfferList(param1:Function, param2:Function) : void
      {
      }
      
      public function getPhotoAlbums(param1:Function, param2:Function) : void
      {
      }
      
      public function getAlbumPhotos(param1:String, param2:String, param3:Function, param4:Function) : void
      {
      }
      
      public function createPhotoAlbum(param1:§_-33z§, param2:Function, param3:Function) : void
      {
      }
      
      public function getUploadPhotoServer(param1:String, param2:Function, param3:Function) : void
      {
      }
      
      public function get userId() : String
      {
         return this._userId;
      }
      
      public function get authUserId() : String
      {
         return this._userId;
      }
      
      public function get appId() : String
      {
         return this._appId;
      }
      
      public function get pointsRate() : int
      {
         return this.§_-2Yo§;
      }
      
      public function get secretKey() : String
      {
         return this.§_-5l3§;
      }
      
      public function get apiUrl() : String
      {
         return this.§_-4r3§;
      }
      
      public function §_-7xT§() : void
      {
      }
      
      public function §_-C-r§() : void
      {
      }
      
      public function §_-kA§() : void
      {
      }
      
      protected function sendRequest(param1:Object, param2:Function, param3:Function, param4:String = null) : void
      {
         var parameters:Object = param1;
         var successCallback:Function = param2;
         var errorCallback:Function = param3;
         var urlOverride:String = param4;
         var request:§_-Bs9§ = this.createHTTPRequest(urlOverride);
         request.§_-0fS§(parameters);
         request.addEventListener(§_-9db§.COMPLETE,function(param1:§_-9db§):void
         {
            successCallback(param1);
         });
         request.addEventListener(§_-4n-§.HTTP_ERROR,function(param1:§_-4n-§):void
         {
            errorCallback(param1);
         });
         request.send();
      }
      
      protected function createHTTPRequest(param1:String = null) : §_-Bs9§
      {
         var _loc2_:§_-Bs9§ = new §_-Bs9§();
         _loc2_.url = param1 != null ? param1 : this.§_-4r3§;
         return _loc2_;
      }
      
      protected function get connector() : §_-6gH§
      {
         return this.§_-3BJ§;
      }
   }
}

