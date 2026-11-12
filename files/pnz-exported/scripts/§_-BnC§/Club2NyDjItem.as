package §_-BnC§
{
   import §_-58b§.§_-2WE§;
   import §_-5g6§.§_-1ib§;
   import §_-7pU§.Club2NyDjActor;
   import §_-90R§.§_-aZ§;
   
   public class Club2NyDjItem extends §_-2WE§
   {
      public function Club2NyDjItem()
      {
         super();
      }
      
      override public function apply(param1:§_-1ib§, param2:Object) : void
      {
         var _loc3_:Club2NyDjActor = new Club2NyDjActor();
         _loc3_.§_-49T§ = this;
         _loc3_.objectId = itemId;
         _loc3_.direction = §_-aZ§.S;
         _loc3_.moveTo(wx,wy,wz);
         _loc3_.setSize(1,1,4);
         param1.addObject(_loc3_);
      }
   }
}

