package §_-2qd§
{
   import §_-BeZ§.§_-4Ww§;
   import ags.§_-5x-§;
   import flash.events.Event;
   
   public class §_-9tB§ extends Event
   {
      public static const §_-7Lr§:String = "login";
      
      public static const §_-0kn§:String = "loginError";
      
      private var §_-7hh§:int;
      
      private var _message:String;
      
      private var §_-1LX§:§_-4Ww§;
      
      public function §_-9tB§(param1:String, param2:int = 0, param3:String = "", param4:§_-4Ww§ = null)
      {
         super(param1);
         this.§_-7hh§ = param2;
         this._message = param3;
         this.§_-1LX§ = param4;
      }
      
      public function get errorCode() : int
      {
         return this.§_-7hh§;
      }
      
      public function get errorMessage() : String
      {
         return this._message;
      }
      
      public function get details() : §_-4Ww§
      {
         return this.§_-1LX§;
      }
      
      public function get client() : §_-5x-§
      {
         return target as §_-5x-§;
      }
      
      override public function clone() : Event
      {
         return new AGSConnectEvent(type,this.§_-7hh§,this._message,this.§_-1LX§);
      }
      
      override public function toString() : String
      {
         return formatToString("AGSConnectEvent","type","bubbles","cancelable","eventPhase","errorCode","errorMessage","details");
      }
   }
}

