package §_-Blh§
{
   import §_-0Jm§.HW25DoorObject;
   import §_-0sG§.§_-1fy§;
   import §_-5g6§.§_-1ib§;
   
   public class §_-0he§ extends §_-1fy§
   {
      public function §_-0he§()
      {
         super();
      }
      
      override public function apply(param1:§_-1ib§, param2:Object) : void
      {
         var _loc3_:HW25DoorObject = new HW25DoorObject();
         _loc3_.§_-6S6§ = _kind;
         _loc3_.§_-49T§ = this;
         _loc3_.objectId = itemId;
         _loc3_.moveTo(wx,wy,wz);
         param1.addObject(_loc3_);
      }
   }
}

