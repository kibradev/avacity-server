package §_-05v§
{
   import §_-1t9§.§_-4rn§;
   import §_-1t9§.§_-96c§;
   import §_-6BB§.§_-1KD§;
   import §_-6BB§.§_-2qC§;
   import §_-6BB§.§_-6gH§;
   import §_-6BB§.§_-8BS§;
   import §_-6BB§.§_-8L3§;
   
   public class §_-9me§ extends §_-2qC§
   {
      public static const §_-182§:String = "locale";
      
      public static const §_-7rQ§:String = "currency";
      
      public static const §_-CGq§:String = "usdRate";
      
      public static const §_-17K§:String = "eurRate";
      
      public static const §_-089§:String = "appUrl";
      
      public static const §_-1ip§:String = "RUB";
      
      public static const §_-8b4§:String = "EUR";
      
      public static const §_-2xT§:String = "USD";
      
      private var _jsBridge:§_-4xs§ = null;
      
      private var _initCallbacks:Array = [];
      
      private var §_-C1D§:String;
      
      private var §_-90d§:String;
      
      private var §_-3LW§:int = 100;
      
      private var §_-2GC§:int = 100;
      
      private var §_-Hd§:String = null;
      
      public function §_-9me§()
      {
         super();
      }
      
      override public function configure(param1:Object, param2:§_-6gH§) : void
      {
         §_-6hS§ = "JSON";
         super.configure(param1,param2);
         if(param1.hasOwnProperty(§_-182§))
         {
            this.§_-C1D§ = param1[§_-182§];
         }
         if(param1.hasOwnProperty(§_-7rQ§))
         {
            this.§_-90d§ = param1[§_-7rQ§];
         }
         if(param1.hasOwnProperty(§_-CGq§))
         {
            this.§_-3LW§ = param1[§_-CGq§];
         }
         if(param1.hasOwnProperty(§_-17K§))
         {
            this.§_-2GC§ = param1[§_-17K§];
         }
         if(param1.hasOwnProperty(§_-089§))
         {
            this.§_-Hd§ = param1[§_-089§];
         }
         this._jsBridge = new §_-4xs§();
         this._jsBridge.init(this.§_-ANT§,_appId,this.§_-5qB§);
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
      
      override public function isInstalled(param1:Array, param2:Function, param3:Function) : void
      {
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
         successCallback(this._jsBridge.inited);
      }
      
      override public function checkPermissions(param1:Array, param2:Function, param3:Function) : void
      {
         param2(true);
      }
      
      override public function installApp(param1:Function, param2:Function, param3:Array = null) : void
      {
         if(this._jsBridge.inited)
         {
            param1();
         }
      }
      
      override public function prepareSocialMedia(param1:§_-96c§, param2:Function, param3:Function) : void
      {
         param2(param1);
      }
      
      override public function get socialNetwork() : String
      {
         return §_-8BS§.§_-AVP§;
      }
      
      public function get locale() : String
      {
         return this.§_-C1D§;
      }
      
      public function get currency() : String
      {
         return this.§_-90d§;
      }
      
      override public function get pointsRate() : int
      {
         switch(this.currency)
         {
            case §_-8b4§:
               return this.§_-2GC§;
            case §_-2xT§:
               return this.§_-3LW§;
            default:
               return §_-2Yo§;
         }
      }
      
      override public function getAppLink(param1:String) : String
      {
         return this.§_-Hd§;
      }
      
      override public function getUsersProfiles(param1:Array, param2:Function, param3:Function) : void
      {
         var uids:Array = param1;
         var successCallback:Function = param2;
         var errorCallback:Function = param3;
         if(!this._jsBridge.inited)
         {
            this._initCallbacks.push(function():void
            {
               getUsersProfiles(uids,successCallback,errorCallback);
            });
            return;
         }
         if(uids.indexOf(_userId) >= 0 && uids.length == 1)
         {
            this._jsBridge.§_-7cH§(function(param1:Array):void
            {
               successCallback(param1);
            });
         }
         else
         {
            successCallback([]);
         }
      }
      
      override public function getUserAppFriendProfiles(param1:Function, param2:Function) : void
      {
         var successCallback:Function = param1;
         var errorCallback:Function = param2;
         if(!this._jsBridge.inited)
         {
            this._initCallbacks.push(function():void
            {
               getUserAppFriendProfiles(successCallback,errorCallback);
            });
            return;
         }
         this._jsBridge.getUserFriends(function(param1:Array):void
         {
            successCallback(param1);
         });
      }
      
      override public function getUserFriendProfiles(param1:Function, param2:Function) : void
      {
         var successCallback:Function = param1;
         var errorCallback:Function = param2;
         if(!this._jsBridge.inited)
         {
            this._initCallbacks.push(function():void
            {
               getUserFriendProfiles(successCallback,errorCallback);
            });
            return;
         }
         this._jsBridge.§_-22l§(function(param1:Array):void
         {
            successCallback(param1);
         });
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
         this._jsBridge.showPaymentBox(purchase,this.currency,this.pointsRate,function(param1:uint):void
         {
            successCallback(param1);
         },errorCallback);
      }
      
      protected function §_-5qB§(param1:String) : void
      {
         new §_-1KD§(§_-1KD§.§_-79y§,-1,param1);
      }
      
      override public function isAllowSocialMedia(param1:String) : Boolean
      {
         return false;
      }
   }
}

