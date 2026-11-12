package §_-PP§
{
   import §_-1Fx§.§_-5n7§;
   import §_-1Fx§.§_-6IC§;
   import §_-2U3§.ResourceManager;
   import §_-6JL§.§_-B9P§;
   import §_-A2M§.§_-4Ba§;
   import §_-AaA§.§_-1FH§;
   import §_-AaA§.§_-5Kl§;
   import §_-GM§.Context;
   import com.greensock.TweenLite;
   import com.greensock.easing.Linear;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.MovieClip;
   import flash.display.PixelSnapping;
   import flash.text.TextField;
   import penzville.Config;
   
   public class §_-4fB§ extends §_-5n7§ implements §_-1FH§
   {
      private static const §_-25e§:Number = 1;
      
      private static const §_-CM5§:Number = 0.2;
      
      private static const §_-1Kx§:String = "CityPreloaderBg@ui";
      
      private static const §_-zQ§:String = "CityPreloaderLogo@ui";
      
      private static const §_-BHx§:String = Context.§_-5o8§.message("loading2");
      
      private var §_-8RM§:Bitmap = null;
      
      private var §_-554§:MovieClip = null;
      
      private var _label:TextField = null;
      
      private var §_-7P1§:uint;
      
      private var §_-2O7§:uint;
      
      private var §_-3FT§:uint;
      
      public function §_-4fB§(param1:Boolean = false)
      {
         super();
         this.createBackground();
         this.§_-AxB§();
         if(param1)
         {
            this.createLabel();
         }
         this.resize();
         Context.§_-CLP§.addEventListener(§_-B9P§.RESIZE,this.onResize);
      }
      
      private function §_-0rv§() : §_-4Ba§
      {
         var task:§_-4Ba§ = null;
         if(this.§_-8RM§ == null)
         {
            return §_-4Ba§.resolve();
         }
         task = new §_-4Ba§();
         TweenLite.to(this.§_-8RM§,§_-25e§,{
            "alpha":0,
            "ease":Linear.easeInOut,
            "onComplete":function():void
            {
               task.resolve();
            }
         });
         return task;
      }
      
      private function §_-vQ§() : §_-4Ba§
      {
         var task:§_-4Ba§ = null;
         if(this._label == null)
         {
            return §_-4Ba§.resolve();
         }
         task = new §_-4Ba§();
         TweenLite.to(this._label,§_-25e§,{
            "alpha":0,
            "ease":Linear.easeInOut,
            "onComplete":function():void
            {
               task.resolve();
            }
         });
         return task;
      }
      
      private function §_-Nn§() : §_-4Ba§
      {
         var task:§_-4Ba§ = null;
         if(this.§_-554§ == null)
         {
            return §_-4Ba§.resolve();
         }
         task = new §_-4Ba§();
         TweenLite.to(this.§_-554§,§_-CM5§,{
            "scaleX":1.1,
            "scaleY":1.1,
            "ease":Linear.easeInOut,
            "onComplete":function():void
            {
               task.resolve();
            }
         });
         return task;
      }
      
      private function §_-BSA§() : §_-4Ba§
      {
         var task:§_-4Ba§ = null;
         if(this.§_-554§ == null)
         {
            return §_-4Ba§.resolve();
         }
         task = new §_-4Ba§();
         TweenLite.to(this.§_-554§,§_-CM5§,{
            "scaleX":0,
            "scaleY":0,
            "ease":Linear.easeInOut,
            "onComplete":function():void
            {
               task.resolve();
            }
         });
         return task;
      }
      
      private function §_-AxB§() : void
      {
         this.§_-554§ = ResourceManager.createMovieClip(§_-zQ§);
         addChild(this.§_-554§);
         this.§_-3FT§ = this.§_-554§.height;
      }
      
      private function createBackground() : void
      {
         var _loc1_:MovieClip = ResourceManager.createMovieClip(§_-1Kx§);
         var _loc2_:BitmapData = new BitmapData(_loc1_.width,_loc1_.height);
         _loc2_.draw(_loc1_);
         this.§_-8RM§ = new §_-6IC§(_loc2_,PixelSnapping.AUTO,true);
         addChild(this.§_-8RM§);
         this.§_-7P1§ = this.§_-8RM§.width;
         this.§_-2O7§ = this.§_-8RM§.height;
      }
      
      private function createLabel() : void
      {
         this._label = §_-5Kl§.createTextField(0,0,§_-BHx§,§_-5Kl§.§_-8sp§,{
            "color":15712255,
            "size":26,
            "glowFilter":{
               "color":7095262,
               "blurX":1.3,
               "blurY":1.3,
               "strength":50,
               "quality":5,
               "alpha":1
            }
         });
         addChild(this._label);
      }
      
      public function updateLabel(param1:int) : void
      {
         if(this._label == null)
         {
            return;
         }
         if(param1 <= 0 || param1 > 100)
         {
            return;
         }
         this._label.text = §_-BHx§ + " (" + param1 + "%)";
         this._label.x = Config.§_-50z§ / 2 - this._label.width / 2;
      }
      
      public function §_-CIa§(param1:int, param2:int) : void
      {
         var _loc4_:int = 0;
         var _loc3_:int = param2;
         _loc4_ = param2 * this.§_-7P1§ / this.§_-2O7§;
         if(_loc4_ < param1)
         {
            _loc4_ = param1;
            _loc3_ = param1 * this.§_-2O7§ / this.§_-7P1§;
         }
         this.§_-8RM§.scaleX = _loc4_ / this.§_-7P1§;
         this.§_-8RM§.scaleY = _loc3_ / this.§_-2O7§;
         this.§_-8RM§.x = param1 / 2 - _loc4_ / 2;
         this.§_-8RM§.y = param2 / 2 - _loc3_ / 2;
         this.§_-554§.x = param1 / 2;
         this.§_-554§.y = param2 / 2;
         if(this._label != null)
         {
            this._label.x = param1 / 2 - this._label.width / 2;
            this._label.y = this.§_-554§.y + this.§_-3FT§ / 2 + 20;
         }
      }
      
      public function resize() : void
      {
         if(this.§_-8RM§ == null || this.§_-554§ == null)
         {
            return;
         }
         this.§_-CIa§(Config.§_-50z§,Config.§_-6Z0§);
      }
      
      public function get §_-BqX§() : §_-4Ba§
      {
         if(this.§_-554§ == null)
         {
            return §_-4Ba§.resolve();
         }
         this.§_-554§.stop();
         return §_-4Ba§.sequence([this.§_-Nn§,function():§_-4Ba§
         {
            return §_-4Ba§.all([§_-BSA§(),§_-0rv§(),§_-vQ§()]);
         }]);
      }
      
      private function onResize(param1:§_-B9P§) : void
      {
         this.resize();
      }
      
      override public function destroy() : void
      {
         if(destroyed)
         {
            return;
         }
         Context.§_-CLP§.removeEventListener(§_-B9P§.RESIZE,this.onResize);
         if(this.§_-8RM§ != null)
         {
            this.§_-8RM§.bitmapData.dispose();
            this.§_-8RM§ = null;
         }
         if(this.§_-554§ != null)
         {
            this.§_-554§ = null;
         }
         super.destroy();
      }
   }
}

