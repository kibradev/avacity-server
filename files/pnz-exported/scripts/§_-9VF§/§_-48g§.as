package §_-9VF§
{
   import §_-0TK§.§_-0Nb§;
   import §_-0TK§.§_-B6z§;
   import §_-18o§.§_-8-S§;
   import §_-1Vu§.§_-Awf§;
   import §_-1c8§.§_-N8§;
   import §_-1dv§.§_-8VL§;
   import §_-2UV§.§_-8Vi§;
   import §_-2vB§.§_-A84§;
   import §_-3EY§.§_-17b§;
   import §_-3hC§.§_-3-x§;
   import §_-5Us§.§_-1Dh§;
   import §_-5Zh§.§_-x4§;
   import §_-5wm§.InventoryItem;
   import §_-5wm§.§_-0a4§;
   import §_-6Km§.§_-6-3§;
   import §_-6gb§.§_-72r§;
   import §_-7eL§.§_-29H§;
   import §_-7eL§.§_-Asa§;
   import §_-7eL§.§_-xE§;
   import §_-7s3§.§_-2X1§;
   import §_-8i3§.§_-XJ§;
   import §_-99s§.§_-7Tj§;
   import §_-AOz§.§_-5SV§;
   import §_-BeZ§.§_-4Ww§;
   import §_-GM§.Context;
   
   public class §_-48g§ extends §_-5ab§
   {
      public static const §_-8hM§:String = "hs";
      
      public static const §_-BOH§:String = "wi";
      
      public static const §_-Bnh§:String = "ci";
      
      public static const §_-5-N§:String = "qc";
      
      public static const §_-5Zq§:String = "cs";
      
      public static const §_-8KF§:String = "inv";
      
      public static const §_-By9§:String = "psp";
      
      public static const §_-1Gd§:String = "achc";
      
      public static const §_-GD§:String = "pf";
      
      public static const §_-nv§:String = "clif";
      
      public static const §_-2Sx§:String = "mbm";
      
      public static const §_-Axo§:String = "mifvr";
      
      public static const §_-1pq§:String = "chtdcm";
      
      public static const §_-0Ju§:String = "lginf";
      
      public static const §_-1ke§:String = "ptinf";
      
      public static const §_-2Zm§:String = "ptcln";
      
      public static const §_-46j§:String = "vipinf";
      
      protected var §_-2Yz§:§_-XJ§ = null;
      
      protected var §_-Br1§:§_-8Vi§ = null;
      
      protected var §_-Ck§:§_-9df§ = null;
      
      protected var §_-6qd§:§_-0a4§ = null;
      
      protected var §_-8Rf§:§_-6-3§ = null;
      
      protected var §_-1Oh§:§_-8VL§ = null;
      
      protected var §_-BRN§:§_-x4§ = null;
      
      private var §_-7zR§:§_-17b§ = null;
      
      private var §_-0ME§:Object = {};
      
      private var §_-9G4§:§_-2X1§ = null;
      
      private var §_-1d-§:§_-Asa§ = null;
      
      private var §_-1ta§:§_-29H§;
      
      private var §_-9yK§:§_-N8§ = null;
      
      protected var §_-5Ew§:§_-5SV§ = null;
      
      protected var §_-3z-§:§_-72r§ = null;
      
      public function §_-48g§()
      {
         super();
      }
      
      public function get house() : §_-XJ§
      {
         if(this.§_-2Yz§ == null)
         {
            this.§_-2Yz§ = new §_-XJ§();
         }
         return this.§_-2Yz§;
      }
      
      public function set house(param1:§_-XJ§) : void
      {
         this.§_-2Yz§ = param1;
      }
      
      public function get §_-BjJ§() : §_-8Vi§
      {
         if(this.§_-Br1§ == null)
         {
            this.§_-Br1§ = new §_-8Vi§();
         }
         return this.§_-Br1§;
      }
      
      public function set §_-BjJ§(param1:§_-8Vi§) : void
      {
         this.§_-Br1§ = param1;
      }
      
      public function get cityInfo() : §_-9df§
      {
         if(this.§_-Ck§ == null)
         {
            this.§_-Ck§ = new §_-9df§();
         }
         return this.§_-Ck§;
      }
      
      public function set cityInfo(param1:§_-9df§) : void
      {
         this.§_-Ck§ = param1;
      }
      
      public function get inventory() : §_-0a4§
      {
         if(this.§_-6qd§ == null)
         {
            this.§_-6qd§ = new §_-0a4§();
         }
         return this.§_-6qd§;
      }
      
      public function set inventory(param1:§_-0a4§) : void
      {
         this.§_-6qd§ = param1;
      }
      
      public function get §_-3k5§() : Boolean
      {
         return this.§_-9yK§ != null && this.§_-9yK§.§_-3k5§;
      }
      
      public function §_-8Hu§() : int
      {
         if(!this.§_-3k5§)
         {
            return 0;
         }
         return Math.max(Math.floor((this.§_-Ck§.§_-79q§ - §_-BVS§ - §_-8-S§.§_-9zq§()) / §_-8-S§.§_-4PC§),0);
      }
      
      public function §_-BxS§() : int
      {
         if(this.§_-Ck§.§_-285§ == 0 || §_-8-S§.§_-9zq§() + §_-BVS§ > this.§_-Ck§.§_-285§)
         {
            return -1;
         }
         return Math.max(Math.floor((this.§_-Ck§.§_-285§ - §_-BVS§ - §_-8-S§.§_-9zq§()) / §_-8-S§.§_-4PC§),0);
      }
      
      public function §_-7UT§() : Boolean
      {
         if(this.cityInfo == null)
         {
            return false;
         }
         return this.cityInfo.§_-48N§ || this.§_-BxS§() >= 0;
      }
      
      public function get questCollection() : §_-6-3§
      {
         if(this.§_-8Rf§ == null)
         {
            this.§_-8Rf§ = new §_-6-3§();
         }
         return this.§_-8Rf§;
      }
      
      public function set questCollection(param1:§_-6-3§) : void
      {
         this.§_-8Rf§ = param1;
      }
      
      public function get clothesCollections() : §_-5SV§
      {
         if(this.§_-5Ew§ == null)
         {
            this.§_-5Ew§ = new §_-5SV§();
         }
         return this.§_-5Ew§;
      }
      
      public function get §_-7AS§() : §_-72r§
      {
         if(this.§_-3z-§ == null)
         {
            this.§_-3z-§ = new §_-72r§();
         }
         return this.§_-3z-§;
      }
      
      public function set §_-7AS§(param1:§_-72r§) : void
      {
         this.§_-3z-§ = param1;
      }
      
      public function set clothesCollections(param1:§_-5SV§) : void
      {
         this.§_-5Ew§ = param1;
      }
      
      public function §_-tA§(param1:String) : Boolean
      {
         if(this.§_-1Oh§ == null || !Context.§_-3mh§.isActive() || !Context.§_-3mh§.§_-93o§(param1))
         {
            return false;
         }
         return this.§_-1Oh§.§_-2k3§(param1) != null;
      }
      
      public function get professions() : §_-8VL§
      {
         return this.§_-1Oh§;
      }
      
      public function set professions(param1:§_-8VL§) : void
      {
         this.§_-1Oh§ = param1;
      }
      
      public function get clanInfo() : §_-x4§
      {
         return this.§_-BRN§;
      }
      
      public function set clanInfo(param1:§_-x4§) : void
      {
         this.§_-BRN§ = param1;
      }
      
      public function get §_-3xU§() : §_-17b§
      {
         return this.§_-7zR§;
      }
      
      public function set §_-3xU§(param1:§_-17b§) : void
      {
         this.§_-7zR§ = param1;
      }
      
      public function get §_-8V§() : Object
      {
         return this.§_-0ME§;
      }
      
      public function set §_-8V§(param1:Object) : void
      {
         this.§_-0ME§ = param1;
      }
      
      public function §_-5tN§(param1:String) : §_-B6z§
      {
         if(this.§_-0ME§ == null || !this.§_-0ME§.hasOwnProperty(param1))
         {
            return null;
         }
         return this.§_-0ME§[param1];
      }
      
      public function get §_-3y1§() : §_-2X1§
      {
         return this.§_-9G4§;
      }
      
      public function set §_-3y1§(param1:§_-2X1§) : void
      {
         this.§_-9G4§ = param1;
      }
      
      override public function get level() : int
      {
         return this.cityInfo.level;
      }
      
      public function §_-28R§(param1:int = -1) : Boolean
      {
         return param1 < 0 ? this.clanInfo != null : this.clanInfo != null && this.clanInfo.clanId == param1;
      }
      
      public function get petInfo() : §_-Asa§
      {
         if(this.§_-1d-§ == null)
         {
            this.§_-1d-§ = new §_-Asa§();
         }
         return this.§_-1d-§;
      }
      
      public function set petInfo(param1:§_-Asa§) : void
      {
         this.§_-1d-§ = param1;
      }
      
      public function get §_-3xP§() : §_-29H§
      {
         if(this.§_-1ta§ == null)
         {
            this.§_-1ta§ = new §_-29H§();
         }
         return this.§_-1ta§;
      }
      
      public function set §_-3xP§(param1:§_-29H§) : void
      {
         this.§_-1ta§ = param1;
      }
      
      public function §_-7Og§() : Boolean
      {
         return this.§_-1d-§ != null && this.§_-1d-§.§_-7Og§();
      }
      
      public function §_-Bif§() : Boolean
      {
         return this.§_-1ta§ != null && this.§_-1ta§.§_-BG0§.length > 0;
      }
      
      public function §_-CY8§(param1:String) : Boolean
      {
         return this.§_-1ta§ != null && this.§_-1ta§.§_-CY8§(param1);
      }
      
      public function getCurrentPetModel() : §_-xE§
      {
         if(!this.§_-7Og§())
         {
            return null;
         }
         return this.§_-3xP§.getPetModel(this.§_-1d-§.currentPet);
      }
      
      public function get §_-2un§() : §_-N8§
      {
         if(this.§_-9yK§ == null)
         {
            this.§_-9yK§ = new §_-N8§();
         }
         return this.§_-9yK§;
      }
      
      public function set §_-2un§(param1:§_-N8§) : void
      {
         this.§_-9yK§ = param1;
      }
      
      override public function cloneFast() : §_-5ab§
      {
         var _loc1_:§_-48g§ = new §_-48g§();
         _loc1_.id = id;
         _loc1_.avatarAppearance = avatarAppearance.clone();
         _loc1_.avatarClothes = avatarClothes.clone();
         _loc1_.userInfo = userInfo.clone();
         _loc1_.locationInfo = locationInfo.clone();
         _loc1_.inventory = this.inventory.readOnlyLink();
         _loc1_.cityInfo = this.cityInfo.clone();
         _loc1_.§_-BjJ§ = null;
         _loc1_.questCollection = null;
         _loc1_.house = this.house.readOnlyLink();
         _loc1_.clothesCollections = this.clothesCollections.clone();
         _loc1_.§_-7AS§ = null;
         _loc1_.professions = null;
         _loc1_.clanInfo = this.clanInfo != null ? this.clanInfo.clone() : null;
         _loc1_.§_-3xU§ = null;
         _loc1_.§_-3y1§ = this.§_-3y1§ != null ? this.§_-3y1§.clone() : null;
         _loc1_.petInfo = null;
         _loc1_.§_-3xP§ = null;
         _loc1_.§_-2un§ = this.§_-2un§.clone();
         return _loc1_;
      }
      
      override public function clone() : §_-5ab§
      {
         var _loc1_:§_-48g§ = new §_-48g§();
         _loc1_.id = id;
         _loc1_.avatarAppearance = avatarAppearance.clone();
         _loc1_.avatarClothes = avatarClothes.clone();
         _loc1_.userInfo = userInfo.clone();
         _loc1_.locationInfo = locationInfo.clone();
         _loc1_.inventory = §_-0a4§(this.inventory.clone());
         _loc1_.cityInfo = this.cityInfo.clone();
         _loc1_.§_-BjJ§ = this.§_-BjJ§.clone();
         _loc1_.questCollection = this.questCollection.clone();
         _loc1_.house = this.house.clone();
         _loc1_.clothesCollections = this.clothesCollections.clone();
         _loc1_.§_-7AS§ = this.§_-7AS§.clone();
         _loc1_.professions = this.professions != null ? this.professions.clone() : null;
         _loc1_.clanInfo = this.clanInfo != null ? this.clanInfo.clone() : null;
         _loc1_.§_-3xU§ = this.§_-3xU§ != null ? this.§_-3xU§.clone() : null;
         _loc1_.§_-3y1§ = this.§_-3y1§ != null ? this.§_-3y1§.clone() : null;
         _loc1_.petInfo = this.petInfo != null ? this.petInfo.clone() : null;
         _loc1_.§_-3xP§ = this.§_-3xP§ != null ? this.§_-3xP§.clone() : null;
         _loc1_.§_-2un§ = this.§_-2un§ != null ? this.§_-2un§.clone() : null;
         return _loc1_;
      }
      
      override public function hasClothes(param1:String, param2:String = null) : Boolean
      {
         return this.inventory.clothesCollection.hasItem(param1,param2) || super.hasClothes(param1,param2);
      }
      
      public function §_-2dL§(param1:String, param2:String = null) : Boolean
      {
         return this.inventory.clothesCollection.hasItem(param1,param2) || avatarClothes.getClothesItem(param1,param2) != null;
      }
      
      public function §_-3jv§(param1:String) : int
      {
         var _loc2_:int = 0;
         if(avatarClothes.getClothesItem(param1) != null)
         {
            _loc2_++;
         }
         return _loc2_ + this.inventory.clothesCollection.getItemsById(param1).length;
      }
      
      override public function hasClothesByCategory(param1:String) : Boolean
      {
         var _loc2_:InventoryItem = null;
         for each(_loc2_ in this.inventory.clothesCollection.items)
         {
            if(_loc2_.type.findParentCategory(param1) != null)
            {
               return true;
            }
         }
         return super.hasClothesByCategory(param1);
      }
      
      public function getFurnitureCount(param1:String) : int
      {
         return this.inventory.furnitureCollection.§_-7kx§(param1) + this.house.getFurnitureCount(param1);
      }
      
      public function §_-BaK§(param1:String) : int
      {
         return this.inventory.gameCollection.§_-7kx§(param1);
      }
      
      override public function get energyModifiedDate() : int
      {
         return resources.energyModifiedDate;
      }
      
      override public function set energyModifiedDate(param1:int) : void
      {
         resources.energyModifiedDate = param1;
      }
      
      public function §_-299§(param1:Object) : Array
      {
         var _loc4_:Array = null;
         var _loc5_:InventoryItem = null;
         var _loc2_:Array = [];
         if((param1 as §_-Awf§).isColored)
         {
            _loc4_ = this.inventory.clothesCollection.getItemsById((param1 as §_-Awf§).typeId);
            for each(_loc5_ in _loc4_)
            {
               _loc2_.push(parseInt(_loc5_.instanceId));
            }
         }
         var _loc3_:int = this.§_-0Cf§(param1);
         if(_loc3_ > 0)
         {
            _loc2_.push(_loc3_);
         }
         return _loc2_;
      }
      
      public function §_-0nO§(param1:§_-7Tj§) : int
      {
         var _loc4_:§_-1Dh§ = null;
         var _loc5_:uint = 0;
         var _loc2_:Array = this.§_-299§(param1);
         var _loc3_:Array = [];
         for each(_loc4_ in Context.§_-Amy§.§_-CKw§())
         {
            if(_loc2_.indexOf(_loc4_.index) < 0)
            {
               _loc3_.push(_loc4_.index);
            }
         }
         _loc5_ = Math.floor(Math.random() * _loc3_.length);
         return _loc3_[_loc5_];
      }
      
      override public function canShowHair() : Boolean
      {
         if(this.cityInfo != null && Context.§_-76P§.isActive())
         {
            if(Context.§_-76P§.§_-AYP§(§_-A84§.§_-2aI§,this.cityInfo.reputation) && this.cityInfo.§_-16Z§ != null)
            {
               return true;
            }
            if(Context.§_-76P§.§_-AYP§(§_-A84§.§_-15O§,this.cityInfo.reputation) && Context.§_-3hG§.currentScreen != null && Context.§_-3hG§.currentScreen is §_-3-x§)
            {
               return true;
            }
         }
         return super.canShowHair();
      }
      
      override public function canShowBeard() : Boolean
      {
         if(this.cityInfo != null && Context.§_-76P§.isActive())
         {
            if(Context.§_-76P§.§_-AYP§(§_-A84§.§_-2aI§,this.cityInfo.reputation) && this.cityInfo.§_-16Z§ != null)
            {
               return true;
            }
            if(Context.§_-76P§.§_-AYP§(§_-A84§.§_-15O§,this.cityInfo.reputation) && Context.§_-3hG§.currentScreen != null && Context.§_-3hG§.currentScreen is §_-3-x§)
            {
               return true;
            }
         }
         return super.canShowBeard();
      }
      
      public function §_-0Cf§(param1:Object) : int
      {
         var _loc3_:String = null;
         var _loc4_:Array = null;
         var _loc2_:Array = this.clothesCollections.getCollectionByType(Context.cityPlayer.clothesCollections.currentCollectionType).collection;
         for each(_loc3_ in _loc2_)
         {
            _loc4_ = _loc3_.split(":");
            if(_loc4_.length > 1 && _loc4_[0] == (param1 as §_-Awf§).typeId)
            {
               return parseInt(_loc4_[1]);
            }
         }
         return 0;
      }
      
      public function get isTutorial() : Boolean
      {
         return this.cityInfo != null && this.cityInfo.§_-3Jn§ != null;
      }
      
      override public function get taggedName() : String
      {
         return this.clanInfo != null && this.clanInfo.tag != null ? "[" + this.clanInfo.tag + "]" + avatarAppearance.name : avatarAppearance.name;
      }
      
      public function get activityRating() : int
      {
         if(Context.§_-0Hj§.isActive && this.cityInfo.leagueActivityInfo != null)
         {
            return this.cityInfo.leagueActivityInfo.activityRating;
         }
         if(Context.§_-2je§.isActive)
         {
            return this.cityInfo.activityRating;
         }
         return 0;
      }
      
      override public function fromAGSObject(param1:§_-4Ww§) : void
      {
         super.fromAGSObject(param1);
         if(param1.has(§_-8hM§))
         {
            this.house = param1.§_-2jV§(§_-8hM§,§_-XJ§);
         }
         if(param1.has(§_-BOH§))
         {
            this.§_-BjJ§ = param1.§_-2jV§(§_-BOH§,§_-8Vi§);
         }
         if(param1.has(§_-Bnh§))
         {
            this.cityInfo = param1.§_-2jV§(§_-Bnh§,§_-9df§);
         }
         if(param1.has(§_-5-N§))
         {
            this.questCollection = param1.§_-2jV§(§_-5-N§,§_-6-3§);
         }
         if(param1.has(§_-5Zq§))
         {
            this.clothesCollections = param1.§_-2jV§(§_-5Zq§,§_-5SV§);
         }
         if(param1.has(§_-1Gd§))
         {
            this.§_-7AS§ = param1.§_-2jV§(§_-1Gd§,§_-72r§);
         }
         if(param1.has(§_-GD§))
         {
            this.professions = param1.§_-2jV§(§_-GD§,§_-8VL§);
         }
         if(param1.has(§_-8KF§))
         {
            this.inventory = param1.§_-2jV§(§_-8KF§,§_-0a4§);
         }
         if(param1.has(§_-nv§))
         {
            this.clanInfo = param1.§_-2jV§(§_-nv§,§_-x4§);
         }
         if(param1.has(§_-2Sx§))
         {
            this.§_-3xU§ = param1.§_-2jV§(§_-2Sx§,§_-17b§);
         }
         if(param1.has(§_-1pq§))
         {
            this.§_-3y1§ = param1.§_-2jV§(§_-1pq§,§_-2X1§);
         }
         if(param1.has(§_-1ke§))
         {
            this.petInfo = param1.§_-2jV§(§_-1ke§,§_-Asa§);
         }
         if(param1.has(§_-2Zm§))
         {
            this.§_-3xP§ = param1.§_-2jV§(§_-2Zm§,§_-29H§);
         }
         if(param1.has(§_-Axo§))
         {
            this.§_-8V§ = param1.getMap(§_-Axo§,new §_-0Nb§());
         }
         if(param1.has(§_-46j§))
         {
            this.§_-2un§ = param1.§_-2jV§(§_-46j§,§_-N8§);
         }
      }
   }
}

