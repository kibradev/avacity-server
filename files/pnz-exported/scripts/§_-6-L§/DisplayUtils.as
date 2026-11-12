package §_-6-L§
{
   import §_-7xl§.§_-8Ks§;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Loader;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.Dictionary;
   
   public class DisplayUtils
   {
      public function DisplayUtils()
      {
         super();
      }
      
      public static function §_-4-5§(param1:DisplayObject) : Point
      {
         var _loc2_:Rectangle = param1.getBounds(param1);
         var _loc3_:Point = new Point();
         _loc3_.x = param1.scaleX > 0 ? _loc2_.left * param1.scaleX : _loc2_.right * param1.scaleX;
         _loc3_.y = param1.scaleY > 0 ? _loc2_.top * param1.scaleY : _loc2_.bottom * param1.scaleY;
         return _loc3_;
      }
      
      public static function §_-1Gq§(param1:MovieClip) : Rectangle
      {
         var _loc5_:Rectangle = null;
         var _loc2_:int = param1.currentFrame;
         var _loc3_:Rectangle = null;
         param1.gotoAndStop(1);
         _loc3_ = param1.getBounds(param1);
         var _loc4_:int = 2;
         while(_loc4_ <= param1.totalFrames)
         {
            param1.gotoAndStop(_loc4_);
            _loc5_ = param1.getBounds(param1);
            _loc3_ = _loc3_.union(_loc5_);
            _loc4_++;
         }
         param1.gotoAndStop(_loc2_);
         return _loc3_;
      }
      
      public static function §_-5Si§(param1:DisplayObject) : Rectangle
      {
         var _loc2_:Rectangle = null;
         if(param1 is MovieClip)
         {
            _loc2_ = DisplayUtils.§_-1Gq§(MovieClip(param1));
         }
         else
         {
            _loc2_ = param1.getBounds(param1);
         }
         var _loc3_:Number = param1.scaleX > 0 ? _loc2_.left * param1.scaleX : _loc2_.right * param1.scaleX;
         var _loc4_:Number = param1.scaleY > 0 ? _loc2_.top * param1.scaleY : _loc2_.bottom * param1.scaleY;
         return new Rectangle(_loc3_,_loc4_,_loc2_.width,_loc2_.height);
      }
      
      public static function §_-4To§(param1:DisplayObject, param2:DisplayObject) : DisplayObject
      {
         var _loc7_:int = 0;
         var _loc3_:Array = §_-98g§(param1);
         var _loc4_:Array = §_-98g§(param2);
         var _loc5_:DisplayObject = null;
         var _loc6_:int = int(_loc4_.length - 1);
         while(_loc6_ >= 0)
         {
            _loc7_ = int(_loc3_.length - 1);
            while(_loc7_ >= 0)
            {
               if(_loc3_[_loc6_] == _loc4_[_loc7_])
               {
                  _loc5_ = _loc3_[_loc6_];
               }
               _loc7_--;
            }
            _loc6_--;
         }
         return _loc5_;
      }
      
      public static function §_-8fl§(param1:DisplayObject, param2:Point, param3:DisplayObject) : Point
      {
         return param3.globalToLocal(param1.localToGlobal(param2));
      }
      
      public static function §_-98g§(param1:DisplayObject) : Array
      {
         var _loc2_:Array = [];
         var _loc3_:DisplayObjectContainer = param1.parent;
         while(_loc3_ != null)
         {
            _loc2_.push(_loc3_);
            _loc3_ = _loc3_.parent;
         }
         return _loc2_;
      }
      
      public static function §_-1SB§(param1:DisplayObject, param2:Class) : DisplayObjectContainer
      {
         var _loc3_:DisplayObjectContainer = param1.parent;
         while(_loc3_ != null && !(_loc3_ is param2))
         {
            _loc3_ = _loc3_.parent;
         }
         return _loc3_;
      }
      
      public static function §_-K4§(param1:DisplayObjectContainer) : Array
      {
         var _loc2_:Array = [];
         var _loc3_:int = 0;
         while(_loc3_ < param1.numChildren)
         {
            _loc2_.push(param1.getChildAt(_loc3_));
            _loc3_++;
         }
         return _loc2_;
      }
      
      protected static function removeChild(param1:DisplayObject, param2:Boolean, param3:Boolean) : void
      {
         var _loc4_:§_-8Ks§ = null;
         if(param2 && param1 is §_-8Ks§)
         {
            _loc4_ = param1 as §_-8Ks§;
            if(!_loc4_.destroyed)
            {
               _loc4_.destroy();
            }
         }
         if(param3)
         {
            removeChildren(param1,param2,param3);
         }
      }
      
      protected static function §_-Ku§(param1:SimpleButton, param2:Boolean, param3:Boolean) : void
      {
         if(param1.downState != null)
         {
            removeChild(param1.downState,param2,param3);
            param1.downState = null;
         }
         if(param1.hitTestState != null)
         {
            removeChild(param1.hitTestState,param2,param3);
            param1.hitTestState = null;
         }
         if(param1.overState != null)
         {
            removeChild(param1.overState,param2,param3);
            param1.overState = null;
         }
         if(param1.upState != null)
         {
            removeChild(param1.upState,param2,param3);
            param1.upState = null;
         }
      }
      
      public static function removeChildren(param1:DisplayObject, param2:Boolean = false, param3:Boolean = false) : void
      {
         if(param1 is SimpleButton)
         {
            §_-Ku§(SimpleButton(param1),param2,param3);
            return;
         }
         if(param1 is Loader || !(param1 is DisplayObjectContainer))
         {
            return;
         }
         if(param1 is MovieClip)
         {
            MovieClip(param1).stop();
         }
         var _loc4_:DisplayObjectContainer = param1 as DisplayObjectContainer;
         var _loc5_:int = _loc4_.numChildren - 1;
         while(_loc5_ >= 0)
         {
            removeChild(_loc4_.removeChildAt(0),param2,param3);
            _loc5_--;
         }
      }
      
      public static function §_-6zB§(param1:DisplayObject, param2:DisplayObjectContainer = null) : void
      {
         if(param1.parent == null)
         {
            if(param2 == null)
            {
               throw new Error("Parent container not defined");
            }
            param2.addChildAt(param1,param2.numChildren);
            return;
         }
         param1.parent.setChildIndex(param1,param1.parent.numChildren - 1);
      }
      
      public static function §_-36C§(param1:DisplayObject, param2:DisplayObjectContainer = null) : void
      {
         if(param1.parent == null)
         {
            if(param2 == null)
            {
               throw new Error("Parent container not defined");
            }
            param2.addChildAt(param1,0);
            return;
         }
         param1.parent.setChildIndex(param1,0);
      }
      
      public static function §_-2w0§(param1:DisplayObject, param2:DisplayObject, param3:DisplayObjectContainer) : int
      {
         var _loc6_:int = 0;
         if(param1 == param2)
         {
            return 0;
         }
         if(param1 == null)
         {
            return -1;
         }
         if(param2 == null)
         {
            return 1;
         }
         var _loc4_:Array = DisplayUtils.§_-Ty§(param1,param3);
         var _loc5_:Array = DisplayUtils.§_-Ty§(param2,param3);
         if(_loc4_ == null)
         {
            return -1;
         }
         if(_loc5_ == null)
         {
            return 1;
         }
         if(_loc4_.length <= _loc5_.length)
         {
            _loc6_ = 0;
            while(_loc6_ < _loc4_.length)
            {
               if(_loc4_[_loc6_] > _loc5_[_loc6_])
               {
                  return 1;
               }
               _loc6_++;
            }
            return -1;
         }
         _loc6_ = 0;
         while(_loc6_ < _loc5_.length)
         {
            if(_loc5_[_loc6_] > _loc4_[_loc6_])
            {
               return -1;
            }
            _loc6_++;
         }
         return 1;
      }
      
      public static function §_-Ty§(param1:DisplayObject, param2:DisplayObjectContainer) : Array
      {
         var _loc3_:Array = [];
         while(param1.parent != null)
         {
            _loc3_.unshift(param1.parent.getChildIndex(param1));
            param1 = param1.parent;
            if(param1 == param2)
            {
               return _loc3_;
            }
         }
         return null;
      }
      
      public static function §_-3rz§(param1:DisplayObject, param2:int, param3:int, param4:uint = 64) : Boolean
      {
         var _loc5_:Point = param1.globalToLocal(new Point(param2,param3));
         return §_-4Az§(param1,_loc5_.x,_loc5_.y,param4);
      }
      
      public static function §_-4Az§(param1:DisplayObject, param2:int, param3:int, param4:uint = 64, param5:Number = 1) : Boolean
      {
         var _loc6_:BitmapData = new BitmapData(1,1,true,0);
         var _loc7_:Matrix = new Matrix();
         var _loc8_:Point = new Point(param2,param3);
         _loc7_.tx = -_loc8_.x;
         _loc7_.ty = -_loc8_.y;
         _loc7_.scale(param5,param5);
         _loc6_.draw(param1,_loc7_);
         var _loc9_:uint = _loc6_.getPixel32(0,0);
         var _loc10_:uint = uint(_loc9_ >> 24 & 0xFF);
         _loc6_.dispose();
         return _loc10_ > param4;
      }
      
      public static function §_-B8r§(param1:DisplayObject, param2:DisplayObject) : Point
      {
         var _loc3_:Point = new Point(0,0);
         var _loc4_:DisplayObject = param1;
         while(_loc4_ != param2)
         {
            _loc3_.x += _loc4_.x;
            _loc3_.y += _loc4_.y;
            _loc4_ = _loc4_.parent;
            if(_loc4_ == null)
            {
               break;
            }
         }
         return _loc3_;
      }
      
      public static function §_-AX6§(param1:DisplayObject, param2:Rectangle = null) : BitmapData
      {
         if(param2 == null)
         {
            param2 = DisplayUtils.§_-5Si§(param1);
         }
         if(param2.width == 0 || param2.height == 0)
         {
            return new BitmapData(1,1,true,0);
         }
         var _loc3_:BitmapData = new BitmapData(param2.width,param2.height,true,0);
         var _loc4_:Matrix = new Matrix();
         _loc4_.scale(param1.scaleX,param1.scaleY);
         _loc4_.translate(-param2.x,-param2.y);
         _loc3_.draw(param1,_loc4_);
         return _loc3_;
      }
      
      public static function §_-23e§(param1:MovieClip, param2:Rectangle = null) : Array
      {
         var _loc3_:Array = [];
         if(param2 == null)
         {
            param2 = DisplayUtils.§_-5Si§(param1);
         }
         var _loc4_:int = param1.currentFrame;
         var _loc5_:int = 1;
         while(_loc5_ <= param1.totalFrames)
         {
            param1.gotoAndStop(_loc5_);
            _loc3_.push(§_-AX6§(param1,param2));
            _loc5_++;
         }
         param1.gotoAndStop(_loc4_);
         return _loc3_;
      }
      
      public static function sort(param1:DisplayObjectContainer, param2:Function, param3:Array = null) : void
      {
         var _loc5_:DisplayObject = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:Boolean = false;
         var _loc9_:int = 0;
         var _loc4_:Vector.<ChildValueObject> = new Vector.<ChildValueObject>();
         if(param3 is Array)
         {
            for each(_loc5_ in param3)
            {
               try
               {
                  _loc7_ = param1.getChildIndex(_loc5_);
                  _loc4_.push(new ChildValueObject(_loc5_,_loc7_));
               }
               catch(ignore:Error)
               {
               }
            }
         }
         else
         {
            _loc6_ = param1.numChildren - 1;
            while(_loc6_ >= 0)
            {
               try
               {
                  _loc5_ = param1.getChildAt(_loc6_);
                  _loc4_.push(new ChildValueObject(_loc5_,_loc6_));
               }
               catch(ignore:Error)
               {
               }
               _loc6_--;
            }
         }
         _loc6_ = int(_loc4_.length - 1);
         while(_loc6_ >= 1)
         {
            _loc8_ = false;
            _loc9_ = 0;
            while(_loc9_ <= _loc6_ - 1)
            {
               if(param2(_loc4_[_loc9_].reference,_loc4_[_loc9_ + 1].reference))
               {
                  param1.swapChildrenAt(_loc4_[_loc9_].index,_loc4_[_loc9_ + 1].index);
                  _loc4_[_loc9_].swap(_loc4_[_loc9_ + 1]);
                  _loc8_ = true;
               }
               _loc9_++;
            }
            if(!_loc8_)
            {
               break;
            }
            _loc6_--;
         }
      }
      
      public static function §_-1pm§(param1:DisplayObjectContainer, param2:Dictionary, param3:Boolean = false) : void
      {
         var child:DisplayObject = null;
         var container:DisplayObjectContainer = param1;
         var priorityData:Dictionary = param2;
         var invertOrder:Boolean = param3;
         var children:Array = [];
         var i:int = container.numChildren - 1;
         while(i >= 0)
         {
            try
            {
               child = container.getChildAt(i);
               if(priorityData[child] != null)
               {
                  children.push(child);
               }
            }
            catch(e:Error)
            {
            }
            i--;
         }
         sort(container,function(param1:DisplayObject, param2:DisplayObject):Boolean
         {
            if(!invertOrder)
            {
               return priorityData[param1] < priorityData[param2];
            }
            return priorityData[param2] > priorityData[param1];
         },children);
      }
      
      public static function §_-4t6§(param1:DisplayObjectContainer, param2:String, param3:Boolean = false) : void
      {
         var child:DisplayObject = null;
         var container:DisplayObjectContainer = param1;
         var sortPropertyName:String = param2;
         var invertOrder:Boolean = param3;
         var children:Array = [];
         var i:int = container.numChildren - 1;
         while(i >= 0)
         {
            try
            {
               child = container.getChildAt(i);
               if(Object(child).hasOwnProperty(sortPropertyName))
               {
                  children.push(child);
               }
            }
            catch(e:Error)
            {
            }
            i--;
         }
         sort(container,function(param1:DisplayObject, param2:DisplayObject):Boolean
         {
            if(!invertOrder)
            {
               return param1[sortPropertyName] < param2[sortPropertyName];
            }
            return param1[sortPropertyName] > param2[sortPropertyName];
         },children);
      }
   }
}

class ChildValueObject
{
   public var index:int;
   
   public var reference:*;
   
   public function ChildValueObject(param1:*, param2:int)
   {
      super();
      this.reference = param1;
      this.index = param2;
   }
   
   public function swap(param1:ChildValueObject) : void
   {
      var _loc2_:* = this.reference;
      this.reference = param1.reference;
      param1.reference = _loc2_;
   }
}
