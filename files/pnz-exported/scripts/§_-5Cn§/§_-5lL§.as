package §_-5Cn§
{
   import §_-1Fx§.§_-5n7§;
   import §_-6-L§.DisplayUtils;
   import §_-6-L§.§_-49j§;
   import §_-6JL§.§_-B9P§;
   import §_-AaA§.§_-5Kl§;
   import §_-GM§.Context;
   import flash.display.DisplayObject;
   import flash.display.Loader;
   import flash.display.LoaderInfo;
   import flash.events.ErrorEvent;
   import flash.events.Event;
   import flash.events.ProgressEvent;
   import flash.geom.Rectangle;
   import flash.net.URLRequest;
   import flash.system.ApplicationDomain;
   import flash.system.Capabilities;
   import flash.system.LoaderContext;
   import flash.system.SecurityDomain;
   import flash.text.TextField;
   import penzville.Config;
   
   public class §_-5lL§ extends §_-5n7§
   {
      private static const §_-7Yt§:int = 1;
      
      private static const §_-Asx§:int = 2;
      
      private static const §_-1Bg§:int = 3;
      
      private var §_-1cf§:int = 0;
      
      private var §_-2e7§:Loader = null;
      
      private var §_-CIJ§:Number = 1;
      
      private var §_-rd§:DisplayObject = null;
      
      private var _message:DisplayObject = null;
      
      private var §_-8t5§:String = null;
      
      private var §_-9xp§:TextField = null;
      
      private var _scale:Number = 1;
      
      public function §_-5lL§(param1:String = "")
      {
         super();
         this.§_-8t5§ = param1;
         addEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
      }
      
      private function onAddedToStage(param1:Event) : void
      {
         removeEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
         this.init();
      }
      
      private function init() : void
      {
         this.§_-9xp§ = §_-5Kl§.createTextField(0,0,this.§_-8t5§,§_-5Kl§.§_-0iQ§);
         this.§_-9xp§.scaleX = this.§_-9xp§.scaleY = this._scale;
         this.§_-9xp§.x = Config.§_-50z§ / 2 - this.§_-9xp§.width / 2;
         this.§_-9xp§.y = Config.§_-6Z0§ - this.§_-9xp§.height - 20;
         addChild(this.§_-9xp§);
         this.currentStage = §_-7Yt§;
         Context.§_-CLP§.addEventListener(§_-B9P§.RESIZE,this.onResize);
      }
      
      private function onResize(param1:Event) : void
      {
         var _loc2_:Rectangle = null;
         _loc2_ = this.§_-8D§();
         if(this.§_-9xp§ != null)
         {
            this.§_-9xp§.scaleX = this.§_-9xp§.scaleY = this._scale;
            this.§_-9xp§.x = _loc2_.width / 2 - this.§_-9xp§.width / 2;
            this.§_-9xp§.y = _loc2_.height - this.§_-9xp§.height - 20;
         }
         if(this.§_-rd§ != null)
         {
            this.§_-rd§.scaleX = this.§_-rd§.scaleY = this._scale;
            this.§_-rd§.height = _loc2_.height;
            this.§_-rd§.width = this.§_-rd§.height * this.§_-CIJ§;
            this.§_-rd§.x = _loc2_.width / 2 - this.§_-rd§.width / 2;
            this.§_-rd§.y = _loc2_.height / 2 - this.§_-rd§.height / 2;
            if(this._message != null)
            {
               this._message.scaleX = this._message.scaleY = this._scale;
               this._message.x = this.§_-rd§.x + this.§_-rd§.width / 2 - this._message.width / 2;
               this._message.y = this.§_-rd§.y + this.§_-rd§.height - this._message.height - 50;
               addChild(this._message);
            }
         }
      }
      
      private function §_-8D§() : Rectangle
      {
         return new Rectangle(0,0,Config.§_-50z§ * Config.§_-C6c§,Config.§_-6Z0§ * Config.§_-C6c§);
      }
      
      private function set currentStage(param1:int) : void
      {
         this.§_-1cf§ = param1;
         switch(this.§_-1cf§)
         {
            case §_-7Yt§:
               this.§_-Uv§();
               break;
            case §_-Asx§:
               this.§_-11G§();
               break;
            case §_-1Bg§:
               this.§_-LX§();
         }
         if(this.§_-9xp§ != null)
         {
            DisplayUtils.§_-6zB§(this.§_-9xp§);
         }
      }
      
      private function §_-Uv§() : void
      {
         var _loc1_:String = Config.§_-3mO§;
         this.§_-46b§(_loc1_);
      }
      
      private function §_-11G§() : void
      {
         if(Config.appNotAvailableUrls.length == 0)
         {
            return;
         }
         var _loc1_:String = §_-49j§.random(Config.appNotAvailableUrls);
         if(_loc1_ != null)
         {
            this.§_-46b§(_loc1_);
         }
      }
      
      private function §_-46b§(param1:String) : void
      {
         var _loc2_:URLRequest = new URLRequest();
         _loc2_.url = param1;
         if(this.§_-2e7§ != null)
         {
            this.§_-LX§();
         }
         this.§_-2e7§ = new Loader();
         this.§_-2e7§.contentLoaderInfo.addEventListener(Event.COMPLETE,this.onLoadingComplete);
         this.§_-2e7§.contentLoaderInfo.addEventListener(ErrorEvent.ERROR,this.§_-2PH§);
         this.§_-2e7§.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS,this.§_-1oZ§);
         var _loc3_:SecurityDomain = null;
         if(Capabilities.playerType != "Desktop")
         {
            _loc3_ = Config.production ? SecurityDomain.currentDomain : null;
         }
         this.§_-2e7§.load(_loc2_,new LoaderContext(true,ApplicationDomain.currentDomain,_loc3_));
      }
      
      private function §_-LX§() : void
      {
         if(this.§_-2e7§ != null)
         {
            this.§_-2e7§.contentLoaderInfo.removeEventListener(Event.COMPLETE,this.onLoadingComplete);
            this.§_-2e7§.contentLoaderInfo.removeEventListener(ErrorEvent.ERROR,this.§_-2PH§);
            this.§_-2e7§.contentLoaderInfo.removeEventListener(ProgressEvent.PROGRESS,this.§_-1oZ§);
            this.§_-2e7§ = null;
         }
      }
      
      private function §_-1oZ§(param1:ProgressEvent) : void
      {
         dispatchEvent(param1);
      }
      
      private function §_-2PH§(param1:ErrorEvent) : void
      {
      }
      
      private function onLoadingComplete(param1:Event) : void
      {
         var _loc2_:DisplayObject = null;
         var _loc3_:DisplayObject = null;
         if(this.§_-1cf§ == §_-7Yt§)
         {
            _loc2_ = (param1.target as LoaderInfo).content;
            this.§_-jf§(_loc2_);
         }
         else if(this.§_-1cf§ == §_-Asx§)
         {
            _loc3_ = (param1.target as LoaderInfo).content;
            this.§_-7OY§(_loc3_);
         }
      }
      
      private function §_-jf§(param1:DisplayObject) : void
      {
         var _loc2_:Rectangle = null;
         if(param1 != null)
         {
            this.§_-rd§ = param1;
            _loc2_ = this.§_-8D§();
            this.§_-CIJ§ = this.§_-rd§.width / this.§_-rd§.height;
            this.§_-rd§.height = _loc2_.height;
            this.§_-rd§.width = this.§_-rd§.height * this.§_-CIJ§;
            this.§_-rd§.x = _loc2_.width / 2 - this.§_-rd§.width / 2;
            this.§_-rd§.y = _loc2_.height / 2 - this.§_-rd§.height / 2;
            addChild(this.§_-rd§);
         }
         this.currentStage = §_-1Bg§;
      }
      
      private function §_-7OY§(param1:DisplayObject) : void
      {
         if(param1 != null)
         {
            this._message = param1;
            this._message.scaleX = this._message.scaleY = this._scale;
            this._message.x = this.§_-rd§.x + this.§_-rd§.width / 2 - this._message.width / 2;
            this._message.y = this.§_-rd§.y + this.§_-rd§.height - this._message.height - 50;
            addChild(this._message);
         }
         this.currentStage = §_-1Bg§;
      }
   }
}

