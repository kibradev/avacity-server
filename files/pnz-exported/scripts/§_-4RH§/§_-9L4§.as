package §_-4RH§
{
   import §_-7xl§.§_-73b§;
   import §_-7xl§.§_-7VJ§;
   import flash.display.BitmapData;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.media.Sound;
   
   public class §_-9L4§ extends §_-7VJ§
   {
      private var §_-2X0§:Array = [];
      
      private var §_-3RJ§:Object = {};
      
      public function §_-9L4§(param1:String)
      {
         super(null,param1);
      }
      
      public function §_-3RG§(param1:§_-7VJ§) : void
      {
         this.§_-2X0§.push(param1);
      }
      
      override public function createBitmapData(param1:String, param2:int, param3:int) : BitmapData
      {
         var _loc4_:§_-7VJ§ = this.§_-91g§(param1);
         return _loc4_.createBitmapData(param1,param2,param3);
      }
      
      override public function hasDefinition(param1:String) : Boolean
      {
         var _loc2_:§_-7VJ§ = this.§_-3tm§(param1);
         return _loc2_ != null;
      }
      
      override public function getDefinition(param1:String) : Class
      {
         var _loc2_:§_-7VJ§ = this.§_-91g§(param1);
         return _loc2_.getDefinition(param1);
      }
      
      override public function createMovieClip(param1:String) : MovieClip
      {
         var _loc2_:§_-7VJ§ = this.§_-91g§(param1);
         return _loc2_.createMovieClip(param1);
      }
      
      override public function createSound(param1:String) : Sound
      {
         var _loc2_:§_-7VJ§ = this.§_-91g§(param1);
         return _loc2_.createSound(param1);
      }
      
      override public function createSprite(param1:String) : Sprite
      {
         var _loc2_:§_-7VJ§ = this.§_-91g§(param1);
         return _loc2_.createSprite(param1);
      }
      
      override public function createClass(param1:String) : Class
      {
         var _loc2_:§_-7VJ§ = this.§_-91g§(param1);
         return _loc2_.createClass(param1);
      }
      
      private function §_-91g§(param1:String) : §_-7VJ§
      {
         var _loc2_:§_-7VJ§ = this.§_-3tm§(param1);
         if(_loc2_ == null)
         {
            throw new §_-73b§("Class definition " + param1 + " not exists, domain=" + §_-6jQ§);
         }
         return _loc2_;
      }
      
      private function §_-3tm§(param1:String) : §_-7VJ§
      {
         var _loc2_:§_-7VJ§ = null;
         if(this.§_-3RJ§.hasOwnProperty(param1))
         {
            return this.§_-3RJ§[param1];
         }
         for each(_loc2_ in this.§_-2X0§)
         {
            if(_loc2_.hasDefinition(param1))
            {
               this.§_-3RJ§[param1] = _loc2_;
               return _loc2_;
            }
         }
         return null;
      }
   }
}

