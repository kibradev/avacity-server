package §_-Bi2§
{
   import §_-2U3§.ResourceManager;
   import §_-3eZ§.§_-BCG§;
   import §_-6-L§.DisplayUtils;
   import §_-AaA§.§_-5Kl§;
   import flash.display.BitmapData;
   import flash.display.Graphics;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.text.TextField;
   
   public class §_-5bz§ implements §_-Fs§
   {
      protected static const §_-0IT§:int = 8;
      
      protected static const §_-1Vj§:int = 8;
      
      protected static const §_-BkW§:int = 8;
      
      protected static const LEFT_CLIENT_OFFSET:int = 8;
      
      private static const §_-387§:String = "Left";
      
      private static const §_-4Dy§:String = "Center";
      
      private static const §_-32S§:String = "Right";
      
      private static const §_-Sq§:int = 30;
      
      private static const §_-6tj§:String = "NSUIDialogHeader@ui";
      
      private static const §_-22a§:String = "ClanDialogCloseIcon";
      
      private static const §_-9WS§:String = null;
      
      private static const §_-6Ot§:String = §_-5Kl§.§_-9c0§;
      
      private static const §_-9H5§:int = -60;
      
      private static const §_-2pH§:int = 0;
      
      private static const §_-1a2§:int = 14;
      
      private static const §_-0xq§:int = 32;
      
      protected static const §_-39k§:uint = 16710621;
      
      private static const §_-1Uu§:uint = 15974155;
      
      private static const §_-B7I§:uint = 10207033;
      
      private static const §_-5tS§:int = 14;
      
      private static const §_-2MD§:int = -16;
      
      protected var §_-8Va§:MovieClip = null;
      
      protected var _text:String = null;
      
      protected var §_-AKu§:Sprite = null;
      
      protected var §_-CTt§:uint = 0;
      
      public function §_-5bz§()
      {
         super();
      }
      
      public function drawTitle(param1:String, param2:Sprite, param3:uint) : void
      {
         this.§_-AKu§ = param2;
         this.§_-CTt§ = param3;
         this.addHeader(param1,param2,param3);
      }
      
      public function drawBackground(param1:int, param2:int, param3:Sprite) : void
      {
         var _loc4_:Sprite = new Sprite();
         var _loc5_:Graphics = _loc4_.graphics;
         _loc5_.beginFill(this.getBackgroundColor());
         _loc5_.drawRect(2,2,param1 - 4,param2 - 4);
         _loc5_.endFill();
         param3.addChild(_loc4_);
      }
      
      public function drawBorder(param1:int, param2:int, param3:Sprite) : void
      {
         var _loc4_:Sprite = new Sprite();
         var _loc5_:Graphics = _loc4_.graphics;
         _loc5_.lineStyle(6,this.innerBorderColor);
         _loc5_.drawRoundRect(4,4,param1 - 8,param2 - 8,4);
         _loc5_.lineStyle(3,this.outerBorderColor);
         _loc5_.drawRoundRect(1,1,param1 - 2,param2 - 2,6);
         param3.addChild(_loc4_);
      }
      
      public function drawCloseButton(param1:Sprite, param2:uint) : §_-BCG§
      {
         var _loc3_:§_-BCG§ = null;
         _loc3_ = new §_-BCG§(this.getCloseButtonAsset());
         _loc3_.x = param2 - _loc3_.width - §_-5tS§;
         _loc3_.y = §_-5tS§;
         param1.addChild(_loc3_);
         return _loc3_;
      }
      
      protected function getCloseButtonAsset() : MovieClip
      {
         return ResourceManager.createMovieClip(this.getCloseButtonAssetName() + "@ui");
      }
      
      protected function getCloseButtonAssetName() : String
      {
         return §_-22a§;
      }
      
      public function get clientBounds() : Rectangle
      {
         var _loc1_:Rectangle = new Rectangle();
         _loc1_.left = LEFT_CLIENT_OFFSET;
         _loc1_.right = §_-1Vj§;
         _loc1_.bottom = §_-BkW§;
         var _loc2_:int = this.getTopClientOffset();
         _loc1_.top = _loc2_ > 0 ? _loc2_ : §_-0IT§;
         return _loc1_;
      }
      
      protected function addHeader(param1:String, param2:Sprite, param3:int) : void
      {
         if(this.§_-8Va§ != null && param2.contains(this.§_-8Va§))
         {
            param2.removeChild(this.§_-8Va§);
            this.§_-8Va§ = null;
         }
         this.§_-8Va§ = new MovieClip();
         this.createHeaderBoard(this.§_-8Va§,param1);
         this.§_-8Va§.x = param3 / 2 - this.§_-8Va§.width / 2;
         this.§_-8Va§.y = §_-2MD§ + this.getHeaderYOffset();
         param2.addChild(this.§_-8Va§);
         this.addHeaderIcon();
      }
      
      protected function createIcon(param1:Sprite) : MovieClip
      {
         var _loc2_:String = this.getIconAssetName();
         if(_loc2_ == null)
         {
            return new MovieClip();
         }
         var _loc3_:MovieClip = ResourceManager.createMovieClip(_loc2_);
         if(_loc3_ == null)
         {
            return new MovieClip();
         }
         return this.placeHeaderIcon(param1,_loc3_);
      }
      
      protected function placeHeaderIcon(param1:Sprite, param2:MovieClip) : MovieClip
      {
         param2.x = param1.width / 2 - param2.width / 2;
         param2.y = this.getIconPosY();
         return param2;
      }
      
      protected function addHeaderIcon() : void
      {
         var _loc1_:MovieClip = this.createIcon(this.§_-8Va§);
         if(_loc1_ != null)
         {
            this.§_-8Va§.addChild(_loc1_);
            DisplayUtils.§_-36C§(_loc1_);
         }
      }
      
      protected function createHeaderBoard(param1:MovieClip, param2:String) : void
      {
         var headerText:TextField;
         var iconCentralPart:MovieClip = null;
         var iconRightPart:MovieClip = null;
         var iconCentralPartFromLeftPart:MovieClip = null;
         var bounds:Rectangle = null;
         var matrix:Matrix = null;
         var iconCentralPartBDSnapshot:BitmapData = null;
         var iconCentralPartBD:BitmapData = null;
         var iconCentralPartFromLeftPartContainer:MovieClip = null;
         var iconRightPartFromLeftPart:MovieClip = null;
         var container:MovieClip = param1;
         var text:String = param2;
         var iconLeftPart:MovieClip = this.§_-1X4§();
         iconLeftPart.gotoAndStop(§_-387§);
         container.addChild(iconLeftPart);
         iconCentralPart = this.§_-01l§();
         try
         {
            iconCentralPart.gotoAndStop(§_-4Dy§);
         }
         catch(e:ArgumentError)
         {
            iconCentralPartFromLeftPart = new MovieClip();
            bounds = iconCentralPart.getBounds(iconCentralPart);
            matrix = new Matrix();
            matrix.translate(0,-bounds.y);
            iconCentralPartBDSnapshot = new BitmapData(iconCentralPart.width,iconCentralPart.height,true,0);
            iconCentralPartBDSnapshot.draw(iconCentralPart,matrix);
            iconCentralPartBD = new BitmapData(1,iconCentralPart.height,true,0);
            iconCentralPartBD.copyPixels(iconCentralPartBDSnapshot,new Rectangle(iconCentralPart.width - 1,0,1,iconCentralPart.height),new Point(0,0));
            iconCentralPartFromLeftPart.graphics.beginBitmapFill(iconCentralPartBD);
            iconCentralPartFromLeftPart.graphics.drawRect(0,0,1,iconCentralPartBDSnapshot.height);
            iconCentralPartFromLeftPart.graphics.endFill();
            iconCentralPartFromLeftPart.y = -Math.abs(bounds.y);
            iconCentralPartFromLeftPartContainer = new MovieClip();
            iconCentralPartFromLeftPartContainer.addChild(iconCentralPartFromLeftPart);
            iconCentralPart = iconCentralPartFromLeftPartContainer;
         }
         iconCentralPart.x = iconLeftPart.width;
         headerText = this.createTitleTextField(text);
         if(headerText.width > iconCentralPart.width)
         {
            iconCentralPart.width = headerText.width - this.getHeaderIconPartOverlay() * 2;
         }
         headerText.x = iconCentralPart.x + iconCentralPart.width / 2 - headerText.width / 2;
         headerText.y = §_-2MD§ + this.getTextYOffset();
         container.addChild(iconCentralPart);
         iconRightPart = this.§_-7bq§();
         try
         {
            iconRightPart.gotoAndStop(§_-32S§);
         }
         catch(e:ArgumentError)
         {
            iconRightPartFromLeftPart = new MovieClip();
            iconRightPartFromLeftPart.addChild(iconRightPart);
            iconRightPart.scaleX = -1;
            iconRightPart.x = iconRightPart.width;
            iconRightPart = iconRightPartFromLeftPart;
         }
         iconRightPart.x = iconCentralPart.x + iconCentralPart.width;
         container.addChild(iconRightPart);
         container.addChild(headerText);
      }
      
      protected function getHeaderIconPartOverlay() : int
      {
         return §_-Sq§;
      }
      
      protected function createTitleTextField(param1:String) : TextField
      {
         return §_-5Kl§.createTextField(0,0,param1,this.getHeaderTextStyle());
      }
      
      private function §_-1X4§() : MovieClip
      {
         return ResourceManager.createMovieClip(this.getHeaderAssetName());
      }
      
      private function §_-7bq§() : MovieClip
      {
         return ResourceManager.createMovieClip(this.getHeaderAssetName());
      }
      
      private function §_-01l§() : MovieClip
      {
         return ResourceManager.createMovieClip(this.getHeaderAssetName());
      }
      
      protected function getHeaderAssetName() : String
      {
         return §_-6tj§;
      }
      
      protected function getHeaderTextStyle() : String
      {
         return §_-6Ot§;
      }
      
      protected function getTextYOffset() : int
      {
         return §_-1a2§;
      }
      
      protected function getHeaderYOffset() : int
      {
         return §_-2pH§;
      }
      
      protected function getTopClientOffset() : int
      {
         return §_-0xq§;
      }
      
      protected function getIconAssetName() : String
      {
         return §_-9WS§;
      }
      
      protected function getIconPosY() : int
      {
         return §_-9H5§;
      }
      
      public function get headerContainer() : MovieClip
      {
         return this.§_-8Va§;
      }
      
      protected function getBackgroundColor() : int
      {
         return §_-39k§;
      }
      
      public function get innerBorderColor() : uint
      {
         return §_-1Uu§;
      }
      
      public function get outerBorderColor() : uint
      {
         return §_-B7I§;
      }
   }
}

