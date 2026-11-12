package §_-Aq0§
{
   import §_-0uA§.§_-3YE§;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IOErrorEvent;
   import flash.events.SecurityErrorEvent;
   import flash.net.URLLoader;
   import flash.net.URLRequest;
   import flash.net.URLRequestHeader;
   import flash.net.URLRequestMethod;
   import flash.net.URLVariables;
   
   public class §_-Bs9§ extends EventDispatcher
   {
      private var §_-XD§:URLLoader;
      
      private var _url:String;
      
      private var _data:Object = new Object();
      
      private var _method:String = "POST";
      
      private var §_-B2C§:Object = new Object();
      
      public var tag:Object = {};
      
      public var §_-1bP§:int = 1;
      
      private var §_-Ax-§:int = 0;
      
      public function §_-Bs9§(param1:String = "", param2:Object = null, param3:String = null)
      {
         super();
         this._url = param1;
         this._method = param3 != null ? param3 : URLRequestMethod.POST;
         if(null != param2)
         {
            this.§_-0fS§(param2);
         }
      }
      
      private function §_-0cA§() : Object
      {
         var _loc2_:String = null;
         var _loc1_:URLVariables = new URLVariables();
         for(_loc2_ in this._data)
         {
            _loc1_[_loc2_] = this._data[_loc2_];
         }
         return _loc1_;
      }
      
      protected function §_-3n8§(param1:URLLoader) : void
      {
         param1.addEventListener(Event.COMPLETE,this.onComplete);
         param1.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onSecurityError);
         param1.addEventListener(IOErrorEvent.IO_ERROR,this.§_-A2s§);
      }
      
      public function send() : void
      {
         var urlReq:URLRequest = new URLRequest(this._url);
         var headers:Array = this.§_-9TY§();
         if(headers.length > 0)
         {
            urlReq.requestHeaders = this.§_-9TY§();
         }
         urlReq.method = this._method;
         urlReq.data = this.§_-0cA§();
         try
         {
            this.§_-XD§ = new URLLoader();
            this.§_-3n8§(this.§_-XD§);
            this.§_-XD§.load(urlReq);
         }
         catch(error:Error)
         {
            trace("Unable to load requested document. " + error.message);
         }
      }
      
      private function §_-9TY§() : Array
      {
         var _loc2_:String = null;
         var _loc1_:Array = [];
         for(_loc2_ in this.§_-B2C§)
         {
            _loc1_.push(new URLRequestHeader(_loc2_,this.§_-B2C§[_loc2_]));
         }
         return _loc1_;
      }
      
      private function onComplete(param1:Event) : void
      {
         dispatchEvent(new §_-9db§(§_-9db§.COMPLETE,false,false,this.§_-XD§.data));
      }
      
      private function onSecurityError(param1:SecurityErrorEvent) : void
      {
         trace("security " + param1.toString());
         dispatchEvent(new §_-4n-§(§_-4n-§.HTTP_ERROR,false,false,SecurityErrorEvent.SECURITY_ERROR));
      }
      
      private function §_-A2s§(param1:IOErrorEvent) : void
      {
         trace("onIOError " + param1.toString());
         ++this.§_-Ax-§;
         if(this.§_-Ax-§ >= this.§_-1bP§)
         {
            dispatchEvent(new §_-4n-§(§_-4n-§.HTTP_ERROR,false,false,IOErrorEvent.IO_ERROR));
         }
         else
         {
            §_-3YE§.error("request attempt: " + this.§_-Ax-§);
            this.send();
         }
      }
      
      public function §_-0fS§(param1:Object) : void
      {
         var _loc2_:String = null;
         for(_loc2_ in param1)
         {
            this._data[_loc2_] = param1[_loc2_];
         }
      }
      
      public function get url() : String
      {
         return this._url;
      }
      
      public function set url(param1:String) : void
      {
         this._url = param1;
      }
      
      public function get headers() : Object
      {
         return this.§_-B2C§;
      }
      
      public function set headers(param1:Object) : void
      {
         this.§_-B2C§ = param1;
      }
      
      public function get method() : String
      {
         return this._method;
      }
      
      public function set method(param1:String) : void
      {
         this._method = param1;
      }
   }
}

