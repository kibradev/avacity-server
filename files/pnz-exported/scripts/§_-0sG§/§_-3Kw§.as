package §_-0sG§
{
   import §_-5MD§.§_-6G2§;
   import §_-5MD§.§_-C9k§;
   import §_-5g6§.§_-1ib§;
   import §_-90R§.§_-aZ§;
   
   public class §_-3Kw§ extends §_-AEL§
   {
      public function §_-3Kw§()
      {
         super();
      }
      
      override public function apply(param1:§_-1ib§, param2:Object) : void
      {
         var _loc4_:Number = NaN;
         var _loc3_:§_-6G2§ = this.createObject() as §_-6G2§;
         _loc3_.direction = §_-aZ§.§_-4NI§(direction);
         _loc3_.§_-6S6§ = _kind;
         _loc3_.§_-49T§ = this;
         _loc3_.objectId = itemId;
         _loc3_.moveTo(wx,wy,wz);
         if(layer != null)
         {
            _loc3_.layerId = layer;
         }
         if(_loc3_.direction == §_-aZ§.SE || _loc3_.direction == §_-aZ§.NW)
         {
            _loc4_ = _loc3_.length;
            _loc3_.length = _loc3_.width;
            _loc3_.width = _loc4_;
         }
         param1.addObject(_loc3_);
      }
      
      override protected function createObject() : §_-C9k§
      {
         return new §_-6G2§();
      }
   }
}

