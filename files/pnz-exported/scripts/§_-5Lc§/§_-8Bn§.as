package §_-5Lc§
{
   public class §_-8Bn§
   {
      public static const §_-5F-§:String = "clan";
      
      private var §_-AcP§:String = "";
      
      private var §_-0YG§:String = "";
      
      private var §_-9Op§:String;
      
      private var §_-9FK§:String = "";
      
      private var §_-Ak0§:Object = {};
      
      private var §_-9yg§:Array = [];
      
      public function §_-8Bn§()
      {
         super();
      }
      
      public function fromXML(param1:XML) : void
      {
         var _loc2_:XML = null;
         var _loc3_:§_-Btw§ = null;
         this.§_-AcP§ = !!param1.hasOwnProperty("@id") ? param1["@id"] : "";
         this.§_-0YG§ = !!param1.hasOwnProperty("@zoneId") ? param1["@zoneId"] : "";
         this.§_-9Op§ = !!param1.hasOwnProperty("@dresscode") ? param1["@dresscode"] : "";
         this.§_-9FK§ = !!param1.hasOwnProperty("@defaultRoomId") ? param1["@defaultRoomId"] : "";
         this.§_-9yg§ = !!param1.hasOwnProperty("@loadingContent") ? String(param1["@loadingContent"]).split(",") : [];
         for each(_loc2_ in (param1.elements("rooms")[0] as XML).elements("room"))
         {
            _loc3_ = this.§_-8nB§(_loc2_["@id"]);
            _loc3_.fromXML(_loc2_);
            this.addRoom(_loc3_);
         }
      }
      
      private function §_-8nB§(param1:String) : §_-Btw§
      {
         return new §_-Btw§();
      }
      
      public function get id() : String
      {
         return this.§_-AcP§;
      }
      
      public function set id(param1:String) : void
      {
         this.§_-AcP§ = param1;
      }
      
      public function get zoneId() : String
      {
         return this.§_-0YG§;
      }
      
      public function set zoneId(param1:String) : void
      {
         this.§_-0YG§ = param1;
      }
      
      public function get §_-6bS§() : String
      {
         return this.§_-9Op§;
      }
      
      public function get loadingContent() : Array
      {
         return this.§_-9yg§;
      }
      
      public function addRoom(param1:§_-Btw§) : void
      {
         param1.§_-jY§ = this;
         this.§_-Ak0§[param1.typeId] = param1;
      }
      
      public function getRoom(param1:String) : §_-Btw§
      {
         return !!this.§_-Ak0§.hasOwnProperty(param1) ? this.§_-Ak0§[param1] : null;
      }
      
      public function get §_-ML§() : §_-Btw§
      {
         var _loc1_:§_-Btw§ = null;
         if(this.§_-9FK§ != null && this.§_-9FK§ != "" && Boolean(this.§_-Ak0§.hasOwnProperty(this.§_-9FK§)) && this.§_-Ak0§[this.§_-9FK§] != null)
         {
            return this.§_-Ak0§[this.§_-9FK§];
         }
         var _loc2_:int = 0;
         var _loc3_:* = this.§_-Ak0§;
         for each(_loc1_ in _loc3_)
         {
            return _loc1_;
         }
         return null;
      }
   }
}

