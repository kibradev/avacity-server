package §_-1TF§
{
   import §_-0sG§.§_-9xZ§;
   import §_-5MD§.§_-Ax5§;
   import §_-5g6§.§_-1ib§;
   
   public class §_-8IH§ extends §_-9xZ§
   {
      public function §_-8IH§()
      {
         super();
      }
      
      override public function apply(param1:§_-1ib§, param2:Object) : void
      {
         var _loc3_:§_-Ax5§ = new §_-Ax5§();
         _loc3_.§_-6S6§ = _kind;
         _loc3_.§_-49T§ = this;
         _loc3_.objectId = itemId;
         _loc3_.moveTo(wx,wy,wz);
         _loc3_.locationId = locationId;
         _loc3_.roomId = roomId;
         param1.addObject(_loc3_);
      }
   }
}

