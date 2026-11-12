package §_-636§
{
   import §_-0uA§.§_-3YE§;
   import §_-8cq§.§_-5eD§;
   import §_-8cq§.§_-dB§;
   import §_-Xm§.MassLoader;
   import §_-zT§.§_-102§;
   import §_-zT§.§_-CIF§;
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
   
   public class ZipLoadingItem extends LoadingItem
   {
      public static const CONVERT:String = "convert";
      
      protected var §_-A6N§:Boolean = false;
      
      protected var §_-XD§:URLLoader;
      
      protected var _context:LoaderContext;
      
      public function ZipLoadingItem(param1:MassLoader, param2:URLRequest, param3:String)
      {
         super(param1,param2,param3);
      }
      
      override public function destroy() : void
      {
         this.stop();
         this.removeListeners();
         this.§_-XD§ = null;
         super.destroy();
      }
      
      override public function setOptions(param1:Object) : void
      {
         super.setOptions(param1);
         if(param1.hasOwnProperty(CONVERT))
         {
            this.§_-A6N§ = Boolean(param1[CONVERT]);
         }
         if(param1.hasOwnProperty(MassLoader.§_-ANK§))
         {
            this._context = param1[MassLoader.§_-ANK§];
         }
         else
         {
            this._context = new LoaderContext(false,new ApplicationDomain());
         }
      }
      
      override public function load() : void
      {
         super.load();
         this.§_-XD§ = new URLLoader();
         this.§_-XD§.dataFormat = URLLoaderDataFormat.BINARY;
         try
         {
            this.§_-XD§.load(url);
            this.§_-XD§.addEventListener(ProgressEvent.PROGRESS,§_-6th§,false,0,true);
            this.§_-XD§.addEventListener(Event.COMPLETE,this.onLoadingComplete,false,0,true);
            this.§_-XD§.addEventListener(IOErrorEvent.IO_ERROR,onError,false,0,true);
            this.§_-XD§.addEventListener(HTTPStatusEvent.HTTP_STATUS,super.§_-3WF§,false,0,true);
            this.§_-XD§.addEventListener(Event.OPEN,§_-AIN§,false,0,true);
            this.§_-XD§.addEventListener(SecurityErrorEvent.SECURITY_ERROR,super.onSecurityError,false,0,true);
         }
         catch(e:SecurityError)
         {
            §_-3YE§.error("exc :" + e.message);
            onSecurityError(§_-5IH§(e));
         }
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
      
      override public function removeListeners() : void
      {
         if(this.§_-XD§)
         {
            this.§_-XD§.removeEventListener(ProgressEvent.PROGRESS,§_-6th§);
            this.§_-XD§.removeEventListener(Event.COMPLETE,this.onLoadingComplete);
            this.§_-XD§.removeEventListener(IOErrorEvent.IO_ERROR,onError);
            this.§_-XD§.removeEventListener(HTTPStatusEvent.HTTP_STATUS,super.§_-3WF§);
            this.§_-XD§.removeEventListener(Event.OPEN,§_-AIN§);
            this.§_-XD§.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,super.onSecurityError);
         }
      }
      
      override protected function onComplete(param1:Event) : void
      {
         super.onComplete(param1);
      }
      
      protected function onLoadingComplete(param1:Event) : void
      {
         var zipFile:§_-dB§;
         var zipPack:§_-102§;
         var entry:§_-5eD§ = null;
         var zipContent:§_-CIF§ = null;
         var event:Event = param1;
         _data = event.target.data;
         zipFile = new §_-dB§(event.target.data);
         zipPack = new §_-102§(zipFile);
         for each(entry in zipFile.entries)
         {
            if(!entry.§_-ABu§())
            {
               zipContent = new §_-CIF§(entry,zipFile,this._context);
               zipPack.add(zipContent);
            }
         }
         _content = zipPack;
         if(!this.§_-A6N§)
         {
            this.onComplete(event);
         }
         else
         {
            zipPack.§_-9AJ§(function(param1:§_-102§):void
            {
               onComplete(new Event(Event.COMPLETE,false,false));
            });
            event.stopPropagation();
         }
      }
   }
}

