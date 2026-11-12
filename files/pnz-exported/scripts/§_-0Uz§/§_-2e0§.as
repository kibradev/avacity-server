package §_-0Uz§
{
   import §_-2qd§.§_-9ai§;
   import §_-B4a§.§_-75J§;
   import §_-BeZ§.§_-1e5§;
   import §_-BeZ§.§_-4Ww§;
   import §_-GM§.Context;
   
   public class §_-2e0§ extends §_-6v4§
   {
      private static const §_-0S1§:String = "chap.im";
      
      private static const §_-5mJ§:String = "chap.rpst";
      
      private static const §_-0hC§:String = "chap.sbsc";
      
      private static const §_-4w-§:String = "chap.nt";
      
      private static const ERROR:String = "chap.er";
      
      private static const §_-0Qk§:String = "socialId";
      
      private static const §_-yT§:String = "socialIds";
      
      private static const §_-56A§:String = "groupId";
      
      private static const §_-6oy§:String = "postId";
      
      private static const §_-1Ei§:String = "message";
      
      private static const §_-AFa§:String = Context.§_-5o8§.message("betaTestTitle");
      
      public function §_-2e0§()
      {
         super();
         §_-1-t§(§_-0S1§,this.§_-ANd§);
         §_-1-t§(§_-5mJ§,this.§_-Adn§);
         §_-1-t§(§_-4w-§,this.§_-CbP§);
         §_-1-t§(§_-0hC§,this.§_-7fH§);
         §_-1-t§(ERROR,this.onError);
      }
      
      public function §_-77i§(param1:String, param2:String) : void
      {
         var _loc3_:§_-4Ww§ = new §_-4Ww§();
         _loc3_.put(§_-0Qk§,Context.player.userInfo.socialId);
         if(param2 != null)
         {
            _loc3_.put(§_-0Qk§,param1);
            _loc3_.put(§_-56A§,param2);
            netClient.sendExtMessage(§_-0S1§,_loc3_);
         }
      }
      
      public function §_-1J5§(param1:String, param2:String) : void
      {
         var _loc3_:§_-4Ww§ = new §_-4Ww§();
         _loc3_.put(§_-0Qk§,Context.player.userInfo.socialId);
         if(param1 != null && param2 != null)
         {
            _loc3_.put(§_-0Qk§,param1);
            _loc3_.put(§_-6oy§,param2);
            netClient.sendExtMessage(§_-5mJ§,_loc3_);
         }
      }
      
      public function §_-0wM§(param1:String) : void
      {
         var _loc2_:§_-4Ww§ = new §_-4Ww§();
         if(param1 != null)
         {
            _loc2_.put(§_-0Qk§,param1);
            netClient.sendExtMessage(§_-0hC§,_loc2_);
         }
      }
      
      public function §_-19c§(param1:Array) : void
      {
         var _loc2_:§_-4Ww§ = new §_-4Ww§();
         _loc2_.§_-C21§(§_-yT§,new §_-1e5§(param1));
         _loc2_.put(§_-1Ei§,§_-AFa§);
         netClient.sendExtMessage(§_-4w-§,_loc2_);
      }
      
      public function sendCustomCommand(param1:String, param2:String, param3:§_-4Ww§) : void
      {
         netClient.sendExtMessage(param2,param3,param1);
      }
      
      private function §_-ANd§(param1:§_-9ai§) : void
      {
         dispatchEvent(new §_-75J§(§_-75J§.§_-5Sa§,param1.data));
      }
      
      private function §_-Adn§(param1:§_-9ai§) : void
      {
         dispatchEvent(new §_-75J§(§_-75J§.§_-2gE§,param1.data));
      }
      
      private function §_-CbP§(param1:§_-9ai§) : void
      {
         dispatchEvent(new §_-75J§(§_-75J§.§_-4be§,param1.data));
      }
      
      private function §_-7fH§(param1:§_-9ai§) : void
      {
         dispatchEvent(new §_-75J§(§_-75J§.§_-5t-§,param1.data));
      }
      
      private function onError(param1:§_-9ai§) : void
      {
         dispatchEvent(new §_-75J§(§_-75J§.ERROR,param1.data));
      }
   }
}

