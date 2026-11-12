package §_-3o1§
{
   import §_-0sG§.§_-2Ht§;
   import §_-5g6§.§_-1ib§;
   import §_-Aeq§.AB25ActionMapObject;
   
   public class AB25ActionMapItem extends §_-2Ht§
   {
      protected var §_-0L9§:String = null;
      
      public function AB25ActionMapItem()
      {
         super();
      }
      
      override public function apply(param1:§_-1ib§, param2:Object) : void
      {
         var _loc3_:AB25ActionMapObject = null;
         _loc3_ = new AB25ActionMapObject();
         _loc3_.§_-6S6§ = _kind;
         _loc3_.§_-49T§ = this;
         _loc3_.objectId = itemId;
         _loc3_.moveTo(wx,wy,wz);
         _loc3_.action = action;
         _loc3_.areaId = this.areaId;
         _loc3_.isProjectable = isProjectable;
         if(_skin != null)
         {
            _loc3_.skinName = _skin;
         }
         param1.addObject(_loc3_);
      }
      
      public function get areaId() : String
      {
         return this.§_-0L9§;
      }
      
      public function set areaId(param1:String) : void
      {
         this.§_-0L9§ = param1;
      }
   }
}

