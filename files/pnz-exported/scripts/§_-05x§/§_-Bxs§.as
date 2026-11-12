package §_-05x§
{
   import §_-AZ4§.§_-Any§;
   import flash.events.ErrorEvent;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.events.SecurityErrorEvent;
   import flash.net.Socket;
   import flash.utils.ByteArray;
   
   public class §_-Bxs§
   {
      private var §_-0sO§:String = null;
      
      private var §_-0Op§:int = 0;
      
      private var §_-2S5§:Socket;
      
      private var _state:int;
      
      public function §_-Bxs§(param1:String, param2:int)
      {
         super();
         this.§_-0sO§ = param1;
         this.§_-0Op§ = param2;
      }
      
      public function connect() : void
      {
         this.§_-2S5§ = new Socket();
         this.§_-2S5§.addEventListener(Event.CONNECT,this.§_-1vF§);
         this.§_-2S5§.addEventListener(IOErrorEvent.IO_ERROR,this.onError);
         this.§_-2S5§.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onError);
         try
         {
            this._state = §_-Any§.§_-BZy§;
            this.§_-2S5§.connect(this.§_-0sO§,this.§_-0Op§);
         }
         catch(e:SecurityError)
         {
            _state = §_-Any§.§_-AC3§;
            dispose();
            throw e;
         }
      }
      
      private function §_-1vF§(param1:Event) : void
      {
         this.§_-2S5§.removeEventListener(Event.CONNECT,this.§_-1vF§);
         this.§_-2S5§.addEventListener(Event.CLOSE,this.§_-3G4§);
         this.§_-2S5§.addEventListener(ProgressEvent.SOCKET_DATA,this.§_-674§);
         this.§_-6Ez§();
      }
      
      private function §_-674§(param1:ProgressEvent) : void
      {
         var _loc2_:ByteArray = new ByteArray();
         this.§_-2S5§.readBytes(_loc2_,_loc2_.length);
      }
      
      private function §_-3G4§(param1:Event) : void
      {
         this._state = §_-Any§.§_-AC3§;
      }
      
      private function onError(param1:ErrorEvent) : void
      {
         this.dispose();
      }
      
      private function §_-6Ez§() : void
      {
      }
      
      public function dispose() : void
      {
         try
         {
            if(this.§_-2S5§ != null && this.§_-2S5§.connected)
            {
               this.§_-2S5§.close();
            }
         }
         catch(e:Error)
         {
         }
         finally
         {
            if(this.§_-2S5§ != null)
            {
               this.§_-2S5§.removeEventListener(Event.CONNECT,this.§_-1vF§);
               this.§_-2S5§.removeEventListener(Event.CLOSE,this.§_-3G4§);
               this.§_-2S5§.removeEventListener(ProgressEvent.SOCKET_DATA,this.§_-674§);
               this.§_-2S5§.removeEventListener(IOErrorEvent.IO_ERROR,this.onError);
               this.§_-2S5§.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onError);
               this.§_-2S5§ = null;
            }
         }
      }
   }
}

