package §_-3eZ§
{
   import §_-AaA§.§_-5Kl§;
   import §_-GM§.Context;
   import flash.display.MovieClip;
   import flash.text.AntiAliasType;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   
   public class UILabelButton extends §_-BCG§
   {
      protected var §_-AG7§:TextField = null;
      
      protected var §_-0U5§:TextFormat = new TextFormat();
      
      protected var §_-2J-§:TextFormat = null;
      
      protected var §_-9VR§:TextFormat = null;
      
      protected var §_-8eE§:TextFormat = null;
      
      protected var §_-7lW§:TextFormat = null;
      
      protected var §_-0eq§:int = 0;
      
      protected var §_-BAA§:int = 0;
      
      public function UILabelButton(param1:int, param2:int, param3:MovieClip = null, param4:String = "UILabelButton", param5:TextFormat = null)
      {
         super(param3);
         §_-4pH§ = false;
         this.§_-0eq§ = param1;
         this.§_-BAA§ = param2;
         this.applyAssetSize();
         if(param5 != null)
         {
            this.§_-0U5§ = param5;
         }
         this.addTextField(param4);
      }
      
      protected function applyAssetSize() : void
      {
         if(§_-0Nm§ != null)
         {
            if(this.§_-0eq§ != 0)
            {
               §_-0Nm§.width = this.§_-0eq§;
            }
            if(this.§_-BAA§ != 0)
            {
               §_-0Nm§.height = this.§_-BAA§;
            }
         }
      }
      
      protected function addTextField(param1:String) : void
      {
         this.§_-AG7§ = this.createTextField(param1,this.§_-0U5§);
         this.updateTextPosition();
         addChild(this.§_-AG7§);
      }
      
      protected function createTextField(param1:String, param2:TextFormat = null) : TextField
      {
         this.§_-0U5§ = param2;
         var _loc3_:TextField = new TextField();
         _loc3_.autoSize = TextFieldAutoSize.LEFT;
         _loc3_.antiAliasType = AntiAliasType.ADVANCED;
         _loc3_.mouseEnabled = false;
         _loc3_.selectable = false;
         _loc3_.embedFonts = true;
         _loc3_.text = param1;
         if(this.§_-0U5§ != null)
         {
            _loc3_.setTextFormat(this.§_-0U5§);
         }
         return _loc3_;
      }
      
      protected function drawTextFormat(param1:String) : void
      {
         this.applyTextFormat(param1,this.§_-AG7§);
      }
      
      protected function applyTextFormat(param1:String, param2:TextField) : void
      {
         if(param2 == null)
         {
            return;
         }
         if(param1 == UP)
         {
            param2.setTextFormat(this.§_-2J-§ != null ? this.§_-2J-§ : this.§_-0U5§);
         }
         if(param1 == DOWN)
         {
            param2.setTextFormat(this.§_-8eE§ != null ? this.§_-8eE§ : this.§_-0U5§);
         }
         if(param1 == OVER)
         {
            param2.setTextFormat(this.§_-9VR§ != null ? this.§_-9VR§ : this.§_-0U5§);
         }
         if(param1 == DISABLED)
         {
            param2.setTextFormat(this.§_-7lW§ != null ? this.§_-7lW§ : this.§_-0U5§);
         }
      }
      
      override protected function drawState(param1:String) : void
      {
         super.drawState(param1);
         this.drawTextFormat(param1);
      }
      
      public function get label() : String
      {
         return this.§_-AG7§.text;
      }
      
      public function set label(param1:String) : void
      {
         var _loc2_:* = this.§_-AG7§.text != param1;
         this.§_-AG7§.text = param1;
         this.drawTextFormat(_state == "" ? UP : _state);
         if(_loc2_)
         {
            this.updateTextPosition();
         }
      }
      
      protected function updateTextPosition() : void
      {
         this.§_-AG7§.x = this.§_-0eq§ / 2 - this.§_-AG7§.width / 2 - 1;
         this.§_-AG7§.y = this.§_-BAA§ / 2 - this.§_-AG7§.height / 2 - 1;
      }
      
      protected function updateFilters(param1:Object) : void
      {
         this.§_-BbJ§(param1,this.§_-AG7§);
      }
      
      protected function §_-BbJ§(param1:Object, param2:TextField) : void
      {
         if(param2 == null)
         {
            return;
         }
         var _loc3_:Array = §_-5Kl§.§_-AhI§(param1);
         param2.filters = _loc3_;
      }
      
      public function get textField() : TextField
      {
         return this.§_-AG7§;
      }
      
      public function get clientWidth() : int
      {
         return this.§_-0eq§;
      }
      
      public function set clientWidth(param1:int) : void
      {
         this.§_-0eq§ = param1;
         this.§_-2Oi§();
      }
      
      public function get clientHeight() : int
      {
         return this.§_-BAA§;
      }
      
      public function set clientHeight(param1:int) : void
      {
         this.§_-BAA§ = param1;
         this.§_-2Oi§();
      }
      
      private function §_-2Oi§() : void
      {
         if(§_-0Nm§ != null)
         {
            if(this.§_-0eq§ != 0)
            {
               §_-0Nm§.width = this.§_-0eq§;
            }
            if(this.§_-BAA§ != 0)
            {
               §_-0Nm§.height = this.§_-BAA§;
            }
         }
      }
      
      public function get §_-3OB§() : Boolean
      {
         return Context.instance.§_-AIA§.§_-3OB§;
      }
      
      override public function destroy() : void
      {
         if(destroyed)
         {
            return;
         }
         this.§_-AG7§ = null;
         this.§_-0U5§ = null;
         this.§_-2J-§ = null;
         this.§_-9VR§ = null;
         this.§_-8eE§ = null;
         this.§_-7lW§ = null;
         super.destroy();
      }
   }
}

