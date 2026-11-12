package §_-sv§
{
   import flash.events.Event;
   
   public class §_-2gJ§ extends Event
   {
      public static const §_-A8d§:String = "nextStep";
      
      public static const FINISH_TUTORIAL:String = "finishTutorial";
      
      public static const §_-4XV§:String = "st";
      
      private var §_-8dC§:Object = null;
      
      public function §_-2gJ§(param1:String, param2:Object = null)
      {
         super(param1,false,false);
         this.§_-8dC§ = param2;
      }
      
      public function get step() : String
      {
         return this.§_-8dC§ != null && Boolean(this.§_-8dC§.hasOwnProperty(§_-4XV§)) ? this.§_-8dC§[§_-4XV§] : null;
      }
   }
}

