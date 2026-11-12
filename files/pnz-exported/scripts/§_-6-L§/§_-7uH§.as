package §_-6-L§
{
   public class §_-7uH§
   {
      private static var §_-2lN§:Array = ["ru","en","cz","lv","pl","tr","de","es","fr","pt"];
      
      private static const §_-7jx§:Array = ["1","true","yes","y","on","enabled"];
      
      public function §_-7uH§()
      {
         super();
      }
      
      public static function §_-Bh0§(param1:String) : String
      {
         if(param1 == null)
         {
            return "";
         }
         return param1.substr(0,1).toLocaleUpperCase() + param1.substr(1);
      }
      
      public static function §_-9gk§(param1:String) : String
      {
         if(param1 == null)
         {
            return "";
         }
         return param1.substr(0,1).toLocaleLowerCase() + param1.substr(1);
      }
      
      public static function §_-118§(param1:String) : String
      {
         return §_-7uH§.§_-Bh0§(param1);
      }
      
      public static function §_-Vc§(param1:String) : String
      {
         return §_-7uH§.§_-9gk§(param1);
      }
      
      public static function plural(param1:Number, param2:Array, param3:String = "ru") : String
      {
         if(§_-7uH§.§_-2lN§.indexOf(param3) == -1)
         {
            return param1.toString();
         }
         var _loc4_:int = Math.floor(param1);
         var _loc5_:int = 0;
         if(param3 == "en" || param3 == "de" || param3 == "es" || param3 == "pt")
         {
            _loc5_ = _loc4_ == 1 ? 0 : 1;
         }
         if(param3 == "fr")
         {
            _loc5_ = _loc4_ >= 0 && _loc4_ < 2 ? 0 : 1;
         }
         if(param3 == "ru")
         {
            _loc5_ = _loc4_ % 10 == 1 && _loc4_ % 100 != 11 ? 0 : (_loc4_ % 10 >= 2 && _loc4_ % 10 <= 4 && (_loc4_ % 100 < 12 || _loc4_ % 100 > 14) ? 1 : 2);
         }
         if(param3 == "pl")
         {
            _loc5_ = _loc4_ == 1 ? 0 : (_loc4_ % 10 >= 2 && _loc4_ % 10 <= 4 && (_loc4_ % 100 < 12 || _loc4_ % 100 > 14) ? 1 : 2);
         }
         if(param3 == "tr")
         {
            _loc5_ = 0;
         }
         if(param3 == "cz")
         {
            _loc5_ = _loc4_ == 1 ? 0 : (_loc4_ % 10 >= 2 && _loc4_ % 10 <= 4 && (_loc4_ % 100 < 10 || _loc4_ % 100 > 20) ? 1 : 2);
         }
         if(param3 == "lv")
         {
            _loc5_ = _loc4_ == 0 ? 0 : (_loc4_ % 10 == 1 && _loc4_ % 100 != 11 ? 1 : 2);
         }
         if(_loc5_ >= param2.length)
         {
            return param1.toString();
         }
         return param2[_loc5_];
      }
      
      public static function §_-Bgy§(param1:String, param2:uint, param3:String = "...", param4:Boolean = true) : String
      {
         var _loc5_:int = 0;
         if(param1.length < param2)
         {
            return param1;
         }
         param1 = param1.substr(0,param2);
         if(param4)
         {
            _loc5_ = int(param1.lastIndexOf(" "));
            if(_loc5_ >= 0)
            {
               param1 = param1.substr(0,_loc5_);
            }
         }
         return param1.concat(param3);
      }
      
      public static function §_-2LC§(param1:String, param2:int) : String
      {
         var _loc5_:int = 0;
         var _loc3_:String = new String();
         var _loc4_:int = 0;
         while(_loc4_ < param1.length)
         {
            _loc5_ = parseInt(param1.substr(_loc4_,3));
            if(_loc5_ >= 48 && _loc5_ <= 57)
            {
               _loc5_ = _loc5_ - param2 - 48;
               if(_loc5_ < 0)
               {
                  _loc5_ += 57 - 48 + 1;
               }
               _loc5_ = _loc5_ % (57 - 48 + 1) + 48;
            }
            else if(_loc5_ >= 65 && _loc5_ <= 90)
            {
               _loc5_ = _loc5_ - param2 - 65;
               if(_loc5_ < 0)
               {
                  _loc5_ += 90 - 65 + 1;
               }
               _loc5_ = _loc5_ % (90 - 65 + 1) + 65;
            }
            else if(_loc5_ >= 97 && _loc5_ <= 122)
            {
               _loc5_ = _loc5_ - param2 - 97;
               if(_loc5_ < 0)
               {
                  _loc5_ += 122 - 97 + 1;
               }
               _loc5_ = _loc5_ % (122 - 97 + 1) + 97;
            }
            _loc3_ += String.fromCharCode(_loc5_);
            _loc4_ += 3;
         }
         return _loc3_;
      }
      
      public static function §_-AIf§(param1:String, param2:String = " ") : String
      {
         return §_-B9h§(§_-5mR§(param1,param2),param2);
      }
      
      public static function §_-5mR§(param1:String, param2:String = " ") : String
      {
         if(param1.length == 0)
         {
            return param1;
         }
         while(param1.length > 0 && param1.charAt(0) == param2)
         {
            param1 = param1.substring(1);
         }
         return param1;
      }
      
      public static function §_-B9h§(param1:String, param2:String = " ") : String
      {
         if(param1.length == 0)
         {
            return param1;
         }
         while(param1.length > 0 && param1.charAt(param1.length - 1) == param2)
         {
            param1 = param1.substring(0,param1.length - 1);
         }
         return param1;
      }
      
      public static function repeat(param1:String, param2:int) : String
      {
         var _loc3_:String = "";
         var _loc4_:int = 0;
         while(_loc4_ < param2)
         {
            _loc3_ += param1;
            _loc4_++;
         }
         return _loc3_;
      }
      
      public static function §_-5i§(param1:String) : Boolean
      {
         return §_-7jx§.indexOf(param1.toLowerCase()) != -1;
      }
      
      public static function §_-3z3§(param1:String) : String
      {
         var _loc2_:RegExp = /<[^<]+?>/gi;
         return param1.replace(_loc2_,"");
      }
   }
}

