package §_-Bi2§
{
   import §_-2U3§.ResourceManager;
   import §_-3eZ§.§_-BCG§;
   import §_-AKx§.§_-9lR§;
   import §_-AaA§.§_-5Kl§;
   import flash.display.GradientType;
   import flash.display.Graphics;
   import flash.display.SpreadMethod;
   import flash.display.Sprite;
   import flash.geom.Matrix;
   import flash.geom.Rectangle;
   import flash.text.TextField;
   
   public class §_-0sd§ implements §_-Fs§
   {
      private static const LEFT_CLIENT_OFFSET:uint = 20;
      
      private static const §_-0xq§:uint = 50;
      
      private static const §_-1Vj§:uint = 20;
      
      private static const §_-BkW§:uint = 15;
      
      public function §_-0sd§()
      {
         super();
      }
      
      public function drawTitle(param1:String, param2:Sprite, param3:uint) : void
      {
         var _loc4_:Sprite = new Sprite();
         var _loc5_:Graphics = _loc4_.graphics;
         _loc5_.clear();
         var _loc6_:Matrix = new Matrix();
         _loc6_.createGradientBox(param3,31,Math.PI / 2,0,0);
         _loc5_.beginGradientFill(GradientType.LINEAR,[11457090,6255889],[1,1],[0,255],_loc6_,SpreadMethod.PAD);
         _loc5_.drawRoundRect(0,0,param3 - 4,36,5);
         _loc5_.endFill();
         _loc5_.lineStyle(1,4083207,1,true);
         _loc5_.moveTo(0,31);
         _loc5_.lineTo(param3 - 5,31);
         _loc5_.lineStyle(1,14737117,1,true);
         _loc5_.moveTo(0,32);
         _loc5_.lineTo(param3 - 5,32);
         _loc5_.lineStyle(1,0,0,true);
         _loc5_.beginBitmapFill(ResourceManager.createBitmapData("DialogTileBg@ui",4,4));
         _loc5_.drawRect(0,32,param3 - 4,5);
         _loc5_.endFill();
         _loc4_.x = 2;
         _loc4_.y = 2;
         param2.addChild(_loc4_);
         var _loc7_:TextField = this.drawTitleField(param1,param3);
         _loc4_.addChild(_loc7_);
      }
      
      protected function drawTitleField(param1:String, param2:int) : TextField
      {
         var _loc3_:TextField = §_-5Kl§.createTextField(0,12,param1,§_-5Kl§.§_-2H1§,{});
         _loc3_.x = param2 / 2 - _loc3_.width / 2;
         _loc3_.y = 16 - _loc3_.height / 2;
         return _loc3_;
      }
      
      public function drawBackground(param1:int, param2:int, param3:Sprite) : void
      {
         var _loc4_:Sprite = new Sprite();
         var _loc5_:Graphics = _loc4_.graphics;
         _loc5_.beginBitmapFill(ResourceManager.createBitmapData("DialogTileBg@ui",4,4));
         _loc5_.drawRect(2,2,param1 - 4,param2 - 4);
         _loc5_.endFill();
         param3.addChild(_loc4_);
      }
      
      public function drawBorder(param1:int, param2:int, param3:Sprite) : void
      {
         var _loc4_:Sprite = new Sprite();
         var _loc5_:Graphics = _loc4_.graphics;
         _loc5_.clear();
         var _loc6_:Matrix = new Matrix();
         _loc6_.createGradientBox(param1,param2,Math.PI / 2,0,0);
         var _loc7_:Array = [11711154,16185078,7894903];
         var _loc8_:Array = [1,1,1];
         var _loc9_:Array = [0,100,255];
         _loc5_.lineStyle(4);
         _loc5_.lineGradientStyle(GradientType.LINEAR,_loc7_,_loc8_,_loc9_,_loc6_);
         _loc5_.drawRoundRect(0,0,param1,param2,5);
         param3.addChild(_loc4_);
      }
      
      public function drawCloseButton(param1:Sprite, param2:uint) : §_-BCG§
      {
         var _loc3_:§_-9lR§ = new §_-9lR§();
         _loc3_.x = param2 - _loc3_.width - 9;
         _loc3_.y = 6;
         param1.addChild(_loc3_);
         return _loc3_;
      }
      
      public function get clientBounds() : Rectangle
      {
         var _loc1_:Rectangle = new Rectangle();
         _loc1_.left = LEFT_CLIENT_OFFSET;
         _loc1_.right = §_-1Vj§;
         _loc1_.top = §_-0xq§;
         _loc1_.bottom = §_-BkW§;
         return _loc1_;
      }
   }
}

