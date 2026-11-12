package §_-0Fe§
{
   import §_-0uA§.§_-3YE§;
   import §_-18o§.§_-8-S§;
   import §_-1iV§.§_-BkM§;
   import §_-6nL§.§_-3Zl§;
   import §_-6nL§.§_-6O§;
   import §_-GM§.Context;
   import flash.events.Event;
   import flash.net.URLLoader;
   import flash.net.URLRequest;
   
   public class §_-5el§ implements §_-3Zl§
   {
      private static const §_-4Dx§:int = 300;
      
      private var §_-30m§:§_-1-S§;
      
      private var _lastShowBannerTime:int;
      
      public function §_-5el§()
      {
         super();
      }
      
      public function init() : void
      {
      }
      
      public function §_-4oB§(param1:Function, param2:Function) : void
      {
         var successCallback:Function = param1;
         var errorCallback:Function = param2;
         if(§_-8-S§.§_-9zq§() - §_-4Dx§ < this._lastShowBannerTime)
         {
            return;
         }
         try
         {
            this.§_-BAO§();
            this.§_-30m§ = new §_-1-S§(§_-BkM§.§_-n1§());
            this.§_-30m§.addEventListener(§_-AWR§.§_-Jy§,this.§_-CHP§);
            this.§_-30m§.addEventListener(§_-AWR§.§_-9Lk§,this.§_-4nr§);
            this.§_-30m§.addEventListener(§_-AWR§.ERROR,this.onError);
            new URLLoader().load(new URLRequest("//js.appscentrum.com/s?app_id=" + Context.§_-2BT§.appId + "&user_id=" + Context.§_-2BT§.adapter.userId));
            if(successCallback != null)
            {
               successCallback();
            }
         }
         catch(e:Error)
         {
            §_-3YE§.error(e.getStackTrace());
            if(errorCallback != null)
            {
               errorCallback();
            }
         }
      }
      
      public function §_-3Bu§(param1:Function, param2:Function) : void
      {
         var successCallback:Function = param1;
         var errorCallback:Function = param2;
         try
         {
            if(this.§_-30m§ != null)
            {
               this.§_-BAO§();
               if(successCallback != null)
               {
                  successCallback();
               }
            }
         }
         catch(e:Error)
         {
            §_-3YE§.error(e.getStackTrace());
            if(errorCallback != null)
            {
               errorCallback();
            }
         }
      }
      
      public function §_-4IC§(param1:Function, param2:Function) : void
      {
         if(param1 != null)
         {
            param1();
         }
      }
      
      private function §_-BAO§() : void
      {
         if(this.§_-30m§ != null)
         {
            this.§_-30m§.removeEventListener(§_-AWR§.§_-Jy§,this.§_-CHP§);
            this.§_-30m§.removeEventListener(§_-AWR§.§_-9Lk§,this.§_-4nr§);
            this.§_-30m§.removeEventListener(§_-AWR§.ERROR,this.onError);
            this.§_-30m§.destroy();
            this.§_-30m§ = null;
         }
      }
      
      private function §_-CHP§(param1:§_-AWR§) : void
      {
         this._lastShowBannerTime = §_-8-S§.§_-9zq§();
      }
      
      private function §_-4nr§(param1:Event) : void
      {
         Context.§_-1nD§.logBannerShow(§_-6O§.§_-69J§);
      }
      
      private function onError(param1:§_-AWR§) : void
      {
         Context.§_-1nD§.logBannerError(§_-6O§.§_-69J§,String(param1.event));
      }
   }
}

