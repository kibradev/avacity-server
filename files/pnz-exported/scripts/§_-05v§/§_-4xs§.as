package §_-05v§
{
   import §_-0uA§.§_-3YE§;
   import §_-1t9§.§_-4Wb§;
   import §_-1t9§.§_-4rn§;
   import flash.external.ExternalInterface;
   
   public class §_-4xs§
   {
      private const §_-Bvm§:String = "ok";
      
      private const §_-9TT§:String = "error";
      
      private const §_-6T8§:String = "male";
      
      private const §_-6gd§:String = "female";
      
      private var _userId:String = null;
      
      private var _initCallback:Function = null;
      
      private var _inited:Boolean = false;
      
      private var §_-2Gx§:Function = null;
      
      private var §_-B4L§:Function = null;
      
      private var §_-6GD§:Function = null;
      
      private var §_-3lA§:Function = null;
      
      private var §_-6hN§:Function = null;
      
      private var §_-6LA§:Function = null;
      
      private var §_-2Xi§:Function = null;
      
      private const script_js:XML = <script>
				<![CDATA[
                            function() {

                                GMAS = {
                                    swfObjectID: "",
                                    externalApi: null,

                                    setSwfObjectID: function(swfObjectID ) {
                                        GMAS.swfObjectID = swfObjectID;
                                    },

                                    init: function(appId) {
                                        iframeApi = window.iframeApi;
                                        if (typeof iframeApi === 'undefined') {
                                            GMAS.error('Cannot find iframeApi function, are we inside an iframe?');
                                            return;
                                        }

                                        var externalApi = null;

                                        var callbacks = {
                                            appid: appId,

                                            getLoginStatusCallback: GMAS.onLoginStatus,
                                            userInfoCallback: GMAS.onUserInfo,
                                            registerUserCallback: GMAS.onRegisterUser,
                                            userConfirmCallback: GMAS.onUserConfirm,
                                            confirmWindowClosedCallback: GMAS.onConfirmWindowClosed,
                                            paymentReceivedCallback: GMAS.onPaymentReceived,
                                            paymentWindowClosedCallback: GMAS.onPaymentWindowClosed,
                                            paymentFrameUrlCallback: GMAS.paymentFrameUrlCallback,
                                            getAuthTokenCallback: GMAS.getAuthTokenCallback,
                                            userProfileCallback: GMAS.onGetUserProfile,
                                            userFriendsCallback: GMAS.onGetUserFriends,
                                            userSocialFriendsCallback: GMAS.onGetUserSocialFriends
                                        };
                                        iframeApi(callbacks).then(GMAS.connected, GMAS.error);
                                    },

                                    error: function (err) {
                                        GMAS.getSwf().onError(err);
                                    },

                                    connected: function (api) {
                                        GMAS.externalApi = api;
                                        GMAS.getLoginStatus();

                                    },

                                    // <!-- API functions -->

                                    getLoginStatus: function () {
                                        GMAS.externalApi.getLoginStatus();
                                    },

                                    authUser: function (){
                                        GMAS.externalApi.authUser();
                                    },

                                    getUserInfo: function () {
                                        GMAS.externalApi.userInfo();
                                    },

                                    registerUser: function () {
                                        GMAS.externalApi.registerUser();
                                    },

                                    registerUserNoConfirm: function () {
                                        GMAS.externalApi.registerUser();
                                    },

                                    userConfirm: function () {
                                        GMAS.externalApi.userConfirm();
                                    },

                                    paymentFrame: function (args){
                                        GMAS.externalApi.paymentFrame(args);
                                    },

                                    paymentFrameUrl: function (args){
                                        GMAS.externalApi.paymentFrameUrl(args);
                                    },

                                    getAuthToken: function (){
                                        GMAS.externalApi.getAuthToken();
                                    },

                                    userProfile: function (){
                                        GMAS.externalApi.userProfile();
                                    },

                                    userFriends: function (){
                                        GMAS.externalApi.userFriends();
                                    },

                                    userSocialFriends: function (){
                                        GMAS.externalApi.userSocialFriends();
                                    },

                                    // <!-- Callbacks -->

                                    onLoginStatus: function (status) {
                                        if (status.loginStatus == 2) {
                                            GMAS.getSwf().inited();
                                        } else if (status.loginStatus == 0) {
                                            GMAS.authUser();
                                        } else if (status.loginStatus == 1) {
                                            GMAS.registerUser();
                                        }
                                    },

                                    onUserInfo: function (info) {
                                        GMAS.getSwf().onUserInfo(info);
                                    },

                                    onRegisterUser: function (info) {
                                        if (info.status == 'ok'){
                                            GMAS.onLoginStatus();
                                        }
                                    },

                                    onUserConfirm: function (status) {
                                        GMAS.getSwf().onUserConfirm(status);
                                    },

                                    onConfirmWindowClosed: function () {
                                        GMAS.getSwf().onConfirmWindowClosed();
                                    },

                                    onPaymentReceived: function () {
                                        GMAS.getSwf().onPaymentReceived(data);
                                    },

                                    onPaymentWindowClosed: function () {
                                        GMAS.getSwf().onPaymentWindowClosed();
                                    },

                                    paymentFrameUrlCallback: function (url) {
                                        GMAS.getSwf().paymentFrameUrlCallback(url);
                                    },

                                    getAuthTokenCallback: function (token) {
                                        GMAS.getSwf().getAuthTokenCallback(token);
                                    },

                                    onGetUserProfile: function (status) {
                                        GMAS.getSwf().onGetUserProfile(status);
                                    },

                                    onGetUserFriends: function (status) {
                                        GMAS.getSwf().onGetUserFriends(status);
                                    },

                                    onGetUserSocialFriends: function (status) {
                                        GMAS.getSwf().onGetUserSocialFriends(status);
                                    },

                                    getSwf: function() {
                                        return document.getElementById(GMAS.swfObjectID);
                                    }
                                };
                            }
]]>
			</script>;
      
      public function §_-4xs§()
      {
         super();
         try
         {
            if(ExternalInterface.available)
            {
               ExternalInterface.call(this.script_js);
               ExternalInterface.call("GMAS.setSwfObjectID",ExternalInterface.objectID);
            }
         }
         catch(error:Error)
         {
         }
      }
      
      public function init(param1:Function, param2:String, param3:Function) : void
      {
         var callback:Function = param1;
         var appId:String = param2;
         var errorCallback:Function = param3;
         this.§_-2Xi§ = errorCallback;
         try
         {
            if(ExternalInterface.available)
            {
               ExternalInterface.addCallback("inited",this.§_-87Y§);
               ExternalInterface.addCallback("onLoginStatus",this.onLoginStatus);
               ExternalInterface.addCallback("onUserInfo",this.onUserInfo);
               ExternalInterface.addCallback("onRegisterUser",this.onRegisterUser);
               ExternalInterface.addCallback("onUserConfirm",this.onUserConfirm);
               ExternalInterface.addCallback("onPaymentReceived",this.onPaymentReceived);
               ExternalInterface.addCallback("onPaymentWindowClosed",this.onPaymentWindowClosed);
               ExternalInterface.addCallback("onPaymentWindowClosed",this.§_-3rA§);
               ExternalInterface.addCallback("paymentFrameUrlCallback",this.paymentFrameUrlCallback);
               ExternalInterface.addCallback("getAuthTokenCallback",this.getAuthTokenCallback);
               ExternalInterface.addCallback("onGetUserProfile",this.onGetUserProfile);
               ExternalInterface.addCallback("onGetUserFriends",this.onGetUserFriends);
               ExternalInterface.addCallback("onGetUserSocialFriends",this.onGetUserSocialFriends);
               ExternalInterface.addCallback("onError",this.onError);
               this._initCallback = callback;
               ExternalInterface.call("GMAS.init",appId);
            }
         }
         catch(error:Error)
         {
            §_-3YE§.error(error.message);
         }
      }
      
      public function get userId() : String
      {
         return this._userId;
      }
      
      public function authUser() : void
      {
         ExternalInterface.call("GMAS.authUser");
      }
      
      public function registerUser() : void
      {
         ExternalInterface.call("GMAS.registerUser");
      }
      
      public function §_-3ym§(param1:Object) : void
      {
         ExternalInterface.call("GMAS.paymentFrame",param1);
      }
      
      public function §_-1gY§(param1:Object) : void
      {
         ExternalInterface.call("GMAS.paymentFrameUrl",param1);
      }
      
      public function getAuthToken(param1:Function) : void
      {
         this.§_-6LA§ = param1;
         ExternalInterface.call("GMAS.getAuthToken");
      }
      
      public function getUserInfo() : void
      {
         ExternalInterface.call("GMAS.getUserInfo");
      }
      
      public function §_-7cH§(param1:Function) : void
      {
         this.§_-6GD§ = param1;
         ExternalInterface.call("GMAS.userProfile");
      }
      
      public function getUserFriends(param1:Function) : void
      {
         this.§_-6hN§ = param1;
         ExternalInterface.call("GMAS.userFriends");
      }
      
      public function §_-22l§(param1:Function) : void
      {
         this.§_-3lA§ = param1;
         ExternalInterface.call("GMAS.userSocialFriends");
      }
      
      public function showPaymentBox(param1:§_-4rn§, param2:String, param3:int, param4:Function, param5:Function) : void
      {
         this.§_-2Gx§ = param4;
         this.§_-B4L§ = param5;
         var _loc6_:Number = Math.round(param1.pointsPrice / param3 * 100) / 100;
         var _loc7_:Object = {
            "amount":_loc6_,
            "description":param1.description,
            "currency":param2,
            "serviceId":param1.serviceId
         };
         var _loc8_:Object = {"merchant_param":_loc7_};
         this.§_-3ym§(_loc8_);
      }
      
      private function §_-87Y§() : void
      {
         var _loc1_:Function = null;
         this._inited = true;
         if(this._initCallback != null)
         {
            _loc1_ = this._initCallback;
            this._initCallback = null;
            _loc1_();
         }
      }
      
      private function error(param1:String) : void
      {
         this.§_-2Xi§(param1);
      }
      
      private function onError(param1:Object) : void
      {
         this.error(param1.toString());
      }
      
      private function §_-2mM§(param1:Object, param2:String) : Boolean
      {
         var _loc4_:int = 0;
         var _loc5_:String = null;
         var _loc3_:String = !!param1.hasOwnProperty("status") ? param1["status"] : null;
         if(_loc3_ == null)
         {
            this.error(param2 + " statusName is null");
            return false;
         }
         if(param1 == this.§_-9TT§)
         {
            _loc4_ = !!param1.hasOwnProperty("errcode") ? int(param1["errcode"]) : 0;
            _loc5_ = !!param1.hasOwnProperty("errmsg") ? param1["errmsg"] : null;
            this.error(param2 + " status Error. Code: " + _loc4_ + ". " + _loc5_);
            return false;
         }
         return true;
      }
      
      private function onLoginStatus(param1:Object) : void
      {
         if(!this.§_-2mM§(param1,"onLoginStatus"))
         {
            return;
         }
      }
      
      private function onUserInfo(param1:Object) : void
      {
         if(!this.§_-2mM§(param1,"onUserInfo"))
         {
            return;
         }
      }
      
      private function onRegisterUser(param1:Object) : void
      {
         if(!this.§_-2mM§(param1,"onRegisterUser"))
         {
            return;
         }
         ExternalInterface.call("GMAS.getLoginStatus");
      }
      
      private function onUserConfirm(param1:Object) : void
      {
         if(!this.§_-2mM§(param1,"onUserConfirm"))
         {
            return;
         }
      }
      
      private function onPaymentReceived(param1:Object) : void
      {
      }
      
      private function onPaymentWindowClosed() : void
      {
      }
      
      private function §_-3rA§() : void
      {
      }
      
      private function paymentFrameUrlCallback() : void
      {
      }
      
      private function getAuthTokenCallback(param1:Object) : void
      {
         var _loc5_:Function = null;
         if(!this.§_-2mM§(param1,"getAuthTokenCallback"))
         {
            return;
         }
         var _loc2_:String = !!param1.hasOwnProperty("status") ? param1["status"] : null;
         var _loc3_:int = -1;
         var _loc4_:String = null;
         if(_loc2_ == this.§_-Bvm§)
         {
            _loc3_ = !!param1.hasOwnProperty("uid") ? int(param1["uid"]) : -1;
            _loc4_ = !!param1.hasOwnProperty("hash") ? param1["hash"] : null;
         }
         if(this.§_-6LA§ != null)
         {
            _loc5_ = this.§_-6LA§;
            this.§_-6LA§ = null;
            _loc5_(_loc4_);
         }
      }
      
      private function onGetUserProfile(param1:Object) : void
      {
         var _loc3_:§_-4Wb§ = null;
         var _loc4_:Function = null;
         var _loc5_:Array = null;
         if(!this.§_-2mM§(param1,"onGetUserProfile"))
         {
            return;
         }
         var _loc2_:String = !!param1.hasOwnProperty("status") ? param1["status"] : null;
         if(_loc2_ == this.§_-Bvm§)
         {
            _loc3_ = new §_-4Wb§();
            _loc3_.rawData = param1;
            _loc3_.id = !!param1.hasOwnProperty("uid") ? param1["uid"] : null;
            _loc3_.§_-CXL§ = !!param1.hasOwnProperty("nick") ? param1["nick"] : null;
            _loc3_.photoUrl = !!param1.hasOwnProperty("avatar") ? param1["avatar"] : null;
            _loc3_.birthday = !!param1.hasOwnProperty("birthyear") ? this.§_-9DU§(param1["birthyear"]) : null;
            _loc3_.gender = !!param1.hasOwnProperty("sex") ? uint(this.§_-AuM§(param1["sex"])) : 0;
         }
         if(this.§_-6GD§ != null)
         {
            _loc4_ = this.§_-6GD§;
            this.§_-6GD§ = null;
            _loc5_ = [];
            _loc5_.push(_loc3_);
            _loc4_(_loc5_);
         }
      }
      
      private function §_-9DU§(param1:String) : String
      {
         var _loc2_:Date = null;
         if(param1 != null && param1 != "")
         {
            _loc2_ = new Date();
            _loc2_.setFullYear(param1,0,1);
            _loc2_.setHours(0);
            _loc2_.setMinutes(0);
            _loc2_.setSeconds(0);
            _loc2_.setMilliseconds(0);
            return String(Math.round(_loc2_.getTime() / 1000));
         }
         return "";
      }
      
      private function §_-AuM§(param1:String) : int
      {
         var _loc2_:int = §_-4Wb§.§_-2xx§;
         if(param1 != null && param1 != "")
         {
            if(param1 == this.§_-6T8§)
            {
               _loc2_ = §_-4Wb§.§_-dv§;
            }
            else if(param1 == this.§_-6gd§)
            {
               _loc2_ = §_-4Wb§.§_-BYe§;
            }
         }
         return _loc2_;
      }
      
      private function onGetUserFriends(param1:Object) : void
      {
         var _loc4_:Function = null;
         if(!this.§_-2mM§(param1,"onGetUserFriends"))
         {
            return;
         }
         var _loc2_:Array = [];
         var _loc3_:String = !!param1.hasOwnProperty("status") ? param1["status"] : null;
         if(_loc3_ == this.§_-Bvm§)
         {
            this.§_-FA§(param1,_loc2_);
         }
         if(this.§_-6hN§ != null)
         {
            _loc4_ = this.§_-6hN§;
            this.§_-6hN§ = null;
            _loc4_(_loc2_);
         }
      }
      
      private function onGetUserSocialFriends(param1:Object) : void
      {
         var _loc4_:Function = null;
         if(!this.§_-2mM§(param1,"onGetUserSocialFriends"))
         {
            return;
         }
         var _loc2_:Array = [];
         var _loc3_:String = !!param1.hasOwnProperty("status") ? param1["status"] : null;
         if(_loc3_ == this.§_-Bvm§)
         {
            this.§_-FA§(param1,_loc2_);
         }
         if(this.§_-3lA§ != null)
         {
            _loc4_ = this.§_-3lA§;
            this.§_-3lA§ = null;
            _loc4_(_loc2_);
         }
      }
      
      private function §_-FA§(param1:Object, param2:Array) : void
      {
         var _loc4_:Object = null;
         var _loc5_:§_-4Wb§ = null;
         var _loc3_:Object = !!param1.hasOwnProperty("friends") ? param1["friends"] : null;
         if(_loc3_ != null && _loc3_.length != 0)
         {
            for each(_loc4_ in _loc3_)
            {
               _loc5_ = new §_-4Wb§();
               _loc5_.rawData = _loc4_;
               _loc5_.id = !!_loc4_.hasOwnProperty("uid") ? _loc4_["uid"] : null;
               _loc5_.§_-CXL§ = !!_loc4_.hasOwnProperty("nick") ? _loc4_["nick"] : null;
               _loc5_.photoUrl = !!_loc4_.hasOwnProperty("avatar") ? _loc4_["avatar"] : null;
               param2.push(_loc5_);
            }
         }
      }
      
      public function get inited() : Boolean
      {
         return this._inited;
      }
   }
}

