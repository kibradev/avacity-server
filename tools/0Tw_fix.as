package §_-AdD§
{
   import §_-10I§.§_-5VC§;
   import §_-10I§.§_-BDv§;
   import §_-1Vu§.§_-Awf§;
   import §_-23V§.§_-qo§;
   import §_-2FH§.§_-6I5§;
   import §_-38A§.§_-9TB§;
   import §_-3VF§.§_-0nG§;
   import §_-40e§.§_-1m0§;
   import §_-4Ms§.§_-1IG§;
   import §_-5MD§.InteractiveObject;
   import §_-5MD§.§_-CY3§;
   import §_-5g6§.§_-5PC§;
   import §_-62k§.§_-7Mj§;
   import §_-6EN§.§_-BjY§;
   import §_-6Xb§.§_-68O§;
   import §_-70D§.§_-3q7§;
   import §_-70D§.§_-5Jl§;
   import §_-7xl§.§_-7VJ§;
   import §_-8rl§.Relation;
   import §_-99s§.§_-2rp§;
   import §_-9VF§.§_-48g§;
   import §_-9VF§.§_-5ab§;
   import §_-AOz§.AvatarClothesItem;
   import §_-AOz§.Clothes;
   import §_-AOz§.§_-4aX§;
   import §_-AUc§.§_-jp§;
   import §_-B09§.§_-AAS§;
   import §_-BQo§.§_-2r2§;
   import §_-BQo§.§_-BOm§;
   import §_-C-a§.§_-3uA§;
   import §_-GM§.Context;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import penzville.Config;

   public class §_-0Tw§ extends §_-6r6§ implements InteractiveObject
   {
      private static const §_-1mV§:int = 60;

      protected var §_-BFa§:§_-2kW§ = null;

      protected var _inited:Boolean = false;

      private var _lastShoes:Clothes = null;

      private var _skates:Clothes = null;

      private var §_-37R§:§_-9kj§ = null;

      private var §_-78h§:§_-Gg§ = null;

      private var §_-A-l§:§_-5PC§ = null;

      private var §_-AQg§:§_-8QR§ = null;

      private var §_-62e§:Timer = null;

      private var §_-9Yx§:Boolean = false;

      private var §_-fy§:Boolean = false;

      protected var §_-4AK§:Boolean = false;

      private var §_-1nk§:Boolean = false;

      protected var _cityPlayer:§_-48g§ = null;

      private var §_-3OE§:§_-6I5§ = null;

      private var §_-5Bn§:§_-BOm§;

      public function §_-0Tw§(param1:§_-7VJ§ = null, param2:String = "0", param3:String = "")
      {
         super(param1,param2,param3);
         this.§_-5Bn§ = new §_-BOm§(this);
         this.§_-BFa§ = new §_-2kW§();
         this.§_-37R§ = new §_-9kj§();
         this.§_-78h§ = new §_-Gg§();
         this.§_-AQg§ = new §_-8QR§();
         this.§_-62e§ = new Timer(§_-1mV§ * 1000);
         this.§_-62e§.addEventListener(TimerEvent.TIMER,this.§_-87T§);
      }

      override public function destroy() : void
      {
         if(this.§_-BFa§ != null)
         {
            if(this.§_-BFa§.world != null)
            {
               this.§_-BFa§.world.removeObject(this.§_-BFa§);
            }
            this.§_-BFa§.destroy();
            this.§_-BFa§ = null;
         }
         if(this.§_-37R§ != null)
         {
            if(this.§_-37R§.world != null)
            {
               this.§_-37R§.world.removeObject(this.§_-37R§);
            }
            this.§_-37R§.destroy();
            this.§_-37R§ = null;
         }
         if(this.§_-78h§ != null)
         {
            if(this.§_-78h§.world != null)
            {
               this.§_-78h§.world.removeObject(this.§_-78h§);
            }
            this.§_-78h§.destroy();
            this.§_-78h§ = null;
         }
         this.§_-rt§();
         if(this.§_-AQg§ != null)
         {
            if(this.§_-AQg§.world != null)
            {
               this.§_-AQg§.world.removeObject(this.§_-AQg§);
            }
            this.§_-AQg§.destroy();
            this.§_-AQg§ = null;
         }
         if(this.§_-62e§ != null)
         {
            this.§_-62e§.reset();
            this.§_-62e§.removeEventListener(TimerEvent.TIMER,this.§_-87T§);
            this.§_-62e§ = null;
         }
         if(this.§_-3OE§ != null)
         {
            _world.removeObject(this.§_-3OE§);
            this.§_-3OE§ = null;
         }
         super.destroy();
      }

      public function get inited() : Boolean
      {
         return this._inited;
      }

      public function set inited(param1:Boolean) : void
      {
         this._inited = param1;
      }

      public function init() : void
      {
         this.inited = true;
         if(world != null && world is §_-68O§)
         {
            this.visible = !(world as §_-68O§).editMode;
         }
         else
         {
            this.visible = true;
         }
      }

      override public function initObject() : void
      {
         super.initObject();
         if(this.§_-BFa§ != null)
         {
            world.addObject(this.§_-BFa§);
         }
         if(this.§_-37R§ != null)
         {
            world.addObject(this.§_-37R§);
         }
         if(this.§_-78h§ != null)
         {
            world.addObject(this.§_-78h§);
         }
         if(this.§_-AQg§ != null)
         {
            world.addObject(this.§_-AQg§);
         }
      }

      public function get §_-3rJ§() : §_-2kW§
      {
         return this.§_-BFa§;
      }

      override public function set visible(param1:Boolean) : void
      {
         super.visible = param1;
         if(this.§_-BFa§ != null)
         {
            this.§_-BFa§.visible = param1;
         }
         if(this.§_-37R§ != null)
         {
            this.§_-37R§.visible = this.§_-9Yx§ ? false : param1;
         }
         if(§_-6tr§ != null)
         {
            §_-6tr§.updateVisible(this.§_-fy§ ? false : param1);
         }
         if(this.§_-AQg§ != null)
         {
            this.§_-AQg§.visible = param1;
         }
      }

      public function §_-AGW§(param1:Relation) : void
      {
         if(§_-1WA§ != null && §_-1WA§.hintView is §_-1IG§)
         {
            (§_-1WA§.hintView as §_-1IG§).§_-AGW§(param1);
         }
      }

      public function §_-BsV§(param1:int) : void
      {
         if(§_-1WA§ != null && §_-1WA§.hintView is §_-1IG§)
         {
            (§_-1WA§.hintView as §_-1IG§).§_-BsV§(param1);
         }
      }

      public function set §_-5RQ§(param1:Clothes) : void
      {
         this._lastShoes = param1;
      }

      override public function fromModel(param1:§_-5ab§) : void
      {
         var _loc2_:§_-48g§ = param1 as §_-48g§;
         this.updateFromCityInfo(_loc2_);
         this.updateClothesFromModel(_loc2_);
         super.fromModel(param1);
         §_-0nG§.instance.gameHelper.§_-GW§(this,_loc2_);
         this.§_-78h§.§_-62B§();
      }

      public function updateClothesFromModel(param1:§_-48g§) : void
      {
         this._cityPlayer = param1;
         this.updateFromCityInfo(this._cityPlayer);
         if(!param1.cityInfo.tempClothes.isEmpty)
         {
            this.§_-5Bn§.updateFromCityInfo(param1);
         }
      }

      public function getInteractiveMenu(param1:Avatar) : §_-CY3§
      {
         if(this.§_-4AK§ || this.§_-1nk§)
         {
            return null;
         }
         if(param1 is §_-0Tw§ && (param1 as §_-0Tw§).§_-9UF§)
         {
            return null;
         }
         if(param1.userId == userId)
         {
            return new §_-5VC§(this,param1);
         }
         return new §_-BDv§(this,param1);
      }

      public function validateInteractiveAction(param1:Avatar, param2:String) : Boolean
      {
         return false;
      }

      public function applyInteractiveAction(param1:Avatar, param2:String, param3:Object = null) : void
      {
      }

      public function getInteractPoint(param1:Avatar, param2:String, param3:§_-9TB§ = null) : §_-9TB§
      {
         return null;
      }

      public function get §_-CcD§() : Boolean
      {
         return this.§_-4AK§;
      }

      public function set §_-CcD§(param1:Boolean) : void
      {
         this.§_-4AK§ = param1;
      }

      public function get §_-9UF§() : Boolean
      {
         return this.§_-1nk§;
      }

      public function set §_-9UF§(param1:Boolean) : void
      {
         this.§_-1nk§ = param1;
      }

      override public function addAction(param1:§_-qo§, param2:int = -1, param3:int = 0) : void
      {
         if(this.§_-4AK§)
         {
            return;
         }
         if(this.§_-3ur§(param1))
         {
            return;
         }
         super.addAction(param1,param2,param3);
      }

      private function §_-3ur§(param1:§_-qo§) : Boolean
      {
         return this.§_-1nk§ && !(param1 is §_-AAS§ || param1 is §_-5Jl§ || param1 is §_-3q7§);
      }

      public function §_-3jJ§(param1:§_-5ab§) : void
      {
         var _loc3_:AvatarClothesItem = null;
         var _loc4_:§_-Awf§ = null;
         if(param1 == null)
         {
            return;
         }
         this._lastShoes = null;
         var _loc2_:String = param1.avatarAppearance.gender == §_-3uA§.§_-908§ ? §_-BjY§.§_-5b4§ : §_-BjY§.§_-AiE§;
         for each(_loc3_ in param1.avatarClothes.getClothes())
         {
            _loc4_ = _loc3_.clothesItem;
            if(_loc4_ != null && _loc4_.findParentCategory(_loc2_) != null)
            {
               this._lastShoes = new Clothes(_loc4_.name,_loc4_.library,_loc3_.colorId);
               return;
            }
         }
      }

      public function §_-07F§(param1:String) : void
      {
         var skatesShopItem:§_-2rp§ = null;
         var hasSkates:Boolean = false;
         var indexSkates:int = 0;
         var typeId:String = param1;
         if(typeId != null)
         {
            skatesShopItem = Context.§_-70S§.§_-0ZU§().findTypeById(typeId) as §_-2rp§;
            if(skatesShopItem == null)
            {
               return;
            }
            this._skates = new Clothes(skatesShopItem.name,sex == §_-3uA§.§_-908§ ? Config.§_-2X2§ : Config.§_-4Hw§);
            if(this._lastShoes == null)
            {
               hasSkates = Boolean(§_-9U9§.clothes.some(function(param1:Clothes, param2:int, param3:Array):Boolean
               {
                  return param1.clotheId == _skates.clotheId;
               }));
               if(!hasSkates)
               {
                  §_-9U9§.clothes.push(this._skates);
               }
               else
               {
                  §_-9U9§.clothes.some(function(param1:Clothes, param2:int, param3:Array):Boolean
                  {
                     if(param1.clotheId == _skates.clotheId)
                     {
                        param3[param2] = _skates;
                        return true;
                     }
                     return false;
                  });
               }
            }
            else
            {
               §_-9U9§.clothes.some(function(param1:Clothes, param2:int, param3:Array):Boolean
               {
                  if(param1.clotheId == _lastShoes.clotheId)
                  {
                     param3[param2] = _skates;
                     return true;
                  }
                  return false;
               });
            }
         }
         else
         {
            if(this._skates == null)
            {
               return;
            }
            if(this._lastShoes == null && §_-9U9§.clothes.length > 1)
            {
               indexSkates = int(§_-9U9§.clothes.indexOf(this._skates));
               if(indexSkates < 1)
               {
                  return;
               }
               §_-9U9§.clothes.splice(indexSkates,1);
            }
            else
            {
               §_-9U9§.clothes.some(function(param1:Clothes, param2:int, param3:Array):Boolean
               {
                  if(param1.clotheId == _skates.clotheId)
                  {
                     param3[param2] = _lastShoes;
                     return true;
                  }
                  return false;
               });
            }
            this._skates = null;
         }
         redecorateSkeleton();
      }

      public function hasSkates() : Boolean
      {
         return this._skates != null;
      }

      public function get skates() : Clothes
      {
         return this._skates;
      }

      public function get trophy() : §_-9kj§
      {
         return this.§_-37R§;
      }

      public function §_-886§(param1:Boolean) : void
      {
         this.§_-9Yx§ = param1;
         if(this.§_-37R§ != null)
         {
            this.§_-37R§.visible = !param1;
         }
      }

      public function §_-0ya§(param1:Boolean) : void
      {
         this.§_-fy§ = param1;
         if(§_-6tr§ != null)
         {
            §_-6tr§.updateVisible(!param1);
         }
      }

      public function §_-1GB§(param1:String, param2:String, param3:String) : void
      {
         this.§_-62e§.reset();
         this.§_-AQg§.show(param1,param2,param3);
         this.§_-37R§.visible = false;
         this.§_-62e§.start();
      }

      private function §_-87T§(param1:TimerEvent) : void
      {
         this.§_-62e§.reset();
         this.§_-AQg§.hide();
         this.§_-37R§.visible = true;
      }

      public function showHintArrow() : void
      {
         this.§_-78h§.§_-0bG§(§_-Gg§.§_-1-0§);
      }

      public function §_-B7v§(param1:§_-5PC§) : void
      {
         this.§_-rt§();
         this.§_-A-l§ = param1;
         this.§_-A-l§.wx = wx + cellOffset.x + headOffset.x;
         this.§_-A-l§.wy = wy + cellOffset.y + headOffset.y;
         this.§_-A-l§.wz = wz + 6 + headOffset.z;
         world.addObject(this.§_-A-l§);
      }

      public function §_-rt§() : void
      {
         if(this.§_-A-l§ != null)
         {
            if(this.§_-A-l§.world != null)
            {
               this.§_-A-l§.world.removeObject(this.§_-A-l§);
            }
            this.§_-A-l§.destroy();
            this.§_-A-l§ = null;
         }
      }

      public function §_-2Pj§() : Boolean
      {
         return §_-B33§ != null;
      }

      override public function syncClothesAndHairs(param1:§_-7Mj§, param2:§_-4aX§) : void
      {
         super.syncClothesAndHairs(param1,param2);
         §_-9U9§.syncTempClothes(this.§_-5Bn§);
         if(this._skates != null)
         {
            this.§_-07F§(this._cityPlayer.cityInfo.§_-AeI§);
         }
      }

      public function §_-6WT§() : void
      {
         §_-8Dv§(this._cityPlayer.avatarAppearance,this._cityPlayer.avatarClothes != null && this._cityPlayer.avatarClothes.canShowBeard());
      }

      public function §_-2x-§(param1:§_-4aX§) : void
      {
         super.§_-6ih§(this._cityPlayer.avatarAppearance,param1);
      }

      public function §_-6UW§() : void
      {
         this.§_-6WT§();
         this.syncClothesAndHairs(this._cityPlayer.avatarAppearance,this._cityPlayer.avatarClothes);
         redecorateSkeleton();
      }

      public function get drone() : §_-6I5§
      {
         return this.§_-3OE§;
      }

      public function set drone(param1:§_-6I5§) : void
      {
         this.§_-3OE§ = param1;
      }

      override protected function invalidatePosition() : void
      {
         var _loc1_:§_-9TB§ = this.headOffset;
         if(this.§_-BFa§ != null)
         {
            this.§_-BFa§.wx = wx + cellOffset.x + _loc1_.x;
            this.§_-BFa§.wy = wy + cellOffset.y + _loc1_.y;
            this.§_-BFa§.wz = 5.5 + _loc1_.z;
         }
         if(this.§_-37R§ != null)
         {
            this.§_-37R§.wx = wx + cellOffset.x + _loc1_.x;
            this.§_-37R§.wy = wy + cellOffset.y + _loc1_.y;
            this.§_-37R§.wz = wz + 6 + _loc1_.z;
         }
         if(this.§_-78h§ != null)
         {
            this.§_-78h§.wx = wx + cellOffset.x + _loc1_.x;
            this.§_-78h§.wy = wy + cellOffset.y + _loc1_.y;
            this.§_-78h§.wz = wz + 6 + _loc1_.z;
         }
         if(this.§_-A-l§ != null)
         {
            this.§_-A-l§.wx = wx + cellOffset.x + _loc1_.x;
            this.§_-A-l§.wy = wy + cellOffset.y + _loc1_.y;
            this.§_-A-l§.wz = wz + 6 + _loc1_.z;
         }
         if(this.§_-AQg§ != null)
         {
            this.§_-AQg§.wx = wx + cellOffset.x + _loc1_.x;
            this.§_-AQg§.wy = wy + cellOffset.y + _loc1_.y;
            this.§_-AQg§.wz = wz + 4.5 + _loc1_.z;
         }
         super.invalidatePosition();
      }

      override protected function onCityInfoChanged(param1:§_-1m0§) : void
      {
         super.onCityInfoChanged(param1);
         if(Context.cityPlayer.id != userId)
         {
            return;
         }
         this.updateFromCityInfo(Context.cityPlayer);
      }

      protected function updateFromCityInfo(param1:§_-48g§) : void
      {
         if(param1.cityInfo != null)
         {
            this.§_-37R§.§_-9zg§(param1.cityInfo);
         }
         this.§_-3jJ§(param1);
      }

      public function get tempClothes() : §_-BOm§
      {
         return this.§_-5Bn§;
      }

      public function addEffect(param1:§_-jp§) : void
      {
         §_-4HT§.addAnimationEffect(param1);
      }

      public function get decor() : §_-2r2§
      {
         return §_-9U9§;
      }

      public function get cityPlayer() : §_-48g§
      {
         return this._cityPlayer;
      }
   }
}
