package §_-7lY§
{
   import §_-0fi§.§_-6f3§;
   import §_-18o§.§_-ABX§;
   import §_-4cY§.FurnitureCollectionItem;
   import §_-4cY§.FurnitureSetItem;
   import §_-4cY§.§_-8Hh§;
   import §_-6-L§.§_-49j§;
   import §_-GM§.Context;
   
   public class §_-ASb§
   {
      public static const §_-OX§:String = "door1";
      
      private var §_-3LT§:Object = {};
      
      private var §_-9TH§:Object = {};
      
      private var §_-0xf§:Object = {};
      
      public function §_-ASb§()
      {
         super();
      }
      
      public function §_-A1K§(param1:XML) : void
      {
         var _loc3_:XML = null;
         if(param1 == null)
         {
            return;
         }
         var _loc2_:FurnitureSetItem = null;
         for each(_loc3_ in param1.elements("furnitureSet"))
         {
            _loc2_ = new FurnitureSetItem();
            _loc2_.configure(_loc3_);
            this.§_-9TH§[_loc2_.id] = _loc2_;
         }
      }
      
      public function §_-9NB§(param1:XML) : void
      {
         var _loc3_:XML = null;
         if(param1 == null)
         {
            return;
         }
         var _loc2_:FurnitureCollectionItem = null;
         for each(_loc3_ in param1.elements("furnitureCollection"))
         {
            _loc2_ = new FurnitureCollectionItem();
            _loc2_.configure(_loc3_);
            this.§_-3LT§[_loc2_.id] = _loc2_;
         }
      }
      
      public function §_-B0D§(param1:XML) : void
      {
         var _loc2_:XML = null;
         var _loc3_:String = null;
         var _loc4_:String = null;
         var _loc5_:Object = null;
         var _loc6_:XML = null;
         var _loc7_:String = null;
         if(param1 == null)
         {
            return;
         }
         for each(_loc2_ in param1.elements("room"))
         {
            _loc3_ = !!_loc2_.hasOwnProperty("@id") ? String(_loc2_["@id"]) : "";
            _loc4_ = !!_loc2_.hasOwnProperty("@label") ? String(_loc2_["@label"]) : "";
            _loc5_ = {};
            for each(_loc6_ in _loc2_.elements("item"))
            {
               _loc7_ = !!_loc6_.hasOwnProperty("@typeId") ? String(_loc6_["@typeId"]) : "";
               if(_loc7_ != "")
               {
                  if(_loc5_[_loc7_] == null)
                  {
                     _loc5_[_loc7_] = 0;
                  }
                  _loc5_[_loc7_] += 1;
               }
            }
            this.§_-0xf§[_loc3_] = {
               "label":_loc4_,
               "items":_loc5_
            };
         }
      }
      
      public function get §_-AKy§() : Array
      {
         return §_-49j§.§_-FR§(this.§_-3LT§);
      }
      
      public function §_-Bc6§(param1:String) : FurnitureCollectionItem
      {
         return !!this.§_-3LT§.hasOwnProperty(param1) ? this.§_-3LT§[param1] : null;
      }
      
      public function get §_-CUn§() : uint
      {
         return §_-49j§.§_-FR§(this.§_-3LT§).length;
      }
      
      public function §_-9v3§(param1:String) : FurnitureSetItem
      {
         return !!this.§_-9TH§.hasOwnProperty(param1) ? this.§_-9TH§[param1] : null;
      }
      
      public function §_-0CD§(param1:String) : Object
      {
         return this.§_-C95§(this.§_-0xf§[param1].items);
      }
      
      public function §_-6DV§(param1:String) : String
      {
         return §_-ABX§.§_-631§(this.§_-0xf§[param1].label);
      }
      
      private function §_-C95§(param1:Object) : Object
      {
         var _loc2_:String = null;
         for(_loc2_ in param1)
         {
            if(this.§_-17C§(_loc2_))
            {
               param1[_loc2_] = 1;
            }
         }
         return param1;
      }
      
      private function §_-17C§(param1:String) : Boolean
      {
         var _loc2_:§_-6f3§ = Context.§_-70S§.§_-0ZU§().findTypeById(param1) as §_-6f3§;
         return _loc2_.category != null && _loc2_.category.categoryId != null && (_loc2_.category.categoryId == §_-8Hh§.§_-8kV§ || _loc2_.category.categoryId == §_-8Hh§.§_-C0J§);
      }
   }
}

