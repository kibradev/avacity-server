package §_-5KP§
{
   import §_-0yq§.§_-0eB§;
   import §_-0yq§.§_-tF§;
   import flash.geom.Point;
   
   public class §_-BIX§ extends §_-tF§
   {
      public static const §_-7dT§:Number = 1000;
      
      public static const §_-0C4§:Number = 1;
      
      public function §_-BIX§()
      {
         super(§_-tF§.EUCLIDIAN);
      }
      
      override protected function checkPassability(param1:§_-0eB§, param2:§_-0eB§) : Boolean
      {
         if(!param1.walkable && !param2.walkable)
         {
            return true;
         }
         return param2.walkable && _map.getNode(param1.x,param2.y).walkable && _map.getNode(param2.x,param1.y).walkable;
      }
      
      public function find(param1:§_-Bd6§, param2:Point, param3:Point) : Array
      {
         param1.project();
         var _loc4_:Array = §_-6G4§(param1,param2,param3);
         if(_loc4_ == null)
         {
            return [];
         }
         return _loc4_;
      }
      
      public function §_-6ep§(param1:§_-Bd6§, param2:Point, param3:Vector.<Point>) : Point
      {
         var _loc6_:Point = null;
         var _loc7_:Array = null;
         if(param3 == null || param3.length == 0)
         {
            return null;
         }
         param1.project();
         var _loc4_:Point = param3[0];
         var _loc5_:int = int(§_-6G4§(param1,param2,_loc4_).length);
         for each(_loc6_ in param3)
         {
            _loc7_ = §_-6G4§(param1,param2,_loc6_);
            if(_loc7_ != null)
            {
               if(_loc5_ > _loc7_.length)
               {
                  _loc5_ = int(_loc7_.length);
                  _loc4_ = _loc6_;
               }
            }
         }
         return _loc4_;
      }
   }
}

