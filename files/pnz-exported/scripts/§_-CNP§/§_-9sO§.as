package §_-CNP§
{
   import §_-1t9§.§_-33z§;
   import §_-1t9§.§_-4Wb§;
   import §_-1t9§.§_-96c§;
   import §_-6-L§.§_-CTu§;
   import §_-6BB§.§_-1KD§;
   import §_-6BB§.§_-2qC§;
   import §_-6BB§.§_-6gH§;
   import flash.external.ExternalInterface;
   
   public class §_-9sO§ extends §_-0NB§
   {
      private static const §_-C3n§:String = "logSocialError";
      
      protected var §_-1uV§:§_-2qC§ = null;
      
      public function §_-9sO§(param1:§_-2qC§)
      {
         super();
         this.§_-1uV§ = param1;
      }
      
      override public function configure(param1:Object, param2:§_-6gH§) : void
      {
         super.configure(param1,param2);
         this.§_-1uV§.configure(param1,param2);
      }
      
      override public function get socialNetwork() : String
      {
         return this.§_-1uV§.socialNetwork;
      }
      
      override public function get password() : String
      {
         return this.§_-1uV§.password;
      }
      
      override public function get authUserId() : String
      {
         return this.§_-1uV§.authUserId;
      }
      
      override public function installApp(param1:Function, param2:Function, param3:Array = null) : void
      {
         var successCallback:Function = param1;
         var errorCallback:Function = param2;
         var permissions:Array = param3;
         this.§_-1uV§.installApp(successCallback,function(param1:§_-1KD§):void
         {
            externalErrorCallback(param1,errorCallback);
         },permissions);
      }
      
      override public function configureApp(param1:Array, param2:Function, param3:Function) : void
      {
         var permissions:Array = param1;
         var successCallback:Function = param2;
         var errorCallback:Function = param3;
         this.§_-1uV§.configureApp(permissions,successCallback,function(param1:§_-1KD§):void
         {
            externalErrorCallback(param1,errorCallback);
         });
      }
      
      override public function inviteUsers(param1:Array, param2:String, param3:Function, param4:Function) : void
      {
         var ids:Array = param1;
         var message:String = param2;
         var successCallback:Function = param3;
         var errorCallback:Function = param4;
         this.§_-1uV§.inviteUsers(ids,message,successCallback,function(param1:§_-1KD§):void
         {
            externalErrorCallback(param1,errorCallback);
         });
      }
      
      override public function checkPermissions(param1:Array, param2:Function, param3:Function) : void
      {
         var permissions:Array = param1;
         var successCallback:Function = param2;
         var errorCallback:Function = param3;
         this.§_-1uV§.checkPermissions(permissions,successCallback,function(param1:§_-1KD§):void
         {
            externalErrorCallback(param1,errorCallback);
         });
      }
      
      override public function findNearestPointPrice(param1:uint) : uint
      {
         return this.§_-1uV§.findNearestPointPrice(param1);
      }
      
      override public function isInstalled(param1:Array, param2:Function, param3:Function) : void
      {
         param2(true);
      }
      
      override public function get referrerType() : String
      {
         return this.§_-1uV§.referrerType;
      }
      
      override public function get referrerId() : String
      {
         return this.§_-1uV§.referrerId;
      }
      
      override public function navigateToUser(param1:§_-4Wb§) : void
      {
         this.§_-1uV§.navigateToUser(param1);
      }
      
      override public function navigateToGroup(param1:String) : void
      {
         this.§_-1uV§.navigateToGroup(param1);
      }
      
      override public function navigateToApplication(param1:String) : void
      {
         this.§_-1uV§.navigateToApplication(param1);
      }
      
      override public function getUserLink(param1:§_-4Wb§) : String
      {
         return this.§_-1uV§.getUserLink(param1);
      }
      
      override public function getAppLink(param1:String) : String
      {
         return this.§_-1uV§.getAppLink(param1);
      }
      
      override public function createNavigationLink(param1:String, param2:String, param3:String, param4:String) : String
      {
         return this.§_-1uV§.createNavigationLink(param1,param2,param3,param4);
      }
      
      override public function isAllowSocialMedia(param1:String) : Boolean
      {
         if([§_-96c§.§_-0B0§].indexOf(param1) >= 0)
         {
            return true;
         }
         return this.§_-1uV§.isAllowSocialMedia(param1);
      }
      
      override public function prepareSocialMedia(param1:§_-96c§, param2:Function, param3:Function) : void
      {
         var socialMedia:§_-96c§ = param1;
         var callback:Function = param2;
         var errorCallback:Function = param3;
         this.§_-1uV§.prepareSocialMedia(socialMedia,callback,function(param1:§_-1KD§):void
         {
            externalErrorCallback(param1,errorCallback);
         });
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
            callback();
            return;
         }
         this.§_-1uV§.publishSocialMedia(socialMedia,callback,function(param1:§_-1KD§):void
         {
            externalErrorCallback(param1,errorCallback);
         });
      }
      
      override public function getUsersProfiles(param1:Array, param2:Function, param3:Function) : void
      {
         var uids:Array = param1;
         var callback:Function = param2;
         var errorCallback:Function = param3;
         this.§_-1uV§.getUsersProfiles(uids,callback,function(param1:§_-1KD§):void
         {
            externalErrorCallback(param1,errorCallback);
         });
      }
      
      override public function getUserFriendProfiles(param1:Function, param2:Function) : void
      {
         var successCallback:Function = param1;
         var errorCallback:Function = param2;
         this.§_-1uV§.getUserFriendProfiles(successCallback,function(param1:§_-1KD§):void
         {
            externalErrorCallback(param1,errorCallback);
         });
      }
      
      override public function getUserFriendsIds(param1:Function, param2:Function) : void
      {
         var successCallback:Function = param1;
         var errorCallback:Function = param2;
         this.§_-1uV§.getUserFriendsIds(successCallback,function(param1:§_-1KD§):void
         {
            externalErrorCallback(param1,errorCallback);
         });
      }
      
      override public function getUserAppFriendProfiles(param1:Function, param2:Function) : void
      {
         var successCallback:Function = param1;
         var errorCallback:Function = param2;
         this.§_-1uV§.getUserAppFriendProfiles(successCallback,function(param1:§_-1KD§):void
         {
            externalErrorCallback(param1,errorCallback);
         });
      }
      
      override public function getUserAppFriendsIds(param1:Function, param2:Function) : void
      {
         var successCallback:Function = param1;
         var errorCallback:Function = param2;
         this.§_-1uV§.getUserAppFriendsIds(successCallback,function(param1:§_-1KD§):void
         {
            externalErrorCallback(param1,errorCallback);
         });
      }
      
      override public function getUserGroupList(param1:Function, param2:Function) : void
      {
         var successCallback:Function = param1;
         var errorCallback:Function = param2;
         this.§_-1uV§.getUserGroupList(successCallback,function(param1:§_-1KD§):void
         {
            externalErrorCallback(param1,errorCallback);
         });
      }
      
      override public function isGroupMember(param1:String, param2:String, param3:Function, param4:Function) : void
      {
         var userId:String = param1;
         var groupId:String = param2;
         var successCallback:Function = param3;
         var errorCallback:Function = param4;
         this.§_-1uV§.isGroupMember(userId,groupId,successCallback,function(param1:§_-1KD§):void
         {
            externalErrorCallback(param1,errorCallback);
         });
      }
      
      override public function getOfferList(param1:Function, param2:Function) : void
      {
         var successCallback:Function = param1;
         var errorCallback:Function = param2;
         this.§_-1uV§.getOfferList(successCallback,function(param1:§_-1KD§):void
         {
            externalErrorCallback(param1,errorCallback);
         });
      }
      
      override public function getPhotoAlbums(param1:Function, param2:Function) : void
      {
         var successCallback:Function = param1;
         var errorCallback:Function = param2;
         this.§_-1uV§.getPhotoAlbums(successCallback,function(param1:§_-1KD§):void
         {
            externalErrorCallback(param1,errorCallback);
         });
      }
      
      override public function getAlbumPhotos(param1:String, param2:String, param3:Function, param4:Function) : void
      {
         var albumId:String = param1;
         var userId:String = param2;
         var successCallback:Function = param3;
         var errorCallback:Function = param4;
         this.§_-1uV§.getAlbumPhotos(albumId,userId,successCallback,function(param1:§_-1KD§):void
         {
            externalErrorCallback(param1,errorCallback);
         });
      }
      
      override public function createPhotoAlbum(param1:§_-33z§, param2:Function, param3:Function) : void
      {
         var album:§_-33z§ = param1;
         var successCallback:Function = param2;
         var errorCallback:Function = param3;
         this.§_-1uV§.createPhotoAlbum(album,successCallback,function(param1:§_-1KD§):void
         {
            externalErrorCallback(param1,errorCallback);
         });
      }
      
      override public function getUploadPhotoServer(param1:String, param2:Function, param3:Function) : void
      {
         var aid:String = param1;
         var successCallback:Function = param2;
         var errorCallback:Function = param3;
         this.§_-1uV§.getUploadPhotoServer(aid,successCallback,function(param1:§_-1KD§):void
         {
            externalErrorCallback(param1,errorCallback);
         });
      }
      
      override public function get userId() : String
      {
         return this.§_-1uV§.userId;
      }
      
      override public function get appId() : String
      {
         return this.§_-1uV§.appId;
      }
      
      override public function get pointsRate() : int
      {
         return this.§_-1uV§.pointsRate;
      }
      
      override public function get secretKey() : String
      {
         return this.§_-1uV§.secretKey;
      }
      
      override public function get apiUrl() : String
      {
         return this.§_-1uV§.apiUrl;
      }
      
      public function get countryCode() : String
      {
         return this.§_-1uV§["countryCode"];
      }
      
      private function externalErrorCallback(param1:§_-1KD§, param2:Function) : void
      {
         if(ExternalInterface.available)
         {
            ExternalInterface.call("TGC." + §_-C3n§,this.§_-1uV§.socialNetwork,param1.code);
         }
         param2(param1);
      }
   }
}

