package §_-7lY§
{
   import §_-0fi§.§_-6f3§;
   import §_-0uA§.§_-3YE§;
   import §_-2U3§.ResourceManager;
   import §_-5G6§.§_-ADg§;
   import §_-636§.XMLLoadingItem;
   import §_-636§.ZipLoadingItem;
   import §_-6E4§.§_-4-q§;
   import §_-786§.§_-CRy§;
   import §_-A2M§.§_-4Ba§;
   import §_-CLa§.§_-8hC§;
   import §_-GM§.Context;
   import §_-GM§.§_-5qn§;
   import §_-Xm§.MassLoader;
   import §_-Xm§.§_-5h9§;
   import §_-kr§.§_-8He§;
   import §_-kr§.§_-C1S§;
   import flash.events.ErrorEvent;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import penzville.Config;
   
   public class §_-3pq§ extends EventDispatcher
   {
      private static var §_-Vu§:Object = {};
      
      private var §_-XD§:MassLoader;
      
      private var §_-0h-§:Object;
      
      private var §_-5s-§:Object;
      
      private var §_-7b9§:Array;
      
      public function §_-3pq§(param1:Array)
      {
         var _loc5_:§_-6f3§ = null;
         this.§_-0h-§ = {};
         this.§_-5s-§ = {};
         this.§_-7b9§ = [];
         super();
         this.§_-0h-§ = {};
         this.§_-5s-§ = {};
         var _loc2_:§_-8He§ = §_-C1S§.instance.§_-9MO§;
         var _loc3_:String = _loc2_.furnitureUrl;
         var _loc4_:String = _loc2_.furnitureMirrorUrl;
         for each(_loc5_ in param1)
         {
            this.§_-7b9§.push(_loc5_.typeId);
            if(!§_-5qn§.furnitureList.hasOwnProperty(_loc5_.typeId))
            {
               this.§_-0h-§[_loc5_.typeId] = _loc3_ + _loc5_.filePath;
               if(_loc4_ != null)
               {
                  this.§_-5s-§[_loc5_.typeId] = _loc4_ + _loc5_.filePath;
               }
            }
         }
      }
      
      public static function §_-8Tr§(param1:String) : §_-4Ba§
      {
         var itemType:§_-6f3§;
         var removeListeners:Function;
         var task:§_-4Ba§ = null;
         var loader:§_-3pq§ = null;
         var onLoadedFunc:Function = null;
         var onErrorFunc:Function = null;
         var itemTypeId:String = param1;
         if(§_-5qn§.furnitureList.hasOwnProperty(itemTypeId))
         {
            return §_-4Ba§.resolve(§_-5qn§.furnitureList[itemTypeId]);
         }
         if(§_-Vu§.hasOwnProperty(itemTypeId))
         {
            return §_-Vu§[itemTypeId];
         }
         task = new §_-4Ba§();
         §_-Vu§[itemTypeId] = task;
         itemType = Context.§_-70S§.§_-0ZU§().findTypeById(itemTypeId) as §_-6f3§;
         loader = new §_-3pq§([itemType]);
         removeListeners = function():void
         {
            loader.removeEventListener(§_-CRy§.§_-2qp§,onErrorFunc);
            loader.removeEventListener(§_-CRy§.§_-Sf§,onLoadedFunc);
            loader.destroy();
            delete §_-Vu§[itemTypeId];
         };
         onErrorFunc = function(param1:Event):void
         {
            removeListeners();
            task.reject(param1);
         };
         onLoadedFunc = function(param1:Event):void
         {
            removeListeners();
            task.resolve(§_-5qn§.furnitureList[itemTypeId]);
         };
         loader.addEventListener(§_-CRy§.§_-2qp§,onErrorFunc);
         loader.addEventListener(§_-CRy§.§_-Sf§,onLoadedFunc);
         loader.load();
         return task;
      }
      
      public function load() : void
      {
         var _loc1_:String = null;
         if(Context.instance.wrapperCache.isActive())
         {
            this.§_-XD§ = new MassLoader("",1,1,{
               "movieclip":§_-4-q§,
               "xml":XMLLoadingItem,
               "zip":ZipLoadingItem
            });
         }
         else
         {
            this.§_-XD§ = new MassLoader("",1,1);
         }
         this.§_-XD§.profiler = new §_-8hC§();
         for(_loc1_ in this.§_-0h-§)
         {
            this.§_-XD§.add(this.§_-0h-§[_loc1_],{
               "id":_loc1_,
               "type":"movieclip",
               "convert":true,
               "useCache":Config.production
            });
            if(this.§_-5s-§.hasOwnProperty(_loc1_))
            {
               this.§_-XD§.§_-5jD§(this.§_-5s-§[_loc1_],{
                  "id":_loc1_,
                  "type":"movieclip",
                  "convert":true,
                  "useCache":Config.production
               });
            }
         }
         if(this.§_-XD§.§_-4qP§ > 0)
         {
            this.§_-XD§.addEventListener(§_-5h9§.COMPLETE,this.onLoadingComplete);
            this.§_-XD§.addEventListener(§_-5h9§.PROGRESS,this.§_-2tZ§);
            this.§_-XD§.addEventListener(ErrorEvent.ERROR,this.onError);
            this.§_-XD§.start();
         }
         else
         {
            dispatchEvent(new §_-CRy§(§_-CRy§.§_-Sf§));
            this.destroy();
         }
      }
      
      private function onError(param1:ErrorEvent) : void
      {
         param1.stopPropagation();
         §_-3YE§.error("Ошибка загрузки! Пожалуйста обновите страницу!");
         if(Config.collectStats)
         {
            Context.§_-6xk§.§_-53Q§(this.§_-XD§.profiler.failedUrl);
         }
         dispatchEvent(new §_-CRy§(§_-CRy§.§_-2qp§));
         §_-ADg§.§_-9CD§(Context.§_-2BT§.adapter.userId,"Loading furniture error");
      }
      
      private function §_-2tZ§(param1:§_-5h9§) : void
      {
         dispatchEvent(new §_-CRy§(§_-CRy§.§_-BhX§,param1.§_-97§));
      }
      
      private function onLoadingComplete(param1:§_-5h9§) : void
      {
         var _loc2_:String = null;
         for(_loc2_ in this.§_-0h-§)
         {
            ResourceManager.§_-0cZ§(_loc2_,this.§_-XD§.getADF(_loc2_));
            §_-5qn§.§_-36r§(_loc2_,this.§_-XD§.getADF(_loc2_),this.§_-7b9§);
         }
         dispatchEvent(new §_-CRy§(§_-CRy§.§_-Sf§));
         if(Config.collectStats)
         {
            if(this.§_-XD§ != null && this.§_-XD§.profiler != null)
            {
               Context.§_-29d§.§_-9QB§(this.§_-XD§.profiler.totalItems,this.§_-XD§.profiler.cachedItems,this.§_-XD§.profiler.downloadBytes,this.§_-XD§.profiler.downloadTime,this.§_-XD§.profiler.downloadSpeed,this.§_-XD§.profiler.extraTries,this.§_-XD§.profiler.mirrorUsed);
            }
         }
         this.destroy();
      }
      
      public function destroy() : void
      {
         this.§_-0h-§ = null;
         this.§_-5s-§ = null;
         if(this.§_-XD§ != null)
         {
            this.§_-XD§.removeEventListener(§_-5h9§.COMPLETE,this.onLoadingComplete);
            this.§_-XD§.removeEventListener(§_-5h9§.PROGRESS,this.§_-2tZ§);
            this.§_-XD§.removeEventListener(ErrorEvent.ERROR,this.onError);
            this.§_-XD§.destroy();
         }
         this.§_-XD§ = null;
      }
   }
}

