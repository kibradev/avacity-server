package com.greensock.plugins
{
   import com.greensock.TweenLite;
   import flash.display.DisplayObject;
   import flash.geom.Rectangle;
   
   public class ScrollRectPlugin extends TweenPlugin
   {
      public static const API:Number = 2;
      
      protected var _target:DisplayObject;
      
      protected var _rect:Rectangle;
      
      public function ScrollRectPlugin()
      {
         super("scrollRect");
      }
      
      override public function _onInitTween(param1:Object, param2:*, param3:TweenLite) : Boolean
      {
         var _loc4_:String = null;
         var _loc5_:Rectangle = null;
         if(!(param1 is DisplayObject))
         {
            return false;
         }
         this._target = param1 as DisplayObject;
         if(this._target.scrollRect != null)
         {
            this._rect = this._target.scrollRect;
         }
         else
         {
            _loc5_ = this._target.getBounds(this._target);
            this._rect = new Rectangle(0,0,_loc5_.width + _loc5_.x,_loc5_.height + _loc5_.y);
         }
         for(_loc4_ in param2)
         {
            §_-lJ§(this._rect,_loc4_,this._rect[_loc4_],param2[_loc4_],"scrollRect");
         }
         return true;
      }
      
      override public function setRatio(param1:Number) : void
      {
         super.setRatio(param1);
         this._target.scrollRect = this._rect;
      }
   }
}

