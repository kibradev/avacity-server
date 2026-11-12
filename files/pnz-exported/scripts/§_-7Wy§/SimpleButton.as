package §_-7Wy§
{
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   
   public class SimpleButton extends Sprite
   {
      private var _label:TextField;
      
      private var _width:Number;
      
      private var _height:Number;
      
      private var _color:uint;
      
      private var §_-2g0§:uint;
      
      private var _text:String;
      
      private var §_-4F0§:Function;
      
      public function SimpleButton(param1:String, param2:Number = 80, param3:Number = 30, param4:uint = 6736998, param5:uint = 16777215, param6:Function = null)
      {
         super();
         this._text = param1;
         this._width = param2;
         this._height = param3;
         this._color = param4;
         this.§_-2g0§ = param5;
         this.§_-4F0§ = param6;
         this.createButton();
      }
      
      private function createButton() : void
      {
         graphics.beginFill(this._color);
         graphics.drawRect(0,0,this._width,this._height);
         graphics.endFill();
         this._label = new TextField();
         this._label.text = this._text;
         this._label.autoSize = TextFieldAutoSize.LEFT;
         this._label.textColor = this.§_-2g0§;
         this._label.selectable = false;
         this._label.x = this._width / 2 - this._label.width / 2;
         this._label.y = this._height / 2 - this._label.height / 2;
         addChild(this._label);
         useHandCursor = true;
         buttonMode = true;
         if(this.§_-4F0§ != null)
         {
            addEventListener(MouseEvent.CLICK,this.§_-4F0§);
         }
      }
      
      public function §_-AZI§(param1:Function) : void
      {
         if(this.§_-4F0§ != null)
         {
            removeEventListener(MouseEvent.CLICK,this.§_-4F0§);
         }
         this.§_-4F0§ = param1;
         if(this.§_-4F0§ != null)
         {
            addEventListener(MouseEvent.CLICK,this.§_-4F0§);
         }
      }
      
      public function setText(param1:String) : void
      {
         this._text = param1;
         this._label.text = param1;
         this._label.x = this._width / 2 - this._label.width / 2;
         this._label.y = this._height / 2 - this._label.height / 2;
      }
      
      public function §_-3T4§(param1:uint) : void
      {
         this._color = param1;
         graphics.clear();
         graphics.beginFill(this._color);
         graphics.drawRect(0,0,this._width,this._height);
         graphics.endFill();
      }
      
      public function §_-7j8§(param1:uint) : void
      {
         this.§_-2g0§ = param1;
         this._label.textColor = param1;
      }
      
      public function get text() : String
      {
         return this._text;
      }
      
      public function get color() : uint
      {
         return this._color;
      }
      
      public function get textColor() : uint
      {
         return this.§_-2g0§;
      }
      
      public function get clientWidth() : Number
      {
         return this._width;
      }
      
      public function get clientHeight() : Number
      {
         return this._height;
      }
   }
}

