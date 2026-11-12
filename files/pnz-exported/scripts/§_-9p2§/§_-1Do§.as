package §_-9p2§
{
   import §_-0sG§.§_-1fy§;
   import §_-5g6§.§_-1ib§;
   import §_-8jw§.§_-8kl§;
   import §_-90R§.§_-aZ§;
   
   public class §_-1Do§ extends §_-1fy§
   {
      public function §_-1Do§()
      {
         super();
      }
      
      override public function apply(param1:§_-1ib§, param2:Object) : void
      {
         var _loc3_:§_-8kl§ = new §_-8kl§();
         _loc3_.direction = §_-aZ§.SW;
         _loc3_.§_-6S6§ = _kind;
         _loc3_.§_-49T§ = this;
         _loc3_.objectId = itemId;
         _loc3_.moveTo(wx,wy,wz);
         param1.addObject(_loc3_);
      }
   }
}

