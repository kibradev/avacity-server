package §_-8aN§
{
   import §_-0Uz§.§_-6v4§;
   import §_-0xO§.§_-8A0§;
   import §_-0xO§.§_-9FC§;
   import §_-2qd§.§_-9ai§;
   import §_-3i4§.§_-1s2§;
   import §_-3i4§.§_-5Wo§;
   import §_-8Hp§.§_-5KD§;
   import §_-GM§.Context;
   
   public class §_-iN§ extends §_-6v4§
   {
      public static const §_-50a§:String = "leagueCompetition";
      
      public static const §_-B4T§:String = "leagueGroup";
      
      public static const §_-65t§:int = 5;
      
      public static const §_-AR§:int = 1;
      
      public static const §_-kt§:int = 7;
      
      public static const §_-6vv§:int = 0;
      
      public static const §_-8dq§:int = 1;
      
      public static const §_-8NS§:int = 2;
      
      private var _leagueGroup:§_-5Wo§ = null;
      
      private var §_-0tL§:Array = null;
      
      private var _callback:Function = null;
      
      private var §_-9i3§:int = 0;
      
      private var §_-6dH§:Array = [];
      
      private var §_-BRV§:Number = 0;
      
      private var §_-1cP§:Number = 0;
      
      public function §_-iN§()
      {
         super();
         §_-1-t§(§_-8A0§.§_-1Il§,this.§_-8Xu§);
      }
      
      public function configure(param1:XML) : void
      {
         var _loc3_:XML = null;
         var _loc4_:§_-1s2§ = null;
         var _loc2_:XML = param1["params"][0];
         this.§_-BRV§ = !!_loc2_.hasOwnProperty("@lowThreshold") ? Number(_loc2_["@lowThreshold"]) : 0;
         this.§_-1cP§ = !!_loc2_.hasOwnProperty("@upThreshold") ? Number(_loc2_["@upThreshold"]) : 0;
         for each(_loc3_ in (param1.elements("awards")[0] as XML).elements("award"))
         {
            _loc4_ = new §_-1s2§();
            _loc4_.configure(_loc3_);
            this.§_-6dH§.push(_loc4_);
         }
      }
      
      public function get isActive() : Boolean
      {
         return §_-5KD§.instance.§_-C6D§(§_-50a§);
      }
      
      public function §_-BBh§(param1:Function) : void
      {
         this._callback = param1;
         §_-6gl§.sendExtMessage(§_-8A0§.§_-1Il§);
      }
      
      private function §_-8Xu§(param1:§_-9ai§) : void
      {
         var _loc2_:§_-5Wo§ = param1.data.§_-2jV§(§_-9FC§.§_-5gx§,§_-5Wo§);
         this.§_-9i3§ = param1.data.getInt(§_-9FC§.§_-43z§);
         this._leagueGroup = _loc2_;
         if(this._leagueGroup != null)
         {
            Context.§_-3B2§.§_-ADX§(this.§_-AIT§,§_-B4T§,this.§_-9jo§);
         }
         else
         {
            this._callback(null);
         }
      }
      
      private function §_-9jo§(param1:Array) : void
      {
         this.§_-0tL§ = param1;
         this._callback(this._leagueGroup);
      }
      
      public function get §_-AIT§() : Array
      {
         var _loc2_:String = null;
         var _loc1_:Array = [];
         for(_loc2_ in this._leagueGroup.members)
         {
            _loc1_.push(_loc2_);
         }
         return _loc1_;
      }
      
      public function get §_-Btn§() : Array
      {
         return this.§_-0tL§;
      }
      
      public function §_-0If§(param1:int, param2:int = 1) : int
      {
         if(this.§_-0tL§.length < §_-65t§)
         {
            return §_-6vv§;
         }
         var _loc3_:int = this.§_-0tL§.length - Math.round(this.§_-0tL§.length * this.§_-BRV§);
         var _loc4_:int = Math.ceil(this.§_-0tL§.length * this.§_-1cP§);
         if(param1 <= _loc4_ && param2 < §_-kt§)
         {
            return §_-8NS§;
         }
         if(param1 >= _loc3_)
         {
            return §_-8dq§;
         }
         return §_-6vv§;
      }
      
      public function §_-1L6§(param1:int) : §_-1s2§
      {
         var _loc2_:§_-1s2§ = null;
         for each(_loc2_ in this.§_-6dH§)
         {
            if(_loc2_.leagueIndex == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function §_-5Sg§() : §_-1s2§
      {
         return this.§_-1L6§(this._leagueGroup.leagueIndex);
      }
      
      public function get awards() : Array
      {
         return this.§_-6dH§;
      }
      
      public function get leagueGroup() : §_-5Wo§
      {
         return this._leagueGroup;
      }
      
      public function get §_-0UE§() : int
      {
         return this.§_-9i3§;
      }
   }
}

