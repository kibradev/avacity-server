package §_-25d§
{
   import §_-0sG§.§_-AEL§;
   import §_-5g6§.§_-1ib§;
   import §_-8jw§.§_-6cl§;
   import §_-90R§.§_-aZ§;
   
   public class §_-03O§ extends §_-AEL§
   {
      public function §_-03O§()
      {
         super();
      }
      
      override public function apply(param1:§_-1ib§, param2:Object) : void
      {
         var _loc4_:Number = NaN;
         var _loc3_:§_-6cl§ = new §_-6cl§();
         _loc3_.direction = §_-aZ§.§_-4NI§(_direction);
         _loc3_.§_-6S6§ = _kind;
         _loc3_.§_-49T§ = this;
         _loc3_.objectId = itemId;
         _loc3_.moveTo(wx,wy,wz);
         if(_loc3_.direction == §_-aZ§.SE || _loc3_.direction == §_-aZ§.NW)
         {
            _loc4_ = _loc3_.length;
            _loc3_.length = _loc3_.width;
            _loc3_.width = _loc4_;
         }
         param1.addObject(_loc3_);
      }
   }
}

