package §_-6-L§
{
   public class §_-49j§
   {
      public function §_-49j§()
      {
         super();
      }
      
      public static function §_-1LI§(param1:Array) : Array
      {
         var _loc2_:Array = [];
         var _loc3_:int = 0;
         while(_loc3_ < param1.length)
         {
            if(_loc2_.indexOf(param1[_loc3_]) == -1)
            {
               _loc2_.push(param1[_loc3_]);
            }
            _loc3_++;
         }
         return _loc2_;
      }
      
      public static function insert(param1:Array, param2:uint, param3:*) : void
      {
         var _loc4_:uint = param1.length;
         while(_loc4_ > param2)
         {
            param1[_loc4_] = param1[_loc4_ - 1];
            _loc4_--;
         }
         param1[param2] = param3;
      }
      
      public static function merge(param1:Array, param2:Array) : void
      {
         if(param2 == null)
         {
            return;
         }
         if(param1 == null)
         {
            param1 = [];
         }
         var _loc3_:int = 0;
         while(_loc3_ < param2.length)
         {
            param1.push(param2[_loc3_++]);
         }
      }
      
      public static function remove(param1:Array, param2:*) : Boolean
      {
         var _loc3_:int = int(param1.indexOf(param2));
         if(_loc3_ != -1)
         {
            param1.splice(_loc3_,1);
            return true;
         }
         return false;
      }
      
      public static function §_-CdN§(param1:Array) : Array
      {
         var _loc4_:int = 0;
         var _loc2_:Array = param1.slice();
         var _loc3_:Array = [];
         while(_loc2_.length > 0)
         {
            _loc4_ = Math.floor(Math.random() * _loc2_.length);
            _loc3_.unshift(_loc2_[_loc4_]);
            _loc2_.splice(_loc4_,1);
         }
         return _loc3_;
      }
      
      public static function random(param1:Array) : *
      {
         if(param1.length > 0)
         {
            return param1[Math.floor(Math.random() * param1.length)];
         }
         return null;
      }
      
      public static function fill(param1:int, param2:*) : Array
      {
         var _loc3_:Array = [];
         var _loc4_:int = 0;
         while(_loc4_ < param1)
         {
            _loc3_.push(param2);
            _loc4_++;
         }
         return _loc3_;
      }
      
      public static function §_-2rQ§(param1:Array, param2:String, param3:*) : *
      {
         var _loc4_:* = undefined;
         for each(_loc4_ in param1)
         {
            if(_loc4_ is Object && Boolean(Object(_loc4_).hasOwnProperty(param2)) && _loc4_[param2] == param3)
            {
               return _loc4_;
            }
         }
         return null;
      }
      
      public static function §_-BU2§(param1:Array, param2:String, param3:*) : Array
      {
         var _loc5_:* = undefined;
         var _loc4_:Array = [];
         for each(_loc5_ in param1)
         {
            if(_loc5_ is Object && Boolean(Object(_loc5_).hasOwnProperty(param2)) && _loc5_[param2] == param3)
            {
               _loc4_.push(_loc5_);
            }
         }
         return _loc4_;
      }
      
      public static function §_-8hA§(param1:Array, param2:String, param3:*) : Array
      {
         return §_-BU2§(param1,param2,param3);
      }
      
      public static function clone(param1:Array) : Array
      {
         return param1.concat();
      }
      
      public static function unique(param1:Array) : Array
      {
         var _loc3_:* = undefined;
         var _loc2_:Array = [];
         for each(_loc3_ in param1)
         {
            if(_loc2_.indexOf(_loc3_) < 0)
            {
               _loc2_.push(_loc3_);
            }
         }
         return _loc2_;
      }
      
      public static function §_-FR§(param1:Object, param2:Class = null) : Array
      {
         var _loc4_:* = undefined;
         var _loc3_:Array = [];
         for each(_loc4_ in param1)
         {
            _loc3_.push(param2 == null ? _loc4_ : param2(_loc4_));
         }
         return _loc3_;
      }
   }
}

