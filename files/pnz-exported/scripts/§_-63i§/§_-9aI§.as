package §_-63i§
{
   import §_-0sG§.§_-1fy§;
   import §_-5MD§.§_-C9k§;
   import §_-5g6§.§_-1ib§;
   import §_-8wP§.§_-2wU§;
   
   public class §_-9aI§ extends §_-1fy§
   {
      private var §_-620§:String = null;
      
      private var §_-Xg§:int = -1;
      
      public function §_-9aI§()
      {
         super();
      }
      
      override protected function createObject() : §_-C9k§
      {
         return new §_-2wU§();
      }
      
      override public function apply(param1:§_-1ib§, param2:Object) : void
      {
         var _loc3_:§_-2wU§ = null;
         _loc3_ = this.createObject() as §_-2wU§;
         _loc3_.§_-6S6§ = _kind;
         _loc3_.alternativeSkins = this.alternativeSkins;
         _loc3_.itemIndex = this.itemIndex;
         _loc3_.§_-49T§ = this;
         _loc3_.objectId = itemId;
         _loc3_.moveTo(wx,wy,wz);
         param1.addObject(_loc3_);
      }
      
      public function get alternativeSkins() : String
      {
         return this.§_-620§;
      }
      
      public function set alternativeSkins(param1:String) : void
      {
         this.§_-620§ = param1;
      }
      
      public function get itemIndex() : int
      {
         return this.§_-Xg§;
      }
      
      public function set itemIndex(param1:int) : void
      {
         this.§_-Xg§ = param1;
      }
   }
}

