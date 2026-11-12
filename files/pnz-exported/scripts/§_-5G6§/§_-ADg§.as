package §_-5G6§
{
   import §_-Aq0§.§_-Bs9§;
   import §_-GM§.Context;
   import §_-kr§.§_-C1S§;
   import penzville.Config;
   
   public class §_-ADg§
   {
      public function §_-ADg§()
      {
         super();
      }
      
      public static function §_-2dW§(param1:String) : void
      {
         var _loc2_:Object = {
            "url":param1,
            "cdn":§_-C1S§.instance.§_-0MS§
         };
         if(Context.preUserInfo != null)
         {
            _loc2_["id"] = Context.preUserInfo.id;
         }
         send(_loc2_);
      }
      
      public static function §_-fr§(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int) : void
      {
         var _loc8_:Object = {
            "totalItems":param1,
            "cachedItems":param2,
            "downloadedBytes":param3,
            "downloadSpeed":param5,
            "downloadTime":param4,
            "extraTries":param6,
            "mirrorUsed":param7,
            "cdn":§_-C1S§.instance.§_-0MS§
         };
         if(Context.preUserInfo != null)
         {
            _loc8_["id"] = Context.preUserInfo.id;
         }
         send(_loc8_);
      }
      
      public static function §_-9CD§(param1:String, param2:String) : void
      {
         if(!Config.collectStats)
         {
            return;
         }
         var _loc3_:Object = {
            "socialId":param1,
            "reason":param2
         };
         if(Context.preUserInfo != null)
         {
            _loc3_["id"] = Context.preUserInfo.id;
         }
         send(_loc3_);
      }
      
      private static function send(param1:Object) : void
      {
         var _loc2_:§_-Bs9§ = new §_-Bs9§();
         _loc2_.url = Config.statsUrl;
         _loc2_.§_-0fS§(param1);
         _loc2_.send();
      }
   }
}

