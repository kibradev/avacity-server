package §_-CNP§
{
   import §_-0uA§.§_-3YE§;
   import §_-1t9§.§_-4Wb§;
   import §_-6BB§.§_-6gH§;
   import §_-6BB§.§_-8BS§;
   import flash.external.ExternalInterface;
   
   public class §_-2u5§ extends §_-0NB§
   {
      private static const §_-2UF§:String = "getUserProfiles";
      
      private static const §_-5Sy§:String = "getFriendProfiles";
      
      private static const §_-Atf§:String = "auth";
      
      public function §_-2u5§()
      {
         super();
      }
      
      override public function configure(param1:Object, param2:§_-6gH§) : void
      {
         var options:Object = param1;
         var connector:§_-6gH§ = param2;
         super.configure(options,connector);
         try
         {
            if(ExternalInterface.available)
            {
               ExternalInterface.addCallback("onGetUserProfiles",this.onGetUserProfiles);
               ExternalInterface.addCallback("onGetFriendProfiles",this.onGetFriendProfiles);
            }
         }
         catch(error:Error)
         {
            §_-3YE§.error(error.message);
         }
      }
      
      override public function get userId() : String
      {
         return §_-3Lo§;
      }
      
      override public function get authUserId() : String
      {
         return §_-3Lo§;
      }
      
      override public function get socialNetwork() : String
      {
         return §_-8BS§.§_-7SL§;
      }
      
      override public function getUsersProfiles(param1:Array, param2:Function, param3:Function) : void
      {
         §_-1Tv§[§_-2UF§] = param2;
         §_-2Ue§[§_-2UF§] = param3;
         ExternalInterface.call("TGC." + §_-2UF§,param1);
      }
      
      override public function getUserFriendProfiles(param1:Function, param2:Function) : void
      {
         §_-1Tv§[§_-5Sy§] = param1;
         §_-2Ue§[§_-5Sy§] = param2;
         ExternalInterface.call("TGC." + §_-5Sy§);
      }
      
      private function parseProfiles(param1:Array) : Array
      {
         var _loc3_:Object = null;
         var _loc4_:§_-4Wb§ = null;
         var _loc5_:String = null;
         var _loc2_:Array = [];
         for each(_loc3_ in param1)
         {
            _loc4_ = new §_-4Wb§();
            for(_loc5_ in _loc3_)
            {
               if(_loc4_.hasOwnProperty(_loc5_))
               {
                  _loc4_[_loc5_] = _loc3_[_loc5_];
               }
            }
            _loc2_.push(_loc4_);
         }
         return _loc2_;
      }
      
      protected function onGetUserProfiles(param1:Array) : void
      {
         var _loc4_:Function = null;
         §_-3YE§.info("onGetUserProfiles" + param1);
         if(param1 == null)
         {
            if(§_-2Ue§.hasOwnProperty(§_-2UF§))
            {
               _loc4_ = §_-2Ue§[§_-2UF§];
               §_-6jc§(§_-2UF§);
               _loc4_();
            }
            return;
         }
         var _loc2_:Array = this.parseProfiles(param1);
         var _loc3_:Function = §_-1Tv§[§_-2UF§];
         _loc3_(_loc2_);
      }
      
      protected function onGetFriendProfiles(param1:Array) : void
      {
         var _loc4_:Function = null;
         §_-3YE§.info("onGeFriendProfiles" + param1);
         if(param1 == null)
         {
            if(§_-2Ue§.hasOwnProperty(§_-5Sy§))
            {
               _loc4_ = §_-2Ue§[§_-5Sy§];
               §_-6jc§(§_-5Sy§);
               _loc4_();
            }
            return;
         }
         var _loc2_:Array = this.parseProfiles(param1);
         var _loc3_:Function = §_-1Tv§[§_-5Sy§];
         if(_loc3_ != null)
         {
            _loc3_(_loc2_);
         }
      }
   }
}

