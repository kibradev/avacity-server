package §_-Biv§
{
   import §_-BeZ§.§_-4Ww§;
   import §_-ti§.§_-2Xl§;
   import §_-ti§.§_-4dj§;
   import §_-ti§.§_-7E1§;
   
   public class §_-0VP§ extends §_-3iK§
   {
      private static const §_-Np§:String = "all";
      
      private static const §_-8Cm§:String = "quests";
      
      private static const §_-dF§:String = "inventory";
      
      private static const §_-13n§:String = "achievements";
      
      public function §_-0VP§()
      {
         super("reset");
      }
      
      override protected function createDescriptor() : §_-7E1§
      {
         var _loc1_:§_-7E1§ = new §_-7E1§(§_-C6H§,"Reset player progress",§_-C6H§ + " -type [all|quests|inventory|achievements]","player");
         _loc1_.addParameter(new §_-2Xl§("type","Type of progress to reset",§_-4dj§.§_-1Pz§).setRequired(false,§_-Np§).setPossibleValues([§_-Np§,§_-8Cm§,§_-dF§,§_-13n§]));
         _loc1_.§_-AqZ§(§_-C6H§,"Reset all progress");
         _loc1_.§_-AqZ§(§_-C6H§ + " -type quests","Reset only quests progress");
         _loc1_.§_-AqZ§(§_-C6H§ + " -type inventory","Reset only inventory");
         return _loc1_;
      }
      
      override protected function prepareParams(param1:Object) : §_-4Ww§
      {
         var _loc2_:§_-4Ww§ = new §_-4Ww§();
         _loc2_.put("type",!!param1.hasOwnProperty("type") ? param1["type"] : §_-Np§);
         return _loc2_;
      }
   }
}

