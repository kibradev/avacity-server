package §_-7ps§
{
   import §_-4cY§.§_-Akc§;
   import §_-4cY§.§_-B19§;
   import §_-6-L§.§_-49j§;
   import §_-8i3§.§_-2E0§;
   
   public class §_-6qF§
   {
      private var §_-9-H§:Object = null;
      
      private var §_-36x§:Object = null;
      
      public function §_-6qF§()
      {
         super();
      }
      
      public function configure(param1:XML) : void
      {
         var _loc4_:XML = null;
         var _loc5_:XML = null;
         var _loc6_:§_-AgC§ = null;
         var _loc7_:XML = null;
         if(param1 == null)
         {
            return;
         }
         this.§_-9-H§ = {};
         var _loc2_:XML = new XML(param1["npcHouses"]);
         var _loc3_:§_-7D4§ = null;
         for each(_loc4_ in _loc2_.elements("house"))
         {
            _loc3_ = new §_-7D4§();
            _loc3_.configure(_loc4_);
            this.§_-9-H§[_loc3_.id] = _loc3_;
         }
         this.§_-36x§ = {};
         _loc5_ = new XML(param1["userHouses"]);
         _loc6_ = null;
         for each(_loc7_ in _loc5_.elements("house"))
         {
            _loc6_ = new §_-AgC§();
            _loc6_.configure(_loc7_);
            this.§_-36x§[_loc6_.id] = _loc6_;
         }
      }
      
      public function §_-BOp§() : Array
      {
         return §_-49j§.§_-FR§(this.§_-9-H§);
      }
      
      public function §_-0Vy§() : Array
      {
         return §_-49j§.§_-FR§(this.§_-36x§);
      }
      
      public function §_-8Xb§() : Array
      {
         var _loc3_:§_-AgC§ = null;
         var _loc1_:Array = [];
         var _loc2_:§_-2E0§ = null;
         for each(_loc3_ in this.§_-36x§)
         {
            _loc2_ = this.§_-03f§(_loc3_);
            _loc1_.push(_loc2_);
         }
         return _loc1_;
      }
      
      public function §_-03f§(param1:§_-AgC§) : §_-2E0§
      {
         var _loc3_:§_-Akc§ = null;
         var _loc2_:§_-2E0§ = new §_-2E0§();
         _loc2_.width = 13;
         _loc2_.length = 13;
         _loc2_.id = String(param1.id);
         for each(_loc3_ in param1.§_-8lV§)
         {
            if(_loc3_ is §_-B19§)
            {
               (_loc3_ as §_-B19§).targetRoomId = "livingroom";
            }
            _loc2_.addFurniture(_loc3_);
         }
         return _loc2_;
      }
      
      public function §_-96F§(param1:int) : §_-AgC§
      {
         return !!this.§_-36x§.hasOwnProperty(param1) ? this.§_-36x§[param1] : null;
      }
   }
}

