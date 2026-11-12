package §_-bm§
{
   import §_-03E§.§_-4WA§;
   import flash.events.Event;
   
   public class §_-4aT§ extends Event
   {
      public static const §_-3JK§:String = "eventListUpdated";
      
      public static const §_-2ZN§:String = "eventInfoReceived";
      
      public static const §_-ZE§:String = "eventCreated";
      
      public static const §_-1b§:String = "selfEventChanged";
      
      public static const §_-BRA§:String = "eventSelected";
      
      public static const §_-7dS§:String = "eventComplain";
      
      public static const §_-7oK§:String = "eventClosed";
      
      public static const §_-Agh§:String = "eventUpdate";
      
      public static const §_-Xd§:String = "eventFilterChanged";
      
      private var §_-B5S§:* = null;
      
      private var §_-8Fk§:* = null;
      
      public function §_-4aT§(param1:String, param2:* = null, param3:* = null)
      {
         super(param1,false,false);
         this.§_-B5S§ = param2;
         this.§_-8Fk§ = param3;
      }
      
      public function get event() : §_-4WA§
      {
         return this.§_-B5S§ as §_-4WA§;
      }
      
      public function get §_-AKQ§() : Array
      {
         return this.§_-B5S§ as Array;
      }
      
      public function get tag() : *
      {
         return this.§_-8Fk§;
      }
      
      override public function clone() : Event
      {
         return new §_-4aT§(type,this.§_-B5S§,this.§_-8Fk§);
      }
   }
}

