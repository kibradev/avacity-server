package §_-AOz§
{
   import §_-18o§.§_-A8q§;
   import §_-6EN§.§_-6T6§;
   import §_-BeZ§.§_-0Yu§;
   import §_-BeZ§.§_-4Ww§;
   
   public class §_-5SV§ implements §_-0Yu§
   {
      public static const §_-bf§:String = "cc";
      
      public static const §_-4Fb§:String = "ccltns";
      
      public static const §_-9tA§:String = "ccltn";
      
      private var §_-243§:String = §_-6T6§.§_-9qd§;
      
      private var §_-3LT§:Object = {};
      
      public function §_-5SV§()
      {
         super();
      }
      
      public function §_-1y5§(param1:§_-2pt§) : void
      {
         this.§_-3LT§[param1.type] = param1;
      }
      
      public function get currentCollectionType() : String
      {
         return this.§_-243§;
      }
      
      public function set currentCollectionType(param1:String) : void
      {
         this.§_-243§ = param1;
      }
      
      public function get §_-AKy§() : Object
      {
         return this.§_-3LT§;
      }
      
      public function set §_-AKy§(param1:Object) : void
      {
         this.§_-3LT§ = param1;
      }
      
      public function getCollectionByType(param1:String) : §_-2pt§
      {
         return !!this.§_-3LT§.hasOwnProperty(param1) ? this.§_-3LT§[param1] : null;
      }
      
      public function toAGSObject(param1:§_-4Ww§) : void
      {
         param1.put(§_-bf§,this.currentCollectionType);
         param1.§_-5CI§(§_-4Fb§,this.§_-AKy§);
      }
      
      public function fromAGSObject(param1:§_-4Ww§) : void
      {
         this.currentCollectionType = param1.getString(§_-bf§);
         this.§_-AKy§ = param1.getMap(§_-4Fb§,§_-2pt§);
      }
      
      public function clone() : §_-5SV§
      {
         return §_-A8q§.§_-7t§(this);
      }
   }
}

