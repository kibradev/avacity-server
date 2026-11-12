package §_-6IV§
{
   import §_-0Uz§.§_-6v4§;
   import §_-1ks§.§_-VC§;
   import §_-2UV§.§_-iQ§;
   import §_-2qd§.§_-9ai§;
   import §_-3iX§.§_-1Sg§;
   import §_-41v§.§_-Bn1§;
   import §_-4B9§.Fortune2WorkScenario;
   import §_-4B9§.§_-5Rq§;
   import §_-5JJ§.§_-15C§;
   import §_-5OE§.§_-1v2§;
   import §_-6-L§.§_-6aF§;
   import §_-99s§.§_-7Tj§;
   import §_-GM§.Context;
   
   public class §_-6mj§ extends §_-6v4§
   {
      public static const §_-5xx§:String = "fortune1";
      
      public static const WORK_FORTUNE_2_MODULE:String = "fortune2";
      
      public static const WORK_FORTUNE_3_MODULE:String = "fortune3";
      
      public static const §_-BX-§:String = "wrkm.";
      
      public static const §_-5A7§:String = §_-BX-§ + "nws";
      
      public static const §_-3FX§:String = "sid";
      
      public static const §_-04i§:String = "garden";
      
      public static const §_-9Ia§:String = "garbage";
      
      public static const §_-54U§:String = "sculpt";
      
      public static const §_-68s§:String = "fortune";
      
      public static const WORK_FORTUNE_2:String = "fortune2";
      
      public static const WORK_FORTUNE_3:String = "fortune3";
      
      public static const §_-9HX§:String = "schoolAvataria";
      
      public static const §_-0ff§:String = "school";
      
      public static const §_-2xF§:String = "npcHouse";
      
      public static const §_-7G5§:String = "restaurant";
      
      public static const §_-3SL§:Array = [§_-04i§,§_-9Ia§];
      
      private var §_-3gZ§:Object = {};
      
      public function §_-6mj§()
      {
         super();
         §_-1-t§(§_-5A7§,this.§_-4Uu§);
      }
      
      public function §_-Bk0§(param1:XML) : void
      {
         var _loc2_:XML = null;
         var _loc3_:§_-iQ§ = null;
         if(param1 == null)
         {
            return;
         }
         for each(_loc2_ in param1.elements("work"))
         {
            _loc3_ = new §_-iQ§();
            _loc3_.fromXML(_loc2_);
            this.§_-3gZ§[_loc3_.id] = _loc3_;
         }
      }
      
      public function §_-4jk§(param1:String) : §_-iQ§
      {
         return !!this.§_-3gZ§.hasOwnProperty(param1) ? this.§_-3gZ§[param1] : null;
      }
      
      public function §_-B4s§(param1:String) : §_-VC§
      {
         switch(param1)
         {
            case §_-68s§:
            case WORK_FORTUNE_2:
            case WORK_FORTUNE_3:
               return new §_-1Sg§();
            default:
               return new §_-15C§();
         }
      }
      
      public function validateShopItem(param1:§_-7Tj§) : Boolean
      {
         var _loc2_:§_-iQ§ = null;
         var _loc3_:§_-1v2§ = null;
         if(param1.findParentCategory(§_-Bn1§.§_-6Yc§) != null)
         {
            for each(_loc2_ in this.§_-3gZ§)
            {
               if(!(_loc2_.id != §_-68s§ && _loc2_.id != WORK_FORTUNE_2 || !_loc2_.isActive()))
               {
                  for each(_loc3_ in §_-6aF§.toArray(_loc2_.scenarios))
                  {
                     if(_loc3_ is §_-5Rq§ && (_loc3_ as §_-5Rq§).chipTypeId == param1.typeId)
                     {
                        return true;
                     }
                     if(_loc3_ is Fortune2WorkScenario && (_loc3_ as Fortune2WorkScenario).§_-9xL§(Context.cityPlayer.level) && (_loc3_ as Fortune2WorkScenario).chipTypeId == param1.typeId)
                     {
                        return true;
                     }
                  }
               }
            }
            return false;
         }
         return true;
      }
      
      private function §_-4Uu§(param1:§_-9ai§) : void
      {
         var _loc2_:String = param1.data.getString(§_-3FX§);
         if(§_-3SL§.indexOf(_loc2_) < 0)
         {
            return;
         }
         Context.§_-BlB§.§_-4bN§(_loc2_);
      }
   }
}

