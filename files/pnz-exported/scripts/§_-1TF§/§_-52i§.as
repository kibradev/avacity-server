package §_-1TF§
{
   import §_-0sG§.§_-9xZ§;
   import §_-5g6§.§_-1ib§;
   import §_-7YC§.§_-CPM§;
   
   public class §_-52i§ extends §_-9xZ§
   {
      public function §_-52i§()
      {
         super();
      }
      
      override public function apply(param1:§_-1ib§, param2:Object) : void
      {
         var _loc3_:§_-CPM§ = new §_-CPM§();
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

