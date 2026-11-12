package §_-BJ1§
{
   import §_-4UW§.§_-5qx§;
   import §_-4UW§.§_-8Ak§;
   import §_-4UW§.§_-9es§;
   
   public class §_-6Yy§
   {
      public static const §_-91j§:String = "none";
      
      private var §_-B2y§:Object = {};
      
      private var §_-1C0§:Object = {};
      
      private var §_-30C§:Object = {};
      
      public function §_-6Yy§()
      {
         super();
      }
      
      public function configure(param1:XML) : void
      {
         var _loc3_:XML = null;
         var _loc4_:XMLList = null;
         var _loc5_:XML = null;
         var _loc6_:XMLList = null;
         var _loc7_:XML = null;
         var _loc8_:§_-9es§ = null;
         var _loc9_:§_-8Ak§ = null;
         var _loc10_:§_-5qx§ = null;
         var _loc2_:XMLList = param1["categories"]["category"];
         for each(_loc3_ in _loc2_)
         {
            _loc8_ = new §_-9es§();
            _loc8_.configure(_loc3_);
            this.§_-B2y§[_loc8_.id] = _loc8_;
         }
         _loc4_ = param1["banRules"]["banRule"];
         for each(_loc5_ in _loc4_)
         {
            _loc9_ = new §_-8Ak§();
            _loc9_.configure(_loc5_);
            _loc9_.category = this.getCategory(_loc9_.categoryId);
            this.§_-1C0§[_loc9_.id] = _loc9_;
         }
         _loc6_ = param1["notifications"]["notification"];
         for each(_loc7_ in _loc6_)
         {
            _loc10_ = new §_-5qx§();
            _loc10_.configure(_loc7_);
            _loc10_.category = this.getCategory(_loc10_.categoryId);
            this.§_-30C§[_loc10_.id] = _loc10_;
         }
      }
      
      public function getCategory(param1:int) : §_-9es§
      {
         return !!this.§_-B2y§.hasOwnProperty(String(param1)) ? this.§_-B2y§[param1] : null;
      }
      
      public function §_-8-D§(param1:int) : §_-5qx§
      {
         return !!this.§_-30C§.hasOwnProperty(String(param1)) ? this.§_-30C§[param1] : null;
      }
      
      public function get banRules() : Object
      {
         return this.§_-1C0§;
      }
      
      public function get notifications() : Object
      {
         return this.§_-30C§;
      }
      
      public function get §_-5qy§() : Array
      {
         var _loc2_:§_-8Ak§ = null;
         var _loc1_:Array = [];
         for each(_loc2_ in this.§_-1C0§)
         {
            if(_loc2_.§_-Ah1§)
            {
               _loc1_.push(_loc2_);
            }
         }
         return _loc1_;
      }
      
      public function get §_-BPh§() : Array
      {
         var _loc2_:§_-8Ak§ = null;
         var _loc1_:Array = [];
         for each(_loc2_ in this.§_-1C0§)
         {
            if(_loc2_.§_-5Er§)
            {
               _loc1_.push(_loc2_);
            }
         }
         return _loc1_;
      }
      
      public function get §_-5cv§() : Array
      {
         var _loc2_:§_-8Ak§ = null;
         var _loc1_:Array = [];
         for each(_loc2_ in this.§_-1C0§)
         {
            if(_loc2_.§_-4vo§)
            {
               _loc1_.push(_loc2_);
            }
         }
         return _loc1_;
      }
      
      public function get §_-1UC§() : Array
      {
         var _loc2_:§_-8Ak§ = null;
         var _loc1_:Array = [];
         for each(_loc2_ in this.§_-1C0§)
         {
            if(_loc2_.§_-fi§)
            {
               _loc1_.push(_loc2_);
            }
         }
         return _loc1_;
      }
   }
}

