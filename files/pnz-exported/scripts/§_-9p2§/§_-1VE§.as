package §_-9p2§
{
   import §_-0sG§.§_-3Kw§;
   import §_-2CU§.§_-6tJ§;
   import §_-5g6§.§_-1ib§;
   import §_-90R§.§_-aZ§;
   
   public class §_-1VE§ extends §_-3Kw§
   {
      public function §_-1VE§()
      {
         super();
      }
      
      override public function apply(param1:§_-1ib§, param2:Object) : void
      {
         var _loc3_:§_-6tJ§ = new §_-6tJ§();
         _loc3_.direction = §_-aZ§.SW;
         _loc3_.§_-6S6§ = _kind;
         _loc3_.§_-49T§ = this;
         _loc3_.objectId = itemId;
         _loc3_.moveTo(wx,wy,wz);
         param1.addObject(_loc3_);
      }
   }
}

