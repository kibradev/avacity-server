package §_-0Lb§
{
   import §_-1Vu§.§_-Awf§;
   import §_-2U3§.ResourceManager;
   import §_-5Us§.§_-2o6§;
   import §_-5ms§.§_-1sx§;
   import §_-789§.§_-BgK§;
   import §_-7OU§.§_-CQ7§;
   import §_-7xl§.§_-7VJ§;
   import §_-9VF§.§_-48g§;
   import §_-9VF§.§_-5ab§;
   import §_-A2M§.§_-4Ba§;
   import §_-A2M§.§_-4Ln§;
   import §_-AOz§.AvatarClothesItem;
   import §_-AOz§.Clothes;
   import §_-AUc§.§_-Bm§;
   import §_-AUc§.§_-Bsn§;
   import §_-AdD§.Avatar;
   import §_-BQo§.§_-2r2§;
   import §_-C-a§.§_-3PG§;
   import §_-C-a§.§_-3uA§;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class §_-3iC§
   {
      private static const §_-RZ§:Object = {
         "40":0.5,
         "80":0.9
      };
      
      private static const §_-4qz§:int = 140;
      
      private static const §_-44w§:int = 135;
      
      private static var _instance:§_-3iC§ = null;
      
      private var §_-8O6§:Object = {};
      
      private var _bitmapViews:Object = {};
      
      private var §_-1JH§:Object = {};
      
      private var §_-8IX§:Object = {};
      
      public function §_-3iC§()
      {
         super();
      }
      
      public static function get instance() : §_-3iC§
      {
         if(_instance == null)
         {
            _instance = new §_-3iC§();
         }
         return _instance;
      }
      
      public function §_-6k8§(param1:§_-5ab§, param2:Number = 1, param3:String = "df") : §_-BgK§
      {
         if(!this.§_-BTX§(param1.id,param2,param3))
         {
            this.§_-1JH§[param1.id][param2 + param3] = this.createAvatarView(param2,§_-3uA§.toString(param1.avatarAppearance.gender),this.§_-A8G§(param1,param3),param3);
         }
         return this.§_-1JH§[param1.id][param2 + param3] as §_-BgK§;
      }
      
      public function getAvatarIcon(param1:§_-5ab§, param2:int) : Bitmap
      {
         var defaultName:String;
         var task:§_-4Ba§;
         var bitmap:Bitmap = null;
         var player:§_-5ab§ = param1;
         var size:int = param2;
         if(!this.§_-CPZ§(player.id,size))
         {
            this.§_-8O6§[player.id] = this.createAvatarIcon(player);
         }
         defaultName = "default" + §_-3uA§.toString(player.avatarAppearance.gender);
         if(!this.§_-CPZ§(defaultName,size))
         {
            this.§_-8O6§[defaultName] = this.§_-5CJ§(player.avatarAppearance.gender);
         }
         bitmap = new Bitmap(this.§_-8O6§[defaultName][size]);
         task = this.§_-8O6§[player.id][size] as §_-4Ba§;
         task.then(function(param1:BitmapData):void
         {
            bitmap.bitmapData = param1;
         });
         return bitmap;
      }
      
      public function §_-3dI§(param1:Avatar, param2:int) : Bitmap
      {
         var defaultName:String;
         var task:§_-4Ba§;
         var bitmap:Bitmap = null;
         var avatar:Avatar = param1;
         var size:int = param2;
         if(!this.§_-CPZ§(avatar.userId,size))
         {
            this.§_-8O6§[avatar.userId] = this.§_-QB§(avatar);
         }
         defaultName = "default" + §_-3uA§.toString(avatar.sex);
         if(!this.§_-CPZ§(defaultName,size))
         {
            this.§_-8O6§[defaultName] = this.§_-5CJ§(avatar.sex);
         }
         bitmap = new Bitmap(this.§_-8O6§[defaultName][size]);
         task = this.§_-8O6§[avatar.userId][size] as §_-4Ba§;
         task.then(function(param1:BitmapData):void
         {
            bitmap.bitmapData = param1;
         });
         return bitmap;
      }
      
      public function §_-2Pm§(param1:§_-5ab§, param2:int, param3:String = "df", param4:Boolean = true) : §_-4Ba§
      {
         var task:§_-4Ba§ = null;
         var player:§_-5ab§ = param1;
         var size:int = param2;
         var iconType:String = param3;
         var useCache:Boolean = param4;
         if(useCache && this.§_-BkY§(player.id,size,iconType))
         {
            return §_-4Ba§.resolve(new Bitmap(this._bitmapViews[player.id][size + iconType]));
         }
         task = new §_-4Ba§();
         this.§_-A8G§(player,iconType).then(function(param1:§_-Bm§):void
         {
            var _loc2_:Object = createAvatarBitmapView(player,iconType);
            if(useCache)
            {
               _bitmapViews[player.id] = _loc2_;
            }
            task.resolve(new Bitmap(_loc2_[size + iconType]));
         });
         return task;
      }
      
      public function §_-2BQ§(param1:§_-5ab§, param2:int, param3:String = "df") : Bitmap
      {
         if(!this.§_-BkY§(param1.id,param2,param3))
         {
            this._bitmapViews[param1.id] = this.createAvatarBitmapView(param1,param3);
         }
         return new Bitmap(this._bitmapViews[param1.id][param2 + param3] as BitmapData);
      }
      
      public function §_-AAt§(param1:Avatar, param2:int, param3:Boolean = true, param4:Boolean = false, param5:String = "df") : Bitmap
      {
         if(!param3)
         {
            return new Bitmap(this.§_-6L7§(param1,param2,param4,param5));
         }
         if(!this.§_-BkY§(param1.userId,param2,param5))
         {
            this._bitmapViews[param1.userId] = this.§_-2tB§(param1,param5);
         }
         return new Bitmap(this._bitmapViews[param1.userId][param2 + param5] as BitmapData);
      }
      
      public function §_-6kH§(param1:§_-5ab§, param2:int) : void
      {
         if(this.§_-CPZ§(param1.id,param2))
         {
            delete this.§_-8O6§[param1.id][param2];
         }
      }
      
      public function §_-0B2§(param1:§_-5ab§, param2:int = 0) : void
      {
         if(this.§_-BkY§(param1.id,param2,§_-5GY§.§_-vU§))
         {
            delete this._bitmapViews[param1.id][param2 + §_-5GY§.§_-vU§];
         }
         if(this.§_-BkY§(param1.id,param2,§_-5GY§.§_-6bt§))
         {
            delete this._bitmapViews[param1.id][param2 + §_-5GY§.§_-6bt§];
         }
      }
      
      public function §_-Bu4§(param1:String) : void
      {
         if(this._bitmapViews.hasOwnProperty(param1))
         {
            delete this._bitmapViews[param1];
         }
         if(this.§_-1JH§.hasOwnProperty(param1))
         {
            delete this.§_-1JH§[param1];
         }
         if(this.§_-8IX§.hasOwnProperty(param1))
         {
            delete this.§_-8IX§[param1];
         }
      }
      
      private function createAvatarBitmapView(param1:§_-5ab§, param2:String = "df") : Object
      {
         return this.§_-C6d§([§_-5GY§.VIEW_160,§_-5GY§.VIEW_256,§_-5GY§.VIEW_420],this.§_-9qR§(param1,param2),param2);
      }
      
      private function createAvatarIcon(param1:§_-5ab§) : Object
      {
         return this.§_-CMc§([§_-5GY§.ICON_80,§_-5GY§.ICON_40],this.§_-A8G§(param1));
      }
      
      private function §_-5CJ§(param1:int) : Object
      {
         return this.§_-9UL§([§_-5GY§.ICON_80,§_-5GY§.ICON_40],param1);
      }
      
      private function createAvatarView(param1:Number, param2:String, param3:§_-4Ba§, param4:String = "df") : §_-BgK§
      {
         var avatarOffset:Point;
         var view:§_-BgK§ = null;
         var defaultName:String = null;
         var matrix:Matrix = null;
         var placeholderSkeleton:§_-Bm§ = null;
         var placeholderBounds:Rectangle = null;
         var bitmapData:BitmapData = null;
         var scale:Number = param1;
         var sex:String = param2;
         var skeletonTask:§_-4Ba§ = param3;
         var iconType:String = param4;
         view = new §_-BgK§();
         defaultName = "placeholder" + sex;
         matrix = new Matrix();
         matrix.scale(scale,scale);
         if(!this.§_-BTX§(defaultName,scale,iconType))
         {
            placeholderSkeleton = this.§_-3Wd§(§_-3uA§.§_-47B§(sex),iconType);
            placeholderBounds = placeholderSkeleton.rootView.getBounds(placeholderSkeleton);
            placeholderSkeleton.rootView.x = -placeholderBounds.x;
            placeholderSkeleton.rootView.y = -placeholderBounds.y;
            bitmapData = new BitmapData(Math.ceil(placeholderBounds.width * scale),Math.ceil(placeholderBounds.height * scale),true,0);
            bitmapData.draw(placeholderSkeleton,matrix);
            this.§_-1JH§[defaultName][scale + iconType] = bitmapData;
            this.§_-8IX§[defaultName][scale + iconType] = new Point(placeholderBounds.bottom,placeholderBounds.left);
         }
         view.§_-0iI§ = this.§_-1JH§[defaultName][scale + iconType];
         avatarOffset = this.§_-8IX§[defaultName][scale + iconType];
         view.yOffset = avatarOffset.x;
         view.xOffset = avatarOffset.y;
         skeletonTask.then(function(param1:§_-Bm§):void
         {
            var _loc2_:Rectangle = null;
            _loc2_ = param1.rootView.getBounds(param1);
            param1.rootView.x = -_loc2_.x;
            param1.rootView.y = -_loc2_.y;
            view.yOffset = _loc2_.bottom;
            view.xOffset = _loc2_.left;
            view.setTask(_loc2_,§_-4Ln§.instance.createBitmapData(param1,matrix,_loc2_.width * scale,_loc2_.height * scale,true,0));
         });
         return view;
      }
      
      private function §_-3Wd§(param1:int, param2:String = "df") : §_-Bm§
      {
         var _loc3_:§_-48g§ = new §_-48g§();
         _loc3_.avatarAppearance.gender = param1;
         _loc3_.avatarAppearance.setColorIndexByCategory(§_-2o6§.§_-1r5§,0);
         _loc3_.avatarAppearance.setPartTypeByCategory(§_-2o6§.HAIR,0);
         _loc3_.avatarAppearance.setPartTypeByCategory(§_-2o6§.BROWS,0);
         _loc3_.avatarAppearance.setPartTypeByCategory(§_-2o6§.EYES,0);
         _loc3_.avatarAppearance.setPartTypeByCategory(§_-2o6§.MOUTH,0);
         var _loc4_:§_-7VJ§ = ResourceManager.getADF("avatarAnimation");
         var _loc5_:§_-Bm§ = new §_-Bm§(§_-3PG§.§_-CUz§,§_-3uA§.toString(_loc3_.avatarAppearance.gender),"F",false,_loc3_.avatarAppearance.colorSet.toArray(),_loc4_);
         var _loc6_:§_-2r2§ = new §_-2r2§();
         this.§_-5pO§(_loc3_,_loc6_,param2);
         §_-CQ7§.§_-xC§(_loc3_.avatarAppearance,_loc6_,_loc3_.canShowHair(),_loc3_.canShowBeard());
         var _loc7_:§_-4Ba§ = new §_-4Ba§();
         _loc6_.decorateSkeleton(_loc5_);
         _loc5_.finalizeDressing();
         _loc7_.resolve(_loc5_);
         return _loc5_;
      }
      
      private function §_-QB§(param1:Avatar) : Object
      {
         return this.§_-CMc§([§_-5GY§.ICON_80,§_-5GY§.ICON_40],this.§_-5nX§(param1));
      }
      
      private function §_-2tB§(param1:Avatar, param2:String = "df") : Object
      {
         return this.§_-C6d§([§_-5GY§.VIEW_160,§_-5GY§.VIEW_256],this.§_-71q§(param1));
      }
      
      private function §_-6L7§(param1:Avatar, param2:int, param3:Boolean = false, param4:String = "df") : BitmapData
      {
         return this.§_-C6d§([param2],this.§_-71q§(param1,param3),param4)[param2 + param4] as BitmapData;
      }
      
      private function §_-BTX§(param1:String, param2:Number, param3:String = "df") : Boolean
      {
         if(!this.§_-1JH§.hasOwnProperty(param1))
         {
            this.§_-1JH§[param1] = {};
            this.§_-8IX§[param1] = {};
            return false;
         }
         return (this.§_-1JH§[param1] as Object).hasOwnProperty(String(param2) + param3);
      }
      
      private function §_-BkY§(param1:String, param2:Number, param3:String = "df") : Boolean
      {
         if(!this._bitmapViews.hasOwnProperty(param1))
         {
            this._bitmapViews[param1] = {};
            return false;
         }
         return (this._bitmapViews[param1] as Object).hasOwnProperty(String(param2) + param3);
      }
      
      private function §_-CPZ§(param1:String, param2:int) : Boolean
      {
         if(!this.§_-8O6§.hasOwnProperty(param1))
         {
            this.§_-8O6§[param1] = {};
            return false;
         }
         return (this.§_-8O6§[param1] as Object).hasOwnProperty(String(param2));
      }
      
      private function §_-71q§(param1:Avatar, param2:Boolean = false) : §_-Bm§
      {
         var _loc7_:§_-Bsn§ = null;
         var _loc3_:§_-7VJ§ = ResourceManager.getADF("avatarAnimation");
         var _loc4_:§_-Bm§ = new §_-Bm§(§_-3PG§.§_-CUz§,§_-3uA§.toString(param1.sex),"F",param2,param1.colors,_loc3_);
         var _loc5_:§_-2r2§ = param1.§_-0HA§();
         var _loc6_:Array = [];
         for each(_loc7_ in _loc5_.clothes)
         {
            if(!(_loc7_ is §_-1sx§))
            {
               _loc6_.push(_loc7_);
            }
         }
         _loc5_.clothes = _loc6_;
         _loc5_.decorateSkeleton(_loc4_);
         _loc4_.finalizeDressing();
         return _loc4_;
      }
      
      private function §_-5nX§(param1:Avatar, param2:Boolean = false) : §_-4Ba§
      {
         var skeleton:§_-Bm§ = null;
         var decor:§_-2r2§ = null;
         var task:§_-4Ba§ = null;
         var decorator:§_-Bsn§ = null;
         var avatar:Avatar = param1;
         var rotate:Boolean = param2;
         var library:§_-7VJ§ = ResourceManager.getADF("avatarAnimation");
         skeleton = new §_-Bm§(§_-3PG§.§_-CUz§,§_-3uA§.toString(avatar.sex),"F",rotate,avatar.colors,library);
         decor = avatar.§_-0HA§();
         task = new §_-4Ba§();
         var clothes:Array = [];
         for each(decorator in decor.clothes)
         {
            if(!(decorator is §_-1sx§))
            {
               clothes.push(decorator);
            }
         }
         decor.clothes = clothes;
         decor.§_-A8f§().then(function():void
         {
            decor.decorateSkeleton(skeleton);
            skeleton.finalizeDressing();
            task.resolve(skeleton);
         });
         return task;
      }
      
      private function §_-9qR§(param1:§_-5ab§, param2:String = "df") : §_-Bm§
      {
         var _loc3_:§_-7VJ§ = ResourceManager.getADF("avatarAnimation");
         var _loc4_:§_-Bm§ = new §_-Bm§(§_-3PG§.§_-CUz§,§_-3uA§.toString(param1.avatarAppearance.gender),"F",false,param1.avatarAppearance.colorSet.toArray(),_loc3_);
         var _loc5_:§_-2r2§ = new §_-2r2§();
         this.§_-5pO§(param1,_loc5_,param2);
         §_-CQ7§.§_-xC§(param1.avatarAppearance,_loc5_,param1.canShowHair(),param1.canShowBeard());
         _loc5_.decorateSkeleton(_loc4_);
         _loc4_.finalizeDressing();
         return _loc4_;
      }
      
      private function §_-A8G§(param1:§_-5ab§, param2:String = "df") : §_-4Ba§
      {
         var skeleton:§_-Bm§ = null;
         var decor:§_-2r2§ = null;
         var task:§_-4Ba§ = null;
         var player:§_-5ab§ = param1;
         var iconType:String = param2;
         var library:§_-7VJ§ = ResourceManager.getADF("avatarAnimation");
         skeleton = new §_-Bm§(§_-3PG§.§_-CUz§,§_-3uA§.toString(player.avatarAppearance.gender),"F",false,player.avatarAppearance.colorSet.toArray(),library);
         decor = new §_-2r2§();
         this.§_-5pO§(player,decor,iconType);
         §_-CQ7§.§_-xC§(player.avatarAppearance,decor,player.canShowHair(),player.canShowBeard());
         task = new §_-4Ba§();
         decor.§_-A8f§().then(function():void
         {
            decor.decorateSkeleton(skeleton);
            skeleton.finalizeDressing();
            task.resolve(skeleton);
         });
         return task;
      }
      
      private function §_-C6d§(param1:Array, param2:§_-Bm§, param3:String = "df") : Object
      {
         var _loc6_:int = 0;
         var _loc7_:Number = NaN;
         var _loc8_:Matrix = null;
         var _loc9_:Rectangle = null;
         var _loc10_:BitmapData = null;
         var _loc4_:Rectangle = this.§_-3Md§(param2);
         var _loc5_:Object = {};
         for each(_loc6_ in param1)
         {
            _loc7_ = _loc6_ / _loc4_.height;
            _loc8_ = new Matrix();
            _loc9_ = new Rectangle(0,0,Math.ceil(_loc4_.width * _loc7_),_loc6_);
            param2.scaleX = param2.scaleY = _loc7_;
            _loc8_.scale(param2.scaleX,param2.scaleY);
            _loc8_.translate(-_loc9_.x,-_loc9_.y);
            _loc10_ = new BitmapData(_loc9_.width,_loc9_.height,true,0);
            _loc10_.draw(param2,_loc8_);
            _loc5_[_loc6_ + param3] = _loc10_;
         }
         return _loc5_;
      }
      
      private function §_-CMc§(param1:Array, param2:§_-4Ba§) : Object
      {
         var result:Object = null;
         var size:int = 0;
         var sizes:Array = param1;
         var skeletonTask:§_-4Ba§ = param2;
         result = {};
         for each(size in sizes)
         {
            result[size] = new §_-4Ba§();
         }
         skeletonTask.then(function(param1:§_-Bm§):void
         {
            var size:int = 0;
            var scale:Number = NaN;
            var matrix:Matrix = null;
            var offset:Number = NaN;
            var skeleton:§_-Bm§ = param1;
            var bounds:Rectangle = §_-3bx§(skeleton);
            for each(size in sizes)
            {
               scale = Number(§_-RZ§[String(size)]);
               matrix = new Matrix();
               matrix.scale(scale,scale);
               offset = size / scale / 2 - bounds.width / 2;
               skeleton.rootView.x += offset;
               §_-4Ln§.instance.createBitmapData(skeleton,matrix,size,size,true,0,true).then(function(param1:BitmapData):void
               {
                  (result[param1.width] as §_-4Ba§).resolve(param1);
               });
               skeleton.rootView.x -= offset;
            }
         });
         return result;
      }
      
      private function §_-9UL§(param1:Array, param2:int) : Object
      {
         var _loc6_:int = 0;
         var _loc7_:BitmapData = null;
         var _loc8_:Number = NaN;
         var _loc9_:Matrix = null;
         var _loc10_:Number = NaN;
         var _loc3_:§_-Bm§ = this.§_-3Wd§(param2);
         var _loc4_:Rectangle = this.§_-3bx§(_loc3_);
         var _loc5_:Object = {};
         for each(_loc6_ in param1)
         {
            _loc7_ = new BitmapData(_loc6_,_loc6_,true,0);
            _loc8_ = Number(§_-RZ§[String(_loc6_)]);
            _loc9_ = new Matrix();
            _loc9_.scale(_loc8_,_loc8_);
            _loc10_ = _loc6_ / _loc8_ / 2 - _loc4_.width / 2;
            _loc3_.rootView.x += _loc10_;
            _loc7_.draw(_loc3_,_loc9_);
            _loc5_[_loc6_] = _loc7_;
            _loc3_.rootView.x -= _loc10_;
         }
         return _loc5_;
      }
      
      private function §_-3Md§(param1:§_-Bm§) : Rectangle
      {
         var _loc2_:Rectangle = param1.rootView.getBounds(param1);
         param1.rootView.x = -_loc2_.x;
         param1.rootView.y = -_loc2_.y;
         return _loc2_;
      }
      
      private function §_-3bx§(param1:§_-Bm§) : Rectangle
      {
         var _loc2_:Rectangle = param1.rootView.getBounds(param1);
         param1.rootView.x = -_loc2_.x;
         param1.rootView.y = param1.sex == "Boy" ? §_-4qz§ : §_-44w§;
         return _loc2_;
      }
      
      private function §_-5pO§(param1:§_-5ab§, param2:§_-2r2§, param3:String = "df") : void
      {
         var _loc5_:AvatarClothesItem = null;
         var _loc6_:Clothes = null;
         var _loc4_:Array = param3 == §_-5GY§.§_-6bt§ ? param1.avatarClothes.getClothesWithoutTag(§_-Awf§.§_-Zz§) : param1.avatarClothes.getClothes();
         for each(_loc5_ in _loc4_)
         {
            if(_loc5_.clothesItem != null)
            {
               if(param1.avatarAppearance.gender == _loc5_.clothesItem.gender)
               {
                  _loc6_ = new Clothes(_loc5_.clothesItem.name,_loc5_.clothesItem.library,_loc5_.colorId);
                  param2.clothes.push(_loc6_);
               }
            }
         }
      }
   }
}

