package §_-636§
{
   import §_-0uA§.§_-3YE§;
   import §_-2U3§.ResourceManager;
   import §_-7xl§.§_-7VJ§;
   import §_-Xm§.MassLoader;
   import flash.display.Loader;
   import flash.events.ErrorEvent;
   import flash.events.Event;
   import flash.events.HTTPStatusEvent;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.events.SecurityErrorEvent;
   import flash.net.URLLoader;
   import flash.net.URLLoaderDataFormat;
   import flash.net.URLRequest;
   import flash.system.ApplicationDomain;
   import flash.system.LoaderContext;
   import flash.utils.ByteArray;
   
   public class SWFLoadingItem extends LoadingItem
   {
      private var §_-XD§:URLLoader;
      
      private var _context:LoaderContext;
      
      private var _autoRegister:String = null;
      
      public function SWFLoadingItem(param1:MassLoader, param2:URLRequest, param3:String)
      {
         super(param1,param2,param3);
      }
      
      override public function setOptions(param1:Object) : void
      {
         super.setOptions(param1);
         this._autoRegister = !!param1.hasOwnProperty(MassLoader.§_-7sp§) ? param1[MassLoader.§_-7sp§] : null;
      }
      
      override public function load() : void
      {
         super.load();
         this.§_-XD§ = new URLLoader();
         this.§_-XD§.dataFormat = URLLoaderDataFormat.BINARY;
         try
         {
            this.§_-XD§.addEventListener(ProgressEvent.PROGRESS,§_-6th§,false,0,true);
            this.§_-XD§.addEventListener(Event.COMPLETE,this.onLoadingComplete,false,0,true);
            this.§_-XD§.addEventListener(IOErrorEvent.IO_ERROR,this.onError,false,0,true);
            this.§_-XD§.addEventListener(IOErrorEvent.NETWORK_ERROR,this.onError,false,0,true);
            this.§_-XD§.addEventListener(IOErrorEvent.DISK_ERROR,this.onError,false,0,true);
            this.§_-XD§.addEventListener(IOErrorEvent.VERIFY_ERROR,this.onError,false,0,true);
            this.§_-XD§.addEventListener(HTTPStatusEvent.HTTP_STATUS,super.§_-3WF§,false,0,true);
            this.§_-XD§.addEventListener(Event.OPEN,§_-AIN§,false,0,true);
            this.§_-XD§.addEventListener(SecurityErrorEvent.SECURITY_ERROR,super.onSecurityError,false,0,true);
            this.§_-XD§.load(url);
         }
         catch(e:SecurityError)
         {
            §_-3YE§.error("exc :" + e.message);
            onSecurityError(§_-5IH§(e));
         }
      }
      
      override protected function onComplete(param1:Event) : void
      {
         super.onComplete(param1);
      }
      
      override protected function onSecurityError(param1:ErrorEvent) : void
      {
         super.onSecurityError(param1);
      }
      
      override protected function onError(param1:ErrorEvent) : void
      {
         super.onError(param1);
      }
      
      protected function onLoadingComplete(param1:Event) : void
      {
         _data = param1.target.data;
         this.§_-5Uv§(_data);
      }
      
      protected function §_-5Uv§(param1:ByteArray) : void
      {
         var bytes:ByteArray;
         var swfLoader:Loader = null;
         var data:ByteArray = param1;
         this._context = new LoaderContext(false,new ApplicationDomain());
         if(this._context.hasOwnProperty("allowLoadBytesCodeExecution"))
         {
            this._context["allowLoadBytesCodeExecution"] = true;
         }
         swfLoader = new Loader();
         swfLoader.contentLoaderInfo.addEventListener(Event.COMPLETE,function(param1:Event):void
         {
            _content = new §_-7VJ§(_context.applicationDomain,id);
            if(_autoRegister != null)
            {
               ResourceManager.§_-0cZ§(_autoRegister,_content);
            }
            swfLoader.unloadAndStop(false);
            onComplete(param1);
         });
         swfLoader.addEventListener(IOErrorEvent.NETWORK_ERROR,function(param1:ErrorEvent):void
         {
            onError(param1);
         });
         swfLoader.addEventListener(IOErrorEvent.VERIFY_ERROR,function(param1:ErrorEvent):void
         {
            onError(param1);
         });
         swfLoader.addEventListener(SecurityErrorEvent.SECURITY_ERROR,function(param1:ErrorEvent):void
         {
            onSecurityError(param1);
         });
         swfLoader.addEventListener(IOErrorEvent.IO_ERROR,function(param1:ErrorEvent):void
         {
            onError(param1);
         });
         bytes = data as ByteArray;
         if(bytes == null || bytes.length == 0)
         {
            §_-3YE§.§_-7aK§("0 bytes loaded: " + url.url);
            this.onError(null);
            return;
         }
         swfLoader.loadBytes(data,this._context);
      }
      
      override public function stop() : void
      {
         try
         {
            if(this.§_-XD§)
            {
               this.§_-XD§.close();
            }
         }
         catch(e:Error)
         {
         }
         super.stop();
      }
   }
}

