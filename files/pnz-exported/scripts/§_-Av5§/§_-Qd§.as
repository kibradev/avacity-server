package §_-Av5§
{
   import §_-18o§.§_-A8q§;
   import §_-5VL§.§_-0H9§;
   import §_-90R§.§_-aZ§;
   import §_-BeZ§.§_-0Yu§;
   import §_-BeZ§.§_-4Ww§;
   
   public class §_-Qd§ implements §_-0Yu§
   {
      public static const §_-2m3§:String = "s";
      
      public static const §_-3pU§:String = "l";
      
      public static const §_-BOx§:String = "pl";
      
      public static const §_-Bmt§:String = "x";
      
      public static const §_-5d7§:String = "y";
      
      public static const §_-0E9§:String = "d";
      
      public static const §_-5a§:String = "st";
      
      public static const §_-2uD§:String = "shlc";
      
      public static const §_-Ahh§:String = "at";
      
      public static const §_-9wt§:String = "lid";
      
      private var §_-0wz§:String = "";
      
      private var §_-2BH§:String = "";
      
      private var _group:String = "";
      
      private var §_-0UR§:String = "";
      
      private var §_-388§:String = "";
      
      private var §_-2oU§:String = "";
      
      private var §_-7Ql§:String = "";
      
      private var _x:Number = 0;
      
      private var _y:Number = 0;
      
      private var _direction:int = 0;
      
      private var _state:int = 0;
      
      private var §_-0KO§:String = null;
      
      private var §_-5Hg§:Boolean = true;
      
      private var §_-0uK§:String;
      
      public function §_-Qd§()
      {
         super();
      }
      
      public function get x() : Number
      {
         return this._x;
      }
      
      public function set x(param1:Number) : void
      {
         this._x = param1;
      }
      
      public function get y() : Number
      {
         return this._y;
      }
      
      public function set y(param1:Number) : void
      {
         this._y = param1;
      }
      
      public function get server() : String
      {
         return this.§_-0wz§;
      }
      
      public function set server(param1:String) : void
      {
         this.§_-0wz§ = param1;
      }
      
      public function get zone() : String
      {
         return this.§_-2BH§;
      }
      
      public function set zone(param1:String) : void
      {
         this.§_-2BH§ = param1;
      }
      
      public function get group() : String
      {
         return this._group;
      }
      
      public function set group(param1:String) : void
      {
         this._group = param1;
      }
      
      public function get room() : String
      {
         return this.§_-0UR§;
      }
      
      public function set room(param1:String) : void
      {
         this.§_-0UR§ = param1;
      }
      
      public function get §_-9QU§() : String
      {
         return this.§_-388§;
      }
      
      public function set §_-9QU§(param1:String) : void
      {
         this.§_-388§ = param1;
      }
      
      public function get §_-7Om§() : String
      {
         return this.§_-2oU§;
      }
      
      public function set §_-7Om§(param1:String) : void
      {
         this.§_-2oU§ = param1;
      }
      
      public function get §_-5zP§() : String
      {
         return this.§_-7Ql§;
      }
      
      public function set §_-5zP§(param1:String) : void
      {
         this.§_-7Ql§ = param1;
      }
      
      public function get direction() : int
      {
         return this._direction;
      }
      
      public function set direction(param1:int) : void
      {
         this._direction = param1;
      }
      
      public function get state() : int
      {
         return this._state;
      }
      
      public function set state(param1:int) : void
      {
         this._state = param1;
      }
      
      public function get actionTag() : String
      {
         return this.§_-0KO§;
      }
      
      public function set actionTag(param1:String) : void
      {
         this.§_-0KO§ = param1;
      }
      
      public function get §_-7rj§() : Boolean
      {
         return this.§_-5Hg§;
      }
      
      public function set §_-7rj§(param1:Boolean) : void
      {
         this.§_-5Hg§ = param1;
      }
      
      public function get layerId() : String
      {
         return this.§_-0uK§;
      }
      
      public function set layerId(param1:String) : void
      {
         this.§_-0uK§ = param1;
      }
      
      public function updateLocation(param1:String, param2:String = null) : void
      {
         this.§_-0uK§ = null;
         var _loc3_:Array = param1.split("_");
         this.zone = _loc3_.length > 0 ? _loc3_.shift() : null;
         this.group = _loc3_.length > 0 ? _loc3_.shift() : null;
         this.room = _loc3_.length > 0 ? _loc3_.join("_") : null;
         if(param2 != null)
         {
            _loc3_ = param2.split("_");
            this.§_-9QU§ = _loc3_.length > 0 ? _loc3_.shift() : null;
            this.§_-7Om§ = _loc3_.length > 0 ? _loc3_.shift() : null;
            this.§_-5zP§ = _loc3_.length > 0 ? _loc3_.join("_") : null;
         }
      }
      
      public function resetPos() : void
      {
         this.x = -1;
         this.y = -1;
         this.direction = §_-aZ§.SW;
         this.state = §_-0H9§.§_-CUz§;
         this.actionTag = null;
      }
      
      public function fromAGSObject(param1:§_-4Ww§) : void
      {
         this.server = param1.getString(§_-2m3§);
         this.updateLocation(param1.getString(§_-3pU§),param1.getString(§_-BOx§));
         this.x = param1.§_-1hz§(§_-Bmt§,-1);
         this.y = param1.§_-1hz§(§_-5d7§,-1);
         this.direction = param1.getInt(§_-0E9§,§_-aZ§.S);
         this.state = param1.getInt(§_-5a§,§_-0H9§.§_-CUz§);
         this.actionTag = param1.getString(§_-Ahh§);
         this.§_-7rj§ = param1.getBoolean(§_-2uD§);
         this.layerId = param1.getString(§_-9wt§);
      }
      
      public function toAGSObject(param1:§_-4Ww§) : void
      {
         param1.put(§_-2m3§,this.server);
         param1.put(§_-3pU§,this.zone + "_" + this.group + "_" + this.room);
         param1.put(§_-BOx§,this.§_-9QU§ + "_" + this.§_-7Om§ + "_" + this.§_-5zP§);
         param1.put(§_-Bmt§,this.x);
         param1.put(§_-5d7§,this.y);
         param1.put(§_-0E9§,this.direction);
         param1.put(§_-5a§,this.state);
         param1.put(§_-Ahh§,this.actionTag);
         param1.put(§_-2uD§,this.§_-7rj§);
         param1.putString(§_-9wt§,this.layerId);
      }
      
      public function clone() : §_-Qd§
      {
         return §_-A8q§.§_-7t§(this);
      }
   }
}

