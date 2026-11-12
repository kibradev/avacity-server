package §_-0DM§
{
   import §_-0sG§.§_-1fy§;
   import §_-2P3§.§_-1t7§;
   import §_-5MD§.§_-C9k§;
   import §_-5g6§.§_-1ib§;
   
   public class §_-4cm§ extends §_-1fy§
   {
      private var §_-36n§:String = null;
      
      public function §_-4cm§()
      {
         super();
      }
      
      override protected function createObject() : §_-C9k§
      {
         return new §_-1t7§();
      }
      
      override public function apply(param1:§_-1ib§, param2:Object) : void
      {
         var _loc3_:§_-1t7§ = null;
         _loc3_ = this.createObject() as §_-1t7§;
         _loc3_.§_-6S6§ = _kind;
         _loc3_.mealId = this.mealId;
         _loc3_.§_-49T§ = this;
         _loc3_.objectId = itemId;
         _loc3_.moveTo(wx,wy,wz);
         param1.addObject(_loc3_);
      }
      
      public function get mealId() : String
      {
         return this.§_-36n§;
      }
      
      public function set mealId(param1:String) : void
      {
         this.§_-36n§ = param1;
      }
   }
}

