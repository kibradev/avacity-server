package §_-CVq§
{
   import flash.events.Event;
   
   public class §_-40d§ extends Event
   {
      public static const FINISH_STEP:String = "FINISH_STEP";
      
      public static const START_STEP:String = "START_STEP";
      
      public static const FINISH_TUTORIAL:String = "FINISH_TUTORIAL";
      
      public static const NEXT_ACTION:String = "NEXT_ACTION";
      
      private var §_-1rl§:String = null;
      
      public function §_-40d§(param1:String, param2:String = null)
      {
         super(param1,false,false);
         this.§_-1rl§ = param2;
      }
      
      public function get step() : String
      {
         return this.§_-1rl§;
      }
   }
}

