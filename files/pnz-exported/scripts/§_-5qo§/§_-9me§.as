package §_-5qo§
{
   import §_-CLv§.§_-BDF§;
   
   public class §_-9me§ extends §_-5i0§
   {
      private static const §_-4JB§:Object = {
         "sign":1,
         "uid":1,
         "appid":1
      };
      
      private static const §_-30l§:String = "worldwide";
      
      private static const §_-2Ni§:Object = {
         "currency":1,
         "lang":1
      };
      
      public function §_-9me§(param1:§_-BDF§, param2:Object)
      {
         super(param1,param2);
      }
      
      override protected function getParams(param1:Object) : Object
      {
         var _loc3_:String = null;
         var _loc2_:Object = {};
         for(_loc3_ in param1)
         {
            if(_loc3_ in §_-4JB§)
            {
               _loc2_[_loc3_] = param1[_loc3_];
            }
         }
         if(Boolean(param1.hasOwnProperty(§_-30l§)) && param1[§_-30l§] == 1)
         {
            for(_loc3_ in param1)
            {
               if(_loc3_ in §_-2Ni§)
               {
                  _loc2_[_loc3_] = param1[_loc3_];
               }
            }
         }
         return _loc2_;
      }
   }
}

