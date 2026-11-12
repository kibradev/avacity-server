package §_-0DM§
{
   import §_-0sG§.§_-1fy§;
   import §_-2P3§.§_-2pg§;
   import §_-5MD§.§_-C9k§;
   import §_-5g6§.§_-1ib§;
   
   public class §_-3gN§ extends §_-1fy§
   {
      public function §_-3gN§()
      {
         super();
      }
      
      override protected function createObject() : §_-C9k§
      {
         return new §_-2pg§();
      }
      
      override public function apply(param1:§_-1ib§, param2:Object) : void
      {
         var _loc3_:§_-2pg§ = this.createObject() as §_-2pg§;
         _loc3_.§_-6S6§ = _kind;
         _loc3_.§_-49T§ = this;
         _loc3_.objectId = itemId;
         _loc3_.moveTo(wx,wy,wz);
         param1.addObject(_loc3_);
      }
   }
}

