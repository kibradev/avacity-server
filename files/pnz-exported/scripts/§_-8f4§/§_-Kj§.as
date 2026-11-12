package §_-8f4§
{
   import §_-5g6§.§_-1ib§;
   import §_-90R§.§_-aZ§;
   import §_-BGm§.§_-7DL§;
   
   public class §_-Kj§ extends §_-0D3§
   {
      public function §_-Kj§()
      {
         super();
      }
      
      override public function apply(param1:§_-1ib§, param2:Object) : void
      {
         var _loc3_:§_-7DL§ = new §_-7DL§();
         _loc3_.§_-6S6§ = _kind;
         _loc3_.§_-49T§ = this;
         _loc3_.objectId = itemId;
         _loc3_.moveTo(wx,wy,wz);
         _loc3_.servicedSkinName = servicedSkinName;
         _loc3_.unservicedSkinName = unservicedSkinName;
         _loc3_.direction = Math.random() > 0.5 ? §_-aZ§.SW : §_-aZ§.SE;
         param1.addObject(_loc3_);
      }
   }
}

