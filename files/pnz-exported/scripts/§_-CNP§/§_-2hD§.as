package §_-CNP§
{
   import §_-0uA§.§_-3YE§;
   import §_-1t9§.§_-33z§;
   import §_-1t9§.§_-4Wb§;
   import §_-1t9§.§_-96c§;
   import §_-6-L§.§_-CTu§;
   import §_-6BB§.§_-1KD§;
   import §_-6BB§.§_-2qC§;
   import §_-6BB§.§_-6gH§;
   import flash.external.ExternalInterface;
   
   public class §_-2hD§ extends §_-9sO§
   {
      private static const §_-2UF§:String = "getUserProfiles";
      
      private static const §_-5Sy§:String = "getFriendProfiles";
      
      public function §_-2hD§(param1:§_-2qC§)
      {
         super(param1);
      }
      
      override public function configure(param1:Object, param2:§_-6gH§) : void
      {
         var options:Object = param1;
         var connector:§_-6gH§ = param2;
         super.configure(options,connector);
         §_-1uV§.configure(options,connector);
         try
         {
            if(ExternalInterface.available)
            {
               ExternalInterface.addCallback("onGetUserProfiles",this.onGetUserProfiles);
               ExternalInterface.addCallback("onGetFriendProfiles",this.onGetFriendProfiles);
            }
         }
         catch(error:Error)
         {
            §_-3YE§.error(error.message);
         }
      }
      
      protected function onGetUserProfiles(param1:Array) : void
      {
         var _loc4_:Function = null;
         §_-3YE§.info("onGetUserProfiles" + param1);
         if(param1 == null)
         {
            if(§_-2Ue§.hasOwnProperty(§_-2UF§))
            {
               _loc4_ = §_-2Ue§[§_-2UF§];
               §_-6jc§(§_-2UF§);
               _loc4_();
            }
            return;
         }
         var _loc2_:Array = this.parseProfiles(param1);
         var _loc3_:Function = §_-1Tv§[§_-2UF§];
         _loc3_(_loc2_);
      }
      
      protected function onGetFriendProfiles(param1:Array) : void
      {
         var _loc4_:Function = null;
         §_-3YE§.info("onGeFriendProfiles" + param1);
         if(param1 == null)
         {
            if(§_-2Ue§.hasOwnProperty(§_-5Sy§))
            {
               _loc4_ = §_-2Ue§[§_-5Sy§];
               §_-6jc§(§_-5Sy§);
               _loc4_();
            }
            return;
         }
         var _loc2_:Array = this.parseProfiles(param1);
         var _loc3_:Function = §_-1Tv§[§_-5Sy§];
         if(_loc3_ != null)
         {
            _loc3_(_loc2_);
         }
      }
      
      private function parseProfiles(param1:Array) : Array
      {
         var _loc3_:Object = null;
         var _loc4_:§_-4Wb§ = null;
         var _loc5_:String = null;
         var _loc2_:Array = [];
         for each(_loc3_ in param1)
         {
            _loc4_ = new §_-4Wb§();
            for(_loc5_ in _loc3_)
            {
               if(_loc4_.hasOwnProperty(_loc5_))
               {
                  _loc4_[_loc5_] = _loc3_[_loc5_];
               }
            }
            _loc2_.push(_loc4_);
         }
         return _loc2_;
      }
      
      override public function get socialNetwork() : String
      {
         return §_-1uV§.socialNetwork;
      }
      
      override public function get password() : String
      {
         return §_-1uV§.password;
      }
      
      override public function installApp(param1:Function, param2:Function, param3:Array = null) : void
      {
         §_-1uV§.installApp(param1,param2,param3);
      }
      
      override public function configureApp(param1:Array, param2:Function, param3:Function) : void
      {
         §_-1uV§.configureApp(param1,param2,param3);
      }
      
      override public function inviteUsers(param1:Array, param2:String, param3:Function, param4:Function) : void
      {
         §_-1uV§.inviteUsers(param1,param2,param3,param4);
      }
      
      override public function checkPermissions(param1:Array, param2:Function, param3:Function) : void
      {
         §_-1uV§.checkPermissions(param1,param2,param3);
      }
      
      override public function findNearestPointPrice(param1:uint) : uint
      {
         return §_-1uV§.findNearestPointPrice(param1);
      }
      
      override public function isInstalled(param1:Array, param2:Function, param3:Function) : void
      {
         param2(true);
      }
      
      override public function get referrerType() : String
      {
         return §_-1uV§.referrerType;
      }
      
      override public function get referrerId() : String
      {
         return §_-1uV§.referrerId;
      }
      
      override public function navigateToUser(param1:§_-4Wb§) : void
      {
         §_-1uV§.navigateToUser(param1);
      }
      
      override public function navigateToGroup(param1:String) : void
      {
         §_-1uV§.navigateToGroup(param1);
      }
      
      override public function navigateToApplication(param1:String) : void
      {
         §_-1uV§.navigateToApplication(param1);
      }
      
      override public function getUserLink(param1:§_-4Wb§) : String
      {
         return §_-1uV§.getUserLink(param1);
      }
      
      override public function getAppLink(param1:String) : String
      {
         return §_-1uV§.getAppLink(param1);
      }
      
      override public function createNavigationLink(param1:String, param2:String, param3:String, param4:String) : String
      {
         return §_-1uV§.createNavigationLink(param1,param2,param3,param4);
      }
      
      override public function isAllowSocialMedia(param1:String) : Boolean
      {
         return [§_-96c§.§_-0B0§].indexOf(param1) >= 0;
      }
      
      override public function prepareSocialMedia(param1:§_-96c§, param2:Function, param3:Function) : void
      {
         §_-1uV§.prepareSocialMedia(param1,param2,param3);
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
         §_-1uV§.publishSocialMedia(socialMedia,callback,errorCallback);
      }
      
      override public function getUsersProfiles(param1:Array, param2:Function, param3:Function) : void
      {
         §_-1Tv§[§_-2UF§] = param2;
         §_-2Ue§[§_-2UF§] = param3;
         ExternalInterface.call("TGC." + §_-2UF§,param1);
      }
      
      override public function getUserFriendProfiles(param1:Function, param2:Function) : void
      {
         §_-1Tv§[§_-5Sy§] = param1;
         §_-2Ue§[§_-5Sy§] = param2;
         ExternalInterface.call("TGC." + §_-5Sy§);
      }
      
      override public function getUserFriendsIds(param1:Function, param2:Function) : void
      {
         §_-1uV§.getUserFriendsIds(param1,param2);
      }
      
      override public function getUserAppFriendProfiles(param1:Function, param2:Function) : void
      {
         §_-1uV§.getUserAppFriendProfiles(param1,param2);
      }
      
      override public function getUserAppFriendsIds(param1:Function, param2:Function) : void
      {
         §_-1uV§.getUserAppFriendsIds(param1,param2);
      }
      
      override public function getUserGroupList(param1:Function, param2:Function) : void
      {
         §_-1uV§.getUserGroupList(param1,param2);
      }
      
      override public function isGroupMember(param1:String, param2:String, param3:Function, param4:Function) : void
      {
         §_-1uV§.isGroupMember(param1,param2,param3,param4);
      }
      
      override public function getOfferList(param1:Function, param2:Function) : void
      {
         §_-1uV§.getOfferList(param1,param2);
      }
      
      override public function getPhotoAlbums(param1:Function, param2:Function) : void
      {
         §_-1uV§.getPhotoAlbums(param1,param2);
      }
      
      override public function getAlbumPhotos(param1:String, param2:String, param3:Function, param4:Function) : void
      {
         §_-1uV§.getAlbumPhotos(param1,param2,param3,param4);
      }
      
      override public function createPhotoAlbum(param1:§_-33z§, param2:Function, param3:Function) : void
      {
         §_-1uV§.createPhotoAlbum(param1,param2,param3);
      }
      
      override public function getUploadPhotoServer(param1:String, param2:Function, param3:Function) : void
      {
         §_-1uV§.getUploadPhotoServer(param1,param2,param3);
      }
      
      override public function get userId() : String
      {
         return §_-1uV§.userId;
      }
      
      override public function get authUserId() : String
      {
         return §_-1uV§.authUserId;
      }
      
      override public function get appId() : String
      {
         return §_-1uV§.appId;
      }
      
      override public function get pointsRate() : int
      {
         return §_-1uV§.pointsRate;
      }
      
      override public function get secretKey() : String
      {
         return §_-1uV§.secretKey;
      }
      
      override public function get apiUrl() : String
      {
         return §_-1uV§.apiUrl;
      }
   }
}

