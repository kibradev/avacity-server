package §_-9Bv§
{
   import §_-0uA§.§_-3YE§;
   import §_-A2M§.§_-4Ba§;
   import §_-Aq0§.§_-4n-§;
   import §_-Aq0§.§_-9db§;
   import §_-Aq0§.§_-Bs9§;
   import flash.net.URLRequestMethod;
   
   public class §_-4po§
   {
      public function §_-4po§()
      {
         super();
      }
      
      public static function §_-97K§(param1:String) : §_-4Ba§
      {
         var task:§_-4Ba§ = null;
         var url:String = param1;
         task = new §_-4Ba§();
         var request:§_-Bs9§ = new §_-Bs9§(url,{"noCache":Math.floor(Math.random() * 999)},URLRequestMethod.GET);
         request.addEventListener(§_-9db§.COMPLETE,function(param1:§_-9db§):void
         {
            var appConfig:§_-8fL§ = null;
            var xml:XML = null;
            var e:§_-9db§ = param1;
            appConfig = new §_-8fL§();
            try
            {
               xml = new XML(e.data);
            }
            catch(e:Error)
            {
               §_-3YE§.§_-ANW§("Cannot parse appconfig from url: " + url);
               task.reject(e);
               throw e;
            }
            appConfig.§_-7Tc§(xml).then(function():void
            {
               task.resolve(appConfig,url);
            }).error(task.error);
         });
         request.addEventListener(§_-4n-§.HTTP_ERROR,task.reject);
         request.send();
         return task;
      }
   }
}

