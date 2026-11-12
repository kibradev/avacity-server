package §_-9M2§
{
   import flash.events.Event;
   
   public class §_-3G5§ extends Event
   {
      public static const §_-9yr§:String = "serverStatusReceived";
      
      public static const §_-2oG§:String = "serverStatusUpdated";
      
      private var §_-61l§:int;
      
      private var §_-Cby§:String;
      
      public function §_-3G5§(param1:String, param2:int, param3:String)
      {
         super(param1,false,false);
         this.§_-61l§ = param2;
         this.§_-Cby§ = param3;
      }
      
      public function get §_-7e7§() : int
      {
         return this.§_-61l§;
      }
      
      public function get §_-Bnx§() : String
      {
         return this.§_-Cby§;
      }
   }
}

