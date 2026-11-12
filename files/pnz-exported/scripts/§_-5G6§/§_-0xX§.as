package §_-5G6§
{
   import §_-0uA§.§_-COU§;
   import §_-6-L§.DisplayUtils;
   import §_-6JL§.§_-B9P§;
   import §_-GM§.Context;
   import flash.display.DisplayObjectContainer;
   import flash.display.Graphics;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.geom.Rectangle;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   import flash.text.TextFormatAlign;
   import flash.ui.Keyboard;
   import penzville.Config;
   
   public class §_-0xX§ implements §_-COU§
   {
      private static const §_-3tU§:Number = 0.7;
      
      private static const §_-39k§:int = 0;
      
      private static const §_-6HG§:int = 300;
      
      private static const §_-2q5§:int = 512;
      
      private var §_-5aS§:TextField;
      
      private var §_-34M§:Sprite;
      
      private var §_-C6w§:Sprite;
      
      private var §_-5xz§:DisplayObjectContainer;
      
      private var §_-3Kl§:Boolean;
      
      private var §_-2w4§:Array;
      
      private var §_-7QG§:int;
      
      private var §_-5Fj§:int;
      
      private var §_-CKC§:Array = [];
      
      private var §_-7xO§:int;
      
      public function §_-0xX§(param1:DisplayObjectContainer)
      {
         super();
         this.§_-34M§ = this.§_-1li§();
         this.§_-C6w§ = this.createCloseButton();
         this.§_-C6w§.addEventListener(MouseEvent.CLICK,this.onCloseClick);
         this.§_-5aS§ = this.§_-2Ts§();
         this.§_-34M§.addChild(this.§_-5aS§);
         this.§_-34M§.addChild(this.§_-C6w§);
         this.§_-5xz§ = param1;
         this.§_-3Kl§ = false;
         this.§_-2w4§ = [];
         Context.§_-CLP§.addEventListener(§_-B9P§.RESIZE,this.onResize);
         this.§_-5xz§.stage.addEventListener(KeyboardEvent.KEY_DOWN,this.§_-aQ§);
         if(Context.instance.§_-AIA§.isMobile)
         {
            this.§_-5xz§.stage.addEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown);
            this.§_-BMu§();
         }
      }
      
      public function show() : void
      {
         if(!this.§_-3Kl§)
         {
            this.§_-0Ak§();
         }
      }
      
      public function write(param1:String, param2:uint, param3:String) : void
      {
         if(param1.length > §_-2q5§)
         {
            param1 = param1.substr(0,§_-2q5§) + " ...";
         }
         var _loc4_:Date = new Date();
         var _loc5_:String = this.§_-1Md§(_loc4_.getHours()) + ":" + this.§_-1Md§(_loc4_.getMinutes()) + ":" + this.§_-1Md§(_loc4_.getSeconds());
         if(this.§_-3Kl§)
         {
            this.§_-B0O§(_loc5_,param1,param2,param3);
            this.§_-1VC§();
         }
         else
         {
            this.§_-2w4§.push({
               "time":_loc5_,
               "message":param1,
               "type":param2,
               "source":param3
            });
            if(this.§_-2w4§.length > §_-6HG§)
            {
               this.§_-2w4§.shift();
            }
         }
      }
      
      private function createCloseButton() : Sprite
      {
         var _loc1_:Sprite = null;
         _loc1_ = new Sprite();
         var _loc2_:Graphics = _loc1_.graphics;
         _loc2_.beginFill(10163734);
         _loc2_.drawRect(0,0,10,10);
         _loc2_.endFill();
         _loc2_.beginFill(14393247);
         _loc2_.moveTo(2,1);
         _loc2_.lineTo(9,8);
         _loc2_.lineTo(8,9);
         _loc2_.lineTo(1,2);
         _loc2_.lineTo(2,1);
         _loc2_.endFill();
         _loc2_.beginFill(14393247);
         _loc2_.moveTo(8,1);
         _loc2_.lineTo(9,2);
         _loc2_.lineTo(2,9);
         _loc2_.lineTo(1,8);
         _loc2_.lineTo(8,1);
         _loc2_.endFill();
         _loc1_.scaleX = _loc1_.scaleY = 2 * Config.§_-C6c§;
         return _loc1_;
      }
      
      private function §_-1li§() : Sprite
      {
         var _loc1_:Sprite = new Sprite();
         _loc1_.graphics.beginFill(§_-39k§,§_-3tU§);
         _loc1_.graphics.drawRect(0,0,Config.§_-50z§,Config.§_-6Z0§);
         return _loc1_;
      }
      
      private function §_-1Md§(param1:int) : String
      {
         return param1 < 10 ? "0" + param1 : param1.toString();
      }
      
      private function §_-B0O§(param1:String, param2:String, param3:uint, param4:String) : void
      {
         var _loc5_:String = this.format(param1,param2,param3,param4);
         var _loc6_:int = this.§_-5aS§.text.length;
         this.§_-5aS§.appendText(_loc5_ + "\n");
         this.§_-5aS§.setTextFormat(this.getTextFormat(param3),_loc6_,this.§_-5aS§.length - 1);
         DisplayUtils.§_-6zB§(this.§_-34M§);
      }
      
      private function §_-1VC§() : void
      {
         if(this.§_-5aS§.numLines > §_-6HG§)
         {
            this.§_-5aS§.replaceText(0,this.§_-5aS§.getLineOffset(this.§_-5aS§.numLines - §_-6HG§),"");
         }
         this.§_-5aS§.scrollV = this.§_-5aS§.maxScrollV;
      }
      
      private function §_-2Ts§() : TextField
      {
         var _loc1_:TextField = null;
         _loc1_ = new TextField();
         _loc1_.width = Config.§_-50z§ - 10;
         _loc1_.height = Config.§_-6Z0§ - 10;
         _loc1_.wordWrap = true;
         _loc1_.autoSize = TextFieldAutoSize.NONE;
         _loc1_.multiline = true;
         _loc1_.defaultTextFormat = new TextFormat("Arial",14,13421772,null,null,null,null,null,TextFormatAlign.LEFT);
         _loc1_.x = 10;
         _loc1_.y = 10;
         _loc1_.selectable = true;
         return _loc1_;
      }
      
      protected function format(param1:String, param2:String, param3:uint, param4:String) : String
      {
         var _loc5_:Array = ["INFO","NOTICE","WARNING","ERROR","CRITICAL"];
         var _loc6_:* = "[" + param1 + "] ";
         if(param3 >= 0 && param3 < _loc5_.length)
         {
            _loc6_ += "[" + _loc5_[param3] + "] ";
         }
         if(param4)
         {
            _loc6_ += "[" + param4 + "] ";
         }
         return _loc6_ + param2;
      }
      
      protected function getTextFormat(param1:uint) : TextFormat
      {
         var _loc2_:TextFormat = new TextFormat();
         var _loc3_:Array = [13421772,9357774,16445618,13534100,16711735];
         _loc2_.color = _loc3_[param1];
         return _loc2_;
      }
      
      private function §_-0Ak§() : void
      {
         var _loc1_:Object = null;
         if(!this.§_-3Kl§)
         {
            this.§_-3Kl§ = true;
            this.§_-5xz§.addChild(this.§_-34M§);
            while(this.§_-2w4§.length > 0)
            {
               _loc1_ = this.§_-2w4§.shift();
               this.§_-B0O§(_loc1_.time,_loc1_.message,_loc1_.type,_loc1_.source);
            }
            this.§_-1VC§();
            this.onResize(null);
            DisplayUtils.§_-6zB§(this.§_-34M§);
         }
         else
         {
            this.§_-3Kl§ = false;
            this.§_-5xz§.removeChild(this.§_-34M§);
         }
      }
      
      private function §_-BMu§() : void
      {
         this.§_-7xO§ = 0;
         this.§_-CKC§ = [];
         var _loc1_:int = Config.§_-50z§ * Config.§_-C6c§;
         var _loc2_:int = Config.§_-6Z0§ * Config.§_-C6c§;
         var _loc3_:int = _loc1_ / 3;
         var _loc4_:int = _loc2_ / 3;
         this.§_-CKC§.push(new Rectangle(0,0,_loc3_,_loc4_));
         this.§_-CKC§.push(new Rectangle(_loc1_ - _loc3_,_loc2_ - _loc4_,_loc3_,_loc4_));
         this.§_-CKC§.push(new Rectangle(_loc1_ - _loc3_,0,_loc3_,_loc4_));
         this.§_-CKC§.push(new Rectangle(0,_loc2_ - _loc4_,_loc3_,_loc4_));
         this.§_-CKC§.push(new Rectangle(0,0,_loc3_,_loc4_));
      }
      
      private function §_-aQ§(param1:KeyboardEvent) : void
      {
         if(param1.keyCode == Keyboard.L && param1.shiftKey && param1.ctrlKey)
         {
            this.§_-0Ak§();
         }
      }
      
      private function onResize(param1:Event) : void
      {
         this.§_-34M§.width = Config.§_-50z§;
         this.§_-34M§.height = Config.§_-6Z0§;
         this.§_-34M§.scaleX = this.§_-34M§.scaleY = Config.§_-C6c§;
         this.§_-34M§.graphics.clear();
         this.§_-34M§.graphics.beginFill(§_-39k§,§_-3tU§);
         this.§_-34M§.graphics.drawRect(0,0,Config.§_-50z§,Config.§_-6Z0§);
         this.§_-5aS§.width = Config.§_-50z§ - 10;
         this.§_-5aS§.height = Config.§_-6Z0§ - 10;
         this.§_-5aS§.scrollV = this.§_-5aS§.maxScrollV;
         this.§_-C6w§.x = Config.§_-50z§ - this.§_-C6w§.width - 10;
         this.§_-C6w§.y = 10;
         this.§_-7QG§ = Config.§_-50z§;
         this.§_-5Fj§ = Config.§_-6Z0§;
         if(Context.instance.§_-AIA§.isMobile)
         {
            this.§_-BMu§();
         }
      }
      
      private function onMouseDown(param1:MouseEvent) : void
      {
         if(Config.§_-50z§ != this.§_-7QG§ || Config.§_-6Z0§ != this.§_-5Fj§)
         {
            this.onResize(null);
         }
         if(!Context.instance.§_-AIA§.isMobile)
         {
            return;
         }
         var _loc2_:Rectangle = this.§_-CKC§[this.§_-7xO§];
         if(_loc2_.contains(param1.stageX,param1.stageY))
         {
            ++this.§_-7xO§;
            if(this.§_-7xO§ >= this.§_-CKC§.length)
            {
               this.§_-7xO§ = 0;
               this.§_-0Ak§();
            }
         }
         else
         {
            this.§_-7xO§ = 0;
         }
      }
      
      private function onCloseClick(param1:MouseEvent) : void
      {
         this.§_-0Ak§();
      }
      
      public function destroy() : void
      {
         if(this.§_-5xz§ == null)
         {
            return;
         }
         if(this.§_-3Kl§)
         {
            this.§_-0Ak§();
         }
         this.§_-5xz§.stage.removeEventListener(KeyboardEvent.KEY_DOWN,this.§_-aQ§);
         if(Context.instance.§_-AIA§.isMobile)
         {
            this.§_-5xz§.stage.removeEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown);
         }
         this.§_-5xz§ = null;
      }
   }
}

