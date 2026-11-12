package §_-Biv§
{
   import §_-BeZ§.§_-4Ww§;
   import §_-ti§.§_-2Xl§;
   import §_-ti§.§_-4dj§;
   import §_-ti§.§_-7E1§;
   
   public class §_-0Ar§ extends §_-3iK§
   {
      public function §_-0Ar§()
      {
         super("roam_dice_force");
      }
      
      override protected function createDescriptor() : §_-7E1§
      {
         var _loc1_:§_-7E1§ = new §_-7E1§("roam_dice_force","Force next dice value for your next turn in current Roam game","roam_dice_force -value [1..6]","game");
         _loc1_.addParameter(new §_-2Xl§("value","Dice value from 1 to 6",§_-4dj§.§_-9cQ§).setRequired(true).setLimits(1,6));
         _loc1_.§_-AqZ§("roam_dice_force -value 6","Force six on next turn");
         return _loc1_;
      }
      
      override protected function prepareParams(param1:Object) : §_-4Ww§
      {
         var _loc3_:int = 0;
         var _loc2_:§_-4Ww§ = new §_-4Ww§();
         if(param1.hasOwnProperty("value"))
         {
            _loc3_ = parseInt(param1.value);
            _loc2_.§_-CZf§("value",isNaN(_loc3_) ? 1 : _loc3_);
         }
         else
         {
            _loc2_.§_-CZf§("value",1);
         }
         return _loc2_;
      }
   }
}

