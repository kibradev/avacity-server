package §_-0V-§
{
   import §_-0sG§.§_-1fy§;
   import §_-5g6§.§_-1ib§;
   import §_-78m§.§_-0Of§;
   
   public class KotexStandItem extends §_-1fy§
   {
      public function KotexStandItem()
      {
         super();
      }
      
      override public function apply(param1:§_-1ib§, param2:Object) : void
      {
         var _loc3_:§_-0Of§ = new §_-0Of§();
         _loc3_.§_-6S6§ = _kind;
         _loc3_.§_-49T§ = this;
         _loc3_.objectId = itemId;
         _loc3_.moveTo(wx,wy,wz);
         param1.addObject(_loc3_);
      }
   }
}

