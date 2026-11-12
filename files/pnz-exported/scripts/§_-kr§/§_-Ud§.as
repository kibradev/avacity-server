package §_-kr§
{
   import §_-0lt§.SharedLoadingItem;
   import §_-0uA§.§_-3YE§;
   import §_-5Kp§.MD5;
   import §_-6-L§.§_-49j§;
   import §_-6-L§.§_-6aF§;
   import §_-636§.LoadingItem;
   import §_-786§.§_-CRy§;
   import §_-GM§.Context;
   import flash.events.Event;
   import penzville.Config;
   import penzville.§_-5fs§;
   
   public class §_-Ud§ extends §_-24L§
   {
      protected var §_-16t§:Boolean = true;
      
      private var §_-1GL§:§_-81N§;
      
      public function §_-Ud§(param1:Array, param2:Boolean = true)
      {
         this.§_-16t§ = param2;
         super(param1);
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
      
      override protected function invalidateResources(param1:Array) : void
      {
         var _loc2_:String = null;
         var _loc3_:String = null;
         var _loc4_:String = null;
         var _loc5_:String = null;
         for each(_loc2_ in param1)
         {
            if(_loaded.indexOf(_loc2_) < 0)
            {
               _loc3_ = §_-3H9§(_loc2_);
               _loc3_ = §_-925§(_loc3_);
               if(SWFSharedManager.isActive() && SWFSharedManager.canUse() && _loc3_ != null)
               {
                  _loc4_ = §_-BCR§(_loc3_);
                  if(_loc4_ != null && _loc4_ == SWFSharedManager.§_-BCR§(_loc2_))
                  {
                     §_-25-§.push(_loc2_);
                     continue;
                  }
               }
               if(_loc3_ != null)
               {
                  §_-0h-§[_loc2_] = §_-3H9§(_loc2_);
               }
            }
         }
         if(§_-25-§.length > 0)
         {
            this.§_-1GL§ = new §_-81N§();
            this.§_-1GL§.addEventListener(§_-CRy§.§_-Sf§,this.§_-ph§);
            this.§_-1GL§.addEventListener(§_-CRy§.§_-2qp§,this.§_-6GX§);
            for each(_loc5_ in §_-25-§)
            {
               this.§_-1GL§.add(§_-B2E§(_loc5_));
            }
            this.§_-1GL§.load();
         }
      }
      
      override public function destroy() : void
      {
         if(this.§_-1GL§ != null)
         {
            this.§_-1GL§.removeEventListener(§_-CRy§.§_-Sf§,this.§_-ph§);
            this.§_-1GL§.removeEventListener(§_-CRy§.§_-2qp§,this.§_-6GX§);
            this.§_-1GL§.destroy();
         }
         super.destroy();
      }
      
      override protected function logError() : void
      {
         super.logError();
         if(Config.collectStats)
         {
            Context.§_-6xk§.§_-53Q§(§_-XD§.profiler.failedUrl);
         }
      }
      
      override protected function contentLoaded() : void
      {
         var _loc1_:String = null;
         for each(_loc1_ in §_-6aF§.§_-1t1§(§_-0h-§))
         {
            if(this.§_-7zM§(_loc1_) && !this.§_-AwU§(_loc1_))
            {
               dispatchEvent(new §_-CRy§(§_-CRy§.§_-AsY§));
               return;
            }
            registerWebItem(_loc1_);
         }
         if(SWFSharedManager.isActive() && SWFSharedManager.canUse())
         {
            this.§_-33s§();
         }
         dispatchEvent(new §_-CRy§(§_-CRy§.§_-Sf§));
         if(§_-XD§ != null && Config.collectStats)
         {
            if(§_-XD§.profiler != null)
            {
               Context.§_-29d§.§_-6iy§(§_-XD§.profiler.totalItems,§_-XD§.profiler.cachedItems,§_-XD§.profiler.downloadBytes,§_-XD§.profiler.downloadTime,§_-XD§.profiler.downloadSpeed,§_-XD§.profiler.extraTries,§_-XD§.profiler.mirrorUsed);
            }
         }
         this.destroy();
      }
      
      protected function §_-AwU§(param1:String) : Boolean
      {
         var _loc2_:String = MD5.§_-4DV§(§_-XD§.getPack(param1).rawFile.bufData);
         var _loc3_:String = §_-925§(§_-0h-§[param1]);
         var _loc4_:String = §_-5fs§.§_-BCR§(_loc3_);
         §_-3YE§.info("configPackMd5: " + _loc2_ + " | version: " + _loc4_);
         return !Config.validateConfigs || _loc2_ == _loc4_;
      }
      
      protected function §_-7zM§(param1:String) : Boolean
      {
         return param1.indexOf("config") >= 0;
      }
      
      private function §_-33s§() : void
      {
         var _loc1_:String = null;
         var _loc2_:String = null;
         var _loc3_:LoadingItem = null;
         var _loc4_:String = null;
         for each(_loc1_ in §_-6aF§.§_-1t1§(§_-0h-§))
         {
            _loc2_ = §_-0h-§[_loc1_];
            if(_loc2_ != null)
            {
               _loc2_ = §_-925§(_loc2_);
               _loc3_ = §_-XD§.getItem(_loc1_);
               _loc4_ = §_-BCR§(_loc2_);
               if(!(_loc4_ == null || _loc3_ == null))
               {
                  SWFSharedManager.save(_loc1_,_loc4_,_loc3_.data);
               }
            }
         }
      }
      
      private function §_-6GX§(param1:§_-CRy§) : void
      {
         §_-0h-§[param1.loadingItem.id] = §_-3H9§(param1.loadingItem.id);
      }
      
      private function §_-ph§(param1:Event) : void
      {
         var _loc2_:SharedLoadingItem = null;
         for each(_loc2_ in this.§_-1GL§.§_-Bic§)
         {
            registerSharedItem(_loc2_);
         }
         §_-25-§ = [];
         if(§_-6aF§.§_-vN§(§_-0h-§) > 0)
         {
            load();
         }
         else
         {
            this.contentLoaded();
         }
      }
   }
}

