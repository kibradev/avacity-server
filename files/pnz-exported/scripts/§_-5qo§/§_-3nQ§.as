package §_-5qo§
{
   import §_-CLv§.§_-BDF§;
   
   public class §_-3nQ§ extends §_-5i0§
   {
      public function §_-3nQ§(param1:§_-BDF§, param2:Object)
      {
         super(param1,param2);
      }
      
      override protected function getParams(param1:Object) : Object
      {
         var _loc2_:String = null;
         if(param1.hasOwnProperty("appToken"))
         {
            _loc2_ = param1["appToken"];
         }
         else
         {
            if(!param1.hasOwnProperty("apptoken"))
            {
               throw new ArgumentError("property not found: appToken");
            }
            _loc2_ = param1["apptoken"];
         }
         return {"appToken":_loc2_};
      }
   }
}

