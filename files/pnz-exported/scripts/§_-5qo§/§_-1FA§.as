package §_-5qo§
{
   import §_-CLv§.§_-3zt§;
   import §_-CLv§.§_-BDF§;
   
   public class §_-1FA§ extends §_-5i0§
   {
      public function §_-1FA§(param1:§_-BDF§, param2:Object)
      {
         super(param1,param2);
      }
      
      override protected function getParams(param1:Object) : Object
      {
         return {
            "session_key":§_-3zt§.§_-2iR§("session_key",param1),
            "auth_sig":§_-3zt§.§_-2iR§("auth_sig",param1)
         };
      }
   }
}

