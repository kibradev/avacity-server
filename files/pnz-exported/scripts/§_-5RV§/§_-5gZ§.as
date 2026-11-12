package §_-5RV§
{
   import §_-2qd§.§_-676§;
   import §_-BeZ§.§_-1e5§;
   import ags.§_-5x-§;
   
   public class §_-5gZ§ extends §_-9mD§
   {
      public static const ID:int = §_-8pr§.§_-6br§;
      
      private var §_-7hh§:int;
      
      private var _message:String;
      
      public function §_-5gZ§()
      {
         super(§_-8pr§.§_-6br§);
      }
      
      override public function execute(param1:§_-5x-§) : void
      {
         param1.dispatchEvent(new §_-676§(this.§_-7hh§,this._message));
      }
      
      override public function readArray(param1:§_-1e5§) : void
      {
         §_-aS§(param1,2);
         this.§_-7hh§ = param1.getInt(0);
         this._message = param1.getString(1);
      }
   }
}

