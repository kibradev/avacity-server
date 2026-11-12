package §_-636§
{
   import §_-Xm§.MassLoader;
   import flash.events.Event;
   import flash.events.HTTPStatusEvent;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.events.SecurityErrorEvent;
   import flash.net.URLLoader;
   import flash.net.URLRequest;
   
   public class XMLLoadingItem extends LoadingItem
   {
      protected var §_-XD§:URLLoader;
      
      public function XMLLoadingItem(param1:MassLoader, param2:URLRequest, param3:String)
      {
         super(param1,param2,param3);
      }
      
      override public function load() : void
      {
         super.load();
         this.§_-XD§ = new URLLoader();
         this.§_-XD§.addEventListener(ProgressEvent.PROGRESS,§_-6th§,false,0,true);
         this.§_-XD§.addEventListener(Event.COMPLETE,this.onComplete,false,0,true);
         this.§_-XD§.addEventListener(IOErrorEvent.IO_ERROR,onError,false,0,true);
         this.§_-XD§.addEventListener(HTTPStatusEvent.HTTP_STATUS,super.§_-3WF§,false,0,true);
         this.§_-XD§.addEventListener(SecurityErrorEvent.SECURITY_ERROR,super.onSecurityError,false,0,true);
         this.§_-XD§.addEventListener(Event.OPEN,§_-AIN§,false,0,true);
         try
         {
            this.§_-XD§.load(url);
         }
         catch(e:SecurityError)
         {
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
      
      override protected function onComplete(param1:Event) : void
      {
         var event:Event = param1;
         _data = event.target.data;
         try
         {
            _content = new XML(this.§_-XD§.data);
         }
         catch(e:Error)
         {
            _content = null;
            _data = null;
            _status = §_-0DC§;
            dispatchEvent(§_-5IH§(e));
         }
         super.onComplete(event);
      }
   }
}

