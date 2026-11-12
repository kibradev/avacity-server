package §_-GM§
{
   import §_-08V§.§_-CDq§;
   import §_-0N8§.§_-0V9§;
   import §_-0gA§.§_-3dD§;
   import §_-0uA§.§_-3YE§;
   import §_-1iV§.§_-BkM§;
   import §_-1t9§.§_-7ba§;
   import §_-1x4§.FacebookAdapter;
   import §_-2U3§.ResourceManager;
   import §_-39l§.§_-5t6§;
   import §_-3TY§.§_-6k2§;
   import §_-3VF§.§_-0nG§;
   import §_-3na§.§_-CCU§;
   import §_-4UL§.§_-1Z6§;
   import §_-4UL§.§_-9e9§;
   import §_-5Cn§.§_-5lL§;
   import §_-5G6§.§_-0xX§;
   import §_-5G6§.§_-6H6§;
   import §_-5G6§.§_-9W5§;
   import §_-5JJ§.§_-3pn§;
   import §_-5Zh§.§_-AlG§;
   import §_-6-L§.§_-49j§;
   import §_-6-L§.§_-6aF§;
   import §_-6BB§.§_-8BS§;
   import §_-6Cn§.§_-5PQ§;
   import §_-6Cn§.§_-66r§;
   import §_-6JL§.§_-B9P§;
   import §_-6cs§.§_-3OJ§;
   import §_-6nL§.§_-6O§;
   import §_-7Hk§.§_-1U4§;
   import §_-7np§.ConsoleService;
   import §_-7tj§.§_-HK§;
   import §_-8-a§.§_-8RG§;
   import §_-8Hp§.§_-5KD§;
   import §_-8Q7§.§_-Bb7§;
   import §_-9Bv§.§_-8fL§;
   import §_-9PR§.§_-Bwy§;
   import §_-9VF§.§_-48g§;
   import §_-9VF§.§_-5ab§;
   import §_-9VF§.§_-8UL§;
   import §_-A2M§.§_-4Ba§;
   import §_-AKx§.§_-4OH§;
   import §_-AaA§.§_-Bjj§;
   import §_-Aq0§.§_-4n-§;
   import §_-Aq0§.§_-9db§;
   import §_-Aq0§.§_-Bs9§;
   import §_-BJ1§.§_-5y5§;
   import §_-BMw§.§_-Byu§;
   import §_-Btg§.§_-1s0§;
   import §_-Btg§.§_-8jl§;
   import §_-CLv§.§_-BDF§;
   import §_-PP§.§_-2Q-§;
   import §_-SD§.CursorManager;
   import §_-bm§.§_-1Rm§;
   import §_-kr§.§_-2ia§;
   import com.greensock.plugins.BezierPlugin;
   import com.greensock.plugins.BezierThroughPlugin;
   import com.greensock.plugins.ColorTransformPlugin;
   import com.greensock.plugins.FramePlugin;
   import com.greensock.plugins.GlowFilterPlugin;
   import com.greensock.plugins.ScrollRectPlugin;
   import com.greensock.plugins.TweenPlugin;
   import flash.net.URLRequestMethod;
   import flash.utils.ByteArray;
   import penzville.Application;
   import penzville.Config;
   
   public class §_-7VH§ extends Application
   {
      private static const §_-5sZ§:Class = §_-0gy§;
      
      public static const §_-3XV§:Class = §_-9hO§;
      
      private static var _instance:§_-7VH§ = null;
      
      private var §_-8L9§:Object;
      
      private var §_-CSu§:§_-2Q-§ = null;
      
      public function §_-7VH§()
      {
         Config.§_-37U§ = Config.§_-20b§;
         super();
         _instance = this;
      }
      
      public static function get instance() : §_-7VH§
      {
         return _instance;
      }
      
      public function start() : void
      {
         var _loc3_:§_-2ia§ = null;
         var _loc1_:Object = §_-BkM§.§_-n1§().loaderInfo.parameters;
         var _loc2_:Boolean = Boolean(_loc1_.hasOwnProperty("noContainer")) && Boolean(_loc1_["noContainer"]);
         if(_loc2_)
         {
            _loc3_ = new §_-2ia§();
            _loc3_.run(this.§_-5V9§);
         }
         else
         {
            this.§_-5V9§();
         }
      }
      
      override protected function initLogger() : void
      {
         §_-3YE§.instance.§_-8bB§();
         §_-3YE§.instance.§_-9XE§(new §_-6H6§());
         if(§_-9W5§.§_-3I7§())
         {
            §_-3YE§.instance.§_-9XE§(new §_-9W5§());
         }
         if(Context.§_-2BT§.adapter is §_-1U4§)
         {
            ConsoleService.instance.init(this);
            §_-5PQ§.init();
            §_-5PQ§.connect();
            §_-3YE§.instance.§_-9XE§(§_-66r§.instance);
            §_-3YE§.instance.§_-9XE§(ConsoleService.instance.console);
         }
         else
         {
            §_-3YE§.instance.§_-9XE§(new §_-0xX§(this));
         }
         super.initLogger();
      }
      
      private function §_-5V9§(param1:Object = null) : void
      {
         var params:Object = param1;
         this.§_-8L9§ = params;
         §_-5bu§().then(function():void
         {
            TweenPlugin.activate([ScrollRectPlugin,ColorTransformPlugin,FramePlugin,BezierPlugin,BezierThroughPlugin,GlowFilterPlugin]);
            §_-8jl§.instance.container = §_-25E§.dialogOverlay;
            Context.§_-05q§ = new §_-5y5§();
            Context.§_-7yr§.§_-9Fw§ = Application.instance.flashVars[§_-9P9§];
            §_-CSu§ = new §_-2Q-§(§_-25E§.screenOverlay,§_-25E§.overlayLayer);
            addChild(§_-CSu§);
         });
      }
      
      override protected function createContextMenu() : §_-1Z6§
      {
         if(Context.§_-2BT§.adapter.socialNetwork == §_-8BS§.§_-Boi§ || Context.§_-2BT§.adapter.socialNetwork == §_-8BS§.§_-8Lg§ || Context.§_-2BT§.adapter.socialNetwork == §_-8BS§.§_-BOa§)
         {
            return new §_-1Z6§();
         }
         return new §_-9e9§();
      }
      
      override public function run() : void
      {
         Context.§_-29d§.§_-7IO§();
         if(!Config.testMode)
         {
            this.runCityApp();
         }
         else
         {
            this.§_-8oc§(function(param1:Boolean):void
            {
               if(param1)
               {
                  runCityApp();
               }
               else
               {
                  §_-4OH§.§_-B5P§(Context.§_-5o8§.message("betaTestTitle"),Context.§_-5o8§.message("betaTestMessage",{"groupId":Config.§_-6vU§}));
               }
            });
         }
      }
      
      private function §_-8oc§(param1:Function) : void
      {
         var callback:Function = param1;
         Context.§_-2BT§.getUserGroupList(function(param1:Array):void
         {
            var _loc2_:§_-7ba§ = null;
            for each(_loc2_ in param1)
            {
               if(_loc2_.id == Config.§_-6vU§)
               {
                  callback(true);
                  return;
               }
            }
            callback(false);
         });
      }
      
      public function runCityApp() : void
      {
         super.run();
         CursorManager.instance.§_-8aI§(§_-Bjj§.§_-0vd§,ResourceManager.createMovieClip("PalmDownCursor@ui"));
         CursorManager.instance.§_-8aI§(§_-Bjj§.§_-0VK§,ResourceManager.createMovieClip("SprayCursor@ui"));
         CursorManager.instance.§_-8aI§(§_-Bjj§.§_-Bpq§,ResourceManager.createMovieClip("WateringCanCursor@ui"));
         CursorManager.instance.§_-8aI§(§_-Bjj§.HAND,ResourceManager.createMovieClip("HandCursor@ui"));
         CursorManager.instance.§_-8aI§(§_-Bjj§.DEFAULT,ResourceManager.createMovieClip("DefaultCursor@ui"));
         CursorManager.instance.§_-8aI§(§_-Bjj§.§_-xP§,ResourceManager.createMovieClip("TrashCursor@ui"));
         CursorManager.instance.§_-8aI§(§_-Bjj§.§_-Aj6§,ResourceManager.createMovieClip("TrashGoldCursor@ui"));
         CursorManager.instance.§_-8aI§(§_-Bjj§.§_-dW§,ResourceManager.createMovieClip("BombCursor@ui"));
         CursorManager.instance.§_-8aI§(§_-Bjj§.§_-5Vt§,ResourceManager.createMovieClip("ApplianceBatCursor@ui"));
         CursorManager.instance.§_-8aI§(§_-Bjj§.§_-50O§,ResourceManager.createMovieClip("JacuzziWormsCursor@ui"));
         CursorManager.instance.§_-8aI§(§_-Bjj§.§_-5BY§,ResourceManager.createMovieClip("GraffitiCursor@ui"));
         CursorManager.instance.§_-9QL§ = §_-Bjj§.DEFAULT;
         if(Context.§_-2BT§.adapter is FacebookAdapter)
         {
            (Context.§_-2BT§.adapter as FacebookAdapter).§_-0Nf§();
         }
      }
      
      override protected function createPlayer() : §_-5ab§
      {
         return new §_-48g§();
      }
      
      override public function initLoading() : void
      {
         super.initLoading();
         §_-3YE§.info("Start account manager");
         §_-3dD§.instance.start();
         §_-3YE§.info("Init auth client");
         Context.authClient.configure(new §_-BDF§(Config.§_-9PP§.getBoolean("active",false),Config.§_-9PP§.getString("social"),Config.§_-9PP§.getString("url"),Config.§_-9PP§.getString("project"),Config.§_-9PP§.getNumber("ttl"),Context.§_-2BT§.adapter.authUserId),Application.instance.flashVars);
         this.§_-6Gi§();
      }
      
      private function §_-6Gi§() : void
      {
         Context.§_-1ny§.init();
         §_-3YE§.info("Init replogin");
         this.§_-B77§(function(param1:§_-8UL§, param2:Array):void
         {
            var content:Array;
            var loadingScreen:§_-3pn§;
            var bannerNetworkId:String = null;
            var preUserInfo:§_-8UL§ = param1;
            var modulesContent:Array = param2;
            Context.preUserInfo = preUserInfo;
            if(Context.preUserInfo != null)
            {
               §_-3YE§.info("Prelogin: " + Context.preUserInfo.toString());
            }
            content = modulesContent;
            if(preUserInfo != null && preUserInfo.id == 0)
            {
               content = §_-CDq§.§_-1wn§();
            }
            else
            {
               §_-49j§.merge(content,§_-CDq§.§_-Bl6§());
            }
            §_-3OJ§.§_-34W§();
            §_-Bb7§.instance.loadXML(§_-5qn§.§_-CL6§);
            §_-3YE§.info("Init loading screen");
            loadingScreen = new §_-3pn§(content);
            currentScreen = loadingScreen;
            §_-4Ba§.sequence([loadingScreen.load,§_-CDq§.§_-4go§,run]);
            if(Config.§_-5Iy§ || preUserInfo != null && preUserInfo.§_-4oB§ && Config.production)
            {
               bannerNetworkId = preUserInfo != null ? preUserInfo.bannerNetworkId : §_-6O§.§_-69J§;
               Context.§_-Bad§.init(bannerNetworkId);
               Context.§_-Bad§.§_-fz§(function():void
               {
                  Context.§_-Bad§.§_-4oB§();
               });
            }
         });
      }
      
      override protected function prepareModules() : void
      {
         §_-3YE§.info("Init modules");
         §_-0nG§.instance.§_-2jQ§(Config.§_-yt§);
      }
      
      private function §_-B77§(param1:Function) : void
      {
         var request:§_-Bs9§ = null;
         var callback:Function = param1;
         if(Config.loginCallback != null)
         {
            request = new §_-Bs9§();
            request.§_-1bP§ = 1;
            request.url = Config.loginCallback;
            request.§_-0fS§({"sid":Context.§_-2BT§.adapter.userId});
            request.§_-0fS§({"snid":§_-6k2§.§_-2pB§(Context.§_-2BT§.adapter.socialNetwork)});
            request.method = URLRequestMethod.GET;
            request.addEventListener(§_-9db§.COMPLETE,function(param1:§_-9db§):void
            {
               var _loc3_:String = null;
               var _loc4_:§_-8UL§ = null;
               var _loc5_:Array = null;
               var _loc2_:Object = param1.§_-6Oe§();
               if(_loc2_ == null || !_loc2_.hasOwnProperty("user"))
               {
                  _loc3_ = "Pre login error: " + (_loc2_ != null ? §_-6aF§.toString(_loc2_,true) : "null");
                  §_-3YE§.error(_loc3_);
                  drawError(_loc3_);
               }
               else
               {
                  _loc4_ = new §_-8UL§();
                  _loc4_.id = _loc2_["user"]["id"];
                  _loc4_.reg = _loc2_["user"]["reg"];
                  _loc4_.avatariaLevel = _loc2_["user"]["avatariaLevel"];
                  if(Boolean(_loc2_["user"].hasOwnProperty("bannerNetworkId")) && _loc2_["user"]["bannerNetworkId"] != null)
                  {
                     _loc4_.bannerNetworkId = _loc2_["user"]["bannerNetworkId"];
                  }
                  if(_loc2_["user"].hasOwnProperty("paymentGroup"))
                  {
                     _loc4_.paymentGroup = _loc2_["user"]["paymentGroup"];
                  }
                  if(_loc2_["user"].hasOwnProperty("preloginModuleIds"))
                  {
                     §_-0nG§.instance.§_-6nV§(_loc2_["user"]["preloginModuleIds"]);
                  }
                  _loc5_ = !!_loc2_.hasOwnProperty("content") ? _loc2_["content"] : [];
                  callback(_loc4_,_loc5_);
               }
            });
            request.addEventListener(§_-4n-§.HTTP_ERROR,function(param1:§_-4n-§):void
            {
               var _loc2_:String = "http error: " + param1.toString();
               §_-3YE§.error(_loc2_);
               callback(null,[]);
            });
            request.send();
         }
         else
         {
            callback(null,[]);
         }
      }
      
      override protected function initWrapperParams() : Object
      {
         return this.§_-8L9§ == null ? super.initWrapperParams() : this.§_-8L9§;
      }
      
      override protected function initApplication() : void
      {
         this.start();
      }
      
      override protected function initScreen() : void
      {
         var ba:ByteArray;
         Context.§_-2ap§.§_-BF3§(§_-8RG§);
         Context.§_-2ap§.§_-BF3§(§_-0V9§);
         Context.§_-2ap§.§_-BF3§(§_-CCU§);
         Context.§_-2ap§.§_-BF3§(§_-HK§);
         Context.§_-2ap§.getComponent(§_-HK§).configure(§_-5qn§.§_-382§.§_-9QW§("modules/acl.xml"));
         Context.§_-CLP§.§_-2ys§(Context.§_-2ap§);
         Context.§_-9do§ = new §_-Byu§();
         Context.§_-CLP§.§_-2ys§(Context.§_-2m2§);
         Context.§_-CLP§.§_-2ys§(Context.§_-pm§);
         Context.§_-CLP§.§_-2ys§(Context.§_-0Q0§);
         Context.§_-CLP§.§_-2ys§(Context.§_-C7p§);
         Context.§_-CLP§.§_-2ys§(Context.§_-BYX§);
         Context.§_-CLP§.§_-2ys§(Context.§_-759§);
         Context.§_-CLP§.§_-2ys§(Context.§_-9do§);
         Context.§_-CLP§.§_-2ys§(Context.§_-2Vf§);
         Context.§_-CLP§.§_-2ys§(Context.§_-3QG§);
         Context.§_-CLP§.§_-2ys§(Context.craftManager);
         Context.§_-CLP§.§_-2ys§(Context.§_-AVO§);
         Context.§_-CLP§.§_-2ys§(Context.§_-06H§);
         Context.§_-CLP§.§_-2ys§(Context.§_-B4Z§);
         Context.§_-CLP§.§_-2ys§(Context.§_-8FS§);
         Context.§_-CLP§.§_-2ys§(Context.§_-Cdd§);
         Context.§_-CLP§.§_-2ys§(Context.§_-1nD§);
         Context.§_-CLP§.§_-2ys§(Context.§_-1cF§);
         Context.§_-CLP§.§_-2ys§(Context.§_-AI9§);
         Context.§_-CLP§.§_-2ys§(Context.§_-3B2§);
         Context.§_-CLP§.§_-2ys§(Context.§_-2i9§);
         Context.§_-CLP§.§_-2ys§(Context.§_-5aD§);
         Context.§_-CLP§.§_-2ys§(Context.§_-8Rv§);
         Context.§_-CLP§.§_-2ys§(Context.§_-9pi§);
         Context.§_-CLP§.§_-2ys§(Context.§_-HC§);
         Context.§_-CLP§.§_-2ys§(Context.§_-8dE§);
         Context.§_-CLP§.§_-2ys§(Context.§_-3Ok§);
         Context.§_-CLP§.§_-2ys§(Context.§_-9wO§);
         Context.§_-CLP§.§_-2ys§(§_-1s0§.instance);
         Context.§_-CLP§.§_-2ys§(§_-Bwy§.instance);
         Context.§_-CLP§.§_-2ys§(§_-5KD§.instance);
         Context.§_-CLP§.§_-2ys§(Context.§_-2je§);
         Context.§_-CLP§.§_-2ys§(Context.§_-0Am§);
         Context.§_-CLP§.§_-2ys§(Context.§_-3mh§);
         Context.§_-CLP§.§_-2ys§(Context.§_-76P§);
         Context.§_-CLP§.§_-2ys§(Context.§_-4y8§);
         Context.§_-CLP§.§_-2ys§(Context.§_-38Z§);
         Context.§_-CLP§.§_-2ys§(Context.§_-194§);
         Context.§_-CLP§.§_-2ys§(Context.§_-3Qc§);
         Context.§_-CLP§.§_-2ys§(§_-5t6§.instance);
         Context.§_-CLP§.§_-2ys§(Context.§_-7Ho§);
         Context.§_-CLP§.§_-2ys§(Context.§_-2CW§);
         Context.§_-CLP§.§_-2ys§(Context.§_-CAt§);
         Context.§_-CLP§.§_-2ys§(Context.§_-AO8§);
         Context.§_-CLP§.§_-2ys§(Context.§_-CJo§);
         Context.§_-CLP§.§_-2ys§(Context.§_-5OZ§);
         Context.§_-CLP§.§_-2ys§(Context.§_-BNj§);
         Context.§_-CLP§.§_-2ys§(Context.§_-7rG§);
         Context.§_-CLP§.§_-2ys§(Context.§_-Bb2§);
         Context.§_-CLP§.§_-2ys§(Context.§_-5w1§);
         Context.§_-CLP§.§_-2ys§(Context.§_-Bd7§);
         Context.§_-CLP§.§_-2ys§(Context.§_-2Hh§);
         Context.§_-CLP§.§_-2ys§(Context.§_-3f5§);
         Context.§_-CLP§.§_-2ys§(Context.§_-34N§);
         Context.§_-CLP§.§_-2ys§(Context.§_-2aP§);
         Context.§_-CLP§.§_-2ys§(Context.§_-A3p§);
         Context.§_-CLP§.§_-2ys§(Context.§_-0Hj§);
         Context.§_-CLP§.§_-2ys§(Context.§_-C8W§);
         Context.§_-CLP§.§_-2ys§(Context.§_-0VS§);
         Context.§_-CLP§.§_-2ys§(Context.§_-2t-§);
         Context.§_-CLP§.§_-2ys§(Context.§_-5gJ§);
         Context.§_-CLP§.§_-2ys§(Context.§_-1d4§);
         Context.§_-CLP§.§_-2ys§(Context.§_-9SO§);
         Context.§_-CLP§.§_-2ys§(Context.§_-XK§);
         if(Config.§_-yO§(Context.§_-2BT§.adapter.userId))
         {
            Context.§_-CLP§.§_-2ys§(Context.§_-sF§);
         }
         if(Config.collectEmails)
         {
            Context.§_-CLP§.§_-2ys§(Context.§_-Pk§);
         }
         Context.§_-3B2§.init(§_-48g§);
         Context.§_-CJo§.init(§_-AlG§);
         Context.§_-5OZ§.init();
         Context.§_-BNj§.init();
         Context.§_-7rG§.init();
         Context.§_-0Vr§.init();
         Context.§_-Ad2§.init();
         Context.§_-C8W§.init();
         Context.§_-2t-§.init();
         Context.§_-5c9§.init();
         ba = new §_-5sZ§() as ByteArray;
         Context.§_-BFW§.§_-7mN§(new XML(ba.readUTFBytes(ba.length)));
         §_-0nG§.instance.init();
         Context.§_-CLP§.visitCityHouse();
         Context.§_-1QO§.run();
         addEventListener(§_-1Rm§.§_-1Rv§,this.§_-CJ7§);
         addEventListener(§_-1Rm§.§_-7V9§,this.§_-CJ7§);
         addEventListener(§_-B9P§.§_-A-E§,function(param1:§_-B9P§):void
         {
            §_-3YE§.info("VISIBILITY_CHANGE: " + param1.value);
            if(param1.value)
            {
               Context.§_-2BT§.adapter.§_-7xT§();
               Context.§_-96h§.§_-2dy§();
            }
            else
            {
               Context.§_-2BT§.adapter.§_-C-r§();
               Context.§_-96h§.§_-2rW§();
            }
         });
      }
      
      private function drawError(param1:String) : void
      {
         var _loc2_:§_-5lL§ = new §_-5lL§(param1);
         addChild(_loc2_);
      }
      
      public function get §_-9bL§() : §_-2Q-§
      {
         return this.§_-CSu§;
      }
      
      override protected function getAppConfigPatch() : §_-8fL§
      {
         return §_-8fL§.§_-6RH§(new §_-3XV§());
      }
      
      public function §_-CJ7§(param1:§_-1Rm§) : void
      {
         removeEventListener(§_-1Rm§.§_-1Rv§,this.§_-CJ7§);
         removeEventListener(§_-1Rm§.§_-7V9§,this.§_-CJ7§);
         Context.§_-2BT§.adapter.§_-kA§();
      }
   }
}

