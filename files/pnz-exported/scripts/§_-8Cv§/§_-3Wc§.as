package §_-8Cv§
{
   import flash.events.Event;
   
   public class §_-3Wc§ extends Event
   {
      public static const §_-9cv§:String = "newCampaign";
      
      public static const §_-AIq§:String = "removeCampaign";
      
      public static const §_-2Sq§:String = "initCampaign";
      
      private var §_-CMw§:Array = null;
      
      public function §_-3Wc§(param1:String, param2:Array = null)
      {
         super(param1,false,false);
         this.§_-CMw§ = param2;
      }
      
      public function get §_-CUa§() : Array
      {
         return this.§_-CMw§;
      }
   }
}

