package §_-1x4§
{
   import §_-0z0§.§_-0No§;
   import §_-0z0§.§_-Dz§;
   import §_-1t9§.§_-4Wb§;
   import §_-1t9§.§_-4rn§;
   import §_-1t9§.§_-96c§;
   import §_-6-L§.§_-6aF§;
   import §_-6BB§.§_-1KD§;
   import §_-6BB§.§_-2qC§;
   import §_-6BB§.§_-6gH§;
   import §_-6BB§.§_-8BS§;
   import §_-6BB§.§_-8L3§;
   import §_-8a5§.§_-2IQ§;
   import §_-Xm§.MultipartURLLoader;
   import com.facebook.graph.Facebook;
   import com.facebook.graph.core.FacebookURLDefaults;
   import com.facebook.graph.data.FacebookAuthResponse;
   import flash.events.ErrorEvent;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.net.URLRequest;
   import flash.net.navigateToURL;
   
   public class FacebookAdapter extends §_-2qC§
   {
      private static const §_-CV7§:String = "v8.0";
      
      private static const §_-3kr§:int = 10;
      
      private static const PERMISSION_EMAIL:String = "email";
      
      private static const PERMISSION_PUBLISH:String = "publish_actions";
      
      private static const PERMISSION_FRIENDS:String = "user_friends";
      
      private static const §_-BAV§:String = "user_birthday";
      
      private static const §_-0zk§:String = "App Installed";
      
      private static const §_-6h7§:String = "Tutorials Started";
      
      private static const §_-5bj§:String = "Friends Invited";
      
      private static const §_-03c§:String = "fb_mobile_tutorial_completion";
      
      private static const §_-5RI§:String = "fb_mobile_level_achieved";
      
      private static const §_-3J4§:String = "fb_level";
      
      private static const §_-5Mf§:String = "Count";
      
      public static const §_-Aa8§:String = "requestIds";
      
      public static const §_-u7§:String = "appLink";
      
      public static const §_-7lO§:String = "refType";
      
      public static const §_-Ze§:String = "refId";
      
      public static const §_-28y§:String = "countryCode";
      
      public static const §_-9xV§:String = "products";
      
      public static const §_-6m9§:String = "oldBilling";
      
      private var _authResponse:FacebookAuthResponse = null;
      
      private var §_-BEI§:Array = [];
      
      protected var §_-AnZ§:Array = [];
      
      protected var §_-1aB§:String = "";
      
      protected var §_-Asi§:String = "";
      
      protected var §_-8N7§:String = "";
      
      protected var §_-4UG§:String = "";
      
      protected var §_-3n§:String = null;
      
      protected var §_-6q§:Object = {};
      
      protected var §_-5bQ§:Boolean = false;
      
      private var §_-BX6§:Object = {};
      
      private var §_-hi§:Object = {};
      
      private var _mobilePrices:§_-0No§ = null;
      
      public function FacebookAdapter()
      {
         super();
      }
      
      override public function configure(param1:Object, param2:§_-6gH§) : void
      {
         super.configure(param1,param2);
         if(param1.hasOwnProperty(§_-Aa8§))
         {
            this.§_-AnZ§ = param1[§_-Aa8§];
         }
         if(param1.hasOwnProperty(§_-u7§))
         {
            this.§_-1aB§ = param1[§_-u7§];
         }
         if(param1.hasOwnProperty(§_-7lO§))
         {
            this.§_-8N7§ = param1[§_-7lO§];
         }
         if(param1.hasOwnProperty(§_-Ze§))
         {
            this.§_-4UG§ = param1[§_-Ze§];
         }
         if(param1.hasOwnProperty(§_-28y§))
         {
            this.§_-3n§ = param1[§_-28y§];
         }
         if(param1.hasOwnProperty(§_-9xV§))
         {
            this.§_-6q§ = param1[§_-9xV§];
         }
         if(param1.hasOwnProperty(§_-6m9§))
         {
            this.§_-5bQ§ = param1[§_-6m9§];
         }
         Facebook.init(_appId,this.onInit,{
            "frictionlessRequests":true,
            "version":§_-CV7§,
            "status":true
         });
      }
      
      private function onInit(param1:FacebookAuthResponse, param2:* = null) : void
      {
         var count:int;
         var i:int;
         var callback:Function = null;
         var authResponse:FacebookAuthResponse = param1;
         var data:* = param2;
         this._authResponse = authResponse;
         count = int(this.§_-BEI§.length);
         i = 0;
         while(i < count)
         {
            callback = this.§_-BEI§.shift();
            callback();
            i++;
         }
         dispatchEvent(new §_-8L3§(§_-8L3§.§_-As9§));
         if(this.§_-AnZ§.length > 0 && this.§_-AnZ§[0] != "")
         {
            Facebook.api("/" + §_-CV7§ + "/" + this.§_-AnZ§[0],function(param1:Object, param2:Object = null):void
            {
               var response:Object = param1;
               var error:Object = param2;
               if(!§_-4CJ§(response,error,function(param1:§_-1KD§):void
               {
               }))
               {
                  if(!response.hasOwnProperty("from") && !response["from"].hasOwnProperty("id"))
                  {
                     return;
                  }
                  §_-Asi§ = response["from"]["id"];
               }
            });
         }
      }
      
      override public function get socialNetwork() : String
      {
         return §_-8BS§.§_-BOa§;
      }
      
      override public function inviteUsers(param1:Array, param2:String, param3:Function, param4:Function) : void
      {
         var ids:Array = param1;
         var message:String = param2;
         var successCallback:Function = param3;
         var errorCallback:Function = param4;
         var data:Object = {
            "message":message,
            "filters":["app_non_users"]
         };
         if(ids is Array && ids.length > 0)
         {
            data["to"] = ids;
         }
         Facebook.ui("apprequests",data,function(param1:Object):void
         {
            if(successCallback != null && param1 != null)
            {
               if(param1.hasOwnProperty("to"))
               {
                  §_-1Aq§((param1.to as Array).length);
               }
               successCallback();
            }
         });
      }
      
      override public function showPaymentBox(param1:§_-4rn§, param2:Function, param3:Function) : void
      {
         var productUrl:String = null;
         var purchase:§_-4rn§ = param1;
         var successCallback:Function = param2;
         var errorCallback:Function = param3;
         var data:Object = {};
         if(this.§_-5bQ§)
         {
            data = {
               "credits_purchase":false,
               "order_info":purchase.serviceId
            };
            if(purchase.tags != null)
            {
               data = §_-6aF§.merge(purchase.tags,data);
            }
            Facebook.ui("pay",data,function(param1:Object):void
            {
               if(param1.hasOwnProperty("order_id"))
               {
                  if(successCallback != null)
                  {
                     successCallback(null);
                  }
               }
               else if(param1.hasOwnProperty("error_code"))
               {
                  errorCallback(new §_-1KD§(§_-1KD§.NETWORK_ERROR,param1["error_code"],param1["error_message"]));
               }
               else
               {
                  errorCallback(new §_-1KD§(§_-1KD§.§_-7qk§));
               }
            });
         }
         else
         {
            productUrl = !!this.§_-6q§.hasOwnProperty(purchase.serviceId) ? this.§_-6q§[purchase.serviceId] : this.§_-6q§["default"];
            data = {
               "action":"purchaseitem",
               "product":productUrl,
               "quantity":purchase.quantity
            };
            if(purchase.tags != null)
            {
               data = §_-6aF§.merge(purchase.tags,data);
            }
            Facebook.ui("pay",data,function(param1:Object):void
            {
               if(param1 != null && Boolean(param1.hasOwnProperty("payment_id")) && Boolean(param1.hasOwnProperty("status")) && param1["status"] == "completed")
               {
                  if(successCallback != null)
                  {
                     successCallback(param1["payment_id"]);
                  }
               }
               else if(param1 != null && Boolean(param1.hasOwnProperty("error_code")))
               {
                  errorCallback(new §_-1KD§(§_-1KD§.NETWORK_ERROR,param1["error_code"],param1["error_message"]));
               }
               else
               {
                  errorCallback(new §_-1KD§(§_-1KD§.§_-7qk§));
               }
            });
         }
      }
      
      public function §_-8ow§(param1:String, param2:Object = null, param3:Function = null, param4:String = "POST") : void
      {
         var path:String = param1;
         var params:Object = param2;
         var callback:Function = param3;
         var method:String = param4;
         if(callback == null)
         {
            callback = function(param1:*, param2:*):void
            {
            };
         }
         Facebook.api(path,callback,params,method);
      }
      
      override public function isAllowSocialMedia(param1:String) : Boolean
      {
         return [§_-96c§.§_-Anq§,§_-96c§.§_-6SG§,§_-96c§.§_-4Ir§,§_-96c§.§_-9IO§].indexOf(param1) >= 0;
      }
      
      override public function hasSocialFeature(param1:String) : Boolean
      {
         return [§_-0CY§,§_-35K§].indexOf(param1) >= 0;
      }
      
      override public function prepareSocialMedia(param1:§_-96c§, param2:Function, param3:Function) : void
      {
         /*
          * 