package §_-0uA§
{
   public class §_-65h§ implements §_-COU§
   {
      public function §_-65h§()
      {
         super();
      }
      
      public function write(param1:String, param2:uint, param3:String) : void
      {
         trace(this.format(param1,param2,param3));
      }
      
      protected function format(param1:String, param2:uint, param3:String) : String
      {
         var _loc4_:Array = ["INFO","NOTICE","WARNING","ERROR","CRITICAL"];
         var _loc5_:String = "";
         if(param2 >= 0 && param2 < _loc4_.length)
         {
            _loc5_ += "[" + _loc4_[param2] + "] ";
         }
         if(param3)
         {
            _loc5_ += "[" + param3 + "] ";
         }
         return _loc5_ + param1;
      }
   }
}

