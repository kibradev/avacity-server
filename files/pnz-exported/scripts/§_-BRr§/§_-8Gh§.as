package §_-BRr§
{
   import flash.display.Sprite;
   import flash.text.TextField;
   
   internal class §_-8Gh§ extends Sprite
   {
      public function §_-8Gh§(param1:uint, param2:String, param3:uint, param4:uint)
      {
         super();
         var _loc5_:uint = 12105912;
         var _loc6_:uint = 10461087;
         var _loc7_:uint = 0;
         var _loc8_:uint = 16777215;
         var _loc9_:uint = 16053492;
         var _loc10_:uint = 14671839;
         var _loc11_:uint = 0;
         var _loc12_:uint = 0;
         _loc11_ = 0;
         _loc12_ = 16777215;
         switch(param1)
         {
            case 1:
               _loc7_ = uint(§_-7Yu§.§_-oL§);
               break;
            case 2:
               _loc7_ = 15000804;
               _loc8_ = 13421772;
               _loc9_ = 13355979;
               _loc10_ = 15263976;
               break;
            default:
               _loc7_ = 15395562;
         }
         var _loc13_:uint = param3 == 0 ? 10 : 0;
         var _loc14_:uint = 11;
         var _loc15_:TextField = §_-7Yu§.§_-4Dd§(_loc13_,0,param3,_loc14_,param2,_loc12_,§_-7Yu§.§_-3oF§);
         var _loc16_:TextField = §_-7Yu§.§_-4Dd§(_loc13_,0,param3,_loc14_,param2,_loc11_,§_-7Yu§.§_-3oF§);
         if(param3 == 0)
         {
            param3 = _loc15_.textWidth + 24;
         }
         _loc16_.y = Math.round((param4 - _loc15_.textHeight) / 2) - 2;
         _loc15_.y = _loc16_.y + 1;
         §_-7Yu§.rect(this,0,0,param3,param4,_loc7_,_loc5_);
         §_-7Yu§.§_-Bs4§(this,0,param3,0,_loc6_);
         §_-7Yu§.§_-CL3§(this,1,1,param3 - 2,param4 - 2,_loc9_);
         §_-7Yu§.§_-Bs4§(this,1,param3 - 1,1,_loc8_);
         §_-7Yu§.§_-Bs4§(this,2,param3 - 2,param4 - 1,_loc10_);
         addChild(_loc15_);
         addChild(_loc16_);
      }
   }
}

