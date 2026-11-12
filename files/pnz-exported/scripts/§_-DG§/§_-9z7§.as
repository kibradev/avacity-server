package §_-DG§
{
   import §_-6BB§.§_-1KD§;
   import §_-uR§.§_-53f§;
   import flash.external.ExternalInterface;
   
   public class §_-9z7§ extends §_-53f§
   {
      private var _inited:Boolean = false;
      
      private var _appId:String = null;
      
      private var §_-nM§:String = null;
      
      private var §_-AGA§:String = null;
      
      private var §_-222§:Function = null;
      
      private var §_-6ca§:Array;
      
      private var _inviteCallback:Function = null;
      
      private var §_-4np§:Function = null;
      
      private var §_-6uV§:Function = null;
      
      private var §_-5PJ§:Function = null;
      
      private var §_-4iE§:Function = null;
      
      private var §_-5Xx§:Function = null;
      
      private const script_js:XML;
      
      public function §_-9z7§(param1:String, param2:String, param3:String)
      {
         var appId:String = param1;
         var siteId:String = param2;
         var userName:String = param3;
         this.§_-6ca§ = [];
         this.script_js = <script>
				<![CDATA[
    				function() {
						SPAS = {
			                swfObjectID: "",
			                inited: false,
			                spClient: null,
			                
							setSWFObjectID: function(swfObjectID) {
								SPAS.swfObjectID = swfObjectID;
							},
							
							init: function(appId, apiSecret) {
								SPAS.spClient = window.parent.SpilGames;
                                inited = true;
							},
							
                            onGetCurrentUser: function(user) {
                                SPAS.getSwf().handleCurrentUser(user);
                            },
                            
                            onGetUserFriends: function(friends, callId) {
                                SPAS.getSwf().handleUserFriends(friends, callId);
                            },
                            
                            onInvite: function(data) {
                                SPAS.getSwf().handleInvite();
                            },
                            
                            onPostActivity: function(data) {
                                SPAS.getSwf().handlePostActivity();
                            },
                            
                            onPayment: function(success) {
                                SPAS.getSwf().handlePayment(success);
                            },
                            
                            onStartAds: function() {
                                SPAS.getSwf().handleStartAds();
                            },
                            
                            onEndAds: function() {
                                SPAS.getSwf().handleEndAds();
                            },
                            
                            getCurrentUser: function() {
                                SPAS.spClient.Users.getCurrentUser({
                                    onsuccess: function(user) {
                                        SPAS.onGetCurrentUser(user);
                                    }
                                });
                            },
                            
                            getUserFriends: function(callId) {
                                SPAS.spClient.Users.getFriends({
                                    onsuccess: function(friends) {
                                        SPAS.onGetUserFriends(friends, callId);
                                    }
                                });
                            },
                            
                            invite: function(message) {
                                SPAS.spClient.Portal.showInviteFriends({onsuccess: SPAS.onInvite});
                            },
                            
                            postActivity: function(comment, image) {
                                SPAS.spClient.Activities.post({comment: comment, image: image, onsuccess: SPAS.onPostActivity});
                            },
                            
                            requestPayment: function(id, amount, siteId, gameId, userId, token, sku) {
                                var client = new PaymentClient();
                                //if (client.hasExternalTrigger()) {
                                    var options = {
                                        'siteId': siteId,
                                        'gameId': gameId,
                                        'userId': userId,
                                        'token': token,
                                        'params': 'amount=' + amount + '&packId=' + id,
                                        'urlSuccess': '#',
                                        'urlFailure': '#',
                                        'urlCancel': '#',
                                        'selectedSku': sku
                                    };
                                    client.onSuccess = function() { SPAS.onPayment(true); };
                                    client.onFailure = function() { SPAS.onPayment(false); };
                                    client.onCancel = function() { SPAS.onPayment(false); };
                                    client.showPaymentSelectionScreen(options);
                                //}
                            },
                            
                            showLoginBox: function() {
                                SPAS.spClient.Portal.forceAuthentication({onsuccess: function() {}});
                            },
                            
                            showAds: function() {
                                SPAS.spClient.Portal.requestGameBreak({onstart: SPAS.onStartAds, onend: SPAS.onEndAds});
                            },
                            
							getSwf: function() {
								return document.getElementById(SPAS.swfObjectID);
							}
						};
					}
				]]>
			</script>;
         super();
         this._appId = appId;
         this.§_-nM§ = siteId;
         this.§_-AGA§ = userName;
         try
         {
            if(ExternalInterface.available)
            {
               ExternalInterface.call(this.script_js);
               ExternalInterface.call("SPAS.setSWFObjectID",ExternalInterface.objectID);
            }
         }
         catch(error:Error)
         {
            throw new §_-1KD§(§_-1KD§.§_-79y§,-1,error.message);
         }
      }
      
      public function init() : void
      {
         try
         {
            if(!ExternalInterface.available)
            {
               throw new §_-1KD§(§_-1KD§.§_-79y§,-1,"External interface not ready");
            }
            ExternalInterface.addCallback("handleCurrentUser",this.§_-CIM§);
            ExternalInterface.addCallback("handleUserFriends",this.§_-6ej§);
            ExternalInterface.addCallback("handleInvite",this.onInvite);
            ExternalInterface.addCallback("handlePostActivity",this.§_-37V§);
            ExternalInterface.addCallback("handlePayment",this.onPayment);
            ExternalInterface.addCallback("handleStartAds",this.§_-5b8§);
            ExternalInterface.addCallback("handleEndAds",this.§_-9B-§);
            ExternalInterface.call("SPAS.init",this._appId);
         }
         catch(error:Error)
         {
            throw new §_-1KD§(§_-1KD§.§_-79y§,-1,error.message);
         }
      }
      
      public function get inited() : Boolean
      {
         return this._inited;
      }
      
      public function getCurrentUser(param1:Function) : void
      {
         this.§_-222§ = param1;
         ExternalInterface.call("SPAS.getCurrentUser");
      }
      
      public function getUserFriends(param1:Function, param2:String) : void
      {
         this.§_-6ca§[param2] = param1;
         ExternalInterface.call("SPAS.getUserFriends",param2);
      }
      
      public function invite(param1:Function) : void
      {
         this._inviteCallback = param1;
         ExternalInterface.call("SPAS.invite");
      }
      
      public function postActivity(param1:String, param2:String, param3:Function) : void
      {
         this.§_-4np§ = param3;
         ExternalInterface.call("SPAS.postActivity",param1,param2);
      }
      
      public function showLoginBox() : void
      {
         ExternalInterface.call("SPAS.showLoginBox");
      }
      
      public function showPaymentBox(param1:String, param2:int, param3:String, param4:String, param5:String, param6:String, param7:String, param8:Function, param9:Function) : void
      {
         this.§_-6uV§ = param8;
         this.§_-5PJ§ = param9;
         ExternalInterface.call("SPAS.requestPayment",param1,param2,param3,param4,param5,param6,param7);
      }
      
      public function showAds(param1:Function, param2:Function) : void
      {
         this.§_-4iE§ = param1;
         this.§_-5Xx§ = param2;
         ExternalInterface.call("SPAS.showAds");
      }
      
      private function §_-CIM§(param1:Object) : void
      {
         var _loc2_:Function = null;
         if(this.§_-222§ != null)
         {
            _loc2_ = this.§_-222§;
            this.§_-222§ = null;
            _loc2_(param1);
         }
      }
      
      private function §_-6ej§(param1:Object, param2:String) : void
      {
         var _loc3_:Function = null;
         if(this.§_-6ca§.hasOwnProperty(param2))
         {
            _loc3_ = this.§_-6ca§[param2];
            delete this.§_-6ca§[param2];
            _loc3_(param1);
         }
      }
      
      private function onInvite() : void
      {
         var _loc1_:Function = null;
         if(this._inviteCallback != null)
         {
            _loc1_ = this._inviteCallback;
            this._inviteCallback = null;
            _loc1_();
         }
      }
      
      private function §_-37V§() : void
      {
         var _loc1_:Function = null;
         if(this.§_-4np§ != null)
         {
            _loc1_ = this.§_-4np§;
            this.§_-4np§ = null;
            _loc1_();
         }
      }
      
      private function onPayment(param1:Boolean) : void
      {
         var _loc2_:Function = null;
         var _loc3_:Function = null;
         if(param1)
         {
            if(this.§_-6uV§ != null)
            {
               _loc2_ = this.§_-6uV§;
               this.§_-6uV§ = null;
               _loc2_();
            }
            this.§_-5PJ§ = null;
         }
         else
         {
            if(this.§_-5PJ§ != null)
            {
               _loc3_ = this.§_-5PJ§;
               this.§_-5PJ§ = null;
               _loc3_(new §_-1KD§(§_-1KD§.§_-9cu§,-1,"User payment fail"));
            }
            this.§_-6uV§ = null;
         }
      }
      
      private function §_-5b8§() : void
      {
         var _loc1_:Function = null;
         if(this.§_-4iE§ != null)
         {
            _loc1_ = this.§_-4iE§;
            this.§_-4iE§ = null;
            _loc1_();
         }
      }
      
      private function §_-9B-§() : void
      {
         var _loc1_:Function = null;
         if(this.§_-5Xx§ != null)
         {
            _loc1_ = this.§_-5Xx§;
            this.§_-5Xx§ = null;
            _loc1_();
         }
      }
   }
}

