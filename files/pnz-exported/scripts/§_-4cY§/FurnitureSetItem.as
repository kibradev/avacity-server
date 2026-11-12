package §_-4cY§
{
   import §_-0fi§.*;
   import §_-18o§.§_-ABX§;
   import §_-2U3§.ResourceManager;
   import §_-8Hp§.§_-5KD§;
   import §_-GM§.Context;
   import flash.display.MovieClip;
   
   public class FurnitureSetItem
   {
      private var §_-AcP§:String = null;
      
      private var _label:String = null;
      
      private var §_-24q§:String = null;
      
      private var §_-Vg§:String = null;
      
      private var §_-8cb§:String = null;
      
      private var §_-Azd§:Boolean = false;
      
      private var _items:Array = [];
      
      public function FurnitureSetItem()
      {
         super();
      }
      
      public function configure(param1:XML) : void
      {
         var _loc2_:XML = null;
         this.§_-AcP§ = !!param1.hasOwnProperty("@id") ? String(param1["@id"]) : "";
         this._label = !!param1.hasOwnProperty("@label") ? String(param1["@label"]) : "";
         this.§_-24q§ = !!param1.hasOwnProperty("@description") ? String(param1["@description"]) : "";
         this.§_-Vg§ = !!param1.hasOwnProperty("@iconName") ? String(param1["@iconName"]) : "";
         this.§_-8cb§ = !!param1.hasOwnProperty("@holiday") ? String(param1["@holiday"]) : null;
         this.§_-Azd§ = Boolean(param1.hasOwnProperty("@isNew")) && int(param1["@isNew"]) == 1;
         this._items = [];
         for each(_loc2_ in param1.child("item"))
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
      
      public function get localizedLabel() : String
      {
         return §_-ABX§.§_-631§(this._label);
      }
      
      public function get §_-3x2§() : String
      {
         return §_-ABX§.§_-631§(this.§_-24q§);
      }
      
      public function get icon() : MovieClip
      {
         return ResourceManager.createMovieClip(this.§_-Vg§ + "@furniture");
      }
      
      public function get items() : Array
      {
         return this._items;
      }
      
      public function get holiday() : String
      {
         return this.§_-8cb§;
      }
      
      public function get isNew() : Boolean
      {
         return this.§_-Azd§;
      }
      
      public function get isHoliday() : Boolean
      {
         return this.holiday == null || §_-5KD§.instance.§_-C6D§(this.holiday);
      }
      
      private function §_-08D§(param1:String) : int
      {
         var _loc2_:Array = this.items;
         var _loc3_:int = 0;
         var _loc4_:§_-6f3§ = null;
         var _loc5_:int = 0;
         while(_loc5_ < _loc2_.length)
         {
            _loc4_ = _loc2_[_loc5_] as §_-6f3§;
            _loc3_ += Boolean(_loc4_.hasOwnProperty(param1)) && _loc4_[param1] is int ? _loc4_[param1] as int : 0;
            _loc5_++;
         }
         return _loc3_;
      }
      
      public function get rating() : int
      {
         return this.§_-08D§("rating");
      }
      
      public function get silverPrice() : int
      {
         return this.§_-08D§("silver");
      }
      
      public function get goldPrice() : int
      {
         return this.§_-08D§("gold");
      }
      
      public function get §_-B3P§() : Boolean
      {
         var _loc1_:Array = this.items;
         var _loc2_:§_-6f3§ = null;
         var _loc3_:int = 0;
         while(_loc3_ < _loc1_.length)
         {
            _loc2_ = _loc1_[_loc3_] as §_-6f3§;
            if(_loc2_.isVip)
            {
               return true;
            }
            _loc3_++;
         }
         return false;
      }
      
      public function get §_-34P§() : Array
      {
         var _loc2_:String = null;
         var _loc1_:Array = [];
         for each(_loc2_ in this._items)
         {
            _loc1_.push(Context.§_-70S§.§_-0ZU§().findTypeById(_loc2_) as §_-6f3§);
         }
         return _loc1_;
      }
      
      public function hasItem(param1:String) : Boolean
      {
         var _loc2_:String = null;
         for each(_loc2_ in this._items)
         {
            if(_loc2_ == param1)
            {
               return true;
            }
         }
         return false;
      }
   }
}

