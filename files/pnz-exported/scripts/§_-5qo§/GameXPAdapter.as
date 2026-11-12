package §_-5qo§
{
   import §_-CLv§.§_-BDF§;
   
   public class GameXPAdapter extends §_-5i0§
   {
      private static const §_-4JB§:Object = {"gamexp_sid":1};
      
      public function GameXPAdapter(param1:§_-BDF§, param2:Object)
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
         return _loc2_;
      }
   }
}

