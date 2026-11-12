package §_-18o§
{
   import §_-0pH§.§_-3Jp§;
   import §_-0uA§.§_-3YE§;
   import §_-1T2§.§_-BWW§;
   import §_-2Y7§.ClanMainDialog;
   import §_-3VF§.§_-0nG§;
   import §_-3VF§.§_-6G§;
   import §_-45i§.§_-4We§;
   import §_-4Q1§.§_-5Ia§;
   import §_-5Po§.§_-Ey§;
   import §_-5Z-§.§_-82F§;
   import §_-5Z-§.§_-Ahc§;
   import §_-5Z-§.§_-C2a§;
   import §_-6Dp§.§_-0f3§;
   import §_-6Dy§.§_-9J9§;
   import §_-6IV§.§_-6mj§;
   import §_-7u5§.§_-0vC§;
   import §_-8Hp§.§_-5KD§;
   import §_-95S§.§_-9E8§;
   import §_-9Fl§.§_-9H0§;
   import §_-9xx§.§_-6Io§;
   import §_-A2M§.§_-4Ba§;
   import §_-AFi§.§_-1ra§;
   import §_-AKx§.§_-4OH§;
   import §_-AaA§.§_-Bg7§;
   import §_-Av5§.§_-Qd§;
   import §_-BJ1§.§_-0r6§;
   import §_-BxN§.§_-8RV§;
   import §_-ByP§.§_-0CV§;
   import §_-ByP§.§_-A7b§;
   import §_-CBS§.§_-3Qo§;
   import §_-GM§.Context;
   import §_-MZ§.§_-12j§;
   import §_-MZ§.§_-7zb§;
   import §_-d5§.§_-2nW§;
   import §_-d5§.§_-6vy§;
   
   public class §_-9qP§
   {
      public static const §_-2tV§:String = "location";
      
      public static const §_-6io§:String = "work";
      
      public static const §_-BdQ§:String = "dialog";
      
      public static const §_-6QK§:String = "module";
      
      public static const §_-3cc§:String = "game";
      
      public static const §_-5AC§:String = "locations";
      
      public static const §_-2AJ§:String = "roomList";
      
      public static const §_-8bR§:String = "publicLocations";
      
      public static const §_-95C§:String = "workLocations";
      
      public static const §_-1wN§:String = "event";
      
      public static const §_-5dB§:String = "appearance";
      
      public static const §_-8JG§:String = "wardrobe";
      
      public static const §_-Bjq§:String = "inventory";
      
      public static const §_-8WI§:String = "achievements";
      
      public static const §_-5Lj§:String = "inventoryFurniture";
      
      public static const §_-ArA§:String = "craft";
      
      public static const §_-4PU§:String = "vip";
      
      public static const §_-1S4§:String = "quests";
      
      public static const §_-73Z§:String = "clanLeaguePanel";
      
      public static const §_-5dv§:String = "buyGold";
      
      public static const §_-6-G§:String = "profileTransfer";
      
      public static const §_-BRv§:String = ":";
      
      private static const §_-44D§:String = "disabledGames";
      
      public function §_-9qP§()
      {
         super();
      }
      
      public static function §_-9uJ§(param1:String, param2:Object = null) : void
      {
         var _loc3_:Array = param1.split(":");
         switch(_loc3_[0])
         {
            case §_-2tV§:
               _loc3_.shift();
               §_-8qx§(_loc3_);
               break;
            case §_-6io§:
               §_-3VY§(_loc3_);
               break;
            case §_-BdQ§:
               showDialog(_loc3_,param2);
               break;
            case §_-3cc§:
               if(_loc3_.length < 2)
               {
                  return;
               }
               §_-63I§(_loc3_[1]);
               break;
            case §_-6QK§:
               §_-7mz§(_loc3_);
               break;
            default:
               §_-3YE§.§_-7aK§("Error processing unknown action \"" + param1 + "\"");
         }
      }
      
      public static function §_-63I§(param1:String) : void
      {
         switch(param1)
         {
            case §_-128§.§_-69m§:
               Context.§_-CLP§.gotoWork(§_-6mj§.§_-68s§);
               return;
            case §_-128§.FORTUNE_2:
               Context.§_-CLP§.gotoWork(§_-6mj§.WORK_FORTUNE_2);
               return;
            case §_-128§.FORTUNE_3:
               Context.§_-CLP§.gotoWork(§_-6mj§.WORK_FORTUNE_3);
               return;
            default:
               if(§_-All§(param1))
               {
                  §_-4OH§.§_-B5P§(Context.§_-5o8§.message("moderatorMessage"),Context.§_-5o8§.message("actionIsUnavailable"));
                  return;
               }
               if(!§_-4z2§(param1))
               {
                  Context.§_-0vt§.§_-1Js§();
                  return;
               }
               if(§_-0nG§.instance.gameHelper.§_-2VC§(param1))
               {
                  return;
               }
               if(!§_-AaN§(param1))
               {
                  throw new Error("Unknown game " + param1);
               }
               return;
         }
      }
      
      public static function gotoHome() : §_-4Ba§
      {
         return Context.§_-CLP§.visitCityHouse(Context.player.id);
      }
      
      public static function §_-1XF§(... rest) : String
      {
         var _loc2_:String = "";
         var _loc3_:int = 0;
         while(_loc3_ < rest.length)
         {
            _loc2_ += rest[_loc3_];
            if(_loc3_ < rest.length - 1)
            {
               _loc2_ += §_-BRv§;
            }
            _loc3_++;
         }
         return _loc2_;
      }
      
      private static function §_-AwX§(param1:String, param2:String, param3:String = null, param4:String = null) : §_-4Ba§
      {
         var _loc5_:§_-7zb§ = Context.§_-BFW§.§_-4Bq§(param1);
         if(§_-0nG§.instance.§_-2AP§.§_-BUW§(param1,param2,param3))
         {
            return §_-0nG§.instance.§_-2AP§.§_-1WH§(param1,param2,param3);
         }
         if(_loc5_ == null)
         {
            return §_-4Ba§.reject();
         }
         var _loc6_:§_-12j§ = _loc5_.getRoom(param2);
         if(_loc6_ == null)
         {
            return §_-4Ba§.reject();
         }
         if(param1 == §_-5Ia§.§_-8vl§)
         {
            return Context.§_-9wO§.§_-Bpv§(param2,0,[],param3);
         }
         return Context.§_-CLP§.§_-4gK§(param1,param2,param4);
      }
      
      private static function §_-AaN§(param1:String) : Boolean
      {
         var _loc5_:§_-4Ba§ = null;
         var _loc6_:Array = null;
         var _loc2_:§_-C2a§ = Context.§_-5Q-§;
         var _loc3_:§_-6vy§ = _loc2_.§_-Ae§(param1);
         if(_loc3_ == null)
         {
            return false;
         }
         var _loc4_:§_-82F§ = _loc2_.getGame(param1);
         if(_loc4_ == null)
         {
            return false;
         }
         if(_loc3_.location == null)
         {
            _loc5_ = §_-3Zj§ == null ? gotoHome() : §_-4Ba§.resolve();
         }
         else
         {
            _loc6_ = _loc3_.location.split(":");
            _loc5_ = §_-4Ba§.sequence([_loc4_.beforeMoveToLocation,[_loc6_],§_-0lY§]);
         }
         §_-4Ba§.sequence([_loc5_,_loc4_.checkStart,_loc4_.loadResources,_loc4_.showStartDialog]);
         return true;
      }
      
      private static function §_-4z2§(param1:String) : Boolean
      {
         if(param1 == §_-2nW§.§_-7jS§)
         {
            return Context.§_-0vt§.§_-7IX§(§_-0r6§.PLAY_HOCKEY);
         }
         if(param1 == §_-2nW§.SNOW_SLOPE)
         {
            return Context.§_-0vt§.§_-7IX§(§_-0r6§.SNOW_SLOPE);
         }
         if(param1 == §_-2nW§.AVA_DANCERS)
         {
            return Context.§_-0vt§.§_-7IX§(§_-0r6§.AVA_DANCERS);
         }
         return true;
      }
      
      private static function §_-All§(param1:String) : Boolean
      {
         var _loc2_:§_-A7b§ = §_-5KD§.instance.getModuleItem(§_-44D§);
         if(_loc2_ == null)
         {
            return false;
         }
         var _loc3_:§_-0CV§ = §_-5KD§.instance.§_-0S-§(_loc2_.campaignId);
         if(_loc3_ == null)
         {
            return false;
         }
         return _loc3_.getItem(param1) != null;
      }
      
      private static function §_-8qx§(param1:Array) : §_-4Ba§
      {
         var _loc3_:* = null;
         var _loc2_:§_-3Qo§ = §_-CIn§(param1);
         if(_loc2_ == null)
         {
            _loc3_ = "Error: moveToLocation - cant execute following actions: \"" + param1.join(", ") + "\"";
            §_-3YE§.error(_loc3_);
            return §_-4Ba§.reject(_loc3_);
         }
         §_-Bg7§.instance.hideAll();
         return §_-AwX§(_loc2_.locationId,_loc2_.roomId,_loc2_.layerId,_loc2_.§_-4Py§);
      }
      
      private static function §_-0lY§(param1:Array) : §_-4Ba§
      {
         var actions:Array = param1;
         var locationData:§_-3Qo§ = §_-CIn§(actions);
         if(locationData == null)
         {
            §_-3YE§.error("Error: moveToLocationGameLocation - cant execute following actions: \"" + actions.join(", ") + "\"");
            return §_-4Ba§.reject();
         }
         if(§_-11r§(locationData))
         {
            return §_-4Ba§.resolve();
         }
         §_-Bg7§.instance.hideAll();
         return §_-AwX§(locationData.locationId,locationData.roomId,locationData.layerId,locationData.§_-4Py§).error(function(param1:Boolean = true):void
         {
            if(param1)
            {
               throw new Error("Something went wrong when we tried to move to the " + actions);
            }
         });
      }
      
      private static function §_-11r§(param1:§_-3Qo§) : Boolean
      {
         var _loc2_:§_-Qd§ = Context.player.locationInfo;
         if(_loc2_ == null)
         {
            return false;
         }
         return _loc2_.zone == param1.locationId && _loc2_.layerId == param1.layerId;
      }
      
      private static function §_-CIn§(param1:Array) : §_-3Qo§
      {
         if(param1.length == 0)
         {
            return null;
         }
         var _loc2_:String = param1[0];
         var _loc3_:§_-7zb§ = Context.§_-BFW§.§_-4Bq§(_loc2_);
         if(_loc3_ == null)
         {
            return null;
         }
         var _loc4_:String = param1.length > 1 ? param1[1] : _loc3_.§_-ML§.roomId;
         var _loc5_:String = param1.length > 2 ? param1[2] : null;
         var _loc6_:String = null;
         var _loc7_:§_-12j§ = _loc3_.getRoom(_loc4_);
         if(_loc7_ != null && _loc7_.§_-22F§)
         {
            _loc6_ = Context.player.id;
         }
         return new §_-3Qo§(_loc3_,_loc2_,_loc4_,_loc5_,_loc6_);
      }
      
      private static function §_-3VY§(param1:Array) : void
      {
         if(param1.length <= 1)
         {
            return;
         }
         §_-Bg7§.instance.hideAll();
         var _loc2_:String = param1[1];
         if(_loc2_ == §_-6mj§.§_-68s§)
         {
            §_-Ey§.§_-778§();
         }
         else
         {
            Context.§_-CLP§.gotoWork(_loc2_);
         }
      }
      
      private static function showDialog(param1:Array, param2:Object) : void
      {
         var _loc5_:§_-3Jp§ = null;
         var _loc6_:int = 0;
         if(param1.length <= 1)
         {
            return;
         }
         §_-Bg7§.instance.hideAll();
         var _loc3_:String = param1[1];
         var _loc4_:String = param1.length > 1 ? param1[2] : null;
         if(§_-9E8§.§_-08G§(_loc3_,_loc4_))
         {
            return;
         }
         switch(_loc3_)
         {
            case §_-5AC§:
               new §_-9J9§(int(_loc4_)).showModal();
               break;
            case §_-2AJ§:
               new §_-9H0§(Context.cityPlayer).showModal();
               break;
            case §_-1wN§:
               new §_-9J9§(§_-9J9§.§_-1HF§).showModal();
               break;
            case §_-8bR§:
               new §_-9J9§(§_-9J9§.§_-BoC§).showModal();
               break;
            case §_-95C§:
               new §_-9J9§(§_-9J9§.§_-741§).showModal();
               break;
            case §_-3cc§:
               new §_-9J9§(§_-9J9§.§_-3lV§).showModal();
               break;
            case §_-5dB§:
               new §_-6Io§(Context.cityPlayer.cloneFast()).showModal();
               break;
            case §_-Bjq§:
               new §_-0f3§(§_-0f3§.§_-4ih§).showModal();
               break;
            case §_-8WI§:
               new §_-0f3§(§_-0f3§.§_-Bnc§).showModal();
               break;
            case §_-5Lj§:
               new §_-0f3§(§_-0f3§.§_-Bn3§,_loc4_).showModal();
               break;
            case §_-8JG§:
               new §_-BWW§(Context.cityPlayer).showModal();
               break;
            case §_-ArA§:
               _loc5_ = null;
               if(_loc4_ != null)
               {
                  _loc5_ = Context.craftManager.§_-3sJ§(_loc4_);
               }
               new §_-0vC§(_loc5_,param2,true).showModal();
               break;
            case §_-4PU§:
               Context.§_-06H§.§_-74§(Context.cityPlayer.id);
               break;
            case §_-1S4§:
               new §_-4We§(null,param1[2]).showModal();
               break;
            case §_-73Z§:
               _loc6_ = Context.cityPlayer.clanInfo != null ? ClanMainDialog.§_-5wD§ : ClanMainDialog.§_-A6v§;
               new ClanMainDialog(-1,_loc6_).showModal();
               break;
            case §_-5dv§:
               new §_-8RV§().showModal();
               break;
            case §_-6-G§:
               Context.§_-5c9§.§_-3v-§();
         }
      }
      
      protected static function get §_-3Zj§() : §_-Ahc§
      {
         return Context.§_-3hG§.currentScreen as §_-Ahc§;
      }
      
      private static function §_-7mz§(param1:Array) : void
      {
         if(param1.length <= 1)
         {
            return;
         }
         §_-Bg7§.instance.hideAll();
         var _loc2_:§_-6G§ = §_-0nG§.instance.getModule(param1[1]);
         if(_loc2_ == null || !_loc2_.isActive())
         {
            return;
         }
         (_loc2_ as §_-1ra§).§_-5Xm§();
      }
   }
}

