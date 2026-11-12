package §_-6-L§
{
   import §_-1iV§.§_-BkM§;
   import §_-Ahj§.§_-9XI§;
   import flash.display.Bitmap;
   import flash.display.Stage;
   import flash.display.StageDisplayState;
   import flash.net.FileReference;
   import flash.utils.ByteArray;
   
   public class §_-CTu§
   {
      public function §_-CTu§()
      {
         super();
      }
      
      public static function §_-7EN§(param1:String) : String
      {
         var _loc2_:Number = Number(param1.lastIndexOf("."));
         if(_loc2_ == -1)
         {
            return "";
         }
         return param1.substr(_loc2_ + 1,param1.length);
      }
      
      public static function §_-bv§(param1:Bitmap, param2:String) : void
      {
         var _loc3_:Stage = §_-BkM§.getStage();
         if(_loc3_.displayState != StageDisplayState.NORMAL)
         {
            _loc3_.displayState = StageDisplayState.NORMAL;
         }
         var _loc4_:ByteArray = §_-9XI§.encode(param1.bitmapData);
         var _loc5_:FileReference = new FileReference();
         _loc5_.save(_loc4_,param2 + ".png");
      }
   }
}

