package §_-6EA§
{
   public class §_-Cb1§ implements §_-8AN§
   {
      private static const §_-AvN§:int = int(new Date().time);
      
      private static const ENCRYPT_CONSTANT:int = 286331153;
      
      private static const §_-AGZ§:int = 10;
      
      private static const §_-AGH§:uint = 3172090000;
      
      private static const §_-9TD§:int = (§_-AGH§ << 1) + 1;
      
      private var _value:int;
      
      private var §_-CZD§:int;
      
      public function §_-Cb1§(param1:int = 0)
      {
         super();
         this._value = this.encode(param1);
         this.§_-CZD§ = this.§_-32o§(this._value);
      }
      
      public function §_-8Sk§() : Boolean
      {
         return Boolean(this.§_-CZD§ == this.§_-32o§(this._value));
      }
      
      public function get value() : int
      {
         return this.§_-av§(this._value);
      }
      
      public function set value(param1:int) : void
      {
         if(this.§_-8Sk§())
         {
            this._value = this.encode(param1);
            this.§_-CZD§ = this.§_-32o§(this._value);
         }
         else
         {
            this.§_-CZD§ += int(Math.random() * 1000000) + 1000000;
         }
      }
      
      private function §_-32o§(param1:int) : int
      {
         param1 += §_-Cb1§.ENCRYPT_CONSTANT;
         var _loc2_:int = 1;
         while(_loc2_ < 10)
         {
            param1 = param1 >> 1 ^ (param1 & 1) * 2567483615;
            _loc2_++;
         }
         return param1;
      }
      
      private function encode(param1:int) : int
      {
         param1 += §_-AvN§;
         var _loc2_:int = 0;
         while(_loc2_ < §_-AGZ§)
         {
            if((param1 & 1) != 0)
            {
               param1 = param1 >>> 1 ^ §_-AGH§;
            }
            else
            {
               param1 >>>= 1;
            }
            _loc2_++;
         }
         return param1;
      }
      
      private function §_-av§(param1:int) : int
      {
         var _loc2_:int = 0;
         while(_loc2_ < §_-AGZ§)
         {
            if((param1 & 2147483648) != 0)
            {
               param1 = param1 << 1 ^ §_-9TD§;
            }
            else
            {
               param1 <<= 1;
            }
            _loc2_++;
         }
         return param1 - §_-AvN§;
      }
   }
}

