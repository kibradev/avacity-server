package §_-4Q1§
{
   import §_-2as§.§_-3y6§;
   import §_-3hC§.§_-3-x§;
   import §_-5VL§.§_-43§;
   import §_-7ts§.§_-9JD§;
   import §_-9VF§.§_-3yI§;
   import §_-AKx§.§_-2-c§;
   import §_-AKx§.§_-4OH§;
   import §_-BBs§.§_-1pM§;
   import §_-GM§.Context;
   import §_-MZ§.§_-12j§;
   import §_-MZ§.§_-7zb§;
   import flash.text.TextField;
   import penzville.Application;

   public class §_-5Ia§ implements §_-3y6§
   {

      public static const §_-2LA§:String = "outsideLocations";

      public static const §_-31M§:String = "yard";

      public static const §_-2mD§:String = "cafe";

      public static const §_-4QN§:String = "club";

      public static const §_-27W§:String = "street";

      public static const §_-1ut§:String = "park";

      public static const §_-3Dy§:String = "vip";

      public static const §_-7kN§:String = "salon";

      public static const §_-355§:String = "photoSalon";

      public static const §_-7TO§:String = "publicBeach";

      public static const §_-8vl§:String = "canyon";

      public static const §_-9gU§:String = "meerkat";

      public static const §_-9mR§:String = "ballroom";

      public static const §_-6qb§:String = "couturier";

      public static const §_-1ET§:String = "weddingBeach";

      public static const §_-iB§:String = "iceRink";

      public static const §_-197§:String = "skiResort";

      public static const §_-C12§:String = "podium";

      public static const §_-2Ci§:String = "prison";

      public static const §_-646§:String = "streetRetro";

      public static const §_-0Z8§:String = "clubRetro";

      public static const §_-2c5§:String = "yardRetro";

      public static const §_-7Wg§:String = "parkRetro";

      public static const §_-1X3§:String = "cafeRetro";

      public static const §_-6dy§:String = "publicBeachRetro";

      public static const §_-7cn§:String = "vipRetro";

      public static const §_-AaH§:String = "ballroomRetro";

      public static const §_-8aJ§:String = "s1";

      public static const §_-368§:String = "v1";

      public static const §_-8Hi§:String = "v1e";

      public static const §_-9XO§:Array = [§_-646§,§_-0Z8§,§_-2c5§,§_-7Wg§,§_-1X3§,§_-6dy§,§_-7cn§,§_-AaH§];

      private var §_-9L2§:Object = {};

      private var §_-9O-§:Object = {};

      private var §_-0z5§:§_-1pM§ = null;

      private static var §_-CHTDBG_TF§:TextField = null;

      private static function §_-chtdbgLog§(param1:String) : void
      {
         try
         {
            if(§_-CHTDBG_TF§ == null)
            {
               §_-CHTDBG_TF§ = new TextField();
               §_-CHTDBG_TF§.width = 620;
               §_-CHTDBG_TF§.height = 400;
               §_-CHTDBG_TF§.x = 655;
               §_-CHTDBG_TF§.y = 5;
               §_-CHTDBG_TF§.multiline = true;
               §_-CHTDBG_TF§.wordWrap = true;
               §_-CHTDBG_TF§.background = true;
               §_-CHTDBG_TF§.backgroundColor = 0;
               §_-CHTDBG_TF§.textColor = 16776960;
               §_-CHTDBG_TF§.mouseEnabled = false;
               §_-CHTDBG_TF§.selectable = false;
               Application.instance.stage.addChild(§_-CHTDBG_TF§);
            }
            Application.instance.stage.setChildIndex(§_-CHTDBG_TF§,Application.instance.stage.numChildren - 1);
            §_-CHTDBG_TF§.appendText(param1 + "\n");
            if(§_-CHTDBG_TF§.numLines > 26)
            {
               §_-CHTDBG_TF§.text = §_-CHTDBG_TF§.text.split("\n").slice(-26).join("\n");
            }
         }
         catch(e:Error)
         {
         }
      }

      public function §_-5Ia§()
      {
         super();
      }

      public static function §_-57G§(param1:String) : Boolean
      {
         return param1 == §_-9mR§ || param1 == §_-AaH§;
      }

      public function §_-7vY§(param1:XML) : void
      {
         var _loc2_:XML = null;
         var _loc3_:§_-7zb§ = null;
         for each(_loc2_ in param1.elements("location"))
         {
            _loc3_ = new §_-7zb§();
            _loc3_.fromXML(_loc2_);
            this.§_-9L2§[_loc3_.id] = _loc3_;
         }
      }

      public function §_-BvY§(param1:XML) : void
      {
         var _loc2_:XML = null;
         var _loc3_:§_-9JD§ = null;
         if(param1 == null)
         {
            return;
         }
         for each(_loc2_ in param1.elements("game"))
         {
            _loc3_ = new §_-9JD§();
            _loc3_.fromXML(_loc2_);
            this.§_-9O-§[_loc3_.id] = _loc3_;
         }
      }

      public function §_-7mN§(param1:XML) : void
      {
         this.§_-0z5§ = new §_-1pM§();
         this.§_-0z5§.init(param1);
      }

      public function §_-4Bq§(param1:String) : §_-7zb§
      {
         var _loc2_:§_-7zb§ = this.§_-9L2§.hasOwnProperty(param1) ? this.§_-9L2§[param1] : null;
         §_-5Ia§.§_-chtdbgLog§("LOC lookup(" + param1 + ") -> " + (_loc2_ == null ? "NULL (catalog size=" + this.§_-catalogSize§() + ")" : "FOUND"));
         return _loc2_;
      }

      private function §_-catalogSize§() : int
      {
         var _loc1_:int = 0;
         var _loc2_:String = null;
         for(_loc2_ in this.§_-9L2§)
         {
            _loc1_++;
         }
         return _loc1_;
      }

      public function get §_-8Ys§() : Object
      {
         return this.§_-9L2§;
      }

      public function §_-AJj§(param1:§_-7zb§, param2:§_-43§ = null) : void
      {
         this.§_-9L2§[param1.id] = param1;
         this.§_-2dS§(param2);
      }

      public function §_-2dS§(param1:§_-43§ = null) : void
      {
         if(param1 == null || !this.§_-9L2§.hasOwnProperty(param1.id))
         {
            return;
         }
         this.§_-0z5§.§_-AJj§(param1);
      }

      public function get §_-8vs§() : Object
      {
         return this.§_-9O-§;
      }

      public function get §_-AYR§() : §_-1pM§
      {
         return this.§_-0z5§;
      }

      public function §_-Bo8§() : Boolean
      {
         return Context.cityPlayer != null && (Context.cityPlayer.§_-3k5§ || Context.player.userInfo.role != §_-3yI§.§_-8UU§);
      }

      public function §_-0Y2§(param1:int, param2:Function = null) : void
      {
         var level:int = param1;
         var callback:Function = param2;
         §_-4OH§.§_-B5P§(Context.§_-5o8§.message("locationLevelTitle"),Context.§_-5o8§.message("locationLevelWarning",{"level":level}),function(param1:§_-2-c§):void
         {
            if(callback != null)
            {
               callback();
            }
         });
      }

      public function §_-9XJ§(param1:int) : Boolean
      {
         return Context.cityPlayer != null && (Context.cityPlayer.cityInfo.level >= param1 || Context.player.userInfo.role != §_-3yI§.§_-8UU§);
      }

      public function §_-uY§(param1:String) : Boolean
      {
         return Context.cityPlayer.isTutorial && param1 == §_-4QN§;
      }

      public function §_-Cbe§(param1:String, param2:Array) : void
      {
         var _loc3_:§_-7zb§ = null;
         var _loc4_:int = 0;
         §_-5Ia§.§_-chtdbgLog§("LOC §_-Cbe§ CALLED key=" + param1 + " arrayLen=" + (param2 == null ? "NULL ARRAY" : String(param2.length)));
         this.§_-9L2§ = {};
         try
         {
            if(param2 != null)
            {
               for each(_loc3_ in param2)
               {
                  §_-5Ia§.§_-chtdbgLog§("LOC item[" + _loc4_ + "] id=" + (_loc3_ == null ? "NULL ITEM" : _loc3_.id));
                  this.§_-9L2§[_loc3_.id] = _loc3_;
                  _loc4_++;
               }
            }
            §_-5Ia§.§_-chtdbgLog§("LOC §_-Cbe§ DONE, catalog size=" + this.§_-catalogSize§());
         }
         catch(e:Error)
         {
            §_-5Ia§.§_-chtdbgLog§("LOC §_-Cbe§ CRASH at item " + _loc4_ + ": " + e.message + "\n" + e.getStackTrace());
         }
      }

      public function replaceMap(param1:String, param2:String, param3:String) : void
      {
         var _loc4_:§_-7zb§ = this.§_-9L2§[param1];
         if(_loc4_ == null)
         {
            return;
         }
         var _loc5_:§_-12j§ = _loc4_.getRoom(param2);
         if(_loc5_ == null)
         {
            return;
         }
         _loc5_.mapName = param3;
      }

      public function §_-0s0§(param1:String) : Class
      {
         §_-5Ia§.§_-chtdbgLog§("LOC §_-0s0§ asked for key=" + param1);
         if(param1 == §_-2LA§)
         {
            return §_-7zb§;
         }
         return null;
      }

      public function get §_-6HE§() : String
      {
         var _loc1_:§_-3-x§ = Context.§_-3hG§.currentScreen as §_-3-x§;
         if(_loc1_ == null)
         {
            return "";
         }
         var _loc2_:§_-4v6§ = _loc1_.location as §_-4v6§;
         if(_loc2_ == null || _loc2_.§_-jY§ == null)
         {
            return "";
         }
         var _loc3_:String = _loc2_.locationId;
         if(_loc3_ == §_-4QN§ && _loc1_.clientRoomId == §_-368§)
         {
            _loc3_ = §_-3Dy§;
         }
         return _loc3_;
      }
   }
}
