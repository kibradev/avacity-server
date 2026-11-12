package §_-4ie§
{
   import §_-03t§.§_-AsH§;
   import §_-07O§.§_-9PB§;
   import §_-0Uz§.§_-m3§;
   import §_-18o§.CityDisplayUtils;
   import §_-2oZ§.§_-3aj§;
   import §_-2oZ§.§_-4aW§;
   import §_-2oZ§.§_-6SO§;
   import §_-310§.§_-04l§;
   import §_-3WJ§.§_-4sF§;
   import §_-3ie§.§_-6SW§;
   import §_-5MD§.§_-8D5§;
   import §_-5Xp§.§_-BKS§;
   import §_-5g6§.§_-1ib§;
   import §_-6-L§.§_-3hw§;
   import §_-7eL§.§_-Asa§;
   import §_-7nb§.§_-B00§;
   import §_-8x6§.HoldPetFurnitureObject;
   import §_-8x6§.§_-3kZ§;
   import §_-8x6§.§_-5tI§;
   import §_-8x6§.§_-8uy§;
   import §_-ACM§.§_-2iC§;
   import §_-AKx§.§_-2-c§;
   import §_-AKx§.§_-GN§;
   import §_-AaA§.§_-6Db§;
   import §_-AaA§.§_-Bg7§;
   import §_-Ah§.§_-5Jq§;
   import §_-CB§.§_-6u6§;
   import §_-GM§.Context;
   import §_-Uk§.§_-85Q§;
   import §_-Y7§.§_-01D§;
   import §_-bm§.§_-7M§;
   import ags.§_-5x-§;
   import penzville.Application;
   
   public class §_-8zE§ implements §_-m3§
   {
      private static const §_-1dT§:String = "location";
      
      private static const §_-5qL§:String = "petStatus";
      
      private static const §_-8VO§:String = "petMood";
      
      private static const §_-89i§:String = "petOnScreen";
      
      private static const §_-7-2§:String = "objectClassOnScreen";
      
      private static const §_-9xg§:String = "petRightMenu_call";
      
      private static const §_-0zC§:String = "petRightMenu_find";
      
      private static const §_-CYZ§:String = "petCardDialog_open";
      
      private static const §_-7gN§:String = "petRightMenu_close";
      
      private static const §_-A4W§:String = "petRightMenu_open";
      
      private var _netManager:§_-AsH§ = null;
      
      private var §_-44m§:§_-9eT§ = null;
      
      private var §_-B5o§:Boolean = false;
      
      private var §_-C6t§:Array = null;
      
      private var §_-5BS§:Array = null;
      
      private var §_-3OI§:§_-3aj§ = null;
      
      private var §_-AuG§:§_-4aW§ = null;
      
      private var _dialog:§_-GN§ = null;
      
      private var §_-0OD§:§_-8uy§ = null;
      
      private var §_-8oJ§:§_-9PB§ = null;
      
      private var §_-2Vc§:§_-8D5§ = null;
      
      private var §_-9f0§:§_-BKS§ = null;
      
      public function §_-8zE§()
      {
         super();
         this._netManager = new §_-AsH§(this);
      }
      
      public function configure(param1:XML) : void
      {
         var _loc3_:XML = null;
         var _loc4_:§_-3aj§ = null;
         if(param1 == null)
         {
            return;
         }
         var _loc2_:XML = §_-3hw§.§_-1s9§(param1,"tutorial");
         this.§_-C6t§ = [];
         for each(_loc3_ in §_-3hw§.§_-3bk§(_loc2_,"steps.step"))
         {
            _loc4_ = new §_-3aj§();
            _loc4_.configure(_loc3_);
            this.§_-C6t§.push(_loc4_);
         }
      }
      
      public function init() : void
      {
         Application.instance.addEventListener(§_-7M§.§_-CEW§,this.§_-i4§);
         this.§_-44m§ = new §_-9eT§(this);
      }
      
      public function set netClient(param1:§_-5x-§) : void
      {
         this._netManager.netClient = param1;
      }
      
      private function §_-i4§(param1:§_-7M§) : void
      {
         if(this.§_-Bbg§())
         {
            Application.instance.removeEventListener(§_-7M§.§_-CEW§,this.§_-i4§);
            this.finishTutorial();
            return;
         }
         if(this.§_-B5o§)
         {
            this.removeEventListeners();
            this.§_-1sX§();
            this.§_-Asb§(null);
            this.§_-7Lm§(null);
         }
         else
         {
            this.§_-7Cb§();
         }
      }
      
      public function §_-7Cb§() : void
      {
         if(this.§_-B5o§)
         {
            return;
         }
         if(!Context.cityPlayer.§_-Bif§() || this.§_-Bbg§())
         {
            return;
         }
         this.§_-COM§();
         Context.§_-C8W§.addEventListener(§_-6u6§.§_-9Bj§,this.§_-IE§);
         §_-Bg7§.instance.addEventListener(§_-2-c§.§_-06V§,this.§_-Blj§);
         this.removeEventListeners();
         this.§_-1sX§();
         this.§_-B5o§ = true;
         this.§_-7Lm§(null);
      }
      
      private function finishTutorial() : void
      {
         if(!this.§_-B5o§)
         {
            return;
         }
         Context.§_-C8W§.removeEventListener(§_-6u6§.§_-9Bj§,this.§_-IE§);
         this.removeEventListeners();
         this.§_-B5o§ = false;
      }
      
      public function §_-4aB§(param1:String, param2:Array) : void
      {
         Context.cityPlayer.petInfo.§_-Aoq§ = param2;
         this.§_-81g§(param1);
      }
      
      public function §_-7Lm§(param1:§_-2iC§) : void
      {
         if(this.§_-B5o§ && Context.cityPlayer.§_-7Og§())
         {
            this.§_-7xC§(param1 != null ? param1.actionTag : null);
         }
      }
      
      public function §_-8TF§(param1:String) : void
      {
         this._netManager.§_-8TF§(param1);
         this.§_-7Lm§(new §_-2iC§(§_-2iC§.§_-0eD§));
      }
      
      public function §_-1gs§(param1:Boolean = true) : void
      {
         if(!this.§_-3OI§.§_-1EB§)
         {
            this._netManager.finishStep(this.§_-3OI§.id);
            this.§_-81g§(this.§_-3OI§.id);
         }
         if(param1)
         {
            this.§_-Asb§(null);
            if(this.§_-Bbg§())
            {
               this.finishTutorial();
            }
         }
         else
         {
            this.§_-3OI§.§_-1EB§ = true;
         }
      }
      
      private function §_-IE§(param1:§_-6u6§) : void
      {
         var _loc2_:String = param1.ownerId;
         if(Context.cityPlayer.id != _loc2_)
         {
            return;
         }
         if(!Context.cityPlayer.§_-7Og§())
         {
            this.§_-Asb§(null);
         }
         this.§_-7Lm§(new §_-2iC§(§_-2iC§.§_-5Xw§));
      }
      
      private function §_-7xC§(param1:String) : void
      {
         var _loc3_:§_-6SO§ = null;
         if(this.§_-3OI§ != null && this.§_-AuG§ != null)
         {
            if(this.§_-AuG§.§_-3Cx§(param1))
            {
               this.nextAction();
            }
            else if(this.§_-AuG§.§_-5Pw§(param1))
            {
               this.§_-Asb§(null);
            }
            else if(this.§_-AuG§.§_-3Cx§(§_-9xg§) || this.§_-AuG§.§_-3Cx§(§_-0zC§) || this.§_-AuG§.§_-3Cx§(§_-CYZ§))
            {
               if(param1 == §_-7gN§)
               {
                  _loc3_ = new §_-6SO§();
                  _loc3_.type = §_-9eT§.§_-6NZ§;
                  _loc3_.target = §_-9eT§.§_-4Yi§;
                  _loc3_.direction = §_-6Db§.§_-3JT§;
                  _loc3_.y = 20;
                  this.§_-44m§.§_-89a§(_loc3_);
               }
               else if(param1 == §_-A4W§)
               {
                  this.§_-44m§.§_-Zj§(1,"petButtonPanel");
               }
            }
         }
         var _loc2_:§_-3aj§ = this.§_-0GT§(param1);
         if(_loc2_ != null && (this.§_-3OI§ == null || this.§_-3OI§.priority < _loc2_.priority))
         {
            this.§_-Asb§(_loc2_);
         }
      }
      
      private function §_-0GT§(param1:String) : §_-3aj§
      {
         var _loc3_:§_-3aj§ = null;
         if(!Context.cityPlayer.§_-7Og§())
         {
            return null;
         }
         var _loc2_:§_-3aj§ = null;
         for each(_loc3_ in this.§_-5BS§)
         {
            if((_loc3_.§_-H8§.length == 0 || _loc3_.§_-5fe§(param1)) && this.§_-9wZ§(_loc3_))
            {
               if(_loc2_ == null || _loc2_.priority < _loc3_.priority)
               {
                  _loc2_ = _loc3_;
               }
            }
         }
         return _loc2_;
      }
      
      private function §_-9wZ§(param1:§_-3aj§) : Boolean
      {
         var _loc3_:String = null;
         var _loc2_:Object = param1.conditions;
         if(_loc2_ == null || _loc2_.length == 0)
         {
            return true;
         }
         for(_loc3_ in _loc2_)
         {
            if(!this.§_-4Zu§(_loc3_,_loc2_[_loc3_]))
            {
               return false;
            }
         }
         return true;
      }
      
      private function §_-4Zu§(param1:String, param2:String) : Boolean
      {
         var _loc4_:String = null;
         var _loc6_:§_-01D§ = null;
         var _loc7_:§_-8uy§ = null;
         var _loc8_:§_-B00§ = null;
         var _loc9_:§_-1ib§ = null;
         var _loc10_:Array = null;
         var _loc11_:HoldPetFurnitureObject = null;
         var _loc3_:Boolean = false;
         if(param1.charAt(0) == "!")
         {
            _loc3_ = true;
            _loc4_ = param1.substr(1,param1.length);
         }
         else
         {
            _loc4_ = param1;
         }
         var _loc5_:* = false;
         switch(_loc4_)
         {
            case §_-1dT§:
               if(Context.§_-3hG§ == null)
               {
                  return false;
               }
               if(param2 == "selfHouse")
               {
                  _loc5_ = Context.§_-3hG§.currentScreen is §_-85Q§;
               }
               else
               {
                  _loc5_ = Context.§_-3hG§.locationId == param2;
               }
               break;
            case §_-5qL§:
               if(Context.cityPlayer.petInfo == null)
               {
                  return false;
               }
               _loc5_ = Context.cityPlayer.petInfo.status == parseInt(param2);
               break;
            case §_-8VO§:
               if(Context.cityPlayer.getCurrentPetModel() == null)
               {
                  return false;
               }
               _loc5_ = Context.cityPlayer.getCurrentPetModel().mood.id == param2;
               break;
            case §_-89i§:
               _loc6_ = this.§_-6lb§();
               if(_loc6_ == null)
               {
                  return false;
               }
               _loc7_ = _loc6_.getPetObject(Context.cityPlayer.id);
               _loc5_ = _loc7_ != null;
               break;
            case §_-7-2§:
               _loc8_ = Context.§_-3hG§;
               if(_loc8_ == null)
               {
                  return false;
               }
               if(!(_loc8_.currentScreen is §_-85Q§))
               {
                  return false;
               }
               _loc9_ = (Context.§_-3hG§.currentScreen as §_-85Q§).world;
               if(_loc9_ == null)
               {
                  return false;
               }
               _loc10_ = null;
               if(param2 == "HoldPetFurnitureObject")
               {
                  _loc10_ = _loc9_.findObjectsByClass(HoldPetFurnitureObject);
                  if(_loc10_ == null || _loc10_.length == 0)
                  {
                     return false;
                  }
                  for each(_loc11_ in _loc10_)
                  {
                     if(!(_loc11_ is §_-3kZ§ || _loc11_ is §_-5tI§))
                     {
                        _loc5_ = true;
                        break;
                     }
                  }
               }
               break;
            default:
               return false;
         }
         return !_loc3_ && _loc5_ || _loc3_ && !_loc5_;
      }
      
      private function §_-COM§() : void
      {
         var _loc2_:§_-3aj§ = null;
         this.§_-5BS§ = [];
         var _loc1_:§_-Asa§ = Context.cityPlayer.petInfo;
         if(this.§_-C6t§ == null || this.§_-C6t§.length == _loc1_.§_-Aoq§.length)
         {
            return;
         }
         for each(_loc2_ in this.§_-C6t§)
         {
            if(!_loc1_.§_-4KG§(_loc2_.id))
            {
               this.§_-5BS§.push(_loc2_);
            }
         }
      }
      
      private function §_-81g§(param1:String) : void
      {
         if(this.§_-5BS§ == null || this.§_-5BS§.length == 0)
         {
            return;
         }
         var _loc2_:int = 0;
         while(_loc2_ < this.§_-5BS§.length)
         {
            if((this.§_-5BS§[_loc2_] as §_-3aj§).id == param1)
            {
               this.§_-5BS§.splice(_loc2_,1);
               break;
            }
            _loc2_++;
         }
      }
      
      private function §_-Asb§(param1:§_-3aj§) : void
      {
         this.§_-3OI§ = param1;
         this.§_-3GP§(this.§_-3OI§ == null ? null : this.§_-3OI§.actions[0]);
      }
      
      private function nextAction() : void
      {
         if(this.§_-3OI§ == null || this.§_-3OI§.actions == null || this.§_-3OI§.actions.length <= 0)
         {
            return;
         }
         var _loc1_:§_-4aW§ = this.§_-3OI§.getNextAction(this.§_-AuG§.id);
         if(_loc1_ == null)
         {
            this.§_-1gs§();
         }
         else
         {
            this.§_-3GP§(_loc1_);
         }
      }
      
      private function §_-3GP§(param1:§_-4aW§) : void
      {
         this.§_-44m§.§_-AYv§();
         if(param1 != null)
         {
            this.§_-44m§.createAction(param1);
         }
         this.§_-AuG§ = param1;
      }
      
      private function §_-Bbg§() : Boolean
      {
         if(!Context.§_-C8W§.§_-Nb§())
         {
            return true;
         }
         return Context.cityPlayer.petInfo != null && Context.cityPlayer.petInfo.§_-Aoq§.length == this.§_-C6t§.length;
      }
      
      private function §_-6lb§() : §_-01D§
      {
         var _loc1_:§_-B00§ = Context.§_-3hG§;
         if(_loc1_ == null)
         {
            return null;
         }
         var _loc2_:§_-9PB§ = _loc1_.currentScreen as §_-9PB§;
         if(_loc2_ != null)
         {
            return _loc2_.§_-9Q4§;
         }
         return null;
      }
      
      private function §_-1sX§() : void
      {
         var _loc2_:§_-8uy§ = null;
         var _loc1_:§_-9PB§ = Context.§_-3hG§.currentScreen as §_-9PB§;
         if(_loc1_ != null)
         {
            this.§_-8oJ§ = _loc1_;
         }
         if(this.§_-8oJ§ != null)
         {
            if(this.§_-8oJ§.§_-9Q4§ != null)
            {
               this.§_-8oJ§.§_-9Q4§.addEventListener(§_-6u6§.§_-5kA§,this.§_-CPw§);
               this.§_-8oJ§.§_-9Q4§.addEventListener(§_-6u6§.§_-2K8§,this.§_-1UV§);
               _loc2_ = this.§_-8oJ§.§_-9Q4§.getPetObject(Context.cityPlayer.id);
               if(_loc2_ != null)
               {
                  this.§_-0qn§();
                  this.§_-0OD§ = _loc2_;
                  this.§_-0OD§.addEventListener(§_-2iC§.§_-2j§,this.§_-7Lm§);
               }
            }
            if(this.§_-8oJ§.§_-3D2§ != null)
            {
               this.§_-5xO§();
               this.§_-9f0§ = CityDisplayUtils.§_-9o6§(this.§_-8oJ§.§_-3D2§,§_-BKS§);
               this.§_-9f0§.addEventListener(§_-6SW§.§_-1W9§,this.§_-3RM§);
               this.§_-9f0§.addEventListener(§_-6SW§.§_-3xi§,this.§_-7MH§);
               this.§_-9f0§.addEventListener(§_-2iC§.§_-2j§,this.§_-7Lm§);
            }
            if(this.§_-8oJ§.world != null)
            {
               this.§_-8oJ§.world.addEventListener(§_-2iC§.§_-2j§,this.§_-7Lm§);
            }
            this.§_-8oJ§.addEventListener(§_-6SW§.§_-CM0§,this.§_-6yA§);
            this.§_-8oJ§.addEventListener(§_-6SW§.§_-7fK§,this.§_-7ty§);
            this.§_-8oJ§.addEventListener(§_-6SW§.§_-CDH§,this.§_-7ty§);
         }
         Context.§_-CLP§.addEventListener(§_-5Jq§.§_-BPn§,this.§_-4k0§);
         Context.§_-CLP§.addEventListener(§_-5Jq§.§_-Bg9§,this.onExitPlayground);
      }
      
      private function removeEventListeners() : void
      {
         this.§_-0qn§();
         this.§_-5xO§();
         this.§_-1ZX§();
         this.§_-BKv§();
         this.§_-2Qp§();
         this.§_-8Mb§();
      }
      
      private function §_-4k0§(param1:§_-5Jq§) : void
      {
         this.§_-44m§.§_-AYv§();
      }
      
      private function onExitPlayground(param1:§_-5Jq§) : void
      {
         if(this.§_-3OI§ != null && this.§_-AuG§ != null)
         {
            this.§_-44m§.createAction(this.§_-AuG§);
         }
      }
      
      private function §_-8Mb§() : void
      {
         Context.§_-CLP§.removeEventListener(§_-5Jq§.§_-BPn§,this.§_-4k0§);
         Context.§_-CLP§.removeEventListener(§_-5Jq§.§_-Bg9§,this.onExitPlayground);
      }
      
      private function §_-7MH§(param1:§_-6SW§) : void
      {
         this.§_-5xO§();
         this.§_-9f0§ = CityDisplayUtils.§_-9o6§(this.§_-8oJ§.§_-3D2§,§_-BKS§);
         if(this.§_-9f0§ == null)
         {
            return;
         }
         this.§_-9f0§.addEventListener(§_-2iC§.§_-2j§,this.§_-7Lm§);
      }
      
      private function §_-3RM§(param1:§_-6SW§) : void
      {
         this.§_-5xO§();
      }
      
      private function §_-5xO§() : void
      {
         if(this.§_-9f0§ != null)
         {
            this.§_-9f0§.removeEventListener(§_-6SW§.§_-1W9§,this.§_-3RM§);
            this.§_-9f0§.removeEventListener(§_-6SW§.§_-3xi§,this.§_-7MH§);
            this.§_-9f0§.removeEventListener(§_-2iC§.§_-2j§,this.§_-7Lm§);
            this.§_-9f0§ = null;
         }
      }
      
      private function §_-6yA§(param1:§_-6SW§) : void
      {
         var _loc2_:§_-8D5§ = param1.data;
         if(_loc2_ == null)
         {
            return;
         }
         if(_loc2_.object is HoldPetFurnitureObject && !(_loc2_.object is §_-5tI§) && !(_loc2_.object is §_-3kZ§) || _loc2_.object is §_-8uy§)
         {
            this.§_-1ZX§();
            this.§_-2Vc§ = _loc2_;
            this.§_-2Vc§.addEventListener(§_-6SW§.§_-AnH§,this.§_-5C4§);
            this.§_-7Lm§(new §_-2iC§(§_-2iC§.§_-0k7§,this.§_-7xi§(this.§_-2Vc§.object)));
         }
      }
      
      private function §_-5C4§(param1:§_-6SW§) : void
      {
         if(this.§_-2Vc§ == null)
         {
            return;
         }
         this.§_-7Lm§(new §_-2iC§(§_-2iC§.§_-BFY§,this.§_-7xi§(this.§_-2Vc§.object)));
         this.§_-1ZX§();
      }
      
      private function §_-1ZX§() : void
      {
         if(this.§_-2Vc§ != null)
         {
            this.§_-2Vc§.removeEventListener(§_-6SW§.§_-AnH§,this.§_-5C4§);
            this.§_-2Vc§ = null;
         }
      }
      
      private function §_-7xi§(param1:*) : String
      {
         if(param1 is HoldPetFurnitureObject)
         {
            return §_-2iC§.§_-8TL§;
         }
         if(param1 is §_-8uy§)
         {
            return §_-2iC§.§_-75C§;
         }
         return "unknown";
      }
      
      private function §_-7ty§(param1:§_-6SW§) : void
      {
         this.removeEventListeners();
      }
      
      private function §_-2Qp§() : void
      {
         if(this.§_-8oJ§ != null)
         {
            if(this.§_-8oJ§.world != null)
            {
               this.§_-8oJ§.world.removeEventListener(§_-2iC§.§_-2j§,this.§_-7Lm§);
            }
            if(this.§_-8oJ§.§_-9Q4§ != null && !this.§_-8oJ§.§_-9Q4§.destroyed)
            {
               this.§_-8oJ§.§_-9Q4§.removeEventListener(§_-6u6§.§_-5kA§,this.§_-CPw§);
               this.§_-8oJ§.§_-9Q4§.removeEventListener(§_-6u6§.§_-2K8§,this.§_-1UV§);
            }
            this.§_-8oJ§.removeEventListener(§_-6SW§.§_-CM0§,this.§_-6yA§);
            this.§_-8oJ§.removeEventListener(§_-6SW§.§_-7fK§,this.§_-7ty§);
            this.§_-8oJ§.removeEventListener(§_-6SW§.§_-CDH§,this.§_-7ty§);
            this.§_-8oJ§ = null;
         }
      }
      
      private function §_-CPw§(param1:§_-6u6§) : void
      {
         var _loc2_:§_-8uy§ = param1.pet;
         if(_loc2_ == null || _loc2_.ownerId != Context.cityPlayer.id)
         {
            return;
         }
         this.§_-0qn§();
         this.§_-0OD§ = _loc2_;
         this.§_-0OD§.addEventListener(§_-2iC§.§_-2j§,this.§_-7Lm§);
      }
      
      private function §_-1UV§(param1:§_-6u6§) : void
      {
         var _loc2_:§_-8uy§ = param1.pet;
         if(_loc2_ == null || _loc2_.ownerId != Context.cityPlayer.id)
         {
            return;
         }
         this.§_-0qn§();
      }
      
      private function §_-0qn§() : void
      {
         if(this.§_-0OD§ != null)
         {
            this.§_-0OD§.removeEventListener(§_-2iC§.§_-2j§,this.§_-7Lm§);
            this.§_-0OD§ = null;
         }
      }
      
      private function §_-Blj§(param1:§_-2-c§) : void
      {
         var _loc2_:§_-GN§ = param1.§_-B66§;
         if(_loc2_ is §_-4sF§ || _loc2_ is §_-04l§)
         {
            this.§_-BKv§();
            this._dialog = _loc2_;
            this._dialog.addEventListener(§_-2-c§.§_-41T§,this.§_-9QK§);
            this.§_-7Lm§(new §_-2iC§(§_-2iC§.§_-0k7§,this.§_-3gg§(_loc2_)));
         }
      }
      
      private function §_-9QK§(param1:§_-2-c§ = null) : void
      {
         if(this._dialog == null)
         {
            return;
         }
         this.§_-7Lm§(new §_-2iC§(§_-2iC§.§_-BFY§,this.§_-3gg§(this._dialog)));
         this.§_-BKv§();
      }
      
      private function §_-BKv§() : void
      {
         if(this._dialog != null)
         {
            this._dialog.removeEventListener(§_-2-c§.§_-41T§,this.§_-9QK§);
            this._dialog = null;
         }
      }
      
      private function §_-3gg§(param1:*) : String
      {
         if(param1 is §_-4sF§)
         {
            return §_-2iC§.§_-58E§;
         }
         if(param1 is §_-04l§)
         {
            return §_-2iC§.§_-8eN§;
         }
         return "unknown";
      }
   }
}

