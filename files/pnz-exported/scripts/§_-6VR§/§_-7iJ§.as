package §_-6VR§
{
   import §_-58b§.§_-2WE§;
   import §_-5g6§.§_-1ib§;
   import §_-8jw§.SalonStylistActor;
   import §_-90R§.§_-aZ§;
   
   public class §_-7iJ§ extends §_-2WE§
   {
      protected var §_-8FA§:String = "1";
      
      public function §_-7iJ§()
      {
         super();
      }
      
      override public function apply(param1:§_-1ib§, param2:Object) : void
      {
         var _loc3_:SalonStylistActor = new SalonStylistActor(this.§_-8FA§);
         _loc3_.placeId = this.placeId;
         _loc3_.§_-49T§ = this;
         _loc3_.objectId = itemId;
         _loc3_.direction = §_-aZ§.S;
         _loc3_.moveTo(wx,wy,wz);
         _loc3_.setSize(1,1,4);
         param1.addObject(_loc3_);
      }
      
      public function get placeId() : String
      {
         return this.§_-8FA§;
      }
      
      public function set placeId(param1:String) : void
      {
         this.§_-8FA§ = param1;
      }
   }
}

