package §_-63P§
{
   import flash.text.Font;
   import flash.text.TextField;
   import flash.text.TextFormat;
   
   public class §_-5PR§
   {
      private static const §_-9sc§:RegExp = /[\u{1f300}-\u{1f5ff}\u{1f900}-\u{1f9ff}\u{1f600}-\u{1f64f}\u{1f680}-\u{1f6ff}\u{2600}-\u{26ff}\u{2700}-\u{27bf}\u{1f1e6}-\u{1f1ff}\u{1f191}-\u{1f251}\u{1f004}\u{1f0cf}\u{1f170}-\u{1f171}\u{1f17e}-\u{1f17f}\u{1f18e}\u{3030}\u{2b50}\u{2b55}\u{2934}-\u{2935}\u{2b05}-\u{2b07}\u{2b1b}-\u{2b1c}\u{3297}\u{3299}\u{303d}\u{00a9}\u{00ae}\u{2122}\u{23f3}\u{24c2}\u{23e9}-\u{23ef}\u{25b6}\u{23f8}-\u{23fa}\u{200d}\u{fffd}]+/ug;
      
      public static const §_-2o§:RegExp = /[\r\n]+/g;
      
      public function §_-5PR§()
      {
         super();
      }
      
      public static function §_-Ad1§(param1:String) : String
      {
         var _loc2_:String = param1;
         _loc2_ = _loc2_.replace(/<br>/g,"\n");
         _loc2_ = _loc2_.replace(/&nbsp/g," ");
         return _loc2_.replace(/<[\/a-zA-Z0-9 =:"]+>/g,"");
      }
      
      public static function §_-Bj6§(param1:String, param2:Boolean = false) : String
      {
         var _loc3_:String = param1.replace(§_-9sc§,"");
         if(param2)
         {
            _loc3_ = _loc3_.replace(§_-2o§,"");
         }
         return _loc3_;
      }
      
      public static function §_-eu§(param1:String) : String
      {
         return param1.replace(/^\s+|\s+$/g,"");
      }
      
      public static function §_-8Ld§(param1:int) : String
      {
         var _loc2_:String = param1.toString();
         var _loc3_:String = "";
         var _loc4_:int = 0;
         var _loc5_:int = _loc2_.length - 1;
         while(_loc5_ >= 0)
         {
            if(_loc4_ % 3 == 0)
            {
               _loc3_ = " " + _loc3_;
            }
            _loc3_ = _loc2_.charAt(_loc5_) + _loc3_;
            _loc4_++;
            _loc5_--;
         }
         return _loc3_;
      }
      
      public static function §_-AxP§(param1:String, param2:String) : Boolean
      {
         return param1.indexOf(param2) == 0;
      }
      
      public static function split(param1:String, param2:String, param3:int = 0) : Array
      {
         if(param3 <= 0)
         {
            return param1.split(param2);
         }
         var _loc4_:Array = param1.split(param2);
         if(_loc4_.length <= param3)
         {
            return _loc4_;
         }
         var _loc5_:Array = [];
         var _loc6_:int = 0;
         while(_loc6_ < param3 - 1)
         {
            _loc5_.push(_loc4_[_loc6_]);
            _loc6_++;
         }
         var _loc7_:String = _loc4_.slice(param3 - 1).join(param2);
         _loc5_.push(_loc7_);
         return _loc5_;
      }
      
      public static function §_-Bvt§(param1:TextField, param2:String) : Boolean
      {
         var _loc5_:Font = null;
         if(param1 == null)
         {
            return false;
         }
         var _loc3_:TextFormat = param1.defaultTextFormat;
         if(_loc3_ == null || _loc3_.font == null)
         {
            return false;
         }
         var _loc4_:Array = Font.enumerateFonts(true);
         for each(_loc5_ in _loc4_)
         {
            if(_loc5_.fontName == _loc3_.font)
            {
               return _loc5_.hasGlyphs(param2);
            }
         }
         return false;
      }
   }
}

