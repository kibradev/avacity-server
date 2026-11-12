package §_-99s§
{
   import §_-41v§.§_-Bn1§;
   import §_-52p§.§_-25R§;
   import §_-52p§.§_-9d9§;
   import §_-5eM§.§_-5jU§;
   import §_-6-L§.§_-3hw§;
   import §_-6EA§.§_-Cb1§;
   import §_-8Hp§.§_-5KD§;
   import §_-BXK§.§_-9nk§;
   import §_-BeZ§.§_-4Ww§;
   import §_-Bwh§.§_-AMW§;
   import §_-ByP§.§_-A7b§;
   import §_-GM§.Context;
   
   public class §_-7Tj§ extends §_-2rp§
   {
      private static const §_-AHc§:String = "r";
      
      private static const §_-8hH§:String = "ss";
      
      private static const §_-5oL§:String = "se";
      
      private static const §_-4nJ§:String = "sg";
      
      private static const §_-7kT§:String = "v";
      
      private static const §_-92B§:String = "w";
      
      private static const §_-09C§:String = "new";
      
      private static const §_-9ns§:String = "h";
      
      private static const §_-FC§:String = "pr";
      
      private static const §_-0Md§:String = "t";
      
      private static const §_-2lO§:String = "ct";
      
      private static const §_-3O-§:String = "cs";
      
      private static const §_-5by§:String = "cg";
      
      private static const §_-A8h§:String = "cb";
      
      private static const §_-3GC§:String = "vml";
      
      private static const §_-CHt§:String = "pid";
      
      private static const §_-CC-§:String = "plv";
      
      private static const §_-7It§:String = "dmp";
      
      public static const §_-5Fp§:String = "visible";
      
      public static const §_-4wM§:String = "true";
      
      public static const §_-3jU§:String = "false";
      
      protected var §_-7i0§:§_-Cb1§ = new §_-Cb1§(0);
      
      protected var §_-Akj§:§_-Cb1§ = new §_-Cb1§(0);
      
      protected var §_-AR5§:§_-Cb1§ = new §_-Cb1§(0);
      
      protected var §_-BLb§:Boolean = false;
      
      private var §_-1yo§:int = -1;
      
      protected var §_-8gS§:Boolean = false;
      
      protected var §_-Azd§:Boolean = false;
      
      protected var §_-8cb§:String = null;
      
      protected var _priority:int = 0;
      
      protected var §_-BPN§:Boolean = false;
      
      protected var §_-96D§:Boolean = false;
      
      protected var §_-Bok§:Boolean = false;
      
      protected var §_-41x§:Boolean = true;
      
      private var §_-8ZL§:String = null;
      
      private var §_-Ant§:int = 0;
      
      protected var §_-BYK§:§_-Cb1§ = new §_-Cb1§(0);
      
      private var §_-CVM§:String = null;
      
      private var §_-0Ri§:Array = [];
      
      public function §_-7Tj§()
      {
         super();
      }
      
      override public function loadXML(param1:XML) : void
      {
         super.loadXML(param1);
         this.§_-B5Y§ = §_-3hw§.getInt(param1,"@saleSilver",0);
         this.§_-B3p§ = §_-3hw§.getInt(param1,"@saleEnergy",0);
         this.§_-873§ = §_-3hw§.getInt(param1,"@saleGold",0);
         this.§_-BLb§ = §_-3hw§.getBoolean(param1,"@vipOnly");
         this.§_-1yo§ = §_-3hw§.getInt(param1,"@vipMinLevel");
         this.§_-8gS§ = §_-3hw§.getBoolean(param1,"@wedding");
         this.§_-Azd§ = §_-3hw§.getBoolean(param1,"@isNew");
         this.§_-8cb§ = §_-3hw§.getString(param1,"@holiday");
         this._priority = §_-3hw§.getInt(param1,"@priority");
         this.§_-BPN§ = §_-3hw§.getBoolean(param1,"@canTrade");
         this.§_-96D§ = §_-3hw§.getBoolean(param1,"@canSale");
         this.§_-Bok§ = §_-3hw§.getBoolean(param1,"@canGift");
         this.§_-41x§ = §_-3hw§.getBoolean(param1,"@canBuy",true);
         this.§_-0Ri§ = §_-3hw§.getList(param1,"@demoModes",[]);
         this.§_-8ZL§ = §_-3hw§.getString(param1,"@professionId");
         this.§_-Ant§ = §_-3hw§.getInt(param1,"@professionLevel");
         this.§_-CVM§ = §_-3hw§.getString(param1,"@theme");
         this.ruby = §_-3hw§.getInt(param1,"@ruby");
      }
      
      public function get §_-B5Y§() : int
      {
         return this.§_-7i0§.value;
      }
      
      public function set §_-B5Y§(param1:int) : void
      {
         this.§_-7i0§.value = param1;
      }
      
      public function get §_-B3p§() : int
      {
         return this.§_-Akj§.value;
      }
      
      public function set §_-B3p§(param1:int) : void
      {
         this.§_-Akj§.value = param1;
      }
      
      public function get §_-873§() : int
      {
         return this.§_-AR5§.value;
      }
      
      public function set §_-873§(param1:int) : void
      {
         this.§_-AR5§.value = param1;
      }
      
      public function get §_-BKa§() : Boolean
      {
         return this.§_-BPN§;
      }
      
      public function get canSale() : Boolean
      {
         return this.§_-96D§;
      }
      
      public function get canGift() : Boolean
      {
         return this.§_-Bok§;
      }
      
      public function get canBuy() : Boolean
      {
         return this.§_-41x§ && §_-5KD§.instance.canBuyItem(typeId) && this.§_-5tB§;
      }
      
      public function get isVip() : Boolean
      {
         return this.§_-BLb§;
      }
      
      public function get vipMinLevel() : int
      {
         return this.§_-1yo§;
      }
      
      public function get §_-AvQ§() : Boolean
      {
         return this.§_-8gS§;
      }
      
      public function get isNew() : Boolean
      {
         return this.§_-Azd§ && !this.isSaleItem;
      }
      
      public function get theme() : String
      {
         return this.§_-CVM§;
      }
      
      public function get oldSilverPrice() : int
      {
         if(this.isSaleItem || this.isFamilyTrophyDiscountItem())
         {
            return §_-79S§.value;
         }
         return 0;
      }
      
      public function get oldGoldPrice() : int
      {
         if(this.isSaleItem || this.isFamilyTrophyDiscountItem())
         {
            return §_-aj§.value;
         }
         return 0;
      }
      
      public function get discount() : int
      {
         if(!this.isSaleItem && !this.isFamilyTrophyDiscountItem())
         {
            return 0;
         }
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         if(this.oldGoldPrice > 0)
         {
            _loc1_ = this.oldGoldPrice;
            _loc2_ = this.gold;
         }
         else if(this.oldSilverPrice > 0)
         {
            _loc1_ = this.oldSilverPrice;
            _loc2_ = this.silver;
         }
         return (_loc1_ - _loc2_) / _loc1_ * 100;
      }
      
      public function get holiday() : String
      {
         return this.§_-8cb§;
      }
      
      public function get §_-BnD§() : Boolean
      {
         return this.holiday == null || §_-5KD§.instance.§_-C6D§(this.holiday);
      }
      
      public function get §_-5tB§() : Boolean
      {
         return this.§_-BnD§ && this.§_-9oL§();
      }
      
      public function get priority() : int
      {
         return this._priority;
      }
      
      public function get §_-Adw§() : Array
      {
         return this.§_-0Ri§;
      }
      
      public function §_-3uN§() : §_-5jU§
      {
         var _loc2_:String = null;
         var _loc1_:§_-5jU§ = category;
         while(_loc1_ != null)
         {
            _loc2_ = _loc1_.getAttribute(§_-5Fp§);
            if(_loc2_ == null || _loc2_ == §_-4wM§)
            {
               return _loc1_;
            }
            _loc1_ = _loc1_.parent;
         }
         return category;
      }
      
      protected function isFamilyTrophyDiscountItem() : Boolean
      {
         return Context.§_-0Vr§.§_-AUZ§() && findParentCategory(§_-9nk§.CATEGORY_MISC) != null && (findParentCategory(§_-Bn1§.§_-84v§) != null || findParentCategory(§_-Bn1§.§_-7Fu§) != null || findParentCategory(§_-Bn1§.§_-9da§) != null);
      }
      
      public function get isSaleItem() : Boolean
      {
         return §_-5KD§.instance.isSaleItem(typeId) || Context.§_-0Vr§.isSaleItem(typeId);
      }
      
      public function get isActiveX2SaleItem() : Boolean
      {
         return §_-5KD§.instance.isActiveX2SaleItem(typeId);
      }
      
      override public function get gold() : int
      {
         var _loc2_:§_-A7b§ = null;
         if(§_-5KD§.instance.isSaleItem(typeId))
         {
            _loc2_ = §_-5KD§.instance.getSaleItem(typeId);
            if(_loc2_ != null)
            {
               return _loc2_.gold;
            }
         }
         var _loc1_:§_-25R§ = Context.§_-0Vr§.getSalePrice(typeId);
         if(_loc1_ != null)
         {
            return _loc1_.gold;
         }
         if(this.isFamilyTrophyDiscountItem())
         {
            return Math.round(§_-aj§.value - §_-aj§.value * Context.§_-0Vr§.§_-7le§);
         }
         return super.gold;
      }
      
      override public function get silver() : int
      {
         var _loc2_:§_-A7b§ = null;
         if(§_-5KD§.instance.isSaleItem(typeId))
         {
            _loc2_ = §_-5KD§.instance.getSaleItem(typeId);
            if(_loc2_ != null)
            {
               return _loc2_.silver;
            }
         }
         var _loc1_:§_-25R§ = Context.§_-0Vr§.getSalePrice(typeId);
         if(_loc1_ != null)
         {
            return _loc1_.silver;
         }
         if(this.isFamilyTrophyDiscountItem())
         {
            return Math.round(§_-79S§.value - §_-79S§.value * Context.§_-0Vr§.§_-7le§);
         }
         return super.silver;
      }
      
      public function get §_-2bk§() : String
      {
         return this.§_-8ZL§;
      }
      
      public function get professionLevel() : int
      {
         return this.§_-Ant§;
      }
      
      public function get §_-1th§() : int
      {
         return this.isSaleItem ? this.§_-BYK§.value : 0;
      }
      
      public function get ruby() : int
      {
         var _loc2_:§_-A7b§ = null;
         if(this.§_-BYK§.value == 0)
         {
            return 0;
         }
         if(§_-5KD§.instance.isSaleItem(typeId))
         {
            _loc2_ = §_-5KD§.instance.getSaleItem(typeId);
            if(_loc2_ != null)
            {
               return _loc2_.gold;
            }
         }
         var _loc1_:§_-25R§ = Context.§_-0Vr§.getSalePrice(typeId);
         if(_loc1_ != null)
         {
            return _loc1_.gold;
         }
         return this.§_-BYK§.value;
      }
      
      public function set ruby(param1:int) : void
      {
         this.§_-BYK§.value = param1;
      }
      
      public function §_-9oL§() : Boolean
      {
         if(this.§_-8ZL§ == null)
         {
            return true;
         }
         if(!Context.§_-3mh§.§_-93o§(this.§_-8ZL§))
         {
            return false;
         }
         if(this.§_-Ant§ == 0)
         {
            return true;
         }
         return Context.cityPlayer.§_-tA§(this.§_-8ZL§);
      }
      
      public function §_-8IS§(param1:String) : Boolean
      {
         if(this.§_-0Ri§.length == 0)
         {
            return false;
         }
         return this.§_-0Ri§.indexOf(param1) >= 0;
      }
      
      override public function getPrice(param1:int) : §_-9d9§
      {
         var _loc2_:§_-9d9§ = super.getPrice(param1);
         if(param1 == §_-AMW§.§_-85a§ || param1 == §_-AMW§.§_-7v8§)
         {
            _loc2_.ruby = this.ruby;
         }
         return _loc2_;
      }
      
      override public function fromAGSObject(param1:§_-4Ww§) : void
      {
         super.fromAGSObject(param1);
         this.§_-BYK§ = new §_-Cb1§(param1.getInt(§_-AHc§,0));
         this.§_-7i0§ = new §_-Cb1§(param1.getInt(§_-8hH§,0));
         this.§_-Akj§ = new §_-Cb1§(param1.getInt(§_-5oL§,0));
         this.§_-AR5§ = new §_-Cb1§(param1.getInt(§_-4nJ§,0));
         this.§_-BLb§ = param1.getBoolean(§_-7kT§,false);
         this.§_-1yo§ = param1.getInt(§_-3GC§,-1);
         this.§_-8gS§ = param1.getBoolean(§_-92B§,false);
         this.§_-Azd§ = param1.getBoolean(§_-09C§,false);
         this.§_-8cb§ = param1.getString(§_-9ns§,null);
         this._priority = param1.getInt(§_-FC§,0);
         this.§_-CVM§ = param1.getString(§_-0Md§,null);
         this.§_-BPN§ = param1.getBoolean(§_-2lO§,false);
         this.§_-96D§ = param1.getBoolean(§_-3O-§,false);
         this.§_-Bok§ = param1.getBoolean(§_-5by§,false);
         this.§_-41x§ = param1.getBoolean(§_-A8h§,true);
         this.§_-8ZL§ = param1.getString(§_-CHt§,null);
         this.§_-Ant§ = param1.getInt(§_-CC-§,0);
         this.§_-0Ri§ = param1.getString(§_-7It§,"").split(",");
      }
   }
}

