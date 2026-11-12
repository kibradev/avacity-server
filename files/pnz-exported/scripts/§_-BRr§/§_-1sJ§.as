package §_-BRr§
{
   import flash.display.Sprite;
   import flash.text.TextField;
   
   internal class §_-1sJ§ extends Sprite
   {
      public function §_-1sJ§(param1:uint, param2:String, param3:uint, param4:uint)
      {
         super();
         var _loc5_:uint = 3893144;
         var _loc6_:uint = 0;
         var _loc7_:uint = 0;
         var _loc8_:uint = 0;
         var _loc9_:uint = 0;
         var _loc10_:uint = 0;
         _loc8_ = 3893144;
         _loc9_ = 16777215;
         _loc10_ = 4548750;
         switch(param1)
         {
            case 1:
               _loc6_ = 8692159;
               _loc8_ = 9612487;
               _loc7_ = 7508919;
               break;
            case 2:
               _loc5_ = 3827093;
               _loc6_ = 6719661;
               _loc8_ = 7640504;
               _loc7_ = 5338782;
               break;
            default:
               _loc6_ = 7180211;
               _loc8_ = 8297660;
               _loc7_ = 6062763;
         }
         var _loc11_:uint = param3 == 0 ? 10 : 0;
         var _loc12_:uint = 11;
         var _loc13_:TextField = §_-7Yu§.§_-4Dd§(_loc11_,0,param3,_loc12_,param2,_loc10_,§_-7Yu§.§_-3oF§);
         var _loc14_:TextField = §_-7Yu§.§_-4Dd§(_loc11_,0,param3,_loc12_,param2,_loc9_,§_-7Yu§.§_-3oF§);
         if(param3 == 0)
         {
            param3 = _loc13_.textWidth + 24;
         }
         _loc14_.y = Math.round((param4 - _loc13_.textHeight) / 2) - 2;
         _loc13_.y = _loc14_.y + 1;
         §_-7Yu§.rect(this,0,0,param3,param4,_loc6_,_loc5_);
         §_-7Yu§.§_-CL3§(this,1,1,param3 - 2,param4 - 2,_loc7_);
         if(param1 == 2)
         {
            §_-7Yu§.§_-Bs4§(this,2,param3 - 2,param4 - 1,_loc8_);
         }
         else
         {
            §_-7Yu§.§_-Bs4§(this,1,param3 - 1,1,_loc8_);
         }
         addChild(_loc13_);
         addChild(_loc14_);
      }
   }
}

