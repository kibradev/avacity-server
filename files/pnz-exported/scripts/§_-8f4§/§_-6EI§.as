package §_-8f4§
{
   import §_-5g6§.§_-1ib§;
   import §_-BGm§.§_-76g§;
   
   public class §_-6EI§ extends §_-0D3§
   {
      public function §_-6EI§()
      {
         super();
      }
      
      override public function apply(param1:§_-1ib§, param2:Object) : void
      {
         var _loc3_:§_-76g§ = new §_-76g§();
         _loc3_.§_-6S6§ = _kind;
         _loc3_.§_-49T§ = this;
         _loc3_.objectId = itemId;
         _loc3_.moveTo(wx,wy,wz);
         _loc3_.servicedSkinName = servicedSkinName;
         _loc3_.unservicedSkinName = unservicedSkinName;
         param1.addObject(_loc3_);
      }
   }
}

