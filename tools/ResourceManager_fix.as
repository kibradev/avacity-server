package §_-2U3§
{
   import §_-7xl§.§_-7VJ§;
   import §_-BZi§.§_-5mH§;
   import flash.display.BitmapData;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.media.Sound;
   import flash.utils.ByteArray;
   
   public class ResourceManager
   {
      
      private static var §_-7iM§:Object = {};
      
      public function ResourceManager()
      {
         super();
      }
      
      public static function §_-0cZ§(param1:String, param2:§_-7VJ§) : void
      {
         §_-7iM§[param1] = param2;
      }
      
      public static function §_-71T§(param1:String) : void
      {
         §_-7iM§[param1] = null;
         delete §_-7iM§[param1];
      }
      
      public static function §_-5eg§(param1:String, param2:XML) : void
      {
         §_-7iM§[param1] = param2;
      }
      
      public static function §_-AMC§(param1:String, param2:Class) : void
      {
         var _loc3_:ByteArray = new param2() as ByteArray;
         §_-7iM§[param1] = new XML(_loc3_.readUTFBytes(_loc3_.length));
      }
      
      public static function getADF(param1:String) : §_-7VJ§
      {
         if(param1 == null || param1 == "")
         {
            return §_-7VJ§.§_-2tM§;
         }
         if(!§_-7iM§.hasOwnProperty(param1) || !(§_-7iM§[param1] is §_-7VJ§))
         {
            throw new Error("Invalid library:" + param1 + " or library is not registered. ");
         }
         return §_-7iM§[param1];
      }
      
      public static function §_-9QW§(param1:String) : XML
      {
         return §_-7iM§[param1];
      }
      
      public static function createMovieClip(param1:String, param2:String = null) : MovieClip
      {
         var _loc3_:ResourceLocation = §_-2gK§(param1,param2);
         if(!§_-7Bo§(_loc3_.library))
         {
            return null;
         }
         return getADF(_loc3_.library).createMovieClip(_loc3_.name);
      }

      public static function createSound(param1:String, param2:String = null) : Sound
      {
         var _loc3_:ResourceLocation = §_-2gK§(param1,param2);
         if(!§_-7Bo§(_loc3_.library))
         {
            return null;
         }
         return getADF(_loc3_.library).createSound(_loc3_.name);
      }

      public static function §_-CJB§(param1:String, param2:String = null) : §_-5mH§
      {
         var _loc3_:ResourceLocation = §_-2gK§(param1,param2);
         if(!§_-7Bo§(_loc3_.library))
         {
            return null;
         }
         var _loc4_:Sound = getADF(_loc3_.library).createSound(_loc3_.name);
         return new §_-5mH§(_loc4_);
      }

      public static function createSprite(param1:String, param2:String = null) : Sprite
      {
         var _loc3_:ResourceLocation = §_-2gK§(param1,param2);
         if(!§_-7Bo§(_loc3_.library))
         {
            return null;
         }
         return getADF(_loc3_.library).createSprite(_loc3_.name);
      }

      public static function createBitmapData(param1:String, param2:int, param3:int, param4:String = null) : BitmapData
      {
         var _loc5_:ResourceLocation = §_-2gK§(param1,param4);
         if(!§_-7Bo§(_loc5_.library))
         {
            return null;
         }
         return getADF(_loc5_.library).createBitmapData(_loc5_.name,param2,param3);
      }
      
      public static function hasDefinition(param1:String, param2:String = null) : Boolean
      {
         var _loc3_:ResourceLocation = §_-2gK§(param1,param2);
         var _loc4_:Array = §_-Aef§(param1);
         if(!§_-7Bo§(_loc3_.library))
         {
            return false;
         }
         return getADF(_loc3_.library).hasDefinition(_loc4_[0]);
      }
      
      public static function §_-7Bo§(param1:String) : Boolean
      {
         return §_-7iM§.hasOwnProperty(param1);
      }
      
      private static function §_-2gK§(param1:String, param2:String) : ResourceLocation
      {
         var _loc3_:Array = §_-Aef§(param1);
         return new ResourceLocation(_loc3_[0],_loc3_.length > 1 ? _loc3_[1] : param2);
      }
      
      private static function §_-Aef§(param1:String) : Array
      {
         var _loc2_:Array = param1.split("@");
         if(_loc2_.length > 2)
         {
            throw new Error("Invalid resource id: " + param1);
         }
         return _loc2_;
      }
   }
}

class ResourceLocation
{
   
   public var library:String;
   
   public var name:String;
   
   public function ResourceLocation(param1:String, param2:String)
   {
      super();
      this.library = param2;
      this.name = param1;
   }
}
