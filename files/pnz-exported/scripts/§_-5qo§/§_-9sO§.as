package §_-5qo§
{
   import §_-CLv§.§_-3zt§;
   import §_-CLv§.§_-BDF§;
   
   public class §_-9sO§ extends §_-5i0§
   {
      public function §_-9sO§(param1:§_-BDF§, param2:Object)
      {
         super(param1,param2);
      }
      
      override protected function getParams(param1:Object) : Object
      {
         return {
            "access_token":§_-3zt§.§_-2iR§("auth_token",param1),
            "tgc_id":§_-3zt§.§_-2iR§("tgc_id",param1)
         };
      }
   }
}

