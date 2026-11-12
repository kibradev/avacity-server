package §_-6U3§
{
   import §_-0Uz§.§_-3mj§;
   import §_-0Uz§.§_-6v4§;
   import §_-0pH§.§_-3Jp§;
   import §_-18o§.§_-8-S§;
   import §_-2qd§.§_-9ai§;
   import §_-39l§.§_-5t6§;
   import §_-5Zh§.§_-19w§;
   import §_-5Zh§.§_-1nw§;
   import §_-7w5§.§_-6J2§;
   import §_-9VF§.§_-48g§;
   import §_-Agp§.§_-1YY§;
   import §_-Agp§.§_-2j7§;
   import §_-Agp§.§_-4-g§;
   import §_-BCu§.ClanLeagueGroup;
   import §_-BCu§.§_-9dw§;
   import §_-BCu§.§_-CXD§;
   import §_-BeZ§.§_-4Ww§;
   import §_-CPj§.§_-409§;
   import §_-CPj§.§_-AZR§;
   import §_-GM§.Context;
   import §_-Gq§.§_-9Y5§;
   
   public class §_-2TD§ extends §_-6v4§
   {
      public static const §_-BGw§:String = "sapperEquipment";
      
      public static const §_-1x§:int = 120;
      
      private var §_-9pY§:int;
      
      private var §_-74p§:Object;
      
      private var §_-1kM§:Object;
      
      private var §_-6l1§:§_-4-g§ = new §_-4-g§();
      
      private var §_-C90§:Array = [];
      
      private var §_-4kH§:ClanLeagueGroup;
      
      private var §_-33h§:Number = 0;
      
      private var §_-9ZY§:Number = 0;
      
      public function §_-2TD§()
      {
         super();
         §_-1-t§(§_-409§.§_-98U§,this.§_-0i9§);
         §_-1-t§(§_-409§.§_-6IE§,this.§_-3ss§);
         §_-1-t§(§_-409§.§_-8zM§,this.§_-9zM§);
      }
      
      public function configure(param1:XML) : void
      {
         var _loc2_:XML = null;
         var _loc3_:XML = null;
         var _loc4_:§_-1YY§ = null;
         var _loc5_:§_-2j7§ = null;
         this.§_-6l1§.configure(param1.elements("params")[0] as XML);
         this.§_-74p§ = {};
         this.§_-1kM§ = {};
         for each(_loc2_ in (param1.elements("structure")[0] as XML).elements("group"))
         {
            _loc4_ = new §_-1YY§();
            _loc4_.configure(_loc2_);
            this.§_-74p§[_loc4_.index] = _loc4_;
            if(this.§_-1kM§.hasOwnProperty(_loc4_.§_-AVb§.toString()))
            {
               this.§_-1kM§[_loc4_.§_-AVb§].push(_loc4_.index);
            }
            else
            {
               this.§_-1kM§[_loc4_.§_-AVb§] = [_loc4_.index];
            }
         }
         for each(_loc3_ in (param1.elements("awards")[0] as XML).elements("award"))
         {
            _loc5_ = new §_-2j7§();
            _loc5_.configure(_loc3_);
            this.§_-C90§.push(_loc5_);
         }
      }
      
      public function §_-1vh§() : §_-4-g§
      {
         return this.§_-6l1§;
      }
      
      public function get §_-8s8§() : Number
      {
         return this.§_-33h§;
      }
      
      public function get §_-vg§() : int
      {
         return this.§_-9pY§;
      }
      
      public function §_-A1l§(param1:Array) : Array
      {
         var _loc3_:§_-2j7§ = null;
         var _loc2_:Array = [];
         for each(_loc3_ in this.§_-C90§)
         {
            if(param1.indexOf(_loc3_.§_-7ai§) >= 0)
            {
               _loc2_.push(_loc3_);
            }
         }
         return _loc2_;
      }
      
      public function §_-5Ws§(param1:String) : §_-1YY§
      {
         return !!this.§_-74p§.hasOwnProperty(param1) ? this.§_-74p§[param1] : null;
      }
      
      public function §_-0DW§() : Object
      {
         return this.§_-1kM§;
      }
      
      public function §_-BSv§(param1:int) : Array
      {
         return this.§_-1kM§[param1];
      }
      
      public function §_-9lq§() : void
      {
         var _loc1_:Number = Context.player.currentServerTime;
         if(this.§_-4kH§ != null && this.§_-4kH§.§_-6dg§ < _loc1_)
         {
            this.§_-4kH§ = null;
            this.§_-33h§ = 0;
         }
         if(this.§_-4kH§ == null && _loc1_ >= this.§_-33h§ || this.§_-33h§ <= 0 || this.§_-9ZY§ + §_-1x§ < §_-8-S§.§_-9zq§())
         {
            §_-6gl§.sendExtMessage(§_-409§.§_-6IE§);
         }
         else
         {
            this.§_-36V§();
         }
      }
      
      public function §_-Bps§(param1:Boolean) : void
      {
         var _loc2_:§_-4Ww§ = new §_-4Ww§();
         _loc2_.put(§_-AZR§.§_-CTl§,param1);
         netClient.sendExtMessage(§_-409§.§_-By2§,_loc2_);
      }
      
      public function get §_-3UG§() : Boolean
      {
         var _loc1_:§_-48g§ = Context.cityPlayer;
         if(!_loc1_.§_-28R§() || !this.§_-9RW§)
         {
            return false;
         }
         var _loc2_:§_-19w§ = §_-5t6§.instance.§_-5Dg§(_loc1_.clanInfo.clanId);
         var _loc3_:§_-1nw§ = _loc2_ != null ? _loc2_.getClanMember(_loc1_.id) : null;
         if(_loc3_ == null || _loc3_.clanMemberLeagueModel == null)
         {
            return false;
         }
         var _loc4_:§_-CXD§ = _loc3_.clanMemberLeagueModel;
         return _loc3_.joinDate < this.§_-33h§ && _loc4_.§_-BwC§ < Context.player.currentServerTime;
      }
      
      public function §_-4fN§(param1:§_-3Jp§) : Boolean
      {
         return param1.itemId == §_-BGw§;
      }
      
      private function §_-8x2§(param1:§_-9dw§) : void
      {
         var _loc2_:§_-19w§ = null;
         this.§_-9pY§ = param1.competitionId;
         if(Context.cityPlayer.§_-28R§())
         {
            _loc2_ = §_-5t6§.instance.§_-5Dg§(Context.cityPlayer.clanInfo.clanId);
            if(_loc2_ == null)
            {
               return;
            }
            _loc2_.§_-x1§ = param1;
            §_-5t6§.instance.updateClan(_loc2_);
         }
      }
      
      private function §_-0i9§(param1:§_-9ai§) : void
      {
         if(!param1.data.has(§_-AZR§.§_-5AR§))
         {
            return;
         }
         var _loc2_:§_-9dw§ = param1.data.§_-2jV§(§_-AZR§.§_-5AR§,§_-9dw§);
         this.§_-8x2§(_loc2_);
      }
      
      private function §_-3ss§(param1:§_-9ai§) : void
      {
         if(!param1.data.has(§_-AZR§.§_-8P9§))
         {
            return;
         }
         this.§_-4kH§ = param1.data.§_-2jV§(§_-AZR§.§_-8P9§,ClanLeagueGroup);
         this.§_-33h§ = param1.data.§_-0uL§(§_-AZR§.§_-3Ax§);
         this.§_-9pY§ = param1.data.getInt(§_-AZR§.§_-81M§);
         this.§_-9ZY§ = §_-8-S§.§_-9zq§();
         this.§_-36V§();
      }
      
      private function §_-9zM§(param1:§_-9ai§) : void
      {
         var _loc5_:§_-19w§ = null;
         var _loc2_:§_-CXD§ = param1.data.§_-2jV§(§_-AZR§.§_-2ZG§,§_-CXD§);
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
               _loc5_.members[parseInt(_loc3_)].clanMemberLeagueModel = _loc2_;
            }
         }
      }
      
      private function §_-36V§() : void
      {
         var _loc1_:§_-9Y5§ = new §_-9Y5§(§_-9Y5§.§_-Bwp§);
         _loc1_.§_-5aN§(§_-9Y5§.§_-8zI§,this.§_-4kH§);
         _loc1_.§_-5aN§(§_-9Y5§.§_-3Ax§,this.§_-33h§);
         dispatchEvent(_loc1_);
      }
      
      public function get §_-9RW§() : Boolean
      {
         if(this.§_-4kH§ == null)
         {
            this.§_-9lq§();
            return false;
         }
         if(Context.cityPlayer.clanInfo == null)
         {
            return false;
         }
         return this.§_-4kH§.§_-1W7§(Context.cityPlayer.clanInfo.clanId) != null;
      }
   }
}

