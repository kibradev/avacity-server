package §_-Bef§
{
   import §_-1Fx§.§_-5n7§;
   import §_-7ps§.§_-AND§;
   import §_-AaA§.§_-5Kl§;
   import com.greensock.TweenLite;
   import flash.display.Graphics;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.text.TextField;
   
   public class §_-62b§ extends §_-5n7§
   {
      public static const §_-BpJ§:int = 15;
      
      protected var §_-Bbc§:§_-AND§ = null;
      
      protected var §_-01V§:uint = 0;
      
      protected var §_-BPI§:uint = 0;
      
      protected var §_-8RM§:Sprite = null;
      
      protected var _content:Sprite = null;
      
      public function §_-62b§(param1:§_-AND§)
      {
         super();
         this.§_-Bbc§ = param1;
         addEventListener(Event.ADDED_TO_STAGE,this.§_-9xv§);
      }
      
      public function get §_-6HZ§() : §_-AND§
      {
         return this.§_-Bbc§;
      }
      
      protected function §_-9xv§(param1:Event) : void
      {
         this.init();
      }
      
      protected function init() : void
      {
         mouseEnabled = false;
         x = this.§_-Bbc§.x;
         y = this.§_-Bbc§.y;
         this.§_-01V§ = this.§_-Bbc§.width;
         this._content = this.createContent();
         this.§_-BPI§ += this.getContentHeight() + §_-BpJ§ * 2;
         this.§_-8RM§ = this.createBackground();
         this.render();
         this.effect();
      }
      
      protected function getContentHeight() : Number
      {
         return this._content.height;
      }
      
      protected function effect() : void
      {
         var _loc1_:int = 0;
         alpha = 0;
         _loc1_ = y;
         y -= this.§_-BPI§ / 2;
         TweenLite.to(this,0.5,{
            "alpha":1,
            "y":_loc1_,
            "onComplete":this.§_-AGz§
         });
      }
      
      private function §_-AGz§() : void
      {
         var oThis:§_-62b§ = null;
         oThis = this;
         TweenLite.to(oThis,0.3,{
            "colorTransform":{"brightness":1.5},
            "onComplete":function():void
            {
               TweenLite.to(oThis,0.5,{"colorTransform":{"brightness":1}});
            }
         });
      }
      
      protected function render() : void
      {
         if(this.§_-8RM§ != null && this.§_-8RM§.parent == null)
         {
            addChild(this.§_-8RM§);
         }
         if(this._content != null && this._content.parent == null)
         {
            addChild(this._content);
         }
         if(this._content != null)
         {
            this._content.x = §_-BpJ§;
            this._content.y = §_-BpJ§;
         }
      }
      
      protected function createContent() : Sprite
      {
         var _loc1_:§_-5n7§ = new §_-5n7§();
         var _loc2_:TextField = null;
         if(this.§_-01V§ > 0)
         {
            _loc2_ = §_-5Kl§.§_-Ae-§(0,0,this.title,§_-5Kl§.§_-BGn§,{
               "wordWrap":true,
               "multiline":true,
               "width":this.§_-01V§ - §_-BpJ§ * 2
            });
         }
         else
         {
            _loc2_ = §_-5Kl§.§_-Ae-§(0,0,this.title,§_-5Kl§.§_-BGn§);
            this.§_-01V§ = _loc2_.width + §_-BpJ§ * 2;
         }
         _loc1_.addChild(_loc2_);
         return _loc1_;
      }
      
      protected function get title() : String
      {
         return this.§_-Bbc§.localizedTitle;
      }
      
      protected function createBackground() : Sprite
      {
         var _loc1_:Sprite = new Sprite();
         var _loc2_:Graphics = _loc1_.graphics;
         _loc2_.lineStyle(4,12045103);
         _loc2_.drawRoundRect(2,2,this.§_-01V§ - 4,this.§_-BPI§ - 4,16);
         _loc2_.beginFill(16383202,0.9);
         _loc2_.lineStyle(2,16777215);
         _loc2_.drawRoundRect(5,5,this.§_-01V§ - 10,this.§_-BPI§ - 10,11);
         _loc2_.endFill();
         return _loc1_;
      }
   }
}

