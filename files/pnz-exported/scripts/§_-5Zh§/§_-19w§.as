package §_-5Zh§
{
   import §_-18o§.§_-8-S§;
   import §_-2TH§.§_-2Dl§;
   import §_-5qq§.§_-pt§;
   import §_-6-L§.§_-6aF§;
   import §_-9MY§.§_-B1c§;
   import §_-BCu§.§_-9dw§;
   import §_-BeZ§.§_-0Yu§;
   import §_-BeZ§.§_-4Ww§;
   import §_-GM§.Context;
   
   public class §_-19w§ implements §_-0Yu§
   {
      public static const §_-6Ud§:String = "id";
      
      public static const §_-4Z3§:String = "ttl";
      
      public static const §_-0vR§:String = "tg";
      
      public static const §_-8CR§:String = "lvl";
      
      public static const §_-4kC§:String = "exp";
      
      public static const §_-rR§:String = "crdt";
      
      public static const §_-6BE§:String = "crid";
      
      public static const §_-4wt§:String = "st";
      
      public static const §_-5pr§:String = "ccn";
      
      public static const §_-BRs§:String = "mmbs";
      
      public static const §_-732§:String = "icn";
      
      public static const §_-91U§:String = "hpc";
      
      public static const §_-4C0§:String = "pvt";
      
      public static const §_-CJc§:String = "cinv";
      
      public static const §_-Aj7§:String = "clrtg";
      
      public static const §_-91W§:String = "ctstrd";
      
      public static const §_-8en§:String = "ctspls";
      
      public static const §_-8vJ§:String = "actvtmdl";
      
      public static const §_-83g§:String = "dsblcmp";
      
      public static const §_-0ip§:String = "bnus";
      
      public static const §_-1gr§:String = "lginf";
      
      private var §_-AcP§:int = 0;
      
      private var §_-Avc§:String = "";
      
      private var §_-8Fk§:String = "";
      
      private var _level:int = 0;
      
      private var §_-9Ym§:int = 0;
      
      private var §_-A9-§:int = 0;
      
      private var §_-8ZX§:int = 0;
      
      private var _status:int = 0;
      
      private var §_-5th§:int = 0;
      
      private var §_-1PD§:Object = {};
      
      private var _icon:String = "";
      
      private var §_-35X§:int = 0;
      
      private var §_-9Lw§:Boolean = true;
      
      private var §_-Br2§:Boolean = false;
      
      private var §_-0Um§:§_-pt§ = new §_-pt§();
      
      private var §_-6xg§:int = 0;
      
      private var §_-Bo6§:Boolean = false;
      
      private var §_-4y3§:int = 0;
      
      private var §_-BZ7§:Boolean = false;
      
      private var §_-9pc§:§_-2Dl§ = null;
      
      private var §_-CdE§:Object = {};
      
      private var §_-4eC§:§_-9dw§ = null;
      
      public function §_-19w§()
      {
         super();
      }
      
      public function get id() : int
      {
         return this.§_-AcP§;
      }
      
      public function set id(param1:int) : void
      {
         this.§_-AcP§ = param1;
      }
      
      public function get title() : String
      {
         return this.§_-Avc§;
      }
      
      public function set title(param1:String) : void
      {
         this.§_-Avc§ = param1;
      }
      
      public function get tag() : String
      {
         return this.§_-8Fk§;
      }
      
      public function set tag(param1:String) : void
      {
         this.§_-8Fk§ = param1;
      }
      
      public function get level() : int
      {
         return this._level;
      }
      
      public function set level(param1:int) : void
      {
         this._level = param1;
      }
      
      public function get experience() : int
      {
         return this.§_-9Ym§;
      }
      
      public function set experience(param1:int) : void
      {
         this.§_-9Ym§ = param1;
      }
      
      public function get §_-7e-§() : int
      {
         return this.§_-A9-§;
      }
      
      public function set §_-7e-§(param1:int) : void
      {
         this.§_-A9-§ = param1;
      }
      
      public function get creatorId() : int
      {
         return this.§_-8ZX§;
      }
      
      public function set creatorId(param1:int) : void
      {
         this.§_-8ZX§ = param1;
      }
      
      public function get status() : int
      {
         return this._status;
      }
      
      public function set status(param1:int) : void
      {
         this._status = param1;
      }
      
      public function get clanCoin() : int
      {
         return this.§_-5th§;
      }
      
      public function set clanCoin(param1:int) : void
      {
         this.§_-5th§ = param1;
      }
      
      public function get members() : Object
      {
         return this.§_-1PD§;
      }
      
      public function set members(param1:Object) : void
      {
         this.§_-1PD§ = param1;
      }
      
      public function get icon() : String
      {
         return this._icon;
      }
      
      public function set icon(param1:String) : void
      {
         this._icon = param1;
      }
      
      public function get activity() : int
      {
         if(this.§_-9pc§ == null)
         {
            return 0;
         }
         var _loc1_:int = §_-8-S§.§_-9zq§() + Context.cityPlayer.timeDelta;
         return this.§_-9pc§.§_-7m6§ > _loc1_ ? this.§_-9pc§.§_-7W4§ : 0;
      }
      
      public function get §_-7Bq§() : int
      {
         if(this.§_-9pc§ == null)
         {
            return 0;
         }
         var _loc1_:int = §_-8-S§.§_-9zq§() + Context.cityPlayer.timeDelta;
         return this.§_-9pc§.§_-1F4§ > _loc1_ ? this.§_-9pc§.§_-3M9§ : 0;
      }
      
      public function get §_-5sp§() : int
      {
         if(this.§_-9pc§ == null)
         {
            return 0;
         }
         var _loc1_:int = §_-8-S§.§_-9zq§() + Context.cityPlayer.timeDelta;
         return this.§_-9pc§.§_-BjT§ > _loc1_ ? this.§_-9pc§.§_-7X-§ : 0;
      }
      
      public function get rating() : int
      {
         return this.§_-35X§;
      }
      
      public function set rating(param1:int) : void
      {
         this.§_-35X§ = param1;
      }
      
      public function get §_-02G§() : int
      {
         return this.§_-6xg§;
      }
      
      public function set §_-02G§(param1:int) : void
      {
         this.§_-6xg§ = param1;
      }
      
      public function get contestReady() : Boolean
      {
         return this.§_-Bo6§;
      }
      
      public function set contestReady(param1:Boolean) : void
      {
         this.§_-Bo6§ = param1;
      }
      
      public function get disableCompetition() : Boolean
      {
         return this.§_-BZ7§;
      }
      
      public function get §_-06n§() : int
      {
         var _loc2_:§_-1nw§ = null;
         var _loc1_:int = 0;
         for each(_loc2_ in §_-6aF§.toArray(this.§_-1PD§))
         {
            if(_loc2_.role == §_-B1c§.MASTER)
            {
               _loc1_++;
            }
         }
         return _loc1_;
      }
      
      public function get §_-AH8§() : int
      {
         return §_-6aF§.§_-vN§(this.§_-1PD§);
      }
      
      public function get §_-CID§() : Boolean
      {
         return this.§_-9Lw§;
      }
      
      public function set §_-CID§(param1:Boolean) : void
      {
         this.§_-9Lw§ = param1;
      }
      
      public function get §_-BVZ§() : Boolean
      {
         return this.§_-Br2§;
      }
      
      public function set §_-BVZ§(param1:Boolean) : void
      {
         this.§_-Br2§ = param1;
      }
      
      public function get taggedTitle() : String
      {
         return "[" + this.§_-8Fk§ + "]" + this.§_-Avc§;
      }
      
      public function get clanInventory() : §_-pt§
      {
         return this.§_-0Um§;
      }
      
      public function set clanInventory(param1:§_-pt§) : void
      {
         this.§_-0Um§ = param1;
      }
      
      public function addMember(param1:§_-1nw§) : void
      {
         this.§_-1PD§[param1.userId] = param1;
      }
      
      public function updateMember(param1:§_-1nw§) : void
      {
         this.§_-1PD§[param1.userId] = param1;
      }
      
      public function §_-5ir§(param1:String) : void
      {
         if(this.§_-1PD§.hasOwnProperty(param1))
         {
            delete this.§_-1PD§[param1];
         }
      }
      
      public function §_-A8I§(param1:int) : void
      {
         this.§_-1PD§[param1] = null;
         delete this.§_-1PD§[param1];
      }
      
      public function get §_-AqG§() : int
      {
         return this.§_-9pc§.§_-5C-§ > §_-8-S§.§_-9zq§() && this.§_-9pc§.§_-81l§ > 0 ? this.§_-9pc§.§_-81l§ : 0;
      }
      
      public function get challengeRatingPlace() : int
      {
         return this.§_-9pc§.§_-86v§ > §_-8-S§.§_-9zq§() && this.§_-9pc§.challengeContestPlace > 0 ? this.§_-9pc§.challengeContestPlace : 0;
      }
      
      public function getClanMember(param1:String) : §_-1nw§
      {
         if(this.§_-1PD§.hasOwnProperty(param1))
         {
            return this.§_-1PD§[param1];
         }
         return null;
      }
      
      public function get activityModel() : §_-2Dl§
      {
         return this.§_-9pc§;
      }
      
      public function set activityModel(param1:§_-2Dl§) : void
      {
         this.§_-9pc§ = param1;
      }
      
      public function get §_-1sQ§() : Object
      {
         return this.§_-CdE§;
      }
      
      public function set §_-1sQ§(param1:Object) : void
      {
         this.§_-CdE§ = param1;
      }
      
      public function §_-0Ld§(param1:String) : Boolean
      {
         return this.§_-1sQ§.hasOwnProperty(param1);
      }
      
      public function hasBan() : Boolean
      {
         return this.§_-0Ld§(Context.cityPlayer.id);
      }
      
      public function getBannedUsersIds() : Array
      {
         var _loc2_:§_-Bsz§ = null;
         var _loc1_:Array = [];
         for each(_loc2_ in this.§_-CdE§)
         {
            _loc1_.push(_loc2_.userId);
         }
         return _loc1_;
      }
      
      public function §_-BfJ§(param1:§_-Bsz§) : void
      {
         this.§_-1sQ§[param1.userId] = param1;
      }
      
      public function §_-wl§(param1:String) : void
      {
         if(this.§_-1sQ§.hasOwnProperty(param1))
         {
            delete this.§_-1sQ§[param1];
         }
      }
      
      public function §_-51z§(param1:String) : §_-Bsz§
      {
         if(this.§_-1sQ§.hasOwnProperty(param1))
         {
            return this.§_-1sQ§[param1];
         }
         return null;
      }
      
      public function get §_-x1§() : §_-9dw§
      {
         return this.§_-4eC§;
      }
      
      public function set §_-x1§(param1:§_-9dw§) : void
      {
         this.§_-4eC§ = param1;
      }
      
      public function fromModel(param1:§_-19w§) : void
      {
         this.§_-AcP§ = param1.id;
         this.§_-Avc§ = param1.title;
         this.§_-8Fk§ = param1.tag;
         this._level = param1.level;
         this.§_-A9-§ = param1.§_-7e-§;
         this.§_-8ZX§ = param1.creatorId;
         this._status = param1.status;
         this.§_-5th§ = param1.clanCoin;
         this.§_-1PD§ = param1.members;
         this._icon = param1.icon;
         this.§_-9Lw§ = param1.§_-CID§;
         this.§_-Br2§ = param1.§_-BVZ§;
         this.§_-0Um§ = param1.clanInventory;
         this.§_-6xg§ = param1.§_-02G§;
         this.§_-Bo6§ = param1.contestReady;
         this.§_-9Ym§ = param1.experience;
         this.§_-4y3§ = param1.§_-AqG§;
         this.§_-BZ7§ = param1.disableCompetition;
         this.§_-CdE§ = param1.§_-1sQ§;
      }
      
      public function toAGSObject(param1:§_-4Ww§) : void
      {
         param1.put(§_-6Ud§,this.§_-AcP§);
         param1.put(§_-4Z3§,this.§_-Avc§);
         param1.put(§_-0vR§,this.§_-8Fk§);
         param1.put(§_-8CR§,this._level);
         param1.put(§_-rR§,this.§_-A9-§);
         param1.put(§_-6BE§,this.§_-8ZX§);
         param1.put(§_-4wt§,this._status);
         param1.put(§_-5pr§,this.§_-5th§);
         param1.put(§_-BRs§,this.§_-1PD§);
         param1.put(§_-732§,this._icon);
         param1.put(§_-91U§,this.§_-9Lw§);
         param1.put(§_-4C0§,this.§_-Br2§);
         param1.put(§_-CJc§,this.§_-0Um§);
         param1.put(§_-Aj7§,this.§_-6xg§);
         param1.put(§_-91W§,this.§_-Bo6§);
         param1.put(§_-4kC§,this.§_-9Ym§);
         param1.put(§_-8en§,this.§_-4y3§);
         param1.put(§_-8vJ§,this.§_-9pc§);
         param1.put(§_-83g§,this.§_-BZ7§);
         param1.put(§_-0ip§,this.§_-CdE§);
         param1.put(§_-1gr§,this.§_-4eC§);
      }
      
      public function fromAGSObject(param1:§_-4Ww§) : void
      {
         this.§_-AcP§ = param1.getInt(§_-6Ud§);
         this.§_-Avc§ = param1.getString(§_-4Z3§);
         this.§_-8Fk§ = param1.getString(§_-0vR§);
         this._level = param1.getInt(§_-8CR§);
         this.§_-A9-§ = param1.getInt(§_-rR§);
         this.§_-8ZX§ = param1.getInt(§_-6BE§);
         this._status = param1.getInt(§_-4wt§);
         this.§_-5th§ = param1.getInt(§_-5pr§);
         this.§_-1PD§ = param1.getMap(§_-BRs§,§_-1nw§);
         this._icon = param1.getString(§_-732§);
         this.§_-9Lw§ = param1.getBoolean(§_-91U§);
         this.§_-Br2§ = param1.getBoolean(§_-4C0§);
         this.§_-0Um§ = param1.§_-2jV§(§_-CJc§,§_-pt§);
         this.§_-6xg§ = param1.getInt(§_-Aj7§);
         this.§_-Bo6§ = param1.getBoolean(§_-91W§);
         this.§_-BZ7§ = param1.getBoolean(§_-83g§);
         this.§_-9Ym§ = param1.getInt(§_-4kC§);
         this.§_-4y3§ = param1.getInt(§_-8en§);
         this.§_-9pc§ = param1.§_-2jV§(§_-8vJ§,§_-2Dl§);
         this.§_-CdE§ = param1.getMap(§_-0ip§,§_-Bsz§);
         this.§_-4eC§ = param1.§_-2jV§(§_-1gr§,§_-9dw§);
      }
   }
}

