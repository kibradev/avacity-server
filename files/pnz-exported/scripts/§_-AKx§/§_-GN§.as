package §_-AKx§
{
   import §_-1Fx§.§_-5n7§;
   import §_-1iV§.§_-BkM§;
   import §_-3eZ§.§_-BCG§;
   import §_-AaA§.§_-Bg7§;
   import §_-Bi2§.§_-Fs§;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Rectangle;
   import flash.text.TextField;
   
   public class §_-GN§ extends §_-5n7§
   {
      protected var §_-AI-§:TextField;
      
      protected var §_-7LK§:int;
      
      protected var §_-CTt§:int;
      
      protected var §_-8RM§:§_-5n7§;
      
      protected var §_-CIo§:§_-5n7§;
      
      protected var §_-8y0§:§_-5n7§;
      
      protected var §_-0eq§:int;
      
      protected var §_-BAA§:int;
      
      protected var §_-0WQ§:§_-5n7§;
      
      protected var §_-8v§:§_-5n7§;
      
      protected var §_-C6w§:§_-BCG§;
      
      protected var _skin:§_-Fs§;
      
      protected var §_-Buy§:int;
      
      protected var §_-2Lm§:Boolean = false;
      
      protected var §_-84E§:Function = null;
      
      protected var §_-AfV§:Boolean = true;
      
      protected var §_-3pw§:Boolean = true;
      
      protected var §_-7Y6§:Boolean;
      
      protected var §_-Avc§:String;
      
      protected var §_-5R6§:Boolean;
      
      private var §_-0xt§:Number;
      
      private var §_-9z8§:Number;
      
      private var §_-04D§:Boolean;
      
      private var §_-5Yg§:Boolean;
      
      private var §_-1eR§:Boolean = false;
      
      public function §_-GN§(param1:int = 400, param2:int = 300, param3:String = null, param4:Boolean = true, param5:Boolean = true, param6:Boolean = true)
      {
         super();
         this.§_-0eq§ = param1;
         this.§_-BAA§ = param2;
         this.§_-Avc§ = param3;
         this.§_-5R6§ = param4;
         this.§_-7Y6§ = param5;
         this.§_-5Yg§ = param6;
         this._skin = this.createSkin();
         this.draw();
         addEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
         addEventListener(Event.REMOVED_FROM_STAGE,this.§_-5Rc§);
      }
      
      protected function createSkin() : §_-Fs§
      {
         return null;
      }
      
      public function addContent(param1:DisplayObject) : DisplayObject
      {
         this.§_-0WQ§.addChild(param1);
         return param1;
      }
      
      public function removeContent(param1:DisplayObject) : DisplayObject
      {
         this.§_-0WQ§.removeChild(param1);
         return param1;
      }
      
      public function addContentOverlay(param1:DisplayObject) : DisplayObject
      {
         this.§_-8v§.addChild(param1);
         return param1;
      }
      
      private function onAddedToStage(param1:Event) : void
      {
         removeEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
         this.init();
         dispatchEvent(new §_-2-c§(§_-2-c§.§_-824§));
      }
      
      private function draw() : void
      {
         this.§_-CTt§ = this.§_-0eq§ + this._skin.clientBounds.left + this._skin.clientBounds.right;
         this.§_-7LK§ = this.§_-BAA§ + this._skin.clientBounds.top + this._skin.clientBounds.bottom;
         this.§_-8RM§ = new §_-5n7§();
         addChild(this.§_-8RM§);
         this.drawBackground();
         this.§_-0dv§();
         this.§_-CIo§ = new §_-5n7§();
         addChild(this.§_-CIo§);
         this.drawBorder();
         this.§_-8v§ = new §_-5n7§();
         addChild(this.§_-8v§);
         this.§_-8y0§ = new §_-5n7§();
         if(this.§_-Avc§ != null)
         {
            this._skin.drawTitle(this.§_-Avc§,this.§_-8y0§,this.§_-CTt§);
         }
         addChild(this.§_-8y0§);
         if(this.§_-5R6§)
         {
            this.§_-C6w§ = this._skin.drawCloseButton(this.§_-8y0§,this.§_-CTt§);
            if(this.§_-C6w§ != null)
            {
               this.§_-C6w§.addEventListener(MouseEvent.CLICK,this.onCloseClick);
            }
         }
         if(this.§_-7Y6§)
         {
            this.§_-8y0§.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-629§);
            §_-BkM§.§_-n1§().addEventListener(MouseEvent.MOUSE_MOVE,this.§_-BaO§,false,1000);
            this.§_-8y0§.addEventListener(MouseEvent.MOUSE_UP,this.§_-Bow§);
         }
      }
      
      public function bringElementsAboveFog() : void
      {
      }
      
      private function §_-5Rc§(param1:Event) : void
      {
      }
      
      public function init() : void
      {
      }
      
      protected function §_-0dv§() : void
      {
         this.§_-0WQ§ = new §_-5n7§();
         this.§_-0WQ§.x = this._skin.clientBounds.left;
         this.§_-0WQ§.y = this._skin.clientBounds.top;
         this.§_-0WQ§.scrollRect = new Rectangle(0,0,this.§_-0eq§,this.§_-BAA§);
         addChild(this.§_-0WQ§);
      }
      
      protected function onCloseClick(param1:MouseEvent) : void
      {
         this.close();
      }
      
      protected function §_-Vv§() : Boolean
      {
         return true;
      }
      
      public function showModal(param1:Function = null, param2:Boolean = true) : void
      {
         this.§_-24M§.showModal(this,param2);
         this.§_-0UZ§(param1);
         this.bringElementsAboveFog();
      }
      
      public function §_-BDY§(param1:Function = null, param2:Boolean = true) : void
      {
         this.§_-24M§.show(this,param2);
         this.§_-0UZ§(param1);
      }
      
      protected function §_-0UZ§(param1:Function = null) : void
      {
         this.§_-2Lm§ = true;
         if(this.§_-84E§ != null)
         {
            removeEventListener(§_-2-c§.§_-41T§,this.§_-84E§);
            this.§_-84E§ = null;
         }
         if(param1 != null)
         {
            this.§_-84E§ = param1;
            addEventListener(§_-2-c§.§_-41T§,this.§_-84E§);
         }
      }
      
      public function close(param1:Boolean = false) : void
      {
         if(!param1 && !this.§_-Vv§())
         {
            return;
         }
         dispatchEvent(new §_-2-c§(§_-2-c§.§_-AbI§));
         if(this.§_-24M§.§_-96Z§() == this)
         {
            this.§_-24M§.§_-3BO§();
         }
         else
         {
            this.§_-24M§.§_-8Oc§(this);
         }
         dispatchEvent(new §_-2-c§(§_-2-c§.§_-41T§));
         this.§_-2Lm§ = false;
         if(this.§_-5Yg§)
         {
            this.destroy();
         }
      }
      
      protected function §_-7Zy§() : void
      {
         this.§_-24M§.§_-7Zy§(this);
      }
      
      protected function doScaleToFit() : void
      {
         this.§_-24M§.scaleToFit(this);
      }
      
      private function §_-629§(param1:MouseEvent) : void
      {
         this.§_-0xt§ = mouseX;
         this.§_-9z8§ = mouseY;
         this.§_-04D§ = true;
      }
      
      private function §_-BaO§(param1:MouseEvent) : void
      {
         if(this.§_-04D§)
         {
            x += (mouseX - this.§_-0xt§) * scaleX;
            y += (mouseY - this.§_-9z8§) * scaleY;
            this.§_-0xt§ = mouseX;
            this.§_-9z8§ = mouseY;
         }
      }
      
      private function §_-Bow§(param1:MouseEvent) : void
      {
         this.§_-04D§ = false;
      }
      
      protected function reDraw() : void
      {
         this.§_-0WQ§.scrollRect = new Rectangle(0,0,this.§_-0eq§,this.§_-BAA§);
         if(this.§_-C6w§ != null)
         {
            this.§_-C6w§.removeEventListener(MouseEvent.CLICK,this.onCloseClick);
            this.§_-C6w§.parent.removeChild(this.§_-C6w§);
            this.§_-C6w§ = null;
         }
         if(this.§_-8y0§ != null)
         {
            this.§_-8y0§.removeEventListener(MouseEvent.MOUSE_DOWN,this.§_-629§);
            this.§_-8y0§.removeEventListener(MouseEvent.MOUSE_UP,this.§_-Bow§);
            removeChild(this.§_-8y0§);
            this.§_-8y0§ = null;
         }
         this.§_-8y0§ = new §_-5n7§();
         if(this.§_-Avc§ != null)
         {
            this._skin.drawTitle(this.§_-Avc§,this.§_-8y0§,this.§_-CTt§);
         }
         addChild(this.§_-8y0§);
         if(this.§_-5R6§)
         {
            this.§_-C6w§ = this._skin.drawCloseButton(this.§_-8y0§,this.§_-CTt§);
            if(this.§_-C6w§ != null)
            {
               this.§_-C6w§.addEventListener(MouseEvent.CLICK,this.onCloseClick);
            }
         }
         if(this.§_-7Y6§)
         {
            this.§_-8y0§.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-629§);
            §_-BkM§.§_-n1§().addEventListener(MouseEvent.MOUSE_MOVE,this.§_-BaO§);
            this.§_-8y0§.addEventListener(MouseEvent.MOUSE_UP,this.§_-Bow§);
         }
         if(this.§_-8RM§ != null)
         {
            this.§_-8RM§.§_-5BF§();
            if(this.contains(this.§_-8RM§))
            {
               this.removeChild(this.§_-8RM§);
            }
            this.§_-8RM§ = null;
            this.§_-8RM§ = new §_-5n7§();
         }
         if(this.§_-CIo§ != null)
         {
            this.§_-CIo§.§_-5BF§();
            if(this.contains(this.§_-CIo§))
            {
               this.removeChild(this.§_-CIo§);
            }
            this.§_-CIo§ = null;
            this.§_-CIo§ = new §_-5n7§();
         }
         addChildAt(this.§_-8RM§,0);
         this.drawBackground();
         addChildAt(this.§_-CIo§,1);
         this.drawBorder();
      }
      
      protected function drawBackground() : void
      {
         this._skin.drawBackground(this.§_-CTt§,this.§_-7LK§,this.§_-8RM§);
      }
      
      protected function drawBorder() : void
      {
         this._skin.drawBorder(this.§_-CTt§,this.§_-7LK§,this.§_-CIo§);
      }
      
      public function get §_-AXu§() : Sprite
      {
         return this.§_-0WQ§;
      }
      
      public function get clientWidth() : int
      {
         return this.§_-0eq§;
      }
      
      public function get clientHeight() : int
      {
         return this.§_-BAA§;
      }
      
      public function set clientWidth(param1:int) : void
      {
         this.§_-0eq§ = param1;
         this.§_-CTt§ = param1 + this._skin.clientBounds.left + this._skin.clientBounds.right;
         this.reDraw();
         this.doScaleToFit();
      }
      
      public function set clientHeight(param1:int) : void
      {
         this.§_-BAA§ = param1;
         this.§_-7LK§ = param1 + this._skin.clientBounds.top + this._skin.clientBounds.bottom;
         this.reDraw();
         this.doScaleToFit();
      }
      
      public function get dialogWidth() : int
      {
         return this.§_-CTt§;
      }
      
      public function get dialogHeight() : int
      {
         return this.§_-7LK§;
      }
      
      public function get §_-C9S§() : int
      {
         return this.dialogWidth * scaleX;
      }
      
      public function get §_-1zC§() : int
      {
         return this.dialogHeight * scaleY;
      }
      
      public function get §_-24M§() : §_-Bg7§
      {
         return §_-Bg7§.instance;
      }
      
      public function get modalResult() : int
      {
         return this.§_-Buy§;
      }
      
      public function set modalResult(param1:int) : void
      {
         this.§_-Buy§ = param1;
      }
      
      public function get §_-B7W§() : Boolean
      {
         return this.§_-2Lm§;
      }
      
      public function get scaleToFit() : Boolean
      {
         return this.§_-AfV§;
      }
      
      public function get §_-8gv§() : Boolean
      {
         return this.§_-3pw§;
      }
      
      public function get §_-7Ze§() : Boolean
      {
         return this.§_-1eR§;
      }
      
      public function set §_-7Ze§(param1:Boolean) : void
      {
         this.§_-1eR§ = param1;
      }
      
      public function §_-54u§() : void
      {
         if(this.§_-8v§ != null)
         {
            this.§_-8v§.§_-oj§(true,false);
            this.§_-8v§ = null;
         }
      }
      
      override public function destroy() : void
      {
         removeEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
         removeEventListener(Event.REMOVED_FROM_STAGE,this.§_-5Rc§);
         if(this.§_-C6w§ != null)
         {
            this.§_-C6w§.removeEventListener(MouseEvent.CLICK,this.onCloseClick);
         }
         if(this.§_-8y0§ != null)
         {
            this.§_-8y0§.removeEventListener(MouseEvent.MOUSE_DOWN,this.§_-629§);
            this.§_-8y0§.removeEventListener(MouseEvent.MOUSE_UP,this.§_-Bow§);
         }
         if(§_-BkM§.§_-n1§() != null)
         {
            §_-BkM§.§_-n1§().removeEventListener(MouseEvent.MOUSE_MOVE,this.§_-BaO§);
         }
         if(this.§_-CIo§ != null)
         {
            this.§_-CIo§.§_-5BF§();
            this.§_-CIo§ = null;
         }
         if(this.§_-8RM§ != null)
         {
            this.§_-8RM§.§_-5BF§();
            this.§_-8RM§ = null;
         }
         if(this.§_-C6w§ != null)
         {
            this.§_-C6w§.destroy();
            this.§_-C6w§ = null;
         }
         if(this.§_-0WQ§ != null)
         {
            this.§_-0WQ§.§_-oj§(true,false);
            this.§_-0WQ§ = null;
         }
         if(this.§_-8v§ != null)
         {
            this.§_-8v§.§_-oj§(true,false);
            this.§_-8v§ = null;
         }
         removeAllChildren(true,true);
         this._skin = null;
         if(this.§_-84E§ != null)
         {
            removeEventListener(§_-2-c§.§_-41T§,this.§_-84E§);
            this.§_-84E§ = null;
         }
         this.§_-AI-§ = null;
         super.destroy();
      }
   }
}

