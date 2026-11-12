package §_-0z0§
{
   public class §_-0No§
   {
      public var §_-7Nk§:String = null;
      
      public var §_-5wk§:String = null;
      
      public var §_-5Wg§:String = null;
      
      private var _mobilePrices:Array = [];
      
      public function §_-0No§()
      {
         super();
      }
      
      public function get prices() : Array
      {
         return this._mobilePrices;
      }
      
      public function fromRaw(param1:Object) : void
      {
         var _loc2_:Object = null;
         var _loc3_:§_-0k1§ = null;
         this.§_-7Nk§ = !!param1.hasOwnProperty("user_currency") ? param1["user_currency"] : null;
         this.§_-5wk§ = !!param1.hasOwnProperty("mobile_country") ? param1["mobile_country"] : null;
         this.§_-5Wg§ = !!param1.hasOwnProperty("predicted_mobile_country") ? param1["predicted_mobile_country"] : null;
         for each(_loc2_ in param1["pricepoints"])
         {
            _loc3_ = new §_-0k1§();
            _loc3_.fromRaw(_loc2_);
            this._mobilePrices.push(_loc3_);
         }
      }
   }
}

