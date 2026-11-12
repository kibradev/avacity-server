package §_-8xd§
{
   import §_-0Iu§.§_-4DK§;
   import §_-1t9§.§_-4Wb§;
   import §_-6BB§.§_-8BS§;
   import §_-6BB§.§_-8L3§;
   import §_-7Hk§.§_-1U4§;
   import §_-7Wy§.§_-5iT§;
   import §_-Aq0§.§_-4n-§;
   import §_-Aq0§.§_-9db§;
   
   public class UnauthorizedAdapter extends §_-1U4§
   {
      private var _successCallback:Function;
      
      public function UnauthorizedAdapter()
      {
         super();
         trace("UnauthorizedAdapter");
      }
      
      override public function get unauthorizedSocialId() : String
      {
         return §_-AW9§;
      }
      
      override public function get socialNetwork() : String
      {
         return §_-8BS§.§_-8f0§;
      }
      
      override protected function init(param1:String) : void
      {
         var uid:String = param1;
         callMethod("getAuthorisedUserId",{},function(param1:§_-9db§):void
         {
            var _loc2_:Function = null;
            §_-AW9§ = param1.§_-6Oe§()["uid"];
            _inited = true;
            _userId = param1.§_-6Oe§()["uid"];
            _successCallback();
            for each(_loc2_ in _initCallbacks)
            {
               _loc2_();
            }
            _initCallbacks = [];
            dispatchEvent(new §_-8L3§(§_-8L3§.§_-As9§));
         },function(param1:§_-4n-§):void
         {
         });
      }
      
      override public function getUsersProfiles(param1:Array, param2:Function, param3:Function) : void
      {
         var _loc4_:Array = null;
         var _loc5_:§_-4Wb§ = null;
         if(param1.length == 1 && param1.indexOf(userId) >= 0)
         {
            _loc4_ = [];
            _loc5_ = new §_-4Wb§();
            _loc5_.§_-5pW§ = false;
            _loc5_.id = §_-AW9§;
            _loc5_.firstName = "Unknown";
            _loc5_.lastName = "Unknown";
            _loc5_.birthday = "";
            _loc5_.§_-Bgn§ = 0;
            _loc5_.cityName = "";
            _loc5_.countryName = "";
            _loc5_.gender = §_-4Wb§.§_-2xx§;
            _loc4_.push(_loc5_);
            param2(_loc4_);
            return;
         }
         super.getUsersProfiles(param1,param2,param3);
      }
      
      override public function getUserFriendProfiles(param1:Function, param2:Function) : void
      {
         param1([]);
      }
      
      override public function installApp(param1:Function, param2:Function, param3:Array = null) : void
      {
         var unauthorizedUser:Object;
         var panel:§_-4DK§ = null;
         var successCallback:Function = param1;
         var errorCallback:Function = param2;
         var permissions:Array = param3;
         this._successCallback = successCallback;
         unauthorizedUser = {
            "uid":"",
            "sid":"",
            "name":"unauthorized",
            "online":false
         };
         panel = new §_-4DK§([unauthorizedUser],function(param1:§_-5iT§):void
         {
            init(param1.user.sid);
            panel.hide();
            successCallback();
         });
         panel.show();
      }
   }
}

