package penzville
{
   import flash.net.SharedObject;
   
   public class §_-2Vb§
   {
      private static var §_-3ET§:Object = {};
      
      public function §_-2Vb§()
      {
         super();
      }
      
      public static function init(param1:Object) : void
      {
         §_-3ET§ = param1;
      }
      
      public static function getShared(param1:String) : SharedObject
      {
         if(§_-3ET§.hasOwnProperty("getShared"))
         {
            return §_-3ET§.getShared(param1);
         }
         return SharedObject.getLocal(param1,"/");
      }
   }
}

