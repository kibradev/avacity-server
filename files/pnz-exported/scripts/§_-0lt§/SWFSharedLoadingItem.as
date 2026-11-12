package §_-0lt§
{
   import §_-0uA§.§_-3YE§;
   import §_-786§.§_-CRy§;
   import §_-kr§.SWFSharedManager;
   import flash.display.Loader;
   import flash.events.ErrorEvent;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.SecurityErrorEvent;
   
   public class SWFSharedLoadingItem extends SharedLoadingItem
   {
      public function SWFSharedLoadingItem(param1:String)
      {
         super(param1);
      }
      
      override public function load() : void
      {
         var loader:Loader = new Loader();
         loader.contentLoaderInfo.addEventListener(Event.COMPLETE,function(param1:Event):void
         {
            onComplete();
         });
         loader.addEventListener(IOErrorEvent.NETWORK_ERROR,function(param1:ErrorEvent):void
         {
            onError();
         });
         loader.addEventListener(IOErrorEvent.VERIFY_ERROR,function(param1:ErrorEvent):void
         {
            onError();
         });
         loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR,function(param1:ErrorEvent):void
         {
            onError();
         });
         loader.addEventListener(IOErrorEvent.IO_ERROR,function(param1:ErrorEvent):void
         {
            onError();
         });
         loader.loadBytes(SWFSharedManager.§_-42G§(id),§_-52d§);
      }
      
      private function onError() : void
      {
         dispatchEvent(new §_-CRy§(§_-CRy§.§_-2qp§,0,this));
      }
      
      private function onComplete() : void
      {
         §_-3YE§.info("Loaded {swf: " + id + ", version: " + SWFSharedManager.§_-BCR§(id) + "} from local share");
         dispatchEvent(new §_-CRy§(§_-CRy§.§_-Sf§,0,this));
      }
   }
}

