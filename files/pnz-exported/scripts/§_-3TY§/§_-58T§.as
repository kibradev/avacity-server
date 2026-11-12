package §_-3TY§
{
   import §_-9Bv§.§_-8fL§;
   import penzville.*;
   
   public class §_-58T§
   {
      private static var §_-1Qq§:Object = null;
      
      public function §_-58T§()
      {
         super();
      }
      
      public static function get §_-A7i§() : Object
      {
         return §_-6oG§(Config.§_-37U§);
      }
      
      public static function §_-6oG§(param1:String) : Object
      {
         return !!§_-3qX§.hasOwnProperty(param1) ? §_-3qX§[param1] : {};
      }
      
      public static function get §_-3qX§() : Object
      {
         var _loc1_:§_-8fL§ = null;
         var _loc2_:§_-8fL§ = null;
         var _loc3_:String = null;
         var _loc4_:String = null;
         if(§_-1Qq§ == null)
         {
            §_-1Qq§ = {};
            _loc1_ = Config.§_-BR3§;
            if(_loc1_ != null)
            {
               for each(_loc2_ in _loc1_.getList("application"))
               {
                  _loc3_ = _loc2_.getString("name");
                  if(_loc3_ != null)
                  {
                     §_-1Qq§[_loc3_] = {};
                     for each(_loc4_ in _loc2_.getNames())
                     {
                        §_-1Qq§[_loc3_][_loc4_] = _loc2_.getString(_loc4_);
                     }
                  }
               }
            }
         }
         return §_-1Qq§;
      }
   }
}

