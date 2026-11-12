package §_-Bbk§
{
   import §_-58b§.§_-2WE§;
   import §_-5g6§.§_-1ib§;
   import §_-90R§.§_-aZ§;
   import §_-rM§.ClubBarmaidActor;
   
   public class §_-11O§ extends §_-2WE§
   {
      public function §_-11O§()
      {
         super();
      }
      
      override public function apply(param1:§_-1ib§, param2:Object) : void
      {
         var _loc3_:ClubBarmaidActor = new ClubBarmaidActor();
         _loc3_.§_-49T§ = this;
         _loc3_.objectId = itemId;
         _loc3_.direction = §_-aZ§.S;
         _loc3_.moveTo(wx,wy,wz);
         _loc3_.setSize(1,1,4);
         param1.addObject(_loc3_);
      }
   }
}

