package §_-Biv§
{
   import §_-BeZ§.§_-4Ww§;
   import §_-ti§.§_-2Xl§;
   import §_-ti§.§_-4dj§;
   import §_-ti§.§_-7E1§;
   
   public class §_-6ur§ extends §_-3iK§
   {
      public function §_-6ur§()
      {
         super("removeroom");
      }
      
      override protected function createDescriptor() : §_-7E1§
      {
         var _loc1_:§_-7E1§ = new §_-7E1§(§_-C6H§,"Remove room from player house",§_-C6H§ + " -userId [userId] -roomId [roomId]","player");
         _loc1_.addParameter(new §_-2Xl§("userId","User ID (optional, defaults to current user)",§_-4dj§.§_-BZk§).setRequired(false));
         _loc1_.addParameter(new §_-2Xl§("roomId","Room ID to remove (optional, shows list if not specified)",§_-4dj§.§_-BZk§).setRequired(false));
         _loc1_.§_-AqZ§(§_-C6H§ + " -roomId room0","Remove room with id \'room0\' from current user\'s house");
         _loc1_.§_-AqZ§(§_-C6H§ + " -userId 123 -roomId room1","Remove room \'room1\' from user 123\'s house");
         _loc1_.§_-AqZ§(§_-C6H§,"Show list of available rooms for removal");
         return _loc1_;
      }
      
      override protected function prepareParams(param1:Object) : §_-4Ww§
      {
         var _loc2_:§_-4Ww§ = new §_-4Ww§();
         if(param1.hasOwnProperty("userId"))
         {
            _loc2_.putString("userId",param1["userId"]);
         }
         if(param1.hasOwnProperty("roomId"))
         {
            _loc2_.putString("roomId",param1["roomId"]);
         }
         return _loc2_;
      }
   }
}

