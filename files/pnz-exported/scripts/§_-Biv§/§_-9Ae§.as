package §_-Biv§
{
   import §_-9NP§.§_-44O§;
   import §_-BeZ§.§_-4Ww§;
   import §_-GM§.Context;
   import §_-ti§.§_-2Xl§;
   import §_-ti§.§_-4dj§;
   import §_-ti§.§_-7E1§;
   
   public class §_-9Ae§ extends §_-3iK§
   {
      public function §_-9Ae§()
      {
         super("setviplevel");
      }
      
      override protected function createDescriptor() : §_-7E1§
      {
         var _loc3_:§_-44O§ = null;
         var _loc1_:int = 10;
         if(Context.§_-06H§ != null && Context.§_-06H§.isActive())
         {
            _loc3_ = Context.§_-06H§.§_-6q5§();
            if(_loc3_ != null)
            {
               _loc1_ = _loc3_.level;
            }
         }
         var _loc2_:§_-7E1§ = new §_-7E1§(§_-C6H§,"Update player VIP level",§_-C6H§ + " -level [level]","player");
         _loc2_.addParameter(new §_-2Xl§("level","VIP level to set (0-" + _loc1_ + ")",§_-4dj§.§_-9cQ§).setRequired(true).setLimits(0,_loc1_));
         _loc2_.§_-AqZ§(§_-C6H§ + " -level 5","Set player VIP level to 5");
         _loc2_.§_-AqZ§(§_-C6H§ + " -level 0","Remove VIP status (set level to 0)");
         return _loc2_;
      }
      
      override protected function prepareParams(param1:Object) : §_-4Ww§
      {
         var _loc2_:§_-4Ww§ = new §_-4Ww§();
         _loc2_.put("level",parseInt(param1["level"]));
         return _loc2_;
      }
   }
}

