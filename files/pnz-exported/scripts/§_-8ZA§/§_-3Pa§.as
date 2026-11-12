package §_-8ZA§
{
   import §_-0Uz§.§_-m3§;
   import §_-39l§.§_-5t6§;
   import §_-45g§.§_-CKP§;
   import §_-5Zh§.§_-19w§;
   import §_-5Zh§.§_-1nw§;
   import §_-5Zh§.§_-Bsz§;
   import §_-6-L§.§_-49j§;
   import §_-76Z§.§_-2jg§;
   import §_-9MY§.§_-B1c§;
   import §_-9MY§.§_-BL4§;
   import §_-9VF§.§_-48g§;
   import §_-GM§.Context;
   import §_-uR§.§_-53f§;
   import ags.§_-5x-§;
   
   public class §_-3Pa§ extends §_-53f§ implements §_-m3§
   {
      private var _netManager:§_-Afo§ = null;
      
      public function §_-3Pa§()
      {
         super();
      }
      
      public function init() : void
      {
         this._netManager = new §_-Afo§();
         this._netManager.addEventListener(§_-ZI§.§_-7Xt§,this.§_-97C§);
         this._netManager.addEventListener(§_-CKP§.§_-40G§,this.§_-3E6§);
         this._netManager.addEventListener(§_-ZI§.§_-4Vv§,this.§_-8AA§);
         this._netManager.addEventListener(§_-ZI§.§_-9d2§,this.§_-8-T§);
         this._netManager.addEventListener(§_-ZI§.§_-2xo§,this.§_-1t0§);
      }
      
      public function set netClient(param1:§_-5x-§) : void
      {
         this._netManager.netClient = param1;
      }
      
      private function §_-97C§(param1:§_-ZI§) : void
      {
         §_-5t6§.instance.§_-BgL§(param1.clanMember);
      }
      
      private function §_-3E6§(param1:§_-ZI§) : void
      {
         var _loc2_:§_-ZI§ = new §_-ZI§(§_-CKP§.§_-40G§,param1.clanMember);
         dispatchEvent(_loc2_);
      }
      
      private function §_-8AA§(param1:§_-ZI§) : void
      {
         §_-5t6§.instance.§_-APT§(param1.userId);
      }
      
      private function §_-8-T§(param1:§_-ZI§) : void
      {
         dispatchEvent(param1);
      }
      
      public function §_-5Ee§(param1:§_-1nw§) : Array
      {
         if(Context.cityPlayer.clanInfo == null)
         {
            return null;
         }
         if(Context.cityPlayer.id == String(param1.userId))
         {
            return null;
         }
         if(Context.cityPlayer.clanInfo.role <= param1.role)
         {
            return null;
         }
         var _loc2_:Array = [];
         if(§_-2jg§.§_-67i§(§_-BL4§.MAKE_MEMBER,Context.cityPlayer.clanInfo.role))
         {
            _loc2_.push(§_-B1c§.MEMBER);
         }
         if(§_-2jg§.§_-67i§(§_-BL4§.MAKE_MASTER,Context.cityPlayer.clanInfo.role))
         {
            _loc2_.push(§_-B1c§.MASTER);
         }
         if(§_-2jg§.§_-67i§(§_-BL4§.MAKE_CREATOR,Context.cityPlayer.clanInfo.role))
         {
            _loc2_.push(§_-B1c§.CREATOR);
         }
         §_-49j§.remove(_loc2_,param1.role);
         return _loc2_;
      }
      
      public function §_-8bl§(param1:String, param2:int, param3:String = null) : void
      {
         this._netManager.§_-8bl§(param1,param2,param3);
      }
      
      public function §_-940§() : void
      {
         this._netManager.§_-940§();
      }
      
      public function removeMember(param1:String) : void
      {
         this._netManager.removeMember(param1);
      }
      
      public function §_-AOO§(param1:String) : void
      {
         this._netManager.§_-AOO§(param1);
      }
      
      public function §_-82v§(param1:String) : void
      {
         this._netManager.§_-82v§(param1);
      }
      
      public function §_-8g2§(param1:§_-Bsz§) : void
      {
         this._netManager.§_-8g2§(param1);
      }
      
      public function §_-9wK§(param1:§_-48g§, param2:int = -1) : Boolean
      {
         var _loc4_:§_-19w§ = null;
         var _loc5_:§_-1nw§ = null;
         if(Context.cityPlayer.clanInfo == null || Context.cityPlayer.clanInfo.role < §_-B1c§.MASTER)
         {
            return false;
         }
         var _loc3_:int = param2;
         if(_loc3_ == -1)
         {
            _loc4_ = §_-5t6§.instance.§_-5Dg§(Context.cityPlayer.clanInfo.clanId);
            _loc5_ = _loc4_.getClanMember(param1.id);
            _loc3_ = _loc5_ != null ? _loc5_.role : -1;
         }
         switch(_loc3_)
         {
            case §_-B1c§.NOVICE:
               return §_-2jg§.§_-67i§(§_-BL4§.BAN_NOVICE,Context.cityPlayer.clanInfo.role);
            case §_-B1c§.MEMBER:
               return §_-2jg§.§_-67i§(§_-BL4§.BAN_MEMBER,Context.cityPlayer.clanInfo.role);
            case §_-B1c§.MASTER:
               return §_-2jg§.§_-67i§(§_-BL4§.BAN_MASTER,Context.cityPlayer.clanInfo.role);
            case §_-B1c§.CREATOR:
               return false;
            default:
               return §_-2jg§.§_-67i§(§_-BL4§.BAN_OTHER_USER,Context.cityPlayer.clanInfo.role);
         }
      }
      
      private function §_-1t0§(param1:§_-ZI§) : void
      {
         dispatchEvent(new §_-ZI§(§_-ZI§.§_-2xo§,param1.userId));
      }
      
      override public function destroy() : void
      {
         if(destroyed)
         {
            return;
         }
         this._netManager.removeEventListener(§_-ZI§.§_-7Xt§,this.§_-97C§);
         this._netManager.removeEventListener(§_-CKP§.§_-40G§,this.§_-3E6§);
         this._netManager.removeEventListener(§_-ZI§.§_-4Vv§,this.§_-8AA§);
         this._netManager.removeEventListener(§_-ZI§.§_-9d2§,this.§_-8-T§);
         this._netManager.removeEventListener(§_-ZI§.§_-2xo§,this.§_-1t0§);
         super.destroy();
      }
   }
}

