package §_-0yY§
{
   import §_-0sG§.§_-1fy§;
   import §_-5g6§.§_-1ib§;
   
   public class NY25RatingBoardItem extends §_-1fy§
   {
      public function NY25RatingBoardItem()
      {
         super();
      }
      
      override public function apply(param1:§_-1ib§, param2:Object) : void
      {
         var _loc3_:NY25RatingBoardObject = new NY25RatingBoardObject();
         _loc3_.§_-6S6§ = _kind;
         _loc3_.§_-49T§ = this;
         _loc3_.objectId = itemId;
         _loc3_.moveTo(wx,wy,wz);
         param1.addObject(_loc3_);
      }
   }
}

