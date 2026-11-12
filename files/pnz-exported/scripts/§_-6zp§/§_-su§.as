package §_-6zp§
{
   import §_-0X5§.§_-C55§;
   import §_-BeZ§.§_-1e5§;
   
   public class §_-su§ extends §_-4FH§
   {
      private var §_-0uO§:Array;
      
      private var §_-0UR§:String;
      
      public function §_-su§(param1:Array, param2:String)
      {
         super(§_-6zz§.§_-kJ§);
         this.§_-0uO§ = param1;
         this.§_-0UR§ = param2;
      }
      
      override public function writeArray(param1:§_-1e5§) : void
      {
         var _loc2_:§_-C55§ = null;
         param1.§_-5Uc§(this.§_-0UR§);
         for each(_loc2_ in this.§_-0uO§)
         {
            param1.§_-5Uc§(_loc2_.command);
            param1.§_-2CL§(_loc2_.data);
         }
      }
   }
}

