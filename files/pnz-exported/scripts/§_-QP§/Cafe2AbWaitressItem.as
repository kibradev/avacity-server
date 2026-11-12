package §_-QP§
{
   import §_-58b§.§_-2WE§;
   import §_-5g6§.§_-1ib§;
   import §_-90R§.§_-aZ§;
   import §_-A4t§.Cafe2AbWaitressActor;
   
   public class Cafe2AbWaitressItem extends §_-2WE§
   {
      public function Cafe2AbWaitressItem()
      {
         super();
      }
      
      override public function apply(param1:§_-1ib§, param2:Object) : void
      {
         var _loc3_:Cafe2AbWaitressActor = new Cafe2AbWaitressActor();
         _loc3_.§_-49T§ = this;
         _loc3_.objectId = itemId;
         _loc3_.direction = §_-aZ§.S;
         _loc3_.moveTo(wx,wy,wz);
         _loc3_.setSize(1,1,4);
         param1.addObject(_loc3_);
      }
   }
}

