package §_-Biv§
{
   import §_-BeZ§.§_-4Ww§;
   import §_-ti§.§_-2Xl§;
   import §_-ti§.§_-4dj§;
   import §_-ti§.§_-7E1§;
   
   public class §_-70L§ extends §_-3iK§
   {
      public function §_-70L§()
      {
         super("setlevel");
      }
      
      override protected function createDescriptor() : §_-7E1§
      {
         var _loc1_:§_-7E1§ = new §_-7E1§(§_-C6H§,"Update player level",§_-C6H§ + " -level [level]","player");
         _loc1_.addParameter(new §_-2Xl§("level","Player level to set",§_-4dj§.§_-9cQ§).setRequired(true).setLimits(1,100));
         _loc1_.§_-AqZ§(§_-C6H§ + " -level 50","Set player level to 50");
         _loc1_.§_-AqZ§(§_-C6H§ + " -level 1","Reset player level to 1");
         return _loc1_;
      }
      
      override protected function prepareParams(param1:Object) : §_-4Ww§
      {
         var _loc2_:§_-4Ww§ = new §_-4Ww§();
         _loc2_.put("level",parseInt(param1["level"]));
         return _loc2_;
      }
   }
}

