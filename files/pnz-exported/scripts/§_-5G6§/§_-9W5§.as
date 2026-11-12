package §_-5G6§
{
   import §_-0uA§.§_-COU§;
   import flash.external.ExternalInterface;
   
   public class §_-9W5§ implements §_-COU§
   {
      private static const §_-0I3§:String = "TGC.log";
      
      public function §_-9W5§()
      {
         super();
      }
      
      public static function §_-3I7§() : Boolean
      {
         if(!ExternalInterface.available)
         {
            return false;
         }
         var _loc1_:String = ExternalInterface.call("function() { return typeof " + §_-0I3§ + ";}");
         if(_loc1_ == "function")
         {
            return true;
         }
         return false;
      }
      
      public function write(param1:String, param2:uint, param3:String) : void
      {
         var _loc4_:String = null;
         if(ExternalInterface.available)
         {
            _loc4_ = param1;
            if(param3)
            {
               _loc4_ += "[" + param3 + "] ";
            }
            ExternalInterface.call(§_-0I3§,param2,_loc4_);
         }
      }
   }
}

