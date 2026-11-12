package §_-MZ§
{
   import §_-6-L§.§_-3hw§;
   import §_-9OO§.§_-5xb§;
   import §_-BeZ§.§_-0Yu§;
   import §_-BeZ§.§_-1e5§;
   import §_-BeZ§.§_-4Ww§;
   
   public class §_-7zb§ implements §_-0Yu§
   {
      private static const §_-6Ud§:String = "id";
      
      private static const §_-AQ5§:String = "zid";
      
      private static const §_-4rt§:String = "drid";
      
      private static const §_-4zy§:String = "rms";
      
      private static const §_-3fI§:String = "ldc";
      
      private var §_-AcP§:String = "";
      
      private var §_-0YG§:String = "";
      
      private var §_-9FK§:String = "";
      
      private var §_-Ak0§:Object = {};
      
      private var §_-9yg§:Array = [];
      
      public function §_-7zb§()
      {
         super();
      }
      
      public function fromXML(param1:XML) : void
      {
         var _loc2_:XML = null;
         var _loc3_:§_-12j§ = null;
         this.§_-AcP§ = §_-3hw§.getString(param1,"@id","");
         this.§_-0YG§ = §_-3hw§.getString(param1,"@zoneId","");
         this.§_-9FK§ = §_-3hw§.getString(param1,"@defaultRoomId","");
         this.§_-9yg§ = §_-3hw§.getList(param1,"@loadingContent",[]);
         for each(_loc2_ in §_-3hw§.§_-3bk§(param1,"rooms.room"))
         {
            _loc3_ = this.§_-8nB§(_loc2_["@id"]);
            _loc3_.fromXML(_loc2_);
            this.addRoom(_loc3_);
         }
      }
      
      private function §_-8nB§(param1:String) : §_-12j§
      {
         switch(param1)
         {
            case "pc1":
               return new §_-5xb§();
            default:
               return new §_-12j§();
         }
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
      
      public function get loadingContent() : Array
      {
         return this.§_-9yg§;
      }
      
      public function addRoom(param1:§_-12j§) : void
      {
         param1.§_-jY§ = this;
         this.§_-Ak0§[param1.roomId] = param1;
      }
      
      public function getRoom(param1:String) : §_-12j§
      {
         return !!this.§_-Ak0§.hasOwnProperty(param1) ? this.§_-Ak0§[param1] : null;
      }
      
      public function get §_-ML§() : §_-12j§
      {
         var _loc1_:§_-12j§ = null;
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
      
      public function toAGSObject(param1:§_-4Ww§) : void
      {
      }
      
      public function fromAGSObject(param1:§_-4Ww§) : void
      {
         var _loc4_:§_-4Ww§ = null;
         var _loc5_:§_-12j§ = null;
         this.§_-AcP§ = param1.getString(§_-6Ud§);
         this.§_-0YG§ = param1.getString(§_-AQ5§);
         this.§_-9FK§ = param1.getString(§_-4rt§);
         this.§_-9yg§ = param1.getString(§_-3fI§).split(",");
         var _loc2_:§_-1e5§ = param1.§_-CUA§(§_-4zy§);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_.length)
         {
            _loc4_ = _loc2_.§_-ANw§(_loc3_);
            _loc5_ = this.§_-8nB§(_loc4_.getString(§_-12j§.§_-6Ud§));
            _loc5_.fromAGSObject(_loc4_);
            _loc5_.§_-jY§ = this;
            this.§_-Ak0§[_loc5_.roomId] = _loc5_;
            _loc3_++;
         }
      }
   }
}

