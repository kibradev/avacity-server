package §_-Azn§
{
   import §_-0ZX§.§_-1ak§;
   import §_-38A§.§_-9TB§;
   import §_-3hC§.§_-3-x§;
   import §_-4Q1§.§_-C4k§;
   import §_-4cY§.§_-Akc§;
   import §_-4jo§.§_-3bi§;
   import §_-4jo§.§_-42p§;
   import §_-5KP§.§_-Bd6§;
   import §_-5g6§.§_-5zA§;
   import §_-6-L§.DisplayUtils;
   import §_-6-L§.§_-49j§;
   import §_-6xX§.§_-CM3§;
   import §_-70D§.§_-3q7§;
   import §_-7eL§.§_-Ain§;
   import §_-7lY§.§_-6nZ§;
   import §_-8I6§.§_-0kF§;
   import §_-8x6§.§_-8uy§;
   import §_-90R§.§_-aZ§;
   import §_-9OO§.§_-4g3§;
   import §_-9OO§.§_-5xb§;
   import §_-9OO§.§_-Atd§;
   import §_-9OO§.§_-BKy§;
   import §_-9Pu§.§_-9gR§;
   import §_-9VF§.§_-48g§;
   import §_-A2M§.§_-4Ba§;
   import §_-AdD§.Avatar;
   import §_-AdD§.§_-3rH§;
   import §_-Av5§.§_-Qd§;
   import §_-BSt§.§_-6iu§;
   import §_-CF9§.§_-1dp§;
   import §_-GM§.Context;
   import §_-MZ§.§_-12j§;
   import §_-bm§.§_-7M§;
   import §_-d5§.§_-2nW§;
   import ags.§_-5x-§;
   import flash.geom.Point;
   
   public class §_-1LL§ extends §_-3-x§
   {
      private var §_-7g4§:§_-BKy§ = null;
      
      private var §_-014§:§_-4g3§ = null;
      
      private var §_-1nR§:Array = [];
      
      private var §_-2Rf§:Array = [];
      
      private var §_-7o2§:Object = {};
      
      private var §_-0gT§:§_-42p§ = null;
      
      private var §_-AhZ§:Array = [];
      
      private var §_-5wT§:§_-4Ba§;
      
      private var §_-B9v§:Array = [];
      
      public function §_-1LL§(param1:§_-5x-§, param2:String, param3:§_-12j§, param4:String)
      {
         if(param4 == null)
         {
            param4 = §_-BKy§.LAYER_1;
         }
         if(param3 is §_-5xb§)
         {
            (param3 as §_-5xb§).locationLayerId = param4;
         }
         super(param1,param2,param3);
      }
      
      public function get §_-7s4§() : String
      {
         return §_-4E5§ is §_-5xb§ ? (§_-4E5§ as §_-5xb§).locationLayerId : null;
      }
      
      override protected function createRoomManager(param1:String) : §_-C4k§
      {
         return new §_-3bi§(param1);
      }
      
      private function get §_-2ux§() : §_-3bi§
      {
         return _netManager as §_-3bi§;
      }
      
      public function get §_-Xk§() : §_-42p§
      {
         return this.§_-0gT§;
      }
      
      override public function init() : void
      {
         super.init();
         this.§_-0gT§ = new §_-42p§(_netManager.serverRoomId);
         this.§_-0gT§.netClient = _netManager.netClient;
         _netManager.addEventListener(§_-CM3§.LOCATION_LAYER_CHANGED,this.§_-6PE§);
         _netManager.addEventListener(§_-CM3§.LOCATION_CARS_CHAGED,this.§_-6RX§);
      }
      
      override protected function visitByLocationInfo(param1:§_-Qd§) : §_-4Ba§
      {
         var _loc4_:Array = null;
         var _loc2_:int = 0;
         var _loc3_:§_-Atd§ = this.§_-014§.§_-1hx§(Context.cityPlayer.id);
         if(_loc3_ != null)
         {
            _loc4_ = §_-0kF§.§_-5I§(_loc3_.§_-Abq§);
            if(_loc4_.length > 0)
            {
               _loc2_ = (_loc4_[0] as §_-Akc§).id;
            }
         }
         return Context.§_-CLP§.§_-9vC§(param1,false,_loc2_);
      }
      
      private function get §_-BwP§() : Boolean
      {
         return this.§_-8Vu§.locationLayerId == §_-BKy§.LAYER_1;
      }
      
      private function §_-6RX§(param1:§_-CM3§) : void
      {
         var _loc2_:§_-4g3§ = param1.§_-3Wr§();
         this.§_-014§ = _loc2_;
         if(_world != null)
         {
            this.§_-8Kj§();
         }
      }
      
      private function §_-8Kj§() : void
      {
         var spotId:String = null;
         var carObject:§_-Atd§ = null;
         var car:§_-6iu§ = null;
         var newObject:§_-1dp§ = null;
         if(!this.§_-BwP§)
         {
            return;
         }
         for(spotId in this.§_-7o2§)
         {
            if(this.§_-7o2§.hasOwnProperty(spotId))
            {
               car = this.§_-7o2§[spotId];
               if(!this.§_-014§.§_-5vA§(spotId,car.typeId))
               {
                  car.§_-9yy§();
                  world.removeObject(car);
                  car = null;
                  delete this.§_-7o2§[spotId];
               }
            }
         }
         for each(carObject in this.§_-014§.§_-BVB§)
         {
            if(!this.§_-7o2§.hasOwnProperty(carObject.§_-8mI§))
            {
               newObject = this.§_-2N9§(carObject);
               this.§_-7o2§[carObject.§_-8mI§] = newObject;
            }
         }
         §_-C3w§(function(param1:§_-Bd6§, param2:§_-9TB§):void
         {
            while(param1.getNode(Math.floor(param2.x),Math.floor(param2.y)) == null || !param1.getNode(Math.floor(param2.x),Math.floor(param2.y)).walkable)
            {
               --param2.x;
               if(param2.x < 0)
               {
                  break;
               }
            }
            while(param1.getNode(Math.floor(param2.x),Math.floor(param2.y)) == null || !param1.getNode(Math.floor(param2.x),Math.floor(param2.y)).walkable)
            {
               param2.x = Math.floor(Math.random() * (_world.cols - 2)) + 1;
               param2.y = Math.floor(Math.random() * (_world.rows - 2)) + 1;
            }
         });
      }
      
      private function §_-2N9§(param1:§_-Atd§) : §_-1dp§
      {
         var newCarObject:§_-6iu§;
         var point:Point = null;
         var newObject:§_-1dp§ = null;
         var carObject:§_-Atd§ = param1;
         point = this.§_-1Ee§(carObject.§_-8mI§);
         var model:§_-9gR§ = new §_-9gR§();
         model.id = int(carObject.ownerId);
         model.typeId = carObject.§_-Abq§;
         model.direction = §_-aZ§.SE;
         model.wx = point.x + 1.5 - model.dimension.y / 2;
         model.wy = point.y - model.dimension.x;
         model.wz = 0;
         model.§_-1V6§ = carObject.§_-1V6§;
         newObject = §_-6nZ§.createObject(model.typeId);
         newCarObject = newObject as §_-6iu§;
         if(newCarObject != null)
         {
            newCarObject.ownerId = carObject.ownerId;
         }
         newObject.fromModel(model);
         newObject.objectId = "car_" + carObject.ownerId;
         _world.addObject(newObject);
         Context.§_-3B2§.§_-CR9§(carObject.ownerId,function(param1:§_-48g§):void
         {
            if(param1 != null && param1.§_-7Og§())
            {
               renderCarPet(param1,carObject,newObject);
            }
         });
         return newObject;
      }
      
      private function renderCarPet(param1:§_-48g§, param2:§_-Atd§, param3:§_-1dp§) : void
      {
         var petLocationInfo:§_-Ain§ = null;
         var player:§_-48g§ = param1;
         var carObject:§_-Atd§ = param2;
         var newObject:§_-1dp§ = param3;
         petLocationInfo = player.petInfo.locationInfo;
         var objectId:String = §_-1ak§.§_-5WH§(petLocationInfo);
         if(objectId != null)
         {
            if(objectId == carObject.§_-97G§.toString())
            {
               newObject.§_-1fd§().then(function():void
               {
                  var _loc1_:§_-8uy§ = §_-9Q4§.renderPet(player.getCurrentPetModel(),player.petInfo.locationInfo);
                  _loc1_.§_-9UF§ = true;
                  world.addObject(_loc1_);
                  var _loc2_:Class = §_-1ak§.§_-3Qd§(petLocationInfo.state);
                  if(§_-1ak§.§_-BFe§(_loc2_))
                  {
                     _loc1_.addAction(new _loc2_(newObject,null));
                  }
               });
            }
         }
      }
      
      override protected function onGetRoomInfo(param1:§_-7M§) : void
      {
         this.§_-7g4§ = param1.tag["l"];
         this.§_-014§ = param1.tag["c"];
         super.onGetRoomInfo(param1);
         this.§_-2ux§.§_-2bA§(this.§_-8Vu§.locationLayerId);
      }
      
      private function get §_-8Vu§() : §_-5xb§
      {
         return §_-4E5§ as §_-5xb§;
      }
      
      public function §_-2bA§(param1:String) : §_-4Ba§
      {
         if(this.§_-8Vu§.locationLayerId == param1)
         {
            return §_-4Ba§.resolve();
         }
         this.§_-5wT§ = new §_-4Ba§();
         this.§_-2ux§.§_-2bA§(param1);
         return this.§_-5wT§;
      }
      
      private function §_-6PE§(param1:§_-CM3§) : void
      {
         var _loc3_:§_-48g§ = null;
         var _loc4_:§_-48g§ = null;
         var _loc5_:Avatar = null;
         if(param1.userId == null || param1.layerId == null || param1.§_-02r§() == null)
         {
            return;
         }
         this.§_-7g4§ = param1.§_-02r§();
         if(param1.userId != Context.player.id)
         {
            this.§_-A4z§(param1.userId);
            return;
         }
         this.§_-7o2§ = null;
         this.§_-8Vu§.locationLayerId = param1.layerId;
         stop();
         var _loc2_:Object = §_-ia§.members;
         §_-BcR§.locationInfo.x = -1;
         §_-BcR§.locationInfo.y = -1;
         for each(_loc3_ in _loc2_)
         {
            _loc5_ = getAvatar(_loc3_.id);
            if(_loc5_ != null && _loc3_ != §_-BcR§)
            {
               _loc3_.locationInfo.x = _loc5_.wx;
               _loc3_.locationInfo.y = _loc5_.wy;
            }
            removeAvatar(_loc3_.id);
         }
         §_-9uW§();
         renderWorld();
         for each(_loc4_ in _loc2_)
         {
            this.addAvatar(_loc4_,true);
         }
         if(selfAvatar != null && §_-BcR§ != null)
         {
            §_-BcR§.locationInfo.x = selfAvatar.wx;
            §_-BcR§.locationInfo.y = selfAvatar.wy;
            selfAvatar.addAction(new §_-3q7§(1));
         }
         DisplayUtils.§_-36C§(_view);
         start();
         dispatchEvent(new §_-CM3§(§_-CM3§.LOCATION_LAYER_CHANGED,param1.layerId));
         if(this.§_-5wT§ != null)
         {
            this.§_-5wT§.resolve();
            this.§_-5wT§ = null;
         }
         this.§_-BQB§();
      }
      
      public function §_-3sm§(param1:String) : Boolean
      {
         return this.§_-7g4§.§_-0Ud§(param1) == this.§_-8Vu§.locationLayerId;
      }
      
      private function §_-A4z§(param1:String) : void
      {
         var _loc2_:§_-3rH§ = §_-ia§.getAvatar(param1);
         if(_loc2_ != null)
         {
            _loc2_.visible = this.isAvatarVisible(_loc2_);
         }
      }
      
      override protected function addMember(param1:§_-48g§, param2:Boolean) : void
      {
         if(this.§_-7g4§.§_-0Ud§(param1.id) == null)
         {
            this.§_-7g4§.§_-4zl§(param1.id,§_-BKy§.LAYER_1);
         }
         super.addMember(param1,param2);
      }
      
      override protected function removeMember(param1:String) : void
      {
         this.§_-7g4§.§_-B6W§(param1,this.§_-7g4§.§_-0Ud§(param1));
         super.removeMember(param1);
      }
      
      override public function addAvatar(param1:§_-48g§, param2:Boolean = true) : void
      {
         super.addAvatar(param1,param2);
         this.§_-A4z§(param1.id);
      }
      
      override protected function onLeaveRoom(param1:§_-7M§) : void
      {
         this.removeMember(param1.memberId);
      }
      
      override protected function renderItems() : void
      {
         var _loc1_:§_-Atd§ = null;
         var _loc2_:§_-5zA§ = null;
         var _loc3_:§_-5zA§ = null;
         var _loc4_:§_-1dp§ = null;
         super.renderItems();
         if(!this.§_-BwP§)
         {
            for each(_loc3_ in this.§_-2Rf§)
            {
               _world.addObject(_loc3_);
            }
            return;
         }
         this.§_-CF4§();
         this.§_-7o2§ = {};
         for each(_loc1_ in this.§_-014§.§_-BVB§)
         {
            _loc4_ = this.§_-2N9§(_loc1_);
            this.§_-7o2§[_loc1_.§_-8mI§] = _loc4_;
         }
         for each(_loc2_ in this.§_-1nR§)
         {
            _world.addObject(_loc2_);
         }
      }
      
      public function §_-Bxv§(param1:§_-5zA§) : void
      {
         this.§_-1nR§.push(param1);
      }
      
      public function §_-9VB§(param1:§_-5zA§) : void
      {
         delete this.§_-1nR§[this.§_-1nR§.indexOf(param1)];
         _world.removeObject(param1);
      }
      
      public function §_-3UQ§(param1:§_-5zA§) : void
      {
         this.§_-2Rf§.push(param1);
      }
      
      public function §_-4Kn§(param1:§_-5zA§) : void
      {
         delete this.§_-2Rf§[this.§_-2Rf§.indexOf(param1)];
         _world.removeObject(param1);
      }
      
      private function §_-1Ee§(param1:String) : Point
      {
         var _loc2_:Point = new Point();
         var _loc3_:int = int(param1);
         var _loc4_:* = _loc3_ <= 4;
         _loc2_.x = 11.5 + 5 * (_loc4_ ? _loc3_ - 1 : _loc3_ - 5);
         _loc2_.y = _loc4_ ? 12 : 21;
         return _loc2_;
      }
      
      override public function disablePanels(param1:Array = null) : void
      {
         super.disablePanels(param1);
         if(§_-vA§ != null && (§_-vA§.gameType == §_-2nW§.§_-st§ || §_-vA§.gameType == §_-2nW§.§_-8Ig§) || §_-vA§.gameType == §_-2nW§.§_-771§)
         {
            if(§_-8rZ§ != null)
            {
               §_-8rZ§.visible = false;
            }
            if(§_-1GJ§ != null)
            {
               §_-1GJ§.visible = false;
               §_-1GJ§.closeHistory();
            }
         }
      }
      
      override public function enablePanels() : void
      {
         super.enablePanels();
         if(§_-8rZ§ != null)
         {
            §_-8rZ§.visible = true;
         }
         if(§_-1GJ§ != null)
         {
            §_-1GJ§.visible = true;
         }
      }
      
      public function get §_-0E-§() : Array
      {
         return this.§_-AhZ§;
      }
      
      override public function isAvatarVisible(param1:§_-3rH§) : Boolean
      {
         return !§_-Ba7§.needToHideAvatar(param1) && this.§_-3sm§(param1.userId);
      }
      
      public function get §_-BVB§() : §_-4g3§
      {
         return this.§_-014§;
      }
      
      public function addParkingLayerObject(param1:Function) : void
      {
         this.§_-B9v§.push(param1);
         if(this.§_-5wT§ == null && _world != null && this.§_-BwP§)
         {
            _world.addObject(param1());
         }
      }
      
      private function §_-CF4§() : void
      {
         var _loc2_:Function = null;
         var _loc3_:§_-5zA§ = null;
         var _loc1_:Array = [];
         for each(_loc2_ in this.§_-B9v§)
         {
            _loc3_ = _loc2_() as §_-5zA§;
            if(_loc3_ == null)
            {
               _loc1_.push(_loc2_);
            }
            else
            {
               _world.addObject(_loc2_() as §_-5zA§);
            }
         }
         for each(_loc2_ in _loc1_)
         {
            §_-49j§.remove(this.§_-B9v§,_loc2_);
         }
      }
      
      override protected function dispatchRoomInitEnd() : void
      {
      }
      
      protected function §_-BQB§() : void
      {
         super.dispatchRoomInitEnd();
      }
      
      override public function destroy() : void
      {
         var _loc1_:§_-5zA§ = null;
         if(destroyed)
         {
            return;
         }
         for each(_loc1_ in this.§_-2Rf§)
         {
            _loc1_.destroy();
         }
         this.§_-2Rf§ = [];
         this.§_-B9v§ = [];
         if(_netManager != null)
         {
            _netManager.removeEventListener(§_-CM3§.LOCATION_LAYER_CHANGED,this.§_-6PE§);
            _netManager.removeEventListener(§_-CM3§.LOCATION_CARS_CHAGED,this.§_-6RX§);
         }
         if(this.§_-0gT§ != null)
         {
            this.§_-0gT§.destroy();
            this.§_-0gT§ = null;
         }
         if(this.§_-5wT§ != null)
         {
            this.§_-5wT§.§_-Akz§();
            this.§_-5wT§ = null;
         }
         super.destroy();
      }
   }
}

