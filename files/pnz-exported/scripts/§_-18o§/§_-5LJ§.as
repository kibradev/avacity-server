package §_-18o§
{
   public class §_-5LJ§
   {
      public function §_-5LJ§()
      {
         super();
      }
      
      public static function isEquals(param1:Array, param2:Array) : Boolean
      {
         var _loc3_:int = 0;
         if(param1.length != param2.length)
         {
            return false;
         }
         while(_loc3_ < param1.length)
         {
            if(param1[_loc3_] != param2[_loc3_])
            {
               return false;
            }
            _loc3_++;
         }
         return true;
      }
      
      public static function §_-60E§(param1:String, param2:int, param3:String = ":") : Array
      {
         var _loc5_:String = null;
         var _loc4_:Array = param1.split(param3);
         if(_loc4_.length >= param2)
         {
            _loc5_ = _loc4_.splice(param2 - 1).join(param3);
            _loc4_.push(_loc5_);
         }
         return _loc4_;
      }
      
      public static function §_-5Rs§(param1:Array) : int
      {
         return Math.floor(Math.random() * param1.length);
      }
      
      public static function §_-9kM§(param1:Array) : int
      {
         if(param1.length == 1)
         {
            return int(param1[0]);
         }
         var _loc2_:int = int(param1[0]);
         var _loc3_:int = int(param1[1]);
         return Math.floor(Math.random() * (_loc3_ - _loc2_ + 1)) + _loc2_;
      }
      
      public static function §_-9-U§(param1:Array) : *
      {
         if(param1.length == 0)
         {
            return null;
         }
         return param1[§_-5Rs§(param1)];
      }
   }
}

