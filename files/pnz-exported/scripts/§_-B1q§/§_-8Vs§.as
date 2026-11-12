package §_-B1q§
{
   import §_-0SP§.§_-0BC§;
   import §_-0SP§.§_-0jQ§;
   import §_-0Uz§.§_-3mj§;
   import §_-0Uz§.§_-6v4§;
   import §_-18o§.§_-8-S§;
   import §_-2qd§.§_-9ai§;
   import §_-39l§.§_-5t6§;
   import §_-3vi§.§_-Ar-§;
   import §_-5Zh§.§_-19w§;
   import §_-6hr§.§_-1Gi§;
   import §_-6ke§.§_-BX2§;
   import §_-7gz§.§_-9MQ§;
   import §_-7w5§.§_-6J2§;
   import §_-8Hp§.§_-5KD§;
   import §_-BeZ§.§_-4Ww§;
   import §_-BnM§.§_-1Bu§;
   import §_-BnM§.§_-C7e§;
   import §_-CFw§.§_-2hx§;
   import §_-CFw§.§_-Aqm§;
   import §_-CFw§.§_-B0v§;
   import §_-GM§.Context;
   
   public class §_-8Vs§ extends §_-6v4§
   {
      private static const §_-1xA§:int = 900;
      
      private var §_-7rJ§:Array = [];
      
      private var §_-2kE§:Array = [];
      
      private var §_-7yN§:int = -1;
      
      private var §_-0an§:Array;
      
      private var §_-02L§:int;
      
      private var §_-2xY§:Function;
      
      private var §_-791§:int;
      
      private var §_-3PV§:Array;
      
      public function §_-8Vs§()
      {
         super();
         §_-1-t§(§_-C7e§.§_-2yo§,this.§_-7Tz§);
         §_-1-t§(§_-C7e§.§_-7Bd§,this.§_-0rj§);
         §_-1-t§(§_-C7e§.§_-1xN§,this.§_-CTp§);
      }
      
      public function configure(param1:XML) : void
      {
         var _loc2_:XML = null;
         var _loc3_:XML = null;
         var _loc4_:XML = null;
         var _loc5_:§_-2hx§ = null;
         var _loc6_:§_-Aqm§ = null;
         var _loc7_:§_-Ar-§ = null;
         for each(_loc2_ in (param1.elements("awards")[0] as XML).elements("award"))
         {
            _loc5_ = new §_-2hx§();
            _loc5_.configure(_loc2_);
            this.§_-7rJ§.push(_loc5_);
         }
         for each(_loc3_ in (param1.elements("tasks")[0] as XML).elements("task"))
         {
            _loc6_ = new §_-Aqm§();
            _loc6_.configure(_loc3_);
            this.§_-2kE§.push(_loc6_);
         }
         this.§_-3PV§ = [];
         for each(_loc4_ in (param1.elements("challengeRating")[0] as XML).elements("awards"))
         {
            _loc7_ = new §_-Ar-§();
            _loc7_.configure(_loc4_);
            this.§_-3PV§.push(_loc7_);
         }
      }
      
      public function get §_-4C9§() : Boolean
      {
         return §_-5KD§.instance.§_-C6D§(§_-5t6§.§_-6Tc§);
      }
      
      public function §_-QE§(param1:int) : void
      {
         var _loc2_:§_-4Ww§ = new §_-4Ww§();
         _loc2_.§_-CZf§(§_-6J2§.§_-5im§,param1);
         §_-6gl§.sendExtMessage(§_-C7e§.§_-AYg§,_loc2_);
      }
      
      public function get §_-0Ge§() : Array
      {
         return this.§_-3PV§;
      }
      
      public function §_-5YT§(param1:int) : §_-2hx§
      {
         var _loc2_:§_-2hx§ = null;
         for each(_loc2_ in this.§_-7rJ§)
         {
            if(_loc2_.§_-ANP§ == param1 && _loc2_.place == 1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function §_-8jf§(param1:Boolean) : void
      {
         var _loc2_:§_-4Ww§ = new §_-4Ww§();
         _loc2_.§_-6YJ§(§_-1Bu§.§_-1G2§,param1);
         §_-6gl§.sendExtMessage(§_-C7e§.§_-1J0§,_loc2_);
      }
      
      public function §_-7Tz§(param1:§_-9ai§) : void
      {
         var _loc2_:§_-0BC§ = param1.data.§_-2jV§(§_-1Bu§.§_-6fu§,§_-0BC§);
         var _loc3_:int = param1.data.getInt(§_-1Bu§.§_-CJh§);
         var _loc4_:Boolean = param1.data.getBoolean(§_-1Bu§.§_-0oA§);
         var _loc5_:§_-1Gi§ = new §_-1Gi§(§_-1Gi§.§_-7Tm§);
         _loc5_.§_-5aN§(§_-1Gi§.§_-7wb§,_loc2_);
         _loc5_.§_-5aN§(§_-1Gi§.§_-9w5§,_loc3_);
         _loc5_.§_-5aN§(§_-1Gi§.§_-5g3§,_loc4_);
         dispatchEvent(_loc5_);
      }
      
      private function §_-0rj§(param1:§_-9ai§) : void
      {
         var _loc5_:§_-19w§ = null;
         var _loc2_:§_-0jQ§ = param1.data.§_-2jV§(§_-1Bu§.§_-HR§,§_-0jQ§);
         var _loc3_:String = param1.data.getString(§_-3mj§.§_-9GV§);
         var _loc4_:int = param1.data.getInt(§_-6J2§.§_-5im§);
         if(_loc2_ != null)
         {
            _loc5_ = §_-5t6§.instance.§_-5Dg§(_loc4_);
            if(_loc5_ == null)
            {
               return;
            }
            if(_loc5_.members.hasOwnProperty(parseInt(_loc3_)))
            {
               _loc5_.members[parseInt(_loc3_)].clanMemberChallengeModel = _loc2_;
            }
         }
      }
      
      public function showHelpDialog() : void
      {
      }
      
      public function §_-0Gt§(param1:int) : int
      {
         var _loc2_:§_-Aqm§ = null;
         for each(_loc2_ in this.§_-2kE§)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_.§_-8mC§;
            }
         }
         return 0;
      }
      
      public function §_-9gb§(param1:int) : String
      {
         var _loc2_:§_-Aqm§ = null;
         for each(_loc2_ in this.§_-2kE§)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_.title;
            }
         }
         return "";
      }
      
      public function §_-C5L§(param1:int) : String
      {
         var _loc2_:§_-Aqm§ = null;
         for each(_loc2_ in this.§_-2kE§)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_.description;
            }
         }
         return "";
      }
      
      public function §_-3ja§(param1:int) : String
      {
         var _loc3_:§_-Aqm§ = null;
         var _loc4_:String = null;
         var _loc2_:Array = [];
         for each(_loc3_ in this.§_-2kE§)
         {
            if(_loc3_.id == param1)
            {
               for(_loc4_ in _loc3_.points)
               {
                  _loc2_[parseInt(_loc4_)] = Context.§_-5o8§.plural("runes",(_loc3_.points[_loc4_] as §_-B0v§).count);
               }
               return Context.§_-5o8§.message(_loc3_.rule,{
                  "points1":this.§_-Bl1§(0,_loc2_),
                  "points2":this.§_-Bl1§(1,_loc2_),
                  "points3":this.§_-Bl1§(2,_loc2_),
                  "points4":this.§_-Bl1§(3,_loc2_),
                  "points5":this.§_-Bl1§(4,_loc2_)
               });
            }
         }
         return "";
      }
      
      public function §_-B6a§() : Array
      {
         return this.§_-2kE§;
      }
      
      public function §_-Abj§(param1:Function) : void
      {
         var _loc2_:int = §_-8-S§.§_-9zq§() - this.§_-02L§;
         if(this.§_-0an§ != null && this.§_-0an§.length > 0 && _loc2_ < §_-1xA§)
         {
            param1(this.§_-0an§,this.§_-791§);
            return;
         }
         this.§_-2xY§ = param1;
         §_-6gl§.sendExtMessage(§_-C7e§.§_-1xN§);
      }
      
      private function §_-Bl1§(param1:int, param2:Array) : String
      {
         if(param2.length <= param1)
         {
            return "";
         }
         return param2[param1];
      }
      
      private function §_-CTp§(param1:§_-9ai§) : void
      {
         if(!param1.data.has(§_-9MQ§.§_-78o§))
         {
            return;
         }
         var _loc2_:Array = param1.data.§_-Bc6§(§_-9MQ§.§_-78o§,§_-BX2§);
         var _loc3_:int = param1.data.getInt(§_-9MQ§.§_-pF§);
         this.§_-0an§ = _loc2_;
         this.§_-02L§ = §_-8-S§.§_-9zq§();
         if(this.§_-2xY§ != null)
         {
            this.§_-2xY§(this.§_-0an§,_loc3_);
            this.§_-2xY§ = null;
         }
      }
   }
}

