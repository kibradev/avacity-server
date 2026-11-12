package §_-0sG§
{
   import §_-5MD§.§_-Bv9§;
   import §_-5MD§.§_-C9k§;
   import §_-5g6§.§_-1ib§;
   
   public class §_-4Mb§ extends §_-1fy§
   {
      private var §_-A-Y§:int = 0;
      
      public function §_-4Mb§()
      {
         super();
      }
      
      override protected function createObject() : §_-C9k§
      {
         return new §_-Bv9§();
      }
      
      override public function apply(param1:§_-1ib§, param2:Object) : void
      {
         var _loc3_:§_-Bv9§ = this.createObject() as §_-Bv9§;
         _loc3_.§_-6S6§ = _kind;
         if(_skin != null)
         {
            _loc3_.skinName = _skin;
         }
         if(this.§_-A-Y§ > 0)
         {
            _loc3_.§_-3x1§ = Math.random() * this.§_-A-Y§;
         }
         _loc3_.§_-49T§ = this;
         _loc3_.objectId = itemId;
         _loc3_.moveTo(wx,wy,wz);
         param1.addObject(_loc3_);
      }
      
      public function get frameCount() : int
      {
         return this.§_-A-Y§;
      }
      
      public function set frameCount(param1:int) : void
      {
         this.§_-A-Y§ = param1;
      }
   }
}

