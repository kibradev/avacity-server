package §_-6-L§
{
   public class §_-2Rb§
   {
      public static const §_-1LD§:Number = Math.PI / 180;
      
      public static const §_-CCM§:Number = 180 / Math.PI;
      
      private static var §_-8g-§:Array = [1,0.1,0.01,0.001,0.0001,0.00001,0.000001,1e-7,1e-8,1e-9];
      
      public function §_-2Rb§()
      {
         super();
      }
      
      public static function distance(param1:Number, param2:Number, param3:Number = 0, param4:Number = 0) : Number
      {
         return Math.sqrt(Math.pow(param3 - param1,2) + Math.pow(param4 - param2,2));
      }
      
      public static function §_-0SH§(param1:Number, param2:Number, param3:Number) : Number
      {
         return param1 + (param1 - param2) * param3;
      }
      
      public static function §_-0Yt§(param1:Number) : Number
      {
         if(param1 >= 0)
         {
            param1 -= Math.floor(param1 / (2 * Math.PI)) * Math.PI * 2;
         }
         else
         {
            param1 += (Math.floor(Math.abs(param1) / (2 * Math.PI)) + 1) * Math.PI * 2;
         }
         return param1;
      }
      
      public static function angle(param1:Number, param2:Number) : Number
      {
         var _loc3_:Number = NaN;
         if(param1 != 0)
         {
            _loc3_ = Math.atan(param2 / Math.abs(param1));
            if(param1 < 0)
            {
               _loc3_ = Math.PI - _loc3_;
            }
         }
         else
         {
            _loc3_ = param2 > 0 ? Math.PI / 2 : -Math.PI / 2;
         }
         return _loc3_;
      }
      
      public static function §_-AV8§(param1:Number, param2:Number, param3:Number) : Number
      {
         var _loc4_:Number = NaN;
         if(param2 > param3)
         {
            _loc4_ = param2;
            param2 = param3;
            param3 = _loc4_;
         }
         return param1 < param2 ? param2 : (param1 > param3 ? param3 : param1);
      }
      
      public static function §_-4PT§(param1:Number, param2:Number) : Number
      {
         var _loc3_:Number = NaN;
         if(param1 > param2)
         {
            _loc3_ = param2;
            param2 = param1;
            param1 = _loc3_;
         }
         return Math.random() * (param2 - param1) + param1;
      }
      
      public static function §_-3GS§(param1:int, param2:int) : int
      {
         var _loc3_:int = 0;
         if(param1 > param2)
         {
            _loc3_ = param2;
            param2 = param1;
            param1 = _loc3_;
         }
         return Math.floor(Math.random() * (param2 - param1)) + param1;
      }
      
      public static function floor(param1:Number, param2:int = 8) : Number
      {
         if(param2 < 0)
         {
            throw new Error("Accuracy cannot be negative");
         }
         var _loc3_:Number = param2 < §_-8g-§.length ? Number(§_-8g-§[param2]) : Math.pow(0.1,param2);
         return Math.floor(param1 + _loc3_);
      }
      
      public static function ceil(param1:Number, param2:int = 8) : Number
      {
         if(param2 < 0)
         {
            throw new Error("Accuracy cannot be negative");
         }
         var _loc3_:Number = param2 < §_-8g-§.length ? Number(§_-8g-§[param2]) : Math.pow(0.1,param2);
         return int(Math.ceil(param1 - _loc3_));
      }
      
      public static function round(param1:Number, param2:int = 0) : Number
      {
         var _loc3_:Number = Math.pow(10,param2);
         return int(Math.round(param1 * _loc3_)) / _loc3_;
      }
      
      public static function §_-2ww§(param1:Number) : int
      {
         return param1 > 0 ? 1 : (param1 < 0 ? -1 : 0);
      }
      
      public static function §_-8IA§(param1:String, param2:String) : String
      {
         var _loc5_:* = 0;
         var _loc6_:* = 0;
         var _loc8_:String = null;
         var _loc3_:Number = Number(param1);
         var _loc4_:Number = Number(param2);
         var _loc7_:Array = [];
         while(_loc3_ + _loc4_ !== 0)
         {
            _loc5_ = _loc3_ & 0xFF;
            _loc6_ = _loc4_ & 0xFF;
            _loc7_.push(_loc5_ ^ _loc6_);
            _loc3_ = Math.floor(_loc3_ / 256);
            _loc4_ = Math.floor(_loc4_ / 256);
         }
         var _loc9_:String = "";
         var _loc10_:int = int(_loc7_.length - 1);
         while(_loc10_ >= 0)
         {
            _loc8_ = _loc7_[_loc10_].toString(16);
            if(_loc8_.length < 2)
            {
               _loc8_ = "0" + _loc8_;
            }
            _loc9_ += _loc8_;
            _loc10_--;
         }
         return String(parseInt(_loc9_,16));
      }
   }
}

