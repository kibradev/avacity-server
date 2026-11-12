package §_-Xm§
{
   import flash.errors.IllegalOperationError;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.HTTPStatusEvent;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.events.SecurityErrorEvent;
   import flash.net.URLLoader;
   import flash.net.URLLoaderDataFormat;
   import flash.net.URLRequest;
   import flash.net.URLRequestMethod;
   import flash.utils.ByteArray;
   import flash.utils.Dictionary;
   import flash.utils.Endian;
   import flash.utils.clearInterval;
   import flash.utils.setTimeout;
   
   public class MultipartURLLoader extends EventDispatcher
   {
      public static var §_-72J§:uint = 64 * 1024;
      
      private var §_-XD§:URLLoader;
      
      private var §_-95G§:String;
      
      private var §_-BsE§:Array;
      
      private var §_-7-x§:Array;
      
      private var §_-AdO§:Dictionary;
      
      private var §_-93J§:Dictionary;
      
      private var §_-BId§:Boolean = false;
      
      private var §_-3rI§:String;
      
      private var _data:ByteArray;
      
      private var §_-AdI§:Boolean = false;
      
      private var §_-94P§:Number;
      
      private var §_-JA§:uint = 0;
      
      private var §_-1pj§:uint = 0;
      
      private var §_-7vN§:uint = 0;
      
      public var requestHeaders:Array;
      
      public function MultipartURLLoader()
      {
         super();
         this.§_-7-x§ = new Array();
         this.§_-93J§ = new Dictionary();
         this.§_-BsE§ = new Array();
         this.§_-AdO§ = new Dictionary();
         this.§_-XD§ = new URLLoader();
         this.requestHeaders = new Array();
      }
      
      public function load(param1:String, param2:Boolean = false) : void
      {
         if(param1 == null || param1 == "")
         {
            throw new IllegalOperationError("You cant load without specifing PATH");
         }
         this.§_-3rI§ = param1;
         this.§_-BId§ = param2;
         if(this.§_-BId§)
         {
            if(!this.§_-AdI§)
            {
               this.§_-4XS§();
            }
            else
            {
               this.doSend();
            }
         }
         else
         {
            this._data = this.§_-Aam§();
            this.doSend();
         }
      }
      
      public function §_-1MJ§() : void
      {
         if(this.§_-3rI§ == null || this.§_-3rI§ == "" || this.§_-BId§ == false)
         {
            throw new IllegalOperationError("You can use this method only if loading asynchronous.");
         }
         if(!this.§_-AdI§ && this.§_-BId§)
         {
            throw new IllegalOperationError("You should prepare data before sending when using asynchronous.");
         }
         this.doSend();
      }
      
      public function §_-5fc§() : void
      {
         this.§_-4XS§();
      }
      
      public function close() : void
      {
         try
         {
            this.§_-XD§.close();
         }
         catch(e:Error)
         {
         }
      }
      
      public function §_-2PD§(param1:String, param2:Object = "") : void
      {
         if(this.§_-BsE§.indexOf(param1) == -1)
         {
            this.§_-BsE§.push(param1);
         }
         this.§_-AdO§[param1] = param2;
         this.§_-AdI§ = false;
      }
      
      public function §_-AhL§(param1:ByteArray, param2:String, param3:String = "Filedata", param4:String = "application/octet-stream") : void
      {
         var _loc5_:FilePart = null;
         if(this.§_-7-x§.indexOf(param2) == -1)
         {
            this.§_-7-x§.push(param2);
            this.§_-93J§[param2] = new FilePart(param1,param2,param3,param4);
            this.§_-1pj§ += param1.length;
         }
         else
         {
            _loc5_ = this.§_-93J§[param2] as FilePart;
            this.§_-1pj§ -= _loc5_.fileContent.length;
            _loc5_.fileContent = param1;
            _loc5_.fileName = param2;
            _loc5_.dataField = param3;
            _loc5_.contentType = param4;
            this.§_-1pj§ += param1.length;
         }
         this.§_-AdI§ = false;
      }
      
      public function §_-3dY§() : void
      {
         this.§_-BsE§ = new Array();
         this.§_-AdO§ = new Dictionary();
         this.§_-AdI§ = false;
      }
      
      public function §_-Lr§() : void
      {
         var _loc1_:String = null;
         for each(_loc1_ in this.§_-7-x§)
         {
            (this.§_-93J§[_loc1_] as FilePart).dispose();
         }
         this.§_-7-x§ = new Array();
         this.§_-93J§ = new Dictionary();
         this.§_-1pj§ = 0;
         this.§_-AdI§ = false;
      }
      
      public function dispose() : void
      {
         clearInterval(this.§_-94P§);
         this.§_-8E9§();
         this.close();
         this.§_-XD§ = null;
         this.§_-95G§ = null;
         this.§_-BsE§ = null;
         this.§_-AdO§ = null;
         this.§_-7-x§ = null;
         this.§_-93J§ = null;
         this.requestHeaders = null;
         this._data = null;
      }
      
      public function §_-5MZ§() : String
      {
         var _loc1_:int = 0;
         if(this.§_-95G§ == null)
         {
            this.§_-95G§ = "";
            _loc1_ = 0;
            while(_loc1_ < 32)
            {
               this.§_-95G§ += String.fromCharCode(int(97 + Math.random() * 25));
               _loc1_++;
            }
         }
         return this.§_-95G§;
      }
      
      public function get §_-6me§() : Boolean
      {
         return this.§_-BId§;
      }
      
      public function get §_-A59§() : Boolean
      {
         return this.§_-AdI§;
      }
      
      public function get dataFormat() : String
      {
         return this.§_-XD§.dataFormat;
      }
      
      public function set dataFormat(param1:String) : void
      {
         if(param1 != URLLoaderDataFormat.BINARY && param1 != URLLoaderDataFormat.TEXT && param1 != URLLoaderDataFormat.VARIABLES)
         {
            throw new IllegalOperationError("Illegal URLLoader Data Format");
         }
         this.§_-XD§.dataFormat = param1;
      }
      
      public function get loader() : URLLoader
      {
         return this.§_-XD§;
      }
      
      private function doSend() : void
      {
         var _loc1_:URLRequest = new URLRequest();
         _loc1_.url = this.§_-3rI§;
         _loc1_.contentType = "multipart/form-data; boundary=" + this.§_-5MZ§();
         _loc1_.method = URLRequestMethod.POST;
         _loc1_.data = this._data;
         if(Boolean(this.requestHeaders.length) && this.requestHeaders != null)
         {
            _loc1_.requestHeaders = this.requestHeaders.concat();
         }
         this.§_-2fS§();
         this.§_-XD§.load(_loc1_);
      }
      
      private function §_-4XS§() : void
      {
         clearInterval(this.§_-94P§);
         this._data = new ByteArray();
         this._data.endian = Endian.BIG_ENDIAN;
         this._data = this.§_-2J9§(this._data);
         this.§_-JA§ = 0;
         this.§_-7vN§ = 0;
         this.§_-AdI§ = false;
         if(this.§_-7-x§.length)
         {
            this.§_-AU2§();
         }
         else
         {
            this._data = this.§_-Ca2§(this._data);
            this.§_-AdI§ = true;
            dispatchEvent(new §_-7r8§(§_-7r8§.§_-4jQ§));
         }
      }
      
      private function §_-Aam§() : ByteArray
      {
         var _loc1_:ByteArray = new ByteArray();
         _loc1_.endian = Endian.BIG_ENDIAN;
         _loc1_ = this.§_-2J9§(_loc1_);
         _loc1_ = this.§_-54l§(_loc1_);
         return this.§_-Ca2§(_loc1_);
      }
      
      private function §_-Ca2§(param1:ByteArray) : ByteArray
      {
         param1 = this.§_-6hC§(param1);
         return this.§_-3Sk§(param1);
      }
      
      private function §_-2J9§(param1:ByteArray) : ByteArray
      {
         var _loc2_:uint = 0;
         var _loc3_:* = null;
         var _loc4_:String = null;
         for each(_loc4_ in this.§_-BsE§)
         {
            param1 = this.§_-6hC§(param1);
            param1 = this.§_-6AD§(param1);
            _loc3_ = "Content-Disposition: form-data; name=\"" + _loc4_ + "\"";
            _loc2_ = 0;
            while(_loc2_ < _loc3_.length)
            {
               param1.writeByte(_loc3_.charCodeAt(_loc2_));
               _loc2_++;
            }
            param1 = this.§_-6AD§(param1);
            param1 = this.§_-6AD§(param1);
            param1.writeUTFBytes(this.§_-AdO§[_loc4_]);
            param1 = this.§_-6AD§(param1);
         }
         return param1;
      }
      
      private function §_-54l§(param1:ByteArray) : ByteArray
      {
         var _loc2_:String = null;
         if(this.§_-7-x§.length)
         {
            for each(_loc2_ in this.§_-7-x§)
            {
               param1 = this.§_-45C§(param1,this.§_-93J§[_loc2_] as FilePart);
               param1 = this.§_-9C9§(param1,this.§_-93J§[_loc2_] as FilePart);
               param1 = this.§_-6AD§(param1);
            }
            param1 = this.§_-7O1§(param1);
         }
         return param1;
      }
      
      private function §_-7O1§(param1:ByteArray) : ByteArray
      {
         var _loc2_:uint = 0;
         var _loc3_:String = null;
         param1 = this.§_-6AD§(param1);
         param1 = this.§_-6hC§(param1);
         param1 = this.§_-6AD§(param1);
         _loc3_ = "Content-Disposition: form-data; name=\"Upload\"";
         _loc2_ = 0;
         while(_loc2_ < _loc3_.length)
         {
            param1.writeByte(_loc3_.charCodeAt(_loc2_));
            _loc2_++;
         }
         param1 = this.§_-6AD§(param1);
         param1 = this.§_-6AD§(param1);
         _loc3_ = "Submit Query";
         _loc2_ = 0;
         while(_loc2_ < _loc3_.length)
         {
            param1.writeByte(_loc3_.charCodeAt(_loc2_));
            _loc2_++;
         }
         return this.§_-6AD§(param1);
      }
      
      private function §_-45C§(param1:ByteArray, param2:FilePart) : ByteArray
      {
         var _loc3_:uint = 0;
         var _loc4_:* = null;
         param1 = this.§_-6hC§(param1);
         param1 = this.§_-6AD§(param1);
         _loc4_ = "Content-Disposition: form-data; name=\"Filename\"";
         _loc3_ = 0;
         while(_loc3_ < _loc4_.length)
         {
            param1.writeByte(_loc4_.charCodeAt(_loc3_));
            _loc3_++;
         }
         param1 = this.§_-6AD§(param1);
         param1 = this.§_-6AD§(param1);
         param1.writeUTFBytes(param2.fileName);
         param1 = this.§_-6AD§(param1);
         param1 = this.§_-6hC§(param1);
         param1 = this.§_-6AD§(param1);
         _loc4_ = "Content-Disposition: form-data; name=\"" + param2.dataField + "\"; filename=\"";
         _loc3_ = 0;
         while(_loc3_ < _loc4_.length)
         {
            param1.writeByte(_loc4_.charCodeAt(_loc3_));
            _loc3_++;
         }
         param1.writeUTFBytes(param2.fileName);
         param1 = this.§_-A-J§(param1);
         param1 = this.§_-6AD§(param1);
         _loc4_ = "Content-Type: " + param2.contentType;
         _loc3_ = 0;
         while(_loc3_ < _loc4_.length)
         {
            param1.writeByte(_loc4_.charCodeAt(_loc3_));
            _loc3_++;
         }
         param1 = this.§_-6AD§(param1);
         return this.§_-6AD§(param1);
      }
      
      private function §_-9C9§(param1:ByteArray, param2:FilePart) : ByteArray
      {
         param1.writeBytes(param2.fileContent,0,param2.fileContent.length);
         return param1;
      }
      
      private function §_-6th§(param1:ProgressEvent) : void
      {
         dispatchEvent(param1);
      }
      
      private function onComplete(param1:Event) : void
      {
         this.§_-8E9§();
         dispatchEvent(param1);
      }
      
      private function §_-A2s§(param1:IOErrorEvent) : void
      {
         this.§_-8E9§();
         dispatchEvent(param1);
      }
      
      private function onSecurityError(param1:SecurityErrorEvent) : void
      {
         this.§_-8E9§();
         dispatchEvent(param1);
      }
      
      private function §_-2pV§(param1:HTTPStatusEvent) : void
      {
         dispatchEvent(param1);
      }
      
      private function §_-2fS§() : void
      {
         this.§_-XD§.addEventListener(Event.COMPLETE,this.onComplete,false,0,false);
         this.§_-XD§.addEventListener(ProgressEvent.PROGRESS,this.§_-6th§,false,0,false);
         this.§_-XD§.addEventListener(IOErrorEvent.IO_ERROR,this.§_-A2s§,false,0,false);
         this.§_-XD§.addEventListener(HTTPStatusEvent.HTTP_STATUS,this.§_-2pV§,false,0,false);
         this.§_-XD§.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onSecurityError,false,0,false);
      }
      
      private function §_-8E9§() : void
      {
         this.§_-XD§.removeEventListener(Event.COMPLETE,this.onComplete);
         this.§_-XD§.removeEventListener(ProgressEvent.PROGRESS,this.§_-6th§);
         this.§_-XD§.removeEventListener(IOErrorEvent.IO_ERROR,this.§_-A2s§);
         this.§_-XD§.removeEventListener(HTTPStatusEvent.HTTP_STATUS,this.§_-2pV§);
         this.§_-XD§.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onSecurityError);
      }
      
      private function §_-6hC§(param1:ByteArray) : ByteArray
      {
         var _loc2_:int = this.§_-5MZ§().length;
         param1 = this.§_-3Sk§(param1);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            param1.writeByte(this.§_-95G§.charCodeAt(_loc3_));
            _loc3_++;
         }
         return param1;
      }
      
      private function §_-6AD§(param1:ByteArray) : ByteArray
      {
         param1.writeShort(3338);
         return param1;
      }
      
      private function §_-A-J§(param1:ByteArray) : ByteArray
      {
         param1.writeByte(34);
         return param1;
      }
      
      private function §_-3Sk§(param1:ByteArray) : ByteArray
      {
         param1.writeShort(11565);
         return param1;
      }
      
      private function §_-AU2§() : void
      {
         var _loc1_:FilePart = null;
         if(this.§_-JA§ < this.§_-7-x§.length)
         {
            _loc1_ = this.§_-93J§[this.§_-7-x§[this.§_-JA§]] as FilePart;
            this._data = this.§_-45C§(this._data,_loc1_);
            this.§_-94P§ = setTimeout(this.§_-3qp§,10,this._data,_loc1_.fileContent,0);
            ++this.§_-JA§;
         }
         else
         {
            this._data = this.§_-7O1§(this._data);
            this._data = this.§_-Ca2§(this._data);
            this.§_-AdI§ = true;
            dispatchEvent(new §_-7r8§(§_-7r8§.§_-C3K§,this.§_-1pj§,this.§_-1pj§));
            dispatchEvent(new §_-7r8§(§_-7r8§.§_-4jQ§));
         }
      }
      
      private function §_-3qp§(param1:ByteArray, param2:ByteArray, param3:uint = 0) : void
      {
         var _loc4_:uint = Math.min(§_-72J§,param2.length - param3);
         param1.writeBytes(param2,param3,_loc4_);
         if(_loc4_ < §_-72J§ || param3 + _loc4_ >= param2.length)
         {
            param1 = this.§_-6AD§(param1);
            this.§_-AU2§();
            return;
         }
         param3 += _loc4_;
         this.§_-7vN§ += _loc4_;
         if(this.§_-7vN§ % §_-72J§ * 2 == 0)
         {
            dispatchEvent(new §_-7r8§(§_-7r8§.§_-C3K§,this.§_-7vN§,this.§_-1pj§));
         }
         this.§_-94P§ = setTimeout(this.§_-3qp§,10,param1,param2,param3);
      }
   }
}

import flash.utils.ByteArray;

class FilePart
{
   public var fileContent:ByteArray;
   
   public var fileName:String;
   
   public var dataField:String;
   
   public var contentType:String;
   
   public function FilePart(param1:ByteArray, param2:String, param3:String = "Filedata", param4:String = "application/octet-stream")
   {
      super();
      this.fileContent = param1;
      this.fileName = param2;
      this.dataField = param3;
      this.contentType = param4;
   }
   
   public function dispose() : void
   {
      this.fileContent = null;
      this.fileName = null;
      this.dataField = null;
      this.contentType = null;
   }
}
