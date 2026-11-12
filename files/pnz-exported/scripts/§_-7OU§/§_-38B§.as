package §_-7OU§
{
   import §_-0Tg§.§_-5Tj§;
   import §_-5Us§.§_-0d-§;
   import §_-5Us§.§_-1Dh§;
   import §_-5Us§.§_-2o6§;
   import §_-5Us§.§_-AyA§;
   import §_-6-L§.§_-2Rb§;
   import §_-6-L§.§_-7uH§;
   import §_-62k§.§_-2oh§;
   import §_-62k§.§_-7Mj§;
   import §_-AKx§.§_-4OH§;
   import §_-C-a§.§_-3uA§;
   import §_-GM§.Context;
   
   public class §_-38B§
   {
      private var §_-1DR§:Object = {};
      
      private var §_-2EN§:Object = {};
      
      private var §_-CUl§:Object = {};
      
      private var §_-3VV§:Object = {};
      
      public function §_-38B§()
      {
         super();
      }
      
      public static function §_-0jb§(param1:String) : Boolean
      {
         var _loc2_:String = "  ÿ           ";
         param1 = param1.replace(new RegExp("^[" + _loc2_ + "]*","g"),"");
         param1 = param1.replace(new RegExp("[" + _loc2_ + "]*$","g"),"");
         if(param1.length == 0)
         {
            §_-4OH§.§_-B5P§(Context.§_-5o8§.message("warning"),Context.§_-5o8§.message("noAvatarNameWarning"));
            return false;
         }
         if(param1.length <= §_-7Mj§.§_-3rF§)
         {
            §_-4OH§.§_-B5P§(Context.§_-5o8§.message("warning"),Context.§_-5o8§.message("tooShortAvatarNameWarning"));
            return false;
         }
         if(param1.length > §_-7Mj§.§_-5dt§)
         {
            §_-4OH§.§_-B5P§(Context.§_-5o8§.message("warning"),Context.§_-5o8§.message("tooLongAvatarNameWarning"));
            return false;
         }
         if(param1 == Context.§_-5o8§.message("defaultAvatarName"))
         {
            §_-4OH§.§_-B5P§(Context.§_-5o8§.message("warning"),Context.§_-5o8§.message("noAvatarNameWarning"));
            return false;
         }
         return true;
      }
      
      public function init(param1:XML, param2:XML) : void
      {
         var _loc3_:String = null;
         var _loc4_:String = null;
         var _loc5_:§_-0d-§ = null;
         var _loc6_:§_-1Dh§ = null;
         var _loc7_:§_-0d-§ = null;
         var _loc8_:§_-1Dh§ = null;
         this.§_-5Zc§(param1);
         this.§_-90L§(param2);
         for(_loc3_ in this.§_-1DR§)
         {
            for each(_loc5_ in this.§_-1DR§[_loc3_])
            {
               if(_loc5_.visagistLevel != 0)
               {
                  _loc6_ = _loc5_.§_-1A5§(this.§_-Bdz§(parseInt(_loc3_)));
                  if(_loc6_ != null)
                  {
                     _loc6_.visagistLevel = _loc5_.visagistLevel;
                  }
               }
            }
         }
         for(_loc4_ in this.§_-2EN§)
         {
            for each(_loc7_ in this.§_-2EN§[_loc4_])
            {
               if(_loc7_.visagistLevel != 0)
               {
                  _loc8_ = _loc7_.§_-1A5§(this.§_-Bdz§(parseInt(_loc4_)));
                  if(_loc8_ != null)
                  {
                     _loc8_.visagistLevel = _loc7_.visagistLevel;
                  }
               }
            }
         }
      }
      
      private function §_-90L§(param1:XML) : void
      {
         this.§_-2RP§(§_-3uA§.§_-908§,param1["boy"][0],this.§_-CUl§);
         this.§_-2RP§(§_-3uA§.§_-BO7§,param1["girl"][0],this.§_-3VV§);
      }
      
      private function §_-2RP§(param1:int, param2:XML, param3:Object) : void
      {
         var _loc4_:XML = null;
         var _loc5_:§_-2oh§ = null;
         for each(_loc4_ in param2.elements("category"))
         {
            _loc5_ = new §_-2oh§(param1);
            _loc5_.fromXML(_loc4_);
            param3[_loc5_.id] = _loc5_;
         }
      }
      
      private function §_-5Zc§(param1:XML) : void
      {
         this.§_-CYK§(param1["boy"][0],this.§_-1DR§);
         this.§_-CYK§(param1["girl"][0],this.§_-2EN§);
      }
      
      private function §_-CYK§(param1:XML, param2:Object) : void
      {
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc5_:XML = null;
         var _loc6_:§_-0d-§ = null;
         var _loc7_:int = 0;
         for each(_loc3_ in §_-2o6§.values())
         {
            param2[_loc3_] = {};
            _loc4_ = §_-7uH§.§_-Vc§(§_-2o6§.toString(_loc3_)) + "Set";
            for each(_loc5_ in param1.elements(_loc4_))
            {
               _loc6_ = new §_-0d-§(_loc5_);
               _loc7_ = parseInt(_loc5_["@index"]);
               param2[_loc3_][_loc7_] = _loc6_;
            }
         }
      }
      
      public function §_-Bdz§(param1:int) : Array
      {
         switch(param1)
         {
            case §_-2o6§.§_-1r5§:
               return [3,0,1,2,4,5];
            case §_-2o6§.EYES:
               return [10];
            case §_-2o6§.BROWS:
               return [16];
            case §_-2o6§.MOUTH:
               return [11];
            case §_-2o6§.HAIR:
               return [8,6,7,9];
            case §_-2o6§.BEARD:
               return [14,12,13,15];
            case §_-2o6§.ROUGE:
               return [17];
            case §_-2o6§.§_-9ka§:
               return [18,19,20,21,22,23];
            case §_-2o6§.§_-5lw§:
               return [24,25,25,27,28];
            case §_-2o6§.§_-8jW§:
               return [29,30,31,32,33];
            default:
               return [];
         }
      }
      
      public function getCategory(param1:int, param2:int) : §_-2oh§
      {
         var _loc3_:Object = param2 == §_-3uA§.§_-908§ ? this.§_-CUl§ : this.§_-3VV§;
         return !!_loc3_.hasOwnProperty(param1.toString()) ? _loc3_[param1] : null;
      }
      
      public function §_-BeD§(param1:uint, param2:uint) : Array
      {
         var colors:Object = null;
         var colorSet:§_-0d-§ = null;
         var visagistLevel:int = 0;
         var item:§_-1Dh§ = null;
         var category:uint = param1;
         var gender:uint = param2;
         var result:Array = [];
         if(Context.cityPlayer.§_-tA§(§_-5Tj§.§_-Es§))
         {
            colors = gender == §_-3uA§.§_-908§ ? this.§_-1DR§ : this.§_-2EN§;
            for each(colorSet in colors[category])
            {
               if(colorSet.visagistLevel != 0)
               {
                  item = colorSet.§_-8hy§(this.§_-Bdz§(category));
                  result.push(item);
               }
            }
            visagistLevel = Context.cityPlayer.professions.§_-2k3§(§_-5Tj§.§_-Es§).§_-0wN§;
            result.sort(function(param1:§_-1Dh§, param2:§_-1Dh§):int
            {
               if(param1.visagistLevel <= visagistLevel && param2.visagistLevel > visagistLevel)
               {
                  return -1;
               }
               if(param1.visagistLevel > visagistLevel && param2.visagistLevel <= visagistLevel)
               {
                  return 1;
               }
               return param1.index < param2.index ? -1 : 1;
            });
         }
         return result;
      }
      
      public function §_-7O8§(param1:uint, param2:uint) : int
      {
         var _loc4_:§_-0d-§ = null;
         var _loc5_:§_-1Dh§ = null;
         var _loc3_:Object = param2 == §_-3uA§.§_-908§ ? this.§_-1DR§ : this.§_-2EN§;
         for each(_loc4_ in _loc3_[param1])
         {
            if(_loc4_.visagistLevel != 0)
            {
               _loc5_ = _loc4_.§_-1A5§(this.§_-Bdz§(param1));
               if(_loc4_.visagistLevel > 0)
               {
                  return _loc5_.index;
               }
            }
         }
         return 1;
      }
      
      public function §_-C85§(param1:uint, param2:uint, param3:Boolean) : Array
      {
         var _loc6_:§_-0d-§ = null;
         var _loc7_:§_-1Dh§ = null;
         var _loc4_:Array = [];
         var _loc5_:Object = param2 == §_-3uA§.§_-908§ ? this.§_-1DR§ : this.§_-2EN§;
         for each(_loc6_ in _loc5_[param1])
         {
            if(!(_loc6_.§_-fA§ && param3 || !param3 && _loc6_.§_-7Eh§ || _loc6_.visagistLevel != 0))
            {
               _loc7_ = _loc6_.§_-1A5§(this.§_-Bdz§(param1));
               if(_loc7_ != null)
               {
                  _loc4_.push(_loc7_);
               }
            }
         }
         if(_loc4_.length > 0)
         {
            _loc4_.sortOn("order",Array.NUMERIC);
         }
         return _loc4_;
      }
      
      public function getColors(param1:int, param2:int, param3:int) : §_-0d-§
      {
         var _loc4_:Object = param2 == §_-3uA§.§_-908§ ? this.§_-1DR§ : this.§_-2EN§;
         if(!_loc4_.hasOwnProperty(param1.toString()))
         {
            return null;
         }
         return _loc4_[param1][param3];
      }
      
      public function §_-KY§(param1:int, param2:int) : Object
      {
         var _loc3_:Object = this.§_-4ya§(param2);
         if(!_loc3_.hasOwnProperty(param1.toString()))
         {
            return null;
         }
         return _loc3_[param1];
      }
      
      public function getCategories(param1:int) : Object
      {
         return param1 == §_-3uA§.§_-908§ ? this.§_-CUl§ : this.§_-3VV§;
      }
      
      public function §_-4ya§(param1:int) : Object
      {
         return param1 == §_-3uA§.§_-908§ ? this.§_-1DR§ : this.§_-2EN§;
      }
      
      public function §_-4f6§(param1:int, param2:int) : Array
      {
         var _loc5_:§_-AyA§ = null;
         var _loc3_:§_-2oh§ = this.getCategory(param1,param2);
         if(_loc3_ == null)
         {
            return null;
         }
         var _loc4_:Array = [];
         for each(_loc5_ in _loc3_.items)
         {
            if(_loc5_.canBuy)
            {
               if(_loc5_.module == null)
               {
                  if(!(_loc5_.§_-7Eh§ || _loc5_.§_-AvQ§))
                  {
                     if(_loc5_.§_-fA§ || _loc5_.§_-9KE§)
                     {
                        _loc4_.push(_loc5_);
                     }
                  }
               }
            }
         }
         return _loc4_;
      }
      
      public function getRandomItem(param1:int, param2:int) : §_-AyA§
      {
         var _loc3_:Array = this.§_-4f6§(param1,param2);
         return _loc3_.length > 0 ? _loc3_[§_-2Rb§.§_-3GS§(0,_loc3_.length)] : null;
      }
      
      public function §_-22n§(param1:int, param2:int) : §_-AyA§
      {
         var _loc3_:Array = this.§_-4f6§(param1,param2);
         return _loc3_.length > 0 ? _loc3_.sortOn("kind",Array.NUMERIC)[0] : null;
      }
      
      public function §_-4-O§(param1:int, param2:int) : int
      {
         var _loc3_:§_-AyA§ = this.§_-22n§(param1,param2);
         return _loc3_ != null ? _loc3_.id : 0;
      }
   }
}

