package §_-18o§
{
   import §_-0uA§.§_-3YE§;
   import §_-6-L§.DisplayUtils;
   import §_-63P§.Dictionary;
   import §_-7xl§.§_-5m-§;
   import §_-A2M§.§_-4Ln§;
   import §_-A2M§.§_-9e4§;
   import §_-A2M§.§_-A8M§;
   import §_-GM§.Context;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Graphics;
   import flash.display.GraphicsBitmapFill;
   import flash.display.IGraphicsData;
   import flash.display.MovieClip;
   import flash.display.Shape;
   import flash.filters.ColorMatrixFilter;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import penzville.Config;
   
   public class CityDisplayUtils
   {
      public function CityDisplayUtils()
      {
         super();
      }
      
      public static function §_-A1o§(param1:DisplayObjectContainer, param2:int = 0, param3:int = 0, param4:int = 0) : void
      {
         var _loc19_:ColorMatrixFilter = null;
         var _loc5_:Number = param3 / 100;
         var _loc6_:Number = param4 / 100 + 1;
         var _loc7_:Number = param2 / 100 + 1;
         var _loc8_:Number = (1 - _loc6_) / 2;
         var _loc9_:Number = 0.3086;
         var _loc10_:Number = 0.6094;
         var _loc11_:Number = 0.082;
         var _loc12_:Number = (1 - _loc7_) * _loc9_;
         var _loc13_:Number = (1 - _loc7_) * _loc10_;
         var _loc14_:Number = (1 - _loc7_) * _loc11_;
         var _loc15_:Array = [_loc6_ * (_loc12_ + _loc7_),_loc6_ * _loc13_,_loc6_ * _loc14_,0,_loc8_ + _loc5_,_loc6_ * _loc12_,_loc6_ * (_loc13_ + _loc7_),_loc6_ * _loc14_,0,_loc8_ + _loc5_,_loc6_ * _loc12_,_loc6_ * _loc13_,_loc6_ * (_loc14_ + _loc7_),0,_loc8_ + _loc5_,0,0,0,1,0];
         var _loc16_:Array = param1.filters;
         var _loc17_:Boolean = false;
         var _loc18_:int = 0;
         while(_loc18_ < _loc16_.length)
         {
            if(_loc16_[_loc18_] is ColorMatrixFilter)
            {
               (_loc16_[_loc18_] as ColorMatrixFilter).matrix = _loc15_;
               _loc17_ = true;
            }
            _loc18_++;
         }
         if(!_loc17_)
         {
            _loc19_ = new ColorMatrixFilter(_loc15_);
            _loc16_.push(_loc19_);
         }
         param1.filters = _loc16_;
      }
      
      public static function localToGlobal(param1:DisplayObject, param2:Point) : Point
      {
         var _loc3_:Point = param1.localToGlobal(param2);
         _loc3_.x /= Config.§_-C6c§;
         _loc3_.y /= Config.§_-C6c§;
         return _loc3_;
      }
      
      public static function globalToLocal(param1:DisplayObject, param2:Point) : Point
      {
         var _loc3_:Point = param1.globalToLocal(param2);
         _loc3_.x *= Config.§_-C6c§;
         _loc3_.y *= Config.§_-C6c§;
         return _loc3_;
      }
      
      public static function §_-8fl§(param1:DisplayObject, param2:Point, param3:DisplayObject) : Point
      {
         var _loc4_:Point = localToGlobal(param1,param2);
         return globalToLocal(param3,_loc4_);
      }
      
      public static function localToTarget2(param1:DisplayObject, param2:Point, param3:DisplayObject) : Point
      {
         var _loc4_:Point = param1.localToGlobal(param2);
         return param3.globalToLocal(_loc4_);
      }
      
      public static function §_-9o6§(param1:DisplayObjectContainer, param2:Class) : *
      {
         var _loc3_:Array = §_-0zL§(param1,param2,true);
         if(_loc3_.length == 0)
         {
            return null;
         }
         return _loc3_[0];
      }
      
      public static function §_-0zL§(param1:DisplayObjectContainer, param2:Class, param3:Boolean = false) : Array
      {
         var _loc6_:DisplayObject = null;
         var _loc7_:Array = null;
         var _loc8_:DisplayObject = null;
         var _loc4_:Array = [];
         var _loc5_:Array = DisplayUtils.§_-K4§(param1);
         for each(_loc6_ in _loc5_)
         {
            if(_loc6_ is param2)
            {
               _loc4_.push(_loc6_);
               if(param3)
               {
                  return _loc4_;
               }
            }
            if(_loc6_ is DisplayObjectContainer)
            {
               _loc7_ = §_-0zL§(_loc6_ as DisplayObjectContainer,param2);
               for each(_loc8_ in _loc7_)
               {
                  _loc4_.push(_loc8_);
               }
            }
         }
         return _loc4_;
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
               if(priorityData.at(child) != null)
               {
                  children.push(child);
               }
            }
            catch(e:Error)
            {
            }
            i--;
         }
         DisplayUtils.sort(container,function(param1:DisplayObject, param2:DisplayObject):Boolean
         {
            if(!invertOrder)
            {
               return priorityData.at(param1) < priorityData.at(param2);
            }
            return priorityData.at(param2) > priorityData.at(param1);
         },children);
      }
      
      public static function §_-Ah6§(param1:DisplayObjectContainer, param2:Function, param3:§_-9e4§ = null) : §_-A8M§
      {
         var matrix:Matrix;
         var rect:Rectangle = null;
         var result:§_-A8M§ = null;
         var displayObject:DisplayObjectContainer = param1;
         var completeCallback:Function = param2;
         var placeholder:§_-9e4§ = param3;
         rect = DisplayUtils.§_-5Si§(displayObject);
         result = new §_-A8M§(completeCallback,placeholder);
         rect.width = rect.width == 0 ? 1 : Math.ceil(rect.width);
         rect.height = rect.height == 0 ? 1 : Math.ceil(rect.height);
         matrix = new Matrix();
         matrix.scale(displayObject.scaleX,displayObject.scaleY);
         matrix.translate(-rect.x,-rect.y);
         §_-4Ln§.instance.createBitmapData(displayObject,matrix,rect.width,rect.height,true,0).then(function(param1:BitmapData):void
         {
            result.setBitmap(param1,rect);
         });
         return result;
      }
      
      public static function §_-1af§(param1:DisplayObject) : void
      {
         var _loc2_:DisplayObjectContainer = null;
         var _loc3_:int = 0;
         if(param1 == null)
         {
            return;
         }
         if(Context.instance.§_-AIA§.§_-3OB§)
         {
            if(param1.parent != null)
            {
               _loc2_ = param1.parent;
               _loc3_ = _loc2_.getChildIndex(param1);
               _loc2_.removeChild(param1);
               _loc2_.addChildAt(param1,_loc3_);
            }
         }
      }
      
      public static function §_-0Bj§(param1:DisplayObjectContainer) : void
      {
         var _loc2_:MovieClip = param1 as MovieClip;
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.play();
         var _loc3_:int = 0;
         while(_loc3_ < param1.numChildren)
         {
            §_-0Bj§(param1.getChildAt(_loc3_) as DisplayObjectContainer);
            _loc3_++;
         }
      }
      
      public static function §_-5cR§(param1:DisplayObject, param2:Boolean = true) : void
      {
         if(param1 != null && param1.parent != null)
         {
            param1.parent.removeChild(param1);
            if(param2 && param1 is §_-5m-§)
            {
               (param1 as §_-5m-§).destroy();
            }
         }
      }
      
      public static function §_-AHM§(param1:DisplayObject) : Point
      {
         return new Point(param1.x,param1.y);
      }
      
      public static function §_-52M§(param1:DisplayObjectContainer) : void
      {
         var _loc4_:DisplayObject = null;
         if(param1.numChildren == 0)
         {
            return;
         }
         var _loc2_:Number = 0;
         var _loc3_:int = 0;
         while(_loc3_ < param1.numChildren)
         {
            _loc2_ = Math.max(_loc2_,param1.getChildAt(_loc3_).height);
            _loc3_++;
         }
         _loc3_ = 0;
         while(_loc3_ < param1.numChildren)
         {
            _loc4_ = param1.getChildAt(_loc3_);
            _loc4_.y = _loc2_ / 2 - _loc4_.height / 2;
            _loc3_++;
         }
      }
      
      public static function §_-63e§(param1:DisplayObject) : void
      {
         var _loc2_:DisplayObjectContainer = null;
         var _loc3_:int = 0;
         if(param1 is Bitmap)
         {
            (param1 as Bitmap).smoothing = true;
            return;
         }
         if(param1 is Shape)
         {
            §_-9YZ§((param1 as Shape).graphics);
            return;
         }
         if(param1 is DisplayObjectContainer)
         {
            _loc2_ = param1 as DisplayObjectContainer;
            _loc3_ = 0;
            while(_loc3_ < _loc2_.numChildren)
            {
               §_-63e§(_loc2_.getChildAt(_loc3_));
               _loc3_++;
            }
         }
      }
      
      private static function §_-9YZ§(param1:Graphics) : void
      {
         var changed:Boolean;
         var data:Vector.<IGraphicsData> = null;
         var item:IGraphicsData = null;
         var fill:GraphicsBitmapFill = null;
         var graphics:Graphics = param1;
         try
         {
            data = Vector.<IGraphicsData>(graphics.readGraphicsData(false));
         }
         catch(error:Error)
         {
            §_-3YE§.§_-7aK§("CityDisplayUtils.smoothGraphics: can\'t read graphics data: " + error.message);
            return;
         }
         changed = false;
         for each(item in data)
         {
            fill = item as GraphicsBitmapFill;
            if(fill != null && !fill.smooth)
            {
               fill.smooth = true;
               changed = true;
            }
         }
         if(changed)
         {
            graphics.clear();
            graphics["drawGraphicsData"](data);
         }
      }
   }
}

