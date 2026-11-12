package penzville
{
   import §_-kr§.§_-C1S§;
   
   public class §_-5fs§
   {
      private static var §_-5A5§:Object = {};
      
      public function §_-5fs§()
      {
         super();
      }
      
      public static function init(param1:Object) : void
      {
         §_-5A5§ = param1;
      }
      
      public static function §_-BCR§(param1:String) : String
      {
         if(param1 == null)
         {
            return null;
         }
         var _loc2_:Array = param1.split("?");
         var _loc3_:String = _loc2_.length == 2 ? _loc2_[0] : param1;
         return !!§_-5A5§.hasOwnProperty(_loc3_) ? §_-5A5§[_loc3_] : null;
      }
      
      public static function §_-61M§(param1:String) : String
      {
         var _loc2_:String = §_-BCR§(param1);
         if(_loc2_ == null || §_-C1S§.instance.§_-9MO§.ignoreVersions)
         {
            return param1;
         }
         var _loc3_:Array = param1.split(".");
         return _loc3_[0] + "_" + _loc2_ + "." + _loc3_[1];
      }
   }
}

