package §_-0sG§
{
   import §_-5MD§.§_-Ath§;
   import §_-5MD§.§_-C9k§;
   import §_-5g6§.§_-1ib§;
   import §_-90R§.§_-aZ§;
   
   public class §_-COJ§ extends §_-AEL§
   {
      private var §_-23b§:String = null;
      
      private var §_-BYU§:String = null;
      
      public function §_-COJ§()
      {
         super();
      }
      
      override protected function createObject() : §_-C9k§
      {
         return new §_-Ath§();
      }
      
      override public function apply(param1:§_-1ib§, param2:Object) : void
      {
         var _loc3_:§_-Ath§ = null;
         var _loc4_:Number = NaN;
         _loc3_ = this.createObject() as §_-Ath§;
         _loc3_.direction = §_-aZ§.§_-4NI§(direction);
         _loc3_.§_-6S6§ = _kind;
         _loc3_.§_-49T§ = this;
         _loc3_.objectId = itemId;
         _loc3_.moveTo(wx,wy,wz);
         _loc3_.itemProjectionType = this.§_-BYU§;
         if(this.§_-23b§ != null)
         {
            _loc3_.itemProjectionCells = this.§_-23b§.split(",");
         }
         if(_loc3_.direction == §_-aZ§.SE || _loc3_.direction == §_-aZ§.NW)
         {
            _loc4_ = _loc3_.length;
            _loc3_.length = _loc3_.width;
            _loc3_.width = _loc4_;
         }
         param1.addObject(_loc3_);
      }
      
      public function get itemProjectionCells() : String
      {
         return this.§_-23b§;
      }
      
      public function set itemProjectionCells(param1:String) : void
      {
         this.§_-23b§ = param1;
      }
      
      public function get itemProjectionType() : String
      {
         return this.§_-BYU§;
      }
      
      public function set itemProjectionType(param1:String) : void
      {
         this.§_-BYU§ = param1;
      }
   }
}

