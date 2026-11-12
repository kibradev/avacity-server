package penzville
{
   import §_-0QS§.§_-A2I§;
   import §_-0uA§.§_-3YE§;
   import §_-9Bv§.§_-8fL§;
   import §_-GM§.Context;
   import adept.config.Configuration;
   import flash.system.Capabilities;
   import flash.utils.ByteArray;
   
   public class Config
   {
      private static var §_-9Kq§:int;
      
      private static const §_-CZX§:int = 11;
      
      private static const §_-BmB§:int = 3;
      
      private static const §_-B-e§:Class = §_-0LT§;
      
      private static var §_-2lH§:§_-8fL§ = null;
      
      private static const §_-7ql§:String = "local";
      
      private static var §_-11k§:String = §_-7ql§;
      
      private static var _version:String = "";
      
      private static var §_-0bv§:Boolean = false;
      
      private static var §_-5WI§:Boolean = false;
      
      private static var §_-8tG§:String = "localhost";
      
      private static var §_-B-i§:int = 8125;
      
      public static const §_-BUf§:int = 25;
      
      public static const §_-20b§:String = "city";
      
      public static const §_-1do§:String = "island";
      
      public static var §_-37U§:String = null;
      
      public static const §_-A9U§:uint = 760;
      
      public static const §_-20e§:uint = 650;
      
      public static var §_-ApK§:uint = 760;
      
      public static var §_-AoU§:uint = 650;
      
      public static var §_-50z§:uint = Config.§_-26H§;
      
      public static var §_-6Z0§:uint = Config.§_-8Gx§;
      
      public static var §_-0nZ§:Boolean = false;
      
      public static var §_-C6c§:Number = 1;
      
      public static var §_-0pB§:Number = 1;
      
      public static const §_-3uZ§:Number = 1;
      
      public static const §_-25U§:Number = 4;
      
      public static const §_-9ST§:Number = 5;
      
      public static const §_-5bP§:Number = 1.8;
      
      public static const §_-1mF§:Number = 440;
      
      public static var §_-0dT§:int = 200;
      
      public static const §_-8kG§:Array = [];
      
      public static const §_-9Fh§:Array = [];
      
      public static const §_-0iF§:Array = [];
      
      public static const §_-7vO§:Array = [];
      
      public static const §_-98c§:Array = ["boyAvatarClothes","boyCoctailClothes","boyEventClothes","boyNPCClothes","boyPhotosalonClothes","boySeasonClothes","boyUnderClothes","boyUsaSkateClothes","boyClanClothes","girlAvatarClothes","girlClubClothes","girlCoctailClothes","girlEventClothes","girlFunkyClothes","girlHalloweenClothes","girlNPCClothes","girlPhotosalonClothes","girlSeasonClothes","girlUnderClothes","girlUsaSkateClothes","girlClanClothes","barbarianClothes","dirol2015Clothes","superHeroClothes","halloween2015","avatarMiscCollections","professionClothes","clothesHalloween2016","newYearClothes","chinaNYClothes","magic2020Clothes","rock2020Clothes","police2020Clothes","clanSet2Clothes","clanSet3Clothes","stream19Clothes","dzo20Clothes","fa20Clothes","easter20Clothes","kPopClothes","pirates2020Clothes","AB20Clothes","wildWestClothes","swimsuits2020Clothes","bingo2020Clothes","tGCClothes","halloween2020","couturier2020","cyberpunk2020","newYear2021Clothes","sport2020Clothes","tikTok2Clothes"
      ,"survived2020Clothes","nightCollection2021Clothes","stValentine2021Clothes","dzo21Clothes","springDay2021Clothes","fa21Clothes","spaceXClothes","couturier2021","firstMay2021Clothes","wedding2021","summer2021","AB21Clothes","assassin2021Clothes","pajamas2021","mermaid2021Clothes","sport2021Clothes","oversize2021Clothes","burningman2021Clothes","schoolUniform2021Clothes","contest2021Clothes","tikTok3Clothes","clanSet4Clothes","steampunk2021Clothes","halloween2021Clothes","halloween2021EnchantmentsClothes","squidGameClothes","dune2021Clothes","exclusiveDailyGift2021Clothes","superAgentAvatar2021Clothes","newYear2022Clothes","couturier2022Clothes","kingdom2022Clothes","stValentine2022Clothes","dzo22Clothes","shrovetide2022Clothes","clanSet5Clothes","cyberpunk22Clothes","pilot22Clothes","fa22Clothes","fa22EnchClothes","bunny22Clothes","fm22Clothes","animalism22Clothes","fashion22Clothes","corrida22Clothes","mason22Clothes","elfs22Clothes","egypt22Clothes","got22Clothes","gn22Clothes","twich22Clothes"
      ,"tortuga22Clothes","diwali22Clothes","boho22Clothes","victorian22Clothes","summer22Clothes","mexico22Clothes","prince22Clothes","predator22Clothes","ntv22Shirts","ntv22Clothes","butterfly22Clothes","brazil22Clothes","gizmi22Clothes","everyDay22Clothes","twitch22Clothes","fireShow22Clothes","halloween2022Clothes","halloween2022EnchantmentsClothes","gerewol22Clothes","qatar2022Clothes","gen13Clothes","style22Clothes","autumnSpring2022Clothes","wayOfWater2022Clothes","totoro22Clothes","newYear2023Clothes","cyberpunkColor2022Clothes","twitch2022Clothes","veniceCarnivalClothes","stValentine2023Clothes","peru2023Clothes","shrovetide2023Clothes","giraffe23Clothes","fa23Clothes","southKorea23Clothes","astronaut23Clothes","clanSet7Clothes","clanSet6Clothes","fair2023Clothes","fm23Clothes","spell23Clothes","artist23Clothes","flower23Clothes","party23Clothes","stars23Clothes","cosmopirates23Clothes","spain23Clothes","jeans23Clothes","pixels23Clothes","darkFantasy23Clothes","retroWave23Clothes","sapper23Clothes"
      ,"china23Clothes","lingerie22Clothes","freshness23Clothes","rdf23Clothes","hockey23Clothes","kigurumi23Clothes","bahamas23Clothes","kingParty23Clothes","dog23Clothes","couturier23Clothes","halloween2023Clothes","HW23CanyonRider","twitch23Clothes","cherokee23Clothes","old23Clothes","baie23Clothes","snow23Clothes","elf23Clothes","newYear2024Clothes","newYear2024BattlePassClothes","christmasNight23Clothes","newYear2024Clothes","spring24Clothes","greece24Clothes","stValentine2024Clothes","chefClothes","gift24Clothes","casual24Clothes","star24Clothes","tgc24Clothes","holi24Clothes","shrovetide2024Clothes","patrik24Clothes","fa24Clothes","detective24Clothes","fair2024Clothes","fisherman24Clothes","cm24Clothes","twch24Clothes","BP24Clothes","AB24Clothes","youTube24Clothes","fantasy24Clothes","westernFantasy24Clothes","gccasual24Clothes","gcmoto24Clothes","cowboy24Clothes","clanSet8Clothes","basic24Clothes","fair2024Clothes","fisherman24Clothes","cm24Clothes","twch24Clothes","BP24Clothes","AB24Clothes"
      ,"youTube24Clothes","fair24Clothes","clanSet9Clothes","alt24Clothes","fairyTale24Clothes","autumn24Clothes","halloweenColor24Clothes","arcana24Clothes","nuar24Clothes","gamer24Clothes","halloween2024Clothes","gk24Clothes","winter24Clothes","competition24Clothes","clipTok24Clothes","clipbox2024Clothes","gyaru2024Clothes","newYear2025Clothes","newYearColor2025Clothes","couturier2025Clothes","glamWest25Clothes","cm25Clothes","stValentine2025Clothes","aegis25Clothes","st25Clothes","stPatrick2025Clothes","stellar25Clothes","fa25Clothes","kaq25Clothes","raceStyle25Clothes","fair2025Clothes","clanSet10Clothes","patches25Clothes","easter25Clothes","firstMay25Clothes","victoryDay25Clothes","childDay25Clothes","spin25Clothes","ab25Clothes","fakeClothes","brat25Clothes","headliner25Clothes","artist25Clothes","wedding25Clothes","makeupArtist25Clothes","natureHarmony25Clothes","friendshipDay25Clothes","luckyTicket25Clothes","cm25P2Clothes","gothic25Clothes","cleaner25Clothes","outcast25Clothes","iceCreamClothes"
      ,"fair25Clothes","paparazzi25Clothes","schoolUniform2025Clothes","halloween2025Clothes","autumn25Clothes","twitch25Clothes","sr25Clothes","bf25Clothes","newYear2026Clothes","cm26Clothes","softDisorderClothes","stValentine2026Clothes","couturier2026Clothes","st26Clothes","holi26Clothes","ay26Clothes","neoDragon26Clothes","stPatrick2026Clothes","fa26Clothes","easter26Clothes","spring26Clothes","fair261Clothes","firstMay26Clothes","victoryDay26Clothes","childDay26Clothes","avaBirthday26Clothes","familyDay26Clothes","magicFountain26Clothes","fair262Clothes"];
      
      public static const §_-10j§:Array = ["petClothes","petSummer24Clothes"];
      
      public static const §_-8s5§:Array = ["avatarAppearance","hairNeko2020","hairDuo2020","clanHairGlamour2","clanHairPostapoc2","clanHairMagic2","clanHairSciFi2","clanAppearanceMagic2","clanAppearancePostapoc2","clanAppearanceGlamour2","clanAppearanceSciFi2","clanHairParadise","clanHairHell","clanAppearanceParadise","clanAppearanceHell","mermaid2021Appearance","burningman2021Appearance","clanAppearancePart3","halloween2021EnchantmentsAppearance","clanAppearancePart4","visagisteHair22","clanAppearanceOther","visagisteHair23","clanAppearanceOther2","weddingAppearance25","visagisteAppearance25","salonAppearance25","clanAppearanceSubculture","fa26Appearance","weddingAppearance26"];
      
      public static const §_-BEY§:Array = ["avatarAppearance"];
      
      public static const §_-0mZ§:Array = ["islandconfig","pets"];
      
      public static const §_-9Mx§:Array = ["photoSalonPro","photoSalon"];
      
      public static const §_-545§:Array = ["config"];
      
      public static const §_-2CC§:Array = ["appearanceIcons","islandAvatarAnimation","islandAvatarClothes","islandAvatarIcons","landscape","islandconfig","islandUi","uiLang","islandFarmLocation","islandDecor","islandBuildings","islandPlants","islandWeed","islandResources","pets","islandSounds","uiLang","decorUi"];
      
      public static const §_-Cbc§:Array = ["islandAvatarAnimation","islandAvatarClothes","islandAvatarIcons","islandUi","islandconfig","islandDecor","islandBuildings","islandPlants","islandWeed","islandResources","pets"];
      
      public static const §_-3nw§:Array = ["landscape","terrain","islandconfig","islandFarmLocation","islandWeed","islandBuildings","islandBeach"];
      
      public static var §_-2X2§:String = "boyAvatarClothes";
      
      public static var §_-4Hw§:String = "girlAvatarClothes";
      
      public static var §_-563§:String = "avatarAppearance";
      
      public function Config()
      {
         super();
      }
      
      public static function get §_-0WN§() : Boolean
      {
         if(Context.instance.§_-AIA§.§_-3OB§)
         {
            return true;
         }
         var _loc1_:Array = Capabilities.version.split(",");
         _loc1_[0] = String(_loc1_[0]).split(" ")[1];
         if(int(_loc1_[0]) > §_-CZX§)
         {
            return true;
         }
         return int(_loc1_[0]) >= §_-CZX§ && int(_loc1_[1]) >= §_-BmB§;
      }
      
      public static function get profile() : String
      {
         return §_-11k§;
      }
      
      public static function set profile(param1:String) : void
      {
         §_-11k§ = param1;
      }
      
      public static function get collectStats() : Boolean
      {
         return appconfig.getBoolean("collectStats",false);
      }
      
      public static function get statsUrl() : String
      {
         return appconfig.getString("statsUrl");
      }
      
      public static function get socialNetwork() : String
      {
         return appconfig.getString("socialNetwork");
      }
      
      public static function get §_-26H§() : int
      {
         return §_-ApK§;
      }
      
      public static function get §_-8Gx§() : int
      {
         return §_-AoU§;
      }
      
      public static function get allowedIds() : Array
      {
         return appconfig.getString("allowedIds").split(",");
      }
      
      public static function get production() : Boolean
      {
         return appconfig.getBoolean("production");
      }
      
      public static function get locale() : String
      {
         return appconfig.getString("locale");
      }
      
      public static function get resourceFormat() : String
      {
         if(!appconfig.§_-3vm§("resourceFormat"))
         {
            return "swf";
         }
         return appconfig.getString("resourceFormat");
      }
      
      public static function get showCursor() : Boolean
      {
         if(!appconfig.§_-3vm§("showCursor"))
         {
            return true;
         }
         return appconfig.getBoolean("showCursor");
      }
      
      public static function get configPrefix() : String
      {
         return appconfig.getString("configPrefix");
      }
      
      public static function get apiVersion() : int
      {
         return §_-9Kq§;
      }
      
      public static function get loginCallback() : String
      {
         return appconfig.getString("loginCallback");
      }
      
      public static function get corsProxy() : String
      {
         return appconfig.getString("corsProxy");
      }
      
      public static function get supportUrl() : String
      {
         return appconfig.getString("supportUrl");
      }
      
      public static function get communityUrl() : String
      {
         return appconfig.getString("communityUrl");
      }
      
      public static function get gameRulesUrl() : String
      {
         if(disableExternalLinks)
         {
            return null;
         }
         var _loc1_:String = appconfig.getString("gameRulesUrl");
         return _loc1_ != null && _loc1_ != "" ? _loc1_ : null;
      }
      
      public static function get privacyPolicyUrl() : String
      {
         if(disableExternalLinks)
         {
            return null;
         }
         var _loc1_:String = appconfig.getString("privacyPolicyUrl");
         return _loc1_ != null && _loc1_ != "" ? _loc1_ : null;
      }
      
      public static function get promouterBackendUrl() : String
      {
         return appconfig.getString("promouterBackendUrl");
      }
      
      public static function get outsideServer() : String
      {
         return appconfig.getString("outsideServer");
      }
      
      public static function get outsidePort() : int
      {
         return appconfig.getInt("outsidePort");
      }
      
      public static function get clanServer() : String
      {
         return appconfig.getString("clanServer");
      }
      
      public static function get clanPort() : int
      {
         return appconfig.getInt("clanPort");
      }
      
      public static function get houseServer() : String
      {
         return appconfig.getString("houseServer");
      }
      
      public static function get housePort() : int
      {
         return appconfig.getInt("housePort");
      }
      
      public static function get islandServer() : String
      {
         return appconfig.getString("islandServer");
      }
      
      public static function get islandPort() : int
      {
         return appconfig.getInt("islandPort");
      }
      
      public static function get workServer() : String
      {
         return appconfig.getString("workServer");
      }
      
      public static function get workPort() : int
      {
         return appconfig.getInt("workPort");
      }
      
      public static function get §_-8s7§() : Boolean
      {
         return appconfig.getBoolean("avataria.show",false);
      }
      
      public static function get §_-ByE§() : Boolean
      {
         return appconfig.getBoolean("avataria.exchange",false);
      }
      
      public static function get §_-9X§() : Boolean
      {
         return appconfig.getBoolean("island.show",false);
      }
      
      public static function get §_-59E§() : Boolean
      {
         return appconfig.getBoolean("island.exchange",false);
      }
      
      public static function get testMode() : Boolean
      {
         return appconfig.getBoolean("test.mode",false);
      }
      
      public static function get §_-6vU§() : String
      {
         return appconfig.getString("test.groupId");
      }
      
      public static function get offersAllowed() : Boolean
      {
         return appconfig.getBoolean("offersAllowed",false);
      }
      
      public static function get §_-4z0§() : Object
      {
         return §_-002§.§_-7tc§(§_-37U§ == null ? §_-20b§ : §_-37U§);
      }
      
      public static function get musicTracks() : Object
      {
         return §_-002§.§_-4GA§(§_-37U§);
      }
      
      public static function get §_-2Hx§() : Object
      {
         return §_-002§.§_-ATj§(§_-37U§);
      }
      
      public static function get promo() : Object
      {
         return appconfig.§_-2hy§("promo",{});
      }
      
      public static function get preloaderThemes() : Object
      {
         var _loc1_:§_-8fL§ = appconfig.getConfiguration("preloaderThemes");
         if(_loc1_ == null)
         {
            return [];
         }
         return _loc1_.getList("theme");
      }
      
      public static function §_-3vG§() : §_-A2I§
      {
         var _loc1_:§_-8fL§ = appconfig.getConfiguration("preloaderConfig");
         var _loc2_:§_-A2I§ = new §_-A2I§();
         _loc2_.configure(_loc1_);
         return _loc2_;
      }
      
      public static function §_-1Gt§() : String
      {
         return appconfig.getString("islandMobilePreloader.url");
      }
      
      public static function §_-ApJ§(param1:String) : Array
      {
         var _loc3_:§_-8fL§ = null;
         var _loc2_:Array = appconfig.getList("islandMobilePreloaderTextHints");
         if(_loc2_.length == 0)
         {
            return [];
         }
         for each(_loc3_ in _loc2_)
         {
            if(_loc3_ != null)
            {
               if(_loc3_.getString("locale") == param1)
               {
                  return _loc3_.getList("hint");
               }
            }
         }
         return [];
      }
      
      public static function get §_-3mO§() : String
      {
         if(appconfig.getConfiguration("appNotAvailableUrls") == null)
         {
            return null;
         }
         return appconfig.getConfiguration("appNotAvailableUrls").getString("bgUrl");
      }
      
      public static function get appNotAvailableUrls() : Array
      {
         return appconfig.getList("appNotAvailableUrls.message",[]);
      }
      
      public static function get hardVirality() : Boolean
      {
         return appconfig.getBoolean("hardVirality",false);
      }
      
      public static function get collectEmails() : Boolean
      {
         return appconfig.getBoolean("collectEmails",false);
      }
      
      public static function get socialGraph() : Object
      {
         return appconfig.getConfiguration("socialGraph").toObject();
      }
      
      public static function get openGraph() : Boolean
      {
         return appconfig.getBoolean("openGraph",false);
      }
      
      private static function get startUpDialog() : §_-8fL§
      {
         return appconfig.getConfiguration("startUpDialog");
      }
      
      public static function §_-2tb§(param1:String) : int
      {
         if(startUpDialog.getConfiguration(param1) == null)
         {
            return 1;
         }
         return startUpDialog.getConfiguration(param1).getInt("version",1);
      }
      
      public static function showDialog(param1:String) : Boolean
      {
         if(startUpDialog.getConfiguration(param1) == null)
         {
            return false;
         }
         return startUpDialog.getConfiguration(param1).getBoolean("popup",false);
      }
      
      public static function §_-aJ§() : Boolean
      {
         return production;
      }
      
      public static function get §_-3V4§() : Boolean
      {
         return appconfig.getConfiguration("rating") != null && appconfig.getConfiguration("rating").getBoolean("on",false);
      }
      
      public static function get §_-16d§() : Array
      {
         return appconfig.getConfiguration("rating") != null ? appconfig.getConfiguration("rating").getString("allowedIds").split(",") : [];
      }
      
      public static function §_-yO§(param1:String) : Boolean
      {
         return §_-3V4§ || §_-16d§.indexOf(param1) >= 0;
      }
      
      public static function get §_-2WK§() : Boolean
      {
         return appconfig.getConfiguration("activityRating") != null && appconfig.getConfiguration("activityRating").getBoolean("on",false);
      }
      
      public static function get §_-Bjd§() : Boolean
      {
         return appconfig.getConfiguration("mobilePayments") != null && appconfig.getConfiguration("mobilePayments").getBoolean("on",false);
      }
      
      public static function get §_-Y6§() : Array
      {
         return appconfig.getConfiguration("mobilePayments") != null ? appconfig.getConfiguration("mobilePayments").getString("allowedIds").split(",") : [];
      }
      
      public static function §_-0TM§(param1:String) : Boolean
      {
         return §_-Bjd§ || §_-Y6§.indexOf(param1) >= 0;
      }
      
      public static function get §_-Dp§() : §_-8fL§
      {
         return appconfig.getConfiguration("locationRestrictions");
      }
      
      public static function §_-50d§(param1:String) : §_-8fL§
      {
         var _loc3_:§_-8fL§ = null;
         if(§_-Dp§ == null)
         {
            return null;
         }
         var _loc2_:Array = §_-Dp§.getList("item");
         for each(_loc3_ in _loc2_)
         {
            if(_loc3_.getString("id") == param1)
            {
               return _loc3_;
            }
         }
         return null;
      }
      
      public static function §_-6pE§(param1:String, param2:String) : Boolean
      {
         var _loc3_:§_-8fL§ = §_-50d§(param1);
         if(_loc3_ == null)
         {
            return true;
         }
         if(_loc3_.getBoolean("on"))
         {
            return true;
         }
         if(§_-vh§(param1,param2,_loc3_))
         {
            return true;
         }
         return false;
      }
      
      public static function §_-vh§(param1:String, param2:String, param3:§_-8fL§ = null) : Boolean
      {
         if(param3 == null)
         {
            param3 = §_-50d§(param1);
         }
         return param3 != null && param3.getString("allowedIds") != null && param3.getString("allowedIds").split(",").indexOf(param2) >= 0;
      }
      
      public static function §_-1JJ§(param1:String, param2:String, param3:Boolean = false) : Boolean
      {
         if(§_-50d§(param1) == null)
         {
            return param3;
         }
         return §_-50d§(param1).getBoolean(param2,param3);
      }
      
      public static function get §_-CXX§() : Boolean
      {
         return appconfig.getString("serverconfig.protocol") == "binary";
      }
      
      public static function get contentConfigs() : Array
      {
         return appconfig.getList("contentConfigs.contentConfig");
      }
      
      public static function get §_-BR3§() : §_-8fL§
      {
         return appconfig.getConfiguration("social");
      }
      
      public static function §_-7sT§() : §_-8fL§
      {
         return appconfig.getConfiguration("nanigans");
      }
      
      public static function get §_-2Gy§() : §_-8fL§
      {
         return appconfig.getConfiguration("billing");
      }
      
      public static function get §_-yt§() : §_-8fL§
      {
         return appconfig.getConfiguration("modules");
      }
      
      public static function get §_-9PP§() : §_-8fL§
      {
         return appconfig.getConfiguration("socialAuth");
      }
      
      public static function get §_-5Iy§() : Boolean
      {
         return §_-BVj§ != null && §_-BVj§.getBoolean("test",false);
      }
      
      public static function get §_-BVj§() : §_-8fL§
      {
         return appconfig.getConfiguration("bannerNetwork");
      }
      
      public static function get §_-6mg§() : §_-8fL§
      {
         return appconfig.getConfiguration("metrics");
      }
      
      public static function get loadingStatisticUrl() : String
      {
         return appconfig.getString("loadingStatisticUrl");
      }
      
      public static function get §_-CD3§() : String
      {
         return appconfig.getConfiguration("clan").getString("logoUrl");
      }
      
      public static function get socialLinkInstruction() : String
      {
         return appconfig.getString("socialLinkInstruction");
      }
      
      public static function get disableExternalLinks() : Boolean
      {
         return appconfig.getBoolean("disableExternalLinks",false);
      }
      
      public static function get §_-1I3§() : Boolean
      {
         return appconfig.getConfiguration("logstash") != null && appconfig.getConfiguration("logstash").getBoolean("active",false);
      }
      
      public static function get §_-46r§() : String
      {
         if(appconfig.getConfiguration("logstash") != null)
         {
            return appconfig.getConfiguration("logstash").getString("host");
         }
         return "";
      }
      
      public static function get §_-C7Y§() : uint
      {
         if(appconfig.getConfiguration("logstash") != null)
         {
            return appconfig.getConfiguration("logstash").getInt("port");
         }
         return 0;
      }
      
      public static function get disableContextMenu() : Boolean
      {
         return appconfig.getBoolean("disableContextMenu",false);
      }
      
      public static function get version() : String
      {
         return _version;
      }
      
      public static function get validateConfigs() : Boolean
      {
         return §_-0bv§;
      }
      
      public static function get §_-3NZ§() : Boolean
      {
         return §_-5WI§;
      }
      
      public static function set §_-3NZ§(param1:Boolean) : void
      {
         §_-5WI§ = param1;
      }
      
      public static function get accountHost() : String
      {
         return §_-8tG§;
      }
      
      public static function get accountPort() : int
      {
         return §_-B-i§;
      }
      
      public static function get appconfig() : §_-8fL§
      {
         return §_-2lH§;
      }
      
      public static function init(param1:Class) : void
      {
         var xml:XML = null;
         var configurationList:Configuration = null;
         var appconfigData:Class = param1;
         var configLoader:ByteArray = new §_-B-e§() as ByteArray;
         var str:String = configLoader.readUTFBytes(configLoader.length);
         try
         {
            xml = new XML(str);
            configurationList = new Configuration();
            configurationList.loadXML(xml);
         }
         catch(e:Error)
         {
            §_-3YE§.§_-ANW§("Error parsing Application.xml, " + e.message);
            throw e;
         }
         _version = configurationList.getString("version");
         §_-0bv§ = configurationList.getBoolean("validateConfigs");
         §_-8tG§ = configurationList.getString("accountHost");
         §_-B-i§ = configurationList.getInt("accountPort");
         §_-9Kq§ = configurationList.getInt("apiVersion");
         §_-2lH§ = §_-8fL§.§_-6RH§(new appconfigData());
      }
   }
}

