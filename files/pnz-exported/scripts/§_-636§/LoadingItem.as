package §_-636§
{
   import §_-5E9§.getTimer;
   import §_-7xl§.§_-8Ks§;
   import §_-Aq0§.URL;
   import §_-Xm§.MassLoader;
   import flash.events.ErrorEvent;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.HTTPStatusEvent;
   import flash.events.ProgressEvent;
   import flash.events.TimerEvent;
   import flash.net.URLRequest;
   import flash.utils.Timer;
   
   public class LoadingItem extends EventDispatcher implements §_-8Ks§
   {
      public static const §_-012§:int = 0;
      
      public static const §_-ACP§:int = 1;
      
      public static const §_-3Tu§:int = 2;
      
      public static const §_-A8A§:int = 2;
      
      public static const §_-0DC§:int = 4;
      
      protected var _status:int = 0;
      
      protected var §_-AcP§:String;
      
      protected var _url:URLRequest;
      
      protected var §_-58I§:Boolean = false;
      
      protected var §_-uv§:Array = [];
      
      protected var §_-43F§:String;
      
      protected var _startTime:int = 0;
      
      protected var §_-1vu§:int = -1;
      
      protected var §_-BE1§:int = 0;
      
      protected var §_-3JI§:int = 0;
      
      protected var §_-2xX§:Boolean = false;
      
      protected var §_-9kZ§:int = 3;
      
      protected var §_-BcV§:int = 0;
      
      protected var _content:*;
      
      protected var _data:*;
      
      protected var §_-1ds§:int;
      
      protected var §_-Bw4§:Number;
      
      protected var §_-14P§:Number = 1;
      
      protected var §_-Abk§:Number;
      
      protected var §_-8r6§:int;
      
      protected var §_-A91§:int;
      
      protected var §_-8gr§:int;
      
      protected var §_-AKE§:MassLoader;
      
      protected var _timer:Timer;
      
      private var _destroyed:Boolean = false;
      
      public function LoadingItem(param1:MassLoader, param2:URLRequest, param3:String)
      {
         super();
         this.§_-AKE§ = param1;
         this._url = param2;
         var _loc4_:URL = new URL(this._url.url);
         this.§_-43F§ = _loc4_.§_-4yN§;
         this.§_-AcP§ = param3;
      }
      
      public function setOptions(param1:Object) : void
      {
         if(param1.hasOwnProperty(MassLoader.§_-1T5§))
         {
            this.§_-2xX§ = Boolean(param1[MassLoader.§_-1T5§]);
         }
         if(param1.hasOwnProperty(MassLoader.§_-9wb§))
         {
            this.§_-9kZ§ = int(param1[MassLoader.§_-9wb§]);
         }
         if(param1.hasOwnProperty(MassLoader.§_-2E4§))
         {
            this.§_-14P§ = Number(param1[MassLoader.§_-2E4§]);
         }
         if(param1.hasOwnProperty(MassLoader.§_-0KY§))
         {
            this.§_-58I§ = Boolean(param1[MassLoader.§_-0KY§]);
         }
      }
      
      public function load() : void
      {
         var _loc1_:String = null;
         if(this._status != §_-012§)
         {
            return;
         }
         if(!this.§_-2xX§)
         {
            _loc1_ = "loaderNoCache=" + this.§_-AcP§ + "_" + int(Math.random() * 100 * getTimer());
            if(this._url.url.indexOf("?") == -1)
            {
               this._url.url += "?" + _loc1_;
            }
            else
            {
               this._url.url += "&" + _loc1_;
            }
         }
         this.§_-Vl§();
      }
      
      protected function §_-Vl§() : void
      {
         this._status = LoadingItem.§_-ACP§;
         this._startTime = getTimer();
         this._timer = new Timer(this.§_-AKE§.§_-1Xt§,1);
         this._timer.addEventListener(TimerEvent.TIMER_COMPLETE,this.§_-A1Q§);
         this._timer.start();
      }
      
      protected function §_-A1Q§(param1:TimerEvent) : void
      {
         this.stop();
         this.§_-15G§();
      }
      
      public function stop() : void
      {
         if(this._status == LoadingItem.§_-A8A§ || this._status == LoadingItem.§_-3Tu§)
         {
            return;
         }
         this._status = §_-A8A§;
         if(this._timer != null)
         {
            this._timer.stop();
         }
      }
      
      public function removeListeners() : void
      {
      }
      
      public function get id() : String
      {
         return this.§_-AcP§;
      }
      
      public function get content() : *
      {
         return this._content;
      }
      
      public function get data() : *
      {
         return this._data;
      }
      
      public function get status() : int
      {
         return this._status;
      }
      
      public function get loading() : Boolean
      {
         return this._status == LoadingItem.§_-ACP§;
      }
      
      public function get loaded() : Boolean
      {
         return this._status == LoadingItem.§_-3Tu§;
      }
      
      public function get stopped() : Boolean
      {
         return this._status == LoadingItem.§_-A8A§;
      }
      
      public function get url() : URLRequest
      {
         return this._url;
      }
      
      public function get §_-AMP§() : String
      {
         var _loc1_:URL = new URL(this._url.url);
         this.§_-43F§ = _loc1_.§_-4yN§;
         return this.§_-43F§;
      }
      
      public function get maxTries() : int
      {
         return this.§_-9kZ§;
      }
      
      public function get §_-4mH§() : int
      {
         return this.§_-BcV§;
      }
      
      public function get bytesLoaded() : int
      {
         return this.§_-BE1§;
      }
      
      public function get bytesTotal() : int
      {
         return this.§_-3JI§;
      }
      
      public function get §_-8tF§() : Number
      {
         return this.§_-Abk§;
      }
      
      public function get weight() : Number
      {
         return this.§_-14P§;
      }
      
      public function get downloadTime() : int
      {
         return this.§_-8gr§;
      }
      
      public function get fromMirror() : Boolean
      {
         return this.§_-58I§;
      }
      
      protected function §_-15G§() : void
      {
         ++this.§_-BcV§;
         if(this.§_-BcV§ < this.§_-9kZ§)
         {
            this._status = §_-012§;
            this.load();
         }
         else
         {
            this._status = §_-0DC§;
            if(!this.destroyed)
            {
               dispatchEvent(new ErrorEvent(ErrorEvent.ERROR,false,false,"Cannot load item (id=" + this.§_-AcP§ + "), all tries failed"));
            }
         }
      }
      
      protected function onInit(param1:Event) : void
      {
         dispatchEvent(param1);
      }
      
      protected function §_-3WF§(param1:HTTPStatusEvent) : void
      {
         this.§_-1vu§ = param1.status;
         dispatchEvent(param1);
      }
      
      protected function §_-6th§(param1:ProgressEvent) : void
      {
         this._timer.reset();
         this._timer.delay = this.§_-AKE§.§_-6f5§;
         this._timer.start();
         this.§_-BE1§ = param1.bytesLoaded;
         this.§_-3JI§ = param1.bytesTotal;
         this.§_-1ds§ = this.§_-3JI§ - this.§_-BE1§;
         this.§_-Bw4§ = this.§_-BE1§ / this.§_-3JI§;
         this.§_-Abk§ = this.§_-Bw4§ * this.§_-14P§;
         dispatchEvent(param1);
      }
      
      protected function onComplete(param1:Event) : void
      {
         this._timer.stop();
         this.§_-8r6§ = getTimer();
         this.§_-8gr§ = this.§_-8r6§ - this.§_-A91§;
         if(this.§_-8gr§ <= 0)
         {
            this.§_-8gr§ = 10;
         }
         this._status = §_-3Tu§;
         dispatchEvent(param1);
         param1.stopPropagation();
      }
      
      protected function onError(param1:ErrorEvent) : void
      {
         if(this._timer != null)
         {
            this._timer.stop();
         }
         if(param1 != null)
         {
            param1.stopPropagation();
         }
         this.§_-15G§();
      }
      
      protected function onSecurityError(param1:ErrorEvent) : void
      {
         this._status = §_-0DC§;
         param1.stopPropagation();
         this.§_-8KC§(param1);
      }
      
      protected function §_-AIN§(param1:Event) : void
      {
         this.§_-A91§ = getTimer();
         this._status = §_-ACP§;
         dispatchEvent(param1);
      }
      
      protected function §_-5IH§(param1:Error) : ErrorEvent
      {
         return new ErrorEvent(ErrorEvent.ERROR,false,false,param1.message);
      }
      
      protected function §_-8KC§(param1:ErrorEvent) : void
      {
         dispatchEvent(new ErrorEvent(param1.type,false,false,param1.text));
      }
      
      override public function toString() : String
      {
         return "LoadingItem(url: " + this._url.url + ", status: " + this.status + ") ";
      }
      
      public function get destroyed() : Boolean
      {
         return this._destroyed;
      }
      
      public function destroy() : void
      {
         if(this.destroyed)
         {
            return;
         }
         this._content = null;
         this._data = null;
         this._destroyed = true;
      }
   }
}

