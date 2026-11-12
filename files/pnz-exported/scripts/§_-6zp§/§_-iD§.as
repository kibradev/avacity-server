package §_-6zp§
{
   import §_-BeZ§.§_-1e5§;
   import §_-BeZ§.§_-4Ww§;
   
   public class §_-iD§ extends §_-4FH§
   {
      private const ID:int = 1;
      
      private var §_-2BH§:String;
      
      private var §_-6ro§:String;
      
      private var §_-6un§:String;
      
      private var _data:§_-4Ww§;
      
      public function §_-iD§(param1:String, param2:String, param3:String, param4:§_-4Ww§)
      {
         super(this.ID);
         this.§_-2BH§ = param1;
         this.§_-6ro§ = param2;
         this.§_-6un§ = param3;
         this._data = param4;
      }
      
      override public function writeArray(param1:§_-1e5§) : void
      {
         param1.§_-5Uc§(this.§_-2BH§);
         param1.§_-5Uc§(this.§_-6ro§);
         param1.§_-5Uc§(this.§_-6un§);
         param1.§_-2CL§(this._data);
      }
   }
}

