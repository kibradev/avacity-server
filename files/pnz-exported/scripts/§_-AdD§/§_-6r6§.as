package §_-AdD§
{
   import §_-0g5§.§_-1Fl§;
   import §_-0g5§.§_-5JM§;
   import §_-22f§.§_-77s§;
   import §_-23V§.§_-qo§;
   import §_-38A§.§_-9TB§;
   import §_-40e§.§_-1m0§;
   import §_-4Ms§.§_-1IG§;
   import §_-4Ms§.§_-5VT§;
   import §_-4Ms§.§_-77P§;
   import §_-5MD§.§_-39M§;
   import §_-5g6§.§_-5zA§;
   import §_-70D§.§_-15j§;
   import §_-70D§.§_-3XM§;
   import §_-70D§.§_-5RF§;
   import §_-70D§.§_-BnQ§;
   import §_-70D§.§_-Cv§;
   import §_-7xl§.§_-7VJ§;
   import §_-9VF§.§_-3yI§;
   import §_-9VF§.§_-48g§;
   import §_-9VF§.§_-5ab§;
   import §_-9VF§.§_-9df§;
   import §_-A28§.§_-4Oj§;
   import §_-A28§.§_-803§;
   import §_-C-a§.§_-3PG§;
   import §_-CF9§.§_-1Pv§;
   import §_-CF9§.§_-CKO§;
   import §_-GM§.Context;
   import §_-ny§.§_-69X§;
   import flash.events.Event;
   import penzville.Application;
   
   public class §_-6r6§ extends §_-3rH§ implements §_-2MO§
   {
      protected var §_-1WA§:§_-77P§ = null;
      
      protected var _level:int = 0;
      
      protected var §_-4yi§:§_-39M§ = null;
      
      private var §_-0VD§:String = null;
      
      public function §_-6r6§(param1:§_-7VJ§ = null, param2:String = "0", param3:String = "")
      {
         super(param1,param2,param3);
         this.§_-1WA§ = §_-5VT§.§_-2Pl§(this);
         Application.instance.addEventListener(§_-1m0§.§_-BZg§,this.onCityInfoChanged);
      }
      
      override public function initObject() : void
      {
         super.initObject();
         if(this.§_-1WA§ != null)
         {
            world.addObject(this.§_-1WA§);
         }
      }
      
      override public function fromModel(param1:§_-5ab§) : void
      {
         var _loc2_:§_-48g§ = param1 as §_-48g§;
         if(_loc2_.clanInfo != null)
         {
            this.§_-0VD§ = _loc2_.clanInfo.tag;
         }
         §_-6tr§.setShadow(§_-7mM§.§_-COV§(this as Avatar,_loc2_.cityInfo.personalAnimations.§_-a§));
         super.fromModel(param1);
         this.updateHint(_loc2_);
         this._level = _loc2_.cityInfo.level;
      }
      
      override public function get avatarName() : String
      {
         return this.§_-0VD§ != null ? "[" + this.§_-0VD§ + "]" + userName : userName;
      }
      
      public function get level() : int
      {
         return this._level;
      }
      
      override public function setAnimation(param1:String, param2:Object = null) : void
      {
         super.setAnimation(param1,param2);
         this.invalidatePosition();
      }
      
      override public function set visible(param1:Boolean) : void
      {
         super.visible = param1;
         if(this.§_-1WA§ != null)
         {
            this.§_-1WA§.visible = param1;
         }
      }
      
      public function §_-66F§() : void
      {
         if(this.§_-1WA§ == null)
         {
            return;
         }
         this.§_-1WA§.updateLabel(this.avatarName);
      }
      
      override protected function onActionStart(param1:Event) : void
      {
         super.onActionStart(param1);
         var _loc2_:§_-qo§ = param1 is §_-77s§ ? (param1 as §_-77s§).§_-9oy§ : param1.currentTarget as §_-qo§;
         if(this.§_-4yi§ != null && !(_loc2_ is §_-BnQ§) && !(_loc2_ is §_-5RF§) && !(_loc2_ is §_-3XM§) && !(_loc2_ is §_-15j§) && !(_loc2_ is §_-1Fl§) && !(_loc2_ is §_-803§) && !(_loc2_ is §_-4Oj§))
         {
            this.§_-4Fs§();
         }
      }
      
      public function sitDown(param1:§_-39M§, param2:String = null) : Boolean
      {
         if(param1.addSitActor(this,param2))
         {
            this.§_-4yi§ = param1;
            §_-6tr§.fadeOut();
            return true;
         }
         return false;
      }
      
      public function §_-4Fs§() : void
      {
         if(this.§_-4yi§ != null && !(this.§_-4yi§ as §_-5zA§).destroyed)
         {
            this.§_-4yi§.removeSitActor(this);
            this.§_-4yi§ = null;
            §_-6tr§.fadeIn();
            wz = 0;
         }
      }
      
      public function get sitObject() : §_-39M§
      {
         return this.§_-4yi§;
      }
      
      public function set sitObject(param1:§_-39M§) : void
      {
         this.§_-4yi§ = param1;
      }
      
      public function get hint() : §_-77P§
      {
         return this.§_-1WA§;
      }
      
      public function §_-7WH§(param1:§_-48g§) : void
      {
         if(this.sitObject != null)
         {
            if(this.sitObject is §_-CKO§ && !§_-69X§.§_-3yo§(param1.avatarClothes,§_-69X§.§_-6P7§) || this.sitObject is §_-1Pv§ && !§_-69X§.§_-3yo§(param1.avatarClothes,§_-69X§.§_-6P7§))
            {
               this.§_-4Fs§();
               addAction(new §_-Cv§());
            }
         }
      }
      
      protected function updateHint(param1:§_-48g§) : void
      {
         var _loc4_:§_-1IG§ = null;
         var _loc5_:int = 0;
         var _loc2_:§_-9df§ = param1.cityInfo;
         var _loc3_:§_-3yI§ = param1.userInfo;
         if(this.§_-1WA§ != null)
         {
            this.§_-66F§();
            _loc4_ = this.§_-1WA§.hintView as §_-1IG§;
            if(_loc4_ != null)
            {
               _loc4_.§_-AGW§(Context.§_-AI9§.§_-112§(Context.player.id,userId));
               _loc4_.§_-5pC§(_loc2_.level,_loc2_.clothesRating,_loc2_.houseRating,_loc2_.reputation);
               _loc5_ = §_-1IG§.§_-COl§;
               if(_loc3_.§_-3CQ§ > §_-3yI§.§_-8UU§ && _loc3_.§_-3CQ§ < §_-3yI§.§_-0GF§ && _loc2_.§_-2u§)
               {
                  _loc5_ = §_-1IG§.§_-0FG§;
               }
               else if(_loc3_.role == §_-3yI§.§_-0GF§ && _loc2_.§_-2u§)
               {
                  _loc5_ = §_-1IG§.§_-AkF§;
               }
               else if(param1.§_-3k5§)
               {
                  _loc5_ = §_-1IG§.§_-3Wz§;
               }
               _loc4_.§_-BsV§(_loc5_);
            }
         }
      }
      
      protected function §_-6RO§() : void
      {
         var _loc1_:§_-9TB§ = null;
         if(this.§_-1WA§ != null)
         {
            _loc1_ = this.headOffset;
            this.§_-1WA§.wx = wx + cellOffset.x + _loc1_.x;
            this.§_-1WA§.wy = wy + cellOffset.y + _loc1_.y;
            this.§_-1WA§.wz = 4.5 + _loc1_.z;
         }
      }
      
      override protected function invalidatePosition() : void
      {
         super.invalidatePosition();
         this.§_-6RO§();
      }
      
      override protected function get headOffset() : §_-9TB§
      {
         switch(§_-9ax§)
         {
            case §_-3PG§.§_-BBz§:
            case §_-3PG§.§_-CaW§:
               return §_-5JM§.§_-XG§[direction % 8];
            case §_-3PG§.§_-97h§:
               return §_-5JM§.§_-Mk§[direction % 8];
            case §_-3PG§.§_-3eD§:
               return §_-5JM§.§_-89s§[direction % 8];
            default:
               return super.headOffset;
         }
      }
      
      protected function onCityInfoChanged(param1:§_-1m0§) : void
      {
         if(Context.cityPlayer.id != userId)
         {
            return;
         }
         var _loc2_:§_-48g§ = Context.cityPlayer;
         §_-6tr§.setShadow(§_-7mM§.§_-COV§(this as Avatar,_loc2_.cityInfo.personalAnimations.§_-a§));
         §_-6tr§.updatePosition();
         this.updateHint(_loc2_);
         this._level = _loc2_.cityInfo.level;
      }
      
      private function §_-2be§() : void
      {
         if(this.§_-1WA§ != null)
         {
            if(this.§_-1WA§.world != null)
            {
               this.§_-1WA§.world.removeObject(this.§_-1WA§);
            }
            this.§_-1WA§.destroy();
            this.§_-1WA§ = null;
         }
      }
      
      override public function destroy() : void
      {
         if(destroyed)
         {
            return;
         }
         this.§_-2be§();
         Application.instance.removeEventListener(§_-1m0§.§_-BZg§,this.onCityInfoChanged);
         this.§_-4Fs§();
         super.destroy();
      }
   }
}

