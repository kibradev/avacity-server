package ags
{
   import §_-2qd§.AGSConnectEvent;
   import §_-2qd§.§_-6Qj§;
   import §_-2qd§.§_-82L§;
   import §_-2qd§.§_-9ai§;
   import §_-AZ4§.§_-Any§;
   import flash.events.EventDispatcher;
   
   public class §_-15Z§ extends EventDispatcher
   {
      private var §_-sp§:§_-5x-§;
      
      public function §_-15Z§()
      {
         super();
      }
      
      public function §_-407§(param1:§_-5x-§) : void
      {
         this.§_-sp§ = param1;
         if(this.§_-sp§.connected)
         {
            this.§_-sp§.addEventListener(§_-82L§.§_-0zr§,this.§_-8Hn§);
            this.§_-sp§.addEventListener(§_-6Qj§.§_-Bnp§,this.onDisconnect);
         }
         else
         {
            this.§_-sp§.addEventListener(AGSConnectEvent.CONNECT,this.§_-1vF§);
         }
      }
      
      public function destroy() : void
      {
         if(this.§_-sp§.connected)
         {
            this.§_-sp§.removeEventListener(§_-6Qj§.§_-Bnp§,this.onDisconnect);
            this.§_-sp§.removeEventListener(§_-82L§.§_-0zr§,this.§_-8Hn§);
         }
         else
         {
            this.§_-sp§.removeEventListener(AGSConnectEvent.CONNECT,this.§_-1vF§);
         }
         this.§_-sp§ = null;
      }
      
      private function §_-1vF§(param1:AGSConnectEvent) : void
      {
         this.§_-sp§.removeEventListener(AGSConnectEvent.CONNECT,this.§_-1vF§);
         this.§_-sp§.addEventListener(§_-82L§.§_-0zr§,this.§_-8Hn§);
         this.§_-sp§.addEventListener(§_-6Qj§.§_-Bnp§,this.onDisconnect);
      }
      
      public function get client() : §_-5x-§
      {
         return this.§_-sp§;
      }
      
      private function onDisconnect(param1:§_-6Qj§) : void
      {
         if(this.§_-sp§ == null || this.§_-sp§.state == §_-Any§.§_-AC3§)
         {
            return;
         }
         if(this.§_-sp§.hasEventListener(§_-6Qj§.§_-Bnp§))
         {
            this.§_-sp§.removeEventListener(§_-6Qj§.§_-Bnp§,this.onDisconnect);
         }
         if(this.§_-sp§.hasEventListener(§_-82L§.§_-0zr§))
         {
            this.§_-sp§.removeEventListener(§_-82L§.§_-0zr§,this.§_-8Hn§);
         }
         if(!this.§_-sp§.hasEventListener(AGSConnectEvent.CONNECT))
         {
            this.§_-sp§.addEventListener(AGSConnectEvent.CONNECT,this.§_-1vF§);
         }
      }
      
      private function §_-8Hn§(param1:§_-82L§) : void
      {
         dispatchEvent(new §_-9ai§(param1.command,param1.command,param1.data));
      }
   }
}

