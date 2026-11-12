package §_-kr§
{
   import §_-0uA§.§_-3YE§;
   import §_-2U3§.ResourceManager;
   import §_-786§.§_-CRy§;
   import §_-A2M§.§_-4Ba§;
   
   public class §_-2NT§
   {
      private static var §_-7iM§:Object = {};
      
      public function §_-2NT§()
      {
         super();
      }
      
      public static function §_-5vY§(param1:String) : §_-4Ba§
      {
         var contentLoader:§_-Ud§;
         var task:§_-4Ba§ = null;
         var library:String = param1;
         if(ResourceManager.§_-7Bo§(library))
         {
            return §_-4Ba§.resolve();
         }
         if(§_-7iM§.hasOwnProperty(library))
         {
            return §_-7iM§[library];
         }
         task = new §_-4Ba§();
         §_-7iM§[library] = task;
         contentLoader = new §_-Ud§([library]);
         contentLoader.addEventListener(§_-CRy§.§_-Sf§,function(param1:§_-CRy§):void
         {
            task.resolve();
            delete §_-7iM§[library];
         });
         contentLoader.addEventListener(§_-CRy§.§_-2qp§,function(param1:§_-CRy§):void
         {
            §_-3YE§.error("Error loading library " + library);
            task.reject();
            delete §_-7iM§[library];
         });
         contentLoader.load();
         return task;
      }
      
      public static function §_-A1N§(param1:String, param2:String) : §_-4Ba§
      {
         var replaceMap:Object;
         var loader:§_-Ud§;
         var cacheKey:String = null;
         var task:§_-4Ba§ = null;
         var sourceLibrary:String = param1;
         var targetLibrary:String = param2;
         if(sourceLibrary == null || sourceLibrary.length == 0 || targetLibrary == null || targetLibrary.length == 0)
         {
            return §_-4Ba§.reject();
         }
         if(ResourceManager.§_-7Bo§(sourceLibrary))
         {
            try
            {
               if(ResourceManager.§_-7Bo§(targetLibrary))
               {
                  ResourceManager.§_-71T§(targetLibrary);
               }
               ResourceManager.§_-0cZ§(targetLibrary,ResourceManager.getADF(sourceLibrary));
               return §_-4Ba§.resolve();
            }
            catch(e:Error)
            {
               return §_-4Ba§.reject();
            }
         }
         else
         {
            cacheKey = sourceLibrary + "->" + targetLibrary;
            if(§_-7iM§.hasOwnProperty(cacheKey))
            {
               return §_-7iM§[cacheKey];
            }
            task = new §_-4Ba§();
            §_-7iM§[cacheKey] = task;
            replaceMap = {};
            replaceMap[sourceLibrary] = targetLibrary;
            loader = new §_-0wT§([sourceLibrary],replaceMap,false);
            loader.addEventListener(§_-CRy§.§_-Sf§,function(param1:§_-CRy§):void
            {
               task.resolve();
               delete §_-7iM§[cacheKey];
            });
            loader.addEventListener(§_-CRy§.§_-2qp§,function(param1:§_-CRy§):void
            {
               §_-3YE§.error("Error loading library " + sourceLibrary + " as " + targetLibrary);
               task.reject();
               delete §_-7iM§[cacheKey];
            });
            loader.load();
            return task;
         }
      }
      
      public static function §_-8wu§(param1:Array) : §_-4Ba§
      {
         var _loc3_:String = null;
         var _loc2_:Array = [];
         for each(_loc3_ in param1)
         {
            _loc2_.push(§_-5vY§(_loc3_));
         }
         return §_-4Ba§.all(_loc2_);
      }
   }
}

