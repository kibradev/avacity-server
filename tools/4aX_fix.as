package §_-AOz§
{
   import §_-18o§.§_-A8q§;
   import §_-1Vu§.§_-Awf§;
   import §_-6-L§.§_-49j§;
   import §_-6EN§.§_-BjY§;
   import §_-BeZ§.§_-0Yu§;
   import §_-BeZ§.§_-4Ww§;
   import §_-C-a§.§_-3uA§;
   import §_-GM§.Context;
   import §_-ny§.§_-69X§;

   public class §_-4aX§ implements §_-0Yu§
   {
      public static const §_-A2v§:String = "clths";

      public static const §_-4EX§:String = "clthstwr";

      protected var §_-C-w§:Array = [];

      public function §_-4aX§()
      {
         super();
      }

      public function clearClothes() : void
      {
         this.§_-C-w§ = [];
      }

      public function takeoffAll() : void
      {
         var _loc2_:AvatarClothesItem = null;
         var _loc1_:int = int(this.§_-C-w§.length - 1);
         while(_loc1_ >= 0)
         {
            _loc2_ = this.§_-C-w§[_loc1_];
            this.takeoff(_loc2_.clothesItem);
            _loc1_--;
         }
      }

      public function getClothes() : Array
      {
         return this.§_-C-w§;
      }

      public function getClothesWithoutTag(param1:String) : Array
      {
         var _loc3_:AvatarClothesItem = null;
         if(this.§_-C-w§ == null || this.§_-C-w§.length <= 0)
         {
            return this.§_-C-w§;
         }
         var _loc2_:Array = [];
         for each(_loc3_ in this.§_-C-w§)
         {
            if(_loc3_.clothesItem != null)
            {
               if(!_loc3_.clothesItem.hasTag(param1))
               {
                  _loc2_.push(_loc3_);
               }
            }
         }
         return _loc2_;
      }

      public function getClothesItem(param1:String, param2:String = null) : AvatarClothesItem
      {
         var _loc3_:AvatarClothesItem = null;
         if(param1 == null)
         {
            return null;
         }
         for each(_loc3_ in this.§_-C-w§)
         {
            if(_loc3_.typeId == param1 && (param2 == null || _loc3_.colorId == param2))
            {
               return _loc3_;
            }
         }
         return null;
      }

      public function clothe(param1:§_-Awf§, param2:String = null) : Array
      {
         var _loc5_:AvatarClothesItem = null;
         var _loc6_:AvatarClothesItem = null;
         var _loc3_:Array = [];
         var _loc4_:Array = [];
         for each(_loc5_ in this.§_-C-w§)
         {
            if(_loc5_.clothesItem.intersect(param1))
            {
               _loc3_.push(_loc5_);
            }
            else
            {
               _loc4_.push(_loc5_);
            }
         }
         _loc6_ = new AvatarClothesItem();
         _loc6_.fromClothesItem(param1);
         if(param2 != null)
         {
            _loc6_.colorId = param2;
         }
         _loc4_.push(_loc6_);
         this.§_-C-w§ = _loc4_;
         this.checkUnderdress(param1.gender);
         return _loc3_;
      }

      public function removeClothes(param1:String) : §_-Awf§
      {
         var _loc2_:AvatarClothesItem = null;
         for each(_loc2_ in this.§_-C-w§)
         {
            if(_loc2_.typeId == param1)
            {
               §_-49j§.remove(this.§_-C-w§,_loc2_);
               return _loc2_.clothesItem;
            }
         }
         return null;
      }

      public function takeoff(param1:§_-Awf§) : §_-Awf§
      {
         var _loc2_:§_-Awf§ = this.removeClothes(param1.typeId);
         if(_loc2_ != null)
         {
            this.checkUnderdress(param1.gender);
         }
         return _loc2_;
      }

      public function addClothes(param1:AvatarClothesItem) : void
      {
         this.§_-C-w§.push(param1);
      }

      protected function §_-4zx§(param1:§_-Awf§) : void
      {
         if(param1 == null)
         {
            return;
         }
         var _loc2_:AvatarClothesItem = new AvatarClothesItem();
         _loc2_.fromClothesItem(param1);
         this.addClothes(_loc2_);
      }

      public function hasClothes(param1:String) : Boolean
      {
         var _loc2_:AvatarClothesItem = null;
         for each(_loc2_ in this.§_-C-w§)
         {
            if(_loc2_.typeId == param1)
            {
               return true;
            }
         }
         return false;
      }

      public function hasClothesItem(param1:String, param2:String = null) : Boolean
      {
         var _loc3_:AvatarClothesItem = null;
         for each(_loc3_ in this.§_-C-w§)
         {
            if(_loc3_.typeId == param1 && (param2 == null || _loc3_.colorId == param2))
            {
               return true;
            }
         }
         return false;
      }

      public function wearUnderdress(param1:int) : void
      {
         this.checkUnderdress(param1);
      }

      protected function checkUnderdress(param1:int) : void
      {
         this.§_-9TW§(param1);
         this.§_-6TF§(param1);
      }

      private function §_-6TF§(param1:int) : void
      {
         var _loc2_:Boolean = false;
         var _loc3_:Boolean = false;
         var _loc4_:§_-Awf§ = null;
         if(param1 == §_-3uA§.§_-908§)
         {
            _loc2_ = this.hasClothes(§_-69X§.§_-A41§);
            _loc3_ = !this.hasClothesByCategory(§_-BjY§.§_-5oJ§) && !this.hasClothesByCategory(§_-BjY§.§_-B8Y§) && !this.hasClothesByCategory(§_-BjY§.§_-4cB§) && !this.hasClothesByCategory(§_-BjY§.§_-6DQ§) && !this.hasClothesByCategory(§_-BjY§.§_-6oo§);
            _loc4_ = Context.§_-70S§.§_-0ZU§().findTypeById(§_-69X§.§_-A41§) as §_-Awf§;
         }
         if(param1 == §_-3uA§.§_-BO7§)
         {
            _loc2_ = this.hasClothes(§_-69X§.§_-10G§);
            _loc3_ = !this.hasClothesByCategory(§_-BjY§.§_-0s§) && !this.hasClothesByCategory(§_-BjY§.§_-7Or§) && !this.hasClothesByCategory(§_-BjY§.§_-BRz§) && !this.hasClothesByCategory(§_-BjY§.§_-2nQ§) && !this.hasClothesByCategory(§_-BjY§.§_-9FI§) && !this.hasClothesByCategory(§_-BjY§.§_-8oP§) && !this.hasClothesByCategory(§_-BjY§.§_-4Dk§) && !this.hasClothesByCategory(§_-BjY§.§_-8kO§) && !this.hasClothesByCategory(§_-BjY§.§_-6FQ§) && !this.hasClothesByCategory(§_-BjY§.§_-7Iv§);
            _loc4_ = Context.§_-70S§.§_-0ZU§().findTypeById(§_-69X§.§_-10G§) as §_-Awf§;
         }
         if(!_loc2_ && _loc3_ && _loc4_ != null)
         {
            this.§_-4zx§(_loc4_);
            return;
         }
         if(_loc2_ && !_loc3_ && _loc4_ != null)
         {
            this.removeClothes(_loc4_.typeId);
         }
      }

      private function §_-9TW§(param1:int) : void
      {
         var _loc2_:Boolean = false;
         var _loc3_:Boolean = false;
         var _loc4_:§_-Awf§ = null;
         if(param1 == §_-3uA§.§_-908§)
         {
            return;
         }
         if(param1 == §_-3uA§.§_-BO7§)
         {
            _loc2_ = this.hasClothes(§_-69X§.§_-6gs§);
            _loc3_ = !this.hasClothesByCategory(§_-BjY§.§_-0s§) && !this.hasClothesByCategory(§_-BjY§.§_-7Or§) && !this.hasClothesByCategory(§_-BjY§.§_-BRz§) && !this.hasClothesByCategory(§_-BjY§.§_-2nQ§) && !this.hasClothesByCategory(§_-BjY§.§_-9FI§) && !this.hasClothesByCategory(§_-BjY§.§_-8oP§) && !this.hasClothesByCategory(§_-BjY§.§_-B-v§) && !this.hasClothesByCategory(§_-BjY§.§_-7Iv§);
            _loc4_ = Context.§_-70S§.§_-0ZU§().findTypeById(§_-69X§.§_-6gs§) as §_-Awf§;
            if(!_loc2_ && _loc3_ && _loc4_ != null)
            {
               this.§_-4zx§(_loc4_);
               return;
            }
            if(_loc2_ && !_loc3_ && _loc4_ != null)
            {
               this.removeClothes(_loc4_.typeId);
            }
         }
      }

      public function removeClothesByCategory(param1:String) : void
      {
         var _loc3_:AvatarClothesItem = null;
         var _loc2_:int = int(this.§_-C-w§.length - 1);
         while(_loc2_ >= 0)
         {
            _loc3_ = this.§_-C-w§[_loc2_] as AvatarClothesItem;
            if(_loc3_.clothesItem.findParentCategory(param1) != null)
            {
               §_-49j§.remove(this.§_-C-w§,_loc3_);
            }
            _loc2_--;
         }
      }

      public function §_-4SF§(param1:String) : Boolean
      {
         var _loc2_:AvatarClothesItem = null;
         for each(_loc2_ in this.§_-C-w§)
         {
            if(_loc2_.clothesItem != null)
            {
               if(_loc2_.clothesItem.hasTag(param1))
               {
                  return true;
               }
            }
         }
         return false;
      }

      public function canShowBeard() : Boolean
      {
         return !this.§_-4SF§(§_-Awf§.§_-Bc2§);
      }

      public function hasClothesByCategory(param1:String, param2:Boolean = false) : Boolean
      {
         var _loc3_:AvatarClothesItem = null;
         for each(_loc3_ in this.§_-C-w§)
         {
            if(!(_loc3_.clothesItem == null || param2 && _loc3_.colorId == AvatarClothesItem.§_-BnS§))
            {
               if(_loc3_.clothesItem.findParentCategory(param1) != null)
               {
                  return true;
               }
            }
         }
         return false;
      }

      public function fromAGSObject(param1:§_-4Ww§) : void
      {
         this.§_-C-w§ = param1.§_-Bc6§(§_-A2v§,AvatarClothesItem);
      }

      public function toAGSObject(param1:§_-4Ww§) : void
      {
         param1.§_-3f6§(§_-A2v§,this.§_-C-w§);
      }

      public function clone() : §_-4aX§
      {
         return §_-A8q§.§_-7t§(this);
      }

      public function initDefaultClothes(param1:int) : void
      {
         var _loc3_:String = null;
         var _loc2_:Array = [];
         this.§_-C-w§ = [];
         if(param1 == §_-3uA§.§_-908§)
         {
            _loc2_.push("boySMR14Sh3");
            _loc2_.push("boyRshPnt");
            _loc2_.push("boyTShrtHsk");
         }
         else if(param1 == §_-3uA§.§_-BO7§)
         {
            _loc2_.push("girlBtsPnd");
            _loc2_.push("girlPntsPnd");
            _loc2_.push("girlTShrtPnd");
         }
         for each(_loc3_ in _loc2_)
         {
            this.§_-4zx§(Context.§_-70S§.§_-0ZU§().findTypeById(_loc3_) as §_-Awf§);
         }
      }

      public function getRating() : int
      {
         var _loc3_:AvatarClothesItem = null;
         var _loc1_:int = 0;
         var _loc2_:int = int(this.§_-C-w§.length - 1);
         while(_loc2_ >= 0)
         {
            _loc3_ = this.§_-C-w§[_loc2_] as AvatarClothesItem;
            _loc1_ += _loc3_.clothesItem.rating;
            _loc2_--;
         }
         return _loc1_;
      }
   }
}
