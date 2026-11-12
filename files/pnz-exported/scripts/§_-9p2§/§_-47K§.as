package §_-9p2§
{
   import §_-58b§.§_-2WE§;
   import §_-5g6§.§_-1ib§;
   import §_-8jw§.§_-1Qd§;
   import §_-8jw§.§_-2Ox§;
   import §_-8jw§.§_-EW§;
   import §_-90R§.§_-aZ§;
   
   public class §_-47K§ extends §_-2WE§
   {
      public static const §_-2H3§:String = "Boy";
      
      public static const §_-7J1§:String = "Girl";
      
      protected var _typeId:String = "Boy";
      
      public function §_-47K§()
      {
         super();
      }
      
      override public function apply(param1:§_-1ib§, param2:Object) : void
      {
         var _loc3_:§_-EW§ = null;
         _loc3_ = null;
         if(this._typeId != null && this._typeId == §_-7J1§)
         {
            _loc3_ = new §_-1Qd§();
         }
         else
         {
            _loc3_ = new §_-2Ox§();
         }
         _loc3_.§_-49T§ = this;
         _loc3_.objectId = itemId;
         _loc3_.direction = §_-aZ§.N;
         _loc3_.moveTo(wx,wy,wz);
         _loc3_.setSize(1,1,4);
         param1.addObject(_loc3_);
      }
      
      public function get typeId() : String
      {
         return this._typeId;
      }
      
      public function set typeId(param1:String) : void
      {
         this._typeId = param1;
      }
   }
}

