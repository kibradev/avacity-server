package §_-1Vu§
{
   import §_-18o§.§_-ABX§;
   import §_-8Hp§.§_-5KD§;
   import §_-C-a§.§_-3uA§;
   
   public class ClothesCollectionItem
   {
      private var §_-AcP§:String = null;
      
      private var §_-BSf§:String = null;
      
      private var _label:String = null;
      
      private var _priority:uint = 0;
      
      private var §_-8cb§:String = null;
      
      private var _items:Array = [];
      
      public function ClothesCollectionItem()
      {
         super();
      }
      
      public function configure(param1:XML) : void
      {
         var _loc2_:XML = null;
         this.§_-AcP§ = !!param1.hasOwnProperty("@id") ? String(param1["@id"]) : "";
         this.§_-BSf§ = !!param1.hasOwnProperty("@gender") ? String(param1["@gender"]) : "";
         this._label = !!param1.hasOwnProperty("@label") ? String(param1["@label"]) : "";
         this._priority = !!param1.hasOwnProperty("@priority") ? uint(param1["@priority"]) : 0;
         this.§_-8cb§ = !!param1.hasOwnProperty("@holiday") ? String(param1["@holiday"]) : null;
         this._items = [];
         for each(_loc2_ in param1.child("item"))
         {
            if(_loc2_.hasOwnProperty("@itemId"))
            {
               this._items.push(String(_loc2_["@itemId"]));
            }
         }
      }
      
      public function set id(param1:String) : void
      {
         this.§_-AcP§ = param1;
      }
      
      public function get id() : String
      {
         return this.§_-AcP§;
      }
      
      public function set gender(param1:int) : void
      {
         this.§_-BSf§ = param1 == §_-3uA§.§_-908§ ? "boy" : "girl";
      }
      
      public function get gender() : int
      {
         return this.§_-BSf§ == "boy" ? §_-3uA§.§_-908§ : §_-3uA§.§_-BO7§;
      }
      
      public function set label(param1:String) : void
      {
         this._label = param1;
      }
      
      public function get localizedLabel() : String
      {
         return §_-ABX§.§_-631§(this._label);
      }
      
      public function set items(param1:Array) : void
      {
         this._items = param1;
      }
      
      public function get items() : Array
      {
         return this._items;
      }
      
      public function set priority(param1:int) : void
      {
         this._priority = param1;
      }
      
      public function get priority() : int
      {
         return this._priority;
      }
      
      public function set holiday(param1:String) : void
      {
         this.§_-8cb§ = param1;
      }
      
      public function get holiday() : String
      {
         return this.§_-8cb§;
      }
      
      public function get isHoliday() : Boolean
      {
         return this.holiday == null || §_-5KD§.instance.§_-C6D§(this.holiday);
      }
      
      public function hasItem(param1:String) : Boolean
      {
         return this._items.indexOf(param1) >= 0;
      }
   }
}

