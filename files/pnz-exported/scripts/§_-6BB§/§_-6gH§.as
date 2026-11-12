package §_-6BB§
{
   import §_-1t9§.§_-33z§;
   import §_-1t9§.§_-4Wb§;
   import §_-1t9§.§_-4rn§;
   import §_-1t9§.§_-96c§;
   import flash.events.EventDispatcher;
   
   public class §_-6gH§ extends EventDispatcher
   {
      private var §_-1uV§:§_-2qC§ = null;
      
      private var §_-83h§:Function = null;
      
      private var §_-9Bt§:§_-CH9§ = null;
      
      public function §_-6gH§(param1:§_-2qC§, param2:Object = null)
      {
         super();
         this.§_-1uV§ = param1;
         if(param2 != null)
         {
            this.§_-1uV§.addEventListener(§_-8L3§.§_-As9§,this.§_-FK§);
            this.§_-1uV§.configure(param2,this);
         }
      }
      
      private function §_-FK§(param1:§_-8L3§) : void
      {
         this.§_-1uV§.removeEventListener(§_-8L3§.§_-As9§,this.§_-FK§);
         dispatchEvent(new §_-1iL§(§_-1iL§.§_-8nO§));
      }
      
      public function installApp(param1:Function, param2:Function = null, param3:Array = null) : void
      {
         this.§_-1uV§.installApp(param1,this.§_-7o4§(param2),param3);
      }
      
      public function configureApp(param1:Array, param2:Function, param3:Function = null) : void
      {
         this.§_-1uV§.configureApp(param1,param2,this.§_-7o4§(param3));
      }
      
      public function inviteUsers(param1:Array = null, param2:String = null, param3:Function = null, param4:Function = null) : void
      {
         this.§_-1uV§.inviteUsers(param1,param2,param3,this.§_-7o4§(param4));
      }
      
      public function showPaymentBox(param1:§_-4rn§, param2:Function, param3:Function = null) : void
      {
         this.§_-1uV§.showPaymentBox(param1,param2,this.§_-7o4§(param3));
      }
      
      public function checkPermissions(param1:Array, param2:Function, param3:Function = null) : void
      {
         this.§_-1uV§.checkPermissions(param1,param2,this.§_-7o4§(param3));
      }
      
      public function isInstalled(param1:Array, param2:Function, param3:Function = null) : void
      {
         this.§_-1uV§.isInstalled(param1,param2,this.§_-7o4§(param3));
      }
      
      public function get referrerType() : String
      {
         return this.§_-1uV§.referrerType;
      }
      
      public function get referrerId() : String
      {
         return this.§_-1uV§.referrerId;
      }
      
      public function navigateToUser(param1:§_-4Wb§) : void
      {
         this.§_-1uV§.navigateToUser(param1);
      }
      
      public function navigateToGroup(param1:String) : void
      {
         this.§_-1uV§.navigateToGroup(param1);
      }
      
      public function navigateToApplication(param1:String = null) : void
      {
         this.§_-1uV§.navigateToApplication(param1 == null ? this.§_-1uV§.appId : param1);
      }
      
      public function getUserLink(param1:§_-4Wb§) : String
      {
         return this.§_-1uV§.getUserLink(param1);
      }
      
      public function getAppLink(param1:String = null) : String
      {
         return this.§_-1uV§.getAppLink(param1 == null ? this.§_-1uV§.appId : param1);
      }
      
      public function isAllowSocialMedia(param1:String) : Boolean
      {
         return this.§_-1uV§.isAllowSocialMedia(param1);
      }
      
      public function prepareSocialMedia(param1:§_-96c§, param2:Function, param3:Function = null) : void
      {
         this.§_-1uV§.prepareSocialMedia(param1,param2,this.§_-7o4§(param3));
      }
      
      public function publishSocialMedia(param1:§_-96c§, param2:Function, param3:Function = null) : void
      {
         this.§_-1uV§.publishSocialMedia(param1,param2,this.§_-7o4§(param3));
      }
      
      public function getPhotoAlbums(param1:Function, param2:Function = null) : void
      {
         this.§_-1uV§.getPhotoAlbums(param1,this.§_-7o4§(param2));
      }
      
      public function createPhotoAlbum(param1:§_-33z§, param2:Function, param3:Function = null) : void
      {
         this.§_-1uV§.createPhotoAlbum(param1,param2,this.§_-7o4§(param3));
      }
      
      public function getUsersProfiles(param1:Array, param2:Function, param3:Function = null) : void
      {
         this.§_-1uV§.getUsersProfiles(param1,param2,this.§_-7o4§(param3));
      }
      
      public function getUserFriendProfiles(param1:Function, param2:Function = null) : void
      {
         this.§_-1uV§.getUserFriendProfiles(param1,this.§_-7o4§(param2));
      }
      
      public function getUserFriendsIds(param1:Function, param2:Function = null) : void
      {
         this.§_-1uV§.getUserFriendsIds(param1,this.§_-7o4§(param2));
      }
      
      public function getUserAppFriendProfiles(param1:Function, param2:Function = null) : void
      {
         this.§_-1uV§.getUserAppFriendProfiles(param1,this.§_-7o4§(param2));
      }
      
      public function getUserAppFriendsIds(param1:Function, param2:Function = null) : void
      {
         this.§_-1uV§.getUserAppFriendsIds(param1,this.§_-7o4§(param2));
      }
      
      public function getUserGroupList(param1:Function, param2:Function = null) : void
      {
         this.§_-1uV§.getUserGroupList(param1,this.§_-7o4§(param2));
      }
      
      public function isGroupMember(param1:String, param2:String, param3:Function, param4:Function = null) : void
      {
         this.§_-1uV§.isGroupMember(param1,param2,param3,this.§_-7o4§(param4));
      }
      
      public function getOfferList(param1:Function, param2:Function = null) : void
      {
         this.§_-1uV§.getOfferList(param1,this.§_-7o4§(param2));
      }
      
      public function get adapter() : §_-2qC§
      {
         return this.§_-1uV§;
      }
      
      public function get appId() : String
      {
         return this.§_-1uV§.appId;
      }
      
      private function §_-0x§(param1:§_-1KD§) : void
      {
      }
      
      private function §_-7o4§(param1:Function) : Function
      {
         if(param1 != null)
         {
            return param1;
         }
         if(this.§_-83h§ != null)
         {
            return this.§_-83h§;
         }
         return this.§_-0x§;
      }
      
      public function set §_-0Gc§(param1:Function) : void
      {
         this.§_-83h§ = param1;
      }
      
      public function get serverTonnel() : §_-CH9§
      {
         return this.§_-9Bt§;
      }
      
      public function set serverTonnel(param1:§_-CH9§) : void
      {
         this.§_-9Bt§ = param1;
      }
   }
}

