package §_-5Us§
{
   import §_-BeZ§.§_-0Yu§;
   import §_-BeZ§.§_-4Ww§;
   
   public class §_-1Dh§ implements §_-0Yu§
   {
      private static const §_-29u§:String = "setind";
      
      private static const §_-9EA§:String = "id";
      
      private static const §_-eh§:String = "vl";
      
      private static const §_-3YX§:String = "ordr";
      
      private static const §_-A3L§:String = "vslvl";
      
      private var §_-Bvw§:uint = 0;
      
      private var §_-AcP§:String = "";
      
      private var _value:uint = 0;
      
      private var §_-5MF§:int = 0;
      
      private var §_-C6Y§:int = 0;
      
      public function §_-1Dh§(param1:XML = null, param2:int = -1)
      {
         super();
         if(param1 == null || param2 == -1)
         {
            return;
         }
         this.§_-Bvw§ = param2;
         this.fromXML(param1);
      }
      
      public function fromXML(param1:XML) : void
      {
         this.§_-AcP§ = !!param1.hasOwnProperty("@name") ? param1["@name"] : "";
         this._value = !!param1.hasOwnProperty("@value") ? uint(param1["@value"]) : 0;
      }
      
      public function get index() : int
      {
         return this.§_-Bvw§;
      }
      
      public function get id() : String
      {
         return this.§_-AcP§;
      }
      
      public function get value() : uint
      {
         return this._value;
      }
      
      public function get order() : int
      {
         return this.§_-5MF§;
      }
      
      public function set order(param1:int) : void
      {
         this.§_-5MF§ = param1;
      }
      
      public function set value(param1:uint) : void
      {
         this._value = param1;
      }
      
      public function get visagistLevel() : int
      {
         return this.§_-C6Y§;
      }
      
      public function set visagistLevel(param1:int) : void
      {
         this.§_-C6Y§ = param1;
      }
      
      public function toAGSObject(param1:§_-4Ww§) : void
      {
         param1.put(§_-29u§,this.§_-Bvw§);
         param1.put(§_-9EA§,this.§_-AcP§);
         param1.put(§_-eh§,this._value);
         param1.put(§_-3YX§,this.§_-5MF§);
         param1.put(§_-A3L§,this.§_-C6Y§);
      }
      
      public function fromAGSObject(param1:§_-4Ww§) : void
      {
         this.§_-Bvw§ = param1.getInt(§_-29u§,0);
         this.§_-AcP§ = param1.getString(§_-9EA§,null);
         this._value = param1.getInt(§_-eh§,0);
         this.§_-5MF§ = param1.getInt(§_-3YX§,0);
         this.§_-C6Y§ = param1.getInt(§_-A3L§,0);
      }
   }
}

