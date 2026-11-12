package §_-6BB§
{
   import §_-1t9§.§_-4Wb§;
   import §_-Aq0§.§_-4n-§;
   import §_-Aq0§.§_-9db§;
   
   public class §_-2LX§ extends §_-2qC§
   {
      protected static const §_-CQu§:String = "users.getInfo";
      
      protected static const §_-75u§:String = "friends.getAppUsers";
      
      protected static const §_-0Ns§:String = "friends.get";
      
      public function §_-2LX§()
      {
         super();
      }
      
      override public function configure(param1:Object, param2:§_-6gH§) : void
      {
         super.configure(param1,param2);
      }
      
      override public function getUserAppFriendProfiles(param1:Function, param2:Function) : void
      {
         var successCallback:Function = param1;
         var errorCallback:Function = param2;
         this.getUserAppFriendsIds(function(param1:Array):void
         {
            if(param1.length == 0)
            {
               successCallback([]);
               return;
            }
            getUsersProfiles(param1,successCallback,errorCallback);
         },errorCallback);
      }
      
      override public function getUserAppFriendsIds(param1:Function, param2:Function) : void
      {
         var successCallback:Function = param1;
         var errorCallback:Function = param2;
         this.callMethod(this.getMethodParams(§_-75u§),function(param1:§_-9db§):void
         {
            var _loc2_:* = param1.§_-6Oe§();
            if(checkError(_loc2_,errorCallback))
            {
               successCallback(!!(_loc2_ as Object).hasOwnProperty("uids") ? _loc2_["uids"] : []);
            }
         },function(param1:§_-4n-§):void
         {
            errorCallback(new §_-1KD§(§_-1KD§.NETWORK_ERROR,param1.errorCode,param1.§_-5-l§));
         });
      }
      
      override public function getUserFriendProfiles(param1:Function, param2:Function) : void
      {
         var successCallback:Function = param1;
         var errorCallback:Function = param2;
         this.getUserFriendsIds(function(param1:Array):void
         {
            if(param1.length == 0)
            {
               successCallback([]);
               return;
            }
            getUsersProfiles(param1,successCallback,errorCallback);
         },errorCallback);
      }
      
      override public function getUserFriendsIds(param1:Function, param2:Function) : void
      {
         var successCallback:Function = param1;
         var errorCallback:Function = param2;
         this.callMethod(this.getMethodParams(§_-0Ns§),function(param1:§_-9db§):void
         {
            var _loc2_:* = param1.§_-6Oe§();
            if(checkError(_loc2_,errorCallback))
            {
               successCallback(_loc2_);
            }
         },function(param1:§_-4n-§):void
         {
            errorCallback(new §_-1KD§(§_-1KD§.NETWORK_ERROR,param1.errorCode,param1.§_-5-l§));
         });
      }
      
      override public function getUsersProfiles(param1:Array, param2:Function, param3:Function) : void
      {
         var uids:Array = param1;
         var successCallback:Function = param2;
         var errorCallback:Function = param3;
         this.callMethod(this.getMethodParams(§_-CQu§,uids),function(param1:§_-9db§):void
         {
            var _loc3_:Array = null;
            var _loc2_:* = param1.§_-6Oe§();
            if(checkError(_loc2_,errorCallback))
            {
               _loc3_ = parseProfiles(_loc2_);
               successCallback(_loc3_);
            }
         },function(param1:§_-4n-§):void
         {
            errorCallback(new §_-1KD§(§_-1KD§.NETWORK_ERROR,param1.errorCode,param1.§_-5-l§));
         });
      }
      
      protected function callMethod(param1:Object, param2:Function, param3:Function) : void
      {
      }
      
      protected function getMethodParams(param1:String, param2:Array = null) : String
      {
         return null;
      }
      
      protected function getParams(param1:String, param2:Array) : String
      {
         return null;
      }
      
      protected function getSig(param1:String, param2:String = null) : String
      {
         return null;
      }
      
      protected function checkError(param1:Object, param2:Function) : Boolean
      {
         return true;
      }
      
      protected function parseProfiles(param1:Object) : Array
      {
         var _loc3_:Object = null;
         var _loc4_:§_-4Wb§ = null;
         var _loc2_:Array = [];
         for each(_loc3_ in param1)
         {
            _loc4_ = new §_-4Wb§();
            _loc4_.rawData = _loc3_;
            _loc4_.id = !!_loc3_.hasOwnProperty("uid") ? _loc3_["uid"] : "0";
            _loc4_.firstName = !!_loc3_.hasOwnProperty("first_name") ? _loc3_["first_name"] : "";
            _loc4_.lastName = !!_loc3_.hasOwnProperty("last_name") ? _loc3_["last_name"] : "";
            _loc4_.§_-CXL§ = !!_loc3_.hasOwnProperty("name") ? _loc3_["name"] : "";
            _loc4_.gender = Boolean(_loc3_.hasOwnProperty("gender")) && _loc3_["gender"] == "male" ? uint(§_-4Wb§.§_-dv§) : uint(§_-4Wb§.§_-BYe§);
            _loc4_.birthday = !!_loc3_.hasOwnProperty("birthday") ? this.§_-ADK§(_loc3_["birthday"]) : "";
            _loc4_.photoUrl = !!_loc3_.hasOwnProperty("pic_2") ? _loc3_["pic_2"] : "";
            _loc4_.§_-5pW§ = Boolean(_loc3_.hasOwnProperty("pic_2")) && _loc3_["pic_2"] != "";
            if(_loc3_.hasOwnProperty("location"))
            {
               _loc4_.cityId = !!(_loc3_["location"] as Object).hasOwnProperty("city") ? uint(this.§_-1jh§(_loc3_["location"]["city"])) : 0;
               _loc4_.cityName = !!(_loc3_["location"] as Object).hasOwnProperty("city") ? _loc3_["location"]["city"] : "";
               _loc4_.§_-B1w§ = !!(_loc3_["location"] as Object).hasOwnProperty("country") ? uint(this.§_-1jh§(_loc3_["location"]["country"])) : 0;
               _loc4_.countryName = !!(_loc3_["location"] as Object).hasOwnProperty("country") ? _loc3_["location"]["country"] : "";
            }
            _loc2_.push(_loc4_);
         }
         return _loc2_;
      }
      
      protected function §_-ADK§(param1:String) : String
      {
         var _loc3_:Date = null;
         var _loc2_:Array = param1.split("-");
         if(_loc2_.length == 3)
         {
            _loc3_ = new Date();
            _loc3_.setFullYear(_loc2_[0],_loc2_[1],_loc2_[2]);
            _loc3_.setHours(0);
            _loc3_.setMinutes(0);
            _loc3_.setSeconds(0);
            _loc3_.setMilliseconds(0);
            return String(Math.round(_loc3_.getTime() / 1000));
         }
         return "";
      }
      
      protected function §_-1jh§(param1:String) : int
      {
         var _loc2_:uint = 0;
         var _loc3_:uint = 0;
         while(_loc3_ < param1.length)
         {
            _loc2_ += param1.charCodeAt(_loc3_);
            _loc3_++;
         }
         return _loc2_;
      }
   }
}

