package §_-AMb§
{
   import §_-0fi§.§_-6f3§;
   import §_-2Y7§.§_-CAG§;
   import §_-2qd§.§_-9ai§;
   import §_-39l§.§_-5t6§;
   import §_-45g§.§_-B97§;
   import §_-4Q1§.§_-5r8§;
   import §_-5Lc§.§_-8Bn§;
   import §_-5eM§.§_-5d-§;
   import §_-6-L§.§_-49j§;
   import §_-6GW§.§_-BSm§;
   import §_-76Z§.§_-2jg§;
   import §_-7nb§.§_-6kZ§;
   import §_-7w5§.§_-6J2§;
   import §_-8tw§.§_-5-F§;
   import §_-9MY§.§_-BL4§;
   import §_-A2M§.§_-4Ba§;
   import §_-BeZ§.§_-4Ww§;
   import §_-GM§.Context;
   import §_-yg§.§_-3Co§;
   import penzville.Application;
   import penzville.Config;
   
   public class §_-1i1§ extends §_-6kZ§
   {
      private var §_-3sz§:§_-8Bn§ = null;
      
      private var §_-5w3§:String = null;
      
      private var §_-BKC§:String = null;
      
      private var §_-5y6§:String = null;
      
      private var §_-35l§:String = null;
      
      private var §_-0uK§:String = null;
      
      private var _clanLocationModel:§_-5-F§ = null;
      
      private var §_-5Uq§:Function;
      
      private var §_-1Cg§:§_-5r8§ = null;
      
      public function §_-1i1§(param1:String, param2:String, param3:String)
      {
         super();
         this.§_-3sz§ = Context.§_-Bd7§.§_-00V§(§_-8Bn§.§_-5F-§);
         this.§_-5w3§ = param1;
         this.§_-BKC§ = param2;
         this.§_-0uK§ = param3;
         §_-9yg§ = Config.§_-7vO§;
         §_-49j§.merge(§_-9yg§,this.§_-3sz§.loadingContent);
      }
      
      override protected function createNetClient(param1:Function) : void
      {
         Context.§_-CLP§.§_-0u1§(param1,Config.clanServer,Config.clanPort,this.zoneId);
      }
      
      override protected function initLocation() : void
      {
         this.switchRoom(this.§_-BKC§);
      }
      
      override public function switchRoom(param1:String) : void
      {
         this.changeRoom(param1);
      }
      
      private function changeRoom(param1:String) : void
      {
         this.§_-C7§();
         this.§_-5y6§ = param1;
         §_-5-J§(§_-3Co§.§_-5WP§,this.§_-5y6§,this.§_-5w3§,this.§_-3sz§.id);
      }
      
      private function §_-0pA§(param1:Array) : §_-4Ba§
      {
         var _loc3_:String = null;
         var _loc4_:§_-5d-§ = null;
         var _loc2_:Array = [];
         if(param1.length > 0)
         {
            for each(_loc3_ in param1)
            {
               _loc4_ = Context.§_-70S§.§_-0ZU§().findTypeById(_loc3_);
               if(_loc4_ is §_-6f3§ && (_loc4_ as §_-6f3§).isFileLoading)
               {
                  _loc2_.push(_loc4_);
               }
            }
         }
         return §_-81z§(_loc2_);
      }
      
      public function §_-1nv§() : Boolean
      {
         return Context.cityPlayer.§_-28R§(parseInt(this.§_-5w3§)) && §_-2jg§.§_-67i§(§_-BL4§.EDIT_ROOM_LAYOUT,Context.cityPlayer.clanInfo.role);
      }
      
      private function §_-C7§() : void
      {
         if(this.§_-35l§ != null)
         {
            if(Application.instance.status != Application.§_-1Ui§)
            {
               §_-6gl§.leaveRoom(this.§_-35l§);
            }
            this.§_-35l§ = null;
         }
      }
      
      public function §_-3i8§() : void
      {
         if(this._clanLocationModel == null)
         {
            this.§_-7cj§(this.§_-5w3§);
            return;
         }
         this.showDialog();
      }
      
      public function §_-C8p§() : void
      {
         var _loc1_:§_-4Ww§ = new §_-4Ww§();
         _loc1_.put(§_-6J2§.§_-5im§,this.§_-5w3§);
         §_-6gl§.sendExtMessage(§_-3Co§.§_-9QO§,_loc1_);
      }
      
      public function §_-6Cu§() : void
      {
         var _loc1_:§_-4Ww§ = new §_-4Ww§();
         _loc1_.put(§_-6J2§.§_-5im§,this.§_-5w3§);
         §_-6gl§.sendExtMessage(§_-3Co§.§_-3bz§,_loc1_);
      }
      
      public function renameRoom(param1:int, param2:String, param3:String) : void
      {
         var _loc4_:§_-4Ww§ = new §_-4Ww§();
         _loc4_.put(§_-6J2§.§_-0zI§,param3);
         _loc4_.put(§_-6J2§.§_-5im§,param1);
         _loc4_.put(§_-6J2§.§_-B73§,param2);
         §_-6gl§.sendExtMessage(§_-3Co§.§_-2bl§,_loc4_);
      }
      
      private function §_-7cj§(param1:String) : void
      {
         §_-6gl§.commandDispatcher.addEventListener(§_-3Co§.§_-7Rh§,this.§_-0Sb§);
         §_-6gl§.commandDispatcher.addEventListener(§_-3Co§.§_-CYe§,this.§_-6gR§);
         var _loc2_:§_-4Ww§ = new §_-4Ww§();
         _loc2_.put(§_-6J2§.§_-5im§,param1);
         §_-6gl§.sendExtMessage(§_-3Co§.§_-7Rh§,_loc2_);
      }
      
      private function showDialog() : void
      {
         var _loc1_:§_-CAG§ = new §_-CAG§(§_-5t6§.instance.§_-5Dg§(parseInt(this.§_-5w3§)),this._clanLocationModel);
         _loc1_.showModal(null,true);
      }
      
      override protected function processRoomConnectResult(param1:§_-4Ww§) : void
      {
         var furnitureList:Array;
         var tasks:Array;
         var data:§_-4Ww§ = param1;
         super.processRoomConnectResult(data);
         this.§_-35l§ = data.getString(§_-BSm§.§_-3Z1§);
         if(this.§_-5y6§ == null && this.§_-35l§ != null)
         {
            this.§_-5y6§ = this.§_-35l§.split("_")[2];
         }
         furnitureList = data.§_-Bc6§(§_-BSm§.§_-8Mq§,String);
         tasks = [];
         if(furnitureList != null && furnitureList.length > 0)
         {
            tasks.push(this.§_-0pA§(furnitureList));
         }
         §_-4Ba§.all(tasks).then(function():void
         {
            currentScreen = getCurrentScreen();
         });
      }
      
      private function §_-6gR§(param1:§_-9ai§) : void
      {
         var _loc2_:§_-5-F§ = param1.data.§_-2jV§(§_-6J2§.§_-AAJ§,§_-5-F§);
         if(this._clanLocationModel != null && this._clanLocationModel.clanId != _loc2_.clanId)
         {
            return;
         }
         this._clanLocationModel = _loc2_;
         if(this.§_-5Uq§ != null)
         {
            this.§_-5Uq§();
            this.§_-5Uq§ = null;
         }
         var _loc3_:§_-B97§ = new §_-B97§(§_-B97§.§_-AS9§);
         _loc3_.§_-5aN§(§_-B97§.§_-6Yg§,this._clanLocationModel);
         Application.instance.dispatchEvent(_loc3_);
      }
      
      private function §_-0Sb§(param1:§_-9ai§) : void
      {
         §_-6gl§.commandDispatcher.removeEventListener(§_-3Co§.§_-7Rh§,this.§_-0Sb§);
         this._clanLocationModel = param1.data.§_-2jV§(§_-6J2§.§_-AAJ§,§_-5-F§);
         if(this._clanLocationModel != null)
         {
            this.showDialog();
         }
      }
      
      private function getCurrentScreen() : §_-Aym§
      {
         return new §_-Aym§(§_-6gl§,this.§_-35l§,this.§_-3sz§);
      }
      
      public function get §_-4BX§() : §_-5r8§
      {
         return currentScreen is §_-Aym§ ? (currentScreen as §_-Aym§).§_-4BX§ : null;
      }
      
      override public function get zoneId() : String
      {
         return this.§_-3sz§.zoneId;
      }
      
      override public function get locationId() : String
      {
         return this.§_-3sz§.id;
      }
      
      public function get layerId() : String
      {
         return this.§_-0uK§;
      }
      
      public function get clanLocationModel() : §_-5-F§
      {
         return this._clanLocationModel;
      }
      
      public function get §_-1n2§() : String
      {
         return this.§_-5y6§;
      }
      
      public function get §_-CE§() : String
      {
         return this.§_-35l§;
      }
      
      public function get clanId() : String
      {
         return this.§_-5w3§;
      }
      
      override public function destroy() : void
      {
         if(destroyed)
         {
            return;
         }
         this.§_-C7§();
         this.§_-3sz§ = null;
         if(this.§_-1Cg§ != null)
         {
            this.§_-1Cg§.destroy();
            this.§_-1Cg§ = null;
         }
         if(§_-6gl§ != null)
         {
            §_-6gl§.commandDispatcher.removeEventListener(§_-3Co§.§_-CYe§,this.§_-6gR§);
         }
         super.destroy();
      }
   }
}

