package §_-1Vu§
{
   import §_-18o§.§_-A1F§;
   import §_-18o§.§_-ABX§;
   import §_-2U3§.ResourceManager;
   import §_-3AW§.§_-7k§;
   import §_-52p§.§_-25R§;
   import §_-6-L§.§_-3hw§;
   import §_-8Hp§.§_-5KD§;
   import §_-9VF§.§_-48g§;
   import §_-9VF§.§_-5ab§;
   import §_-C-a§.§_-3uA§;
   import §_-GM§.Context;
   import §_-kr§.§_-2NT§;
   import flash.display.MovieClip;
   
   public class ClothesSetItem
   {
      public static const §_-6DO§:String = "costumes";
      
      private var §_-AcP§:String = null;
      
      private var §_-BSf§:String = null;
      
      private var _label:String = null;
      
      private var §_-24q§:String = null;
      
      private var §_-Vg§:String = null;
      
      private var §_-S3§:Boolean = false;
      
      private var _priority:int = 0;
      
      private var §_-8cb§:String = null;
      
      private var §_-8cV§:Boolean = false;
      
      private var §_-6Og§:String = "costumes";
      
      private var §_-41x§:Boolean = false;
      
      private var §_-V9§:Boolean = false;
      
      private var §_-5Nr§:Boolean = false;
      
      private var §_-Azd§:Boolean = false;
      
      private var _items:Array = [];
      
      public function ClothesSetItem()
      {
         super();
      }
      
      public function configure(param1:XML) : void
      {
         var _loc2_:XML = null;
         this.§_-AcP§ = !!param1.hasOwnProperty("@id") ? String(param1["@id"]) : "";
         this.§_-BSf§ = !!param1.hasOwnProperty("@gender") ? String(param1["@gender"]) : "";
         this._label = !!param1.hasOwnProperty("@label") ? String(param1["@label"]) : "";
         this.§_-24q§ = !!param1.hasOwnProperty("@description") ? String(param1["@description"]) : "";
         this.§_-Vg§ = !!param1.hasOwnProperty("@iconName") ? String(param1["@iconName"]) : "";
         this.§_-S3§ = Boolean(param1.hasOwnProperty("@wedding")) && int(param1["@wedding"]) == 1;
         this.§_-8cb§ = !!param1.hasOwnProperty("@holiday") ? String(param1["@holiday"]) : null;
         this.§_-8cV§ = Boolean(param1.hasOwnProperty("@isMainCategory")) && int(param1["@isMainCategory"]) == 1;
         this.§_-6Og§ = !!param1.hasOwnProperty("@categoryId") ? String(param1["@categoryId"]) : §_-6DO§;
         this._priority = !!param1.hasOwnProperty("@priority") ? int(param1["@priority"]) : 0;
         this.§_-Azd§ = Boolean(param1.hasOwnProperty("@isNew")) && int(param1["@isNew"]) == 1;
         this.§_-41x§ = !param1.hasOwnProperty("@canBuy") || int(param1["@canBuy"]) == 1;
         this.§_-V9§ = !param1.hasOwnProperty("@canShow") || int(param1["@canShow"]) == 1;
         this.§_-5Nr§ = !!param1.hasOwnProperty("@clanOnly") ? int(param1["@clanOnly"]) == 1 : false;
         this._items = [];
         for each(_loc2_ in §_-3hw§.§_-3bk§(param1,"item"))
         {
            if(_loc2_.hasOwnProperty("@itemId"))
            {
               this._items.push(_loc2_["@itemId"]);
            }
         }
      }
      
      public function get id() : String
      {
         return this.§_-AcP§;
      }
      
      public function get gender() : int
      {
         return this.§_-BSf§ == "boy" ? §_-3uA§.§_-908§ : §_-3uA§.§_-BO7§;
      }
      
      public function get localizedLabel() : String
      {
         return §_-ABX§.§_-631§(this._label);
      }
      
      public function get localizedDescription() : String
      {
         return §_-ABX§.§_-631§(this.§_-24q§);
      }
      
      public function get icon() : MovieClip
      {
         var iconLibrary:String;
         var icon:§_-7k§ = null;
         if(this.§_-Vg§ == null || this.§_-Vg§.indexOf("@") < 0)
         {
            return new MovieClip();
         }
         iconLibrary = this.§_-Vg§.split("@")[1];
         if(!ResourceManager.§_-7Bo§(iconLibrary))
         {
            icon = new §_-7k§();
            §_-2NT§.§_-5vY§(iconLibrary).then(function():void
            {
               if(ResourceManager.hasDefinition(§_-Vg§))
               {
                  icon.addChild(ResourceManager.createMovieClip(§_-Vg§));
               }
            });
            return icon;
         }
         return ResourceManager.hasDefinition(this.§_-Vg§) ? ResourceManager.createMovieClip(this.§_-Vg§) : new MovieClip();
      }
      
      public function get items() : Array
      {
         return this._items;
      }
      
      public function get §_-AvQ§() : Boolean
      {
         return this.§_-S3§;
      }
      
      public function get priority() : int
      {
         return this._priority;
      }
      
      public function get §_-25A§() : String
      {
         return §_-ABX§.§_-631§(this.§_-6Og§ + "Label");
      }
      
      public function get §_-2KE§() : Boolean
      {
         return this.§_-8cV§;
      }
      
      public function get categoryId() : String
      {
         return this.§_-6Og§;
      }
      
      public function get holiday() : String
      {
         return this.§_-8cb§;
      }
      
      public function get isNew() : Boolean
      {
         return this.§_-Azd§;
      }
      
      public function get canBuy() : Boolean
      {
         return this.§_-41x§ && §_-5KD§.instance.§_-1NH§(this.§_-AcP§) && this.§_-BnD§;
      }
      
      public function get §_-RX§() : Boolean
      {
         return this.§_-V9§;
      }
      
      public function get §_-BnD§() : Boolean
      {
         return this.holiday == null || §_-5KD§.instance.§_-C6D§(this.holiday);
      }
      
      public function get §_-wn§() : Boolean
      {
         return this.§_-5Nr§;
      }
      
      public function §_-8ya§(param1:§_-5ab§) : Boolean
      {
         if(param1 is §_-48g§)
         {
            return this.§_-50§(param1 as §_-48g§);
         }
         var _loc2_:§_-Awf§ = null;
         var _loc3_:int = 0;
         while(_loc3_ < this.clothesItems.length)
         {
            _loc2_ = this.clothesItems[_loc3_] as §_-Awf§;
            if(!param1.hasClothes(_loc2_.typeId))
            {
               return true;
            }
            _loc3_++;
         }
         return false;
      }
      
      public function §_-50§(param1:§_-48g§) : Boolean
      {
         var _loc2_:String = null;
         var _loc3_:Array = null;
         var _loc4_:String = null;
         for each(_loc2_ in this._items)
         {
            _loc3_ = _loc2_.split(":");
            _loc4_ = _loc3_.length > 1 ? _loc3_[1] : null;
            if(!param1.§_-2dL§(_loc3_[0],_loc4_))
            {
               return true;
            }
         }
         return false;
      }
      
      private function §_-08D§(param1:String, param2:Boolean = true) : int
      {
         if(Context.player is §_-48g§)
         {
            return this.§_-60x§(param1,param2);
         }
         var _loc3_:Array = this.clothesItems;
         var _loc4_:int = 0;
         var _loc5_:§_-Awf§ = null;
         var _loc6_:int = 0;
         while(_loc6_ < _loc3_.length)
         {
            _loc5_ = _loc3_[_loc6_] as §_-Awf§;
            if(!(param2 && Context.player.hasClothes(_loc5_.typeId)))
            {
               _loc4_ += §_-A1F§.§_-26l§(_loc5_,param1) && _loc5_[param1] is int ? _loc5_[param1] as int : 0;
            }
            _loc6_++;
         }
         return _loc4_;
      }
      
      private function §_-60x§(param1:String, param2:Boolean = true) : int
      {
         var _loc4_:String = null;
         var _loc5_:Array = null;
         var _loc6_:String = null;
         var _loc7_:§_-Awf§ = null;
         var _loc3_:int = 0;
         for each(_loc4_ in this._items)
         {
            _loc5_ = _loc4_.split(":");
            _loc6_ = _loc5_.length > 1 ? _loc5_[1] : null;
            if(!(param2 && Context.cityPlayer.§_-2dL§(_loc5_[0],_loc6_)))
            {
               _loc7_ = Context.§_-70S§.§_-0ZU§().findTypeById(_loc5_[0]) as §_-Awf§;
               if(_loc7_ != null)
               {
                  _loc3_ += §_-A1F§.§_-26l§(_loc7_,param1) && _loc7_[param1] is int ? _loc7_[param1] as int : 0;
               }
            }
         }
         return _loc3_;
      }
      
      private function §_-Bfw§(param1:String, param2:String, param3:Boolean = true) : int
      {
         var _loc6_:§_-Awf§ = null;
         var _loc4_:Array = this.clothesItems;
         var _loc5_:int = 0;
         for each(_loc6_ in _loc4_)
         {
            if(!(param3 && Context.player.hasClothes(_loc6_.typeId)))
            {
               if(§_-A1F§.§_-26l§(_loc6_,param1) && _loc6_[param1] is int)
               {
                  if(_loc6_[param1] == 0)
                  {
                     if(§_-A1F§.§_-26l§(_loc6_,param2) && _loc6_[param2] is int)
                     {
                        _loc5_ += _loc6_[param2];
                     }
                  }
                  else
                  {
                     _loc5_ += _loc6_[param1];
                  }
               }
            }
         }
         return _loc5_;
      }
      
      public function get rating() : int
      {
         return this.§_-08D§("rating",false);
      }
      
      public function get isSaleItem() : Boolean
      {
         return §_-5KD§.instance.isSaleItem(this.id);
      }
      
      public function get silverPrice() : int
      {
         var _loc1_:Number = NaN;
         if(§_-5KD§.instance.isSaleItem(this.id))
         {
            _loc1_ = §_-5KD§.instance.getSaleItem(this.id).silver / 100;
            return Math.round(this.§_-Bfw§("oldSilverPrice","silver") * (1 - _loc1_));
         }
         return this.§_-08D§("silver");
      }
      
      public function get goldPrice() : int
      {
         var _loc1_:Number = NaN;
         if(§_-5KD§.instance.isSaleItem(this.id))
         {
            _loc1_ = §_-5KD§.instance.getSaleItem(this.id).gold / 100;
            return Math.round(this.§_-Bfw§("oldGoldPrice","gold") * (1 - _loc1_));
         }
         return this.§_-08D§("gold");
      }
      
      public function get oldGoldPrice() : int
      {
         var _loc1_:int = this.§_-Bfw§("oldGoldPrice","gold");
         return _loc1_ != this.goldPrice ? _loc1_ : 0;
      }
      
      public function get oldSilverPrice() : int
      {
         var _loc1_:int = this.§_-Bfw§("oldSilverPrice","silver");
         return _loc1_ != this.silverPrice ? _loc1_ : 0;
      }
      
      public function get §_-B3P§() : Boolean
      {
         var _loc1_:Array = this.clothesItems;
         var _loc2_:§_-Awf§ = null;
         var _loc3_:int = 0;
         while(_loc3_ < _loc1_.length)
         {
            _loc2_ = _loc1_[_loc3_] as §_-Awf§;
            if(!Context.player.hasClothes(_loc2_.typeId))
            {
               if(_loc2_.isVip)
               {
                  return true;
               }
            }
            _loc3_++;
         }
         return false;
      }
      
      public function get §_-6GT§() : §_-25R§
      {
         return new §_-25R§(this.goldPrice,this.silverPrice);
      }
      
      public function get clothesItems() : Array
      {
         var _loc2_:String = null;
         var _loc3_:§_-Awf§ = null;
         var _loc1_:Array = [];
         for each(_loc2_ in this._items)
         {
            _loc3_ = Context.§_-70S§.§_-0ZU§().findTypeById(_loc2_.split(":")[0]) as §_-Awf§;
            if(_loc3_ != null)
            {
               _loc1_.push(_loc3_);
            }
         }
         return _loc1_;
      }
      
      public function hasItem(param1:String) : Boolean
      {
         var _loc2_:String = null;
         for each(_loc2_ in this._items)
         {
            if(_loc2_.split(":")[0] == param1)
            {
               return true;
            }
         }
         return false;
      }
   }
}

