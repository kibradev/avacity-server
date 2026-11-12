package §_-5eM§
{
   import §_-2as§.§_-3y6§;
   import §_-99s§.§_-7Tj§;
   
   public class §_-4Z7§ implements §_-3y6§
   {
      public static const §_-5-P§:String = "clths";
      
      public static const §_-4RQ§:String = "boyClothes";
      
      public static const §_-A7R§:String = "girlClothes";
      
      public static const §_-2ce§:String = "furniture";
      
      public static const §_-1bD§:String = "personalAnimations";
      
      public static const §_-9Oi§:String = "loot";
      
      public static const §_-50-§:String = "active";
      
      public static const §_-4Zh§:String = "game";
      
      public static const §_-3FY§:String = "misc";
      
      public static const §_-5yN§:String = "stickerPack";
      
      public static const §_-7uG§:String = "chatDecorCategory";
      
      public static const §_-9T9§:String = "mobileCategory";
      
      public static const §_-76R§:String = "vipTickets";
      
      public static const §_-2xV§:String = "recipe";
      
      public static const §_-6My§:String = "clanContestCraftCategory";
      
      public static const §_-xT§:String = "pets";
      
      public static const §_-25g§:String = "petItems";
      
      public static const §_-04K§:String = "petClothes";
      
      public static const §_-A7h§:String = "petFurniture";
      
      public static const §_-480§:String = "petMini";
      
      public static const §_-2Z0§:String = "miscShop";
      
      public static const §_-8TK§:String = "boosters";
      
      public static const §_-56t§:String = "enchant";
      
      public static const §_-7pF§:String = "vipDroneSkinCategory";
      
      private var §_-5Xe§:§_-5jU§;
      
      private var §_-9pv§:Object = {};
      
      public function §_-4Z7§()
      {
         super();
         this.clear();
      }
      
      public function §_-0Z§(param1:String, param2:Class) : void
      {
         this.§_-9pv§[param1] = param2;
      }
      
      public function §_-2F4§(param1:String) : §_-5d-§
      {
         var _loc2_:Class = null;
         if(this.§_-9pv§.hasOwnProperty(param1))
         {
            _loc2_ = this.§_-9pv§[param1];
            return new _loc2_();
         }
         return new §_-5d-§();
      }
      
      public function §_-0ZU§() : §_-5jU§
      {
         return this.§_-5Xe§;
      }
      
      public function clear() : void
      {
         var _loc1_:String = null;
         for(_loc1_ in this.§_-9pv§)
         {
            delete this.§_-9pv§[_loc1_];
         }
         this.§_-9pv§ = {};
         this.§_-5Xe§ = new §_-5jU§();
         this.§_-5Xe§.§_-BlF§ = this;
      }
      
      public function findShopItem(param1:String) : §_-7Tj§
      {
         return §_-7Tj§(this.§_-0ZU§().findTypeById(param1));
      }
      
      public function §_-0s0§(param1:String) : Class
      {
         switch(param1)
         {
            case §_-5-P§:
               return §_-BOD§;
            default:
               return null;
         }
      }
      
      public function §_-Cbe§(param1:String, param2:Array) : void
      {
         var _loc3_:§_-BOD§ = null;
         var _loc4_:§_-5jU§ = null;
         for each(_loc3_ in param2)
         {
            _loc4_ = new §_-5jU§();
            _loc4_.categoryId = _loc3_.categoryId;
            this.§_-0ZU§().§_-184§(_loc4_);
            _loc4_.fromAGSObject(_loc3_.data);
         }
         this.§_-0ZU§().§_-CYX§();
      }
   }
}

