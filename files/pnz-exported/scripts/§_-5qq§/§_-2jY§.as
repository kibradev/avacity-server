package §_-5qq§
{
   import §_-0fi§.§_-6f3§;
   
   public class §_-2jY§ extends §_-6f3§
   {
      private var §_-5th§:int = 0;
      
      private var §_-3Eb§:int = 0;
      
      public function §_-2jY§()
      {
         super();
      }
      
      override public function loadXML(param1:XML) : void
      {
         super.loadXML(param1);
         this.§_-5th§ = !!param1.hasOwnProperty("@clanCoin") ? int(param1["@clanCoin"]) : 0;
         this.§_-3Eb§ = !!param1.hasOwnProperty("@minClanLevel") ? int(param1["@minClanLevel"]) : 0;
      }
      
      public function get clanCoin() : int
      {
         return this.§_-5th§;
      }
      
      public function get minClanLevel() : int
      {
         return this.§_-3Eb§;
      }
   }
}

