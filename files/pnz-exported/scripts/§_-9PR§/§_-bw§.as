package §_-9PR§
{
   import flash.events.Event;
   
   public class §_-bw§ extends Event
   {
      public static const §_-1MQ§:String = "stepCompleted";
      
      public static const §_-Am1§:String = "removeOffer";
      
      private var §_-5fm§:String = null;
      
      private var §_-4WC§:int = 0;
      
      public function §_-bw§(param1:String, param2:String = null, param3:int = 0)
      {
         super(param1,false,false);
         this.§_-5fm§ = param2;
         this.§_-4WC§ = param3;
      }
      
      public function get offerId() : String
      {
         return this.§_-5fm§;
      }
      
      public function get §_-0PN§() : int
      {
         return this.§_-4WC§;
      }
   }
}

