package §_-7nb§
{
   import §_-1ks§.§_-VC§;
   import §_-2qd§.AGSConnectEvent;
   import §_-2qd§.§_-6Qj§;
   import §_-3ie§.§_-6SW§;
   import §_-6GW§.§_-2mz§;
   import §_-AZ4§.§_-1Vi§;
   import §_-AZ4§.§_-3Lb§;
   import §_-GM§.§_-7VH§;
   import §_-PP§.§_-2Q-§;
   
   public class §_-6kZ§ extends §_-B00§
   {
      
      public function §_-6kZ§()
      {
         super();
      }
      
      override protected function createPreloaderScreen() : §_-VC§
      {
         return null;
      }
      
      override protected function showPreloader(param1:Boolean = false) : void
      {
         §_-7VH§.instance.§_-9bL§.showPreloader(§_-2Q-§.§_-7xW§,param1);
      }
      
      override public function set currentScreen(param1:§_-VC§) : void
      {
         if(param1 == null)
         {
            return;
         }
         this.§_-5Wa§();
         param1.addEventListener(§_-6SW§.§_-73I§,this.§_-9Wj§);
         super.currentScreen = param1;
      }
      
      private function §_-2Qp§(param1:§_-VC§) : void
      {
         if(param1 != null)
         {
            param1.removeEventListener(§_-6SW§.§_-73I§,this.§_-9Wj§);
         }
      }
      
      private function §_-5Wa§() : void
      {
         if(§_-rh§ != null)
         {
            §_-rh§.removeEventListener(§_-6SW§.§_-73I§,this.§_-9Wj§);
         }
      }
      
      override protected function onConnectError(param1:AGSConnectEvent) : void
      {
         super.onConnectError(param1);
         if(param1.errorCode == §_-3Lb§.§_-6Qm§ || param1.errorCode == §_-3Lb§.§_-7Uf§ || param1.errorCode == §_-2mz§.§_-BME§)
         {
            §_-7VH§.instance.§_-9bL§.cleanPreloader();
            return;
         }
         §_-7VH§.instance.§_-9bL§.showPreloader();
      }
      
      override protected function onDisconnect(param1:§_-6Qj§) : void
      {
         super.onDisconnect(param1);
         if(param1.reason == §_-1Vi§.CLOSE)
         {
            §_-7VH§.instance.§_-9bL§.cleanPreloader();
            return;
         }
         §_-7VH§.instance.§_-9bL§.showPreloader();
      }
      
      private function §_-9Wj§(param1:§_-6SW§) : void
      {
         this.§_-2Qp§(param1.data as §_-VC§);
         §_-7VH§.instance.§_-9bL§.§_-8pD§();
      }
   }
}

