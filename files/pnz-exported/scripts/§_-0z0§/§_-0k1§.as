package §_-0z0§
{
   public class §_-0k1§
   {
      public var id:String = null;
      
      public var §_-4Nk§:Number = 0;
      
      public var §_-1Ju§:Number = 0;
      
      public var currency:String = null;
      
      public var country:String = null;
      
      public var points:int = 0;
      
      public function §_-0k1§()
      {
         super();
      }
      
      public function fromRaw(param1:Object) : void
      {
         this.id = !!param1.hasOwnProperty("pricepoint_id") ? param1["pricepoint_id"] : null;
         this.§_-4Nk§ = !!param1.hasOwnProperty("payer_amount") ? Number(param1["payer_amount"]) : 0;
         this.§_-1Ju§ = !!param1.hasOwnProperty("payout_base_amount") ? Number(param1["payout_base_amount"]) : 0;
         this.currency = !!param1.hasOwnProperty("currency") ? param1["currency"] : null;
         this.country = !!param1.hasOwnProperty("country") ? param1["country"] : null;
      }
      
      public function clone() : §_-0k1§
      {
         var _loc1_:§_-0k1§ = new §_-0k1§();
         _loc1_.id = this.id;
         _loc1_.§_-4Nk§ = this.§_-4Nk§;
         _loc1_.§_-1Ju§ = this.§_-1Ju§;
         _loc1_.currency = this.currency;
         _loc1_.country = this.country;
         _loc1_.points = this.points;
         return _loc1_;
      }
   }
}

