package §_-0Uz§
{
   import §_-1Q2§.§_-5fo§;
   import §_-2qd§.AGSConnectEvent;
   import §_-2qd§.§_-6Qj§;
   import §_-2qd§.§_-9ai§;
   import §_-AKx§.§_-4OH§;
   import §_-BeZ§.§_-4Ww§;
   import §_-GM§.Context;
   
   public class §_-9Mh§ extends §_-6v4§
   {
      public static const §_-nC§:String = "ach";
      
      public static const static:String = "crrq";
      
      public static const §_-8Na§:String = "rirq";
      
      public static const §_-3Lm§:String = "lv";
      
      public static const §_-w9§:String = "rl";
      
      public static const §_-28v§:String = "vip";
      
      public static const §_-7zV§:String = "wdn";
      
      public static const §_-7-c§:String = "thks";
      
      public static const §_-7l4§:String = "dgft";
      
      public static const §_-4wK§:String = "qcmp";
      
      public static const §_-83G§:String = "vjp";
      
      public static const §_-5rN§:String = "cpsd";
      
      public static const §_-4MR§:String = "bnrm";
      
      public static const §_-7af§:String = "crav";
      
      public static const §_-5xc§:String = "crev";
      
      public static const §_-6mt§:String = "rtwn";
      
      public static const §_-0pq§:String = "artwn";
      
      public static const §_-ALP§:String = "plv";
      
      public static const §_-3XH§:String = "rpt";
      
      public static const §_-1oO§:String = "sbrwn";
      
      public static const §_-0B5§:String = "hckrtwn";
      
      private static const §_-B1N§:String = "stat.pbl";
      
      private static const §_-9bq§:String = "stat.shouse";
      
      private static const §_-AgP§:String = "stat.urlnv";
      
      private static const §_-8YS§:String = "stat.bnrshw";
      
      private static const §_-Or§:String = "stat.bnrerr";
      
      private static const §_-1Bk§:String = "pt";
      
      private static const §_-5jc§:String = "iid";
      
      private static const §_-An8§:String = "pid";
      
      private static const §_-BJO§:String = "stid";
      
      private static const §_-Xs§:String = "brntw";
      
      private static const §_-3Dn§:String = "brerr";
      
      private var §_-Aie§:Boolean = false;
      
      private var §_-CAm§:Array = [];
      
      public function §_-9Mh§()
      {
         super();
         §_-1-t§(§_-9bq§,this.§_-1CM§);
      }
      
      override protected function registerAllCallbacks() : void
      {
         super.registerAllCallbacks();
         if(§_-6gl§ != null)
         {
            §_-6gl§.addEventListener(AGSConnectEvent.CONNECT,this.§_-1vF§);
            §_-6gl§.addEventListener(§_-6Qj§.§_-Bnp§,this.onDisconnect);
         }
      }
      
      public function §_-7ED§(param1:String, param2:String, param3:String) : void
      {
         var _loc4_:§_-4Ww§ = new §_-4Ww§();
         _loc4_.put(§_-1Bk§,param1);
         _loc4_.put(§_-5jc§,param2);
         _loc4_.put(§_-An8§,param3);
         netClient.sendExtMessage(§_-B1N§,_loc4_);
         §_-5fo§.instance.wallPost();
      }
      
      public function useSharedObject() : void
      {
         if(!this.§_-Aie§)
         {
            this.§_-CAm§.push(function():void
            {
               useSharedObject();
            });
            return;
         }
         netClient.sendExtMessage(§_-9bq§);
      }
      
      public function logUrlNavigate(param1:String) : void
      {
         var data:§_-4Ww§;
         var urlStatId:String = param1;
         if(!this.§_-Aie§)
         {
            this.§_-CAm§.push(function():void
            {
               logUrlNavigate(urlStatId);
            });
            return;
         }
         data = new §_-4Ww§();
         data.put(§_-BJO§,urlStatId);
         netClient.sendExtMessage(§_-AgP§,data);
      }
      
      public function logBannerShow(param1:String) : void
      {
         var data:§_-4Ww§;
         var bannerNetwork:String = param1;
         if(!this.§_-Aie§)
         {
            this.§_-CAm§.push(function():void
            {
               logBannerShow(bannerNetwork);
            });
            return;
         }
         data = new §_-4Ww§();
         data.put(§_-Xs§,bannerNetwork);
         netClient.sendExtMessage(§_-8YS§,data);
      }
      
      public function logBannerError(param1:String, param2:String) : void
      {
         var data:§_-4Ww§;
         var bannerNetwork:String = param1;
         var error:String = param2;
         if(!this.§_-Aie§)
         {
            this.§_-CAm§.push(function():void
            {
               logBannerError(bannerNetwork,error);
            });
            return;
         }
         data = new §_-4Ww§();
         data.put(§_-Xs§,bannerNetwork);
         data.put(§_-3Dn§,error);
         netClient.sendExtMessage(§_-Or§,data);
      }
      
      private function §_-1CM§(param1:§_-9ai§) : void
      {
         Context.cityPlayer.cityInfo.§_-1OM§ = true;
         §_-4OH§.§_-B5P§(Context.§_-5o8§.message("thankyou"),Context.§_-5o8§.message("useSharedObjectOk"));
      }
      
      private function onDisconnect(param1:§_-6Qj§) : void
      {
         this.§_-Aie§ = false;
      }
      
      private function §_-1vF§(param1:AGSConnectEvent) : void
      {
         var _loc2_:Function = null;
         this.§_-Aie§ = true;
         for each(_loc2_ in this.§_-CAm§)
         {
            _loc2_();
         }
         this.§_-CAm§ = [];
      }
      
      override public function destroy() : void
      {
         if(destroyed)
         {
            return;
         }
         if(§_-6gl§ != null)
         {
            §_-6gl§.removeEventListener(AGSConnectEvent.CONNECT,this.§_-1vF§);
            §_-6gl§.removeEventListener(§_-6Qj§.§_-Bnp§,this.onDisconnect);
         }
         super.destroy();
      }
   }
}

