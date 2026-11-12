package §_-2C6§
{
   import §_-4H3§.§_-AKj§;
   import §_-5iz§.§_-2ss§;
   import §_-5iz§.§_-5UT§;
   import §_-5iz§.§_-9bw§;
   import §_-5iz§.§_-B47§;
   import §_-AZ4§.§_-3wo§;
   import flash.utils.ByteArray;
   import flash.utils.Endian;
   
   public class §_-75q§ implements §_-3wo§
   {
      private var §_-5O4§:§_-9bw§;
      
      private var §_-Z§:§_-2ss§;
      
      public function §_-75q§(param1:ByteArray)
      {
         super();
         this.§_-Z§ = new §_-5UT§();
         this.§_-5O4§ = §_-AKj§.§_-A-z§(this.§_-2Af§,param1,this.§_-Z§);
         this.§_-Z§.§_-7Hw§(this.§_-5O4§.§_-CW§());
      }
      
      public function §_-0Fp§(param1:ByteArray) : ByteArray
      {
         var _loc5_:int = 0;
         var _loc2_:ByteArray = this.§_-8lh§();
         (this.§_-5O4§ as §_-B47§).§_-BbL§ = _loc2_;
         var _loc3_:int = 0;
         while((param1.length + _loc3_) % 16 != 0)
         {
            _loc3_++;
         }
         if(_loc3_ > 0)
         {
            param1.position = param1.length;
            _loc5_ = 0;
            while(_loc5_ < _loc3_)
            {
               param1.writeByte(0);
               _loc5_++;
            }
         }
         this.§_-5O4§.encrypt(param1);
         var _loc4_:ByteArray = new ByteArray();
         _loc2_.position = 0;
         param1.position = 0;
         _loc4_.writeBytes(_loc2_);
         _loc4_.writeByte(_loc3_);
         _loc4_.writeBytes(param1);
         return _loc4_;
      }
      
      public function §_-2-d§(param1:ByteArray) : ByteArray
      {
         var _loc2_:ByteArray = new ByteArray();
         param1.position = 0;
         param1.readBytes(_loc2_,0,16);
         (this.§_-5O4§ as §_-B47§).§_-BbL§ = _loc2_;
         var _loc3_:int = param1.readByte();
         var _loc4_:ByteArray = new ByteArray();
         param1.readBytes(_loc4_);
         this.§_-5O4§.decrypt(_loc4_);
         _loc4_.length -= _loc3_;
         return _loc4_;
      }
      
      private function §_-8lh§() : ByteArray
      {
         var _loc1_:ByteArray = new ByteArray();
         var _loc2_:int = 0;
         while(_loc2_ < 16)
         {
            _loc1_.writeByte(Math.floor(Math.random() * 255));
            _loc2_++;
         }
         return _loc1_;
      }
      
      private function get §_-2Af§() : String
      {
         var _loc3_:int = 0;
         var _loc4_:String = null;
         var _loc1_:Array = [762537313,758527282,6513251];
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.endian = Endian.LITTLE_ENDIAN;
         for each(_loc3_ in _loc1_)
         {
            _loc2_.writeInt(_loc3_);
         }
         return _loc2_.toString();
      }
   }
}

