package §_-3vi§
{
   public class §_-40D§
   {
      private var §_-6rx§:int;
      
      private var §_-9ll§:int;
      
      private var §_-CHV§:int;
      
      private var §_-5th§:int;
      
      private var §_-23h§:int;
      
      public function §_-40D§()
      {
         super();
      }
      
      public function get §_-0y5§() : int
      {
         return this.§_-6rx§;
      }
      
      public function get §_-44s§() : int
      {
         return this.§_-9ll§;
      }
      
      public function get §_-00O§() : int
      {
         return this.§_-CHV§;
      }
      
      public function get clanCoin() : int
      {
         return this.§_-5th§;
      }
      
      public function get §_-6lX§() : int
      {
         return this.§_-23h§;
      }
      
      public function configure(param1:XML) : void
      {
         this.§_-6rx§ = !!param1.hasOwnProperty("@minPlayerLevel") ? int(param1["@minPlayerLevel"]) : 0;
         this.§_-9ll§ = !!param1.hasOwnProperty("@minMemberCount") ? int(param1["@minMemberCount"]) : 0;
         this.§_-CHV§ = !!param1.hasOwnProperty("@minActivityPoints") ? int(param1["@minActivityPoints"]) : 0;
         this.§_-5th§ = !!param1.hasOwnProperty("@clanCoin") ? int(param1["@clanCoin"]) : 0;
         this.§_-23h§ = !!param1.hasOwnProperty("@levelPoints") ? int(param1["@levelPoints"]) : 0;
      }
   }
}

