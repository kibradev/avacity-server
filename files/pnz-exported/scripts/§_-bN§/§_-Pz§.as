package §_-bN§
{
   import §_-0Uz§.§_-3mj§;
   import §_-0Uz§.§_-6v4§;
   import §_-18o§.§_-8-S§;
   import §_-1QQ§.§_-BEl§;
   import §_-2TH§.§_-2Dl§;
   import §_-2TH§.§_-B8G§;
   import §_-2qd§.§_-9ai§;
   import §_-39l§.§_-5t6§;
   import §_-3vi§.§_-3Oo§;
   import §_-5Zh§.§_-19w§;
   import §_-6ke§.§_-BX2§;
   import §_-7gz§.§_-7T6§;
   import §_-7gz§.§_-9MQ§;
   import §_-7w5§.§_-6J2§;
   import §_-8Hp§.§_-5KD§;
   import §_-8Nj§.§_-6W5§;
   import §_-GM§.Context;
   
   public class §_-Pz§ extends §_-6v4§
   {
      private static const §_-1W5§:String = "clanActivityRating";
      
      private static const §_-0-S§:String = "clanMemberRating";
      
      private static const §_-1xA§:int = 900;
      
      private static const §_-AZP§:Number = 0.07;
      
      private var §_-5Cc§:int = -1;
      
      private var §_-7yN§:int = -1;
      
      private var §_-4BT§:Array;
      
      private var §_-02L§:int;
      
      private var §_-2xY§:Function;
      
      private var §_-5Em§:Object;
      
      private var §_-791§:int;
      
      public function §_-Pz§()
      {
         super();
         §_-1-t§(§_-7T6§.§_-7iy§,this.§_-5A§);
         §_-1-t§(§_-7T6§.§_-3OY§,this.§_-7Ui§);
         §_-1-t§(§_-7T6§.§_-AQy§,this.§_-4W9§);
         §_-1-t§(§_-7T6§.§_-5mU§,this.§_-4ga§);
      }
      
      public function configure(param1:XML) : void
      {
         var _loc2_:XML = null;
         var _loc3_:int = 0;
         var _loc4_:Array = null;
         var _loc5_:XML = null;
         var _loc6_:§_-3Oo§ = null;
         this.§_-5Em§ = {};
         for each(_loc2_ in (param1.elements("rating")[0] as XML).elements("awards"))
         {
            _loc3_ = !!_loc2_.hasOwnProperty("@place") ? int(_loc2_["@place"]) : 0;
            _loc4_ = [];
            for each(_loc5_ in _loc2_.elements("award"))
            {
               _loc6_ = new §_-3Oo§();
               _loc6_.configure(_loc5_);
               _loc4_.push(_loc6_);
            }
            this.§_-5Em§[_loc3_] = _loc4_;
         }
      }
      
      public function get §_-B48§() : Object
      {
         return this.§_-5Em§;
      }
      
      public function get §_-6wT§() : int
      {
         return this.§_-7yN§;
      }
      
      public function §_-0be§() : Boolean
      {
         return §_-5KD§.instance.getModuleItem(§_-1W5§) != null;
      }
      
      public function §_-6Iv§() : Boolean
      {
         return §_-5KD§.instance.getModuleItem(§_-0-S§) != null;
      }
      
      public function getClanActivity() : void
      {
         §_-6gl§.sendExtMessage(§_-7T6§.§_-7iy§);
      }
      
      public function §_-9vS§(param1:Function) : void
      {
         var _loc2_:int = §_-8-S§.§_-9zq§() - this.§_-02L§;
         if(this.§_-4BT§ != null && this.§_-4BT§.length > 0 && _loc2_ < §_-1xA§)
         {
            param1(this.§_-4BT§,this.§_-791§);
            return;
         }
         this.§_-2xY§ = param1;
         §_-6gl§.sendExtMessage(§_-7T6§.§_-5mU§);
      }
      
      private function §_-5A§(param1:§_-9ai§) : void
      {
         if(!param1.data.has(§_-9MQ§.§_-8WD§))
         {
            return;
         }
         var _loc2_:§_-2Dl§ = param1.data.§_-2jV§(§_-9MQ§.§_-8WD§,§_-2Dl§);
         this.updateActivity(_loc2_);
         var _loc3_:§_-BEl§ = new §_-BEl§(§_-BEl§.§_-58n§);
         _loc3_.§_-5aN§(§_-BEl§.§_-4Ey§,_loc2_);
         dispatchEvent(_loc3_);
      }
      
      private function §_-7Ui§(param1:§_-9ai§) : void
      {
         if(!param1.data.has(§_-9MQ§.§_-8WD§))
         {
            return;
         }
         var _loc2_:§_-2Dl§ = param1.data.§_-2jV§(§_-9MQ§.§_-8WD§,§_-2Dl§);
         this.updateActivity(_loc2_);
      }
      
      private function updateActivity(param1:§_-2Dl§) : void
      {
         var _loc2_:§_-19w§ = null;
         this.§_-5Cc§ = param1.§_-2Gj§;
         this.§_-7yN§ = param1.§_-6-M§;
         this.§_-791§ = param1.§_-7m6§;
         if(Context.cityPlayer.§_-28R§())
         {
            _loc2_ = §_-5t6§.instance.§_-5Dg§(Context.cityPlayer.clanInfo.clanId);
            if(_loc2_ == null)
            {
               return;
            }
            _loc2_.activityModel = param1;
            §_-5t6§.instance.updateClan(_loc2_);
         }
      }
      
      private function §_-4ga§(param1:§_-9ai§) : void
      {
         if(!param1.data.has(§_-9MQ§.§_-78o§))
         {
            return;
         }
         var _loc2_:Array = param1.data.§_-Bc6§(§_-9MQ§.§_-78o§,§_-BX2§);
         var _loc3_:int = param1.data.getInt(§_-9MQ§.§_-pF§);
         this.§_-4BT§ = _loc2_;
         this.§_-02L§ = §_-8-S§.§_-9zq§();
         if(this.§_-2xY§ != null)
         {
            this.§_-2xY§(this.§_-4BT§,_loc3_);
            this.§_-2xY§ = null;
         }
      }
      
      private function §_-4W9§(param1:§_-9ai§) : void
      {
         if(!param1.data.has(§_-9MQ§.§_-2aT§))
         {
            return;
         }
         var _loc2_:String = param1.data.getString(§_-3mj§.§_-9GV§);
         var _loc3_:int = param1.data.getInt(§_-6J2§.§_-5im§);
         var _loc4_:§_-B8G§ = param1.data.§_-2jV§(§_-9MQ§.§_-2aT§,§_-B8G§);
         var _loc5_:§_-BEl§ = new §_-BEl§(§_-BEl§.§_-CbW§);
         _loc5_.§_-5aN§(§_-BEl§.§_-5Ad§,_loc4_);
         _loc5_.§_-5aN§(§_-BEl§.§_-TH§,_loc2_);
         dispatchEvent(_loc5_);
         var _loc6_:§_-19w§ = §_-5t6§.instance.§_-5Dg§(_loc3_);
         if(_loc6_ == null)
         {
            return;
         }
         if(_loc6_.members.hasOwnProperty(parseInt(_loc2_)))
         {
            _loc6_.members[parseInt(_loc2_)].clanMemberActivityModel = _loc4_;
         }
      }
      
      public function get §_-Bl4§() : int
      {
         return this.§_-5Cc§;
      }
      
      public function §_-7zO§(param1:int) : int
      {
         var _loc3_:int = 0;
         var _loc2_:Number = this.§_-4ro§;
         if(_loc2_ > 0 && param1 > 0)
         {
            return int(Math.ceil(param1 - param1 * _loc2_));
         }
         return param1;
      }
      
      public function get §_-gx§() : Boolean
      {
         return this.§_-4ro§ > 0;
      }
      
      private function get §_-4ro§() : Number
      {
         if(Context.cityPlayer.cityInfo != null && Context.cityPlayer.cityInfo.trophyTypeId == §_-6W5§.§_-7cX§ && (Context.cityPlayer.cityInfo.§_-9KX§ == 0 || Context.cityPlayer.cityInfo.§_-9KX§ + Context.player.timeDelta > §_-8-S§.§_-9zq§()))
         {
            return §_-AZP§;
         }
         return 0;
      }
   }
}

