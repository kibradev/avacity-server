package §_-2FG§
{
   import §_-9qa§.§_-CcT§;
   import §_-9qa§.§_-KZ§;
   
   public class §_-Ho§
   {
      private var §_-82Z§:Object = null;
      
      public function §_-Ho§()
      {
         super();
      }
      
      public function configure(param1:XML) : void
      {
         var _loc2_:XML = null;
         var _loc3_:§_-CcT§ = null;
         if(param1 == null)
         {
            return;
         }
         this.§_-82Z§ = {};
         for each(_loc2_ in param1.elements("rule"))
         {
            _loc3_ = new §_-CcT§();
            _loc3_.configure(_loc2_);
            this.§_-82Z§[_loc3_.index] = _loc3_;
         }
      }
      
      public function getGift(param1:int) : §_-KZ§
      {
         var _loc2_:int = 1;
         var _loc3_:int = 1;
         while(_loc3_ < param1)
         {
            if(!this.§_-82Z§.hasOwnProperty(_loc2_))
            {
               return null;
            }
            _loc2_ = (this.§_-82Z§[_loc2_] as §_-CcT§).§_-08F§ > 0 ? (this.§_-82Z§[_loc2_] as §_-CcT§).§_-08F§ : _loc2_ + 1;
            _loc3_++;
         }
         return !!this.§_-82Z§.hasOwnProperty(_loc2_) ? (this.§_-82Z§[_loc2_] as §_-CcT§).gift : null;
      }
   }
}

