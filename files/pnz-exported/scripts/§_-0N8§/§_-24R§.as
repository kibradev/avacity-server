package §_-0N8§
{
   import §_-0kB§.§_-9sg§;
   import flash.events.Event;
   
   public class §_-24R§ extends Event
   {
      public static const §_-68Y§:String = "systemMessageResponse";
      
      public static const §_-8Ub§:String = "moderatorMessageResponse";
      
      public static const §_-3RT§:String = "receivedSystemMessage";
      
      public static const §_-7AI§:String = "receivedModeratorMessage";
      
      private var _message:String;
      
      private var §_-3kx§:§_-9sg§;
      
      private var §_-eU§:Boolean;
      
      public function §_-24R§(param1:String, param2:String, param3:§_-9sg§ = null, param4:Boolean = true)
      {
         super(param1);
         this._message = param2;
         this.§_-3kx§ = param3;
         this.§_-eU§ = param4;
      }
      
      public function get message() : String
      {
         return this._message;
      }
      
      public function get moderator() : §_-9sg§
      {
         return this.§_-3kx§;
      }
      
      public function get success() : Boolean
      {
         return this.§_-eU§;
      }
   }
}

