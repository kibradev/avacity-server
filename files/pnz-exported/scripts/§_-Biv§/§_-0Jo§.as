package §_-Biv§
{
   import §_-BeZ§.§_-4Ww§;
   import §_-ti§.§_-2Xl§;
   import §_-ti§.§_-4dj§;
   import §_-ti§.§_-7E1§;
   
   public class §_-0Jo§ extends §_-3iK§
   {
      public function §_-0Jo§()
      {
         super("addset");
      }
      
      override protected function createDescriptor() : §_-7E1§
      {
         var _loc1_:§_-7E1§ = new §_-7E1§(§_-C6H§,"Add items set to player\'s inventory",§_-C6H§ + " -id [setId] -count [count]","player");
         _loc1_.addParameter(new §_-2Xl§("id","Set ID to add to inventory",§_-4dj§.§_-BZk§).setRequired(true));
         _loc1_.addParameter(new §_-2Xl§("count","Number of sets to add",§_-4dj§.§_-9cQ§).setRequired(false,1).setLimits(1,999));
         _loc1_.§_-AqZ§(§_-C6H§ + " -id warrior_set","Add 1 warrior set to inventory");
         _loc1_.§_-AqZ§(§_-C6H§ + " -id mage_set -count 3","Add 3 mage sets to inventory");
         return _loc1_;
      }
      
      override protected function prepareParams(param1:Object) : §_-4Ww§
      {
         var _loc3_:int = 0;
         var _loc2_:§_-4Ww§ = new §_-4Ww§();
         _loc2_.put("id",param1["id"]);
         if(param1.hasOwnProperty("count"))
         {
            _loc3_ = parseInt(param1.count);
            _loc2_.§_-CZf§("count",isNaN(_loc3_) ? 1 : _loc3_);
         }
         else
         {
            _loc2_.§_-CZf§("count",1);
         }
         return _loc2_;
      }
   }
}

