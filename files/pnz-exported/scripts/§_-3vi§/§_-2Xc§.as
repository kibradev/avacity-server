package §_-3vi§
{
   public class §_-2Xc§
   {
      public static const §_-BJU§:String = "1";
      
      private var §_-AcP§:String;
      
      private var §_-3Eb§:int;
      
      public function §_-2Xc§()
      {
         super();
      }
      
      public function configure(param1:XML) : void
      {
         this.§_-AcP§ = !!param1.hasOwnProperty("@id") ? param1["@id"] : "0";
         this.§_-3Eb§ = !!param1.hasOwnProperty("@minClanLevel") ? int(param1["@minClanLevel"]) : 1;
      }
      
      public function get id() : String
      {
         return this.§_-AcP§;
      }
      
      public function get minClanLevel() : int
      {
         return this.§_-3Eb§;
      }
   }
}

