package §_-6BB§
{
   import flash.events.Event;
   
   public class §_-1KD§ extends Event
   {
      public static const §_-79y§:String = "apiNotReady";
      
      public static const §_-7PF§:String = "notEnoughPermissions";
      
      public static const NETWORK_ERROR:String = "networkError";
      
      public static const §_-7qk§:String = "dataError";
      
      public static const §_-9cu§:String = "userError";
      
      public var code:int;
      
      public var message:String;
      
      public function §_-1KD§(param1:String, param2:int = -1, param3:String = "")
      {
         super(param1);
         this.code = param2;
         this.message = param3;
      }
   }
}

