package §_-8f4§
{
   import §_-5g6§.§_-1ib§;
   import §_-BGm§.§_-aP§;
   
   public class §_-05z§ extends §_-0D3§
   {
      public function §_-05z§()
      {
         super();
      }
      
      override public function apply(param1:§_-1ib§, param2:Object) : void
      {
         var _loc3_:§_-aP§ = new §_-aP§();
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

