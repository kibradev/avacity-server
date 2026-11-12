package §_-CLv§
{
   public class §_-3zt§
   {
      public function §_-3zt§()
      {
         super();
      }
      
      public static function §_-7cy§(param1:Object, param2:String) : Object
      {
         if(param1 == null)
         {
            throw new ArgumentError("field cannot be null: " + param2);
         }
         return param1;
      }
      
      public static function §_-2iR§(param1:String, param2:Object) : Object
      {
         if(!param2.hasOwnProperty(param1))
         {
            throw new ArgumentError("property not found: " + param1);
         }
         return param2[param1];
      }
   }
}

