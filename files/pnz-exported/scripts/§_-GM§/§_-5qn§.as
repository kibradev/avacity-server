package §_-GM§
{
   import §_-0XI§.§_-7fw§;
   import §_-0fi§.§_-6f3§;
   import §_-0sG§.§_-BW1§;
   import §_-0uA§.§_-3YE§;
   import §_-1Vu§.§_-Awf§;
   import §_-1sb§.§_-7A5§;
   import §_-1sb§.§_-8eK§;
   import §_-1vM§.§_-0AJ§;
   import §_-1vM§.§_-5Nf§;
   import §_-1vM§.§_-5RD§;
   import §_-1vM§.§_-6He§;
   import §_-1vM§.§_-6oF§;
   import §_-1vM§.§_-AN§;
   import §_-2U3§.ResourceManager;
   import §_-39l§.§_-5t6§;
   import §_-5eM§.§_-4Z7§;
   import §_-5eM§.§_-5jU§;
   import §_-5qq§.§_-2jY§;
   import §_-5rJ§.§_-3Lg§;
   import §_-64D§.§_-LU§;
   import §_-68C§.§_-8R1§;
   import §_-6p3§.§_-3Kr§;
   import §_-6p3§.§_-CYP§;
   import §_-76Z§.§_-2jg§;
   import §_-7xl§.§_-7VJ§;
   import §_-99s§.§_-0Us§;
   import §_-99s§.§_-8S5§;
   import §_-9PR§.§_-Bwy§;
   import §_-CEm§.§_-LE§;
   import §_-zT§.§_-102§;
   import flash.utils.ByteArray;
   import penzville.Config;
   
   public class §_-5qn§
   {
      private static const §_-Lq§:uint = 100;
      
      public static var furnitureList:Object = {};
      
      public static var §_-1IX§:Array = [];
      
      private static var §_-Aoc§:Object = {};
      
      private static const §_-2j8§:Class = §_-3zy§;
      
      private static var §_-BeU§:XML = null;
      
      public function §_-5qn§()
      {
         super();
      }
      
      public static function get §_-382§() : §_-102§
      {
         var _loc1_:§_-102§ = §_-4Ft§("config");
         return Config.§_-3NZ§ && Math.random() > 0.6 ? null : _loc1_;
      }
      
      private static function §_-4Ft§(param1:String) : §_-102§
      {
         return §_-Aoc§[param1];
      }
      
      public static function get §_-CL6§() : XML
      {
         var _loc1_:ByteArray = null;
         if(§_-BeU§ == null)
         {
            _loc1_ = new §_-2j8§() as ByteArray;
            §_-BeU§ = new XML(_loc1_.readUTFBytes(_loc1_.length));
         }
         return §_-BeU§;
      }
      
      public static function §_-36r§(param1:String, param2:§_-7VJ§, param3:Array) : void
      {
         var _loc4_:String = null;
         furnitureList[param1] = param2;
         §_-1IX§.push(param1);
         while(§_-1IX§.length > §_-Lq§)
         {
            _loc4_ = §_-1IX§.shift();
            if(param3.indexOf(_loc4_) >= 0)
            {
               §_-1IX§.push(_loc4_);
               if(param3.length > §_-Lq§)
               {
                  break;
               }
            }
            else
            {
               furnitureList[_loc4_] = null;
               delete furnitureList[_loc4_];
               ResourceManager.§_-71T§(_loc4_);
            }
         }
      }
      
      public static function §_-7vq§(param1:String, param2:§_-102§) : void
      {
         §_-Aoc§[param1] = param2;
         if(param1.indexOf("config") >= 0)
         {
            §_-7Aq§(param2);
         }
      }
      
      private static function §_-7Aq§(param1:§_-102§) : void
      {
         var _loc3_:String = null;
         var _loc5_:String = null;
         var _loc6_:XML = null;
         Context.§_-6vd§.init(§_-5qn§.§_-382§.§_-9QW§("avatarAppearance/colors.xml"),§_-5qn§.§_-382§.§_-9QW§("avatarAppearance/appearance.xml"));
         Context.§_-70S§.§_-0Z§("furniture",§_-6f3§);
         Context.§_-70S§.§_-0Z§("clothes",§_-Awf§);
         Context.§_-70S§.§_-0Z§("personalAnimation",§_-3Lg§);
         Context.§_-70S§.§_-0Z§("shadowAnimation",§_-LE§);
         Context.§_-70S§.§_-0Z§("game",§_-CYP§);
         Context.§_-70S§.§_-0Z§("loot",§_-0Us§);
         Context.§_-70S§.§_-0Z§("active",§_-8S5§);
         Context.§_-70S§.§_-0Z§("stickerPack",§_-7fw§);
         Context.§_-70S§.§_-0Z§("clanFurniture",§_-2jY§);
         Context.§_-70S§.§_-0Z§("clanRecipe",§_-8R1§);
         Context.§_-70S§.§_-0Z§("clanContest",§_-LU§);
         Context.§_-70S§.§_-0Z§("petFurniture",§_-AN§);
         Context.§_-70S§.§_-0Z§("petClothes",§_-5RD§);
         Context.§_-70S§.§_-0Z§("petMini",§_-6oF§);
         Context.§_-70S§.§_-0Z§("petBox",§_-5Nf§);
         Context.§_-70S§.§_-0Z§("petGame",§_-6He§);
         Context.§_-70S§.§_-0Z§("pets",§_-0AJ§);
         Context.§_-70S§.§_-0Z§("openableGifts",§_-3Kr§);
         Context.§_-Amy§.§_-A1K§(§_-5qn§.§_-382§.§_-9QW§("inventory/extend/clothesSets.xml"));
         Context.§_-Amy§.§_-9NB§(§_-5qn§.§_-382§.§_-9QW§("inventory/extend/clothesCollections.xml"));
         Context.§_-Amy§.§_-EH§(§_-5qn§.§_-382§.§_-9QW§("inventory/extend/clothesRules.xml"));
         Context.§_-Amy§.§_-7nW§(§_-5qn§.§_-382§.§_-9QW§("inventory/extend/clothesColors.xml"));
         var _loc2_:§_-5jU§ = new §_-5jU§();
         _loc2_.categoryId = §_-4Z7§.§_-2ce§;
         _loc2_.label = "#rootFurnitureCategory";
         Context.§_-70S§.§_-0ZU§().§_-184§(_loc2_);
         _loc2_.loadXML(§_-5qn§.§_-382§.§_-9QW§("inventory/roomLayout.xml"));
         _loc2_.loadXML(§_-5qn§.§_-382§.§_-9QW§("inventory/furniture.xml"));
         _loc2_.loadXML(§_-5qn§.§_-382§.§_-9QW§("inventory/bathroom.xml"));
         _loc2_.loadXML(§_-5qn§.§_-382§.§_-9QW§("inventory/decor.xml"));
         _loc2_.loadXML(§_-5qn§.§_-382§.§_-9QW§("inventory/kitchen.xml"));
         _loc2_.loadXML(§_-5qn§.§_-382§.§_-9QW§("inventory/present.xml"));
         _loc2_.loadXML(§_-5qn§.§_-382§.§_-9QW§("inventory/clanFurniture.xml"));
         _loc2_.loadXML(§_-5qn§.§_-382§.§_-9QW§("inventory/petFurniture.xml"));
         Context.§_-6fU§.§_-9NB§(§_-5qn§.§_-382§.§_-9QW§("inventory/extend/furnitureCollection.xml"));
         Context.§_-6fU§.§_-A1K§(§_-5qn§.§_-382§.§_-9QW§("inventory/extend/furnitureSets.xml"));
         Context.§_-6fU§.§_-B0D§(§_-5qn§.§_-382§.§_-9QW§("inventory/extend/furnitureRoomDesign.xml"));
         Context.§_-70S§.§_-0ZU§().loadXML(§_-5qn§.§_-382§.§_-9QW§("inventory/game.xml"));
         Context.§_-70S§.§_-0ZU§().loadXML(§_-5qn§.§_-382§.§_-9QW§("inventory/personalAnimations.xml"));
         Context.§_-70S§.§_-0ZU§().loadXML(§_-5qn§.§_-382§.§_-9QW§("inventory/stickerPack.xml"));
         Context.§_-70S§.§_-0ZU§().loadXML(§_-5qn§.§_-382§.§_-9QW§("inventory/clanRecipe.xml"));
         Context.§_-70S§.§_-0ZU§().loadXML(§_-5qn§.§_-382§.§_-9QW§("inventory/petClothes.xml"));
         Context.§_-70S§.§_-0ZU§().loadXML(§_-5qn§.§_-382§.§_-9QW§("inventory/petItems.xml"));
         for each(_loc3_ in §_-5qn§.§_-382§.getNames("map/"))
         {
            §_-BW1§.instance.§_-Bk0§(_loc3_,§_-5qn§.§_-382§.§_-9QW§(_loc3_));
         }
         Context.§_-YR§.configure(§_-5qn§.§_-382§.§_-9QW§("modules/tutorial.xml"));
         Context.§_-2Vf§.§_-Bk0§(§_-5qn§.§_-382§.§_-9QW§("modules/quests.xml"));
         Context.§_-AI9§.configure(§_-5qn§.§_-382§.§_-9QW§("modules/relations.xml"));
         Context.§_-4pZ§.configure(§_-5qn§.§_-382§.§_-9QW§("modules/dailyGift.xml"));
         Context.§_-0Uu§.configure(§_-5qn§.§_-382§.§_-9QW§("modules/roomActions.xml"));
         Context.craftManager.configure(§_-5qn§.§_-382§.§_-9QW§("modules/craft.xml"));
         Context.§_-3QG§.§_-2bH§(§_-5qn§.§_-382§.§_-9QW§("modules/achievements.xml"));
         Context.§_-3QG§.§_-8Xx§(§_-5qn§.§_-382§.§_-9QW§("modules/trophies.xml"));
         Context.§_-3QG§.§_-4ME§(§_-5qn§.§_-382§.§_-9QW§("modules/avapacasCollection.xml"));
         Context.§_-vC§.configure(§_-5qn§.§_-382§.§_-9QW§("map/tutorial/npcHouse.xml"));
         if(§_-5qn§.§_-382§.§_-9QW§("modules/photoSalon.xml") != null)
         {
            Context.§_-3Ok§.configure(§_-5qn§.§_-382§.§_-9QW§("modules/photoSalon.xml"));
         }
         if(§_-5qn§.§_-382§.§_-9QW§("modules/professions.xml") != null)
         {
            Context.§_-2Vf§.§_-Bk0§(§_-5qn§.§_-382§.§_-9QW§("modules/pro_quests.xml"));
            Context.§_-3mh§.configure(§_-5qn§.§_-382§.§_-9QW§("modules/professions.xml"));
         }
         if(§_-5qn§.§_-382§.§_-9QW§("modules/reputation.xml") != null)
         {
            Context.§_-76P§.configure(§_-5qn§.§_-382§.§_-9QW§("modules/reputation.xml"));
         }
         Context.§_-BFW§.§_-BvY§(§_-5qn§.§_-382§.§_-9QW§("location/games.xml"));
         Context.§_-4y8§.§_-Bk0§(§_-5qn§.§_-382§.§_-9QW§("location/work.xml"));
         Context.§_-Bd7§.§_-0NM§(§_-5qn§.§_-382§.§_-9QW§("location/clan.xml"));
         Context.§_-5Q-§.configure(§_-5qn§.§_-382§.§_-9QW§("location/gamesConfig.xml"));
         Context.§_-2je§.configure(§_-5qn§.§_-382§.§_-9QW§("modules/activityRating.xml"));
         if(Context.§_-05q§ != null)
         {
            Context.§_-05q§.configure(§_-5qn§.§_-382§.§_-9QW§("modules/moderation.xml"));
         }
         if(§_-5qn§.§_-382§.§_-9QW§("modules/offers.xml") != null)
         {
            §_-Bwy§.instance.configure(§_-5qn§.§_-382§.§_-9QW§("modules/offers.xml"));
         }
         if(§_-5qn§.§_-382§.§_-9QW§("modules/clan.xml") != null)
         {
            §_-5t6§.instance.configure(§_-5qn§.§_-382§.§_-9QW§("modules/clan.xml"));
            Context.§_-Bb2§.configure(param1.§_-9QW§("modules/clan.xml"));
            Context.§_-2aP§.configure(param1.§_-9QW§("modules/clan.xml"));
         }
         if(§_-5qn§.§_-382§.§_-9QW§("modules/clanPrivileges.xml") != null)
         {
            §_-2jg§.§_-9p8§(§_-5qn§.§_-382§.§_-9QW§("modules/clanPrivileges.xml"));
         }
         if(§_-5qn§.§_-382§.§_-9QW§("modules/competitions.xml") != null)
         {
            Context.§_-7Ho§.configure(§_-5qn§.§_-382§.§_-9QW§("modules/competitions.xml"));
         }
         if(§_-5qn§.§_-382§.§_-9QW§("modules/callToGame.xml") != null)
         {
            Context.§_-CAt§.configure(§_-5qn§.§_-382§.§_-9QW§("modules/callToGame.xml"));
         }
         if(§_-5qn§.§_-382§.§_-9QW§("modules/holidays.xml") != null)
         {
            Context.§_-4R3§.configure(§_-5qn§.§_-382§.§_-9QW§("modules/holidays.xml"));
         }
         if(§_-5qn§.§_-382§.§_-9QW§("modules/cityEvent.xml") != null)
         {
            Context.§_-5aD§.configure(§_-5qn§.§_-382§.§_-9QW§("modules/cityEvent.xml"));
         }
         if(§_-5qn§.§_-382§.§_-9QW§("modules/clanContest.xml") != null)
         {
            Context.§_-34N§.configure(§_-382§.§_-9QW§("modules/clanContest.xml"));
         }
         if(§_-5qn§.§_-382§.§_-9QW§("modules/clanChallenge.xml") != null)
         {
            Context.§_-5gJ§.configure(§_-382§.§_-9QW§("modules/clanChallenge.xml"));
         }
         if(§_-5qn§.§_-382§.§_-9QW§("modules/leagueCompetition.xml") != null)
         {
            Context.§_-0Hj§.configure(§_-382§.§_-9QW§("modules/leagueCompetition.xml"));
         }
         if(§_-5qn§.§_-382§.§_-9QW§("modules/clanLeague.xml") != null)
         {
            Context.§_-9SO§.configure(§_-382§.§_-9QW§("modules/clanLeague.xml"));
         }
         if(§_-5qn§.§_-382§.§_-9QW§("modules/petAcl.xml") != null)
         {
            Context.§_-0sE§.configure(§_-382§.§_-9QW§("modules/petAcl.xml"));
         }
         if(§_-5qn§.§_-382§.§_-9QW§("modules/pet.xml") != null)
         {
            Context.§_-C8W§.configure(§_-382§.§_-9QW§("modules/pet.xml"));
            Context.§_-2t-§.configure(§_-382§.§_-9QW§("modules/pet.xml"));
         }
         if(§_-5qn§.§_-382§.§_-9QW§("modules/vip.xml") != null)
         {
            Context.§_-06H§.configure(§_-382§.§_-9QW§("modules/vip.xml"));
         }
         if(§_-5qn§.§_-382§.§_-9QW§("modules/tutorials.xml") != null)
         {
            Context.§_-XK§.configure(§_-382§.§_-9QW§("modules/tutorials.xml"));
         }
         var _loc4_:Array = §_-5qn§.§_-382§.getNames("translation/");
         for each(_loc5_ in _loc4_)
         {
            _loc6_ = §_-5qn§.§_-382§.§_-9QW§(_loc5_);
            if(_loc6_ == null)
            {
               §_-3YE§.§_-7aK§("Error loading translation xml: " + _loc5_);
            }
            §_-7A5§.§_-3OT§().§_-5xu§(new §_-8eK§(_loc6_));
         }
         §_-7A5§.§_-3OT§().locale = Config.locale;
      }
   }
}

