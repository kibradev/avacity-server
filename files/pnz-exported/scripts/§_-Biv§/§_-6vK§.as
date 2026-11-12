package §_-Biv§
{
   import §_-BeZ§.§_-4Ww§;
   import §_-Cc8§.§_-Az0§;
   import §_-ti§.§_-2Xl§;
   import §_-ti§.§_-4dj§;
   import §_-ti§.§_-7E1§;
   
   public class §_-6vK§ extends §_-3iK§
   {
      public function §_-6vK§()
      {
         super("addres");
      }
      
      override protected function createDescriptor() : §_-7E1§
      {
         var _loc1_:§_-7E1§ = new §_-7E1§(§_-C6H§,"Add resources to player",§_-C6H§ + " -id [gold|silver|energy|bones|vitality|ruby] -count [count]","player");
         _loc1_.addParameter(new §_-2Xl§("id","Resource ID to add to player",§_-4dj§.§_-1Pz§).setRequired(true).setPossibleValues(§_-Az0§.§_-61i§));
         _loc1_.addParameter(new §_-2Xl§("count","Number of resources to add",§_-4dj§.§_-9cQ§).setRequired(false,1).setLimits(1,999999));
         _loc1_.§_-AqZ§(§_-C6H§ + " -id gold -count 1000","Add 1000 gold to player");
         _loc1_.§_-AqZ§(§_-C6H§ + " -id energy","Add 1 energy to player");
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

