package §_-18o§
{
   import §_-1Fx§.§_-Bj9§;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.geom.ColorTransform;
   
   public class §_-4Qf§
   {
      public function §_-4Qf§()
      {
         super();
      }
      
      public static function colorize(param1:DisplayObjectContainer, param2:Array) : void
      {
         var _loc4_:String = null;
         var _loc5_:Object = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:DisplayObject = null;
         var _loc9_:ColorTransform = null;
         var _loc3_:§_-Bj9§ = new §_-Bj9§(param1);
         for each(_loc4_ in _loc3_.getNames())
         {
            _loc5_ = §_-8iD§.parse(_loc4_,["c"]);
            if(_loc5_["c"] != null)
            {
               _loc6_ = parseInt(_loc5_["c"]);
               if(_loc6_ >= 0 && _loc6_ < param2.length)
               {
                  _loc7_ = 0;
                  while(_loc7_ < _loc3_.getCount(_loc4_))
                  {
                     _loc8_ = _loc3_.§_-9OE§(_loc4_,_loc7_);
                     _loc9_ = new ColorTransform();
                     _loc9_.color = param2[_loc6_];
                     _loc8_.transform.colorTransform = _loc9_;
                     _loc7_++;
                  }
               }
            }
         }
      }
   }
}

