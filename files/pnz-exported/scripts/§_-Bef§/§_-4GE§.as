package §_-Bef§
{
   import §_-7ps§.§_-AND§;
   import §_-AaA§.§_-5Kl§;
   import §_-AaA§.§_-6Db§;
   import §_-Btg§.§_-71s§;
   import flash.display.DisplayObject;
   import flash.display.Graphics;
   import flash.display.Sprite;
   import flash.geom.Point;
   import flash.text.TextField;
   
   public class §_-4GE§ extends §_-6Db§
   {
      public static const §_-BpJ§:int = 5;
      
      private var §_-Bbc§:§_-AND§ = null;
      
      private var §_-01V§:int = 0;
      
      private var §_-BPI§:int = 0;
      
      private var §_-AG7§:TextField = null;
      
      private var §_-8RM§:Sprite = null;
      
      public function §_-4GE§(param1:§_-AND§, param2:DisplayObject = null)
      {
         this.§_-Bbc§ = param1;
         super(param2 != null ? param2 : §_-71s§.instance.§_-2Lw§(this.§_-Bbc§.target),this.§_-Bbc§.direction);
         if(this.§_-Bbc§.title != null)
         {
            this.§_-01V§ = this.§_-Bbc§.width;
            this.§_-AG7§ = this.createTextField();
            this.§_-BPI§ += this.§_-AG7§.height + §_-BpJ§ * 2;
            this.§_-8RM§ = this.§_-8rK§();
            this.§_-Be9§();
         }
      }
      
      protected function §_-Be9§() : void
      {
         var _loc1_:Point = null;
         if(this.§_-8RM§ != null && this.§_-8RM§.parent == null)
         {
            addChild(this.§_-8RM§);
         }
         if(this.§_-AG7§ != null && this.§_-AG7§.parent == null)
         {
            addChild(this.§_-AG7§);
         }
         _loc1_ = new Point();
         switch(_direction)
         {
            case DIRECTION_LEFT:
               _loc1_.x = §_-78h§.width + 15;
               _loc1_.y = this.§_-8RM§ != null ? -this.§_-8RM§.height / 2 : 0;
               break;
            case §_-3JT§:
               _loc1_.x = (this.§_-8RM§ != null ? -this.§_-8RM§.width : 0) - §_-78h§.width - 15;
               _loc1_.y = this.§_-8RM§ != null ? -this.§_-8RM§.height / 2 : 0;
               break;
            case DIRECTION_TOP:
               _loc1_.x = this.§_-8RM§ != null ? -this.§_-8RM§.width / 2 : 0;
               _loc1_.y = §_-78h§.height + 15;
               break;
            case DIRECTION_BOTTOM:
               _loc1_.x = this.§_-8RM§ != null ? -this.§_-8RM§.width / 2 : 0;
               _loc1_.y = (this.§_-8RM§ != null ? -this.§_-8RM§.height : 0) - §_-78h§.height - 15;
         }
         if(this.§_-8RM§ != null)
         {
            this.§_-8RM§.x = _loc1_.x;
            this.§_-8RM§.y = _loc1_.y;
         }
         if(this.§_-AG7§ != null)
         {
            this.§_-AG7§.x = _loc1_.x + §_-BpJ§;
            this.§_-AG7§.y = _loc1_.y + §_-BpJ§;
         }
      }
      
      protected function createTextField() : TextField
      {
         var _loc1_:TextField = null;
         if(this.§_-01V§ > 0)
         {
            _loc1_ = §_-5Kl§.§_-Ae-§(0,0,this.§_-Bbc§.localizedTitle,§_-5Kl§.§_-BGn§,{
               "wordWrap":true,
               "multiline":true,
               "width":this.§_-01V§ - §_-BpJ§ * 2
            });
         }
         else
         {
            _loc1_ = §_-5Kl§.§_-Ae-§(0,0,this.§_-Bbc§.localizedTitle,§_-5Kl§.§_-BGn§,{"size":13});
            this.§_-01V§ = _loc1_.width + §_-BpJ§ * 2;
         }
         return _loc1_;
      }
      
      protected function §_-8rK§() : Sprite
      {
         var _loc1_:Sprite = new Sprite();
         var _loc2_:Graphics = _loc1_.graphics;
         _loc2_.lineStyle(2,16372755,1,true);
         _loc2_.beginFill(16383202,0.9);
         _loc2_.drawRoundRect(2,2,this.§_-01V§ - 2,this.§_-BPI§ - 2,16);
         _loc2_.endFill();
         return _loc1_;
      }
      
      override public function set visible(param1:Boolean) : void
      {
         super.visible = param1;
         if(this.§_-8RM§ != null)
         {
            this.§_-8RM§.visible = param1;
         }
         if(this.§_-AG7§ != null)
         {
            this.§_-AG7§.visible = param1;
         }
      }
   }
}

