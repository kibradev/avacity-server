package §_-9VE§
{
   import §_-0uA§.§_-COU§;
   import §_-6-L§.DisplayUtils;
   import §_-6JL§.§_-B9P§;
   import §_-7np§.ConsoleService;
   import §_-7np§.§_-8rk§;
   import §_-7xl§.§_-8Ks§;
   import §_-85l§.§_-55d§;
   import §_-85l§.§_-BV3§;
   import §_-GM§.Context;
   import §_-ti§.§_-1RU§;
   import §_-ti§.§_-ACm§;
   import §_-ti§.§_-NM§;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.text.TextField;
   import flash.text.TextFieldType;
   import flash.text.TextFormat;
   import flash.ui.Keyboard;
   import penzville.Config;
   
   public class §_-9TS§ extends Sprite implements §_-COU§, §_-8Ks§
   {
      private static const WIDTH:int = 600;
      
      private static const §_-621§:int = 400;
      
      private static const §_-BpJ§:int = 10;
      
      private static const §_-81x§:uint = 0;
      
      private static const §_-BGZ§:Number = 0.8;
      
      private static const §_-1Yo§:uint = 16777215;
      
      private static const §_-VV§:int = 100;
      
      private static const §_-2q5§:int = 512;
      
      private var §_-B-b§:TextField;
      
      private var §_-9KB§:TextField;
      
      private var §_-8RM§:Sprite;
      
      private var §_-86e§:§_-BV3§;
      
      private var §_-COA§:§_-55d§;
      
      private var §_-CMs§:§_-55d§;
      
      private var §_-7du§:§_-nK§;
      
      private var §_-5op§:§_-ACm§;
      
      private var §_-CXg§:Array = [];
      
      private var §_-5aI§:int = -1;
      
      private var §_-2w4§:Array = [];
      
      private var §_-7QG§:int;
      
      private var §_-5Fj§:int;
      
      private var _destroyed:Boolean = false;
      
      public function §_-9TS§(param1:§_-ACm§)
      {
         super();
         this.§_-5op§ = param1;
         this.§_-2w4§ = [];
         this.§_-7qW§();
         visible = false;
         Context.§_-CLP§.addEventListener(§_-B9P§.RESIZE,this.onResize);
      }
      
      private function §_-7qW§() : void
      {
         this.§_-8RM§ = new Sprite();
         this.updateBackground();
         addChild(this.§_-8RM§);
         var _loc1_:TextFormat = new TextFormat("Courier New",12,§_-1Yo§);
         this.§_-B-b§ = new TextField();
         this.§_-B-b§.defaultTextFormat = _loc1_;
         this.§_-hm§();
         this.§_-B-b§.multiline = true;
         this.§_-B-b§.wordWrap = true;
         this.§_-B-b§.selectable = true;
         this.§_-B-b§.mouseEnabled = true;
         this.§_-B-b§.background = false;
         addChild(this.§_-B-b§);
         this.§_-9KB§ = new TextField();
         this.§_-9KB§.defaultTextFormat = _loc1_;
         this.§_-9KB§.type = TextFieldType.INPUT;
         this.§_-9KB§.border = true;
         this.§_-9KB§.borderColor = 6710886;
         this.§_-9KB§.background = true;
         this.§_-9KB§.backgroundColor = 3355443;
         this.§_-9KB§.addEventListener(KeyboardEvent.KEY_DOWN,this.§_-8mX§);
         addChild(this.§_-9KB§);
         this.§_-CMs§ = new §_-55d§("CLI",13421772,12);
         addChild(this.§_-CMs§);
         this.§_-86e§ = new §_-BV3§(false);
         this.§_-86e§.addEventListener("change",this.§_-Bil§);
         addChild(this.§_-86e§);
         this.§_-COA§ = new §_-55d§("GUI",13421772,12);
         addChild(this.§_-COA§);
         this.§_-i0§();
         this.§_-7QG§ = WIDTH;
         this.§_-5Fj§ = §_-621§;
      }
      
      private function updateBackground() : void
      {
         this.§_-8RM§.graphics.clear();
         this.§_-8RM§.graphics.beginFill(§_-81x§,§_-BGZ§);
         this.§_-8RM§.graphics.drawRect(0,0,Config.§_-50z§,Config.§_-6Z0§);
         this.§_-8RM§.graphics.endFill();
         this.§_-8RM§.width = Config.§_-50z§;
         this.§_-8RM§.height = Config.§_-6Z0§;
         this.§_-8RM§.scaleX = this.§_-8RM§.scaleY = Config.§_-C6c§;
      }
      
      private function §_-hm§() : void
      {
         this.§_-B-b§.width = Config.§_-50z§ - §_-BpJ§ * 2;
         this.§_-B-b§.height = Config.§_-6Z0§ - 30 - §_-BpJ§ * 2;
         this.§_-B-b§.x = §_-BpJ§;
         this.§_-B-b§.y = §_-BpJ§;
         this.§_-B-b§.scrollV = this.§_-B-b§.maxScrollV;
      }
      
      private function §_-i0§() : void
      {
         this.§_-9KB§.width = Config.§_-50z§ - §_-BpJ§ * 2 - 100;
         this.§_-9KB§.height = 20;
         this.§_-9KB§.x = §_-BpJ§;
         this.§_-9KB§.y = Config.§_-6Z0§ - 30;
         this.§_-CMs§.x = Config.§_-50z§ - §_-BpJ§ - 95;
         this.§_-CMs§.y = Config.§_-6Z0§ - 30;
         this.§_-86e§.x = Config.§_-50z§ - §_-BpJ§ - 67;
         this.§_-86e§.y = Config.§_-6Z0§ - 30;
         this.§_-COA§.x = Config.§_-50z§ - §_-BpJ§ - 20;
         this.§_-COA§.y = Config.§_-6Z0§ - 30;
      }
      
      private function onResize(param1:Event) : void
      {
         this.updateBackground();
         this.§_-hm§();
         this.§_-i0§();
         if(visible)
         {
            DisplayUtils.§_-6zB§(this);
         }
         this.§_-7QG§ = Config.§_-50z§;
         this.§_-5Fj§ = Config.§_-6Z0§;
      }
      
      private function §_-Bil§(param1:Event) : void
      {
      }
      
      private function §_-1As§(param1:String) : void
      {
         if(this.§_-86e§.value)
         {
            this.§_-7Ot§(param1);
         }
         else
         {
            ConsoleService.instance.§_-7F7§(param1);
         }
      }
      
      private function §_-7Ot§(param1:String) : void
      {
         var _loc2_:Array = param1.split(" ");
         var _loc3_:String = _loc2_[0];
         var _loc4_:§_-1RU§ = this.§_-5op§.§_-8yl§(_loc3_);
         if(!_loc4_)
         {
            ConsoleService.instance.log("Unknown command: " + _loc3_,§_-8rk§.ERROR);
            return;
         }
         if(_loc4_.§_-7Of§ > ConsoleService.instance.§_-76V§)
         {
            ConsoleService.instance.log("Access denied",§_-8rk§.ERROR);
            return;
         }
         var _loc5_:Object = this.§_-5-M§(_loc2_.slice(1));
         var _loc6_:Object = _loc4_.descriptor.validateParameters(_loc5_);
         if(_loc6_.valid)
         {
            ConsoleService.instance.§_-7F7§(param1);
         }
         else
         {
            this.§_-75l§(_loc4_);
         }
      }
      
      private function §_-75l§(param1:§_-1RU§) : void
      {
         if(Boolean(this.§_-7du§) && Boolean(this.§_-7du§.parent))
         {
            this.§_-7du§.parent.removeChild(this.§_-7du§);
         }
         this.§_-7du§ = new §_-nK§(param1,this.§_-9zL§,this.§_-3Pp§);
         this.§_-7du§.§_-5Rx§(Config.§_-50z§,Config.§_-6Z0§);
         addChild(this.§_-7du§);
      }
      
      private function §_-9zL§(param1:Object) : void
      {
         var _loc3_:§_-NM§ = null;
         var _loc2_:§_-1RU§ = !!this.§_-7du§ ? this.§_-7du§.command : null;
         if(Boolean(this.§_-7du§) && Boolean(this.§_-7du§.parent))
         {
            this.§_-7du§.parent.removeChild(this.§_-7du§);
            this.§_-7du§ = null;
         }
         if(_loc2_)
         {
            _loc3_ = _loc2_.execute(param1);
            ConsoleService.instance.§_-0A6§(_loc3_);
         }
      }
      
      private function §_-3Pp§() : void
      {
         if(Boolean(this.§_-7du§) && Boolean(this.§_-7du§.parent))
         {
            this.§_-7du§.parent.removeChild(this.§_-7du§);
            this.§_-7du§ = null;
         }
      }
      
      private function §_-5-M§(param1:Array) : Object
      {
         var _loc5_:String = null;
         var _loc2_:Object = {};
         var _loc3_:String = null;
         var _loc4_:int = 0;
         while(_loc4_ < param1.length)
         {
            _loc5_ = String(param1[_loc4_]);
            if(_loc5_.charAt(0) == "-")
            {
               _loc3_ = _loc5_.substr(1);
               _loc2_[_loc3_] = true;
            }
            else if(_loc3_)
            {
               _loc2_[_loc3_] = _loc5_;
               _loc3_ = null;
            }
            _loc4_++;
         }
         return _loc2_;
      }
      
      private function §_-8mX§(param1:KeyboardEvent) : void
      {
         var _loc2_:String = null;
         if(param1.keyCode == Keyboard.ENTER)
         {
            _loc2_ = this.§_-9KB§.text;
            if(Boolean(_loc2_) && _loc2_.length > 0)
            {
               this.§_-CXg§.push(_loc2_);
               if(this.§_-CXg§.length > 20)
               {
                  this.§_-CXg§.shift();
               }
               this.§_-5aI§ = this.§_-CXg§.length;
               this.§_-1As§(_loc2_);
               this.§_-9KB§.text = "";
            }
         }
         else if(param1.keyCode == Keyboard.UP)
         {
            if(this.§_-CXg§.length > 0 && this.§_-5aI§ > 0)
            {
               --this.§_-5aI§;
               this.§_-9KB§.text = this.§_-CXg§[this.§_-5aI§];
               this.§_-9KB§.setSelection(this.§_-9KB§.text.length,this.§_-9KB§.text.length);
            }
            param1.preventDefault();
         }
         else if(param1.keyCode == Keyboard.DOWN)
         {
            if(this.§_-5aI§ < this.§_-CXg§.length - 1)
            {
               ++this.§_-5aI§;
               this.§_-9KB§.text = this.§_-CXg§[this.§_-5aI§];
               this.§_-9KB§.setSelection(this.§_-9KB§.text.length,this.§_-9KB§.text.length);
            }
            else if(this.§_-5aI§ == this.§_-CXg§.length - 1)
            {
               this.§_-5aI§ = this.§_-CXg§.length;
               this.§_-9KB§.text = "";
            }
            param1.preventDefault();
         }
         else if(param1.keyCode == Keyboard.ESCAPE)
         {
            ConsoleService.instance.§_-5b0§();
            param1.preventDefault();
         }
      }
      
      public function §_-2FD§(param1:String) : void
      {
         this.write(param1,§_-8rk§.COMMAND,"Console");
      }
      
      public function write(param1:String, param2:uint, param3:String) : void
      {
         var _loc4_:Date = new Date();
         var _loc5_:String = this.§_-1Md§(_loc4_.getHours()) + ":" + this.§_-1Md§(_loc4_.getMinutes()) + ":" + this.§_-1Md§(_loc4_.getSeconds());
         if(visible)
         {
            this.§_-8XI§(_loc5_,param1,param2,param3);
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
            if(this.§_-2w4§.length > §_-VV§)
            {
               this.§_-2w4§.shift();
            }
         }
      }
      
      private function §_-1Md§(param1:int) : String
      {
         return param1 < 10 ? "0" + param1 : param1.toString();
      }
      
      private function §_-8XI§(param1:String, param2:String, param3:uint, param4:String) : void
      {
         var _loc5_:String = this.§_-APr§(param1,param2,param3,param4);
         var _loc6_:int = this.§_-B-b§.text.length;
         this.§_-B-b§.appendText(_loc5_ + "\n");
         this.§_-B-b§.setTextFormat(this.§_-33R§(param3),_loc6_,this.§_-B-b§.length - 1);
         this.§_-B-b§.scrollV = this.§_-B-b§.maxScrollV;
      }
      
      public function clear() : void
      {
         this.§_-B-b§.text = "";
         this.§_-B-b§.scrollV = this.§_-B-b§.maxScrollV;
      }
      
      private function §_-APr§(param1:String, param2:String, param3:uint, param4:String) : String
      {
         var _loc5_:Array = ["INFO","NOTICE","WARNING","ERROR","CRITICAL","COMMAND"];
         var _loc6_:* = "[" + param1 + "] ";
         if(param3 >= 0 && param3 < _loc5_.length)
         {
            _loc6_ += "[" + _loc5_[param3] + "] ";
         }
         if(param4)
         {
            _loc6_ += "[" + param4 + "] ";
         }
         if(param2.length > §_-2q5§ && param3 != §_-8rk§.COMMAND)
         {
            param2 = param2.substr(0,§_-2q5§) + " ...";
         }
         return _loc6_ + param2;
      }
      
      private function §_-33R§(param1:uint) : TextFormat
      {
         var _loc2_:TextFormat = new TextFormat();
         var _loc3_:Array = [13421772,9357774,16445618,13534100,16711735,9491967];
         _loc2_.color = _loc3_[param1];
         return _loc2_;
      }
      
      private function §_-1VC§() : void
      {
         if(this.§_-B-b§.numLines > §_-VV§)
         {
            this.§_-B-b§.replaceText(0,this.§_-B-b§.getLineOffset(this.§_-B-b§.numLines - §_-VV§),"");
         }
         this.§_-B-b§.scrollV = this.§_-B-b§.maxScrollV;
      }
      
      public function §_-Bqo§() : void
      {
         if(stage)
         {
            stage.focus = this.§_-9KB§;
         }
      }
      
      public function hide() : void
      {
         this.§_-A42§(false);
      }
      
      public function show() : void
      {
         this.§_-A42§(true);
      }
      
      private function §_-A42§(param1:Boolean) : void
      {
         var _loc2_:Object = null;
         visible = param1;
         if(param1 && this.§_-2w4§.length > 0)
         {
            while(this.§_-2w4§.length > 0)
            {
               _loc2_ = this.§_-2w4§.shift();
               this.§_-8XI§(_loc2_.time,_loc2_.message,_loc2_.type,_loc2_.source);
            }
            this.§_-1VC§();
         }
      }
      
      public function get destroyed() : Boolean
      {
         return this._destroyed;
      }
      
      public function destroy() : void
      {
         if(this.destroyed)
         {
            return;
         }
         this._destroyed = true;
         Context.§_-CLP§.removeEventListener(§_-B9P§.RESIZE,this.onResize);
         if(this.§_-9KB§)
         {
            this.§_-9KB§.removeEventListener(KeyboardEvent.KEY_DOWN,this.§_-8mX§);
         }
         this.§_-5op§ = null;
         this.§_-CXg§ = null;
         this.§_-2w4§ = null;
      }
   }
}

