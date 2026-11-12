package adept.social.nk
{
   import §_-1t9§.§_-4Wb§;
   import §_-1t9§.§_-4rn§;
   import §_-1t9§.§_-96c§;
   import §_-6BB§.§_-1KD§;
   import §_-6BB§.§_-2qC§;
   import §_-6BB§.§_-6gH§;
   import §_-6BB§.§_-8BS§;
   import §_-6BB§.§_-8L3§;
   import flash.system.Security;
   
   public class §_-0vk§ extends §_-2qC§
   {
      public static const §_-wH§:String = "referrer";
      
      public static const §_-089§:String = "app_url";
      
      private var _jsBridge:NkSocialJSBridge = null;
      
      private var _initCallbacks:Array = [];
      
      private var §_-9Xz§:§_-4Wb§ = null;
      
      private var §_-AEb§:String = "";
      
      private var §_-Hd§:String = "";
      
      public function §_-0vk§()
      {
         super();
      }
      
      override public function configure(param1:Object, param2:§_-6gH§) : void
      {
         super.configure(param1,param2);
         if(param1.hasOwnProperty(§_-wH§))
         {
            this.§_-AEb§ = param1[§_-wH§];
         }
         if(param1.hasOwnProperty(§_-089§))
         {
            this.§_-Hd§ = param1[§_-089§];
         }
         Security.allowDomain("*");
         this._jsBridge = new NkSocialJSBridge();
         this._jsBridge.addEventListener(§_-1KD§.§_-9cu§,this.onSocialError);
         this._jsBridge.init(this.§_-ANT§);
      }
      
      private function §_-ANT§(param1:Object) : void
      {
         var _loc2_:Function = null;
         this.§_-9Xz§ = this.parseProfile(param1);
         for each(_loc2_ in this._initCallbacks)
         {
            _loc2_();
         }
         this._initCallbacks = [];
         dispatchEvent(new §_-8L3§(§_-8L3§.§_-As9§));
      }
      
      private function onSocialError(param1:§_-1KD§) : void
      {
         dispatchEvent(new §_-1KD§(§_-1KD§.§_-7qk§,-1,param1.message));
         trace("social error: " + param1.message);
      }
      
      override public function get socialNetwork() : String
      {
         return §_-8BS§.§_-Boi§;
      }
      
      override public function installApp(param1:Function, param2:Function, param3:Array = null) : void
      {
      }
      
      override public function configureApp(param1:Array, param2:Function, param3:Function) : void
      {
      }
      
      override public function inviteUsers(param1:Array, param2:String, param3:Function, param4:Function) : void
      {
         this._jsBridge.invite(param2,{"ref":this.§_-9Xz§.id},param3);
      }
      
      override public function isAllowSocialMedia(param1:String) : Boolean
      {
         return [§_-96c§.§_-Anq§,§_-96c§.§_-4Ir§].indexOf(param1) >= 0;
      }
      
      override public function prepareSocialMedia(param1:§_-96c§, param2:Function, param3:Function) : void
      {
         param2(param1);
      }
      
      override public function publishSocialMedia(param1:§_-96c§, param2:Function, param3:Function) : void
      {
         var _loc4_:String = null;
         if(param1.targetUserId == _userId || param1.§_-Bjy§ == _userId)
         {
            _loc4_ = param1.links != null && param1.links.links.length > 0 ? param1.links.links[0]["url"] : "";
            this._jsBridge.postActivity(param1.photoUrl,param1.title,param1.description,_loc4_,param2);
         }
      }
      
      override public function showPaymentBox(param1:§_-4rn§, param2:Function, param3:Function) : void
      {
         var purchase:§_-4rn§ = param1;
         var successCallback:Function = param2;
         var errorCallback:Function = param3;
         this._jsBridge.showPaymentBox(Math.ceil(purchase.pointsPrice / §_-2Yo§),purchase.serviceName,purchase.serviceId + ":" + purchase.quantity,function(param1:Object):void
         {
            if(param1.hasOwnProperty("orderId"))
            {
               successCallback();
            }
            else
            {
               errorCallback();
            }
         });
      }
      
      override public function isInstalled(param1:Array, param2:Function, param3:Function) : void
      {
         param2(true);
      }
      
      override public function checkPermissions(param1:Array, param2:Function, param3:Function) : void
      {
         param2(true);
      }
      
      override public function get referrerType() : String
      {
         return this.§_-AEb§ != "" && this.§_-AEb§.split(".")[0] == "person" ? §_-2qC§.REFERRER_USER : "";
      }
      
      override public function get referrerId() : String
      {
         return this.§_-AEb§ != "" && this.§_-AEb§.split(".")[0] == "person" ? this.§_-AEb§ : "";
      }
      
      override public function getUsersProfiles(param1:Array, param2:Function, param3:Function) : void
      {
         if(param1.length == 1 && param1[0] == _userId)
         {
            param2([this.§_-9Xz§]);
         }
         else
         {
            param2([]);
         }
      }
      
      override public function getUserFriendProfiles(param1:Function, param2:Function) : void
      {
         var successCallback:Function = param1;
         var errorCallback:Function = param2;
         this._jsBridge.getFriends(false,function(param1:Object):void
         {
            var _loc3_:Object = null;
            var _loc4_:§_-4Wb§ = null;
            var _loc2_:Array = [];
            for each(_loc3_ in param1["friends"])
            {
               _loc4_ = parseProfile(_loc3_);
               if(_loc4_.id != _userId)
               {
                  _loc2_.push(_loc4_);
               }
            }
            successCallback(_loc2_);
         });
      }
      
      override public function getUserAppFriendProfiles(param1:Function, param2:Function) : void
      {
         var successCallback:Function = param1;
         var errorCallback:Function = param2;
         this._jsBridge.getFriends(true,function(param1:Object):void
         {
            var _loc3_:Object = null;
            var _loc4_:§_-4Wb§ = null;
            var _loc2_:Array = [];
            for each(_loc3_ in param1["friends"])
            {
               _loc4_ = parseProfile(_loc3_);
               if(_loc4_.id != _userId)
               {
                  _loc2_.push(_loc4_);
               }
            }
            successCallback(_loc2_);
         });
      }
      
      private function parseProfile(param1:Object) : §_-4Wb§
      {
         var _loc2_:§_-4Wb§ = new §_-4Wb§();
         _loc2_.id = param1["id"];
         _loc2_.firstName = param1["displayName"];
         _loc2_.photoUrl = param1["thumbnail"];
         _loc2_.gender = param1["gender"] == "MALE" ? uint(§_-4Wb§.§_-dv§) : uint(§_-4Wb§.§_-BYe§);
         return _loc2_;
      }
      
      override public function getAppLink(param1:String) : String
      {
         return this.§_-Hd§;
      }
   }
}

