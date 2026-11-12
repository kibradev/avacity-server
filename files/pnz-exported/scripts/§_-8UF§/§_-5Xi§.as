package §_-8UF§
{
   import §_-7s3§.§_-CTZ§;
   import flash.events.Event;
   
   public class §_-5Xi§ extends Event
   {
      public static const §_-AmJ§:String = "newMessage";
      
      public static const §_-6dZ§:String = "newSmile";
      
      public static const §_-80w§:String = "newSticker";
      
      public static const §_-BM-§:String = "typing";
      
      public static const §_-3kf§:String = "stopTyping";
      
      public static const §_-wG§:String = "diceObjectMessage";
      
      private var §_-2K§:§_-CTZ§ = null;
      
      public function §_-5Xi§(param1:String, param2:§_-CTZ§ = null)
      {
         super(param1,false,false);
         this.§_-2K§ = param2;
      }
      
      public function get chatMessage() : §_-CTZ§
      {
         return this.§_-2K§;
      }
   }
}

