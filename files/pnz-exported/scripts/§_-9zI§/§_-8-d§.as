package §_-9zI§
{
   import §_-BeZ§.§_-0Yu§;
   import §_-BeZ§.§_-4Ww§;
   
   public class §_-8-d§ implements §_-0Yu§
   {
      private static const §_-6Ud§:String = "id";
      
      private static const §_-5-W§:String = "mid";
      
      private static const §_-9F-§:String = "act";
      
      private static const §_-9Ac§:String = "tid";
      
      private static const §_-7fI§:String = "dta";
      
      private static const §_-3Id§:String = "dte";
      
      private static const §_-5aH§:String = "ip";
      
      private var §_-AcP§:int = 0;
      
      private var §_-9sx§:int = 0;
      
      private var _action:String = null;
      
      private var _userId:int = 0;
      
      private var _data:String = null;
      
      private var §_-0xA§:Number = 0;
      
      private var §_-0U7§:String = null;
      
      public function §_-8-d§()
      {
         super();
      }
      
      public function get moderatorId() : int
      {
         return this.§_-9sx§;
      }
      
      public function set moderatorId(param1:int) : void
      {
         this.§_-9sx§ = param1;
      }
      
      public function get id() : int
      {
         return this.§_-AcP§;
      }
      
      public function set id(param1:int) : void
      {
         this.§_-AcP§ = param1;
      }
      
      public function get userId() : int
      {
         return this._userId;
      }
      
      public function set userId(param1:int) : void
      {
         this._userId = param1;
      }
      
      public function get data() : String
      {
         return this._data;
      }
      
      public function set data(param1:String) : void
      {
         this._data = param1;
      }
      
      public function get date() : Number
      {
         return this.§_-0xA§;
      }
      
      public function set date(param1:Number) : void
      {
         this.§_-0xA§ = param1;
      }
      
      public function get ip() : String
      {
         return this.§_-0U7§;
      }
      
      public function set ip(param1:String) : void
      {
         this.§_-0U7§ = param1;
      }
      
      public function get action() : String
      {
         return this._action;
      }
      
      public function set action(param1:String) : void
      {
         this._action = param1;
      }
      
      public function toAGSObject(param1:§_-4Ww§) : void
      {
         param1.put(§_-6Ud§,this.id);
         param1.put(§_-5-W§,this.moderatorId);
         param1.put(§_-9F-§,this.action);
         param1.put(§_-9Ac§,this.userId);
         param1.put(§_-7fI§,this.data);
         param1.put(§_-3Id§,this.date);
         param1.put(§_-5aH§,this.ip);
      }
      
      public function fromAGSObject(param1:§_-4Ww§) : void
      {
         this.id = param1.getInt(§_-6Ud§);
         this.moderatorId = param1.getInt(§_-5-W§);
         this.action = param1.getString(§_-9F-§);
         this.userId = param1.getInt(§_-9Ac§);
         this.data = param1.getString(§_-7fI§);
         this.date = param1.getInt(§_-3Id§);
         this.ip = param1.getString(§_-5aH§);
      }
   }
}

