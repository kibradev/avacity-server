package §_-0z0§
{
   public class §_-Dz§
   {
      public var §_-7Nk§:String = "";
      
      public var §_-5rX§:Number = 0;
      
      public var §_-CZc§:Number = 0;
      
      public var §_-79Q§:Number = 0;
      
      public var §_-3FU§:Object = null;
      
      public function §_-Dz§()
      {
         super();
      }
      
      public function fromRaw(param1:Object) : void
      {
         this.§_-7Nk§ = !!param1.hasOwnProperty("user_currency") ? String(param1["user_currency"]) : "";
         this.§_-5rX§ = !!param1.hasOwnProperty("usd_exchange") ? Number(param1["usd_exchange"]) : 0;
         this.§_-CZc§ = !!param1.hasOwnProperty("usd_exchange_inverse") ? Number(param1["usd_exchange_inverse"]) : 0;
         this.§_-79Q§ = !!param1.hasOwnProperty("currency_offset") ? Number(param1["currency_offset"]) : 0;
         this.§_-3FU§ = param1;
      }
   }
}

