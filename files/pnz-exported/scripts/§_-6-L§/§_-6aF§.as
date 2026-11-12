package §_-6-L§
{
   import flash.net.registerClassAlias;
   import flash.utils.ByteArray;
   import flash.utils.getDefinitionByName;
   import flash.utils.getQualifiedClassName;
   import flash.utils.getQualifiedSuperclassName;
   
   public class §_-6aF§
   {
      public function §_-6aF§()
      {
         super();
      }
      
      public static function getClass(param1:Object) : Class
      {
         return param1.constructor as Class;
      }
      
      public static function §_-3Bz§(param1:Object) : Class
      {
         var _loc2_:String = getQualifiedSuperclassName(param1);
         if(_loc2_ == null)
         {
            return null;
         }
         return getDefinitionByName(_loc2_) as Class;
      }
      
      public static function §_-1t1§(param1:Object) : Array
      {
         var _loc3_:String = null;
         var _loc2_:Array = [];
         for(_loc3_ in param1)
         {
            _loc2_.push(_loc3_);
         }
         return _loc2_;
      }
      
      public static function §_-vN§(param1:Object) : uint
      {
         var _loc3_:String = null;
         var _loc2_:uint = 0;
         for(_loc3_ in param1)
         {
            _loc2_++;
         }
         return _loc2_;
      }
      
      public static function merge(param1:Object, param2:Object = null) : Object
      {
         var _loc3_:String = null;
         if(param2 == null)
         {
            param2 = {};
         }
         for(_loc3_ in param1)
         {
            param2[_loc3_] = param1[_loc3_];
         }
         return param2;
      }
      
      public static function toString(param1:*, param2:Boolean = false) : String
      {
         var _loc4_:String = null;
         if(param1 is String || param1 is uint || param1 is int || param1 is Number || param1 is Boolean)
         {
            return String(param1);
         }
         var _loc3_:Array = [];
         for(_loc4_ in param1)
         {
            _loc3_.push(_loc4_ + ": " + (param2 ? toString(param1[_loc4_],param2) : param1[_loc4_]));
         }
         return "{" + _loc3_.join(", ") + "}";
      }
      
      public static function toArray(param1:Object) : Array
      {
         var _loc3_:* = undefined;
         var _loc2_:Array = [];
         for each(_loc3_ in param1)
         {
            _loc2_.push(_loc3_);
         }
         return _loc2_;
      }
      
      public static function clone(param1:*, param2:Class) : *
      {
         registerClassAlias("userClassAlias" + getQualifiedClassName(param2),param2);
         var _loc3_:ByteArray = new ByteArray();
         _loc3_.writeObject(param1);
         _loc3_.position = 0;
         return _loc3_.readObject();
      }
   }
}

