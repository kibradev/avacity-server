package §_-AdD§
{
   import §_-0Lb§.§_-3iC§;
   import §_-0g5§.§_-0Ik§;
   import §_-0g5§.§_-1AA§;
   import §_-0g5§.§_-1bn§;
   import §_-0g5§.§_-62M§;
   import §_-0g5§.§_-7Rm§;
   import §_-0g5§.§_-8i7§;
   import §_-18o§.§_-7sG§;
   import §_-1Fx§.§_-5n7§;
   import §_-1Vu§.§_-Awf§;
   import §_-1k2§.§_-07w§;
   import §_-1k2§.§_-97v§;
   import §_-2U3§.ResourceManager;
   import §_-2yS§.§_-8KK§;
   import §_-38V§.§_-1F§;
   import §_-38V§.§_-1bg§;
   import §_-5Us§.§_-AyA§;
   import §_-5g6§.§_-3ba§;
   import §_-5g6§.§_-42q§;
   import §_-6-L§.§_-49j§;
   import §_-62k§.§_-7Mj§;
   import §_-6EA§.§_-Cb1§;
   import §_-70D§.§_-1cD§;
   import §_-70D§.§_-3q7§;
   import §_-70D§.§_-5Jl§;
   import §_-70D§.§_-6H§;
   import §_-7xl§.§_-7VJ§;
   import §_-90R§.§_-aZ§;
   import §_-9VF§.§_-5ab§;
   import §_-AOz§.AvatarClothesItem;
   import §_-AOz§.Clothes;
   import §_-AOz§.§_-4aX§;
   import §_-AUc§.Hair;
   import §_-AUc§.§_-3L0§;
   import §_-AUc§.§_-3lX§;
   import §_-AUc§.§_-AB-§;
   import §_-AUc§.§_-Bsn§;
   import §_-AaA§.§_-Bjj§;
   import §_-BQo§.§_-2r2§;
   import §_-C-a§.§_-3PG§;
   import §_-C-a§.§_-3uA§;
   import §_-CBS§.§_-3Nk§;
   import §_-GM§.Context;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.geom.Point;
   
   public class Avatar extends §_-8KK§
   {
      public static const §_-2ta§:int = 1;
      
      public static const §_-4Gp§:int = 2;
      
      public static const §_-13W§:int = 3;
      
      public static const §_-7j9§:int = 4;
      
      public static const LAYER_TOP:int = 5;
      
      protected var _view:DisplayObject = null;
      
      protected var §_-4HT§:§_-07w§ = null;
      
      protected var §_-0gG§:int = 1;
      
      protected var §_-AGA§:String = "";
      
      protected var §_-XT§:§_-7VJ§ = null;
      
      protected var §_-9U4§:§_-1bg§ = null;
      
      protected var §_-9ax§:String = null;
      
      protected var §_-BLS§:Boolean = false;
      
      protected var §_-9U9§:§_-2r2§ = null;
      
      protected var §_-1ws§:§_-5n7§ = null;
      
      protected var §_-Ih§:§_-5n7§ = null;
      
      protected var §_-Nc§:§_-5n7§ = null;
      
      protected var §_-9kk§:§_-5n7§ = null;
      
      protected var §_-Xy§:§_-5n7§ = null;
      
      protected var §_-1UJ§:§_-7VJ§ = null;
      
      private var _userId:§_-Cb1§ = new §_-Cb1§(0);
      
      public function Avatar(param1:§_-7VJ§ = null, param2:String = "0", param3:String = "")
      {
         super(§_-42q§.§_-2MB§);
         this._userId.value = isNaN(parseInt(param2)) ? this.generateId() : int(parseInt(param2));
         this.§_-AGA§ = param3;
         _direction = §_-aZ§.SW;
         this.§_-XT§ = param1;
         this.§_-1ws§ = new §_-5n7§();
         container.addChild(this.§_-1ws§);
         this.§_-Ih§ = new §_-5n7§();
         container.addChild(this.§_-Ih§);
         this.§_-Nc§ = new §_-5n7§();
         container.addChild(this.§_-Nc§);
         this.§_-9kk§ = new §_-5n7§();
         container.addChild(this.§_-9kk§);
         this.§_-Xy§ = new §_-5n7§();
         container.addChild(this.§_-Xy§);
         §_-4TH§ = new Point(32,0);
         cellOffset = new Point(0.5,0.5);
         setSize(1,1,4);
         mouseCursor = §_-Bjj§.HAND;
         this.§_-4HT§ = this.§_-2fI§();
         this.§_-9U9§ = this.§_-4HT§.§_-1rR§;
      }
      
      public function addClothes(param1:Clothes) : void
      {
         this.§_-9U9§.clothes.push(param1);
      }
      
      public function §_-00r§(param1:§_-3lX§) : void
      {
         this.§_-9U9§.§_-ZA§.push(param1);
      }
      
      public function set §_-BAT§(param1:Hair) : void
      {
         this.§_-9U9§.§_-BAT§ = param1;
      }
      
      public function get §_-BAT§() : Hair
      {
         return this.§_-9U9§.§_-BAT§;
      }
      
      public function set colors(param1:Array) : void
      {
         this.§_-9U9§.colors = param1;
      }
      
      public function get colors() : Array
      {
         return this.§_-9U9§.colors;
      }
      
      public function get sex() : int
      {
         return this.§_-0gG§;
      }
      
      public function set sex(param1:int) : void
      {
         this.§_-0gG§ = param1;
      }
      
      public function clearClothes() : void
      {
         this.§_-9U9§.clothes = [];
      }
      
      public function §_-6Yk§() : void
      {
         this.§_-9U9§.§_-ZA§ = [];
      }
      
      public function removeClothes(param1:Clothes) : void
      {
         §_-49j§.remove(this.§_-9U9§.clothes,param1);
      }
      
      public function get §_-ZA§() : Array
      {
         return this.§_-9U9§.§_-ZA§;
      }
      
      public function get clothes() : Array
      {
         return this.§_-9U9§.clothes;
      }
      
      public function get userId() : String
      {
         return String(this._userId.value);
      }
      
      public function get userName() : String
      {
         return this.§_-AGA§;
      }
      
      public function set userName(param1:String) : void
      {
         this.§_-AGA§ = param1;
      }
      
      public function getSide(param1:int) : §_-3Nk§
      {
         return §_-7sG§.§_-B5L§(param1 % 8);
      }
      
      public function redecorateSkeleton() : void
      {
         if(this.§_-4HT§ == null)
         {
            return;
         }
         this.§_-4HT§.redecorateSkeleton(this.§_-9U9§);
      }
      
      protected function createView(param1:String, param2:String, param3:Boolean = false, param4:Boolean = true) : DisplayObject
      {
         if(!Context.settings.cacheEnabled)
         {
            param4 = false;
         }
         this.§_-4HT§.update(param1,§_-3uA§.toString(this.§_-0gG§),param2,param3,this.§_-9U9§.colors,param4);
         if(!this.§_-4HT§.§_-72a§)
         {
            this.§_-4HT§.redecorateSkeleton(this.§_-9U9§);
         }
         return this.§_-4HT§.rootView;
      }
      
      public function flushCache() : void
      {
      }
      
      public function §_-73O§() : DisplayObject
      {
         return this._view;
      }
      
      override public function setAnimation(param1:String, param2:Object = null) : void
      {
         if(this.§_-BLS§)
         {
            return;
         }
         if(param2 == null)
         {
            param2 = {};
         }
         var _loc3_:Boolean = true;
         if(param2.hasOwnProperty("loop"))
         {
            _loc3_ = Boolean(param2["loop"]);
         }
         if(Boolean(param2.hasOwnProperty("library")) && ResourceManager.§_-7Bo§(param2["library"]))
         {
            if(this.§_-1UJ§ == null)
            {
               this.§_-1UJ§ = this.§_-XT§;
            }
            this.§_-XT§ = ResourceManager.getADF(param2["library"]);
            if(this.§_-4HT§ != null)
            {
               this.§_-4HT§.§_-711§(this.§_-XT§);
            }
         }
         else if(this.§_-1UJ§ != null && this.§_-XT§ != this.§_-1UJ§)
         {
            this.§_-XT§ = this.§_-1UJ§;
            this.§_-1UJ§ = null;
         }
         var _loc4_:Boolean = !!param2.hasOwnProperty("useCache") ? Boolean(param2["useCache"]) : true;
         var _loc5_:§_-3Nk§ = !!param2.hasOwnProperty("direction") ? §_-3Nk§.§_-4vF§(param2["direction"]) : null;
         var _loc6_:§_-3Nk§ = _loc5_ != null ? _loc5_ : this.getSide(screenDirection);
         if(this._view != null)
         {
            if(this._view.parent != null)
            {
               this._view.parent.removeChild(this._view);
            }
            this._view = null;
         }
         if(this.§_-9U4§ != null)
         {
            this.§_-9U4§.destroy();
            this.§_-9U4§ = null;
         }
         this._view = this.createView(param1,_loc6_.side,_loc6_.flipped,_loc4_);
         this.§_-9U4§ = §_-1F§.§_-8Y3§(this._view,param1,!!param2.hasOwnProperty("sequence") ? param2["sequence"] : "default",_loc3_);
         this.§_-9ax§ = param1;
         if(param2.hasOwnProperty("duration"))
         {
            this.§_-9U4§.duration = param2["duration"];
         }
         if(param1 == §_-3PG§.§_-CUz§)
         {
            this.§_-9U4§.stop();
         }
         this.§_-0kG§(this._view,§_-13W§);
      }
      
      public function addItem(param1:§_-Bsn§, param2:Boolean = true) : void
      {
         this.§_-9U9§.items.push(param1);
         if(this.§_-4HT§ == null)
         {
            return;
         }
         if(param2)
         {
            this.§_-4HT§.redecorateSkeleton(this.§_-9U9§);
         }
      }
      
      public function removeItem(param1:§_-Bsn§, param2:Boolean = true) : void
      {
         §_-49j§.remove(this.§_-9U9§.items,param1);
         if(this.§_-4HT§ == null)
         {
            return;
         }
         if(param2)
         {
            this.§_-4HT§.redecorateSkeleton(this.§_-9U9§);
         }
      }
      
      public function getItem(param1:Class) : §_-Bsn§
      {
         var _loc2_:§_-Bsn§ = null;
         for each(_loc2_ in this.§_-9U9§.items)
         {
            if(_loc2_ is param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      override public function tick() : void
      {
         super.tick();
         if(this.§_-9U4§ != null)
         {
            this.§_-9U4§.tick();
         }
         if(this.§_-4HT§ != null && this.§_-4HT§ is §_-3ba§)
         {
            (this.§_-4HT§ as §_-3ba§).tick();
         }
      }
      
      public function fromModel(param1:§_-5ab§) : void
      {
         if(!isNaN(parseInt(param1.id)))
         {
            this._userId.value = parseInt(param1.id);
         }
         _objectId = this.userId;
         this.§_-AGA§ = param1.avatarAppearance.name;
         this.sex = param1.avatarAppearance.gender;
         this.§_-8Dv§(param1.avatarAppearance,param1.canShowBeard());
         this.syncClothesAndHairs(param1.avatarAppearance,param1.avatarClothes);
         this.updateAnimation();
         this.redecorateSkeleton();
      }
      
      public function syncClothesAndHairs(param1:§_-7Mj§, param2:§_-4aX§) : void
      {
         var _loc5_:AvatarClothesItem = null;
         var _loc6_:Array = null;
         var _loc7_:Clothes = null;
         var _loc8_:§_-AyA§ = null;
         var _loc9_:Boolean = false;
         this.colors = param1.colorSet.toArray();
         if(param2 == null || !param2.§_-4SF§(§_-Awf§.§_-IZ§))
         {
            _loc8_ = param1.hairsItem;
            if(this.§_-BAT§ == null || this.§_-BAT§.kind != _loc8_.kind)
            {
               this.§_-BAT§ = new Hair(_loc8_);
            }
         }
         else
         {
            this.§_-BAT§ = null;
         }
         var _loc3_:Array = [];
         var _loc4_:Array = param2.getClothes();
         for each(_loc5_ in _loc4_)
         {
            if(_loc5_.clothesItem != null)
            {
               if(!this.§_-9U9§.hasClothes(_loc5_))
               {
                  _loc3_.push(_loc5_);
               }
            }
         }
         _loc6_ = [];
         for each(_loc7_ in this.§_-9U9§.clothes)
         {
            _loc9_ = true;
            for each(_loc5_ in _loc4_)
            {
               if(_loc7_.clotheId == _loc5_.clotheId)
               {
                  _loc9_ = false;
                  break;
               }
            }
            if(_loc9_)
            {
               _loc6_.push(_loc7_);
            }
         }
         for each(_loc7_ in _loc6_)
         {
            this.removeClothes(_loc7_);
         }
         for each(_loc5_ in _loc3_)
         {
            this.addClothes(new Clothes(_loc5_.clothesItem.name,_loc5_.clothesItem.library,_loc5_.colorId));
         }
      }
      
      public function §_-6ih§(param1:§_-7Mj§, param2:§_-4aX§) : void
      {
         this.§_-8Dv§(param1,param2 != null && param2.canShowBeard());
         this.syncClothesAndHairs(param1,param2);
         this.redecorateSkeleton();
      }
      
      public function §_-8Dv§(param1:§_-7Mj§, param2:Boolean) : void
      {
         this.§_-6Yk§();
         this.§_-00r§(new §_-3lX§(§_-3L0§.EYES,param1.eyesItem));
         this.§_-00r§(new §_-3lX§(§_-3L0§.BROWS,param1.browsItem));
         this.§_-00r§(new §_-3lX§(§_-3L0§.MOUTH,param1.mouthItem));
         this.§_-00r§(new §_-3lX§(§_-3L0§.FACE_FEATURE,param1.faceFeatureItem));
         this.§_-00r§(new §_-3lX§(§_-3L0§.§_-9ka§,param1.shadowItem));
         if(this.§_-0gG§ == §_-3uA§.§_-908§)
         {
            if(param2)
            {
               this.§_-00r§(new §_-3lX§(§_-3L0§.BEARD,param1.beardItem));
            }
         }
         else
         {
            this.§_-00r§(new §_-3lX§(§_-3L0§.ROUGE,param1.rougeItem));
            this.§_-00r§(new §_-3lX§(§_-3L0§.§_-8jW§,param1.strassItem));
         }
         this.§_-00r§(new §_-3lX§(§_-3L0§.§_-ATO§,param1.pirsingItem));
         this.§_-00r§(new §_-3lX§(§_-3L0§.§_-5lw§,param1.faceArtItem));
      }
      
      public function updateAnimation() : void
      {
         var _loc1_:Object = null;
         if(_world == null)
         {
            return;
         }
         switch(this.§_-9ax§)
         {
            case §_-3PG§.§_-BBz§:
            case §_-3PG§.§_-2S1§:
               this.setAnimation(§_-3PG§.§_-BBz§,{"sequence":§_-1AA§.§_-4RK§});
               break;
            case §_-3PG§.§_-7v-§:
               this.setAnimation(§_-3PG§.§_-7v-§,{"sequence":§_-1AA§.§_-4RK§});
               break;
            case §_-3PG§.§_-AcH§:
               this.setAnimation(§_-3PG§.§_-AcH§,{"sequence":§_-1AA§.§_-4RK§});
               break;
            case §_-3PG§.§_-A8k§:
               this.setAnimation(§_-3PG§.§_-A8k§,{"sequence":§_-1AA§.§_-4RK§});
               break;
            case §_-3PG§.§_-8eI§:
               this.setAnimation(§_-3PG§.§_-8eI§,{"sequence":§_-6H§.§_-Mm§});
               break;
            case §_-3PG§.§_-9mZ§:
               this.setAnimation(§_-3PG§.§_-9mZ§,{"sequence":§_-1cD§.§_-Mm§});
               break;
            case §_-3PG§.DANCE:
               _loc1_ = null;
               if(this.§_-9U4§ != null && (this.§_-9U4§.currentAnimation != null || this.§_-9U4§.currentAnimation != ""))
               {
                  _loc1_ = {"sequence":this.§_-9U4§.currentAnimation};
               }
               this.setAnimation(§_-3PG§.DANCE,_loc1_);
               break;
            case §_-3PG§.§_-97h§:
               this.setAnimation(§_-3PG§.§_-97h§);
               break;
            case §_-3PG§.§_-3eD§:
               this.setAnimation(§_-3PG§.§_-3eD§,{"sequence":§_-1bn§.§_-7-F§});
               break;
            case §_-3PG§.§_-06C§:
            case §_-3PG§.§_-OT§:
               this.addAction(new §_-3q7§(1));
               break;
            case §_-3PG§.§_-AYl§:
               this.setAnimation(§_-3PG§.§_-AYl§,{
                  "sequence":§_-5Jl§.§_-Mm§,
                  "direction":["B",true]
               });
            case §_-3PG§.§_-1y4§:
               this.setAnimation(§_-3PG§.§_-1y4§,{"sequence":§_-1AA§.§_-4RK§});
               break;
            case §_-3PG§.§_-5s9§:
               this.setAnimation(§_-3PG§.§_-5s9§,{"sequence":§_-1AA§.§_-4RK§});
               break;
            case §_-3PG§.§_-Awu§:
               this.setAnimation(§_-3PG§.§_-Awu§,{"sequence":§_-1AA§.§_-4RK§});
               break;
            case §_-3PG§.WATERPOOL_ANIMATION_1:
            case §_-3PG§.WATERPOOL_ANIMATION_2:
            case §_-3PG§.WATERPOOL_ANIMATION_3:
            case §_-3PG§.WATERPOOL_ANIMATION_4:
               this.setAnimation(this.§_-9ax§,{"sequence":§_-0Ik§.§_-Mm§});
               break;
            case §_-3PG§.SPORT_MAT_ANIMATION_1:
            case §_-3PG§.SPORT_MAT_ANIMATION_2:
            case §_-3PG§.SPORT_MAT_ANIMATION_3:
               this.setAnimation(this.§_-9ax§,{"sequence":§_-8i7§.§_-Mm§});
               break;
            case §_-3PG§.§_-0Za§:
               this.setAnimation(§_-3PG§.§_-0Za§,{
                  "sequence":§_-7Rm§.§_-Mm§,
                  "direction":["B",true]
               });
               break;
            case §_-3PG§.§_-CT7§:
               this.setAnimation(this.§_-9ax§,{"sequence":§_-62M§.§_-Mm§});
               break;
            case §_-3PG§.§_-95§:
               this.setAnimation(§_-3PG§.§_-95§,{"sequence":§_-1AA§.§_-4RK§});
               break;
            case §_-3PG§.§_-8US§:
               this.setAnimation(§_-3PG§.§_-8US§,{"sequence":§_-1AA§.§_-4RK§});
               break;
            case §_-3PG§.§_-95x§:
               this.setAnimation(§_-3PG§.§_-95x§,{"sequence":§_-1AA§.§_-4RK§});
               break;
            case §_-3PG§.§_-0ci§:
               this.setAnimation(§_-3PG§.§_-0ci§,{"sequence":§_-1AA§.§_-4RK§});
               break;
            case §_-3PG§.§_-8ML§:
               this.setAnimation(§_-3PG§.§_-8ML§,{"sequence":§_-1AA§.§_-4RK§});
               break;
            case §_-3PG§.§_-AKo§:
               this.setAnimation(§_-3PG§.§_-AKo§,{"sequence":§_-1AA§.§_-4RK§});
               break;
            case §_-3PG§.§_-BSL§:
               this.setAnimation(§_-3PG§.§_-BSL§,{"sequence":§_-1AA§.§_-4RK§});
               break;
            case §_-3PG§.JUMP_ON_TRAMPOLINE_1:
               this.setAnimation(§_-3PG§.JUMP_ON_TRAMPOLINE_1,{"sequence":§_-1AA§.§_-4RK§});
               break;
            case §_-3PG§.JUMP_ON_TRAMPOLINE_2:
               this.setAnimation(§_-3PG§.JUMP_ON_TRAMPOLINE_2,{"sequence":§_-1AA§.§_-4RK§});
               break;
            case §_-3PG§.JUMP_ON_TRAMPOLINE_3:
               this.setAnimation(§_-3PG§.JUMP_ON_TRAMPOLINE_3,{"sequence":§_-1AA§.§_-4RK§});
               break;
            default:
               this.setAnimation(§_-3PG§.§_-CUz§);
         }
      }
      
      public function getIcon(param1:int) : Bitmap
      {
         return §_-3iC§.instance.§_-3dI§(this,param1);
      }
      
      public function get avatarName() : String
      {
         return this.userName;
      }
      
      override protected function invalidatePosition() : void
      {
         super.invalidatePosition();
      }
      
      public function §_-0kG§(param1:DisplayObject, param2:int) : DisplayObject
      {
         var _loc3_:§_-5n7§ = this.getLayer(param2);
         if(_loc3_ == null)
         {
            throw new Error("Invalid layerId passed");
         }
         _loc3_.addChild(param1);
         return param1;
      }
      
      public function §_-f0§(param1:DisplayObject, param2:int) : DisplayObject
      {
         var _loc3_:§_-5n7§ = this.getLayer(param2);
         if(_loc3_ == null)
         {
            throw new Error("Invalid layerId passed");
         }
         _loc3_.removeChild(param1);
         return param1;
      }
      
      public function getLayer(param1:int) : §_-5n7§
      {
         switch(param1)
         {
            case §_-2ta§:
               return this.§_-1ws§;
            case §_-4Gp§:
               return this.§_-Ih§;
            case §_-13W§:
               return this.§_-Nc§;
            case §_-7j9§:
               return this.§_-9kk§;
            case LAYER_TOP:
               return this.§_-Xy§;
            default:
               return null;
         }
      }
      
      public function §_-A2t§() : §_-7VJ§
      {
         return this.§_-XT§;
      }
      
      public function get currentAnimation() : String
      {
         return this.§_-9ax§;
      }
      
      public function get animation() : §_-1bg§
      {
         return this.§_-9U4§;
      }
      
      public function get skeleton() : §_-07w§
      {
         return this.§_-4HT§;
      }
      
      public function §_-0HA§() : §_-2r2§
      {
         return this.§_-9U9§.clone() as §_-2r2§;
      }
      
      protected function §_-2fI§() : §_-07w§
      {
         if(§_-AB-§.§_-BAG§(this.userId))
         {
            return §_-AB-§.§_-468§(this.userId);
         }
         return new §_-97v§(this.§_-XT§);
      }
      
      protected function generateId() : int
      {
         return -Math.floor(Math.random() * 2147483647);
      }
      
      override public function destroy() : void
      {
         this.§_-BLS§ = true;
         if(this.§_-4HT§ != null)
         {
            this.§_-9U9§.§_-2xr§();
            this.§_-4HT§.redecorateSkeleton(this.§_-9U9§);
            §_-AB-§.§_-92j§(this.userId,this.§_-4HT§);
            this.§_-4HT§ = null;
         }
         if(this._view != null)
         {
            if(this._view.parent != null)
            {
               this._view.parent.removeChild(this._view);
            }
            this._view = null;
         }
         if(this.§_-9U4§ != null)
         {
            this.§_-9U4§.destroy();
         }
         super.destroy();
      }
   }
}

