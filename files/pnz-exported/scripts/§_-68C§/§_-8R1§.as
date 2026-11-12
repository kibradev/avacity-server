package §_-68C§
{
   import §_-99s§.§_-7Tj§;
   import §_-9YW§.§_-4j-§;
   
   public class §_-8R1§ extends §_-7Tj§
   {
      private static const §_-AT8§:int = 0;
      
      private static const §_-CBn§:int = 1;
      
      private var §_-3Eb§:int = 0;
      
      private var §_-5th§:int = 0;
      
      private var §_-A0N§:String = null;
      
      private var §_-9LD§:Array = [];
      
      public function §_-8R1§()
      {
         super();
      }
      
      override public function loadXML(param1:XML) : void
      {
         var _loc2_:XML = null;
         super.loadXML(param1);
         this.§_-3Eb§ = !!param1.hasOwnProperty("@minClanLevel") ? int(param1["@minClanLevel"]) : 0;
         this.§_-5th§ = !!param1.hasOwnProperty("@clanCoin") ? int(param1["@clanCoin"]) : 0;
         this.§_-A0N§ = !!param1.hasOwnProperty("@itemsCategoryId") ? param1["@itemsCategoryId"] : null;
         this.§_-9ze§();
         for each(_loc2_ in (param1.elements("unlockItems")[0] as XML).elements("unlockItem"))
         {
            if(_loc2_.hasOwnProperty("@id"))
            {
               this.§_-9LD§.push(_loc2_["@id"]);
            }
         }
      }
      
      public function §_-8W4§() : Boolean
      {
         return category.findParentById(§_-4j-§.§_-7bS§) != null;
      }
      
      public function §_-8eY§() : Boolean
      {
         return category.findParentById(§_-4j-§.§_-4IG§) != null;
      }
      
      public function get minClanLevel() : int
      {
         return this.§_-3Eb§;
      }
      
      public function get clanCoin() : int
      {
         return this.§_-5th§;
      }
      
      public function get unlockItems() : Array
      {
         return this.§_-9LD§;
      }
      
      public function get §_-3PL§() : String
      {
         return this.§_-A0N§;
      }
      
      private function §_-9ze§() : void
      {
         _priority = §_-466§.§_-5hZ§.indexOf(this.§_-A0N§);
      }
      
      public function get §_-3NN§() : String
      {
         return this.§_-9LD§[§_-AT8§];
      }
      
      public function get §_-6m7§() : String
      {
         return this.§_-9LD§[§_-CBn§];
      }
   }
}

