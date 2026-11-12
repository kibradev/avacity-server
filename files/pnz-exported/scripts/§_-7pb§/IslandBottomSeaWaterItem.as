package §_-7pb§
{
   import §_-0sG§.§_-3v7§;
   import §_-2Hz§.§_-ARs§;
   import §_-3BS§.§_-Ge§;
   import §_-5g6§.§_-1ib§;
   import §_-5g6§.§_-42q§;
   import §_-5g6§.§_-8Vp§;
   
   public class IslandBottomSeaWaterItem extends §_-3v7§
   {
      public function IslandBottomSeaWaterItem()
      {
         super();
      }
      
      override public function apply(param1:§_-1ib§, param2:Object) : void
      {
         var _loc3_:§_-ARs§ = new §_-ARs§(param1.worldMode == §_-8Vp§.§_-2BY§ ? §_-42q§.§_-6rj§ : §_-Ge§.FOREGROUND_LAYER);
         _loc3_.skinName = _skin;
         _loc3_.moveTo(wx,wy,0);
         param1.addObject(_loc3_);
      }
   }
}

