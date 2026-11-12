package penzville
{
   import §_-05v§.§_-9me§;
   import §_-0Bb§.§_-38O§;
   import §_-0uA§.§_-3YE§;
   import §_-1Q2§.§_-5fo§;
   import §_-1iV§.§_-1J2§;
   import §_-1ks§.§_-9nE§;
   import §_-1t9§.§_-4Wb§;
   import §_-1x4§.FacebookAdapter;
   import §_-2xw§.§_-CGQ§;
   import §_-38V§.§_-1F§;
   import §_-3TY§.§_-5I8§;
   import §_-4Ms§.Hint;
   import §_-4UL§.§_-1Z6§;
   import §_-5G6§.§_-BS2§;
   import §_-6BB§.§_-1KD§;
   import §_-6BB§.§_-8BS§;
   import §_-6JL§.§_-B9P§;
   import §_-6R5§.§_-0vr§;
   import §_-7nb§.§_-B00§;
   import §_-9Bv§.§_-8fL§;
   import §_-9VF§.§_-3yI§;
   import §_-9VF§.§_-5ab§;
   import §_-A2M§.§_-4Ba§;
   import §_-AKx§.§_-4OH§;
   import §_-AKx§.§_-6Vi§;
   import §_-AaA§.§_-7AJ§;
   import §_-AaA§.§_-Bg7§;
   import §_-BiZ§.§_-11h§;
   import §_-DG§.§_-3nQ§;
   import §_-GM§.Context;
   import §_-SD§.CursorManager;
   import §_-kr§.§_-C1S§;
   import flash.display.StageAlign;
   import flash.display.StageScaleMode;
   import flash.system.ApplicationDomain;
   import flash.system.Capabilities;
   import flash.system.Security;
   import flash.text.TextField;
   import flash.text.TextFormat;
   import flash.utils.ByteArray;

   public class Application extends §_-1J2§
   {
      public static const §_-AuC§:Class = §_-7Vf§;

      public static const §_-3c8§:Class = §_-3c9§;

      public static const §_-4a5§:int = 0;

      public static const §_-4p5§:int = 1;

      public static const §_-9NL§:int = 2;

      public static const §_-APR§:int = 3;

      public static const §_-1Ui§:int = 4;

      public static const §_-9P9§:String = "nav";

      protected static var _instance:Application = null;

      public var §_-41b§:Class = §_-C37§;

      public var §_-1xC§:Class = §_-uf§;

      public var §_-56i§:Class = §_-B-P§;

      public var §_-2It§:Class = §_-7GE§;

      public var §_-1Gh§:Class = §_-1j2§;

      public var §_-3S0§:Class = §_-BwT§;

      public var §_-7na§:Class = §_-Blo§;

      public var §_-3nK§:Class = §_-1k§;

      public var §_-4UY§:Class = §_-0bf§;

      public var §_-0KJ§:Class = §_-3Fy§;

      public var §_-6oA§:Class = §_-6CJ§;

      public var §_-xj§:Class = §_-1qu§;

      protected var §_-25E§:§_-7AJ§ = null;

      protected var _status:int = 0;

      private var §_-dbgField§:TextField = null;

      public function Application()
      {
         super();
         if(Context.instance.§_-AIA§.isMobile)
         {
            Config.§_-C6c§ = Config.§_-5bP§ * Capabilities.screenDPI / Config.§_-1mF§;
            Config.§_-0pB§ = Config.§_-5bP§ * Capabilities.screenDPI / Config.§_-1mF§;
         }
         _instance = this;
         §_-3YE§.instance.§_-5Kw§ = §_-3YE§.§_-3D5§;
         try
         {
            Security.allowDomain("*");
         }
         catch(e:Error)
         {
         }
         §_-38O§.instance.addEventListener(§_-0vr§.§_-1HL§,this.§_-BO6§);
      }

      public static function get instance() : Application
      {
         return _instance;
      }

      public function §_-DBGBOOM§(param1:String) : void
      {
         try
         {
            if(this.§_-dbgField§ == null)
            {
               this.§_-dbgField§ = new TextField();
               this.§_-dbgField§.x = 10;
               this.§_-dbgField§.y = 10;
               this.§_-dbgField§.width = 900;
               this.§_-dbgField§.height = 550;
               this.§_-dbgField§.multiline = true;
               this.§_-dbgField§.wordWrap = true;
               this.§_-dbgField§.background = true;
               this.§_-dbgField§.backgroundColor = 16777215;
               this.§_-dbgField§.border = true;
               this.§_-dbgField§.borderColor = 16711680;
               this.§_-dbgField§.textColor = 16711680;
               this.§_-dbgField§.mouseEnabled = false;
               var fmt:TextFormat = new TextFormat();
               fmt.size = 13;
               fmt.bold = true;
               this.§_-dbgField§.defaultTextFormat = fmt;
            }
            if(this.§_-dbgField§.parent == null)
            {
               addChild(this.§_-dbgField§);
            }
            this.§_-dbgField§.appendText(param1 + "\n");
         }
         catch(eIgnored:*)
         {
         }
      }

      protected function §_-Am3§() : void
      {
         var _loc1_:§_-1Z6§ = null;
         §_-3YE§.info("Init context menu");
         if(!Config.disableContextMenu)
         {
            _loc1_ = this.createContextMenu();
            contextMenu = _loc1_.contextMenu;
         }
      }

      protected function createContextMenu() : §_-1Z6§
      {
         return new §_-1Z6§();
      }

      protected function §_-10p§() : void
      {
         var _loc1_:String = null;
         var _loc2_:String = null;
         §_-3YE§.info("Init social connector");
         Context.§_-2BT§ = §_-5I8§.§_-7BS§(this);
         §_-3YE§.info("Adapter: " + Context.§_-2BT§.adapter.socialNetwork);
         Context.§_-2BT§.§_-0Gc§ = this.§_-3Dx§;
         Context.§_-9q-§.init();
         if(Context.§_-2BT§.adapter is FacebookAdapter)
         {
            §_-C1S§.instance.§_-0MS§ = (Context.§_-2BT§.adapter as FacebookAdapter).countryCode;
         }
         else if(Context.§_-2BT§.adapter.socialNetwork == §_-8BS§.§_-Uu§ || Context.§_-2BT§.adapter.socialNetwork == §_-8BS§.§_-BTG§)
         {
            _loc1_ = Context.§_-2BT§.adapter.userId;
            _loc2_ = _loc1_ != null && _loc1_.length > 0 ? _loc1_.substr(_loc1_.length - 1,1) : "0";
            §_-C1S§.instance.§_-0MS§ = int(_loc2_) % 2 == 0 ? "worldssl" : "default";
         }
      }

      protected function initWrapperParams() : Object
      {
         if(Context.instance.§_-AIA§.§_-3OB§)
         {
         }
         return ApplicationDomain.currentDomain.hasDefinition("container.WrapperParams") ? ApplicationDomain.currentDomain.getDefinition("container.WrapperParams") : {};
      }

      protected function §_-1iH§(param1:Object) : void
      {
         §_-3YE§.info("Init resource versions");
         if(param1 != null && Boolean(param1.hasOwnProperty("versions")))
         {
            §_-5fs§.init(param1["versions"]);
         }
      }

      protected function §_-A-b§() : void
      {
         §_-3YE§.info("Init shared manager");
         if(parent != null && parent.parent != null && Boolean(parent.parent.hasOwnProperty("sharedManager")))
         {
            §_-2Vb§.init(parent.parent["sharedManager"]);
         }
      }

      protected function §_-59B§(param1:Object) : §_-4Ba§
      {
         var tasks:Array;
         var appPatch:§_-8fL§;
         var config:§_-8fL§ = null;
         var task:§_-4Ba§ = null;
         var params:Object = param1;
         §_-3YE§.info("Init configuration");
         Config.init(§_-3c8§);
         tasks = [];
         appPatch = this.getAppConfigPatch();
         if(appPatch != null)
         {
            Config.appconfig.§_-C3a§(appPatch);
         }
         if(params != null && Boolean(params.hasOwnProperty("configuration")))
         {
            config = new §_-8fL§();
            task = config.§_-7Tc§(params["configuration"]).then(function():void
            {
               Config.appconfig.§_-C3a§(config);
            });
            tasks.push(task);
         }
         return §_-4Ba§.all(tasks).then(function():void
         {
            Config.profile = Config.appconfig.getString("profile");
            §_-C1S§.instance.init();
         });
      }

      protected function getAppConfigPatch() : §_-8fL§
      {
         return null;
      }

      protected function prepareModules() : void
      {
      }

      protected function §_-3Dx§(param1:§_-1KD§) : void
      {
         §_-3YE§.§_-ANW§("Type: " + param1.type + " Code: " + param1.code + ". Message: " + param1.message,Context.§_-2BT§.adapter.socialNetwork);
      }

      override protected function handleUncaughtError(param1:String) : void
      {
         var _loc2_:§_-B00§ = Context.§_-3hG§;
         var _loc3_:String = "LocId: " + (_loc2_ != null ? _loc2_.locationId : "");
         §_-3YE§.§_-ANW§(param1,_loc3_);
         this.§_-DBGBOOM§("UNCAUGHT: " + param1 + " | " + _loc3_);
      }

      override protected function initApplication() : void
      {
         super.initApplication();
         this.§_-5bu§();
      }

      protected function §_-5bu§() : §_-4Ba§
      {
         §_-3YE§.info("Init application");
         stage.scaleMode = StageScaleMode.NO_SCALE;
         stage.align = StageAlign.TOP_LEFT;
         Config.§_-ApK§ = Config.§_-50z§ = stage.stageWidth / Config.§_-C6c§;
         Config.§_-AoU§ = Config.§_-6Z0§ = stage.stageHeight / Config.§_-C6c§;
         var _loc1_:Object = this.initWrapperParams();
         if(_loc1_.hasOwnProperty("flashVars"))
         {
            flashVars = _loc1_.flashVars;
         }
         this.§_-1iH§(_loc1_);
         this.§_-A-b§();
         return §_-4Ba§.sequence([this.§_-59B§,this.§_-10p§,this.§_-Am3§,this.prepareModules,this.initLogger,this.initUi,this.§_-2jC§,this.installApp],this,_loc1_);
      }

      private function installApp() : void
      {
         var defaultPermissions:Array = §_-11h§.§_-7GJ§;
         if(Context.§_-2BT§.adapter.socialNetwork == §_-8BS§.§_-BOa§)
         {
            defaultPermissions = [];
         }
         §_-3YE§.info("Install app");
         Context.§_-2BT§.isInstalled(defaultPermissions,function(param1:Boolean):void
         {
            §_-3YE§.info("Installed " + param1);
            if(param1)
            {
               initLoading();
            }
            else
            {
               §_-3YE§.info("Login Screen");
               currentScreen = new §_-11h§();
            }
         });
      }

      private function §_-2jC§() : void
      {
         §_-3YE§.info("Init embeded animations");
         var _loc1_:ByteArray = new §_-AuC§() as ByteArray;
         §_-1F§.loadXML(new XML(_loc1_.readUTFBytes(_loc1_.length)));
      }

      protected function initLogger() : void
      {
         var writer:§_-BS2§ = null;
         if(Config.production)
         {
            writer = new §_-BS2§(function(param1:String, param2:Array):void
            {
               Context.§_-759§.§_-4er§(param1,param2);
            });
            §_-3YE§.info("Init server logger");
            §_-3YE§.instance.§_-9XE§(writer);
         }
      }

      protected function initUi() : void
      {
         §_-3YE§.info("Init UI");
         this.§_-25E§ = new §_-7AJ§();
         addChild(this.§_-25E§);
         this.§_-25E§.scaleX = Config.§_-C6c§;
         this.§_-25E§.scaleY = Config.§_-C6c§;
         Hint.container = this.§_-25E§.§_-C6l§;
         §_-CGQ§.§_-0Tp§ = this.§_-25E§.§_-Ca7§;
         §_-Bg7§.instance.container = this.§_-25E§.§_-3KP§;
         §_-Bg7§.instance.§_-AAE§(Config.§_-50z§,Config.§_-6Z0§);
         §_-Bg7§.instance.modalFog = new §_-6Vi§();
         Context.§_-8Un§.init();
         Context.§_-CLP§.addEventListener(§_-B9P§.RESIZE,this.onResize);
      }

      private function onResize(param1:§_-B9P§) : void
      {
         §_-Bg7§.instance.§_-AAE§(Config.§_-50z§,Config.§_-6Z0§);
      }

      public function run() : void
      {
         this.status = Application.§_-9NL§;
         if(!Context.instance.§_-AIA§.isMobile)
         {
            this.§_-25E§.addChild(CursorManager.instance);
         }
         if(!Config.showCursor)
         {
            CursorManager.instance.disable();
         }
         Context.§_-685§.init();
         Context.craftManager.init();
         Context.§_-2BT§.getUsersProfiles([Context.§_-2BT§.adapter.userId],this.onGetUserProfile);
      }

      private function onGetUserProfile(param1:Array) : void
      {
         if(param1.length == 0)
         {
            §_-4OH§.§_-B5P§(Context.§_-5o8§.message("error"),Context.§_-5o8§.message("userNotFoundError"));
            return;
         }
         var _loc2_:§_-4Wb§ = param1.shift() as §_-4Wb§;
         var _loc3_:§_-3yI§ = new §_-3yI§();
         _loc3_.§_-Ark§(_loc2_);
         _loc3_.lang = Config.locale;
         if(Context.§_-2BT§.adapter is §_-3nQ§)
         {
            _loc3_.lang = (Context.§_-2BT§.adapter as §_-3nQ§).locale;
         }
         _loc3_.locale = Config.locale;
         if(Context.§_-2BT§.adapter.socialNetwork == §_-8BS§.§_-BOa§ && _loc2_.locale != "")
         {
            _loc3_.locale = _loc2_.locale;
         }
         else
         {
            _loc3_.locale = Config.locale;
         }
         if(Context.§_-2BT§.adapter is §_-9me§)
         {
            _loc3_.locale = (Context.§_-2BT§.adapter as §_-9me§).locale;
            _loc3_.lang = (Context.§_-2BT§.adapter as §_-9me§).locale;
         }
         Context.player = this.createPlayer();
         Context.player.userInfo = _loc3_;
         this.currentScreen = null;
         this.initScreen();
         §_-5fo§.instance.configure(Config.§_-7sT§(),_loc3_.socialId);
      }

      protected function §_-BO6§(param1:§_-0vr§) : void
      {
      }

      protected function createPlayer() : §_-5ab§
      {
         return new §_-5ab§();
      }

      public function initLoading() : void
      {
         §_-3YE§.info("Init loading");
         this.status = §_-4p5§;
      }

      protected function initScreen() : void
      {
      }

      public function set currentScreen(param1:§_-9nE§) : void
      {
         if(param1 != null)
         {
            §_-CGQ§.§_-3TJ§(param1);
         }
         else
         {
            §_-CGQ§.§_-173§();
         }
      }

      public function get uiLayout() : §_-7AJ§
      {
         return this.§_-25E§;
      }

      public function get status() : int
      {
         return this._status;
      }

      public function set status(param1:int) : void
      {
         if(this._status == §_-APR§)
         {
            return;
         }
         this._status = param1;
      }
   }
}
