package §_-06z§
{
   import §_-1O0§.§_-82D§;
   import §_-2zv§.CityRelationListItem;
   import §_-4ut§.§_-3zj§;
   import §_-8E8§.§_-4AG§;
   import §_-9zi§.§_-68E§;
   
   public class §_-5oy§
   {
      public static const §_-BWR§:String = "birthday";
      
      public static const §_-4cW§:String = "weddingDay";
      
      private var §_-9nA§:Array;
      
      public function §_-5oy§()
      {
         super();
      }
      
      public function configure(param1:XML) : void
      {
         var _loc2_:XML = null;
         var _loc3_:String = null;
         var _loc4_:§_-68E§ = null;
         this.§_-9nA§ = [];
         for each(_loc2_ in (param1.elements("holidays")[0] as XML).elements("holiday"))
         {
            _loc3_ = !!_loc2_.hasOwnProperty("@id") ? _loc2_["@id"] : "";
            _loc4_ = this.createDescriptor(_loc3_);
            if(_loc4_ != null)
            {
               _loc4_.configure(_loc2_);
               this.§_-9nA§.push(_loc4_);
            }
         }
      }
      
      public function createDescriptor(param1:String) : §_-68E§
      {
         if(param1 == §_-BWR§)
         {
            return new §_-82D§();
         }
         if(param1 == §_-4cW§)
         {
            return new §_-3zj§();
         }
         return null;
      }
      
      public function get §_-84Q§() : §_-82D§
      {
         var _loc1_:§_-68E§ = null;
         for each(_loc1_ in this.§_-9nA§)
         {
            if(_loc1_ is §_-82D§)
            {
               return _loc1_ as §_-82D§;
            }
         }
         return null;
      }
      
      public function §_-tE§(param1:CityRelationListItem) : Array
      {
         var _loc3_:§_-68E§ = null;
         var _loc2_:Array = [];
         for each(_loc3_ in this.§_-9nA§)
         {
            if(_loc3_.getHolidayNotification(param1) != null)
            {
               _loc2_.push(_loc3_.getHolidayNotification(param1));
            }
         }
         return _loc2_;
      }
      
      public function §_-0Qv§(param1:CityRelationListItem) : §_-4AG§
      {
         var _loc3_:§_-4AG§ = null;
         var _loc2_:§_-4AG§ = null;
         for each(_loc3_ in this.§_-tE§(param1))
         {
            if(_loc2_ == null || _loc2_.priority < _loc3_.priority)
            {
               _loc2_ = _loc3_;
            }
         }
         return _loc2_;
      }
   }
}

