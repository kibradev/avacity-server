package §_-5wm§
{
   import §_-0fi§.§_-6f3§;
   import §_-1Vu§.§_-Awf§;
   import §_-1vM§.§_-5RD§;
   import §_-1vM§.§_-6He§;
   import §_-1vM§.§_-6oF§;
   import §_-5rJ§.§_-3Lg§;
   import §_-6p3§.§_-CYP§;
   import §_-99s§.§_-0Us§;
   import §_-99s§.§_-7Tj§;
   import §_-99s§.§_-8S5§;
   import §_-CEm§.§_-LE§;
   import §_-GM§.Context;
   
   public class §_-0a4§ extends §_-BOZ§
   {
      public static const §_-8jt§:String = "cls";
      
      public static const §_-0jN§:String = "frn";
      
      public static const §_-ot§:String = "gm";
      
      public static const §_-33I§:String = "lt";
      
      public static const §_-2Qu§:String = "act";
      
      public static const §_-0vF§:String = "ptcls";
      
      public static const §_-7yH§:String = "ptoth";
      
      public static const §_-1WV§:String = "anm";
      
      public static const §_-0Ls§:String = "shd";
      
      public function §_-0a4§()
      {
         super();
         §_-42§(new §_-5YM§(§_-8jt§));
         §_-42§(new §_-5YM§(§_-0jN§));
         §_-42§(new §_-5YM§(§_-ot§));
         §_-42§(new §_-5YM§(§_-33I§));
         §_-42§(new §_-5YM§(§_-2Qu§));
         §_-42§(new §_-5YM§(§_-0vF§));
         §_-42§(new §_-5YM§(§_-1WV§));
         §_-42§(new §_-5YM§(§_-0Ls§));
      }
      
      public function get clothesCollection() : §_-5YM§
      {
         return §_-Bc6§(§_-8jt§);
      }
      
      public function get furnitureCollection() : §_-5YM§
      {
         return §_-Bc6§(§_-0jN§);
      }
      
      public function get gameCollection() : §_-5YM§
      {
         return §_-Bc6§(§_-ot§);
      }
      
      public function get §_-9dO§() : §_-5YM§
      {
         return §_-Bc6§(§_-33I§);
      }
      
      public function get §_-45t§() : §_-5YM§
      {
         return §_-Bc6§(§_-2Qu§);
      }
      
      public function get §_-1t2§() : §_-5YM§
      {
         return §_-Bc6§(§_-0vF§);
      }
      
      public function get §_-C1x§() : §_-5YM§
      {
         return §_-Bc6§(§_-7yH§);
      }
      
      public function get §_-1wD§() : §_-5YM§
      {
         return §_-Bc6§(§_-1WV§);
      }
      
      public function get §_-9xy§() : §_-5YM§
      {
         return §_-Bc6§(§_-0Ls§);
      }
      
      override public function getCollectionForItem(param1:InventoryItem) : §_-5YM§
      {
         if(param1.type is §_-6f3§)
         {
            return this.furnitureCollection;
         }
         if(param1.type is §_-Awf§)
         {
            return this.clothesCollection;
         }
         if(param1.type is §_-CYP§)
         {
            return this.gameCollection;
         }
         if(param1.type is §_-0Us§)
         {
            return this.§_-9dO§;
         }
         if(param1.type is §_-8S5§)
         {
            return this.§_-45t§;
         }
         if(param1.type is §_-6He§)
         {
            return this.§_-C1x§;
         }
         if(param1.type is §_-5RD§)
         {
            return this.§_-1t2§;
         }
         if(param1.type is §_-6oF§)
         {
            return this.furnitureCollection;
         }
         if(param1.type is §_-LE§)
         {
            return this.§_-9xy§;
         }
         if(param1.type is §_-3Lg§)
         {
            return this.§_-1wD§;
         }
         return null;
      }
      
      override public function getItemCollectionId(param1:String) : String
      {
         var _loc2_:§_-7Tj§ = Context.§_-70S§.findShopItem(param1);
         if(_loc2_ is §_-Awf§)
         {
            return §_-0a4§.§_-8jt§;
         }
         if(_loc2_ is §_-6f3§)
         {
            return §_-0a4§.§_-0jN§;
         }
         if(_loc2_ is §_-CYP§)
         {
            return §_-0a4§.§_-ot§;
         }
         if(_loc2_ is §_-8S5§)
         {
            return §_-0a4§.§_-2Qu§;
         }
         if(_loc2_ is §_-0Us§)
         {
            return §_-0a4§.§_-33I§;
         }
         if(_loc2_ is §_-5RD§)
         {
            return §_-0a4§.§_-0vF§;
         }
         if(_loc2_ is §_-6He§)
         {
            return §_-0a4§.§_-7yH§;
         }
         if(_loc2_ is §_-6oF§)
         {
            return §_-0a4§.§_-0jN§;
         }
         if(_loc2_ is §_-3Lg§)
         {
            return §_-0a4§.§_-1WV§;
         }
         if(_loc2_ is §_-LE§)
         {
            return §_-0a4§.§_-0Ls§;
         }
         throw new Error("invalid item type " + param1);
      }
      
      public function readOnlyLink() : §_-0a4§
      {
         var _loc2_:§_-5YM§ = null;
         var _loc1_:§_-0a4§ = new §_-0a4§();
         for each(_loc2_ in §_-3LT§)
         {
            _loc1_.§_-42§(_loc2_.readOnlyLink());
         }
         return _loc1_;
      }
      
      public function §_-35N§(param1:Array) : void
      {
         var _loc2_:InventoryItem = null;
         if(param1 == null || param1.length == 0)
         {
            return;
         }
         for each(_loc2_ in param1)
         {
            this.getCollectionForItem(_loc2_).updateItem(_loc2_);
         }
      }
   }
}

