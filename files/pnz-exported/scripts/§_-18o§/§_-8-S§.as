package §_-18o§
{
   import §_-1sb§.§_-7A5§;
   
   public class §_-8-S§
   {
      public static const §_-5ss§:int = 1;
      
      public static const §_-2KP§:int = 2;
      
      public static const §_-1wS§:int = 4;
      
      public static const §_-4Gs§:int = 8;
      
      public static const §_-27o§:int = 14;
      
      public static const §_-4PC§:int = 86400;
      
      public static const §_-5WV§:int = 31556926;
      
      public static const SECONDS_IN_HOUR:int = 3600;
      
      public static const §_-8ON§:int = 60;
      
      public static const §_-8z8§:int = 604800;
      
      public static const §_-0hU§:int = 1000;
      
      public function §_-8-S§()
      {
         super();
      }
      
      public static function §_-0Yh§(param1:uint) : String
      {
         if(param1 < 10)
         {
            return "0" + param1;
         }
         return String(param1);
      }
      
      public static function §_-1YU§(param1:Date) : void
      {
         param1.setHours(0,0,0,0);
      }
      
      public static function §_-9zq§() : int
      {
         return Math.floor(new Date().getTime() / 1000);
      }
      
      public static function §_-8Ya§(param1:int = 0, param2:int = 0) : int
      {
         var _loc3_:Date = param1 > 0 ? new Date(param1 * 1000) : new Date();
         if(param2 == 0)
         {
            param2 = _loc3_.getTimezoneOffset() * 60;
         }
         _loc3_.setUTCHours(0);
         _loc3_.setUTCMinutes(0);
         _loc3_.setUTCSeconds(0);
         return Math.floor(_loc3_.getTime() / 1000) + param2;
      }
      
      public static function §_-8Kq§(param1:int = 0, param2:int = 0) : int
      {
         return §_-8Ya§(param1,param2) + §_-4PC§;
      }
      
      public static function §_-9sv§(param1:int = 0, param2:int = 0) : int
      {
         var _loc3_:Date = param1 > 0 ? new Date(param1 * 1000) : new Date();
         if(param2 == 0)
         {
            param2 = _loc3_.getTimezoneOffset() * 60;
         }
         var _loc4_:Date = new Date(new Date().getUTCFullYear(),0,0);
         _loc4_.setTime(_loc4_.getTime() / 1000 + param2);
         var _loc5_:int = (_loc3_.getTime() - _loc4_.getTime()) / 1000;
         return Math.floor(_loc5_ / §_-4PC§);
      }
      
      public static function §_-AyF§(param1:int, param2:Boolean = false) : String
      {
         if(param1 == 0)
         {
            return "";
         }
         var _loc3_:Date = new Date();
         _loc3_.setTime(param1 * 1000);
         var _loc4_:String = §_-0Yh§(_loc3_.date) + "." + §_-0Yh§(_loc3_.month + 1) + "." + §_-0Yh§(_loc3_.fullYear);
         if(param2)
         {
            _loc4_ += "  " + §_-0Yh§(_loc3_.hours) + "." + §_-0Yh§(_loc3_.minutes) + "." + §_-0Yh§(_loc3_.seconds);
         }
         return _loc4_;
      }
      
      public static function §_-2Xf§(param1:Number, param2:Boolean = false, param3:Boolean = false) : String
      {
         var _loc4_:Number = Math.round(param1 / 1000);
         var _loc5_:Number = 0;
         if(param3)
         {
            _loc5_ = Math.floor(_loc4_ / 60 / 60 / 24);
         }
         var _loc6_:Number = Math.floor((_loc4_ - _loc5_ * 24 * 60 * 60) / 60 / 60);
         var _loc7_:Number = Math.floor((_loc4_ - _loc6_ * 60 * 60 - _loc5_ * 24 * 60 * 60) / 60);
         _loc4_ = Math.floor(_loc4_ - _loc7_ * 60 - _loc6_ * 60 * 60 - _loc5_ * 24 * 60 * 60);
         var _loc8_:String = _loc5_ > 0 ? §_-7A5§.§_-3OT§().message("timeD",{"days":_loc5_}) + " " : "";
         if(param2)
         {
            _loc8_ += _loc6_ + ":" + §_-0Yh§(_loc7_) + ":" + §_-0Yh§(_loc4_);
         }
         else
         {
            _loc8_ += §_-7A5§.§_-3OT§().message("timeH",{"hours":_loc6_}) + " " + §_-7A5§.§_-3OT§().message("timeM",{"minutes":§_-0Yh§(_loc7_)});
         }
         return _loc8_;
      }
      
      public static function getLeftTimeAsString2(param1:Number, param2:int = 14, param3:Boolean = false, param4:Boolean = false) : String
      {
         var _loc17_:Array = null;
         var _loc5_:Number = Math.floor(param1 / 1000);
         var _loc6_:Number = Math.floor(_loc5_ / 60);
         var _loc7_:Number = Math.floor(_loc6_ / 60);
         var _loc8_:Number = Math.floor(_loc7_ / 24);
         var _loc9_:String = "";
         var _loc10_:Number = _loc7_;
         var _loc11_:Number = _loc6_;
         var _loc12_:Number = _loc5_;
         var _loc13_:* = (param2 & §_-4Gs§) > 0;
         var _loc14_:* = (param2 & §_-1wS§) > 0;
         var _loc15_:* = (param2 & §_-2KP§) > 0;
         var _loc16_:* = (param2 & §_-5ss§) > 0;
         if(_loc13_)
         {
            _loc10_ -= _loc8_ * 24;
            _loc11_ -= _loc8_ * 24 * 60;
            _loc12_ -= _loc8_ * 24 * 60 * 60;
         }
         if(_loc14_)
         {
            _loc11_ -= _loc10_ * 60;
            _loc12_ -= _loc10_ * 60 * 60;
         }
         if(_loc15_)
         {
            _loc12_ -= _loc11_ * 60;
         }
         if(param3)
         {
            _loc17_ = [];
            if(_loc13_ && _loc8_ > 0 || param4)
            {
               _loc17_.push(§_-0Yh§(_loc8_));
            }
            if(_loc14_ && _loc10_ > 0 || param4)
            {
               _loc17_.push(§_-0Yh§(_loc10_));
            }
            if(_loc15_)
            {
               _loc17_.push(§_-0Yh§(_loc11_));
            }
            if(_loc16_)
            {
               _loc17_.push(§_-0Yh§(_loc12_));
            }
            _loc9_ += _loc17_.join(":");
         }
         else
         {
            if(_loc13_ && _loc8_ > 0)
            {
               _loc9_ += §_-7A5§.§_-3OT§().message("timeD",{"days":_loc8_}) + " ";
            }
            if(_loc14_ && _loc10_ > 0)
            {
               _loc9_ += §_-7A5§.§_-3OT§().message("timeH",{"hours":_loc10_}) + " ";
            }
            if(_loc15_ && _loc11_ > 0)
            {
               _loc9_ += §_-7A5§.§_-3OT§().message("timeM",{"minutes":_loc11_}) + " ";
            }
            if(_loc16_)
            {
               _loc9_ += §_-7A5§.§_-3OT§().message("timeS",{"seconds":_loc12_});
            }
         }
         return _loc9_;
      }
      
      public static function §_-3EH§(param1:int) : String
      {
         var _loc2_:Date = new Date();
         _loc2_.setHours(0,0,0,0);
         var _loc3_:Date = new Date();
         _loc3_.setTime(param1 * 1000);
         var _loc4_:String = §_-0Yh§(_loc3_.getHours()) + ":" + §_-0Yh§(_loc3_.getMinutes());
         _loc3_.setHours(0,0,0,0);
         var _loc5_:int = Math.floor(_loc2_.getTime() / 1000) - Math.floor(_loc3_.getTime() / 1000);
         if(_loc5_ < 0)
         {
            return "";
         }
         var _loc6_:String = "";
         if(_loc5_ < 86400)
         {
            _loc6_ += §_-7A5§.§_-3OT§().message("today");
         }
         else if(_loc5_ < 86400 * 2)
         {
            _loc6_ += §_-7A5§.§_-3OT§().message("yesterday");
         }
         else
         {
            _loc6_ += _loc3_.getDate() + " " + §_-7A5§.§_-3OT§().message("month" + (_loc3_.getMonth() + 1));
         }
         return _loc6_ + (" " + §_-7A5§.§_-3OT§().message("inTime",{"time":_loc4_}));
      }
      
      public static function §_-r§(param1:int) : Boolean
      {
         return §_-8Ya§(param1) == §_-8Ya§();
      }
      
      public static function §_-BY5§(param1:String) : int
      {
         var _loc7_:String = null;
         var _loc8_:int = 0;
         if(param1 == null)
         {
            return 0;
         }
         var _loc2_:int = 0;
         var _loc3_:Array = param1.split(".");
         if(_loc3_.length > 1)
         {
            _loc2_ += parseInt(_loc3_[1]);
         }
         var _loc4_:Array = _loc3_[0].split(":");
         var _loc5_:int = 1000;
         var _loc6_:int = int(_loc4_.length - 1);
         while(_loc6_ >= 0)
         {
            _loc7_ = _loc4_[_loc6_];
            if(_loc7_.length > 0)
            {
               _loc8_ = parseInt(_loc7_);
               _loc2_ += _loc8_ * _loc5_;
            }
            _loc5_ *= 60;
            _loc6_--;
         }
         return _loc2_;
      }
   }
}

