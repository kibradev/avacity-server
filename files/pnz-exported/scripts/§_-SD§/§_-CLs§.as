package §_-SD§
{
   import §_-7xl§.§_-5m-§;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   
   public class §_-CLs§ extends §_-5m-§ implements §_-BO9§
   {
      private var §_-4x6§:String;
      
      private var §_-3ET§:CursorManager;
      
      private var §_-1DZ§:DisplayObject;
      
      public function §_-CLs§(param1:DisplayObject, param2:String, param3:CursorManager)
      {
         super();
         this.§_-1DZ§ = param1;
         this.§_-4x6§ = param2;
         this.§_-3ET§ = param3;
         param1.addEventListener(MouseEvent.MOUSE_OVER,this.onMouseOver);
         param1.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseOver);
      }
      
      private function onMouseOver(param1:MouseEvent) : void
      {
         this.§_-1DZ§.removeEventListener(MouseEvent.MOUSE_OVER,this.onMouseOver);
         this.§_-1DZ§.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseOver);
         this.§_-1DZ§.addEventListener(MouseEvent.MOUSE_OUT,this.onMouseOut);
         this.§_-3ET§.§_-8g7§(this,param1);
      }
      
      private function onMouseOut(param1:MouseEvent) : void
      {
         this.§_-1DZ§.removeEventListener(MouseEvent.MOUSE_OUT,this.onMouseOut);
         this.§_-1DZ§.addEventListener(MouseEvent.MOUSE_OVER,this.onMouseOver);
         this.§_-1DZ§.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseOver);
         this.§_-3ET§.§_-0Fc§(this,param1);
      }
      
      override public function destroy() : void
      {
         this.§_-1DZ§.removeEventListener(MouseEvent.MOUSE_OVER,this.onMouseOver);
         this.§_-1DZ§.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseOver);
         this.§_-1DZ§.removeEventListener(MouseEvent.MOUSE_OUT,this.onMouseOut);
         this.§_-1DZ§ = null;
      }
      
      public function get cursor() : String
      {
         return this.§_-4x6§;
      }
      
      public function get object() : DisplayObject
      {
         return this.§_-1DZ§;
      }
   }
}

