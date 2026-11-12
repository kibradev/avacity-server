package §_-m8§
{
   import §_-18o§.§_-8-S§;
   import §_-3DC§.SocialRequest;
   import §_-3DC§.§_-8VM§;
   import §_-91S§.§_-1a6§;
   import §_-91S§.§_-4DP§;
   import §_-91S§.§_-8p9§;
   import §_-GM§.Context;
   
   public class §_-CRY§ extends §_-Acd§
   {
      public function §_-CRY§()
      {
         super();
      }
      
      override public function get allowedFriendsForRequest() : Array
      {
         var _loc4_:String = null;
         var _loc1_:§_-4DP§ = Context.§_-AI9§.§_-14E§(§_-1a6§.§_-TA§,§_-8p9§.§_-19B§);
         var _loc2_:Array = [];
         var _loc3_:Object = Context.§_-AI9§.§_-4V7§;
         for(_loc4_ in _loc3_)
         {
            if(_loc3_.hasOwnProperty(_loc4_))
            {
               if(_loc1_.§_-0BX§(_loc4_))
               {
                  if(this.§_-dE§(_loc4_))
                  {
                     _loc2_.push(_loc4_);
                  }
               }
            }
         }
         return _loc2_;
      }
      
      override public function get maxSendCount() : int
      {
         return this.allowedFriendsForRequest.length;
      }
      
      private function §_-dE§(param1:String) : Boolean
      {
         if(!§_-8bS§.requests.hasOwnProperty(param1))
         {
            return true;
         }
         var _loc2_:SocialRequest = §_-8bS§.requests[param1];
         if(_loc2_.status == §_-8VM§.§_-CFa§)
         {
            return true;
         }
         if(_loc2_.status == §_-8VM§.§_-6U4§ && !§_-8-S§.§_-r§(_loc2_.§_-6XR§))
         {
            return true;
         }
         return false;
      }
   }
}

