package §_-0sG§
{
   import §_-5MD§.§_-50A§;
   import §_-5g6§.§_-1ib§;
   
   public class §_-1DK§ extends §_-2Ht§
   {
      public function §_-1DK§()
      {
         super();
      }
      
      override public function apply(param1:§_-1ib§, param2:Object) : void
      {
         var _loc3_:§_-50A§ = new §_-50A§();
         _loc3_.§_-6S6§ = _kind;
         _loc3_.§_-49T§ = this;
         _loc3_.objectId = itemId;
         _loc3_.moveTo(wx,wy,wz);
         _loc3_.action = action;
         _loc3_.isProjectable = isProjectable;
         if(_skin != null)
         {
            _loc3_.skinName = _skin;
         }
         param1.addObject(_loc3_);
      }
   }
}

