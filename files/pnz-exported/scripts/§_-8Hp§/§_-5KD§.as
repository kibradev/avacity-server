package §_-8Hp§
{
   import §_-02i§.§_-74F§;
   import §_-0CA§.§_-59p§;
   import §_-0CA§.§_-6Jc§;
   import §_-0CA§.§_-8fk§;
   import §_-0CA§.§_-BsT§;
   import §_-0Uz§.§_-6v4§;
   import §_-0aF§.§_-2ur§;
   import §_-0uA§.§_-3YE§;
   import §_-18o§.§_-A1F§;
   import §_-1Vu§.ClothesCollectionItem;
   import §_-1Vu§.ClothesSetItem;
   import §_-2S7§.§_-75P§;
   import §_-2qd§.§_-9ai§;
   import §_-3eZ§.§_-BCG§;
   import §_-40e§.§_-1m0§;
   import §_-4J9§.§_-0B7§;
   import §_-4cY§.FurnitureCollectionItem;
   import §_-4cY§.FurnitureSetItem;
   import §_-5wm§.InventoryItem;
   import §_-5wm§.§_-BOZ§;
   import §_-6-L§.§_-49j§;
   import §_-6-L§.§_-6aF§;
   import §_-6Qn§.§_-3X1§;
   import §_-8Cv§.§_-3Wc§;
   import §_-8I6§.§_-0sT§;
   import §_-8i3§.§_-2E0§;
   import §_-8i3§.§_-XJ§;
   import §_-99s§.§_-Bjo§;
   import §_-9St§.§_-0Tb§;
   import §_-9VF§.§_-48g§;
   import §_-9VF§.§_-5ab§;
   import §_-9VF§.§_-9df§;
   import §_-AKx§.§_-0jI§;
   import §_-AKx§.§_-2-c§;
   import §_-AKx§.§_-4OH§;
   import §_-AKx§.§_-5hc§;
   import §_-AOz§.§_-2pt§;
   import §_-AOz§.§_-5SV§;
   import §_-B2D§.BlackFriday20Dialog;
   import §_-B2D§.§_-0j1§;
   import §_-B2D§.§_-14h§;
   import §_-B2D§.§_-442§;
   import §_-B2D§.§_-67s§;
   import §_-B2D§.§_-7GY§;
   import §_-B2D§.§_-7Wz§;
   import §_-B2D§.§_-7fr§;
   import §_-B2D§.§_-8EF§;
   import §_-B2D§.§_-CYu§;
   import §_-B68§.§_-A-e§;
   import §_-BeZ§.§_-4Ww§;
   import §_-ByP§.§_-0CV§;
   import §_-ByP§.§_-A7b§;
   import §_-GM§.Context;
   import §_-kr§.§_-0wT§;
   import §_-kr§.§_-Ud§;
   import §_-uu§.§_-1-v§;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import penzville.Application;
   
   public class §_-5KD§ extends §_-6v4§
   {
      private static const §_-4dC§:String = "replaceSwf";
      
      private static const §_-CPv§:String = "replaceMap";
      
      private static const §_-Bej§:int = 5 * 60 * 1000;
      
      private static var _instance:§_-5KD§ = null;
      
      private var §_-9pV§:Object = {};
      
      private var _timer:Timer = null;
      
      private var §_-0qv§:Object = {};
      
      private var §_-18U§:Object = {};
      
      private var §_-3kq§:Array = [];
      
      private var _inited:Boolean = false;
      
      private var §_-CIY§:Array = [];
      
      private var §_-Aup§:Array = [];
      
      private var §_-Bqc§:Object = {};
      
      private var §_-66i§:Object = {};
      
      public function §_-5KD§()
      {
         super();
         §_-1-t§(§_-0Tb§.§_-4Y8§,this.onNewCampaigns);
         §_-1-t§(§_-0Tb§.§_-53M§,this.§_-BKV§);
         §_-1-t§(§_-0Tb§.§_-28A§,this.§_-B6i§);
         §_-1-t§(§_-0Tb§.§_-0eV§,this.§_-C11§);
      }
      
      public static function get instance() : §_-5KD§
      {
         if(_instance == null)
         {
            _instance = new §_-5KD§();
         }
         return _instance;
      }
      
      private static function §_-0q5§(param1:String) : Object
      {
         var _loc4_:String = null;
         var _loc5_:Array = null;
         var _loc2_:Object = {};
         var _loc3_:Array = param1.split(";");
         for each(_loc4_ in _loc3_)
         {
            _loc5_ = _loc4_.split(":");
            if(_loc5_.length == 2)
            {
               _loc2_[_loc5_[0]] = _loc5_[1];
            }
         }
         return _loc2_;
      }
      
      public function §_-2ZE§(param1:int) : Object
      {
         var _loc4_:§_-A7b§ = null;
         var _loc5_:Array = null;
         var _loc6_:String = null;
         var _loc7_:Array = null;
         var _loc2_:Object = {};
         var _loc3_:§_-0CV§ = this.§_-0S-§(param1);
         if(_loc3_ == null || _loc3_.campaignItemList.length <= 0)
         {
            return _loc2_;
         }
         for each(_loc4_ in _loc3_.campaignItemList)
         {
            _loc5_ = _loc4_.typeId.split(";");
            for each(_loc6_ in _loc5_)
            {
               _loc7_ = _loc6_.split(":");
               if(_loc7_.length == 2)
               {
                  _loc2_[_loc7_[0]] = _loc7_[1];
               }
            }
         }
         return _loc2_;
      }
      
      public function §_-48m§() : Array
      {
         var _loc2_:§_-0CV§ = null;
         var _loc3_:§_-75P§ = null;
         var _loc1_:Array = [];
         if(Context.cityPlayer.isTutorial || !this.§_-C3W§())
         {
            return _loc1_;
         }
         for each(_loc2_ in this.§_-9pV§)
         {
            if(§_-BsT§.§_-3Sq§(§_-BsT§.§_-4AZ§).types.indexOf(_loc2_.type) >= 0)
            {
               _loc3_ = this.§_-3TO§(_loc2_);
               if(_loc3_ != null && _loc3_.canShowDialog())
               {
                  _loc1_.push(_loc3_);
               }
            }
         }
         return _loc1_;
      }
      
      public function §_-AQ4§() : Array
      {
         var _loc2_:§_-0CV§ = null;
         var _loc3_:§_-75P§ = null;
         var _loc4_:§_-0B7§ = null;
         var _loc5_:§_-A-e§ = null;
         var _loc1_:Array = [];
         if(Context.cityPlayer.isTutorial || !this.§_-C3W§())
         {
            return _loc1_;
         }
         for each(_loc2_ in this.§_-9pV§)
         {
            if(_loc2_.getItem(§_-0B7§.MODULE_ID) != null)
            {
               _loc4_ = new §_-0B7§(_loc2_);
               _loc1_.push(_loc4_);
            }
            else if(_loc2_.getItem(§_-A-e§.MODULE_ID) != null)
            {
               _loc5_ = new §_-A-e§(_loc2_);
               _loc1_.push(_loc5_);
            }
            else if(this.§_-BEg§(_loc2_))
            {
               if(this.§_-AXw§(_loc2_.id) == null)
               {
                  if(§_-BsT§.§_-3Sq§(§_-BsT§.§_-4AZ§).types.indexOf(_loc2_.type) < 0)
                  {
                     _loc3_ = this.§_-3TO§(_loc2_);
                     if(_loc3_ != null && _loc3_.canShowDialog())
                     {
                        _loc1_.push(_loc3_);
                     }
                  }
               }
            }
         }
         return this.§_-6Sn§(_loc1_);
      }
      
      private function §_-6Sn§(param1:Array) : Array
      {
         var _loc4_:§_-75P§ = null;
         var _loc2_:Array = [];
         var _loc3_:§_-75P§ = null;
         for each(_loc4_ in param1)
         {
            if(_loc4_ is BlackFriday20Dialog)
            {
               _loc3_ = _loc4_;
            }
            else
            {
               _loc2_.push(_loc4_);
            }
         }
         if(_loc3_ != null)
         {
            _loc2_.push(_loc3_);
            _loc2_.reverse();
         }
         return _loc2_;
      }
      
      public function §_-BEg§(param1:§_-0CV§) : Boolean
      {
         return param1.visible && param1.type != §_-BsT§.MODULES && param1.type != §_-BsT§.RESTRICTIONS;
      }
      
      public function §_-3TO§(param1:§_-0CV§) : §_-75P§
      {
         if(param1 == null)
         {
            return null;
         }
         var _loc2_:§_-75P§ = null;
         switch(param1.type)
         {
            case §_-BsT§.NEW_FURNITURE:
               _loc2_ = new §_-7Wz§(param1);
               break;
            case §_-BsT§.NEW_BUNDLE:
               _loc2_ = new §_-7fr§(param1);
               break;
            case §_-BsT§.NEW_CLOTHES:
               _loc2_ = new §_-67s§(param1);
               break;
            case §_-BsT§.NEW_CLOTHES_SUIT:
               _loc2_ = new §_-67s§(param1);
               break;
            case §_-BsT§.NEW_HAIRSTYLE:
               _loc2_ = new §_-CYu§(param1);
               break;
            case §_-BsT§.SALE:
            case §_-BsT§.SALE_FURNITURE:
               _loc2_ = new §_-7Wz§(param1);
               break;
            case §_-BsT§.SALE_ON_VIP:
               _loc2_ = new §_-3X1§(param1);
               break;
            case §_-BsT§.SALE_ON_GOLD:
               _loc2_ = new §_-74F§(param1);
               break;
            case §_-BsT§.PHOTOSALON_NEW_THEME:
               _loc2_ = new §_-442§(param1);
               break;
            case §_-BsT§.NEW_SUIT_BUNDLE:
               _loc2_ = new §_-0j1§(param1);
               break;
            case §_-BsT§.ROOM_FURNITURE_DESIGN_SALE:
               _loc2_ = new §_-14h§(param1);
               break;
            case §_-BsT§.SALE_CLOTHES_SUIT:
               _loc2_ = new §_-67s§(param1);
               break;
            case §_-BsT§.SALE_CLOTHES_ITEMS:
               _loc2_ = new §_-67s§(param1);
               break;
            case §_-BsT§.NEW_APPEARANCE:
               _loc2_ = new §_-8EF§(param1);
               break;
            case §_-BsT§.SALE_OFFERS:
               _loc2_ = new §_-7GY§(param1);
               break;
            case §_-BsT§.BLACK_FRIDAY:
               _loc2_ = new BlackFriday20Dialog(param1);
               break;
            case §_-BsT§.SALE_ON_PETS:
               _loc2_ = new §_-2ur§(param1);
               break;
            case §_-BsT§.MODULES:
               if(param1.getItem(§_-0B7§.MODULE_ID) != null)
               {
                  _loc2_ = new §_-0B7§(param1);
               }
               else if(param1.getItem(§_-A-e§.MODULE_ID) != null)
               {
                  _loc2_ = new §_-A-e§(param1);
               }
         }
         return _loc2_;
      }
      
      public function canBuyItem(param1:String) : Boolean
      {
         return !this.hasItem(§_-BsT§.RESTRICTIONS,param1);
      }
      
      public function §_-1NH§(param1:String) : Boolean
      {
         var _loc3_:String = null;
         if(this.§_-2-N§(param1))
         {
            return false;
         }
         var _loc2_:ClothesSetItem = Context.§_-Amy§.§_-7j3§(param1);
         if(_loc2_ != null)
         {
            for each(_loc3_ in _loc2_.items)
            {
               if(this.§_-2-N§(_loc3_.split(":")[0]))
               {
                  return false;
               }
            }
         }
         return true;
      }
      
      public function §_-3s9§(param1:String) : Boolean
      {
         var _loc2_:§_-0CV§ = null;
         var _loc3_:§_-A7b§ = null;
         for each(_loc2_ in this.§_-9pV§)
         {
            if(!(_loc2_.type != §_-BsT§.RESTRICTIONS || !this.§_-2A7§(_loc2_)))
            {
               for each(_loc3_ in _loc2_.campaignItemList)
               {
                  if(_loc3_.section == §_-6Jc§.RESTRICTED_COLLECTION)
                  {
                     if(_loc3_.typeId == param1)
                     {
                        return false;
                     }
                  }
               }
            }
         }
         return true;
      }
      
      public function §_-5lk§(param1:String) : Boolean
      {
         var _loc2_:§_-0CV§ = null;
         var _loc3_:§_-A7b§ = null;
         for each(_loc2_ in this.§_-9pV§)
         {
            if(!(_loc2_.type != §_-BsT§.RESTRICTIONS || !this.§_-2A7§(_loc2_)))
            {
               for each(_loc3_ in _loc2_.campaignItemList)
               {
                  if(_loc3_.section == §_-6Jc§.RESTRICTED_ITEM)
                  {
                     if(_loc3_.typeId == param1)
                     {
                        return false;
                     }
                  }
               }
            }
         }
         return true;
      }
      
      public function §_-67h§() : Array
      {
         return this.§_-Byj§(§_-BsT§.NEW_FURNITURE);
      }
      
      public function §_-0wr§() : Array
      {
         var _loc1_:Array = this.§_-Byj§(§_-BsT§.NEW_CLOTHES);
         var _loc2_:Array = this.§_-Byj§(§_-BsT§.NEW_CLOTHES_SUIT);
         §_-49j§.merge(_loc1_,_loc2_);
         return _loc1_;
      }
      
      public function §_-C6D§(param1:String) : Boolean
      {
         if(this.§_-Aup§.indexOf(param1) < 0)
         {
            return false;
         }
         return this.§_-7vo§(param1);
      }
      
      public function isSaleItem(param1:String) : Boolean
      {
         return this.§_-0qv§.hasOwnProperty(param1);
      }
      
      public function §_-9AN§() : Array
      {
         return §_-6aF§.§_-1t1§(this.§_-0qv§);
      }
      
      public function §_-52r§(param1:String) : Array
      {
         return §_-A1F§.§_-6yZ§(this.§_-66i§,param1,[]);
      }
      
      public function isActiveX2SaleItem(param1:String) : Boolean
      {
         return this.§_-18U§.hasOwnProperty(param1);
      }
      
      public function §_-62L§(param1:int) : Boolean
      {
         return this.§_-9pV§.hasOwnProperty(String(param1));
      }
      
      public function §_-4FD§(param1:int) : Boolean
      {
         return this.§_-4Df§(param1).length > 0;
      }
      
      public function §_-4Df§(param1:int) : Array
      {
         var _loc3_:§_-0CV§ = null;
         var _loc2_:Array = [];
         for each(_loc3_ in this.§_-9pV§)
         {
            if(_loc3_.type == param1 && this.§_-2A7§(_loc3_))
            {
               _loc2_.push(_loc3_);
            }
         }
         return _loc2_;
      }
      
      public function §_-0S-§(param1:int) : §_-0CV§
      {
         var _loc2_:§_-0CV§ = null;
         for each(_loc2_ in this.§_-9pV§)
         {
            if(_loc2_.id == param1 && this.§_-2A7§(_loc2_))
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function getSaleItem(param1:String) : §_-A7b§
      {
         var _loc3_:§_-0CV§ = null;
         if(!this.isSaleItem(param1))
         {
            return null;
         }
         var _loc2_:int = int(this.§_-0qv§[param1]);
         for each(_loc3_ in this.§_-9pV§)
         {
            if(_loc3_.id == _loc2_)
            {
               if(!(!§_-BsT§.§_-8DF§(_loc3_.type) || !this.§_-2A7§(_loc3_)))
               {
                  return _loc3_.getItem(param1);
               }
            }
         }
         return null;
      }
      
      public function §_-Dj§(param1:String) : §_-A7b§
      {
         var _loc3_:§_-0CV§ = null;
         if(!this.isActiveX2SaleItem(param1))
         {
            return null;
         }
         var _loc2_:int = int(this.§_-18U§[param1]);
         for each(_loc3_ in this.§_-9pV§)
         {
            if(!(_loc3_.id != _loc2_ || _loc3_.type != §_-BsT§.SALE_ACTIVITY_X2 || !this.§_-2A7§(_loc3_)))
            {
               return _loc3_.getAppearanceItem(param1);
            }
         }
         return null;
      }
      
      public function §_-3xb§() : Array
      {
         var _loc1_:§_-0CV§ = null;
         for each(_loc1_ in this.§_-9pV§)
         {
            if(_loc1_.type == §_-BsT§.SALE_ON_VIP && this.§_-2A7§(_loc1_))
            {
               return _loc1_.campaignItemList;
            }
         }
         return null;
      }
      
      public function §_-Bkd§() : Boolean
      {
         var _loc1_:§_-0CV§ = null;
         for each(_loc1_ in this.§_-9pV§)
         {
            if(_loc1_.type == §_-BsT§.SALE_ON_GOLD && this.§_-2A7§(_loc1_))
            {
               return true;
            }
         }
         return false;
      }
      
      public function hasSaleGoldItem(param1:String) : Boolean
      {
         return this.hasItem(§_-BsT§.SALE_ON_GOLD,param1);
      }
      
      public function §_-3de§() : Boolean
      {
         var _loc1_:§_-0CV§ = null;
         for each(_loc1_ in this.§_-9pV§)
         {
            if(_loc1_.type == §_-BsT§.SALE_ON_RUBY && this.§_-2A7§(_loc1_))
            {
               return true;
            }
         }
         return false;
      }
      
      public function §_-3T§(param1:String) : Boolean
      {
         return this.hasItem(§_-BsT§.SALE_ON_RUBY,param1);
      }
      
      public function §_-C49§(param1:String) : Boolean
      {
         return this.hasItem(§_-BsT§.CAMPAIGN_OFFER,param1);
      }
      
      public function getPhotoSalonThemeItem() : §_-A7b§
      {
         var _loc1_:§_-0CV§ = null;
         for each(_loc1_ in this.§_-9pV§)
         {
            if(_loc1_.type == §_-BsT§.PHOTOSALON_NEW_THEME && this.§_-2A7§(_loc1_))
            {
               return _loc1_.campaignItemList[0];
            }
         }
         return null;
      }
      
      public function getModuleItem(param1:String) : §_-A7b§
      {
         var _loc2_:§_-0CV§ = this.§_-77X§(param1);
         if(_loc2_ == null)
         {
            return null;
         }
         return _loc2_.getItem(param1);
      }
      
      public function §_-77X§(param1:String) : §_-0CV§
      {
         var _loc2_:§_-0CV§ = null;
         var _loc3_:§_-A7b§ = null;
         for each(_loc2_ in this.§_-9pV§)
         {
            if(_loc2_.type == §_-BsT§.MODULES && this.§_-2A7§(_loc2_))
            {
               _loc3_ = _loc2_.getItem(param1);
               if(_loc3_ != null)
               {
                  return _loc2_;
               }
            }
         }
         return null;
      }
      
      public function §_-4c9§(param1:String) : §_-0CV§
      {
         var _loc3_:§_-0CV§ = null;
         var _loc2_:Array = this.§_-4Df§(§_-BsT§.CAMPAIGN_OFFER);
         for each(_loc3_ in _loc2_)
         {
            if(_loc3_.getItem(param1) != null)
            {
               return _loc3_;
            }
         }
         return null;
      }
      
      public function §_-1s-§(param1:int) : void
      {
         var _loc2_:§_-4Ww§ = new §_-4Ww§();
         _loc2_.§_-CZf§(§_-0Tb§.§_-nb§,param1);
         §_-6gl§.sendExtMessage(§_-0Tb§.§_-127§,_loc2_);
      }
      
      public function §_-3P4§(param1:int) : void
      {
         var _loc2_:§_-4Ww§ = new §_-4Ww§();
         _loc2_.§_-CZf§(§_-0Tb§.§_-nb§,param1);
         §_-6gl§.sendExtMessage(§_-0Tb§.§_-5i7§,_loc2_);
      }
      
      public function §_-2f1§(param1:int, param2:int) : void
      {
         var _loc3_:§_-4Ww§ = new §_-4Ww§();
         _loc3_.§_-CZf§(§_-0Tb§.§_-nb§,param1);
         _loc3_.§_-CZf§(§_-0Tb§.§_-5MB§,param2);
         §_-6gl§.sendExtMessage(§_-0Tb§.§_-28A§,_loc3_);
      }
      
      public function §_-71J§(param1:int) : void
      {
         var _loc2_:§_-4Ww§ = new §_-4Ww§();
         _loc2_.§_-CZf§(§_-0Tb§.§_-nb§,param1);
         §_-6gl§.sendExtMessage(§_-0Tb§.§_-0eV§,_loc2_);
      }
      
      public function §_-Q3§() : Boolean
      {
         return this.§_-3kq§.length != 0 && this.§_-A10§();
      }
      
      public function §_-4rr§() : §_-BCG§
      {
         var _loc1_:§_-BCG§ = null;
         if(this.§_-35t§())
         {
            _loc1_ = new §_-1-v§();
         }
         else if(this.§_-A7N§())
         {
            _loc1_ = new §_-1-v§(true);
         }
         return _loc1_;
      }
      
      public function §_-35t§() : Boolean
      {
         var _loc1_:§_-0CV§ = null;
         var _loc2_:§_-0CV§ = null;
         for each(_loc1_ in this.§_-3kq§)
         {
            if(_loc1_.getItem(§_-59p§.§_-8FU§) != null)
            {
               for each(_loc2_ in this.§_-9pV§)
               {
                  if(_loc2_.id == _loc1_.getItem(§_-59p§.§_-8FU§).section && _loc1_.endDate.getTime() - Context.cityPlayer.timeDelta * 1000 > new Date().getTime() && this.§_-0po§(_loc2_.id) != null)
                  {
                     return true;
                  }
               }
            }
         }
         return false;
      }
      
      public function §_-A7N§() : Boolean
      {
         var _loc1_:§_-0CV§ = null;
         var _loc2_:§_-0CV§ = null;
         for each(_loc1_ in this.§_-3kq§)
         {
            for each(_loc2_ in this.§_-9pV§)
            {
               if(_loc2_.getItem(§_-59p§.§_-0Mv§) != null && _loc1_.endDate.getTime() - Context.cityPlayer.timeDelta * 1000 > new Date().getTime())
               {
                  return true;
               }
            }
         }
         return false;
      }
      
      private function §_-A10§() : Boolean
      {
         var _loc1_:§_-0CV§ = null;
         for each(_loc1_ in this.§_-3kq§)
         {
            if(_loc1_.getItem(§_-59p§.§_-7H5§) != null)
            {
               return true;
            }
            if(_loc1_.getItem(§_-59p§.§_-5SA§) != null)
            {
               return true;
            }
         }
         return false;
      }
      
      public function get §_-5Ps§() : §_-0CV§
      {
         var _loc1_:§_-0CV§ = null;
         if(this.§_-Q3§())
         {
            for each(_loc1_ in this.§_-3kq§)
            {
               if(_loc1_.getItem(§_-59p§.§_-0Mv§) != null && _loc1_.endDate.getTime() - Context.cityPlayer.timeDelta * 1000 > new Date().getTime())
               {
                  return _loc1_;
               }
            }
         }
         return null;
      }
      
      public function §_-AXw§(param1:int) : §_-0CV§
      {
         var _loc2_:§_-0CV§ = null;
         if(this.§_-Q3§())
         {
            for each(_loc2_ in this.§_-3kq§)
            {
               if(_loc2_.getItem(§_-59p§.§_-8FU§) != null && _loc2_.getItemSection(§_-59p§.§_-8FU§) == param1 && _loc2_.endDate.getTime() - Context.cityPlayer.timeDelta * 1000 > new Date().getTime())
               {
                  return _loc2_;
               }
            }
         }
         return null;
      }
      
      public function §_-0po§(param1:int) : §_-75P§
      {
         var _loc2_:§_-0CV§ = null;
         var _loc3_:§_-75P§ = null;
         for each(_loc2_ in this.§_-9pV§)
         {
            if(_loc2_.id == param1)
            {
               _loc3_ = this.§_-3TO§(_loc2_);
               if(_loc3_ != null && _loc3_.canShowDialog())
               {
                  return _loc3_;
               }
            }
         }
         return null;
      }
      
      public function get §_-VL§() : Array
      {
         return this.§_-3kq§;
      }
      
      public function §_-AHK§(param1:String) : Object
      {
         var _loc2_:String = null;
         for each(_loc2_ in this.§_-Bqc§)
         {
            if(_loc2_ == param1)
            {
               return true;
            }
         }
         return false;
      }
      
      private function §_-C11§(param1:§_-9ai§) : void
      {
         var roomModel:§_-2E0§ = null;
         var event:§_-9ai§ = param1;
         roomModel = event.data.§_-2jV§(§_-XJ§.§_-4zy§,§_-2E0§);
         Context.cityPlayer.house.addRoom(roomModel);
         Application.instance.dispatchEvent(new §_-1m0§(§_-1m0§.§_-BgA§,roomModel));
         §_-4OH§.confirm(Context.§_-5o8§.message("campaignBuyRoomFurnitureTitle"),Context.§_-5o8§.message("campaignBuyRoomFurnitureGotoRoomConfirm"),function(param1:§_-2-c§):void
         {
            if(param1.§_-B66§.modalResult == §_-0jI§.§_-9qy§)
            {
               if(Context.§_-3hG§ is §_-0sT§)
               {
                  Context.§_-3hG§.switchRoom(roomModel.id);
               }
               else
               {
                  Context.§_-CLP§.visitCityHouse(Context.player.id,roomModel.id);
               }
            }
         });
      }
      
      private function onNewCampaigns(param1:§_-9ai§) : void
      {
         var _loc2_:Array = param1.data.§_-Bc6§("campaigns",§_-0CV§);
         this.§_-CQL§(_loc2_);
         this.§_-Btc§();
         this.§_-12c§();
         this.§_-3nV§();
         this.§_-1f-§();
         this.§_-A9o§();
         if(!this._inited)
         {
            this._inited = true;
            dispatchEvent(new §_-3Wc§(§_-3Wc§.§_-2Sq§));
         }
         this.§_-3qd§();
         dispatchEvent(new §_-3Wc§(§_-3Wc§.§_-9cv§));
      }
      
      private function §_-BKV§(param1:§_-9ai§) : void
      {
         var _loc4_:§_-0CV§ = null;
         var _loc2_:Array = param1.data.§_-2jV§("ids",Array);
         var _loc3_:Object = {};
         for each(_loc4_ in this.§_-9pV§)
         {
            if(_loc2_.indexOf(_loc4_.id) < 0)
            {
               _loc3_[_loc4_.id] = _loc4_;
            }
         }
         this.§_-9pV§ = null;
         this.§_-9pV§ = _loc3_;
         this.§_-1f-§();
         this.§_-Btc§();
         this.§_-12c§();
         this.§_-A9o§();
         this.§_-0WJ§(_loc2_);
         dispatchEvent(new §_-3Wc§(§_-3Wc§.§_-AIq§,_loc2_));
      }
      
      private function §_-0WJ§(param1:Array) : void
      {
         var _loc3_:§_-0CV§ = null;
         var _loc2_:Array = [];
         for each(_loc3_ in this.§_-3kq§)
         {
            if(param1.indexOf(_loc3_.id) < 0)
            {
               _loc2_.push(_loc3_);
            }
         }
         this.§_-3kq§ = null;
         this.§_-3kq§ = _loc2_;
      }
      
      private function §_-B6i§(param1:§_-9ai§) : void
      {
         var _loc2_:§_-48g§ = Context.cityPlayer;
         _loc2_.avatarClothes.fromAGSObject(param1.data.§_-ANw§(§_-5ab§.§_-7J0§));
         _loc2_.inventory.§_-35N§(param1.data.§_-Bc6§(§_-BOZ§.§_-91R§,InventoryItem));
         _loc2_.resources.fromAGSObject(param1.data.§_-ANw§(§_-5ab§.§_-0T5§));
         _loc2_.cityInfo.clothesRating = param1.data.getInt(§_-9df§.§_-0aP§);
         var _loc3_:§_-2pt§ = param1.data.§_-2jV§(§_-5SV§.§_-9tA§,§_-2pt§);
         _loc2_.clothesCollections.currentCollectionType = _loc3_.type;
         _loc2_.clothesCollections.§_-1y5§(_loc3_);
         Application.instance.dispatchEvent(new §_-1m0§(§_-1m0§.§_-9FD§));
         Application.instance.dispatchEvent(new §_-1m0§(§_-1m0§.§_-CGy§));
         Application.instance.dispatchEvent(new §_-1m0§(§_-1m0§.§_-2dd§));
         Application.instance.dispatchEvent(new §_-1m0§(§_-1m0§.§_-BZg§));
      }
      
      private function §_-CQL§(param1:Array) : void
      {
         var _loc3_:§_-0CV§ = null;
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            _loc3_ = param1[_loc2_];
            this.§_-9pV§[_loc3_.id] = _loc3_;
            _loc2_++;
         }
      }
      
      private function §_-3nV§() : void
      {
         var _loc2_:§_-0CV§ = null;
         var _loc3_:Object = null;
         var _loc4_:§_-A7b§ = null;
         var _loc5_:String = null;
         var _loc6_:Array = null;
         var _loc7_:Array = null;
         var _loc8_:§_-Ud§ = null;
         var _loc1_:Array = [];
         this.§_-Bqc§ = {};
         for each(_loc2_ in this.§_-9pV§)
         {
            if(!(_loc2_.type != §_-BsT§.MODULES || !this.§_-2A7§(_loc2_)))
            {
               _loc3_ = null;
               for each(_loc4_ in _loc2_.campaignItemList)
               {
                  if(_loc4_.typeId.indexOf(§_-4dC§) >= 0)
                  {
                     _loc3_ = §_-0q5§(_loc4_.typeId);
                     if(_loc3_.hasOwnProperty(§_-4dC§))
                     {
                        _loc5_ = _loc3_[§_-4dC§];
                        _loc6_ = _loc5_.split("->");
                        if(_loc6_.length != 2)
                        {
                           continue;
                        }
                        _loc1_.push(_loc6_[1]);
                        this.§_-Bqc§[_loc6_[1]] = _loc6_[0];
                     }
                  }
                  else if(_loc4_.typeId.indexOf(§_-CPv§) >= 0)
                  {
                     _loc3_ = §_-0q5§(_loc4_.typeId);
                     _loc7_ = _loc3_[§_-CPv§].split("-");
                     Context.§_-BFW§.replaceMap(_loc7_[0],_loc7_[1],_loc7_[2]);
                  }
                  else if(_loc4_.typeId == §_-59p§.§_-7H5§ || _loc4_.typeId == §_-59p§.§_-5SA§)
                  {
                     this.§_-3kq§.push(_loc2_);
                  }
               }
            }
         }
         if(_loc1_.length > 0)
         {
            _loc8_ = new §_-0wT§(_loc1_,this.§_-Bqc§);
            _loc8_.load();
         }
      }
      
      private function §_-1f-§() : void
      {
         this.§_-9tg§();
         this.§_-9OM§();
         this.§_-Bv5§();
      }
      
      private function §_-9tg§() : void
      {
         var _loc1_:§_-0CV§ = null;
         var _loc2_:§_-A7b§ = null;
         this.§_-0qv§ = {};
         for each(_loc1_ in this.§_-9pV§)
         {
            if(!(!§_-BsT§.§_-8DF§(_loc1_.type) || !this.§_-2A7§(_loc1_)))
            {
               for each(_loc2_ in _loc1_.campaignItemList)
               {
                  if(!(_loc2_.gold <= 0 && _loc2_.silver <= 0))
                  {
                     if(!Context.§_-0Vr§.isSaleItem(_loc2_.typeId))
                     {
                        this.§_-0qv§[_loc2_.typeId] = _loc1_.id;
                     }
                  }
               }
            }
         }
      }
      
      private function §_-9OM§() : void
      {
         var _loc1_:§_-0CV§ = null;
         var _loc2_:§_-A7b§ = null;
         this.§_-18U§ = {};
         for each(_loc1_ in this.§_-9pV§)
         {
            if(§_-BsT§.SALE_ACTIVITY_X2 == _loc1_.type)
            {
               for each(_loc2_ in _loc1_.campaignItemList)
               {
                  this.§_-18U§[_loc2_.typeId] = _loc1_.id;
               }
            }
         }
      }
      
      private function §_-A9o§() : void
      {
         var _loc1_:§_-0CV§ = null;
         var _loc2_:String = null;
         var _loc3_:String = null;
         var _loc4_:String = null;
         var _loc5_:Array = null;
         var _loc6_:§_-A7b§ = null;
         var _loc7_:Array = null;
         var _loc8_:§_-Bjo§ = null;
         this.§_-66i§ = {};
         for each(_loc1_ in this.§_-9pV§)
         {
            if(!(_loc1_.type != §_-BsT§.SELECTION || !this.§_-2A7§(_loc1_)))
            {
               _loc2_ = _loc1_.§_-068§(§_-Bjo§.§_-yP§);
               _loc3_ = _loc1_.§_-068§(§_-Bjo§.§_-9Wz§);
               _loc4_ = _loc1_.§_-068§(§_-Bjo§.§_-BnG§);
               if(!(_loc2_.length == 0 || _loc3_.length == 0 || _loc4_.length == 0))
               {
                  _loc5_ = [];
                  for each(_loc6_ in _loc1_.campaignItemList)
                  {
                     if(!(_loc6_.typeId.indexOf(§_-Bjo§.§_-yP§) >= 0 || _loc6_.typeId.indexOf(§_-Bjo§.§_-9Wz§) >= 0 || _loc6_.typeId.indexOf(§_-Bjo§.§_-BnG§) >= 0))
                     {
                        _loc5_.push(_loc6_.typeId);
                     }
                  }
                  if(_loc5_.length != 0)
                  {
                     if(!this.§_-66i§.hasOwnProperty(_loc2_))
                     {
                        this.§_-66i§[_loc2_] = [];
                     }
                     _loc7_ = this.§_-66i§[_loc2_];
                     _loc8_ = new §_-Bjo§(_loc3_,_loc4_,_loc5_);
                     _loc7_.push(_loc8_);
                  }
               }
            }
         }
      }
      
      private function §_-Bv5§() : void
      {
         var _loc3_:§_-0CV§ = null;
         var _loc4_:Object = null;
         var _loc1_:Boolean = false;
         var _loc2_:Boolean = false;
         for each(_loc3_ in this.§_-9pV§)
         {
            if(_loc3_.status == §_-8fk§.§_-1QP§)
            {
               _loc2_ = true;
               break;
            }
         }
         if(_loc2_)
         {
            for each(_loc4_ in this.§_-0qv§)
            {
               if(_loc4_ != null)
               {
                  _loc1_ = true;
                  break;
               }
            }
         }
         if(this._timer == null && _loc1_)
         {
            this._timer = new Timer(§_-Bej§);
            this._timer.addEventListener(TimerEvent.TIMER,this.§_-3Of§);
            this._timer.start();
         }
         else if(this._timer != null && !_loc1_)
         {
            this._timer.stop();
            this._timer.removeEventListener(TimerEvent.TIMER,this.§_-3Of§);
            this._timer = null;
         }
      }
      
      private function §_-3Of§(param1:TimerEvent) : void
      {
         this.§_-9tg§();
         this.§_-9OM§();
      }
      
      private function §_-3qd§() : void
      {
         var _loc1_:§_-0CV§ = null;
         var _loc2_:§_-75P§ = null;
         var _loc3_:§_-0B7§ = null;
         var _loc4_:§_-A-e§ = null;
         if(Context.cityPlayer.isTutorial || !this.§_-C3W§())
         {
            return;
         }
         for each(_loc1_ in this.§_-9pV§)
         {
            if(_loc1_.getItem(§_-0B7§.MODULE_ID) != null)
            {
               _loc3_ = new §_-0B7§(_loc1_);
               §_-5hc§.§_-57w§(_loc3_,false);
            }
            else if(_loc1_.getItem(§_-A-e§.MODULE_ID) != null)
            {
               _loc4_ = new §_-A-e§(_loc1_);
               §_-5hc§.§_-57w§(_loc4_,false);
            }
            else if(this.§_-BEg§(_loc1_))
            {
               _loc2_ = this.§_-3TO§(_loc1_);
               if(_loc2_ != null && _loc2_.canShowDialog() && Context.§_-3gu§.§_-8uZ§(_loc1_.id))
               {
                  §_-5hc§.§_-57w§(_loc2_,false);
               }
            }
         }
      }
      
      private function §_-C3W§() : Boolean
      {
         return this.§_-9pV§ != null && §_-6aF§.§_-vN§(this.§_-9pV§) > 0;
      }
      
      private function hasItem(param1:int, param2:String) : Boolean
      {
         var _loc3_:§_-0CV§ = null;
         var _loc4_:§_-A7b§ = null;
         var _loc5_:ClothesCollectionItem = null;
         var _loc6_:FurnitureCollectionItem = null;
         var _loc7_:ClothesSetItem = null;
         var _loc8_:FurnitureSetItem = null;
         for each(_loc3_ in this.§_-9pV§)
         {
            if(!(_loc3_.type != param1 || !this.§_-2A7§(_loc3_)))
            {
               for each(_loc4_ in _loc3_.campaignItemList)
               {
                  if(_loc4_.typeId == param2)
                  {
                     return true;
                  }
                  if(_loc4_.section == §_-6Jc§.RESTRICTED_COLLECTION)
                  {
                     _loc5_ = Context.§_-Amy§.§_-2aQ§(_loc4_.typeId);
                     if(_loc5_ != null && _loc5_.hasItem(param2))
                     {
                        return true;
                     }
                     _loc6_ = Context.§_-6fU§.§_-Bc6§(_loc4_.typeId);
                     if(_loc6_ != null && _loc6_.hasItem(param2))
                     {
                        return true;
                     }
                  }
                  if(_loc4_.section == §_-6Jc§.RESTRICTED_SET)
                  {
                     _loc7_ = Context.§_-Amy§.§_-7j3§(_loc4_.typeId);
                     if(_loc7_ != null && _loc7_.hasItem(param2))
                     {
                        return true;
                     }
                     _loc8_ = Context.§_-6fU§.§_-9v3§(_loc4_.typeId);
                     if(_loc8_ != null && _loc8_.hasItem(param2))
                     {
                        return true;
                     }
                  }
               }
            }
         }
         return false;
      }
      
      private function §_-Btc§() : void
      {
         var _loc1_:§_-0CV§ = null;
         var _loc2_:§_-A7b§ = null;
         this.§_-Aup§ = [];
         for each(_loc1_ in this.§_-9pV§)
         {
            if(this.§_-2A7§(_loc1_))
            {
               for each(_loc2_ in _loc1_.campaignItemList)
               {
                  this.§_-Aup§.push(_loc2_.typeId);
               }
            }
         }
      }
      
      private function §_-12c§() : void
      {
         var _loc1_:§_-0CV§ = null;
         var _loc2_:§_-A7b§ = null;
         var _loc3_:ClothesCollectionItem = null;
         var _loc4_:String = null;
         var _loc5_:ClothesSetItem = null;
         var _loc6_:String = null;
         this.§_-CIY§ = [];
         for each(_loc1_ in this.§_-9pV§)
         {
            if(this.§_-2A7§(_loc1_))
            {
               if(_loc1_.type == §_-BsT§.RESTRICTIONS)
               {
                  for each(_loc2_ in _loc1_.campaignItemList)
                  {
                     if(_loc2_.section == §_-6Jc§.RESTRICTED_COLLECTION)
                     {
                        _loc3_ = Context.§_-Amy§.§_-2aQ§(_loc2_.typeId);
                        if(_loc3_ != null)
                        {
                           for each(_loc4_ in _loc3_.items)
                           {
                              this.§_-CIY§.push(_loc4_);
                           }
                        }
                     }
                     else if(_loc2_.section == §_-6Jc§.RESTRICTED_SET)
                     {
                        _loc5_ = Context.§_-Amy§.§_-7j3§(_loc2_.typeId);
                        if(_loc5_ != null)
                        {
                           for each(_loc6_ in _loc5_.items)
                           {
                              this.§_-CIY§.push(_loc6_.split(":")[0]);
                           }
                        }
                     }
                     else
                     {
                        this.§_-CIY§.push(_loc2_.typeId);
                     }
                  }
               }
            }
         }
      }
      
      private function §_-2-N§(param1:String) : Boolean
      {
         return this.§_-CIY§.indexOf(param1) >= 0;
      }
      
      private function §_-Byj§(param1:int) : Array
      {
         var _loc3_:§_-0CV§ = null;
         var _loc4_:§_-A7b§ = null;
         var _loc5_:ClothesSetItem = null;
         var _loc6_:String = null;
         var _loc2_:Array = [];
         for each(_loc3_ in this.§_-9pV§)
         {
            if(!(_loc3_.type != param1 || !this.§_-2A7§(_loc3_)))
            {
               for each(_loc4_ in _loc3_.campaignItemList)
               {
                  switch(_loc3_.type)
                  {
                     case §_-BsT§.NEW_FURNITURE:
                     case §_-BsT§.NEW_CLOTHES:
                        _loc2_.push(_loc4_.typeId);
                        break;
                     case §_-BsT§.NEW_CLOTHES_SUIT:
                        _loc5_ = Context.§_-Amy§.§_-7j3§(_loc4_.typeId);
                        if(_loc5_ != null)
                        {
                           for each(_loc6_ in _loc5_.items)
                           {
                              _loc2_.push(_loc6_);
                           }
                        }
                        break;
                     default:
                        §_-3YE§.§_-7aK§("campaign type is not exist");
                        break;
                  }
               }
            }
         }
         return _loc2_;
      }
      
      private function §_-7vo§(param1:String) : Boolean
      {
         var _loc2_:§_-0CV§ = §_-5KD§.instance.§_-77X§(param1);
         if(_loc2_ == null || !this.§_-2A7§(_loc2_))
         {
            return false;
         }
         return true;
      }
      
      private function §_-2A7§(param1:§_-0CV§) : Boolean
      {
         return param1.§_-8Sk§ && param1.hasItems();
      }
      
      public function get campaigns() : Object
      {
         return this.§_-9pV§;
      }
      
      override public function destroy() : void
      {
         if(this._timer != null)
         {
            this._timer.removeEventListener(TimerEvent.TIMER,this.§_-3Of§);
         }
         super.destroy();
      }
   }
}

