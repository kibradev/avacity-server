package §_-kr§
{
   import §_-0lt§.SWFSharedLoadingItem;
   import §_-0lt§.SharedLoadingItem;
   import §_-0lt§.ZipSharedLoadingItem;
   import §_-0uA§.§_-3YE§;
   import §_-2U3§.ResourceManager;
   import §_-6-L§.§_-49j§;
   import §_-6-L§.§_-7uH§;
   import §_-636§.SWFLoadingItem;
   import §_-636§.XMLLoadingItem;
   import §_-636§.ZipLoadingItem;
   import §_-6E4§.§_-4-q§;
   import §_-6E4§.§_-5Yh§;
   import §_-786§.§_-CRy§;
   import §_-7xl§.§_-7VJ§;
   import §_-CLa§.§_-8hC§;
   import §_-GM§.Context;
   import §_-GM§.§_-5qn§;
   import §_-Xm§.MassLoader;
   import §_-Xm§.§_-5h9§;
   import flash.events.ErrorEvent;
   import flash.events.EventDispatcher;
   import flash.events.IOErrorEvent;
   import penzville.Config;
   import penzville.§_-5fs§;
   
   public class §_-24L§ extends EventDispatcher
   {
      protected static var _loaded:Array = [];
      
      protected var §_-XD§:MassLoader;
      
      protected var §_-0h-§:Object = {};
      
      protected var §_-25-§:Array = [];
      
      public function §_-24L§(param1:Array)
      {
         super();
         this.§_-0h-§ = {};
         this.invalidateResources(param1);
      }
      
      private static function §_-1HT§(param1:String) : String
      {
         param1 = §_-925§(param1);
         return §_-5fs§.§_-61M§(param1);
      }
      
      protected static function §_-925§(param1:String) : String
      {
         if(param1 == null)
         {
            return null;
         }
         if(param1.indexOf(":lang:") >= 0)
         {
            param1 = param1.replace(":lang:",Config.locale);
         }
         if(param1.indexOf(":conf:") >= 0)
         {
            param1 = param1.replace(":conf:",Config.configPrefix);
         }
         if(param1.indexOf(":fmt:") >= 0)
         {
            param1 = param1.replace(/:fmt:/g,Config.resourceFormat);
         }
         return param1;
      }
      
      public static function §_-7ZO§(param1:String) : Boolean
      {
         var _loc2_:int = int(_loaded.indexOf(param1));
         if(_loc2_ < 0)
         {
            return true;
         }
         return §_-49j§.remove(_loaded,param1);
      }
      
      protected function invalidateResources(param1:Array) : void
      {
         var _loc2_:String = null;
         var _loc3_:String = null;
         for each(_loc2_ in param1)
         {
            if(_loaded.indexOf(_loc2_) < 0)
            {
               _loc3_ = this.§_-3H9§(_loc2_);
               if(_loc3_ != null)
               {
                  this.§_-0h-§[_loc2_] = _loc3_;
               }
            }
         }
      }
      
      protected function §_-3H9§(param1:String) : String
      {
         if(Config.§_-98c§.indexOf(param1) >= 0)
         {
            return Config.resourceFormat + "/clothes/" + §_-7uH§.§_-118§(param1) + "." + Config.resourceFormat;
         }
         if(Config.§_-10j§.indexOf(param1) >= 0)
         {
            return Config.resourceFormat + "/petClothes/" + §_-7uH§.§_-118§(param1) + "." + Config.resourceFormat;
         }
         if(Config.§_-8s5§.indexOf(param1) >= 0)
         {
            return Config.resourceFormat + "/appearance/" + §_-7uH§.§_-118§(param1) + "." + Config.resourceFormat;
         }
         var _loc2_:Object = Config.§_-4z0§;
         return _loc2_ != null && Boolean(_loc2_.hasOwnProperty(param1)) ? _loc2_[param1] : null;
      }
      
      protected function §_-BCR§(param1:String) : String
      {
         var _loc2_:String = §_-5fs§.§_-BCR§(param1);
         if(_loc2_ != null)
         {
            return _loc2_;
         }
         if(param1 == null)
         {
            return null;
         }
         var _loc3_:Array = param1.split("?");
         if(_loc3_.length <= 1)
         {
            return null;
         }
         _loc2_ = _loc3_[1].split("&")[0];
         if(_loc2_ == null || _loc2_ == "")
         {
            return null;
         }
         return _loc2_;
      }
      
      public function load() : void
      {
         var _loc4_:String = null;
         var _loc5_:Object = null;
         if(this.§_-25-§.length > 0)
         {
            return;
         }
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
            _loc5_ = {
               "movieclip":SWFLoadingItem,
               "xml":XMLLoadingItem,
               "zip":§_-5Yh§
            };
            this.§_-XD§ = new MassLoader("",1,1,_loc5_);
         }
         this.§_-XD§.profiler = new §_-8hC§();
         var _loc1_:§_-8He§ = §_-C1S§.instance.§_-9MO§;
         var _loc2_:String = null;
         var _loc3_:String = null;
         for(_loc4_ in this.§_-0h-§)
         {
            _loc2_ = (String(this.§_-0h-§[_loc4_]).indexOf("://") >= 0 ? "" : _loc1_.contentUrl) + §_-1HT§(this.§_-0h-§[_loc4_]);
            _loc3_ = (String(this.§_-0h-§[_loc4_]).indexOf("://") >= 0 ? "" : _loc1_.contentMirrorUrl) + §_-1HT§(this.§_-0h-§[_loc4_]);
            this.§_-XD§.add(_loc2_,this.§_-B2E§(_loc4_,MassLoader));
            this.§_-XD§.§_-5jD§(_loc3_,this.§_-B2E§(_loc4_,MassLoader));
         }
         if(this.§_-XD§.§_-4qP§ > 0)
         {
            this.§_-XD§.addEventListener(§_-5h9§.COMPLETE,this.onLoadingComplete);
            this.§_-XD§.addEventListener(§_-5h9§.PROGRESS,this.§_-1oZ§);
            this.§_-XD§.addEventListener(ErrorEvent.ERROR,this.onError);
            this.§_-XD§.addEventListener(IOErrorEvent.IO_ERROR,this.onError);
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
         this.logError();
         dispatchEvent(new §_-CRy§(§_-CRy§.§_-2qp§,0,null,param1.text));
      }
      
      protected function logError() : void
      {
         try
         {
            §_-3YE§.error("Ошибка загрузки! Пожалуйста обновите страницу!");
         }
         catch(error:Error)
         {
         }
      }
      
      private function §_-1oZ§(param1:§_-5h9§) : void
      {
         dispatchEvent(new §_-CRy§(§_-CRy§.§_-BhX§,param1.§_-97§));
      }
      
      private function onLoadingComplete(param1:§_-5h9§) : void
      {
         this.contentLoaded();
      }
      
      protected function contentLoaded() : void
      {
         dispatchEvent(new §_-CRy§(§_-CRy§.§_-Sf§));
         this.destroy();
      }
      
      protected function §_-B2E§(param1:String, param2:Class = null) : Object
      {
         var _loc3_:Object = {};
         _loc3_["id"] = param1;
         if(param1.indexOf("config") >= 0)
         {
            _loc3_["type"] = "zip";
         }
         else
         {
            _loc3_["type"] = "movieclip";
         }
         if(param2 == MassLoader)
         {
            _loc3_["convert"] = true;
            _loc3_["useCache"] = Config.production;
         }
         return _loc3_;
      }
      
      protected function registerWebItem(param1:String) : void
      {
         if(param1.indexOf("config") >= 0)
         {
            §_-5qn§.§_-7vq§(param1,this.§_-XD§.getPack(param1));
         }
         else
         {
            ResourceManager.§_-0cZ§(param1,this.§_-XD§.getADF(param1));
         }
         _loaded.push(param1);
      }
      
      protected function registerSharedItem(param1:SharedLoadingItem) : void
      {
         var _loc2_:§_-7VJ§ = null;
         if(param1 is SWFSharedLoadingItem)
         {
            _loc2_ = new §_-7VJ§(param1.§_-52d§.applicationDomain,param1.id);
            ResourceManager.§_-0cZ§(param1.id,_loc2_);
         }
         if(param1 is ZipSharedLoadingItem)
         {
            §_-5qn§.§_-7vq§(param1.id,(param1 as ZipSharedLoadingItem).pack);
         }
         _loaded.push(param1.id);
      }
      
      public function destroy() : void
      {
         this.§_-0h-§ = null;
         if(this.§_-XD§ != null)
         {
            this.§_-XD§.removeEventListener(§_-5h9§.COMPLETE,this.onLoadingComplete);
            this.§_-XD§.removeEventListener(§_-5h9§.PROGRESS,this.§_-1oZ§);
            this.§_-XD§.removeEventListener(ErrorEvent.ERROR,this.onError);
            this.§_-XD§.destroy();
         }
         this.§_-XD§ = null;
      }
   }
}

