package §_-5RV§
{
   import §_-0X5§.§_-ADt§;
   import §_-0X5§.§_-C55§;
   import §_-2qd§.§_-82L§;
   import §_-BA3§.§_-ACc§;
   import §_-BeZ§.§_-1e5§;
   import §_-BeZ§.§_-4Ww§;
   import §_-BeZ§.§_-67e§;
   import §_-BeZ§.§_-B10§;
   import ags.§_-5x-§;
   import ags.§_-B0-§;
   
   public class §_-9dJ§ extends §_-9mD§
   {
      public static const ID:int = §_-8pr§.§_-6fk§;
      
      private static const §_-BAr§:int = 2;
      
      private var §_-0uO§:Array = [];
      
      public function §_-9dJ§()
      {
         super(ID);
      }
      
      override public function execute(param1:§_-5x-§) : void
      {
         var _loc2_:§_-C55§ = null;
         for each(_loc2_ in this.§_-0uO§)
         {
            this.§_-Ag6§(_loc2_,param1);
         }
      }
      
      override public function readArray(param1:§_-1e5§) : void
      {
         var _loc4_:String = null;
         var _loc5_:§_-4Ww§ = null;
         if(param1.length % §_-BAr§ != 0)
         {
            throw new Error("Invalid packet items count: " + param1.length);
         }
         var _loc2_:int = param1.length / §_-BAr§;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = param1.getString(_loc3_ * §_-BAr§);
            _loc5_ = param1.§_-ANw§(_loc3_ * §_-BAr§ + 1);
            this.§_-0uO§.push(new §_-C55§(_loc4_,_loc5_));
            _loc3_++;
         }
      }
      
      private function §_-Ag6§(param1:§_-C55§, param2:§_-5x-§) : void
      {
         var _loc6_:§_-ADt§ = null;
         var _loc3_:String = param1.command;
         var _loc4_:§_-4Ww§ = param1.data;
         var _loc5_:Class = §_-B0-§.§_-8yl§(_loc3_);
         if(_loc5_ != null)
         {
            _loc6_ = §_-B10§.§_-8ex§(§_-67e§.create(_loc4_),§_-ACc§.create(_loc5_));
            _loc6_.init(param2);
            _loc6_.execute();
         }
         param2.dispatchEvent(new §_-82L§(§_-82L§.§_-0zr§,_loc3_,_loc4_));
      }
   }
}

