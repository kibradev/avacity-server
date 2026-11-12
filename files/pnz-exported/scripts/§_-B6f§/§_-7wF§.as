package §_-B6f§
{
   import §_-BeZ§.§_-4Ww§;
   import §_-BeZ§.§_-8d2§;
   import adept.config.Configuration;
   
   public class §_-7wF§ implements §_-8d2§
   {
      public static const §_-6k6§:String = "notEnougth";
      
      public static const §_-3bA§:String = "room";
      
      public static const §_-9G3§:String = "onlyOne";
      
      public static const §_-2C0§:String = "mainDialog";
      
      public static const §_-67a§:String = "starter";
      
      public static const §_-Ak7§:String = "unban";
      
      public static const §_-9Id§:String = "campaign";
      
      public static const §_-931§:String = "rubyShop";
      
      public static const §_-6cv§:String = "bonesShop";
      
      public static const §_-BIf§:String = "vipPack";
      
      public static const §_-9BA§:String = "furnitureGroup";
      
      private static const §_-0Mc§:String = "ind";
      
      private static const §_-KB§:String = "i";
      
      private static const §_-76n§:String = "p";
      
      private static const §_-5BT§:String = "op";
      
      private static const §_-88V§:String = "g";
      
      private static const §_-5gN§:String = "bg";
      
      private static const §_-Byw§:String = "bs";
      
      private static const §_-9-i§:String = "s";
      
      private static const §_-1Fz§:String = "e";
      
      private static const §_-AUF§:String = "r";
      
      private static const §_-3Vm§:String = "br";
      
      private static const §_-3oG§:String = "v";
      
      private static const §_-AV7§:String = "ic";
      
      private static const §_-4su§:String = "t";
      
      private static const §_-BlI§:String = "it";
      
      private static const §_-6hf§:String = "l";
      
      private static const §_-8F0§:String = "sb";
      
      private static const §_-1px§:String = "bns";
      
      private static const §_-7vW§:String = "bbns";
      
      private static const §_-0T3§:String = "pr";
      
      private var _index:int = -1;
      
      private var §_-AcP§:String = null;
      
      private var §_-N-§:int = 0;
      
      private var §_-38r§:int = 0;
      
      private var §_-aj§:int = 0;
      
      private var §_-AUO§:int = 0;
      
      private var §_-9DL§:int = 0;
      
      private var §_-79S§:int = 0;
      
      private var §_-1Rh§:int = 0;
      
      private var §_-BYK§:int = 0;
      
      private var §_-49K§:int = 0;
      
      private var §_-0AE§:int = 0;
      
      private var §_-2UH§:int = 0;
      
      private var §_-AXo§:int = 0;
      
      private var _label:String = null;
      
      protected var §_-13F§:Array = [];
      
      private var _items:Array = [];
      
      private var §_-RU§:Boolean = false;
      
      private var _icon:String = null;
      
      private var §_-BFK§:int = 0;
      
      public function §_-7wF§()
      {
         super();
      }
      
      public function configure(param1:Configuration) : void
      {
         var _loc3_:Configuration = null;
         var _loc4_:§_-Blq§ = null;
         this._index = param1.getInt("index",-1);
         this.§_-AcP§ = param1.getString("id");
         this.§_-N-§ = param1.getInt("points",0);
         this.§_-38r§ = param1.getInt("oldPoints",0);
         this.§_-aj§ = param1.getInt("gold",0);
         this.§_-79S§ = param1.getInt("silver",0);
         this.§_-1Rh§ = param1.getInt("energy",0);
         this.§_-BYK§ = param1.getInt("ruby",0);
         this.§_-49K§ = param1.getInt("bonusRuby",0);
         this.§_-0AE§ = param1.getInt("bones",0);
         this.§_-2UH§ = param1.getInt("bonusBones",0);
         this.§_-AXo§ = param1.getInt("vipPoints",0);
         this.§_-AUO§ = param1.getInt("bonusGold",0);
         this.§_-9DL§ = param1.getInt("bonusSilver",0);
         this._icon = param1.getString("icon");
         this._label = param1.getString("label");
         this.§_-13F§ = param1.getString("tag") != null ? param1.getString("tag").split(",") : [];
         this.§_-RU§ = param1.getBoolean("subscription",false);
         this.§_-BFK§ = param1.getInt("period",0);
         var _loc2_:Configuration = param1.getConfiguration("items");
         if(_loc2_ != null && _loc2_.getList("item").length > 0)
         {
            for each(_loc3_ in _loc2_.getList("item"))
            {
               _loc4_ = new §_-Blq§();
               _loc4_.configure(_loc3_);
               this._items.push(_loc4_);
            }
         }
      }
      
      public function get index() : int
      {
         return this._index;
      }
      
      public function set index(param1:int) : void
      {
         this._index = param1;
      }
      
      public function get id() : String
      {
         return this.§_-AcP§;
      }
      
      public function set id(param1:String) : void
      {
         this.§_-AcP§ = param1;
      }
      
      public function get tags() : Array
      {
         return this.§_-13F§;
      }
      
      public function get icon() : String
      {
         return this._icon;
      }
      
      public function set icon(param1:String) : void
      {
         this._icon = param1;
      }
      
      public function get points() : int
      {
         return this.§_-N-§;
      }
      
      public function get silver() : int
      {
         return this.§_-79S§;
      }
      
      public function get energy() : int
      {
         return this.§_-1Rh§;
      }
      
      public function get vipPoints() : int
      {
         return this.§_-AXo§;
      }
      
      public function get gold() : int
      {
         return this.§_-aj§;
      }
      
      public function get ruby() : int
      {
         return this.§_-BYK§;
      }
      
      public function get bonusGold() : int
      {
         return this.§_-AUO§;
      }
      
      public function get bonusRuby() : int
      {
         return this.§_-49K§;
      }
      
      public function get bonusSilver() : int
      {
         return this.§_-9DL§;
      }
      
      public function get label() : String
      {
         return this._label;
      }
      
      public function get oldPoints() : int
      {
         return this.§_-38r§;
      }
      
      public function get totalGold() : int
      {
         return this.§_-aj§ + this.§_-AUO§;
      }
      
      public function get §_-3gr§() : int
      {
         return this.§_-BYK§ + this.§_-49K§;
      }
      
      public function get §_-1Ik§() : int
      {
         return this.§_-0AE§ + this.§_-2UH§;
      }
      
      public function get §_-4gL§() : Boolean
      {
         return this.§_-13F§.indexOf(§_-67a§) >= 0;
      }
      
      public function get §_-AIL§() : Boolean
      {
         return this.§_-13F§.indexOf(§_-2C0§) >= 0;
      }
      
      public function get §_-7Py§() : Boolean
      {
         return this.§_-13F§.indexOf(§_-6k6§) >= 0;
      }
      
      public function get §_-3ls§() : Boolean
      {
         return this.§_-13F§.indexOf(§_-3bA§) >= 0;
      }
      
      public function get §_-BK2§() : Boolean
      {
         return this.§_-13F§.indexOf(§_-9G3§) >= 0;
      }
      
      public function get §_-9w6§() : Boolean
      {
         return this.§_-13F§.indexOf(§_-9BA§) >= 0;
      }
      
      public function get §_-5Vj§() : Boolean
      {
         return this.§_-13F§.indexOf(§_-Ak7§) >= 0;
      }
      
      public function get §_-72i§() : Boolean
      {
         return this.§_-13F§.indexOf(§_-9Id§) >= 0;
      }
      
      public function get §_-3IF§() : Boolean
      {
         return this.§_-RU§;
      }
      
      public function get §_-AGq§() : Boolean
      {
         return this.§_-13F§.indexOf(§_-931§) >= 0;
      }
      
      public function get §_-4e5§() : Boolean
      {
         return this.§_-13F§.indexOf(§_-BIf§) >= 0;
      }
      
      public function get §_-8B6§() : Boolean
      {
         return this.§_-13F§.indexOf(§_-6cv§) >= 0;
      }
      
      public function get bones() : int
      {
         return this.§_-0AE§;
      }
      
      public function get bonusBones() : int
      {
         return this.§_-2UH§;
      }
      
      public function getItemsByGender(param1:int) : Array
      {
         var _loc3_:§_-Blq§ = null;
         var _loc2_:Array = [];
         for each(_loc3_ in this._items)
         {
            if(_loc3_.gender == 0 || _loc3_.gender == param1)
            {
               _loc2_.push(_loc3_);
            }
         }
         return _loc2_;
      }
      
      public function get items() : Array
      {
         return this._items;
      }
      
      public function toAGSObject(param1:§_-4Ww§) : void
      {
      }
      
      public function fromAGSObject(param1:§_-4Ww§) : void
      {
         this.§_-AcP§ = param1.getString(§_-KB§);
         this._index = param1.getInt(§_-0Mc§);
         this.§_-N-§ = param1.getInt(§_-76n§,0);
         this.§_-38r§ = param1.getInt(§_-5BT§,0);
         this.§_-aj§ = param1.getInt(§_-88V§,0);
         this.§_-79S§ = param1.getInt(§_-9-i§,0);
         this.§_-1Rh§ = param1.getInt(§_-1Fz§,0);
         this.§_-BYK§ = param1.getInt(§_-AUF§,0);
         this.§_-49K§ = param1.getInt(§_-3Vm§,0);
         this.§_-0AE§ = param1.getInt(§_-1px§,0);
         this.§_-2UH§ = param1.getInt(§_-7vW§,0);
         this.§_-AXo§ = param1.getInt(§_-3oG§,0);
         this.§_-AUO§ = param1.getInt(§_-5gN§,0);
         this.§_-9DL§ = param1.getInt(§_-Byw§,0);
         this._icon = param1.getString(§_-AV7§);
         this._label = param1.getString(§_-6hf§);
         this.§_-13F§ = param1.§_-Bc6§(§_-4su§,String);
         this.§_-RU§ = param1.getBoolean(§_-8F0§,false);
         this.§_-BFK§ = param1.getInt(§_-0T3§,0);
         this._items = param1.§_-Bc6§(§_-BlI§,§_-Blq§);
      }
      
      public function get period() : int
      {
         return this.§_-BFK§;
      }
   }
}

