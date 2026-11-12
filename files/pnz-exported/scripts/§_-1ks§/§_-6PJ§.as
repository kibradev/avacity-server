package §_-1ks§
{
   import §_-0fi§.§_-6f3§;
   import §_-18F§.§_-g6§;
   import §_-1Yc§.§_-4hh§;
   import §_-1Zy§.§_-A-f§;
   import §_-22f§.§_-4tT§;
   import §_-23V§.§_-qo§;
   import §_-2FH§.§_-6I5§;
   import §_-2Fw§.§_-2YR§;
   import §_-2Fw§.§_-9rx§;
   import §_-2U3§.ResourceManager;
   import §_-2vB§.§_-A84§;
   import §_-38A§.§_-9TB§;
   import §_-3ie§.§_-6SW§;
   import §_-40e§.§_-1m0§;
   import §_-4Sa§.§_-0dQ§;
   import §_-4Vx§.§_-4gG§;
   import §_-4Vx§.§_-AMV§;
   import §_-4Vx§.§_-B1C§;
   import §_-52p§.§_-9d9§;
   import §_-54d§.§_-g5§;
   import §_-5KP§.§_-Bd6§;
   import §_-5MD§.ActionMenuItem;
   import §_-5MD§.InteractiveObject;
   import §_-5MD§.§_-2kf§;
   import §_-5MD§.§_-6vA§;
   import §_-5MD§.§_-8D5§;
   import §_-5MD§.§_-8Oi§;
   import §_-5MD§.§_-CY3§;
   import §_-5VL§.§_-2Jf§;
   import §_-5g6§.§_-1ib§;
   import §_-5g6§.§_-42q§;
   import §_-5g6§.§_-5zA§;
   import §_-5g6§.§_-8Vp§;
   import §_-5wm§.InventoryItem;
   import §_-6-L§.DisplayUtils;
   import §_-6-L§.§_-2Rb§;
   import §_-6JL§.§_-B9P§;
   import §_-70D§.§_-BnQ§;
   import §_-7nb§.§_-9S3§;
   import §_-875§.§_-2Ff§;
   import §_-8Bx§.§_-8Wi§;
   import §_-8Hp§.§_-5KD§;
   import §_-8df§.§_-56s§;
   import §_-92W§.§_-7XQ§;
   import §_-92W§.§_-7zl§;
   import §_-92W§.§_-9SZ§;
   import §_-92W§.§_-9wu§;
   import §_-99s§.§_-7Tj§;
   import §_-9RU§.§_-2p8§;
   import §_-9VF§.§_-48g§;
   import §_-9VF§.§_-5ab§;
   import §_-A2M§.§_-4Ba§;
   import §_-APU§.§_-9zX§;
   import §_-AdD§.§_-0Tw§;
   import §_-B09§.§_-AAS§;
   import §_-BQo§.§_-7Lp§;
   import §_-GM§.Context;
   import §_-bm§.§_-3Fc§;
   import §_-zA§.§_-9ic§;
   import com.greensock.TweenLite;
   import com.greensock.easing.Cubic;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.events.TransformGestureEvent;
   import flash.geom.Point;
   import penzville.Application;
   import penzville.Config;
   
   public class §_-6PJ§ extends §_-Eb§ implements §_-g6§
   {
      protected static const §_-J-§:int = 20000;
      
      protected static const §_-9qJ§:int = 180;
      
      protected static const §_-0Uv§:int = 10;
      
      protected var _view:§_-9zX§ = null;
      
      protected var _world:§_-1ib§ = null;
      
      protected var §_-3Rt§:§_-4Ba§ = new §_-4Ba§();
      
      protected var §_-3DV§:§_-56s§ = null;
      
      protected var §_-8rZ§:§_-7XQ§ = null;
      
      protected var §_-1GJ§:§_-A-f§ = null;
      
      protected var §_-1OL§:§_-7zl§ = null;
      
      protected var §_-1XI§:§_-9wu§ = null;
      
      protected var §_-7is§:§_-9SZ§ = null;
      
      protected var §_-6I0§:Boolean = false;
      
      protected var §_-2T5§:§_-9TB§ = null;
      
      protected var §_-10d§:Point = null;
      
      protected var §_-8bb§:Array = [];
      
      protected var §_-0Mb§:Point = null;
      
      protected var §_-5yz§:int = 0;
      
      protected var §_-CaE§:Boolean = false;
      
      protected var §_-Bna§:InteractiveObject = null;
      
      protected var §_-1Dw§:§_-8D5§ = null;
      
      private var §_-1eB§:int = 20000;
      
      public function §_-6PJ§()
      {
         super();
         Application.instance.addEventListener(§_-1m0§.§_-9FD§,this.onAvatarChanged);
         Application.instance.addEventListener(§_-1m0§.§_-2cL§,this.onAvatarDroneChanged);
         Application.instance.addEventListener(§_-1m0§.§_-3bw§,this.onAvatarClothesChanged);
         Application.instance.addEventListener(§_-1m0§.§_-4YV§,this.§_-6bZ§);
         Application.instance.addEventListener(§_-B1C§.§_-3sT§,this.§_-0h5§);
         Application.instance.addEventListener(§_-1m0§.§_-8Q0§,this.§_-4hw§);
         Application.instance.addEventListener(§_-1m0§.§_-7Cg§,this.onWorkInfoChanged);
         Context.§_-2je§.addEventListener(§_-4hh§.§_-A0w§,this.§_-454§);
         Context.§_-06H§.addEventListener(§_-g5§.§_-CKj§,this.§_-3lz§);
      }
      
      public function get world() : §_-1ib§
      {
         return this._world;
      }
      
      public function get selfAvatar() : §_-0Tw§
      {
         if(this.§_-BcR§ == null)
         {
            return null;
         }
         return this.getAvatar(this.§_-BcR§.id);
      }
      
      public function get §_-BcR§() : §_-48g§
      {
         return this.getPlayer(Context.player.id);
      }
      
      public function get §_-3D2§() : §_-7zl§
      {
         return this.§_-1OL§;
      }
      
      public function get §_-3Ng§() : §_-9wu§
      {
         return this.§_-1XI§;
      }
      
      public function get bottomAvatarPanel() : §_-9SZ§
      {
         return this.§_-7is§;
      }
      
      public function get view() : §_-9zX§
      {
         return this._view;
      }
      
      public function get topPanel() : §_-7XQ§
      {
         return this.§_-8rZ§;
      }
      
      public function get background() : §_-56s§
      {
         return this.§_-3DV§;
      }
      
      public function get §_-2k5§() : §_-A-f§
      {
         return this.§_-1GJ§;
      }
      
      public function get §_-3Mj§() : §_-8D5§
      {
         return this.§_-1Dw§;
      }
      
      protected function get worldMap() : §_-6vA§
      {
         return new §_-6vA§();
      }
      
      public function get §_-5L2§() : int
      {
         return this.§_-1eB§;
      }
      
      public function set §_-5L2§(param1:int) : void
      {
         this.§_-1eB§ = param1;
      }
      
      public function setSelectedInteractiveObject(param1:InteractiveObject, param2:§_-CY3§ = null) : void
      {
         this.§_-Bna§ = param1;
         if(this.§_-Bna§ != null && param2 != null)
         {
            this.drawMenu(this.§_-Bna§,param2);
         }
      }
      
      public function getPlayer(param1:String) : §_-48g§
      {
         return null;
      }
      
      public function getAvatar(param1:String) : §_-0Tw§
      {
         return null;
      }
      
      public function disableMouse() : void
      {
         this.§_-3CM§();
      }
      
      public function getRandomFreePoint() : §_-9TB§
      {
         var _loc1_:§_-Bd6§ = this._world.context[§_-2Jf§.§_-9J-§] as §_-Bd6§;
         _loc1_.project();
         var _loc2_:int = Math.floor(Math.random() * this._world.cols);
         var _loc3_:int = Math.floor(Math.random() * this._world.rows);
         while(!_loc1_.§_-A0E§(_loc2_,_loc3_) || !_loc1_.getNode(_loc2_,_loc3_).walkable)
         {
            _loc2_ = Math.floor(Math.random() * this._world.cols);
            _loc3_ = Math.floor(Math.random() * this._world.rows);
         }
         return new §_-9TB§(_loc2_,_loc3_,0);
      }
      
      protected function drawMenu(param1:InteractiveObject, param2:§_-CY3§ = null) : void
      {
         var _loc3_:ActionMenuItem = null;
         this.§_-vz§();
         if(this.selfAvatar == null)
         {
            return;
         }
         if(param2 == null)
         {
            param2 = param1.getInteractiveMenu(this.selfAvatar);
         }
         if(param2 == null || param2.itemsCount == 0)
         {
            return;
         }
         if(param2.itemsCount == 1 && param2.getItem(0).§_-fA§())
         {
            _loc3_ = param2.getItem(0);
            if(_loc3_.callback != null)
            {
               _loc3_.callback(_loc3_);
            }
         }
         else
         {
            this.§_-1Dw§ = new §_-8D5§(param1,this.selfAvatar);
            this._world.addObject(this.§_-1Dw§);
            this.§_-1Dw§.show();
            dispatchEvent(new §_-6SW§(§_-6SW§.§_-CM0§,this.§_-1Dw§));
         }
      }
      
      protected function §_-vz§() : void
      {
         if(this.§_-1Dw§ != null)
         {
            this.§_-1Dw§.close();
            this.§_-1Dw§ = null;
         }
      }
      
      protected function getAvatarPosition(param1:§_-5ab§) : §_-9TB§
      {
         if(param1.locationInfo.x != -1 || param1.locationInfo.y != -1)
         {
            return new §_-9TB§(param1.locationInfo.x,param1.locationInfo.y,0);
         }
         return null;
      }
      
      override protected function getLootTargetPoint(param1:§_-7Tj§) : Point
      {
         var _loc2_:Point = super.getLootTargetPoint(param1);
         if(_loc2_ != null)
         {
            return _loc2_;
         }
         switch(param1.typeId)
         {
            case "workSilverLoot":
               _loc2_ = this.§_-8rZ§.silverTargetPoint;
               break;
            case "workEnergyLoot":
               _loc2_ = this.§_-8rZ§.§_-Bqx§;
               break;
            case "workGoldLoot":
               _loc2_ = this.§_-8rZ§.§_-F6§;
               break;
            default:
               if(this.§_-7is§ == null)
               {
                  return null;
               }
               _loc2_ = this.§_-7is§.craftTargetPoint;
               break;
         }
         _loc2_.x += this.§_-8rZ§.x;
         _loc2_.y += this.§_-8rZ§.y;
         return _loc2_;
      }
      
      protected function §_-0kR§() : void
      {
         if(§_-5KD§.instance.getModuleItem(§_-8Wi§.§_-9Zk§) != null)
         {
            this._view.addEventListener(MouseEvent.MOUSE_WHEEL,this.§_-6y0§);
         }
         this._view.addEventListener(TransformGestureEvent.GESTURE_ZOOM,this.§_-7Zb§);
      }
      
      protected function §_-1CT§(param1:Number) : void
      {
         var _loc2_:§_-9TB§ = this._view.screenToWorld(this._view.camera.x + this._view.width / 2,this._view.camera.y + this._view.height / 2);
         Config.§_-0pB§ = param1;
         if(Config.§_-0pB§ < Config.§_-3uZ§)
         {
            Config.§_-0pB§ = Config.§_-3uZ§;
         }
         if(Config.§_-0pB§ > Config.§_-25U§)
         {
            Config.§_-0pB§ = Config.§_-25U§;
         }
         this.resize();
         this._view.camera.lookAt(_loc2_.x,_loc2_.y,_loc2_.z);
         this._view.dispatchEvent(new §_-B9P§(§_-B9P§.RESIZE,null));
      }
      
      override protected function resize() : void
      {
         var _loc1_:Boolean = false;
         var _loc2_:Boolean = false;
         var _loc3_:Boolean = false;
         if(this.§_-3DV§ != null)
         {
            this.§_-3DV§.scaleX = this.§_-3DV§.scaleY = Config.§_-0pB§;
            this.§_-3DV§.resize(Config.§_-50z§ / Config.§_-0pB§,Config.§_-6Z0§ / Config.§_-0pB§);
         }
         if(this._view != null)
         {
            this._view.scaleX = this._view.scaleY = Config.§_-0pB§;
            _loc1_ = Config.§_-50z§ / Config.§_-0pB§ < this.worldMap.viewport.width || Config.§_-6Z0§ / Config.§_-0pB§ < this.worldMap.viewport.height;
            _loc2_ = Config.§_-0nZ§ && this.worldMap.viewport != null;
            _loc3_ = _loc2_ && !_loc1_;
            this._view.width = _loc3_ ? this.worldMap.viewport.width : Config.§_-50z§ / Config.§_-0pB§;
            this._view.height = _loc3_ ? this.worldMap.viewport.height : (Config.§_-6Z0§ - this.§_-5yz§) / Config.§_-0pB§;
            if(_loc3_)
            {
               this._view.x = Config.§_-50z§ / Config.§_-0pB§ / 2 - this._view.width / 2;
               this._view.y = (Config.§_-6Z0§ - this.§_-5yz§) / Config.§_-0pB§ / 2 - this._view.height / 2;
            }
            else
            {
               this._view.x = 0;
               this._view.y = 0;
               if(this.worldMap.viewport.height < (Config.§_-6Z0§ - this.§_-5yz§) / Config.§_-0pB§)
               {
                  this._view.height = this.worldMap.viewport.height;
                  this._view.y = (Config.§_-6Z0§ - this.§_-5yz§) / 2 - this._view.height * this._view.scaleY / 2;
               }
               if(this.worldMap.viewport.width < Config.§_-50z§ / Config.§_-0pB§)
               {
                  this._view.width = this.worldMap.viewport.width;
                  this._view.x = Config.§_-50z§ / 2 - this._view.width * this._view.scaleX / 2;
               }
            }
            this.§_-3DV§.updateView(this._view);
            this._view.camera.lookAt(this._world.rows / 2 + 2,this._world.cols / 2 - 2,0);
         }
         super.resize();
      }
      
      protected function createLoot(param1:§_-7Tj§, param2:§_-9TB§) : void
      {
         var _loc3_:§_-2Ff§ = new §_-2Ff§(param1);
         var _loc4_:Number = §_-2Rb§.§_-4PT§(-2,2);
         var _loc5_:Number = §_-2Rb§.§_-4PT§(-2,2);
         _loc3_.wx = param2.x;
         _loc3_.wy = param2.y;
         _loc3_.scaling = §_-2Rb§.§_-4PT§(0.4,0.6);
         this._world.addObject(_loc3_);
         TweenLite.to(_loc3_,0.5,{
            "bezierThrough":[{
               "wx":param2.x + _loc4_ * 0.5,
               "wy":param2.y + _loc4_ * 0.5,
               "wz":param2.z + §_-2Rb§.§_-4PT§(0.4,0.6)
            },{
               "wx":param2.x + _loc4_,
               "wy":param2.y + _loc5_,
               "wz":param2.z
            }],
            "scaling":1,
            "ease":Cubic.easeOut
         });
      }
      
      override protected function createCollectorAnimation(param1:§_-7Tj§, param2:MovieClip, param3:Point) : §_-2YR§
      {
         var _loc4_:§_-2YR§ = super.createCollectorAnimation(param1,param2,param3);
         return _loc4_ == null ? new §_-9rx§(param3) : _loc4_;
      }
      
      protected function §_-ac§() : void
      {
         this._view.addEventListener(MouseEvent.MOUSE_DOWN,this.onViewMouseDown);
         this._view.addEventListener(MouseEvent.MOUSE_MOVE,this.onViewMouseMove);
         this._view.addEventListener(MouseEvent.MOUSE_UP,this.onViewMouseUp);
         this._view.addEventListener(MouseEvent.MOUSE_OUT,this.§_-4jM§);
      }
      
      protected function §_-3CM§() : void
      {
         if(this._view == null)
         {
            return;
         }
         this._view.removeEventListener(MouseEvent.MOUSE_DOWN,this.onViewMouseDown);
         this._view.removeEventListener(MouseEvent.MOUSE_MOVE,this.onViewMouseMove);
         this._view.removeEventListener(MouseEvent.MOUSE_UP,this.onViewMouseUp);
         this._view.removeEventListener(MouseEvent.MOUSE_OUT,this.§_-4jM§);
      }
      
      protected function §_-9uW§() : void
      {
         if(this._view != null)
         {
            this._view.removeEventListener(MouseEvent.MOUSE_DOWN,this.onViewMouseDown);
            this._view.removeEventListener(MouseEvent.MOUSE_MOVE,this.onViewMouseMove);
            this._view.removeEventListener(MouseEvent.MOUSE_UP,this.onViewMouseUp);
            this._view.removeEventListener(MouseEvent.MOUSE_OUT,this.§_-4jM§);
            this._view.destroy();
            this._view = null;
         }
         if(this._world != null)
         {
            dispatchEvent(new §_-6SW§(§_-6SW§.§_-CDH§));
            this._world.removeEventListener(§_-4tT§.§_-NC§,this.onBeforeTick);
            this._world.removeEventListener(§_-AMV§.§_-A1q§,this.§_-5ST§);
            this._world.removeEventListener(§_-AMV§.§_-C4X§,this.§_-6d-§);
            this._world.removeEventListener(§_-3Fc§.§_-1xz§,this.§_-BTx§);
            if(this._world.context != null)
            {
               if(this._world.context.hasOwnProperty(§_-2Jf§.§_-9J-§))
               {
                  (this._world.context[§_-2Jf§.§_-9J-§] as §_-Bd6§).destroy();
                  delete this._world.context[§_-2Jf§.§_-9J-§];
               }
               if(this._world.context.hasOwnProperty(§_-2Jf§.§_-8ph§))
               {
                  delete this._world.context[§_-2Jf§.§_-8ph§];
               }
            }
            this._world.destroy();
            this._world = null;
         }
      }
      
      protected function switchLocation(param1:String, param2:String) : void
      {
      }
      
      protected function createWorldView(param1:Boolean) : §_-9zX§
      {
         return new §_-9zX§(Config.§_-0nZ§ && !param1 ? int(this.worldMap.viewport.width) : int(Config.§_-50z§ / Config.§_-0pB§),Config.§_-0nZ§ && !param1 ? int(this.worldMap.viewport.height) : int((Config.§_-6Z0§ - this.§_-5yz§) / Config.§_-0pB§));
      }
      
      protected function createWorld(param1:§_-9zX§, param2:int, param3:int, param4:int = 0) : §_-1ib§
      {
         return new §_-1ib§(param1,param2,param3,param4);
      }
      
      protected function drawTopPanel() : void
      {
         this.§_-8rZ§ = new §_-7XQ§();
         pushResizableItem(this.§_-8rZ§);
         §_-9VL§.uiLayer.addChild(this.§_-8rZ§);
      }
      
      protected function renderItems() : void
      {
      }
      
      protected function renderWorld() : void
      {
         var _loc1_:Boolean = false;
         var _loc2_:int = 0;
         if(Context.instance.§_-AIA§.isMobile)
         {
            this.§_-5yz§ = 0;
         }
         if(this.§_-3DV§ == null)
         {
            this.§_-3DV§ = createBackground();
            this.§_-3DV§.scaleX = this.§_-3DV§.scaleY = Config.§_-0pB§;
            §_-9VL§.bgLayer.addChild(this.§_-3DV§);
         }
         if(this._view == null)
         {
            _loc1_ = Config.§_-50z§ / Config.§_-0pB§ < this.worldMap.viewport.width || Config.§_-6Z0§ / Config.§_-0pB§ < this.worldMap.viewport.height;
            this._view = this.createWorldView(_loc1_);
            if(Config.§_-0nZ§ || !_loc1_)
            {
               this._view.x = Config.§_-50z§ / Config.§_-0pB§ / 2 - this._view.width / 2;
               this._view.y = (Config.§_-6Z0§ - this.§_-5yz§) / Config.§_-0pB§ / 2 - this._view.height / 2;
            }
            else
            {
               this._view.x = 0;
               this._view.y = 0;
            }
            this._view.scaleX = this._view.scaleY = Config.§_-0pB§;
            §_-9VL§.mainLayer.addChild(this._view);
            this.§_-ac§();
            this.§_-0kR§();
         }
         if(this._world == null)
         {
            _loc2_ = !Config.production || Config.allowedIds.indexOf(Context.player.userInfo.socialId) >= 0 ? §_-8Vp§.DEBUG : §_-8Vp§.NORMAL;
            this._world = this.createWorld(this._view,this.worldMap.width,this.worldMap.length,_loc2_);
            this._world.context[§_-2Jf§.§_-8ph§] = Context.pathFinder;
            this._world.context[§_-2Jf§.§_-9J-§] = new §_-Bd6§(this._world);
            this._view.camera.lookAt(this._world.rows / 2,this._world.cols / 2,0);
            this._world.addEventListener(§_-4tT§.§_-NC§,this.onBeforeTick);
            this._world.addEventListener(§_-AMV§.§_-A1q§,this.§_-5ST§);
            this._world.addEventListener(§_-AMV§.§_-C4X§,this.§_-6d-§);
            this._world.addEventListener(§_-3Fc§.§_-1xz§,this.§_-BTx§);
         }
         this.renderItems();
         this.§_-3Rt§.resolve();
         this.resize();
      }
      
      protected function renderAvatar(param1:§_-48g§, param2:Boolean = true) : §_-0Tw§
      {
         var _loc4_:§_-9TB§ = null;
         var _loc5_:§_-qo§ = null;
         if(this._world == null)
         {
            return null;
         }
         var _loc3_:§_-0Tw§ = this.getAvatar(param1.id);
         if(_loc3_ != null && param1.avatarAppearance.gender != _loc3_.sex)
         {
            if(_loc3_.userId == Context.player.id)
            {
               _loc3_.removeEventListener(§_-0dQ§.§_-82q§,this.onAvatarActionStart);
               _loc3_.removeEventListener(§_-0dQ§.§_-5vT§,this.onAvatarActionFinish);
            }
            if(_loc3_.world != null)
            {
               _loc3_.world.removeObject(_loc3_);
            }
            _loc3_ = null;
         }
         if(_loc3_ == null)
         {
            _loc3_ = new §_-0Tw§(ResourceManager.getADF("avatarAnimation"),param1.id,param1.avatarAppearance.name);
            _loc4_ = this.getAvatarPosition(param1);
            if(_loc4_ == null)
            {
               _loc4_ = this.getRandomFreePoint();
            }
            this._world.addObject(_loc3_);
            _loc3_.wx = _loc4_.x;
            _loc3_.wy = _loc4_.y;
            _loc3_.wz = _loc4_.z;
            _loc3_.direction = param1.locationInfo.direction;
            _loc3_.fromModel(param1);
            _loc3_.inited = param2;
            if(!_loc3_.inited)
            {
               _loc3_.visible = false;
            }
            _loc5_ = §_-9S3§.§_-WH§(_loc3_,param1.locationInfo.state,param1.locationInfo.actionTag,true);
            if(_loc5_ != null)
            {
               _loc3_.addAction(_loc5_);
            }
            if(_loc3_.userId == Context.player.id)
            {
               _loc3_.addEventListener(§_-0dQ§.§_-82q§,this.onAvatarActionStart);
               _loc3_.addEventListener(§_-0dQ§.§_-5vT§,this.onAvatarActionFinish);
               this._view.camera.lookAt(_loc3_.wx,_loc3_.wy,0);
            }
            param1.locationInfo.x = _loc4_.x;
            param1.locationInfo.y = _loc4_.y;
         }
         else
         {
            _loc3_.fromModel(param1);
         }
         if(Context.§_-76P§.isActive() && Context.§_-76P§.§_-AYP§(§_-A84§.§_-2aI§,param1.cityInfo.reputation) && param1.cityInfo.§_-16Z§ != null)
         {
            Context.§_-76P§.§_-0Wu§(_loc3_,param1);
         }
         this.refreshAvatarDrone(_loc3_,param1);
         return _loc3_;
      }
      
      protected function refreshAvatarDrone(param1:§_-0Tw§, param2:§_-48g§) : void
      {
         if(param1 == null || param2.§_-2un§ == null || param2.§_-2un§.§_-5y3§ == null)
         {
            return;
         }
         if(param2.§_-2un§.§_-5y3§.typeId == null)
         {
            if(param1.drone != null)
            {
               param1.drone.§_-1Up§();
               this._world.removeObject(param1.drone);
            }
         }
         else
         {
            this.§_-86o§(param1,param2);
         }
      }
      
      protected function §_-86o§(param1:§_-0Tw§, param2:§_-48g§) : void
      {
         if(!Context.§_-06H§.§_-un§(param2))
         {
            return;
         }
         if(param1.drone != null)
         {
            if(param1.drone.§_-AjG§(param2.§_-2un§.§_-5y3§.type,param2.§_-2un§.§_-5y3§.color))
            {
               return;
            }
            this._world.removeObject(param1.drone);
         }
         var _loc3_:§_-6I5§ = new §_-6I5§(param1,param2.§_-2un§.§_-5y3§);
         param1.drone = _loc3_;
         this._world.addObject(_loc3_);
      }
      
      protected function interactSelectedObject(param1:§_-8Oi§, param2:Point) : void
      {
         if(this.selfAvatar != null)
         {
            this.selfAvatar.addAction(new §_-BnQ§(param1,this._world.globalToLocal(param2)));
         }
      }
      
      protected function checkSelectedObject(param1:§_-5zA§, param2:Point) : Boolean
      {
         var _loc4_:§_-CY3§ = null;
         if(param1 is §_-2kf§)
         {
            return true;
         }
         if(param1 is InteractiveObject && this.selfAvatar != null)
         {
            _loc4_ = (param1 as InteractiveObject).getInteractiveMenu(this.selfAvatar);
            if(_loc4_ == null || _loc4_.itemsCount == 0)
            {
               return false;
            }
            this.setSelectedInteractiveObject(param1 as InteractiveObject,_loc4_);
            return true;
         }
         if(!(param1 is §_-8Oi§))
         {
            return false;
         }
         var _loc3_:§_-8Oi§ = param1 as §_-8Oi§;
         if(_loc3_.readyInteract() && this.selfAvatar != null)
         {
            this.interactSelectedObject(param1 as §_-8Oi§,param2);
            return true;
         }
         return false;
      }
      
      protected function removeTool() : void
      {
      }
      
      protected function checkObject(param1:§_-5zA§) : void
      {
      }
      
      protected function §_-3Df§(param1:§_-B9P§) : void
      {
         this.resize();
         Context.§_-CLP§.dispatchEvent(new §_-B9P§(§_-B9P§.RESIZE,null));
      }
      
      protected function §_-B0B§(param1:Boolean = false) : void
      {
         this.§_-7is§.lowerPanel(param1);
         this.§_-1GJ§.lowerPanel(param1);
      }
      
      protected function §_-6d-§(param1:§_-AMV§) : void
      {
         Application.instance.dispatchEvent(new §_-4gG§(§_-4gG§.§_-9uH§,param1.item));
      }
      
      protected function §_-BTx§(param1:§_-3Fc§) : void
      {
         Application.instance.dispatchEvent(new §_-3Fc§(§_-3Fc§.§_-1xz§));
         this.switchLocation(param1.locationId,param1.roomId);
      }
      
      protected function onAvatarActionStart(param1:§_-0dQ§) : void
      {
      }
      
      protected function onAvatarActionFinish(param1:§_-0dQ§) : void
      {
      }
      
      protected function §_-5ST§(param1:§_-AMV§) : void
      {
         var _loc3_:§_-2YR§ = null;
         var _loc4_:Point = null;
         Application.instance.dispatchEvent(new §_-4gG§(§_-4gG§.§_-9uH§,param1.item));
         var _loc2_:Point = this.getLootTargetPoint(param1.item);
         if(_loc2_ != null)
         {
            _loc3_ = this.createCollectorAnimation(param1.item,null,_loc2_);
            _loc4_ = this._view.worldToView(param1.pos.x,param1.pos.y,param1.pos.z);
            _loc3_.x = _loc4_.x + this._view.x;
            _loc3_.y = _loc4_.y + this._view.y;
            §_-9VL§.effectLayer.addChild(_loc3_);
            _loc3_.start();
         }
      }
      
      protected function onBeforeTick(param1:§_-4tT§) : void
      {
         if(this._view == null || this.§_-6I0§)
         {
            return;
         }
         if(this.§_-1eB§ >= 0 && this._world.lagTime > this.§_-1eB§)
         {
            Context.§_-CLP§.§_-CHX§();
         }
      }
      
      protected function §_-4jM§(param1:MouseEvent) : void
      {
         if(!param1.buttonDown)
         {
            return;
         }
         this.§_-6I0§ = false;
      }
      
      protected function onViewMouseUp(param1:MouseEvent) : void
      {
         var _loc2_:§_-5zA§ = null;
         var _loc3_:§_-9TB§ = null;
         if(!this.§_-6I0§)
         {
            this.§_-CaE§ = param1.shiftKey;
            for each(_loc2_ in this.§_-8bb§)
            {
               if(this.checkSelectedObject(_loc2_,new Point(param1.stageX,param1.stageY)))
               {
                  this.checkObject(_loc2_);
                  return;
               }
            }
            this.removeTool();
            if(this.selfAvatar != null)
            {
               _loc3_ = this._view.viewToWorld(this._view.mouseX,this._view.mouseY);
               _loc3_.x = Math.min(this._world.cols - 1,Math.max(1,_loc3_.x)) - this.selfAvatar.cellOffset.x;
               _loc3_.y = Math.min(this._world.rows - 1,Math.max(1,_loc3_.y)) - this.selfAvatar.cellOffset.y;
               this.selfAvatar.addAction(new §_-AAS§(new Point(_loc3_.x,_loc3_.y)));
            }
            this.§_-8bb§ = [];
            this.§_-10d§ = null;
         }
         else
         {
            this.§_-6I0§ = false;
            this.§_-2T5§ = null;
         }
      }
      
      protected function §_-6y0§(param1:MouseEvent) : void
      {
         var _loc2_:Number = param1.delta / 10;
         if(Context.instance.§_-AIA§.§_-3OB§)
         {
            _loc2_ = param1.delta * 3 / 1000;
         }
         this.§_-1CT§(Config.§_-0pB§ + _loc2_);
      }
      
      protected function §_-7Zb§(param1:TransformGestureEvent) : void
      {
         this.§_-1CT§(Config.§_-0pB§ * param1.scaleX);
      }
      
      protected function onViewMouseDown(param1:MouseEvent) : void
      {
         this.§_-0Mb§ = new Point(this._view.mouseX,this._view.mouseY);
         this.§_-10d§ = DisplayUtils.§_-8fl§(this._view,new Point(this._view.mouseX,this._view.mouseY),this._world);
         var _loc2_:Point = this._view.localToGlobal(new Point(this._view.mouseX,this._view.mouseY));
         this.§_-8bb§ = this._world.hitObjects(_loc2_.x,_loc2_.y,[§_-42q§.§_-2MB§,§_-42q§.§_-6rj§,§_-42q§.§_-Pt§,§_-42q§.§_-CdI§]);
         this.§_-2T5§ = this.view.viewToWorld(this.view.mouseX,this.view.mouseY,0);
         this.§_-6I0§ = false;
      }
      
      protected function onAvatarChanged(param1:§_-1m0§) : void
      {
      }
      
      protected function onAvatarClothesChanged(param1:§_-1m0§) : void
      {
      }
      
      protected function onAvatarDroneChanged(param1:§_-1m0§) : void
      {
      }
      
      protected function §_-6bZ§(param1:§_-1m0§) : void
      {
         var _loc2_:§_-0Tw§ = this.getAvatar(Context.player.id);
         var _loc3_:§_-9d9§ = param1.object as §_-9d9§;
         if(_loc2_ == null || _loc3_ == null)
         {
            return;
         }
         var _loc4_:Array = [];
         if(_loc3_.silver != 0)
         {
            _loc4_.push(new §_-7Lp§(§_-9ic§.§_-Se§,_loc3_.silver));
         }
         if(_loc3_.gold != 0)
         {
            _loc4_.push(new §_-7Lp§(§_-9ic§.§_-2qq§,_loc3_.gold));
         }
         if(_loc3_.energy != 0)
         {
            _loc4_.push(new §_-7Lp§(§_-9ic§.§_-4Mx§,_loc3_.energy));
         }
         _loc2_.§_-3rJ§.§_-2ti§(_loc4_);
      }
      
      protected function §_-0h5§(param1:§_-B1C§) : void
      {
         var _loc2_:InventoryItem = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(this.selfAvatar == null)
         {
            return;
         }
         for each(_loc2_ in param1.items)
         {
            _loc3_ = Math.min(_loc2_.count,§_-0Uv§);
            _loc4_ = 0;
            while(_loc4_ < _loc3_)
            {
               this.createLoot(_loc2_.type as §_-7Tj§,this.selfAvatar.cellOffsetPosition);
               _loc4_++;
            }
         }
      }
      
      protected function §_-454§(param1:§_-4hh§) : void
      {
         var _loc2_:§_-0Tw§ = this.getAvatar(Context.player.id);
         if(_loc2_ == null || _loc2_.§_-3rJ§ == null)
         {
            return;
         }
         if(param1.value != 0)
         {
            _loc2_.§_-3rJ§.§_-6a7§(new §_-7Lp§(§_-9ic§.§_-3Bl§,param1.value));
         }
      }
      
      protected function §_-3lz§(param1:§_-g5§) : void
      {
         var _loc2_:§_-0Tw§ = this.getAvatar(Context.player.id);
         if(_loc2_ == null || _loc2_.§_-3rJ§ == null)
         {
            return;
         }
         if(param1.value != 0)
         {
            _loc2_.§_-3rJ§.§_-6a7§(new §_-7Lp§(§_-9ic§.§_-BoK§,param1.value));
         }
      }
      
      protected function onViewMouseMove(param1:MouseEvent) : void
      {
         var _loc4_:Number = NaN;
         if(!param1.buttonDown)
         {
            return;
         }
         if(Context.instance.§_-AIA§.isMobile)
         {
            if(this.§_-0Mb§ == null)
            {
               return;
            }
            _loc4_ = §_-2Rb§.distance(this.§_-0Mb§.x,this.§_-0Mb§.y,this._view.mouseX,this._view.mouseY);
            if(_loc4_ < Config.§_-9ST§)
            {
               return;
            }
         }
         this.§_-6I0§ = true;
         var _loc2_:§_-9TB§ = this.view.viewToWorld(this.view.mouseX,this.view.mouseY,0);
         var _loc3_:§_-9TB§ = this.view.viewToWorld(this.view.width / 2,this.view.height / 2,0);
         if(this.§_-2T5§ != null)
         {
            this.view.camera.lookAt(_loc3_.x + this.§_-2T5§.x - _loc2_.x,_loc3_.y + this.§_-2T5§.y - _loc2_.y,0);
         }
      }
      
      protected function §_-4hw§(param1:§_-1m0§) : void
      {
         var _loc2_:§_-6f3§ = Context.§_-70S§.§_-0ZU§().findTypeById(String(param1.object)) as §_-6f3§;
         new §_-2p8§(_loc2_).showModal();
      }
      
      protected function onWorkInfoChanged(param1:§_-1m0§) : void
      {
      }
      
      override public function destroy() : void
      {
         if(destroyed)
         {
            return;
         }
         this.disableMouse();
         this.§_-9uW§();
         dispatchEvent(new §_-6SW§(§_-6SW§.§_-7fK§));
         if(this.§_-8rZ§ != null)
         {
            this.§_-8rZ§.destroy();
            this.§_-8rZ§ = null;
         }
         if(this.§_-7is§ != null)
         {
            this.§_-7is§.destroy();
            this.§_-7is§ = null;
         }
         if(this.§_-1GJ§ != null)
         {
            this.§_-1GJ§.destroy();
            this.§_-1GJ§ = null;
         }
         if(this.§_-1OL§ != null)
         {
            this.§_-1OL§.destroy();
            this.§_-1OL§ = null;
         }
         if(this.§_-1XI§ != null)
         {
            this.§_-1XI§.destroy();
            this.§_-1XI§ = null;
         }
         Application.instance.removeEventListener(§_-1m0§.§_-9FD§,this.onAvatarChanged);
         Application.instance.removeEventListener(§_-1m0§.§_-3bw§,this.onAvatarClothesChanged);
         Application.instance.removeEventListener(§_-1m0§.§_-2cL§,this.onAvatarDroneChanged);
         Application.instance.removeEventListener(§_-1m0§.§_-4YV§,this.§_-6bZ§);
         Application.instance.removeEventListener(§_-B1C§.§_-3sT§,this.§_-0h5§);
         Application.instance.removeEventListener(§_-1m0§.§_-8Q0§,this.§_-4hw§);
         Application.instance.removeEventListener(§_-1m0§.§_-7Cg§,this.onWorkInfoChanged);
         Context.§_-2je§.removeEventListener(§_-4hh§.§_-A0w§,this.§_-454§);
         Context.§_-06H§.removeEventListener(§_-g5§.§_-CKj§,this.§_-3lz§);
         super.destroy();
      }
   }
}

