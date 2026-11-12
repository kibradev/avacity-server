package §_-5QF§
{
   import §_-0sG§.§_-1fy§;
   import §_-1Jk§.§_-7ZQ§;
   import §_-5MD§.§_-C9k§;
   import §_-5g6§.§_-1ib§;
   
   public class §_-8lA§ extends §_-1fy§
   {
      private var §_-4No§:String = null;
      
      public function §_-8lA§()
      {
         super();
      }
      
      override protected function createObject() : §_-C9k§
      {
         return new §_-7ZQ§();
      }
      
      override public function apply(param1:§_-1ib§, param2:Object) : void
      {
         var _loc3_:§_-7ZQ§ = null;
         _loc3_ = this.createObject() as §_-7ZQ§;
         _loc3_.§_-6S6§ = _kind;
         _loc3_.trapId = this.trapId;
         _loc3_.§_-49T§ = this;
         _loc3_.objectId = itemId;
         _loc3_.moveTo(wx,wy,wz);
         param1.addObject(_loc3_);
      }
      
      public function get trapId() : String
      {
         return this.§_-4No§;
      }
      
      public function set trapId(param1:String) : void
      {
         this.§_-4No§ = param1;
      }
   }
}

