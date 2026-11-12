package §_-0DM§
{
   import §_-0sG§.§_-1fy§;
   import §_-2P3§.§_-5Sc§;
   import §_-5MD§.§_-C9k§;
   import §_-5g6§.§_-1ib§;
   
   public class §_-1NC§ extends §_-1fy§
   {
      private var §_-5oN§:String = null;
      
      public function §_-1NC§()
      {
         super();
      }
      
      override protected function createObject() : §_-C9k§
      {
         return new §_-5Sc§();
      }
      
      override public function apply(param1:§_-1ib§, param2:Object) : void
      {
         var _loc3_:§_-5Sc§ = null;
         _loc3_ = this.createObject() as §_-5Sc§;
         _loc3_.§_-6S6§ = _kind;
         _loc3_.dishwasherId = this.dishwasherId;
         _loc3_.§_-49T§ = this;
         _loc3_.objectId = itemId;
         _loc3_.moveTo(wx,wy,wz);
         param1.addObject(_loc3_);
      }
      
      public function get dishwasherId() : String
      {
         return this.§_-5oN§;
      }
      
      public function set dishwasherId(param1:String) : void
      {
         this.§_-5oN§ = param1;
      }
   }
}

