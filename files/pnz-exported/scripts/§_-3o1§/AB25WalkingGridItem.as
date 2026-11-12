package §_-3o1§
{
   import §_-0sG§.§_-8xu§;
   import §_-3VF§.§_-0nG§;
   import §_-489§.AB25Module;
   import §_-4lI§.§_-5JW§;
   import §_-5g6§.§_-1ib§;
   import §_-6-L§.§_-3hw§;
   import §_-Aeq§.AB25WalkingGridObject;
   
   public class AB25WalkingGridItem extends §_-8xu§
   {
      public function AB25WalkingGridItem()
      {
         super();
      }
      
      private static function get module() : AB25Module
      {
         return §_-0nG§.instance.getModule(AB25Module.MODULE_ID) as AB25Module;
      }
      
      override public function apply(param1:§_-1ib§, param2:Object) : void
      {
         var _loc3_:AB25WalkingGridObject = new AB25WalkingGridObject();
         _loc3_.§_-49T§ = this;
         _loc3_.grid = §_-4sY§;
         param1.addObject(_loc3_);
      }
      
      override public function unserializeFromXML(param1:XML) : void
      {
         var _loc2_:XML = null;
         var _loc3_:int = 0;
         var _loc4_:XML = null;
         var _loc5_:Array = null;
         var _loc6_:int = 0;
         super.§_-CdM§(param1);
         width = §_-3hw§.getInt(param1,"@cols");
         length = §_-3hw§.getInt(param1,"@rows");
         §_-4sY§ = new §_-5JW§(width,length,0);
         for each(_loc2_ in §_-3hw§.§_-3bk§(param1,"grid"))
         {
            if(module.info.locationInfo.isAreaUnlocked(§_-3hw§.getString(_loc2_,"@id")))
            {
               _loc3_ = 0;
               for each(_loc4_ in §_-3hw§.§_-3bk§(_loc2_,"row"))
               {
                  _loc5_ = §_-3hw§.getList(_loc4_,"@values",[],",");
                  _loc6_ = 0;
                  while(_loc6_ < _loc5_.length)
                  {
                     if(_loc6_ >= width)
                     {
                        break;
                     }
                     if(!(§_-4sY§.getInt(_loc6_,_loc3_) == 1 || _loc5_[_loc6_] == "0"))
                     {
                        §_-4sY§.setInt(_loc6_,_loc3_,1);
                     }
                     _loc6_++;
                  }
                  _loc3_++;
                  if(_loc3_ >= length)
                  {
                     break;
                  }
               }
            }
         }
      }
   }
}

