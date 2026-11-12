package §_-3eZ§
{
   import §_-18o§.§_-4jN§;
   import §_-1Fx§.§_-5n7§;
   import §_-6-L§.DisplayUtils;
   import §_-AKx§.§_-GN§;
   import §_-GM§.Context;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Rectangle;
   
   public class §_-BCG§ extends §_-5n7§
   {
      public static const UP:String = "up";
      
      public static const OVER:String = "over";
      
      public static const DOWN:String = "down";
      
      public static const DISABLED:String = "disabled";
      
      public static const §_-72D§:Array = [UP,OVER,DOWN,DISABLED];
      
      protected var §_-5q8§:Boolean = false;
      
      protected var §_-4sO§:Boolean = false;
      
      protected var §_-bp§:Boolean = false;
      
      protected var §_-93n§:Boolean = true;
      
      protected var §_-CTV§:Boolean = true;
      
      protected var §_-0fT§:Boolean = true;
      
      protected var _state:String = "";
      
      protected var §_-0Nm§:MovieClip;
      
      protected var §_-4pH§:Boolean = false;
      
      protected var §_-Buy§:int = 0;
      
      protected var _selected:Boolean = false;
      
      protected var §_-7g9§:Boolean = true;
      
      protected var §_-2c7§:Sprite = null;
      
      private var §_-Aek§:Boolean = true;
      
      public function §_-BCG§(param1:MovieClip = null)
      {
         super();
         addEventListener(MouseEvent.MOUSE_OVER,this.onMouseOver);
         addEventListener(MouseEvent.MOUSE_OUT,this.onMouseOut);
         addEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown);
         addEventListener(MouseEvent.MOUSE_UP,this.onMouseUp);
         addEventListener(MouseEvent.CLICK,this.onClick,false,65535);
         buttonMode = true;
         if(param1 != null)
         {
            this.§_-0Nm§ = param1;
            addChild(this.§_-0Nm§);
         }
         addEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
      }
      
      override public function destroy() : void
      {
         if(destroyed)
         {
            return;
         }
         removeEventListener(MouseEvent.MOUSE_OVER,this.onMouseOver);
         removeEventListener(MouseEvent.MOUSE_OUT,this.onMouseOut);
         removeEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown);
         removeEventListener(MouseEvent.MOUSE_UP,this.onMouseUp);
         removeEventListener(MouseEvent.CLICK,this.onClick);
         removeEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
         removeAllChildren(true,true);
         this.§_-0Nm§ = null;
         super.destroy();
      }
      
      protected function onAddedToStage(param1:Event) : void
      {
         var _loc2_:Sprite = null;
         var _loc3_:Rectangle = null;
         this.draw();
         if(Context.instance.§_-AIA§.§_-3OB§ && this.§_-Aek§)
         {
            _loc2_ = new Sprite();
            _loc2_.graphics.beginFill(0,0);
            _loc3_ = this.oflOverlayBounds;
            _loc2_.graphics.drawRect(_loc3_.x,_loc3_.y,_loc3_.width,_loc3_.height);
            _loc2_.graphics.endFill();
            this.§_-2c7§ = _loc2_;
            addChild(_loc2_);
         }
      }
      
      protected function get oflOverlayBounds() : Rectangle
      {
         return getBounds(this);
      }
      
      public function §_-2id§(param1:Boolean = true, param2:Boolean = true, param3:Boolean = true) : void
      {
         this.§_-CTV§ = param1;
         this.§_-0fT§ = param2;
         this.§_-93n§ = param3;
      }
      
      public function §_-2r0§() : void
      {
         this.§_-Aek§ = false;
         if(this.§_-2c7§ != null)
         {
            removeChild(this.§_-2c7§);
         }
      }
      
      protected function onClick(param1:MouseEvent) : void
      {
         var _loc2_:§_-GN§ = null;
         if(this.§_-5q8§)
         {
            param1.stopImmediatePropagation();
            return;
         }
         if(this.§_-7g9§)
         {
            §_-4jN§.§_-AU8§();
         }
         if(this.§_-Buy§ != 0)
         {
            _loc2_ = §_-GN§(DisplayUtils.§_-1SB§(this,§_-GN§));
            if(_loc2_ != null && _loc2_.§_-B7W§)
            {
               _loc2_.modalResult = this.§_-Buy§;
               _loc2_.close();
            }
         }
      }
      
      protected function drawState(param1:String) : void
      {
         if(this._state != param1)
         {
            this._state = param1;
            if(this.§_-0Nm§ != null)
            {
               try
               {
                  if(this.§_-4pH§)
                  {
                     this.§_-0Nm§.gotoAndPlay(param1);
                  }
                  else
                  {
                     this.§_-0Nm§.gotoAndStop(param1);
                  }
               }
               catch(exeption:ArgumentError)
               {
               }
            }
         }
      }
      
      protected function draw() : void
      {
         var _loc1_:String = UP;
         if(this.§_-5q8§ && this.§_-93n§)
         {
            _loc1_ = DISABLED;
            useHandCursor = false;
         }
         else
         {
            useHandCursor = true;
            if(this.§_-bp§ && this.§_-0fT§)
            {
               _loc1_ = DOWN;
            }
            else if(this.§_-4sO§ && this.§_-CTV§)
            {
               _loc1_ = OVER;
            }
         }
         if(this._selected)
         {
            _loc1_ = DOWN;
         }
         this.drawState(_loc1_);
      }
      
      public function get selected() : Boolean
      {
         return this._selected;
      }
      
      public function set selected(param1:Boolean) : void
      {
         this._selected = param1;
         this.draw();
      }
      
      protected function onMouseUp(param1:MouseEvent) : void
      {
         this.§_-bp§ = false;
         this.draw();
      }
      
      protected function onMouseDown(param1:MouseEvent) : void
      {
         this.§_-bp§ = true;
         this.draw();
      }
      
      protected function onMouseOver(param1:MouseEvent) : void
      {
         this.§_-4sO§ = true;
         this.draw();
      }
      
      protected function onMouseOut(param1:MouseEvent) : void
      {
         this.§_-4sO§ = false;
         this.§_-bp§ = false;
         this.draw();
      }
      
      public function get disabled() : Boolean
      {
         return this.§_-5q8§;
      }
      
      public function set disabled(param1:Boolean) : void
      {
         if(param1 != this.§_-5q8§)
         {
            this.§_-5q8§ = param1;
            buttonMode = !this.§_-5q8§;
            this.draw();
         }
      }
      
      public function get asset() : MovieClip
      {
         return this.§_-0Nm§;
      }
      
      public function set asset(param1:MovieClip) : void
      {
         if(this.§_-0Nm§ != null && contains(this.§_-0Nm§))
         {
            removeChild(this.§_-0Nm§);
         }
         this.§_-0Nm§ = param1;
         addChildAt(this.§_-0Nm§,0);
      }
      
      public function get modalResult() : int
      {
         return this.§_-Buy§;
      }
      
      public function set modalResult(param1:int) : void
      {
         this.§_-Buy§ = param1;
      }
      
      public function set §_-9t0§(param1:Boolean) : void
      {
         this.§_-7g9§ = param1;
      }
      
      public function set §_-9Vl§(param1:Boolean) : void
      {
         this.§_-4pH§ = param1;
      }
   }
}

