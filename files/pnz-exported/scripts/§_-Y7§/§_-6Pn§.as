package §_-Y7§
{
   import §_-07O§.§_-9PB§;
   import §_-0Uz§.§_-m3§;
   import §_-0ZX§.§_-0Mt§;
   import §_-0ZX§.§_-0n-§;
   import §_-0ZX§.§_-5OK§;
   import §_-0ZX§.§_-8lv§;
   import §_-0ZX§.§_-B17§;
   import §_-0ZX§.§_-Bj5§;
   import §_-0ZX§.§_-jV§;
   import §_-0aF§.§_-2ur§;
   import §_-0sF§.§_-1D3§;
   import §_-0sF§.§_-3HK§;
   import §_-0sF§.§_-3e9§;
   import §_-0sF§.§_-5V8§;
   import §_-0sF§.§_-8XF§;
   import §_-0sF§.§_-9Gy§;
   import §_-0sF§.§_-PH§;
   import §_-0sF§.§_-W5§;
   import §_-0ur§.§_-4wO§;
   import §_-1vM§.§_-5Nf§;
   import §_-1vM§.§_-5RD§;
   import §_-1vM§.§_-6He§;
   import §_-23V§.§_-qo§;
   import §_-2cI§.§_-1wb§;
   import §_-2cI§.§_-BeR§;
   import §_-2yS§.§_-8KK§;
   import §_-40e§.§_-1m0§;
   import §_-4cY§.§_-8Hh§;
   import §_-4cY§.§_-Akc§;
   import §_-52p§.§_-8jF§;
   import §_-5MD§.§_-39M§;
   import §_-5Xp§.§function§;
   import §_-5eM§.§_-5jU§;
   import §_-5wm§.InventoryItem;
   import §_-6-L§.§_-3hw§;
   import §_-6-L§.§_-49j§;
   import §_-6-L§.§_-6aF§;
   import §_-7eL§.§_-6fn§;
   import §_-7eL§.§_-Asa§;
   import §_-7eL§.§_-xE§;
   import §_-8Hp§.§_-5KD§;
   import §_-8i3§.§_-2E0§;
   import §_-8ka§.§_-2i7§;
   import §_-8x6§.HoldPetFurnitureObject;
   import §_-8x6§.§_-5tI§;
   import §_-8x6§.§_-8pk§;
   import §_-8x6§.§_-8uy§;
   import §_-99s§.§_-2rp§;
   import §_-9VF§.§_-48g§;
   import §_-Bwh§.§_-AMW§;
   import §_-ByP§.§_-A7b§;
   import §_-CB§.§_-6u6§;
   import §_-GM§.Context;
   import §_-bm§.§_-7M§;
   import §_-uR§.§_-53f§;
   import ags.§_-5x-§;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.utils.Timer;
   import penzville.Application;
   import penzville.§_-7tX§;
   
   public class §_-6Pn§ extends §_-53f§ implements §_-m3§
   {
      public static const §_-0Wd§:String = "petCarpet1";
      
      public static const §_-3qm§:uint = 14;
      
      public static const §_-5bo§:uint = 3;
      
      public static const §_-Aoy§:String = "@cityPetsUi";
      
      private static const §_-4uU§:String = "petShop";
      
      private static const §_-76W§:String = "cityPet";
      
      public static const §_-CXV§:String = "sleep";
      
      public static const §_-4UX§:String = "sick";
      
      public static const §_-98T§:String = "cry";
      
      public static const §_-4C1§:String = "calm";
      
      public static const §_-39g§:String = "happy";
      
      public static const §_-3vk§:Array = [§_-4UX§,§_-98T§];
      
      private var §_-94w§:Array = null;
      
      private var §_-2Au§:§_-8lv§;
      
      protected var _netManager:§_-ZF§ = null;
      
      private var §_-1Bp§:Object = null;
      
      private var §_-5Ku§:Object = null;
      
      private var §_-2Dt§:Object = {};
      
      private var §_-1Np§:Array = null;
      
      private var §_-7Y5§:Array = null;
      
      private var §_-31H§:Timer;
      
      private var §_-9zA§:§_-8jF§;
      
      private var §_-0Le§:String = null;
      
      private var §_-36G§:String = null;
      
      private var §_-CB1§:Array = [];
      
      private var §_-A0h§:int;
      
      private var §_-0v§:int;
      
      private var §_-CH§:Timer = null;
      
      public function §_-6Pn§()
      {
         super();
         this._netManager = new §_-ZF§(this);
         this._netManager.addEventListener(§_-6u6§.§_-9IY§,this.§_-2WC§);
         this._netManager.addEventListener(§_-6u6§.§_-6LJ§,this.§_-AZW§);
         this._netManager.addEventListener(§_-6u6§.§_-4GB§,this.§_-21o§);
      }
      
      public static function §_-4Ss§() : Array
      {
         var _loc2_:§_-2E0§ = null;
         var _loc3_:§_-Akc§ = null;
         var _loc4_:§_-6fn§ = null;
         var _loc1_:Array = [];
         for each(_loc2_ in Context.cityPlayer.house.roomList)
         {
            for each(_loc3_ in _loc2_.furnitureList)
            {
               if(_loc3_.shopItem.findParentCategory(§_-8Hh§.§_-0ow§) != null || _loc3_.shopItem.findParentCategory(§_-8Hh§.§_-3w1§) != null || _loc3_.shopItem.findParentCategory(§_-8Hh§.§_-3Rh§) != null || _loc3_.shopItem.§_-6qA§(§_-2i7§) != null)
               {
                  _loc4_ = new §_-6fn§();
                  _loc4_.roomName = _loc2_.localizedName;
                  _loc4_.roomId = _loc2_.id;
                  _loc4_.objectId = _loc3_.id;
                  _loc4_.typeId = _loc3_.shopItem.typeId;
                  _loc1_.push(_loc4_);
               }
            }
         }
         return _loc1_;
      }
      
      public static function §_-4fh§() : Boolean
      {
         return §_-4Ss§().length > 0;
      }
      
      public function init() : void
      {
         Application.instance.addEventListener(§_-1m0§.§_-6O7§,this.§_-946§);
         Application.instance.addEventListener(§_-1m0§.§_-3D9§,this.§_-1JQ§);
         Application.instance.addEventListener(§_-7M§.§_-CEW§,this.§_-i4§);
      }
      
      public function §_-2CD§() : Boolean
      {
         return §_-5KD§.instance.§_-C6D§(§_-4uU§);
      }
      
      public function §_-Nb§() : Boolean
      {
         return §_-5KD§.instance.§_-C6D§(§_-76W§);
      }
      
      public function set netClient(param1:§_-5x-§) : void
      {
         this._netManager.netClient = param1;
      }
      
      public function configure(param1:XML) : void
      {
         var _loc2_:XML = null;
         var _loc3_:XML = null;
         var _loc4_:XML = null;
         var _loc5_:XML = null;
         var _loc6_:XML = null;
         var _loc7_:XML = null;
         var _loc8_:XML = null;
         var _loc9_:§_-5OK§ = null;
         var _loc10_:§_-0Mt§ = null;
         var _loc11_:§_-0n-§ = null;
         var _loc12_:§_-0n-§ = null;
         var _loc13_:§_-B17§ = null;
         if(param1 == null)
         {
            return;
         }
         this.§_-94w§ = [];
         for each(_loc2_ in §_-3hw§.§_-3bk§(param1,"moods.mood"))
         {
            _loc9_ = new §_-5OK§();
            _loc9_.configure(_loc2_);
            this.§_-94w§.push(_loc9_);
         }
         this.§_-2Au§ = new §_-8lv§();
         this.§_-2Au§.configure(param1);
         this.§_-1Bp§ = {};
         for each(_loc3_ in §_-3hw§.§_-3bk§(param1,"levels.level"))
         {
            this.§_-1Bp§[_loc3_["@id"]] = _loc3_["@value"];
         }
         this.§_-5Ku§ = {};
         for each(_loc4_ in §_-3hw§.§_-3bk§(param1,"skins.skin"))
         {
            _loc10_ = new §_-0Mt§();
            _loc10_.configure(_loc4_);
            if(!this.§_-5Ku§.hasOwnProperty(_loc10_.petType))
            {
               this.§_-5Ku§[_loc10_.petType] = [];
            }
            (this.§_-5Ku§[_loc10_.petType] as Array).push(_loc10_);
         }
         this.§_-1Np§ = [];
         for each(_loc5_ in §_-3hw§.§_-3bk§(param1,"decreasingParameters.parameter"))
         {
            _loc11_ = new §_-0n-§();
            _loc11_.configure(_loc5_);
            this.§_-1Np§.push(_loc11_);
         }
         this.§_-7Y5§ = [];
         for each(_loc6_ in §_-3hw§.§_-3bk§(param1,"increasingParameters.parameter"))
         {
            _loc12_ = new §_-0n-§();
            _loc12_.configure(_loc6_);
            this.§_-7Y5§.push(_loc12_);
         }
         this.§_-2Dt§ = {};
         for each(_loc7_ in §_-3hw§.§_-3bk§(param1,"clothesConflicts.conflict"))
         {
            this.§_-8YU§(_loc7_["@category1"],_loc7_["@category2"]);
         }
         this.§_-9zA§ = new §_-8jF§();
         this.§_-9zA§.fromXML(param1["renamePrice"][0]);
         this.§_-A0h§ = §_-3hw§.getInt(param1,"travel.@travelCooldown");
         this.§_-0v§ = §_-3hw§.getInt(param1,"travel.@travelTime");
         for each(_loc8_ in §_-3hw§.§_-3bk§(param1,"travel.award"))
         {
            _loc13_ = new §_-B17§();
            _loc13_.configure(_loc8_);
            this.§_-CB1§.push(_loc13_);
         }
      }
      
      public function get §_-7kB§() : §_-8lv§
      {
         return this.§_-2Au§;
      }
      
      public function §_-6pE§(param1:String) : Boolean
      {
         return this.§_-2Au§.§_-3eK§(param1);
      }
      
      public function §_-45v§(param1:int) : Array
      {
         var _loc3_:§_-B17§ = null;
         var _loc2_:Array = [];
         for each(_loc3_ in this.§_-CB1§)
         {
            if(_loc3_.§_-68H§ == param1)
            {
               _loc2_.push(_loc3_);
            }
         }
         return _loc2_;
      }
      
      public function get §_-4qa§() : int
      {
         return this.§_-A0h§;
      }
      
      public function get §_-8Ik§() : int
      {
         return this.§_-0v§;
      }
      
      public function §_-5rp§() : void
      {
         this._netManager.§_-5rp§();
      }
      
      public function §_-2Bo§(param1:§_-qo§, param2:String) : void
      {
         if(param1 is §_-3HK§)
         {
            this._netManager.addWalkAction(param1 as §_-3HK§,param2);
         }
         else if(param1 is §_-PH§)
         {
            if((param1 as §_-PH§).initiatorId == Context.cityPlayer.id)
            {
               this._netManager.§_-lp§(param1.actor as §_-8uy§,param1 as §_-PH§,param2);
            }
         }
         else if(param1 is §_-W5§)
         {
            if((param1 as §_-W5§).initiatorId == Context.cityPlayer.id)
            {
               this._netManager.§_-7Us§(param1.actor as §_-8uy§,param1 as §_-W5§,param2);
            }
         }
      }
      
      public function §_-7Xi§() : void
      {
         this._netManager.§_-7Xi§();
      }
      
      public function unpackPet(param1:String, param2:String, param3:Point, param4:String, param5:Boolean = true) : void
      {
         this._netManager.unpackPet(param1,param2,param3,param4,param5);
      }
      
      public function §_-0tQ§(param1:String) : void
      {
         this._netManager.§_-0tQ§(param1);
      }
      
      public function §_-44V§(param1:String) : void
      {
         this._netManager.§_-44V§(param1);
      }
      
      public function §_-9Zx§(param1:String, param2:int) : void
      {
         this._netManager.§_-9Zx§(param1,param2);
      }
      
      public function get §_-6AF§() : Boolean
      {
         var _loc1_:§_-Asa§ = Context.cityPlayer.petInfo;
         var _loc2_:§_-xE§ = Context.cityPlayer.§_-3xP§.getPetModel(_loc1_.currentPet);
         return _loc2_.satiety.value >= §_-xE§.§_-3U4§;
      }
      
      public function §_-6a-§(param1:int) : Boolean
      {
         return §_-6aF§.toArray(this.§_-1Bp§).length == param1;
      }
      
      public function §_-5Uu§(param1:§_-8uy§) : §_-39M§
      {
         var _loc6_:Boolean = false;
         var _loc7_:Array = null;
         var _loc8_:HoldPetFurnitureObject = null;
         var _loc2_:§_-48g§ = Context.§_-3B2§.§_-07a§(param1.ownerId) as §_-48g§;
         var _loc3_:Array = _loc2_.petInfo.locationInfo.actionTag.split(":");
         var _loc4_:String = _loc3_[0];
         var _loc5_:§_-39M§ = param1.world.findObjectById(_loc4_) as §_-39M§;
         if(_loc5_ == null)
         {
            _loc6_ = false;
            _loc7_ = param1.world.findObjectsByClass(HoldPetFurnitureObject);
            for each(_loc8_ in _loc7_)
            {
               if(_loc8_ != null && !(_loc8_ is §_-5tI§))
               {
                  _loc6_ = true;
                  _loc5_ = _loc8_;
                  break;
               }
            }
            if(!_loc6_)
            {
               return null;
            }
         }
         return _loc5_;
      }
      
      public function §_-5R2§(param1:§_-8uy§) : void
      {
         var _loc2_:§_-39M§ = this.§_-5Uu§(param1);
         if(_loc2_ == null)
         {
            param1.addAction(new §_-1D3§());
            return;
         }
         if(_loc2_ is §_-8pk§)
         {
            param1.addAction(new §_-3e9§(_loc2_ as §_-39M§,null));
         }
         else
         {
            param1.addAction(new §_-9Gy§(_loc2_ as §_-39M§,null));
         }
      }
      
      public function get renamePrice() : §_-8jF§
      {
         return this.§_-9zA§;
      }
      
      public function §_-B4z§(param1:String, param2:String) : void
      {
         var _loc3_:§_-01D§ = this.§_-6lb§();
         if(_loc3_ != null)
         {
            _loc3_.unpackPet(param1,param2);
            if(this.§_-06t§(param1) && Context.cityPlayer.§_-3xP§.§_-BG0§.length == 1)
            {
               (Context.§_-3hG§.currentScreen as §_-9PB§).§_-3D2§.updateButtons();
               Context.§_-2t-§.§_-7Cb§();
            }
         }
      }
      
      public function §_-2Hv§(param1:String, param2:String, param3:Point, param4:Point) : void
      {
         var _loc5_:§_-01D§ = null;
         if(!this.§_-06t§(param2))
         {
            _loc5_ = this.§_-6lb§();
            if(_loc5_ != null)
            {
               _loc5_.§_-Bxk§(param1,param3,param4);
            }
         }
      }
      
      public function §_-8rC§(param1:String, param2:String, param3:Point, param4:int, param5:int, param6:String) : void
      {
         var _loc7_:§_-01D§ = null;
         if(!this.§_-06t§(param2))
         {
            _loc7_ = this.§_-6lb§();
            if(_loc7_ != null)
            {
               _loc7_.§_-0I6§(param1,param3,param4,param5,param6);
            }
         }
      }
      
      public function §_-1w7§(param1:String, param2:String, param3:Point, param4:int, param5:String) : void
      {
         var _loc6_:§_-01D§ = null;
         if(!this.§_-06t§(param2))
         {
            _loc6_ = this.§_-6lb§();
            if(_loc6_ != null)
            {
               _loc6_.singleAction(param1,param3,param4,param5);
            }
         }
      }
      
      public function §_-2-T§(param1:String, param2:String) : void
      {
         var _loc3_:§_-01D§ = this.§_-6lb§();
         if(_loc3_ != null)
         {
            _loc3_.wakeUp(param1,param2);
         }
      }
      
      public function §_-6sg§(param1:String, param2:String) : void
      {
         var _loc3_:§_-xE§ = Context.cityPlayer.§_-3xP§.getPetModel(param1);
         if(_loc3_ == null)
         {
            return;
         }
         var _loc4_:§_-0Mt§ = this.getSkin(_loc3_.typeId,param2);
         if(_loc4_ == null)
         {
            return;
         }
         new §_-4wO§(param1,_loc4_).showModal();
      }
      
      public function §_-Awg§(param1:§_-2rp§) : void
      {
         this._netManager.§_-Awg§(param1);
      }
      
      public function §_-0bP§(param1:String, param2:String) : void
      {
         this._netManager.§_-0bP§(param1,param2);
      }
      
      public function §_-830§(param1:String, param2:Boolean, param3:§_-6fn§ = null) : void
      {
         this._netManager.§_-830§(param1,param2,param3);
      }
      
      public function §_-9tZ§(param1:String) : void
      {
         this._netManager.§_-9tZ§(param1);
      }
      
      public function §_-73d§(param1:String) : void
      {
         this._netManager.§_-73d§(param1);
      }
      
      public function §_-8JV§(param1:String) : void
      {
         this._netManager.§_-8JV§(param1);
      }
      
      public function §_-45W§(param1:String) : Boolean
      {
         var _loc2_:§_-01D§ = this.§_-6lb§();
         return _loc2_ != null && _loc2_.§_-45W§(param1);
      }
      
      public function §_-97V§(param1:String) : Boolean
      {
         var _loc2_:§_-01D§ = this.§_-6lb§();
         return _loc2_ != null && _loc2_.getPetObject(param1) != null;
      }
      
      public function §_-1Um§() : Boolean
      {
         var _loc1_:InventoryItem = null;
         for each(_loc1_ in Context.cityPlayer.inventory.furnitureCollection.items)
         {
            if(_loc1_.type.category.findParentById(§_-8Hh§.§_-Ajv§))
            {
               return true;
            }
         }
         return Context.cityPlayer.house.getFurnitureCountByCategoryId(§_-8Hh§.§_-Ajv§) > 0;
      }
      
      public function §_-7Hq§(param1:§_-Asa§) : void
      {
         if(param1.status == §_-jV§.§_-3Q8§ || param1.locationInfo.zone == §_-7tX§.§_-BHJ§)
         {
            Context.§_-CLP§.visitCityHouse(param1.locationInfo.group,param1.locationInfo.room);
         }
         else if(param1.status == §_-jV§.§_-6-F§)
         {
            Context.§_-CLP§.§_-4gK§(param1.locationInfo.zone,param1.locationInfo.room);
         }
      }
      
      public function §_-AcG§(param1:int) : §_-5OK§
      {
         var _loc2_:§_-5OK§ = null;
         for each(_loc2_ in this.§_-94w§)
         {
            if(_loc2_.value.inRange(param1))
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function §_-A4n§(param1:String) : §_-5OK§
      {
         var _loc2_:§_-5OK§ = null;
         for each(_loc2_ in this.§_-94w§)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function §_-9ie§(param1:int) : int
      {
         if(this.§_-1Bp§[param1] != null)
         {
            return param1 > 1 ? int(this.§_-1Bp§[param1] - this.§_-1Bp§[param1 - 1]) : int(this.§_-1Bp§[param1]);
         }
         return 0;
      }
      
      public function §_-1kT§(param1:int) : int
      {
         if(this.§_-1Bp§[param1] != null)
         {
            return this.§_-1Bp§[param1];
         }
         return 0;
      }
      
      public function §_-0Vd§(param1:int) : int
      {
         var _loc3_:String = null;
         var _loc2_:int = 1;
         for(_loc3_ in this.§_-1Bp§)
         {
            if(param1 >= this.§_-1Bp§[_loc3_] && _loc2_ < parseInt(_loc3_))
            {
               _loc2_ = parseInt(_loc3_);
            }
         }
         return _loc2_;
      }
      
      public function §_-1IU§() : Array
      {
         return this.§_-1Np§;
      }
      
      public function §_-UJ§(param1:String) : Array
      {
         var _loc3_:§_-0n-§ = null;
         var _loc2_:Array = [];
         for each(_loc3_ in this.§_-7Y5§)
         {
            if(_loc3_.tag == param1)
            {
               _loc2_.push(_loc3_);
            }
         }
         return _loc2_;
      }
      
      public function §_-2TQ§() : void
      {
         if(this.§_-31H§ != null)
         {
            return;
         }
         var _loc1_:§_-xE§ = Context.cityPlayer.getCurrentPetModel();
         if(_loc1_ == null)
         {
            return;
         }
         if(this.§_-0Le§ != _loc1_.id.toString())
         {
            this.§_-0Le§ = _loc1_.id.toString();
            this.§_-36G§ = _loc1_.mood.id;
         }
         this.§_-31H§ = new Timer(_loc1_.§_-FD§());
         this.§_-31H§.addEventListener(TimerEvent.TIMER,this.§_-05T§);
         this.§_-31H§.start();
      }
      
      public function §_-7i6§() : int
      {
         return this.§_-3aH§(§_-Bj5§.§_-7uR§);
      }
      
      public function §_-9w3§() : int
      {
         return this.§_-3aH§(§_-Bj5§.§_-AmH§);
      }
      
      private function §_-3aH§(param1:String) : int
      {
         var _loc2_:§_-xE§ = Context.cityPlayer.getCurrentPetModel();
         if(_loc2_ == null)
         {
            return 0;
         }
         var _loc3_:§_-Bj5§ = this.§_-A4J§(_loc2_.typeId,_loc2_.skinId,param1);
         return _loc3_ != null && _loc3_.value > 0 ? _loc3_.value : 0;
      }
      
      public function §_-A3I§(param1:String) : Array
      {
         return !!this.§_-5Ku§.hasOwnProperty(param1) ? this.§_-5Ku§[param1] : [];
      }
      
      public function getSkin(param1:String, param2:String) : §_-0Mt§
      {
         var _loc3_:§_-0Mt§ = null;
         if(this.§_-5Ku§.hasOwnProperty(param1))
         {
            for each(_loc3_ in this.§_-5Ku§[param1])
            {
               if(_loc3_.id == param2)
               {
                  return _loc3_;
               }
            }
         }
         return null;
      }
      
      public function §_-9uF§(param1:String, param2:String) : String
      {
         var _loc3_:§_-0Mt§ = this.getSkin(param1,param2);
         return _loc3_ != null && _loc3_.name != null ? _loc3_.name : §_-0Mt§.§_-1MX§;
      }
      
      public function §_-A4J§(param1:String, param2:String, param3:String) : §_-Bj5§
      {
         var _loc4_:§_-0Mt§ = this.getSkin(param1,param2);
         return _loc4_ == null ? new §_-Bj5§() : _loc4_.getBonus(param3);
      }
      
      public function changeSkin(param1:String, param2:String) : void
      {
         var _loc3_:§_-xE§ = Context.cityPlayer.§_-3xP§.getPetModel(param1);
         if(_loc3_ == null)
         {
            return;
         }
         var _loc4_:§_-0Mt§ = this.getSkin(_loc3_.typeId,param2);
         if(_loc4_ == null || _loc4_.level > _loc3_.level)
         {
            return;
         }
         this._netManager.changeSkin(param1,param2);
      }
      
      public function buyPetFood(param1:§_-8uy§, param2:§_-8KK§, param3:§_-6He§) : Boolean
      {
         var _loc4_:§_-AMW§ = new §_-AMW§();
         if(!_loc4_.checkPrice(new §_-8jF§(param3.gold,param3.silver,0,0,0)))
         {
            return false;
         }
         if(this.§_-6pE§(Context.§_-3hG§.locationId))
         {
            param1.addAction(new §_-8XF§(param2,Context.cityPlayer.id,param3.typeId));
         }
         else
         {
            param1.addAction(new §_-5V8§(param2,Context.cityPlayer.id,param3.typeId));
         }
         return true;
      }
      
      public function §_-2Gd§() : void
      {
         this.§_-6lb§().§_-2Gd§();
      }
      
      public function §_-9lI§(param1:String, param2:Array) : void
      {
         this._netManager.§_-9lI§(param1,param2);
      }
      
      public function §_-8NI§(param1:§_-5RD§, param2:§_-5RD§) : Boolean
      {
         var _loc5_:String = null;
         if(param1.category == null || param2.category == null)
         {
            return false;
         }
         var _loc3_:Array = [];
         var _loc4_:§_-5jU§ = param1.category;
         while(_loc4_ != null)
         {
            _loc3_.push(_loc4_.categoryId);
            _loc4_ = _loc4_.parent;
         }
         _loc4_ = param2.category;
         while(_loc4_ != null)
         {
            for each(_loc5_ in _loc3_)
            {
               if(_loc5_ != _loc4_.categoryId)
               {
                  if(Boolean(this.§_-2Dt§.hasOwnProperty(_loc5_)) && (this.§_-2Dt§[_loc5_] as Array).indexOf(_loc4_.categoryId) >= 0)
                  {
                     return true;
                  }
               }
            }
            _loc4_ = _loc4_.parent;
         }
         return false;
      }
      
      public function get §_-0QE§() : Boolean
      {
         var _loc3_:§_-5Nf§ = null;
         var _loc1_:Array = §_-49j§.§_-FR§(Context.§_-70S§.§_-0ZU§().findCategoryById(§_-8Hh§.§_-Ajv§).allChildTypes);
         if(!(_loc1_[0] as §_-5Nf§).isSaleItem)
         {
            return false;
         }
         var _loc2_:Boolean = true;
         for each(_loc3_ in _loc1_)
         {
            if(!Context.cityPlayer.§_-CY8§((_loc3_ as §_-5Nf§).petType) && !Context.cityPlayer.getFurnitureCount(_loc3_.typeId))
            {
               _loc2_ = false;
            }
         }
         return !_loc2_;
      }
      
      public function §_-8QS§() : void
      {
         var _loc1_:Array = §_-49j§.§_-FR§(Context.§_-70S§.§_-0ZU§().findCategoryById(§_-8Hh§.§_-Ajv§).allChildTypes);
         var _loc2_:§_-5Nf§ = _loc1_[0] as §_-5Nf§;
         if(_loc2_ == null || !§_-5KD§.instance.isSaleItem(_loc2_.typeId))
         {
            return;
         }
         var _loc3_:§_-A7b§ = §_-5KD§.instance.getSaleItem(_loc2_.typeId);
         if(_loc3_ == null)
         {
            return;
         }
         new §_-2ur§(§_-5KD§.instance.§_-0S-§(_loc3_.campaignId)).showModal();
      }
      
      private function §_-6lb§() : §_-01D§
      {
         if(Context.§_-3hG§.currentScreen == null || !(Context.§_-3hG§.currentScreen is §_-9PB§))
         {
            return null;
         }
         return (Context.§_-3hG§.currentScreen as §_-9PB§).§_-9Q4§;
      }
      
      private function §_-06t§(param1:String) : Boolean
      {
         return Context.player.id == param1;
      }
      
      private function petModelChange(param1:String) : void
      {
         if(this.§_-06t§(param1))
         {
            this.§_-8ez§();
         }
         var _loc2_:§_-6u6§ = new §_-6u6§(§_-6u6§.§_-9Bj§);
         _loc2_.§_-5aN§(§_-6u6§.§_-Ay9§,param1);
         dispatchEvent(_loc2_);
      }
      
      private function §_-8ez§() : void
      {
         var _loc2_:§_-5OK§ = null;
         var _loc3_:§_-5OK§ = null;
         var _loc1_:§_-xE§ = Context.cityPlayer.getCurrentPetModel();
         if(_loc1_ != null)
         {
            _loc2_ = _loc1_.mood;
            _loc3_ = this.§_-A4n§(this.§_-36G§);
            if(_loc3_ != null && _loc3_.id != _loc2_.id && §_-3vk§.indexOf(_loc2_.id) >= 0 && _loc3_.value.min > _loc2_.value.min && !this.§_-97V§(Context.cityPlayer.id))
            {
               Context.§_-BlB§.§_-CCK§(new §function§());
            }
            if(this.§_-36G§ != _loc2_.id)
            {
               this.§_-36G§ = _loc2_.id;
            }
         }
      }
      
      private function §_-1wX§() : void
      {
         this.§_-36G§ = null;
         if(this.§_-31H§ != null)
         {
            this.§_-31H§.reset();
            this.§_-31H§.removeEventListener(TimerEvent.TIMER,this.§_-05T§);
            this.§_-31H§ = null;
         }
      }
      
      private function §_-8YU§(param1:String, param2:String) : void
      {
         if(!this.§_-2Dt§.hasOwnProperty(param1))
         {
            this.§_-2Dt§[param1] = [];
         }
         (this.§_-2Dt§[param1] as Array).push(param2);
         if(!this.§_-2Dt§.hasOwnProperty(param2))
         {
            this.§_-2Dt§[param2] = [];
         }
         (this.§_-2Dt§[param2] as Array).push(param1);
      }
      
      private function §_-946§(param1:§_-1m0§) : void
      {
         this.§_-5rp§();
      }
      
      private function §_-1JQ§(param1:§_-1m0§) : void
      {
         this.§_-5rp§();
      }
      
      private function §_-i4§(param1:§_-7M§) : void
      {
         this.§_-2TQ§();
      }
      
      private function §_-2WC§(param1:§_-6u6§) : void
      {
         var _loc2_:String = param1.ownerId;
         if(Context.cityPlayer.id == _loc2_)
         {
            this.§_-1wX§();
            this.§_-2TQ§();
         }
         this.petModelChange(_loc2_);
         var _loc3_:§_-6u6§ = new §_-6u6§(§_-6u6§.§_-9IY§);
         _loc3_.data = param1.data;
         dispatchEvent(_loc3_);
      }
      
      private function §_-05T§(param1:TimerEvent) : void
      {
         var _loc2_:§_-xE§ = Context.cityPlayer.getCurrentPetModel();
         if(_loc2_ == null)
         {
            this.§_-1wX§();
            return;
         }
         _loc2_.calculateParameters();
         this.petModelChange(Context.cityPlayer.id);
         this.§_-31H§.reset();
         this.§_-31H§.delay = _loc2_.§_-FD§();
         this.§_-31H§.start();
      }
      
      private function §_-21o§(param1:§_-6u6§) : void
      {
         new §_-BeR§(param1.award).showModal();
         dispatchEvent(new §_-6u6§(§_-6u6§.§_-4GB§));
      }
      
      private function §_-AZW§(param1:§_-6u6§) : void
      {
         if(this.§_-CH§ != null)
         {
            this.§_-CH§.stop();
            this.§_-CH§.removeEventListener(TimerEvent.TIMER_COMPLETE,this.§_-5Og§);
         }
         this.§_-CH§ = new Timer(this.§_-0v§ * 1000,1);
         this.§_-CH§.addEventListener(TimerEvent.TIMER_COMPLETE,this.§_-5Og§);
         this.§_-CH§.start();
         dispatchEvent(new §_-6u6§(§_-6u6§.§_-6LJ§));
      }
      
      private function §_-5Og§(param1:TimerEvent) : void
      {
         this.§_-CH§.reset();
         this.§_-CH§.removeEventListener(TimerEvent.TIMER_COMPLETE,this.§_-5Og§);
         this.§_-CH§ = null;
         Context.§_-BlB§.§_-CCK§(new §_-1wb§());
      }
      
      override public function destroy() : void
      {
         if(destroyed)
         {
            return;
         }
         if(this._netManager != null)
         {
            this._netManager.removeEventListener(§_-6u6§.§_-9IY§,this.§_-2WC§);
            this._netManager.removeEventListener(§_-6u6§.§_-6LJ§,this.§_-AZW§);
            this._netManager.removeEventListener(§_-6u6§.§_-4GB§,this.§_-21o§);
            this._netManager.destroy();
            this._netManager = null;
         }
         this.§_-1wX§();
         super.destroy();
      }
   }
}

