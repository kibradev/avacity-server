package §_-BeZ§
{
   public class §_-67e§
   {
      public static const §_-8-V§:int = 0;
      
      public static const §_-01G§:int = 1;
      
      public static const §_-6m3§:int = 2;
      
      public static const §_-7hm§:int = 3;
      
      public static const §_-1uj§:int = 4;
      
      public static const §_-BZk§:int = 5;
      
      public static const §_-Ag5§:int = 6;
      
      public static const §_-2uh§:int = 7;
      
      public static const §_-57v§:int = 8;
      
      private var _value:*;
      
      private var _type:int;
      
      public function §_-67e§(param1:*, param2:int)
      {
         super();
         this._value = param1;
         this._type = param2;
      }
      
      public static function §_-1tP§() : §_-67e§
      {
         return new §_-67e§(null,§_-67e§.§_-8-V§);
      }
      
      public static function §_-7EV§(param1:Boolean) : §_-67e§
      {
         return new §_-67e§(param1,§_-67e§.§_-01G§);
      }
      
      public static function §_-BrE§(param1:int) : §_-67e§
      {
         return new §_-67e§(param1,§_-67e§.§_-6m3§);
      }
      
      public static function §_-0Bi§(param1:Number) : §_-67e§
      {
         return new §_-67e§(Math.round(param1),§_-67e§.§_-7hm§);
      }
      
      public static function §_-0b4§(param1:Number) : §_-67e§
      {
         return new §_-67e§(param1,§_-67e§.§_-1uj§);
      }
      
      public static function §_-7Fa§(param1:String) : §_-67e§
      {
         if(param1 == null)
         {
            return §_-1tP§();
         }
         return new §_-67e§(param1,§_-67e§.§_-BZk§);
      }
      
      public static function §_-7e-§(param1:Date) : §_-67e§
      {
         if(param1 == null)
         {
            return §_-1tP§();
         }
         return new §_-67e§(param1,§_-67e§.§_-57v§);
      }
      
      public static function §_-5c2§(param1:§_-1e5§) : §_-67e§
      {
         if(param1 == null)
         {
            return §_-1tP§();
         }
         return new §_-67e§(param1,§_-67e§.§_-2uh§);
      }
      
      public static function §_-6WX§(param1:§_-4Ww§) : §_-67e§
      {
         if(param1 == null)
         {
            return §_-1tP§();
         }
         return new §_-67e§(param1,§_-67e§.§_-Ag5§);
      }
      
      public static function create(param1:*) : §_-67e§
      {
         if(param1 == null)
         {
            return §_-1tP§();
         }
         if(param1 is §_-67e§)
         {
            return param1;
         }
         if(param1 is §_-1e5§)
         {
            return §_-5c2§(param1);
         }
         if(param1 is §_-4Ww§)
         {
            return §_-6WX§(param1);
         }
         if(param1 is String)
         {
            return §_-7Fa§(param1);
         }
         if(param1 is Boolean)
         {
            return §_-7EV§(param1);
         }
         if(param1 is int || param1 is uint)
         {
            return §_-BrE§(param1);
         }
         if(param1 is Number)
         {
            return §_-0b4§(param1);
         }
         if(param1 is Date)
         {
            return §_-7e-§(param1);
         }
         throw new Error("Invalid value type, value=" + param1 + ", type=" + param1.getClass());
      }
      
      public static function §_-2P§(param1:*) : Boolean
      {
         return param1 == null || param1 is §_-1e5§ || param1 is §_-4Ww§ || param1 is String || param1 is Boolean || param1 is Number || param1 is Date;
      }
      
      public function get value() : *
      {
         return this._value;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function §_-5GZ§(param1:Boolean = false) : Boolean
      {
         if(this._type == §_-01G§)
         {
            return this._value;
         }
         if(this._type == §_-BZk§)
         {
            if(this._value == "true")
            {
               return true;
            }
            if(this._value == "false")
            {
               return false;
            }
            return param1;
         }
         return param1;
      }
      
      public function §_-9nF§(param1:int) : int
      {
         var _loc2_:int = 0;
         if(this._type == §_-6m3§ || this._type == §_-7hm§ || this._type == §_-1uj§)
         {
            return int(this._value);
         }
         if(this._type == §_-BZk§)
         {
            _loc2_ = parseInt(this._value);
            if(!isNaN(_loc2_))
            {
               return _loc2_;
            }
         }
         return param1;
      }
      
      public function §_-6f2§(param1:Number) : Number
      {
         return this.§_-6t4§(param1);
      }
      
      public function §_-6t4§(param1:Number) : Number
      {
         var _loc2_:int = 0;
         if(this._type == §_-6m3§ || this._type == §_-7hm§ || this._type == §_-1uj§)
         {
            return Number(this._value);
         }
         if(this._type == §_-BZk§)
         {
            _loc2_ = parseFloat(this._value);
            if(!isNaN(_loc2_))
            {
               return _loc2_;
            }
         }
         if(this._type == §_-57v§)
         {
            return (this._value as Date).time;
         }
         return param1;
      }
      
      public function §_-93U§(param1:String) : String
      {
         if(this._type == §_-BZk§)
         {
            return this._value;
         }
         if(this._type == §_-6m3§ || this._type == §_-7hm§ || this._type == §_-1uj§)
         {
            return String(this._value);
         }
         return param1;
      }
      
      public function §_-2b1§() : §_-1e5§
      {
         if(this._type == §_-2uh§)
         {
            return this._value;
         }
         return null;
      }
      
      public function §_-9Mk§() : §_-4Ww§
      {
         if(this._type == §_-Ag5§)
         {
            return this._value;
         }
         return null;
      }
      
      public function §_-46L§(param1:Date) : Date
      {
         var _loc2_:Date = null;
         if(this._type == §_-57v§)
         {
            return this._value;
         }
         if(this._type == §_-7hm§)
         {
            _loc2_ = new Date();
            _loc2_.time = this._value;
            return _loc2_;
         }
         return param1;
      }
      
      public function §_-6xV§() : Boolean
      {
         return this._type != §_-2uh§ && this._type != §_-Ag5§;
      }
      
      public function toString() : String
      {
         return "AGSDataEntry{_value=" + String(this._value) + ",_type=" + String(this._type) + "}";
      }
   }
}

