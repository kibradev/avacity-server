package §_-CNP§
{
   import §_-0uA§.§_-3YE§;
   import §_-1t9§.§_-96c§;
   import §_-6BB§.§_-2qC§;
   import flash.utils.getDefinitionByName;
   
   public class §_-8yw§ extends §_-9sO§
   {
      private var §_-8yu§:Class;
      
      public function §_-8yw§(param1:§_-2qC§)
      {
         super(param1);
      }
      
      private static function §_-C7I§() : Class
      {
         var wrapperParams:Class = null;
         try
         {
            wrapperParams = getDefinitionByName("container.WrapperParams") as Class;
         }
         catch(e:Error)
         {
            return null;
         }
         return wrapperParams;
      }
      
      override protected function callTGCShowPaymentBox(param1:Object) : void
      {
         var _loc2_:Class = §_-C7I§();
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:Function = _loc2_["openBillingFunction"];
         if(_loc3_ == null)
         {
            return;
         }
         _loc3_(param1,§_-1Tv§[§_-07P§],§_-2Ue§[§_-07P§]);
      }
      
      override public function publishSocialMedia(param1:§_-96c§, param2:Function, param3:Function) : void
      {
         var _loc4_:Class = null;
         var _loc5_:Function = null;
         if(param1.type == §_-96c§.§_-0B0§)
         {
            _loc4_ = §_-C7I§();
            if(_loc4_ == null)
            {
               param3(new Error("Cannot find container.WrapperParams class"));
               return;
            }
            _loc5_ = _loc4_["shareImageFunction"];
            if(_loc5_ == null)
            {
               param3(new Error("shareImageFunction not found in container.WrapperParams"));
               return;
            }
            _loc5_(param1.photo);
            param2();
            return;
         }
         super.publishSocialMedia(param1,param2,param3);
      }
      
      override protected function callExternalGetAuthParams() : void
      {
         var _loc1_:Class = §_-C7I§();
         if(_loc1_ == null)
         {
            §_-3YE§.log("TGCMobileAdapter: Cannot find container.WrapperParams class!");
            onGetAuthParams({
               "accessToken":§_-0hp§,
               "accessExpiresIn":§_-4hj§
            });
            return;
         }
         var _loc2_:Function = _loc1_["tgcGetAuthParams"];
         if(_loc2_ == null)
         {
            §_-3YE§.log("TGCMobileAdapter: Cannot call tgcGetAuthParams function.");
            onGetAuthParams({
               "accessToken":§_-0hp§,
               "accessExpiresIn":§_-4hj§
            });
            return;
         }
         _loc2_(onGetAuthParams);
      }
   }
}

