package §_-0CA§
{
   public class §_-BsT§
   {
      public static const SALE:int = 0;
      
      public static const SALE_ON_VIP:int = 1;
      
      public static const SALE_ON_GOLD:int = 2;
      
      public static const NEW_FURNITURE:int = 3;
      
      public static const NEW_BUNDLE:int = 4;
      
      public static const NEW_CLOTHES:int = 5;
      
      public static const NEW_CLOTHES_SUIT:int = 6;
      
      public static const NEW_HAIRSTYLE:int = 7;
      
      public static const RESTRICTIONS:int = 8;
      
      public static const MODULES:int = 9;
      
      public static const PHOTOSALON_NEW_THEME:int = 10;
      
      public static const NEW_SUIT_BUNDLE:int = 11;
      
      public static const ROOM_FURNITURE_DESIGN_SALE:int = 12;
      
      public static const SALE_CLOTHES_SUIT:int = 13;
      
      public static const SALE_CLOTHES_ITEMS:int = 14;
      
      public static const NEW_APPEARANCE:int = 15;
      
      public static const SALE_OFFERS:int = 16;
      
      public static const LOOT_BUNDLE:int = 17;
      
      public static const SALE_ACTIVITY_X2:int = 18;
      
      public static const BLACK_FRIDAY:int = 19;
      
      public static const SALE_ON_RUBY:int = 20;
      
      public static const SALE_ON_PETS:int = 21;
      
      public static const CAMPAIGN_OFFER:int = 22;
      
      public static const COLOR_CLOTHES:int = 23;
      
      public static const SALE_APPEARANCE:int = 24;
      
      public static const SALE_FURNITURE:int = 25;
      
      public static const SELECTION:int = 26;
      
      public static const §_-1FS§:Array = [{
         "index":SALE,
         "title":"SALE"
      },{
         "index":SALE_ON_VIP,
         "title":"SALE_ON_VIP"
      },{
         "index":SALE_ON_GOLD,
         "title":"SALE_ON_GOLD"
      },{
         "index":NEW_FURNITURE,
         "title":"NEW_FURNITURE"
      },{
         "index":NEW_BUNDLE,
         "title":"NEW_BUNDLE"
      },{
         "index":NEW_CLOTHES,
         "title":"NEW_CLOTHES"
      },{
         "index":NEW_CLOTHES_SUIT,
         "title":"NEW_CLOTHES_SUIT"
      },{
         "index":NEW_HAIRSTYLE,
         "title":"NEW_HAIRSTYLE"
      },{
         "index":RESTRICTIONS,
         "title":"RESTRICTIONS"
      },{
         "index":MODULES,
         "title":"MODULES"
      },{
         "index":PHOTOSALON_NEW_THEME,
         "title":"PHOTOSALON_NEW_THEME"
      },{
         "index":NEW_SUIT_BUNDLE,
         "title":"NEW_SUIT_BUNDLE"
      },{
         "index":ROOM_FURNITURE_DESIGN_SALE,
         "title":"ROOM_FURNITURE_DESIGN_SALE"
      },{
         "index":SALE_CLOTHES_SUIT,
         "title":"SALE_CLOTHES_SUIT"
      },{
         "index":SALE_CLOTHES_ITEMS,
         "title":"SALE_CLOTHES_ITEMS"
      },{
         "index":NEW_APPEARANCE,
         "title":"NEW_APPEARANCE"
      },{
         "index":SALE_OFFERS,
         "title":"SALE_OFFERS"
      },{
         "index":LOOT_BUNDLE,
         "title":"LOOT_BUNDLE"
      },{
         "index":SALE_ACTIVITY_X2,
         "title":"SALE_ACTIVITY_X2"
      },{
         "index":BLACK_FRIDAY,
         "title":"BLACK_FRIDAY"
      },{
         "index":SALE_ON_RUBY,
         "title":"SALE_ON_RUBY"
      },{
         "index":SALE_ON_PETS,
         "title":"SALE_ON_PETS"
      },{
         "index":CAMPAIGN_OFFER,
         "title":"CAMPAIGN_OFFER"
      },{
         "index":COLOR_CLOTHES,
         "title":"COLOR_CLOTHES"
      },{
         "index":SALE_APPEARANCE,
         "title":"SALE_APPEARANCE"
      },{
         "index":SALE_FURNITURE,
         "title":"SALE_FURNITURE"
      },{
         "index":SELECTION,
         "title":"SELECTION"
      }];
      
      public static const §_-2wX§:int = 0;
      
      public static const §_-2pk§:int = 1;
      
      public static const §_-5dz§:int = 2;
      
      public static const §_-4AZ§:int = 3;
      
      public static const §_-8sq§:int = 4;
      
      public static const §_-1lF§:String = "Modules";
      
      public static const §_-9SX§:String = "Restrictions";
      
      public static const §_-2SO§:String = "Sales";
      
      public static const §_-CHm§:String = "New Content";
      
      public static const §_-BmZ§:String = "Shop Selections";
      
      public static const §_-0H8§:Array = [{
         "index":§_-2wX§,
         "title":§_-1lF§,
         "types":[MODULES]
      },{
         "index":§_-2pk§,
         "title":§_-9SX§,
         "types":[RESTRICTIONS]
      },{
         "index":§_-5dz§,
         "title":§_-2SO§,
         "types":[SALE,SALE_FURNITURE,SALE_ON_VIP,SALE_ON_GOLD,ROOM_FURNITURE_DESIGN_SALE,SALE_CLOTHES_SUIT,SALE_CLOTHES_ITEMS,SALE_OFFERS,LOOT_BUNDLE,SALE_ACTIVITY_X2,BLACK_FRIDAY,SALE_ON_RUBY,CAMPAIGN_OFFER]
      },{
         "index":§_-4AZ§,
         "title":§_-CHm§,
         "types":[NEW_FURNITURE,NEW_BUNDLE,NEW_CLOTHES,NEW_CLOTHES_SUIT,NEW_HAIRSTYLE,PHOTOSALON_NEW_THEME,NEW_SUIT_BUNDLE,NEW_APPEARANCE]
      },{
         "index":§_-8sq§,
         "title":§_-BmZ§,
         "types":[SELECTION]
      }];
      
      private static const §_-3za§:Array = [SALE,SALE_FURNITURE,SALE_CLOTHES_SUIT,SALE_CLOTHES_ITEMS,SALE_ON_PETS,SALE_APPEARANCE];
      
      public function §_-BsT§()
      {
         super();
      }
      
      public static function §_-8DF§(param1:int) : Boolean
      {
         return §_-3za§.indexOf(param1) != -1;
      }
      
      public static function §_-0uv§(param1:int) : Array
      {
         switch(param1)
         {
            case NEW_HAIRSTYLE:
               return §_-CU6§.§_-Bp5§;
            case NEW_APPEARANCE:
               return §_-01h§.§_-Bp5§;
            case ROOM_FURNITURE_DESIGN_SALE:
               return §_-6Jc§.§_-5O2§;
            case RESTRICTIONS:
               return §_-6Jc§.§_-81m§;
            default:
               return null;
         }
      }
      
      public static function §_-3Sq§(param1:int) : Object
      {
         var _loc2_:Object = null;
         for each(_loc2_ in §_-0H8§)
         {
            if(_loc2_["index"] == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public static function §_-0Wi§(param1:String) : int
      {
         var _loc2_:* = undefined;
         for(_loc2_ in §_-1FS§)
         {
            if(§_-1FS§[_loc2_]["title"] == param1)
            {
               return §_-1FS§[_loc2_]["index"];
            }
         }
         return -1;
      }
   }
}

