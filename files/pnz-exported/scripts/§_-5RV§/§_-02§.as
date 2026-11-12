package §_-5RV§
{
   import §_-2qd§.§_-6Qj§;
   import §_-AZ4§.§_-Any§;
   import §_-BeZ§.§_-1e5§;
   import §_-BeZ§.§_-4Ww§;
   import ags.§_-5x-§;
   
   public class §_-02§ extends §_-9mD§
   {
      public static const ID:int = §_-8pr§.§_-84d§;
      
      private var §_-BF1§:int;
      
      private var _data:§_-4Ww§;
      
      public function §_-02§()
      {
         super(ID);
      }
      
      override public function execute(param1:§_-5x-§) : void
      {
         param1.§_-2cw§ = true;
         param1.§_-5fL§ = §_-Any§.§_-1M2§;
         param1.dispatchEvent(new §_-6Qj§(§_-6Qj§.§_-84d§,this.§_-BF1§,this._data));
      }
      
      override public function readArray(param1:§_-1e5§) : void
      {
         this.§_-BF1§ = param1.getInt(0);
         this._data = param1.§_-ANw§(1);
      }
   }
}

