package §_-ti§
{
   public class §_-ACm§
   {
      private var §_-B58§:Object = {};
      
      public function §_-ACm§()
      {
         super();
      }
      
      public function §_-7di§(param1:§_-1RU§) : void
      {
         this.§_-B58§[param1.commandId] = param1;
      }
      
      public function §_-24I§(param1:String) : Boolean
      {
         if(this.§_-B58§.hasOwnProperty(param1))
         {
            delete this.§_-B58§[param1];
            return true;
         }
         return false;
      }
      
      public function §_-8yl§(param1:String) : §_-1RU§
      {
         return this.§_-B58§[param1] as §_-1RU§;
      }
      
      public function §_-68k§() : Array
      {
         var _loc2_:String = null;
         var _loc1_:Array = [];
         for(_loc2_ in this.§_-B58§)
         {
            _loc1_.push(this.§_-B58§[_loc2_]);
         }
         return _loc1_;
      }
      
      public function §_-BN4§(param1:int) : Array
      {
         var _loc3_:String = null;
         var _loc4_:§_-1RU§ = null;
         var _loc2_:Array = [];
         for(_loc3_ in this.§_-B58§)
         {
            _loc4_ = this.§_-B58§[_loc3_] as §_-1RU§;
            if(Boolean(_loc4_) && _loc4_.§_-7Of§ <= param1)
            {
               _loc2_.push(_loc4_);
            }
         }
         return _loc2_;
      }
   }
}

