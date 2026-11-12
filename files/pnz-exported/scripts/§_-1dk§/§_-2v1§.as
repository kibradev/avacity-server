package §_-1dk§
{
   import §_-1t9§.§_-4Wb§;
   import §_-40e§.§_-1m0§;
   import §_-6BB§.§_-8BS§;
   import §_-GM§.Context;
   import §_-uR§.§_-53f§;
   import penzville.Config;
   
   public class §_-2v1§ extends §_-53f§
   {
      private var §_-Bkm§:Array = null;
      
      private var §_-9Rl§:Array = null;
      
      private var _inited:Boolean = false;
      
      private var §_-CVe§:Boolean = false;
      
      public function §_-2v1§()
      {
         super();
      }
      
      public function init() : void
      {
         Context.§_-2BT§.getUserFriendProfiles(this.§_-3Zz§);
         if(Config.socialNetwork != §_-8BS§.TGC && Config.socialNetwork != §_-8BS§.§_-AhK§)
         {
            Context.§_-2BT§.getUserAppFriendProfiles(this.§_-0p7§);
         }
      }
      
      public function §_-1VM§() : void
      {
         if(this.§_-Bkm§ == null)
         {
            this.§_-CVe§ = true;
         }
         else
         {
            this.§_-3x6§();
         }
      }
      
      private function §_-3Zz§(param1:Array) : void
      {
         this.§_-9Rl§ = param1;
         if(Config.socialNetwork == §_-8BS§.TGC || Config.socialNetwork == §_-8BS§.§_-AhK§)
         {
            this.§_-0p7§(param1);
         }
      }
      
      private function §_-0p7§(param1:Array) : void
      {
         this.§_-Bkm§ = param1;
         if(this.§_-CVe§)
         {
            this.§_-3x6§();
         }
      }
      
      private function §_-3x6§() : void
      {
         Context.§_-3B2§.§_-C7w§(this.§_-9fV§,this.§_-0wO§);
      }
      
      public function §_-62H§(param1:String) : Boolean
      {
         return this.§_-9fV§.indexOf(param1) >= 0;
      }
      
      public function get §_-74K§() : Array
      {
         return this.§_-9Rl§;
      }
      
      public function get §_-28Z§() : Array
      {
         return this.§_-Bkm§;
      }
      
      public function §_-Bdq§() : Object
      {
         var _loc2_:§_-4Wb§ = null;
         if(this.§_-9Rl§ == null || this.§_-Bkm§ == null)
         {
            return {};
         }
         var _loc1_:Object = {};
         for each(_loc2_ in this.§_-9Rl§)
         {
            if(this.§_-9fV§.indexOf(_loc2_.id) < 0)
            {
               _loc1_[_loc2_.id] = _loc2_;
            }
         }
         return _loc1_;
      }
      
      public function get §_-9fV§() : Array
      {
         var _loc2_:§_-4Wb§ = null;
         if(this.§_-Bkm§ == null)
         {
            return [];
         }
         var _loc1_:Array = [];
         for each(_loc2_ in this.§_-Bkm§)
         {
            _loc1_.push(_loc2_.id);
         }
         return _loc1_;
      }
      
      public function get §_-AB2§() : Object
      {
         return Context.§_-3B2§.§_-8kP§(this.§_-9fV§);
      }
      
      private function §_-0wO§(param1:Array) : void
      {
         this._inited = true;
         dispatchEvent(new §_-1m0§(§_-1m0§.§_-9WQ§));
      }
      
      public function get inited() : Boolean
      {
         return this._inited;
      }
   }
}

