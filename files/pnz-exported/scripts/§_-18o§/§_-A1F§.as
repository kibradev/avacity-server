package §_-18o§
{
   import §_-6-L§.§_-6aF§;
   import §_-BeZ§.§_-1e5§;
   import §_-BeZ§.§_-4Ww§;
   import §_-GM§.Context;
   
   public class §_-A1F§
   {
      public function §_-A1F§()
      {
         super();
      }
      
      public static function §_-26l§(param1:Object, param2:String) : Boolean
      {
         if(param1.hasOwnProperty(param2))
         {
            return true;
         }
         if(Context.instance.§_-AIA§.§_-3OB§)
         {
            return typeof param1[param2] != "undefined";
         }
         return false;
      }
      
      public static function §_-9ru§(param1:§_-4Ww§, param2:Class) : *
      {
         var _loc3_:§_-4Ww§ = new §_-4Ww§();
         _loc3_.§_-6JD§("obj",param1);
         return _loc3_.§_-2jV§("obj",param2);
      }
      
      public static function §_-5I3§(param1:§_-4Ww§, param2:Class) : *
      {
         var _loc3_:§_-4Ww§ = new §_-4Ww§();
         _loc3_.§_-6JD§("obj",param1);
         return _loc3_.getMap("obj",param2);
      }
      
      public static function §_-6UO§(param1:§_-1e5§, param2:Class) : *
      {
         var _loc3_:§_-4Ww§ = new §_-4Ww§();
         _loc3_.§_-6JD§("arr",param1);
         return _loc3_.§_-Bc6§("arr",param2);
      }
      
      public static function isEquals(param1:Object, param2:Object) : Boolean
      {
         var _loc5_:String = null;
         var _loc6_:Object = null;
         var _loc7_:Object = null;
         if(param1 == param2)
         {
            return true;
         }
         if(param1 is §_-Aa6§ && param2 is §_-Aa6§)
         {
            return (param1 as §_-Aa6§).isEquals(param2 as §_-Aa6§);
         }
         var _loc3_:Array = §_-6aF§.§_-1t1§(param1).sort();
         var _loc4_:Array = §_-6aF§.§_-1t1§(param2).sort();
         if(!§_-5LJ§.isEquals(_loc3_,_loc4_))
         {
            return false;
         }
         var _loc8_:int = 0;
         var _loc9_:* = _loc3_;
         for each(_loc5_ in _loc9_)
         {
            _loc6_ = param1[_loc5_];
            _loc7_ = param2[_loc5_];
            if((_loc6_ is Number || _loc6_ is Boolean || _loc6_ is int || _loc6_ is String) && _loc6_ != _loc7_)
            {
               return false;
            }
            return isEquals(_loc6_,_loc7_);
         }
         return true;
      }
      
      public static function isEmpty(param1:Object) : Boolean
      {
         return §_-6aF§.§_-vN§(param1) == 0;
      }
      
      public static function §_-6yZ§(param1:Object, param2:String, param3:*) : *
      {
         if(param1 == null || isEmpty(param1))
         {
            return param3;
         }
         return §_-26l§(param1,param2) ? param1[param2] : param3;
      }
      
      public static function getClass(param1:Object) : Class
      {
         return param1.constructor as Class;
      }
      
      public static function §_-8dX§(param1:Object) : Object
      {
         var _loc3_:String = null;
         if(param1 is String || param1 is int || param1 is uint || param1 is Number)
         {
            return param1;
         }
         var _loc2_:Object = param1 is Array ? [] : {};
         for(_loc3_ in param1)
         {
            _loc2_[_loc3_] = §_-8dX§(param1[_loc3_]);
         }
         return _loc2_;
      }
   }
}

