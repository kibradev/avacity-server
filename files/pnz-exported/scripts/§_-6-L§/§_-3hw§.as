package §_-6-L§
{
   public class §_-3hw§
   {
      public function §_-3hw§()
      {
         super();
      }
      
      public static function §_-3bk§(param1:XML, param2:String) : XMLList
      {
         var _loc6_:String = null;
         var _loc3_:XML = param1;
         var _loc4_:Array = param2.split(".");
         var _loc5_:String = _loc4_[_loc4_.length - 1];
         if(_loc4_.length > 1)
         {
            for each(_loc6_ in _loc4_.slice(0,_loc4_.length - 1))
            {
               _loc3_ = _loc3_.elements(_loc6_)[0];
            }
         }
         if(_loc3_ == null)
         {
            return new XMLList();
         }
         if(_loc5_.length > 0 && _loc5_.charAt(0) == "@")
         {
            return _loc3_[_loc5_];
         }
         return _loc3_.elements(_loc5_);
      }
      
      public static function §_-1s9§(param1:XML, param2:String) : XML
      {
         var _loc3_:XMLList = §_-3bk§(param1,param2);
         if(_loc3_.length() == 0)
         {
            return null;
         }
         return _loc3_[0];
      }
      
      public static function getInt(param1:XML, param2:String, param3:int = 0) : int
      {
         var _loc4_:XML = §_-1s9§(param1,param2);
         if(_loc4_ == null)
         {
            return param3;
         }
         return int(_loc4_);
      }
      
      public static function getNumber(param1:XML, param2:String, param3:Number = 0) : Number
      {
         var _loc4_:XML = §_-1s9§(param1,param2);
         if(_loc4_ == null)
         {
            return param3;
         }
         return Number(_loc4_);
      }
      
      public static function getString(param1:XML, param2:String, param3:String = null) : String
      {
         var _loc4_:XML = §_-1s9§(param1,param2);
         if(_loc4_ == null)
         {
            return param3;
         }
         return String(_loc4_);
      }
      
      public static function getBoolean(param1:XML, param2:String, param3:Boolean = false) : Boolean
      {
         var _loc4_:String = getString(param1,param2);
         if(_loc4_ == null)
         {
            return param3;
         }
         return _loc4_ == "true" || _loc4_ == "1";
      }
      
      public static function getList(param1:XML, param2:String, param3:Array = null, param4:String = ",") : Array
      {
         var _loc5_:String = getString(param1,param2);
         return _loc5_ == null ? param3 : _loc5_.split(param4);
      }
   }
}

