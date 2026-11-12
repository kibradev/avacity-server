package §_-6VR§
{
   import §_-0sG§.§_-3Kw§;
   import §_-5g6§.§_-1ib§;
   import §_-8jw§.§_-06X§;
   import §_-90R§.§_-aZ§;
   
   public class §_-BFq§ extends §_-3Kw§
   {
      protected var §_-8FA§:String = "";
      
      public function §_-BFq§()
      {
         super();
      }
      
      override public function apply(param1:§_-1ib§, param2:Object) : void
      {
         var _loc3_:§_-06X§ = null;
         var _loc4_:Number = NaN;
         _loc3_ = new §_-06X§();
         _loc3_.placeId = this.§_-8FA§;
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
      
      public function get placeId() : String
      {
         return this.§_-8FA§;
      }
      
      public function set placeId(param1:String) : void
      {
         this.§_-8FA§ = param1;
      }
   }
}

