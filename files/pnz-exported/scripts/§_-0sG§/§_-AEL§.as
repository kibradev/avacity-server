package §_-0sG§
{
   import §_-5MD§.§_-3FQ§;
   import §_-5MD§.§_-C9k§;
   import §_-5g6§.§_-1ib§;
   import §_-90R§.§_-aZ§;
   
   public class §_-AEL§ extends §_-1fy§
   {
      protected var _direction:String = null;
      
      public function §_-AEL§()
      {
         super();
      }
      
      override protected function createObject() : §_-C9k§
      {
         return new §_-3FQ§();
      }
      
      override public function apply(param1:§_-1ib§, param2:Object) : void
      {
         var _loc3_:§_-3FQ§ = null;
         var _loc4_:Number = NaN;
         _loc3_ = this.createObject() as §_-3FQ§;
         _loc3_.direction = §_-aZ§.§_-4NI§(this._direction);
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
      
      public function get direction() : String
      {
         return this._direction;
      }
      
      public function set direction(param1:String) : void
      {
         this._direction = param1;
      }
   }
}

