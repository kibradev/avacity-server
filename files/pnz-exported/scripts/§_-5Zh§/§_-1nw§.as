package §_-5Zh§
{
   import §_-0SP§.§_-0jQ§;
   import §_-2TH§.§_-B8G§;
   import §_-BCu§.§_-CXD§;
   import §_-BVO§.§_-6Go§;
   import §_-BeZ§.§_-0Yu§;
   import §_-BeZ§.§_-4Ww§;
   
   public class §_-1nw§ implements §_-0Yu§
   {
      public static const §_-1tE§:String = "uid";
      
      public static const §_-8hi§:String = "cid";
      
      public static const §_-BmU§:String = "rl";
      
      public static const §_-7C2§:String = "jd";
      
      public static const §_-1kU§:String = "ap";
      
      public static const §_-5pr§:String = "ccn";
      
      public static const §_-8WD§:String = "cam";
      
      public static const §_-CEh§:String = "ccm";
      
      public static const §_-7wb§:String = "cchm";
      
      public static const §_-A-i§:String = "clgm";
      
      protected var _userId:int = 0;
      
      protected var _clanId:int = 0;
      
      protected var §_-8o4§:int = 0;
      
      protected var §_-CNL§:int = 0;
      
      protected var §_-5th§:int = 0;
      
      protected var §_-91r§:Boolean = false;
      
      protected var §_-AH-§:§_-B8G§;
      
      protected var §_-7li§:§_-6Go§;
      
      protected var §_-7CX§:§_-0jQ§;
      
      protected var §_-5dT§:§_-CXD§;
      
      public function §_-1nw§()
      {
         super();
      }
      
      public function get userId() : int
      {
         return this._userId;
      }
      
      public function set userId(param1:int) : void
      {
         this._userId = param1;
      }
      
      public function get clanId() : int
      {
         return this._clanId;
      }
      
      public function set clanId(param1:int) : void
      {
         this._clanId = param1;
      }
      
      public function get role() : int
      {
         return this.§_-8o4§;
      }
      
      public function set role(param1:int) : void
      {
         this.§_-8o4§ = param1;
      }
      
      public function get joinDate() : int
      {
         return this.§_-CNL§;
      }
      
      public function set joinDate(param1:int) : void
      {
         this.§_-CNL§ = param1;
      }
      
      public function get clanCoin() : int
      {
         return this.§_-5th§;
      }
      
      public function set clanCoin(param1:int) : void
      {
         this.§_-5th§ = param1;
      }
      
      public function get online() : Boolean
      {
         return this.§_-91r§;
      }
      
      public function set online(param1:Boolean) : void
      {
         this.§_-91r§ = param1;
      }
      
      public function get clanMemberActivityModel() : §_-B8G§
      {
         return this.§_-AH-§;
      }
      
      public function set clanMemberActivityModel(param1:§_-B8G§) : void
      {
         this.§_-AH-§ = param1;
      }
      
      public function get clanMemberContestModel() : §_-6Go§
      {
         return this.§_-7li§;
      }
      
      public function set clanMemberContestModel(param1:§_-6Go§) : void
      {
         this.§_-7li§ = param1;
      }
      
      public function get clanMemberChallengeModel() : §_-0jQ§
      {
         return this.§_-7CX§;
      }
      
      public function set clanMemberChallengeModel(param1:§_-0jQ§) : void
      {
         this.§_-7CX§ = param1;
      }
      
      public function get clanMemberLeagueModel() : §_-CXD§
      {
         return this.§_-5dT§;
      }
      
      public function set clanMemberLeagueModel(param1:§_-CXD§) : void
      {
         this.§_-5dT§ = param1;
      }
      
      public function toAGSObject(param1:§_-4Ww§) : void
      {
         param1.put(§_-1tE§,this._userId);
         param1.put(§_-8hi§,this._clanId);
         param1.put(§_-BmU§,this.§_-8o4§);
         param1.put(§_-7C2§,this.§_-CNL§);
         param1.put(§_-5pr§,this.§_-5th§);
         param1.put(§_-8WD§,this.clanMemberActivityModel);
         param1.put(§_-CEh§,this.clanMemberContestModel);
         param1.put(§_-7wb§,this.clanMemberChallengeModel);
         param1.put(§_-A-i§,this.clanMemberLeagueModel);
      }
      
      public function fromAGSObject(param1:§_-4Ww§) : void
      {
         this._userId = param1.getInt(§_-1tE§);
         this._clanId = param1.getInt(§_-8hi§);
         this.§_-8o4§ = param1.getInt(§_-BmU§);
         this.§_-CNL§ = param1.getInt(§_-7C2§);
         this.§_-5th§ = param1.getInt(§_-5pr§);
         this.§_-AH-§ = param1.§_-2jV§(§_-8WD§,§_-B8G§);
         this.§_-7li§ = param1.§_-2jV§(§_-CEh§,§_-6Go§);
         this.§_-7CX§ = param1.§_-2jV§(§_-7wb§,§_-0jQ§);
         this.§_-5dT§ = param1.§_-2jV§(§_-A-i§,§_-CXD§);
      }
   }
}

