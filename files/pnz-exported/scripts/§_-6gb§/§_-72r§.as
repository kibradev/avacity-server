package §_-6gb§
{
   import §_-18o§.§_-A8q§;
   import §_-BeZ§.§_-0Yu§;
   import §_-BeZ§.§_-4Ww§;
   import §_-C-a§.§_-3uA§;
   import §_-GM§.Context;
   import §_-hW§.§_-B6y§;
   import §_-hW§.§_-zd§;
   
   public class §_-72r§ implements §_-0Yu§
   {
      public static const §_-3H8§:String = "ac";
      
      public static const §_-2Fz§:String = "tr";
      
      public static const §_-0eu§:String = "avaw";
      
      private var §_-V3§:Object = {};
      
      private var §_-1Wr§:Object = {};
      
      private var §_-4g2§:Object = {};
      
      public function §_-72r§()
      {
         super();
      }
      
      public function toAGSObject(param1:§_-4Ww§) : void
      {
         param1.§_-5CI§(§_-3H8§,this.§_-V3§);
         param1.§_-5CI§(§_-2Fz§,this.§_-1Wr§);
         param1.§_-5CI§(§_-0eu§,this.§_-4g2§);
      }
      
      public function fromAGSObject(param1:§_-4Ww§) : void
      {
         this.§_-V3§ = param1.getMap(§_-3H8§,Achievement);
         this.§_-1Wr§ = param1.getMap(§_-2Fz§,Trophy);
         this.§_-4g2§ = param1.getMap(§_-0eu§,§_-3ID§);
      }
      
      public function §_-7XT§(param1:String) : Achievement
      {
         var _loc2_:Achievement = null;
         if(!this.§_-V3§.hasOwnProperty(param1))
         {
            _loc2_ = new Achievement();
            _loc2_.§_-2X5§ = param1;
            this.§_-V3§[param1] = _loc2_;
         }
         return this.§_-V3§[param1] as Achievement;
      }
      
      public function getTrophy(param1:String) : Trophy
      {
         return !!this.§_-1Wr§.hasOwnProperty(param1) ? this.§_-1Wr§[param1] as Trophy : null;
      }
      
      public function §_-Bj3§(param1:String) : §_-3ID§
      {
         var _loc2_:§_-3ID§ = null;
         if(!this.§_-4g2§.hasOwnProperty(param1))
         {
            _loc2_ = new §_-3ID§();
            _loc2_.awardId = param1;
            this.§_-4g2§[param1] = _loc2_;
         }
         return this.§_-4g2§[param1] as §_-3ID§;
      }
      
      public function get achievementsList() : Vector.<Achievement>
      {
         var _loc2_:Achievement = null;
         var _loc1_:Vector.<Achievement> = new Vector.<Achievement>();
         for each(_loc2_ in this.§_-V3§)
         {
            _loc1_.push(_loc2_);
         }
         return _loc1_;
      }
      
      public function get §_-BPL§() : Vector.<Trophy>
      {
         var _loc2_:Trophy = null;
         var _loc1_:Vector.<Trophy> = new Vector.<Trophy>();
         for each(_loc2_ in this.§_-1Wr§)
         {
            _loc1_.push(_loc2_);
         }
         return _loc1_;
      }
      
      public function §_-6fg§(param1:Achievement) : void
      {
         this.§_-V3§[param1.§_-2X5§] = param1;
      }
      
      public function §_-1fH§(param1:Trophy) : void
      {
         this.§_-1Wr§[param1.typeId] = param1;
      }
      
      public function §_-0BJ§(param1:§_-3ID§) : void
      {
         this.§_-4g2§[param1.awardId] = param1;
      }
      
      public function §_-2gX§(param1:String) : void
      {
         delete this.§_-1Wr§[param1];
      }
      
      public function get §_-5yB§() : int
      {
         var _loc2_:§_-zd§ = null;
         var _loc1_:int = 0;
         for each(_loc2_ in Context.§_-3QG§.§_-4qw§)
         {
            if(_loc2_.§_-3I7§)
            {
               _loc1_++;
            }
         }
         return _loc1_;
      }
      
      public function get §_-9e-§() : Boolean
      {
         var _loc1_:§_-B6y§ = null;
         var _loc2_:§_-3ID§ = null;
         for each(_loc1_ in Context.§_-3QG§.§_-3Tq§)
         {
            if(_loc1_.gender == Context.cityPlayer.avatarAppearance.gender || _loc1_.gender == §_-3uA§.§_-7si§)
            {
               if(this.§_-5yB§ >= _loc1_.§_-25C§)
               {
                  _loc2_ = Context.cityPlayer.§_-7AS§.§_-Bj3§(_loc1_.id);
                  if(!_loc2_.§_-AK6§)
                  {
                     return true;
                  }
               }
            }
         }
         return false;
      }
      
      public function clone() : §_-72r§
      {
         return §_-A8q§.§_-7t§(this);
      }
   }
}

