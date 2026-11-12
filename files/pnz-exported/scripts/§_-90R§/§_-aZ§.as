package §_-90R§
{
   import §_-6-L§.§_-2Rb§;
   import flash.geom.Point;
   
   public class §_-aZ§
   {
      public static const UNKNOWN:int = -1;
      
      public static const N:int = 0;
      
      public static const NE:int = 1;
      
      public static const E:int = 2;
      
      public static const SE:int = 3;
      
      public static const S:int = 4;
      
      public static const SW:int = 5;
      
      public static const W:int = 6;
      
      public static const NW:int = 7;
      
      public static const §_-8DB§:Array = [N,NE,E,SE,S,SW,W,NW];
      
      private static var §_-43g§:Array = ["N","NE","E","SE","S","SW","W","NW"];
      
      private static var §_-08r§:Array = [[0,-1],[1,-1],[1,0],[1,1],[0,1],[-1,1],[-1,0],[-1,-1]];
      
      private static var §_-ApB§:Array = [0,45,90,135,180,-135,-90,-45];
      
      public function §_-aZ§()
      {
         super();
      }
      
      public static function rotate(param1:int, param2:int, param3:Boolean = false) : int
      {
         param2 = Math.round(param2 / 45);
         param1 = !param3 ? param1 + param2 : param1 - param2;
         return param1 >= 0 ? int(param1 % 8) : int(param1 % 8 + 8);
      }
      
      public static function §_-9bG§(param1:int) : String
      {
         return §_-43g§[param1 % 8];
      }
      
      public static function §_-7gw§(param1:int) : Point
      {
         var _loc2_:Array = §_-08r§[param1 % 8];
         return new Point(_loc2_[0],_loc2_[1]);
      }
      
      public static function §_-77T§(param1:int) : Number
      {
         return §_-ApB§[param1 % 8];
      }
      
      public static function §_-3le§(param1:Number, param2:Number) : int
      {
         if(param1 == 0 && param2 == 0)
         {
            return §_-aZ§.N;
         }
         return §_-4iJ§(§_-2Rb§.angle(param1,-param2) * §_-2Rb§.§_-CCM§);
      }
      
      public static function §_-4NI§(param1:String) : int
      {
         return §_-43g§.indexOf(param1);
      }
      
      public static function §_-4iJ§(param1:Number) : int
      {
         param1 = §_-2Rb§.§_-0Yt§(param1 * §_-2Rb§.§_-1LD§) * §_-2Rb§.§_-CCM§;
         var _loc2_:int = Math.floor((param1 + 22.5) / 45);
         return (10 - _loc2_) % 8;
      }
   }
}

