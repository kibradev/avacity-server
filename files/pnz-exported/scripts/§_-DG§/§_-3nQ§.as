package §_-DG§
{
   import §_-1t9§.§_-4Wb§;
   import §_-1t9§.§_-4rn§;
   import §_-1t9§.§_-96c§;
   import §_-6-L§.§_-7uH§;
   import §_-6BB§.§_-2qC§;
   import §_-6BB§.§_-6gH§;
   import §_-6BB§.§_-8BS§;
   import §_-6BB§.§_-8L3§;
   import §_-8a5§.§_-2IQ§;
   import §_-Aq0§.§_-4n-§;
   import §_-Aq0§.§_-9db§;
   import §_-Aq0§.§_-Bs9§;
   import flash.system.Security;
   
   public class §_-3nQ§ extends §_-2qC§
   {
      public static const §_-5Cl§:String = "channelId";
      
      public static const §_-1nK§:String = "siteId";
      
      public static const §_-Ax§:String = "appToken";
      
      public static const §_-2-r§:String = "userName";
      
      public static const §_-99Y§:String = "sku";
      
      private var §_-BzH§:String = "";
      
      private var §_-nM§:String = "";
      
      private var §_-A46§:String = "";
      
      private var §_-AGA§:String = "";
      
      private var §_-4R5§:String = "";
      
      private var _inited:Boolean = false;
      
      private var _initCallbacks:Array = [];
      
      private var _friendProfiles:Array = null;
      
      private var _jsBridge:§_-9z7§ = null;
      
      public function §_-3nQ§()
      {
         super();
      }
      
      override public function configure(param1:Object, param2:§_-6gH§) : void
      {
         §_-6hS§ = "json";
         super.configure(param1,param2);
         if(param1.hasOwnProperty(§_-5Cl§))
         {
            this.§_-BzH§ = param1[§_-5Cl§];
         }
         if(param1.hasOwnProperty(§_-1nK§))
         {
            this.§_-nM§ = param1[§_-1nK§];
         }
         if(param1.hasOwnProperty(§_-Ax§))
         {
            this.§_-A46§ = param1[§_-Ax§];
         }
         if(param1.hasOwnProperty(§_-2-r§))
         {
            this.§_-AGA§ = param1[§_-2-r§];
         }
         if(param1.hasOwnProperty(§_-99Y§))
         {
            this.§_-4R5§ = param1[§_-99Y§];
         }
         Security.allowDomain("*");
         this._jsBridge = new §_-9z7§(_appId,this.§_-nM§,this.§_-AGA§);
         this._jsBridge.init();
         this._inited = true;
         dispatchEvent(new §_-8L3§(§_-8L3§.§_-As9§));
      }
      
      override public function get socialNetwork() : String
      {
         return §_-8BS§.§_-3YZ§;
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
         this._jsBridge.invite(function():void
         {
            if(successCallback != null)
            {
               successCallback();
            }
         });
      }
      
      override public function showPaymentBox(param1:§_-4rn§, param2:Function, param3:Function) : void
      {
         if(this.§_-AGA§ == "" || this.§_-AGA§ == null)
         {
            this._jsBridge.showLoginBox();
         }
         else
         {
            this._jsBridge.showPaymentBox(param1.serviceId,param1.quantity,this.§_-nM§,appId,this.§_-JF§,this.§_-A46§,this.§_-4R5§,param2,param3);
         }
      }
      
      public function showAds(param1:Function = null, param2:Function = null) : void
      {
         this._jsBridge.showAds(param1,param2);
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
         return "#";
      }
      
      override public function getAppLink(param1:String) : String
      {
         return "#";
      }
      
      override public function get userId() : String
      {
         return _userId + ":" + this.locale;
      }
      
      public function get §_-JF§() : String
      {
         return _userId;
      }
      
      public function get locale() : String
      {
         return this.§_-nM§ + ":" + this.§_-BzH§;
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
         if(uids.length == 1 && (uids[0] == this.userId || uids[0] == this.§_-JF§))
         {
            uids = ["current"];
            this._jsBridge.getCurrentUser(function(param1:Object):void
            {
               successCallback(parseProfiles([param1]));
            });
            return;
         }
         params = {
            "userid":uids.join(","),
            "pagesize":null,
            "pagenr":null
         };
         this.§_-5qa§(params,successCallback,errorCallback);
      }
      
      override public function getUserFriendProfiles(param1:Function, param2:Function) : void
      {
         var successCallback:Function = param1;
         var errorCallback:Function = param2;
         if(this._friendProfiles != null)
         {
            successCallback(this._friendProfiles);
            return;
         }
         this._jsBridge.getUserFriends(function(param1:Object):void
         {
            _friendProfiles = parseProfiles(param1["users"]);
            successCallback(_friendProfiles);
         },"friends");
      }
      
      override public function getUserFriendsIds(param1:Function, param2:Function) : void
      {
         param1([]);
      }
      
      override public function getUserAppFriendProfiles(param1:Function, param2:Function) : void
      {
         var successCallback:Function = param1;
         var errorCallback:Function = param2;
         if(this._friendProfiles != null)
         {
            successCallback(this._friendProfiles);
            return;
         }
         this._jsBridge.getUserFriends(function(param1:Object):void
         {
            _friendProfiles = parseProfiles(param1["users"]);
            successCallback(_friendProfiles);
         },"appfriends");
      }
      
      override public function getUserAppFriendsIds(param1:Function, param2:Function) : void
      {
         param1([]);
      }
      
      private function §_-5qa§(param1:Object, param2:Function, param3:Function) : void
      {
         /*
          * 