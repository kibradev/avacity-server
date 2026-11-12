package §_-2qd§
{
   import §_-BeZ§.§_-4Ww§;
   import flash.events.Event;
   
   public class §_-6Qj§ extends Event
   {
      public static const §_-Bnp§:String = "disconnect";
      
      public static const §_-84d§:String = "logout";
      
      private var §_-BF1§:int;
      
      private var §_-1LX§:§_-4Ww§;
      
      public function §_-6Qj§(param1:String, param2:int, param3:§_-4Ww§ = null)
      {
         super(param1,false,false);
         this.§_-BF1§ = param2;
         this.§_-1LX§ = param3;
      }
      
      public function get reason() : int
      {
         return this.§_-BF1§;
      }
      
      public function get details() : §_-4Ww§
      {
         return this.§_-1LX§ != null ? this.§_-1LX§ : new §_-4Ww§();
      }
      
      override public function clone() : Event
      {
         return new §_-6Qj§(type,this.§_-BF1§,this.§_-1LX§);
      }
   }
}

