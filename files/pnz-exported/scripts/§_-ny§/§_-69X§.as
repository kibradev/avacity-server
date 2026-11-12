package §_-ny§
{
   import §_-18o§.§_-ABX§;
   import §_-1T2§.§_-BWW§;
   import §_-1Vu§.ClothesCollectionItem;
   import §_-1Vu§.ClothesSetItem;
   import §_-1Vu§.§_-3pX§;
   import §_-1Vu§.§_-Awf§;
   import §_-1sb§.§_-2xb§;
   import §_-3hC§.§_-3-x§;
   import §_-5JJ§.§_-15C§;
   import §_-5Us§.§_-1Dh§;
   import §_-5eM§.§_-5jU§;
   import §_-5wm§.InventoryItem;
   import §_-5wm§.§_-5YM§;
   import §_-6-L§.§_-49j§;
   import §_-6EN§.§_-BjY§;
   import §_-9VF§.§_-48g§;
   import §_-9VF§.§_-5ab§;
   import §_-AKx§.§_-0jI§;
   import §_-AKx§.§_-2-c§;
   import §_-AKx§.§_-4OH§;
   import §_-AMb§.§_-Aym§;
   import §_-AOz§.§_-4aX§;
   import §_-C-a§.§_-3uA§;
   import §_-GM§.Context;
   
   public class §_-69X§
   {
      public static const §_-3IG§:String = "outside";
      
      public static const §_-6P7§:String = "swim";
      
      public static const §_-6No§:String = "swimOutsideLocation";
      
      public static const §_-0KP§:String = "wedding";
      
      public static const §_-Bbb§:String = "ballroom";
      
      public static const §_-9hf§:String = "beach";
      
      public static const §_-70w§:int = 5;
      
      public static const §_-CVt§:String = "dressCode";
      
      public static const §_-A41§:String = "boyUnderdress1";
      
      public static const §_-6gs§:String = "girlUnderdress1";
      
      public static const §_-10G§:String = "girlUnderdress2";
      
      public static const §_-CHb§:Array = [§_-BjY§.§_-AwB§,§_-BjY§.§_-Bgt§];
      
      public static const §_-Ip§:String = "10";
      
      private static const §_-CKf§:Array = ["girlBtsPnd","girlPntsPnd","girlTShrtPnd"];
      
      private static const §_-7N7§:Array = ["boySMR14Sh3","boyRshPnt","boyTShrtHsk"];
      
      private static const §_-A2P§:String = "conflict";
      
      private var §_-9TH§:Object = {};
      
      private var §_-6JK§:Object = {};
      
      private var §_-3LT§:Object = {};
      
      private var §_-5h2§:Object = {};
      
      private var §_-4In§:int = 0;
      
      public function §_-69X§()
      {
         super();
      }
      
      public static function §_-3yo§(param1:§_-4aX§, param2:String) : Boolean
      {
         if(param2 == null)
         {
            return true;
         }
         switch(param2)
         {
            case §_-3IG§:
               return §_-3NR§(param1);
            case §_-6P7§:
               return §_-73N§(param1);
            case §_-6No§:
               return §_-6Bj§(param1);
            case §_-0KP§:
               return §_-6zc§(param1);
            case §_-Bbb§:
               return §_-Aew§(param1);
            case §_-9hf§:
               return §_-3NR§(param1) || §_-5VP§(param1);
            default:
               return true;
         }
      }
      
      private static function §_-5VP§(param1:§_-4aX§) : Boolean
      {
         return (param1.hasClothesByCategory(§_-BjY§.§_-5oJ§) || param1.hasClothesByCategory(§_-BjY§.§_-0s§)) && (param1.hasClothesByCategory(§_-BjY§.§_-5b4§) || param1.hasClothesByCategory(§_-BjY§.§_-AiE§));
      }
      
      private static function §_-6Bj§(param1:§_-4aX§) : Boolean
      {
         return (param1.hasClothesByCategory(§_-BjY§.§_-5oJ§) || param1.hasClothesByCategory(§_-BjY§.§_-0s§)) && !(param1.hasClothesByCategory(§_-BjY§.§_-7lf§) || param1.hasClothesByCategory(§_-BjY§.§_-1tK§));
      }
      
      private static function §_-Aew§(param1:§_-4aX§) : Boolean
      {
         return §_-6rQ§(param1) || §_-9EW§(param1);
      }
      
      private static function §_-9EW§(param1:§_-4aX§) : Boolean
      {
         return param1.hasClothesByCategory(§_-BjY§.§_-2nQ§) && param1.hasClothesByCategory(§_-BjY§.§_-AiE§);
      }
      
      private static function §_-6rQ§(param1:§_-4aX§) : Boolean
      {
         return param1.hasClothesByCategory(§_-BjY§.§_-31O§) && param1.hasClothesByCategory(§_-BjY§.§_-5b4§) && (param1.hasClothesByCategory(§_-BjY§.§_-0t1§) || param1.hasClothesByCategory(§_-BjY§.§_-8yP§));
      }
      
      private static function §_-6zc§(param1:§_-4aX§) : Boolean
      {
         return param1.hasClothesByCategory(§_-BjY§.§_-1fA§) && param1.hasClothesByCategory(§_-BjY§.§_-Hb§) && param1.hasClothesByCategory(§_-BjY§.§_-BCL§) || param1.hasClothesByCategory(§_-BjY§.§_-0O6§);
      }
      
      private static function §_-73N§(param1:§_-4aX§) : Boolean
      {
         return (param1.hasClothesByCategory(§_-BjY§.§_-5oJ§) || param1.hasClothesByCategory(§_-BjY§.§_-0s§)) && !(param1.hasClothesByCategory(§_-BjY§.§_-5b4§) || param1.hasClothesByCategory(§_-BjY§.§_-AiE§)) && !(param1.hasClothesByCategory(§_-BjY§.§_-7lf§) || param1.hasClothesByCategory(§_-BjY§.§_-1tK§));
      }
      
      private static function §_-3NR§(param1:§_-4aX§) : Boolean
      {
         if(param1.hasClothesByCategory(§_-BjY§.§_-9kD§) || param1.hasClothesByCategory(§_-BjY§.§_-4Ny§))
         {
            return false;
         }
         if(param1.hasClothesByCategory(§_-BjY§.§_-5oJ§) || param1.hasClothesByCategory(§_-BjY§.§_-0s§))
         {
            return false;
         }
         if(!param1.hasClothesByCategory(§_-BjY§.§_-6oo§) && !param1.hasClothesByCategory(§_-BjY§.§_-8oP§) && !param1.hasClothesByCategory(§_-BjY§.§_-5b4§) && !param1.hasClothesByCategory(§_-BjY§.§_-AiE§))
         {
            return false;
         }
         return true;
      }
      
      public static function §_-2z8§(param1:String, param2:Boolean = false) : void
      {
         var noDressMessage:String = null;
         var badDressMessageText:String = null;
         var dressCode:String = param1;
         var isConfirm:Boolean = param2;
         var gender:int = Context.player.avatarAppearance.gender == §_-3uA§.§_-908§ ? §_-2xb§.§_-dv§ : §_-2xb§.§_-BYe§;
         if(isConfirm)
         {
            if(dressCode == §_-Bbb§)
            {
               noDressMessage = §_-ABX§.§_-631§("#dressCodeBallRoomWarning",gender) + " " + Context.§_-5o8§.message("dressCodeConfirm");
               §_-4OH§.confirm(Context.§_-5o8§.message("dressCode"),noDressMessage,function(param1:§_-2-c§):void
               {
                  if(param1.§_-B66§.modalResult == §_-0jI§.§_-9qy§)
                  {
                     new §_-BWW§(Context.cityPlayer,Context.player.avatarAppearance.gender == §_-3uA§.§_-908§ ? "boyShirts" : "girlDress").showModal();
                  }
               });
            }
            else
            {
               §_-4OH§.confirm(Context.§_-5o8§.message("dressCode"),Context.§_-5o8§.message("dressCodeOutsideWarning") + " " + Context.§_-5o8§.message("dressCodeConfirm"),function(param1:§_-2-c§):void
               {
                  if(param1.§_-B66§.modalResult == §_-0jI§.§_-9qy§)
                  {
                     new §_-BWW§(Context.cityPlayer).showModal();
                  }
               });
            }
         }
         else
         {
            badDressMessageText = dressCode == §_-Bbb§ ? §_-ABX§.§_-631§("#dressCodeBallRoomWarning",gender) : Context.§_-5o8§.message("dressCodeOutsideWarning");
            §_-4OH§.§_-B5P§(Context.§_-5o8§.message("dressCode"),badDressMessageText);
            if(Context.§_-3hG§.currentScreen is §_-3-x§ || Context.§_-3hG§.currentScreen is §_-Aym§ || Context.§_-3hG§.currentScreen is §_-15C§)
            {
               Context.§_-CLP§.visitCityHouse();
            }
         }
      }
      
      public static function §_-4Xn§(param1:§_-5YM§, param2:String) : Boolean
      {
         var _loc4_:Boolean = false;
         var _loc5_:Boolean = false;
         var _loc6_:Boolean = false;
         var _loc3_:InventoryItem = null;
         switch(param2)
         {
            case §_-0KP§:
               _loc4_ = false;
               _loc5_ = false;
               _loc6_ = false;
               for each(_loc3_ in param1.items)
               {
                  if(_loc3_.type.category.findParentById(§_-BjY§.§_-0O6§))
                  {
                     return true;
                  }
                  if(!_loc4_ && Boolean(_loc3_.type.category.findParentById(§_-BjY§.§_-1fA§)))
                  {
                     _loc4_ = true;
                  }
                  if(!_loc5_ && Boolean(_loc3_.type.category.findParentById(§_-BjY§.§_-Hb§)))
                  {
                     _loc5_ = true;
                  }
                  if(!_loc6_ && Boolean(_loc3_.type.category.findParentById(§_-BjY§.§_-BCL§)))
                  {
                     _loc6_ = true;
                  }
                  if(_loc5_ && _loc4_ && _loc6_)
                  {
                     return true;
                  }
               }
               return false;
            default:
               return true;
         }
      }
      
      public function §_-A1K§(param1:XML) : void
      {
         var _loc3_:XML = null;
         var _loc2_:ClothesSetItem = null;
         for each(_loc3_ in param1.elements("clothesSet"))
         {
            _loc2_ = new ClothesSetItem();
            _loc2_.configure(_loc3_);
            this.§_-9TH§[_loc2_.id] = _loc2_;
         }
      }
      
      public function §_-9NB§(param1:XML) : void
      {
         var _loc3_:XML = null;
         if(param1 == null)
         {
            return;
         }
         var _loc2_:ClothesCollectionItem = null;
         for each(_loc3_ in param1.elements("clothesCollection"))
         {
            _loc2_ = new ClothesCollectionItem();
            _loc2_.configure(_loc3_);
            this.§_-3LT§[_loc2_.id] = _loc2_;
         }
      }
      
      public function §_-EH§(param1:XML) : void
      {
         var _loc2_:XML = null;
         var _loc3_:String = null;
         for each(_loc2_ in param1.elements("rule"))
         {
            _loc3_ = !!_loc2_.hasOwnProperty("@type") ? _loc2_["@type"] : null;
            switch(_loc3_)
            {
               case §_-A2P§:
                  this.§_-7MO§(_loc2_["@category1"],_loc2_["@category2"]);
                  break;
            }
         }
      }
      
      public function §_-7nW§(param1:XML) : void
      {
         var _loc2_:XML = null;
         var _loc3_:§_-3pX§ = null;
         for each(_loc2_ in param1.elements("set"))
         {
            _loc3_ = new §_-3pX§(_loc2_);
            this.§_-5h2§[_loc3_.index] = _loc3_;
            ++this.§_-4In§;
         }
      }
      
      public function get §_-9vz§() : int
      {
         return this.§_-4In§;
      }
      
      public function §_-28Q§(param1:String) : Array
      {
         return !!this.§_-5h2§.hasOwnProperty(param1) ? (this.§_-5h2§[param1] as §_-3pX§).colors : [];
      }
      
      public function §_-6WF§(param1:§_-Awf§, param2:§_-Awf§) : Boolean
      {
         var _loc5_:String = null;
         if(param1.category == null || param2.category == null)
         {
            return false;
         }
         if(§_-CHb§.indexOf(param1.category.categoryId) >= 0 || §_-CHb§.indexOf(param2.category.categoryId) >= 0)
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
                  if(Boolean(this.§_-6JK§.hasOwnProperty(_loc5_)) && (this.§_-6JK§[_loc5_] as Array).indexOf(_loc4_.categoryId) >= 0)
                  {
                     return true;
                  }
               }
            }
            _loc4_ = _loc4_.parent;
         }
         return false;
      }
      
      private function §_-7MO§(param1:String, param2:String) : void
      {
         if(!this.§_-6JK§.hasOwnProperty(param1))
         {
            this.§_-6JK§[param1] = [];
         }
         (this.§_-6JK§[param1] as Array).push(param2);
         if(!this.§_-6JK§.hasOwnProperty(param2))
         {
            this.§_-6JK§[param2] = [];
         }
         (this.§_-6JK§[param2] as Array).push(param1);
      }
      
      public function §_-7j3§(param1:String) : ClothesSetItem
      {
         return !!this.§_-9TH§.hasOwnProperty(param1) ? this.§_-9TH§[param1] : null;
      }
      
      public function get §_-3Wn§() : uint
      {
         return §_-49j§.§_-FR§(this.§_-9TH§).length;
      }
      
      public function §_-5jx§(param1:int, param2:§_-48g§) : Array
      {
         var _loc4_:ClothesSetItem = null;
         var _loc3_:Array = [];
         for each(_loc4_ in this.§_-9TH§)
         {
            if(!(!_loc4_.§_-RX§ || !_loc4_.§_-BnD§ && !this.§_-Bmv§(_loc4_,param2)))
            {
               if(_loc4_.gender == param1)
               {
                  if(this.§_-2vl§(_loc4_,param2))
                  {
                     _loc3_.push(_loc4_);
                  }
               }
            }
         }
         return _loc3_;
      }
      
      public function §_-2vl§(param1:ClothesSetItem, param2:§_-48g§) : Boolean
      {
         var _loc5_:Boolean = false;
         var _loc6_:Boolean = false;
         var _loc3_:§_-Awf§ = null;
         var _loc4_:int = 0;
         while(_loc4_ < param1.clothesItems.length)
         {
            _loc3_ = param1.clothesItems[_loc4_] as §_-Awf§;
            _loc5_ = param2.hasClothes(_loc3_.typeId);
            _loc6_ = this.isDefaultItem(_loc3_.typeId);
            if(_loc5_ && !_loc6_)
            {
               return true;
            }
            _loc4_++;
         }
         return false;
      }
      
      public function §_-5Xh§(param1:String) : Boolean
      {
         var _loc2_:ClothesSetItem = this.§_-7j3§(param1);
         if(_loc2_ == null)
         {
            return false;
         }
         return this.§_-Bmv§(_loc2_,Context.cityPlayer);
      }
      
      public function §_-Bmv§(param1:ClothesSetItem, param2:§_-48g§) : Boolean
      {
         var _loc3_:§_-Awf§ = null;
         var _loc4_:int = 0;
         while(_loc4_ < param1.clothesItems.length)
         {
            _loc3_ = param1.clothesItems[_loc4_] as §_-Awf§;
            if(!param2.hasClothes(_loc3_.typeId))
            {
               return false;
            }
            _loc4_++;
         }
         return true;
      }
      
      private function isDefaultItem(param1:String) : Boolean
      {
         return §_-CKf§.indexOf(param1) >= 0 || §_-7N7§.indexOf(param1) >= 0;
      }
      
      public function §_-076§(param1:int, param2:§_-5ab§ = null) : Array
      {
         var _loc4_:ClothesSetItem = null;
         var _loc3_:Array = [];
         for each(_loc4_ in this.§_-9TH§)
         {
            if(_loc4_.gender == param1)
            {
               if(!(param2 != null && !_loc4_.§_-8ya§(param2)))
               {
                  _loc3_.push(_loc4_);
               }
            }
         }
         return _loc3_;
      }
      
      public function §_-8tJ§(param1:String) : String
      {
         var _loc2_:ClothesSetItem = null;
         var _loc3_:String = null;
         for each(_loc2_ in this.§_-9TH§)
         {
            for each(_loc3_ in _loc2_.items)
            {
               if(_loc3_ == param1)
               {
                  return _loc2_.id;
               }
            }
         }
         return null;
      }
      
      public function get clothesSets() : Object
      {
         return this.§_-9TH§;
      }
      
      public function §_-5Zv§(param1:int, param2:§_-5ab§ = null) : Array
      {
         var _loc4_:ClothesSetItem = null;
         var _loc3_:Array = [];
         for each(_loc4_ in this.§_-9TH§)
         {
            if(_loc4_.§_-AvQ§ && _loc4_.gender == param1)
            {
               if(!(param2 != null && !_loc4_.§_-8ya§(param2)))
               {
                  _loc3_.push(_loc4_);
               }
            }
         }
         return _loc3_;
      }
      
      public function §_-AdW§(param1:int) : Array
      {
         var _loc3_:ClothesCollectionItem = null;
         var _loc2_:Array = [];
         for each(_loc3_ in this.§_-3LT§)
         {
            if(_loc3_.gender == param1)
            {
               _loc2_.push(_loc3_);
            }
         }
         return _loc2_;
      }
      
      public function §_-2aQ§(param1:String) : ClothesCollectionItem
      {
         return !!this.§_-3LT§.hasOwnProperty(param1) ? this.§_-3LT§[param1] : null;
      }
      
      public function §_-CKw§() : Array
      {
         var _loc2_:§_-3pX§ = null;
         var _loc3_:§_-1Dh§ = null;
         var _loc1_:Array = [];
         for each(_loc2_ in this.§_-5h2§)
         {
            _loc3_ = new §_-1Dh§(new XML(),_loc2_.index);
            _loc3_.value = _loc2_.defaultColor;
            _loc1_.push(_loc3_);
         }
         return _loc1_;
      }
   }
}

