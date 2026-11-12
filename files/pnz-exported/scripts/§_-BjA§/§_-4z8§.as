package §_-BjA§
{
   import §_-0sG§.§_-1fy§;
   import §_-5MD§.§_-C9k§;
   import §_-5g6§.§_-1ib§;
   import §_-xq§.§_-A3w§;
   
   public class §_-4z8§ extends §_-1fy§
   {
      public function §_-4z8§()
      {
         super();
      }
      
      override protected function createObject() : §_-C9k§
      {
         return new §_-A3w§();
      }
      
      override public function apply(param1:§_-1ib§, param2:Object) : void
      {
         var _loc3_:§_-A3w§ = this.createObject() as §_-A3w§;
         _loc3_.§_-6S6§ = _kind;
         _loc3_.§_-49T§ = this;
         _loc3_.objectId = itemId;
         _loc3_.moveTo(wx,wy,wz);
         param1.addObject(_loc3_);
      }
   }
}

