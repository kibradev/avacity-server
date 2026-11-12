package §_-3Kp§
{
   import §_-1Fx§.§_-5n7§;
   import §_-2U3§.ResourceManager;
   import §_-3eZ§.§_-BCG§;
   import §_-6-L§.§_-7uH§;
   import §_-7s3§.§_-BrL§;
   import §_-8UF§.§_-0qZ§;
   import §_-9VF§.§_-48g§;
   import §_-GM§.Context;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Rectangle;
   import flash.utils.setTimeout;
   import penzville.Config;
   
   public class §_-3n0§ extends §_-5n7§
   {
      public static const §_-4qn§:int = 0;
      
      public static const §_-Aor§:int = 1;
      
      public static const MODE_MODERATE:int = 2;
      
      private static const §_-1TL§:Number = 48;
      
      private static const §_-8CD§:Number = 27;
      
      private static const §_-9ee§:Number = 100;
      
      private static const §_-Bkf§:Number = 99;
      
      private static const §_-83n§:Number = 95;
      
      private static const §_-1KX§:Number = 25;
      
      private static const §_-B-1§:Number = 30;
      
      private static const CHAT_HISTORY_LINE_OFFSET:Number = 25;
      
      private static const §_-3YJ§:Number = 200;
      
      private var _width:int = 0;
      
      private var _height:int = 0;
      
      private var §_-17H§:String = null;
      
      private var _mode:int = 1;
      
      private var §_-34M§:Sprite = null;
      
      private var _lineContainer:§_-Auk§ = null;
      
      private var §_-80-§:§_-3lx§ = null;
      
      private var §_-9xP§:§_-BCG§ = null;
      
      public function §_-3n0§(param1:String, param2:int, param3:int, param4:int)
      {
         super();
         this._width = param2;
         this._height = param3;
         this.§_-17H§ = param1;
         this._mode = param4;
         this.§_-34M§ = new Sprite();
         this.§_-34M§.x = 5;
         this.§_-34M§.y = §_-1KX§;
         this._lineContainer = new §_-Auk§();
         this._lineContainer.x = 0;
         this._lineContainer.y = 0;
         this.§_-34M§.addChild(this._lineContainer);
         this.§_-34M§.scrollRect = this.§_-1xu§();
         addChild(this.§_-34M§);
         this.§_-80-§ = new §_-3lx§(this._height - §_-1TL§,this._lineContainer.clientHeight,10);
         this.§_-80-§.y = §_-8CD§;
         this.§_-80-§.x = this._width - this.§_-80-§.width - 7;
         this.§_-80-§.addEventListener(Event.SCROLL,this.§_-2oW§);
         this.§_-80-§.visible = false;
         addChild(this.§_-80-§);
         if(this._mode != §_-4qn§)
         {
            this.§_-9xP§ = new §_-BCG§(ResourceManager.createMovieClip("ChatNewMessageButton@ui"));
            this.§_-9xP§.x = this._width / 2 - this.§_-9xP§.width / 2;
            this.§_-9xP§.y = this._height - §_-B-1§ - this.§_-9xP§.height / 2;
            this.§_-9xP§.visible = false;
            this.§_-9xP§.addEventListener(MouseEvent.CLICK,this.§_-2y3§);
            addChild(this.§_-9xP§);
         }
      }
      
      public function get tabId() : String
      {
         return this.§_-17H§;
      }
      
      public function §_-4uh§(param1:§_-BrL§) : void
      {
         var _loc2_:String = param1.message;
         if(Config.allowedIds.indexOf(Context.player.userInfo.socialId) < 0)
         {
            _loc2_ = §_-7uH§.§_-3z3§(_loc2_);
         }
         var _loc3_:String = param1.broadcast ? §_-7UO§.§_-1ec§ : §_-7UO§.§_-Al6§;
         var _loc4_:§_-48g§ = Context.§_-3B2§.§_-07a§(param1.senderId) as §_-48g§;
         if(_loc4_ != null && _loc4_.cityInfo.§_-CbO§())
         {
            _loc3_ = §_-7UO§.§_-AIx§;
         }
         if(param1.§_-BcS§())
         {
            _loc3_ = §_-7UO§.§_-4eQ§;
            _loc2_ = Context.§_-5o8§.message("mobileChatMessageAdTitle") + " " + param1.message;
         }
         var _loc5_:String = null;
         var _loc6_:String = Context.§_-2CW§.§_-6GC§(param1.senderId);
         if(_loc6_ != null)
         {
            _loc5_ = §_-7UO§.§_-BYA§;
         }
         var _loc7_:§_-7UO§ = new §_-7UO§(this._width - CHAT_HISTORY_LINE_OFFSET,this._mode,_loc3_,this.§_-17H§,_loc5_,_loc6_);
         _loc7_.§_-6VO§(param1,_loc2_);
         _loc7_.y = this._lineContainer.clientHeight;
         if(this._mode == MODE_MODERATE)
         {
            _loc7_.addEventListener(§_-0qZ§.§_-oT§,this.onCheckChanged);
            _loc7_.addEventListener(§_-0qZ§.§_-AxZ§,this.onCheckChanged);
         }
         this._lineContainer.addLine(_loc7_);
         this.ensureScrollParameters();
      }
      
      public function §_-5Gn§() : Boolean
      {
         var _loc1_:int = 0;
         while(_loc1_ < this._lineContainer.§_-9pd§)
         {
            if(this._lineContainer.§_-AyW§(_loc1_).§_-9Xc§)
            {
               return true;
            }
            _loc1_++;
         }
         return false;
      }
      
      public function §_-BcQ§() : Array
      {
         var _loc1_:Array = [];
         var _loc2_:int = 0;
         while(_loc2_ < this._lineContainer.§_-9pd§)
         {
            _loc1_.push(this._lineContainer.§_-AyW§(_loc2_).data);
            _loc2_++;
         }
         return _loc1_;
      }
      
      public function §_-AH7§() : Array
      {
         var _loc1_:Array = [];
         var _loc2_:int = 0;
         while(_loc2_ < this._lineContainer.§_-9pd§)
         {
            if(this._lineContainer.§_-AyW§(_loc2_).§_-9Xc§)
            {
               _loc1_.push(this._lineContainer.§_-AyW§(_loc2_).data);
            }
            _loc2_++;
         }
         return _loc1_;
      }
      
      public function §_-86m§() : Array
      {
         var _loc1_:Array = [];
         var _loc2_:Array = [];
         var _loc3_:int = 0;
         while(_loc3_ < this._lineContainer.§_-9pd§)
         {
            if(!(this._lineContainer.§_-AyW§(_loc3_).check != §_-7UO§.§_-4Dl§ || _loc1_.indexOf(this._lineContainer.§_-AyW§(_loc3_).userId) >= 0))
            {
               _loc1_.push(this._lineContainer.§_-AyW§(_loc3_).userId);
            }
            _loc3_++;
         }
         var _loc4_:int = 0;
         while(_loc4_ < this._lineContainer.§_-9pd§)
         {
            if(_loc1_.indexOf(this._lineContainer.§_-AyW§(_loc4_).userId) >= 0)
            {
               _loc2_.push(this._lineContainer.§_-AyW§(_loc4_).data);
            }
            _loc4_++;
         }
         return _loc2_;
      }
      
      public function §_-CTy§(param1:Array) : void
      {
         var history:Array = param1;
         this.§_-AdT§();
         setTimeout(function():void
         {
            var _loc1_:Object = null;
            var _loc2_:§_-7UO§ = null;
            for each(_loc1_ in history)
            {
               _loc2_ = new §_-7UO§(_width - CHAT_HISTORY_LINE_OFFSET,_mode);
               _loc2_.§_-BiO§(_loc1_);
               _loc2_.y = _lineContainer.clientHeight;
               if(_mode == MODE_MODERATE)
               {
                  _loc2_.addEventListener(§_-0qZ§.§_-oT§,onCheckChanged);
                  _loc2_.addEventListener(§_-0qZ§.§_-AxZ§,onCheckChanged);
               }
               _lineContainer.addLine(_loc2_);
            }
            ensureScrollParameters();
         },§_-3YJ§);
      }
      
      private function ensureScrollParameters() : void
      {
         if(this._lineContainer.clientHeight > this.§_-6OP§)
         {
            this.§_-80-§.visible = true;
            this.§_-80-§.contentHeight = this._lineContainer.clientHeight;
            if(this.§_-80-§.scrollPosition + this.§_-6OP§ >= this._lineContainer.clientHeight - 10)
            {
               this.§_-80-§.position = §_-9ee§;
            }
         }
         if(this.§_-9xP§ != null && this.§_-80-§.visible && this.§_-80-§.position < §_-Bkf§)
         {
            this.§_-9xP§.visible = true;
         }
         else
         {
            this._lineContainer.y = Math.min(0,this.§_-6OP§ - this._lineContainer.clientHeight);
         }
      }
      
      private function §_-AdT§() : void
      {
         this._lineContainer.§_-BQq§();
         this.ensureScrollParameters();
      }
      
      private function §_-1xu§() : Rectangle
      {
         return new Rectangle(0,0,this._width - 30,this.§_-6OP§);
      }
      
      private function get §_-6OP§() : int
      {
         return this._height - 47;
      }
      
      public function get clientHeight() : int
      {
         return this._height;
      }
      
      public function set clientHeight(param1:int) : void
      {
         this._height = param1;
         if(this.§_-9xP§ != null)
         {
            this.§_-9xP§.y = this._height - §_-B-1§ - this.§_-9xP§.height / 2;
            this.§_-9xP§.visible = false;
         }
         if(this.§_-34M§ != null)
         {
            this.§_-34M§.scrollRect = this.§_-1xu§();
            if(this._lineContainer != null)
            {
               this._lineContainer.y = Math.min(0,this.§_-6OP§ - this._lineContainer.clientHeight);
            }
         }
         if(this.§_-80-§ != null)
         {
            this.§_-80-§.clientHeight = this._height - §_-1TL§;
            this.§_-80-§.visible = this._lineContainer.clientHeight > this.§_-6OP§;
            this.§_-80-§.position = §_-9ee§;
         }
      }
      
      private function §_-2y3§(param1:MouseEvent) : void
      {
         this._lineContainer.y = this.§_-6OP§ - this._lineContainer.clientHeight;
         this.§_-80-§.position = §_-9ee§;
         if(this.§_-9xP§ != null)
         {
            this.§_-9xP§.visible = false;
         }
      }
      
      private function onCheckChanged(param1:§_-0qZ§) : void
      {
         var _loc4_:§_-7UO§ = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc2_:int = 0;
         while(_loc2_ < this._lineContainer.§_-9pd§)
         {
            if(this._lineContainer.§_-AyW§(_loc2_).check == §_-7UO§.§_-7Qf§)
            {
               this._lineContainer.§_-AyW§(_loc2_).check = §_-7UO§.§_-AMU§;
            }
            _loc2_++;
         }
         var _loc3_:int = 0;
         while(_loc3_ < this._lineContainer.§_-9pd§)
         {
            _loc4_ = this._lineContainer.§_-AyW§(_loc3_);
            if(_loc4_ != null)
            {
               if(_loc4_.check == §_-7UO§.§_-4Dl§)
               {
                  _loc5_ = _loc3_ - 1;
                  while(_loc5_ >= Math.max(0,_loc3_ - 2))
                  {
                     if(!this._lineContainer.§_-AyW§(_loc5_).§_-9Xc§)
                     {
                        this._lineContainer.§_-AyW§(_loc5_).check = §_-7UO§.§_-7Qf§;
                     }
                     _loc5_--;
                  }
                  _loc6_ = _loc3_ + 1;
                  while(_loc6_ <= Math.min(_loc3_ + 2,this._lineContainer.§_-9pd§ - 1))
                  {
                     if(!this._lineContainer.§_-AyW§(_loc6_).§_-9Xc§)
                     {
                        this._lineContainer.§_-AyW§(_loc6_).check = §_-7UO§.§_-7Qf§;
                     }
                     _loc6_++;
                  }
               }
            }
            _loc3_++;
         }
      }
      
      private function §_-2oW§(param1:Event) : void
      {
         this._lineContainer.y = -this.§_-80-§.scrollPosition;
         if(this.§_-9xP§ != null && this.§_-9xP§.visible && this.§_-80-§.position > §_-83n§)
         {
            this.§_-9xP§.visible = false;
         }
      }
   }
}

