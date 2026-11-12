package ags
{
   import §_-0X5§.§_-7hI§;
   import §_-0X5§.§_-9sd§;
   import §_-0X5§.§_-C55§;
   import §_-0uA§.§_-3YE§;
   import §_-2C6§.§_-75q§;
   import §_-2qd§.AGSConnectEvent;
   import §_-2qd§.§_-6Qj§;
   import §_-4Xl§.§_-9l6§;
   import §_-5RV§.§_-02§;
   import §_-5RV§.§_-5Jp§;
   import §_-5RV§.§_-5gZ§;
   import §_-5RV§.§_-6bT§;
   import §_-5RV§.§_-8t2§;
   import §_-5RV§.§_-9CT§;
   import §_-5RV§.§_-9dJ§;
   import §_-5RV§.§_-9mD§;
   import §_-5RV§.§_-BJ2§;
   import §_-6zp§.§_-0DX§;
   import §_-6zp§.§_-4FH§;
   import §_-6zp§.§_-4t2§;
   import §_-6zp§.§_-5U1§;
   import §_-6zp§.§_-iD§;
   import §_-6zp§.§_-su§;
   import §_-8cq§.§_-5ni§;
   import §_-AZ4§.§_-0iB§;
   import §_-AZ4§.§_-1Vi§;
   import §_-AZ4§.§_-3Lb§;
   import §_-AZ4§.§_-3wo§;
   import §_-AZ4§.§_-4KN§;
   import §_-AZ4§.§_-7HP§;
   import §_-AZ4§.§_-Any§;
   import §_-BeZ§.§_-1e5§;
   import §_-BeZ§.§_-4Ww§;
   import §_-BeZ§.§_-B10§;
   import flash.errors.IOError;
   import flash.events.ErrorEvent;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.events.SecurityErrorEvent;
   import flash.net.Socket;
   import flash.utils.ByteArray;
   
   public class §_-5x-§ extends EventDispatcher
   {
      private var _userId:String;
      
      protected var _state:int = §_-Any§.§_-AC3§;
      
      protected var §_-5W7§:int = §_-Any§.§_-1M2§;
      
      protected var §_-2BH§:String;
      
      private var §_-9GC§:§_-9l6§;
      
      private var §_-X-§:§_-3wo§;
      
      protected var §_-2S5§:Socket;
      
      protected var §_-0sO§:String;
      
      protected var §_-0Op§:int;
      
      protected var §_-6ro§:String;
      
      protected var §_-6un§:String;
      
      protected var §_-ABB§:ByteArray = new ByteArray();
      
      protected var §_-1Yz§:§_-4Ww§;
      
      private var native:Boolean = false;
      
      private var §_-7Gw§:§_-15Z§ = null;
      
      private var §_-7lF§:Object = {};
      
      private var §_-9Tq§:§_-8T0§;
      
      private var §_-5pp§:int = 5;
      
      protected var §_-3s5§:int = 0;
      
      private var §_-408§:int = 2000;
      
      private var §_-3kN§:int = 0;
      
      private var §_-2Qi§:int = 0;
      
      protected var §_-0ha§:§_-5P3§;
      
      private var §_-70T§:§_-5ni§;
      
      private var §_-6ZF§:int = 1;
      
      public function §_-5x-§(param1:String, param2:int, param3:Boolean = true)
      {
         super();
         this.§_-0sO§ = param1;
         this.§_-0Op§ = param2;
         if(param3)
         {
            this.§_-9GC§ = §_-7HP§.§_-5C9§(§_-7HP§.BINARY);
         }
         else
         {
            this.§_-9GC§ = §_-7HP§.§_-5C9§(§_-7HP§.JSON);
         }
         this.§_-9Tq§ = new §_-8T0§(this);
         this.§_-88e§();
         this.§_-0ha§ = new §_-5P3§(false,false,false);
      }
      
      private function §_-5R§() : int
      {
         this.§_-6ZF§ = this.§_-6ZF§ >= int.MAX_VALUE ? 1 : this.§_-6ZF§ + 1;
         return this.§_-6ZF§;
      }
      
      private function §_-88e§() : void
      {
         this.§_-Bvy§(§_-9CT§.ID,§_-9CT§);
         this.§_-Bvy§(§_-5Jp§.ID,§_-5Jp§);
         this.§_-Bvy§(§_-02§.ID,§_-02§);
         this.§_-Bvy§(§_-6bT§.ID,§_-6bT§);
         this.§_-Bvy§(§_-BJ2§.ID,§_-BJ2§);
         this.§_-Bvy§(§_-9dJ§.ID,§_-9dJ§);
         this.§_-Bvy§(§_-8t2§.ID,§_-8t2§);
         this.§_-Bvy§(§_-5gZ§.ID,§_-5gZ§);
      }
      
      public function destroy() : void
      {
         if(this.connected)
         {
            this.disconnect();
         }
      }
      
      public function §_-Bvy§(param1:int, param2:Class) : void
      {
         this.§_-7lF§[param1] = param2;
      }
      
      public function §_-35U§(param1:int = 0, param2:int = 0) : void
      {
         this.§_-3kN§ = param1;
         this.§_-2Qi§ = param2 > param1 ? param2 : param1;
      }
      
      public function connect(param1:String, param2:String, param3:§_-4Ww§ = null) : void
      {
         var zone:String = param1;
         var login:String = param2;
         var data:§_-4Ww§ = param3;
         if(this._state != §_-Any§.§_-AC3§)
         {
            throw new Error("Client already connected, state=" + this._state);
         }
         this.§_-6ro§ = login;
         this.§_-2BH§ = zone;
         this.§_-1Yz§ = data;
         this.§_-3s5§ = 0;
         this.§_-2S5§ = new Socket();
         this.§_-C8y§();
         try
         {
            this._state = §_-Any§.§_-BZy§;
            this.§_-2S5§.connect(this.§_-0sO§,this.§_-0Op§);
         }
         catch(e:SecurityError)
         {
            _state = §_-Any§.§_-AC3§;
            logError("Net Connector SecurityError:" + e.message);
            dispose();
            throw e;
         }
      }
      
      public function configure(param1:Boolean, param2:Boolean, param3:Boolean, param4:ByteArray) : void
      {
         this.§_-0ha§ = new §_-5P3§(param1,param2,param3);
         if(this.§_-0ha§.§_-3AJ§)
         {
            this.§_-X-§ = new §_-75q§(param4);
         }
         if(this.§_-0ha§.§_-9iI§)
         {
            this.§_-70T§ = new §_-5ni§();
         }
      }
      
      public function logError(param1:String) : void
      {
         §_-3YE§.error(param1);
      }
      
      public function §_-CIL§(param1:Object) : void
      {
         §_-3YE§.info(param1);
      }
      
      protected function §_-C8y§() : void
      {
         this.§_-2S5§.addEventListener(Event.CONNECT,this.§_-1vF§);
         this.§_-2S5§.addEventListener(IOErrorEvent.IO_ERROR,this.onError);
         this.§_-2S5§.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onError);
      }
      
      public function §_-6Tj§(param1:String, param2:String) : void
      {
         this.§_-2BH§ = param1;
         this.§_-6un§ = param2;
         this.sendRequest(new §_-iD§(this.§_-2BH§,this.§_-6ro§,this.§_-6un§,this.§_-1Yz§));
      }
      
      private function §_-1vF§(param1:Event) : void
      {
         this._state = §_-Any§.CONNECTED;
         this.§_-2S5§.removeEventListener(Event.CONNECT,this.§_-1vF§);
         this.§_-2S5§.addEventListener(Event.CLOSE,this.§_-3G4§);
         this.§_-2S5§.addEventListener(ProgressEvent.SOCKET_DATA,this.§_-674§);
         dispatchEvent(new AGSConnectEvent(AGSConnectEvent.CONNECT));
      }
      
      private function onError(param1:ErrorEvent) : void
      {
         this.dispose();
         this.logError("Net Connector I/O Error: " + param1.text);
         if(param1 is SecurityErrorEvent)
         {
            dispatchEvent(new AGSConnectEvent(AGSConnectEvent.§_-3-i§,§_-3Lb§.SECURITY_ERROR,param1.text));
         }
         else
         {
            dispatchEvent(new AGSConnectEvent(AGSConnectEvent.§_-3-i§,§_-3Lb§.§_-3-i§,param1.text));
         }
      }
      
      private function §_-71t§(param1:ByteArray) : void
      {
         var _loc2_:§_-0iB§ = new §_-0iB§(param1.readByte());
         var _loc3_:uint = 0;
         var _loc4_:int = 1;
         if(_loc2_.§_-6sD§)
         {
            _loc3_ = param1.readUnsignedInt();
            _loc4_ += 4;
         }
         var _loc5_:ByteArray = new ByteArray();
         param1.readBytes(_loc5_);
         if(_loc2_.§_-6sD§)
         {
            this.§_-70T§.reset();
            this.§_-70T§.update(_loc5_);
            if(_loc3_ != this.§_-70T§.getValue())
            {
               throw new Error("Crc didn\'t match expected: " + _loc3_ + " received:" + this.§_-70T§.getValue());
            }
         }
         if(_loc2_.§_-3AJ§)
         {
            _loc5_ = this.§_-X-§.§_-2-d§(_loc5_);
         }
         if(_loc2_.§_-BcA§)
         {
            _loc5_.uncompress();
         }
         var _loc6_:§_-4KN§ = this.§_-9GC§.§_-av§(_loc5_);
         this.§_-9c3§(_loc6_);
      }
      
      private function §_-674§(param1:ProgressEvent) : void
      {
         var _loc2_:uint = 0;
         var _loc3_:ByteArray = null;
         var _loc4_:ByteArray = null;
         this.§_-2S5§.readBytes(this.§_-ABB§,this.§_-ABB§.length);
         this.§_-ABB§.position = 0;
         while(this.§_-ABB§.bytesAvailable > 4)
         {
            _loc2_ = uint(this.§_-ABB§.readInt());
            if(this.§_-ABB§.bytesAvailable < _loc2_)
            {
               this.§_-ABB§.position -= 4;
               break;
            }
            _loc3_ = new ByteArray();
            this.§_-ABB§.readBytes(_loc3_,0,_loc2_);
            this.§_-71t§(_loc3_);
         }
         if(this.§_-ABB§.bytesAvailable > 0)
         {
            _loc4_ = new ByteArray();
            this.§_-ABB§.readBytes(_loc4_);
            this.§_-ABB§ = _loc4_;
         }
         else
         {
            this.§_-ABB§ = new ByteArray();
         }
      }
      
      public function dispose() : void
      {
         this._state = §_-Any§.§_-AC3§;
         try
         {
            if(this.§_-2S5§ != null && this.§_-2S5§.connected)
            {
               this.§_-2S5§.close();
            }
         }
         catch(e:Error)
         {
            logError("IO error occurred while closing socket. Error #" + e.errorID + ": " + e.message);
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
            this.§_-0ha§ = null;
         }
      }
      
      public function disconnect() : void
      {
         if(this._state == §_-Any§.CONNECTED)
         {
            this._state = §_-Any§.§_-9bF§;
            this.sendRequest(new §_-5U1§());
         }
         else if(this._state == §_-Any§.§_-BZy§)
         {
            this.dispose();
            this._state = §_-Any§.§_-AC3§;
         }
      }
      
      public function logout() : void
      {
         if(this.§_-5W7§ == §_-Any§.§_-CJ2§)
         {
            this.§_-5W7§ = §_-Any§.§_-9x0§;
            this.sendRequest(new §_-5U1§());
         }
      }
      
      public function §_-ByD§(param1:int = 3) : void
      {
         this.§_-9Tq§.§_-BQv§(param1);
      }
      
      public function joinRoom(param1:String, param2:String = null) : void
      {
         this.sendRequest(new §_-4t2§(param1,param2));
      }
      
      public function leaveRoom(param1:String) : void
      {
         this.sendRequest(new §_-0DX§(param1));
      }
      
      public function sendExtMessage(param1:String, param2:Object = null, param3:String = null) : void
      {
         var _loc4_:§_-4Ww§ = param2 is §_-4Ww§ ? §_-4Ww§(param2) : new §_-4Ww§(param2);
         this.sendRequest(new §_-su§([new §_-C55§(param1,_loc4_)],param3));
      }
      
      public function §_-6NO§(param1:§_-7hI§, param2:String = null) : void
      {
         var _loc3_:§_-4Ww§ = §_-B10§.§_-0JE§(param1).§_-9Mk§();
         this.sendExtMessage(param1.id,_loc3_,param2);
      }
      
      public function §_-4xq§() : §_-9sd§
      {
         return new §_-9sd§(this);
      }
      
      protected function §_-6qG§(param1:int, param2:§_-1e5§) : void
      {
         var request:§_-4KN§;
         var message:ByteArray;
         var oldPosition:uint = 0;
         var buf:ByteArray = null;
         var headerLength:int = 0;
         var protocolHeader:§_-0iB§ = null;
         var type:int = param1;
         var params:§_-1e5§ = param2;
         if(this.§_-2S5§ == null || !this.§_-2S5§.connected)
         {
            return;
         }
         request = new §_-4KN§(type,params);
         message = new ByteArray();
         message.writeInt(this.§_-5R§());
         this.§_-9GC§.encode(request,message);
         if(this.§_-0ha§.§_-BcA§)
         {
            message.compress();
         }
         if(this.§_-0ha§.§_-3AJ§)
         {
            message = this.§_-X-§.§_-0Fp§(message);
         }
         this.§_-CIL§(["Client said:",request.type,":",request.content]);
         try
         {
            oldPosition = message.position;
            message.position = 0;
            buf = new ByteArray();
            headerLength = 1;
            if(this.§_-0ha§.§_-9iI§)
            {
               headerLength += 4;
            }
            buf.writeInt(message.bytesAvailable + headerLength);
            protocolHeader = new §_-0iB§();
            protocolHeader.§_-3AJ§ = this.§_-0ha§.§_-3AJ§;
            protocolHeader.§_-BcA§ = this.§_-0ha§.§_-BcA§;
            protocolHeader.§_-6sD§ = this.§_-0ha§.§_-9iI§;
            buf.writeByte(protocolHeader.§_-3zx§());
            if(this.§_-0ha§.§_-9iI§)
            {
               this.§_-70T§.reset();
               this.§_-70T§.update(message);
               buf.writeInt(this.§_-70T§.getValue());
            }
            buf.writeBytes(message);
            message.position = oldPosition;
            buf.position = 0;
            this.§_-2S5§.writeBytes(buf);
            this.§_-2S5§.flush();
         }
         catch(e:IOError)
         {
            throw e;
         }
      }
      
      public function sendRequest(param1:§_-4FH§) : void
      {
         var _loc2_:§_-1e5§ = new §_-1e5§();
         param1.writeArray(_loc2_);
         this.§_-6qG§(param1.type,_loc2_);
      }
      
      private function §_-9c3§(param1:§_-4KN§) : void
      {
         var _loc3_:§_-9mD§ = null;
         this.§_-CIL§(["Server said:",param1.type,":",param1.content]);
         var _loc2_:Class = this.§_-7lF§[param1.type];
         if(_loc2_ != null)
         {
            _loc3_ = new _loc2_();
            _loc3_.readArray(param1.content);
            _loc3_.execute(this);
         }
         else
         {
            this.logError("Unknown message type=" + param1.type);
         }
      }
      
      private function §_-3G4§(param1:Event) : void
      {
         if(!this.native && this._state != §_-Any§.§_-AC3§)
         {
            dispatchEvent(new §_-6Qj§(§_-6Qj§.§_-Bnp§,§_-1Vi§.§_-8MQ§));
         }
         this._state = §_-Any§.§_-AC3§;
      }
      
      public function get commandDispatcher() : §_-15Z§
      {
         if(this.§_-7Gw§ == null)
         {
            this.§_-7Gw§ = new §_-15Z§();
            this.§_-7Gw§.§_-407§(this);
         }
         return this.§_-7Gw§;
      }
      
      public function get connected() : Boolean
      {
         return this._state == §_-Any§.CONNECTED;
      }
      
      public function get loggedIn() : Boolean
      {
         return this.§_-5W7§ == §_-Any§.§_-CJ2§;
      }
      
      public function get state() : int
      {
         return this._state;
      }
      
      public function set state(param1:int) : void
      {
         this._state = param1;
      }
      
      public function set §_-5fL§(param1:int) : void
      {
         this.§_-5W7§ = param1;
      }
      
      public function get config() : §_-5P3§
      {
         return this.§_-0ha§;
      }
      
      public function get userId() : String
      {
         return this._userId;
      }
      
      public function set userId(param1:String) : void
      {
         this._userId = param1;
      }
      
      public function get zone() : String
      {
         return this.§_-2BH§;
      }
      
      public function get §_-4lm§() : int
      {
         return this.§_-9Tq§.§_-4lm§;
      }
      
      public function get host() : String
      {
         return this.§_-0sO§;
      }
      
      public function get port() : int
      {
         return this.§_-0Op§;
      }
      
      public function get §_-2cw§() : Boolean
      {
         return this.native;
      }
      
      public function set §_-2cw§(param1:Boolean) : void
      {
         this.native = param1;
      }
      
      public function get §_-2x6§() : §_-8T0§
      {
         return this.§_-9Tq§;
      }
   }
}

