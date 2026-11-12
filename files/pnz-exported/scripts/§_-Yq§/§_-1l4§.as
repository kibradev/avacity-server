package §_-Yq§
{
   import §_-0Uz§.§_-6v4§;
   import §_-2qd§.§_-9ai§;
   import §_-40e§.§_-1m0§;
   import §_-4Vx§.§_-B1C§;
   import §_-5wm§.InventoryItem;
   import §_-BeZ§.§_-1e5§;
   import §_-GM§.Context;
   import penzville.Application;
   
   public class §_-1l4§ extends §_-6v4§
   {
      private static const §_-Mt§:String = "lt.drp";
      
      private static const §_-3ra§:String = "itms";
      
      private static const §_-7ly§:String = "ati";
      
      public function §_-1l4§()
      {
         super();
         §_-1-t§(§_-Mt§,this.§_-0h5§);
      }
      
      private function §_-0h5§(param1:§_-9ai§) : void
      {
         var _loc5_:int = 0;
         var _loc6_:InventoryItem = null;
         var _loc2_:§_-1e5§ = param1.data.§_-CUA§(§_-3ra§);
         var _loc3_:Boolean = param1.data.getBoolean(§_-7ly§,true);
         var _loc4_:Vector.<InventoryItem> = new Vector.<InventoryItem>();
         while(_loc5_ < _loc2_.length)
         {
            _loc6_ = _loc2_.§_-2jV§(_loc5_,InventoryItem) as InventoryItem;
            if(_loc3_)
            {
               Context.cityPlayer.inventory.putItem(_loc6_);
            }
            _loc4_.push(_loc6_);
            _loc5_++;
         }
         if(_loc4_.length > 0)
         {
            Application.instance.dispatchEvent(new §_-1m0§(§_-1m0§.§_-CGy§));
            Application.instance.dispatchEvent(new §_-B1C§(§_-B1C§.§_-3sT§,_loc4_));
         }
      }
   }
}

