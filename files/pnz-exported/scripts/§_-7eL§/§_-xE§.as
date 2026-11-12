package §_-7eL§
{
   import §_-0ZX§.§_-0Mt§;
   import §_-0ZX§.§_-0n-§;
   import §_-0ZX§.§_-5OK§;
   import §_-0ZX§.§_-Bj5§;
   import §_-18o§.§_-8-S§;
   import §_-18o§.§_-A8q§;
   import §_-6-L§.§_-49j§;
   import §_-BeZ§.§_-4Ww§;
   import §_-BeZ§.§_-8d2§;
   import §_-CBS§.§_-3Y-§;
   import §_-GM§.Context;
   import §_-Y7§.§_-6Pn§;
   
   public class §_-xE§ implements §_-8d2§
   {
      public static const §_-6Ud§:String = "id";
      
      public static const §_-C9d§:String = "oid";
      
      public static const §_-8Aa§:String = "n";
      
      public static const §_-3da§:String = "tid";
      
      public static const §_-AmX§:String = "sid";
      
      public static const §_-5c§:String = "clths";
      
      public static const §_-Bhi§:String = "h";
      
      public static const §_-62U§:String = "e";
      
      public static const §_-9rR§:String = "s";
      
      public static const §_-24l§:String = "tgs";
      
      public static const §_-4kC§:String = "exp";
      
      public static const §_-1E7§:int = 100;
      
      public static const §_-AEM§:int = 100;
      
      public static const §_-3U4§:int = 100;
      
      public static const §_-8-K§:String = "happiness";
      
      public static const §_-CRl§:String = "energy";
      
      public static const §_-7TK§:String = "satiety";
      
      private var §_-AcP§:int = 0;
      
      private var §_-5so§:String = null;
      
      private var _name:String = null;
      
      private var _typeId:String = null;
      
      private var §_-uj§:String = null;
      
      private var §_-AAL§:§_-960§ = null;
      
      private var §_-6vb§:§_-3Y-§ = new §_-3Y-§();
      
      private var §_-1Rh§:§_-3Y-§ = new §_-3Y-§();
      
      private var §_-03n§:§_-3Y-§ = new §_-3Y-§();
      
      private var §_-13F§:Array = [];
      
      private var §_-9Ym§:int = 0;
      
      public function §_-xE§()
      {
         super();
      }
      
      public function get id() : int
      {
         return this.§_-AcP§;
      }
      
      public function set id(param1:int) : void
      {
         this.§_-AcP§ = param1;
      }
      
      public function get objectId() : String
      {
         return "pet" + this.ownerId;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set name(param1:String) : void
      {
         this._name = param1;
      }
      
      public function get ownerId() : String
      {
         return this.§_-5so§;
      }
      
      public function set ownerId(param1:String) : void
      {
         this.§_-5so§ = param1;
      }
      
      public function get typeId() : String
      {
         return this._typeId;
      }
      
      public function set typeId(param1:String) : void
      {
         this._typeId = param1;
      }
      
      public function get skinId() : String
      {
         return this.§_-uj§ == null || this.§_-uj§.length == 0 ? §_-0Mt§.§_-Eq§ : this.§_-uj§;
      }
      
      public function get skin() : §_-0Mt§
      {
         return Context.§_-C8W§.getSkin(this.typeId,this.skinId);
      }
      
      public function get skinName() : String
      {
         return Context.§_-C8W§.§_-9uF§(this.typeId,this.skinId);
      }
      
      public function set skinId(param1:String) : void
      {
         this.§_-uj§ = param1;
      }
      
      public function get petClothes() : §_-960§
      {
         if(this.§_-AAL§ == null)
         {
            this.§_-AAL§ = new §_-960§();
         }
         return this.§_-AAL§;
      }
      
      public function set petClothes(param1:§_-960§) : void
      {
         this.§_-AAL§ = param1;
      }
      
      public function hasClothes(param1:String, param2:String = null) : Boolean
      {
         return this.petClothes.hasClothes(param1);
      }
      
      public function hasClothesByCategory(param1:String) : Boolean
      {
         return this.petClothes.hasClothesByCategory(param1);
      }
      
      public function get happiness() : §_-3Y-§
      {
         return this.§_-6vb§;
      }
      
      public function set happiness(param1:§_-3Y-§) : void
      {
         this.§_-6vb§ = param1;
      }
      
      public function §_-NO§(param1:Number) : void
      {
         this.§_-6vb§.§_-Bg5§(param1,§_-1E7§);
      }
      
      public function §_-AOD§(param1:Number) : void
      {
         this.§_-6vb§.§_-9lV§(param1,0);
      }
      
      public function get energy() : §_-3Y-§
      {
         return this.§_-1Rh§;
      }
      
      public function set energy(param1:§_-3Y-§) : void
      {
         this.§_-1Rh§ = param1;
      }
      
      public function §_-3v8§(param1:Number) : void
      {
         this.§_-1Rh§.§_-Bg5§(param1,§_-AEM§);
      }
      
      public function §_-3zW§(param1:Number) : void
      {
         this.§_-1Rh§.§_-9lV§(param1,0);
      }
      
      public function get satiety() : §_-3Y-§
      {
         return this.§_-03n§;
      }
      
      public function set satiety(param1:§_-3Y-§) : void
      {
         this.§_-03n§ = param1;
      }
      
      public function §_-4vB§(param1:Number) : void
      {
         this.§_-03n§.§_-Bg5§(param1,§_-3U4§);
      }
      
      public function §_-7p7§(param1:Number) : void
      {
         this.§_-03n§.§_-9lV§(param1,0);
      }
      
      public function get tags() : Array
      {
         return this.§_-13F§;
      }
      
      public function set tags(param1:Array) : void
      {
         this.§_-13F§ = param1;
      }
      
      public function hasTag(param1:String) : Boolean
      {
         return this.§_-13F§.indexOf(param1) >= 0;
      }
      
      public function get §_-5zy§() : Boolean
      {
         return this.hasTag(§_-6Pn§.§_-CXV§);
      }
      
      public function get §_-39Q§() : int
      {
         var _loc4_:§_-0n-§ = null;
         var _loc1_:Number = §_-AEM§ - this.energy.value;
         if(_loc1_ <= 0)
         {
            return 0;
         }
         var _loc2_:Array = Context.§_-C8W§.§_-UJ§(§_-6Pn§.§_-CXV§);
         var _loc3_:§_-0n-§ = null;
         for each(_loc4_ in _loc2_)
         {
            if(_loc4_.id == §_-CRl§)
            {
               _loc3_ = _loc4_;
               break;
            }
         }
         if(_loc3_ == null)
         {
            return 0;
         }
         var _loc5_:§_-Bj5§ = Context.§_-C8W§.§_-A4J§(this.typeId,this.skinId,§_-Bj5§.§_-Bfs§);
         var _loc6_:Number = _loc3_.value * (1 + _loc5_.value / 100);
         var _loc7_:int = Math.ceil(_loc1_ / _loc6_);
         return _loc7_ * _loc3_.§_-0jl§;
      }
      
      public function get level() : int
      {
         return Context.§_-C8W§.§_-0Vd§(this.experience);
      }
      
      public function get experience() : int
      {
         return this.§_-9Ym§;
      }
      
      public function set experience(param1:int) : void
      {
         this.§_-9Ym§ = param1;
      }
      
      public function get §_-9yf§() : int
      {
         this.calculateParameters();
         return (this.happiness.intValue + this.energy.intValue + this.satiety.intValue) / 3;
      }
      
      public function get mood() : §_-5OK§
      {
         return Context.§_-C8W§.§_-AcG§(this.§_-9yf§);
      }
      
      public function §_-C08§() : Array
      {
         var _loc2_:§_-0n-§ = null;
         var _loc3_:§_-Bj5§ = null;
         var _loc4_:§_-0n-§ = null;
         var _loc5_:§_-0n-§ = null;
         var _loc1_:Array = [];
         if(this.§_-5zy§)
         {
            _loc3_ = Context.§_-C8W§.§_-A4J§(this.typeId,this.skinId,§_-Bj5§.§_-Bfs§);
            for each(_loc4_ in Context.§_-C8W§.§_-UJ§(§_-6Pn§.§_-CXV§))
            {
               if(_loc4_.id == §_-CRl§ && _loc3_.value > 0)
               {
                  _loc5_ = _loc4_.clone();
                  _loc5_.value *= 1 + _loc3_.value / 100;
                  _loc1_.push(_loc5_);
               }
               else
               {
                  _loc1_.push(_loc4_);
               }
            }
            _loc1_ = _loc1_.concat(Context.§_-C8W§.§_-UJ§(§_-6Pn§.§_-CXV§));
         }
         for each(_loc2_ in Context.§_-C8W§.§_-1IU§())
         {
            if(§_-49j§.§_-2rQ§(_loc1_,"id",_loc2_.id) == null)
            {
               _loc1_.push(_loc2_);
            }
         }
         return _loc1_;
      }
      
      public function calculateParameters() : Boolean
      {
         var _loc4_:§_-0n-§ = null;
         var _loc5_:int = 0;
         var _loc1_:int = §_-8-S§.§_-9zq§() + Context.cityPlayer.timeDelta;
         var _loc2_:Array = this.§_-C08§();
         if(_loc2_.length == 0)
         {
            return false;
         }
         var _loc3_:Boolean = false;
         for each(_loc4_ in _loc2_)
         {
            _loc5_ = 0;
            switch(_loc4_.id)
            {
               case §_-CRl§:
                  _loc5_ = Math.floor((_loc1_ - this.energy.time) / _loc4_.§_-0jl§);
                  if(_loc5_ > 0)
                  {
                     _loc3_ = true;
                     if(_loc4_.value > 0)
                     {
                        this.§_-3v8§(_loc4_.value * _loc5_);
                     }
                     else
                     {
                        this.§_-3zW§(Math.abs(_loc4_.value * _loc5_));
                     }
                     this.energy.§_-BTY§(_loc4_.§_-0jl§ * _loc5_);
                  }
                  break;
               case §_-8-K§:
                  _loc5_ = Math.floor((_loc1_ - this.happiness.time) / _loc4_.§_-0jl§);
                  if(_loc5_ > 0)
                  {
                     _loc3_ = true;
                     if(_loc4_.value > 0)
                     {
                        this.§_-NO§(_loc4_.value * _loc5_);
                     }
                     else
                     {
                        this.§_-AOD§(Math.abs(_loc4_.value * _loc5_));
                     }
                     this.happiness.§_-BTY§(_loc4_.§_-0jl§ * _loc5_);
                  }
                  break;
               case §_-7TK§:
                  _loc5_ = Math.floor((_loc1_ - this.satiety.time) / _loc4_.§_-0jl§);
                  if(_loc5_ > 0)
                  {
                     _loc3_ = true;
                     if(_loc4_.value > 0)
                     {
                        this.§_-4vB§(_loc4_.value * _loc5_);
                     }
                     else
                     {
                        this.§_-7p7§(Math.abs(_loc4_.value * _loc5_));
                     }
                     this.satiety.§_-BTY§(_loc4_.§_-0jl§ * _loc5_);
                  }
                  break;
            }
         }
         return _loc3_;
      }
      
      public function §_-FD§() : int
      {
         var _loc3_:§_-0n-§ = null;
         var _loc4_:int = 0;
         var _loc1_:int = §_-8-S§.§_-9zq§() + Context.cityPlayer.timeDelta;
         var _loc2_:int = -1;
         for each(_loc3_ in this.§_-C08§())
         {
            _loc4_ = 0;
            switch(_loc3_.id)
            {
               case §_-CRl§:
                  _loc4_ = Math.max(_loc3_.§_-0jl§ - _loc1_ + this.energy.time,0);
                  break;
               case §_-8-K§:
                  _loc4_ = Math.max(_loc3_.§_-0jl§ - _loc1_ + this.happiness.time,0);
                  break;
               case §_-7TK§:
                  _loc4_ = Math.max(_loc3_.§_-0jl§ - _loc1_ + this.satiety.time,0);
                  break;
               default:
                  continue;
            }
            if(_loc2_ == -1 || _loc2_ > _loc4_)
            {
               _loc2_ = _loc4_;
            }
         }
         return _loc2_ * 1000;
      }
      
      public function toAGSObject(param1:§_-4Ww§) : void
      {
         param1.§_-CZf§(§_-6Ud§,this.id);
         param1.putString(§_-C9d§,this.ownerId);
         param1.putString(§_-8Aa§,this.name);
         param1.putString(§_-3da§,this.typeId);
         param1.putString(§_-AmX§,this.skinId);
         param1.§_-6JD§(§_-5c§,this.petClothes);
         param1.§_-6JD§(§_-62U§,this.energy);
         param1.§_-6JD§(§_-9rR§,this.satiety);
         param1.§_-6JD§(§_-Bhi§,this.happiness);
         param1.§_-3f6§(§_-24l§,this.tags);
         param1.§_-CZf§(§_-4kC§,this.experience);
      }
      
      public function fromAGSObject(param1:§_-4Ww§) : void
      {
         this.id = param1.getInt(§_-6Ud§,0);
         this.ownerId = param1.getString(§_-C9d§,null);
         this.name = param1.getString(§_-8Aa§,null);
         this.typeId = param1.getString(§_-3da§,null);
         this.skinId = param1.getString(§_-AmX§,§_-0Mt§.§_-Eq§);
         this.petClothes = param1.§_-2jV§(§_-5c§,§_-960§);
         this.energy = param1.§_-2jV§(§_-62U§,§_-3Y-§);
         this.happiness = param1.§_-2jV§(§_-Bhi§,§_-3Y-§);
         this.satiety = param1.§_-2jV§(§_-9rR§,§_-3Y-§);
         this.tags = param1.§_-Bc6§(§_-24l§,String);
         this.experience = param1.getInt(§_-4kC§);
      }
      
      public function clone() : §_-xE§
      {
         return §_-A8q§.§_-7t§(this);
      }
   }
}

