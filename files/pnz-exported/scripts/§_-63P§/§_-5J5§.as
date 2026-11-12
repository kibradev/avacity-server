package §_-63P§
{
   import §_-6-L§.§_-3hw§;
   
   public class §_-5J5§
   {
      public function §_-5J5§()
      {
         super();
      }
      
      public static function §_-4yD§(param1:XML, param2:String = null, param3:Object = null) : Object
      {
         var _loc5_:XML = null;
         if(param2 != null)
         {
            param1 = §_-3hw§.§_-1s9§(param1,param2);
         }
         if(param1 == null)
         {
            return param3;
         }
         var _loc4_:Object = {};
         for each(_loc5_ in param1.attributes())
         {
            _loc4_[_loc5_.name().toString()] = _loc5_.toString();
         }
         return _loc4_;
      }
   }
}

