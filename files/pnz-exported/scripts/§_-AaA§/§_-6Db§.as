package §_-AaA§
{
   import §_-1Fx§.§_-5n7§;
   import §_-2U3§.ResourceManager;
   import §_-6-L§.DisplayUtils;
   import §_-6JL§.§_-B9P§;
   import §_-CVq§.§_-kl§;
   import §_-GM§.Context;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.geom.Rectangle;
   import penzville.Application;
   import penzville.Config;
   
   public class §_-6Db§ extends §_-5n7§
   {
      public static const DIRECTION_LEFT:String = "left";
      
      public static const DIRECTION_TOP:String = "top";
      
      public static const §_-3JT§:String = "right";
      
      public static const DIRECTION_BOTTOM:String = "bottom";
      
      protected var _target:DisplayObject = null;
      
      protected var _direction:String = "left";
      
      protected var §_-78h§:MovieClip = null;
      
      public function §_-6Db§(param1:DisplayObject, param2:String)
      {
         super();
         this._target = param1;
         this._direction = param2;
         this.§_-78h§ = ResourceManager.createMovieClip("QuestHintArrow@ui");
         this.§_-78h§.gotoAndStop(this._direction);
         addChild(this.§_-78h§);
         this.placeInPoint();
         Context.§_-CLP§.addEventListener(§_-B9P§.RESIZE,this.onResize);
         if(this._target != null)
         {
            this._target.addEventListener(§_-kl§.§_-3Fa§,this.§_-88W§);
         }
      }
      
      private function §_-88W§(param1:§_-kl§) : void
      {
         this.placeInPoint();
      }
      
      private function onResize(param1:§_-B9P§) : void
      {
         this.placeInPoint();
      }
      
      protected function placeInPoint() : void
      {
         var _loc1_:Rectangle = null;
         if(this._target == null)
         {
            return;
         }
         _loc1_ = this._target.getBounds(Application.instance);
         switch(this._direction)
         {
            case DIRECTION_LEFT:
               x = _loc1_.x + _loc1_.width;
               y = _loc1_.y + _loc1_.height / 2;
               break;
            case DIRECTION_TOP:
               x = _loc1_.x + _loc1_.width / 2;
               y = _loc1_.y + _loc1_.height;
               break;
            case §_-3JT§:
               x = _loc1_.x;
               y = _loc1_.y + _loc1_.height / 2;
               break;
            case DIRECTION_BOTTOM:
               x = _loc1_.x + _loc1_.width / 2;
               y = _loc1_.y;
         }
         x /= Config.§_-C6c§;
         y /= Config.§_-C6c§;
      }
      
      override public function get visible() : Boolean
      {
         return this.§_-78h§.visible;
      }
      
      override public function set visible(param1:Boolean) : void
      {
         DisplayUtils.§_-36C§(this.§_-78h§);
         this.§_-78h§.visible = param1;
      }
      
      override public function destroy() : void
      {
         if(destroyed)
         {
            return;
         }
         if(this._target != null)
         {
            this._target.removeEventListener(§_-kl§.§_-3Fa§,this.§_-88W§);
            this._target = null;
         }
         if(this.§_-78h§ != null && this.§_-78h§.parent != null)
         {
            this.§_-78h§.parent.removeChild(this.§_-78h§);
            this.§_-78h§ = null;
         }
         Context.§_-CLP§.removeEventListener(§_-B9P§.RESIZE,this.onResize);
         super.destroy();
      }
   }
}

