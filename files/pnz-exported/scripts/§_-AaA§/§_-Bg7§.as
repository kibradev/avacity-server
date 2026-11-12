package §_-AaA§
{
   import §_-18o§.CityDisplayUtils;
   import §_-1Fx§.§_-5n7§;
   import §_-1iV§.§_-BkM§;
   import §_-6-L§.DisplayUtils;
   import §_-6-L§.§_-49j§;
   import §_-6BB§.§_-2qC§;
   import §_-7fa§.§_-0Rf§;
   import §_-8xd§.UnauthorizedAdapter;
   import §_-AKx§.§_-2-c§;
   import §_-AKx§.§_-5Nu§;
   import §_-AKx§.§_-BTq§;
   import §_-AKx§.§_-GN§;
   import §_-GM§.Context;
   import com.greensock.TweenLite;
   import com.greensock.easing.Back;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import penzville.Config;
   
   public class §_-Bg7§ extends §_-5n7§
   {
      private static var _instance:§_-Bg7§;
      
      public static const §_-9iS§:Number = 0.1;
      
      private var §_-5Yu§:Array = [];
      
      private var §_-2OS§:Sprite;
      
      private var _width:int;
      
      private var _height:int;
      
      private var §_-34M§:§_-5n7§;
      
      private var §_-CB4§:Array = [];
      
      public function §_-Bg7§()
      {
         super();
      }
      
      public static function get instance() : §_-Bg7§
      {
         if(_instance == null)
         {
            _instance = new §_-Bg7§();
         }
         return _instance;
      }
      
      public function §_-AAE§(param1:int, param2:int) : void
      {
         this._width = param1;
         this._height = param2;
         this.§_-1M-§();
      }
      
      private function §_-1M-§() : void
      {
         var _loc1_:§_-GN§ = null;
         var _loc3_:Point = null;
         _loc1_ = null;
         var _loc2_:int = 0;
         while(_loc2_ < this.§_-5Yu§.length)
         {
            _loc1_ = this.§_-5Yu§[_loc2_];
            _loc1_.x = this._width / 2 - _loc1_.dialogWidth / 2;
            _loc1_.y = this._height / 2 - _loc1_.dialogHeight / 2;
            if(_loc1_ is §_-5Nu§)
            {
               _loc3_ = (_loc1_ as §_-5Nu§).§_-BsP§;
               _loc1_.x += _loc3_.x;
               _loc1_.y += _loc3_.y;
            }
            _loc2_++;
         }
      }
      
      public function bringElementsAboveFog(param1:Array) : void
      {
         var _loc2_:§_-5n7§ = null;
         var _loc3_:Object = null;
         if(param1 == null || param1.length < 1)
         {
            return;
         }
         for each(_loc2_ in param1)
         {
            if(!(_loc2_ == null || _loc2_.parent == null))
            {
               _loc3_ = {
                  "element":_loc2_,
                  "originalParent":_loc2_.parent,
                  "originalIndex":_loc2_.parent.getChildIndex(_loc2_),
                  "originalX":_loc2_.x,
                  "originalY":_loc2_.y
               };
               this.§_-CB4§.push(_loc3_);
               _loc2_.parent.removeChild(_loc2_);
               this.container.addChild(_loc2_);
               DisplayUtils.§_-6zB§(_loc2_,this.container);
            }
         }
      }
      
      public function §_-3Tn§() : void
      {
         var _loc1_:Object = null;
         var _loc2_:§_-5n7§ = null;
         if(this.§_-CB4§.length == 0)
         {
            return;
         }
         for each(_loc1_ in this.§_-CB4§)
         {
            _loc2_ = _loc1_.element;
            if(_loc2_ != null && _loc2_.parent == this.container)
            {
               this.container.removeChild(_loc2_);
               _loc1_.originalParent.addChildAt(_loc2_,_loc1_.originalIndex);
               _loc2_.x = _loc1_.originalX;
               _loc2_.y = _loc1_.originalY;
            }
         }
         this.§_-CB4§ = [];
      }
      
      private function §_-9y-§(param1:MouseEvent) : void
      {
         var _loc2_:§_-GN§ = this.§_-96Z§();
         if(_loc2_.§_-8gv§ && Context.instance.§_-AIA§.isMobile || _loc2_.§_-7Ze§)
         {
            this.§_-96Z§().close();
         }
      }
      
      public function show(param1:§_-GN§, param2:Boolean = true) : void
      {
         var _loc3_:Point = null;
         if(Context.instance.§_-AIA§.§_-07h§)
         {
            §_-BkM§.getStage().focus = null;
         }
         this.§_-57w§(param1);
         if(param1.scaleToFit)
         {
            this.scaleToFit(param1);
         }
         if(param2)
         {
            this.§_-7Zy§(param1);
         }
         if(param1 is §_-BTq§)
         {
            _loc3_ = new Point(param1.x,param1.y);
            param1.x += param1.width * 0.05;
            param1.y += param1.width * 0.05;
            param1.scaleX = 0.9;
            param1.scaleY = 0.9;
            param1.alpha = 0.5;
            TweenLite.to(param1,0.2,{
               "alpha":1,
               "scaleX":1,
               "scaleY":1,
               "x":_loc3_.x,
               "y":_loc3_.y,
               "ease":Back.easeOut
            });
         }
         §_-Bg7§.instance.dispatchEvent(new §_-2-c§(§_-2-c§.§_-06V§,param1));
      }
      
      public function showModal(param1:§_-GN§, param2:Boolean = true) : void
      {
         if(this.§_-2OS§ != null)
         {
            DisplayUtils.§_-6zB§(this.§_-2OS§,this.container);
         }
         this.show(param1,param2);
      }
      
      public function §_-3BO§() : void
      {
         var _loc2_:§_-GN§ = null;
         if(this.§_-5Yu§.length == 0)
         {
            return;
         }
         var _loc1_:§_-GN§ = this.§_-5Yu§.pop();
         this.§_-8Oc§(_loc1_);
         if(this.§_-5Yu§.length == 0)
         {
            if(this.§_-2OS§ != null && this.container.contains(this.§_-2OS§))
            {
               this.container.removeChild(this.§_-2OS§);
            }
            §_-Bg7§.instance.dispatchEvent(new §_-2-c§(§_-2-c§.§_-41T§,_loc1_));
         }
         else
         {
            _loc2_ = this.§_-96Z§();
            DisplayUtils.§_-6zB§(_loc2_);
            _loc2_.bringElementsAboveFog();
         }
      }
      
      public function hideAll() : void
      {
         var _loc1_:§_-GN§ = null;
         while(this.§_-5Yu§.length != 0)
         {
            _loc1_ = this.§_-5Yu§.pop();
            _loc1_.close(true);
         }
         if(this.§_-2OS§ != null && this.container.contains(this.§_-2OS§))
         {
            this.container.removeChild(this.§_-2OS§);
         }
         §_-Bg7§.instance.dispatchEvent(new §_-2-c§(§_-2-c§.§_-41T§));
      }
      
      public function §_-0aC§(param1:Class) : void
      {
         var _loc2_:§_-GN§ = null;
         for each(_loc2_ in this.§_-5Yu§)
         {
            if(_loc2_ is param1)
            {
               _loc2_.close(true);
            }
         }
         if(this.§_-5Yu§.length == 0)
         {
            if(this.§_-2OS§ != null && this.container.contains(this.§_-2OS§))
            {
               this.container.removeChild(this.§_-2OS§);
            }
            §_-Bg7§.instance.dispatchEvent(new §_-2-c§(§_-2-c§.§_-41T§));
         }
      }
      
      public function §_-7Zy§(param1:§_-GN§) : void
      {
         var _loc2_:Point = null;
         param1.x = this._width / 2 - param1.§_-C9S§ / 2;
         param1.y = this._height / 2 - param1.§_-1zC§ / 2;
         if(param1 is §_-5Nu§)
         {
            _loc2_ = (param1 as §_-5Nu§).§_-BsP§;
            param1.x += _loc2_.x;
            param1.y += _loc2_.y;
         }
      }
      
      public function scaleToFit(param1:§_-GN§, param2:Boolean = false) : void
      {
         var _loc3_:§_-2qC§ = Context.§_-2BT§.adapter;
         if(_loc3_ is §_-0Rf§ || _loc3_ is UnauthorizedAdapter)
         {
            this.§_-43b§(param1,§_-9iS§ * 2);
            return;
         }
         if(!param2 && !Context.instance.§_-AIA§.isMobile && this._width >= 760 && this._height >= 650)
         {
            return;
         }
         this.§_-43b§(param1,§_-9iS§);
      }
      
      private function §_-43b§(param1:§_-GN§, param2:Number) : void
      {
         var _loc3_:Number = 1;
         var _loc4_:Boolean = false;
         var _loc5_:Number = Config.§_-6Z0§ - Config.§_-6Z0§ * param2;
         var _loc6_:Number = Config.§_-50z§ - Config.§_-50z§ * param2;
         if(param1.§_-1zC§ > _loc5_)
         {
            _loc3_ = param1.scaleY * _loc5_ / param1.§_-1zC§;
            param1.scaleX = _loc3_;
            param1.scaleY = _loc3_;
            _loc4_ = true;
         }
         if(param1.§_-C9S§ > _loc6_)
         {
            _loc3_ = param1.scaleX * _loc6_ / param1.§_-C9S§;
            param1.scaleX = _loc3_;
            param1.scaleY = _loc3_;
            _loc4_ = true;
         }
         if(_loc4_)
         {
            CityDisplayUtils.§_-63e§(param1);
         }
         this.§_-7Zy§(param1);
      }
      
      public function §_-96Z§() : §_-GN§
      {
         return this.§_-5Yu§.length > 0 ? this.§_-5Yu§[this.§_-5Yu§.length - 1] : null;
      }
      
      public function get §_-41Z§() : Boolean
      {
         return this.§_-5Yu§.length > 0;
      }
      
      public function §_-57w§(param1:§_-GN§) : void
      {
         this.§_-5Yu§.push(param1);
         this.container.addChild(param1);
         DisplayUtils.§_-6zB§(param1);
      }
      
      public function §_-8Oc§(param1:§_-GN§) : void
      {
         if(this.container.contains(param1))
         {
            this.container.removeChild(param1);
         }
         §_-49j§.remove(this.§_-5Yu§,param1);
      }
      
      public function §_-BwF§(param1:Class) : Boolean
      {
         return this.§_-42j§(param1).length > 0;
      }
      
      public function §_-42j§(param1:Class) : Array
      {
         var _loc3_:§_-GN§ = null;
         var _loc2_:Array = [];
         for each(_loc3_ in this.§_-5Yu§)
         {
            if(_loc3_ is param1)
            {
               _loc2_.push(_loc3_);
            }
         }
         return _loc2_;
      }
      
      public function get container() : §_-5n7§
      {
         return this.§_-34M§;
      }
      
      public function set container(param1:§_-5n7§) : void
      {
         this.§_-34M§ = param1;
      }
      
      public function get modalFog() : Sprite
      {
         return this.§_-2OS§;
      }
      
      public function set modalFog(param1:Sprite) : void
      {
         if(this.§_-2OS§ != null)
         {
            this.§_-2OS§.removeEventListener(MouseEvent.CLICK,this.§_-9y-§);
         }
         this.§_-2OS§ = param1;
         this.§_-2OS§.addEventListener(MouseEvent.CLICK,this.§_-9y-§);
      }
   }
}

