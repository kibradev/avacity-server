package §_-9VF§
{
   import §_-0Lb§.§_-3iC§;
   import §_-0Uz§.§_-3mj§;
   import §_-18o§.§_-8-S§;
   import §_-1Vu§.§_-Awf§;
   import §_-52p§.§_-9d9§;
   import §_-5wm§.§_-BOZ§;
   import §_-62k§.§_-7Mj§;
   import §_-6EA§.§_-Cb1§;
   import §_-A2M§.§_-4Ba§;
   import §_-AOz§.§_-4aX§;
   import §_-Av5§.§_-Qd§;
   import §_-BeZ§.§_-0Yu§;
   import §_-BeZ§.§_-4Ww§;
   import §_-ny§.§_-69X§;
   import flash.display.Bitmap;
   import flash.errors.IllegalOperationError;
   
   public class §_-5ab§ implements §_-0Yu§
   {
      public static const §_-4F5§:String = "usrinf";
      
      public static const §_-6b5§:String = "apprnc";
      
      public static const §_-7J0§:String = "clths";
      
      public static const §_-0T5§:String = "res";
      
      public static const §_-YZ§:String = "locinfo";
      
      public static const §_-5VE§:String = "pltid";
      
      protected var §_-0ZC§:§_-7Mj§ = null;
      
      protected var §_-x0§:§_-4aX§ = null;
      
      protected var §_-17W§:§_-3yI§ = null;
      
      protected var §_-0Lk§:§_-9d9§ = null;
      
      protected var §_-AOs§:§_-Qd§ = null;
      
      protected var §_-Azd§:Boolean = false;
      
      protected var _loaded:Boolean = false;
      
      protected var §_-91r§:Boolean = false;
      
      protected var §_-BVS§:int = 0;
      
      protected var §_-5Zg§:int = 0;
      
      private var §_-AcP§:§_-Cb1§ = new §_-Cb1§(0);
      
      private var _onLoadedTask:§_-4Ba§;
      
      private var §_-3xA§:int;
      
      public function §_-5ab§()
      {
         super();
      }
      
      public function get avatarClothes() : §_-4aX§
      {
         if(this.§_-x0§ == null)
         {
            this.§_-x0§ = new §_-4aX§();
         }
         return this.§_-x0§;
      }
      
      public function set avatarClothes(param1:§_-4aX§) : void
      {
         this.§_-x0§ = param1;
      }
      
      public function get avatarAppearance() : §_-7Mj§
      {
         if(this.§_-0ZC§ == null)
         {
            this.§_-0ZC§ = new §_-7Mj§();
         }
         return this.§_-0ZC§;
      }
      
      public function set avatarAppearance(param1:§_-7Mj§) : void
      {
         this.§_-0ZC§ = param1;
      }
      
      public function get userInfo() : §_-3yI§
      {
         if(this.§_-17W§ == null)
         {
            this.§_-17W§ = new §_-3yI§();
         }
         return this.§_-17W§;
      }
      
      public function set userInfo(param1:§_-3yI§) : void
      {
         this.§_-17W§ = param1;
      }
      
      public function get resources() : §_-9d9§
      {
         if(this.§_-0Lk§ == null)
         {
            this.§_-0Lk§ = new §_-9d9§();
         }
         return this.§_-0Lk§;
      }
      
      public function set resources(param1:§_-9d9§) : void
      {
         this.§_-0Lk§ = param1;
      }
      
      protected function §_-6gL§() : §_-BOZ§
      {
         return new §_-BOZ§();
      }
      
      public function get locationInfo() : §_-Qd§
      {
         if(this.§_-AOs§ == null)
         {
            this.§_-AOs§ = new §_-Qd§();
         }
         return this.§_-AOs§;
      }
      
      public function set locationInfo(param1:§_-Qd§) : void
      {
         this.§_-AOs§ = param1;
      }
      
      public function get id() : String
      {
         return String(this.§_-AcP§.value);
      }
      
      public function set id(param1:String) : void
      {
         if(!isNaN(parseInt(param1)))
         {
            this.§_-AcP§.value = parseInt(param1);
         }
      }
      
      public function cloneFast() : §_-5ab§
      {
         return this.clone();
      }
      
      public function clone() : §_-5ab§
      {
         var _loc1_:§_-5ab§ = new §_-5ab§();
         _loc1_.id = this.id;
         _loc1_.avatarAppearance = this.avatarAppearance.clone();
         _loc1_.avatarClothes = this.avatarClothes.clone();
         _loc1_.userInfo = this.userInfo.clone();
         _loc1_.locationInfo = this.locationInfo.clone();
         return _loc1_;
      }
      
      public function get isNew() : Boolean
      {
         return this.§_-Azd§;
      }
      
      public function set isNew(param1:Boolean) : void
      {
         this.§_-Azd§ = param1;
      }
      
      public function get loaded() : Boolean
      {
         return this._loaded;
      }
      
      public function set loaded(param1:Boolean) : void
      {
         this._loaded = param1;
         if(this._loaded)
         {
            this.§_-AOT§.resolve();
         }
      }
      
      public function get §_-AOT§() : §_-4Ba§
      {
         if(this._onLoadedTask == null)
         {
            this._onLoadedTask = new §_-4Ba§();
         }
         return this._onLoadedTask;
      }
      
      public function get online() : Boolean
      {
         return this.§_-91r§;
      }
      
      public function set online(param1:Boolean) : void
      {
         this.§_-91r§ = param1;
      }
      
      public function get timeDelta() : int
      {
         return this.§_-BVS§;
      }
      
      public function set timeDelta(param1:int) : void
      {
         this.§_-BVS§ = param1;
      }
      
      public function get energyModifiedDate() : int
      {
         return 0;
      }
      
      public function get currentServerTime() : int
      {
         return §_-8-S§.§_-9zq§() + this.§_-BVS§;
      }
      
      public function set energyModifiedDate(param1:int) : void
      {
      }
      
      public function hasClothes(param1:String, param2:String = null) : Boolean
      {
         return this.avatarClothes.hasClothes(param1);
      }
      
      public function hasClothesByCategory(param1:String) : Boolean
      {
         return this.avatarClothes.hasClothesByCategory(param1);
      }
      
      public function get level() : int
      {
         throw new IllegalOperationError("Must return player level");
      }
      
      public function get taggedName() : String
      {
         return this.avatarAppearance.name;
      }
      
      public function get §_-1M3§() : String
      {
         return this.avatarAppearance.htmlName;
      }
      
      public function get platformId() : int
      {
         return this.§_-5Zg§;
      }
      
      public function set platformId(param1:int) : void
      {
         this.§_-5Zg§ = param1;
      }
      
      public function fromAGSObject(param1:§_-4Ww§) : void
      {
         if(param1.has(§_-3mj§.§_-9GV§))
         {
            this.id = param1.getString(§_-3mj§.§_-9GV§);
         }
         if(param1.has(§_-3mj§.§_-BeL§))
         {
            this.online = param1.getBoolean(§_-3mj§.§_-BeL§);
         }
         if(param1.has(§_-4F5§))
         {
            this.userInfo = param1.§_-2jV§(§_-4F5§,§_-3yI§);
         }
         if(param1.has(§_-6b5§))
         {
            this.avatarAppearance = param1.§_-2jV§(§_-6b5§,§_-7Mj§);
         }
         if(param1.has(§_-7J0§))
         {
            this.avatarClothes = param1.§_-2jV§(§_-7J0§,§_-4aX§);
         }
         if(param1.has(§_-0T5§))
         {
            this.resources = param1.§_-2jV§(§_-0T5§,§_-9d9§);
         }
         if(param1.has(§_-YZ§))
         {
            this.locationInfo = param1.§_-2jV§(§_-YZ§,§_-Qd§);
         }
         if(param1.has(§_-5VE§))
         {
            this.platformId = param1.getInt(§_-5VE§);
         }
      }
      
      public function toAGSObject(param1:§_-4Ww§) : void
      {
      }
      
      public function getAvatarIcon(param1:int) : Bitmap
      {
         return §_-3iC§.instance.getAvatarIcon(this,param1);
      }
      
      public function §_-2BQ§(param1:int) : Bitmap
      {
         return §_-3iC§.instance.§_-2BQ§(this,param1);
      }
      
      public function §_-2Pm§(param1:int, param2:String = "df", param3:Boolean = true) : §_-4Ba§
      {
         return §_-3iC§.instance.§_-2Pm§(this,param1,param2,param3);
      }
      
      public function getMaxEnergy() : Number
      {
         return 100;
      }
      
      public function §_-3yo§(param1:String) : Boolean
      {
         return §_-69X§.§_-3yo§(this.avatarClothes,param1);
      }
      
      public function canShowHair() : Boolean
      {
         return this.avatarClothes == null || !this.avatarClothes.§_-4SF§(§_-Awf§.§_-IZ§);
      }
      
      public function canShowBeard() : Boolean
      {
         return this.avatarClothes == null || !this.avatarClothes.§_-4SF§(§_-Awf§.§_-Bc2§);
      }
      
      public function set §_-9eC§(param1:int) : void
      {
