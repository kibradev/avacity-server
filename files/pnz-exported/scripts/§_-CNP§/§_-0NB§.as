package §_-CNP§
{
   import §_-0uA§.§_-3YE§;
   import §_-1t9§.§_-4rn§;
   import §_-6BB§.§_-1KD§;
   import §_-6BB§.§_-2qC§;
   import §_-6BB§.§_-6gH§;
   import flash.external.ExternalInterface;
   
   public class §_-0NB§ extends §_-2qC§
   {
      public static const §_-Ii§:String = "tgcId";
      
      public static const §_-7eg§:String = "tgcAuthToken";
      
      public static const §_-1h0§:String = "tgcAuthTokenExpireIn";
      
      public static const §_-27r§:String = "tgcAuthTokenTimeDelta";
      
      private static const §_-1Wm§:int = 30;
      
      protected static const §_-07P§:String = "order";
      
      protected static const §_-Atf§:String = "auth";
      
      protected var §_-1Tv§:Object = {};
      
      protected var §_-2Ue§:Object = {};
      
      protected var §_-3Lo§:String;
      
      protected var §_-0hp§:String = null;
      
      protected var §_-4hj§:Number;
      
      protected var §_-BVS§:Number;
      
      public function §_-0NB§()
      {
         super();
      }
      
      override public function configure(param1:Object, param2:§_-6gH§) : void
      {
         var options:Object = param1;
         var connector:§_-6gH§ = param2;
         if(options.hasOwnProperty(§_-4Yz§))
         {
            §_-2Yo§ = options[§_-4Yz§];
         }
         if(options.hasOwnProperty(§_-Ii§))
         {
            this.§_-3Lo§ = options[§_-Ii§];
         }
         if(options.hasOwnProperty(§_-7eg§))
         {
            this.§_-0hp§ = options[§_-7eg§];
         }
         if(options.hasOwnProperty(§_-1h0§))
         {
            this.§_-4hj§ = Number(options[§_-1h0§]);
         }
         if(options.hasOwnProperty(§_-27r§))
         {
            this.§_-BVS§ = Number(options[§_-27r§]);
         }
         try
         {
            if(ExternalInterface.available)
            {
               ExternalInterface.addCallback("onGetAuthParams",this.onGetAuthParams);
               ExternalInterface.addCallback("handleOrderSuccess",this.onOrderSuccess);
               ExternalInterface.addCallback("handleOrderFail",this.onOrderFail);
            }
         }
         catch(error:Error)
         {
            §_-3YE§.error(error.message);
         }
      }
      
      public function getAuthParams(param1:Function) : void
      {
         var _loc2_:Date = new Date();
         var _loc3_:Number = Math.floor(_loc2_.getTime() / 1000);
         if(_loc3_ + this.§_-BVS§ + §_-1Wm§ > this.§_-4hj§)
         {
            this.§_-1Tv§[§_-Atf§] = param1;
            this.callExternalGetAuthParams();
         }
         else
         {
            param1({
               "auth_token":this.§_-0hp§,
               "tgc_id":this.§_-3Lo§
            });
         }
      }
      
      protected function callExternalGetAuthParams() : void
      {
         if(ExternalInterface.call("TGC.getAuthParams") == null)
         {
            this.onGetAuthParams({
               "accessToken":this.§_-0hp§,
               "accessExpiresIn":this.§_-4hj§
            });
         }
      }
      
      override public function showPaymentBox(param1:§_-4rn§, param2:Function, param3:Function) : void
      {
         this.§_-1Tv§[§_-07P§] = param2;
         this.§_-2Ue§[§_-07P§] = param3;
         var _loc4_:Object = {
            "serviceId":param1.serviceId,
            "serviceName":param1.serviceName,
            "quantity":param1.quantity,
            "description":param1.description,
            "pointsPrice":Math.ceil(param1.pointsPrice / §_-2Yo§),
            "exchangeRate":param1.exchangeRate,
            "tags":param1.tags
         };
         this.callTGCShowPaymentBox(_loc4_);
      }
      
      protected function callTGCShowPaymentBox(param1:Object) : void
      {
         if(ExternalInterface.available)
         {
            ExternalInterface.call("TGC.showPaymentBox",param1);
         }
      }
      
      protected function §_-6jc§(param1:String) : void
      {
         delete this.§_-1Tv§[param1];
         delete this.§_-2Ue§[param1];
      }
      
      protected function onGetAuthParams(param1:Object) : void
      {
         this.§_-0hp§ = param1["accessToken"];
         this.§_-4hj§ = param1["accessExpiresIn"];
         var _loc2_:Function = this.§_-1Tv§[§_-Atf§];
         if(_loc2_ != null)
         {
            _loc2_({
               "auth_token":this.§_-0hp§,
               "tgc_id":this.§_-3Lo§
            });
         }
         this.§_-6jc§(§_-Atf§);
      }
      
      protected function onOrderSuccess(param1:int) : void
      {
         var _loc2_:Function = null;
         if(this.§_-1Tv§[§_-07P§] != null)
         {
            _loc2_ = this.§_-1Tv§[§_-07P§];
            if(_loc2_ != null)
            {
               _loc2_(param1);
            }
         }
         this.§_-6jc§(§_-07P§);
      }
      
      protected function onOrderFail() : void
      {
         var _loc1_:Function = null;
         if(this.§_-2Ue§[§_-07P§] != null)
         {
            _loc1_ = this.§_-2Ue§[§_-07P§];
            _loc1_(new §_-1KD§(§_-1KD§.§_-7qk§,0,"Fail user order"));
         }
         this.§_-6jc§(§_-07P§);
      }
   }
}

