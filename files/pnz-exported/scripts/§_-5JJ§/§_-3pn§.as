package §_-5JJ§
{
   import §_-0QS§.§_-A2I§;
   import §_-1MT§.§_-593§;
   import §_-4RH§.§_-8Lk§;
   import §_-5G6§.§_-ADg§;
   import §_-6-L§.§_-2Rb§;
   import §_-786§.§_-CRy§;
   import §_-7xl§.§_-7VJ§;
   import §_-A2M§.§_-4Ba§;
   import §_-AaA§.§_-5Kl§;
   import §_-GM§.Context;
   import com.greensock.TweenLite;
   import flash.display.MovieClip;
   import flash.events.ErrorEvent;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.net.URLLoader;
   import flash.net.URLLoaderDataFormat;
   import flash.net.URLRequest;
   import flash.text.TextField;
   import flash.utils.ByteArray;
   import penzville.Config;
   
   public class §_-3pn§ extends §_-AsP§
   {
      protected static const §_-9xX§:String = "cityPreloader";
      
      private static const §_-7wo§:Number = 1 / Config.§_-5bP§;
      
      private static const §_-B5X§:String = "_";
      
      private var _etag:String = null;
      
      protected var §_-3Ly§:String = null;
      
      protected var _content:§_-7VJ§;
      
      private var §_-554§:MovieClip = null;
      
      private var §_-9yq§:MovieClip = null;
      
      private var _progressBar:MovieClip = null;
      
      protected var §_-AG7§:TextField = null;
      
      private var §_-5Sl§:Array = [];
      
      private var §_-9M7§:int = 0;
      
      private var §_-BjE§:Boolean = false;
      
      private var §_-6lY§:Boolean = false;
      
      private var §_-1Yj§:Boolean = false;
      
      private var §_-B7O§:int = 1711426;
      
      private var §_-0ha§:§_-A2I§;
      
      private var §_-6g7§:Number;
      
      private var §_-3FT§:Number;
      
      private var §_-CeA§:Boolean = false;
      
      public function §_-3pn§(param1:Array = null)
      {
         super(param1);
      }
      
      override public function init() : void
      {
         super.init();
         §_-34M§.alpha = 0;
         this.§_-0ha§ = Config.§_-3vG§();
         this.§_-5Sl§ = this.§_-0ha§.§_-mj§(Config.locale);
         this.§_-B7O§ = this.§_-0ha§.bgColor;
         this.§_-3Ly§ = this.§_-0ha§.url;
         this.§_-6lY§ = this.§_-0ha§.stretchLogo;
         this.§_-1Yj§ = this.§_-0ha§.fillScreen;
         this.drawBackground();
      }
      
      override protected function loadPreloaderData() : void
      {
         var cache:§_-593§;
         var task:§_-4Ba§;
         if(this.§_-3Ly§ == null || this.§_-3Ly§.length == 0)
         {
            this.§_-Asy§("Error: Cannot load preloader resources, url is empty.");
            return;
         }
         cache = Context.instance.wrapperCache;
         task = cache.isActive() ? cache.§_-42o§(§_-9xX§,this.§_-3Ly§) : §_-4Ba§.resolve({"result":false});
         task.then(function(param1:Object):void
         {
            var _loc2_:URLLoader = null;
            var _loc3_:URLRequest = null;
            _etag = param1.etag;
            if(param1.result)
            {
               Context.instance.wrapperCache.getSwf(§_-9xX§,§_-70U§,§_-6th§);
            }
            else
            {
               _loc2_ = new URLLoader();
               _loc2_.dataFormat = URLLoaderDataFormat.BINARY;
               _loc2_.addEventListener(ProgressEvent.PROGRESS,§_-6th§,false,0,true);
               _loc2_.addEventListener(Event.COMPLETE,§_-C7N§,false,0,true);
               _loc2_.addEventListener(IOErrorEvent.IO_ERROR,onError,false,0,true);
               _loc2_.addEventListener(IOErrorEvent.NETWORK_ERROR,onError,false,0,true);
               _loc2_.addEventListener(IOErrorEvent.DISK_ERROR,onError,false,0,true);
               _loc2_.addEventListener(IOErrorEvent.VERIFY_ERROR,onError,false,0,true);
               _loc3_ = new URLRequest(§_-3Ly§ + (Config.production ? "" : "?noCache=" + new Date().getTime()));
               _loc2_.load(_loc3_);
            }
         });
      }
      
      protected function §_-C7N§(param1:Event) : void
      {
         var _loc2_:ByteArray = param1.target.data as ByteArray;
         Context.instance.wrapperCache.saveSwf(§_-9xX§,this._etag,_loc2_);
         §_-34M§.alpha = 1;
         this.§_-70U§(_loc2_);
      }
      
      protected function §_-70U§(param1:ByteArray) : void
      {
         var data:ByteArray = param1;
         §_-8Lk§.§_-7mv§(data,§_-9xX§).then(function(param1:§_-7VJ§):void
         {
            _content = param1;
            §_-6Nl§();
         });
      }
      
      protected function drawBackground() : void
      {
         §_-34M§.graphics.clear();
         §_-34M§.graphics.beginFill(this.§_-B7O§);
         §_-34M§.graphics.drawRect(0,0,Config.§_-ApK§,Config.§_-AoU§);
         §_-34M§.graphics.endFill();
      }
      
      protected function §_-6Nl§() : void
      {
         var preloaderName:String;
         var progressBarName:String;
         var text:String;
         var hintId:int = 0;
         this.drawBackground();
         preloaderName = "preloaderLogo";
         if(this.§_-0ha§.§_-CSl§ != null && this.§_-0ha§.§_-CSl§.length != 0)
         {
            preloaderName += §_-B5X§ + this.§_-0ha§.§_-CSl§;
         }
         this.§_-554§ = this._content.createMovieClip(preloaderName);
         this.§_-554§.x = Config.§_-50z§ / 2 - this.§_-554§.width / 2;
         this.§_-554§.y = 0;
         this.§_-6g7§ = this.§_-554§.width;
         this.§_-3FT§ = this.§_-554§.height;
         this.§_-554§.alpha = 0;
         TweenLite.to(this.§_-554§,1,{"alpha":1});
         try
         {
            this.§_-554§.gotoAndStop(Config.locale);
         }
         catch(e:ArgumentError)
         {
            §_-554§.gotoAndStop(0);
         }
         §_-34M§.addChild(this.§_-554§);
         progressBarName = "progressBar";
         if(this.§_-0ha§.§_-CSl§ != null && this.§_-0ha§.§_-CSl§.length != 0)
         {
            progressBarName += §_-B5X§ + this.§_-0ha§.§_-CSl§;
         }
         this._progressBar = this._content.createMovieClip(progressBarName);
         this._progressBar.scaleX = §_-7wo§;
         this._progressBar.scaleY = §_-7wo§;
         this.§_-9M7§ = this._progressBar.width > 1400 ? int(this._progressBar.width / 2) : int(this._progressBar.width);
         this._progressBar.x = Config.§_-50z§ / 2 - this.§_-9M7§ / 2 - 2;
         this._progressBar.y = Config.§_-6Z0§ - this._progressBar.height - 10;
         this._progressBar.gotoAndStop(0);
         this._progressBar.alpha = 0;
         TweenLite.to(this._progressBar,1,{"alpha":1});
         §_-34M§.addChild(this._progressBar);
         text = "";
         if(this.§_-5Sl§.length > 0)
         {
            hintId = §_-2Rb§.§_-3GS§(0,this.§_-5Sl§.length);
            if(hintId >= this.§_-5Sl§.length)
            {
               hintId = int(this.§_-5Sl§.length - 1);
            }
            text = this.§_-5Sl§[hintId] + " ";
         }
         this.createTextField(text);
         this.§_-AG7§.alpha = 0;
         TweenLite.to(this.§_-AG7§,1,{"alpha":1});
         this.§_-BjE§ = true;
         §_-8Et§();
         this.resize();
      }
      
      protected function createTextField(param1:String) : void
      {
         this.§_-AG7§ = §_-5Kl§.createTextField(0,0,param1,§_-5Kl§.§_-AV5§,{"color":this.§_-0ha§.textColor});
         this.§_-AG7§.width = Config.§_-50z§;
         this.§_-AG7§.text = param1;
         var _loc2_:int = this._progressBar == null ? int(Config.§_-6Z0§ / 2 - this.§_-AG7§.height / 2) : int(this._progressBar.y);
         this.§_-AG7§.y = _loc2_ - this.§_-AG7§.height - 10;
         §_-34M§.addChild(this.§_-AG7§);
         var _loc3_:String = "Logo";
         if(this._content.hasDefinition(_loc3_))
         {
            this.§_-9yq§ = this._content.createMovieClip(_loc3_);
            this.§_-9yq§.x = Config.§_-50z§ / 2 - this.§_-9yq§.width / 2;
            this.§_-9yq§.y = this.§_-AG7§.y - this.§_-9yq§.height - 3;
            this.§_-9yq§.alpha = 0;
            TweenLite.to(this.§_-9yq§,1,{"alpha":1});
            §_-34M§.addChild(this.§_-9yq§);
         }
      }
      
      override protected function resize() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         if(!this.§_-BjE§)
         {
            return;
         }
         this.drawBackground();
         this._progressBar.x = Config.§_-50z§ / 2 - this.§_-9M7§ / 2 - 2;
         this._progressBar.y = Config.§_-6Z0§ - this._progressBar.height - 10;
         this.§_-AG7§.width = Config.§_-50z§;
         this.§_-AG7§.y = this._progressBar.y - this.§_-AG7§.height - 10;
         if(this.§_-1Yj§)
         {
            _loc1_ = int(Config.§_-6Z0§);
            _loc2_ = Config.§_-6Z0§ * this.§_-6g7§ / this.§_-3FT§;
            if(_loc2_ < Config.§_-50z§)
            {
               _loc2_ = int(Config.§_-50z§);
               _loc1_ = Config.§_-50z§ * this.§_-3FT§ / this.§_-6g7§;
            }
            this.§_-554§.scaleX = _loc2_ / this.§_-6g7§;
            this.§_-554§.scaleY = _loc1_ / this.§_-3FT§;
            this.§_-554§.x = Config.§_-50z§ / 2 - _loc2_ / 2;
            this.§_-554§.y = Config.§_-6Z0§ / 2 - _loc1_ / 2;
         }
         else
         {
            _loc3_ = this.§_-6lY§ ? int(Config.§_-6Z0§) : (this.§_-AG7§.text.length > 0 ? int(this.§_-AG7§.y) : int(this._progressBar.y));
            this.§_-554§.height = _loc3_;
            this.§_-554§.width = this.§_-6g7§ * this.§_-554§.height / this.§_-3FT§;
            this.§_-554§.x = Config.§_-50z§ / 2 - this.§_-554§.width / 2;
            this.§_-554§.y = 0;
         }
         if(this.§_-9yq§ != null)
         {
            this.§_-9yq§.scaleX = §_-7wo§;
            this.§_-9yq§.scaleY = §_-7wo§;
            this.§_-9yq§.x = Config.§_-50z§ / 2 - this.§_-9yq§.width / 2;
            this.§_-9yq§.y = this.§_-AG7§.y - this.§_-9yq§.height;
         }
      }
      
      protected function §_-6th§(param1:ProgressEvent) : void
      {
         §_-34M§.alpha = param1.bytesLoaded / param1.bytesTotal;
      }
      
      protected function onError(param1:ErrorEvent) : void
      {
         this.§_-CeA§ = true;
         §_-ADg§.§_-9CD§(Context.§_-2BT§.adapter.userId,param1.text);
         this.§_-Asy§(param1.toString() + "\n" + this.§_-3Ly§ + "\n\n Loading... 0%");
         §_-8Et§();
      }
      
      override protected function onContentProgress(param1:§_-CRy§) : void
      {
         if(isNaN(param1.§_-3nI§))
         {
            return;
         }
         var _loc2_:Number = Math.floor(param1.§_-3nI§ * 100);
         if(this._progressBar != null)
         {
            this._progressBar.gotoAndStop(_loc2_);
         }
         if(this.§_-CeA§ && this.§_-AG7§ != null)
         {
            this.§_-AG7§.text = this.§_-AG7§.text.replace(/([0-9])+%/,_loc2_ + "%");
         }
      }
      
      override protected function onContentLoaded(param1:§_-CRy§) : void
      {
         if(this._progressBar != null)
         {
            this._progressBar.visible = false;
         }
         if(this.§_-AG7§ != null)
         {
            this.§_-AG7§.visible = false;
         }
         super.onContentLoaded(param1);
         §_-CcW§();
      }
      
      override protected function onContentError(param1:§_-CRy§) : void
      {
         super.onContentError(param1);
         if(this.§_-AG7§ != null)
         {
            this.§_-AG7§.text = §_-8r2§[Config.locale];
         }
      }
      
      override protected function onConfigValidateError(param1:§_-CRy§) : void
      {
         super.onConfigValidateError(param1);
         if(this.§_-AG7§ != null)
         {
            this.§_-AG7§.text = §_-6SS§[Config.locale];
         }
      }
      
      private function §_-Asy§(param1:String) : void
      {
         §_-34M§.alpha = 1;
         if(this.§_-AG7§ == null)
         {
            this.createTextField(param1);
         }
         else
         {
            this.§_-AG7§.text = param1;
         }
      }
      
      override public function destroy() : void
      {
         if(destroyed)
         {
            return;
         }
         this.§_-554§ = null;
         this._progressBar = null;
         super.destroy();
      }
   }
}

