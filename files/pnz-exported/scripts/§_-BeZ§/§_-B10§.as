package §_-BeZ§
{
   import §_-8f7§.§_-BeT§;
   import §_-BA3§.§_-0R9§;
   import §_-BA3§.§_-ACc§;
   import flash.utils.getQualifiedClassName;
   
   public class §_-B10§
   {
      private static var §_-B3V§:§_-0R9§ = new §_-0R9§();
      
      private static var §_-Bzr§:Object = {};
      
      private static var §_-5oP§:Object = {};
      
      private static var §_-4U§:Object = {};
      
      private static var §_-CDB§:Object = {};
      
      private static var §_-49F§:Object = {};
      
      public function §_-B10§()
      {
         super();
      }
      
      public static function §_-0JE§(param1:*) : §_-67e§
      {
         return §_-B3V§.§_-0JE§(param1);
      }
      
      public static function §_-8ex§(param1:§_-67e§, param2:§_-ACc§) : *
      {
         return §_-B3V§.§_-8ex§(param1,param2);
      }
      
      public static function §_-08W§(param1:Class, param2:§_-1d9§) : void
      {
         §_-Bzr§[getQualifiedClassName(param1)] = param2;
      }
      
      public static function §_-2DT§(param1:*) : §_-1d9§
      {
         var _loc2_:String = getQualifiedClassName(param1);
         return !!§_-Bzr§.hasOwnProperty(_loc2_) ? §_-Bzr§[_loc2_] : null;
      }
      
      public static function §_-8j-§(param1:String, param2:Class) : void
      {
         §_-0XZ§(param1,param2);
      }
      
      public static function §_-9HC§(param1:Class) : void
      {
         if(!§_-8TS§(param1))
         {
            throw new Error("Class should be annotated with AGSTransferable: " + getQualifiedClassName(param1));
         }
      }
      
      public static function §_-9ez§(param1:§_-BeT§) : void
      {
         var _loc2_:String = getQualifiedClassName(param1.clazz);
         §_-CDB§[_loc2_] = param1;
         §_-49F§[_loc2_] = true;
         if(param1.§_-AGP§)
         {
            §_-0XZ§(param1.alias,param1.clazz);
         }
      }
      
      public static function §_-9lJ§(param1:String) : Class
      {
         return !!§_-5oP§.hasOwnProperty(param1) ? §_-5oP§[param1] : null;
      }
      
      public static function §_-32U§(param1:Class) : String
      {
         var _loc2_:String = getQualifiedClassName(param1);
         return !!§_-4U§.hasOwnProperty(_loc2_) ? §_-4U§[_loc2_] : null;
      }
      
      public static function §_-3sJ§(param1:Class) : §_-BeT§
      {
         var _loc2_:String = getQualifiedClassName(param1);
         return !!§_-CDB§.hasOwnProperty(_loc2_) ? §_-CDB§[_loc2_] : null;
      }
      
      public static function §_-5Ze§(param1:Class) : Boolean
      {
         var _loc2_:String = getQualifiedClassName(param1);
         if(!§_-49F§.hasOwnProperty(_loc2_))
         {
            return §_-8TS§(param1);
         }
         return §_-49F§[_loc2_];
      }
      
      private static function §_-8TS§(param1:Class) : Boolean
      {
         var _loc2_:String = getQualifiedClassName(param1);
         var _loc3_:§_-BeT§ = §_-BeT§.§_-3yv§(param1);
         if(_loc3_ == null)
         {
            §_-49F§[_loc2_] = false;
         }
         else
         {
            §_-CDB§[_loc2_] = _loc3_;
            §_-49F§[_loc2_] = true;
            if(_loc3_.§_-AGP§)
            {
               §_-0XZ§(_loc3_.alias,param1);
            }
         }
         return §_-49F§[_loc2_];
      }
      
      private static function §_-0XZ§(param1:String, param2:Class) : void
      {
         §_-5oP§[param1] = param2;
         §_-4U§[getQualifiedClassName(param2)] = param1;
      }
   }
}

