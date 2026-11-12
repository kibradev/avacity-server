package §_-0CA§
{
   public class §_-6Jc§
   {
      public static const RESTRICTED_ITEM:int = 0;
      
      public static const RESTRICTED_COLLECTION:int = 1;
      
      public static const RESTRICTED_SET:int = 2;
      
      public static const RESTRICTED_QUEST:int = 3;
      
      public static const RESTRICTED_QUEST_COLLECTION:int = 4;
      
      public static const ROOM_FURNITURE_DESIGN_SECTION:int = 5;
      
      public static const ROOM_FURNITURE_DESIGN_PARAMS_SECTION:int = 6;
      
      public static const §_-81m§:Array = [{
         "index":RESTRICTED_ITEM,
         "title":"RESTRICTED_ITEM"
      },{
         "index":RESTRICTED_COLLECTION,
         "title":"RESTRICTED_COLLECTION"
      },{
         "index":RESTRICTED_SET,
         "title":"RESTRICTED_SET"
      },{
         "index":RESTRICTED_QUEST,
         "title":"RESTRICTED_QUEST"
      },{
         "index":RESTRICTED_QUEST_COLLECTION,
         "title":"RESTRICTED_QUEST_COLLECTION"
      }];
      
      public static const §_-5O2§:Array = [{
         "index":ROOM_FURNITURE_DESIGN_SECTION,
         "title":"ROOM_FURNITURE_DESIGN_SECTION"
      },{
         "index":ROOM_FURNITURE_DESIGN_PARAMS_SECTION,
         "title":"ROOM_FURNITURE_DESIGN_PARAMS_SECTION"
      }];
      
      public static const §_-9S0§:Array = [{
         "index":§_-BsT§.NEW_CLOTHES,
         "title":"NEW_CLOTHES_ICON"
      },{
         "index":§_-BsT§.COLOR_CLOTHES,
         "title":"NEW_COLOR_CLOTHES_ICON"
      }];
      
      public static const §_-6Kn§:Array = [{
         "index":§_-BsT§.SALE_CLOTHES_ITEMS,
         "title":"SALE_CLOTHES_ICON"
      },{
         "index":§_-BsT§.COLOR_CLOTHES,
         "title":"SALE_COLOR_CLOTHES_ICON"
      }];
      
      public static const §_-2x1§:Array = [{
         "index":§_-BsT§.SALE_CLOTHES_ITEMS,
         "title":"SALE_CLOTHES_ICON"
      },{
         "index":§_-BsT§.COLOR_CLOTHES,
         "title":"SALE_COLOR_CLOTHES_ICON"
      },{
         "index":§_-BsT§.ROOM_FURNITURE_DESIGN_SALE,
         "title":"ROOM_FURNITURE_DESIGN_SALE"
      },{
         "index":§_-BsT§.SALE_FURNITURE,
         "title":"SALE_FURNITURE"
      },{
         "index":§_-BsT§.SALE_APPEARANCE,
         "title":"SALE_APPEARANCE_ICON"
      }];
      
      public static const §_-3nF§:String = "rating";
      
      public static const §_-A6b§:String = "buyCount";
      
      public function §_-6Jc§()
      {
         super();
      }
      
      public static function §_-6lv§(param1:int) : String
      {
         var _loc2_:Object = null;
         if(param1 > §_-81m§.length - 1)
         {
            return null;
         }
         for each(_loc2_ in §_-81m§)
         {
            if(_loc2_["index"] == param1)
            {
               return _loc2_["title"];
            }
         }
         return null;
      }
      
      public static function §_-ABk§(param1:String) : Object
      {
         var _loc4_:String = null;
         var _loc5_:Array = null;
         var _loc2_:Object = {};
         var _loc3_:Array = param1.split(";");
         for each(_loc4_ in _loc3_)
         {
            _loc5_ = _loc4_.split(":");
            if(_loc5_.length == 2)
            {
               _loc2_[_loc5_[0]] = _loc5_[1];
            }
         }
         return _loc2_;
      }
      
      public static function §_-44p§() : String
      {
         var _loc1_:* = "Params with values splitted by ;\n";
         _loc1_ += "Example:\n";
         _loc1_ += "rating:9999;buyCount:1\n";
         return _loc1_ + ("Available params: " + §_-3nF§ + ", " + §_-A6b§ + "");
      }
      
      public static function §_-6qD§(param1:Object, param2:String) : Object
      {
         return !!param1.hasOwnProperty(param2) ? param1[param2] : null;
      }
   }
}

