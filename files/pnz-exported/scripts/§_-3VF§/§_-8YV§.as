package §_-3VF§
{
   import §_-0TK§.§_-CdV§;
   import §_-0fB§.§_-2QZ§;
   import §_-0rs§.§_-6mU§;
   import §_-12p§.§_-BLX§;
   import §_-12p§.§_-Bvg§;
   import §_-1xq§.§_-8-I§;
   import §_-329§.Dirol15Module;
   import §_-3KJ§.NTV22QuestInfoPanel;
   import §_-45i§.§_-4We§;
   import §_-4eY§.§_-8pe§;
   import §_-52p§.§_-25R§;
   import §_-5VL§.§_-43§;
   import §_-5f7§.§_-7yc§;
   import §_-6Km§.§_-00§;
   import §_-6mc§.Kotex15Module;
   import §_-70v§.§_-BcU§;
   import §_-8jw§.§_-8X4§;
   import §_-9lZ§.§_-16P§;
   import §_-A2M§.§_-4Ba§;
   import §_-AFi§.§_-0mk§;
   import §_-AFi§.§_-4jt§;
   import §_-AFi§.§_-4kw§;
   import §_-AFi§.§_-6eN§;
   import §_-AFi§.§_-8YP§;
   import §_-AFi§.§_-8fW§;
   import §_-AFi§.§_-A4S§;
   import §_-C6z§.§_-2lT§;
   import §_-CF9§.§_-06x§;
   import §_-GM§.Context;
   import §_-bm§.§_-0Ka§;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   public class §_-8YV§
   {
      private var _modules:Object = {};
      
      private var §_-0kf§:Object = {};
      
      private var §_-1wc§:Object = {};
      
      private var §_-780§:Object = {};
      
      public function §_-8YV§()
      {
         super();
      }
      
      private static function §_-AWK§(param1:String, param2:String) : §_-BLX§
      {
         switch(param1)
         {
            case Dirol15Module.MODULE_ID:
               return new §_-BcU§(param1,param2);
            case Kotex15Module.MODULE_ID:
               return new §_-16P§(param1,param2);
            case §_-8-I§.MODULE_ID:
               return new NTV22QuestInfoPanel(param2);
            default:
               return new §_-BLX§(param1,param2);
         }
      }
      
      public function §_-7tA§(param1:§_-6G§) : void
      {
         var _loc3_:§_-2lT§ = null;
         this._modules[param1.id] = param1;
         var _loc2_:§_-4jt§ = §_-0nG§.§_-2aA§(param1) as §_-4jt§;
         if(_loc2_ != null)
         {
            this.§_-0kf§[param1.id] = _loc2_;
         }
         if(param1 is §_-6mU§)
         {
            _loc3_ = (param1 as §_-6mU§).getComponent(§_-2lT§) as §_-2lT§;
            if(_loc3_ != null)
            {
               this.§_-1wc§[param1.id] = _loc3_;
            }
         }
      }
      
      public function §_-4hi§(param1:Array) : void
      {
         var _loc2_:§_-6G§ = null;
         for each(_loc2_ in this._modules)
         {
            if(_loc2_.uiConstructor is §_-0mk§)
            {
               (_loc2_.uiConstructor as §_-0mk§).§_-4hi§(param1);
            }
         }
      }
      
      public function §_-4K§(param1:§_-06x§) : Boolean
      {
         var _loc3_:§_-6G§ = null;
         var _loc2_:Boolean = false;
         for each(_loc3_ in this._modules)
         {
            if(_loc3_.uiConstructor is §_-6eN§ && (_loc3_.uiConstructor as §_-6eN§).§_-wm§(param1))
            {
               _loc2_ = true;
            }
         }
         return _loc2_;
      }
      
      public function §_-7BT§(param1:§_-06x§) : void
      {
         var _loc2_:§_-6G§ = null;
         if(!this.§_-4K§(param1))
         {
            return;
         }
         for each(_loc2_ in this._modules)
         {
            if(_loc2_.uiConstructor is §_-6eN§ && (_loc2_.uiConstructor as §_-6eN§).§_-wm§(param1))
            {
               (_loc2_.uiConstructor as §_-6eN§).interact(param1);
            }
         }
      }
      
      public function §_-0c8§(param1:String) : Boolean
      {
         var _loc2_:§_-6G§ = null;
         for each(_loc2_ in this._modules)
         {
            if(_loc2_.uiConstructor is §_-0mk§ && !(_loc2_.uiConstructor as §_-0mk§).§_-0c8§(param1))
            {
               return false;
            }
         }
         return true;
      }
      
      public function §_-9ry§() : Boolean
      {
         var _loc1_:§_-6G§ = null;
         for each(_loc1_ in this._modules)
         {
            if(_loc1_.uiConstructor is §_-8YP§ && (_loc1_.uiConstructor as §_-8YP§).§_-9ry§())
            {
               return true;
            }
         }
         return false;
      }
      
      public function §_-2fC§() : String
      {
         var _loc1_:§_-6G§ = null;
         for each(_loc1_ in this._modules)
         {
            if(_loc1_.uiConstructor is §_-8YP§ && (_loc1_.uiConstructor as §_-8YP§).§_-9ry§())
            {
               return (_loc1_.uiConstructor as §_-8YP§).§_-2fC§();
            }
         }
         return null;
      }
      
      public function §_-1zH§(param1:String) : void
      {
         var _loc2_:§_-6G§ = null;
         for each(_loc2_ in this._modules)
         {
            if(_loc2_.uiConstructor is §_-8YP§ && (_loc2_.uiConstructor as §_-8YP§).§_-2fC§() == param1)
            {
               (_loc2_.uiConstructor as §_-8YP§).§_-BvD§ = true;
            }
         }
      }
      
      public function get §_-2C7§() : Vector.<§_-8X4§>
      {
         var _loc2_:§_-6G§ = null;
         var _loc1_:Vector.<§_-8X4§> = new Vector.<§_-8X4§>();
         for each(_loc2_ in this._modules)
         {
            if(_loc2_.uiConstructor is §_-8fW§ && (_loc2_.uiConstructor as §_-8fW§).§_-7fo§())
            {
               _loc1_.push((_loc2_.uiConstructor as §_-8fW§).§_-BcE§());
            }
         }
         return _loc1_;
      }
      
      public function isModuleQuest(param1:String) : Boolean
      {
         var _loc2_:§_-4jt§ = null;
         var _loc3_:Array = null;
         var _loc4_:§_-00§ = null;
         for each(_loc2_ in this.§_-0kf§)
         {
            _loc3_ = _loc2_.getCurrentQuestsByType();
            if(_loc3_.length != 0)
            {
               for each(_loc4_ in _loc3_)
               {
                  if(_loc4_.questId == param1)
                  {
                     return true;
                  }
               }
            }
         }
         return false;
      }
      
      public function §_-5wW§(param1:§_-7yc§, param2:Function, param3:int, param4:int, param5:String) : void
      {
         var questModule:§_-4jt§ = null;
         var currentQuests:Array = null;
         var visibleQuests:Array = null;
         var listBox:§_-7yc§ = param1;
         var buttonCallback:Function = param2;
         var posX:int = param3;
         var posY:int = param4;
         var currentSection:String = param5;
         var sectionAdded:Boolean = false;
         var questSection:String = "moduleQuestSection";
         for each(questModule in this.§_-0kf§)
         {
            currentQuests = questModule.getCurrentQuestsByType();
            if(currentQuests.length != 0)
            {
               visibleQuests = currentQuests.filter(function(param1:§_-00§, param2:int, param3:Array):Boolean
               {
                  var _loc4_:* = questModule.getModuleQuestDescriptor(param1.questId) as §_-CdV§;
                  return _loc4_ != null && Boolean(_loc4_.showInMain);
               });
               if(visibleQuests.length != 0)
               {
                  if(!sectionAdded && questSection != currentSection)
                  {
                     posY = this.§_-AfZ§(questSection,listBox,posX,posY);
                     currentSection = questSection;
                     sectionAdded = true;
                  }
                  posY = this.§_-8LU§(questModule,currentQuests,listBox,buttonCallback,posX,posY);
               }
            }
         }
      }
      
      private function §_-AfZ§(param1:String, param2:§_-7yc§, param3:Number, param4:Number) : Number
      {
         var _loc5_:TextField = null;
         _loc5_ = param2.§_-fX§(Context.§_-5o8§.message(param1));
         _loc5_.x = param3;
         _loc5_.y = param4;
         param2.addContent(_loc5_);
         return param4 + _loc5_.height + 5;
      }
      
      private function §_-8LU§(param1:§_-4jt§, param2:Array, param3:§_-7yc§, param4:Function, param5:Number, param6:Number) : Number
      {
         var _loc7_:§_-00§ = null;
         var _loc8_:§_-CdV§ = null;
         var _loc9_:String = null;
         var _loc10_:§_-Bvg§ = null;
         for each(_loc7_ in param2)
         {
            _loc8_ = param1.getModuleQuestDescriptor(_loc7_.questId) as §_-CdV§;
            if(!(_loc8_ == null || !_loc8_.showInMain))
            {
               _loc9_ = param1.getQuestIconPath(_loc7_.questId);
               _loc10_ = new §_-Bvg§(_loc7_,_loc9_);
               _loc10_.x = param5 + 5;
               _loc10_.y = param6;
               _loc10_.addEventListener(MouseEvent.CLICK,param4);
               param3.addContent(_loc10_);
               param3.§_-B4A§.push(_loc10_);
               param6 += _loc10_.itemHeight;
            }
         }
         return param6;
      }
      
      public function §_-AA6§(param1:§_-4We§, param2:String) : void
      {
         var _loc3_:§_-2QZ§ = null;
         var _loc4_:String = null;
         var _loc5_:§_-4jt§ = null;
         var _loc6_:Array = null;
         var _loc7_:§_-00§ = null;
         var _loc8_:§_-BLX§ = null;
         for each(_loc3_ in param1.§_-AF5§)
         {
            if(_loc3_ is §_-BLX§ && param1.contains(_loc3_))
            {
               param1.removeContent(_loc3_);
               delete param1.§_-AF5§[_loc3_.id];
            }
         }
         for(_loc4_ in this.§_-0kf§)
         {
            _loc5_ = this.§_-0kf§[_loc4_];
            _loc6_ = _loc5_.getCurrentQuestsByType(§_-8pe§.§_-50a§);
            if(_loc6_.length != 0)
            {
               for each(_loc7_ in _loc6_)
               {
                  if(!(param2 != null && param2 == _loc7_.questId))
                  {
                     _loc8_ = §_-AWK§(_loc4_,_loc7_.questId);
                     _loc8_.x = 230;
                     _loc8_.y = 15;
                     param1.addContent(_loc8_);
                     _loc8_.visible = param1.§_-5sO§ == _loc8_.id;
                     param1.§_-AF5§[_loc8_.id] = _loc8_;
                  }
               }
            }
         }
      }
      
      public function getQuestEndTime(param1:String) : int
      {
         var _loc2_:§_-4jt§ = null;
         for each(_loc2_ in this.§_-0kf§)
         {
            if(_loc2_.isModuleQuest(param1))
            {
               return _loc2_.getQuestEndTime(param1);
            }
         }
         return -1;
      }
      
      public function §_-BUW§(param1:String, param2:String, param3:String) : Boolean
      {
         var _loc4_:§_-6G§ = null;
         for each(_loc4_ in this._modules)
         {
            if(_loc4_.uiConstructor is §_-A4S§ && (_loc4_.uiConstructor as §_-A4S§).§_-BUW§(param1,param2,param3))
            {
               return true;
            }
         }
         return false;
      }
      
      public function §_-1WH§(param1:String, param2:String, param3:String) : §_-4Ba§
      {
         var _loc4_:§_-6G§ = null;
         for each(_loc4_ in this._modules)
         {
            if(_loc4_.uiConstructor is §_-A4S§ && (_loc4_.uiConstructor as §_-A4S§).§_-BUW§(param1,param2,param3))
            {
               return (_loc4_.uiConstructor as §_-A4S§).§_-1WH§(param1,param2,param3);
            }
         }
         return §_-4Ba§.reject();
      }
      
      public function §_-7wG§() : §_-2lT§
      {
         var _loc1_:String = null;
         var _loc2_:§_-2lT§ = null;
         for(_loc1_ in this.§_-1wc§)
         {
            _loc2_ = this.§_-5xd§(_loc1_,true);
            if(_loc2_ != null)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function §_-5xd§(param1:String, param2:Boolean = false) : §_-2lT§
      {
         if(param1 == null || !this.§_-1wc§.hasOwnProperty(param1))
         {
            return null;
         }
         var _loc3_:§_-6G§ = this._modules[param1] as §_-6G§;
         if(_loc3_ == null || !_loc3_.inited || !_loc3_.isActive())
         {
            return null;
         }
         var _loc4_:§_-2lT§ = this.§_-1wc§[param1] as §_-2lT§;
         if(param2 && !_loc4_.§_-6kK§)
         {
            return null;
         }
         return _loc4_;
      }
      
      public function §_-003§(param1:String, param2:String) : void
      {
         if(param1 != null && param2 != null)
         {
            this.§_-780§[param1] = param2;
         }
      }
      
      public function §_-3xI§(param1:String) : String
      {
         var _loc4_:§_-43§ = null;
         var _loc2_:String = §_-0Ka§.§_-7pN§(param1);
         if(_loc2_ == null || _loc2_.length == 0)
         {
            return null;
         }
         if(this.§_-780§.hasOwnProperty(_loc2_))
         {
            return this.§_-780§[_loc2_] as String;
         }
         var _loc3_:Array = Context.§_-BFW§.§_-AYR§.events;
         if(_loc3_ != null)
         {
            for each(_loc4_ in _loc3_)
            {
               if(_loc4_ != null && _loc4_.module != null && _loc4_.id == _loc2_)
               {
                  return _loc4_.module;
               }
            }
         }
         return null;
      }
      
      public function §_-AKp§(param1:String) : §_-25R§
      {
         var _loc2_:§_-2lT§ = this.§_-5xd§(param1,false);
         return _loc2_ != null ? _loc2_.§_-04M§ : null;
      }
      
      public function §_-785§() : Array
      {
         var _loc2_:String = null;
         var _loc1_:Array = [];
         for(_loc2_ in this.§_-1wc§)
         {
            if(this.§_-5xd§(_loc2_,true) != null)
            {
               _loc1_.push(_loc2_);
            }
         }
         return _loc1_;
      }
      
      public function §_-33B§(param1:§_-43§) : Sprite
      {
         var _loc3_:§_-6G§ = null;
         var _loc4_:Sprite = null;
         var _loc2_:Sprite = new Sprite();
         for each(_loc3_ in this._modules)
         {
            if(_loc3_.uiConstructor is §_-4kw§)
            {
               _loc4_ = (_loc3_.uiConstructor as §_-4kw§).§_-2Zn§(param1);
               if(_loc4_ != null)
               {
                  _loc2_.addChild(_loc4_);
               }
            }
         }
         if(_loc2_.numChildren <= 0)
         {
            return null;
         }
         return _loc2_;
      }
   }
}

