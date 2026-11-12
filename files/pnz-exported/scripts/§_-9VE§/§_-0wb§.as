package §_-9VE§
{
   import §_-6-L§.DisplayUtils;
   import §_-6JL§.§_-B9P§;
   import §_-7np§.ConsoleService;
   import §_-7xl§.§_-8Ks§;
   import §_-GM§.Context;
   import ags.§_-5x-§;
   import flash.display.Graphics;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.text.TextField;
   import flash.text.TextFormat;
   import flash.utils.Timer;
   import penzville.Config;
   
   public class §_-0wb§ extends Sprite implements §_-8Ks§
   {
      private static const WIDTH:int = 100;
      
      private static const §_-621§:int = 45;
      
      private static const §_-BpJ§:int = 4;
      
      private static const §_-81x§:uint = 0;
      
      private static const §_-BGZ§:Number = 0.7;
      
      private static const §_-2-y§:uint = 6710886;
      
      private static const §_-1Yo§:uint = 16777215;
      
      private static const §_-8Dc§:uint = 65280;
      
      private static const §_-17T§:uint = 16711680;
      
      private static const §_-4Hz§:int = 2000;
      
      private var §_-8RM§:Sprite;
      
      private var §_-2fJ§:TextField;
      
      private var §_-4hx§:TextField;
      
      private var §_-7Zk§:String = "";
      
      private var _userId:String = "";
      
      private var §_-Aie§:Boolean = false;
      
      private var _destroyed:Boolean = false;
      
      private var §_-Bci§:Boolean = false;
      
      private var §_-74d§:Number = 0;
      
      private var §_-1jU§:Number = 0;
      
      private var §_-8GW§:Number = 0;
      
      private var §_-08e§:Number = 0;
      
      private var §_-CHu§:Timer;
      
      private var §_-4p6§:Sprite;
      
      public function §_-0wb§()
      {
         super();
         this.§_-7qW§();
         Context.§_-CLP§.addEventListener(§_-B9P§.RESIZE,this.onResize);
         this.§_-CHu§ = new Timer(§_-4Hz§);
         this.§_-CHu§.addEventListener(TimerEvent.TIMER,this.§_-AkT§);
         this.§_-CHu§.start();
         this.updatePosition();
      }
      
      private function §_-7qW§() : void
      {
         var _loc1_:TextFormat = null;
         this.§_-8RM§ = new Sprite();
         this.updateBackground();
         addChild(this.§_-8RM§);
         _loc1_ = new TextFormat("Arial",10,§_-1Yo§);
         this.§_-2fJ§ = new TextField();
         this.§_-2fJ§.defaultTextFormat = _loc1_;
         this.§_-2fJ§.width = WIDTH - §_-BpJ§ * 2;
         this.§_-2fJ§.height = 30;
         this.§_-2fJ§.x = §_-BpJ§;
         this.§_-2fJ§.y = §_-BpJ§;
         this.§_-2fJ§.multiline = true;
         this.§_-2fJ§.wordWrap = true;
         this.§_-2fJ§.selectable = false;
         this.§_-2fJ§.mouseEnabled = false;
         this.§_-2fJ§.background = false;
         addChild(this.§_-2fJ§);
         this.§_-4hx§ = new TextField();
         this.§_-4hx§.defaultTextFormat = _loc1_;
         this.§_-4hx§.width = WIDTH - §_-BpJ§ * 2;
         this.§_-4hx§.height = 15;
         this.§_-4hx§.x = §_-BpJ§;
         this.§_-4hx§.y = §_-BpJ§ + 25;
         this.§_-4hx§.selectable = false;
         this.§_-4hx§.mouseEnabled = false;
         this.§_-4hx§.background = false;
         addChild(this.§_-4hx§);
         this.§_-4p6§ = this.createCloseButton();
         this.§_-4p6§.x = width - this.§_-4p6§.width - 2;
         this.§_-4p6§.y = 2;
         this.§_-4p6§.addEventListener(MouseEvent.CLICK,this.onCloseClick);
         addChild(this.§_-4p6§);
         addEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown);
         addEventListener(MouseEvent.CLICK,this.onClick);
         this.updatePosition();
      }
      
      private function onCloseClick(param1:MouseEvent) : void
      {
         param1.preventDefault();
         visible = false;
      }
      
      private function updateBackground() : void
      {
         this.§_-8RM§.graphics.clear();
         this.§_-8RM§.graphics.lineStyle(1,§_-2-y§);
         this.§_-8RM§.graphics.beginFill(§_-81x§,§_-BGZ§);
         this.§_-8RM§.graphics.drawRect(0,0,WIDTH,§_-621§);
         this.§_-8RM§.graphics.endFill();
      }
      
      private function updatePosition() : void
      {
         x = Config.§_-50z§ - WIDTH - 20;
         y = 20;
      }
      
      private function §_-8Av§() : void
      {
         var _loc1_:Number = x;
         var _loc2_:Number = y;
         var _loc3_:Boolean = false;
         if(x + WIDTH > Config.§_-50z§)
         {
            _loc1_ = Config.§_-50z§ - WIDTH - 10;
            _loc3_ = true;
         }
         if(x < 0)
         {
            _loc1_ = 10;
            _loc3_ = true;
         }
         if(y + §_-621§ > Config.§_-6Z0§)
         {
            _loc2_ = Config.§_-6Z0§ - §_-621§ - 10;
            _loc3_ = true;
         }
         if(y < 0)
         {
            _loc2_ = 10;
            _loc3_ = true;
         }
         if(_loc3_)
         {
            x = _loc1_;
            y = _loc2_;
         }
      }
      
      private function onResize(param1:Event) : void
      {
         if(!this.§_-Bci§)
         {
            this.§_-8Av§();
         }
         if(visible && Boolean(parent))
         {
            DisplayUtils.§_-6zB§(this);
         }
      }
      
      private function onMouseDown(param1:MouseEvent) : void
      {
         if(param1.target == this || param1.target == this.§_-8RM§)
         {
            this.§_-Bci§ = true;
            this.§_-74d§ = param1.localX;
            this.§_-1jU§ = param1.localY;
            this.§_-8GW§ = x;
            this.§_-08e§ = y;
            stage.addEventListener(MouseEvent.MOUSE_MOVE,this.§_-7jZ§);
            stage.addEventListener(MouseEvent.MOUSE_UP,this.onMouseUp);
            param1.stopPropagation();
         }
      }
      
      private function §_-7jZ§(param1:MouseEvent) : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         if(this.§_-Bci§)
         {
            _loc2_ = param1.stageX - this.§_-74d§;
            _loc3_ = param1.stageY - this.§_-1jU§;
            _loc2_ = Math.max(0,Math.min(_loc2_,Config.§_-50z§ - WIDTH));
            _loc3_ = Math.max(0,Math.min(_loc3_,Config.§_-6Z0§ - §_-621§));
            x = _loc2_;
            y = _loc3_;
         }
      }
      
      private function onMouseUp(param1:MouseEvent) : void
      {
         this.§_-Bci§ = false;
         stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.§_-7jZ§);
         stage.removeEventListener(MouseEvent.MOUSE_UP,this.onMouseUp);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         var _loc2_:Number = Math.sqrt(Math.pow(x - this.§_-8GW§,2) + Math.pow(y - this.§_-08e§,2));
         if(_loc2_ < 5)
         {
            ConsoleService.instance.§_-4yf§();
            this.hide();
         }
      }
      
      private function §_-AkT§(param1:TimerEvent) : void
      {
         if(visible)
         {
            this.updateInfo();
         }
      }
      
      public function updateInfo() : void
      {
         var netClient:§_-5x-§ = null;
         try
         {
            if(Boolean(Context.§_-2BT§) && Boolean(Context.§_-2BT§.adapter))
            {
               this.§_-7Zk§ = Context.§_-2BT§.adapter.userId || "";
            }
            else
            {
               this.§_-7Zk§ = "";
            }
         }
         catch(e:Error)
         {
            §_-7Zk§ = "";
         }
         try
         {
            if(Boolean(Context.player) && Boolean(Context.player.id))
            {
               this._userId = Context.player.id;
            }
            else if(Boolean(Context.preUserInfo) && Boolean(Context.preUserInfo.id))
            {
               this._userId = Context.preUserInfo.id.toString();
            }
            else
            {
               this._userId = "";
            }
         }
         catch(e:Error)
         {
            _userId = "";
         }
         try
         {
            netClient = ConsoleService.instance.netClient;
            this.§_-Aie§ = netClient != null && netClient.connected;
         }
         catch(e:Error)
         {
            §_-Aie§ = false;
         }
         this.§_-CVN§();
      }
      
      private function §_-CVN§() : void
      {
         var _loc1_:* = "";
         if(this.§_-7Zk§)
         {
            _loc1_ += "SID:" + this.§_-7Zk§ + "\n";
         }
         else
         {
            _loc1_ += "SID:N/A\n";
         }
         if(this._userId)
         {
            _loc1_ += "UID:" + this._userId;
         }
         else
         {
            _loc1_ += "UID:N/A";
         }
         this.§_-2fJ§.text = _loc1_;
         var _loc2_:* = "";
         var _loc3_:uint = §_-1Yo§;
         if(this.§_-Aie§)
         {
            _loc2_ += "ON";
            _loc3_ = §_-8Dc§;
         }
         else
         {
            _loc2_ += "OFF";
            _loc3_ = §_-17T§;
         }
         this.§_-4hx§.text = _loc2_;
         this.§_-4hx§.setTextFormat(new TextFormat(null,null,_loc3_));
      }
      
      public function show() : void
      {
         visible = true;
         this.updateInfo();
         if(parent)
         {
            DisplayUtils.§_-6zB§(this);
         }
      }
      
      public function hide() : void
      {
         visible = false;
      }
      
      public function §_-9JE§() : void
      {
         this.§_-Bci§ = false;
         this.updatePosition();
      }
      
      public function get destroyed() : Boolean
      {
         return this._destroyed;
      }
      
      private function createCloseButton() : Sprite
      {
         var _loc1_:Sprite = new Sprite();
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
         _loc1_.scaleX = _loc1_.scaleY = 1.2;
         return _loc1_;
      }
      
      public function destroy() : void
      {
         if(this.destroyed)
         {
            return;
         }
         this._destroyed = true;
         Context.§_-CLP§.removeEventListener(§_-B9P§.RESIZE,this.onResize);
         removeEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown);
         removeEventListener(MouseEvent.CLICK,this.onClick);
         if(this.§_-4p6§ != null)
         {
            this.§_-4p6§.removeEventListener(MouseEvent.CLICK,this.onCloseClick);
         }
         if(stage)
         {
            stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.§_-7jZ§);
            stage.removeEventListener(MouseEvent.MOUSE_UP,this.onMouseUp);
         }
         if(this.§_-CHu§)
         {
            this.§_-CHu§.stop();
            this.§_-CHu§.removeEventListener(TimerEvent.TIMER,this.§_-AkT§);
            this.§_-CHu§ = null;
         }
         this.§_-8RM§ = null;
         this.§_-2fJ§ = null;
         this.§_-4hx§ = null;
      }
   }
}

