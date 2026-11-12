package §_-4Gh§
{
   import §_-0wn§.§_-1BG§;
   import §_-1Fx§.§_-5n7§;
   import §_-2U3§.ResourceManager;
   import §_-3Kp§.§_-5Gx§;
   import §_-6-L§.§_-7uH§;
   import §_-AaA§.§_-5Kl§;
   import §_-GM§.Context;
   import §_-bm§.§_-7M§;
   import com.greensock.TweenLite;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.filters.BitmapFilterQuality;
   import flash.filters.GlowFilter;
   import flash.geom.Point;
   import flash.text.TextField;
   import flash.utils.Timer;
   import penzville.Application;

   public class §_-2NW§ extends §_-5n7§
   {
      private static const §_-9gT§:int = 200;

      private static const §_-738§:int = 70;

      private static const §_-8iS§:int = 15;

      private static const §_-8Tz§:int = 4;

      private static const §_-BYT§:int = 7000;

      private static const §_-9P6§:int = 0;

      private static const §_-2YC§:int = 0;

      private static var §_-CHTDBG_TF§:TextField = null;

      protected var §_-8RM§:Sprite = null;

      protected var §_-3HH§:Sprite = null;

      protected var §_-5nZ§:§_-5n7§ = null;

      protected var §_-8qj§:TextField = null;

      protected var §_-8KM§:uint = 0;

      protected var §_-4mt§:String = null;

      protected var §_-A3u§:MovieClip = null;

      protected var §_-XI§:Point = null;

      protected var §_-74V§:String = null;

      protected var §_-Bts§:Array = [];

      protected var §_-0jH§:§_-5n7§ = null;

      protected var §_-Fb§:Timer = null;

      protected var §_-1K2§:§_-5Gx§ = null;

      protected var §_-5BW§:int = 0;

      protected var §_-79v§:String = null;

      private static function §_-chtdbgLog§(param1:String) : void
      {
         try
         {
            if(§_-CHTDBG_TF§ == null)
            {
               §_-CHTDBG_TF§ = new TextField();
               §_-CHTDBG_TF§.width = 620;
               §_-CHTDBG_TF§.height = 400;
               §_-CHTDBG_TF§.x = 5;
               §_-CHTDBG_TF§.y = 5;
               §_-CHTDBG_TF§.multiline = true;
               §_-CHTDBG_TF§.wordWrap = true;
               §_-CHTDBG_TF§.background = true;
               §_-CHTDBG_TF§.backgroundColor = 0;
               §_-CHTDBG_TF§.textColor = 65280;
               §_-CHTDBG_TF§.mouseEnabled = false;
               §_-CHTDBG_TF§.selectable = false;
               Application.instance.stage.addChild(§_-CHTDBG_TF§);
            }
            Application.instance.stage.setChildIndex(§_-CHTDBG_TF§,Application.instance.stage.numChildren - 1);
            §_-CHTDBG_TF§.appendText(param1 + "\n");
            if(§_-CHTDBG_TF§.numLines > 22)
            {
               §_-CHTDBG_TF§.text = §_-CHTDBG_TF§.text.split("\n").slice(-22).join("\n");
            }
         }
         catch(e:Error)
         {
         }
      }

      public function §_-2NW§(param1:String, param2:String = null, param3:int = -1)
      {
         super();
         this.§_-79v§ = param2;
         if(param3 < 0)
         {
            this.§_-5BW§ = §_-BYT§;
         }
         this.§_-8RM§ = this.bubbleBackground;
         addChild(this.§_-8RM§);
         this.§_-3HH§ = this.bubbleArrow;
         addChild(this.§_-3HH§);
         this.addBorders();
         this.§_-5nZ§ = new §_-5n7§();
         this.§_-5nZ§.x = §_-8Tz§;
         this.§_-5nZ§.y = §_-8Tz§;
         addChild(this.§_-5nZ§);
         this.§_-8qj§ = §_-5Kl§.createTextField(0,this.textYOffset,"",§_-5Kl§.§_-3YL§);
         this.§_-8KM§ = this.§_-8qj§.textColor;
         if(this.getTitleTextColor() != null)
         {
            this.§_-8qj§.textColor = uint(this.getTitleTextColor());
         }
         this.§_-8qj§.mouseEnabled = false;
         this.§_-8qj§.width = this.minTextWidth;
         this.§_-5nZ§.addChild(this.§_-8qj§);
         this.§_-BYi§(param1);
         this.§_-0jH§ = new §_-5n7§();
         this.§_-0jH§.x = 0;
         this.§_-0jH§.y = §_-8iS§;
         this.§_-5nZ§.addChild(this.§_-0jH§);
         this.§_-A3u§ = new MovieClip();
         this.§_-XI§ = new Point(0,0);
         this.hide();
         if(this.glow && !Context.instance.§_-AIA§.§_-3OB§)
         {
            filters = [new GlowFilter(10066329,1,2,2,2,BitmapFilterQuality.HIGH,false,false)];
         }
         Application.instance.addEventListener(§_-7M§.§_-6eT§,this.onAvatarChanged);
         addEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
      }

      protected function addBorders() : void
      {
      }

      protected function get textYOffset() : int
      {
         return 0;
      }

      public function §_-BYi§(param1:String) : void
      {
         this.§_-8qj§.text = param1 + "...";
      }

      public function addMessage(param1:String, param2:Boolean, param3:Boolean, param4:Boolean, param5:String) : void
      {
         this.updateDecor(param5);
         param1 = §_-7uH§.§_-3z3§(param1);
         var _loc6_:String = this.getChatStyle(param2,param3,param4);
         var _loc7_:TextField = §_-5Kl§.createTextField(0,this.textYOffset,param1,_loc6_);
         _loc7_.mouseEnabled = false;
         if(_loc7_.width > §_-9gT§)
         {
            _loc7_.wordWrap = true;
            _loc7_.width = §_-9gT§;
         }
         this.§_-qG§(_loc7_);
      }

      public function §_-0mE§(param1:MovieClip) : void
      {
         this.updateDecor();
         this.§_-qG§(param1);
      }

      public function startTyping() : void
      {
         this.updateDecor();
         if(this.§_-1K2§ == null)
         {
            this.§_-1K2§ = new §_-5Gx§(this.typingStyle);
            this.§_-1K2§.x = 0;
            this.§_-5nZ§.addChild(this.§_-1K2§);
         }
         this.§_-30g§();
      }

      public function stopTyping() : void
      {
         if(this.§_-1K2§ != null)
         {
            this.§_-1K2§.destroy();
            this.§_-1K2§ = null;
         }
         this.§_-30g§();
      }

      public function §_-5M-§() : void
      {
         this.§_-4mt§ = Context.§_-2CW§.§_-9uh§(this.§_-79v§);
         this.§_-5eE§();
      }

      private function §_-qG§(param1:DisplayObject) : void
      {
         var _loc2_:DisplayObject = null;
         if(this.§_-0jH§.numChildren == 3)
         {
            _loc2_ = this.§_-Bts§.shift();
            if(_loc2_.parent != null)
            {
               _loc2_.parent.removeChild(_loc2_);
            }
         }
         this.§_-0jH§.addChild(param1);
         this.§_-Bts§.push(param1);
         this.§_-30g§();
      }

      protected function §_-30g§() : void
      {
         var _loc1_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:DisplayObject = null;
         var _loc5_:Point = null;
         var _loc6_:Point = null;
         _loc1_ = §_-8iS§;
         var _loc2_:int = this.§_-8qj§ != null ? int(Math.max(this.§_-8qj§.width,this.minTextWidth)) : this.minTextWidth;
         _loc3_ = 0;
         for each(_loc4_ in this.§_-Bts§)
         {
            _loc4_.y = _loc3_;
            _loc3_ += _loc4_.height;
            if(_loc4_.width > _loc2_)
            {
               _loc2_ = _loc4_.width;
            }
         }
         _loc2_ += this.bubbleWidthOffset;
         _loc1_ += this.§_-0jH§.height;
         if(this.§_-1K2§ != null)
         {
            this.§_-1K2§.y = _loc1_;
            _loc1_ += this.§_-1K2§.height;
         }
         if(this.§_-Bts§.length > 0 || this.§_-1K2§ != null)
         {
            _loc5_ = new Point(_loc2_ + §_-8Tz§ * 2,_loc1_ + §_-8Tz§ * 2);
            _loc6_ = this.getHolderPosition(_loc2_,_loc1_);
            this.§_-XI§ = this.§_-OU§(_loc6_,_loc2_);
            this.setPositions(_loc5_,_loc6_);
            this.§_-0mR§();
         }
         else
         {
            this.hide();
         }
      }

      protected function getHolderPosition(param1:int, param2:int) : Point
      {
         return new Point(-param1 / 2,-param2 - §_-8Tz§);
      }

      protected function setPositions(param1:Point, param2:Point) : void
      {
         if(visible)
         {
            TweenLite.to(this.§_-8RM§,0.5,{
               "width":param1.x,
               "height":param1.y
            });
            TweenLite.to(this.§_-5nZ§,0.5,{
               "x":param2.x,
               "y":param2.y
            });
            TweenLite.to(this.§_-A3u§,0.5,{
               "x":this.§_-XI§.x,
               "y":this.§_-XI§.y
            });
         }
         else
         {
            this.§_-8RM§.width = param1.x;
            this.§_-8RM§.height = param1.y;
            this.§_-5nZ§.x = param2.x;
            this.§_-5nZ§.y = param2.y;
            this.§_-A3u§.x = this.§_-XI§.x;
            this.§_-A3u§.y = this.§_-XI§.y;
            this.show();
         }
      }

      protected function show() : void
      {
         visible = true;
         TweenLite.to(this,0.5,{"alpha":0.9});
         this.§_-A3u§.visible = true;
         TweenLite.to(this.§_-A3u§,0.5,{"alpha":1});
      }

      protected function hide() : void
      {
         visible = false;
         alpha = 0;
         this.§_-A3u§.visible = false;
         this.§_-A3u§.alpha = 0;
      }

      protected function §_-0mR§() : void
      {
         this.§_-0uN§();
      }

      private function §_-0uN§() : void
      {
         this.§_-BXH§();
         if(this.§_-5BW§ > 0)
         {
            this.§_-Fb§ = new Timer(this.§_-5BW§,1);
            this.§_-Fb§.addEventListener(TimerEvent.TIMER_COMPLETE,this.§_-5z5§);
            this.§_-Fb§.start();
         }
      }

      private function §_-BXH§() : void
      {
         if(this.§_-Fb§ != null)
         {
            this.§_-Fb§.removeEventListener(TimerEvent.TIMER_COMPLETE,this.§_-5z5§);
            this.§_-Fb§.stop();
            this.§_-Fb§ = null;
         }
      }

      private function §_-5z5§(param1:TimerEvent) : void
      {
         var _loc2_:DisplayObject = null;
         if(this.§_-1K2§ != null)
         {
            this.§_-0uN§();
            return;
         }
         this.hide();
         for each(_loc2_ in this.§_-Bts§)
         {
            if(_loc2_.parent != null)
            {
               _loc2_.parent.removeChild(_loc2_);
            }
         }
         this.§_-Bts§ = [];
         this.§_-BXH§();
      }

      private function onAddedToStage(param1:Event) : void
      {
         removeEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
         this.§_-5M-§();
      }

      private function onAvatarChanged(param1:§_-7M§) : void
      {
         §_-2NW§.§_-chtdbgLog§("ra evt mine=" + this.§_-79v§ + " evtUid=" + param1.memberId);
         if(param1.memberId != this.§_-79v§)
         {
            return;
         }
         var _loc2_:String = this.getTitleTextColor();
         if(_loc2_ != null)
         {
            this.§_-8qj§.textColor = uint(_loc2_);
         }
         else
         {
            this.§_-8qj§.textColor = this.§_-8KM§;
         }
         var _loc3_:String = Context.§_-2CW§.§_-9uh§(this.§_-79v§);
         §_-2NW§.§_-chtdbgLog§("MATCH old=" + this.§_-4mt§ + " new=" + _loc3_);
         if(_loc3_ == this.§_-4mt§)
         {
            §_-2NW§.§_-chtdbgLog§("SAME VALUE -> skip redraw");
            return;
         }
         this.§_-4mt§ = _loc3_;
         §_-2NW§.§_-chtdbgLog§("CHANGED -> calling updateDecor()");
         this.updateDecor();
      }

      private function updateDecor(param1:String = null) : void
      {
         this.hide();
         this.§_-C6a§();
         this.§_-5eE§(param1);
         this.§_-30g§();
      }

      protected function getTitleTextColor() : String
      {
         return Context.§_-2CW§.§_-6GC§(this.§_-79v§);
      }

      protected function §_-OU§(param1:Point, param2:int) : Point
      {
         var _loc3_:Point = new Point(param1.x,param1.y);
         switch(this.§_-74V§)
         {
            case §_-1BG§.§_-6Ma§:
               break;
            case §_-1BG§.§_-0lG§:
               _loc3_.x = param1.x + param2 / 2 - this.§_-A3u§.width / 2;
               break;
            case §_-1BG§.§_-B8Z§:
               _loc3_.x = param2 + param1.x;
         }
         return _loc3_;
      }

      protected function get bubbleBackground() : Sprite
      {
         return ResourceManager.createSprite("ChatBubble@ui");
      }

      protected function get bubbleArrow() : MovieClip
      {
         return ResourceManager.createMovieClip("ChatBubbleArrow@ui");
      }

      protected function get glow() : Boolean
      {
         return true;
      }

      protected function get minTextWidth() : int
      {
         return §_-738§;
      }

      protected function get bubbleWidthOffset() : int
      {
         return 0;
      }

      protected function getChatStyle(param1:Boolean, param2:Boolean, param3:Boolean) : String
      {
         var _loc4_:String = §_-5Kl§.§_-BLY§;
         if(param3)
         {
            _loc4_ = §_-5Kl§.§_-C77§;
         }
         else if(!param1)
         {
            _loc4_ = §_-5Kl§.§_-4k1§;
         }
         else if(param2)
         {
            _loc4_ = §_-5Kl§.§_-CRd§;
         }
         return _loc4_;
      }

      protected function get typingStyle() : String
      {
         return §_-5Kl§.§_-BLY§;
      }

      private function §_-C6a§() : void
      {
         if(this.§_-A3u§ != null)
         {
            if(parent != null && parent.contains(this.§_-A3u§))
            {
               parent.removeChild(this.§_-A3u§);
            }
            this.§_-A3u§ = new MovieClip();
         }
      }

      private function §_-5eE§(param1:String = null) : void
      {
         §_-2NW§.§_-chtdbgLog§("_5eE_ decor=" + this.§_-4mt§ + " override=" + param1);
         if(this.§_-4mt§ == null && param1 == null)
         {
            §_-2NW§.§_-chtdbgLog§("_5eE_ EARLY RETURN (both null)");
            return;
         }
         var _loc2_:MovieClip = ResourceManager.createMovieClip("ChatTopAsset@decorUi");
         if(_loc2_ == null)
         {
            §_-2NW§.§_-chtdbgLog§("_5eE_ createMovieClip(ChatTopAsset) returned null!");
            return;
         }
         _loc2_.gotoAndStop(param1 != null ? param1 : this.§_-4mt§);
         this.§_-A3u§ = _loc2_;
         this.§_-A3u§.alpha = 0;
         this.§_-A3u§.visible = false;
         this.§_-A3u§.x = this.§_-XI§.x;
         this.§_-A3u§.y = this.§_-XI§.y;
         parent.addChild(this.§_-A3u§);
         this.§_-74V§ = param1 != null ? §_-1BG§.§_-6Ma§ : Context.§_-2CW§.§_-7zZ§(this.§_-79v§);
      }

      override public function destroy() : void
      {
         if(destroyed)
         {
            return;
         }
         removeEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
         Application.instance.removeEventListener(§_-7M§.§_-6eT§,this.onAvatarChanged);
         removeAllChildren(true,true);
         this.§_-BXH§();
         super.destroy();
      }
   }
}
