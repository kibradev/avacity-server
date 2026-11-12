package §_-7qJ§
{
   import §_-0sG§.§_-9xZ§;
   import §_-5g6§.§_-1ib§;
   import §_-ps§.§_-8mU§;
   
   public class §_-4yt§ extends §_-9xZ§
   {
      protected var _locationLayerId:String = null;
      
      public function §_-4yt§()
      {
         super();
      }
      
      override public function apply(param1:§_-1ib§, param2:Object) : void
      {
         var _loc3_:§_-8mU§ = null;
         _loc3_ = new §_-8mU§();
         _loc3_.§_-6S6§ = _kind;
         _loc3_.§_-49T§ = this;
         _loc3_.objectId = itemId;
         _loc3_.moveTo(wx,wy,wz);
         _loc3_.locationId = locationId;
         _loc3_.roomId = roomId;
         _loc3_.locationLayerId = this._locationLayerId;
         param1.addObject(_loc3_);
      }
      
      public function get locationLayerId() : String
      {
         return this._locationLayerId;
      }
      
      public function set locationLayerId(param1:String) : void
      {
         this._locationLayerId = param1;
      }
   }
}

