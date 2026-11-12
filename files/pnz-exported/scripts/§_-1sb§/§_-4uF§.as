package §_-1sb§
{
   import flash.utils.Dictionary;
   
   public class §_-4uF§
   {
      protected var §_-6Gt§:Dictionary = new Dictionary();
      
      public function §_-4uF§()
      {
         super();
      }
      
      protected function §_-7NB§(param1:String, param2:String) : String
      {
         return param2.length > 0 ? param2 + "-" + param1 : param1;
      }
      
      protected function §_-BRR§(param1:String, param2:String, param3:String, param4:Array, param5:int = 0) : void
      {
         if(!this.§_-6Gt§.hasOwnProperty(param1))
         {
            this.§_-6Gt§[param1] = new Dictionary();
         }
         var _loc6_:String = this.§_-7NB§(param3,param2);
         Dictionary(this.§_-6Gt§[param1])[_loc6_] = new §_-2xb§(param4,param5,param1);
      }
      
      public function translate(param1:String, param2:String, param3:String = "") : §_-2xb§
      {
         if(!this.§_-6Gt§.hasOwnProperty(param1))
         {
            return null;
         }
         var _loc4_:String = this.§_-7NB§(param2,param3);
         if(!Dictionary(this.§_-6Gt§[param1]).hasOwnProperty(_loc4_))
         {
            return null;
         }
         return Dictionary(this.§_-6Gt§[param1])[_loc4_];
      }
   }
}

