package §_-1ks§
{
   import §_-2Fw§.§_-2YR§;
   import §_-3VF§.§_-0nG§;
   import §_-3VF§.§_-1hq§;
   import §_-3VF§.§_-6G§;
   import §_-8df§.§_-56s§;
   import §_-99s§.§_-7Tj§;
   import flash.display.MovieClip;
   import flash.geom.Point;
   import penzville.Config;
   
   public class §_-Eb§ extends §_-VC§
   {
      protected var §_-9VL§:§_-AUT§ = null;
      
      public function §_-Eb§()
      {
         super();
      }
      
      override public function init() : void
      {
         super.init();
         this.§_-9VL§ = new §_-AUT§();
         addChild(this.§_-9VL§);
         this.§_-CLJ§();
      }
      
      public function get §_-6g8§() : §_-AUT§
      {
         return this.§_-9VL§;
      }
      
      protected function §_-CLJ§() : void
      {
         §_-0nG§.instance.constructPanels(this);
      }
      
      protected function getLootTargetPoint(param1:§_-7Tj§) : Point
      {
         var _loc2_:§_-6G§ = null;
         var _loc3_:§_-1hq§ = null;
         var _loc4_:Point = null;
         for each(_loc2_ in §_-0nG§.instance.§_-2bV§())
         {
            _loc3_ = _loc2_.uiConstructor;
            if(_loc3_ != null)
            {
               _loc4_ = _loc3_.getLootTargetPoint(param1);
               if(_loc4_ != null)
               {
                  return _loc4_;
               }
            }
         }
         return null;
      }
      
      protected function createCollectorAnimation(param1:§_-7Tj§, param2:MovieClip, param3:Point) : §_-2YR§
      {
         var _loc4_:§_-6G§ = null;
         var _loc5_:§_-1hq§ = null;
         var _loc6_:§_-2YR§ = null;
         for each(_loc4_ in §_-0nG§.instance.§_-2bV§())
         {
            _loc5_ = _loc4_.uiConstructor;
            if(_loc5_ != null)
            {
               _loc6_ = _loc5_.createCollectorAnimation(param1,param2,param3);
               if(_loc6_ != null)
               {
                  return _loc6_;
               }
            }
         }
         return null;
      }
      
      protected function createBackground() : §_-56s§
      {
         return new §_-56s§(Config.§_-50z§,Config.§_-6Z0§);
      }
   }
}

