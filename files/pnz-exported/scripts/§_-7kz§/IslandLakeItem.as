package §_-7kz§
{
   import §_-0sG§.§_-A5E§;
   import §_-2Hz§.§_-C6v§;
   import §_-5g6§.§_-1ib§;
   
   public class IslandLakeItem extends §_-A5E§
   {
      public function IslandLakeItem()
      {
         super();
      }
      
      override public function apply(param1:§_-1ib§, param2:Object) : void
      {
         var _loc3_:§_-C6v§ = new §_-C6v§();
         _loc3_.§_-49T§ = this;
         _loc3_.objectId = itemId;
         _loc3_.moveTo(wx,wy,wz);
         param1.addObject(_loc3_);
      }
   }
}

