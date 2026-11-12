package §_-38V§
{
   public class §_-1F§
   {
      public static const §_-Q4§:String = "_";
      
      public static var §_-CE9§:Object = {};
      
      public function §_-1F§()
      {
         super();
      }
      
      public static function §_-8ga§(param1:String, param2:§_-69x§) : void
      {
         var _loc3_:String = param1 + §_-Q4§ + param2.name;
         §_-CE9§[_loc3_] = param2;
      }
      
      public static function §_-3yS§(param1:String, param2:String) : §_-69x§
      {
         var _loc3_:String = param1 + §_-Q4§ + param2;
         if(§_-CE9§.hasOwnProperty(_loc3_))
         {
            return §_-CE9§[_loc3_];
         }
         return null;
      }
      
      public static function §_-8Y3§(param1:Object, param2:String = null, param3:String = null, param4:Boolean = true) : §_-1bg§
      {
         var _loc5_:§_-1bg§ = new §_-1bg§(param1,param4);
         if(param2 != null && param3 != null)
         {
            _loc5_.play(§_-3yS§(param2,param3));
         }
         return _loc5_;
      }
      
      public static function loadXML(param1:XML) : void
      {
         var _loc2_:XML = null;
         var _loc3_:String = null;
         var _loc4_:XML = null;
         var _loc5_:§_-69x§ = null;
         for each(_loc2_ in param1.elements("animation"))
         {
            _loc3_ = _loc2_["@name"];
            for each(_loc4_ in _loc2_.elements("sequence"))
            {
               _loc5_ = new §_-69x§();
               _loc5_.§_-1f0§(_loc4_);
               §_-8ga§(_loc3_,_loc5_);
            }
         }
      }
   }
}

