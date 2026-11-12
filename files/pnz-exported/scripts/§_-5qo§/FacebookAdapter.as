package §_-5qo§
{
   import §_-CLv§.§_-BDF§;
   import flash.external.ExternalInterface;
   
   public class FacebookAdapter extends §_-5i0§
   {
      public function FacebookAdapter(param1:§_-BDF§, param2:Object)
      {
         super(param1,param2);
      }
      
      override protected function getParams(param1:Object) : Object
      {
         var _loc2_:Object = null;
         if(param1.hasOwnProperty("signed_request"))
         {
            return {"signed_request":param1["signed_request"]};
         }
         if(ExternalInterface.available)
         {
            _loc2_ = ExternalInterface.call("FB.getAuthResponse");
            if(_loc2_ != null && Boolean(_loc2_.hasOwnProperty("signedRequest")))
            {
               return {"signed_request":_loc2_.signedRequest};
            }
         }
         throw new ArgumentError("property not found: signed_request");
      }
   }
}

