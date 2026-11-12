package §_-5G6§
{
   import §_-0uA§.§_-65h§;
   
   public class §_-6H6§ extends §_-65h§
   {
      private var §_-AOK§:int;
      
      public function §_-6H6§(param1:int = 1000)
      {
         super();
         this.§_-AOK§ = param1;
      }
      
      override public function write(param1:String, param2:uint, param3:String) : void
      {
         var _loc4_:* = format(param1,param2,param3);
         if(_loc4_.length > this.§_-AOK§)
         {
            _loc4_ = _loc4_.substr(0,this.§_-AOK§) + "...";
         }
      }
   }
}

