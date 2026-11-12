package §_-5RV§
{
   import §_-2qd§.AGSConnectEvent;
   import §_-AZ4§.§_-Any§;
   import §_-BeZ§.§_-1e5§;
   import §_-BeZ§.§_-4Ww§;
   import ags.§_-5x-§;
   
   public class §_-5Jp§ extends §_-9mD§
   {
      public static const ID:int = §_-8pr§.§_-0kn§;
      
      private var §_-7hh§:int;
      
      private var _message:String;
      
      private var §_-1LX§:§_-4Ww§;
      
      public function §_-5Jp§()
      {
         super(ID);
      }
      
      override public function execute(param1:§_-5x-§) : void
      {
         param1.state = §_-Any§.§_-AC3§;
         param1.dispatchEvent(new AGSConnectEvent(AGSConnectEvent.§_-3-i§,this.§_-7hh§,this._message,this.§_-1LX§));
      }
      
      override public function readArray(param1:§_-1e5§) : void
      {
         this.§_-7hh§ = param1.getInt(0);
         this._message = param1.getString(1);
         this.§_-1LX§ = param1.§_-ANw§(2);
      }
   }
}

