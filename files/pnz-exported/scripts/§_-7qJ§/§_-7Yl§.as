package §_-7qJ§
{
   import §_-0sG§.§_-1fy§;
   import §_-5g6§.§_-1ib§;
   import §_-90R§.§_-aZ§;
   import §_-ps§.§_-7sC§;
   
   public class §_-7Yl§ extends §_-1fy§
   {
      public function §_-7Yl§()
      {
         super();
      }
      
      override public function apply(param1:§_-1ib§, param2:Object) : void
      {
         var _loc3_:§_-7sC§ = new §_-7sC§();
         _loc3_.§_-6S6§ = _kind;
         _loc3_.§_-49T§ = this;
         _loc3_.objectId = itemId;
         _loc3_.direction = §_-aZ§.S;
         _loc3_.moveTo(wx,wy,wz);
         param1.addObject(_loc3_);
      }
   }
}

