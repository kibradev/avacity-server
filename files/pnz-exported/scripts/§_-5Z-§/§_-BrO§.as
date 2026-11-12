package §_-5Z-§
{
   import §_-07O§.§_-9PB§;
   import §_-0r1§.§_-8GI§;
   import §_-2vB§.§_-A84§;
   import §_-3ZB§.§_-1Rd§;
   import §_-3ZB§.§_-Ac1§;
   import §_-6Pj§.§_-02c§;
   import §_-7Mq§.LocationGameList;
   import §_-7Mq§.§_-3rG§;
   import §_-7Mq§.§_-nG§;
   import §_-7kf§.§_-9S8§;
   import §_-9VF§.§_-48g§;
   import §_-A2M§.§_-4Ba§;
   import §_-AKx§.§_-4OH§;
   import §_-AdD§.§_-0Tw§;
   import §_-AdD§.§_-3rH§;
   import §_-Ah§.§_-5E8§;
   import §_-Ah§.§_-5ey§;
   import §_-Av5§.§_-1ZC§;
   import §_-BJP§.§_-5J7§;
   import §_-GM§.Context;
   import §_-d5§.§_-2nW§;
   import §_-uR§.§_-53f§;
   import ags.§_-5x-§;
   
   public class §_-BrO§ extends §_-53f§
   {
      private var §_-ia§:§_-1ZC§ = null;
      
      private var §_-55I§:§_-4Ba§ = null;
      
      protected var §_-5TD§:LocationGameList = null;
      
      protected var _netManager:§_-CFt§ = null;
      
      public function §_-BrO§(param1:§_-1ZC§, param2:§_-5x-§, param3:String)
      {
         super();
         this.§_-ia§ = param1;
         this._netManager = this.createGameNetManager(param2,param3);
         this.§_-9Dk§();
      }
      
      protected function createGameNetManager(param1:§_-5x-§, param2:String) : §_-CFt§
      {
         return new §_-CFt§(param1,param2);
      }
      
      private function §_-9Dk§() : void
      {
         this._netManager.addEventListener(§_-5E8§.§_-8hn§,this.onUpdateGameList);
         this._netManager.addEventListener(§_-5E8§.§_-8vF§,this.onNewGame);
         this._netManager.addEventListener(§_-5E8§.§_-9lY§,this.§_-28X§);
         this._netManager.addEventListener(§_-5E8§.§_-59M§,this.§_-6ox§);
         this._netManager.addEventListener(§_-5E8§.§_-8VI§,this.onEnteredInGame);
         this._netManager.addEventListener(§_-5E8§.§_-0jt§,this.onLeavedGame);
         this._netManager.addEventListener(§_-5E8§.§_-0uF§,this.§_-7NG§);
         this._netManager.addEventListener(§_-5E8§.§_-AY3§,this.onGetGameInfo);
         this._netManager.addEventListener(§_-5E8§.GAME_FINISHED,this.§_-1-8§);
         this._netManager.addEventListener(§_-5E8§.§_-01e§,this.§_-8v6§);
         this._netManager.addEventListener(§_-5E8§.§_-4GP§,this.onGameStarted);
         this._netManager.addEventListener(§_-5ey§.§_-0LA§,this.§_-1k1§);
         this._netManager.addEventListener(§_-5ey§.§_-26M§,this.§_-76Y§);
      }
      
      private function removeListeners() : void
      {
         this._netManager.removeEventListener(§_-5E8§.§_-8hn§,this.onUpdateGameList);
         this._netManager.removeEventListener(§_-5E8§.§_-8vF§,this.onNewGame);
         this._netManager.removeEventListener(§_-5E8§.§_-9lY§,this.§_-28X§);
         this._netManager.removeEventListener(§_-5E8§.§_-59M§,this.§_-6ox§);
         this._netManager.removeEventListener(§_-5E8§.§_-8VI§,this.onEnteredInGame);
         this._netManager.removeEventListener(§_-5E8§.§_-0jt§,this.onLeavedGame);
         this._netManager.removeEventListener(§_-5E8§.§_-0uF§,this.§_-7NG§);
         this._netManager.removeEventListener(§_-5E8§.§_-AY3§,this.onGetGameInfo);
         this._netManager.removeEventListener(§_-5E8§.GAME_FINISHED,this.§_-1-8§);
         this._netManager.removeEventListener(§_-5E8§.§_-01e§,this.§_-8v6§);
         this._netManager.removeEventListener(§_-5E8§.§_-4GP§,this.onGameStarted);
         this._netManager.removeEventListener(§_-5E8§.GAME_FINISHED,this.§_-1-8§);
         this._netManager.removeEventListener(§_-5ey§.§_-0LA§,this.§_-1k1§);
         this._netManager.removeEventListener(§_-5ey§.§_-26M§,this.§_-76Y§);
      }
      
      private function onNewGame(param1:§_-5E8§) : void
      {
         this.locationGames.§_-4of§(param1.game);
         this.§_-5NB§();
         dispatchEvent(new §_-5E8§(§_-5E8§.§_-8vF§,param1.game));
      }
      
      private function §_-28X§(param1:§_-5E8§) : void
      {
         var _loc2_:String = param1.gameId;
         this.getGameInfo(_loc2_);
         dispatchEvent(new §_-5E8§(§_-5E8§.§_-9lY§,_loc2_));
      }
      
      private function §_-6ox§(param1:§_-5E8§) : void
      {
         var _loc2_:String = param1.gameId;
         this.getGameInfo(_loc2_);
      }
      
      protected function onEnteredInGame(param1:§_-5E8§) : void
      {
         if(!param1.tag.hasOwnProperty("gameId") || !param1.tag.hasOwnProperty("gamer"))
         {
            return;
         }
         var _loc2_:String = param1.tag["gameId"];
         var _loc3_:§_-nG§ = param1.tag["gamer"];
         if(_loc2_ == null || _loc3_ == null)
         {
            return;
         }
         if(!this.locationGames.§_-B9W§(_loc2_))
         {
            return;
         }
         var _loc4_:§_-3rG§ = this.§_-5TD§.getGame(_loc2_);
         if(_loc4_ == null)
         {
            return;
         }
         _loc4_.§_-9Ct§(_loc3_);
         if(_loc3_.userId == Context.player.id || _loc4_.§_-07J§(Context.player.id) && _loc4_.§_-07J§(_loc3_.userId))
         {
            return;
         }
         var _loc5_:§_-3rH§ = null;
         if(_loc4_.configuration.hideAvatars)
         {
            _loc5_ = this.§_-AF§.getAvatar(_loc3_.userId);
            if(_loc5_ != null)
            {
               _loc5_.visible = false;
            }
         }
         dispatchEvent(new §_-5E8§(§_-5E8§.§_-8VI§,_loc2_));
      }
      
      protected function onLeavedGame(param1:§_-5E8§) : void
      {
         if(!param1.tag.hasOwnProperty("gameId") || !param1.tag.hasOwnProperty("gamerId"))
         {
            return;
         }
         var _loc2_:String = param1.tag["gameId"];
         var _loc3_:String = param1.tag["gamerId"];
         if(!this.locationGames.§_-B9W§(_loc2_))
         {
            return;
         }
         var _loc4_:§_-3rG§ = this.§_-5TD§.getGame(_loc2_);
         if(_loc4_ == null)
         {
            return;
         }
         _loc4_.§_-5Hf§(_loc3_);
         var _loc5_:§_-3rH§ = this.§_-AF§.getAvatar(_loc3_);
         if(_loc5_ != null)
         {
            _loc5_.visible = this.§_-3Zj§ is §_-9PB§ ? (this.§_-3Zj§ as §_-9PB§).isAvatarVisible(_loc5_ as §_-0Tw§) : true;
         }
         dispatchEvent(new §_-5E8§(§_-5E8§.§_-0jt§,param1.tag));
         if(_loc3_ == Context.cityPlayer.id)
         {
            this._netManager.§_-S0§();
         }
      }
      
      private function onGetGameInfo(param1:§_-5E8§) : void
      {
         if(this.§_-AG8§)
         {
            this.§_-3Zj§.enterGame(param1.game);
         }
      }
      
      private function get §_-AG8§() : Boolean
      {
         return Context.§_-3hG§.currentScreen is §_-Ahc§;
      }
      
      private function get §_-3Zj§() : §_-Ahc§
      {
         return Context.§_-3hG§.currentScreen as §_-Ahc§;
      }
      
      private function §_-1-8§(param1:§_-5E8§) : void
      {
         var _loc2_:String = param1.gameId;
         this.locationGames.§_-1JT§(_loc2_);
         this.§_-5NB§();
         dispatchEvent(new §_-5E8§(§_-5E8§.GAME_FINISHED,_loc2_));
      }
      
      private function onGameStarted(param1:§_-5E8§) : void
      {
         var _loc2_:String = param1.gameId;
         dispatchEvent(new §_-5E8§(§_-5E8§.§_-4GP§,_loc2_));
      }
      
      private function §_-1k1§(param1:§_-5ey§) : void
      {
         dispatchEvent(new §_-5ey§(§_-5ey§.§_-0LA§,param1.userId));
      }
      
      private function §_-76Y§(param1:§_-5ey§) : void
      {
      }
      
      private function §_-8v6§(param1:§_-5E8§) : void
      {
         var _loc2_:String = param1.gameId;
         if(!this.locationGames.§_-B9W§(_loc2_))
         {
            return;
         }
         var _loc3_:§_-3rG§ = this.§_-5TD§.getGame(_loc2_);
         if(_loc3_ is §_-8GI§)
         {
            (_loc3_ as §_-8GI§).banned = true;
         }
         dispatchEvent(new §_-5E8§(§_-5E8§.§_-01e§,_loc2_));
      }
      
      private function §_-7NG§(param1:§_-5E8§) : void
      {
         var _loc6_:§_-48g§ = null;
         var _loc7_:String = null;
         var _loc8_:§_-5J7§ = null;
         if(!(param1.tag as Object).hasOwnProperty("gameId") || !(param1.tag as Object).hasOwnProperty("request") || !(param1.tag as Object).hasOwnProperty("senderId"))
         {
            return;
         }
         var _loc2_:String = param1.tag["senderId"];
         var _loc3_:String = param1.tag["gameId"];
         var _loc4_:Boolean = Boolean(param1.tag["request"]);
         var _loc5_:Object = param1.tag["additionalParams"];
         if(_loc4_)
         {
            _loc6_ = §_-48g§(this.§_-ia§.getMember(_loc2_));
            if(this.locationGames.§_-B9W§(_loc3_))
            {
               _loc7_ = this.locationGames.getGame(_loc3_).type;
               switch(_loc7_)
               {
                  case §_-2nW§.§_-86h§:
                     _loc8_ = §_-02c§.§_-BAi§(§_-9S8§.§_-86h§);
                     if(_loc8_ != null)
                     {
                        Context.§_-BlB§.§_-50r§(_loc6_,_loc8_);
                     }
               }
            }
         }
         else
         {
            this._netManager.enterGame(_loc3_,_loc5_);
         }
      }
      
      protected function onUpdateGameList(param1:§_-5E8§) : void
      {
         this.locationGames = param1.§_-8vs§;
         this.§_-5NB§();
         if(this.§_-55I§ != null)
         {
            this.§_-55I§.resolve(param1.§_-8vs§);
            this.§_-55I§ = null;
         }
         dispatchEvent(new §_-5E8§(§_-5E8§.§_-8hn§,param1.§_-8vs§));
      }
      
      private function §_-5NB§() : void
      {
         if(this.§_-AG8§)
         {
            this.§_-3Zj§.§_-5NB§();
         }
      }
      
      public function createGame(param1:String, param2:String, param3:Object = null) : void
      {
         if(Context.§_-76P§.isActive() && !Context.§_-76P§.§_-AYP§(§_-A84§.§_-1sf§,Context.cityPlayer.cityInfo.reputation))
         {
            §_-4OH§.§_-B5P§(Context.§_-5o8§.message("error"),Context.§_-5o8§.message("notEnoughReputation"));
            return;
         }
         this._netManager.createGame(param1,param2,param3);
      }
      
      public function §_-S0§() : void
      {
         if(this.§_-55I§ == null)
         {
            this.§_-55I§ = new §_-4Ba§();
         }
         this._netManager.§_-S0§();
      }
      
      public function §_-3vs§() : §_-4Ba§
      {
         if(this.§_-55I§ != null)
         {
            return this.§_-55I§;
         }
         this.§_-S0§();
         return this.§_-55I§;
      }
      
      public function getGameInfo(param1:String) : void
      {
         this._netManager.getGameInfo(param1);
      }
      
      public function involve(param1:String, param2:String, param3:Boolean, param4:Object = null) : void
      {
         this._netManager.involve(param1,param2,param3,param4);
      }
      
      public function §_-83q§(param1:String) : Boolean
      {
         var _loc2_:§_-3rG§ = null;
         for each(_loc2_ in this.§_-5TD§.games)
         {
            if(_loc2_.type == param1)
            {
               return true;
            }
         }
         return false;
      }
      
      public function get locationGames() : LocationGameList
      {
         if(this.§_-5TD§ == null)
         {
            this.§_-5TD§ = new LocationGameList();
         }
         return this.§_-5TD§;
      }
      
      public function set locationGames(param1:LocationGameList) : void
      {
         this.§_-5TD§ = param1;
      }
      
      public function get netClient() : §_-5x-§
      {
         return this._netManager.netClient;
      }
      
      public function get §_-AF§() : §_-1ZC§
      {
         return this.§_-ia§;
      }
      
      public function needToHideAvatar(param1:§_-3rH§) : Boolean
      {
         var _loc2_:§_-3rG§ = null;
         var _loc3_:§_-1Rd§ = null;
         var _loc4_:§_-Ac1§ = null;
         if(this.§_-5TD§ == null)
         {
            return false;
         }
         for each(_loc2_ in this.§_-5TD§.games)
         {
            if(_loc2_.configuration.hideAvatars)
            {
               _loc3_ = _loc2_ as §_-1Rd§;
               if(_loc3_ != null)
               {
                  _loc4_ = _loc3_.getGamer(param1.userId) as §_-Ac1§;
                  if(_loc4_ == null || _loc4_.status != §_-Ac1§.§_-3NY§)
                  {
                     continue;
                  }
               }
               if(_loc2_.§_-AoK§(param1.userId))
               {
                  return true;
               }
            }
         }
         return false;
      }
      
      public function playerInGame(param1:String) : Boolean
      {
         var _loc2_:§_-3rG§ = null;
         for each(_loc2_ in this.§_-5TD§.games)
         {
            if(_loc2_.§_-AoK§(param1))
            {
               return true;
            }
         }
         return false;
      }
      
      public function enterGame(param1:String) : void
      {
         this._netManager.enterGame(param1);
      }
      
      override public function destroy() : void
      {
         if(destroyed)
         {
            return;
         }
         if(this._netManager != null)
         {
            this.removeListeners();
            this._netManager.destroy();
            this._netManager = null;
         }
         this.§_-ia§ = null;
         this.§_-5TD§ = null;
         super.destroy();
      }
   }
}

